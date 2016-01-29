Content-Type: multipart/mixed; boundary="===============4213351331291803217=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [pipe] 759c01142a: -51.5% hackbench.throughput
Date: Fri, 29 Jan 2016 11:19:48 +0800
Message-ID: <87h9hxm5rf.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4213351331291803217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 759c01142a5d0f364a462346168a56de28a80f52 ("pipe: limit the per-user =
amount of pages allocated in pipes")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/ipc/kconfig/mode/nr_threads/rootfs/tbox_group/tes=
tcase:
  gcc-4.9/performance/pipe/x86_64-rhel/threads/1600%/debian-x86_64-2015-02-=
07.cgz/lkp-wsx02/hackbench

commit: =

  558041d8d21b48287224dd0e32cf19563c77607c
  759c01142a5d0f364a462346168a56de28a80f52

558041d8d21b4828 759c01142a5d0f364a46234616 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    219967 =C2=B1  4%     -51.5%     106583 =C2=B1  1%  hackbench.throughput
 5.319e+08 =C2=B1 11%     -19.7%  4.273e+08 =C2=B1  0%  hackbench.time.invo=
luntary_context_switches
   2422668 =C2=B1  9%     -36.4%    1540731 =C2=B1  2%  hackbench.time.mino=
r_page_faults
      7127 =C2=B1 11%      +9.4%       7800 =C2=B1  0%  hackbench.time.perc=
ent_of_cpu_this_job_got
     42924 =C2=B1  9%     +11.9%      48049 =C2=B1  1%  hackbench.time.syst=
em_time
      1665 =C2=B1 11%     -49.3%     844.05 =C2=B1  1%  hackbench.time.user=
_time
    534.25 =C2=B1 55%    +298.5%       2129 =C2=B1 67%  numa-meminfo.node3.=
AnonHugePages
      8581 =C2=B1 57%     -48.4%       4427 =C2=B1  1%  uptime.idle
   5705345 =C2=B1 13%     +58.8%    9061490 =C2=B1  5%  softirqs.RCU
    279868 =C2=B1  8%     +20.4%     336916 =C2=B1  1%  softirqs.SCHED
     26.75 =C2=B1 23%    +245.8%      92.50 =C2=B1 39%  vmstat.procs.b
      9809 =C2=B1 13%     -64.7%       3463 =C2=B1  7%  vmstat.procs.r
    284320 =C2=B1 13%     -45.9%     153686 =C2=B1  1%  vmstat.system.in
    114.00 =C2=B1 10%     -50.9%      56.00 =C2=B1  0%  time.file_system_ou=
tputs
 5.319e+08 =C2=B1 11%     -19.7%  4.273e+08 =C2=B1  0%  time.involuntary_co=
ntext_switches
   2422668 =C2=B1  9%     -36.4%    1540731 =C2=B1  2%  time.minor_page_fau=
lts
      1665 =C2=B1 11%     -49.3%     844.05 =C2=B1  1%  time.user_time
     89.86 =C2=B1 10%      +8.9%      97.84 =C2=B1  0%  turbostat.%Busy
      2270 =C2=B1 10%      +8.9%       2471 =C2=B1  0%  turbostat.Avg_MHz
      1.45 =C2=B1  8%     -52.6%       0.69 =C2=B1  9%  turbostat.CPU%c1
      0.17 =C2=B1 13%     -52.2%       0.08 =C2=B1 34%  turbostat.CPU%c3
      8.53 =C2=B1116%     -83.7%       1.39 =C2=B1  3%  turbostat.CPU%c6
  63583716 =C2=B1 16%     -98.1%    1183913 =C2=B1 53%  numa-numastat.node0=
.local_node
  63587769 =C2=B1 16%     -98.1%    1189061 =C2=B1 53%  numa-numastat.node0=
.numa_hit
  69989955 =C2=B1  6%     -96.8%    2239323 =C2=B1  8%  numa-numastat.node1=
.local_node
  69995282 =C2=B1  6%     -96.8%    2244474 =C2=B1  8%  numa-numastat.node1=
.numa_hit
  56620071 =C2=B1 22%     -97.3%    1520012 =C2=B1 32%  numa-numastat.node2=
.local_node
  56625301 =C2=B1 22%     -97.3%    1522594 =C2=B1 31%  numa-numastat.node2=
.numa_hit
  63753303 =C2=B1 22%     -96.1%    2508634 =C2=B1 14%  numa-numastat.node3=
.local_node
  63754612 =C2=B1 22%     -96.1%    2511213 =C2=B1 14%  numa-numastat.node3=
.numa_hit
  32233121 =C2=B1 15%     -97.4%     830659 =C2=B1 60%  numa-vmstat.node0.n=
uma_hit
  32193958 =C2=B1 15%     -97.5%     790185 =C2=B1 63%  numa-vmstat.node0.n=
uma_local
  35020615 =C2=B1 10%     -96.4%    1253289 =C2=B1  8%  numa-vmstat.node1.n=
uma_hit
  34968563 =C2=B1 10%     -96.6%    1201078 =C2=B1  9%  numa-vmstat.node1.n=
uma_local
  30394713 =C2=B1 14%     -97.2%     843134 =C2=B1 31%  numa-vmstat.node2.n=
uma_hit
  30373607 =C2=B1 14%     -97.3%     824676 =C2=B1 31%  numa-vmstat.node2.n=
uma_local
  32334081 =C2=B1 21%     -95.5%    1469250 =C2=B1 16%  numa-vmstat.node3.n=
uma_hit
  32286373 =C2=B1 21%     -95.6%    1420300 =C2=B1 16%  numa-vmstat.node3.n=
uma_local
 1.868e+08 =C2=B1 11%     -51.0%   91569694 =C2=B1 13%  cpuidle.C1-NHM.time
   1743049 =C2=B1 10%     -34.6%    1139878 =C2=B1 11%  cpuidle.C1-NHM.usage
 1.918e+08 =C2=B1 12%     -49.7%   96433830 =C2=B1 11%  cpuidle.C1E-NHM.time
   1243978 =C2=B1 16%     -40.7%     738168 =C2=B1 12%  cpuidle.C1E-NHM.usa=
ge
  70404853 =C2=B1  8%     -47.4%   37040591 =C2=B1 19%  cpuidle.C3-NHM.time
 4.723e+09 =C2=B1108%     -81.6%  8.672e+08 =C2=B1  3%  cpuidle.C6-NHM.time
    311666 =C2=B1 18%     -47.9%     162252 =C2=B1 15%  cpuidle.C6-NHM.usage
 2.456e+08 =C2=B1 18%     -53.2%   1.15e+08 =C2=B1  9%  cpuidle.POLL.time
    260576 =C2=B1 21%     -58.6%     107765 =C2=B1 17%  cpuidle.POLL.usage
    906770 =C2=B1  8%     -19.4%     730530 =C2=B1  5%  proc-vmstat.numa_hi=
nt_faults
  2.54e+08 =C2=B1 11%     -97.1%    7464740 =C2=B1  4%  proc-vmstat.numa_hit
 2.539e+08 =C2=B1 11%     -97.1%    7449281 =C2=B1  4%  proc-vmstat.numa_lo=
cal
    662291 =C2=B1 10%     -33.4%     441016 =C2=B1  5%  proc-vmstat.numa_pa=
ges_migrated
   1203460 =C2=B1  6%     -16.7%    1002984 =C2=B1  5%  proc-vmstat.numa_pt=
e_updates
   5716982 =C2=B1 17%     -97.2%     158482 =C2=B1 40%  proc-vmstat.pgalloc=
_dma32
 2.521e+08 =C2=B1 11%     -96.3%    9338972 =C2=B1  3%  proc-vmstat.pgalloc=
_normal
   3627983 =C2=B1  4%     -26.1%    2682860 =C2=B1  1%  proc-vmstat.pgfault
 2.576e+08 =C2=B1 11%     -96.4%    9352801 =C2=B1  3%  proc-vmstat.pgfree
    662291 =C2=B1 10%     -33.4%     441016 =C2=B1  5%  proc-vmstat.pgmigra=
te_success
     27845 =C2=B1 11%     -79.8%       5624 =C2=B1  1%  slabinfo.kmalloc-10=
24.active_objs
    879.00 =C2=B1 11%     -79.2%     183.00 =C2=B1  1%  slabinfo.kmalloc-10=
24.active_slabs
     28142 =C2=B1 11%     -79.1%       5879 =C2=B1  0%  slabinfo.kmalloc-10=
24.num_objs
    879.00 =C2=B1 11%     -79.2%     183.00 =C2=B1  1%  slabinfo.kmalloc-10=
24.num_slabs
     20288 =C2=B1  0%    +129.9%      46639 =C2=B1  0%  slabinfo.kmalloc-64=
.active_objs
    317.00 =C2=B1  0%    +131.4%     733.50 =C2=B1  0%  slabinfo.kmalloc-64=
.active_slabs
     20288 =C2=B1  0%    +131.6%      46980 =C2=B1  0%  slabinfo.kmalloc-64=
.num_objs
    317.00 =C2=B1  0%    +131.4%     733.50 =C2=B1  0%  slabinfo.kmalloc-64=
.num_slabs
    335.50 =C2=B1  9%     -44.8%     185.25 =C2=B1  4%  slabinfo.taskstats.=
active_objs
    335.50 =C2=B1  9%     -44.8%     185.25 =C2=B1  4%  slabinfo.taskstats.=
num_objs
     38.97 =C2=B1 29%     +51.7%      59.11 =C2=B1  7%  perf-profile.cycles=
-pp.__account_scheduler_latency.enqueue_entity.enqueue_task_fair.activate_t=
ask.ttwu_do_activate
      3.89 =C2=B1 60%    +334.7%      16.93 =C2=B1 13%  perf-profile.cycles=
-pp.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
      0.70 =C2=B1 30%   +1969.3%      14.49 =C2=B1 11%  perf-profile.cycles=
-pp.__wake_up_common.__wake_up_sync_key.pipe_read.__vfs_read.vfs_read
      0.71 =C2=B1 30%   +1971.0%      14.65 =C2=B1 11%  perf-profile.cycles=
-pp.__wake_up_sync_key.pipe_read.__vfs_read.vfs_read.sys_read
      0.69 =C2=B1 84%     -92.3%       0.05 =C2=B1 63%  perf-profile.cycles=
-pp._raw_spin_lock.__schedule.schedule.exit_to_usermode_loop.syscall_return=
_slowpath
     34.58 =C2=B1 33%     +57.1%      54.33 =C2=B1  7%  perf-profile.cycles=
-pp._raw_spin_lock_irqsave.__account_scheduler_latency.enqueue_entity.enque=
ue_task_fair.activate_task
     39.61 =C2=B1 28%     +53.7%      60.89 =C2=B1  7%  perf-profile.cycles=
-pp.activate_task.ttwu_do_activate.try_to_wake_up.default_wake_function.aut=
oremove_wake_function
      0.70 =C2=B1 30%   +1967.9%      14.47 =C2=B1 11%  perf-profile.cycles=
-pp.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.pipe_read.=
__vfs_read
      0.70 =C2=B1 30%   +1965.0%      14.46 =C2=B1 11%  perf-profile.cycles=
-pp.default_wake_function.autoremove_wake_function.__wake_up_common.__wake_=
up_sync_key.pipe_read
     38.99 =C2=B1 28%     +54.5%      60.25 =C2=B1  7%  perf-profile.cycles=
-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_=
wake_up
     39.45 =C2=B1 28%     +53.9%      60.72 =C2=B1  7%  perf-profile.cycles=
-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.default=
_wake_function
     57.97 =C2=B1 20%     +40.4%      81.35 =C2=B1  8%  perf-profile.cycles=
-pp.entry_SYSCALL_64_fastpath
      1.31 =C2=B1 60%     -92.0%       0.10 =C2=B1 67%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock.__schedule.schedule.exi=
t_to_usermode_loop
      2.54 =C2=B1 68%     -81.8%       0.46 =C2=B1 60%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock.try_to_wake_up.default_=
wake_function.autoremove_wake_function
     34.38 =C2=B1 33%     +55.7%      53.54 =C2=B1  6%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__account_sched=
uler_latency.enqueue_entity.enqueue_task_fair
      3.67 =C2=B1 65%    +354.5%      16.69 =C2=B1 11%  perf-profile.cycles=
-pp.pipe_read.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
      5.22 =C2=B1 42%    +250.6%      18.30 =C2=B1 21%  perf-profile.cycles=
-pp.sys_read.entry_SYSCALL_64_fastpath
     39.95 =C2=B1 28%     +53.0%      61.10 =C2=B1  7%  perf-profile.cycles=
-pp.ttwu_do_activate.constprop.86.try_to_wake_up.default_wake_function.auto=
remove_wake_function.__wake_up_common
      4.70 =C2=B1 48%    +282.5%      17.96 =C2=B1 19%  perf-profile.cycles=
-pp.vfs_read.sys_read.entry_SYSCALL_64_fastpath
  16323355 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
   1702613 =C2=B1 26%    +288.1%    6607185 =C2=B1 61%  latency_stats.avg.p=
ipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
     31.67 =C2=B1 74%  +63999.7%      20298 =C2=B1149%  latency_stats.avg.s=
top_two_cpus.migrate_swap.task_numa_migrate.numa_migrate_preferred.task_num=
a_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
   3607008 =C2=B1163%    -100.0%     384.25 =C2=B1 14%  latency_stats.avg.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_range.filemap_w=
rite_and_wait_range.nfs4_file_fsync.[nfsv4].vfs_fsync_range.vfs_fsync.nfs4_=
file_flush.[nfsv4].filp_close.do_dup2.SyS_dup2.entry_SYSCALL_64_fastpath
   1042512 =C2=B1 15%    +145.7%    2561649 =C2=B1 35%  latency_stats.avg.w=
ait_on_page_bit.__migration_entry_wait.migration_entry_wait.handle_mm_fault=
.__do_page_fault.do_page_fault.page_fault
    384229 =C2=B1  2%     -76.9%      88748 =C2=B1 24%  latency_stats.hits.=
call_rwsem_down_read_failed.do_exit.SyS_exit.entry_SYSCALL_64_fastpath
  22676827 =C2=B1 14%    +762.3%  1.955e+08 =C2=B1  0%  latency_stats.hits.=
pipe_wait.pipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastp=
ath
    108077 =C2=B1 11%     -96.9%       3361 =C2=B1  8%  latency_stats.hits.=
pipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
   9791700 =C2=B1 80%    +173.5%   26782186 =C2=B1 72%  latency_stats.max.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault.copy_pa=
ge_from_iter.pipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fa=
stpath
   8696153 =C2=B1 89%    +196.7%   25800599 =C2=B1 75%  latency_stats.max.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault.copy_pa=
ge_to_iter.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
     13849 =C2=B1173%     -64.1%       4975 =C2=B1102%  latency_stats.max.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.exit_mmap.mmput.f=
lush_old_exec.load_elf_binary.search_binary_handler.do_execveat_common.SyS_=
execve.return_from_execve
  42431494 =C2=B1 56%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
  11940618 =C2=B1 27%    +124.4%   26793707 =C2=B1 72%  latency_stats.max.p=
ipe_wait.pipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpa=
th
     31.67 =C2=B1 74%  +73210.5%      23215 =C2=B1124%  latency_stats.max.s=
top_two_cpus.migrate_swap.task_numa_migrate.numa_migrate_preferred.task_num=
a_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
  27276522 =C2=B1155%    -100.0%     473.50 =C2=B1 18%  latency_stats.max.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_range.filemap_w=
rite_and_wait_range.nfs4_file_fsync.[nfsv4].vfs_fsync_range.vfs_fsync.nfs4_=
file_flush.[nfsv4].filp_close.do_dup2.SyS_dup2.entry_SYSCALL_64_fastpath
  86431834 =C2=B1106%    +708.2%  6.985e+08 =C2=B1 40%  latency_stats.sum.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault.copy_pa=
ge_to_iter.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
     14619 =C2=B1173%     -65.9%       4980 =C2=B1102%  latency_stats.sum.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.exit_mmap.mmput.f=
lush_old_exec.load_elf_binary.search_binary_handler.do_execveat_common.SyS_=
execve.return_from_execve
  44595961 =C2=B1 58%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
 4.608e+08 =C2=B1 37%    +202.9%  1.396e+09 =C2=B1 59%  latency_stats.sum.p=
ipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
 2.164e+10 =C2=B1 13%    +960.4%  2.294e+11 =C2=B1  5%  latency_stats.sum.p=
ipe_wait.pipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpa=
th
 1.117e+11 =C2=B1 16%     -97.9%  2.338e+09 =C2=B1 29%  latency_stats.sum.p=
ipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
     35826 =C2=B1 54%     -70.9%      10422 =C2=B1  6%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.link_path_walk
     31.67 =C2=B1 74%  +1.3e+05%      39883 =C2=B1 89%  latency_stats.sum.s=
top_two_cpus.migrate_swap.task_numa_migrate.numa_migrate_preferred.task_num=
a_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
  40133821 =C2=B1161%    -100.0%       2693 =C2=B1 14%  latency_stats.sum.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_range.filemap_w=
rite_and_wait_range.nfs4_file_fsync.[nfsv4].vfs_fsync_range.vfs_fsync.nfs4_=
file_flush.[nfsv4].filp_close.do_dup2.SyS_dup2.entry_SYSCALL_64_fastpath
 9.857e+09 =C2=B1 19%    +462.0%  5.539e+10 =C2=B1 40%  latency_stats.sum.w=
ait_on_page_bit.__migration_entry_wait.migration_entry_wait.handle_mm_fault=
.__do_page_fault.do_page_fault.page_fault
      7.50 =C2=B1 54%     +73.3%      13.00 =C2=B1  9%  sched_debug.cfs_rq:=
/.load.17
     12.00 =C2=B1 17%     -35.4%       7.75 =C2=B1 14%  sched_debug.cfs_rq:=
/.load.22
      5.50 =C2=B1 41%    +140.9%      13.25 =C2=B1 33%  sched_debug.cfs_rq:=
/.load.23
      6.25 =C2=B1 42%    +100.0%      12.50 =C2=B1 23%  sched_debug.cfs_rq:=
/.load.25
      6.00 =C2=B1 51%    +145.8%      14.75 =C2=B1 28%  sched_debug.cfs_rq:=
/.load.29
      5.75 =C2=B1 56%    +121.7%      12.75 =C2=B1 29%  sched_debug.cfs_rq:=
/.load.35
      7.50 =C2=B1 74%     +86.7%      14.00 =C2=B1 44%  sched_debug.cfs_rq:=
/.load.43
     11.75 =C2=B1 20%     -34.0%       7.75 =C2=B1 34%  sched_debug.cfs_rq:=
/.load.46
      5.75 =C2=B1 39%    +113.0%      12.25 =C2=B1 18%  sched_debug.cfs_rq:=
/.load.53
     12.75 =C2=B1 12%     -31.4%       8.75 =C2=B1  9%  sched_debug.cfs_rq:=
/.load.54
     13.75 =C2=B1 31%     -40.0%       8.25 =C2=B1 30%  sched_debug.cfs_rq:=
/.load.58
     27.00 =C2=B1 49%     -58.3%      11.25 =C2=B1 20%  sched_debug.cfs_rq:=
/.load_avg.24
     28.25 =C2=B1 58%     -61.9%      10.75 =C2=B1 20%  sched_debug.cfs_rq:=
/.load_avg.26
     22.25 =C2=B1 51%     -51.7%      10.75 =C2=B1 13%  sched_debug.cfs_rq:=
/.load_avg.28
     20.75 =C2=B1 48%     -53.0%       9.75 =C2=B1 15%  sched_debug.cfs_rq:=
/.load_avg.62
    182.64 =C2=B1 15%     -41.5%     106.77 =C2=B1 18%  sched_debug.cfs_rq:=
/.load_avg.max
      1.14 =C2=B1 30%     +65.7%       1.90 =C2=B1 18%  sched_debug.cfs_rq:=
/.load_avg.min
     30.53 =C2=B1  7%     -39.5%      18.46 =C2=B1 20%  sched_debug.cfs_rq:=
/.load_avg.stddev
  61751943 =C2=B1  3%     -29.5%   43522729 =C2=B1 13%  sched_debug.cfs_rq:=
/.min_vruntime.1
  63695496 =C2=B1  3%     -25.5%   47470305 =C2=B1 13%  sched_debug.cfs_rq:=
/.min_vruntime.13
  64969515 =C2=B1  3%     -27.9%   46847510 =C2=B1 14%  sched_debug.cfs_rq:=
/.min_vruntime.17
  65957991 =C2=B1  1%     -27.8%   47648514 =C2=B1 13%  sched_debug.cfs_rq:=
/.min_vruntime.21
  64485085 =C2=B1  3%     -26.1%   47642410 =C2=B1 13%  sched_debug.cfs_rq:=
/.min_vruntime.25
  64721403 =C2=B1  3%     -28.9%   45992467 =C2=B1 16%  sched_debug.cfs_rq:=
/.min_vruntime.29
  65138437 =C2=B1  4%     -29.3%   46039876 =C2=B1 12%  sched_debug.cfs_rq:=
/.min_vruntime.33
  66399877 =C2=B1  4%     -26.6%   48722623 =C2=B1 12%  sched_debug.cfs_rq:=
/.min_vruntime.37
  67958189 =C2=B1  4%     -29.4%   47968815 =C2=B1 16%  sched_debug.cfs_rq:=
/.min_vruntime.41
  67595662 =C2=B1  6%     -27.4%   49096370 =C2=B1 13%  sched_debug.cfs_rq:=
/.min_vruntime.45
  67690444 =C2=B1  3%     -27.6%   49000109 =C2=B1 12%  sched_debug.cfs_rq:=
/.min_vruntime.49
  64098981 =C2=B1  3%     -26.2%   47277630 =C2=B1 14%  sched_debug.cfs_rq:=
/.min_vruntime.5
  67783223 =C2=B1  3%     -27.4%   49216714 =C2=B1 12%  sched_debug.cfs_rq:=
/.min_vruntime.53
  66220648 =C2=B1  3%     -25.3%   49481358 =C2=B1 11%  sched_debug.cfs_rq:=
/.min_vruntime.57
  68140688 =C2=B1  4%     -30.7%   47207825 =C2=B1 16%  sched_debug.cfs_rq:=
/.min_vruntime.61
  65498493 =C2=B1  5%     -25.8%   48590023 =C2=B1 13%  sched_debug.cfs_rq:=
/.min_vruntime.65
  65049958 =C2=B1  4%     -28.2%   46691564 =C2=B1 18%  sched_debug.cfs_rq:=
/.min_vruntime.69
  68046848 =C2=B1  3%     -26.8%   49835973 =C2=B1 13%  sched_debug.cfs_rq:=
/.min_vruntime.73
  66382113 =C2=B1  4%     -26.9%   48557976 =C2=B1 18%  sched_debug.cfs_rq:=
/.min_vruntime.77
  65055617 =C2=B1  3%     -28.7%   46408287 =C2=B1 15%  sched_debug.cfs_rq:=
/.min_vruntime.9
  64257203 =C2=B1 11%     -19.4%   51816609 =C2=B1  3%  sched_debug.cfs_rq:=
/.min_vruntime.avg
  81981181 =C2=B1  6%     -14.9%   69761399 =C2=B1  5%  sched_debug.cfs_rq:=
/.min_vruntime.max
      7.25 =C2=B1 39%    +348.3%      32.50 =C2=B1 68%  sched_debug.cfs_rq:=
/.nr_spread_over.0
      6.75 =C2=B1 28%    +622.2%      48.75 =C2=B1 58%  sched_debug.cfs_rq:=
/.nr_spread_over.1
      3.50 =C2=B1 51%   +1342.9%      50.50 =C2=B1 45%  sched_debug.cfs_rq:=
/.nr_spread_over.10
      4.25 =C2=B1100%   +4358.8%     189.50 =C2=B1143%  sched_debug.cfs_rq:=
/.nr_spread_over.13
      7.25 =C2=B1 86%   +2000.0%     152.25 =C2=B1109%  sched_debug.cfs_rq:=
/.nr_spread_over.14
      9.00 =C2=B1 39%    +933.3%      93.00 =C2=B1105%  sched_debug.cfs_rq:=
/.nr_spread_over.17
      6.50 =C2=B1 77%    +826.9%      60.25 =C2=B1 67%  sched_debug.cfs_rq:=
/.nr_spread_over.18
      9.75 =C2=B1 67%    +220.5%      31.25 =C2=B1 79%  sched_debug.cfs_rq:=
/.nr_spread_over.20
      9.25 =C2=B1 67%    +281.1%      35.25 =C2=B1 65%  sched_debug.cfs_rq:=
/.nr_spread_over.21
      4.25 =C2=B1 45%   +1517.6%      68.75 =C2=B1 53%  sched_debug.cfs_rq:=
/.nr_spread_over.22
      5.50 =C2=B1 68%    +581.8%      37.50 =C2=B1 92%  sched_debug.cfs_rq:=
/.nr_spread_over.24
      5.50 =C2=B1 30%    +754.5%      47.00 =C2=B1 73%  sched_debug.cfs_rq:=
/.nr_spread_over.25
      6.25 =C2=B1 23%   +1660.0%     110.00 =C2=B1 39%  sched_debug.cfs_rq:=
/.nr_spread_over.26
      8.00 =C2=B1 12%    +343.8%      35.50 =C2=B1 39%  sched_debug.cfs_rq:=
/.nr_spread_over.29
      3.00 =C2=B1 78%    +600.0%      21.00 =C2=B1 25%  sched_debug.cfs_rq:=
/.nr_spread_over.32
      5.75 =C2=B1 93%    +856.5%      55.00 =C2=B1 67%  sched_debug.cfs_rq:=
/.nr_spread_over.36
      4.25 =C2=B1 65%    +670.6%      32.75 =C2=B1 30%  sched_debug.cfs_rq:=
/.nr_spread_over.37
      4.75 =C2=B1 47%   +1300.0%      66.50 =C2=B1 63%  sched_debug.cfs_rq:=
/.nr_spread_over.38
      6.25 =C2=B1 81%    +812.0%      57.00 =C2=B1 43%  sched_debug.cfs_rq:=
/.nr_spread_over.4
      8.25 =C2=B1 89%    +169.7%      22.25 =C2=B1 69%  sched_debug.cfs_rq:=
/.nr_spread_over.41
      3.00 =C2=B1102%   +5608.3%     171.25 =C2=B1140%  sched_debug.cfs_rq:=
/.nr_spread_over.42
      5.25 =C2=B1 47%    +566.7%      35.00 =C2=B1 27%  sched_debug.cfs_rq:=
/.nr_spread_over.44
      4.00 =C2=B1 46%    +662.5%      30.50 =C2=B1 28%  sched_debug.cfs_rq:=
/.nr_spread_over.45
      3.25 =C2=B1121%   +2761.5%      93.00 =C2=B1 87%  sched_debug.cfs_rq:=
/.nr_spread_over.46
      4.25 =C2=B1 58%    +758.8%      36.50 =C2=B1104%  sched_debug.cfs_rq:=
/.nr_spread_over.47
      6.50 =C2=B1 60%    +323.1%      27.50 =C2=B1 52%  sched_debug.cfs_rq:=
/.nr_spread_over.48
      7.50 =C2=B1 38%    +800.0%      67.50 =C2=B1 81%  sched_debug.cfs_rq:=
/.nr_spread_over.49
      6.75 =C2=B1 21%    +303.7%      27.25 =C2=B1 43%  sched_debug.cfs_rq:=
/.nr_spread_over.5
      2.75 =C2=B1 30%   +1736.4%      50.50 =C2=B1 56%  sched_debug.cfs_rq:=
/.nr_spread_over.50
      3.75 =C2=B1 66%   +1220.0%      49.50 =C2=B1117%  sched_debug.cfs_rq:=
/.nr_spread_over.52
      2.75 =C2=B1 64%    +854.5%      26.25 =C2=B1 79%  sched_debug.cfs_rq:=
/.nr_spread_over.53
      2.75 =C2=B1 97%   +3218.2%      91.25 =C2=B1 57%  sched_debug.cfs_rq:=
/.nr_spread_over.54
      3.00 =C2=B1 40%    +900.0%      30.00 =C2=B1 66%  sched_debug.cfs_rq:=
/.nr_spread_over.56
      2.25 =C2=B1 57%   +1700.0%      40.50 =C2=B1 77%  sched_debug.cfs_rq:=
/.nr_spread_over.57
      3.50 =C2=B1 58%   +2771.4%     100.50 =C2=B1 69%  sched_debug.cfs_rq:=
/.nr_spread_over.58
      4.00 =C2=B1107%    +893.8%      39.75 =C2=B1 82%  sched_debug.cfs_rq:=
/.nr_spread_over.59
      6.00 =C2=B1 72%   +1283.3%      83.00 =C2=B1 36%  sched_debug.cfs_rq:=
/.nr_spread_over.6
      6.50 =C2=B1 77%    +384.6%      31.50 =C2=B1 78%  sched_debug.cfs_rq:=
/.nr_spread_over.61
      3.50 =C2=B1 51%   +1571.4%      58.50 =C2=B1 73%  sched_debug.cfs_rq:=
/.nr_spread_over.62
      6.25 =C2=B1 52%    +356.0%      28.50 =C2=B1 45%  sched_debug.cfs_rq:=
/.nr_spread_over.64
      7.75 =C2=B1 84%    +106.5%      16.00 =C2=B1 41%  sched_debug.cfs_rq:=
/.nr_spread_over.65
      6.50 =C2=B1 72%    +319.2%      27.25 =C2=B1 83%  sched_debug.cfs_rq:=
/.nr_spread_over.68
      8.50 =C2=B1 59%    +329.4%      36.50 =C2=B1 57%  sched_debug.cfs_rq:=
/.nr_spread_over.69
      5.75 =C2=B1 56%    +308.7%      23.50 =C2=B1 60%  sched_debug.cfs_rq:=
/.nr_spread_over.72
      3.50 =C2=B1 65%    +400.0%      17.50 =C2=B1 52%  sched_debug.cfs_rq:=
/.nr_spread_over.73
      3.25 =C2=B1 25%    +876.9%      31.75 =C2=B1 68%  sched_debug.cfs_rq:=
/.nr_spread_over.75
      4.00 =C2=B1 63%  +23906.2%     960.25 =C2=B1169%  sched_debug.cfs_rq:=
/.nr_spread_over.76
      5.00 =C2=B1 70%    +720.0%      41.00 =C2=B1 54%  sched_debug.cfs_rq:=
/.nr_spread_over.77
      3.50 =C2=B1 47%    +600.0%      24.50 =C2=B1 73%  sched_debug.cfs_rq:=
/.nr_spread_over.8
      6.75 =C2=B1 48%    +370.4%      31.75 =C2=B1 83%  sched_debug.cfs_rq:=
/.nr_spread_over.9
     19.08 =C2=B1 14%    +232.7%      63.48 =C2=B1 32%  sched_debug.cfs_rq:=
/.nr_spread_over.avg
     13.50 =C2=B1 21%     -38.9%       8.25 =C2=B1 21%  sched_debug.cfs_rq:=
/.runnable_load_avg.62
     17.34 =C2=B1 33%     -48.7%       8.90 =C2=B1 22%  sched_debug.cfs_rq:=
/.runnable_load_avg.stddev
   1650786 =C2=B1 96%    +215.7%    5211288 =C2=B1 32%  sched_debug.cfs_rq:=
/.spread0.24
   3735888 =C2=B1 25%     -66.2%    1261722 =C2=B1 76%  sched_debug.cfs_rq:=
/.spread0.32
   6947361 =C2=B1181%    -153.7%   -3730893 =C2=B1-158%  sched_debug.cfs_rq=
:/.spread0.41
    822224 =C2=B1  6%    +262.2%    2978378 =C2=B1 55%  sched_debug.cpu.avg=
_idle.11
    899425 =C2=B1 22%    +115.1%    1934526 =C2=B1 63%  sched_debug.cpu.avg=
_idle.27
    902557 =C2=B1 11%    +161.2%    2357181 =C2=B1 71%  sched_debug.cpu.avg=
_idle.50
    855811 =C2=B1  2%     +90.8%    1632603 =C2=B1 74%  sched_debug.cpu.avg=
_idle.51
    968895 =C2=B1  7%    +160.6%    2524849 =C2=B1 36%  sched_debug.cpu.avg=
_idle.52
   1175701 =C2=B1 48%    +111.3%    2484589 =C2=B1 71%  sched_debug.cpu.avg=
_idle.69
      5.00 =C2=B1 44%    +120.0%      11.00 =C2=B1 33%  sched_debug.cpu.cpu=
_load[0].23
     13.50 =C2=B1 21%     -38.9%       8.25 =C2=B1 21%  sched_debug.cpu.cpu=
_load[0].62
      0.94 =C2=B1 25%     +74.1%       1.64 =C2=B1 20%  sched_debug.cpu.cpu=
_load[0].min
      5.00 =C2=B1 44%    +120.0%      11.00 =C2=B1 33%  sched_debug.cpu.cpu=
_load[1].23
      5.75 =C2=B1 31%     +91.3%      11.00 =C2=B1 23%  sched_debug.cpu.cpu=
_load[1].45
     13.50 =C2=B1 21%     -38.9%       8.25 =C2=B1 21%  sched_debug.cpu.cpu=
_load[1].62
      0.94 =C2=B1 25%     +74.1%       1.64 =C2=B1 20%  sched_debug.cpu.cpu=
_load[1].min
     17.26 =C2=B1 33%     -40.2%      10.33 =C2=B1 41%  sched_debug.cpu.cpu=
_load[1].stddev
      5.50 =C2=B1 32%    +100.0%      11.00 =C2=B1 23%  sched_debug.cpu.cpu=
_load[2].45
     13.50 =C2=B1 21%     -38.9%       8.25 =C2=B1 21%  sched_debug.cpu.cpu=
_load[2].62
     17.07 =C2=B1 33%     -43.4%       9.66 =C2=B1 32%  sched_debug.cpu.cpu=
_load[2].stddev
      5.00 =C2=B1 42%    +120.0%      11.00 =C2=B1 23%  sched_debug.cpu.cpu=
_load[3].45
     13.75 =C2=B1 18%     -40.0%       8.25 =C2=B1 21%  sched_debug.cpu.cpu=
_load[3].62
     16.85 =C2=B1 31%     -42.2%       9.75 =C2=B1 32%  sched_debug.cpu.cpu=
_load[3].stddev
      4.75 =C2=B1 50%    +131.6%      11.00 =C2=B1 23%  sched_debug.cpu.cpu=
_load[4].45
     13.75 =C2=B1 18%     -40.0%       8.25 =C2=B1 21%  sched_debug.cpu.cpu=
_load[4].62
     13.50 =C2=B1 19%     -37.0%       8.50 =C2=B1 24%  sched_debug.cpu.cpu=
_load[4].78
     16.46 =C2=B1 29%     -40.2%       9.85 =C2=B1 33%  sched_debug.cpu.cpu=
_load[4].stddev
     45774 =C2=B1 14%     -26.5%      33656 =C2=B1 21%  sched_debug.cpu.cur=
r->pid.67
      7.50 =C2=B1 52%     +76.7%      13.25 =C2=B1  8%  sched_debug.cpu.loa=
d.17
     12.25 =C2=B1 25%     -36.7%       7.75 =C2=B1 14%  sched_debug.cpu.loa=
d.20
     11.75 =C2=B1 18%     -36.2%       7.50 =C2=B1 14%  sched_debug.cpu.loa=
d.22
      5.75 =C2=B1 37%    +126.1%      13.00 =C2=B1 32%  sched_debug.cpu.loa=
d.23
      6.00 =C2=B1 42%    +104.2%      12.25 =C2=B1 26%  sched_debug.cpu.loa=
d.25
      5.75 =C2=B1 56%    +126.1%      13.00 =C2=B1 30%  sched_debug.cpu.loa=
d.35
     12.00 =C2=B1 17%     -35.4%       7.75 =C2=B1 34%  sched_debug.cpu.loa=
d.46
      5.75 =C2=B1 39%    +117.4%      12.50 =C2=B1 18%  sched_debug.cpu.loa=
d.53
     12.50 =C2=B1 12%     -30.0%       8.75 =C2=B1  9%  sched_debug.cpu.loa=
d.54
    505539 =C2=B1  1%    +644.1%    3761938 =C2=B1 74%  sched_debug.cpu.max=
_idle_balance_cost.11
    719417 =C2=B1 52%    +395.3%    3563254 =C2=B1 71%  sched_debug.cpu.max=
_idle_balance_cost.37
    744737 =C2=B1 44%    +202.3%    2251473 =C2=B1 75%  sched_debug.cpu.max=
_idle_balance_cost.40
    534942 =C2=B1  7%    +266.8%    1962058 =C2=B1 46%  sched_debug.cpu.max=
_idle_balance_cost.52
   2113103 =C2=B1 65%     -68.9%     656815 =C2=B1 41%  sched_debug.cpu.max=
_idle_balance_cost.65
    630785 =C2=B1 17%     -19.5%     507892 =C2=B1  1%  sched_debug.cpu.max=
_idle_balance_cost.7
    148.50 =C2=B1 45%     -83.5%      24.50 =C2=B1 19%  sched_debug.cpu.nr_=
running.0
    165.00 =C2=B1 45%     -85.8%      23.50 =C2=B1 38%  sched_debug.cpu.nr_=
running.10
     75.75 =C2=B1 29%     -71.6%      21.50 =C2=B1 25%  sched_debug.cpu.nr_=
running.11
    124.50 =C2=B1 85%     -82.9%      21.25 =C2=B1 19%  sched_debug.cpu.nr_=
running.12
    141.75 =C2=B1 29%     -84.0%      22.75 =C2=B1 26%  sched_debug.cpu.nr_=
running.14
    102.25 =C2=B1 78%     -71.1%      29.50 =C2=B1 33%  sched_debug.cpu.nr_=
running.15
    125.25 =C2=B1 83%     -82.6%      21.75 =C2=B1 21%  sched_debug.cpu.nr_=
running.16
    157.25 =C2=B1 39%     -85.2%      23.25 =C2=B1 34%  sched_debug.cpu.nr_=
running.18
    159.00 =C2=B1 66%     -83.6%      26.00 =C2=B1 27%  sched_debug.cpu.nr_=
running.19
    148.00 =C2=B1 24%     -80.9%      28.25 =C2=B1 29%  sched_debug.cpu.nr_=
running.2
    117.75 =C2=B1 49%     -81.7%      21.50 =C2=B1 28%  sched_debug.cpu.nr_=
running.20
    135.00 =C2=B1 32%     -86.1%      18.75 =C2=B1 27%  sched_debug.cpu.nr_=
running.22
     71.25 =C2=B1 27%     -55.1%      32.00 =C2=B1 27%  sched_debug.cpu.nr_=
running.23
    243.50 =C2=B1 71%     -89.4%      25.75 =C2=B1  8%  sched_debug.cpu.nr_=
running.24
    186.00 =C2=B1 51%     -89.1%      20.25 =C2=B1 24%  sched_debug.cpu.nr_=
running.26
     95.75 =C2=B1 59%     -73.4%      25.50 =C2=B1 29%  sched_debug.cpu.nr_=
running.27
    239.25 =C2=B1 99%     -92.1%      19.00 =C2=B1 15%  sched_debug.cpu.nr_=
running.28
     98.25 =C2=B1 54%     -66.9%      32.50 =C2=B1 22%  sched_debug.cpu.nr_=
running.3
    172.50 =C2=B1 44%     -87.5%      21.50 =C2=B1 43%  sched_debug.cpu.nr_=
running.30
     66.50 =C2=B1 25%     -63.9%      24.00 =C2=B1 25%  sched_debug.cpu.nr_=
running.31
    133.25 =C2=B1 48%     -82.2%      23.75 =C2=B1 18%  sched_debug.cpu.nr_=
running.32
    139.75 =C2=B1 37%     -82.3%      24.75 =C2=B1 27%  sched_debug.cpu.nr_=
running.34
     86.25 =C2=B1 75%     -75.4%      21.25 =C2=B1 23%  sched_debug.cpu.nr_=
running.36
     62.75 =C2=B1 31%     -58.2%      26.25 =C2=B1 30%  sched_debug.cpu.nr_=
running.39
    100.00 =C2=B1 72%     -79.0%      21.00 =C2=B1 21%  sched_debug.cpu.nr_=
running.4
     92.00 =C2=B1 64%     -78.0%      20.25 =C2=B1 15%  sched_debug.cpu.nr_=
running.40
    155.50 =C2=B1 46%     -83.8%      25.25 =C2=B1 45%  sched_debug.cpu.nr_=
running.42
     62.25 =C2=B1 39%     -55.8%      27.50 =C2=B1 30%  sched_debug.cpu.nr_=
running.43
    113.50 =C2=B1102%     -79.5%      23.25 =C2=B1 24%  sched_debug.cpu.nr_=
running.44
    140.00 =C2=B1 29%     -86.4%      19.00 =C2=B1 31%  sched_debug.cpu.nr_=
running.46
    311.50 =C2=B1114%     -91.3%      27.25 =C2=B1 20%  sched_debug.cpu.nr_=
running.47
    112.75 =C2=B1 91%     -81.2%      21.25 =C2=B1  5%  sched_debug.cpu.nr_=
running.48
    138.50 =C2=B1 34%     -84.7%      21.25 =C2=B1 31%  sched_debug.cpu.nr_=
running.50
     88.75 =C2=B1 67%     -72.7%      24.25 =C2=B1 33%  sched_debug.cpu.nr_=
running.51
    105.50 =C2=B1 51%     -79.9%      21.25 =C2=B1 14%  sched_debug.cpu.nr_=
running.52
    129.50 =C2=B1 29%     -84.6%      20.00 =C2=B1 21%  sched_debug.cpu.nr_=
running.54
    122.25 =C2=B1 51%     -80.2%      24.25 =C2=B1 12%  sched_debug.cpu.nr_=
running.56
    163.25 =C2=B1 45%     -87.7%      20.00 =C2=B1 36%  sched_debug.cpu.nr_=
running.58
     92.25 =C2=B1 66%     -71.5%      26.25 =C2=B1 13%  sched_debug.cpu.nr_=
running.59
    230.75 =C2=B1101%     -91.9%      18.75 =C2=B1 23%  sched_debug.cpu.nr_=
running.60
    144.75 =C2=B1 42%     -82.6%      25.25 =C2=B1 41%  sched_debug.cpu.nr_=
running.62
     58.25 =C2=B1 32%     -55.4%      26.00 =C2=B1 31%  sched_debug.cpu.nr_=
running.63
    122.25 =C2=B1 47%     -81.6%      22.50 =C2=B1  9%  sched_debug.cpu.nr_=
running.64
    150.00 =C2=B1 38%     -74.5%      38.25 =C2=B1 76%  sched_debug.cpu.nr_=
running.66
     89.25 =C2=B1 62%     -75.1%      22.25 =C2=B1 43%  sched_debug.cpu.nr_=
running.67
    116.00 =C2=B1 60%     -78.7%      24.75 =C2=B1 10%  sched_debug.cpu.nr_=
running.68
     88.25 =C2=B1 22%     -67.4%      28.75 =C2=B1 25%  sched_debug.cpu.nr_=
running.7
    134.25 =C2=B1 40%     -81.8%      24.50 =C2=B1 40%  sched_debug.cpu.nr_=
running.70
     69.00 =C2=B1 38%     -59.8%      27.75 =C2=B1 22%  sched_debug.cpu.nr_=
running.71
    119.75 =C2=B1 42%     -80.4%      23.50 =C2=B1 16%  sched_debug.cpu.nr_=
running.72
    138.50 =C2=B1 38%     -74.5%      35.25 =C2=B1 93%  sched_debug.cpu.nr_=
running.74
     86.50 =C2=B1 61%     -73.7%      22.75 =C2=B1 32%  sched_debug.cpu.nr_=
running.75
    115.50 =C2=B1 62%     -81.8%      21.00 =C2=B1 10%  sched_debug.cpu.nr_=
running.76
    127.00 =C2=B1 35%     -83.5%      21.00 =C2=B1 37%  sched_debug.cpu.nr_=
running.78
     59.25 =C2=B1 40%     -66.2%      20.00 =C2=B1 44%  sched_debug.cpu.nr_=
running.79
     97.50 =C2=B1 54%     -74.1%      25.25 =C2=B1 10%  sched_debug.cpu.nr_=
running.8
    106.72 =C2=B1 14%     -69.9%      32.15 =C2=B1 23%  sched_debug.cpu.nr_=
running.avg
    975.12 =C2=B1 47%     -72.2%     271.24 =C2=B1 72%  sched_debug.cpu.nr_=
running.max
      0.83 =C2=B1 26%     +65.9%       1.38 =C2=B1 26%  sched_debug.cpu.nr_=
running.min
    189.39 =C2=B1 34%     -74.1%      49.14 =C2=B1 62%  sched_debug.cpu.nr_=
running.stddev
   8049365 =C2=B1  5%      -9.5%    7281434 =C2=B1  5%  sched_debug.cpu.nr_=
switches.21
   8222072 =C2=B1  4%     -11.3%    7293398 =C2=B1  2%  sched_debug.cpu.nr_=
switches.25
   8355303 =C2=B1  5%     -13.3%    7241351 =C2=B1  4%  sched_debug.cpu.nr_=
switches.29
   8377252 =C2=B1  5%     -12.2%    7358538 =C2=B1  3%  sched_debug.cpu.nr_=
switches.33
   8646522 =C2=B1  6%     -12.8%    7543084 =C2=B1  3%  sched_debug.cpu.nr_=
switches.37
   8680679 =C2=B1  6%     -13.5%    7512566 =C2=B1  3%  sched_debug.cpu.nr_=
switches.41
   8862414 =C2=B1  6%     -15.0%    7533561 =C2=B1  4%  sched_debug.cpu.nr_=
switches.45
   8513418 =C2=B1  5%     -12.4%    7453546 =C2=B1  3%  sched_debug.cpu.nr_=
switches.49
   8554847 =C2=B1  6%     -12.6%    7480415 =C2=B1  4%  sched_debug.cpu.nr_=
switches.53
   8818690 =C2=B1  3%     -15.0%    7492325 =C2=B1  2%  sched_debug.cpu.nr_=
switches.57
   8446431 =C2=B1  5%     -12.2%    7416662 =C2=B1  3%  sched_debug.cpu.nr_=
switches.61
   8424264 =C2=B1  6%     -11.2%    7483465 =C2=B1  3%  sched_debug.cpu.nr_=
switches.65
   8874420 =C2=B1  6%     -14.6%    7581001 =C2=B1  4%  sched_debug.cpu.nr_=
switches.73
   8548326 =C2=B1  3%     -12.7%    7462215 =C2=B1  3%  sched_debug.cpu.nr_=
switches.77
   9638903 =C2=B1  5%     -17.4%    7963391 =C2=B1  4%  sched_debug.cpu.nr_=
switches.max
    896810 =C2=B1 21%     -68.9%     279227 =C2=B1 18%  sched_debug.cpu.nr_=
switches.stddev
    116.00 =C2=B1 29%    -115.7%     -18.25 =C2=B1-446%  sched_debug.cpu.nr=
_uninterruptible.10
    333.00 =C2=B1 85%    -104.9%     -16.25 =C2=B1-454%  sched_debug.cpu.nr=
_uninterruptible.14
    132.00 =C2=B1 65%     -76.7%      30.75 =C2=B1119%  sched_debug.cpu.nr_=
uninterruptible.16
    170.00 =C2=B1 57%    -100.9%      -1.50 =C2=B1-8373%  sched_debug.cpu.n=
r_uninterruptible.20
    201.00 =C2=B1 66%     -81.1%      38.00 =C2=B1318%  sched_debug.cpu.nr_=
uninterruptible.24
    277.00 =C2=B1 44%     -74.4%      71.00 =C2=B1 96%  sched_debug.cpu.nr_=
uninterruptible.25
    213.75 =C2=B1 60%     -76.8%      49.50 =C2=B1 63%  sched_debug.cpu.nr_=
uninterruptible.33
     80.25 =C2=B1 41%    -109.7%      -7.75 =C2=B1-722%  sched_debug.cpu.nr=
_uninterruptible.40
    350.00 =C2=B1100%    -107.5%     -26.25 =C2=B1-523%  sched_debug.cpu.nr=
_uninterruptible.46
    177.00 =C2=B1 35%     -60.7%      69.50 =C2=B1 65%  sched_debug.cpu.nr_=
uninterruptible.56
    223.00 =C2=B1 55%     -58.6%      92.25 =C2=B1 84%  sched_debug.cpu.nr_=
uninterruptible.58
    260.50 =C2=B1 67%    -313.2%    -555.50 =C2=B1-124%  sched_debug.cpu.nr=
_uninterruptible.59
    290.25 =C2=B1 78%     -98.7%       3.75 =C2=B1246%  sched_debug.cpu.nr_=
uninterruptible.6
    139.00 =C2=B1 40%     -87.4%      17.50 =C2=B1226%  sched_debug.cpu.nr_=
uninterruptible.66
     94.25 =C2=B1 96%    -136.1%     -34.00 =C2=B1-331%  sched_debug.cpu.nr=
_uninterruptible.68
    134.50 =C2=B1 69%    -128.6%     -38.50 =C2=B1-288%  sched_debug.cpu.nr=
_uninterruptible.69
    160.25 =C2=B1 60%     -84.9%      24.25 =C2=B1377%  sched_debug.cpu.nr_=
uninterruptible.73
    224.00 =C2=B1 30%     -71.5%      63.75 =C2=B1 24%  sched_debug.cpu.nr_=
uninterruptible.78
    104.50 =C2=B1112%    -128.7%     -30.00 =C2=B1-179%  sched_debug.cpu.nr=
_uninterruptible.8
     93.00 =C2=B1 30%    -128.2%     -26.25 =C2=B1-149%  sched_debug.cpu.nr=
_uninterruptible.9
     68.65 =C2=B1 25%     -77.4%      15.53 =C2=B1150%  sched_debug.cpu.nr_=
uninterruptible.avg
   8050079 =C2=B1  5%      -9.5%    7282381 =C2=B1  5%  sched_debug.cpu.sch=
ed_count.21
   8223158 =C2=B1  4%     -11.3%    7293920 =C2=B1  2%  sched_debug.cpu.sch=
ed_count.25
   8355745 =C2=B1  5%     -13.3%    7241867 =C2=B1  4%  sched_debug.cpu.sch=
ed_count.29
   8377564 =C2=B1  5%     -12.2%    7358616 =C2=B1  3%  sched_debug.cpu.sch=
ed_count.33
   8647489 =C2=B1  6%     -12.8%    7543179 =C2=B1  3%  sched_debug.cpu.sch=
ed_count.37
   8680933 =C2=B1  6%     -13.5%    7512654 =C2=B1  3%  sched_debug.cpu.sch=
ed_count.41
   8862638 =C2=B1  6%     -15.0%    7533639 =C2=B1  4%  sched_debug.cpu.sch=
ed_count.45
   8513659 =C2=B1  5%     -12.5%    7453634 =C2=B1  3%  sched_debug.cpu.sch=
ed_count.49
   8555109 =C2=B1  6%     -12.6%    7480502 =C2=B1  4%  sched_debug.cpu.sch=
ed_count.53
   8818934 =C2=B1  3%     -15.0%    7492403 =C2=B1  2%  sched_debug.cpu.sch=
ed_count.57
   8446695 =C2=B1  5%     -12.2%    7416735 =C2=B1  3%  sched_debug.cpu.sch=
ed_count.61
   8424736 =C2=B1  6%     -11.2%    7483931 =C2=B1  3%  sched_debug.cpu.sch=
ed_count.65
   8874653 =C2=B1  6%     -14.6%    7581099 =C2=B1  4%  sched_debug.cpu.sch=
ed_count.73
   8548563 =C2=B1  3%     -12.7%    7462306 =C2=B1  3%  sched_debug.cpu.sch=
ed_count.77
   1277740 =C2=B1 13%     -28.3%     915765 =C2=B1  1%  sched_debug.cpu.sch=
ed_count.stddev
     23897 =C2=B1 33%     -52.1%      11437 =C2=B1 45%  sched_debug.cpu.sch=
ed_goidle.0
     24028 =C2=B1 11%     -55.3%      10738 =C2=B1 19%  sched_debug.cpu.sch=
ed_goidle.10
     23579 =C2=B1 16%     -50.5%      11679 =C2=B1 45%  sched_debug.cpu.sch=
ed_goidle.12
     25676 =C2=B1 27%     -55.2%      11511 =C2=B1 21%  sched_debug.cpu.sch=
ed_goidle.13
     29635 =C2=B1 45%     -54.6%      13447 =C2=B1 30%  sched_debug.cpu.sch=
ed_goidle.15
     24179 =C2=B1 31%     -45.1%      13266 =C2=B1 33%  sched_debug.cpu.sch=
ed_goidle.16
     19085 =C2=B1 16%     -50.5%       9456 =C2=B1 29%  sched_debug.cpu.sch=
ed_goidle.2
     26332 =C2=B1 24%     -51.3%      12826 =C2=B1 23%  sched_debug.cpu.sch=
ed_goidle.20
     19407 =C2=B1 23%     -26.8%      14211 =C2=B1 18%  sched_debug.cpu.sch=
ed_goidle.21
     23725 =C2=B1 10%     -60.5%       9362 =C2=B1 22%  sched_debug.cpu.sch=
ed_goidle.22
     20885 =C2=B1  8%     -30.4%      14541 =C2=B1 33%  sched_debug.cpu.sch=
ed_goidle.23
     26971 =C2=B1 35%     -61.1%      10498 =C2=B1 25%  sched_debug.cpu.sch=
ed_goidle.24
     21959 =C2=B1 16%     -41.4%      12865 =C2=B1 22%  sched_debug.cpu.sch=
ed_goidle.25
     21776 =C2=B1 12%     -46.1%      11742 =C2=B1 23%  sched_debug.cpu.sch=
ed_goidle.27
     21108 =C2=B1 27%     -56.6%       9163 =C2=B1 29%  sched_debug.cpu.sch=
ed_goidle.30
     18235 =C2=B1 46%     -57.1%       7826 =C2=B1 51%  sched_debug.cpu.sch=
ed_goidle.32
     18074 =C2=B1 14%     -44.3%      10059 =C2=B1 40%  sched_debug.cpu.sch=
ed_goidle.33
     15392 =C2=B1 23%     -37.3%       9657 =C2=B1 13%  sched_debug.cpu.sch=
ed_goidle.34
     21667 =C2=B1 26%     -59.5%       8783 =C2=B1 13%  sched_debug.cpu.sch=
ed_goidle.38
     19652 =C2=B1 10%     -42.0%      11404 =C2=B1 25%  sched_debug.cpu.sch=
ed_goidle.4
     16821 =C2=B1 13%     -57.7%       7113 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.42
     17884 =C2=B1 27%     -62.7%       6664 =C2=B1 72%  sched_debug.cpu.sch=
ed_goidle.44
     22708 =C2=B1 46%     -63.9%       8192 =C2=B1 58%  sched_debug.cpu.sch=
ed_goidle.48
     19401 =C2=B1 26%     -42.1%      11228 =C2=B1  5%  sched_debug.cpu.sch=
ed_goidle.49
     16767 =C2=B1 19%     -44.3%       9332 =C2=B1 20%  sched_debug.cpu.sch=
ed_goidle.50
     15964 =C2=B1 27%     -48.2%       8269 =C2=B1 29%  sched_debug.cpu.sch=
ed_goidle.52
     14561 =C2=B1 17%     -31.7%       9951 =C2=B1  8%  sched_debug.cpu.sch=
ed_goidle.53
     16277 =C2=B1 22%     -67.9%       5232 =C2=B1 35%  sched_debug.cpu.sch=
ed_goidle.54
     23015 =C2=B1 35%     -51.2%      11236 =C2=B1 24%  sched_debug.cpu.sch=
ed_goidle.6
     15897 =C2=B1 14%     -48.0%       8264 =C2=B1 27%  sched_debug.cpu.sch=
ed_goidle.62
     22641 =C2=B1 16%     -46.0%      12217 =C2=B1 20%  sched_debug.cpu.sch=
ed_goidle.64
     23159 =C2=B1 27%     -47.9%      12060 =C2=B1 15%  sched_debug.cpu.sch=
ed_goidle.68
     20571 =C2=B1 10%     -30.7%      14246 =C2=B1 29%  sched_debug.cpu.sch=
ed_goidle.69
     21750 =C2=B1 25%     -54.6%       9880 =C2=B1 38%  sched_debug.cpu.sch=
ed_goidle.70
     13572 =C2=B1 12%     -35.5%       8757 =C2=B1 29%  sched_debug.cpu.sch=
ed_goidle.73
     15307 =C2=B1 20%     -36.8%       9677 =C2=B1 40%  sched_debug.cpu.sch=
ed_goidle.78
     17866 =C2=B1  7%     -33.2%      11942 =C2=B1 29%  sched_debug.cpu.sch=
ed_goidle.9
     18857 =C2=B1 12%     -40.4%      11240 =C2=B1 18%  sched_debug.cpu.sch=
ed_goidle.avg
     43849 =C2=B1 13%     -36.0%      28085 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.max
      6115 =C2=B1 23%     -50.4%       3034 =C2=B1 27%  sched_debug.cpu.sch=
ed_goidle.min
      7313 =C2=B1  9%     -32.8%       4915 =C2=B1  8%  sched_debug.cpu.sch=
ed_goidle.stddev
   4341077 =C2=B1  9%     +14.6%    4976682 =C2=B1  4%  sched_debug.cpu.ttw=
u_count.0
    372672 =C2=B1 13%     -70.4%     110439 =C2=B1  8%  sched_debug.cpu.ttw=
u_count.stddev
   2955563 =C2=B1  9%     +53.1%    4523498 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.0
   3131208 =C2=B1  7%     +43.3%    4486241 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.1
   3001199 =C2=B1 15%     +44.8%    4346826 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.10
   3166403 =C2=B1  7%     +35.4%    4288123 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.11
   3100602 =C2=B1 13%     +38.3%    4288026 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.12
   3391546 =C2=B1  5%     +30.8%    4435978 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.13
   2959588 =C2=B1 16%     +44.0%    4261936 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.14
   3267265 =C2=B1  9%     +32.4%    4326510 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.15
   3137496 =C2=B1 18%     +38.5%    4345588 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.16
   3356134 =C2=B1  7%     +31.1%    4399395 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.17
   3108355 =C2=B1 17%     +36.7%    4248516 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.18
   3303788 =C2=B1 10%     +31.6%    4346891 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.19
   2790792 =C2=B1 16%     +60.4%    4476856 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.2
   3208488 =C2=B1 16%     +36.0%    4363319 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.20
   3323090 =C2=B1  6%     +33.4%    4432674 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.21
   2920237 =C2=B1 17%     +50.4%    4391940 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.22
   3133540 =C2=B1  6%     +38.6%    4342196 =C2=B1 10%  sched_debug.cpu.ttw=
u_local.23
   3082052 =C2=B1 15%     +40.8%    4340369 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.24
   3410451 =C2=B1  2%     +30.2%    4440794 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.25
   2965013 =C2=B1 15%     +44.9%    4295580 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.26
   3140505 =C2=B1  7%     +40.7%    4420128 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.27
   3107859 =C2=B1 16%     +40.0%    4352409 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.28
   3558229 =C2=B1  8%     +23.2%    4383658 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.29
   3056265 =C2=B1  8%     +48.4%    4534490 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.3
   3064582 =C2=B1 16%     +41.9%    4348948 =C2=B1  2%  sched_debug.cpu.ttw=
u_local.30
   3209662 =C2=B1  6%     +36.0%    4366452 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.31
   3525265 =C2=B1 14%     +29.9%    4578608 =C2=B1  2%  sched_debug.cpu.ttw=
u_local.32
   3649268 =C2=B1  5%     +25.8%    4592214 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.33
   3181985 =C2=B1 18%     +44.3%    4590269 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.34
   3503558 =C2=B1  6%     +34.7%    4719199 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.35
   3510966 =C2=B1 13%     +24.9%    4384477 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.36
   3801989 =C2=B1  7%     +19.7%    4550261 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.37
   3197749 =C2=B1 14%     +34.7%    4306364 =C2=B1  0%  sched_debug.cpu.ttw=
u_local.38
   3452371 =C2=B1  6%     +27.1%    4387164 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.39
   3106534 =C2=B1 14%     +38.5%    4301950 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.4
   3410508 =C2=B1 14%     +27.4%    4345186 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.40
   3854125 =C2=B1  6%     +18.4%    4562285 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.41
   3210250 =C2=B1 14%     +38.7%    4453936 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.42
   3393670 =C2=B1  7%     +30.2%    4419376 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.43
   3504231 =C2=B1 13%     +24.3%    4356255 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.44
   3828003 =C2=B1  6%     +18.7%    4542494 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.45
   3285330 =C2=B1 14%     +31.1%    4305974 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.46
   3457275 =C2=B1 11%     +28.7%    4449353 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.47
   3352884 =C2=B1 17%     +32.3%    4436488 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.48
   3674474 =C2=B1  4%     +22.3%    4495693 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.49
   3448117 =C2=B1  5%     +27.9%    4408576 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.5
   3300328 =C2=B1 15%     +32.4%    4368728 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.50
   3359540 =C2=B1  6%     +31.7%    4426052 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.51
   3398675 =C2=B1 15%     +32.1%    4488804 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.52
   3744113 =C2=B1  7%     +22.3%    4579796 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.53
   3186989 =C2=B1 15%     +40.5%    4477419 =C2=B1  2%  sched_debug.cpu.ttw=
u_local.54
   3578762 =C2=B1  8%     +25.2%    4478923 =C2=B1  9%  sched_debug.cpu.ttw=
u_local.55
   3390671 =C2=B1 15%     +30.9%    4437633 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.56
   3860784 =C2=B1  2%     +17.4%    4534386 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.57
   3205789 =C2=B1 12%     +37.7%    4414254 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.58
   3395352 =C2=B1  7%     +32.7%    4506999 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.59
   2915811 =C2=B1 16%     +45.4%    4240300 =C2=B1  1%  sched_debug.cpu.ttw=
u_local.6
   3562805 =C2=B1 14%     +23.5%    4401745 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.60
   3715936 =C2=B1  6%     +21.2%    4503014 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.61
   3204936 =C2=B1 14%     +39.2%    4461506 =C2=B1  2%  sched_debug.cpu.ttw=
u_local.62
   3507592 =C2=B1  4%     +28.1%    4492218 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.63
   3202967 =C2=B1 13%     +37.3%    4398303 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.64
   3483280 =C2=B1  7%     +30.7%    4554002 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.65
   3138219 =C2=B1 15%     +39.9%    4389905 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.66
   3153951 =C2=B1  6%     +41.6%    4466967 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.67
   3229444 =C2=B1 12%     +37.5%    4441388 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.68
   3394709 =C2=B1  3%     +32.3%    4489810 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.69
   3230002 =C2=B1  7%     +33.4%    4308068 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.7
   3056815 =C2=B1 13%     +43.4%    4382407 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.70
   3223738 =C2=B1  6%     +37.6%    4437307 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.71
   3460274 =C2=B1 13%     +29.3%    4473753 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.72
   3860628 =C2=B1  6%     +19.2%    4600629 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.73
   3361754 =C2=B1 15%     +31.7%    4427085 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.74
   3375963 =C2=B1  9%     +32.4%    4468587 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.75
   3416899 =C2=B1 13%     +30.6%    4462381 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.76
   3725021 =C2=B1  2%     +22.7%    4571798 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.77
   3301968 =C2=B1  9%     +35.0%    4458653 =C2=B1  2%  sched_debug.cpu.ttw=
u_local.78
   3438172 =C2=B1 10%     +31.5%    4519809 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.79
   3296672 =C2=B1 16%     +29.4%    4267155 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.8
   3480776 =C2=B1  7%     +27.5%    4437332 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.9
   3329473 =C2=B1  7%     +33.0%    4429258 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.avg
   2541283 =C2=B1 13%     +56.8%    3983513 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.min
    414648 =C2=B1 17%     -57.3%     176872 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.stddev
      0.00 =C2=B1 85%     -79.4%       0.00 =C2=B1 10%  sched_debug.rt_rq:/=
.rt_time.24
      0.03 =C2=B1149%     -96.4%       0.00 =C2=B1 27%  sched_debug.rt_rq:/=
.rt_time.4
      0.00 =C2=B1 58%     -80.4%       0.00 =C2=B1 27%  sched_debug.rt_rq:/=
.rt_time.9


lkp-wsx02: Westmere-EX
Memory: 128G





    5e+11 ++---------------------------------------------------------------=
-+
  4.5e+11 ++        O                                                      =
 |
          |                                                                =
 |
    4e+11 ++                                                               =
 |
  3.5e+11 ++                                                               =
 |
          |                                                                =
 |
    3e+11 ++                                                               =
 |
  2.5e+11 +O    O      O  O  O  OO                                         =
 |
    2e+11 O+ OO  O O O        O   O                                        =
 |
          |                                                                =
 |
  1.5e+11 ++                                                               =
 |
    1e+11 ++                                                               =
 |
          |                                                                =
 |
    5e+10 +*. *.* .***. *.**.**.** .* .* .** .* .* .** .* .**.**.***.**.* .=
**
        0 *+-*---*-----*O--O------*--*--*---*--*--*---*--*---------------*-=
-+


                                    softirqs.RCU

  1e+07 ++--------------------O--------------------------------------------=
-+
  9e+06 OO O  OO O      O  O     O                                         =
 |
        |   O       OO       O  O                                          =
 |
  8e+06 ++        O                                                        =
 |
  7e+06 ++                                                                 =
 |
        |*.**.**.*      *.* .* .*  *  **.***.*  **.**.**.**.**.**.**.      =
**
  6e+06 ++        *.*  *   *  * :  :  :      :  :                    **.* :=
 |
  5e+06 ++          :  :         :: ::        ::                         ::=
 |
  4e+06 ++          :  :         :: ::        ::                         * =
 |
        *           : :          *  *         *                            =
 |
  3e+06 ++           ::                                                    =
 |
  2e+06 ++           ::                                                    =
 |
        |            ::                                                    =
 |
  1e+06 ++           :                                                     =
 |
      0 ++-----------*-O--O------------------------------------------------=
-+


                                  cpuidle.C6-NHM.time

    3e+10 *+-------------------------*---------*---------------------------=
-+
          |                          :         :                           =
 |
  2.5e+10 ++                         :         :                           =
 |
          |                          :         :                           =
 |
          |                       *  ::        ::                          =
 |
    2e+10 ++                      : : :        ::                          =
 |
          |                       ::: :        ::                          =
 |
  1.5e+10 ++                      ::: :       : :                          =
 |
          |:                      : : :       : :                        * =
 |
    1e+10 ++                     :  * :       : :                        : =
 |
          |:                     :     :      :  :                       ::=
 |
          |:                     :     :      :  :                      : :=
 |
    5e+09 ++                .*   :     :      :  :                      :  =
:|
          |*.**.**.***. *.**  *.**     **.***.*  **.***.**.**.**.***.**.*  =
**
        0 OO-OO-OO-OOO-OO-OO-OO-OOO----------------------------------------=
-+


                                 turbostat.Avg_MHz

  2500 O+OO-OO-OO-OO-O*-O*-OO-OO-O--------------------------**-**-**-**----=
**
       | **.**.**  :  :    *   :     *.**.**.*  **.**.**.**             *  =
:|
       | :         :  :         :    :       :  :                       : :=
 |
  2000 ++          :  :         : *  :       : :                         ::=
 |
       |:           : :         : :: :        ::                         * =
 |
       |:           : :          : ::         ::                           =
 |
  1500 ++           : :          *  :         :                            =
 |
       *            : :             *         *                            =
 |
  1000 ++           ::                                                     =
 |
       |            ::                                                     =
 |
       |            ::                                                     =
 |
   500 ++            :                                                     =
 |
       |             :                                                     =
 |
       |             :                                                     =
 |
     0 ++------------*O--O-------------------------------------------------=
-+


                                  turbostat._Busy

  100 O+OO-OO-OO-OO-O--O--OO-OO-O------------------------------------------=
-+
   90 ++**.**.**.**  *.**.**.**     *.**.*.**  *.**.**.**.**.**.**.**.**  *=
.*
      | :         :  :        :     :       :  :                        : :=
 |
   80 ++          :  :         : *  :        : :                        :: =
 |
   70 ++          :  :         : :: :        : :                         * =
 |
      |:           : :          : ::         ::                            =
 |
   60 ++           : :          *  :          :                            =
 |
   50 *+           : :             *          *                            =
 |
   40 ++           ::                                                      =
 |
      |            ::                                                      =
 |
   30 ++           ::                                                      =
 |
   20 ++            :                                                      =
 |
      |             :                                                      =
 |
   10 ++            :                                                      =
 |
    0 ++------------*O--O--------------------------------------------------=
-+


                                turbostat.CPU_c6

  60 ++--------------------------------------------------------------------=
-+
     |                                                                     =
 |
  50 *+                           *          *                             =
 |
     |                            :          :                             =
 |
     |                         *  :          :                             =
 |
  40 ++                        :  ::         ::                            =
 |
     |:                        :: ::         ::                            =
 |
  30 ++                        ::: :         ::                            =
 |
     |:                        ::: :        : :                          * =
 |
  20 ++                       :  : :        : :                          : =
 |
     |:                       :  * :        : :                         :: =
 |
     | :                      :     :       :  :                        : :=
 |
  10 ++:                 *.   :     :       :  :                       :  :=
 |
     | **.**.**.**. *.*.*  **.*     **.*.**.*  **.**.**.**.*.**.**.**.**  *=
.*
   0 O+OO-OO-OO-OO-OO-O-OO-OO-OO-------------------------------------------=
-+




  18 ++--------------------------------------------------------------------=
-+
     |                      O                                              =
 |
  16 O+ O     O       O  O                                                 =
 |
  14 ++    O       O       O   O                                           =
 |
     |       O                O                                            =
 |
  12 ++O        O                                                          =
 |
  10 ++   O      O                                                         =
 |
     |                                                                     =
 |
   8 ++                                                                    =
 |
   6 ++                                                                    =
 |
     |                                                                     =
 |
   4 ++                                                                    =
 |
   2 ++                                                                    =
 |
     |  *.**.  .**.    .*            *.*.*      *.**.       .*      *.* .* =
.*
   0 *+*-----**----*O-*-O*-**-**-**-*-----*-**-*-----**-**-*--*-**-*---*--*=
-+




  18 ++--------------------------------------------------------------------=
-+
     |                      O                                              =
 |
  16 O+ O     O       O  O                                                 =
 |
  14 ++    O       O       O   O                                           =
 |
     |       O                O                                            =
 |
  12 ++         O                                                          =
 |
  10 ++O  O      O                                                         =
 |
     |                                                                     =
 |
   8 ++                                                                    =
 |
   6 ++                                                                    =
 |
     |                                                                     =
 |
   4 ++                                                                    =
 |
   2 ++                                                                    =
 |
     |  *.**.  .**.    .*            *.*.*      *.**.       .*      *.* .* =
.*
   0 *+*-----**----*O-*-O*-**-**-**-*-----*-**-*-----**-**-*--*-**-*---*--*=
-+




  18 ++--------------------------------------------------------------------=
-+
     |                      O                                              =
 |
  16 O+ O     O       O  O                                                 =
 |
  14 ++    O       O       O   O                                           =
 |
     |       O                O                                            =
 |
  12 ++         O                                                          =
 |
  10 ++O  O      O                                                         =
 |
     |                                                                     =
 |
   8 ++                                                                    =
 |
   6 ++                                                                    =
 |
     |                                                                     =
 |
   4 ++                                                                    =
 |
   2 ++                                                                    =
 |
     |  *.**.  .**.    .*            *.*.*      *.**.       .*      *.* .* =
.*
   0 *+*-----**----*O-*-O*-**-**-**-*-----*-**-*-----**-**-*--*-**-*---*--*=
-+




  18 ++--------------------------------------------------------------------=
-+
     |                      O                                              =
 |
  16 O+ O     O       O  O                                                 =
 |
  14 ++    O       O       O   O                                           =
 |
     |       O                O                                            =
 |
  12 ++         O                                                          =
 |
  10 ++O  O      O                                                         =
 |
     |                                                                     =
 |
   8 ++                                                                    =
 |
   6 ++                                                                    =
 |
     |                                                                     =
 |
   4 ++                                                                    =
 |
   2 ++                                                                    =
 |
     |  *.**.  .**.    .*            *.*.*      *.**.       .*      *.* .* =
.*
   0 *+*-----**----*O-*-O*-**-**-**-*-----*-**-*-----**-**-*--*-**-*---*--*=
-+


                                hackbench.throughput

  300000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  250000 ++                                              *.*               =
 |
         |*.**.**. *.*        .*      *.**.**   *.**.**. :  :       .**.  .=
*|
         *        *  :  ***.**  *.**.*       *.*        *   **. *.**    ** =
 |
  200000 ++          :  :                                      *           =
 *
         |           :  :                                                  =
 |
  150000 ++          : :                                                   =
 |
         |           : :                                                   =
 |
  100000 OO OO OO OO OO: O  OO OO O                                        =
 |
         |            ::                                                   =
 |
         |            ::                                                   =
 |
   50000 ++           :                                                    =
 |
         |            :                                                    =
 |
       0 ++-----------*-O-O------------------------------------------------=
-+


                    hackbench.time.percent_of_cpu_this_job_got

  8000 O+OO-OO-OO-OO-O--O--OO-OO-O-----------------------------------------=
-+
       | **.**.**.**  *.**. *.**     *.**.**.*  **.**.**.**.**.**.**.**.*  =
**
  7000 ++:         :  :    *   :     :       :  :                       : :=
 |
  6000 ++          :  :         : *  :       : :                         ::=
 |
       |:          :  :         : :: :        ::                         * =
 |
  5000 ++           : :          : ::         ::                           =
 |
       |            : :          *  :         :                            =
 |
  4000 *+           : :             *         *                            =
 |
       |            ::                                                     =
 |
  3000 ++           ::                                                     =
 |
  2000 ++           ::                                                     =
 |
       |             :                                                     =
 |
  1000 ++            :                                                     =
 |
       |             :                                                     =
 |
     0 ++------------*O--O-------------------------------------------------=
-+


                             numa-numastat.node1.numa_hit

  1.2e+08 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    1e+08 ++       *                          *         *                  =
 |
          |       + :*                       +:        + :.**         *    =
 |
          |*    **  *:    *     *      *   ** :  *   **  *   : *.    * :   =
 |
    8e+07 +++  +     :   ::  * + :  *  ::  :  :  ::  :       : : ** +  : * =
 *
          |: **       :  : :: *  * :: : *.*    :: *.*         :    *    * +=
 |
    6e+07 ++          : *  ::     :: ::        ::             *            =
*|
          |           : :  *      *  :         :                           =
 |
    4e+07 *+          : :            *         *                           =
 |
          |           : :                                                  =
 |
          |           ::                                                   =
 |
    2e+07 ++           :                                                   =
 |
          O            :                                                   =
 |
        0 +O-OO-OO-OOO-OO-OO-OO-OOO----------------------------------------=
-+


                            numa-numastat.node1.local_node

  1.2e+08 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    1e+08 ++       *                          *         *                  =
 |
          |       + :*                       +:        + :.**         *    =
 |
          |*    **  *:    *     *      *   ** :  *   **  *   : *.    * :   =
 |
    8e+07 +++  +     :   ::  * + :  *  ::  :  :  ::  :       : : ** +  : * =
 *
          |: **       :  : :: *  * :: : *.*    :: *.*         :    *    * +=
 |
    6e+07 ++          : *  ::     :: ::        ::             *            =
*|
          |           : :  *      *  :         :                           =
 |
    4e+07 *+          : :            *         *                           =
 |
          |           : :                                                  =
 |
          |           ::                                                   =
 |
    2e+07 ++           :                                                   =
 |
          O            :                                                   =
 |
        0 +O-OO-OO-OOO-OO-OO-OO-OOO----------------------------------------=
-+


                            numa-numastat.node2.numa_hit

  9e+07 ++-----------------------------------------------------------------=
-+
        |     *                           *         *    *                 =
 |
  8e+07 +*.* + :                *     **. ::    **. :+   :                 =
 |
  7e+07 ++  *  *  *.            :     :  * *    :  *  * : :        *.* .*  =
 |
        |:      : : *  *   *.* ::    :      :  :      : : *        :  * :  =
*|
  6e+07 ++      ::  :  ::  : : ::    :      :  :       :   + *. *.*     :  =
:*
  5e+07 ++       *  :  :*.*   :  :  :        *:        *    *  *         ::=
 |
        *           : :       *  : **         *                          ::=
 |
  4e+07 ++          : :          :+                                      * =
 |
  3e+07 ++           ::          *                                         =
 |
        |            ::                                                    =
 |
  2e+07 ++           ::                                                    =
 |
  1e+07 ++           :                                                     =
 |
        |            :                                                     =
 |
      0 OO-OO-OO-OO-OO-OO-OO-OO-OO-----------------------------------------=
-+


                           numa-numastat.node2.local_node

  9e+07 ++-----------------------------------------------------------------=
-+
        |     *                           *         *    *                 =
 |
  8e+07 +*.* + :                *     **. ::    **. :+   :                 =
 |
  7e+07 ++  *  *  *.            :     :  * *    :  *  * : :        *.* .*  =
 |
        |:      : : *  *   *.* ::    :      :  :      : : *        :  * :  =
*|
  6e+07 ++      ::  :  ::  : : ::    :      :  :       :   + *. *.*     :  =
:*
  5e+07 ++       *  :  :*.*   :  :  :        *:        *    *  *         ::=
 |
        *           : :       *  : **         *                          ::=
 |
  4e+07 ++          : :          :+                                      * =
 |
  3e+07 ++           ::          *                                         =
 |
        |            ::                                                    =
 |
  2e+07 ++           ::                                                    =
 |
  1e+07 ++           :                                                     =
 |
        |            :                                                     =
 |
      0 OO-OO-OO-OO-OO-OO-OO-OO-OO-----------------------------------------=
-+


                            numa-numastat.node3.numa_hit

  1e+08 ++------------------------------------------------*----------------=
-+
  9e+07 ++                                                ::               =
 |
        |*                            *         *        : :               =
*|
  8e+07 +++       *                   ::        ::       *  :     *  *     =
:|
  7e+07 ++ *   *  ::      * .*     * : *.  *   : *.  .*  :  **   : :+:    :=
 |
        |:  *.* : ::   * + *  :    : :   ** :  :   ** : :     +  : *  :   :=
 |
  6e+07 ++      ::  *  :*     *.* :: :      :  :       ::      **     *.** =
 *
  5e+07 ++       :  :  :         :: ::       : :       :                   =
 |
  4e+07 ++       *  : :          *  :        *:        *                   =
 |
        *           : :             *         *                            =
 |
  3e+07 ++           ::                                                    =
 |
  2e+07 ++           ::                                                    =
 |
        |            :                                                     =
 |
  1e+07 ++           :                                                     =
 |
      0 OO-OO-OO-OO-OO-OO-OO-OO-OO-----------------------------------------=
-+


                           numa-numastat.node3.local_node

  1e+08 ++------------------------------------------------*----------------=
-+
  9e+07 ++                                                ::               =
 |
        |*                            *         *        : :               =
*|
  8e+07 +++       *                   ::        ::       *  :     *  *     =
:|
  7e+07 ++ *   *  ::      * .*     * : *.  *   : *.  .*  :  **   : :+:    :=
 |
        |:  *.* : ::   * + *  :    : :   ** :  :   ** : :     +  : *  :   :=
 |
  6e+07 ++      ::  *  :*     *.* :: :      :  :       ::      **     *.** =
 *
  5e+07 ++       :  :  :         :: ::       : :       :                   =
 |
  4e+07 ++       *  : :          *  :        *:        *                   =
 |
        *           : :             *         *                            =
 |
  3e+07 ++           ::                                                    =
 |
  2e+07 ++           ::                                                    =
 |
        |            :                                                     =
 |
  1e+07 ++           :                                                     =
 |
      0 OO-OO-OO-OO-OO-OO-OO-OO-OO-----------------------------------------=
-+


                              numa-vmstat.node0.numa_hit

    5e+07 ++---------------*-----------------------------------------------=
-+
  4.5e+07 ++               :                                               =
 |
          |   *           : :            .*        .*                      =
 |
    4e+07 ++ * :   *      * :   *       * :   *   * :   *               *  =
 |
  3.5e+07 +++  :  +:      : :  ::   *   :  : +:   :  : + *       * *   + : =
 |
          |*    **  :*   :   : : :  :  *   ** :  *   **   +     : * : *  *.=
 |
    3e+07 ++        ::   :   **  * : ::        ::          **.  :   : :    =
*|
  2.5e+07 ++        *:  *         :: ::        ::             **     *     =
 *
    2e+07 *+          : :         *  *         *                           =
 |
          |           : :                                                  =
 |
  1.5e+07 ++          : :                                                  =
 |
    1e+07 ++          ::                                                   =
 |
          |            :                                                   =
 |
    5e+06 ++           :                                                   =
 |
        0 OO-OO-OO-OOO-OO-OO-OO-OOO----------------------------------------=
-+


                             numa-vmstat.node0.numa_local

    5e+07 ++---------------*-----------------------------------------------=
-+
  4.5e+07 ++               :                                               =
 |
          |   *           : :            .*        .*                      =
 |
    4e+07 ++ * :   *      * :   *       * :   *   * :   *               *  =
 |
  3.5e+07 +++  :  +:      : :  ::   *   :  : +:   :  : + *       * *   + : =
 |
          |*    **  :*   :   : : :  :  *   ** :  *   **   +     : * : *  *.=
 |
    3e+07 ++        ::   :   **  * : ::        ::          **.  :   : :    =
*|
  2.5e+07 ++        *:  *         :: ::        ::             **     *     =
 *
    2e+07 *+          : :         *  *         *                           =
 |
          |           : :                                                  =
 |
  1.5e+07 ++          : :                                                  =
 |
    1e+07 ++          ::                                                   =
 |
          |            :                                                   =
 |
    5e+06 ++           :                                                   =
 |
        0 OO-OO-OO-OOO-OO-OO-OO-OOO----------------------------------------=
-+


                             numa-vmstat.node1.numa_hit

  6e+07 ++-----------------------------------------------------------------=
-+
        |       .*                          .*         *                   =
 |
  5e+07 ++     * :                         * :        * :                  =
 |
        |      :  :                        : :       +  :                  =
 |
        |*   .*   :     *  *       *  *   *   : *   *    :*.*  *           =
 |
  4e+07 ++: *     *.*   :  ::  .*  : ::  *    :::  *     *   :+ :  *.**  *.=
 |
        | : :       :  * : :: * : : :: :+     :: :+          *  *.*    + : =
**
  3e+07 *+ *        :  : ::  *   :: *  *      *  *                      *  =
 |
        |           :  :  :      :                                         =
 |
  2e+07 ++          : :   *      *                                         =
 |
        |            ::                                                    =
 |
        |            ::                                                    =
 |
  1e+07 ++           ::                                                    =
 |
        O            :                                                     =
 |
      0 +O-OO-OO-OO-OO-OO-OO-OO-OO-----------------------------------------=
-+


                            numa-vmstat.node1.numa_local

  6e+07 ++-----------------------------------------------------------------=
-+
        |       .*                          .*         *                   =
 |
  5e+07 ++     * :                         * :        * :                  =
 |
        |      :  :                        : :       +  :                  =
 |
        |*   .*   :     *  *       *  *   *   : *   *    :*.*  *           =
 |
  4e+07 ++: *     *.*   :  ::  .*  : ::  *    :::  *     *   :+ :  *.**  *.=
 |
        | : :       :  * : :: * : : :: :+     :: :+          *  *.*    + : =
**
  3e+07 *+ *        :  : ::  *   :: *  *      *  *                      *  =
 |
        |           :  :  :      :                                         =
 |
  2e+07 ++          : :   *      *                                         =
 |
        |            ::                                                    =
 |
        |            ::                                                    =
 |
  1e+07 ++           ::                                                    =
 |
        O            :                                                     =
 |
      0 +O-OO-OO-OO-OO-OO-OO-OO-OO-----------------------------------------=
-+


                              numa-vmstat.node2.numa_hit

    5e+07 ++---------------------------------------------------------------=
-+
  4.5e+07 ++    *                *         *         *                     =
 |
          |*.  + :               :     *   ::    *   ::  *                 =
 |
    4e+07 ++ **  *   *           :    + *.* *   + *.* *  :+           *.   =
 |
  3.5e+07 *+      : *:       *   :   *       : *       : : *    .***.*  *  =
 |
          |       : ::  *    :* : :  :       : :       ::  :   *        :  =
**
    3e+07 ++       *  : :+  :  +: : *         *         *   :  :         ::=
 |
  2.5e+07 ++          : : * :   * ::                        :.*          ::=
 |
    2e+07 ++          : :  *      ::                        *            * =
 |
          |           : :         *                                        =
 |
  1.5e+07 ++          ::                                                   =
 |
    1e+07 ++          ::                                                   =
 |
          |            :                                                   =
 |
    5e+06 ++           :                                                   =
 |
        0 OO-OO-OO-OOO-OO-OO-OO-OOO----------------------------------------=
-+


                             numa-vmstat.node2.numa_local

    5e+07 ++---------------------------------------------------------------=
-+
  4.5e+07 ++    *                *         *         *                     =
 |
          |*.  + :               :     *   ::    *   ::  *                 =
 |
    4e+07 ++ **  *               :    + *.* *   + *.* *  :+                =
 |
  3.5e+07 *+      : **       *   :   *       : *       : : *    .***.**.*  =
 |
          |       : ::  *    :* : :  :       : :       ::  :   *        :  =
**
    3e+07 ++       * :  :+  :  +: : *         *         *   :  :         ::=
 |
  2.5e+07 ++          : : * :   * ::                        :.*          ::=
 |
    2e+07 ++          : :  *      ::                        *            * =
 |
          |           : :         *                                        =
 |
  1.5e+07 ++          ::                                                   =
 |
    1e+07 ++          ::                                                   =
 |
          |            :                                                   =
 |
    5e+06 ++           :                                                   =
 |
        0 OO-OO-OO-OOO-OO-OO-OO-OOO----------------------------------------=
-+


                             numa-vmstat.node3.numa_hit

  6e+07 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  5e+07 ++                                                *                =
 |
        |*                            *         *         ::               =
 |
        |::                  *        :         :        : :      *        =
*|
  4e+07 ++:  .**  *         ::     * : :  **   : :  *.*  *  :*    :  *    :=
:|
        |  **  :  :+   *    : :    ::: *.* :   : *.*  :  :  * +  : :: :   :=
 |
  3e+07 *+      : : *  ::.**  *.* : *       : *       : :      * : :: *.** =
 *
        |       ::  :  :*        ::         : :        ::       *  *       =
 |
  2e+07 ++       :  : :          *           :         :                   =
 |
        |        *  : :                      *         *                   =
 |
        |            ::                                                    =
 |
  1e+07 ++           ::                                                    =
 |
        |            :                                                     =
 |
      0 OO-OO-OO-OO-OO-OO-OO-OO-OO-----------------------------------------=
-+


                            numa-vmstat.node3.numa_local

  6e+07 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  5e+07 ++                                                *                =
 |
        |*                            *         *         :                =
 |
        |::                  *        :         :        : :      *        =
*|
  4e+07 ++:  .**  *         ::     * : :  **   : :  *.*  * : *    :  *     =
:|
        |  **  :  :+   *    : :    ::: *.* :   : *.*  :  :  ::+  : :: :   :=
 |
  3e+07 *+      : : *  ::.**  :.* : *       : *       : :   *  * : :: *.* :=
 *
        |       ::  :  :*     *  ::         : :        ::       *  *     * =
 |
  2e+07 ++       :  : :          *           :         :                   =
 |
        |        *  : :                      *         *                   =
 |
        |            ::                                                    =
 |
  1e+07 ++           ::                                                    =
 |
        |            :                                                     =
 |
      0 OO-OO-OO-OO-OO-OO-OO-OO-OO-----------------------------------------=
-+


                                 proc-vmstat.numa_hit

  3.5e+08 ++---------------------------------------------------------------=
-+
          |                                              *.                =
 |
    3e+08 +*.**.**. *                  **.***.   **.***. : *        .*     =
*|
          |:       * *   .**. *.**     :      *  :      *   *.  .***  *.*  =
:|
  2.5e+08 ++         :  *    *   :  * :       : :             **        : :=
 *
          |:         :  :        :  : :       : :                        ::=
 |
    2e+08 ++          : :         :: ::        ::                        * =
 |
          |           : :         :: :         :                           =
 |
  1.5e+08 *+          : :         *  *         *                           =
 |
          |           : :                                                  =
 |
    1e+08 ++          ::                                                   =
 |
          |           ::                                                   =
 |
    5e+07 ++           :                                                   =
 |
          |            :                                                   =
 |
        0 OO-OO-OO-OOO-OO-OO-OO-OOO----------------------------------------=
-+


                                proc-vmstat.numa_local

  3.5e+08 ++---------------------------------------------------------------=
-+
          |                                              *.                =
 |
    3e+08 +*.**.**. *                  **.***.   **.***. : *        .*     =
*|
          |:       * *   .**. *.**     :      *  :      *   *.  .***  *.*  =
:|
  2.5e+08 ++         :  *    *   :  * :       : :             **        : :=
 *
          |:         :  :        :  : :       : :                        ::=
 |
    2e+08 ++          : :         :: ::        ::                        * =
 |
          |           : :         :: :         :                           =
 |
  1.5e+08 *+          : :         *  *         *                           =
 |
          |           : :                                                  =
 |
    1e+08 ++          ::                                                   =
 |
          |           ::                                                   =
 |
    5e+07 ++           :                                                   =
 |
          |            :                                                   =
 |
        0 OO-OO-OO-OOO-OO-OO-OO-OOO----------------------------------------=
-+


                              proc-vmstat.pgalloc_normal

  3.5e+08 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    3e+08 +*.  .**.                    *   **.   *   **. *.*               =
*|
          |: **    ***   .*   *.**     :*.*   *  :*.*   *   *.  .***.**.*  =
:|
  2.5e+08 ++         :  *  *.*   :  * :       : :             **        : :=
 *
          |:         :  :        :  : :       : :                        ::=
 |
    2e+08 ++          : :         :: ::        ::                        * =
 |
          |           : :         :: :         :                           =
 |
  1.5e+08 *+          : :         *  *         *                           =
 |
          |           : :                                                  =
 |
    1e+08 ++          ::                                                   =
 |
          |           ::                                                   =
 |
    5e+07 ++           :                                                   =
 |
          |            :                                                   =
 |
        0 OO-OO-OO-OOO-OO-OO-OO-OOO----------------------------------------=
-+


                                  proc-vmstat.pgfree

  3.5e+08 ++---------------------------------------------------------------=
-+
          |*.                          *         *       *.*               =
 |
    3e+08 ++ **.**. *                  :*.***.   :*.***. :  :       .*     =
*|
          |:       * *   .**. *.**    :       * :       *   *.* .***  *.* :=
 |
  2.5e+08 ++         :  *    *   :  * :       : :              *         ::=
 *
          |          :  :        :  : :       : :                        * =
 |
    2e+08 ++          : :         :: ::        ::                          =
 |
          |           : :         :: :         :                           =
 |
  1.5e+08 *+          : :         *  *         *                           =
 |
          |           : :                                                  =
 |
    1e+08 ++          ::                                                   =
 |
          |           ::                                                   =
 |
    5e+07 ++           :                                                   =
 |
          |            :                                                   =
 |
        0 OO-OO-OO-OOO-OO-OO-OO-OOO----------------------------------------=
-+


                          slabinfo.taskstats.active_objs

  450 ++-------------------------------------------------------------------=
-+
      |                                                  .*                =
 |
  400 ++*   *.* .*                  *.  .*.*   *.  .**. * :         *.    *=
 |
  350 ++ *.*   *  *   .* .*  **     : **    *  : **    *   :.*  **. : **. :=
:|
      |:          :  *  *  :+ :  *.:         +:            *  :+   *     * =
:|
  300 *+          :  :     *   : : *          *               *            =
 *
  250 ++           : :         : :                                         =
 |
      |            : :          :                                          =
 |
  200 ++OO OO OO OO:O: O  OO  O O                                          =
 |
  150 O+           : :       O                                             =
 |
      |            ::                                                      =
 |
  100 ++           ::                                                      =
 |
   50 ++            :                                                      =
 |
      |             :                                                      =
 |
    0 ++------------*O--O--------------------------------------------------=
-+


                            slabinfo.taskstats.num_objs

  450 ++-------------------------------------------------------------------=
-+
      |                                                  .*                =
 |
  400 ++*   *.* .*                  *.  .*.*   *.  .**. * :         *.    *=
 |
  350 ++ *.*   *  *   .* .*  **     : **    *  : **    *   :.*  **. : **. :=
:|
      |:          :  *  *  :+ :  *.:         +:            *  :+   *     * =
:|
  300 *+          :  :     *   : : *          *               *            =
 *
  250 ++           : :         : :                                         =
 |
      |            : :          :                                          =
 |
  200 ++OO OO OO OO:O: O  OO  O O                                          =
 |
  150 O+           : :       O                                             =
 |
      |            ::                                                      =
 |
  100 ++           ::                                                      =
 |
   50 ++            :                                                      =
 |
      |             :                                                      =
 |
    0 ++------------*O--O--------------------------------------------------=
-+


        kmsg.DMAR-IR:Failed_to_copy_IR_table_for_dmar0_from_previous_kernel

    1 *+-*-*------------------------------------------*-*--*-----------*--*=
-*
      |    :                                          :    :           :   =
 |
      |    :                                          :    :           :   =
 |
  0.8 ++    :                                        :     :           :   =
 |
      |     :                                        :      :         :    =
 |
      |     :                                        :      :         :    =
 |
  0.6 ++    :                                        :      :         :    =
 |
      |      :                                       :      :         :    =
 |
  0.4 ++     :                                      :       :         :    =
 |
      |      :                                      :       :         :    =
 |
      |      :                                      :       :         :    =
 |
  0.2 ++     :                                      :        :       :     =
 |
      |       :                                    :         :       :     =
 |
      |       :                                    :         :       :     =
 |
    0 ++------*-*--*-*--*-*--*-*--*-*--*-*--*-*--*-*---------*--*-*--*-----=
-+


        kmsg.DMAR-IR:Failed_to_copy_IR_table_for_dmar1_from_previous_kernel

    1 *+-*-*------------------------------------------*-*--*-----------*--*=
-*
      |    :                                          :    :           :   =
 |
      |    :                                          :    :           :   =
 |
  0.8 ++    :                                        :     :           :   =
 |
      |     :                                        :      :         :    =
 |
      |     :                                        :      :         :    =
 |
  0.6 ++    :                                        :      :         :    =
 |
      |      :                                       :      :         :    =
 |
  0.4 ++     :                                      :       :         :    =
 |
      |      :                                      :       :         :    =
 |
      |      :                                      :       :         :    =
 |
  0.2 ++     :                                      :        :       :     =
 |
      |       :                                    :         :       :     =
 |
      |       :                                    :         :       :     =
 |
    0 ++------*-*--*-*--*-*--*-*--*-*--*-*--*-*--*-*---------*--*-*--*-----=
-+


   kmsg.DMAR-IR:IRQ_remapping_was_enabled_on_dmar0_but_we_are_not_in_kdump_=
mode

    1 ++-*-*--------------------------------------------*--*--------------*=
-*
      |  : :                                            :  :              :=
 |
      |  : :                                            :  :              :=
 |
  0.8 ++:   :                                           :  :             : =
 |
      | :   :                                          :    :            : =
 |
      | :   :                                          :    :            : =
 |
  0.6 ++:   :                                          :    :            : =
 |
      | :    :                                         :    :            : =
 |
  0.4 ++     :                                         :    :           :  =
 |
      |:     :                                         :    :           :  =
 |
      |:     :                                         :    :           :  =
 |
  0.2 ++     :                                        :      :          :  =
 |
      |       :                                       :      :         :   =
 |
      |       :                                       :      :         :   =
 |
    0 *+------*-*--*-*--*-*--*-*--*-*--*-*--*-*--*-*--*------*--*-*--*-*---=
-+


   kmsg.DMAR-IR:IRQ_remapping_was_enabled_on_dmar1_but_we_are_not_in_kdump_=
mode

    1 ++-*-*--------------------------------------------*--*--------------*=
-*
      |  : :                                            :  :              :=
 |
      |  : :                                            :  :              :=
 |
  0.8 ++:   :                                           :  :             : =
 |
      | :   :                                          :    :            : =
 |
      | :   :                                          :    :            : =
 |
  0.6 ++:   :                                          :    :            : =
 |
      | :    :                                         :    :            : =
 |
  0.4 ++     :                                         :    :           :  =
 |
      |:     :                                         :    :           :  =
 |
      |:     :                                         :    :           :  =
 |
  0.2 ++     :                                        :      :          :  =
 |
      |       :                                       :      :         :   =
 |
      |       :                                       :      :         :   =
 |
    0 *+------*-*--*-*--*-*--*-*--*-*--*-*--*-*--*-*--*------*--*-*--*-*---=
-+


                   kmsg.DHCP_BOOTP:Reply_not_for_us_op___xid___

    1 ++-------------------------------------------------------------------=
-*
      |                                                                    =
 |
      |                                                                    =
:|
  0.8 ++                                                                   =
:|
      |                                                                    =
:|
      |                                                                   :=
 |
  0.6 ++                                                                  :=
 |
      |                                                                   :=
 |
  0.4 ++                                                                 : =
 |
      |                                                                  : =
 |
      |                                                                 :  =
 |
  0.2 ++                                                                :  =
 |
      |                                                                 :  =
 |
      |                                                                :   =
 |
    0 *+---*---*----*----*---*----*----*---*----*----*---*----*----*---*---=
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

--===============4213351331291803217==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogaGFja2JlbmNoCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9u
aXRvcgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVt
YXN0YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAK
ICBwcm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAg
aW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczog
CiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6
IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1
ZzoKICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiBwZXJmb3JtYW5jZQpkZWZhdWx0
LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogNzU5YzAxMTQy
YTVkMGYzNjRhNDYyMzQ2MTY4YTU2ZGUyOGE4MGY1Mgptb2RlbDogV2VzdG1lcmUtRVgKbWVtb3J5
OiAxMjhHCm5yX2NwdTogODAKbnJfaGRkX3BhcnRpdGlvbnM6IDAKaGRkX3BhcnRpdGlvbnM6IApz
d2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAKY2F0ZWdvcnk6IGJlbmNobWFyawpu
cl90aHJlYWRzOiAxNjAwJQpwZXJmLXByb2ZpbGU6CiAgZnJlcTogODAwCmhhY2tiZW5jaDoKICBt
b2RlOiB0aHJlYWRzCiAgaXBjOiBwaXBlCnF1ZXVlOiBiaXNlY3QKdGVzdGJveDogbGtwLXdzeDAy
CnRib3hfZ3JvdXA6IGxrcC13c3gwMgprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6
IDIwMTYtMDEtMjkgMDQ6MzY6MDcuNzQzNzc3Njc0ICswODowMAppZDogNWJhNmM1MGE5MjdmMDc3
YjNhNWNhNWFmODFjODUwNjAxZTZiMGM4MAp1c2VyOiBsa3AKY29tcGlsZXI6IGdjYy00LjkKaGVh
ZF9jb21taXQ6IDQyMWZiMmU1ZDc2YjI4YTJhYTdmMDEwOTUwZjNhMDg3MDg0ODliNmEKYmFzZV9j
b21taXQ6IDkyZTk2M2Y1MGZjNzQwNDFiNWU5ZTc0NGMzMzBkY2E0OGUwNGYwOGQKYnJhbmNoOiBs
aW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjAxMjUyMApyb290ZnM6IGRlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3oKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L2hhY2tiZW5jaC9wZXJmb3JtYW5j
ZS0xNjAwJS10aHJlYWRzLXBpcGUvbGtwLXdzeDAyL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5j
Z3oveDg2XzY0LXJoZWwvZ2NjLTQuOS83NTljMDExNDJhNWQwZjM2NGE0NjIzNDYxNjhhNTZkZTI4
YTgwZjUyLzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvbGtwLXdzeDAyL2Jpc2VjdF9oYWNr
YmVuY2gtcGVyZm9ybWFuY2UtMTYwMCUtdGhyZWFkcy1waXBlLWRlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3oteDg2XzY0LXJoZWwtNzU5YzAxMTQyYTVkMGYzNjRhNDYyMzQ2MTY4YTU2ZGUyOGE4
MGY1Mi0yMDE2MDEyOS0yMDAxOS0xOTZwdHU1LTAueWFtbCIKbWF4X3VwdGltZTogMjQwMAppbml0
cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNneiIKYm9vdGxv
YWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpvYj0vbGtwL3NjaGVk
dWxlZC9sa3Atd3N4MDIvYmlzZWN0X2hhY2tiZW5jaC1wZXJmb3JtYW5jZS0xNjAwJS10aHJlYWRz
LXBpcGUtZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei14ODZfNjQtcmhlbC03NTljMDExNDJh
NWQwZjM2NGE0NjIzNDYxNjhhNTZkZTI4YTgwZjUyLTIwMTYwMTI5LTIwMDE5LTE5NnB0dTUtMC55
YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmlnPXg4Nl82NC1yaGVsCi0gYnJhbmNoPWxpbnV4LWRl
dmVsL2RldmVsLWhvdXJseS0yMDE2MDEyNTIwCi0gY29tbWl0PTc1OWMwMTE0MmE1ZDBmMzY0YTQ2
MjM0NjE2OGE1NmRlMjhhODBmNTIKLSBCT09UX0lNQUdFPS9wa2cvbGludXgveDg2XzY0LXJoZWwv
Z2NjLTQuOS83NTljMDExNDJhNWQwZjM2NGE0NjIzNDYxNjhhNTZkZTI4YTgwZjUyL3ZtbGludXot
NC40LjAtMDYxNzItZzc1OWMwMTEKLSBtYXhfdXB0aW1lPTI0MDAKLSBSRVNVTFRfUk9PVD0vcmVz
dWx0L2hhY2tiZW5jaC9wZXJmb3JtYW5jZS0xNjAwJS10aHJlYWRzLXBpcGUvbGtwLXdzeDAyL2Rl
Ymlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS83NTljMDExNDJh
NWQwZjM2NGE0NjIzNDYxNjhhNTZkZTI4YTgwZjUyLzAKLSBMS1BfU0VSVkVSPWlubgotIHwyLQoK
CiAgZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIHN5c3RlbWQubG9nX2xldmVsPWVycgogIGRlYnVn
IGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90
aW1lb3V0PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hkb2c9cGFu
aWMgb29wcz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29uc29sZT10
dHlTMCwxMTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwKCiAgcncKbGtwX2luaXRyZDogIi9s
a3AvbGtwL2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0
LXJoZWwvZ2NjLTQuOS83NTljMDExNDJhNWQwZjM2NGE0NjIzNDYxNjhhNTZkZTI4YTgwZjUyL21v
ZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5j
Z3ovcnVuLWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3ovdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvdHVyYm9zdGF0LmNneiIKbGludXhf
aGVhZGVyc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvNzU5YzAxMTQy
YTVkMGYzNjRhNDYyMzQ2MTY4YTU2ZGUyOGE4MGY1Mi9saW51eC1oZWFkZXJzLmNneiIKcmVwZWF0
X3RvOiAyCmtlcm5lbDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS83NTljMDExNDJh
NWQwZjM2NGE0NjIzNDYxNjhhNTZkZTI4YTgwZjUyL3ZtbGludXotNC40LjAtMDYxNzItZzc1OWMw
MTEiCmRlcXVldWVfdGltZTogMjAxNi0wMS0yOSAwNDo1NDowOC4xNTMyMjUxMzUgKzA4OjAwCmpv
Yl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogMjYzOC42NyA0NTgzLjczIDI5NTkuODIgMi83ODUg
Njk3NTAKc3RhcnRfdGltZTogJzE0NTQwMTQ1MTAnCmVuZF90aW1lOiAnMTQ1NDAxNTE0NCcKdmVy
c2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNjAxMjctMjIzODUzIgo=

--===============4213351331291803217==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNi0wMS0yOSAwNDo1NTowOCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOSAwNDo1NTowOCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOSAwNDo1NTowOCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDEtMjkgMDQ6NTU6MDggZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTI5IDA0OjU1OjA4IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMS0yOSAwNDo1NTowOCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEt
MjkgMDQ6NTU6MDggZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTI5IDA0OjU1OjA4IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMS0yOSAwNDo1NTowOCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjkg
MDQ6NTU6MDggZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTI5IDA0OjU1OjA4IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxOC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMS0yOSAwNDo1NTowOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjkgMDQ6
NTU6MDkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjkgMDQ6NTU6MDkgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTAxLTI5IDA0OjU1OjA5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUyMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOSAwNDo1NTow
OSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjIvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjkgMDQ6NTU6MDkgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTAxLTI5IDA0OjU1OjA5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHUyNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOSAwNDo1NTowOSBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjUvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjkgMDQ6NTU6MDkgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAxLTI5IDA0OjU1OjA5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUyNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOSAwNDo1NTowOSBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjgvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDEtMjkgMDQ6NTU6MDkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAx
LTI5IDA0OjU1OjA5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTI5IDA0OjU1OjA5IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMS0yOSAwNDo1NTowOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MzEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjkg
MDQ6NTU6MDkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTI5IDA0OjU1OjA5IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMy9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMS0yOSAwNDo1NTowOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MzQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjkgMDQ6
NTU6MDkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTI5IDA0OjU1OjA5IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMS0yOSAwNDo1NTowOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MzcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjkgMDQ6NTU6
MDkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTI5IDA0OjU1OjA5IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wMS0yOSAwNDo1NTowOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOSAwNDo1NTowOSBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjkgMDQ6NTU6MDkgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAxLTI5IDA0OjU1OjA5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU0Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOSAwNDo1NTowOSBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDMvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDEtMjkgMDQ6NTU6MDkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAx
LTI5IDA0OjU1OjA5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU0NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOSAwNDo1NTowOSBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDEtMjkgMDQ6NTU6MDkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTQ3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTI5
IDA0OjU1OjA5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0
OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOSAwNDo1NTowOSBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDkvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDEtMjkgMDQ6NTU6MDkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjkgMDQ6
NTU6MDkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUwL2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTI5IDA0OjU1OjA5IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMS0yOSAwNDo1NTowOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NTIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjkgMDQ6NTU6
MDkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUzL2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTI5IDA0OjU1OjA5IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wMS0yOSAwNDo1NTowOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjkgMDQ6NTU6MDkg
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU2L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTI5IDA0OjU1OjA5IGVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAx
Ni0wMS0yOSAwNDo1NTowOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1NTgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjkgMDQ6NTU6MDkgZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU5L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE2LTAxLTI5IDA0OjU1OjA5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAx
LTI5IDA0OjU1OjA5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU2MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOSAwNDo1NTowOSBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjEvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDEtMjkgMDQ6NTU6MDkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTYyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTI5
IDA0OjU1OjA5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2
My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOSAwNDo1NTowOSBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjQvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDEtMjkgMDQ6NTU6MDkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTY1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTI5IDA0
OjU1OjA5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2Ni9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOSAwNDo1NTowOSBlY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCjIwMTYtMDEtMjkgMDQ6NTU6MDkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTY4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTI5IDA0OjU1
OjA5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2OS9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOSAwNDo1NTowOSBlY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wMS0yOSAwNDo1NTowOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NzAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjkgMDQ6NTU6MDkg
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcxL2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTI5IDA0OjU1OjA5IGVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAx
Ni0wMS0yOSAwNDo1NTowOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1NzMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjkgMDQ6NTU6MDkgZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTc0L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE2LTAxLTI5IDA0OjU1OjA5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHU3NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
MS0yOSAwNDo1NTowOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1NzYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjkgMDQ6NTU6MDkgZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTc3L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgoyMDE2LTAxLTI5IDA0OjU1OjA5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHU3OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0y
OSAwNDo1NTowOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
NzkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjkgMDQ6NTU6MDkgZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDEtMjkgMDQ6NTU6MDkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjkgMDQ6
NTU6MTAgL3Vzci9iaW4vaGFja2JlbmNoIC1nIDEyODAgLS10aHJlYWRzIC0tcGlwZSAtbCAxODc1
CjIwMTYtMDEtMjkgMDQ6NTY6NDggL3Vzci9iaW4vaGFja2JlbmNoIC1nIDEyODAgLS10aHJlYWRz
IC0tcGlwZSAtbCAxODc1CjIwMTYtMDEtMjkgMDQ6NTg6MjIgL3Vzci9iaW4vaGFja2JlbmNoIC1n
IDEyODAgLS10aHJlYWRzIC0tcGlwZSAtbCAxODc1CjIwMTYtMDEtMjkgMDQ6NTk6NTAgL3Vzci9i
aW4vaGFja2JlbmNoIC1nIDEyODAgLS10aHJlYWRzIC0tcGlwZSAtbCAxODc1CjIwMTYtMDEtMjkg
MDU6MDE6MjEgL3Vzci9iaW4vaGFja2JlbmNoIC1nIDEyODAgLS10aHJlYWRzIC0tcGlwZSAtbCAx
ODc1CjIwMTYtMDEtMjkgMDU6MDI6NDkgL3Vzci9iaW4vaGFja2JlbmNoIC1nIDEyODAgLS10aHJl
YWRzIC0tcGlwZSAtbCAxODc1CjIwMTYtMDEtMjkgMDU6MDQ6MTYgL3Vzci9iaW4vaGFja2JlbmNo
IC1nIDEyODAgLS10aHJlYWRzIC0tcGlwZSAtbCAxODc1Cg==

--===============4213351331291803217==--

