Content-Type: multipart/mixed; boundary="===============3330853183539114823=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [clocksource] 6c52b5f3cf: stress-ng.opcode.ops_per_sec -14.4% regression
Date: Thu, 22 Apr 2021 09:57:43 -0700
Message-ID: <20210422165743.GA162649@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20210422142454.GD975577@paulmck-ThinkPad-P17-Gen-1>
List-Id: <oe-lkp.lists.linux.dev>

--===============3330853183539114823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 22, 2021 at 07:24:54AM -0700, Paul E. McKenney wrote:
> On Thu, Apr 22, 2021 at 03:41:26PM +0800, Feng Tang wrote:
> > Hi Paul,
> > =

> > On Thu, Apr 22, 2021 at 02:58:27PM +0800, Xing Zhengjun wrote:
> > > =

> > > =

> > > On 4/21/2021 9:42 PM, Paul E. McKenney wrote:
> > > >On Wed, Apr 21, 2021 at 02:07:19PM +0800, Xing, Zhengjun wrote:
> > > >>
> > > >>On 4/20/2021 10:05 PM, Paul E. McKenney wrote:
> > > >>>On Tue, Apr 20, 2021 at 06:43:31AM -0700, Paul E. McKenney wrote:
> > > >>>>On Tue, Apr 20, 2021 at 02:49:34PM +0800, kernel test robot wrote:
> > > >>>>>Greeting,
> > > >>>>>
> > > >>>>>FYI, we noticed a -14.4% regression of stress-ng.opcode.ops_per_=
sec due to commit:
> > > >>>>>
> > > >>>>>
> > > >>>>>commit: 6c52b5f3cfefd6e429efc4413fd25e3c394e959f ("clocksource: =
Reduce WATCHDOG_THRESHOLD")
> > > >>>>>https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.g=
it dev.2021.04.13a
> > > >>>>>
> > > >>>>>
> > > >>>>>in testcase: stress-ng
> > > >>>>>on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.1=
0GHz with 192G memory
> > > >>>>>with following parameters:
> > > >>>>>
> > > >>>>>	nr_threads: 10%
> > > >>>>>	disk: 1HDD
> > > >>>>>	testtime: 60s
> > > >>>>>	fs: ext4
> > > >>>>>	class: os
> > > >>>>>	test: opcode
> > > >>>>>	cpufreq_governor: performance
> > > >>>>>	ucode: 0x5003006
> > > >>>>Hmmm...  I will try a less-aggressive reduction.  Thank you for t=
esting!
> > > >>>But wait...  This code is only running twice per second.  It is ve=
ry
> > > >>>hard to believe that a clock-read retry twice per second is worth =
2% of
> > > >>>performance, let alone 14.4%.
> > > >>>
> > > >>>Is something else perhaps going on here?
> > > >>>
> > > >>>For example, did this run enable any of the new diagnositic clocks=
ource.*
> > > >>>kernel parameters?
> > > >>>
> > > >>>								Thanx, Paul
> > > >>I attached the kernel log, the following logs are related with the
> > > >>clocksource.
> > > >>[=C2=A0=C2=A0=C2=A0 3.453206] clocksource: timekeeping watchdog on =
CPU1: Marking
> > > >>clocksource 'tsc-early' as unstable because the skew is too large:
> > > >>[=C2=A0=C2=A0=C2=A0 3.455197] clocksource:=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'hpet' wd_now: 288fcc0
> > > >>wd_last: 1a8b333 mask: ffffffff
> > > >>[=C2=A0=C2=A0=C2=A0 3.455199] clocksource:=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'tsc-early' cs_now:
> > > >>1def309ebfdee cs_last: 1def2bd70d92c mask: ffffffffffffffff
> > > >>[=C2=A0=C2=A0=C2=A0 3.455201] clocksource:=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 No current clocksource.
> > > >>[=C2=A0=C2=A0=C2=A0 3.457197] tsc: Marking TSC unstable due to cloc=
ksource watchdog
> > > >>
> > > >>6c52b5f3cf reduced WATCHDOG_THRESHOLD, then in clocksource_watchdog=
, the
> > > >>warning logs are print, the TSC is marked as unstable.
> > > >>/* Check the deviation from the watchdog clocksource. */
> > > >Aha, so this system really does have an unstable TSC!  Which means t=
hat
> > > >the patch is operating as designed.
> > > >
> > > >Or are you saying that this is a false positive?
> > > >
> > > >							Thanx, Paul
> > > =

> > > It happened during boot and before TSC calibration
> > > (tsc_refine_calibration_work()), so on some machines "abs(cs_nsec - w=
d_nsec)
> > > > WATCHDOG_THRESHOLD", WATCHDOG_THRESHOLD is set too small at that ti=
me.
> > > After TSC calibrated, abs(cs_nsec - wd_nsec) should be very small,
> > > WATCHDOG_THRESHOLD for here is ok. So I suggest increasing the
> > > WATCHDOG_THRESHOLD before TSC calibration, for example, the clocks be=
 skewed
> > > by more than 1% to be marked unstable.
> =

> This is common code, so we do need an architecture-independent way to
> handle this.
> =

> > As Zhengjun measuered, this is a Cascade Lake platform, and it has 2
> > times calibration of tsc, the first one of early quick calibration gives
> > 2100 MHz, while the later accurate calibration gives 2095 MHz, so there
> > is about 2.5/1000 deviation for the first number, which just exceeds the
> > 1/1000 threshold you set :)
> =

> Even my 2/1000 initial try would have caused this, then.  ;-)
> =

> But even 1/1000 deviation would cause any number of applications some
> severe heartburn, so I am not at all happy with the thought of globally
> increasing to (say) 3/1000.
> =

> > Following is the tsc freq info from kernel log
> > =

> > [    0.000000] DMI: Intel Corporation S2600WFT/S2600WFT, BIOS SE5C620.8=
6B.02.01.0008.031920191559 03/19/2019
> > [    0.000000] tsc: Detected 2100.000 MHz processor
> > ...
> > [   13.859982] tsc: Refined TSC clocksource calibration: 2095.077 MHz
> =

> So what are our options?
> =

> 1.	Clear CLOCK_SOURCE_MUST_VERIFY from tsc-early.
> =

> 2.	#1, but add tsc-early into the watchdog list and set
> 	CLOCK_SOURCE_MUST_VERIFY once it is better calibrated.
> =

> 3.	Add a field to struct clocksource that, if non-zero, gives
> 	the maximum drift in nanoseconds per half second (AKA
> 	WATCHDOG_INTERVAL).  If zero, the WATCHDOG_MAX_SKEW value
> 	is used.  Set this to (say) 150,000ns for tsc-early.
> =

> 4.	As noted earlier, increase WATCHDOG_MAX_SKEW to 150 microseconds,
> 	which again is not a good approach given the real-world needs
> 	of real-world applications.
> =

> 5.	Your ideas here.

Oh, and:

6.	Improve the quick calibration to be better than one part per thousand.

> All in all, I am glad that I made the patch that decreases
> WATCHDOG_MAX_SKEW be separate and at the end of the series.  ;-)

							Thanx, Paul
--===============3330853183539114823==--

