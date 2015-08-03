Content-Type: multipart/mixed; boundary="===============4232413532421615472=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [sched/preempt] 59fe8231b68: 42.7% fsmark.app_overhead
Date: Mon, 03 Aug 2015 21:33:50 +0800
Message-ID: <87io8wcx8h.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4232413532421615472==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://internal_merge_and_test_tree revert-59fe8231b68905f4ca5f7a115b1a67582=
9016b53-59fe8231b68905f4ca5f7a115b1a675829016b53
commit 59fe8231b68905f4ca5f7a115b1a675829016b53 ("sched/preempt: Fix cond_r=
esched_lock() and cond_resched_softirq()")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/iterations/nr_threads/disk/fs/f=
s2/filesize/test_size/sync_method/nr_directories/nr_files_per_directory:
  lkp-ws02/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/1x/32t/1=
HDD/btrfs/nfsv4/8K/400M/fsyncBeforeClose/16d/256fpd

commit: =

  2f008f5b6184088f3f435557f0592d876bda78b9
  59fe8231b68905f4ca5f7a115b1a675829016b53

2f008f5b6184088f 59fe8231b68905f4ca5f7a115b =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

  44649848 =C2=B1  7%     +42.7%   63695806 =C2=B1 12%  fsmark.app_overhead
     60010 =C2=B1  0%     +19.0%      71395 =C2=B1  0%  fsmark.time.involun=
tary_context_switches
    227729 =C2=B1  0%      -2.8%     221420 =C2=B1  0%  fsmark.time.volunta=
ry_context_switches
     60010 =C2=B1  0%     +19.0%      71395 =C2=B1  0%  time.involuntary_co=
ntext_switches
     11321 =C2=B1  0%      +3.2%      11684 =C2=B1  1%  vmstat.system.cs
      1.29 =C2=B1  0%      +1.9%       1.31 =C2=B1  0%  turbostat.%Busy
     29.09 =C2=B1  8%     -10.1%      26.14 =C2=B1  5%  turbostat.Pkg%pc3
    121962 =C2=B1  5%     +12.9%     137665 =C2=B1  7%  numa-meminfo.node0.=
Active(file)
    190283 =C2=B1  0%      -7.9%     175324 =C2=B1  3%  numa-meminfo.node1.=
Active
    177386 =C2=B1  1%     -10.0%     159598 =C2=B1  3%  numa-meminfo.node1.=
Active(file)
  53060080 =C2=B1  8%     +22.4%   64966682 =C2=B1  3%  cpuidle.C1E-NHM.time
     47661 =C2=B1  3%      +9.4%      52136 =C2=B1  3%  cpuidle.C1E-NHM.usa=
ge
    421155 =C2=B1  1%      +9.9%     462828 =C2=B1  0%  cpuidle.C3-NHM.usage
    588.00 =C2=B1  2%     +15.0%     676.00 =C2=B1  3%  cpuidle.POLL.usage
     30490 =C2=B1  5%     +12.9%      34416 =C2=B1  7%  numa-vmstat.node0.n=
r_active_file
     66978 =C2=B1  4%     +11.7%      74839 =C2=B1  6%  numa-vmstat.node0.n=
r_dirtied
     66802 =C2=B1  4%     +11.7%      74647 =C2=B1  6%  numa-vmstat.node0.n=
r_written
     44345 =C2=B1  1%     -10.0%      39899 =C2=B1  3%  numa-vmstat.node1.n=
r_active_file
     94710 =C2=B1  1%     -10.1%      85175 =C2=B1  4%  numa-vmstat.node1.n=
r_dirtied
     94375 =C2=B1  1%     -10.1%      84851 =C2=B1  5%  numa-vmstat.node1.n=
r_written
  15238374 =C2=B1100%    +178.2%   42391545 =C2=B1100%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
     70514 =C2=B1  0%      -8.8%      64327 =C2=B1  1%  latency_stats.hits.=
rpc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync=
_sequence.[nfsv4]._nfs4_proc_lookup.[nfsv4].nfs4_proc_lookup_common.[nfsv4]=
.nfs4_proc_lookup.[nfsv4].nfs_lookup_revalidate.nfs4_lookup_revalidate.look=
up_dcache.__lookup_hash
    164.00 =C2=B1141%  +12519.1%      20695 =C2=B1  6%  latency_stats.max.b=
lk_execute_rq.sg_io.scsi_cmd_ioctl.scsi_cmd_blk_ioctl.sd_ioctl.[sd_mod].blk=
dev_ioctl.block_ioctl.do_vfs_ioctl.SyS_ioctl.entry_SYSCALL_64_fastpath
  15238374 =C2=B1100%    +178.2%   42391545 =C2=B1100%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      4843 =C2=B1141%   +1639.1%      84223 =C2=B1 29%  latency_stats.sum.b=
lk_execute_rq.sg_io.scsi_cmd_ioctl.scsi_cmd_blk_ioctl.sd_ioctl.[sd_mod].blk=
dev_ioctl.block_ioctl.do_vfs_ioctl.SyS_ioctl.entry_SYSCALL_64_fastpath
      6826 =C2=B1141%    +557.4%      44879 =C2=B1 32%  latency_stats.sum.f=
lush_work.__cancel_work_timer.cancel_delayed_work_sync.disk_block_events.__=
blkdev_get.blkdev_get.blkdev_open.do_dentry_open.vfs_open.path_openat.do_fi=
lp_open.do_sys_open
  15238374 =C2=B1100%    +178.2%   42391545 =C2=B1100%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      5202 =C2=B1 11%     +18.6%       6168 =C2=B1  5%  sched_debug.cfs_rq[=
0]:/.exec_clock
      2249 =C2=B1 29%     -29.7%       1581 =C2=B1  4%  sched_debug.cfs_rq[=
10]:/.avg->runnable_avg_sum
     48.25 =C2=B1 29%     -30.2%      33.67 =C2=B1  5%  sched_debug.cfs_rq[=
10]:/.tg_runnable_contrib
    744.73 =C2=B1  6%     -27.7%     538.65 =C2=B1 11%  sched_debug.cfs_rq[=
14]:/.exec_clock
      2732 =C2=B1  7%     +18.0%       3224 =C2=B1  8%  sched_debug.cfs_rq[=
1]:/.exec_clock
    811.75 =C2=B1 45%    +124.5%       1822 =C2=B1 37%  sched_debug.cfs_rq[=
20]:/.avg->runnable_avg_sum
    289.50 =C2=B1 59%    +100.9%     581.67 =C2=B1 16%  sched_debug.cfs_rq[=
20]:/.blocked_load_avg
      3.33 =C2=B1 61%     +80.0%       6.00 =C2=B1 23%  sched_debug.cfs_rq[=
20]:/.nr_spread_over
    298.75 =C2=B1 60%     +95.6%     584.33 =C2=B1 15%  sched_debug.cfs_rq[=
20]:/.tg_load_contrib
     17.00 =C2=B1 47%    +127.5%      38.67 =C2=B1 37%  sched_debug.cfs_rq[=
20]:/.tg_runnable_contrib
      1772 =C2=B1 14%     +27.2%       2253 =C2=B1 17%  sched_debug.cfs_rq[=
3]:/.avg->runnable_avg_sum
    526.00 =C2=B1 35%     -49.3%     266.67 =C2=B1 40%  sched_debug.cfs_rq[=
4]:/.blocked_load_avg
    547.00 =C2=B1 31%     -52.3%     261.00 =C2=B1 44%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
     11.00 =C2=B1 44%     -60.6%       4.33 =C2=B1 39%  sched_debug.cfs_rq[=
9]:/.nr_spread_over
   -247.50 =C2=B1 -7%     +16.2%    -287.67 =C2=B1-10%  sched_debug.cpu#0.n=
r_uninterruptible
    -29.25 =C2=B1-37%    -110.3%       3.00 =C2=B1244%  sched_debug.cpu#1.n=
r_uninterruptible
     15992 =C2=B1  3%     +10.4%      17660 =C2=B1  3%  sched_debug.cpu#1.t=
twu_local
      9910 =C2=B1  6%     +29.7%      12854 =C2=B1  5%  sched_debug.cpu#15.=
nr_switches
      9912 =C2=B1  6%     +29.7%      12855 =C2=B1  5%  sched_debug.cpu#15.=
sched_count
      4129 =C2=B1  6%     +33.2%       5501 =C2=B1  8%  sched_debug.cpu#15.=
sched_goidle
      1461 =C2=B1 12%     +33.9%       1956 =C2=B1 16%  sched_debug.cpu#15.=
ttwu_local
     21421 =C2=B1  8%     -23.1%      16476 =C2=B1 16%  sched_debug.cpu#18.=
nr_switches
     21423 =C2=B1  8%     -23.1%      16479 =C2=B1 16%  sched_debug.cpu#18.=
sched_count
      8919 =C2=B1 10%     -23.9%       6787 =C2=B1 18%  sched_debug.cpu#18.=
sched_goidle
      3098 =C2=B1  4%     -19.8%       2484 =C2=B1  8%  sched_debug.cpu#18.=
ttwu_local
    980386 =C2=B1  2%      -7.5%     906703 =C2=B1  6%  sched_debug.cpu#20.=
avg_idle
     25056 =C2=B1 24%     -35.5%      16150 =C2=B1  5%  sched_debug.cpu#20.=
nr_switches
     25060 =C2=B1 24%     -35.5%      16154 =C2=B1  5%  sched_debug.cpu#20.=
sched_count
     10289 =C2=B1 33%     -35.6%       6626 =C2=B1  5%  sched_debug.cpu#20.=
sched_goidle
      3706 =C2=B1 16%     -31.6%       2533 =C2=B1  4%  sched_debug.cpu#20.=
ttwu_local
     10765 =C2=B1  3%      -7.4%       9970 =C2=B1  1%  sched_debug.cpu#21.=
nr_load_updates
     22777 =C2=B1 17%     -20.9%      18006 =C2=B1  6%  sched_debug.cpu#21.=
nr_switches
     22779 =C2=B1 17%     -20.9%      18008 =C2=B1  6%  sched_debug.cpu#21.=
sched_count
      3401 =C2=B1 17%     -21.3%       2678 =C2=B1  7%  sched_debug.cpu#21.=
ttwu_local
      3359 =C2=B1  8%     -17.8%       2761 =C2=B1 12%  sched_debug.cpu#22.=
ttwu_local
     21013 =C2=B1  7%     -20.3%      16754 =C2=B1 12%  sched_debug.cpu#23.=
nr_switches
     19.75 =C2=B1 30%     -52.7%       9.33 =C2=B1 43%  sched_debug.cpu#23.=
nr_uninterruptible
     21015 =C2=B1  7%     -20.3%      16757 =C2=B1 12%  sched_debug.cpu#23.=
sched_count
      8738 =C2=B1  9%     -20.9%       6910 =C2=B1 13%  sched_debug.cpu#23.=
sched_goidle

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/nr_=
threads/disk/fs/fs2/filesize/test_size/sync_method/nr_directories/nr_files_=
per_directory:
  nhm4/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/=
1x/32t/1HDD/f2fs/nfsv4/5K/400M/fsyncBeforeClose/16d/256fpd

commit: =

  2f008f5b6184088f3f435557f0592d876bda78b9
  59fe8231b68905f4ca5f7a115b1a675829016b53

2f008f5b6184088f 59fe8231b68905f4ca5f7a115b =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

  24073648 =C2=B1  2%     -20.1%   19225873 =C2=B1  6%  fsmark.app_overhead
    128.00 =C2=B1  0%      -5.0%     121.60 =C2=B1  0%  fsmark.files_per_sec
    639.91 =C2=B1  0%      +5.8%     676.92 =C2=B1  0%  fsmark.time.elapsed=
_time
    639.91 =C2=B1  0%      +5.8%     676.92 =C2=B1  0%  fsmark.time.elapsed=
_time.max
     88472 =C2=B1  0%     +14.1%     100955 =C2=B1  0%  fsmark.time.involun=
tary_context_switches
    374294 =C2=B1  0%      -2.7%     364099 =C2=B1  0%  fsmark.time.volunta=
ry_context_switches
     54180 =C2=B1  5%     +16.4%      63054 =C2=B1  6%  meminfo.DirectMap4k
     88472 =C2=B1  0%     +14.1%     100955 =C2=B1  0%  time.involuntary_co=
ntext_switches
     18369 =C2=B1  2%     -10.3%      16482 =C2=B1  2%  slabinfo.kmalloc-12=
8.active_objs
     19466 =C2=B1  2%      -8.0%      17905 =C2=B1  4%  slabinfo.kmalloc-12=
8.num_objs
      1.80 =C2=B1  0%      -5.2%       1.71 =C2=B1  0%  turbostat.%Busy
     52.50 =C2=B1  0%      -5.4%      49.67 =C2=B1  0%  turbostat.Avg_MHz
     19.30 =C2=B1  0%     +11.7%      21.56 =C2=B1  0%  turbostat.CPU%c1
      1590 =C2=B1  0%      -5.0%       1511 =C2=B1  0%  vmstat.io.bo
     22896 =C2=B1  0%      -4.0%      21990 =C2=B1  0%  vmstat.system.cs
      7893 =C2=B1  0%      -5.9%       7428 =C2=B1  0%  vmstat.system.in
 4.168e+08 =C2=B1  0%     +19.5%  4.981e+08 =C2=B1  0%  cpuidle.C1-NHM.time
  83043899 =C2=B1  0%     +24.4%  1.033e+08 =C2=B1  1%  cpuidle.C1E-NHM.time
     84577 =C2=B1  1%     +24.1%     104956 =C2=B1  0%  cpuidle.C1E-NHM.usa=
ge
      1327 =C2=B1  7%     +14.2%       1516 =C2=B1  4%  cpuidle.POLL.usage
     75953 =C2=B1  0%     +10.2%      83669 =C2=B1  0%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[nfs=
v4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.=
[nfsv4].nfs_atomic_open.path_openat.do_filp_open.do_sys_open.SyS_open.entry=
_SYSCALL_64_fastpath
   1356468 =C2=B1  0%      +4.5%    1416945 =C2=B1  0%  latency_stats.sum.d=
o_wait.SyS_wait4.entry_SYSCALL_64_fastpath
  48762209 =C2=B1 89%     -71.4%   13924614 =C2=B1 70%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
   2460268 =C2=B1  0%      +4.3%    2566834 =C2=B1  0%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
  18440643 =C2=B1  3%     -24.9%   13841944 =C2=B1  5%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_lookup.[nfsv4].nfs4_proc_lookup_common.[nfsv4].=
nfs4_proc_lookup.[nfsv4].nfs_lookup_revalidate.nfs4_lookup_revalidate.looku=
p_dcache.__lookup_hash
 5.926e+09 =C2=B1  0%      +3.3%  6.124e+09 =C2=B1  0%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_do_close.[nfsv4]._=
_nfs4_close.[nfsv4].nfs4_close_sync.[nfsv4].nfs4_close_context.[nfsv4].__pu=
t_nfs_open_context.nfs_release.nfs_file_release.__fput.____fput.task_work_r=
un
 6.254e+09 =C2=B1  0%     +10.2%  6.889e+09 =C2=B1  0%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[nfs=
v4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.=
[nfsv4].nfs_atomic_open.path_openat.do_filp_open.do_sys_open.SyS_open.entry=
_SYSCALL_64_fastpath
 4.629e+09 =C2=B1  0%      +7.0%  4.951e+09 =C2=B1  0%  latency_stats.sum.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_write_and_wait_range.nfs4_f=
ile_fsync.[nfsv4].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastp=
ath
    401.75 =C2=B1  5%      -9.3%     364.33 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
    405.00 =C2=B1  5%      -9.4%     367.00 =C2=B1  4%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
    407.75 =C2=B1  5%      -9.4%     369.33 =C2=B1  4%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
      4097 =C2=B1  6%     +15.9%       4747 =C2=B1  1%  sched_debug.cfs_rq[=
3]:/.min_vruntime
      4.33 =C2=B1 71%    +300.0%      17.33 =C2=B1 24%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
    411.25 =C2=B1  5%      -9.2%     373.33 =C2=B1  3%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
    426.00 =C2=B1 45%    +205.6%       1301 =C2=B1 43%  sched_debug.cfs_rq[=
5]:/.blocked_load_avg
    434.50 =C2=B1 44%    +200.4%       1305 =C2=B1 43%  sched_debug.cfs_rq[=
5]:/.tg_load_contrib
     40927 =C2=B1  6%     +36.6%      55890 =C2=B1  5%  sched_debug.cpu#0.n=
r_load_updates
    704201 =C2=B1 78%    +260.9%    2541162 =C2=B1 20%  sched_debug.cpu#0.n=
r_switches
     -3973 =C2=B1  0%      -9.1%      -3614 =C2=B1  0%  sched_debug.cpu#0.n=
r_uninterruptible
    704467 =C2=B1 78%    +260.8%    2541407 =C2=B1 20%  sched_debug.cpu#0.s=
ched_count
    283563 =C2=B1 96%    +322.9%    1199297 =C2=B1 21%  sched_debug.cpu#0.s=
ched_goidle
    466777 =C2=B1 57%    +208.6%    1440632 =C2=B1 19%  sched_debug.cpu#0.t=
twu_count
    290893 =C2=B1 95%    +317.8%    1215231 =C2=B1 21%  sched_debug.cpu#0.t=
twu_local
      4.75 =C2=B1 40%     -64.9%       1.67 =C2=B1101%  sched_debug.cpu#1.c=
pu_load[1]
      5.25 =C2=B1 36%     -68.3%       1.67 =C2=B1 74%  sched_debug.cpu#1.c=
pu_load[2]
      7.50 =C2=B1 73%     -73.3%       2.00 =C2=B1 81%  sched_debug.cpu#2.c=
pu_load[2]
      6.00 =C2=B1 42%     -55.6%       2.67 =C2=B1 63%  sched_debug.cpu#2.c=
pu_load[3]
      5.00 =C2=B1 20%     -40.0%       3.00 =C2=B1 47%  sched_debug.cpu#2.c=
pu_load[4]
    441.50 =C2=B1  7%     +27.1%     561.33 =C2=B1  6%  sched_debug.cpu#2.n=
r_uninterruptible
     58471 =C2=B1  0%     +11.7%      65289 =C2=B1  1%  sched_debug.cpu#2.t=
twu_local
    403.50 =C2=B1 13%     +32.1%     533.00 =C2=B1  9%  sched_debug.cpu#3.n=
r_uninterruptible
    529.75 =C2=B1  7%     -46.3%     284.33 =C2=B1  4%  sched_debug.cpu#5.n=
r_uninterruptible
     34.00 =C2=B1141%   +7756.9%       2671 =C2=B1127%  sched_debug.cpu#6.l=
oad
    527.50 =C2=B1  5%     -42.6%     302.67 =C2=B1  6%  sched_debug.cpu#6.n=
r_uninterruptible
    555.50 =C2=B1  4%     -46.7%     296.00 =C2=B1  1%  sched_debug.cpu#7.n=
r_uninterruptible
   1030379 =C2=B1 99%     -97.8%      22439 =C2=B1  0%  sched_debug.cpu#7.t=
twu_local

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/nr_=
threads/disk/fs/fs2/filesize/test_size/sync_method/nr_directories/nr_files_=
per_directory:
  nhm4/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/=
1x/32t/1HDD/f2fs/nfsv4/8K/400M/fsyncBeforeClose/16d/256fpd

commit: =

  2f008f5b6184088f3f435557f0592d876bda78b9
  59fe8231b68905f4ca5f7a115b1a675829016b53

2f008f5b6184088f 59fe8231b68905f4ca5f7a115b =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

  15540360 =C2=B1  8%     -18.7%   12633119 =C2=B1  5%  fsmark.app_overhead
    118.40 =C2=B1  0%      -5.4%     112.00 =C2=B1  0%  fsmark.files_per_sec
    436.94 =C2=B1  0%      +4.9%     458.34 =C2=B1  0%  fsmark.time.elapsed=
_time
    436.94 =C2=B1  0%      +4.9%     458.34 =C2=B1  0%  fsmark.time.elapsed=
_time.max
     55494 =C2=B1  0%     +14.5%      63515 =C2=B1  0%  fsmark.time.involun=
tary_context_switches
    234664 =C2=B1  0%      -2.8%     228125 =C2=B1  0%  fsmark.time.volunta=
ry_context_switches
      1871 =C2=B1  8%      -8.0%       1720 =C2=B1  5%  slabinfo.proc_inode=
_cache.num_objs
     55494 =C2=B1  0%     +14.5%      63515 =C2=B1  0%  time.involuntary_co=
ntext_switches
 2.794e+08 =C2=B1  1%     +18.7%  3.317e+08 =C2=B1  1%  cpuidle.C1-NHM.time
  51201346 =C2=B1  2%     +24.3%   63637344 =C2=B1  2%  cpuidle.C1E-NHM.time
     52453 =C2=B1  0%     +23.8%      64952 =C2=B1  0%  cpuidle.C1E-NHM.usa=
ge
      1.86 =C2=B1  0%      -4.3%       1.77 =C2=B1  0%  turbostat.%Busy
     55.00 =C2=B1  0%      -3.6%      53.00 =C2=B1  0%  turbostat.Avg_MHz
     18.82 =C2=B1  1%     +12.1%      21.10 =C2=B1  1%  turbostat.CPU%c1
      1454 =C2=B1  0%      -4.2%       1393 =C2=B1  0%  vmstat.io.bo
     28806 =C2=B1  0%      -3.4%      27821 =C2=B1  0%  vmstat.system.cs
     11085 =C2=B1  0%      -4.8%      10553 =C2=B1  0%  vmstat.system.in
  13502037 =C2=B1171%     -88.6%    1537756 =C2=B1141%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
     75526 =C2=B1  0%      +9.7%      82875 =C2=B1  0%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[nfs=
v4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.=
[nfsv4].nfs_atomic_open.path_openat.do_filp_open.do_sys_open.SyS_open.entry=
_SYSCALL_64_fastpath
  21836955 =C2=B1171%     -93.0%    1537756 =C2=B1141%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
    946840 =C2=B1  0%      +4.0%     984300 =C2=B1  0%  latency_stats.sum.d=
o_wait.SyS_wait4.entry_SYSCALL_64_fastpath
  26885081 =C2=B1172%     -94.3%    1537756 =C2=B1141%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
   1699379 =C2=B1  0%      +3.6%    1760791 =C2=B1  0%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
  11574601 =C2=B1  6%     -22.9%    8922270 =C2=B1  4%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_lookup.[nfsv4].nfs4_proc_lookup_common.[nfsv4].=
nfs4_proc_lookup.[nfsv4].nfs_lookup_revalidate.nfs4_lookup_revalidate.looku=
p_dcache.__lookup_hash
 3.694e+09 =C2=B1  0%      +2.9%  3.799e+09 =C2=B1  0%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_do_close.[nfsv4]._=
_nfs4_close.[nfsv4].nfs4_close_sync.[nfsv4].nfs4_close_context.[nfsv4].__pu=
t_nfs_open_context.nfs_release.nfs_file_release.__fput.____fput.task_work_r=
un
 3.898e+09 =C2=B1  0%      +9.7%  4.278e+09 =C2=B1  0%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[nfs=
v4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.=
[nfsv4].nfs_atomic_open.path_openat.do_filp_open.do_sys_open.SyS_open.entry=
_SYSCALL_64_fastpath
 2.886e+09 =C2=B1  0%      +6.4%  3.072e+09 =C2=B1  0%  latency_stats.sum.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_write_and_wait_range.nfs4_f=
ile_fsync.[nfsv4].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastp=
ath
      7.00 =C2=B1 20%     +39.3%       9.75 =C2=B1  8%  sched_debug.cfs_rq[=
0]:/.nr_spread_over
      2721 =C2=B1  8%     -13.7%       2348 =C2=B1  6%  sched_debug.cfs_rq[=
3]:/.avg->runnable_avg_sum
     20.00 =C2=B1 65%     -93.8%       1.25 =C2=B1173%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
     -1880 =C2=B1-10%     +20.1%      -2258 =C2=B1 -4%  sched_debug.cfs_rq[=
3]:/.spread0
     59.00 =C2=B1  8%     -14.0%      50.75 =C2=B1  7%  sched_debug.cfs_rq[=
3]:/.tg_runnable_contrib
     15.75 =C2=B1 14%     -27.0%      11.50 =C2=B1 15%  sched_debug.cfs_rq[=
6]:/.nr_spread_over
    706214 =C2=B1 10%     +18.3%     835635 =C2=B1  4%  sched_debug.cpu#0.a=
vg_idle
     -2419 =C2=B1 -1%     -19.3%      -1952 =C2=B1 -1%  sched_debug.cpu#0.n=
r_uninterruptible
     99659 =C2=B1 13%   +1470.7%    1565321 =C2=B1 93%  sched_debug.cpu#2.t=
twu_count
    212.25 =C2=B1 13%     +38.5%     294.00 =C2=B1  5%  sched_debug.cpu#3.n=
r_uninterruptible
      3.50 =C2=B1 91%    +114.3%       7.50 =C2=B1 40%  sched_debug.cpu#5.c=
pu_load[3]
    342.00 =C2=B1  6%     -55.0%     154.00 =C2=B1 11%  sched_debug.cpu#5.n=
r_uninterruptible
    328.75 =C2=B1  5%     -47.8%     171.50 =C2=B1 12%  sched_debug.cpu#6.n=
r_uninterruptible
     17166 =C2=B1 16%     -18.4%      14001 =C2=B1  3%  sched_debug.cpu#7.n=
r_load_updates
    465509 =C2=B1104%     -72.1%     129808 =C2=B1 28%  sched_debug.cpu#7.n=
r_switches
    342.25 =C2=B1  1%     -52.6%     162.25 =C2=B1  9%  sched_debug.cpu#7.n=
r_uninterruptible
    465602 =C2=B1104%     -72.1%     129920 =C2=B1 28%  sched_debug.cpu#7.s=
ched_count
    223413 =C2=B1109%     -74.5%      56970 =C2=B1 32%  sched_debug.cpu#7.s=
ched_goidle
    166932 =C2=B1157%     -92.8%      12041 =C2=B1  4%  sched_debug.cpu#7.t=
twu_local


lkp-ws02: Westmere-EP
Memory: 16G

nhm4: Nehalem
Memory: 4G

                                turbostat.Avg_MHz

  60 ++--------------------------------------------------------------------=
-+
     *..*..*      *..*..*...*..*..*..*...*..*..*..*..*...*..*..*           =
 |
  50 O+ O  O   O  O  O  O   O  O  O  O   O  O  O  O  O   O  O  O  O   O  O =
 O
     |      :     :                                                        =
 |
     |      :    :                                                         =
 |
  40 ++     :    :                                                         =
 |
     |       :   :                                                         =
 |
  30 ++      :   :                                                         =
 |
     |       :  :                                                          =
 |
  20 ++      :  :                                                          =
 |
     |        : :                                                          =
 |
     |        : :                                                          =
 |
  10 ++       ::                                                           =
 |
     |         :                                                           =
 |
   0 ++--------*-----------------------------------------------------------=
-+


                                  turbostat.%Busy

    2 ++-------------------------------------------------------------------=
-+
  1.8 *+.*..*      *..*..*..*..*...*..*..*..*..*...*..*..*..*..*           =
 |
      O  O  O   O  O  O  O  O  O   O  O  O  O  O   O  O  O  O  O  O   O  O =
 O
  1.6 ++     :     :                                                       =
 |
  1.4 ++     :    :                                                        =
 |
      |      :    :                                                        =
 |
  1.2 ++      :   :                                                        =
 |
    1 ++      :   :                                                        =
 |
  0.8 ++      :  :                                                         =
 |
      |       :  :                                                         =
 |
  0.6 ++       : :                                                         =
 |
  0.4 ++       : :                                                         =
 |
      |        ::                                                          =
 |
  0.2 ++        :                                                          =
 |
    0 ++--------*----------------------------------------------------------=
-+


                               fsmark.files_per_sec

  120 *+-*--*------*--*--*--*--*---------*-----*---*--*--*--*--*-----------=
-+
      O  O  O   O  O  O  O  O  O   O..O. O  O. O   O  O  O  O  O  O   O  O =
 O
  100 ++     :     :                                                       =
 |
      |      :    :                                                        =
 |
      |      :    :                                                        =
 |
   80 ++     :    :                                                        =
 |
      |       :   :                                                        =
 |
   60 ++      :   :                                                        =
 |
      |       :  :                                                         =
 |
   40 ++       : :                                                         =
 |
      |        : :                                                         =
 |
      |        : :                                                         =
 |
   20 ++       ::                                                          =
 |
      |         :                                                          =
 |
    0 ++--------*----------------------------------------------------------=
-+


                             fsmark.time.elapsed_time

  500 ++-------------------------------------------------------------------=
-+
  450 O+ O  O   O  O  O  O  O  O   O  O  O  O  O   O  O  O  O  O  O   O  O =
 O
      *..*..*      *..*..*..*..*...*..*..*..*..*...*..*..*..*..*           =
 |
  400 ++    :      :                                                       =
 |
  350 ++     :     :                                                       =
 |
      |      :    :                                                        =
 |
  300 ++     :    :                                                        =
 |
  250 ++      :   :                                                        =
 |
  200 ++      :   :                                                        =
 |
      |       :  :                                                         =
 |
  150 ++       : :                                                         =
 |
  100 ++       : :                                                         =
 |
      |        : :                                                         =
 |
   50 ++        :                                                          =
 |
    0 ++--------*----------------------------------------------------------=
-+


                           fsmark.time.elapsed_time.max

  500 ++-------------------------------------------------------------------=
-+
  450 O+ O  O   O  O  O  O  O  O   O  O  O  O  O   O  O  O  O  O  O   O  O =
 O
      *..*..*      *..*..*..*..*...*..*..*..*..*...*..*..*..*..*           =
 |
  400 ++    :      :                                                       =
 |
  350 ++     :     :                                                       =
 |
      |      :    :                                                        =
 |
  300 ++     :    :                                                        =
 |
  250 ++      :   :                                                        =
 |
  200 ++      :   :                                                        =
 |
      |       :  :                                                         =
 |
  150 ++       : :                                                         =
 |
  100 ++       : :                                                         =
 |
      |        : :                                                         =
 |
   50 ++        :                                                          =
 |
    0 ++--------*----------------------------------------------------------=
-+


                       fsmark.time.voluntary_context_switches

  250000 ++----------------------------------------------------------------=
-+
         O..O..O  O  O..O..O..O..O..O..O...O..O..O..O..O..O..O..O  O  O  O =
 O
         |     :     :                                                     =
 |
  200000 ++    :     :                                                     =
 |
         |      :   :                                                      =
 |
         |      :   :                                                      =
 |
  150000 ++     :   :                                                      =
 |
         |      :   :                                                      =
 |
  100000 ++      : :                                                       =
 |
         |       : :                                                       =
 |
         |       : :                                                       =
 |
   50000 ++      : :                                                       =
 |
         |        :                                                        =
 |
         |        :                                                        =
 |
       0 ++-------*--------------------------------------------------------=
-+


                      fsmark.time.involuntary_context_switches

  70000 ++-----------------------------------------------------------------=
-+
        O  O  O  O  O  O   O  O  O  O  O  O  O  O  O  O  O   O  O  O  O  O =
 O
  60000 ++                                                                 =
 |
        *..*..*     *..*...*..*..*..*..*..*..*..*..*..*..*...*..*          =
 |
  50000 ++    :     :                                                      =
 |
        |      :   :                                                       =
 |
  40000 ++     :   :                                                       =
 |
        |      :   :                                                       =
 |
  30000 ++     :   :                                                       =
 |
        |       : :                                                        =
 |
  20000 ++      : :                                                        =
 |
        |       : :                                                        =
 |
  10000 ++      : :                                                        =
 |
        |        :                                                         =
 |
      0 ++-------*---------------------------------------------------------=
-+

                                   vmstat.io.bo

  1600 ++------------------------------------------------------------------=
-+
       *..*..*      *..*..*..*..*..*..*...*..*..*..*..*..*..*..*           =
 |
  1400 O+ O  O  O   O  O  O  O  O  O  O   O  O  O  O  O  O  O  O   O  O  O =
 O
  1200 ++    :     :                                                       =
 |
       |      :    :                                                       =
 |
  1000 ++     :    :                                                       =
 |
       |      :   :                                                        =
 |
   800 ++     :   :                                                        =
 |
       |       :  :                                                        =
 |
   600 ++      :  :                                                        =
 |
   400 ++      : :                                                         =
 |
       |       : :                                                         =
 |
   200 ++       ::                                                         =
 |
       |        :                                                          =
 |
     0 ++-------*----------------------------------------------------------=
-+


                                  vmstat.system.in

  12000 ++-----------------------------------------------------------------=
-+
        *..*..*     *..*...*..*..*..*..*..*..*..*..*..*..*...*..*          =
 |
  10000 O+ O  O  O  O  O   O  O  O  O  O  O  O  O  O  O  O   O  O  O  O  O =
 O
        |     :     :                                                      =
 |
        |      :   :                                                       =
 |
   8000 ++     :   :                                                       =
 |
        |      :   :                                                       =
 |
   6000 ++     :   :                                                       =
 |
        |       : :                                                        =
 |
   4000 ++      : :                                                        =
 |
        |       : :                                                        =
 |
        |       : :                                                        =
 |
   2000 ++       :                                                         =
 |
        |        :                                                         =
 |
      0 ++-------*---------------------------------------------------------=
-+


                       sched_debug.cpu#0.nr_uninterruptible

     0 ++-------*----------------------------------------------------------=
-+
       |        :                                                          =
 |
       |        ::                                                         =
 |
  -500 ++      : :                                                         =
 |
       |       : :                                                         =
 |
       |       :  :                                                        =
 |
 -1000 ++      :  :                                                        =
 |
       |      :   :                                                        =
 |
 -1500 ++     :   :                                                        =
 |
       |      :    :                                                       =
 |
       |      :    :                                                       =
 |
 -2000 O+    O  O  :O     O  O  O  O  O   O  O     O  O  O  O  O   O  O  O =
 O
       |  O  :      :  O                        O                          =
 |
       *..*..*      *..*..*..*..*..*..*...*..*..*..*..*..*..               =
 |
 -2500 ++---------------------------------------------------*--*-----------=
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

--===============4232413532421615472==
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
dGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogYmEwZmUwZTg1NjIx
ZDdjZjM5NDU1MzZmZWM4MGMwZjc5MzI4YzczYQptb2RlbDogTmVoYWxlbQpucl9jcHU6IDgKbWVt
b3J5OiA0RwpoZGRfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtV0RDX1dEMTAwM0ZC
WVotMDEwRkIwX1dELVdDQVczNjgxMjA0MS1wYXJ0MSIKc3dhcF9wYXJ0aXRpb25zOiAiL2Rldi9k
aXNrL2J5LWlkL2F0YS1XRENfV0QxMDAzRkJZWi0wMTBGQjBfV0QtV0NBVzM2ODEyMDQxLXBhcnQy
Igpyb290ZnNfcGFydGl0aW9uOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1XRENfV0QxMDAzRkJZWi0w
MTBGQjBfV0QtV0NBVzM2ODEyMDQxLXBhcnQzIgpuZXRjb25zb2xlX3BvcnQ6IDY2NDkKY2F0ZWdv
cnk6IGJlbmNobWFyawppdGVyYXRpb25zOiAxeApucl90aHJlYWRzOiAzMnQKZGlzazogMUhERApm
czogZjJmcwpmczI6IG5mc3Y0CmZzbWFyazoKICBmaWxlc2l6ZTogOEsKICB0ZXN0X3NpemU6IDQw
ME0KICBzeW5jX21ldGhvZDogZnN5bmNCZWZvcmVDbG9zZQogIG5yX2RpcmVjdG9yaWVzOiAxNmQK
ICBucl9maWxlc19wZXJfZGlyZWN0b3J5OiAyNTZmcGQKcXVldWU6IGN5Y2xpYwp0ZXN0Ym94OiBu
aG00CnRib3hfZ3JvdXA6IG5obTQKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAy
MDE1LTA3LTI5IDIwOjU0OjQwLjI0ODE2NTEwOCArMDg6MDAKaWQ6IDBkZGNiMDFkYTc3YTkzMjdm
MmQzZjlmNTAyOGYyMGE0M2EzNDBhZjQKdXNlcjogbGtwCmNvbXBpbGVyOiBnY2MtNC45CmhlYWRf
Y29tbWl0OiBiYTBmZTBlODU2MjFkN2NmMzk0NTUzNmZlYzgwYzBmNzkzMjhjNzNhCmJhc2VfY29t
bWl0OiBjYmZlOGZhNmNkNjcyMDExYzc1NWMzY2Q4NWM5ZmZkNGUyZDEwYTZmCmJyYW5jaDogbGlu
dXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUwNzMxMTgKa2VybmVsOiAiL3BrZy9saW51eC94ODZf
NjQtcmhlbC9nY2MtNC45L2JhMGZlMGU4NTYyMWQ3Y2YzOTQ1NTM2ZmVjODBjMGY3OTMyOGM3M2Ev
dm1saW51ei00LjIuMC1yYzQtMDI3MjgtZ2JhMGZlMGUiCnJvb3RmczogZGViaWFuLXg4Nl82NC0y
MDE1LTAyLTA3LmNnegpyZXN1bHRfcm9vdDogIi9yZXN1bHQvZnNtYXJrL3BlcmZvcm1hbmNlLTF4
LTMydC0xSERELWYyZnMtbmZzdjQtOEstNDAwTS1mc3luY0JlZm9yZUNsb3NlLTE2ZC0yNTZmcGQv
bmhtNC9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvYmEw
ZmUwZTg1NjIxZDdjZjM5NDU1MzZmZWM4MGMwZjc5MzI4YzczYS8wIgpqb2JfZmlsZTogIi9sa3Av
c2NoZWR1bGVkL25obTQvY3ljbGljX2ZzbWFyay1wZXJmb3JtYW5jZS0xeC0zMnQtMUhERC1mMmZz
LW5mc3Y0LThLLTQwME0tZnN5bmNCZWZvcmVDbG9zZS0xNmQtMjU2ZnBkLXg4Nl82NC1yaGVsLUNZ
Q0xJQ19IRUFELWJhMGZlMGU4NTYyMWQ3Y2YzOTQ1NTM2ZmVjODBjMGY3OTMyOGM3M2EtMjAxNTA3
MjktOTc5ODEtMXBmbm9rbi0wLnlhbWwiCmRlcXVldWVfdGltZTogMjAxNS0wOC0wMSAwMDo1Njox
MS42Mjk3OTU3ODggKzA4OjAwCm1heF91cHRpbWU6IDE1MzQuMDYKaW5pdHJkOiAiL29zaW1hZ2Uv
ZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgot
IHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQvbmhtNC9jeWNs
aWNfZnNtYXJrLXBlcmZvcm1hbmNlLTF4LTMydC0xSERELWYyZnMtbmZzdjQtOEstNDAwTS1mc3lu
Y0JlZm9yZUNsb3NlLTE2ZC0yNTZmcGQteDg2XzY0LXJoZWwtQ1lDTElDX0hFQUQtYmEwZmUwZTg1
NjIxZDdjZjM5NDU1MzZmZWM4MGMwZjc5MzI4YzczYS0yMDE1MDcyOS05Nzk4MS0xcGZub2tuLTAu
eWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD1saW51eC1k
ZXZlbC9kZXZlbC1ob3VybHktMjAxNTA3MzExOAotIGNvbW1pdD1iYTBmZTBlODU2MjFkN2NmMzk0
NTUzNmZlYzgwYzBmNzkzMjhjNzNhCi0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVs
L2djYy00LjkvYmEwZmUwZTg1NjIxZDdjZjM5NDU1MzZmZWM4MGMwZjc5MzI4YzczYS92bWxpbnV6
LTQuMi4wLXJjNC0wMjcyOC1nYmEwZmUwZQotIG1heF91cHRpbWU9MTUzNAotIFJFU1VMVF9ST09U
PS9yZXN1bHQvZnNtYXJrL3BlcmZvcm1hbmNlLTF4LTMydC0xSERELWYyZnMtbmZzdjQtOEstNDAw
TS1mc3luY0JlZm9yZUNsb3NlLTE2ZC0yNTZmcGQvbmhtNC9kZWJpYW4teDg2XzY0LTIwMTUtMDIt
MDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvYmEwZmUwZTg1NjIxZDdjZjM5NDU1MzZmZWM4MGMw
Zjc5MzI4YzczYS8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8LQogIGxpYmF0YS5mb3JjZT0xLjVHYnBz
CgogIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1
ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxf
dGltZW91dD0xMDAKICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBh
bmljIG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9
dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIv
bGtwL2xrcC9sa3AteDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82
NC1yaGVsL2djYy00LjkvYmEwZmUwZTg1NjIxZDdjZjM5NDU1MzZmZWM4MGMwZjc5MzI4YzczYS9t
b2R1bGVzLmNneiIKYm1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUt
MDItMDcuY2d6L2xrcC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcu
Y2d6L3J1bi1pcGNvbmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDIt
MDcuY2d6L3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL29zaW1h
Z2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2ZzLmNneiwvb3NpbWFnZS9kZXBz
L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovZnMyLmNneiwvbGtwL2JlbmNobWFya3MvZnNt
YXJrLmNneiIKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiAzOS41MyAzMC42OSAxNS4wNyAx
LzE3MSA2ODYxCnN0YXJ0X3RpbWU6ICcxNDM4MzYyNTEyJwplbmRfdGltZTogJzE0MzgzNjI5NzAn
CnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTUwNzMxLTE0MTgwMyIK

--===============4232413532421615472==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgpta2ZzIC10IGYyZnMgL2Rldi9zZGExCm1vdW50IC10IGYyZnMgL2Rldi9z
ZGExIC9mcy9zZGExCi9ldGMvaW5pdC5kL3JwY2JpbmQgc3RhcnQKL2V0Yy9pbml0LmQvbmZzLWNv
bW1vbiBzdGFydAovZXRjL2luaXQuZC9uZnMta2VybmVsLXNlcnZlciBzdGFydAptb3VudCAtdCBu
ZnMgLW8gdmVycz00IGxvY2FsaG9zdDovZnMvc2RhMSAvbmZzL3NkYTEKLi9mc19tYXJrIC1kIC9u
ZnMvc2RhMS8xIC1kIC9uZnMvc2RhMS8yIC1kIC9uZnMvc2RhMS8zIC1kIC9uZnMvc2RhMS80IC1k
IC9uZnMvc2RhMS81IC1kIC9uZnMvc2RhMS82IC1kIC9uZnMvc2RhMS83IC1kIC9uZnMvc2RhMS84
IC1kIC9uZnMvc2RhMS85IC1kIC9uZnMvc2RhMS8xMCAtZCAvbmZzL3NkYTEvMTEgLWQgL25mcy9z
ZGExLzEyIC1kIC9uZnMvc2RhMS8xMyAtZCAvbmZzL3NkYTEvMTQgLWQgL25mcy9zZGExLzE1IC1k
IC9uZnMvc2RhMS8xNiAtZCAvbmZzL3NkYTEvMTcgLWQgL25mcy9zZGExLzE4IC1kIC9uZnMvc2Rh
MS8xOSAtZCAvbmZzL3NkYTEvMjAgLWQgL25mcy9zZGExLzIxIC1kIC9uZnMvc2RhMS8yMiAtZCAv
bmZzL3NkYTEvMjMgLWQgL25mcy9zZGExLzI0IC1kIC9uZnMvc2RhMS8yNSAtZCAvbmZzL3NkYTEv
MjYgLWQgL25mcy9zZGExLzI3IC1kIC9uZnMvc2RhMS8yOCAtZCAvbmZzL3NkYTEvMjkgLWQgL25m
cy9zZGExLzMwIC1kIC9uZnMvc2RhMS8zMSAtZCAvbmZzL3NkYTEvMzIgLUQgMTYgLU4gMjU2IC1u
IDE2MDAgLUwgMSAtUyAxIC1zIDgxOTIK

--===============4232413532421615472==--

