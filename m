Content-Type: multipart/mixed; boundary="===============0168430985711649308=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [clocksource] 388450c708: netperf.Throughput_tps -65.1% regression
Date: Wed, 19 May 2021 21:55:29 -0700
Message-ID: <20210520045529.GH4441@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20210520005210.GA18083@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0168430985711649308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 20, 2021 at 08:52:10AM +0800, Feng Tang wrote:
> On Wed, May 19, 2021 at 11:05:21AM -0700, Paul E. McKenney wrote:
> > On Wed, May 19, 2021 at 02:09:02PM +0800, Feng Tang wrote:
> > > On Sun, May 16, 2021 at 02:34:19PM +0800, Feng Tang wrote:
> > > > On Fri, May 14, 2021 at 10:49:08AM -0700, Paul E. McKenney wrote:
> > > > > On Fri, May 14, 2021 at 03:43:14PM +0800, Feng Tang wrote:
> > > > > > Hi Paul,
> > > > > > =

> > > > > > On Thu, May 13, 2021 at 10:07:07AM -0700, Paul E. McKenney wrot=
e:
> > > > > > > On Thu, May 13, 2021 at 11:55:15PM +0800, kernel test robot w=
rote:
> > > > > > > > =

> > > > > > > > =

> > > > > > > > Greeting,
> > > > > > > > =

> > > > > > > > FYI, we noticed a -65.1% regression of netperf.Throughput_t=
ps due to commit:
> > > > > > > > =

> > > > > > > > =

> > > > > > > > commit: 388450c7081ded73432e2b7148c1bb9a0b039963 ("[PATCH v=
12 clocksource 4/5] clocksource: Reduce clocksource-skew threshold for TSC")
> > > > > > > > url: https://github.com/0day-ci/linux/commits/Paul-E-McKenn=
ey/Do-not-mark-clocks-unstable-due-to-delays-for-v5-13/20210501-083404
> > > > > > > > base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.=
git 2d036dfa5f10df9782f5278fc591d79d283c1fad
> > > > > > > > =

> > > > > > > > in testcase: netperf
> > > > > > > > on test machine: 96 threads 2 sockets Ice Lake with 256G me=
mory
> > > > > > > > with following parameters:
> > > > > > > > =

> > > > > > > > 	ip: ipv4
> > > > > > > > 	runtime: 300s
> > > > > > > > 	nr_threads: 25%
> > > > > > > > 	cluster: cs-localhost
> > > > > > > > 	test: UDP_RR
> > > > > > > > 	cpufreq_governor: performance
> > > > > > > > 	ucode: 0xb000280
> > > > > > > > =

> > > > > > > > test-description: Netperf is a benchmark that can be use to=
 measure various aspect of networking performance.
> > > > > > > > test-url: http://www.netperf.org/netperf/
> > > > > > > > =

> > > > > > > > =

> > > > > > > > =

> > > > > > > > If you fix the issue, kindly add following tag
> > > > > > > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > > > > > =

> > > > > > > > =

> > > > > > > > also as Feng Tang checked, this is a "unstable clocksource"=
 case.
> > > > > > > > attached dmesg FYI.
> > > > > > > =

> > > > > > > Agreed, given the clock-skew event and the resulting switch t=
o HPET,
> > > > > > > performance regressions are expected behavior.
> > > > > > > =

> > > > > > > That dmesg output does demonstrate the value of Feng Tang's p=
atch!
> > > > > > > =

> > > > > > > I don't see how to obtain the values of ->mult and ->shift th=
at would
> > > > > > > allow me to compute the delta.  So if you don't tell me other=
wise, I
> > > > > > > will assume that the skew itself was expected on this hardwar=
e, perhaps
> > > > > > > somehow due to the tpm_tis_status warning immediately precedi=
ng the
> > > > > > > clock-skew event.  If my assumption is incorrect, please let =
me know.
> > > > > > =

> > > > > > I run the case with the debug patch applied, the info is:
> > > > > > =

> > > > > > [   13.796429] clocksource: timekeeping watchdog on CPU19: Mark=
ing clocksource 'tsc' as unstable because the skew is too large:
> > > > > > [   13.797413] clocksource:                       'hpet' wd_nes=
c: 505192062 wd_now: 10657158 wd_last: fac6f97 mask: ffffffff
> > > > > > [   13.797413] clocksource:                       'tsc' cs_nsec=
: 504008008 cs_now: 3445570292aa5 cs_last: 344551f0cad6f mask: ffffffffffff=
ffff
> > > > > > [   13.797413] clocksource:                       'tsc' is curr=
ent clocksource.
> > > > > > [   13.797413] tsc: Marking TSC unstable due to clocksource wat=
chdog
> > > > > > [   13.844513] clocksource: Checking clocksource tsc synchroniz=
ation from CPU 50 to CPUs 0-1,12,22,32-33,60,65.
> > > > > > [   13.855080] clocksource: Switched to clocksource hpet
> > > > > > =

> > > > > > So the delta is 1184 us (505192062 - 504008008), and I agree wi=
th
> > > > > > you that it should be related with the tpm_tis_status warning s=
tuff.
> > > > > > =

> > > > > > But this re-trigger my old concerns, that if the margins calcul=
ated
> > > > > > for tsc, hpet are too small?
> > > > > =

> > > > > If the error really did disturb either tsc or hpet, then we really
> > > > > do not have a false positive, and nothing should change (aside fr=
om
> > > > > perhaps documenting that TPM issues can disturb the clocks, or be=
tter
> > > > > yet treating that perturbation as a separate bug that should be f=
ixed).
> > > > > But if this is yet another way to get a confused measurement, the=
n it
> > > > > would be better to work out a way to reject the confusion and kee=
p the
> > > > > tighter margins.  I cannot think right off of a way that this cou=
ld
> > > > > cause measurement confusion, but you never know.
> > > > =

> > > > I have no doubt in the correctness of the measuring method, but was
> > > > just afraid some platforms which use to 'just work' will be caught =
:)
> > > > =

> > > > > So any thoughts on exactly how the tpm_tis_status warning might h=
ave
> > > > > resulted in the skew?
> > > > =

> > > > The tpm error message has been reported before, and from google the=
re
> > > > were some similar errors, we'll do some further check.
> > > =

> > > Some update on this: further debug shows it is not related to TPM =

> > > module, as the 'unstable' still happens even if we disable TPM
> > > module in kernel.
> > > =

> > > We run this case on another test box of same type but with latest =

> > > BIOS and microcode, the tsc freq is correctly calculated and the =

> > > 'unstable' error can't be reproduced. And we will check how to =

> > > upgrade the test box in 0day.
> > =

> > So this patch series might have located a real BIOS or firmware bug,
> > then?  ;-)
> =

> Yes, it did a good job in exposing a real-world bug! (lucky
> thing is the bug has a fix :)) =


Even better!  ;-)

							Thanx, Paul
--===============0168430985711649308==--

