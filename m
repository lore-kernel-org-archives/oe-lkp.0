Content-Type: multipart/mixed; boundary="===============3326195491263465657=="
MIME-Version: 1.0
From: Waiman Long <llong@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm/gup] 57efa1fe59: will-it-scale.per_thread_ops -9.2% regression
Date: Sun, 06 Jun 2021 18:13:59 -0400
Message-ID: <d0506f70-81a3-80b6-e47a-8986b3d62733@redhat.com>
In-Reply-To: <CAHk-=whoqV=cX5VC80mmR9rr+Z+yQ6fiQZm36Fb-izsanHg23w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3326195491263465657==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6/6/21 3:20 PM, Linus Torvalds wrote:
> [ Adding Waiman Long to the participants, because this seems to be a
> very specific cacheline alignment behavior of rwsems, maybe Waiman has
> some comments ]
>
> On Sun, Jun 6, 2021 at 3:16 AM Feng Tang <feng.tang@intel.com> wrote:
>> * perf-c2c: The hotspots(HITM) for 2 kernels are different due to the
>>    data structure change
>>
>>    - old kernel
>>
>>      - first cacheline
>>          mmap_lock->count (75%)
>>          mm->mapcount (14%)
>>
>>      - second cacheline
>>          mmap_lock->owner (97%)
>>
>>    - new kernel
>>
>>      mainly in the cacheline of 'mmap_lock'
>>
>>      mmap_lock->count (~2%)
>>      mmap_lock->owner (95%)
> Oooh.
>
> It looks like pretty much all the contention is on mmap_lock, and the
> difference is that the old kernel just _happened_ to split the
> mmap_lock rwsem at *exactly* the right place.
>
> The rw_semaphore structure looks like this:
>
>          struct rw_semaphore {
>                  atomic_long_t count;
>                  atomic_long_t owner;
>                  struct optimistic_spin_queue osq; /* spinner MCS lock */
>                  ...
>
> and before the addition of the 'write_protect_seq' field, the mmap_sem
> was at offset 120 in 'struct mm_struct'.
>
> Which meant that count and owner were in two different cachelines, and
> then when you have contention and spend time in
> rwsem_down_write_slowpath(), this is probably *exactly* the kind of
> layout you want.
>
> Because first the rwsem_write_trylock() will do a cmpxchg on the first
> cacheline (for the optimistic fast-path), and then in the case of
> contention, rwsem_down_write_slowpath() will just access the second
> cacheline.
>
> Which is probably just optimal for a load that spends a lot of time
> contended - new waiters touch that first cacheline, and then they
> queue themselves up on the second cacheline. Waiman, does that sound
> believable?

Yes, I think so.

The count field is accessed when a task tries to acquire the rwsem or =

when a owner releases the lock. If the trylock fails, the writer will go =

into the slowpath doing optimistic spinning on the owner field. As a =

result, a lot of reads to owner are issued relative to the read/write of =

count. Normally, there should only be one spinner that has the OSQ lock =

spinning on owner and the 9% performance degradation seems a bit high to =

me. In the rare case that the head waiter in the wait queue sets the =

handoff flag, the waiter may also spin on owner causing a bit more =

contention on the owner cacheline. I will do further investigation on =

this possibility when I have time.

Cheers,
Longman

--===============3326195491263465657==--

