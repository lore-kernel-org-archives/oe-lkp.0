Content-Type: multipart/mixed; boundary="===============4513713130435999436=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8901ecc231: stress-ng.lockbus.ops_per_sec -9.5% regression
Date: Thu, 27 May 2021 11:29:59 -0700
Message-ID: <20210527182959.GA437082@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20210526134911.GB4441@paulmck-ThinkPad-P17-Gen-1>
List-Id: <oe-lkp.lists.linux.dev>

--===============4513713130435999436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2021 at 06:49:11AM -0700, Paul E. McKenney wrote:
> On Wed, May 26, 2021 at 02:49:22PM +0800, Feng Tang wrote:
> > On Sat, May 22, 2021 at 09:08:27AM -0700, Paul E. McKenney wrote:
> > > On Fri, May 21, 2021 at 06:56:17AM -0700, Paul E. McKenney wrote:
> > > > On Fri, May 21, 2021 at 04:33:22PM +0800, kernel test robot wrote:
> > > > > =

> > > > > =

> > > > > Greeting,
> > > > > =

> > > > > FYI, we noticed a -9.5% regression of stress-ng.lockbus.ops_per_s=
ec due to commit:
> > > > > =

> > > > > =

> > > > > commit: 8901ecc2315b850f35a7b8c1b73b12388b72aa78 ("clocksource: R=
etry clock read if long delays detected")
> > > > > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git =
master
> > > > > =

> > > > > =

> > > > > in testcase: stress-ng
> > > > > on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 =
CPU @ 2.10GHz with 192G memory
> > > > > with following parameters:
> > > > > =

> > > > > 	nr_threads: 100%
> > > > > 	disk: 1HDD
> > > > > 	testtime: 60s
> > > > > 	class: memory
> > > > > 	test: lockbus
> > > > > 	cpufreq_governor: performance
> > > > > 	ucode: 0x5003006
> > > > > =

> > > > > =

> > > > > please be noted below in dmesg.xz (attached)
> > > > > [   28.110351]
> > > > > [   28.302357] hrtimer: interrupt took 1878423 ns
> > > > > [   29.690760] clocksource: timekeeping watchdog on CPU53: hpet r=
ead-back delay of 169583ns, attempt 4, marking unstable
> > > > > [   29.860306] tsc: Marking TSC unstable due to clocksource watch=
dog
> > > > > [   30.559390] TSC found unstable after boot, most likely due to =
broken BIOS. Use 'tsc=3Dunstable'.
> > > > > [   30.726282] sched_clock: Marking unstable (30052964508, 499342=
225)<-(30915547410, -363240730)
> > > > > [   31.620401] clocksource: Switched to clocksource hpet
> > > > =

> > > > If I am reading the dmesg correctly, there were many interrupts that
> > > > prevented a good clock read.  This sound to me like a bug that the
> > > > clocksource watchdog located, but please let me know if this is not
> > > > the case.
> > > >
> > > > There are also the later "perf: interrupt took too long" messages.
> > >
> > > And of course, increasing the clocksource.max_cswd_read_retries module
> > > boot parameter (or clocksource.max_read_retries in the earlier commit=
s,
> > > which I will fix) can work around short bursts of NMIs.  Or long burs=
ts
> > > of NMIs, if you set this kernel boot parameter large enough.
> > =

> > I reproduced it on a borrowed baremetal 4 nodes, 96C/192T Xeon, with
> > latest stress-ng code https://github.com/ColinIanKing/stress-ng.git.
> > (2 sockets box should also be able to reproduce it)
> > =

> > Seems this sub testcase 'lockbus' is a extreme stress case, by loop
> > doing "lock" operation:
> > =

> >   c8:	f0 83 00 01          	lock addl $0x1,(%rax)
> >   cc:	f0 83 40 04 01       	lock addl $0x1,0x4(%rax)
> >   d1:	f0 83 40 08 01       	lock addl $0x1,0x8(%rax)
> >   d6:	f0 83 40 0c 01       	lock addl $0x1,0xc(%rax)
> >   db:	f0 83 40 10 01       	lock addl $0x1,0x10(%rax)
> >   e0:	f0 83 40 14 01       	lock addl $0x1,0x14(%rax)
> >   e5:	f0 83 40 18 01       	lock addl $0x1,0x18(%rax)
> >   ea:	f0 83 40 1c 01       	lock addl $0x1,0x1c(%rax)
> >   ef:	f0 83 01 00          	lock addl $0x0,(%rcx)
> >   f3:	f0 83 01 00          	lock addl $0x0,(%rcx)
> >   f7:	f0 83 01 00          	lock addl $0x0,(%rcx)
> >   fb:	f0 83 01 00          	lock addl $0x0,(%rcx)
> >   ff:	f0 83 01 00          	lock addl $0x0,(%rcx)
> >  103:	f0 83 01 00          	lock addl $0x0,(%rcx)
> >  107:	f0 83 01 00          	lock addl $0x0,(%rcx)
> >  ...
> > =

> > (The source c file and objdump are attached fyi)
> > =

> > So the watchdog read (read_hpet() here) sometimes does take very
> > long time (hundreds of microseconds) which breaks this sanity
> > read check, and cause 'unstable' tsc.
> > =

> > As from the man page of stress-ng:
> > "Use stress-ng with caution as some of the tests can make a system
> > run hot on poorly designed hardware and also can cause excessive
> > system thrashing which may be difficult to stop"
> > =

> > I don't think this 'lockbus' is close to any real-world usage.
> =

> Heh!  In the past, I have had to adjust Linux-kernel RCU in order to
> avoid having too many locked operations.  So, yes, I agree that this
> test result should not require a change to the clocksource watchdog.
> =

> I just rebased to eliminate the pointless name change in the middle
> of the series from max_read_retries to max_cswd_read_retries, and will
> repost later today or tomorrow.

In addition, please see below for a just-in-case out-of-tree patch that
takes a different approach in response to persistent long-latency reads.
It falls back to using the old 62.5-millisecond skew threshold and also
marks the offending clocksource for reinitialization.

Again, I believe that the current less-subtle approach will serve us well,
especially during hardware bringup, but just in case...

							Thanx, Paul

------------------------------------------------------------------------

commit 48ebcfbfd877f5d9cddcc03c91352a8ca7b190af
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Thu May 27 11:03:28 2021 -0700

    clocksource: Forgive repeated long-latency watchdog clocksource reads
    =

    Currently, the clocksource watchdog reacts to repeated long-latency
    clocksource reads by marking that clocksource unstable on the theory th=
at
    these long-latency reads are a sign of a serious problem.  And this the=
ory
    does in fact have real-world support in the form of firmware issues [1].
    =

    However, it is also possible to trigger this using stress-ng on what
    the stress-ng man page terms "poorly designed hardware" [2].  And it
    is not necessarily a bad thing for the kernel to diagnose cases where
    high-stress workloads are being run on hardware that is not designed
    for this sort of use.
    =

    Nevertheless, it is quite possible that real-world use will result in
    some situation requiring that high-stress workloads run on hardware
    not designed to accommodate them, and also requiring that the kernel
    refrain from marking clocksources unstable.
    =

    Therefore, provide an out-of-tree patch that reacts to this situation
    by leaving the clocksource alone, but using the old 62.5-millisecond
    skew-detection threshold in response persistent long-latency reads.
    In addition, the offending clocksource is marked for re-initialization
    in this case, which both restarts that clocksource with a clean bill of
    health and avoids false-positive skew reports on later watchdog checks.
    =

    Link: https://lore.kernel.org/lkml/20210513155515.GB23902(a)xsang-OptiP=
lex-9020/ # [1]
    Link: https://lore.kernel.org/lkml/20210521083322.GG25531(a)xsang-OptiP=
lex-9020/ # [2]
    Link: https://lore.kernel.org/lkml/20210521084405.GH25531(a)xsang-OptiP=
lex-9020/
    Link: https://lore.kernel.org/lkml/20210511233403.GA2896757(a)paulmck-T=
hinkPad-P17-Gen-1/
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/kernel/time/clocksource-wdtest.c b/kernel/time/clocksource-wdt=
est.c
index 01df12395c0e..b72a969f7b93 100644
--- a/kernel/time/clocksource-wdtest.c
+++ b/kernel/time/clocksource-wdtest.c
@@ -146,13 +146,12 @@ static int wdtest_func(void *arg)
 		else if (i <=3D max_cswd_read_retries)
 			s =3D ", expect message";
 		else
-			s =3D ", expect clock skew";
+			s =3D ", expect coarse-grained clock skew check and re-initialization";
 		pr_info("--- Watchdog with %dx error injection, %lu retries%s.\n", i, ma=
x_cswd_read_retries, s);
 		WRITE_ONCE(wdtest_ktime_read_ndelays, i);
 		schedule_timeout_uninterruptible(2 * HZ);
 		WARN_ON_ONCE(READ_ONCE(wdtest_ktime_read_ndelays));
-		WARN_ON_ONCE((i <=3D max_cswd_read_retries) !=3D
-			     !(clocksource_wdtest_ktime.flags & CLOCK_SOURCE_UNSTABLE));
+		WARN_ON_ONCE(clocksource_wdtest_ktime.flags & CLOCK_SOURCE_UNSTABLE);
 		wdtest_ktime_clocksource_reset();
 	}
 =

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index 4485635b69f5..6c0820779bd3 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -225,13 +225,13 @@ static bool cs_watchdog_read(struct clocksource *cs, =
u64 *csnow, u64 *wdnow)
 				pr_warn("timekeeping watchdog on CPU%d: %s retried %d times before suc=
cess\n",
 					smp_processor_id(), watchdog->name, nretries);
 			}
