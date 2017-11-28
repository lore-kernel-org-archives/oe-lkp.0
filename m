Content-Type: multipart/mixed; boundary="===============6901843796313539688=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [torture] b151f93a71: INFO:rcu_preempt_detected_stalls_on_CPUs/tasks
Date: Tue, 28 Nov 2017 09:35:54 -0800
Message-ID: <20171128173554.GV3624@linux.vnet.ibm.com>
In-Reply-To: <alpine.DEB.2.20.1711281809200.2222@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============6901843796313539688==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2017 at 06:10:08PM +0100, Thomas Gleixner wrote:
> On Tue, 28 Nov 2017, Paul E. McKenney wrote:
> > On Tue, Nov 28, 2017 at 05:47:35PM +0100, Thomas Gleixner wrote:
> > diff --git a/kernel/time/timer.c b/kernel/time/timer.c
> > index db774b0f217e..a3321bb565db 100644
> > --- a/kernel/time/timer.c
> > +++ b/kernel/time/timer.c
> > @@ -1803,7 +1803,7 @@ signed long __sched schedule_timeout(signed long =
timeout)
> >  		idx =3D timer_get_idx(&timer.timer);
> >  		idx_now =3D calc_wheel_index(j, base->clk);
> >  		raw_spin_unlock_irqrestore(&base->lock, flags);
> > -		pr_info("%s: Waylayed timer idx: %u idx_now: %u\n", __func__, idx, i=
dx_now);
> > +		pr_info("%s: Waylayed timer base->clk: %#lx jiffies: %#lx base->next=
_expiry: %#lx timer->flags: %#x timer->expires %#lx idx: %u idx_now: %u\n",=
 __func__, base->clk, j, base->next_expiry, timer.timer.flags, timer.timer.=
expires, idx, idx_now);
> =

> Please print idx and idx_now as hex values. It's simpler to decode that w=
ay.

Here you go!  Starting tests at this end, focusing on TREE01 and TREE04.
BTW, TREE04 doesn't do any CPU hotplug, providing a counterexample to
my long-held assumption that this only happened in the presence of CPU
hotplug operations.

							Thanx, Paul

------------------------------------------------------------------------

commit dfdfd710624e66b48de829f5302dadbc619c0885
Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Date:   Tue Nov 28 09:05:39 2017 -0800

    EXP: timer: Dump more info if timer misses by huge amount
    =

    "Please let it print base->clk, jiffies, base->next_expiry, timer->flag=
s,
    and timer->expires."
    =

    Suggested-by: Thomas Gleixner <tglx@linutronix.de>
    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index db774b0f217e..fac6704cdb18 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -1803,7 +1803,7 @@ signed long __sched schedule_timeout(signed long time=
out)
 		idx =3D timer_get_idx(&timer.timer);
 		idx_now =3D calc_wheel_index(j, base->clk);
 		raw_spin_unlock_irqrestore(&base->lock, flags);
-		pr_info("%s: Waylayed timer idx: %u idx_now: %u\n", __func__, idx, idx_n=
ow);
+		pr_info("%s: Waylayed timer base->clk: %#lx jiffies: %#lx base->next_exp=
iry: %#lx timer->flags: %#x timer->expires %#lx idx: %x idx_now: %x\n", __f=
unc__, base->clk, j, base->next_expiry, timer.timer.flags, timer.timer.expi=
res, idx, idx_now);
 	}
 	del_singleshot_timer_sync(&timer.timer);
 =



--===============6901843796313539688==--

