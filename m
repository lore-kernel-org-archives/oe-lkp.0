Content-Type: multipart/mixed; boundary="===============3757690656401699824=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [clocksource] 6c52b5f3cf: stress-ng.opcode.ops_per_sec -14.4% regression
Date: Sun, 25 Apr 2021 10:14:38 +0800
Message-ID: <20210425021438.GA2942@shbuild999.sh.intel.com>
In-Reply-To: <20210424175322.GS975577@paulmck-ThinkPad-P17-Gen-1>
List-Id: <oe-lkp.lists.linux.dev>

--===============3757690656401699824==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 24, 2021 at 10:53:22AM -0700, Paul E. McKenney wrote:
> On Sat, Apr 24, 2021 at 08:29:20PM +0800, Feng Tang wrote:
> > Hi Paul,
> > =

> > On Fri, Apr 23, 2021 at 07:02:54AM -0700, Paul E. McKenney wrote:
> > [...]
> > > > > > > Following is the tsc freq info from kernel log
> > > > > > > =

> > > > > > > [    0.000000] DMI: Intel Corporation S2600WFT/S2600WFT, BIOS=
 SE5C620.86B.02.01.0008.031920191559 03/19/2019
> > > > > > > [    0.000000] tsc: Detected 2100.000 MHz processor
> > > > > > > ...
> > > > > > > [   13.859982] tsc: Refined TSC clocksource calibration: 2095=
.077 MHz
> > > > > > =

> > > > > > So what are our options?
> > > > > > =

> > > > > > 1.	Clear CLOCK_SOURCE_MUST_VERIFY from tsc-early.
> > > > > > =

> > > > =

> > > > I think option 1 is fine, as tsc will still get checked once 'tsc'
> > > > clocksource is registered, but Thomas and Peter should know more
> > > > background and corner cases of tsc.
> > > =

> > > I will look at adding such a patch to my series, preceding the change
> > > to 1/1000 deviation.
> > > =

> > > > Also we have been working on another patchset to skip watchdog check
> > > > for x86 platforms with stable tsc:
> > > > =

> > > > https://lore.kernel.org/lkml/1618291897-71581-1-git-send-email-feng=
.tang(a)intel.com/
> > > > https://lore.kernel.org/lkml/1618291897-71581-2-git-send-email-feng=
.tang(a)intel.com/
> > > =

> > > It will be interesting to see what fraction of those with large numbe=
rs
> > > of systems choose to revert your 2/2, and for what period of time.
> > > You really needed my clocksource patch series to have been in place s=
ome
> > > years back so that people wouldn't have been seeing the false-postive
> > > clock-skew complaints.  Those complaints did not help people build up
> > > their trust in the TSC.  :-/
> > =

> > I read you patchset, and I think the recheck to avoid false alarm makes
> > sense to me, as well as the debug method you adds, and they have no
> > conflict with my patches which tends to newer x86 platforms only.
> =

> Would you be willing to give your Tested-by, Acked-by, or Reviewed-by
> to those patches?

I haven't ack because I'm afraid I may overlook some corner case as I
don't have the overall picture of it.

And I will check more and do some tests on them.

> Obviously, you would not be willing to do so for the patch that reduces
> the skew threshold, at least not until my most recent patch is beaten
> into shape.

I still tend to agree with Zhengjun's 1/100 suggestion, though that
may not be safe enough :)

> > And yes, I only have met and debugged tsc wrongly marked unstable cases
> > on several clients platforms, and in one case I disabled the HPET for
> > Baytrail 10 years ago. Our test farm has different kinds of servers,
> > only up to 4 sockets and 192 CPUs, where no tsc unstable issue has been
> > seen.
> =

> That is encouraging, but how many systems are in your test farm?

Good point, we only have less than 20 servers, which is tiny comparing
to the real server centers.


> > And I'm eager to know if there is any real case of an unreliable tsc
> > on the 'large numbers' of x86 system which complies with our cpu feature
> > check. And if there is, my 2/2 definitely should be dropped.   =

> =

> If you have enough systems, you see all sorts of strange things just
> due to the normal underlying failure rate of hardware.
> =

> So my question is instead whether we will see any TSC failures
> unaccompanied by any other signs of trouble.
> =

> And if your 2/2 goes in, those who still distrust TSC will simply
> revert it.  In their defense, their distrust was built up over a very
> long period of time for very good reasons.
> =

> > > This last sentence is not a theoretical statement.  In the past, I ha=
ve
> > > suggested using the existing "tsc=3Dreliable" kernel boot parameter,
> > > which disables watchdogs on TSC, similar to your patch 2/2 above.
> > > The discussion was short and that boot parameter was not set.  And the
> > > discussion motivated to my current clocksource series.  ;-)
> > > =

> > > I therefore suspect that someone will want a "tsc=3Dunreliable" boot
> > > parameter (or similar) to go with your patch 2/2.
> >  =

> > Possibly :)
> > =

> > But I wonder if tsc is disabled on that 'large system', what will be
> > used instead? HPET is known to be much slower for clocksource, as shown
> > in this regression report :) not mentioning the 'acpi_pm' timer. =

> =

> Indeed, the default switch to HPET often causes the system to be taken
> out of service due to the resulting performance shortfall.  There is
> of course some automated recovery, and no, I am not familiar with the
> details, but I suspect that a simple reboot is an early recovery step.
> However, if the problem were to persist, the system would of course be
> considered to be permanently broken.

Thanks for the info, if a sever is taken out of service just because
of a false alarm of tsc, then it's a big waste!

> > Again, I want to know the real tsc unstable case. I have spent lots
> > of time searching these info from git logs and mail archives before
> > writing the patches.
> =

> So do I, which is why I put together this patch series.  My employer has
> a fairly strict upstream-first for things like this which are annoyances
> that are likely hiding other bugs, but which are not causing significant
> outages, which was of course the motivation for the fault-injection
> patches.
> =

> As I said earlier, it would have been very helpful to you for a patch
> series like this to have been applied many years ago.  If it had been,
> we would already have the failure-rate data that you requested.  And of
> course if that failure-rate data indicated that TSC was reliable, there
> would be far fewer people still distrusting TSC.
 =

Yes, if they can share the detailed info (like what's the 'watchdog')
and debug info, it can enable people to debug and root cause the
problem to be a false alarm or a real silicon platform. Personally, for
newer platforms I tend to trust tsc much more than other clocksources.

Thanks,
Feng

> 							Thanx, Paul
--===============3757690656401699824==--

