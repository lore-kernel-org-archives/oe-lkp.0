Content-Type: multipart/mixed; boundary="===============2299637621869369677=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [clocksource] 6c52b5f3cf: stress-ng.opcode.ops_per_sec -14.4% regression
Date: Thu, 22 Apr 2021 21:12:10 -0700
Message-ID: <20210423041210.GL975577@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <d3a01227-cec5-2670-5525-36a418c5f4a0@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2299637621869369677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 10:15:56AM +0800, Xing Zhengjun wrote:
> =

> =

> On 4/22/2021 10:24 PM, Paul E. McKenney wrote:
> > On Thu, Apr 22, 2021 at 03:41:26PM +0800, Feng Tang wrote:
> > > Hi Paul,
> > > =

> > > On Thu, Apr 22, 2021 at 02:58:27PM +0800, Xing Zhengjun wrote:
> > > > =

> > > > =

> > > > On 4/21/2021 9:42 PM, Paul E. McKenney wrote:
> > > > > On Wed, Apr 21, 2021 at 02:07:19PM +0800, Xing, Zhengjun wrote:
> > > > > > =

> > > > > > On 4/20/2021 10:05 PM, Paul E. McKenney wrote:
> > > > > > > On Tue, Apr 20, 2021 at 06:43:31AM -0700, Paul E. McKenney wr=
ote:
> > > > > > > > On Tue, Apr 20, 2021 at 02:49:34PM +0800, kernel test robot=
 wrote:
> > > > > > > > > Greeting,
> > > > > > > > > =

> > > > > > > > > FYI, we noticed a -14.4% regression of stress-ng.opcode.o=
ps_per_sec due to commit:
> > > > > > > > > =

> > > > > > > > > =

> > > > > > > > > commit: 6c52b5f3cfefd6e429efc4413fd25e3c394e959f ("clocks=
ource: Reduce WATCHDOG_THRESHOLD")
> > > > > > > > > https://git.kernel.org/cgit/linux/kernel/git/paulmck/linu=
x-rcu.git dev.2021.04.13a
> > > > > > > > > =

> > > > > > > > > =

> > > > > > > > > in testcase: stress-ng
> > > > > > > > > on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CP=
U @ 2.10GHz with 192G memory
> > > > > > > > > with following parameters:
> > > > > > > > > =

> > > > > > > > > 	nr_threads: 10%
> > > > > > > > > 	disk: 1HDD
> > > > > > > > > 	testtime: 60s
> > > > > > > > > 	fs: ext4
> > > > > > > > > 	class: os
> > > > > > > > > 	test: opcode
> > > > > > > > > 	cpufreq_governor: performance
> > > > > > > > > 	ucode: 0x5003006
> > > > > > > > Hmmm...  I will try a less-aggressive reduction.  Thank you=
 for testing!
> > > > > > > But wait...  This code is only running twice per second.  It =
is very
> > > > > > > hard to believe that a clock-read retry twice per second is w=
orth 2% of
> > > > > > > performance, let alone 14.4%.
> > > > > > > =

> > > > > > > Is something else perhaps going on here?
> > > > > > > =

> > > > > > > For example, did this run enable any of the new diagnositic c=
locksource.*
> > > > > > > kernel parameters?
> > > > > > > =

> > > > > > > 								Thanx, Paul
> > > > > > I attached the kernel log, the following logs are related with =
the
> > > > > > clocksource.
> > > > > > [=C2=A0=C2=A0=C2=A0 3.453206] clocksource: timekeeping watchdog=
 on CPU1: Marking
> > > > > > clocksource 'tsc-early' as unstable because the skew is too lar=
ge:
> > > > > > [=C2=A0=C2=A0=C2=A0 3.455197] clocksource:=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'hpet' wd_now: 288fcc0
> > > > > > wd_last: 1a8b333 mask: ffffffff
> > > > > > [=C2=A0=C2=A0=C2=A0 3.455199] clocksource:=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'tsc-early' cs_now:
> > > > > > 1def309ebfdee cs_last: 1def2bd70d92c mask: ffffffffffffffff
> > > > > > [=C2=A0=C2=A0=C2=A0 3.455201] clocksource:=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 No current clocksource.
> > > > > > [=C2=A0=C2=A0=C2=A0 3.457197] tsc: Marking TSC unstable due to =
clocksource watchdog
> > > > > > =

> > > > > > 6c52b5f3cf reduced WATCHDOG_THRESHOLD, then in clocksource_watc=
hdog, the
> > > > > > warning logs are print, the TSC is marked as unstable.
> > > > > > /* Check the deviation from the watchdog clocksource. */
> > > > > Aha, so this system really does have an unstable TSC!  Which mean=
s that
> > > > > the patch is operating as designed.
> > > > > =

> > > > > Or are you saying that this is a false positive?
> > > > > =

> > > > > 							Thanx, Paul
> > > > =

> > > > It happened during boot and before TSC calibration
> > > > (tsc_refine_calibration_work()), so on some machines "abs(cs_nsec -=
 wd_nsec)
