Content-Type: multipart/mixed; boundary="===============0295311298100867147=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [ext4] d3b6f23f71: stress-ng.fiemap.ops_per_sec -60.5% regression
Date: Mon, 13 Apr 2020 16:37:58 +0800
Message-ID: <f06f7ebf-ec9c-3126-f00a-a3578ecee3f6@linux.intel.com>
In-Reply-To: <20200407080036.GA8179@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0295311298100867147==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Harjani,

    Do you have time to take a look at this? Thanks.

On 4/7/2020 4:00 PM, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -60.5% regression of stress-ng.fiemap.ops_per_sec due t=
o commit:
> =

> =

> commit: d3b6f23f71670007817a5d59f3fbafab2b794e8c ("ext4: move ext4_fiemap=
 to use iomap framework")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: stress-ng
> on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz with=
 192G memory
> with following parameters:
> =

> 	nr_threads: 10%
> 	disk: 1HDD
> 	testtime: 1s
> 	class: os
> 	cpufreq_governor: performance
> 	ucode: 0x500002c
> 	fs: ext4
> =

> =

> =

> =

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
> class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_gr=
oup/testcase/testtime/ucode:
>    os/gcc-7/performance/1HDD/ext4/x86_64-rhel-7.6/10%/debian-x86_64-20191=
114.cgz/lkp-csl-2sp5/stress-ng/1s/0x500002c
> =

> commit:
>    b2c5764262 ("ext4: make ext4_ind_map_blocks work with fiemap")
>    d3b6f23f71 ("ext4: move ext4_fiemap to use iomap framework")
> =

> b2c5764262edded1 d3b6f23f71670007817a5d59f3f
> ---------------- ---------------------------
>         fail:runs  %reproduction    fail:runs
>             |             |             |
>             :4           25%           1:4     dmesg.WARNING:at#for_ip_in=
terrupt_entry/0x
>            2:4            5%           2:4     perf-profile.calltrace.cyc=
les-pp.sync_regs.error_entry
>            2:4            6%           3:4     perf-profile.calltrace.cyc=
les-pp.error_entry
>            3:4            9%           3:4     perf-profile.children.cycl=
es-pp.error_entry
>            0:4            1%           0:4     perf-profile.self.cycles-p=
p.error_entry
>           %stddev     %change         %stddev
>               \          |                \
>       28623           +28.2%      36703 =C2=B1 12%  stress-ng.daemon.ops
>       28632           +28.2%      36704 =C2=B1 12%  stress-ng.daemon.ops_=
per_sec
>      566.00 =C2=B1 22%     -53.2%     265.00 =C2=B1 53%  stress-ng.dev.ops
>      278.81 =C2=B1 22%     -53.0%     131.00 =C2=B1 54%  stress-ng.dev.op=
s_per_sec
>       73160           -60.6%      28849 =C2=B1  3%  stress-ng.fiemap.ops
>       72471           -60.5%      28612 =C2=B1  3%  stress-ng.fiemap.ops_=
per_sec
>       23421 =C2=B1 12%     +21.2%      28388 =C2=B1  6%  stress-ng.filena=
me.ops
>       22638 =C2=B1 12%     +20.3%      27241 =C2=B1  6%  stress-ng.filena=
me.ops_per_sec
>       21.25 =C2=B1  7%     -10.6%      19.00 =C2=B1  3%  stress-ng.iomix.=
ops
>       38.75 =C2=B1 49%     -47.7%      20.25 =C2=B1 96%  stress-ng.memhot=
plug.ops
>       34.45 =C2=B1 52%     -51.8%      16.62 =C2=B1106%  stress-ng.memhot=
plug.ops_per_sec
>        1734 =C2=B1 10%     +31.4%       2278 =C2=B1 10%  stress-ng.resour=
ces.ops
>      807.56 =C2=B1  5%     +35.2%       1091 =C2=B1  8%  stress-ng.resour=
ces.ops_per_sec
>     1007356 =C2=B1  3%     -16.5%     840642 =C2=B1  9%  stress-ng.revio.=
ops
>     1007692 =C2=B1  3%     -16.6%     840711 =C2=B1  9%  stress-ng.revio.=
ops_per_sec
>       21812 =C2=B1  3%     +16.0%      25294 =C2=B1  5%  stress-ng.sysbad=
addr.ops
>       21821 =C2=B1  3%     +15.9%      25294 =C2=B1  5%  stress-ng.sysbad=
addr.ops_per_sec
>      440.75 =C2=B1  4%     +21.9%     537.25 =C2=B1  9%  stress-ng.sysfs.=
ops
>      440.53 =C2=B1  4%     +21.9%     536.86 =C2=B1  9%  stress-ng.sysfs.=
ops_per_sec
>    13286582           -11.1%   11805520 =C2=B1  6%  stress-ng.time.file_s=
ystem_outputs
>    68253896            +2.4%   69860122        stress-ng.time.minor_page_=
faults
>      197.00 =C2=B1  4%     -15.9%     165.75 =C2=B1 12%  stress-ng.xattr.=
ops
>      192.45 =C2=B1  5%     -16.1%     161.46 =C2=B1 11%  stress-ng.xattr.=
ops_per_sec
>       15310           +62.5%      24875 =C2=B1 22%  stress-ng.zombie.ops
>       15310           +62.5%      24874 =C2=B1 22%  stress-ng.zombie.ops_=
per_sec
>      203.50 =C2=B1 12%     -47.3%     107.25 =C2=B1 49%  vmstat.io.bi
>      861318 =C2=B1 18%     -29.7%     605884 =C2=B1  5%  meminfo.AnonHuge=
Pages
>     1062742 =C2=B1 14%     -20.2%     847853 =C2=B1  3%  meminfo.AnonPages
>       31093 =C2=B1  6%      +9.6%      34090 =C2=B1  3%  meminfo.KernelSt=
ack
>        7151 =C2=B1 34%     +55.8%      11145 =C2=B1  9%  meminfo.Mlocked
>   1.082e+08 =C2=B1  5%     -40.2%   64705429 =C2=B1 31%  numa-numastat.no=
de0.local_node
>   1.082e+08 =C2=B1  5%     -40.2%   64739883 =C2=B1 31%  numa-numastat.no=
de0.numa_hit
>    46032662 =C2=B1 21%    +104.3%   94042918 =C2=B1 20%  numa-numastat.no=
de1.local_node
>    46074205 =C2=B1 21%    +104.2%   94072810 =C2=B1 20%  numa-numastat.no=
de1.numa_hit
>        3942 =C2=B1  3%     +14.2%       4501 =C2=B1  4%  slabinfo.pool_wo=
rkqueue.active_objs
>        4098 =C2=B1  3%     +14.3%       4683 =C2=B1  4%  slabinfo.pool_wo=
rkqueue.num_objs
>        4817 =C2=B1  7%     +13.3%       5456 =C2=B1  8%  slabinfo.proc_di=
r_entry.active_objs
>        5153 =C2=B1  6%     +12.5%       5797 =C2=B1  8%  slabinfo.proc_di=
r_entry.num_objs
>       18598 =C2=B1 13%     -33.1%      12437 =C2=B1 20%  sched_debug.cfs_=
rq:/.load.avg
>      452595 =C2=B1 56%     -71.4%     129637 =C2=B1 76%  sched_debug.cfs_=
rq:/.load.max
>       67675 =C2=B1 35%     -55.1%      30377 =C2=B1 42%  sched_debug.cfs_=
rq:/.load.stddev
>       18114 =C2=B1 12%     -33.7%      12011 =C2=B1 20%  sched_debug.cfs_=
rq:/.runnable_weight.avg
>      448215 =C2=B1 58%     -72.8%     121789 =C2=B1 82%  sched_debug.cfs_=
rq:/.runnable_weight.max
>       67083 =C2=B1 37%     -56.3%      29305 =C2=B1 43%  sched_debug.cfs_=
rq:/.runnable_weight.stddev
>      -38032          +434.3%    -203212        sched_debug.cfs_rq:/.sprea=
d0.avg
>     -204466           +95.8%    -400301        sched_debug.cfs_rq:/.sprea=
d0.min
>       90.02 =C2=B1 25%     -58.1%      37.69 =C2=B1 52%  sched_debug.cfs_=
rq:/.util_est_enqueued.avg
>      677.54 =C2=B1  6%     -39.3%     411.50 =C2=B1 22%  sched_debug.cfs_=
rq:/.util_est_enqueued.max
>      196.57 =C2=B1  8%     -47.6%     103.05 =C2=B1 36%  sched_debug.cfs_=
rq:/.util_est_enqueued.stddev
>        3.34 =C2=B1 23%     +34.1%       4.48 =C2=B1  4%  sched_debug.cpu.=
clock.stddev
>        3.34 =C2=B1 23%     +34.1%       4.48 =C2=B1  4%  sched_debug.cpu.=
clock_task.stddev
>      402872 =C2=B1  7%     -11.9%     354819 =C2=B1  2%  proc-vmstat.nr_a=
ctive_anon
>     1730331            -9.5%    1566418 =C2=B1  5%  proc-vmstat.nr_dirtied
>       31042 =C2=B1  6%      +9.3%      33915 =C2=B1  3%  proc-vmstat.nr_k=
ernel_stack
>      229047            -2.4%     223615        proc-vmstat.nr_mapped
>       74008 =C2=B1  7%     +20.5%      89163 =C2=B1  8%  proc-vmstat.nr_w=
ritten
>      402872 =C2=B1  7%     -11.9%     354819 =C2=B1  2%  proc-vmstat.nr_z=
one_active_anon
>       50587 =C2=B1 11%     -25.2%      37829 =C2=B1 14%  proc-vmstat.numa=
_pages_migrated
>      457500           -23.1%     351918 =C2=B1 31%  proc-vmstat.numa_pte_=
updates
>    81382485            +1.9%   82907822        proc-vmstat.pgfault
>   2.885e+08 =C2=B1  5%     -13.3%  2.502e+08 =C2=B1  6%  proc-vmstat.pgfr=
ee
>       42206 =C2=B1 12%     -46.9%      22399 =C2=B1 49%  proc-vmstat.pgpg=
in
>      431233 =C2=B1 13%     -64.8%     151736 =C2=B1109%  proc-vmstat.pgro=
tated
>      176754 =C2=B1  7%     -40.2%     105637 =C2=B1 31%  proc-vmstat.thp_=
fault_alloc
>      314.50 =C2=B1 82%    +341.5%       1388 =C2=B1 44%  proc-vmstat.unev=
ictable_pgs_stranded
>     1075269 =C2=B1 14%     -41.3%     631388 =C2=B1 17%  numa-meminfo.nod=
e0.Active
>      976056 =C2=B1 12%     -39.7%     588727 =C2=B1 19%  numa-meminfo.nod=
e0.Active(anon)
>      426857 =C2=B1 22%     -36.4%     271375 =C2=B1 13%  numa-meminfo.nod=
e0.AnonHugePages
>      558590 =C2=B1 19%     -36.4%     355402 =C2=B1 14%  numa-meminfo.nod=
e0.AnonPages
>     1794824 =C2=B1  9%     -28.8%    1277157 =C2=B1 20%  numa-meminfo.nod=
e0.FilePages
>        8517 =C2=B1 92%     -82.7%       1473 =C2=B1 89%  numa-meminfo.nod=
e0.Inactive(file)
>      633118 =C2=B1  2%     -41.7%     368920 =C2=B1 36%  numa-meminfo.nod=
e0.Mapped
>     2958038 =C2=B1 12%     -27.7%    2139271 =C2=B1 12%  numa-meminfo.nod=
e0.MemUsed
>      181401 =C2=B1  5%     -13.7%     156561 =C2=B1  4%  numa-meminfo.nod=
e0.SUnreclaim
>      258124 =C2=B1  6%     -13.0%     224535 =C2=B1  5%  numa-meminfo.nod=
e0.Slab
>      702083 =C2=B1 16%     +31.0%     919406 =C2=B1 11%  numa-meminfo.nod=
e1.Active
>       38663 =C2=B1107%    +137.8%      91951 =C2=B1 31%  numa-meminfo.nod=
e1.Active(file)
>     1154975 =C2=B1  7%     +41.6%    1635593 =C2=B1 12%  numa-meminfo.nod=
e1.FilePages
>      395813 =C2=B1 25%     +62.8%     644533 =C2=B1 16%  numa-meminfo.nod=
e1.Inactive
>      394313 =C2=B1 25%     +62.5%     640686 =C2=B1 16%  numa-meminfo.nod=
e1.Inactive(anon)
>      273317           +88.8%     515976 =C2=B1 25%  numa-meminfo.node1.Ma=
pped
>     2279237 =C2=B1  6%     +25.7%    2865582 =C2=B1  7%  numa-meminfo.nod=
e1.MemUsed
>       10830 =C2=B1 18%     +29.6%      14033 =C2=B1  9%  numa-meminfo.nod=
e1.PageTables
>      149390 =C2=B1  3%     +23.2%     184085 =C2=B1  3%  numa-meminfo.nod=
e1.SUnreclaim
>      569542 =C2=B1 16%     +74.8%     995336 =C2=B1 21%  numa-meminfo.nod=
e1.Shmem
>      220774 =C2=B1  5%     +20.3%     265656 =C2=B1  3%  numa-meminfo.nod=
e1.Slab
>    35623587 =C2=B1  5%     -11.7%   31444514 =C2=B1  3%  perf-stat.i.cach=
e-misses
>   2.576e+08 =C2=B1  5%      -6.8%    2.4e+08 =C2=B1  2%  perf-stat.i.cach=
e-references
>        3585            -7.3%       3323 =C2=B1  5%  perf-stat.i.cpu-migra=
tions
>      180139 =C2=B1  2%      +4.2%     187668        perf-stat.i.minor-fau=
lts
>       69.13            +2.6       71.75        perf-stat.i.node-load-miss=
-rate%
>     4313695 =C2=B1  2%      -7.4%    3994957 =C2=B1  2%  perf-stat.i.node=
-load-misses
>     5466253 =C2=B1 11%     -17.3%    4521173 =C2=B1  6%  perf-stat.i.node=
-loads
>     2818674 =C2=B1  6%     -15.8%    2372542 =C2=B1  5%  perf-stat.i.node=
-stores
>      227810            +4.6%     238290        perf-stat.i.page-faults
>       12.67 =C2=B1  4%      -7.2%      11.76 =C2=B1  2%  perf-stat.overal=
l.MPKI
>        1.01 =C2=B1  4%      -0.0        0.97 =C2=B1  3%  perf-stat.overal=
l.branch-miss-rate%
>        1044           +13.1%       1181 =C2=B1  4%  perf-stat.overall.cyc=
les-between-cache-misses
>       40.37 =C2=B1  4%      +3.6       44.00 =C2=B1  2%  perf-stat.overal=
l.node-store-miss-rate%
>    36139526 =C2=B1  5%     -12.5%   31625519 =C2=B1  3%  perf-stat.ps.cac=
he-misses
>   2.566e+08 =C2=B1  5%      -6.9%  2.389e+08 =C2=B1  2%  perf-stat.ps.cac=
he-references
>        3562            -7.2%       3306 =C2=B1  5%  perf-stat.ps.cpu-migr=
ations
>      179088            +4.2%     186579        perf-stat.ps.minor-faults
>     4323383 =C2=B1  2%      -7.5%    3999214        perf-stat.ps.node-loa=
d-misses
>     5607721 =C2=B1 10%     -18.5%    4568664 =C2=B1  6%  perf-stat.ps.nod=
e-loads
>     2855134 =C2=B1  7%     -16.4%    2387345 =C2=B1  5%  perf-stat.ps.nod=
e-stores
>      226270            +4.6%     236709        perf-stat.ps.page-faults
>      242305 =C2=B1 10%     -42.4%     139551 =C2=B1 18%  numa-vmstat.node=
0.nr_active_anon
>      135983 =C2=B1 17%     -37.4%      85189 =C2=B1 10%  numa-vmstat.node=
0.nr_anon_pages
>      209.25 =C2=B1 16%     -38.1%     129.50 =C2=B1 10%  numa-vmstat.node=
0.nr_anon_transparent_hugepages
>      449367 =C2=B1  9%     -29.7%     315804 =C2=B1 20%  numa-vmstat.node=
0.nr_file_pages
>        2167 =C2=B1 90%     -80.6%     419.75 =C2=B1 98%  numa-vmstat.node=
0.nr_inactive_file
>      157405 =C2=B1  3%     -41.4%      92206 =C2=B1 35%  numa-vmstat.node=
0.nr_mapped
>        2022 =C2=B1 30%     -73.3%     539.25 =C2=B1 91%  numa-vmstat.node=
0.nr_mlock
>        3336 =C2=B1 10%     -24.3%       2524 =C2=B1 25%  numa-vmstat.node=
0.nr_page_table_pages
>      286158 =C2=B1 10%     -41.2%     168337 =C2=B1 37%  numa-vmstat.node=
0.nr_shmem
>       45493 =C2=B1  5%     -14.1%      39094 =C2=B1  4%  numa-vmstat.node=
0.nr_slab_unreclaimable
>      242294 =C2=B1 10%     -42.4%     139547 =C2=B1 18%  numa-vmstat.node=
0.nr_zone_active_anon
>        2167 =C2=B1 90%     -80.6%     419.75 =C2=B1 98%  numa-vmstat.node=
0.nr_zone_inactive_file
>    54053924 =C2=B1  8%     -39.3%   32786242 =C2=B1 34%  numa-vmstat.node=
0.numa_hit
>    53929628 =C2=B1  8%     -39.5%   32619715 =C2=B1 34%  numa-vmstat.node=
0.numa_local
>        9701 =C2=B1107%    +136.9%      22985 =C2=B1 31%  numa-vmstat.node=
1.nr_active_file
>      202.50 =C2=B1 16%     -25.1%     151.75 =C2=B1 23%  numa-vmstat.node=
1.nr_anon_transparent_hugepages
>      284922 =C2=B1  7%     +43.3%     408195 =C2=B1 13%  numa-vmstat.node=
1.nr_file_pages
>       96002 =C2=B1 26%     +67.5%     160850 =C2=B1 17%  numa-vmstat.node=
1.nr_inactive_anon
>       68077 =C2=B1  2%     +90.3%     129533 =C2=B1 25%  numa-vmstat.node=
1.nr_mapped
>      138482 =C2=B1 15%     +79.2%     248100 =C2=B1 22%  numa-vmstat.node=
1.nr_shmem
>       37396 =C2=B1  3%     +23.3%      46094 =C2=B1  3%  numa-vmstat.node=
1.nr_slab_unreclaimable
>        9701 =C2=B1107%    +136.9%      22985 =C2=B1 31%  numa-vmstat.node=
1.nr_zone_active_file
>       96005 =C2=B1 26%     +67.5%     160846 =C2=B1 17%  numa-vmstat.node=
1.nr_zone_inactive_anon
>    23343661 =C2=B1 17%     +99.9%   46664267 =C2=B1 23%  numa-vmstat.node=
1.numa_hit
>    23248487 =C2=B1 17%    +100.5%   46610447 =C2=B1 23%  numa-vmstat.node=
1.numa_local
>      105745 =C2=B1 23%    +112.6%     224805 =C2=B1 24%  softirqs.CPU0.NE=
T_RX
>      133310 =C2=B1 36%     -45.3%      72987 =C2=B1 52%  softirqs.CPU1.NE=
T_RX
>      170110 =C2=B1 55%     -66.8%      56407 =C2=B1147%  softirqs.CPU11.N=
ET_RX
>       91465 =C2=B1 36%     -65.2%      31858 =C2=B1112%  softirqs.CPU13.N=
ET_RX
>      164491 =C2=B1 57%     -77.7%      36641 =C2=B1121%  softirqs.CPU15.N=
ET_RX
>      121069 =C2=B1 55%     -99.3%     816.75 =C2=B1 96%  softirqs.CPU17.N=
ET_RX
>       81019 =C2=B1  4%      -8.7%      73967 =C2=B1  4%  softirqs.CPU20.R=
CU
>       72143 =C2=B1 63%     -89.8%       7360 =C2=B1172%  softirqs.CPU22.N=
ET_RX
>      270663 =C2=B1 17%     -57.9%     113915 =C2=B1 45%  softirqs.CPU24.N=
ET_RX
>       20149 =C2=B1 76%    +474.1%     115680 =C2=B1 62%  softirqs.CPU26.N=
ET_RX
>       14033 =C2=B1 70%    +977.5%     151211 =C2=B1 75%  softirqs.CPU27.N=
ET_RX
>       27834 =C2=B1 94%    +476.1%     160357 =C2=B1 28%  softirqs.CPU28.N=
ET_RX
>       35346 =C2=B1 68%    +212.0%     110290 =C2=B1 30%  softirqs.CPU29.N=
ET_RX
>       34347 =C2=B1103%    +336.5%     149941 =C2=B1 32%  softirqs.CPU32.N=
ET_RX
>       70077 =C2=B1  3%     +10.8%      77624 =C2=B1  3%  softirqs.CPU34.R=
CU
>       36453 =C2=B1 84%    +339.6%     160253 =C2=B1 42%  softirqs.CPU36.N=
ET_RX
>       72367 =C2=B1  2%     +10.6%      80043        softirqs.CPU37.RCU
>       25239 =C2=B1118%    +267.7%      92799 =C2=B1 45%  softirqs.CPU38.N=
ET_RX
>        4995 =C2=B1170%   +1155.8%      62734 =C2=B1 62%  softirqs.CPU39.N=
ET_RX
>        4641 =C2=B1145%   +1611.3%      79432 =C2=B1 90%  softirqs.CPU42.N=
ET_RX
>        7192 =C2=B1 65%    +918.0%      73225 =C2=B1 66%  softirqs.CPU45.N=
ET_RX
>        1772 =C2=B1166%   +1837.4%      34344 =C2=B1 63%  softirqs.CPU46.N=
ET_RX
>       13149 =C2=B1 81%    +874.7%     128170 =C2=B1 58%  softirqs.CPU47.N=
ET_RX
>       86484 =C2=B1 94%     -92.6%       6357 =C2=B1172%  softirqs.CPU48.N=
ET_RX
>      129128 =C2=B1 27%     -95.8%       5434 =C2=B1172%  softirqs.CPU55.N=
ET_RX
>       82772 =C2=B1 59%     -91.7%       6891 =C2=B1164%  softirqs.CPU56.N=
ET_RX
>      145313 =C2=B1 57%     -87.8%      17796 =C2=B1 88%  softirqs.CPU57.N=
ET_RX
>      118160 =C2=B1 33%     -86.3%      16226 =C2=B1109%  softirqs.CPU58.N=
ET_RX
>       94576 =C2=B1 56%     -94.1%       5557 =C2=B1173%  softirqs.CPU6.NE=
T_RX
>       82900 =C2=B1 77%     -66.8%      27508 =C2=B1171%  softirqs.CPU62.N=
ET_RX
>      157291 =C2=B1 30%     -81.1%      29656 =C2=B1111%  softirqs.CPU64.N=
ET_RX
>      135101 =C2=B1 28%     -80.2%      26748 =C2=B1 90%  softirqs.CPU67.N=
ET_RX
>      146574 =C2=B1 56%    -100.0%      69.75 =C2=B1 98%  softirqs.CPU68.N=
ET_RX
>       81347 =C2=B1  2%      -9.0%      74024 =C2=B1  2%  softirqs.CPU68.R=
CU
>      201729 =C2=B1 37%     -99.6%     887.50 =C2=B1107%  softirqs.CPU69.N=
ET_RX
>      108454 =C2=B1 78%     -97.9%       2254 =C2=B1169%  softirqs.CPU70.N=
ET_RX
>       55289 =C2=B1104%     -89.3%       5942 =C2=B1172%  softirqs.CPU71.N=
ET_RX
>       10112 =C2=B1172%    +964.6%     107651 =C2=B1 89%  softirqs.CPU72.N=
ET_RX
>        3136 =C2=B1171%   +1522.2%      50879 =C2=B1 66%  softirqs.CPU73.N=
ET_RX
>       13353 =C2=B1 79%    +809.2%     121407 =C2=B1101%  softirqs.CPU74.N=
ET_RX
>       75194 =C2=B1  3%     +10.3%      82957 =C2=B1  5%  softirqs.CPU75.R=
CU
>       11002 =C2=B1173%   +1040.8%     125512 =C2=B1 61%  softirqs.CPU76.N=
ET_RX
>        2463 =C2=B1173%   +2567.3%      65708 =C2=B1 77%  softirqs.CPU78.N=
ET_RX
>       25956 =C2=B1  3%      -7.8%      23932 =C2=B1  3%  softirqs.CPU78.S=
CHED
>       16366 =C2=B1150%    +340.7%      72125 =C2=B1 91%  softirqs.CPU82.N=
ET_RX
>       14553 =C2=B1130%   +1513.4%     234809 =C2=B1 27%  softirqs.CPU93.N=
ET_RX
>       26314            -9.2%      23884 =C2=B1  3%  softirqs.CPU93.SCHED
>        4582 =C2=B1 88%   +4903.4%     229268 =C2=B1 23%  softirqs.CPU94.N=
ET_RX
>       11214 =C2=B1111%   +1762.5%     208867 =C2=B1 18%  softirqs.CPU95.N=
ET_RX
>        1.53 =C2=B1 27%      -0.5        0.99 =C2=B1 17%  perf-profile.cal=
ltrace.cycles-pp.exit_to_usermode_loop.do_syscall_64.entry_SYSCALL_64_after=
_hwframe
>        1.52 =C2=B1 27%      -0.5        0.99 =C2=B1 17%  perf-profile.cal=
ltrace.cycles-pp.do_signal.exit_to_usermode_loop.do_syscall_64.entry_SYSCAL=
L_64_after_hwframe
>        1.39 =C2=B1 29%      -0.5        0.88 =C2=B1 21%  perf-profile.cal=
ltrace.cycles-pp.do_group_exit.get_signal.do_signal.exit_to_usermode_loop.d=
o_syscall_64
>        1.39 =C2=B1 29%      -0.5        0.88 =C2=B1 21%  perf-profile.cal=
ltrace.cycles-pp.get_signal.do_signal.exit_to_usermode_loop.do_syscall_64.e=
ntry_SYSCALL_64_after_hwframe
>        0.50 =C2=B1 59%      +0.3        0.81 =C2=B1 13%  perf-profile.cal=
ltrace.cycles-pp.filemap_map_pages.handle_pte_fault.__handle_mm_fault.handl=
e_mm_fault.do_page_fault
>        5.70 =C2=B1  9%      +0.8        6.47 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.do_exit.do_group_exit.get_signal.do_signal.exit_to_usermod=
e_loop
>        5.48 =C2=B1  9%      +0.8        6.27 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.exit_mmap.mmput.do_exit.do_group_exit.get_signal
>        5.49 =C2=B1  9%      +0.8        6.28 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.mmput.do_exit.do_group_exit.get_signal.do_signal
>        4.30 =C2=B1  4%      +1.3        5.60 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.do_group_exit.get_signal.do_signal.exit_to_usermode_loop.p=
repare_exit_to_usermode
>        4.40 =C2=B1  4%      +1.3        5.69 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.prepare_exit_to_usermode.swapgs_restore_regs_and_return_to=
_usermode
>        4.37 =C2=B1  4%      +1.3        5.66 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.exit_to_usermode_loop.prepare_exit_to_usermode.swapgs_rest=
ore_regs_and_return_to_usermode
>        4.36 =C2=B1  4%      +1.3        5.66 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.do_signal.exit_to_usermode_loop.prepare_exit_to_usermode.s=
wapgs_restore_regs_and_return_to_usermode
>        4.33 =C2=B1  4%      +1.3        5.62 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.get_signal.do_signal.exit_to_usermode_loop.prepare_exit_to=
_usermode.swapgs_restore_regs_and_return_to_usermode
>        4.44 =C2=B1  4%      +1.3        5.74 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.swapgs_restore_regs_and_return_to_usermode
>        3.20 =C2=B1 10%      -2.4        0.78 =C2=B1156%  perf-profile.chi=
ldren.cycles-pp.copy_page
>        0.16 =C2=B1  9%      -0.1        0.08 =C2=B1 64%  perf-profile.chi=
ldren.cycles-pp.irq_work_interrupt
>        0.16 =C2=B1  9%      -0.1        0.08 =C2=B1 64%  perf-profile.chi=
ldren.cycles-pp.smp_irq_work_interrupt
>        0.24 =C2=B1  5%      -0.1        0.17 =C2=B1 18%  perf-profile.chi=
ldren.cycles-pp.irq_work_run_list
>        0.16 =C2=B1  9%      -0.1        0.10 =C2=B1 24%  perf-profile.chi=
ldren.cycles-pp.irq_work_run
>        0.16 =C2=B1  9%      -0.1        0.10 =C2=B1 24%  perf-profile.chi=
ldren.cycles-pp.printk
>        0.23 =C2=B1  6%      -0.1        0.17 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.__do_execve_file
>        0.08 =C2=B1 14%      -0.1        0.03 =C2=B1100%  perf-profile.chi=
ldren.cycles-pp.delay_tsc
>        0.16 =C2=B1  6%      -0.1        0.11 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.load_elf_binary
>        0.16 =C2=B1  7%      -0.0        0.12 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.search_binary_handler
>        0.20 =C2=B1  7%      -0.0        0.15 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.call_usermodehelper_exec_async
>        0.19 =C2=B1  6%      -0.0        0.15 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.do_execve
>        0.08 =C2=B1 10%      -0.0        0.04 =C2=B1 59%  perf-profile.chi=
ldren.cycles-pp.__vunmap
>        0.15 =C2=B1  3%      -0.0        0.11 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.rcu_idle_exit
>        0.12 =C2=B1 10%      -0.0        0.09 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.__switch_to_asm
>        0.09 =C2=B1 13%      -0.0        0.07 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.des3_ede_encrypt
>        0.06 =C2=B1 11%      +0.0        0.09 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.mark_page_accessed
>        0.15 =C2=B1  5%      +0.0        0.19 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.apparmor_cred_prepare
>        0.22 =C2=B1  8%      +0.0        0.27 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.mem_cgroup_throttle_swaprate
>        0.17 =C2=B1  2%      +0.0        0.22 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.security_prepare_creds
>        0.95 =C2=B1 17%      +0.3        1.22 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.filemap_map_pages
>        5.92 =C2=B1  8%      +0.7        6.65 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.get_signal
>        5.66 =C2=B1  9%      +0.8        6.44 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.mmput
>        5.65 =C2=B1  9%      +0.8        6.43 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.exit_mmap
>        4.40 =C2=B1  4%      +1.3        5.70 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.prepare_exit_to_usermode
>        4.45 =C2=B1  4%      +1.3        5.75 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.swapgs_restore_regs_and_return_to_usermode
>        3.16 =C2=B1 10%      -2.4        0.77 =C2=B1155%  perf-profile.sel=
f.cycles-pp.copy_page
>        0.08 =C2=B1 14%      -0.1        0.03 =C2=B1100%  perf-profile.sel=
f.cycles-pp.delay_tsc
>        0.12 =C2=B1 10%      -0.0        0.09 =C2=B1 14%  perf-profile.sel=
f.cycles-pp.__switch_to_asm
>        0.08 =C2=B1 12%      -0.0        0.06 =C2=B1 17%  perf-profile.sel=
f.cycles-pp.enqueue_task_fair
>        0.09 =C2=B1 13%      -0.0        0.07 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.des3_ede_encrypt
>        0.07 =C2=B1 13%      +0.0        0.08 =C2=B1 19%  perf-profile.sel=
f.cycles-pp.__lru_cache_add
>        0.19 =C2=B1  9%      +0.0        0.22 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.mem_cgroup_throttle_swaprate
>        0.15 =C2=B1  5%      +0.0        0.19 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.apparmor_cred_prepare
>        0.05 =C2=B1 58%      +0.0        0.09 =C2=B1 13%  perf-profile.sel=
f.cycles-pp.mark_page_accessed
>        0.58 =C2=B1 10%      +0.2        0.80 =C2=B1 20%  perf-profile.sel=
f.cycles-pp.release_pages
>        0.75 =C2=B1173%  +1.3e+05%       1005 =C2=B1100%  interrupts.127:P=
CI-MSI.31981660-edge.i40e-eth0-TxRx-91
>      820.75 =C2=B1111%     -99.9%       0.50 =C2=B1173%  interrupts.47:PC=
I-MSI.31981580-edge.i40e-eth0-TxRx-11
>      449.25 =C2=B1 86%    -100.0%       0.00        interrupts.53:PCI-MSI=
.31981586-edge.i40e-eth0-TxRx-17
>       33.25 =C2=B1157%    -100.0%       0.00        interrupts.57:PCI-MSI=
.31981590-edge.i40e-eth0-TxRx-21
>        0.75 =C2=B1110%  +63533.3%     477.25 =C2=B1162%  interrupts.61:PC=
I-MSI.31981594-edge.i40e-eth0-TxRx-25
>      561.50 =C2=B1160%    -100.0%       0.00        interrupts.65:PCI-MSI=
.31981598-edge.i40e-eth0-TxRx-29
>       82921 =C2=B1  8%     -11.1%      73748 =C2=B1  6%  interrupts.CPU11=
.CAL:Function_call_interrupts
>       66509 =C2=B1 30%     -32.6%      44828 =C2=B1  8%  interrupts.CPU14=
.TLB:TLB_shootdowns
>       43105 =C2=B1 98%     -90.3%       4183 =C2=B1 21%  interrupts.CPU17=
.RES:Rescheduling_interrupts
>      148719 =C2=B1 70%     -69.4%      45471 =C2=B1 16%  interrupts.CPU17=
.TLB:TLB_shootdowns
>       85589 =C2=B1 42%     -52.2%      40884 =C2=B1  5%  interrupts.CPU20=
.TLB:TLB_shootdowns
>      222472 =C2=B1 41%     -98.0%       4360 =C2=B1 45%  interrupts.CPU22=
.RES:Rescheduling_interrupts
>        0.50 =C2=B1173%  +95350.0%     477.25 =C2=B1162%  interrupts.CPU25=
.61:PCI-MSI.31981594-edge.i40e-eth0-TxRx-25
>       76029 =C2=B1 10%     +14.9%      87389 =C2=B1  5%  interrupts.CPU25=
.CAL:Function_call_interrupts
>      399042 =C2=B1  6%     +13.4%     452479 =C2=B1  8%  interrupts.CPU27=
.LOC:Local_timer_interrupts
>      561.00 =C2=B1161%    -100.0%       0.00        interrupts.CPU29.65:P=
CI-MSI.31981598-edge.i40e-eth0-TxRx-29
>        7034 =C2=B1 46%   +1083.8%      83279 =C2=B1138%  interrupts.CPU29=
.RES:Rescheduling_interrupts
>       17829 =C2=B1 99%     -71.0%       5172 =C2=B1 16%  interrupts.CPU30=
.RES:Rescheduling_interrupts
>        5569 =C2=B1 15%   +2414.7%     140059 =C2=B1 94%  interrupts.CPU31=
.RES:Rescheduling_interrupts
>       37674 =C2=B1 16%     +36.6%      51473 =C2=B1 25%  interrupts.CPU31=
.TLB:TLB_shootdowns
>       47905 =C2=B1 39%     +76.6%      84583 =C2=B1 38%  interrupts.CPU34=
.TLB:TLB_shootdowns
>      568.75 =C2=B1140%    +224.8%       1847 =C2=B1 90%  interrupts.CPU36=
.NMI:Non-maskable_interrupts
>      568.75 =C2=B1140%    +224.8%       1847 =C2=B1 90%  interrupts.CPU36=
.PMI:Performance_monitoring_interrupts
>        4236 =C2=B1 25%   +2168.5%      96092 =C2=B1 90%  interrupts.CPU36=
.RES:Rescheduling_interrupts
>       52717 =C2=B1 27%     +43.3%      75565 =C2=B1 28%  interrupts.CPU37=
.TLB:TLB_shootdowns
>       41418 =C2=B1  9%    +136.6%      98010 =C2=B1 50%  interrupts.CPU39=
.TLB:TLB_shootdowns
>        5551 =C2=B1  8%    +847.8%      52615 =C2=B1 66%  interrupts.CPU40=
.RES:Rescheduling_interrupts
>        4746 =C2=B1 25%    +865.9%      45841 =C2=B1 91%  interrupts.CPU42=
.RES:Rescheduling_interrupts
>       37556 =C2=B1 11%     +24.6%      46808 =C2=B1  6%  interrupts.CPU42=
.TLB:TLB_shootdowns
>       21846 =C2=B1124%     -84.4%       3415 =C2=B1 46%  interrupts.CPU48=
.RES:Rescheduling_interrupts
>      891.50 =C2=B1 22%     -35.2%     577.25 =C2=B1 40%  interrupts.CPU49=
.NMI:Non-maskable_interrupts
>      891.50 =C2=B1 22%     -35.2%     577.25 =C2=B1 40%  interrupts.CPU49=
.PMI:Performance_monitoring_interrupts
>       20459 =C2=B1120%     -79.2%       4263 =C2=B1 14%  interrupts.CPU49=
.RES:Rescheduling_interrupts
>       59840 =C2=B1 21%     -23.1%      46042 =C2=B1 16%  interrupts.CPU5.=
TLB:TLB_shootdowns
>       65200 =C2=B1 19%     -34.5%      42678 =C2=B1  9%  interrupts.CPU51=
.TLB:TLB_shootdowns
>       70923 =C2=B1153%     -94.0%       4270 =C2=B1 29%  interrupts.CPU53=
.RES:Rescheduling_interrupts
>       65312 =C2=B1 22%     -28.7%      46578 =C2=B1 14%  interrupts.CPU56=
.TLB:TLB_shootdowns
>       65828 =C2=B1 24%     -33.4%      43846 =C2=B1  4%  interrupts.CPU59=
.TLB:TLB_shootdowns
>       72558 =C2=B1156%     -93.2%       4906 =C2=B1  9%  interrupts.CPU6.=
RES:Rescheduling_interrupts
>       68698 =C2=B1 34%     -32.6%      46327 =C2=B1 18%  interrupts.CPU61=
.TLB:TLB_shootdowns
>      109745 =C2=B1 44%     -57.4%      46711 =C2=B1 16%  interrupts.CPU62=
.TLB:TLB_shootdowns
>       89714 =C2=B1 44%     -48.5%      46198 =C2=B1  7%  interrupts.CPU63=
.TLB:TLB_shootdowns
>       59380 =C2=B1136%     -91.5%       5066 =C2=B1 13%  interrupts.CPU69=
.RES:Rescheduling_interrupts
>       40094 =C2=B1 18%    +133.9%      93798 =C2=B1 44%  interrupts.CPU78=
.TLB:TLB_shootdowns
>      129884 =C2=B1 72%     -55.3%      58034 =C2=B1157%  interrupts.CPU8.=
RES:Rescheduling_interrupts
>       69984 =C2=B1 11%     +51.4%     105957 =C2=B1 20%  interrupts.CPU80=
.CAL:Function_call_interrupts
>       32857 =C2=B1 10%    +128.7%      75131 =C2=B1 36%  interrupts.CPU80=
.TLB:TLB_shootdowns
>       35726 =C2=B1 16%     +34.6%      48081 =C2=B1 12%  interrupts.CPU82=
.TLB:TLB_shootdowns
>       73820 =C2=B1 17%     +28.2%      94643 =C2=B1  8%  interrupts.CPU84=
.CAL:Function_call_interrupts
>       38829 =C2=B1 28%    +190.3%     112736 =C2=B1 42%  interrupts.CPU84=
.TLB:TLB_shootdowns
>       36129 =C2=B1  4%     +47.6%      53329 =C2=B1 13%  interrupts.CPU85=
.TLB:TLB_shootdowns
>        4693 =C2=B1  7%   +1323.0%      66793 =C2=B1145%  interrupts.CPU86=
.RES:Rescheduling_interrupts
>       38003 =C2=B1 11%     +94.8%      74031 =C2=B1 43%  interrupts.CPU86=
.TLB:TLB_shootdowns
>       78022 =C2=B1  3%      +7.9%      84210 =C2=B1  3%  interrupts.CPU87=
.CAL:Function_call_interrupts
>       36359 =C2=B1  6%     +54.9%      56304 =C2=B1 48%  interrupts.CPU88=
.TLB:TLB_shootdowns
>       89031 =C2=B1105%     -95.0%       4475 =C2=B1 40%  interrupts.CPU9.=
RES:Rescheduling_interrupts
>       40085 =C2=B1 11%     +60.6%      64368 =C2=B1 27%  interrupts.CPU91=
.TLB:TLB_shootdowns
>       42244 =C2=B1 10%     +44.8%      61162 =C2=B1 35%  interrupts.CPU94=
.TLB:TLB_shootdowns
>       40959 =C2=B1 15%    +109.4%      85780 =C2=B1 41%  interrupts.CPU95=
.TLB:TLB_shootdowns
> =

> =

>                                                                          =
        =

>                                  stress-ng.fiemap.ops
>                                                                          =
        =

>    80000 +---------------------------------------------------------------=
----+
>    75000 |..+.             .+..            .+..+..  .+.  .+..            =
    |
>          |    +..+..+..+.+.     .+..+..  .+       +.   +.    +.+..+..+..+=
.+..|
>    70000 |-+                   +       +.                                =
    |
>    65000 |-+                                                             =
    |
>    60000 |-+                                                             =
    |
>    55000 |-+                                                             =
    |
>          |                                                               =
    |
>    50000 |-+                                                             =
    |
>    45000 |-+                                                             =
    |
>    40000 |-+                                                             =
    |
>    35000 |-+                O                                            =
    |
>          |  O       O                       O     O    O                 =
    |
>    30000 |-+  O  O     O O     O O     O  O    O     O    O  O O  O  O  O=
 O  |
>    25000 +---------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                              stress-ng.fiemap.ops_per_sec
>                                                                          =
        =

>    80000 +---------------------------------------------------------------=
----+
>    75000 |..               .+..               .+..                       =
    |
>          |  +.  .+..+..+.+.     .+..+..  .+.+.    +..+.+..+..+.+..+..+..+=
.+..|
>    70000 |-+  +.               +       +.                                =
    |
>    65000 |-+                                                             =
    |
>    60000 |-+                                                             =
    |
>    55000 |-+                                                             =
    |
>          |                                                               =
    |
>    50000 |-+                                                             =
    |
>    45000 |-+                                                             =
    |
>    40000 |-+                                                             =
    |
>    35000 |-+                O                                            =
    |
>          |  O       O                       O     O                      =
    |
>    30000 |-+  O  O     O O     O O     O       O     O O  O  O    O  O  O=
 O  |
>    25000 +---------------------------------------------------------------=
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
--===============0295311298100867147==--

