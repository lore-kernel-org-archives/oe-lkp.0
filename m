Content-Type: multipart/mixed; boundary="===============3073794945278544160=="
MIME-Version: 1.0
From: Boqun Feng <boqun.feng@gmail.com>
To: lkp@lists.01.org
Subject: Re: [rcutorture] 8704baab9b: WARNING: CPU: 0 PID: 30 at kernel/rcu/rcuperf.c:363 rcu_perf_writer
Date: Wed, 25 May 2016 08:38:20 +0800
Message-ID: <20160525003820.GB21433@insomnia>
In-Reply-To: <20160524180652.GJ4148@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3073794945278544160==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 24, 2016 at 11:06:52AM -0700, Paul E. McKenney wrote:
> On Mon, May 23, 2016 at 12:35:35PM +0800, Boqun Feng wrote:
> > On Sun, May 22, 2016 at 08:28:06AM -0700, Paul E. McKenney wrote:
> > > On Sun, May 22, 2016 at 02:26:49PM +0800, Boqun Feng wrote:
> > > > Hi Paul,
> > > > =

> > > > On Sat, May 21, 2016 at 10:24:22PM -0700, Paul E. McKenney wrote:
> > > > > On Sun, May 22, 2016 at 10:36:00AM +0800, kernel test robot wrote:
> > > > > > Greetings,
> > > > > > =

> > > > > > 0day kernel testing robot got the below dmesg and the first bad=
 commit is
> > > > > > =

> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > > > > > =

> > > > > > commit 8704baab9bc848b58c129fed6b591bb84ec02f41
> > > > > > Author:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > > > > > AuthorDate: Thu Dec 31 18:33:22 2015 -0800
> > > > > > Commit:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > > > > > CommitDate: Thu Mar 31 13:37:38 2016 -0700
> > > > > > =

> > > > > >     rcutorture: Add RCU grace-period performance tests
> > > > > >     =

> > > > > >     This commit adds a new rcuperf module that carries out simp=
le performance
> > > > > >     tests of RCU grace periods.
> > > > > >     =

> > > > > >     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.c=
om>
> > > > > =

> > > > > ???
> > > > > =

> > > > > This commit adds a default-n performance-test module.  I don't be=
lieve
> > > > =

> > > > I think the robot was using a !SMP && CONFIG_TORTURE_TEST=3Dy &&
> > > > CONFIG_RCU_PERF_TEST=3Dy configuration ;-)
> > > > =

> > > > > that this would result in boot failures.  False bisection?
> > > > > =

> > > > =

> > > > The code triggering the warning is:
> > > > =

> > > > 	WARN_ON(rcu_gp_is_normal() && gp_exp);
> > > > =

> > > > , so rcu_gp_is_normal() is true because we are using TINY RCU, more=
over
> > > > the default value of gp_exp for *rcuperf* is also true (whereas the=
 one
> > > > for rcutorture is false). That's why the warnning was triggered.
> > > > =

> > > > It happened in the boot progress because rcu_perf_writer threads we=
re
> > > > created and ran via module init function rcu_perf_init().
> > > > =

> > > > Maybe we'd better change the defaut value of gp_exp for rcuperf?
> > > =

> > > Or make the default depend on CONFIG_TINY_RCU.  Or downgrade the
> > > WARN_ON() to soething that results in torture-test failure but does
> > > not cause 0day to complain.  Or...
> > > =

> > =

> > So I think a better is we
> > =

> > 1.	set the default value to false (to align with rcutorture)
> > =

> > and
> > =

> > 2.	downgrade the WARN_ON() to torture-test failures, because those
> > 	are not kernel bugs.
> > =

> > Here is a patch for further discussion:
> =

> This patch looks good to me, given a little editing of the commit log.
> (See below for error string suggestion.)
> =


Those are better (shorter and more accurate), thank you! I will send out
a standalone patch with the modification.

Regards,
Boqun

> Other thoughts?
> =

> 							Thanx, Paul
> =

> > ------------------------->8
> > Subject: [PATCH] rcuperf: Don't treat gp_exp mis-setting as a kernel wa=
rning
> > =

> > 0day found a boot warning triggered in rcu_perf_writer() on !SMP kernel:
> > =

> > 	WARN_ON(rcu_gp_is_normal() && gp_exp);
> > =

> > , which turned out to be caused by the default value of gp_exp.
> > =

> > However, the reason of the warning is only mis-setting, which should be
> > handled inside rcuperf module rather than treated as a kernel warning.
> > =

> > Therefore this patch moves the WARN_ON from rcu_perf_writer() and
> > handles those checkings in rcu_perf_init(), which could also save the
> > checkings for each writer.
> > =

