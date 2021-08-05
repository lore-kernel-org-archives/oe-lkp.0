Content-Type: multipart/mixed; boundary="===============6936081110681218996=="
MIME-Version: 1.0
From: Chao Gao <chao.gao@intel.com>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8901ecc231: stress-ng.lockbus.ops_per_sec -9.5% regression
Date: Thu, 05 Aug 2021 10:16:48 +0800
Message-ID: <20210805021646.GA11629@gao-cwp>
In-Reply-To: <20210803134816.GO4397@paulmck-ThinkPad-P17-Gen-1>
List-Id: <oe-lkp.lists.linux.dev>

--===============6936081110681218996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 03, 2021 at 06:48:16AM -0700, Paul E. McKenney wrote:
>On Tue, Aug 03, 2021 at 04:58:00PM +0800, Chao Gao wrote:
>> On Mon, Aug 02, 2021 at 10:02:57AM -0700, Paul E. McKenney wrote:
>> >On Mon, Aug 02, 2021 at 02:20:09PM +0800, Chao Gao wrote:
>> >> [snip]
>> >> >commit 48ebcfbfd877f5d9cddcc03c91352a8ca7b190af
>> >> >Author: Paul E. McKenney <paulmck@kernel.org>
>> >> >Date:   Thu May 27 11:03:28 2021 -0700
>> >> >
>> >> >    clocksource: Forgive repeated long-latency watchdog clocksource =
reads
>> >> >    =

>> >> >    Currently, the clocksource watchdog reacts to repeated long-late=
ncy
>> >> >    clocksource reads by marking that clocksource unstable on the th=
eory that
>> >> >    these long-latency reads are a sign of a serious problem.  And t=
his theory
>> >> >    does in fact have real-world support in the form of firmware iss=
ues [1].
>> >> >    =

>> >> >    However, it is also possible to trigger this using stress-ng on =
what
>> >> >    the stress-ng man page terms "poorly designed hardware" [2].  An=
d it
>> >> >    is not necessarily a bad thing for the kernel to diagnose cases =
where
>> >> >    high-stress workloads are being run on hardware that is not desi=
gned
>> >> >    for this sort of use.
>> >> >    =

>> >> >    Nevertheless, it is quite possible that real-world use will resu=
lt in
>> >> >    some situation requiring that high-stress workloads run on hardw=
are
>> >> >    not designed to accommodate them, and also requiring that the ke=
rnel
>> >> >    refrain from marking clocksources unstable.
>> >> >    =

>> >> >    Therefore, provide an out-of-tree patch that reacts to this situ=
ation
>> >> >    by leaving the clocksource alone, but using the old 62.5-millise=
cond
>> >> >    skew-detection threshold in response persistent long-latency rea=
ds.
>> >> >    In addition, the offending clocksource is marked for re-initiali=
zation
>> >> >    in this case, which both restarts that clocksource with a clean =
bill of
>> >> >    health and avoids false-positive skew reports on later watchdog =
checks.
>> >> =

>> >> Hi Paul,
>> >> =

>> >> Sorry to dig out this old thread.
>> >
>> >Not a problem, especially given that this is still an experimental patch
>> >(marked with "EXP" in -rcu).  So one remaining question is "what is this
>> >patch really supposed to do, if anything?".
>> =

>> We are testing with TDX [1] and analyzing why kernel in a TD, or Trust D=
omain,
>> sometimes spots a large TSC skew. We have inspected tsc hardware/ucode/t=
dx
>> module to ensure no hardware issue, and also ported tsc_sync.c to a user=
space
>> tool such that this tool can help to constantly check if tsc is synchron=
ized
>> when some workload is running. Finally, we believe that the large TSC sk=
ew =

>> spotted by TD kernel is a false positive.
>> =

>> Your patches (those are merged) have improved clocksource watchdog a lot=
 to
>> reduce false-positives. But due to the nature of TDX, switching between =
TD
>> and host takes more time. Then, the time window between two reads from
>> watchdog clocksource in cs_watchdog_read() increases, so does the
>> probability of the two reads being interrupted by whatever on host. Then,
>> sometimes, especially when there are heavy workloads in both host and TD,
>> the maximum number of retries in cs_watchdog_read() is exceeded and tsc =
is
>> marked unstable.
>> =

>> Then we apply this out-of-tree patch, it helps to further reduce
>> false-positives. But TD kernel still observes TSC skew in some cases. Af=
ter
>> a close look into kernel logs, we find patterns in those cases: an expec=
ted
>> re-initialization somehow doesn't happen. That's why we raise this issue
>> and ask for your advice.
>
>I am glad that the patch at least helps.  ;-)
>
>> [1]: https://software.intel.com/content/www/us/en/develop/articles/intel=
-trust-domain-extensions.html
>> =

>> >And here the clocksource failed the coarse-grained check and marked
>> >the clocksource as unstable.  Perhaps because the previous read
>> >forced a coarse-grained check.  Except that this should have forced
>> >a reinitialization.  Ah, it looks like I need to suppress setting
>> >CLOCK_SOURCE_WATCHDOG if coarse-grained checks have been enabled.
>> >That could cause false-positive failure for the next check, after all.
>> >
>> >And perhaps make cs_watchdog_read() modify its print if there is
>> >a watchdog reset pending or if the current clocksource has the
>> >CLOCK_SOURCE_WATCHDOG flag cleared.
>> >
>> >Perhaps as shown in the additional patch below, to be folded into the
>> >original?
>> =

>> Thanks. Will test with below patch applied.
>
>If this patch helps, but problems remain, another thing to try is to
>increase the clocksource.max_cswd_read_retries kernel boot parameter
>above its default value of 3.  Maybe to 5 or 10?
>
>If this patch does not help, please let me know.  In that case, there
>are probably more fixes required.

This patch works well; no false-positive (marking TSC unstable) in a
10hr stress test.

Thanks
Chao
--===============6936081110681218996==--

