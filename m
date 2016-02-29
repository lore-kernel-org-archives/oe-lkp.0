Content-Type: multipart/mixed; boundary="===============1159199320178872385=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [ext4] 1f2d779fed: +34.0% fsmark.files_per_sec
Date: Mon, 29 Feb 2016 16:50:15 +0800
Message-ID: <87vb57yk6w.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1159199320178872385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit 1f2d779fed21806ffed84aa65617c6125f480e85 ("ext4: optimize group sear=
ch for inode allocation")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/filesize/fs/iterations/kconfig/nr_directorie=
s/nr_files_per_directory/nr_threads/rootfs/sync_method/tbox_group/test_size=
/testcase:
  gcc-4.9/performance/1HDD/9B/ext4/1x/x86_64-rhel/16d/256fpd/32t/debian-x86=
_64-2015-02-07.cgz/fsyncBeforeClose/lkp-ne04/400M/fsmark

commit: =

  29c6eaffc8868ef6fa71997d0ea507a02c52712c
  1f2d779fed21806ffed84aa65617c6125f480e85

29c6eaffc8868ef6 1f2d779fed21806ffed84aa656 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   1479204 =C2=B1 11%     +47.7%    2184108 =C2=B1  7%  fsmark.app_overhead
    148.78 =C2=B1  3%     +34.0%     199.38 =C2=B1  2%  fsmark.files_per_sec
    693.79 =C2=B1  3%     -26.1%     512.52 =C2=B1  2%  fsmark.time.elapsed=
_time
    693.79 =C2=B1  3%     -26.1%     512.52 =C2=B1  2%  fsmark.time.elapsed=
_time.max
    264.00 =C2=B1  0%  +11372.0%      30286 =C2=B1 15%  fsmark.time.file_sy=
stem_inputs
      2.00 =C2=B1  0%    +100.0%       4.00 =C2=B1  0%  fsmark.time.percent=
_of_cpu_this_job_got
    408852 =C2=B1  1%     +19.0%     486551 =C2=B1  0%  fsmark.time.volunta=
ry_context_switches
     42686 =C2=B1  4%      -9.2%      38753 =C2=B1  1%  softirqs.RCU
     43495 =C2=B1  3%      -6.4%      40722 =C2=B1  4%  softirqs.SCHED
    717.23 =C2=B1  3%     -24.2%     543.65 =C2=B1  2%  uptime.boot
      9657 =C2=B1  4%     -28.5%       6902 =C2=B1  3%  uptime.idle
      3817 =C2=B1  1%     +26.2%       4819 =C2=B1  2%  vmstat.system.cs
    431.50 =C2=B1  1%     +31.4%     567.00 =C2=B1  4%  vmstat.system.in
    620517 =C2=B1  4%     -23.2%     476762 =C2=B1  1%  numa-numastat.node0=
.local_node
    620519 =C2=B1  4%     -23.2%     476763 =C2=B1  1%  numa-numastat.node0=
.numa_hit
    783065 =C2=B1  5%     -24.2%     593500 =C2=B1  3%  numa-numastat.node1=
.local_node
    783066 =C2=B1  5%     -24.2%     593500 =C2=B1  3%  numa-numastat.node1=
.numa_hit
  36911353 =C2=B1  8%     +61.1%   59481022 =C2=B1  5%  cpuidle.C1E-NHM.time
      9758 =C2=B1  5%     +41.5%      13810 =C2=B1  2%  cpuidle.C1E-NHM.usa=
ge
 4.406e+08 =C2=B1  5%     +34.7%  5.934e+08 =C2=B1  5%  cpuidle.C3-NHM.time
    112418 =C2=B1  3%     +50.3%     168929 =C2=B1  1%  cpuidle.C3-NHM.usage
 1.049e+10 =C2=B1  3%     -29.3%  7.418e+09 =C2=B1  3%  cpuidle.C6-NHM.time
     81277 =C2=B1  3%     -20.9%      64279 =C2=B1  2%  cpuidle.POLL.usage
      1059 =C2=B1  5%      -8.8%     965.75 =C2=B1  7%  slabinfo.blkdev_req=
uests.num_objs
    638.25 =C2=B1  4%     +34.7%     859.75 =C2=B1  8%  slabinfo.dquot.acti=
ve_objs
    638.50 =C2=B1  4%     +38.5%     884.25 =C2=B1  7%  slabinfo.dquot.num_=
objs
      2026 =C2=B1 13%     -26.9%       1480 =C2=B1  9%  slabinfo.jbd2_journ=
al_head.active_objs
      2061 =C2=B1 12%     -25.8%       1529 =C2=B1  9%  slabinfo.jbd2_journ=
al_head.num_objs
      2780 =C2=B1  2%     +11.5%       3099 =C2=B1  3%  slabinfo.kmalloc-25=
6.active_objs
      0.82 =C2=B1  2%     +40.4%       1.16 =C2=B1  4%  turbostat.%Busy
     22.25 =C2=B1  3%     +40.4%      31.25 =C2=B1  6%  turbostat.Avg_MHz
      2.69 =C2=B1  5%     +49.3%       4.01 =C2=B1  6%  turbostat.CPU%c1
      6.79 =C2=B1  2%     +73.8%      11.81 =C2=B1  8%  turbostat.CPU%c3
     28.16 =C2=B1  3%     +21.5%      34.22 =C2=B1  3%  turbostat.Pkg%pc3
     33.39 =C2=B1  2%     -41.9%      19.41 =C2=B1 12%  turbostat.Pkg%pc6
    693.79 =C2=B1  3%     -26.1%     512.52 =C2=B1  2%  time.elapsed_time
    693.79 =C2=B1  3%     -26.1%     512.52 =C2=B1  2%  time.elapsed_time.m=
ax
    264.00 =C2=B1  0%  +11372.0%      30286 =C2=B1 15%  time.file_system_in=
puts
      2.00 =C2=B1  0%    +100.0%       4.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
     17.25 =C2=B1  1%     +21.9%      21.03 =C2=B1  2%  time.system_time
      1.14 =C2=B1  2%     +33.8%       1.53 =C2=B1 12%  time.user_time
    408852 =C2=B1  1%     +19.0%     486551 =C2=B1  0%  time.voluntary_cont=
ext_switches
   1400397 =C2=B1  3%     -23.9%    1066153 =C2=B1  2%  proc-vmstat.numa_hit
   1400394 =C2=B1  3%     -23.9%    1066151 =C2=B1  2%  proc-vmstat.numa_lo=
cal
    247146 =C2=B1  4%     -23.1%     190110 =C2=B1  1%  proc-vmstat.pgalloc=
_dma32
   1235243 =C2=B1  4%     -23.6%     943649 =C2=B1  2%  proc-vmstat.pgalloc=
_normal
   1461923 =C2=B1  4%     -25.7%    1086000 =C2=B1  2%  proc-vmstat.pgfault
   1314409 =C2=B1  4%     -26.9%     961033 =C2=B1  2%  proc-vmstat.pgfree
    132.00 =C2=B1  0%  +11365.9%      15135 =C2=B1 15%  proc-vmstat.pgpgin
   3926356 =C2=B1 18%     -38.5%    2413806 =C2=B1 16%  proc-vmstat.pgpgout
    141.50 =C2=B1 16%   +1078.3%       1667 =C2=B1 52%  numa-vmstat.node0.n=
r_shmem
     22694 =C2=B1  0%     -17.7%      18679 =C2=B1 11%  numa-vmstat.node0.n=
r_slab_reclaimable
      6899 =C2=B1  1%     -12.3%       6049 =C2=B1  1%  numa-vmstat.node0.n=
r_slab_unreclaimable
    447024 =C2=B1  4%     -13.7%     385841 =C2=B1  4%  numa-vmstat.node0.n=
uma_hit
    384765 =C2=B1  5%     -15.8%     323917 =C2=B1  4%  numa-vmstat.node0.n=
uma_local
     63402 =C2=B1  1%     +19.2%      75581 =C2=B1 11%  numa-vmstat.node1.n=
r_file_pages
      2160 =C2=B1  0%     -71.6%     613.25 =C2=B1143%  numa-vmstat.node1.n=
r_inactive_anon
     48098 =C2=B1  2%     +28.5%      61803 =C2=B1 12%  numa-vmstat.node1.n=
r_inactive_file
      2373 =C2=B1  0%     -31.3%       1630 =C2=B1 25%  numa-vmstat.node1.n=
r_mapped
      2207 =C2=B1  1%     -70.1%     659.50 =C2=B1133%  numa-vmstat.node1.n=
r_shmem
      5466 =C2=B1  4%     +78.8%       9772 =C2=B1 24%  numa-vmstat.node1.n=
r_slab_reclaimable
      4392 =C2=B1  1%     +20.0%       5272 =C2=B1  1%  numa-vmstat.node1.n=
r_slab_unreclaimable
    523487 =C2=B1  1%     -20.1%     418465 =C2=B1  6%  numa-vmstat.node1.n=
uma_hit
    519756 =C2=B1  1%     -20.2%     414604 =C2=B1  6%  numa-vmstat.node1.n=
uma_local
     90778 =C2=B1  0%     -17.7%      74720 =C2=B1 11%  numa-meminfo.node0.=
SReclaimable
     27598 =C2=B1  1%     -12.3%      24198 =C2=B1  1%  numa-meminfo.node0.=
SUnreclaim
    567.50 =C2=B1 16%   +1075.3%       6670 =C2=B1 52%  numa-meminfo.node0.=
Shmem
    118377 =C2=B1  0%     -16.4%      98919 =C2=B1  9%  numa-meminfo.node0.=
Slab
    253611 =C2=B1  1%     +19.2%     302328 =C2=B1 11%  numa-meminfo.node1.=
FilePages
    201041 =C2=B1  2%     +24.2%     249668 =C2=B1 13%  numa-meminfo.node1.=
Inactive
      8645 =C2=B1  0%     -71.6%       2454 =C2=B1143%  numa-meminfo.node1.=
Inactive(anon)
    192396 =C2=B1  2%     +28.5%     247214 =C2=B1 12%  numa-meminfo.node1.=
Inactive(file)
      2197 =C2=B1 15%     +25.2%       2752 =C2=B1  7%  numa-meminfo.node1.=
KernelStack
      9494 =C2=B1  0%     -31.3%       6524 =C2=B1 25%  numa-meminfo.node1.=
Mapped
    345480 =C2=B1  1%     +20.3%     415555 =C2=B1 10%  numa-meminfo.node1.=
MemUsed
     21865 =C2=B1  4%     +78.8%      39089 =C2=B1 24%  numa-meminfo.node1.=
SReclaimable
     17570 =C2=B1  1%     +20.0%      21091 =C2=B1  1%  numa-meminfo.node1.=
SUnreclaim
      8830 =C2=B1  1%     -70.1%       2640 =C2=B1133%  numa-meminfo.node1.=
Shmem
     39436 =C2=B1  2%     +52.6%      60181 =C2=B1 16%  numa-meminfo.node1.=
Slab
     25609 =C2=B1155%     -99.0%     247.00 =C2=B1173%  latency_stats.avg.d=
o_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_a=
ccess.ext4_reserve_inode_write.ext4_mark_inode_dirty.ext4_dirty_inode.__mar=
k_inode_dirty.generic_update_time.file_update_time.__generic_file_write_ite=
r.ext4_file_write_iter.__vfs_write
     34613 =C2=B1 17%     -93.2%       2366 =C2=B1100%  latency_stats.avg.s=
ubmit_bio_wait.blkdev_issue_flush.ext4_sync_file.vfs_fsync_range.do_fsync.S=
yS_fsync.entry_SYSCALL_64_fastpath
     62402 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.s=
ubmit_bio_wait.blkdev_issue_flush.jbd2_cleanup_journal_tail.jbd2_log_do_che=
ckpoint.__jbd2_log_wait_for_space.add_transaction_credits.start_this_handle=
.jbd2__journal_start.__ext4_journal_start_sb.__ext4_new_inode.ext4_create.v=
fs_create
     85292 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.s=
ubmit_bio_wait.blkdev_issue_flush.jbd2_cleanup_journal_tail.jbd2_log_do_che=
ckpoint.__jbd2_log_wait_for_space.add_transaction_credits.start_this_handle=
.jbd2__journal_start.__ext4_journal_start_sb.ext4_da_write_begin.generic_pe=
rform_write.__generic_file_write_iter
    233836 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.s=
ubmit_bio_wait.blkdev_issue_flush.jbd2_cleanup_journal_tail.jbd2_log_do_che=
ckpoint.__jbd2_log_wait_for_space.add_transaction_credits.start_this_handle=
.jbd2__journal_start.__ext4_journal_start_sb.ext4_dirty_inode.__mark_inode_=
dirty.generic_update_time
     98586 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.s=
ubmit_bio_wait.blkdev_issue_flush.jbd2_cleanup_journal_tail.jbd2_log_do_che=
ckpoint.__jbd2_log_wait_for_space.add_transaction_credits.start_this_handle=
.jbd2__journal_start.__ext4_journal_start_sb.ext4_writepages.do_writepages.=
__filemap_fdatawrite_range
    138727 =C2=B1 20%     -99.7%     356.50 =C2=B1 34%  latency_stats.avg.w=
ait_transaction_locked.add_transaction_credits.start_this_handle.jbd2__jour=
nal_start.__ext4_journal_start_sb.ext4_dirty_inode.__mark_inode_dirty.gener=
ic_update_time.file_update_time.__generic_file_write_iter.ext4_file_write_i=
ter.__vfs_write
      0.00 =C2=B1 -1%      +Inf%       7289 =C2=B1 37%  latency_stats.hits.=
do_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_=
access.ext4_reserve_inode_write.ext4_mark_inode_dirty.add_dirent_to_buf.ext=
4_dx_add_entry.ext4_add_entry.ext4_add_nondir.ext4_create.vfs_create.path_o=
penat
     27954 =C2=B1  1%     -86.6%       3734 =C2=B1 49%  latency_stats.hits.=
ext4_mb_initialize_context.ext4_mb_new_blocks.ext4_ext_map_blocks.ext4_map_=
blocks.ext4_writepages.do_writepages.__filemap_fdatawrite_range.filemap_wri=
te_and_wait_range.ext4_sync_file.vfs_fsync_range.do_fsync.SyS_fsync
    290546 =C2=B1 16%     -85.7%      41420 =C2=B1 36%  latency_stats.max.d=
o_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_a=
ccess.__ext4_new_inode.ext4_create.vfs_create.path_openat.do_filp_open.do_s=
ys_open.SyS_open.entry_SYSCALL_64_fastpath
    265287 =C2=B1  9%     -85.9%      37329 =C2=B1 63%  latency_stats.max.d=
o_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_a=
ccess.ext4_mb_mark_diskspace_used.ext4_mb_new_blocks.ext4_ext_map_blocks.ex=
t4_map_blocks.ext4_writepages.do_writepages.__filemap_fdatawrite_range.file=
map_write_and_wait_range.ext4_sync_file
      0.00 =C2=B1 -1%      +Inf%      16683 =C2=B1 61%  latency_stats.max.d=
o_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_a=
ccess.ext4_reserve_inode_write.ext4_mark_inode_dirty.add_dirent_to_buf.ext4=
_add_entry.ext4_add_nondir.ext4_create.vfs_create.path_openat.do_filp_open
      0.00 =C2=B1 -1%      +Inf%      29279 =C2=B1 73%  latency_stats.max.d=
o_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_a=
ccess.ext4_reserve_inode_write.ext4_mark_inode_dirty.add_dirent_to_buf.ext4=
_dx_add_entry.ext4_add_entry.ext4_add_nondir.ext4_create.vfs_create.path_op=
enat
     63561 =C2=B1165%     -99.6%     267.75 =C2=B1173%  latency_stats.max.d=
o_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_a=
ccess.ext4_reserve_inode_write.ext4_mark_inode_dirty.ext4_dirty_inode.__mar=
k_inode_dirty.generic_update_time.file_update_time.__generic_file_write_ite=
r.ext4_file_write_iter.__vfs_write
     62202 =C2=B1 74%     -95.4%       2841 =C2=B1 21%  latency_stats.max.d=
o_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_a=
ccess.ext4_reserve_inode_write.ext4_mark_inode_dirty.ext4_dirty_inode.__mar=
k_inode_dirty.generic_write_end.ext4_da_write_end.generic_perform_write.__g=
eneric_file_write_iter.ext4_file_write_iter
      0.00 =C2=B1 -1%      +Inf%      37841 =C2=B1 39%  latency_stats.max.d=
o_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_a=
ccess.ext4_reserve_inode_write.ext4_mark_inode_dirty.ext4_ext_tree_init.__e=
xt4_new_inode.ext4_create.vfs_create.path_openat.do_filp_open.do_sys_open
    279828 =C2=B1 21%     -94.5%      15429 =C2=B1 97%  latency_stats.max.e=
xt4_mb_initialize_context.ext4_mb_new_blocks.ext4_ext_map_blocks.ext4_map_b=
locks.ext4_writepages.do_writepages.__filemap_fdatawrite_range.filemap_writ=
e_and_wait_range.ext4_sync_file.vfs_fsync_range.do_fsync.SyS_fsync
    176558 =C2=B1 21%     -95.8%       7488 =C2=B1102%  latency_stats.max.s=
ubmit_bio_wait.blkdev_issue_flush.ext4_sync_file.vfs_fsync_range.do_fsync.S=
yS_fsync.entry_SYSCALL_64_fastpath
    381747 =C2=B1 21%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.s=
ubmit_bio_wait.blkdev_issue_flush.jbd2_cleanup_journal_tail.jbd2_log_do_che=
ckpoint.__jbd2_log_wait_for_space.add_transaction_credits.start_this_handle=
.jbd2__journal_start.__ext4_journal_start_sb.__ext4_new_inode.ext4_create.v=
fs_create
    165796 =C2=B1 24%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.s=
ubmit_bio_wait.blkdev_issue_flush.jbd2_cleanup_journal_tail.jbd2_log_do_che=
ckpoint.__jbd2_log_wait_for_space.add_transaction_credits.start_this_handle=
.jbd2__journal_start.__ext4_journal_start_sb.ext4_da_write_begin.generic_pe=
rform_write.__generic_file_write_iter
    406817 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.s=
ubmit_bio_wait.blkdev_issue_flush.jbd2_cleanup_journal_tail.jbd2_log_do_che=
ckpoint.__jbd2_log_wait_for_space.add_transaction_credits.start_this_handle=
.jbd2__journal_start.__ext4_journal_start_sb.ext4_dirty_inode.__mark_inode_=
dirty.generic_update_time
    165247 =C2=B1 40%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.s=
ubmit_bio_wait.blkdev_issue_flush.jbd2_cleanup_journal_tail.jbd2_log_do_che=
ckpoint.__jbd2_log_wait_for_space.add_transaction_credits.start_this_handle=
.jbd2__journal_start.__ext4_journal_start_sb.ext4_writepages.do_writepages.=
__filemap_fdatawrite_range
    324551 =C2=B1 12%     -91.2%      28575 =C2=B1 43%  latency_stats.max.w=
ait_transaction_locked.add_transaction_credits.start_this_handle.jbd2__jour=
nal_start.__ext4_journal_start_sb.__ext4_new_inode.ext4_create.vfs_create.p=
ath_openat.do_filp_open.do_sys_open.SyS_open
    458237 =C2=B1 15%     -99.5%       2140 =C2=B1 76%  latency_stats.max.w=
ait_transaction_locked.add_transaction_credits.start_this_handle.jbd2__jour=
nal_start.__ext4_journal_start_sb.ext4_dirty_inode.__mark_inode_dirty.gener=
ic_update_time.file_update_time.__generic_file_write_iter.ext4_file_write_i=
ter.__vfs_write
    234367 =C2=B1 47%     -94.6%      12766 =C2=B1 80%  latency_stats.max.w=
ait_transaction_locked.add_transaction_credits.start_this_handle.jbd2__jour=
nal_start.__ext4_journal_start_sb.ext4_writepages.do_writepages.__filemap_f=
datawrite_range.filemap_write_and_wait_range.ext4_sync_file.vfs_fsync_range=
.do_fsync
      0.00 =C2=B1 -1%      +Inf%      23646 =C2=B1123%  latency_stats.sum.d=
o_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_a=
ccess.ext4_mb_mark_diskspace_used.ext4_mb_new_blocks.ext4_ext_map_blocks.ex=
t4_map_blocks.ext4_getblk.ext4_bread.ext4_append.do_split.ext4_dx_add_entry
      0.00 =C2=B1 -1%      +Inf%      30398 =C2=B1 50%  latency_stats.sum.d=
o_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_a=
ccess.ext4_mb_mark_diskspace_used.ext4_mb_new_blocks.ext4_ext_map_blocks.ex=
t4_map_blocks.ext4_getblk.ext4_bread.ext4_append.ext4_mkdir.vfs_mkdir
      0.00 =C2=B1 -1%      +Inf%      56525 =C2=B1105%  latency_stats.sum.d=
o_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_a=
ccess.ext4_mb_mark_diskspace_used.ext4_mb_new_blocks.ext4_ext_map_blocks.ex=
t4_map_blocks.ext4_getblk.ext4_bread.ext4_append.make_indexed_dir.ext4_add_=
entry
  41228828 =C2=B1  7%     -92.4%    3149423 =C2=B1 67%  latency_stats.sum.d=
o_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_a=
ccess.ext4_mb_mark_diskspace_used.ext4_mb_new_blocks.ext4_ext_map_blocks.ex=
t4_map_blocks.ext4_writepages.do_writepages.__filemap_fdatawrite_range.file=
map_write_and_wait_range.ext4_sync_file
      0.00 =C2=B1 -1%      +Inf%    1241212 =C2=B1 55%  latency_stats.sum.d=
o_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_a=
ccess.ext4_reserve_inode_write.ext4_mark_inode_dirty.add_dirent_to_buf.ext4=
_add_entry.ext4_add_nondir.ext4_create.vfs_create.path_openat.do_filp_open
      0.00 =C2=B1 -1%      +Inf%    2727180 =C2=B1 46%  latency_stats.sum.d=
o_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_a=
ccess.ext4_reserve_inode_write.ext4_mark_inode_dirty.add_dirent_to_buf.ext4=
_dx_add_entry.ext4_add_entry.ext4_add_nondir.ext4_create.vfs_create.path_op=
enat
      0.00 =C2=B1 -1%      +Inf%      88155 =C2=B1 72%  latency_stats.sum.d=
o_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_a=
ccess.ext4_reserve_inode_write.ext4_mark_inode_dirty.ext4_dirty_inode.__mar=
k_inode_dirty.ext4_mb_new_blocks.ext4_ext_map_blocks.ext4_map_blocks.ext4_g=
etblk.ext4_bread
    200757 =C2=B1159%     -99.5%     988.25 =C2=B1173%  latency_stats.sum.d=
o_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_a=
ccess.ext4_reserve_inode_write.ext4_mark_inode_dirty.ext4_dirty_inode.__mar=
k_inode_dirty.generic_update_time.file_update_time.__generic_file_write_ite=
r.ext4_file_write_iter.__vfs_write
   1755344 =C2=B1  9%     -94.1%     103667 =C2=B1 53%  latency_stats.sum.d=
o_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_a=
ccess.ext4_reserve_inode_write.ext4_mark_inode_dirty.ext4_dirty_inode.__mar=
k_inode_dirty.generic_write_end.ext4_da_write_end.generic_perform_write.__g=
eneric_file_write_iter.ext4_file_write_iter
      0.00 =C2=B1 -1%      +Inf%    4885655 =C2=B1 35%  latency_stats.sum.d=
o_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_a=
ccess.ext4_reserve_inode_write.ext4_mark_inode_dirty.ext4_ext_tree_init.__e=
xt4_new_inode.ext4_create.vfs_create.path_openat.do_filp_open.do_sys_open
      0.00 =C2=B1 -1%      +Inf%      35213 =C2=B1 40%  latency_stats.sum.d=
o_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_a=
ccess.ext4_reserve_inode_write.ext4_mark_inode_dirty.ext4_ext_tree_init.__e=
xt4_new_inode.ext4_mkdir.vfs_mkdir.SyS_mkdir.entry_SYSCALL_64_fastpath
  35021878 =C2=B1 12%     -97.3%     959921 =C2=B1 59%  latency_stats.sum.e=
xt4_mb_initialize_context.ext4_mb_new_blocks.ext4_ext_map_blocks.ext4_map_b=
locks.ext4_writepages.do_writepages.__filemap_fdatawrite_range.filemap_writ=
e_and_wait_range.ext4_sync_file.vfs_fsync_range.do_fsync.SyS_fsync
   2610110 =C2=B1 10%     -99.6%      10320 =C2=B1115%  latency_stats.sum.s=
ubmit_bio_wait.blkdev_issue_flush.ext4_sync_file.vfs_fsync_range.do_fsync.S=
yS_fsync.entry_SYSCALL_64_fastpath
   7233874 =C2=B1 35%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.s=
ubmit_bio_wait.blkdev_issue_flush.jbd2_cleanup_journal_tail.jbd2_log_do_che=
ckpoint.__jbd2_log_wait_for_space.add_transaction_credits.start_this_handle=
.jbd2__journal_start.__ext4_journal_start_sb.__ext4_new_inode.ext4_create.v=
fs_create
   1159776 =C2=B1 50%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.s=
ubmit_bio_wait.blkdev_issue_flush.jbd2_cleanup_journal_tail.jbd2_log_do_che=
ckpoint.__jbd2_log_wait_for_space.add_transaction_credits.start_this_handle=
.jbd2__journal_start.__ext4_journal_start_sb.ext4_da_write_begin.generic_pe=
rform_write.__generic_file_write_iter
    822013 =C2=B1 35%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.s=
ubmit_bio_wait.blkdev_issue_flush.jbd2_cleanup_journal_tail.jbd2_log_do_che=
ckpoint.__jbd2_log_wait_for_space.add_transaction_credits.start_this_handle=
.jbd2__journal_start.__ext4_journal_start_sb.ext4_dirty_inode.__mark_inode_=
dirty.generic_update_time
    810979 =C2=B1 49%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.s=
ubmit_bio_wait.blkdev_issue_flush.jbd2_cleanup_journal_tail.jbd2_log_do_che=
ckpoint.__jbd2_log_wait_for_space.add_transaction_credits.start_this_handle=
.jbd2__journal_start.__ext4_journal_start_sb.ext4_writepages.do_writepages.=
__filemap_fdatawrite_range
   3757907 =C2=B1  7%     -99.8%       7957 =C2=B1 37%  latency_stats.sum.w=
ait_transaction_locked.add_transaction_credits.start_this_handle.jbd2__jour=
nal_start.__ext4_journal_start_sb.ext4_dirty_inode.__mark_inode_dirty.gener=
ic_update_time.file_update_time.__generic_file_write_iter.ext4_file_write_i=
ter.__vfs_write
   1020128 =C2=B1 78%     -94.6%      54940 =C2=B1 73%  latency_stats.sum.w=
ait_transaction_locked.add_transaction_credits.start_this_handle.jbd2__jour=
nal_start.__ext4_journal_start_sb.ext4_writepages.do_writepages.__filemap_f=
datawrite_range.filemap_write_and_wait_range.ext4_sync_file.vfs_fsync_range=
.do_fsync
      5691 =C2=B1  8%     -22.7%       4398 =C2=B1 14%  sched_debug.cfs_rq:=
/.exec_clock.0
    854.81 =C2=B1 10%    +157.0%       2196 =C2=B1 27%  sched_debug.cfs_rq:=
/.exec_clock.11
      2946 =C2=B1  3%     -16.0%       2475 =C2=B1  4%  sched_debug.cfs_rq:=
/.exec_clock.4
      2075 =C2=B1  6%     -19.3%       1673 =C2=B1 10%  sched_debug.cfs_rq:=
/.exec_clock.8
      2.75 =C2=B1 30%    +318.2%      11.50 =C2=B1 58%  sched_debug.cfs_rq:=
/.load_avg.1
      5.25 =C2=B1 75%    +266.7%      19.25 =C2=B1 20%  sched_debug.cfs_rq:=
/.load_avg.7
     12.00 =C2=B1 31%     -70.8%       3.50 =C2=B1 24%  sched_debug.cfs_rq:=
/.load_avg.8
      1.25 =C2=B1 34%    +860.0%      12.00 =C2=B1 33%  sched_debug.cfs_rq:=
/.load_avg.9
      0.22 =C2=B1 37%    +116.7%       0.47 =C2=B1 19%  sched_debug.cfs_rq:=
/.load_avg.min
      6649 =C2=B1 29%     -31.8%       4537 =C2=B1 15%  sched_debug.cfs_rq:=
/.min_vruntime.8
      7953 =C2=B1  4%     -12.7%       6940 =C2=B1  3%  sched_debug.cfs_rq:=
/.min_vruntime.avg
     19991 =C2=B1  6%     -22.3%      15531 =C2=B1  5%  sched_debug.cfs_rq:=
/.min_vruntime.max
      4514 =C2=B1  8%     -25.9%       3343 =C2=B1  9%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      0.75 =C2=B1110%    +433.3%       4.00 =C2=B1 30%  sched_debug.cfs_rq:=
/.nr_spread_over.13
      4514 =C2=B1  8%     -25.9%       3343 =C2=B1  9%  sched_debug.cfs_rq:=
/.spread0.stddev
     22.00 =C2=B1 19%    +104.5%      45.00 =C2=B1 19%  sched_debug.cfs_rq:=
/.util_avg.2
    361962 =C2=B1  3%     -24.9%     271884 =C2=B1  0%  sched_debug.cpu.clo=
ck.0
    361962 =C2=B1  3%     -24.9%     271883 =C2=B1  0%  sched_debug.cpu.clo=
ck.1
    361968 =C2=B1  3%     -24.9%     271888 =C2=B1  0%  sched_debug.cpu.clo=
ck.10
    361969 =C2=B1  3%     -24.9%     271884 =C2=B1  0%  sched_debug.cpu.clo=
ck.11
    361969 =C2=B1  3%     -24.9%     271889 =C2=B1  0%  sched_debug.cpu.clo=
ck.12
    361963 =C2=B1  3%     -24.9%     271887 =C2=B1  0%  sched_debug.cpu.clo=
ck.13
    361971 =C2=B1  3%     -24.9%     271890 =C2=B1  0%  sched_debug.cpu.clo=
ck.14
    361966 =C2=B1  3%     -24.9%     271893 =C2=B1  0%  sched_debug.cpu.clo=
ck.15
    361965 =C2=B1  3%     -24.9%     271886 =C2=B1  0%  sched_debug.cpu.clo=
ck.2
    361945 =C2=B1  3%     -24.9%     271880 =C2=B1  0%  sched_debug.cpu.clo=
ck.3
    361968 =C2=B1  3%     -24.9%     271885 =C2=B1  0%  sched_debug.cpu.clo=
ck.4
    361964 =C2=B1  3%     -24.9%     271890 =C2=B1  0%  sched_debug.cpu.clo=
ck.5
    361971 =C2=B1  3%     -24.9%     271886 =C2=B1  0%  sched_debug.cpu.clo=
ck.6
    361967 =C2=B1  3%     -24.9%     271890 =C2=B1  0%  sched_debug.cpu.clo=
ck.7
    361963 =C2=B1  3%     -24.9%     271886 =C2=B1  0%  sched_debug.cpu.clo=
ck.8
    361965 =C2=B1  3%     -24.9%     271881 =C2=B1  0%  sched_debug.cpu.clo=
ck.9
    361965 =C2=B1  3%     -24.9%     271886 =C2=B1  0%  sched_debug.cpu.clo=
ck.avg
    361973 =C2=B1  3%     -24.9%     271893 =C2=B1  0%  sched_debug.cpu.clo=
ck.max
    361913 =C2=B1  3%     -24.9%     271854 =C2=B1  0%  sched_debug.cpu.clo=
ck.min
     15.52 =C2=B1 18%     -27.6%      11.24 =C2=B1 25%  sched_debug.cpu.clo=
ck.stddev
    361962 =C2=B1  3%     -24.9%     271884 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.0
    361962 =C2=B1  3%     -24.9%     271883 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.1
    361968 =C2=B1  3%     -24.9%     271888 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.10
    361969 =C2=B1  3%     -24.9%     271884 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.11
    361969 =C2=B1  3%     -24.9%     271889 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.12
    361963 =C2=B1  3%     -24.9%     271887 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.13
    361971 =C2=B1  3%     -24.9%     271890 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.14
    361966 =C2=B1  3%     -24.9%     271893 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.15
    361965 =C2=B1  3%     -24.9%     271886 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.2
    361945 =C2=B1  3%     -24.9%     271880 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.3
    361968 =C2=B1  3%     -24.9%     271885 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.4
    361964 =C2=B1  3%     -24.9%     271890 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.5
    361971 =C2=B1  3%     -24.9%     271886 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.6
    361967 =C2=B1  3%     -24.9%     271890 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.7
    361963 =C2=B1  3%     -24.9%     271886 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.8
    361965 =C2=B1  3%     -24.9%     271881 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.9
    361965 =C2=B1  3%     -24.9%     271886 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.avg
    361973 =C2=B1  3%     -24.9%     271893 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.max
    361913 =C2=B1  3%     -24.9%     271854 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.min
     15.52 =C2=B1 18%     -27.6%      11.24 =C2=B1 25%  sched_debug.cpu.clo=
ck_task.stddev
    594.58 =C2=B1 12%     -30.7%     412.29 =C2=B1 12%  sched_debug.cpu.cur=
r->pid.avg
      8265 =C2=B1  6%     -36.1%       5285 =C2=B1 12%  sched_debug.cpu.cur=
r->pid.max
      2062 =C2=B1  7%     -34.6%       1348 =C2=B1 11%  sched_debug.cpu.cur=
r->pid.stddev
     25768 =C2=B1  4%     -11.4%      22823 =C2=B1  7%  sched_debug.cpu.nr_=
load_updates.6
      7155 =C2=B1  5%     -21.9%       5586 =C2=B1 14%  sched_debug.cpu.nr_=
load_updates.stddev
      7911 =C2=B1  9%    +225.8%      25779 =C2=B1 60%  sched_debug.cpu.nr_=
switches.11
     61043 =C2=B1  5%     -20.1%      48763 =C2=B1 23%  sched_debug.cpu.nr_=
switches.14
     11503 =C2=B1 41%    +164.9%      30476 =C2=B1 57%  sched_debug.cpu.nr_=
switches.15
      7955 =C2=B1  3%    +138.1%      18945 =C2=B1 39%  sched_debug.cpu.nr_=
switches.9
      7498 =C2=B1  6%    +134.5%      17581 =C2=B1 40%  sched_debug.cpu.nr_=
switches.min
     61163 =C2=B1  7%     -18.1%      50102 =C2=B1  9%  sched_debug.cpu.nr_=
switches.stddev
    -33543 =C2=B1 -4%     -41.2%     -19708 =C2=B1-38%  sched_debug.cpu.nr_=
uninterruptible.0
      3853 =C2=B1  6%     -52.0%       1849 =C2=B1 41%  sched_debug.cpu.nr_=
uninterruptible.10
     86.75 =C2=B1 59%    +195.4%     256.25 =C2=B1 22%  sched_debug.cpu.nr_=
uninterruptible.11
      3849 =C2=B1 10%     -48.7%       1974 =C2=B1 45%  sched_debug.cpu.nr_=
uninterruptible.12
     83.25 =C2=B1 66%    +253.8%     294.50 =C2=B1 31%  sched_debug.cpu.nr_=
uninterruptible.13
      3930 =C2=B1  7%     -48.4%       2029 =C2=B1 42%  sched_debug.cpu.nr_=
uninterruptible.14
     77.00 =C2=B1 35%    +241.6%     263.00 =C2=B1 25%  sched_debug.cpu.nr_=
uninterruptible.15
      4437 =C2=B1 11%     -55.8%       1959 =C2=B1 55%  sched_debug.cpu.nr_=
uninterruptible.2
      4509 =C2=B1  5%     -51.1%       2206 =C2=B1 51%  sched_debug.cpu.nr_=
uninterruptible.4
      4507 =C2=B1  9%     -50.6%       2226 =C2=B1 51%  sched_debug.cpu.nr_=
uninterruptible.6
      7142 =C2=B1  6%     -29.1%       5065 =C2=B1 29%  sched_debug.cpu.nr_=
uninterruptible.8
     87.25 =C2=B1 42%    +204.3%     265.50 =C2=B1 24%  sched_debug.cpu.nr_=
uninterruptible.9
      7146 =C2=B1  6%     -29.1%       5065 =C2=B1 29%  sched_debug.cpu.nr_=
uninterruptible.max
    -33542 =C2=B1 -4%     -41.2%     -19707 =C2=B1-38%  sched_debug.cpu.nr_=
uninterruptible.min
      8953 =C2=B1  4%     -41.4%       5250 =C2=B1 38%  sched_debug.cpu.nr_=
uninterruptible.stddev
      7958 =C2=B1  9%    +224.4%      25817 =C2=B1 60%  sched_debug.cpu.sch=
ed_count.11
     11549 =C2=B1 40%    +169.2%      31095 =C2=B1 59%  sched_debug.cpu.sch=
ed_count.15
      8003 =C2=B1  3%    +137.1%      18980 =C2=B1 39%  sched_debug.cpu.sch=
ed_count.9
      7638 =C2=B1  6%    +130.6%      17616 =C2=B1 40%  sched_debug.cpu.sch=
ed_count.min
      3539 =C2=B1  9%    +217.3%      11231 =C2=B1 61%  sched_debug.cpu.sch=
ed_goidle.11
      5137 =C2=B1 46%    +159.0%      13303 =C2=B1 59%  sched_debug.cpu.sch=
ed_goidle.15
      3543 =C2=B1  4%    +119.8%       7789 =C2=B1 37%  sched_debug.cpu.sch=
ed_goidle.9
      3327 =C2=B1  5%    +112.9%       7083 =C2=B1 37%  sched_debug.cpu.sch=
ed_goidle.min
     28088 =C2=B1  7%     -18.9%      22770 =C2=B1  7%  sched_debug.cpu.sch=
ed_goidle.stddev
     40517 =C2=B1 77%     -70.7%      11888 =C2=B1 56%  sched_debug.cpu.ttw=
u_count.15
    119597 =C2=B1  3%     -30.9%      82689 =C2=B1 19%  sched_debug.cpu.ttw=
u_local.0
      4054 =C2=B1  8%     +44.6%       5862 =C2=B1 23%  sched_debug.cpu.ttw=
u_local.1
      5950 =C2=B1  3%     -32.2%       4036 =C2=B1 21%  sched_debug.cpu.ttw=
u_local.10
      1259 =C2=B1  9%    +154.6%       3206 =C2=B1 43%  sched_debug.cpu.ttw=
u_local.13
      1530 =C2=B1  8%    +126.2%       3461 =C2=B1 40%  sched_debug.cpu.ttw=
u_local.15
      8444 =C2=B1  6%     -25.1%       6328 =C2=B1 12%  sched_debug.cpu.ttw=
u_local.2
      3189 =C2=B1 15%     +53.0%       4878 =C2=B1 31%  sched_debug.cpu.ttw=
u_local.3
      6155 =C2=B1  9%     -20.3%       4905 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.4
      6013 =C2=B1 12%     -32.9%       4033 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.6
      9433 =C2=B1  2%     -19.1%       7632 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.8
      1303 =C2=B1 12%    +131.5%       3016 =C2=B1 38%  sched_debug.cpu.ttw=
u_local.9
     11588 =C2=B1  2%     -18.7%       9421 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.avg
    119620 =C2=B1  3%     -30.9%      82707 =C2=B1 19%  sched_debug.cpu.ttw=
u_local.max
      1185 =C2=B1 12%     +85.3%       2196 =C2=B1 26%  sched_debug.cpu.ttw=
u_local.min
     28011 =C2=B1  3%     -32.1%      19019 =C2=B1 21%  sched_debug.cpu.ttw=
u_local.stddev
    361971 =C2=B1  3%     -24.9%     271891 =C2=B1  0%  sched_debug.cpu_clk
    360052 =C2=B1  3%     -24.9%     270234 =C2=B1  0%  sched_debug.ktime
    361971 =C2=B1  3%     -24.9%     271891 =C2=B1  0%  sched_debug.sched_c=
lk


lkp-ne04: Nehalem-EP
Memory: 12G



                                  turbostat._Busy

  1.5 ++-------------------------------------------------------------------=
-+
      |                                               O     O              =
 |
  1.4 ++                    O                                              =
 |
  1.3 ++                                                                   =
 |
      |       O                  O       O                       O         =
 |
  1.2 ++         O                    O                        O       O   =
 |
      |                             O       O       O    O          O      =
 O
  1.1 O+ O O          O       O               O                          O =
 |
      |            O     O                       O                         =
 |
    1 ++                                                                   =
 |
      |                                                                    =
 |
  0.9 ++                .*..                *.  .*..        *..            =
 |
  0.8 *+.*.*..    .*..*.    *.*..  .*.    ..  *.    *.*.. ..   *.*..*..*.*.=
.*
      |       *..*               *.   *..*               *                 =
 |
  0.7 ++-------------------------------------------------------------------=
-+


                                     uptime.idle

  10500 ++-----------------------------------------------------------------=
-+
        *            *..                                           .*..    =
 |
  10000 ++   *..   ..   *       *.*..  *..*..         .*..*.  .*..*    *.  =
 |
   9500 +++ +    .*      +    ..      +      *.*..*.*.      *.           *.=
.|
        |  *    *         *..*       *                                     =
 *
   9000 ++                                                                 =
 |
   8500 ++                                                                 =
 |
        |                                                                  =
 |
   8000 ++   O               O                         O    O              =
 |
   7500 O+      O O       O          O    O       O O     O    O           =
 |
        |  O                      O    O       O                  O        =
 O
   7000 ++           O  O       O                                   O      =
 |
   6500 ++                                                             O O =
 |
        |                                                                  =
 |
   6000 ++-----------------------------------O-----------------------------=
-+

                       fsmark.time.voluntary_context_switches

  500000 ++----------------------------------------------------------------=
-+
  490000 ++ O           O     O         O  O O                           O =
 |
         O    O  O         O         O            O            O  O O  O   =
 |
  480000 ++        O  O         O  O            O    O O  O  O             =
 O
  470000 ++                                                                =
 |
         |                                                                 =
 |
  460000 ++                                                                =
 |
  450000 ++                                                                =
 |
  440000 ++                                                                =
 |
         |                                                                 =
 |
  430000 ++                                                                =
 |
  420000 ++                                 .*..  *..             *.       =
 |
         *.. .*..    .*.*..  .*.*..*.*..*..*     +    .*..*..   ..  *..    =
 |
  410000 ++ *    *.*.      *.                   *    *       *.*       *.*.=
.|
  400000 ++----------------------------------------------------------------=
-*


                           fsmark.time.file_system_inputs

  40000 ++-----------------------------------------------------------------=
-+
        |                                                                O =
 |
  35000 ++                                                                 =
 |
  30000 ++                                   O                         O   =
 |
        |  O         O  O    O         O  O       O                        =
 |
  25000 O+   O  O         O     O    O         O    O     O    O  O O      =
 O
        |         O               O                                        =
 |
  20000 ++                                             O    O              =
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
        |                                                                  =
 |
      0 *+-*-*--*-*--*--*-*--*--*-*--*-*--*--*-*--*-*--*--*-*--*--*-*--*-*-=
-*


                                 proc-vmstat.pgpgin

  20000 ++-----------------------------------------------------------------=
-+
  18000 ++                                                               O =
 |
        |                                                                  =
 |
  16000 ++                                   O                         O   =
 |
  14000 ++ O         O  O    O         O  O       O                        =
 |
        O    O  O         O     O    O         O    O     O    O  O O      =
 O
  12000 ++        O               O                                        =
 |
  10000 ++                                             O    O              =
 |
   8000 ++                                                                 =
 |
        |                                                                  =
 |
   6000 ++                                                                 =
 |
   4000 ++                                                                 =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
      0 *+-*-*--*-*--*--*-*--*--*-*--*-*--*--*-*--*-*--*--*-*--*--*-*--*-*-=
-*


                              proc-vmstat.pgalloc_normal

  1.35e+06 ++--------------------------------------------------------------=
-+
   1.3e+06 ++                                                        *     =
 |
           *            *.               *..*                   *. .. +    =
 |
  1.25e+06 ++   *..   ..  *..           +    +         .*..*. ..  *    *.. =
 |
   1.2e+06 +++ +    .*       *.*..*.*..*      *..*.*..*      *            *=
.|
           |  *    *                                                       =
 *
  1.15e+06 ++                                                              =
 |
   1.1e+06 ++                                                              =
 |
  1.05e+06 ++   O  O           O            O                              =
 |
           O  O      O       O      O  O O         O  O O  O O  O          =
 |
     1e+06 ++                     O              O                         =
 O
    950000 ++           O O                                       O  O     =
 |
           |                                                           O  O=
 |
    900000 ++                                 O                            =
 |
    850000 ++--------------------------------------------------------------=
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

--===============1159199320178872385==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogZnNtYXJrCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9uaXRv
cgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICBoZWFydGJlYXQ6IAogIHZtc3RhdDog
CiAgbnVtYS1udW1hc3RhdDogCiAgbnVtYS12bXN0YXQ6IAogIG51bWEtbWVtaW5mbzogCiAgcHJv
Yy12bXN0YXQ6IAogIHByb2Mtc3RhdDoKICAgIGludGVydmFsOiAxMAogIG1lbWluZm86IAogIHNs
YWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAogIGxhdGVuY3lfc3RhdHM6IAog
IHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tzdGF0czogCiAgbmZzc3RhdDog
CiAgY3B1aWRsZTogCiAgY3B1ZnJlcS1zdGF0czogCiAgdHVyYm9zdGF0OiAKICBwbWV0ZXI6IAog
IHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDYwCmNwdWZyZXFfZ292ZXJub3I6IHBlcmZvcm1h
bmNlCmRlZmF1bHQtd2F0Y2hkb2dzOgogIG9vbS1raWxsZXI6IAogIHdhdGNoZG9nOiAKY29tbWl0
OiAxZjJkNzc5ZmVkMjE4MDZmZmVkODRhYTY1NjE3YzYxMjVmNDgwZTg1Cm1vZGVsOiBOZWhhbGVt
LUVQCm1lbW9yeTogMTJHCmhkZF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1TVDM1
MDA1MTROU185V0owM0VCQS1wYXJ0MyIKc3dhcF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlk
L2F0YS1TVDMxMjAwMjZBU181TVMwN0hBMi1wYXJ0MiIKcm9vdGZzX3BhcnRpdGlvbjogIi9kZXYv
ZGlzay9ieS1pZC9hdGEtU1QzNTAwNTE0TlNfOVdKMDNFQkEtcGFydDEiCmNhdGVnb3J5OiBiZW5j
aG1hcmsKaXRlcmF0aW9uczogMXgKbnJfdGhyZWFkczogMzJ0CmRpc2s6IDFIREQKZnM6IGV4dDQK
ZnMyOiAKZnNtYXJrOgogIGZpbGVzaXplOiA5QgogIHRlc3Rfc2l6ZTogNDAwTQogIHN5bmNfbWV0
aG9kOiBmc3luY0JlZm9yZUNsb3NlCiAgbnJfZGlyZWN0b3JpZXM6IDE2ZAogIG5yX2ZpbGVzX3Bl
cl9kaXJlY3Rvcnk6IDI1NmZwZApxdWV1ZTogYmlzZWN0CnRlc3Rib3g6IGxrcC1uZTA0CnRib3hf
Z3JvdXA6IGxrcC1uZTA0Cmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNi0w
Mi0yOCAxNzoyMzoxMi40ODE3NjcyNzcgKzA4OjAwCmNvbXBpbGVyOiBnY2MtNC45CnJvb3Rmczog
ZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnegppZDogNjhhYThmNjk1YTBlODUzMWM5OTE4MDdk
ZTEyMGJiMTUzZDBjMThkZQp1c2VyOiBsa3AKaGVhZF9jb21taXQ6IDE3MzZiNjg5MmYzMmI0ZmM3
MWY0NGM4NmYwMjZiZDU3MjllMzdlMWMKYmFzZV9jb21taXQ6IDgxZjcwYmEyMzNkNWY2NjBlMWVh
NWZlMjMyNjBlZTMyM2FmNWQ1M2EKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAx
NjAyMjcyMQpyZXN1bHRfcm9vdDogIi9yZXN1bHQvZnNtYXJrL3BlcmZvcm1hbmNlLTF4LTMydC0x
SERELWV4dDQtOUItNDAwTS1mc3luY0JlZm9yZUNsb3NlLTE2ZC0yNTZmcGQvbGtwLW5lMDQvZGVi
aWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzFmMmQ3NzlmZWQy
MTgwNmZmZWQ4NGFhNjU2MTdjNjEyNWY0ODBlODUvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxl
ZC9sa3AtbmUwNC9iaXNlY3RfZnNtYXJrLXBlcmZvcm1hbmNlLTF4LTMydC0xSERELWV4dDQtOUIt
NDAwTS1mc3luY0JlZm9yZUNsb3NlLTE2ZC0yNTZmcGQtZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3
LmNnei14ODZfNjQtcmhlbC0xZjJkNzc5ZmVkMjE4MDZmZmVkODRhYTY1NjE3YzYxMjVmNDgwZTg1
LTIwMTYwMjI4LTEyNjYyOS0ycjFlNmMtMC55YW1sIgpucl9jcHU6ICIkKG5wcm9jKSIKbWF4X3Vw
dGltZTogMjM4NC42Mgppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1
LTAyLTA3LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxr
cAotIGpvYj0vbGtwL3NjaGVkdWxlZC9sa3AtbmUwNC9iaXNlY3RfZnNtYXJrLXBlcmZvcm1hbmNl
LTF4LTMydC0xSERELWV4dDQtOUItNDAwTS1mc3luY0JlZm9yZUNsb3NlLTE2ZC0yNTZmcGQtZGVi
aWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei14ODZfNjQtcmhlbC0xZjJkNzc5ZmVkMjE4MDZmZmVk
ODRhYTY1NjE3YzYxMjVmNDgwZTg1LTIwMTYwMjI4LTEyNjYyOS0ycjFlNmMtMC55YW1sCi0gQVJD
SD14ODZfNjQKLSBrY29uZmlnPXg4Nl82NC1yaGVsCi0gYnJhbmNoPWxpbnV4LWRldmVsL2RldmVs
LWhvdXJseS0yMDE2MDIyNzIxCi0gY29tbWl0PTFmMmQ3NzlmZWQyMTgwNmZmZWQ4NGFhNjU2MTdj
NjEyNWY0ODBlODUKLSBCT09UX0lNQUdFPS9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS8x
ZjJkNzc5ZmVkMjE4MDZmZmVkODRhYTY1NjE3YzYxMjVmNDgwZTg1L3ZtbGludXotNC41LjAtcmMy
LTAwMDI2LWcxZjJkNzc5Ci0gbWF4X3VwdGltZT0yMzg0Ci0gUkVTVUxUX1JPT1Q9L3Jlc3VsdC9m
c21hcmsvcGVyZm9ybWFuY2UtMXgtMzJ0LTFIREQtZXh0NC05Qi00MDBNLWZzeW5jQmVmb3JlQ2xv
c2UtMTZkLTI1NmZwZC9sa3AtbmUwNC9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82
NC1yaGVsL2djYy00LjkvMWYyZDc3OWZlZDIxODA2ZmZlZDg0YWE2NTYxN2M2MTI1ZjQ4MGU4NS8w
Ci0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0
ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVk
IHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5pYz0tMSBzb2Z0bG9ja3Vw
X3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJv
bXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9y
bWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3AteDg2XzY0LmNneiIKbW9kdWxlc19p
bml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvMWYyZDc3OWZlZDIxODA2ZmZl
ZDg0YWE2NTYxN2M2MTI1ZjQ4MGU4NS9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAiL29zaW1hZ2Uv
ZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3osL29zaW1hZ2UvZGVwcy9k
ZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNvbmZpZy5jZ3osL29zaW1hZ2UvZGVw
cy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1h
cmtzL3R1cmJvc3RhdC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcu
Y2d6L2ZzLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovZnMy
LmNneiwvbGtwL2JlbmNobWFya3MvZnNtYXJrLmNneiIKbGludXhfaGVhZGVyc19pbml0cmQ6ICIv
cGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvMWYyZDc3OWZlZDIxODA2ZmZlZDg0YWE2NTYx
N2M2MTI1ZjQ4MGU4NS9saW51eC1oZWFkZXJzLmNneiIKcmVwZWF0X3RvOiAyCmtlcm5lbDogIi9w
a2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS8xZjJkNzc5ZmVkMjE4MDZmZmVkODRhYTY1NjE3
YzYxMjVmNDgwZTg1L3ZtbGludXotNC41LjAtcmMyLTAwMDI2LWcxZjJkNzc5IgpkZXF1ZXVlX3Rp
bWU6IDIwMTYtMDItMjggMTc6Mzk6NTEuNTk4NzkwOTE0ICswODowMApqb2Jfc3RhdGU6IGZpbmlz
aGVkCmxvYWRhdmc6IDMwLjY2IDI2LjcxIDEzLjk2IDIvMjM0IDEzODE1CnN0YXJ0X3RpbWU6ICcx
NDU2NjUyNDM1JwplbmRfdGltZTogJzE0NTY2NTI5NDgnCnZlcnNpb246ICIvbGtwL2xrcC8uc3Jj
LTIwMTYwMjI2LTE5NDkwOCIK

--===============1159199320178872385==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wMi0yOCAxNzo0MDozMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yOCAxNzo0MDozMiBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yOCAxNzo0MDozMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDItMjggMTc6NDA6MzIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTI4IDE3OjQwOjMyIGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMi0yOCAxNzo0MDozMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDIt
MjggMTc6NDA6MzIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTI4IDE3OjQwOjMyIGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMi0yOCAxNzo0MDozMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yOCAx
Nzo0MDozMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1My9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yOCAxNzo0MDozMiBlY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMi0yOCAxNzo0MDozMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yOCAxNzo0MDoz
MiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ni9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yOCAxNzo0MDozMiBlY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAx
Ni0wMi0yOCAxNzo0MDozMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yOCAxNzo0MDozMiBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMi0yOCAxNzo0MDozMiBta2ZzIC10IGV4dDQgLXEgLUYgL2Rldi9z
ZGEzCjIwMTYtMDItMjggMTc6NDA6MzQgbW91bnQgLXQgZXh0NCAvZGV2L3NkYTMgL2ZzL3NkYTMK
MjAxNi0wMi0yOCAxNzo0MDozNSAuL2ZzX21hcmsgLWQgL2ZzL3NkYTMvMSAtZCAvZnMvc2RhMy8y
IC1kIC9mcy9zZGEzLzMgLWQgL2ZzL3NkYTMvNCAtZCAvZnMvc2RhMy81IC1kIC9mcy9zZGEzLzYg
LWQgL2ZzL3NkYTMvNyAtZCAvZnMvc2RhMy84IC1kIC9mcy9zZGEzLzkgLWQgL2ZzL3NkYTMvMTAg
LWQgL2ZzL3NkYTMvMTEgLWQgL2ZzL3NkYTMvMTIgLWQgL2ZzL3NkYTMvMTMgLWQgL2ZzL3NkYTMv
MTQgLWQgL2ZzL3NkYTMvMTUgLWQgL2ZzL3NkYTMvMTYgLWQgL2ZzL3NkYTMvMTcgLWQgL2ZzL3Nk
YTMvMTggLWQgL2ZzL3NkYTMvMTkgLWQgL2ZzL3NkYTMvMjAgLWQgL2ZzL3NkYTMvMjEgLWQgL2Zz
L3NkYTMvMjIgLWQgL2ZzL3NkYTMvMjMgLWQgL2ZzL3NkYTMvMjQgLWQgL2ZzL3NkYTMvMjUgLWQg
L2ZzL3NkYTMvMjYgLWQgL2ZzL3NkYTMvMjcgLWQgL2ZzL3NkYTMvMjggLWQgL2ZzL3NkYTMvMjkg
LWQgL2ZzL3NkYTMvMzAgLWQgL2ZzL3NkYTMvMzEgLWQgL2ZzL3NkYTMvMzIgLUQgMTYgLU4gMjU2
IC1uIDMyMDAgLUwgMSAtUyAxIC1zIDkK

--===============1159199320178872385==--

