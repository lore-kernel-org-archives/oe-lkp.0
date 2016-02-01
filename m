Content-Type: multipart/mixed; boundary="===============3851529341030071479=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [f2fs] ea32c36edc: -41.5% fsmark.time.file_system_outputs
Date: Mon, 01 Feb 2016 09:40:21 +0800
Message-ID: <874mdti4xm.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3851529341030071479==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://github.com/0day-ci/linux Jaegeuk-Kim/f2fs-avoid-multiple-node-page-=
writes-due-to-inline_data/20160124-041711
commit ea32c36edcf58f8c27653f3e5bc41f8c0b41e235 ("f2fs: avoid multiple node=
 page writes due to inline_data")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/filesize/fs/iterations/kconfig/nr_directorie=
s/nr_files_per_directory/nr_threads/rootfs/sync_method/tbox_group/test_size=
/testcase:
  gcc-4.9/performance/1HDD/9B/f2fs/1x/x86_64-rhel/16d/256fpd/32t/debian-x86=
_64-2015-02-07.cgz/fsyncBeforeClose/lkp-ne04/400M/fsmark

commit: =

  7fdec82af6a9e190e53d07a1463d2a9ac49a8750
  ea32c36edcf58f8c27653f3e5bc41f8c0b41e235

7fdec82af6a9e190 ea32c36edcf58f8c27653f3e5b =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      1278 =C2=B1  0%      -3.2%       1236 =C2=B1  0%  fsmark.files_per_sec
   1874824 =C2=B1  0%     -41.5%    1097506 =C2=B1  0%  fsmark.time.file_sy=
stem_outputs
     14748 =C2=B1  2%      +9.2%      16099 =C2=B1  1%  fsmark.time.involun=
tary_context_switches
     44.50 =C2=B1  4%     +19.1%      53.00 =C2=B1  0%  fsmark.time.percent=
_of_cpu_this_job_got
     36.30 =C2=B1  1%     +18.6%      43.03 =C2=B1  0%  fsmark.time.system_=
time
    870163 =C2=B1  0%     +19.6%    1041002 =C2=B1  0%  fsmark.time.volunta=
ry_context_switches
     22186 =C2=B1  1%     +10.4%      24490 =C2=B1  1%  vmstat.system.cs
    326553 =C2=B1  4%     -10.6%     292026 =C2=B1  0%  meminfo.Active
    292915 =C2=B1  4%     -11.9%     258035 =C2=B1  0%  meminfo.Active(file)
     30038 =C2=B1 10%     +17.1%      35170 =C2=B1 13%  softirqs.RCU
     31822 =C2=B1  9%     +16.4%      37037 =C2=B1 13%  softirqs.SCHED
    143471 =C2=B1  4%     -15.6%     121104 =C2=B1  2%  numa-meminfo.node1.=
Active
     17081 =C2=B1 18%     -21.7%      13370 =C2=B1 13%  numa-meminfo.node1.=
Active(anon)
    126389 =C2=B1  2%     -14.8%     107733 =C2=B1  2%  numa-meminfo.node1.=
Active(file)
     16928 =C2=B1 18%     -21.9%      13222 =C2=B1 13%  numa-meminfo.node1.=
AnonPages
     75337 =C2=B1 20%     -42.1%      43626 =C2=B1  1%  numa-vmstat.node0.n=
r_dirtied
      4266 =C2=B1 18%     -21.8%       3338 =C2=B1 13%  numa-vmstat.node1.n=
r_active_anon
     31597 =C2=B1  2%     -14.8%      26931 =C2=B1  2%  numa-vmstat.node1.n=
r_active_file
      4226 =C2=B1 18%     -22.0%       3297 =C2=B1 13%  numa-vmstat.node1.n=
r_anon_pages
     73228 =C2=B1  4%     -11.9%      64502 =C2=B1  0%  proc-vmstat.nr_acti=
ve_file
    233617 =C2=B1  0%     -41.5%     136640 =C2=B1  0%  proc-vmstat.nr_dirt=
ied
      6178 =C2=B1  0%     -11.1%       5489 =C2=B1  0%  proc-vmstat.numa_pt=
e_updates
     50891 =C2=B1  0%     -39.8%      30627 =C2=B1  0%  proc-vmstat.pgactiv=
ate
   1874824 =C2=B1  0%     -41.5%    1097506 =C2=B1  0%  time.file_system_ou=
tputs
     44.50 =C2=B1  4%     +19.1%      53.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
     36.30 =C2=B1  1%     +18.6%      43.03 =C2=B1  0%  time.system_time
    870163 =C2=B1  0%     +19.6%    1041002 =C2=B1  0%  time.voluntary_cont=
ext_switches
  63126565 =C2=B1  2%     +16.8%   73717213 =C2=B1  1%  cpuidle.C1-NHM.time
  49681942 =C2=B1  1%     +34.6%   66867204 =C2=B1  3%  cpuidle.C1E-NHM.time
     56832 =C2=B1  1%     +20.6%      68527 =C2=B1  5%  cpuidle.C1E-NHM.usa=
ge
 3.428e+08 =C2=B1  1%     +14.9%  3.938e+08 =C2=B1  3%  cpuidle.C3-NHM.time
    314858 =C2=B1  3%     +32.6%     417584 =C2=B1 11%  cpuidle.C3-NHM.usage
     10.96 =C2=B1  6%      +6.8%      11.70 =C2=B1  1%  turbostat.%Busy
     20.82 =C2=B1  5%     +15.7%      24.10 =C2=B1  1%  turbostat.CPU%c1
     28.15 =C2=B1  4%     +13.0%      31.82 =C2=B1  3%  turbostat.CPU%c3
     40.07 =C2=B1  7%     -19.2%      32.38 =C2=B1  4%  turbostat.CPU%c6
      9.22 =C2=B1  6%     -23.4%       7.06 =C2=B1  3%  turbostat.Pkg%pc3
     36043 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.c=
all_rwsem_down_read_failed.f2fs_write_data_page.[f2fs].__f2fs_writepage.[f2=
fs].f2fs_write_cache_pages.[f2fs].f2fs_write_data_pages.[f2fs].do_writepage=
s.__filemap_fdatawrite_range.filemap_write_and_wait_range.f2fs_sync_file.[f=
2fs].vfs_fsync_range.do_fsync.SyS_fsync
      7336 =C2=B1  0%    +698.9%      58613 =C2=B1  1%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].f2fs_write_node_page.[f2fs=
].sync_node_pages.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS=
_fsync.entry_SYSCALL_64_fastpath
     22886 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].__ge=
