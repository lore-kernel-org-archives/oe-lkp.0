Content-Type: multipart/mixed; boundary="===============5064532171527192016=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [Btrfs] b659ef0277: +159.7% fileio.requests_per_sec
Date: Thu, 17 Sep 2015 13:42:10 +0800
Message-ID: <87oah1eh59.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5064532171527192016==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit b659ef027792219b590d67a2baf1643a93727d29 ("Btrfs: avoid syncing log =
in the fast fsync path when not necessary")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/period/nr_thre=
ads/disk/fs/size/filenum/rwmode/iomode:
  lkp-sb02/fileio/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performa=
nce/600s/100%/1HDD/btrfs/64G/1024f/rndwr/sync

commit: =

  1ab818b137e198e4d06e987a4b089411f2e39d40
  b659ef027792219b590d67a2baf1643a93727d29

1ab818b137e198e4 b659ef027792219b590d67a2ba =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    156.81 =C2=B1171%     -99.2%       1.20 =C2=B1 14%  fileio.request_late=
ncy_max_ms
     17.03 =C2=B1  0%    +159.7%      44.24 =C2=B1  0%  fileio.requests_per=
_sec
   2373960 =C2=B1  0%      +6.7%    2533688 =C2=B1  0%  fileio.time.file_sy=
stem_outputs
    161019 =C2=B1  0%     -14.3%     137992 =C2=B1  0%  fileio.time.volunta=
ry_context_switches
   9810964 =C2=B1  2%     -17.9%    8052196 =C2=B1  1%  cpuidle.C3-SNB.time
    161019 =C2=B1  0%     -14.3%     137992 =C2=B1  0%  time.voluntary_cont=
ext_switches
      3568 =C2=B1  0%      -2.4%       3484 =C2=B1  0%  vmstat.io.bo
     60476 =C2=B1  0%     +18.1%      71428 =C2=B1  0%  proc-vmstat.nr_acti=
ve_file
    507.75 =C2=B1  0%     +86.4%     946.25 =C2=B1  0%  proc-vmstat.nr_dirty
     10809 =C2=B1  0%     +15.6%      12497 =C2=B1  0%  proc-vmstat.nr_slab=
_reclaimable
     52238 =C2=B1  0%     +13.4%      59232 =C2=B1  0%  proc-vmstat.pgactiv=
ate
     10189 =C2=B1  8%      -9.9%       9180 =C2=B1  8%  sched_debug.cfs_rq[=
0]:/.min_vruntime
      1.75 =C2=B14164%   +6385.7%     113.50 =C2=B1 16%  sched_debug.cpu#2.=
nr_uninterruptible
     14748 =C2=B1  3%      -7.2%      13685 =C2=B1  2%  sched_debug.cpu#2.t=
twu_local
    141.25 =C2=B1 47%     -83.9%      22.75 =C2=B1169%  sched_debug.cpu#3.n=
r_uninterruptible
     50725 =C2=B1  0%      -9.8%      45774 =C2=B1  0%  softirqs.BLOCK
     43962 =C2=B1  1%     -13.9%      37864 =C2=B1  1%  softirqs.RCU
     32134 =C2=B1  1%      -8.8%      29295 =C2=B1  1%  softirqs.SCHED
     62715 =C2=B1  1%      -9.9%      56488 =C2=B1  0%  softirqs.TIMER
     50.00 =C2=B1  0%      +2.0%      51.00 =C2=B1  0%  turbostat.Avg_MHz
      0.41 =C2=B1  2%     -14.5%       0.35 =C2=B1  2%  turbostat.CPU%c3
      2.69 =C2=B1  0%      -9.9%       2.42 =C2=B1  0%  turbostat.Pkg%pc2
      1.02 =C2=B1  4%     -22.9%       0.78 =C2=B1  4%  turbostat.Pkg%pc3
    260823 =C2=B1  0%     +16.8%     304593 =C2=B1  0%  meminfo.Active
    241907 =C2=B1  0%     +18.1%     285712 =C2=B1  0%  meminfo.Active(file)
      2033 =C2=B1  0%     +86.2%       3784 =C2=B1  0%  meminfo.Dirty
     43239 =C2=B1  0%     +15.6%      49990 =C2=B1  0%  meminfo.SReclaimable
     61606 =C2=B1  0%     +11.0%      68373 =C2=B1  0%  meminfo.Slab
      1571 =C2=B1  5%     +16.0%       1823 =C2=B1  8%  slabinfo.btrfs_dela=
yed_data_ref.active_objs
      1577 =C2=B1  5%     +16.0%       1830 =C2=B1  8%  slabinfo.btrfs_dela=
yed_data_ref.num_objs
      1256 =C2=B1  5%     -13.3%       1089 =C2=B1  8%  slabinfo.btrfs_dela=
yed_ref_head.active_objs
      1261 =C2=B1  5%     -13.3%       1093 =C2=B1  8%  slabinfo.btrfs_dela=
yed_ref_head.num_objs
    767.25 =C2=B1  2%     +14.7%     880.25 =C2=B1  4%  slabinfo.btrfs_dela=
yed_tree_ref.active_objs
    767.25 =C2=B1  2%     +14.7%     880.25 =C2=B1  4%  slabinfo.btrfs_dela=
yed_tree_ref.num_objs
      2933 =C2=B1  3%     -29.6%       2066 =C2=B1  0%  slabinfo.btrfs_exte=
nt_buffer.active_objs
      2944 =C2=B1  2%     -29.4%       2079 =C2=B1  0%  slabinfo.btrfs_exte=
nt_buffer.num_objs
      5699 =C2=B1  0%    +129.2%      13066 =C2=B1  0%  slabinfo.btrfs_exte=
nt_state.active_objs
    111.50 =C2=B1  1%    +129.6%     256.00 =C2=B1  0%  slabinfo.btrfs_exte=
nt_state.active_slabs
      5699 =C2=B1  0%    +129.4%      13078 =C2=B1  0%  slabinfo.btrfs_exte=
nt_state.num_objs
    111.50 =C2=B1  1%    +129.6%     256.00 =C2=B1  0%  slabinfo.btrfs_exte=
nt_state.num_slabs
    351.00 =C2=B1  2%    +103.5%     714.25 =C2=B1  0%  slabinfo.btrfs_orde=
red_extent.active_objs
    376.75 =C2=B1  2%     +91.1%     720.00 =C2=B1  0%  slabinfo.btrfs_orde=
red_extent.num_objs
     12062 =C2=B1  0%    +122.3%      26821 =C2=B1  0%  slabinfo.btrfs_path=
.active_objs
    430.50 =C2=B1  0%    +122.4%     957.50 =C2=B1  0%  slabinfo.btrfs_path=
.active_slabs
     12062 =C2=B1  0%    +122.3%      26821 =C2=B1  0%  slabinfo.btrfs_path=
.num_objs
    430.50 =C2=B1  0%    +122.4%     957.50 =C2=B1  0%  slabinfo.btrfs_path=
.num_slabs
    407.25 =C2=B1  0%     +80.4%     734.50 =C2=B1  4%  slabinfo.ext4_exten=
t_status.active_objs
    407.25 =C2=B1  0%     +80.4%     734.50 =C2=B1  4%  slabinfo.ext4_exten=
t_status.num_objs
     19541 =C2=B1  0%     +36.8%      26730 =C2=B1  0%  slabinfo.radix_tree=
_node.active_objs
    697.50 =C2=B1  0%     +36.8%     954.25 =C2=B1  0%  slabinfo.radix_tree=
_node.active_slabs
     19541 =C2=B1  0%     +36.8%      26730 =C2=B1  0%  slabinfo.radix_tree=
_node.num_objs
    697.50 =C2=B1  0%     +36.8%     954.25 =C2=B1  0%  slabinfo.radix_tree=
_node.num_slabs
    158807 =C2=B1  2%    +131.0%     366899 =C2=B1  3%  latency_stats.avg.b=
trfs_log_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_file=
.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync.system_call_fastpath
      6668 =C2=B1173%   +1166.1%      84431 =C2=B1 59%  latency_stats.avg.g=
et_request.blk_queue_bio.generic_make_request.submit_bio.submit_stripe_bio.=
[btrfs].btrfs_map_bio.[btrfs].btrfs_submit_bio_hook.[btrfs].submit_one_bio.=
[btrfs].flush_epd_write_bio.[btrfs].extent_writepages.[btrfs].btrfs_writepa=
ges.[btrfs].do_writepages
  13866462 =C2=B1166%     -81.3%    2589754 =C2=B1141%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.system_call_fastpath
     41062 =C2=B1  0%     +54.4%      63383 =C2=B1  0%  latency_stats.avg.w=
ait_log_commit.[btrfs].btrfs_sync_log.[btrfs].btrfs_sync_file.[btrfs].vfs_f=
sync_range.do_fsync.SyS_fsync.system_call_fastpath
     25520 =C2=B1  0%     +70.5%      43514 =C2=B1  0%  latency_stats.avg.w=
rite_all_supers.[btrfs].write_ctree_super.[btrfs].btrfs_sync_log.[btrfs].bt=
rfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync.system_call_fastpa=
th
     18476 =C2=B1  1%     -35.5%      11911 =C2=B1  0%  latency_stats.hits.=
btrfs_sync_log.[btrfs].btrfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS=
_fsync.system_call_fastpath
     41791 =C2=B1  0%     -35.9%      26801 =C2=B1  0%  latency_stats.hits.=
wait_log_commit.[btrfs].btrfs_sync_log.[btrfs].btrfs_sync_file.[btrfs].vfs_=
fsync_range.do_fsync.SyS_fsync.system_call_fastpath
     18075 =C2=B1  0%     -28.7%      12891 =C2=B1  0%  latency_stats.hits.=
wait_on_page_bit.filemap_fdatawait_range.btrfs_wait_marked_extents.[btrfs].=
btrfs_sync_log.[btrfs].btrfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS=
_fsync.system_call_fastpath
      9830 =C2=B1  0%    +163.3%      25887 =C2=B1  0%  latency_stats.hits.=
wait_ordered_extents.[btrfs].btrfs_log_changed_extents.[btrfs].btrfs_log_in=
ode.[btrfs].btrfs_log_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].bt=
rfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync.system_call_fastpa=
th
     16441 =C2=B1  0%     -34.1%      10827 =C2=B1  0%  latency_stats.hits.=
