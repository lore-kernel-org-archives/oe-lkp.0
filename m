Content-Type: multipart/mixed; boundary="===============2211556984801378963=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [clocksource] 6c52b5f3cf: stress-ng.opcode.ops_per_sec -14.4% regression
Date: Sat, 24 Apr 2021 20:29:20 +0800
Message-ID: <20210424122920.GB85095@shbuild999.sh.intel.com>
In-Reply-To: <20210423140254.GM975577@paulmck-ThinkPad-P17-Gen-1>
List-Id: <oe-lkp.lists.linux.dev>

--===============2211556984801378963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Fri, Apr 23, 2021 at 07:02:54AM -0700, Paul E. McKenney wrote:
[...]
> > > > > Following is the tsc freq info from kernel log
> > > > > =

> > > > > [    0.000000] DMI: Intel Corporation S2600WFT/S2600WFT, BIOS SE5=
C620.86B.02.01.0008.031920191559 03/19/2019
> > > > > [    0.000000] tsc: Detected 2100.000 MHz processor
> > > > > ...
> > > > > [   13.859982] tsc: Refined TSC clocksource calibration: 2095.077=
 MHz
> > > > =

> > > > So what are our options?
> > > > =

> > > > 1.	Clear CLOCK_SOURCE_MUST_VERIFY from tsc-early.
> > > > =

> > =

> > I think option 1 is fine, as tsc will still get checked once 'tsc'
> > clocksource is registered, but Thomas and Peter should know more
> > background and corner cases of tsc.
> =

> I will look at adding such a patch to my series, preceding the change
> to 1/1000 deviation.
> =

> > Also we have been working on another patchset to skip watchdog check
> > for x86 platforms with stable tsc:
> > =

> > https://lore.kernel.org/lkml/1618291897-71581-1-git-send-email-feng.tan=
g(a)intel.com/
> > https://lore.kernel.org/lkml/1618291897-71581-2-git-send-email-feng.tan=
g(a)intel.com/
> =

> It will be interesting to see what fraction of those with large numbers
> of systems choose to revert your 2/2, and for what period of time.
> You really needed my clocksource patch series to have been in place some
> years back so that people wouldn't have been seeing the false-postive
> clock-skew complaints.  Those complaints did not help people build up
> their trust in the TSC.  :-/

I read you patchset, and I think the recheck to avoid false alarm makes
sense to me, as well as the debug method you adds, and they have no
conflict with my patches which tends to newer x86 platforms only.

And yes, I only have met and debugged tsc wrongly marked unstable cases
on several clients platforms, and in one case I disabled the HPET for
Baytrail 10 years ago. Our test farm has different kinds of servers,
only up to 4 sockets and 192 CPUs, where no tsc unstable issue has been
seen.

And I'm eager to know if there is any real case of an unreliable tsc
on the 'large numbers' of x86 system which complies with our cpu feature
check. And if there is, my 2/2 definitely should be dropped.   =


> This last sentence is not a theoretical statement.  In the past, I have
> suggested using the existing "tsc=3Dreliable" kernel boot parameter,
> which disables watchdogs on TSC, similar to your patch 2/2 above.
> The discussion was short and that boot parameter was not set.  And the
> discussion motivated to my current clocksource series.  ;-)
> =

> I therefore suspect that someone will want a "tsc=3Dunreliable" boot
> parameter (or similar) to go with your patch 2/2.
 =

Possibly :)

But I wonder if tsc is disabled on that 'large system', what will be
used instead? HPET is known to be much slower for clocksource, as shown
in this regression report :) not mentioning the 'acpi_pm' timer. =


Again, I want to know the real tsc unstable case. I have spent lots
of time searching these info from git logs and mail archives before
writing the patches.

Thanks,
Feng

> 							Thanx, Paul
--===============2211556984801378963==--

