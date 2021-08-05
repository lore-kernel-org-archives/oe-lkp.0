Content-Type: multipart/mixed; boundary="===============0893687110651204697=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8901ecc231: stress-ng.lockbus.ops_per_sec -9.5% regression
Date: Wed, 04 Aug 2021 21:03:49 -0700
Message-ID: <20210805040349.GD4397@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20210805021646.GA11629@gao-cwp>
List-Id: <oe-lkp.lists.linux.dev>

--===============0893687110651204697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 05, 2021 at 10:16:48AM +0800, Chao Gao wrote:
> On Tue, Aug 03, 2021 at 06:48:16AM -0700, Paul E. McKenney wrote:
> >On Tue, Aug 03, 2021 at 04:58:00PM +0800, Chao Gao wrote:
> >> On Mon, Aug 02, 2021 at 10:02:57AM -0700, Paul E. McKenney wrote:
> >> >On Mon, Aug 02, 2021 at 02:20:09PM +0800, Chao Gao wrote:
> >> >> [snip]
> >> >> >commit 48ebcfbfd877f5d9cddcc03c91352a8ca7b190af
> >> >> >Author: Paul E. McKenney <paulmck@kernel.org>
> >> >> >Date:   Thu May 27 11:03:28 2021 -0700
> >> >> >
> >> >> >    clocksource: Forgive repeated long-latency watchdog clocksourc=
e reads
> >> >> >    =

> >> >> >    Currently, the clocksource watchdog reacts to repeated long-la=
tency
> >> >> >    clocksource reads by marking that clocksource unstable on the =
theory that
> >> >> >    these long-latency reads are a sign of a serious problem.  And=
 this theory
> >> >> >    does in fact have real-world support in the form of firmware i=
ssues [1].
> >> >> >    =

> >> >> >    However, it is also possible to trigger this using stress-ng o=
n what
> >> >> >    the stress-ng man page terms "poorly designed hardware" [2].  =
And it
> >> >> >    is not necessarily a bad thing for the kernel to diagnose case=
s where
> >> >> >    high-stress workloads are being run on hardware that is not de=
signed
> >> >> >    for this sort of use.
> >> >> >    =

> >> >> >    Nevertheless, it is quite possible that real-world use will re=
sult in
> >> >> >    some situation requiring that high-stress workloads run on har=
dware
> >> >> >    not designed to accommodate them, and also requiring that the =
kernel
> >> >> >    refrain from marking clocksources unstable.
> >> >> >    =

> >> >> >    Therefore, provide an out-of-tree patch that reacts to this si=
tuation
> >> >> >    by leaving the clocksource alone, but using the old 62.5-milli=
second
> >> >> >    skew-detection threshold in response persistent long-latency r=
eads.
> >> >> >    In addition, the offending clocksource is marked for re-initia=
lization
> >> >> >    in this case, which both restarts that clocksource with a clea=
n bill of
> >> >> >    health and avoids false-positive skew reports on later watchdo=
g checks.
> >> >> =

> >> >> Hi Paul,
> >> >> =

> >> >> Sorry to dig out this old thread.
> >> >
> >> >Not a problem, especially given that this is still an experimental pa=
tch
> >> >(marked with "EXP" in -rcu).  So one remaining question is "what is t=
his
> >> >patch really supposed to do, if anything?".
> >> =

> >> We are testing with TDX [1] and analyzing why kernel in a TD, or Trust=
 Domain,
> >> sometimes spots a large TSC skew. We have inspected tsc hardware/ucode=
/tdx
> >> module to ensure no hardware issue, and also ported tsc_sync.c to a us=
erspace
> >> tool such that this tool can help to constantly check if tsc is synchr=
onized
> >> when some workload is running. Finally, we believe that the large TSC =
skew =

> >> spotted by TD kernel is a false positive.
> >> =

> >> Your patches (those are merged) have improved clocksource watchdog a l=
ot to
> >> reduce false-positives. But due to the nature of TDX, switching betwee=
n TD
> >> and host takes more time. Then, the time window between two reads from
> >> watchdog clocksource in cs_watchdog_read() increases, so does the
> >> probability of the two reads being interrupted by whatever on host. Th=
en,
> >> sometimes, especially when there are heavy workloads in both host and =
TD,
> >> the maximum number of retries in cs_watchdog_read() is exceeded and ts=
c is
> >> marked unstable.
> >> =

> >> Then we apply this out-of-tree patch, it helps to further reduce
> >> false-positives. But TD kernel still observes TSC skew in some cases. =
After
> >> a close look into kernel logs, we find patterns in those cases: an exp=
ected
> >> re-initialization somehow doesn't happen. That's why we raise this iss=
ue
> >> and ask for your advice.
> >
> >I am glad that the patch at least helps.  ;-)
> >
> >> [1]: https://software.intel.com/content/www/us/en/develop/articles/int=
el-trust-domain-extensions.html
> >> =

> >> >And here the clocksource failed the coarse-grained check and marked
> >> >the clocksource as unstable.  Perhaps because the previous read
> >> >forced a coarse-grained check.  Except that this should have forced
> >> >a reinitialization.  Ah, it looks like I need to suppress setting
> >> >CLOCK_SOURCE_WATCHDOG if coarse-grained checks have been enabled.
> >> >That could cause false-positive failure for the next check, after all.
> >> >
> >> >And perhaps make cs_watchdog_read() modify its print if there is
> >> >a watchdog reset pending or if the current clocksource has the
> >> >CLOCK_SOURCE_WATCHDOG flag cleared.
> >> >
> >> >Perhaps as shown in the additional patch below, to be folded into the
> >> >original?
> >> =

> >> Thanks. Will test with below patch applied.
> >
> >If this patch helps, but problems remain, another thing to try is to
> >increase the clocksource.max_cswd_read_retries kernel boot parameter
> >above its default value of 3.  Maybe to 5 or 10?
> >
> >If this patch does not help, please let me know.  In that case, there
> >are probably more fixes required.
> =

> This patch works well; no false-positive (marking TSC unstable) in a
> 10hr stress test.

Very good, thank you!  May I add your Tested-by?

I expect that I will need to modify the patch a bit more to check for
a system where it is -never- able to get a good fine-grained read from
the clock.  And it might be that your test run ended up in that state.

My current thought is that if more than (say) 100 consecutive attempts
to read the clocksource get hit with excessive delays, it is time to at
least do a WARN_ON(), and maybe also time to disable the clocksource
due to skew.  The reason is that if reading the clocksource -always-
sees excessive delays, perhaps the clock driver or hardware is to blame.

Thoughts?

							Thanx, Paul
--===============0893687110651204697==--

