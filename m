Content-Type: multipart/mixed; boundary="===============6149416197679881129=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [clocksource] 6c52b5f3cf: stress-ng.opcode.ops_per_sec -14.4% regression
Date: Sun, 25 Apr 2021 11:14:37 +0800
Message-ID: <20210425031437.GA38485@shbuild999.sh.intel.com>
In-Reply-To: <20210425021438.GA2942@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6149416197679881129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 25, 2021 at 10:14:38AM +0800, Feng Tang wrote:
> On Sat, Apr 24, 2021 at 10:53:22AM -0700, Paul E. McKenney wrote:
> > And if your 2/2 goes in, those who still distrust TSC will simply
> > revert it.  In their defense, their distrust was built up over a very
> > long period of time for very good reasons.
> > =

> > > > This last sentence is not a theoretical statement.  In the past, I =
have
> > > > suggested using the existing "tsc=3Dreliable" kernel boot parameter,
> > > > which disables watchdogs on TSC, similar to your patch 2/2 above.
> > > > The discussion was short and that boot parameter was not set.  And =
the
> > > > discussion motivated to my current clocksource series.  ;-)
> > > > =

> > > > I therefore suspect that someone will want a "tsc=3Dunreliable" boot
> > > > parameter (or similar) to go with your patch 2/2.
> > >  =

> > > Possibly :)
> > > =

> > > But I wonder if tsc is disabled on that 'large system', what will be
> > > used instead? HPET is known to be much slower for clocksource, as sho=
wn
> > > in this regression report :) not mentioning the 'acpi_pm' timer. =

> > =

> > Indeed, the default switch to HPET often causes the system to be taken
> > out of service due to the resulting performance shortfall.  There is
> > of course some automated recovery, and no, I am not familiar with the
> > details, but I suspect that a simple reboot is an early recovery step.
> > However, if the problem were to persist, the system would of course be
> > considered to be permanently broken.
> =

> Thanks for the info, if a sever is taken out of service just because
> of a false alarm of tsc, then it's a big waste!
> =

> > > Again, I want to know the real tsc unstable case. I have spent lots
> > > of time searching these info from git logs and mail archives before
> > > writing the patches.
> > =

> > So do I, which is why I put together this patch series.  My employer has
> > a fairly strict upstream-first for things like this which are annoyances
> > that are likely hiding other bugs, but which are not causing significant
> > outages, which was of course the motivation for the fault-injection
> > patches.
> > =

> > As I said earlier, it would have been very helpful to you for a patch
> > series like this to have been applied many years ago.  If it had been,
> > we would already have the failure-rate data that you requested.  And of
> > course if that failure-rate data indicated that TSC was reliable, there
> > would be far fewer people still distrusting TSC.
>  =

> Yes, if they can share the detailed info (like what's the 'watchdog')
> and debug info, it can enable people to debug and root cause the
> problem to be a false alarm or a real silicon platform. Personally, for
> newer platforms I tend to trust tsc much more than other clocksources.
 =

I understand people may 'distrust' tsc, after seeing that 'tsc unstable'
cases. But for 'newer platforms', if the unstable was judged by hpet,
acpi_pm_timer or the software 'refined-jiffies', then it could possibly
be just a false alarm, and that's not too difficult to be root caused.
And if there is a real evidence of a broken tsc case, then the distrust
is not just in impression from old days :) =


Thanks,
Feng
--===============6149416197679881129==--

