Content-Type: multipart/mixed; boundary="===============8679623683240746572=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [torture] b151f93a71: INFO:rcu_preempt_detected_stalls_on_CPUs/tasks
Date: Wed, 29 Nov 2017 14:38:06 -0800
Message-ID: <20171129223806.GA15615@linux.vnet.ibm.com>
In-Reply-To: <20171129220703.GA12908@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8679623683240746572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2017 at 02:07:03PM -0800, Paul E. McKenney wrote:
> On Wed, Nov 29, 2017 at 11:08:19AM -0800, Paul E. McKenney wrote:
> > On Tue, Nov 28, 2017 at 01:08:10PM -0800, Paul E. McKenney wrote:
> > > On Tue, Nov 28, 2017 at 12:46:19PM -0800, Paul E. McKenney wrote:
> > > > On Tue, Nov 28, 2017 at 09:35:54AM -0800, Paul E. McKenney wrote:
> > > > > On Tue, Nov 28, 2017 at 06:10:08PM +0100, Thomas Gleixner wrote:
> > > > > > On Tue, 28 Nov 2017, Paul E. McKenney wrote:
> > > > > > > On Tue, Nov 28, 2017 at 05:47:35PM +0100, Thomas Gleixner wro=
te:
> > > > > > > diff --git a/kernel/time/timer.c b/kernel/time/timer.c
> > > > > > > index db774b0f217e..a3321bb565db 100644
> > > > > > > --- a/kernel/time/timer.c
> > > > > > > +++ b/kernel/time/timer.c
> > > > > > > @@ -1803,7 +1803,7 @@ signed long __sched schedule_timeout(si=
gned long timeout)
> > > > > > >  		idx =3D timer_get_idx(&timer.timer);
> > > > > > >  		idx_now =3D calc_wheel_index(j, base->clk);
> > > > > > >  		raw_spin_unlock_irqrestore(&base->lock, flags);
> > > > > > > -		pr_info("%s: Waylayed timer idx: %u idx_now: %u\n", __func=
__, idx, idx_now);
> > > > > > > +		pr_info("%s: Waylayed timer base->clk: %#lx jiffies: %#lx =
base->next_expiry: %#lx timer->flags: %#x timer->expires %#lx idx: %u idx_n=
ow: %u\n", __func__, base->clk, j, base->next_expiry, timer.timer.flags, ti=
mer.timer.expires, idx, idx_now);
> > > > > > =

> > > > > > Please print idx and idx_now as hex values. It's simpler to dec=
ode that way.
> > > > > =

> > > > > Here you go!  Starting tests at this end, focusing on TREE01 and =
TREE04.
> > > > > BTW, TREE04 doesn't do any CPU hotplug, providing a counterexampl=
e to
> > > > > my long-held assumption that this only happened in the presence o=
f CPU
> > > > > hotplug operations.
> > > > =

> > > > And here is output with changes discussed on IRC.  TREE04 managed to
> > > > have not one but two overlapping RCU CPU stall warnings, one for RC=
U-bh
> > > > and the second for RCU-sched.  TREE04 and TREE04.  HZ=3D1000.
> > > =

> > > And here is the full patch, in all its lack of aesthetic appeal.
> > =

> > And here is the list of waylaid timers from last night's testing.  The =
big
> > pile of them from TREE01 at the end is due to wakeups from kthread_stop=
(),
> > I am guessing.  The TREE04 run only had two of them, but they seem reli=
able
> > enough that I just might be able to bisect.  I will try that.
> =

> And it converged to 5c4991e24c69 ("sched/isolation: Split out new
> CONFIG_CPU_ISOLATION=3Dy config from CONFIG_NO_HZ_FULL"), which is a bit
> hard to believe.  Please see below for the log.  I will be retesting
> some of the allegedly good commits, just in case.

And the bisection really did converge here.  It appears that splitting
CONFIG_CPU_ISOLATION from CONFIG_NO_HZ_FULL isn't fully cooked.
Adding CONFIG_CPU_ISOLATION=3Dy to my tests causes them to pass, but I
get the eternal wait for a three-jiffy timeout given CONFIG_NO_HZ_FULL=3Dy
and CONFIG_CPU_ISOLATION=3Dn.  Both cases use CONFIG_NO_HZ_FULL_ALL=3Dy.

Adding Frederic for his perspective.

							Thanx, Paul


--===============8679623683240746572==--