write_all_supers.[btrfs].write_ctree_super.[btrfs].btrfs_sync_log.[btrfs].b=
trfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync.system_call_fastp=
ath
    774721 =C2=B1  2%     +17.4%     909689 =C2=B1  2%  latency_stats.max.b=
trfs_log_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_file=
.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync.system_call_fastpath
    308974 =C2=B1102%     -99.9%     169.50 =C2=B1  7%  latency_stats.max.b=
trfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync.system_call_fastp=
ath
      6668 =C2=B1173%   +1166.1%      84431 =C2=B1 59%  latency_stats.max.g=
et_request.blk_queue_bio.generic_make_request.submit_bio.submit_stripe_bio.=
[btrfs].btrfs_map_bio.[btrfs].btrfs_submit_bio_hook.[btrfs].submit_one_bio.=
[btrfs].flush_epd_write_bio.[btrfs].extent_writepages.[btrfs].btrfs_writepa=
ges.[btrfs].do_writepages
  13999612 =C2=B1164%     -81.5%    2589754 =C2=B1141%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.system_call_fastpath
    155855 =C2=B1169%     -92.6%      11547 =C2=B1 28%  latency_stats.sum.b=
trfs_file_write_iter.[btrfs].__vfs_write.vfs_write.SyS_pwrite64.system_call=
_fastpath
  40811794 =C2=B1  1%      +8.0%   44071985 =C2=B1  1%  latency_stats.sum.b=
