Content-Type: multipart/mixed; boundary="===============0204382522213437775=="
MIME-Version: 1.0
From: Boqun Feng <boqun.feng@gmail.com>
To: lkp@lists.01.org
Subject: Re: [rcutorture] 8704baab9b: WARNING: CPU: 0 PID: 30 at kernel/rcu/rcuperf.c:363 rcu_perf_writer
Date: Mon, 23 May 2016 12:35:35 +0800
Message-ID: <20160523043517.GA21433@insomnia>
In-Reply-To: <20160522152806.GK3528@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0204382522213437775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 22, 2016 at 08:28:06AM -0700, Paul E. McKenney wrote:
> On Sun, May 22, 2016 at 02:26:49PM +0800, Boqun Feng wrote:
> > Hi Paul,
> > =

> > On Sat, May 21, 2016 at 10:24:22PM -0700, Paul E. McKenney wrote:
> > > On Sun, May 22, 2016 at 10:36:00AM +0800, kernel test robot wrote:
> > > > Greetings,
> > > > =

> > > > 0day kernel testing robot got the below dmesg and the first bad com=
mit is
> > > > =

> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
> > > > =

> > > > commit 8704baab9bc848b58c129fed6b591bb84ec02f41
> > > > Author:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > > > AuthorDate: Thu Dec 31 18:33:22 2015 -0800
> > > > Commit:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > > > CommitDate: Thu Mar 31 13:37:38 2016 -0700
> > > > =

> > > >     rcutorture: Add RCU grace-period performance tests
> > > >     =

> > > >     This commit adds a new rcuperf module that carries out simple p=
erformance
> > > >     tests of RCU grace periods.
> > > >     =

> > > >     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > > =

> > > ???
> > > =

> > > This commit adds a default-n performance-test module.  I don't believe
> > =

> > I think the robot was using a !SMP && CONFIG_TORTURE_TEST=3Dy &&
> > CONFIG_RCU_PERF_TEST=3Dy configuration ;-)
> > =

> > > that this would result in boot failures.  False bisection?
> > > =

> > =

> > The code triggering the warning is:
> > =

> > 	WARN_ON(rcu_gp_is_normal() && gp_exp);
> > =

> > , so rcu_gp_is_normal() is true because we are using TINY RCU, moreover
> > the default value of gp_exp for *rcuperf* is also true (whereas the one
> > for rcutorture is false). That's why the warnning was triggered.
> > =

> > It happened in the boot progress because rcu_perf_writer threads were
> > created and ran via module init function rcu_perf_init().
> > =

> > Maybe we'd better change the defaut value of gp_exp for rcuperf?
> =

> Or make the default depend on CONFIG_TINY_RCU.  Or downgrade the
> WARN_ON() to soething that results in torture-test failure but does
> not cause 0day to complain.  Or...
> =


So I think a better is we

1.	set the default value to false (to align with rcutorture)

and

2.	downgrade the WARN_ON() to torture-test failures, because those
	are not kernel bugs.

Here is a patch for further discussion:

------------------------->8
Subject: [PATCH] rcuperf: Don't treat gp_exp mis-setting as a kernel warning

0day found a boot warning triggered in rcu_perf_writer() on !SMP kernel:

	WARN_ON(rcu_gp_is_normal() && gp_exp);

, which turned out to be caused by the default value of gp_exp.

However, the reason of the warning is only mis-setting, which should be
handled inside rcuperf module rather than treated as a kernel warning.

Therefore this patch moves the WARN_ON from rcu_perf_writer() and
handles those checkings in rcu_perf_init(), which could also save the
checkings for each writer.

Moreover, this patch changes the default value of gp_exp to 1) align
with rcutorture tests and 2) make the default setting work for all RCU
implementations by default.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Fixes: http://lkml.kernel.org/r/57411b10.mFvG0+AgcrMXGtcj%fengguang.wu(a)in=
tel.com
---
 kernel/rcu/rcuperf.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/kernel/rcu/rcuperf.c b/kernel/rcu/rcuperf.c
index 3cee0d8393ed..1dc2bd1de4b6 100644
--- a/kernel/rcu/rcuperf.c
+++ b/kernel/rcu/rcuperf.c
@@ -58,7 +58,7 @@ MODULE_AUTHOR("Paul E. McKenney <paulmck@linux.vnet.ibm=
.com>");
 #define VERBOSE_PERFOUT_ERRSTRING(s) \
 	do { if (verbose) pr_alert("%s" PERF_FLAG "!!! %s\n", perf_type, s); } wh=
ile (0)
 =

-torture_param(bool, gp_exp, true, "Use expedited GP wait primitives");
+torture_param(bool, gp_exp, false, "Use expedited GP wait primitives");
 torture_param(int, holdoff, 10, "Holdoff time before test start (s)");
 torture_param(int, nreaders, -1, "Number of RCU reader threads");
 torture_param(int, nwriters, -1, "Number of RCU updater threads");
@@ -363,8 +363,6 @@ rcu_perf_writer(void *arg)
 	u64 *wdpp =3D writer_durations[me];
 =

 	VERBOSE_PERFOUT_STRING("rcu_perf_writer task started");
-	WARN_ON(rcu_gp_is_expedited() && !rcu_gp_is_normal() && !gp_exp);
-	WARN_ON(rcu_gp_is_normal() && gp_exp);
 	WARN_ON(!wdpp);
 	set_cpus_allowed_ptr(current, cpumask_of(me % nr_cpu_ids));
 	sp.sched_priority =3D 1;
@@ -631,6 +629,16 @@ rcu_perf_init(void)
 		firsterr =3D -ENOMEM;
 		goto unwind;
 	}
+	if (rcu_gp_is_expedited() && !rcu_gp_is_normal() && !gp_exp) {
+		VERBOSE_PERFOUT_ERRSTRING("try to measure normal grace periods when all =
the grace periods are expedited");
+		firsterr =3D -EINVAL;
+		goto unwind;
+	}
+	if (rcu_gp_is_normal() && gp_exp) {
+		VERBOSE_PERFOUT_ERRSTRING("try to measure expedited grace periods when a=
ll the expedited ones fall back to the normal ones");
+		firsterr =3D -EINVAL;
+		goto unwind;
+	}
 	for (i =3D 0; i < nrealwriters; i++) {
 		writer_durations[i] =3D
 			kcalloc(MAX_MEAS, sizeof(*writer_durations[i]),
-- =

2.8.2


--===============0204382522213437775==--

