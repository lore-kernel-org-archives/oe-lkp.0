Content-Type: multipart/mixed; boundary="===============4203777702416678425=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [clocksource] 388450c708: netperf.Throughput_tps -65.1% regression
Date: Fri, 14 May 2021 15:43:14 +0800
Message-ID: <20210514074314.GB5384@shbuild999.sh.intel.com>
In-Reply-To: <20210513170707.GA975577@paulmck-ThinkPad-P17-Gen-1>
List-Id: <oe-lkp.lists.linux.dev>

--===============4203777702416678425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Thu, May 13, 2021 at 10:07:07AM -0700, Paul E. McKenney wrote:
> On Thu, May 13, 2021 at 11:55:15PM +0800, kernel test robot wrote:
> > =

> > =

> > Greeting,
> > =

> > FYI, we noticed a -65.1% regression of netperf.Throughput_tps due to co=
mmit:
> > =

> > =

> > commit: 388450c7081ded73432e2b7148c1bb9a0b039963 ("[PATCH v12 clocksour=
ce 4/5] clocksource: Reduce clocksource-skew threshold for TSC")
> > url: https://github.com/0day-ci/linux/commits/Paul-E-McKenney/Do-not-ma=
rk-clocks-unstable-due-to-delays-for-v5-13/20210501-083404
> > base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git 2d036dfa=
5f10df9782f5278fc591d79d283c1fad
> > =

> > in testcase: netperf
> > on test machine: 96 threads 2 sockets Ice Lake with 256G memory
> > with following parameters:
> > =

> > 	ip: ipv4
> > 	runtime: 300s
> > 	nr_threads: 25%
> > 	cluster: cs-localhost
> > 	test: UDP_RR
> > 	cpufreq_governor: performance
> > 	ucode: 0xb000280
> > =

> > test-description: Netperf is a benchmark that can be use to measure var=
ious aspect of networking performance.
> > test-url: http://www.netperf.org/netperf/
> > =

> > =

> > =

> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > =

> > =

> > also as Feng Tang checked, this is a "unstable clocksource" case.
> > attached dmesg FYI.
> =

> Agreed, given the clock-skew event and the resulting switch to HPET,
> performance regressions are expected behavior.
> =

> That dmesg output does demonstrate the value of Feng Tang's patch!
> =

> I don't see how to obtain the values of ->mult and ->shift that would
> allow me to compute the delta.  So if you don't tell me otherwise, I
> will assume that the skew itself was expected on this hardware, perhaps
> somehow due to the tpm_tis_status warning immediately preceding the
> clock-skew event.  If my assumption is incorrect, please let me know.

I run the case with the debug patch applied, the info is:

[   13.796429] clocksource: timekeeping watchdog on CPU19: Marking clocksou=
rce 'tsc' as unstable because the skew is too large:
[   13.797413] clocksource:                       'hpet' wd_nesc: 505192062=
 wd_now: 10657158 wd_last: fac6f97 mask: ffffffff
[   13.797413] clocksource:                       'tsc' cs_nsec: 504008008 =
cs_now: 3445570292aa5 cs_last: 344551f0cad6f mask: ffffffffffffffff
[   13.797413] clocksource:                       'tsc' is current clocksou=
rce.
[   13.797413] tsc: Marking TSC unstable due to clocksource watchdog
[   13.844513] clocksource: Checking clocksource tsc synchronization from C=
PU 50 to CPUs 0-1,12,22,32-33,60,65.
[   13.855080] clocksource: Switched to clocksource hpet

So the delta is 1184 us (505192062 - 504008008), and I agree with
you that it should be related with the tpm_tis_status warning stuff.

But this re-trigger my old concerns, that if the margins calculated
for tsc, hpet are too small?

With current math algorithm, the 'uncertainty_margin' is
calculated against the frequency, and those tsc/hpet/acpi_pm
timer is multiple of MHz or GHz, which gives them to have margin of
100 us. It works with normal systems. But in the wild world, there
could be some sparkles due to some immature HW components, their
firmwares or drivers etc, just like this case. =


Thanks,
Feng


> 							Thanx, Paul
>=20
--===============4203777702416678425==--

