Content-Type: multipart/mixed; boundary="===============1408977320261127584=="
MIME-Version: 1.0
From: Hugh Dickins <hughd@google.com>
To: lkp@lists.01.org
Subject: Re: [huge tmpfs] d7c7d56ca6: vm-scalability.throughput -5.5% regression
Date: Tue, 12 Apr 2016 22:30:36 -0700
Message-ID: <alpine.LSU.2.11.1604122217550.13068@eggly.anvils>
In-Reply-To: <20160413015427.GC659@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============1408977320261127584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Apr 2016, kernel test robot wrote:

> FYI, we noticed that vm-scalability.throughput -5.5% regression on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit d7c7d56ca61aec18e5e0cb3a64e50073c42195f7 ("huge tmpfs: avoid prema=
ture exposure of new pagetable")

Very useful info, thank you.  I presume it confirms exactly what Kirill
warned me of, that doing the map_pages after instead of before the fault,
comes with a performance disadvantage.  I shall look into it, but not
immediately (and we know other reasons why that patch has to be revisited).

Hugh

> =

> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcase:
>   gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/300s/lkp-h=
sw01/lru-file-mmap-read-rand/vm-scalability
> =

> commit: =

>   517348161d2725b8b596feb10c813bf596dc6a47
>   d7c7d56ca61aec18e5e0cb3a64e50073c42195f7
> =

> 517348161d2725b8 d7c7d56ca61aec18e5e0cb3a64 =

> ---------------- -------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>    1801726 =C2=B1  0%      -5.5%    1702808 =C2=B1  0%  vm-scalability.th=
roughput
>     317.89 =C2=B1  0%      +2.9%     327.15 =C2=B1  0%  vm-scalability.ti=
me.elapsed_time
>     317.89 =C2=B1  0%      +2.9%     327.15 =C2=B1  0%  vm-scalability.ti=
me.elapsed_time.max
>     872240 =C2=B1  4%      +8.5%     946467 =C2=B1  1%  vm-scalability.ti=
me.involuntary_context_switches
>   6.73e+08 =C2=B1  0%     -92.5%   50568722 =C2=B1  0%  vm-scalability.ti=
me.major_page_faults
>    2109093 =C2=B1  9%     -25.8%    1564815 =C2=B1  7%  vm-scalability.ti=
me.maximum_resident_set_size
>      37881 =C2=B1  0%    +586.9%     260194 =C2=B1  0%  vm-scalability.ti=
me.minor_page_faults
>       5087 =C2=B1  0%      +3.7%       5277 =C2=B1  0%  vm-scalability.ti=
me.percent_of_cpu_this_job_got
>      16047 =C2=B1  0%      +7.5%      17252 =C2=B1  0%  vm-scalability.ti=
me.system_time
>     127.19 =C2=B1  0%     -88.3%      14.93 =C2=B1  1%  vm-scalability.ti=
me.user_time
>      72572 =C2=B1  7%     +56.0%     113203 =C2=B1  3%  cpuidle.C1-HSW.us=
age
>  9.879e+08 =C2=B1  4%     -32.5%   6.67e+08 =C2=B1  8%  cpuidle.C6-HSW.ti=
me
>     605545 =C2=B1  3%     -12.9%     527295 =C2=B1  1%  softirqs.RCU
>     164170 =C2=B1  7%     +20.5%     197881 =C2=B1  6%  softirqs.SCHED
>    2584429 =C2=B1  3%     -25.5%    1925241 =C2=B1  2%  vmstat.memory.free
>     252507 =C2=B1  0%     +36.2%     343994 =C2=B1  0%  vmstat.system.in
>  2.852e+08 =C2=B1  5%    +163.9%  7.527e+08 =C2=B1  1%  numa-numastat.nod=
e0.local_node
>  2.852e+08 =C2=B1  5%    +163.9%  7.527e+08 =C2=B1  1%  numa-numastat.nod=
e0.numa_hit
>  2.876e+08 =C2=B1  6%    +162.8%  7.559e+08 =C2=B1  0%  numa-numastat.nod=
e1.local_node
>  2.876e+08 =C2=B1  6%    +162.8%  7.559e+08 =C2=B1  0%  numa-numastat.nod=
e1.numa_hit
>   6.73e+08 =C2=B1  0%     -92.5%   50568722 =C2=B1  0%  time.major_page_f=
aults
>    2109093 =C2=B1  9%     -25.8%    1564815 =C2=B1  7%  time.maximum_resi=
dent_set_size
>      37881 =C2=B1  0%    +586.9%     260194 =C2=B1  0%  time.minor_page_f=
aults
>     127.19 =C2=B1  0%     -88.3%      14.93 =C2=B1  1%  time.user_time
>      94.37 =C2=B1  0%      +2.0%      96.27 =C2=B1  0%  turbostat.%Busy
>       2919 =C2=B1  0%      +2.0%       2977 =C2=B1  0%  turbostat.Avg_MHz
>       5.12 =C2=B1  4%     -38.7%       3.14 =C2=B1  5%  turbostat.CPU%c6
>       2.00 =C2=B1 13%     -44.8%       1.10 =C2=B1 22%  turbostat.Pkg%pc2
>     240.00 =C2=B1  0%      +4.2%     250.14 =C2=B1  0%  turbostat.PkgWatt
>      55.36 =C2=B1  3%     +16.3%      64.40 =C2=B1  2%  turbostat.RAMWatt
>      17609 =C2=B1103%     -59.4%       7148 =C2=B1 72%  latency_stats.avg=
.pipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
>      63966 =C2=B1152%     -68.4%      20204 =C2=B1 64%  latency_stats.max=
.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
>     299681 =C2=B1123%     -89.7%      30889 =C2=B1 13%  latency_stats.max=
.pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
>       0.00 =C2=B1 -1%      +Inf%      35893 =C2=B1 10%  latency_stats.max=
.wait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.do=
_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
>      90871 =C2=B1125%     -56.2%      39835 =C2=B1 74%  latency_stats.sum=
.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
>      61821 =C2=B1 22%     -86.6%       8254 =C2=B1 62%  latency_stats.sum=
.sigsuspend.SyS_rt_sigsuspend.entry_SYSCALL_64_fastpath
>       0.00 =C2=B1 -1%      +Inf%      59392 =C2=B1118%  latency_stats.sum=
.throttle_direct_reclaim.try_to_free_pages.__alloc_pages_nodemask.alloc_pag=
es_current.__page_cache_alloc.__do_page_cache_readahead.filemap_fault.xfs_f=
ilemap_fault.__do_fault.do_fault.handle_mm_fault.__do_page_fault
>       0.00 =C2=B1 -1%      +Inf%    1549096 =C2=B1 24%  latency_stats.sum=
.wait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.do=
_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
>     639.30 =C2=B1  8%     -38.8%     391.40 =C2=B1  6%  slabinfo.RAW.acti=
ve_objs
>     639.30 =C2=B1  8%     -38.8%     391.40 =C2=B1  6%  slabinfo.RAW.num_=
objs
>     555.90 =C2=B1 14%     -50.7%     274.10 =C2=B1 36%  slabinfo.nfs_comm=
it_data.active_objs
>     555.90 =C2=B1 14%     -50.7%     274.10 =C2=B1 36%  slabinfo.nfs_comm=
it_data.num_objs
>   10651978 =C2=B1  0%     -80.0%    2126718 =C2=B1  0%  slabinfo.radix_tr=
ee_node.active_objs
>     218915 =C2=B1  0%     -81.9%      39535 =C2=B1  0%  slabinfo.radix_tr=
ee_node.active_slabs
>   12259274 =C2=B1  0%     -81.9%    2213762 =C2=B1  0%  slabinfo.radix_tr=
ee_node.num_objs
>     218915 =C2=B1  0%     -81.9%      39535 =C2=B1  0%  slabinfo.radix_tr=
ee_node.num_slabs
>    8503640 =C2=B1  1%     -87.8%    1038681 =C2=B1  0%  meminfo.Active
>    8155208 =C2=B1  1%     -91.5%     692744 =C2=B1  0%  meminfo.Active(fi=
le)
>   47732497 =C2=B1  0%     +13.9%   54365008 =C2=B1  0%  meminfo.Cached
>   38794624 =C2=B1  0%     +36.4%   52899738 =C2=B1  0%  meminfo.Inactive
>   38748440 =C2=B1  0%     +36.4%   52853183 =C2=B1  0%  meminfo.Inactive(=
file)
>   45315491 =C2=B1  0%     -24.0%   34459599 =C2=B1  0%  meminfo.Mapped
>    2693407 =C2=B1  5%     -30.7%    1867438 =C2=B1  3%  meminfo.MemFree
>    7048370 =C2=B1  0%     -81.5%    1303216 =C2=B1  0%  meminfo.SReclaima=
ble
>    7145508 =C2=B1  0%     -80.4%    1400313 =C2=B1  0%  meminfo.Slab
>    4168849 =C2=B1  2%     -88.1%     496040 =C2=B1 27%  numa-meminfo.node=
0.Active
>    3987391 =C2=B1  1%     -91.3%     346768 =C2=B1  0%  numa-meminfo.node=
0.Active(file)
>   23809283 =C2=B1  0%     +13.8%   27087077 =C2=B1  0%  numa-meminfo.node=
0.FilePages
>   19423374 =C2=B1  0%     +35.8%   26379857 =C2=B1  0%  numa-meminfo.node=
0.Inactive
>   19402281 =C2=B1  0%     +35.8%   26356354 =C2=B1  0%  numa-meminfo.node=
0.Inactive(file)
>   22594121 =C2=B1  0%     -24.1%   17153129 =C2=B1  0%  numa-meminfo.node=
0.Mapped
>    1430871 =C2=B1  5%     -31.2%     984861 =C2=B1  2%  numa-meminfo.node=
0.MemFree
>    3457483 =C2=B1  1%     -81.4%     642147 =C2=B1  0%  numa-meminfo.node=
0.SReclaimable
>    3507005 =C2=B1  1%     -80.3%     692577 =C2=B1  0%  numa-meminfo.node=
0.Slab
>    4349443 =C2=B1  3%     -87.5%     543711 =C2=B1 24%  numa-meminfo.node=
1.Active
>    4181422 =C2=B1  3%     -91.7%     346861 =C2=B1  1%  numa-meminfo.node=
1.Active(file)
>   23896184 =C2=B1  0%     +14.2%   27287954 =C2=B1  0%  numa-meminfo.node=
1.FilePages
>   19329324 =C2=B1  0%     +37.2%   26528591 =C2=B1  0%  numa-meminfo.node=
1.Inactive
>   19304364 =C2=B1  0%     +37.3%   26505692 =C2=B1  0%  numa-meminfo.node=
1.Inactive(file)
>   22671758 =C2=B1  0%     -23.7%   17303673 =C2=B1  0%  numa-meminfo.node=
1.Mapped
>    1299430 =C2=B1  7%     -32.8%     873435 =C2=B1  6%  numa-meminfo.node=
1.MemFree
>    3589265 =C2=B1  1%     -81.6%     661650 =C2=B1  0%  numa-meminfo.node=
1.SReclaimable
>    3636880 =C2=B1  1%     -80.5%     708315 =C2=B1  0%  numa-meminfo.node=
1.Slab
>     994864 =C2=B1  1%     -91.3%      86711 =C2=B1  0%  numa-vmstat.node0=
.nr_active_file
>    5952715 =C2=B1  0%     +13.8%    6773427 =C2=B1  0%  numa-vmstat.node0=
.nr_file_pages
>     356982 =C2=B1  5%     -31.5%     244513 =C2=B1  3%  numa-vmstat.node0=
.nr_free_pages
>    4853127 =C2=B1  0%     +35.8%    6590709 =C2=B1  0%  numa-vmstat.node0=
.nr_inactive_file
>     394.70 =C2=B1 15%     -62.9%     146.60 =C2=B1 32%  numa-vmstat.node0=
.nr_isolated_file
>    5649360 =C2=B1  0%     -24.1%    4288873 =C2=B1  0%  numa-vmstat.node0=
.nr_mapped
>      28030 =C2=B1 53%     -97.7%     648.30 =C2=B1 10%  numa-vmstat.node0=
.nr_pages_scanned
>     864516 =C2=B1  1%     -81.4%     160512 =C2=B1  0%  numa-vmstat.node0=
.nr_slab_reclaimable
>  1.522e+08 =C2=B1  4%    +155.9%  3.893e+08 =C2=B1  1%  numa-vmstat.node0=
.numa_hit
>  1.521e+08 =C2=B1  4%    +155.9%  3.893e+08 =C2=B1  1%  numa-vmstat.node0=
.numa_local
>     217926 =C2=B1  3%     -84.4%      33949 =C2=B1  2%  numa-vmstat.node0=
.workingset_activate
>   60138428 =C2=B1  2%     -72.5%   16533446 =C2=B1  0%  numa-vmstat.node0=
.workingset_nodereclaim
>    4367580 =C2=B1  3%    +158.4%   11285489 =C2=B1  1%  numa-vmstat.node0=
.workingset_refault
>    1043245 =C2=B1  3%     -91.7%      86749 =C2=B1  1%  numa-vmstat.node1=
.nr_active_file
>    5974941 =C2=B1  0%     +14.2%    6823255 =C2=B1  0%  numa-vmstat.node1=
.nr_file_pages
>     323798 =C2=B1  7%     -33.0%     216945 =C2=B1  5%  numa-vmstat.node1=
.nr_free_pages
>    4829122 =C2=B1  1%     +37.2%    6627644 =C2=B1  0%  numa-vmstat.node1=
.nr_inactive_file
>     395.80 =C2=B1  8%     -68.5%     124.80 =C2=B1 46%  numa-vmstat.node1=
.nr_isolated_file
>    5669082 =C2=B1  0%     -23.7%    4326551 =C2=B1  0%  numa-vmstat.node1=
.nr_mapped
>      32004 =C2=B1 60%     -99.9%      47.00 =C2=B1  9%  numa-vmstat.node1=
.nr_pages_scanned
>     897351 =C2=B1  1%     -81.6%     165406 =C2=B1  0%  numa-vmstat.node1=
.nr_slab_reclaimable
>  1.535e+08 =C2=B1  4%    +154.6%  3.909e+08 =C2=B1  0%  numa-vmstat.node1=
.numa_hit
>  1.535e+08 =C2=B1  4%    +154.7%  3.909e+08 =C2=B1  0%  numa-vmstat.node1=
.numa_local
>     235134 =C2=B1  5%     -85.7%      33507 =C2=B1  2%  numa-vmstat.node1=
.workingset_activate
>   59647268 =C2=B1  1%     -72.1%   16626347 =C2=B1  0%  numa-vmstat.node1=
.workingset_nodereclaim
>    4535102 =C2=B1  4%    +151.1%   11389137 =C2=B1  0%  numa-vmstat.node1=
.workingset_refault
>     347641 =C2=B1 13%     +97.0%     684832 =C2=B1  0%  proc-vmstat.alloc=
stall
>       7738 =C2=B1  9%    +236.5%      26042 =C2=B1  0%  proc-vmstat.kswap=
d_low_wmark_hit_quickly
>    2041367 =C2=B1  1%     -91.5%     173206 =C2=B1  0%  proc-vmstat.nr_ac=
tive_file
>    1233230 =C2=B1  0%     +11.7%    1378011 =C2=B1  0%  proc-vmstat.nr_di=
rty_background_threshold
>    2466460 =C2=B1  0%     +11.7%    2756024 =C2=B1  0%  proc-vmstat.nr_di=
rty_threshold
>   11933740 =C2=B1  0%     +13.9%   13594909 =C2=B1  0%  proc-vmstat.nr_fi=
le_pages
>     671934 =C2=B1  5%     -31.1%     463093 =C2=B1  3%  proc-vmstat.nr_fr=
ee_pages
>    9685062 =C2=B1  0%     +36.5%   13216819 =C2=B1  0%  proc-vmstat.nr_in=
active_file
>     792.80 =C2=B1 10%     -67.9%     254.20 =C2=B1 34%  proc-vmstat.nr_is=
olated_file
>   11327952 =C2=B1  0%     -23.9%    8616859 =C2=B1  0%  proc-vmstat.nr_ma=
pped
>      73994 =C2=B1 51%     -99.1%     657.00 =C2=B1  7%  proc-vmstat.nr_pa=
ges_scanned
>    1762423 =C2=B1  0%     -81.5%     325807 =C2=B1  0%  proc-vmstat.nr_sl=
ab_reclaimable
>      72.30 =C2=B1 23%    +852.4%     688.60 =C2=B1 58%  proc-vmstat.nr_vm=
scan_immediate_reclaim
>       5392 =C2=B1  2%     -11.9%       4750 =C2=B1  2%  proc-vmstat.numa_=
hint_faults
>  5.728e+08 =C2=B1  5%    +163.4%  1.509e+09 =C2=B1  0%  proc-vmstat.numa_=
hit
>  5.728e+08 =C2=B1  5%    +163.4%  1.509e+09 =C2=B1  0%  proc-vmstat.numa_=
local
>       5638 =C2=B1  4%     -12.5%       4935 =C2=B1  3%  proc-vmstat.numa_=
pte_updates
>       8684 =C2=B1  8%    +215.8%      27427 =C2=B1  0%  proc-vmstat.pageo=
utrun
>    3220941 =C2=B1  0%     -90.2%     315751 =C2=B1  0%  proc-vmstat.pgact=
ivate
>   17739240 =C2=B1  1%    +143.6%   43217427 =C2=B1  0%  proc-vmstat.pgall=
oc_dma32
>    6.6e+08 =C2=B1  0%    +138.1%  1.572e+09 =C2=B1  0%  proc-vmstat.pgall=
oc_normal
>  6.737e+08 =C2=B1  0%     -92.4%   51517407 =C2=B1  0%  proc-vmstat.pgfau=
lt
>  6.767e+08 =C2=B1  0%    +138.5%  1.614e+09 =C2=B1  0%  proc-vmstat.pgfree
>   6.73e+08 =C2=B1  0%     -92.5%   50568722 =C2=B1  0%  proc-vmstat.pgmaj=
fault
>   31567471 =C2=B1  1%     +91.6%   60472288 =C2=B1  0%  proc-vmstat.pgsca=
n_direct_dma32
>  1.192e+09 =C2=B1  2%     +84.5%  2.199e+09 =C2=B1  0%  proc-vmstat.pgsca=
n_direct_normal
>   16309661 =C2=B1  0%    +150.4%   40841573 =C2=B1  0%  proc-vmstat.pgste=
al_direct_dma32
>  6.151e+08 =C2=B1  0%    +140.8%  1.481e+09 =C2=B1  0%  proc-vmstat.pgste=
al_direct_normal
>     939746 =C2=B1 18%    +101.3%    1891322 =C2=B1  6%  proc-vmstat.pgste=
al_kswapd_dma32
>   27432476 =C2=B1  4%    +162.4%   71970660 =C2=B1  2%  proc-vmstat.pgste=
al_kswapd_normal
>  4.802e+08 =C2=B1  5%     -81.5%   88655347 =C2=B1  0%  proc-vmstat.slabs=
_scanned
>     452671 =C2=B1  2%     -85.1%      67360 =C2=B1  1%  proc-vmstat.worki=
ngset_activate
>  1.198e+08 =C2=B1  1%     -72.4%   33135682 =C2=B1  0%  proc-vmstat.worki=
ngset_nodereclaim
>    8898128 =C2=B1  1%    +154.6%   22657102 =C2=B1  0%  proc-vmstat.worki=
ngset_refault
>     613962 =C2=B1 12%     -18.6%     499880 =C2=B1  9%  sched_debug.cfs_r=
q:/.min_vruntime.stddev
>      31.47 =C2=B1 38%    +203.5%      95.52 =C2=B1 29%  sched_debug.cfs_r=
q:/.nr_spread_over.max
>       6.19 =C2=B1 32%    +150.9%      15.53 =C2=B1 24%  sched_debug.cfs_r=
q:/.nr_spread_over.stddev
>      41.71 =C2=B1 51%     -42.3%      24.07 =C2=B1 12%  sched_debug.cfs_r=
q:/.runnable_load_avg.avg
>       1094 =C2=B1106%     -60.9%     427.95 =C2=B1 25%  sched_debug.cfs_r=
q:/.runnable_load_avg.max
>     163.22 =C2=B1 92%     -63.2%      60.09 =C2=B1 28%  sched_debug.cfs_r=
q:/.runnable_load_avg.stddev
>     613932 =C2=B1 12%     -18.6%     499833 =C2=B1  9%  sched_debug.cfs_r=
q:/.spread0.stddev
>      35.20 =C2=B1  8%     -29.1%      24.97 =C2=B1 11%  sched_debug.cpu.c=
pu_load[0].avg
>     731.80 =C2=B1 11%     -36.1%     467.45 =C2=B1 21%  sched_debug.cpu.c=
pu_load[0].max
>     116.23 =C2=B1 10%     -43.5%      65.72 =C2=B1 23%  sched_debug.cpu.c=
pu_load[0].stddev
>      35.25 =C2=B1  8%     -25.6%      26.23 =C2=B1 10%  sched_debug.cpu.c=
pu_load[1].avg
>     722.47 =C2=B1 10%     -30.2%     504.05 =C2=B1 18%  sched_debug.cpu.c=
pu_load[1].max
>     115.25 =C2=B1 10%     -38.5%      70.82 =C2=B1 19%  sched_debug.cpu.c=
pu_load[1].stddev
>      35.37 =C2=B1  8%     -22.4%      27.45 =C2=B1  8%  sched_debug.cpu.c=
pu_load[2].avg
>     721.90 =C2=B1  9%     -27.7%     521.60 =C2=B1 16%  sched_debug.cpu.c=
pu_load[2].max
>      10.85 =C2=B1 14%     +16.9%      12.68 =C2=B1  6%  sched_debug.cpu.c=
pu_load[2].min
>     114.93 =C2=B1  9%     -35.1%      74.62 =C2=B1 16%  sched_debug.cpu.c=
pu_load[2].stddev
>      35.20 =C2=B1  8%     -21.3%      27.70 =C2=B1  5%  sched_debug.cpu.c=
pu_load[3].avg
>     705.73 =C2=B1  9%     -29.6%     496.57 =C2=B1 13%  sched_debug.cpu.c=
pu_load[3].max
>      10.95 =C2=B1 13%     +18.7%      13.00 =C2=B1  4%  sched_debug.cpu.c=
pu_load[3].min
>     112.58 =C2=B1  9%     -34.8%      73.35 =C2=B1 12%  sched_debug.cpu.c=
pu_load[3].stddev
>      34.96 =C2=B1  8%     -21.7%      27.39 =C2=B1  5%  sched_debug.cpu.c=
pu_load[4].avg
>     684.63 =C2=B1 10%     -32.0%     465.83 =C2=B1 11%  sched_debug.cpu.c=
pu_load[4].max
>      11.10 =C2=B1 12%     +17.7%      13.07 =C2=B1  3%  sched_debug.cpu.c=
pu_load[4].min
>     110.03 =C2=B1  9%     -36.1%      70.28 =C2=B1 10%  sched_debug.cpu.c=
pu_load[4].stddev
>     293.58 =C2=B1 28%    +110.8%     618.85 =C2=B1 32%  sched_debug.cpu.c=
urr->pid.min
>      18739 =C2=B1  3%     +10.5%      20713 =C2=B1  1%  sched_debug.cpu.n=
r_switches.avg
>      33332 =C2=B1 10%     +21.0%      40337 =C2=B1  6%  sched_debug.cpu.n=
r_switches.max
>       4343 =C2=B1 10%     +34.8%       5852 =C2=B1  8%  sched_debug.cpu.n=
r_switches.stddev
>      19363 =C2=B1  3%      +9.2%      21136 =C2=B1  1%  sched_debug.cpu.s=
ched_count.avg
>      20.35 =C2=B1 17%     -31.5%      13.93 =C2=B1 22%  sched_debug.cpu.s=
ched_goidle.min
>       9245 =C2=B1  3%     +12.5%      10398 =C2=B1  0%  sched_debug.cpu.t=
twu_count.avg
>      16837 =C2=B1 10%     +27.0%      21390 =C2=B1  8%  sched_debug.cpu.t=
twu_count.max
>       2254 =C2=B1  8%     +39.5%       3143 =C2=B1  8%  sched_debug.cpu.t=
twu_count.stddev
>       8052 =C2=B1  4%     +16.2%       9353 =C2=B1  0%  sched_debug.cpu.t=
twu_local.avg
>       5846 =C2=B1  4%     +11.0%       6491 =C2=B1  2%  sched_debug.cpu.t=
twu_local.min
>       1847 =C2=B1 11%     +39.8%       2582 =C2=B1  8%  sched_debug.cpu.t=
twu_local.stddev
>       3.66 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es-pp.__add_to_page_cache_locked.add_to_page_cache_lru.filemap_fault.xfs_fi=
lemap_fault.__do_fault
>       0.00 =C2=B1 -1%      +Inf%       1.12 =C2=B1  0%  perf-profile.cycl=
es-pp.__add_to_page_cache_locked.add_to_page_cache_lru.mpage_readpages.xfs_=
vm_readpages.__do_page_cache_readahead
>       0.00 =C2=B1 -1%      +Inf%      77.72 =C2=B1  0%  perf-profile.cycl=
es-pp.__alloc_pages_nodemask.alloc_pages_current.__page_cache_alloc.__do_pa=
ge_cache_readahead.filemap_fault
>      79.28 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es-pp.__alloc_pages_nodemask.alloc_pages_current.__page_cache_alloc.filemap=
_fault.xfs_filemap_fault
>      11.43 =C2=B1  5%     -89.4%       1.21 =C2=B1  4%  perf-profile.cycl=
es-pp.__delete_from_page_cache.__remove_mapping.shrink_page_list.shrink_ina=
ctive_list.shrink_zone_memcg
>       0.00 =C2=B1 -1%      +Inf%      96.93 =C2=B1  0%  perf-profile.cycl=
es-pp.__do_fault.do_fault.handle_mm_fault.__do_page_fault.do_page_fault
>      91.04 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es-pp.__do_fault.handle_pte_fault.handle_mm_fault.__do_page_fault.do_page_f=
ault
>       0.00 =C2=B1 -1%      +Inf%      96.66 =C2=B1  0%  perf-profile.cycl=
es-pp.__do_page_cache_readahead.filemap_fault.xfs_filemap_fault.__do_fault.=
do_fault
>      29.86 =C2=B1  3%     -96.9%       0.92 =C2=B1 19%  perf-profile.cycl=
es-pp.__list_lru_walk_one.isra.3.list_lru_walk_one.scan_shadow_nodes.shrink=
_slab.shrink_zone
>       1.59 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es-pp.__lru_cache_add.lru_cache_add.add_to_page_cache_lru.filemap_fault.xfs=
_filemap_fault
>       0.00 =C2=B1 -1%      +Inf%       5.67 =C2=B1  5%  perf-profile.cycl=
es-pp.__lru_cache_add.lru_cache_add.add_to_page_cache_lru.mpage_readpages.x=
fs_vm_readpages
>       0.00 =C2=B1 -1%      +Inf%      78.11 =C2=B1  0%  perf-profile.cycl=
es-pp.__page_cache_alloc.__do_page_cache_readahead.filemap_fault.xfs_filema=
p_fault.__do_fault
>      79.40 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es-pp.__page_cache_alloc.filemap_fault.xfs_filemap_fault.__do_fault.handle_=
pte_fault
>       1.28 =C2=B1  4%     -38.7%       0.78 =C2=B1  1%  perf-profile.cycl=
es-pp.__radix_tree_lookup.__delete_from_page_cache.__remove_mapping.shrink_=
page_list.shrink_inactive_list
>      25.30 =C2=B1  6%     -84.2%       3.99 =C2=B1  5%  perf-profile.cycl=
es-pp.__remove_mapping.shrink_page_list.shrink_inactive_list.shrink_zone_me=
mcg.shrink_zone
>       0.56 =C2=B1  0%     +98.2%       1.11 =C2=B1  0%  perf-profile.cycl=
es-pp.__rmqueue.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_c=
urrent.__page_cache_alloc
>       0.00 =C2=B1 -1%      +Inf%       1.11 =C2=B1  0%  perf-profile.cycl=
es-pp.__xfs_get_blocks.xfs_get_blocks.do_mpage_readpage.mpage_readpages.xfs=
_vm_readpages
>       0.01 =C2=B1133%  +30254.3%       2.66 =C2=B1  8%  perf-profile.cycl=
es-pp._raw_spin_lock.free_pcppages_bulk.free_hot_cold_page.free_hot_cold_pa=
ge_list.shrink_page_list
>       5.07 =C2=B1 25%    +268.7%      18.71 =C2=B1  3%  perf-profile.cycl=
es-pp._raw_spin_lock.get_page_from_freelist.__alloc_pages_nodemask.alloc_pa=
ges_current.__page_cache_alloc
>       9.16 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es-pp._raw_spin_lock.list_lru_add.__delete_from_page_cache.__remove_mapping=
.shrink_page_list
>       0.69 =C2=B1 64%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es-pp._raw_spin_lock.list_lru_del.__add_to_page_cache_locked.add_to_page_ca=
che_lru.filemap_fault
>      27.69 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es-pp._raw_spin_lock.shadow_lru_isolate.__list_lru_walk_one.list_lru_walk_o=
ne.scan_shadow_nodes
>      10.77 =C2=B1 10%    +238.5%      36.45 =C2=B1  1%  perf-profile.cycl=
es-pp._raw_spin_lock_irq.shrink_inactive_list.shrink_zone_memcg.shrink_zone=
.do_try_to_free_pages
>       0.35 =C2=B1  9%    +193.4%       1.02 =C2=B1 13%  perf-profile.cycl=
es-pp._raw_spin_lock_irq.shrink_inactive_list.shrink_zone_memcg.shrink_zone=
.kswapd
>      12.86 =C2=B1  9%     -89.4%       1.36 =C2=B1 17%  perf-profile.cycl=
es-pp._raw_spin_lock_irqsave.__remove_mapping.shrink_page_list.shrink_inact=
ive_list.shrink_zone_memcg
>       1.11 =C2=B1 18%    +333.5%       4.83 =C2=B1  6%  perf-profile.cycl=
es-pp._raw_spin_lock_irqsave.pagevec_lru_move_fn.__lru_cache_add.lru_cache_=
add.add_to_page_cache_lru
>       5.38 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es-pp.add_to_page_cache_lru.filemap_fault.xfs_filemap_fault.__do_fault.hand=
le_pte_fault
>       0.00 =C2=B1 -1%      +Inf%       7.15 =C2=B1  4%  perf-profile.cycl=
es-pp.add_to_page_cache_lru.mpage_readpages.xfs_vm_readpages.__do_page_cach=
e_readahead.filemap_fault
>       0.00 =C2=B1 -1%      +Inf%      78.06 =C2=B1  0%  perf-profile.cycl=
es-pp.alloc_pages_current.__page_cache_alloc.__do_page_cache_readahead.file=
map_fault.xfs_filemap_fault
>      79.38 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es-pp.alloc_pages_current.__page_cache_alloc.filemap_fault.xfs_filemap_faul=
t.__do_fault
>       0.00 =C2=B1 -1%      +Inf%      97.32 =C2=B1  0%  perf-profile.cycl=
es-pp.do_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
>       5.19 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es-pp.do_mpage_readpage.mpage_readpage.xfs_vm_readpage.filemap_fault.xfs_fi=
lemap_fault
>       0.00 =C2=B1 -1%      +Inf%      10.68 =C2=B1  1%  perf-profile.cycl=
es-pp.do_mpage_readpage.mpage_readpages.xfs_vm_readpages.__do_page_cache_re=
adahead.filemap_fault
>       0.72 =C2=B1 67%     -98.3%       0.01 =C2=B1 87%  perf-profile.cycl=
es-pp.do_syscall_64.return_from_SYSCALL_64.__libc_fork
>      72.75 =C2=B1  1%     -23.2%      55.88 =C2=B1  1%  perf-profile.cycl=
es-pp.do_try_to_free_pages.try_to_free_pages.__alloc_pages_nodemask.alloc_p=
ages_current.__page_cache_alloc
>       0.00 =C2=B1 -1%      +Inf%      96.86 =C2=B1  0%  perf-profile.cycl=
es-pp.filemap_fault.xfs_filemap_fault.__do_fault.do_fault.handle_mm_fault
>      90.80 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es-pp.filemap_fault.xfs_filemap_fault.__do_fault.handle_pte_fault.handle_mm=
_fault
>       2.39 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es-pp.filemap_map_pages.handle_pte_fault.handle_mm_fault.__do_page_fault.do=
_page_fault
>       0.97 =C2=B1 12%    +321.3%       4.07 =C2=B1  6%  perf-profile.cycl=
es-pp.free_hot_cold_page.free_hot_cold_page_list.shrink_page_list.shrink_in=
active_list.shrink_zone_memcg
>       1.03 =C2=B1  9%    +303.4%       4.17 =C2=B1  5%  perf-profile.cycl=
es-pp.free_hot_cold_page_list.shrink_page_list.shrink_inactive_list.shrink_=
zone_memcg.shrink_zone
>       0.65 =C2=B1 23%    +451.9%       3.58 =C2=B1  6%  perf-profile.cycl=
es-pp.free_pcppages_bulk.free_hot_cold_page.free_hot_cold_page_list.shrink_=
page_list.shrink_inactive_list
>       0.00 =C2=B1 -1%      +Inf%      21.18 =C2=B1  2%  perf-profile.cycl=
es-pp.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_current.__p=
age_cache_alloc.__do_page_cache_readahead
>       6.22 =C2=B1 21%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es-pp.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_current.__p=
age_cache_alloc.filemap_fault
>      94.07 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es-pp.handle_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_f=
ault
>       0.57 =C2=B1  1%    +104.6%       1.16 =C2=B1  2%  perf-profile.cycl=
es-pp.isolate_lru_pages.isra.47.shrink_inactive_list.shrink_zone_memcg.shri=
nk_zone.do_try_to_free_pages
>       2.96 =C2=B1  7%     -30.5%       2.05 =C2=B1  9%  perf-profile.cycl=
es-pp.kthread.ret_from_fork
>       9.58 =C2=B1  6%    -100.0%       0.00 =C2=B1229%  perf-profile.cycl=
es-pp.list_lru_add.__delete_from_page_cache.__remove_mapping.shrink_page_li=
st.shrink_inactive_list
>       1.88 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es-pp.list_lru_del.__add_to_page_cache_locked.add_to_page_cache_lru.filemap=
_fault.xfs_filemap_fault
>      29.08 =C2=B1  3%     -97.0%       0.89 =C2=B1 19%  perf-profile.cycl=
es-pp.list_lru_walk_one.scan_shadow_nodes.shrink_slab.shrink_zone.do_try_to=
_free_pages
>       1.59 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es-pp.lru_cache_add.add_to_page_cache_lru.filemap_fault.xfs_filemap_fault._=
_do_fault
>       0.00 =C2=B1 -1%      +Inf%       5.68 =C2=B1  5%  perf-profile.cycl=
es-pp.lru_cache_add.add_to_page_cache_lru.mpage_readpages.xfs_vm_readpages.=
__do_page_cache_readahead
>       5.24 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es-pp.mpage_readpage.xfs_vm_readpage.filemap_fault.xfs_filemap_fault.__do_f=
ault
>       0.00 =C2=B1 -1%      +Inf%      18.20 =C2=B1  1%  perf-profile.cycl=
es-pp.mpage_readpages.xfs_vm_readpages.__do_page_cache_readahead.filemap_fa=
ult.xfs_filemap_fault
>       2.37 =C2=B1 14%     +79.9%       4.27 =C2=B1 13%  perf-profile.cycl=
es-pp.native_flush_tlb_others.try_to_unmap_flush.shrink_page_list.shrink_in=
active_list.shrink_zone_memcg
>       0.01 =C2=B1133%  +30322.9%       2.66 =C2=B1  8%  perf-profile.cycl=
es-pp.native_queued_spin_lock_slowpath._raw_spin_lock.free_pcppages_bulk.fr=
ee_hot_cold_page.free_hot_cold_page_list
>       5.07 =C2=B1 25%    +268.8%      18.71 =C2=B1  3%  perf-profile.cycl=
es-pp.native_queued_spin_lock_slowpath._raw_spin_lock.get_page_from_freelis=
t.__alloc_pages_nodemask.alloc_pages_current
>       9.16 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es-pp.native_queued_spin_lock_slowpath._raw_spin_lock.list_lru_add.__delete=
_from_page_cache.__remove_mapping
>       0.75 =C2=B1 57%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es-pp.native_queued_spin_lock_slowpath._raw_spin_lock.list_lru_del.__add_to=
_page_cache_locked.add_to_page_cache_lru
>      27.68 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es-pp.native_queued_spin_lock_slowpath._raw_spin_lock.shadow_lru_isolate.__=
list_lru_walk_one.list_lru_walk_one
>      11.09 =C2=B1 10%    +237.5%      37.44 =C2=B1  0%  perf-profile.cycl=
es-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.shrink_inactive_l=
ist.shrink_zone_memcg.shrink_zone
>      12.76 =C2=B1  9%     -90.9%       1.17 =C2=B1 22%  perf-profile.cycl=
es-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__remove_mapp=
ing.shrink_page_list.shrink_inactive_list
>       1.08 =C2=B1 19%    +338.2%       4.75 =C2=B1  7%  perf-profile.cycl=
es-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.pagevec_lru_m=
ove_fn.__lru_cache_add.lru_cache_add
>       1.81 =C2=B1  2%     -73.7%       0.48 =C2=B1  1%  perf-profile.cycl=
es-pp.page_check_address_transhuge.page_referenced_one.rmap_walk_file.rmap_=
walk.page_referenced
>       3.24 =C2=B1  1%     -42.5%       1.87 =C2=B1  2%  perf-profile.cycl=
es-pp.page_referenced.shrink_page_list.shrink_inactive_list.shrink_zone_mem=
cg.shrink_zone
>       2.20 =C2=B1  2%     -66.0%       0.75 =C2=B1  5%  perf-profile.cycl=
es-pp.page_referenced_one.rmap_walk_file.rmap_walk.page_referenced.shrink_p=
age_list
>       1.54 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es-pp.pagevec_lru_move_fn.__lru_cache_add.lru_cache_add.add_to_page_cache_l=
ru.filemap_fault
>       0.00 =C2=B1 -1%      +Inf%       5.57 =C2=B1  5%  perf-profile.cycl=
es-pp.pagevec_lru_move_fn.__lru_cache_add.lru_cache_add.add_to_page_cache_l=
ru.mpage_readpages
>       2.07 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es-pp.radix_tree_next_chunk.filemap_map_pages.handle_pte_fault.handle_mm_fa=
ult.__do_page_fault
>       3.01 =C2=B1  6%     -31.7%       2.05 =C2=B1  9%  perf-profile.cycl=
es-pp.ret_from_fork
>       0.72 =C2=B1 67%     -98.5%       0.01 =C2=B1 94%  perf-profile.cycl=
es-pp.return_from_SYSCALL_64.__libc_fork
>       3.15 =C2=B1  1%     -46.0%       1.70 =C2=B1  1%  perf-profile.cycl=
es-pp.rmap_walk.page_referenced.shrink_page_list.shrink_inactive_list.shrin=
k_zone_memcg
>       3.02 =C2=B1  2%     -48.4%       1.56 =C2=B1  1%  perf-profile.cycl=
es-pp.rmap_walk_file.rmap_walk.page_referenced.shrink_page_list.shrink_inac=
tive_list
>      29.08 =C2=B1  3%     -97.0%       0.89 =C2=B1 19%  perf-profile.cycl=
es-pp.scan_shadow_nodes.shrink_slab.shrink_zone.do_try_to_free_pages.try_to=
_free_pages
>      28.89 =C2=B1  3%     -97.1%       0.84 =C2=B1 22%  perf-profile.cycl=
es-pp.shadow_lru_isolate.__list_lru_walk_one.list_lru_walk_one.scan_shadow_=
nodes.shrink_slab
>      44.93 =C2=B1  4%     +21.9%      54.77 =C2=B1  1%  perf-profile.cycl=
es-pp.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try_to_free_pag=
es.try_to_free_pages
>      33.07 =C2=B1  4%     -50.8%      16.28 =C2=B1  3%  perf-profile.cycl=
es-pp.shrink_page_list.shrink_inactive_list.shrink_zone_memcg.shrink_zone.d=
o_try_to_free_pages
>       1.11 =C2=B1 16%     -22.6%       0.86 =C2=B1  6%  perf-profile.cycl=
es-pp.shrink_page_list.shrink_inactive_list.shrink_zone_memcg.shrink_zone.k=
swapd
>      29.15 =C2=B1  3%     -96.8%       0.94 =C2=B1 16%  perf-profile.cycl=
es-pp.shrink_slab.shrink_zone.do_try_to_free_pages.try_to_free_pages.__allo=
c_pages_nodemask
>      73.07 =C2=B1  1%     -23.5%      55.91 =C2=B1  1%  perf-profile.cycl=
es-pp.shrink_zone.do_try_to_free_pages.try_to_free_pages.__alloc_pages_node=
mask.alloc_pages_current
>      45.01 =C2=B1  4%     +22.1%      54.95 =C2=B1  1%  perf-profile.cycl=
es-pp.shrink_zone_memcg.shrink_zone.do_try_to_free_pages.try_to_free_pages.=
__alloc_pages_nodemask
>       2.35 =C2=B1 14%     +78.9%       4.21 =C2=B1 13%  perf-profile.cycl=
es-pp.smp_call_function_many.native_flush_tlb_others.try_to_unmap_flush.shr=
ink_page_list.shrink_inactive_list
>       0.00 =C2=B1 -1%      +Inf%      55.91 =C2=B1  1%  perf-profile.cycl=
es-pp.try_to_free_pages.__alloc_pages_nodemask.alloc_pages_current.__page_c=
ache_alloc.__do_page_cache_readahead
>      72.76 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es-pp.try_to_free_pages.__alloc_pages_nodemask.alloc_pages_current.__page_c=
ache_alloc.filemap_fault
>       2.38 =C2=B1 14%     +79.5%       4.28 =C2=B1 13%  perf-profile.cycl=
es-pp.try_to_unmap_flush.shrink_page_list.shrink_inactive_list.shrink_zone_=
memcg.shrink_zone
>       0.58 =C2=B1  1%     +51.9%       0.88 =C2=B1 14%  perf-profile.cycl=
es-pp.workingset_eviction.__remove_mapping.shrink_page_list.shrink_inactive=
_list.shrink_zone_memcg
>       0.00 =C2=B1 -1%      +Inf%      96.89 =C2=B1  0%  perf-profile.cycl=
es-pp.xfs_filemap_fault.__do_fault.do_fault.handle_mm_fault.__do_page_fault
>      91.02 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es-pp.xfs_filemap_fault.__do_fault.handle_pte_fault.handle_mm_fault.__do_pa=
ge_fault
>       0.00 =C2=B1 -1%      +Inf%       1.11 =C2=B1  0%  perf-profile.cycl=
es-pp.xfs_get_blocks.do_mpage_readpage.mpage_readpages.xfs_vm_readpages.__d=
o_page_cache_readahead
>       5.26 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es-pp.xfs_vm_readpage.filemap_fault.xfs_filemap_fault.__do_fault.handle_pte=
_fault
>       0.00 =C2=B1 -1%      +Inf%      18.21 =C2=B1  1%  perf-profile.cycl=
es-pp.xfs_vm_readpages.__do_page_cache_readahead.filemap_fault.xfs_filemap_=
fault.__do_fault
> =

> =

> =

> lkp-hsw01: Grantley Haswell-EP
> Memory: 64G
> =

> =

> =

> =

>                            vm-scalability.time.user_time
> =

>   140 ++-----------------------------------------------------------------=
---+
>       |******* ****** *************************************** **** ******=
 ***
>   120 *+      *    * *               *       *               *    *      =
*  |
>       |                                                                  =
   |
>   100 ++                                                                 =
   |
>       |                                                                  =
   |
>    80 ++                                                                 =
   |
>       |                                                                  =
   |
>    60 ++                                                                 =
   |
>       |                                                                  =
   |
>    40 ++                                                                 =
   |
>       |                                                                  =
   |
>    20 OOOO      O   O OOO O  OO OO  OO                                   =
   |
>       | O OOOOOO OOO O   OOOO OO  OO                                     =
   |
>     0 ++-----------------------------------------------------------------=
---+
> =

> =

>                         vm-scalability.time.major_page_faults
> =

>   7e+08 ++*-***-----*-----**--*-----*---****-*--*-***------------*---***-=
-*-+
>         ** * * ***** ****** ** *********  * **** *  *****************  **=
****
>   6e+08 ++                                                               =
   |
>         |                                                                =
   |
>   5e+08 ++                                                               =
   |
>         |                                                                =
   |
>   4e+08 ++                                                               =
   |
>         |                                                                =
   |
>   3e+08 ++                                                               =
   |
>         |                                                                =
   |
>   2e+08 ++                                                               =
   |
>         |                                                                =
   |
>   1e+08 ++                                                               =
   |
>         OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO                                  =
   |
>       0 ++---------------------------------------------------------------=
---+
> =

> =

> 	[*] bisect-good sample
> 	[O] bisect-bad  sample
> =

> To reproduce:
> =

>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
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
> Xiaolong Ye

--===============1408977320261127584==--

