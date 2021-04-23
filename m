Content-Type: multipart/mixed; boundary="===============4706403760940640233=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [clocksource] 6c52b5f3cf: stress-ng.opcode.ops_per_sec -14.4% regression
Date: Fri, 23 Apr 2021 07:02:54 -0700
Message-ID: <20210423140254.GM975577@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20210423061115.GA62813@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4706403760940640233==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 02:11:15PM +0800, Feng Tang wrote:
> On Thu, Apr 22, 2021 at 09:57:43AM -0700, Paul E. McKenney wrote:
> > On Thu, Apr 22, 2021 at 07:24:54AM -0700, Paul E. McKenney wrote:
> > > On Thu, Apr 22, 2021 at 03:41:26PM +0800, Feng Tang wrote:
> > > > Hi Paul,
> > > > =

> > > > On Thu, Apr 22, 2021 at 02:58:27PM +0800, Xing Zhengjun wrote:
> > > > > =

> > > > > =

> > > > > On 4/21/2021 9:42 PM, Paul E. McKenney wrote:
> > > > > >On Wed, Apr 21, 2021 at 02:07:19PM +0800, Xing, Zhengjun wrote:
> > > > > >>
> > > > > >>On 4/20/2021 10:05 PM, Paul E. McKenney wrote:
> > > > > >>>On Tue, Apr 20, 2021 at 06:43:31AM -0700, Paul E. McKenney wro=
te:
> > > > > >>>>On Tue, Apr 20, 2021 at 02:49:34PM +0800, kernel test robot w=
rote:
> > > > > >>>>>Greeting,
> > > > > >>>>>
> > > > > >>>>>FYI, we noticed a -14.4% regression of stress-ng.opcode.ops_=
per_sec due to commit:
> > > > > >>>>>
> > > > > >>>>>
> > > > > >>>>>commit: 6c52b5f3cfefd6e429efc4413fd25e3c394e959f ("clocksour=
ce: Reduce WATCHDOG_THRESHOLD")
> > > > > >>>>>https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-r=
cu.git dev.2021.04.13a
> > > > > >>>>>
> > > > > >>>>>
> > > > > >>>>>in testcase: stress-ng
> > > > > >>>>>on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @=
 2.10GHz with 192G memory
> > > > > >>>>>with following parameters:
> > > > > >>>>>
> > > > > >>>>>	nr_threads: 10%
> > > > > >>>>>	disk: 1HDD
> > > > > >>>>>	testtime: 60s
> > > > > >>>>>	fs: ext4
> > > > > >>>>>	class: os
> > > > > >>>>>	test: opcode
> > > > > >>>>>	cpufreq_governor: performance
> > > > > >>>>>	ucode: 0x5003006
> > > > > >>>>Hmmm...  I will try a less-aggressive reduction.  Thank you f=
or testing!
> > > > > >>>But wait...  This code is only running twice per second.  It i=
s very
> > > > > >>>hard to believe that a clock-read retry twice per second is wo=
rth 2% of
> > > > > >>>performance, let alone 14.4%.
> > > > > >>>
> > > > > >>>Is something else perhaps going on here?
> > > > > >>>
> > > > > >>>For example, did this run enable any of the new diagnositic cl=
ocksource.*
> > > > > >>>kernel parameters?
> > > > > >>>
> > > > > >>>								Thanx, Paul
> > > > > >>I attached the kernel log, the following logs are related with =
the
> > > > > >>clocksource.
> > > > > >>[=C2=A0=C2=A0=C2=A0 3.453206] clocksource: timekeeping watchdog=
 on CPU1: Marking
> > > > > >>clocksource 'tsc-early' as unstable because the skew is too lar=
ge:
> > > > > >>[=C2=A0=C2=A0=C2=A0 3.455197] clocksource:=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'hpet' wd_now: 288fcc0
> > > > > >>wd_last: 1a8b333 mask: ffffffff
> > > > > >>[=C2=A0=C2=A0=C2=A0 3.455199] clocksource:=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'tsc-early' cs_now:
> > > > > >>1def309ebfdee cs_last: 1def2bd70d92c mask: ffffffffffffffff
> > > > > >>[=C2=A0=C2=A0=C2=A0 3.455201] clocksource:=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 No current clocksource.
> > > > > >>[=C2=A0=C2=A0=C2=A0 3.457197] tsc: Marking TSC unstable due to =
clocksource watchdog
> > > > > >>
> > > > > >>6c52b5f3cf reduced WATCHDOG_THRESHOLD, then in clocksource_watc=
hdog, the
> > > > > >>warning logs are print, the TSC is marked as unstable.
> > > > > >>/* Check the deviation from the watchdog clocksource. */
> > > > > >Aha, so this system really does have an unstable TSC!  Which mea=
ns that
> > > > > >the patch is operating as designed.
> > > > > >
> > > > > >Or are you saying that this is a false positive?
> > > > > >
> > > > > >							Thanx, Paul
> > > > > =

> > > > > It happened during boot and before TSC calibration
> > > > > (tsc_refine_calibration_work()), so on some machines "abs(cs_nsec=
 - wd_nsec)
