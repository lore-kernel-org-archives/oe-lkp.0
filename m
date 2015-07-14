Content-Type: multipart/mixed; boundary="===============4457953950907327421=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [x86/entry/64] 62c79204783: 5.9% aim7.jobs-per-min
Date: Tue, 14 Jul 2015 10:35:47 +0800
Message-ID: <1436841347.5489.459.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4457953950907327421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git x86/entry
commit 62c79204783e188291d880f23d49c02d8c8f498b ("x86/entry/64: When return=
ing via SYSRET, POP regs instead of using MOV")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/load/test:
  lkp-a06/aim7/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/4000/misc_r=
tns_1

commit: =

  cad8c9e5d6a97898d37b1a8e5cdf838d79ba6e50
  62c79204783e188291d880f23d49c02d8c8f498b

cad8c9e5d6a97898 62c79204783e188291d880f23d =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    108044 =C2=B1  0%      +5.9%     114416 =C2=B1  0%  aim7.jobs-per-min
    223.70 =C2=B1  0%      -5.6%     211.11 =C2=B1  0%  aim7.time.elapsed_t=
ime
    223.70 =C2=B1  0%      -5.6%     211.11 =C2=B1  0%  aim7.time.elapsed_t=
ime.max
   2113772 =C2=B1  0%     -83.5%     349283 =C2=B1  2%  aim7.time.involunta=
ry_context_switches
    599.10 =C2=B1  0%      -2.2%     585.90 =C2=B1  0%  aim7.time.system_ti=
me
    203.87 =C2=B1  1%      -4.7%     194.25 =C2=B1  0%  aim7.time.user_time
   2113772 =C2=B1  0%     -83.5%     349283 =C2=B1  2%  time.involuntary_co=
ntext_switches

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/load/test:
  lkp-a06/aim7/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/4000/new_ra=
ph

commit: =

  cad8c9e5d6a97898d37b1a8e5cdf838d79ba6e50
  62c79204783e188291d880f23d49c02d8c8f498b

cad8c9e5d6a97898 62c79204783e188291d880f23d =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    184357 =C2=B1  0%     +10.8%     204299 =C2=B1  0%  aim7.jobs-per-min
    131.71 =C2=B1  0%      -9.8%     118.82 =C2=B1  0%  aim7.time.elapsed_t=
ime
    131.71 =C2=B1  0%      -9.8%     118.82 =C2=B1  0%  aim7.time.elapsed_t=
ime.max
   2193692 =C2=B1  0%     -92.5%     164787 =C2=B1  0%  aim7.time.involunta=
ry_context_switches
     18.86 =C2=B1  2%     -68.5%       5.94 =C2=B1  4%  aim7.time.system_ti=
me
    435.63 =C2=B1  0%      -2.7%     424.04 =C2=B1  0%  aim7.time.user_time
     58879 =C2=B1  2%     -19.5%      47402 =C2=B1  2%  aim7.time.voluntary=
_context_switches
    131.71 =C2=B1  0%      -9.8%     118.82 =C2=B1  0%  time.elapsed_time
    131.71 =C2=B1  0%      -9.8%     118.82 =C2=B1  0%  time.elapsed_time.m=
ax
   2193692 =C2=B1  0%     -92.5%     164787 =C2=B1  0%  time.involuntary_co=
ntext_switches
     18.86 =C2=B1  2%     -68.5%       5.94 =C2=B1  4%  time.system_time
     58879 =C2=B1  2%     -19.5%      47402 =C2=B1  2%  time.voluntary_cont=
ext_switches

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/load/test:
  lkp-a06/aim7/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/4000/pipe_c=
py

commit: =

  cad8c9e5d6a97898d37b1a8e5cdf838d79ba6e50
  62c79204783e188291d880f23d49c02d8c8f498b

cad8c9e5d6a97898 62c79204783e188291d880f23d =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    240551 =C2=B1  0%     +13.9%     273904 =C2=B1  2%  aim7.jobs-per-min
    101.42 =C2=B1  0%     -12.2%      89.04 =C2=B1  2%  aim7.time.elapsed_t=
ime
    101.42 =C2=B1  0%     -12.2%      89.04 =C2=B1  2%  aim7.time.elapsed_t=
ime.max
   1981819 =C2=B1  0%     -93.0%     138430 =C2=B1  3%  aim7.time.involunta=
ry_context_switches
    278.03 =C2=B1  0%      -6.5%     259.97 =C2=B1  2%  aim7.time.system_ti=
me
     54936 =C2=B1  1%     -19.6%      44147 =C2=B1  2%  aim7.time.voluntary=
_context_switches
    101.42 =C2=B1  0%     -12.2%      89.04 =C2=B1  2%  time.elapsed_time
    101.42 =C2=B1  0%     -12.2%      89.04 =C2=B1  2%  time.elapsed_time.m=
ax
   1981819 =C2=B1  0%     -93.0%     138430 =C2=B1  3%  time.involuntary_co=
ntext_switches
     54936 =C2=B1  1%     -19.6%      44147 =C2=B1  2%  time.voluntary_cont=
ext_switches

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/nr_=
threads/disk/fs/filesize/test_size/sync_method/nr_directories/nr_files_per_=
directory:
  lkp-sb02/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performa=
nce/1x/32t/1HDD/btrfs/9B/400M/fsyncBeforeClose/16d/256fpd

commit: =

  cad8c9e5d6a97898d37b1a8e5cdf838d79ba6e50
  62c79204783e188291d880f23d49c02d8c8f498b

cad8c9e5d6a97898 62c79204783e188291d880f23d =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   2554844 =C2=B1  1%     -13.1%    2221395 =C2=B1  1%  fsmark.app_overhead
    223789 =C2=B1  0%     -57.2%      95777 =C2=B1  6%  fsmark.time.involun=
tary_context_switches
     32.50 =C2=B1  1%      +5.4%      34.25 =C2=B1  1%  fsmark.time.percent=
_of_cpu_this_job_got
   2118350 =C2=B1  0%      +5.2%    2229178 =C2=B1  0%  fsmark.time.volunta=
ry_context_switches
    223789 =C2=B1  0%     -57.2%      95777 =C2=B1  6%  time.involuntary_co=
ntext_switches
     39831 =C2=B1  0%      -9.9%      35903 =C2=B1  1%  softirqs.SCHED
     59651 =C2=B1  1%      -8.7%      54478 =C2=B1  0%  softirqs.TIMER
     64594 =C2=B1  0%     -69.9%      19433 =C2=B1  0%  vmstat.system.cs
     25161 =C2=B1  0%     -94.2%       1465 =C2=B1  3%  vmstat.system.in
   4366124 =C2=B1  0%     -90.0%     434486 =C2=B1  4%  cpuidle.C1-SNB.usage
  17993557 =C2=B1  4%     +17.6%   21163962 =C2=B1  3%  cpuidle.C1E-SNB.time
     42154 =C2=B1  3%     +15.4%      48646 =C2=B1  6%  cpuidle.C1E-SNB.usa=
ge
   9261281 =C2=B1  5%     +28.4%   11895838 =C2=B1  4%  cpuidle.C3-SNB.time
      6639 =C2=B1  2%     +14.5%       7601 =C2=B1  3%  cpuidle.C3-SNB.usage
      9194 =C2=B1  2%     -97.7%     208.25 =C2=B1  6%  cpuidle.POLL.usage
     11.44 =C2=B1  0%     -20.0%       9.14 =C2=B1  0%  turbostat.%Busy
    333.25 =C2=B1  0%     -21.0%     263.25 =C2=B1  1%  turbostat.Avg_MHz
      1.32 =C2=B1  5%     +28.4%       1.70 =C2=B1  4%  turbostat.CPU%c3
     11.04 =C2=B1  1%     -13.0%       9.61 =C2=B1  1%  turbostat.CorWatt
      1.47 =C2=B1  3%     +26.7%       1.86 =C2=B1  4%  turbostat.Pkg%pc2
      1.19 =C2=B1  8%     +58.6%       1.89 =C2=B1  5%  turbostat.Pkg%pc3
     19.86 =C2=B1  1%     +35.2%      26.86 =C2=B1  1%  turbostat.Pkg%pc6
     14.61 =C2=B1  0%      -9.9%      13.16 =C2=B1  1%  turbostat.PkgWatt
   2143346 =C2=B1 57%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.b=
trfs_log_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_file=
.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
     30524 =C2=B1  3%     +20.3%      36728 =C2=B1  1%  latency_stats.hits.=
btrfs_tree_lock.[btrfs].btrfs_lock_root_node.[btrfs].btrfs_search_slot.[btr=
fs].btrfs_insert_empty_items.[btrfs].btrfs_insert_delayed_items.[btrfs].btr=
fs_commit_inode_delayed_items.[btrfs].btrfs_log_inode.[btrfs].btrfs_log_ino=
de_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_file.[btrfs].vfs=
_fsync_range.do_fsync
     18837 =C2=B1  4%     +56.0%      29390 =C2=B1  7%  latency_stats.hits.=
btrfs_tree_lock.[btrfs].btrfs_lock_root_node.[btrfs].btrfs_search_slot.[btr=
fs].btrfs_insert_empty_items.[btrfs].copy_items.[btrfs].btrfs_log_inode.[bt=
rfs].btrfs_log_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_syn=
c_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync
     12096 =C2=B1  6%     +46.5%      17718 =C2=B1  4%  latency_stats.hits.=
btrfs_tree_lock.[btrfs].btrfs_lock_root_node.[btrfs].btrfs_search_slot.[btr=
fs].drop_objectid_items.[btrfs].btrfs_log_inode.[btrfs].btrfs_log_inode_par=
ent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_file.[btrfs].vfs_fsync=
_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
     62486 =C2=B1  1%     +19.6%      74731 =C2=B1  4%  latency_stats.hits.=
btrfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search=
_slot.[btrfs].btrfs_insert_empty_items.[btrfs].copy_items.[btrfs].btrfs_log=
_inode.[btrfs].btrfs_log_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs]=
.btrfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync
     52038 =C2=B1  2%     +16.7%      60742 =C2=B1  3%  latency_stats.hits.=
btrfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search=
_slot.[btrfs].drop_objectid_items.[btrfs].btrfs_log_inode.[btrfs].btrfs_log=
_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_file.[btrfs]=
.vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
   3558104 =C2=B1 57%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.b=
trfs_log_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_file=
.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
 4.111e+08 =C2=B1 57%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_log_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_file=
