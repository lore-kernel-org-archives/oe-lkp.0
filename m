Content-Type: multipart/mixed; boundary="===============6337036356741751940=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/preempt] kernel BUG at kernel/sched/core.c:2684!
Date: Mon, 01 Jun 2015 10:33:46 +0200
Message-ID: <1433147626.11346.17.camel@twins>
In-Reply-To: <20150601081346.GA27656@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6337036356741751940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2015-06-01 at 16:13 +0800, Fengguang Wu wrote:

> commit b30f0e3ffedfa52b1d67a302ae5860c49998e5e2
> Author:     Frederic Weisbecker <fweisbec@gmail.com>
> AuthorDate: Tue May 12 16:41:49 2015 +0200
> Commit:     Ingo Molnar <mingo@kernel.org>
> CommitDate: Tue May 19 08:39:12 2015 +0200
> =

>     sched/preempt: Optimize preemption operations on __schedule() callers
>     =

>     __schedule() disables preemption and some of its callers
>     (the preempt_schedule*() family) also set PREEMPT_ACTIVE.
>     =

>     So we have two preempt_count() modifications that could be performed
>     at once.
>     =

>     Lets remove the preemption disablement from __schedule() and pull
>     this responsibility to its callers in order to optimize preempt_count=
()
>     operations in a single place.


> [    0.191912] Testing tracer irqsoff: PASSED
> [    0.193479] Testing tracer function_graph: =

> [    0.198156] ------------[ cut here ]------------
> [    0.199000] kernel BUG at kernel/sched/core.c:2684!

        BUG_ON(unlikely(task_stack_end_corrupted(prev)));

Fun!

This'll be the second thing I'll look at today, right after looking at
that crash Mike reported.

--===============6337036356741751940==--

