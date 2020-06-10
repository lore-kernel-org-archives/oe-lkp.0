Content-Type: multipart/mixed; boundary="===============0221411059394661316=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] a5949d3fae: aim7.jobs-per-min -33.6% regression
Date: Wed, 10 Jun 2020 11:07:14 +0800
Message-ID: <a080165c-824f-3d48-44e8-388fa94d32fe@linux.intel.com>
In-Reply-To: <20200606154812.GQ12456@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0221411059394661316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Darrick,

    Do you have time to take a look at this? Thanks.

On 6/6/2020 11:48 PM, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -33.6% regression of aim7.jobs-per-min due to commit:
> =

> =

> commit: a5949d3faedf492fa7863b914da408047ab46eb0 ("xfs: force writes to d=
elalloc regions to unwritten")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: aim7
> on test machine: 48 threads Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz wit=
h 64G memory
> with following parameters:
> =

> 	disk: 1BRD_48G
> 	fs: xfs
> 	test: sync_disk_rw
> 	load: 600
> 	cpufreq_governor: performance
> 	ucode: 0x42e
> =

> test-description: AIM7 is a traditional UNIX system level benchmark suite=
 which is used to test and measure the performance of multiuser system.
> test-url: https://sourceforge.net/projects/aimbench/files/aim-suite7/
> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> =

> =

> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
> =

> =

> To reproduce:
> =

>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp install job.yaml  # job file is attached in this email
>          bin/lkp run     job.yaml
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/disk/fs/kconfig/load/rootfs/tbox_group/test/tes=
tcase/ucode:
>    gcc-9/performance/1BRD_48G/xfs/x86_64-rhel-7.6/600/debian-x86_64-20191=
114.cgz/lkp-ivb-2ep1/sync_disk_rw/aim7/0x42e
> =

> commit:
>    590b16516e ("xfs: refactor xfs_iomap_prealloc_size")
>    a5949d3fae ("xfs: force writes to delalloc regions to unwritten")
> =

> 590b16516ef38e2e a5949d3faedf492fa7863b914da
> ---------------- ---------------------------
>         fail:runs  %reproduction    fail:runs
>             |             |             |
>             :4           50%           2:4     dmesg.WARNING:at#for_ip_sw=
apgs_restore_regs_and_return_to_usermode/0x
>           %stddev     %change         %stddev
>               \          |                \
>       35272           -33.6%      23430        aim7.jobs-per-min
>      102.13           +50.5%     153.75        aim7.time.elapsed_time
>      102.13           +50.5%     153.75        aim7.time.elapsed_time.max
>     1388038           +40.2%    1945838        aim7.time.involuntary_cont=
ext_switches
>       43420 =C2=B1  2%     +13.4%      49255 =C2=B1  2%  aim7.time.minor_=
page_faults
>        3123           +44.2%       4504 =C2=B1  2%  aim7.time.system_time
>       59.31            +6.5%      63.18        aim7.time.user_time
>    48595108           +58.6%   77064959        aim7.time.voluntary_contex=
t_switches
>        1.44           -28.8%       1.02        iostat.cpu.user
>        0.07 =C2=B1  6%      +0.4        0.44 =C2=B1  7%  mpstat.cpu.all.i=
owait%
>        1.44            -0.4        1.02        mpstat.cpu.all.usr%
>        8632 =C2=B1 50%     +75.6%      15156 =C2=B1 34%  numa-meminfo.nod=
e0.KernelStack
>        6583 =C2=B1136%    +106.0%      13562 =C2=B1 82%  numa-meminfo.nod=
e0.PageTables
>       63325 =C2=B1 11%     +14.3%      72352 =C2=B1 12%  numa-meminfo.nod=
e0.SUnreclaim
>        8647 =C2=B1 50%     +75.3%      15156 =C2=B1 34%  numa-vmstat.node=
0.nr_kernel_stack
>        1656 =C2=B1136%    +104.6%       3389 =C2=B1 82%  numa-vmstat.node=
0.nr_page_table_pages
>       15831 =C2=B1 11%     +14.3%      18087 =C2=B1 12%  numa-vmstat.node=
0.nr_slab_unreclaimable
>       93640 =C2=B1  3%     +41.2%     132211 =C2=B1  2%  meminfo.AnonHuge=
Pages
>       21641           +39.9%      30271 =C2=B1  4%  meminfo.KernelStack
>      129269           +12.3%     145114        meminfo.SUnreclaim
>       28000           -31.2%      19275        meminfo.max_used_kB
>     1269307           -26.9%     927657        vmstat.io.bo
>      149.75 =C2=B1  3%     -17.4%     123.75 =C2=B1  4%  vmstat.procs.r
>      718992           +13.3%     814567        vmstat.system.cs
>      231397            -9.3%     209881 =C2=B1  2%  vmstat.system.in
>   6.774e+08           +70.0%  1.152e+09        cpuidle.C1.time
>    18203372           +60.4%   29198744        cpuidle.C1.usage
>   2.569e+08 =C2=B1 18%     +81.8%  4.672e+08 =C2=B1  5%  cpuidle.C1E.time
>     2691402 =C2=B1 13%     +98.7%    5346901 =C2=B1  3%  cpuidle.C1E.usage
>      990350           +95.0%    1931226 =C2=B1  2%  cpuidle.POLL.time
>      520061           +97.7%    1028004 =C2=B1  2%  cpuidle.POLL.usage
>       77231            +1.8%      78602        proc-vmstat.nr_active_anon
>       19868            +3.8%      20615        proc-vmstat.nr_dirty
>      381302            +1.0%     384969        proc-vmstat.nr_file_pages
>        4388            -2.7%       4270        proc-vmstat.nr_inactive_an=
on
>       69865            +4.7%      73155        proc-vmstat.nr_inactive_fi=
le
>       21615           +40.0%      30251 =C2=B1  4%  proc-vmstat.nr_kernel=
_stack
>        7363            -3.2%       7127        proc-vmstat.nr_mapped
>       12595 =C2=B1  3%      +5.2%      13255 =C2=B1  4%  proc-vmstat.nr_s=
hmem
>       19619            +3.2%      20247        proc-vmstat.nr_slab_reclai=
mable
>       32316           +12.3%      36280        proc-vmstat.nr_slab_unrecl=
aimable
>       77231            +1.8%      78602        proc-vmstat.nr_zone_active=
_anon
>        4388            -2.7%       4270        proc-vmstat.nr_zone_inacti=
ve_anon
>       69865            +4.7%      73155        proc-vmstat.nr_zone_inacti=
ve_file
>       19165            +3.4%      19824        proc-vmstat.nr_zone_write_=
pending
>        9845 =C2=B1 27%     +68.0%      16539 =C2=B1 37%  proc-vmstat.numa=
_hint_faults_local
>     8195135            +2.5%    8402537        proc-vmstat.numa_hit
>     8179414            +2.5%    8386209        proc-vmstat.numa_local
>       15720            +3.9%      16328        proc-vmstat.numa_other
>     8281098            +2.4%    8477157        proc-vmstat.pgalloc_normal
>      342925 =C2=B1  2%     +39.8%     479279        proc-vmstat.pgfault
>     8132789            +2.0%    8298189        proc-vmstat.pgfree
>   1.327e+08            +9.7%  1.455e+08        proc-vmstat.pgpgout
>      394.00          +151.7%     991.75 =C2=B1  5%  slabinfo.biovec-max.a=
ctive_objs
>      394.00          +152.1%     993.25 =C2=B1  5%  slabinfo.biovec-max.n=
um_objs
>       21028 =C2=B1  6%      -7.8%      19389 =C2=B1  5%  slabinfo.filp.ac=
tive_objs
>       21520 =C2=B1  5%      -7.6%      19886 =C2=B1  5%  slabinfo.filp.nu=
m_objs
>        4955          +234.9%      16594 =C2=B1  2%  slabinfo.kmalloc-256.=
active_objs
>       77.25          +238.5%     261.50 =C2=B1  2%  slabinfo.kmalloc-256.=
active_slabs
>        4955          +238.4%      16768 =C2=B1  2%  slabinfo.kmalloc-256.=
num_objs
>       77.25          +238.5%     261.50 =C2=B1  2%  slabinfo.kmalloc-256.=
num_slabs
>        3368 =C2=B1  2%     +22.6%       4128 =C2=B1  2%  slabinfo.kmalloc=
-2k.active_objs
>        3446 =C2=B1  2%     +21.9%       4200 =C2=B1  2%  slabinfo.kmalloc=
-2k.num_objs
>       11815 =C2=B1  8%     +29.0%      15239 =C2=B1  3%  slabinfo.kmalloc=
-512.active_objs
>       11824 =C2=B1  9%     +29.0%      15249 =C2=B1  3%  slabinfo.kmalloc=
-512.num_objs
>        6849 =C2=B1  5%      +9.0%       7463 =C2=B1  2%  slabinfo.kmalloc=
-96.active_objs
>        6906 =C2=B1  5%      +8.9%       7521 =C2=B1  2%  slabinfo.kmalloc=
-96.num_objs
>      765.00 =C2=B1  4%     +25.0%     956.25 =C2=B1  5%  slabinfo.mnt_cac=
he.active_objs
>      765.00 =C2=B1  4%     +25.0%     956.25 =C2=B1  5%  slabinfo.mnt_cac=
he.num_objs
>       13866           +12.5%      15594        slabinfo.proc_inode_cache.=
active_objs
>       13905           +12.2%      15598        slabinfo.proc_inode_cache.=
num_objs
>        1954           +24.4%       2431 =C2=B1  3%  slabinfo.sighand_cach=
e.active_objs
>        1954           +24.4%       2431 =C2=B1  3%  slabinfo.sighand_cach=
e.num_objs
>        2596           +13.7%       2951 =C2=B1  2%  slabinfo.signal_cache=
.active_objs
>        2596           +13.7%       2951 =C2=B1  2%  slabinfo.signal_cache=
.num_objs
>        4368 =C2=B1  6%     -11.7%       3856 =C2=B1  2%  slabinfo.skbuff_=
head_cache.num_objs
>      822.25 =C2=B1 11%     +21.4%     998.50 =C2=B1  3%  slabinfo.task_gr=
oup.active_objs
>      822.25 =C2=B1 11%     +21.4%     998.50 =C2=B1  3%  slabinfo.task_gr=
oup.num_objs
>        1612           +32.1%       2129 =C2=B1  3%  slabinfo.task_struct.=
active_objs
>      540.50           +31.6%     711.25 =C2=B1  3%  slabinfo.task_struct.=
active_slabs
>        1622           +31.6%       2134 =C2=B1  3%  slabinfo.task_struct.=
num_objs
>      540.50           +31.6%     711.25 =C2=B1  3%  slabinfo.task_struct.=
num_slabs
>        6905           +20.0%       8289        slabinfo.vmap_area.active_=
objs
>        6933           +20.0%       8322        slabinfo.vmap_area.num_objs
>      646.25 =C2=B1  7%    +195.2%       1907        slabinfo.xfs_buf.acti=
ve_objs
>      646.25 =C2=B1  7%    +195.2%       1907        slabinfo.xfs_buf.num_=
objs
>        1.78 =C2=B1  2%      -0.3        1.51 =C2=B1  2%  perf-stat.i.bran=
ch-miss-rate%
>    64079048            +3.9%   66551536        perf-stat.i.branch-misses
>       17.99            -4.2       13.84        perf-stat.i.cache-miss-rat=
e%
>    66630506           -16.5%   55647472        perf-stat.i.cache-misses
>   3.899e+08            +9.4%  4.265e+08        perf-stat.i.cache-referenc=
es
>      731029           +13.1%     826756        perf-stat.i.context-switch=
es
>        3.79            -1.7%       3.73        perf-stat.i.cpi
>      113320            +8.3%     122693        perf-stat.i.cpu-migrations
>        1498           +20.4%       1803        perf-stat.i.cycles-between=
-cache-misses
>    50450547 =C2=B1  4%      -8.0%   46402743 =C2=B1  5%  perf-stat.i.dTLB=
-load-misses
>        0.20 =C2=B1  3%      -0.0        0.16 =C2=B1  2%  perf-stat.i.dTLB=
-store-miss-rate%
>     4587096 =C2=B1  3%     -22.9%    3538422 =C2=B1  2%  perf-stat.i.dTLB=
-store-misses
>   2.297e+09            -5.6%  2.168e+09        perf-stat.i.dTLB-stores
>       86.68            -2.4       84.25        perf-stat.i.iTLB-load-miss=
-rate%
>    19484791            -6.1%   18297125        perf-stat.i.iTLB-load-miss=
es
>     3060023           +14.4%    3501587 =C2=B1  4%  perf-stat.i.iTLB-loads
>        0.29            -1.5%       0.28        perf-stat.i.ipc
>        0.21 =C2=B1  5%     -20.5%       0.17 =C2=B1  6%  perf-stat.i.metr=
ic.K/sec
>        3120            -5.8%       2938        perf-stat.i.minor-faults
>       42.61            +1.2       43.83        perf-stat.i.node-load-miss=
-rate%
>    24887573           -10.1%   22384693        perf-stat.i.node-load-miss=
es
>    31814752           -12.5%   27830232        perf-stat.i.node-loads
>       36.62            +0.8       37.45        perf-stat.i.node-store-mis=
s-rate%
>    22617213           -20.3%   18015607        perf-stat.i.node-store-mis=
ses
>    35707079           -19.9%   28604167        perf-stat.i.node-stores
>        3120            -5.8%       2938        perf-stat.i.page-faults
>       13.96            +9.3%      15.25        perf-stat.overall.MPKI
>        0.99            +0.0        1.03        perf-stat.overall.branch-m=
iss-rate%
>       17.09            -4.0       13.05        perf-stat.overall.cache-mi=
ss-rate%
>        1555           +19.4%       1856        perf-stat.overall.cycles-b=
etween-cache-misses
>        0.69 =C2=B1  4%      -0.1        0.64 =C2=B1  5%  perf-stat.overal=
l.dTLB-load-miss-rate%
>        0.20 =C2=B1  3%      -0.0        0.16 =C2=B1  2%  perf-stat.overal=
l.dTLB-store-miss-rate%
>       86.43            -2.5       83.94        perf-stat.overall.iTLB-loa=
d-miss-rate%
>        1433            +6.7%       1528        perf-stat.overall.instruct=
ions-per-iTLB-miss
>       43.89            +0.7       44.58        perf-stat.overall.node-loa=
d-miss-rate%
>   6.389e+09            +0.8%  6.438e+09        perf-stat.ps.branch-instru=
ctions
>    63452800            +4.2%   66110454        perf-stat.ps.branch-misses
>    65977234           -16.2%   55277568        perf-stat.ps.cache-misses
>   3.861e+08            +9.8%  4.237e+08        perf-stat.ps.cache-referen=
ces
>      723870           +13.5%     821265        perf-stat.ps.context-switc=
hes
>      112209            +8.6%     121881        perf-stat.ps.cpu-migrations
>    49955941 =C2=B1  4%      -7.7%   46094243 =C2=B1  5%  perf-stat.ps.dTL=
B-load-misses
>     4542094 =C2=B1  3%     -22.6%    3514899 =C2=B1  2%  perf-stat.ps.dTL=
B-store-misses
>   2.275e+09            -5.3%  2.154e+09        perf-stat.ps.dTLB-stores
>    19294019            -5.8%   18175580        perf-stat.ps.iTLB-load-mis=
ses
>     3030049           +14.8%    3478314 =C2=B1  4%  perf-stat.ps.iTLB-loa=
ds
>        3089            -5.5%       2918        perf-stat.ps.minor-faults
>    24643655            -9.8%   22235787        perf-stat.ps.node-load-mis=
ses
>    31502901           -12.2%   27645143        perf-stat.ps.node-loads
>    22395376           -20.1%   17895417        perf-stat.ps.node-store-mi=
sses
>    35356897           -19.6%   28413366        perf-stat.ps.node-stores
>        3089            -5.5%       2918        perf-stat.ps.page-faults
>    2.85e+12           +50.6%  4.293e+12        perf-stat.total.instructio=
ns
>       84193 =C2=B1 36%    +135.9%     198575 =C2=B1 25%  sched_debug.cfs_=
rq:/.MIN_vruntime.avg
>      919053           +98.2%    1821460 =C2=B1  2%  sched_debug.cfs_rq:/.=
MIN_vruntime.max
>      256686 =C2=B1 16%    +114.7%     551162 =C2=B1 13%  sched_debug.cfs_=
rq:/.MIN_vruntime.stddev
>       19497          +106.7%      40307        sched_debug.cfs_rq:/.exec_=
clock.avg
>       21240          +101.1%      42717        sched_debug.cfs_rq:/.exec_=
clock.max
>       19079          +107.3%      39542        sched_debug.cfs_rq:/.exec_=
clock.min
>      394.52 =C2=B1  2%     +54.3%     608.79 =C2=B1 13%  sched_debug.cfs_=
rq:/.exec_clock.stddev
>      965.25 =C2=B1 15%     +59.7%       1541 =C2=B1  4%  sched_debug.cfs_=
rq:/.load_avg.avg
>        2866 =C2=B1 21%     +57.1%       4503 =C2=B1 10%  sched_debug.cfs_=
rq:/.load_avg.max
>      659.77 =C2=B1 15%     +68.9%       1114 =C2=B1  9%  sched_debug.cfs_=
rq:/.load_avg.stddev
>       84193 =C2=B1 36%    +135.9%     198575 =C2=B1 25%  sched_debug.cfs_=
rq:/.max_vruntime.avg
>      919053           +98.2%    1821462 =C2=B1  2%  sched_debug.cfs_rq:/.=
max_vruntime.max
>      256686 =C2=B1 16%    +114.7%     551163 =C2=B1 13%  sched_debug.cfs_=
rq:/.max_vruntime.stddev
>      901765           +97.1%    1777741 =C2=B1  2%  sched_debug.cfs_rq:/.=
min_vruntime.avg
>      941794           +95.8%    1844445 =C2=B1  2%  sched_debug.cfs_rq:/.=
min_vruntime.max
>      872925           +96.5%    1715658 =C2=B1  2%  sched_debug.cfs_rq:/.=
min_vruntime.min
>       18358 =C2=B1 44%    +146.6%      45281 =C2=B1 34%  sched_debug.cfs_=
rq:/.min_vruntime.stddev
>        1.22 =C2=B1  8%    +159.9%       3.18 =C2=B1 20%  sched_debug.cfs_=
rq:/.nr_spread_over.avg
>        6.75 =C2=B1 23%     +65.4%      11.17 =C2=B1 17%  sched_debug.cfs_=
rq:/.nr_spread_over.max
>        1.38 =C2=B1 11%     +61.4%       2.22 =C2=B1 12%  sched_debug.cfs_=
rq:/.nr_spread_over.stddev
>       18357 =C2=B1 44%    +146.5%      45250 =C2=B1 34%  sched_debug.cfs_=
rq:/.spread0.stddev
>      773.25 =C2=B1  3%     +13.2%     875.02        sched_debug.cfs_rq:/.=
util_avg.avg
>      285624           -30.3%     199111 =C2=B1  4%  sched_debug.cpu.avg_i=
dle.avg
>      576507 =C2=B1  2%     -26.2%     425271 =C2=B1  7%  sched_debug.cpu.=
avg_idle.max
>       51029 =C2=B1 68%     -83.4%       8469 =C2=B1 29%  sched_debug.cpu.=
avg_idle.min
>      135149 =C2=B1  7%     -23.4%     103460 =C2=B1 10%  sched_debug.cpu.=
avg_idle.stddev
>       57492           +51.0%      86835        sched_debug.cpu.clock.avg
>       57495           +51.0%      86841        sched_debug.cpu.clock.max
>       57487           +51.0%      86828        sched_debug.cpu.clock.min
>        1.98 =C2=B1  4%     +74.8%       3.46 =C2=B1 10%  sched_debug.cpu.=
clock.stddev
>       57492           +51.0%      86835        sched_debug.cpu.clock_task=
.avg
>       57495           +51.0%      86841        sched_debug.cpu.clock_task=
.max
>       57487           +51.0%      86828        sched_debug.cpu.clock_task=
.min
>        1.98 =C2=B1  4%     +74.8%       3.46 =C2=B1 10%  sched_debug.cpu.=
clock_task.stddev
>        2831           +43.0%       4049        sched_debug.cpu.curr->pid.=
max
>      417519          +133.3%     974078        sched_debug.cpu.nr_switche=
s.avg
>      427854          +134.0%    1001016        sched_debug.cpu.nr_switche=
s.max
>      409942          +131.8%     950218        sched_debug.cpu.nr_switche=
s.min
>        4770 =C2=B1 42%    +238.7%      16156 =C2=B1 22%  sched_debug.cpu.=
nr_switches.stddev
>        4.70 =C2=B1 23%     +37.1%       6.44 =C2=B1  4%  sched_debug.cpu.=
nr_uninterruptible.avg
>      776.62 =C2=B1 19%     +86.1%       1445 =C2=B1 12%  sched_debug.cpu.=
nr_uninterruptible.max
>     -472.62           +98.3%    -937.33        sched_debug.cpu.nr_uninter=
ruptible.min
>      289.80 =C2=B1  5%    +109.7%     607.68 =C2=B1  3%  sched_debug.cpu.=
nr_uninterruptible.stddev
>      415893          +133.8%     972526        sched_debug.cpu.sched_coun=
t.avg
>      423960          +135.5%     998457        sched_debug.cpu.sched_coun=
t.max
>      409113          +132.0%     949068        sched_debug.cpu.sched_coun=
t.min
>        4194 =C2=B1 50%    +274.3%      15698 =C2=B1 22%  sched_debug.cpu.=
sched_count.stddev
>      110094          +125.8%     248571        sched_debug.cpu.sched_goid=
le.avg
>      112236          +125.6%     253163        sched_debug.cpu.sched_goid=
le.max
>      108281          +125.8%     244506        sched_debug.cpu.sched_goid=
le.min
>      772.04 =C2=B1 16%    +175.8%       2129 =C2=B1 18%  sched_debug.cpu.=
sched_goidle.stddev
>      297267          +137.2%     705173        sched_debug.cpu.ttwu_count=
.avg
>      320112          +135.9%     755096        sched_debug.cpu.ttwu_count=
.max
>      272487 =C2=B1  2%    +142.2%     660099        sched_debug.cpu.ttwu_=
count.min
>       10662 =C2=B1 10%    +110.9%      22491 =C2=B1 18%  sched_debug.cpu.=
ttwu_count.stddev
>       12295 =C2=B1  2%    +834.9%     114954 =C2=B1  2%  sched_debug.cpu.=
ttwu_local.avg
>       13726 =C2=B1  2%    +769.7%     119376 =C2=B1  2%  sched_debug.cpu.=
ttwu_local.max
>       10620 =C2=B1  4%    +942.4%     110710        sched_debug.cpu.ttwu_=
local.min
>      693.29 =C2=B1 14%    +228.7%       2278 =C2=B1 18%  sched_debug.cpu.=
ttwu_local.stddev
>       57488           +51.0%      86829        sched_debug.cpu_clk
>       56998           +51.5%      86337        sched_debug.ktime
>       57977           +50.6%      87317        sched_debug.sched_clk
>       72.50 =C2=B1 37%     +55.5%     112.75 =C2=B1 26%  interrupts.36:PC=
I-MSI.2621442-edge.eth0-TxRx-1
>       53.25 =C2=B1  2%     +84.5%      98.25 =C2=B1 22%  interrupts.37:PC=
I-MSI.2621443-edge.eth0-TxRx-2
>       73.50 =C2=B1 26%    +116.3%     159.00 =C2=B1 60%  interrupts.38:PC=
I-MSI.2621444-edge.eth0-TxRx-3
>      204541           +49.0%     304702 =C2=B1  2%  interrupts.CPU0.LOC:L=
ocal_timer_interrupts
>      290268 =C2=B1  2%     +29.1%     374641 =C2=B1  4%  interrupts.CPU0.=
RES:Rescheduling_interrupts
>      204580           +48.9%     304667 =C2=B1  2%  interrupts.CPU1.LOC:L=
ocal_timer_interrupts
>      290342 =C2=B1  2%     +28.5%     373110 =C2=B1  4%  interrupts.CPU1.=
RES:Rescheduling_interrupts
>      204537           +48.9%     304619 =C2=B1  2%  interrupts.CPU10.LOC:=
Local_timer_interrupts
>      291605 =C2=B1  2%     +28.3%     374190 =C2=B1  4%  interrupts.CPU10=
.RES:Rescheduling_interrupts
>      204140           +49.2%     304587 =C2=B1  2%  interrupts.CPU11.LOC:=
Local_timer_interrupts
>      291988 =C2=B1  2%     +28.1%     374024 =C2=B1  4%  interrupts.CPU11=
.RES:Rescheduling_interrupts
>      204367           +49.0%     304559 =C2=B1  2%  interrupts.CPU12.LOC:=
Local_timer_interrupts
>      288632           +28.4%     370669 =C2=B1  3%  interrupts.CPU12.RES:=
Rescheduling_interrupts
>      204555           +48.9%     304669 =C2=B1  2%  interrupts.CPU13.LOC:=
Local_timer_interrupts
>      289354 =C2=B1  2%     +28.5%     371782 =C2=B1  3%  interrupts.CPU13=
.RES:Rescheduling_interrupts
>      204536           +49.0%     304726 =C2=B1  2%  interrupts.CPU14.LOC:=
Local_timer_interrupts
>        4937 =C2=B1 25%     +41.6%       6991 =C2=B1  2%  interrupts.CPU14=
.NMI:Non-maskable_interrupts
>        4937 =C2=B1 25%     +41.6%       6991 =C2=B1  2%  interrupts.CPU14=
.PMI:Performance_monitoring_interrupts
>      287759           +28.2%     368986 =C2=B1  3%  interrupts.CPU14.RES:=
Rescheduling_interrupts
>      204527           +49.0%     304707 =C2=B1  2%  interrupts.CPU15.LOC:=
Local_timer_interrupts
>      286950           +28.6%     369104 =C2=B1  3%  interrupts.CPU15.RES:=
Rescheduling_interrupts
>      204556           +49.0%     304718 =C2=B1  2%  interrupts.CPU16.LOC:=
Local_timer_interrupts
>        5444 =C2=B1 32%     -19.9%       4360 =C2=B1 32%  interrupts.CPU16=
.NMI:Non-maskable_interrupts
>        5444 =C2=B1 32%     -19.9%       4360 =C2=B1 32%  interrupts.CPU16=
.PMI:Performance_monitoring_interrupts
>      287623           +28.1%     368583 =C2=B1  3%  interrupts.CPU16.RES:=
Rescheduling_interrupts
>      204528           +49.0%     304728 =C2=B1  2%  interrupts.CPU17.LOC:=
Local_timer_interrupts
>      287734           +28.2%     368920 =C2=B1  3%  interrupts.CPU17.RES:=
Rescheduling_interrupts
>      204465           +49.0%     304707 =C2=B1  2%  interrupts.CPU18.LOC:=
Local_timer_interrupts
>        5382 =C2=B1 31%     -21.8%       4211 =C2=B1 27%  interrupts.CPU18=
.NMI:Non-maskable_interrupts
>        5382 =C2=B1 31%     -21.8%       4211 =C2=B1 27%  interrupts.CPU18=
.PMI:Performance_monitoring_interrupts
>      288778           +28.1%     369871 =C2=B1  3%  interrupts.CPU18.RES:=
Rescheduling_interrupts
>      204302           +49.2%     304727 =C2=B1  2%  interrupts.CPU19.LOC:=
Local_timer_interrupts
>      289794           +27.8%     370247 =C2=B1  3%  interrupts.CPU19.RES:=
Rescheduling_interrupts
>      204552           +49.0%     304821 =C2=B1  2%  interrupts.CPU2.LOC:L=
ocal_timer_interrupts
>      291056 =C2=B1  2%     +28.3%     373290 =C2=B1  4%  interrupts.CPU2.=
RES:Rescheduling_interrupts
>      204468           +48.9%     304484 =C2=B1  2%  interrupts.CPU20.LOC:=
Local_timer_interrupts
>      290778           +27.6%     371106 =C2=B1  3%  interrupts.CPU20.RES:=
Rescheduling_interrupts
>      204546           +48.9%     304619 =C2=B1  2%  interrupts.CPU21.LOC:=
Local_timer_interrupts
>      289974           +28.0%     371074 =C2=B1  3%  interrupts.CPU21.RES:=
Rescheduling_interrupts
>      204694           +48.8%     304581 =C2=B1  2%  interrupts.CPU22.LOC:=
Local_timer_interrupts
>      290312           +28.0%     371734 =C2=B1  3%  interrupts.CPU22.RES:=
Rescheduling_interrupts
>      204374           +49.0%     304493 =C2=B1  2%  interrupts.CPU23.LOC:=
Local_timer_interrupts
>      290266           +28.5%     372865 =C2=B1  3%  interrupts.CPU23.RES:=
Rescheduling_interrupts
>      204518           +49.0%     304653 =C2=B1  2%  interrupts.CPU24.LOC:=
Local_timer_interrupts
>      288815 =C2=B1  2%     +28.7%     371621 =C2=B1  4%  interrupts.CPU24=
.RES:Rescheduling_interrupts
>      204414           +49.0%     304640 =C2=B1  2%  interrupts.CPU25.LOC:=
Local_timer_interrupts
>      288779 =C2=B1  2%     +28.2%     370202 =C2=B1  4%  interrupts.CPU25=
.RES:Rescheduling_interrupts
>      204536           +49.0%     304730 =C2=B1  2%  interrupts.CPU26.LOC:=
Local_timer_interrupts
>      287615 =C2=B1  2%     +28.6%     369843 =C2=B1  4%  interrupts.CPU26=
.RES:Rescheduling_interrupts
>       72.50 =C2=B1 37%     +55.5%     112.75 =C2=B1 26%  interrupts.CPU27=
.36:PCI-MSI.2621442-edge.eth0-TxRx-1
>      204514           +49.0%     304668 =C2=B1  2%  interrupts.CPU27.LOC:=
Local_timer_interrupts
>      287014 =C2=B1  2%     +28.5%     368825 =C2=B1  4%  interrupts.CPU27=
.RES:Rescheduling_interrupts
>       53.25 =C2=B1  2%     +84.5%      98.25 =C2=B1 22%  interrupts.CPU28=
.37:PCI-MSI.2621443-edge.eth0-TxRx-2
>      204331           +49.1%     304759 =C2=B1  2%  interrupts.CPU28.LOC:=
Local_timer_interrupts
>      287278 =C2=B1  2%     +28.4%     368876 =C2=B1  4%  interrupts.CPU28=
.RES:Rescheduling_interrupts
>       73.50 =C2=B1 26%    +116.3%     159.00 =C2=B1 60%  interrupts.CPU29=
.38:PCI-MSI.2621444-edge.eth0-TxRx-3
>      204427           +49.0%     304651 =C2=B1  2%  interrupts.CPU29.LOC:=
Local_timer_interrupts
>      287382 =C2=B1  2%     +28.9%     370434 =C2=B1  4%  interrupts.CPU29=
.RES:Rescheduling_interrupts
>      204538           +49.0%     304765 =C2=B1  2%  interrupts.CPU3.LOC:L=
ocal_timer_interrupts
>        5034 =C2=B1 27%     -29.4%       3552        interrupts.CPU3.NMI:N=
on-maskable_interrupts
>        5034 =C2=B1 27%     -29.4%       3552        interrupts.CPU3.PMI:P=
erformance_monitoring_interrupts
>      288881 =C2=B1  2%     +28.3%     370740 =C2=B1  4%  interrupts.CPU3.=
RES:Rescheduling_interrupts
>      204750           +48.8%     304674 =C2=B1  2%  interrupts.CPU30.LOC:=
Local_timer_interrupts
>      287139 =C2=B1  2%     +28.8%     369825 =C2=B1  4%  interrupts.CPU30=
.RES:Rescheduling_interrupts
>      204429           +48.9%     304416 =C2=B1  2%  interrupts.CPU31.LOC:=
Local_timer_interrupts
>      288411 =C2=B1  2%     +28.4%     370199 =C2=B1  4%  interrupts.CPU31=
.RES:Rescheduling_interrupts
>      204395           +49.3%     305106 =C2=B1  2%  interrupts.CPU32.LOC:=
Local_timer_interrupts
>      289178 =C2=B1  2%     +28.6%     371830 =C2=B1  4%  interrupts.CPU32=
.RES:Rescheduling_interrupts
>      204347           +49.2%     304799 =C2=B1  2%  interrupts.CPU33.LOC:=
Local_timer_interrupts
>      289689 =C2=B1  2%     +28.2%     371280 =C2=B1  4%  interrupts.CPU33=
.RES:Rescheduling_interrupts
>      204280           +49.1%     304566 =C2=B1  2%  interrupts.CPU34.LOC:=
Local_timer_interrupts
>        6418 =C2=B1 24%     -44.5%       3564        interrupts.CPU34.NMI:=
Non-maskable_interrupts
>        6418 =C2=B1 24%     -44.5%       3564        interrupts.CPU34.PMI:=
Performance_monitoring_interrupts
>      290382 =C2=B1  2%     +28.3%     372606 =C2=B1  4%  interrupts.CPU34=
.RES:Rescheduling_interrupts
>      204331           +49.0%     304517 =C2=B1  2%  interrupts.CPU35.LOC:=
Local_timer_interrupts
>      289736 =C2=B1  2%     +28.3%     371869 =C2=B1  4%  interrupts.CPU35=
.RES:Rescheduling_interrupts
>      204578           +48.8%     304423 =C2=B1  2%  interrupts.CPU36.LOC:=
Local_timer_interrupts
>        7298           -39.0%       4450 =C2=B1 34%  interrupts.CPU36.NMI:=
Non-maskable_interrupts
>        7298           -39.0%       4450 =C2=B1 34%  interrupts.CPU36.PMI:=
Performance_monitoring_interrupts
>      287187           +28.3%     368516 =C2=B1  3%  interrupts.CPU36.RES:=
Rescheduling_interrupts
>      204538           +49.0%     304729 =C2=B1  2%  interrupts.CPU37.LOC:=
Local_timer_interrupts
>      288676           +28.1%     369792 =C2=B1  3%  interrupts.CPU37.RES:=
Rescheduling_interrupts
>      204504           +49.0%     304687 =C2=B1  2%  interrupts.CPU38.LOC:=
Local_timer_interrupts
>        6301 =C2=B1 24%     -29.8%       4424 =C2=B1 34%  interrupts.CPU38=
.NMI:Non-maskable_interrupts
>        6301 =C2=B1 24%     -29.8%       4424 =C2=B1 34%  interrupts.CPU38=
.PMI:Performance_monitoring_interrupts
>      287510           +28.1%     368349 =C2=B1  3%  interrupts.CPU38.RES:=
Rescheduling_interrupts
>      204566           +48.9%     304668 =C2=B1  2%  interrupts.CPU39.LOC:=
Local_timer_interrupts
>      286909           +28.1%     367622 =C2=B1  3%  interrupts.CPU39.RES:=
Rescheduling_interrupts
>      204445           +49.0%     304686 =C2=B1  2%  interrupts.CPU4.LOC:L=
ocal_timer_interrupts
>      288608 =C2=B1  2%     +28.7%     371493 =C2=B1  3%  interrupts.CPU4.=
RES:Rescheduling_interrupts
>      204538           +48.9%     304582 =C2=B1  2%  interrupts.CPU40.LOC:=
Local_timer_interrupts
>      286219           +27.9%     365983 =C2=B1  3%  interrupts.CPU40.RES:=
Rescheduling_interrupts
>      204551           +49.0%     304739 =C2=B1  2%  interrupts.CPU41.LOC:=
Local_timer_interrupts
>        5170 =C2=B1 29%     -18.5%       4215 =C2=B1 27%  interrupts.CPU41=
.NMI:Non-maskable_interrupts
>        5170 =C2=B1 29%     -18.5%       4215 =C2=B1 27%  interrupts.CPU41=
.PMI:Performance_monitoring_interrupts
>      286946           +27.8%     366717 =C2=B1  3%  interrupts.CPU41.RES:=
Rescheduling_interrupts
>      204492           +48.9%     304442 =C2=B1  2%  interrupts.CPU42.LOC:=
Local_timer_interrupts
>      287384           +28.0%     367805 =C2=B1  3%  interrupts.CPU42.RES:=
Rescheduling_interrupts
>      204545           +49.0%     304679 =C2=B1  2%  interrupts.CPU43.LOC:=
Local_timer_interrupts
>      289100           +27.3%     368059 =C2=B1  3%  interrupts.CPU43.RES:=
Rescheduling_interrupts
>      204489           +49.0%     304635 =C2=B1  2%  interrupts.CPU44.LOC:=
Local_timer_interrupts
>        6393 =C2=B1 24%     -32.4%       4319 =C2=B1 31%  interrupts.CPU44=
.NMI:Non-maskable_interrupts
>        6393 =C2=B1 24%     -32.4%       4319 =C2=B1 31%  interrupts.CPU44=
.PMI:Performance_monitoring_interrupts
>      288835           +27.8%     369182 =C2=B1  3%  interrupts.CPU44.RES:=
Rescheduling_interrupts
>      204473           +49.2%     304983 =C2=B1  2%  interrupts.CPU45.LOC:=
Local_timer_interrupts
>      289778           +27.4%     369059 =C2=B1  3%  interrupts.CPU45.RES:=
Rescheduling_interrupts
>      204493           +49.0%     304598 =C2=B1  2%  interrupts.CPU46.LOC:=
Local_timer_interrupts
>      289485           +27.9%     370172 =C2=B1  3%  interrupts.CPU46.RES:=
Rescheduling_interrupts
>      204511           +49.2%     305090 =C2=B1  2%  interrupts.CPU47.LOC:=
Local_timer_interrupts
>      286611           +28.8%     369021 =C2=B1  3%  interrupts.CPU47.RES:=
Rescheduling_interrupts
>      204441           +49.1%     304794 =C2=B1  2%  interrupts.CPU5.LOC:L=
ocal_timer_interrupts
>      289245 =C2=B1  2%     +28.4%     371335 =C2=B1  4%  interrupts.CPU5.=
RES:Rescheduling_interrupts
>      204246           +49.0%     304414 =C2=B1  2%  interrupts.CPU6.LOC:L=
ocal_timer_interrupts
>      290006 =C2=B1  2%     +28.3%     372180 =C2=B1  4%  interrupts.CPU6.=
RES:Rescheduling_interrupts
>      204445           +49.0%     304719 =C2=B1  2%  interrupts.CPU7.LOC:L=
ocal_timer_interrupts
>      290524 =C2=B1  2%     +28.2%     372414 =C2=B1  4%  interrupts.CPU7.=
RES:Rescheduling_interrupts
>      204178           +49.2%     304663 =C2=B1  2%  interrupts.CPU8.LOC:L=
ocal_timer_interrupts
>      291625 =C2=B1  2%     +27.8%     372747 =C2=B1  4%  interrupts.CPU8.=
RES:Rescheduling_interrupts
>      204502           +48.9%     304407 =C2=B1  3%  interrupts.CPU9.LOC:L=
ocal_timer_interrupts
>      291615 =C2=B1  2%     +27.9%     373024 =C2=B1  4%  interrupts.CPU9.=
RES:Rescheduling_interrupts
>     9814627           +49.0%   14624016 =C2=B1  2%  interrupts.LOC:Local_=
timer_interrupts
>    13869791           +28.2%   17785831 =C2=B1  3%  interrupts.RES:Resche=
duling_interrupts
>       25728           +47.6%      37969        softirqs.CPU0.RCU
>       34944           +41.7%      49503 =C2=B1  3%  softirqs.CPU0.SCHED
>       42375           +38.5%      58673 =C2=B1  2%  softirqs.CPU0.TIMER
>       25348           +53.8%      38976 =C2=B1  5%  softirqs.CPU1.RCU
>       30986           +46.2%      45315 =C2=B1  3%  softirqs.CPU1.SCHED
>       41265           +44.3%      59538 =C2=B1  3%  softirqs.CPU1.TIMER
>       25149           +48.3%      37288        softirqs.CPU10.RCU
>       29752           +47.1%      43764 =C2=B1  2%  softirqs.CPU10.SCHED
>       40609           +41.5%      57449        softirqs.CPU10.TIMER
>       25218           +48.3%      37399        softirqs.CPU11.RCU
>       30294           +44.6%      43800        softirqs.CPU11.SCHED
>       41371           +39.2%      57578        softirqs.CPU11.TIMER
>       24427           +48.9%      36361        softirqs.CPU12.RCU
>       30438           +44.0%      43835        softirqs.CPU12.SCHED
>       41045 =C2=B1  3%     +43.0%      58687        softirqs.CPU12.TIMER
>       24247           +47.0%      35645        softirqs.CPU13.RCU
>       30155           +44.5%      43577        softirqs.CPU13.SCHED
>       41148 =C2=B1  2%     +40.3%      57720        softirqs.CPU13.TIMER
>       24506           +46.3%      35856        softirqs.CPU14.RCU
>       29991           +44.1%      43229        softirqs.CPU14.SCHED
>       41190 =C2=B1  2%     +39.7%      57552        softirqs.CPU14.TIMER
>       24412           +46.7%      35800        softirqs.CPU15.RCU
>       30135           +44.1%      43430        softirqs.CPU15.SCHED
>       45081 =C2=B1 15%     +28.0%      57684        softirqs.CPU15.TIMER
>       25327           +47.0%      37225        softirqs.CPU16.RCU
>       30230           +43.8%      43461        softirqs.CPU16.SCHED
>       41157           +39.6%      57448        softirqs.CPU16.TIMER
>       25136           +47.8%      37142        softirqs.CPU17.RCU
>       29894           +44.5%      43212        softirqs.CPU17.SCHED
>       41961 =C2=B1  5%     +36.5%      57281        softirqs.CPU17.TIMER
>       25431           +46.1%      37160        softirqs.CPU18.RCU
>       30062           +44.0%      43281        softirqs.CPU18.SCHED
>       40956 =C2=B1  2%     +42.1%      58217        softirqs.CPU18.TIMER
>       25496           +44.8%      36923 =C2=B1  2%  softirqs.CPU19.RCU
>       29989           +46.5%      43946        softirqs.CPU19.SCHED
>       41740 =C2=B1  2%     +67.8%      70057 =C2=B1 17%  softirqs.CPU19.T=
IMER
>       25414           +48.3%      37678        softirqs.CPU2.RCU
>       30905           +43.4%      44309 =C2=B1  2%  softirqs.CPU2.SCHED
>       41083           +40.6%      57768 =C2=B1  2%  softirqs.CPU2.TIMER
>       25124           +46.8%      36892        softirqs.CPU20.RCU
>       30001           +44.7%      43416        softirqs.CPU20.SCHED
>       41060 =C2=B1  7%     +39.2%      57151        softirqs.CPU20.TIMER
>       24992           +47.6%      36896        softirqs.CPU21.RCU
>       30109           +44.4%      43467        softirqs.CPU21.SCHED
>       40055 =C2=B1  3%     +42.5%      57081 =C2=B1  2%  softirqs.CPU21.T=
IMER
>       25072           +46.2%      36656        softirqs.CPU22.RCU
>       30296           +43.3%      43425        softirqs.CPU22.SCHED
>       24882           +48.8%      37031        softirqs.CPU23.RCU
>       29900           +43.7%      42971        softirqs.CPU23.SCHED
>       40388 =C2=B1  3%     +44.8%      58494 =C2=B1  3%  softirqs.CPU23.T=
IMER
>       25007           +48.1%      37036        softirqs.CPU24.RCU
>       29755           +45.9%      43399        softirqs.CPU24.SCHED
>       40786           +40.6%      57353        softirqs.CPU24.TIMER
>       25031           +47.3%      36875        softirqs.CPU25.RCU
>       29841 =C2=B1  2%     +45.3%      43355        softirqs.CPU25.SCHED
>       40971           +39.8%      57266        softirqs.CPU25.TIMER
>       25145           +47.6%      37114        softirqs.CPU26.RCU
>       29462 =C2=B1  2%     +48.5%      43739 =C2=B1  2%  softirqs.CPU26.S=
CHED
>       40553           +41.8%      57521        softirqs.CPU26.TIMER
>       25184           +47.6%      37169        softirqs.CPU27.RCU
>       29867           +45.5%      43450 =C2=B1  3%  softirqs.CPU27.SCHED
>       41118           +39.3%      57261        softirqs.CPU27.TIMER
>       25452           +47.1%      37440        softirqs.CPU28.RCU
>       29714           +46.2%      43440 =C2=B1  2%  softirqs.CPU28.SCHED
>       41209 =C2=B1  2%     +37.8%      56783 =C2=B1  2%  softirqs.CPU28.T=
IMER
>       25334           +48.8%      37696 =C2=B1  2%  softirqs.CPU29.RCU
>       29894           +46.3%      43749        softirqs.CPU29.SCHED
>       41413 =C2=B1  2%     +43.3%      59346 =C2=B1  5%  softirqs.CPU29.T=
IMER
>       25514           +47.0%      37495        softirqs.CPU3.RCU
>       30016           +46.0%      43831 =C2=B1  2%  softirqs.CPU3.SCHED
>       41371 =C2=B1  2%     +39.3%      57611        softirqs.CPU3.TIMER
>       25206           +47.4%      37149        softirqs.CPU30.RCU
>       30167           +44.0%      43451 =C2=B1  2%  softirqs.CPU30.SCHED
>       41166 =C2=B1  2%     +58.1%      65092 =C2=B1 19%  softirqs.CPU30.T=
IMER
>       25211           +46.8%      37016        softirqs.CPU31.RCU
>       30004 =C2=B1  2%     +45.2%      43569        softirqs.CPU31.SCHED
>       41541 =C2=B1  2%     +36.9%      56874        softirqs.CPU31.TIMER
>       24432           +46.9%      35885        softirqs.CPU32.RCU
>       30206           +43.4%      43322 =C2=B1  2%  softirqs.CPU32.SCHED
>       41069           +40.7%      57781 =C2=B1  2%  softirqs.CPU32.TIMER
>       24303           +48.0%      35973        softirqs.CPU33.RCU
>       30238           +43.8%      43489        softirqs.CPU33.SCHED
>       41161           +38.2%      56872        softirqs.CPU33.TIMER
>       24308           +47.6%      35876        softirqs.CPU34.RCU
>       29803           +46.5%      43647 =C2=B1  2%  softirqs.CPU34.SCHED
>       40809           +39.2%      56817        softirqs.CPU34.TIMER
>       24291           +47.7%      35877        softirqs.CPU35.RCU
>       30092           +44.2%      43386        softirqs.CPU35.SCHED
>       40607           +41.5%      57480 =C2=B1  2%  softirqs.CPU35.TIMER
>       25605           +49.5%      38286        softirqs.CPU36.RCU
>       29900           +44.6%      43238        softirqs.CPU36.SCHED
>       45207 =C2=B1 15%     +27.4%      57602        softirqs.CPU36.TIMER
>       25555 =C2=B1  2%     +49.0%      38070        softirqs.CPU37.RCU
>       29926           +45.2%      43460        softirqs.CPU37.SCHED
>       42619 =C2=B1  8%     +36.7%      58242        softirqs.CPU37.TIMER
>       27683 =C2=B1  9%     +50.2%      41577 =C2=B1  4%  softirqs.CPU38.R=
CU
>       29700           +45.6%      43230        softirqs.CPU38.SCHED
>       41779 =C2=B1  4%     +43.5%      59948        softirqs.CPU38.TIMER
>       26699 =C2=B1  7%     +42.1%      37951        softirqs.CPU39.RCU
>       30061           +43.4%      43102        softirqs.CPU39.SCHED
>       42312 =C2=B1  5%     +36.1%      57581 =C2=B1  2%  softirqs.CPU39.T=
IMER
>       25219           +47.7%      37247        softirqs.CPU4.RCU
>       30363 =C2=B1  3%     +45.9%      44295        softirqs.CPU4.SCHED
>       41108 =C2=B1  2%     +39.6%      57371 =C2=B1  2%  softirqs.CPU4.TI=
MER
>       25413           +50.6%      38268        softirqs.CPU40.RCU
>       29910           +46.0%      43665        softirqs.CPU40.SCHED
>       39987 =C2=B1  2%     +45.9%      58322        softirqs.CPU40.TIMER
>       25569           +49.5%      38238        softirqs.CPU41.RCU
>       29867           +44.8%      43247        softirqs.CPU41.SCHED
>       25492           +49.8%      38185        softirqs.CPU42.RCU
>       29871           +45.4%      43440        softirqs.CPU42.SCHED
>       40076           +44.8%      58020        softirqs.CPU42.TIMER
>       25281           +48.9%      37640        softirqs.CPU43.RCU
>       30025           +43.9%      43220        softirqs.CPU43.SCHED
>       40222 =C2=B1  3%     +44.7%      58195        softirqs.CPU43.TIMER
>       25183           +49.3%      37611        softirqs.CPU44.RCU
>       30123           +43.6%      43249        softirqs.CPU44.SCHED
>       41090 =C2=B1  6%     +42.5%      58537        softirqs.CPU44.TIMER
>       25314           +49.6%      37863        softirqs.CPU45.RCU
>       29998           +43.2%      42957        softirqs.CPU45.SCHED
>       39705 =C2=B1  3%     +43.6%      57033        softirqs.CPU45.TIMER
>       25500           +46.2%      37274        softirqs.CPU46.RCU
>       29921           +44.7%      43286        softirqs.CPU46.SCHED
>       41088 =C2=B1  5%     +39.9%      57463 =C2=B1  3%  softirqs.CPU46.T=
IMER
>       25564           +48.4%      37931        softirqs.CPU47.RCU
>       30178           +42.4%      42980        softirqs.CPU47.SCHED
>       40738 =C2=B1  4%     +42.2%      57939 =C2=B1  3%  softirqs.CPU47.T=
IMER
>       26467 =C2=B1  8%     +40.8%      37278        softirqs.CPU5.RCU
>       30334 =C2=B1  2%     +44.1%      43714        softirqs.CPU5.SCHED
>       42268 =C2=B1  4%     +35.8%      57394        softirqs.CPU5.TIMER
>       25343           +47.0%      37245        softirqs.CPU6.RCU
>       30100           +45.0%      43643 =C2=B1  2%  softirqs.CPU6.SCHED
>       41270           +43.6%      59249 =C2=B1  5%  softirqs.CPU6.TIMER
>       25331           +47.7%      37418        softirqs.CPU7.RCU
>       30210           +44.7%      43727 =C2=B1  2%  softirqs.CPU7.SCHED
>       41028           +41.9%      58206 =C2=B1  2%  softirqs.CPU7.TIMER
>       25483           +47.2%      37514        softirqs.CPU8.RCU
>       30324 =C2=B1  2%     +43.4%      43483 =C2=B1  2%  softirqs.CPU8.SC=
HED
>       41027           +40.4%      57591 =C2=B1  2%  softirqs.CPU8.TIMER
>       25546           +47.5%      37687        softirqs.CPU9.RCU
>       30218           +44.8%      43771 =C2=B1  2%  softirqs.CPU9.SCHED
>       41193           +40.1%      57716 =C2=B1  2%  softirqs.CPU9.TIMER
>     1212606           +47.7%    1790808        softirqs.RCU
>     1448198           +44.7%    2095500        softirqs.SCHED
>     1990064           +40.7%    2800202        softirqs.TIMER
>        8.56 =C2=B1  3%      -4.3        4.25        perf-profile.calltrac=
e.cycles-pp.__filemap_fdatawrite_range.file_write_and_wait_range.xfs_file_f=
sync.xfs_file_buffered_aio_write.new_sync_write
>        8.50 =C2=B1  3%      -4.3        4.20        perf-profile.calltrac=
e.cycles-pp.do_writepages.__filemap_fdatawrite_range.file_write_and_wait_ra=
nge.xfs_file_fsync.xfs_file_buffered_aio_write
>        8.47 =C2=B1  3%      -4.3        4.17        perf-profile.calltrac=
e.cycles-pp.xfs_vm_writepages.do_writepages.__filemap_fdatawrite_range.file=
_write_and_wait_range.xfs_file_fsync
>       78.55            -4.1       74.44        perf-profile.calltrace.cyc=
les-pp.write
>        8.74 =C2=B1  3%      -4.0        4.70        perf-profile.calltrac=
e.cycles-pp.file_write_and_wait_range.xfs_file_fsync.xfs_file_buffered_aio_=
write.new_sync_write.vfs_write
>       77.69            -3.9       73.75        perf-profile.calltrace.cyc=
les-pp.entry_SYSCALL_64_after_hwframe.write
>       77.64            -3.9       73.71        perf-profile.calltrace.cyc=
les-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>       77.13            -3.8       73.36        perf-profile.calltrace.cyc=
les-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>       77.08            -3.8       73.31        perf-profile.calltrace.cyc=
les-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.wr=
ite
>       76.61            -3.7       72.96        perf-profile.calltrace.cyc=
les-pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe
>       76.43            -3.6       72.80        perf-profile.calltrace.cyc=
les-pp.xfs_file_buffered_aio_write.new_sync_write.vfs_write.ksys_write.do_s=
yscall_64
>       69.22            -2.6       66.62        perf-profile.calltrace.cyc=
les-pp.xfs_file_fsync.xfs_file_buffered_aio_write.new_sync_write.vfs_write.=
ksys_write
>        4.70 =C2=B1  2%      -2.2        2.50        perf-profile.calltrac=
e.cycles-pp.iomap_submit_ioend.xfs_vm_writepages.do_writepages.__filemap_fd=
atawrite_range.file_write_and_wait_range
>        4.63 =C2=B1  2%      -2.2        2.45        perf-profile.calltrac=
e.cycles-pp.submit_bio.iomap_submit_ioend.xfs_vm_writepages.do_writepages._=
_filemap_fdatawrite_range
>        4.60 =C2=B1  2%      -2.2        2.43        perf-profile.calltrac=
e.cycles-pp.generic_make_request.submit_bio.iomap_submit_ioend.xfs_vm_write=
pages.do_writepages
>        4.32 =C2=B1  2%      -2.1        2.22        perf-profile.calltrac=
e.cycles-pp.brd_make_request.generic_make_request.submit_bio.iomap_submit_i=
oend.xfs_vm_writepages
>        3.72 =C2=B1  4%      -2.1        1.63        perf-profile.calltrac=
e.cycles-pp.iomap_writepages.xfs_vm_writepages.do_writepages.__filemap_fdat=
awrite_range.file_write_and_wait_range
>        3.71 =C2=B1  4%      -2.1        1.62        perf-profile.calltrac=
e.cycles-pp.write_cache_pages.iomap_writepages.xfs_vm_writepages.do_writepa=
ges.__filemap_fdatawrite_range
>        2.63 =C2=B1  4%      -2.0        0.63 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.iomap_finish_ioend.brd_make_request.generic_make_request.s=
ubmit_bio.iomap_submit_ioend
>        7.72            -2.0        5.74 =C2=B1  2%  perf-profile.calltrac=
e.cycles-pp.__flush_work.xlog_cil_force_lsn.xfs_log_force_lsn.xfs_file_fsyn=
c.xfs_file_buffered_aio_write
>        3.08 =C2=B1  5%      -1.9        1.13        perf-profile.calltrac=
e.cycles-pp.iomap_writepage_map.write_cache_pages.iomap_writepages.xfs_vm_w=
ritepages.do_writepages
>        2.49 =C2=B1  5%      -1.9        0.55 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.end_page_writeback.iomap_finish_ioend.brd_make_request.gen=
eric_make_request.submit_bio
>        2.48 =C2=B1  5%      -1.9        0.55 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.test_clear_page_writeback.end_page_writeback.iomap_finish_=
ioend.brd_make_request.generic_make_request
>        2.41 =C2=B1  6%      -1.8        0.61 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.__test_set_page_writeback.iomap_writepage_map.write_cache_=
pages.iomap_writepages.xfs_vm_writepages
>        4.90            -1.5        3.40 =C2=B1  3%  perf-profile.calltrac=
e.cycles-pp._raw_spin_lock_irq.__flush_work.xlog_cil_force_lsn.xfs_log_forc=
e_lsn.xfs_file_fsync
>        4.78            -1.5        3.30 =C2=B1  3%  perf-profile.calltrac=
e.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__flush_wor=
k.xlog_cil_force_lsn.xfs_log_force_lsn
>        2.35            -0.6        1.77 =C2=B1  2%  perf-profile.calltrac=
e.cycles-pp.iomap_apply.iomap_file_buffered_write.xfs_file_buffered_aio_wri=
te.new_sync_write.vfs_write
>        2.36            -0.6        1.79        perf-profile.calltrace.cyc=
les-pp.iomap_file_buffered_write.xfs_file_buffered_aio_write.new_sync_write=
.vfs_write.ksys_write
>        3.40            -0.5        2.87 =C2=B1  6%  perf-profile.calltrac=
e.cycles-pp.__xfs_trans_commit.xfs_vn_update_time.file_update_time.xfs_file=
_aio_write_checks.xfs_file_buffered_aio_write
>        1.83            -0.5        1.33 =C2=B1  2%  perf-profile.calltrac=
e.cycles-pp.iomap_write_actor.iomap_apply.iomap_file_buffered_write.xfs_fil=
e_buffered_aio_write.new_sync_write
>        3.26            -0.5        2.75 =C2=B1  6%  perf-profile.calltrac=
e.cycles-pp.xfs_log_commit_cil.__xfs_trans_commit.xfs_vn_update_time.file_u=
pdate_time.xfs_file_aio_write_checks
>        2.85            -0.4        2.40        perf-profile.calltrace.cyc=
les-pp.complete.process_one_work.worker_thread.kthread.ret_from_fork
>        2.79            -0.4        2.34        perf-profile.calltrace.cyc=
les-pp.try_to_wake_up.swake_up_locked.complete.process_one_work.worker_thre=
ad
>        2.83            -0.4        2.38        perf-profile.calltrace.cyc=
les-pp.swake_up_locked.complete.process_one_work.worker_thread.kthread
>        1.48            -0.4        1.05 =C2=B1  2%  perf-profile.calltrac=
e.cycles-pp.brd_do_bvec.brd_make_request.generic_make_request.submit_bio.io=
map_submit_ioend
>        0.61 =C2=B1  2%      -0.4        0.26 =C2=B1100%  perf-profile.cal=
ltrace.cycles-pp.sched_ttwu_pending.scheduler_ipi.reschedule_interrupt.nati=
ve_queued_spin_lock_slowpath._raw_spin_lock
>        1.89            -0.3        1.54        perf-profile.calltrace.cyc=
les-pp.wait_for_completion.__flush_work.xlog_cil_force_lsn.xfs_log_force_ls=
n.xfs_file_fsync
>        1.71            -0.3        1.38        perf-profile.calltrace.cyc=
les-pp.schedule_timeout.wait_for_completion.__flush_work.xlog_cil_force_lsn=
.xfs_log_force_lsn
>        1.65            -0.3        1.34        perf-profile.calltrace.cyc=
les-pp.schedule.schedule_timeout.wait_for_completion.__flush_work.xlog_cil_=
force_lsn
>        0.69            -0.3        0.38 =C2=B1 57%  perf-profile.calltrac=
e.cycles-pp.iomap_write_begin.iomap_write_actor.iomap_apply.iomap_file_buff=
ered_write.xfs_file_buffered_aio_write
>        1.59            -0.3        1.29        perf-profile.calltrace.cyc=
les-pp.__sched_text_start.schedule.schedule_timeout.wait_for_completion.__f=
lush_work
>        0.86            -0.3        0.58 =C2=B1  2%  perf-profile.calltrac=
e.cycles-pp.rwsem_down_read_slowpath.xfs_log_commit_cil.__xfs_trans_commit.=
xfs_vn_update_time.file_update_time
>        1.52            -0.3        1.26 =C2=B1  3%  perf-profile.calltrac=
e.cycles-pp.xlog_cil_insert_items.xfs_log_commit_cil.__xfs_trans_commit.xfs=
_vn_update_time.file_update_time
>        1.75            -0.2        1.50 =C2=B1  2%  perf-profile.calltrac=
e.cycles-pp.ttwu_do_activate.try_to_wake_up.swake_up_locked.complete.proces=
s_one_work
>        1.74            -0.2        1.49 =C2=B1  2%  perf-profile.calltrac=
e.cycles-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up=
.swake_up_locked
>        1.74            -0.2        1.50 =C2=B1  2%  perf-profile.calltrac=
e.cycles-pp.activate_task.ttwu_do_activate.try_to_wake_up.swake_up_locked.c=
omplete
>        2.15            -0.2        1.94        perf-profile.calltrace.cyc=
les-pp.__account_scheduler_latency.enqueue_entity.enqueue_task_fair.activat=
e_task.ttwu_do_activate
>        0.79 =C2=B1  3%      -0.2        0.60 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp._raw_spin_lock.xlog_cil_insert_items.xfs_log_commit_cil.__=
xfs_trans_commit.xfs_vn_update_time
>        1.81            -0.2        1.62        perf-profile.calltrace.cyc=
les-pp.arch_stack_walk.stack_trace_save_tsk.__account_scheduler_latency.enq=
ueue_entity.enqueue_task_fair
>        1.87            -0.2        1.68        perf-profile.calltrace.cyc=
les-pp.stack_trace_save_tsk.__account_scheduler_latency.enqueue_entity.enqu=
eue_task_fair.activate_task
>        0.70 =C2=B1  4%      -0.2        0.54 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.xlog_cil_i=
nsert_items.xfs_log_commit_cil.__xfs_trans_commit
>        0.81            -0.1        0.68        perf-profile.calltrace.cyc=
les-pp.unwind_next_frame.arch_stack_walk.stack_trace_save_tsk.__account_sch=
eduler_latency.enqueue_entity
>        0.65 =C2=B1  2%      -0.1        0.55 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.reschedule_interrupt.native_queued_spin_lock_slowpath._raw=
_spin_lock.xlog_cil_force_lsn.xfs_log_force_lsn
>        0.62 =C2=B1  2%      -0.1        0.52 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.scheduler_ipi.reschedule_interrupt.native_queued_spin_lock=
_slowpath._raw_spin_lock.xlog_cil_force_lsn
>        1.18            -0.0        1.16        perf-profile.calltrace.cyc=
les-pp.sched_ttwu_pending.do_idle.cpu_startup_entry.start_secondary.seconda=
ry_startup_64
>        1.01            -0.0        0.99        perf-profile.calltrace.cyc=
les-pp.activate_task.ttwu_do_activate.sched_ttwu_pending.do_idle.cpu_startu=
p_entry
>        1.00            -0.0        0.98        perf-profile.calltrace.cyc=
les-pp.enqueue_task_fair.activate_task.ttwu_do_activate.sched_ttwu_pending.=
do_idle
>        0.96            -0.0        0.93        perf-profile.calltrace.cyc=
les-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.sche=
d_ttwu_pending
>        1.01            -0.0        0.99        perf-profile.calltrace.cyc=
les-pp.ttwu_do_activate.sched_ttwu_pending.do_idle.cpu_startup_entry.start_=
secondary
>        0.59 =C2=B1  3%      +0.1        0.68        perf-profile.calltrac=
e.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.seconda=
ry_startup_64
>        0.58 =C2=B1  3%      +0.1        0.67        perf-profile.calltrac=
e.cycles-pp.__sched_text_start.schedule_idle.do_idle.cpu_startup_entry.star=
t_secondary
>        0.53            +0.1        0.63 =C2=B1  3%  perf-profile.calltrac=
e.cycles-pp.try_to_wake_up.__wake_up_common.__wake_up_common_lock.xlog_cil_=
push_work.process_one_work
>        0.91 =C2=B1  3%      +0.1        1.02 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.xlog_write.xlog_cil_push_work.process_one_work.worker_thre=
ad.kthread
>        0.54            +0.1        0.65 =C2=B1  3%  perf-profile.calltrac=
e.cycles-pp.__wake_up_common.__wake_up_common_lock.xlog_cil_push_work.proce=
ss_one_work.worker_thread
>        0.57            +0.1        0.69 =C2=B1  3%  perf-profile.calltrac=
e.cycles-pp.__wake_up_common_lock.xlog_cil_push_work.process_one_work.worke=
r_thread.kthread
>        1.83            +0.2        1.99        perf-profile.calltrace.cyc=
les-pp.xlog_cil_push_work.process_one_work.worker_thread.kthread.ret_from_f=
ork
>        0.00            +0.6        0.57 =C2=B1  2%  perf-profile.calltrac=
e.cycles-pp.activate_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_f=
unction.__wake_up_common
>        0.00            +0.6        0.57 =C2=B1  2%  perf-profile.calltrac=
e.cycles-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up=
.autoremove_wake_function
>        0.00            +0.6        0.57 =C2=B1  2%  perf-profile.calltrac=
e.cycles-pp.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake=
_up_common.wake_up_page_bit
>        0.00            +0.7        0.70 =C2=B1  2%  perf-profile.calltrac=
e.cycles-pp.xfs_bmap_add_extent_unwritten_real.xfs_bmapi_convert_unwritten.=
xfs_bmapi_write.xfs_iomap_write_unwritten.xfs_end_ioend
>        0.00            +0.8        0.75 =C2=B1  4%  perf-profile.calltrac=
e.cycles-pp.xfs_bmapi_convert_unwritten.xfs_bmapi_write.xfs_iomap_write_unw=
ritten.xfs_end_ioend.xfs_end_io
>        0.00            +0.8        0.80        perf-profile.calltrace.cyc=
les-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.wake_up_pag=
e_bit.iomap_finish_ioend
>        0.00            +0.8        0.80        perf-profile.calltrace.cyc=
les-pp.autoremove_wake_function.__wake_up_common.wake_up_page_bit.iomap_fin=
ish_ioend.iomap_finish_ioends
>        0.00            +0.8        0.80 =C2=B1 30%  perf-profile.calltrac=
e.cycles-pp.xfs_trans_reserve.xfs_trans_alloc.xfs_vn_update_time.file_updat=
e_time.xfs_file_aio_write_checks
>        0.00            +0.8        0.82        perf-profile.calltrace.cyc=
les-pp.__wake_up_common.wake_up_page_bit.iomap_finish_ioend.iomap_finish_io=
ends.xfs_end_ioend
>        0.00            +0.8        0.85        perf-profile.calltrace.cyc=
les-pp.wake_up_page_bit.iomap_finish_ioend.iomap_finish_ioends.xfs_end_ioen=
d.xfs_end_io
>        0.00            +0.9        0.89 =C2=B1  2%  perf-profile.calltrac=
e.cycles-pp.xfs_bmapi_write.xfs_iomap_write_unwritten.xfs_end_ioend.xfs_end=
_io.process_one_work
>        0.00            +0.9        0.92 =C2=B1 21%  perf-profile.calltrac=
e.cycles-pp.xfs_log_commit_cil.__xfs_trans_commit.xfs_iomap_write_unwritten=
.xfs_end_ioend.xfs_end_io
>        0.00            +1.0        0.97 =C2=B1 20%  perf-profile.calltrac=
e.cycles-pp.__xfs_trans_commit.xfs_iomap_write_unwritten.xfs_end_ioend.xfs_=
end_io.process_one_work
>       35.68            +1.0       36.68        perf-profile.calltrace.cyc=
les-pp.xlog_cil_force_lsn.xfs_log_force_lsn.xfs_file_fsync.xfs_file_buffere=
d_aio_write.new_sync_write
>        0.00            +1.0        1.04        perf-profile.calltrace.cyc=
les-pp.iomap_finish_ioend.iomap_finish_ioends.xfs_end_ioend.xfs_end_io.proc=
ess_one_work
>        0.00            +1.0        1.05        perf-profile.calltrace.cyc=
les-pp.iomap_finish_ioends.xfs_end_ioend.xfs_end_io.process_one_work.worker=
_thread
>        9.35            +1.2       10.54        perf-profile.calltrace.cyc=
les-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_ent=
ry
>        9.61            +1.2       10.85        perf-profile.calltrace.cyc=
les-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.start_se=
condary
>        9.63            +1.2       10.87        perf-profile.calltrace.cyc=
les-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.secondary_st=
artup_64
>       12.24            +1.3       13.58        perf-profile.calltrace.cyc=
les-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
>       12.25            +1.3       13.60        perf-profile.calltrace.cyc=
les-pp.start_secondary.secondary_startup_64
>       12.25            +1.3       13.60        perf-profile.calltrace.cyc=
les-pp.cpu_startup_entry.start_secondary.secondary_startup_64
>       12.49            +1.4       13.89        perf-profile.calltrace.cyc=
les-pp.secondary_startup_64
>       14.38            +1.4       15.81 =C2=B1  2%  perf-profile.calltrac=
e.cycles-pp.xlog_wait_on_iclog.__xfs_log_force_lsn.xfs_log_force_lsn.xfs_fi=
le_fsync.xfs_file_buffered_aio_write
>       13.41            +1.4       14.86 =C2=B1  2%  perf-profile.calltrac=
e.cycles-pp.remove_wait_queue.xlog_wait_on_iclog.__xfs_log_force_lsn.xfs_lo=
g_force_lsn.xfs_file_fsync
>       13.37            +1.5       14.82 =C2=B1  2%  perf-profile.calltrac=
e.cycles-pp._raw_spin_lock_irqsave.remove_wait_queue.xlog_wait_on_iclog.__x=
fs_log_force_lsn.xfs_log_force_lsn
>       13.34            +1.5       14.80 =C2=B1  2%  perf-profile.calltrac=
e.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.remove_=
wait_queue.xlog_wait_on_iclog.__xfs_log_force_lsn
>       58.91            +1.6       60.56        perf-profile.calltrace.cyc=
les-pp.xfs_log_force_lsn.xfs_file_fsync.xfs_file_buffered_aio_write.new_syn=
c_write.vfs_write
>        0.00            +2.2        2.24 =C2=B1 13%  perf-profile.calltrac=
e.cycles-pp.xfs_iomap_write_unwritten.xfs_end_ioend.xfs_end_io.process_one_=
work.worker_thread
>        5.63            +2.5        8.15        perf-profile.calltrace.cyc=
les-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.remove_wait_=
queue.xlog_cil_force_lsn.xfs_log_force_lsn
>        5.65            +2.5        8.19        perf-profile.calltrace.cyc=
les-pp._raw_spin_lock_irqsave.remove_wait_queue.xlog_cil_force_lsn.xfs_log_=
force_lsn.xfs_file_fsync
>        5.69            +2.5        8.23        perf-profile.calltrace.cyc=
les-pp.remove_wait_queue.xlog_cil_force_lsn.xfs_log_force_lsn.xfs_file_fsyn=
c.xfs_file_buffered_aio_write
>        7.04            +2.8        9.80 =C2=B1  2%  perf-profile.calltrac=
e.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork
>        7.54            +2.9       10.45 =C2=B1  2%  perf-profile.calltrac=
e.cycles-pp.worker_thread.kthread.ret_from_fork
>        7.55            +2.9       10.46 =C2=B1  2%  perf-profile.calltrac=
e.cycles-pp.ret_from_fork
>        7.55            +2.9       10.46 =C2=B1  2%  perf-profile.calltrac=
e.cycles-pp.kthread.ret_from_fork
>        0.00            +3.3        3.30 =C2=B1  9%  perf-profile.calltrac=
e.cycles-pp.xfs_end_ioend.xfs_end_io.process_one_work.worker_thread.kthread
>        0.00            +3.3        3.32 =C2=B1  8%  perf-profile.calltrac=
e.cycles-pp.xfs_end_io.process_one_work.worker_thread.kthread.ret_from_fork
>        8.56 =C2=B1  3%      -4.3        4.25        perf-profile.children=
.cycles-pp.__filemap_fdatawrite_range
>        8.47 =C2=B1  3%      -4.3        4.18        perf-profile.children=
.cycles-pp.xfs_vm_writepages
>        8.50 =C2=B1  3%      -4.3        4.20        perf-profile.children=
.cycles-pp.do_writepages
>       78.64            -4.1       74.51        perf-profile.children.cycl=
es-pp.write
>       78.55            -4.1       74.44        perf-profile.children.cycl=
es-pp.entry_SYSCALL_64_after_hwframe
>       78.50            -4.1       74.41        perf-profile.children.cycl=
es-pp.do_syscall_64
>        8.75 =C2=B1  3%      -4.1        4.70        perf-profile.children=
.cycles-pp.file_write_and_wait_range
>       77.14            -3.8       73.37        perf-profile.children.cycl=
es-pp.ksys_write
>       77.09            -3.8       73.33        perf-profile.children.cycl=
es-pp.vfs_write
>       76.62            -3.7       72.97        perf-profile.children.cycl=
es-pp.new_sync_write
>       76.44            -3.6       72.81        perf-profile.children.cycl=
es-pp.xfs_file_buffered_aio_write
>       69.23            -2.6       66.62        perf-profile.children.cycl=
es-pp.xfs_file_fsync
>        4.70 =C2=B1  2%      -2.2        2.50        perf-profile.children=
.cycles-pp.iomap_submit_ioend
>        4.89 =C2=B1  2%      -2.1        2.75        perf-profile.children=
.cycles-pp.submit_bio
>        4.85 =C2=B1  2%      -2.1        2.71        perf-profile.children=
.cycles-pp.generic_make_request
>        3.73 =C2=B1  4%      -2.1        1.63        perf-profile.children=
.cycles-pp.iomap_writepages
>        3.72 =C2=B1  4%      -2.1        1.63        perf-profile.children=
.cycles-pp.write_cache_pages
>        4.43 =C2=B1  2%      -2.1        2.38        perf-profile.children=
.cycles-pp.brd_make_request
>        7.73            -2.0        5.75 =C2=B1  2%  perf-profile.children=
.cycles-pp.__flush_work
>        3.08 =C2=B1  4%      -1.9        1.14        perf-profile.children=
.cycles-pp.iomap_writepage_map
>        6.00            -1.8        4.20 =C2=B1  2%  perf-profile.children=
.cycles-pp._raw_spin_lock_irq
>        2.50 =C2=B1  4%      -1.8        0.70 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.end_page_writeback
>        2.50 =C2=B1  5%      -1.8        0.70 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.test_clear_page_writeback
>        2.42 =C2=B1  6%      -1.8        0.61 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.__test_set_page_writeback
>        2.08 =C2=B1  7%      -1.6        0.44 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.sb_mark_inode_writeback
>        2.08 =C2=B1  6%      -1.6        0.44 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.sb_clear_inode_writeback
>        2.70 =C2=B1  4%      -1.0        1.67 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.iomap_finish_ioend
>        2.36            -0.6        1.79        perf-profile.children.cycl=
es-pp.iomap_file_buffered_write
>        2.35            -0.6        1.78        perf-profile.children.cycl=
es-pp.iomap_apply
>        1.84            -0.5        1.33 =C2=B1  2%  perf-profile.children=
.cycles-pp.iomap_write_actor
>        2.41 =C2=B1  4%      -0.5        1.94 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.reschedule_interrupt
>        3.44 =C2=B1  2%      -0.5        2.98        perf-profile.children=
.cycles-pp.sched_ttwu_pending
>        2.87            -0.5        2.42        perf-profile.children.cycl=
es-pp.complete
>        2.83            -0.4        2.38        perf-profile.children.cycl=
es-pp.swake_up_locked
>        2.28 =C2=B1  4%      -0.4        1.84 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.scheduler_ipi
>        1.56            -0.4        1.17 =C2=B1  2%  perf-profile.children=
.cycles-pp.brd_do_bvec
>        1.89            -0.4        1.54        perf-profile.children.cycl=
es-pp.wait_for_completion
>        1.71            -0.3        1.38        perf-profile.children.cycl=
es-pp.schedule_timeout
>        0.88            -0.2        0.68 =C2=B1  2%  perf-profile.children=
.cycles-pp.rwsem_down_read_slowpath
>        0.69            -0.2        0.51 =C2=B1  2%  perf-profile.children=
.cycles-pp.iomap_write_begin
>        0.67 =C2=B1  2%      -0.2        0.49        perf-profile.children=
.cycles-pp.lseek64
>        1.33 =C2=B1  5%      -0.2        1.17 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp._raw_spin_unlock_irqrestore
>        0.51            -0.2        0.36        perf-profile.children.cycl=
es-pp.grab_cache_page_write_begin
>        0.47            -0.1        0.33        perf-profile.children.cycl=
es-pp.pagecache_get_page
>        0.51 =C2=B1  3%      -0.1        0.38 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.iomap_write_end
>        0.57 =C2=B1  2%      -0.1        0.46        perf-profile.children=
.cycles-pp.blkdev_issue_flush
>        0.38            -0.1        0.26 =C2=B1  5%  perf-profile.children=
.cycles-pp.iov_iter_copy_from_user_atomic
>        0.34            -0.1        0.23 =C2=B1  6%  perf-profile.children=
.cycles-pp.copyin
>        0.33            -0.1        0.22 =C2=B1  6%  perf-profile.children=
.cycles-pp.copy_user_enhanced_fast_string
>        0.65 =C2=B1  2%      -0.1        0.56 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.rwsem_optimistic_spin
>        0.37            -0.1        0.28 =C2=B1  2%  perf-profile.children=
.cycles-pp.bio_alloc_bioset
>        0.31 =C2=B1  4%      -0.1        0.22        perf-profile.children=
.cycles-pp.syscall_return_via_sysret
>        0.56 =C2=B1  3%      -0.1        0.48 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.osq_lock
>        0.26 =C2=B1  3%      -0.1        0.18 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.entry_SYSCALL_64
>        0.28 =C2=B1  2%      -0.1        0.21 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.mempool_alloc
>        0.26 =C2=B1  6%      -0.1        0.18 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.xlog_state_get_iclog_space
>        0.29            -0.1        0.22 =C2=B1  3%  perf-profile.children=
.cycles-pp.find_get_entry
>        0.34 =C2=B1  2%      -0.1        0.27 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.generic_make_request_checks
>        0.30 =C2=B1  5%      -0.1        0.23 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.iomap_set_page_dirty
>        0.32 =C2=B1  2%      -0.1        0.26 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.brd_lookup_page
>        0.18 =C2=B1  2%      -0.1        0.12 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.iomap_set_range_uptodate
>        0.15 =C2=B1  2%      -0.1        0.09 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.__mod_lruvec_state
>        0.15 =C2=B1  5%      -0.1        0.10 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.wake_up_q
>        0.21 =C2=B1  5%      -0.1        0.15 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.xfs_ilock
>        0.13 =C2=B1  3%      -0.0        0.08 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.rwsem_wake
>        0.20 =C2=B1  2%      -0.0        0.15 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.ksys_lseek
>        0.20 =C2=B1  3%      -0.0        0.15 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.xas_load
>        0.20 =C2=B1  5%      -0.0        0.16 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.__set_page_dirty
>        0.19 =C2=B1  2%      -0.0        0.15 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.xfs_iunlock
>        0.40            -0.0        0.36 =C2=B1  4%  perf-profile.children=
.cycles-pp.xfs_buffered_write_iomap_begin
>        0.17 =C2=B1  2%      -0.0        0.12 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.clear_page_dirty_for_io
>        0.20 =C2=B1  3%      -0.0        0.16 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.submit_bio_wait
>        0.18 =C2=B1  4%      -0.0        0.15 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.security_file_permission
>        0.10            -0.0        0.06 =C2=B1  6%  perf-profile.children=
.cycles-pp.evict
>        0.10            -0.0        0.06 =C2=B1  6%  perf-profile.children=
.cycles-pp.truncate_inode_pages_range
>        0.06 =C2=B1  6%      -0.0        0.03 =C2=B1100%  perf-profile.chi=
ldren.cycles-pp.vfs_unlink
>        0.08 =C2=B1  6%      -0.0        0.04 =C2=B1 58%  perf-profile.chi=
ldren.cycles-pp.add_to_page_cache_lru
>        0.26 =C2=B1  2%      -0.0        0.23 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.reweight_entity
>        0.12 =C2=B1  6%      -0.0        0.09 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.bio_endio
>        0.10 =C2=B1  7%      -0.0        0.07 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.do_sys_open
>        0.10 =C2=B1  7%      -0.0        0.07 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.do_sys_openat2
>        0.17 =C2=B1  2%      -0.0        0.14        perf-profile.children=
.cycles-pp.__pagevec_release
>        0.13 =C2=B1  5%      -0.0        0.10 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.down_write
>        0.10 =C2=B1  5%      -0.0        0.06 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.do_filp_open
>        0.15 =C2=B1  4%      -0.0        0.12 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.tag_pages_for_writeback
>        0.11 =C2=B1  9%      -0.0        0.08 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.bio_associate_blkg
>        0.10 =C2=B1  5%      -0.0        0.07 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.open64
>        0.09 =C2=B1  4%      -0.0        0.06 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.path_openat
>        0.16 =C2=B1  8%      -0.0        0.13 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.pagevec_lookup_range_tag
>        0.12 =C2=B1  8%      -0.0        0.10 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.account_page_dirtied
>        0.10 =C2=B1  4%      -0.0        0.08 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.__fdget_pos
>        0.14 =C2=B1  3%      -0.0        0.11 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.memset_erms
>        0.11 =C2=B1  3%      -0.0        0.09 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.switch_fpu_return
>        0.23            -0.0        0.21 =C2=B1  3%  perf-profile.children=
.cycles-pp.__radix_tree_lookup
>        0.18 =C2=B1  2%      -0.0        0.16 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.insert_work
>        0.12 =C2=B1  4%      -0.0        0.10 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.common_file_perm
>        0.09 =C2=B1  4%      -0.0        0.07 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.__fget_light
>        0.09 =C2=B1  4%      -0.0        0.07 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.bvec_alloc
>        0.15 =C2=B1  7%      -0.0        0.12 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.find_get_pages_range_tag
>        0.08 =C2=B1  8%      -0.0        0.06 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.iov_iter_fault_in_readable
>        0.09 =C2=B1  5%      -0.0        0.06 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.blk_throtl_bio
>        0.24 =C2=B1  4%      -0.0        0.22 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp._cond_resched
>        0.13 =C2=B1  3%      -0.0        0.11 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.release_pages
>        0.10 =C2=B1  4%      -0.0        0.08 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.xfs_bmbt_to_iomap
>        0.08 =C2=B1 10%      -0.0        0.06        perf-profile.children=
.cycles-pp.unlink
>        0.08 =C2=B1 10%      -0.0        0.06 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.__sb_start_write
>        0.08 =C2=B1  5%      -0.0        0.06 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.generic_write_checks
>        0.08 =C2=B1  8%      -0.0        0.06        perf-profile.children=
.cycles-pp.do_unlinkat
>        0.07 =C2=B1 10%      -0.0        0.05        perf-profile.children=
.cycles-pp.xfs_break_layouts
>        0.18 =C2=B1  2%      -0.0        0.16 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.__list_add_valid
>        0.12 =C2=B1  3%      -0.0        0.10 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.__might_sleep
>        0.14 =C2=B1  3%      -0.0        0.12 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.xas_find_marked
>        0.07 =C2=B1 10%      -0.0        0.05 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.bio_associate_blkg_from_css
>        0.08 =C2=B1  5%      -0.0        0.06 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.bio_free
>        0.08 =C2=B1  6%      -0.0        0.06        perf-profile.children=
.cycles-pp.xfs_file_llseek
>        0.08 =C2=B1  5%      -0.0        0.06 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.xfs_file_write_iter
>        0.16 =C2=B1  2%      +0.0        0.17 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.__switch_to_asm
>        0.05            +0.0        0.07 =C2=B1  7%  perf-profile.children=
.cycles-pp.cpumask_next_wrap
>        0.10 =C2=B1  4%      +0.0        0.12 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp._find_next_bit
>        0.07 =C2=B1  7%      +0.0        0.09 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.xlog_state_done_syncing
>        0.16 =C2=B1  2%      +0.0        0.19 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.check_preempt_curr
>        0.19 =C2=B1  4%      +0.0        0.22        perf-profile.children=
.cycles-pp.ttwu_do_wakeup
>        0.56 =C2=B1  3%      +0.0        0.60        perf-profile.children=
.cycles-pp.dequeue_entity
>        0.20 =C2=B1  6%      +0.0        0.23 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.xfs_trans_committed_bulk
>        0.07 =C2=B1  7%      +0.0        0.10 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.check_preempt_wakeup
>        0.82 =C2=B1  2%      +0.0        0.86        perf-profile.children=
.cycles-pp.update_load_avg
>        0.31 =C2=B1  3%      +0.0        0.35        perf-profile.children=
.cycles-pp.__unwind_start
>        0.08 =C2=B1  8%      +0.0        0.12 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.destroy_inode
>        0.08 =C2=B1 10%      +0.0        0.12 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.xfs_fs_destroy_inode
>        0.08 =C2=B1 10%      +0.0        0.12 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.xfs_inactive
>        0.08 =C2=B1 15%      +0.0        0.12 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.xfs_bmap_validate_extent
>        3.96            +0.0        4.01        perf-profile.children.cycl=
es-pp.stack_trace_save_tsk
>        0.28            +0.0        0.33        perf-profile.children.cycl=
es-pp.set_next_entity
>        0.00            +0.1        0.05        perf-profile.children.cycl=
es-pp.xfs_trans_roll
>        0.00            +0.1        0.05 =C2=B1  8%  perf-profile.children=
.cycles-pp.xfs_btree_delrec
>        0.00            +0.1        0.05 =C2=B1  8%  perf-profile.children=
.cycles-pp.xfs_btree_insert
>        0.16 =C2=B1  4%      +0.1        0.21 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.memcpy_erms
>        0.04 =C2=B1 57%      +0.1        0.10 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.xfs_itruncate_extents_flags
>        0.00            +0.1        0.06 =C2=B1 11%  perf-profile.children=
.cycles-pp.xfs_buf_item_format_segment
>        0.00            +0.1        0.06 =C2=B1 11%  perf-profile.children=
.cycles-pp.xfs_btree_delete
>        0.00            +0.1        0.06        perf-profile.children.cycl=
es-pp.xfs_btree_update
>        0.00            +0.1        0.07 =C2=B1  7%  perf-profile.children=
.cycles-pp.xfs_cil_prepare_item
>        0.00            +0.1        0.07 =C2=B1  6%  perf-profile.children=
.cycles-pp.xfs_bmbt_update
>        0.00            +0.1        0.07 =C2=B1 10%  perf-profile.children=
.cycles-pp.xfs_buf_item_format
>        0.56            +0.1        0.64 =C2=B1  2%  perf-profile.children=
.cycles-pp.pick_next_task_fair
>        0.03 =C2=B1100%      +0.1        0.10 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.xfs_inactive_truncate
>        0.08 =C2=B1  5%      +0.1        0.16 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.xfs_iext_lookup_extent
>        0.00            +0.1        0.08 =C2=B1  5%  perf-profile.children=
.cycles-pp.xfs_defer_finish
>        0.00            +0.1        0.08 =C2=B1  5%  perf-profile.children=
.cycles-pp.xfs_bmap_check_leaf_extents
>        0.00            +0.1        0.08 =C2=B1  5%  perf-profile.children=
.cycles-pp.xfs_verify_agbno
>        0.00            +0.1        0.09 =C2=B1  9%  perf-profile.children=
.cycles-pp.xfs_defer_finish_noroll
>        0.60 =C2=B1  3%      +0.1        0.70        perf-profile.children=
.cycles-pp.schedule_idle
>        0.39 =C2=B1  2%      +0.1        0.49        perf-profile.children=
.cycles-pp.xlog_state_release_iclog
>        0.00            +0.1        0.10 =C2=B1  9%  perf-profile.children=
.cycles-pp.xfs_buf_find
>        0.93 =C2=B1  3%      +0.1        1.03 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.xlog_write
>        2.58            +0.1        2.69        perf-profile.children.cycl=
es-pp.schedule
>        1.52            +0.1        1.63        perf-profile.children.cycl=
es-pp.__wake_up_common_lock
>        0.00            +0.1        0.11 =C2=B1  7%  perf-profile.children=
.cycles-pp.xfs_buf_get_map
>        4.62            +0.1        4.73        perf-profile.children.cycl=
es-pp.__account_scheduler_latency
>        0.00            +0.1        0.12 =C2=B1 10%  perf-profile.children=
.cycles-pp.xfs_buf_read_map
>        1.83            +0.2        1.99        perf-profile.children.cycl=
es-pp.xlog_cil_push_work
>        5.94            +0.2        6.12        perf-profile.children.cycl=
es-pp.ttwu_do_activate
>        0.00            +0.2        0.17 =C2=B1  6%  perf-profile.children=
.cycles-pp.xfs_btree_read_buf_block
>        5.93            +0.2        6.11        perf-profile.children.cycl=
es-pp.activate_task
>        5.88            +0.2        6.06        perf-profile.children.cycl=
es-pp.enqueue_task_fair
>        0.00            +0.2        0.18 =C2=B1  5%  perf-profile.children=
.cycles-pp.xfs_trans_read_buf_map
>        5.41            +0.2        5.59        perf-profile.children.cycl=
es-pp.enqueue_entity
>        3.14            +0.2        3.33        perf-profile.children.cycl=
es-pp.__sched_text_start
>        0.00            +0.2        0.21 =C2=B1  6%  perf-profile.children=
.cycles-pp.xfs_btree_lookup_get_block
>        0.00            +0.2        0.23 =C2=B1 57%  perf-profile.children=
.cycles-pp.xlog_grant_head_wait
>        0.00            +0.2        0.24 =C2=B1  6%  perf-profile.children=
.cycles-pp.io_schedule
>        0.11 =C2=B1  3%      +0.3        0.38 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.__filemap_fdatawait_range
>        0.00            +0.3        0.27 =C2=B1  8%  perf-profile.children=
.cycles-pp.wait_on_page_bit
>        0.00            +0.3        0.34 =C2=B1  5%  perf-profile.children=
.cycles-pp.xfs_btree_lookup
>        0.08 =C2=B1 14%      +0.4        0.43        perf-profile.children=
.cycles-pp.__queue_work
>        0.08 =C2=B1  8%      +0.4        0.44        perf-profile.children=
.cycles-pp.queue_work_on
>        0.00            +0.4        0.41        perf-profile.children.cycl=
es-pp.xfs_end_bio
>        3.51            +0.4        3.94 =C2=B1  9%  perf-profile.children=
.cycles-pp.__xfs_trans_commit
>        0.20 =C2=B1  9%      +0.5        0.72 =C2=B1 54%  perf-profile.chi=
ldren.cycles-pp.xfs_log_ticket_ungrant
>        0.06 =C2=B1 11%      +0.5        0.58 =C2=B1 67%  perf-profile.chi=
ldren.cycles-pp.xfs_log_space_wake
>        0.45 =C2=B1  5%      +0.6        1.04 =C2=B1 36%  perf-profile.chi=
ldren.cycles-pp.xfs_log_reserve
>        0.65 =C2=B1  3%      +0.6        1.25 =C2=B1 29%  perf-profile.chi=
ldren.cycles-pp.xfs_trans_alloc
>        0.48 =C2=B1  5%      +0.6        1.09 =C2=B1 34%  perf-profile.chi=
ldren.cycles-pp.xfs_trans_reserve
>        0.04 =C2=B1 57%      +0.6        0.65 =C2=B1 60%  perf-profile.chi=
ldren.cycles-pp.xlog_grant_head_check
>        4.83            +0.7        5.52        perf-profile.children.cycl=
es-pp.try_to_wake_up
>        0.00            +0.7        0.70 =C2=B1  2%  perf-profile.children=
.cycles-pp.xfs_bmap_add_extent_unwritten_real
>        0.00            +0.8        0.75 =C2=B1  4%  perf-profile.children=
.cycles-pp.xfs_bmapi_convert_unwritten
>        0.04 =C2=B1 57%      +0.8        0.80        perf-profile.children=
.cycles-pp.autoremove_wake_function
>        0.05 =C2=B1  8%      +0.8        0.85        perf-profile.children=
.cycles-pp.wake_up_page_bit
>        1.50            +0.9        2.36        perf-profile.children.cycl=
es-pp.__wake_up_common
>        0.00            +0.9        0.89 =C2=B1  2%  perf-profile.children=
.cycles-pp.xfs_bmapi_write
>       24.29            +0.9       25.18        perf-profile.children.cycl=
es-pp._raw_spin_lock_irqsave
>        0.07 =C2=B1  5%      +1.0        1.05        perf-profile.children=
.cycles-pp.iomap_finish_ioends
>       35.68            +1.0       36.69        perf-profile.children.cycl=
es-pp.xlog_cil_force_lsn
>        9.53            +1.2       10.76        perf-profile.children.cycl=
es-pp.intel_idle
>        9.81            +1.3       11.10        perf-profile.children.cycl=
es-pp.cpuidle_enter_state
>        9.82            +1.3       11.11        perf-profile.children.cycl=
es-pp.cpuidle_enter
>       12.25            +1.3       13.60        perf-profile.children.cycl=
es-pp.start_secondary
>       12.49            +1.4       13.89        perf-profile.children.cycl=
es-pp.secondary_startup_64
>       12.49            +1.4       13.89        perf-profile.children.cycl=
es-pp.cpu_startup_entry
>       12.48            +1.4       13.88        perf-profile.children.cycl=
es-pp.do_idle
>       14.78            +1.4       16.20 =C2=B1  2%  perf-profile.children=
.cycles-pp.xlog_wait_on_iclog
>       58.91            +1.7       60.57        perf-profile.children.cycl=
es-pp.xfs_log_force_lsn
>        0.00            +2.2        2.24 =C2=B1 13%  perf-profile.children=
.cycles-pp.xfs_iomap_write_unwritten
>        7.05            +2.8        9.81 =C2=B1  2%  perf-profile.children=
.cycles-pp.process_one_work
>        7.54            +2.9       10.45 =C2=B1  2%  perf-profile.children=
.cycles-pp.worker_thread
>        7.55            +2.9       10.46 =C2=B1  2%  perf-profile.children=
.cycles-pp.ret_from_fork
>        7.55            +2.9       10.46 =C2=B1  2%  perf-profile.children=
.cycles-pp.kthread
>        0.10            +3.2        3.30 =C2=B1  9%  perf-profile.children=
.cycles-pp.xfs_end_ioend
>        0.10 =C2=B1  4%      +3.2        3.32 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.xfs_end_io
>       19.57            +4.0       23.62        perf-profile.children.cycl=
es-pp.remove_wait_queue
>        1.20            -0.3        0.90 =C2=B1  2%  perf-profile.self.cyc=
les-pp.brd_do_bvec
>        0.55 =C2=B1  3%      -0.2        0.39 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.do_syscall_64
>        0.31            -0.1        0.22 =C2=B1  5%  perf-profile.self.cyc=
les-pp.copy_user_enhanced_fast_string
>        0.31 =C2=B1  3%      -0.1        0.22        perf-profile.self.cyc=
les-pp.syscall_return_via_sysret
>        0.54 =C2=B1  3%      -0.1        0.47 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.osq_lock
>        0.23 =C2=B1  3%      -0.1        0.16 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.entry_SYSCALL_64
>        0.10 =C2=B1  4%      -0.1        0.04 =C2=B1 57%  perf-profile.sel=
f.cycles-pp.__mod_lruvec_state
>        0.18 =C2=B1  4%      -0.1        0.12 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.iomap_set_range_uptodate
>        0.60 =C2=B1  4%      -0.1        0.54 =C2=B1  2%  perf-profile.sel=
f.cycles-pp._raw_spin_lock
>        0.77            -0.0        0.72        perf-profile.self.cycles-p=
p._raw_spin_lock_irqsave
>        0.14            -0.0        0.10 =C2=B1  8%  perf-profile.self.cyc=
les-pp.find_get_entry
>        0.14 =C2=B1  3%      -0.0        0.11 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.xas_load
>        0.17 =C2=B1  4%      -0.0        0.14 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.write
>        0.30 =C2=B1  2%      -0.0        0.27 =C2=B1  6%  perf-profile.sel=
f.cycles-pp._raw_spin_lock_irq
>        0.18 =C2=B1  5%      -0.0        0.15 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.__flush_work
>        0.08 =C2=B1  5%      -0.0        0.05        perf-profile.self.cyc=
les-pp.xfs_inode_item_format_data_fork
>        0.12 =C2=B1  3%      -0.0        0.09 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.brd_lookup_page
>        0.12 =C2=B1  7%      -0.0        0.09 =C2=B1  9%  perf-profile.sel=
f.cycles-pp.vfs_write
>        0.18 =C2=B1  4%      -0.0        0.15 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.insert_work
>        0.13            -0.0        0.10 =C2=B1  8%  perf-profile.self.cyc=
les-pp.memset_erms
>        0.11 =C2=B1  4%      -0.0        0.08        perf-profile.self.cyc=
les-pp.xfs_file_buffered_aio_write
>        0.11 =C2=B1  6%      -0.0        0.08 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.xfs_buffered_write_iomap_begin
>        0.12 =C2=B1  3%      -0.0        0.09 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.iomap_writepage_map
>        0.08 =C2=B1  8%      -0.0        0.06 =C2=B1 15%  perf-profile.sel=
f.cycles-pp.bio_alloc_bioset
>        0.06 =C2=B1  6%      -0.0        0.04 =C2=B1 57%  perf-profile.sel=
f.cycles-pp.xfs_bmbt_to_iomap
>        0.09 =C2=B1  5%      -0.0        0.06 =C2=B1  6%  perf-profile.sel=
f.cycles-pp.__fget_light
>        0.06            -0.0        0.04 =C2=B1 57%  perf-profile.self.cyc=
les-pp.xfs_map_blocks
>        0.18 =C2=B1  2%      -0.0        0.15 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.__list_add_valid
>        0.08 =C2=B1  6%      -0.0        0.06 =C2=B1  9%  perf-profile.sel=
f.cycles-pp.xfs_ilock
>        0.08 =C2=B1  6%      -0.0        0.06 =C2=B1  9%  perf-profile.sel=
f.cycles-pp.iov_iter_fault_in_readable
>        0.11 =C2=B1  4%      -0.0        0.09 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.switch_fpu_return
>        0.07            -0.0        0.05        perf-profile.self.cycles-p=
p.iomap_write_actor
>        0.23 =C2=B1  2%      -0.0        0.21 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.__radix_tree_lookup
>        0.18 =C2=B1  4%      -0.0        0.16 =C2=B1  6%  perf-profile.sel=
f.cycles-pp.xlog_cil_force_lsn
>        0.20 =C2=B1  2%      -0.0        0.18 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.kmem_cache_alloc
>        0.10 =C2=B1  5%      -0.0        0.08 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.xfs_file_fsync
>        0.07 =C2=B1  5%      -0.0        0.05 =C2=B1  9%  perf-profile.sel=
f.cycles-pp.clear_page_dirty_for_io
>        0.07 =C2=B1  6%      -0.0        0.05        perf-profile.self.cyc=
les-pp.__test_set_page_writeback
>        0.11            -0.0        0.09 =C2=B1  8%  perf-profile.self.cyc=
les-pp.common_file_perm
>        0.23            -0.0        0.21 =C2=B1  4%  perf-profile.self.cyc=
les-pp.update_rq_clock
>        0.08 =C2=B1  6%      -0.0        0.06        perf-profile.self.cyc=
les-pp.xfs_file_write_iter
>        0.10 =C2=B1  5%      -0.0        0.08 =C2=B1  8%  perf-profile.sel=
f.cycles-pp.up_read
>        0.08 =C2=B1  5%      -0.0        0.07        perf-profile.self.cyc=
les-pp.write_cache_pages
>        0.10            -0.0        0.09        perf-profile.self.cycles-p=
p.reweight_entity
>        0.05 =C2=B1  8%      +0.0        0.07 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.dequeue_entity
>        0.16 =C2=B1  4%      +0.0        0.17 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.__switch_to_asm
>        0.11 =C2=B1  4%      +0.0        0.12 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.set_next_entity
>        0.15 =C2=B1  3%      +0.0        0.16 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.orc_find
>        0.09 =C2=B1  4%      +0.0        0.11 =C2=B1  6%  perf-profile.sel=
f.cycles-pp.enqueue_entity
>        0.10 =C2=B1  4%      +0.0        0.12 =C2=B1  3%  perf-profile.sel=
f.cycles-pp._find_next_bit
>        0.01 =C2=B1173%      +0.0        0.06 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.check_preempt_wakeup
>        0.01 =C2=B1173%      +0.0        0.06 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.xfs_trans_committed_bulk
>        0.45 =C2=B1  2%      +0.1        0.51 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.__sched_text_start
>        0.15 =C2=B1  6%      +0.1        0.21 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.memcpy_erms
>        0.00            +0.1        0.06 =C2=B1  6%  perf-profile.self.cyc=
les-pp.xfs_verify_agbno
>        0.08 =C2=B1  8%      +0.1        0.16 =C2=B1  9%  perf-profile.sel=
f.cycles-pp.xfs_iext_lookup_extent
>        9.53            +1.2       10.76        perf-profile.self.cycles-p=
p.intel_idle
> =

> =

>                                                                          =
        =

>                                    aim7.jobs-per-min
>                                                                          =
        =

>    45000 +---------------------------------------------------------------=
----+
>          |        +  +                                                   =
    |
>    40000 |.+.+    :   + .+.   +.                                     .+. =
    |
>    35000 |-+ :    :    +   +.+  +.+.+.++.+.+.+.++.+.+.+.++.+.+.++.+.+   +=
+.+.|
>          |   :    :                                                      =
    |
>    30000 |-+ :   :                                                       =
    |
>    25000 |-O :O O:O   OO                                                 =
    |
>          |   :   :  O    O O OO O O O O                                  =
    |
>    20000 |-+  :  :                                                       =
    |
>    15000 |-+  :  :                                                       =
    |
>          |    :  :                                                       =
    |
>    10000 |-+  : :                                                        =
    |
>     5000 |-+  : :                                                        =
    |
>          |    : :                                                        =
    |
>        0 +---------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                                 aim7.time.system_time
>                                                                          =
        =

>    5000 +----------------------------------------------------------------=
----+
>    4500 |-+        O   OO   O    O O O                                   =
    |
>         | O OO O O   O    O   O O                                        =
    |
>    4000 |-+                                                              =
    |
>    3500 |-+                                                              =
    |
>         |             .+ .+.+. .++.+.+.+.+.++.+.+.+.++.+.+.+.+ .+.+.+. .+=
+.+.|
>    3000 |.+.+       .+  +     +                               +       +  =
    |
>    2500 |-+ :    +.+                                                     =
    |
>    2000 |-+ :    :                                                       =
    |
>         |   :   :                                                        =
    |
>    1500 |-+  :  :                                                        =
    |
>    1000 |-+  :  :                                                        =
    |
>         |    :  :                                                        =
    |
>     500 |-+  : :                                                         =
    |
>       0 +----------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                                aim7.time.elapsed_time
>                                                                          =
        =

>    160 +-----------------------------------------------------------------=
----+
>        |   O OO O O O O OO O O O   O                                     =
    |
>    140 |-O                                                               =
    |
>    120 |-+                                                               =
    |
>        |                                                                 =
    |
>    100 |-+           .+. +.+. .+.+.++.+.+.+.+.+.++.+.+.+.+.++.+.+.+.+. +.=
+.+.|
>        |.+.+    +. .+   +    +                                        +  =
    |
>     80 |-+ :    : +                                                      =
    |
>        |    :   :                                                        =
    |
>     60 |-+  :  :                                                         =
    |
>     40 |-+  :  :                                                         =
    |
>        |    :  :                                                         =
    |
>     20 |-+   : :                                                         =
    |
>        |     ::                                                          =
    |
>      0 +-----------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                              aim7.time.elapsed_time.max
>                                                                          =
        =

>    160 +-----------------------------------------------------------------=
----+
>        |   O OO O O O O OO O O O   O                                     =
    |
>    140 |-O                                                               =
    |
>    120 |-+                                                               =
    |
>        |                                                                 =
    |
>    100 |-+           .+. +.+. .+.+.++.+.+.+.+.+.++.+.+.+.+.++.+.+.+.+. +.=
+.+.|
>        |.+.+    +. .+   +    +                                        +  =
    |
>     80 |-+ :    : +                                                      =
    |
>        |    :   :                                                        =
    |
>     60 |-+  :  :                                                         =
    |
>     40 |-+  :  :                                                         =
    |
>        |    :  :                                                         =
    |
>     20 |-+   : :                                                         =
    |
>        |     ::                                                          =
    |
>      0 +-----------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                          aim7.time.voluntary_context_switches
>                                                                          =
        =

>    8e+07 +---------------------------------------------------------------=
----+
>          | O          O  O O OO O   O                                    =
    |
>    7e+07 |-+                                                             =
    |
>    6e+07 |-+                                                             =
    |
>          |                                                               =
    |
>    5e+07 |-+           +.+.+.++.+.+.+.++.+.+. .+   .+.+.    .+.    .+.   =
+.+.|
>          |.+.+       .+                      +  +.+     ++.+   ++.+   +.+=
    |
>    4e+07 |-+ :    +.+                                                    =
    |
>          |   :    :                                                      =
    |
>    3e+07 |-+ :   :                                                       =
    |
>    2e+07 |-+  :  :                                                       =
    |
>          |    :  :                                                       =
    |
>    1e+07 |-+  :  :                                                       =
    |
>          |    : :                                                        =
    |
>        0 +---------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
        =

> [*] bisect-good sample
> [O] bisect-bad  sample
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
> Rong Chen
> =

> =

> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
> =


-- =

Zhengjun Xing
--===============0221411059394661316==--

