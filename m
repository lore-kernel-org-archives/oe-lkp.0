Content-Type: multipart/mixed; boundary="===============3053646188094871997=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/preempt] BUG: kernel boot crashed
Date: Thu, 04 Jun 2015 11:40:43 +0200
Message-ID: <20150604094043.GF3644@twins.programming.kicks-ass.net>
In-Reply-To: <20150604045536.GB30151@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3053646188094871997==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 04, 2015 at 12:55:36PM +0800, Fengguang Wu wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

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
>     =

>     Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
>     Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
>     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>     Cc: Peter Zijlstra <peterz@infradead.org>
>     Cc: Thomas Gleixner <tglx@linutronix.de>
>     Link: http://lkml.kernel.org/r/1431441711-29753-5-git-send-email-fwei=
sbec(a)gmail.com
>     Signed-off-by: Ingo Molnar <mingo@kernel.org>

Frederic said that he was working on the issue and we should expect
patches shortly.

--===============3053646188094871997==--

