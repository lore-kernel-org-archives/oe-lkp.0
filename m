Content-Type: multipart/mixed; boundary="===============4961262409623858110=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8901ecc231: stress-ng.lockbus.ops_per_sec -9.5% regression
Date: Mon, 02 Aug 2021 10:02:57 -0700
Message-ID: <20210802170257.GL4397@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20210802062008.GA24720@gao-cwp>
List-Id: <oe-lkp.lists.linux.dev>

--===============4961262409623858110==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 02, 2021 at 02:20:09PM +0800, Chao Gao wrote:
> [snip]
> >commit 48ebcfbfd877f5d9cddcc03c91352a8ca7b190af
> >Author: Paul E. McKenney <paulmck@kernel.org>
> >Date:   Thu May 27 11:03:28 2021 -0700
> >
> >    clocksource: Forgive repeated long-latency watchdog clocksource reads
> >    =

> >    Currently, the clocksource watchdog reacts to repeated long-latency
> >    clocksource reads by marking that clocksource unstable on the theory=
 that
> >    these long-latency reads are a sign of a serious problem.  And this =
theory
> >    does in fact have real-world support in the form of firmware issues =
[1].
> >    =

> >    However, it is also possible to trigger this using stress-ng on what
> >    the stress-ng man page terms "poorly designed hardware" [2].  And it
> >    is not necessarily a bad thing for the kernel to diagnose cases where
> >    high-stress workloads are being run on hardware that is not designed
> >    for this sort of use.
> >    =

> >    Nevertheless, it is quite possible that real-world use will result in
> >    some situation requiring that high-stress workloads run on hardware
> >    not designed to accommodate them, and also requiring that the kernel
> >    refrain from marking clocksources unstable.
> >    =

> >    Therefore, provide an out-of-tree patch that reacts to this situation
> >    by leaving the clocksource alone, but using the old 62.5-millisecond
> >    skew-detection threshold in response persistent long-latency reads.
> >    In addition, the offending clocksource is marked for re-initializati=
on
> >    in this case, which both restarts that clocksource with a clean bill=
 of
> >    health and avoids false-positive skew reports on later watchdog chec=
ks.
> =

> Hi Paul,
> =

> Sorry to dig out this old thread.

Not a problem, especially given that this is still an experimental patch
(marked with "EXP" in -rcu).  So one remaining question is "what is this
patch really supposed to do, if anything?"

> I am testing with this patch in a VM, but I find sometimes re-initializat=
ion
> after coarse-grained skew check may not happen as expected because ...
> =

> >    =

> >    Link: https://lore.kernel.org/lkml/20210513155515.GB23902(a)xsang-Op=
tiPlex-9020/ # [1]
> >    Link: https://lore.kernel.org/lkml/20210521083322.GG25531(a)xsang-Op=
tiPlex-9020/ # [2]
> >    Link: https://lore.kernel.org/lkml/20210521084405.GH25531(a)xsang-Op=
tiPlex-9020/
> >    Link: https://lore.kernel.org/lkml/20210511233403.GA2896757(a)paulmc=
k-ThinkPad-P17-Gen-1/
> >    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> >
> >diff --git a/kernel/time/clocksource-wdtest.c b/kernel/time/clocksource-=
wdtest.c
> >index 01df12395c0e..b72a969f7b93 100644
> >--- a/kernel/time/clocksource-wdtest.c
> >+++ b/kernel/time/clocksource-wdtest.c
> >@@ -146,13 +146,12 @@ static int wdtest_func(void *arg)
> > 		else if (i <=3D max_cswd_read_retries)
> > 			s =3D ", expect message";
> > 		else
> >-			s =3D ", expect clock skew";
> >+			s =3D ", expect coarse-grained clock skew check and re-initializatio=
n";
> > 		pr_info("--- Watchdog with %dx error injection, %lu retries%s.\n", i,=
 max_cswd_read_retries, s);