> > Moreover, this patch changes the default value of gp_exp to 1) align
> > with rcutorture tests and 2) make the default setting work for all RCU
> > implementations by default.
> > =

> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > Fixes: http://lkml.kernel.org/r/57411b10.mFvG0+AgcrMXGtcj%fengguang.wu(=
a)intel.com
> > ---
> >  kernel/rcu/rcuperf.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> > =

> > diff --git a/kernel/rcu/rcuperf.c b/kernel/rcu/rcuperf.c
> > index 3cee0d8393ed..1dc2bd1de4b6 100644
> > --- a/kernel/rcu/rcuperf.c
> > +++ b/kernel/rcu/rcuperf.c
> > @@ -58,7 +58,7 @@ MODULE_AUTHOR("Paul E. McKenney <paulmck@linux.vnet=
.ibm.com>");
> >  #define VERBOSE_PERFOUT_ERRSTRING(s) \
> >  	do { if (verbose) pr_alert("%s" PERF_FLAG "!!! %s\n", perf_type, s); =
} while (0)
> > =

> > -torture_param(bool, gp_exp, true, "Use expedited GP wait primitives");
> > +torture_param(bool, gp_exp, false, "Use expedited GP wait primitives");
> >  torture_param(int, holdoff, 10, "Holdoff time before test start (s)");
> >  torture_param(int, nreaders, -1, "Number of RCU reader threads");
> >  torture_param(int, nwriters, -1, "Number of RCU updater threads");
> > @@ -363,8 +363,6 @@ rcu_perf_writer(void *arg)
> >  	u64 *wdpp =3D writer_durations[me];
> > =

> >  	VERBOSE_PERFOUT_STRING("rcu_perf_writer task started");
> > -	WARN_ON(rcu_gp_is_expedited() && !rcu_gp_is_normal() && !gp_exp);
> > -	WARN_ON(rcu_gp_is_normal() && gp_exp);
> >  	WARN_ON(!wdpp);
> >  	set_cpus_allowed_ptr(current, cpumask_of(me % nr_cpu_ids));
> >  	sp.sched_priority =3D 1;
> > @@ -631,6 +629,16 @@ rcu_perf_init(void)
> >  		firsterr =3D -ENOMEM;
> >  		goto unwind;
> >  	}
> > +	if (rcu_gp_is_expedited() && !rcu_gp_is_normal() && !gp_exp) {
> > +		VERBOSE_PERFOUT_ERRSTRING("try to measure normal grace periods when =
all the grace periods are expedited");
> =

> "All grace periods expedited, no normal ones to measure!"
> =

> > +		firsterr =3D -EINVAL;
> > +		goto unwind;
> > +	}
> > +	if (rcu_gp_is_normal() && gp_exp) {
> > +		VERBOSE_PERFOUT_ERRSTRING("try to measure expedited grace periods wh=
en all the expedited ones fall back to the normal ones");
> =

> "All grace periods normal, no expedited ones to measure!"
> =

> > +		firsterr =3D -EINVAL;
> > +		goto unwind;
> > +	}
> >  	for (i =3D 0; i < nrealwriters; i++) {
> >  		writer_durations[i] =3D
> >  			kcalloc(MAX_MEAS, sizeof(*writer_durations[i]),
> > -- =

> > 2.8.2
> > =

>=20

--===============3073794945278544160==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIKCmlRRWNCQUFC
Q0FBR0JRSlhSUFA0QUFvSkVFbDU2TU8xQi9xNGFVWUgvMjVLRW1qYldUT08wQ1cyU3RFODIyTzYK
TWsrUkVMSEcyUWczdGtvRHJ6UzZORUdzbTZGRXlqREFPTit6TS91R29jMUpjZXh0d0lPTk44U20y
RUlmNWZsSgpSZEN6TUZPem5FY1Vzdk8vQjBTdTliSFhzUWNyUW93c2JTYzJsb2Z6enEzYndZTnBt
cGEwRUFRQXM0UG93bjdvCjFOVUl2eFBtNTdtT3ozNDJkcTBSbjV3eUU4dTRBWk81QXd5V1lWMExR
bk56Sk80bC9zald3WjFibXVZRWJoWWoKU0xUWFIyekZCK0x3anlsOUxQVjM4aWZyL1FWOVEzcC9a
cUlZMm9ZcFY2d0pVYUZBN094Z0NjZFJxUmJIZGkrQgo1Z0l2TmpiUXJhMFFKQWo0Q0sxb21WcXNF
WDloWGVLenN4Uk52TEVRblQ2aXhqcE9VK0wzYkUzLzdDdC9uclE9Cj1IMEN0Ci0tLS0tRU5EIFBH
UCBTSUdOQVRVUkUtLS0tLQo=

--===============3073794945278544160==--