trfs_log_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_file=
.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync.system_call_fastpath
    423179 =C2=B1111%     -98.4%       6944 =C2=B1 10%  latency_stats.sum.b=
trfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync.system_call_fastp=
ath
  11208157 =C2=B1  1%     -42.1%    6484422 =C2=B1  0%  latency_stats.sum.b=
trfs_sync_log.[btrfs].btrfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS_=
fsync.system_call_fastpath
     55333 =C2=B1  3%     -73.7%      14563 =C2=B1  5%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_lock_root_node.[btrfs].btrfs_search_slot.[btrf=
s].btrfs_insert_empty_items.[btrfs].btrfs_log_inode.[btrfs].btrfs_log_inode=
_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_file.[btrfs].vfs_f=
sync_range.do_fsync.SyS_fsync.system_call_fastpath
    262263 =C2=B1  1%     -18.7%     213138 =C2=B1  1%  latency_stats.sum.b=
trfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search_=
slot.[btrfs].btrfs_insert_empty_items.[btrfs].btrfs_log_inode.[btrfs].btrfs=
_log_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_file.[bt=
rfs].vfs_fsync_range.do_fsync.SyS_fsync.system_call_fastpath
   1387167 =C2=B1  0%      +6.7%    1479555 =C2=B1  1%  latency_stats.sum.d=