> > 		WRITE_ONCE(wdtest_ktime_read_ndelays, i);
> > 		schedule_timeout_uninterruptible(2 * HZ);
> > 		WARN_ON_ONCE(READ_ONCE(wdtest_ktime_read_ndelays));
> >-		WARN_ON_ONCE((i <=3D max_cswd_read_retries) !=3D
> >-			     !(clocksource_wdtest_ktime.flags & CLOCK_SOURCE_UNSTABLE));
> >+		WARN_ON_ONCE(clocksource_wdtest_ktime.flags & CLOCK_SOURCE_UNSTABLE);
> > 		wdtest_ktime_clocksource_reset();
> > 	}
> > =

> >diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
> >index 4485635b69f5..6c0820779bd3 100644
> >--- a/kernel/time/clocksource.c
> >+++ b/kernel/time/clocksource.c
> >@@ -225,13 +225,13 @@ static bool cs_watchdog_read(struct clocksource *c=
s, u64 *csnow, u64 *wdnow)
> > 				pr_warn("timekeeping watchdog on CPU%d: %s retried %d times before =
success\n",
> > 					smp_processor_id(), watchdog->name, nretries);
> > 			}
> >-			return true;
> >+			return false;
> > 		}
> > 	}
> > =

> >-	pr_warn("timekeeping watchdog on CPU%d: %s read-back delay of %lldns, =
attempt %d, marking unstable\n",
> >+	pr_warn("timekeeping watchdog on CPU%d: %s read-back delay of %lldns, =
attempt %d, coarse-grained skew check followed by re-initialization\n",
> > 		smp_processor_id(), watchdog->name, wd_delay, nretries);
> >-	return false;
> >+	return true;
> > }
> > =

> > static u64 csnow_mid;
> >@@ -355,6 +355,7 @@ static void clocksource_watchdog(struct timer_list *=
unused)
> > 	int next_cpu, reset_pending;
> > 	int64_t wd_nsec, cs_nsec;
> > 	struct clocksource *cs;
> >+	bool coarse;
> > 	u32 md;
> > =

> > 	spin_lock(&watchdog_lock);
> >@@ -372,11 +373,7 @@ static void clocksource_watchdog(struct timer_list =
*unused)
> > 			continue;
> > 		}
> > =

> >-		if (!cs_watchdog_read(cs, &csnow, &wdnow)) {
> >-			/* Clock readout unreliable, so give it up. */
> >-			__clocksource_unstable(cs);
> >-			continue;
> >-		}
> >+		coarse =3D cs_watchdog_read(cs, &csnow, &wdnow);
> > =

