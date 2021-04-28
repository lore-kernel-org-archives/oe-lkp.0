Content-Type: multipart/mixed; boundary="===============4546084901936543014=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8c30ace35d: WARNING:at_kernel/time/clocksource.c:#clocksource_watchdog
Date: Tue, 27 Apr 2021 18:48:19 -0700
Message-ID: <20210428014819.GA965980@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <87y2d3mo2q.ffs@nanos.tec.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============4546084901936543014==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 27, 2021 at 11:09:49PM +0200, Thomas Gleixner wrote:
> Paul,
> =

> On Tue, Apr 27 2021 at 10:50, Paul E. McKenney wrote:
> > On Tue, Apr 27, 2021 at 06:37:46AM -0700, Paul E. McKenney wrote:
> >> I suppose that I give it (say) 120 seconds instead of the current 60,
> >> which might be the right thing to do, but it does feel like papering
> >> over a very real initramfs problem.  Alternatively, I could provide a
> >> boot parameter allowing those with slow systems to adjust as needed.
> >
> > OK, it turns out that there are systems for which boot times in excess
> > of one minute are expected behavior.  They are a bit rare, though.
> > So what I will do is keep the 60-second default, add a boot parameter,
> > and also add a comment by the warning pointing out the boot parameter.
> =

> Oh, no. This starts to become yet another duct tape horror show.
> =

> I'm not at all against a more robust and resilent watchdog mechanism,
> but having a dozen knobs to tune and heuristics which are doomed to fail
> is not a solution at all.

One problem is that I did the .max_drift patch backwards.  I tightened
the skew requirements on all clocks except those specially marked, and
I should have done the reverse.  With that change, all of the clocks
except for clocksource_tsc would work (or as the case might be, fail to
work) in exactly the same way that they do today, but still rejecting
false-positive skew events due to NMIs, SMIs, vCPU preemption, and so on.

Then patch v10 7/7 can go away completely, and patch 6/7 becomes much
smaller (and gets renamed), for example, as shown below.

Does that help?

							Thanx, Paul

------------------------------------------------------------------------

commit ba1fca950a4bcd8a5737efc552f937529496b5fc
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Tue Apr 27 18:43:37 2021 -0700

    clocksource: Reduce clocksource-skew threshold for TSC
    =

    Currently, WATCHDOG_THRESHOLD is set to detect a 62.5-millisecond skew =
in
    a 500-millisecond WATCHDOG_INTERVAL.  This requires that clocks be skew=
ed
    by more than 12.5% in order to be marked unstable.  Except that a clock
    that is skewed by that much is probably destroying unsuspecting software
    right and left.  And given that there are now checks for false-positive
    skews due to delays between reading the two clocks, it should be possib=
le
    to greatly decrease WATCHDOG_THRESHOLD, at least for fine-grained clocks
    such as TSC.
    =

    Therefore, decrease WATCHDOG_THRESHOLD from the current 62.5 millisecon=
ds
    down to 200 microseconds, but only for clocksource_tsc through use of
    a new max_drift field in struct clocksource.  Coarse-grained clocks
    such as refined-jiffies retain their old skew checks, courtesy of the
    default-zero initialization of the max_drift field.
    =

    Suggested-by: Thomas Gleixner <tglx@linutronix.de>
    Cc: John Stultz <john.stultz@linaro.org>
    Cc: Stephen Boyd <sboyd@kernel.org>
    Cc: Jonathan Corbet <corbet@lwn.net>
    Cc: Mark Rutland <Mark.Rutland@arm.com>
    Cc: Marc Zyngier <maz@kernel.org>
    Cc: Andi Kleen <ak@linux.intel.com>
    Cc: Xing Zhengjun <zhengjun.xing@linux.intel.com>
    Cc: Feng Tang <feng.tang@intel.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 56289170753c..c281575ed5c2 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1147,6 +1147,7 @@ static struct clocksource clocksource_tsc_early =3D {
 static struct clocksource clocksource_tsc =3D {
 	.name			=3D "tsc",
 	.rating			=3D 300,
+	.max_drift		=3D 200 * NSEC_PER_USEC,
 	.read			=3D read_tsc,
 	.mask			=3D CLOCKSOURCE_MASK(64),
 	.flags			=3D CLOCK_SOURCE_IS_CONTINUOUS |
diff --git a/include/linux/clocksource.h b/include/linux/clocksource.h
index 83a3ebff7456..44b567fbf435 100644
--- a/include/linux/clocksource.h
+++ b/include/linux/clocksource.h
@@ -42,6 +42,8 @@ struct module;
  * @shift:		Cycle to nanosecond divisor (power of two)
  * @max_idle_ns:	Maximum idle time permitted by the clocksource (nsecs)
  * @maxadj:		Maximum adjustment value to mult (~11%)
+ * @max_drift:		Maximum drift rate in nanoseconds per half second.
+ *			Zero says to use default WATCHDOG_THRESHOLD.
  * @archdata:		Optional arch-specific data
  * @max_cycles:		Maximum safe cycle value which won't overflow on
  *			multiplication
@@ -93,6 +95,7 @@ struct clocksource {
 	u32			shift;
 	u64			max_idle_ns;
 	u32			maxadj;
+	u32			max_drift;
 #ifdef CONFIG_ARCH_CLOCKSOURCE_DATA
 	struct arch_clocksource_data archdata;
 #endif
diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index f71f375df544..e33955c322cf 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -377,6 +377,7 @@ static void clocksource_watchdog(struct timer_list *unu=
sed)
 	int next_cpu, reset_pending;
 	int64_t wd_nsec, cs_nsec;
 	struct clocksource *cs;
+	u32 md;
 =

 	spin_lock(&watchdog_lock);
 	if (!watchdog_running)
@@ -423,7 +424,8 @@ static void clocksource_watchdog(struct timer_list *unu=
sed)
 			continue;
 =

 		/* Check the deviation from the watchdog clocksource. */
-		if (abs(cs_nsec - wd_nsec) > WATCHDOG_THRESHOLD) {
+		md =3D cs->max_drift ?: WATCHDOG_THRESHOLD;
+		if (abs(cs_nsec - wd_nsec) > md) {
 			pr_warn("timekeeping watchdog on CPU%d: Marking clocksource '%s' as uns=
table because the skew is too large:\n",
 				smp_processor_id(), cs->name);
 			pr_warn("                      '%s' wd_now: %llx wd_last: %llx mask: %l=
lx\n",
--===============4546084901936543014==--

