Content-Type: multipart/mixed; boundary="===============6807138897654503492=="
MIME-Version: 1.0
From: Soheil Hassas Yeganeh <soheil@google.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [tcp] dbbf2d1e40: vm-scalability.throughput -45.1% regression
Date: Tue, 05 Jun 2018 09:10:05 -0400
Message-ID: <CACSApvZ-UrHsgFLBH03TDsgUQCcCtfNOhUYO=HTKF5k9CcYiHw@mail.gmail.com>
In-Reply-To: <20180605070703.GL16472@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6807138897654503492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Are you sure this is a real regression?

My fix simply fixes a kernel crash by setting a single pointer. So the
regression is probably not related.

On Tue, Jun 5, 2018 at 3:07 AM, kernel test robot <xiaolong.ye@intel.com>=
 wrote:
>
> Greeting,
>
> FYI, we noticed a -45.1% of vm-scalability.throughput due to commit:
>
>
> commit: dbbf2d1e4077bab0c65ece2765d3fc69cf7d610f ("tcp: reset sk_send_hea=
d in tcp_write_queue_purge")
> https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable-rc.git l=
inux-4.14.y
>
> in testcase: vm-scalability
> on test machine: 56 threads Intel(R) Xeon(R) CPU E5-2695 v3 @ 2.30GHz wit=
h 256G memory
> with following parameters:
>
>         runtime: 300s
>         size: 512G
>         test: anon-cow-rand-mt
>         cpufreq_governor: performance
>
> test-description: The motivation behind this suite is to exercise functio=
ns and regions of the mm/ of the Linux kernel which are of interest to us.
> test-url: https://git.kernel.org/cgit/linux/kernel/git/wfg/vm-scalability=
.git/
>
>
>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/tes=
tcase:
>   gcc-7/performance/x86_64-rhel-7.2/debian-x86_64-2016-08-31.cgz/300s/512=
G/lkp-hsw-ep5/anon-cow-rand-mt/vm-scalability
>
> commit:
>   v4.14.31
>   dbbf2d1e40 ("tcp: reset sk_send_head in tcp_write_queue_purge")
>
>         v4.14.31 dbbf2d1e4077bab0c65ece2765
> ---------------- --------------------------
>          %stddev     %change         %stddev
>              \          |                \
>      78023 =C4=85  4%     +10.6%      86265        vm-scalability.median
>    4326758 =C4=85  4%     -45.1%    2376969        vm-scalability.through=
put
>     110788 =C4=85  6%     -20.0%      88643 =C4=85  2%  vm-scalability.ti=
me.involuntary_context_switches
>     301676 =C4=85  3%     -27.0%     220330        vm-scalability.time.mi=
nor_page_faults
>       5315           -50.0%       2656        vm-scalability.time.percent=
_of_cpu_this_job_got
>     195.79 =C4=85 14%     -45.5%     106.70        vm-scalability.time.sy=
stem_time
>      16561           -50.0%       8281        vm-scalability.time.user_ti=
me
>      88230 =C4=85  4%     -47.0%      46741        vm-scalability.time.vo=
luntary_context_switches
>    1.3e+09 =C4=85  4%     -45.1%   7.14e+08        vm-scalability.workload
>    5690999 =C4=85  2%     -44.4%    3161445        interrupts.CAL:Functio=
n_call_interrupts
>       0.01 =C4=85 20%      -0.0        0.00 =C4=85  8%  mpstat.cpu.soft%
>      27.22 =C4=85  3%      +6.2%      28.91 =C4=85  3%  boot-time.boot
>       1387 =C4=85  2%     -45.9%     750.75 =C4=85  3%  boot-time.idle
>      53.00           -50.9%      26.00        vmstat.procs.r
>       5825 =C4=85  6%     -26.7%       4270 =C4=85 15%  vmstat.system.cs
>      75286 =C4=85  2%     -47.3%      39679        vmstat.system.in
>      22750 =C4=85 71%     -64.9%       7984 =C4=85 38%  softirqs.NET_RX
>    2243838 =C4=85 13%     -56.5%     975849 =C4=85  2%  softirqs.RCU
>     254098 =C4=85  2%     -85.3%      37473        softirqs.SCHED
>    7102279           -47.8%    3706471        softirqs.TIMER
>     216900 =C4=85 21%     -27.9%     156316 =C4=85  9%  meminfo.DirectMap=
4k
>      11234           -36.2%       7164        meminfo.KernelStack
>      69165 =C4=85 16%     -25.2%      51749        meminfo.SReclaimable
>      90946           -29.7%      63958        meminfo.SUnreclaim
>     160112 =C4=85  7%     -27.7%     115708        meminfo.Slab
>       5815 =C4=85  8%     -32.9%       3902 =C4=85  7%  numa-vmstat.node0=
.nr_kernel_stack
>       7862 =C4=85157%    +137.8%      18694 =C4=85 80%  numa-vmstat.node0=
.nr_shmem
>       8199 =C4=85 14%     -25.4%       6119 =C4=85 10%  numa-vmstat.node0=
.nr_slab_reclaimable
>      11503 =C4=85  4%     -30.0%       8057 =C4=85  5%  numa-vmstat.node0=
.nr_slab_unreclaimable
>       5418 =C4=85  9%     -39.8%       3260 =C4=85  8%  numa-vmstat.node1=
.nr_kernel_stack
>      11231 =C4=85  6%     -29.4%       7932 =C4=85  6%  numa-vmstat.node1=
.nr_slab_unreclaimable
>    8283868 =C4=85 34%     -42.5%    4765682 =C4=85  5%  cpuidle.C1.time
>      69460 =C4=85 12%     -37.8%      43215 =C4=85  7%  cpuidle.C1.usage
>   22261497 =C4=85 16%     -75.4%    5469578        cpuidle.C1E.time
>   10655640 =C4=85 13%     -70.1%    3186482 =C4=85  8%  cpuidle.C3.time
>      32437 =C4=85 10%     -64.1%      11634 =C4=85  5%  cpuidle.C3.usage
>  8.588e+08 =C4=85  2%     -48.5%  4.426e+08 =C4=85  2%  cpuidle.C6.time
>     830378 =C4=85 12%     -44.7%     459303 =C4=85  2%  cpuidle.C6.usage
>   16306703 =C4=85 36%     -86.4%    2212427 =C4=85 27%  cpuidle.POLL.time
>       5815 =C4=85  8%     -32.9%       3903 =C4=85  7%  numa-meminfo.node=
0.KernelStack
>      32799 =C4=85 14%     -25.4%      24479 =C4=85 10%  numa-meminfo.node=
0.SReclaimable
>      46016 =C4=85  4%     -30.0%      32228 =C4=85  5%  numa-meminfo.node=
0.SUnreclaim
>      31453 =C4=85157%    +137.8%      74780 =C4=85 80%  numa-meminfo.node=
0.Shmem
>      78816 =C4=85  5%     -28.0%      56708 =C4=85  4%  numa-meminfo.node=
0.Slab
>       5417 =C4=85  9%     -39.8%       3260 =C4=85  8%  numa-meminfo.node=
1.KernelStack
>      44927 =C4=85  6%     -29.4%      31728 =C4=85  6%  numa-meminfo.node=
1.SUnreclaim
>      81291 =C4=85  9%     -27.4%      58996 =C4=85  4%  numa-meminfo.node=
1.Slab
>       0.02 =C4=85 50%      +0.0        0.03        perf-stat.branch-miss-=
rate%
>      26532 =C4=85 50%     +35.0%      35829        perf-stat.cpu-migratio=
ns
>      58.02 =C4=85 50%     +18.9       76.91        perf-stat.iTLB-load-mi=
ss-rate%
>       0.21 =C4=85 50%     +39.0%       0.30        perf-stat.ipc
>      44.21 =C4=85 50%     +14.2       58.39        perf-stat.node-load-mi=
ss-rate%
>  2.037e+08 =C4=85 50%     +47.9%  3.014e+08        perf-stat.node-load-mi=
sses
>   1.65e+08 =C4=85 50%     +30.2%  2.148e+08        perf-stat.node-loads
>      38.15 =C4=85 50%     +10.2       48.35        perf-stat.node-store-m=
iss-rate%
>       6158 =C4=85 50%     +29.5%       7977        perf-stat.path-length
>      66701 =C4=85 14%     -39.6%      40274 =C4=85  5%  turbostat.C1
>       0.13 =C4=85 16%      -0.1        0.06        turbostat.C1E%
>      32115 =C4=85 10%     -64.2%      11491 =C4=85  5%  turbostat.C3
>       0.06 =C4=85 14%      -0.0        0.03 =C4=85 13%  turbostat.C3%
>     830074 =C4=85 12%     -44.7%     458666 =C4=85  2%  turbostat.C6
>       1.78 =C4=85  2%     -15.1%       1.51 =C4=85  2%  turbostat.CPU%c1
>       3.27 =C4=85  3%      +9.6%       3.58 =C4=85  2%  turbostat.CPU%c6
>   29858589 =C4=85  2%     -47.2%   15768686        turbostat.IRQ
>       0.52 =C4=85 57%      -0.4        0.17 =C4=85 23%  turbostat.PKG_%
>       1.32 =C4=85 12%     +25.6%       1.66 =C4=85  2%  turbostat.Pkg%pc2
>     186.67            -6.9%     173.85        turbostat.PkgWatt
>      45.46 =C4=85  3%     -15.5%      38.42        turbostat.RAMWatt
>      21418           -39.7%      12908        turbostat.SMI
>      11234           -36.2%       7164        proc-vmstat.nr_kernel_stack
>     254.20 =C4=85 81%     +68.2%     427.50        proc-vmstat.nr_mlock
>      17290 =C4=85 16%     -25.2%      12937        proc-vmstat.nr_slab_re=
claimable
>      22736           -29.7%      15989        proc-vmstat.nr_slab_unrecla=
imable
>     254.20 =C4=85 81%     +68.2%     427.50        proc-vmstat.nr_unevict=
able
>     254.20 =C4=85 81%     +68.2%     427.50        proc-vmstat.nr_zone_un=
evictable
>      91132            +7.9%      98347        proc-vmstat.numa_hint_faults
>      46625            +8.4%      50530        proc-vmstat.numa_hint_fault=
s_local
>      76321           +12.4%      85823        proc-vmstat.numa_huge_pte_u=
pdates
>     988728 =C4=85 18%    +216.0%    3123958        proc-vmstat.numa_pages=
_migrated
>   39078567           +12.4%   43942796        proc-vmstat.numa_pte_updates
>    1079692            -6.8%    1006458        proc-vmstat.pgfault
>    6063104 =C4=85  3%     -14.2%    5199232        proc-vmstat.pgmigrate_=
fail
>     988728 =C4=85 18%    +216.0%    3123958        proc-vmstat.pgmigrate_=
success
>       2171            -1.5%       2139        proc-vmstat.pgpgin
>       0.00        +6.6e+09%      65.79 =C4=85100%  sched_debug.cfs_rq:/.M=
IN_vruntime.avg
>       1581           +41.0%       2230 =C4=85  3%  sched_debug.cfs_rq:/.e=
xec_clock.stddev
>      16863 =C4=85  7%    +105.6%      34676 =C4=85  5%  sched_debug.cfs_r=
q:/.load.avg
>      13778 =C4=85 17%    +102.8%      27939 =C4=85  8%  sched_debug.cfs_r=
q:/.load.min
>      27.60 =C4=85 16%    +119.5%      60.57 =C4=85 16%  sched_debug.cfs_r=
q:/.load_avg.avg
>     199.03           +33.2%     265.17 =C4=85 25%  sched_debug.cfs_rq:/.l=
oad_avg.max
>       9.07 =C4=85 22%    +190.4%      26.33 =C4=85 11%  sched_debug.cfs_r=
q:/.load_avg.min
>      40.29 =C4=85 17%     +63.6%      65.92 =C4=85 20%  sched_debug.cfs_r=
q:/.load_avg.stddev
>       0.00        +6.6e+09%      65.79 =C4=85100%  sched_debug.cfs_rq:/.m=
ax_vruntime.avg
>    7880260           -50.1%    3935706        sched_debug.cfs_rq:/.min_vr=
untime.avg
>    7924050           -50.0%    3962915        sched_debug.cfs_rq:/.min_vr=
untime.max
>    7822906           -50.1%    3900460        sched_debug.cfs_rq:/.min_vr=
untime.min
>      23896 =C4=85  3%     -43.3%      13559 =C4=85  7%  sched_debug.cfs_r=
q:/.min_vruntime.stddev
>       1.08 =C4=85  5%     +22.3%       1.32        sched_debug.cfs_rq:/.n=
r_spread_over.avg
>       0.46 =C4=85 16%     +61.7%       0.74 =C4=85 16%  sched_debug.cfs_r=
q:/.nr_spread_over.stddev
>       5.28 =C4=85 84%    +174.9%      14.51 =C4=85 65%  sched_debug.cfs_r=
q:/.removed_load_avg.avg
>      27.14 =C4=85 34%     +59.7%      43.33 =C4=85 31%  sched_debug.cfs_r=
q:/.removed_load_avg.stddev
>      15.46          +113.7%      33.05        sched_debug.cfs_rq:/.runnab=
le_load_avg.avg
>      38.80 =C4=85  4%     +85.8%      72.08 =C4=85  4%  sched_debug.cfs_r=
q:/.runnable_load_avg.max
>      11.87 =C4=85 17%    +113.1%      25.29 =C4=85 10%  sched_debug.cfs_r=
q:/.runnable_load_avg.min
>       4.48 =C4=85 13%    +121.8%       9.93 =C4=85  8%  sched_debug.cfs_r=
q:/.runnable_load_avg.stddev
>      71230 =C4=85  5%     -23.9%      54182 =C4=85 21%  sched_debug.cfs_r=
q:/.spread0.max
>     -29460           -72.5%      -8108        sched_debug.cfs_rq:/.spread=
0.min
>      23749 =C4=85  3%     -43.1%      13521 =C4=85  6%  sched_debug.cfs_r=
q:/.spread0.stddev
>     523568 =C4=85  3%     -15.2%     443767 =C4=85  6%  sched_debug.cpu.a=
vg_idle.avg
>     143955 =C4=85 14%     -24.1%     109309 =C4=85 14%  sched_debug.cpu.a=
vg_idle.min
>       4.73 =C4=85 10%     -43.5%       2.68 =C4=85 10%  sched_debug.cpu.c=
lock.stddev
>       4.73 =C4=85 10%     -43.5%       2.68 =C4=85 10%  sched_debug.cpu.c=
lock_task.stddev
>      15.24          +114.8%      32.74        sched_debug.cpu.cpu_load[0]=
.avg
>      34.93 =C4=85  5%    +101.2%      70.29 =C4=85  7%  sched_debug.cpu.c=
pu_load[0].max
>      11.87 =C4=85 17%    +113.1%      25.29 =C4=85 10%  sched_debug.cpu.c=
pu_load[0].min
>       4.04 =C4=85 19%    +136.6%       9.56 =C4=85 11%  sched_debug.cpu.c=
pu_load[0].stddev
>      15.38          +116.7%      33.34        sched_debug.cpu.cpu_load[1]=
.avg
>      33.43 =C4=85  3%    +107.9%      69.50 =C4=85  8%  sched_debug.cpu.c=
pu_load[1].max
>      12.17 =C4=85 13%    +121.6%      26.96 =C4=85  7%  sched_debug.cpu.c=
pu_load[1].min
>       3.66 =C4=85 11%    +141.9%       8.85 =C4=85 13%  sched_debug.cpu.c=
pu_load[1].stddev
>      15.63          +118.3%      34.13 =C4=85  2%  sched_debug.cpu.cpu_lo=
ad[2].avg
>      35.37 =C4=85  5%    +102.4%      71.58 =C4=85 12%  sched_debug.cpu.c=
pu_load[2].max
>      12.47 =C4=85  8%    +122.3%      27.71 =C4=85  5%  sched_debug.cpu.c=
pu_load[2].min
>       3.76 =C4=85  6%    +139.9%       9.02 =C4=85 19%  sched_debug.cpu.c=
pu_load[2].stddev
>      15.89          +117.3%      34.54 =C4=85  2%  sched_debug.cpu.cpu_lo=
ad[3].avg
>      36.87 =C4=85  5%     +91.2%      70.50 =C4=85 12%  sched_debug.cpu.c=
pu_load[3].max
>      12.70 =C4=85  3%    +123.4%      28.38 =C4=85  4%  sched_debug.cpu.c=
pu_load[3].min
>       3.92 =C4=85  4%    +120.2%       8.62 =C4=85 19%  sched_debug.cpu.c=
pu_load[3].stddev
>      15.78          +116.4%      34.14        sched_debug.cpu.cpu_load[4]=
.avg
>      34.97 =C4=85  3%     +83.9%      64.29 =C4=85  9%  sched_debug.cpu.c=
pu_load[4].max
>      12.70 =C4=85  4%    +121.5%      28.13 =C4=85  5%  sched_debug.cpu.c=
pu_load[4].min
>       3.76 =C4=85  4%     +97.3%       7.42 =C4=85 13%  sched_debug.cpu.c=
pu_load[4].stddev
>       1878            -9.6%       1697        sched_debug.cpu.curr->pid.a=
vg
>     563.19 =C4=85  8%     +26.2%     710.48        sched_debug.cpu.curr->=
pid.stddev
>      17479 =C4=85  9%    +107.1%      36202 =C4=85 12%  sched_debug.cpu.l=
oad.avg
>      13772 =C4=85 17%    +102.9%      27939 =C4=85  8%  sched_debug.cpu.l=
oad.min
>       0.00 =C4=85 48%    +323.4%       0.00 =C4=85  6%  sched_debug.cpu.n=
ext_balance.stddev
>       3239 =C4=85  6%     -51.6%       1566 =C4=85 23%  sched_debug.cpu.n=
r_load_updates.stddev
>       0.90            +9.6%       0.98 =C4=85  3%  sched_debug.cpu.nr_run=
ning.avg
>       0.21 =C4=85 13%     +49.5%       0.32 =C4=85 12%  sched_debug.cpu.n=
r_running.stddev
>      16303 =C4=85  4%     +57.0%      25593 =C4=85 11%  sched_debug.cpu.n=
r_switches.avg
>       4097 =C4=85  3%     +74.7%       7159 =C4=85  5%  sched_debug.cpu.n=
r_switches.min
>      15086 =C4=85  4%     +55.3%      23424 =C4=85 13%  sched_debug.cpu.s=
ched_count.avg
>       3617 =C4=85  4%     +66.4%       6018        sched_debug.cpu.sched_=
count.min
>       1655 =C4=85  4%     +11.8%       1851 =C4=85  2%  sched_debug.cpu.s=
ched_goidle.avg
>       7388 =C4=85  4%     +56.0%      11529 =C4=85 13%  sched_debug.cpu.t=
twu_count.avg
>       1153 =C4=85  5%     +76.9%       2040        sched_debug.cpu.ttwu_c=
ount.min
>       5473 =C4=85  7%     +73.1%       9472 =C4=85 16%  sched_debug.cpu.t=
twu_local.avg
>     248.20 =C4=85 22%    +312.4%       1023 =C4=85  5%  sched_debug.cpu.t=
twu_local.min
>      82788 =C4=85 13%     -19.2%      66893        slabinfo.Acpi-Namespac=
e.active_objs
>      82800 =C4=85 13%     -19.2%      66893        slabinfo.Acpi-Namespac=
e.num_objs
>     997.60 =C4=85  5%     -35.5%     643.25 =C4=85 10%  slabinfo.Acpi-Par=
seExt.active_objs
>     997.60 =C4=85  5%     -35.5%     643.25 =C4=85 10%  slabinfo.Acpi-Par=
seExt.num_objs
>       1334 =C4=85  9%     -29.4%     942.25 =C4=85 12%  slabinfo.Acpi-Sta=
te.active_objs
>       1334 =C4=85  9%     -29.4%     942.25 =C4=85 12%  slabinfo.Acpi-Sta=
te.num_objs
>      12094 =C4=85  2%     -33.1%       8087 =C4=85  7%  slabinfo.anon_vma=
.active_objs
>      12094 =C4=85  2%     -33.1%       8087 =C4=85  7%  slabinfo.anon_vma=
.num_objs
>      26098 =C4=85  3%     -32.2%      17692 =C4=85  7%  slabinfo.anon_vma=
_chain.active_objs
>     407.60 =C4=85  3%     -32.2%     276.25 =C4=85  7%  slabinfo.anon_vma=
_chain.active_slabs
>      26098 =C4=85  3%     -32.2%      17698 =C4=85  7%  slabinfo.anon_vma=
_chain.num_objs
>     407.60 =C4=85  3%     -32.2%     276.25 =C4=85  7%  slabinfo.anon_vma=
_chain.num_slabs
>     326.60 =C4=85  5%     -46.5%     174.75 =C4=85 11%  slabinfo.bdev_cac=
he.active_objs
>     326.60 =C4=85  5%     -46.5%     174.75 =C4=85 11%  slabinfo.bdev_cac=
he.num_objs
>       5537 =C4=85  5%     -34.9%       3603 =C4=85  3%  slabinfo.cred_jar=
.active_objs
>       5537 =C4=85  5%     -34.9%       3603 =C4=85  3%  slabinfo.cred_jar=
.num_objs
>      77332 =C4=85 15%     -24.9%      58066        slabinfo.dentry.active=
_objs
>       1851 =C4=85 14%     -24.9%       1390        slabinfo.dentry.active=
_slabs
>      77788 =C4=85 14%     -24.9%      58422        slabinfo.dentry.num_ob=
js
>       1851 =C4=85 14%     -24.9%       1390        slabinfo.dentry.num_sl=
abs
>     543.80 =C4=85  5%     -21.5%     426.75 =C4=85  7%  slabinfo.dmaengin=
e-unmap-128.active_objs
>     543.80 =C4=85  5%     -21.5%     426.75 =C4=85  7%  slabinfo.dmaengin=
e-unmap-128.num_objs
>     836.80 =C4=85  3%     -26.6%     614.00 =C4=85  8%  slabinfo.file_loc=
k_cache.active_objs
>     836.80 =C4=85  3%     -26.6%     614.00 =C4=85  8%  slabinfo.file_loc=
k_cache.num_objs
>       2686           -50.3%       1334        slabinfo.files_cache.active=
_objs
>       2686           -50.3%       1334        slabinfo.files_cache.num_ob=
js
>       2614 =C4=85  6%     -28.6%       1867 =C4=85  9%  slabinfo.fsnotify=
_mark_connector.active_objs
>       2614 =C4=85  6%     -28.6%       1867 =C4=85  9%  slabinfo.fsnotify=
_mark_connector.num_objs
>       1139 =C4=85 19%     +56.1%       1778        slabinfo.inode_cache.a=
ctive_slabs
>       1139 =C4=85 19%     +56.1%       1778        slabinfo.inode_cache.n=
um_slabs
>      57588           -17.1%      47738        slabinfo.kernfs_node_cache.=
active_objs
>       1918           -17.1%       1590        slabinfo.kernfs_node_cache.=
active_slabs
>      57588           -17.1%      47738        slabinfo.kernfs_node_cache.=
num_objs
>       1918           -17.1%       1590        slabinfo.kernfs_node_cache.=
num_slabs
>       3675 =C4=85  3%     -28.5%       2629 =C4=85  6%  slabinfo.kmalloc-=
1024.active_objs
>       3780 =C4=85  3%     -29.0%       2682 =C4=85  5%  slabinfo.kmalloc-=
1024.num_objs
>       4169 =C4=85  7%     -37.3%       2616 =C4=85  8%  slabinfo.kmalloc-=
128.active_objs
>       4188 =C4=85  7%     -36.8%       2646 =C4=85  9%  slabinfo.kmalloc-=
128.num_objs
>      20880 =C4=85  3%     -34.4%      13691 =C4=85  2%  slabinfo.kmalloc-=
16.active_objs
>      20880 =C4=85  3%     -34.4%      13691 =C4=85  2%  slabinfo.kmalloc-=
16.num_objs
>       8075           -24.8%       6071        slabinfo.kmalloc-192.active=
_objs
>       8147           -24.9%       6121        slabinfo.kmalloc-192.num_ob=
js
>       3682 =C4=85 16%     -44.7%       2036        slabinfo.kmalloc-2048.=
active_objs
>     231.80 =C4=85 16%     -44.8%     128.00        slabinfo.kmalloc-2048.=
active_slabs
>       3715 =C4=85 16%     -44.6%       2057        slabinfo.kmalloc-2048.=
num_objs
>     231.80 =C4=85 16%     -44.8%     128.00        slabinfo.kmalloc-2048.=
num_slabs
>      13447 =C4=85  6%     -39.2%       8174 =C4=85  2%  slabinfo.kmalloc-=
256.active_objs
>     427.00 =C4=85  6%     -37.4%     267.50 =C4=85  2%  slabinfo.kmalloc-=
256.active_slabs
>      13678 =C4=85  6%     -37.3%       8573 =C4=85  2%  slabinfo.kmalloc-=
256.num_objs
>     427.00 =C4=85  6%     -37.4%     267.50 =C4=85  2%  slabinfo.kmalloc-=
256.num_slabs
>     870.00 =C4=85  4%     -30.4%     605.25        slabinfo.kmalloc-4096.=
active_objs
>     888.60 =C4=85  5%     -30.9%     614.00        slabinfo.kmalloc-4096.=
num_objs
>       5716 =C4=85  3%     -42.4%       3292 =C4=85  2%  slabinfo.kmalloc-=
512.active_objs
>       5750 =C4=85  3%     -42.2%       3324 =C4=85  2%  slabinfo.kmalloc-=
512.num_objs
>      33888           -47.1%      17936 =C4=85  2%  slabinfo.kmalloc-8.act=
ive_objs
>      34199           -46.5%      18303 =C4=85  2%  slabinfo.kmalloc-8.num=
_objs
>     393.00 =C4=85  3%     -38.5%     241.75 =C4=85  2%  slabinfo.kmalloc-=
8192.active_objs
>     410.40 =C4=85  5%     -38.2%     253.50 =C4=85  3%  slabinfo.kmalloc-=
8192.num_objs
>       6813 =C4=85  7%     -25.9%       5051 =C4=85 10%  slabinfo.kmalloc-=
96.active_objs
>       6870 =C4=85  6%     -25.8%       5098 =C4=85 10%  slabinfo.kmalloc-=
96.num_objs
>     939.00 =C4=85  2%     -46.5%     502.50 =C4=85  2%  slabinfo.mm_struc=
t.active_objs
>     939.00 =C4=85  2%     -46.5%     502.50 =C4=85  2%  slabinfo.mm_struc=
t.num_objs
>       1549 =C4=85  4%     -32.0%       1053 =C4=85  3%  slabinfo.mnt_cach=
e.active_objs
>       1549 =C4=85  4%     -32.0%       1053 =C4=85  3%  slabinfo.mnt_cach=
e.num_objs
>       2323           -46.8%       1236 =C4=85  3%  slabinfo.pid.active_ob=
js
>       2323           -46.8%       1236 =C4=85  3%  slabinfo.pid.num_objs
>       7815 =C4=85 14%     -37.9%       4854        slabinfo.proc_inode_ca=
che.active_objs
>       7815 =C4=85 14%     -37.8%       4858        slabinfo.proc_inode_ca=
che.num_objs
>      17962 =C4=85 23%     -27.0%      13111        slabinfo.radix_tree_no=
de.active_objs
>      17962 =C4=85 23%     -27.0%      13111        slabinfo.radix_tree_no=
de.num_objs
>       3229           -35.2%       2092 =C4=85  3%  slabinfo.shmem_inode_c=
ache.active_objs
>       3229           -35.2%       2092 =C4=85  3%  slabinfo.shmem_inode_c=
ache.num_objs
>       1403 =C4=85  2%     -43.6%     791.50 =C4=85  2%  slabinfo.sighand_=
cache.active_objs
>       1409 =C4=85  2%     -43.9%     791.50 =C4=85  2%  slabinfo.sighand_=
cache.num_objs
>       2230           -46.3%       1197 =C4=85  3%  slabinfo.signal_cache.=
active_objs
>       2230           -46.3%       1197 =C4=85  3%  slabinfo.signal_cache.=
num_objs
>       2866           -75.6%     700.00        slabinfo.sigqueue.active_ob=
js
>       2866           -75.6%     700.00        slabinfo.sigqueue.num_objs
>       2585 =C4=85  3%     -46.2%       1391        slabinfo.sock_inode_ca=
che.active_objs
>       2585 =C4=85  3%     -46.2%       1391        slabinfo.sock_inode_ca=
che.num_objs
>       1243 =C4=85 12%     -20.0%     994.50 =C4=85  7%  slabinfo.task_gro=
up.active_objs
>       1243 =C4=85 12%     -20.0%     994.50 =C4=85  7%  slabinfo.task_gro=
up.num_objs
>       1064           -43.1%     605.00        slabinfo.task_struct.active=
_objs
>     359.60           -42.3%     207.50        slabinfo.task_struct.active=
_slabs
>       1079           -42.2%     623.50        slabinfo.task_struct.num_ob=
js
>     359.60           -42.3%     207.50        slabinfo.task_struct.num_sl=
abs
>      24370 =C4=85  4%     -42.6%      13994 =C4=85  3%  slabinfo.vm_area_=
struct.active_objs
>     608.80 =C4=85  4%     -42.4%     350.50 =C4=85  3%  slabinfo.vm_area_=
struct.active_slabs
>      24374 =C4=85  4%     -42.4%      14043 =C4=85  3%  slabinfo.vm_area_=
struct.num_objs
>     608.80 =C4=85  4%     -42.4%     350.50 =C4=85  3%  slabinfo.vm_area_=
struct.num_slabs
>       0.27 =C4=85122%      +0.5        0.74 =C4=85 26%  perf-profile.call=
trace.cycles-pp.__acct_update_integrals.update_process_times.tick_sched_han=
dle.tick_sched_timer.__hrtimer_run_queues
>       0.38 =C4=85 84%      +0.5        0.91 =C4=85  7%  perf-profile.call=
trace.cycles-pp._raw_spin_lock.perf_mux_hrtimer_handler.__hrtimer_run_queue=
s.hrtimer_interrupt.smp_apic_timer_interrupt
>       0.00            +0.6        0.55 =C4=85  7%  perf-profile.calltrace=
.cycles-pp.record__mmap_read_evlist.cmd_record.run_builtin.handle_internal_=
command.main
>       0.00            +0.6        0.55 =C4=85  7%  perf-profile.calltrace=
.cycles-pp.perf_mmap__push.record__mmap_read_evlist.cmd_record.run_builtin.=
handle_internal_command
>       0.00            +0.6        0.55 =C4=85  7%  perf-profile.calltrace=
.cycles-pp.record__pushfn.perf_mmap__push.record__mmap_read_evlist.cmd_reco=
rd.run_builtin
>       0.00            +0.6        0.55 =C4=85  7%  perf-profile.calltrace=
.cycles-pp.__libc_write.record__pushfn.perf_mmap__push.record__mmap_read_ev=
list.cmd_record
>       0.00            +0.6        0.60 =C4=85 13%  perf-profile.calltrace=
.cycles-pp.cmd_record.run_builtin.handle_internal_command.main.__libc_start=
_main
>       0.53 =C4=85 51%      +0.6        1.17 =C4=85 18%  perf-profile.call=
trace.cycles-pp.search_binary_handler.do_execveat_common.sys_execve.do_sysc=
all_64.entry_SYSCALL_64_after_hwframe
>       0.53 =C4=85 51%      +0.6        1.17 =C4=85 18%  perf-profile.call=
trace.cycles-pp.load_elf_binary.search_binary_handler.do_execveat_common.sy=
s_execve.do_syscall_64
>       0.25 =C4=85122%      +0.7        0.95 =C4=85 20%  perf-profile.call=
trace.cycles-pp.__libc_fork
>       0.44 =C4=85 87%      +0.8        1.21 =C4=85 22%  perf-profile.call=
trace.cycles-pp.__wake_up_parent.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me
>       0.44 =C4=85 87%      +0.8        1.21 =C4=85 22%  perf-profile.call=
trace.cycles-pp.do_group_exit.__wake_up_parent.do_syscall_64.entry_SYSCALL_=
64_after_hwframe
>       0.44 =C4=85 87%      +0.8        1.21 =C4=85 22%  perf-profile.call=
trace.cycles-pp.do_exit.do_group_exit.__wake_up_parent.do_syscall_64.entry_=
SYSCALL_64_after_hwframe
>       1.03 =C4=85 55%      +0.8        1.84 =C4=85 13%  perf-profile.call=
trace.cycles-pp.switch_to_thread_stack.__irqentry_text_start
>       0.76 =C4=85 50%      +1.0        1.80 =C4=85 13%  perf-profile.call=
trace.cycles-pp.pipe_read.__vfs_read.vfs_read.sys_read.do_syscall_64
>       0.93 =C4=85 54%      +1.1        2.01 =C4=85 20%  perf-profile.call=
trace.cycles-pp.do_execveat_common.sys_execve.do_syscall_64.entry_SYSCALL_6=
4_after_hwframe.execve
>       1.29 =C4=85 60%      +1.1        2.39 =C4=85 18%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       1.30 =C4=85 60%      +1.1        2.40 =C4=85 19%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe
>       0.94 =C4=85 53%      +1.1        2.04 =C4=85 21%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.execve
>       0.94 =C4=85 53%      +1.1        2.04 =C4=85 21%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve
>       0.94 =C4=85 53%      +1.1        2.04 =C4=85 21%  perf-profile.call=
trace.cycles-pp.sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe.exe=
cve
>       1.24 =C4=85 54%      +1.2        2.46 =C4=85 15%  perf-profile.call=
trace.cycles-pp.ktime_get_update_offsets_now.hrtimer_interrupt.smp_apic_tim=
er_interrupt.__irqentry_text_start
>       2.37 =C4=85 50%      +1.2        3.62 =C4=85 15%  perf-profile.call=
trace.cycles-pp.sys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>       1.01 =C4=85 54%      +1.3        2.27 =C4=85 19%  perf-profile.call=
trace.cycles-pp.execve
>       0.41 =C4=85 84%      +1.4        1.79 =C4=85 18%  perf-profile.call=
trace.cycles-pp.migrate_misplaced_transhuge_page.do_huge_pmd_numa_page.__ha=
ndle_mm_fault.handle_mm_fault.__do_page_fault
>       1.18 =C4=85 50%      +1.5        2.67 =C4=85 15%  perf-profile.call=
trace.cycles-pp.vfs_read.sys_read.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame.read
>       0.23 =C4=85123%      +1.5        1.74 =C4=85 17%  perf-profile.call=
trace.cycles-pp.migrate_page_copy.migrate_misplaced_transhuge_page.do_huge_=
pmd_numa_page.__handle_mm_fault.handle_mm_fault
>       0.22 =C4=85123%      +1.5        1.74 =C4=85 17%  perf-profile.call=
trace.cycles-pp.copy_page.migrate_page_copy.migrate_misplaced_transhuge_pag=
e.do_huge_pmd_numa_page.__handle_mm_fault
>       1.71 =C4=85 54%      +1.5        3.23 =C4=85 34%  perf-profile.call=
trace.cycles-pp.ret_from_intr
>       1.26 =C4=85 50%      +1.5        2.79 =C4=85 16%  perf-profile.call=
trace.cycles-pp.sys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
>       0.00            +1.5        1.53 =C4=85 43%  perf-profile.calltrace=
.cycles-pp.__libc_start_main
>       0.00            +1.5        1.53 =C4=85 43%  perf-profile.calltrace=
.cycles-pp.main.__libc_start_main
>       0.00            +1.5        1.53 =C4=85 43%  perf-profile.calltrace=
.cycles-pp.handle_internal_command.main.__libc_start_main
>       0.00            +1.5        1.53 =C4=85 43%  perf-profile.calltrace=
.cycles-pp.run_builtin.handle_internal_command.main.__libc_start_main
>       1.55 =C4=85 53%      +1.6        3.19 =C4=85 35%  perf-profile.call=
trace.cycles-pp.do_IRQ.ret_from_intr
>       1.11 =C4=85 54%      +1.7        2.77 =C4=85 36%  perf-profile.call=
trace.cycles-pp.ixgbe_read_reg.ixgbe_poll.net_rx_action.__softirqentry_text=
_start.irq_exit
>       1.29 =C4=85 51%      +1.7        2.98 =C4=85 17%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
>       1.32 =C4=85 51%      +1.7        3.04 =C4=85 16%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
>       2.34 =C4=85 51%      +1.7        4.07 =C4=85 16%  perf-profile.call=
trace.cycles-pp.switch_to_thread_stack
>       1.32 =C4=85 54%      +1.8        3.07 =C4=85 36%  perf-profile.call=
trace.cycles-pp.net_rx_action.__softirqentry_text_start.irq_exit.do_IRQ.ret=
_from_intr
>       1.28 =C4=85 53%      +1.8        3.04 =C4=85 35%  perf-profile.call=
trace.cycles-pp.ixgbe_poll.net_rx_action.__softirqentry_text_start.irq_exit=
.do_IRQ
>       1.33 =C4=85 54%      +1.8        3.09 =C4=85 35%  perf-profile.call=
trace.cycles-pp.__softirqentry_text_start.irq_exit.do_IRQ.ret_from_intr
>       1.37 =C4=85 53%      +1.8        3.14 =C4=85 35%  perf-profile.call=
trace.cycles-pp.irq_exit.do_IRQ.ret_from_intr
>       0.53 =C4=85 56%      +2.0        2.55 =C4=85 15%  perf-profile.call=
trace.cycles-pp.memcpy_erms.mga_dirty_update.soft_cursor.bit_cursor.fb_flas=
hcursor
>       0.53 =C4=85 56%      +2.0        2.57 =C4=85 14%  perf-profile.call=
trace.cycles-pp.soft_cursor.bit_cursor.fb_flashcursor.process_one_work.work=
er_thread
>       0.53 =C4=85 56%      +2.0        2.57 =C4=85 14%  perf-profile.call=
trace.cycles-pp.mga_dirty_update.soft_cursor.bit_cursor.fb_flashcursor.proc=
ess_one_work
>       0.53 =C4=85 56%      +2.0        2.58 =C4=85 15%  perf-profile.call=
trace.cycles-pp.fb_flashcursor.process_one_work.worker_thread.kthread.ret_f=
rom_fork
>       0.53 =C4=85 56%      +2.0        2.58 =C4=85 15%  perf-profile.call=
trace.cycles-pp.bit_cursor.fb_flashcursor.process_one_work.worker_thread.kt=
hread
>       3.41 =C4=85 51%      +2.1        5.51 =C4=85 25%  perf-profile.call=
trace.cycles-pp.write
>       1.19 =C4=85 58%      +2.1        3.30 =C4=85 26%  perf-profile.call=
trace.cycles-pp.__vfs_read.vfs_read.sys_read.do_syscall_64.entry_SYSCALL_64=
_after_hwframe
>       0.87 =C4=85 58%      +2.2        3.03 =C4=85 10%  perf-profile.call=
trace.cycles-pp.worker_thread.kthread.ret_from_fork
>       0.84 =C4=85 58%      +2.2        3.00 =C4=85 10%  perf-profile.call=
trace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork
>       1.14 =C4=85 52%      +2.2        3.38 =C4=85  8%  perf-profile.call=
trace.cycles-pp.ret_from_fork
>       1.14 =C4=85 52%      +2.2        3.38 =C4=85  8%  perf-profile.call=
trace.cycles-pp.kthread.ret_from_fork
>       1.67 =C4=85 50%      +2.2        3.92 =C4=85 17%  perf-profile.call=
trace.cycles-pp.read
>       0.10 =C4=85 67%      +0.1        0.17 =C4=85 26%  perf-profile.chil=
dren.cycles-pp.unlink_file_vma
>       0.04 =C4=85 83%      +0.1        0.10 =C4=85 58%  perf-profile.chil=
dren.cycles-pp.sys_readlink
>       0.01 =C4=85200%      +0.1        0.08 =C4=85 48%  perf-profile.chil=
dren.cycles-pp.vmacache_find
>       0.04 =C4=85122%      +0.1        0.11 =C4=85 33%  perf-profile.chil=
dren.cycles-pp.unlink_anon_vmas
>       0.04 =C4=85 85%      +0.1        0.12 =C4=85 32%  perf-profile.chil=
dren.cycles-pp.__inode_security_revalidate
>       0.00            +0.1        0.08 =C4=85 19%  perf-profile.children.=
cycles-pp.__call_rcu
>       0.06 =C4=85 95%      +0.1        0.14 =C4=85 24%  perf-profile.chil=
dren.cycles-pp.pte_alloc_one
>       0.03 =C4=85 82%      +0.1        0.11 =C4=85 51%  perf-profile.chil=
dren.cycles-pp.do_notify_parent
>       0.06 =C4=85 98%      +0.1        0.14 =C4=85 51%  perf-profile.chil=
dren.cycles-pp._IO_fwrite
>       0.05 =C4=85 99%      +0.1        0.14 =C4=85 35%  perf-profile.chil=
dren.cycles-pp.open64
>       0.01 =C4=85200%      +0.1        0.10 =C4=85 46%  perf-profile.chil=
dren.cycles-pp.format_decode
>       0.04 =C4=85 83%      +0.1        0.13 =C4=85 15%  perf-profile.chil=
dren.cycles-pp.release_task
>       0.07 =C4=85 69%      +0.1        0.17 =C4=85 28%  perf-profile.chil=
dren.cycles-pp.vma_interval_tree_insert
>       0.03 =C4=85136%      +0.1        0.14 =C4=85 33%  perf-profile.chil=
dren.cycles-pp.down_write
>       0.03 =C4=85133%      +0.1        0.14 =C4=85 38%  perf-profile.chil=
dren.cycles-pp.poll_idle
>       0.02 =C4=85200%      +0.1        0.12 =C4=85 45%  perf-profile.chil=
dren.cycles-pp.reschedule_interrupt
>       0.06 =C4=85122%      +0.1        0.17 =C4=85 20%  perf-profile.chil=
dren.cycles-pp.copy_strings_kernel
>       0.12 =C4=85 64%      +0.1        0.23 =C4=85 23%  perf-profile.chil=
dren.cycles-pp.__fget_light
>       0.04 =C4=85 83%      +0.1        0.15 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.wait_consider_task
>       0.06 =C4=85122%      +0.1        0.17 =C4=85 55%  perf-profile.chil=
dren.cycles-pp.__vma_adjust
>       0.02 =C4=85200%      +0.1        0.14 =C4=85 38%  perf-profile.chil=
dren.cycles-pp.sched_exec
>       0.04 =C4=85 90%      +0.1        0.16 =C4=85 53%  perf-profile.chil=
dren.cycles-pp.__atime_needs_update
>       0.09 =C4=85 62%      +0.1        0.21 =C4=85 32%  perf-profile.chil=
dren.cycles-pp.cpu_load_update_active
>       0.02 =C4=85200%      +0.1        0.15 =C4=85 48%  perf-profile.chil=
dren.cycles-pp.sched_ttwu_pending
>       0.16 =C4=85 55%      +0.1        0.28 =C4=85 20%  perf-profile.chil=
dren.cycles-pp.clear_page_erms
>       0.11 =C4=85 71%      +0.1        0.24 =C4=85 26%  perf-profile.chil=
dren.cycles-pp.sys_mprotect
>       0.07 =C4=85 55%      +0.1        0.20 =C4=85 23%  perf-profile.chil=
dren.cycles-pp.SYSC_wait4
>       0.07 =C4=85 55%      +0.1        0.20 =C4=85 23%  perf-profile.chil=
dren.cycles-pp.kernel_wait4
>       0.05 =C4=85 83%      +0.1        0.18 =C4=85 45%  perf-profile.chil=
dren.cycles-pp.file_has_perm
>       0.07 =C4=85 73%      +0.1        0.20 =C4=85 51%  perf-profile.chil=
dren.cycles-pp.page_remove_rmap
>       0.09 =C4=85 71%      +0.1        0.23 =C4=85 11%  perf-profile.chil=
dren.cycles-pp.__d_lookup_rcu
>       0.10 =C4=85 78%      +0.1        0.24 =C4=85 26%  perf-profile.chil=
dren.cycles-pp.do_mprotect_pkey
>       0.01 =C4=85200%      +0.1        0.15 =C4=85 55%  perf-profile.chil=
dren.cycles-pp.get_empty_filp
>       0.06 =C4=85 60%      +0.1        0.20 =C4=85 23%  perf-profile.chil=
dren.cycles-pp.do_wait
>       0.06 =C4=85 98%      +0.1        0.20 =C4=85 27%  perf-profile.chil=
dren.cycles-pp.touch_atime
>       0.00            +0.1        0.15 =C4=85 39%  perf-profile.children.=
cycles-pp.__might_fault
>       0.03 =C4=85 82%      +0.2        0.18 =C4=85 38%  perf-profile.chil=
dren.cycles-pp.__list_del_entry_valid
>       0.12 =C4=85 76%      +0.2        0.27 =C4=85 46%  perf-profile.chil=
dren.cycles-pp._init
>       0.11 =C4=85 51%      +0.2        0.27 =C4=85 24%  perf-profile.chil=
dren.cycles-pp.selinux_file_permission
>       0.08 =C4=85 76%      +0.2        0.24 =C4=85 38%  perf-profile.chil=
dren.cycles-pp.copy_page_from_iter
>       0.03 =C4=85122%      +0.2        0.21 =C4=85 23%  perf-profile.chil=
dren.cycles-pp.seq_printf
>       0.03 =C4=85122%      +0.2        0.21 =C4=85 23%  perf-profile.chil=
dren.cycles-pp.seq_vprintf
>       0.11 =C4=85 79%      +0.2        0.28 =C4=85 36%  perf-profile.chil=
dren.cycles-pp.alloc_set_pte
>       0.07 =C4=85 84%      +0.2        0.25 =C4=85 20%  perf-profile.chil=
dren.cycles-pp.vsnprintf
>       0.10 =C4=85 56%      +0.2        0.27 =C4=85 18%  perf-profile.chil=
dren.cycles-pp.wait4
>       0.03 =C4=85124%      +0.2        0.21 =C4=85 83%  perf-profile.chil=
dren.cycles-pp.__intel_pmu_disable_all
>       0.01 =C4=85200%      +0.2        0.19 =C4=85 33%  perf-profile.chil=
dren.cycles-pp.show_pid_map
>       0.01 =C4=85200%      +0.2        0.19 =C4=85 33%  perf-profile.chil=
dren.cycles-pp.show_map_vma
>       0.15 =C4=85 74%      +0.2        0.33 =C4=85 38%  perf-profile.chil=
dren.cycles-pp.__switch_to
>       0.00            +0.2        0.18 =C4=85 32%  perf-profile.children.=
cycles-pp.iov_iter_fault_in_readable
>       0.05 =C4=85 83%      +0.2        0.23 =C4=85 34%  perf-profile.chil=
dren.cycles-pp.release_pages
>       0.04 =C4=85 89%      +0.2        0.24 =C4=85 27%  perf-profile.chil=
dren.cycles-pp.tlb_flush_mmu_free
>       0.15 =C4=85 86%      +0.2        0.36 =C4=85  8%  perf-profile.chil=
dren.cycles-pp.mmap_region
>       0.03 =C4=85136%      +0.2        0.24 =C4=85 35%  perf-profile.chil=
dren.cycles-pp.find_vma
>       0.02 =C4=85125%      +0.2        0.24 =C4=85 78%  perf-profile.chil=
dren.cycles-pp.copyout
>       0.11 =C4=85 70%      +0.2        0.34 =C4=85 33%  perf-profile.chil=
dren.cycles-pp.ixgbe_service_task
>       0.11 =C4=85 70%      +0.2        0.34 =C4=85 33%  perf-profile.chil=
dren.cycles-pp.ixgbe_update_stats
>       0.15 =C4=85 68%      +0.2        0.38 =C4=85 37%  perf-profile.chil=
dren.cycles-pp.proc_reg_read
>       0.04 =C4=85 89%      +0.2        0.27 =C4=85 30%  perf-profile.chil=
dren.cycles-pp.arch_tlb_finish_mmu
>       0.12 =C4=85 72%      +0.2        0.35 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.lookup_fast
>       0.19 =C4=85 65%      +0.2        0.42 =C4=85 30%  perf-profile.chil=
dren.cycles-pp.lf
>       0.19 =C4=85 65%      +0.2        0.42 =C4=85 30%  perf-profile.chil=
dren.cycles-pp.con_scroll
>       0.19 =C4=85 65%      +0.2        0.42 =C4=85 30%  perf-profile.chil=
dren.cycles-pp.fbcon_scroll
>       0.19 =C4=85 65%      +0.2        0.42 =C4=85 30%  perf-profile.chil=
dren.cycles-pp.fbcon_redraw
>       0.19 =C4=85 65%      +0.2        0.42 =C4=85 30%  perf-profile.chil=
dren.cycles-pp.fbcon_putcs
>       0.21 =C4=85 60%      +0.2        0.44 =C4=85  4%  perf-profile.chil=
dren.cycles-pp.do_mmap
>       0.15 =C4=85 70%      +0.2        0.38 =C4=85 26%  perf-profile.chil=
dren.cycles-pp.free_pgtables
>       0.07 =C4=85 69%      +0.2        0.31 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.__mmap
>       0.18 =C4=85 70%      +0.2        0.42 =C4=85 30%  perf-profile.chil=
dren.cycles-pp.bit_putcs
>       0.04 =C4=85 89%      +0.2        0.29 =C4=85 37%  perf-profile.chil=
dren.cycles-pp.tlb_finish_mmu
>       0.19 =C4=85 65%      +0.3        0.44 =C4=85 23%  perf-profile.chil=
dren.cycles-pp.vt_console_print
>       0.16 =C4=85 74%      +0.3        0.42 =C4=85 30%  perf-profile.chil=
dren.cycles-pp.sys_imageblit
>       0.06 =C4=85 96%      +0.3        0.33 =C4=85 55%  perf-profile.chil=
dren.cycles-pp.copy_page_to_iter
>       0.16 =C4=85 74%      +0.3        0.43 =C4=85 23%  perf-profile.chil=
dren.cycles-pp.mga_imageblit
>       0.16 =C4=85 74%      +0.3        0.43 =C4=85 23%  perf-profile.chil=
dren.cycles-pp.drm_fb_helper_sys_imageblit
>       0.22 =C4=85 53%      +0.3        0.49 =C4=85 34%  perf-profile.chil=
dren.cycles-pp.__alloc_pages_nodemask
>       0.21 =C4=85 53%      +0.3        0.49 =C4=85 34%  perf-profile.chil=
dren.cycles-pp.get_page_from_freelist
>       0.08 =C4=85 60%      +0.3        0.37 =C4=85 51%  perf-profile.chil=
dren.cycles-pp.alloc_pages_vma
>       0.24 =C4=85 61%      +0.3        0.52 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.vm_mmap_pgoff
>       0.21 =C4=85 73%      +0.3        0.52 =C4=85 31%  perf-profile.chil=
dren.cycles-pp.rb_erase
>       0.15 =C4=85 52%      +0.3        0.47 =C4=85  8%  perf-profile.chil=
dren.cycles-pp.sys_mmap_pgoff
>       0.23 =C4=85 56%      +0.3        0.55 =C4=85 20%  perf-profile.chil=
dren.cycles-pp.setlocale
>       0.28 =C4=85 59%      +0.3        0.60 =C4=85 28%  perf-profile.chil=
dren.cycles-pp.copy_process
>       0.25 =C4=85 72%      +0.3        0.58 =C4=85 43%  perf-profile.chil=
dren.cycles-pp.flush_tlb_mm_range
>       0.40 =C4=85 62%      +0.3        0.74 =C4=85 26%  perf-profile.chil=
dren.cycles-pp.__acct_update_integrals
>       0.03 =C4=85127%      +0.4        0.42 =C4=85130%  perf-profile.chil=
dren.cycles-pp.__perf_read_group_add
>       0.20 =C4=85 53%      +0.4        0.59 =C4=85 22%  perf-profile.chil=
dren.cycles-pp.seq_read
>       0.22 =C4=85 51%      +0.4        0.62 =C4=85 23%  perf-profile.chil=
dren.cycles-pp.flush_old_exec
>       0.27 =C4=85 54%      +0.4        0.69 =C4=85 15%  perf-profile.chil=
dren.cycles-pp.do_sys_open
>       0.00            +0.4        0.43 =C4=85 13%  perf-profile.children.=
cycles-pp.__generic_file_write_iter
>       0.00            +0.4        0.43 =C4=85 13%  perf-profile.children.=
cycles-pp.generic_file_write_iter
>       0.00            +0.4        0.43 =C4=85 13%  perf-profile.children.=
cycles-pp.generic_perform_write
>       0.33 =C4=85 59%      +0.5        0.78 =C4=85 25%  perf-profile.chil=
dren.cycles-pp.do_filp_open
>       0.33 =C4=85 59%      +0.5        0.78 =C4=85 25%  perf-profile.chil=
dren.cycles-pp.path_openat
>       0.14 =C4=85 60%      +0.5        0.65 =C4=85 16%  perf-profile.chil=
dren.cycles-pp.do_wp_page
>       0.13 =C4=85 62%      +0.5        0.65 =C4=85 16%  perf-profile.chil=
dren.cycles-pp.wp_page_copy
>       0.42 =C4=85 54%      +0.5        0.95 =C4=85 20%  perf-profile.chil=
dren.cycles-pp.__libc_fork
>       0.00            +0.6        0.55 =C4=85  7%  perf-profile.children.=
cycles-pp.record__mmap_read_evlist
>       0.00            +0.6        0.55 =C4=85  7%  perf-profile.children.=
cycles-pp.perf_mmap__push
>       0.00            +0.6        0.55 =C4=85  7%  perf-profile.children.=
cycles-pp.record__pushfn
>       0.00            +0.6        0.55 =C4=85  7%  perf-profile.children.=
cycles-pp.__libc_write
>       0.08 =C4=85 59%      +0.6        0.64 =C4=85 33%  perf-profile.chil=
dren.cycles-pp.mutex_unlock
>       0.39 =C4=85 57%      +0.6        0.96 =C4=85 27%  perf-profile.chil=
dren.cycles-pp.syscall_return_via_sysret
>       0.00            +0.6        0.60 =C4=85 13%  perf-profile.children.=
cycles-pp.cmd_record
>       0.31 =C4=85 55%      +0.6        0.92 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.filemap_map_pages
>       0.53 =C4=85 51%      +0.6        1.17 =C4=85 18%  perf-profile.chil=
dren.cycles-pp.search_binary_handler
>       0.53 =C4=85 51%      +0.6        1.17 =C4=85 18%  perf-profile.chil=
dren.cycles-pp.load_elf_binary
>       0.55 =C4=85 60%      +0.7        1.23 =C4=85 22%  perf-profile.chil=
dren.cycles-pp.__wake_up_parent
>       0.55 =C4=85 60%      +0.7        1.23 =C4=85 22%  perf-profile.chil=
dren.cycles-pp.do_group_exit
>       0.55 =C4=85 60%      +0.7        1.23 =C4=85 22%  perf-profile.chil=
dren.cycles-pp.do_exit
>       0.62 =C4=85 54%      +0.7        1.33 =C4=85 26%  perf-profile.chil=
dren.cycles-pp.mmput
>       0.62 =C4=85 54%      +0.7        1.33 =C4=85 26%  perf-profile.chil=
dren.cycles-pp.exit_mmap
>       0.00            +0.9        0.90 =C4=85 68%  perf-profile.children.=
cycles-pp.perf_evsel__read_counter
>       0.00            +0.9        0.90 =C4=85 68%  perf-profile.children.=
cycles-pp.__libc_read
>       0.00            +0.9        0.91 =C4=85 69%  perf-profile.children.=
cycles-pp.read_counters
>       0.00            +0.9        0.92 =C4=85 67%  perf-profile.children.=
cycles-pp.__run_perf_stat
>       0.00            +0.9        0.92 =C4=85 67%  perf-profile.children.=
cycles-pp.process_interval
>       0.00            +0.9        0.93 =C4=85 68%  perf-profile.children.=
cycles-pp.cmd_stat
>       0.77 =C4=85 50%      +1.1        1.82 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.pipe_read
>       0.93 =C4=85 54%      +1.1        2.01 =C4=85 20%  perf-profile.chil=
dren.cycles-pp.do_execveat_common
>       0.94 =C4=85 53%      +1.1        2.04 =C4=85 21%  perf-profile.chil=
dren.cycles-pp.sys_execve
>       1.01 =C4=85 54%      +1.3        2.27 =C4=85 19%  perf-profile.chil=
dren.cycles-pp.execve
>       2.16 =C4=85 50%      +1.3        3.45 =C4=85 19%  perf-profile.chil=
dren.cycles-pp.__vfs_write
>       0.45 =C4=85 68%      +1.3        1.79 =C4=85 18%  perf-profile.chil=
dren.cycles-pp.migrate_misplaced_transhuge_page
>       1.27 =C4=85 54%      +1.4        2.62 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.ktime_get_update_offsets_now
>       0.37 =C4=85 63%      +1.4        1.74 =C4=85 17%  perf-profile.chil=
dren.cycles-pp.migrate_page_copy
>       2.29 =C4=85 50%      +1.5        3.80 =C4=85 17%  perf-profile.chil=
dren.cycles-pp.vfs_write
>       0.00            +1.5        1.53 =C4=85 43%  perf-profile.children.=
cycles-pp.handle_internal_command
>       0.00            +1.5        1.53 =C4=85 43%  perf-profile.children.=
cycles-pp.run_builtin
>       0.00            +1.5        1.54 =C4=85 41%  perf-profile.children.=
cycles-pp.__libc_start_main
>       0.00            +1.5        1.55 =C4=85 42%  perf-profile.children.=
cycles-pp.main
>       1.71 =C4=85 54%      +1.6        3.26 =C4=85 33%  perf-profile.chil=
dren.cycles-pp.ret_from_intr
>       1.55 =C4=85 53%      +1.7        3.20 =C4=85 35%  perf-profile.chil=
dren.cycles-pp.do_IRQ
>       2.38 =C4=85 50%      +1.7        4.12 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.sys_write
>       1.29 =C4=85 53%      +1.8        3.05 =C4=85 35%  perf-profile.chil=
dren.cycles-pp.ixgbe_poll
>       1.32 =C4=85 54%      +1.8        3.09 =C4=85 35%  perf-profile.chil=
dren.cycles-pp.net_rx_action
>       1.30 =C4=85 54%      +1.8        3.11 =C4=85 33%  perf-profile.chil=
dren.cycles-pp.ixgbe_read_reg
>       0.46 =C4=85 64%      +1.8        2.28 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.copy_page
>       0.55 =C4=85 56%      +2.0        2.57 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.mga_dirty_update
>       0.53 =C4=85 56%      +2.0        2.58 =C4=85 15%  perf-profile.chil=
dren.cycles-pp.fb_flashcursor
>       0.53 =C4=85 56%      +2.1        2.58 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.soft_cursor
>       0.53 =C4=85 56%      +2.1        2.59 =C4=85 15%  perf-profile.chil=
dren.cycles-pp.bit_cursor
>       3.41 =C4=85 51%      +2.1        5.51 =C4=85 25%  perf-profile.chil=
dren.cycles-pp.write
>       1.38 =C4=85 53%      +2.2        3.54 =C4=85 21%  perf-profile.chil=
dren.cycles-pp.__vfs_read
>       0.87 =C4=85 58%      +2.2        3.03 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.worker_thread
>       0.84 =C4=85 58%      +2.2        3.00 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.process_one_work
>       1.62 =C4=85 53%      +2.2        3.81 =C4=85 24%  perf-profile.chil=
dren.cycles-pp.sys_read
>       0.57 =C4=85 57%      +2.2        2.80 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.memcpy_erms
>       1.56 =C4=85 53%      +2.2        3.79 =C4=85 19%  perf-profile.chil=
dren.cycles-pp.vfs_read
>       1.14 =C4=85 52%      +2.2        3.38 =C4=85  8%  perf-profile.chil=
dren.cycles-pp.kthread
>       1.67 =C4=85 50%      +2.2        3.92 =C4=85 17%  perf-profile.chil=
dren.cycles-pp.read
>       1.17 =C4=85 53%      +2.3        3.44 =C4=85  8%  perf-profile.chil=
dren.cycles-pp.ret_from_fork
>       3.40 =C4=85 52%      +2.5        5.94 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.switch_to_thread_stack
>       7.00 =C4=85 50%      +7.8       14.78 =C4=85  6%  perf-profile.chil=
dren.cycles-pp.do_syscall_64
>       7.07 =C4=85 50%      +7.9       14.92 =C4=85  6%  perf-profile.chil=
dren.cycles-pp.entry_SYSCALL_64_after_hwframe
>       0.04 =C4=85 87%      +0.1        0.10 =C4=85 34%  perf-profile.self=
.cycles-pp.copy_page_from_iter
>       0.02 =C4=85125%      +0.1        0.09 =C4=85 27%  perf-profile.self=
.cycles-pp.vfs_write
>       0.01 =C4=85200%      +0.1        0.08 =C4=85 48%  perf-profile.self=
.cycles-pp.vmacache_find
>       0.05 =C4=85 90%      +0.1        0.12 =C4=85 47%  perf-profile.self=
.cycles-pp.__handle_mm_fault
>       0.03 =C4=85123%      +0.1        0.10 =C4=85 67%  perf-profile.self=
.cycles-pp.ixgbe_clean_rx_irq
>       0.06 =C4=85 98%      +0.1        0.14 =C4=85 51%  perf-profile.self=
.cycles-pp._IO_fwrite
>       0.01 =C4=85200%      +0.1        0.10 =C4=85 24%  perf-profile.self=
.cycles-pp.vsnprintf
>       0.02 =C4=85200%      +0.1        0.11 =C4=85 33%  perf-profile.self=
.cycles-pp.down_write
>       0.01 =C4=85200%      +0.1        0.10 =C4=85 46%  perf-profile.self=
.cycles-pp.format_decode
>       0.07 =C4=85 69%      +0.1        0.17 =C4=85 28%  perf-profile.self=
.cycles-pp.vma_interval_tree_insert
>       0.03 =C4=85133%      +0.1        0.14 =C4=85 38%  perf-profile.self=
.cycles-pp.poll_idle
>       0.12 =C4=85 64%      +0.1        0.23 =C4=85 23%  perf-profile.self=
.cycles-pp.__fget_light
>       0.00            +0.1        0.11 =C4=85 60%  perf-profile.self.cycl=
es-pp.kmem_cache_free
>       0.01 =C4=85200%      +0.1        0.12 =C4=85 47%  perf-profile.self=
.cycles-pp.__do_page_fault
>       0.03 =C4=85130%      +0.1        0.14 =C4=85 45%  perf-profile.self=
.cycles-pp.find_vma
>       0.16 =C4=85 55%      +0.1        0.28 =C4=85 20%  perf-profile.self=
.cycles-pp.clear_page_erms
>       0.09 =C4=85 71%      +0.1        0.23 =C4=85 11%  perf-profile.self=
.cycles-pp.__d_lookup_rcu
>       0.02 =C4=85122%      +0.1        0.16 =C4=85 53%  perf-profile.self=
.cycles-pp.__atime_needs_update
>       0.09 =C4=85 54%      +0.1        0.23 =C4=85 41%  perf-profile.self=
.cycles-pp.pipe_read
>       0.03 =C4=85 82%      +0.2        0.18 =C4=85 38%  perf-profile.self=
.cycles-pp.__list_del_entry_valid
>       0.12 =C4=85 80%      +0.2        0.27 =C4=85 46%  perf-profile.self=
.cycles-pp._init
>       0.03 =C4=85124%      +0.2        0.21 =C4=85 83%  perf-profile.self=
.cycles-pp.__intel_pmu_disable_all
>       0.15 =C4=85 74%      +0.2        0.33 =C4=85 38%  perf-profile.self=
.cycles-pp.__switch_to
>       0.08 =C4=85 71%      +0.2        0.29 =C4=85 52%  perf-profile.self=
.cycles-pp.___might_sleep
>       0.16 =C4=85 74%      +0.3        0.42 =C4=85 30%  perf-profile.self=
.cycles-pp.sys_imageblit
>       0.10 =C4=85 95%      +0.3        0.38 =C4=85 67%  perf-profile.self=
.cycles-pp.do_syscall_64
>       0.05 =C4=85 97%      +0.3        0.35 =C4=85 56%  perf-profile.self=
.cycles-pp.mutex_lock
>       0.21 =C4=85 73%      +0.3        0.52 =C4=85 31%  perf-profile.self=
.cycles-pp.rb_erase
>       0.40 =C4=85 62%      +0.3        0.74 =C4=85 26%  perf-profile.self=
.cycles-pp.__acct_update_integrals
>       0.16 =C4=85 53%      +0.5        0.66 =C4=85 10%  perf-profile.self=
.cycles-pp.filemap_map_pages
>       0.08 =C4=85 59%      +0.6        0.64 =C4=85 33%  perf-profile.self=
.cycles-pp.mutex_unlock
>       0.39 =C4=85 57%      +0.6        0.96 =C4=85 27%  perf-profile.self=
.cycles-pp.syscall_return_via_sysret
>       1.05 =C4=85 51%      +0.8        1.80 =C4=85 13%  perf-profile.self=
.cycles-pp.perf_mux_hrtimer_handler
>       1.00 =C4=85 55%      +0.9        1.95 =C4=85 10%  perf-profile.self=
.cycles-pp.ktime_get_update_offsets_now
>       1.28 =C4=85 53%      +1.1        2.36 =C4=85 21%  perf-profile.self=
.cycles-pp.ixgbe_read_reg
>       0.46 =C4=85 64%      +1.7        2.20 =C4=85 11%  perf-profile.self=
.cycles-pp.copy_page
>       0.56 =C4=85 56%      +2.2        2.78 =C4=85 14%  perf-profile.self=
.cycles-pp.memcpy_erms
>       3.40 =C4=85 52%      +2.5        5.94 =C4=85 14%  perf-profile.self=
.cycles-pp.switch_to_thread_stack
>
>
>
>                                vm-scalability.throughput
>
>   4.5e+06 +-+------------------------------------------------------------=
---+
>           | +     +                                                      =
   |
>           |+                                                             =
   |
>     4e+06 +-+                                                            =
   |
>           |                                                              =
   |
>           |                                                              =
   |
>   3.5e+06 +-+                                                            =
   |
>           |                                                              =
   |
>     3e+06 +-+                                                            =
   |
>           |                                                              =
   |
>           |                                                              =
   |
>   2.5e+06 +-+                                                            =
   |
>           O  O O  O O  O O  O O  O O  O O  O  O O  O O  O O  O O  O O  O =
O  O
>           |                                                              =
   |
>     2e+06 +-+------------------------------------------------------------=
---+
>
>
>                                 vm-scalability.median
>
>   88000 +-+--------------------------------------------------------------=
---+
>         O       O O  O       O  O    O O       O  O O  O  O    O  O O    =
O  O
>   86000 +-+O O          O O       O       O  O              O          O =
   |
>   84000 +-+                                                              =
   |
>         |                                                                =
   |
>   82000 +-+                                                              =
   |
>   80000 +-++.+..                                                         =
   |
>         |  :    +.+                                                      =
   |
>   78000 +-+                                                              =
   |
>   76000 +-+                                                              =
   |
>         | :                                                              =
   |
>   74000 +-+                                                              =
   |
>   72000 +-+                                                              =
   |
>         |                                                                =
   |
>   70000 +-+--------------------------------------------------------------=
---+
>
>
>                                 vm-scalability.workload
>
>   1.4e+09 +-+------------------------------------------------------------=
---+
>           |  +.+.. .+                                                    =
   |
>   1.3e+09 +-+     +                                                      =
   |
>           |+                                                             =
   |
>   1.2e+09 +-+                                                            =
   |
>           |                                                              =
   |
>   1.1e+09 +-+                                                            =
   |
>           |                                                              =
   |
>     1e+09 +-+                                                            =
   |
>           |                                                              =
   |
>     9e+08 +-+                                                            =
   |
>           |                                                              =
   |
>     8e+08 +-+                                                            =
   |
>           |                                                              =
   |
>     7e+08 O-+O-O--O-O--O-O--O-O--O-O--O-O--O--O-O--O-O--O-O--O-O--O-O--O-=
O--O
>
>
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
> Xiaolong

--===============6807138897654503492==--