> > > > > WATCHDOG_THRESHOLD", WATCHDOG_THRESHOLD is set too small at that =
time.
> > > > After TSC calibrated, abs(cs_nsec - wd_nsec) should be very small,
> > > > WATCHDOG_THRESHOLD for here is ok. So I suggest increasing the
> > > > WATCHDOG_THRESHOLD before TSC calibration, for example, the clocks =
be skewed
> > > > by more than 1% to be marked unstable.
> > =

> > This is common code, so we do need an architecture-independent way to
> > handle this.
> > =

> > > As Zhengjun measuered, this is a Cascade Lake platform, and it has 2
> > > times calibration of tsc, the first one of early quick calibration gi=
ves
> > > 2100 MHz, while the later accurate calibration gives 2095 MHz, so the=
re
> > > is about 2.5/1000 deviation for the first number, which just exceeds =
the
> > > 1/1000 threshold you set :)
> > =

> > Even my 2/1000 initial try would have caused this, then.  ;-)
> > =

> > But even 1/1000 deviation would cause any number of applications some
> > severe heartburn, so I am not at all happy with the thought of globally
> > increasing to (say) 3/1000.
> > =

> > > Following is the tsc freq info from kernel log
> > > =

> > > [    0.000000] DMI: Intel Corporation S2600WFT/S2600WFT, BIOS SE5C620=
.86B.02.01.0008.031920191559 03/19/2019
> > > [    0.000000] tsc: Detected 2100.000 MHz processor
> > > ...
> > > [   13.859982] tsc: Refined TSC clocksource calibration: 2095.077 MHz
> > =

> > So what are our options?
> > =

> > 1.	Clear CLOCK_SOURCE_MUST_VERIFY from tsc-early.
> > =

> > 2.	#1, but add tsc-early into the watchdog list and set
> > 	CLOCK_SOURCE_MUST_VERIFY once it is better calibrated.
> > =

> > 3.	Add a field to struct clocksource that, if non-zero, gives
> > 	the maximum drift in nanoseconds per half second (AKA
> > 	WATCHDOG_INTERVAL).  If zero, the WATCHDOG_MAX_SKEW value
> > 	is used.  Set this to (say) 150,000ns for tsc-early.
> > =

> > 4.	As noted earlier, increase WATCHDOG_MAX_SKEW to 150 microseconds,
> > 	which again is not a good approach given the real-world needs
> > 	of real-world applications.
> > =

> > 5.	Your ideas here.
> How about set two watchdog thresholds, one for before calibration(1/100),
> the other for after calibration(1/1000)? For example, u64
> watchdog_thresholds[2].

With an architecture-specific Kconfig option (or similar) that tells
the code which to start with, along with a call from the calibration
code to make the switch happen?

But why not just initially calibrate to 1/1000?

							Thanx, Paul

> > All in all, I am glad that I made the patch that decreases
> > WATCHDOG_MAX_SKEW be separate and at the end of the series.  ;-)
> > =

> > 							Thanx, Paul
> > =

> =

> -- =

> Zhengjun Xing
--===============2299637621869369677==--

