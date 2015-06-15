Content-Type: multipart/mixed; boundary="===============3986507409592664550=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/preempt] BUG: KASan: out of bounds access in trace_graph_entry at addr ffff88000d717e48
Date: Mon, 15 Jun 2015 08:57:04 +0800
Message-ID: <20150615005704.GA1657@wfg-t540p.sh.intel.com>
In-Reply-To: <20150614123331.GA14645@lerouge>
List-Id: <oe-lkp.lists.linux.dev>

--===============3986507409592664550==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Frederic,

On Sun, Jun 14, 2015 at 02:33:32PM +0200, Frederic Weisbecker wrote:
> On Sun, Jun 14, 2015 at 04:55:59PM +0800, Fengguang Wu wrote:
> > Hi Frederic,
> > =

> > FYI, there are a number more bug messages showing up after this commit
> > =

> > git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > =

> > commit b30f0e3ffedfa52b1d67a302ae5860c49998e5e2
> > Author:     Frederic Weisbecker <fweisbec@gmail.com>
> > AuthorDate: Tue May 12 16:41:49 2015 +0200
> > Commit:     Ingo Molnar <mingo@kernel.org>
> > CommitDate: Tue May 19 08:39:12 2015 +0200
> > =

> >     sched/preempt: Optimize preemption operations on __schedule() calle=
rs
> >     =

> >     __schedule() disables preemption and some of its callers
> >     (the preempt_schedule*() family) also set PREEMPT_ACTIVE.
> >     =

> >     So we have two preempt_count() modifications that could be performed
> >     at once.
> >     =

> >     Lets remove the preemption disablement from __schedule() and pull
> >     this responsibility to its callers in order to optimize preempt_cou=
nt()
> >     operations in a single place.
> >     =

> >     Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> >     Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
> >     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> >     Cc: Peter Zijlstra <peterz@infradead.org>
> >     Cc: Thomas Gleixner <tglx@linutronix.de>
> >     Link: http://lkml.kernel.org/r/1431441711-29753-5-git-send-email-fw=
eisbec(a)gmail.com
> >     Signed-off-by: Ingo Molnar <mingo@kernel.org>
> =

> Do you still see that issue after latest tip:/sched/core. I fixed it a fe=
w days ago with:
> =

> 9a92e3dc6ad02208a014d0d8404ebbd697e3d5ef (preempt: Reorganize the notrace=
 definitions a bit)
> 4eaca0a887eaee04fc7a3866d0f5b51b34030dfa (preempt: Use preempt_schedule_c=
ontext() as the official tracing preemption point)
> be690035df893385ceaac2323b29be1fb7f2a67f (sched: Make preempt_schedule_co=
ntext() function-tracing safe)
> =

> But maybe there are other issues remaining.

The tip sched/core HEAD looks perfect now -- 1000 boots are all fine
except for 2 OOM errors, which look like noises.

Thanks,
Fengguang

--===============3986507409592664550==--

