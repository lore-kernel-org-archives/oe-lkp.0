Content-Type: multipart/mixed; boundary="===============1712627951442034487=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [clocksource] 6c52b5f3cf: stress-ng.opcode.ops_per_sec -14.4% regression
Date: Thu, 22 Apr 2021 15:41:26 +0800
Message-ID: <20210422074126.GA85095@shbuild999.sh.intel.com>
In-Reply-To: <ed77d2a5-aeb0-b7f5-ce91-4cac12cfdd61@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1712627951442034487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Thu, Apr 22, 2021 at 02:58:27PM +0800, Xing Zhengjun wrote:
> =

> =

> On 4/21/2021 9:42 PM, Paul E. McKenney wrote:
> >On Wed, Apr 21, 2021 at 02:07:19PM +0800, Xing, Zhengjun wrote:
> >>
> >>On 4/20/2021 10:05 PM, Paul E. McKenney wrote:
> >>>On Tue, Apr 20, 2021 at 06:43:31AM -0700, Paul E. McKenney wrote:
> >>>>On Tue, Apr 20, 2021 at 02:49:34PM +0800, kernel test robot wrote:
> >>>>>Greeting,
> >>>>>
> >>>>>FYI, we noticed a -14.4% regression of stress-ng.opcode.ops_per_sec =
due to commit:
> >>>>>
> >>>>>
> >>>>>commit: 6c52b5f3cfefd6e429efc4413fd25e3c394e959f ("clocksource: Redu=
ce WATCHDOG_THRESHOLD")
> >>>>>https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.git d=
ev.2021.04.13a
> >>>>>
> >>>>>
> >>>>>in testcase: stress-ng
> >>>>>on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz=
 with 192G memory
> >>>>>with following parameters:
> >>>>>
> >>>>>	nr_threads: 10%
> >>>>>	disk: 1HDD
> >>>>>	testtime: 60s
> >>>>>	fs: ext4
> >>>>>	class: os
> >>>>>	test: opcode
> >>>>>	cpufreq_governor: performance
> >>>>>	ucode: 0x5003006
> >>>>Hmmm...  I will try a less-aggressive reduction.  Thank you for testi=
ng!
> >>>But wait...  This code is only running twice per second.  It is very
> >>>hard to believe that a clock-read retry twice per second is worth 2% of
> >>>performance, let alone 14.4%.
> >>>
> >>>Is something else perhaps going on here?
> >>>
> >>>For example, did this run enable any of the new diagnositic clocksourc=
e.*
> >>>kernel parameters?
> >>>
> >>>								Thanx, Paul
> >>I attached the kernel log, the following logs are related with the
> >>clocksource.
> >>[=C2=A0=C2=A0=C2=A0 3.453206] clocksource: timekeeping watchdog on CPU1=
: Marking
> >>clocksource 'tsc-early' as unstable because the skew is too large:
> >>[=C2=A0=C2=A0=C2=A0 3.455197] clocksource:=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'hpet' wd_now: 288fcc0
> >>wd_last: 1a8b333 mask: ffffffff
> >>[=C2=A0=C2=A0=C2=A0 3.455199] clocksource:=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'tsc-early' cs_now:
> >>1def309ebfdee cs_last: 1def2bd70d92c mask: ffffffffffffffff
> >>[=C2=A0=C2=A0=C2=A0 3.455201] clocksource:=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 No current clocksource.
> >>[=C2=A0=C2=A0=C2=A0 3.457197] tsc: Marking TSC unstable due to clocksou=
rce watchdog
> >>
> >>6c52b5f3cf reduced WATCHDOG_THRESHOLD, then in clocksource_watchdog, the
> >>warning logs are print, the TSC is marked as unstable.
> >>/* Check the deviation from the watchdog clocksource. */
> >Aha, so this system really does have an unstable TSC!  Which means that
> >the patch is operating as designed.
> >
> >Or are you saying that this is a false positive?
> >
> >							Thanx, Paul
> =

> It happened during boot and before TSC calibration
> (tsc_refine_calibration_work()), so on some machines "abs(cs_nsec - wd_ns=
ec)
> > WATCHDOG_THRESHOLD", WATCHDOG_THRESHOLD is set too small at that time.
> After TSC calibrated, abs(cs_nsec - wd_nsec) should be very small,
> WATCHDOG_THRESHOLD for here is ok. So I suggest increasing the
> WATCHDOG_THRESHOLD before TSC calibration, for example, the clocks be ske=
wed
> by more than 1% to be marked unstable.

As Zhengjun measuered, this is a Cascade Lake platform, and it has 2
times calibration of tsc, the first one of early quick calibration gives
2100 MHz, while the later accurate calibration gives 2095 MHz, so there
is about 2.5/1000 deviation for the first number, which just exceeds the
1/1000 threshold you set :)

Following is the tsc freq info from kernel log

[    0.000000] DMI: Intel Corporation S2600WFT/S2600WFT, BIOS SE5C620.86B.0=
2.01.0008.031920191559 03/19/2019
[    0.000000] tsc: Detected 2100.000 MHz processor
...
[   13.859982] tsc: Refined TSC clocksource calibration: 2095.077 MHz

Thanks,
Feng

--===============1712627951442034487==--

