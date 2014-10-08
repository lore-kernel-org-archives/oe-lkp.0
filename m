Content-Type: multipart/mixed; boundary="===============2628116692147351864=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [trace events] WARNING: CPU: 0 PID: 91 at kernel/sched/core.c:7253 __might_sleep()
Date: Wed, 08 Oct 2014 18:36:57 +0200
Message-ID: <20141008163657.GN10832@worktop.programming.kicks-ass.net>
In-Reply-To: <20141008121718.0210c24e@gandalf.local.home>
List-Id: <oe-lkp.lists.linux.dev>

--===============2628116692147351864==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2014 at 12:17:18PM -0400, Steven Rostedt wrote:
> On Wed, 8 Oct 2014 17:48:38 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:
> =

>  =

> > > Wow, what a blast from the past. That code hasn't been touched since
> > > 2009!
> > > =

> > > Anyway, all that thread did was call test work on each cpu, and then
> > > waits to be killed. It should only get a single wake up and that shou=
ld
> > > be from the kthread_stop() call. IOW, that loop should never be
> > > executed more than once.
> > > =

> > > What exactly is the bug here?
> > =

> > The bug is as explained, the loop is wrong and will revert to a yield
> > 'spin' loop after a single wakeup.
> > =

> > The debugging that caught it is that you exit the loop without setting
> > TASK_RUNNING.
> =

> I understand that it becomes a yield if something sends a wakeup before
> killing it. I highly doubt that would ever happen since it doesn't call
> anything that should wake it up and it only runs at boot up.

Still we should always assume spurious wakeups, its fragile not to and
has so far made life sad a few times.

> Looking at the original email that has the trace, I'm betting it hit
> the race where kthread_stop() was called on the thread before it set
> its state to TASK_INTERRUPTIBLE and then the first call to
> kthread_should_stop() returned true and schedule() was never called and
> the task exited with the TASK_INTERRUPTIBLE state.

Sure.

> Really no harm here. If we had called set_task_state(TASK_RUNNING)
> before exiting this never would have been seen.
> =

> Anyway, as for a fix, if you want to do it fully with setting
> TASK_INTERRUPTBILE again in the loop, I'm fine with it. I still don't
> see any possible way it can be woken up before kthread_should_stop()
> being true, but hey, lets make it more robust. Then if we ever
> extend on the tests that are run, which could add a delayed wake up, it
> would not turn into a yield.

Right, I'll send the patch. While looking I found another issue,
trace_selftest.c:trace_wakeup_test_thread() has a schedule() without a
loop around. We should really not do that.

--===============2628116692147351864==--