t_node_page.[f2fs].get_node_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_write=
_inline_data.[f2fs].f2fs_write_data_page.[f2fs].__f2fs_writepage.[f2fs].f2f=
s_write_cache_pages.[f2fs].f2fs_write_data_pages.[f2fs].do_writepages
      0.00 =C2=B1 -1%      +Inf%      79634 =C2=B1  0%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].__ge=
t_node_page.[f2fs].get_node_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_write=
_inline_data.[f2fs].f2fs_write_end.[f2fs].generic_perform_write.__generic_f=
ile_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs]
     75051 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].__ge=
t_node_page.[f2fs].get_node_page.[f2fs].get_node_page.[f2fs].update_inode_p=
age.[f2fs].f2fs_write_end.[f2fs].generic_perform_write.__generic_file_write=
_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs]
     17214 =C2=B1  0%    +321.2%      72498 =C2=B1  0%  latency_stats.hits.=
call_rwsem_down_read_failed.is_checkpointed_node.[f2fs].f2fs_sync_file.[f2f=
s].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
     11958 =C2=B1  0%    +454.6%      66321 =C2=B1  0%  latency_stats.hits.=
call_rwsem_down_read_failed.need_dentry_mark.[f2fs].sync_node_pages.[f2fs].=
f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_f=
astpath
     74681 =C2=B1  0%    -100.0%       8.25 =C2=B1 61%  latency_stats.hits.=
f2fs_write_data_pages.[f2fs].do_writepages.__filemap_fdatawrite_range.filem=
ap_write_and_wait_range.f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_=
fsync.entry_SYSCALL_64_fastpath
    130560 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.c=
all_rwsem_down_read_failed.f2fs_write_data_page.[f2fs].__f2fs_writepage.[f2=
fs].f2fs_write_cache_pages.[f2fs].f2fs_write_data_pages.[f2fs].do_writepage=
s.__filemap_fdatawrite_range.filemap_write_and_wait_range.f2fs_sync_file.[f=
2fs].vfs_fsync_range.do_fsync.SyS_fsync
    270069 =C2=B1 14%    -100.0%     125.25 =C2=B1 81%  latency_stats.max.f=
2fs_write_data_pages.[f2fs].do_writepages.__filemap_fdatawrite_range.filema=
p_write_and_wait_range.f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_f=
sync.entry_SYSCALL_64_fastpath
  12155740 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_write_data_page.[f2fs].__f2fs_writepage.[f2=
fs].f2fs_write_cache_pages.[f2fs].f2fs_write_data_pages.[f2fs].do_writepage=
s.__filemap_fdatawrite_range.filemap_write_and_wait_range.f2fs_sync_file.[f=
2fs].vfs_fsync_range.do_fsync.SyS_fsync
   1498927 =C2=B1  1%    +858.3%   14364772 =C2=B1  0%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].f2fs_write_node_page.[f2fs]=
.sync_node_pages.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_=
fsync.entry_SYSCALL_64_fastpath
     22102 =C2=B1  9%    +187.5%      63548 =C2=B1 19%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].__get=