o_wait.SyS_wait4.system_call_fastpath
      6668 =C2=B1173%   +1166.1%      84431 =C2=B1 59%  latency_stats.sum.g=
et_request.blk_queue_bio.generic_make_request.submit_bio.submit_stripe_bio.=
[btrfs].btrfs_map_bio.[btrfs].btrfs_submit_bio_hook.[btrfs].submit_one_bio.=
[btrfs].flush_epd_write_bio.[btrfs].extent_writepages.[btrfs].btrfs_writepa=
ges.[btrfs].do_writepages
  14672479 =C2=B1154%     -82.3%    2589754 =C2=B1141%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.system_call_fastpath
   2775089 =C2=B1  0%      +6.1%    2944954 =C2=B1  1%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
   1515574 =C2=B1  1%    +160.1%    3941685 =C2=B1  0%  latency_stats.sum.w=
ait_for_writer.[btrfs].btrfs_sync_log.[btrfs].btrfs_sync_file.[btrfs].vfs_f=
sync_range.do_fsync.SyS_fsync.system_call_fastpath
     47560 =C2=B1 10%    +335.6%     207189 =C2=B1  8%  latency_stats.sum.w=
ait_on_page_bit.extent_write_cache_pages.[btrfs].extent_writepages.[btrfs].=
btrfs_writepages.[btrfs].do_writepages.__filemap_fdatawrite_range.filemap_f=
datawrite_range.btrfs_fdatawrite_range.[btrfs].start_ordered_ops.[btrfs].bt=
rfs_sync_file.[btrfs].vfs_fsync_range.do_fsync
  20108473 =C2=B1  0%     -20.5%   15989866 =C2=B1  0%  latency_stats.sum.w=
ait_on_page_bit.filemap_fdatawait_range.btrfs_wait_marked_extents.[btrfs].b=
trfs_sync_log.[btrfs].btrfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS_=
fsync.system_call_fastpath
   6853626 =C2=B1  0%    +225.5%   22310007 =C2=B1  0%  latency_stats.sum.w=
ait_ordered_extents.[btrfs].btrfs_log_changed_extents.[btrfs].btrfs_log_ino=
de.[btrfs].btrfs_log_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btr=
fs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync.system_call_fastpath
 4.196e+08 =C2=B1  0%     +12.3%  4.712e+08 =C2=B1  0%  latency_stats.sum.w=
rite_all_supers.[btrfs].write_ctree_super.[btrfs].btrfs_sync_log.[btrfs].bt=
rfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync.system_call_fastpa=
th


lkp-sb02: Sandy Bridge-EP
Memory: 4G


                             fileio.requests_per_sec

  45 ++-O-O--O--O--O-O--O--O--O-O--O--O--O-O--O--O-O--O--O--O-O--O--O--O-O-=
