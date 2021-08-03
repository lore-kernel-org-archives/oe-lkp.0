Content-Type: multipart/mixed; boundary="===============8822246918436690136=="
MIME-Version: 1.0
From: Chao Gao <chao.gao@intel.com>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8901ecc231: stress-ng.lockbus.ops_per_sec -9.5% regression
Date: Tue, 03 Aug 2021 16:58:00 +0800
Message-ID: <20210803085759.GA31621@gao-cwp>
In-Reply-To: <20210802170257.GL4397@paulmck-ThinkPad-P17-Gen-1>
List-Id: <oe-lkp.lists.linux.dev>

--===============8822246918436690136==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 02, 2021 at 10:02:57AM -0700, Paul E. McKenney wrote:
>On Mon, Aug 02, 2021 at 02:20:09PM +0800, Chao Gao wrote:
>> [snip]
>> >commit 48ebcfbfd877f5d9cddcc03c91352a8ca7b190af
>> >Author: Paul E. McKenney <paulmck@kernel.org>
>> >Date:   Thu May 27 11:03:28 2021 -0700
>> >
>> >    clocksource: Forgive repeated long-latency watchdog clocksource rea=
ds
>> >    =

>> >    Currently, the clocksource watchdog reacts to repeated long-latency
>> >    clocksource reads by marking that clocksource unstable on the theor=
y that
>> >    these long-latency reads are a sign of a serious problem.  And this=
 theory
>> >    does in fact have real-world support in the form of firmware issues=
 [1].
>> >    =

>> >    However, it is also possible to trigger this using stress-ng on what
>> >    the stress-ng man page terms "poorly designed hardware" [2].  And it
>> >    is not necessarily a bad thing for the kernel to diagnose cases whe=
re
>> >    high-stress workloads are being run on hardware that is not designed
>> >    for this sort of use.
>> >    =

>> >    Nevertheless, it is quite possible that real-world use will result =
in
>> >    some situation requiring that high-stress workloads run on hardware
>> >    not designed to accommodate them, and also requiring that the kernel
>> >    refrain from marking clocksources unstable.
>> >    =

>> >    Therefore, provide an out-of-tree patch that reacts to this situati=
on
>> >    by leaving the clocksource alone, but using the old 62.5-millisecond
>> >    skew-detection threshold in response persistent long-latency reads.
>> >    In addition, the offending clocksource is marked for re-initializat=
ion
>> >    in this case, which both restarts that clocksource with a clean bil=
l of
>> >    health and avoids false-positive skew reports on later watchdog che=
cks.
>> =

>> Hi Paul,
>> =

>> Sorry to dig out this old thread.
>
>Not a problem, especially given that this is still an experimental patch
>(marked with "EXP" in -rcu).  So one remaining question is "what is this
>patch really supposed to do, if anything?".

We are testing with TDX [1] and analyzing why kernel in a TD, or Trust Doma=
in,
sometimes spots a large TSC skew. We have inspected tsc hardware/ucode/tdx
module to ensure no hardware issue, and also ported tsc_sync.c to a userspa=
ce
tool such that this tool can help to constantly check if tsc is synchronized
when some workload is running. Finally, we believe that the large TSC skew =

spotted by TD kernel is a false positive.

Your patches (those are merged) have improved clocksource watchdog a lot to
reduce false-positives. But due to the nature of TDX, switching between TD
and host takes more time. Then, the time window between two reads from
watchdog clocksource in cs_watchdog_read() increases, so does the
probability of the two reads being interrupted by whatever on host. Then,
sometimes, especially when there are heavy workloads in both host and TD,
the maximum number of retries in cs_watchdog_read() is exceeded and tsc is
marked unstable.

Then we apply this out-of-tree patch, it helps to further reduce
false-positives. But TD kernel still observes TSC skew in some cases. After
a close look into kernel logs, we find patterns in those cases: an expected
re-initialization somehow doesn't happen. That's why we raise this issue
and ask for your advice.

[1]: https://software.intel.com/content/www/us/en/develop/articles/intel-tr=
ust-domain-extensions.html

>And here the clocksource failed the coarse-grained check and marked
>the clocksource as unstable.  Perhaps because the previous read
>forced a coarse-grained check.  Except that this should have forced
>a reinitialization.  Ah, it looks like I need to suppress setting
>CLOCK_SOURCE_WATCHDOG if coarse-grained checks have been enabled.
>That could cause false-positive failure for the next check, after all.
>
>And perhaps make cs_watchdog_read() modify its print if there is
>a watchdog reset pending or if the current clocksource has the
>CLOCK_SOURCE_WATCHDOG flag cleared.
>
>Perhaps as shown in the additional patch below, to be folded into the
>original?

Thanks. Will test with below patch applied.

Thanks
Chao
>
>							Thanx, Paul
>
>------------------------------------------------------------------------
>
>diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
>index cfa992250c388..62da2485fd574 100644
>--- a/kernel/time/clocksource.c
>+++ b/kernel/time/clocksource.c
>@@ -230,8 +230,13 @@ static bool cs_watchdog_read(struct clocksource *cs, =
u64 *csnow, u64 *wdnow)
> 		}
> 	}
> =

>-	pr_warn("timekeeping watchdog on CPU%d: %s read-back delay of %lldns, at=
tempt %d, coarse-grained skew check followed by re-initialization\n",
>-		smp_processor_id(), watchdog->name, wd_delay, nretries);
>+	if ((cs->flags & CLOCK_SOURCE_WATCHDOG) && !atomic_read(&watchdog_reset_=
pending)) {
>+		pr_warn("timekeeping watchdog on CPU%d: %s read-back delay of %lldns, a=
ttempt %d, coarse-grained skew check followed by re-initialization\n",
>+			smp_processor_id(), watchdog->name, wd_delay, nretries);
>+	} else {
>+		pr_warn("timekeeping watchdog on CPU%d: %s read-back delay of %lldns, a=
ttempt %d, awaiting re-initialization\n",
>+			smp_processor_id(), watchdog->name, wd_delay, nretries);
>+	}
> 	return true;
> }
> =

>@@ -379,7 +384,8 @@ static void clocksource_watchdog(struct timer_list *un=
used)
> 		/* Clocksource initialized ? */
> 		if (!(cs->flags & CLOCK_SOURCE_WATCHDOG) ||
> 		    atomic_read(&watchdog_reset_pending)) {
>-			cs->flags |=3D CLOCK_SOURCE_WATCHDOG;
>+			if (!coarse)
>+				cs->flags |=3D CLOCK_SOURCE_WATCHDOG;
> 			cs->wd_last =3D wdnow;
> 			cs->cs_last =3D csnow;
> 			continue;
--===============8822246918436690136==--

