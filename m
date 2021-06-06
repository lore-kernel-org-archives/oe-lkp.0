Content-Type: multipart/mixed; boundary="===============4383749229509110301=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm/gup] 57efa1fe59: will-it-scale.per_thread_ops -9.2% regression
Date: Sun, 06 Jun 2021 12:20:46 -0700
Message-ID: <CAHk-=whoqV=cX5VC80mmR9rr+Z+yQ6fiQZm36Fb-izsanHg23w@mail.gmail.com>
In-Reply-To: <20210606101623.GA48020@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4383749229509110301==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[ Adding Waiman Long to the participants, because this seems to be a
very specific cacheline alignment behavior of rwsems, maybe Waiman has
some comments ]

On Sun, Jun 6, 2021 at 3:16 AM Feng Tang <feng.tang@intel.com> wrote:
>
> * perf-c2c: The hotspots(HITM) for 2 kernels are different due to the
>   data structure change
>
>   - old kernel
>
>     - first cacheline
>         mmap_lock->count (75%)
>         mm->mapcount (14%)
>
>     - second cacheline
>         mmap_lock->owner (97%)
>
>   - new kernel
>
>     mainly in the cacheline of 'mmap_lock'
>
>     mmap_lock->count (~2%)
>     mmap_lock->owner (95%)

Oooh.

It looks like pretty much all the contention is on mmap_lock, and the
difference is that the old kernel just _happened_ to split the
mmap_lock rwsem at *exactly* the right place.

The rw_semaphore structure looks like this:

        struct rw_semaphore {
                atomic_long_t count;
                atomic_long_t owner;
                struct optimistic_spin_queue osq; /* spinner MCS lock */
                ...

and before the addition of the 'write_protect_seq' field, the mmap_sem
was at offset 120 in 'struct mm_struct'.

Which meant that count and owner were in two different cachelines, and
then when you have contention and spend time in
rwsem_down_write_slowpath(), this is probably *exactly* the kind of
layout you want.

Because first the rwsem_write_trylock() will do a cmpxchg on the first
cacheline (for the optimistic fast-path), and then in the case of
contention, rwsem_down_write_slowpath() will just access the second
cacheline.

Which is probably just optimal for a load that spends a lot of time
contended - new waiters touch that first cacheline, and then they
queue themselves up on the second cacheline. Waiman, does that sound
believable?

Anyway, I'm certainly ok with the patch that just moves
'write_protect_seq' down, it might be worth commenting about how this
is about some very special cache layout of the mmap_sem part of the
structure.

That said, this means that it all is very subtle dependent on a lot of
kernel config options, and I'm not sure how relevant the exact kernel
options are that the test robot has been using. But even if this is
just a "kernel test robot reports", I think it's an interesting case
and worth a comment for when this happens next time...

                Linus
--===============4383749229509110301==--

