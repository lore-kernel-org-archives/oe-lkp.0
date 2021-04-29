Content-Type: multipart/mixed; boundary="===============1051997159024129325=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8c30ace35d: WARNING:at_kernel/time/clocksource.c:#clocksource_watchdog
Date: Thu, 29 Apr 2021 15:38:16 +0800
Message-ID: <20210429073816.GA317@shbuild999.sh.intel.com>
In-Reply-To: <871raumjj4.ffs@nanos.tec.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============1051997159024129325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 07:00:15PM +0200, Thomas Gleixner wrote:
> On Wed, Apr 28 2021 at 17:39, Peter Zijlstra wrote:
> > On Wed, Apr 28, 2021 at 03:34:52PM +0200, Thomas Gleixner wrote:
> >> #4 is the easy case because we can check MSR_TSC_ADJUST to figure out
> >>    whether something has written to MSR_TSC or MSR_TSC_ADJUST and undo
> >>    the damage in a sane way.
> >
> > This is after the fact though; userspace (and kernel space) will have
> > observed non-linear time and things will be broken in various subtle and
> > hard to tell ways.
> =

> What I observed in the recent past is that _IF_ that happens it's a
> small amount of cycles so it's not a given that this can be observed
> accross CPUs. But yes, it's daft.

Currently when tsc_adjust overriden is detected, the warning msg is
"[Firmware Bug]: TSC ADJUST differs: CPU%u %lld --> %lld. Restoring",
which is kind of gentle. With Borislav's patch of preventing user space
from writing to tsc_adjust msr, the warning could be stronger? Adding
something after that like: =


"Writing to TSC_ADJUST MSR is dangerous, and may cause the lost of
your best clocksource: tsc, please check with your BIOS/OS vendors"

Thanks,
Feng

> >> I can live with that and maybe we should have done that 15 years ago
> >> instead of trying to work around it at the symptom level.
> >
> > Anybody that still has runtime BIOS wreckage will then silently suffer
> > nonlinear time, doubly so for anybody not having TSC_ADJUST. Are we sure
> > we can tell them all to bugger off and buy new hardware?
> >
> > At the very least we need something like tsc=3Dbroken, to explicitly ma=
rk
> > TSC bad on machines, so that people that see TSC fail on their current
> > kernels can continue to use the new kernels. This requires a whole lot
> > of care on the part of users though, and will raise a ruckus, because I
> > bet a fair number of these people are not even currently aware we're
> > disabling TSC for them :/
> =

> I'm still allowed to dream, right? :)
> =

> Thanks,
> =

>         tglx
--===============1051997159024129325==--