_node_page.[f2fs].get_node_page.[f2fs].get_dnode_of_data.[f2fs].do_write_da=
ta_page.[f2fs].f2fs_write_data_page.[f2fs].__f2fs_writepage.[f2fs].f2fs_wri=
te_cache_pages.[f2fs].f2fs_write_data_pages.[f2fs].do_writepages
   5128495 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].__get=
_node_page.[f2fs].get_node_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_write_=
inline_data.[f2fs].f2fs_write_data_page.[f2fs].__f2fs_writepage.[f2fs].f2fs=
_write_cache_pages.[f2fs].f2fs_write_data_pages.[f2fs].do_writepages
      0.00 =C2=B1 -1%      +Inf%   29676287 =C2=B1  0%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].__get=
_node_page.[f2fs].get_node_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_write_=
inline_data.[f2fs].f2fs_write_end.[f2fs].generic_perform_write.__generic_fi=
le_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs]
  24113264 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].__get=
_node_page.[f2fs].get_node_page.[f2fs].get_node_page.[f2fs].update_inode_pa=
ge.[f2fs].f2fs_write_end.[f2fs].generic_perform_write.__generic_file_write_=
iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs]
     11707 =C2=B1  6%    +229.8%      38617 =C2=B1 24%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].write_data_page.[f2fs].do_w=
rite_data_page.[f2fs].f2fs_write_data_page.[f2fs].__f2fs_writepage.[f2fs].f=
2fs_write_cache_pages.[f2fs].f2fs_write_data_pages.[f2fs].do_writepages.__f=
ilemap_fdatawrite_range.filemap_fdatawrite.sync_dirty_inodes.[f2fs]
   3670765 =C2=B1  0%    +549.9%   23857878 =C2=B1  0%  latency_stats.sum.c=
all_rwsem_down_read_failed.is_checkpointed_node.[f2fs].f2fs_sync_file.[f2fs=
].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
   2546436 =C2=B1  0%    +680.8%   19883041 =C2=B1  0%  latency_stats.sum.c=
all_rwsem_down_read_failed.need_dentry_mark.[f2fs].sync_node_pages.[f2fs].f=
2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fa=
stpath
   5243465 =C2=B1  2%    +258.7%   18809634 =C2=B1  1%  latency_stats.sum.c=
