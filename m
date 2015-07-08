Content-Type: multipart/mixed; boundary="===============7410726873392523802=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [thp] 79553da293d: +1.8% fileio.time.file_system_inputs
Date: Wed, 08 Jul 2015 09:57:52 +0800
Message-ID: <1436320672.5489.272.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7410726873392523802==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 79553da293d38d63097278de13e28a3b371f43c1 ("thp: cleanup khugepaged s=
tartup")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/disk/iosched/f=
s/nr_threads:
  bay/dd-write/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance=
/1HDD/cfq/xfs/10dd

commit: =

  e39155ea11eac6da056b04669d7c9fc612e2065a
  79553da293d38d63097278de13e28a3b371f43c1

e39155ea11eac6da 79553da293d38d63097278de13 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     30460 =C2=B1  0%     +34.3%      40920 =C2=B1  0%  softirqs.BLOCK
    231.27 =C2=B1  4%     -17.3%     191.30 =C2=B1  3%  uptime.idle
    765.75 =C2=B1  7%     +19.7%     916.50 =C2=B1  4%  slabinfo.kmalloc-51=
2.active_objs
    972.25 =C2=B1  8%     +17.4%       1141 =C2=B1  5%  slabinfo.kmalloc-51=
2.num_objs
     74.00 =C2=B1  0%     +15.9%      85.75 =C2=B1 10%  vmstat.memory.buff
     91092 =C2=B1  0%     -62.3%      34370 =C2=B1  1%  vmstat.memory.free
     22460 =C2=B1  1%     +29.2%      29026 =C2=B1  1%  ftrace.global_dirty=
_state.dirty
     35516 =C2=B1  1%     -11.0%      31615 =C2=B1  0%  ftrace.global_dirty=
_state.writeback
      2.00 =C2=B1  0%     +50.0%       3.00 =C2=B1  0%  ftrace.writeback_si=
ngle_inode.sda.age
      4913 =C2=B1  1%     +35.7%       6666 =C2=B1  1%  ftrace.writeback_si=
ngle_inode.sda.wrote
     36958 =C2=B1  4%     -67.3%      12083 =C2=B1 28%  meminfo.AnonHugePag=
es
     89634 =C2=B1  0%     +29.2%     115815 =C2=B1  1%  meminfo.Dirty
   1315242 =C2=B1  0%     +10.4%    1451507 =C2=B1  0%  meminfo.MemAvailable
     87870 =C2=B1  0%     -63.5%      32046 =C2=B1  2%  meminfo.MemFree
    142291 =C2=B1  1%     -11.2%     126331 =C2=B1  0%  meminfo.Writeback
      2.76 =C2=B1 14%     +22.8%       3.39 =C2=B1  8%  perf-profile.cpu-cy=
cles.__clear_user.iov_iter_zero.read_iter_zero.new_sync_read.__vfs_read
      4.94 =C2=B1 16%     +31.2%       6.48 =C2=B1  6%  perf-profile.cpu-cy=
cles.__memset.xfs_vm_write_begin.generic_perform_write.xfs_file_buffered_ai=
o_write.xfs_file_write_iter
      1.31 =C2=B1 34%     -50.4%       0.65 =C2=B1 36%  perf-profile.cpu-cy=
cles.end_page_writeback.end_buffer_async_write.xfs_destroy_ioend.xfs_end_io=
.process_one_work
      0.86 =C2=B1 24%     -44.1%       0.48 =C2=B1 42%  perf-profile.cpu-cy=
cles.handle_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fa=
ult
      1.15 =C2=B1 27%     -50.4%       0.57 =C2=B1 39%  perf-profile.cpu-cy=
cles.test_clear_page_writeback.end_page_writeback.end_buffer_async_write.xf=
s_destroy_ioend.xfs_end_io
      0.76 =C2=B1 39%     +65.6%       1.26 =C2=B1 23%  perf-profile.cpu-cy=
cles.try_to_free_buffers.xfs_vm_releasepage.try_to_release_page.shrink_page=
_list.shrink_inactive_list
      0.00 =C2=B1 -1%      +Inf%       9581 =C2=B1 43%  latency_stats.avg.d=
o_truncate.do_sys_ftruncate.SyS_ftruncate.system_call_fastpath
      0.00 =C2=B1 -1%      +Inf%     500330 =C2=B1 58%  latency_stats.avg.x=
fs_file_buffered_aio_write.xfs_file_write_iter.new_sync_write.vfs_write.SyS=
_write.system_call_fastpath
    163371 =C2=B1  3%     +26.6%     206775 =C2=B1  1%  latency_stats.hits.=
ring_buffer_wait.wait_on_pipe.tracing_wait_pipe.tracing_read_pipe.__vfs_rea=
d.vfs_read.SyS_read.system_call_fastpath
      0.00 =C2=B1 -1%      +Inf%      32695 =C2=B1 10%  latency_stats.max.d=
o_truncate.do_sys_ftruncate.SyS_ftruncate.system_call_fastpath
      0.00 =C2=B1 -1%      +Inf%     669208 =C2=B1 18%  latency_stats.max.x=
fs_file_buffered_aio_write.xfs_file_write_iter.new_sync_write.vfs_write.SyS=
_write.system_call_fastpath
      0.00 =C2=B1 -1%      +Inf%      53331 =C2=B1 28%  latency_stats.sum.d=
o_truncate.do_sys_ftruncate.SyS_ftruncate.system_call_fastpath
      0.00 =C2=B1 -1%      +Inf%     706140 =C2=B1 12%  latency_stats.sum.x=
fs_file_buffered_aio_write.xfs_file_write_iter.new_sync_write.vfs_write.SyS=
_write.system_call_fastpath
    394.50 =C2=B1 24%     -53.2%     184.50 =C2=B1 37%  sched_debug.cfs_rq[=
3]:/.load
     37.00 =C2=B1 34%     +51.4%      56.00 =C2=B1 17%  sched_debug.cpu#1.c=
pu_load[1]
     84.75 =C2=B1 19%     -52.8%      40.00 =C2=B1 68%  sched_debug.cpu#3.c=
pu_load[0]
     69.25 =C2=B1 20%     -50.5%      34.25 =C2=B1 34%  sched_debug.cpu#3.c=
pu_load[1]
     50.25 =C2=B1 11%     -45.8%      27.25 =C2=B1 23%  sched_debug.cpu#3.c=
pu_load[2]
     36.25 =C2=B1  5%     -37.9%      22.50 =C2=B1 22%  sched_debug.cpu#3.c=
pu_load[3]
    394.50 =C2=B1 24%     -53.2%     184.50 =C2=B1 37%  sched_debug.cpu#3.l=
oad
 2.138e+11 =C2=B1  0%      -1.4%  2.108e+11 =C2=B1  0%  perf-stat.L1-dcache=
-loads
 2.483e+08 =C2=B1  0%      -4.3%  2.376e+08 =C2=B1  0%  perf-stat.L1-dcache=
-prefetches
 4.605e+09 =C2=B1  0%      +7.8%  4.962e+09 =C2=B1  0%  perf-stat.L1-icache=
-load-misses
 5.684e+11 =C2=B1  0%      +2.0%  5.797e+11 =C2=B1  0%  perf-stat.L1-icache=
-loads
 1.637e+08 =C2=B1  0%     +15.8%  1.895e+08 =C2=B1  1%  perf-stat.LLC-load-=
misses
 1.089e+11 =C2=B1  0%      +1.3%  1.103e+11 =C2=B1  0%  perf-stat.branch-lo=
ads
 8.163e+10 =C2=B1  0%      +2.9%  8.396e+10 =C2=B1  1%  perf-stat.bus-cycles
 3.116e+08 =C2=B1  1%      +9.6%  3.415e+08 =C2=B1  0%  perf-stat.cache-mis=
ses
   9306030 =C2=B1  1%      -1.4%    9171655 =C2=B1  0%  perf-stat.context-s=
witches
    151544 =C2=B1  2%      +8.3%     164060 =C2=B1  1%  perf-stat.cpu-migra=
tions
 2.299e+08 =C2=B1 12%     +25.5%  2.886e+08 =C2=B1 10%  perf-stat.dTLB-load=
-misses
   8302411 =C2=B1  3%     +17.4%    9747172 =C2=B1  2%  perf-stat.iTLB-load=
-misses
 7.348e+11 =C2=B1  0%      +2.3%  7.515e+11 =C2=B1  0%  perf-stat.ref-cycles
     52222 =C2=B1  6%     -72.6%      14324 =C2=B1 28%  proc-vmstat.compact=
_isolated
     42280 =C2=B1 10%     -71.6%      11991 =C2=B1 35%  proc-vmstat.compact=
_migrate_scanned
      5320 =C2=B1  1%     -99.9%       6.50 =C2=B1 35%  proc-vmstat.kswapd_=
high_wmark_hit_quickly
      3377 =C2=B1 13%    +602.5%      23725 =C2=B1  1%  proc-vmstat.kswapd_=
low_wmark_hit_quickly
      1446 =C2=B1  0%     -86.9%     190.00 =C2=B1  4%  proc-vmstat.nr_allo=
c_batch
     22517 =C2=B1  0%     +28.9%      29013 =C2=B1  1%  proc-vmstat.nr_dirty
     21984 =C2=B1  0%     -63.5%       8021 =C2=B1  2%  proc-vmstat.nr_free=
_pages
      1142 =C2=B1 15%     -24.3%     864.75 =C2=B1  4%  proc-vmstat.nr_vmsc=
an_immediate_reclaim
     35464 =C2=B1  1%     -11.0%      31557 =C2=B1  0%  proc-vmstat.nr_writ=
eback
      8844 =C2=B1  4%    +169.2%      23813 =C2=B1  1%  proc-vmstat.pageout=
run
     17473 =C2=B1  0%     -91.7%       1447 =C2=B1 33%  proc-vmstat.pgalloc=
_dma
     24252 =C2=B1  5%     -74.5%       6188 =C2=B1 25%  proc-vmstat.pgmigra=
te_success
     16476 =C2=B1  0%     -94.4%     925.00 =C2=B1 48%  proc-vmstat.pgrefil=
l_dma
      8267 =C2=B1  9%    +816.4%      75755 =C2=B1  8%  proc-vmstat.pgscan_=
direct_dma32
     16728 =C2=B1  0%     -94.5%     927.50 =C2=B1 38%  proc-vmstat.pgscan_=
kswapd_dma
      8267 =C2=B1  9%    +128.8%      18917 =C2=B1  8%  proc-vmstat.pgsteal=
_direct_dma32
     15954 =C2=B1  0%     -97.0%     483.75 =C2=B1 59%  proc-vmstat.pgsteal=
_kswapd_dma

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/disk/iosched/f=
s/nr_threads:
  bay/dd-write/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance=
/1HDD/cfq/xfs/1dd

commit: =

  e39155ea11eac6da056b04669d7c9fc612e2065a
  79553da293d38d63097278de13e28a3b371f43c1

e39155ea11eac6da 79553da293d38d63097278de13 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      3.50 =C2=B1 14%   +1750.0%      64.75 =C2=B1 15%  ftrace.writeback_si=
ngle_inode.sda.age
    471.00 =C2=B1  2%     +28.9%     607.00 =C2=B1  5%  slabinfo.blkdev_req=
uests.active_objs
    476.25 =C2=B1  1%     +29.6%     617.25 =C2=B1  4%  slabinfo.blkdev_req=
uests.num_objs
     10396 =C2=B1  1%     +45.5%      15129 =C2=B1  0%  softirqs.BLOCK
     37406 =C2=B1  3%     +18.5%      44317 =C2=B1  4%  softirqs.RCU
     25121 =C2=B1  5%     -59.5%      10170 =C2=B1 12%  meminfo.AnonHugePag=
es
   1332448 =C2=B1  0%     +10.1%    1466476 =C2=B1  0%  meminfo.MemAvailable
     89924 =C2=B1  0%     -63.0%      33289 =C2=B1  0%  meminfo.MemFree
     69.25 =C2=B1  2%     +32.9%      92.00 =C2=B1 11%  vmstat.memory.buff
     90542 =C2=B1  1%     -62.6%      33856 =C2=B1  0%  vmstat.memory.free
     17946 =C2=B1  2%      -8.6%      16406 =C2=B1  4%  vmstat.system.cs
   6455037 =C2=B1100%     -99.7%      19975 =C2=B1173%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.new_sync_write.=
vfs_write.SyS_write.system_call_fastpath
    108228 =C2=B1  3%     +34.7%     145793 =C2=B1  5%  latency_stats.hits.=
pipe_wait.pipe_read.new_sync_read.__vfs_read.vfs_read.SyS_read.system_call_=
fastpath
     52101 =C2=B1  1%    +140.2%     125153 =C2=B1  2%  latency_stats.hits.=
ring_buffer_wait.wait_on_pipe.tracing_wait_pipe.tracing_read_pipe.__vfs_rea=
d.vfs_read.SyS_read.system_call_fastpath
   6737920 =C2=B1100%     -99.7%      19975 =C2=B1173%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.new_sync_write.=
vfs_write.SyS_write.system_call_fastpath
    572233 =C2=B1 87%     -41.2%     336545 =C2=B1  3%  latency_stats.max.w=
ait_on_page_bit.truncate_inode_pages_range.truncate_pagecache.truncate_sets=
ize.xfs_setattr_size.xfs_vn_setattr.notify_change.do_truncate.do_sys_ftrunc=
ate.SyS_ftruncate.system_call_fastpath
   9804520 =C2=B1112%     -99.8%      19975 =C2=B1173%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.new_sync_write.=
vfs_write.SyS_write.system_call_fastpath
      5007 =C2=B1  0%     -99.8%       8.50 =C2=B1 35%  proc-vmstat.kswapd_=
high_wmark_hit_quickly
      4012 =C2=B1  5%    +584.2%      27456 =C2=B1  2%  proc-vmstat.kswapd_=
low_wmark_hit_quickly
      1441 =C2=B1  0%     -87.2%     184.75 =C2=B1  2%  proc-vmstat.nr_allo=
c_batch
     22489 =C2=B1  0%     -63.0%       8329 =C2=B1  0%  proc-vmstat.nr_free=
_pages
    853.75 =C2=B1  6%     +31.1%       1119 =C2=B1  8%  proc-vmstat.nr_vmsc=
an_immediate_reclaim
      9282 =C2=B1  2%    +196.4%      27510 =C2=B1  2%  proc-vmstat.pageout=
run
     15361 =C2=B1 12%     -95.3%     717.00 =C2=B1 37%  proc-vmstat.pgalloc=
_dma
     14328 =C2=B1 12%     -98.3%     249.75 =C2=B1 79%  proc-vmstat.pgrefil=
l_dma
     14670 =C2=B1 12%     -97.8%     321.50 =C2=B1  2%  proc-vmstat.pgscan_=
kswapd_dma
     13886 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.pgsteal=
_kswapd_dma
    108.75 =C2=B1 29%     -43.2%      61.75 =C2=B1 31%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
    396.25 =C2=B1 20%     -45.9%     214.50 =C2=B1 18%  sched_debug.cfs_rq[=
2]:/.utilization_load_avg
    664.00 =C2=B1 34%    +144.8%       1625 =C2=B1 59%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
    738.75 =C2=B1 31%    +132.6%       1718 =C2=B1 57%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
     34.75 =C2=B1 36%     +86.3%      64.75 =C2=B1 22%  sched_debug.cpu#0.c=
pu_load[2]
     29.00 =C2=B1 23%     +92.2%      55.75 =C2=B1 28%  sched_debug.cpu#0.c=
pu_load[3]
     69144 =C2=B1  1%     +17.7%      81411 =C2=B1 13%  sched_debug.cpu#1.n=
r_load_updates
    107.75 =C2=B1 22%     -39.9%      64.75 =C2=B1 23%  sched_debug.cpu#2.c=
pu_load[0]
      2359 =C2=B1 26%     -57.2%       1009 =C2=B1 34%  sched_debug.cpu#2.c=
urr->pid
    414.50 =C2=B1 10%     -32.8%     278.75 =C2=B1 23%  sched_debug.cpu#2.l=
oad
    184007 =C2=B1 12%    +299.5%     735051 =C2=B1 61%  sched_debug.cpu#3.s=
ched_goidle
      1.55 =C2=B1 12%     +27.2%       1.97 =C2=B1  9%  perf-profile.cpu-cy=
cles.__xfs_get_blocks.xfs_get_blocks.__block_write_begin.xfs_vm_write_begin=
.generic_perform_write
      1.34 =C2=B1 22%     +46.9%       1.97 =C2=B1 24%  perf-profile.cpu-cy=
cles.cpu_startup_entry.rest_init.start_kernel.x86_64_start_reservations.x86=
_64_start_kernel
      1.30 =C2=B1 20%     -34.7%       0.85 =C2=B1  8%  perf-profile.cpu-cy=
cles.down_write.xfs_ilock.xfs_file_buffered_aio_write.xfs_file_write_iter.n=
ew_sync_write
      0.30 =C2=B1 16%    +109.0%       0.62 =C2=B1 50%  perf-profile.cpu-cy=
cles.fsnotify.vfs_read.sys_read.system_call_fastpath
     12.11 =C2=B1  9%     +19.3%      14.44 =C2=B1  9%  perf-profile.cpu-cy=
cles.kthread.ret_from_fork
      1.34 =C2=B1 22%     +46.9%       1.97 =C2=B1 24%  perf-profile.cpu-cy=
cles.rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel
     12.13 =C2=B1  9%     +19.0%      14.44 =C2=B1  9%  perf-profile.cpu-cy=
cles.ret_from_fork
      1.36 =C2=B1 21%     -49.5%       0.69 =C2=B1 11%  perf-profile.cpu-cy=
cles.rw_verify_area.vfs_write.sys_write.system_call_fastpath
      0.93 =C2=B1 27%     -57.1%       0.40 =C2=B1 30%  perf-profile.cpu-cy=
cles.security_file_permission.rw_verify_area.vfs_write.sys_write.system_cal=
l_fastpath
      1.34 =C2=B1 22%     +46.9%       1.97 =C2=B1 24%  perf-profile.cpu-cy=
cles.start_kernel.x86_64_start_reservations.x86_64_start_kernel
      0.80 =C2=B1 31%     +76.3%       1.41 =C2=B1 15%  perf-profile.cpu-cy=
cles.tracing_read_pipe.__vfs_read.vfs_read.sys_read.system_call_fastpath
      1.34 =C2=B1 22%     +46.9%       1.97 =C2=B1 24%  perf-profile.cpu-cy=
cles.x86_64_start_kernel
      1.34 =C2=B1 22%     +46.9%       1.97 =C2=B1 24%  perf-profile.cpu-cy=
cles.x86_64_start_reservations.x86_64_start_kernel
  2.39e+11 =C2=B1  1%      -2.5%   2.33e+11 =C2=B1  1%  perf-stat.L1-dcache=
-loads
 2.559e+08 =C2=B1  2%      +4.3%  2.669e+08 =C2=B1  1%  perf-stat.L1-dcache=
-prefetches
 4.836e+09 =C2=B1  2%      +7.5%  5.197e+09 =C2=B1  0%  perf-stat.L1-icache=
-load-misses
 6.191e+11 =C2=B1  1%      +3.2%  6.387e+11 =C2=B1  1%  perf-stat.L1-icache=
-loads
 1.187e+08 =C2=B1  1%     +29.7%   1.54e+08 =C2=B1  2%  perf-stat.LLC-load-=
misses
 1.355e+09 =C2=B1  4%      +9.5%  1.484e+09 =C2=B1  4%  perf-stat.LLC-loads
 1.104e+08 =C2=B1  1%     +12.9%  1.246e+08 =C2=B1  1%  perf-stat.LLC-store=
-misses
 1.244e+09 =C2=B1  3%      -6.7%  1.161e+09 =C2=B1  1%  perf-stat.branch-mi=
sses
 2.697e+08 =C2=B1  0%     +25.1%  3.373e+08 =C2=B1  2%  perf-stat.cache-mis=
ses
  10825819 =C2=B1  2%      -8.6%    9891678 =C2=B1  4%  perf-stat.context-s=
witches
     63968 =C2=B1  1%     +54.6%      98882 =C2=B1  2%  perf-stat.cpu-migra=
tions
 2.385e+11 =C2=B1  1%      -3.0%  2.314e+11 =C2=B1  1%  perf-stat.dTLB-loads
   5457543 =C2=B1  7%     +22.7%    6698136 =C2=B1  5%  perf-stat.iTLB-load=
-misses

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/period/nr_threads/disk/fs/size/=
filenum/rwmode/iomode:
  lkp-ws02/fileio/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/600s/100=
%/1HDD/btrfs/64G/1024f/rndrd/sync

commit: =

  e39155ea11eac6da056b04669d7c9fc612e2065a
  79553da293d38d63097278de13e28a3b371f43c1

e39155ea11eac6da 79553da293d38d63097278de13 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   6708548 =C2=B1  0%      +1.8%    6832358 =C2=B1  0%  fileio.time.file_sy=
stem_inputs
  27192978 =C2=B1 10%     +24.2%   33781232 =C2=B1  9%  cpuidle.C1-NHM.time
    291264 =C2=B1  3%     -19.2%     235461 =C2=B1  2%  cpuidle.C1-NHM.usage
    256.25 =C2=B1  5%      -8.5%     234.50 =C2=B1  4%  cpuidle.POLL.usage
   6927467 =C2=B1122%     -77.4%    1563952 =C2=B1100%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.new_sync_write.=
vfs_write.SyS_write.system_call_fastpath
    126552 =C2=B1 73%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.w=
ait_on_page_bit.extent_write_cache_pages.[btrfs].extent_writepages.[btrfs].=
btrfs_writepages.[btrfs].do_writepages.__filemap_fdatawrite_range.filemap_f=
datawrite_range.btrfs_fdatawrite_range.[btrfs].start_ordered_ops.[btrfs].bt=
rfs_sync_file.[btrfs].vfs_fsync_range.do_fsync
    304943 =C2=B1  3%     -18.4%     248685 =C2=B1  2%  latency_stats.hits.=
pipe_wait.pipe_read.new_sync_read.__vfs_read.vfs_read.SyS_read.system_call_=
fastpath
     31145 =C2=B1133%     -24.8%      23416 =C2=B1  0%  latency_stats.max.b=
lk_execute_rq.scsi_execute.scsi_execute_req_flags.ses_recv_diag.[ses].ses_e=
nclosure_data_process.[ses].ses_match_to_enclosure.[ses].ses_intf_add.[ses]=
.class_interface_register.scsi_register_interface.0xffffffffa0006013.do_one=
_initcall.do_init_module
    242127 =C2=B1 74%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.w=
ait_on_page_bit.extent_write_cache_pages.[btrfs].extent_writepages.[btrfs].=
btrfs_writepages.[btrfs].do_writepages.__filemap_fdatawrite_range.filemap_f=
datawrite_range.btrfs_fdatawrite_range.[btrfs].start_ordered_ops.[btrfs].bt=
rfs_sync_file.[btrfs].vfs_fsync_range.do_fsync
    253104 =C2=B1 73%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.w=
ait_on_page_bit.extent_write_cache_pages.[btrfs].extent_writepages.[btrfs].=
btrfs_writepages.[btrfs].do_writepages.__filemap_fdatawrite_range.filemap_f=
datawrite_range.btrfs_fdatawrite_range.[btrfs].start_ordered_ops.[btrfs].bt=
rfs_sync_file.[btrfs].vfs_fsync_range.do_fsync
   1452770 =C2=B1  9%    +519.6%    9001196 =C2=B1 47%  numa-numastat.node0=
.local_node
    166456 =C2=B1143%   +3090.2%    5310291 =C2=B1 56%  numa-numastat.node0=
.numa_foreign
   1452773 =C2=B1  9%    +519.6%    9001200 =C2=B1 47%  numa-numastat.node0=
.numa_hit
   7153013 =C2=B1  3%     -75.4%    1761824 =C2=B1164%  numa-numastat.node0=
.numa_miss
   7153016 =C2=B1  3%     -75.4%    1761828 =C2=B1164%  numa-numastat.node0=
.other_node
   7153013 =C2=B1  3%     -75.4%    1761824 =C2=B1164%  numa-numastat.node1=
.numa_foreign
    166456 =C2=B1143%   +3090.2%    5310291 =C2=B1 56%  numa-numastat.node1=
.numa_miss
    166473 =C2=B1143%   +3089.9%    5310296 =C2=B1 56%  numa-numastat.node1=
.other_node
      1128 =C2=B1  2%     -39.1%     687.00 =C2=B1 35%  slabinfo.bio-1.acti=
ve_objs
      1128 =C2=B1  2%     -36.2%     719.75 =C2=B1 30%  slabinfo.bio-1.num_=
objs
    206.75 =C2=B1  4%     -43.4%     117.00 =C2=B1 34%  slabinfo.btrfs_tran=
saction.active_objs
    206.75 =C2=B1  4%     -43.4%     117.00 =C2=B1 34%  slabinfo.btrfs_tran=
saction.num_objs
    614.00 =C2=B1  5%     -18.0%     503.25 =C2=B1 11%  slabinfo.ext4_free_=
data.active_objs
    614.00 =C2=B1  5%     -18.0%     503.25 =C2=B1 11%  slabinfo.ext4_free_=
data.num_objs
      1241 =C2=B1  5%     -13.2%       1076 =C2=B1 10%  slabinfo.file_lock_=
ctx.active_objs
      1241 =C2=B1  5%     -13.2%       1076 =C2=B1 10%  slabinfo.file_lock_=
ctx.num_objs
      3644 =C2=B1  2%      -9.0%       3317 =C2=B1  5%  slabinfo.kmalloc-10=
24.active_objs
      1505 =C2=B1  1%     -59.8%     605.75 =C2=B1  5%  proc-vmstat.kswapd_=
high_wmark_hit_quickly
     53.00 =C2=B1 15%  +19436.8%      10354 =C2=B1  1%  proc-vmstat.kswapd_=
low_wmark_hit_quickly
      3246 =C2=B1  2%     -82.2%     577.50 =C2=B1  0%  proc-vmstat.nr_allo=
c_batch
    905.25 =C2=B1 54%     -72.2%     251.25 =C2=B1 38%  proc-vmstat.numa_hi=
nt_faults
    836.50 =C2=B1 63%     -72.8%     227.50 =C2=B1 28%  proc-vmstat.numa_hi=
nt_faults_local
      1003 =C2=B1 42%     -72.3%     278.25 =C2=B1 15%  proc-vmstat.numa_pt=
e_updates
      3357 =C2=B1  0%    +296.0%      13296 =C2=B1  1%  proc-vmstat.pageout=
run
    412.00 =C2=B1 40%    +666.0%       3155 =C2=B1 18%  proc-vmstat.pgscan_=
direct_dma32
      1192 =C2=B1 24%   +1926.9%      24174 =C2=B1 17%  proc-vmstat.pgscan_=
direct_normal
      1673 =C2=B1  3%     +13.6%       1900 =C2=B1  6%  proc-vmstat.working=
set_activate
    186101 =C2=B1  1%     +39.2%     259051 =C2=B1 15%  numa-meminfo.node0.=
Active
    175144 =C2=B1  0%     +43.7%     251597 =C2=B1 16%  numa-meminfo.node0.=
Active(file)
      8061 =C2=B1 34%     -34.6%       5270 =C2=B1  0%  numa-meminfo.node0.=
Mapped
    874427 =C2=B1  0%     -46.8%     464786 =C2=B1 46%  numa-meminfo.node0.=
MemFree
     88387 =C2=B1  0%     +20.4%     106421 =C2=B1  8%  numa-meminfo.node0.=
Slab
    286764 =C2=B1  0%     -25.1%     214834 =C2=B1 18%  numa-meminfo.node1.=
Active
    275866 =C2=B1  0%     -27.5%     200006 =C2=B1 21%  numa-meminfo.node1.=
Active(file)
      1072 =C2=B1  8%     -32.2%     727.50 =C2=B1 24%  numa-meminfo.node1.=
Dirty
     87375 =C2=B1  1%     -18.7%      71059 =C2=B1 13%  numa-meminfo.node1.=
SReclaimable
     21629 =C2=B1  5%     -11.0%      19250 =C2=B1  2%  numa-meminfo.node1.=
SUnreclaim
    109004 =C2=B1  0%     -17.1%      90310 =C2=B1 11%  numa-meminfo.node1.=
Slab
     43785 =C2=B1  0%     +43.7%      62898 =C2=B1 16%  numa-vmstat.node0.n=
r_active_file
      1837 =C2=B1  1%     -85.3%     270.25 =C2=B1  0%  numa-vmstat.node0.n=
r_alloc_batch
    218616 =C2=B1  0%     -46.8%     116208 =C2=B1 46%  numa-vmstat.node0.n=
r_free_pages
      2015 =C2=B1 34%     -34.6%       1317 =C2=B1  0%  numa-vmstat.node0.n=
r_mapped
     34180 =C2=B1144%  +10851.6%    3743275 =C2=B1 57%  numa-vmstat.node0.n=
uma_foreign
    767794 =C2=B1  3%    +689.8%    6064164 =C2=B1 50%  numa-vmstat.node0.n=
uma_hit
    707070 =C2=B1  3%    +749.1%    6003501 =C2=B1 50%  numa-vmstat.node0.n=
uma_local
   5022883 =C2=B1  1%     -75.4%    1236569 =C2=B1170%  numa-vmstat.node0.n=
uma_miss
   5083607 =C2=B1  1%     -74.5%    1297231 =C2=B1162%  numa-vmstat.node0.n=
uma_other
    605.25 =C2=B1  3%     +78.0%       1077 =C2=B1 24%  numa-vmstat.node0.w=
orkingset_activate
     68966 =C2=B1  0%     -27.5%      50001 =C2=B1 21%  numa-vmstat.node1.n=
r_active_file
      1433 =C2=B1  2%     -81.5%     265.75 =C2=B1  1%  numa-vmstat.node1.n=
r_alloc_batch
     21843 =C2=B1  1%     -18.7%      17764 =C2=B1 13%  numa-vmstat.node1.n=
r_slab_reclaimable
      5406 =C2=B1  5%     -11.0%       4812 =C2=B1  2%  numa-vmstat.node1.n=
r_slab_unreclaimable
   5022889 =C2=B1  1%     -75.4%    1236573 =C2=B1170%  numa-vmstat.node1.n=
uma_foreign
     34182 =C2=B1144%  +10851.0%    3743283 =C2=B1 57%  numa-vmstat.node1.n=
uma_miss
     38048 =C2=B1129%   +9748.4%    3747130 =C2=B1 57%  numa-vmstat.node1.n=
uma_other
      1696 =C2=B1 30%     -70.6%     498.25 =C2=B1 18%  sched_debug.cfs_rq[=
10]:/.avg->runnable_avg_sum
     10699 =C2=B1 18%     -48.9%       5471 =C2=B1 57%  sched_debug.cfs_rq[=
10]:/.exec_clock
     31648 =C2=B1 36%     -58.8%      13052 =C2=B1 59%  sched_debug.cfs_rq[=
10]:/.min_vruntime
    493.00 =C2=B1 16%     -29.9%     345.75 =C2=B1  6%  sched_debug.cfs_rq[=
10]:/.tg->runnable_avg
     36.00 =C2=B1 32%     -72.9%       9.75 =C2=B1 16%  sched_debug.cfs_rq[=
10]:/.tg_runnable_contrib
    166.75 =C2=B1 32%     -60.0%      66.75 =C2=B1 47%  sched_debug.cfs_rq[=
11]:/.blocked_load_avg
      9322 =C2=B1 21%     -53.0%       4380 =C2=B1 41%  sched_debug.cfs_rq[=
11]:/.exec_clock
     23106 =C2=B1 28%     -57.7%       9765 =C2=B1 34%  sched_debug.cfs_rq[=
11]:/.min_vruntime
     11778 =C2=B1 54%    -791.7%     -81472 =C2=B1-61%  sched_debug.cfs_rq[=
11]:/.spread0
    493.50 =C2=B1 14%     -29.7%     346.75 =C2=B1  5%  sched_debug.cfs_rq[=
11]:/.tg->runnable_avg
    168.25 =C2=B1 32%     -59.9%      67.50 =C2=B1 47%  sched_debug.cfs_rq[=
11]:/.tg_load_contrib
    498.50 =C2=B1 15%     -29.6%     351.00 =C2=B1  4%  sched_debug.cfs_rq[=
12]:/.tg->runnable_avg
      1718 =C2=B1 13%     +28.9%       2214 =C2=B1  9%  sched_debug.cfs_rq[=
13]:/.exec_clock
    501.25 =C2=B1 14%     -28.7%     357.25 =C2=B1  5%  sched_debug.cfs_rq[=
13]:/.tg->runnable_avg
    506.50 =C2=B1 15%     -30.6%     351.75 =C2=B1  4%  sched_debug.cfs_rq[=
14]:/.tg->runnable_avg
      1210 =C2=B1  9%     +42.4%       1723 =C2=B1 10%  sched_debug.cfs_rq[=
15]:/.exec_clock
      6566 =C2=B1  9%     +17.6%       7721 =C2=B1 10%  sched_debug.cfs_rq[=
15]:/.min_vruntime
    511.25 =C2=B1 14%     -30.6%     355.00 =C2=B1  3%  sched_debug.cfs_rq[=
15]:/.tg->runnable_avg
    515.50 =C2=B1 14%     -30.4%     358.75 =C2=B1  3%  sched_debug.cfs_rq[=
16]:/.tg->runnable_avg
     -3588 =C2=B1-25%   +2233.9%     -83744 =C2=B1-54%  sched_debug.cfs_rq[=
17]:/.spread0
    520.25 =C2=B1 13%     -30.7%     360.75 =C2=B1  3%  sched_debug.cfs_rq[=
17]:/.tg->runnable_avg
      2859 =C2=B1 73%     -51.2%       1394 =C2=B1 14%  sched_debug.cfs_rq[=
18]:/.exec_clock
     11966 =C2=B1 67%     -45.0%       6585 =C2=B1  9%  sched_debug.cfs_rq[=
18]:/.min_vruntime
    524.75 =C2=B1 13%     -30.7%     363.50 =C2=B1  3%  sched_debug.cfs_rq[=
18]:/.tg->runnable_avg
    523.50 =C2=B1 12%     -29.7%     368.00 =C2=B1  4%  sched_debug.cfs_rq[=
19]:/.tg->runnable_avg
      2926 =C2=B1  5%     +48.9%       4356 =C2=B1 18%  sched_debug.cfs_rq[=
1]:/.exec_clock
      8401 =C2=B1  6%     +30.1%      10932 =C2=B1  6%  sched_debug.cfs_rq[=
1]:/.min_vruntime
    527.50 =C2=B1 11%     -29.5%     372.00 =C2=B1  3%  sched_debug.cfs_rq[=
20]:/.tg->runnable_avg
      2098 =C2=B1 46%     -35.1%       1362 =C2=B1  3%  sched_debug.cfs_rq[=
21]:/.exec_clock
    532.00 =C2=B1 11%     -28.9%     378.00 =C2=B1  3%  sched_debug.cfs_rq[=
21]:/.tg->runnable_avg
    537.25 =C2=B1 12%     -28.7%     383.00 =C2=B1  3%  sched_debug.cfs_rq[=
22]:/.tg->runnable_avg
      3184 =C2=B1291%   -2728.3%     -83710 =C2=B1-57%  sched_debug.cfs_rq[=
23]:/.spread0
    541.50 =C2=B1 11%     -28.9%     385.25 =C2=B1  3%  sched_debug.cfs_rq[=
23]:/.tg->runnable_avg
      3163 =C2=B1  3%     +19.4%       3776 =C2=B1  8%  sched_debug.cfs_rq[=
2]:/.exec_clock
      0.75 =C2=B1110%    +400.0%       3.75 =C2=B1 47%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
    555.50 =C2=B1 18%     -20.2%     443.25 =C2=B1 14%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
      8390 =C2=B1  2%     +23.8%      10384 =C2=B1  8%  sched_debug.cfs_rq[=
3]:/.min_vruntime
    549.75 =C2=B1 18%     -19.5%     442.75 =C2=B1 14%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
     68.00 =C2=B1 40%    +171.3%     184.50 =C2=B1 26%  sched_debug.cfs_rq[=
4]:/.blocked_load_avg
      2824 =C2=B1 14%     +30.4%       3682 =C2=B1  9%  sched_debug.cfs_rq[=
4]:/.exec_clock
    545.50 =C2=B1 16%     -22.6%     422.25 =C2=B1 11%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
     69.75 =C2=B1 39%    +171.0%     189.00 =C2=B1 25%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
      7824 =C2=B1 17%     +24.4%       9733 =C2=B1  7%  sched_debug.cfs_rq[=
5]:/.min_vruntime
    518.25 =C2=B1 16%     -22.7%     400.50 =C2=B1 11%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
      1599 =C2=B1 51%     -62.1%     605.50 =C2=B1 25%  sched_debug.cfs_rq[=
7]:/.avg->runnable_avg_sum
     15577 =C2=B1 38%     -69.7%       4721 =C2=B1 67%  sched_debug.cfs_rq[=
7]:/.exec_clock
     37096 =C2=B1 35%     -68.1%      11832 =C2=B1 56%  sched_debug.cfs_rq[=
7]:/.min_vruntime
     25768 =C2=B1 49%    -408.1%     -79404 =C2=B1-67%  sched_debug.cfs_rq[=
7]:/.spread0
    491.50 =C2=B1 16%     -27.1%     358.50 =C2=B1 10%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
     34.00 =C2=B1 52%     -64.0%      12.25 =C2=B1 27%  sched_debug.cfs_rq[=
7]:/.tg_runnable_contrib
      1949 =C2=B1 23%     -55.6%     865.75 =C2=B1 70%  sched_debug.cfs_rq[=
8]:/.avg->runnable_avg_sum
     25183 =C2=B1 51%     -54.8%      11375 =C2=B1 44%  sched_debug.cfs_rq[=
8]:/.min_vruntime
     13855 =C2=B1 94%    -676.4%     -79862 =C2=B1-64%  sched_debug.cfs_rq[=
8]:/.spread0
    492.25 =C2=B1 16%     -28.9%     349.75 =C2=B1  6%  sched_debug.cfs_rq[=
8]:/.tg->runnable_avg
     41.25 =C2=B1 24%     -57.0%      17.75 =C2=B1 73%  sched_debug.cfs_rq[=
8]:/.tg_runnable_contrib
    494.00 =C2=B1 16%     -28.6%     352.50 =C2=B1  6%  sched_debug.cfs_rq[=
9]:/.tg->runnable_avg
     46021 =C2=B1 28%    +155.5%     117598 =C2=B1 31%  sched_debug.cpu#0.n=
r_load_updates
    -52.75 =C2=B1 -8%     +26.5%     -66.75 =C2=B1 -6%  sched_debug.cpu#0.n=
r_uninterruptible
     77978 =C2=B1 37%     +70.5%     132942 =C2=B1 22%  sched_debug.cpu#0.t=
twu_count
     33164 =C2=B1 42%    +141.3%      80030 =C2=B1 30%  sched_debug.cpu#0.t=
twu_local
     29131 =C2=B1  2%     +18.7%      34578 =C2=B1  4%  sched_debug.cpu#1.n=
r_load_updates
     34945 =C2=B1 55%     +82.2%      63667 =C2=B1 22%  sched_debug.cpu#1.t=
twu_count
     53444 =C2=B1 11%     -32.0%      36339 =C2=B1 18%  sched_debug.cpu#10.=
nr_load_updates
    254928 =C2=B1 19%     -37.0%     160497 =C2=B1 36%  sched_debug.cpu#10.=
nr_switches
    255022 =C2=B1 19%     -37.0%     160586 =C2=B1 36%  sched_debug.cpu#10.=
sched_count
    124863 =C2=B1 20%     -37.9%      77546 =C2=B1 37%  sched_debug.cpu#10.=
sched_goidle
     62350 =C2=B1  6%     -35.1%      40434 =C2=B1 25%  sched_debug.cpu#10.=
ttwu_count
     24043 =C2=B1 13%     -39.6%      14532 =C2=B1 27%  sched_debug.cpu#10.=
ttwu_local
     48349 =C2=B1 12%     -25.1%      36207 =C2=B1 17%  sched_debug.cpu#11.=
nr_load_updates
    220073 =C2=B1 20%     -43.2%     125091 =C2=B1 24%  sched_debug.cpu#11.=
nr_switches
    220176 =C2=B1 20%     -43.1%     125175 =C2=B1 24%  sched_debug.cpu#11.=
sched_count
    107249 =C2=B1 20%     -43.9%      60128 =C2=B1 25%  sched_debug.cpu#11.=
sched_goidle
     54997 =C2=B1 15%     -39.9%      33028 =C2=B1 15%  sched_debug.cpu#11.=
ttwu_count
     11715 =C2=B1  2%     +14.5%      13414 =C2=B1  3%  sched_debug.cpu#14.=
nr_load_updates
     11624 =C2=B1  2%     +14.1%      13262 =C2=B1  6%  sched_debug.cpu#15.=
nr_load_updates
     26743 =C2=B1 35%    +214.0%      83986 =C2=B1 33%  sched_debug.cpu#15.=
ttwu_count
     11460 =C2=B1  3%     +13.2%      12974 =C2=B1  4%  sched_debug.cpu#16.=
nr_load_updates
     11441 =C2=B1  5%     +10.9%      12687 =C2=B1  3%  sched_debug.cpu#17.=
nr_load_updates
      3016 =C2=B1  3%      -7.4%       2793 =C2=B1  1%  sched_debug.cpu#17.=
ttwu_local
     29953 =C2=B1  6%     +22.4%      36676 =C2=B1  2%  sched_debug.cpu#2.n=
r_load_updates
      7674 =C2=B1  8%     +32.4%      10159 =C2=B1  4%  sched_debug.cpu#2.t=
twu_local
     12920 =C2=B1 13%    +206.5%      39603 =C2=B1 17%  sched_debug.cpu#20.=
nr_switches
     12984 =C2=B1 13%    +205.5%      39667 =C2=B1 17%  sched_debug.cpu#20.=
sched_count
      5279 =C2=B1 16%    +249.0%      18423 =C2=B1 19%  sched_debug.cpu#20.=
sched_goidle
     80631 =C2=B1 35%     -54.4%      36729 =C2=B1 33%  sched_debug.cpu#21.=
ttwu_count
     11221 =C2=B1  2%     +10.5%      12400 =C2=B1  1%  sched_debug.cpu#22.=
nr_load_updates
      9.00 =C2=B1 78%     -61.1%       3.50 =C2=B1173%  sched_debug.cpu#23.=
cpu_load[2]
      7.50 =C2=B1 86%     -73.3%       2.00 =C2=B1173%  sched_debug.cpu#23.=
cpu_load[3]
     29370 =C2=B1  4%     +29.7%      38100 =C2=B1  6%  sched_debug.cpu#3.n=
r_load_updates
      7498 =C2=B1  7%     +37.2%      10286 =C2=B1  7%  sched_debug.cpu#3.t=
twu_local
     29911 =C2=B1 12%     +24.2%      37158 =C2=B1  4%  sched_debug.cpu#4.n=
r_load_updates
    140120 =C2=B1 24%     +59.9%     224002 =C2=B1 18%  sched_debug.cpu#4.n=
r_switches
    140205 =C2=B1 24%     +59.8%     224099 =C2=B1 18%  sched_debug.cpu#4.s=
ched_count
     68431 =C2=B1 24%     +60.7%     109965 =C2=B1 18%  sched_debug.cpu#4.s=
ched_goidle
      7544 =C2=B1  7%     +31.1%       9887 =C2=B1  4%  sched_debug.cpu#4.t=
twu_local
     29295 =C2=B1  7%     +21.4%      35577 =C2=B1  6%  sched_debug.cpu#5.n=
r_load_updates
     23076 =C2=B1 21%     +43.1%      33020 =C2=B1 25%  sched_debug.cpu#5.t=
twu_count
      7228 =C2=B1  4%     +34.2%       9700 =C2=B1  6%  sched_debug.cpu#5.t=
twu_local
      6.00 =C2=B1 83%     -75.0%       1.50 =C2=B1173%  sched_debug.cpu#6.c=
pu_load[2]
     60164 =C2=B1 14%     -40.5%      35793 =C2=B1 19%  sched_debug.cpu#7.n=
r_load_updates
      3.75 =C2=B1175%    -240.0%      -5.25 =C2=B1-69%  sched_debug.cpu#7.n=
r_uninterruptible
     53640 =C2=B1 18%     -21.4%      42139 =C2=B1 16%  sched_debug.cpu#7.t=
twu_count
     28043 =C2=B1 19%     -51.0%      13744 =C2=B1 29%  sched_debug.cpu#7.t=
twu_local
      6.75 =C2=B1 58%     -77.8%       1.50 =C2=B1173%  sched_debug.cpu#8.c=
pu_load[4]
     51965 =C2=B1 15%     -31.7%      35508 =C2=B1  9%  sched_debug.cpu#8.n=
r_load_updates
     22902 =C2=B1 25%     -40.6%      13615 =C2=B1 12%  sched_debug.cpu#8.t=
twu_local
     51893 =C2=B1 13%     -29.9%      36371 =C2=B1 23%  sched_debug.cpu#9.n=
r_load_updates
     56687 =C2=B1 12%     -40.8%      33540 =C2=B1 43%  sched_debug.cpu#9.t=
twu_count
     22884 =C2=B1 18%     -39.3%      13901 =C2=B1 39%  sched_debug.cpu#9.t=
twu_local


bay: Pentium D
Memory: 2G

lkp-ws02: Westmere-EP
Memory: 16G


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

--===============7410726873392523802==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogZmlsZWlvCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogcHJlLXRlc3QKICB1cHRp
bWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAKICBudW1hLXZtc3Rh
dDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1zdGF0OgogICAgaW50
ZXJ2YWw6IDEwCiAgbWVtaW5mbzogCiAgc2xhYmluZm86IAogIGludGVycnVwdHM6IAogIGxvY2tf
c3RhdDogCiAgbGF0ZW5jeV9zdGF0czogCiAgc29mdGlycXM6IAogIGJkaV9kZXZfbWFwcGluZzog
CiAgZGlza3N0YXRzOiAKICBuZnNzdGF0OiAKICBjcHVpZGxlOiAKICBjcHVmcmVxLXN0YXRzOiAK
ICB0dXJib3N0YXQ6IAogIHBtZXRlcjogCiAgc2NoZWRfZGVidWc6CiAgICBpbnRlcnZhbDogNjAK
ZGVmYXVsdC13YXRjaGRvZ3M6CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjcHVmcmVxX2dv
dmVybm9yOiAKY29tbWl0OiBiOTUzYzBkMjM0YmM3MmU4NDg5ZDNiZjUxYTI3NmM1YzRlYzg1MzQ1
Cm1vZGVsOiBXZXN0bWVyZS1FUAptZW1vcnk6IDE2Rwpucl9oZGRfcGFydGl0aW9uczogMTEKaGRk
X3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvc2NzaS0zNTAwMGM1MDAqLXBhcnQxIgpzd2Fw
X3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1XRENf
V0QxMDAyRkFFWC0wMFozQTBfV0QtV0NBVFI1NDA4NTY0LXBhcnQzIgpwZXJpb2Q6IDYwMHMKbnJf
dGhyZWFkczogMTAwJQpkaXNrOiAxSERECmZzOiBidHJmcwpzaXplOiA2NEcKZmlsZWlvOgogIGZp
bGVudW06IDEwMjRmCiAgcndtb2RlOiBybmRyZAogIGlvbW9kZTogc3luYwpxdWV1ZTogY3ljbGlj
CnRlc3Rib3g6IGxrcC13czAyCnRib3hfZ3JvdXA6IGxrcC13czAyCmtjb25maWc6IHg4Nl82NC1y
aGVsCmVucXVldWVfdGltZTogMjAxNS0wNi0yMiAwNDoxNzoxNy4zNzY2MzM1MTMgKzA4OjAwCnVz
ZXI6IGxrcApjb21waWxlcjogZ2NjLTQuOQpoZWFkX2NvbW1pdDogZTgxYThlZGM4YzlmZWYzNDVl
ZjUzMzZjMTcxZWU4MWRlMTRhNmM1YQpiYXNlX2NvbW1pdDogYjk1M2MwZDIzNGJjNzJlODQ4OWQz
YmY1MWEyNzZjNWM0ZWM4NTM0NQpicmFuY2g6IGxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE1
MDYyMjIyCmtlcm5lbDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9iOTUzYzBkMjM0
YmM3MmU4NDg5ZDNiZjUxYTI3NmM1YzRlYzg1MzQ1L3ZtbGludXotNC4xLjAiCnJvb3RmczogZGVi
aWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnegpyZXN1bHRfcm9vdDogIi9yZXN1bHQvZmlsZWlvLzYw
MHMtMTAwJS0xSERELWJ0cmZzLTY0Ry0xMDI0Zi1ybmRyZC1zeW5jL2xrcC13czAyL2RlYmlhbi14
ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS9iOTUzYzBkMjM0YmM3MmU4
NDg5ZDNiZjUxYTI3NmM1YzRlYzg1MzQ1LzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvbGtw
LXdzMDIvY3ljbGljX2ZpbGVpby02MDBzLTEwMCUtMUhERC1idHJmcy02NEctMTAyNGYtcm5kcmQt
c3luYy14ODZfNjQtcmhlbC1DWUNMSUNfQkFTRS1iOTUzYzBkMjM0YmM3MmU4NDg5ZDNiZjUxYTI3
NmM1YzRlYzg1MzQ1LTAtMjAxNTA2MjItODE5NzItN2Fzem14LnlhbWwiCmRlcXVldWVfdGltZTog
MjAxNS0wNi0yMiAyMzoxMDo1NS44MjgyMzE2MzcgKzA4OjAwCm5yX2NwdTogIiQobnByb2MpIgpt
YXhfdXB0aW1lOiAzNTI2LjE4MDAwMDAwMDAwMDMKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2Rl
Ymlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rl
di9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQvbGtwLXdzMDIvY3ljbGljX2Zp
bGVpby02MDBzLTEwMCUtMUhERC1idHJmcy02NEctMTAyNGYtcm5kcmQtc3luYy14ODZfNjQtcmhl
bC1DWUNMSUNfQkFTRS1iOTUzYzBkMjM0YmM3MmU4NDg5ZDNiZjUxYTI3NmM1YzRlYzg1MzQ1LTAt
MjAxNTA2MjItODE5NzItN2Fzem14LnlhbWwKLSBBUkNIPXg4Nl82NAotIGtjb25maWc9eDg2XzY0
LXJoZWwKLSBicmFuY2g9bGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUwNjIyMjIKLSBjb21t
aXQ9Yjk1M2MwZDIzNGJjNzJlODQ4OWQzYmY1MWEyNzZjNWM0ZWM4NTM0NQotIEJPT1RfSU1BR0U9
L3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45L2I5NTNjMGQyMzRiYzcyZTg0ODlkM2JmNTFh
Mjc2YzVjNGVjODUzNDUvdm1saW51ei00LjEuMAotIG1heF91cHRpbWU9MzUyNgotIFJFU1VMVF9S
T09UPS9yZXN1bHQvZmlsZWlvLzYwMHMtMTAwJS0xSERELWJ0cmZzLTY0Ry0xMDI0Zi1ybmRyZC1z
eW5jL2xrcC13czAyL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2Nj
LTQuOS9iOTUzYzBkMjM0YmM3MmU4NDg5ZDNiZjUxYTI3NmM1YzRlYzg1MzQ1LzAKLSBMS1BfU0VS
VkVSPWlubgotIHwtCiAgaXBtaV93YXRjaGRvZy5zdGFydF9ub3c9MQoKICBlYXJseXByaW50az10
dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCiAgZGVidWcgYXBpYz1kZWJ1ZyBzeXNy
cV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCiAgcGFu
aWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmljIGxv
YWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNrPTAKICBjb25zb2xlPXR0eVMwLDExNTIwMCBjb25z
b2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwpsa3BfaW5pdHJkOiAiL2xrcC9sa3AvbGtwLXg4Nl82
NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45L2I5
NTNjMGQyMzRiYzcyZTg0ODlkM2JmNTFhMjc2YzVjNGVjODUzNDUvbW9kdWxlcy5jZ3oiCmJtX2lu
aXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9sa3AuY2d6
LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9ydW4taXBjb25maWcu
Y2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei90dXJib3N0YXQu
Y2d6LC9sa3AvYmVuY2htYXJrcy90dXJib3N0YXQuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4
Nl82NC0yMDE1LTAyLTA3LmNnei9mcy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIw
MTUtMDItMDcuY2d6L2ZpbGVpby5jZ3oiCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogMjIu
MDggMjAuNTggMTEuNzEgMS8zMTYgMzgyNQpzdGFydF90aW1lOiAnMTQzNDk4NTkxNScKZW5kX3Rp
bWU6ICcxNDM0OTg3MzMyJwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE1MDYyMi0xMDEwNTIi
Cg==

--===============7410726873392523802==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

bWtmcyAtdCBidHJmcyAvZGV2L3NkZDEKbW91bnQgLXQgYnRyZnMgL2Rldi9zZGQxIC9mcy9zZGQx
CmNkIC9mcy9zZGQxCnN5c2JlbmNoIC0tdGVzdD1maWxlaW8gLS1tYXgtcmVxdWVzdHM9MCAtLW51
bS10aHJlYWRzPTI0IC0tbWF4LXRpbWU9NjAwIC0tZmlsZS10ZXN0LW1vZGU9cm5kcmQgLS1maWxl
LXRvdGFsLXNpemU9Njg3MTk0NzY3MzYgLS1maWxlLWlvLW1vZGU9c3luYyAtLWZpbGUtbnVtPTEw
MjQgcHJlcGFyZQpzeXNiZW5jaCAtLXRlc3Q9ZmlsZWlvIC0tbWF4LXJlcXVlc3RzPTAgLS1udW0t
dGhyZWFkcz0yNCAtLW1heC10aW1lPTYwMCAtLWZpbGUtdGVzdC1tb2RlPXJuZHJkIC0tZmlsZS10
b3RhbC1zaXplPTY4NzE5NDc2NzM2IC0tZmlsZS1pby1tb2RlPXN5bmMgLS1maWxlLW51bT0xMDI0
IHJ1bgo=

--===============7410726873392523802==--

