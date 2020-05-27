Content-Type: multipart/mixed; boundary="===============5432217398664203803=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [swap] 9c9c831c31: pmbench.latency.ns.average -33.9% improvement
Date: Wed, 27 May 2020 16:44:16 +0800
Message-ID: <87pnaphin3.fsf@yhuang-dev.intel.com>
In-Reply-To: <20200527053346.GT12456@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5432217398664203803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <rong.a.chen@intel.com> writes:

> Greeting,
>
> FYI, we noticed a -33.9% improvement of pmbench.latency.ns.average due to=
 commit:

Hi, Rong,

Usually, throughput is more important to report than latency.  There's
the throughput different in the comparison result below.

>     877972 =C2=B1  4%     +81.8%    1595757 =C2=B1 27%  pmbench.throughpu=
t.aps

Please report this instead in the future.

Best Regards,
Huang, Ying

> commit: 9c9c831c31a9315365df978af99f7ff315bbf7a7 ("swap: try to scan more=
 free slots even when fragmented")
> https://github.com/hnaz/linux-mm master
>
> in testcase: pmbench
> on test machine: 96 threads Intel(R) Xeon(R) CPU @ 2.30GHz with 128G memo=
ry
> with following parameters:
>
> 	runtime: 1800s
> 	mode: raw
> 	nr_dev: 2
> 	nr_part: 2
> 	part_type: S
> 	all: 1
> 	thp_enabled: never
> 	thp_defrag: never
> 	nr_processes: 16
> 	nr_threads: 1
> 	pattern: uniform
> 	ratio: 80
> 	cold: 1
> 	initialize: 1
> 	setsize: 4800M
> 	cpu_node_bind: even
> 	cpufreq_governor: performance
> 	debug-setup: yhss9
> 	sc_numa_balancing: 0
> 	sc_swappiness: 100
> 	ucode: 0x400002c
>
> test-description: pmbench - paging and virtual memory benchmark
>
>
>
>
>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> all/cold/compiler/cpu_node_bind/cpufreq_governor/debug-setup/initialize/k=
config/mode/nr_dev/nr_part/nr_processes/nr_threads/part_type/pattern/ratio/=
rootfs/runtime/sc_numa_balancing/sc_swappiness/setsize/tbox_group/testcase/=
thp_defrag/thp_enabled/ucode:
>   1/1/gcc-7/even/performance/yhss9/1/x86_64-rhel-7.6/raw/2/2/16/1/S/unifo=
rm/80/debian-x86_64-20191114.cgz/1800s/0/100/4800M/lkp-csl-2sp4/pmbench/nev=
er/never/0x400002c
>
> commit: =

>   b80829e0bc ("mm/swapfile.c: omit a duplicate code by compare tmp and ma=
x first")
>   9c9c831c31 ("swap: try to scan more free slots even when fragmented")
>
> b80829e0bc2d6fed 9c9c831c31a9315365df978af99 =

> ---------------- --------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>           1:4          -25%            :4     kmsg.Dev_pmem#:unable_to_re=
ad_RDB_block
>           0:4            9%           1:4     perf-profile.children.cycle=
s-pp.error_entry
>          %stddev     %change         %stddev
>              \          |                \  =

>      10.65            -1.8%      10.46        pmbench.init_time.avg
>      18758 =C2=B1  2%     -33.9%      12408 =C2=B1  4%  pmbench.latency.n=
s.average
>       0.03 =C2=B1 19%      +0.3        0.31 =C2=B1 21%  pmbench.read.late=
ncy.ns.128K-256K%
>       0.00 =C2=B1 46%      -0.0        0.00 =C2=B1 82%  pmbench.read.late=
ncy.ns.16M-32M%
>       0.00 =C2=B1 17%      -0.0        0.00 =C2=B1 21%  pmbench.read.late=
ncy.ns.1G-inf%
>       9.00 =C2=B1  7%      -1.4        7.60 =C2=B1 14%  pmbench.read.late=
ncy.ns.256-512%
>       0.00 =C2=B1 10%      +0.0        0.03 =C2=B1 22%  pmbench.read.late=
ncy.ns.256K-512K%
>       0.00 =C2=B1 44%      -0.0        0.00 =C2=B1 43%  pmbench.read.late=
ncy.ns.256M-512M%
>      26.10 =C2=B1  4%      -4.3       21.76 =C2=B1 20%  pmbench.read.late=
ncy.ns.2K-4K%
>       0.27 =C2=B1  2%      -0.2        0.02 =C2=B1 22%  pmbench.read.late=
ncy.ns.2M-4M%
>       0.75 =C2=B1  4%      -0.5        0.22 =C2=B1 21%  pmbench.read.late=
ncy.ns.32K-64K%
>      27.69 =C2=B1  3%      -6.0       21.72 =C2=B1 22%  pmbench.read.late=
ncy.ns.4K-8K%
>       0.04 =C2=B1 28%      -0.0        0.00 =C2=B1 23%  pmbench.read.late=
ncy.ns.4M-8M%
>       0.03 =C2=B1 24%      +0.1        0.17 =C2=B1 19%  pmbench.read.late=
ncy.ns.512K-1M%
>       0.00 =C2=B1 44%      -0.0        0.00 =C2=B1 61%  pmbench.read.late=
ncy.ns.8M-16M%
>     877972 =C2=B1  4%     +81.8%    1595757 =C2=B1 27%  pmbench.throughpu=
t.aps
>  9.738e+08           +44.1%  1.404e+09        pmbench.time.major_page_fau=
lts
>  1.045e+08           +36.2%  1.423e+08        pmbench.time.minor_page_fau=
lts
>       1548            -3.5%       1494 =C2=B1  3%  pmbench.time.percent_o=
f_cpu_this_job_got
>      27681            -1.9%      27146        pmbench.time.system_time
>     575.21 =C2=B1  2%     +55.8%     896.14 =C2=B1 13%  pmbench.time.user=
_time
>    1458512 =C2=B1  3%     -21.1%    1150258 =C2=B1  4%  pmbench.time.volu=
ntary_context_switches
>       0.03 =C2=B1 19%      +0.3        0.31 =C2=B1 21%  pmbench.write.lat=
ency.ns.128K-256K%
>       0.00 =C2=B1 47%      -0.0        0.00 =C2=B1 77%  pmbench.write.lat=
ency.ns.16M-32M%
>      18.27 =C2=B1  2%      -3.9       14.38 =C2=B1 23%  pmbench.write.lat=
ency.ns.1K-2K%
>       3.21 =C2=B1  4%      -0.5        2.66 =C2=B1 20%  pmbench.write.lat=
ency.ns.256-512%
>       0.00 =C2=B1 10%      +0.0        0.03 =C2=B1 22%  pmbench.write.lat=
ency.ns.256K-512K%
>       0.00 =C2=B1 46%      -0.0        0.00 =C2=B1 36%  pmbench.write.lat=
ency.ns.256M-512M%
>      25.94 =C2=B1  4%      -4.4       21.55 =C2=B1 20%  pmbench.write.lat=
ency.ns.2K-4K%
>       0.27 =C2=B1  3%      -0.2        0.02 =C2=B1 22%  pmbench.write.lat=
ency.ns.2M-4M%
>       0.76 =C2=B1  4%      -0.5        0.22 =C2=B1 21%  pmbench.write.lat=
ency.ns.32K-64K%
>      28.27 =C2=B1  3%      -6.1       22.16 =C2=B1 22%  pmbench.write.lat=
ency.ns.4K-8K%
>       0.04 =C2=B1 28%      -0.0        0.00 =C2=B1 23%  pmbench.write.lat=
ency.ns.4M-8M%
>       0.03 =C2=B1 23%      +0.1        0.17 =C2=B1 19%  pmbench.write.lat=
ency.ns.512K-1M%
>       0.00 =C2=B1 43%      -0.0        0.00 =C2=B1 61%  pmbench.write.lat=
ency.ns.8M-16M%
>   38900508 =C2=B1165%     -97.0%    1161040 =C2=B1  3%  cpuidle.C1.usage
>      95548 =C2=B1  2%     +15.0%     109893        meminfo.KReclaimable
>      95548 =C2=B1  2%     +15.0%     109893        meminfo.SReclaimable
>      22154 =C2=B1 13%     -99.5%     117.75 =C2=B1  2%  meminfo.SwapCached
>    2133104           +40.2%    2991446 =C2=B1  3%  vmstat.swap.si
>    2159159           +39.6%    3015086 =C2=B1  3%  vmstat.swap.so
>     403272           +15.6%     466175        vmstat.system.in
>      51216 =C2=B1  4%     +16.9%      59856 =C2=B1  3%  numa-meminfo.node=
0.KReclaimable
>     272326 =C2=B1 22%    +130.4%     627386 =C2=B1 53%  numa-meminfo.node=
0.MemFree
>      51216 =C2=B1  4%     +16.9%      59856 =C2=B1  3%  numa-meminfo.node=
0.SReclaimable
>      44329 =C2=B1  5%     +12.9%      50031 =C2=B1  4%  numa-meminfo.node=
1.KReclaimable
>      44329 =C2=B1  5%     +12.9%      50031 =C2=B1  4%  numa-meminfo.node=
1.SReclaimable
>       0.00 =C2=B1 45%      +0.0        0.01 =C2=B1 15%  mpstat.node.0.sof=
t%
>       0.38 =C2=B1  3%      +0.2        0.56 =C2=B1  8%  mpstat.node.0.usr%
>       0.00 =C2=B1 58%      +0.0        0.01 =C2=B1 29%  mpstat.node.1.sof=
t%
>       0.30 =C2=B1  2%      +0.2        0.47 =C2=B1 11%  mpstat.node.1.usr%
>       0.00 =C2=B1 51%      +0.0        0.01 =C2=B1 22%  mpstat.node.all.s=
oft%
>       0.34 =C2=B1  2%      +0.2        0.51 =C2=B1  9%  mpstat.node.all.u=
sr%
>       2836 =C2=B1  3%     -17.6%       2336 =C2=B1  7%  slabinfo.fsnotify=
_mark_connector.active_objs
>       2836 =C2=B1  3%     -17.6%       2336 =C2=B1  7%  slabinfo.fsnotify=
_mark_connector.num_objs
>      56887 =C2=B1  2%     +43.0%      81372        slabinfo.radix_tree_no=
de.active_objs
>       1090 =C2=B1  3%     +36.1%       1483 =C2=B1  2%  slabinfo.radix_tr=
ee_node.active_slabs
>      61051 =C2=B1  3%     +35.7%      82864        slabinfo.radix_tree_no=
de.num_objs
>       1090 =C2=B1  3%     +36.1%       1483 =C2=B1  2%  slabinfo.radix_tr=
ee_node.num_slabs
>  2.774e+08           +88.1%  5.217e+08 =C2=B1  3%  numa-numastat.node0.lo=
cal_node
>  2.774e+08           +88.1%  5.217e+08 =C2=B1  3%  numa-numastat.node0.nu=
ma_hit
>   1.77e+08 =C2=B1 11%     -34.4%  1.162e+08 =C2=B1 12%  numa-numastat.nod=
e0.numa_miss
>   1.77e+08 =C2=B1 11%     -34.4%  1.162e+08 =C2=B1 12%  numa-numastat.nod=
e0.other_node
>  2.913e+08 =C2=B1 10%     +93.8%  5.646e+08        numa-numastat.node1.lo=
cal_node
>   1.77e+08 =C2=B1 11%     -34.4%  1.162e+08 =C2=B1 12%  numa-numastat.nod=
e1.numa_foreign
>  2.913e+08 =C2=B1 10%     +93.8%  5.646e+08        numa-numastat.node1.nu=
ma_hit
>      34077 =C2=B1 19%     +88.3%      64163 =C2=B1 14%  sched_debug.cfs_r=
q:/.exec_clock.min
>     420702 =C2=B1 19%     +47.6%     620876 =C2=B1 17%  sched_debug.cfs_r=
q:/.min_vruntime.min
>    1141699 =C2=B1  5%     -11.1%    1014934 =C2=B1  8%  sched_debug.cfs_r=
q:/.min_vruntime.stddev
>    1141714 =C2=B1  5%     -11.1%    1014949 =C2=B1  8%  sched_debug.cfs_r=
q:/.spread0.stddev
>       9.40 =C2=B1  8%     -46.6%       5.02        sched_debug.cpu.clock.=
stddev
>       9.40 =C2=B1  8%     -46.6%       5.02        sched_debug.cpu.clock_=
task.stddev
>      53350 =C2=B1 30%     +52.0%      81088 =C2=B1 23%  sched_debug.cpu.n=
r_switches.min
>      14.62 =C2=B1  9%     -10.9%      13.02 =C2=B1  7%  sched_debug.cpu.n=
r_uninterruptible.stddev
>      51798 =C2=B1 32%     +54.2%      79853 =C2=B1 23%  sched_debug.cpu.s=
ched_count.min
>      16360 =C2=B1  3%     -11.4%      14489 =C2=B1  2%  sched_debug.cpu.s=
ched_goidle.avg
>      35124 =C2=B1 15%     -28.5%      25097 =C2=B1  4%  sched_debug.cpu.s=
ched_goidle.max
>       5864 =C2=B1  7%     -39.1%       3574 =C2=B1  8%  sched_debug.cpu.s=
ched_goidle.stddev
>      24835 =C2=B1  4%    +106.2%      51199 =C2=B1  4%  sched_debug.cpu.t=
twu_local.avg
>      58889 =C2=B1 16%     +73.3%     102071 =C2=B1  5%  sched_debug.cpu.t=
twu_local.max
>       6358 =C2=B1 21%    +134.0%      14880 =C2=B1 22%  sched_debug.cpu.t=
twu_local.min
>      10665 =C2=B1  8%     +89.0%      20160 =C2=B1  7%  sched_debug.cpu.t=
twu_local.stddev
>      67428 =C2=B1 23%    +131.8%     156312 =C2=B1 54%  numa-vmstat.node0=
.nr_free_pages
>     343073 =C2=B1  6%      -9.3%     311011 =C2=B1  5%  numa-vmstat.node0=
.nr_inactive_anon
>     175.75 =C2=B1  7%     -26.0%     130.00 =C2=B1  6%  numa-vmstat.node0=
.nr_isolated_anon
>      12806 =C2=B1  4%     +16.8%      14959 =C2=B1  3%  numa-vmstat.node0=
.nr_slab_reclaimable
>  2.228e+08 =C2=B1  5%     +45.6%  3.244e+08 =C2=B1  5%  numa-vmstat.node0=
.nr_vmscan_write
>  2.228e+08 =C2=B1  5%     +45.6%  3.244e+08 =C2=B1  5%  numa-vmstat.node0=
.nr_written
>     342900 =C2=B1  6%      -9.3%     310899 =C2=B1  5%  numa-vmstat.node0=
.nr_zone_inactive_anon
>  1.413e+08           +92.9%  2.726e+08 =C2=B1  5%  numa-vmstat.node0.numa=
_hit
>  1.412e+08           +93.0%  2.724e+08 =C2=B1  5%  numa-vmstat.node0.numa=
_local
>   87382887 =C2=B1 12%     -30.4%   60836611 =C2=B1 10%  numa-vmstat.node0=
.numa_miss
>   87569634 =C2=B1 12%     -30.3%   61038664 =C2=B1 10%  numa-vmstat.node0=
.numa_other
>     224.25 =C2=B1  6%     -21.0%     177.25 =C2=B1  4%  numa-vmstat.node1=
.nr_isolated_anon
>      11084 =C2=B1  5%     +12.4%      12462 =C2=B1  4%  numa-vmstat.node1=
.nr_slab_reclaimable
>  2.696e+08 =C2=B1  5%     +52.1%  4.101e+08 =C2=B1  4%  numa-vmstat.node1=
.nr_vmscan_write
>  2.696e+08 =C2=B1  5%     +52.1%  4.101e+08 =C2=B1  4%  numa-vmstat.node1=
.nr_written
>   87384914 =C2=B1 12%     -30.4%   60836973 =C2=B1 10%  numa-vmstat.node1=
.numa_foreign
>  1.484e+08 =C2=B1  9%     +98.4%  2.944e+08 =C2=B1  4%  numa-vmstat.node1=
.numa_hit
>  1.484e+08 =C2=B1  9%     +98.4%  2.943e+08 =C2=B1  4%  numa-vmstat.node1=
.numa_local
>    9317863 =C2=B1  7%     +52.6%   14215591        proc-vmstat.allocstall=
_movable
>     302829 =C2=B1 56%     -62.6%     113363 =C2=B1  9%  proc-vmstat.alloc=
stall_normal
>     341221            -1.4%     336578        proc-vmstat.nr_file_pages
>     399.75           -23.1%     307.25 =C2=B1  2%  proc-vmstat.nr_isolate=
d_anon
>      23880 =C2=B1  2%     +14.6%      27371        proc-vmstat.nr_slab_re=
claimable
>  4.946e+08 =C2=B1  2%     +48.5%  7.346e+08 =C2=B1  3%  proc-vmstat.nr_vm=
scan_write
>  9.858e+08           +43.5%  1.415e+09        proc-vmstat.nr_written
>  4.295e+08 =C2=B1  3%     -18.3%  3.508e+08 =C2=B1  2%  proc-vmstat.numa_=
foreign
>  5.688e+08 =C2=B1  5%     +91.0%  1.086e+09        proc-vmstat.numa_hit
>  5.687e+08 =C2=B1  5%     +91.0%  1.086e+09        proc-vmstat.numa_local
>  4.295e+08 =C2=B1  3%     -18.3%  3.508e+08 =C2=B1  2%  proc-vmstat.numa_=
miss
>  4.295e+08 =C2=B1  3%     -18.3%  3.508e+08 =C2=B1  2%  proc-vmstat.numa_=
other
>  1.003e+09           +43.7%  1.441e+09        proc-vmstat.pgactivate
>   52861209 =C2=B1  5%     +65.9%   87707974 =C2=B1  4%  proc-vmstat.pgall=
oc_dma32
>  9.533e+08           +48.6%  1.416e+09        proc-vmstat.pgalloc_normal
>  1.016e+09           +43.1%  1.454e+09        proc-vmstat.pgdeactivate
>  1.083e+09           +43.3%  1.551e+09        proc-vmstat.pgfault
>  1.006e+09           +49.5%  1.504e+09        proc-vmstat.pgfree
>  9.739e+08           +44.2%  1.404e+09        proc-vmstat.pgmajfault
>  1.016e+09           +43.1%  1.454e+09        proc-vmstat.pgrefill
>  1.711e+09 =C2=B1  2%     +32.0%  2.259e+09        proc-vmstat.pgscan_dir=
ect
>  4.813e+08 =C2=B1  3%     +65.7%  7.977e+08 =C2=B1  3%  proc-vmstat.pgsca=
n_kswapd
>  8.277e+08           +37.5%  1.138e+09        proc-vmstat.pgsteal_direct
>  1.581e+08           +75.2%  2.771e+08        proc-vmstat.pgsteal_kswapd
>  9.739e+08           +44.2%  1.404e+09        proc-vmstat.pswpin
>  9.858e+08           +43.5%  1.415e+09        proc-vmstat.pswpout
>     292.25 =C2=B1 20%   +1416.4%       4431 =C2=B1  8%  proc-vmstat.swap_=
ra
>      59.00 =C2=B1  7%   +4333.1%       2615 =C2=B1  9%  proc-vmstat.swap_=
ra_hit
>      28.93 =C2=B1  2%     -26.6%      21.24        perf-stat.i.MPKI
>  2.895e+09           +27.5%  3.692e+09 =C2=B1  3%  perf-stat.i.branch-ins=
tructions
>       0.87            -0.2        0.63 =C2=B1  2%  perf-stat.i.branch-mis=
s-rate%
>   25073529            -9.9%   22581211 =C2=B1  3%  perf-stat.i.branch-mis=
ses
>      37.59           +10.8       48.39        perf-stat.i.cache-miss-rate%
>  1.615e+08 =C2=B1  2%     +24.9%  2.016e+08 =C2=B1  3%  perf-stat.i.cache=
-misses
>  4.297e+08            -3.6%  4.143e+08 =C2=B1  3%  perf-stat.i.cache-refe=
rences
>       4.04           -25.9%       2.99        perf-stat.i.cpi
>  5.982e+10            -4.4%  5.722e+10 =C2=B1  3%  perf-stat.i.cpu-cycles
>     114.58            +9.5%     125.49        perf-stat.i.cpu-migrations
>     377.29 =C2=B1  3%     -20.4%     300.26 =C2=B1  4%  perf-stat.i.cycle=
s-between-cache-misses
>       0.18 =C2=B1  4%      +0.0        0.23 =C2=B1 18%  perf-stat.i.dTLB-=
load-miss-rate%
>    6826244 =C2=B1  3%     +42.0%    9690079 =C2=B1  2%  perf-stat.i.dTLB-=
load-misses
>  3.818e+09           +30.8%  4.993e+09 =C2=B1  3%  perf-stat.i.dTLB-loads
>       0.07 =C2=B1  2%      +0.0        0.09 =C2=B1 23%  perf-stat.i.dTLB-=
store-miss-rate%
>    1463946 =C2=B1  2%     +43.4%    2099657        perf-stat.i.dTLB-store=
-misses
>  2.059e+09           +35.2%  2.784e+09 =C2=B1  3%  perf-stat.i.dTLB-stores
>    5166354           +14.7%    5927760 =C2=B1  2%  perf-stat.i.iTLB-load-=
misses
>    1840937            +1.9%    1875841        perf-stat.i.iTLB-loads
>  1.495e+10           +29.8%   1.94e+10 =C2=B1  3%  perf-stat.i.instructio=
ns
>       2903 =C2=B1  2%     +11.8%       3245 =C2=B1  2%  perf-stat.i.instr=
uctions-per-iTLB-miss
>       0.25           +34.4%       0.34        perf-stat.i.ipc
>     533993           +40.1%     748359 =C2=B1  3%  perf-stat.i.major-faul=
ts
>       0.62            -4.3%       0.60 =C2=B1  3%  perf-stat.i.metric.GHz
>       0.81 =C2=B1  3%     +22.8%       1.00 =C2=B1  3%  perf-stat.i.metri=
c.K/sec
>      96.51           +29.2%     124.71 =C2=B1  3%  perf-stat.i.metric.M/s=
ec
>      59652           +31.5%      78424 =C2=B1  2%  perf-stat.i.minor-faul=
ts
>      70.98            -8.0       62.97 =C2=B1  3%  perf-stat.i.node-load-=
miss-rate%
>   21974526           +15.9%   25469692 =C2=B1  3%  perf-stat.i.node-load-=
misses
>    8913392           +58.8%   14150101        perf-stat.i.node-loads
>      77.63           -12.1       65.55 =C2=B1  3%  perf-stat.i.node-store=
-miss-rate%
>   18858465           +20.4%   22703235 =C2=B1  4%  perf-stat.i.node-store=
-misses
>    5393043 =C2=B1  3%    +105.3%   11069950 =C2=B1  3%  perf-stat.i.node-=
stores
>     593645           +39.3%     826783 =C2=B1  3%  perf-stat.i.page-faults
>      28.75 =C2=B1  2%     -25.7%      21.35        perf-stat.overall.MPKI
>       0.87            -0.3        0.61        perf-stat.overall.branch-mi=
ss-rate%
>      37.58           +11.1       48.67        perf-stat.overall.cache-mis=
s-rate%
>       4.00           -26.3%       2.95        perf-stat.overall.cpi
>     370.83 =C2=B1  3%     -23.5%     283.79        perf-stat.overall.cycl=
es-between-cache-misses
>       0.18 =C2=B1  2%      +0.0        0.19 =C2=B1  3%  perf-stat.overall=
.dTLB-load-miss-rate%
>       0.07            +0.0        0.08 =C2=B1  2%  perf-stat.overall.dTLB=
-store-miss-rate%
>      73.72            +2.2       75.96        perf-stat.overall.iTLB-load=
-miss-rate%
>       2895 =C2=B1  2%     +13.0%       3273        perf-stat.overall.inst=
ructions-per-iTLB-miss
>       0.25           +35.7%       0.34        perf-stat.overall.ipc
>      71.14            -6.9       64.27        perf-stat.overall.node-load=
-miss-rate%
>      77.75           -10.6       67.19        perf-stat.overall.node-stor=
e-miss-rate%
>  2.892e+09           +27.6%  3.691e+09 =C2=B1  2%  perf-stat.ps.branch-in=
structions
>   25055439            -9.9%   22571336 =C2=B1  3%  perf-stat.ps.branch-mi=
sses
>  1.614e+08 =C2=B1  2%     +24.9%  2.016e+08 =C2=B1  3%  perf-stat.ps.cach=
e-misses
>  4.294e+08            -3.5%  4.142e+08 =C2=B1  3%  perf-stat.ps.cache-ref=
erences
>  5.979e+10            -4.3%  5.721e+10 =C2=B1  2%  perf-stat.ps.cpu-cycles
>     114.49            +9.6%     125.42        perf-stat.ps.cpu-migrations
>    6821115 =C2=B1  3%     +42.0%    9684339 =C2=B1  2%  perf-stat.ps.dTLB=
-load-misses
>  3.815e+09           +30.8%  4.992e+09 =C2=B1  2%  perf-stat.ps.dTLB-loads
>    1462610 =C2=B1  2%     +43.4%    2097904        perf-stat.ps.dTLB-stor=
e-misses
>  2.057e+09           +35.3%  2.784e+09 =C2=B1  3%  perf-stat.ps.dTLB-stor=
es
>    5161712           +14.8%    5925351 =C2=B1  2%  perf-stat.ps.iTLB-load=
-misses
>    1839661            +1.9%    1874628        perf-stat.ps.iTLB-loads
>  1.494e+10           +29.8%   1.94e+10 =C2=B1  3%  perf-stat.ps.instructi=
ons
>     533681           +40.2%     748293 =C2=B1  3%  perf-stat.ps.major-fau=
lts
>      59546           +31.5%      78313 =C2=B1  2%  perf-stat.ps.minor-fau=
lts
>   21957854           +16.0%   25464108 =C2=B1  3%  perf-stat.ps.node-load=
-misses
>    8907729           +58.8%   14145004        perf-stat.ps.node-loads
>   18845579           +20.4%   22695308 =C2=B1  4%  perf-stat.ps.node-stor=
e-misses
>    5393487 =C2=B1  3%    +105.4%   11075863 =C2=B1  3%  perf-stat.ps.node=
-stores
>     593228           +39.3%     826607 =C2=B1  3%  perf-stat.ps.page-faul=
ts
>  2.726e+13           +33.5%  3.639e+13        perf-stat.total.instructions
>     443491 =C2=B1  5%    +212.9%    1387638 =C2=B1  5%  softirqs.CPU0.RCU
>     503276 =C2=B1  5%    +204.8%    1533957 =C2=B1 11%  softirqs.CPU1.RCU
>     458460 =C2=B1 10%    +203.1%    1389464 =C2=B1  3%  softirqs.CPU10.RCU
>     466020 =C2=B1  7%    +189.4%    1348723 =C2=B1  4%  softirqs.CPU11.RCU
>     490298 =C2=B1 11%    +179.3%    1369353 =C2=B1  5%  softirqs.CPU12.RCU
>     494696 =C2=B1  8%    +169.3%    1332016 =C2=B1  8%  softirqs.CPU13.RCU
>     481566 =C2=B1 11%    +168.0%    1290819 =C2=B1  6%  softirqs.CPU14.RCU
>     496854 =C2=B1 13%    +131.0%    1147735 =C2=B1  2%  softirqs.CPU15.RCU
>     531038 =C2=B1 10%    +161.4%    1387929 =C2=B1  7%  softirqs.CPU16.RCU
>     505272 =C2=B1  6%    +167.8%    1352880 =C2=B1 12%  softirqs.CPU17.RCU
>     560153 =C2=B1  8%    +130.4%    1290800 =C2=B1  5%  softirqs.CPU18.RCU
>     516032 =C2=B1 12%    +161.3%    1348456 =C2=B1  2%  softirqs.CPU19.RCU
>     520803 =C2=B1 15%    +162.3%    1365891 =C2=B1 12%  softirqs.CPU2.RCU
>     540294 =C2=B1  8%    +148.4%    1341956 =C2=B1 11%  softirqs.CPU20.RCU
>     518283 =C2=B1 10%    +167.3%    1385208 =C2=B1  4%  softirqs.CPU21.RCU
>     509050 =C2=B1  8%    +154.9%    1297700 =C2=B1  6%  softirqs.CPU22.RCU
>     532748 =C2=B1  4%    +161.7%    1394395 =C2=B1 13%  softirqs.CPU23.RCU
>     168912 =C2=B1  2%      +9.4%     184788 =C2=B1  2%  softirqs.CPU23.SC=
HED
>     529751 =C2=B1 11%    +176.9%    1466915 =C2=B1  5%  softirqs.CPU24.RCU
>     513625 =C2=B1 10%    +190.9%    1493952 =C2=B1  4%  softirqs.CPU25.RCU
>     534949 =C2=B1  6%    +170.0%    1444342 =C2=B1  9%  softirqs.CPU26.RCU
>     525891 =C2=B1  7%    +158.2%    1358030 =C2=B1  6%  softirqs.CPU27.RCU
>     527525 =C2=B1  2%    +167.3%    1410109 =C2=B1  7%  softirqs.CPU28.RCU
>     538612 =C2=B1 12%    +148.6%    1339044 =C2=B1  9%  softirqs.CPU29.RCU
>     501518 =C2=B1 11%    +154.7%    1277418 =C2=B1 18%  softirqs.CPU3.RCU
>     499873 =C2=B1  8%    +178.6%    1392722 =C2=B1 11%  softirqs.CPU30.RCU
>     541393 =C2=B1 15%    +148.7%    1346646 =C2=B1 13%  softirqs.CPU31.RCU
>     488032 =C2=B1 11%    +196.9%    1448790 =C2=B1  5%  softirqs.CPU32.RCU
>     487641 =C2=B1  5%    +199.3%    1459556 =C2=B1  2%  softirqs.CPU33.RCU
>     494297 =C2=B1  9%    +185.9%    1412967 =C2=B1  7%  softirqs.CPU34.RCU
>     477316 =C2=B1  7%    +151.4%    1199896 =C2=B1 11%  softirqs.CPU35.RCU
>     449119 =C2=B1  5%    +201.1%    1352432 =C2=B1  2%  softirqs.CPU36.RCU
>     492009 =C2=B1 12%    +176.8%    1361656 =C2=B1  4%  softirqs.CPU37.RCU
>     475731 =C2=B1  8%    +153.2%    1204751 =C2=B1  5%  softirqs.CPU38.RCU
>     482480 =C2=B1 10%    +156.7%    1238457 =C2=B1  3%  softirqs.CPU39.RCU
>     509260 =C2=B1  9%    +180.9%    1430351 =C2=B1  4%  softirqs.CPU4.RCU
>     454685 =C2=B1  6%    +174.9%    1250025 =C2=B1  5%  softirqs.CPU40.RCU
>     466072 =C2=B1  6%    +166.0%    1239804 =C2=B1  4%  softirqs.CPU41.RCU
>     454541 =C2=B1 10%    +144.8%    1112664 =C2=B1 20%  softirqs.CPU42.RCU
>     475468 =C2=B1  7%    +237.7%    1605708 =C2=B1 18%  softirqs.CPU43.RCU
>     618563 =C2=B1  3%     +39.1%     860217 =C2=B1 13%  softirqs.CPU43.TI=
MER
>     450517 =C2=B1  5%    +170.1%    1216896 =C2=B1  2%  softirqs.CPU44.RCU
>     454575 =C2=B1 12%    +161.0%    1186280 =C2=B1  7%  softirqs.CPU45.RCU
>     454771 =C2=B1 11%    +182.4%    1284239 =C2=B1 14%  softirqs.CPU46.RCU
>     449412 =C2=B1  6%    +149.5%    1121155 =C2=B1  7%  softirqs.CPU47.RCU
>     414849 =C2=B1  6%    +126.5%     939428 =C2=B1  6%  softirqs.CPU48.RCU
>     433016 =C2=B1  5%    +124.7%     972966 =C2=B1  4%  softirqs.CPU49.RCU
>     501748 =C2=B1 11%    +186.0%    1435214 =C2=B1  7%  softirqs.CPU5.RCU
>     423156           +97.1%     834000 =C2=B1  7%  softirqs.CPU50.RCU
>     450877 =C2=B1 10%     +86.9%     842810 =C2=B1  3%  softirqs.CPU51.RCU
>     418004 =C2=B1  7%     +97.7%     826189 =C2=B1  5%  softirqs.CPU52.RCU
>     441588 =C2=B1  9%    +101.6%     890348 =C2=B1 11%  softirqs.CPU53.RCU
>     453035 =C2=B1  9%    +105.0%     928589 =C2=B1  6%  softirqs.CPU54.RCU
>     420431 =C2=B1  7%    +121.2%     930137 =C2=B1  3%  softirqs.CPU55.RCU
>     438963 =C2=B1 12%    +105.8%     903501 =C2=B1  7%  softirqs.CPU56.RCU
>     410730 =C2=B1 13%    +113.0%     874769 =C2=B1  6%  softirqs.CPU57.RCU
>     420291 =C2=B1 11%    +107.2%     870797 =C2=B1  8%  softirqs.CPU58.RCU
>     407732 =C2=B1  4%    +127.5%     927618 =C2=B1  2%  softirqs.CPU59.RCU
>     513816 =C2=B1  9%    +205.0%    1567003 =C2=B1  6%  softirqs.CPU6.RCU
>     433723 =C2=B1  8%    +100.7%     870689 =C2=B1  8%  softirqs.CPU60.RCU
>     421901 =C2=B1 10%     +85.4%     782265 =C2=B1  7%  softirqs.CPU61.RCU
>     422623 =C2=B1 10%    +109.2%     883991 =C2=B1 10%  softirqs.CPU62.RCU
>     446480 =C2=B1 12%    +100.9%     896950 =C2=B1 13%  softirqs.CPU63.RCU
>     433999 =C2=B1  6%     +95.2%     847197 =C2=B1 10%  softirqs.CPU64.RCU
>     438890 =C2=B1  8%     +94.6%     854073 =C2=B1  4%  softirqs.CPU65.RCU
>     454182 =C2=B1  8%     +87.7%     852613 =C2=B1  4%  softirqs.CPU66.RCU
>     461925 =C2=B1  6%     +86.0%     859400 =C2=B1  8%  softirqs.CPU67.RCU
>     475795 =C2=B1  8%     +83.9%     874999 =C2=B1  5%  softirqs.CPU68.RCU
>     455685 =C2=B1  9%     +90.2%     866591 =C2=B1  4%  softirqs.CPU69.RCU
>     482041 =C2=B1 11%    +185.5%    1376404 =C2=B1  4%  softirqs.CPU7.RCU
>     463570 =C2=B1  8%    +100.2%     928244 =C2=B1  6%  softirqs.CPU70.RCU
>     459342 =C2=B1  6%     +83.8%     844048 =C2=B1 13%  softirqs.CPU71.RCU
>     433326 =C2=B1  8%    +106.0%     892758 =C2=B1  5%  softirqs.CPU72.RCU
>     443470 =C2=B1  9%    +111.3%     937255 =C2=B1 12%  softirqs.CPU73.RCU
>     456777 =C2=B1  6%    +102.4%     924332 =C2=B1  3%  softirqs.CPU74.RCU
>     426667 =C2=B1  6%    +109.6%     894288 =C2=B1 10%  softirqs.CPU75.RCU
>     459857 =C2=B1  5%     +94.8%     895808 =C2=B1  9%  softirqs.CPU76.RCU
>     459038 =C2=B1 11%    +113.8%     981209 =C2=B1  9%  softirqs.CPU77.RCU
>     428188 =C2=B1  7%    +102.6%     867397 =C2=B1 14%  softirqs.CPU78.RCU
>     437820 =C2=B1  8%    +112.9%     932211 =C2=B1 14%  softirqs.CPU79.RCU
>     483731 =C2=B1  9%    +186.0%    1383272 =C2=B1  9%  softirqs.CPU8.RCU
>     442268 =C2=B1 11%    +126.6%    1002224 =C2=B1  6%  softirqs.CPU80.RCU
>     436999 =C2=B1  6%    +136.0%    1031208 =C2=B1 11%  softirqs.CPU81.RCU
>     429103 =C2=B1  6%    +142.1%    1038942 =C2=B1  8%  softirqs.CPU82.RCU
>     430548 =C2=B1  5%    +125.4%     970384 =C2=B1  8%  softirqs.CPU83.RCU
>     436066 =C2=B1  8%    +120.9%     963403 =C2=B1  2%  softirqs.CPU84.RCU
>     456423 =C2=B1  8%     +94.9%     889464 =C2=B1  5%  softirqs.CPU85.RCU
>     439537 =C2=B1  6%    +109.2%     919640 =C2=B1 11%  softirqs.CPU86.RCU
>     431747 =C2=B1  8%    +123.5%     964856 =C2=B1  3%  softirqs.CPU87.RCU
>     430063 =C2=B1  6%    +127.5%     978424 =C2=B1  8%  softirqs.CPU88.RCU
>     434420 =C2=B1  8%    +107.6%     901876 =C2=B1 10%  softirqs.CPU89.RCU
>     454460 =C2=B1 17%    +217.2%    1441628 =C2=B1  7%  softirqs.CPU9.RCU
>     416830 =C2=B1  7%    +104.7%     853403 =C2=B1 17%  softirqs.CPU90.RCU
>     445821 =C2=B1  6%     +78.1%     794219 =C2=B1 16%  softirqs.CPU91.RCU
>     431634 =C2=B1  8%    +121.0%     953758 =C2=B1  3%  softirqs.CPU92.RCU
>     422717 =C2=B1  7%    +114.5%     906585 =C2=B1  8%  softirqs.CPU93.RCU
>     428269 =C2=B1 10%    +128.8%     979929 =C2=B1  4%  softirqs.CPU94.RCU
>     440717 =C2=B1 10%    +114.1%     943752 =C2=B1  7%  softirqs.CPU95.RCU
>   44732340 =C2=B1  7%    +142.2%  1.083e+08        softirqs.RCU
>       0.75 =C2=B1173%  +52900.0%     397.50 =C2=B1170%  interrupts.114:PC=
I-MSI.31981647-edge.i40e-eth0-TxRx-78
>      97.50 =C2=B1165%     -99.7%       0.25 =C2=B1173%  interrupts.41:PCI=
-MSI.31981574-edge.i40e-eth0-TxRx-5
>     999.50 =C2=B1169%     -99.7%       3.25 =C2=B1 59%  interrupts.51:PCI=
-MSI.31981584-edge.i40e-eth0-TxRx-15
>  3.665e+08           +36.3%  4.994e+08        interrupts.CAL:Function_cal=
l_interrupts
>    4250237 =C2=B1 15%     +94.2%    8254579 =C2=B1 14%  interrupts.CPU0.C=
AL:Function_call_interrupts
>     180.25 =C2=B1 45%   +1426.5%       2751 =C2=B1 73%  interrupts.CPU0.N=
MI:Non-maskable_interrupts
>     180.25 =C2=B1 45%   +1426.5%       2751 =C2=B1 73%  interrupts.CPU0.P=
MI:Performance_monitoring_interrupts
>    4364426 =C2=B1 15%    +101.8%    8807883 =C2=B1 14%  interrupts.CPU0.T=
LB:TLB_shootdowns
>    6887147 =C2=B1  8%     +31.6%    9065212 =C2=B1  5%  interrupts.CPU1.C=
AL:Function_call_interrupts
>     320681 =C2=B1 10%     -22.2%     249429 =C2=B1 10%  interrupts.CPU1.R=
ES:Rescheduling_interrupts
>    7069709 =C2=B1  8%     +36.9%    9678295 =C2=B1  5%  interrupts.CPU1.T=
LB:TLB_shootdowns
>    5319324 =C2=B1 18%     +61.7%    8599906 =C2=B1  7%  interrupts.CPU10.=
CAL:Function_call_interrupts
>    5459270 =C2=B1 18%     +68.1%    9178557 =C2=B1  6%  interrupts.CPU10.=
TLB:TLB_shootdowns
>    5438142 =C2=B1  8%     +51.2%    8224872 =C2=B1  7%  interrupts.CPU11.=
CAL:Function_call_interrupts
>    5573915 =C2=B1  8%     +57.4%    8774360 =C2=B1  7%  interrupts.CPU11.=
TLB:TLB_shootdowns
>    5514339 =C2=B1 20%     +51.6%    8357645 =C2=B1  7%  interrupts.CPU12.=
CAL:Function_call_interrupts
>    5655154 =C2=B1 20%     +57.7%    8919402 =C2=B1  7%  interrupts.CPU12.=
TLB:TLB_shootdowns
>     316268 =C2=B1  9%     -30.3%     220351 =C2=B1 12%  interrupts.CPU13.=
RES:Rescheduling_interrupts
>    5218746 =C2=B1 20%     +35.3%    7059981 =C2=B1  5%  interrupts.CPU14.=
CAL:Function_call_interrupts
>    5360749 =C2=B1 20%     +40.5%    7533508 =C2=B1  5%  interrupts.CPU14.=
TLB:TLB_shootdowns
>     999.00 =C2=B1169%     -99.7%       2.50 =C2=B1 60%  interrupts.CPU15.=
51:PCI-MSI.31981584-edge.i40e-eth0-TxRx-15
>    5268692 =C2=B1 21%     +27.4%    6714679 =C2=B1  4%  interrupts.CPU15.=
CAL:Function_call_interrupts
>    5406305 =C2=B1 21%     +32.6%    7167336 =C2=B1  4%  interrupts.CPU15.=
TLB:TLB_shootdowns
>     333420 =C2=B1 37%     -37.3%     208999 =C2=B1 10%  interrupts.CPU16.=
RES:Rescheduling_interrupts
>     273177 =C2=B1 23%     -33.2%     182441 =C2=B1 11%  interrupts.CPU18.=
RES:Rescheduling_interrupts
>    3894908 =C2=B1 33%     +85.0%    7204409 =C2=B1 10%  interrupts.CPU21.=
CAL:Function_call_interrupts
>    4000400 =C2=B1 33%     +92.1%    7686237 =C2=B1 10%  interrupts.CPU21.=
TLB:TLB_shootdowns
>    3311159 =C2=B1 16%    +122.7%    7372406 =C2=B1 18%  interrupts.CPU22.=
CAL:Function_call_interrupts
>    3407341 =C2=B1 16%    +130.9%    7867947 =C2=B1 18%  interrupts.CPU22.=
TLB:TLB_shootdowns
>     308340 =C2=B1 13%     -33.2%     206079 =C2=B1 25%  interrupts.CPU23.=
RES:Rescheduling_interrupts
>    4731053 =C2=B1 21%     +52.1%    7195614 =C2=B1  5%  interrupts.CPU24.=
CAL:Function_call_interrupts
>    4850668 =C2=B1 21%     +58.1%    7667084 =C2=B1  5%  interrupts.CPU24.=
TLB:TLB_shootdowns
>    5153629 =C2=B1 16%     +31.2%    6759913 =C2=B1  6%  interrupts.CPU25.=
CAL:Function_call_interrupts
>     769.75 =C2=B1101%    +469.3%       4382 =C2=B1 39%  interrupts.CPU25.=
NMI:Non-maskable_interrupts
>     769.75 =C2=B1101%    +469.3%       4382 =C2=B1 39%  interrupts.CPU25.=
PMI:Performance_monitoring_interrupts
>    5287312 =C2=B1 16%     +36.3%    7204382 =C2=B1  6%  interrupts.CPU25.=
TLB:TLB_shootdowns
>     331436 =C2=B1 17%     -31.6%     226848 =C2=B1 13%  interrupts.CPU26.=
RES:Rescheduling_interrupts
>     332756 =C2=B1 12%     -39.8%     200298 =C2=B1 10%  interrupts.CPU27.=
RES:Rescheduling_interrupts
>    4884898 =C2=B1 19%     +46.1%    7138724 =C2=B1  8%  interrupts.CPU28.=
CAL:Function_call_interrupts
>    5022338 =C2=B1 19%     +51.4%    7602363 =C2=B1  8%  interrupts.CPU28.=
TLB:TLB_shootdowns
>     935.50 =C2=B1142%    +332.3%       4044 =C2=B1 82%  interrupts.CPU29.=
NMI:Non-maskable_interrupts
>     935.50 =C2=B1142%    +332.3%       4044 =C2=B1 82%  interrupts.CPU29.=
PMI:Performance_monitoring_interrupts
>     304324 =C2=B1 19%     -30.8%     210555 =C2=B1 20%  interrupts.CPU29.=
RES:Rescheduling_interrupts
>     315423 =C2=B1 10%     -40.0%     189124 =C2=B1 30%  interrupts.CPU3.R=
ES:Rescheduling_interrupts
>    4625033 =C2=B1 14%     +53.6%    7103505 =C2=B1  8%  interrupts.CPU32.=
CAL:Function_call_interrupts
>    4747343 =C2=B1 14%     +59.5%    7571224 =C2=B1  8%  interrupts.CPU32.=
TLB:TLB_shootdowns
>    4472750 =C2=B1 21%     +69.9%    7599668 =C2=B1  6%  interrupts.CPU33.=
CAL:Function_call_interrupts
>    4584043 =C2=B1 21%     +76.6%    8095690 =C2=B1  7%  interrupts.CPU33.=
TLB:TLB_shootdowns
>    4268226 =C2=B1 38%     +65.0%    7043245 =C2=B1 13%  interrupts.CPU34.=
CAL:Function_call_interrupts
>    4379970 =C2=B1 38%     +71.3%    7504681 =C2=B1 13%  interrupts.CPU34.=
TLB:TLB_shootdowns
>     255741 =C2=B1 19%     -31.9%     174271 =C2=B1 16%  interrupts.CPU35.=
RES:Rescheduling_interrupts
>    4833654 =C2=B1 15%     +28.6%    6217724 =C2=B1  9%  interrupts.CPU36.=
CAL:Function_call_interrupts
>    4953580 =C2=B1 15%     +33.9%    6634073 =C2=B1  9%  interrupts.CPU36.=
TLB:TLB_shootdowns
>    3812596 =C2=B1 18%     +78.8%    6817083 =C2=B1 10%  interrupts.CPU37.=
CAL:Function_call_interrupts
>    3904296 =C2=B1 18%     +86.0%    7263429 =C2=B1 10%  interrupts.CPU37.=
TLB:TLB_shootdowns
>    4570954 =C2=B1  4%     +26.3%    5772207 =C2=B1  6%  interrupts.CPU38.=
CAL:Function_call_interrupts
>     246444 =C2=B1  9%     -26.2%     181774 =C2=B1  4%  interrupts.CPU38.=
RES:Rescheduling_interrupts
>    4688436 =C2=B1  4%     +31.3%    6154828 =C2=B1  6%  interrupts.CPU38.=
TLB:TLB_shootdowns
>     257365 =C2=B1 18%     -30.8%     178063 =C2=B1  3%  interrupts.CPU39.=
RES:Rescheduling_interrupts
>    6333449 =C2=B1 20%     +44.8%    9168599 =C2=B1  8%  interrupts.CPU4.C=
AL:Function_call_interrupts
>    6509539 =C2=B1 20%     +50.3%    9783596 =C2=B1  8%  interrupts.CPU4.T=
LB:TLB_shootdowns
>    3861253 =C2=B1 24%     +56.7%    6049605 =C2=B1 10%  interrupts.CPU40.=
CAL:Function_call_interrupts
>       6082 =C2=B1 29%     -68.9%       1894 =C2=B1 60%  interrupts.CPU40.=
NMI:Non-maskable_interrupts
>       6082 =C2=B1 29%     -68.9%       1894 =C2=B1 60%  interrupts.CPU40.=
PMI:Performance_monitoring_interrupts
>    3955076 =C2=B1 25%     +63.0%    6446080 =C2=B1  9%  interrupts.CPU40.=
TLB:TLB_shootdowns
>    3936669 =C2=B1 17%     +43.8%    5660309 =C2=B1 13%  interrupts.CPU41.=
CAL:Function_call_interrupts
>       2429 =C2=B1121%     -95.5%     109.25 =C2=B1 26%  interrupts.CPU41.=
NMI:Non-maskable_interrupts
>       2429 =C2=B1121%     -95.5%     109.25 =C2=B1 26%  interrupts.CPU41.=
PMI:Performance_monitoring_interrupts
>    4040803 =C2=B1 17%     +49.3%    6031191 =C2=B1 13%  interrupts.CPU41.=
TLB:TLB_shootdowns
>    3837743 =C2=B1 14%    +134.3%    8992108 =C2=B1 24%  interrupts.CPU43.=
CAL:Function_call_interrupts
>    3925024 =C2=B1 14%    +143.8%    9569245 =C2=B1 23%  interrupts.CPU43.=
TLB:TLB_shootdowns
>    3723900 =C2=B1 18%     +51.1%    5628458 =C2=B1  8%  interrupts.CPU44.=
CAL:Function_call_interrupts
>    3812856 =C2=B1 18%     +57.4%    6002945 =C2=B1  8%  interrupts.CPU44.=
TLB:TLB_shootdowns
>    4018194 =C2=B1 13%     +41.9%    5701949 =C2=B1 14%  interrupts.CPU45.=
TLB:TLB_shootdowns
>       5920 =C2=B1 40%     -93.9%     359.00 =C2=B1 72%  interrupts.CPU46.=
NMI:Non-maskable_interrupts
>       5920 =C2=B1 40%     -93.9%     359.00 =C2=B1 72%  interrupts.CPU46.=
PMI:Performance_monitoring_interrupts
>    3095335 =C2=B1 10%     +34.1%    4151554 =C2=B1 14%  interrupts.CPU47.=
CAL:Function_call_interrupts
>    3177654 =C2=B1 10%     +39.3%    4426572 =C2=B1 14%  interrupts.CPU47.=
TLB:TLB_shootdowns
>    2333315 =C2=B1 23%     +49.8%    3496470 =C2=B1 17%  interrupts.CPU48.=
CAL:Function_call_interrupts
>     227.25 =C2=B1 40%    +594.5%       1578 =C2=B1 57%  interrupts.CPU48.=
NMI:Non-maskable_interrupts
>     227.25 =C2=B1 40%    +594.5%       1578 =C2=B1 57%  interrupts.CPU48.=
PMI:Performance_monitoring_interrupts
>    2388411 =C2=B1 23%     +56.4%    3734706 =C2=B1 17%  interrupts.CPU48.=
TLB:TLB_shootdowns
>     156678 =C2=B1 16%     -25.9%     116081 =C2=B1  3%  interrupts.CPU49.=
RES:Rescheduling_interrupts
>      97.00 =C2=B1166%    -100.0%       0.00        interrupts.CPU5.41:PCI=
-MSI.31981574-edge.i40e-eth0-TxRx-5
>    6422259 =C2=B1 17%     +40.0%    8994022 =C2=B1  4%  interrupts.CPU5.C=
AL:Function_call_interrupts
>    6588736 =C2=B1 17%     +45.7%    9599344 =C2=B1  4%  interrupts.CPU5.T=
LB:TLB_shootdowns
>    2754289 =C2=B1  8%     +20.4%    3314941 =C2=B1  7%  interrupts.CPU50.=
CAL:Function_call_interrupts
>     129863 =C2=B1 10%     -31.6%      88869 =C2=B1 12%  interrupts.CPU50.=
RES:Rescheduling_interrupts
>    2829118 =C2=B1  8%     +25.3%    3543789 =C2=B1  7%  interrupts.CPU50.=
TLB:TLB_shootdowns
>     140169 =C2=B1 12%     -41.9%      81381 =C2=B1 18%  interrupts.CPU51.=
RES:Rescheduling_interrupts
>     140297 =C2=B1 16%     -30.9%      96921 =C2=B1 16%  interrupts.CPU53.=
RES:Rescheduling_interrupts
>    2921981 =C2=B1 15%     +27.1%    3714944 =C2=B1 13%  interrupts.CPU53.=
TLB:TLB_shootdowns
>    3237400 =C2=B1 19%     +33.0%    4305778 =C2=B1 14%  interrupts.CPU54.=
CAL:Function_call_interrupts
>     166668 =C2=B1  6%     -33.2%     111304 =C2=B1  9%  interrupts.CPU54.=
RES:Rescheduling_interrupts
>    3321770 =C2=B1 19%     +38.5%    4599776 =C2=B1 14%  interrupts.CPU54.=
TLB:TLB_shootdowns
>    3007556 =C2=B1 25%     +29.2%    3886147 =C2=B1  5%  interrupts.CPU55.=
CAL:Function_call_interrupts
>    3087920 =C2=B1 25%     +34.5%    4154362 =C2=B1  5%  interrupts.CPU55.=
TLB:TLB_shootdowns
>     134219 =C2=B1  6%     -27.1%      97792 =C2=B1 12%  interrupts.CPU56.=
RES:Rescheduling_interrupts
>    1936189 =C2=B1 59%     +91.9%    3715887 =C2=B1  4%  interrupts.CPU57.=
CAL:Function_call_interrupts
>    1984477 =C2=B1 59%    +100.1%    3971841 =C2=B1  4%  interrupts.CPU57.=
TLB:TLB_shootdowns
>    2155219 =C2=B1 23%     +69.9%    3660679 =C2=B1 11%  interrupts.CPU59.=
CAL:Function_call_interrupts
>    2207465 =C2=B1 24%     +77.2%    3911795 =C2=B1 11%  interrupts.CPU59.=
TLB:TLB_shootdowns
>    6622562 =C2=B1 14%     +50.6%    9974322 =C2=B1  9%  interrupts.CPU6.C=
AL:Function_call_interrupts
>     331433 =C2=B1 14%     -19.7%     266042 =C2=B1  7%  interrupts.CPU6.R=
ES:Rescheduling_interrupts
>    6791301 =C2=B1 14%     +56.7%   10639319 =C2=B1  9%  interrupts.CPU6.T=
LB:TLB_shootdowns
>    2319114 =C2=B1 23%     +62.6%    3770521 =C2=B1 10%  interrupts.CPU60.=
CAL:Function_call_interrupts
>     133595 =C2=B1  8%     -23.3%     102532 =C2=B1 14%  interrupts.CPU60.=
RES:Rescheduling_interrupts
>    2384205 =C2=B1 23%     +69.0%    4028121 =C2=B1 10%  interrupts.CPU60.=
TLB:TLB_shootdowns
>    1985143 =C2=B1 36%     +93.9%    3849410 =C2=B1 22%  interrupts.CPU64.=
TLB:TLB_shootdowns
>    1934320 =C2=B1 19%     +39.1%    2690966 =C2=B1 10%  interrupts.CPU65.=
CAL:Function_call_interrupts
>    1989414 =C2=B1 19%     +44.6%    2876877 =C2=B1 10%  interrupts.CPU65.=
TLB:TLB_shootdowns
>     144699 =C2=B1  6%     -41.0%      85346 =C2=B1 15%  interrupts.CPU67.=
RES:Rescheduling_interrupts
>    1781258 =C2=B1 54%     +83.6%    3270508 =C2=B1  8%  interrupts.CPU69.=
CAL:Function_call_interrupts
>    1826936 =C2=B1 54%     +91.4%    3496606 =C2=B1  8%  interrupts.CPU69.=
TLB:TLB_shootdowns
>    6036433 =C2=B1 10%     +45.9%    8805646 =C2=B1  6%  interrupts.CPU7.C=
AL:Function_call_interrupts
>    6189031 =C2=B1 10%     +51.8%    9396175 =C2=B1  6%  interrupts.CPU7.T=
LB:TLB_shootdowns
>    1627804 =C2=B1 44%    +121.9%    3612617 =C2=B1 15%  interrupts.CPU70.=
CAL:Function_call_interrupts
>    1674222 =C2=B1 44%    +130.5%    3859473 =C2=B1 16%  interrupts.CPU70.=
TLB:TLB_shootdowns
>     145373 =C2=B1 13%     -44.7%      80450 =C2=B1 32%  interrupts.CPU71.=
RES:Rescheduling_interrupts
>    1854119 =C2=B1 28%     +63.6%    3033881 =C2=B1  4%  interrupts.CPU72.=
CAL:Function_call_interrupts
>    1900533 =C2=B1 29%     +70.6%    3242000 =C2=B1  4%  interrupts.CPU72.=
TLB:TLB_shootdowns
>     573.25 =C2=B1 88%    +755.7%       4905 =C2=B1 14%  interrupts.CPU73.=
NMI:Non-maskable_interrupts
>     573.25 =C2=B1 88%    +755.7%       4905 =C2=B1 14%  interrupts.CPU73.=
PMI:Performance_monitoring_interrupts
>       5642 =C2=B1 54%     -85.5%     816.00 =C2=B1146%  interrupts.CPU74.=
NMI:Non-maskable_interrupts
>       5642 =C2=B1 54%     -85.5%     816.00 =C2=B1146%  interrupts.CPU74.=
PMI:Performance_monitoring_interrupts
>     156895 =C2=B1 19%     -31.4%     107653 =C2=B1  9%  interrupts.CPU74.=
RES:Rescheduling_interrupts
>     136591 =C2=B1 20%     -34.1%      90037 =C2=B1 12%  interrupts.CPU75.=
RES:Rescheduling_interrupts
>    1957783 =C2=B1 33%     +57.4%    3082257 =C2=B1 14%  interrupts.CPU76.=
CAL:Function_call_interrupts
>     134538 =C2=B1  9%     -27.1%      98018 =C2=B1 16%  interrupts.CPU76.=
RES:Rescheduling_interrupts
>    2007848 =C2=B1 33%     +63.8%    3289196 =C2=B1 15%  interrupts.CPU76.=
TLB:TLB_shootdowns
>    2077242 =C2=B1 20%     +46.9%    3052413 =C2=B1  5%  interrupts.CPU77.=
CAL:Function_call_interrupts
>    2130239 =C2=B1 20%     +53.0%    3259669 =C2=B1  5%  interrupts.CPU77.=
TLB:TLB_shootdowns
>       0.50 =C2=B1173%  +79250.0%     396.75 =C2=B1170%  interrupts.CPU78.=
114:PCI-MSI.31981647-edge.i40e-eth0-TxRx-78
>    5676981 =C2=B1 16%     +52.9%    8681781 =C2=B1 19%  interrupts.CPU8.C=
AL:Function_call_interrupts
>    5824519 =C2=B1 16%     +59.0%    9260770 =C2=B1 19%  interrupts.CPU8.T=
LB:TLB_shootdowns
>    2790943 =C2=B1 15%     +34.8%    3761999 =C2=B1 13%  interrupts.CPU80.=
CAL:Function_call_interrupts
>     166386 =C2=B1 15%     -25.1%     124544 =C2=B1 13%  interrupts.CPU80.=
RES:Rescheduling_interrupts
>    2860209 =C2=B1 15%     +40.4%    4016175 =C2=B1 14%  interrupts.CPU80.=
TLB:TLB_shootdowns
>    2068338 =C2=B1 52%     +99.1%    4118332 =C2=B1 10%  interrupts.CPU82.=
CAL:Function_call_interrupts
>    2117237 =C2=B1 52%    +107.5%    4393055 =C2=B1 10%  interrupts.CPU82.=
TLB:TLB_shootdowns
>     189027 =C2=B1 32%     -39.5%     114387 =C2=B1 16%  interrupts.CPU83.=
RES:Rescheduling_interrupts
>    2862990 =C2=B1 25%     +31.7%    3769327 =C2=B1  8%  interrupts.CPU84.=
CAL:Function_call_interrupts
>    2933064 =C2=B1 25%     +37.1%    4021916 =C2=B1  8%  interrupts.CPU84.=
TLB:TLB_shootdowns
>     159294 =C2=B1 24%     -31.6%     108891 =C2=B1 15%  interrupts.CPU86.=
RES:Rescheduling_interrupts
>     149416 =C2=B1 24%     -24.8%     112293 =C2=B1  4%  interrupts.CPU87.=
RES:Rescheduling_interrupts
>       2160 =C2=B1131%     -94.5%     118.00 =C2=B1 45%  interrupts.CPU89.=
NMI:Non-maskable_interrupts
>       2160 =C2=B1131%     -94.5%     118.00 =C2=B1 45%  interrupts.CPU89.=
PMI:Performance_monitoring_interrupts
>    5133940 =C2=B1 42%     +78.0%    9137868 =C2=B1  3%  interrupts.CPU9.C=
AL:Function_call_interrupts
>    5260647 =C2=B1 42%     +85.4%    9752902 =C2=B1  3%  interrupts.CPU9.T=
LB:TLB_shootdowns
>     147315 =C2=B1 20%     -43.6%      83131 =C2=B1 33%  interrupts.CPU91.=
RES:Rescheduling_interrupts
>    2765546 =C2=B1 15%     +30.5%    3610145 =C2=B1  4%  interrupts.CPU92.=
CAL:Function_call_interrupts
>     160350 =C2=B1 19%     -26.2%     118337 =C2=B1  5%  interrupts.CPU92.=
RES:Rescheduling_interrupts
>    2824612 =C2=B1 15%     +36.3%    3850288 =C2=B1  4%  interrupts.CPU92.=
TLB:TLB_shootdowns
>    1795118 =C2=B1 10%     +70.4%    3058852 =C2=B1 27%  interrupts.CPU94.=
CAL:Function_call_interrupts
>       4289 =C2=B1 53%     -91.7%     357.50 =C2=B1100%  interrupts.CPU94.=
NMI:Non-maskable_interrupts
>       4289 =C2=B1 53%     -91.7%     357.50 =C2=B1100%  interrupts.CPU94.=
PMI:Performance_monitoring_interrupts
>    1838265 =C2=B1 11%     +77.4%    3261908 =C2=B1 26%  interrupts.CPU94.=
TLB:TLB_shootdowns
>   19195824 =C2=B1  9%     -22.6%   14857933 =C2=B1  2%  interrupts.RES:Re=
scheduling_interrupts
>  3.759e+08           +41.8%  5.328e+08        interrupts.TLB:TLB_shootdow=
ns
>      30.67 =C2=B1  9%     -29.9        0.79 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.get_swap_page.add_to_swap.shrink_page_list.shrink_inactive_=
list.shrink_lruvec
>      29.50 =C2=B1  8%     -29.2        0.28 =C2=B1100%  perf-profile.call=
trace.cycles-pp.get_swap_pages.get_swap_page.add_to_swap.shrink_page_list.s=
hrink_inactive_list
>      32.44 =C2=B1  9%     -22.1       10.31 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.add_to_swap.shrink_page_list.shrink_inactive_list.shrink_lr=
uvec.shrink_node
>      17.82 =C2=B1  5%     -17.8        0.00        perf-profile.calltrace=
.cycles-pp.scan_swap_map_slots.get_swap_pages.get_swap_page.add_to_swap.shr=
ink_page_list
>      14.95 =C2=B1  4%     -14.9        0.00        perf-profile.calltrace=
.cycles-pp._raw_spin_lock.scan_swap_map_slots.get_swap_pages.get_swap_page.=
add_to_swap
>      13.56 =C2=B1  4%     -13.6        0.00        perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.scan_swap_map_sl=
ots.get_swap_pages.get_swap_page
>      39.98 =C2=B1 11%     -11.8       28.19 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.shrink_page_list.shrink_inactive_list.shrink_lruvec.shrink_=
node.do_try_to_free_pages
>      41.74 =C2=B1 11%     -10.6       31.14 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.shrink_inactive_list.shrink_lruvec.shrink_node.do_try_to_fr=
ee_pages.try_to_free_pages
>      43.84 =C2=B1 11%      -9.8       34.07 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.do_try_to_free_pages.try_to_free_pages.__alloc_pages_slowpa=
th.__alloc_pages_nodemask.alloc_pages_vma
>      43.92 =C2=B1 10%      -9.8       34.16 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.shrink_lruvec.shrink_node.do_try_to_free_pages.try_to_free_=
pages.__alloc_pages_slowpath
>       9.73 =C2=B1 15%      -9.7        0.00        perf-profile.calltrace=
.cycles-pp._raw_spin_lock.get_swap_pages.get_swap_page.add_to_swap.shrink_p=
age_list
>      43.98 =C2=B1 11%      -9.7       34.29 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_node=
mask.alloc_pages_vma.do_swap_page
>      44.32 =C2=B1 10%      -9.5       34.79 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.shrink_node.do_try_to_free_pages.try_to_free_pages.__alloc_=
pages_slowpath.__alloc_pages_nodemask
>      44.87 =C2=B1 11%      -9.5       35.39 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.__alloc_pages_slowpath.__alloc_pages_nodemask.alloc_pages_v=
ma.do_swap_page.handle_pte_fault
>       8.60 =C2=B1 15%      -8.6        0.00        perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.get_swap_pages.g=
et_swap_page.add_to_swap
>       0.97 =C2=B1 15%      -0.7        0.27 =C2=B1100%  perf-profile.call=
trace.cycles-pp.put_swap_page.__remove_mapping.shrink_page_list.shrink_inac=
tive_list.shrink_lruvec
>       1.39 =C2=B1 14%      -0.7        0.71 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.swap_writepage.pageout.shrink_page_list.shrink_inactive_lis=
t.shrink_lruvec
>       1.60 =C2=B1 13%      -0.6        0.97 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.try_to_unmap_one.rmap_walk_anon.try_to_unmap.shrink_page_li=
st.shrink_inactive_list
>       1.76 =C2=B1 13%      -0.6        1.18 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.rmap_walk_anon.try_to_unmap.shrink_page_list.shrink_inactiv=
e_list.shrink_lruvec
>       1.80 =C2=B1 13%      -0.6        1.23 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.try_to_unmap.shrink_page_list.shrink_inactive_list.shrink_l=
ruvec.shrink_node
>       0.73 =C2=B1 16%      +0.3        1.06 =C2=B1 14%  perf-profile.call=
trace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.shrink_=
active_list.shrink_lruvec.shrink_node
>       0.73 =C2=B1 17%      +0.3        1.07 =C2=B1 14%  perf-profile.call=
trace.cycles-pp._raw_spin_lock_irq.shrink_active_list.shrink_lruvec.shrink_=
node.do_try_to_free_pages
>       0.85 =C2=B1 17%      +0.4        1.25 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.shrink_=
inactive_list.shrink_lruvec.shrink_node
>       0.88 =C2=B1 17%      +0.4        1.28 =C2=B1 10%  perf-profile.call=
trace.cycles-pp._raw_spin_lock_irq.shrink_inactive_list.shrink_lruvec.shrin=
k_node.do_try_to_free_pages
>       0.43 =C2=B1 61%      +0.4        0.88 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.page_referenced.shrink_active_list.shrink_lruvec.shrink_nod=
e.do_try_to_free_pages
>       0.75 =C2=B1 18%      +0.5        1.22 =C2=B1 23%  perf-profile.call=
trace.cycles-pp.page_vma_mapped_walk.page_referenced_one.rmap_walk_anon.pag=
e_referenced.shrink_page_list
>       0.69 =C2=B1 18%      +0.5        1.19 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.free_pcppages_bulk.drain_pages_zone.drain_pages.drain_local=
_pages_wq.process_one_work
>       0.72 =C2=B1 18%      +0.5        1.22 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.drain_local_pages_wq.process_one_work.worker_thread.kthread=
.ret_from_fork
>       0.72 =C2=B1 18%      +0.5        1.22 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.drain_pages.drain_local_pages_wq.process_one_work.worker_th=
read.kthread
>       0.71 =C2=B1 18%      +0.5        1.21 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.drain_pages_zone.drain_pages.drain_local_pages_wq.process_o=
ne_work.worker_thread
>       0.31 =C2=B1100%      +0.5        0.82 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.end_page_writeback.pmem_rw_page.bdev_write_page.__swap_writ=
epage.pageout
>       0.13 =C2=B1173%      +0.5        0.66 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.page_referenced_one.rmap_walk_anon.page_referenced.shrink_a=
ctive_list.shrink_lruvec
>       0.00            +0.6        0.56 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.xas_store.__delete_from_swap_cache.__remove_mapping.shrink_page_=
list.shrink_inactive_list
>       0.00            +0.6        0.59 =C2=B1 11%  perf-profile.calltrace=
.cycles-pp.shrink_slab.shrink_node.do_try_to_free_pages.try_to_free_pages._=
_alloc_pages_slowpath
>       0.00            +0.6        0.60 =C2=B1 11%  perf-profile.calltrace=
.cycles-pp.page_vma_mapped_walk.page_referenced_one.rmap_walk_anon.page_ref=
erenced.shrink_active_list
>       0.31 =C2=B1100%      +0.6        0.92 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.__delete_from_swap_cache.__remove_mapping.shrink_page_list.=
shrink_inactive_list.shrink_lruvec
>       0.00            +0.6        0.60 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.mem_cgroup_swapout.__remove_mapping.shrink_page_list.shrink_inac=
tive_list.shrink_lruvec
>       0.00            +0.6        0.61 =C2=B1 14%  perf-profile.calltrace=
.cycles-pp.__lru_cache_add.do_swap_page.handle_pte_fault.__handle_mm_fault.=
handle_mm_fault
>       0.81 =C2=B1 18%      +0.6        1.46 =C2=B1 24%  perf-profile.call=
trace.cycles-pp.page_referenced_one.rmap_walk_anon.page_referenced.shrink_p=
age_list.shrink_inactive_list
>       1.39 =C2=B1  7%      +0.7        2.04 =C2=B1 14%  perf-profile.call=
trace.cycles-pp.worker_thread.kthread.ret_from_fork
>       1.34 =C2=B1  7%      +0.7        1.99 =C2=B1 14%  perf-profile.call=
trace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork
>       0.17 =C2=B1173%      +0.7        0.82 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.rmap_walk_anon.page_referenced.shrink_active_list.shrink_lr=
uvec.shrink_node
>       0.00            +0.7        0.67 =C2=B1 12%  perf-profile.calltrace=
.cycles-pp.swap_cgroup_record.mem_cgroup_uncharge_swap.swapcache_free_entri=
es.free_swap_slot.__swap_entry_free
>       0.13 =C2=B1173%      +0.7        0.81 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.free_pcppag=
es_bulk.drain_pages_zone.drain_pages
>       0.14 =C2=B1173%      +0.7        0.82 =C2=B1 10%  perf-profile.call=
trace.cycles-pp._raw_spin_lock.free_pcppages_bulk.drain_pages_zone.drain_pa=
ges.drain_local_pages_wq
>       0.81 =C2=B1 15%      +0.7        1.54 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.mem_cgroup_uncharge_swap.swapcache_free_entries.free_swap_s=
lot.__swap_entry_free.do_swap_page
>       1.69 =C2=B1 13%      +0.8        2.46 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.__memcpy_mcsafe.pmem_do_read.pmem_rw_page.bdev_read_page.sw=
ap_readpage
>       1.71 =C2=B1 13%      +0.8        2.50 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.pmem_do_read.pmem_rw_page.bdev_read_page.swap_readpage.do_s=
wap_page
>       0.00            +0.8        0.81 =C2=B1 11%  perf-profile.calltrace=
.cycles-pp.mem_cgroup_id_put_many.mem_cgroup_uncharge_swap.swapcache_free_e=
ntries.free_swap_slot.__swap_entry_free
>       2.67 =C2=B1 14%      +0.8        3.50 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.swap_readpage.do_swap_page.handle_pte_fault.__handle_mm_fau=
lt.handle_mm_fault
>       1.82 =C2=B1 13%      +0.9        2.67 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.pmem_rw_page.bdev_read_page.swap_readpage.do_swap_page.hand=
le_pte_fault
>       1.85 =C2=B1 12%      +0.9        2.71 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.bdev_read_page.swap_readpage.do_swap_page.handle_pte_fault.=
__handle_mm_fault
>       1.69 =C2=B1 15%      +0.9        2.57 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.shrink_active_list.shrink_lruvec.shrink_node.do_try_to_free=
_pages.try_to_free_pages
>       1.13 =C2=B1 17%      +1.1        2.18 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.rmap_walk_anon.page_referenced.shrink_page_list.shrink_inac=
tive_list.shrink_lruvec
>       1.19 =C2=B1 17%      +1.1        2.29 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.page_referenced.shrink_page_list.shrink_inactive_list.shrin=
k_lruvec.shrink_node
>       1.53 =C2=B1 14%      +1.1        2.63 =C2=B1 17%  perf-profile.call=
trace.cycles-pp.__memcpy_flushcache.write_pmem.pmem_do_write.pmem_rw_page.b=
dev_write_page
>       1.55 =C2=B1 14%      +1.1        2.68 =C2=B1 17%  perf-profile.call=
trace.cycles-pp.write_pmem.pmem_do_write.pmem_rw_page.bdev_write_page.__swa=
p_writepage
>       1.55 =C2=B1 14%      +1.1        2.69 =C2=B1 17%  perf-profile.call=
trace.cycles-pp.pmem_do_write.pmem_rw_page.bdev_write_page.__swap_writepage=
.pageout
>       3.36 =C2=B1 18%      +1.3        4.62 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.__swap_writepage.pageout.shrink_page_list.shrink_inactive_l=
ist.shrink_lruvec
>       8.54 =C2=B1  8%      +1.4        9.90 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.ret_from_fork
>       8.53 =C2=B1  8%      +1.4        9.90 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.kthread.ret_from_fork
>       0.73 =C2=B1 20%      +1.4        2.15 =C2=B1 27%  perf-profile.call=
trace.cycles-pp.smp_call_function_single.on_each_cpu_cond_mask.arch_tlbbatc=
h_flush.try_to_unmap_flush_dirty.shrink_page_list
>       0.00            +1.6        1.57 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.smp_call_function_many_cond.on_each_cpu_cond_mask.arch_tlbbatch_=
flush.try_to_unmap_flush_dirty.shrink_page_list
>       2.12 =C2=B1 14%      +1.7        3.85 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.pmem_rw_page.bdev_write_page.__swap_writepage.pageout.shrin=
k_page_list
>       2.54 =C2=B1 20%      +1.9        4.42 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.bdev_write_page.__swap_writepage.pageout.shrink_page_list.s=
hrink_inactive_list
>       0.13 =C2=B1173%      +2.3        2.47 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.swapcache_f=
ree_entries.free_swap_slot.__swap_entry_free
>       0.28 =C2=B1100%      +2.4        2.63 =C2=B1  7%  perf-profile.call=
trace.cycles-pp._raw_spin_lock.swapcache_free_entries.free_swap_slot.__swap=
_entry_free.do_swap_page
>       1.62 =C2=B1 15%      +2.6        4.19 =C2=B1 16%  perf-profile.call=
trace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.mem_cgr=
oup_commit_charge.do_swap_page.handle_pte_fault
>       1.71 =C2=B1 15%      +2.7        4.39 =C2=B1 16%  perf-profile.call=
trace.cycles-pp._raw_spin_lock_irq.mem_cgroup_commit_charge.do_swap_page.ha=
ndle_pte_fault.__handle_mm_fault
>       1.15 =C2=B1 15%      +2.7        3.85 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.on_each_cpu_cond_mask.arch_tlbbatch_flush.try_to_unmap_flus=
h_dirty.shrink_page_list.shrink_inactive_list
>       1.16 =C2=B1 15%      +2.7        3.87 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.arch_tlbbatch_flush.try_to_unmap_flush_dirty.shrink_page_li=
st.shrink_inactive_list.shrink_lruvec
>       1.16 =C2=B1 15%      +2.7        3.88 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.try_to_unmap_flush_dirty.shrink_page_list.shrink_inactive_l=
ist.shrink_lruvec.shrink_node
>       1.81 =C2=B1 15%      +2.8        4.59 =C2=B1 16%  perf-profile.call=
trace.cycles-pp.mem_cgroup_commit_charge.do_swap_page.handle_pte_fault.__ha=
ndle_mm_fault.handle_mm_fault
>       1.79 =C2=B1 14%      +3.4        5.23 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.swapcache_free_entries.free_swap_slot.__swap_entry_free.do_=
swap_page.handle_pte_fault
>       2.15 =C2=B1 15%      +3.5        5.70 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.free_swap_slot.__swap_entry_free.do_swap_page.handle_pte_fa=
ult.__handle_mm_fault
>       2.34 =C2=B1 15%      +3.7        6.03 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.__swap_entry_free.do_swap_page.handle_pte_fault.__handle_mm=
_fault.handle_mm_fault
>       0.28 =C2=B1100%      +6.2        6.44 =C2=B1 13%  perf-profile.call=
trace.cycles-pp._raw_spin_lock_irqsave.__remove_mapping.shrink_page_list.sh=
rink_inactive_list.shrink_lruvec
>       0.00            +6.2        6.25 =C2=B1 13%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__remove=
_mapping.shrink_page_list.shrink_inactive_list
>       0.29 =C2=B1100%      +6.7        7.02 =C2=B1 12%  perf-profile.call=
trace.cycles-pp._raw_spin_lock_irq.add_to_swap_cache.add_to_swap.shrink_pag=
e_list.shrink_inactive_list
>       0.13 =C2=B1173%      +6.7        6.87 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.add_to_=
swap_cache.add_to_swap.shrink_page_list
>       2.51 =C2=B1 15%      +7.0        9.50 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.__remove_mapping.shrink_page_list.shrink_inactive_list.shri=
nk_lruvec.shrink_node
>       0.94 =C2=B1 15%      +7.6        8.52 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.add_to_swap_cache.add_to_swap.shrink_page_list.shrink_inact=
ive_list.shrink_lruvec
>      31.30 =C2=B1  9%     -30.1        1.19 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.get_swap_page
>      30.10 =C2=B1  9%     -29.3        0.84 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.get_swap_pages
>      33.04 =C2=B1  9%     -22.7       10.38 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.add_to_swap
>      28.05 =C2=B1  9%     -22.3        5.79 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock
>      18.25 =C2=B1  5%     -17.7        0.55 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.scan_swap_map_slots
>      47.61 =C2=B1 10%     -12.3       35.27 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.shrink_page_list
>      49.74 =C2=B1 10%     -11.1       38.64 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.shrink_inactive_list
>      45.29 =C2=B1 11%     -10.2       35.09 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.do_try_to_free_pages
>      45.44 =C2=B1 11%     -10.1       35.32 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.try_to_free_pages
>      51.93 =C2=B1 10%     -10.1       41.87 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.shrink_lruvec
>      46.34 =C2=B1 11%      -9.9       36.45 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.__alloc_pages_slowpath
>       1.64 =C2=B1 13%      -0.7        0.91 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.swap_writepage
>       1.06 =C2=B1 13%      -0.7        0.38 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.page_swapcount
>       1.08 =C2=B1 13%      -0.7        0.41 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.try_to_free_swap
>       1.60 =C2=B1 15%      -0.7        0.94 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.page_swap_info
>       1.88 =C2=B1 13%      -0.7        1.23 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.try_to_unmap_one
>       0.95 =C2=B1 13%      -0.6        0.35 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.__swap_duplicate
>       0.95 =C2=B1 13%      -0.6        0.35 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.swap_duplicate
>       2.11 =C2=B1 13%      -0.6        1.53 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.try_to_unmap
>       1.14 =C2=B1 13%      -0.5        0.62 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.put_swap_page
>       2.06 =C2=B1 15%      -0.5        1.54 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp._swap_info_get
>       0.74 =C2=B1 14%      -0.4        0.31 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.swap_set_page_dirty
>       0.67 =C2=B1 49%      -0.4        0.29 =C2=B1 31%  perf-profile.chil=
dren.cycles-pp.entry_SYSCALL_64_after_hwframe
>       0.67 =C2=B1 49%      -0.4        0.29 =C2=B1 31%  perf-profile.chil=
dren.cycles-pp.do_syscall_64
>       0.46 =C2=B1 15%      -0.4        0.09 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.mutex_lock
>       1.15 =C2=B1 15%      -0.3        0.82 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.get_swap_device
>       0.36 =C2=B1  9%      -0.3        0.05        perf-profile.children.=
cycles-pp.pagecache_get_page
>       0.44 =C2=B1 42%      -0.3        0.16 =C2=B1 39%  perf-profile.chil=
dren.cycles-pp.forkshell
>       0.40 =C2=B1 47%      -0.2        0.15 =C2=B1 41%  perf-profile.chil=
dren.cycles-pp.__libc_fork
>       0.35 =C2=B1 52%      -0.2        0.14 =C2=B1 42%  perf-profile.chil=
dren.cycles-pp.__do_sys_clone
>       0.35 =C2=B1 52%      -0.2        0.14 =C2=B1 42%  perf-profile.chil=
dren.cycles-pp._do_fork
>       0.35 =C2=B1 52%      -0.2        0.14 =C2=B1 42%  perf-profile.chil=
dren.cycles-pp.copy_process
>       0.20 =C2=B1 71%      -0.1        0.06 =C2=B1 68%  perf-profile.chil=
dren.cycles-pp.execve
>       0.20 =C2=B1 71%      -0.1        0.06 =C2=B1 68%  perf-profile.chil=
dren.cycles-pp.__x64_sys_execve
>       0.20 =C2=B1 71%      -0.1        0.06 =C2=B1 68%  perf-profile.chil=
dren.cycles-pp.__do_execve_file
>       0.15 =C2=B1 32%      -0.1        0.06 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.pte_alloc_one
>       0.45 =C2=B1 15%      -0.1        0.35 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.ktime_get
>       0.10 =C2=B1 27%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.do_wp_page
>       0.08 =C2=B1 15%      +0.0        0.11 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.native_flush_tlb
>       0.08 =C2=B1 16%      +0.0        0.11 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.llist_add_batch
>       0.07 =C2=B1 12%      +0.0        0.10 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.xas_init_marks
>       0.08 =C2=B1 20%      +0.0        0.11 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__count_memcg_events
>       0.07 =C2=B1 19%      +0.0        0.10 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.__mod_zone_page_state
>       0.11 =C2=B1 11%      +0.0        0.15 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.sort_r
>       0.07 =C2=B1 30%      +0.0        0.11 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.__perf_sw_event
>       0.04 =C2=B1 59%      +0.0        0.08 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.mem_cgroup_charge_statistics
>       0.03 =C2=B1100%      +0.0        0.06 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.inc_node_page_state
>       0.12 =C2=B1 10%      +0.0        0.16 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.page_mapping
>       0.09 =C2=B1 13%      +0.0        0.13 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.___might_sleep
>       0.04 =C2=B1 58%      +0.0        0.08 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.super_cache_count
>       0.10 =C2=B1 11%      +0.0        0.14 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.__mod_node_page_state
>       0.03 =C2=B1100%      +0.0        0.07 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.___perf_sw_event
>       0.08 =C2=B1 15%      +0.0        0.13 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.__mod_memcg_state
>       0.11 =C2=B1 13%      +0.1        0.16 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.page_endio
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.children.=
cycles-pp.ptep_clear_flush_young
>       0.00            +0.1        0.06 =C2=B1  9%  perf-profile.children.=
cycles-pp.vmacache_find
>       0.00            +0.1        0.06 =C2=B1 15%  perf-profile.children.=
cycles-pp.anon_vma_interval_tree_iter_first
>       0.17 =C2=B1 19%      +0.1        0.22 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.flush_tlb_func_common
>       0.00            +0.1        0.06 =C2=B1  7%  perf-profile.children.=
cycles-pp.find_vma
>       0.00            +0.1        0.06 =C2=B1 14%  perf-profile.children.=
cycles-pp.release_pages
>       0.00            +0.1        0.06 =C2=B1 14%  perf-profile.children.=
cycles-pp.mutex_unlock
>       0.06 =C2=B1 14%      +0.1        0.12 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.wake_all_kswapds
>       0.00            +0.1        0.07 =C2=B1  7%  perf-profile.children.=
cycles-pp.radix_tree_node_rcu_free
>       0.09 =C2=B1 11%      +0.1        0.16 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.do_page_add_anon_rmap
>       0.16 =C2=B1  9%      +0.1        0.22 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.smp_call_function_interrupt
>       0.14 =C2=B1 13%      +0.1        0.21 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.up_read
>       0.20 =C2=B1 14%      +0.1        0.27 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp._find_next_bit
>       0.15 =C2=B1  5%      +0.1        0.22 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.__isolate_lru_page
>       0.16 =C2=B1  7%      +0.1        0.23 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.__mod_lruvec_state
>       0.27 =C2=B1 16%      +0.1        0.34 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.__swap_count
>       0.17 =C2=B1 14%      +0.1        0.24 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.cpumask_next
>       0.16 =C2=B1 14%      +0.1        0.24 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.sync_regs
>       0.03 =C2=B1100%      +0.1        0.10 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.wakeup_kswapd
>       0.14 =C2=B1  8%      +0.1        0.22 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.throttle_direct_reclaim
>       0.14 =C2=B1  8%      +0.1        0.22 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.allow_direct_reclaim
>       0.15 =C2=B1  5%      +0.1        0.23 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.zone_reclaimable_pages
>       0.00            +0.1        0.08 =C2=B1 15%  perf-profile.children.=
cycles-pp.rcu_segcblist_enqueue
>       0.16 =C2=B1 17%      +0.1        0.26 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.__pagevec_lru_add_fn
>       0.15 =C2=B1 16%      +0.1        0.24 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.test_clear_page_writeback
>       0.00            +0.1        0.10 =C2=B1 30%  perf-profile.children.=
cycles-pp.radix_tree_node_ctor
>       0.22 =C2=B1 10%      +0.1        0.34 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.call_function_interrupt
>       0.29 =C2=B1 18%      +0.1        0.41 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.count_shadow_nodes
>       0.42 =C2=B1 12%      +0.1        0.54 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.native_irq_return_iret
>       0.02 =C2=B1173%      +0.1        0.15 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.new_slab
>       0.29 =C2=B1  6%      +0.1        0.42 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.move_pages_to_lru
>       0.09 =C2=B1 16%      +0.1        0.22 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.lru_add_drain_cpu
>       0.21 =C2=B1 13%      +0.1        0.35 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.mem_cgroup_id_get_online
>       0.02 =C2=B1173%      +0.1        0.17 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.___slab_alloc
>       0.02 =C2=B1173%      +0.2        0.17 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.__slab_alloc
>       0.00            +0.2        0.16 =C2=B1 13%  perf-profile.children.=
cycles-pp.call_rcu
>       0.39 =C2=B1 18%      +0.2        0.57 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.do_shrink_slab
>       0.41 =C2=B1 18%      +0.2        0.59 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.shrink_slab
>       0.38 =C2=B1 11%      +0.2        0.57 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.irq_exit
>       0.31 =C2=B1 14%      +0.2        0.51 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.down_read_trylock
>       0.00            +0.2        0.20 =C2=B1 23%  perf-profile.children.=
cycles-pp.kmem_cache_alloc
>       0.32 =C2=B1 16%      +0.2        0.52 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.__test_set_page_writeback
>       0.08 =C2=B1 19%      +0.2        0.28 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.__set_page_dirty_no_writeback
>       0.00            +0.2        0.24 =C2=B1 20%  perf-profile.children.=
cycles-pp.xas_alloc
>       0.18 =C2=B1 16%      +0.3        0.46 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.try_to_unmap_flush
>       0.50 =C2=B1 12%      +0.3        0.79 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.page_lock_anon_vma_read
>       0.32 =C2=B1 12%      +0.3        0.61 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.__lru_cache_add
>       0.12 =C2=B1 14%      +0.3        0.41 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp._raw_spin_unlock_irqrestore
>       0.51 =C2=B1 13%      +0.3        0.81 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.mem_cgroup_swapout
>       0.91 =C2=B1 20%      +0.3        1.23 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.get_page_from_freelist
>       0.23 =C2=B1 11%      +0.3        0.55 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.swap_range_free
>       0.23 =C2=B1 12%      +0.3        0.56 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.lru_add_drain
>       0.41 =C2=B1 12%      +0.3        0.75 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.xas_store
>       0.66 =C2=B1 13%      +0.4        1.02 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.end_page_writeback
>       1.05 =C2=B1 13%      +0.4        1.42 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.__list_del_entry_valid
>       0.91 =C2=B1  9%      +0.4        1.27 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.isolate_lru_pages
>       0.04 =C2=B1 58%      +0.4        0.42 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.__slab_free
>       0.00            +0.4        0.41 =C2=B1 13%  perf-profile.children.=
cycles-pp.run_ksoftirqd
>       0.58 =C2=B1 16%      +0.4        1.00 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.swap_cgroup_record
>       0.00            +0.4        0.42 =C2=B1 13%  perf-profile.children.=
cycles-pp.smpboot_thread_fn
>       0.39 =C2=B1 13%      +0.4        0.81 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.mem_cgroup_id_put_many
>       0.06 =C2=B1 13%      +0.4        0.49 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.kmem_cache_free
>       0.04 =C2=B1103%      +0.5        0.52 =C2=B1 80%  perf-profile.chil=
dren.cycles-pp.start_kernel
>       0.66 =C2=B1 13%      +0.5        1.15 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.__delete_from_swap_cache
>       0.72 =C2=B1 18%      +0.5        1.22 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.drain_local_pages_wq
>       0.72 =C2=B1 18%      +0.5        1.22 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.drain_pages
>       0.71 =C2=B1 18%      +0.5        1.21 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.drain_pages_zone
>       0.71 =C2=B1 18%      +0.5        1.22 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.free_pcppages_bulk
>       0.24 =C2=B1 14%      +0.5        0.76 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.xas_create
>       0.24 =C2=B1 15%      +0.5        0.77 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.xas_create_range
>       0.08 =C2=B1 13%      +0.6        0.63 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.rcu_do_batch
>       0.14 =C2=B1 15%      +0.6        0.70 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.rcu_core
>       0.27 =C2=B1 13%      +0.6        0.85 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.__softirqentry_text_start
>       0.53 =C2=B1 12%      +0.6        1.15 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.pagevec_lru_move_fn
>       1.39 =C2=B1  7%      +0.7        2.04 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.worker_thread
>       1.34 =C2=B1  7%      +0.7        1.99 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.process_one_work
>       0.82 =C2=B1 14%      +0.7        1.55 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.mem_cgroup_uncharge_swap
>       1.69 =C2=B1 13%      +0.8        2.47 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.__memcpy_mcsafe
>       1.71 =C2=B1 13%      +0.8        2.50 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.pmem_do_read
>       2.67 =C2=B1 14%      +0.8        3.50 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.swap_readpage
>       1.85 =C2=B1 12%      +0.9        2.71 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.bdev_read_page
>       1.78 =C2=B1  9%      +0.9        2.66 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.page_vma_mapped_walk
>       1.79 =C2=B1  9%      +0.9        2.71 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.page_referenced_one
>       2.08 =C2=B1  9%      +1.0        3.03 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.shrink_active_list
>       1.84 =C2=B1 13%      +1.0        2.80 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.__memcpy_flushcache
>       1.86 =C2=B1 13%      +1.0        2.81 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.write_pmem
>       1.86 =C2=B1 13%      +1.0        2.83 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.pmem_do_write
>       3.53 =C2=B1 13%      +1.1        4.66 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.__swap_writepage
>       0.59 =C2=B1 10%      +1.2        1.79 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.smp_call_function_many_cond
>       2.51 =C2=B1  9%      +1.3        3.84 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.page_referenced
>       8.54 =C2=B1  8%      +1.4        9.91 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.ret_from_fork
>       8.53 =C2=B1  8%      +1.4        9.90 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.kthread
>       1.01 =C2=B1 18%      +1.5        2.54 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.smp_call_function_single
>       2.90 =C2=B1 13%      +1.6        4.46 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.bdev_write_page
>       4.38 =C2=B1 13%      +2.2        6.56 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.pmem_rw_page
>       1.44 =C2=B1 13%      +2.5        3.92 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.try_to_unmap_flush_dirty
>       1.60 =C2=B1 13%      +2.7        4.35 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.on_each_cpu_cond_mask
>       1.62 =C2=B1 14%      +2.8        4.38 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.arch_tlbbatch_flush
>       1.82 =C2=B1 15%      +2.8        4.61 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.mem_cgroup_commit_charge
>       1.79 =C2=B1 14%      +3.4        5.23 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.swapcache_free_entries
>       2.16 =C2=B1 14%      +3.5        5.71 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.free_swap_slot
>       2.34 =C2=B1 15%      +3.7        6.03 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.__swap_entry_free
>       1.07 =C2=B1 15%      +6.6        7.66 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irqsave
>       2.98 =C2=B1 14%      +6.6        9.57 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.__remove_mapping
>       1.11 =C2=B1 15%      +7.5        8.64 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.add_to_swap_cache
>       4.32 =C2=B1 12%     +10.2       14.49 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irq
>       2.32 =C2=B1  7%      -2.2        0.12 =C2=B1 10%  perf-profile.self=
.cycles-pp.scan_swap_map_slots
>       3.43 =C2=B1 11%      -1.9        1.57 =C2=B1 10%  perf-profile.self=
.cycles-pp._raw_spin_lock
>       1.58 =C2=B1 15%      -0.7        0.92 =C2=B1 10%  perf-profile.self=
.cycles-pp.page_swap_info
>       2.04 =C2=B1 15%      -0.5        1.53 =C2=B1 11%  perf-profile.self=
.cycles-pp._swap_info_get
>       0.70 =C2=B1 15%      -0.5        0.20 =C2=B1  4%  perf-profile.self=
.cycles-pp.get_swap_page
>       0.44 =C2=B1 15%      -0.4        0.07 =C2=B1 12%  perf-profile.self=
.cycles-pp.mutex_lock
>       1.14 =C2=B1 15%      -0.3        0.80 =C2=B1  9%  perf-profile.self=
.cycles-pp.get_swap_device
>       0.34 =C2=B1 13%      -0.1        0.21 =C2=B1 13%  perf-profile.self=
.cycles-pp.__frontswap_store
>       0.41 =C2=B1 17%      -0.1        0.32 =C2=B1 11%  perf-profile.self=
.cycles-pp.ktime_get
>       0.08 =C2=B1 10%      -0.0        0.05 =C2=B1  8%  perf-profile.self=
.cycles-pp.__swap_duplicate
>       0.08 =C2=B1 12%      +0.0        0.11 =C2=B1 11%  perf-profile.self=
.cycles-pp.native_flush_tlb
>       0.07 =C2=B1 19%      +0.0        0.10 =C2=B1  8%  perf-profile.self=
.cycles-pp.__mod_zone_page_state
>       0.08 =C2=B1 16%      +0.0        0.11 =C2=B1  9%  perf-profile.self=
.cycles-pp.handle_pte_fault
>       0.07 =C2=B1 15%      +0.0        0.11 =C2=B1  7%  perf-profile.self=
.cycles-pp.__count_memcg_events
>       0.11 =C2=B1 11%      +0.0        0.15 =C2=B1 12%  perf-profile.self=
.cycles-pp.page_mapping
>       0.08 =C2=B1 13%      +0.0        0.12 =C2=B1 10%  perf-profile.self=
.cycles-pp.___might_sleep
>       0.09 =C2=B1 17%      +0.0        0.13 =C2=B1 12%  perf-profile.self=
.cycles-pp.__mod_node_page_state
>       0.03 =C2=B1100%      +0.0        0.07 =C2=B1 10%  perf-profile.self=
.cycles-pp.do_page_fault
>       0.15 =C2=B1 11%      +0.0        0.19 =C2=B1 10%  perf-profile.self=
.cycles-pp.do_swap_page
>       0.07 =C2=B1 20%      +0.0        0.12 =C2=B1 12%  perf-profile.self=
.cycles-pp.__handle_mm_fault
>       0.12 =C2=B1  7%      +0.0        0.16 =C2=B1 14%  perf-profile.self=
.cycles-pp.page_referenced_one
>       0.08 =C2=B1 14%      +0.0        0.12 =C2=B1 12%  perf-profile.self=
.cycles-pp.__mod_memcg_state
>       0.10 =C2=B1 10%      +0.0        0.15 =C2=B1 14%  perf-profile.self=
.cycles-pp.page_endio
>       0.07 =C2=B1 19%      +0.1        0.12 =C2=B1 15%  perf-profile.self=
.cycles-pp.test_clear_page_writeback
>       0.08 =C2=B1 19%      +0.1        0.14 =C2=B1 15%  perf-profile.self=
.cycles-pp.__pagevec_lru_add_fn
>       0.09 =C2=B1  4%      +0.1        0.14 =C2=B1 15%  perf-profile.self=
.cycles-pp.zone_reclaimable_pages
>       0.00            +0.1        0.06 =C2=B1  9%  perf-profile.self.cycl=
es-pp.vmacache_find
>       0.00            +0.1        0.06 =C2=B1  9%  perf-profile.self.cycl=
es-pp.mutex_unlock
>       0.03 =C2=B1100%      +0.1        0.08 =C2=B1 13%  perf-profile.self=
.cycles-pp.xas_store
>       0.00            +0.1        0.06 =C2=B1 15%  perf-profile.self.cycl=
es-pp.anon_vma_interval_tree_iter_first
>       0.00            +0.1        0.06 =C2=B1 14%  perf-profile.self.cycl=
es-pp.kmem_cache_free
>       0.08 =C2=B1 13%      +0.1        0.14 =C2=B1  9%  perf-profile.self=
.cycles-pp.do_page_add_anon_rmap
>       0.01 =C2=B1173%      +0.1        0.07 =C2=B1 17%  perf-profile.self=
.cycles-pp.mem_cgroup_commit_charge
>       0.00            +0.1        0.06 =C2=B1 11%  perf-profile.self.cycl=
es-pp.xas_init_marks
>       0.18 =C2=B1 13%      +0.1        0.25 =C2=B1 11%  perf-profile.self=
.cycles-pp._find_next_bit
>       0.11 =C2=B1  9%      +0.1        0.18 =C2=B1 15%  perf-profile.self=
.cycles-pp.isolate_lru_pages
>       0.00            +0.1        0.06 =C2=B1 13%  perf-profile.self.cycl=
es-pp.swapcache_free_entries
>       0.14 =C2=B1 12%      +0.1        0.21 =C2=B1 11%  perf-profile.self=
.cycles-pp.rmap_walk_anon
>       0.14 =C2=B1 11%      +0.1        0.21 =C2=B1 11%  perf-profile.self=
.cycles-pp.up_read
>       0.00            +0.1        0.07 =C2=B1  7%  perf-profile.self.cycl=
es-pp.radix_tree_node_rcu_free
>       0.18 =C2=B1 16%      +0.1        0.25 =C2=B1  9%  perf-profile.self=
.cycles-pp.free_pcppages_bulk
>       0.15 =C2=B1  5%      +0.1        0.22 =C2=B1 10%  perf-profile.self=
.cycles-pp.__isolate_lru_page
>       0.16 =C2=B1 14%      +0.1        0.23 =C2=B1 12%  perf-profile.self=
.cycles-pp.sync_regs
>       0.16 =C2=B1  6%      +0.1        0.23 =C2=B1 10%  perf-profile.self=
.cycles-pp.move_pages_to_lru
>       0.00            +0.1        0.07 =C2=B1 11%  perf-profile.self.cycl=
es-pp.call_rcu
>       0.18 =C2=B1 18%      +0.1        0.26 =C2=B1 12%  perf-profile.self=
.cycles-pp.count_shadow_nodes
>       0.00            +0.1        0.08 =C2=B1 15%  perf-profile.self.cycl=
es-pp.rcu_segcblist_enqueue
>       0.08 =C2=B1  6%      +0.1        0.16 =C2=B1  9%  perf-profile.self=
.cycles-pp._raw_spin_unlock_irqrestore
>       0.14 =C2=B1 14%      +0.1        0.23 =C2=B1  6%  perf-profile.self=
.cycles-pp.pageout
>       0.01 =C2=B1173%      +0.1        0.10 =C2=B1 10%  perf-profile.self=
.cycles-pp.wakeup_kswapd
>       0.27 =C2=B1  9%      +0.1        0.37 =C2=B1 10%  perf-profile.self=
.cycles-pp.shrink_page_list
>       0.00            +0.1        0.10 =C2=B1 30%  perf-profile.self.cycl=
es-pp.radix_tree_node_ctor
>       0.08 =C2=B1 10%      +0.1        0.19 =C2=B1 11%  perf-profile.self=
.cycles-pp.lookup_swap_cache
>       0.22 =C2=B1 12%      +0.1        0.34 =C2=B1 14%  perf-profile.self=
.cycles-pp.page_lock_anon_vma_read
>       0.42 =C2=B1 12%      +0.1        0.54 =C2=B1 11%  perf-profile.self=
.cycles-pp.native_irq_return_iret
>       0.12 =C2=B1 18%      +0.1        0.26 =C2=B1  9%  perf-profile.self=
.cycles-pp.__swap_count
>       0.21 =C2=B1 13%      +0.1        0.35 =C2=B1 11%  perf-profile.self=
.cycles-pp.mem_cgroup_id_get_online
>       0.07 =C2=B1 17%      +0.1        0.21 =C2=B1 12%  perf-profile.self=
.cycles-pp.__remove_mapping
>       0.26 =C2=B1 12%      +0.1        0.41 =C2=B1 11%  perf-profile.self=
.cycles-pp.__delete_from_swap_cache
>       0.25 =C2=B1 15%      +0.2        0.42 =C2=B1 10%  perf-profile.self=
.cycles-pp.get_page_from_freelist
>       0.24 =C2=B1 17%      +0.2        0.42 =C2=B1 10%  perf-profile.self=
.cycles-pp.__test_set_page_writeback
>       0.30 =C2=B1 15%      +0.2        0.49 =C2=B1  7%  perf-profile.self=
.cycles-pp.down_read_trylock
>       0.08 =C2=B1 19%      +0.2        0.28 =C2=B1 11%  perf-profile.self=
.cycles-pp.__set_page_dirty_no_writeback
>       0.28 =C2=B1 14%      +0.2        0.49 =C2=B1  9%  perf-profile.self=
.cycles-pp._raw_spin_lock_irq
>       0.37 =C2=B1 16%      +0.2        0.59 =C2=B1 13%  perf-profile.self=
.cycles-pp.swap_cgroup_record
>       0.51 =C2=B1 11%      +0.2        0.76 =C2=B1 12%  perf-profile.self=
.cycles-pp.end_page_writeback
>       0.35 =C2=B1 15%      +0.3        0.60 =C2=B1 12%  perf-profile.self=
.cycles-pp._raw_spin_lock_irqsave
>       0.22 =C2=B1 16%      +0.3        0.51 =C2=B1 11%  perf-profile.self=
.cycles-pp.xas_create
>       0.20 =C2=B1 11%      +0.3        0.50 =C2=B1 10%  perf-profile.self=
.cycles-pp.swap_range_free
>       0.25 =C2=B1 13%      +0.3        0.56 =C2=B1 11%  perf-profile.self=
.cycles-pp.add_to_swap_cache
>       1.05 =C2=B1 13%      +0.4        1.41 =C2=B1  8%  perf-profile.self=
.cycles-pp.__list_del_entry_valid
>       0.03 =C2=B1100%      +0.4        0.41 =C2=B1 11%  perf-profile.self=
.cycles-pp.__slab_free
>       0.38 =C2=B1 13%      +0.4        0.80 =C2=B1 12%  perf-profile.self=
.cycles-pp.mem_cgroup_id_put_many
>       1.67 =C2=B1 13%      +0.8        2.43 =C2=B1 10%  perf-profile.self=
.cycles-pp.__memcpy_mcsafe
>       1.54 =C2=B1  9%      +0.8        2.31 =C2=B1  9%  perf-profile.self=
.cycles-pp.page_vma_mapped_walk
>       1.81 =C2=B1 12%      +0.9        2.74 =C2=B1 11%  perf-profile.self=
.cycles-pp.__memcpy_flushcache
>       0.47 =C2=B1 12%      +1.1        1.60 =C2=B1  2%  perf-profile.self=
.cycles-pp.smp_call_function_many_cond
>       0.93 =C2=B1 18%      +1.5        2.42 =C2=B1 20%  perf-profile.self=
.cycles-pp.smp_call_function_single
>
>
>                                                                          =
       =

>                               pmbench.time.user_time                     =
       =

>                                                                          =
       =

>   1200 +-----------------------------------------------------------------=
---+   =

>        |                                            O                    =
   |   =

>   1000 |-+                                                               =
   |   =

>        |  O          O                    O                              =
   |   =

>        |      O  O                           O  O                        =
   |   =

>    800 |-+              O   O  O   O  O                O                 =
   |   =

>        |                                                                 =
   |   =

>    600 |..  ..+..+...+..+...+..+...+..+...+       ..+..+...+..+...+..+...=
  .|   =

>        |  +.                              :     +.                       =
+. |   =

>    400 |-+                                 :    :                        =
   |   =

>        |                                   :   :                         =
   |   =

>        |                                    :  :                         =
   |   =

>    200 |-+                                  : :                          =
   |   =

>        |                                     ::                          =
   |   =

>      0 +-----------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                               pmbench.time.system_time                   =
       =

>                                                                          =
       =

>   30000 +----------------------------------------------------------------=
---+   =

>         |..+...+..+...+..+..+...+..+...+..+  O   +..+...+..+..+...+..+...=
+..|   =

>   25000 |-+O   O  O   O                   :      :                       =
   |   =

>         |                                 :     :                        =
   |   =

>         |                                  :    :                        =
   |   =

>   20000 |-+                                :    :                        =
   |   =

>         |                                  :   :                         =
   |   =

>   15000 |-+                                :   :                         =
   |   =

>         |                                   :  :                         =
   |   =

>   10000 |-+                                 :  :                         =
   |   =

>         |                                   : :                          =
   |   =

>         |                                   : :                          =
   |   =

>    5000 |-+                                  ::                          =
   |   =

>         |                                    :                           =
   |   =

>       0 +----------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                             pmbench.time.major_page_faults               =
       =

>                                                                          =
       =

>   1.8e+09 +--------------------------------------------------------------=
---+   =

>           |  O   O  O  O                                                 =
   |   =

>   1.6e+09 |-+                                                            =
   |   =

>   1.4e+09 |-+              O  O  O  O   O  O  O   O  O  O                =
   |   =

>           |                                                              =
   |   =

>   1.2e+09 |-+                                                            =
   |   =

>     1e+09 |..         .+...+..  .+..+...+..+        .+..+...  .+..+..+...=
  .|   =

>           |  +...+..+.        +.           :      +.        +.           =
+. |   =

>     8e+08 |-+                               :    :                       =
   |   =

>     6e+08 |-+                               :    :                       =
   |   =

>           |                                  :  :                        =
   |   =

>     4e+08 |-+                                :  :                        =
   |   =

>     2e+08 |-+                                : :                         =
   |   =

>           |                                   ::                         =
   |   =

>         0 +--------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                             pmbench.time.minor_page_faults               =
       =

>                                                                          =
       =

>   1.8e+08 +--------------------------------------------------------------=
---+   =

>           |  O   O  O  O                                                 =
   |   =

>   1.6e+08 |-+                                                            =
   |   =

>   1.4e+08 |-+              O  O  O  O   O  O  O   O  O  O                =
   |   =

>           |                                                              =
   |   =

>   1.2e+08 |-+                                                            =
   |   =

>     1e+08 |..+...+..+..+...+..+..+..+...+..+      +..+..+...+..+..+..+...=
+..|   =

>           |                                :      :                      =
   |   =

>     8e+07 |-+                               :    :                       =
   |   =

>     6e+07 |-+                               :    :                       =
   |   =

>           |                                  :  :                        =
   |   =

>     4e+07 |-+                                :  :                        =
   |   =

>     2e+07 |-+                                : :                         =
   |   =

>           |                                   ::                         =
   |   =

>         0 +--------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                          pmbench.read.latency.ns.32K-64K_                =
       =

>                                                                          =
       =

>   0.9 +------------------------------------------------------------------=
---+   =

>       |                                                       +...       =
   |   =

>   0.8 |-+             ..+..+...+..                    .+... ..    +..    =
  .|   =

>   0.7 |-..+..      .+.            +...+..+      +...+.     +         +...=
+. |   =

>       |.     +...+.                      :      :                        =
   |   =

>   0.6 |-+                                 :    :                         =
   |   =

>   0.5 |-+                                 :    :                         =
   |   =

>       |                                   :    :                         =
   |   =

>   0.4 |-+                                  :   :                         =
   |   =

>   0.3 |-+                                  :  :                          =
   |   =

>       |                 O  O   O  O   O     :O: O      O                 =
   |   =

>   0.2 |-+ O  O   O  O                    O  : :                          =
   |   =

>   0.1 |-+                                   : :     O                    =
   |   =

>       |                                      :                           =
   |   =

>     0 +------------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                           pmbench.read.latency.ns.2M-4M_                 =
       =

>                                                                          =
       =

>    0.3 +-----------------------------------------------------------------=
---+   =

>        | +  ..           ..                     :  .  .+...+..  ..+..  ..=
+..|   =

>   0.25 |++      .+...+..+      +...      .+     :   +.        +.     +.  =
   |   =

>        |      +.                   +.. .. :    :                         =
   |   =

>        |                              +    :   :                         =
   |   =

>    0.2 |-+                                 :   :                         =
   |   =

>        |                                   :   :                         =
   |   =

>   0.15 |-+                                 :   :                         =
   |   =

>        |                                    : :                          =
   |   =

>    0.1 |-+                                  : :                          =
   |   =

>        |                                    : :                          =
   |   =

>        |                                    : :                          =
   |   =

>   0.05 |-+                         O         :                           =
   |   =

>        |      O  O   O  O   O  O      O   O  :  O   O  O                 =
   |   =

>      0 +-----------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                           pmbench.read.latency.ns.4M-8M_                 =
       =

>                                                                          =
       =

>   0.06 +-----------------------------------------------------------------=
---+   =

>        |                                                                 =
+  |   =

>   0.05 |-+                                +                             :=
 : |   =

>        |                                 +:                   +.        :=
 : |   =

>        |                                +  :                ..  ..     : =
  :|   =

>   0.04 |-+  ..+..   .+         +       +   :               +           : =
  :|   =

>        |  +.      ..  :       + +     +    :             ..       +.. :  =
   |   =

>   0.03 |..       +     :     +   +   +     :            .             :  =
   |   =

>        |               :  ..+     + +       :   +...+..+             +   =
   |   =

>   0.02 |-+              +.         +        :   :                        =
   |   =

>        |                                    :  :                         =
   |   =

>        |                                    :  :                         =
   |   =

>   0.01 |-+                                   ::                          =
   |   =

>        |  O   O  O   O      O             O  ::                          =
   |   =

>      0 +-----------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                          pmbench.write.latency.ns.32K-64K_               =
       =

>                                                                          =
       =

>   0.9 +------------------------------------------------------------------=
---+   =

>       |                                                       +...       =
   |   =

>   0.8 |-+             ..+..+...+..                    .+... ..    +..    =
  .|   =

>   0.7 |-..+..      .+.            +...+..+      +...+.     +         +...=
+. |   =

>       |.     +...+.                      :      :                        =
   |   =

>   0.6 |-+                                 :    :                         =
   |   =

>   0.5 |-+                                 :    :                         =
   |   =

>       |                                   :    :                         =
   |   =

>   0.4 |-+                                  :   :                         =
   |   =

>   0.3 |-+                                  :  :                          =
   |   =

>       |                 O  O   O  O   O     :O: O      O                 =
   |   =

>   0.2 |-+ O  O   O  O                    O  : :                          =
   |   =

>   0.1 |-+                                   : :     O                    =
   |   =

>       |                                      :                           =
   |   =

>     0 +------------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                           pmbench.write.latency.ns.2M-4M_                =
       =

>                                                                          =
       =

>    0.3 +-----------------------------------------------------------------=
---+   =

>        | +  ..           ..                     :  .  .+...+..  ..+..  ..=
+..|   =

>   0.25 |++      .+...+..+      +...      .+     :   +.        +.     +.  =
   |   =

>        |      +.                   +.. .. :    :                         =
   |   =

>        |                              +    :   :                         =
   |   =

>    0.2 |-+                                 :   :                         =
   |   =

>        |                                   :   :                         =
   |   =

>   0.15 |-+                                 :   :                         =
   |   =

>        |                                    : :                          =
   |   =

>    0.1 |-+                                  : :                          =
   |   =

>        |                                    : :                          =
   |   =

>        |                                    : :                          =
   |   =

>   0.05 |-+                         O         :                           =
   |   =

>        |      O  O   O  O   O  O      O   O  :  O   O  O                 =
   |   =

>      0 +-----------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                           pmbench.write.latency.ns.4M-8M_                =
       =

>                                                                          =
       =

>   0.06 +-----------------------------------------------------------------=
---+   =

>        |                                                                 =
+  |   =

>   0.05 |-+                                +                             :=
 : |   =

>        |                                 +:                   +.        :=
 : |   =

>        |                                +  :                ..  ..     : =
  :|   =

>   0.04 |-++...+..   .+         +       +   :               +          :  =
  :|   =

>        | +        ..  :       + +     +    :             ..       +.. :  =
   |   =

>   0.03 |++       +     :     +   +   +     :            .            +   =
   |   =

>        |               :  ..+     + +       :   +...+..+                 =
   |   =

>   0.02 |-+              +.         +        :   :                        =
   |   =

>        |                                    :  :                         =
   |   =

>        |                                    :  :                         =
   |   =

>   0.01 |-+                                   ::                          =
   |   =

>        |  O   O  O   O      O             O  ::                          =
   |   =

>      0 +-----------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                              pmbench.latency.ns.average                  =
       =

>                                                                          =
       =

>   20000 +----------------------------------------------------------------=
---+   =

>   18000 |.+   .  .+...+..+..+...+..      .+      :  +...+..+..+...+..+.  =
   |   =

>         |      +.                  +...+. :     :                        =
   |   =

>   16000 |-+                               :     :                        =
   |   =

>   14000 |-+                                :    :                        =
   |   =

>         |                O  O   O  O   O  O:    :O      O                =
   |   =

>   12000 |-+    O  O   O                    : O :    O                    =
   |   =

>   10000 |-+O                               :   :                         =
   |   =

>    8000 |-+                                 :  :                         =
   |   =

>         |                                   : :                          =
   |   =

>    6000 |-+                                 : :                          =
   |   =

>    4000 |-+                                 : :                          =
   |   =

>         |                                    ::                          =
   |   =

>    2000 |-+                                  :                           =
   |   =

>       0 +----------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
       =

> [*] bisect-good sample
> [O] bisect-bad  sample
>
>
>
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
>
>
> Thanks,
> Rong Chen
--===============5432217398664203803==--