.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
   1403516 =C2=B1  2%     +31.1%    1840040 =C2=B1  2%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_lock_root_node.[btrfs].btrfs_search_slot.[btrf=
s].btrfs_insert_empty_items.[btrfs].btrfs_insert_delayed_items.[btrfs].btrf=
s_commit_inode_delayed_items.[btrfs].btrfs_log_inode.[btrfs].btrfs_log_inod=
e_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_file.[btrfs].vfs_=
fsync_range.do_fsync
   3349730 =C2=B1  2%     +19.6%    4005849 =C2=B1  2%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_lock_root_node.[btrfs].btrfs_search_slot.[btrf=
s].btrfs_insert_empty_items.[btrfs].btrfs_new_inode.[btrfs].btrfs_create.[b=
trfs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCAL=
L_64_fastpath
    178060 =C2=B1  6%     +74.3%     310377 =C2=B1 11%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_lock_root_node.[btrfs].btrfs_search_slot.[btrf=
s].btrfs_insert_empty_items.[btrfs].copy_items.[btrfs].btrfs_log_inode.[btr=
fs].btrfs_log_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync=
_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync
   1322666 =C2=B1  4%     +27.8%    1690982 =C2=B1  1%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_lock_root_node.[btrfs].btrfs_search_slot.[btrf=
s].btrfs_insert_empty_items.[btrfs].insert_with_overflow.[btrfs].btrfs_inse=
rt_dir_item.[btrfs].btrfs_add_link.[btrfs].btrfs_create.[btrfs].vfs_create.=
path_openat.do_filp_open.do_sys_open
     42794 =C2=B1  5%     +63.1%      69810 =C2=B1 11%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_lock_root_node.[btrfs].btrfs_search_slot.[btrf=
s].btrfs_truncate_inode_items.[btrfs].btrfs_log_inode.[btrfs].btrfs_log_ino=
de_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_file.[btrfs].vfs=
_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
    122546 =C2=B1  7%     +60.4%     196523 =C2=B1  7%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_lock_root_node.[btrfs].btrfs_search_slot.[btrf=
s].drop_objectid_items.[btrfs].btrfs_log_inode.[btrfs].btrfs_log_inode_pare=
nt.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_file.[btrfs].vfs_fsync_=
range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
     24192 =C2=B1  3%     +29.8%      31401 =C2=B1  6%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_search_slot.[btrfs].btrfs_insert_empty_items.[=
btrfs].copy_items.[btrfs].btrfs_log_inode.[btrfs].btrfs_log_inode_parent.[b=
trfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_file.[btrfs].vfs_fsync_range=
.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
    697815 =C2=B1  1%     +11.1%     775306 =C2=B1  2%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_search_slot.[btrfs].btrfs_lookup_inode.[btrfs]=
.__btrfs_update_delayed_inode.[btrfs].btrfs_commit_inode_delayed_items.[btr=
fs].btrfs_log_inode.[btrfs].btrfs_log_inode_parent.[btrfs].btrfs_log_dentry=
_safe.[btrfs].btrfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync
    566092 =C2=B1  2%     +29.3%     732008 =C2=B1  7%  latency_stats.sum.b=
trfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search_=
slot.[btrfs].btrfs_insert_empty_items.[btrfs].copy_items.[btrfs].btrfs_log_=
inode.[btrfs].btrfs_log_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].=
btrfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync
    283356 =C2=B1  4%     +33.1%     377256 =C2=B1  7%  latency_stats.sum.b=
trfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search_=
slot.[btrfs].btrfs_truncate_inode_items.[btrfs].btrfs_log_inode.[btrfs].btr=
fs_log_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_file.[=
btrfs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
    525841 =C2=B1  2%     +24.2%     653227 =C2=B1  4%  latency_stats.sum.b=
trfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search_=
slot.[btrfs].drop_objectid_items.[btrfs].btrfs_log_inode.[btrfs].btrfs_log_=
inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_file.[btrfs].=
vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
    759116 =C2=B1  2%      -9.4%     687617 =C2=B1  1%  latency_stats.sum.b=
trfs_tree_read_lock.[btrfs].btrfs_search_slot.[btrfs].btrfs_lookup_dir_item=
.[btrfs].btrfs_lookup_dentry.[btrfs].btrfs_lookup.[btrfs].lookup_real.path_=
openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
     12244 =C2=B1  8%     -11.0%      10892 =C2=B1  3%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
      8078 =C2=B1  6%     +20.1%       9700 =C2=B1  5%  sched_debug.cfs_rq[=
0]:/.exec_clock
     12997 =C2=B1  8%     +25.1%      16258 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.min_vruntime
    269.00 =C2=B1  8%     -11.3%     238.50 =C2=B1  3%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
    553.11 =C2=B1128%    -403.8%      -1680 =C2=B1-72%  sched_debug.cfs_rq[=
2]:/.spread0
     28.75 =C2=B1 35%     -43.5%      16.25 =C2=B1 42%  sched_debug.cfs_rq[=
3]:/.nr_spread_over
     42568 =C2=B1 29%     -52.2%      20355 =C2=B1  4%  sched_debug.cpu#0.n=
r_load_updates
   4438150 =C2=B1 51%     -92.6%     328982 =C2=B1  4%  sched_debug.cpu#0.n=
r_switches
   4438484 =C2=B1 51%     -92.6%     329332 =C2=B1  4%  sched_debug.cpu#0.s=
ched_count
   2060550 =C2=B1 53%     -96.5%      72130 =C2=B1  7%  sched_debug.cpu#0.s=
ched_goidle
   2323810 =C2=B1 48%     -87.5%     290944 =C2=B1  5%  sched_debug.cpu#0.t=
twu_count
   2136144 =C2=B1 53%     -97.7%      48220 =C2=B1  2%  sched_debug.cpu#0.t=
twu_local
   1705455 =C2=B1133%     -80.1%     339746 =C2=B1  5%  sched_debug.cpu#1.n=
r_switches
   1705520 =C2=B1133%     -80.1%     339819 =C2=B1  5%  sched_debug.cpu#1.s=
ched_count
    739354 =C2=B1148%     -89.5%      77619 =C2=B1 11%  sched_debug.cpu#1.s=
ched_goidle
    926939 =C2=B1122%     -74.2%     238908 =C2=B1  6%  sched_debug.cpu#1.t=
twu_count
    742260 =C2=B1155%     -95.8%      31432 =C2=B1  1%  sched_debug.cpu#1.t=
twu_local
    968.25 =C2=B1 11%     -89.3%     104.00 =C2=B1102%  sched_debug.cpu#2.n=
r_uninterruptible
     63733 =C2=B1  9%     +21.4%      77348 =C2=B1 12%  sched_debug.cpu#2.s=
ched_goidle
     33525 =C2=B1  3%     -13.7%      28932 =C2=B1  1%  sched_debug.cpu#2.t=
twu_local
      1264 =C2=B1 17%    -101.5%     -18.50 =C2=B1-378%  sched_debug.cpu#3.=
nr_uninterruptible

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/nr_=
threads/disk/fs/filesize/test_size/sync_method/nr_directories/nr_files_per_=
directory:
  nhm4/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/=
1x/32t/1HDD/btrfs/9B/400M/fsyncBeforeClose/16d/256fpd

commit: =

  cad8c9e5d6a97898d37b1a8e5cdf838d79ba6e50
  62c79204783e188291d880f23d49c02d8c8f498b

cad8c9e5d6a97898 62c79204783e188291d880f23d =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   3294133 =C2=B1  2%      -6.2%    3088824 =C2=B1  2%  fsmark.app_overhead
    463365 =C2=B1  1%     -51.7%     223905 =C2=B1  7%  fsmark.time.involun=
tary_context_switches
    140.50 =C2=B1  1%      +8.2%     152.00 =C2=B1  1%  fsmark.time.percent=
_of_cpu_this_job_got
    213.09 =C2=B1  1%      +7.2%     228.37 =C2=B1  1%  fsmark.time.system_=
time
   4278018 =C2=B1  1%      +3.6%    4432123 =C2=B1  1%  fsmark.time.volunta=
ry_context_switches
    463365 =C2=B1  1%     -51.7%     223905 =C2=B1  7%  time.involuntary_co=
ntext_switches
      7.75 =C2=B1  5%     +18.4%       9.17 =C2=B1  0%  turbostat.CPU%c6
   5214507 =C2=B1  0%     -70.1%    1561193 =C2=B1  2%  cpuidle.C1-NHM.usage
     23195 =C2=B1  5%     -97.2%     641.50 =C2=B1  5%  cpuidle.POLL.usage
     96711 =C2=B1  1%     -51.9%      46555 =C2=B1  0%  vmstat.system.cs
     30013 =C2=B1  1%     -87.8%       3649 =C2=B1  3%  vmstat.system.in
      5154 =C2=B1  4%     -10.8%       4599 =C2=B1  3%  slabinfo.btrfs_exte=
nt_buffer.active_objs
      5154 =C2=B1  4%     -10.8%       4599 =C2=B1  3%  slabinfo.btrfs_exte=
nt_buffer.num_objs
      1674 =C2=B1  7%     -13.2%       1453 =C2=B1  5%  slabinfo.buffer_hea=
d.active_objs
      1680 =C2=B1  7%     -13.1%       1459 =C2=B1  5%  slabinfo.buffer_hea=
d.num_objs
   1145192 =C2=B1 70%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.b=
trfs_log_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_file=
.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
    137982 =C2=B1  2%     +73.7%     239720 =C2=B1 75%  latency_stats.hits.=
btrfs_tree_lock.[btrfs].btrfs_search_slot.[btrfs].btrfs_insert_empty_items.=
[btrfs].insert_with_overflow.[btrfs].btrfs_insert_dir_item.[btrfs].btrfs_ad=
d_link.[btrfs].btrfs_create.[btrfs].vfs_create.path_openat.do_filp_open.do_=
sys_open.SyS_open
   1540569 =C2=B1 70%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.b=
trfs_log_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_file=
.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
 1.741e+08 =C2=B1 70%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_log_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_file=
.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
   2427124 =C2=B1  2%     +60.9%    3906177 =C2=B1 78%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_search_slot.[btrfs].btrfs_insert_empty_items.[=
btrfs].insert_with_overflow.[btrfs].btrfs_insert_dir_item.[btrfs].btrfs_add=
_link.[btrfs].btrfs_create.[btrfs].vfs_create.path_openat.do_filp_open.do_s=
ys_open.SyS_open
     47047 =C2=B1  9%     +15.6%      54373 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     23933 =C2=B1 18%     +24.7%      29834 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
    788.25 =C2=B1 74%    +312.2%       3249 =C2=B1 37%  sched_debug.cfs_rq[=
1]:/.blocked_load_avg
   -297.49 =C2=B1-1471%    +989.4%      -3240 =C2=B1-11%  sched_debug.cfs_r=
q[1]:/.spread0
     23934 =C2=B1 18%     +24.7%      29840 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
    815.00 =C2=B1 73%    +303.0%       3284 =C2=B1 37%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
     42646 =C2=B1  8%     +20.4%      51331 =C2=B1  2%  sched_debug.cfs_rq[=
2]:/.min_vruntime
     23848 =C2=B1 17%     +23.9%      29555 =C2=B1  4%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
      4349 =C2=B1 24%     -41.6%       2541 =C2=B1 40%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
    119.25 =C2=B1 42%     -86.6%      16.00 =C2=B1141%  sched_debug.cfs_rq[=
3]:/.load
    133.50 =C2=B1 32%     -93.0%       9.33 =C2=B1141%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
     23820 =C2=B1 17%     +23.6%      29446 =C2=B1  3%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
      4486 =C2=B1 24%     -41.7%       2617 =C2=B1 42%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
     23822 =C2=B1 17%     +23.5%      29431 =C2=B1  3%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
     43836 =C2=B1  2%     +10.4%      48383 =C2=B1  2%  sched_debug.cfs_rq[=
5]:/.min_vruntime
     23750 =C2=B1 17%     +23.9%      29419 =C2=B1  3%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
     41692 =C2=B1  4%     +15.9%      48332 =C2=B1  3%  sched_debug.cfs_rq[=
6]:/.min_vruntime
     23751 =C2=B1 17%     +23.8%      29398 =C2=B1  3%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
     42923 =C2=B1  6%     +13.2%      48585 =C2=B1  3%  sched_debug.cfs_rq[=
7]:/.min_vruntime
     23749 =C2=B1 17%     +23.7%      29373 =C2=B1  3%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
    253.00 =C2=B1 69%    -180.0%    -202.50 =C2=B1-55%  sched_debug.cpu#1.n=
r_uninterruptible
    150.00 =C2=B1 43%     -81.6%      27.67 =C2=B1141%  sched_debug.cpu#3.c=
pu_load[0]
     88.50 =C2=B1 32%     -80.8%      17.00 =C2=B1136%  sched_debug.cpu#3.c=
pu_load[1]
     59.50 =C2=B1 30%     -70.2%      17.75 =C2=B1 92%  sched_debug.cpu#3.c=
pu_load[2]
     46.50 =C2=B1 34%     -53.2%      21.75 =C2=B1 55%  sched_debug.cpu#3.c=
pu_load[3]
      1208 =C2=B1 19%     -91.8%      99.33 =C2=B1141%  sched_debug.cpu#3.c=
urr->pid
    127.50 =C2=B1 49%     -87.5%      16.00 =C2=B1141%  sched_debug.cpu#3.l=
oad
      1447 =C2=B1 34%     -50.6%     715.00 =C2=B1 21%  sched_debug.cpu#4.n=
r_uninterruptible
      1029 =C2=B1 18%     -38.7%     631.00 =C2=B1 10%  sched_debug.cpu#5.n=
r_uninterruptible
   1244821 =C2=B1 70%     -70.6%     366365 =C2=B1  3%  sched_debug.cpu#6.n=
r_switches
      1136 =C2=B1 14%     -60.6%     447.75 =C2=B1 15%  sched_debug.cpu#6.n=
r_uninterruptible
   1244958 =C2=B1 70%     -70.6%     366498 =C2=B1  3%  sched_debug.cpu#6.s=
ched_count
    845.25 =C2=B1 17%     -30.1%     591.00 =C2=B1  7%  sched_debug.cpu#7.n=
r_uninterruptible

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/nr_=
threads/disk/fs/filesize/test_size/sync_method/nr_directories/nr_files_per_=
directory:
  nhm4/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/=
1x/32t/1HDD/f2fs/16MB/60G/fsyncBeforeClose/16d/256fpd

commit: =

  cad8c9e5d6a97898d37b1a8e5cdf838d79ba6e50
  62c79204783e188291d880f23d49c02d8c8f498b

cad8c9e5d6a97898 62c79204783e188291d880f23d =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     98844 =C2=B1  2%     -75.2%      24496 =C2=B1  1%  fsmark.time.involun=
tary_context_switches
     98844 =C2=B1  2%     -75.2%      24496 =C2=B1  1%  time.involuntary_co=
ntext_switches
     22613 =C2=B1  0%     -78.7%       4810 =C2=B1  0%  vmstat.system.cs
      9686 =C2=B1  0%     -93.5%     631.00 =C2=B1  2%  vmstat.system.in
 1.703e+08 =C2=B1  3%     -21.2%  1.342e+08 =C2=B1  5%  cpuidle.C1-NHM.time
   4972587 =C2=B1  0%     -88.7%     560540 =C2=B1  2%  cpuidle.C1-NHM.usage
      2092 =C2=B1  5%     -91.8%     171.75 =C2=B1  6%  cpuidle.POLL.usage
      3.44 =C2=B1  0%     -11.9%       3.04 =C2=B1  0%  turbostat.%Busy
    112.00 =C2=B1  0%     -12.9%      97.50 =C2=B1  0%  turbostat.Avg_MHz
     12.01 =C2=B1  1%     -15.8%      10.12 =C2=B1  3%  turbostat.CPU%c1
     42309 =C2=B1125%     -92.6%       3129 =C2=B1 72%  latency_stats.avg.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_write_be=
gin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_file_wri=
te_iter.f2fs_file_write_iter.[f2fs].__vfs_write.vfs_write
    153873 =C2=B1159%     -90.8%      14192 =C2=B1 51%  latency_stats.max.a=
lloc_nid.[f2fs].f2fs_new_inode.[f2fs].f2fs_create.[f2fs].vfs_create.path_op=
enat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
   1458401 =C2=B1133%     -69.6%     444016 =C2=B1 59%  latency_stats.sum.a=
lloc_nid.[f2fs].f2fs_new_inode.[f2fs].f2fs_create.[f2fs].vfs_create.path_op=
enat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
     20021 =C2=B1 29%   +6098.0%    1240911 =C2=B1137%  latency_stats.sum.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].__f2fs_add_link.[f2fs].f2fs_create.[f2fs].vfs_create.path_openat=
.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
     13943 =C2=B1132%     -53.5%       6479 =C2=B1100%  latency_stats.sum.w=
ait_on_page_bit.find_data_page.[f2fs].f2fs_find_entry.[f2fs].f2fs_lookup.[f=
2fs].lookup_real.path_openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCAL=
L_64_fastpath
      4129 =C2=B1 27%     -34.1%       2721 =C2=B1 21%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
     89.00 =C2=B1 27%     -34.0%      58.75 =C2=B1 22%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
     30.50 =C2=B1 36%     -59.0%      12.50 =C2=B1 74%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
      3952 =C2=B1 34%     -41.6%       2306 =C2=B1 39%  sched_debug.cfs_rq[=
6]:/.avg->runnable_avg_sum
     85.25 =C2=B1 34%     -41.9%      49.50 =C2=B1 40%  sched_debug.cfs_rq[=
6]:/.tg_runnable_contrib
      3552 =C2=B1 36%     -44.5%       1971 =C2=B1 23%  sched_debug.cfs_rq[=
7]:/.avg->runnable_avg_sum
    207.00 =C2=B1 47%     -72.9%      56.00 =C2=B1 93%  sched_debug.cfs_rq[=
7]:/.load
     76.50 =C2=B1 36%     -45.1%      42.00 =C2=B1 23%  sched_debug.cfs_rq[=
7]:/.tg_runnable_contrib
      3.67 =C2=B1 89%    +445.5%      20.00 =C2=B1 23%  sched_debug.cpu#0.c=
pu_load[0]
      4.75 =C2=B1102%    +163.2%      12.50 =C2=B1  6%  sched_debug.cpu#0.c=
pu_load[1]
     16.50 =C2=B1 53%     -78.8%       3.50 =C2=B1140%  sched_debug.cpu#1.c=
pu_load[1]
     12.25 =C2=B1 49%     -77.6%       2.75 =C2=B1 39%  sched_debug.cpu#1.c=
pu_load[4]
     33933 =C2=B1 41%     -54.9%      15287 =C2=B1  1%  sched_debug.cpu#2.n=
r_load_updates
   3238629 =C2=B1 74%     -96.6%     108909 =C2=B1 12%  sched_debug.cpu#2.n=
r_switches
   3238752 =C2=B1 74%     -96.6%     109056 =C2=B1 12%  sched_debug.cpu#2.s=
ched_count
   1570598 =C2=B1 75%     -97.8%      35193 =C2=B1 18%  sched_debug.cpu#2.s=
ched_goidle
   1582367 =C2=B1 76%     -98.6%      21962 =C2=B1  2%  sched_debug.cpu#2.t=
twu_local
   3380681 =C2=B1 73%     -96.1%     132270 =C2=B1 13%  sched_debug.cpu#6.n=
r_switches
   3380800 =C2=B1 73%     -96.1%     132424 =C2=B1 13%  sched_debug.cpu#6.s=
ched_count
   1648415 =C2=B1 74%     -97.0%      50035 =C2=B1 17%  sched_debug.cpu#6.s=
ched_goidle
    203.25 =C2=B1 47%     -72.4%      56.00 =C2=B1 93%  sched_debug.cpu#7.l=
oad

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/nr_=
threads/disk/fs/filesize/test_size/sync_method/nr_directories/nr_files_per_=
directory:
  nhm4/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/=
1x/32t/1HDD/f2fs/5K/400M/fsyncBeforeClose/16d/256fpd

commit: =

  cad8c9e5d6a97898d37b1a8e5cdf838d79ba6e50
  62c79204783e188291d880f23d49c02d8c8f498b

cad8c9e5d6a97898 62c79204783e188291d880f23d =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     35663 =C2=B1  8%     -44.4%      19828 =C2=B1  0%  fsmark.time.involun=
tary_context_switches
     13.00 =C2=B1  0%      +7.7%      14.00 =C2=B1  0%  fsmark.time.percent=
_of_cpu_this_job_got
    645071 =C2=B1  0%      +1.9%     657186 =C2=B1  0%  fsmark.time.volunta=
ry_context_switches
     35663 =C2=B1  8%     -44.4%      19828 =C2=B1  0%  time.involuntary_co=
ntext_switches
     69916 =C2=B1  0%     -83.1%      11789 =C2=B1  0%  vmstat.system.cs
     30442 =C2=B1  0%     -96.3%       1137 =C2=B1  1%  vmstat.system.in
      3.49 =C2=B1  0%     -37.3%       2.19 =C2=B1  0%  turbostat.%Busy
    110.50 =C2=B1  1%     -42.8%      63.25 =C2=B1  0%  turbostat.Avg_MHz
     41.09 =C2=B1  1%     -11.4%      36.40 =C2=B1  0%  turbostat.CPU%c1
      7.23 =C2=B1  4%     +22.1%       8.83 =C2=B1  5%  turbostat.CPU%c6
     20352 =C2=B1 83%     -59.3%       8281 =C2=B1 49%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_mkdir.[f2fs].vfs_mkdir.SyS_mkdir.entry_SYSC=
ALL_64_fastpath
   6985436 =C2=B1  1%     +13.7%    7940904 =C2=B1  3%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic_fil=
e_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs].__vfs_writ=
e.vfs_write.SyS_write
   3675763 =C2=B1  1%     +12.9%    4149821 =C2=B1  4%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_wri=
te_begin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_fil=
e_write_iter.f2fs_file_write_iter.[f2fs].__vfs_write
   5179210 =C2=B1  1%     +13.6%    5882087 =C2=B1  2%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].get_new_=
data_page.[f2fs].__f2fs_add_link.[f2fs].f2fs_create.[f2fs].vfs_create.path_=
openat.do_filp_open
    412246 =C2=B1  0%      +8.4%     446769 =C2=B1  2%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].write_data_page.[f2fs].do_w=
rite_data_page.[f2fs].f2fs_write_data_page.[f2fs].__f2fs_writepage.[f2fs].w=
rite_cache_pages.f2fs_write_data_pages.[f2fs].do_writepages.__filemap_fdata=
write_range.filemap_write_and_wait_range.f2fs_sync_file.[f2fs]
 2.715e+08 =C2=B1  2%     -11.1%  2.414e+08 =C2=B1  1%  cpuidle.C1-NHM.time
   4779213 =C2=B1  0%     -93.2%     324049 =C2=B1  2%  cpuidle.C1-NHM.usage
 2.285e+08 =C2=B1  2%     +13.2%  2.587e+08 =C2=B1  2%  cpuidle.C6-NHM.time
    105567 =C2=B1  1%     +13.5%     119864 =C2=B1  2%  cpuidle.C6-NHM.usage
     31639 =C2=B1 11%     -87.1%       4072 =C2=B1 57%  cpuidle.POLL.time
      8304 =C2=B1 10%     -98.8%     101.00 =C2=B1  7%  cpuidle.POLL.usage
     -1817 =C2=B1 -4%     +37.1%      -2491 =C2=B1-25%  sched_debug.cfs_rq[=
3]:/.spread0
      1313 =C2=B1  3%     +12.7%       1480 =C2=B1  3%  sched_debug.cfs_rq[=
5]:/.exec_clock
     -1878 =C2=B1 -5%     +16.6%      -2190 =C2=B1 -1%  sched_debug.cpu#0.n=
