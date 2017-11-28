Content-Type: multipart/mixed; boundary="===============1651948501112552880=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [torture] b151f93a71: INFO:rcu_preempt_detected_stalls_on_CPUs/tasks
Date: Tue, 28 Nov 2017 08:41:44 -0800
Message-ID: <20171128164144.GS3624@linux.vnet.ibm.com>
In-Reply-To: <alpine.DEB.2.20.1711281454430.1723@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============1651948501112552880==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2017 at 03:16:30PM +0100, Thomas Gleixner wrote:
> On Mon, 27 Nov 2017, Paul E. McKenney wrote:
> > On Sun, Nov 26, 2017 at 04:42:03PM +0800, kernel test robot wrote:
> > > [  116.353432] rcu_preempt kthread starved for 9974 jiffies! g4294967=
208 c4294967207 f0x0 RCU_GP_WAIT_FQS(3) ->state=3D0x402 ->cpu=3D0
> > =

> > So the immediate reason for the stall warning is that the RCU grace-per=
iod
> > kthread isn't being allowed to run.
> > =

> > > [  116.355517] rcu_preempt     I 7464     8      2 0x80000000
> > > [  116.356543] Call Trace:
> > > [  116.357008]  __schedule+0x493/0x620
> > > [  116.357682]  schedule+0x24/0x40
> > > [  116.358291]  schedule_timeout+0x330/0x3b0
> > =

> > And the reason that it isn't being allowed to run is that its few-jiffy
> > schedule_timeout has extended for more than nine thousand jiffies.
> > =

> > There was an odd combination of kernel parameters that Thomas Gleixner
> > came across that could cause writer-thread stalls (since fixed in -rcu
> > by the exact patch you call out here), but I don't see how this could
> > cause an RCU CPU stall warning.
> =

> <Trimmed a lot of useless crap.....>
> =

> The only reasonable explanation is that either a wakeup is missed or the
> timer is not expired. Hard to tell from that back trace, but it would be
> interesting to figure that out. Let me think about how that can be done.

Please see below for my latest patch in service of futility.  It leverages
the fact that the stall-warning code takes the desperation step of sending
an unsolicited wakeup to the grace-period kthread.  This allows the patch
to use a stupid but effective heuristic to detect that the timer (or the
wakeup) has gone AWOL.

I get the following "Waylayed timer" line from it:

[ 8015.327554] rcu_sched kthread starved for 21096 jiffies! g12440 c12439 f=
0x0 RCU_GP_WAIT_FQS(3) ->state=3D0x402 ->cpu=3D3
[ 8015.327554] rcu_sched       I14992     9      2 0x80000000
[ 8015.327554] Call Trace:
[ 8015.327554]  ? __schedule+0x33c/0x6f0
[ 8015.327554]  ? preempt_count_add+0x51/0x90
[ 8015.327554]  schedule+0x37/0x90
[ 8015.327554]  schedule_timeout+0x159/0x410
[ 8015.327554]  ? __next_timer_interrupt+0xc0/0xc0
[ 8015.327554]  rcu_gp_kthread+0xa42/0x1080
[ 8015.327554]  kthread+0xf0/0x130
[ 8015.327554]  ? rcu_barrier+0x10/0x10
[ 8015.327554]  ? kthread_destroy_worker+0x40/0x40
[ 8015.327554]  ret_from_fork+0x1f/0x30
[ 8015.421044] schedule_timeout: Waylayed timer idx: 56 idx_now: 222

Is there something more useful that I could make this thing print?

						Thanx, Paul

------------------------------------------------------------------------

commit ae343c59e5df18e639ea8832e43c09b4a35f14d1
Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Date:   Mon Nov 27 16:24:26 2017 -0800

    EXP: timer: Dump info if timer misses by huge amount
    =

    Part of the eternal chase of timer misses...
    =

    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index ffebcf878fba..db774b0f217e 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -1755,8 +1755,12 @@ static void process_timeout(struct timer_list *t)
  */
 signed long __sched schedule_timeout(signed long timeout)
 {
+	struct timer_base *base;
 	struct process_timer timer;
 	unsigned long expire;
+	unsigned long flags;
+	unsigned int idx, idx_now;
+	unsigned long j;
 =

 	switch (timeout)
 	{
@@ -1793,6 +1797,14 @@ signed long __sched schedule_timeout(signed long tim=
eout)
 	timer_setup_on_stack(&timer.timer, process_timeout, 0);
 	__mod_timer(&timer.timer, expire, 0);
 	schedule();
+	j =3D jiffies;
+	if (timeout < 5 && time_after(j, expire + 8 * HZ) && timer_pending(&timer=
.timer)) {
+		base =3D lock_timer_base(&timer.timer, &flags);
+		idx =3D timer_get_idx(&timer.timer);
+		idx_now =3D calc_wheel_index(j, base->clk);
+		raw_spin_unlock_irqrestore(&base->lock, flags);
+		pr_info("%s: Waylayed timer idx: %u idx_now: %u\n", __func__, idx, idx_n=
ow);
+	}
 	del_singleshot_timer_sync(&timer.timer);
 =

 	/* Remove the timer from the object tracker */


--===============1651948501112552880==--