> > 		/* Clocksource initialized ? */
> > 		if (!(cs->flags & CLOCK_SOURCE_WATCHDOG) ||
> >@@ -402,7 +399,13 @@ static void clocksource_watchdog(struct timer_list =
*unused)
> > 			continue;
> > =

> > 		/* Check the deviation from the watchdog clocksource. */
> >-		md =3D cs->uncertainty_margin + watchdog->uncertainty_margin;
> >+		if (coarse) {
> >+			md =3D 62500 * NSEC_PER_USEC;
> >+			cs->flags &=3D ~CLOCK_SOURCE_WATCHDOG;
> >+			pr_warn("timekeeping watchdog on CPU%d: %s coarse-grained %lu.%03lu =
ms clock-skew check followed by re-initialization\n", smp_processor_id(), w=
atchdog->name, md / NSEC_PER_MSEC, md % NSEC_PER_MSEC / NSEC_PER_USEC);
> =

> ... this message on CPU5 doesn't show up in below kernel logs.
> Do you think it is a bug? if yes, any idea to resolve it?
> =

> [  498.571086] clocksource: timekeeping watchdog on CPU1: hpet read-back =
delay of 432490ns, attempt 4, coarse-grained skew check followed by re-init=
ialization
> [  498.572867] clocksource: timekeeping watchdog on CPU1: hpet coarse-gra=
ined 62.500 ms clock-skew check followed by re-initialization
> [  504.071959] clocksource: timekeeping watchdog on CPU4: hpet read-back =
delay of 1679880ns, attempt 4, coarse-grained skew check followed by re-ini=
tialization
> [  504.073817] clocksource: timekeeping watchdog on CPU4: hpet coarse-gra=
ined 62.500 ms clock-skew check followed by re-initialization
> [  504.568821] clocksource: timekeeping watchdog on CPU5: hpet read-back =
delay of 554880ns, attempt 4, coarse-grained skew check followed by re-init=
ialization

Up to this point, the clocksource passed the coarse-grained checks.
So at the very least, the "followed by re-initialization" is misleading.
I will change this message.

And yes, I would have expected the additional "62.500 ms clock-skew check"
message from CPU5, like we see from CPU1 and CPU4 above.  However, this
message will be omitted if there is a watchdog reset pending or if the
clocksource has not yet been initialized.  Which could well have happened
in this case.

> [  505.067666] clocksource: timekeeping watchdog on CPU6: hpet retried 3 =
times before success
> [  505.068593] clocksource: timekeeping watchdog on CPU6: Marking clockso=
urce 'tsc' as unstable because the skew is too large:
> [  505.069596] clocksource:                       'hpet' wd_nsec: 4993767=
90 wd_now: be2f200d wd_last: bb3522fe mask: ffffffff
> [  505.071131] clocksource:                       'tsc' cs_nsec: 49886730=
7 cs_now: 103895c060a cs_last: 1034aea96ea mask: ffffffffffffffff
> [  505.072994] clocksource:                       'tsc' is current clocks=
ource.
> [  505.074748] tsc: Marking TSC unstable due to clocksource watchdog

And here the clocksource failed the coarse-grained check and marked
the clocksource as unstable.  Perhaps because the previous read
forced a coarse-grained check.  Except that this should have forced
a reinitialization.  Ah, it looks like I need to suppress setting
CLOCK_SOURCE_WATCHDOG if coarse-grained checks have been enabled.
That could cause false-positive failure for the next check, after all.

And perhaps make cs_watchdog_read() modify its print if there is
a watchdog reset pending or if the current clocksource has the
CLOCK_SOURCE_WATCHDOG flag cleared.

Perhaps as shown in the additional patch below, to be folded into the
original?

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index cfa992250c388..62da2485fd574 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -230,8 +230,13 @@ static bool cs_watchdog_read(struct clocksource *cs, u=
64 *csnow, u64 *wdnow)
 		}
 	}
 =

-	pr_warn("timekeeping watchdog on CPU%d: %s read-back delay of %lldns, att=
empt %d, coarse-grained skew check followed by re-initialization\n",
-		smp_processor_id(), watchdog->name, wd_delay, nretries);
+	if ((cs->flags & CLOCK_SOURCE_WATCHDOG) && !atomic_read(&watchdog_reset_p=
ending)) {
+		pr_warn("timekeeping watchdog on CPU%d: %s read-back delay of %lldns, at=
tempt %d, coarse-grained skew check followed by re-initialization\n",
+			smp_processor_id(), watchdog->name, wd_delay, nretries);
+	} else {
+		pr_warn("timekeeping watchdog on CPU%d: %s read-back delay of %lldns, at=
tempt %d, awaiting re-initialization\n",
+			smp_processor_id(), watchdog->name, wd_delay, nretries);
+	}
 	return true;
 }
 =

@@ -379,7 +384,8 @@ static void clocksource_watchdog(struct timer_list *unu=
sed)
 		/* Clocksource initialized ? */
 		if (!(cs->flags & CLOCK_SOURCE_WATCHDOG) ||
 		    atomic_read(&watchdog_reset_pending)) {
-			cs->flags |=3D CLOCK_SOURCE_WATCHDOG;
+			if (!coarse)
+				cs->flags |=3D CLOCK_SOURCE_WATCHDOG;
 			cs->wd_last =3D wdnow;
 			cs->cs_last =3D csnow;
 			continue;
--===============4961262409623858110==--

