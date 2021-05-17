Content-Type: multipart/mixed; boundary="===============0824776666484272625=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [clocksource] 388450c708: netperf.Throughput_tps -65.1% regression
Date: Sun, 16 May 2021 19:30:39 -0700
Message-ID: <20210517023039.GE4441@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20210516063419.GA22111@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0824776666484272625==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 16, 2021 at 02:34:19PM +0800, Feng Tang wrote:
> On Fri, May 14, 2021 at 10:49:08AM -0700, Paul E. McKenney wrote:
> > On Fri, May 14, 2021 at 03:43:14PM +0800, Feng Tang wrote:
> > > Hi Paul,
> > > =

> > > On Thu, May 13, 2021 at 10:07:07AM -0700, Paul E. McKenney wrote:
> > > > On Thu, May 13, 2021 at 11:55:15PM +0800, kernel test robot wrote:
> > > > > =

> > > > > =

> > > > > Greeting,
> > > > > =

> > > > > FYI, we noticed a -65.1% regression of netperf.Throughput_tps due=
 to commit:
> > > > > =

> > > > > =

> > > > > commit: 388450c7081ded73432e2b7148c1bb9a0b039963 ("[PATCH v12 clo=
cksource 4/5] clocksource: Reduce clocksource-skew threshold for TSC")
> > > > > url: https://github.com/0day-ci/linux/commits/Paul-E-McKenney/Do-=
not-mark-clocks-unstable-due-to-delays-for-v5-13/20210501-083404
> > > > > base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git 2d=
036dfa5f10df9782f5278fc591d79d283c1fad
> > > > > =

> > > > > in testcase: netperf
> > > > > on test machine: 96 threads 2 sockets Ice Lake with 256G memory
> > > > > with following parameters:
> > > > > =

> > > > > 	ip: ipv4
> > > > > 	runtime: 300s
> > > > > 	nr_threads: 25%
> > > > > 	cluster: cs-localhost
> > > > > 	test: UDP_RR
> > > > > 	cpufreq_governor: performance
> > > > > 	ucode: 0xb000280
> > > > > =

> > > > > test-description: Netperf is a benchmark that can be use to measu=
re various aspect of networking performance.
> > > > > test-url: http://www.netperf.org/netperf/
> > > > > =

> > > > > =

> > > > > =

> > > > > If you fix the issue, kindly add following tag
> > > > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > > =

> > > > > =

> > > > > also as Feng Tang checked, this is a "unstable clocksource" case.
> > > > > attached dmesg FYI.
> > > > =

> > > > Agreed, given the clock-skew event and the resulting switch to HPET,
> > > > performance regressions are expected behavior.
> > > > =

> > > > That dmesg output does demonstrate the value of Feng Tang's patch!
> > > > =

> > > > I don't see how to obtain the values of ->mult and ->shift that wou=
ld
> > > > allow me to compute the delta.  So if you don't tell me otherwise, I
> > > > will assume that the skew itself was expected on this hardware, per=
haps
> > > > somehow due to the tpm_tis_status warning immediately preceding the
> > > > clock-skew event.  If my assumption is incorrect, please let me kno=
w.
> > > =

> > > I run the case with the debug patch applied, the info is:
> > > =

> > > [   13.796429] clocksource: timekeeping watchdog on CPU19: Marking cl=
ocksource 'tsc' as unstable because the skew is too large:
> > > [   13.797413] clocksource:                       'hpet' wd_nesc: 505=
192062 wd_now: 10657158 wd_last: fac6f97 mask: ffffffff
> > > [   13.797413] clocksource:                       'tsc' cs_nsec: 5040=
08008 cs_now: 3445570292aa5 cs_last: 344551f0cad6f mask: ffffffffffffffff
> > > [   13.797413] clocksource:                       'tsc' is current cl=
ocksource.
> > > [   13.797413] tsc: Marking TSC unstable due to clocksource watchdog
> > > [   13.844513] clocksource: Checking clocksource tsc synchronization =
from CPU 50 to CPUs 0-1,12,22,32-33,60,65.
> > > [   13.855080] clocksource: Switched to clocksource hpet
> > > =

> > > So the delta is 1184 us (505192062 - 504008008), and I agree with
> > > you that it should be related with the tpm_tis_status warning stuff.
> > > =

> > > But this re-trigger my old concerns, that if the margins calculated
> > > for tsc, hpet are too small?
> > =

> > If the error really did disturb either tsc or hpet, then we really
> > do not have a false positive, and nothing should change (aside from
> > perhaps documenting that TPM issues can disturb the clocks, or better
> > yet treating that perturbation as a separate bug that should be fixed).
> > But if this is yet another way to get a confused measurement, then it
> > would be better to work out a way to reject the confusion and keep the
> > tighter margins.  I cannot think right off of a way that this could
> > cause measurement confusion, but you never know.
> =

> I have no doubt in the correctness of the measuring method, but was
> just afraid some platforms which use to 'just work' will be caught :)

Quite possibly.  On the other hand, there might also be some platforms
on which applications have been behaving in subtle and strange ways,
and this series might be very helpful in such cases.

> > So any thoughts on exactly how the tpm_tis_status warning might have
> > resulted in the skew?
> =

> The tpm error message has been reported before, and from google there
> were some similar errors, we'll do some further check.

Thnak you!

> > > With current math algorithm, the 'uncertainty_margin' is
> > > calculated against the frequency, and those tsc/hpet/acpi_pm
> > > timer is multiple of MHz or GHz, which gives them to have margin of
> > > 100 us. It works with normal systems. But in the wild world, there
> > > could be some sparkles due to some immature HW components, their
> > > firmwares or drivers etc, just like this case. =

> > =

> > Isn't diagnosing issues from immature hardware, firmware, and drivers
> > actually a benefit?  It would after all be quite unfortunate if some is=
sue
> > that was visible only due to clock skew were to escape into production.
> =

> Yes, it surely will expose some mal-functional cases which haven't
> been caught before.

Here is hoping!

							Thanx, Paul
--===============0824776666484272625==--

