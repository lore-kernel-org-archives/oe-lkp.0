Content-Type: multipart/mixed; boundary="===============2041483121880572211=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [clocksource] 6c52b5f3cf: stress-ng.opcode.ops_per_sec -14.4% regression
Date: Fri, 23 Apr 2021 14:14:44 -0700
Message-ID: <20210423211444.GO975577@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <87tunwvmmu.ffs@nanos.tec.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============2041483121880572211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 09:14:49PM +0200, Thomas Gleixner wrote:
> On Thu, Apr 22 2021 at 07:24, Paul E. McKenney wrote:
> > On Thu, Apr 22, 2021 at 03:41:26PM +0800, Feng Tang wrote:
> > So what are our options?
> >
> > 1.	Clear CLOCK_SOURCE_MUST_VERIFY from tsc-early.
> >
> > 2.	#1, but add tsc-early into the watchdog list and set
> > 	CLOCK_SOURCE_MUST_VERIFY once it is better calibrated.
> >
> > 3.	Add a field to struct clocksource that, if non-zero, gives
> > 	the maximum drift in nanoseconds per half second (AKA
> > 	WATCHDOG_INTERVAL).  If zero, the WATCHDOG_MAX_SKEW value
> > 	is used.  Set this to (say) 150,000ns for tsc-early.
> >
> > 4.	As noted earlier, increase WATCHDOG_MAX_SKEW to 150 microseconds,
> > 	which again is not a good approach given the real-world needs
> > 	of real-world applications.
> >
> > 5.	Your ideas here.
> =

> #3 or add a flag to the clocksource which says 'frequency is guesswork' a=
nd
> increase the threshold based on that.
> =

> If that flag is still set max_drift is !=3D 0 after 20 seconds yell.

I made it 60 seconds based on recent experience with large systems,
but sounds good!

And the calls to clocksource_unregister(&clocksource_tsc_early) mean
that it is not necessary to actually clear the .max_drift field, if
I understand correctly.

It looks to me that init_tsc_clocksource() is invoked at device_initcall()
time, and that it either immediately unregisters clocksource_tsc_early
(known TSC frequency), or schedules a delayed work to make
tsc_refine_calibration_work() do the calibration and the unregister.

Please see below for an untested patch.

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 56289170753c..7192b8950322 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1127,6 +1127,7 @@ static int tsc_cs_enable(struct clocksource *cs)
 static struct clocksource clocksource_tsc_early =3D {
 	.name			=3D "tsc-early",
 	.rating			=3D 299,
+	.max_drift		=3D 5 * NSEC_PER_MSEC,
 	.read			=3D read_tsc,
 	.mask			=3D CLOCKSOURCE_MASK(64),
 	.flags			=3D CLOCK_SOURCE_IS_CONTINUOUS |
diff --git a/include/linux/clocksource.h b/include/linux/clocksource.h
index 83a3ebff7456..0c4418b381bf 100644
--- a/include/linux/clocksource.h
+++ b/include/linux/clocksource.h
@@ -93,6 +93,7 @@ struct clocksource {
 	u32			shift;
 	u64			max_idle_ns;
 	u32			maxadj;
+	u32			max_drift;
 #ifdef CONFIG_ARCH_CLOCKSOURCE_DATA
 	struct arch_clocksource_data archdata;
 #endif
diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index a1f90e2b1039..871837c46c62 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -126,6 +126,7 @@ static void __clocksource_change_rating(struct clocksou=
rce *cs, int rating);
  */
 #define WATCHDOG_INTERVAL (HZ >> 1)
 #define WATCHDOG_THRESHOLD (200 * NSEC_PER_USEC)
+#define WATCHDOG_SYNC_FORGIVENESS (HZ * 60UL)
 =

 /*
  * Maximum permissible delay between two readouts of the watchdog
@@ -377,6 +378,7 @@ static void clocksource_watchdog(struct timer_list *unu=
sed)
 	int next_cpu, reset_pending;
 	int64_t wd_nsec, cs_nsec;
 	struct clocksource *cs;
+	u32 md;
 =

 	spin_lock(&watchdog_lock);
 	if (!watchdog_running)
@@ -423,6 +425,12 @@ static void clocksource_watchdog(struct timer_list *un=
used)
 			continue;
 =

 		/* Check the deviation from the watchdog clocksource. */
+		if (!cs->max_drift) {
+			md =3D WATCHDOG_MAX_SKEW;
+		} else {
+			WARN_ON_ONCE(time_after(jiffies, WATCHDOG_SYNC_FORGIVENESS));
+			md =3D cs->max_drift;
+		}
 		if (abs(cs_nsec - wd_nsec) > WATCHDOG_THRESHOLD) {
 			pr_warn("timekeeping watchdog on CPU%d: Marking clocksource '%s' as uns=
table because the skew is too large:\n",
 				smp_processor_id(), cs->name);
--===============2041483121880572211==--