-O
     |                                                                     =
 |
  40 ++                                                                    =
 |
  35 ++                                                                    =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
  25 ++                                                                    =
 |
     |                                                                     =
 |
  20 ++                        .*..                                        =
 |
  15 *+.*.*..*..*..*.*..*..*..*    *..*..*.*..*..*.*..*..*..*              =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
   5 ++                                                                    =
 |
     |                                                                     =
 |
   0 O+--------------------------------------------------------------------=
-+


                       fileio.time.voluntary_context_switches

  180000 ++----------------------------------------------------------------=
-+
         |           .*.*..*..*.*..*.*..*.. .*..    .*.  .*..              =
 |
  160000 *+.*.*..*.*.                      *    *.*.   *.    *             =
 |
  140000 ++ O O  O O  O O     O O  O O  O  O O  O O  O O  O  O O  O O  O O =
 O
         |                                                                 =
 |
  120000 ++                                                                =
 |
  100000 ++                O                                               =
 |
         |                                                                 =
 |
   80000 ++                                                                =
 |
   60000 ++                                                                =
 |
         |                                                                 =
 |
   40000 ++                                                                =
 |
   20000 ++                                                                =
 |
         |                                                                 =
 |
       0 O+----------------------------------------------------------------=
-+


                           time.voluntary_context_switches

  180000 ++----------------------------------------------------------------=
-+
         |           .*.*..*..*.*..*.*..*.. .*..    .*.  .*..              =
 |
  160000 *+.*.*..*.*.                      *    *.*.   *.    *             =
 |
  140000 ++ O O  O O  O O     O O  O O  O  O O  O O  O O  O  O O  O O  O O =
 O
         |                                                                 =
 |
  120000 ++                                                                =
 |
  100000 ++                O                                               =
 |
         |                                                                 =
 |
   80000 ++                                                                =
 |
   60000 ++                                                                =
 |
         |                                                                 =
 |
   40000 ++                                                                =
 |
   20000 ++                                                                =
 |
         |                                                                 =
 |
       0 O+----------------------------------------------------------------=
-+


                               proc-vmstat.nr_dirty

  1000 ++------------------------------------------------------------------=
-+
   900 ++ O O  O  O O  O    O  O  O O  O  O O  O O  O  O O  O  O O  O  O O =
 O
       |                                                                   =
 |
   800 ++                 O                                                =
 |
   700 ++                                                                  =
 |
       |                                                                   =
 |
   600 ++                                                                  =
 |
   500 *+.*.*..*..*.*..*..*.*..*..*.*..*..*.*..*.*..*..*.*..*              =
 |
   400 ++                                                                  =
 |
       |                                                                   =
 |
   300 ++                                                                  =
 |
   200 ++                                                                  =
 |
       |                                                                   =
 |
   100 ++                                                                  =
 |
     0 O+------------------------------------------------------------------=
-+


                                   meminfo.Dirty

  4000 ++------------------------------------------------------------------=
-+
       |  O O  O  O O  O    O  O  O O  O  O O  O O  O  O O  O  O O  O  O O =
 O
  3500 ++                                                                  =
 |
  3000 ++                 O                                                =
 |
       |                                                                   =
 |
  2500 ++                                                                  =
 |
       |                                                                   =
 |
  2000 *+.*.*..*..*.*..*..*.*..*..*.*..*..*.*..*.*..*..*.*..*              =
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
     0 O+------------------------------------------------------------------=
-+


                     slabinfo.btrfs_extent_buffer.active_objs

  3500 ++------------------------------------------------------------------=
-+
       |            *..  .*.  .*..                                         =
 |
  3000 ++  .*..    +   *.   *.    *.     .*.*..*.*..*..*.*..               =
 |
       *..*    *..*                 *..*.                   *              =
 |
  2500 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++ O O  O  O O  O    O  O  O O  O  O O  O O  O  O O  O  O O  O  O O =
 O
       |                                                                   =
 |
  1500 ++                 O                                                =
 |
       |                                                                   =
 |
  1000 ++                                                                  =
 |
       |                                                                   =
 |
   500 ++                                                                  =
 |
       |                                                                   =
 |
     0 O+------------------------------------------------------------------=