r_uninterruptible
    375233 =C2=B1118%     -90.3%      36371 =C2=B1  4%  sched_debug.cpu#3.t=
twu_count
    503266 =C2=B1 30%     +63.0%     820371 =C2=B1  8%  sched_debug.cpu#5.a=
vg_idle
     15.50 =C2=B1 29%     -59.7%       6.25 =C2=B1 70%  sched_debug.cpu#5.c=
pu_load[3]
     13.75 =C2=B1 18%     -47.3%       7.25 =C2=B1 44%  sched_debug.cpu#5.c=
pu_load[4]
    743.00 =C2=B1  7%     -18.3%     607.25 =C2=B1  5%  sched_debug.cpu#5.n=
r_uninterruptible
    774.25 =C2=B1 15%     -21.1%     610.50 =C2=B1  6%  sched_debug.cpu#6.n=
r_uninterruptible
     23789 =C2=B1 58%     -59.0%       9764 =C2=B1  2%  sched_debug.cpu#7.n=
r_load_updates

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/nr_=
threads/disk/fs/filesize/test_size/sync_method/nr_directories/nr_files_per_=
directory:
  nhm4/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/=
1x/32t/1HDD/f2fs/8K/400M/fsyncBeforeClose/16d/256fpd

commit: =

  cad8c9e5d6a97898d37b1a8e5cdf838d79ba6e50
  62c79204783e188291d880f23d49c02d8c8f498b

cad8c9e5d6a97898 62c79204783e188291d880f23d =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     28399 =C2=B1 12%     -57.0%      12208 =C2=B1  1%  fsmark.time.involun=
tary_context_switches
     12.50 =C2=B1  4%     +12.0%      14.00 =C2=B1  0%  fsmark.time.percent=
_of_cpu_this_job_got
    400598 =C2=B1  0%      +1.9%     408272 =C2=B1  0%  fsmark.time.volunta=
ry_context_switches
    104101 =C2=B1  0%     -88.9%      11556 =C2=B1  0%  vmstat.system.cs
     47821 =C2=B1  0%     -97.6%       1125 =C2=B1  0%  vmstat.system.in
     27507 =C2=B1  3%      -7.3%      25490 =C2=B1  3%  meminfo.Active(anon)
     27135 =C2=B1  3%      -7.4%      25120 =C2=B1  3%  meminfo.AnonPages
     13576 =C2=B1  0%     -11.3%      12048 =C2=B1  0%  meminfo.Mapped
      6878 =C2=B1  3%      -7.4%       6370 =C2=B1  3%  proc-vmstat.nr_acti=
ve_anon
      6796 =C2=B1  3%      -7.5%       6288 =C2=B1  3%  proc-vmstat.nr_anon=
_pages
      3392 =C2=B1  0%     -11.2%       3011 =C2=B1  0%  proc-vmstat.nr_mapp=
ed
     19880 =C2=B1  6%     -17.3%      16446 =C2=B1  4%  softirqs.RCU
     17934 =C2=B1  2%     -16.1%      15052 =C2=B1  4%  softirqs.SCHED
     29061 =C2=B1  3%     -13.6%      25095 =C2=B1  6%  softirqs.TIMER
     28399 =C2=B1 12%     -57.0%      12208 =C2=B1  1%  time.involuntary_co=
ntext_switches
     11.65 =C2=B1  1%     +12.1%      13.06 =C2=B1  0%  time.system_time
      0.49 =C2=B1  2%     +20.7%       0.60 =C2=B1  3%  time.user_time
 1.821e+08 =C2=B1  1%     -17.5%  1.502e+08 =C2=B1  2%  cpuidle.C1-NHM.time
   4650494 =C2=B1  0%     -95.7%     199638 =C2=B1  1%  cpuidle.C1-NHM.usage
 1.391e+08 =C2=B1  1%     +14.3%   1.59e+08 =C2=B1  1%  cpuidle.C6-NHM.time
     61904 =C2=B1  1%     +20.1%      74370 =C2=B1  1%  cpuidle.C6-NHM.usage
     34499 =C2=B1 12%     -90.5%       3270 =C2=B1113%  cpuidle.POLL.time
      8367 =C2=B1 16%     -99.2%      64.00 =C2=B1  9%  cpuidle.POLL.usage
      4.26 =C2=B1  0%     -48.8%       2.18 =C2=B1  0%  turbostat.%Busy
    139.00 =C2=B1  0%     -54.7%      63.00 =C2=B1  0%  turbostat.Avg_MHz
      3255 =C2=B1  0%     -11.1%       2892 =C2=B1  0%  turbostat.Bzy_MHz
     43.70 =C2=B1  1%     -16.5%      36.48 =C2=B1  1%  turbostat.CPU%c1
     44.77 =C2=B1  1%     +18.3%      52.95 =C2=B1  1%  turbostat.CPU%c3
      7.27 =C2=B1  2%     +15.3%       8.38 =C2=B1  3%  turbostat.CPU%c6
      8144 =C2=B1 20%    +112.7%      17320 =C2=B1 59%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_write_node_page.[f2fs].sync_node_pages.[f2f=
s].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_6=
4_fastpath
    161602 =C2=B1  5%     +27.7%     206366 =C2=B1  6%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].f2fs_write_node_page.[f2fs]=
.sync_node_pages.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_=
fsync.entry_SYSCALL_64_fastpath
   1263747 =C2=B1  3%     +19.4%    1508845 =C2=B1  4%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].new_node_page.[f2fs].new_in=
ode_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_crea=
te.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
    662165 =C2=B1  2%     +17.5%     777739 =C2=B1  2%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].f2fs_convert_inline_inode.[f2fs].f2fs_write_begin.[f2fs].ge=
neric_perform_write.__generic_file_write_iter.generic_file_write_iter.f2fs_=
file_write_iter.[f2fs].__vfs_write.vfs_write
   3956363 =C2=B1  1%     +22.3%    4840014 =C2=B1  1%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic_fil=
e_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs].__vfs_writ=
e.vfs_write.SyS_write
    436691 =C2=B1  1%     +15.4%     504042 =C2=B1  0%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].do_write_data_page.[f2fs].f2fs_wri=
te_data_page.[f2fs].__f2fs_writepage.[f2fs].write_cache_pages.f2fs_write_da=
ta_pages.[f2fs].do_writepages.__filemap_fdatawrite_range
   2101052 =C2=B1  1%     +20.7%    2536800 =C2=B1  2%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_wri=
te_begin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_fil=
e_write_iter.f2fs_file_write_iter.[f2fs].__vfs_write
   2931560 =C2=B1  2%     +21.5%    3562381 =C2=B1  2%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].get_new_=
data_page.[f2fs].__f2fs_add_link.[f2fs].f2fs_create.[f2fs].vfs_create.path_=
openat.do_filp_open
    882333 =C2=B1  1%     +18.1%    1042172 =C2=B1  1%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].get_read_data_page.[f2fs].find_dat=
a_page.[f2fs].f2fs_find_entry.[f2fs].f2fs_lookup.[f2fs].lookup_real.path_op=
enat.do_filp_open
     86763 =C2=B1  3%     +24.8%     108290 =C2=B1  2%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].update_inode_page.[f2fs].__f2fs_add_link.[f2fs].f2fs_create=
.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
   1293620 =C2=B1  2%     +18.0%    1526759 =C2=B1  2%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].update_inode_page.[f2fs].f2fs_write_end.[f2fs].generic_perf=
orm_write.__generic_file_write_iter.generic_file_write_iter.f2fs_file_write=
_iter.[f2fs].__vfs_write.vfs_write
    241754 =C2=B1  1%     +14.7%     277276 =C2=B1  3%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].write_data_page.[f2fs].do_w=
rite_data_page.[f2fs].f2fs_write_data_page.[f2fs].__f2fs_writepage.[f2fs].w=
rite_cache_pages.f2fs_write_data_pages.[f2fs].do_writepages.__filemap_fdata=
write_range.filemap_write_and_wait_range.f2fs_sync_file.[f2fs]
    285314 =C2=B1  4%     +31.5%     375080 =C2=B1  6%  latency_stats.sum.c=
all_rwsem_down_read_failed.need_dentry_mark.[f2fs].sync_node_pages.[f2fs].f=
2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fa=
stpath
    298289 =C2=B1  4%     +36.2%     406142 =C2=B1  7%  latency_stats.sum.c=
