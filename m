Content-Type: multipart/mixed; boundary="===============5950150588492942327=="
MIME-Version: 1.0
From: Frederic Weisbecker <fweisbec@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sched/preempt] BUG: KASan: out of bounds access in trace_graph_entry at addr ffff88000d717e48
Date: Tue, 16 Jun 2015 15:20:46 +0200
Message-ID: <20150616132046.GB11126@lerouge>
In-Reply-To: <20150615005704.GA1657@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5950150588492942327==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2015 at 08:57:04AM +0800, Fengguang Wu wrote:
> Hi Frederic,
> =

> On Sun, Jun 14, 2015 at 02:33:32PM +0200, Frederic Weisbecker wrote:
> > On Sun, Jun 14, 2015 at 04:55:59PM +0800, Fengguang Wu wrote:
> > > Hi Frederic,
> > > =

> > > FYI, there are a number more bug messages showing up after this commit
> > > =

> > > git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git mas=
ter
> > > =

> > > commit b30f0e3ffedfa52b1d67a302ae5860c49998e5e2
> > > Author:     Frederic Weisbecker <fweisbec@gmail.com>
> > > AuthorDate: Tue May 12 16:41:49 2015 +0200
> > > Commit:     Ingo Molnar <mingo@kernel.org>
> > > CommitDate: Tue May 19 08:39:12 2015 +0200
> > > =

> > >     sched/preempt: Optimize preemption operations on __schedule() cal=
lers
> > >     =

> > >     __schedule() disables preemption and some of its callers
> > >     (the preempt_schedule*() family) also set PREEMPT_ACTIVE.
> > >     =

> > >     So we have two preempt_count() modifications that could be perfor=
med
> > >     at once.
> > >     =

> > >     Lets remove the preemption disablement from __schedule() and pull
> > >     this responsibility to its callers in order to optimize preempt_c=
ount()
> > >     operations in a single place.
> > >     =

> > >     Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> > >     Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
> > >     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > >     Cc: Peter Zijlstra <peterz@infradead.org>
> > >     Cc: Thomas Gleixner <tglx@linutronix.de>
> > >     Link: http://lkml.kernel.org/r/1431441711-29753-5-git-send-email-=
fweisbec(a)gmail.com
> > >     Signed-off-by: Ingo Molnar <mingo@kernel.org>
> > =

> > Do you still see that issue after latest tip:/sched/core. I fixed it a =
few days ago with:
> > =

> > 9a92e3dc6ad02208a014d0d8404ebbd697e3d5ef (preempt: Reorganize the notra=
ce definitions a bit)
> > 4eaca0a887eaee04fc7a3866d0f5b51b34030dfa (preempt: Use preempt_schedule=
_context() as the official tracing preemption point)
> > be690035df893385ceaac2323b29be1fb7f2a67f (sched: Make preempt_schedule_=
context() function-tracing safe)
> > =

> > But maybe there are other issues remaining.
> =

> The tip sched/core HEAD looks perfect now -- 1000 boots are all fine
> except for 2 OOM errors, which look like noises.

Oh great! Thanks a lot!

--===============5950150588492942327==--

