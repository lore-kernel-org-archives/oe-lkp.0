Content-Type: multipart/mixed; boundary="===============0113170580064402495=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [trace events] WARNING: CPU: 0 PID: 91 at kernel/sched/core.c:7253 __might_sleep()
Date: Wed, 08 Oct 2014 17:48:38 +0200
Message-ID: <20141008154838.GM10832@worktop.programming.kicks-ass.net>
In-Reply-To: <20141008110825.58bdb51d@gandalf.local.home>
List-Id: <oe-lkp.lists.linux.dev>

--===============0113170580064402495==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2014 at 11:08:25AM -0400, Steven Rostedt wrote:
> > Steve, wth is that thing supposed to do?
> > =

> > 	set_current_state(TASK_INTERRUPTIBLE);
> > 	while (!kthread_should_stop())
> > 		schedule();
> > =

> > That looks broken alright. It'll revert to a yield() 'spin' loop if it
> > ever gets a wakeup for anything other than the kthread_stop().
> > =

> > Did you mean to write something like:
> > =

> > 	set_current_state(TASK_INTERRUPTIBLE);
> > 	while (!kthread_should_stop()) {
> > 		schedule();
> > 		set_current_state(TASK_INTERRUPTIBLE);
> > 	}
> > 	__set_current_state(TASK_RUNNING);
> > =

> > ?
> =

> Wow, what a blast from the past. That code hasn't been touched since
> 2009!
> =

> Anyway, all that thread did was call test work on each cpu, and then
> waits to be killed. It should only get a single wake up and that should
> be from the kthread_stop() call. IOW, that loop should never be
> executed more than once.
> =

> What exactly is the bug here?

The bug is as explained, the loop is wrong and will revert to a yield
'spin' loop after a single wakeup.

The debugging that caught it is that you exit the loop without setting
TASK_RUNNING.

--===============0113170580064402495==--

