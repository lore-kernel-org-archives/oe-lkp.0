Content-Type: multipart/mixed; boundary="===============5532160473887124202=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [mm/rmap] 3dec0ba0be6: +19.7% vm-scalability.throughput +25.7% turbostat.Pkg_W
Date: Tue, 23 Dec 2014 13:05:49 +0800
Message-ID: <1419311149.26403.49.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5532160473887124202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

commit 3dec0ba0be6a532cac949e02b853021bf6d57dad ("mm/rmap: share the i_mmap=
_rwsem")


testbox/testcase/testparams: ivb43/vm-scalability/performance-300s-mmap-xre=
ad-seq-mt

c8c06efa8b552608  3dec0ba0be6a532cac949e02b8  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

  41518023 =C2=B1  0%     +19.7%   49689052 =C2=B1  1%  vm-scalability.thro=
ughput
      1.03 =C2=B1  1%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.call_rwsem_wake.rmap_walk.page_referenced.shrink_page_list.shrink_inac=
tive_list
      1.16 =C2=B1  2%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.rwsem_down_write_failed.call_rwsem_down_write_failed.rmap_walk.try_to_=
unmap.shrink_page_list
      1.17 =C2=B1  2%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.call_rwsem_down_write_failed.rmap_walk.try_to_unmap.shrink_page_list.s=
hrink_inactive_list
      1.22 =C2=B1  0%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.try_to_wake_up.wake_up_process.__rwsem_do_wake.rwsem_wake.call_rwsem_w=
ake
      1.28 =C2=B1  0%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.__rwsem_do_wake.rwsem_wake.call_rwsem_wake.rmap_walk.try_to_unmap
      1.34 =C2=B1  1%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.intel_idle.cpuidle_enter_state.cpuidle_enter.cpu_startup_entry.start_s=
econdary
      1.39 =C2=B1  1%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.wake_up_process.__rwsem_do_wake.rwsem_wake.call_rwsem_wake.rmap_walk
     11289 =C2=B1  0%     -81.3%       2110 =C2=B1  3%  uptime.idle
      0.04 =C2=B1 45%    -100.0%       0.00 =C2=B1  0%  turbostat.%c3
      1.44 =C2=B1  0%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.cpuidle_enter_state.cpuidle_enter.cpu_startup_entry.start_secondary
      1.49 =C2=B1  0%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.rwsem_wake.call_rwsem_wake.rmap_walk.try_to_unmap.shrink_page_list
      1.49 =C2=B1  0%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.call_rwsem_wake.rmap_walk.try_to_unmap.shrink_page_list.shrink_inactiv=
e_list
      3.18 =C2=B1  2%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.rwsem_spin_on_owner.rwsem_down_write_failed.call_rwsem_down_write_fail=
ed.rmap_walk.page_referenced
      4.15 =C2=B1  2%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.rwsem_down_write_failed.call_rwsem_down_write_failed.rmap_walk.page_re=
ferenced.shrink_page_list
      4.16 =C2=B1  2%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.call_rwsem_down_write_failed.rmap_walk.page_referenced.shrink_page_lis=
t.shrink_inactive_list
       605 =C2=B1  9%   +1185.9%       7779 =C2=B1 22%  numa-vmstat.node1.n=
r_pages_scanned
     11220 =C2=B1  4%    +404.9%      56653 =C2=B1  5%  numa-vmstat.node1.n=
r_active_anon
      5751 =C2=B1  6%    +600.4%      40283 =C2=B1  6%  sched_debug.cfs_rq[=
47]:/.avg->runnable_avg_sum
       124 =C2=B1  6%    +604.8%        877 =C2=B1  6%  sched_debug.cfs_rq[=
47]:/.tg_runnable_contrib
     71630 =C2=B1 45%     -90.1%       7098 =C2=B1 48%  sched_debug.cpu#47.=
ttwu_count
     63466 =C2=B1 46%     -90.6%       5941 =C2=B1 42%  sched_debug.cpu#47.=
sched_goidle
      6.23 =C2=B1  0%    +394.5%      30.79 =C2=B1  6%  perf-profile.cpu-cy=
cles.try_to_unmap_one.rmap_walk.try_to_unmap.shrink_page_list.shrink_inacti=
ve_list
      5.07 =C2=B1  9%    +456.9%      28.22 =C2=B1  5%  perf-profile.cpu-cy=
cles.__do_page_cache_readahead.filemap_fault.__do_fault.do_read_fault.handl=
e_mm_fault
      5.05 =C2=B1  9%    +458.3%      28.22 =C2=B1  5%  perf-profile.cpu-cy=
cles.__page_cache_alloc.__do_page_cache_readahead.filemap_fault.__do_fault.=
do_read_fault
      5.05 =C2=B1  9%    +458.2%      28.22 =C2=B1  5%  perf-profile.cpu-cy=
cles.__alloc_pages_nodemask.alloc_pages_current.__page_cache_alloc.__do_pag=
e_cache_readahead.filemap_fault
      5.06 =C2=B1  9%    +457.9%      28.22 =C2=B1  5%  perf-profile.cpu-cy=
cles.alloc_pages_current.__page_cache_alloc.__do_page_cache_readahead.filem=
ap_fault.__do_fault
      5.59 =C2=B1  1%    +384.7%      27.09 =C2=B1  9%  perf-profile.cpu-cy=
cles.page_referenced.shrink_page_list.shrink_inactive_list.shrink_lruvec.sh=
rink_zone
      5.53 =C2=B1  1%    +389.3%      27.07 =C2=B1  9%  perf-profile.cpu-cy=
cles.rmap_walk.page_referenced.shrink_page_list.shrink_inactive_list.shrink=
_lruvec
      0.20 =C2=B1  2%  +13530.4%      26.92 =C2=B1  9%  perf-profile.cpu-cy=
cles.page_referenced_one.rmap_walk.page_referenced.shrink_page_list.shrink_=
inactive_list
      0.09 =C2=B1  4%  +28973.0%      26.89 =C2=B1  9%  perf-profile.cpu-cy=
cles.__page_check_address.page_referenced_one.rmap_walk.page_referenced.shr=
ink_page_list
      0.04 =C2=B1 17%  +60475.0%      24.23 =C2=B1  9%  perf-profile.cpu-cy=
cles._raw_spin_lock.__page_check_address.page_referenced_one.rmap_walk.page=
_referenced
    128298 =C2=B1 45%     -88.8%      14312 =C2=B1 33%  sched_debug.cpu#47.=
nr_switches
      6624 =C2=B1 11%    +517.8%      40925 =C2=B1 11%  sched_debug.cfs_rq[=
46]:/.avg->runnable_avg_sum
      0.06 =C2=B1  7%  +37773.9%      21.78 =C2=B1 14%  perf-profile.cpu-cy=
cles.__page_check_address.try_to_unmap_one.rmap_walk.try_to_unmap.shrink_pa=
ge_list
      0.04 =C2=B1  0%  +49050.0%      19.66 =C2=B1 14%  perf-profile.cpu-cy=
cles._raw_spin_lock.__page_check_address.try_to_unmap_one.rmap_walk.try_to_=
unmap
       144 =C2=B1 11%    +518.8%        891 =C2=B1 11%  sched_debug.cfs_rq[=
46]:/.tg_runnable_contrib
   1130490 =C2=B1  6%     -94.5%      61989 =C2=B1 39%  sched_debug.cpu#21.=
sched_count
       607 =C2=B1 18%    +420.6%       3160 =C2=B1 18%  sched_debug.cpu#46.=
curr->pid
      0.83 =C2=B1  2%    +429.3%       4.42 =C2=B1  2%  perf-profile.cpu-cy=
cles.kthread.ret_from_fork
      0.83 =C2=B1  2%    +429.3%       4.42 =C2=B1  2%  perf-profile.cpu-cy=
cles.ret_from_fork
      0.73 =C2=B1  3%    +502.4%       4.38 =C2=B1  2%  perf-profile.cpu-cy=
cles.kswapd_shrink_zone.kswapd.kthread.ret_from_fork
      0.72 =C2=B1  3%    +508.0%       4.38 =C2=B1  2%  perf-profile.cpu-cy=
cles.shrink_page_list.shrink_inactive_list.shrink_lruvec.shrink_zone.kswapd=
_shrink_zone
      0.73 =C2=B1  3%    +502.4%       4.38 =C2=B1  2%  perf-profile.cpu-cy=
cles.kswapd.kthread.ret_from_fork
      0.73 =C2=B1  3%    +502.1%       4.38 =C2=B1  2%  perf-profile.cpu-cy=
cles.shrink_lruvec.shrink_zone.kswapd_shrink_zone.kswapd.kthread
      0.73 =C2=B1  3%    +502.1%       4.38 =C2=B1  2%  perf-profile.cpu-cy=
cles.shrink_inactive_list.shrink_lruvec.shrink_zone.kswapd_shrink_zone.kswa=
pd
      0.73 =C2=B1  3%    +502.4%       4.38 =C2=B1  2%  perf-profile.cpu-cy=
cles.shrink_zone.kswapd_shrink_zone.kswapd.kthread.ret_from_fork
      5602 =C2=B1  3%    +660.0%      42577 =C2=B1  1%  sched_debug.cfs_rq[=
45]:/.avg->runnable_avg_sum
       122 =C2=B1  2%    +659.3%        928 =C2=B1  1%  sched_debug.cfs_rq[=
45]:/.tg_runnable_contrib
      0.00 =C2=B1  0%      +Inf%       2.47 =C2=B1  2%  perf-profile.cpu-cy=
cles.call_function_interrupt.__page_check_address.page_referenced_one.rmap_=
walk.page_referenced
      0.00 =C2=B1  0%      +Inf%       2.24 =C2=B1  4%  perf-profile.cpu-cy=
cles.flush_smp_call_function_queue.generic_smp_call_function_single_interru=
pt.smp_call_function_interrupt.call_function_interrupt.__page_check_address
      0.00 =C2=B1  0%      +Inf%       1.97 =C2=B1  7%  perf-profile.cpu-cy=
cles.call_function_interrupt.__page_check_address.try_to_unmap_one.rmap_wal=
k.try_to_unmap
     46823 =C2=B1 14%     -88.2%       5508 =C2=B1 33%  sched_debug.cpu#45.=
ttwu_count
     43527 =C2=B1 17%     -88.4%       5031 =C2=B1 36%  sched_debug.cpu#45.=
sched_goidle
      0.00 =C2=B1  0%      +Inf%       1.64 =C2=B1  2%  perf-profile.cpu-cy=
cles.smp_call_function_interrupt.call_function_interrupt.__page_check_addre=
ss.page_referenced_one.rmap_walk
      0.00 =C2=B1  0%      +Inf%       1.40 =C2=B1  2%  perf-profile.cpu-cy=
cles.generic_smp_call_function_single_interrupt.smp_call_function_interrupt=
.call_function_interrupt.__page_check_address.page_referenced_one
      0.00 =C2=B1  0%      +Inf%       1.33 =C2=B1  7%  perf-profile.cpu-cy=
cles.smp_call_function_interrupt.call_function_interrupt.__page_check_addre=
ss.try_to_unmap_one.rmap_walk
      0.00 =C2=B1  0%      +Inf%       1.13 =C2=B1  7%  perf-profile.cpu-cy=
cles.generic_smp_call_function_single_interrupt.smp_call_function_interrupt=
.call_function_interrupt.__page_check_address.try_to_unmap_one
     87628 =C2=B1 17%     -86.3%      11995 =C2=B1 31%  sched_debug.cpu#45.=
nr_switches
      5697 =C2=B1  3%    +644.0%      42388 =C2=B1  3%  sched_debug.cfs_rq[=
44]:/.avg->runnable_avg_sum
       123 =C2=B1  3%    +647.4%        923 =C2=B1  3%  sched_debug.cfs_rq[=
44]:/.tg_runnable_contrib
      4.59 =C2=B1  1%     -99.5%       0.03 =C2=B1 34%  perf-profile.cpu-cy=
cles.start_secondary
      4.57 =C2=B1  1%     -99.5%       0.03 =C2=B1 34%  perf-profile.cpu-cy=
cles.cpu_startup_entry.start_secondary
      1.95 =C2=B1  3%     -99.1%       0.02 =C2=B1 24%  perf-profile.cpu-cy=
cles.cpuidle_enter.cpu_startup_entry.start_secondary
 4.119e+09 =C2=B1  2%     -95.5%  1.863e+08 =C2=B1 12%  cpuidle.C1-IVT.time
   5728564 =C2=B1 36%     -82.1%    1026116 =C2=B1 14%  cpuidle.C3-IVT.time
     25186 =C2=B1 18%     -93.2%       1711 =C2=B1 26%  cpuidle.C3-IVT.usage
 6.121e+09 =C2=B1  1%     -83.7%  9.959e+08 =C2=B1  6%  cpuidle.C6-IVT.time
   1218282 =C2=B1  1%     -85.6%     175991 =C2=B1 11%  cpuidle.C6-IVT.usage
     54958 =C2=B1  8%     -89.8%       5581 =C2=B1 40%  sched_debug.cpu#44.=
ttwu_count
     60.80 =C2=B1  0%     -89.5%       6.39 =C2=B1  7%  turbostat.%c1
     52291 =C2=B1 13%     -91.0%       4695 =C2=B1 49%  sched_debug.cpu#44.=
sched_goidle
    105251 =C2=B1 13%     -88.6%      11972 =C2=B1 38%  sched_debug.cpu#44.=
nr_switches
      5477 =C2=B1  8%    +584.9%      37517 =C2=B1  8%  sched_debug.cfs_rq[=
43]:/.avg->runnable_avg_sum
       119 =C2=B1  8%    +585.1%        817 =C2=B1  8%  sched_debug.cfs_rq[=
43]:/.tg_runnable_contrib
       347 =C2=B1 38%    +624.6%       2518 =C2=B1 11%  sched_debug.cpu#43.=
ttwu_local
      5608 =C2=B1  9%    +647.2%      41904 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.avg->runnable_avg_sum
       122 =C2=B1  9%    +648.6%        913 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.tg_runnable_contrib
       341 =C2=B1 31%    +558.7%       2251 =C2=B1 34%  sched_debug.cpu#42.=
ttwu_local
      5692 =C2=B1  8%    +602.5%      39991 =C2=B1  4%  sched_debug.cfs_rq[=
41]:/.avg->runnable_avg_sum
       124 =C2=B1  8%    +602.8%        871 =C2=B1  4%  sched_debug.cfs_rq[=
41]:/.tg_runnable_contrib
    632720 =C2=B1  3%     -97.6%      15185 =C2=B1 36%  sched_debug.cpu#18.=
ttwu_count
    546610 =C2=B1  4%     -98.1%      10221 =C2=B1 35%  sched_debug.cpu#18.=
sched_goidle
    159155 =C2=B1  7%    +672.0%    1228632 =C2=B1 16%  proc-vmstat.pgscan_=
kswapd_dma32
   3270184 =C2=B1  2%    +556.5%   21468949 =C2=B1 25%  proc-vmstat.pgscan_=
kswapd_normal
   1220265 =C2=B1  1%     -94.3%      70114 =C2=B1 36%  sched_debug.cpu#20.=
sched_count
      6468 =C2=B1 10%    +540.2%      41413 =C2=B1  3%  sched_debug.cfs_rq[=
40]:/.avg->runnable_avg_sum
       140 =C2=B1 10%    +542.3%        902 =C2=B1  3%  sched_debug.cfs_rq[=
40]:/.tg_runnable_contrib
     67924 =C2=B1 39%     -88.8%       7600 =C2=B1 42%  sched_debug.cpu#40.=
ttwu_count
     61532 =C2=B1 40%     -89.4%       6528 =C2=B1 43%  sched_debug.cpu#40.=
sched_goidle
    128701 =C2=B1 36%     -80.9%      24561 =C2=B1 44%  sched_debug.cpu#40.=
sched_count
     45332 =C2=B1  4%    +401.3%     227237 =C2=B1  5%  numa-meminfo.node1.=
Active(anon)
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cpu#0.n=
r_running
    123794 =C2=B1 40%     -86.9%      16202 =C2=B1 42%  sched_debug.cpu#40.=
nr_switches
      6446 =C2=B1 14%    +518.6%      39877 =C2=B1  6%  sched_debug.cfs_rq[=
39]:/.avg->runnable_avg_sum
       140 =C2=B1 13%    +517.6%        869 =C2=B1  6%  sched_debug.cfs_rq[=
39]:/.tg_runnable_contrib
   1096298 =C2=B1  4%     -97.5%      27591 =C2=B1 28%  sched_debug.cpu#18.=
nr_switches
       411 =C2=B1 11%    +632.1%       3008 =C2=B1 28%  sched_debug.cpu#39.=
ttwu_local
      6036 =C2=B1  9%    +583.5%      41261 =C2=B1  6%  sched_debug.cfs_rq[=
38]:/.avg->runnable_avg_sum
        26 =C2=B1 23%   +1544.3%        435 =C2=B1 19%  sched_debug.cpu#1.l=
oad
       130 =C2=B1  9%    +588.1%        899 =C2=B1  6%  sched_debug.cfs_rq[=
38]:/.tg_runnable_contrib
        22 =C2=B1 21%   +1898.9%        439 =C2=B1 18%  sched_debug.cpu#1.c=
pu_load[0]
        22 =C2=B1 26%   +1898.9%        439 =C2=B1 18%  sched_debug.cpu#1.c=
pu_load[1]
        21 =C2=B1 26%   +1921.8%        439 =C2=B1 18%  sched_debug.cpu#1.c=
pu_load[2]
        21 =C2=B1 26%   +1919.5%        439 =C2=B1 18%  sched_debug.cpu#1.c=
pu_load[3]
        21 =C2=B1 30%   +1941.9%        439 =C2=B1 18%  sched_debug.cpu#1.c=
pu_load[4]
   1102216 =C2=B1  1%     -94.3%      62385 =C2=B1 35%  sched_debug.cpu#23.=
sched_count
        35 =C2=B1 26%   +1118.9%        435 =C2=B1 19%  sched_debug.cfs_rq[=
1]:/.load
        19 =C2=B1 26%   +2161.0%        435 =C2=B1 19%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
       337 =C2=B1 16%    +450.9%       1860 =C2=B1 22%  sched_debug.cpu#38.=
ttwu_local
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cpu#2.n=
r_running
   1129044 =C2=B1  3%     -94.1%      66651 =C2=B1 46%  sched_debug.cpu#2.n=
r_switches
       602 =C2=B1 30%    +475.4%       3467 =C2=B1  5%  sched_debug.cpu#38.=
curr->pid
      7234 =C2=B1 21%    +473.3%      41477 =C2=B1  3%  sched_debug.cfs_rq[=
37]:/.avg->runnable_avg_sum
       157 =C2=B1 21%    +474.7%        903 =C2=B1  2%  sched_debug.cfs_rq[=
37]:/.tg_runnable_contrib
   1152534 =C2=B1  1%     -93.9%      69989 =C2=B1 44%  sched_debug.cpu#2.s=
ched_count
    563500 =C2=B1  2%     -94.6%      30610 =C2=B1 49%  sched_debug.cpu#2.s=
ched_goidle
         4 =C2=B1 42%    +382.4%         20 =C2=B1  5%  sched_debug.cpu#24.=
cpu_load[4]
    628526 =C2=B1  3%     -98.0%      12750 =C2=B1 37%  sched_debug.cpu#17.=
ttwu_count
      5451 =C2=B1  9%    +678.7%      42448 =C2=B1  4%  sched_debug.cfs_rq[=
36]:/.avg->runnable_avg_sum
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cpu#3.n=
r_running
       118 =C2=B1  9%    +679.6%        925 =C2=B1  4%  sched_debug.cfs_rq[=
36]:/.tg_runnable_contrib
   1257445 =C2=B1  2%     -94.6%      67414 =C2=B1 45%  sched_debug.cpu#3.n=
r_switches
    587137 =C2=B1  2%     -98.3%       9903 =C2=B1 43%  sched_debug.cpu#17.=
sched_goidle
   1221394 =C2=B1  3%     -95.2%      59133 =C2=B1 30%  sched_debug.cpu#17.=
sched_count
   1308463 =C2=B1  6%     -94.7%      69557 =C2=B1 44%  sched_debug.cpu#3.s=
ched_count
    627757 =C2=B1  2%     -95.1%      31029 =C2=B1 48%  sched_debug.cpu#3.s=
ched_goidle
    579966 =C2=B1  1%     -93.9%      35154 =C2=B1 47%  sched_debug.cpu#3.t=
twu_count
       282 =C2=B1 20%    +391.1%       1386 =C2=B1 15%  sched_debug.cpu#24.=
ttwu_local
   1176269 =C2=B1  2%     -97.8%      26163 =C2=B1 35%  sched_debug.cpu#17.=
nr_switches
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cpu#4.n=
r_running
       647 =C2=B1 37%    +446.4%       3537 =C2=B1  4%  sched_debug.cpu#36.=
curr->pid
      5553 =C2=B1  9%    +692.0%      43986 =C2=B1  1%  sched_debug.cfs_rq[=
35]:/.avg->runnable_avg_sum
       120 =C2=B1  9%    +695.4%        958 =C2=B1  1%  sched_debug.cfs_rq[=
35]:/.tg_runnable_contrib
         4 =C2=B1 34%    +588.2%         29 =C2=B1 17%  sched_debug.cfs_rq[=
35]:/.runnable_load_avg
       137 =C2=B1 14%    +590.4%        949 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.tg_runnable_contrib
         2 =C2=B1 30%   +1045.5%         31 =C2=B1 23%  sched_debug.cpu#35.=
cpu_load[4]
         2 =C2=B1 30%   +1009.1%         30 =C2=B1 17%  sched_debug.cpu#35.=
cpu_load[3]
         3 =C2=B1 14%    +757.1%         30 =C2=B1 15%  sched_debug.cpu#35.=
cpu_load[2]
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cpu#5.n=
r_running
         4 =C2=B1 25%    +617.6%         30 =C2=B1 15%  sched_debug.cpu#35.=
cpu_load[1]
         5 =C2=B1 14%    +515.0%         30 =C2=B1 16%  sched_debug.cpu#35.=
cpu_load[0]
       631 =C2=B1 46%    +462.6%       3551 =C2=B1  3%  sched_debug.cpu#35.=
curr->pid
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cpu#35.=
nr_running
      6305 =C2=B1 14%    +591.7%      43620 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.avg->runnable_avg_sum
      5920 =C2=B1  9%    +637.1%      43638 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.avg->runnable_avg_sum
       128 =C2=B1  9%    +639.1%        949 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.tg_runnable_contrib
         5 =C2=B1 45%   +7104.8%        378 =C2=B1 25%  sched_debug.cpu#25.=
cpu_load[0]
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cpu#6.n=
r_running
       214 =C2=B1 12%    +569.0%       1433 =C2=B1 26%  sched_debug.cpu#34.=
ttwu_local
         3 =C2=B1 29%    +500.0%         22 =C2=B1  6%  sched_debug.cpu#34.=
cpu_load[4]
   1193134 =C2=B1  2%     -94.4%      67300 =C2=B1 44%  sched_debug.cpu#16.=
sched_count
         5 =C2=B1 45%   +7104.8%        378 =C2=B1 25%  sched_debug.cpu#25.=
cpu_load[1]
         5 =C2=B1 42%   +7465.0%        378 =C2=B1 25%  sched_debug.cpu#25.=
cpu_load[2]
         4 =C2=B1 40%   +7873.7%        378 =C2=B1 25%  sched_debug.cpu#25.=
cpu_load[3]
      1.03 =C2=B1  0%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.rwsem_wake.call_rwsem_wake.rmap_walk.page_referenced.shrink_page_list
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cpu#34.=
nr_running
      6355 =C2=B1 18%    +587.5%      43698 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.avg->runnable_avg_sum
       138 =C2=B1 18%    +588.4%        951 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.tg_runnable_contrib
         4 =C2=B1 36%   +8316.7%        378 =C2=B1 25%  sched_debug.cpu#25.=
cpu_load[4]
         4 =C2=B1 35%    +450.0%         22 =C2=B1  5%  sched_debug.cpu#33.=
cpu_load[4]
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cpu#33.=
nr_running
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cpu#7.n=
r_running
      7290 =C2=B1 23%    +498.9%      43659 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.avg->runnable_avg_sum
       158 =C2=B1 23%    +500.9%        951 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.tg_runnable_contrib
         5 =C2=B1 45%   +7104.8%        378 =C2=B1 25%  sched_debug.cfs_rq[=
25]:/.runnable_load_avg
    667825 =C2=B1  2%     -97.4%      17292 =C2=B1 30%  sched_debug.cpu#15.=
ttwu_count
       610 =C2=B1 15%    +470.6%       3483 =C2=B1  0%  sched_debug.cpu#26.=
curr->pid
    534622 =C2=B1  3%     -97.3%      14624 =C2=B1 30%  sched_debug.cpu#15.=
sched_goidle
   1135582 =C2=B1  6%     -94.9%      57656 =C2=B1 14%  sched_debug.cpu#15.=
sched_count
         4 =C2=B1 46%    +431.2%         21 =C2=B1  3%  sched_debug.cpu#26.=
cpu_load[0]
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cpu#8.n=
r_running
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cpu#32.=
nr_running
      6181 =C2=B1 11%    +595.1%      42962 =C2=B1  2%  sched_debug.cfs_rq[=
31]:/.avg->runnable_avg_sum
    136964 =C2=B1 45%    +307.3%     557871 =C2=B1 18%  sched_debug.cpu#8.a=
vg_idle
       134 =C2=B1 11%    +595.2%        935 =C2=B1  2%  sched_debug.cfs_rq[=
31]:/.tg_runnable_contrib
         4 =C2=B1 46%    +431.2%         21 =C2=B1  3%  sched_debug.cpu#26.=
cpu_load[1]
   1074159 =C2=B1  3%     -96.6%      36206 =C2=B1 24%  sched_debug.cpu#15.=
nr_switches
         3 =C2=B1 42%    +507.1%         21 =C2=B1  3%  sched_debug.cpu#26.=
cpu_load[2]
         3 =C2=B1 33%    +561.5%         21 =C2=B1  2%  sched_debug.cpu#26.=
cpu_load[3]
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cpu#9.n=
r_running
      5844 =C2=B1  9%    +644.5%      43512 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.avg->runnable_avg_sum
       126 =C2=B1  9%    +649.5%        950 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.tg_runnable_contrib
         2 =C2=B1 47%    +681.8%         21 =C2=B1  2%  sched_debug.cpu#26.=
cpu_load[4]
         3 =C2=B1 39%    +584.6%         22 =C2=B1  5%  sched_debug.cpu#30.=
cpu_load[4]
    652232 =C2=B1  1%     -97.4%      17219 =C2=B1 29%  sched_debug.cpu#14.=
ttwu_count
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cpu#10.=
nr_running
   1112495 =C2=B1  5%     -94.6%      59865 =C2=B1 34%  sched_debug.cpu#14.=
sched_count
       623 =C2=B1 43%    +462.3%       3507 =C2=B1  1%  sched_debug.cpu#30.=
curr->pid
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cpu#30.=
nr_running
      5996 =C2=B1  8%    +630.9%      43826 =C2=B1  1%  sched_debug.cfs_rq[=
29]:/.avg->runnable_avg_sum
       130 =C2=B1  8%    +636.7%        957 =C2=B1  1%  sched_debug.cfs_rq[=
29]:/.tg_runnable_contrib
         4 =C2=B1 46%    +431.2%         21 =C2=B1  3%  sched_debug.cfs_rq[=
26]:/.runnable_load_avg
   1042659 =C2=B1  2%     -96.6%      35462 =C2=B1 26%  sched_debug.cpu#14.=
nr_switches
       126 =C2=B1  8%    +654.0%        950 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.tg_runnable_contrib
         3 =C2=B1 23%    +708.3%         24 =C2=B1 16%  sched_debug.cpu#29.=
cpu_load[4]
         3 =C2=B1 31%    +592.9%         24 =C2=B1 16%  sched_debug.cpu#29.=
cpu_load[3]
      5797 =C2=B1  8%    +652.4%      43621 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.avg->runnable_avg_sum
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cpu#11.=
nr_running
       495 =C2=B1 24%    +618.1%       3560 =C2=B1  3%  sched_debug.cpu#29.=
curr->pid
        61 =C2=B1 43%    +520.5%        378 =C2=B1 22%  sched_debug.cfs_rq[=
13]:/.tg_load_contrib
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cpu#29.=
nr_running
      6354 =C2=B1 20%    +585.7%      43575 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.avg->runnable_avg_sum
       138 =C2=B1 19%    +587.2%        950 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.tg_runnable_contrib
    823802 =C2=B1  4%     -96.4%      29781 =C2=B1 32%  sched_debug.cpu#12.=
nr_switches
         5 =C2=B1 24%    +380.0%         24 =C2=B1  4%  sched_debug.cfs_rq[=
28]:/.load
       568 =C2=B1 30%    +512.9%       3486 =C2=B1  2%  sched_debug.cpu#27.=
curr->pid
         4 =C2=B1 48%    +427.8%         23 =C2=B1  3%  sched_debug.cpu#28.=
cpu_load[2]
    850130 =C2=B1  4%     -93.5%      55426 =C2=B1 15%  sched_debug.cpu#12.=
sched_count
    410142 =C2=B1  4%     -97.3%      10879 =C2=B1 38%  sched_debug.cpu#12.=
sched_goidle
    486755 =C2=B1  3%     -96.8%      15412 =C2=B1 29%  sched_debug.cpu#12.=
ttwu_count
       621 =C2=B1  9%    +461.7%       3488 =C2=B1  0%  sched_debug.cpu#28.=
curr->pid
         5 =C2=B1 24%    +380.0%         24 =C2=B1  4%  sched_debug.cpu#28.=
load
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cpu#28.=
nr_running
      5868 =C2=B1 11%    +641.9%      43534 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.avg->runnable_avg_sum
       127 =C2=B1 11%    +644.7%        949 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.tg_runnable_contrib
   1057793 =C2=B1  4%     -91.2%      92598 =C2=B1 27%  sched_debug.cpu#13.=
sched_count
      8.34 =C2=B1  2%     -81.2%       1.57 =C2=B1 16%  turbostat.%c6
    109484 =C2=B1 10%     -80.7%      21109 =C2=B1 34%  sched_debug.cpu#44.=
sched_count
    153208 =C2=B1 30%    +420.2%     796994 =C2=B1  5%  sched_debug.cpu#17.=
avg_idle
       636 =C2=B1 35%    +364.9%       2960 =C2=B1 14%  sched_debug.cpu#39.=
curr->pid
         5 =C2=B1 45%    +486.4%         32 =C2=B1 41%  sched_debug.cpu#34.=
load
         5 =C2=B1 39%    +313.6%         22 =C2=B1  8%  sched_debug.cpu#32.=
cpu_load[3]
         4 =C2=B1 40%    +422.2%         23 =C2=B1  4%  sched_debug.cfs_rq[=
28]:/.runnable_load_avg
         5 =C2=B1 37%    +313.6%         22 =C2=B1  8%  sched_debug.cpu#32.=
cpu_load[4]
         3 =C2=B1 47%    +560.0%         24 =C2=B1 17%  sched_debug.cpu#29.=
cpu_load[2]
    177657 =C2=B1 18%    +331.3%     766210 =C2=B1  6%  sched_debug.cpu#1.a=
vg_idle
       230 =C2=B1 14%    +421.0%       1202 =C2=B1 34%  sched_debug.cpu#35.=
ttwu_local
       143 =C2=B1 12%    +430.1%        758 =C2=B1  4%  sched_debug.cfs_rq[=
25]:/.tg_runnable_contrib
         3 =C2=B1 24%    +435.7%         18 =C2=B1  2%  sched_debug.cpu#45.=
cpu_load[4]
       644 =C2=B1 44%    +444.3%       3508 =C2=B1  1%  sched_debug.cpu#24.=
curr->pid
      6578 =C2=B1 12%    +428.8%      34785 =C2=B1  4%  sched_debug.cfs_rq[=
25]:/.avg->runnable_avg_sum
       638 =C2=B1 23%    +436.5%       3423 =C2=B1  3%  sched_debug.cpu#31.=
curr->pid
    162114 =C2=B1 13%    +375.4%     770667 =C2=B1  2%  sched_debug.cpu#19.=
avg_idle
       330 =C2=B1 20%    +347.0%       1477 =C2=B1 25%  sched_debug.cpu#44.=
ttwu_local
         4 =C2=B1 37%    +373.7%         22 =C2=B1  6%  sched_debug.cpu#34.=
cpu_load[2]
         4 =C2=B1 34%    +429.4%         22 =C2=B1  6%  sched_debug.cpu#34.=
cpu_load[3]
         3 =C2=B1 42%    +528.6%         22 =C2=B1  4%  sched_debug.cpu#30.=
cpu_load[3]
         5 =C2=B1 43%    +323.8%         22 =C2=B1  8%  sched_debug.cpu#27.=
cpu_load[2]
         3 =C2=B1 47%    +500.0%         22 =C2=B1  7%  sched_debug.cpu#30.=
cpu_load[2]
         5 =C2=B1 47%    +323.8%         22 =C2=B1  6%  sched_debug.cfs_rq[=
34]:/.runnable_load_avg
         5 =C2=B1 47%    +323.8%         22 =C2=B1  6%  sched_debug.cpu#34.=
cpu_load[1]
       614 =C2=B1 26%    +466.0%       3478 =C2=B1  0%  sched_debug.cpu#32.=
curr->pid
         3 =C2=B1 22%    +360.0%         17 =C2=B1  7%  sched_debug.cpu#47.=
cpu_load[4]
    159962 =C2=B1 16%    +373.1%     756714 =C2=B1  8%  sched_debug.cpu#21.=
avg_idle
      1654 =C2=B1 13%    +288.0%       6418 =C2=B1 36%  sched_debug.cpu#14.=
ttwu_local
   1675576 =C2=B1  2%    +315.4%    6959706 =C2=B1  5%  sched_debug.cfs_rq[=
47]:/.min_vruntime
         6 =C2=B1 50%    +266.7%         22 =C2=B1  8%  sched_debug.cpu#27.=
cpu_load[1]
       635 =C2=B1 29%    +450.0%       3494 =C2=B1  1%  sched_debug.cpu#34.=
curr->pid
       811 =C2=B1 30%    +303.2%       3273 =C2=B1  4%  sched_debug.cpu#47.=
curr->pid
   1665872 =C2=B1  1%    +327.4%    7119702 =C2=B1  3%  sched_debug.cfs_rq[=
44]:/.min_vruntime
   1672016 =C2=B1  2%    +329.0%    7172304 =C2=B1  1%  sched_debug.cfs_rq[=
37]:/.min_vruntime
   1673355 =C2=B1  2%    +334.7%    7274885 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.min_vruntime
   1669565 =C2=B1  1%    +328.2%    7149228 =C2=B1  1%  sched_debug.cfs_rq[=
42]:/.min_vruntime
   1662238 =C2=B1  1%    +329.3%    7136184 =C2=B1  2%  sched_debug.cfs_rq[=
36]:/.min_vruntime
   1675770 =C2=B1  2%    +275.8%    6297738 =C2=B1 26%  sched_debug.cfs_rq[=
46]:/.min_vruntime
    154299 =C2=B1 24%    +383.7%     746413 =C2=B1  2%  sched_debug.cpu#22.=
avg_idle
    148790 =C2=B1 25%    +280.7%     566507 =C2=B1 10%  sched_debug.cpu#3.a=
vg_idle
   1691609 =C2=B1  1%    +324.7%    7184532 =C2=B1  1%  sched_debug.cfs_rq[=
38]:/.min_vruntime
   1659081 =C2=B1  2%    +295.5%    6561192 =C2=B1  8%  sched_debug.cfs_rq[=
41]:/.min_vruntime
   1690936 =C2=B1  2%    +315.2%    7021530 =C2=B1  4%  sched_debug.cfs_rq[=
40]:/.min_vruntime
         4 =C2=B1 45%    +331.6%         20 =C2=B1  5%  sched_debug.cpu#24.=
cpu_load[3]
         4 =C2=B1 39%    +418.8%         20 =C2=B1  7%  sched_debug.cpu#31.=
cpu_load[4]
    134665 =C2=B1 19%    +315.5%     559570 =C2=B1 14%  sched_debug.cpu#10.=
avg_idle
     36278 =C2=B1  3%    +316.1%     150965 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.exec_clock
   1671691 =C2=B1  1%    +264.8%    6098101 =C2=B1 19%  sched_debug.cfs_rq[=
39]:/.min_vruntime
    160859 =C2=B1 21%    +328.9%     689951 =C2=B1  2%  sched_debug.cpu#16.=
avg_idle
     35934 =C2=B1  4%    +314.3%     148869 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.exec_clock
     36012 =C2=B1  1%    +309.5%     147485 =C2=B1  2%  sched_debug.cfs_rq[=
44]:/.exec_clock
   1672621 =C2=B1  1%    +313.2%    6911022 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.min_vruntime
   1670950 =C2=B1  1%    +312.6%    6894963 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.min_vruntime
   1675674 =C2=B1  1%    +313.9%    6935105 =C2=B1  1%  sched_debug.cfs_rq[=
26]:/.min_vruntime
   1675498 =C2=B1  1%    +313.2%    6922328 =C2=B1  1%  sched_debug.cfs_rq[=
29]:/.min_vruntime
   1671750 =C2=B1  2%    +313.9%    6918915 =C2=B1  1%  sched_debug.cfs_rq[=
28]:/.min_vruntime
   1681305 =C2=B1  2%    +311.1%    6912416 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.min_vruntime
   1671122 =C2=B1  2%    +314.4%    6925435 =C2=B1  1%  sched_debug.cfs_rq[=
30]:/.min_vruntime
     37126 =C2=B1  1%    +305.6%     150578 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.exec_clock
   1676302 =C2=B1  2%    +312.9%    6920808 =C2=B1  1%  sched_debug.cfs_rq[=
27]:/.min_vruntime
     36526 =C2=B1  1%    +311.9%     150450 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.exec_clock
    190213 =C2=B1 29%    +282.4%     727280 =C2=B1  6%  sched_debug.cpu#18.=
avg_idle
   1677834 =C2=B1  2%    +310.1%    6880038 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.min_vruntime
     36707 =C2=B1  3%    +301.8%     147479 =C2=B1  1%  sched_debug.cfs_rq[=
37]:/.exec_clock
   1680208 =C2=B1  2%    +310.5%    6898014 =C2=B1  1%  sched_debug.cfs_rq[=
32]:/.min_vruntime
     36375 =C2=B1  3%    +310.5%     149316 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.exec_clock
     37332 =C2=B1  6%    +303.5%     150640 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.exec_clock
     37105 =C2=B1  2%    +306.0%     150656 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.exec_clock
     36747 =C2=B1  3%    +284.0%     141091 =C2=B1  5%  sched_debug.cfs_rq[=
39]:/.exec_clock
    140546 =C2=B1 14%    +296.0%     556577 =C2=B1 17%  sched_debug.cpu#5.a=
vg_idle
       723 =C2=B1 21%    +362.8%       3346 =C2=B1  2%  sched_debug.cpu#42.=
curr->pid
         5 =C2=B1 37%    +300.0%         23 =C2=B1  9%  sched_debug.cpu#32.=
cpu_load[2]
         5 =C2=B1 49%    +352.4%         23 =C2=B1  3%  sched_debug.cpu#28.=
cpu_load[1]
         5 =C2=B1 45%    +336.4%         24 =C2=B1 12%  sched_debug.cfs_rq[=
34]:/.load
     36691 =C2=B1  4%    +311.2%     150869 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.exec_clock
     37240 =C2=B1  1%    +304.9%     150792 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.exec_clock
     36242 =C2=B1  2%    +305.1%     146809 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.exec_clock
     37225 =C2=B1  4%    +304.1%     150447 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.exec_clock
     37530 =C2=B1  5%    +301.9%     150817 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.exec_clock
     37382 =C2=B1  3%    +303.3%     150763 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.exec_clock
     38883 =C2=B1  5%    +272.1%     144701 =C2=B1  5%  sched_debug.cfs_rq[=
47]:/.exec_clock
       222 =C2=B1  8%    +384.2%       1077 =C2=B1 43%  sched_debug.cpu#33.=
ttwu_local
     37068 =C2=B1  4%    +306.6%     150734 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.exec_clock
   1665943 =C2=B1  2%    +249.9%    5829140 =C2=B1 19%  sched_debug.cfs_rq[=
43]:/.min_vruntime
       789 =C2=B1 31%    +349.7%       3549 =C2=B1  8%  sched_debug.cpu#37.=
curr->pid
       693 =C2=B1 33%    +316.4%       2886 =C2=B1 24%  sched_debug.cpu#43.=
curr->pid
     60242 =C2=B1  2%    +302.6%     242548 =C2=B1  5%  proc-vmstat.pgsteal=
_kswapd_dma32
     36196 =C2=B1  3%    +288.5%     140621 =C2=B1  3%  sched_debug.cfs_rq[=
41]:/.exec_clock
     66025 =C2=B1  1%    +283.4%     253141 =C2=B1  4%  meminfo.Active(anon)
     16551 =C2=B1  1%    +282.6%      63321 =C2=B1  4%  proc-vmstat.nr_acti=
ve_anon
     37897 =C2=B1  1%    +289.8%     147708 =C2=B1  1%  sched_debug.cfs_rq[=
38]:/.exec_clock
     37045 =C2=B1  4%    +279.4%     140545 =C2=B1 10%  sched_debug.cfs_rq[=
46]:/.exec_clock
         4 =C2=B1 45%    +394.4%         22 =C2=B1  8%  sched_debug.cpu#27.=
cpu_load[3]
         4 =C2=B1 50%    +456.2%         22 =C2=B1  8%  sched_debug.cpu#27.=
cpu_load[4]
         5 =C2=B1 45%    +300.0%         22 =C2=B1  7%  sched_debug.cpu#34.=
cpu_load[0]
    174487 =C2=B1 18%    +313.0%     720633 =C2=B1  6%  sched_debug.cpu#20.=
avg_idle
   1659387 =C2=B1  2%    +276.8%    6252203 =C2=B1  3%  sched_debug.cfs_rq[=
35]:/.min_vruntime
     38114 =C2=B1  4%    +281.2%     145306 =C2=B1  3%  sched_debug.cfs_rq[=
40]:/.exec_clock
         4 =C2=B1 33%    +316.7%         18 =C2=B1  2%  sched_debug.cpu#45.=
cpu_load[3]
         5 =C2=B1 48%    +425.0%         26 =C2=B1 47%  sched_debug.cpu#38.=
cpu_load[4]
     36165 =C2=B1  4%    +272.9%     134847 =C2=B1  7%  sched_debug.cfs_rq[=
43]:/.exec_clock
     67261 =C2=B1  6%    +279.8%     255426 =C2=B1  5%  numa-meminfo.node1.=
Shmem
     15.17 =C2=B1  0%    +256.7%      54.11 =C2=B1  8%  perf-profile.cpu-cy=
cles.shrink_zones.do_try_to_free_pages.try_to_free_pages.__alloc_pages_node=
mask.alloc_pages_current
     15.25 =C2=B1  0%    +256.2%      54.32 =C2=B1  8%  perf-profile.cpu-cy=
cles.shrink_page_list.shrink_inactive_list.shrink_lruvec.shrink_zone.shrink=
_zones
     15.35 =C2=B1  0%    +254.2%      54.37 =C2=B1  8%  perf-profile.cpu-cy=
cles.shrink_inactive_list.shrink_lruvec.shrink_zone.shrink_zones.do_try_to_=
free_pages
     15.36 =C2=B1  0%    +254.0%      54.38 =C2=B1  8%  perf-profile.cpu-cy=
cles.shrink_lruvec.shrink_zone.shrink_zones.do_try_to_free_pages.try_to_fre=
e_pages
     14.74 =C2=B1  1%    +254.4%      52.24 =C2=B1  7%  perf-profile.cpu-cy=
cles.do_try_to_free_pages.try_to_free_pages.__alloc_pages_nodemask.alloc_pa=
ges_current.__page_cache_alloc
     15.37 =C2=B1  0%    +253.9%      54.38 =C2=B1  8%  perf-profile.cpu-cy=
cles.shrink_zone.shrink_zones.do_try_to_free_pages.try_to_free_pages.__allo=
c_pages_nodemask
     14.74 =C2=B1  1%    +254.0%      52.19 =C2=B1  7%  perf-profile.cpu-cy=
cles.try_to_free_pages.__alloc_pages_nodemask.alloc_pages_current.__page_ca=
che_alloc.__do_page_cache_readahead
     16716 =C2=B1  6%    +281.4%      63761 =C2=B1  5%  numa-vmstat.node1.n=
r_shmem
       256 =C2=B1 12%    +281.2%        977 =C2=B1 18%  sched_debug.cpu#29.=
ttwu_local
     18541 =C2=B1  1%    +258.3%      66434 =C2=B1  3%  proc-vmstat.nr_shmem
     73987 =C2=B1  0%    +259.2%     265752 =C2=B1  4%  meminfo.Shmem
         5 =C2=B1 37%    +345.0%         22 =C2=B1  7%  sched_debug.cpu#33.=
cpu_load[3]
       281 =C2=B1 22%    +248.2%        978 =C2=B1 14%  sched_debug.cpu#31.=
ttwu_local
    200388 =C2=B1 30%    +269.9%     741252 =C2=B1  6%  sched_debug.cpu#14.=
avg_idle
     98405 =C2=B1 11%     -68.4%      31130 =C2=B1 44%  sched_debug.cpu#37.=
sched_count
         4 =C2=B1 31%    +268.4%         17 =C2=B1  6%  sched_debug.cpu#47.=
cpu_load[3]
    164156 =C2=B1 18%    +289.9%     640109 =C2=B1  6%  sched_debug.cpu#11.=
avg_idle
    237933 =C2=B1 36%    +234.1%     794983 =C2=B1  4%  sched_debug.cpu#12.=
avg_idle
         5 =C2=B1 36%    +290.5%         20 =C2=B1  5%  sched_debug.cfs_rq[=
31]:/.runnable_load_avg
         4 =C2=B1 40%    +336.8%         20 =C2=B1  7%  sched_debug.cpu#31.=
cpu_load[3]
      9.27 =C2=B1  0%    +234.3%      30.99 =C2=B1  6%  perf-profile.cpu-cy=
cles.rmap_walk.try_to_unmap.shrink_page_list.shrink_inactive_list.shrink_lr=
uvec
       828 =C2=B1 39%    +328.4%       3550 =C2=B1  3%  sched_debug.cpu#33.=
curr->pid
      9.33 =C2=B1  0%    +232.6%      31.02 =C2=B1  6%  perf-profile.cpu-cy=
cles.try_to_unmap.shrink_page_list.shrink_inactive_list.shrink_lruvec.shrin=
k_zone
       865 =C2=B1 26%    +286.5%       3344 =C2=B1  3%  sched_debug.cpu#40.=
curr->pid
        13 =C2=B1  3%    +255.6%         48 =C2=B1  0%  vmstat.procs.r
         5 =C2=B1 45%    +347.6%         23 =C2=B1  4%  sched_debug.cpu#28.=
cpu_load[0]
    164431 =C2=B1 27%    +311.8%     677119 =C2=B1  5%  sched_debug.cpu#13.=
avg_idle
    156159 =C2=B1 12%    +268.7%     575780 =C2=B1  7%  sched_debug.cpu#4.a=
vg_idle
     37144 =C2=B1  2%    +234.3%     124184 =C2=B1  2%  sched_debug.cfs_rq[=
25]:/.exec_clock
    188347 =C2=B1 16%    +270.0%     696976 =C2=B1  9%  sched_debug.cpu#23.=
avg_idle
         6 =C2=B1 31%    +345.8%         26 =C2=B1 48%  sched_debug.cpu#38.=
cpu_load[3]
   2091338 =C2=B1  1%    +214.2%    6571428 =C2=B1  5%  sched_debug.cfs_rq[=
23]:/.min_vruntime
   2081331 =C2=B1  2%    +221.6%    6694159 =C2=B1  4%  sched_debug.cfs_rq[=
20]:/.min_vruntime
       964 =C2=B1 36%    +256.6%       3439 =C2=B1  1%  sched_debug.cpu#45.=
curr->pid
   2104190 =C2=B1  1%    +223.7%    6810365 =C2=B1  2%  sched_debug.cfs_rq[=
21]:/.min_vruntime
   2102936 =C2=B1  2%    +183.8%    5967402 =C2=B1 25%  sched_debug.cfs_rq[=
22]:/.min_vruntime
      1587 =C2=B1  7%    +166.7%       4234 =C2=B1 25%  sched_debug.cpu#17.=
ttwu_local
   2119533 =C2=B1  1%    +217.7%    6734748 =C2=B1  1%  sched_debug.cfs_rq[=
18]:/.min_vruntime
   2142059 =C2=B1  3%    +214.5%    6735988 =C2=B1  3%  sched_debug.cfs_rq[=
14]:/.min_vruntime
   2104927 =C2=B1  2%    +219.2%    6719055 =C2=B1  2%  sched_debug.cfs_rq[=
16]:/.min_vruntime
   2157455 =C2=B1  1%    +218.2%    6865520 =C2=B1  1%  sched_debug.cfs_rq[=
9]:/.min_vruntime
     17.78 =C2=B1  0%    +202.2%      53.73 =C2=B1  7%  perf-profile.cpu-cy=
cles.__do_fault.do_read_fault.handle_mm_fault.__do_page_fault.do_page_fault
     17.78 =C2=B1  0%    +202.2%      53.73 =C2=B1  7%  perf-profile.cpu-cy=
cles.filemap_fault.__do_fault.do_read_fault.handle_mm_fault.__do_page_fault
   2171180 =C2=B1  1%    +214.9%    6837517 =C2=B1  1%  sched_debug.cfs_rq[=
6]:/.min_vruntime
   2167333 =C2=B1  0%    +217.0%    6871145 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.min_vruntime
   2151871 =C2=B1  0%    +216.2%    6805044 =C2=B1  1%  sched_debug.cfs_rq[=
8]:/.min_vruntime
     18.31 =C2=B1  0%    +201.3%      55.17 =C2=B1  7%  perf-profile.cpu-cy=
cles.handle_mm_fault.__do_page_fault.do_page_fault.page_fault.do_unit
     18.34 =C2=B1  0%    +200.9%      55.19 =C2=B1  7%  perf-profile.cpu-cy=
cles.__do_page_fault.do_page_fault.page_fault.do_unit
   2120576 =C2=B1  2%    +172.0%    5767593 =C2=B1 18%  sched_debug.cfs_rq[=
15]:/.min_vruntime
     18.34 =C2=B1  0%    +200.9%      55.20 =C2=B1  7%  perf-profile.cpu-cy=
cles.do_page_fault.page_fault.do_unit
   2168304 =C2=B1  0%    +216.3%    6858145 =C2=B1  1%  sched_debug.cfs_rq[=
3]:/.min_vruntime
     18.37 =C2=B1  0%    +200.6%      55.20 =C2=B1  7%  perf-profile.cpu-cy=
cles.page_fault.do_unit
   2163595 =C2=B1  2%    +211.7%    6744152 =C2=B1  3%  sched_debug.cfs_rq[=
13]:/.min_vruntime
   2188471 =C2=B1  1%    +213.8%    6867858 =C2=B1  1%  sched_debug.cfs_rq[=
2]:/.min_vruntime
     17.96 =C2=B1  0%    +199.8%      53.84 =C2=B1  7%  perf-profile.cpu-cy=
cles.do_read_fault.isra.58.handle_mm_fault.__do_page_fault.do_page_fault.pa=
ge_fault
     86248 =C2=B1  3%    +211.5%     268661 =C2=B1  5%  numa-meminfo.node1.=
Active
   2177359 =C2=B1  1%    +213.7%    6829757 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.min_vruntime
   2178979 =C2=B1  0%    +213.4%    6829270 =C2=B1  1%  sched_debug.cfs_rq[=
5]:/.min_vruntime
      1533 =C2=B1  8%    +179.4%       4286 =C2=B1 36%  sched_debug.cpu#19.=
ttwu_local
   2100626 =C2=B1  1%    +193.6%    6167391 =C2=B1 10%  sched_debug.cfs_rq[=
17]:/.min_vruntime
   2171243 =C2=B1  1%    +215.0%    6839755 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.min_vruntime
   2228081 =C2=B1  2%    +199.0%    6662896 =C2=B1  4%  sched_debug.cfs_rq[=
12]:/.min_vruntime
        17 =C2=B1 19%    +148.6%         43 =C2=B1 34%  sched_debug.cpu#16.=
cpu_load[3]
     14120 =C2=B1  2%    +207.3%      43389 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
     14123 =C2=B1  2%    +207.2%      43391 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg->runnable_avg
     14125 =C2=B1  2%    +207.2%      43394 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg->runnable_avg
     14127 =C2=B1  2%    +207.2%      43395 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg->runnable_avg
     14130 =C2=B1  2%    +207.1%      43397 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg->runnable_avg
       318 =C2=B1 28%    +217.3%       1010 =C2=B1 18%  sched_debug.cpu#30.=
ttwu_local
   2254798 =C2=B1  1%    +203.6%    6845073 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     14114 =C2=B1  2%    +207.3%      43374 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
     14125 =C2=B1  2%    +207.1%      43376 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
     14131 =C2=B1  2%    +207.0%      43378 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
       915 =C2=B1 22%    +245.3%       3160 =C2=B1  9%  sched_debug.cpu#41.=
curr->pid
     14147 =C2=B1  2%    +206.6%      43380 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
     14151 =C2=B1  2%    +206.6%      43385 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
     14155 =C2=B1  2%    +206.5%      43384 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
     14158 =C2=B1  2%    +206.5%      43388 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
         6 =C2=B1 38%    +159.3%         17 =C2=B1  6%  sched_debug.cpu#47.=
cpu_load[1]
         6 =C2=B1 20%    +345.8%         26 =C2=B1 48%  sched_debug.cpu#38.=
cpu_load[2]
         6 =C2=B1 31%    +191.7%         17 =C2=B1  6%  sched_debug.cpu#47.=
cpu_load[2]
         6 =C2=B1 45%    +283.3%         23 =C2=B1  9%  sched_debug.cpu#32.=
cpu_load[1]
         6 =C2=B1 45%    +230.8%         21 =C2=B1 12%  sched_debug.cpu#31.=
cpu_load[1]
         5 =C2=B1 48%    +281.8%         21 =C2=B1  8%  sched_debug.cpu#31.=
cpu_load[2]
     14209 =C2=B1  2%    +205.7%      43436 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg->runnable_avg
     14220 =C2=B1  2%    +205.5%      43443 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.tg->runnable_avg
     14194 =C2=B1  2%    +205.7%      43399 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg->runnable_avg
     14220 =C2=B1  2%    +205.5%      43440 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg->runnable_avg
     14200 =C2=B1  2%    +205.6%      43403 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg->runnable_avg
     14223 =C2=B1  2%    +205.4%      43445 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.tg->runnable_avg
     14241 =C2=B1  2%    +205.0%      43429 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.tg->runnable_avg
     14228 =C2=B1  2%    +205.2%      43431 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.tg->runnable_avg
     14231 =C2=B1  2%    +205.2%      43433 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.tg->runnable_avg
     14275 =C2=B1  3%    +204.3%      43437 =C2=B1  0%  sched_debug.cfs_rq[=
22]:/.tg->runnable_avg
     14280 =C2=B1  3%    +204.2%      43439 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.tg->runnable_avg
     14235 =C2=B1  2%    +205.1%      43433 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.tg->runnable_avg
     14308 =C2=B1  3%    +203.8%      43470 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.tg->runnable_avg
     14231 =C2=B1  3%    +205.4%      43467 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.tg->runnable_avg
     14310 =C2=B1  3%    +203.8%      43478 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.tg->runnable_avg
     14313 =C2=B1  3%    +203.8%      43487 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.tg->runnable_avg
     14310 =C2=B1  3%    +203.8%      43473 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.tg->runnable_avg
     14223 =C2=B1  3%    +205.5%      43457 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.tg->runnable_avg
    164683 =C2=B1 34%    +267.0%     604322 =C2=B1  9%  sched_debug.cpu#6.a=
vg_idle
     14230 =C2=B1  3%    +205.4%      43461 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.tg->runnable_avg
     14223 =C2=B1  3%    +205.5%      43459 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.tg->runnable_avg
     14228 =C2=B1  3%    +205.5%      43462 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.tg->runnable_avg
     14228 =C2=B1  3%    +205.5%      43461 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.tg->runnable_avg
     14485 =C2=B1  1%    +200.2%      43488 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.tg->runnable_avg
     14491 =C2=B1  1%    +200.1%      43491 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.tg->runnable_avg
     14494 =C2=B1  1%    +200.1%      43496 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.tg->runnable_avg
     14492 =C2=B1  1%    +200.2%      43510 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.tg->runnable_avg
     14489 =C2=B1  1%    +200.3%      43508 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.tg->runnable_avg
     14498 =C2=B1  1%    +200.0%      43499 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.tg->runnable_avg
     14490 =C2=B1  1%    +200.2%      43508 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.tg->runnable_avg
     14487 =C2=B1  1%    +200.3%      43503 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.tg->runnable_avg
     14499 =C2=B1  1%    +200.0%      43501 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.tg->runnable_avg
     14501 =C2=B1  1%    +200.0%      43503 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.tg->runnable_avg
     14496 =C2=B1  1%    +200.2%      43514 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.tg->runnable_avg
     14497 =C2=B1  1%    +200.2%      43516 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.tg->runnable_avg
     14501 =C2=B1  1%    +200.2%      43532 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.tg->runnable_avg
     14503 =C2=B1  1%    +200.2%      43533 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.tg->runnable_avg
   2358220 =C2=B1  0%    +195.6%    6971659 =C2=B1  0%  softirqs.TIMER
   2118082 =C2=B1  1%    +162.2%    5553970 =C2=B1 17%  sched_debug.cfs_rq[=
19]:/.min_vruntime
   1551541 =C2=B1  1%    +203.3%    4706141 =C2=B1  7%  proc-vmstat.pgsteal=
_kswapd_normal
     10941 =C2=B1  3%    +200.2%      32847 =C2=B1 10%  proc-vmstat.pgmajfa=
ult
   2186689 =C2=B1  1%    +187.1%    6277475 =C2=B1  2%  sched_debug.cfs_rq[=
11]:/.min_vruntime
       483 =C2=B1 20%    +266.3%       1770 =C2=B1 34%  sched_debug.cpu#46.=
ttwu_local
       895 =C2=B1 42%    +281.4%       3415 =C2=B1  4%  sched_debug.cpu#44.=
curr->pid
        99 =C2=B1 25%    +195.0%        293 =C2=B1 40%  sched_debug.cfs_rq[=
19]:/.tg_load_contrib
       334 =C2=B1 19%    +183.5%        947 =C2=B1 36%  sched_debug.cpu#28.=
ttwu_local
    200188 =C2=B1 36%    +258.5%     717771 =C2=B1  8%  sched_debug.cpu#15.=
avg_idle
         6 =C2=B1 40%    +354.2%         27 =C2=B1 48%  sched_debug.cpu#38.=
cpu_load[0]
         6 =C2=B1 42%    +264.0%         22 =C2=B1 10%  sched_debug.cpu#33.=
cpu_load[2]
      2253 =C2=B1 48%     +89.6%       4272 =C2=B1 25%  sched_debug.cpu#21.=
ttwu_local
    183368 =C2=B1 22%    +179.6%     512782 =C2=B1 11%  sched_debug.cpu#9.a=
vg_idle
         6 =C2=B1 41%    +204.0%         19 =C2=B1  3%  sched_debug.cpu#45.=
cpu_load[2]
    161758 =C2=B1 25%    +224.3%     524588 =C2=B1  6%  sched_debug.cpu#7.a=
vg_idle
         6 =C2=B1 45%    +345.8%         26 =C2=B1 48%  sched_debug.cpu#38.=
cpu_load[1]
         6 =C2=B1 19%    +207.4%         20 =C2=B1  5%  sched_debug.cpu#26.=
load
         6 =C2=B1 19%    +207.4%         20 =C2=B1  5%  sched_debug.cfs_rq[=
26]:/.load
         6 =C2=B1 41%    +211.5%         20 =C2=B1  6%  sched_debug.cfs_rq[=
31]:/.load
         6 =C2=B1 41%    +211.5%         20 =C2=B1  6%  sched_debug.cpu#31.=
load
         8 =C2=B1 38%    +181.2%         22 =C2=B1 19%  sched_debug.cpu#31.=
cpu_load[0]
      1261 =C2=B1 15%    +151.4%       3171 =C2=B1 48%  sched_debug.cpu#8.t=
twu_local
         6 =C2=B1 47%    +264.0%         22 =C2=B1  7%  sched_debug.cpu#32.=
cpu_load[0]
         6 =C2=B1 47%    +264.0%         22 =C2=B1  6%  sched_debug.cfs_rq[=
32]:/.load
         6 =C2=B1 47%    +264.0%         22 =C2=B1  6%  sched_debug.cpu#32.=
load
         6 =C2=B1 47%    +264.0%         22 =C2=B1  7%  sched_debug.cfs_rq[=
32]:/.runnable_load_avg
    788292 =C2=B1  2%     -59.3%     321110 =C2=B1 23%  sched_debug.cpu#45.=
avg_idle
       318 =C2=B1 40%    +168.9%        857 =C2=B1 19%  sched_debug.cpu#25.=
ttwu_local
      1890 =C2=B1 18%    +140.5%       4547 =C2=B1 17%  sched_debug.cpu#16.=
ttwu_local
    252557 =C2=B1 15%    +129.2%     578898 =C2=B1  4%  sched_debug.cpu#0.a=
vg_idle
     10.10 =C2=B1  3%    +139.5%      24.18 =C2=B1 13%  perf-profile.cpu-cy=
cles.__alloc_pages_nodemask.alloc_pages_current.__page_cache_alloc.__do_pag=
e_cache_readahead.ondemand_readahead
     10.12 =C2=B1  3%    +139.0%      24.20 =C2=B1 13%  perf-profile.cpu-cy=
cles.alloc_pages_current.__page_cache_alloc.__do_page_cache_readahead.ondem=
and_readahead.page_cache_async_readahead
     10.13 =C2=B1  3%    +138.8%      24.20 =C2=B1 13%  perf-profile.cpu-cy=
cles.__page_cache_alloc.__do_page_cache_readahead.ondemand_readahead.page_c=
ache_async_readahead.filemap_fault
      1.74 =C2=B1  0%     -58.1%       0.73 =C2=B1 12%  perf-profile.cpu-cy=
cles.do_mpage_readpage.mpage_readpages.xfs_vm_readpages.__do_page_cache_rea=
dahead.ondemand_readahead
         7 =C2=B1 48%    +210.0%         23 =C2=B1 17%  sched_debug.cpu#33.=
cpu_load[1]
         8 =C2=B1 49%    +175.0%         22 =C2=B1 22%  sched_debug.cfs_rq[=
37]:/.runnable_load_avg
    217222 =C2=B1 18%    +163.9%     573282 =C2=B1  8%  sched_debug.cpu#2.a=
vg_idle
       620 =C2=B1 33%    +148.3%       1541 =C2=B1 17%  sched_debug.cpu#25.=
curr->pid
        40 =C2=B1 11%     -54.7%         18 =C2=B1  5%  sched_debug.cfs_rq[=
12]:/.load
       365 =C2=B1 25%    +169.9%        986 =C2=B1 14%  sched_debug.cpu#45.=
ttwu_local
         6 =C2=B1 45%    +258.3%         21 =C2=B1 25%  sched_debug.cpu#37.=
cpu_load[4]
        44 =C2=B1 16%     -52.3%         21 =C2=B1  3%  sched_debug.cfs_rq[=
0]:/.load
         8 =C2=B1 40%    +168.8%         21 =C2=B1 21%  sched_debug.cpu#37.=
cpu_load[2]
      2265 =C2=B1 38%    +114.1%       4849 =C2=B1 19%  sched_debug.cpu#13.=
ttwu_local
        75 =C2=B1 30%    +125.8%        170 =C2=B1 35%  sched_debug.cfs_rq[=
17]:/.tg_load_contrib
      1502 =C2=B1 12%    +138.6%       3583 =C2=B1  7%  sched_debug.cpu#21.=
curr->pid
    148390 =C2=B1  1%    +166.2%     394977 =C2=B1 26%  meminfo.Active
       400 =C2=B1 14%    +118.5%        874 =C2=B1  1%  sched_debug.cfs_rq[=
17]:/.tg_runnable_contrib
     18355 =C2=B1 14%    +118.5%      40115 =C2=B1  1%  sched_debug.cfs_rq[=
17]:/.avg->runnable_avg_sum
         8 =C2=B1 49%    +151.4%         22 =C2=B1 20%  sched_debug.cpu#37.=
cpu_load[1]
         8 =C2=B1 49%    +154.3%         22 =C2=B1 22%  sched_debug.cpu#37.=
cpu_load[0]
      2190 =C2=B1 25%    +129.2%       5019 =C2=B1 19%  sched_debug.cpu#12.=
ttwu_local
     17021 =C2=B1  4%    +137.9%      40492 =C2=B1  2%  sched_debug.cfs_rq[=
23]:/.avg->runnable_avg_sum
       372 =C2=B1  4%    +137.4%        883 =C2=B1  2%  sched_debug.cfs_rq[=
23]:/.tg_runnable_contrib
      1854 =C2=B1 17%    +121.7%       4110 =C2=B1  9%  sched_debug.cpu#23.=
ttwu_local
      1647 =C2=B1 14%     +95.9%       3227 =C2=B1 21%  sched_debug.cpu#22.=
curr->pid
        40 =C2=B1  8%     -53.4%         19 =C2=B1  3%  sched_debug.cpu#12.=
load
     18508 =C2=B1 19%    +107.9%      38480 =C2=B1  8%  sched_debug.cfs_rq[=
22]:/.avg->runnable_avg_sum
       403 =C2=B1 19%    +108.3%        839 =C2=B1  8%  sched_debug.cfs_rq[=
22]:/.tg_runnable_contrib
     68362 =C2=B1  3%    +122.8%     152343 =C2=B1  0%  sched_debug.cpu#36.=
nr_load_updates
    837729 =C2=B1  5%     -58.3%     349382 =C2=B1 12%  sched_debug.cpu#36.=
avg_idle
     68719 =C2=B1  2%    +124.4%     154206 =C2=B1  0%  sched_debug.cpu#28.=
nr_load_updates
     68621 =C2=B1  2%    +120.3%     151189 =C2=B1  1%  sched_debug.cpu#37.=
nr_load_updates
     68547 =C2=B1  2%    +124.8%     154067 =C2=B1  0%  sched_debug.cpu#35.=
nr_load_updates
         7 =C2=B1 39%    +203.6%         21 =C2=B1 21%  sched_debug.cpu#37.=
cpu_load[3]
         7 =C2=B1 44%    +151.6%         19 =C2=B1  2%  sched_debug.cfs_rq[=
45]:/.runnable_load_avg
         8 =C2=B1 48%    +160.6%         21 =C2=B1 23%  sched_debug.cfs_rq[=
37]:/.load
      1693 =C2=B1 14%    +103.8%       3451 =C2=B1  3%  sched_debug.cpu#23.=
curr->pid
     68759 =C2=B1  2%    +121.3%     152166 =C2=B1  0%  sched_debug.cpu#45.=
nr_load_updates
    761149 =C2=B1  6%     -56.1%     333944 =C2=B1 23%  sched_debug.cpu#37.=
avg_idle
     69825 =C2=B1  3%    +110.9%     147248 =C2=B1  3%  sched_debug.cpu#47.=
nr_load_updates
     69531 =C2=B1  2%    +111.1%     146783 =C2=B1  3%  sched_debug.cpu#39.=
nr_load_updates
     70889 =C2=B1  2%    +117.5%     154171 =C2=B1  0%  sched_debug.cpu#32.=
nr_load_updates
     69385 =C2=B1  2%    +109.8%     145552 =C2=B1  7%  sched_debug.cpu#46.=
nr_load_updates
     68910 =C2=B1  1%    +118.6%     150646 =C2=B1  0%  sched_debug.cpu#42.=
nr_load_updates
     69228 =C2=B1  1%    +117.9%     150880 =C2=B1  1%  sched_debug.cpu#44.=
nr_load_updates
     69905 =C2=B1  2%    +120.5%     154159 =C2=B1  0%  sched_debug.cpu#31.=
nr_load_updates
     69919 =C2=B1  3%    +120.3%     154058 =C2=B1  0%  sched_debug.cpu#34.=
nr_load_updates
     69867 =C2=B1  2%    +120.0%     153690 =C2=B1  0%  sched_debug.cpu#33.=
nr_load_updates
       406 =C2=B1  3%    +117.5%        883 =C2=B1  4%  sched_debug.cfs_rq[=
20]:/.tg_runnable_contrib
     70681 =C2=B1  1%    +118.5%     154417 =C2=B1  0%  sched_debug.cpu#26.=
nr_load_updates
     70118 =C2=B1  2%    +119.8%     154112 =C2=B1  0%  sched_debug.cpu#24.=
nr_load_updates
     18638 =C2=B1  3%    +117.6%      40561 =C2=B1  4%  sched_debug.cfs_rq[=
20]:/.avg->runnable_avg_sum
     70009 =C2=B1  2%    +120.4%     154304 =C2=B1  0%  sched_debug.cpu#30.=
nr_load_updates
     70727 =C2=B1  3%    +117.8%     154075 =C2=B1  0%  sched_debug.cpu#27.=
nr_load_updates
     70583 =C2=B1  1%    +118.4%     154123 =C2=B1  0%  sched_debug.cpu#29.=
nr_load_updates
     71045 =C2=B1  1%    +113.0%     151331 =C2=B1  0%  sched_debug.cpu#38.=
nr_load_updates
      1658 =C2=B1  5%     +85.3%       3073 =C2=B1 14%  sched_debug.cpu#15.=
curr->pid
     20638 =C2=B1  9%    +111.4%      43619 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.avg->runnable_avg_sum
         7 =C2=B1 44%    +156.7%         19 =C2=B1  5%  sched_debug.cpu#45.=
cpu_load[1]
         7 =C2=B1 44%    +145.2%         19 =C2=B1  3%  sched_debug.cpu#45.=
cpu_load[0]
       450 =C2=B1  9%    +110.8%        950 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg_runnable_contrib
     70631 =C2=B1  2%    +112.2%     149899 =C2=B1  2%  sched_debug.cpu#40.=
nr_load_updates
     69640 =C2=B1  2%    +109.3%     145741 =C2=B1  3%  sched_debug.cpu#41.=
nr_load_updates
      1.79 =C2=B1  0%    +123.6%       4.00 =C2=B1 13%  perf-profile.cpu-cy=
cles.physflat_send_IPI_mask.native_send_call_func_ipi.smp_call_function_man=
y.native_flush_tlb_others.flush_tlb_page
        44 =C2=B1 12%     -52.0%         21 =C2=B1  5%  sched_debug.cpu#0.l=
oad
     18721 =C2=B1  7%     +99.1%      37280 =C2=B1  9%  sched_debug.cfs_rq[=
15]:/.avg->runnable_avg_sum
      1545 =C2=B1 10%    +117.9%       3367 =C2=B1  3%  sched_debug.cpu#20.=
curr->pid
     12.70 =C2=B1  2%    +100.7%      25.50 =C2=B1 12%  perf-profile.cpu-cy=
cles.ondemand_readahead.page_cache_async_readahead.filemap_fault.__do_fault=
.do_read_fault
     12.70 =C2=B1  2%    +100.7%      25.50 =C2=B1 12%  perf-profile.cpu-cy=
cles.__do_page_cache_readahead.ondemand_readahead.page_cache_async_readahea=
d.filemap_fault.__do_fault
     12.71 =C2=B1  2%    +100.6%      25.50 =C2=B1 12%  perf-profile.cpu-cy=
cles.page_cache_async_readahead.filemap_fault.__do_fault.do_read_fault.hand=
le_mm_fault
       408 =C2=B1  7%     +98.7%        812 =C2=B1  9%  sched_debug.cfs_rq[=
15]:/.tg_runnable_contrib
   1676888 =C2=B1  1%    +110.2%    3524754 =C2=B1  8%  sched_debug.cfs_rq[=
25]:/.min_vruntime
     69275 =C2=B1  1%    +104.2%     141459 =C2=B1  5%  sched_debug.cpu#43.=
nr_load_updates
      2212 =C2=B1 32%     +84.7%       4087 =C2=B1 26%  sched_debug.cpu#18.=
ttwu_local
     18484 =C2=B1 14%    +115.8%      39898 =C2=B1  3%  sched_debug.cfs_rq[=
16]:/.avg->runnable_avg_sum
       404 =C2=B1 14%    +115.0%        868 =C2=B1  3%  sched_debug.cfs_rq[=
16]:/.tg_runnable_contrib
    779856 =C2=B1  5%     -47.0%     413230 =C2=B1 16%  sched_debug.cpu#42.=
avg_idle
    732398 =C2=B1  8%     -53.1%     343652 =C2=B1  9%  sched_debug.cpu#38.=
avg_idle
      2367 =C2=B1 34%     +56.9%       3714 =C2=B1 22%  sched_debug.cpu#22.=
ttwu_local
      1.91 =C2=B1  0%    +113.8%       4.08 =C2=B1 12%  perf-profile.cpu-cy=
cles.native_send_call_func_ipi.smp_call_function_many.native_flush_tlb_othe=
rs.flush_tlb_page.ptep_clear_flush
       464 =C2=B1 11%    +105.1%        952 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg_runnable_contrib
     21302 =C2=B1 11%    +105.2%      43704 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->runnable_avg_sum
      1764 =C2=B1  5%     +95.7%       3453 =C2=B1  1%  sched_debug.cpu#3.c=
urr->pid
    745315 =C2=B1  4%     -54.6%     338521 =C2=B1 23%  sched_debug.cpu#47.=
avg_idle
      3307 =C2=B1 44%     +82.2%       6027 =C2=B1 28%  sched_debug.cpu#15.=
ttwu_local
       474 =C2=B1  3%     +99.3%        945 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg_runnable_contrib
     21516 =C2=B1  9%    +102.2%      43513 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.avg->runnable_avg_sum
     21759 =C2=B1  3%     +99.2%      43352 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.avg->runnable_avg_sum
       468 =C2=B1  9%    +102.1%        947 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg_runnable_contrib
      3.82 =C2=B1  0%     -46.4%       2.04 =C2=B1 16%  perf-profile.cpu-cy=
cles.generic_smp_call_function_single_interrupt.smp_call_function_interrupt=
.call_function_interrupt.do_unit
       412 =C2=B1  6%     +93.7%        798 =C2=B1 12%  sched_debug.cfs_rq[=
19]:/.tg_runnable_contrib
     18883 =C2=B1  6%     +94.0%      36628 =C2=B1 11%  sched_debug.cfs_rq[=
19]:/.avg->runnable_avg_sum
      2041 =C2=B1 13%    +100.6%       4094 =C2=B1 21%  sched_debug.cpu#20.=
ttwu_local
     21938 =C2=B1  4%     +98.8%      43612 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.avg->runnable_avg_sum
       478 =C2=B1  4%     +98.7%        950 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg_runnable_contrib
       438 =C2=B1  9%    +100.1%        878 =C2=B1  1%  sched_debug.cfs_rq[=
21]:/.tg_runnable_contrib
     20117 =C2=B1  8%    +100.3%      40292 =C2=B1  1%  sched_debug.cfs_rq[=
21]:/.avg->runnable_avg_sum
      1760 =C2=B1  6%     +95.8%       3446 =C2=B1  1%  sched_debug.cpu#6.c=
urr->pid
     20035 =C2=B1 17%    +117.8%      43642 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum
     75092 =C2=B1  3%     +88.8%     141756 =C2=B1  2%  sched_debug.cfs_rq[=
16]:/.exec_clock
      2.46 =C2=B1  0%     -49.3%       1.25 =C2=B1  9%  perf-profile.cpu-cy=
cles.mpage_readpages.xfs_vm_readpages.__do_page_cache_readahead.ondemand_re=
adahead.page_cache_async_readahead
     74589 =C2=B1  1%     +90.9%     142362 =C2=B1  1%  sched_debug.cfs_rq[=
23]:/.exec_clock
      1922 =C2=B1 12%     +89.3%       3638 =C2=B1  3%  sched_debug.cpu#8.c=
urr->pid
       436 =C2=B1 17%    +117.6%        950 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg_runnable_contrib
     73560 =C2=B1  3%     +90.5%     140133 =C2=B1  2%  sched_debug.cfs_rq[=
20]:/.exec_clock
       446 =C2=B1  8%     +96.4%        875 =C2=B1  3%  sched_debug.cfs_rq[=
18]:/.tg_runnable_contrib
      1737 =C2=B1 13%    +100.0%       3473 =C2=B1  0%  sched_debug.cpu#4.c=
urr->pid
     22692 =C2=B1  3%     +92.1%      43592 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.avg->runnable_avg_sum
     20408 =C2=B1  8%     +96.8%      40160 =C2=B1  3%  sched_debug.cfs_rq[=
18]:/.avg->runnable_avg_sum
      2.47 =C2=B1  0%     -49.2%       1.25 =C2=B1  8%  perf-profile.cpu-cy=
cles.xfs_vm_readpages.__do_page_cache_readahead.ondemand_readahead.page_cac=
he_async_readahead.filemap_fault
      1.77 =C2=B1  0%    +103.7%       3.62 =C2=B1 12%  perf-profile.cpu-cy=
cles.default_send_IPI_mask_sequence_phys.physflat_send_IPI_mask.native_send=
_call_func_ipi.smp_call_function_many.native_flush_tlb_others
       496 =C2=B1  3%     +91.5%        950 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg_runnable_contrib
      1857 =C2=B1 14%     +84.7%       3431 =C2=B1  7%  sched_debug.cpu#14.=
curr->pid
     69586 =C2=B1  1%     +90.6%     132645 =C2=B1  2%  sched_debug.cpu#25.=
nr_load_updates
      1795 =C2=B1 10%     +93.8%       3480 =C2=B1  6%  sched_debug.cpu#16.=
curr->pid
      1676 =C2=B1 10%     +70.4%       2856 =C2=B1 25%  sched_debug.cpu#19.=
curr->pid
     79742 =C2=B1  2%     +88.0%     149936 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.exec_clock
     80832 =C2=B1  1%     +86.1%     150448 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.exec_clock
      3.27 =C2=B1  0%     -44.1%       1.83 =C2=B1 16%  perf-profile.cpu-cy=
cles.flush_smp_call_function_queue.generic_smp_call_function_single_interru=
pt.smp_call_function_interrupt.call_function_interrupt.do_unit
     76161 =C2=B1  2%     +86.3%     141887 =C2=B1  2%  sched_debug.cfs_rq[=
21]:/.exec_clock
      4.24 =C2=B1  0%     -43.9%       2.38 =C2=B1 16%  perf-profile.cpu-cy=
cles.smp_call_function_interrupt.call_function_interrupt.do_unit
     78456 =C2=B1  3%     +80.5%     141631 =C2=B1  1%  sched_debug.cfs_rq[=
14]:/.exec_clock
     76808 =C2=B1  1%     +83.1%     140617 =C2=B1  1%  sched_debug.cfs_rq[=
18]:/.exec_clock
     79415 =C2=B1  2%     +89.1%     150169 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.exec_clock
     75965 =C2=B1  4%     +75.1%     132983 =C2=B1 10%  sched_debug.cfs_rq[=
22]:/.exec_clock
     81273 =C2=B1  1%     +85.4%     150714 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.exec_clock
     80964 =C2=B1  2%     +85.6%     150255 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.exec_clock
     74779 =C2=B1  1%     +81.3%     135601 =C2=B1  4%  sched_debug.cfs_rq[=
17]:/.exec_clock
     14155 =C2=B1 10%     +81.2%      25650 =C2=B1  4%  proc-vmstat.numa_hi=
nt_faults_local
        31 =C2=B1 10%     -43.7%         17 =C2=B1  4%  sched_debug.cpu#12.=
cpu_load[2]
        31 =C2=B1 11%     -45.2%         17 =C2=B1  4%  sched_debug.cpu#12.=
cpu_load[3]
     81823 =C2=B1  0%     +83.9%     150451 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.exec_clock
     80901 =C2=B1  1%     +86.1%     150580 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.exec_clock
     24085 =C2=B1  4%     +81.0%      43593 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
     82971 =C2=B1  2%     +82.0%     150991 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.exec_clock
        45 =C2=B1 40%     -51.7%         21 =C2=B1  3%  sched_debug.cfs_rq[=
6]:/.load
     82487 =C2=B1  3%     +82.4%     150434 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.exec_clock
     82063 =C2=B1  1%     +83.3%     150460 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.exec_clock
       526 =C2=B1  4%     +80.3%        948 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
     23134 =C2=B1  6%     +88.6%      43640 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.avg->runnable_avg_sum
      1723 =C2=B1 19%    +102.6%       3491 =C2=B1  1%  sched_debug.cpu#9.c=
urr->pid
       505 =C2=B1  6%     +88.2%        951 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg_runnable_contrib
        31 =C2=B1 14%     -45.7%         17 =C2=B1  4%  sched_debug.cpu#12.=
cpu_load[4]
        41 =C2=B1 27%     -45.5%         22 =C2=B1  8%  sched_debug.cpu#5.l=
oad
     78675 =C2=B1  1%     +62.2%     127602 =C2=B1 11%  sched_debug.cfs_rq[=
15]:/.exec_clock
      1893 =C2=B1 14%     +83.2%       3469 =C2=B1  2%  sched_debug.cpu#5.c=
urr->pid
    781765 =C2=B1  4%     -50.5%     387205 =C2=B1 25%  sched_debug.cpu#44.=
avg_idle
     24615 =C2=B1  5%     +77.2%      43616 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.avg->runnable_avg_sum
      1680 =C2=B1 16%     +91.0%       3209 =C2=B1  7%  sched_debug.cpu#17.=
curr->pid
       535 =C2=B1  5%     +77.2%        949 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg_runnable_contrib
      2058 =C2=B1  6%     +81.2%       3728 =C2=B1 12%  sched_debug.cpu#13.=
curr->pid
    778833 =C2=B1 10%     -44.6%     431847 =C2=B1 12%  sched_debug.cpu#46.=
avg_idle
     16875 =C2=B1 14%     +62.8%      27480 =C2=B1  4%  proc-vmstat.numa_hi=
nt_faults
    754350 =C2=B1  6%     -36.0%     482553 =C2=B1 11%  sched_debug.cpu#31.=
avg_idle
        30 =C2=B1  9%     -40.7%         18 =C2=B1  4%  sched_debug.cpu#12.=
cpu_load[1]
    755856 =C2=B1  5%     -48.3%     390625 =C2=B1 28%  sched_debug.cpu#39.=
avg_idle
     81073 =C2=B1  3%     +73.4%     140569 =C2=B1  1%  sched_debug.cfs_rq[=
13]:/.exec_clock
     77245 =C2=B1  2%     +66.8%     128866 =C2=B1  8%  sched_debug.cfs_rq[=
19]:/.exec_clock
    751381 =C2=B1  7%     -42.3%     433890 =C2=B1 14%  sched_debug.cpu#40.=
avg_idle
   2993815 =C2=B1  3%    +103.2%    6083494 =C2=B1 36%  numa-vmstat.node0.n=
uma_foreign
   2994243 =C2=B1  3%    +103.2%    6083807 =C2=B1 36%  numa-vmstat.node1.n=
uma_miss
        28 =C2=B1  9%     -36.5%         18 =C2=B1  5%  sched_debug.cfs_rq[=
12]:/.runnable_load_avg
   3009812 =C2=B1  3%    +102.6%    6097503 =C2=B1 36%  numa-vmstat.node1.n=
uma_other
      1959 =C2=B1 15%     +78.1%       3490 =C2=B1  4%  sched_debug.cpu#7.c=
urr->pid
     20347 =C2=B1 16%     +71.9%      34978 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
       443 =C2=B1 16%     +72.2%        762 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
       485 =C2=B1  5%     +72.8%        838 =C2=B1  4%  sched_debug.cfs_rq[=
13]:/.tg_runnable_contrib
      1988 =C2=B1 11%     +75.2%       3484 =C2=B1  0%  sched_debug.cpu#2.c=
urr->pid
     22268 =C2=B1  5%     +72.7%      38457 =C2=B1  4%  sched_debug.cfs_rq[=
13]:/.avg->runnable_avg_sum
      2031 =C2=B1  8%     +76.3%       3579 =C2=B1  1%  sched_debug.cpu#18.=
curr->pid
        30 =C2=B1  8%     -38.0%         18 =C2=B1  4%  sched_debug.cpu#12.=
cpu_load[0]
        42 =C2=B1 32%     -48.2%         21 =C2=B1  3%  sched_debug.cpu#6.l=
oad
        37 =C2=B1 19%     -40.5%         22 =C2=B1  3%  sched_debug.cfs_rq[=
2]:/.load
      6.74 =C2=B1  0%     -37.3%       4.22 =C2=B1 16%  perf-profile.cpu-cy=
cles.call_function_interrupt.do_unit.runtime_exceeded
   6669287 =C2=B1  3%     +79.8%   11990538 =C2=B1 20%  numa-numastat.node0=
.numa_foreign
   6669289 =C2=B1  3%     +79.8%   11990544 =C2=B1 20%  numa-numastat.node1=
.numa_miss
   6669577 =C2=B1  3%     +79.7%   11987745 =C2=B1 20%  numa-numastat.node1=
.other_node
     93969 =C2=B1  1%     +66.4%     156357 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.exec_clock
     25064 =C2=B1  6%     +74.1%      43635 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
       547 =C2=B1  6%     +73.8%        950 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
        32 =C2=B1 14%     -31.8%         22 =C2=B1  3%  sched_debug.cpu#2.c=
pu_load[4]
      2007 =C2=B1 11%     +78.1%       3575 =C2=B1  5%  sched_debug.cpu#12.=
curr->pid
     87646 =C2=B1  3%     +57.4%     137997 =C2=B1  4%  sched_debug.cfs_rq[=
12]:/.exec_clock
        31 =C2=B1  9%     -30.7%         22 =C2=B1 13%  sched_debug.cpu#0.c=
pu_load[1]
        34 =C2=B1 19%     -38.7%         21 =C2=B1  3%  sched_debug.cpu#0.c=
pu_load[3]
        33 =C2=B1 13%     -34.8%         21 =C2=B1  6%  sched_debug.cpu#0.c=
pu_load[2]
     21815 =C2=B1 16%     +83.5%      40027 =C2=B1  5%  sched_debug.cfs_rq[=
14]:/.avg->runnable_avg_sum
      2106 =C2=B1 22%     +65.4%       3484 =C2=B1  0%  sched_debug.cpu#11.=
curr->pid
     15847 =C2=B1  5%     +64.6%      26082 =C2=B1  2%  proc-vmstat.numa_pt=
e_updates
       476 =C2=B1 16%     +83.0%        871 =C2=B1  4%  sched_debug.cfs_rq[=
14]:/.tg_runnable_contrib
        31 =C2=B1 13%     -29.8%         21 =C2=B1  5%  sched_debug.cpu#2.c=
pu_load[2]
        31 =C2=B1 13%     -30.2%         22 =C2=B1  3%  sched_debug.cpu#2.c=
pu_load[3]
    799827 =C2=B1  7%     -38.0%     496159 =C2=B1  6%  sched_debug.cpu#41.=
avg_idle
     25015 =C2=B1  9%     +55.2%      38832 =C2=B1  4%  sched_debug.cfs_rq[=
12]:/.avg->runnable_avg_sum
       545 =C2=B1  9%     +54.9%        845 =C2=B1  5%  sched_debug.cfs_rq[=
12]:/.tg_runnable_contrib
        31 =C2=B1 13%     -29.8%         21 =C2=B1  3%  sched_debug.cpu#4.l=
oad
        31 =C2=B1  9%     -24.2%         23 =C2=B1 21%  sched_debug.cpu#0.c=
pu_load[0]
        30 =C2=B1 12%     -28.5%         22 =C2=B1  3%  sched_debug.cpu#2.c=
pu_load[1]
        34 =C2=B1 20%     -38.0%         21 =C2=B1  2%  sched_debug.cpu#0.c=
pu_load[4]
        33 =C2=B1 12%     -32.8%         22 =C2=B1  4%  sched_debug.cpu#10.=
cpu_load[3]
        38 =C2=B1 40%     -40.0%         23 =C2=B1  7%  sched_debug.cfs_rq[=
3]:/.load
        33 =C2=B1 12%     -34.8%         22 =C2=B1  4%  sched_debug.cpu#10.=
cpu_load[4]
      5.44 =C2=B1  0%     +60.3%       8.71 =C2=B1 10%  perf-profile.cpu-cy=
cles.native_flush_tlb_others.flush_tlb_page.ptep_clear_flush.try_to_unmap_o=
ne.rmap_walk
    768520 =C2=B1  2%     -32.7%     517068 =C2=B1 19%  sched_debug.cpu#43.=
avg_idle
      2161 =C2=B1 12%     +62.3%       3507 =C2=B1  1%  sched_debug.cpu#0.c=
urr->pid
   2209313 =C2=B1  1%     +50.6%    3327328 =C2=B1  7%  sched_debug.cfs_rq[=
1]:/.min_vruntime
      2088 =C2=B1 16%     +68.7%       3524 =C2=B1  1%  sched_debug.cpu#10.=
curr->pid
     85481 =C2=B1  0%     +47.4%     126019 =C2=B1  4%  sched_debug.cfs_rq[=
1]:/.exec_clock
      5.56 =C2=B1  0%     +57.7%       8.77 =C2=B1 10%  perf-profile.cpu-cy=
cles.flush_tlb_page.ptep_clear_flush.try_to_unmap_one.rmap_walk.try_to_unmap
      5.39 =C2=B1  0%     +58.0%       8.52 =C2=B1 10%  perf-profile.cpu-cy=
cles.smp_call_function_many.native_flush_tlb_others.flush_tlb_page.ptep_cle=
ar_flush.try_to_unmap_one
      5.59 =C2=B1  0%     +57.1%       8.79 =C2=B1 10%  perf-profile.cpu-cy=
cles.ptep_clear_flush.try_to_unmap_one.rmap_walk.try_to_unmap.shrink_page_l=
ist
        39 =C2=B1 39%     -41.1%         23 =C2=B1  7%  sched_debug.cpu#3.l=
oad
        33 =C2=B1 10%     -31.8%         22 =C2=B1  4%  sched_debug.cpu#10.=
cpu_load[2]
  17183605 =C2=B1  0%     +47.0%   25256577 =C2=B1  3%  numa-numastat.node0=
.numa_hit
  17179579 =C2=B1  0%     +47.0%   25252790 =C2=B1  3%  numa-numastat.node0=
.local_node
      1.33 =C2=B1  1%     +52.5%       2.02 =C2=B1  7%  perf-profile.cpu-cy=
cles.llist_add_batch.smp_call_function_many.native_flush_tlb_others.flush_t=
lb_page.ptep_clear_flush
    751528 =C2=B1  3%     -31.6%     513885 =C2=B1  7%  sched_debug.cpu#29.=
avg_idle
        32 =C2=B1 12%     -32.6%         21 =C2=B1  3%  sched_debug.cfs_rq[=
4]:/.load
        30 =C2=B1  8%     -28.7%         21 =C2=B1  3%  sched_debug.cpu#2.c=
pu_load[0]
    511740 =C2=B1  0%     +42.7%     730218 =C2=B1  1%  meminfo.Committed_AS
        30 =C2=B1  9%     -27.6%         22 =C2=B1  5%  sched_debug.cfs_rq[=
10]:/.runnable_load_avg
        31 =C2=B1  9%     -29.1%         22 =C2=B1  6%  sched_debug.cpu#10.=
cpu_load[1]
      1160 =C2=B1 10%     +43.7%       1667 =C2=B1 20%  sched_debug.cpu#9.t=
twu_local
    666835 =C2=B1 10%     -25.0%     500027 =C2=B1 10%  sched_debug.cpu#24.=
avg_idle
    112589 =C2=B1  1%     +38.6%     156027 =C2=B1  0%  sched_debug.cpu#0.n=
r_load_updates
    736481 =C2=B1  9%     -26.2%     543278 =C2=B1  9%  sched_debug.cpu#33.=
avg_idle
       105 =C2=B1  8%     -37.4%         66 =C2=B1 19%  sched_debug.cfs_rq[=
5]:/.tg_load_contrib
  11461506 =C2=B1  0%     +33.2%   15264391 =C2=B1  5%  numa-vmstat.node0.n=
uma_local
  11521591 =C2=B1  0%     +33.0%   15324492 =C2=B1  5%  numa-vmstat.node0.n=
uma_hit
    730554 =C2=B1  5%     -29.0%     518492 =C2=B1  6%  sched_debug.cpu#28.=
avg_idle
    710604 =C2=B1 10%     -23.4%     543997 =C2=B1  7%  sched_debug.cpu#32.=
avg_idle
        31 =C2=B1  8%     -25.8%         23 =C2=B1  8%  sched_debug.cpu#10.=
cpu_load[0]
      5262 =C2=B1  8%     +24.3%       6539 =C2=B1 12%  numa-vmstat.node0.n=
r_active_anon
    725624 =C2=B1  5%     -26.4%     534319 =C2=B1 10%  sched_debug.cpu#30.=
avg_idle
       475 =C2=B1  1%     -25.0%        357 =C2=B1  2%  numa-vmstat.node1.n=
r_isolated_file
    118072 =C2=B1  0%     +32.0%     155832 =C2=B1  0%  sched_debug.cpu#2.n=
r_load_updates
    112552 =C2=B1  1%     +31.4%     147843 =C2=B1  0%  sched_debug.cpu#23.=
nr_load_updates
    715220 =C2=B1  9%     -23.7%     545873 =C2=B1  3%  sched_debug.cpu#27.=
avg_idle
  29397725 =C2=B1  0%     +31.4%   38636906 =C2=B1  2%  proc-vmstat.pgsteal=
_direct_normal
    114141 =C2=B1  1%     +29.1%     147312 =C2=B1  1%  sched_debug.cpu#16.=
nr_load_updates
    118519 =C2=B1  1%     +30.1%     154152 =C2=B1  0%  sched_debug.cpu#9.n=
r_load_updates
    708259 =C2=B1  2%     -23.0%     545446 =C2=B1  4%  sched_debug.cpu#26.=
avg_idle
    118513 =C2=B1  0%     +30.7%     154849 =C2=B1  0%  sched_debug.cpu#3.n=
r_load_updates
   1343336 =C2=B1  0%     +30.3%    1749718 =C2=B1  2%  proc-vmstat.pgsteal=
_direct_dma32
    112745 =C2=B1  1%     +29.6%     146100 =C2=B1  1%  sched_debug.cpu#20.=
nr_load_updates
    113863 =C2=B1  1%     +29.3%     147271 =C2=B1  1%  sched_debug.cpu#21.=
nr_load_updates
    118674 =C2=B1  0%     +30.4%     154737 =C2=B1  0%  sched_debug.cpu#10.=
nr_load_updates
    118912 =C2=B1  0%     +30.1%     154712 =C2=B1  0%  sched_debug.cpu#7.n=
r_load_updates
      8324 =C2=B1  0%     +30.0%      10817 =C2=B1  2%  proc-vmstat.allocst=
all
    113529 =C2=B1  2%     +23.5%     140212 =C2=B1  8%  sched_debug.cpu#22.=
nr_load_updates
    119777 =C2=B1  1%     +29.1%     154678 =C2=B1  0%  sched_debug.cpu#11.=
nr_load_updates
    119420 =C2=B1  0%     +29.5%     154631 =C2=B1  0%  sched_debug.cpu#5.n=
r_load_updates
    115387 =C2=B1  1%     +27.4%     146972 =C2=B1  1%  sched_debug.cpu#14.=
nr_load_updates
    118945 =C2=B1  0%     +30.1%     154739 =C2=B1  0%  sched_debug.cpu#6.n=
r_load_updates
      0.92 =C2=B1  0%     +32.5%       1.21 =C2=B1  6%  perf-profile.cpu-cy=
cles.llist_reverse_order.flush_smp_call_function_queue.generic_smp_call_fun=
ction_single_interrupt.smp_call_function_interrupt.call_function_interrupt
    118543 =C2=B1  0%     +30.6%     154779 =C2=B1  0%  sched_debug.cpu#8.n=
r_load_updates
        27 =C2=B1  9%     -24.5%         20 =C2=B1  3%  sched_debug.cfs_rq[=
0]:/.runnable_load_avg
    119654 =C2=B1  0%     +29.6%     155021 =C2=B1  0%  sched_debug.cpu#4.n=
r_load_updates
    114818 =C2=B1  0%     +27.6%     146531 =C2=B1  1%  sched_debug.cpu#18.=
nr_load_updates
   3374967 =C2=B1  4%     -17.5%    2783882 =C2=B1  9%  numa-vmstat.node1.n=
uma_foreign
   3374519 =C2=B1  4%     -17.5%    2783688 =C2=B1  9%  numa-vmstat.node0.n=
uma_miss
  35249529 =C2=B1  0%     +26.2%   44474806 =C2=B1  6%  proc-vmstat.numa_lo=
cal
  35253840 =C2=B1  0%     +26.2%   44475794 =C2=B1  6%  proc-vmstat.numa_hit
    113894 =C2=B1  1%     +25.0%     142393 =C2=B1  3%  sched_debug.cpu#17.=
nr_load_updates
   3434605 =C2=B1  4%     -17.2%    2843790 =C2=B1  8%  numa-vmstat.node0.n=
uma_other
  47137444 =C2=B1  0%     +27.0%   59863418 =C2=B1  2%  proc-vmstat.pgalloc=
_normal
  49289036 =C2=B1  0%     +26.9%   62530835 =C2=B1  2%  proc-vmstat.pgfree
   2166230 =C2=B1  0%     +27.1%    2754154 =C2=B1  1%  proc-vmstat.pgalloc=
_dma32
    116049 =C2=B1  0%     +17.1%     135915 =C2=B1  8%  sched_debug.cpu#15.=
nr_load_updates
      1.40 =C2=B1  1%     +30.8%       1.83 =C2=B1  7%  perf-profile.cpu-cy=
cles.flush_tlb_func.flush_smp_call_function_queue.generic_smp_call_function=
_single_interrupt.smp_call_function_interrupt.call_function_interrupt
   7258791 =C2=B1  2%     -17.3%    6002381 =C2=B1  5%  numa-numastat.node0=
.other_node
   7254765 =C2=B1  2%     -17.3%    5998595 =C2=B1  5%  numa-numastat.node0=
.numa_miss
   7254765 =C2=B1  2%     -17.3%    5998593 =C2=B1  5%  numa-numastat.node1=
.numa_foreign
        12 =C2=B1 45%     +64.6%         19 =C2=B1  4%  sched_debug.cpu#45.=
load
        12 =C2=B1 45%     +62.5%         19 =C2=B1  2%  sched_debug.cfs_rq[=
45]:/.load
    117121 =C2=B1  1%     +24.7%     146078 =C2=B1  1%  sched_debug.cpu#13.=
nr_load_updates
    120017 =C2=B1  1%     +19.8%     143779 =C2=B1  3%  sched_debug.cpu#12.=
nr_load_updates
    108877 =C2=B1  1%     +20.9%     131646 =C2=B1  3%  numa-meminfo.node0.=
PageTables
    114515 =C2=B1  1%     +19.6%     136960 =C2=B1  6%  sched_debug.cpu#19.=
nr_load_updates
        26 =C2=B1 10%     -17.0%         22 =C2=B1  3%  sched_debug.cpu#5.c=
pu_load[4]
        26 =C2=B1  7%     -18.1%         21 =C2=B1  2%  sched_debug.cpu#6.c=
pu_load[4]
        25 =C2=B1  7%     -13.9%         21 =C2=B1  3%  sched_debug.cpu#6.c=
pu_load[0]
       873 =C2=B1  2%     -20.0%        698 =C2=B1  3%  proc-vmstat.nr_isol=
ated_file
        40 =C2=B1 10%     -30.4%         28 =C2=B1 16%  sched_debug.cpu#8.l=
oad
     27111 =C2=B1  0%     +21.6%      32968 =C2=B1  3%  numa-vmstat.node0.n=
r_page_table_pages
    461214 =C2=B1  0%     +19.1%     549395 =C2=B1  3%  slabinfo.radix_tree=
_node.active_objs
    461392 =C2=B1  0%     +19.1%     549569 =C2=B1  3%  slabinfo.radix_tree=
_node.num_objs
      8238 =C2=B1  0%     +19.1%       9813 =C2=B1  3%  slabinfo.radix_tree=
_node.active_slabs
      8238 =C2=B1  0%     +19.1%       9813 =C2=B1  3%  slabinfo.radix_tree=
_node.num_slabs
    222174 =C2=B1  0%     +19.3%     264946 =C2=B1  3%  meminfo.PageTables
  13924052 =C2=B1  1%     +29.2%   17989098 =C2=B1 12%  proc-vmstat.numa_fo=
reign
  13924054 =C2=B1  1%     +29.2%   17989094 =C2=B1 12%  proc-vmstat.numa_mi=
ss
  13928365 =C2=B1  1%     +29.2%   17990081 =C2=B1 12%  proc-vmstat.numa_ot=
her
    707663 =C2=B1  5%     -18.7%     575122 =C2=B1  9%  sched_debug.cpu#34.=
avg_idle
     55729 =C2=B1  0%     +18.9%      66260 =C2=B1  3%  proc-vmstat.nr_page=
_table_pages
    148406 =C2=B1  1%     +16.2%     172374 =C2=B1  3%  numa-meminfo.node0.=
SReclaimable
        25 =C2=B1  4%     -14.7%         21 =C2=B1  3%  sched_debug.cpu#6.c=
pu_load[1]
        27 =C2=B1 13%     -20.7%         22 =C2=B1  3%  sched_debug.cpu#5.c=
pu_load[3]
        26 =C2=B1  2%     -15.4%         22 =C2=B1  3%  sched_debug.cpu#6.c=
pu_load[3]
        25 =C2=B1  3%     -14.6%         22 =C2=B1  3%  sched_debug.cpu#6.c=
pu_load[2]
     36962 =C2=B1  1%     +16.6%      43112 =C2=B1  3%  numa-vmstat.node0.n=
r_slab_reclaimable
    297997 =C2=B1  0%     +17.2%     349194 =C2=B1  2%  meminfo.SReclaimable
     74632 =C2=B1  0%     +17.0%      87301 =C2=B1  2%  proc-vmstat.nr_slab=
_reclaimable
     37510 =C2=B1  1%     +17.6%      44106 =C2=B1  3%  numa-vmstat.node1.n=
r_slab_reclaimable
    114501 =C2=B1  1%     +15.6%     132390 =C2=B1  3%  numa-meminfo.node1.=
PageTables
       386 =C2=B1  3%     -14.6%        330 =C2=B1  3%  numa-vmstat.node0.n=
r_isolated_file
  16655255 =C2=B1  9%     +15.8%   19284310 =C2=B1  4%  proc-vmstat.pgfault
    150600 =C2=B1  1%     +17.1%     176358 =C2=B1  2%  numa-meminfo.node1.=
SReclaimable
        23 =C2=B1  2%      -8.5%         21 =C2=B1  4%  sched_debug.cfs_rq[=
6]:/.runnable_load_avg
     28515 =C2=B1  1%     +16.3%      33150 =C2=B1  2%  numa-vmstat.node1.n=
r_page_table_pages
    385903 =C2=B1  0%     +13.5%     438016 =C2=B1  2%  meminfo.Slab
      1596 =C2=B1  3%     -12.7%       1393 =C2=B1  3%  numa-vmstat.node0.n=
r_alloc_batch
    192730 =C2=B1  1%     +14.2%     220027 =C2=B1  1%  numa-meminfo.node1.=
Slab
    381928 =C2=B1  4%     +15.6%     441483 =C2=B1  1%  softirqs.RCU
    117674 =C2=B1  0%     +11.4%     131032 =C2=B1  3%  sched_debug.cpu#1.n=
r_load_updates
        28 =C2=B1 19%     -21.9%         22 =C2=B1  3%  sched_debug.cpu#5.c=
pu_load[2]
      7157 =C2=B1  4%     +15.4%       8261 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
    194173 =C2=B1  1%     +12.0%     217520 =C2=B1  3%  numa-meminfo.node0.=
Slab
   3342651 =C2=B1  0%     -14.2%    2869010 =C2=B1  8%  proc-vmstat.pgscan_=
direct_dma32
    306106 =C2=B1  6%     -15.0%     260093 =C2=B1  3%  softirqs.SCHED
      7186 =C2=B1  4%     +15.2%       8281 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
      7208 =C2=B1  4%     +14.6%       8263 =C2=B1  2%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
      7172 =C2=B1  5%     +15.0%       8246 =C2=B1  1%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
      7190 =C2=B1  5%     +14.0%       8200 =C2=B1  2%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
      7212 =C2=B1  5%     +13.1%       8159 =C2=B1  3%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
      8673 =C2=B1  9%     +20.1%      10417 =C2=B1  0%  numa-vmstat.node1.n=
r_inactive_anon
      7193 =C2=B1  4%     +12.3%       8079 =C2=B1  3%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
      7248 =C2=B1  5%     +12.6%       8162 =C2=B1  3%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
     34632 =C2=B1  9%     +19.6%      41415 =C2=B1  0%  numa-meminfo.node1.=
Inactive(anon)
       710 =C2=B1  6%    +804.1%       6421 =C2=B1  1%  time.system_time
   1044202 =C2=B1  0%    +450.5%    5748331 =C2=B1  2%  vmstat.system.in
     43925 =C2=B1  5%    +388.2%     214457 =C2=B1  1%  time.involuntary_co=
ntext_switches
     30.82 =C2=B1  0%    +198.7%      92.05 =C2=B1  0%  turbostat.%c0
      1437 =C2=B1  0%    +193.4%       4218 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
     10941 =C2=B1  3%    +200.2%      32847 =C2=B1 10%  time.major_page_fau=
lts
      3717 =C2=B1  0%     +78.2%       6623 =C2=B1  1%  time.user_time
       125 =C2=B1  0%     +31.9%        165 =C2=B1  0%  turbostat.Cor_W
       159 =C2=B1  0%     +25.7%        199 =C2=B1  0%  turbostat.Pkg_W
     14.30 =C2=B1  0%     +19.6%      17.10 =C2=B1  0%  turbostat.RAM_W

ivb43: Ivytown Ivy Bridge-EP
Memory: 64G




                                  time.system_time

  18000 O+--------------------O---O---------------------O------------------=
-+
        | O O OO O O O O OO O   O   OO O O O O OO O O O   OO               =
 |
  16000 ++                                                                 =
 |
  14000 ++   .**.*.                                .*.   .*                =
 |
        *.*.*      *.*.*.**.*.*.*.*.**.*.*.*.*.**.*   *.*  *.*.*.*.*.*     =
 |
  12000 ++                                                           :     =
 |
  10000 ++                                                           :     =
 |
        |                                                            :     =
 |
   8000 ++                                                           :     =
 |
   6000 ++                                                            :    =
 |
        |                                                             :    =
 |
   4000 ++                                                            :    =
 |
   2000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                         time.percent_of_cpu_this_job_got

  5500 ++------------------------------------------------------------------=
-+
  5000 O+O O OO O O O O O O OO O O O O O OO O O O O O OO O O               =
 |
       |                                                                   =
 |
  4500 ++                                                                  =
 |
  4000 *+*.*.**.*.*.*.*.*.*.**.*.*.*.*.*.**.*.*.*.*.*.**.*.*.*.*.*.*.*     =
 |
  3500 ++                                                            :     =
 |
  3000 ++                                                            :     =
 |
       |                                                             :     =
 |
  2500 ++                                                            :     =
 |
  2000 ++                                                             :    =
 |
  1500 ++                                                             :    =
 |
  1000 ++                                                             :    =
 |
       |                                                              :    =
 |
   500 ++                                                             *.*.*=
.*
     0 ++------------------------------------------------------------------=
-+


                               time.major_page_faults

  1e+07 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  9e+06 O+                    O   O    O O        O     O                  =
 |
  8e+06 ++O O OO O O O O OO O   O   OO     O O OO   O O   OO               =
 |
        |                                                                  =
 |
  7e+06 ++                                                                 =
 |
        |                                                                  =
 |
  6e+06 ++                                                                 =
 |
        |                                                                  =
 |
  5e+06 ++                                                                 =
 |
  4e+06 ++                                                                 =
 |
        |                                                             *.*.*=
.*
  3e+06 *+*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
        |                                                                  =
 |
  2e+06 ++-----------------------------------------------------------------=
-+


                                time.minor_page_faults

    2e+07 O+---------------------------------------------------------------=
-+
          |      O   O         O   O    O O        O    O                  =
 |
  1.8e+07 ++O  O   O  O O   O O  O   O O      O  O   O O  O O              =
 |
  1.6e+07 ++  O           O                 O  O                           =
 |
          |                                                                =
 |
  1.4e+07 ++                                                               =
 |
          |                                                                =
 |
  1.2e+07 ++                                                               =
 |
          |                                                                =
 |
    1e+07 ++                                                               =
 |
    8e+06 ++                                                               =
 |
          |                                                                =
 |
    6e+06 ++                                                           **.*=
.*
          |                                                           +    =
 |
    4e+06 *+*-**-*-*-**-*-*-*-**-*-*-*-**-*-*-**-*-*-*-**-*-*-*-**-*-*-----=
-+


                           time.voluntary_context_switches

  7e+07 ++------------------------------------------------------------*---*=
-+
        |                                                             : *  =
 *
  6e+07 ++                                                            :    =
 |
        |                                                             :    =
 |
  5e+07 ++                                                            :    =
 |
        |                                                             :    =
 |
  4e+07 ++                                                           :     =
 |
        |                                                            :     =
 |
  3e+07 ++                                                           :     =
 |
        |      *.                  .*                                :     =
 |
  2e+07 *+*.*.*  *.*.*.*.**.*.*.*.*  *.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
        |                                                                  =
 |
  1e+07 ++                                                                 =
 |
        |                                                                  =
 |
      0 O+O-O-OO-O-O-O-O-OO-O-O-O-O-OO-O-O-O-O-OO-O-O-O-O-OO---------------=
-+


                          time.involuntary_context_switches

  500000 ++----------------------------------------------------------------=
-+
         O                                                                 =
 |
  450000 ++     O   O OO     O O OO O O O O  O   O OO   O O O              =
 |
  400000 ++O OO   O      O O               O   O      O                    =
 |
         |                                                                 =
 |
  350000 ++                                                                =
 |
  300000 ++                                                                =
 |
         |                                                                 =
 |
  250000 ++                                                                =
 |
  200000 *+*.**.*.*.*.**.*.*.*.*.**.*.*.*.**.*.*.*.**.*.*.*.*.**.*.*.*     =
 |
         |                                                            :    =
 |
  150000 ++                                                           :    =
 |
  100000 ++                                                            :   =
 |
         |                                                             **.*=
.*
   50000 ++----------------------------------------------------------------=
-+


                                   softirqs.SCHED

  350000 ++----------------------------------------------------------------=
-+
         |                                                             * .*=
.|
         |                                                            : *  =
 *
  300000 ++    .*.                                                    :    =
 |
         *.*.**   *.*.**. .*.*.*.*   .*.*.**.*.*.*.**.*.*.*.*.**.*.*.*     =
 |
         |               *        *.*                                      =
 |
  250000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
         |                                                                 =
 |
  150000 ++         O                                                      =
 |
         |                   O O OO     O               O                  =
 |
         O O OO O O   OO O O        O O   OO O O O OO O   O O              =
 |
  100000 ++----------------------------------------------------------------=
-+


                                     uptime.idle

  25000 ++-----------------------------------------------------------------=
-+
        |                                                             *.*.*=
.*
        |                                                             :    =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  15000 ++                                                            :    =
 |
        |                                                            :     =
 |
  10000 ++                                                           :     =
 |
        |                                                            :     =
 |
        |      *.                                                    :     =
 |
   5000 *+*.*.*  *.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
        |                                                                  =
 |
        O O O OO O O O O OO O O O O OO O O O O OO O O O O OO               =
 |
      0 ++-----------------------------------------------------------------=
-+


                                   turbostat.%c0

  100 O+--O------------O------------------O---O----------------------------=
-+
   90 ++O   O OO O O O   O O O OO O O O O   O   O OO O O O O               =
 |
      |                                                                    =
 |
   80 *+*.*.*.**.*.*.*.*.*.*.*.**.*.*.*.*.*.*.*.*.**.*.*.*.*.*.*.*.**      =
 |
   70 ++                                                            :      =
 |
      |                                                             :      =
 |
   60 ++                                                             :     =
 |
   50 ++                                                             :     =
 |
   40 ++                                                             :     =
 |
      |                                                              :     =
 |
   30 ++                                                             :     =
 |
   20 ++                                                              :    =
 |
      |                                                               :    =
 |
   10 ++                                                              *.*.*=
.*
    0 ++-------------------------------------------------------------------=
-+


                                  turbostat.%c1

  90 ++--------------------------------------------------------------------=
-+
     |                                                                *.   =
 |
  80 ++                                                               : *.*=
.*
  70 ++                                                               :    =
 |
     |                                                               :     =
 |
  60 ++                                                              :     =
 |
  50 ++                                                              :     =
 |
     |                                                               :     =
 |
  40 ++                                                              :     =
 |
  30 ++                                                             :      =
 |
     |                                                              :      =
 |
  20 *+*.*.*.*.*.**.*.*.*.*.*.*.*.*.*.*.**.*.*.*.*.*.*.*.*.*.*.**.*.*      =
 |
  10 ++                                                                    =
 |
     |                                O                                    =
 |
   0 O+O-O-O-O-O-OO-O-O-O-O-O-O-O-O-O---OO-O-O-O-O-O-O-O-O-O---------------=
-+


                            numa-numastat.node0.numa_hit

  7e+07 O+--------------------O---O---------------------O------------------=
-+
        |      O     O O    O   O   OO O O   O  O O O     OO               =
 |
  6e+07 ++O O O  O O     OO                O   O      O                    =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  5e+07 ++                                                                 =
 |
        |                                                                  =
 |
  4e+07 ++                                                                 =
 |
        |                                                                  =
 |
  3e+07 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  2e+07 ++                                                            *.*.*=
.*
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  1e+07 ++-----------------------------------------------------------------=
-+


                           numa-numastat.node0.local_node

  7e+07 O+--------------------O---O---------------------O------------------=
-+
        |      O     O O    O   O   OO O O   O  O O O     OO               =
 |
  6e+07 ++O O O  O O     OO                O   O      O                    =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  5e+07 ++                                                                 =
 |
        |                                                                  =
 |
  4e+07 ++                                                                 =
 |
        |                                                                  =
 |
  3e+07 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  2e+07 ++                                                            *.*.*=
.*
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  1e+07 ++-----------------------------------------------------------------=
-+


                            numa-numastat.node1.numa_hit

  7e+07 O+--------------------O---O---------------------O------------------=
-+
        |          O                   O          O                        =
 |
  6e+07 ++O O OO O   O O OO O   O   OO   O O O OO   O O   OO               =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  5e+07 ++                                                                 =
 |
        |                                                                  =
 |
  4e+07 ++                                                                 =
 |
        |                                                                  =
 |
  3e+07 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  2e+07 ++                                                            *.*.*=
.*
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  1e+07 ++-----------------------------------------------------------------=
-+


                           numa-numastat.node1.local_node

  7e+07 O+--------------------O---O---------------------O------------------=
-+
        |          O                   O          O                        =
 |
  6e+07 ++O O OO O   O O OO O   O   OO   O O O OO   O O   OO               =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  5e+07 ++                                                                 =
 |
        |                                                                  =
 |
  4e+07 ++                                                                 =
 |
        |                                                                  =
 |
  3e+07 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  2e+07 ++                                                            *.*.*=
.*
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  1e+07 ++-----------------------------------------------------------------=
-+


                                 vmstat.procs.r

  60 ++--------------------------------------------------------------------=
-+
     O O O O O O OO O O O O O O O O O O OO O O O O O O O O O               =
 |
  50 ++                                                                    =
 |
     |                         .*                     .*.                  =
 |
     *.*.*.*.*.*.**.*.*.*.*.*.*  + .*.*.**.*.*.*.*.*.*   *. .*.**.*.*      =
 |
  40 ++                           *                        *        :      =
 |
     |                                                              :      =
 |
  30 ++                                                              :     =
 |
     |                                                               :     =
 |
  20 ++                                                              :     =
 |
     |                                                               :     =
 |
     |                                                                :    =
 |
  10 ++                                                               :    =
 |
     |                                                                *.*.*=
.*
   0 ++--------------------------------------------------------------------=
-+


                                  vmstat.system.in

  700000 O+-------------------------------O-------------O------------------=
-+
         | O OO O O O OO O O O O OO O O O  O O O O OO O   O O              =
 |
  600000 ++                                                                =
 |
         |                                                                 =
 |
  500000 ++                                                                =
 |
         |                                                                 =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  100000 *+*.**.*.*.*.**.*.*.*.*.**.*.*.*.**.*.*.*.**.*.*.*.*.**.*.*.*     =
 |
         |                                                            +    =
 |
       0 ++------------------------------------------------------------**-*=
-*


                                  vmstat.system.cs

  400000 ++----------------------------------------------------------------=
-+
         |                                                             **.*=
.*
  350000 ++                                                            :   =
 |
         |                                                             :   =
 |
  300000 ++                                                           :    =
 |
  250000 ++                                                           :    =
 |
         |                                                            :    =
 |
  200000 ++                                                           :    =
 |
         |                                                           :     =
 |
  150000 *+*.**.*.*. .**.*.*.*.*.**.*.*.*.**.*.*.*.* .*.*.*.*.**.*.*.:     =
 |
  100000 ++         *                               *                *     =
 |
         |                                                                 =
 |
   50000 ++                                                                =
 |
         |                                                                 =
 |
       0 O+O-OO-O-O-O-OO-O-O-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-O-O--------------=
-+


                             proc-vmstat.nr_active_anon

  100000 ++----------------------------------------------------------------=
-+
   90000 O+  O  O   O OO     O O OO O   O    O   O OO O O O O              =
 |
         | O  O   O      O O          O   OO   O                           =
 |
   80000 ++                                                                =
 |
   70000 ++                                                                =
 |
         |                                                                 =
 |
   60000 ++                                                                =
 |
   50000 ++                                                                =
 |
   40000 ++                                                                =
 |
         |                                                                 =
 |
   30000 ++                                                                =
 |
   20000 ++                      *                                         =
 |
         |       .*. .*   .*.*. + :.*.*.*.                        .*. .*   =
 |
   10000 *+*.**.*   *  *.*     *  *       **.*.*.*.**.*.*.*.*.**.*   *  *.*=
.*
       0 ++----------------------------------------------------------------=
-+


                           proc-vmstat.nr_isolated_file

  1600 ++------------------------------------------------------------------=
-+
       |                                                              *.*.*=
.*
  1400 ++*.*.**.*.*.*.*.*.*.**. .*. .*.*.**.     .*.*.**.*.*.*.*.*. .*     =
 |
       *                       *   *        *.*.*                  *       =
 |
  1200 ++                                                                  =
 |
       |                                                                   =
 |
  1000 ++                                                                  =
 |
       |                                                                   =
 |
   800 ++                                                                  =
 |
       |                                                                   =
 |
   600 ++                                                                  =
 |
       |                                                                   =
 |
   400 ++                                                                  =
 |
       O O O OO O O O O O O OO O O O O O OO O O O O O OO O O               =
 |
   200 ++------------------------------------------------------------------=
-+


                                proc-vmstat.nr_shmem

  100000 ++----------------------------------------------------------------=
-+
         O O OO O O O OO O O O O OO O O O OO O O O OO O O O O              =
 |
   90000 ++                                                                =
 |
   80000 ++                                                                =
 |
         |                                                                 =
 |
   70000 ++                                                                =
 |
   60000 ++                                                                =
 |
         |                                                                 =
 |
   50000 ++                                                                =
 |
   40000 ++                                                                =
 |
         |                                                                 =
 |
   30000 ++                                                                =
 |
   20000 ++                *.    *                                         =
 |
         |       .*. .*   +  *. + :.*.*.*.                        .*.      =
 |
   10000 *+*-**-*---*--*-*-----*--*-------**-*-*-*-**-*-*-*-*-**-*---*-**-*=
-*


                                 proc-vmstat.numa_hit

  1.4e+08 O+-------------------O---O--------------------O------------------=
-+
          |      O   OO O     O  O   O OO O        O      O                =
 |
  1.2e+08 ++O OO   O      O O               O OO O   O O    O              =
 |
          |                                                                =
 |
          |                                                                =
 |
    1e+08 ++                                                               =
 |
          |                                                                =
 |
    8e+07 ++                                                               =
 |
          |                                                                =
 |
    6e+07 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
    4e+07 ++                                                          .**.*=
.*
          *.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
    2e+07 ++---------------------------------------------------------------=
-+


                                proc-vmstat.numa_local

  1.4e+08 O+-------------------O---O--------------------O------------------=
-+
          |      O   OO O     O  O   O OO O        O      O                =
 |
  1.2e+08 ++O OO   O      O O               O OO O   O O    O              =
 |
          |                                                                =
 |
          |                                                                =
 |
    1e+08 ++                                                               =
 |
          |                                                                =
 |
    8e+07 ++                                                               =
 |
          |                                                                =
 |
    6e+07 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
    4e+07 ++                                                          .**.*=
.*
          *.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
    2e+07 ++---------------------------------------------------------------=
-+


                           proc-vmstat.workingset_refault

  7e+07 ++-----------------------------------------------------------------=
-+
        O                                                                  =
 |
  6e+07 ++         O O      O O O O O  O O        O     O                  =
 |
        | O O OO O     O OO          O     O O OO   O O   OO               =
 |
  5e+07 ++                                                                 =
 |
        |                                                                  =
 |
  4e+07 ++                                                                 =
 |
        |                                                                  =
 |
  3e+07 ++                                                                 =
 |
        |                                                                  =
 |
  2e+07 ++                                                                 =
 |
        |                                                             *.*.*=
.*
  1e+07 *+*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                            proc-vmstat.workingset_activate

    4e+07 ++---------------------------------------------------------------=
-+
          O                                             O                  =
 |
  3.5e+07 ++     O   OO O     OO O O O  O O   O  O O      O                =
 |
          | O OO   O      O O          O    O  O     O O    O              =
 |
    3e+07 ++                                                               =
 |
          |                                                                =
 |
  2.5e+07 ++                                                               =
 |
          |                                                                =
 |
    2e+07 ++                                                               =
 |
          |                                                                =
 |
  1.5e+07 ++                                                               =
 |
          |                                                                =
 |
    1e+07 ++                                                           **.*=
.*
          |                                                           +    =
 |
    5e+06 *+*-**-*-*-**-*-*-*-**-*-*-*-**-*-*-**-*-*-*-**-*-*-*-**-*-*-----=
-+


                               proc-vmstat.pgalloc_dma32

  4.5e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    4e+06 O+                   O   O                    O                  =
 |
          |      O   OO O     O  O   O OO O   O  O O O    O O              =
 |
  3.5e+06 ++O OO   O      O O               O  O       O                   =
 |
          |                                                                =
 |
    3e+06 ++                                                               =
 |
          |                                                                =
 |
  2.5e+06 ++                                                               =
 |
          |                                                                =
 |
    2e+06 ++                                                               =
 |
          |                                                                =
 |
  1.5e+06 ++                                                           **.*=
.*
          *.*.**.*.*.**.*.*.*.*                     .*.*              +    =
 |
    1e+06 ++-------------------*-*-*-*-**-*-*-**-*-*----*-*-*-*-**-*-*-----=
-+


                              proc-vmstat.pgalloc_normal

  1.6e+08 ++---------------------------------------------------------------=
-+
          O                    O   O                    O                  =
 |
  1.4e+08 ++     O   OO O   O O  O   O OO O   O  O O O O  O O              =
 |
          | O OO   O      O                 O  O                           =
 |
  1.2e+08 ++                                                               =
 |
          |                                                                =
 |
    1e+08 ++                                                               =
 |
          |                                                                =
 |
    8e+07 ++                                                               =
 |
          |                                                                =
 |
    6e+07 ++                                                           **.*=
.*
          |                                                           +    =
 |
    4e+07 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
    2e+07 ++---------------------------------------------------------------=
-+


                                  proc-vmstat.pgfree

  1.6e+08 ++---------------------------------------------------------------=
-+
          O                    O   O                    O                  =
 |
  1.4e+08 ++     O   OO O     O  O   O OO O   O  O O O O  O O              =
 |
          | O OO   O      O O               O  O                           =
 |
          |                                                                =
 |
  1.2e+08 ++                                                               =
 |
          |                                                                =
 |
    1e+08 ++                                                               =
 |
          |                                                                =
 |
    8e+07 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
    6e+07 ++                                                           **.*=
.*
          |                                                           +    =
 |
    4e+07 *+*-**-*-*-**-*-*-*-**-*-*-*-**-*-*-**-*-*-*-**-*-*-*-**-*-*-----=
-+


                               proc-vmstat.pgactivate

  8e+07 ++-----------------------------------------------------------------=
-+
        O                                               O                  =
 |
  7e+07 ++     O   O O O    O O O O OO O O   O  O O O     OO               =
 |
        | O O O  O       OO                O   O      O                    =
 |
  6e+07 ++                                                                 =
 |
        |                                                                  =
 |
  5e+07 ++                                                                 =
 |
        |                                                                  =
 |
  4e+07 ++                                                                 =
 |
        |                                                                  =
 |
  3e+07 ++                                                               .*=
.|
        |                                                             *.*  =
 *
  2e+07 *+*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
        |                                                                  =
 |
  1e+07 ++-----------------------------------------------------------------=
-+


                               proc-vmstat.pgdeactivate

  1.6e+08 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  1.4e+08 O+                   O   O                    O                  =
 |
          |      O   OO O     O  O   O OO O   O  O O O O  O O              =
 |
  1.2e+08 ++O OO   O      O O               O  O                           =
 |
          |                                                                =
 |
    1e+08 ++                                                               =
 |
          |                                                                =
 |
    8e+07 ++                                                               =
 |
          |                                                                =
 |
    6e+07 ++                                                               =
 |
          |                                                                =
 |
    4e+07 ++                                                           **.*=
.*
          |                                                           +    =
 |
    2e+07 *+*-**-*-*-**-*-*-*-**-*-*-*-**-*-*-**-*-*-*-**-*-*-*-**-*-*-----=
-+


                                  proc-vmstat.pgfault

    3e+07 O+--------------------------------------------O------------------=
-+
          |      O   OO O     OO O O O OO O   O  O O      O                =
 |
          | O OO   O      O O               O  O     O O    O              =
 |
  2.5e+07 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
    2e+07 ++                                                               =
 |
          |                                                                =
 |
  1.5e+07 ++                                                               =
 |
          |                                                                =
 |
          |                                                            **.*=
.*
    1e+07 ++                                                          +    =
 |
          *.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
    5e+06 ++---------------------------------------------------------------=
-+


                               proc-vmstat.pgmajfault

  1e+07 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  9e+06 O+                    O   O    O O        O     O                  =
 |
  8e+06 ++O O OO O O O O OO O   O   OO     O O OO   O O   OO               =
 |
        |                                                                  =
 |
  7e+06 ++                                                                 =
 |
        |                                                                  =
 |
  6e+06 ++                                                                 =
 |
        |                                                                  =
 |
  5e+06 ++                                                                 =
 |
  4e+06 ++                                                                 =
 |
        |                                                             *.*.*=
.*
  3e+06 *+*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
        |                                                                  =
 |
  2e+06 ++-----------------------------------------------------------------=
-+


                              proc-vmstat.pgrefill_dma32

    4e+06 ++---------------------------------------------------------------=
-+
          O                                             O                  =
 |
  3.5e+06 ++     O   OO O     OO O O   OO O        O      O                =
 |
          | O OO   O      O O        O      O OO O   O O    O              =
 |
    3e+06 ++                                                               =
 |
          |                                                                =
 |
  2.5e+06 ++                                                               =
 |
          |                                                                =
 |
    2e+06 ++                                                               =
 |
          |                                                                =
 |
  1.5e+06 ++                                                               =
 |
          |                                                                =
 |
    1e+06 ++                                                           **.*=
.*
          *.*.**.*.*.**.*.*.*.*                     .*.*              +    =
 |
   500000 ++-------------------*-*-*-*-**-*-*-**-*-*----*-*-*-*-**-*-*-----=
-+


                              proc-vmstat.pgrefill_normal

  1.4e+08 O+---------------------------------------------------------------=
-+
          |          O         O   O    O O        O    O                  =
 |
  1.2e+08 ++O  O O O  O O   O O  O   O O      O  O   O O  O O              =
 |
          |   O           O                 O  O                           =
 |
          |                                                                =
 |
    1e+08 ++                                                               =
 |
          |                                                                =
 |
    8e+07 ++                                                               =
 |
          |                                                                =
 |
    6e+07 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
    4e+07 ++                                                           **.*=
.*
          |                                                           +    =
 |
    2e+07 *+*-**-*-*-**-*-*-*-**-*-*-*-**-*-*-**-*-*-*-**-*-*-*-**-*-*-----=
-+


                          proc-vmstat.pgsteal_kswapd_dma32

  160000 ++----------------------------------------------------------------=
-+
         |      O      O       O  O                O    O O O              =
 |
  140000 O+O  O     O O    O O   O  O O O O  O   O  O O                    =
 |
  120000 ++  O    O      O                 O   O                           =
 |
         |                                                                 =
 |
  100000 ++                                                                =
 |
         |                                                                 =
 |
   80000 ++                                                                =
 |
         |                                                                 =
 |
   60000 ++                                                                =
 |
   40000 ++                                                                =
 |
         |                                                            .**.*=
.*
   20000 *+*.**.*.*.*.**.*.*.*.*.**.*.*.*.**.*.*.*.**.*.*.*.*.**.*.*.*     =
 |
         |                                                                 =
 |
       0 ++----------------------------------------------------------------=
-+


                          proc-vmstat.pgsteal_kswapd_normal

  7e+06 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  6e+06 ++                    O   O    O          O     O OO               =
 |
        O O   OO O O O O  O O   O   OO   O   O  O   O O                    =
 |
  5e+06 ++  O            O                 O   O                           =
 |
        |                                                                  =
 |
  4e+06 ++                                                                 =
 |
        |                                                                  =
 |
  3e+06 ++                                                                 =
 |
        |                                                                  =
 |
  2e+06 ++                                                                 =
 |
        |                                                             *.*.*=
.*
  1e+06 *+*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                           proc-vmstat.pgsteal_direct_dma32

  3.5e+06 O+---------------------------------------------------------------=
-+
          |                    O   O                    O                  =
 |
    3e+06 ++     O   OO O     O  O   O OO O   O  O O O O  O O              =
 |
          | O OO   O      O O               O  O                           =
 |
          |                                                                =
 |
  2.5e+06 ++                                                               =
 |
          |                                                                =
 |
    2e+06 ++                                                               =
 |
          |                                                                =
 |
  1.5e+06 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
    1e+06 ++                                                           **.*=
.*
          *.*.**.*.*.**.*.*.*.*                     .*.*              +    =
 |
   500000 ++-------------------*-*-*-*-**-*-*-**-*-*----*-*-*-*-**-*-*-----=
-+


                           proc-vmstat.pgsteal_direct_normal

  1.4e+08 ++---------------------------------------------------------------=
-+
          O                                                                =
 |
  1.2e+08 ++                   O   O               O    O                  =
 |
          | O  O O O OO O   O O  O   O OO O   O  O   O O  O O              =
 |
          |   O           O                 O  O                           =
 |
    1e+08 ++                                                               =
 |
          |                                                                =
 |
    8e+07 ++                                                               =
 |
          |                                                                =
 |
    6e+07 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
    4e+07 ++                                                           **.*=
.*
          |                                                           +    =
 |
    2e+07 *+*-**-*-*-**-*-*-*-**-*-*-*-**-*-*-**-*-*-*-**-*-*-*-**-*-*-----=
-+


                           proc-vmstat.pgscan_kswapd_dma32

  300000 ++----------------------------------------------------------------=
-+
         |      O     OO       O  O     O    O   O O    O O O              =
 |
  250000 O+O  O     O      O O   O  O O   O         O O                    =
 |
         |   O    O      O                 O   O                           =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  150000 ++                                                                =
 |
         |                                                                 =
 |
  100000 ++                                                                =
 |
         |                                                                 =
 |
         |                      .*                                    .**.*=
.*
   50000 *+*.**.*.*.*.**.*.*.*.*  *.*.*.*.**.*.*.*.**.*.*.*.*.**.*.*.*     =
 |
         |                                                                 =
 |
       0 ++----------------------------------------------------------------=
-+


                           proc-vmstat.pgscan_kswapd_normal

  1.2e+07 ++---------------------------------------------------------------=
-+
  1.1e+07 ++                   O   O    O          O    O O O              =
 |
          O O  O O   OO O   O O  O   O O  O   O  O   O O                   =
 |
    1e+07 ++       O      O                 O  O                           =
 |
    9e+06 ++  O                                                            =
 |
    8e+06 ++                                                               =
 |
    7e+06 ++                                                               =
 |
          |                                                                =
 |
    6e+06 ++                                                               =
 |
    5e+06 ++                                                               =
 |
    4e+06 ++                                                               =
 |
    3e+06 ++                                                               =
 |
          |                                                           .**.*=
.*
    2e+06 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
    1e+06 ++---------------------------------------------------------------=
-+


                           proc-vmstat.pgscan_direct_dma32

  7e+06 ++-----------------------------------------------------------------=
-+
        O                                                                  =
 |
  6e+06 ++                    O   O      O              O                  =
 |
        | O O OO O O O O  O O   O   OO O     O  O O O O   OO               =
 |
        |                O                 O   O                           =
 |
  5e+06 ++                                                                 =
 |
        |                                                                  =
 |
  4e+06 ++                                                                 =
 |
        |                                                                  =
 |
  3e+06 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  2e+06 ++                                                            *.*.*=
.*
        *.*.*.**.*.*.*.*.**.*.     .*   .*. .*.  .*.*.*. .**.   .*.*. :    =
 |
  1e+06 ++--------------------*-*-*--*-*---*---**-------*----*-*-----*-----=
-+


                           proc-vmstat.pgscan_direct_normal

  2.4e+08 O+--------------------------------------------O------------------=
-+
  2.2e+08 ++     O   OO O     OO O O O OO O        O      O                =
 |
          | O OO   O      O O               O OO O   O O    O              =
 |
    2e+08 ++                                                               =
 |
  1.8e+08 ++                                                               =
 |
          |                                                                =
 |
  1.6e+08 ++                                                               =
 |
  1.4e+08 ++                                                               =
 |
  1.2e+08 ++                                                               =
 |
          |                                                                =
 |
    1e+08 ++                                                               =
 |
    8e+07 ++                                                             .*=
.*
          |                                                            **  =
 |
    6e+07 ++                                                          +    =
 |
    4e+07 *+*-**-*-*-**-*-*-*-**-*-*-*-**-*-*-**-*-*-*-**-*-*-*-**-*-*-----=
-+


                     proc-vmstat.kswapd_low_wmark_hit_quickly

  3000 ++------------------------------------------------------------------=
-+
       O      O              O   O   O   O        O    O                   =
 |
  2500 ++  O O  O O O O   O O  O   O      O   O     O O  O O               =
 |
       | O              O              O    O   O                          =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1500 ++                                                                  =
 |
       |                                                                   =
 |
  1000 ++                                                                  =
 |
       |                                                                   =
 |
       |                                                                   =
 |
   500 ++                                                                  =
 |
       |                                                                   =
 |
     0 *+*-*-**-*-*-*-*-*-*-**-*-*-*-*-*-**-*-*-*-*-*-**-*-*-*-*-*-*-**-*-*=
-*


                              proc-vmstat.pageoutrun

  4000 ++------------------------------------------------------------------=
-+
       O                                                                   =
 |
  3500 ++     O     O        O   O O O   O          O  O   O               =
 |
  3000 ++  O O  O O   O   O O  O       O  O O O O O   O  O                 =
 |
       | O              O                                                  =
 |
  2500 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1500 ++                                                                  =
 |
  1000 ++                                                                  =
 |
       |                                                                   =
 |
   500 ++                                                                  =
 |
       |                                                                   =
 |
     0 *+*-*-**-*-*-*-*-*-*-**-*-*-*-*-*-**-*-*-*-*-*-**-*-*-*-*-*-*-**-*-*=
-*


                               proc-vmstat.allocstall

  160000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  140000 O+                    O  O                     O                  =
 |
         |      O   O OO     O   O  O O O O  O   O OO     O O              =
 |
  120000 ++O OO   O      O O               O   O      O                    =
 |
         |                                                                 =
 |
  100000 ++                                                                =
 |
         |                                                                 =
 |
   80000 ++                                                                =
 |
         |                                                                 =
 |
   60000 ++                                                                =
 |
         |                                                                 =
 |
   40000 ++                                                            **.*=
.*
         |                                                            +    =
 |
   20000 *+*-**-*-*-*-**-*-*-*-*-**-*-*-*-**-*-*-*-**-*-*-*-*-**-*-*-*-----=
-+


                            proc-vmstat.pgmigrate_success

  50000 ++-----------------------------------------------------------------=
-+
  45000 ++     O       O             O O                                   =
 |
        | O   O               O   O      O        O     O                  =
 |
  40000 ++                          O      O   O          OO               =
 |
  35000 ++  O        O    O                         O                      =
 |
        |                O  O   O            O  O     O                    =
 |
  30000 ++       O                                                         =
 |
  25000 O+         O                                                       =
 |
  20000 ++                                                                 =
 |
        |                                                                  =
 |
  15000 ++                                                                 =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
   5000 ++                                                                 =
 |
      0 *+*-*-**-*-*-*-*-**-*-*-*-*-**-*-*-*-*-**-*-*-*-*-**-*-*-*-*-**-*-*=
-*


                         proc-vmstat.compact_migrate_scanned

  300000 ++----------------------------------------------------------------=
-+
         | O           O                                                   =
 |
  250000 ++                                        O                       =
 |
         |      O              O  O                                        =
 |
         |                          O O                 O                  =
 |
  200000 ++  OO   O          O   O      O OO   O    O O   O                =
 |
         |               O O                                O              =
 |
  150000 ++         O O                                                    =
 |
         O                                   O   O                         =
 |
  100000 ++                                                                =
 |
         |                                                                 =
 |
         |                                                                 =
 |
   50000 ++                                                                =
 |
         |                    .*.                                          =
.*
       0 *+*-**-*-*-*-**-*-*-*---**-*-*-*-**-*-*-*-**-*-*-*-*-**-*-*-*-**-*=
-+


                            proc-vmstat.compact_isolated

  140000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  120000 ++            O       O  O   O                                    =
 |
         | O    O                       O          O                       =
 |
  100000 ++   O                           O             O O O              =
 |
         |   O             O        O      O   O    O                      =
 |
   80000 ++           O  O   O   O                    O                    =
 |
         |        O                          O   O                         =
 |
   60000 ++         O                                                      =
 |
         O                                                                 =
 |
   40000 ++                                                                =
 |
         |                                                                 =
 |
   20000 ++                                                                =
 |
         |                                                                 =
 |
       0 *+*-**-*-*-*-**-*-*-*-*-**-*-*-*-**-*-*-*-**-*-*-*-*-**-*-*-*-**-*=
-*


                                meminfo.Active(anon)

  400000 ++----------------------------------------------------------------=
-+
         O   O  O   O O      O O OO O   O  O O O O OO O O O O              =
 |
  350000 ++O  O   O    O O O          O   O                                =
 |
         |                                                                 =
 |
  300000 ++                                                                =
 |
  250000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  150000 ++                                                                =
 |
  100000 ++                                                                =
 |
         |                       *                                         =
 |
   50000 ++      .*. .*   .*.*. + :.*.*.*.                        .*. .*   =
 |
         *.*.**.*   *  *.*     *  *       **.*.*.*.**.*.*.*.*.**.*   *  *.*=
.*
       0 ++----------------------------------------------------------------=
-+


                                    meminfo.Shmem

  400000 ++----------------------------------------------------------------=
-+
         O O OO O O O OO O O O O OO O O O OO O O O OO O O O O              =
 |
  350000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++                                                                =
 |
  250000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  150000 ++                                                                =
 |
  100000 ++                                                                =
 |
         |       .*       .*.    *     .*.                                 =
 |
   50000 ++ .**.*  + .* .*   *. + :.*.*   * .*. .*. *.*.*.*.*.**.*.*. .**. =
 |
         *.*        *  *       *  *        *   *   *                 *    *=
.*
       0 ++----------------------------------------------------------------=
-+


                                meminfo.Committed_AS

  450000 O+-------O-O-OO------------O---O--O-O-O-O-OO-O---O-O--------------=
-+
         | O OO O        O O O O OO   O   O             O                  =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  350000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++                                                                =
 |
         |                                                                 =
 |
  250000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  150000 ++      .*.      .*.*. .* .*. .*.                 .*.             =
 |
         |.*.**.*   *.**.*     *  *   *   **.*.*. .**.*.*.*   **.*.*.*.**.*=
.*
  100000 *+--------------------------------------*-------------------------=
-+


                       slabinfo.proc_inode_cache.active_objs

  8000 ++------------------------------------------------------------------=
-+
       |                           O                                       =
 |
  7500 ++                                                                  =
 |
       |                                                                   =
 |
  7000 O+O O O  O   O     O OO O O   O   O  O   O   O O  O                 =
 |
       |      O   O   O O              O  O   O            O               =
 |
  6500 ++                                         O    O                   =
 |
       |                                                                   =
 |
  6000 ++                                                             *.   =
 |
       |    .*                .*.*.*.*    *.             *.*.*.*.     : *. =
 |
  5500 *+*.*  *.*.*.*.*.*. .**        :  *  *. .*.*   * +        *.*.*    *=
.*
       |                  *           : :     *    + + *                   =
 |
  5000 ++                              ::           *                      =
 |
       |                               *                                   =
 |
  4500 ++------------------------------------------------------------------=
-+


                             sched_debug.cpu#0.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  2.5e+06 ++                                                            *.*=
.*
          |                                                            *   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                           :   =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
          |                                                          :     =
 |
   500000 *+*.**.*.*. *. .*.*.**. .*.*.**.*.*.* .*.*.*.**.*.*.*.* .*.:     =
 |
          |          *  *        *             *                 *   *     =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#0.sched_count

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  2.5e+06 ++                                                           **.*=
.*
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                                                          :     =
 |
   500000 *+*.**.*.*.**. .*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |             *                                                  =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#0.sched_goidle

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                             *.*=
.*
  1.2e+06 ++                                                           *   =
 |
          |                                                            :   =
 |
    1e+06 ++                                                           :   =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.* .*.*     =
 |
          |                                                      *         =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#0.avg_idle

   1e+06 O+---O-O------O-O-----O--O-O-O-O-OO-O-O-O--O-O-O-O-O--------------=
-+
         | O O    O O O    O O   O                 O                       =
 |
  900000 ++                                                                =
 |
  800000 ++                                                                =
 |
         |                                                                 =
 |
  700000 ++                                                                =
 |
  600000 ++                                                                =
 |
         |                                                                 =
 |
  500000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                                                             **. =
 |
  300000 ++                                                           +   *=
.|
  200000 ++        .*.               .*.             .*.*.*.     *.*.*     =
 *
         *.*.* .*.*   **.*.*.*.*.**.*   *.**.*.*.*.**       *.* +          =
 |
  100000 ++---*------------------------------------------------*-----------=
-+


                             sched_debug.cpu#0.ttwu_count

  1.4e+06 ++---------------------------------------------------------------=
-*
          |                                                            **.*=
 |
  1.2e+06 ++                                                           :   =
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |     .*.                 .*.                              :     =
 |
   200000 *+*.**   *.**.*.*.*.**.*.*   **.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                      sched_debug.cfs_rq[0]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                     .*                           =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*  *.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                             sched_debug.cpu#1.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  2.5e+06 ++                                                            *.*=
.*
          |                                                            *   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                           :   =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                                                          :     =
 |
   500000 *+*.**.*.*. *.*.*.*.**. .*.*.**.*.*.**.*.*.*.**.*.*.*.* .*.*     =
 |
          |          *           *                               *         =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#1.sched_count

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  2.5e+06 ++                                                           **.*=
.*
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                                                          :     =
 |
   500000 *+*.**.*.*. *.*.*.*.**. .*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |          *           *                                         =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#1.sched_goidle

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                             *.*=
.*
  1.2e+06 ++                                                           *   =
 |
          |                                                            :   =
 |
    1e+06 ++                                                           :   =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*. *.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |          *                                                     =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#1.avg_idle

   1e+06 O+O-OO---O---OO-O-O--------O-O-O-OO-O-O-O-OO-O-O-O-O--------------=
-+
         |      O   O        O O OO                                        =
 |
  900000 ++                                                                =
 |
  800000 ++                                                                =
 |
         |                                                                 =
 |
  700000 ++                                                                =
 |
  600000 ++                                                                =
 |
         |                                                                 =
 |
  500000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++                                                            **  =
 |
  200000 ++                   .*. *. .*.*.     *.              *.*.*. +  + =
.*
         *.*.**.*. .*.**.*.*.*   *  *     **. +  *. *.*. .*. .*      *    *=
 |
  100000 ++-------*--------------------------*-----*----*---*--------------=
-+


                             sched_debug.cpu#1.ttwu_count

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                             *.*=
.*
  1.2e+06 ++                                                           *   =
 |
          |                                                            :   =
 |
    1e+06 ++                                                           :   =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |     .*.                                                  :     =
 |
   200000 *+*.**   *.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                      sched_debug.cfs_rq[1]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                     .*                           =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*  *.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                             sched_debug.cpu#2.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  2.5e+06 ++                                                           **.*=
.*
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                              .*.                         :     =
 |
   500000 *+*.**.*.*.**. .*.*.**.*.*.*.**   *.**.*.*.*.**.*.*.*.* .*.*     =
 |
          |             *                                        *         =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#2.sched_count

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                             *. =
.*
  2.5e+06 ++                                                           *  *=
 |
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                              .*.                         :     =
 |
   500000 *+*.**.*.*.**. .*.*.**.*.*.*.**   *.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |             *                                                  =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#2.sched_goidle

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                            **. =
.*
  1.2e+06 ++                                                           :  *=
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                              .*.                         :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**   *.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#2.avg_idle

   1e+06 O+O-OO-O-O-O-OO-O-O-O-O-OO---O-O--O-O-O-O-OO-O-O-O-O--------------=
-+
         |                                O                                =
 |
  900000 ++                         O                                      =
 |
  800000 ++                                                                =
 |
         |                                                                 =
 |
  700000 ++                                                                =
 |
  600000 ++                                                                =
 |
         |                                                                 =
 |
  500000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++         *                                                   *. =
 |
  200000 ++*.      + +         *         .*         *.         *.*. .*. : *=
.*
         *   **.*.*   *   .*. + + *.*.*.*  *. .*.*.*  *.*.*.*.*    *   *   =
 |
  100000 ++------------*-*---*---*-----------*-----------------------------=
-+


                             sched_debug.cpu#2.ttwu_count

  1.4e+06 ++-----------------------------------------------------------*---=
-*
          |                                                            :*. =
+|
  1.2e+06 ++                                                           :  *=
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |     .*.                                                  :     =
 |
   200000 *+*.**   *.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                      sched_debug.cfs_rq[2]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                     .*                           =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*  *.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                             sched_debug.cpu#3.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                              .*=
.|
  2.5e+06 ++                                                           **  =
 *
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
          |                             *.                           :     =
 |
   500000 *+*.**.*.*. *.*.*.*.**. .*.*.*  *.*.* .*.*.*.**.*.*.*.**.*.:     =
 |
          |          *           *             *                     *     =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#3.sched_count

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                             *.*=
.|
  2.5e+06 ++                                                           *   =
 *
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |    *.*.                     *.                           :     =
 |
   500000 *+*.*    *.**.*.*.*.**. .*.*.*  *.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |        O             *                                         =
 |
        0 O+O-OO-O---OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#3.sched_goidle

  1.4e+06 ++--------------------------------------------------------------*=
-+
          |                                                            **  =
 *
  1.2e+06 ++                                                           :   =
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                             *.                           :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**. .*.*.*  *.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                      *                                         =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#3.avg_idle

   1e+06 O+O-OO-O-O-O-O--------O--O-O-O-O-OO-O-O-O-OO-O-O---O--------------=
-+
  900000 ++              O O O   O                        O                =
 |
         |             O                                                   =
 |
  800000 ++                                                                =
 |
  700000 ++                                                                =
 |
         |                                                                 =
 |
  600000 ++                                                                =
 |
  500000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++      .*                              *                       .*=
.*
  200000 ++   *.*  +   *. .*.*.*.    .*.   *.*  : + *.*        *.*. .*.**  =
 |
         *.*.*      *.*  *       **.*   *.*   + :  *   + .*.*.*    *       =
 |
  100000 ++                                    *        *                  =
 |
       0 ++----------------------------------------------------------------=
-+


                             sched_debug.cpu#3.ttwu_count

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                            **.*=
.*
  1.2e+06 ++                                                           :   =
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |     .*.                                                  :     =
 |
   200000 *+*.**   *.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                        sched_debug.cfs_rq[3]:/.min_vruntime

  1e+07 ++-----------------------------------------------------------------=
-+
  9e+06 O+     O   O O O    O O O O O  O O   O  O O     O OO               =
 |
        | O O O  O       OO          O     O   O    O                      =
 |
  8e+06 ++                                            O                    =
 |
  7e+06 ++                                                                 =
 |
        |  .*.**.*.   .*.    .*.     *.     .*. *. .*.   .**.       .*     =
 |
  6e+06 *+*        *.*   **.*   *.*.*  *.*.*   *  *   *.*    *.*.*.* :     =
 |
  5e+06 ++                                                           :     =
 |
  4e+06 ++                                                           :     =
 |
        |                                                             :    =
 |
  3e+06 ++                                                            :    =
 |
  2e+06 ++                                                            :    =
 |
        |                                                             :    =
 |
  1e+06 ++                                                            *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[3]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                     .*                           =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*  *.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                             sched_debug.cpu#4.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  2.5e+06 ++                                                           **.*=
.*
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
          |                                                          :     =
 |
   500000 *+*.**.*.*. *.*.*.*.**.*.*.*.**.*.*.**.*.*.*. *.*.*.*.* .*.:     =
 |
          |          *                                 *         *   *     =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#4.sched_count

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  2.5e+06 ++                                                           **.*=
.*
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
          |                                                          :     =
 |
   500000 *+*.**.*.*. *.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.:     =
 |
          |          *                                               *     =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#4.sched_goidle

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                            **.*=
.*
  1.2e+06 ++                                                           :   =
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*. *.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |          *                                                     =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#4.avg_idle

   1e+06 ++O----O-O-O-OO-O-O---O--O---O-O-OO-O-O-O--O---O---O--------------=
-+
         O   OO              O   O  O              O      O                =
 |
  900000 ++                                           O                    =
 |
  800000 ++                                                                =
 |
         |                                                                 =
 |
  700000 ++                                                                =
 |
  600000 ++                                                                =
 |
         |                                                                 =
 |
  500000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                                                               .*=
.|
  300000 ++                                          .*                 *  =
 *
  200000 ++ .*         *.*.*. .*.  .*               *  :  *.   *.       :  =
 |
         |.*  *.*. .*.*      *   **  +   .*   .*.*.*   : +  *.*  *.*.*.*   =
 |
  100000 *+-------*-------------------*-*--*-*----------*------------------=
-+


                             sched_debug.cpu#4.ttwu_count

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                            * .*=
.*
  1.2e+06 ++                                                           :*  =
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                        sched_debug.cfs_rq[4]:/.min_vruntime

  1e+07 ++-----------------------------------------------------------------=
-+
  9e+06 O+     O   O O O      O   O OO O          O     O  O               =
 |
        | O O O  O       OO O   O        O O O OO   O O   O                =
 |
  8e+06 ++                                                                 =
 |
  7e+06 ++                                                                 =
 |
        *.   .* .*.   .*  *.          .*. .*.   *. .*.   .* .*. .*. .*     =
 |
  6e+06 ++*.*  *   *.*  + : *.*.*.*.**   *   *.*  *   *.*  *   *   * :     =
 |
  5e+06 ++               *                                           :     =
 |
  4e+06 ++                                                           :     =
 |
        |                                                             :    =
 |
  3e+06 ++                                                            :    =
 |
  2e+06 ++                                                            :    =
 |
        |                                                             :    =
 |
  1e+06 ++                                                            *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[4]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                                                  =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                             sched_debug.cpu#5.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                              .*=
.|
  2.5e+06 ++                                                           **  =
 *
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                                                          :     =
 |
   500000 *+*.**.*.*. *. .*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |          *  *                                                  =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#5.sched_goidle

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                            **.*=
.*
  1.2e+06 ++                                                           :   =
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*. *.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |          *                                                     =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#5.avg_idle

   1e+06 O+O-O--O-O-O-O------O---O--O-O-O-OO-O-O-O-OO-O-O---O--------------=
-+
         |    O        O O O   O  O                       O                =
 |
  900000 ++                                                                =
 |
  800000 ++                                                                =
 |
         |                                                                 =
 |
  700000 ++                                                                =
 |
  600000 ++                                                                =
 |
         |                                                                 =
 |
  500000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++                                  *                          *.*=
.|
  200000 *+      .*.*   .*.     .*      *.  + +      .*.*. .*. *.*.*.*.*   =
 *
         | *.**.*    + *   *.*.*  *.*. +  **   *.*. *     *   *            =
 |
  100000 ++-----------*---------------*------------*-----------------------=
-+


                             sched_debug.cpu#5.ttwu_count

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                            **.*=
.*
  1.2e+06 ++                                                           :   =
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                        sched_debug.cfs_rq[5]:/.min_vruntime

  1e+07 ++-----------------------------------------------------------------=
-+
  9e+06 O+    OO   O O O  O   O   O OO O          O   O O  O               =
 |
        | O O    O       O  O   O                   O     O                =
 |
  8e+06 ++                               O O O OO                          =
 |
  7e+06 ++                                                                 =
 |
        *.      .*.   .*. *.         *.         *. .*.   .* .*. .*. .*     =
 |
  6e+06 ++*.*.**   *.*   *  *.*.*.*.*  *.*.*.*.*  *   *.*  *   *   * :     =
 |
  5e+06 ++                                                           :     =
 |
  4e+06 ++                                                           :     =
 |
        |                                                             :    =
 |
  3e+06 ++                                                            :    =
 |
  2e+06 ++                                                            :    =
 |
        |                                                             :    =
 |
  1e+06 ++                                                            *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[5]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                                                  =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                             sched_debug.cpu#6.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                              .*=
.|
  2.5e+06 ++                                                           **  =
 *
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                                                          :     =
 |
   500000 *+*.**.*.*.**.*.*.*.**. .*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                      *                                         =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#6.sched_count

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                              .*=
.|
  2.5e+06 ++                                                           **  =
 *
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                                                          :     =
 |
   500000 *+*.**.*.*.**.*.*.*.**. .*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                      *                                         =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#6.sched_goidle

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                            **.*=
.*
  1.2e+06 ++                                                           :   =
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**. .*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                      *                                         =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#6.avg_idle

   1e+06 O+--OO---O-O--O-O-O-O-O-OO-O-O----O-O-O-O-O----O-O-O--------------=
-+
  900000 ++O    O     O                 O O         O O                    =
 |
         |                                                                 =
 |
  800000 ++                                                                =
 |
  700000 ++                                                                =
 |
         |                                                                 =
 |
  600000 ++                                                                =
 |
  500000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++                                           *                    =
 |
  200000 ++*. *.*. .*  *.*. .*.    .*.*.   *.        + + .*.    .*.   .**. =
.*
         *   *    *  + :   *   *.**     *.*  *.*.*.**   *   *.**   *.*    *=
 |
  100000 ++           *                                                    =
 |
       0 ++----------------------------------------------------------------=
-+


                             sched_debug.cpu#6.ttwu_count

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                            * .*=
.*
  1.2e+06 ++                                                           :*  =
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                        sched_debug.cfs_rq[6]:/.min_vruntime

  1e+07 ++-----------------------------------------------------------------=
-+
  9e+06 O+     O   O O O  O O O O O OO O   O   O  O O   O  O               =
 |
        | O O O  O       O               O   O  O     O   O                =
 |
  8e+06 ++                                                                 =
 |
  7e+06 ++                                                                 =
 |
        *.     *.*.       *.*.       *.*.*.        .*.   .* .*. .*.        =
 |
  6e+06 ++*.*.*    *.*.*.*    *.*.*.*      *.*.**.*   *.*  *   *   *.*     =
 |
  5e+06 ++                                                           :     =
 |
  4e+06 ++                                                           :     =
 |
        |                                                            :     =
 |
  3e+06 ++                                                            :    =
 |
  2e+06 ++                                                            :    =
 |
        |                                                             :    =
 |
  1e+06 ++                                                            *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[6]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                                                  =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                             sched_debug.cpu#7.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  2.5e+06 ++                                                           **.*=
.*
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
          |                                                          :     =
 |
   500000 *+*.**.*.*. *.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.:     =
 |
          |          *                                               *     =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#7.sched_count

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                              .*=
.|
  2.5e+06 ++                                                           **  =
 *
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
          |                                                          :     =
 |
   500000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.:     =
 |
          |               O             O              O             *     =
 |
        0 O+O-OO-O-O-OO-O---O-OO-O-O-O-O--O-O-OO-O-O-O--O-O-O--------------=
-+


                            sched_debug.cpu#7.sched_goidle

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                              .*=
.*
  1.2e+06 ++                                                           **  =
 |
          |                                                            :   =
 |
    1e+06 ++                                                           :   =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                          :    =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.:     =
 |
          |                                                          *     =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#7.avg_idle

   1e+06 ++O-OO---O-O--O-O-O-O-O-OO-O-O-O-OO-O-O-O-OO---O---O--------------=
-+
  900000 O+     O     O                               O   O                =
 |
         |                                                                 =
 |
  800000 ++                                                                =
 |
  700000 ++                                                                =
 |
         |                                                                 =
 |
  600000 ++                                                                =
 |
  500000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++                                                          *.* .*=
.*
  200000 ++    .*.*.   *. .*.*.*     .*.*.* .*.*.*. *.*. .*     .*. +   *  =
 |
         *.*.**     *.*  *      + *.*      *       *    *  + .**   *       =
 |
  100000 ++                      *                          *              =
 |
       0 ++----------------------------------------------------------------=
-+


                             sched_debug.cpu#7.ttwu_count

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                            * .*=
.*
  1.2e+06 ++                                                           :*  =
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                        sched_debug.cfs_rq[7]:/.min_vruntime

  1e+07 ++-----------------------------------------------------------------=
-+
  9e+06 O+    OO     O O  O   O   O OO O O   O  O O O O O OO               =
 |
        | O O    O O     O  O   O          O   O                           =
 |
  8e+06 ++                                                                 =
 |
  7e+06 ++                                                                 =
 |
        *.*. .* .*.       *.*.                     .*. .*.* .*. .*.        =
 |
  6e+06 ++  *  *   *.*.*.*    *.*.*.**.*.*.*.*.**.*   *    *   *   *.*     =
 |
  5e+06 ++                                                           :     =
 |
  4e+06 ++                                                           :     =
 |
        |                                                            :     =
 |
  3e+06 ++                                                            :    =
 |
  2e+06 ++                                                            :    =
 |
        |                                                             :    =
 |
  1e+06 ++                                                            *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[7]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                                                  =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                             sched_debug.cpu#8.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  2.5e+06 ++                                                           **.*=
.*
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                                                          :     =
 |
   500000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#8.sched_count

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  2.5e+06 ++                                                           **.*=
.*
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                                                          :     =
 |
   500000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                 O  O                           =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O---O--O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#8.sched_goidle

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                            **.*=
.|
  1.2e+06 ++                                                           :   =
 *
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#8.avg_idle

   1e+06 O+O-OO-O-O-O--O-O-O-O-O-OO-O-O-O-OO-O-O-O-OO-O-O------------------=
-+
  900000 ++                                                 O              =
 |
         |            O                                   O                =
 |
  800000 ++                                                                =
 |
  700000 ++                                                                =
 |
         |                                                                 =
 |
  600000 ++                                                                =
 |
  500000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                                                              *. =
 |
  300000 ++                                       .*                    : *=
.|
  200000 ++ .*   .*.*.      .*.      .*.   *    .*  :    .*.*  *.*.*.*.*   =
 *
         *.*  *.*     **.*.*   *.* .*   *.* + .*    *.*.*    + :           =
 |
  100000 ++                       *          *                *            =
 |
       0 ++----------------------------------------------------------------=
-+


                             sched_debug.cpu#8.ttwu_count

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                            * .*=
.*
  1.2e+06 ++                                                           :*  =
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                        sched_debug.cfs_rq[8]:/.min_vruntime

  1e+07 ++-----------------------------------------------------------------=
-+
  9e+06 O+    OO   O O O      O   O OO O O O   O  O O O O OO               =
 |
        | O O    O       OO O   O            O  O                          =
 |
  8e+06 ++                                                                 =
 |
  7e+06 ++                                                                 =
 |
        *. .*.**.*.       *.*.        .*.*.     *. .*. .*.*     .*. .*     =
 |
  6e+06 ++*        *.*.*.*    *.*.*.**     *.*.*  *   *    *.*.*   * :     =
 |
  5e+06 ++                                                           :     =
 |
  4e+06 ++                                                           :     =
 |
        |                                                             :    =
 |
  3e+06 ++                                                            :    =
 |
  2e+06 ++                                                            :    =
 |
        |                                                             :    =
 |
  1e+06 ++                                                            *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[8]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                                                  =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                             sched_debug.cpu#9.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  2.5e+06 ++                                                           **.*=
.*
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                                                          :     =
 |
   500000 *+*.**.*.*. *.*.*.*.**.*.*.*.**.*.*.**.*.*. .**.*.*.*.**.*.*     =
 |
          |          *                               *                     =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#9.sched_count

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  2.5e+06 ++                                                           **.*=
.*
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          *.                                                         :     =
 |
   500000 ++*.**.*.*. *.*.*.*.**.*.*.*.**.*.*.**.*.*. .**.*.*.*.**.*.*     =
 |
          |          *                               *                     =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#9.sched_goidle

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                            **.*=
.*
  1.2e+06 ++                                                           :   =
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*. *.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |          *                                                     =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#9.avg_idle

   1e+06 O+O-O----O--------O-O-O-OO-O-O-O--O-O-O-O-OO-O---O-O--------------=
-+
  900000 ++   O O   O OO O                O             O                  =
 |
         |                                                                 =
 |
  800000 ++                                                                =
 |
  700000 ++                                                                =
 |
         |                                                                 =
 |
  600000 ++                                                                =
 |
  500000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  300000 *+                                *                               =
 |
  200000 ++            *. .*.*.     *.*. .* +   .*.*     .*. .**.   .*.**.*=
.*
         | *.**.*.*.*.*  *     *.* +    *    *.*    *.*.*   *    *.*       =
 |
  100000 ++                       *                                        =
 |
       0 ++----------------------------------------------------------------=
-+


                             sched_debug.cpu#9.ttwu_count

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                            * .*=
.*
  1.2e+06 ++                                                           :*  =
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                        sched_debug.cfs_rq[9]:/.min_vruntime

  1e+07 ++-----------------------------------------------------------------=
-+
  9e+06 O+     O   O O O    O O O O OO O O   O  O O O   O OO               =
 |
        | O O O  O       OO                O   O      O                    =
 |
  8e+06 ++                                                                 =
 |
  7e+06 ++                                                                 =
 |
        |    .**.*.       *.*.       *.     .*. *.       .* .*.     .*     =
 |
  6e+06 *+*.*      *.*.*.*    *.*.*.*  *.*.*   *  *.*.*.*  *   *.*.* :     =
 |
  5e+06 ++                                                           :     =
 |
  4e+06 ++                                                           :     =
 |
        |                                                             :    =
 |
  3e+06 ++                                                            :    =
 |
  2e+06 ++                                                            :    =
 |
        |                                                             :    =
 |
  1e+06 ++                                                            *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[9]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                                                  =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                            sched_debug.cpu#10.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                              .*=
.|
  2.5e+06 ++                                                           **  =
 *
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                                                          :     =
 |
   500000 *+*.**.*.*. *.*.*.*.**. .*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |          *           *                                         =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#10.sched_count

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                             *.*=
.|
  2.5e+06 ++                                                           *   =
 *
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                                                          :     =
 |
   500000 *+*.**.*.*. *.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |          *                                                     =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#10.sched_goidle

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                            **.*=
.*
  1.2e+06 ++                                                           :   =
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#10.avg_idle

   1e+06 ++O-OO-O-O---OO------------O-O-O-OO-O-O-O-OO-O-----O--------------=
-+
  900000 ++         O    O O   O  O                     O                  =
 |
         O                   O   O                        O                =
 |
  800000 ++                                                                =
 |
  700000 ++                                                                =
 |
         |                                                                 =
 |
  600000 ++                                                                =
 |
  500000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++                             *                             .*   =
 |
  200000 ++*.**    .*.**. .*.*.        + + *.     .**.*    .*.  .*. .*  *.*=
.|
         *     + .*      *     *.* .*.*   *  *.*.*     + .*   **   *       =
 *
  100000 ++     *                 *                     *                  =
 |
       0 ++----------------------------------------------------------------=
-+


                             sched_debug.cpu#10.ttwu_count

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                            * .*=
.*
  1.2e+06 ++                                                           :*  =
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                      sched_debug.cfs_rq[10]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                                                  =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                            sched_debug.cpu#11.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  2.5e+06 ++                                                            *.*=
.|
          |                                                            *   =
 *
          |                                                            :   =
 |
    2e+06 ++                                                           :   =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                                                          :     =
 |
   500000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#11.sched_count

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  2.5e+06 ++                                                            *.*=
.|
          |                                                            *   =
 *
          |                                                            :   =
 |
    2e+06 ++                                                           :   =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                                                          :     =
 |
   500000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |    O                                                           =
 |
        0 O+O-O--O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#11.sched_goidle

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                             *.*=
.|
  1.2e+06 ++                                                           *   =
 *
          |                                                            :   =
 |
    1e+06 ++                                                           :   =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#11.avg_idle

   1e+06 O+O-OO-O-O----O-O-O---O--O-O-O-O-OO-O-O-O--O---O-O-O--------------=
-+
  900000 ++         O O                               O                    =
 |
         |                   O   O                                         =
 |
  800000 ++                                        O                       =
 |
  700000 ++                                                                =
 |
         |                                                                 =
 |
  600000 ++                                                                =
 |
  500000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++               .*.              *                           *   =
 |
  200000 ++*.  .*.      .*   *.*.  .*.     :+     .**.*.*. .*   .*.   + *.*=
.*
         *   **   *.*.**         **   *.*.*  *.*.*        *  + *   *.*     =
 |
  100000 ++                                                   *            =
 |
       0 ++----------------------------------------------------------------=
-+


                             sched_debug.cpu#11.ttwu_count

  1.4e+06 ++--------------------------------------------------------------*=
-+
          |                                                            **  =
 *
  1.2e+06 ++                                                           :   =
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |     .*.                                                  :     =
 |
   200000 *+*.**   *.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                      sched_debug.cfs_rq[11]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                                                  =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                            sched_debug.cpu#12.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  2.5e+06 ++                                                            *.*=
.|
          |                                                            *   =
 *
          |                                                            :   =
 |
    2e+06 ++                                                           :   =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |     .*.                                                  :     =
 |
   500000 *+*.**   *. *.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |          *                                                     =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#12.sched_count

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                              .*=
 |
  2.5e+06 ++                                                           **  =
+|
          |                                                            :   =
 *
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |     .*.                                                  :     =
 |
   500000 *+*.**   *.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#12.sched_goidle

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                             *.*=
.|
  1.2e+06 ++                                                           *   =
 *
          |                                                            :   =
 |
    1e+06 ++                                                           :   =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |     .*.                                                  :     =
 |
   200000 *+*.**   *.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#12.avg_idle

   1e+06 O+O-OO-O---O-OO-O-O-O-O-OO-O-O-O-O--------O--O-O-O-O--------------=
-+
  900000 ++                                O O O O  O                      =
 |
         |        O                                                        =
 |
  800000 ++                                                                =
 |
  700000 ++                                                                =
 |
         |                                                                 =
 |
  600000 ++                                                                =
 |
  500000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++          .*                                               .*   =
.*
  200000 ++*. *.*.*.*  :  .*.*.   *. .*.*.*       .*   .*.        .*.*  *.*=
 |
         *   *         *.*     *.*  *      *. .*.*  *.*   *.*.* .*         =
 |
  100000 ++                                  *                 *           =
 |
       0 ++----------------------------------------------------------------=
-+


                             sched_debug.cpu#12.ttwu_count

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                            **.*=
.*
  1.2e+06 ++                                                           :   =
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                      sched_debug.cfs_rq[12]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                                                  =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                            sched_debug.cpu#13.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  2.5e+06 ++                                                           **.*=
.*
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                                                          :     =
 |
   500000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*. *.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                   *                            =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#13.sched_count

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                              .*=
.|
  2.5e+06 ++                                                           **  =
 *
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                                                          :     =
 |
   500000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*. *.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                   *                            =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#13.sched_goidle

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                             *.*=
.|
  1.2e+06 ++                                                           *   =
 *
          |                                                            :   =
 |
    1e+06 ++                                                           :   =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#13.ttwu_count

  1.4e+06 ++-----------------------------------------------------------*--*=
-+
          |                                                            :*  =
 *
  1.2e+06 ++                                                           :   =
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                      sched_debug.cfs_rq[13]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                     .*                           =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*  *.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                            sched_debug.cpu#14.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
.*
  2.5e+06 ++                                                             .*=
 |
          |                                                            **  =
 |
          |                                                            :   =
 |
    2e+06 ++                                                           :   =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                  .*                                .*    :     =
 |
   500000 *+*.**.*.*.**.*. .*  *.*.*.*.**.*.*.**.*.*.*.**.*.*.*  *.*.*     =
 |
          |               *                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#14.sched_count

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
.*
  2.5e+06 ++                                                           **.*=
 |
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                     *    :     =
 |
          |                  .*                 .*.     *.     + :   :     =
 |
   500000 *+*.**.*.*.**.*. .*  *.*.*.*.**.*.*.**   *.*.*  *.*.*  *.*.*     =
 |
          |               *                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#14.sched_goidle

  1.4e+06 ++---------------------------------------------------------------=
-*
          |                                                                =
+|
  1.2e+06 ++                                                           **.*=
 |
          |                                                            :   =
 |
    1e+06 ++                                                           :   =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                  .*                                .*    :     =
 |
   200000 *+*.**.*.*.**.*.*.*  *.*.*.*.**.*.*.**.*.*.*.**.*.*.*  *.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#14.avg_idle

   1e+06 O+O-OO-O-O---OO---O-O-O-OO-----O-OO-O-O-O----O-O-O-O--------------=
-+
         |          O    O          O O            O                       =
 |
  900000 ++                                         O                      =
 |
  800000 ++                                                                =
 |
         |                                                                 =
 |
  700000 ++                                                                =
 |
  600000 ++                                                                =
 |
         |                                                                 =
 |
  500000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                                                             *   =
 |
  300000 ++                      *                                    +:   =
 |
  200000 ++ .*         *.       : :        *.*       .*             .*  :.*=
.*
         |.*  :.*. .*.*  *.     : *.*. .*.*   + .*.**  +     .* .*.*    *  =
 |
  100000 *+---*---*--------*-*-*------*--------*--------*-*-*--*-----------=
-+


                             sched_debug.cpu#14.ttwu_count

  1.4e+06 ++--------------------------------------------------------------*=
-*
          |                                                            **  =
 |
  1.2e+06 ++                                                           :   =
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                      sched_debug.cfs_rq[14]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                     .*                           =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*  *.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                            sched_debug.cpu#15.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
.*
  2.5e+06 ++                                                           * .*=
 |
          |                                                            :*  =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                .*.                             .*.   *.  :     =
 |
   500000 *+*.**.*.*.**.*.*   **.*.*.*.**.*.*.**.*.*.*.**.*   *.*  *.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#15.sched_count

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                            *   =
.*
  2.5e+06 ++                                                           :*.*=
 |
          |                                                            :   =
 |
          |                                                           :    =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                .*.                             .*.   *.  :     =
 |
   500000 *+*.**.*.*.**.*.*   **.*.*.*.**.*.*.**.*.*.*.**.*   *.*  *.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#15.sched_goidle

  1.4e+06 ++---------------------------------------------------------------=
-*
          |                                                            * .*=
 |
  1.2e+06 ++                                                           :*  =
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                .*.                             .*.   *.  :     =
 |
   200000 *+*.**.*.*.**.*.*   **.*.*.*.**.*.*.**.*.*.*.**.*   *.*  *.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#15.avg_idle

   1e+06 O+-----O-O----O-O-O--------O-O---OO-O-O-O--O-O-O-O-O--------------=
-+
  900000 ++O OO     O O      O O OO     O          O                       =
 |
         |                                                                 =
 |
  800000 ++                                                                =
 |
  700000 ++                                                                =
 |
         |                                                                 =
 |
  600000 ++                                                                =
 |
  500000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  300000 *+                *.                                              =
 |
  200000 ++*. *. .*.*.*   +  *.*. *.*. .*. *                   *.*.*.   *.*=
.*
         |   *  *      *.*       *    *   * + .*.*.**.*.*.*.*.*      *.*   =
 |
  100000 ++                                  *                             =
 |
       0 ++----------------------------------------------------------------=
-+


                             sched_debug.cpu#15.ttwu_count

  1.6e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  1.4e+06 ++                                                           **.*=
.*
          |                                                            :   =
 |
  1.2e+06 ++                                                           :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                      sched_debug.cfs_rq[15]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                     .*                           =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*  *.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                            sched_debug.cpu#16.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                            *   =
.*
  2.5e+06 ++                                                           :*.*=
 |
          |                                                            :   =
 |
          |                                                           :    =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |           *.                                             :     =
 |
   500000 *+*.**.*.*.*  *. .*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |               *                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#16.sched_count

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                            *   =
.*
  2.5e+06 ++                                                           :*.*=
 |
          |                                                            :   =
 |
          |                                                           :    =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |           *.*                    .*                      :     =
 |
   500000 *+*.**.*.*.*   + .*.**.*.*.*.**.*.*  *.*.*.*.**.*.*.*.**.*.*     =
 |
          |               *                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#16.sched_goidle

  1.4e+06 ++-----------------------------------------------------------*---=
-*
          |                                                            :*.*=
 |
  1.2e+06 ++                                                           :   =
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |           *.*.                                           :     =
 |
   200000 *+*.**.*.*.*    *.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#16.avg_idle

   1e+06 O+O----O-O---OO-O-O-O-O-OO-O-O-O-OO-O-O-O-OO---O-O-O--------------=
-+
  900000 ++  OO     O                                 O                    =
 |
         |                                                                 =
 |
  800000 ++                                                                =
 |
  700000 ++                                                                =
 |
         |                                                                 =
 |
  600000 ++                                                                =
 |
  500000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++                          .*                                    =
 |
  200000 ++ .**.       *.          .*  +   *.             *.*   .*.*. .**.*=
.|
         *.*    *.*.*.*  *.*.*.*.**     *.*  *. .*. *.*. +   + *     *     =
 *
  100000 ++                                    *   *    *     *            =
 |
       0 ++----------------------------------------------------------------=
-+


                             sched_debug.cpu#16.ttwu_count

  1.6e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  1.4e+06 ++                                                           **.*=
.*
          |                                                            :   =
 |
  1.2e+06 ++                                                           :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                      sched_debug.cfs_rq[16]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                     .*                           =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*  *.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                            sched_debug.cpu#17.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
.*
  2.5e+06 ++                                                           * .*=
 |
          |                                                            :*  =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                                                          :     =
 |
   500000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#17.sched_count

    3e+06 ++---------------------------------------------------------------=
-*
          |                                                            *   =
+|
  2.5e+06 ++                                                           ::.*=
 |
          |                                                            :*  =
 |
          |                                                           :    =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                                                          :     =
 |
   500000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#17.sched_goidle

  1.6e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  1.4e+06 ++                                                           *   =
.*
          |                                                            ::.*=
 |
  1.2e+06 ++                                                           :*  =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*. .*.**.*.*.*.**.*.*.* .*.*.*.**.*.*.*.**.*.*     =
 |
          |               *                    *                           =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#17.avg_idle

   1e+06 O+O-O----O---OO-O-O---O--O-O-O-O-OO-O-O-O--O-O---O-O--------------=
-+
  900000 ++   O     O        O   O                 O    O                  =
 |
         |      O                                                          =
 |
  800000 ++                                                                =
 |
  700000 ++                                                                =
 |
         |                                                                 =
 |
  600000 ++                                                                =
 |
  500000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++                                                              .*=
.|
  200000 ++      .*     .*. .*.   *. .*.              *.   .*.**.     .**  =
 *
         *.*.**.*  + .**   *   *.*  *   *. *.*.*. .* +  *.*      *.*.*     =
 |
  100000 ++         *                     *      *  *                      =
 |
       0 ++----------------------------------------------------------------=
-+


                             sched_debug.cpu#17.ttwu_count

  1.6e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
.*
  1.4e+06 ++                                                           **.*=
 |
          |                                                            :   =
 |
  1.2e+06 ++                                                           :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                      sched_debug.cfs_rq[17]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                                                  =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                            sched_debug.cpu#18.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
.*
  2.5e+06 ++                                                           **.*=
 |
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                    *.          .*.          *.           :     =
 |
   500000 *+*.**.*.*.**.*.*.*.*  *.*.*.**.*   **.*.*.*.*  *.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#18.sched_goidle

  1.4e+06 ++---------------------------------------------------------------=
-*
          |                                                            **. =
+|
  1.2e+06 ++                                                           :  *=
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                    *.          .*.          *.           :     =
 |
   200000 *+*.**.*.*.**.*.*.*.*  *.*.*.**.*   **.*.*.*.*  *.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#18.avg_idle

   1e+06 O+O-OO-O-O---OO---O-O-O-OO---O-O-OO---O---OO---O------------------=
-+
  900000 ++         O                                 O   O O              =
 |
         |               O          O        O   O                         =
 |
  800000 ++                                                                =
 |
  700000 ++                                                                =
 |
         |                                                                 =
 |
  600000 ++                                                                =
 |
  500000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                                              *.                 =
 |
  300000 ++  *                      *                  +  *                =
 |
  200000 ++ : :             .*. .* + +     *.*.   .*  *    +    .*. .*. *.*=
.|
         *. : *.*.*.   *.*.*   *  *   *.*.*    *.*  :+      *.**   *   *   =
 *
  100000 ++*        *.*                             *                      =
 |
       0 ++----------------------------------------------------------------=
-+


                             sched_debug.cpu#18.ttwu_count

  1.4e+06 ++---------------------------------------------------------------=
-*
          |                                                            **.*=
 |
  1.2e+06 ++                                                           :   =
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                      sched_debug.cfs_rq[18]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                                                  =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                            sched_debug.cpu#19.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 *
  2.5e+06 ++                                                           *   =
+|
          |                                                            :*.*=
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |    *.                                                    :     =
 |
   500000 *+*.*  *.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#19.sched_count

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
.*
  2.5e+06 ++                                                           * .*=
 |
          |                                                            :*  =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |    *.                                                    :     =
 |
   500000 *+*.*  *.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#19.sched_goidle

  1.4e+06 ++---------------------------------------------------------------=
-*
          |                                                            *   =
+|
  1.2e+06 ++                                                           :*.*=
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |    *.                                                    :     =
 |
   200000 *+*.*  *.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#19.avg_idle

   1e+06 O+O-O--O-O-O-OO---O-O---O--O-O---OO-O-O-O--O-----O-O--------------=
-+
  900000 ++   O          O     O  O     O          O  O O                  =
 |
         |                                                                 =
 |
  800000 ++                                                                =
 |
  700000 ++                                                                =
 |
         |                                                                 =
 |
  600000 ++                                                                =
 |
  500000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++                                                                =
 |
  200000 ++  **    .*. *.*.*.        .*.*. *.   .*.**.*. .*.    .*.   .**.*=
.*
         *. +  + .*   *      *.*.* .*     *  *.*        *   *.**   *.*     =
 |
  100000 ++*    *                 *                                        =
 |
       0 ++----------------------------------------------------------------=
-+


                             sched_debug.cpu#19.ttwu_count

  1.6e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  1.4e+06 ++                                                           * .*=
.*
          |                                                            :*  =
 |
  1.2e+06 ++                                                           :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*. *.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |          *                                                     =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                      sched_debug.cfs_rq[19]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                                                  =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                            sched_debug.cpu#20.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
.*
  2.5e+06 ++                                                           * .*=
 |
          |                                                            :*  =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                                  .*              .*.     :     =
 |
   500000 *+*.**.*.*.**.*. .*.**.*.*.*.**.*.*  *.*.*.*.**.*.*   **.*.*     =
 |
          |               *                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#20.sched_count

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
.*
  2.5e+06 ++                                                           **.*=
 |
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                                  .*              .*.     :     =
 |
   500000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*  *.*.*.*.**.*.*   **.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#20.sched_goidle

  1.4e+06 ++---------------------------------------------------------------=
-*
          |                                                            * .*=
 |
  1.2e+06 ++                                                           :*  =
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                                  .*              .*.     :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*  *.*.*.*.**.*.*   **.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#20.avg_idle

   1e+06 O+O-OO-O---O--O-O-O---O--O-O-----OO-O-O-O-O----O-O-O--------------=
-+
         |        O   O      O   O    O O           O O                    =
 |
  900000 ++                                                                =
 |
  800000 ++                                                                =
 |
         |                                                                 =
 |
  700000 ++                                                                =
 |
  600000 ++                                                                =
 |
         |                                                                 =
 |
  500000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++                                                     .*         =
 *
  200000 *+*.      .*     .*   *.     *.*.  .*.*.*.            *  :   .**. =
+|
         |   **.*.*  + *.*  + +  **. +    **       **.*.*.*.*.*   : .*    *=
 |
  100000 ++-----------*------*------*------------------------------*-------=
-+


                             sched_debug.cpu#20.ttwu_count

  1.6e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
.*
  1.4e+06 ++                                                            *.*=
 |
          |                                                            *   =
 |
  1.2e+06 ++                                                           :   =
 |
    1e+06 ++                                                           :   =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.* .*.*.*.**.*.*.*.**.*.*     =
 |
          |                                    *                           =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                      sched_debug.cfs_rq[20]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                                                  =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                            sched_debug.cpu#21.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
.*
  2.5e+06 ++                                                           * .*=
 |
          |                                                            :*  =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                                     .*.                  :     =
 |
   500000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**   *.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#21.sched_count

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                            *   =
.*
  2.5e+06 ++                                                           :*.*=
 |
          |                                                            :   =
 |
          |                                                           :    =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                                     .*.                  :     =
 |
   500000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**   *.*.**.*.*.*.**.*.*     =
 |
          |          O                                                     =
 |
        0 O+O-OO-O-O--O-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#21.sched_goidle

  1.4e+06 ++---------------------------------------------------------------=
-*
          |                                                            *   =
+|
  1.2e+06 ++                                                           :*.*=
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                                     .*.                  :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**   *.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#21.avg_idle

   1e+06 ++--OO-O-O---OO-O-O-O-O-OO-O-O-O--O---O----O---O-O----------------=
-+
         |          O                     O  O   O O  O     O              =
 |
  900000 O+                                                                =
 |
  800000 ++O                                                               =
 |
         |                                                                 =
 |
  700000 ++                                                                =
 |
  600000 ++                                                                =
 |
         |                                                                 =
 |
  500000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++                                                             *. =
 |
  200000 ++   *    .*.  .*.                     .*.                 .*.*  *=
.*
         *.*.* + .*   **   *.*. .**.*.*. .**.*.*   **.   .*.   *.*.*       =
 |
  100000 ++-----*--------------*--------*-------------*-*---*-*------------=
-+


                             sched_debug.cpu#21.ttwu_count

  1.6e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  1.4e+06 ++                                                           **.*=
.*
          |                                                            :   =
 |
  1.2e+06 ++                                                           :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                      sched_debug.cfs_rq[21]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                                                  =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                            sched_debug.cpu#22.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  2.5e+06 ++                                                           * .*=
.*
          |                                                            :*  =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |       .*.                                                :     =
 |
   500000 *+*.**.*   **.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#22.sched_count

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
.*
  2.5e+06 ++                                                           **.*=
 |
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |       .*.                                                :     =
 |
   500000 *+*.**.*   **.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#22.sched_goidle

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                            * .*=
.*
  1.2e+06 ++                                                           :*  =
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |       .*.                                                :     =
 |
   200000 *+*.**.*   **.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#22.avg_idle

   1e+06 O+O------O-O-OO-----O-O-OO-O---O-OO-O-O-O-OO-O---O----------------=
-+
  900000 ++  OO O          O          O                 O   O              =
 |
         |               O                                                 =
 |
  800000 ++                                                                =
 |
  700000 ++                                                                =
 |
         |                                                                 =
 |
  600000 ++                                                                =
 |
  500000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++                                                      *      *. =
.*
  200000 ++*.*  *.   .**. .*.              *.     .**.   .*.*.* + +   .*  *=
 |
         *    :+  *.*    *   *.*.**.*.*.*.*  *.*.*    *.*      *   *.*     =
 |
  100000 ++   *                                                            =
 |
       0 ++----------------------------------------------------------------=
-+


                             sched_debug.cpu#22.ttwu_count

  1.6e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  1.4e+06 ++                                                           **.*=
.*
          |                                                            :   =
 |
  1.2e+06 ++                                                           :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**. .*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                      *                                         =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                      sched_debug.cfs_rq[22]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                                                  =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                            sched_debug.cpu#23.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
.*
  2.5e+06 ++                                                           * .*=
 |
          |                                                            :*  =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                                       .*.                :     =
 |
   500000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*   *.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#23.sched_count

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
.*
  2.5e+06 ++                                                           * .*=
 |
          |                                                            :*  =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                                       .*.                :     =
 |
   500000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*   *.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#23.sched_goidle

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                            * .*=
.*
  1.2e+06 ++                                                           :*  =
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |                     .*.               .*.                :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**   *.*.**.*.*.**.*   *.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#23.avg_idle

   1e+06 O+O-OO-O-O---OO-O-O-O-O-OO-O-O-O-OO-O-O-O-OO---O------------------=
-+
         |          O                                 O   O O              =
 |
  900000 ++                                                                =
 |
  800000 ++                                                                =
 |
         |                                                                 =
 |
  700000 ++                                                                =
 |
  600000 ++                                                                =
 |
         |                                                                 =
 |
  500000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                                                                 =
.*
  300000 ++                                                              .*=
 |
  200000 ++   *. .*     .*.      *   .*.*.                 .*.      .*. *  =
 |
         *. .*  *  + .**   *.   + :.*     **. .*.*.**.*. .*   **.*.*   *   =
 |
  100000 ++*--------*--------*-*--*----------*----------*------------------=
-+


                             sched_debug.cpu#23.ttwu_count

  1.6e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
.*
  1.4e+06 ++                                                           * .*=
 |
          |                                                            :*  =
 |
  1.2e+06 ++                                                           :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                        sched_debug.cfs_rq[23]:/.min_vruntime

  1e+07 ++-----------------------------------------------------------------=
-+
  9e+06 O+    OO   O O O  O O O O O OO O O O O OO O O O O OO               =
 |
        | O O    O       O                                                 =
 |
  8e+06 ++                                                                 =
 |
  7e+06 ++                                                                 =
 |
        *.   .**.*.       *.          .*.                .*         .*     =
 |
  6e+06 ++*.*      *.*.*.*  *.*.*.*.**   *.*.*.**.*.*.*.*  :.*.*.*.* :     =
 |
  5e+06 ++                                                 *         :     =
 |
  4e+06 ++                                                           :     =
 |
        |                                                             :    =
 |
  3e+06 ++                                                            :    =
 |
  2e+06 ++                                                            :    =
 |
        |                                                             :    =
 |
  1e+06 ++                                                            *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[23]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                     .*                           =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*  *.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                            sched_debug.cpu#24.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  2.5e+06 ++                                                           * .*=
.*
          |                                                            :*  =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                                                          :     =
 |
   500000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#24.sched_count

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  2.5e+06 ++                                                           **.*=
.*
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |                                                          :     =
 |
   500000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#24.sched_goidle

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                            * .*=
.*
  1.2e+06 ++                                                           :*  =
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |     .*.                        .*.                       :     =
 |
   200000 *+*.**   *.**.*.*.*.**.*.*.*.**.*   **.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#24.avg_idle

   1e+06 O+O-OO-O-O---OO-O-O-O---O--O-O---OO-O-O-O--O-O-O------------------=
-+
  900000 ++         O          O  O     O          O      O O              =
 |
         |                                                                 =
 |
  800000 ++                                                                =
 |
  700000 ++                                                                =
 |
         |                                                                 =
 |
  600000 ++                                                                =
 |
  500000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++     *                    .*.     *.           *.             .*=
.|
  200000 ++    + + .*.*   .*. .*.   *   *.* +  *.*. *.*. +  *. *.*.     *  =
 *
         *.*.**   *    *.*   *   * +       *       *    *     *    *.*.*   =
 |
  100000 ++                       *                                        =
 |
       0 ++----------------------------------------------------------------=
-+


                             sched_debug.cpu#24.ttwu_count

  1.6e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
.*
  1.4e+06 ++                                                           **.*=
 |
          |                                                            :   =
 |
  1.2e+06 ++                                                           :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                      sched_debug.cfs_rq[24]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                        .*.                                       =
 |
        *.*.*.**.*.*.*.*.**.*.*.*   **.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                            sched_debug.cpu#25.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
.*
  2.5e+06 ++                                                           * .*=
 |
          |                                                            :*  =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |  .*                                          .*.         :     =
 |
   500000 *+*  *.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**   *.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#25.sched_goidle

  1.4e+06 ++---------------------------------------------------------------=
-*
          |                                                              .*=
 |
  1.2e+06 ++                                                           **  =
 |
          |                                                            :   =
 |
    1e+06 ++                                                           :   =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |  .*                                          .*.         :     =
 |
   200000 *+*  *.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**   *.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#25.avg_idle

   1e+06 O+O-OO-O-O---OO-------O--O---O-O-OO-O-O-O-OO-O-O-O-O--------------=
-+
  900000 ++         O    O O        O                                      =
 |
         |                                                                 =
 |
  800000 ++                  O   O                                         =
 |
  700000 ++                                                                =
 |
         |                                                                 =
 |
  600000 ++                                                                =
 |
  500000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++ .*                                                         * .*=
.|
  200000 ++* :  *.                *. .*.*. *. .*.*.             .*.   + *  =
 *
         *    :+  *.*.**.*.*.*.*.*  *     *  *     **.*.*.*.*.**   *.*     =
 |
  100000 ++   *                                                            =
 |
       0 ++----------------------------------------------------------------=
-+


                             sched_debug.cpu#25.ttwu_count

  1.6e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
.*
  1.4e+06 ++                                                           * .*=
 |
          |                                                            :*  =
 |
  1.2e+06 ++                                                           :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                      sched_debug.cfs_rq[25]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                        .*.                                       =
 |
        *.*.*.**.*.*.*.*.**.*.*.*   **.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                            sched_debug.cpu#26.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  2.5e+06 ++                                                           * .*=
.*
          |                                                            :*  =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |     .*.                   .*                          .*.:     =
 |
   500000 *+*.**   *.**.*.*.*.**.*.*.*  *.*.*.**.*.*.*.**.*.*.*.**   *     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#26.sched_count

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                               *=
.*
  2.5e+06 ++                                                           * + =
 |
          |                                                            :*  =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          |     .*.                   .*                          .*.:     =
 |
   500000 *+*.**   *.**.*.*.*.**.*.*.*  *.*.*.**.*.*.*.**.*.*.*.**   *     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#26.sched_goidle

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                              .*=
.*
  1.2e+06 ++                                                           **  =
 |
          |                                                            :   =
 |
    1e+06 ++                                                           :   =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          |     .*.                   .*                          .*.:     =
 |
   200000 *+*.**   *.**.*.*.*.**.*.*.*  *.*.*.**.*.*.*.**.*.*.*.**   *     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#26.avg_idle

   1e+06 O+--OO-O--------O-O-O-O-OO-O-O-O-OO-O-O-O-O--O-O-O-O--------------=
-+
         | O      O O O                             O                      =
 |
  900000 ++            O                                                   =
 |
  800000 ++                                                                =
 |
         |                                                                 =
 |
  700000 ++                                                                =
 |
  600000 ++                                                                =
 |
         |                                                                 =
 |
  500000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++                                                                =
 |
  200000 *+    .*.*       .*   *.      .*.**.*.                     .*.* .*=
.|
         | *.**    + .**.*  + +  **. .*        *.   *.*.*.*.*.**.*.*    *  =
 *
  100000 ++---------*--------*------*------------*-*-----------------------=
-+


                             sched_debug.cpu#26.ttwu_count

  1.6e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
.*
  1.4e+06 ++                                                           * .*=
 |
          |                                                            :*  =
 |
  1.2e+06 ++                                                           :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+ .**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          | *                                                              =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                      sched_debug.cfs_rq[26]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                        .*.                                       =
 |
        *.*.*.**.*.*.*.*.**.*.*.*   **.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                            sched_debug.cpu#27.nr_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  2.5e+06 ++                                                           **.*=
.*
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          *.                      .*.                 .*             :     =
 |
   500000 ++*.**.*.*.**.*.*.*.**.*   *.**.*.*.**.*.*.*  *.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#27.sched_count

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
.*
  2.5e+06 ++                                                           **.*=
 |
          |                                                            :   =
 |
          |                                                            :   =
 |
    2e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
  1.5e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
    1e+06 ++                                                          :    =
 |
          |                                                          :     =
 |
          *.                      .*.   *.            .*             :     =
 |
   500000 ++*.**.*.*.**.*.*.*.**.*   *.*  *.*.**.*.*.*  *.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                            sched_debug.cpu#27.sched_goidle

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                            * .*=
.*
  1.2e+06 ++                                                           :*  =
 |
          |                                                            :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
          |                                                           :    =
 |
   400000 ++                                                         :     =
 |
          *.                      .*.                 .*             :     =
 |
   200000 ++*.**.*.*.**.*.*.*.**.*   *.**.*.*.**.*.*.*  *.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                             sched_debug.cpu#27.avg_idle

   1e+06 O+O-OO-O-O---OO-O-O-O-O-OO-O-O---OO-O-O-O-OO-O-O-O-O--------------=
-+
  900000 ++                             O                                  =
 |
         |                                                                 =
 |
  800000 ++         O                                                      =
 |
  700000 ++                                                                =
 |
         |                                                                 =
 |
  600000 ++                                                                =
 |
  500000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                                                                *=
.|
  300000 ++    .*                                                *       + =
 *
  200000 ++*. *  +          .*.*.    .*.     *.*.*.* .*.    *.  + +   .**  =
 |
         *   *    *.*.**.*.*     * .*   *.* +       *   *. +  **   *.*     =
 |
  100000 ++                       *        *              *                =
 |
       0 ++----------------------------------------------------------------=
-+


                             sched_debug.cpu#27.ttwu_count

  1.6e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
.*
  1.4e+06 ++                                                           **.*=
 |
          |                                                            :   =
 |
  1.2e+06 ++                                                           :   =
 |
    1e+06 ++                                                          :    =
 |
          |                                                           :    =
 |
   800000 ++                                                          :    =
 |
          |                                                           :    =
 |
   600000 ++                                                          :    =
 |
   400000 ++                                                         :     =
 |
          |                                                          :     =
 |
   200000 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 O+O-OO-O-O-OO-O-O-O-OO-O-O-O-OO-O-O-OO-O-O-O-OO-O-O--------------=
-+


                      sched_debug.cfs_rq[27]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                        .*.                                       =
 |
        *.*.*.**.*.*.*.*.**.*.*.*   **.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[28]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                                                  =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq[29]:/.exec_clock

  180000 ++----------------------------------------------------------------=
-+
         O            OO       O  O O O O    O   O O    O   O              =
 |
  160000 ++O OO O O O    O O O   O        OO   O    O O   O                =
 |
  140000 *+    .*.*.   *. .*.                   .*. *.   .*.        .*     =
 |
         | *.**     *.*  *   *.*.**.*.*.*.**.*.*   *  *.*   *.**.*.* :     =
 |
  120000 ++                                                          :     =
 |
  100000 ++                                                           :    =
 |
         |                                                            :    =
 |
   80000 ++                                                           :    =
 |
   60000 ++                                                           :    =
 |
         |                                                            :    =
 |
   40000 ++                                                            :   =
 |
   20000 ++                                                            :   =
 |
         |                                                             **.*=
.*
       0 ++----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[29]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                                                  =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[30]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                                                  =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[31]:/.min_vruntime

  1e+07 ++-----------------------------------------------------------------=
-+
  9e+06 O+    OO   O O O  O O O O O OO O O O O OO O O   O OO               =
 |
        | O O    O       O                                                 =
 |
  8e+06 ++                                            O                    =
 |
  7e+06 ++                                                                 =
 |
        |                                                                  =
 |
  6e+06 *+ .*.**.*.*.*.*.    .*.*.   *.*. .*.*.**.*.*.   .**. .*.*.*.*     =
 |
  5e+06 ++*              **.*     *.*    *            *.*    *       :     =
 |
  4e+06 ++                                                           :     =
 |
        |                                                            :     =
 |
  3e+06 ++                                                            :    =
 |
  2e+06 ++                                                            :    =
 |
        |                                                             :    =
 |
  1e+06 ++                                                            *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[31]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                                                  =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[32]:/.min_vruntime

  1e+07 ++--------------------O---O----------------------------------------=
-+
  9e+06 O+    OO   O O O  O         OO O O O   O  O   O O OO               =
 |
        | O O    O       O  O   O            O  O   O                      =
 |
  8e+06 ++                                                                 =
 |
  7e+06 ++                                                                 =
 |
        |                                                                  =
 |
  6e+06 *+*. .**.*.   .*. *.*.*.*.*.**.*. .*.   *.*.*. .*.**.*. .*. .*     =
 |
  5e+06 ++  *      *.*   *               *   *.*      *        *   * :     =
 |
  4e+06 ++                                                           :     =
 |
        |                                                            :     =
 |
  3e+06 ++                                                            :    =
 |
  2e+06 ++                                                            :    =
 |
        |                                                             :    =
 |
  1e+06 ++                                                            *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[32]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                                                  =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq[33]:/.exec_clock

  180000 ++----------------------------------------------------------------=
-+
         O      O   O OO       O  O O O O          O    O   O              =
 |
  160000 ++O OO   O      O O O   O        OO O O O  O O   O                =
 |
  140000 *+   *.*.*.      .*.          .*.      .*. *.   .*. .* .*. .*     =
 |
         | *.*      *.**.*   *.*.**.*.*   **.*.*   *  *.*   *  *   * :     =
 |
  120000 ++                                                          :     =
 |
  100000 ++                                                           :    =
 |
         |                                                            :    =
 |
   80000 ++                                                           :    =
 |
   60000 ++                                                           :    =
 |
         |                                                            :    =
 |
   40000 ++                                                            :   =
 |
   20000 ++                                                            :   =
 |
         |                                                             **.*=
.*
       0 ++----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[33]:/.min_vruntime

  1e+07 ++--------------------O---O----------------------------------------=
-+
  9e+06 O+    OO   O O O  O O   O   OO O          O O O O OO               =
 |
        | O O    O       O               O O   O                           =
 |
  8e+06 ++                                   O  O                          =
 |
  7e+06 ++                                                                 =
 |
        |                                                                  =
 |
  6e+06 *+*.*.**.*. .*.*. *. .*.*.*. *.   .*.*.**. .*.*.*.**.*.*.*. .*     =
 |
  5e+06 ++         *     *  *       *  *.*        *                * :     =
 |
  4e+06 ++                                                           :     =
 |
        |                                                            :     =
 |
  3e+06 ++                                                            :    =
 |
  2e+06 ++                                                            :    =
 |
        |                                                             :    =
 |
  1e+06 ++                                                            *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[33]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                                                  =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq[34]:/.exec_clock

  180000 ++----------------------------------------------------------------=
-+
         O      O   O OO       O  O O O O          O    O   O              =
 |
  160000 ++O OO   O      O O O   O        OO O O O  O O   O                =
 |
  140000 *+      .*.      .*.*.      .*.*.      .*. *.   .*. .* .*. .*     =
 |
         | *.**.*   *.**.*     *.**.*     **.*.*   *  *.*   *  *   * :     =
 |
  120000 ++                                                          :     =
 |
  100000 ++                                                           :    =
 |
         |                                                            :    =
 |
   80000 ++                                                           :    =
 |
   60000 ++                                                           :    =
 |
         |                                                            :    =
 |
   40000 ++                                                            :   =
 |
   20000 ++                                                            :   =
 |
         |                                                             **.*=
.*
       0 ++----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[34]:/.min_vruntime

  1e+07 ++--------------------O---O----------------------------------------=
-+
  9e+06 O+    OO   O O O  O O   O   OO O O O   O  O O O O OO               =
 |
        | O O    O       O                                                 =
 |
  8e+06 ++                                   O  O                          =
 |
  7e+06 ++                                                                 =
 |
        |                                                                  =
 |
  6e+06 *+*.*.**.*.*.*.   *.*.*.     *.*.*. .*.**.*.*.   .**.*.*.*.*.      =
 |
  5e+06 ++             *.*      *.*.*      *          *.*            *     =
 |
  4e+06 ++                                                           :     =
 |
        |                                                            :     =
 |
  3e+06 ++                                                            :    =
 |
  2e+06 ++                                                            :    =
 |
        |                                                             :    =
 |
  1e+06 ++                                                            *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[34]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                                                  =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq[35]:/.exec_clock

  180000 ++----------------------------------------------------------------=
-+
         O      O     OO       O  O O O O    O   O O    O   O              =
 |
  160000 ++O OO   O O    O O O   O        OO   O    O O   O                =
 |
  140000 *+   *.*.*.      .*.*.      .*.*.          *.   .*. .* .*. .*     =
 |
         | *.*      *.**.*     *.**.*     **.*.*.*.*  *.*   *  *   * :     =
 |
  120000 ++                                                          :     =
 |
  100000 ++                                                           :    =
 |
         |                                                            :    =
 |
   80000 ++                                                           :    =
 |
   60000 ++                                                           :    =
 |
         |                                                            :    =
 |
   40000 ++                                                            :   =
 |
   20000 ++                                                            :   =
 |
         |                                                             **.*=
.*
       0 ++----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[35]:/.min_vruntime

  1e+07 ++-----------------------------------------------------------------=
-+
  9e+06 O+    OO     O O  O O O O O OO O O O O OO O O O O OO               =
 |
        | O O    O O     O                                                 =
 |
  8e+06 ++                                                                 =
 |
  7e+06 ++                                                                 =
 |
        |                                                .*                =
 |
  6e+06 *+*. .**.*.*.*.*. *.*. .*.*.  .*.   .*. *. .*.*.*  :.*. .*. .*     =
 |
  5e+06 ++  *            *    *     **   *.*   *  *        *   *   * :     =
 |
  4e+06 ++                                                           :     =
 |
        |                                                            :     =
 |
  3e+06 ++                                                            :    =
 |
  2e+06 ++                                                            :    =
 |
        |                                                             :    =
 |
  1e+06 ++                                                            *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[35]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                        .*.                                       =
 |
        *.*.*.**.*.*.*.*.**.*.*.*   **.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq[36]:/.exec_clock

  180000 ++----------------------------------------------------------------=
-+
         O      O   O OO       O  O O O O          O    O   O              =
 |
  160000 ++O OO   O      O O O   O        OO O O O  O O   O                =
 |
  140000 *+   *.*.*.      .*.*.      .*.*. *.   .*. *.   .*.    .*. .*     =
 |
         | *.*      *.**.*     *.**.*     *  *.*   *  *.*   *.**   * :     =
 |
  120000 ++                                                          :     =
 |
  100000 ++                                                           :    =
 |
         |                                                            :    =
 |
   80000 ++                                                           :    =
 |
   60000 ++                                                           :    =
 |
         |                                                            :    =
 |
   40000 ++                                                            :   =
 |
   20000 ++                                                            :   =
 |
         |                                                             **.*=
.*
       0 ++----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[36]:/.min_vruntime

  1e+07 ++--------------------O---O----------------------------------------=
-+
  9e+06 O+    OO   O O O  O         OO O O O   O  O O O O OO               =
 |
        | O O    O       O  O   O            O  O                          =
 |
  8e+06 ++                                                                 =
 |
  7e+06 ++                                                                 =
 |
        |                                                           .*     =
 |
  6e+06 *+ .*.**.*.*.     *.*.*.     *.*.*. .*.**. .*.*.*.**.*. .*.* :     =
 |
  5e+06 ++*          *.*.*      *.*.*      *      *            *     :     =
 |
  4e+06 ++                                                           :     =
 |
        |                                                             :    =
 |
  3e+06 ++                                                            :    =
 |
  2e+06 ++                                                            :    =
 |
        |                                                             :    =
 |
  1e+06 ++                                                            *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[36]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                        .*.                                       =
 |
        *.*.*.**.*.*.*.*.**.*.*.*   **.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[37]:/.min_vruntime

  1e+07 ++--------------------O---O----------------------------------------=
-+
  9e+06 O+    OO   O O O  O O   O   OO O O O O OO O O O O OO               =
 |
        | O O    O       O                                                 =
 |
  8e+06 ++                                                                 =
 |
  7e+06 ++                                                                 =
 |
        |                                                                  =
 |
  6e+06 ++*.*.**.*.*.*.*. *.*.*. .*. *.   .*.*.**.*.   .*.**.*. .*. .*     =
 |
  5e+06 *+               *      *   *  *.*          *.*        *   * :     =
 |
  4e+06 ++                                                           :     =
 |
        |                                                            :     =
 |
  3e+06 ++                                                            :    =
 |
  2e+06 ++                                                            :    =
 |
        |                                                             :    =
 |
  1e+06 ++                                                            *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[37]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                        .*.                                       =
 |
        *.*.*.**.*.*.*.*.**.*.*.*   **.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[38]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                                                  =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[39]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                                                  =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[40]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                                                  =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[41]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                                                                  =
 |
        *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[42]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                      .*.                                         =
 |
        *.*.*.**.*.*.*.*.**.*.*   *.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[43]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                      .*.                                         =
 |
        *.*.*.**.*.*.*.*.**.*.*   *.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq[44]:/.exec_clock

  180000 ++----------------------------------------------------------------=
-+
         O      O              O  O O O O          O    O   O              =
 |
  160000 ++O OO   O O OO O O O   O        OO O O O  O O   O                =
 |
  140000 ++      .*.                                                       =
 |
         *.*.**.*   *.**.*.*.*.*.**.*.*.*.**.*.*.*.**.*.*.*.*.**.*.*.*     =
 |
  120000 ++                                                          :     =
 |
  100000 ++                                                          :     =
 |
         |                                                            :    =
 |
   80000 ++                                                           :    =
 |
   60000 ++                                                           :    =
 |
         |                                                            :    =
 |
   40000 ++                                                            :   =
 |
   20000 ++                                                            :   =
 |
         |                                                             **.*=
.*
       0 ++----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[44]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                      .*.                                         =
 |
        *.*.*.**.*.*.*.*.**.*.*   *.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[45]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                      .*.                                         =
 |
        *.*.*.**.*.*.*.*.**.*.*   *.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[46]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                      .*.                                         =
 |
        *.*.*.**.*.*.*.*.**.*.*   *.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[47]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                      .*.                                         =
 |
        *.*.*.**.*.*.*.*.**.*.*   *.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[48]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                      .*.                                         =
 |
        *.*.*.**.*.*.*.*.**.*.*   *.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq[49]:/.exec_clock

  180000 ++----------------------------------------------------------------=
-+
         O      O   O O        O  O O O O    O   O O    O   O              =
 |
  160000 ++O OO   O    O O O O   O        OO   O    O O   O                =
 |
  140000 ++                                                                =
 |
         *.*.**.*.*.*.**.*.*.*.*.**.*.*.*.**.*.*.*.**.*.*.*.*.**.*.*.*     =
 |
  120000 ++                                                          :     =
 |
  100000 ++                                                          :     =
 |
         |                                                            :    =
 |
   80000 ++                                                           :    =
 |
   60000 ++                                                           :    =
 |
         |                                                            :    =
 |
   40000 ++                                                            :   =
 |
   20000 ++                                                            :   =
 |
         |                                                             **.*=
.*
       0 ++----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[49]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                      .*.                                         =
 |
        *.*.*.**.*.*.*.*.**.*.*   *.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[50]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                      .*.                                         =
 |
        *.*.*.**.*.*.*.*.**.*.*   *.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq[51]:/.exec_clock

  180000 ++----------------------------------------------------------------=
-+
         O      O   O OO       O  O O O O    O   O O    O   O              =
 |
  160000 ++O OO   O      O O O   O        OO   O    O O   O                =
 |
  140000 ++                                         *.                     =
 |
         *.*.**.*.*.*.**.*.*.*.*.**.*.*.*.**.*.*.*.*  *.*.*.*.**.*.*.*     =
 |
  120000 ++                                                          :     =
 |
  100000 ++                                                          :     =
 |
         |                                                            :    =
 |
   80000 ++                                                           :    =
 |
   60000 ++                                                           :    =
 |
         |                                                            :    =
 |
   40000 ++                                                            :   =
 |
   20000 ++                                                            :   =
 |
         |                                                             **.*=
.*
       0 ++----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[51]:/.min_vruntime

  1e+07 O+--------------------O---O----------------------------------------=
-+
  9e+06 ++    OO   O O O  O O   O   OO O O O O OO O O O O OO               =
 |
        | O O    O       O                                                 =
 |
  8e+06 ++                                                                 =
 |
  7e+06 ++                                                                 =
 |
        |                                                                  =
 |
  6e+06 *+*.*.**.*.       *. .*.*.*. *.*.*.     *. .*.   .*   .*.   .*     =
 |
  5e+06 ++         *.*.*.*  *       *      *.*.*  *   *.*  :.*   *.* :     =
 |
  4e+06 ++                                                 *         :     =
 |
        |                                                            :     =
 |
  3e+06 ++                                                            :    =
 |
  2e+06 ++                                                            :    =
 |
        |                                                             :    =
 |
  1e+06 ++                                                            *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[51]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                      .*.                                         =
 |
        *.*.*.**.*.*.*.*.**.*.*   *.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[52]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                      .*.                                         =
 |
        *.*.*.**.*.*.*.*.**.*.*   *.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq[53]:/.exec_clock

  180000 ++----------------------------------------------------------------=
-+
         O      O   O OO       O  O O   O    O   O O    O   O              =
 |
  160000 ++O OO   O      O O O   O    O   OO   O    O O   O                =
 |
  140000 ++                                                                =
 |
         *.*.**.*.*.*.**.*.*.*.*.**.*.*.*.**.*.*.*.**.*.*.*.*.**.*.*.*     =
 |
  120000 ++                                                          :     =
 |
  100000 ++                                                          :     =
 |
         |                                                            :    =
 |
   80000 ++                                                           :    =
 |
   60000 ++                                                           :    =
 |
         |                                                            :    =
 |
   40000 ++                                                            :   =
 |
   20000 ++                                                            :   =
 |
         |                                                             **.*=
.*
       0 ++----------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[53]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                      .*.                                         =
 |
        *.*.*.**.*.*.*.*.**.*.*   *.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq[54]:/.exec_clock

  180000 ++----------------------------------------------------------------=
-+
         O      O   O OO       O  O   O O    O   O O    O   O              =
 |
  160000 ++O OO   O      O O O   O  O     OO   O    O O   O                =
 |
  140000 ++                                                                =
 |
         *.*.**.*.*.*.**.*.*.*.*.**.*.*.*.**.*.*.*.**.*.*.*.*.**.*.*.*     =
 |
  120000 ++                                                          :     =
 |
  100000 ++                                                          :     =
 |
         |                                                            :    =
 |
   80000 ++                                                           :    =
 |
   60000 ++                                                           :    =
 |
         |                                                            :    =
 |
   40000 ++                                                            :   =
 |
   20000 ++                                                            :   =
 |
         |                                                             **.*=
.*
       0 ++----------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[54]:/.tg_runnable_contrib

  1000 ++---------------O----O---O-----------------------------------------=
-+
   900 O+O O OO O O O O   O O  O   O O O OO O O O O O OO O O               =
 |
       |            *                                                      =
 |
   800 ++ .*.*     + :     .* .*.*.         *. .*   *.**.*.                =
 |
   700 *+*    :.*.*  :   .*  *     *.*.*.* +  *  + +       *.*.*.*.*.*     =
 |
       |      *       *.*                 *       *                  :     =
 |
   600 ++                                                            :     =
 |
   500 ++                                                            :     =
 |
   400 ++                                                            :     =
 |
       |                                                              :    =
 |
   300 ++                                                             :    =
 |
   200 ++                                                             :    =
 |
       |                                                              :    =
 |
   100 ++                                                             :    =
 |
     0 ++-------------------------------------------------------------*-*-*=
-*


                      sched_debug.cfs_rq[54]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                      .*.                                         =
 |
        *.*.*.**.*.*.*.*.**.*.*   *.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[54]:/.avg->runnable_avg_sum

  50000 ++-----------------------------------------------------------------=
-+
  45000 ++               O    O   O                                        =
 |
        O O O OO O O O O  O O   O   OO O O O O OO O O O O OO               =
 |
  40000 ++          .*                                                     =
 |
  35000 ++ .*.*   .*  +    .*. .*.*.        .*. *. .*.*.*.*                =
 |
        *.*    *.*     *. *   *     **.*.*.*   *  *        *.*.*.*.*.*     =
 |
  30000 ++               *                                           :     =
 |
  25000 ++                                                           :     =
 |
  20000 ++                                                           :     =
 |
        |                                                            :     =
 |
  15000 ++                                                            :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             :    =
 |
   5000 ++                                                            :    =
 |
      0 ++------------------------------------------------------------*-*-*=
-*


                      sched_debug.cfs_rq[55]:/.tg->runnable_avg

  60000 ++-----------------------------------------------------------------=
-+
        |                O  O   O                   O     O                =
 |
  50000 O+O O OO O O O O  O   O   O OO O O O O OO O   O O  O               =
 |
        |                      .*.                                         =
 |
        *.*.*.**.*.*.*.*.**.*.*   *.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*     =
 |
  40000 ++                                                           :     =
 |
        |                                                            :     =
 |
  30000 ++                                                           :     =
 |
        |                                                            :     =
 |
  20000 ++                                                            :    =
 |
        |                                                             :    =
 |
        |                                                             :    =
 |
  10000 ++                                                            :    =
 |
        |                                                             *.*.*=
.*
      0 ++-----------------------------------------------------------------=
-+


                        numa-vmstat.node0.nr_isolated_file

  800 ++-------------------------------------------------------------------=
-+
      |                                                              .*.*.*=
.*
  700 *+            .*.   .*.   *.     .*.*.   .*.* .*.*. .*.*.*. .**      =
 |
      | *.*.*.**.*.*   *.*   *.*  *.*.*     *.*    *     *       *         =
 |
  600 ++                                                                   =
 |
      |                                                                    =
 |
  500 ++                                                                   =
 |
      |                                                                    =
 |
  400 ++                                                                   =
 |
      |                                                                    =
 |
  300 ++                                                                   =
 |
      |                                                                    =
 |
  200 ++O   O  O O     O O          O     O O O O  O     O                 =
 |
      O   O   O    O O     O O OO O   O O         O  O O   O               =
 |
  100 ++-------------------------------------------------------------------=
-+


                              numa-vmstat.node0.numa_hit

    4e+07 ++---------------------------------------------------------------=
-+
          O                   OO O O      O             O                  =
 |
  3.5e+07 ++   O O   OO O   O        O OO     O  O O O O  O O              =
 |
          | O O    O      O                 O  O                           =
 |
          |                                                                =
 |
    3e+07 ++                                                               =
 |
          |                                                                =
 |
  2.5e+07 ++                                                               =
 |
          |                                                                =
 |
    2e+07 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
  1.5e+07 ++                                                          .**.*=
.*
          *.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
    1e+07 ++---------------------------------------------------------------=
-+


                             numa-vmstat.node0.numa_local

    4e+07 ++---------------------------------------------------------------=
-+
          O                   OO O O                    O                  =
 |
  3.5e+07 ++   O O   OO O   O        O OO O   O  O O O O  O O              =
 |
          | O O    O      O                 O  O                           =
 |
          |                                                                =
 |
    3e+07 ++                                                               =
 |
          |                                                                =
 |
  2.5e+07 ++                                                               =
 |
          |                                                                =
 |
    2e+07 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
  1.5e+07 ++                                                            *.*=
.*
          *.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.*   =
 |
    1e+07 ++---------------------------------------------------------------=
-+


                         numa-vmstat.node0.workingset_refault

  3.5e+07 ++---------------------------------------------------------------=
-+
          O                                                                =
 |
    3e+07 ++         O        OO O O    O O             O                  =
 |
          | O OO O O  O O O O        O O    O OO O O O O  O O              =
 |
  2.5e+07 ++                                                               =
 |
          |                                                                =
 |
    2e+07 ++                                                               =
 |
          |                                                                =
 |
  1.5e+07 ++                                                               =
 |
          |                                                                =
 |
    1e+07 ++                                                               =
 |
          |                                                           .**.*=
.*
    5e+06 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 ++---------------------------------------------------------------=
-+


                         numa-vmstat.node0.workingset_activate

    2e+07 ++---------------------------------------------------------------=
-+
          O                                             O                  =
 |
  1.8e+07 ++     O   OO O     OO O O O OO O   O  O O      O O              =
 |
  1.6e+07 ++O OO   O      O O               O  O     O O                   =
 |
          |                                                                =
 |
  1.4e+07 ++                                                               =
 |
  1.2e+07 ++                                                               =
 |
          |                                                                =
 |
    1e+07 ++                                                               =
 |
    8e+06 ++                                                               =
 |
          |                                                                =
 |
    6e+06 ++                                                            *.*=
.*
    4e+06 ++                                                          .*   =
 |
          *.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
    2e+06 ++---------------------------------------------------------------=
-+


                        numa-vmstat.node1.nr_isolated_file

  800 ++-------------------------------------------------------------------=
-+
      |                                               .*.     .*.      .*.*=
.*
  700 ++   .*. *.*. .*. .*.*.*. *.*.*.*.*.*.*.*.*.* .*   *.*.*   *.**.*    =
 |
      *.*.*   *    *   *       *                   *                       =
 |
  600 ++                                                                   =
 |
      |                                                                    =
 |
  500 ++                                                                   =
 |
      |                                                                    =
 |
  400 ++                                                                   =
 |
      |                                                                    =
 |
  300 ++                                                                   =
 |
      |                                           O                        =
 |
  200 ++  O O  O O   O O                O          O       O               =
 |
      O O     O    O     O O O OO O O O   O O O O    O O O                 =
 |
  100 ++-------------------------------------------------------------------=
-+


                              numa-vmstat.node1.numa_hit

    4e+07 ++---------------------------------------------------------------=
-+
          O          O         O   O    O               O                  =
 |
  3.5e+07 ++   O O O  O O   O O  O   O O  O   O  O O O O  O O              =
 |
          | O O           O                 O  O                           =
 |
          |                                                                =
 |
    3e+07 ++                                                               =
 |
          |                                                                =
 |
  2.5e+07 ++                                                               =
 |
          |                                                                =
 |
    2e+07 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
  1.5e+07 ++                                                          .**.*=
.*
          *.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
    1e+07 ++---------------------------------------------------------------=
-+


                             numa-vmstat.node1.numa_local

    4e+07 ++---------------------------------------------------------------=
-+
          O                    O   O    O               O                  =
 |
  3.5e+07 ++   O O O OO O   O O  O   O O  O   O  O O O O  O O              =
 |
          | O O           O                 O  O                           =
 |
          |                                                                =
 |
    3e+07 ++                                                               =
 |
          |                                                                =
 |
  2.5e+07 ++                                                               =
 |
          |                                                                =
 |
    2e+07 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
  1.5e+07 ++                                                           **.*=
.*
          *.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*. +    =
 |
    1e+07 ++---------------------------------------------------------*-----=
-+


                         numa-vmstat.node1.workingset_refault

  3.5e+07 ++---------------------------------------------------------------=
-+
          O                                                                =
 |
    3e+07 ++     O   OO       OO O O O  O O        O    O O                =
 |
          | O OO   O    O O O          O    O OO O   O O    O              =
 |
  2.5e+07 ++                                                               =
 |
          |                                                                =
 |
    2e+07 ++                                                               =
 |
          |                                                                =
 |
  1.5e+07 ++                                                               =
 |
          |                                                                =
 |
    1e+07 ++                                                               =
 |
          |                                                           .**.*=
.*
    5e+06 *+*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
          |                                                                =
 |
        0 ++---------------------------------------------------------------=
-+


                         numa-vmstat.node1.workingset_activate

    2e+07 ++---------------------------------------------------------------=
-+
          O                    O   O                    O                  =
 |
  1.8e+07 ++     O   OO O     O  O   O OO O   O  O O O    O O              =
 |
  1.6e+07 ++O OO   O      O O               O  O       O                   =
 |
          |                                                                =
 |
  1.4e+07 ++                                                               =
 |
  1.2e+07 ++                                                               =
 |
          |                                                                =
 |
    1e+07 ++                                                               =
 |
    8e+06 ++                                                               =
 |
          |                                                                =
 |
    6e+06 ++                                                           **.*=
.*
    4e+06 ++                                                          +    =
 |
          *.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*     =
 |
    2e+06 ++---------------------------------------------------------------=
-+


                                cpuidle.POLL.usage

  3000 ++-----------------*------------------------------------------------=
-+
       |      *.          :+              *            *.               *  =
 |
  2500 *+  *. : *        :  *   .*.       :+           : *              :: =
 |
       |+ +  *   + .*.   :   *.*   *     :  *. .*.*.   :  + .*.*   *   : : =
 |
       | *        *   *.*           + .*.*    *     *.:    *    + + +  :  :=
 |
  2000 ++                            *                *          *   * :  *=
 |
       |                                                              :    =
+|
  1500 ++                                                             *    =
 *
       |                                                                   =
 |
  1000 ++                                                                  =
 |
       |                                                                   =
 |
       |                                                                   =
 |
   500 ++                                                                  =
 |
       |                                                                   =
 |
     0 O+O-O-OO-O-O-O-O-O-O-OO-O-O-O-O-O-OO-O-O-O-O-O-OO-O-O---------------=
-+


                     perf-profile.cpu-cycles.start_secondary

  20 ++--------------------------------------------------------------------=
-+
  18 ++                                                               *    =
 |
     |                                                                :+   =
 |
  16 ++                                                               : *  =
 |
  14 ++                                                               : :  =
 |
     |                                                               :  :  =
 |
  12 ++                                                              :   : =
 |
  10 ++                                                              :   : =
 |
   8 ++                                                              :   : =
 |
     |                                                               :   : =
 |
   6 ++                                                              :    :=
 |
   4 ++                                                             :     :=
.*
     |                                                              :     *=
 |
   2 ++         .*                                                  :      =
 |
   0 O+O-O-O-O-O-OO-O-O-O-O-O-O-O-O-O-O-OO-O-O-O-O-O-O-O-O-O-*-**-*-*------=
-+


            perf-profile.cpu-cycles.cpu_startup_entry.start_secondary

  20 ++--------------------------------------------------------------------=
-+
  18 ++                                                               *    =
 |
     |                                                                :+   =
 |
  16 ++                                                               : *  =
 |
  14 ++                                                               : :  =
 |
     |                                                               :  :  =
 |
  12 ++                                                              :   : =
 |
  10 ++                                                              :   : =
 |
   8 ++                                                              :   : =
 |
     |                                                               :   : =
 |
   6 ++                                                              :    :=
 |
   4 ++                                                             :     :=
.*
     |                                                              :     *=
 |
   2 ++         .*                                                  :      =
 |
   0 O+O-O-O-O-O-OO-O-O-O-O-O-O-O-O-O-O-OO-O-O-O-O-O-O-O-O-O-*-**-*-*------=
-+


     perf-profile.cpu-cycles.cpuidle_enter.cpu_startup_entry.start_secondary

  9 ++---------------------------------------------------------------------=
-+
    |                                                                 *.   =
 |
  8 ++                                                                : *  =
 |
  7 ++                                                                : :  =
 |
    |                                                                 : :  =
 |
  6 ++                                                               :   : =
 |
  5 ++                                                               :   : =
 |
    |                                                                :   : =
 |
  4 ++                                                               :   : =
 |
  3 ++                                                               :    :=
 |
    |                                                                :    :=
.*
  2 ++                                                              :     *=
 |
  1 ++                                                              :      =
 |
    *.*.       .*. .*.        .*.       .*.     .*.                .*      =
 |
  0 O+O-O-O-O-O-O-O-O-OO-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-OO-*-*-*-*--------=
-+


 	[*] bisect-good sample
	[O] bisect-bad  sample

To reproduce:

	apt-get install ruby ruby-oj
	git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
	cd lkp-tests
	bin/setup-local job.yaml # the job file attached in this email
	bin/run-local   job.yaml


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Huang, Ying


_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============5532160473887124202==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB2bS1zY2FsYWJpbGl0eQpkZWZhdWx0X21vbml0b3JzOgogIHdhaXQ6IHBy
ZS10ZXN0CiAgdXB0aW1lOiAKICBpb3N0YXQ6IAogIHZtc3RhdDogCiAgbnVtYS1udW1hc3RhdDog
CiAgbnVtYS12bXN0YXQ6IAogIG51bWEtbWVtaW5mbzogCiAgcHJvYy12bXN0YXQ6IAogIHByb2Mt
c3RhdDogCiAgbWVtaW5mbzogCiAgc2xhYmluZm86IAogIGludGVycnVwdHM6IAogIGxvY2tfc3Rh
dDogCiAgbGF0ZW5jeV9zdGF0czogCiAgc29mdGlycXM6IAogIGJkaV9kZXZfbWFwcGluZzogCiAg
ZGlza3N0YXRzOiAKICBjcHVpZGxlOiAKICBjcHVmcmVxOiAKICB0dXJib3N0YXQ6IAogIHNjaGVk
X2RlYnVnOgogICAgaW50ZXJ2YWw6IDEwCiAgcG1ldGVyOiAKZGVmYXVsdF93YXRjaGRvZ3M6CiAg
d2F0Y2gtb29tOiAKICB3YXRjaGRvZzogCmNwdWZyZXFfZ292ZXJub3I6Ci0gcGVyZm9ybWFuY2UK
Y29tbWl0OiAwNDMyNTZkMDU5YzIzMDU2MzdlMThmZTc5NmFlNmIwZmFjYzhiZTQyCm1vZGVsOiBH
cmFudGxleSBIYXN3ZWxsLUVQCm5yX2NwdTogNTYKbWVtb3J5OiA2NEcKaGRkX3BhcnRpdGlvbnM6
IApzd2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAKcGVyZi1wcm9maWxlOiAKcnVu
dGltZTogMzAwcwpzaXplOiAKdm0tc2NhbGFiaWxpdHk6CiAgdGVzdDoKICAtIG1tYXAtcHJlYWQt
cmFuZAp0ZXN0Ym94OiBsa3AtaHN3MDEKdGJveF9ncm91cDogbGtwLWhzdzAxCmtjb25maWc6IHg4
Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNC0xMi0xOSAyMjowMDozMS4xMDMxNDk2NjMgKzA4
OjAwCmhlYWRfY29tbWl0OiAwNDMyNTZkMDU5YzIzMDU2MzdlMThmZTc5NmFlNmIwZmFjYzhiZTQy
CmJhc2VfY29tbWl0OiBiMjc3NmJmNzE0OWJkZGQxZjQxNjFmMTRmNzk1MjBmMTdmYzFkNzFkCmJy
YW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTQxMjE5MjMKa2VybmVsOiAiL2tlcm5l
bC94ODZfNjQtcmhlbC8wNDMyNTZkMDU5YzIzMDU2MzdlMThmZTc5NmFlNmIwZmFjYzhiZTQyL3Zt
bGludXotMy4xOC4wLWcwNDMyNTZkIgp1c2VyOiBsa3AKcXVldWU6IGN5Y2xpYwpyb290ZnM6IGRl
Ymlhbi14ODZfNjQuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC9sa3AtaHN3MDEvdm0tc2NhbGFi
aWxpdHkvcGVyZm9ybWFuY2UtMzAwcy1tbWFwLXByZWFkLXJhbmQvZGViaWFuLXg4Nl82NC5jZ3ov
eDg2XzY0LXJoZWwvMDQzMjU2ZDA1OWMyMzA1NjM3ZTE4ZmU3OTZhZTZiMGZhY2M4YmU0Mi8wIgpq
b2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL2xrcC1oc3cwMS9jeWNsaWNfdm0tc2NhbGFiaWxpdHkt
cGVyZm9ybWFuY2UtMzAwcy1tbWFwLXByZWFkLXJhbmQteDg2XzY0LXJoZWwtSEVBRC0wNDMyNTZk
MDU5YzIzMDU2MzdlMThmZTc5NmFlNmIwZmFjYzhiZTQyLTAueWFtbCIKZGVxdWV1ZV90aW1lOiAy
MDE0LTEyLTIwIDAwOjA0OjU5LjE4ODI5MTA2NCArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZAps
b2FkYXZnOiAyOS45MCAzMy44MiAxNi41MSAxLzQ1MSAxMDk0NQpzdGFydF90aW1lOiAnMTQxOTAw
NTE0OScKZW5kX3RpbWU6ICcxNDE5MDA1NDg2Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE0
MTIxOS0wOTA5MTQiCg==

--===============5532160473887124202==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE1L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE4L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjAvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyMS9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNC9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTI1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNy9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTI4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MjkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzAvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUzMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzMvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUzNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUz
Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NDAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQyL2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1NDMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHU0NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ1L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU0Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDkvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1MS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1Ni9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKbW91bnQgLXQgdG1wZnMgLW8gc2l6ZT0xMDAl
IHZtLXNjYWxhYmlsaXR5LXRtcCAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcAp0cnVuY2F0ZSAtcyA2
NzQwNjkyOTkyMCAvdG1wL3ZtLXNjYWxhYmlsaXR5LmltZwpta2ZzLnhmcyAtcSAvdG1wL3ZtLXNj
YWxhYmlsaXR5LmltZwptb3VudCAtbyBsb29wIC90bXAvdm0tc2NhbGFiaWxpdHkuaW1nIC90bXAv
dm0tc2NhbGFiaWxpdHkKLi9jYXNlLW1tYXAtcHJlYWQtcmFuZAp0cnVuY2F0ZSAvdG1wL3ZtLXNj
YWxhYmlsaXR5L3NwYXJzZS1tbWFwLXByZWFkLXJhbmQgLXMgNzg1MzY1NDQ4NDEKLi91c2VtZW0g
LS1ydW50aW1lIDMwMCAtbiA1NiAtZiAvdG1wL3ZtLXNjYWxhYmlsaXR5L3NwYXJzZS1tbWFwLXBy
ZWFkLXJhbmQgLS1yZWFkb25seSAtLXJhbmRvbSA3ODUzNjU0NDg0MQp1bW91bnQgL3RtcC92bS1z
Y2FsYWJpbGl0eS10bXAKdW1vdW50IC90bXAvdm0tc2NhbGFiaWxpdHkKcm0gL3RtcC92bS1zY2Fs
YWJpbGl0eS5pbWcK

--===============5532160473887124202==--

