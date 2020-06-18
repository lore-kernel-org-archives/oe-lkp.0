Content-Type: multipart/mixed; boundary="===============8434195965894551733=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [pipe] 566d136289: stress-ng.tee.ops_per_sec -84.7% regression
Date: Thu, 18 Jun 2020 10:31:40 -0700
Message-ID: <CAHk-=wgpdB+4nBqjxvyeJ2OdZ1tTMADC=BDJW3Q9RK_swhN_qA@mail.gmail.com>
In-Reply-To: <0cc7fed8-faaf-459a-8b78-a9f66b556c1d@i-love.sakura.ne.jp>
List-Id: <oe-lkp.lists.linux.dev>

--===============8434195965894551733==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 10:18 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> This would be because the test case shows higher performance if the pipe =
writer does busy wait.
> This commit fixed an unkillable busy wait bug when the pipe reader does n=
ot try to read.
>
> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <rong.a.chen@intel.com>
>
> We can't fix the issue. ;-)

Well, it does highlight that there are potential loads that would
prefer spinning to wait for data rather than returning early.

Put another way: right now we are very eager to return -EAGAIN for
nonblocking pipe writers, and sleeping for blocking ones. I didn't
check which of those cases that stress-ng.tee.ops_per_sec thing is
testing.

But the improvement in the numbers implies that it might be worth it
to have optimistic logic for "spin for a bit waiting for a concurrent
reader". Kind of like the old logic we used to have to try to avoid
extra system calls on the reader side (where we'd give an existing
writer the chance to fill the buffer instead of returning early).

The old reader-side optimization was somewhat painful, and didn't
really help much on SMP anyway. But particularly for the "we just
dropped the locks, and we're going to wait" case, maybe it's worth
looking at whether dropping the locks now woke somebody else up on
another CPU, and we might spin for a short while synchronously...

IOW, conceptually all the same optimistic spinning stuff that we do
for semaphores..

It would likely be a somewhat involved thing, though. We'd have to
make wakeup_pipe_readers/writers() return a "did I wake up somebody
else on another CPU" return value for hinting whether it might be
worth it, and we'd have to then add the logic to see if it's worth
spinning for a while waiting for them to fill the input queue (or
empty the output one) and then continue the splice() op.

That 84% change sounds like it *might* be worth doing some extra work
for. splice() itself might not be so interesting, but the exact same
logic is presumably worth something for a pipe read/write pair...

Anybody interested in trying?

               Linus
--===============8434195965894551733==--

