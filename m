Content-Type: multipart/mixed; boundary="===============6994905664744971843=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [torture] b151f93a71: INFO:rcu_preempt_detected_stalls_on_CPUs/tasks
Date: Thu, 30 Nov 2017 16:45:57 -0800
Message-ID: <20171201004557.GA19717@linux.vnet.ibm.com>
In-Reply-To: <20171129223806.GA15615@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6994905664744971843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2017 at 02:38:06PM -0800, Paul E. McKenney wrote:
> On Wed, Nov 29, 2017 at 02:07:03PM -0800, Paul E. McKenney wrote:

[ . . . ]

> > And it converged to 5c4991e24c69 ("sched/isolation: Split out new
> > CONFIG_CPU_ISOLATION=3Dy config from CONFIG_NO_HZ_FULL"), which is a bit
> > hard to believe.  Please see below for the log.  I will be retesting
> > some of the allegedly good commits, just in case.
> =

> And the bisection really did converge here.  It appears that splitting
> CONFIG_CPU_ISOLATION from CONFIG_NO_HZ_FULL isn't fully cooked.
> Adding CONFIG_CPU_ISOLATION=3Dy to my tests causes them to pass, but I
> get the eternal wait for a three-jiffy timeout given CONFIG_NO_HZ_FULL=3Dy
> and CONFIG_CPU_ISOLATION=3Dn.  Both cases use CONFIG_NO_HZ_FULL_ALL=3Dy.
> =

> Adding Frederic for his perspective.

And the next layer of this onion is 6f1982fedd59 ("sched/isolation:
Handle the nohz_full=3D parameter").  This one seems to have broken
CONFIG_NO_HZ_FULL_ALL:  If you have CONFIG_NO_HZ_FULL_ALL=3Dy, but
don't supply the nohz_full=3D boot parameter, it is supposed to put all
but the boot CPU into nohz_full mode.  But the code doesn't do that.
The tick_nohz_init_all() function simply creates the tick_nohz_full_mask
and sets tick_nohz_full_running, but doesn't do any of the housekeeping
initialization that now appears to be required.

My path of least resistance is to just remove CONFIG_NO_HZ_FULL_ALL,
as in the following patch.  And the lack of bug reports leads me to believe
that I am the only one using this Kconfig option.

If someone else is using CONFIG_NO_HZ_FULL_ALL, I of course have no
problem with them putting forward an alternative patch that makes it
work correctly.  ;-)

With both patches applied, things appear to work much better.

							Thanx, Paul

------------------------------------------------------------------------

commit cf3b2149af558fb4e09f486bf937256e5c7947fe
Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Date:   Thu Nov 30 15:36:35 2017 -0800

    sched/isolation: Eliminate NO_HZ_FULL_ALL
    =

    Commit 6f1982fedd59 ("sched/isolation: Handle the nohz_full=3D paramete=
r")
    broke CONFIG_NO_HZ_FULL_ALL=3Dy kernels.  This breakage is due to the c=
ode
    under CONFIG_NO_HZ_FULL_ALL failing to invoke the shiny new housekeeping
    functions.  This means that rcutorture scenario TREE04 now emits RCU CPU
    stall warnings due to the RCU grace-period kthreads not being awakened
    at a time of their choosing, or perhaps even not at all:
    =

    [   27.731422] rcu_bh kthread starved for 21001 jiffies! g1844674407370=
9551369 c18446744073709551368 f0x0 RCU_GP_WAIT_FQS(3) ->state=3D0x402 ->cpu=
=3D3
    [   27.731423] rcu_bh          I14936     9      2 0x80080000
    [   27.731435] Call Trace:
    [   27.731440]  __schedule+0x31a/0x6d0
    [   27.731442]  schedule+0x31/0x80
    [   27.731446]  schedule_timeout+0x15a/0x320
    [   27.731453]  ? call_timer_fn+0x130/0x130
    [   27.731457]  rcu_gp_kthread+0x66c/0xea0
    [   27.731458]  ? rcu_gp_kthread+0x66c/0xea0
    =

    Because no one has complained about CONFIG_NO_HZ_FULL_ALL=3Dy being bro=
ken,
    I hypothesize that no one is in fact using it, other than rcutorture.
    This commit therefore eliminates CONFIG_NO_HZ_FULL_ALL and updates
    rcutorture's config files to instead use the nohz_full=3D kernel parame=
ter
    to put the desired CPUs into nohz_full mode.
    =

    Fixes: 6f1982fedd59 ("sched/isolation: Handle the nohz_full=3D paramete=
r")
    =

    Reported-by: kernel test robot <xiaolong.ye@intel.com>
    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
    Cc: Frederic Weisbecker <frederic@kernel.org>
    Cc: Thomas Gleixner <tglx@linutronix.de>
    Cc: Chris Metcalf <cmetcalf@mellanox.com>
    Cc: Christoph Lameter <cl@linux.com>
    Cc: Linus Torvalds <torvalds@linux-foundation.org>
    Cc: Luiz Capitulino <lcapitulino@redhat.com>
    Cc: Mike Galbraith <efault@gmx.de>
    Cc: Peter Zijlstra <peterz@infradead.org>
    Cc: Rik van Riel <riel@redhat.com>
    Cc: Wanpeng Li <kernellwp@gmail.com>
    Cc: Ingo Molnar <mingo@kernel.org>
    Cc: John Stultz <john.stultz@linaro.org>
    Cc: Jonathan Corbet <corbet@lwn.net>

diff --git a/Documentation/timers/NO_HZ.txt b/Documentation/timers/NO_HZ.txt
index 2dcaf9adb7a7..9591092da5e0 100644
--- a/Documentation/timers/NO_HZ.txt
+++ b/Documentation/timers/NO_HZ.txt
@@ -131,13 +131,6 @@ error message, and the boot CPU will be removed from t=
he mask.  Note that
 this means that your system must have at least two CPUs in order for
 CONFIG_NO_HZ_FULL=3Dy to do anything for you.
 =

-Alternatively, the CONFIG_NO_HZ_FULL_ALL=3Dy Kconfig parameter specifies
-that all CPUs other than the boot CPU are adaptive-ticks CPUs.  This
-Kconfig parameter will be overridden by the "nohz_full=3D" boot parameter,
-so that if both the CONFIG_NO_HZ_FULL_ALL=3Dy Kconfig parameter and
-the "nohz_full=3D1" boot parameter is specified, the boot parameter will
-prevail so that only CPU 1 will be an adaptive-ticks CPU.
-
 Finally, adaptive-ticks CPUs must have their RCU callbacks offloaded.
 This is covered in the "RCU IMPLICATIONS" section below.
 =

diff --git a/kernel/time/Kconfig b/kernel/time/Kconfig
index f6b5f19223d6..78eabc41eaa6 100644
--- a/kernel/time/Kconfig
+++ b/kernel/time/Kconfig
@@ -113,16 +113,6 @@ config NO_HZ_FULL
 =

 endchoice
 =

-config NO_HZ_FULL_ALL
-       bool "Full dynticks system on all CPUs by default (except CPU 0)"
-       depends on NO_HZ_FULL
-       help
-         If the user doesn't pass the nohz_full boot option to
-	 define the range of full dynticks CPUs, consider that all
-	 CPUs in the system are full dynticks by default.
-	 Note the boot CPU will still be kept outside the range to
-	 handle the timekeeping duty.
-
 config NO_HZ
 	bool "Old Idle dynticks config"
 	depends on !ARCH_USES_GETTIMEOFFSET && GENERIC_CLOCKEVENTS
diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index 99578f06c8d4..ee10208148d5 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -405,30 +405,12 @@ static int tick_nohz_cpu_down(unsigned int cpu)
 	return 0;
 }
 =

-static int tick_nohz_init_all(void)
-{
-	int err =3D -1;
-
-#ifdef CONFIG_NO_HZ_FULL_ALL
-	if (!alloc_cpumask_var(&tick_nohz_full_mask, GFP_KERNEL)) {
-		WARN(1, "NO_HZ: Can't allocate full dynticks cpumask\n");
-		return err;
-	}
-	err =3D 0;
-	cpumask_setall(tick_nohz_full_mask);
-	tick_nohz_full_running =3D true;
-#endif
-	return err;
-}
-
 void __init tick_nohz_init(void)
 {
 	int cpu, ret;
 =

-	if (!tick_nohz_full_running) {
-		if (tick_nohz_init_all() < 0)
-			return;
-	}
+	if (!tick_nohz_full_running)
+		return;
 =

 	/*
 	 * Full dynticks uses irq work to drive the tick rescheduling on safe
diff --git a/tools/testing/selftests/rcutorture/configs/rcu/TASKS03 b/tools=
/testing/selftests/rcutorture/configs/rcu/TASKS03
index c70c51d5ded1..28568b72a31b 100644
--- a/tools/testing/selftests/rcutorture/configs/rcu/TASKS03
+++ b/tools/testing/selftests/rcutorture/configs/rcu/TASKS03
@@ -9,5 +9,4 @@ CONFIG_PREEMPT=3Dy
 CONFIG_HZ_PERIODIC=3Dn
 CONFIG_NO_HZ_IDLE=3Dn
 CONFIG_NO_HZ_FULL=3Dy
-CONFIG_NO_HZ_FULL_ALL=3Dy
 #CHECK#CONFIG_RCU_EXPERT=3Dn
diff --git a/tools/testing/selftests/rcutorture/configs/rcu/TASKS03.boot b/=
tools/testing/selftests/rcutorture/configs/rcu/TASKS03.boot
index cd2a188eeb6d..838297c58318 100644
--- a/tools/testing/selftests/rcutorture/configs/rcu/TASKS03.boot
+++ b/tools/testing/selftests/rcutorture/configs/rcu/TASKS03.boot
@@ -1 +1 @@
-rcutorture.torture_type=3Dtasks
+rcutorture.torture_type=3Dtasks nohz_full=3D1
diff --git a/tools/testing/selftests/rcutorture/configs/rcu/TREE04 b/tools/=
testing/selftests/rcutorture/configs/rcu/TREE04
index 27d22695d64c..24c9f6012e35 100644
--- a/tools/testing/selftests/rcutorture/configs/rcu/TREE04
+++ b/tools/testing/selftests/rcutorture/configs/rcu/TREE04
@@ -7,7 +7,6 @@ CONFIG_PREEMPT=3Dn
 CONFIG_HZ_PERIODIC=3Dn
 CONFIG_NO_HZ_IDLE=3Dn
 CONFIG_NO_HZ_FULL=3Dy
-CONFIG_NO_HZ_FULL_ALL=3Dy
 CONFIG_RCU_FAST_NO_HZ=3Dy
 CONFIG_RCU_TRACE=3Dy
 CONFIG_HOTPLUG_CPU=3Dn
diff --git a/tools/testing/selftests/rcutorture/configs/rcu/TREE04.boot b/t=
ools/testing/selftests/rcutorture/configs/rcu/TREE04.boot
index e34c33430447..e6071bb96c7d 100644
--- a/tools/testing/selftests/rcutorture/configs/rcu/TREE04.boot
+++ b/tools/testing/selftests/rcutorture/configs/rcu/TREE04.boot
@@ -1 +1 @@
-rcutorture.torture_type=3Drcu_bh rcutree.rcu_fanout_leaf=3D4
+rcutorture.torture_type=3Drcu_bh rcutree.rcu_fanout_leaf=3D4 nohz_full=3D1=
-7
diff --git a/tools/testing/selftests/rcutorture/configs/rcu/TREE07 b/tools/=
testing/selftests/rcutorture/configs/rcu/TREE07
index 0f4759f4232e..d7afb271a586 100644
--- a/tools/testing/selftests/rcutorture/configs/rcu/TREE07
+++ b/tools/testing/selftests/rcutorture/configs/rcu/TREE07
@@ -7,7 +7,6 @@ CONFIG_PREEMPT=3Dn
 CONFIG_HZ_PERIODIC=3Dn
 CONFIG_NO_HZ_IDLE=3Dn
 CONFIG_NO_HZ_FULL=3Dy
-CONFIG_NO_HZ_FULL_ALL=3Dn
 CONFIG_RCU_FAST_NO_HZ=3Dn
 CONFIG_RCU_TRACE=3Dy
 CONFIG_HOTPLUG_CPU=3Dy


--===============6994905664744971843==--

