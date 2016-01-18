Content-Type: multipart/mixed; boundary="===============3552980518690969881=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [readahead] b864ed1cbb: -13.5% vm-scalability.throughput
Date: Mon, 18 Jan 2016 09:46:20 +0800
Message-ID: <87egdfoe1f.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3552980518690969881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://internal_merge_and_test_tree revert-b864ed1cbba916a0418087fa0b0585025=
3df6a3d-b864ed1cbba916a0418087fa0b05850253df6a3d
commit b864ed1cbba916a0418087fa0b05850253df6a3d ("readahead: fix block orde=
ring in __do_page_cache_readahead")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/300s/lkp-hsw=
-ep2/mmap-pread-seq/vm-scalability

commit: =

  v4.4-rc8
  b864ed1cbba916a0418087fa0b05850253df6a3d

        v4.4-rc8 b864ed1cbba916a0418087fa0b =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      2.26 =C2=B1 14%     -99.9%       0.00 =C2=B1170%  vm-scalability.stdd=
ev
 2.051e+08 =C2=B1  1%     -13.5%  1.775e+08 =C2=B1  2%  vm-scalability.thro=
ughput
    313.12 =C2=B1  0%      +2.9%     322.09 =C2=B1  1%  vm-scalability.time=
.elapsed_time
    313.12 =C2=B1  0%      +2.9%     322.09 =C2=B1  1%  vm-scalability.time=
.elapsed_time.max
    234004 =C2=B1  1%     -16.7%     194812 =C2=B1  8%  vm-scalability.time=
.involuntary_context_switches
   1193496 =C2=B1109%   +2874.8%   35504224 =C2=B1  8%  vm-scalability.time=
.major_page_faults
  4.55e+08 =C2=B1  5%     -16.6%  3.795e+08 =C2=B1  3%  vm-scalability.time=
.minor_page_faults
      6883 =C2=B1  0%      -9.0%       6264 =C2=B1  2%  vm-scalability.time=
.percent_of_cpu_this_job_got
      9775 =C2=B1  3%     +45.6%      14233 =C2=B1  9%  vm-scalability.time=
.system_time
     11781 =C2=B1  2%     -49.5%       5951 =C2=B1 14%  vm-scalability.time=
.user_time
    690273 =C2=B1 23%   +3630.0%   25746989 =C2=B1 14%  vm-scalability.time=
.voluntary_context_switches
   1811413 =C2=B1  3%     -49.5%     914707 =C2=B1  6%  softirqs.RCU
    416413 =C2=B1 10%   +1386.2%    6188727 =C2=B1 12%  softirqs.SCHED
  41502833 =C2=B1 47%    +177.4%  1.151e+08 =C2=B1 11%  numa-numastat.node0=
.local_node
  41508650 =C2=B1 47%    +177.4%  1.151e+08 =C2=B1 11%  numa-numastat.node0=
.numa_hit
  41994520 =C2=B1 55%    +193.2%  1.231e+08 =C2=B1  2%  numa-numastat.node1=
.local_node
  41998001 =C2=B1 55%    +193.2%  1.231e+08 =C2=B1  2%  numa-numastat.node1=
.numa_hit
    786879 =C2=B1  1%     -43.1%     447709 =C2=B1  7%  slabinfo.radix_tree=
_node.active_objs
     14056 =C2=B1  1%     -43.1%       7999 =C2=B1  7%  slabinfo.radix_tree=
_node.active_slabs
    787115 =C2=B1  1%     -43.1%     447978 =C2=B1  7%  slabinfo.radix_tree=
_node.num_objs
     14056 =C2=B1  1%     -43.1%       7999 =C2=B1  7%  slabinfo.radix_tree=
_node.num_slabs
     96.40 =C2=B1  0%      -9.0%      87.73 =C2=B1  1%  turbostat.%Busy
      2681 =C2=B1  0%      -8.6%       2450 =C2=B1  2%  turbostat.Avg_MHz
      0.80 =C2=B1 17%    +978.4%       8.63 =C2=B1  9%  turbostat.CPU%c1
    277.69 =C2=B1  0%      -6.4%     260.00 =C2=B1  0%  turbostat.PkgWatt
     80.93 =C2=B1  4%     -20.7%      64.17 =C2=B1  5%  turbostat.RAMWatt
     98.50 =C2=B1  6%    +129.2%     225.75 =C2=B1  8%  vmstat.memory.buff
  16634752 =C2=B1  1%    +101.8%   33573457 =C2=B1  7%  vmstat.memory.free
      0.00 =C2=B1  0%      +Inf%       6.50 =C2=B1 17%  vmstat.procs.b
      8325 =C2=B1 10%   +1820.0%     159855 =C2=B1 14%  vmstat.system.cs
    530374 =C2=B1  4%     -55.0%     238694 =C2=B1 10%  vmstat.system.in
    234004 =C2=B1  1%     -16.7%     194812 =C2=B1  8%  time.involuntary_co=
ntext_switches
   1193496 =C2=B1109%   +2874.8%   35504224 =C2=B1  8%  time.major_page_fau=
lts
  4.55e+08 =C2=B1  5%     -16.6%  3.795e+08 =C2=B1  3%  time.minor_page_fau=
lts
      9775 =C2=B1  3%     +45.6%      14233 =C2=B1  9%  time.system_time
     11781 =C2=B1  2%     -49.5%       5951 =C2=B1 14%  time.user_time
    690273 =C2=B1 23%   +3630.0%   25746989 =C2=B1 14%  time.voluntary_cont=
ext_switches
  38405423 =C2=B1  0%     -25.5%   28607571 =C2=B1  6%  meminfo.Active
  38121976 =C2=B1  0%     -25.7%   28335243 =C2=B1  6%  meminfo.Active(file)
 1.049e+08 =C2=B1  0%     +10.0%  1.154e+08 =C2=B1  1%  meminfo.MemAvailable
  17219597 =C2=B1  1%     +95.8%   33708164 =C2=B1  7%  meminfo.MemFree
  25444547 =C2=B1  1%     -40.7%   15087631 =C2=B1  7%  meminfo.PageTables
    493544 =C2=B1  0%     -38.9%     301610 =C2=B1  6%  meminfo.SReclaimable
    602086 =C2=B1  0%     -31.9%     410056 =C2=B1  4%  meminfo.Slab
    371306 =C2=B1  0%     -33.2%     248033 =C2=B1  7%  meminfo.Unevictable
  47422294 =C2=B1 46%   +1649.8%  8.298e+08 =C2=B1 11%  cpuidle.C1-HSW.time
    603317 =C2=B1 21%   +2291.5%   14428159 =C2=B1 16%  cpuidle.C1-HSW.usage
   9051471 =C2=B1 45%   +3393.7%  3.162e+08 =C2=B1  8%  cpuidle.C1E-HSW.time
      4689 =C2=B1 24%  +97673.2%    4585076 =C2=B1 15%  cpuidle.C1E-HSW.usa=
ge
   1892943 =C2=B1 34%  +14142.1%  2.696e+08 =C2=B1 14%  cpuidle.C3-HSW.time
      3856 =C2=B1 20%  +1.2e+05%    4686329 =C2=B1 15%  cpuidle.C3-HSW.usage
 7.365e+08 =C2=B1  7%     +95.4%   1.44e+09 =C2=B1 33%  cpuidle.C6-HSW.time
     29369 =C2=B1 13%    +238.7%      99470 =C2=B1 25%  cpuidle.C6-HSW.usage
     26.12 =C2=B1 72%   +1448.3%     404.50 =C2=B1 12%  cpuidle.POLL.usage
     68161 =C2=B1105%   +2385.6%    1694219 =C2=B1171%  latency_stats.avg.p=
ipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%    8384959 =C2=B1 48%  latency_stats.avg.t=
hrottle_direct_reclaim.try_to_free_pages.__alloc_pages_nodemask.alloc_pages=
_current.pte_alloc_one.__pte_alloc.handle_mm_fault.__do_page_fault.do_page_=
fault.page_fault
    371068 =C2=B1  6%     -70.5%     109331 =C2=B1 11%  latency_stats.hits.=
pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
    647478 =C2=B1 23%   +3012.9%   20155438 =C2=B1 15%  latency_stats.hits.=
wait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.xfs_filemap_fa=
ult.__do_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      0.00 =C2=B1 -1%      +Inf%   10052801 =C2=B1 41%  latency_stats.max.t=
hrottle_direct_reclaim.try_to_free_pages.__alloc_pages_nodemask.alloc_pages=
_current.pte_alloc_one.__pte_alloc.handle_mm_fault.__do_page_fault.do_page_=
fault.page_fault
    912867 =C2=B1 12%    +253.7%    3229147 =C2=B1  4%  latency_stats.sum.d=
o_wait.SyS_wait4.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%  3.337e+08 =C2=B1 57%  latency_stats.sum.t=
hrottle_direct_reclaim.try_to_free_pages.__alloc_pages_nodemask.alloc_pages=
_current.pte_alloc_one.__pte_alloc.handle_mm_fault.__do_page_fault.do_page_=
fault.page_fault
      8181 =C2=B1 30%     -65.8%       2794 =C2=B1  4%  latency_stats.sum.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_range.filemap_w=
rite_and_wait_range.nfs4_file_fsync.[nfsv4].vfs_fsync_range.vfs_fsync.nfs4_=
file_flush.[nfsv4].filp_close.do_dup2.SyS_dup2.entry_SYSCALL_64_fastpath
   8154228 =C2=B1 26%  +10161.6%  8.368e+08 =C2=B1 12%  latency_stats.sum.w=
ait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.xfs_filemap_fau=
lt.__do_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
  18908395 =C2=B1  7%     -20.0%   15122403 =C2=B1  7%  numa-meminfo.node0.=
Active
  18786178 =C2=B1  8%     -20.5%   14934403 =C2=B1  7%  numa-meminfo.node0.=
Active(file)
   9259476 =C2=B1 26%     +73.4%   16054543 =C2=B1 11%  numa-meminfo.node0.=
MemFree
  56627530 =C2=B1  4%     -12.0%   49832463 =C2=B1  3%  numa-meminfo.node0.=
MemUsed
    242735 =C2=B1  6%     -35.3%     157108 =C2=B1  9%  numa-meminfo.node0.=
SReclaimable
    297933 =C2=B1  5%     -29.4%     210205 =C2=B1  6%  numa-meminfo.node0.=
Slab
    185897 =C2=B1  1%     -29.4%     131181 =C2=B1  7%  numa-meminfo.node0.=
Unevictable
  19447008 =C2=B1  8%     -30.9%   13432680 =C2=B1  8%  numa-meminfo.node1.=
Active
  19286591 =C2=B1  8%     -30.8%   13348457 =C2=B1  8%  numa-meminfo.node1.=
Active(file)
   8012390 =C2=B1 30%    +121.6%   17751800 =C2=B1  9%  numa-meminfo.node1.=
MemFree
  58018344 =C2=B1  4%     -16.8%   48278918 =C2=B1  3%  numa-meminfo.node1.=
MemUsed
  12378139 =C2=B1 23%     -40.9%    7309957 =C2=B1  6%  numa-meminfo.node1.=
PageTables
    249938 =C2=B1  7%     -42.2%     144355 =C2=B1  4%  numa-meminfo.node1.=
SReclaimable
    303279 =C2=B1  6%     -34.2%     199702 =C2=B1  3%  numa-meminfo.node1.=
Slab
    184755 =C2=B1  0%     -36.8%     116694 =C2=B1  8%  numa-meminfo.node1.=
Unevictable
   4700128 =C2=B1  8%     -20.5%    3736178 =C2=B1  7%  numa-vmstat.node0.n=
r_active_file
   2308842 =C2=B1 26%     +73.5%    4005983 =C2=B1 10%  numa-vmstat.node0.n=
r_free_pages
    584.38 =C2=B1  5%     -57.0%     251.00 =C2=B1 22%  numa-vmstat.node0.n=
r_isolated_file
     60770 =C2=B1  6%     -35.4%      39267 =C2=B1  8%  numa-vmstat.node0.n=
r_slab_reclaimable
     46496 =C2=B1  0%     -29.5%      32772 =C2=B1  7%  numa-vmstat.node0.n=
r_unevictable
  21300293 =C2=B1 41%    +226.3%   69507755 =C2=B1  6%  numa-vmstat.node0.n=
uma_hit
  21234188 =C2=B1 41%    +227.0%   69432185 =C2=B1  6%  numa-vmstat.node0.n=
uma_local
   4825671 =C2=B1  8%     -30.8%    3337560 =C2=B1  8%  numa-vmstat.node1.n=
r_active_file
    722.25 =C2=B1  3%     +21.9%     880.75 =C2=B1 10%  numa-vmstat.node1.n=
r_alloc_batch
   1992573 =C2=B1 30%    +122.3%    4430410 =C2=B1  9%  numa-vmstat.node1.n=
r_free_pages
    556.25 =C2=B1  7%     -62.1%     210.75 =C2=B1 20%  numa-vmstat.node1.n=
r_isolated_file
   3100566 =C2=B1 23%     -41.1%    1826510 =C2=B1  6%  numa-vmstat.node1.n=
r_page_table_pages
     62579 =C2=B1  7%     -42.4%      36075 =C2=B1  4%  numa-vmstat.node1.n=
r_slab_reclaimable
     46212 =C2=B1  0%     -36.9%      29150 =C2=B1  8%  numa-vmstat.node1.n=
r_unevictable
  23058369 =C2=B1 43%    +216.7%   73028465 =C2=B1  0%  numa-vmstat.node1.n=
uma_hit
  23018364 =C2=B1 43%    +217.1%   72997478 =C2=B1  0%  numa-vmstat.node1.n=
uma_local
     39445 =C2=B1  5%     -65.8%      13476 =C2=B1 22%  proc-vmstat.allocst=
all
    180.38 =C2=B1 14%     -82.5%      31.50 =C2=B1 52%  proc-vmstat.kswapd_=
low_wmark_hit_quickly
   9531987 =C2=B1  0%     -25.8%    7074253 =C2=B1  6%  proc-vmstat.nr_acti=
ve_file
      1417 =C2=B1  5%     +16.5%       1651 =C2=B1  9%  proc-vmstat.nr_allo=
c_batch
   2605078 =C2=B1  0%     +10.3%    2874007 =C2=B1  1%  proc-vmstat.nr_dirt=
y_background_threshold
   5210157 =C2=B1  0%     +10.3%    5748015 =C2=B1  1%  proc-vmstat.nr_dirt=
y_threshold
   4287957 =C2=B1  0%     +97.1%    8452338 =C2=B1  6%  proc-vmstat.nr_free=
_pages
      1140 =C2=B1  5%     -59.9%     457.75 =C2=B1 20%  proc-vmstat.nr_isol=
ated_file
   6365507 =C2=B1  1%     -40.9%    3764735 =C2=B1  7%  proc-vmstat.nr_page=
_table_pages
    123499 =C2=B1  0%     -39.0%      75337 =C2=B1  6%  proc-vmstat.nr_slab=
_reclaimable
     92848 =C2=B1  0%     -33.2%      62053 =C2=B1  7%  proc-vmstat.nr_unev=
ictable
    222575 =C2=B1  3%     +24.8%     277840 =C2=B1 14%  proc-vmstat.numa_hi=
nt_faults
  83502184 =C2=B1 17%    +185.3%  2.383e+08 =C2=B1  6%  proc-vmstat.numa_hit
  83492885 =C2=B1 17%    +185.4%  2.383e+08 =C2=B1  6%  proc-vmstat.numa_lo=
cal
    300.88 =C2=B1 31%   +3555.4%      10998 =C2=B1 10%  proc-vmstat.numa_pa=
ges_migrated
    223128 =C2=B1  3%     +24.8%     278530 =C2=B1 14%  proc-vmstat.numa_pt=
e_updates
      1465 =C2=B1  7%     -70.9%     426.75 =C2=B1 26%  proc-vmstat.pageout=
run
  90932272 =C2=B1  2%     -43.8%   51069755 =C2=B1  8%  proc-vmstat.pgactiv=
ate
   1330020 =C2=B1 37%    +149.5%    3317771 =C2=B1 12%  proc-vmstat.pgalloc=
_dma32
 1.178e+08 =C2=B1 16%    +129.3%    2.7e+08 =C2=B1  3%  proc-vmstat.pgalloc=
_normal
  76574991 =C2=B1  4%     -59.2%   31207695 =C2=B1 16%  proc-vmstat.pgdeact=
ivate
 1.177e+08 =C2=B1 16%    +131.1%  2.719e+08 =C2=B1  3%  proc-vmstat.pgfree
   1193505 =C2=B1109%   +2874.8%   35504224 =C2=B1  8%  proc-vmstat.pgmajfa=
ult
    300.88 =C2=B1 31%   +3555.4%      10998 =C2=B1 10%  proc-vmstat.pgmigra=
te_success
  75857217 =C2=B1  4%     -59.4%   30805672 =C2=B1 16%  proc-vmstat.pgrefil=
l_normal
 1.476e+08 =C2=B1  1%     -56.6%   63994450 =C2=B1 14%  proc-vmstat.pgscan_=
direct_normal
  64513915 =C2=B1  3%     -61.9%   24610923 =C2=B1 19%  proc-vmstat.pgsteal=
_direct_normal
      3.67 =C2=B1 68%    +858.3%      35.12 =C2=B1  7%  perf-profile.cycles=
-pp.__add_to_page_cache_locked.add_to_page_cache_lru.mpage_readpages.xfs_vm=
_readpages.__do_page_cache_readahead
     44.99 =C2=B1 23%     -98.8%       0.54 =C2=B1  1%  perf-profile.cycles=
-pp.__alloc_pages_nodemask.alloc_pages_current.__page_cache_alloc.__do_page=
_cache_readahead.filemap_fault
      1.21 =C2=B1 12%     -92.3%       0.09 =C2=B1  4%  perf-profile.cycles=
-pp.__alloc_pages_nodemask.alloc_pages_current.__page_cache_alloc.__do_page=
_cache_readahead.ondemand_readahead
     26.50 =C2=B1 55%     -99.7%       0.08 =C2=B1 10%  perf-profile.cycles=
-pp.__alloc_pages_nodemask.alloc_pages_current.pte_alloc_one.__pte_alloc.ha=
ndle_mm_fault
      3.81 =C2=B1 21%     -99.6%       0.01 =C2=B1100%  perf-profile.cycles=
-pp.__do_page_cache_readahead.ondemand_readahead.page_cache_async_readahead=
.filemap_fault.xfs_filemap_fault
      0.00 =C2=B1 -1%      +Inf%       1.74 =C2=B1 15%  perf-profile.cycles=
-pp.__lock_page_killable.__lock_page_or_retry.filemap_fault.xfs_filemap_fau=
lt.__do_fault
      0.00 =C2=B1 -1%      +Inf%      12.86 =C2=B1  7%  perf-profile.cycles=
-pp.__lock_page_or_retry.filemap_fault.xfs_filemap_fault.__do_fault.handle_=
mm_fault
     44.98 =C2=B1 23%     -98.7%       0.60 =C2=B1  0%  perf-profile.cycles=
-pp.__page_cache_alloc.__do_page_cache_readahead.filemap_fault.xfs_filemap_=
fault.__do_fault
      1.22 =C2=B1 12%     -91.8%       0.10 =C2=B1  7%  perf-profile.cycles=
-pp.__page_cache_alloc.__do_page_cache_readahead.ondemand_readahead.page_ca=
che_async_readahead.filemap_fault
     13.52 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.__page_check_address.page_referenced_one.rmap_walk.page_referenced.shri=
nk_page_list
     10.22 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.__page_check_address.try_to_unmap_one.rmap_walk.try_to_unmap.shrink_pag=
e_list
     26.52 =C2=B1 55%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.__pte_alloc.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      0.02 =C2=B1 88%   +5047.7%       1.13 =C2=B1  6%  perf-profile.cycles=
-pp.__radix_tree_lookup.__do_page_cache_readahead.filemap_fault.xfs_filemap=
_fault.__do_fault
     23.99 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.__remove_mapping.shrink_page_list.shrink_inactive_list.shrink_lruvec.sh=
rink_zone
      0.00 =C2=B1 -1%      +Inf%      11.05 =C2=B1  6%  perf-profile.cycles=
-pp.__wait_on_bit.wait_on_page_bit_killable.__lock_page_or_retry.filemap_fa=
ult.xfs_filemap_fault
      0.00 =C2=B1 -1%      +Inf%       1.73 =C2=B1 15%  perf-profile.cycles=
-pp.__wait_on_bit_lock.__lock_page_killable.__lock_page_or_retry.filemap_fa=
ult.xfs_filemap_fault
      0.41 =C2=B1 56%   +3357.8%      14.35 =C2=B1 11%  perf-profile.cycles=
-pp.__wake_up.__wake_up_bit.unlock_page.filemap_map_pages.handle_mm_fault
      0.08 =C2=B1 40%   +6612.5%       5.37 =C2=B1  4%  perf-profile.cycles=
-pp.__wake_up.__wake_up_bit.unlock_page.handle_mm_fault.__do_page_fault
      1.20 =C2=B1  6%   +1131.3%      14.84 =C2=B1 10%  perf-profile.cycles=
-pp.__wake_up_bit.unlock_page.filemap_map_pages.handle_mm_fault.__do_page_f=
ault
      0.04 =C2=B1 49%  +12540.8%       5.42 =C2=B1  4%  perf-profile.cycles=
-pp.__wake_up_bit.unlock_page.handle_mm_fault.__do_page_fault.do_page_fault
      7.44 =C2=B1 17%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp._raw_spin_lock.__page_check_address.page_referenced_one.rmap_walk.page_=
referenced
      4.27 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp._raw_spin_lock.__page_check_address.try_to_unmap_one.rmap_walk.try_to_u=
nmap
      3.31 =C2=B1 76%    +925.2%      33.97 =C2=B1  7%  perf-profile.cycles=
-pp._raw_spin_lock_irq.__add_to_page_cache_locked.add_to_page_cache_lru.mpa=
ge_readpages.xfs_vm_readpages
     22.96 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp._raw_spin_lock_irqsave.__remove_mapping.shrink_page_list.shrink_inactiv=
e_list.shrink_lruvec
      0.00 =C2=B1 -1%      +Inf%      13.80 =C2=B1 11%  perf-profile.cycles=
-pp._raw_spin_lock_irqsave.__wake_up.__wake_up_bit.unlock_page.filemap_map_=
pages
      0.00 =C2=B1 -1%      +Inf%       4.75 =C2=B1  5%  perf-profile.cycles=
-pp._raw_spin_lock_irqsave.__wake_up.__wake_up_bit.unlock_page.handle_mm_fa=
ult
      0.00 =C2=B1 -1%      +Inf%       4.12 =C2=B1  7%  perf-profile.cycles=
-pp._raw_spin_lock_irqsave.finish_wait.__wait_on_bit.wait_on_page_bit_killa=
ble.__lock_page_or_retry
      0.00 =C2=B1 -1%      +Inf%       6.39 =C2=B1  7%  perf-profile.cycles=
-pp._raw_spin_lock_irqsave.prepare_to_wait.__wait_on_bit.wait_on_page_bit_k=
illable.__lock_page_or_retry
      3.52 =C2=B1 63%    +885.9%      34.69 =C2=B1  7%  perf-profile.cycles=
-pp.add_to_page_cache_lru.mpage_readpages.xfs_vm_readpages.__do_page_cache_=
readahead.filemap_fault
      1.34 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.add_to_page_cache_lru.mpage_readpages.xfs_vm_readpages.__do_page_cache_=
readahead.ondemand_readahead
     44.98 =C2=B1 23%     -98.8%       0.55 =C2=B1  2%  perf-profile.cycles=
-pp.alloc_pages_current.__page_cache_alloc.__do_page_cache_readahead.filema=
p_fault.xfs_filemap_fault
      1.22 =C2=B1 12%     -92.4%       0.09 =C2=B1  4%  perf-profile.cycles=
-pp.alloc_pages_current.__page_cache_alloc.__do_page_cache_readahead.ondema=
nd_readahead.page_cache_async_readahead
     26.50 =C2=B1 55%     -99.7%       0.08 =C2=B1 10%  perf-profile.cycles=
-pp.alloc_pages_current.pte_alloc_one.__pte_alloc.handle_mm_fault.__do_page=
_fault
      0.08 =C2=B1 41%   +9201.5%       7.79 =C2=B1 10%  perf-profile.cycles=
-pp.call_cpuidle.cpu_startup_entry.start_secondary
      0.15 =C2=B1 46%   +6071.2%       9.10 =C2=B1 10%  perf-profile.cycles=
-pp.cpu_startup_entry.start_secondary
      0.08 =C2=B1 41%   +9192.5%       7.78 =C2=B1 10%  perf-profile.cycles=
-pp.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_secondary
      0.08 =C2=B1 40%   +9315.2%       7.77 =C2=B1 11%  perf-profile.cycles=
-pp.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_=
secondary
      1.56 =C2=B1 12%     -78.8%       0.33 =C2=B1  3%  perf-profile.cycles=
-pp.do_mpage_readpage.mpage_readpages.xfs_vm_readpages.__do_page_cache_read=
ahead.ondemand_readahead
      2.40 =C2=B1 13%     -42.0%       1.40 =C2=B1  3%  perf-profile.cycles=
-pp.do_set_pte.filemap_map_pages.handle_mm_fault.__do_page_fault.do_page_fa=
ult
     46.07 =C2=B1 22%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.do_try_to_free_pages.try_to_free_pages.__alloc_pages_nodemask.alloc_pag=
es_current.__page_cache_alloc
     26.35 =C2=B1 56%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.do_try_to_free_pages.try_to_free_pages.__alloc_pages_nodemask.alloc_pag=
es_current.pte_alloc_one
     16.36 =C2=B1 16%     +82.7%      29.89 =C2=B1  3%  perf-profile.cycles=
-pp.filemap_map_pages.handle_mm_fault.__do_page_fault.do_page_fault.page_fa=
ult
      0.00 =C2=B1 -1%      +Inf%       4.14 =C2=B1  8%  perf-profile.cycles=
-pp.finish_wait.__wait_on_bit.wait_on_page_bit_killable.__lock_page_or_retr=
y.filemap_fault
      0.08 =C2=B1 40%   +9270.1%       7.85 =C2=B1 10%  perf-profile.cycles=
-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_e=
ntry
      1.02 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.kswapd.kthread.ret_from_fork
      1.04 =C2=B1  8%     -98.8%       0.01 =C2=B1 34%  perf-profile.cycles=
-pp.kthread.ret_from_fork
      3.84 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.mm_find_pmd.__page_check_address.page_referenced_one.rmap_walk.page_ref=
erenced
      3.65 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.mm_find_pmd.__page_check_address.try_to_unmap_one.rmap_walk.try_to_unmap
      3.54 =C2=B1 63%    +897.2%      35.30 =C2=B1  7%  perf-profile.cycles=
-pp.mpage_readpages.xfs_vm_readpages.__do_page_cache_readahead.filemap_faul=
t.xfs_filemap_fault
      2.94 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.mpage_readpages.xfs_vm_readpages.__do_page_cache_readahead.ondemand_rea=
dahead.page_cache_async_readahead
      4.18 =C2=B1 22%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock.__page_check_address.pa=
ge_referenced_one.rmap_walk
      1.46 =C2=B1 21%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock.__page_check_address.tr=
y_to_unmap_one.rmap_walk
      3.20 =C2=B1 79%    +950.9%      33.60 =C2=B1  7%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__add_to_page_cache=
_locked.add_to_page_cache_lru.mpage_readpages
     22.65 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__remove_mappin=
g.shrink_page_list.shrink_inactive_list
      0.00 =C2=B1 -1%      +Inf%      18.51 =C2=B1  7%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__wake_up.__wak=
e_up_bit.unlock_page
      0.00 =C2=B1 -1%      +Inf%       4.11 =C2=B1  7%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.finish_wait.__w=
ait_on_bit.wait_on_page_bit_killable
      0.00 =C2=B1 -1%      +Inf%       6.33 =C2=B1  7%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.prepare_to_wait=
.__wait_on_bit.wait_on_page_bit_killable
      4.56 =C2=B1  5%     -68.6%       1.43 =C2=B1  0%  perf-profile.cycles=
-pp.ondemand_readahead.page_cache_async_readahead.filemap_fault.xfs_filemap=
_fault.__do_fault
      4.57 =C2=B1  5%     -68.6%       1.43 =C2=B1  0%  perf-profile.cycles=
-pp.page_cache_async_readahead.filemap_fault.xfs_filemap_fault.__do_fault.h=
andle_mm_fault
     18.06 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.page_referenced.shrink_page_list.shrink_inactive_list.shrink_lruvec.shr=
ink_zone
     14.95 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.page_referenced_one.rmap_walk.page_referenced.shrink_page_list.shrink_i=
nactive_list
      1.42 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.page_remove_rmap.try_to_unmap_one.rmap_walk.try_to_unmap.shrink_page_li=
st
      0.00 =C2=B1 -1%      +Inf%       6.48 =C2=B1  7%  perf-profile.cycles=
-pp.prepare_to_wait.__wait_on_bit.wait_on_page_bit_killable.__lock_page_or_=
retry.filemap_fault
      0.00 =C2=B1 -1%      +Inf%       1.34 =C2=B1 12%  perf-profile.cycles=
-pp.prepare_to_wait_exclusive.__wait_on_bit_lock.__lock_page_killable.__loc=
k_page_or_retry.filemap_fault
     26.50 =C2=B1 55%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.pte_alloc_one.__pte_alloc.handle_mm_fault.__do_page_fault.do_page_fault
      1.04 =C2=B1  8%     -98.8%       0.01 =C2=B1 34%  perf-profile.cycles=
-pp.ret_from_fork
     17.11 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.rmap_walk.page_referenced.shrink_page_list.shrink_inactive_list.shrink_=
lruvec
     27.80 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.rmap_walk.try_to_unmap.shrink_page_list.shrink_inactive_list.shrink_lru=
vec
      0.96 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.shrink_active_list.shrink_lruvec.shrink_zone.do_try_to_free_pages.try_t=
o_free_pages
     71.65 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.shrink_inactive_list.shrink_lruvec.shrink_zone.do_try_to_free_pages.try=
_to_free_pages
      1.02 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.shrink_inactive_list.shrink_lruvec.shrink_zone.kswapd.kthread
     72.60 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.shrink_lruvec.shrink_zone.do_try_to_free_pages.try_to_free_pages.__allo=
c_pages_nodemask
      1.02 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.shrink_lruvec.shrink_zone.kswapd.kthread.ret_from_fork
     71.44 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.shrink_page_list.shrink_inactive_list.shrink_lruvec.shrink_zone.do_try_=
to_free_pages
      1.01 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.shrink_page_list.shrink_inactive_list.shrink_lruvec.shrink_zone.kswapd
     72.52 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.shrink_zone.do_try_to_free_pages.try_to_free_pages.__alloc_pages_nodema=
sk.alloc_pages_current
      1.02 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.shrink_zone.kswapd.kthread.ret_from_fork
      1.51 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.smp_call_function_many.try_to_unmap_flush.shrink_page_list.shrink_inact=
ive_list.shrink_lruvec
      0.15 =C2=B1 46%   +6088.1%       9.13 =C2=B1 10%  perf-profile.cycles=
-pp.start_secondary
     46.07 =C2=B1 22%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.try_to_free_pages.__alloc_pages_nodemask.alloc_pages_current.__page_cac=
he_alloc.__do_page_cache_readahead
     26.35 =C2=B1 56%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.try_to_free_pages.__alloc_pages_nodemask.alloc_pages_current.pte_alloc_=
one.__pte_alloc
     28.56 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.try_to_unmap.shrink_page_list.shrink_inactive_list.shrink_lruvec.shrink=
_zone
      1.53 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.try_to_unmap_flush.shrink_page_list.shrink_inactive_list.shrink_lruvec.=
shrink_zone
     25.17 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.try_to_unmap_one.rmap_walk.try_to_unmap.shrink_page_list.shrink_inactiv=
e_list
      3.58 =C2=B1 11%    +353.8%      16.25 =C2=B1  9%  perf-profile.cycles=
-pp.unlock_page.filemap_map_pages.handle_mm_fault.__do_page_fault.do_page_f=
ault
      0.02 =C2=B1 49%  +25711.8%       5.48 =C2=B1  4%  perf-profile.cycles=
-pp.unlock_page.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      0.00 =C2=B1 -1%      +Inf%      11.10 =C2=B1  6%  perf-profile.cycles=
-pp.wait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.xfs_filema=
p_fault.__do_fault
      3.54 =C2=B1 63%    +897.2%      35.30 =C2=B1  7%  perf-profile.cycles=
-pp.xfs_vm_readpages.__do_page_cache_readahead.filemap_fault.xfs_filemap_fa=
ult.__do_fault
      2.94 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.xfs_vm_readpages.__do_page_cache_readahead.ondemand_readahead.page_cach=
e_async_readahead.filemap_fault
    149333 =C2=B1  0%     -12.6%     130456 =C2=B1  3%  sched_debug.cfs_rq:=
/.exec_clock.34
    149318 =C2=B1  0%      -9.3%     135428 =C2=B1  0%  sched_debug.cfs_rq:=
/.exec_clock.38
    149420 =C2=B1  0%     -10.8%     133354 =C2=B1  3%  sched_debug.cfs_rq:=
/.exec_clock.40
    149634 =C2=B1  0%      -9.4%     135628 =C2=B1  0%  sched_debug.cfs_rq:=
/.exec_clock.41
    149354 =C2=B1  0%      -9.8%     134687 =C2=B1  0%  sched_debug.cfs_rq:=
/.exec_clock.48
    149344 =C2=B1  0%      -9.1%     135818 =C2=B1  0%  sched_debug.cfs_rq:=
/.exec_clock.49
    149379 =C2=B1  0%     -11.9%     131580 =C2=B1  3%  sched_debug.cfs_rq:=
/.exec_clock.50
    149306 =C2=B1  0%      -9.4%     135291 =C2=B1  0%  sched_debug.cfs_rq:=
/.exec_clock.51
    149248 =C2=B1  0%      -9.9%     134527 =C2=B1  0%  sched_debug.cfs_rq:=
/.exec_clock.52
    149650 =C2=B1  0%     -11.8%     131954 =C2=B1  3%  sched_debug.cfs_rq:=
/.exec_clock.54
    149321 =C2=B1  0%     -12.3%     130994 =C2=B1  4%  sched_debug.cfs_rq:=
/.exec_clock.55
    149301 =C2=B1  0%     -13.6%     128984 =C2=B1  5%  sched_debug.cfs_rq:=
/.exec_clock.56
    149302 =C2=B1  0%     -13.8%     128645 =C2=B1  5%  sched_debug.cfs_rq:=
/.exec_clock.59
    149293 =C2=B1  0%     -12.1%     131177 =C2=B1  3%  sched_debug.cfs_rq:=
/.exec_clock.60
    149217 =C2=B1  0%     -11.6%     131895 =C2=B1  3%  sched_debug.cfs_rq:=
/.exec_clock.62
    149316 =C2=B1  0%     -11.9%     131527 =C2=B1  4%  sched_debug.cfs_rq:=
/.exec_clock.63
    149255 =C2=B1  0%     -10.7%     133320 =C2=B1  1%  sched_debug.cfs_rq:=
/.exec_clock.64
    149404 =C2=B1  0%     -12.5%     130691 =C2=B1  4%  sched_debug.cfs_rq:=
/.exec_clock.65
    149310 =C2=B1  0%     -10.4%     133745 =C2=B1  1%  sched_debug.cfs_rq:=
/.exec_clock.66
    149205 =C2=B1  0%     -13.7%     128814 =C2=B1  5%  sched_debug.cfs_rq:=
/.exec_clock.67
    149330 =C2=B1  0%     -12.5%     130595 =C2=B1  4%  sched_debug.cfs_rq:=
/.exec_clock.68
    148932 =C2=B1  0%     -12.2%     130763 =C2=B1  4%  sched_debug.cfs_rq:=
/.exec_clock.69
    149357 =C2=B1  0%     -11.5%     132207 =C2=B1  3%  sched_debug.cfs_rq:=
/.exec_clock.71
    147046 =C2=B1  1%     -16.6%     122628 =C2=B1  5%  sched_debug.cfs_rq:=
/.exec_clock.min
    884.43 =C2=B1 18%    +373.6%       4189 =C2=B1 50%  sched_debug.cfs_rq:=
/.exec_clock.stddev
      9.02 =C2=B1 21%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq:=
/.load.min
     61.38 =C2=B1120%     -86.6%       8.25 =C2=B1 10%  sched_debug.cfs_rq:=
/.load_avg.0
     16.00 =C2=B1 54%     -48.4%       8.25 =C2=B1 10%  sched_debug.cfs_rq:=
/.load_avg.27
     12.62 =C2=B1  7%     -44.6%       7.00 =C2=B1 10%  sched_debug.cfs_rq:=
/.load_avg.30
     14.62 =C2=B1 15%     -40.2%       8.75 =C2=B1 26%  sched_debug.cfs_rq:=
/.load_avg.32
     30.38 =C2=B1162%     -73.7%       8.00 =C2=B1 30%  sched_debug.cfs_rq:=
/.load_avg.40
     13.25 =C2=B1 36%     -45.3%       7.25 =C2=B1 15%  sched_debug.cfs_rq:=
/.load_avg.45
     14.12 =C2=B1 42%     -54.0%       6.50 =C2=B1 25%  sched_debug.cfs_rq:=
/.load_avg.47
     46.38 =C2=B1117%     -82.7%       8.00 =C2=B1 25%  sched_debug.cfs_rq:=
/.load_avg.49
     13.00 =C2=B1  7%     -32.7%       8.75 =C2=B1 23%  sched_debug.cfs_rq:=
/.load_avg.5
     14.62 =C2=B1 35%     -41.9%       8.50 =C2=B1 13%  sched_debug.cfs_rq:=
/.load_avg.51
     43.50 =C2=B1125%     -79.3%       9.00 =C2=B1 17%  sched_debug.cfs_rq:=
/.load_avg.54
     11.88 =C2=B1 13%     -32.6%       8.00 =C2=B1  8%  sched_debug.cfs_rq:=
/.load_avg.56
     35.12 =C2=B1158%     -77.2%       8.00 =C2=B1 12%  sched_debug.cfs_rq:=
/.load_avg.59
     11.75 =C2=B1  7%     -29.8%       8.25 =C2=B1 13%  sched_debug.cfs_rq:=
/.load_avg.61
     11.25 =C2=B1  8%     -35.6%       7.25 =C2=B1 28%  sched_debug.cfs_rq:=
/.load_avg.63
     13.12 =C2=B1 43%     -37.1%       8.25 =C2=B1 15%  sched_debug.cfs_rq:=
/.load_avg.64
     13.38 =C2=B1 17%     -36.4%       8.50 =C2=B1 24%  sched_debug.cfs_rq:=
/.load_avg.68
     25.75 =C2=B1128%     -69.9%       7.75 =C2=B1  5%  sched_debug.cfs_rq:=
/.load_avg.8
      9.46 =C2=B1 13%     -79.3%       1.96 =C2=B1 43%  sched_debug.cfs_rq:=
/.load_avg.min
  10479918 =C2=B1  4%     -11.4%    9288415 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.0
  10890420 =C2=B1  0%     -14.7%    9290505 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.1
  10891488 =C2=B1  0%     -15.2%    9231294 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.10
  10858376 =C2=B1  1%     -14.4%    9291750 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.11
  10802938 =C2=B1  2%     -15.6%    9116220 =C2=B1  3%  sched_debug.cfs_rq:=
/.min_vruntime.12
  10912852 =C2=B1  0%     -15.0%    9280305 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.13
  10895612 =C2=B1  0%     -17.9%    8948904 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.14
  10925963 =C2=B1  0%     -15.3%    9250060 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.15
  10864224 =C2=B1  1%     -14.9%    9242728 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.16
  10795077 =C2=B1  2%     -14.3%    9250804 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.17
  10809039 =C2=B1  2%     -16.3%    9048343 =C2=B1  5%  sched_debug.cfs_rq:=
/.min_vruntime.18
  10859700 =C2=B1  0%     -17.0%    9011307 =C2=B1  5%  sched_debug.cfs_rq:=
/.min_vruntime.19
  10831275 =C2=B1  1%     -14.8%    9233019 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.2
  10885644 =C2=B1  0%     -14.9%    9258769 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.20
  10880275 =C2=B1  0%     -15.8%    9163447 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.21
  10792436 =C2=B1  2%     -14.1%    9273900 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.23
  10875017 =C2=B1  0%     -16.3%    9100453 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.24
  10888011 =C2=B1  0%     -17.1%    9022224 =C2=B1  5%  sched_debug.cfs_rq:=
/.min_vruntime.25
  10819023 =C2=B1  1%     -16.4%    9047511 =C2=B1  5%  sched_debug.cfs_rq:=
/.min_vruntime.26
  10883085 =C2=B1  0%     -16.9%    9043081 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.27
  10885901 =C2=B1  0%     -17.6%    8973418 =C2=B1  6%  sched_debug.cfs_rq:=
/.min_vruntime.28
  10835377 =C2=B1  1%     -15.4%    9167655 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.29
  10916573 =C2=B1  0%     -15.6%    9214919 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.3
  10828771 =C2=B1  1%     -17.3%    8954761 =C2=B1  5%  sched_debug.cfs_rq:=
/.min_vruntime.30
  10825974 =C2=B1  1%     -14.1%    9296456 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.31
  10870015 =C2=B1  0%     -15.5%    9185610 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.32
  10479658 =C2=B1  5%     -12.7%    9150895 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.33
  10872735 =C2=B1  0%     -17.3%    8995472 =C2=B1  3%  sched_debug.cfs_rq:=
/.min_vruntime.34
  10883226 =C2=B1  0%     -16.6%    9072677 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.35
  10699044 =C2=B1  3%     -13.2%    9287905 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.36
  10961678 =C2=B1  0%     -15.3%    9280811 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.37
  10923960 =C2=B1  0%     -16.2%    9156038 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.38
  10964280 =C2=B1  0%     -15.3%    9291249 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.39
  10898103 =C2=B1  0%     -16.3%    9117559 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.4
  10947812 =C2=B1  0%     -16.9%    9093954 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.40
  10977536 =C2=B1  0%     -15.7%    9253040 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.41
  10768870 =C2=B1  3%     -13.7%    9296068 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.42
  10883503 =C2=B1  1%     -14.9%    9261779 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.43
  10773650 =C2=B1  4%     -13.9%    9273084 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.44
  10946387 =C2=B1  0%     -15.2%    9287998 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.45
  10900827 =C2=B1  1%     -15.3%    9230428 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.46
  10875189 =C2=B1  2%     -14.7%    9272612 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.47
  10834749 =C2=B1  2%     -16.6%    9037986 =C2=B1  3%  sched_debug.cfs_rq:=
/.min_vruntime.48
  10889793 =C2=B1  1%     -15.0%    9253925 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.49
  10944233 =C2=B1  0%     -15.3%    9270521 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.5
  10956058 =C2=B1  0%     -19.2%    8856319 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.50
  10972252 =C2=B1  0%     -15.9%    9232758 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.51
  10892778 =C2=B1  1%     -16.3%    9119902 =C2=B1  3%  sched_debug.cfs_rq:=
/.min_vruntime.52
  10742063 =C2=B1  4%     -14.9%    9142584 =C2=B1  3%  sched_debug.cfs_rq:=
/.min_vruntime.54
  10758920 =C2=B1  2%     -15.7%    9072247 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.55
  10925015 =C2=B1  0%     -18.2%    8938336 =C2=B1  5%  sched_debug.cfs_rq:=
/.min_vruntime.56
  10798345 =C2=B1  3%     -17.6%    8898076 =C2=B1  6%  sched_debug.cfs_rq:=
/.min_vruntime.57
  10807414 =C2=B1  2%     -16.5%    9027746 =C2=B1  5%  sched_debug.cfs_rq:=
/.min_vruntime.58
  10926248 =C2=B1  0%     -16.8%    9095889 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.60
  10926715 =C2=B1  0%     -17.5%    9019675 =C2=B1  6%  sched_debug.cfs_rq:=
/.min_vruntime.61
  10797287 =C2=B1  2%     -15.2%    9156575 =C2=B1  3%  sched_debug.cfs_rq:=
/.min_vruntime.62
  10926948 =C2=B1  0%     -16.5%    9124362 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.63
  10873920 =C2=B1  1%     -14.8%    9263276 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.64
  10938027 =C2=B1  0%     -17.2%    9058000 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.65
  10937954 =C2=B1  0%     -15.2%    9276301 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.66
  10809492 =C2=B1  2%     -17.3%    8934408 =C2=B1  5%  sched_debug.cfs_rq:=
/.min_vruntime.67
  10892134 =C2=B1  1%     -16.9%    9055828 =C2=B1  5%  sched_debug.cfs_rq:=
/.min_vruntime.68
  10857989 =C2=B1  1%     -14.3%    9301709 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.7
  10928745 =C2=B1  0%     -20.7%    8666145 =C2=B1  5%  sched_debug.cfs_rq:=
/.min_vruntime.70
  10910428 =C2=B1  0%     -16.8%    9074272 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.71
  10846736 =C2=B1  1%     -14.2%    9309959 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.8
  10895257 =C2=B1  0%     -14.8%    9280051 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.9
  10843942 =C2=B1  0%     -15.7%    9144070 =C2=B1  3%  sched_debug.cfs_rq:=
/.min_vruntime.avg
  11008913 =C2=B1  0%     -14.5%    9413791 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.max
   9216851 =C2=B1  3%      -9.8%    8315592 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.min
      0.84 =C2=B1  1%     -11.0%       0.75 =C2=B1  1%  sched_debug.cfs_rq:=
/.nr_running.avg
      0.67 =C2=B1 21%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq:=
/.nr_running.min
      0.07 =C2=B1 32%    +301.3%       0.29 =C2=B1  2%  sched_debug.cfs_rq:=
/.nr_running.stddev
      1.32 =C2=B1  6%     -61.4%       0.51 =C2=B1 12%  sched_debug.cfs_rq:=
/.nr_spread_over.avg
     20.42 =C2=B1 16%     -69.4%       6.25 =C2=B1 26%  sched_debug.cfs_rq:=
/.nr_spread_over.max
      3.57 =C2=B1  8%     -66.4%       1.20 =C2=B1 15%  sched_debug.cfs_rq:=
/.nr_spread_over.stddev
     52.38 =C2=B1138%     -89.0%       5.75 =C2=B1 14%  sched_debug.cfs_rq:=
/.runnable_load_avg.0
     11.75 =C2=B1 27%     -40.4%       7.00 =C2=B1 20%  sched_debug.cfs_rq:=
/.runnable_load_avg.1
     10.75 =C2=B1  4%     -34.9%       7.00 =C2=B1 17%  sched_debug.cfs_rq:=
/.runnable_load_avg.16
     11.50 =C2=B1 13%     -47.8%       6.00 =C2=B1 23%  sched_debug.cfs_rq:=
/.runnable_load_avg.18
     11.00 =C2=B1  6%     -47.7%       5.75 =C2=B1 18%  sched_debug.cfs_rq:=
/.runnable_load_avg.20
     12.12 =C2=B1 21%     -38.1%       7.50 =C2=B1 20%  sched_debug.cfs_rq:=
/.runnable_load_avg.22
     55.00 =C2=B1117%     -86.8%       7.25 =C2=B1 15%  sched_debug.cfs_rq:=
/.runnable_load_avg.23
     10.88 =C2=B1 10%     -47.1%       5.75 =C2=B1 14%  sched_debug.cfs_rq:=
/.runnable_load_avg.24
     11.38 =C2=B1  9%     -47.3%       6.00 =C2=B1 11%  sched_debug.cfs_rq:=
/.runnable_load_avg.26
     11.00 =C2=B1  6%     -45.5%       6.00 =C2=B1 11%  sched_debug.cfs_rq:=
/.runnable_load_avg.27
     10.62 =C2=B1  4%     -45.9%       5.75 =C2=B1 33%  sched_debug.cfs_rq:=
/.runnable_load_avg.29
     11.12 =C2=B1  7%     -46.1%       6.00 =C2=B1 11%  sched_debug.cfs_rq:=
/.runnable_load_avg.30
     10.88 =C2=B1  8%     -42.5%       6.25 =C2=B1 17%  sched_debug.cfs_rq:=
/.runnable_load_avg.31
     11.62 =C2=B1 21%     -44.1%       6.50 =C2=B1 23%  sched_debug.cfs_rq:=
/.runnable_load_avg.32
     30.12 =C2=B1171%     -82.6%       5.25 =C2=B1 36%  sched_debug.cfs_rq:=
/.runnable_load_avg.33
     10.12 =C2=B1  3%     -35.8%       6.50 =C2=B1 17%  sched_debug.cfs_rq:=
/.runnable_load_avg.38
     10.62 =C2=B1 12%     -43.5%       6.00 =C2=B1 20%  sched_debug.cfs_rq:=
/.runnable_load_avg.40
     10.38 =C2=B1  6%     -27.7%       7.50 =C2=B1 20%  sched_debug.cfs_rq:=
/.runnable_load_avg.41
     23.50 =C2=B1142%     -72.3%       6.50 =C2=B1 23%  sched_debug.cfs_rq:=
/.runnable_load_avg.42
     10.75 =C2=B1  6%     -46.5%       5.75 =C2=B1  7%  sched_debug.cfs_rq:=
/.runnable_load_avg.43
     10.12 =C2=B1 10%     -38.3%       6.25 =C2=B1 28%  sched_debug.cfs_rq:=
/.runnable_load_avg.45
     10.25 =C2=B1  4%     -36.6%       6.50 =C2=B1 27%  sched_debug.cfs_rq:=
/.runnable_load_avg.47
     31.62 =C2=B1174%     -77.9%       7.00 =C2=B1 26%  sched_debug.cfs_rq:=
/.runnable_load_avg.49
     10.75 =C2=B1  7%     -44.2%       6.00 =C2=B1 20%  sched_debug.cfs_rq:=
/.runnable_load_avg.5
     10.62 =C2=B1  9%     -38.8%       6.50 =C2=B1 13%  sched_debug.cfs_rq:=
/.runnable_load_avg.50
     10.50 =C2=B1  4%     -38.1%       6.50 =C2=B1 17%  sched_debug.cfs_rq:=
/.runnable_load_avg.51
     29.50 =C2=B1172%     -78.0%       6.50 =C2=B1 17%  sched_debug.cfs_rq:=
/.runnable_load_avg.54
     10.75 =C2=B1  7%     -48.8%       5.50 =C2=B1 20%  sched_debug.cfs_rq:=
/.runnable_load_avg.55
     10.12 =C2=B1  3%     -35.8%       6.50 =C2=B1  7%  sched_debug.cfs_rq:=
/.runnable_load_avg.56
     10.50 =C2=B1 16%     -42.9%       6.00 =C2=B1 11%  sched_debug.cfs_rq:=
/.runnable_load_avg.58
     31.62 =C2=B1177%     -82.6%       5.50 =C2=B1  9%  sched_debug.cfs_rq:=
/.runnable_load_avg.59
     48.75 =C2=B1207%     -88.2%       5.75 =C2=B1 33%  sched_debug.cfs_rq:=
/.runnable_load_avg.62
     10.50 =C2=B1  6%     -40.5%       6.25 =C2=B1 23%  sched_debug.cfs_rq:=
/.runnable_load_avg.63
     10.38 =C2=B1  6%     -34.9%       6.75 =C2=B1 12%  sched_debug.cfs_rq:=
/.runnable_load_avg.64
     10.50 =C2=B1  6%     -35.7%       6.75 =C2=B1 12%  sched_debug.cfs_rq:=
/.runnable_load_avg.65
     10.62 =C2=B1  8%     -41.2%       6.25 =C2=B1 13%  sched_debug.cfs_rq:=
/.runnable_load_avg.67
     10.88 =C2=B1 12%     -42.5%       6.25 =C2=B1  6%  sched_debug.cfs_rq:=
/.runnable_load_avg.68
     61.38 =C2=B1144%     -89.0%       6.75 =C2=B1 16%  sched_debug.cfs_rq:=
/.runnable_load_avg.69
     10.38 =C2=B1  4%     -42.2%       6.00 =C2=B1 11%  sched_debug.cfs_rq:=
/.runnable_load_avg.8
     32.88 =C2=B1181%     -80.2%       6.50 =C2=B1 17%  sched_debug.cfs_rq:=
/.runnable_load_avg.9
      8.23 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq:=
/.runnable_load_avg.min
    322674 =C2=B1124%    -153.4%    -172395 =C2=B1-64%  sched_debug.cfs_rq:=
/.spread0.12
    432532 =C2=B1105%    -101.9%      -8313 =C2=B1-457%  sched_debug.cfs_rq=
:/.spread0.13
    445491 =C2=B1101%    -108.7%     -38585 =C2=B1-130%  sched_debug.cfs_rq=
:/.spread0.15
    494579 =C2=B1 92%    -107.3%     -36064 =C2=B1-114%  sched_debug.cfs_rq=
:/.spread0.41
    406664 =C2=B1113%    -108.7%     -35252 =C2=B1-139%  sched_debug.cfs_rq=
:/.spread0.49
    464173 =C2=B1 95%    -103.9%     -17974 =C2=B1-392%  sched_debug.cfs_rq=
:/.spread0.5
    472906 =C2=B1 99%    -191.5%    -432859 =C2=B1-92%  sched_debug.cfs_rq:=
/.spread0.50
    489082 =C2=B1 93%    -111.5%     -56435 =C2=B1-128%  sched_debug.cfs_rq=
:/.spread0.51
    441736 =C2=B1107%    -179.4%    -350918 =C2=B1-84%  sched_debug.cfs_rq:=
/.spread0.56
    454512 =C2=B1105%    -150.9%    -231348 =C2=B1-134%  sched_debug.cfs_rq=
:/.spread0.65
    454420 =C2=B1 98%    -102.9%     -13048 =C2=B1-739%  sched_debug.cfs_rq=
:/.spread0.66
    325946 =C2=B1157%    -208.9%    -354948 =C2=B1-76%  sched_debug.cfs_rq:=
/.spread0.67
    445103 =C2=B1106%    -240.0%    -623250 =C2=B1-66%  sched_debug.cfs_rq:=
/.spread0.70
    426770 =C2=B1110%    -150.4%    -215128 =C2=B1-114%  sched_debug.cfs_rq=
:/.spread0.71
    361814 =C2=B1129%    -140.0%    -144901 =C2=B1-48%  sched_debug.cfs_rq:=
/.spread0.avg
     61.88 =C2=B1121%     -86.7%       8.25 =C2=B1 10%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.0
     16.00 =C2=B1 54%     -48.4%       8.25 =C2=B1 10%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.27
     12.62 =C2=B1  7%     -44.6%       7.00 =C2=B1 10%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.30
     14.62 =C2=B1 15%     -40.2%       8.75 =C2=B1 26%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.32
     30.38 =C2=B1162%     -73.7%       8.00 =C2=B1 30%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.40
     13.25 =C2=B1 36%     -45.3%       7.25 =C2=B1 15%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.45
     14.25 =C2=B1 44%     -54.4%       6.50 =C2=B1 25%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.47
     46.50 =C2=B1117%     -82.8%       8.00 =C2=B1 25%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.49
     13.00 =C2=B1  7%     -32.7%       8.75 =C2=B1 23%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.5
     14.62 =C2=B1 35%     -41.9%       8.50 =C2=B1 13%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.51
     43.38 =C2=B1125%     -79.3%       9.00 =C2=B1 17%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.54
     11.88 =C2=B1 13%     -32.6%       8.00 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.56
     35.12 =C2=B1158%     -77.2%       8.00 =C2=B1 12%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.59
     11.75 =C2=B1  7%     -29.8%       8.25 =C2=B1 13%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.61
     11.25 =C2=B1  8%     -35.6%       7.25 =C2=B1 28%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.63
     13.12 =C2=B1 43%     -37.1%       8.25 =C2=B1 15%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.64
     13.38 =C2=B1 17%     -36.4%       8.50 =C2=B1 24%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.68
     25.75 =C2=B1128%     -69.9%       7.75 =C2=B1  5%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.8
      9.46 =C2=B1 13%     -79.3%       1.96 =C2=B1 43%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.min
    854.00 =C2=B1  0%     -12.7%     745.25 =C2=B1  5%  sched_debug.cfs_rq:=
/.util_avg.0
    861.00 =C2=B1  5%     -18.2%     704.50 =C2=B1  9%  sched_debug.cfs_rq:=
/.util_avg.26
    848.12 =C2=B1  0%     -21.0%     670.25 =C2=B1 10%  sched_debug.cfs_rq:=
/.util_avg.30
    872.38 =C2=B1  3%     -17.4%     720.50 =C2=B1  8%  sched_debug.cfs_rq:=
/.util_avg.35
    845.62 =C2=B1  0%     -15.9%     711.25 =C2=B1  5%  sched_debug.cfs_rq:=
/.util_avg.38
    867.25 =C2=B1  5%     -23.4%     664.25 =C2=B1 10%  sched_debug.cfs_rq:=
/.util_avg.40
    847.88 =C2=B1  0%     -14.5%     724.75 =C2=B1  6%  sched_debug.cfs_rq:=
/.util_avg.43
    859.00 =C2=B1  2%     -15.2%     728.75 =C2=B1  9%  sched_debug.cfs_rq:=
/.util_avg.49
    856.38 =C2=B1  1%     -10.9%     763.00 =C2=B1  9%  sched_debug.cfs_rq:=
/.util_avg.50
    907.25 =C2=B1  6%     -11.1%     806.25 =C2=B1  1%  sched_debug.cfs_rq:=
/.util_avg.7
    856.58 =C2=B1  0%     -11.3%     759.43 =C2=B1  1%  sched_debug.cfs_rq:=
/.util_avg.avg
    731.88 =C2=B1 13%     -62.1%     277.58 =C2=B1 44%  sched_debug.cfs_rq:=
/.util_avg.min
     46.74 =C2=B1 31%    +189.9%     135.48 =C2=B1 25%  sched_debug.cfs_rq:=
/.util_avg.stddev
    406024 =C2=B1 27%     -44.1%     226799 =C2=B1 24%  sched_debug.cpu.avg=
_idle.22
    489482 =C2=B1 29%     -46.4%     262183 =C2=B1 25%  sched_debug.cpu.avg=
_idle.33
    350126 =C2=B1  8%     -24.1%     265725 =C2=B1 19%  sched_debug.cpu.avg=
_idle.avg
    300726 =C2=B1  7%     -38.5%     184866 =C2=B1 23%  sched_debug.cpu.avg=
_idle.stddev
     19.40 =C2=B1 55%     -70.8%       5.68 =C2=B1 17%  sched_debug.cpu.clo=
ck.stddev
     19.40 =C2=B1 55%     -70.8%       5.68 =C2=B1 17%  sched_debug.cpu.clo=
ck_task.stddev
     52.62 =C2=B1137%     -86.7%       7.00 =C2=B1 17%  sched_debug.cpu.cpu=
_load[0].0
     11.50 =C2=B1 29%     -39.1%       7.00 =C2=B1 10%  sched_debug.cpu.cpu=
_load[0].1
     11.50 =C2=B1 23%     -39.1%       7.00 =C2=B1 10%  sched_debug.cpu.cpu=
_load[0].13
     10.75 =C2=B1  4%     -34.9%       7.00 =C2=B1 17%  sched_debug.cpu.cpu=
_load[0].16
     11.25 =C2=B1 13%     -44.4%       6.25 =C2=B1 17%  sched_debug.cpu.cpu=
_load[0].18
     11.00 =C2=B1  6%     -45.5%       6.00 =C2=B1 20%  sched_debug.cpu.cpu=
_load[0].20
     12.00 =C2=B1 22%     -50.0%       6.00 =C2=B1 42%  sched_debug.cpu.cpu=
_load[0].22
     55.00 =C2=B1117%     -88.2%       6.50 =C2=B1  7%  sched_debug.cpu.cpu=
_load[0].23
     10.88 =C2=B1  5%     -47.1%       5.75 =C2=B1 18%  sched_debug.cpu.cpu=
_load[0].26
     11.00 =C2=B1  6%     -43.2%       6.25 =C2=B1  6%  sched_debug.cpu.cpu=
_load[0].27
     10.62 =C2=B1  4%     -38.8%       6.50 =C2=B1 27%  sched_debug.cpu.cpu=
_load[0].29
     11.12 =C2=B1  7%     -48.3%       5.75 =C2=B1  7%  sched_debug.cpu.cpu=
_load[0].30
     10.88 =C2=B1  8%     -35.6%       7.00 =C2=B1 14%  sched_debug.cpu.cpu=
_load[0].31
     11.62 =C2=B1 21%     -46.2%       6.25 =C2=B1 30%  sched_debug.cpu.cpu=
_load[0].32
     30.00 =C2=B1172%     -80.0%       6.00 =C2=B1 20%  sched_debug.cpu.cpu=
_load[0].33
     10.12 =C2=B1  3%     -30.9%       7.00 =C2=B1 17%  sched_debug.cpu.cpu=
_load[0].38
     10.12 =C2=B1  3%     -43.2%       5.75 =C2=B1 43%  sched_debug.cpu.cpu=
_load[0].40
     44.12 =C2=B1133%     -84.7%       6.75 =C2=B1 12%  sched_debug.cpu.cpu=
_load[0].42
     10.75 =C2=B1  6%     -41.9%       6.25 =C2=B1 17%  sched_debug.cpu.cpu=
_load[0].43
     10.12 =C2=B1 10%     -38.3%       6.25 =C2=B1 28%  sched_debug.cpu.cpu=
_load[0].45
     10.25 =C2=B1  4%     -36.6%       6.50 =C2=B1 27%  sched_debug.cpu.cpu=
_load[0].47
     10.88 =C2=B1  5%     -35.6%       7.00 =C2=B1 10%  sched_debug.cpu.cpu=
_load[0].5
     10.50 =C2=B1  9%     -45.2%       5.75 =C2=B1  7%  sched_debug.cpu.cpu=
_load[0].50
     10.50 =C2=B1  4%     -40.5%       6.25 =C2=B1 17%  sched_debug.cpu.cpu=
_load[0].51
     29.25 =C2=B1172%     -78.6%       6.25 =C2=B1 17%  sched_debug.cpu.cpu=
_load[0].54
     10.12 =C2=B1  3%     -43.2%       5.75 =C2=B1  7%  sched_debug.cpu.cpu=
_load[0].56
     10.50 =C2=B1 16%     -45.2%       5.75 =C2=B1 14%  sched_debug.cpu.cpu=
_load[0].58
     31.62 =C2=B1177%     -83.4%       5.25 =C2=B1 15%  sched_debug.cpu.cpu=
_load[0].59
     10.38 =C2=B1  6%     -44.6%       5.75 =C2=B1 18%  sched_debug.cpu.cpu=
_load[0].61
     48.75 =C2=B1207%     -88.7%       5.50 =C2=B1 41%  sched_debug.cpu.cpu=
_load[0].62
     10.50 =C2=B1  6%     -42.9%       6.00 =C2=B1 31%  sched_debug.cpu.cpu=
_load[0].63
     10.38 =C2=B1  6%     -39.8%       6.25 =C2=B1 13%  sched_debug.cpu.cpu=
_load[0].64
     10.50 =C2=B1  6%     -40.5%       6.25 =C2=B1 17%  sched_debug.cpu.cpu=
_load[0].65
     10.88 =C2=B1 12%     -42.5%       6.25 =C2=B1 17%  sched_debug.cpu.cpu=
_load[0].67
     10.88 =C2=B1 12%     -49.4%       5.50 =C2=B1 20%  sched_debug.cpu.cpu=
_load[0].68
     61.38 =C2=B1144%     -90.2%       6.00 =C2=B1 11%  sched_debug.cpu.cpu=
_load[0].69
     11.25 =C2=B1 19%     -44.4%       6.25 =C2=B1 23%  sched_debug.cpu.cpu=
_load[0].8
     33.12 =C2=B1180%     -78.9%       7.00 =C2=B1 17%  sched_debug.cpu.cpu=
_load[0].9
      8.44 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu.cpu=
_load[0].min
     52.62 =C2=B1137%     -87.2%       6.75 =C2=B1 21%  sched_debug.cpu.cpu=
_load[1].0
     11.38 =C2=B1 25%     -40.7%       6.75 =C2=B1 12%  sched_debug.cpu.cpu=
_load[1].1
     11.62 =C2=B1 21%     -44.1%       6.50 =C2=B1 13%  sched_debug.cpu.cpu=
_load[1].13
     10.75 =C2=B1  4%     -37.2%       6.75 =C2=B1 12%  sched_debug.cpu.cpu=
_load[1].16
     11.25 =C2=B1 13%     -42.2%       6.50 =C2=B1 23%  sched_debug.cpu.cpu=
_load[1].18
     11.00 =C2=B1  6%     -45.5%       6.00 =C2=B1 20%  sched_debug.cpu.cpu=
_load[1].20
     14.00 =C2=B1 41%     -51.8%       6.75 =C2=B1 28%  sched_debug.cpu.cpu=
_load[1].22
     53.50 =C2=B1117%     -87.9%       6.50 =C2=B1 13%  sched_debug.cpu.cpu=
_load[1].23
     11.00 =C2=B1  6%     -47.7%       5.75 =C2=B1 18%  sched_debug.cpu.cpu=
_load[1].26
     11.00 =C2=B1  6%     -45.5%       6.00 =C2=B1 11%  sched_debug.cpu.cpu=
_load[1].27
     10.62 =C2=B1  4%     -41.2%       6.25 =C2=B1 23%  sched_debug.cpu.cpu=
_load[1].29
     11.00 =C2=B1  7%     -50.0%       5.50 =C2=B1 15%  sched_debug.cpu.cpu=
_load[1].30
     10.88 =C2=B1  8%     -37.9%       6.75 =C2=B1 12%  sched_debug.cpu.cpu=
_load[1].31
     11.50 =C2=B1 18%     -45.7%       6.25 =C2=B1 28%  sched_debug.cpu.cpu=
_load[1].32
     33.00 =C2=B1156%     -81.8%       6.00 =C2=B1 20%  sched_debug.cpu.cpu=
_load[1].33
     10.12 =C2=B1  3%     -35.8%       6.50 =C2=B1 17%  sched_debug.cpu.cpu=
_load[1].38
     16.38 =C2=B1 75%     -55.7%       7.25 =C2=B1 24%  sched_debug.cpu.cpu=
_load[1].39
     15.50 =C2=B1 91%     -61.3%       6.00 =C2=B1 35%  sched_debug.cpu.cpu=
_load[1].40
     42.25 =C2=B1135%     -84.6%       6.50 =C2=B1  7%  sched_debug.cpu.cpu=
_load[1].42
     10.75 =C2=B1  6%     -41.9%       6.25 =C2=B1 17%  sched_debug.cpu.cpu=
_load[1].43
     10.25 =C2=B1 10%     -36.6%       6.50 =C2=B1 23%  sched_debug.cpu.cpu=
_load[1].45
     10.25 =C2=B1  4%     -36.6%       6.50 =C2=B1 27%  sched_debug.cpu.cpu=
_load[1].47
     10.88 =C2=B1  5%     -35.6%       7.00 =C2=B1 14%  sched_debug.cpu.cpu=
_load[1].5
     10.62 =C2=B1  9%     -45.9%       5.75 =C2=B1  7%  sched_debug.cpu.cpu=
_load[1].50
     10.50 =C2=B1  4%     -38.1%       6.50 =C2=B1 13%  sched_debug.cpu.cpu=
_load[1].51
     29.25 =C2=B1172%     -77.8%       6.50 =C2=B1 13%  sched_debug.cpu.cpu=
_load[1].54
     10.00 =C2=B1  5%     -37.5%       6.25 =C2=B1  6%  sched_debug.cpu.cpu=
_load[1].56
     11.75 =C2=B1 27%     -51.1%       5.75 =C2=B1 14%  sched_debug.cpu.cpu=
_load[1].58
     31.50 =C2=B1176%     -83.3%       5.25 =C2=B1 15%  sched_debug.cpu.cpu=
_load[1].59
     10.38 =C2=B1  6%     -42.2%       6.00 =C2=B1 11%  sched_debug.cpu.cpu=
_load[1].61
     48.75 =C2=B1207%     -88.7%       5.50 =C2=B1 30%  sched_debug.cpu.cpu=
_load[1].62
     10.50 =C2=B1  6%     -45.2%       5.75 =C2=B1 31%  sched_debug.cpu.cpu=
_load[1].63
     10.38 =C2=B1  6%     -37.3%       6.50 =C2=B1 17%  sched_debug.cpu.cpu=
_load[1].64
     10.50 =C2=B1  6%     -40.5%       6.25 =C2=B1  6%  sched_debug.cpu.cpu=
_load[1].65
     10.88 =C2=B1 12%     -44.8%       6.00 =C2=B1 11%  sched_debug.cpu.cpu=
_load[1].68
     62.50 =C2=B1144%     -90.0%       6.25 =C2=B1  6%  sched_debug.cpu.cpu=
_load[1].69
     10.88 =C2=B1 11%     -40.2%       6.50 =C2=B1 17%  sched_debug.cpu.cpu=
_load[1].8
     33.25 =C2=B1179%     -79.7%       6.75 =C2=B1 12%  sched_debug.cpu.cpu=
_load[1].9
      8.88 =C2=B1 18%     -94.8%       0.46 =C2=B1113%  sched_debug.cpu.cpu=
_load[1].min
     52.62 =C2=B1137%     -87.2%       6.75 =C2=B1 21%  sched_debug.cpu.cpu=
_load[2].0
     11.50 =C2=B1 22%     -39.1%       7.00 =C2=B1 10%  sched_debug.cpu.cpu=
_load[2].1
     11.50 =C2=B1 15%     -41.3%       6.75 =C2=B1 12%  sched_debug.cpu.cpu=
_load[2].13
     10.75 =C2=B1  4%     -37.2%       6.75 =C2=B1 12%  sched_debug.cpu.cpu=
_load[2].16
     11.25 =C2=B1 13%     -42.2%       6.50 =C2=B1 23%  sched_debug.cpu.cpu=
_load[2].18
     16.38 =C2=B1 89%     -54.2%       7.50 =C2=B1 24%  sched_debug.cpu.cpu=
_load[2].21
     19.00 =C2=B1101%     -64.5%       6.75 =C2=B1 28%  sched_debug.cpu.cpu=
_load[2].22
     49.12 =C2=B1118%     -86.8%       6.50 =C2=B1 13%  sched_debug.cpu.cpu=
_load[2].23
     11.50 =C2=B1 15%     -47.8%       6.00 =C2=B1 11%  sched_debug.cpu.cpu=
_load[2].26
     11.00 =C2=B1  6%     -45.5%       6.00 =C2=B1 11%  sched_debug.cpu.cpu=
_load[2].27
     10.62 =C2=B1  4%     -41.2%       6.25 =C2=B1 23%  sched_debug.cpu.cpu=
_load[2].29
     11.00 =C2=B1  7%     -50.0%       5.50 =C2=B1 15%  sched_debug.cpu.cpu=
_load[2].30
     10.88 =C2=B1  8%     -35.6%       7.00 =C2=B1 10%  sched_debug.cpu.cpu=
_load[2].31
     11.38 =C2=B1 16%     -42.9%       6.50 =C2=B1 27%  sched_debug.cpu.cpu=
_load[2].32
     34.50 =C2=B1151%     -82.6%       6.00 =C2=B1 20%  sched_debug.cpu.cpu=
_load[2].33
     10.12 =C2=B1  3%     -38.3%       6.25 =C2=B1 17%  sched_debug.cpu.cpu=
_load[2].38
     17.00 =C2=B1 74%     -55.9%       7.50 =C2=B1 20%  sched_debug.cpu.cpu=
_load[2].39
     14.12 =C2=B1 74%     -57.5%       6.00 =C2=B1 35%  sched_debug.cpu.cpu=
_load[2].40
     38.25 =C2=B1142%     -83.0%       6.50 =C2=B1  7%  sched_debug.cpu.cpu=
_load[2].42
     10.75 =C2=B1  6%     -41.9%       6.25 =C2=B1 17%  sched_debug.cpu.cpu=
_load[2].43
     10.75 =C2=B1 17%     -39.5%       6.50 =C2=B1 23%  sched_debug.cpu.cpu=
_load[2].45
     10.25 =C2=B1  4%     -34.1%       6.75 =C2=B1 21%  sched_debug.cpu.cpu=
_load[2].47
     11.00 =C2=B1  6%     -36.4%       7.00 =C2=B1 14%  sched_debug.cpu.cpu=
_load[2].5
     10.75 =C2=B1  7%     -44.2%       6.00 =C2=B1  0%  sched_debug.cpu.cpu=
_load[2].50
     10.75 =C2=B1  9%     -37.2%       6.75 =C2=B1 12%  sched_debug.cpu.cpu=
_load[2].51
     29.25 =C2=B1172%     -77.8%       6.50 =C2=B1 13%  sched_debug.cpu.cpu=
_load[2].54
     10.00 =C2=B1  5%     -37.5%       6.25 =C2=B1  6%  sched_debug.cpu.cpu=
_load[2].56
     17.00 =C2=B1 98%     -64.7%       6.00 =C2=B1 11%  sched_debug.cpu.cpu=
_load[2].58
     31.50 =C2=B1176%     -82.5%       5.50 =C2=B1  9%  sched_debug.cpu.cpu=
_load[2].59
     10.38 =C2=B1  6%     -37.3%       6.50 =C2=B1  7%  sched_debug.cpu.cpu=
_load[2].61
     48.75 =C2=B1207%     -87.7%       6.00 =C2=B1 31%  sched_debug.cpu.cpu=
_load[2].62
     10.50 =C2=B1  6%     -42.9%       6.00 =C2=B1 23%  sched_debug.cpu.cpu=
_load[2].63
     10.38 =C2=B1  6%     -34.9%       6.75 =C2=B1 12%  sched_debug.cpu.cpu=
_load[2].64
     10.50 =C2=B1  6%     -38.1%       6.50 =C2=B1  7%  sched_debug.cpu.cpu=
_load[2].65
     10.88 =C2=B1 12%     -44.8%       6.00 =C2=B1 11%  sched_debug.cpu.cpu=
_load[2].68
     63.75 =C2=B1143%     -89.8%       6.50 =C2=B1 13%  sched_debug.cpu.cpu=
_load[2].69
     10.62 =C2=B1  6%     -36.5%       6.75 =C2=B1 12%  sched_debug.cpu.cpu=
_load[2].8
     33.00 =C2=B1178%     -78.8%       7.00 =C2=B1 10%  sched_debug.cpu.cpu=
_load[2].9
      8.98 =C2=B1 16%     -91.2%       0.79 =C2=B1 56%  sched_debug.cpu.cpu=
_load[2].min
     52.38 =C2=B1138%     -86.6%       7.00 =C2=B1 17%  sched_debug.cpu.cpu=
_load[3].0
     11.50 =C2=B1 18%     -30.4%       8.00 =C2=B1 15%  sched_debug.cpu.cpu=
_load[3].1
     11.38 =C2=B1 13%     -40.7%       6.75 =C2=B1 12%  sched_debug.cpu.cpu=
_load[3].13
     10.75 =C2=B1  4%     -32.6%       7.25 =C2=B1 15%  sched_debug.cpu.cpu=
_load[3].16
     11.25 =C2=B1 13%     -44.4%       6.25 =C2=B1 28%  sched_debug.cpu.cpu=
_load[3].18
     23.12 =C2=B1133%     -69.7%       7.00 =C2=B1 26%  sched_debug.cpu.cpu=
_load[3].22
     45.00 =C2=B1122%     -85.0%       6.75 =C2=B1 12%  sched_debug.cpu.cpu=
_load[3].23
     11.75 =C2=B1 20%     -48.9%       6.00 =C2=B1 11%  sched_debug.cpu.cpu=
_load[3].26
     11.00 =C2=B1  6%     -43.2%       6.25 =C2=B1  6%  sched_debug.cpu.cpu=
_load[3].27
     10.62 =C2=B1  4%     -36.5%       6.75 =C2=B1 21%  sched_debug.cpu.cpu=
_load[3].29
     11.12 =C2=B1  7%     -48.3%       5.75 =C2=B1  7%  sched_debug.cpu.cpu=
_load[3].30
     10.88 =C2=B1  8%     -33.3%       7.25 =C2=B1 11%  sched_debug.cpu.cpu=
_load[3].31
     11.25 =C2=B1 13%     -40.0%       6.75 =C2=B1 26%  sched_debug.cpu.cpu=
_load[3].32
     35.12 =C2=B1148%     -82.9%       6.00 =C2=B1 20%  sched_debug.cpu.cpu=
_load[3].33
     10.12 =C2=B1  3%     -30.9%       7.00 =C2=B1 17%  sched_debug.cpu.cpu=
_load[3].38
     12.50 =C2=B1 49%     -52.0%       6.00 =C2=B1 35%  sched_debug.cpu.cpu=
_load[3].40
     10.75 =C2=B1  6%     -41.9%       6.25 =C2=B1 17%  sched_debug.cpu.cpu=
_load[3].43
     11.00 =C2=B1 22%     -40.9%       6.50 =C2=B1 23%  sched_debug.cpu.cpu=
_load[3].45
     10.25 =C2=B1  4%     -34.1%       6.75 =C2=B1 21%  sched_debug.cpu.cpu=
_load[3].47
     11.00 =C2=B1  6%     -34.1%       7.25 =C2=B1 11%  sched_debug.cpu.cpu=
_load[3].5
     10.88 =C2=B1  8%     -42.5%       6.25 =C2=B1  6%  sched_debug.cpu.cpu=
_load[3].50
     11.00 =C2=B1 14%     -36.4%       7.00 =C2=B1 10%  sched_debug.cpu.cpu=
_load[3].51
     29.12 =C2=B1171%     -77.7%       6.50 =C2=B1 13%  sched_debug.cpu.cpu=
_load[3].54
     10.12 =C2=B1  3%     -38.3%       6.25 =C2=B1  6%  sched_debug.cpu.cpu=
_load[3].56
     22.62 =C2=B1139%     -73.5%       6.00 =C2=B1 11%  sched_debug.cpu.cpu=
_load[3].58
     31.38 =C2=B1176%     -81.7%       5.75 =C2=B1  7%  sched_debug.cpu.cpu=
_load[3].59
     10.38 =C2=B1  6%     -34.9%       6.75 =C2=B1 12%  sched_debug.cpu.cpu=
_load[3].61
     48.62 =C2=B1207%     -87.7%       6.00 =C2=B1 31%  sched_debug.cpu.cpu=
_load[3].62
     10.50 =C2=B1  6%     -40.5%       6.25 =C2=B1 28%  sched_debug.cpu.cpu=
_load[3].63
     10.38 =C2=B1  6%     -34.9%       6.75 =C2=B1 12%  sched_debug.cpu.cpu=
_load[3].64
     10.50 =C2=B1  6%     -33.3%       7.00 =C2=B1 14%  sched_debug.cpu.cpu=
_load[3].65
     10.88 =C2=B1 12%     -42.5%       6.25 =C2=B1  6%  sched_debug.cpu.cpu=
_load[3].68
     63.62 =C2=B1142%     -89.0%       7.00 =C2=B1 10%  sched_debug.cpu.cpu=
_load[3].69
     10.88 =C2=B1  8%     -37.9%       6.75 =C2=B1 12%  sched_debug.cpu.cpu=
_load[3].8
     32.62 =C2=B1178%     -78.5%       7.00 =C2=B1 10%  sched_debug.cpu.cpu=
_load[3].9
      9.02 =C2=B1 16%     -87.5%       1.12 =C2=B1 51%  sched_debug.cpu.cpu=
_load[3].min
     52.38 =C2=B1138%     -86.6%       7.00 =C2=B1 17%  sched_debug.cpu.cpu=
_load[4].0
     13.12 =C2=B1 41%     -35.2%       8.50 =C2=B1 13%  sched_debug.cpu.cpu=
_load[4].10
     10.75 =C2=B1  4%     -32.6%       7.25 =C2=B1 15%  sched_debug.cpu.cpu=
_load[4].16
     11.25 =C2=B1 13%     -44.4%       6.25 =C2=B1 28%  sched_debug.cpu.cpu=
_load[4].18
     25.12 =C2=B1147%     -72.1%       7.00 =C2=B1 26%  sched_debug.cpu.cpu=
_load[4].22
     41.50 =C2=B1130%     -83.7%       6.75 =C2=B1 12%  sched_debug.cpu.cpu=
_load[4].23
     11.75 =C2=B1 20%     -48.9%       6.00 =C2=B1 11%  sched_debug.cpu.cpu=
_load[4].26
     11.00 =C2=B1  6%     -43.2%       6.25 =C2=B1  6%  sched_debug.cpu.cpu=
_load[4].27
     10.62 =C2=B1  4%     -36.5%       6.75 =C2=B1 21%  sched_debug.cpu.cpu=
_load[4].29
     11.12 =C2=B1  7%     -48.3%       5.75 =C2=B1  7%  sched_debug.cpu.cpu=
_load[4].30
     10.88 =C2=B1  8%     -33.3%       7.25 =C2=B1 11%  sched_debug.cpu.cpu=
_load[4].31
     11.12 =C2=B1 11%     -39.3%       6.75 =C2=B1 26%  sched_debug.cpu.cpu=
_load[4].32
     36.12 =C2=B1140%     -83.4%       6.00 =C2=B1 20%  sched_debug.cpu.cpu=
_load[4].33
     10.12 =C2=B1  3%     -30.9%       7.00 =C2=B1 17%  sched_debug.cpu.cpu=
_load[4].38
     11.38 =C2=B1 28%     -47.3%       6.00 =C2=B1 35%  sched_debug.cpu.cpu=
_load[4].40
     10.75 =C2=B1  6%     -41.9%       6.25 =C2=B1 17%  sched_debug.cpu.cpu=
_load[4].43
     10.88 =C2=B1 20%     -40.2%       6.50 =C2=B1 23%  sched_debug.cpu.cpu=
_load[4].45
     10.25 =C2=B1  4%     -34.1%       6.75 =C2=B1 21%  sched_debug.cpu.cpu=
_load[4].47
     11.00 =C2=B1  6%     -34.1%       7.25 =C2=B1 11%  sched_debug.cpu.cpu=
_load[4].5
     10.75 =C2=B1  7%     -41.9%       6.25 =C2=B1  6%  sched_debug.cpu.cpu=
_load[4].50
     11.00 =C2=B1 14%     -34.1%       7.25 =C2=B1 11%  sched_debug.cpu.cpu=
_load[4].51
     29.38 =C2=B1164%     -77.9%       6.50 =C2=B1 13%  sched_debug.cpu.cpu=
_load[4].54
     10.12 =C2=B1  3%     -38.3%       6.25 =C2=B1  6%  sched_debug.cpu.cpu=
_load[4].56
     26.50 =C2=B1157%     -77.4%       6.00 =C2=B1 11%  sched_debug.cpu.cpu=
_load[4].58
     31.25 =C2=B1176%     -81.6%       5.75 =C2=B1  7%  sched_debug.cpu.cpu=
_load[4].59
     10.38 =C2=B1  6%     -34.9%       6.75 =C2=B1 12%  sched_debug.cpu.cpu=
_load[4].61
     47.88 =C2=B1206%     -86.9%       6.25 =C2=B1 28%  sched_debug.cpu.cpu=
_load[4].62
     10.50 =C2=B1  6%     -38.1%       6.50 =C2=B1 27%  sched_debug.cpu.cpu=
_load[4].63
     10.38 =C2=B1  6%     -34.9%       6.75 =C2=B1 12%  sched_debug.cpu.cpu=
_load[4].64
     10.50 =C2=B1  6%     -33.3%       7.00 =C2=B1 14%  sched_debug.cpu.cpu=
_load[4].65
     10.88 =C2=B1 12%     -42.5%       6.25 =C2=B1  6%  sched_debug.cpu.cpu=
_load[4].68
     62.12 =C2=B1142%     -88.7%       7.00 =C2=B1 10%  sched_debug.cpu.cpu=
_load[4].69
     11.25 =C2=B1 13%     -40.0%       6.75 =C2=B1 12%  sched_debug.cpu.cpu=
_load[4].8
     32.25 =C2=B1177%     -78.3%       7.00 =C2=B1 10%  sched_debug.cpu.cpu=
_load[4].9
      9.21 =C2=B1 15%     -85.5%       1.33 =C2=B1 45%  sched_debug.cpu.cpu=
_load[4].min
      1417 =C2=B1  6%     -17.4%       1169 =C2=B1 17%  sched_debug.cpu.cur=
r->pid.0
      1473 =C2=B1  9%     -30.6%       1022 =C2=B1  8%  sched_debug.cpu.cur=
r->pid.12
      1668 =C2=B1 20%     -29.6%       1174 =C2=B1  0%  sched_debug.cpu.cur=
r->pid.18
      1803 =C2=B1 25%     -30.9%       1246 =C2=B1 10%  sched_debug.cpu.cur=
r->pid.30
      1818 =C2=B1 34%     -31.6%       1244 =C2=B1 10%  sched_debug.cpu.cur=
r->pid.32
      1467 =C2=B1  0%     -15.5%       1239 =C2=B1 10%  sched_debug.cpu.cur=
r->pid.46
      1475 =C2=B1  0%     -20.4%       1175 =C2=B1 16%  sched_debug.cpu.cur=
r->pid.48
      1470 =C2=B1  0%     -20.2%       1173 =C2=B1 17%  sched_debug.cpu.cur=
r->pid.55
      1469 =C2=B1  0%     -15.3%       1244 =C2=B1  9%  sched_debug.cpu.cur=
r->pid.56
      1470 =C2=B1  0%     -27.8%       1061 =C2=B1 14%  sched_debug.cpu.cur=
r->pid.57
      1475 =C2=B1  1%     -20.6%       1171 =C2=B1  0%  sched_debug.cpu.cur=
r->pid.59
      1470 =C2=B1  0%     -15.2%       1246 =C2=B1 10%  sched_debug.cpu.cur=
r->pid.63
      1468 =C2=B1  0%     -33.7%     973.50 =C2=B1 26%  sched_debug.cpu.cur=
r->pid.70
      1474 =C2=B1  0%     -20.6%       1171 =C2=B1 18%  sched_debug.cpu.cur=
r->pid.71
      1516 =C2=B1  1%     -11.9%       1336 =C2=B1  0%  sched_debug.cpu.cur=
r->pid.avg
    890.29 =C2=B1 29%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu.cur=
r->pid.min
    464.49 =C2=B1  9%     +53.2%     711.49 =C2=B1  5%  sched_debug.cpu.cur=
r->pid.stddev
     12.12 =C2=B1 19%     -23.7%       9.25 =C2=B1  4%  sched_debug.cpu.loa=
d.18
     36.50 =C2=B1182%     -75.3%       9.00 =C2=B1  0%  sched_debug.cpu.loa=
d.59
     11.50 =C2=B1  7%     +13.0%      13.00 =C2=B1  7%  sched_debug.cpu.loa=
d.64
     11.25 =C2=B1  5%     -26.7%       8.25 =C2=B1 15%  sched_debug.cpu.loa=
d.65
      9.02 =C2=B1 21%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu.loa=
d.min
    635.33 =C2=B1 24%    +424.3%       3330 =C2=B1 43%  sched_debug.cpu.nr_=
load_updates.stddev
      0.67 =C2=B1 21%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu.nr_=
running.min
      0.20 =C2=B1 10%     +93.9%       0.39 =C2=B1  8%  sched_debug.cpu.nr_=
running.stddev
     30945 =C2=B1 38%   +1181.5%     396558 =C2=B1 12%  sched_debug.cpu.nr_=
switches.0
     31452 =C2=B1 39%   +1146.7%     392120 =C2=B1 13%  sched_debug.cpu.nr_=
switches.1
     23973 =C2=B1 70%   +1538.1%     392719 =C2=B1 14%  sched_debug.cpu.nr_=
switches.10
     23420 =C2=B1 44%   +1564.9%     389928 =C2=B1 14%  sched_debug.cpu.nr_=
switches.11
     20395 =C2=B1 46%   +1795.9%     386686 =C2=B1 13%  sched_debug.cpu.nr_=
switches.12
     19801 =C2=B1 37%   +1871.5%     390375 =C2=B1 13%  sched_debug.cpu.nr_=
switches.13
     19409 =C2=B1 55%   +1876.8%     383694 =C2=B1 16%  sched_debug.cpu.nr_=
switches.14
     18400 =C2=B1 35%   +2008.6%     387982 =C2=B1 14%  sched_debug.cpu.nr_=
switches.15
     18926 =C2=B1 38%   +1949.2%     387832 =C2=B1 14%  sched_debug.cpu.nr_=
switches.16
     21447 =C2=B1 47%   +1705.4%     387207 =C2=B1 14%  sched_debug.cpu.nr_=
switches.17
     17368 =C2=B1 18%   +2211.3%     401435 =C2=B1  9%  sched_debug.cpu.nr_=
switches.18
     27710 =C2=B1 42%   +1337.3%     398290 =C2=B1 10%  sched_debug.cpu.nr_=
switches.19
     28726 =C2=B1 34%   +1263.8%     391777 =C2=B1 15%  sched_debug.cpu.nr_=
switches.2
     22739 =C2=B1 35%   +1694.5%     408046 =C2=B1  9%  sched_debug.cpu.nr_=
switches.20
     27233 =C2=B1 41%   +1370.3%     400411 =C2=B1 10%  sched_debug.cpu.nr_=
switches.21
     19526 =C2=B1 47%   +1974.1%     405011 =C2=B1  9%  sched_debug.cpu.nr_=
switches.22
     19380 =C2=B1 41%   +1945.4%     396407 =C2=B1 10%  sched_debug.cpu.nr_=
switches.23
     28680 =C2=B1 48%   +1290.8%     398876 =C2=B1 10%  sched_debug.cpu.nr_=
switches.24
     19020 =C2=B1 27%   +2026.8%     404509 =C2=B1  9%  sched_debug.cpu.nr_=
switches.25
     24937 =C2=B1 54%   +1518.0%     403487 =C2=B1 10%  sched_debug.cpu.nr_=
switches.26
     19972 =C2=B1 43%   +1917.7%     402967 =C2=B1 10%  sched_debug.cpu.nr_=
switches.27
     20965 =C2=B1 39%   +1837.1%     406133 =C2=B1 10%  sched_debug.cpu.nr_=
switches.28
     26585 =C2=B1 53%   +1418.6%     403730 =C2=B1  9%  sched_debug.cpu.nr_=
switches.29
     26834 =C2=B1 46%   +1364.4%     392974 =C2=B1 14%  sched_debug.cpu.nr_=
switches.3
     17345 =C2=B1 30%   +2196.6%     398343 =C2=B1 10%  sched_debug.cpu.nr_=
switches.30
     21527 =C2=B1 62%   +1817.0%     412676 =C2=B1  7%  sched_debug.cpu.nr_=
switches.31
     19856 =C2=B1 34%   +1941.9%     405450 =C2=B1 11%  sched_debug.cpu.nr_=
switches.32
     27702 =C2=B1 73%   +1370.7%     407417 =C2=B1  8%  sched_debug.cpu.nr_=
switches.33
     20757 =C2=B1 35%   +1782.3%     390716 =C2=B1 10%  sched_debug.cpu.nr_=
switches.34
     17353 =C2=B1 42%   +2189.5%     397313 =C2=B1 10%  sched_debug.cpu.nr_=
switches.35
     18929 =C2=B1 62%   +1926.7%     383638 =C2=B1 14%  sched_debug.cpu.nr_=
switches.36
     18145 =C2=B1 22%   +2003.2%     381635 =C2=B1 14%  sched_debug.cpu.nr_=
switches.37
     16515 =C2=B1 13%   +2218.0%     382834 =C2=B1 15%  sched_debug.cpu.nr_=
switches.38
     16606 =C2=B1 46%   +2197.2%     381483 =C2=B1 14%  sched_debug.cpu.nr_=
switches.39
     23146 =C2=B1 39%   +1604.1%     394432 =C2=B1 13%  sched_debug.cpu.nr_=
switches.4
     18022 =C2=B1 34%   +2020.8%     382224 =C2=B1 15%  sched_debug.cpu.nr_=
switches.40
     16923 =C2=B1 17%   +2132.9%     377885 =C2=B1 14%  sched_debug.cpu.nr_=
switches.41
     16554 =C2=B1 38%   +2212.7%     382854 =C2=B1 14%  sched_debug.cpu.nr_=
switches.42
     21944 =C2=B1 47%   +1660.0%     386229 =C2=B1 14%  sched_debug.cpu.nr_=
switches.43
     17912 =C2=B1 51%   +2043.1%     383876 =C2=B1 14%  sched_debug.cpu.nr_=
switches.44
     16446 =C2=B1 21%   +2237.2%     384388 =C2=B1 15%  sched_debug.cpu.nr_=
switches.45
     17375 =C2=B1 28%   +2106.8%     383437 =C2=B1 14%  sched_debug.cpu.nr_=
switches.46
     19396 =C2=B1 48%   +1845.3%     377320 =C2=B1 15%  sched_debug.cpu.nr_=
switches.47
     14792 =C2=B1 33%   +2463.6%     379229 =C2=B1 15%  sched_debug.cpu.nr_=
switches.48
     13948 =C2=B1 35%   +2626.2%     380262 =C2=B1 13%  sched_debug.cpu.nr_=
switches.49
     36453 =C2=B1 54%    +961.7%     387037 =C2=B1 14%  sched_debug.cpu.nr_=
switches.5
     16356 =C2=B1 33%   +2196.9%     375700 =C2=B1 16%  sched_debug.cpu.nr_=
switches.50
     13826 =C2=B1 36%   +2651.1%     380384 =C2=B1 15%  sched_debug.cpu.nr_=
switches.51
     18765 =C2=B1 61%   +1910.4%     377264 =C2=B1 14%  sched_debug.cpu.nr_=
switches.52
     14414 =C2=B1 38%   +2523.7%     378203 =C2=B1 14%  sched_debug.cpu.nr_=
switches.53
     15728 =C2=B1 47%   +2414.8%     395540 =C2=B1  9%  sched_debug.cpu.nr_=
switches.54
     13519 =C2=B1 22%   +2783.8%     389871 =C2=B1 10%  sched_debug.cpu.nr_=
switches.55
     15935 =C2=B1 49%   +2404.9%     399149 =C2=B1 10%  sched_debug.cpu.nr_=
switches.56
     16126 =C2=B1 27%   +2326.7%     391339 =C2=B1 11%  sched_debug.cpu.nr_=
switches.57
     17455 =C2=B1 27%   +2190.9%     399892 =C2=B1  9%  sched_debug.cpu.nr_=
switches.58
     12757 =C2=B1 30%   +2961.4%     390564 =C2=B1  9%  sched_debug.cpu.nr_=
switches.59
     26309 =C2=B1 38%   +1382.4%     390022 =C2=B1 13%  sched_debug.cpu.nr_=
switches.6
     15772 =C2=B1 26%   +2386.2%     392120 =C2=B1 11%  sched_debug.cpu.nr_=
switches.60
     19965 =C2=B1 46%   +1847.3%     388788 =C2=B1 12%  sched_debug.cpu.nr_=
switches.61
     18959 =C2=B1 47%   +1989.3%     396127 =C2=B1 10%  sched_debug.cpu.nr_=
switches.62
     16293 =C2=B1 35%   +2347.8%     398829 =C2=B1 10%  sched_debug.cpu.nr_=
switches.63
     15642 =C2=B1 38%   +2429.9%     395735 =C2=B1 11%  sched_debug.cpu.nr_=
switches.64
     14633 =C2=B1 46%   +2615.6%     397390 =C2=B1  9%  sched_debug.cpu.nr_=
switches.65
     14802 =C2=B1 31%   +2528.0%     389016 =C2=B1 11%  sched_debug.cpu.nr_=
switches.66
     18640 =C2=B1 65%   +2013.0%     393882 =C2=B1  9%  sched_debug.cpu.nr_=
switches.67
     14614 =C2=B1 38%   +2622.4%     397866 =C2=B1 10%  sched_debug.cpu.nr_=
switches.68
     14966 =C2=B1 43%   +2512.7%     391022 =C2=B1 10%  sched_debug.cpu.nr_=
switches.69
     23477 =C2=B1 34%   +1580.5%     394536 =C2=B1 13%  sched_debug.cpu.nr_=
switches.7
     16431 =C2=B1 38%   +2233.6%     383450 =C2=B1 11%  sched_debug.cpu.nr_=
switches.70
     14386 =C2=B1 30%   +2600.3%     388481 =C2=B1 10%  sched_debug.cpu.nr_=
switches.71
     24538 =C2=B1 21%   +1495.3%     391460 =C2=B1 14%  sched_debug.cpu.nr_=
switches.8
     24623 =C2=B1 52%   +1500.4%     394056 =C2=B1 14%  sched_debug.cpu.nr_=
switches.9
     19923 =C2=B1 18%   +1866.6%     391813 =C2=B1 12%  sched_debug.cpu.nr_=
switches.avg
     66798 =C2=B1 16%    +535.6%     424574 =C2=B1  8%  sched_debug.cpu.nr_=
switches.max
     10673 =C2=B1 43%   +3274.1%     360145 =C2=B1 16%  sched_debug.cpu.nr_=
switches.min
     -0.12 =C2=B1-7325%  +1.2e+05%    -148.25 =C2=B1-36%  sched_debug.cpu.n=
r_uninterruptible.0
     -1.25 =C2=B1-502%   +8920.0%    -112.75 =C2=B1-28%  sched_debug.cpu.nr=
_uninterruptible.1
      0.12 =C2=B12479%  -44100.0%     -55.00 =C2=B1-50%  sched_debug.cpu.nr=
_uninterruptible.13
     -1.88 =C2=B1-350%   +2846.7%     -55.25 =C2=B1-64%  sched_debug.cpu.nr=
_uninterruptible.15
     -3.50 =C2=B1-118%   +2050.0%     -75.25 =C2=B1-56%  sched_debug.cpu.nr=
_uninterruptible.16
      1.25 =C2=B1428%   -5300.0%     -65.00 =C2=B1-43%  sched_debug.cpu.nr_=
uninterruptible.17
      0.38 =C2=B11460%  +63633.3%     239.00 =C2=B1 37%  sched_debug.cpu.nr=
_uninterruptible.18
     -2.75 =C2=B1-190%   -6527.3%     176.75 =C2=B1 35%  sched_debug.cpu.nr=
_uninterruptible.19
      4.00 =C2=B1143%   +4112.5%     168.50 =C2=B1 28%  sched_debug.cpu.nr_=
uninterruptible.20
      5.88 =C2=B1100%   +1904.3%     117.75 =C2=B1 29%  sched_debug.cpu.nr_=
uninterruptible.21
      4.75 =C2=B1162%   +2384.2%     118.00 =C2=B1 26%  sched_debug.cpu.nr_=
uninterruptible.22
      2.62 =C2=B1124%   +2166.7%      59.50 =C2=B1 52%  sched_debug.cpu.nr_=
uninterruptible.23
     -0.62 =C2=B1-1321%  -12580.0%      78.00 =C2=B1 49%  sched_debug.cpu.n=
r_uninterruptible.24
      2.38 =C2=B1268%   +2626.3%      64.75 =C2=B1 27%  sched_debug.cpu.nr_=
uninterruptible.25
      0.50 =C2=B1734%  +12000.0%      60.50 =C2=B1 23%  sched_debug.cpu.nr_=
uninterruptible.26
      1.88 =C2=B1314%   +3540.0%      68.25 =C2=B1 39%  sched_debug.cpu.nr_=
uninterruptible.27
      1.75 =C2=B1464%   +3342.9%      60.25 =C2=B1 33%  sched_debug.cpu.nr_=
uninterruptible.28
     -1.75 =C2=B1-229%   -1314.3%      21.25 =C2=B1106%  sched_debug.cpu.nr=
_uninterruptible.31
      2.88 =C2=B1291%   +1560.9%      47.75 =C2=B1 24%  sched_debug.cpu.nr_=
uninterruptible.32
     -0.88 =C2=B1-330%  +10585.7%     -93.50 =C2=B1-28%  sched_debug.cpu.nr=
_uninterruptible.36
     -1.25 =C2=B1-273%   +7280.0%     -92.25 =C2=B1-37%  sched_debug.cpu.nr=
_uninterruptible.37
      0.38 =C2=B11214%  -19166.7%     -71.50 =C2=B1-23%  sched_debug.cpu.nr=
_uninterruptible.38
      0.62 =C2=B1823%  -13380.0%     -83.00 =C2=B1-21%  sched_debug.cpu.nr_=
uninterruptible.39
     -1.75 =C2=B1-136%   +3471.4%     -62.50 =C2=B1-19%  sched_debug.cpu.nr=
_uninterruptible.40
     -3.88 =C2=B1-78%   +1809.7%     -74.00 =C2=B1-30%  sched_debug.cpu.nr_=
uninterruptible.41
     -3.38 =C2=B1-117%   +2396.3%     -84.25 =C2=B1-29%  sched_debug.cpu.nr=
_uninterruptible.42
     -4.12 =C2=B1-85%   +1730.3%     -75.50 =C2=B1-37%  sched_debug.cpu.nr_=
uninterruptible.43
     -4.88 =C2=B1-75%   +1474.4%     -76.75 =C2=B1-29%  sched_debug.cpu.nr_=
uninterruptible.44
     -0.75 =C2=B1-599%   +9366.7%     -71.00 =C2=B1-19%  sched_debug.cpu.nr=
_uninterruptible.45
     -1.50 =C2=B1-169%   +4533.3%     -69.50 =C2=B1-18%  sched_debug.cpu.nr=
_uninterruptible.46
     -2.50 =C2=B1-132%   +3560.0%     -91.50 =C2=B1-34%  sched_debug.cpu.nr=
_uninterruptible.47
     -1.00 =C2=B1-200%   +7150.0%     -72.50 =C2=B1 -6%  sched_debug.cpu.nr=
_uninterruptible.48
     -0.75 =C2=B1-807%  +11200.0%     -84.75 =C2=B1-27%  sched_debug.cpu.nr=
_uninterruptible.49
     -2.38 =C2=B1-105%   +1794.7%     -45.00 =C2=B1-77%  sched_debug.cpu.nr=
_uninterruptible.5
     -2.62 =C2=B1-185%   +2090.5%     -57.50 =C2=B1-40%  sched_debug.cpu.nr=
_uninterruptible.50
     -3.25 =C2=B1-71%   +2338.5%     -79.25 =C2=B1-25%  sched_debug.cpu.nr_=
uninterruptible.51
     -1.88 =C2=B1-167%   +4313.3%     -82.75 =C2=B1-30%  sched_debug.cpu.nr=
_uninterruptible.52
      1.00 =C2=B1620%  +60650.0%     607.50 =C2=B1 44%  sched_debug.cpu.nr_=
uninterruptible.71
      0.00 =C2=B1134%   +1429.4%       0.08 =C2=B1 17%  sched_debug.cpu.nr_=
uninterruptible.avg
     17.35 =C2=B1 17%   +3628.0%     646.96 =C2=B1 37%  sched_debug.cpu.nr_=
uninterruptible.max
    -14.06 =C2=B1-19%   +1025.3%    -158.25 =C2=B1-28%  sched_debug.cpu.nr_=
uninterruptible.min
      5.95 =C2=B1 17%   +1764.3%     111.01 =C2=B1 29%  sched_debug.cpu.nr_=
uninterruptible.stddev
     32661 =C2=B1 36%   +1106.2%     393978 =C2=B1 13%  sched_debug.cpu.sch=
ed_count.1
     25082 =C2=B1 66%   +1471.3%     394119 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.10
     24224 =C2=B1 42%   +1515.4%     391323 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.11
     21707 =C2=B1 42%   +1692.9%     389204 =C2=B1 13%  sched_debug.cpu.sch=
ed_count.12
     20800 =C2=B1 35%   +1839.6%     403459 =C2=B1 13%  sched_debug.cpu.sch=
ed_count.13
     21078 =C2=B1 49%   +1726.7%     385034 =C2=B1 16%  sched_debug.cpu.sch=
ed_count.14
     21836 =C2=B1 40%   +1683.8%     389502 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.15
     19706 =C2=B1 37%   +1876.0%     389409 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.16
     22371 =C2=B1 45%   +1638.0%     388825 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.17
     18191 =C2=B1 17%   +2121.5%     404132 =C2=B1  9%  sched_debug.cpu.sch=
ed_count.18
     28772 =C2=B1 41%   +1322.5%     409285 =C2=B1 11%  sched_debug.cpu.sch=
ed_count.19
     30857 =C2=B1 32%   +1174.2%     393187 =C2=B1 15%  sched_debug.cpu.sch=
ed_count.2
     24086 =C2=B1 33%   +1602.8%     410136 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.20
     29528 =C2=B1 36%   +1261.4%     402004 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.21
     25990 =C2=B1 67%   +1464.5%     406618 =C2=B1  9%  sched_debug.cpu.sch=
ed_count.22
     20332 =C2=B1 39%   +1856.6%     397838 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.23
     29535 =C2=B1 46%   +1257.1%     400844 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.24
     19897 =C2=B1 26%   +1940.8%     406068 =C2=B1  9%  sched_debug.cpu.sch=
ed_count.25
     26204 =C2=B1 51%   +1448.5%     405763 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.26
     20796 =C2=B1 41%   +1846.0%     404693 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.27
     22600 =C2=B1 37%   +1704.0%     407724 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.28
     32285 =C2=B1 46%   +1155.3%     405295 =C2=B1  9%  sched_debug.cpu.sch=
ed_count.29
     34286 =C2=B1 34%   +1050.4%     394443 =C2=B1 13%  sched_debug.cpu.sch=
ed_count.3
     19210 =C2=B1 35%   +1981.3%     399825 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.30
     22413 =C2=B1 59%   +1759.5%     416778 =C2=B1  7%  sched_debug.cpu.sch=
ed_count.31
     21166 =C2=B1 35%   +1828.4%     408170 =C2=B1 12%  sched_debug.cpu.sch=
ed_count.32
     28855 =C2=B1 70%   +1318.9%     409438 =C2=B1  8%  sched_debug.cpu.sch=
ed_count.33
     27655 =C2=B1 59%   +1359.3%     403564 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.34
     23541 =C2=B1 74%   +1664.0%     415285 =C2=B1  7%  sched_debug.cpu.sch=
ed_count.35
     19643 =C2=B1 60%   +1859.8%     384976 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.36
     18891 =C2=B1 21%   +1927.2%     382966 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.37
     19021 =C2=B1 16%   +1919.3%     384093 =C2=B1 15%  sched_debug.cpu.sch=
ed_count.38
     17553 =C2=B1 47%   +2080.9%     382824 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.39
     26882 =C2=B1 32%   +1372.6%     395877 =C2=B1 13%  sched_debug.cpu.sch=
ed_count.4
     19683 =C2=B1 25%   +1848.3%     383502 =C2=B1 15%  sched_debug.cpu.sch=
ed_count.40
     17665 =C2=B1 16%   +2046.6%     379204 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.41
     17811 =C2=B1 37%   +2056.9%     384172 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.42
     23959 =C2=B1 43%   +1517.5%     387547 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.43
     18803 =C2=B1 47%   +1948.4%     385166 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.44
     17187 =C2=B1 20%   +2144.6%     385781 =C2=B1 15%  sched_debug.cpu.sch=
ed_count.45
     18138 =C2=B1 27%   +2020.9%     384700 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.46
     20198 =C2=B1 46%   +1774.3%     378577 =C2=B1 15%  sched_debug.cpu.sch=
ed_count.47
     15594 =C2=B1 32%   +2340.9%     380640 =C2=B1 15%  sched_debug.cpu.sch=
ed_count.48
     14739 =C2=B1 33%   +2488.8%     381574 =C2=B1 13%  sched_debug.cpu.sch=
ed_count.49
     42510 =C2=B1 44%    +813.6%     388387 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.5
     17142 =C2=B1 32%   +2099.2%     376994 =C2=B1 16%  sched_debug.cpu.sch=
ed_count.50
     14470 =C2=B1 35%   +2537.5%     381650 =C2=B1 15%  sched_debug.cpu.sch=
ed_count.51
     20504 =C2=B1 57%   +1746.5%     378600 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.52
     15372 =C2=B1 37%   +2368.7%     379488 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.53
     16497 =C2=B1 44%   +2305.4%     396843 =C2=B1  9%  sched_debug.cpu.sch=
ed_count.54
     15078 =C2=B1 24%   +2494.2%     391169 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.55
     16689 =C2=B1 47%   +2299.1%     400383 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.56
     16965 =C2=B1 25%   +2214.2%     392614 =C2=B1 11%  sched_debug.cpu.sch=
ed_count.57
     18204 =C2=B1 26%   +2104.0%     401241 =C2=B1  9%  sched_debug.cpu.sch=
ed_count.58
     14255 =C2=B1 29%   +2649.0%     391885 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.59
     33587 =C2=B1 70%   +1065.1%     391338 =C2=B1 13%  sched_debug.cpu.sch=
ed_count.6
     16531 =C2=B1 25%   +2286.2%     394480 =C2=B1 11%  sched_debug.cpu.sch=
ed_count.60
     20747 =C2=B1 44%   +1780.1%     390065 =C2=B1 12%  sched_debug.cpu.sch=
ed_count.61
     19782 =C2=B1 45%   +1908.7%     397386 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.62
     17789 =C2=B1 37%   +2149.0%     400075 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.63
     16385 =C2=B1 36%   +2322.8%     396979 =C2=B1 11%  sched_debug.cpu.sch=
ed_count.64
     15343 =C2=B1 43%   +2498.0%     398623 =C2=B1  9%  sched_debug.cpu.sch=
ed_count.65
     15527 =C2=B1 29%   +2413.3%     390257 =C2=B1 11%  sched_debug.cpu.sch=
ed_count.66
     19428 =C2=B1 63%   +1934.3%     395233 =C2=B1  9%  sched_debug.cpu.sch=
ed_count.67
     16042 =C2=B1 37%   +2387.8%     399104 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.68
     16842 =C2=B1 42%   +2229.0%     392253 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.69
     24790 =C2=B1 32%   +1497.3%     395971 =C2=B1 13%  sched_debug.cpu.sch=
ed_count.7
     17126 =C2=B1 37%   +2146.6%     384771 =C2=B1 11%  sched_debug.cpu.sch=
ed_count.70
     15495 =C2=B1 32%   +2416.8%     389997 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.71
     26013 =C2=B1 17%   +1410.0%     392801 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.8
     32818 =C2=B1 50%   +1104.6%     395327 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.9
    126729 =C2=B1  2%    +293.7%     498998 =C2=B1  9%  sched_debug.cpu.sch=
ed_count.avg
     11290 =C2=B1 41%   +3101.7%     361478 =C2=B1 16%  sched_debug.cpu.sch=
ed_count.min
      6742 =C2=B1 27%   +2761.5%     192938 =C2=B1 13%  sched_debug.cpu.sch=
ed_goidle.0
      7143 =C2=B1 23%   +2592.6%     192339 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.1
      6120 =C2=B1 35%   +3060.2%     193421 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.10
      6183 =C2=B1 37%   +3007.3%     192125 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.11
      5926 =C2=B1 33%   +3113.6%     190465 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.12
      5936 =C2=B1 28%   +3137.7%     192198 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.13
      6268 =C2=B1 39%   +2918.0%     189190 =C2=B1 16%  sched_debug.cpu.sch=
ed_goidle.14
      6113 =C2=B1 36%   +3026.3%     191115 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.15
      5669 =C2=B1 38%   +3270.7%     191099 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.16
      6134 =C2=B1 27%   +3010.0%     190795 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.17
      6041 =C2=B1 39%   +3167.2%     197377 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.18
      6287 =C2=B1 41%   +3016.0%     195910 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.19
      6946 =C2=B1 31%   +2676.6%     192879 =C2=B1 15%  sched_debug.cpu.sch=
ed_goidle.2
      6426 =C2=B1 34%   +3017.1%     200319 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.20
      6232 =C2=B1 36%   +3056.8%     196737 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.21
      6323 =C2=B1 33%   +3047.2%     199018 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.22
      6175 =C2=B1 41%   +3057.1%     194951 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.23
      5700 =C2=B1 38%   +3339.9%     196097 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.24
      6648 =C2=B1 47%   +2897.6%     199293 =C2=B1  9%  sched_debug.cpu.sch=
ed_goidle.25
      6424 =C2=B1 43%   +2991.9%     198639 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.26
      6168 =C2=B1 41%   +3117.0%     198426 =C2=B1 11%  sched_debug.cpu.sch=
ed_goidle.27
      6654 =C2=B1 40%   +2905.2%     199972 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.28
      5925 =C2=B1 44%   +3233.1%     197491 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.29
      6247 =C2=B1 35%   +2997.4%     193520 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.3
      5892 =C2=B1 40%   +3222.1%     195755 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.30
      5991 =C2=B1 36%   +3286.1%     202876 =C2=B1  7%  sched_debug.cpu.sch=
ed_goidle.31
      6357 =C2=B1 44%   +3020.4%     198389 =C2=B1 11%  sched_debug.cpu.sch=
ed_goidle.32
      6214 =C2=B1 37%   +3129.5%     200696 =C2=B1  8%  sched_debug.cpu.sch=
ed_goidle.33
      6198 =C2=B1 39%   +3001.4%     192242 =C2=B1 11%  sched_debug.cpu.sch=
ed_goidle.34
      6208 =C2=B1 37%   +3052.9%     195750 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.35
      5264 =C2=B1 39%   +3486.2%     188804 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.36
      5436 =C2=B1 33%   +3340.8%     187041 =C2=B1 15%  sched_debug.cpu.sch=
ed_goidle.37
      6275 =C2=B1 32%   +2910.9%     188938 =C2=B1 15%  sched_debug.cpu.sch=
ed_goidle.38
      5979 =C2=B1 36%   +3048.8%     188269 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.39
      6213 =C2=B1 30%   +2999.7%     192611 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.4
      6406 =C2=B1 38%   +2845.3%     188702 =C2=B1 16%  sched_debug.cpu.sch=
ed_goidle.40
      5901 =C2=B1 33%   +3059.8%     186465 =C2=B1 15%  sched_debug.cpu.sch=
ed_goidle.41
      5487 =C2=B1 36%   +3343.8%     188963 =C2=B1 15%  sched_debug.cpu.sch=
ed_goidle.42
      6192 =C2=B1 28%   +2977.7%     190587 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.43
      5732 =C2=B1 35%   +3204.0%     189408 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.44
      6195 =C2=B1 29%   +2961.7%     189681 =C2=B1 15%  sched_debug.cpu.sch=
ed_goidle.45
      6352 =C2=B1 25%   +2878.3%     189202 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.46
      5856 =C2=B1 25%   +3079.9%     186232 =C2=B1 15%  sched_debug.cpu.sch=
ed_goidle.47
      5726 =C2=B1 32%   +3166.8%     187086 =C2=B1 16%  sched_debug.cpu.sch=
ed_goidle.48
      5502 =C2=B1 35%   +3309.3%     187578 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.49
      5724 =C2=B1 37%   +3230.2%     190651 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.5
      6451 =C2=B1 35%   +2774.4%     185433 =C2=B1 16%  sched_debug.cpu.sch=
ed_goidle.50
      5620 =C2=B1 41%   +3233.5%     187365 =C2=B1 15%  sched_debug.cpu.sch=
ed_goidle.51
      5804 =C2=B1 39%   +3096.6%     185556 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.52
      5402 =C2=B1 37%   +3353.7%     186578 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.53
      6124 =C2=B1 52%   +3085.0%     195079 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.54
      5419 =C2=B1 34%   +3451.5%     192456 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.55
      6984 =C2=B1 56%   +2720.1%     196958 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.56
      6407 =C2=B1 41%   +2915.1%     193185 =C2=B1 12%  sched_debug.cpu.sch=
ed_goidle.57
      5977 =C2=B1 37%   +3200.7%     197300 =C2=B1  9%  sched_debug.cpu.sch=
ed_goidle.58
      5392 =C2=B1 35%   +3461.7%     192073 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.59
      6402 =C2=B1 33%   +2900.4%     192108 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.6
      5947 =C2=B1 44%   +3153.3%     193485 =C2=B1 11%  sched_debug.cpu.sch=
ed_goidle.60
      6085 =C2=B1 38%   +3055.0%     192001 =C2=B1 12%  sched_debug.cpu.sch=
ed_goidle.61
      6222 =C2=B1 42%   +3040.7%     195415 =C2=B1 11%  sched_debug.cpu.sch=
ed_goidle.62
      6203 =C2=B1 45%   +3073.5%     196852 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.63
      6155 =C2=B1 35%   +3073.3%     195339 =C2=B1 11%  sched_debug.cpu.sch=
ed_goidle.64
      6316 =C2=B1 52%   +2966.1%     193679 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.65
      5450 =C2=B1 38%   +3423.3%     192026 =C2=B1 11%  sched_debug.cpu.sch=
ed_goidle.66
      6157 =C2=B1 52%   +3056.0%     194340 =C2=B1  9%  sched_debug.cpu.sch=
ed_goidle.67
      6101 =C2=B1 45%   +3119.5%     196426 =C2=B1 11%  sched_debug.cpu.sch=
ed_goidle.68
      6029 =C2=B1 52%   +3100.1%     192959 =C2=B1 11%  sched_debug.cpu.sch=
ed_goidle.69
      6255 =C2=B1 31%   +3007.4%     194369 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.7
      6232 =C2=B1 54%   +2937.3%     189313 =C2=B1 11%  sched_debug.cpu.sch=
ed_goidle.70
      5585 =C2=B1 39%   +3325.6%     191347 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.71
      6624 =C2=B1 34%   +2812.3%     192920 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.8
      6196 =C2=B1 37%   +3033.6%     194178 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.9
      6099 =C2=B1 33%   +3063.3%     192931 =C2=B1 12%  sched_debug.cpu.sch=
ed_goidle.avg
      9959 =C2=B1 33%   +1990.2%     208183 =C2=B1  7%  sched_debug.cpu.sch=
ed_goidle.max
      4276 =C2=B1 51%   +4057.2%     177776 =C2=B1 16%  sched_debug.cpu.sch=
ed_goidle.min
      1299 =C2=B1 49%    +363.3%       6019 =C2=B1 54%  sched_debug.cpu.sch=
ed_goidle.stddev
     17633 =C2=B1 36%   +1116.3%     214480 =C2=B1 10%  sched_debug.cpu.ttw=
u_count.0
     15908 =C2=B1 39%   +1196.9%     206311 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.1
     12266 =C2=B1 70%   +1550.8%     202495 =C2=B1 10%  sched_debug.cpu.ttw=
u_count.10
     11848 =C2=B1 44%   +1619.9%     203774 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.11
     10685 =C2=B1 44%   +1824.8%     205674 =C2=B1 12%  sched_debug.cpu.ttw=
u_count.12
     10318 =C2=B1 38%   +1891.6%     205499 =C2=B1 10%  sched_debug.cpu.ttw=
u_count.13
      9366 =C2=B1 51%   +2018.8%     198454 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.14
      9470 =C2=B1 36%   +2044.5%     203099 =C2=B1 12%  sched_debug.cpu.ttw=
u_count.15
      9753 =C2=B1 37%   +1998.7%     204702 =C2=B1 10%  sched_debug.cpu.ttw=
u_count.16
     10934 =C2=B1 52%   +1760.5%     203440 =C2=B1 10%  sched_debug.cpu.ttw=
u_count.17
      9334 =C2=B1 16%   +2088.6%     204287 =C2=B1 13%  sched_debug.cpu.ttw=
u_count.18
     14256 =C2=B1 37%   +1320.3%     202472 =C2=B1 14%  sched_debug.cpu.ttw=
u_count.19
     14176 =C2=B1 35%   +1326.7%     202250 =C2=B1 12%  sched_debug.cpu.ttw=
u_count.2
     12433 =C2=B1 30%   +1550.6%     205226 =C2=B1 12%  sched_debug.cpu.ttw=
u_count.20
     14482 =C2=B1 41%   +1301.4%     202956 =C2=B1 13%  sched_debug.cpu.ttw=
u_count.21
     10378 =C2=B1 45%   +1862.0%     203635 =C2=B1 12%  sched_debug.cpu.ttw=
u_count.22
     10709 =C2=B1 40%   +1800.7%     203548 =C2=B1 14%  sched_debug.cpu.ttw=
u_count.23
     14393 =C2=B1 48%   +1304.2%     202110 =C2=B1 14%  sched_debug.cpu.ttw=
u_count.24
      9650 =C2=B1 28%   +1990.8%     201780 =C2=B1 13%  sched_debug.cpu.ttw=
u_count.25
     12417 =C2=B1 55%   +1527.9%     202149 =C2=B1 13%  sched_debug.cpu.ttw=
u_count.26
     10148 =C2=B1 44%   +1897.7%     202739 =C2=B1 13%  sched_debug.cpu.ttw=
u_count.27
     10179 =C2=B1 39%   +1884.5%     202004 =C2=B1 13%  sched_debug.cpu.ttw=
u_count.28
     13863 =C2=B1 50%   +1384.1%     205751 =C2=B1 12%  sched_debug.cpu.ttw=
u_count.29
     13540 =C2=B1 47%   +1395.4%     202478 =C2=B1 10%  sched_debug.cpu.ttw=
u_count.3
      9393 =C2=B1 26%   +2090.9%     205798 =C2=B1 13%  sched_debug.cpu.ttw=
u_count.30
     11488 =C2=B1 65%   +1728.7%     210092 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.31
     10063 =C2=B1 34%   +1928.9%     204166 =C2=B1 14%  sched_debug.cpu.ttw=
u_count.32
     14306 =C2=B1 78%   +1349.0%     207310 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.33
     10407 =C2=B1 33%   +1835.8%     201459 =C2=B1 14%  sched_debug.cpu.ttw=
u_count.34
      8902 =C2=B1 46%   +2181.6%     203114 =C2=B1 13%  sched_debug.cpu.ttw=
u_count.35
      9901 =C2=B1 62%   +1936.3%     201613 =C2=B1 10%  sched_debug.cpu.ttw=
u_count.36
     10083 =C2=B1 25%   +1894.3%     201091 =C2=B1 10%  sched_debug.cpu.ttw=
u_count.37
      8452 =C2=B1 14%   +2229.9%     196935 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.38
      8658 =C2=B1 45%   +2192.7%     198518 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.39
     12088 =C2=B1 43%   +1593.2%     204683 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.4
      8991 =C2=B1 34%   +2089.7%     196876 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.40
      9160 =C2=B1 21%   +2076.6%     199394 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.41
      8813 =C2=B1 38%   +2167.0%     199791 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.42
     11303 =C2=B1 48%   +1664.0%     199392 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.43
      9617 =C2=B1 52%   +1987.7%     200777 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.44
      8463 =C2=B1 20%   +2240.9%     198129 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.45
      8855 =C2=B1 28%   +2144.7%     198783 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.46
     10267 =C2=B1 47%   +1851.3%     200356 =C2=B1 12%  sched_debug.cpu.ttw=
u_count.47
      7990 =C2=B1 33%   +2400.7%     199820 =C2=B1 10%  sched_debug.cpu.ttw=
u_count.48
      7309 =C2=B1 35%   +2658.5%     201645 =C2=B1 10%  sched_debug.cpu.ttw=
u_count.49
     19123 =C2=B1 52%    +966.4%     203933 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.5
      8302 =C2=B1 34%   +2255.9%     195604 =C2=B1 12%  sched_debug.cpu.ttw=
u_count.50
      7355 =C2=B1 36%   +2604.2%     198911 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.51
     10030 =C2=B1 60%   +1892.2%     199816 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.52
      7770 =C2=B1 39%   +2498.9%     201935 =C2=B1 10%  sched_debug.cpu.ttw=
u_count.53
      8576 =C2=B1 46%   +2243.4%     200981 =C2=B1 13%  sched_debug.cpu.ttw=
u_count.54
      7834 =C2=B1 14%   +2456.3%     200274 =C2=B1 14%  sched_debug.cpu.ttw=
u_count.55
      8309 =C2=B1 50%   +2294.6%     198981 =C2=B1 14%  sched_debug.cpu.ttw=
u_count.56
      8604 =C2=B1 24%   +2190.6%     197088 =C2=B1 15%  sched_debug.cpu.ttw=
u_count.57
      8982 =C2=B1 29%   +2155.2%     202576 =C2=B1 12%  sched_debug.cpu.ttw=
u_count.58
      7294 =C2=B1 30%   +2643.5%     200120 =C2=B1 13%  sched_debug.cpu.ttw=
u_count.59
     13378 =C2=B1 37%   +1412.1%     202303 =C2=B1 10%  sched_debug.cpu.ttw=
u_count.6
      8645 =C2=B1 28%   +2202.0%     199026 =C2=B1 14%  sched_debug.cpu.ttw=
u_count.60
     10545 =C2=B1 44%   +1772.6%     197480 =C2=B1 15%  sched_debug.cpu.ttw=
u_count.61
      9965 =C2=B1 45%   +1900.8%     199382 =C2=B1 13%  sched_debug.cpu.ttw=
u_count.62
      8548 =C2=B1 39%   +2243.2%     200307 =C2=B1 13%  sched_debug.cpu.ttw=
u_count.63
      7965 =C2=B1 37%   +2424.2%     201055 =C2=B1 13%  sched_debug.cpu.ttw=
u_count.64
      7875 =C2=B1 43%   +2503.7%     205046 =C2=B1 12%  sched_debug.cpu.ttw=
u_count.65
      8069 =C2=B1 27%   +2385.9%     200594 =C2=B1 14%  sched_debug.cpu.ttw=
u_count.66
      9843 =C2=B1 62%   +1976.7%     204409 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.67
      7557 =C2=B1 37%   +2549.0%     200205 =C2=B1 13%  sched_debug.cpu.ttw=
u_count.68
      7506 =C2=B1 34%   +2573.5%     200697 =C2=B1 14%  sched_debug.cpu.ttw=
u_count.69
     11834 =C2=B1 35%   +1625.6%     204215 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.7
      9162 =C2=B1 40%   +2069.6%     198780 =C2=B1 14%  sched_debug.cpu.ttw=
u_count.70
      7749 =C2=B1 29%   +2504.3%     201830 =C2=B1 13%  sched_debug.cpu.ttw=
u_count.71
     12196 =C2=B1 20%   +1555.0%     201844 =C2=B1 10%  sched_debug.cpu.ttw=
u_count.8
     12345 =C2=B1 51%   +1550.9%     203810 =C2=B1 10%  sched_debug.cpu.ttw=
u_count.9
     10389 =C2=B1 18%   +1844.0%     201976 =C2=B1 12%  sched_debug.cpu.ttw=
u_count.avg
     34567 =C2=B1 17%    +538.9%     220845 =C2=B1  9%  sched_debug.cpu.ttw=
u_count.max
      5541 =C2=B1 44%   +3243.8%     185303 =C2=B1 13%  sched_debug.cpu.ttw=
u_count.min
      1911 =C2=B1 34%     +82.0%       3479 =C2=B1  9%  sched_debug.cpu.ttw=
u_local.45
      1561 =C2=B1 62%    +124.3%       3502 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.48
      1240 =C2=B1 63%    +207.5%       3814 =C2=B1 15%  sched_debug.cpu.ttw=
u_local.51
      1231 =C2=B1 44%    +200.3%       3698 =C2=B1 17%  sched_debug.cpu.ttw=
u_local.55
    906.88 =C2=B1 15%    +319.1%       3800 =C2=B1 13%  sched_debug.cpu.ttw=
u_local.56
    883.62 =C2=B1 19%    +385.1%       4286 =C2=B1 25%  sched_debug.cpu.ttw=
u_local.59
    927.12 =C2=B1 22%    +566.4%       6178 =C2=B1 43%  sched_debug.cpu.ttw=
u_local.65
      1155 =C2=B1 63%    +216.9%       3661 =C2=B1 11%  sched_debug.cpu.ttw=
u_local.68
      1266 =C2=B1 43%    +197.4%       3765 =C2=B1 14%  sched_debug.cpu.ttw=
u_local.69
      1492 =C2=B1 69%    +143.1%       3627 =C2=B1 13%  sched_debug.cpu.ttw=
u_local.71
     26987 =C2=B1 19%     -59.0%      11065 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.max
    680.73 =C2=B1  2%    +331.2%       2935 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.min
      5238 =C2=B1  9%     -79.1%       1092 =C2=B1 15%  sched_debug.cpu.ttw=
u_local.stddev

lkp-hsw-ep2: Brickland Haswell-EP
Memory: 128G


                   perf-profile.cycles-pp.kthread.ret_from_fork

  2.5 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
      |                        *                                           =
 |
    2 ++                       :                                           =
 |
      |                       : :                                          =
 |
      |                       : :                                          =
 |
  1.5 ++                      : :                                          =
 |
      |                      :   :                         .*.             =
.*
    1 ++*.*.*. .*. .*.  .*. .*   *.*.*.*. .*.*. .*.   .*.*.   *. .*.   .*.*=
 |
      *       *   *   *.   *             *     *   *.*          *   *.*    =
 |
      |                                                                    =
 |
  0.5 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
    0 O+O-O-O-O-O-O-O-O--O-O-O-O-O-O-O-O-O-O-O-O-O-O-----------------------=
-+


                       perf-profile.cycles-pp.ret_from_fork

  2.5 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
      |                        *                                           =
 |
    2 ++                       :                                           =
 |
      |                       : :                                          =
 |
      |                       : :                                          =
 |
  1.5 ++                      : :                                          =
 |
      |                      :   :                         .*.             =
.*
    1 ++*.*.*. .*. .*.  .*. .*   *.*.*.*. .*.*. .*.   .*.*.   *. .*.   .*.*=
 |
      *       *   *   *.   *             *     *   *.*          *   *.*    =
 |
      |                                                                    =
 |
  0.5 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
    0 O+O-O-O-O-O-O-O-O--O-O-O-O-O-O-O-O-O-O-O-O-O-O-----------------------=
-+


                               vm-scalability.throughput

   2.1e+08 ++--------------------------------------------------------------=
-+
           *.*.*   *.**.     .*.*.*. .*   *.**.*.*.*.*.*       *.**.*.*    =
 |
  2.05e+08 ++   : :     *.*.*       *  + +              +     +        +   =
 |
     2e+08 ++   : :                     *                *. .*          *. =
.*
           |     *                                         *              *=
 |
  1.95e+08 ++                                                              =
 |
           |                                                               =
 |
   1.9e+08 ++                                                              =
 |
           |                                                               =
 |
  1.85e+08 ++                             O      O                         =
 |
   1.8e+08 ++                                                              =
 |
           |                  O                                            =
 |
  1.75e+08 ++O O O O OO   O O     O O O     OO     O O                     =
 |
           O            O       O       O      O                           =
 |
   1.7e+08 ++--------------------------------------------------------------=
-+


                            vm-scalability.time.user_time

  13000 ++------------*----------------------------------------------------=
-+
        *.      *. .*   *.*.*. .*.*.           .*.   .*.       .*.   .*.   =
 |
  12000 ++*.*. +  *           *     *.*.*.*.*.*   *.*   *. .*.*   *.*   *. =
.*
  11000 ++    *                                           *               *=
 |
        |                                                                  =
 |
  10000 ++                                                                 =
 |
   9000 ++                                                                 =
 |
        |                                                                  =
 |
   8000 ++                                                                 =
 |
   7000 ++                              O       O                          =
 |
        | O                 O                                              =
 |
   6000 ++                O       O       O       O                        =
 |
   5000 O+  O O O O O O O     O O   O O     O O     O                      =
 |
        |                                                                  =
 |
   4000 ++-----------------------------------------------------------------=
-+


                         vm-scalability.time.major_page_faults

  4.5e+07 ++---------------------------------------------------------------=
-+
          |             O                                                  =
 |
    4e+07 O+O O O O   O   O    O O     O     O O     O                     =
 |
  3.5e+07 ++        O        O     O O                                     =
 |
          |                O             O O     O O                       =
 |
    3e+07 ++                                                               =
 |
  2.5e+07 ++                                                               =
 |
          |                                                                =
 |
    2e+07 ++                                                               =
 |
  1.5e+07 ++                                                               =
 |
          |                                                                =
 |
    1e+07 ++                                                               =
 |
    5e+06 ++                                                               =
 |
          |    .*.                    .*.               .*.**.         .*.*=
.*
        0 *+*-*---*-*-*-*-**-*-*-*-*-*---*-*-*-*-*-*-*-*------*-*-*-*-*----=
-+


                    vm-scalability.time.voluntary_context_switches

  3.5e+07 ++---------------------------------------------------------------=
-+
          |       O              O           O       O                     =
 |
    3e+07 O+  O       O O O    O                                           =
 |
          |     O   O                O O       O                           =
 |
  2.5e+07 ++                       O       O       O                       =
 |
          |                O O                                             =
 |
    2e+07 ++O                            O       O                         =
 |
          |                                                                =
 |
  1.5e+07 ++                                                               =
 |
          |                                                                =
 |
    1e+07 ++                                                               =
 |
          |                                                                =
 |
    5e+06 ++                                                               =
 |
          |                                                                =
 |
        0 *+*-*-*-*-*-*-*-**-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-**-*-*-*-*-*-*-*=
-*


                                   time.user_time

  13000 ++------------*----------------------------------------------------=
-+
        *.      *. .*   *.*.*. .*.*.           .*.   .*.       .*.   .*.   =
 |
  12000 ++*.*. +  *           *     *.*.*.*.*.*   *.*   *. .*.*   *.*   *. =
.*
  11000 ++    *                                           *               *=
 |
        |                                                                  =
 |
  10000 ++                                                                 =
 |
   9000 ++                                                                 =
 |
        |                                                                  =
 |
   8000 ++                                                                 =
 |
   7000 ++                              O       O                          =
 |
        | O                 O                                              =
 |
   6000 ++                O       O       O       O                        =
 |
   5000 O+  O O O O O O O     O O   O O     O O     O                      =
 |
        |                                                                  =
 |
   4000 ++-----------------------------------------------------------------=
-+


                                time.major_page_faults

  4.5e+07 ++---------------------------------------------------------------=
-+
          |             O                                                  =
 |
    4e+07 O+O O O O   O   O    O O     O     O O     O                     =
 |
  3.5e+07 ++        O        O     O O                                     =
 |
          |                O             O O     O O                       =
 |
    3e+07 ++                                                               =
 |
  2.5e+07 ++                                                               =
 |
          |                                                                =
 |
    2e+07 ++                                                               =
 |
  1.5e+07 ++                                                               =
 |
          |                                                                =
 |
    1e+07 ++                                                               =
 |
    5e+06 ++                                                               =
 |
          |    .*.                    .*.               .*.**.         .*.*=
.*
        0 *+*-*---*-*-*-*-**-*-*-*-*-*---*-*-*-*-*-*-*-*------*-*-*-*-*----=
-+


                            time.voluntary_context_switches

  3.5e+07 ++---------------------------------------------------------------=
-+
          |       O              O           O       O                     =
 |
    3e+07 O+  O       O O O    O                                           =
 |
          |     O   O                O O       O                           =
 |
  2.5e+07 ++                       O       O       O                       =
 |
          |                O O                                             =
 |
    2e+07 ++O                            O       O                         =
 |
          |                                                                =
 |
  1.5e+07 ++                                                               =
 |
          |                                                                =
 |
    1e+07 ++                                                               =
 |
          |                                                                =
 |
    5e+06 ++                                                               =
 |
          |                                                                =
 |
        0 *+*-*-*-*-*-*-*-**-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-**-*-*-*-*-*-*-*=
-*


                                 vmstat.procs.b

  8 ++------O---------------------------O-------O--------------------------=
-+
    |                                                                      =
 |
  7 O+    O    O   O O     O              O        O                       =
 |
  6 ++  O        O     O     O  O O O       O                              =
 |
    |                                                                      =
 |
  5 ++                   O            O       O                            =
 |
    |                                                                      =
 |
  4 ++O                                                                    =
 |
    |                                                                      =
 |
  3 ++                                                                     =
 |
  2 ++                                                                     =
 |
    |                                                                      =
 |
  1 ++  *                                                                  =
 |
    |  + +                                                                 =
 |
  0 *+*---*-*--*-*-*-*-*-*-*-*--*-*-*-*-*-*-*-*-*--*-*-*-*-*-*-*-*--*-*-*-*=
-*


                                vmstat.memory.buff

  350 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  300 ++                 O                                                 =
 |
      | O                        O O                                       =
 |
      |                                                                    =
 |
  250 ++                     O       O O     O O                           =
 |
      O   O   O   O   O                                                    =
 |
  200 ++    O   O   O      O   O         O O     O O                       =
 |
      |                                                                    =
 |
  150 ++                                                                   =
 |
      |                                                                    =
 |
      *.     .*.*.*.    .*.     .*.*.   .*.*. .*. .*. .*.      .*. .*. .*. =
 |
  100 ++*.*.*       *.*.   *.*.*     *.*     *   *   *   *..*.*   *   *   *=
.*
      |                                                                    =
 |
   50 ++-------------------------------------------------------------------=
-+


                                  vmstat.system.in

  600000 ++----------------------------------------------------------------=
-+
         |                                     .*.             .*.         =
 |
  550000 *+       .*.*.*. .*. .*.*.*.*. .*.**.*   *.*.       .*   *.*.     =
 |
         |+    *.*       *   *         *              *.*. .*         *.*. =
.*
  500000 ++*. +                                           *               *=
 |
  450000 ++  *                                                             =
 |
         |                                                                 =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  350000 ++                                                                =
 |
  300000 ++                                                                =
 |
         |                               O      O                          =
 |
  250000 ++        O         O                                             =
 |
         O O O O O   O   O       O O O     OO     O O                      =
 |
  200000 ++------------O---O---O-------O------O----------------------------=
-+


                                  vmstat.system.cs

  200000 O+------O---------------O----------O-------O----------------------=
-+
  180000 ++  O       O O O     O                                           =
 |
         |     O   O               O O                                     =
 |
  160000 ++                            O   O  O   O                        =
 |
  140000 ++                O O                                             =
 |
         | O                             O      O                          =
 |
  120000 ++                                                                =
 |
  100000 ++                                                                =
 |
   80000 ++                                                                =
 |
         |                                                                 =
 |
   60000 ++                                                                =
 |
   40000 ++                                                                =
 |
         |                                                                 =
 |
   20000 *+*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.**.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*=
.*
       0 ++----------------------------------------------------------------=
-+


	[*] bisect-good sample
	[O] bisect-bad  sample

To reproduce:

        git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tes=
ts.git
        cd lkp-tests
        bin/lkp install job.yaml  # job file is attached in this email
        bin/lkp run     job.yaml


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Ying Huang

--===============3552980518690969881==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogdm0tc2NhbGFiaWxpdHkKZGVmYXVsdC1tb25pdG9yczoKICB3YWl0OiBhY3RpdmF0
ZS1tb25pdG9yCiAga21zZzogCiAgdXB0aW1lOiAKICBpb3N0YXQ6IAogIHZtc3RhdDogCiAgbnVt
YS1udW1hc3RhdDogCiAgbnVtYS12bXN0YXQ6IAogIG51bWEtbWVtaW5mbzogCiAgcHJvYy12bXN0
YXQ6IAogIHByb2Mtc3RhdDoKICAgIGludGVydmFsOiAxMAogIG1lbWluZm86IAogIHNsYWJpbmZv
OiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAogIGxhdGVuY3lfc3RhdHM6IAogIHNvZnRp
cnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tzdGF0czogCiAgbmZzc3RhdDogCiAgY3B1
aWRsZTogCiAgY3B1ZnJlcS1zdGF0czogCiAgdHVyYm9zdGF0OiAKICBwbWV0ZXI6IAogIHNjaGVk
X2RlYnVnOgogICAgaW50ZXJ2YWw6IDYwCmNwdWZyZXFfZ292ZXJub3I6IHBlcmZvcm1hbmNlCmRl
ZmF1bHQtd2F0Y2hkb2dzOgogIG9vbS1raWxsZXI6IAogIHdhdGNoZG9nOiAKY29tbWl0OiBiODY0
ZWQxY2JiYTkxNmEwNDE4MDg3ZmEwYjA1ODUwMjUzZGY2YTNkCm1vZGVsOiBCcmlja2xhbmQgSGFz
d2VsbC1FUApucl9jcHU6IDcyCm1lbW9yeTogMTI4RwpoZGRfcGFydGl0aW9uczogCnN3YXBfcGFy
dGl0aW9uczogCnJvb3Rmc19wYXJ0aXRpb246IApjYXRlZ29yeTogYmVuY2htYXJrCnBlcmYtcHJv
ZmlsZTogCnJ1bnRpbWU6IDMwMHMKc2l6ZTogCnZtLXNjYWxhYmlsaXR5OgogIHRlc3Q6IG1tYXAt
cHJlYWQtc2VxCnF1ZXVlOiBiaXNlY3QKdGVzdGJveDogbGtwLWhzdy1lcDIKdGJveF9ncm91cDog
bGtwLWhzdy1lcDIKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE2LTAxLTE3
IDA4OjIwOjE3LjA3Mzc1MDY4OCArMDg6MDAKaWQ6IDZiODFjN2FmODIwZTBmZjhlMzNlNGEwYjg4
MzQ0NWM2MGVjMGUxM2QKdXNlcjogbGtwCmNvbXBpbGVyOiBnY2MtNC45CmhlYWRfY29tbWl0OiBh
Zjc0M2NjMzM5ZDE3NTA5ZjIxZWM2ZmMwZjM0MGMxMzY0YzE2OTlhCmJhc2VfY29tbWl0OiBhZmQy
ZmY5YjdlMWIzNjcxNzJmMThiYTdmNjkzZGZiNjJiZGNiMmRjCmJyYW5jaDogbGludXgtZGV2ZWwv
ZGV2ZWwtaG91cmx5LTIwMTYwMTE2MjIKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcu
Y2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC92bS1zY2FsYWJpbGl0eS9wZXJmb3JtYW5jZS0zMDBz
LW1tYXAtcHJlYWQtc2VxL2xrcC1oc3ctZXAyL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ov
eDg2XzY0LXJoZWwvZ2NjLTQuOS9iODY0ZWQxY2JiYTkxNmEwNDE4MDg3ZmEwYjA1ODUwMjUzZGY2
YTNkLzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvbGtwLWhzdy1lcDIvYmlzZWN0X3ZtLXNj
YWxhYmlsaXR5LXBlcmZvcm1hbmNlLTMwMHMtbW1hcC1wcmVhZC1zZXEtZGViaWFuLXg4Nl82NC0y
MDE1LTAyLTA3LmNnei14ODZfNjQtcmhlbC1iODY0ZWQxY2JiYTkxNmEwNDE4MDg3ZmEwYjA1ODUw
MjUzZGY2YTNkLTIwMTYwMTE3LTMxODU2LTFoeXljY2EtMC55YW1sIgptYXhfdXB0aW1lOiAxNTAw
CmluaXRyZDogIi9vc2ltYWdlL2RlYmlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpi
b290bG9hZGVyX2FwcGVuZDoKLSByb290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Av
c2NoZWR1bGVkL2xrcC1oc3ctZXAyL2Jpc2VjdF92bS1zY2FsYWJpbGl0eS1wZXJmb3JtYW5jZS0z
MDBzLW1tYXAtcHJlYWQtc2VxLWRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJo
ZWwtYjg2NGVkMWNiYmE5MTZhMDQxODA4N2ZhMGIwNTg1MDI1M2RmNmEzZC0yMDE2MDExNy0zMTg1
Ni0xaHl5Y2NhLTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAotIGJy
YW5jaD1saW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjAxMTYyMgotIGNvbW1pdD1iODY0ZWQx
Y2JiYTkxNmEwNDE4MDg3ZmEwYjA1ODUwMjUzZGY2YTNkCi0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4
L3g4Nl82NC1yaGVsL2djYy00LjkvYjg2NGVkMWNiYmE5MTZhMDQxODA4N2ZhMGIwNTg1MDI1M2Rm
NmEzZC92bWxpbnV6LTQuNC4wLXJjOC0wMDAwMS1nYjg2NGVkMQotIG1heF91cHRpbWU9MTUwMAot
IFJFU1VMVF9ST09UPS9yZXN1bHQvdm0tc2NhbGFiaWxpdHkvcGVyZm9ybWFuY2UtMzAwcy1tbWFw
LXByZWFkLXNlcS9sa3AtaHN3LWVwMi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82
NC1yaGVsL2djYy00LjkvYjg2NGVkMWNiYmE5MTZhMDQxODA4N2ZhMGIwNTg1MDI1M2RmNmEzZC8w
Ci0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0
ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVk
IHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5pYz0tMSBzb2Z0bG9ja3Vw
X3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJv
bXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9y
bWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3AteDg2XzY0LmNneiIKbW9kdWxlc19p
bml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvYjg2NGVkMWNiYmE5MTZhMDQx
ODA4N2ZhMGIwNTg1MDI1M2RmNmEzZC9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAiL29zaW1hZ2Uv
ZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3osL29zaW1hZ2UvZGVwcy9k
ZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNvbmZpZy5jZ3osL29zaW1hZ2UvZGVw
cy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1h
cmtzL3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3ZtLXNjYWxhYmlsaXR5LmNneiIKbGlu
dXhfaGVhZGVyc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvYjg2NGVk
MWNiYmE5MTZhMDQxODA4N2ZhMGIwNTg1MDI1M2RmNmEzZC9saW51eC1oZWFkZXJzLmNneiIKcmVw
ZWF0X3RvOiAyCmtlcm5lbDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9iODY0ZWQx
Y2JiYTkxNmEwNDE4MDg3ZmEwYjA1ODUwMjUzZGY2YTNkL3ZtbGludXotNC40LjAtcmM4LTAwMDAx
LWdiODY0ZWQxIgpkZXF1ZXVlX3RpbWU6IDIwMTYtMDEtMTcgMDg6MjQ6NTguMjQ1OTIxMTM0ICsw
ODowMApqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDQwLjQzIDQyLjAyIDIwLjA3IDIvNzIy
IDk4MjkKc3RhcnRfdGltZTogJzE0NTI5OTAzNDUnCmVuZF90aW1lOiAnMTQ1Mjk5MDY3MCcKdmVy
c2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNjAxMTUtMjIyNzA1Igo=

--===============3552980518690969881==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNi0wMS0xNyAwODoyNTo0MyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0xNyAwODoyNTo0MyBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMS0xNyAwODoyNTo0MyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDEtMTcgMDg6MjU6NDMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTE3IDA4OjI1OjQzIGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMS0xNyAwODoyNTo0MyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEt
MTcgMDg6MjU6NDMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTE3IDA4OjI1OjQzIGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMS0xNyAwODoyNTo0MyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMTcg
MDg6MjU6NDMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTE3IDA4OjI1OjQzIGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxOC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMS0xNyAwODoyNTo0MyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMTcgMDg6
MjU6NDMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMTcgMDg6MjU6NDMgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTAxLTE3IDA4OjI1OjQzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUyMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0xNyAwODoyNTo0
MyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjIvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMTcgMDg6MjU6NDMgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTAxLTE3IDA4OjI1OjQzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHUyNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0xNyAwODoyNTo0MyBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjUvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMTcgMDg6MjU6NDMgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAxLTE3IDA4OjI1OjQzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUyNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0xNyAwODoyNTo0MyBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjgvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDEtMTcgMDg6MjU6NDMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAx
LTE3IDA4OjI1OjQzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTE3IDA4OjI1OjQzIGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMS0xNyAwODoyNTo0MyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MzEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMTcg
MDg6MjU6NDMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTE3IDA4OjI1OjQzIGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMy9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMS0xNyAwODoyNTo0MyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MzQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMTcgMDg6
MjU6NDMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTE3IDA4OjI1OjQzIGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMS0xNyAwODoyNTo0MyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MzcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMTcgMDg6MjU6
NDMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTE3IDA4OjI1OjQzIGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wMS0xNyAwODoyNTo0MyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0xNyAwODoyNTo0MyBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMTcgMDg6MjU6NDMgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAxLTE3IDA4OjI1OjQzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU0Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0xNyAwODoyNTo0MyBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDMvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDEtMTcgMDg6MjU6NDMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAx
LTE3IDA4OjI1OjQzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU0NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0xNyAwODoyNTo0MyBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDEtMTcgMDg6MjU6NDMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTQ3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTE3
IDA4OjI1OjQzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0
OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0xNyAwODoyNTo0MyBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDkvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDEtMTcgMDg6MjU6NDMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMTcgMDg6
MjU6NDMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUwL2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTE3IDA4OjI1OjQzIGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMS0xNyAwODoyNTo0MyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NTIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMTcgMDg6MjU6
NDMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUzL2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTE3IDA4OjI1OjQzIGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wMS0xNyAwODoyNTo0MyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMTcgMDg6MjU6NDMg
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU2L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTE3IDA4OjI1OjQzIGVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAx
Ni0wMS0xNyAwODoyNTo0MyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1NTgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMTcgMDg6MjU6NDMgZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU5L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE2LTAxLTE3IDA4OjI1OjQzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAx
LTE3IDA4OjI1OjQzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU2MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0xNyAwODoyNTo0MyBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjEvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDEtMTcgMDg6MjU6NDMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTYyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTE3
IDA4OjI1OjQzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2
My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0xNyAwODoyNTo0MyBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjQvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDEtMTcgMDg6MjU6NDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTY1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTE3IDA4
OjI1OjQ0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2Ni9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0xNyAwODoyNTo0NCBlY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCjIwMTYtMDEtMTcgMDg6MjU6NDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTY4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTE3IDA4OjI1
OjQ0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2OS9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0xNyAwODoyNTo0NCBlY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wMS0xNyAwODoyNTo0NCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NzAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMTcgMDg6MjU6NDQg
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcxL2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTE3IDA4OjI1OjQ0IGVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAxLTE3IDA4OjI1OjQ0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTE3IDA4OjI1OjQ1IG1vdW50
IC10IHRtcGZzIC1vIHNpemU9MTAwJSB2bS1zY2FsYWJpbGl0eS10bXAgL3RtcC92bS1zY2FsYWJp
bGl0eS10bXAKMjAxNi0wMS0xNyAwODoyNTo0NSB0cnVuY2F0ZSAtcyAxMzUwODM3NTM0NzIgL3Rt
cC92bS1zY2FsYWJpbGl0eS10bXAvdm0tc2NhbGFiaWxpdHkuaW1nCjIwMTYtMDEtMTcgMDg6MjU6
NDUgbWtmcy54ZnMgLXEgL3RtcC92bS1zY2FsYWJpbGl0eS10bXAvdm0tc2NhbGFiaWxpdHkuaW1n
CjIwMTYtMDEtMTcgMDg6MjU6NDUgbW91bnQgLW8gbG9vcCAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRt
cC92bS1zY2FsYWJpbGl0eS5pbWcgL3RtcC92bS1zY2FsYWJpbGl0eS10bXAvdm0tc2NhbGFiaWxp
dHkKMjAxNi0wMS0xNyAwODoyNTo0NSAuL2Nhc2UtbW1hcC1wcmVhZC1zZXEKMjAxNi0wMS0xNyAw
ODoyNTo0NSB0cnVuY2F0ZSAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eS9z
cGFyc2UtbW1hcC1wcmVhZC1zZXEgLXMgNDM5ODA0NjUxMTEwNAoyMDE2LTAxLTE3IDA4OjI1OjQ1
IC4vdXNlbWVtIC0tcnVudGltZSAzMDAgLW4gNzIgLWYgL3RtcC92bS1zY2FsYWJpbGl0eS10bXAv
dm0tc2NhbGFiaWxpdHkvc3BhcnNlLW1tYXAtcHJlYWQtc2VxIC0tcmVhZG9ubHkgNDM5ODA0NjUx
MTEwNAoyMDE2LTAxLTE3IDA4OjMxOjEwIHVtb3VudCAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92
bS1zY2FsYWJpbGl0eQoyMDE2LTAxLTE3IDA4OjMxOjEwIHJtIC90bXAvdm0tc2NhbGFiaWxpdHkt
dG1wL3ZtLXNjYWxhYmlsaXR5LmltZwoyMDE2LTAxLTE3IDA4OjMxOjEwIHVtb3VudCAvdG1wL3Zt
LXNjYWxhYmlsaXR5LXRtcAo=

--===============3552980518690969881==--

