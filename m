Content-Type: multipart/mixed; boundary="===============0688807263543070434=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [trace events] WARNING: CPU: 0 PID: 91 at kernel/sched/core.c:7253 __might_sleep()
Date: Wed, 08 Oct 2014 11:08:25 -0400
Message-ID: <20141008110825.58bdb51d@gandalf.local.home>
In-Reply-To: <20141008104120.GH10832@worktop.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============0688807263543070434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Oct 2014 12:41:20 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> On Wed, Oct 08, 2014 at 06:06:13PM +0800, Fengguang Wu wrote:
> > [    8.867644] WARNING: CPU: 0 PID: 91 at kernel/sched/core.c:7253 __mi=
ght_sleep+0x9a/0x378()
> > [    8.869031] do not call blocking ops when !TASK_RUNNING; state=3D1 s=
et at [<ffffffff8d79b511>] event_test_thread+0x48/0x93

I'm curious, what blocking ops was called?

> > [    8.870533] Modules linked in:
> > [    8.870979] CPU: 0 PID: 91 Comm: test-events Not tainted 3.17.0-rc7-=
00109-g2f85d18 #37
> > [    8.872061] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS 1.7.5-20140531_083030-gandalf 04/01/2014
> > [    8.873428]  0000000000000000 ffff880010ec3c80 ffffffff8c696943 ffff=
880010ec3cb8
> > [    8.874503]  ffffffff8be7cae5 ffffffff8bead236 0000000000000001 ffff=
88001161fa01
> > [    8.888390]  0000000000000001 0000000000000000 ffff880010ec3d20 ffff=
ffff8be7cb46
> > [    8.890628] Call Trace:
> > [    8.890978]  [<ffffffff8c696943>] dump_stack+0x19/0x1b
> > [    8.891689]  [<ffffffff8be7cae5>] warn_slowpath_common+0x8f/0xa8
> > [    8.892535]  [<ffffffff8bead236>] ? __might_sleep+0x9a/0x378
> > [    8.893307]  [<ffffffff8be7cb46>] warn_slowpath_fmt+0x48/0x50
> > [    8.894083]  [<ffffffff8be0dd55>] ? sched_clock+0x9/0xd
> > [    8.894797]  [<ffffffff8d79b511>] ? event_test_thread+0x48/0x93
> > [    8.895602]  [<ffffffff8d79b511>] ? event_test_thread+0x48/0x93
> > [    8.896421]  [<ffffffff8bead236>] __might_sleep+0x9a/0x378
> > [    8.897164]  [<ffffffff8c6a0227>] down_read+0x26/0x98
> > [    8.897855]  [<ffffffff8be8f503>] exit_signals+0x27/0x1c2
> > [    8.898598]  [<ffffffff8be7fedd>] do_exit+0x193/0x10bd
> > [    8.899298]  [<ffffffff8bfd1969>] ? kfree+0x4a0/0x4d7
> > [    8.900028]  [<ffffffff8d79b4c9>] ? event_trace_self_tests+0x6d7/0x6=
d7
> > [    8.900946]  [<ffffffff8d79b4c9>] ? event_trace_self_tests+0x6d7/0x6=
d7
> > [    8.914871]  [<ffffffff8bea4b65>] kthread+0x156/0x156
> > [    8.915571]  [<ffffffff8c69c0f8>] ? wait_for_common+0x3e/0x224
> > [    8.916381]  [<ffffffff8bea4a0f>] ? insert_kthread_work+0xe7/0xe7
> > [    8.917203]  [<ffffffff8c6a353a>] ret_from_fork+0x7a/0xb0
> > [    8.917937]  [<ffffffff8bea4a0f>] ? insert_kthread_work+0xe7/0xe7
> > [    8.918800] ---[ end trace 14d02ef17adbc114 ]---
> =

> =

> Steve, wth is that thing supposed to do?
> =

> 	set_current_state(TASK_INTERRUPTIBLE);
> 	while (!kthread_should_stop())
> 		schedule();
> =

> That looks broken alright. It'll revert to a yield() 'spin' loop if it
> ever gets a wakeup for anything other than the kthread_stop().
> =

> Did you mean to write something like:
> =

> 	set_current_state(TASK_INTERRUPTIBLE);
> 	while (!kthread_should_stop()) {
> 		schedule();
> 		set_current_state(TASK_INTERRUPTIBLE);
> 	}
> 	__set_current_state(TASK_RUNNING);
> =

> ?

Wow, what a blast from the past. That code hasn't been touched since
2009!

Anyway, all that thread did was call test work on each cpu, and then
waits to be killed. It should only get a single wake up and that should
be from the kthread_stop() call. IOW, that loop should never be
executed more than once.

What exactly is the bug here?

-- Steve

--===============0688807263543070434==--