-+


                       slabinfo.btrfs_extent_buffer.num_objs

  3500 ++------------------------------------------------------------------=
-+
       |            *..  .*.  .*..                                         =
 |
  3000 ++  .*..    +   *.   *.    *.     .*.*..*.*..*..*.*..               =
 |
       *..*    *..*                 *..*.                   *              =
 |
  2500 ++                                                                  =
 |
       |                                                         O         =
 |
  2000 ++ O O  O  O O  O    O  O  O O  O  O O  O O  O  O O  O  O    O  O O =
 O
       |                                                                   =
 |
  1500 ++                 O                                                =
 |
       |                                                                   =
 |
  1000 ++                                                                  =
 |
       |                                                                   =
 |
   500 ++                                                                  =
 |
       |                                                                   =
 |
     0 O+------------------------------------------------------------------=
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

--===============5064532171527192016==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogZmlsZWlvCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9uaXRv
cgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0
YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBw
cm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50
ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAg
YmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6IAog
IGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1ZzoK
ICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiBwZXJmb3JtYW5jZQpkZWZhdWx0LXdh
dGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogNjQyOTFmN2RiNWJk
ODE1MGE3NGFkMjAzNmYxMDM3ZTZhMDQyOGRmMgptb2RlbDogU2FuZHkgQnJpZGdlLUVQCm1lbW9y
eTogNEcKaGRkX3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLUhEVDcyMjUxNkRMQTM4
MF9WRFNEMURUQ0VLWUFFSi1wYXJ0MiIKc3dhcF9wYXJ0aXRpb25zOiAKcm9vdGZzX3BhcnRpdGlv
bjogIi9kZXYvZGlzay9ieS1pZC9hdGEtSERUNzIyNTE2RExBMzgwX1ZEU0QxRFRDRUtZQUVKLXBh
cnQxIgpjYXRlZ29yeTogYmVuY2htYXJrCnBlcmlvZDogNjAwcwpucl90aHJlYWRzOiAxMDAlCmRp
c2s6IDFIREQKZnM6IGJ0cmZzCnNpemU6IDY0RwpmaWxlaW86CiAgZmlsZW51bTogMTAyNGYKICBy
d21vZGU6IHJuZHdyCiAgaW9tb2RlOiBzeW5jCnF1ZXVlOiBjeWNsaWMKdGVzdGJveDogbGtwLXNi
MDIKdGJveF9ncm91cDogbGtwLXNiMDIKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1l
OiAyMDE1LTA4LTIzIDE4OjIwOjQ2LjEzNjYzNTEwNyArMDg6MDAKaWQ6IDhmNGE1NDYzNzQ1MzE0
NWYxMTAxZWNhNGFkY2ViNzhiYzUzMzQ1MDkKdXNlcjogd2ZnCmNvbXBpbGVyOiBnY2MtNC45Cmhl
YWRfY29tbWl0OiBhZGZkZTRiMTAzYzZhOThlMzE1YjQyNDVkNGQ3NjJlODI1MzUzZTY3CmJhc2Vf
Y29tbWl0OiA2NDI5MWY3ZGI1YmQ4MTUwYTc0YWQyMDM2ZjEwMzdlNmEwNDI4ZGYyCmJyYW5jaDog
bGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUwOTAxMTQKa2VybmVsOiAiL3BrZy9saW51eC94
ODZfNjQtcmhlbC9nY2MtNC45LzY0MjkxZjdkYjViZDgxNTBhNzRhZDIwMzZmMTAzN2U2YTA0Mjhk
ZjIvdm1saW51ei00LjIuMCIKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CnJl
c3VsdF9yb290OiAiL3Jlc3VsdC9maWxlaW8vcGVyZm9ybWFuY2UtNjAwcy0xMDAlLTFIREQtYnRy
ZnMtNjRHLTEwMjRmLXJuZHdyLXN5bmMvbGtwLXNiMDIvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3
LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzY0MjkxZjdkYjViZDgxNTBhNzRhZDIwMzZmMTAzN2U2
YTA0MjhkZjIvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9sa3Atc2IwMi9jeWNsaWNfZmls
ZWlvLXBlcmZvcm1hbmNlLTYwMHMtMTAwJS0xSERELWJ0cmZzLTY0Ry0xMDI0Zi1ybmR3ci1zeW5j
LXg4Nl82NC1yaGVsLUNZQ0xJQ19CQVNFLTY0MjkxZjdkYjViZDgxNTBhNzRhZDIwMzZmMTAzN2U2
YTA0MjhkZjItMjAxNTA4MjMtMTEzMzczLTFlYWRkaDktMC55YW1sIgpkZXF1ZXVlX3RpbWU6IDIw
MTUtMDktMDEgMjE6NDA6NDguMDM3NTc0MzAxICswODowMApucl9jcHU6ICIkKG5wcm9jKSIKbWF4
X3VwdGltZTogMTkwNS42Mzk5OTk5OTk5OTk2CmluaXRyZDogIi9vc2ltYWdlL2RlYmlhbi9kZWJp
YW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpib290bG9hZGVyX2FwcGVuZDoKLSByb290PS9kZXYv
cmFtMAotIHVzZXI9d2ZnCi0gam9iPS9sa3Avc2NoZWR1bGVkL2xrcC1zYjAyL2N5Y2xpY19maWxl
aW8tcGVyZm9ybWFuY2UtNjAwcy0xMDAlLTFIREQtYnRyZnMtNjRHLTEwMjRmLXJuZHdyLXN5bmMt
eDg2XzY0LXJoZWwtQ1lDTElDX0JBU0UtNjQyOTFmN2RiNWJkODE1MGE3NGFkMjAzNmYxMDM3ZTZh
MDQyOGRmMi0yMDE1MDgyMy0xMTMzNzMtMWVhZGRoOS0wLnlhbWwKLSBBUkNIPXg4Nl82NAotIGtj
b25maWc9eDg2XzY0LXJoZWwKLSBicmFuY2g9bGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUw
OTAxMTQKLSBjb21taXQ9NjQyOTFmN2RiNWJkODE1MGE3NGFkMjAzNmYxMDM3ZTZhMDQyOGRmMgot
IEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzY0MjkxZjdkYjViZDgx
NTBhNzRhZDIwMzZmMTAzN2U2YTA0MjhkZjIvdm1saW51ei00LjIuMAotIG1heF91cHRpbWU9MTkw
NQotIFJFU1VMVF9ST09UPS9yZXN1bHQvZmlsZWlvL3BlcmZvcm1hbmNlLTYwMHMtMTAwJS0xSERE
LWJ0cmZzLTY0Ry0xMDI0Zi1ybmR3ci1zeW5jL2xrcC1zYjAyL2RlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS82NDI5MWY3ZGI1YmQ4MTUwYTc0YWQyMDM2ZjEw
MzdlNmEwNDI4ZGYyLzAKLSBMS1BfU0VSVkVSPWlubgotIHwyLQoKCiAgZWFybHlwcmludGs9dHR5
UzAsMTE1MjAwIHN5c3RlbWQubG9nX2xldmVsPWVycgogIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFf
YWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAogIHBhbmlj
PS0xIHNvZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBsb2Fk
X3JhbWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29s
ZT10dHkwIHZnYT1ub3JtYWwKCiAgcncKbGtwX2luaXRyZDogIi9sa3Avd2ZnL2xrcC14ODZfNjQu
Y2d6Igptb2R1bGVzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS82NDI5
MWY3ZGI1YmQ4MTUwYTc0YWQyMDM2ZjEwMzdlNmEwNDI4ZGYyL21vZHVsZXMuY2d6IgpibV9pbml0
cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwv
b3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNn
eiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovdHVyYm9zdGF0LmNn
eiwvbGtwL2JlbmNobWFya3MvdHVyYm9zdGF0LmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZf
NjQtMjAxNS0wMi0wNy5jZ3ovZnMuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1
LTAyLTA3LmNnei9maWxlaW8uY2d6Igo=

--===============5064532171527192016==--

