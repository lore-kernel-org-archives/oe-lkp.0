Content-Type: multipart/mixed; boundary="===============4477092315633440092=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [locking/ww_mutex] 2a0c112828 WARNING: CPU: 0 PID: 18 at kernel/locking/mutex.c:305 __ww_mutex_wakeup_for_backoff
Date: Mon, 27 Feb 2017 11:35:43 +0100
Message-ID: <20170227103543.GA6536@twins.programming.kicks-ass.net>
In-Reply-To: <20170227102824.GV6500@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4477092315633440092==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2017 at 11:28:24AM +0100, Peter Zijlstra wrote:
> On Mon, Feb 27, 2017 at 01:14:09PM +0800, Fengguang Wu wrote:
> > Hello,
> > =

> > This bisect result is not satisfactory, however the bug is very
> > reproducible and looks still alive in mainline&linux-next. You may
> > try the attached reproduce-* script to debug it.
> =

> OK, let me try that, however, see below.

What that reproduces does is:


[   17.169056] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   17.171014] [ BUG: bad unlock balance detected! ]
[   17.172115] 4.10.0-10265-ge5d56ef #18 Not tainted
[   17.172115] -------------------------------------
[   17.172115] kworker/u2:0/5 is trying to release lock (ww_class_mutex) at:
[   17.172115] [<41575474>] ww_mutex_unlock+0x66/0x72
[   17.172115] but there are no more locks to release!
[   17.172115] =

[   17.172115] other info that might help us debug this:
[   17.172115] =

[   17.172115] other info that might help us debug this:
[   17.172115] 4 locks held by kworker/u2:0/5:
[   17.172115]  #0:  ("test-ww_mutex"){......}, at: [<41041def>] process_on=
e_work+0x168/0x33a
[   17.172115]  #1:  ((&stress->work)){......}, at: [<41041def>] process_on=
e_work+0x168/0x33a
[   17.172115]  #2:  (ww_class_acquire){......}, at: [<41041e47>] process_o=
ne_work+0x1c0/0x33a
[   17.172115]  #3:  (ww_class_mutex){......}, at: [<41057d98>] stress_inor=
der_work+0xbf/0x218
[   17.172115] =

[   17.172115] stack backtrace:
[   17.172115] =

[   17.172115] stack backtrace:
[   17.172115] CPU: 0 PID: 5 Comm: kworker/u2:0 Not tainted 4.10.0-10265-ge=
5d56ef #18
[   17.172115] Workqueue: test-ww_mutex stress_inorder_work
[   17.172115] Call Trace:
[   17.172115]  dump_stack+0x16/0x18
[   17.172115]  print_unlock_imbalance_bug+0xb4/0xc1
[   17.172115]  ? ww_mutex_unlock+0x66/0x72
[   17.172115]  lock_release+0x28d/0x2bb
[   17.172115]  ? ww_mutex_unlock+0x66/0x72
[   17.172115]  __mutex_unlock_slowpath+0x2d/0x1db
[   17.172115]  ? schedule_hrtimeout_range+0xd/0xf
[   17.172115]  mutex_unlock+0xb/0xd
[   17.172115]  ww_mutex_unlock+0x66/0x72
[   17.172115]  stress_inorder_work+0x10a/0x218
[   17.172115]  process_one_work+0x1c0/0x33a
[   17.172115]  ? process_one_work+0x168/0x33a
[   17.172115]  worker_thread+0x22f/0x315
[   17.172115]  kthread+0xed/0xf2
[   17.172115]  ? process_scheduled_works+0x24/0x24
[   17.172115]  ? __kthread_create_on_node+0x11f/0x11f
[   17.172115]  ret_from_fork+0x21/0x30

Which is an entirely different error.. Lemme look into that.

--===============4477092315633440092==--

