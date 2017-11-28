Content-Type: multipart/mixed; boundary="===============6725950301185154037=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [torture] b151f93a71: INFO:rcu_preempt_detected_stalls_on_CPUs/tasks
Date: Tue, 28 Nov 2017 13:08:10 -0800
Message-ID: <20171128210810.GA22726@linux.vnet.ibm.com>
In-Reply-To: <20171128204619.GA16740@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6725950301185154037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2017 at 12:46:19PM -0800, Paul E. McKenney wrote:
> On Tue, Nov 28, 2017 at 09:35:54AM -0800, Paul E. McKenney wrote:
> > On Tue, Nov 28, 2017 at 06:10:08PM +0100, Thomas Gleixner wrote:
> > > On Tue, 28 Nov 2017, Paul E. McKenney wrote:
> > > > On Tue, Nov 28, 2017 at 05:47:35PM +0100, Thomas Gleixner wrote:
> > > > diff --git a/kernel/time/timer.c b/kernel/time/timer.c
> > > > index db774b0f217e..a3321bb565db 100644
> > > > --- a/kernel/time/timer.c
> > > > +++ b/kernel/time/timer.c
> > > > @@ -1803,7 +1803,7 @@ signed long __sched schedule_timeout(signed l=
ong timeout)
> > > >  		idx =3D timer_get_idx(&timer.timer);
> > > >  		idx_now =3D calc_wheel_index(j, base->clk);
> > > >  		raw_spin_unlock_irqrestore(&base->lock, flags);
> > > > -		pr_info("%s: Waylayed timer idx: %u idx_now: %u\n", __func__, id=
x, idx_now);
> > > > +		pr_info("%s: Waylayed timer base->clk: %#lx jiffies: %#lx base->=
next_expiry: %#lx timer->flags: %#x timer->expires %#lx idx: %u idx_now: %u=
\n", __func__, base->clk, j, base->next_expiry, timer.timer.flags, timer.ti=
mer.expires, idx, idx_now);
> > > =

> > > Please print idx and idx_now as hex values. It's simpler to decode th=
at way.
> > =

> > Here you go!  Starting tests at this end, focusing on TREE01 and TREE04.
> > BTW, TREE04 doesn't do any CPU hotplug, providing a counterexample to
> > my long-held assumption that this only happened in the presence of CPU
> > hotplug operations.
> =

> And here is output with changes discussed on IRC.  TREE04 managed to
> have not one but two overlapping RCU CPU stall warnings, one for RCU-bh
> and the second for RCU-sched.  TREE04 and TREE04.  HZ=3D1000.

And here is the full patch, in all its lack of aesthetic appeal.

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index ffebcf878fba..fbfdc572ceaa 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -1755,8 +1755,13 @@ static void process_timeout(struct timer_list *t)
  */
 signed long __sched schedule_timeout(signed long timeout)
 {
+	struct timer_base *base;
 	struct process_timer timer;
 	unsigned long expire;
+	unsigned long flags;
+	unsigned long i;
+	unsigned int idx, idx_now;
+	unsigned long j;
 =

 	switch (timeout)
 	{
@@ -1793,6 +1798,17 @@ signed long __sched schedule_timeout(signed long tim=
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
+		pr_info("%s: Waylayed timer base->clk: %#lx jiffies: %#lx base->next_exp=
iry: %#lx timer->flags: %#x timer->expires %#lx idx: %x idx_now: %x base->p=
ending_map ", __func__, base->clk, j, base->next_expiry, timer.timer.flags,=
 timer.timer.expires, idx, idx_now);
+		for (i =3D 0; i < WHEEL_SIZE / sizeof(base->pending_map[0]) / 8; i++)
+			pr_cont("%16lx", base->pending_map[i]);
+		pr_cont("\n");
+	}
 	del_singleshot_timer_sync(&timer.timer);
 =

 	/* Remove the timer from the object tracker */


--===============6725950301185154037==--

