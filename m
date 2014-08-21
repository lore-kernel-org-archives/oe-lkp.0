Content-Type: multipart/mixed; boundary="===============2333045337432987274=="
MIME-Version: 1.0
From: Rik van Riel <riel@redhat.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] caeb178c60f: +252.0% cpuidle.C1-SNB.time, +3.1% turbostat.Pkg_W
Date: Thu, 21 Aug 2014 10:16:13 -0400
Message-ID: <53F5FF2D.4010406@redhat.com>
In-Reply-To: <20140821140134.GB19246@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============2333045337432987274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/21/2014 10:01 AM, Fengguang Wu wrote:
> Hi Rik,
> =

> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
> commit caeb178c60f4f93f1b45c0bc056b5cf6d217b67f ("sched/fair: Make update=
_sd_pick_busiest() return 'true' on a busier sd")
> =

> testbox/testcase/testparams: lkp-sb03/nepim/300s-100%-tcp6

Is this good or bad?

The numbers suggest the xfs + raid5 workload is doing around 2.4%
more IO to disk per second with this change in, and there is more
CPU idle time in the system...

For the tcp test, I see no throughput numbers, but I see more
idle time as well as more time in turbo mode, and more softirqs,
which could mean that more packets were handled.

Does the patch introduce any performance issues, or did it
simply trip up something in the statistics that your script
noticed?

> 743cb1ff191f00f  caeb178c60f4f93f1b45c0bc0
> ---------------  -------------------------
>   29718911 =C2=B145%    +329.5%  1.277e+08 =C2=B110%  cpuidle.C1E-SNB.time
>        861 =C2=B134%   +1590.4%      14564 =C2=B131%  cpuidle.C3-SNB.usage
>   1.65e+08 =C2=B120%    +175.4%  4.544e+08 =C2=B115%  cpuidle.C1-SNB.time
>         24 =C2=B141%    +247.6%         86 =C2=B123%  numa-numastat.node1=
.other_node
>      27717 =C2=B111%     +98.7%      55085 =C2=B1 6%  softirqs.RCU
>     180767 =C2=B111%     +86.7%     337416 =C2=B110%  cpuidle.C7-SNB.usage
>     104591 =C2=B114%     +77.4%     185581 =C2=B110%  cpuidle.C1E-SNB.usa=
ge
>        384 =C2=B110%     +33.3%        512 =C2=B111%  slabinfo.kmem_cache=
.num_objs
>        384 =C2=B110%     +33.3%        512 =C2=B111%  slabinfo.kmem_cache=
.active_objs
>        494 =C2=B1 8%     +25.9%        622 =C2=B1 9%  slabinfo.kmem_cache=
_node.active_objs
>        512 =C2=B1 7%     +25.0%        640 =C2=B1 8%  slabinfo.kmem_cache=
_node.num_objs
>      83427 =C2=B1 6%     +10.3%      92028 =C2=B1 5%  meminfo.DirectMap4k
>       9508 =C2=B1 1%     +21.3%      11534 =C2=B1 7%  slabinfo.kmalloc-51=
2.active_objs
>       9838 =C2=B1 1%     +20.5%      11852 =C2=B1 6%  slabinfo.kmalloc-51=
2.num_objs
>      53997 =C2=B1 6%     +11.1%      59981 =C2=B1 4%  numa-meminfo.node1.=
Slab
>       2662 =C2=B1 3%      -9.0%       2424 =C2=B1 3%  slabinfo.kmalloc-96=
.active_objs
>       2710 =C2=B1 3%      -8.6%       2478 =C2=B1 3%  slabinfo.kmalloc-96=
.num_objs
>        921 =C2=B141%   +3577.7%      33901 =C2=B114%  time.involuntary_co=
ntext_switches
>       2371 =C2=B1 2%     +15.5%       2739 =C2=B1 2%  vmstat.system.in
> =

> testbox/testcase/testparams: lkp-sb03/nepim/300s-100%-tcp
> =

> 743cb1ff191f00f  caeb178c60f4f93f1b45c0bc0
> ---------------  -------------------------
>   20657207 =C2=B131%    +358.2%   94650352 =C2=B118%  cpuidle.C1E-SNB.time
>   29718911 =C2=B145%    +329.5%  1.277e+08 =C2=B110%  cpuidle.C1E-SNB.time
>        861 =C2=B134%   +1590.4%      14564 =C2=B131%  cpuidle.C3-SNB.usage
>       0.05 =C2=B146%    +812.5%       0.44 =C2=B134%  turbostat.%c3
>   1.12e+08 =C2=B125%    +364.8%  5.207e+08 =C2=B115%  cpuidle.C1-SNB.time
>   1.65e+08 =C2=B120%    +175.4%  4.544e+08 =C2=B115%  cpuidle.C1-SNB.time
>         35 =C2=B119%    +105.6%         72 =C2=B128%  numa-numastat.node1=
.other_node
>         24 =C2=B141%    +247.6%         86 =C2=B123%  numa-numastat.node1=
.other_node
>         43 =C2=B122%     +86.2%         80 =C2=B126%  numa-vmstat.node0.n=
r_dirtied
>      24576 =C2=B1 6%    +113.9%      52574 =C2=B1 1%  softirqs.RCU
>      27717 =C2=B111%     +98.7%      55085 =C2=B1 6%  softirqs.RCU
>     211533 =C2=B1 6%     +58.4%     334990 =C2=B1 8%  cpuidle.C7-SNB.usage
>     180767 =C2=B111%     +86.7%     337416 =C2=B110%  cpuidle.C7-SNB.usage
>      77739 =C2=B113%     +52.9%     118876 =C2=B118%  cpuidle.C1E-SNB.usa=
ge
>     104591 =C2=B114%     +77.4%     185581 =C2=B110%  cpuidle.C1E-SNB.usa=
ge
>      32.09 =C2=B114%     -24.8%      24.12 =C2=B118%  turbostat.%pc2
>       9.04 =C2=B1 6%     +41.6%      12.80 =C2=B1 6%  turbostat.%c1
>        384 =C2=B110%     +33.3%        512 =C2=B111%  slabinfo.kmem_cache=
.num_objs
>        384 =C2=B110%     +33.3%        512 =C2=B111%  slabinfo.kmem_cache=
.active_objs
>        494 =C2=B1 8%     +25.9%        622 =C2=B1 9%  slabinfo.kmem_cache=
_node.active_objs
>        512 =C2=B1 7%     +25.0%        640 =C2=B1 8%  slabinfo.kmem_cache=
_node.num_objs
>        379 =C2=B1 9%     +16.7%        443 =C2=B1 7%  numa-vmstat.node0.n=
r_page_table_pages
>      83427 =C2=B1 6%     +10.3%      92028 =C2=B1 5%  meminfo.DirectMap4k
>       1579 =C2=B1 6%     -15.3%       1338 =C2=B1 7%  numa-meminfo.node1.=
PageTables
>        394 =C2=B1 6%     -15.1%        334 =C2=B1 7%  numa-vmstat.node1.n=
r_page_table_pages
>       1509 =C2=B1 7%     +16.6%       1760 =C2=B1 7%  numa-meminfo.node0.=
PageTables
>      12681 =C2=B1 1%     -17.3%      10482 =C2=B114%  numa-meminfo.node1.=
AnonPages
>       3169 =C2=B1 1%     -17.3%       2620 =C2=B114%  numa-vmstat.node1.n=
r_anon_pages
>      10171 =C2=B1 3%     +10.9%      11283 =C2=B1 3%  slabinfo.kmalloc-51=
2.active_objs
>       9508 =C2=B1 1%     +21.3%      11534 =C2=B1 7%  slabinfo.kmalloc-51=
2.active_objs
>      10481 =C2=B1 3%     +10.9%      11620 =C2=B1 3%  slabinfo.kmalloc-51=
2.num_objs
>       9838 =C2=B1 1%     +20.5%      11852 =C2=B1 6%  slabinfo.kmalloc-51=
2.num_objs
>      53997 =C2=B1 6%     +11.1%      59981 =C2=B1 4%  numa-meminfo.node1.=
Slab
>       5072 =C2=B1 1%     +11.6%       5662 =C2=B1 3%  slabinfo.kmalloc-20=
48.num_objs
>       4974 =C2=B1 1%     +11.6%       5551 =C2=B1 3%  slabinfo.kmalloc-20=
48.active_objs
>      12824 =C2=B1 2%     -16.1%      10754 =C2=B114%  numa-meminfo.node1.=
Active(anon)
>       3205 =C2=B1 2%     -16.2%       2687 =C2=B114%  numa-vmstat.node1.n=
r_active_anon
>       2662 =C2=B1 3%      -9.0%       2424 =C2=B1 3%  slabinfo.kmalloc-96=
.active_objs
>       2710 =C2=B1 3%      -8.6%       2478 =C2=B1 3%  slabinfo.kmalloc-96=
.num_objs
>      15791 =C2=B1 1%     +15.2%      18192 =C2=B1 9%  numa-meminfo.node0.=
AnonPages
>       3949 =C2=B1 1%     +15.2%       4549 =C2=B1 9%  numa-vmstat.node0.n=
r_anon_pages
>      13669 =C2=B1 1%      -7.5%      12645 =C2=B1 2%  slabinfo.kmalloc-16=
.num_objs
>        662 =C2=B123%   +4718.6%      31918 =C2=B112%  time.involuntary_co=
ntext_switches
>        921 =C2=B141%   +3577.7%      33901 =C2=B114%  time.involuntary_co=
ntext_switches
>       2463 =C2=B1 1%     +13.1%       2786 =C2=B1 3%  vmstat.system.in
>       2371 =C2=B1 2%     +15.5%       2739 =C2=B1 2%  vmstat.system.in
>      49.40 =C2=B1 2%      +4.8%      51.79 =C2=B1 2%  turbostat.Cor_W
>      77.48 =C2=B1 1%      +3.1%      79.91 =C2=B1 1%  turbostat.Pkg_W
> =

> testbox/testcase/testparams: lkp-st02/dd-write/5m-11HDD-RAID5-cfq-xfs-1dd
> =

> 743cb1ff191f00f  caeb178c60f4f93f1b45c0bc0
> ---------------  -------------------------
>      18571 =C2=B1 7%     +31.4%      24396 =C2=B1 4%  proc-vmstat.pgscan_=
direct_normal
>      39983 =C2=B1 2%     +38.3%      55286 =C2=B1 0%  perf-stat.cpu-migra=
tions
>    4193962 =C2=B1 2%     +20.9%    5072009 =C2=B1 3%  perf-stat.iTLB-load=
-misses
>  4.568e+09 =C2=B1 2%     -17.2%  3.781e+09 =C2=B1 1%  perf-stat.L1-icache=
-load-misses
>  1.762e+10 =C2=B1 0%      -7.8%  1.625e+10 =C2=B1 1%  perf-stat.cache-ref=
erences
>  1.408e+09 =C2=B1 1%      -6.6%  1.315e+09 =C2=B1 1%  perf-stat.branch-lo=
ad-misses
>  1.407e+09 =C2=B1 1%      -6.5%  1.316e+09 =C2=B1 1%  perf-stat.branch-mi=
sses
>  6.839e+09 =C2=B1 1%      +5.0%  7.185e+09 =C2=B1 2%  perf-stat.LLC-loads
>  1.558e+10 =C2=B1 0%      +3.5%  1.612e+10 =C2=B1 1%  perf-stat.L1-dcache=
-load-misses
>  1.318e+12 =C2=B1 0%      +3.4%  1.363e+12 =C2=B1 0%  perf-stat.L1-icache=
-loads
>  2.979e+10 =C2=B1 1%      +2.4%  3.051e+10 =C2=B1 0%  perf-stat.L1-dcache=
-store-misses
>  1.893e+11 =C2=B1 0%      +2.5%   1.94e+11 =C2=B1 0%  perf-stat.branch-in=
structions
>  2.298e+11 =C2=B1 0%      +2.7%  2.361e+11 =C2=B1 0%  perf-stat.L1-dcache=
-stores
>  1.016e+12 =C2=B1 0%      +2.6%  1.042e+12 =C2=B1 0%  perf-stat.instructi=
ons
>  1.892e+11 =C2=B1 0%      +2.5%   1.94e+11 =C2=B1 0%  perf-stat.branch-lo=
ads
>   3.71e+11 =C2=B1 0%      +2.4%  3.799e+11 =C2=B1 0%  perf-stat.dTLB-loads
>  3.711e+11 =C2=B1 0%      +2.3%  3.798e+11 =C2=B1 0%  perf-stat.L1-dcache=
-loads
>     325768 =C2=B1 0%      +2.7%     334461 =C2=B1 0%  vmstat.io.bo
>       8083 =C2=B1 0%      +2.4%       8278 =C2=B1 0%  iostat.sdf.wrqm/s
>       8083 =C2=B1 0%      +2.4%       8278 =C2=B1 0%  iostat.sdk.wrqm/s
>       8082 =C2=B1 0%      +2.4%       8276 =C2=B1 0%  iostat.sdg.wrqm/s
>      32615 =C2=B1 0%      +2.4%      33398 =C2=B1 0%  iostat.sdf.wkB/s
>      32617 =C2=B1 0%      +2.4%      33401 =C2=B1 0%  iostat.sdk.wkB/s
>      32612 =C2=B1 0%      +2.4%      33393 =C2=B1 0%  iostat.sdg.wkB/s
>       8083 =C2=B1 0%      +2.4%       8277 =C2=B1 0%  iostat.sdl.wrqm/s
>       8083 =C2=B1 0%      +2.4%       8276 =C2=B1 0%  iostat.sdi.wrqm/s
>       8082 =C2=B1 0%      +2.4%       8277 =C2=B1 0%  iostat.sdc.wrqm/s
>      32614 =C2=B1 0%      +2.4%      33396 =C2=B1 0%  iostat.sdl.wkB/s
>       8083 =C2=B1 0%      +2.4%       8278 =C2=B1 0%  iostat.sde.wrqm/s
>       8082 =C2=B1 0%      +2.4%       8277 =C2=B1 0%  iostat.sdh.wrqm/s
>       8083 =C2=B1 0%      +2.4%       8277 =C2=B1 0%  iostat.sdd.wrqm/s
>      32614 =C2=B1 0%      +2.4%      33393 =C2=B1 0%  iostat.sdi.wkB/s
>      32611 =C2=B1 0%      +2.4%      33395 =C2=B1 0%  iostat.sdc.wkB/s
>     325759 =C2=B1 0%      +2.4%     333577 =C2=B1 0%  iostat.md0.wkB/s
>       1274 =C2=B1 0%      +2.4%       1305 =C2=B1 0%  iostat.md0.w/s
>       8082 =C2=B1 0%      +2.4%       8277 =C2=B1 0%  iostat.sdb.wrqm/s
>      32618 =C2=B1 0%      +2.4%      33398 =C2=B1 0%  iostat.sde.wkB/s
>      32612 =C2=B1 0%      +2.4%      33395 =C2=B1 0%  iostat.sdh.wkB/s
>      32618 =C2=B1 0%      +2.4%      33397 =C2=B1 0%  iostat.sdd.wkB/s
>       8084 =C2=B1 0%      +2.4%       8278 =C2=B1 0%  iostat.sdj.wrqm/s
>      32611 =C2=B1 0%      +2.4%      33396 =C2=B1 0%  iostat.sdb.wkB/s
>      32618 =C2=B1 0%      +2.4%      33400 =C2=B1 0%  iostat.sdj.wkB/s
>    2.3e+11 =C2=B1 0%      +2.5%  2.357e+11 =C2=B1 0%  perf-stat.dTLB-stor=
es
>       4898 =C2=B1 0%      +2.1%       5003 =C2=B1 0%  vmstat.system.cs
>  1.017e+12 =C2=B1 0%      +2.4%  1.042e+12 =C2=B1 0%  perf-stat.iTLB-loads
>    1518279 =C2=B1 0%      +2.1%    1549457 =C2=B1 0%  perf-stat.context-s=
witches
>  1.456e+12 =C2=B1 0%      +1.4%  1.476e+12 =C2=B1 0%  perf-stat.cpu-cycles
>  1.456e+12 =C2=B1 0%      +1.3%  1.475e+12 =C2=B1 0%  perf-stat.ref-cycles
>  1.819e+11 =C2=B1 0%      +1.3%  1.843e+11 =C2=B1 0%  perf-stat.bus-cycles
> =

> lkp-sb03 is a Sandy Bridge-EP server.
> Memory: 64G
> Architecture:          x86_64
> CPU op-mode(s):        32-bit, 64-bit
> Byte Order:            Little Endian
> CPU(s):                32
> On-line CPU(s) list:   0-31
> Thread(s) per core:    2
> Core(s) per socket:    8
> Socket(s):             2
> NUMA node(s):          2
> Vendor ID:             GenuineIntel
> CPU family:            6
> Model:                 45
> Stepping:              6
> CPU MHz:               3500.613
> BogoMIPS:              5391.16
> Virtualization:        VT-x
> L1d cache:             32K
> L1i cache:             32K
> L2 cache:              256K
> L3 cache:              20480K
> NUMA node0 CPU(s):     0-7,16-23
> NUMA node1 CPU(s):     8-15,24-31
> =

> lkp-st02 is Core2
> Memory: 8G
> =

> =

> =

> =

>                           time.involuntary_context_switches
> =

>   40000 O+---------------------------------------------------------------=
---+
>         |        O               O          O                            =
   |
>   35000 ++O  O O        O   O             O                              =
   |
>   30000 ++         O                 O         O                         =
   |
>         |                 O    O   O                                     =
   |
>   25000 ++            O                 O                                =
   |
>         |                                                                =
   |
>   20000 ++                                                               =
   |
>         |                                                                =
   |
>   15000 ++                                                               =
   |
>   10000 ++                                                               =
   |
>         |                                                                =
   |
>    5000 ++                                                               =
   |
>         |                                                .*.             =
   |
>       0 *+*--*-*-*-*--*-*-*-*--*-*-*-*--*-*-*--*-*-*-*--*---*-*--*-*-*-*-=
-*-*
> =

> =

> 	[*] bisect-good sample
> 	[O] bisect-bad  sample
> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =

> Thanks,
> Fengguang
> =



--===============2333045337432987274==--