all_rwsem_down_read_failed.need_inode_block_update.[f2fs].f2fs_sync_file.[f=
2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
     13216 =C2=B1 86%     -58.0%       5547 =C2=B1 26%  latency_stats.sum.c=
all_rwsem_down_write_failed.f2fs_init_extent_tree.[f2fs].f2fs_new_inode.[f2=
fs].f2fs_create.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_=
open.entry_SYSCALL_64_fastpath
   3020759 =C2=B1  2%    +333.5%   13096379 =C2=B1  0%  latency_stats.sum.c=
all_rwsem_down_write_failed.set_node_addr.[f2fs].f2fs_write_node_page.[f2fs=
].sync_node_pages.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS=
_fsync.entry_SYSCALL_64_fastpath
 1.722e+08 =C2=B1  2%    -100.0%     630.50 =C2=B1 92%  latency_stats.sum.f=
2fs_write_data_pages.[f2fs].do_writepages.__filemap_fdatawrite_range.filema=
p_write_and_wait_range.f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_f=
sync.entry_SYSCALL_64_fastpath
    896.92 =C2=B1 10%     +23.0%       1103 =C2=B1  6%  sched_debug.cfs_rq:=
/.exec_clock.12
      1663 =C2=B1  9%     +40.9%       2343 =C2=B1 24%  sched_debug.cfs_rq:=
/.exec_clock.2
    767.96 =C2=B1  8%     +16.5%     894.94 =C2=B1  3%  sched_debug.cfs_rq:=
/.exec_clock.min
      3.12 =C2=B1 17%     -88.0%       0.38 =C2=B1110%  sched_debug.cfs_rq:=
/.load_avg.min
      3666 =C2=B1 13%     +35.9%       4980 =C2=B1  6%  sched_debug.cfs_rq:=
/.min_vruntime.12
      4101 =C2=B1 10%     +60.7%       6589 =C2=B1 26%  sched_debug.cfs_rq:=
/.min_vruntime.14
      4702 =C2=B1  7%     +50.3%       7067 =C2=B1 12%  sched_debug.cfs_rq:=
/.min_vruntime.15
      7043 =C2=B1 14%     +25.9%       8870 =C2=B1 11%  sched_debug.cfs_rq:=
/.min_vruntime.2
      4100 =C2=B1  4%     +48.3%       6081 =C2=B1 15%  sched_debug.cfs_rq:=
/.min_vruntime.9
      6575 =C2=B1  3%     +17.8%       7744 =C2=B1  3%  sched_debug.cfs_rq:=
/.min_vruntime.avg
      3239 =C2=B1  3%     +31.0%       4242 =C2=B1  9%  sched_debug.cfs_rq:=
/.min_vruntime.min
      0.33 =C2=B1141%   +1175.0%       4.25 =C2=B1 69%  sched_debug.cfs_rq:=
/.nr_spread_over.2
     -4695 =C2=B1-17%     -40.2%      -2807 =C2=B1-39%  sched_debug.cfs_rq:=
/.spread0.15
    136.75 =C2=B1 26%     -25.8%     101.50 =C2=B1 15%  sched_debug.cfs_rq:=
/.util_avg.3
     48.62 =C2=B1 21%     -80.7%       9.38 =C2=B1 59%  sched_debug.cfs_rq:=
/.util_avg.min
     43.46 =C2=B1 16%     +60.2%      69.63 =C2=B1 21%  sched_debug.cfs_rq:=
/.util_avg.stddev
      9236 =C2=B1  4%      +9.8%      10143 =C2=B1  6%  sched_debug.cpu.nr_=
load_updates.10
      9179 =C2=B1  4%     +11.8%      10258 =C2=B1  5%  sched_debug.cpu.nr_=
load_updates.14
      9296 =C2=B1  4%      +9.8%      10211 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.8
     64213 =C2=B1  7%     +12.9%      72481 =C2=B1  7%  sched_debug.cpu.nr_=
switches.0
     49843 =C2=B1  2%     +19.5%      59574 =C2=B1  8%  sched_debug.cpu.nr_=
switches.1
     35136 =C2=B1 10%     +23.1%      43259 =C2=B1  5%  sched_debug.cpu.nr_=
switches.10
     27937 =C2=B1  6%     +23.4%      34467 =C2=B1  6%  sched_debug.cpu.nr_=
switches.11
     38343 =C2=B1 10%     +21.4%      46565 =C2=B1 10%  sched_debug.cpu.nr_=
switches.12
     35454 =C2=B1 10%     +21.8%      43192 =C2=B1  3%  sched_debug.cpu.nr_=
switches.14
     29114 =C2=B1  7%     +29.6%      37725 =C2=B1 20%  sched_debug.cpu.nr_=
switches.15
     58979 =C2=B1  5%     +17.3%      69170 =C2=B1  7%  sched_debug.cpu.nr_=
switches.2
     56391 =C2=B1  5%     +23.7%      69761 =C2=B1  8%  sched_debug.cpu.nr_=
switches.6
     35766 =C2=B1  9%     +25.9%      45013 =C2=B1  2%  sched_debug.cpu.nr_=
switches.8
     43509 =C2=B1  5%     +16.8%      50818 =C2=B1  3%  sched_debug.cpu.nr_=
switches.avg
     65222 =C2=B1  7%     +12.5%      73372 =C2=B1  7%  sched_debug.cpu.nr_=
switches.max
     27549 =C2=B1  6%     +18.2%      32567 =C2=B1  3%  sched_debug.cpu.nr_=
switches.min
     -6534 =C2=B1 -5%     +70.0%     -11111 =C2=B1 -2%  sched_debug.cpu.nr_=
uninterruptible.0
   -958.25 =C2=B1-13%     +42.1%      -1361 =C2=B1-10%  sched_debug.cpu.nr_=
uninterruptible.1
      1716 =C2=B1 20%     +46.1%       2507 =C2=B1  6%  sched_debug.cpu.nr_=
uninterruptible.10
      1373 =C2=B1  8%     +56.0%       2143 =C2=B1 10%  sched_debug.cpu.nr_=
uninterruptible.11
      1599 =C2=B1  7%     +71.7%       2744 =C2=B1  6%  sched_debug.cpu.nr_=
uninterruptible.12
      1351 =C2=B1 20%     +52.4%       2060 =C2=B1  3%  sched_debug.cpu.nr_=
uninterruptible.13
      1824 =C2=B1  8%     +40.8%       2568 =C2=B1  4%  sched_debug.cpu.nr_=
uninterruptible.14
      1334 =C2=B1 10%     +68.0%       2241 =C2=B1  4%  sched_debug.cpu.nr_=
uninterruptible.15
     -1140 =C2=B1-14%     +44.6%      -1649 =C2=B1 -4%  sched_debug.cpu.nr_=
uninterruptible.5
     -1139 =C2=B1-15%     +41.1%      -1607 =C2=B1-17%  sched_debug.cpu.nr_=
uninterruptible.7
      1167 =C2=B1 13%     +70.0%       1983 =C2=B1  4%  sched_debug.cpu.nr_=
uninterruptible.8
      1319 =C2=B1  7%     +46.4%       1930 =C2=B1  6%  sched_debug.cpu.nr_=
uninterruptible.9
      1956 =C2=B1  8%     +41.9%       2775 =C2=B1  5%  sched_debug.cpu.nr_=
uninterruptible.max
     -6537 =C2=B1 -5%     +70.0%     -11114 =C2=B1 -2%  sched_debug.cpu.nr_=
uninterruptible.min
      2035 =C2=B1  1%     +62.9%       3315 =C2=B1  1%  sched_debug.cpu.nr_=
uninterruptible.stddev
     51578 =C2=B1  2%     +17.3%      60512 =C2=B1  7%  sched_debug.cpu.sch=
ed_count.1
     35156 =C2=B1 10%     +24.2%      43650 =C2=B1  4%  sched_debug.cpu.sch=
ed_count.10
     27959 =C2=B1  6%     +25.4%      35049 =C2=B1  4%  sched_debug.cpu.sch=
ed_count.11
     38363 =C2=B1 10%     +25.0%      47965 =C2=B1  7%  sched_debug.cpu.sch=
ed_count.12
     35618 =C2=B1  9%     +21.8%      43369 =C2=B1  2%  sched_debug.cpu.sch=
ed_count.14
     29134 =C2=B1  7%     +34.3%      39119 =C2=B1 18%  sched_debug.cpu.sch=
ed_count.15
     50741 =C2=B1  8%     +30.2%      66049 =C2=B1 23%  sched_debug.cpu.sch=
ed_count.3
     62138 =C2=B1  8%     +14.3%      71037 =C2=B1  6%  sched_debug.cpu.sch=
ed_count.6
     36028 =C2=B1  9%     +25.0%      45039 =C2=B1  2%  sched_debug.cpu.sch=
ed_count.8
     27623 =C2=B1  6%     +18.4%      32700 =C2=B1  3%  sched_debug.cpu.sch=
ed_count.min
     28067 =C2=B1  8%     +10.2%      30921 =C2=B1  8%  sched_debug.cpu.sch=
ed_goidle.0
     21211 =C2=B1  3%     +20.1%      25465 =C2=B1  8%  sched_debug.cpu.sch=
ed_goidle.1
     13529 =C2=B1 10%     +20.1%      16248 =C2=B1  6%  sched_debug.cpu.sch=
ed_goidle.10
     11159 =C2=B1  5%     +21.5%      13554 =C2=B1  6%  sched_debug.cpu.sch=
ed_goidle.11
     13666 =C2=B1 11%     +18.9%      16252 =C2=B1  3%  sched_debug.cpu.sch=
ed_goidle.14
     11607 =C2=B1  8%     +29.2%      15001 =C2=B1 25%  sched_debug.cpu.sch=
ed_goidle.15
     25465 =C2=B1  6%     +15.8%      29484 =C2=B1  8%  sched_debug.cpu.sch=
ed_goidle.2
     24349 =C2=B1  5%     +22.5%      29827 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.6
     13756 =C2=B1  9%     +23.4%      16972 =C2=B1  3%  sched_debug.cpu.sch=
ed_goidle.8
     18266 =C2=B1  4%     +14.8%      20973 =C2=B1  4%  sched_debug.cpu.sch=
ed_goidle.avg
     28513 =C2=B1  7%     +11.4%      31770 =C2=B1  7%  sched_debug.cpu.sch=
ed_goidle.max
     11005 =C2=B1  5%     +15.1%      12672 =C2=B1  3%  sched_debug.cpu.sch=
ed_goidle.min
     15905 =C2=B1  9%     +22.8%      19533 =C2=B1  8%  sched_debug.cpu.ttw=
u_count.12
     13379 =C2=B1 10%     +22.5%      16391 =C2=B1  9%  sched_debug.cpu.ttw=
u_count.13
     15038 =C2=B1 11%     +29.0%      19395 =C2=B1  8%  sched_debug.cpu.ttw=
u_count.14
     26020 =C2=B1  4%     +22.2%      31789 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.2
     25547 =C2=B1  7%     +16.5%      29762 =C2=B1  5%  sched_debug.cpu.ttw=
u_count.3
     26667 =C2=B1  5%     +31.7%      35117 =C2=B1  9%  sched_debug.cpu.ttw=
u_count.4
     26022 =C2=B1  9%     +15.1%      29953 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.5
     27546 =C2=B1  6%     +31.4%      36193 =C2=B1  8%  sched_debug.cpu.ttw=
u_count.6
     25556 =C2=B1  5%     +24.9%      31908 =C2=B1 13%  sched_debug.cpu.ttw=
u_count.7
     24624 =C2=B1  5%     +18.5%      29191 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.avg
     11891 =C2=B1  7%     +23.4%      14671 =C2=B1  5%  sched_debug.cpu.ttw=
u_count.min
     21466 =C2=B1  2%     +33.3%      28616 =C2=B1  2%  sched_debug.cpu.ttw=
u_local.0
      6323 =C2=B1  9%     +29.1%       8161 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.1
      4485 =C2=B1  9%     +31.7%       5907 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.10
      3238 =C2=B1  3%     +25.5%       4063 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.11
      5061 =C2=B1 10%     +22.7%       6211 =C2=B1  9%  sched_debug.cpu.ttw=
u_local.12
      3264 =C2=B1 10%     +28.0%       4178 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.13
      4339 =C2=B1  9%     +35.0%       5859 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.14
      3638 =C2=B1 10%     +21.4%       4415 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.15
      6344 =C2=B1  6%     +37.4%       8716 =C2=B1  2%  sched_debug.cpu.ttw=
u_local.2
      5839 =C2=B1  9%     +28.8%       7523 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.3
      6459 =C2=B1  6%     +48.7%       9602 =C2=B1 13%  sched_debug.cpu.ttw=
u_local.4
      5643 =C2=B1  9%     +29.8%       7322 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.5
      6341 =C2=B1  4%     +58.9%      10079 =C2=B1 14%  sched_debug.cpu.ttw=
u_local.6
      5599 =C2=B1  4%     +34.9%       7552 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.7
      4901 =C2=B1  6%     +28.0%       6275 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.8
      6031 =C2=B1  3%     +33.5%       8053 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.avg
     21563 =C2=B1  2%     +34.9%      29080 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.max
      3061 =C2=B1  6%     +29.6%       3966 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.min
      4253 =C2=B1  3%     +36.5%       5807 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.stddev


lkp-ne04: Nehalem-EP
Memory: 12G


                            fsmark.time.file_system_outputs

  1.9e+06 **-**-*-**--***-****-***-****-***-***-****-***-****-***-***-****-=
**
          |    *    *                                                      =
 |
  1.8e+06 ++                                                               =
 |
  1.7e+06 ++                                                               =
 |
          |                                                                =
 |
  1.6e+06 ++                                                               =
 |
  1.5e+06 ++                                                               =
 |
          |                                                                =
 |
  1.4e+06 ++                                                               =
 |
  1.3e+06 ++                                                               =
 |
          |                                                                =
 |
  1.2e+06 ++                                                               =
 |
  1.1e+06 ++                        O    OO OO                             =
 |
          OO OOOO OOO OOO OOOO OOO O OO O     O                            =
 |
    1e+06 ++---------------------------------------------------------------=
-+


                               proc-vmstat.nr_dirtied

  240000 ++----------------*--*--------------------------------------------=
-+
         **.***.***.****.**  * *.***.***.****.***.***.***.***.****.***.***.=
**
  220000 ++                                                                =
 |
         |                                                                 =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  180000 ++                                                                =
 |
         |                                                                 =
 |
  160000 ++                                                                =
 |
         |                                                                 =
 |
         |                                                                 =
 |
  140000 OO OOO OOO OOOO OOO OOO OOO OOO OOOO O                            =
 |
         |                                                                 =
 |
  120000 ++----------------------------------------------------------------=
-+


                               proc-vmstat.pgactivate

  55000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
        **.***.***.* *.*                                              .** .=
**
  50000 ++          *  :                                             *   * =
 |
        |               :                                            :     =
 |
        |               **.***.***.***.***.***.***.***.***.* *.***.**      =
 |
  45000 ++                                                  *              =
 |
        |                                                                  =
 |
  40000 ++                                                                 =
 |
        OO OOO OOO OOO OOO OOO                                             =
 |
        |                                                                  =
 |
  35000 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  30000 ++---------------------OOO-OOO-OOO-OOO-----------------------------=
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

--===============3851529341030071479==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogZnNtYXJrCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9uaXRv
cgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0
YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBw
cm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50
ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAg
YmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6IAog
IGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1ZzoK
ICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiBwZXJmb3JtYW5jZQpkZWZhdWx0LXdh
dGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogZWEzMmMzNmVkY2Y1
OGY4YzI3NjUzZjNlNWJjNDFmOGMwYjQxZTIzNQptb2RlbDogTmVoYWxlbS1FUAptZW1vcnk6IDEy
RwpoZGRfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtU1QzNTAwNTE0TlNfOVdKMDNF
QkEtcGFydDMiCnN3YXBfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtU1QzMTIwMDI2
QVNfNU1TMDdIQTItcGFydDIiCnJvb3Rmc19wYXJ0aXRpb246ICIvZGV2L2Rpc2svYnktaWQvYXRh
LVNUMzUwMDUxNE5TXzlXSjAzRUJBLXBhcnQxIgpjYXRlZ29yeTogYmVuY2htYXJrCml0ZXJhdGlv
bnM6IDF4Cm5yX3RocmVhZHM6IDMydApkaXNrOiAxSERECmZzOiBmMmZzCmZzMjogCmZzbWFyazoK
ICBmaWxlc2l6ZTogOUIKICB0ZXN0X3NpemU6IDQwME0KICBzeW5jX21ldGhvZDogZnN5bmNCZWZv
cmVDbG9zZQogIG5yX2RpcmVjdG9yaWVzOiAxNmQKICBucl9maWxlc19wZXJfZGlyZWN0b3J5OiAy
NTZmcGQKcXVldWU6IGJpc2VjdAp0ZXN0Ym94OiBsa3AtbmUwNAp0Ym94X2dyb3VwOiBsa3AtbmUw
NAprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTYtMDEtMjkgMTU6MTE6MDYu
MTIxODE1NTQzICswODowMAppZDogMDNhMmJhZjc1MDMxYjYxZTk1ZjZhYjJiMGE5ZjQ5OTA1NTZl
YjdjMwp1c2VyOiBsa3AKY29tcGlsZXI6IGdjYy00LjkKaGVhZF9jb21taXQ6IDI3YzUyMzExY2Iz
YzdkZDY2Y2E5YmI2YjBjMGI2M2FjMmJjNzIwNTEKYmFzZV9jb21taXQ6IDkyZTk2M2Y1MGZjNzQw
NDFiNWU5ZTc0NGMzMzBkY2E0OGUwNGYwOGQKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3Vy
bHktMjAxNjAxMjkwMwpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oKcmVzdWx0
X3Jvb3Q6ICIvcmVzdWx0L2ZzbWFyay9wZXJmb3JtYW5jZS0xeC0zMnQtMUhERC1mMmZzLTlCLTQw
ME0tZnN5bmNCZWZvcmVDbG9zZS0xNmQtMjU2ZnBkL2xrcC1uZTA0L2RlYmlhbi14ODZfNjQtMjAx
NS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS9lYTMyYzM2ZWRjZjU4ZjhjMjc2NTNmM2U1
YmM0MWY4YzBiNDFlMjM1LzEiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvbGtwLW5lMDQvYmlz
ZWN0X2ZzbWFyay1wZXJmb3JtYW5jZS0xeC0zMnQtMUhERC1mMmZzLTlCLTQwME0tZnN5bmNCZWZv
cmVDbG9zZS0xNmQtMjU2ZnBkLWRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJo
ZWwtZWEzMmMzNmVkY2Y1OGY4YzI3NjUzZjNlNWJjNDFmOGMwYjQxZTIzNS0yMDE2MDEyOS0xMjMx
OTAtMXN3cDUxNy0xLnlhbWwiCm5yX2NwdTogIiQobnByb2MpIgptYXhfdXB0aW1lOiA4NzMuMDIK
aW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJv
b3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9z
Y2hlZHVsZWQvbGtwLW5lMDQvYmlzZWN0X2ZzbWFyay1wZXJmb3JtYW5jZS0xeC0zMnQtMUhERC1m
MmZzLTlCLTQwME0tZnN5bmNCZWZvcmVDbG9zZS0xNmQtMjU2ZnBkLWRlYmlhbi14ODZfNjQtMjAx
NS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtZWEzMmMzNmVkY2Y1OGY4YzI3NjUzZjNlNWJjNDFmOGMw
YjQxZTIzNS0yMDE2MDEyOS0xMjMxOTAtMXN3cDUxNy0xLnlhbWwKLSBBUkNIPXg4Nl82NAotIGtj
b25maWc9eDg2XzY0LXJoZWwKLSBicmFuY2g9bGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTYw
MTI5MDMKLSBjb21taXQ9ZWEzMmMzNmVkY2Y1OGY4YzI3NjUzZjNlNWJjNDFmOGMwYjQxZTIzNQot
IEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45L2VhMzJjMzZlZGNmNThm
OGMyNzY1M2YzZTViYzQxZjhjMGI0MWUyMzUvdm1saW51ei00LjQuMC0wNTU5NC1nZWEzMmMzNgot
IG1heF91cHRpbWU9ODczCi0gUkVTVUxUX1JPT1Q9L3Jlc3VsdC9mc21hcmsvcGVyZm9ybWFuY2Ut
MXgtMzJ0LTFIREQtZjJmcy05Qi00MDBNLWZzeW5jQmVmb3JlQ2xvc2UtMTZkLTI1NmZwZC9sa3At
bmUwNC9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvZWEz
MmMzNmVkY2Y1OGY4YzI3NjUzZjNlNWJjNDFmOGMwYjQxZTIzNS8xCi0gTEtQX1NFUlZFUj1pbm4K
LSB8Mi0KCgogIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIK
ICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVf
c3RhbGxfdGltZW91dD0xMDAKICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNo
ZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNv
bnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0
cmQ6ICIvbGtwL2xrcC9sa3AteDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4
L3g4Nl82NC1yaGVsL2djYy00LjkvZWEzMmMzNmVkY2Y1OGY4YzI3NjUzZjNlNWJjNDFmOGMwYjQx
ZTIzNS9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUt
MDItMDcuY2d6L3J1bi1pcGNvbmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIw
MTUtMDItMDcuY2d6L3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3os
L29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2ZzLmNneiwvb3NpbWFn
ZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovZnMyLmNneiwvbGtwL2JlbmNobWFy
a3MvZnNtYXJrLmNneiIKbGludXhfaGVhZGVyc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1y
aGVsL2djYy00LjkvZWEzMmMzNmVkY2Y1OGY4YzI3NjUzZjNlNWJjNDFmOGMwYjQxZTIzNS9saW51
eC1oZWFkZXJzLmNneiIKcmVwZWF0X3RvOiAyCmtlcm5lbDogIi9wa2cvbGludXgveDg2XzY0LXJo
ZWwvZ2NjLTQuOS9lYTMyYzM2ZWRjZjU4ZjhjMjc2NTNmM2U1YmM0MWY4YzBiNDFlMjM1L3ZtbGlu
dXotNC40LjAtMDU1OTQtZ2VhMzJjMzYiCmRlcXVldWVfdGltZTogMjAxNi0wMS0yOSAxNTozMzoy
MS4xNTQwNDM0ODQgKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogMjIuODEgOC4w
NyAyLjg5IDIvMjUyIDMyMzIKc3RhcnRfdGltZTogJzE0NTQwNTI4NDMnCmVuZF90aW1lOiAnMTQ1
NDA1MjkyNicKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNjAxMjctMjIzODUzIgo=

--===============3851529341030071479==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNi0wMS0yOSAxNTozMTo0NCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOSAxNTozMTo0NCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOSAxNTozMTo0NCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDEtMjkgMTU6MzE6NDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTI5IDE1OjMxOjQ0IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMS0yOSAxNTozMTo0NCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEt
MjkgMTU6MzE6NDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTI5IDE1OjMxOjQ0IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMS0yOSAxNTozMTo0NCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOSAx
NTozMTo0NCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1My9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOSAxNTozMTo0NCBlY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMS0yOSAxNTozMTo0NCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOSAxNTozMTo0
NCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ni9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOSAxNTozMTo0NCBlY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAx
Ni0wMS0yOSAxNTozMTo0NCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOSAxNTozMTo0NCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMS0yOSAxNTozMTo0NCBta2ZzIC10IGYyZnMgL2Rldi9zZGEzCjIw
MTYtMDEtMjkgMTU6MzE6NDYgbW91bnQgLXQgZjJmcyAvZGV2L3NkYTMgL2ZzL3NkYTMKMjAxNi0w
MS0yOSAxNTozMTo0NyAuL2ZzX21hcmsgLWQgL2ZzL3NkYTMvMSAtZCAvZnMvc2RhMy8yIC1kIC9m
cy9zZGEzLzMgLWQgL2ZzL3NkYTMvNCAtZCAvZnMvc2RhMy81IC1kIC9mcy9zZGEzLzYgLWQgL2Zz
L3NkYTMvNyAtZCAvZnMvc2RhMy84IC1kIC9mcy9zZGEzLzkgLWQgL2ZzL3NkYTMvMTAgLWQgL2Zz
L3NkYTMvMTEgLWQgL2ZzL3NkYTMvMTIgLWQgL2ZzL3NkYTMvMTMgLWQgL2ZzL3NkYTMvMTQgLWQg
L2ZzL3NkYTMvMTUgLWQgL2ZzL3NkYTMvMTYgLWQgL2ZzL3NkYTMvMTcgLWQgL2ZzL3NkYTMvMTgg
LWQgL2ZzL3NkYTMvMTkgLWQgL2ZzL3NkYTMvMjAgLWQgL2ZzL3NkYTMvMjEgLWQgL2ZzL3NkYTMv
MjIgLWQgL2ZzL3NkYTMvMjMgLWQgL2ZzL3NkYTMvMjQgLWQgL2ZzL3NkYTMvMjUgLWQgL2ZzL3Nk
YTMvMjYgLWQgL2ZzL3NkYTMvMjcgLWQgL2ZzL3NkYTMvMjggLWQgL2ZzL3NkYTMvMjkgLWQgL2Zz
L3NkYTMvMzAgLWQgL2ZzL3NkYTMvMzEgLWQgL2ZzL3NkYTMvMzIgLUQgMTYgLU4gMjU2IC1uIDMy
MDAgLUwgMSAtUyAxIC1zIDkK

--===============3851529341030071479==--