all_rwsem_down_read_failed.need_inode_block_update.[f2fs].f2fs_sync_file.[f=
2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
   1885703 =C2=B1  2%     +17.4%    2213119 =C2=B1  2%  latency_stats.sum.c=
all_rwsem_down_write_failed.get_node_info.[f2fs].new_node_page.[f2fs].new_i=
node_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_cre=
ate.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
    198811 =C2=B1  3%     +34.9%     268119 =C2=B1  3%  latency_stats.sum.c=
all_rwsem_down_write_failed.set_node_addr.[f2fs].f2fs_write_node_page.[f2fs=
].sync_node_pages.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS=
_fsync.entry_SYSCALL_64_fastpath
    910989 =C2=B1  2%     +17.8%    1072972 =C2=B1  2%  latency_stats.sum.c=
all_rwsem_down_write_failed.set_node_addr.[f2fs].new_node_page.[f2fs].new_i=
node_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_cre=
ate.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
    363528 =C2=B1  0%      +3.4%     375985 =C2=B1  0%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
      9590 =C2=B1  9%     -20.1%       7663 =C2=B1  5%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
    211.25 =C2=B1  9%     -21.1%     166.75 =C2=B1  6%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
      7864 =C2=B1 14%     -22.2%       6117 =C2=B1 10%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
    172.00 =C2=B1 13%     -22.7%     133.00 =C2=B1 11%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
      6243 =C2=B1 10%     +32.8%       8292 =C2=B1 12%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum
      1910 =C2=B1 14%     +19.0%       2273 =C2=B1  4%  sched_debug.cfs_rq[=
4]:/.min_vruntime
    136.50 =C2=B1 11%     +32.8%     181.25 =C2=B1 13%  sched_debug.cfs_rq[=
4]:/.tg_runnable_contrib
    726.92 =C2=B1  6%     +13.6%     825.51 =C2=B1  5%  sched_debug.cfs_rq[=
6]:/.exec_clock
      1844 =C2=B1  9%     +17.6%       2169 =C2=B1  6%  sched_debug.cfs_rq[=
6]:/.min_vruntime
      8.00 =C2=B1 45%    +209.4%      24.75 =C2=B1 11%  sched_debug.cpu#0.c=
pu_load[3]
      9.00 =C2=B1 22%    +141.7%      21.75 =C2=B1  8%  sched_debug.cpu#0.c=
pu_load[4]
   -701.75 =C2=B1-39%     +56.6%      -1098 =C2=B1 -2%  sched_debug.cpu#0.n=
r_uninterruptible
    546261 =C2=B1 90%     -85.3%      80139 =C2=B1  3%  sched_debug.cpu#0.t=
twu_count
    483716 =C2=B1101%     -95.6%      21310 =C2=B1  2%  sched_debug.cpu#0.t=
twu_local
    547901 =C2=B1166%     -96.5%      19272 =C2=B1 14%  sched_debug.cpu#3.t=
twu_count
     24.00 =C2=B1 59%     -64.6%       8.50 =C2=B1 55%  sched_debug.cpu#4.c=
pu_load[3]
     20.50 =C2=B1 32%     -57.3%       8.75 =C2=B1 38%  sched_debug.cpu#4.c=
pu_load[4]
     13541 =C2=B1 61%     -62.1%       5134 =C2=B1  3%  sched_debug.cpu#4.n=
r_load_updates
   1533535 =C2=B1 99%     -97.1%      43964 =C2=B1 29%  sched_debug.cpu#4.n=
r_switches
   1533560 =C2=B1 99%     -97.1%      43984 =C2=B1 29%  sched_debug.cpu#4.s=
ched_count
    760621 =C2=B1 99%     -97.5%      19182 =C2=B1 34%  sched_debug.cpu#4.s=
ched_goidle
    750180 =C2=B1102%     -99.8%       1305 =C2=B1  5%  sched_debug.cpu#4.t=
twu_local
    414.75 =C2=B1  6%     -23.3%     318.25 =C2=B1  5%  sched_debug.cpu#6.n=
r_uninterruptible
     20.25 =C2=B1 30%     -56.8%       8.75 =C2=B1 74%  sched_debug.cpu#7.c=
pu_load[4]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/nr_threads/ite=
rations/samples:
  lituya/ftq/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/1=
00%/20x/100000ss

commit: =

  cad8c9e5d6a97898d37b1a8e5cdf838d79ba6e50
  62c79204783e188291d880f23d49c02d8c8f498b

cad8c9e5d6a97898 62c79204783e188291d880f23d =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      7640 =C2=B1  1%      +5.5%       8056 =C2=B1  0%  ftq.counts
      0.17 =C2=B1 11%     -82.1%       0.03 =C2=B1  6%  ftq.stddev
   1806627 =C2=B1  4%     -98.6%      25037 =C2=B1 32%  ftq.time.involuntar=
y_context_switches
      1437 =C2=B1  2%      +5.6%       1518 =C2=B1  0%  ftq.time.percent_of=
_cpu_this_job_got
    546.95 =C2=B1  0%      +3.5%     566.01 =C2=B1  0%  ftq.time.user_time
     16653 =C2=B1  0%     -13.2%      14452 =C2=B1  0%  meminfo.Mapped
      4163 =C2=B1  0%     -13.3%       3611 =C2=B1  0%  proc-vmstat.nr_mapp=
ed
      9329 =C2=B1  4%     -17.0%       7746 =C2=B1  9%  softirqs.SCHED
      1.20 =C2=B1  2%     -52.7%       0.57 =C2=B1 12%  turbostat.CPU%c1
    330.20 =C2=B1  5%      -7.2%     306.54 =C2=B1  4%  uptime.idle
     96844 =C2=B1  0%     -97.0%       2925 =C2=B1  4%  vmstat.system.cs
     61693 =C2=B1  0%     -76.0%      14816 =C2=B1  1%  vmstat.system.in
   1806627 =C2=B1  4%     -98.6%      25037 =C2=B1 32%  time.involuntary_co=
ntext_switches
      2.15 =C2=B1  8%     -50.9%       1.06 =C2=B1  1%  time.system_time
    820.50 =C2=B1 33%     +45.4%       1192 =C2=B1  3%  time.voluntary_cont=
ext_switches
   1857689 =C2=B1 17%     -85.0%     278914 =C2=B1 73%  cpuidle.C1-HSW.time
    110169 =C2=B1 31%     -99.3%     786.25 =C2=B1  4%  cpuidle.C1-HSW.usage
    779.50 =C2=B1 69%     +78.4%       1390 =C2=B1  4%  cpuidle.C3-HSW.usage
      2663 =C2=B1 41%     -48.2%       1380 =C2=B1  1%  cpuidle.C6-HSW.usage
    193.50 =C2=B1 95%     -99.6%       0.75 =C2=B1173%  cpuidle.POLL.time
    125.00 =C2=B1 94%     -99.8%       0.25 =C2=B1173%  cpuidle.POLL.usage
      6.25 =C2=B1 17%     -36.0%       4.00 =C2=B1 17%  sched_debug.cfs_rq[=
0]:/.nr_spread_over
    118.31 =C2=B1 19%     +50.0%     177.51 =C2=B1 18%  sched_debug.cfs_rq[=
11]:/.exec_clock
      1410 =C2=B1 23%     -32.8%     948.03 =C2=B1 23%  sched_debug.cfs_rq[=
14]:/.min_vruntime
     16706 =C2=B1 38%     -72.2%       4641 =C2=B1 40%  sched_debug.cfs_rq[=
15]:/.avg->runnable_avg_sum
    367.50 =C2=B1 38%     -72.2%     102.00 =C2=B1 41%  sched_debug.cfs_rq[=
15]:/.tg_runnable_contrib
      6553 =C2=B1 29%     -34.8%       4269 =C2=B1 12%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
    143.25 =C2=B1 30%     -35.1%      93.00 =C2=B1 12%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
      1304 =C2=B1 17%     +43.7%       1873 =C2=B1 28%  sched_debug.cfs_rq[=
3]:/.min_vruntime
      3651 =C2=B1139%    +234.7%      12223 =C2=B1 54%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
      3651 =C2=B1139%    +240.9%      12449 =C2=B1 53%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
      1316 =C2=B1 70%    +500.7%       7907 =C2=B1 51%  sched_debug.cfs_rq[=
8]:/.blocked_load_avg
      1330 =C2=B1 71%    +494.4%       7907 =C2=B1 51%  sched_debug.cfs_rq[=
8]:/.tg_load_contrib
    111.43 =C2=B1  6%     -14.1%      95.77 =C2=B1  7%  sched_debug.cfs_rq[=
9]:/.exec_clock
    238565 =C2=B1 59%    +271.1%     885357 =C2=B1 15%  sched_debug.cpu#0.a=
vg_idle
      5.75 =C2=B1 85%    +152.2%      14.50 =C2=B1 55%  sched_debug.cpu#0.c=
pu_load[3]
      3.25 =C2=B1 95%   +1215.4%      42.75 =C2=B1 78%  sched_debug.cpu#1.c=
pu_load[1]
      5.25 =C2=B1 78%    -119.0%      -1.00 =C2=B1-300%  sched_debug.cpu#10=
.nr_uninterruptible
      2.50 =C2=B1 34%    +230.0%       8.25 =C2=B1 40%  sched_debug.cpu#12.=
nr_uninterruptible
    468.25 =C2=B1 12%     -21.3%     368.50 =C2=B1  8%  sched_debug.cpu#13.=
sched_goidle
      1.25 =C2=B1131%    -420.0%      -4.00 =C2=B1-20%  sched_debug.cpu#14.=
nr_uninterruptible
     73.25 =C2=B1  4%     +39.6%     102.25 =C2=B1 13%  sched_debug.cpu#14.=
ttwu_local
     -3.50 =C2=B1-76%    -228.6%       4.50 =C2=B1 57%  sched_debug.cpu#15.=
nr_uninterruptible
    319447 =C2=B1 52%    +169.7%     861647 =C2=B1 13%  sched_debug.cpu#2.a=
vg_idle
      3181 =C2=B1 38%     -65.7%       1090 =C2=B1 20%  sched_debug.cpu#4.n=
r_load_updates
    787.75 =C2=B1 15%     -23.5%     602.50 =C2=B1  6%  sched_debug.cpu#5.s=
ched_goidle
      4.25 =C2=B1 45%    +494.1%      25.25 =C2=B1 41%  sched_debug.cpu#8.c=
pu_load[3]
      9.00 =C2=B1 54%    +200.0%      27.00 =C2=B1 27%  sched_debug.cpu#8.c=
pu_load[4]
      2045 =C2=B1 34%     -41.3%       1201 =C2=B1 14%  sched_debug.cpu#8.n=
r_switches
      2048 =C2=B1 33%     -41.2%       1203 =C2=B1 14%  sched_debug.cpu#8.s=
ched_count
    789.00 =C2=B1 24%     -47.5%     414.25 =C2=B1 26%  sched_debug.cpu#8.s=
ched_goidle
     20.59 =C2=B1 92%     -74.0%       5.36 =C2=B1 12%  sched_debug.rt_rq[0=
]:/.rt_time

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/nr_threads/ite=
rations/samples:
  lituya/ftq/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/powersave/100=
%/20x/100000ss

commit: =

  cad8c9e5d6a97898d37b1a8e5cdf838d79ba6e50
  62c79204783e188291d880f23d49c02d8c8f498b

cad8c9e5d6a97898 62c79204783e188291d880f23d =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      7580 =C2=B1  0%      +6.1%       8044 =C2=B1  0%  ftq.counts
      0.18 =C2=B1  7%     -82.1%       0.03 =C2=B1  8%  ftq.stddev
   1761823 =C2=B1  3%     -98.3%      29477 =C2=B1 38%  ftq.time.involuntar=
y_context_switches
      1454 =C2=B1  1%      +4.3%       1517 =C2=B1  0%  ftq.time.percent_of=
_cpu_this_job_got
    547.59 =C2=B1  0%      +3.4%     566.04 =C2=B1  0%  ftq.time.user_time
    562.25 =C2=B1 23%     +96.8%       1106 =C2=B1  5%  ftq.time.voluntary_=
context_switches
     16809 =C2=B1  0%     -13.8%      14482 =C2=B1  0%  meminfo.Mapped
      4198 =C2=B1  0%     -13.7%       3623 =C2=B1  0%  proc-vmstat.nr_mapp=
ed
    484.00 =C2=B1  6%     +18.2%     572.00 =C2=B1  7%  slabinfo.blkdev_req=
uests.active_objs
    484.00 =C2=B1  6%     +18.2%     572.00 =C2=B1  7%  slabinfo.blkdev_req=
uests.num_objs
      1.17 =C2=B1  2%     -50.9%       0.57 =C2=B1  8%  turbostat.CPU%c1
      0.21 =C2=B1127%    +215.5%       0.66 =C2=B1 33%  turbostat.RAMWatt
     96716 =C2=B1  0%     -96.9%       2979 =C2=B1 10%  vmstat.system.cs
     61578 =C2=B1  0%     -75.7%      14933 =C2=B1  1%  vmstat.system.in
   1761823 =C2=B1  3%     -98.3%      29477 =C2=B1 38%  time.involuntary_co=
ntext_switches
      1.52 =C2=B1  5%     -28.3%       1.09 =C2=B1  2%  time.system_time
    562.25 =C2=B1 23%     +96.8%       1106 =C2=B1  5%  time.voluntary_cont=
ext_switches
   1633723 =C2=B1 55%     -89.4%     172951 =C2=B1  3%  cpuidle.C1-HSW.time
    124268 =C2=B1 20%     -99.4%     713.50 =C2=B1  8%  cpuidle.C1-HSW.usage
    104432 =C2=B1 22%    +110.9%     220296 =C2=B1 63%  cpuidle.C1E-HSW.time
    552.75 =C2=B1 33%     +33.6%     738.50 =C2=B1  3%  cpuidle.C1E-HSW.usa=
ge
     23.00 =C2=B1 43%    -100.0%       0.00 =C2=B1  0%  cpuidle.POLL.time
     11.25 =C2=B1 51%    -100.0%       0.00 =C2=B1  0%  cpuidle.POLL.usage
     49106 =C2=B1  3%     +32.3%      64986 =C2=B1  8%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
     47692 =C2=B1  6%     +35.4%      64593 =C2=B1  8%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
     47692 =C2=B1  6%     +35.4%      64593 =C2=B1  8%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
     47692 =C2=B1  6%     +35.4%      64593 =C2=B1  8%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
     47692 =C2=B1  6%     +35.4%      64593 =C2=B1  8%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
    860.75 =C2=B1116%    +570.6%       5772 =C2=B1 87%  sched_debug.cfs_rq[=
14]:/.blocked_load_avg
     47692 =C2=B1  6%     +35.4%      64593 =C2=B1  8%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
    860.75 =C2=B1116%    +617.8%       6178 =C2=B1 92%  sched_debug.cfs_rq[=
14]:/.tg_load_contrib
      2268 =C2=B1 20%     -42.9%       1296 =C2=B1 24%  sched_debug.cfs_rq[=
15]:/.min_vruntime
     47692 =C2=B1  6%     +35.4%      64593 =C2=B1  8%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
     48510 =C2=B1  5%     +34.0%      64986 =C2=B1  8%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
     48510 =C2=B1  5%     +33.9%      64934 =C2=B1  8%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
     48510 =C2=B1  5%     +33.9%      64934 =C2=B1  8%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
     48510 =C2=B1  5%     +33.9%      64934 =C2=B1  8%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
     48494 =C2=B1  5%     +33.9%      64916 =C2=B1  8%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
     48494 =C2=B1  5%     +33.9%      64916 =C2=B1  8%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
     48455 =C2=B1  5%     +33.9%      64905 =C2=B1  8%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
      0.50 =C2=B1100%    +300.0%       2.00 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.nr_spread_over
     48404 =C2=B1  5%     +34.1%      64905 =C2=B1  8%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
     47692 =C2=B1  6%     +35.5%      64637 =C2=B1  8%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
     12.00 =C2=B1 27%     -52.1%       5.75 =C2=B1 43%  sched_debug.cpu#1.n=
r_uninterruptible
    347.00 =C2=B1  7%     +42.0%     492.75 =C2=B1 20%  sched_debug.cpu#10.=
sched_goidle
    518.00 =C2=B1  8%     +24.0%     642.50 =C2=B1  6%  sched_debug.cpu#11.=
sched_goidle
      9.25 =C2=B1 62%    +278.4%      35.00 =C2=B1 67%  sched_debug.cpu#12.=
cpu_load[4]
      5.75 =C2=B1 74%    -100.0%       0.00 =C2=B1  0%  sched_debug.cpu#14.=
nr_uninterruptible
      1.00 =C2=B1 70%   +2800.0%      29.00 =C2=B1 88%  sched_debug.cpu#15.=
cpu_load[2]
      3.00 =C2=B1 91%    +608.3%      21.25 =C2=B1 62%  sched_debug.cpu#15.=
cpu_load[3]
      4.00 =C2=B1117%    +275.0%      15.00 =C2=B1 54%  sched_debug.cpu#15.=
cpu_load[4]
      3.00 =C2=B1131%     +91.7%       5.75 =C2=B1125%  sched_debug.cpu#2.n=
r_uninterruptible
      2443 =C2=B1 35%     -46.9%       1296 =C2=B1 14%  sched_debug.cpu#3.n=
r_load_updates
      6257 =C2=B1 21%     -47.1%       3309 =C2=B1 36%  sched_debug.cpu#3.n=
r_switches
      6262 =C2=B1 21%     -47.1%       3315 =C2=B1 36%  sched_debug.cpu#3.s=
ched_count
      2859 =C2=B1 24%     -54.1%       1313 =C2=B1 35%  sched_debug.cpu#3.s=
ched_goidle
      3022 =C2=B1 19%     -46.9%       1604 =C2=B1 19%  sched_debug.cpu#3.t=
twu_count
      1491 =C2=B1 55%     -78.3%     323.00 =C2=B1 69%  sched_debug.cpu#3.t=
twu_local
    994307 =C2=B1  0%     -27.9%     716731 =C2=B1 21%  sched_debug.cpu#6.a=
vg_idle

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/nr_threads/ite=
rations/samples:
  lituya/fwq/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/1=
00%/20x/100000ss

commit: =

  cad8c9e5d6a97898d37b1a8e5cdf838d79ba6e50
  62c79204783e188291d880f23d49c02d8c8f498b

cad8c9e5d6a97898 62c79204783e188291d880f23d =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      0.11 =C2=B1  3%     -43.2%       0.06 =C2=B1  1%  fwq.stddev
   3230702 =C2=B1  1%     -86.7%     430932 =C2=B1  3%  fwq.time.involuntar=
y_context_switches
    159977 =C2=B1 11%     -25.2%     119739 =C2=B1  0%  latency_stats.sum.d=
o_wait.SyS_wait4.entry_SYSCALL_64_fastpath
   3230702 =C2=B1  1%     -86.7%     430932 =C2=B1  3%  time.involuntary_co=
ntext_switches
      1.28 =C2=B1 35%     -32.7%       0.86 =C2=B1  2%  time.system_time
      0.21 =C2=B1 42%     -70.6%       0.06 =C2=B1 17%  turbostat.CPU%c1
      0.73 =C2=B1 23%     -31.1%       0.51 =C2=B1 15%  turbostat.CPU%c6
     16514 =C2=B1  0%     -79.4%       3404 =C2=B1  2%  vmstat.system.cs
     23255 =C2=B1  0%     -28.0%      16754 =C2=B1  0%  vmstat.system.in
   1081329 =C2=B1 53%     -93.7%      67884 =C2=B1 33%  cpuidle.C1-HSW.time
     45064 =C2=B1  0%     -99.4%     278.25 =C2=B1 22%  cpuidle.C1-HSW.usage
  64741983 =C2=B1  8%     -39.7%   39054828 =C2=B1 14%  cpuidle.C6-HSW.time
      2214 =C2=B1 19%     -45.3%       1211 =C2=B1 11%  cpuidle.C6-HSW.usage
      4.50 =C2=B1 74%    -100.0%       0.00 =C2=B1 -1%  cpuidle.POLL.time
      2.50 =C2=B1 60%    -100.0%       0.00 =C2=B1 -1%  cpuidle.POLL.usage
    152.75 =C2=B1127%    +449.4%     839.25 =C2=B1 60%  sched_debug.cfs_rq[=
10]:/.blocked_load_avg
    204.75 =C2=B1 94%    +339.8%     900.50 =C2=B1 56%  sched_debug.cfs_rq[=
10]:/.tg_load_contrib
    -73145 =C2=B1-135%    -141.7%      30484 =C2=B1 48%  sched_debug.cfs_rq=
[14]:/.spread0
     51.50 =C2=B1  0%     +14.1%      58.75 =C2=B1  9%  sched_debug.cpu#0.c=
pu_load[1]
     51.75 =C2=B1  1%     +13.0%      58.50 =C2=B1  7%  sched_debug.cpu#0.c=
pu_load[2]
     51.75 =C2=B1  1%     +11.1%      57.50 =C2=B1  6%  sched_debug.cpu#0.c=
pu_load[3]
     11.25 =C2=B1  9%     -64.4%       4.00 =C2=B1 63%  sched_debug.cpu#11.=
nr_uninterruptible
     -7.50 =C2=B1-35%    -153.3%       4.00 =C2=B1 93%  sched_debug.cpu#2.n=
r_uninterruptible
      1419 =C2=B1 26%    +119.7%       3117 =C2=B1 22%  sched_debug.cpu#3.s=
ched_goidle
    124974 =C2=B1 61%     -72.4%      34432 =C2=B1108%  sched_debug.cpu#5.n=
r_switches
      4.50 =C2=B1 71%    -177.8%      -3.50 =C2=B1-123%  sched_debug.cpu#5.=
nr_uninterruptible
    125045 =C2=B1 61%     -72.4%      34489 =C2=B1108%  sched_debug.cpu#5.s=
ched_count
     47153 =C2=B1 75%     -52.2%      22527 =C2=B1124%  sched_debug.cpu#5.t=
twu_count
     33719 =C2=B1 76%     -70.3%      10005 =C2=B1131%  sched_debug.cpu#5.t=
twu_local
     53.75 =C2=B1  4%     +18.1%      63.50 =C2=B1 18%  sched_debug.cpu#7.c=
pu_load[1]
      5925 =C2=B1 34%    +483.7%      34588 =C2=B1 82%  sched_debug.cpu#8.s=
ched_count
     56.25 =C2=B1  8%     -10.2%      50.50 =C2=B1  0%  sched_debug.cpu#9.c=
pu_load[1]
     58.75 =C2=B1 10%     -13.2%      51.00 =C2=B1  1%  sched_debug.cpu#9.c=
pu_load[2]
     61.50 =C2=B1 14%     -16.3%      51.50 =C2=B1  2%  sched_debug.cpu#9.c=
pu_load[3]
     63.00 =C2=B1 17%     -18.3%      51.50 =C2=B1  2%  sched_debug.cpu#9.c=
pu_load[4]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/nr_threads/ite=
rations/samples:
  lituya/fwq/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/powersave/100=
%/20x/100000ss

commit: =

  cad8c9e5d6a97898d37b1a8e5cdf838d79ba6e50
  62c79204783e188291d880f23d49c02d8c8f498b

cad8c9e5d6a97898 62c79204783e188291d880f23d =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      0.11 =C2=B1  2%     -41.0%       0.06 =C2=B1  1%  fwq.stddev
   3249189 =C2=B1  1%     -86.8%     428991 =C2=B1  8%  fwq.time.involuntar=
y_context_switches
      0.19 =C2=B1 24%     -58.1%       0.08 =C2=B1 10%  turbostat.CPU%c1
   3249189 =C2=B1  1%     -86.8%     428991 =C2=B1  8%  time.involuntary_co=
ntext_switches
      1.81 =C2=B1 12%     -48.6%       0.93 =C2=B1  2%  time.system_time
     16527 =C2=B1  1%     -79.2%       3430 =C2=B1  3%  vmstat.system.cs
     23258 =C2=B1  0%     -28.0%      16746 =C2=B1  0%  vmstat.system.in
     41773 =C2=B1  2%     -99.2%     318.75 =C2=B1 13%  cpuidle.C1-HSW.usage
  61756882 =C2=B1 15%     -30.4%   43002599 =C2=B1  8%  cpuidle.C6-HSW.time
      2117 =C2=B1  9%     -33.5%       1407 =C2=B1  3%  cpuidle.C6-HSW.usage
     66.00 =C2=B1 26%     -21.6%      51.75 =C2=B1  5%  sched_debug.cfs_rq[=
0]:/.load
      0.75 =C2=B1 57%    +633.3%       5.50 =C2=B1 58%  sched_debug.cfs_rq[=
13]:/.nr_spread_over
    181.50 =C2=B1139%    +229.6%     598.25 =C2=B1 44%  sched_debug.cfs_rq[=
15]:/.blocked_load_avg
    239.00 =C2=B1104%    +175.8%     659.25 =C2=B1 42%  sched_debug.cfs_rq[=
15]:/.tg_load_contrib
    893.00 =C2=B1  0%     +14.5%       1022 =C2=B1 12%  sched_debug.cfs_rq[=
1]:/.utilization_load_avg
    -66095 =C2=B1-174%    -144.5%      29384 =C2=B1 74%  sched_debug.cfs_rq=
[4]:/.spread0
    -48436 =C2=B1-144%    -146.3%      22425 =C2=B1 36%  sched_debug.cfs_rq=
[5]:/.spread0
     66.00 =C2=B1 26%     -21.6%      51.75 =C2=B1  5%  sched_debug.cpu#0.l=
oad
    807.00 =C2=B1  0%      +7.3%     866.00 =C2=B1  6%  sched_debug.cpu#11.=
curr->pid
      4.25 =C2=B1 76%     -84.3%       0.67 =C2=B1604%  sched_debug.cpu#14.=
nr_uninterruptible
    370327 =C2=B1158%     -95.9%      15153 =C2=B1 80%  sched_debug.cpu#15.=
nr_switches
    370400 =C2=B1158%     -95.9%      15239 =C2=B1 80%  sched_debug.cpu#15.=
sched_count
    186416 =C2=B1158%     -97.0%       5614 =C2=B1 81%  sched_debug.cpu#15.=
ttwu_count
     -4.00 =C2=B1-81%    -187.5%       3.50 =C2=B1 24%  sched_debug.cpu#5.n=
r_uninterruptible
      0.00 =C2=B1 71%  +10603.7%       0.19 =C2=B1 13%  sched_debug.rt_rq[2=
]:/.rt_time

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/runtime:
  wsm/ku-latency/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performan=
ce/300s

commit: =

  cad8c9e5d6a97898d37b1a8e5cdf838d79ba6e50
  62c79204783e188291d880f23d49c02d8c8f498b

cad8c9e5d6a97898 62c79204783e188291d880f23d =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      1207 =C2=B1  4%     -27.5%     876.00 =C2=B1 22%  proc-vmstat.pgactiv=
ate
     26029 =C2=B1  2%     -21.2%      20524 =C2=B1  2%  softirqs.SCHED
     12.52 =C2=B1  5%     -19.2%      10.12 =C2=B1  9%  turbostat.CPU%c1
     46.75 =C2=B1  2%      -7.0%      43.50 =C2=B1  3%  turbostat.CoreTmp
     31128 =C2=B1  0%     -92.1%       2449 =C2=B1  1%  vmstat.system.cs
     15692 =C2=B1  0%     -92.3%       1214 =C2=B1  0%  vmstat.system.in
   5760097 =C2=B1125%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
   5760097 =C2=B1125%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
   5760097 =C2=B1125%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
  55981055 =C2=B1  4%     -65.3%   19428998 =C2=B1 21%  cpuidle.C1-NHM.time
   4373782 =C2=B1  0%     -99.5%      22463 =C2=B1  9%  cpuidle.C1-NHM.usage
    312.50 =C2=B1 78%     -72.3%      86.50 =C2=B1 14%  cpuidle.C1E-NHM.usa=
ge
      2690 =C2=B1 28%     -37.2%       1689 =C2=B1 16%  cpuidle.C3-NHM.usage
      1071 =C2=B1 23%     -80.9%     204.25 =C2=B1 63%  cpuidle.POLL.usage
     97.00 =C2=B1 45%     -83.8%      15.67 =C2=B1 70%  sched_debug.cfs_rq[=
10]:/.runnable_load_avg
    425.75 =C2=B1 34%     -74.4%     109.00 =C2=B1 70%  sched_debug.cfs_rq[=
10]:/.utilization_load_avg
     -6567 =C2=B1-65%   -1590.9%      97909 =C2=B1167%  sched_debug.cfs_rq[=
11]:/.spread0
     85.25 =C2=B1 74%   +2038.1%       1822 =C2=B1 58%  sched_debug.cfs_rq[=
2]:/.blocked_load_avg
    217733 =C2=B1 95%     -57.1%      93407 =C2=B1164%  sched_debug.cfs_rq[=
2]:/.min_vruntime
    209.25 =C2=B1 66%    +813.3%       1911 =C2=B1 58%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
      2123 =C2=B1 49%     -68.8%     662.75 =C2=B1100%  sched_debug.cfs_rq[=
4]:/.blocked_load_avg
     86.00 =C2=B1 53%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.load
     58.50 =C2=B1 51%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.runnable_load_avg
      2197 =C2=B1 48%     -69.5%     671.25 =C2=B1 98%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
    300.25 =C2=B1 48%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.utilization_load_avg
      3463 =C2=B1 55%     -48.3%       1789 =C2=B1  4%  sched_debug.cfs_rq[=
6]:/.min_vruntime
   1227502 =C2=B1 99%     -98.3%      20386 =C2=B1 42%  sched_debug.cpu#0.t=
twu_count
     62332 =C2=B1 85%     -77.9%      13783 =C2=B1  3%  sched_debug.cpu#1.n=
r_load_updates
     14318 =C2=B1 18%     +37.4%      19675 =C2=B1 19%  sched_debug.cpu#1.t=
twu_count
      4361 =C2=B1 11%     -20.1%       3483 =C2=B1  7%  sched_debug.cpu#1.t=
twu_local
    146.25 =C2=B1 33%     -82.2%      26.00 =C2=B1 13%  sched_debug.cpu#10.=
cpu_load[0]
     79.00 =C2=B1 36%     -81.4%      14.67 =C2=B1 21%  sched_debug.cpu#10.=
cpu_load[1]
     44.00 =C2=B1 36%     -83.5%       7.25 =C2=B1 58%  sched_debug.cpu#10.=
cpu_load[2]
     25.50 =C2=B1 37%     -77.5%       5.75 =C2=B1 33%  sched_debug.cpu#10.=
cpu_load[3]
     15.00 =C2=B1 41%     -70.0%       4.50 =C2=B1 24%  sched_debug.cpu#10.=
cpu_load[4]
     89157 =C2=B1 69%     -47.0%      47258 =C2=B1126%  sched_debug.cpu#2.n=
r_load_updates
      9.50 =C2=B1 33%     -76.3%       2.25 =C2=B1148%  sched_debug.cpu#4.c=
pu_load[3]
      7.25 =C2=B1 36%     -82.8%       1.25 =C2=B1131%  sched_debug.cpu#4.c=
pu_load[4]
      1030 =C2=B1 36%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#4.c=
urr->pid
     86.00 =C2=B1 53%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#4.l=
oad
    850245 =C2=B1  5%     +11.7%     949380 =C2=B1  3%  sched_debug.cpu#5.a=
vg_idle
      3578 =C2=B1  8%     -48.9%       1830 =C2=B1 64%  sched_debug.cpu#5.t=
twu_local
    925565 =C2=B1  7%     -17.7%     761616 =C2=B1  6%  sched_debug.cpu#6.a=
vg_idle
    649243 =C2=B1 95%     -98.0%      12905 =C2=B1 31%  sched_debug.cpu#6.t=
twu_count
      2529 =C2=B1 49%     -63.9%     911.75 =C2=B1 83%  sched_debug.cpu#9.t=
twu_local

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/runtime/nr_thr=
eads/cluster/test:
  lkp-t410/netperf/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/perform=
ance/300s/200%/cs-localhost/TCP_SENDFILE

commit: =

  cad8c9e5d6a97898d37b1a8e5cdf838d79ba6e50
  62c79204783e188291d880f23d49c02d8c8f498b

cad8c9e5d6a97898 62c79204783e188291d880f23d =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      4404 =C2=B1  0%      +6.5%       4689 =C2=B1  0%  netperf.Throughput_=
Mbps
   1902815 =C2=B1  4%     -98.0%      38389 =C2=B1  9%  netperf.time.involu=
ntary_context_switches
    208.00 =C2=B1  0%      +2.3%     212.75 =C2=B1  0%  netperf.time.percen=
t_of_cpu_this_job_got
    610.08 =C2=B1  0%      +1.6%     619.92 =C2=B1  0%  netperf.time.system=
_time
    291566 =C2=B1  0%     +12.0%     326523 =C2=B1  0%  netperf.time.volunt=
ary_context_switches
      1.03 =C2=B1  4%     +10.4%       1.14 =C2=B1  3%  perf-profile.cpu-cy=
cles.rw_verify_area.do_splice_to.splice_direct_to_actor.do_splice_direct.do=
_sendfile
      2545 =C2=B1  2%     -17.3%       2103 =C2=B1  1%  proc-vmstat.pgactiv=
ate
      0.21 =C2=B1  3%     -95.2%       0.01 =C2=B1  0%  turbostat.CPU%c1
      0.22 =C2=B1  5%    +146.0%       0.54 =C2=B1  3%  turbostat.CPU%c6
     21522 =C2=B1  1%     -76.5%       5056 =C2=B1  0%  vmstat.system.cs
     11704 =C2=B1  1%     -62.7%       4363 =C2=B1  0%  vmstat.system.in
   1902815 =C2=B1  4%     -98.0%      38389 =C2=B1  9%  time.involuntary_co=
ntext_switches
     17.50 =C2=B1  0%     +19.8%      20.97 =C2=B1  0%  time.user_time
    291566 =C2=B1  0%     +12.0%     326523 =C2=B1  0%  time.voluntary_cont=
ext_switches
    291365 =C2=B1  0%     +12.0%     326363 =C2=B1  0%  latency_stats.hits.=
sk_stream_wait_memory.tcp_sendpage.inet_sendpage.kernel_sendpage.sock_sendp=
age.pipe_to_sendpage.__splice_from_pipe.splice_from_pipe.generic_splice_sen=
dpage.direct_splice_actor.splice_direct_to_actor.do_splice_direct
    975206 =C2=B1  4%     -61.5%     374990 =C2=B1  1%  latency_stats.hits.=
sk_wait_data.tcp_recvmsg.inet_recvmsg.sock_recvmsg.SYSC_recvfrom.SyS_recvfr=
om.entry_SYSCALL_64_fastpath
  52419094 =C2=B1  1%      +7.2%   56170711 =C2=B1  0%  latency_stats.sum.s=
k_stream_wait_memory.tcp_sendpage.inet_sendpage.kernel_sendpage.sock_sendpa=
ge.pipe_to_sendpage.__splice_from_pipe.splice_from_pipe.generic_splice_send=
page.direct_splice_actor.splice_direct_to_actor.do_splice_direct
 1.009e+09 =C2=B1  0%      +5.3%  1.062e+09 =C2=B1  0%  latency_stats.sum.s=
k_wait_data.tcp_recvmsg.inet_recvmsg.sock_recvmsg.SYSC_recvfrom.SyS_recvfro=
m.entry_SYSCALL_64_fastpath
    794782 =C2=B1  8%     -99.4%       4498 =C2=B1 40%  cpuidle.C1-NHM.time
    104769 =C2=B1  2%     -99.8%     166.25 =C2=B1 31%  cpuidle.C1-NHM.usage
    482872 =C2=B1 14%     -32.6%     325328 =C2=B1 28%  cpuidle.C3-NHM.time
   4632646 =C2=B1  1%     +44.6%    6697379 =C2=B1  1%  cpuidle.C6-NHM.time
    337.25 =C2=B1  8%     +35.4%     456.75 =C2=B1  9%  cpuidle.C6-NHM.usage
      1156 =C2=B1 15%    -100.0%       0.00 =C2=B1  0%  cpuidle.POLL.time
    180.50 =C2=B1 17%    -100.0%       0.00 =C2=B1  0%  cpuidle.POLL.usage
    505.75 =C2=B1 19%     -25.4%     377.25 =C2=B1  7%  sched_debug.cfs_rq[=
0]:/.load
    443.50 =C2=B1  5%     -13.0%     386.00 =C2=B1  6%  sched_debug.cfs_rq[=
0]:/.runnable_load_avg
      6167 =C2=B1 13%     +18.1%       7285 =C2=B1 16%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
      6057 =C2=B1 13%     +17.6%       7121 =C2=B1 15%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
    431.50 =C2=B1 14%    +228.2%       1416 =C2=B1  5%  sched_debug.cfs_rq[=
2]:/.blocked_load_avg
     33.75 =C2=B1 11%     -18.5%      27.50 =C2=B1 11%  sched_debug.cfs_rq[=
2]:/.nr_spread_over
    818.50 =C2=B1  6%    +118.3%       1786 =C2=B1  5%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
    301.25 =C2=B1 14%     +38.5%     417.25 =C2=B1 16%  sched_debug.cfs_rq[=
3]:/.load
      5609 =C2=B1 10%     +21.4%       6807 =C2=B1 16%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
    607848 =C2=B1 32%     +35.5%     823868 =C2=B1  6%  sched_debug.cpu#0.a=
vg_idle
    435380 =C2=B1 40%     -52.0%     208833 =C2=B1 35%  sched_debug.cpu#0.n=
r_switches
    435948 =C2=B1 40%     -52.0%     209079 =C2=B1 35%  sched_debug.cpu#0.s=
ched_count
   1118781 =C2=B1122%     -82.2%     198660 =C2=B1 26%  sched_debug.cpu#1.n=
r_switches
   1119297 =C2=B1122%     -82.2%     198883 =C2=B1 26%  sched_debug.cpu#1.s=
ched_count
    649029 =C2=B1121%     -77.9%     143430 =C2=B1 19%  sched_debug.cpu#1.t=
twu_count
    594549 =C2=B1120%     -77.7%     132447 =C2=B1 20%  sched_debug.cpu#1.t=
twu_local
    273528 =C2=B1 94%    +214.0%     858787 =C2=B1 11%  sched_debug.cpu#2.a=
vg_idle
   2797014 =C2=B1 51%     -92.5%     209149 =C2=B1 21%  sched_debug.cpu#2.n=
r_switches
   2797284 =C2=B1 51%     -92.5%     209354 =C2=B1 21%  sched_debug.cpu#2.s=
ched_count
   1635953 =C2=B1 51%     -90.9%     148709 =C2=B1 15%  sched_debug.cpu#2.t=
twu_count
   1457289 =C2=B1 50%     -90.5%     137841 =C2=B1 15%  sched_debug.cpu#2.t=
twu_local
    331.25 =C2=B1 11%     +26.0%     417.50 =C2=B1 15%  sched_debug.cpu#3.l=
oad
    617159 =C2=B1 28%     -70.0%     185105 =C2=B1 33%  sched_debug.cpu#3.n=
r_switches
    617564 =C2=B1 28%     -70.0%     185318 =C2=B1 33%  sched_debug.cpu#3.s=
ched_count
    271272 =C2=B1 20%     -49.9%     135909 =C2=B1 21%  sched_debug.cpu#3.t=
twu_count
    254215 =C2=B1 19%     -50.3%     126227 =C2=B1 22%  sched_debug.cpu#3.t=
twu_local

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test/cluster:
  wsm/netpipe/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/=
tcp/cs-localhost

commit: =

  cad8c9e5d6a97898d37b1a8e5cdf838d79ba6e50
  62c79204783e188291d880f23d49c02d8c8f498b

cad8c9e5d6a97898 62c79204783e188291d880f23d =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      9.39 =C2=B1  1%      -7.6%       8.68 =C2=B1  1%  netpipe.less_8K_use=
c.avg
     17994 =C2=B1  3%     -19.9%      14406 =C2=B1  5%  softirqs.RCU
      0.29 =C2=B1  4%     -13.7%       0.25 =C2=B1  6%  time.user_time
    106713 =C2=B1  1%     -67.9%      34294 =C2=B1  4%  vmstat.system.cs
     37772 =C2=B1  0%     -95.5%       1693 =C2=B1  0%  vmstat.system.in
  87490550 =C2=B1  4%     -54.1%   40120043 =C2=B1  2%  cpuidle.C1-NHM.time
   6115692 =C2=B1  1%     -72.2%    1698584 =C2=B1  4%  cpuidle.C1-NHM.usage
      2583 =C2=B1  5%     -93.4%     170.00 =C2=B1 23%  cpuidle.POLL.usage
     16.39 =C2=B1  3%     -10.9%      14.59 =C2=B1  2%  turbostat.%Busy
    585.25 =C2=B1  2%      -9.7%     528.25 =C2=B1  2%  turbostat.Avg_MHz
     26.28 =C2=B1  2%     -25.9%      19.47 =C2=B1  2%  turbostat.CPU%c1
     56.33 =C2=B1  0%     +14.6%      64.54 =C2=B1  1%  turbostat.CPU%c6
      2320 =C2=B1  6%     -10.0%       2087 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
      2328 =C2=B1  5%      -9.6%       2104 =C2=B1  2%  sched_debug.cfs_rq[=
10]:/.tg->runnable_avg
      2329 =C2=B1  5%      -9.4%       2109 =C2=B1  2%  sched_debug.cfs_rq[=
11]:/.tg->runnable_avg
      8.50 =C2=B1 50%     -64.7%       3.00 =C2=B1-33%  sched_debug.cfs_rq[=
1]:/.nr_spread_over
      3012 =C2=B1687%    +900.1%      30128 =C2=B1106%  sched_debug.cfs_rq[=
1]:/.spread0
      2326 =C2=B1  6%     -10.2%       2088 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
      2326 =C2=B1  6%     -10.0%       2094 =C2=B1  2%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
      2327 =C2=B1  6%      -9.9%       2096 =C2=B1  2%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
      2330 =C2=B1  6%     -10.0%       2096 =C2=B1  2%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
      2326 =C2=B1  6%      -9.8%       2097 =C2=B1  2%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
      2326 =C2=B1  6%      -9.6%       2102 =C2=B1  2%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
     34300 =C2=B1 99%     -96.8%       1105 =C2=B1 16%  sched_debug.cfs_rq[=
7]:/.min_vruntime
      2326 =C2=B1  6%      -9.6%       2102 =C2=B1  2%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
      2326 =C2=B1  6%      -9.6%       2103 =C2=B1  2%  sched_debug.cfs_rq[=
8]:/.tg->runnable_avg
      2328 =C2=B1  5%      -9.7%       2103 =C2=B1  2%  sched_debug.cfs_rq[=
9]:/.tg->runnable_avg
     29.00 =C2=B1141%    +330.2%     124.75 =C2=B1 65%  sched_debug.cpu#2.c=
pu_load[1]
    520151 =C2=B1141%     -87.1%      66855 =C2=B1 50%  sched_debug.cpu#2.t=
twu_count
     52023 =C2=B1 71%     -88.3%       6101 =C2=B1 92%  sched_debug.cpu#6.n=
r_switches
     52035 =C2=B1 71%     -88.3%       6112 =C2=B1 92%  sched_debug.cpu#6.s=
ched_count
     25756 =C2=B1 72%     -89.0%       2837 =C2=B1100%  sched_debug.cpu#6.s=
ched_goidle

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/group:
  lkp-t410/piglit/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/igt-044

commit: =

  cad8c9e5d6a97898d37b1a8e5cdf838d79ba6e50
  62c79204783e188291d880f23d49c02d8c8f498b

cad8c9e5d6a97898 62c79204783e188291d880f23d =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     83.99 =C2=B1  0%     -14.7%      71.66 =C2=B1  0%  piglit.time.elapsed=
_time
     83.99 =C2=B1  0%     -14.7%      71.66 =C2=B1  0%  piglit.time.elapsed=
_time.max
   3034690 =C2=B1  0%     -97.2%      85516 =C2=B1  2%  piglit.time.involun=
tary_context_switches
    352.25 =C2=B1  0%      +8.9%     383.75 =C2=B1  0%  piglit.time.percent=
_of_cpu_this_job_got
    285.25 =C2=B1  0%      -5.8%     268.60 =C2=B1  0%  piglit.time.user_ti=
me
     16.75 =C2=B1 13%     -25.4%      12.50 =C2=B1 12%  vmstat.procs.r
     85019 =C2=B1  0%     -86.1%      11835 =C2=B1  3%  vmstat.system.cs
     42758 =C2=B1  0%     -88.2%       5029 =C2=B1  0%  vmstat.system.in
     83.99 =C2=B1  0%     -14.7%      71.66 =C2=B1  0%  time.elapsed_time
     83.99 =C2=B1  0%     -14.7%      71.66 =C2=B1  0%  time.elapsed_time.m=
ax
   3034690 =C2=B1  0%     -97.2%      85516 =C2=B1  2%  time.involuntary_co=
ntext_switches
     11.15 =C2=B1  0%     -40.4%       6.65 =C2=B1  0%  time.system_time

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/nr_threads/blo=
cksize:
  lkp-sb02/pigz/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performanc=
e/100%/512K

commit: =

  cad8c9e5d6a97898d37b1a8e5cdf838d79ba6e50
  62c79204783e188291d880f23d49c02d8c8f498b

cad8c9e5d6a97898 62c79204783e188291d880f23d =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

  65777721 =C2=B1  0%      +1.5%   66758347 =C2=B1  0%  pigz.throughput
   4731453 =C2=B1  0%     -95.3%     223426 =C2=B1  2%  pigz.time.involunta=
ry_context_switches
     17391 =C2=B1  1%      +2.3%      17800 =C2=B1  0%  pigz.time.minor_pag=
e_faults
    394.00 =C2=B1  0%      +1.0%     398.00 =C2=B1  0%  pigz.time.percent_o=
f_cpu_this_job_got
      1170 =C2=B1  0%      +1.3%       1185 =C2=B1  0%  pigz.time.user_time
    244236 =C2=B1  0%      +2.8%     250954 =C2=B1  0%  pigz.time.voluntary=
_context_switches
     34446 =C2=B1 32%     -99.6%     129.50 =C2=B1 60%  latency_stats.sum.p=
ipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
     13004 =C2=B1  2%      -6.2%      12197 =C2=B1  4%  meminfo.AnonHugePag=
es
   4731453 =C2=B1  0%     -95.3%     223426 =C2=B1  2%  time.involuntary_co=
ntext_switches
     13.98 =C2=B1  0%     -13.6%      12.07 =C2=B1  0%  time.system_time
      0.06 =C2=B1  9%     -81.8%       0.01 =C2=B1  0%  turbostat.CPU%c1
      0.14 =C2=B1  3%     +27.3%       0.18 =C2=B1  2%  turbostat.CPU%c6
     33869 =C2=B1  0%     -89.4%       3581 =C2=B1  2%  vmstat.system.cs
     19774 =C2=B1  0%     -76.7%       4609 =C2=B1  0%  vmstat.system.in
    591398 =C2=B1  9%     -94.5%      32236 =C2=B1  4%  cpuidle.C1-SNB.time
     59726 =C2=B1 10%     -97.7%       1370 =C2=B1 84%  cpuidle.C1-SNB.usage
   2880102 =C2=B1  1%     +17.3%    3377630 =C2=B1  0%  cpuidle.C6-SNB.time
     76.75 =C2=B1 10%    -100.0%       0.00 =C2=B1  0%  cpuidle.POLL.time
     43.25 =C2=B1 18%    -100.0%       0.00 =C2=B1  0%  cpuidle.POLL.usage
      0.74 =C2=B1 33%     -59.1%       0.30 =C2=B1 75%  perf-profile.cpu-cy=
cles.call_timer_fn.run_timer_softirq.__do_softirq.irq_exit.smp_apic_timer_i=
nterrupt
      1.14 =C2=B1 72%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.copy_process.part.27._do_fork.sys_clone.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%       0.56 =C2=B1 56%  perf-profile.cpu-cy=
cles.copy_process.part.28._do_fork.sys_clone.entry_SYSCALL_64_fastpath
      0.95 =C2=B1 21%     +33.9%       1.27 =C2=B1  3%  perf-profile.cpu-cy=
cles.free_hot_cold_page.put_page.anon_pipe_buf_release.pipe_read.__vfs_read
      0.51 =C2=B1 43%    +243.1%       1.75 =C2=B1 34%  perf-profile.cpu-cy=
cles.kthread.ret_from_fork
      0.26 =C2=B1 66%    +316.3%       1.08 =C2=B1 39%  perf-profile.cpu-cy=
cles.rcu_nocb_kthread.kthread.ret_from_fork
      0.51 =C2=B1 43%    +243.1%       1.75 =C2=B1 34%  perf-profile.cpu-cy=
cles.ret_from_fork
    198.25 =C2=B1 10%     +26.1%     250.00 =C2=B1  9%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
     26484 =C2=B1 49%    -107.5%      -1995 =C2=B1-124%  sched_debug.cfs_rq=
[2]:/.spread0
     26370 =C2=B1 45%    -105.4%      -1415 =C2=B1-116%  sched_debug.cfs_rq=
[3]:/.spread0
   5582478 =C2=B1 33%     -97.5%     142112 =C2=B1 16%  sched_debug.cpu#0.n=
r_switches
   5582876 =C2=B1 33%     -97.4%     142504 =C2=B1 16%  sched_debug.cpu#0.s=
ched_count
     40451 =C2=B1 39%     -87.2%       5176 =C2=B1 26%  sched_debug.cpu#0.s=
ched_goidle
   2803309 =C2=B1 33%     -97.2%      77183 =C2=B1 14%  sched_debug.cpu#0.t=
twu_count
   2781915 =C2=B1 33%     -98.0%      55288 =C2=B1 16%  sched_debug.cpu#0.t=
twu_local
   2354598 =C2=B1 80%     -93.5%     153545 =C2=B1  7%  sched_debug.cpu#1.n=
r_switches
   2354718 =C2=B1 80%     -93.5%     153683 =C2=B1  7%  sched_debug.cpu#1.s=
ched_count
   1185125 =C2=B1 79%     -93.2%      80529 =C2=B1 10%  sched_debug.cpu#1.t=
twu_count
   1164849 =C2=B1 81%     -94.8%      60184 =C2=B1 14%  sched_debug.cpu#1.t=
twu_local
      3834 =C2=B1 21%     -35.2%       2483 =C2=B1  8%  sched_debug.cpu#2.s=
ched_goidle

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/test:
  nhm-white/unixbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/shel=
l1

commit: =

  cad8c9e5d6a97898d37b1a8e5cdf838d79ba6e50
  62c79204783e188291d880f23d49c02d8c8f498b

cad8c9e5d6a97898 62c79204783e188291d880f23d =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   2494800 =C2=B1  0%      -6.0%    2345617 =C2=B1  0%  unixbench.time.invo=
luntary_context_switches
 1.085e+09 =C2=B1  0%      -2.4%  1.059e+09 =C2=B1  0%  latency_stats.sum.d=
o_wait.SyS_wait4.entry_SYSCALL_64_fastpath
     52548 =C2=B1  5%     -33.6%      34875 =C2=B1  0%  vmstat.system.cs
     14831 =C2=B1  9%     -59.3%       6034 =C2=B1  0%  vmstat.system.in
     47.37 =C2=B1  0%      -2.0%      46.41 =C2=B1  0%  turbostat.%Busy
      1360 =C2=B1  0%      -2.9%       1321 =C2=B1  0%  turbostat.Avg_MHz
      7.69 =C2=B1  0%     +16.3%       8.94 =C2=B1  3%  turbostat.CPU%c6
      3.51 =C2=B1  0%     +31.3%       4.61 =C2=B1  6%  turbostat.Pkg%pc6
  65744708 =C2=B1  2%     -50.6%   32458256 =C2=B1  0%  cpuidle.C1-NHM.time
   3629185 =C2=B1 14%     -88.0%     435580 =C2=B1  2%  cpuidle.C1-NHM.usage
 4.728e+08 =C2=B1  0%     +13.3%  5.358e+08 =C2=B1  2%  cpuidle.C6-NHM.time
    602583 =C2=B1  0%     +11.6%     672654 =C2=B1  0%  cpuidle.C6-NHM.usage
    141592 =C2=B1 20%     -75.6%      34556 =C2=B1 25%  cpuidle.POLL.time
     14080 =C2=B1 14%     -91.1%       1252 =C2=B1  2%  cpuidle.POLL.usage
     18338 =C2=B1 14%     +16.4%      21343 =C2=B1  4%  sched_debug.cfs_rq[=
2]:/.blocked_load_avg
     18489 =C2=B1 14%     +16.1%      21467 =C2=B1  4%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
    146020 =C2=B1  5%      -7.3%     135370 =C2=B1  0%  sched_debug.cpu#0.n=
r_load_updates
   3000951 =C2=B1 78%     -78.9%     633028 =C2=B1  2%  sched_debug.cpu#0.n=
r_switches
   3001380 =C2=B1 78%     -78.9%     633584 =C2=B1  2%  sched_debug.cpu#0.s=
ched_count
   1354868 =C2=B1 82%     -82.8%     233428 =C2=B1  3%  sched_debug.cpu#0.s=
ched_goidle
   1426794 =C2=B1 82%     -83.9%     230146 =C2=B1  1%  sched_debug.cpu#0.t=
twu_count
   1287294 =C2=B1 92%     -93.0%      90490 =C2=B1  0%  sched_debug.cpu#0.t=
twu_local
      7751 =C2=B1 16%     +37.1%      10628 =C2=B1  6%  sched_debug.cpu#1.c=
urr->pid
    685476 =C2=B1 64%     -65.6%     235696 =C2=B1  4%  sched_debug.cpu#1.t=
twu_count
    535746 =C2=B1 83%     -83.4%      88784 =C2=B1  1%  sched_debug.cpu#1.t=
twu_local
     69.00 =C2=B1  4%     -15.9%      58.00 =C2=B1 13%  sched_debug.cpu#2.c=
pu_load[2]
     69.00 =C2=B1  3%     -17.8%      56.75 =C2=B1 10%  sched_debug.cpu#2.c=
pu_load[3]
     68.25 =C2=B1  4%     -17.2%      56.50 =C2=B1 10%  sched_debug.cpu#2.c=
pu_load[4]
    -69.25 =C2=B1-14%     -33.2%     -46.25 =C2=B1-20%  sched_debug.cpu#3.n=
r_uninterruptible
      7500 =C2=B1 19%     +62.1%      12161 =C2=B1 17%  sched_debug.cpu#4.c=
urr->pid
    219010 =C2=B1  3%      -8.1%     201264 =C2=B1  3%  sched_debug.cpu#4.s=
ched_goidle
     93751 =C2=B1  5%      -7.3%      86883 =C2=B1  0%  sched_debug.cpu#4.t=
twu_local
    137580 =C2=B1  4%      -5.7%     129702 =C2=B1  0%  sched_debug.cpu#5.n=
r_load_updates
   2993388 =C2=B1 79%     -80.6%     581607 =C2=B1  1%  sched_debug.cpu#5.n=
r_switches
   2993731 =C2=B1 79%     -80.6%     581990 =C2=B1  1%  sched_debug.cpu#5.s=
ched_count
   1373366 =C2=B1 84%     -85.1%     204662 =C2=B1  1%  sched_debug.cpu#5.s=
ched_goidle
   1296037 =C2=B1 93%     -93.0%      90170 =C2=B1  0%  sched_debug.cpu#5.t=
twu_local
     78.50 =C2=B1 28%     -43.0%      44.75 =C2=B1 45%  sched_debug.cpu#7.n=
r_uninterruptible
      0.01 =C2=B1 59%  +21923.0%       1.25 =C2=B1171%  sched_debug.rt_rq[3=
]:/.rt_time
      0.00 =C2=B1 58%   +7898.3%       0.38 =C2=B1169%  sched_debug.rt_rq[7=
]:/.rt_time

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/test:
  nhm-white/unixbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/shel=
l8

commit: =

  cad8c9e5d6a97898d37b1a8e5cdf838d79ba6e50
  62c79204783e188291d880f23d49c02d8c8f498b

cad8c9e5d6a97898 62c79204783e188291d880f23d =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   5856190 =C2=B1  1%     -25.5%    4360557 =C2=B1  0%  unixbench.time.invo=
luntary_context_switches
   5856190 =C2=B1  1%     -25.5%    4360557 =C2=B1  0%  time.involuntary_co=
ntext_switches
      3.14 =C2=B1  3%     +29.0%       4.05 =C2=B1  2%  turbostat.Pkg%pc6
     61840 =C2=B1  2%     -26.2%      45627 =C2=B1  0%  vmstat.system.cs
     18904 =C2=B1  3%     -44.2%      10543 =C2=B1  0%  vmstat.system.in
  44596831 =C2=B1  2%     -34.1%   29385365 =C2=B1  1%  cpuidle.C1-NHM.time
   1853539 =C2=B1  8%     -87.6%     229126 =C2=B1  1%  cpuidle.C1-NHM.usage
    246889 =C2=B1 17%     -90.1%      24414 =C2=B1 38%  cpuidle.POLL.time
     31710 =C2=B1  8%     -96.8%       1025 =C2=B1  3%  cpuidle.POLL.usage
     24168 =C2=B1 12%     +18.9%      28748 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.blocked_load_avg
     24325 =C2=B1 13%     +18.8%      28899 =C2=B1  3%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
     91.50 =C2=B1 13%     +31.7%     120.50 =C2=B1 21%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
     83.00 =C2=B1  7%     +29.2%     107.25 =C2=B1 14%  sched_debug.cfs_rq[=
5]:/.runnable_load_avg
     70.75 =C2=B1 18%     +31.1%      92.75 =C2=B1 11%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
      7677 =C2=B1 34%     +46.0%      11210 =C2=B1 10%  sched_debug.cpu#2.c=
urr->pid
    389892 =C2=B1 17%     +27.3%     496226 =C2=B1 13%  sched_debug.cpu#4.a=
vg_idle
      6249 =C2=B1 27%     +87.1%      11693 =C2=B1  7%  sched_debug.cpu#6.c=
urr->pid

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  wsm/will-it-scale/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/perfor=
mance/getppid1

commit: =

  cad8c9e5d6a97898d37b1a8e5cdf838d79ba6e50
  62c79204783e188291d880f23d49c02d8c8f498b

cad8c9e5d6a97898 62c79204783e188291d880f23d =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

  18473072 =C2=B1  3%     -11.3%   16379556 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
  18119608 =C2=B1  1%      -9.5%   16402159 =C2=B1  0%  will-it-scale.per_t=
hread_ops
      0.74 =C2=B1  7%     +18.5%       0.87 =C2=B1  2%  will-it-scale.scala=
bility
    628.18 =C2=B1  0%      +4.4%     655.83 =C2=B1  0%  will-it-scale.time.=
system_time
    434.65 =C2=B1  0%      -6.3%     407.30 =C2=B1  0%  will-it-scale.time.=
user_time
     22243 =C2=B1  4%      -3.3%      21501 =C2=B1  4%  meminfo.AnonPages
      5560 =C2=B1  4%      -3.3%       5374 =C2=B1  4%  proc-vmstat.nr_anon=
_pages
     23934 =C2=B1  4%     -22.1%      18653 =C2=B1  3%  softirqs.SCHED
     18.03 =C2=B1  7%     +14.8%      20.69 =C2=B1  0%  turbostat.CPU%c6
      1802 =C2=B1  2%     +21.0%       2181 =C2=B1  4%  slabinfo.kmalloc-51=
2.active_objs
      1802 =C2=B1  2%     +22.4%       2206 =C2=B1  3%  slabinfo.kmalloc-51=
2.num_objs
     30351 =C2=B1  0%     -93.9%       1837 =C2=B1  0%  vmstat.system.cs
     21766 =C2=B1  0%     -65.9%       7418 =C2=B1  0%  vmstat.system.in
  49070159 =C2=B1 12%     -85.0%    7354447 =C2=B1 24%  cpuidle.C1-NHM.time
   4289833 =C2=B1  8%     -97.5%     107531 =C2=B1  5%  cpuidle.C1-NHM.usage
      1606 =C2=B1  7%     -27.1%       1171 =C2=B1 10%  cpuidle.POLL.usage
     21.60 =C2=B1  1%     -22.8%      16.68 =C2=B1  0%  perf-profile.cpu-cy=
cles.entry_SYSCALL_64
     30.96 =C2=B1  2%     -22.8%      23.90 =C2=B1  0%  perf-profile.cpu-cy=
cles.entry_SYSCALL_64_after_swapgs
     44.96 =C2=B1  2%     +25.8%      56.58 =C2=B1  2%  perf-profile.cpu-cy=
cles.entry_SYSCALL_64_fastpath
      9.80 =C2=B1 16%    +156.6%      25.16 =C2=B1  2%  perf-profile.cpu-cy=
cles.pid_vnr.entry_SYSCALL_64_fastpath
      6.40 =C2=B1 13%     -50.6%       3.16 =C2=B1  4%  perf-profile.cpu-cy=
cles.pid_vnr.sys_getppid.entry_SYSCALL_64_fastpath
     11.04 =C2=B1  7%     +15.1%      12.70 =C2=B1  2%  perf-profile.cpu-cy=
cles.sys_getppid.entry_SYSCALL_64_fastpath
     13943 =C2=B1 10%     +25.4%      17491 =C2=B1  6%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
     13886 =C2=B1 10%     +25.1%      17373 =C2=B1  6%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
     13888 =C2=B1 10%     +24.9%      17352 =C2=B1  6%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
      2.25 =C2=B1 19%     +66.7%       3.75 =C2=B1 22%  sched_debug.cfs_rq[=
1]:/.nr_spread_over
     13949 =C2=B1 10%     +25.1%      17452 =C2=B1  6%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
     13949 =C2=B1 10%     +25.1%      17456 =C2=B1  6%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
     13948 =C2=B1 10%     +25.1%      17447 =C2=B1  6%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
     13929 =C2=B1 10%     +25.2%      17441 =C2=B1  6%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
     13931 =C2=B1 10%     +24.9%      17406 =C2=B1  6%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
     13929 =C2=B1 10%     +24.8%      17379 =C2=B1  6%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
     13910 =C2=B1 10%     +24.9%      17379 =C2=B1  6%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
     13890 =C2=B1 10%     +25.1%      17371 =C2=B1  6%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
     13888 =C2=B1 10%     +25.1%      17370 =C2=B1  6%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
    144.75 =C2=B1 52%     -47.8%      75.50 =C2=B1 31%  sched_debug.cpu#1.c=
pu_load[0]
    128.25 =C2=B1 38%     -43.3%      72.75 =C2=B1 14%  sched_debug.cpu#1.c=
pu_load[1]
    106.25 =C2=B1 25%     -33.4%      70.75 =C2=B1  7%  sched_debug.cpu#1.c=
pu_load[2]
     90.25 =C2=B1 15%     -23.0%      69.50 =C2=B1  4%  sched_debug.cpu#1.c=
pu_load[3]
     82.00 =C2=B1  7%     -15.9%      69.00 =C2=B1  3%  sched_debug.cpu#1.c=
pu_load[4]
   1005269 =C2=B1166%     -98.4%      16346 =C2=B1 25%  sched_debug.cpu#1.n=
r_switches
   1005304 =C2=B1166%     -98.4%      16385 =C2=B1 25%  sched_debug.cpu#1.s=
ched_count
    499712 =C2=B1168%     -98.6%       6885 =C2=B1 37%  sched_debug.cpu#1.s=
ched_goidle
      1.50 =C2=B1145%     +83.3%       2.75 =C2=B1150%  sched_debug.cpu#10.=
nr_uninterruptible
      2154 =C2=B1 14%     -38.3%       1330 =C2=B1 32%  sched_debug.cpu#3.c=
urr->pid
      1562 =C2=B1 33%     +40.0%       2187 =C2=B1  9%  sched_debug.cpu#4.c=
urr->pid
     42.25 =C2=B1  2%     +31.4%      55.50 =C2=B1 20%  sched_debug.cpu#7.c=
pu_load[1]
     42.75 =C2=B1  3%     +19.3%      51.00 =C2=B1 12%  sched_debug.cpu#7.c=
pu_load[2]
     43.50 =C2=B1  5%     +13.2%      49.25 =C2=B1 10%  sched_debug.cpu#7.c=
pu_load[3]
    441090 =C2=B1167%     -99.5%       2153 =C2=B1 51%  sched_debug.cpu#7.t=
twu_count
     72.75 =C2=B1 32%     -39.9%      43.75 =C2=B1  9%  sched_debug.cpu#8.c=
pu_load[0]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  wsm/will-it-scale/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/perfor=
mance/open1

commit: =

  cad8c9e5d6a97898d37b1a8e5cdf838d79ba6e50
  62c79204783e188291d880f23d49c02d8c8f498b

cad8c9e5d6a97898 62c79204783e188291d880f23d =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    801101 =C2=B1  4%      +6.5%     853345 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
      0.56 =C2=B1 10%     -11.5%       0.50 =C2=B1  0%  will-it-scale.scala=
bility
      2004 =C2=B1100%    +233.7%       6688 =C2=B1100%  latency_stats.sum.w=
ait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpa=
th
     40.09 =C2=B1  1%      -9.6%      36.25 =C2=B1  0%  time.user_time
    357.00 =C2=B1 13%     +32.4%     472.50 =C2=B1  7%  slabinfo.mnt_cache.=
active_objs
    357.00 =C2=B1 13%     +32.4%     472.50 =C2=B1  7%  slabinfo.mnt_cache.=
num_objs
     90485 =C2=B1  2%      -7.4%      83796 =C2=B1  0%  softirqs.RCU
     49819 =C2=B1  2%     -10.7%      44472 =C2=B1  1%  softirqs.SCHED
     30306 =C2=B1  2%     -91.1%       2685 =C2=B1  1%  vmstat.system.cs
     21928 =C2=B1  1%     -63.7%       7960 =C2=B1  0%  vmstat.system.in
  41567129 =C2=B1 11%     -90.4%    3994402 =C2=B1 30%  cpuidle.C1-NHM.time
   3844950 =C2=B1 16%     -97.0%     115267 =C2=B1  3%  cpuidle.C1-NHM.usage
  16389120 =C2=B1 54%     -56.8%    7074969 =C2=B1 15%  cpuidle.C3-NHM.time
      1491 =C2=B1 49%     -91.1%     132.00 =C2=B1 17%  cpuidle.POLL.usage
      1.54 =C2=B1  3%     -18.8%       1.26 =C2=B1  4%  perf-profile.cpu-cy=
cles.__call_rcu.call_rcu_sched.__fput.____fput.task_work_run
      1.21 =C2=B1  5%     -18.7%       0.98 =C2=B1  2%  perf-profile.cpu-cy=
cles.__fd_install.fd_install.do_sys_open.sys_open.entry_SYSCALL_64_fastpath
      3.01 =C2=B1  4%     +11.0%       3.34 =C2=B1  3%  perf-profile.cpu-cy=
cles.__inode_permission.inode_permission.may_open.path_openat.do_filp_open
      1.81 =C2=B1  2%     +11.1%       2.01 =C2=B1  3%  perf-profile.cpu-cy=
cles.__memset.get_empty_filp.path_openat.do_filp_open.do_sys_open
      1.47 =C2=B1  2%     -11.4%       1.31 =C2=B1  3%  perf-profile.cpu-cy=
cles.__slab_alloc.kmem_cache_alloc.get_empty_filp.path_openat.do_filp_open
      3.61 =C2=B1  2%     -10.2%       3.25 =C2=B1  1%  perf-profile.cpu-cy=
cles.call_rcu_sched.__fput.____fput.task_work_run.prepare_exit_to_usermode
     10.03 =C2=B1  1%      -7.9%       9.24 =C2=B1  1%  perf-profile.cpu-cy=
cles.do_dentry_open.vfs_open.path_openat.do_filp_open.do_sys_open
      1.39 =C2=B1  4%     -18.2%       1.14 =C2=B1  3%  perf-profile.cpu-cy=
cles.fd_install.do_sys_open.sys_open.entry_SYSCALL_64_fastpath
      2.50 =C2=B1  2%      +8.9%       2.72 =C2=B1  2%  perf-profile.cpu-cy=
cles.get_unused_fd_flags.do_sys_open.sys_open.entry_SYSCALL_64_fastpath
      3.31 =C2=B1  5%     +10.4%       3.66 =C2=B1  2%  perf-profile.cpu-cy=
cles.inode_permission.may_open.path_openat.do_filp_open.do_sys_open
      1.15 =C2=B1  5%      +9.8%       1.26 =C2=B1  3%  perf-profile.cpu-cy=
cles.kfree.selinux_file_free_security.security_file_free.__fput.____fput
      2.14 =C2=B1  2%     -13.6%       1.85 =C2=B1  2%  perf-profile.cpu-cy=
cles.kmem_cache_alloc_trace.selinux_file_alloc_security.security_file_alloc=
.get_empty_filp.path_openat
      3.62 =C2=B1  2%      -8.8%       3.30 =C2=B1  1%  perf-profile.cpu-cy=
cles.security_file_alloc.get_empty_filp.path_openat.do_filp_open.do_sys_open
      1.45 =C2=B1  5%     +11.9%       1.62 =C2=B1  3%  perf-profile.cpu-cy=
cles.security_file_free.__fput.____fput.task_work_run.prepare_exit_to_userm=
ode
      2.13 =C2=B1  6%     +15.2%       2.46 =C2=B1  4%  perf-profile.cpu-cy=
cles.security_inode_permission.__inode_permission.inode_permission.may_open=
.path_openat
      3.30 =C2=B1  2%      -8.7%       3.01 =C2=B1  2%  perf-profile.cpu-cy=
cles.selinux_file_alloc_security.security_file_alloc.get_empty_filp.path_op=
enat.do_filp_open
      1.18 =C2=B1  5%      +8.7%       1.29 =C2=B1  2%  perf-profile.cpu-cy=
cles.selinux_file_free_security.security_file_free.__fput.____fput.task_wor=
k_run
      3.21 =C2=B1  3%     +12.8%       3.63 =C2=B1  1%  perf-profile.cpu-cy=
cles.selinux_inode_permission.security_inode_permission.__inode_permission.=
inode_permission.link_path_walk
      1.83 =C2=B1  7%     +17.2%       2.15 =C2=B1  5%  perf-profile.cpu-cy=
cles.selinux_inode_permission.security_inode_permission.__inode_permission.=
inode_permission.may_open
     10.79 =C2=B1  1%      -9.4%       9.78 =C2=B1  1%  perf-profile.cpu-cy=
cles.vfs_open.path_openat.do_filp_open.do_sys_open.sys_open
      1138 =C2=B1 30%     +58.8%       1807 =C2=B1  9%  sched_debug.cfs_rq[=
11]:/.blocked_load_avg
      1199 =C2=B1 27%     +57.1%       1884 =C2=B1  8%  sched_debug.cfs_rq[=
11]:/.tg_load_contrib
      3.00 =C2=B1 84%    +233.3%      10.00 =C2=B1  7%  sched_debug.cfs_rq[=
2]:/.nr_spread_over
     30468 =C2=B1 13%     -17.6%      25115 =C2=B1  3%  sched_debug.cfs_rq[=
7]:/.avg->runnable_avg_sum
    663.25 =C2=B1 13%     -17.4%     547.75 =C2=B1  3%  sched_debug.cfs_rq[=
7]:/.tg_runnable_contrib
      3028 =C2=B1 59%     -57.3%       1291 =C2=B1 56%  sched_debug.cfs_rq[=
8]:/.blocked_load_avg
      3.25 =C2=B1 50%    +169.2%       8.75 =C2=B1 21%  sched_debug.cfs_rq[=
8]:/.nr_spread_over
      3092 =C2=B1 57%     -56.7%       1340 =C2=B1 54%  sched_debug.cfs_rq[=
8]:/.tg_load_contrib
    109897 =C2=B1  9%     -16.2%      92140 =C2=B1  3%  sched_debug.cpu#0.n=
r_load_updates
     97.75 =C2=B1 23%     -32.7%      65.75 =C2=B1 14%  sched_debug.cpu#1.c=
pu_load[0]
     88.00 =C2=B1 10%     -26.7%      64.50 =C2=B1  7%  sched_debug.cpu#1.c=
pu_load[1]
      2.00 =C2=B1 93%    -325.0%      -4.50 =C2=B1-114%  sched_debug.cpu#1.=
nr_uninterruptible
     62.25 =C2=B1  8%     -12.9%      54.25 =C2=B1 13%  sched_debug.cpu#11.=
cpu_load[4]
     24550 =C2=B1 18%     -31.1%      16923 =C2=B1 24%  sched_debug.cpu#2.t=
twu_count
     12972 =C2=B1  9%     -37.0%       8171 =C2=B1 30%  sched_debug.cpu#2.t=
twu_local
      1038 =C2=B1 41%     +92.4%       1998 =C2=B1  9%  sched_debug.cpu#4.c=
urr->pid
     15880 =C2=B1 17%     +19.8%      19022 =C2=B1  4%  sched_debug.cpu#4.s=
ched_goidle
   1492076 =C2=B1 99%     -99.4%       8330 =C2=B1 50%  sched_debug.cpu#6.n=
r_switches
   1492358 =C2=B1 99%     -99.4%       8627 =C2=B1 48%  sched_debug.cpu#6.s=
ched_count
    614310 =C2=B1100%     -99.6%       2432 =C2=B1 64%  sched_debug.cpu#6.s=
ched_goidle
     62.75 =C2=B1 16%     -23.9%      47.75 =C2=B1 18%  sched_debug.cpu#7.c=
pu_load[2]
     59.50 =C2=B1 16%     -22.7%      46.00 =C2=B1 12%  sched_debug.cpu#7.c=
pu_load[3]
      1.00 =C2=B1212%    +775.0%       8.75 =C2=B1 28%  sched_debug.cpu#8.n=
r_uninterruptible

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  wsm/will-it-scale/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/perfor=
mance/pthread_mutex2

commit: =

  cad8c9e5d6a97898d37b1a8e5cdf838d79ba6e50
  62c79204783e188291d880f23d49c02d8c8f498b

cad8c9e5d6a97898 62c79204783e188291d880f23d =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     25290 =C2=B1  8%     -28.3%      18121 =C2=B1  3%  softirqs.SCHED
     30175 =C2=B1  0%     -94.6%       1620 =C2=B1  5%  vmstat.system.cs
     21733 =C2=B1  0%     -66.0%       7399 =C2=B1  0%  vmstat.system.in
  50171812 =C2=B1  9%     -80.7%    9701068 =C2=B1 55%  cpuidle.C1-NHM.time
   4178650 =C2=B1 12%     -98.0%      83770 =C2=B1 12%  cpuidle.C1-NHM.usage
      1465 =C2=B1  6%     -27.9%       1057 =C2=B1 17%  cpuidle.POLL.usage
     60.19 =C2=B1  0%      -1.5%      59.27 =C2=B1  0%  turbostat.%Busy
      2118 =C2=B1  0%      -1.6%       2085 =C2=B1  0%  turbostat.Avg_MHz
     17.82 =C2=B1  6%     +15.7%      20.61 =C2=B1  0%  turbostat.CPU%c6
      0.07 =C2=B1133%   +1864.3%       1.38 =C2=B1 73%  perf-profile.cpu-cy=
cles.__libc_start_main
      0.07 =C2=B1133%   +1814.3%       1.34 =C2=B1 75%  perf-profile.cpu-cy=
cles._start.main.__libc_start_main
      1.72 =C2=B1110%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.copy_process.part.27._do_fork.sys_clone.entry_SYSCALL_64_fastpath
      0.07 =C2=B1133%   +1814.3%       1.34 =C2=B1 75%  perf-profile.cpu-cy=
cles.main.__libc_start_main
    807.25 =C2=B1 17%     -26.5%     593.25 =C2=B1 24%  sched_debug.cfs_rq[=
3]:/.utilization_load_avg
      2069 =C2=B1 45%     -80.7%     398.50 =C2=B1 40%  sched_debug.cfs_rq[=
4]:/.blocked_load_avg
      2162 =C2=B1 45%     -78.0%     475.25 =C2=B1 38%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
    419067 =C2=B1169%     -98.3%       7041 =C2=B1  4%  sched_debug.cpu#0.s=
ched_goidle
     81.50 =C2=B1  3%     -22.1%      63.50 =C2=B1 22%  sched_debug.cpu#1.c=
pu_load[2]
     16437 =C2=B1 46%     -76.4%       3884 =C2=B1 57%  sched_debug.cpu#10.=
ttwu_count
     80953 =C2=B1 18%     -24.0%      61501 =C2=B1 14%  sched_debug.cpu#2.n=
r_load_updates
     68.50 =C2=B1 15%     -27.7%      49.50 =C2=B1 18%  sched_debug.cpu#3.c=
pu_load[0]
     67.25 =C2=B1  8%     -15.2%      57.00 =C2=B1 12%  sched_debug.cpu#4.c=
pu_load[3]
     65.75 =C2=B1  8%     -16.7%      54.75 =C2=B1 10%  sched_debug.cpu#4.c=
pu_load[4]
     39032 =C2=B1 14%     -38.8%      23893 =C2=B1 40%  sched_debug.cpu#4.n=
r_switches
     39071 =C2=B1 14%     -38.8%      23926 =C2=B1 40%  sched_debug.cpu#4.s=
ched_count
     19248 =C2=B1 12%     -42.4%      11089 =C2=B1 26%  sched_debug.cpu#4.t=
twu_count
      9496 =C2=B1  6%     -67.8%       3057 =C2=B1 30%  sched_debug.cpu#4.t=
twu_local

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  wsm/will-it-scale/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/perfor=
mance/readseek3

commit: =

  cad8c9e5d6a97898d37b1a8e5cdf838d79ba6e50
  62c79204783e188291d880f23d49c02d8c8f498b

cad8c9e5d6a97898 62c79204783e188291d880f23d =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   2439605 =C2=B1  0%      +1.8%    2484631 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
   1842733 =C2=B1  1%      +5.8%    1949535 =C2=B1  1%  will-it-scale.per_t=
hread_ops
      0.54 =C2=B1  0%      -1.8%       0.53 =C2=B1  1%  will-it-scale.scala=
bility
     14706 =C2=B1 31%     +52.6%      22440 =C2=B1 16%  will-it-scale.time.=
involuntary_context_switches
    136239 =C2=B1  2%     +44.4%     196725 =C2=B1  3%  latency_stats.hits.=
pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
      7.40 =C2=B1  3%      -9.7%       6.68 =C2=B1  2%  perf-profile.cpu-cy=
cles.rw_verify_area.vfs_read.sys_read.entry_SYSCALL_64_fastpath
     25530 =C2=B1  1%     -19.8%      20467 =C2=B1  1%  softirqs.SCHED
     14706 =C2=B1 31%     +52.6%      22440 =C2=B1 16%  time.involuntary_co=
ntext_switches
     30169 =C2=B1  0%     -93.6%       1945 =C2=B1  2%  vmstat.system.cs
     21810 =C2=B1  0%     -65.8%       7449 =C2=B1  0%  vmstat.system.in
     59.90 =C2=B1  0%      -1.5%      59.02 =C2=B1  0%  turbostat.%Busy
      2108 =C2=B1  0%      -1.5%       2076 =C2=B1  0%  turbostat.Avg_MHz
     17.43 =C2=B1  0%     +17.6%      20.50 =C2=B1  0%  turbostat.CPU%c6
  46658026 =C2=B1  4%     -77.3%   10588249 =C2=B1 14%  cpuidle.C1-NHM.time
   4461627 =C2=B1  0%     -97.5%     112631 =C2=B1  5%  cpuidle.C1-NHM.usage
    135274 =C2=B1 85%    +363.4%     626895 =C2=B1 80%  cpuidle.C1E-NHM.time
    103.25 =C2=B1 12%     +71.4%     177.00 =C2=B1 20%  cpuidle.C1E-NHM.usa=
ge
  38945629 =C2=B1  6%     -29.3%   27546659 =C2=B1 19%  cpuidle.POLL.time
      1523 =C2=B1 10%     -26.2%       1124 =C2=B1  3%  cpuidle.POLL.usage
     14514 =C2=B1  6%     +21.2%      17593 =C2=B1  6%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
    -69524 =C2=B1-63%     +63.0%    -113345 =C2=B1-40%  sched_debug.cfs_rq[=
10]:/.spread0
     14486 =C2=B1  6%     +20.9%      17508 =C2=B1  6%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
     14468 =C2=B1  6%     +21.0%      17508 =C2=B1  6%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
     58.25 =C2=B1  7%     +32.6%      77.25 =C2=B1 25%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
     14520 =C2=B1  6%     +21.1%      17583 =C2=B1  6%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
     14468 =C2=B1  6%     +21.4%      17560 =C2=B1  6%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
     14471 =C2=B1  6%     +21.3%      17557 =C2=B1  6%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
     14483 =C2=B1  6%     +21.1%      17545 =C2=B1  6%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
     14489 =C2=B1  6%     +20.8%      17503 =C2=B1  6%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
     14493 =C2=B1  6%     +20.7%      17487 =C2=B1  6%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
     52254 =C2=B1 84%     -94.8%       2722 =C2=B11818%  sched_debug.cfs_rq=
[7]:/.spread0
     14492 =C2=B1  6%     +20.6%      17481 =C2=B1  6%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
     14492 =C2=B1  6%     +20.9%      17523 =C2=B1  6%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
    -34317 =C2=B1-276%    +228.6%    -112775 =C2=B1-40%  sched_debug.cfs_rq=
[9]:/.spread0
     14486 =C2=B1  6%     +20.9%      17508 =C2=B1  6%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
     14454 =C2=B1  6%     +32.2%      19105 =C2=B1 13%  sched_debug.cpu#0.t=
twu_count
     11838 =C2=B1 20%     -37.9%       7351 =C2=B1 30%  sched_debug.cpu#1.t=
twu_count
     -6.75 =C2=B1-36%     -96.3%      -0.25 =C2=B1-1424%  sched_debug.cpu#4=
.nr_uninterruptible
      6151 =C2=B1 23%    +113.3%      13119 =C2=B1 24%  sched_debug.cpu#6.n=
r_switches
      6185 =C2=B1 23%    +112.6%      13147 =C2=B1 24%  sched_debug.cpu#6.s=
ched_count
      1375 =C2=B1 29%    +242.6%       4711 =C2=B1 35%  sched_debug.cpu#6.s=
ched_goidle
      4277 =C2=B1 21%     +88.5%       8063 =C2=B1 19%  sched_debug.cpu#6.t=
twu_count
      2263 =C2=B1 12%     -19.2%       1829 =C2=B1  0%  sched_debug.cpu#9.c=
urr->pid
     72929 =C2=B1 11%     -20.4%      58086 =C2=B1  0%  sched_debug.cpu#9.n=
r_load_updates
    356400 =C2=B1171%     -99.6%       1252 =C2=B1 11%  sched_debug.cpu#9.t=
twu_local
      0.05 =C2=B1100%    +430.4%       0.28 =C2=B1 98%  sched_debug.rt_rq[1=
]:/.rt_time


lkp-a06: Atom
Memory: 8G

lkp-sb02: Sandy Bridge-EP
Memory: 4G

nhm4: Nehalem
Memory: 4G

lituya: Grantley Haswell
Memory: 16G

wsm: Westmere
Memory: 6G

lkp-t410: Westmere
Memory: 2G

nhm-white: Nehalem
Memory: 6G


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

--===============4457953950907327421==
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
dGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogYmExOTc3MmZlZmU1
NmZjYTE1NDhkOTEyMThjM2FlY2E4ZjIwNzkxOQptb2RlbDogU2FuZHkgQnJpZGdlLUVQCm1lbW9y
eTogNEcKaGRkX3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLUhEVDcyMjUxNkRMQTM4
MF9WRFNEMURUQ0VLWUFFSi1wYXJ0MiIKc3dhcF9wYXJ0aXRpb25zOiAKcm9vdGZzX3BhcnRpdGlv
bjogIi9kZXYvZGlzay9ieS1pZC9hdGEtSERUNzIyNTE2RExBMzgwX1ZEU0QxRFRDRUtZQUVKLXBh
cnQxIgpjYXRlZ29yeTogYmVuY2htYXJrCml0ZXJhdGlvbnM6IDF4Cm5yX3RocmVhZHM6IDMydApk
aXNrOiAxSERECmZzOiBidHJmcwpmczI6IApmc21hcms6CiAgZmlsZXNpemU6IDlCCiAgdGVzdF9z
aXplOiA0MDBNCiAgc3luY19tZXRob2Q6IGZzeW5jQmVmb3JlQ2xvc2UKICBucl9kaXJlY3Rvcmll
czogMTZkCiAgbnJfZmlsZXNfcGVyX2RpcmVjdG9yeTogMjU2ZnBkCnF1ZXVlOiBjeWNsaWMKdGVz
dGJveDogbGtwLXNiMDIKdGJveF9ncm91cDogbGtwLXNiMDIKa2NvbmZpZzogeDg2XzY0LXJoZWwK
ZW5xdWV1ZV90aW1lOiAyMDE1LTA3LTA4IDEyOjQ2OjU3LjE1MjQyMjAxNyArMDg6MDAKdXNlcjog
d2ZnCmNvbXBpbGVyOiBnY2MtNC45CmhlYWRfY29tbWl0OiBiYTE5NzcyZmVmZTU2ZmNhMTU0OGQ5
MTIxOGMzYWVjYThmMjA3OTE5CmJhc2VfY29tbWl0OiBkNzcwZTU1OGUyMTk2MWFkNmNmZGYwZmY3
ZGYwZWI1ZDdkNGYwNzU0CmJyYW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUwNzEw
MjEKa2VybmVsOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45L2JhMTk3NzJmZWZlNTZm
Y2ExNTQ4ZDkxMjE4YzNhZWNhOGYyMDc5MTkvdm1saW51ei00LjIuMC1yYzEtd2wtMDA4ODItZ2Jh
MTk3NzIiCnJvb3RmczogZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnegpyZXN1bHRfcm9vdDog
Ii9yZXN1bHQvZnNtYXJrL3BlcmZvcm1hbmNlLTF4LTMydC0xSERELWJ0cmZzLTlCLTQwME0tZnN5
bmNCZWZvcmVDbG9zZS0xNmQtMjU2ZnBkL2xrcC1zYjAyL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS9iYTE5NzcyZmVmZTU2ZmNhMTU0OGQ5MTIxOGMzYWVj
YThmMjA3OTE5LzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvbGtwLXNiMDIvY3ljbGljX2Zz
bWFyay1wZXJmb3JtYW5jZS0xeC0zMnQtMUhERC1idHJmcy05Qi00MDBNLWZzeW5jQmVmb3JlQ2xv
c2UtMTZkLTI1NmZwZC14ODZfNjQtcmhlbC1DWUNMSUNfSEVBRC1iYTE5NzcyZmVmZTU2ZmNhMTU0
OGQ5MTIxOGMzYWVjYThmMjA3OTE5LTIwMTUwNzA4LTg4OTY3LW01bzNmcy0wLnlhbWwiCmRlcXVl
dWVfdGltZTogMjAxNS0wNy0xMSAxMjoxNzoyNi4yNTA4Mzc0MTcgKzA4OjAwCm5yX2NwdTogIiQo
bnByb2MpIgptYXhfdXB0aW1lOiAxMDYzLjA4MDAwMDAwMDAwMDIKaW5pdHJkOiAiL29zaW1hZ2Uv
ZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgot
IHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj13ZmcKLSBqb2I9L2xrcC9zY2hlZHVsZWQvbGtwLXNiMDIv
Y3ljbGljX2ZzbWFyay1wZXJmb3JtYW5jZS0xeC0zMnQtMUhERC1idHJmcy05Qi00MDBNLWZzeW5j
QmVmb3JlQ2xvc2UtMTZkLTI1NmZwZC14ODZfNjQtcmhlbC1DWUNMSUNfSEVBRC1iYTE5NzcyZmVm
ZTU2ZmNhMTU0OGQ5MTIxOGMzYWVjYThmMjA3OTE5LTIwMTUwNzA4LTg4OTY3LW01bzNmcy0wLnlh
bWwKLSBBUkNIPXg4Nl82NAotIGtjb25maWc9eDg2XzY0LXJoZWwKLSBicmFuY2g9bGludXgtZGV2
ZWwvZGV2ZWwtaG91cmx5LTIwMTUwNzEwMjEKLSBjb21taXQ9YmExOTc3MmZlZmU1NmZjYTE1NDhk
OTEyMThjM2FlY2E4ZjIwNzkxOQotIEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQtcmhlbC9n
Y2MtNC45L2JhMTk3NzJmZWZlNTZmY2ExNTQ4ZDkxMjE4YzNhZWNhOGYyMDc5MTkvdm1saW51ei00
LjIuMC1yYzEtd2wtMDA4ODItZ2JhMTk3NzIKLSBtYXhfdXB0aW1lPTEwNjMKLSBSRVNVTFRfUk9P
VD0vcmVzdWx0L2ZzbWFyay9wZXJmb3JtYW5jZS0xeC0zMnQtMUhERC1idHJmcy05Qi00MDBNLWZz
eW5jQmVmb3JlQ2xvc2UtMTZkLTI1NmZwZC9sa3Atc2IwMi9kZWJpYW4teDg2XzY0LTIwMTUtMDIt
MDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvYmExOTc3MmZlZmU1NmZjYTE1NDhkOTEyMThjM2Fl
Y2E4ZjIwNzkxOS8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJpbnRrPXR0eVMw
LDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fs
d2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5pYz0t
MSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9y
YW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9
dHR5MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL3dmZy9sa3AteDg2XzY0LmNn
eiIKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvYmExOTc3
MmZlZmU1NmZjYTE1NDhkOTEyMThjM2FlY2E4ZjIwNzkxOS9tb2R1bGVzLmNneiIKYm1faW5pdHJk
OiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3osL29z
aW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNvbmZpZy5jZ3os
L29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJvc3RhdC5jZ3os
L2xrcC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6L2ZzLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3ovZnMyLmNneiwvbGtwL2JlbmNobWFya3MvZnNtYXJrLmNneiIKam9iX3N0YXRlOiBm
aW5pc2hlZApsb2FkYXZnOiAyNy42NiAxMy40NCA1LjIyIDEvMTcwIDMwMjgKc3RhcnRfdGltZTog
JzE0MzY1ODgyODUnCmVuZF90aW1lOiAnMTQzNjU4ODQ1MCcKdmVyc2lvbjogIi9sa3Avd2ZnLy5z
cmMtMjAxNTA3MTEtMTAwNTA1Igo=

--===============4457953950907327421==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCm1rZnMgLXQgYnRyZnMgL2Rldi9zZGEyCm1vdW50IC10IGJ0cmZzIC9kZXYvc2RhMiAv
ZnMvc2RhMgouL2ZzX21hcmsgLWQgL2ZzL3NkYTIvMSAtZCAvZnMvc2RhMi8yIC1kIC9mcy9zZGEy
LzMgLWQgL2ZzL3NkYTIvNCAtZCAvZnMvc2RhMi81IC1kIC9mcy9zZGEyLzYgLWQgL2ZzL3NkYTIv
NyAtZCAvZnMvc2RhMi84IC1kIC9mcy9zZGEyLzkgLWQgL2ZzL3NkYTIvMTAgLWQgL2ZzL3NkYTIv
MTEgLWQgL2ZzL3NkYTIvMTIgLWQgL2ZzL3NkYTIvMTMgLWQgL2ZzL3NkYTIvMTQgLWQgL2ZzL3Nk
YTIvMTUgLWQgL2ZzL3NkYTIvMTYgLWQgL2ZzL3NkYTIvMTcgLWQgL2ZzL3NkYTIvMTggLWQgL2Zz
L3NkYTIvMTkgLWQgL2ZzL3NkYTIvMjAgLWQgL2ZzL3NkYTIvMjEgLWQgL2ZzL3NkYTIvMjIgLWQg
L2ZzL3NkYTIvMjMgLWQgL2ZzL3NkYTIvMjQgLWQgL2ZzL3NkYTIvMjUgLWQgL2ZzL3NkYTIvMjYg
LWQgL2ZzL3NkYTIvMjcgLWQgL2ZzL3NkYTIvMjggLWQgL2ZzL3NkYTIvMjkgLWQgL2ZzL3NkYTIv
MzAgLWQgL2ZzL3NkYTIvMzEgLWQgL2ZzL3NkYTIvMzIgLUQgMTYgLU4gMjU2IC1uIDMyMDAgLUwg
MSAtUyAxIC1zIDkK

--===============4457953950907327421==--