> > > > > > WATCHDOG_THRESHOLD", WATCHDOG_THRESHOLD is set too small at tha=
t time.
> > > > > After TSC calibrated, abs(cs_nsec - wd_nsec) should be very small,
> > > > > WATCHDOG_THRESHOLD for here is ok. So I suggest increasing the
> > > > > WATCHDOG_THRESHOLD before TSC calibration, for example, the clock=
s be skewed
> > > > > by more than 1% to be marked unstable.
> > > =

> > > This is common code, so we do need an architecture-independent way to
> > > handle this.
> > > =

> > > > As Zhengjun measuered, this is a Cascade Lake platform, and it has 2
> > > > times calibration of tsc, the first one of early quick calibration =
gives
> > > > 2100 MHz, while the later accurate calibration gives 2095 MHz, so t=
here
> > > > is about 2.5/1000 deviation for the first number, which just exceed=
s the
> > > > 1/1000 threshold you set :)
> > > =

> > > Even my 2/1000 initial try would have caused this, then.  ;-)
> > > =

> > > But even 1/1000 deviation would cause any number of applications some
> > > severe heartburn, so I am not at all happy with the thought of global=
ly
> > > increasing to (say) 3/1000.
> > > =

> > > > Following is the tsc freq info from kernel log
> > > > =

> > > > [    0.000000] DMI: Intel Corporation S2600WFT/S2600WFT, BIOS SE5C6=
20.86B.02.01.0008.031920191559 03/19/2019
> > > > [    0.000000] tsc: Detected 2100.000 MHz processor
> > > > ...
> > > > [   13.859982] tsc: Refined TSC clocksource calibration: 2095.077 M=
Hz
> > > =

> > > So what are our options?
> > > =

> > > 1.	Clear CLOCK_SOURCE_MUST_VERIFY from tsc-early.
> > > =

> =

> I think option 1 is fine, as tsc will still get checked once 'tsc'
> clocksource is registered, but Thomas and Peter should know more
> background and corner cases of tsc.

I will look at adding such a patch to my series, preceding the change
to 1/1000 deviation.

> Also we have been working on another patchset to skip watchdog check
> for x86 platforms with stable tsc:
> =

> https://lore.kernel.org/lkml/1618291897-71581-1-git-send-email-feng.tang(=
a)intel.com/
> https://lore.kernel.org/lkml/1618291897-71581-2-git-send-email-feng.tang(=
a)intel.com/

It will be interesting to see what fraction of those with large numbers
of systems choose to revert your 2/2, and for what period of time.
You really needed my clocksource patch series to have been in place some
years back so that people wouldn't have been seeing the false-postive
clock-skew complaints.  Those complaints did not help people build up
their trust in the TSC.  :-/

This last sentence is not a theoretical statement.  In the past, I have
suggested using the existing "tsc=3Dreliable" kernel boot parameter,
which disables watchdogs on TSC, similar to your patch 2/2 above.
The discussion was short and that boot parameter was not set.  And the
discussion motivated to my current clocksource series.  ;-)

I therefore suspect that someone will want a "tsc=3Dunreliable" boot
parameter (or similar) to go with your patch 2/2.

							Thanx, Paul

> Thanks,
> Feng
> =

> > > 2.	#1, but add tsc-early into the watchdog list and set
> > > 	CLOCK_SOURCE_MUST_VERIFY once it is better calibrated.
> > > =

> > > 3.	Add a field to struct clocksource that, if non-zero, gives
> > > 	the maximum drift in nanoseconds per half second (AKA
> > > 	WATCHDOG_INTERVAL).  If zero, the WATCHDOG_MAX_SKEW value
> > > 	is used.  Set this to (say) 150,000ns for tsc-early.
> > > =

> > > 4.	As noted earlier, increase WATCHDOG_MAX_SKEW to 150 microseconds,
> > > 	which again is not a good approach given the real-world needs
> > > 	of real-world applications.
> > > =

> > > 5.	Your ideas here.
> > =

> > Oh, and:
> > =

> > 6.	Improve the quick calibration to be better than one part per thousan=
d.
> > =

> > > All in all, I am glad that I made the patch that decreases
> > > WATCHDOG_MAX_SKEW be separate and at the end of the series.  ;-)
> > =

> > 							Thanx, Paul
--===============4706403760940640233==--

