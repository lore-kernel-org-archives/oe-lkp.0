Content-Type: multipart/mixed; boundary="===============7417225908072067302=="
MIME-Version: 1.0
From: Lu, Aaron <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm/can_skip_merge()] 0314b5363f: vm-scalability.throughput -3.9% regression
Date: Wed, 23 May 2018 03:05:39 +0000
Message-ID: <19f9be17018baaedaa8e3644af5b87b565fac2ac.camel@intel.com>
In-Reply-To: <20180522051943.GH7714@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7417225908072067302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Xiaolong,

Why there is no perf-profile difference in the report now?

On Tue, 2018-05-22 at 13:19 +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -3.9% regression of vm-scalability.throughput due to co=
mmit:
> =

> =

> commit: 0314b5363f14895c896df305f40ff396806012d8 ("mm/can_skip_merge(): m=
ake it more aggressive to attempt cluster alloc/free")
> git://bee.sh.intel.com/git/aaron/linux.git zone_lock_rfc_v3
> =

> in testcase: vm-scalability
> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wit=
h 128G memory
> with following parameters:
> =

> 	runtime: 300s
> 	test: lru-file-readonce
> 	cpufreq_governor: performance
> =

> test-description: The motivation behind this suite is to exercise functio=
ns and regions of the mm/ of the Linux kernel which are of interest to us.
> test-url: https://git.kernel.org/cgit/linux/kernel/git/wfg/vm-scalability=
.git/
> =

> =

> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcase:
>   gcc-7/performance/x86_64-rhel-7.2/debian-x86_64-2016-08-31.cgz/300s/lkp=
-bdw-ep2/lru-file-readonce/vm-scalability
> =

> commit: =

>   890c692698 ("mm/free_pcppages_bulk: reduce overhead of cluster operatio=
n on free path")
>   0314b5363f ("mm/can_skip_merge(): make it more aggressive to attempt cl=
uster alloc/free")
> =

> 890c6926980925bf 0314b5363f14895c896df305f4 =

> ---------------- -------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>   21661913            -3.9%   20809849        vm-scalability.throughput
>     244640            -3.5%     236115        vm-scalability.median
>     342584 =C2=B1  2%     +13.7%     389452 =C2=B1  4%  vm-scalability.ti=
me.involuntary_context_switches
>       7047            +4.1%       7339        vm-scalability.time.percent=
_of_cpu_this_job_got
>      16856            +3.7%      17477        vm-scalability.time.system_=
time
>       1378            -2.0%       1350        vm-scalability.time.volunta=
ry_context_switches
>      18.53            -3.6       14.96 =C2=B1  4%  mpstat.cpu.idle%
>     656706           -15.8%     552825 =C2=B1  4%  softirqs.SCHED
>   10143567 =C2=B1  3%      -6.7%    9463248 =C2=B1  3%  vmstat.memory.free
>      47297 =C2=B1  7%     -47.5%      24830 =C2=B1 12%  meminfo.AnonHugeP=
ages
>       8459 =C2=B1 45%     -79.8%       1712 =C2=B1  3%  meminfo.CmaFree
>   90994096 =C2=B1  3%     -25.7%   67612989        numa-numastat.node0.nu=
ma_foreign
>   90994096 =C2=B1  3%     -25.7%   67612989        numa-numastat.node1.nu=
ma_miss
>   91006885 =C2=B1  3%     -25.7%   67622602        numa-numastat.node1.ot=
her_node
>    8668493 =C2=B1 14%     -18.3%    7084596 =C2=B1  2%  cpuidle.C3.time
>      28938 =C2=B1 11%     -18.2%      23669        cpuidle.C3.usage
>  3.844e+09           -19.5%  3.093e+09 =C2=B1  6%  cpuidle.C6.time
>    3970637 =C2=B1  2%     -18.9%    3220096 =C2=B1  7%  cpuidle.C6.usage
>     504.25 =C2=B1  5%     -27.7%     364.33 =C2=B1  5%  cpuidle.POLL.usage
>       2293            +4.2%       2390        turbostat.Avg_MHz
>      20609 =C2=B1  4%     -16.0%      17304 =C2=B1 17%  turbostat.C1
>      28442 =C2=B1 11%     -18.4%      23209 =C2=B1  2%  turbostat.C3
>    3967885 =C2=B1  2%     -18.9%    3217091 =C2=B1  7%  turbostat.C6
>      17.82            -3.4       14.40 =C2=B1  4%  turbostat.C6%
>       7.34 =C2=B1  3%     -28.2%       5.27 =C2=B1 10%  turbostat.CPU%c1
>      10.45           -12.9%       9.10        turbostat.CPU%c6
>       4.13 =C2=B1  3%      -9.8%       3.73 =C2=B1  3%  turbostat.Pkg%pc2
>       0.32 =C2=B1 10%     -14.6%       0.27 =C2=B1  7%  turbostat.Pkg%pc6
>     227.28            +1.2%     230.05        turbostat.PkgWatt
>   53677598           -29.5%   37852907        numa-vmstat.node0.numa_fore=
ign
>   14901802 =C2=B1 11%     +52.8%   22768899 =C2=B1  9%  numa-vmstat.node0=
.numa_miss
>   14906444 =C2=B1 11%     +52.8%   22776763 =C2=B1  9%  numa-vmstat.node0=
.numa_other
>    2568325 =C2=B1  3%     +25.9%    3233072 =C2=B1  6%  numa-vmstat.node0=
.workingset_nodereclaim
>      56.00 =C2=B1 67%     -68.5%      17.67 =C2=B1  9%  numa-vmstat.node1=
.nr_active_file
>       2186 =C2=B1 45%     -79.9%     440.00 =C2=B1  2%  numa-vmstat.node1=
.nr_free_cma
>      56.00 =C2=B1 67%     -68.5%      17.67 =C2=B1  9%  numa-vmstat.node1=
.nr_zone_active_file
>   14905920 =C2=B1 11%     +52.8%   22775120 =C2=B1  9%  numa-vmstat.node1=
.numa_foreign
>   53690801           -29.5%   37864149        numa-vmstat.node1.numa_miss
>   53877015           -29.4%   38047429        numa-vmstat.node1.numa_other
>    3054645 =C2=B1  3%     -32.1%    2074713 =C2=B1 14%  numa-vmstat.node1=
.workingset_nodereclaim
>       2872 =C2=B1  9%     +21.4%       3488        slabinfo.eventpoll_pwq=
.active_objs
>       2872 =C2=B1  9%     +21.4%       3488        slabinfo.eventpoll_pwq=
.num_objs
>     648.75 =C2=B1  6%     +26.9%     823.33 =C2=B1  2%  slabinfo.file_loc=
k_cache.active_objs
>     648.75 =C2=B1  6%     +26.9%     823.33 =C2=B1  2%  slabinfo.file_loc=
k_cache.num_objs
>     916.50 =C2=B1  3%     -11.9%     807.67 =C2=B1  4%  slabinfo.ip6_dst_=
cache.active_objs
>     916.50 =C2=B1  3%     -11.9%     807.67 =C2=B1  4%  slabinfo.ip6_dst_=
cache.num_objs
>       1058 =C2=B1  8%     +14.7%       1213 =C2=B1  5%  slabinfo.nsproxy.=
active_objs
>       1058 =C2=B1  8%     +14.7%       1213 =C2=B1  5%  slabinfo.nsproxy.=
num_objs
>      74039          +293.4%     291255 =C2=B1  3%  slabinfo.radix_tree_no=
de.active_slabs
>      74039          +293.4%     291255 =C2=B1  3%  slabinfo.radix_tree_no=
de.num_slabs
>     496.50 =C2=B1  8%     -20.0%     397.33 =C2=B1 11%  slabinfo.skbuff_f=
clone_cache.active_objs
>     496.50 =C2=B1  8%     -20.0%     397.33 =C2=B1 11%  slabinfo.skbuff_f=
clone_cache.num_objs
>     269478 =C2=B1 88%  +1.3e+05%  3.614e+08 =C2=B1 18%  proc-vmstat.compa=
ct_daemon_free_scanned
>      13707 =C2=B1107%   +3810.5%     536016 =C2=B1 13%  proc-vmstat.compa=
ct_daemon_migrate_scanned
>      99.25 =C2=B1 32%   +3616.9%       3689 =C2=B1 12%  proc-vmstat.compa=
ct_daemon_wake
>    3410544 =C2=B1 56%  +11220.3%  3.861e+08 =C2=B1 18%  proc-vmstat.compa=
ct_free_scanned
>       5106 =C2=B1 30%   +9779.9%     504490 =C2=B1 11%  proc-vmstat.compa=
ct_isolated
>      14682 =C2=B1 98%   +4815.7%     721724 =C2=B1 19%  proc-vmstat.compa=
ct_migrate_scanned
>       3.00 =C2=B1 62%   +9133.3%     277.00 =C2=B1  9%  proc-vmstat.compa=
ct_stall
>       2126 =C2=B1  4%    +112.7%       4523 =C2=B1 11%  proc-vmstat.kswap=
d_low_wmark_hit_quickly
>       2157 =C2=B1 46%     -80.5%     419.67        proc-vmstat.nr_free_cma
>  1.233e+08 =C2=B1  2%     -12.9%  1.074e+08 =C2=B1  2%  proc-vmstat.numa_=
foreign
>  1.233e+08 =C2=B1  2%     -12.9%  1.074e+08 =C2=B1  2%  proc-vmstat.numa_=
miss
>  1.233e+08 =C2=B1  2%     -12.9%  1.074e+08 =C2=B1  2%  proc-vmstat.numa_=
other
>       2149 =C2=B1  4%    +113.7%       4592 =C2=B1 10%  proc-vmstat.pageo=
utrun
>       4594 =C2=B1 27%   +5021.1%     235300 =C2=B1 11%  proc-vmstat.pgmig=
rate_success
>       0.15 =C2=B1 11%     -21.4%       0.12 =C2=B1 22%  sched_debug.cfs_r=
q:/.nr_running.stddev
>      28.84 =C2=B1 10%     -13.6%      24.92 =C2=B1 11%  sched_debug.cfs_r=
q:/.nr_spread_over.stddev
>     754.00 =C2=B1  2%     -10.1%     678.08 =C2=B1  6%  sched_debug.cfs_r=
q:/.runnable_load_avg.max
>      76.73 =C2=B1 21%     -54.7%      34.76 =C2=B1 29%  sched_debug.cfs_r=
q:/.util_est_enqueued.avg
>     193.69 =C2=B1  6%     -25.3%     144.69 =C2=B1  4%  sched_debug.cfs_r=
q:/.util_est_enqueued.stddev
>     101978 =C2=B1 12%     +41.8%     144590 =C2=B1 11%  sched_debug.cpu.a=
vg_idle.stddev
>     754.00 =C2=B1  2%     -14.6%     643.58 =C2=B1 13%  sched_debug.cpu.c=
pu_load[0].max
>     753.62 =C2=B1  2%     -17.3%     623.33 =C2=B1 13%  sched_debug.cpu.c=
pu_load[1].max
>     754.25 =C2=B1  3%     -19.3%     608.33 =C2=B1 14%  sched_debug.cpu.c=
pu_load[2].max
>     754.06 =C2=B1  3%     -18.7%     613.25 =C2=B1 13%  sched_debug.cpu.c=
pu_load[3].max
>     749.06 =C2=B1  3%     -15.9%     629.92 =C2=B1  9%  sched_debug.cpu.c=
pu_load[4].max
>       0.00 =C2=B1  5%      -6.9%       0.00 =C2=B1  4%  sched_debug.cpu.n=
ext_balance.stddev
>     148264 =C2=B1  4%     +28.0%     189792 =C2=B1  8%  sched_debug.cpu.n=
r_switches.max
>       2339           +30.1%       3043 =C2=B1 10%  sched_debug.cpu.nr_swi=
tches.min
>     143614 =C2=B1  4%     +29.1%     185428 =C2=B1  8%  sched_debug.cpu.s=
ched_count.max
>       2007           +31.9%       2647 =C2=B1 12%  sched_debug.cpu.sched_=
count.min
>      71726 =C2=B1  4%     +28.4%      92087 =C2=B1  8%  sched_debug.cpu.t=
twu_count.max
>      71194 =C2=B1  4%     +28.5%      91519 =C2=B1  8%  sched_debug.cpu.t=
twu_local.max
>  3.436e+12            +1.9%  3.501e+12        perf-stat.branch-instructio=
ns
>       0.54            -0.0        0.51        perf-stat.branch-miss-rate%
>  1.852e+10            -3.1%  1.794e+10        perf-stat.branch-misses
>       8.13            +0.6        8.78        perf-stat.cache-miss-rate%
>  1.591e+10            +6.6%  1.695e+10 =C2=B1  2%  perf-stat.cache-misses
>  1.955e+11            -1.2%  1.931e+11        perf-stat.cache-references
>       3.16            +2.4%       3.24        perf-stat.cpi
>  4.902e+13            +3.5%  5.075e+13        perf-stat.cpu-cycles
>      14795 =C2=B1  2%     +16.3%      17208        perf-stat.cpu-migratio=
ns
>       0.02 =C2=B1  8%      +0.0        0.02 =C2=B1  2%  perf-stat.dTLB-st=
ore-miss-rate%
>  2.532e+08 =C2=B1  8%     +12.0%  2.835e+08 =C2=B1  2%  perf-stat.dTLB-st=
ore-misses
>  1.497e+12            -2.6%  1.458e+12        perf-stat.dTLB-stores
>   2.63e+09 =C2=B1  9%     -19.3%  2.123e+09 =C2=B1  2%  perf-stat.iTLB-lo=
ads
>       0.32            -2.4%       0.31        perf-stat.ipc
>      64.39            -9.3       55.10 =C2=B1  3%  perf-stat.node-load-mi=
ss-rate%
>  1.559e+09           -11.3%  1.382e+09 =C2=B1  7%  perf-stat.node-load-mi=
sses
>  8.624e+08           +30.2%  1.123e+09        perf-stat.node-loads
>      24.53            -0.6       23.96        perf-stat.node-store-miss-r=
ate%
>  4.889e+09            +2.8%  5.024e+09        perf-stat.node-stores
> =

> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =

> =

> Thanks,
> Xiaolong
--===============7417225908072067302==--

