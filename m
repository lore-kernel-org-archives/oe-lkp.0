Content-Type: multipart/mixed; boundary="===============5611391179681974999=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [sched/fair] 3a47d5124a: pigz.throughput -2.8% regression
Date: Mon, 28 Mar 2016 14:08:24 +0800
Message-ID: <20160328060824.GA3882@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5611391179681974999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed that pigz.throughput -2.8% regression with your commit, =


https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 3a47d5124a957358274e9ca7b115b2f3a914f56d ("sched/fair: Fix fairness =
issue on migration")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
blocksize/compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/te=
stcase:
  128K/gcc-4.9/performance/x86_64-rhel/100%/debian-x86_64-2015-02-07.cgz/lk=
p-snb01/pigz

commit: =

  2f5177f0fd7e531b26d54633be62d1d4cb94621c
  3a47d5124a957358274e9ca7b115b2f3a914f56d

2f5177f0fd7e531b 3a47d5124a957358274e9ca7b1 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
         %stddev     %change         %stddev
             \          |                \  =

 3.565e+08 =C2=B1  0%      -2.8%  3.466e+08 =C2=B1  0%  pigz.throughput
   3148624 =C2=B1  1%     -61.5%    1213138 =C2=B1  1%  pigz.time.involunta=
ry_context_switches
      3172 =C2=B1  0%      -4.9%       3017 =C2=B1  0%  pigz.time.percent_o=
f_cpu_this_job_got
    108.01 =C2=B1  0%     -12.7%      94.28 =C2=B1  0%  pigz.time.system_ti=
me
      9416 =C2=B1  0%      -4.8%       8963 =C2=B1  0%  pigz.time.user_time
   4435433 =C2=B1  0%     -25.4%    3308219 =C2=B1  0%  pigz.time.voluntary=
_context_switches
     22606 =C2=B1  6%      -8.5%      20692 =C2=B1  0%  meminfo.Shmem
      6211 =C2=B1 51%     +65.1%      10253 =C2=B1 13%  numa-meminfo.node1.=
AnonHugePages
     82109 =C2=B1  4%    +111.8%     173874 =C2=B1  5%  softirqs.SCHED
  17775779 =C2=B1  2%      -8.2%   16323423 =C2=B1  5%  numa-numastat.node0=
.local_node
  17777847 =C2=B1  2%      -8.2%   16324614 =C2=B1  5%  numa-numastat.node0=
.numa_hit
  10837718 =C2=B1 18%     -23.4%    8299086 =C2=B1  3%  numa-vmstat.node0.n=
uma_hit
  10771465 =C2=B1 18%     -23.6%    8232199 =C2=B1  3%  numa-vmstat.node0.n=
uma_local
      6147 =C2=B1  4%      +9.7%       6742 =C2=B1  4%  slabinfo.anon_vma.a=
ctive_objs
      6147 =C2=B1  4%      +9.7%       6742 =C2=B1  4%  slabinfo.anon_vma.n=
um_objs
      5652 =C2=B1  6%      -8.5%       5171 =C2=B1  0%  proc-vmstat.nr_shmem
     33999 =C2=B1  6%     +40.2%      47675 =C2=B1 14%  proc-vmstat.numa_pa=
ges_migrated
     33999 =C2=B1  6%     +40.2%      47675 =C2=B1 14%  proc-vmstat.pgmigra=
te_success
   3148624 =C2=B1  1%     -61.5%    1213138 =C2=B1  1%  time.involuntary_co=
ntext_switches
    108.01 =C2=B1  0%     -12.7%      94.28 =C2=B1  0%  time.system_time
   4435433 =C2=B1  0%     -25.4%    3308219 =C2=B1  0%  time.voluntary_cont=
ext_switches
      0.64 =C2=B1  5%    +707.0%       5.17 =C2=B1  1%  turbostat.CPU%c1
      0.01 =C2=B1  0%    +675.0%       0.08 =C2=B1  5%  turbostat.CPU%c3
     16.03 =C2=B1101%     -99.6%       0.06 =C2=B1100%  turbostat.Pkg%pc2
  14964297 =C2=B1 21%    +256.4%   53332691 =C2=B1  3%  cpuidle.C1-SNB.time
     58475 =C2=B1  5%    +229.5%     192657 =C2=B1  1%  cpuidle.C1-SNB.usage
  18841654 =C2=B1 15%    +709.6%  1.525e+08 =C2=B1  2%  cpuidle.C1E-SNB.time
     66706 =C2=B1 10%    +629.5%     486650 =C2=B1  1%  cpuidle.C1E-SNB.usa=
ge
   4314242 =C2=B1 12%    +575.3%   29134227 =C2=B1  1%  cpuidle.C3-SNB.time
     14262 =C2=B1 10%    +543.3%      91745 =C2=B1  2%  cpuidle.C3-SNB.usage
    133764 =C2=B1 27%    +434.9%     715504 =C2=B1  1%  cpuidle.C7-SNB.usage
 3.929e+08 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
   9059435 =C2=B1103%    -100.0%     160.00 =C2=B1 44%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.link_path_walk
 4.578e+08 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
  51327106 =C2=B1102%    -100.0%     257.25 =C2=B1 51%  latency_stats.max.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.link_path_walk
 7.858e+08 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
     20816 =C2=B1 25%    +361.7%      96106 =C2=B1 13%  latency_stats.sum.p=
ipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
 1.014e+08 =C2=B1107%    -100.0%       1445 =C2=B1 44%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.link_path_walk
    172662 =C2=B1 14%     -18.4%     140966 =C2=B1  0%  sched_debug.cfs_rq:=
/.exec_clock.avg
    172933 =C2=B1 14%     -18.0%     141779 =C2=B1  0%  sched_debug.cfs_rq:=
/.exec_clock.max
    171995 =C2=B1 14%     -18.6%     139924 =C2=B1  0%  sched_debug.cfs_rq:=
/.exec_clock.min
    179.82 =C2=B1 33%    +180.3%     504.10 =C2=B1 34%  sched_debug.cfs_rq:=
/.exec_clock.stddev
     18.12 =C2=B1 27%     -67.6%       5.88 =C2=B1 35%  sched_debug.cfs_rq:=
/.load.min
   5948149 =C2=B1 14%     -23.8%    4531737 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.avg
   5968318 =C2=B1 14%     -23.6%    4561399 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.max
   5921026 =C2=B1 14%     -24.1%    4496045 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.min
      0.67 =C2=B1 26%     -69.0%       0.21 =C2=B1 34%  sched_debug.cfs_rq:=
/.nr_running.min
      0.10 =C2=B1 40%    +185.3%       0.28 =C2=B1  9%  sched_debug.cfs_rq:=
/.nr_running.stddev
      0.38 =C2=B1 15%     -39.2%       0.23 =C2=B1 17%  sched_debug.cfs_rq:=
/.nr_spread_over.avg
     11.22 =C2=B1 12%     -46.1%       6.04 =C2=B1 28%  sched_debug.cfs_rq:=
/.nr_spread_over.max
      1.97 =C2=B1 12%     -45.5%       1.07 =C2=B1 26%  sched_debug.cfs_rq:=
/.nr_spread_over.stddev
     18.97 =C2=B1 27%     -69.7%       5.75 =C2=B1 36%  sched_debug.cfs_rq:=
/.runnable_load_avg.min
      4.44 =C2=B1 90%    +157.1%      11.41 =C2=B1 37%  sched_debug.cfs_rq:=
/.runnable_load_avg.stddev
     13030 =C2=B1176%    -199.0%     -12895 =C2=B1-101%  sched_debug.cfs_rq=
:/.spread0.avg
    -13998 =C2=B1-100%    +247.4%     -48630 =C2=B1-36%  sched_debug.cfs_rq=
:/.spread0.min
      9880 =C2=B1 23%     +59.9%      15795 =C2=B1 23%  sched_debug.cfs_rq:=
/.spread0.stddev
     34.89 =C2=B1  8%    +120.4%      76.89 =C2=B1 13%  sched_debug.cfs_rq:=
/.util_avg.stddev
    196657 =C2=B1 16%     +36.9%     269230 =C2=B1  6%  sched_debug.cpu.avg=
_idle.stddev
     17.42 =C2=B1 64%     -79.4%       3.58 =C2=B1 11%  sched_debug.cpu.clo=
ck.stddev
     17.42 =C2=B1 64%     -79.4%       3.58 =C2=B1 11%  sched_debug.cpu.clo=
ck_task.stddev
     18.10 =C2=B1 30%     -51.7%       8.75 =C2=B1 27%  sched_debug.cpu.cpu=
_load[0].min
     18.74 =C2=B1 27%     -44.9%      10.33 =C2=B1 18%  sched_debug.cpu.cpu=
_load[1].min
     19.22 =C2=B1 24%     -36.7%      12.17 =C2=B1  6%  sched_debug.cpu.cpu=
_load[2].min
      1912 =C2=B1 23%     -63.2%     704.04 =C2=B1 48%  sched_debug.cpu.cur=
r->pid.min
     18.12 =C2=B1 27%     -67.6%       5.88 =C2=B1 35%  sched_debug.cpu.loa=
d.min
    176320 =C2=B1 14%     -15.5%     148922 =C2=B1  0%  sched_debug.cpu.nr_=
load_updates.avg
    178699 =C2=B1 14%     -15.3%     151407 =C2=B1  0%  sched_debug.cpu.nr_=
load_updates.max
    174865 =C2=B1 14%     -15.8%     147278 =C2=B1  0%  sched_debug.cpu.nr_=
load_updates.min
      0.67 =C2=B1 26%     -69.0%       0.21 =C2=B1 34%  sched_debug.cpu.nr_=
running.min
      0.27 =C2=B1  8%     +41.3%       0.39 =C2=B1  5%  sched_debug.cpu.nr_=
running.stddev
    152747 =C2=B1 14%     -34.7%      99735 =C2=B1  0%  sched_debug.cpu.nr_=
switches.avg
    183979 =C2=B1 12%     -31.3%     126457 =C2=B1  5%  sched_debug.cpu.nr_=
switches.max
    135220 =C2=B1 15%     -41.5%      79108 =C2=B1  3%  sched_debug.cpu.nr_=
switches.min
    154367 =C2=B1 14%     -34.5%     101165 =C2=B1  0%  sched_debug.cpu.sch=
ed_count.avg
    225427 =C2=B1 12%     -20.1%     180086 =C2=B1  4%  sched_debug.cpu.sch=
ed_count.max
    134418 =C2=B1 14%     -41.5%      78674 =C2=B1  3%  sched_debug.cpu.sch=
ed_count.min
      6588 =C2=B1 22%    +264.1%      23990 =C2=B1  2%  sched_debug.cpu.sch=
ed_goidle.avg
     20233 =C2=B1 23%     +73.8%      35174 =C2=B1  7%  sched_debug.cpu.sch=
ed_goidle.max
      3150 =C2=B1 22%    +492.7%      18675 =C2=B1  2%  sched_debug.cpu.sch=
ed_goidle.min
     86325 =C2=B1 15%     -36.0%      55212 =C2=B1  0%  sched_debug.cpu.ttw=
u_count.avg
    103976 =C2=B1 13%     -33.4%      69252 =C2=B1  4%  sched_debug.cpu.ttw=
u_count.max
     74872 =C2=B1 14%     -39.3%      45412 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.min
     61351 =C2=B1 14%     -60.3%      24369 =C2=B1  1%  sched_debug.cpu.ttw=
u_local.avg
     68724 =C2=B1 13%     -56.3%      30060 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.max
     54792 =C2=B1 14%     -65.3%      19018 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.min
      9.86 =C2=B1  9%     -37.9%       6.13 =C2=B1  5%  perf-profile.cycles=
.__account_scheduler_latency.enqueue_entity.enqueue_task_fair.activate_task=
.ttwu_do_activate
      5.67 =C2=B1  3%     -18.2%       4.64 =C2=B1  6%  perf-profile.cycles=
.__alloc_pages_nodemask.alloc_pages_current.pipe_write.__vfs_write.vfs_write
      0.60 =C2=B1 98%    +306.6%       2.46 =C2=B1 19%  perf-profile.cycles=
.__do_softirq.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt
      2.69 =C2=B1 52%    +282.2%      10.26 =C2=B1  5%  perf-profile.cycles=
.__hrtimer_run_queues.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic=
_timer_interrupt.apic_timer_interrupt
      4.49 =C2=B1  9%     -36.3%       2.86 =C2=B1  9%  perf-profile.cycles=
.__kernel_text_address.print_context_stack.dump_trace.save_stack_trace_tsk.=
__account_scheduler_latency
      0.74 =C2=B1 23%     -40.4%       0.44 =C2=B1 20%  perf-profile.cycles=
.__list_del_entry.list_del.__rmqueue.get_page_from_freelist.__alloc_pages_n=
odemask
      0.88 =C2=B1 31%    +395.7%       4.34 =C2=B1  6%  perf-profile.cycles=
.__mutex_lock_slowpath.mutex_lock.pipe_read.__vfs_read.vfs_read
      0.41 =C2=B1 38%    +283.7%       1.59 =C2=B1 17%  perf-profile.cycles=
.__mutex_lock_slowpath.mutex_lock.pipe_wait.pipe_write.__vfs_write
      3.42 =C2=B1 11%     -32.5%       2.31 =C2=B1 16%  perf-profile.cycles=
.__put_page.anon_pipe_buf_release.pipe_read.__vfs_read.vfs_read
      1.01 =C2=B1  8%     -28.6%       0.72 =C2=B1 10%  perf-profile.cycles=
.__rmqueue.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_curren=
t.pipe_write
      1.05 =C2=B1 20%     -64.2%       0.38 =C2=B1 26%  perf-profile.cycles=
.__schedule.schedule.exit_to_usermode_loop.syscall_return_slowpath.entry_SY=
SCALL_64_fastpath
      2.86 =C2=B1 10%     -15.9%       2.40 =C2=B1  2%  perf-profile.cycles=
.__schedule.schedule.futex_wait_queue_me.futex_wait.do_futex
      0.92 =C2=B1  7%     -22.4%       0.72 =C2=B1 12%  perf-profile.cycles=
.__schedule.schedule.pipe_wait.pipe_write.__vfs_write
     26.84 =C2=B1  3%     -13.9%      23.11 =C2=B1  3%  perf-profile.cycles=
.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      3.23 =C2=B1 11%     -33.6%       2.15 =C2=B1  7%  perf-profile.cycles=
.__wake_up_common.__wake_up_sync_key.pipe_read.__vfs_read.vfs_read
      3.27 =C2=B1 10%     -33.1%       2.19 =C2=B1  5%  perf-profile.cycles=
.__wake_up_sync_key.pipe_read.__vfs_read.vfs_read.sys_read
      0.18 =C2=B1 59%    +745.1%       1.50 =C2=B1  9%  perf-profile.cycles=
.activate_task.ttwu_do_activate.sched_ttwu_pending.cpu_startup_entry.start_=
secondary
      1.65 =C2=B1 10%     -65.3%       0.57 =C2=B1 13%  perf-profile.cycles=
.activate_task.ttwu_do_activate.sched_ttwu_pending.scheduler_ipi.smp_resche=
dule_interrupt
      2.33 =C2=B1 12%     -33.2%       1.56 =C2=B1 10%  perf-profile.cycles=
.activate_task.ttwu_do_activate.try_to_wake_up.default_wake_function.autore=
move_wake_function
      5.23 =C2=B1 15%     -60.1%       2.09 =C2=B1 11%  perf-profile.cycles=
.activate_task.ttwu_do_activate.try_to_wake_up.wake_up_q.futex_requeue
      3.28 =C2=B1 10%     -35.9%       2.10 =C2=B1 13%  perf-profile.cycles=
.activate_task.ttwu_do_activate.try_to_wake_up.wake_up_q.futex_wake
      6.42 =C2=B1  3%     -15.8%       5.41 =C2=B1  4%  perf-profile.cycles=
.alloc_pages_current.pipe_write.__vfs_write.vfs_write.sys_write
      2.05 =C2=B1 13%     -37.9%       1.27 =C2=B1  4%  perf-profile.cycles=
.anon_pipe_buf_release.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpa=
th
      3.51 =C2=B1 11%     -33.3%       2.35 =C2=B1 16%  perf-profile.cycles=
.anon_pipe_buf_release.pipe_read.__vfs_read.vfs_read.sys_read
      5.04 =C2=B1 49%    +239.8%      17.13 =C2=B1  9%  perf-profile.cycles=
.apic_timer_interrupt
      3.18 =C2=B1 12%     -34.0%       2.10 =C2=B1  7%  perf-profile.cycles=
.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.pipe_read.__v=
fs_read
      1.06 =C2=B1 77%    +158.9%       2.76 =C2=B1  5%  perf-profile.cycles=
.call_cpuidle.cpu_startup_entry.start_secondary
      0.27 =C2=B1133%    +230.6%       0.89 =C2=B1 24%  perf-profile.cycles=
.clockevents_program_event.tick_program_event.hrtimer_interrupt.local_apic_=
timer_interrupt.smp_apic_timer_interrupt
     17.49 =C2=B1  3%     -21.5%      13.73 =C2=B1  1%  perf-profile.cycles=
.copy_page_from_iter.pipe_write.__vfs_write.vfs_write.sys_write
      1.45 =C2=B1  9%     -21.4%       1.14 =C2=B1 13%  perf-profile.cycles=
.copy_page_from_iter_iovec.copy_page_from_iter.pipe_write.__vfs_write.vfs_w=
rite
     24.42 =C2=B1  3%     -15.2%      20.70 =C2=B1  2%  perf-profile.cycles=
.copy_page_to_iter.pipe_read.__vfs_read.vfs_read.sys_read
     15.67 =C2=B1  3%     -22.7%      12.12 =C2=B1  1%  perf-profile.cycles=
.copy_user_generic_string.copy_page_from_iter.pipe_write.__vfs_write.vfs_wr=
ite
     23.42 =C2=B1  3%     -15.8%      19.72 =C2=B1  2%  perf-profile.cycles=
.copy_user_generic_string.copy_page_to_iter.pipe_read.__vfs_read.vfs_read
      1.80 =C2=B1 54%    +329.2%       7.71 =C2=B1  5%  perf-profile.cycles=
.cpu_startup_entry.start_secondary
      1.06 =C2=B1 77%    +157.0%       2.74 =C2=B1  5%  perf-profile.cycles=
.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_secondary
      1.46 =C2=B1 12%     -31.4%       1.00 =C2=B1 14%  perf-profile.cycles=
.deactivate_task.__schedule.schedule.futex_wait_queue_me.futex_wait
      3.17 =C2=B1 12%     -34.1%       2.09 =C2=B1  7%  perf-profile.cycles=
.default_wake_function.autoremove_wake_function.__wake_up_common.__wake_up_=
sync_key.pipe_read
     17.95 =C2=B1  7%     -42.3%      10.36 =C2=B1  2%  perf-profile.cycles=
.do_futex.sys_futex.entry_SYSCALL_64_fastpath
      8.78 =C2=B1  9%     -36.6%       5.57 =C2=B1  4%  perf-profile.cycles=
.dump_trace.save_stack_trace_tsk.__account_scheduler_latency.enqueue_entity=
.enqueue_task_fair
      9.98 =C2=B1 10%     -45.7%       5.42 =C2=B1  4%  perf-profile.cycles=
.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wak=
e_up
      0.16 =C2=B1 60%    +843.1%       1.53 =C2=B1 10%  perf-profile.cycles=
.enqueue_task_fair.activate_task.ttwu_do_activate.sched_ttwu_pending.cpu_st=
artup_entry
      1.60 =C2=B1 13%     -65.3%       0.55 =C2=B1 15%  perf-profile.cycles=
.enqueue_task_fair.activate_task.ttwu_do_activate.sched_ttwu_pending.schedu=
ler_ipi
      2.29 =C2=B1 11%     -34.1%       1.51 =C2=B1  9%  perf-profile.cycles=
.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.default_wa=
ke_function
      8.37 =C2=B1 14%     -50.9%       4.11 =C2=B1  5%  perf-profile.cycles=
.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.wake_up_q
     83.20 =C2=B1  3%     -19.0%      67.36 =C2=B1  2%  perf-profile.cycles=
.entry_SYSCALL_64_fastpath
      1.17 =C2=B1 19%     -60.8%       0.46 =C2=B1 34%  perf-profile.cycles=
.exit_to_usermode_loop.syscall_return_slowpath.entry_SYSCALL_64_fastpath
      3.13 =C2=B1 12%     -33.5%       2.08 =C2=B1 17%  perf-profile.cycles=
.free_hot_cold_page.__put_page.anon_pipe_buf_release.pipe_read.__vfs_read
      1.68 =C2=B1 13%     -51.9%       0.81 =C2=B1 13%  perf-profile.cycles=
.free_pcppages_bulk.free_hot_cold_page.__put_page.anon_pipe_buf_release.pip=
e_read
      8.80 =C2=B1  7%     -58.6%       3.64 =C2=B1  6%  perf-profile.cycles=
.futex_requeue.do_futex.sys_futex.entry_SYSCALL_64_fastpath
      4.01 =C2=B1 12%     -21.3%       3.16 =C2=B1  3%  perf-profile.cycles=
.futex_wait.do_futex.sys_futex.entry_SYSCALL_64_fastpath
      3.38 =C2=B1  8%     -17.7%       2.78 =C2=B1  3%  perf-profile.cycles=
.futex_wait_queue_me.futex_wait.do_futex.sys_futex.entry_SYSCALL_64_fastpath
      4.59 =C2=B1 10%     -26.7%       3.37 =C2=B1 11%  perf-profile.cycles=
.futex_wake.do_futex.sys_futex.entry_SYSCALL_64_fastpath
      4.08 =C2=B1  3%     -21.1%       3.22 =C2=B1  5%  perf-profile.cycles=
.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_current.pipe_wri=
te.__vfs_write
      3.29 =C2=B1 59%    +274.5%      12.30 =C2=B1  8%  perf-profile.cycles=
.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_timer_interrupt.apic=
_timer_interrupt
      0.33 =C2=B1 32%    +514.2%       2.06 =C2=B1  3%  perf-profile.cycles=
.intel_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry
      0.67 =C2=B1 99%    +290.4%       2.63 =C2=B1 17%  perf-profile.cycles=
.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt
      1.07 =C2=B1  3%     -49.4%       0.54 =C2=B1 27%  perf-profile.cycles=
.is_ftrace_trampoline.__kernel_text_address.print_context_stack.dump_trace.=
save_stack_trace_tsk
      1.74 =C2=B1 12%     -32.8%       1.17 =C2=B1 10%  perf-profile.cycles=
.is_module_text_address.__kernel_text_address.print_context_stack.dump_trac=
e.save_stack_trace_tsk
      0.76 =C2=B1 22%     -39.6%       0.46 =C2=B1 17%  perf-profile.cycles=
.list_del.__rmqueue.get_page_from_freelist.__alloc_pages_nodemask.alloc_pag=
es_current
      3.41 =C2=B1 59%    +268.5%      12.55 =C2=B1  8%  perf-profile.cycles=
.local_apic_timer_interrupt.smp_apic_timer_interrupt.apic_timer_interrupt
      0.93 =C2=B1 29%    +369.4%       4.37 =C2=B1  6%  perf-profile.cycles=
.mutex_lock.pipe_read.__vfs_read.vfs_read.sys_read
      0.44 =C2=B1 39%    +273.3%       1.64 =C2=B1 16%  perf-profile.cycles=
.mutex_lock.pipe_wait.pipe_write.__vfs_write.vfs_write
      0.88 =C2=B1 31%    +394.0%       4.32 =C2=B1  5%  perf-profile.cycles=
.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.pipe_read.__vfs_read
      0.41 =C2=B1 38%    +283.7%       1.59 =C2=B1 17%  perf-profile.cycles=
.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.pipe_wait.pipe_write
      0.85 =C2=B1 33%    +396.2%       4.24 =C2=B1  5%  perf-profile.cycles=
.mutex_spin_on_owner.isra.4.mutex_optimistic_spin.__mutex_lock_slowpath.mut=
ex_lock.pipe_read
      0.41 =C2=B1 38%    +276.5%       1.56 =C2=B1 18%  perf-profile.cycles=
.mutex_spin_on_owner.isra.4.mutex_optimistic_spin.__mutex_lock_slowpath.mut=
ex_lock.pipe_wait
      0.23 =C2=B1 98%    +298.9%       0.92 =C2=B1 12%  perf-profile.cycles=
.perf_event_task_tick.scheduler_tick.update_process_times.tick_sched_handle=
.tick_sched_timer
      1.55 =C2=B1 11%     +60.2%       2.49 =C2=B1 12%  perf-profile.cycles=
.pipe_wait.pipe_write.__vfs_write.vfs_write.sys_write
     26.79 =C2=B1  3%     -14.0%      23.05 =C2=B1  3%  perf-profile.cycles=
.pipe_write.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      0.67 =C2=B1 97%     -90.7%       0.06 =C2=B1 54%  perf-profile.cycles=
.poll_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry
      7.72 =C2=B1 10%     -36.3%       4.92 =C2=B1  5%  perf-profile.cycles=
.print_context_stack.dump_trace.save_stack_trace_tsk.__account_scheduler_la=
tency.enqueue_entity
      0.22 =C2=B1 27%    +448.9%       1.23 =C2=B1 18%  perf-profile.cycles=
.rcu_check_callbacks.update_process_times.tick_sched_handle.tick_sched_time=
r.__hrtimer_run_queues
      1.72 =C2=B1 10%     -82.1%       0.31 =C2=B1 16%  perf-profile.cycles=
.reschedule_interrupt
      0.36 =C2=B1 82%    +222.2%       1.16 =C2=B1 22%  perf-profile.cycles=
.run_timer_softirq.__do_softirq.irq_exit.smp_apic_timer_interrupt.apic_time=
r_interrupt
      8.82 =C2=B1 10%     -36.9%       5.57 =C2=B1  3%  perf-profile.cycles=
.save_stack_trace_tsk.__account_scheduler_latency.enqueue_entity.enqueue_ta=
sk_fair.activate_task
      0.23 =C2=B1 40%    +625.8%       1.69 =C2=B1  4%  perf-profile.cycles=
.sched_ttwu_pending.cpu_startup_entry.start_secondary
      1.37 =C2=B1 11%     -81.2%       0.26 =C2=B1 18%  perf-profile.cycles=
.sched_ttwu_pending.scheduler_ipi.smp_reschedule_interrupt.reschedule_inter=
rupt
      1.09 =C2=B1 21%     -63.3%       0.40 =C2=B1 29%  perf-profile.cycles=
.schedule.exit_to_usermode_loop.syscall_return_slowpath.entry_SYSCALL_64_fa=
stpath
      3.00 =C2=B1  8%     -14.5%       2.57 =C2=B1  4%  perf-profile.cycles=
.schedule.futex_wait_queue_me.futex_wait.do_futex.sys_futex
      0.96 =C2=B1 10%     -24.1%       0.72 =C2=B1 13%  perf-profile.cycles=
.schedule.pipe_wait.pipe_write.__vfs_write.vfs_write
      0.11 =C2=B1 44%    +675.6%       0.87 =C2=B1 19%  perf-profile.cycles=
.schedule.schedule_preempt_disabled.cpu_startup_entry.start_secondary
      0.11 =C2=B1 44%    +675.6%       0.87 =C2=B1 19%  perf-profile.cycles=
.schedule_preempt_disabled.cpu_startup_entry.start_secondary
      1.47 =C2=B1 14%     -82.0%       0.27 =C2=B1 21%  perf-profile.cycles=
.scheduler_ipi.smp_reschedule_interrupt.reschedule_interrupt
      1.65 =C2=B1 61%    +266.8%       6.04 =C2=B1  9%  perf-profile.cycles=
.scheduler_tick.update_process_times.tick_sched_handle.tick_sched_timer.__h=
rtimer_run_queues
      1.38 =C2=B1 17%     -66.1%       0.47 =C2=B1 13%  perf-profile.cycles=
.select_task_rq_fair.try_to_wake_up.wake_up_q.futex_requeue.do_futex
      4.41 =C2=B1 62%    +258.0%      15.80 =C2=B1  9%  perf-profile.cycles=
.smp_apic_timer_interrupt.apic_timer_interrupt
      1.50 =C2=B1 14%     -80.8%       0.29 =C2=B1 17%  perf-profile.cycles=
.smp_reschedule_interrupt.reschedule_interrupt
      1.81 =C2=B1 54%    +336.0%       7.89 =C2=B1  4%  perf-profile.cycles=
.start_secondary
     18.17 =C2=B1  7%     -42.4%      10.46 =C2=B1  2%  perf-profile.cycles=
.sys_futex.entry_SYSCALL_64_fastpath
     35.99 =C2=B1  2%      -9.8%      32.45 =C2=B1  3%  perf-profile.cycles=
.sys_read.entry_SYSCALL_64_fastpath
     27.21 =C2=B1  3%     -14.1%      23.37 =C2=B1  3%  perf-profile.cycles=
.sys_write.entry_SYSCALL_64_fastpath
      1.21 =C2=B1 17%     -57.6%       0.52 =C2=B1 32%  perf-profile.cycles=
.syscall_return_slowpath.entry_SYSCALL_64_fastpath
      0.85 =C2=B1 52%    +261.2%       3.07 =C2=B1  7%  perf-profile.cycles=
.task_tick_fair.scheduler_tick.update_process_times.tick_sched_handle.tick_=
sched_timer
      0.32 =C2=B1134%    +244.2%       1.11 =C2=B1 21%  perf-profile.cycles=
.tick_program_event.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_t=
imer_interrupt.apic_timer_interrupt
      2.31 =C2=B1 50%    +274.6%       8.66 =C2=B1  6%  perf-profile.cycles=
.tick_sched_handle.isra.19.tick_sched_timer.__hrtimer_run_queues.hrtimer_in=
terrupt.local_apic_timer_interrupt
      2.44 =C2=B1 53%    +279.1%       9.23 =C2=B1  6%  perf-profile.cycles=
.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.local_apic_timer_i=
nterrupt.smp_apic_timer_interrupt
      3.17 =C2=B1 12%     -33.4%       2.11 =C2=B1  7%  perf-profile.cycles=
.try_to_wake_up.default_wake_function.autoremove_wake_function.__wake_up_co=
mmon.__wake_up_sync_key
      7.72 =C2=B1  8%     -61.4%       2.98 =C2=B1  6%  perf-profile.cycles=
.try_to_wake_up.wake_up_q.futex_requeue.do_futex.sys_futex
      4.04 =C2=B1  8%     -27.5%       2.93 =C2=B1 11%  perf-profile.cycles=
.try_to_wake_up.wake_up_q.futex_wake.do_futex.sys_futex
      0.19 =C2=B1 51%    +728.6%       1.59 =C2=B1  7%  perf-profile.cycles=
.ttwu_do_activate.constprop.89.sched_ttwu_pending.cpu_startup_entry.start_s=
econdary
      1.72 =C2=B1 11%     -61.5%       0.66 =C2=B1 15%  perf-profile.cycles=
.ttwu_do_activate.constprop.89.sched_ttwu_pending.scheduler_ipi.smp_resched=
ule_interrupt.reschedule_interrupt
      2.43 =C2=B1 13%     -31.6%       1.66 =C2=B1  7%  perf-profile.cycles=
.ttwu_do_activate.constprop.89.try_to_wake_up.default_wake_function.autorem=
ove_wake_function.__wake_up_common
      5.57 =C2=B1 16%     -60.2%       2.21 =C2=B1 11%  perf-profile.cycles=
.ttwu_do_activate.constprop.89.try_to_wake_up.wake_up_q.futex_requeue.do_fu=
tex
      3.43 =C2=B1  8%     -36.8%       2.17 =C2=B1 12%  perf-profile.cycles=
.ttwu_do_activate.constprop.89.try_to_wake_up.wake_up_q.futex_wake.do_futex
      0.31 =C2=B1 83%    +243.9%       1.06 =C2=B1  6%  perf-profile.cycles=
.update_cfs_shares.task_tick_fair.scheduler_tick.update_process_times.tick_=
sched_handle
      2.27 =C2=B1 52%    +274.1%       8.49 =C2=B1  5%  perf-profile.cycles=
.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_queu=
es.hrtimer_interrupt
     35.85 =C2=B1  2%      -9.7%      32.36 =C2=B1  3%  perf-profile.cycles=
.vfs_read.sys_read.entry_SYSCALL_64_fastpath
     27.07 =C2=B1  2%     -14.1%      23.25 =C2=B1  3%  perf-profile.cycles=
.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      7.87 =C2=B1  7%     -60.7%       3.09 =C2=B1  5%  perf-profile.cycles=
.wake_up_q.futex_requeue.do_futex.sys_futex.entry_SYSCALL_64_fastpath
      4.09 =C2=B1  8%     -27.0%       2.98 =C2=B1 10%  perf-profile.cycles=
.wake_up_q.futex_wake.do_futex.sys_futex.entry_SYSCALL_64_fastpath



lkp-snb01: Sandy Bridge-EP
Memory: 32G


                                    pigz.throughput

  3.58e+08 ++--------------------------------------------------------------=
-+
           *.         .*.*..*.         .*.*..      .*.              .*.    =
 |
  3.56e+08 ++*..*.*..*        *..*.*.*.      *.*..*   *..*.*..*.*.*.   *..*=
.*
           |                                                               =
 |
           |                                                               =
 |
  3.54e+08 ++                                                              =
 |
           |                                                               =
 |
  3.52e+08 ++                                                              =
 |
           |                                                               =
 |
   3.5e+08 ++                                                              =
 |
           |                                                               =
 |
           |                                                               =
 |
  3.48e+08 ++          O    O O  O   O                                     =
 |
           O O  O    O   O                O  O    O                        =
 |
  3.46e+08 ++-----O----------------O----O------O---------------------------=
-+


                                pigz.time.user_time

  9450 ++-------------------------------*----------------------------------=
-+
  9400 *+.*.*..*.*..*.*..*.*..*..*.  .*    *.*..*.*..*..*.*..*.*..*.*..*.*.=
.*
       |                           *.                                      =
 |
  9350 ++                                                                  =
 |
  9300 ++                                                                  =
 |
       |                                                                   =
 |
  9250 ++                                                                  =
 |
  9200 ++                                                                  =
 |
  9150 ++                                                                  =
 |
       |                                                                   =
 |
  9100 ++                                                                  =
 |
  9050 ++                                                                  =
 |
       |                      O    O                                       =
 |
  9000 O+ O O       O O  O O            O                                  =
 |
  8950 ++------O-O---------------O----O----O-O--O--------------------------=
-+


                               pigz.time.system_time

  110 ++-------------------------------------------------------------------=
-+
      *..         .*..      .*..         .*..    .*..         .*.. .*..    =
.*
  108 ++ *.*..*.*.    *.*..*    *..*.*..*    *.*.    *.*..*.*.    *    *.*.=
 |
  106 ++                                                                   =
 |
      |                                                                    =
 |
  104 ++                                                                   =
 |
  102 ++                                                                   =
 |
      |                                                                    =
 |
  100 ++                                                                   =
 |
   98 ++                                                                   =
 |
      |                                                                    =
 |
   96 ++                                                                   =
 |
   94 O+   O  O O     O         O    O    O  O O                           =
 |
      |  O         O    O  O O     O    O                                  =
 |
   92 ++-------------------------------------------------------------------=
-+


                       pigz.time.percent_of_cpu_this_job_got

  3180 *+-----------*-*--*--------------*----*----*------------*--*-*----*-=
-+
       |  *.*..*.*.        *..*..*.*..*    *    *    *..*.*..*         *   =
 *
  3160 ++                                                                  =
 |
  3140 ++                                                                  =
 |
       |                                                                   =
 |
  3120 ++                                                                  =
 |
  3100 ++                                                                  =
 |
       |                                                                   =
 |
  3080 ++                                                                  =
 |
  3060 ++                                                                  =
 |
       |                                                                   =
 |
  3040 ++                     O    O                                       =
 |
  3020 ++ O         O O  O O            O                                  =
 |
       O    O  O O               O    O    O O  O                          =
 |
  3000 ++------------------------------------------------------------------=
-+


                         pigz.time.voluntary_context_switches

  4.6e+06 ++---------------------------------------------------------------=
-+
          *.              .*..           .*.  .*.  .*.         .*.       .*=
.|
  4.4e+06 ++*..*.*..*.*..*    *.*.*..*.*.   *.   *.   *.*..*.*.   *..*.*.  =
 *
          |                                                                =
 |
  4.2e+06 ++                                                               =
 |
          |                                                                =
 |
    4e+06 ++                                                               =
 |
          |                                                                =
 |
  3.8e+06 ++                                                               =
 |
          |                                                                =
 |
  3.6e+06 ++                                                               =
 |
          |                                                                =
 |
  3.4e+06 ++                                                               =
 |
          O O  O O  O O  O O  O O O  O O  O O  O O                         =
 |
  3.2e+06 ++---------------------------------------------------------------=
-+


                        pigz.time.involuntary_context_switches

  3.5e+06 ++---------------------------------------------------------------=
-+
          |                              .*.                               =
 |
          *.*..*.*..*.*..*.*..*.*.*..*.*.   *..*.*..*.*.*..*.*..*.*..*.*..*=
.*
    3e+06 ++                                                               =
 |
          |                                                                =
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
          |                                                                =
 |
  1.5e+06 ++                                                               =
 |
          |                O    O    O                                     =
 |
          O O  O O  O O  O    O   O    O  O O  O O                         =
 |
    1e+06 ++---------------------------------------------------------------=
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
Xiaolong Ye

--===============5611391179681974999==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogcGlnegpkZWZhdWx0LW1vbml0b3JzOgogIHdhaXQ6IGFjdGl2YXRlLW1vbml0b3IK
ICBrbXNnOiAKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgaGVhcnRiZWF0OiAKICB2bXN0YXQ6IAog
IG51bWEtbnVtYXN0YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mt
dm1zdGF0OiAKICBwcm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFi
aW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBz
b2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAog
IGNwdWlkbGU6IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBz
Y2hlZF9kZWJ1ZzoKICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiBwZXJmb3JtYW5j
ZQpkZWZhdWx0LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDog
M2E0N2Q1MTI0YTk1NzM1ODI3NGU5Y2E3YjExNWIyZjNhOTE0ZjU2ZAptb2RlbDogU2FuZHkgQnJp
ZGdlLUVQCm1lbW9yeTogMzJHCmhkZF9wYXJ0aXRpb25zOiAiL2Rldi9zZGEyIgpzd2FwX3BhcnRp
dGlvbnM6IApjYXRlZ29yeTogYmVuY2htYXJrCnBlcmYtcHJvZmlsZToKICBmcmVxOiA4MDAKbnJf
dGhyZWFkczogMTAwJQpwaWd6OgogIGJsb2Nrc2l6ZTogMTI4SwpxdWV1ZTogYmlzZWN0CnRlc3Ri
b3g6IGxrcC1zbmIwMQp0Ym94X2dyb3VwOiBsa3Atc25iMDEKa2NvbmZpZzogeDg2XzY0LXJoZWwK
ZW5xdWV1ZV90aW1lOiAyMDE2LTAzLTI3IDAwOjEzOjUxLjU2NjkzNDIwMSArMDg6MDAKY29tcGls
ZXI6IGdjYy00LjkKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CmlkOiBjM2I3
MTI3ZjcxNjM5NTFjZjI0ZGJmNmIwM2MxZTkyMzY3YzhiNGFmCnVzZXI6IGxrcApoZWFkX2NvbW1p
dDogMTcwMWY2ODA0MDdjNmNjMDUxMjE1NjZjZWY1MjkzZDMzODgxZmU3MQpiYXNlX2NvbW1pdDog
MTBmMTY4NWZkNTlkNGRlZDIyNjEyMzU1MGJkYWVmMTc2Yjk5ZjY1ZgpicmFuY2g6IGxpbnVzL21h
c3RlcgpyZXN1bHRfcm9vdDogIi9yZXN1bHQvcGlnei9wZXJmb3JtYW5jZS0xMDAlLTEyOEsvbGtw
LXNuYjAxL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS8z
YTQ3ZDUxMjRhOTU3MzU4Mjc0ZTljYTdiMTE1YjJmM2E5MTRmNTZkLzAiCmpvYl9maWxlOiAiL2xr
cC9zY2hlZHVsZWQvbGtwLXNuYjAxL2Jpc2VjdF9waWd6LXBlcmZvcm1hbmNlLTEwMCUtMTI4Sy1k
ZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82NC1yaGVsLTNhNDdkNTEyNGE5NTczNTgy
NzRlOWNhN2IxMTViMmYzYTkxNGY1NmQtMjAxNjAzMjctOTE1MTEtMThybXlldC0wLnlhbWwiCm5y
X2NwdTogIiQobnByb2MpIgptYXhfdXB0aW1lOiAxMjcyLjk0CmluaXRyZDogIi9vc2ltYWdlL2Rl
Ymlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpib290bG9hZGVyX2FwcGVuZDoKLSBy
b290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Avc2NoZWR1bGVkL2xrcC1zbmIwMS9i
aXNlY3RfcGlnei1wZXJmb3JtYW5jZS0xMDAlLTEyOEstZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3
LmNnei14ODZfNjQtcmhlbC0zYTQ3ZDUxMjRhOTU3MzU4Mjc0ZTljYTdiMTE1YjJmM2E5MTRmNTZk
LTIwMTYwMzI3LTkxNTExLTE4cm15ZXQtMC55YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmlnPXg4
Nl82NC1yaGVsCi0gYnJhbmNoPWxpbnVzL21hc3RlcgotIGNvbW1pdD0zYTQ3ZDUxMjRhOTU3MzU4
Mjc0ZTljYTdiMTE1YjJmM2E5MTRmNTZkCi0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1y
aGVsL2djYy00LjkvM2E0N2Q1MTI0YTk1NzM1ODI3NGU5Y2E3YjExNWIyZjNhOTE0ZjU2ZC92bWxp
bnV6LTQuNS4wLTAwNzY0LWczYTQ3ZDUxCi0gbWF4X3VwdGltZT0xMjcyCi0gUkVTVUxUX1JPT1Q9
L3Jlc3VsdC9waWd6L3BlcmZvcm1hbmNlLTEwMCUtMTI4Sy9sa3Atc25iMDEvZGViaWFuLXg4Nl82
NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzNhNDdkNTEyNGE5NTczNTgyNzRl
OWNhN2IxMTViMmYzYTkxNGY1NmQvMAotIExLUF9TRVJWRVI9aW5uCi0gfDItCgoKICBlYXJseXBy
aW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCiAgZGVidWcgYXBpYz1kZWJ1
ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAw
CiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRjaGRvZz1wYW5pYyBvb3BzPXBh
bmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNrPTAKICBjb25zb2xlPXR0eVMwLDExNTIw
MCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwpsa3BfaW5pdHJkOiAiL2xrcC9sa3AvbGtw
LXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2Mt
NC45LzNhNDdkNTEyNGE5NTczNTgyNzRlOWNhN2IxMTViMmYzYTkxNGY1NmQvbW9kdWxlcy5jZ3oi
CmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9s
a3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9ydW4taXBj
b25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei90dXJi
b3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy90dXJib3N0YXQuY2d6LC9vc2ltYWdlL2RlcHMvZGVi
aWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9waWd6LmNneiIKbGludXhfaGVhZGVyc19pbml0cmQ6
ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvM2E0N2Q1MTI0YTk1NzM1ODI3NGU5Y2E3
YjExNWIyZjNhOTE0ZjU2ZC9saW51eC1oZWFkZXJzLmNneiIKcmVwZWF0X3RvOiAyCmtlcm5lbDog
Ii9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS8zYTQ3ZDUxMjRhOTU3MzU4Mjc0ZTljYTdi
MTE1YjJmM2E5MTRmNTZkL3ZtbGludXotNC41LjAtMDA3NjQtZzNhNDdkNTEiCmRlcXVldWVfdGlt
ZTogMjAxNi0wMy0yNyAwMDoyMjoxOS45NzgyMjQ1NTEgKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNo
ZWQKbG9hZGF2ZzogMjguNTUgMTkuNTQgOC41OSAxLzM5MyA4Nzk2CnN0YXJ0X3RpbWU6ICcxNDU5
MDA5MzgzJwplbmRfdGltZTogJzE0NTkwMDk2ODMnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIw
MTYwMzI1LTIwNTgxNyIK

--===============5611391179681974999==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wMy0yNyAwMDoyMzowMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAwMDoyMzowMiBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAwMDoyMzowMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDMtMjcgMDA6MjM6MDIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3IDAwOjIzOjAyIGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMy0yNyAwMDoyMzowMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMt
MjcgMDA6MjM6MDIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3IDAwOjIzOjAyIGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMy0yNyAwMDoyMzowMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcg
MDA6MjM6MDIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3IDAwOjIzOjAyIGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxOC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMy0yNyAwMDoyMzowMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMDA6
MjM6MDIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMDA6MjM6MDIgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTAzLTI3IDAwOjIzOjAyIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUyMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAwMDoyMzow
MiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjIvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMDA6MjM6MDIgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTAzLTI3IDAwOjIzOjAyIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHUyNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAwMDoyMzowMiBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjUvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMDA6MjM6MDIgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAzLTI3IDAwOjIzOjAyIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUyNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAwMDoyMzowMiBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjgvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMDA6MjM6MDIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAz
LTI3IDAwOjIzOjAyIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3IDAwOjIzOjAyIGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMy0yNyAwMDoyMzowMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MzEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcg
MDA6MjM6MDIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMDA6MjM6MDIgZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCjIwMTYtMDMtMjcgMDA6MjM6MDIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMDA6MjM6
MDIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMDA6MjM6MDIgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIw
MTYtMDMtMjcgMDA6MjM6MDIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCg==

--===============5611391179681974999==--

