Content-Type: multipart/mixed; boundary="===============4029909117736627627=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [sched] ed4ab8ce76: +112.7% unixbench.score
Date: Thu, 28 Jan 2016 10:03:13 +0800
Message-ID: <87k2mu1mvy.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4029909117736627627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/mel/linux-balancenuma sched=
-disable-schedstats-v2r1
commit ed4ab8ce76b14db0f82f17d6bf20898532f24040 ("sched: Make schedstats a =
runtime tunable that is disabled by default")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/filesize/fs/iterations/kconfig/nr_directorie=
s/nr_files_per_directory/nr_threads/rootfs/sync_method/tbox_group/test_size=
/testcase:
  gcc-4.9/performance/1HDD/5K/btrfs/1x/x86_64-rhel/16d/256fpd/32t/debian-x8=
6_64-2015-02-07.cgz/fsyncBeforeClose/lkp-ne04/400M/fsmark

commit: =

  v4.5-rc1
  ed4ab8ce76b14db0f82f17d6bf20898532f24040

        v4.5-rc1 ed4ab8ce76b14db0f82f17d6bf =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   1473135 =C2=B1  4%     -27.2%    1072149 =C2=B1  0%  fsmark.app_overhead
    351.48 =C2=B1  0%      -2.4%     342.91 =C2=B1  0%  fsmark.files_per_sec
   3063192 =C2=B1  0%      -4.5%    2926520 =C2=B1  1%  fsmark.time.file_sy=
stem_outputs
     47561 =C2=B1  5%     -71.1%      13740 =C2=B1  2%  fsmark.time.involun=
tary_context_switches
     10586 =C2=B1  0%      -9.5%       9583 =C2=B1  0%  fsmark.time.minor_p=
age_faults
     21.60 =C2=B1 16%     -67.6%       7.00 =C2=B1  0%  fsmark.time.percent=
_of_cpu_this_job_got
     54.52 =C2=B1  3%     -67.8%      17.54 =C2=B1  0%  fsmark.time.system_=
time
   1100909 =C2=B1  2%     -52.8%     520080 =C2=B1  2%  fsmark.time.volunta=
ry_context_switches
      4096 =C2=B1  2%    -100.0%       0.00 =C2=B1  0%  proc-vmstat.numa_pt=
e_updates
    393712 =C2=B1 17%     -19.6%     316676 =C2=B1  1%  numa-numastat.node1=
.local_node
    393716 =C2=B1 17%     -19.6%     316678 =C2=B1  1%  numa-numastat.node1=
.numa_hit
      2881 =C2=B1 15%     -73.5%     762.80 =C2=B1  9%  slabinfo.btrfs_tran=
s_handle.active_objs
      2895 =C2=B1 15%     -73.7%     762.80 =C2=B1  9%  slabinfo.btrfs_tran=
s_handle.num_objs
     47946 =C2=B1  6%     -34.1%      31613 =C2=B1  0%  softirqs.RCU
     51042 =C2=B1  7%     -37.0%      32159 =C2=B1  5%  softirqs.SCHED
    106261 =C2=B1  8%     -22.8%      82065 =C2=B1  8%  softirqs.TIMER
    332.10 =C2=B1 15%     -76.0%      79.70 =C2=B1 50%  turbostat.Avg_MHz
     20.95 =C2=B1 15%     -72.5%       5.76 =C2=B1 50%  turbostat.CPU%c1
      6.73 =C2=B1  8%    +260.6%      24.28 =C2=B1  7%  turbostat.Pkg%pc3
     10377 =C2=B1  1%      -7.4%       9608 =C2=B1  1%  vmstat.io.bo
     12577 =C2=B1  2%     -40.6%       7470 =C2=B1  1%  vmstat.system.cs
      1436 =C2=B1  2%     -28.2%       1031 =C2=B1  0%  vmstat.system.in
     47561 =C2=B1  5%     -71.1%      13740 =C2=B1  2%  time.involuntary_co=
ntext_switches
     10586 =C2=B1  0%      -9.5%       9583 =C2=B1  0%  time.minor_page_fau=
lts
     21.60 =C2=B1 16%     -67.6%       7.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
     54.52 =C2=B1  3%     -67.8%      17.54 =C2=B1  0%  time.system_time
      0.75 =C2=B1  6%     +14.2%       0.85 =C2=B1  4%  time.user_time
   1100909 =C2=B1  2%     -52.8%     520080 =C2=B1  2%  time.voluntary_cont=
ext_switches
 2.861e+08 =C2=B1  2%     -81.1%   54100491 =C2=B1 11%  cpuidle.C1-NHM.time
    167488 =C2=B1  5%     -75.3%      41433 =C2=B1  5%  cpuidle.C1-NHM.usage
  55038510 =C2=B1  6%     -41.2%   32338858 =C2=B1 12%  cpuidle.C1E-NHM.time
     50732 =C2=B1  7%     -22.4%      39376 =C2=B1  6%  cpuidle.C1E-NHM.usa=
ge
 3.415e+08 =C2=B1  1%     -18.4%  2.788e+08 =C2=B1  3%  cpuidle.C3-NHM.time
    199101 =C2=B1  1%     -12.3%     174545 =C2=B1  1%  cpuidle.C3-NHM.usage
 3.389e+08 =C2=B1  4%     -74.3%   86968082 =C2=B1  7%  cpuidle.POLL.time
    352604 =C2=B1  4%     -78.7%      74952 =C2=B1  6%  cpuidle.POLL.usage
     75411 =C2=B1 13%     +15.1%      86761 =C2=B1  3%  numa-vmstat.node0.n=
r_active_file
    140558 =C2=B1 15%     +23.0%     172844 =C2=B1  2%  numa-vmstat.node0.n=
r_dirtied
    818.00 =C2=B1 17%     +27.2%       1040 =C2=B1  1%  numa-vmstat.node0.n=
r_dirty
    199274 =C2=B1 11%     +16.2%     231531 =C2=B1  1%  numa-vmstat.node0.n=
r_file_pages
    122909 =C2=B1 10%     +16.5%     143210 =C2=B1  0%  numa-vmstat.node0.n=
r_inactive_file
     24133 =C2=B1 13%     +17.3%      28307 =C2=B1  1%  numa-vmstat.node0.n=
r_slab_reclaimable
    139704 =C2=B1 15%     +23.0%     171771 =C2=B1  2%  numa-vmstat.node0.n=
r_written
     30848 =C2=B1  9%     -43.8%      17343 =C2=B1  4%  numa-vmstat.node1.n=
r_active_file
     43238 =C2=B1 16%     -69.9%      12996 =C2=B1 14%  numa-vmstat.node1.n=
r_dirtied
    316.70 =C2=B1 19%     -67.7%     102.30 =C2=B1 22%  numa-vmstat.node1.n=
r_dirty
    103100 =C2=B1  6%     -29.5%      72713 =C2=B1  2%  numa-vmstat.node1.n=
r_file_pages
     70905 =C2=B1  5%     -22.9%      54635 =C2=B1  2%  numa-vmstat.node1.n=
r_inactive_file
      9936 =C2=B1  9%     -33.4%       6622 =C2=B1  7%  numa-vmstat.node1.n=
r_slab_reclaimable
     42907 =C2=B1 16%     -70.0%      12890 =C2=B1 14%  numa-vmstat.node1.n=
r_written
    313222 =C2=B1  7%     -12.3%     274716 =C2=B1  2%  numa-vmstat.node1.n=
uma_hit
    309494 =C2=B1  7%     -12.5%     270899 =C2=B1  2%  numa-vmstat.node1.n=
uma_local
    318673 =C2=B1 13%     +15.0%     366549 =C2=B1  3%  numa-meminfo.node0.=
Active
    301654 =C2=B1 13%     +15.0%     347052 =C2=B1  3%  numa-meminfo.node0.=
Active(file)
      3274 =C2=B1 17%     +27.2%       4165 =C2=B1  1%  numa-meminfo.node0.=
Dirty
    797112 =C2=B1 11%     +16.2%     926133 =C2=B1  1%  numa-meminfo.node0.=
FilePages
    495267 =C2=B1 10%     +16.9%     578895 =C2=B1  1%  numa-meminfo.node0.=
Inactive
    491645 =C2=B1 10%     +16.5%     572849 =C2=B1  0%  numa-meminfo.node0.=
Inactive(file)
    980996 =C2=B1 10%     +15.0%    1127768 =C2=B1  1%  numa-meminfo.node0.=
MemUsed
     96537 =C2=B1 13%     +17.3%     113231 =C2=B1  1%  numa-meminfo.node0.=
SReclaimable
    138003 =C2=B1  8%     -40.5%      82163 =C2=B1  5%  numa-meminfo.node1.=
Active
    123397 =C2=B1  9%     -43.8%      69374 =C2=B1  4%  numa-meminfo.node1.=
Active(file)
      1268 =C2=B1 19%     -67.5%     411.80 =C2=B1 22%  numa-meminfo.node1.=
Dirty
    412410 =C2=B1  6%     -29.5%     290854 =C2=B1  2%  numa-meminfo.node1.=
FilePages
    288842 =C2=B1  4%     -23.4%     221309 =C2=B1  3%  numa-meminfo.node1.=
Inactive
    283626 =C2=B1  5%     -22.9%     218545 =C2=B1  2%  numa-meminfo.node1.=
Inactive(file)
    523063 =C2=B1  5%     -25.7%     388503 =C2=B1  3%  numa-meminfo.node1.=
MemUsed
     39748 =C2=B1  9%     -33.3%      26492 =C2=B1  7%  numa-meminfo.node1.=
SReclaimable
     58456 =C2=B1  7%     -21.7%      45747 =C2=B1  5%  numa-meminfo.node1.=
Slab
     73085 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.w=
ait_log_commit.[btrfs].btrfs_sync_log.[btrfs].btrfs_sync_file.[btrfs].vfs_f=
sync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
     30118 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.w=
rite_all_supers.[btrfs].write_ctree_super.[btrfs].btrfs_sync_log.[btrfs].bt=
rfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_f=
astpath
     78833 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  latency_stats.hits.=
btrfs_start_ordered_extent.[btrfs].btrfs_wait_ordered_range.[btrfs].btrfs_s=
ync_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpa=
th
     10142 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  latency_stats.hits.=
btrfs_sync_log.[btrfs].btrfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS=
_fsync.entry_SYSCALL_64_fastpath
     57499 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  latency_stats.hits.=
btrfs_tree_lock.[btrfs].btrfs_lock_root_node.[btrfs].btrfs_search_slot.[btr=
fs].btrfs_insert_empty_items.[btrfs].btrfs_new_inode.[btrfs].btrfs_create.[=
btrfs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCA=
LL_64_fastpath
     56081 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  latency_stats.hits.=
btrfs_tree_lock.[btrfs].btrfs_lock_root_node.[btrfs].btrfs_search_slot.[btr=
fs].btrfs_insert_empty_items.[btrfs].insert_with_overflow.[btrfs].btrfs_ins=
ert_dir_item.[btrfs].btrfs_add_link.[btrfs].btrfs_create.[btrfs].vfs_create=
.path_openat.do_filp_open.do_sys_open
     72520 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  latency_stats.hits.=
btrfs_tree_lock.[btrfs].btrfs_search_slot.[btrfs].btrfs_insert_empty_items.=
[btrfs].btrfs_new_inode.[btrfs].btrfs_create.[btrfs].vfs_create.path_openat=
.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
     41230 =C2=B1 48%    -100.0%       0.00 =C2=B1 -1%  latency_stats.hits.=
btrfs_tree_lock.[btrfs].btrfs_search_slot.[btrfs].btrfs_insert_empty_items.=
[btrfs].insert_with_overflow.[btrfs].btrfs_insert_dir_item.[btrfs].btrfs_ad=
d_link.[btrfs].btrfs_create.[btrfs].vfs_create.path_openat.do_filp_open.do_=
sys_open.SyS_open
      9324 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  latency_stats.hits.=
btrfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search=
_slot.[btrfs].btrfs_insert_empty_items.[btrfs].copy_items.[btrfs].btrfs_log=
_inode.[btrfs].btrfs_log_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs]=
.btrfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync
     11745 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  latency_stats.hits.=
btrfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search=
_slot.[btrfs].btrfs_insert_empty_items.[btrfs].insert_with_overflow.[btrfs]=
.btrfs_insert_dir_item.[btrfs].btrfs_add_link.[btrfs].btrfs_create.[btrfs].=
vfs_create.path_openat.do_filp_open.do_sys_open
     10752 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  latency_stats.hits.=
btrfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search=
_slot.[btrfs].btrfs_lookup_xattr.[btrfs].__btrfs_getxattr.[btrfs].btrfs_xat=
tr_handler_get.[btrfs].generic_getxattr.cap_inode_need_killpriv.security_in=
ode_need_killpriv.dentry_needs_remove_privs.file_remove_privs.btrfs_file_wr=
ite_iter.[btrfs]
     18352 =C2=B1 89%    -100.0%       0.00 =C2=B1 -1%  latency_stats.hits.=
btrfs_tree_read_lock.[btrfs].btrfs_search_slot.[btrfs].btrfs_lookup_dir_ite=
m.[btrfs].btrfs_lookup_dentry.[btrfs].btrfs_lookup.[btrfs].lookup_real.path=
_openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
     50807 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  latency_stats.hits.=
btrfs_tree_read_lock.[btrfs].btrfs_search_slot.[btrfs].btrfs_lookup_xattr.[=
btrfs].__btrfs_getxattr.[btrfs].btrfs_xattr_handler_get.[btrfs].generic_get=
xattr.cap_inode_need_killpriv.security_inode_need_killpriv.dentry_needs_rem=
ove_privs.file_remove_privs.btrfs_file_write_iter.[btrfs].__vfs_write
     35878 =C2=B1 27%    -100.0%       0.00 =C2=B1 -1%  latency_stats.hits.=
pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
     79830 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  latency_stats.hits.=
wait_log_commit.[btrfs].btrfs_sync_log.[btrfs].btrfs_sync_file.[btrfs].vfs_=
fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
     84552 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  latency_stats.hits.=
wait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_range.btrfs_wa=
it_ordered_range.[btrfs].btrfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.S=
yS_fsync.entry_SYSCALL_64_fastpath
      8386 =C2=B1 28%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.b=
trfs_start_ordered_extent.[btrfs].btrfs_wait_ordered_range.[btrfs].btrfs_sy=
nc_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
      8798 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.w=
ait_for_writer.[btrfs].btrfs_sync_log.[btrfs].btrfs_sync_file.[btrfs].vfs_f=
sync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
    258437 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.w=
ait_log_commit.[btrfs].btrfs_sync_log.[btrfs].btrfs_sync_file.[btrfs].vfs_f=
sync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
     16354 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_range.btrfs_wai=
t_marked_extents.[btrfs].btrfs_sync_log.[btrfs].btrfs_sync_file.[btrfs].vfs=
_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
   1622499 =C2=B1 29%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_range.btrfs_wai=
t_ordered_range.[btrfs].btrfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.Sy=
S_fsync.entry_SYSCALL_64_fastpath
    173227 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.w=
rite_all_supers.[btrfs].write_ctree_super.[btrfs].btrfs_sync_log.[btrfs].bt=
rfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_f=
astpath
  17461880 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_start_ordered_extent.[btrfs].btrfs_wait_ordered_range.[btrfs].btrfs_sy=
nc_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
   7972317 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_sync_log.[btrfs].btrfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS_=
fsync.entry_SYSCALL_64_fastpath
      8859 =C2=B1100%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_lock_root_node.[btrfs].btrfs_search_slot.[btrf=
s].btrfs_insert_empty_items.[btrfs].alloc_reserved_file_extent.[btrfs].__bt=
rfs_run_delayed_refs.[btrfs].btrfs_run_delayed_refs.[btrfs].btrfs_commit_tr=
ansaction.[btrfs].btrfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync
      6913 =C2=B1 43%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_lock_root_node.[btrfs].btrfs_search_slot.[btrf=
s].btrfs_insert_empty_items.[btrfs].btrfs_csum_file_blocks.[btrfs].copy_ite=
ms.[btrfs].btrfs_log_inode.[btrfs].btrfs_log_inode_parent.[btrfs].btrfs_log=
_dentry_safe.[btrfs].btrfs_sync_file.[btrfs].vfs_fsync_range.do_fsync
    229131 =C2=B1 21%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_lock_root_node.[btrfs].btrfs_search_slot.[btrf=
s].btrfs_insert_empty_items.[btrfs].btrfs_insert_delayed_items.[btrfs].btrf=
s_commit_inode_delayed_items.[btrfs].btrfs_log_inode.[btrfs].btrfs_log_inod=
e_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_file.[btrfs].vfs_=
fsync_range.do_fsync
   1850677 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_lock_root_node.[btrfs].btrfs_search_slot.[btrf=
s].btrfs_insert_empty_items.[btrfs].btrfs_new_inode.[btrfs].btrfs_create.[b=
trfs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCAL=
L_64_fastpath
     65647 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_lock_root_node.[btrfs].btrfs_search_slot.[btrf=
s].btrfs_insert_empty_items.[btrfs].copy_items.[btrfs].btrfs_log_inode.[btr=
fs].btrfs_log_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync=
_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync
   1695583 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_lock_root_node.[btrfs].btrfs_search_slot.[btrf=
s].btrfs_insert_empty_items.[btrfs].insert_with_overflow.[btrfs].btrfs_inse=
rt_dir_item.[btrfs].btrfs_add_link.[btrfs].btrfs_create.[btrfs].vfs_create.=
path_openat.do_filp_open.do_sys_open
    212868 =C2=B1 50%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_lock_root_node.[btrfs].btrfs_search_slot.[btrf=
s].btrfs_insert_empty_items.[btrfs].insert_with_overflow.[btrfs].btrfs_inse=
rt_dir_item.[btrfs].btrfs_add_link.[btrfs].btrfs_mkdir.[btrfs].vfs_mkdir.Sy=
S_mkdir.entry_SYSCALL_64_fastpath
     12786 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_lock_root_node.[btrfs].btrfs_search_slot.[btrf=
s].btrfs_truncate_inode_items.[btrfs].btrfs_log_inode.[btrfs].btrfs_log_ino=
de_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_file.[btrfs].vfs=
_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
     45005 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_lock_root_node.[btrfs].btrfs_search_slot.[btrf=
s].drop_objectid_items.[btrfs].btrfs_log_inode.[btrfs].btrfs_log_inode_pare=
nt.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_file.[btrfs].vfs_fsync_=
range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
    215659 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_search_slot.[btrfs].btrfs_insert_empty_items.[=
btrfs].btrfs_insert_delayed_items.[btrfs].btrfs_commit_inode_delayed_items.=
[btrfs].btrfs_log_inode.[btrfs].btrfs_log_inode_parent.[btrfs].btrfs_log_de=
ntry_safe.[btrfs].btrfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync
   1367601 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_search_slot.[btrfs].btrfs_insert_empty_items.[=
btrfs].btrfs_new_inode.[btrfs].btrfs_create.[btrfs].vfs_create.path_openat.=
do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
    668316 =C2=B1 56%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_search_slot.[btrfs].btrfs_insert_empty_items.[=
btrfs].insert_with_overflow.[btrfs].btrfs_insert_dir_item.[btrfs].btrfs_add=
_link.[btrfs].btrfs_create.[btrfs].vfs_create.path_openat.do_filp_open.do_s=
ys_open.SyS_open
    271351 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_search_slot.[btrfs].btrfs_lookup_inode.[btrfs]=
.__btrfs_update_delayed_inode.[btrfs].btrfs_commit_inode_delayed_items.[btr=
fs].btrfs_log_inode.[btrfs].btrfs_log_inode_parent.[btrfs].btrfs_log_dentry=
_safe.[btrfs].btrfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync
     93978 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search_=
forward.[btrfs].btrfs_log_inode.[btrfs].btrfs_log_inode_parent.[btrfs].btrf=
s_log_dentry_safe.[btrfs].btrfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.=
SyS_fsync.entry_SYSCALL_64_fastpath
      8958 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search_=
slot.[btrfs].btrfs_csum_file_blocks.[btrfs].copy_items.[btrfs].btrfs_log_in=
ode.[btrfs].btrfs_log_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].bt=
rfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync
     21415 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search_=
slot.[btrfs].btrfs_insert_empty_items.[btrfs].btrfs_insert_delayed_items.[b=
trfs].btrfs_commit_inode_delayed_items.[btrfs].btrfs_log_inode.[btrfs].btrf=
s_log_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_file.[b=
trfs].vfs_fsync_range.do_fsync
    235483 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search_=
slot.[btrfs].btrfs_insert_empty_items.[btrfs].btrfs_new_inode.[btrfs].btrfs=
_create.[btrfs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open.en=
try_SYSCALL_64_fastpath
     98497 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search_=
slot.[btrfs].btrfs_insert_empty_items.[btrfs].copy_items.[btrfs].btrfs_log_=
inode.[btrfs].btrfs_log_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].=
btrfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync
    314718 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search_=
slot.[btrfs].btrfs_insert_empty_items.[btrfs].insert_with_overflow.[btrfs].=
btrfs_insert_dir_item.[btrfs].btrfs_add_link.[btrfs].btrfs_create.[btrfs].v=
fs_create.path_openat.do_filp_open.do_sys_open
    108828 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search_=
slot.[btrfs].btrfs_log_inode.[btrfs].btrfs_log_inode_parent.[btrfs].btrfs_l=
og_dentry_safe.[btrfs].btrfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS=
_fsync.entry_SYSCALL_64_fastpath
     51098 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search_=
slot.[btrfs].btrfs_lookup_csum.[btrfs].btrfs_csum_file_blocks.[btrfs].copy_=
items.[btrfs].btrfs_log_inode.[btrfs].btrfs_log_inode_parent.[btrfs].btrfs_=
log_dentry_safe.[btrfs].btrfs_sync_file.[btrfs].vfs_fsync_range.do_fsync
    175287 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search_=
slot.[btrfs].btrfs_lookup_dir_item.[btrfs].btrfs_lookup_dentry.[btrfs].btrf=
s_lookup.[btrfs].lookup_real.path_openat.do_filp_open.do_sys_open.SyS_open.=
entry_SYSCALL_64_fastpath
    118581 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search_=
slot.[btrfs].btrfs_lookup_inode.[btrfs].__btrfs_update_delayed_inode.[btrfs=
].btrfs_commit_inode_delayed_items.[btrfs].btrfs_log_inode.[btrfs].btrfs_lo=
g_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_file.[btrfs=
].vfs_fsync_range.do_fsync
    257043 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search_=
slot.[btrfs].btrfs_lookup_xattr.[btrfs].__btrfs_getxattr.[btrfs].btrfs_xatt=
r_handler_get.[btrfs].generic_getxattr.cap_inode_need_killpriv.security_ino=
de_need_killpriv.dentry_needs_remove_privs.file_remove_privs.btrfs_file_wri=
te_iter.[btrfs]
     42705 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search_=
slot.[btrfs].btrfs_truncate_inode_items.[btrfs].btrfs_log_inode.[btrfs].btr=
fs_log_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_file.[=
btrfs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
     66105 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search_=
slot.[btrfs].drop_objectid_items.[btrfs].btrfs_log_inode.[btrfs].btrfs_log_=
inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_file.[btrfs].=
vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
     56090 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_read_lock.[btrfs].btrfs_search_forward.[btrfs].btrfs_log_inode.[b=
trfs].btrfs_log_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sy=
nc_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
     43378 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_read_lock.[btrfs].btrfs_search_slot.[btrfs].btrfs_log_inode.[btrf=
s].btrfs_log_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].btrfs_sync_=
file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
    377987 =C2=B1 89%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_read_lock.[btrfs].btrfs_search_slot.[btrfs].btrfs_lookup_dir_item=
.[btrfs].btrfs_lookup_dentry.[btrfs].btrfs_lookup.[btrfs].lookup_real.path_=
openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
    889722 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.b=
trfs_tree_read_lock.[btrfs].btrfs_search_slot.[btrfs].btrfs_lookup_xattr.[b=
trfs].__btrfs_getxattr.[btrfs].btrfs_xattr_handler_get.[btrfs].generic_getx=
attr.cap_inode_need_killpriv.security_inode_need_killpriv.dentry_needs_remo=
ve_privs.file_remove_privs.btrfs_file_write_iter.[btrfs].__vfs_write
   1588928 =C2=B1 30%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.d=
o_wait.SyS_wait4.entry_SYSCALL_64_fastpath
     10889 =C2=B1 29%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.e=
p_poll.SyS_epoll_wait.entry_SYSCALL_64_fastpath
   2505908 =C2=B1 31%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
     19734 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.path_openat.do_=
filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
    393857 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.w=
ait_for_writer.[btrfs].btrfs_sync_log.[btrfs].btrfs_sync_file.[btrfs].vfs_f=
sync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
 5.835e+09 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.w=
ait_log_commit.[btrfs].btrfs_sync_log.[btrfs].btrfs_sync_file.[btrfs].vfs_f=
sync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
  23983772 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_range.btrfs_wai=
t_marked_extents.[btrfs].btrfs_sync_log.[btrfs].btrfs_sync_file.[btrfs].vfs=
_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
 7.308e+08 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_range.btrfs_wai=
t_ordered_range.[btrfs].btrfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.Sy=
S_fsync.entry_SYSCALL_64_fastpath
 1.384e+08 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.w=
rite_all_supers.[btrfs].write_ctree_super.[btrfs].btrfs_sync_log.[btrfs].bt=
rfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_f=
astpath

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/nr_task/rootfs/tbox_group/test/testcase:
  gcc-4.9/x86_64-rhel/100%/debian-x86_64-2015-02-07.cgz/nhm-white2/context1=
/unixbench

commit: =

  v4.5-rc1
  ed4ab8ce76b14db0f82f17d6bf20898532f24040

        v4.5-rc1 ed4ab8ce76b14db0f82f17d6bf =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      1514 =C2=B1  0%    +112.7%       3222 =C2=B1  0%  unixbench.score
     80462 =C2=B1 33%   +1766.4%    1501718 =C2=B1 53%  unixbench.time.invo=
luntary_context_switches
    388.27 =C2=B1  0%      -3.2%     375.73 =C2=B1  0%  unixbench.time.syst=
em_time
     10.93 =C2=B1  1%    +101.5%      22.03 =C2=B1  0%  unixbench.time.user=
_time
  60435954 =C2=B1  0%    +109.5%  1.266e+08 =C2=B1  1%  unixbench.time.volu=
ntary_context_switches
    906365 =C2=B1  2%     +96.9%    1784406 =C2=B1 14%  vmstat.system.cs
     80462 =C2=B1 33%   +1766.4%    1501718 =C2=B1 53%  time.involuntary_co=
ntext_switches
     10.93 =C2=B1  1%    +101.5%      22.03 =C2=B1  0%  time.user_time
  60435954 =C2=B1  0%    +109.5%  1.266e+08 =C2=B1  1%  time.voluntary_cont=
ext_switches
 1.209e+08 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  latency_stats.hits.=
pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
    233697 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.d=
o_wait.SyS_wait4.entry_SYSCALL_64_fastpath
     31068 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.e=
p_poll.SyS_epoll_wait.entry_SYSCALL_64_fastpath
  2.42e+08 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
     17252 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.path_openat.do_=
filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
   1095198 =C2=B1296%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_keep_errors.syn=
c_inodes_sb.sync_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fas=
tpath


lkp-ne04: Nehalem-EP
Memory: 12G

nhm-white2: Nehalem
Memory: 4G

                            unixbench.time.system_time

  390 ++-------------------------------------------------------------------=
-+
  388 *+*.*.. .*.*.*.*..*.             *.*.*.  .*.*.*.*.*..*.*.*. .*.*..*.*=
.*
      |      *            *.*.*.*.    +      *.                  *         =
 |
  386 ++                          *..*                                     =
 |
  384 ++                                                                   =
 |
      |                                                                    =
 |
  382 ++                                                                   =
 |
  380 ++                                                                   =
 |
  378 ++                                                                   =
 |
      |        O   O                              O        O               =
 |
  376 O+  O      O          O O   O  O O   O O      O O                    =
 |
  374 ++     O       O  O O              O      O       O                  =
 |
      | O                                                                  =
 |
  372 ++                        O                                          =
 |
  370 ++-------------------------------------------------------------------=
-+


                       unixbench.time.voluntary_context_switches

  1.3e+08 ++------O----------------------------O---O---O----O--------------=
-+
          O O O O   O O O  O O O O   O O O O O   O   O   O                 =
 |
  1.2e+08 ++                       O                                       =
 |
          |                                                                =
 |
  1.1e+08 ++                                                               =
 |
          |                                                                =
 |
    1e+08 ++                                                               =
 |
          |                                                                =
 |
    9e+07 ++                                                               =
 |
          |                                                                =
 |
    8e+07 ++                                                               =
 |
          |                                                                =
 |
    7e+07 ++                                                               =
 |
          |                 .*.*.*.*.*.*.                                  =
 |
    6e+07 *+*-*-*-*-*-*-*--*-------------*-*-*-*-*-*-*-*-*--*-*-*-*-*-*-*-*=
-*

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

--===============4029909117736627627==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogdW5peGJlbmNoCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9u
aXRvcgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVt
YXN0YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAK
ICBwcm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAg
aW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczog
CiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6
IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1
ZzoKICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiAKZGVmYXVsdC13YXRjaGRvZ3M6
CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IGVkNGFiOGNlNzZiMTRkYjBmODJm
MTdkNmJmMjA4OTg1MzJmMjQwNDAKbW9kZWw6IE5laGFsZW0KbWVtb3J5OiA0Rwpucl9jcHU6IDgK
aGRkX3BhcnRpdGlvbnM6IApzd2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAKbmV0
Y29uc29sZV9wb3J0OiA2NjcxCmNhdGVnb3J5OiBiZW5jaG1hcmsKbnJfdGFzazogMTAwJQp1bml4
YmVuY2g6CiAgdGVzdDogY29udGV4dDEKcXVldWU6IGJpc2VjdAp0ZXN0Ym94OiBuaG0td2hpdGUy
CnRib3hfZ3JvdXA6IG5obS13aGl0ZTIKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1l
OiAyMDE2LTAxLTI3IDEwOjI1OjQ2LjAwMDQwNDUzOSArMDg6MDAKaWQ6IGM0NDQ1N2IxNzE1MjE1
YzNmNjU5MWMxM2JmZTYyMTg1OTczOTU1NTkKdXNlcjogbGtwCmNvbXBpbGVyOiBnY2MtNC45Cmhl
YWRfY29tbWl0OiBlN2U2YzZmYmE5YjYzZDFjNmQ4NzFlNjI5Y2Y2OWNkYTA0ZmVkZWVjCmJhc2Vf
Y29tbWl0OiA5MmU5NjNmNTBmYzc0MDQxYjVlOWU3NDRjMzMwZGNhNDhlMDRmMDhkCmJyYW5jaDog
bGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTYwMTI2MjIKcm9vdGZzOiBkZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC91bml4YmVuY2gvMTAwJS1jb250
ZXh0MS9uaG0td2hpdGUyL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwv
Z2NjLTQuOS9lZDRhYjhjZTc2YjE0ZGIwZjgyZjE3ZDZiZjIwODk4NTMyZjI0MDQwLzAiCmpvYl9m
aWxlOiAiL2xrcC9zY2hlZHVsZWQvbmhtLXdoaXRlMi9iaXNlY3RfdW5peGJlbmNoLTEwMCUtY29u
dGV4dDEtZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei14ODZfNjQtcmhlbC1lZDRhYjhjZTc2
YjE0ZGIwZjgyZjE3ZDZiZjIwODk4NTMyZjI0MDQwLTIwMTYwMTI3LTE3OTc3LTE3eXZ6am0tMC55
YW1sIgptYXhfdXB0aW1lOiA5NTkuNTIKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14
ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0w
Ci0gdXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQvbmhtLXdoaXRlMi9iaXNlY3RfdW5peGJl
bmNoLTEwMCUtY29udGV4dDEtZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei14ODZfNjQtcmhl
bC1lZDRhYjhjZTc2YjE0ZGIwZjgyZjE3ZDZiZjIwODk4NTMyZjI0MDQwLTIwMTYwMTI3LTE3OTc3
LTE3eXZ6am0tMC55YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmlnPXg4Nl82NC1yaGVsCi0gYnJh
bmNoPWxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE2MDEyNjIyCi0gY29tbWl0PWVkNGFiOGNl
NzZiMTRkYjBmODJmMTdkNmJmMjA4OTg1MzJmMjQwNDAKLSBCT09UX0lNQUdFPS9wa2cvbGludXgv
eDg2XzY0LXJoZWwvZ2NjLTQuOS9lZDRhYjhjZTc2YjE0ZGIwZjgyZjE3ZDZiZjIwODk4NTMyZjI0
MDQwL3ZtbGludXotNC41LjAtcmMxLTAwMDAxLWdlZDRhYjhjCi0gbWF4X3VwdGltZT05NTkKLSBS
RVNVTFRfUk9PVD0vcmVzdWx0L3VuaXhiZW5jaC8xMDAlLWNvbnRleHQxL25obS13aGl0ZTIvZGVi
aWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45L2VkNGFiOGNlNzZi
MTRkYjBmODJmMTdkNmJmMjA4OTg1MzJmMjQwNDAvMAotIExLUF9TRVJWRVI9aW5uCi0gfDItCgoK
ICBlYXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCiAgZGVidWcg
YXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1X3N0YWxsX3Rp
bWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRjaGRvZz1wYW5p
YyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNrPTAKICBjb25zb2xlPXR0
eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwpsa3BfaW5pdHJkOiAiL2xr
cC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQt
cmhlbC9nY2MtNC45L2VkNGFiOGNlNzZiMTRkYjBmODJmMTdkNmJmMjA4OTg1MzJmMjQwNDAvbW9k
dWxlcy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAy
LTA3LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNn
ei9ydW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3
LmNnei90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy90dXJib3N0YXQuY2d6LC9sa3AvYmVu
Y2htYXJrcy91bml4YmVuY2guY2d6IgpsaW51eF9oZWFkZXJzX2luaXRyZDogIi9wa2cvbGludXgv
eDg2XzY0LXJoZWwvZ2NjLTQuOS9lZDRhYjhjZTc2YjE0ZGIwZjgyZjE3ZDZiZjIwODk4NTMyZjI0
MDQwL2xpbnV4LWhlYWRlcnMuY2d6IgpyZXBlYXRfdG86IDIKa2VybmVsOiAiL3BrZy9saW51eC94
ODZfNjQtcmhlbC9nY2MtNC45L2VkNGFiOGNlNzZiMTRkYjBmODJmMTdkNmJmMjA4OTg1MzJmMjQw
NDAvdm1saW51ei00LjUuMC1yYzEtMDAwMDEtZ2VkNGFiOGMiCmRlcXVldWVfdGltZTogMjAxNi0w
MS0yNyAxMDoyODoyOS4yMjM0MDA5MjggKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2
ZzogNS45MSAyLjYwIDAuOTggMS8xNjQgMjg4OQpzdGFydF90aW1lOiAnMTQ1Mzg2MTczMycKZW5k
X3RpbWU6ICcxNDUzODYxODYzJwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE2MDEyNy0wODM4
MDAiCg==

--===============4029909117736627627==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNi0wMS0yNyAxMDoyODo1MyAuL1J1biBjb250ZXh0MSAtYyA4Cg==

--===============4029909117736627627==--