-			return true;
+			return false;
 		}
 	}
 =

-	pr_warn("timekeeping watchdog on CPU%d: %s read-back delay of %lldns, att=
empt %d, marking unstable\n",
+	pr_warn("timekeeping watchdog on CPU%d: %s read-back delay of %lldns, att=
empt %d, coarse-grained skew check followed by re-initialization\n",
 		smp_processor_id(), watchdog->name, wd_delay, nretries);
-	return false;
+	return true;
 }
 =

 static u64 csnow_mid;
@@ -355,6 +355,7 @@ static void clocksource_watchdog(struct timer_list *unu=
sed)
 	int next_cpu, reset_pending;
 	int64_t wd_nsec, cs_nsec;
 	struct clocksource *cs;
+	bool coarse;
 	u32 md;
 =

 	spin_lock(&watchdog_lock);
@@ -372,11 +373,7 @@ static void clocksource_watchdog(struct timer_list *un=
used)
 			continue;
 		}
 =

-		if (!cs_watchdog_read(cs, &csnow, &wdnow)) {
-			/* Clock readout unreliable, so give it up. */
-			__clocksource_unstable(cs);
-			continue;
-		}
+		coarse =3D cs_watchdog_read(cs, &csnow, &wdnow);
 =

 		/* Clocksource initialized ? */
 		if (!(cs->flags & CLOCK_SOURCE_WATCHDOG) ||
@@ -402,7 +399,13 @@ static void clocksource_watchdog(struct timer_list *un=
used)
 			continue;
 =

 		/* Check the deviation from the watchdog clocksource. */
-		md =3D cs->uncertainty_margin + watchdog->uncertainty_margin;
+		if (coarse) {
+			md =3D 62500 * NSEC_PER_USEC;
+			cs->flags &=3D ~CLOCK_SOURCE_WATCHDOG;
+			pr_warn("timekeeping watchdog on CPU%d: %s coarse-grained %lu.%03lu ms =
clock-skew check followed by re-initialization\n", smp_processor_id(), watc=
hdog->name, md / NSEC_PER_MSEC, md % NSEC_PER_MSEC / NSEC_PER_USEC);
+		} else {
+			md =3D cs->uncertainty_margin + watchdog->uncertainty_margin;
+		}
 		if (abs(cs_nsec - wd_nsec) > md) {
 			pr_warn("timekeeping watchdog on CPU%d: Marking clocksource '%s' as uns=
table because the skew is too large:\n",
 				smp_processor_id(), cs->name);
--===============4513713130435999436==--

