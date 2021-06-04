Content-Type: multipart/mixed; boundary="===============5747694284487743941=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm/gup] 57efa1fe59: will-it-scale.per_thread_ops -9.2% regression
Date: Fri, 04 Jun 2021 10:57:44 -0700
Message-ID: <CAHk-=wg=LX1WKioiA_Cn-5hp6Hce_kTZg23uksSjNWgV_Ofj1Q@mail.gmail.com>
In-Reply-To: <20210604075220.GA40621@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5747694284487743941==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 4, 2021 at 12:52 AM Feng Tang <feng.tang@intel.com> wrote:
>
> On Fri, Jun 04, 2021 at 03:04:11PM +0800, Feng Tang wrote:
> > >
> > > The perf data doesn't even mention any of the GUP paths, and on the
> > > pure fork path the biggest impact would be:
> > >
> > >  (a) maybe "struct mm_struct" changed in size or had a different cach=
e layout
> >
> > Yes, this seems to be the cause of the regression.
> >
> > The test case is many thread are doing map/unmap at the same time,
> > so the process's rw_semaphore 'mmap_lock' is highly contended.
> >
> > Before the patch (with 0day's kconfig), the mmap_lock is separated
> > into 2 cachelines, the 'count' is in one line, and the other members
> > sit in the next line, so it luckily avoid some cache bouncing. After
> > the patch, the 'mmap_lock' is pushed into one cacheline, which may
> > cause the regression.

Ok, thanks for following up on this.

> We've tried some patch, which can restore the regerssion. As the
> newly added member 'write_protect_seq' is 4 bytes long, and putting
> it into an existing 4 bytes long hole can restore the regeression,
> while not affecting most of other member's alignment. Please review
> the following patch, thanks!

The patch looks fine to me.

At the same time, I do wonder if maybe it would be worth exploring if
it's a good idea to perhaps move the 'mmap_sem' thing instead.

Or at least add a big comment. It's not clear to me exactly _which_
other fields are the ones that are so hot that the contention on
mmap_sem then causes even more cacheline bouncing.

For example, is it either

 (a) we *want* the mmap_sem to be in the first 128-byte region,
because then when we get the mmap_sem, the other fields in that same
cacheline are hot

OR

 (b) we do *not* want mmap_sem to be in the *second* 128-byte region,
because there is something *else* in that region that is touched
independently of mmap_sem that is very very hot and now you get even
more bouncing?

but I can't tell which one it is.

It would be great to have a comment in the code - and in the commit
message - about exactly which fields are the criticial ones. Because I
doubt it is 'write_protect_seq' itself that matters at all.

If it's "mmap_sem should be close to other commonly used fields",
maybe we should just move mmap_sem upwards in the structure?

              Linus
--===============5747694284487743941==--

