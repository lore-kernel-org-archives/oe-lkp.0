Content-Type: multipart/mixed; boundary="===============0227001099083063040=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [hperf_hmp] 9b7aaf11b8: -55.6% hackbench.throughput
Date: Tue, 10 Nov 2015 09:32:38 +0800
Message-ID: <87r3jyd4g9.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0227001099083063040==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://github.com/0day-ci/linux Arseniy-Krasnov/High-performance-balancing=
-logic-for-big-LITTLE/20151106-200901
commit 9b7aaf11b8d61eeb87f3b99fb5ae59e61bb35f27 ("hperf_hmp: task CPU selec=
tion logic.")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/testtime/test:
  ivb43/aim9/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/3=
00s/fork_test

commit: =

  1fda6948fbb2e756c8f7cabef40395cee2984298
  9b7aaf11b8d61eeb87f3b99fb5ae59e61bb35f27

1fda6948fbb2e756 9b7aaf11b8d61eeb87f3b99fb5 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      3629 =C2=B1  0%     +79.8%       6527 =C2=B1  0%  aim9.fork_test.ops_=
per_sec
      2397 =C2=B1  0%      +3.8%       2488 =C2=B1  2%  aim9.time.maximum_r=
esident_set_size
  36751387 =C2=B1  0%     +79.8%   66094007 =C2=B1  0%  aim9.time.minor_pag=
e_faults
    106.00 =C2=B1  0%      -1.9%     104.00 =C2=B1  0%  aim9.time.percent_o=
f_cpu_this_job_got
   2177097 =C2=B1  0%     +79.7%    3912847 =C2=B1  0%  aim9.time.voluntary=
_context_switches
    384576 =C2=B1  2%     -19.8%     308345 =C2=B1  1%  softirqs.TIMER
     18717 =C2=B1  0%     +55.2%      29047 =C2=B1  0%  vmstat.system.cs
      1992 =C2=B1  0%     +23.0%       2450 =C2=B1  1%  vmstat.system.in
      0.00 =C2=B1 -1%      +Inf%    4667955 =C2=B1159%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%   12289867 =C2=B1167%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%   13417616 =C2=B1168%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
  36751387 =C2=B1  0%     +79.8%   66094007 =C2=B1  0%  time.minor_page_fau=
lts
      7.79 =C2=B1  1%     -29.6%       5.49 =C2=B1  1%  time.user_time
   2177097 =C2=B1  0%     +79.7%    3912847 =C2=B1  0%  time.voluntary_cont=
ext_switches
  18182069 =C2=B1  2%    +105.0%   37282110 =C2=B1 20%  numa-numastat.node0=
.local_node
  18185182 =C2=B1  2%    +105.0%   37283692 =C2=B1 20%  numa-numastat.node0=
.numa_hit
  17845226 =C2=B1  1%     +47.1%   26257212 =C2=B1 29%  numa-numastat.node1=
.local_node
  17848334 =C2=B1  1%     +47.1%   26261870 =C2=B1 29%  numa-numastat.node1=
.numa_hit
   9231389 =C2=B1  2%    +103.2%   18760144 =C2=B1 20%  numa-vmstat.node0.n=
uma_hit
   9194586 =C2=B1  2%    +104.0%   18756465 =C2=B1 20%  numa-vmstat.node0.n=
uma_local
   9020640 =C2=B1  1%     +46.1%   13177749 =C2=B1 29%  numa-vmstat.node1.n=
uma_hit
   8970377 =C2=B1  1%     +46.0%   13094337 =C2=B1 29%  numa-vmstat.node1.n=
uma_local
     50263 =C2=B1 57%     +65.9%      83410 =C2=B1  2%  numa-vmstat.node1.n=
uma_other
    187073 =C2=B1  0%     +27.5%     238459 =C2=B1  0%  meminfo.Active
     37344 =C2=B1  0%     +29.7%      48445 =C2=B1  0%  meminfo.Active(anon)
    149728 =C2=B1  0%     +26.9%     190013 =C2=B1  0%  meminfo.Active(file)
     26246 =C2=B1  1%     +19.4%      31326 =C2=B1  1%  meminfo.AnonPages
    124178 =C2=B1  1%     +42.7%     177141 =C2=B1  2%  meminfo.Committed_AS
     16449 =C2=B1  3%      -7.1%      15283 =C2=B1  4%  meminfo.KernelStack
     23552 =C2=B1  0%     +19.4%      28124 =C2=B1  0%  meminfo.Shmem
      1.94 =C2=B1  0%     +25.8%       2.44 =C2=B1  1%  turbostat.%Busy
     62.00 =C2=B1  0%     +19.4%      74.00 =C2=B1  1%  turbostat.Avg_MHz
     19.19 =C2=B1  1%    +237.2%      64.70 =C2=B1  1%  turbostat.CPU%c1
      2.52 =C2=B1 14%     -96.4%       0.09 =C2=B1 20%  turbostat.CPU%c3
     76.35 =C2=B1  0%     -57.1%      32.77 =C2=B1  2%  turbostat.CPU%c6
     71.02 =C2=B1  0%      +7.0%      76.01 =C2=B1  0%  turbostat.CorWatt
      1.02 =C2=B1  6%     -92.9%       0.07 =C2=B1  5%  turbostat.Pkg%pc2
    101.32 =C2=B1  0%      +5.2%     106.59 =C2=B1  0%  turbostat.PkgWatt
 5.393e+08 =C2=B1  4%   +1110.3%  6.527e+09 =C2=B1  1%  cpuidle.C1-IVT.time
    169428 =C2=B1  5%    +533.0%    1072450 =C2=B1  2%  cpuidle.C1-IVT.usage
  61798058 =C2=B1  8%    +390.4%   3.03e+08 =C2=B1  2%  cpuidle.C1E-IVT.time
     21844 =C2=B1  7%   +5834.4%    1296314 =C2=B1  9%  cpuidle.C1E-IVT.usa=
ge
 2.426e+08 =C2=B1 13%     -85.1%   36261657 =C2=B1  8%  cpuidle.C3-IVT.time
     54288 =C2=B1  6%    +103.7%     110586 =C2=B1 25%  cpuidle.C3-IVT.usage
 1.332e+10 =C2=B1  0%     -45.7%   7.23e+09 =C2=B1  1%  cpuidle.C6-IVT.time
   2561092 =C2=B1  0%     -25.8%    1899960 =C2=B1  3%  cpuidle.C6-IVT.usage
   3703941 =C2=B1 16%    +163.2%    9749344 =C2=B1 49%  cpuidle.POLL.time
    322.50 =C2=B1  9%    +264.6%       1175 =C2=B1 20%  cpuidle.POLL.usage
      9333 =C2=B1  0%     +29.9%      12124 =C2=B1  0%  proc-vmstat.nr_acti=
ve_anon
     37430 =C2=B1  0%     +26.9%      47500 =C2=B1  0%  proc-vmstat.nr_acti=
ve_file
      6561 =C2=B1  1%     +19.5%       7843 =C2=B1  1%  proc-vmstat.nr_anon=
_pages
      1028 =C2=B1  3%      -8.0%     945.75 =C2=B1  4%  proc-vmstat.nr_kern=
el_stack
      5887 =C2=B1  0%     +19.4%       7030 =C2=B1  0%  proc-vmstat.nr_shmem
  36012779 =C2=B1  1%     +76.4%   63517057 =C2=B1  2%  proc-vmstat.numa_hit
  36006558 =C2=B1  1%     +76.4%   63510817 =C2=B1  2%  proc-vmstat.numa_lo=
cal
     29705 =C2=B1  0%     +71.7%      51008 =C2=B1  0%  proc-vmstat.pgactiv=
ate
   2594260 =C2=B1  2%    +112.4%    5508951 =C2=B1 25%  proc-vmstat.pgalloc=
_dma32
  37064067 =C2=B1  1%     +76.3%   65328590 =C2=B1  2%  proc-vmstat.pgalloc=
_normal
  37365693 =C2=B1  0%     +78.4%   66653865 =C2=B1  0%  proc-vmstat.pgfault
  39631131 =C2=B1  1%     +78.6%   70787743 =C2=B1  1%  proc-vmstat.pgfree
     24355 =C2=B1  2%     -21.4%      19143 =C2=B1 13%  slabinfo.kmalloc-19=
2.active_objs
     24503 =C2=B1  2%     -21.0%      19368 =C2=B1 13%  slabinfo.kmalloc-19=
2.num_objs
     46778 =C2=B1  1%     +50.5%      70406 =C2=B1 13%  slabinfo.kmalloc-32=
.active_objs
    364.75 =C2=B1  1%     +51.6%     553.00 =C2=B1 13%  slabinfo.kmalloc-32=
.active_slabs
     46778 =C2=B1  1%     +51.5%      70858 =C2=B1 13%  slabinfo.kmalloc-32=
.num_objs
    364.75 =C2=B1  1%     +51.6%     553.00 =C2=B1 13%  slabinfo.kmalloc-32=
.num_slabs
     65810 =C2=B1  0%     +18.6%      78036 =C2=B1  0%  slabinfo.kmalloc-64=
.active_objs
      1031 =C2=B1  0%     +18.6%       1223 =C2=B1  0%  slabinfo.kmalloc-64=
.active_slabs
     66055 =C2=B1  0%     +18.6%      78325 =C2=B1  0%  slabinfo.kmalloc-64=
.num_objs
      1031 =C2=B1  0%     +18.6%       1223 =C2=B1  0%  slabinfo.kmalloc-64=
.num_slabs
    471.75 =C2=B1  4%     -27.0%     344.25 =C2=B1 12%  slabinfo.kmem_cache=
.active_objs
    471.75 =C2=B1  4%     -27.0%     344.25 =C2=B1 12%  slabinfo.kmem_cache=
.num_objs
      2628 =C2=B1  0%     +32.3%       3479 =C2=B1  1%  slabinfo.mm_struct.=
active_objs
      2709 =C2=B1  0%     +31.0%       3549 =C2=B1  2%  slabinfo.mm_struct.=
num_objs
      5500 =C2=B1  4%     -28.6%       3929 =C2=B1 11%  slabinfo.signal_cac=
he.active_objs
      5656 =C2=B1  4%     -28.3%       4055 =C2=B1 12%  slabinfo.signal_cac=
he.num_objs
     21111 =C2=B1  3%     -20.9%      16701 =C2=B1  3%  slabinfo.vm_area_st=
ruct.active_objs
     21189 =C2=B1  3%     -21.2%      16701 =C2=B1  3%  slabinfo.vm_area_st=
ruct.num_objs
      1.30 =C2=B1  1%     +60.3%       2.08 =C2=B1  6%  perf-profile.cycles=
-pp.__alloc_pages_nodemask.alloc_pages_current.pte_alloc_one.__pte_alloc.co=
py_page_range
      3.54 =C2=B1  5%     -15.4%       3.00 =C2=B1  0%  perf-profile.cycles=
-pp.__do_page_fault.do_page_fault.page_fault
      0.72 =C2=B1  4%     +55.2%       1.12 =C2=B1  9%  perf-profile.cycles=
-pp.__pmd_alloc.copy_page_range.copy_process._do_fork.sys_clone
      1.74 =C2=B1  1%     +52.0%       2.64 =C2=B1  6%  perf-profile.cycles=
-pp.__pte_alloc.copy_page_range.copy_process._do_fork.sys_clone
      0.58 =C2=B1 18%     +69.7%       0.98 =C2=B1 25%  perf-profile.cycles=
-pp.__pud_alloc.copy_page_range.copy_process._do_fork.sys_clone
     15.18 =C2=B1  1%     +41.2%      21.42 =C2=B1  3%  perf-profile.cycles=
-pp._do_fork.sys_clone.entry_SYSCALL_64_fastpath
      0.01 =C2=B1 34%   +5720.0%       0.73 =C2=B1 47%  perf-profile.cycles=
-pp.activate_task.ttwu_do_activate.sched_ttwu_pending.cpu_startup_entry.sta=
rt_secondary
      0.58 =C2=B1  4%     +56.7%       0.91 =C2=B1  9%  perf-profile.cycles=
-pp.alloc_pages_current.__pmd_alloc.copy_page_range.copy_process._do_fork
      1.31 =C2=B1  1%     +61.0%       2.11 =C2=B1  6%  perf-profile.cycles=
-pp.alloc_pages_current.pte_alloc_one.__pte_alloc.copy_page_range.copy_proc=
ess
      1.20 =C2=B1  4%     +81.3%       2.18 =C2=B1  3%  perf-profile.cycles=
-pp.anon_vma_clone.anon_vma_fork.copy_process._do_fork.sys_clone
      2.36 =C2=B1  1%     +60.7%       3.80 =C2=B1  3%  perf-profile.cycles=
-pp.anon_vma_fork.copy_process._do_fork.sys_clone.entry_SYSCALL_64_fastpath
     48.22 =C2=B1  2%     -42.2%      27.88 =C2=B1  8%  perf-profile.cycles=
-pp.call_cpuidle.cpu_startup_entry.start_secondary
      0.91 =C2=B1  2%     +52.8%       1.38 =C2=B1  9%  perf-profile.cycles=
-pp.clear_page_c_e.__alloc_pages_nodemask.alloc_pages_current.pte_alloc_one=
.__pte_alloc
      1.40 =C2=B1  2%     -45.5%       0.76 =C2=B1  2%  perf-profile.cycles=
-pp.copy_page.do_wp_page.handle_mm_fault.__do_page_fault.do_page_fault
      4.96 =C2=B1  3%     +55.1%       7.69 =C2=B1  7%  perf-profile.cycles=
-pp.copy_page_range.copy_process._do_fork.sys_clone.entry_SYSCALL_64_fastpa=
th
     13.48 =C2=B1  1%     +45.0%      19.55 =C2=B1  3%  perf-profile.cycles=
-pp.copy_process._do_fork.sys_clone.entry_SYSCALL_64_fastpath
     52.02 =C2=B1  2%     -38.7%      31.89 =C2=B1  8%  perf-profile.cycles=
-pp.cpu_startup_entry.start_secondary
     48.19 =C2=B1  2%     -42.2%      27.86 =C2=B1  8%  perf-profile.cycles=
-pp.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_secondary
     47.69 =C2=B1  2%     -42.4%      27.48 =C2=B1  7%  perf-profile.cycles=
-pp.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_=
secondary
      3.61 =C2=B1  5%     -15.9%       3.03 =C2=B1  1%  perf-profile.cycles=
-pp.do_page_fault.page_fault
      2.12 =C2=B1  5%     +27.1%       2.69 =C2=B1  1%  perf-profile.cycles=
-pp.do_wait.sys_wait4.entry_SYSCALL_64_fastpath
     18.04 =C2=B1  1%     +35.3%      24.40 =C2=B1  3%  perf-profile.cycles=
-pp.entry_SYSCALL_64_fastpath
      3.16 =C2=B1  5%     -13.9%       2.72 =C2=B1  2%  perf-profile.cycles=
-pp.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
     48.47 =C2=B1  2%     -42.3%      27.98 =C2=B1  7%  perf-profile.cycles=
-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_e=
ntry
      1.49 =C2=B1  8%     -16.6%       1.24 =C2=B1  6%  perf-profile.cycles=
-pp.kthread.ret_from_fork
      3.63 =C2=B1  5%     -15.7%       3.06 =C2=B1  0%  perf-profile.cycles=
-pp.page_fault
      1.35 =C2=B1  1%     +59.6%       2.16 =C2=B1  6%  perf-profile.cycles=
-pp.pte_alloc_one.__pte_alloc.copy_page_range.copy_process._do_fork
      1.51 =C2=B1  8%     -17.7%       1.24 =C2=B1  6%  perf-profile.cycles=
-pp.ret_from_fork
      0.02 =C2=B1 19%   +3611.1%       0.83 =C2=B1 47%  perf-profile.cycles=
-pp.sched_ttwu_pending.cpu_startup_entry.start_secondary
      1.00 =C2=B1  3%     -18.9%       0.81 =C2=B1 13%  perf-profile.cycles=
-pp.schedule.schedule_preempt_disabled.cpu_startup_entry.start_secondary
      1.02 =C2=B1  3%     -17.4%       0.84 =C2=B1 14%  perf-profile.cycles=
-pp.schedule_preempt_disabled.cpu_startup_entry.start_secondary
      0.80 =C2=B1  1%     +25.7%       1.00 =C2=B1  4%  perf-profile.cycles=
-pp.select_task_rq_fair.wake_up_new_task._do_fork.sys_clone.entry_SYSCALL_6=
4_fastpath
     52.15 =C2=B1  2%     -38.7%      31.98 =C2=B1  8%  perf-profile.cycles=
-pp.start_secondary
     15.20 =C2=B1  1%     +41.0%      21.42 =C2=B1  3%  perf-profile.cycles=
-pp.sys_clone.entry_SYSCALL_64_fastpath
      2.19 =C2=B1  5%     +25.0%       2.74 =C2=B1  1%  perf-profile.cycles=
-pp.sys_wait4.entry_SYSCALL_64_fastpath
      0.96 =C2=B1  5%     -28.7%       0.68 =C2=B1 24%  perf-profile.cycles=
-pp.tick_nohz_idle_exit.cpu_startup_entry.start_secondary
      0.02 =C2=B1 24%   +4328.6%       0.78 =C2=B1 47%  perf-profile.cycles=
-pp.ttwu_do_activate.constprop.85.sched_ttwu_pending.cpu_startup_entry.star=
t_secondary
      1.47 =C2=B1  4%     +32.3%       1.94 =C2=B1  2%  perf-profile.cycles=
-pp.wait_consider_task.do_wait.sys_wait4.entry_SYSCALL_64_fastpath
      1.43 =C2=B1  1%     +16.5%       1.66 =C2=B1  4%  perf-profile.cycles=
-pp.wake_up_new_task._do_fork.sys_clone.entry_SYSCALL_64_fastpath
      0.90 =C2=B1  2%     +54.2%       1.39 =C2=B1  2%  perf-profile.cycles=
-pp.wp_page_copy.isra.58.do_wp_page.handle_mm_fault.__do_page_fault.do_page=
_fault
      7438 =C2=B1  4%    +111.4%      15724 =C2=B1 23%  sched_debug.cfs_rq[=
0]:/.exec_clock
     52188 =C2=B1  3%     -52.1%      25013 =C2=B1 24%  sched_debug.cfs_rq[=
0]:/.min_vruntime
      5.50 =C2=B1 20%     -45.5%       3.00 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.nr_spread_over
     43475 =C2=B1  4%     -78.7%       9245 =C2=B1  9%  sched_debug.cfs_rq[=
10]:/.min_vruntime
      1004 =C2=B1  5%     +15.5%       1159 =C2=B1  4%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
     58.75 =C2=B1 68%     -67.7%      19.00 =C2=B1 77%  sched_debug.cfs_rq[=
10]:/.util_avg
     43461 =C2=B1  3%     -77.3%       9856 =C2=B1 18%  sched_debug.cfs_rq[=
11]:/.min_vruntime
      2.75 =C2=B1 90%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.nr_spread_over
      1004 =C2=B1  5%     +15.4%       1158 =C2=B1  4%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
     47911 =C2=B1  3%     -69.7%      14497 =C2=B1 32%  sched_debug.cfs_rq[=
12]:/.min_vruntime
      1005 =C2=B1  5%     +15.6%       1163 =C2=B1  4%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
      5613 =C2=B1  3%     -21.3%       4417 =C2=B1  8%  sched_debug.cfs_rq[=
13]:/.exec_clock
     47734 =C2=B1  6%     -78.6%      10195 =C2=B1 20%  sched_debug.cfs_rq[=
13]:/.min_vruntime
     -4454 =C2=B1-27%    +232.7%     -14818 =C2=B1-33%  sched_debug.cfs_rq[=
13]:/.spread0
      1005 =C2=B1  5%     +16.8%       1174 =C2=B1  4%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
     48698 =C2=B1  6%     -74.2%      12581 =C2=B1 37%  sched_debug.cfs_rq[=
14]:/.min_vruntime
     -3490 =C2=B1-70%    +256.2%     -12432 =C2=B1-54%  sched_debug.cfs_rq[=
14]:/.spread0
      1004 =C2=B1  4%     +16.9%       1175 =C2=B1  4%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
     48999 =C2=B1  4%     -72.3%      13582 =C2=B1 26%  sched_debug.cfs_rq[=
15]:/.min_vruntime
     -3190 =C2=B1-104%    +258.4%     -11431 =C2=B1-34%  sched_debug.cfs_rq=
[15]:/.spread0
      1005 =C2=B1  4%     +17.1%       1177 =C2=B1  4%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
      5221 =C2=B1  5%     -19.5%       4203 =C2=B1 14%  sched_debug.cfs_rq[=
16]:/.exec_clock
     47805 =C2=B1  3%     -77.2%      10903 =C2=B1 29%  sched_debug.cfs_rq[=
16]:/.min_vruntime
     -4384 =C2=B1-34%    +221.8%     -14110 =C2=B1-45%  sched_debug.cfs_rq[=
16]:/.spread0
      1004 =C2=B1  4%     +17.2%       1178 =C2=B1  4%  sched_debug.cfs_rq[=
16]:/.tg_load_avg
      5574 =C2=B1 10%     -30.2%       3891 =C2=B1 19%  sched_debug.cfs_rq[=
17]:/.exec_clock
     48817 =C2=B1  2%     -74.5%      12470 =C2=B1 20%  sched_debug.cfs_rq[=
17]:/.min_vruntime
     -3371 =C2=B1-35%    +272.0%     -12543 =C2=B1-29%  sched_debug.cfs_rq[=
17]:/.spread0
      1006 =C2=B1  5%     +17.1%       1179 =C2=B1  4%  sched_debug.cfs_rq[=
17]:/.tg_load_avg
      5402 =C2=B1  4%     -28.4%       3867 =C2=B1 18%  sched_debug.cfs_rq[=
18]:/.exec_clock
     13.75 =C2=B1 56%    +236.4%      46.25 =C2=B1 40%  sched_debug.cfs_rq[=
18]:/.load_avg
     49829 =C2=B1  4%     -78.3%      10804 =C2=B1 33%  sched_debug.cfs_rq[=
18]:/.min_vruntime
     -2359 =C2=B1-65%    +502.2%     -14209 =C2=B1-22%  sched_debug.cfs_rq[=
18]:/.spread0
      1007 =C2=B1  5%     +17.3%       1181 =C2=B1  4%  sched_debug.cfs_rq[=
18]:/.tg_load_avg
     13.75 =C2=B1 56%    +236.4%      46.25 =C2=B1 40%  sched_debug.cfs_rq[=
18]:/.tg_load_avg_contrib
      5368 =C2=B1  1%     -16.5%       4483 =C2=B1  9%  sched_debug.cfs_rq[=
19]:/.exec_clock
     48575 =C2=B1  3%     -77.8%      10764 =C2=B1 20%  sched_debug.cfs_rq[=
19]:/.min_vruntime
     -3614 =C2=B1-17%    +294.2%     -14249 =C2=B1-31%  sched_debug.cfs_rq[=
19]:/.spread0
      1005 =C2=B1  5%     +22.0%       1226 =C2=B1  5%  sched_debug.cfs_rq[=
19]:/.tg_load_avg
     47115 =C2=B1  4%     -68.4%      14873 =C2=B1 19%  sched_debug.cfs_rq[=
1]:/.min_vruntime
      6026 =C2=B1 18%     -36.2%       3843 =C2=B1 14%  sched_debug.cfs_rq[=
20]:/.exec_clock
     48599 =C2=B1  5%     -80.1%       9666 =C2=B1 24%  sched_debug.cfs_rq[=
20]:/.min_vruntime
     -3589 =C2=B1-65%    +327.5%     -15347 =C2=B1-44%  sched_debug.cfs_rq[=
20]:/.spread0
      1000 =C2=B1  4%     +22.9%       1229 =C2=B1  5%  sched_debug.cfs_rq[=
20]:/.tg_load_avg
      5429 =C2=B1 13%     -28.4%       3888 =C2=B1 14%  sched_debug.cfs_rq[=
21]:/.exec_clock
     45705 =C2=B1  4%     -78.1%      10014 =C2=B1 29%  sched_debug.cfs_rq[=
21]:/.min_vruntime
     -6484 =C2=B1-49%    +131.3%     -15000 =C2=B1-23%  sched_debug.cfs_rq[=
21]:/.spread0
      1001 =C2=B1  5%     +23.2%       1233 =C2=B1  5%  sched_debug.cfs_rq[=
21]:/.tg_load_avg
     46085 =C2=B1  7%     -71.1%      13325 =C2=B1 24%  sched_debug.cfs_rq[=
22]:/.min_vruntime
      1000 =C2=B1  5%     +23.4%       1235 =C2=B1  5%  sched_debug.cfs_rq[=
22]:/.tg_load_avg
     49339 =C2=B1  7%     -72.1%      13752 =C2=B1 31%  sched_debug.cfs_rq[=
23]:/.min_vruntime
      1001 =C2=B1  5%     +23.4%       1235 =C2=B1  5%  sched_debug.cfs_rq[=
23]:/.tg_load_avg
     40.25 =C2=B1 42%    +129.8%      92.50 =C2=B1 59%  sched_debug.cfs_rq[=
23]:/.util_avg
     26391 =C2=B1  4%     -76.4%       6227 =C2=B1 89%  sched_debug.cfs_rq[=
24]:/.min_vruntime
      1001 =C2=B1  5%     +22.6%       1228 =C2=B1  5%  sched_debug.cfs_rq[=
24]:/.tg_load_avg
     26332 =C2=B1  6%     -71.4%       7521 =C2=B1 46%  sched_debug.cfs_rq[=
25]:/.min_vruntime
    -25857 =C2=B1-11%     -32.3%     -17493 =C2=B1-17%  sched_debug.cfs_rq[=
25]:/.spread0
    996.50 =C2=B1  4%     +23.4%       1229 =C2=B1  5%  sched_debug.cfs_rq[=
25]:/.tg_load_avg
     31236 =C2=B1  5%     -70.9%       9100 =C2=B1 60%  sched_debug.cfs_rq[=
26]:/.min_vruntime
    995.25 =C2=B1  4%     +23.6%       1230 =C2=B1  5%  sched_debug.cfs_rq[=
26]:/.tg_load_avg
     29.50 =C2=B1 25%     -63.6%      10.75 =C2=B1 90%  sched_debug.cfs_rq[=
27]:/.load_avg
     27824 =C2=B1  9%     -76.8%       6448 =C2=B1 91%  sched_debug.cfs_rq[=
27]:/.min_vruntime
    995.75 =C2=B1  4%     +23.5%       1230 =C2=B1  5%  sched_debug.cfs_rq[=
27]:/.tg_load_avg
     29.50 =C2=B1 25%     -63.6%      10.75 =C2=B1 90%  sched_debug.cfs_rq[=
27]:/.tg_load_avg_contrib
     69.50 =C2=B1 21%     -56.5%      30.25 =C2=B1 73%  sched_debug.cfs_rq[=
27]:/.util_avg
     27839 =C2=B1 14%     -74.8%       7018 =C2=B1 37%  sched_debug.cfs_rq[=
28]:/.min_vruntime
    996.75 =C2=B1  4%     +23.9%       1234 =C2=B1  5%  sched_debug.cfs_rq[=
28]:/.tg_load_avg
     27250 =C2=B1 11%     -70.1%       8150 =C2=B1 61%  sched_debug.cfs_rq[=
29]:/.min_vruntime
    996.00 =C2=B1  4%     +24.0%       1235 =C2=B1  5%  sched_debug.cfs_rq[=
29]:/.tg_load_avg
     49854 =C2=B1  5%     -75.6%      12158 =C2=B1 19%  sched_debug.cfs_rq[=
2]:/.min_vruntime
      8.50 =C2=B1 62%     -79.4%       1.75 =C2=B1173%  sched_debug.cfs_rq[=
2]:/.nr_spread_over
     -2334 =C2=B1-103%    +450.7%     -12855 =C2=B1-48%  sched_debug.cfs_rq=
[2]:/.spread0
     29309 =C2=B1  9%     -67.5%       9514 =C2=B1 40%  sched_debug.cfs_rq[=
30]:/.min_vruntime
    995.75 =C2=B1  4%     +24.3%       1237 =C2=B1  5%  sched_debug.cfs_rq[=
30]:/.tg_load_avg
     25892 =C2=B1  5%     -62.4%       9737 =C2=B1 88%  sched_debug.cfs_rq[=
31]:/.min_vruntime
    996.00 =C2=B1  4%     +24.4%       1239 =C2=B1  5%  sched_debug.cfs_rq[=
31]:/.tg_load_avg
     25217 =C2=B1  8%     -63.9%       9106 =C2=B1 50%  sched_debug.cfs_rq[=
32]:/.min_vruntime
    -26972 =C2=B1 -6%     -41.0%     -15908 =C2=B1-43%  sched_debug.cfs_rq[=
32]:/.spread0
    992.75 =C2=B1  4%     +25.0%       1241 =C2=B1  5%  sched_debug.cfs_rq[=
32]:/.tg_load_avg
     24793 =C2=B1  9%     -78.1%       5431 =C2=B1 59%  sched_debug.cfs_rq[=
33]:/.min_vruntime
    993.00 =C2=B1  4%     +25.3%       1244 =C2=B1  5%  sched_debug.cfs_rq[=
33]:/.tg_load_avg
     24893 =C2=B1  2%     -67.9%       7992 =C2=B1 69%  sched_debug.cfs_rq[=
34]:/.min_vruntime
    993.00 =C2=B1  4%     +25.7%       1248 =C2=B1  5%  sched_debug.cfs_rq[=
34]:/.tg_load_avg
     26215 =C2=B1 10%     -63.6%       9531 =C2=B1 49%  sched_debug.cfs_rq[=
35]:/.min_vruntime
    -25974 =C2=B1 -6%     -40.4%     -15483 =C2=B1-40%  sched_debug.cfs_rq[=
35]:/.spread0
    992.75 =C2=B1  4%     +25.8%       1248 =C2=B1  5%  sched_debug.cfs_rq[=
35]:/.tg_load_avg
     25672 =C2=B1 10%     -58.6%      10616 =C2=B1 31%  sched_debug.cfs_rq[=
36]:/.min_vruntime
    -26517 =C2=B1-14%     -45.7%     -14398 =C2=B1-43%  sched_debug.cfs_rq[=
36]:/.spread0
    994.50 =C2=B1  4%     +25.7%       1250 =C2=B1  5%  sched_debug.cfs_rq[=
36]:/.tg_load_avg
     27177 =C2=B1  7%     -67.4%       8849 =C2=B1 33%  sched_debug.cfs_rq[=
37]:/.min_vruntime
    -25012 =C2=B1-14%     -35.4%     -16165 =C2=B1-22%  sched_debug.cfs_rq[=
37]:/.spread0
    993.75 =C2=B1  4%     +25.8%       1250 =C2=B1  5%  sched_debug.cfs_rq[=
37]:/.tg_load_avg
     29350 =C2=B1  6%     -69.9%       8846 =C2=B1 32%  sched_debug.cfs_rq[=
38]:/.min_vruntime
    -22839 =C2=B1-10%     -29.2%     -16168 =C2=B1-30%  sched_debug.cfs_rq[=
38]:/.spread0
    992.50 =C2=B1  4%     +25.7%       1247 =C2=B1  6%  sched_debug.cfs_rq[=
38]:/.tg_load_avg
     25898 =C2=B1  8%     -71.1%       7494 =C2=B1 34%  sched_debug.cfs_rq[=
39]:/.min_vruntime
    -26291 =C2=B1-12%     -33.4%     -17521 =C2=B1-30%  sched_debug.cfs_rq[=
39]:/.spread0
    992.00 =C2=B1  4%     +25.6%       1246 =C2=B1  5%  sched_debug.cfs_rq[=
39]:/.tg_load_avg
     53201 =C2=B1  6%     -75.2%      13202 =C2=B1 22%  sched_debug.cfs_rq[=
3]:/.min_vruntime
      1012 =C2=B1376%   -1266.2%     -11811 =C2=B1-29%  sched_debug.cfs_rq[=
3]:/.spread0
     28250 =C2=B1  9%     -75.3%       6976 =C2=B1 47%  sched_debug.cfs_rq[=
40]:/.min_vruntime
    993.25 =C2=B1  4%     +25.6%       1248 =C2=B1  5%  sched_debug.cfs_rq[=
40]:/.tg_load_avg
     27875 =C2=B1  7%     -65.8%       9530 =C2=B1 35%  sched_debug.cfs_rq[=
41]:/.min_vruntime
    991.25 =C2=B1  4%     +25.9%       1247 =C2=B1  6%  sched_debug.cfs_rq[=
41]:/.tg_load_avg
     26677 =C2=B1  3%     -62.4%      10043 =C2=B1 21%  sched_debug.cfs_rq[=
42]:/.min_vruntime
    -25512 =C2=B1-10%     -41.3%     -14972 =C2=B1-36%  sched_debug.cfs_rq[=
42]:/.spread0
    991.75 =C2=B1  4%     +25.9%       1248 =C2=B1  6%  sched_debug.cfs_rq[=
42]:/.tg_load_avg
     26871 =C2=B1 10%     -60.2%      10691 =C2=B1 18%  sched_debug.cfs_rq[=
43]:/.min_vruntime
    -25319 =C2=B1 -6%     -43.4%     -14323 =C2=B1-33%  sched_debug.cfs_rq[=
43]:/.spread0
    992.50 =C2=B1  4%     +25.8%       1249 =C2=B1  6%  sched_debug.cfs_rq[=
43]:/.tg_load_avg
     25783 =C2=B1  8%     -62.2%       9740 =C2=B1 34%  sched_debug.cfs_rq[=
44]:/.min_vruntime
    -26407 =C2=B1 -8%     -42.2%     -15275 =C2=B1-33%  sched_debug.cfs_rq[=
44]:/.spread0
    992.25 =C2=B1  4%     +25.9%       1248 =C2=B1  6%  sched_debug.cfs_rq[=
44]:/.tg_load_avg
     26020 =C2=B1  5%     -60.5%      10286 =C2=B1 33%  sched_debug.cfs_rq[=
45]:/.min_vruntime
    -26170 =C2=B1 -7%     -43.7%     -14728 =C2=B1-42%  sched_debug.cfs_rq[=
45]:/.spread0
    993.00 =C2=B1  4%     +25.4%       1245 =C2=B1  6%  sched_debug.cfs_rq[=
45]:/.tg_load_avg
     25924 =C2=B1  7%     -60.0%      10374 =C2=B1 20%  sched_debug.cfs_rq[=
46]:/.min_vruntime
    -26266 =C2=B1 -2%     -44.3%     -14641 =C2=B1-36%  sched_debug.cfs_rq[=
46]:/.spread0
    993.50 =C2=B1  4%     +25.7%       1248 =C2=B1  6%  sched_debug.cfs_rq[=
46]:/.tg_load_avg
      2534 =C2=B1  4%     +82.3%       4619 =C2=B1 25%  sched_debug.cfs_rq[=
47]:/.exec_clock
     25776 =C2=B1  6%     -61.3%       9962 =C2=B1 15%  sched_debug.cfs_rq[=
47]:/.min_vruntime
      1.00 =C2=B1-100%    +250.0%       3.50 =C2=B1 31%  sched_debug.cfs_rq=
[47]:/.nr_spread_over
    -26414 =C2=B1 -4%     -43.0%     -15052 =C2=B1-34%  sched_debug.cfs_rq[=
47]:/.spread0
    991.50 =C2=B1  4%     +25.2%       1241 =C2=B1  5%  sched_debug.cfs_rq[=
47]:/.tg_load_avg
     51959 =C2=B1 10%     -76.7%      12098 =C2=B1 48%  sched_debug.cfs_rq[=
4]:/.min_vruntime
   -229.37 =C2=B1-2692%   +5530.7%     -12915 =C2=B1-43%  sched_debug.cfs_r=
q[4]:/.spread0
      1004 =C2=B1  5%     +14.2%       1146 =C2=B1  3%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
     52996 =C2=B1  8%     -78.9%      11183 =C2=B1 21%  sched_debug.cfs_rq[=
5]:/.min_vruntime
    807.43 =C2=B1586%   -1812.9%     -13830 =C2=B1-34%  sched_debug.cfs_rq[=
5]:/.spread0
      1004 =C2=B1  5%     +14.5%       1150 =C2=B1  3%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
     52809 =C2=B1  7%     -77.8%      11721 =C2=B1 21%  sched_debug.cfs_rq[=
6]:/.min_vruntime
    620.80 =C2=B1727%   -2241.2%     -13292 =C2=B1-36%  sched_debug.cfs_rq[=
6]:/.spread0
      1004 =C2=B1  5%     +14.8%       1152 =C2=B1  3%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
     35.25 =C2=B1 29%     -48.9%      18.00 =C2=B1 73%  sched_debug.cfs_rq[=
7]:/.load_avg
     48888 =C2=B1  5%     -79.5%      10025 =C2=B1  8%  sched_debug.cfs_rq[=
7]:/.min_vruntime
     -3300 =C2=B1-60%    +354.1%     -14988 =C2=B1-42%  sched_debug.cfs_rq[=
7]:/.spread0
      1001 =C2=B1  5%     +15.3%       1154 =C2=B1  3%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
     35.25 =C2=B1 29%     -48.9%      18.00 =C2=B1 73%  sched_debug.cfs_rq[=
7]:/.tg_load_avg_contrib
     48245 =C2=B1  0%     -77.2%      11013 =C2=B1 13%  sched_debug.cfs_rq[=
8]:/.min_vruntime
     -3943 =C2=B1-40%    +255.0%     -14000 =C2=B1-47%  sched_debug.cfs_rq[=
8]:/.spread0
      1003 =C2=B1  5%     +15.1%       1154 =C2=B1  3%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
     48413 =C2=B1  6%     -74.6%      12301 =C2=B1 35%  sched_debug.cfs_rq[=
9]:/.min_vruntime
     -3775 =C2=B1-68%    +236.7%     -12712 =C2=B1-50%  sched_debug.cfs_rq[=
9]:/.spread0
      1004 =C2=B1  5%     +15.1%       1156 =C2=B1  3%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
     97438 =C2=B1  6%    +168.2%     261320 =C2=B1 53%  sched_debug.cpu#0.n=
r_switches
    -15.00 =C2=B1-14%     -60.0%      -6.00 =C2=B1-60%  sched_debug.cpu#0.n=
r_uninterruptible
     47608 =C2=B1  6%    +170.1%     128600 =C2=B1 53%  sched_debug.cpu#0.s=
ched_goidle
     41431 =C2=B1  4%     -24.3%      31365 =C2=B1  4%  sched_debug.cpu#1.n=
r_load_updates
     99622 =C2=B1  8%    +100.3%     199515 =C2=B1 27%  sched_debug.cpu#1.n=
r_switches
    100109 =C2=B1  8%     +99.4%     199662 =C2=B1 27%  sched_debug.cpu#1.s=
ched_count
     49558 =C2=B1  9%    +101.0%      99591 =C2=B1 27%  sched_debug.cpu#1.s=
ched_goidle
     39651 =C2=B1  2%     -34.7%      25892 =C2=B1 14%  sched_debug.cpu#10.=
nr_load_updates
     90178 =C2=B1  5%     +61.2%     145375 =C2=B1 18%  sched_debug.cpu#10.=
nr_switches
     90476 =C2=B1  5%     +61.0%     145655 =C2=B1 19%  sched_debug.cpu#10.=
sched_count
     44962 =C2=B1  5%     +61.5%      72595 =C2=B1 18%  sched_debug.cpu#10.=
sched_goidle
     39461 =C2=B1  1%     -29.7%      27758 =C2=B1  7%  sched_debug.cpu#11.=
nr_load_updates
     90773 =C2=B1  4%     +89.5%     172026 =C2=B1 24%  sched_debug.cpu#11.=
nr_switches
     91699 =C2=B1  3%     +87.8%     172192 =C2=B1 24%  sched_debug.cpu#11.=
sched_count
     45261 =C2=B1  4%     +89.8%      85900 =C2=B1 24%  sched_debug.cpu#11.=
sched_goidle
     40345 =C2=B1  3%     -35.9%      25863 =C2=B1 22%  sched_debug.cpu#12.=
nr_load_updates
      1.00 =C2=B1234%    -675.0%      -5.75 =C2=B1-28%  sched_debug.cpu#12.=
nr_uninterruptible
     40501 =C2=B1  1%     -47.2%      21369 =C2=B1  7%  sched_debug.cpu#13.=
nr_load_updates
     39578 =C2=B1  2%     -40.4%      23597 =C2=B1 12%  sched_debug.cpu#14.=
nr_load_updates
     40732 =C2=B1  1%     -49.0%      20766 =C2=B1 10%  sched_debug.cpu#15.=
nr_load_updates
     -5.75 =C2=B1-56%     -82.6%      -1.00 =C2=B1-122%  sched_debug.cpu#15=
.nr_uninterruptible
     39801 =C2=B1  2%     -51.0%      19493 =C2=B1 21%  sched_debug.cpu#16.=
nr_load_updates
     39958 =C2=B1  2%     -52.5%      18993 =C2=B1 25%  sched_debug.cpu#17.=
nr_load_updates
     39706 =C2=B1  2%     -51.5%      19245 =C2=B1 25%  sched_debug.cpu#18.=
nr_load_updates
     39978 =C2=B1  2%     -47.0%      21200 =C2=B1  9%  sched_debug.cpu#19.=
nr_load_updates
     42402 =C2=B1  3%     -28.1%      30472 =C2=B1  9%  sched_debug.cpu#2.n=
r_load_updates
     99545 =C2=B1  7%    +105.1%     204210 =C2=B1 30%  sched_debug.cpu#2.n=
r_switches
    100055 =C2=B1  6%    +104.3%     204381 =C2=B1 30%  sched_debug.cpu#2.s=
ched_count
     49394 =C2=B1  7%    +106.5%     101994 =C2=B1 30%  sched_debug.cpu#2.s=
ched_goidle
     39520 =C2=B1  2%     -50.2%      19676 =C2=B1 23%  sched_debug.cpu#20.=
nr_load_updates
     40112 =C2=B1  2%     -51.5%      19471 =C2=B1 22%  sched_debug.cpu#21.=
nr_load_updates
     39597 =C2=B1  2%     -40.9%      23410 =C2=B1 11%  sched_debug.cpu#22.=
nr_load_updates
     39949 =C2=B1  1%     -41.9%      23197 =C2=B1  8%  sched_debug.cpu#23.=
nr_load_updates
      0.75 =C2=B1404%    -200.0%      -0.75 =C2=B1-110%  sched_debug.cpu#23=
.nr_uninterruptible
     18834 =C2=B1  3%     -51.9%       9068 =C2=B1 50%  sched_debug.cpu#24.=
nr_load_updates
     18926 =C2=B1  2%     -50.7%       9325 =C2=B1 44%  sched_debug.cpu#25.=
nr_load_updates
     19984 =C2=B1  4%     -53.1%       9374 =C2=B1 43%  sched_debug.cpu#26.=
nr_load_updates
     19759 =C2=B1  7%     -54.4%       9017 =C2=B1 50%  sched_debug.cpu#27.=
nr_load_updates
      2.50 =C2=B1 87%    -140.0%      -1.00 =C2=B1-70%  sched_debug.cpu#27.=
nr_uninterruptible
     18776 =C2=B1  5%     -51.7%       9061 =C2=B1 47%  sched_debug.cpu#28.=
nr_load_updates
     19183 =C2=B1  5%     -50.1%       9573 =C2=B1 44%  sched_debug.cpu#29.=
nr_load_updates
     43139 =C2=B1  5%     -30.8%      29861 =C2=B1  7%  sched_debug.cpu#3.n=
r_load_updates
    100982 =C2=B1  9%     +90.7%     192544 =C2=B1 29%  sched_debug.cpu#3.n=
r_switches
    102078 =C2=B1  9%     +88.8%     192718 =C2=B1 29%  sched_debug.cpu#3.s=
ched_count
     50347 =C2=B1  9%     +90.8%      96052 =C2=B1 29%  sched_debug.cpu#3.s=
ched_goidle
     19680 =C2=B1  3%     -55.3%       8793 =C2=B1 50%  sched_debug.cpu#30.=
nr_load_updates
      0.00 =C2=B1  0%      +Inf%       2.00 =C2=B1111%  sched_debug.cpu#30.=
nr_uninterruptible
    372.25 =C2=B1  8%     -25.7%     276.50 =C2=B1 18%  sched_debug.cpu#30.=
ttwu_local
     18524 =C2=B1  2%     -50.1%       9247 =C2=B1 47%  sched_debug.cpu#32.=
nr_load_updates
     17977 =C2=B1  1%     -50.9%       8818 =C2=B1 48%  sched_debug.cpu#33.=
nr_load_updates
    372.00 =C2=B1 14%     -22.6%     287.75 =C2=B1 14%  sched_debug.cpu#33.=
ttwu_local
     17624 =C2=B1  1%     -50.7%       8691 =C2=B1 52%  sched_debug.cpu#35.=
nr_load_updates
      4.50 =C2=B1 57%     -83.3%       0.75 =C2=B1110%  sched_debug.cpu#36.=
nr_uninterruptible
    856925 =C2=B1  5%     +14.2%     978679 =C2=B1  2%  sched_debug.cpu#4.a=
vg_idle
     43374 =C2=B1  4%     -41.4%      25428 =C2=B1 13%  sched_debug.cpu#4.n=
r_load_updates
      4.50 =C2=B1 59%    -116.7%      -0.75 =C2=B1-288%  sched_debug.cpu#45=
.nr_uninterruptible
    321.00 =C2=B1  3%     +26.6%     406.50 =C2=B1  9%  sched_debug.cpu#47.=
ttwu_local
     42701 =C2=B1  4%     -34.8%      27834 =C2=B1 23%  sched_debug.cpu#5.n=
r_load_updates
    948327 =C2=B1  7%     -17.1%     786484 =C2=B1  6%  sched_debug.cpu#6.a=
vg_idle
     43586 =C2=B1  2%     -37.0%      27453 =C2=B1 11%  sched_debug.cpu#6.n=
r_load_updates
     99119 =C2=B1  6%     +73.3%     171800 =C2=B1 26%  sched_debug.cpu#6.n=
r_switches
     99623 =C2=B1  6%     +73.0%     172384 =C2=B1 26%  sched_debug.cpu#6.s=
ched_count
     49415 =C2=B1  6%     +73.6%      85805 =C2=B1 26%  sched_debug.cpu#6.s=
ched_goidle
     43054 =C2=B1  2%     -30.1%      30103 =C2=B1 12%  sched_debug.cpu#7.n=
r_load_updates
    101164 =C2=B1  8%    +103.9%     206226 =C2=B1 40%  sched_debug.cpu#7.n=
r_switches
    101515 =C2=B1  8%    +103.4%     206512 =C2=B1 40%  sched_debug.cpu#7.s=
ched_count
     50453 =C2=B1  8%    +104.2%     103019 =C2=B1 40%  sched_debug.cpu#7.s=
ched_goidle
     41855 =C2=B1  2%     -32.7%      28163 =C2=B1 15%  sched_debug.cpu#8.n=
r_load_updates
     94128 =C2=B1  6%     +87.6%     176601 =C2=B1 34%  sched_debug.cpu#8.n=
r_switches
     94622 =C2=B1  6%     +87.3%     177198 =C2=B1 34%  sched_debug.cpu#8.s=
ched_count
     46932 =C2=B1  6%     +87.9%      88204 =C2=B1 35%  sched_debug.cpu#8.s=
ched_goidle
     41325 =C2=B1  2%     -41.1%      24359 =C2=B1 14%  sched_debug.cpu#9.n=
r_load_updates
     93199 =C2=B1  5%     +38.3%     128860 =C2=B1 21%  sched_debug.cpu#9.n=
r_switches
     93570 =C2=B1  5%     +37.8%     128966 =C2=B1 21%  sched_debug.cpu#9.s=
ched_count
     46460 =C2=B1  5%     +38.5%      64331 =C2=B1 21%  sched_debug.cpu#9.s=
ched_goidle

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/nr_=
threads/disk/fs/filesize/test_size/sync_method/nr_directories/nr_files_per_=
directory:
  lkp-ne04/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performa=
nce/1x/32t/1HDD/btrfs/5K/400M/fsyncBeforeClose/16d/256fpd

commit: =

  1fda6948fbb2e756c8f7cabef40395cee2984298
  9b7aaf11b8d61eeb87f3b99fb5ae59e61bb35f27

1fda6948fbb2e756 9b7aaf11b8d61eeb87f3b99fb5 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   1502962 =C2=B1  3%     +67.8%    2522676 =C2=B1  2%  fsmark.app_overhead
     47459 =C2=B1  5%    +153.7%     120415 =C2=B1  1%  fsmark.time.involun=
tary_context_switches
      3043 =C2=B1  0%      -2.4%       2969 =C2=B1  1%  fsmark.time.maximum=
_resident_set_size
     26057 =C2=B1  9%     -33.6%      17301 =C2=B1  2%  fsmark.time.minor_p=
age_faults
     23.50 =C2=B1  4%    +105.3%      48.25 =C2=B1  2%  fsmark.time.percent=
_of_cpu_this_job_got
     55.78 =C2=B1  4%    +105.6%     114.69 =C2=B1  2%  fsmark.time.system_=
time
   1122907 =C2=B1  3%     +44.6%    1623729 =C2=B1  1%  fsmark.time.volunta=
ry_context_switches
    650.75 =C2=B1173%    +793.2%       5812 =C2=B1101%  latency_stats.sum.b=
trfs_commit_transaction.[btrfs].btrfs_sync_file.[btrfs].vfs_fsync_range.do_=
fsync.SyS_fsync.entry_SYSCALL_64_fastpath
      6.50 =C2=B1 45%    +207.7%      20.00 =C2=B1 27%  numa-numastat.node1=
.other_node
     12659 =C2=B1  2%     +29.3%      16370 =C2=B1  1%  vmstat.system.cs
      1494 =C2=B1  1%    +111.1%       3154 =C2=B1  1%  vmstat.system.in
     16356 =C2=B1 15%     -54.9%       7379 =C2=B1  6%  proc-vmstat.numa_hi=
nt_faults
     14104 =C2=B1 14%     -61.8%       5391 =C2=B1 10%  proc-vmstat.numa_hi=
nt_faults_local
     20407 =C2=B1 12%     -41.6%      11928 =C2=B1  4%  proc-vmstat.numa_pt=
e_updates
      3033 =C2=B1  5%     +12.6%       3416 =C2=B1  8%  slabinfo.kmalloc-25=
6.active_objs
      7671 =C2=B1  6%     +13.0%       8671 =C2=B1  6%  slabinfo.vm_area_st=
ruct.active_objs
      7707 =C2=B1  6%     +13.0%       8707 =C2=B1  6%  slabinfo.vm_area_st=
ruct.num_objs
     48125 =C2=B1  1%     +45.1%      69852 =C2=B1  1%  softirqs.RCU
     53676 =C2=B1  5%     +46.4%      78604 =C2=B1  1%  softirqs.SCHED
    108653 =C2=B1  6%     +29.8%     140978 =C2=B1  4%  softirqs.TIMER
      2.01 =C2=B1  4%     +84.7%       3.71 =C2=B1  2%  turbostat.%Busy
     61.75 =C2=B1  4%     +86.6%     115.25 =C2=B1  2%  turbostat.Avg_MHz
      3.21 =C2=B1 19%     +59.8%       5.13 =C2=B1  9%  turbostat.Pkg%pc6
    670926 =C2=B1  1%     +25.5%     842267 =C2=B1  3%  cpuidle.C1-NHM.usage
  61834777 =C2=B1  4%     -22.8%   47757482 =C2=B1  2%  cpuidle.C1E-NHM.time
     64454 =C2=B1  2%     +62.9%     105004 =C2=B1  4%  cpuidle.C1E-NHM.usa=
ge
    223888 =C2=B1  2%     +11.5%     249724 =C2=B1  1%  cpuidle.C3-NHM.usage
    438281 =C2=B1  3%     +28.0%     561031 =C2=B1  1%  cpuidle.C6-NHM.usage
     47459 =C2=B1  5%    +153.7%     120415 =C2=B1  1%  time.involuntary_co=
ntext_switches
     26057 =C2=B1  9%     -33.6%      17301 =C2=B1  2%  time.minor_page_fau=
lts
     23.50 =C2=B1  4%    +105.3%      48.25 =C2=B1  2%  time.percent_of_cpu=
_this_job_got
     55.78 =C2=B1  4%    +105.6%     114.69 =C2=B1  2%  time.system_time
      0.72 =C2=B1  3%     +21.7%       0.87 =C2=B1  3%  time.user_time
   1122907 =C2=B1  3%     +44.6%    1623729 =C2=B1  1%  time.voluntary_cont=
ext_switches
     78288 =C2=B1  3%     -29.1%      55539 =C2=B1  3%  numa-vmstat.node0.n=
r_active_file
    145643 =C2=B1  2%     -33.9%      96319 =C2=B1  4%  numa-vmstat.node0.n=
r_dirtied
    850.50 =C2=B1  1%     -29.3%     601.00 =C2=B1  2%  numa-vmstat.node0.n=
r_dirty
    203686 =C2=B1  2%     -24.1%     154626 =C2=B1  2%  numa-vmstat.node0.n=
r_file_pages
    124060 =C2=B1  1%     -21.1%      97842 =C2=B1  2%  numa-vmstat.node0.n=
r_inactive_file
    213.00 =C2=B1 12%     +27.0%     270.50 =C2=B1  6%  numa-vmstat.node0.n=
r_kernel_stack
     24657 =C2=B1  1%     -29.6%      17369 =C2=B1  4%  numa-vmstat.node0.n=
r_slab_reclaimable
    144956 =C2=B1  2%     -33.9%      95800 =C2=B1  4%  numa-vmstat.node0.n=
r_written
      1404 =C2=B1 11%     -75.5%     343.75 =C2=B1  6%  numa-vmstat.node0.n=
uma_other
     32986 =C2=B1  1%     +67.0%      55076 =C2=B1  6%  numa-vmstat.node1.n=
r_active_file
     49187 =C2=B1  3%     +96.1%      96433 =C2=B1  6%  numa-vmstat.node1.n=
r_dirtied
    287.50 =C2=B1  7%     +92.0%     552.00 =C2=B1  2%  numa-vmstat.node1.n=
r_dirty
    107899 =C2=B1  1%     +43.5%     154829 =C2=B1  4%  numa-vmstat.node1.n=
r_file_pages
     73708 =C2=B1  2%     +33.7%      98510 =C2=B1  2%  numa-vmstat.node1.n=
r_inactive_file
    188.00 =C2=B1 14%     -32.2%     127.50 =C2=B1 14%  numa-vmstat.node1.n=
r_kernel_stack
     10239 =C2=B1  3%     +69.3%      17337 =C2=B1  4%  numa-vmstat.node1.n=
r_slab_reclaimable
     48857 =C2=B1  3%     +96.2%      95862 =C2=B1  6%  numa-vmstat.node1.n=
r_written
    330088 =C2=B1  3%     -27.7%     238545 =C2=B1  2%  numa-meminfo.node0.=
Active
    313158 =C2=B1  3%     -29.1%     222167 =C2=B1  3%  numa-meminfo.node0.=
Active(file)
      3404 =C2=B1  1%     -29.4%       2401 =C2=B1  2%  numa-meminfo.node0.=
Dirty
    814757 =C2=B1  2%     -24.1%     618527 =C2=B1  2%  numa-meminfo.node0.=
FilePages
    500690 =C2=B1  1%     -21.0%     395786 =C2=B1  2%  numa-meminfo.node0.=
Inactive
    496249 =C2=B1  1%     -21.1%     391380 =C2=B1  2%  numa-meminfo.node0.=
Inactive(file)
      3416 =C2=B1 12%     +26.9%       4334 =C2=B1  6%  numa-meminfo.node0.=
KernelStack
    996304 =C2=B1  1%     -22.4%     773020 =C2=B1  1%  numa-meminfo.node0.=
MemUsed
     98632 =C2=B1  1%     -29.6%      69481 =C2=B1  4%  numa-meminfo.node0.=
SReclaimable
    120967 =C2=B1  1%     -24.6%      91223 =C2=B1  2%  numa-meminfo.node0.=
Slab
    147024 =C2=B1  2%     +60.7%     236270 =C2=B1  6%  numa-meminfo.node1.=
Active
    131949 =C2=B1  1%     +67.0%     220312 =C2=B1  6%  numa-meminfo.node1.=
Active(file)
      1152 =C2=B1  7%     +91.5%       2207 =C2=B1  2%  numa-meminfo.node1.=
Dirty
    431603 =C2=B1  1%     +43.5%     619342 =C2=B1  4%  numa-meminfo.node1.=
FilePages
    299227 =C2=B1  2%     +33.2%     398472 =C2=B1  2%  numa-meminfo.node1.=
Inactive
    294836 =C2=B1  2%     +33.7%     394051 =C2=B1  2%  numa-meminfo.node1.=
Inactive(file)
      3015 =C2=B1 14%     -32.1%       2047 =C2=B1 14%  numa-meminfo.node1.=
KernelStack
    545740 =C2=B1  1%     +39.4%     760561 =C2=B1  3%  numa-meminfo.node1.=
MemUsed
     40960 =C2=B1  3%     +69.3%      69354 =C2=B1  4%  numa-meminfo.node1.=
SReclaimable
     59410 =C2=B1  2%     +48.8%      88424 =C2=B1  3%  numa-meminfo.node1.=
Slab
     10.50 =C2=B1 15%     -47.6%       5.50 =C2=B1 20%  sched_debug.cfs_rq[=
0]:/.nr_spread_over
    553.00 =C2=B1  5%     +23.1%     680.75 =C2=B1  8%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
      2296 =C2=B1  4%     +45.7%       3346 =C2=B1  4%  sched_debug.cfs_rq[=
10]:/.exec_clock
     -7449 =C2=B1-18%     -37.5%      -4655 =C2=B1 -5%  sched_debug.cfs_rq[=
10]:/.spread0
    540.50 =C2=B1  3%     +26.7%     685.00 =C2=B1  8%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
      1300 =C2=B1  7%    +182.2%       3671 =C2=B1 12%  sched_debug.cfs_rq[=
11]:/.exec_clock
      4146 =C2=B1 16%     +76.0%       7295 =C2=B1 11%  sched_debug.cfs_rq[=
11]:/.min_vruntime
     -8740 =C2=B1-16%     -57.1%      -3746 =C2=B1-18%  sched_debug.cfs_rq[=
11]:/.spread0
    544.75 =C2=B1  3%     +25.7%     685.00 =C2=B1  9%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
      2481 =C2=B1 19%    +111.8%       5257 =C2=B1 25%  sched_debug.cfs_rq[=
12]:/.exec_clock
      5363 =C2=B1  8%     +48.4%       7961 =C2=B1 14%  sched_debug.cfs_rq[=
12]:/.min_vruntime
     -7523 =C2=B1-16%     -59.1%      -3080 =C2=B1-41%  sched_debug.cfs_rq[=
12]:/.spread0
    546.00 =C2=B1  3%     +25.9%     687.50 =C2=B1  8%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
     47.75 =C2=B1 46%     +77.5%      84.75 =C2=B1 30%  sched_debug.cfs_rq[=
12]:/.util_avg
      1326 =C2=B1  9%    +168.9%       3567 =C2=B1 16%  sched_debug.cfs_rq[=
13]:/.exec_clock
      4316 =C2=B1  7%     +67.3%       7220 =C2=B1 11%  sched_debug.cfs_rq[=
13]:/.min_vruntime
     -8571 =C2=B1-22%     -55.4%      -3821 =C2=B1-23%  sched_debug.cfs_rq[=
13]:/.spread0
    548.00 =C2=B1  3%     +26.0%     690.25 =C2=B1  8%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
      5.75 =C2=B1 52%     -65.2%       2.00 =C2=B1 86%  sched_debug.cfs_rq[=
14]:/.nr_spread_over
    552.00 =C2=B1  3%     +25.1%     690.75 =C2=B1  8%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
      1622 =C2=B1  7%    +136.8%       3842 =C2=B1 10%  sched_debug.cfs_rq[=
15]:/.exec_clock
      4452 =C2=B1 10%     +54.4%       6875 =C2=B1  7%  sched_debug.cfs_rq[=
15]:/.min_vruntime
     -8435 =C2=B1-19%     -50.6%      -4166 =C2=B1 -5%  sched_debug.cfs_rq[=
15]:/.spread0
    552.00 =C2=B1  3%     +25.8%     694.50 =C2=B1  8%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
     40.00 =C2=B1 55%    +143.8%      97.50 =C2=B1 11%  sched_debug.cfs_rq[=
15]:/.util_avg
    555.50 =C2=B1  5%     +22.4%     680.00 =C2=B1  8%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
    555.50 =C2=B1  6%     +21.8%     676.75 =C2=B1  8%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
     36.00 =C2=B1 14%     +29.2%      46.50 =C2=B1 20%  sched_debug.cfs_rq[=
3]:/.load_avg
    551.50 =C2=B1  6%     +22.5%     675.50 =C2=B1  8%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
     35.75 =C2=B1 15%     +30.8%      46.75 =C2=B1 20%  sched_debug.cfs_rq[=
3]:/.tg_load_avg_contrib
      3063 =C2=B1  9%     +49.3%       4574 =C2=B1 26%  sched_debug.cfs_rq[=
4]:/.exec_clock
     -5335 =C2=B1-15%     -36.0%      -3417 =C2=B1-20%  sched_debug.cfs_rq[=
4]:/.spread0
    552.25 =C2=B1  6%     +22.7%     677.50 =C2=B1  9%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
      3056 =C2=B1 13%     +31.9%       4029 =C2=B1  7%  sched_debug.cfs_rq[=
5]:/.exec_clock
     -6246 =C2=B1-27%     -46.0%      -3374 =C2=B1-26%  sched_debug.cfs_rq[=
5]:/.spread0
    552.25 =C2=B1  6%     +21.8%     672.50 =C2=B1  8%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
      2929 =C2=B1  4%     +37.9%       4041 =C2=B1 13%  sched_debug.cfs_rq[=
6]:/.exec_clock
     -5929 =C2=B1-26%     -35.3%      -3833 =C2=B1-14%  sched_debug.cfs_rq[=
6]:/.spread0
    537.75 =C2=B1  4%     +25.1%     672.75 =C2=B1  8%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
      3132 =C2=B1 26%     +36.1%       4262 =C2=B1 11%  sched_debug.cfs_rq[=
7]:/.exec_clock
     -6184 =C2=B1-30%     -49.0%      -3151 =C2=B1-30%  sched_debug.cfs_rq[=
7]:/.spread0
    541.75 =C2=B1  5%     +24.6%     675.25 =C2=B1  8%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
      2411 =C2=B1 16%     +35.0%       3256 =C2=B1  2%  sched_debug.cfs_rq[=
8]:/.exec_clock
    536.25 =C2=B1  3%     +26.3%     677.50 =C2=B1  8%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
      1367 =C2=B1 11%    +209.6%       4232 =C2=B1 21%  sched_debug.cfs_rq[=
9]:/.exec_clock
      4109 =C2=B1 11%     +74.6%       7177 =C2=B1 13%  sched_debug.cfs_rq[=
9]:/.min_vruntime
     -8777 =C2=B1-17%     -56.0%      -3864 =C2=B1-33%  sched_debug.cfs_rq[=
9]:/.spread0
    539.50 =C2=B1  2%     +26.2%     681.00 =C2=B1  8%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
    797029 =C2=B1  6%     +19.7%     954108 =C2=B1  2%  sched_debug.cpu#0.a=
vg_idle
     23324 =C2=B1  5%     -13.6%      20164 =C2=B1  2%  sched_debug.cpu#0.n=
r_load_updates
    182645 =C2=B1  5%     -34.7%     119281 =C2=B1  2%  sched_debug.cpu#0.n=
r_switches
    -14068 =C2=B1 -2%     -98.0%    -282.00 =C2=B1-15%  sched_debug.cpu#0.n=
r_uninterruptible
     78351 =C2=B1  6%     -37.8%      48707 =C2=B1  2%  sched_debug.cpu#0.s=
ched_goidle
    143227 =C2=B1  3%     -26.9%     104768 =C2=B1  2%  sched_debug.cpu#0.t=
twu_count
     61522 =C2=B1  0%     -72.4%      16979 =C2=B1  4%  sched_debug.cpu#0.t=
twu_local
     11817 =C2=B1 11%     +51.3%      17882 =C2=B1  4%  sched_debug.cpu#1.n=
r_load_updates
     71706 =C2=B1 19%     +48.4%     106392 =C2=B1  4%  sched_debug.cpu#1.n=
r_switches
    428.50 =C2=B1 32%    -137.9%    -162.25 =C2=B1-25%  sched_debug.cpu#1.n=
r_uninterruptible
     74951 =C2=B1 18%     +44.7%     108445 =C2=B1  5%  sched_debug.cpu#1.s=
ched_count
     31348 =C2=B1 21%     +38.0%      43275 =C2=B1  4%  sched_debug.cpu#1.s=
ched_goidle
     32223 =C2=B1 10%     +82.5%      58816 =C2=B1  3%  sched_debug.cpu#1.t=
twu_count
      7130 =C2=B1  7%     -28.8%       5074 =C2=B1 10%  sched_debug.cpu#1.t=
twu_local
      1697 =C2=B1 20%     -92.2%     132.00 =C2=B1 26%  sched_debug.cpu#10.=
nr_uninterruptible
      9465 =C2=B1  3%     -83.6%       1549 =C2=B1  4%  sched_debug.cpu#10.=
ttwu_local
    923804 =C2=B1  4%     -13.2%     801932 =C2=B1 11%  sched_debug.cpu#11.=
avg_idle
      8913 =C2=B1  8%     +53.3%      13668 =C2=B1  4%  sched_debug.cpu#11.=
nr_load_updates
     41637 =C2=B1 11%    +108.4%      86754 =C2=B1  8%  sched_debug.cpu#11.=
nr_switches
    488.50 =C2=B1 21%     -67.9%     156.75 =C2=B1 19%  sched_debug.cpu#11.=
nr_uninterruptible
     41683 =C2=B1 11%    +109.8%      87457 =C2=B1  8%  sched_debug.cpu#11.=
sched_count
     16228 =C2=B1 12%    +110.7%      34196 =C2=B1  9%  sched_debug.cpu#11.=
sched_goidle
     30437 =C2=B1 25%     +70.8%      51994 =C2=B1  9%  sched_debug.cpu#11.=
ttwu_count
     12868 =C2=B1  2%     +20.7%      15528 =C2=B1  8%  sched_debug.cpu#12.=
nr_load_updates
      1746 =C2=B1  6%     -91.7%     144.50 =C2=B1 13%  sched_debug.cpu#12.=
nr_uninterruptible
     10221 =C2=B1  2%     -76.1%       2440 =C2=B1 25%  sched_debug.cpu#12.=
ttwu_local
    951235 =C2=B1  5%     -15.3%     805287 =C2=B1  4%  sched_debug.cpu#13.=
avg_idle
      8965 =C2=B1  8%     +50.4%      13480 =C2=B1  4%  sched_debug.cpu#13.=
nr_load_updates
     39834 =C2=B1 14%    +126.0%      90034 =C2=B1  6%  sched_debug.cpu#13.=
nr_switches
    452.75 =C2=B1 22%     -68.2%     144.00 =C2=B1 19%  sched_debug.cpu#13.=
nr_uninterruptible
     40599 =C2=B1 13%    +130.4%      93534 =C2=B1  8%  sched_debug.cpu#13.=
sched_count
     15351 =C2=B1 16%    +133.4%      35834 =C2=B1  7%  sched_debug.cpu#13.=
sched_goidle
     24825 =C2=B1  5%    +103.7%      50576 =C2=B1  6%  sched_debug.cpu#13.=
ttwu_count
      6324 =C2=B1  7%     -36.3%       4030 =C2=B1  4%  sched_debug.cpu#13.=
ttwu_local
     72443 =C2=B1  4%     +17.9%      85429 =C2=B1  3%  sched_debug.cpu#14.=
nr_switches
      1972 =C2=B1 12%     -93.8%     121.50 =C2=B1 19%  sched_debug.cpu#14.=
nr_uninterruptible
     72520 =C2=B1  4%     +17.9%      85502 =C2=B1  3%  sched_debug.cpu#14.=
sched_count
     26452 =C2=B1  4%     +27.1%      33620 =C2=B1  5%  sched_debug.cpu#14.=
sched_goidle
     10265 =C2=B1  4%     -84.3%       1609 =C2=B1 17%  sched_debug.cpu#14.=
ttwu_local
      0.00 =C2=B1  0%      +Inf%       3.25 =C2=B1 70%  sched_debug.cpu#15.=
cpu_load[3]
      0.00 =C2=B1  0%      +Inf%       3.50 =C2=B1 82%  sched_debug.cpu#15.=
cpu_load[4]
      8890 =C2=B1  5%     +55.5%      13824 =C2=B1  3%  sched_debug.cpu#15.=
nr_load_updates
     38824 =C2=B1  6%    +112.9%      82640 =C2=B1  3%  sched_debug.cpu#15.=
nr_switches
    601.00 =C2=B1 19%     -70.8%     175.25 =C2=B1 22%  sched_debug.cpu#15.=
nr_uninterruptible
     38868 =C2=B1  6%    +112.8%      82715 =C2=B1  3%  sched_debug.cpu#15.=
sched_count
     14797 =C2=B1  6%    +116.0%      31969 =C2=B1  4%  sched_debug.cpu#15.=
sched_goidle
     27494 =C2=B1 22%     +86.8%      51373 =C2=B1  2%  sched_debug.cpu#15.=
ttwu_count
      6153 =C2=B1  4%     -31.9%       4191 =C2=B1  3%  sched_debug.cpu#15.=
ttwu_local
      1078 =C2=B1 22%    -110.4%    -111.75 =C2=B1-23%  sched_debug.cpu#2.n=
r_uninterruptible
     12223 =C2=B1  5%     -77.1%       2797 =C2=B1  5%  sched_debug.cpu#2.t=
twu_local
     12798 =C2=B1  7%     +37.1%      17543 =C2=B1  3%  sched_debug.cpu#3.n=
r_load_updates
    141.50 =C2=B1 65%    -202.8%    -145.50 =C2=B1-21%  sched_debug.cpu#3.n=
r_uninterruptible
     32902 =C2=B1 12%     +87.2%      61593 =C2=B1  6%  sched_debug.cpu#3.t=
twu_count
      8936 =C2=B1 25%     -42.2%       5162 =C2=B1  7%  sched_debug.cpu#3.t=
twu_local
     15863 =C2=B1  3%     +17.3%      18602 =C2=B1  4%  sched_debug.cpu#4.n=
r_load_updates
      1631 =C2=B1  3%    -108.5%    -139.00 =C2=B1-31%  sched_debug.cpu#4.n=
r_uninterruptible
      9656 =C2=B1  6%     -74.7%       2442 =C2=B1  7%  sched_debug.cpu#4.t=
twu_local
     12597 =C2=B1  7%     +40.9%      17748 =C2=B1  4%  sched_debug.cpu#5.n=
r_load_updates
     78454 =C2=B1 20%     +33.0%     104376 =C2=B1  2%  sched_debug.cpu#5.n=
r_switches
    240.75 =C2=B1 34%    -155.1%    -132.75 =C2=B1-15%  sched_debug.cpu#5.n=
r_uninterruptible
     83088 =C2=B1 18%     +29.5%     107594 =C2=B1  4%  sched_debug.cpu#5.s=
ched_count
     32838 =C2=B1 10%     +80.5%      59287 =C2=B1  2%  sched_debug.cpu#5.t=
twu_count
      7323 =C2=B1  9%     -33.0%       4907 =C2=B1  3%  sched_debug.cpu#5.t=
twu_local
     15172 =C2=B1  1%     +17.8%      17871 =C2=B1  3%  sched_debug.cpu#6.n=
r_load_updates
      1670 =C2=B1 15%    -105.7%     -96.00 =C2=B1-30%  sched_debug.cpu#6.n=
r_uninterruptible
      9007 =C2=B1  4%     -77.3%       2043 =C2=B1  6%  sched_debug.cpu#6.t=
twu_local
     12231 =C2=B1  8%     +44.7%      17698 =C2=B1  3%  sched_debug.cpu#7.n=
r_load_updates
     66987 =C2=B1 12%     +52.8%     102366 =C2=B1  2%  sched_debug.cpu#7.n=
r_switches
    211.25 =C2=B1 32%    -182.1%    -173.50 =C2=B1-16%  sched_debug.cpu#7.n=
r_uninterruptible
     68571 =C2=B1 12%     +54.0%     105617 =C2=B1  2%  sched_debug.cpu#7.s=
ched_count
     28991 =C2=B1 15%     +42.4%      41283 =C2=B1  2%  sched_debug.cpu#7.s=
ched_goidle
     32836 =C2=B1 12%     +85.9%      61048 =C2=B1  7%  sched_debug.cpu#7.t=
twu_count
      7504 =C2=B1  9%     -33.0%       5031 =C2=B1  5%  sched_debug.cpu#7.t=
twu_local
     12373 =C2=B1  3%     +14.7%      14189 =C2=B1  4%  sched_debug.cpu#8.n=
r_load_updates
     72843 =C2=B1  3%     +18.6%      86425 =C2=B1  3%  sched_debug.cpu#8.n=
r_switches
      1186 =C2=B1  8%     -79.5%     243.50 =C2=B1 12%  sched_debug.cpu#8.n=
r_uninterruptible
     72933 =C2=B1  3%     +18.6%      86507 =C2=B1  3%  sched_debug.cpu#8.s=
ched_count
     27594 =C2=B1  3%     +23.6%      34110 =C2=B1  4%  sched_debug.cpu#8.s=
ched_goidle
      9400 =C2=B1  3%     -76.5%       2205 =C2=B1 64%  sched_debug.cpu#8.t=
twu_local
      9067 =C2=B1  7%     +48.5%      13465 =C2=B1  3%  sched_debug.cpu#9.n=
r_load_updates
     39627 =C2=B1  7%    +112.4%      84169 =C2=B1  2%  sched_debug.cpu#9.n=
r_switches
    540.25 =C2=B1 18%     -73.4%     143.50 =C2=B1 22%  sched_debug.cpu#9.n=
r_uninterruptible
     39670 =C2=B1  7%    +112.7%      84392 =C2=B1  2%  sched_debug.cpu#9.s=
ched_count
     15298 =C2=B1  8%    +114.4%      32795 =C2=B1  3%  sched_debug.cpu#9.s=
ched_goidle
     32634 =C2=B1 29%     +55.6%      50773 =C2=B1  0%  sched_debug.cpu#9.t=
twu_count
      0.88 =C2=B1140%     +88.4%       1.66 =C2=B1 65%  sched_debug.rt_rq[1=
]:/.rt_time

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/nr_=
threads/disk/fs/filesize/test_size/sync_method/nr_directories/nr_files_per_=
directory:
  lkp-ne04/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performa=
nce/1x/32t/1HDD/f2fs/8K/400M/fsyncBeforeClose/16d/256fpd

commit: =

  1fda6948fbb2e756c8f7cabef40395cee2984298
  9b7aaf11b8d61eeb87f3b99fb5ae59e61bb35f27

1fda6948fbb2e756 9b7aaf11b8d61eeb87f3b99fb5 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   4492452 =C2=B1  2%      -6.4%    4206443 =C2=B1  3%  fsmark.app_overhead
     15381 =C2=B1  0%     -33.1%      10293 =C2=B1  1%  fsmark.time.involun=
tary_context_switches
     21.25 =C2=B1  2%     +20.0%      25.50 =C2=B1  1%  fsmark.time.percent=
_of_cpu_this_job_got
    546988 =C2=B1  0%      +5.7%     577983 =C2=B1  0%  fsmark.time.volunta=
ry_context_switches
      2.00 =C2=B1 35%    -100.0%       0.00 =C2=B1  0%  numa-numastat.node0=
.other_node
      1446 =C2=B1  5%     -37.5%     904.52 =C2=B1  7%  uptime.idle
    508.75 =C2=B1  4%     -12.7%     444.25 =C2=B1  4%  proc-vmstat.nr_allo=
c_batch
     35281 =C2=B1  0%     -42.0%      20449 =C2=B1  1%  proc-vmstat.pgactiv=
ate
     19547 =C2=B1  0%     -10.9%      17420 =C2=B1  1%  softirqs.BLOCK
     21636 =C2=B1  0%     +13.1%      24472 =C2=B1  0%  softirqs.RCU
     12276 =C2=B1  1%      +4.1%      12774 =C2=B1  1%  vmstat.system.cs
      1126 =C2=B1  0%     +23.0%       1385 =C2=B1  0%  vmstat.system.in
     15381 =C2=B1  0%     -33.1%      10293 =C2=B1  1%  time.involuntary_co=
ntext_switches
     21.25 =C2=B1  2%     +20.0%      25.50 =C2=B1  1%  time.percent_of_cpu=
_this_job_got
     23.20 =C2=B1  0%     +19.7%      27.78 =C2=B1  0%  time.system_time
      0.81 =C2=B1  6%     +33.8%       1.09 =C2=B1  5%  time.user_time
     42276 =C2=B1  1%     -10.8%      37701 =C2=B1  2%  numa-vmstat.node0.n=
r_active_file
     11195 =C2=B1  4%     -12.5%       9798 =C2=B1  1%  numa-vmstat.node0.n=
r_slab_reclaimable
      1240 =C2=B1  9%     -76.2%     295.75 =C2=B1 12%  numa-vmstat.node0.n=
uma_other
     28794 =C2=B1  3%     +26.1%      36296 =C2=B1  2%  numa-vmstat.node1.n=
r_active_file
      8316 =C2=B1  6%     +16.3%       9669 =C2=B1  2%  numa-vmstat.node1.n=
r_slab_reclaimable
    216.25 =C2=B1 12%   +3751.7%       8329 =C2=B1 97%  latency_stats.avg.w=
ait_on_page_bit.find_data_page.[f2fs].f2fs_find_entry.[f2fs].f2fs_lookup.[f=
2fs].lookup_real.__lookup_hash.filename_create.SyS_mkdir.entry_SYSCALL_64_f=
astpath
      2832 =C2=B1  8%    +219.4%       9045 =C2=B1 31%  latency_stats.max.c=
all_rwsem_down_read_failed.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_=
page_writeback.[f2fs].wait_on_node_pages_writeback.[f2fs].f2fs_sync_file.[f=
2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
      2460 =C2=B1 14%    +305.5%       9977 =C2=B1 31%  latency_stats.max.c=
all_rwsem_down_write_failed.f2fs_submit_merged_bio.[f2fs].sync_node_pages.[=
f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCAL=
L_64_fastpath
      2851 =C2=B1  9%    +264.0%      10379 =C2=B1 29%  latency_stats.max.c=
all_rwsem_down_write_failed.f2fs_submit_page_mbio.[f2fs].do_write_page.[f2f=
s].write_node_page.[f2fs].f2fs_write_node_page.[f2fs].sync_node_pages.[f2fs=
].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64=
_fastpath
    216.25 =C2=B1 12%   +3751.7%       8329 =C2=B1 97%  latency_stats.max.w=
ait_on_page_bit.find_data_page.[f2fs].f2fs_find_entry.[f2fs].f2fs_lookup.[f=
2fs].lookup_real.__lookup_hash.filename_create.SyS_mkdir.entry_SYSCALL_64_f=
astpath
    216.25 =C2=B1 12%   +3751.7%       8329 =C2=B1 97%  latency_stats.sum.w=
ait_on_page_bit.find_data_page.[f2fs].f2fs_find_entry.[f2fs].f2fs_lookup.[f=
2fs].lookup_real.__lookup_hash.filename_create.SyS_mkdir.entry_SYSCALL_64_f=
astpath
 1.432e+08 =C2=B1  1%     -84.3%   22481638 =C2=B1  1%  cpuidle.C1-NHM.time
    141844 =C2=B1  8%     -63.1%      52346 =C2=B1 20%  cpuidle.C1-NHM.usage
  32847234 =C2=B1  4%     -71.2%    9464251 =C2=B1  2%  cpuidle.C1E-NHM.time
     26193 =C2=B1  3%     -65.0%       9156 =C2=B1  1%  cpuidle.C1E-NHM.usa=
ge
 5.112e+08 =C2=B1  0%     +43.9%  7.354e+08 =C2=B1  0%  cpuidle.C3-NHM.time
    199235 =C2=B1  1%     +47.9%     294717 =C2=B1  0%  cpuidle.C3-NHM.usage
    320518 =C2=B1  2%     +25.4%     401876 =C2=B1  0%  cpuidle.C6-NHM.usage
      1.60 =C2=B1  1%     +34.1%       2.14 =C2=B1  0%  turbostat.%Busy
     38.50 =C2=B1  1%      +7.1%      41.25 =C2=B1  1%  turbostat.Avg_MHz
      2398 =C2=B1  0%     -19.8%       1924 =C2=B1  0%  turbostat.Bzy_MHz
     18.74 =C2=B1  1%     -65.2%       6.53 =C2=B1  0%  turbostat.CPU%c1
     35.40 =C2=B1  1%     +63.4%      57.86 =C2=B1  0%  turbostat.CPU%c3
     44.26 =C2=B1  0%     -24.4%      33.47 =C2=B1  1%  turbostat.CPU%c6
     20.05 =C2=B1  0%    +140.1%      48.14 =C2=B1  3%  turbostat.Pkg%pc3
      1.49 =C2=B1 11%     +39.5%       2.08 =C2=B1 11%  turbostat.Pkg%pc6
    181673 =C2=B1  2%      -9.2%     164982 =C2=B1  2%  numa-meminfo.node0.=
Active
    169108 =C2=B1  1%     -10.8%     150805 =C2=B1  2%  numa-meminfo.node0.=
Active(file)
      3080 =C2=B1  4%     +23.1%       3791 =C2=B1  8%  numa-meminfo.node0.=
KernelStack
     44782 =C2=B1  4%     -12.5%      39195 =C2=B1  1%  numa-meminfo.node0.=
SReclaimable
    131310 =C2=B1  3%     +22.0%     160211 =C2=B1  3%  numa-meminfo.node1.=
Active
    115180 =C2=B1  3%     +26.1%     145187 =C2=B1  2%  numa-meminfo.node1.=
Active(file)
      2702 =C2=B1  5%     -25.4%       2016 =C2=B1 15%  numa-meminfo.node1.=
KernelStack
    474615 =C2=B1  2%     +10.0%     521942 =C2=B1  2%  numa-meminfo.node1.=
MemUsed
     33264 =C2=B1  6%     +16.3%      38676 =C2=B1  2%  numa-meminfo.node1.=
SReclaimable
      2845 =C2=B1 22%     +62.7%       4630 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.exec_clock
      4147 =C2=B1 12%     +32.1%       5476 =C2=B1  3%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     37.50 =C2=B1 28%     +83.3%      68.75 =C2=B1 39%  sched_debug.cfs_rq[=
10]:/.load_avg
      1.00 =C2=B1141%   +1450.0%      15.50 =C2=B1 47%  sched_debug.cfs_rq[=
10]:/.runnable_load_avg
     -2773 =C2=B1-25%     +52.5%      -4231 =C2=B1 -6%  sched_debug.cfs_rq[=
10]:/.spread0
     37.50 =C2=B1 28%     +83.3%      68.75 =C2=B1 39%  sched_debug.cfs_rq[=
10]:/.tg_load_avg_contrib
     -2292 =C2=B1-30%     +57.2%      -3603 =C2=B1-16%  sched_debug.cfs_rq[=
11]:/.spread0
    832.60 =C2=B1 53%    +304.8%       3370 =C2=B1  1%  sched_debug.cfs_rq[=
12]:/.exec_clock
      1458 =C2=B1 34%    +152.8%       3686 =C2=B1  3%  sched_debug.cfs_rq[=
12]:/.min_vruntime
     -2793 =C2=B1-22%     +48.2%      -4139 =C2=B1 -6%  sched_debug.cfs_rq[=
13]:/.spread0
      2009 =C2=B1 37%     -61.2%     779.06 =C2=B1 15%  sched_debug.cfs_rq[=
14]:/.exec_clock
      2494 =C2=B1 27%     -53.3%       1164 =C2=B1 11%  sched_debug.cfs_rq[=
14]:/.min_vruntime
     -1654 =C2=B1-54%    +160.8%      -4314 =C2=B1 -3%  sched_debug.cfs_rq[=
14]:/.spread0
    741.45 =C2=B1 25%    +169.0%       1994 =C2=B1 20%  sched_debug.cfs_rq[=
15]:/.exec_clock
    170.50 =C2=B1103%     -72.7%      46.50 =C2=B1 35%  sched_debug.cfs_rq[=
15]:/.load_avg
      1359 =C2=B1 20%    +114.3%       2912 =C2=B1  9%  sched_debug.cfs_rq[=
15]:/.min_vruntime
    170.50 =C2=B1103%     -73.2%      45.75 =C2=B1 37%  sched_debug.cfs_rq[=
15]:/.tg_load_avg_contrib
      2566 =C2=B1 28%     -45.0%       1412 =C2=B1 41%  sched_debug.cfs_rq[=
1]:/.exec_clock
      8.00 =C2=B1 23%     +40.6%      11.25 =C2=B1  7%  sched_debug.cfs_rq[=
1]:/.nr_spread_over
   -771.37 =C2=B1-105%    +306.4%      -3135 =C2=B1-13%  sched_debug.cfs_rq=
[1]:/.spread0
      2342 =C2=B1 32%     -55.7%       1038 =C2=B1 17%  sched_debug.cfs_rq[=
2]:/.exec_clock
   -827.09 =C2=B1-85%    +255.9%      -2943 =C2=B1-16%  sched_debug.cfs_rq[=
2]:/.spread0
     -2129 =C2=B1-11%     +32.8%      -2827 =C2=B1-14%  sched_debug.cfs_rq[=
3]:/.spread0
     -1589 =C2=B1-85%    +149.2%      -3960 =C2=B1 -8%  sched_debug.cfs_rq[=
4]:/.spread0
     -2098 =C2=B1-32%     +86.8%      -3921 =C2=B1-17%  sched_debug.cfs_rq[=
6]:/.spread0
     -1676 =C2=B1-32%     +77.2%      -2971 =C2=B1-15%  sched_debug.cfs_rq[=
7]:/.spread0
    661.93 =C2=B1 20%     +28.3%     849.17 =C2=B1  9%  sched_debug.cfs_rq[=
8]:/.exec_clock
     -2541 =C2=B1-37%     +67.0%      -4243 =C2=B1 -6%  sched_debug.cfs_rq[=
8]:/.spread0
    559.96 =C2=B1 14%     +26.0%     705.81 =C2=B1 10%  sched_debug.cfs_rq[=
9]:/.exec_clock
     -3118 =C2=B1-16%     +31.7%      -4107 =C2=B1 -9%  sched_debug.cfs_rq[=
9]:/.spread0
     11.25 =C2=B1 92%     -97.0%       0.33 =C2=B1141%  sched_debug.cpu#0.c=
pu_load[0]
     -2938 =C2=B1 -3%     -80.6%    -569.75 =C2=B1 -2%  sched_debug.cpu#0.n=
r_uninterruptible
     53209 =C2=B1  3%     -12.6%      46509 =C2=B1  2%  sched_debug.cpu#0.t=
twu_count
     14722 =C2=B1  2%     -45.9%       7965 =C2=B1  8%  sched_debug.cpu#0.t=
twu_local
      7849 =C2=B1  9%     +29.9%      10195 =C2=B1  2%  sched_debug.cpu#1.n=
r_load_updates
     22636 =C2=B1  8%     +19.4%      27022 =C2=B1  0%  sched_debug.cpu#1.n=
r_switches
   -595.50 =C2=B1-15%     -77.0%    -137.25 =C2=B1 -7%  sched_debug.cpu#1.n=
r_uninterruptible
     23602 =C2=B1 11%     +19.8%      28263 =C2=B1  5%  sched_debug.cpu#1.s=
ched_count
      9753 =C2=B1  8%     +25.6%      12251 =C2=B1  0%  sched_debug.cpu#1.s=
ched_goidle
      3805 =C2=B1 11%     -58.1%       1596 =C2=B1 13%  sched_debug.cpu#1.t=
twu_local
      7063 =C2=B1  5%     +21.6%       8589 =C2=B1  0%  sched_debug.cpu#10.=
nr_load_updates
     19925 =C2=B1  6%     +19.4%      23800 =C2=B1 13%  sched_debug.cpu#10.=
nr_switches
      1036 =C2=B1  8%     -85.1%     154.50 =C2=B1 14%  sched_debug.cpu#10.=
nr_uninterruptible
     20232 =C2=B1  8%     +17.7%      23815 =C2=B1 13%  sched_debug.cpu#10.=
sched_count
      7808 =C2=B1  6%     +39.1%      10862 =C2=B1 15%  sched_debug.cpu#10.=
sched_goidle
      2038 =C2=B1  3%     -77.4%     460.50 =C2=B1  9%  sched_debug.cpu#10.=
ttwu_local
      6102 =C2=B1  8%     +37.1%       8365 =C2=B1  0%  sched_debug.cpu#11.=
nr_load_updates
    617.25 =C2=B1 16%     -75.6%     150.50 =C2=B1  9%  sched_debug.cpu#11.=
nr_uninterruptible
      2006 =C2=B1  6%     -56.6%     870.25 =C2=B1  7%  sched_debug.cpu#11.=
ttwu_local
      7497 =C2=B1  7%     +47.5%      11060 =C2=B1  2%  sched_debug.cpu#12.=
nr_load_updates
     21078 =C2=B1  9%     +32.4%      27905 =C2=B1 10%  sched_debug.cpu#12.=
nr_switches
    994.00 =C2=B1 10%     -82.8%     170.50 =C2=B1  2%  sched_debug.cpu#12.=
nr_uninterruptible
     21580 =C2=B1 12%     +29.4%      27928 =C2=B1 10%  sched_debug.cpu#12.=
sched_count
      8237 =C2=B1  9%     +42.6%      11747 =C2=B1 12%  sched_debug.cpu#12.=
sched_goidle
      9114 =C2=B1  7%     +16.6%      10629 =C2=B1 10%  sched_debug.cpu#12.=
ttwu_count
      6373 =C2=B1  8%     +29.6%       8259 =C2=B1  1%  sched_debug.cpu#13.=
nr_load_updates
     14413 =C2=B1 11%     +45.4%      20958 =C2=B1  1%  sched_debug.cpu#13.=
nr_switches
    538.75 =C2=B1 10%     -72.1%     150.50 =C2=B1  9%  sched_debug.cpu#13.=
nr_uninterruptible
     15126 =C2=B1 14%     +38.7%      20972 =C2=B1  1%  sched_debug.cpu#13.=
sched_count
      5666 =C2=B1 13%     +65.6%       9381 =C2=B1  1%  sched_debug.cpu#13.=
sched_goidle
      6399 =C2=B1  4%     +53.5%       9825 =C2=B1  2%  sched_debug.cpu#13.=
ttwu_count
      2164 =C2=B1  3%     -58.9%     890.00 =C2=B1  6%  sched_debug.cpu#13.=
ttwu_local
      1027 =C2=B1  5%     -85.0%     154.00 =C2=B1  3%  sched_debug.cpu#14.=
nr_uninterruptible
      7727 =C2=B1  6%     +24.0%       9585 =C2=B1  2%  sched_debug.cpu#14.=
sched_goidle
      2719 =C2=B1 20%     -83.8%     441.50 =C2=B1 10%  sched_debug.cpu#14.=
ttwu_local
      6289 =C2=B1  6%     +33.9%       8418 =C2=B1  5%  sched_debug.cpu#15.=
nr_load_updates
     13578 =C2=B1  7%     +66.0%      22544 =C2=B1  6%  sched_debug.cpu#15.=
nr_switches
    626.25 =C2=B1 13%     -79.7%     127.00 =C2=B1 12%  sched_debug.cpu#15.=
nr_uninterruptible
     13594 =C2=B1  7%     +76.8%      24039 =C2=B1 10%  sched_debug.cpu#15.=
sched_count
      5280 =C2=B1  7%     +90.4%      10052 =C2=B1  7%  sched_debug.cpu#15.=
sched_goidle
      6278 =C2=B1  7%     +66.7%      10465 =C2=B1  8%  sched_debug.cpu#15.=
ttwu_count
      2049 =C2=B1  7%     -45.0%       1126 =C2=B1  3%  sched_debug.cpu#15.=
ttwu_local
   -285.00 =C2=B1-32%     -67.5%     -92.50 =C2=B1-10%  sched_debug.cpu#2.n=
r_uninterruptible
      4026 =C2=B1  9%     -49.2%       2047 =C2=B1 18%  sched_debug.cpu#2.t=
twu_local
      8442 =C2=B1  6%     +12.4%       9490 =C2=B1  6%  sched_debug.cpu#3.n=
r_load_updates
   -546.75 =C2=B1-13%     -73.6%    -144.25 =C2=B1-20%  sched_debug.cpu#3.n=
r_uninterruptible
      3751 =C2=B1 10%     -57.4%       1599 =C2=B1 10%  sched_debug.cpu#3.t=
twu_local
     38269 =C2=B1 20%     -24.3%      28967 =C2=B1  8%  sched_debug.cpu#4.n=
r_switches
   -483.00 =C2=B1 -4%     -78.4%    -104.25 =C2=B1-20%  sched_debug.cpu#4.n=
r_uninterruptible
     40064 =C2=B1 23%     -27.6%      28987 =C2=B1  8%  sched_debug.cpu#4.s=
ched_count
     16991 =C2=B1 22%     -21.8%      13285 =C2=B1  9%  sched_debug.cpu#4.s=
ched_goidle
     17083 =C2=B1 23%     -31.6%      11685 =C2=B1  2%  sched_debug.cpu#4.t=
twu_count
      6315 =C2=B1 52%     -79.5%       1293 =C2=B1 14%  sched_debug.cpu#4.t=
twu_local
      7934 =C2=B1 18%     +28.5%      10194 =C2=B1  2%  sched_debug.cpu#5.n=
r_load_updates
   -548.00 =C2=B1 -8%     -71.9%    -154.25 =C2=B1 -3%  sched_debug.cpu#5.n=
r_uninterruptible
      4016 =C2=B1 10%     -45.4%       2193 =C2=B1 37%  sched_debug.cpu#5.t=
twu_local
     33750 =C2=B1 15%     -18.8%      27416 =C2=B1  1%  sched_debug.cpu#6.n=
r_switches
   -496.25 =C2=B1-17%     -79.8%    -100.25 =C2=B1-16%  sched_debug.cpu#6.n=
r_uninterruptible
     34183 =C2=B1 15%     -19.8%      27431 =C2=B1  1%  sched_debug.cpu#6.s=
ched_count
     14905 =C2=B1  5%     -24.2%      11303 =C2=B1  2%  sched_debug.cpu#6.t=
twu_count
      3939 =C2=B1 10%     -68.2%       1252 =C2=B1 18%  sched_debug.cpu#6.t=
twu_local
      8448 =C2=B1  7%     +18.4%      10006 =C2=B1  4%  sched_debug.cpu#7.n=
r_load_updates
   -561.25 =C2=B1 -3%     -75.4%    -138.25 =C2=B1 -9%  sched_debug.cpu#7.n=
r_uninterruptible
     12500 =C2=B1  6%     +17.5%      14692 =C2=B1 11%  sched_debug.cpu#7.t=
twu_count
      4091 =C2=B1  2%     -47.6%       2144 =C2=B1 47%  sched_debug.cpu#7.t=
twu_local
      7272 =C2=B1  6%     +22.5%       8905 =C2=B1  0%  sched_debug.cpu#8.n=
r_load_updates
      1054 =C2=B1  8%     -63.1%     389.25 =C2=B1  4%  sched_debug.cpu#8.n=
r_uninterruptible
      3888 =C2=B1 22%     -66.0%       1322 =C2=B1 63%  sched_debug.cpu#8.t=
twu_local
      6501 =C2=B1  8%     +27.5%       8286 =C2=B1  1%  sched_debug.cpu#9.n=
r_load_updates
     13794 =C2=B1  4%     +49.6%      20635 =C2=B1  4%  sched_debug.cpu#9.n=
r_switches
    572.00 =C2=B1  4%     -72.6%     156.50 =C2=B1 14%  sched_debug.cpu#9.n=
r_uninterruptible
     13806 =C2=B1  4%     +56.1%      21548 =C2=B1 10%  sched_debug.cpu#9.s=
ched_count
      5400 =C2=B1  4%     +71.8%       9276 =C2=B1  5%  sched_debug.cpu#9.s=
ched_goidle
      2186 =C2=B1  2%     -63.7%     794.25 =C2=B1  8%  sched_debug.cpu#9.t=
twu_local
     57156 =C2=B1  7%     -11.2%      50743 =C2=B1  8%  sched_debug.ktime

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/nr_threads/mod=
e/ipc:
  wsm/hackbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performanc=
e/1600%/process/pipe

commit: =

  1fda6948fbb2e756c8f7cabef40395cee2984298
  9b7aaf11b8d61eeb87f3b99fb5ae59e61bb35f27

1fda6948fbb2e756 9b7aaf11b8d61eeb87f3b99fb5 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    120476 =C2=B1  0%     -55.6%      53476 =C2=B1  2%  hackbench.throughput
  59658336 =C2=B1 19%    +128.7%  1.364e+08 =C2=B1 11%  hackbench.time.invo=
luntary_context_switches
  13406227 =C2=B1 11%     -53.6%    6218943 =C2=B1 10%  hackbench.time.mino=
r_page_faults
  1.89e+08 =C2=B1 14%    +192.5%  5.529e+08 =C2=B1 12%  hackbench.time.volu=
ntary_context_switches
      6473 =C2=B1  5%     +19.8%       7754 =C2=B1  6%  slabinfo.files_cach=
e.active_objs
    495518 =C2=B1 13%     +52.9%     757653 =C2=B1 10%  softirqs.RCU
      2.69 =C2=B1  6%     -54.9%       1.21 =C2=B1  3%  turbostat.CPU%c1
   1195988 =C2=B1 30%     +70.3%    2036807 =C2=B1 17%  meminfo.Committed_AS
     97638 =C2=B1 30%     +70.5%     166453 =C2=B1 17%  meminfo.PageTables
    422212 =C2=B1 15%    +166.1%    1123695 =C2=B1 10%  vmstat.system.cs
     37971 =C2=B1 11%    +307.4%     154684 =C2=B1 10%  vmstat.system.in
    380.00 =C2=B1 12%     -54.2%     174.00 =C2=B1 10%  time.file_system_ou=
tputs
  59658336 =C2=B1 19%    +128.7%  1.364e+08 =C2=B1 11%  time.involuntary_co=
ntext_switches
  13406227 =C2=B1 11%     -53.6%    6218943 =C2=B1 10%  time.minor_page_fau=
lts
  1.89e+08 =C2=B1 14%    +192.5%  5.529e+08 =C2=B1 12%  time.voluntary_cont=
ext_switches
 1.635e+08 =C2=B1 11%     -62.9%   60612118 =C2=B1  9%  proc-vmstat.numa_hit
 1.635e+08 =C2=B1 11%     -62.9%   60612118 =C2=B1  9%  proc-vmstat.numa_lo=
cal
  88835997 =C2=B1 11%     -62.8%   33080695 =C2=B1  9%  proc-vmstat.pgalloc=
_dma32
  77342277 =C2=B1 11%     -62.8%   28767192 =C2=B1  9%  proc-vmstat.pgalloc=
_normal
  13627929 =C2=B1 11%     -52.0%    6540912 =C2=B1  9%  proc-vmstat.pgfault
 1.661e+08 =C2=B1 11%     -62.8%   61748704 =C2=B1  9%  proc-vmstat.pgfree
 1.151e+08 =C2=B1  8%     -56.5%   50071736 =C2=B1  6%  cpuidle.C1-NHM.time
   1762819 =C2=B1 14%     -59.1%     721352 =C2=B1  8%  cpuidle.C1-NHM.usage
  21760416 =C2=B1  7%     -53.8%   10049639 =C2=B1  8%  cpuidle.C1E-NHM.time
     73018 =C2=B1  9%     -58.3%      30479 =C2=B1 11%  cpuidle.C1E-NHM.usa=
ge
  20273243 =C2=B1  6%     -57.3%    8653974 =C2=B1  4%  cpuidle.C3-NHM.time
     33620 =C2=B1 12%     -51.9%      16179 =C2=B1 16%  cpuidle.C3-NHM.usage
      5676 =C2=B1 43%     -74.5%       1445 =C2=B1 62%  cpuidle.POLL.usage
     33045 =C2=B1173%    +876.6%     322737 =C2=B1171%  latency_stats.avg.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.exit_mmap.mmput.f=
lush_old_exec.load_elf_binary.search_binary_handler.do_execveat_common.SyS_=
execve.return_from_execve
     23160 =C2=B1173%     -79.4%       4779 =C2=B1101%  latency_stats.avg.c=
all_rwsem_down_write_failed.vma_adjust.__split_vma.split_vma.mprotect_fixup=
.SyS_mprotect.entry_SYSCALL_64_fastpath
   1039123 =C2=B1 22%     -82.0%     187519 =C2=B1  5%  latency_stats.avg.p=
ipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
      2189 =C2=B1  0%    +782.0%      19308 =C2=B1 80%  latency_stats.avg.w=
alk_component.path_lookupat.filename_lookup.user_path_at_empty.vfs_fstatat.=
SYSC_newstat.SyS_newstat.entry_SYSCALL_64_fastpath
  1.61e+08 =C2=B1 15%    +220.0%   5.15e+08 =C2=B1 12%  latency_stats.hits.=
pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
   8087524 =C2=B1 14%     -68.8%    2525419 =C2=B1  7%  latency_stats.hits.=
pipe_wait.pipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastp=
ath
     66090 =C2=B1173%    +440.6%     357299 =C2=B1169%  latency_stats.max.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.exit_mmap.mmput.f=
lush_old_exec.load_elf_binary.search_binary_handler.do_execveat_common.SyS_=
execve.return_from_execve
    208312 =C2=B1173%     -86.7%      27797 =C2=B1 99%  latency_stats.max.c=
all_rwsem_down_write_failed.vma_adjust.__split_vma.split_vma.mprotect_fixup=
.SyS_mprotect.entry_SYSCALL_64_fastpath
      2617 =C2=B1  0%    +637.8%      19308 =C2=B1 80%  latency_stats.max.w=
alk_component.path_lookupat.filename_lookup.user_path_at_empty.vfs_fstatat.=
SYSC_newstat.SyS_newstat.entry_SYSCALL_64_fastpath
     66091 =C2=B1173%   +1857.8%    1293921 =C2=B1170%  latency_stats.sum.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.exit_mmap.mmput.f=
lush_old_exec.load_elf_binary.search_binary_handler.do_execveat_common.SyS_=
execve.return_from_execve
    208361 =C2=B1173%     -86.6%      27983 =C2=B1 98%  latency_stats.sum.c=
all_rwsem_down_write_failed.vma_adjust.__split_vma.split_vma.mprotect_fixup=
.SyS_mprotect.entry_SYSCALL_64_fastpath
   4377941 =C2=B1 10%     -75.8%    1059007 =C2=B1  9%  latency_stats.sum.d=
o_wait.SyS_wait4.entry_SYSCALL_64_fastpath
 3.039e+10 =C2=B1 14%    +209.0%  9.388e+10 =C2=B1  9%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
  5.46e+09 =C2=B1 13%     -70.2%  1.628e+09 =C2=B1  5%  latency_stats.sum.p=
ipe_wait.pipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpa=
th
      4379 =C2=B1  0%    +340.9%      19308 =C2=B1 80%  latency_stats.sum.w=
alk_component.path_lookupat.filename_lookup.user_path_at_empty.vfs_fstatat.=
SYSC_newstat.SyS_newstat.entry_SYSCALL_64_fastpath
      4.76 =C2=B1 20%    +150.9%      11.95 =C2=B1 25%  perf-profile.cycles=
-pp.__account_scheduler_latency.enqueue_entity.enqueue_task_fair.activate_t=
ask.ttwu_do_activate
     19.93 =C2=B1 26%      +3.7%      20.66 =C2=B1 -4%  perf-profile.cycles=
-pp.__read_nocancel
      2.69 =C2=B1 17%    +338.6%      11.79 =C2=B1 22%  perf-profile.cycles=
-pp.__schedule.schedule.pipe_wait.pipe_read.__vfs_read
      8.59 =C2=B1 35%    +180.4%      24.07 =C2=B1 23%  perf-profile.cycles=
-pp.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
      9.67 =C2=B1 26%     +16.0%      11.21 =C2=B1 -8%  perf-profile.cycles=
-pp.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath.__read_nocancel
     16.29 =C2=B1 33%    +148.3%      40.44 =C2=B1 17%  perf-profile.cycles=
-pp.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      8.40 =C2=B1 17%    +215.1%      26.48 =C2=B1 21%  perf-profile.cycles=
-pp.__wake_up_common.__wake_up_sync_key.pipe_write.__vfs_write.vfs_write
     10.76 =C2=B1 15%    +170.4%      29.09 =C2=B1 17%  perf-profile.cycles=
-pp.__wake_up_sync_key.pipe_write.__vfs_write.vfs_write.sys_write
     22.84 =C2=B1 26%     +14.9%      26.24 =C2=B1 -3%  perf-profile.cycles=
-pp.__write_nocancel
      1.05 =C2=B1 30%    +416.9%       5.44 =C2=B1 29%  perf-profile.cycles=
-pp._raw_spin_lock_irq.__schedule.schedule.pipe_wait.pipe_read
      6.03 =C2=B1 18%    +172.1%      16.39 =C2=B1 21%  perf-profile.cycles=
-pp.activate_task.ttwu_do_activate.try_to_wake_up.default_wake_function.aut=
oremove_wake_function
      0.98 =C2=B1 24%     -18.6%       0.80 =C2=B1-125%  perf-profile.cycle=
s-pp.atime_needs_update.touch_atime.pipe_read.__vfs_read.vfs_read
      8.10 =C2=B1 18%    +221.3%      26.02 =C2=B1 21%  perf-profile.cycles=
-pp.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.pipe_write=
.__vfs_write
      2.08 =C2=B1 27%     -23.4%       1.59 =C2=B1-62%  perf-profile.cycles=
-pp.avc_has_perm.inode_has_perm.file_has_perm.selinux_file_permission.secur=
ity_file_permission
      3.16 =C2=B1 23%     -72.5%       0.87 =C2=B1134%  perf-profile.cycles=
-pp.copy_page_from_iter.pipe_write.__vfs_write.vfs_write.sys_write
      1.18 =C2=B1 25%     -54.2%       0.54 =C2=B1 98%  perf-profile.cycles=
-pp.copy_page_from_iter_iovec.copy_page_from_iter.pipe_write.__vfs_write.vf=
s_write
      3.99 =C2=B1 21%     -66.9%       1.32 =C2=B1 95%  perf-profile.cycles=
-pp.copy_page_to_iter.pipe_read.__vfs_read.vfs_read.sys_read
      1.39 =C2=B1 24%     -76.0%       0.33 =C2=B1168%  perf-profile.cycles=
-pp.copy_page_to_iter_iovec.copy_page_to_iter.pipe_read.__vfs_read.vfs_read
      1.80 =C2=B1 25%     -75.3%       0.45 =C2=B1165%  perf-profile.cycles=
-pp.copy_user_generic_string.copy_page_from_iter.pipe_write.__vfs_write.vfs=
_write
      2.29 =C2=B1 25%     -75.6%       0.56 =C2=B1154%  perf-profile.cycles=
-pp.copy_user_generic_string.copy_page_to_iter.pipe_read.__vfs_read.vfs_read
      0.79 =C2=B1 19%     -74.9%       0.20 =C2=B1138%  perf-profile.cycles=
-pp.cpu_startup_entry.start_secondary
      8.08 =C2=B1 18%    +221.0%      25.95 =C2=B1 21%  perf-profile.cycles=
-pp.default_wake_function.autoremove_wake_function.__wake_up_common.__wake_=
up_sync_key.pipe_write
      4.43 =C2=B1 20%    +151.1%      11.12 =C2=B1 26%  perf-profile.cycles=
-pp.dump_trace.save_stack_trace_tsk.__account_scheduler_latency.enqueue_ent=
ity.enqueue_task_fair
      5.54 =C2=B1 18%    +165.8%      14.74 =C2=B1 22%  perf-profile.cycles=
-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_=
wake_up
      5.85 =C2=B1 18%    +172.9%      15.97 =C2=B1 21%  perf-profile.cycles=
-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.default=
_wake_function
     18.31 =C2=B1 26%      +3.7%      18.99 =C2=B1 -5%  perf-profile.cycles=
-pp.entry_SYSCALL_64_fastpath.__read_nocancel
     21.32 =C2=B1 26%     +14.7%      24.45 =C2=B1 -4%  perf-profile.cycles=
-pp.entry_SYSCALL_64_fastpath.__write_nocancel
      1.49 =C2=B1 27%     -78.7%       0.32 =C2=B1164%  perf-profile.cycles=
-pp.file_has_perm.selinux_file_permission.security_file_permission.rw_verif=
y_area.vfs_read
      1.50 =C2=B1 27%     -57.1%       0.65 =C2=B1 93%  perf-profile.cycles=
-pp.file_has_perm.selinux_file_permission.security_file_permission.rw_verif=
y_area.vfs_write
      0.98 =C2=B1 26%      -5.6%       0.93 =C2=B1-107%  perf-profile.cycle=
s-pp.file_update_time.pipe_write.__vfs_write.vfs_write.sys_write
      2.32 =C2=B1 27%     -60.4%       0.92 =C2=B1 98%  perf-profile.cycles=
-pp.inode_has_perm.isra.28.file_has_perm.selinux_file_permission.security_f=
ile_permission.rw_verify_area
      0.88 =C2=B1 28%      -7.4%       0.81 =C2=B1-123%  perf-profile.cycle=
s-pp.mutex_lock.pipe_read.__vfs_read.vfs_read.sys_read
      1.06 =C2=B1 26%     -70.7%       0.31 =C2=B1160%  perf-profile.cycles=
-pp.mutex_lock.pipe_write.__vfs_write.vfs_write.sys_write
      0.65 =C2=B1 39%    +467.0%       3.70 =C2=B1 61%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock.try_to_wake_up.default_=
wake_function.autoremove_wake_function
      1.02 =C2=B1 28%    +417.1%       5.30 =C2=B1 29%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__schedule.schedule=
.pipe_wait
      0.14 =C2=B1 37%    +285.7%       0.54 =C2=B1 55%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__schedule.schedule=
.prepare_exit_to_usermode
     15.49 =C2=B1  2%     +59.2%      24.67 =C2=B1  5%  perf-profile.cycles=
-pp.pipe_read.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
      3.00 =C2=B1 18%    +332.1%      12.95 =C2=B1 23%  perf-profile.cycles=
-pp.pipe_wait.pipe_read.__vfs_read.vfs_read.sys_read
     25.53 =C2=B1  6%     +64.1%      41.90 =C2=B1  3%  perf-profile.cycles=
-pp.pipe_write.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      4.00 =C2=B1 20%    +142.4%       9.70 =C2=B1 28%  perf-profile.cycles=
-pp.print_context_stack.dump_trace.save_stack_trace_tsk.__account_scheduler=
_latency.enqueue_entity
      4.40 =C2=B1 27%     -12.4%       3.85 =C2=B1-25%  perf-profile.cycles=
-pp.rw_verify_area.vfs_read.sys_read.entry_SYSCALL_64_fastpath.__read_nocan=
cel
      3.68 =C2=B1 27%     -10.2%       3.31 =C2=B1-30%  perf-profile.cycles=
-pp.rw_verify_area.vfs_write.sys_write.entry_SYSCALL_64_fastpath.__write_no=
cancel
      4.45 =C2=B1 20%    +151.2%      11.18 =C2=B1 26%  perf-profile.cycles=
-pp.save_stack_trace_tsk.__account_scheduler_latency.enqueue_entity.enqueue=
_task_fair.activate_task
      2.69 =C2=B1 18%    +345.9%      11.99 =C2=B1 23%  perf-profile.cycles=
-pp.schedule.pipe_wait.pipe_read.__vfs_read.vfs_read
      4.14 =C2=B1 23%     -69.5%       1.26 =C2=B1 99%  perf-profile.cycles=
-pp.security_file_permission.rw_verify_area.vfs_read.sys_read.entry_SYSCALL=
_64_fastpath
      3.39 =C2=B1 24%     -73.3%       0.91 =C2=B1131%  perf-profile.cycles=
-pp.security_file_permission.rw_verify_area.vfs_write.sys_write.entry_SYSCA=
LL_64_fastpath
      2.52 =C2=B1 27%     -74.8%       0.64 =C2=B1137%  perf-profile.cycles=
-pp.selinux_file_permission.security_file_permission.rw_verify_area.vfs_rea=
d.sys_read
      2.67 =C2=B1 26%     -75.7%       0.65 =C2=B1150%  perf-profile.cycles=
-pp.selinux_file_permission.security_file_permission.rw_verify_area.vfs_wri=
te.sys_write
      0.79 =C2=B1 19%     -75.0%       0.20 =C2=B1138%  perf-profile.cycles=
-pp.start_secondary
     17.13 =C2=B1 26%      +4.6%      17.91 =C2=B1 -5%  perf-profile.cycles=
-pp.sys_read.entry_SYSCALL_64_fastpath.__read_nocancel
     27.27 =C2=B1 33%     +76.9%      48.25 =C2=B1 22%  perf-profile.cycles=
-pp.sys_write.entry_SYSCALL_64_fastpath
     20.17 =C2=B1 26%     +16.1%      23.43 =C2=B1 -4%  perf-profile.cycles=
-pp.sys_write.entry_SYSCALL_64_fastpath.__write_nocancel
      1.27 =C2=B1 24%     -77.0%       0.29 =C2=B1163%  perf-profile.cycles=
-pp.touch_atime.pipe_read.__vfs_read.vfs_read.sys_read
      8.42 =C2=B1 18%    +207.7%      25.91 =C2=B1 21%  perf-profile.cycles=
-pp.try_to_wake_up.default_wake_function.autoremove_wake_function.__wake_up=
_common.__wake_up_sync_key
      6.32 =C2=B1 18%    +171.5%      17.14 =C2=B1 21%  perf-profile.cycles=
-pp.ttwu_do_activate.constprop.85.try_to_wake_up.default_wake_function.auto=
remove_wake_function.__wake_up_common
     16.65 =C2=B1 36%     +88.6%      31.40 =C2=B1 29%  perf-profile.cycles=
-pp.vfs_read.sys_read.entry_SYSCALL_64_fastpath
     15.66 =C2=B1 26%      +5.7%      16.55 =C2=B1 -6%  perf-profile.cycles=
-pp.vfs_read.sys_read.entry_SYSCALL_64_fastpath.__read_nocancel
     24.92 =C2=B1 35%     +87.1%      46.62 =C2=B1 21%  perf-profile.cycles=
-pp.vfs_write.sys_write.entry_SYSCALL_64_fastpath
     18.65 =C2=B1 26%     +17.5%      21.91 =C2=B1 -4%  perf-profile.cycles=
-pp.vfs_write.sys_write.entry_SYSCALL_64_fastpath.__write_nocancel
   4675065 =C2=B1 10%     +67.6%    7833279 =C2=B1 14%  sched_debug.cfs_rq[=
0]:/.min_vruntime
      1619 =C2=B1 11%     -22.2%       1260 =C2=B1 11%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
     59.25 =C2=B1 26%     +88.2%     111.50 =C2=B1 34%  sched_debug.cfs_rq[=
10]:/.load
   5497564 =C2=B1 15%     +53.5%    8436116 =C2=B1 21%  sched_debug.cfs_rq[=
10]:/.min_vruntime
   4291983 =C2=B1 10%     +59.8%    6856517 =C2=B1 16%  sched_debug.cfs_rq[=
11]:/.min_vruntime
   -392469 =C2=B1-20%    +167.7%   -1050587 =C2=B1-53%  sched_debug.cfs_rq[=
11]:/.spread0
   5057030 =C2=B1 16%     +40.6%    7109313 =C2=B1 15%  sched_debug.cfs_rq[=
1]:/.min_vruntime
      1542 =C2=B1  8%     -17.5%       1272 =C2=B1 10%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
   5441336 =C2=B1 11%     +42.3%    7741417 =C2=B1 26%  sched_debug.cfs_rq[=
2]:/.min_vruntime
      1518 =C2=B1  7%     -17.2%       1257 =C2=B1  9%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
   4740752 =C2=B1  6%     +76.2%    8355438 =C2=B1 22%  sched_debug.cfs_rq[=
3]:/.min_vruntime
     58.00 =C2=B1 13%     +21.1%      70.25 =C2=B1  6%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
      1494 =C2=B1  9%     -16.3%       1250 =C2=B1 10%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
   5082181 =C2=B1 13%     +56.0%    7929921 =C2=B1 22%  sched_debug.cfs_rq[=
4]:/.min_vruntime
      1474 =C2=B1  8%     -14.8%       1256 =C2=B1  9%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
   4100903 =C2=B1 11%     +57.9%    6473827 =C2=B1 16%  sched_debug.cfs_rq[=
5]:/.min_vruntime
   -578478 =C2=B1 -8%    +142.6%   -1403287 =C2=B1-28%  sched_debug.cfs_rq[=
5]:/.spread0
      1422 =C2=B1  8%     -12.1%       1250 =C2=B1  9%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
   5017377 =C2=B1 10%     +67.6%    8409972 =C2=B1 14%  sched_debug.cfs_rq[=
6]:/.min_vruntime
    335870 =C2=B1 19%     +56.5%     525673 =C2=B1 17%  sched_debug.cfs_rq[=
6]:/.spread0
   5485486 =C2=B1 15%     +35.8%    7448926 =C2=B1 12%  sched_debug.cfs_rq[=
7]:/.min_vruntime
    803062 =C2=B1 46%    -154.8%    -440070 =C2=B1-157%  sched_debug.cfs_rq=
[7]:/.spread0
   5081728 =C2=B1  6%     +75.7%    8928487 =C2=B1 22%  sched_debug.cfs_rq[=
9]:/.min_vruntime
    864030 =C2=B1 10%     -34.7%     564006 =C2=B1 15%  sched_debug.cpu#0.a=
vg_idle
     77.75 =C2=B1 16%     +43.7%     111.75 =C2=B1 16%  sched_debug.cpu#0.l=
oad
     31.00 =C2=B1 47%    +357.3%     141.75 =C2=B1 23%  sched_debug.cpu#0.n=
r_running
  11836165 =C2=B1 28%    +124.7%   26592746 =C2=B1 13%  sched_debug.cpu#0.n=
r_switches
  11932896 =C2=B1 28%    +123.7%   26689581 =C2=B1 13%  sched_debug.cpu#0.s=
ched_count
    100724 =C2=B1 52%     -70.6%      29596 =C2=B1  5%  sched_debug.cpu#0.s=
ched_goidle
   8618675 =C2=B1 21%    +134.6%   20218676 =C2=B1 16%  sched_debug.cpu#0.t=
twu_count
    849313 =C2=B1  7%     -27.3%     617355 =C2=B1 19%  sched_debug.cpu#1.a=
vg_idle
     16.25 =C2=B1 57%    +660.0%     123.50 =C2=B1 27%  sched_debug.cpu#1.n=
r_running
  10473305 =C2=B1 16%    +162.6%   27502509 =C2=B1 12%  sched_debug.cpu#1.n=
r_switches
     42.75 =C2=B1 62%    -112.3%      -5.25 =C2=B1-107%  sched_debug.cpu#1.=
nr_uninterruptible
  10473343 =C2=B1 16%    +162.6%   27502537 =C2=B1 12%  sched_debug.cpu#1.s=
ched_count
     74792 =C2=B1 23%     -50.6%      36968 =C2=B1 46%  sched_debug.cpu#1.s=
ched_goidle
   7675323 =C2=B1 10%    +188.8%   22163081 =C2=B1 16%  sched_debug.cpu#1.t=
twu_count
     63.25 =C2=B1 34%     +77.9%     112.50 =C2=B1 34%  sched_debug.cpu#10.=
load
      8.00 =C2=B1 39%    +703.1%      64.25 =C2=B1 22%  sched_debug.cpu#10.=
nr_running
  10891329 =C2=B1 17%    +162.7%   28610593 =C2=B1 17%  sched_debug.cpu#10.=
nr_switches
  10891376 =C2=B1 17%    +162.7%   28610623 =C2=B1 17%  sched_debug.cpu#10.=
sched_count
     81573 =C2=B1 47%     -70.7%      23924 =C2=B1 21%  sched_debug.cpu#10.=
sched_goidle
   8105340 =C2=B1 18%    +158.9%   20983711 =C2=B1 15%  sched_debug.cpu#10.=
ttwu_count
      9.50 =C2=B1 15%    +421.1%      49.50 =C2=B1 19%  sched_debug.cpu#11.=
nr_running
  10068993 =C2=B1 17%    +142.2%   24385810 =C2=B1 21%  sched_debug.cpu#11.=
nr_switches
  10069032 =C2=B1 17%    +142.2%   24385840 =C2=B1 21%  sched_debug.cpu#11.=
sched_count
   8730036 =C2=B1 16%    +172.1%   23753845 =C2=B1 15%  sched_debug.cpu#11.=
ttwu_count
     20.25 =C2=B1 50%    +414.8%     104.25 =C2=B1 26%  sched_debug.cpu#2.n=
r_running
  12541337 =C2=B1 18%    +108.2%   26114953 =C2=B1 20%  sched_debug.cpu#2.n=
r_switches
  12541390 =C2=B1 18%    +108.2%   26114983 =C2=B1 20%  sched_debug.cpu#2.s=
ched_count
    112741 =C2=B1 59%     -73.0%      30451 =C2=B1  6%  sched_debug.cpu#2.s=
ched_goidle
   8644640 =C2=B1 15%    +144.2%   21113672 =C2=B1 13%  sched_debug.cpu#2.t=
twu_count
   4439780 =C2=B1 39%     -46.3%    2384742 =C2=B1 17%  sched_debug.cpu#2.t=
twu_local
    851543 =C2=B1  7%     -34.4%     558588 =C2=B1 21%  sched_debug.cpu#3.a=
vg_idle
     19.00 =C2=B1100%    +367.1%      88.75 =C2=B1 21%  sched_debug.cpu#3.n=
r_running
  10126960 =C2=B1 11%    +187.2%   29088085 =C2=B1 24%  sched_debug.cpu#3.n=
r_switches
     63.50 =C2=B1 57%    -103.9%      -2.50 =C2=B1-44%  sched_debug.cpu#3.n=
r_uninterruptible
  10126996 =C2=B1 11%    +187.2%   29088117 =C2=B1 24%  sched_debug.cpu#3.s=
ched_count
     83456 =C2=B1 15%     -59.6%      33744 =C2=B1 33%  sched_debug.cpu#3.s=
ched_goidle
   7998666 =C2=B1 13%    +156.9%   20547508 =C2=B1 12%  sched_debug.cpu#3.t=
twu_count
     17.00 =C2=B1 68%    +514.7%     104.50 =C2=B1 20%  sched_debug.cpu#4.n=
r_running
  12100537 =C2=B1 31%    +137.1%   28686880 =C2=B1 15%  sched_debug.cpu#4.n=
r_switches
  12100580 =C2=B1 31%    +137.1%   28686907 =C2=B1 15%  sched_debug.cpu#4.s=
ched_count
     93180 =C2=B1 38%     -72.1%      25989 =C2=B1 14%  sched_debug.cpu#4.s=
ched_goidle
   8789152 =C2=B1 25%    +124.5%   19729121 =C2=B1 15%  sched_debug.cpu#4.t=
twu_count
     11.00 =C2=B1 29%    +663.6%      84.00 =C2=B1 21%  sched_debug.cpu#5.n=
r_running
  11572613 =C2=B1 32%    +117.7%   25196368 =C2=B1 22%  sched_debug.cpu#5.n=
r_switches
    102.25 =C2=B1 28%    -100.2%      -0.25 =C2=B1-2304%  sched_debug.cpu#5=
.nr_uninterruptible
  11572652 =C2=B1 32%    +117.7%   25196395 =C2=B1 22%  sched_debug.cpu#5.s=
ched_count
    103273 =C2=B1 53%     -73.0%      27895 =C2=B1  6%  sched_debug.cpu#5.s=
ched_goidle
   9031893 =C2=B1 26%    +152.0%   22760966 =C2=B1 13%  sched_debug.cpu#5.t=
twu_count
    888372 =C2=B1  6%     -27.7%     642576 =C2=B1  9%  sched_debug.cpu#6.a=
vg_idle
     15.75 =C2=B1 63%    +520.6%      97.75 =C2=B1 21%  sched_debug.cpu#6.n=
r_running
  10818260 =C2=B1 19%    +142.0%   26184340 =C2=B1 11%  sched_debug.cpu#6.n=
r_switches
    -44.75 =C2=B1-25%    -110.6%       4.75 =C2=B1 47%  sched_debug.cpu#6.n=
r_uninterruptible
  10818299 =C2=B1 19%    +142.0%   26184367 =C2=B1 11%  sched_debug.cpu#6.s=
ched_count
     80304 =C2=B1 57%     -66.0%      27307 =C2=B1 25%  sched_debug.cpu#6.s=
ched_goidle
   8181776 =C2=B1 15%    +163.7%   21575648 =C2=B1 18%  sched_debug.cpu#6.t=
twu_count
    848213 =C2=B1  9%     -18.6%     690536 =C2=B1 17%  sched_debug.cpu#7.a=
vg_idle
     13.75 =C2=B1 68%    +556.4%      90.25 =C2=B1 30%  sched_debug.cpu#7.n=
r_running
  10935164 =C2=B1 16%    +142.9%   26556814 =C2=B1 14%  sched_debug.cpu#7.n=
r_switches
   -117.50 =C2=B1-36%    -105.5%       6.50 =C2=B1 83%  sched_debug.cpu#7.n=
r_uninterruptible
  10935198 =C2=B1 16%    +142.9%   26556848 =C2=B1 14%  sched_debug.cpu#7.s=
ched_count
   7660938 =C2=B1 13%    +194.0%   22523956 =C2=B1 16%  sched_debug.cpu#7.t=
twu_count
    840855 =C2=B1  9%     -30.7%     582591 =C2=B1 28%  sched_debug.cpu#8.a=
vg_idle
     12.25 =C2=B1 22%    +575.5%      82.75 =C2=B1 29%  sched_debug.cpu#8.n=
r_running
  11334986 =C2=B1  8%    +132.8%   26385100 =C2=B1 19%  sched_debug.cpu#8.n=
r_switches
   -126.00 =C2=B1-23%    -101.2%       1.50 =C2=B1137%  sched_debug.cpu#8.n=
r_uninterruptible
  11335031 =C2=B1  8%    +132.8%   26385132 =C2=B1 19%  sched_debug.cpu#8.s=
ched_count
     67547 =C2=B1  7%     -61.8%      25796 =C2=B1  6%  sched_debug.cpu#8.s=
ched_goidle
   7950407 =C2=B1  7%    +175.9%   21932052 =C2=B1 13%  sched_debug.cpu#8.t=
twu_count
   3867102 =C2=B1  8%     -24.1%    2934707 =C2=B1 16%  sched_debug.cpu#8.t=
twu_local
    813902 =C2=B1  8%     -27.2%     592609 =C2=B1 20%  sched_debug.cpu#9.a=
vg_idle
      6.50 =C2=B1 35%    +876.9%      63.50 =C2=B1 20%  sched_debug.cpu#9.n=
r_running
  10297288 =C2=B1 10%    +177.4%   28563855 =C2=B1 20%  sched_debug.cpu#9.n=
r_switches
     40.50 =C2=B1126%     -90.7%       3.75 =C2=B1 76%  sched_debug.cpu#9.n=
r_uninterruptible
  10297326 =C2=B1 10%    +177.4%   28563889 =C2=B1 20%  sched_debug.cpu#9.s=
ched_count
   8214771 =C2=B1 14%    +161.3%   21461217 =C2=B1 13%  sched_debug.cpu#9.t=
twu_count
      0.00 =C2=B1 65%  +1.9e+05%       0.94 =C2=B1172%  sched_debug.rt_rq[9=
]:/.rt_time

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/nr_threads/mod=
e/ipc:
  wsm/hackbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performanc=
e/1600%/process/socket

commit: =

  1fda6948fbb2e756c8f7cabef40395cee2984298
  9b7aaf11b8d61eeb87f3b99fb5ae59e61bb35f27

1fda6948fbb2e756 9b7aaf11b8d61eeb87f3b99fb5 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     61865 =C2=B1  0%     -27.2%      45045 =C2=B1  0%  hackbench.throughput
  13303372 =C2=B1 10%    +308.5%   54345911 =C2=B1  7%  hackbench.time.invo=
luntary_context_switches
   7645296 =C2=B1  1%     -30.3%    5328849 =C2=B1 10%  hackbench.time.mino=
r_page_faults
    295.11 =C2=B1  1%     -10.3%     264.80 =C2=B1 10%  hackbench.time.user=
_time
  74147910 =C2=B1  1%    +208.4%  2.287e+08 =C2=B1  8%  hackbench.time.volu=
ntary_context_switches
      1.47 =C2=B1  2%     -28.4%       1.05 =C2=B1  2%  turbostat.CPU%c1
    771.00 =C2=B1  4%     +49.1%       1149 =C2=B1 11%  vmstat.procs.r
    152893 =C2=B1  2%    +207.3%     469896 =C2=B1  8%  vmstat.system.cs
     20470 =C2=B1  0%    +226.0%      66726 =C2=B1  7%  vmstat.system.in
     12228 =C2=B1  2%     -14.3%      10476 =C2=B1 11%  slabinfo.kmalloc-12=
8.active_objs
     12332 =C2=B1  2%     -12.9%      10740 =C2=B1 10%  slabinfo.kmalloc-12=
8.num_objs
    208.00 =C2=B1 13%     +61.5%     336.00 =C2=B1 15%  slabinfo.kmem_cache=
_node.active_objs
    208.00 =C2=B1 13%     +61.5%     336.00 =C2=B1 15%  slabinfo.kmem_cache=
_node.num_objs
    210.00 =C2=B1  1%     -30.5%     146.00 =C2=B1 10%  time.file_system_ou=
tputs
  13303372 =C2=B1 10%    +308.5%   54345911 =C2=B1  7%  time.involuntary_co=
ntext_switches
   7645296 =C2=B1  1%     -30.3%    5328849 =C2=B1 10%  time.minor_page_fau=
lts
  74147910 =C2=B1  1%    +208.4%  2.287e+08 =C2=B1  8%  time.voluntary_cont=
ext_switches
  47866591 =C2=B1  2%     -32.9%   32104345 =C2=B1  5%  cpuidle.C1-NHM.time
    881342 =C2=B1 13%     -53.0%     413811 =C2=B1  4%  cpuidle.C1-NHM.usage
  25892984 =C2=B1 13%     -30.9%   17890476 =C2=B1 16%  cpuidle.C1E-NHM.time
    113902 =C2=B1  5%     -40.9%      67319 =C2=B1  9%  cpuidle.C1E-NHM.usa=
ge
  11513219 =C2=B1 14%     -27.3%    8364874 =C2=B1  7%  cpuidle.C3-NHM.time
     27055 =C2=B1 12%     -40.4%      16112 =C2=B1 18%  cpuidle.C3-NHM.usage
      2660 =C2=B1 23%     -69.0%     825.00 =C2=B1 42%  cpuidle.POLL.usage
   8725926 =C2=B1  1%     -28.0%    6284093 =C2=B1  9%  proc-vmstat.numa_hit
   8725926 =C2=B1  1%     -28.0%    6284093 =C2=B1  9%  proc-vmstat.numa_lo=
cal
      4760 =C2=B1  0%      +7.0%       5092 =C2=B1  4%  proc-vmstat.pgactiv=
ate
   6785126 =C2=B1  1%     -26.6%    4980509 =C2=B1  9%  proc-vmstat.pgalloc=
_dma32
   5833593 =C2=B1  1%     -26.2%    4303142 =C2=B1  9%  proc-vmstat.pgalloc=
_normal
   7798582 =C2=B1  1%     -29.0%    5537265 =C2=B1  9%  proc-vmstat.pgfault
  12467424 =C2=B1  2%     -26.3%    9188443 =C2=B1  9%  proc-vmstat.pgfree
   7557548 =C2=B1141%    +447.5%   41374481 =C2=B1148%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
  20617833 =C2=B1  2%     -86.6%    2761701 =C2=B1 11%  latency_stats.hits.=
sock_alloc_send_pskb.unix_stream_sendmsg.sock_sendmsg.sock_write_iter.__vfs=
_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
  30957927 =C2=B1  4%    +537.4%  1.973e+08 =C2=B1  8%  latency_stats.hits.=
unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.__=
vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
      2.50 =C2=B1173%  +1.9e+06%      48667 =C2=B1163%  latency_stats.max.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.exit_mmap.mmput.f=
lush_old_exec.load_elf_binary.search_binary_handler.do_execveat_common.SyS_=
execve.return_from_execve
   8488903 =C2=B1141%    +400.3%   42473837 =C2=B1143%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      3.25 =C2=B1173%  +2.5e+06%      81849 =C2=B1167%  latency_stats.sum.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.exit_mmap.mmput.f=
lush_old_exec.load_elf_binary.search_binary_handler.do_execveat_common.SyS_=
execve.return_from_execve
  15102599 =C2=B1141%    +249.6%   52805181 =C2=B1113%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
   1911465 =C2=B1 11%    +241.9%    6534721 =C2=B1 15%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
 3.897e+10 =C2=B1  1%     -88.5%  4.487e+09 =C2=B1 11%  latency_stats.sum.s=
ock_alloc_send_pskb.unix_stream_sendmsg.sock_sendmsg.sock_write_iter.__vfs_=
write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
      7698 =C2=B1  8%  +4.3e+05%   32871122 =C2=B1173%  latency_stats.sum.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_write_and_wait_range.nfs4_f=
ile_fsync.[nfsv4].vfs_fsync_range.vfs_fsync.nfs4_file_flush.[nfsv4].filp_cl=
ose.do_dup2.SyS_dup2.entry_SYSCALL_64_fastpath
      0.12 =C2=B1 10%   +8010.4%       9.73 =C2=B1 61%  perf-profile.cycles=
-pp.__account_scheduler_latency.enqueue_entity.enqueue_task_fair.activate_t=
ask.ttwu_do_activate
      0.01 =C2=B1103%  +38140.0%       4.78 =C2=B1 66%  perf-profile.cycles=
-pp.__kernel_text_address.print_context_stack.dump_trace.save_stack_trace_t=
sk.__account_scheduler_latency
      0.01 =C2=B1 57%  +11900.0%       0.90 =C2=B1 81%  perf-profile.cycles=
-pp.__kmalloc_node_track_caller.__kmalloc_reserve.__alloc_skb.alloc_skb_wit=
h_frags.sock_alloc_send_pskb
      0.03 =C2=B1 64%   +3872.7%       1.09 =C2=B1 81%  perf-profile.cycles=
-pp.__kmalloc_reserve.isra.31.__alloc_skb.alloc_skb_with_frags.sock_alloc_s=
end_pskb.unix_stream_sendmsg
      0.00 =C2=B1 -1%      +Inf%       0.62 =C2=B1 89%  perf-profile.cycles=
-pp.__schedule.schedule.prepare_exit_to_usermode.syscall_return_slowpath.in=
t_ret_from_sys_call
      0.00 =C2=B1 -1%      +Inf%       6.31 =C2=B1 63%  perf-profile.cycles=
-pp.__schedule.schedule.schedule_timeout.unix_stream_read_generic.unix_stre=
am_recvmsg
     46.68 =C2=B1  0%     -54.0%      21.49 =C2=B1 65%  perf-profile.cycles=
-pp.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
      0.01 =C2=B1  0%  +1.9e+05%      18.93 =C2=B1 56%  perf-profile.cycles=
-pp.__wake_up_common.__wake_up_sync_key.sock_def_readable.unix_stream_sendm=
sg.sock_sendmsg
      0.01 =C2=B1  0%  +2.1e+05%      20.80 =C2=B1 48%  perf-profile.cycles=
-pp.__wake_up_sync_key.sock_def_readable.unix_stream_sendmsg.sock_sendmsg.s=
ock_write_iter
      0.00 =C2=B1 -1%      +Inf%       2.85 =C2=B1 71%  perf-profile.cycles=
-pp._raw_spin_lock.try_to_wake_up.default_wake_function.autoremove_wake_fun=
ction.__wake_up_common
      0.00 =C2=B1 -1%      +Inf%       2.94 =C2=B1 68%  perf-profile.cycles=
-pp._raw_spin_lock_irq.__schedule.schedule.schedule_timeout.unix_stream_rea=
d_generic
      0.00 =C2=B1 -1%      +Inf%       0.63 =C2=B1 78%  perf-profile.cycles=
-pp._raw_spin_lock_irqsave.__wake_up_sync_key.sock_def_readable.unix_stream=
_sendmsg.sock_sendmsg
      0.28 =C2=B1 12%   +4379.3%      12.43 =C2=B1 58%  perf-profile.cycles=
-pp.activate_task.ttwu_do_activate.try_to_wake_up.default_wake_function.aut=
oremove_wake_function
      0.01 =C2=B1  0%  +1.9e+05%      18.78 =C2=B1 56%  perf-profile.cycles=
-pp.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.sock_def_r=
eadable.unix_stream_sendmsg
     14.30 =C2=B1  2%     -47.3%       7.53 =C2=B1 39%  perf-profile.cycles=
-pp.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.s=
ock_read_iter
      0.01 =C2=B1  0%  +1.9e+05%      18.68 =C2=B1 56%  perf-profile.cycles=
-pp.default_wake_function.autoremove_wake_function.__wake_up_common.__wake_=
up_sync_key.sock_def_readable
      0.08 =C2=B1 23%  +11309.4%       9.13 =C2=B1 61%  perf-profile.cycles=
-pp.dump_trace.save_stack_trace_tsk.__account_scheduler_latency.enqueue_ent=
ity.enqueue_task_fair
      0.21 =C2=B1 10%   +5245.9%      11.36 =C2=B1 59%  perf-profile.cycles=
-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_=
wake_up
      0.24 =C2=B1 10%   +5022.1%      12.17 =C2=B1 58%  perf-profile.cycles=
-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.default=
_wake_function
      0.00 =C2=B1 -1%      +Inf%       0.66 =C2=B1 89%  perf-profile.cycles=
-pp.int_ret_from_sys_call
      0.00 =C2=B1 -1%      +Inf%       1.49 =C2=B1 66%  perf-profile.cycles=
-pp.is_module_text_address.__kernel_text_address.print_context_stack.dump_t=
race.save_stack_trace_tsk
      0.00 =C2=B1 -1%      +Inf%       3.03 =C2=B1 71%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock.try_to_wake_up.default_=
wake_function.autoremove_wake_function
      0.00 =C2=B1 -1%      +Inf%       0.57 =C2=B1 78%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__schedule.schedule=
.prepare_exit_to_usermode
      0.00 =C2=B1 -1%      +Inf%       2.91 =C2=B1 68%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__schedule.schedule=
.schedule_timeout
      0.00 =C2=B1 -1%      +Inf%       0.80 =C2=B1 53%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__wake_up_sync_=
key.sock_def_readable.unix_stream_sendmsg
      0.00 =C2=B1 -1%      +Inf%       0.61 =C2=B1 89%  perf-profile.cycles=
-pp.prepare_exit_to_usermode.syscall_return_slowpath.int_ret_from_sys_call
      0.06 =C2=B1 31%  +14226.1%       8.24 =C2=B1 62%  perf-profile.cycles=
-pp.print_context_stack.dump_trace.save_stack_trace_tsk.__account_scheduler=
_latency.enqueue_entity
      0.08 =C2=B1 23%  +11350.0%       9.16 =C2=B1 61%  perf-profile.cycles=
-pp.save_stack_trace_tsk.__account_scheduler_latency.enqueue_entity.enqueue=
_task_fair.activate_task
      0.00 =C2=B1 -1%      +Inf%       0.58 =C2=B1 90%  perf-profile.cycles=
-pp.schedule.prepare_exit_to_usermode.syscall_return_slowpath.int_ret_from_=
sys_call
      0.00 =C2=B1 -1%      +Inf%       6.34 =C2=B1 63%  perf-profile.cycles=
-pp.schedule.schedule_timeout.unix_stream_read_generic.unix_stream_recvmsg.=
sock_recvmsg
      0.00 =C2=B1 -1%      +Inf%       6.48 =C2=B1 63%  perf-profile.cycles=
-pp.schedule_timeout.unix_stream_read_generic.unix_stream_recvmsg.sock_recv=
msg.sock_read_iter
     11.76 =C2=B1  3%     -37.8%       7.32 =C2=B1 37%  perf-profile.cycles=
-pp.sock_alloc_send_pskb.unix_stream_sendmsg.sock_sendmsg.sock_write_iter._=
_vfs_write
      0.03 =C2=B1 44%  +86980.0%      21.77 =C2=B1 45%  perf-profile.cycles=
-pp.sock_def_readable.unix_stream_sendmsg.sock_sendmsg.sock_write_iter.__vf=
s_write
     45.88 =C2=B1  0%     -22.1%      35.72 =C2=B1 10%  perf-profile.cycles=
-pp.sock_read_iter.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
     44.91 =C2=B1  0%     -21.9%      35.06 =C2=B1 10%  perf-profile.cycles=
-pp.sock_recvmsg.sock_read_iter.__vfs_read.vfs_read.sys_read
     35.31 =C2=B1  0%     +20.9%      42.71 =C2=B1  8%  perf-profile.cycles=
-pp.sock_sendmsg.sock_write_iter.__vfs_write.vfs_write.sys_write
     35.96 =C2=B1  0%     +20.7%      43.40 =C2=B1  7%  perf-profile.cycles=
-pp.sock_write_iter.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpa=
th
     55.69 =C2=B1  0%     -55.7%      24.66 =C2=B1 66%  perf-profile.cycles=
-pp.sys_read.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%       0.63 =C2=B1 90%  perf-profile.cycles=
-pp.syscall_return_slowpath.int_ret_from_sys_call
      0.55 =C2=B1 17%   +3347.5%      18.88 =C2=B1 55%  perf-profile.cycles=
-pp.try_to_wake_up.default_wake_function.autoremove_wake_function.__wake_up=
_common.__wake_up_sync_key
      0.31 =C2=B1 15%   +4141.8%      12.94 =C2=B1 58%  perf-profile.cycles=
-pp.ttwu_do_activate.constprop.85.try_to_wake_up.default_wake_function.auto=
remove_wake_function.__wake_up_common
     41.78 =C2=B1  0%     -21.5%      32.80 =C2=B1 10%  perf-profile.cycles=
-pp.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_ite=
r.__vfs_read
     43.30 =C2=B1  0%     -21.8%      33.88 =C2=B1 10%  perf-profile.cycles=
-pp.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.__vfs_read.vfs_read
     33.20 =C2=B1  0%     +23.4%      40.96 =C2=B1  9%  perf-profile.cycles=
-pp.unix_stream_sendmsg.sock_sendmsg.sock_write_iter.__vfs_write.vfs_write
     54.04 =C2=B1  0%     -55.6%      23.97 =C2=B1 66%  perf-profile.cycles=
-pp.vfs_read.sys_read.entry_SYSCALL_64_fastpath
   3851227 =C2=B1  4%     +15.4%    4443109 =C2=B1  6%  sched_debug.cfs_rq[=
0]:/.min_vruntime
   3941688 =C2=B1  5%     +15.7%    4562136 =C2=B1  3%  sched_debug.cfs_rq[=
10]:/.min_vruntime
   3969451 =C2=B1  5%     +11.4%    4421502 =C2=B1  4%  sched_debug.cfs_rq[=
11]:/.min_vruntime
   3926203 =C2=B1  3%     +14.4%    4491088 =C2=B1  8%  sched_debug.cfs_rq[=
1]:/.min_vruntime
      1863 =C2=B1  7%     -21.6%       1460 =C2=B1 10%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
    189.00 =C2=B1  7%     -43.4%     107.00 =C2=B1 12%  sched_debug.cfs_rq[=
2]:/.load_avg
   3953398 =C2=B1  5%     +15.2%    4552813 =C2=B1 10%  sched_debug.cfs_rq[=
2]:/.min_vruntime
     97.25 =C2=B1 12%     -27.8%      70.25 =C2=B1  9%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
      1981 =C2=B1  8%     -24.1%       1503 =C2=B1 10%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
    180.50 =C2=B1 12%     -40.3%     107.75 =C2=B1 11%  sched_debug.cfs_rq[=
2]:/.tg_load_avg_contrib
      1015 =C2=B1  3%     -14.8%     865.25 =C2=B1  9%  sched_debug.cfs_rq[=
2]:/.util_avg
      2001 =C2=B1  6%     -23.7%       1527 =C2=B1 13%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
    184.75 =C2=B1  4%     -35.2%     119.75 =C2=B1 18%  sched_debug.cfs_rq[=
4]:/.load_avg
   3929671 =C2=B1  6%     +11.7%    4388297 =C2=B1  4%  sched_debug.cfs_rq[=
4]:/.min_vruntime
      2034 =C2=B1  7%     -24.5%       1536 =C2=B1 11%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
    174.25 =C2=B1  9%     -31.3%     119.75 =C2=B1 18%  sched_debug.cfs_rq[=
4]:/.tg_load_avg_contrib
    195.00 =C2=B1 25%     -36.5%     123.75 =C2=B1 11%  sched_debug.cfs_rq[=
5]:/.load_avg
      2027 =C2=B1  6%     -23.5%       1550 =C2=B1 10%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
    188.75 =C2=B1 25%     -34.4%     123.75 =C2=B1 11%  sched_debug.cfs_rq[=
5]:/.tg_load_avg_contrib
    167.25 =C2=B1  1%     -25.6%     124.50 =C2=B1 17%  sched_debug.cfs_rq[=
6]:/.load_avg
   3925342 =C2=B1  4%     +17.3%    4603806 =C2=B1  6%  sched_debug.cfs_rq[=
6]:/.min_vruntime
     95.00 =C2=B1  6%     -25.8%      70.50 =C2=B1 18%  sched_debug.cfs_rq[=
6]:/.runnable_load_avg
      2002 =C2=B1  6%     -20.2%       1597 =C2=B1 10%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
    161.50 =C2=B1  2%     -22.9%     124.50 =C2=B1 17%  sched_debug.cfs_rq[=
6]:/.tg_load_avg_contrib
    146.50 =C2=B1 10%     -20.8%     116.00 =C2=B1 10%  sched_debug.cfs_rq[=
7]:/.load_avg
   4006338 =C2=B1  4%     +18.1%    4732367 =C2=B1  9%  sched_debug.cfs_rq[=
7]:/.min_vruntime
     79.00 =C2=B1  8%     -16.8%      65.75 =C2=B1  5%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
      1980 =C2=B1  5%     -18.4%       1616 =C2=B1 11%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
    143.75 =C2=B1  9%     -18.8%     116.75 =C2=B1 10%  sched_debug.cfs_rq[=
7]:/.tg_load_avg_contrib
      0.00 =C2=B1  0%    +2e+13%     200550 =C2=B1101%  sched_debug.cfs_rq[=
8]:/.MIN_vruntime
      0.00 =C2=B1  0%    +2e+13%     200550 =C2=B1101%  sched_debug.cfs_rq[=
8]:/.max_vruntime
   3977925 =C2=B1  5%     +17.4%    4670793 =C2=B1 10%  sched_debug.cfs_rq[=
8]:/.min_vruntime
      1981 =C2=B1  5%     -16.1%       1663 =C2=B1 10%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
      1971 =C2=B1  4%     -14.6%       1682 =C2=B1  9%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
     30.00 =C2=B1  7%     +55.0%      46.50 =C2=B1  6%  sched_debug.cpu#0.n=
r_running
   3254240 =C2=B1  5%    +240.2%   11071073 =C2=B1  7%  sched_debug.cpu#0.n=
r_switches
   3351054 =C2=B1  5%    +233.3%   11167494 =C2=B1  7%  sched_debug.cpu#0.s=
ched_count
     34300 =C2=B1 21%     -39.6%      20708 =C2=B1 20%  sched_debug.cpu#0.s=
ched_goidle
   2866474 =C2=B1  4%    +240.3%    9754459 =C2=B1  2%  sched_debug.cpu#0.t=
twu_count
   2546182 =C2=B1  4%     -41.6%    1486788 =C2=B1  5%  sched_debug.cpu#0.t=
twu_local
    697842 =C2=B1  5%     -18.6%     568211 =C2=B1 15%  sched_debug.cpu#1.a=
vg_idle
     24.50 =C2=B1 16%     +44.9%      35.50 =C2=B1 11%  sched_debug.cpu#1.n=
r_running
   4994889 =C2=B1 59%    +188.3%   14400709 =C2=B1 18%  sched_debug.cpu#1.n=
r_switches
   4994904 =C2=B1 59%    +188.3%   14400741 =C2=B1 18%  sched_debug.cpu#1.s=
ched_count
   3811656 =C2=B1 40%    +179.5%   10654366 =C2=B1 10%  sched_debug.cpu#1.t=
twu_count
     82.50 =C2=B1  8%     -11.8%      72.75 =C2=B1  8%  sched_debug.cpu#10.=
cpu_load[2]
     82.50 =C2=B1  8%     -12.1%      72.50 =C2=B1  9%  sched_debug.cpu#10.=
cpu_load[3]
   3389364 =C2=B1  4%    +260.7%   12226143 =C2=B1 11%  sched_debug.cpu#10.=
nr_switches
   3389386 =C2=B1  4%    +260.7%   12226174 =C2=B1 11%  sched_debug.cpu#10.=
sched_count
   2932787 =C2=B1  3%    +238.6%    9929944 =C2=B1  4%  sched_debug.cpu#10.=
ttwu_count
    100.25 =C2=B1 29%     -35.2%      65.00 =C2=B1  7%  sched_debug.cpu#11.=
load
   3763818 =C2=B1 20%    +212.3%   11753872 =C2=B1  3%  sched_debug.cpu#11.=
nr_switches
   3763834 =C2=B1 20%    +212.3%   11753899 =C2=B1  3%  sched_debug.cpu#11.=
sched_count
     32782 =C2=B1 17%     -48.2%      16996 =C2=B1  5%  sched_debug.cpu#11.=
sched_goidle
   3141135 =C2=B1 12%    +223.8%   10171787 =C2=B1  6%  sched_debug.cpu#11.=
ttwu_count
   2802165 =C2=B1 11%     -34.5%    1835136 =C2=B1 14%  sched_debug.cpu#11.=
ttwu_local
     94.50 =C2=B1 12%     -27.0%      69.00 =C2=B1  6%  sched_debug.cpu#2.c=
pu_load[0]
     95.75 =C2=B1 12%     -28.2%      68.75 =C2=B1  7%  sched_debug.cpu#2.c=
pu_load[1]
     96.25 =C2=B1 12%     -28.8%      68.50 =C2=B1  7%  sched_debug.cpu#2.c=
pu_load[2]
     95.75 =C2=B1 11%     -28.7%      68.25 =C2=B1  8%  sched_debug.cpu#2.c=
pu_load[3]
     93.50 =C2=B1 10%     -27.0%      68.25 =C2=B1  8%  sched_debug.cpu#2.c=
pu_load[4]
     17.00 =C2=B1 29%    +101.5%      34.25 =C2=B1 13%  sched_debug.cpu#2.n=
r_running
   6789528 =C2=B1 54%     +82.2%   12370279 =C2=B1  8%  sched_debug.cpu#2.n=
r_switches
   6789547 =C2=B1 54%     +82.2%   12370304 =C2=B1  8%  sched_debug.cpu#2.s=
ched_count
     67044 =C2=B1 50%     -73.9%      17526 =C2=B1 18%  sched_debug.cpu#2.s=
ched_goidle
   4696974 =C2=B1 42%     +98.6%    9327473 =C2=B1  1%  sched_debug.cpu#2.t=
twu_count
   4325255 =C2=B1 44%     -66.5%    1449741 =C2=B1  3%  sched_debug.cpu#2.t=
twu_local
    716240 =C2=B1 14%     -25.5%     533320 =C2=B1 26%  sched_debug.cpu#3.a=
vg_idle
   3313498 =C2=B1  3%    +277.7%   12515262 =C2=B1  2%  sched_debug.cpu#3.n=
r_switches
   3313518 =C2=B1  3%    +277.7%   12515289 =C2=B1  2%  sched_debug.cpu#3.s=
ched_count
     37743 =C2=B1 12%     -57.5%      16029 =C2=B1 13%  sched_debug.cpu#3.s=
ched_goidle
   2870327 =C2=B1  4%    +231.2%    9507577 =C2=B1  5%  sched_debug.cpu#3.t=
twu_count
   2550329 =C2=B1  4%     -39.7%    1537542 =C2=B1  2%  sched_debug.cpu#3.t=
twu_local
     17.00 =C2=B1 26%     +57.4%      26.75 =C2=B1 23%  sched_debug.cpu#4.n=
r_running
   3253231 =C2=B1  4%    +298.0%   12948659 =C2=B1 20%  sched_debug.cpu#4.n=
r_switches
   3253252 =C2=B1  4%    +298.0%   12948687 =C2=B1 20%  sched_debug.cpu#4.s=
ched_count
   2935924 =C2=B1  4%    +246.0%   10157457 =C2=B1  6%  sched_debug.cpu#4.t=
twu_count
   4840472 =C2=B1 57%    +161.6%   12660891 =C2=B1 16%  sched_debug.cpu#5.n=
r_switches
   4840492 =C2=B1 57%    +161.6%   12660919 =C2=B1 16%  sched_debug.cpu#5.s=
ched_count
   3697043 =C2=B1 37%    +188.3%   10657760 =C2=B1  8%  sched_debug.cpu#5.t=
twu_count
     93.00 =C2=B1  9%     -23.7%      71.00 =C2=B1 16%  sched_debug.cpu#6.c=
pu_load[2]
     93.75 =C2=B1  9%     -24.5%      70.75 =C2=B1 16%  sched_debug.cpu#6.c=
pu_load[3]
     93.75 =C2=B1  8%     -24.5%      70.75 =C2=B1 16%  sched_debug.cpu#6.c=
pu_load[4]
   3206562 =C2=B1  5%    +246.8%   11120071 =C2=B1  9%  sched_debug.cpu#6.n=
r_switches
   3206583 =C2=B1  5%    +246.8%   11120099 =C2=B1  9%  sched_debug.cpu#6.s=
ched_count
     28907 =C2=B1 19%     -49.1%      14708 =C2=B1 29%  sched_debug.cpu#6.s=
ched_goidle
   2874452 =C2=B1  3%    +241.7%    9820603 =C2=B1  2%  sched_debug.cpu#6.t=
twu_count
   2556360 =C2=B1  4%     -39.6%    1544429 =C2=B1  1%  sched_debug.cpu#6.t=
twu_local
     79.25 =C2=B1  8%     -17.4%      65.50 =C2=B1  5%  sched_debug.cpu#7.c=
pu_load[0]
     79.00 =C2=B1  8%     -16.8%      65.75 =C2=B1  5%  sched_debug.cpu#7.c=
pu_load[1]
     79.00 =C2=B1  9%     -16.5%      66.00 =C2=B1  4%  sched_debug.cpu#7.c=
pu_load[2]
     79.00 =C2=B1  8%     -16.1%      66.25 =C2=B1  4%  sched_debug.cpu#7.c=
pu_load[3]
     78.75 =C2=B1  7%     -15.6%      66.50 =C2=B1  4%  sched_debug.cpu#7.c=
pu_load[4]
   3665057 =C2=B1 16%    +252.6%   12923128 =C2=B1 15%  sched_debug.cpu#7.n=
r_switches
   3665077 =C2=B1 16%    +252.6%   12923157 =C2=B1 15%  sched_debug.cpu#7.s=
ched_count
   3051381 =C2=B1  9%    +230.3%   10079599 =C2=B1  6%  sched_debug.cpu#7.t=
twu_count
   3852209 =C2=B1 15%    +220.3%   12339721 =C2=B1  5%  sched_debug.cpu#8.n=
r_switches
     -6.25 =C2=B1-44%    -124.0%       1.50 =C2=B1152%  sched_debug.cpu#8.n=
r_uninterruptible
   3852229 =C2=B1 15%    +220.3%   12339747 =C2=B1  5%  sched_debug.cpu#8.s=
ched_count
     69242 =C2=B1 63%     -82.2%      12336 =C2=B1 16%  sched_debug.cpu#8.s=
ched_goidle
   3226535 =C2=B1 10%    +198.3%    9623833 =C2=B1  1%  sched_debug.cpu#8.t=
twu_count
   2836002 =C2=B1 10%     -42.6%    1627278 =C2=B1  5%  sched_debug.cpu#8.t=
twu_local
   3409492 =C2=B1  5%    +269.5%   12599488 =C2=B1  2%  sched_debug.cpu#9.n=
r_switches
     -3.75 =C2=B1-189%    -253.3%       5.75 =C2=B1 18%  sched_debug.cpu#9.=
nr_uninterruptible
   3409515 =C2=B1  5%    +269.5%   12599511 =C2=B1  2%  sched_debug.cpu#9.s=
ched_count
     27958 =C2=B1 16%     -52.1%      13392 =C2=B1 14%  sched_debug.cpu#9.s=
ched_goidle
   2904962 =C2=B1  4%    +229.1%    9559191 =C2=B1  5%  sched_debug.cpu#9.t=
twu_count
   2600209 =C2=B1  4%     -38.9%    1589299 =C2=B1  1%  sched_debug.cpu#9.t=
twu_local
      2.02 =C2=B1101%    -100.0%       0.00 =C2=B1  1%  sched_debug.rt_rq[8=
]:/.rt_time

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/nr_threads/mod=
e/ipc:
  xps2/hackbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performan=
ce/1600%/threads/socket

commit: =

  1fda6948fbb2e756c8f7cabef40395cee2984298
  9b7aaf11b8d61eeb87f3b99fb5ae59e61bb35f27

1fda6948fbb2e756 9b7aaf11b8d61eeb87f3b99fb5 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     36995 =C2=B1  0%     -34.0%      24408 =C2=B1  3%  hackbench.throughput
    608.69 =C2=B1  0%      +2.9%     626.30 =C2=B1  0%  hackbench.time.elap=
sed_time
    608.69 =C2=B1  0%      +2.9%     626.30 =C2=B1  0%  hackbench.time.elap=
sed_time.max
   9328243 =C2=B1  3%    +505.8%   56514733 =C2=B1  5%  hackbench.time.invo=
luntary_context_switches
    246449 =C2=B1 11%     -27.8%     178028 =C2=B1  2%  hackbench.time.mino=
r_page_faults
      4329 =C2=B1 11%     +11.0%       4804 =C2=B1  0%  hackbench.time.syst=
em_time
    205.68 =C2=B1 11%     -20.9%     162.64 =C2=B1  1%  hackbench.time.user=
_time
  45062029 =C2=B1 10%    +344.3%  2.002e+08 =C2=B1  4%  hackbench.time.volu=
ntary_context_switches
    351511 =C2=B1  9%     +26.6%     444910 =C2=B1  1%  softirqs.RCU
     40853 =C2=B1 30%     +50.5%      61488 =C2=B1  3%  slabinfo.kmalloc-25=
6.active_objs
     36884 =C2=B1 30%     +53.3%      56555 =C2=B1  3%  slabinfo.kmalloc-51=
2.active_objs
   1247088 =C2=B1  7%     -16.1%    1046673 =C2=B1  2%  proc-vmstat.numa_hit
   1247088 =C2=B1  7%     -16.1%    1046673 =C2=B1  2%  proc-vmstat.numa_lo=
cal
    426221 =C2=B1  5%     -15.4%     360479 =C2=B1  1%  proc-vmstat.pgfault
      0.41 =C2=B1 26%     -45.1%       0.22 =C2=B1  3%  turbostat.CPU%c1
      0.12 =C2=B1 94%     -72.3%       0.03 =C2=B1 13%  turbostat.CPU%c3
      5.93 =C2=B1166%     -96.8%       0.19 =C2=B1  2%  turbostat.CPU%c6
    539.75 =C2=B1 14%     +85.8%       1003 =C2=B1  4%  vmstat.procs.r
     96329 =C2=B1  8%    +330.7%     414895 =C2=B1  4%  vmstat.system.cs
     13860 =C2=B1  6%    +334.3%      60194 =C2=B1  5%  vmstat.system.in
    180.00 =C2=B1 11%     -27.8%     130.00 =C2=B1  2%  time.file_system_ou=
tputs
   9328243 =C2=B1  3%    +505.8%   56514733 =C2=B1  5%  time.involuntary_co=
ntext_switches
    246449 =C2=B1 11%     -27.8%     178028 =C2=B1  2%  time.minor_page_fau=
lts
    205.68 =C2=B1 11%     -20.9%     162.64 =C2=B1  1%  time.user_time
  45062029 =C2=B1 10%    +344.3%  2.002e+08 =C2=B1  4%  time.voluntary_cont=
ext_switches
   9143136 =C2=B1  5%     -36.8%    5777705 =C2=B1  3%  cpuidle.C1-NHM.time
    488261 =C2=B1  5%     -40.5%     290378 =C2=B1  5%  cpuidle.C1-NHM.usage
   1089103 =C2=B1  9%     -55.2%     488110 =C2=B1 11%  cpuidle.C1E-NHM.time
     17092 =C2=B1  2%     -60.6%       6727 =C2=B1 16%  cpuidle.C1E-NHM.usa=
ge
   4120777 =C2=B1 69%     -59.8%    1658190 =C2=B1  8%  cpuidle.C3-NHM.time
      4586 =C2=B1 35%     -40.5%       2727 =C2=B1  7%  cpuidle.C3-NHM.usage
     3e+08 =C2=B1162%     -95.0%   14960207 =C2=B1  1%  cpuidle.C6-NHM.time
     37433 =C2=B1139%     -85.9%       5273 =C2=B1  4%  cpuidle.C6-NHM.usage
      1643 =C2=B1 26%     -56.1%     722.00 =C2=B1 40%  cpuidle.POLL.usage
  11367875 =C2=B1 12%     -88.8%    1273092 =C2=B1  7%  latency_stats.hits.=
sock_alloc_send_pskb.unix_stream_sendmsg.sock_sendmsg.sock_write_iter.__vfs=
_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
  20123002 =C2=B1  8%    +784.6%   1.78e+08 =C2=B1  4%  latency_stats.hits.=
unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.__=
vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
     10424 =C2=B1 85%     -79.5%       2135 =C2=B1162%  latency_stats.max.c=
all_rwsem_down_read_failed.do_exit.SyS_exit.entry_SYSCALL_64_fastpath
  65139742 =C2=B1103%     -77.8%   14446152 =C2=B1141%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
    191484 =C2=B1 86%     -87.3%      24322 =C2=B1154%  latency_stats.sum.c=
all_rwsem_down_read_failed.do_exit.SyS_exit.entry_SYSCALL_64_fastpath
     35201 =C2=B1 61%     -88.3%       4134 =C2=B1 92%  latency_stats.sum.c=
all_rwsem_down_write_failed.vm_munmap.SyS_munmap.entry_SYSCALL_64_fastpath
  88590234 =C2=B1 77%     -81.9%   16038634 =C2=B1141%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
   1388432 =C2=B1 14%    +373.5%    6574540 =C2=B1  3%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
      3555 =C2=B1 61%    +411.7%      18195 =C2=B1 52%  latency_stats.sum.p=
ipe_wait.pipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpa=
th
     24976 =C2=B1 81%     -52.4%      11890 =C2=B1 24%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.link_path_walk
 2.198e+10 =C2=B1 11%     -90.3%  2.122e+09 =C2=B1  7%  latency_stats.sum.s=
ock_alloc_send_pskb.unix_stream_sendmsg.sock_sendmsg.sock_write_iter.__vfs_=
write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
  34821344 =C2=B1173%    -100.0%       5144 =C2=B1  4%  latency_stats.sum.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_write_and_wait_range.nfs4_f=
ile_fsync.[nfsv4].vfs_fsync_range.vfs_fsync.nfs4_file_flush.[nfsv4].filp_cl=
ose.do_dup2.SyS_dup2.entry_SYSCALL_64_fastpath
      5.50 =C2=B1  5%     -41.2%       3.23 =C2=B1 15%  perf-profile.cycles=
-pp.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendm=
sg.sock_sendmsg
      1.19 =C2=B1 14%     -95.0%       0.06 =C2=B1 45%  perf-profile.cycles=
-pp.__kmalloc_node_track_caller.__kmalloc_reserve.__alloc_skb.alloc_skb_wit=
h_frags.sock_alloc_send_pskb
      1.44 =C2=B1 13%     -92.0%       0.11 =C2=B1 39%  perf-profile.cycles=
-pp.__kmalloc_reserve.isra.31.__alloc_skb.alloc_skb_with_frags.sock_alloc_s=
end_pskb.unix_stream_sendmsg
      0.68 =C2=B1 32%    +442.6%       3.66 =C2=B1 37%  perf-profile.cycles=
-pp.__schedule.schedule.schedule_timeout.unix_stream_read_generic.unix_stre=
am_recvmsg
     41.20 =C2=B1  0%     -12.1%      36.21 =C2=B1  4%  perf-profile.cycles=
-pp.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
     32.61 =C2=B1  0%     +30.6%      42.61 =C2=B1  6%  perf-profile.cycles=
-pp.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      2.69 =C2=B1 13%    +323.5%      11.39 =C2=B1 36%  perf-profile.cycles=
-pp.__wake_up_common.__wake_up_sync_key.sock_def_readable.unix_stream_sendm=
sg.sock_sendmsg
      2.94 =C2=B1 14%    +410.9%      15.01 =C2=B1 32%  perf-profile.cycles=
-pp.__wake_up_sync_key.sock_def_readable.unix_stream_sendmsg.sock_sendmsg.s=
ock_write_iter
      0.29 =C2=B1 50%    +469.8%       1.65 =C2=B1 40%  perf-profile.cycles=
-pp._raw_spin_lock_irq.__schedule.schedule.schedule_timeout.unix_stream_rea=
d_generic
      0.15 =C2=B1 39%    +677.4%       1.20 =C2=B1 31%  perf-profile.cycles=
-pp._raw_spin_lock_irqsave.__wake_up_sync_key.sock_def_readable.unix_stream=
_sendmsg.sock_sendmsg
      2.26 =C2=B1 13%    +230.6%       7.47 =C2=B1 38%  perf-profile.cycles=
-pp.activate_task.ttwu_do_activate.try_to_wake_up.default_wake_function.aut=
oremove_wake_function
      6.58 =C2=B1  4%     -31.7%       4.50 =C2=B1 13%  perf-profile.cycles=
-pp.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_send=
msg.sock_write_iter
      2.66 =C2=B1 13%    +323.3%      11.25 =C2=B1 36%  perf-profile.cycles=
-pp.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.sock_def_r=
eadable.unix_stream_sendmsg
     10.73 =C2=B1  1%     -31.8%       7.32 =C2=B1 25%  perf-profile.cycles=
-pp.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.s=
ock_read_iter
      3.23 =C2=B1  6%     -80.3%       0.64 =C2=B1 45%  perf-profile.cycles=
-pp.copy_user_generic_string.skb_copy_datagram_iter.unix_stream_read_actor.=
unix_stream_read_generic.unix_stream_recvmsg
      2.65 =C2=B1 13%    +322.9%      11.20 =C2=B1 36%  perf-profile.cycles=
-pp.default_wake_function.autoremove_wake_function.__wake_up_common.__wake_=
up_sync_key.sock_def_readable
      2.06 =C2=B1 13%    +228.2%       6.75 =C2=B1 40%  perf-profile.cycles=
-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_=
wake_up
      2.20 =C2=B1 13%    +230.1%       7.25 =C2=B1 39%  perf-profile.cycles=
-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.default=
_wake_function
      1.54 =C2=B1  6%     -93.8%       0.10 =C2=B1 50%  perf-profile.cycles=
-pp.kfree.skb_free_head.skb_release_data.skb_release_all.consume_skb
      2.00 =C2=B1  8%     -89.5%       0.21 =C2=B1 21%  perf-profile.cycles=
-pp.kfree_skbmem.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.s=
ock_recvmsg
      1.18 =C2=B1 13%     -94.3%       0.07 =C2=B1 80%  perf-profile.cycles=
-pp.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_=
pskb.unix_stream_sendmsg
      1.92 =C2=B1  7%     -90.5%       0.18 =C2=B1 15%  perf-profile.cycles=
-pp.kmem_cache_free.kfree_skbmem.consume_skb.unix_stream_read_generic.unix_=
stream_recvmsg
      0.28 =C2=B1 54%    +476.1%       1.63 =C2=B1 40%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__schedule.schedule=
.schedule_timeout
      0.18 =C2=B1 40%    +772.9%       1.53 =C2=B1 35%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__wake_up_sync_=
key.sock_def_readable.unix_stream_sendmsg
      1.98 =C2=B1 10%     -81.1%       0.38 =C2=B1 47%  perf-profile.cycles=
-pp.rw_verify_area.vfs_read.sys_read.entry_SYSCALL_64_fastpath
      1.56 =C2=B1  7%     -84.8%       0.24 =C2=B1 28%  perf-profile.cycles=
-pp.rw_verify_area.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      0.70 =C2=B1 33%    +427.7%       3.67 =C2=B1 36%  perf-profile.cycles=
-pp.schedule.schedule_timeout.unix_stream_read_generic.unix_stream_recvmsg.=
sock_recvmsg
      0.71 =C2=B1 31%    +431.1%       3.76 =C2=B1 37%  perf-profile.cycles=
-pp.schedule_timeout.unix_stream_read_generic.unix_stream_recvmsg.sock_recv=
msg.sock_read_iter
      1.67 =C2=B1  9%     -86.5%       0.23 =C2=B1 38%  perf-profile.cycles=
-pp.security_file_permission.rw_verify_area.vfs_read.sys_read.entry_SYSCALL=
_64_fastpath
      1.31 =C2=B1  9%     -89.3%       0.14 =C2=B1 15%  perf-profile.cycles=
-pp.security_file_permission.rw_verify_area.vfs_write.sys_write.entry_SYSCA=
LL_64_fastpath
      0.98 =C2=B1  7%     -95.4%       0.04 =C2=B1 59%  perf-profile.cycles=
-pp.selinux_file_permission.security_file_permission.rw_verify_area.vfs_rea=
d.sys_read
      0.97 =C2=B1 10%     -93.3%       0.07 =C2=B1 31%  perf-profile.cycles=
-pp.selinux_file_permission.security_file_permission.rw_verify_area.vfs_wri=
te.sys_write
      1.94 =C2=B1 12%     -85.4%       0.28 =C2=B1 42%  perf-profile.cycles=
-pp.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_sendmsg.sock_write=
_iter.__vfs_write
      7.00 =C2=B1  2%     -53.8%       3.23 =C2=B1 35%  perf-profile.cycles=
-pp.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.=
unix_stream_recvmsg.sock_recvmsg
      1.62 =C2=B1  6%     -93.5%       0.11 =C2=B1 48%  perf-profile.cycles=
-pp.skb_free_head.skb_release_data.skb_release_all.consume_skb.unix_stream_=
read_generic
      6.70 =C2=B1  2%     -48.3%       3.46 =C2=B1 32%  perf-profile.cycles=
-pp.skb_release_all.consume_skb.unix_stream_read_generic.unix_stream_recvms=
g.sock_recvmsg
      3.81 =C2=B1  4%     -75.0%       0.95 =C2=B1 44%  perf-profile.cycles=
-pp.skb_release_data.skb_release_all.consume_skb.unix_stream_read_generic.u=
nix_stream_recvmsg
      1.28 =C2=B1  7%     -86.2%       0.18 =C2=B1 42%  perf-profile.cycles=
-pp.skb_release_head_state.skb_release_all.consume_skb.unix_stream_read_gen=
eric.unix_stream_recvmsg
     10.07 =C2=B1  1%     -20.8%       7.97 =C2=B1 15%  perf-profile.cycles=
-pp.sock_alloc_send_pskb.unix_stream_sendmsg.sock_sendmsg.sock_write_iter._=
_vfs_write
      3.42 =C2=B1 13%    +365.6%      15.91 =C2=B1 30%  perf-profile.cycles=
-pp.sock_def_readable.unix_stream_sendmsg.sock_sendmsg.sock_write_iter.__vf=
s_write
     40.53 =C2=B1  0%     -12.0%      35.68 =C2=B1  4%  perf-profile.cycles=
-pp.sock_read_iter.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
     39.39 =C2=B1  0%     -11.6%      34.83 =C2=B1  4%  perf-profile.cycles=
-pp.sock_recvmsg.sock_read_iter.__vfs_read.vfs_read.sys_read
     30.61 =C2=B1  1%     +34.0%      41.01 =C2=B1  6%  perf-profile.cycles=
-pp.sock_sendmsg.sock_write_iter.__vfs_write.vfs_write.sys_write
     31.75 =C2=B1  0%     +32.1%      41.93 =C2=B1  6%  perf-profile.cycles=
-pp.sock_write_iter.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpa=
th
     49.79 =C2=B1  0%     -13.1%      43.25 =C2=B1  5%  perf-profile.cycles=
-pp.sys_read.entry_SYSCALL_64_fastpath
     40.87 =C2=B1  1%     +22.6%      50.12 =C2=B1  4%  perf-profile.cycles=
-pp.sys_write.entry_SYSCALL_64_fastpath
      2.96 =C2=B1 11%    +278.5%      11.20 =C2=B1 36%  perf-profile.cycles=
-pp.try_to_wake_up.default_wake_function.autoremove_wake_function.__wake_up=
_common.__wake_up_sync_key
      2.33 =C2=B1 12%    +237.0%       7.87 =C2=B1 38%  perf-profile.cycles=
-pp.ttwu_do_activate.constprop.85.try_to_wake_up.default_wake_function.auto=
remove_wake_function.__wake_up_common
      1.06 =C2=B1  7%     -86.1%       0.15 =C2=B1 41%  perf-profile.cycles=
-pp.unix_destruct_scm.skb_release_head_state.skb_release_all.consume_skb.un=
ix_stream_read_generic
      7.13 =C2=B1  2%     -52.6%       3.38 =C2=B1 35%  perf-profile.cycles=
-pp.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.soc=
k_recvmsg.sock_read_iter
     36.07 =C2=B1  0%     -11.1%      32.06 =C2=B1  3%  perf-profile.cycles=
-pp.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_ite=
r.__vfs_read
     37.73 =C2=B1  0%     -11.6%      33.35 =C2=B1  3%  perf-profile.cycles=
-pp.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.__vfs_read.vfs_read
     27.66 =C2=B1  1%     +40.0%      38.71 =C2=B1  7%  perf-profile.cycles=
-pp.unix_stream_sendmsg.sock_sendmsg.sock_write_iter.__vfs_write.vfs_write
     47.73 =C2=B1  0%     -12.9%      41.56 =C2=B1  5%  perf-profile.cycles=
-pp.vfs_read.sys_read.entry_SYSCALL_64_fastpath
     38.65 =C2=B1  0%     +24.2%      47.99 =C2=B1  4%  perf-profile.cycles=
-pp.vfs_write.sys_write.entry_SYSCALL_64_fastpath
   2763960 =C2=B1  7%     +23.2%    3405876 =C2=B1 11%  sched_debug.cfs_rq[=
0]:/.min_vruntime
      1062 =C2=B1 13%     +17.8%       1251 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
      1060 =C2=B1 13%     +18.5%       1257 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
     17.25 =C2=B1  7%     -27.5%      12.50 =C2=B1 29%  sched_debug.cfs_rq[=
2]:/.nr_spread_over
   2786477 =C2=B1  8%     +25.8%    3504396 =C2=B1  5%  sched_debug.cfs_rq[=
3]:/.min_vruntime
      6.25 =C2=B1 28%     +68.0%      10.50 =C2=B1 10%  sched_debug.cfs_rq[=
3]:/.nr_spread_over
   2910076 =C2=B1  8%     +22.7%    3571629 =C2=B1 11%  sched_debug.cfs_rq[=
4]:/.min_vruntime
   2851625 =C2=B1  7%     +32.2%    3769293 =C2=B1  4%  sched_debug.cfs_rq[=
7]:/.min_vruntime
      7.50 =C2=B1 29%     +90.0%      14.25 =C2=B1 14%  sched_debug.cfs_rq[=
7]:/.nr_spread_over
    685452 =C2=B1 11%     -35.2%     444246 =C2=B1 23%  sched_debug.cpu#0.a=
vg_idle
     31.25 =C2=B1 13%    +233.6%     104.25 =C2=B1  5%  sched_debug.cpu#0.n=
r_running
   4690362 =C2=B1 53%    +265.6%   17147827 =C2=B1 10%  sched_debug.cpu#0.n=
r_switches
   4738489 =C2=B1 53%    +262.9%   17195923 =C2=B1 10%  sched_debug.cpu#0.s=
ched_count
   3528422 =C2=B1 36%    +242.2%   12073723 =C2=B1  3%  sched_debug.cpu#0.t=
twu_count
    711053 =C2=B1  4%     -20.0%     568520 =C2=B1 19%  sched_debug.cpu#1.a=
vg_idle
     32.00 =C2=B1 14%    +207.0%      98.25 =C2=B1  7%  sched_debug.cpu#1.n=
r_running
   4515626 =C2=B1 49%    +231.3%   14958200 =C2=B1  8%  sched_debug.cpu#1.n=
r_switches
   4515650 =C2=B1 49%    +231.3%   14958228 =C2=B1  8%  sched_debug.cpu#1.s=
ched_count
     33162 =C2=B1 18%     -44.5%      18419 =C2=B1  6%  sched_debug.cpu#1.s=
ched_goidle
   3546392 =C2=B1 30%    +250.5%   12428531 =C2=B1  8%  sched_debug.cpu#1.t=
twu_count
    712923 =C2=B1  6%     -15.0%     606333 =C2=B1  5%  sched_debug.cpu#2.a=
vg_idle
     29.25 =C2=B1 27%    +263.2%     106.25 =C2=B1  6%  sched_debug.cpu#2.n=
r_running
   3175885 =C2=B1  4%    +398.4%   15827946 =C2=B1 13%  sched_debug.cpu#2.n=
r_switches
   3175904 =C2=B1  4%    +398.4%   15827972 =C2=B1 13%  sched_debug.cpu#2.s=
ched_count
   2831946 =C2=B1  5%    +337.9%   12400824 =C2=B1  5%  sched_debug.cpu#2.t=
twu_count
    671235 =C2=B1  9%     -19.8%     538230 =C2=B1  8%  sched_debug.cpu#3.a=
vg_idle
    101.25 =C2=B1 15%     +26.2%     127.75 =C2=B1 18%  sched_debug.cpu#3.c=
pu_load[1]
     17309 =C2=B1  3%     -35.2%      11221 =C2=B1 38%  sched_debug.cpu#3.c=
urr->pid
     31.50 =C2=B1 15%    +224.6%     102.25 =C2=B1  9%  sched_debug.cpu#3.n=
r_running
   5870774 =C2=B1 48%    +178.9%   16374035 =C2=B1  2%  sched_debug.cpu#3.n=
r_switches
   5870796 =C2=B1 48%    +178.9%   16374064 =C2=B1  2%  sched_debug.cpu#3.s=
ched_count
     37561 =C2=B1 44%     -61.6%      14414 =C2=B1 15%  sched_debug.cpu#3.s=
ched_goidle
   4219291 =C2=B1 35%    +172.5%   11498279 =C2=B1  5%  sched_debug.cpu#3.t=
twu_count
   3848777 =C2=B1 38%     -44.6%    2132838 =C2=B1  3%  sched_debug.cpu#3.t=
twu_local
    762115 =C2=B1  8%     -29.0%     540876 =C2=B1 18%  sched_debug.cpu#4.a=
vg_idle
     28.00 =C2=B1 17%    +198.2%      83.50 =C2=B1 16%  sched_debug.cpu#4.n=
r_running
   3378378 =C2=B1  7%    +357.6%   15459385 =C2=B1  5%  sched_debug.cpu#4.n=
r_switches
   3378398 =C2=B1  7%    +357.6%   15459415 =C2=B1  5%  sched_debug.cpu#4.s=
ched_count
   2926567 =C2=B1  7%    +301.9%   11763330 =C2=B1  4%  sched_debug.cpu#4.t=
twu_count
   2577652 =C2=B1  5%     -11.5%    2282453 =C2=B1  3%  sched_debug.cpu#4.t=
twu_local
     24.00 =C2=B1  7%    +262.5%      87.00 =C2=B1 16%  sched_debug.cpu#5.n=
r_running
   3790760 =C2=B1 19%    +289.2%   14753042 =C2=B1  3%  sched_debug.cpu#5.n=
r_switches
    -13.75 =C2=B1-71%    -118.2%       2.50 =C2=B1 91%  sched_debug.cpu#5.n=
r_uninterruptible
   3790783 =C2=B1 19%    +289.2%   14753074 =C2=B1  3%  sched_debug.cpu#5.s=
ched_count
   3190949 =C2=B1 11%    +303.2%   12866258 =C2=B1 10%  sched_debug.cpu#5.t=
twu_count
    767337 =C2=B1  5%     -17.9%     630139 =C2=B1 11%  sched_debug.cpu#6.a=
vg_idle
     25.25 =C2=B1 20%    +221.8%      81.25 =C2=B1 11%  sched_debug.cpu#6.n=
r_running
   3377066 =C2=B1  3%    +346.5%   15077076 =C2=B1 11%  sched_debug.cpu#6.n=
r_switches
   3377088 =C2=B1  3%    +346.5%   15077103 =C2=B1 11%  sched_debug.cpu#6.s=
ched_count
   2920233 =C2=B1  4%    +321.4%   12306595 =C2=B1  2%  sched_debug.cpu#6.t=
twu_count
   2595947 =C2=B1  3%     -11.6%    2295380 =C2=B1  8%  sched_debug.cpu#6.t=
twu_local
     18.25 =C2=B1 17%    +311.0%      75.00 =C2=B1 13%  sched_debug.cpu#7.n=
r_running
   4060347 =C2=B1 21%    +288.6%   15779161 =C2=B1  5%  sched_debug.cpu#7.n=
r_switches
   4060369 =C2=B1 21%    +288.6%   15779196 =C2=B1  5%  sched_debug.cpu#7.s=
ched_count
     58321 =C2=B1 52%     -73.7%      15320 =C2=B1 19%  sched_debug.cpu#7.s=
ched_goidle
   3284695 =C2=B1 16%    +261.8%   11884348 =C2=B1  4%  sched_debug.cpu#7.t=
twu_count
   2891042 =C2=B1 14%     -25.5%    2154619 =C2=B1  2%  sched_debug.cpu#7.t=
twu_local

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test/cluster:
  ivb42/netpipe/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performanc=
e/tcp/cs-localhost

commit: =

  1fda6948fbb2e756c8f7cabef40395cee2984298
  9b7aaf11b8d61eeb87f3b99fb5ae59e61bb35f27

1fda6948fbb2e756 9b7aaf11b8d61eeb87f3b99fb5 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     51004 =C2=B1  0%     -48.7%      26147 =C2=B1  1%  netpipe.bigger_5M_M=
bps.avg
      8.54 =C2=B1  1%     +35.6%      11.58 =C2=B1  1%  netpipe.less_8K_use=
c.avg
     90.94 =C2=B1  0%     +86.4%     169.55 =C2=B1  0%  netpipe.time.elapse=
d_time
     90.94 =C2=B1  0%     +86.4%     169.55 =C2=B1  0%  netpipe.time.elapse=
d_time.max
     82.25 =C2=B1  0%      -7.0%      76.50 =C2=B1  0%  netpipe.time.percen=
t_of_cpu_this_job_got
     75.08 =C2=B1  0%     +73.6%     130.31 =C2=B1  0%  netpipe.time.system=
_time
    884329 =C2=B1  3%     +58.7%    1403395 =C2=B1  2%  netpipe.time.volunt=
ary_context_switches
    111670 =C2=B1  7%     +31.3%     146580 =C2=B1  3%  meminfo.Committed_AS
      2262 =C2=B1 13%     -44.7%       1251 =C2=B1 53%  numa-meminfo.node0.=
PageTables
    274787 =C2=B1  3%     -16.2%     230168 =C2=B1  1%  softirqs.TIMER
    118.63 =C2=B1  3%     +66.4%     197.37 =C2=B1  0%  uptime.boot
      5483 =C2=B1  3%     +66.8%       9147 =C2=B1  0%  uptime.idle
     38673 =C2=B1  1%     -13.2%      33557 =C2=B1  1%  vmstat.system.cs
      2245 =C2=B1  3%     +11.6%       2506 =C2=B1  3%  vmstat.system.in
     22681 =C2=B1 56%     -57.6%       9618 =C2=B1 10%  proc-vmstat.numa_hi=
nt_faults
      5251 =C2=B1 50%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.numa_pa=
ges_migrated
     43542 =C2=B1 59%     -62.3%      16421 =C2=B1  7%  proc-vmstat.numa_pt=
e_updates
    239188 =C2=B1  5%     +62.6%     389005 =C2=B1  0%  proc-vmstat.pgfault
      5251 =C2=B1 50%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.pgmigra=
te_success
     90.94 =C2=B1  0%     +86.4%     169.55 =C2=B1  0%  time.elapsed_time
     90.94 =C2=B1  0%     +86.4%     169.55 =C2=B1  0%  time.elapsed_time.m=
ax
     75.08 =C2=B1  0%     +73.6%     130.31 =C2=B1  0%  time.system_time
      0.23 =C2=B1  2%     +16.0%       0.27 =C2=B1  3%  time.user_time
    884329 =C2=B1  3%     +58.7%    1403395 =C2=B1  2%  time.voluntary_cont=
ext_switches
  72133896 =C2=B1 10%     +55.5%  1.121e+08 =C2=B1  7%  cpuidle.C1-IVT.time
   1742889 =C2=B1  1%     +19.1%    2076365 =C2=B1  2%  cpuidle.C1-IVT.usage
     10968 =C2=B1 14%    +570.6%      73551 =C2=B1 23%  cpuidle.C1E-IVT.usa=
ge
      1750 =C2=B1 58%    +130.8%       4039 =C2=B1 15%  cpuidle.C3-IVT.usage
 4.173e+09 =C2=B1  0%     +86.6%  7.785e+09 =C2=B1  0%  cpuidle.C6-IVT.time
    125.00 =C2=B1 50%    +195.0%     368.75 =C2=B1 67%  cpuidle.POLL.usage
    578.25 =C2=B1  5%     -15.1%     490.75 =C2=B1  3%  numa-vmstat.node0.n=
r_alloc_batch
    109.50 =C2=B1 30%     -44.7%      60.50 =C2=B1100%  numa-vmstat.node0.n=
r_dirtied
    564.00 =C2=B1 13%     -44.6%     312.25 =C2=B1 53%  numa-vmstat.node0.n=
r_page_table_pages
     50126 =C2=B1 52%     -98.2%     913.50 =C2=B1 40%  numa-vmstat.node0.n=
uma_other
     36.00 =C2=B1100%    +186.1%     103.00 =C2=B1 49%  numa-vmstat.node1.n=
r_dirtied
     34.00 =C2=B1100%    +178.7%      94.75 =C2=B1 50%  numa-vmstat.node1.n=
r_written
     29929 =C2=B1 87%    +163.3%      78814 =C2=B1  0%  numa-vmstat.node1.n=
uma_other
      3257 =C2=B1  2%     -13.0%       2834 =C2=B1  2%  slabinfo.kmalloc-20=
48.active_objs
      3328 =C2=B1  2%     -11.9%       2932 =C2=B1  2%  slabinfo.kmalloc-20=
48.num_objs
     14729 =C2=B1  4%     -14.4%      12606 =C2=B1  7%  slabinfo.kmalloc-25=
6.active_objs
    446.25 =C2=B1  4%     -20.0%     357.00 =C2=B1  0%  slabinfo.kmem_cache=
.active_objs
    446.25 =C2=B1  4%     -20.0%     357.00 =C2=B1  0%  slabinfo.kmem_cache=
.num_objs
      2058 =C2=B1  1%     +11.2%       2288 =C2=B1  2%  slabinfo.trace_even=
t_file.active_objs
      2058 =C2=B1  1%     +11.2%       2288 =C2=B1  2%  slabinfo.trace_even=
t_file.num_objs
      3.69 =C2=B1  2%      -5.6%       3.48 =C2=B1  2%  turbostat.%Busy
      7.69 =C2=B1  3%     -13.4%       6.66 =C2=B1  3%  turbostat.CPU%c1
      0.04 =C2=B1 61%     -66.7%       0.01 =C2=B1 35%  turbostat.CPU%c3
     59.64 =C2=B1  1%     +26.7%      75.56 =C2=B1  0%  turbostat.CorWatt
     62.50 =C2=B1  3%     +16.0%      72.50 =C2=B1  3%  turbostat.CoreTmp
     31.21 =C2=B1  5%     -99.2%       0.26 =C2=B1  7%  turbostat.Pkg%pc2
     61.75 =C2=B1  5%     +17.0%      72.25 =C2=B1  4%  turbostat.PkgTmp
     88.34 =C2=B1  1%     +20.1%     106.10 =C2=B1  0%  turbostat.PkgWatt
      3.94 =C2=B1  2%     +90.2%       7.50 =C2=B1  5%  turbostat.RAMWatt
     54.50 =C2=B1 58%     -81.2%      10.25 =C2=B1151%  sched_debug.cfs_rq[=
10]:/.load_avg
     54.50 =C2=B1 58%     -81.2%      10.25 =C2=B1151%  sched_debug.cfs_rq[=
10]:/.tg_load_avg_contrib
     77.00 =C2=B1 42%     -64.6%      27.25 =C2=B1147%  sched_debug.cfs_rq[=
10]:/.util_avg
     10968 =C2=B1 28%     -91.9%     883.05 =C2=B1 34%  sched_debug.cfs_rq[=
12]:/.exec_clock
     24653 =C2=B1 17%     -77.2%       5621 =C2=B1 38%  sched_debug.cfs_rq[=
12]:/.min_vruntime
      1.25 =C2=B1 66%    +180.0%       3.50 =C2=B1 24%  sched_debug.cfs_rq[=
12]:/.nr_spread_over
      4137 =C2=B1142%    -626.5%     -21782 =C2=B1-97%  sched_debug.cfs_rq[=
12]:/.spread0
      6210 =C2=B1 90%    +272.4%      23126 =C2=B1 88%  sched_debug.cfs_rq[=
16]:/.min_vruntime
      3.50 =C2=B1111%   +1585.7%      59.00 =C2=B1 42%  sched_debug.cfs_rq[=
17]:/.load_avg
      3.50 =C2=B1111%   +1585.7%      59.00 =C2=B1 42%  sched_debug.cfs_rq[=
17]:/.tg_load_avg_contrib
      4.50 =C2=B1147%   +3766.7%     174.00 =C2=B1 63%  sched_debug.cfs_rq[=
17]:/.util_avg
      8373 =C2=B1 25%     -65.7%       2868 =C2=B1108%  sched_debug.cfs_rq[=
1]:/.exec_clock
     90.75 =C2=B1 61%     -90.4%       8.75 =C2=B1146%  sched_debug.cfs_rq[=
1]:/.load_avg
     91.25 =C2=B1 60%     -90.4%       8.75 =C2=B1146%  sched_debug.cfs_rq[=
1]:/.tg_load_avg_contrib
    315.25 =C2=B1 83%     -96.7%      10.50 =C2=B1136%  sched_debug.cfs_rq[=
1]:/.util_avg
    343.38 =C2=B1 37%   +1061.0%       3986 =C2=B1111%  sched_debug.cfs_rq[=
21]:/.exec_clock
      5.75 =C2=B1120%    +660.9%      43.75 =C2=B1 70%  sched_debug.cfs_rq[=
21]:/.load_avg
      4069 =C2=B1 71%    +176.8%      11262 =C2=B1 74%  sched_debug.cfs_rq[=
21]:/.min_vruntime
      5.75 =C2=B1120%    +660.9%      43.75 =C2=B1 70%  sched_debug.cfs_rq[=
21]:/.tg_load_avg_contrib
      9.00 =C2=B1147%   +1105.6%     108.50 =C2=B1 93%  sched_debug.cfs_rq[=
21]:/.util_avg
    419.82 =C2=B1 41%   +3356.1%      14509 =C2=B1122%  sched_debug.cfs_rq[=
22]:/.exec_clock
    -16629 =C2=B1-23%    -122.1%       3673 =C2=B1361%  sched_debug.cfs_rq[=
22]:/.spread0
    230.54 =C2=B1 49%    +131.2%     533.06 =C2=B1 30%  sched_debug.cfs_rq[=
24]:/.exec_clock
      3.75 =C2=B1 54%     -46.7%       2.00 =C2=B1 50%  sched_debug.cfs_rq[=
26]:/.nr_spread_over
     39.75 =C2=B1 71%     -73.6%      10.50 =C2=B1136%  sched_debug.cfs_rq[=
28]:/.util_avg
     45.25 =C2=B1 58%     -91.7%       3.75 =C2=B1128%  sched_debug.cfs_rq[=
2]:/.load_avg
      6.50 =C2=B1 35%     -53.8%       3.00 =C2=B1100%  sched_debug.cfs_rq[=
2]:/.nr_spread_over
     45.25 =C2=B1 58%     -91.7%       3.75 =C2=B1128%  sched_debug.cfs_rq[=
2]:/.tg_load_avg_contrib
     83.00 =C2=B1 24%     -84.0%      13.25 =C2=B1139%  sched_debug.cfs_rq[=
2]:/.util_avg
    162.98 =C2=B1 64%    +114.1%     348.87 =C2=B1 36%  sched_debug.cfs_rq[=
30]:/.exec_clock
     40.25 =C2=B1 23%     -77.6%       9.00 =C2=B1 62%  sched_debug.cfs_rq[=
35]:/.load_avg
     40.25 =C2=B1 23%     -77.6%       9.00 =C2=B1 62%  sched_debug.cfs_rq[=
35]:/.tg_load_avg_contrib
    100.25 =C2=B1 20%     -88.4%      11.67 =C2=B1 77%  sched_debug.cfs_rq[=
35]:/.util_avg
      1.00 =C2=B1  0%   +1800.0%      19.00 =C2=B1 54%  sched_debug.cfs_rq[=
37]:/.load_avg
      1.00 =C2=B1  0%   +1800.0%      19.00 =C2=B1 54%  sched_debug.cfs_rq[=
37]:/.tg_load_avg_contrib
      2.75 =C2=B1 47%     -63.6%       1.00 =C2=B1100%  sched_debug.cfs_rq[=
3]:/.nr_spread_over
      3.00 =C2=B1137%    +783.3%      26.50 =C2=B1 75%  sched_debug.cfs_rq[=
41]:/.load_avg
      3.00 =C2=B1137%    +783.3%      26.50 =C2=B1 75%  sched_debug.cfs_rq[=
41]:/.tg_load_avg_contrib
      1.33 =C2=B1 93%   +2468.8%      34.25 =C2=B1 59%  sched_debug.cfs_rq[=
43]:/.util_avg
    290.09 =C2=B1 47%    +549.3%       1883 =C2=B1  7%  sched_debug.cfs_rq[=
47]:/.exec_clock
     38.75 =C2=B1 50%     -78.1%       8.50 =C2=B1112%  sched_debug.cfs_rq[=
4]:/.load_avg
      6247 =C2=B1 45%     +86.4%      11644 =C2=B1 33%  sched_debug.cfs_rq[=
4]:/.min_vruntime
     39.00 =C2=B1 49%     -78.2%       8.50 =C2=B1112%  sched_debug.cfs_rq[=
4]:/.tg_load_avg_contrib
     99.75 =C2=B1 53%     -86.5%      13.50 =C2=B1135%  sched_debug.cfs_rq[=
4]:/.util_avg
     42.25 =C2=B1 56%     -86.4%       5.75 =C2=B1143%  sched_debug.cfs_rq[=
7]:/.load_avg
     42.25 =C2=B1 56%     -86.4%       5.75 =C2=B1143%  sched_debug.cfs_rq[=
7]:/.tg_load_avg_contrib
    106.75 =C2=B1 65%     -65.3%      37.00 =C2=B1159%  sched_debug.cfs_rq[=
7]:/.util_avg
     31.00 =C2=B1 52%     -68.5%       9.75 =C2=B1126%  sched_debug.cfs_rq[=
9]:/.load_avg
     31.00 =C2=B1 52%     -68.5%       9.75 =C2=B1126%  sched_debug.cfs_rq[=
9]:/.tg_load_avg_contrib
     73.50 =C2=B1 53%     -73.8%      19.25 =C2=B1134%  sched_debug.cfs_rq[=
9]:/.util_avg
     57811 =C2=B1  7%     +56.3%      90337 =C2=B1  0%  sched_debug.cpu#0.c=
lock
     57811 =C2=B1  7%     +56.3%      90337 =C2=B1  0%  sched_debug.cpu#0.c=
lock_task
     -7.25 =C2=B1-46%     -65.5%      -2.50 =C2=B1-128%  sched_debug.cpu#0.=
nr_uninterruptible
     57811 =C2=B1  7%     +56.3%      90335 =C2=B1  0%  sched_debug.cpu#1.c=
lock
     57811 =C2=B1  7%     +56.3%      90335 =C2=B1  0%  sched_debug.cpu#1.c=
lock_task
     58.00 =C2=B1 94%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#1.c=
pu_load[0]
     57.25 =C2=B1 97%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#1.c=
pu_load[1]
     19125 =C2=B1 11%     -60.7%       7510 =C2=B1 54%  sched_debug.cpu#1.n=
r_load_updates
      3064 =C2=B1 29%     -66.0%       1043 =C2=B1  5%  sched_debug.cpu#1.t=
twu_local
     57811 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#10.=
clock
     57811 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#10.=
clock_task
     12292 =C2=B1 12%     -64.4%       4377 =C2=B1 12%  sched_debug.cpu#10.=
nr_load_updates
    124.50 =C2=B1 23%    +144.2%     304.00 =C2=B1 24%  sched_debug.cpu#10.=
ttwu_local
     57811 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#11.=
clock
     57811 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#11.=
clock_task
     11997 =C2=B1  4%     -65.5%       4134 =C2=B1  8%  sched_debug.cpu#11.=
nr_load_updates
     35749 =C2=B1 75%     -81.2%       6733 =C2=B1117%  sched_debug.cpu#11.=
ttwu_count
     57812 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#12.=
clock
     57812 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#12.=
clock_task
     20997 =C2=B1 14%     -81.5%       3875 =C2=B1  9%  sched_debug.cpu#12.=
nr_load_updates
    200703 =C2=B1 29%     -87.3%      25459 =C2=B1 47%  sched_debug.cpu#12.=
nr_switches
    211710 =C2=B1 29%     -87.8%      25783 =C2=B1 47%  sched_debug.cpu#12.=
sched_count
     99983 =C2=B1 29%     -87.3%      12690 =C2=B1 47%  sched_debug.cpu#12.=
sched_goidle
    101421 =C2=B1 27%     -89.3%      10884 =C2=B1 62%  sched_debug.cpu#12.=
ttwu_count
      5337 =C2=B1 38%     -95.5%     242.75 =C2=B1 39%  sched_debug.cpu#12.=
ttwu_local
     57812 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#13.=
clock
     57812 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#13.=
clock_task
      4688 =C2=B1 26%     -96.0%     186.75 =C2=B1 51%  sched_debug.cpu#13.=
ttwu_local
     57812 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#14.=
clock
     57812 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#14.=
clock_task
     14405 =C2=B1 26%     -51.9%       6925 =C2=B1 65%  sched_debug.cpu#14.=
nr_load_updates
      3184 =C2=B1 86%     -92.3%     246.50 =C2=B1 40%  sched_debug.cpu#14.=
ttwu_local
     57811 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#15.=
clock
     57811 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#15.=
clock_task
     11551 =C2=B1  3%     -58.4%       4804 =C2=B1 50%  sched_debug.cpu#15.=
nr_load_updates
     57812 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#16.=
clock
     57812 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#16.=
clock_task
     17762 =C2=B1139%   +1247.7%     239393 =C2=B1 95%  sched_debug.cpu#16.=
nr_switches
     19045 =C2=B1128%   +1198.7%     247333 =C2=B1 94%  sched_debug.cpu#16.=
sched_count
      8845 =C2=B1140%   +1252.6%     119648 =C2=B1 95%  sched_debug.cpu#16.=
sched_goidle
     11908 =C2=B1117%   +1012.6%     132494 =C2=B1108%  sched_debug.cpu#16.=
ttwu_count
   1000000 =C2=B1  0%     -19.9%     800514 =C2=B1 15%  sched_debug.cpu#17.=
avg_idle
     57812 =C2=B1  7%     +56.3%      90343 =C2=B1  0%  sched_debug.cpu#17.=
clock
     57812 =C2=B1  7%     +56.3%      90343 =C2=B1  0%  sched_debug.cpu#17.=
clock_task
     57811 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#18.=
clock
     57811 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#18.=
clock_task
     11453 =C2=B1  7%     -61.4%       4419 =C2=B1 41%  sched_debug.cpu#18.=
nr_load_updates
     57812 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#19.=
clock
     57812 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#19.=
clock_task
     57810 =C2=B1  7%     +56.2%      90311 =C2=B1  0%  sched_debug.cpu#2.c=
lock
     57810 =C2=B1  7%     +56.2%      90311 =C2=B1  0%  sched_debug.cpu#2.c=
lock_task
     92432 =C2=B1 83%     -60.1%      36916 =C2=B1127%  sched_debug.cpu#2.n=
r_switches
     95373 =C2=B1 81%     -60.1%      38038 =C2=B1128%  sched_debug.cpu#2.s=
ched_count
     45921 =C2=B1 84%     -59.9%      18408 =C2=B1127%  sched_debug.cpu#2.s=
ched_goidle
     46108 =C2=B1 82%     -56.2%      20191 =C2=B1124%  sched_debug.cpu#2.t=
twu_count
     57812 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#20.=
clock
     57812 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#20.=
clock_task
     11250 =C2=B1  1%     -61.1%       4372 =C2=B1 51%  sched_debug.cpu#20.=
nr_load_updates
     57812 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#21.=
clock
     57812 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#21.=
clock_task
      1896 =C2=B1 53%   +4458.6%      86443 =C2=B1 88%  sched_debug.cpu#21.=
nr_switches
    914.50 =C2=B1 54%   +4622.6%      43188 =C2=B1 88%  sched_debug.cpu#21.=
sched_goidle
    801.75 =C2=B1 65%   +5447.3%      44475 =C2=B1 89%  sched_debug.cpu#21.=
ttwu_count
     57813 =C2=B1  7%     +56.3%      90343 =C2=B1  0%  sched_debug.cpu#22.=
clock
     57813 =C2=B1  7%     +56.3%      90343 =C2=B1  0%  sched_debug.cpu#22.=
clock_task
      1646 =C2=B1 34%  +22511.3%     372295 =C2=B1114%  sched_debug.cpu#22.=
nr_switches
      1757 =C2=B1 25%  +21611.8%     381639 =C2=B1114%  sched_debug.cpu#22.=
sched_count
    789.00 =C2=B1 37%  +23483.2%     186071 =C2=B1114%  sched_debug.cpu#22.=
sched_goidle
    607.00 =C2=B1 35%  +31533.1%     192013 =C2=B1116%  sched_debug.cpu#22.=
ttwu_count
     57813 =C2=B1  7%     +56.3%      90343 =C2=B1  0%  sched_debug.cpu#23.=
clock
     57813 =C2=B1  7%     +56.3%      90343 =C2=B1  0%  sched_debug.cpu#23.=
clock_task
     11382 =C2=B1  2%     -65.0%       3987 =C2=B1 23%  sched_debug.cpu#23.=
nr_load_updates
     -3.50 =C2=B1-71%    -128.6%       1.00 =C2=B1  0%  sched_debug.cpu#23.=
nr_uninterruptible
    446.25 =C2=B1 40%     -55.2%     200.00 =C2=B1 21%  sched_debug.cpu#23.=
ttwu_local
     57813 =C2=B1  7%     +56.3%      90343 =C2=B1  0%  sched_debug.cpu#24.=
clock
     57813 =C2=B1  7%     +56.3%      90343 =C2=B1  0%  sched_debug.cpu#24.=
clock_task
     10709 =C2=B1  1%     -71.5%       3051 =C2=B1  8%  sched_debug.cpu#24.=
nr_load_updates
    609.50 =C2=B1  5%     +99.9%       1218 =C2=B1 30%  sched_debug.cpu#24.=
nr_switches
    613.00 =C2=B1  4%    +100.0%       1225 =C2=B1 30%  sched_debug.cpu#24.=
sched_count
    280.75 =C2=B1  5%    +102.6%     568.75 =C2=B1 32%  sched_debug.cpu#24.=
sched_goidle
    192.75 =C2=B1  4%    +140.6%     463.75 =C2=B1 33%  sched_debug.cpu#24.=
ttwu_count
     57813 =C2=B1  7%     +56.3%      90343 =C2=B1  0%  sched_debug.cpu#25.=
clock
     57813 =C2=B1  7%     +56.3%      90343 =C2=B1  0%  sched_debug.cpu#25.=
clock_task
     10759 =C2=B1  2%     -72.5%       2962 =C2=B1  3%  sched_debug.cpu#25.=
nr_load_updates
     57813 =C2=B1  7%     +56.3%      90343 =C2=B1  0%  sched_debug.cpu#26.=
clock
     57813 =C2=B1  7%     +56.3%      90343 =C2=B1  0%  sched_debug.cpu#26.=
clock_task
     10769 =C2=B1  2%     -70.4%       3183 =C2=B1 15%  sched_debug.cpu#26.=
nr_load_updates
      6.00 =C2=B1 81%    -150.0%      -3.00 =C2=B1-72%  sched_debug.cpu#26.=
nr_uninterruptible
     57814 =C2=B1  7%     +56.3%      90343 =C2=B1  0%  sched_debug.cpu#27.=
clock
     57814 =C2=B1  7%     +56.3%      90343 =C2=B1  0%  sched_debug.cpu#27.=
clock_task
     10762 =C2=B1  1%     -70.2%       3205 =C2=B1  8%  sched_debug.cpu#27.=
nr_load_updates
      1.25 =C2=B1142%    -200.0%      -1.25 =C2=B1-118%  sched_debug.cpu#27=
.nr_uninterruptible
     57814 =C2=B1  7%     +56.3%      90343 =C2=B1  0%  sched_debug.cpu#28.=
clock
     57814 =C2=B1  7%     +56.3%      90343 =C2=B1  0%  sched_debug.cpu#28.=
clock_task
     10744 =C2=B1  1%     -72.6%       2948 =C2=B1  5%  sched_debug.cpu#28.=
nr_load_updates
    654.50 =C2=B1 22%     +70.8%       1117 =C2=B1 20%  sched_debug.cpu#28.=
nr_switches
    657.75 =C2=B1 22%     +70.9%       1124 =C2=B1 19%  sched_debug.cpu#28.=
sched_count
    297.25 =C2=B1 23%     +76.6%     525.00 =C2=B1 20%  sched_debug.cpu#28.=
sched_goidle
     57814 =C2=B1  7%     +56.3%      90344 =C2=B1  0%  sched_debug.cpu#29.=
clock
     57814 =C2=B1  7%     +56.3%      90344 =C2=B1  0%  sched_debug.cpu#29.=
clock_task
      2.25 =C2=B1110%    -144.4%      -1.00 =C2=B1-141%  sched_debug.cpu#29=
.nr_uninterruptible
     57811 =C2=B1  7%     +56.3%      90338 =C2=B1  0%  sched_debug.cpu#3.c=
lock
     57811 =C2=B1  7%     +56.3%      90338 =C2=B1  0%  sched_debug.cpu#3.c=
lock_task
     57814 =C2=B1  7%     +56.3%      90344 =C2=B1  0%  sched_debug.cpu#30.=
clock
     57814 =C2=B1  7%     +56.3%      90344 =C2=B1  0%  sched_debug.cpu#30.=
clock_task
     10616 =C2=B1  1%     -72.3%       2937 =C2=B1  4%  sched_debug.cpu#30.=
nr_load_updates
    716.00 =C2=B1 40%   +1610.9%      12249 =C2=B1155%  sched_debug.cpu#30.=
nr_switches
    718.50 =C2=B1 40%   +1606.1%      12258 =C2=B1155%  sched_debug.cpu#30.=
sched_count
    265.00 =C2=B1 15%   +2190.5%       6069 =C2=B1157%  sched_debug.cpu#30.=
sched_goidle
    270.00 =C2=B1 27%   +2120.5%       5995 =C2=B1131%  sched_debug.cpu#30.=
ttwu_count
     57814 =C2=B1  7%     +56.3%      90345 =C2=B1  0%  sched_debug.cpu#31.=
clock
     57814 =C2=B1  7%     +56.3%      90345 =C2=B1  0%  sched_debug.cpu#31.=
clock_task
     10682 =C2=B1  1%     -70.2%       3180 =C2=B1 11%  sched_debug.cpu#31.=
nr_load_updates
    610.25 =C2=B1 15%   +2592.1%      16428 =C2=B1162%  sched_debug.cpu#31.=
nr_switches
    613.25 =C2=B1 15%   +2579.8%      16434 =C2=B1161%  sched_debug.cpu#31.=
sched_count
    278.75 =C2=B1 17%   +2831.7%       8172 =C2=B1162%  sched_debug.cpu#31.=
sched_goidle
    248.75 =C2=B1 25%   +3406.6%       8722 =C2=B1156%  sched_debug.cpu#31.=
ttwu_count
     97.00 =C2=B1  5%     +85.8%     180.25 =C2=B1 14%  sched_debug.cpu#31.=
ttwu_local
     57814 =C2=B1  7%     +56.3%      90344 =C2=B1  0%  sched_debug.cpu#32.=
clock
     57814 =C2=B1  7%     +56.3%      90344 =C2=B1  0%  sched_debug.cpu#32.=
clock_task
     10718 =C2=B1  2%     -73.1%       2887 =C2=B1  5%  sched_debug.cpu#32.=
nr_load_updates
    183.25 =C2=B1 11%    +312.7%     756.25 =C2=B1 90%  sched_debug.cpu#32.=
ttwu_count
     57814 =C2=B1  7%     +56.3%      90345 =C2=B1  0%  sched_debug.cpu#33.=
clock
     57814 =C2=B1  7%     +56.3%      90345 =C2=B1  0%  sched_debug.cpu#33.=
clock_task
     10681 =C2=B1  3%     -71.4%       3050 =C2=B1 10%  sched_debug.cpu#33.=
nr_load_updates
     79.25 =C2=B1 15%    +406.0%     401.00 =C2=B1100%  sched_debug.cpu#33.=
ttwu_local
     57814 =C2=B1  7%     +56.3%      90345 =C2=B1  0%  sched_debug.cpu#34.=
clock
     57814 =C2=B1  7%     +56.3%      90345 =C2=B1  0%  sched_debug.cpu#34.=
clock_task
      9764 =C2=B1 18%     -70.5%       2885 =C2=B1  4%  sched_debug.cpu#34.=
nr_load_updates
     95.00 =C2=B1 19%     +62.9%     154.75 =C2=B1 41%  sched_debug.cpu#34.=
ttwu_local
     57814 =C2=B1  7%     +56.3%      90345 =C2=B1  0%  sched_debug.cpu#35.=
clock
     57814 =C2=B1  7%     +56.3%      90345 =C2=B1  0%  sched_debug.cpu#35.=
clock_task
     10680 =C2=B1  1%     -73.6%       2819 =C2=B1 12%  sched_debug.cpu#35.=
nr_load_updates
     57814 =C2=B1  7%     +56.3%      90345 =C2=B1  0%  sched_debug.cpu#36.=
clock
     57814 =C2=B1  7%     +56.3%      90345 =C2=B1  0%  sched_debug.cpu#36.=
clock_task
     10605 =C2=B1  1%     -74.3%       2723 =C2=B1  2%  sched_debug.cpu#36.=
nr_load_updates
    126.50 =C2=B1 13%    +147.2%     312.75 =C2=B1 29%  sched_debug.cpu#36.=
ttwu_count
     59.50 =C2=B1 14%    +146.2%     146.50 =C2=B1 34%  sched_debug.cpu#36.=
ttwu_local
     57814 =C2=B1  7%     +56.3%      90345 =C2=B1  0%  sched_debug.cpu#37.=
clock
     57814 =C2=B1  7%     +56.3%      90345 =C2=B1  0%  sched_debug.cpu#37.=
clock_task
     11015 =C2=B1  5%     -75.8%       2670 =C2=B1  4%  sched_debug.cpu#37.=
nr_load_updates
      1.50 =C2=B1110%    -188.9%      -1.33 =C2=B1-35%  sched_debug.cpu#37.=
nr_uninterruptible
     57814 =C2=B1  7%     +56.3%      90345 =C2=B1  0%  sched_debug.cpu#38.=
clock
     57814 =C2=B1  7%     +56.3%      90345 =C2=B1  0%  sched_debug.cpu#38.=
clock_task
     10614 =C2=B1  1%     -75.7%       2575 =C2=B1  4%  sched_debug.cpu#38.=
nr_load_updates
     96.25 =C2=B1 13%     +65.7%     159.50 =C2=B1 10%  sched_debug.cpu#38.=
ttwu_local
     57814 =C2=B1  7%     +56.3%      90346 =C2=B1  0%  sched_debug.cpu#39.=
clock
     57814 =C2=B1  7%     +56.3%      90346 =C2=B1  0%  sched_debug.cpu#39.=
clock_task
      9969 =C2=B1 11%     -72.9%       2700 =C2=B1  6%  sched_debug.cpu#39.=
nr_load_updates
    590.75 =C2=B1  8%    +131.7%       1368 =C2=B1 47%  sched_debug.cpu#39.=
nr_switches
      0.00 =C2=B1  0%      +Inf%       2.75 =C2=B1 64%  sched_debug.cpu#39.=
nr_uninterruptible
    594.50 =C2=B1  8%    +131.4%       1375 =C2=B1 47%  sched_debug.cpu#39.=
sched_count
    270.25 =C2=B1  7%    +138.6%     644.75 =C2=B1 52%  sched_debug.cpu#39.=
sched_goidle
    194.00 =C2=B1 28%    +419.8%       1008 =C2=B1102%  sched_debug.cpu#39.=
ttwu_count
     85.00 =C2=B1 25%     +95.6%     166.25 =C2=B1 18%  sched_debug.cpu#39.=
ttwu_local
     57811 =C2=B1  7%     +56.3%      90339 =C2=B1  0%  sched_debug.cpu#4.c=
lock
     57811 =C2=B1  7%     +56.3%      90339 =C2=B1  0%  sched_debug.cpu#4.c=
lock_task
     12128 =C2=B1  3%     -43.6%       6841 =C2=B1 39%  sched_debug.cpu#4.n=
r_load_updates
    185.75 =C2=B1 30%    +346.8%     830.00 =C2=B1 92%  sched_debug.cpu#4.t=
twu_local
     57814 =C2=B1  7%     +56.3%      90345 =C2=B1  0%  sched_debug.cpu#40.=
clock
     57814 =C2=B1  7%     +56.3%      90345 =C2=B1  0%  sched_debug.cpu#40.=
clock_task
     10625 =C2=B1  2%     -76.1%       2544 =C2=B1  6%  sched_debug.cpu#40.=
nr_load_updates
     -0.50 =C2=B1-300%    -350.0%       1.25 =C2=B1118%  sched_debug.cpu#40=
.nr_uninterruptible
    269.75 =C2=B1 37%     +66.0%     447.75 =C2=B1 13%  sched_debug.cpu#40.=
sched_goidle
     57814 =C2=B1  7%     +56.3%      90345 =C2=B1  0%  sched_debug.cpu#41.=
clock
     57814 =C2=B1  7%     +56.3%      90345 =C2=B1  0%  sched_debug.cpu#41.=
clock_task
     10644 =C2=B1  1%     -74.2%       2748 =C2=B1 11%  sched_debug.cpu#41.=
nr_load_updates
     57810 =C2=B1  7%     +56.3%      90345 =C2=B1  0%  sched_debug.cpu#42.=
clock
     57810 =C2=B1  7%     +56.3%      90345 =C2=B1  0%  sched_debug.cpu#42.=
clock_task
      9252 =C2=B1 25%     -72.0%       2589 =C2=B1  4%  sched_debug.cpu#42.=
nr_load_updates
     57815 =C2=B1  7%     +56.3%      90345 =C2=B1  0%  sched_debug.cpu#43.=
clock
     57815 =C2=B1  7%     +56.3%      90345 =C2=B1  0%  sched_debug.cpu#43.=
clock_task
     10646 =C2=B1  3%     -75.5%       2606 =C2=B1  6%  sched_debug.cpu#43.=
nr_load_updates
     57815 =C2=B1  7%     +56.3%      90345 =C2=B1  0%  sched_debug.cpu#44.=
clock
     57815 =C2=B1  7%     +56.3%      90345 =C2=B1  0%  sched_debug.cpu#44.=
clock_task
     10758 =C2=B1  2%     -76.4%       2541 =C2=B1  5%  sched_debug.cpu#44.=
nr_load_updates
     57815 =C2=B1  7%     +56.3%      90346 =C2=B1  0%  sched_debug.cpu#45.=
clock
     57815 =C2=B1  7%     +56.3%      90346 =C2=B1  0%  sched_debug.cpu#45.=
clock_task
     10459 =C2=B1  1%     -75.4%       2574 =C2=B1  3%  sched_debug.cpu#45.=
nr_load_updates
    145.50 =C2=B1 18%    +174.6%     399.50 =C2=B1 37%  sched_debug.cpu#45.=
ttwu_count
     66.50 =C2=B1 11%    +121.1%     147.00 =C2=B1 33%  sched_debug.cpu#45.=
ttwu_local
     57815 =C2=B1  7%     +56.3%      90345 =C2=B1  0%  sched_debug.cpu#46.=
clock
     57815 =C2=B1  7%     +56.3%      90345 =C2=B1  0%  sched_debug.cpu#46.=
clock_task
     10475 =C2=B1  2%     -75.0%       2616 =C2=B1  9%  sched_debug.cpu#46.=
nr_load_updates
    557.25 =C2=B1 50%     +60.4%     893.75 =C2=B1 29%  sched_debug.cpu#46.=
nr_switches
    560.25 =C2=B1 50%     +60.3%     898.00 =C2=B1 28%  sched_debug.cpu#46.=
sched_count
    256.50 =C2=B1 51%     +55.1%     397.75 =C2=B1 28%  sched_debug.cpu#46.=
sched_goidle
     57815 =C2=B1  7%     +56.3%      90346 =C2=B1  0%  sched_debug.cpu#47.=
clock
     57815 =C2=B1  7%     +56.3%      90346 =C2=B1  0%  sched_debug.cpu#47.=
clock_task
     10449 =C2=B1  2%     -76.9%       2416 =C2=B1  7%  sched_debug.cpu#47.=
nr_load_updates
     67.50 =C2=B1 25%    +185.9%     193.00 =C2=B1 27%  sched_debug.cpu#47.=
ttwu_local
     57811 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#5.c=
lock
     57811 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#5.c=
lock_task
     57811 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#6.c=
lock
     57811 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#6.c=
lock_task
    731.25 =C2=B1122%    +318.7%       3062 =C2=B1 88%  sched_debug.cpu#6.t=
twu_local
     57811 =C2=B1  7%     +56.3%      90339 =C2=B1  0%  sched_debug.cpu#7.c=
lock
     57811 =C2=B1  7%     +56.3%      90339 =C2=B1  0%  sched_debug.cpu#7.c=
lock_task
     11629 =C2=B1  1%     -64.3%       4148 =C2=B1  3%  sched_debug.cpu#7.n=
r_load_updates
    174.50 =C2=B1 25%    +239.1%     591.75 =C2=B1 32%  sched_debug.cpu#7.t=
twu_local
     57811 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#8.c=
lock
     57811 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#8.c=
lock_task
     11571 =C2=B1  1%     -63.7%       4202 =C2=B1  8%  sched_debug.cpu#8.n=
r_load_updates
     57811 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#9.c=
lock
     57811 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu#9.c=
lock_task
     12295 =C2=B1 10%     -63.0%       4548 =C2=B1 16%  sched_debug.cpu#9.n=
r_load_updates
    151.75 =C2=B1 11%    +405.1%     766.50 =C2=B1 51%  sched_debug.cpu#9.t=
twu_local
     57811 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.cpu_clk
     56784 =C2=B1  7%     +53.0%      86905 =C2=B1  0%  sched_debug.ktime
     57811 =C2=B1  7%     +56.3%      90342 =C2=B1  0%  sched_debug.sched_c=
lk

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/nr_threads/blo=
cksize:
  xps2/pigz/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/10=
0%/128K

commit: =

  1fda6948fbb2e756c8f7cabef40395cee2984298
  9b7aaf11b8d61eeb87f3b99fb5ae59e61bb35f27

1fda6948fbb2e756 9b7aaf11b8d61eeb87f3b99fb5 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   4815744 =C2=B1  5%     -14.9%    4099045 =C2=B1  0%  pigz.time.involunta=
ry_context_switches
   1502733 =C2=B1  0%     -35.4%     970605 =C2=B1  0%  pigz.time.voluntary=
_context_switches
      3969 =C2=B1 16%   +4889.7%     198080 =C2=B1 89%  latency_stats.sum.p=
ipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
     35129 =C2=B1  5%     -18.5%      28613 =C2=B1  0%  vmstat.system.cs
    154419 =C2=B1 11%     -19.8%     123840 =C2=B1  4%  cpuidle.C1-NHM.usage
    176.50 =C2=B1 11%     -28.5%     126.25 =C2=B1 13%  cpuidle.C1E-NHM.usa=
ge
   4815744 =C2=B1  5%     -14.9%    4099045 =C2=B1  0%  time.involuntary_co=
ntext_switches
   1502733 =C2=B1  0%     -35.4%     970605 =C2=B1  0%  time.voluntary_cont=
ext_switches
      6175 =C2=B1  2%      +7.2%       6623 =C2=B1  2%  slabinfo.kmalloc-32=
.active_objs
      6175 =C2=B1  2%      +7.2%       6623 =C2=B1  2%  slabinfo.kmalloc-32=
.num_objs
      1373 =C2=B1  9%     -20.1%       1096 =C2=B1  5%  slabinfo.kmalloc-51=
2.num_objs
   1204535 =C2=B1  4%      -9.7%    1087512 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.min_vruntime
    958.00 =C2=B1  4%      -6.7%     893.50 =C2=B1  3%  sched_debug.cfs_rq[=
0]:/.util_avg
     13243 =C2=B1476%    +794.7%     118493 =C2=B1  5%  sched_debug.cfs_rq[=
1]:/.spread0
     -1668 =C2=B1-4317%   -7180.2%     118167 =C2=B1  3%  sched_debug.cfs_r=
q[2]:/.spread0
    188.25 =C2=B1 26%     -38.0%     116.75 =C2=B1 24%  sched_debug.cfs_rq[=
3]:/.load
     29536 =C2=B1168%    +302.7%     118933 =C2=B1  4%  sched_debug.cfs_rq[=
3]:/.spread0
     96.75 =C2=B1 12%     +12.1%     108.50 =C2=B1  8%  sched_debug.cfs_rq[=
4]:/.load
     29027 =C2=B1173%    +321.2%     122268 =C2=B1  3%  sched_debug.cfs_rq[=
4]:/.spread0
    166.50 =C2=B1  6%     +16.4%     193.75 =C2=B1  6%  sched_debug.cfs_rq[=
5]:/.load_avg
     22902 =C2=B1242%    +414.7%     117874 =C2=B1  6%  sched_debug.cfs_rq[=
5]:/.spread0
    166.50 =C2=B1  6%     +17.0%     194.75 =C2=B1  6%  sched_debug.cfs_rq[=
5]:/.tg_load_avg_contrib
     15851 =C2=B1373%    +655.2%     119700 =C2=B1  4%  sched_debug.cfs_rq[=
6]:/.spread0
    161.25 =C2=B1  5%     +23.6%     199.25 =C2=B1 12%  sched_debug.cfs_rq[=
7]:/.load_avg
     10.50 =C2=B1 15%     -61.9%       4.00 =C2=B1 46%  sched_debug.cfs_rq[=
7]:/.nr_spread_over
    113.25 =C2=B1  4%     +19.6%     135.50 =C2=B1 19%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
     31212 =C2=B1154%    +279.9%     118576 =C2=B1  5%  sched_debug.cfs_rq[=
7]:/.spread0
    161.50 =C2=B1  5%     +23.5%     199.50 =C2=B1 12%  sched_debug.cfs_rq[=
7]:/.tg_load_avg_contrib
     24884 =C2=B1115%    +272.2%      92622 =C2=B1 16%  sched_debug.cpu#0.s=
ched_goidle
    772814 =C2=B1146%    +250.7%    2710566 =C2=B1  1%  sched_debug.cpu#0.t=
twu_count
    947742 =C2=B1135%     -83.5%     156048 =C2=B1 14%  sched_debug.cpu#1.n=
r_switches
    947833 =C2=B1135%     -83.5%     156415 =C2=B1 14%  sched_debug.cpu#1.s=
ched_count
    482248 =C2=B1133%     -84.4%      75226 =C2=B1 11%  sched_debug.cpu#1.t=
twu_count
    470550 =C2=B1136%     -95.3%      22123 =C2=B1 17%  sched_debug.cpu#1.t=
twu_local
      1804 =C2=B1 13%     +18.2%       2133 =C2=B1  4%  sched_debug.cpu#2.c=
urr->pid
   1700803 =C2=B1 88%     -90.4%     162528 =C2=B1 19%  sched_debug.cpu#2.n=
r_switches
   1700897 =C2=B1 88%     -90.4%     162850 =C2=B1 19%  sched_debug.cpu#2.s=
ched_count
    859100 =C2=B1 87%     -91.6%      72315 =C2=B1 10%  sched_debug.cpu#2.t=
twu_count
    846365 =C2=B1 88%     -97.7%      19706 =C2=B1  8%  sched_debug.cpu#2.t=
twu_local
    188.25 =C2=B1 26%     -38.0%     116.75 =C2=B1 24%  sched_debug.cpu#3.l=
oad
    208390 =C2=B1  5%     -26.2%     153887 =C2=B1 19%  sched_debug.cpu#3.n=
r_switches
    208505 =C2=B1  5%     -26.0%     154206 =C2=B1 19%  sched_debug.cpu#3.s=
ched_count
      5087 =C2=B1 12%     -60.0%       2035 =C2=B1 15%  sched_debug.cpu#3.s=
ched_goidle
    110537 =C2=B1  2%     -27.1%      80574 =C2=B1 15%  sched_debug.cpu#3.t=
twu_count
     99352 =C2=B1  3%     -80.5%      19364 =C2=B1 11%  sched_debug.cpu#3.t=
twu_local
     96.75 =C2=B1 12%     +12.4%     108.75 =C2=B1  9%  sched_debug.cpu#4.l=
oad
    106522 =C2=B1 20%     -66.7%      35512 =C2=B1 77%  sched_debug.cpu#4.t=
twu_local
    112.75 =C2=B1  3%      +7.8%     121.50 =C2=B1  4%  sched_debug.cpu#5.c=
pu_load[3]
    112.25 =C2=B1  2%      +8.2%     121.50 =C2=B1  4%  sched_debug.cpu#5.c=
pu_load[4]
   1055550 =C2=B1140%     -84.8%     160666 =C2=B1 15%  sched_debug.cpu#5.n=
r_switches
     -9.00 =C2=B1-56%    -180.6%       7.25 =C2=B1 57%  sched_debug.cpu#5.n=
r_uninterruptible
   1055658 =C2=B1140%     -84.8%     160966 =C2=B1 15%  sched_debug.cpu#5.s=
ched_count
    538573 =C2=B1138%     -85.6%      77426 =C2=B1 20%  sched_debug.cpu#5.t=
twu_count
    527280 =C2=B1141%     -96.2%      19993 =C2=B1 22%  sched_debug.cpu#5.t=
twu_local
    480670 =C2=B1 12%     +25.7%     604142 =C2=B1  9%  sched_debug.cpu#6.a=
vg_idle
   1881968 =C2=B1 89%     -91.4%     162480 =C2=B1 15%  sched_debug.cpu#6.n=
r_switches
   1882052 =C2=B1 89%     -91.3%     162951 =C2=B1 15%  sched_debug.cpu#6.s=
ched_count
     37540 =C2=B1 97%     -96.8%       1208 =C2=B1 24%  sched_debug.cpu#6.s=
ched_goidle
    952428 =C2=B1 89%     -92.2%      73822 =C2=B1 19%  sched_debug.cpu#6.t=
twu_count
    939038 =C2=B1 90%     -97.8%      20620 =C2=B1 19%  sched_debug.cpu#6.t=
twu_local
    112.75 =C2=B1  5%     +30.6%     147.25 =C2=B1 18%  sched_debug.cpu#7.c=
pu_load[0]
    112.50 =C2=B1  4%     +25.8%     141.50 =C2=B1 17%  sched_debug.cpu#7.c=
pu_load[1]
    112.50 =C2=B1  2%     +23.6%     139.00 =C2=B1 17%  sched_debug.cpu#7.c=
pu_load[2]
    112.25 =C2=B1  1%     +22.5%     137.50 =C2=B1 16%  sched_debug.cpu#7.c=
pu_load[3]
    113.00 =C2=B1  1%     +20.8%     136.50 =C2=B1 16%  sched_debug.cpu#7.c=
pu_load[4]
    203104 =C2=B1  3%     -20.5%     161466 =C2=B1  9%  sched_debug.cpu#7.n=
r_switches
    203195 =C2=B1  3%     -20.4%     161814 =C2=B1  9%  sched_debug.cpu#7.s=
ched_count
    109093 =C2=B1  4%     -26.6%      80094 =C2=B1  8%  sched_debug.cpu#7.t=
twu_count
     99150 =C2=B1  3%     -81.2%      18616 =C2=B1 15%  sched_debug.cpu#7.t=
twu_local
      2.26 =C2=B1109%    +768.5%      19.60 =C2=B1 79%  sched_debug.rt_rq[0=
]:/.rt_time
     11.04 =C2=B1  4%     -44.3%       6.14 =C2=B1  3%  perf-profile.cycles=
-pp.__account_scheduler_latency.enqueue_entity.enqueue_task_fair.activate_t=
ask.ttwu_do_activate
      2.45 =C2=B1 11%     +29.8%       3.18 =C2=B1  9%  perf-profile.cycles=
-pp.__alloc_pages_nodemask.alloc_pages_current.pipe_write.__vfs_write.vfs_w=
rite
      5.74 =C2=B1  7%     -50.2%       2.86 =C2=B1  4%  perf-profile.cycles=
-pp.__kernel_text_address.print_context_stack.dump_trace.save_stack_trace_t=
sk.__account_scheduler_latency
      1.21 =C2=B1  6%     -71.3%       0.35 =C2=B1 24%  perf-profile.cycles=
-pp.__module_text_address.is_module_text_address.__kernel_text_address.prin=
t_context_stack.dump_trace
      0.71 =C2=B1 26%     -39.2%       0.43 =C2=B1  8%  perf-profile.cycles=
-pp.__schedule.schedule.pipe_wait.pipe_write.__vfs_write
      0.21 =C2=B1 70%    +585.5%       1.42 =C2=B1 23%  perf-profile.cycles=
-pp.__schedule.schedule.prepare_exit_to_usermode.retint_user
      1.35 =C2=B1 16%     -82.9%       0.23 =C2=B1 98%  perf-profile.cycles=
-pp.__schedule.schedule.prepare_exit_to_usermode.syscall_return_slowpath.in=
t_ret_from_sys_call
     18.32 =C2=B1  3%     +15.0%      21.06 =C2=B1  4%  perf-profile.cycles=
-pp.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath
     11.62 =C2=B1  6%     -48.0%       6.05 =C2=B1  5%  perf-profile.cycles=
-pp.activate_task.ttwu_do_activate.try_to_wake_up.wake_up_process.wake_up_q
      2.79 =C2=B1 10%     +32.8%       3.70 =C2=B1  3%  perf-profile.cycles=
-pp.alloc_pages_current.pipe_write.__vfs_write.vfs_write.sys_write
      1.98 =C2=B1 21%     +58.7%       3.14 =C2=B1  7%  perf-profile.cycles=
-pp.anon_pipe_buf_release.pipe_read.__vfs_read.vfs_read.sys_read
      0.58 =C2=B1 62%    +187.9%       1.66 =C2=B1 31%  perf-profile.cycles=
-pp.call_cpuidle.cpu_startup_entry.start_secondary
     13.42 =C2=B1  5%     +16.7%      15.66 =C2=B1  6%  perf-profile.cycles=
-pp.copy_page_from_iter.pipe_write.__vfs_write.vfs_write.sys_write
     11.72 =C2=B1  5%     +20.9%      14.17 =C2=B1  6%  perf-profile.cycles=
-pp.copy_user_generic_string.copy_page_from_iter.pipe_write.__vfs_write.vfs=
_write
      0.60 =C2=B1 55%    +181.2%       1.68 =C2=B1 31%  perf-profile.cycles=
-pp.cpu_startup_entry.start_secondary
      0.58 =C2=B1 62%    +187.9%       1.66 =C2=B1 31%  perf-profile.cycles=
-pp.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_secondary
      0.58 =C2=B1 62%    +187.9%       1.66 =C2=B1 31%  perf-profile.cycles=
-pp.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_=
secondary
      1.00 =C2=B1 24%     -39.9%       0.60 =C2=B1 38%  perf-profile.cycles=
-pp.dequeue_entity.dequeue_task_fair.deactivate_task.__schedule.schedule
      0.92 =C2=B1 15%     +50.3%       1.38 =C2=B1 17%  perf-profile.cycles=
-pp.do_execveat_common.isra.29.sys_execve.return_from_execve.execve
     18.85 =C2=B1  6%     -39.5%      11.39 =C2=B1  5%  perf-profile.cycles=
-pp.do_futex.sys_futex.entry_SYSCALL_64_fastpath
     10.16 =C2=B1  5%     -45.0%       5.59 =C2=B1  6%  perf-profile.cycles=
-pp.dump_trace.save_stack_trace_tsk.__account_scheduler_latency.enqueue_ent=
ity.enqueue_task_fair
     12.49 =C2=B1  3%     -43.9%       7.01 =C2=B1  7%  perf-profile.cycles=
-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_=
wake_up
     11.36 =C2=B1  6%     -47.9%       5.92 =C2=B1  5%  perf-profile.cycles=
-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.wake_up=
_process
      0.92 =C2=B1 15%     +52.2%       1.39 =C2=B1 16%  perf-profile.cycles=
-pp.execve
      0.90 =C2=B1 14%    +155.2%       2.29 =C2=B1  5%  perf-profile.cycles=
-pp.free_hot_cold_page.put_page.anon_pipe_buf_release.pipe_read.__vfs_read
      0.05 =C2=B1 70%   +3103.6%       1.49 =C2=B1 17%  perf-profile.cycles=
-pp.free_pcppages_bulk.free_hot_cold_page.put_page.anon_pipe_buf_release.pi=
pe_read
      6.76 =C2=B1  5%     -84.5%       1.04 =C2=B1 21%  perf-profile.cycles=
-pp.futex_wake.do_futex.sys_futex.entry_SYSCALL_64_fastpath
      1.81 =C2=B1 13%     +33.9%       2.42 =C2=B1 11%  perf-profile.cycles=
-pp.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_current.pipe_=
write.__vfs_write
      1.78 =C2=B1 16%     -82.8%       0.31 =C2=B1 73%  perf-profile.cycles=
-pp.int_ret_from_sys_call
      0.58 =C2=B1 62%    +187.9%       1.66 =C2=B1 31%  perf-profile.cycles=
-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_e=
ntry
      0.67 =C2=B1 23%     +50.2%       1.00 =C2=B1 13%  perf-profile.cycles=
-pp.irq_entries_start
      2.17 =C2=B1 15%     -64.8%       0.76 =C2=B1 12%  perf-profile.cycles=
-pp.is_module_text_address.__kernel_text_address.print_context_stack.dump_t=
race.save_stack_trace_tsk
      0.17 =C2=B1 65%    +417.6%       0.88 =C2=B1 51%  perf-profile.cycles=
-pp.pick_next_task_fair.__schedule.schedule.prepare_exit_to_usermode.retint=
_user
      0.94 =C2=B1 22%     -71.3%       0.27 =C2=B1100%  perf-profile.cycles=
-pp.pick_next_task_fair.__schedule.schedule.prepare_exit_to_usermode.syscal=
l_return_slowpath
     15.43 =C2=B1  4%     +19.8%      18.49 =C2=B1 10%  perf-profile.cycles=
-pp.pipe_read.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
      0.78 =C2=B1 18%     -34.9%       0.51 =C2=B1 28%  perf-profile.cycles=
-pp.pipe_wait.pipe_write.__vfs_write.vfs_write.sys_write
     18.17 =C2=B1  3%     +15.6%      21.00 =C2=B1  4%  perf-profile.cycles=
-pp.pipe_write.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      0.41 =C2=B1 47%    +339.6%       1.80 =C2=B1 26%  perf-profile.cycles=
-pp.prepare_exit_to_usermode.retint_user
      1.56 =C2=B1 14%     -82.3%       0.28 =C2=B1 78%  perf-profile.cycles=
-pp.prepare_exit_to_usermode.syscall_return_slowpath.int_ret_from_sys_call
      9.41 =C2=B1  6%     -45.7%       5.10 =C2=B1  6%  perf-profile.cycles=
-pp.print_context_stack.dump_trace.save_stack_trace_tsk.__account_scheduler=
_latency.enqueue_entity
      1.30 =C2=B1 16%    +107.7%       2.71 =C2=B1  2%  perf-profile.cycles=
-pp.put_page.anon_pipe_buf_release.pipe_read.__vfs_read.vfs_read
      0.43 =C2=B1 47%    +343.3%       1.89 =C2=B1 27%  perf-profile.cycles=
-pp.retint_user
      0.92 =C2=B1 15%     +52.2%       1.39 =C2=B1 16%  perf-profile.cycles=
-pp.return_from_execve.execve
     10.18 =C2=B1  6%     -44.5%       5.65 =C2=B1  5%  perf-profile.cycles=
-pp.save_stack_trace_tsk.__account_scheduler_latency.enqueue_entity.enqueue=
_task_fair.activate_task
      0.76 =C2=B1 20%     -45.7%       0.41 =C2=B1 39%  perf-profile.cycles=
-pp.schedule.pipe_wait.pipe_write.__vfs_write.vfs_write
      0.26 =C2=B1 77%    +472.4%       1.50 =C2=B1 26%  perf-profile.cycles=
-pp.schedule.prepare_exit_to_usermode.retint_user
      1.34 =C2=B1 13%     -83.1%       0.23 =C2=B1 98%  perf-profile.cycles=
-pp.schedule.prepare_exit_to_usermode.syscall_return_slowpath.int_ret_from_=
sys_call
      7.82 =C2=B1  8%     -13.9%       6.73 =C2=B1  8%  perf-profile.cycles=
-pp.scheduler_tick.update_process_times.tick_sched_handle.tick_sched_timer.=
__hrtimer_run_queues
      0.77 =C2=B1 20%     -57.9%       0.33 =C2=B1 53%  perf-profile.cycles=
-pp.select_idle_sibling.select_task_rq_fair.try_to_wake_up.wake_up_process.=
wake_up_q
      0.60 =C2=B1 55%    +181.2%       1.68 =C2=B1 31%  perf-profile.cycles=
-pp.start_secondary
      0.92 =C2=B1 15%     +52.2%       1.39 =C2=B1 16%  perf-profile.cycles=
-pp.sys_execve.return_from_execve.execve
     19.05 =C2=B1  6%     -39.8%      11.47 =C2=B1  6%  perf-profile.cycles=
-pp.sys_futex.entry_SYSCALL_64_fastpath
     18.65 =C2=B1  5%     +14.9%      21.43 =C2=B1  4%  perf-profile.cycles=
-pp.sys_write.entry_SYSCALL_64_fastpath
      1.71 =C2=B1 17%     -83.6%       0.28 =C2=B1 78%  perf-profile.cycles=
-pp.syscall_return_slowpath.int_ret_from_sys_call
      8.13 =C2=B1  8%     -15.7%       6.86 =C2=B1  4%  perf-profile.cycles=
-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.hpet_interrupt_=
handler.handle_irq_event_percpu
      6.42 =C2=B1  6%     -86.7%       0.86 =C2=B1 15%  perf-profile.cycles=
-pp.try_to_wake_up.wake_up_process.wake_up_q.futex_wake.do_futex
      5.71 =C2=B1  6%     -88.3%       0.67 =C2=B1 16%  perf-profile.cycles=
-pp.ttwu_do_activate.constprop.85.try_to_wake_up.wake_up_process.wake_up_q.=
futex_wake
     18.56 =C2=B1  4%     +14.7%      21.29 =C2=B1  4%  perf-profile.cycles=
-pp.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      6.48 =C2=B1  6%     -86.7%       0.86 =C2=B1 15%  perf-profile.cycles=
-pp.wake_up_process.wake_up_q.futex_wake.do_futex.sys_futex
      7.83 =C2=B1  5%     -12.0%       6.90 =C2=B1  6%  perf-profile.cycles=
-pp.wake_up_q.futex_requeue.do_futex.sys_futex.entry_SYSCALL_64_fastpath
      6.50 =C2=B1  6%     -86.8%       0.86 =C2=B1 15%  perf-profile.cycles=
-pp.wake_up_q.futex_wake.do_futex.sys_futex.entry_SYSCALL_64_fastpath

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/nr_threads/blo=
cksize:
  xps2/pigz/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/10=
0%/512K

commit: =

  1fda6948fbb2e756c8f7cabef40395cee2984298
  9b7aaf11b8d61eeb87f3b99fb5ae59e61bb35f27

1fda6948fbb2e756 9b7aaf11b8d61eeb87f3b99fb5 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    421289 =C2=B1  0%     -41.5%     246276 =C2=B1  0%  pigz.time.voluntary=
_context_switches
     29846 =C2=B1  2%      -7.7%      27554 =C2=B1  7%  vmstat.system.cs
     20.45 =C2=B1  0%     +13.2%      23.14 =C2=B1  2%  time.system_time
    421289 =C2=B1  0%     -41.5%     246276 =C2=B1  0%  time.voluntary_cont=
ext_switches
  45714285 =C2=B1124%     -95.7%    1984224 =C2=B1141%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
  48348210 =C2=B1115%     -93.5%    3139821 =C2=B1141%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
  49349347 =C2=B1111%     -92.0%    3968449 =C2=B1141%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      1375 =C2=B1 14%     -27.1%       1002 =C2=B1  6%  slabinfo.kmalloc-51=
2.active_objs
      1383 =C2=B1 13%     -22.9%       1066 =C2=B1  4%  slabinfo.kmalloc-51=
2.num_objs
    288.00 =C2=B1 11%     -27.8%     208.00 =C2=B1 13%  slabinfo.kmem_cache=
_node.active_objs
    288.00 =C2=B1 11%     -27.8%     208.00 =C2=B1 13%  slabinfo.kmem_cache=
_node.num_objs
    185.25 =C2=B1 20%     -31.8%     126.25 =C2=B1 27%  sched_debug.cfs_rq[=
1]:/.load
    197.75 =C2=B1 38%     -46.9%     105.00 =C2=B1  7%  sched_debug.cfs_rq[=
4]:/.load
    612137 =C2=B1 10%     -30.7%     424430 =C2=B1 39%  sched_debug.cpu#0.a=
vg_idle
    185.50 =C2=B1 20%     -31.9%     126.25 =C2=B1 27%  sched_debug.cpu#1.l=
oad
      4279 =C2=B1 38%    +433.7%      22836 =C2=B1 90%  sched_debug.cpu#1.s=
ched_goidle
      3.75 =C2=B1 66%    -293.3%      -7.25 =C2=B1-71%  sched_debug.cpu#2.n=
r_uninterruptible
     49454 =C2=B1 11%     -33.7%      32794 =C2=B1 21%  sched_debug.cpu#2.t=
twu_count
     46367 =C2=B1 10%     -73.0%      12537 =C2=B1 36%  sched_debug.cpu#2.t=
twu_local
      2101 =C2=B1  2%     -19.6%       1689 =C2=B1 31%  sched_debug.cpu#3.c=
urr->pid
   3172457 =C2=B1 13%     -75.8%     768326 =C2=B1159%  sched_debug.cpu#3.n=
r_switches
   3172792 =C2=B1 13%     -75.8%     768559 =C2=B1159%  sched_debug.cpu#3.s=
ched_count
     31071 =C2=B1 63%     -70.6%       9145 =C2=B1152%  sched_debug.cpu#3.s=
ched_goidle
   1591262 =C2=B1 13%     -75.3%     393479 =C2=B1154%  sched_debug.cpu#3.t=
twu_count
   1585043 =C2=B1 13%     -77.0%     363933 =C2=B1168%  sched_debug.cpu#3.t=
twu_local
      1563 =C2=B1  3%     +24.7%       1950 =C2=B1  2%  sched_debug.cpu#4.c=
urr->pid
    197.75 =C2=B1 38%     -46.9%     105.00 =C2=B1  7%  sched_debug.cpu#4.l=
oad
     40124 =C2=B1 11%     -67.6%      12997 =C2=B1 52%  sched_debug.cpu#4.t=
twu_local
     -7.75 =C2=B1-64%    -116.1%       1.25 =C2=B1261%  sched_debug.cpu#5.n=
r_uninterruptible
     43049 =C2=B1  9%     -36.9%      27181 =C2=B1 23%  sched_debug.cpu#6.t=
twu_count
     39979 =C2=B1  9%     -79.5%       8203 =C2=B1 27%  sched_debug.cpu#6.t=
twu_local
    503206 =C2=B1  8%     +27.6%     642256 =C2=B1 14%  sched_debug.cpu#7.a=
vg_idle
    108.50 =C2=B1  2%     +19.6%     129.75 =C2=B1 19%  sched_debug.cpu#7.c=
pu_load[4]
   3350838 =C2=B1 19%     -71.4%     958032 =C2=B1162%  sched_debug.cpu#7.n=
r_switches
   3351130 =C2=B1 19%     -71.4%     958871 =C2=B1162%  sched_debug.cpu#7.s=
ched_count
     44871 =C2=B1 85%     -69.4%      13748 =C2=B1166%  sched_debug.cpu#7.s=
ched_goidle
   1679394 =C2=B1 19%     -71.1%     486037 =C2=B1159%  sched_debug.cpu#7.t=
twu_count
   1674846 =C2=B1 19%     -72.2%     465439 =C2=B1167%  sched_debug.cpu#7.t=
twu_local
      0.11 =C2=B1 60%  +15333.0%      16.37 =C2=B1121%  sched_debug.rt_rq[1=
]:/.rt_time
      4.84 =C2=B1 14%     -46.4%       2.59 =C2=B1 22%  perf-profile.cycles=
-pp.__account_scheduler_latency.enqueue_entity.enqueue_task_fair.activate_t=
ask.ttwu_do_activate
      1.31 =C2=B1 17%     +40.8%       1.84 =C2=B1 14%  perf-profile.cycles=
-pp.__do_softirq.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt
      2.50 =C2=B1  8%     -48.0%       1.30 =C2=B1  9%  perf-profile.cycles=
-pp.__kernel_text_address.print_context_stack.dump_trace.save_stack_trace_t=
sk.__account_scheduler_latency
      0.03 =C2=B1141%   +5341.7%       1.63 =C2=B1 16%  perf-profile.cycles=
-pp.__mutex_lock_slowpath.mutex_lock.pipe_read.__vfs_read.vfs_read
      0.84 =C2=B1 15%     -61.1%       0.33 =C2=B1 15%  perf-profile.cycles=
-pp.__schedule.schedule.futex_wait_queue_me.futex_wait.do_futex
      0.24 =C2=B1 48%    +238.8%       0.83 =C2=B1 20%  perf-profile.cycles=
-pp.__schedule.schedule.prepare_exit_to_usermode.retint_user
     16.31 =C2=B1  5%     +13.3%      18.48 =C2=B1  1%  perf-profile.cycles=
-pp.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
     20.50 =C2=B1  4%     +15.7%      23.72 =C2=B1  0%  perf-profile.cycles=
-pp.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      2.24 =C2=B1  7%     -33.1%       1.50 =C2=B1 41%  perf-profile.cycles=
-pp.__wake_up_common.__wake_up_sync_key.pipe_write.__vfs_write.vfs_write
      2.42 =C2=B1  8%     -32.1%       1.64 =C2=B1 38%  perf-profile.cycles=
-pp.__wake_up_sync_key.pipe_write.__vfs_write.vfs_write.sys_write
      0.55 =C2=B1 23%     +80.5%       1.00 =C2=B1 12%  perf-profile.cycles=
-pp.account_process_tick.update_process_times.tick_sched_handle.tick_sched_=
timer.__hrtimer_run_queues
      0.48 =C2=B1 36%     +68.9%       0.82 =C2=B1 27%  perf-profile.cycles=
-pp.account_user_time.account_process_tick.update_process_times.tick_sched_=
handle.tick_sched_timer
      3.63 =C2=B1 22%     -57.9%       1.53 =C2=B1 14%  perf-profile.cycles=
-pp.activate_task.ttwu_do_activate.try_to_wake_up.wake_up_process.wake_up_q
      2.94 =C2=B1 18%     +22.4%       3.60 =C2=B1  2%  perf-profile.cycles=
-pp.anon_pipe_buf_release.pipe_read.__vfs_read.vfs_read.sys_read
     15.36 =C2=B1  5%     +18.1%      18.14 =C2=B1  1%  perf-profile.cycles=
-pp.copy_page_from_iter.pipe_write.__vfs_write.vfs_write.sys_write
     13.54 =C2=B1  4%     +19.4%      16.17 =C2=B1  1%  perf-profile.cycles=
-pp.copy_user_generic_string.copy_page_from_iter.pipe_write.__vfs_write.vfs=
_write
     27.96 =C2=B1  1%      -7.2%      25.94 =C2=B1  4%  perf-profile.cycles=
-pp.do_IRQ.ret_from_intr
      6.18 =C2=B1 11%     -51.2%       3.02 =C2=B1 15%  perf-profile.cycles=
-pp.do_futex.sys_futex.entry_SYSCALL_64_fastpath
      4.37 =C2=B1 12%     -42.6%       2.51 =C2=B1 23%  perf-profile.cycles=
-pp.dump_trace.save_stack_trace_tsk.__account_scheduler_latency.enqueue_ent=
ity.enqueue_task_fair
      5.66 =C2=B1 18%     -41.2%       3.33 =C2=B1 25%  perf-profile.cycles=
-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_=
wake_up
      3.68 =C2=B1 22%     -55.5%       1.64 =C2=B1 10%  perf-profile.cycles=
-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.wake_up=
_process
      1.95 =C2=B1 21%     +45.2%       2.83 =C2=B1  9%  perf-profile.cycles=
-pp.free_hot_cold_page.put_page.anon_pipe_buf_release.pipe_read.__vfs_read
      1.02 =C2=B1 36%     +88.7%       1.92 =C2=B1  3%  perf-profile.cycles=
-pp.free_pcppages_bulk.free_hot_cold_page.put_page.anon_pipe_buf_release.pi=
pe_read
      1.19 =C2=B1 17%     -52.2%       0.57 =C2=B1 15%  perf-profile.cycles=
-pp.futex_wait.do_futex.sys_futex.entry_SYSCALL_64_fastpath
      0.95 =C2=B1 11%     -52.9%       0.45 =C2=B1 13%  perf-profile.cycles=
-pp.futex_wait_queue_me.futex_wait.do_futex.sys_futex.entry_SYSCALL_64_fast=
path
      2.33 =C2=B1 22%     -87.9%       0.28 =C2=B1 42%  perf-profile.cycles=
-pp.futex_wake.do_futex.sys_futex.entry_SYSCALL_64_fastpath
      1.26 =C2=B1 11%     -24.1%       0.96 =C2=B1 21%  perf-profile.cycles=
-pp.irq_exit.do_IRQ.ret_from_intr
      1.59 =C2=B1 17%     +42.1%       2.26 =C2=B1  7%  perf-profile.cycles=
-pp.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt
      1.10 =C2=B1 16%     -50.5%       0.55 =C2=B1 28%  perf-profile.cycles=
-pp.is_module_text_address.__kernel_text_address.print_context_stack.dump_t=
race.save_stack_trace_tsk
      0.06 =C2=B1141%   +2762.5%       1.72 =C2=B1 15%  perf-profile.cycles=
-pp.mutex_lock.pipe_read.__vfs_read.vfs_read.sys_read
      0.03 =C2=B1141%   +5341.7%       1.63 =C2=B1 16%  perf-profile.cycles=
-pp.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.pipe_read.__vfs_=
read
      0.03 =C2=B1141%   +4725.0%       1.45 =C2=B1 17%  perf-profile.cycles=
-pp.mutex_spin_on_owner.isra.4.mutex_optimistic_spin.__mutex_lock_slowpath.=
mutex_lock.pipe_read
     16.84 =C2=B1  4%     +14.3%      19.26 =C2=B1  3%  perf-profile.cycles=
-pp.pipe_read.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
     23.56 =C2=B1  4%     +10.8%      26.09 =C2=B1  2%  perf-profile.cycles=
-pp.pipe_write.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      0.34 =C2=B1 51%    +197.0%       1.00 =C2=B1 17%  perf-profile.cycles=
-pp.prepare_exit_to_usermode.retint_user
      4.00 =C2=B1  9%     -44.8%       2.21 =C2=B1 29%  perf-profile.cycles=
-pp.print_context_stack.dump_trace.save_stack_trace_tsk.__account_scheduler=
_latency.enqueue_entity
      0.36 =C2=B1 43%    +181.9%       1.02 =C2=B1 14%  perf-profile.cycles=
-pp.retint_user
      0.44 =C2=B1 24%    +121.5%       0.98 =C2=B1 29%  perf-profile.cycles=
-pp.run_timer_softirq.__do_softirq.irq_exit.smp_apic_timer_interrupt.apic_t=
imer_interrupt
      4.42 =C2=B1 12%     -43.2%       2.51 =C2=B1 23%  perf-profile.cycles=
-pp.save_stack_trace_tsk.__account_scheduler_latency.enqueue_entity.enqueue=
_task_fair.activate_task
      0.86 =C2=B1 13%     -57.3%       0.37 =C2=B1 16%  perf-profile.cycles=
-pp.schedule.futex_wait_queue_me.futex_wait.do_futex.sys_futex
      0.27 =C2=B1 58%    +217.8%       0.85 =C2=B1 19%  perf-profile.cycles=
-pp.schedule.prepare_exit_to_usermode.retint_user
      6.31 =C2=B1 10%     -50.9%       3.10 =C2=B1 17%  perf-profile.cycles=
-pp.sys_futex.entry_SYSCALL_64_fastpath
     20.72 =C2=B1  4%     +15.2%      23.87 =C2=B1  0%  perf-profile.cycles=
-pp.sys_write.entry_SYSCALL_64_fastpath
      2.28 =C2=B1 23%     -90.2%       0.22 =C2=B1 28%  perf-profile.cycles=
-pp.try_to_wake_up.wake_up_process.wake_up_q.futex_wake.do_futex
      2.10 =C2=B1 23%     -91.3%       0.18 =C2=B1 18%  perf-profile.cycles=
-pp.ttwu_do_activate.constprop.85.try_to_wake_up.wake_up_process.wake_up_q.=
futex_wake
     20.70 =C2=B1  4%     +15.2%      23.85 =C2=B1  0%  perf-profile.cycles=
-pp.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      2.28 =C2=B1 23%     -88.5%       0.26 =C2=B1 33%  perf-profile.cycles=
-pp.wake_up_process.wake_up_q.futex_wake.do_futex.sys_futex
      2.28 =C2=B1 23%     -88.5%       0.26 =C2=B1 33%  perf-profile.cycles=
-pp.wake_up_q.futex_wake.do_futex.sys_futex.entry_SYSCALL_64_fastpath

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  ivb42/unixbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performa=
nce/context1

commit: =

  1fda6948fbb2e756c8f7cabef40395cee2984298
  9b7aaf11b8d61eeb87f3b99fb5ae59e61bb35f27

1fda6948fbb2e756 9b7aaf11b8d61eeb87f3b99fb5 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    288.03 =C2=B1  0%     -25.6%     214.25 =C2=B1  0%  unixbench.score
     58.00 =C2=B1  1%     -43.1%      33.00 =C2=B1  9%  unixbench.time.perc=
ent_of_cpu_this_job_got
     72.34 =C2=B1  0%     -35.7%      46.50 =C2=B1  1%  unixbench.time.syst=
em_time
  11420136 =C2=B1  0%     -26.3%    8421203 =C2=B1  0%  unixbench.time.volu=
ntary_context_switches
    344407 =C2=B1  0%     -32.4%     232953 =C2=B1  9%  vmstat.system.cs
    254673 =C2=B1  1%     +11.1%     282981 =C2=B1  6%  proc-vmstat.pgalloc=
_normal
    269784 =C2=B1  1%      +9.0%     294162 =C2=B1  8%  proc-vmstat.pgfree
     45666 =C2=B1  5%     -21.8%      35703 =C2=B1  0%  softirqs.RCU
     98669 =C2=B1  0%     -32.6%      66493 =C2=B1  0%  softirqs.SCHED
    255585 =C2=B1  2%     -41.6%     149165 =C2=B1  0%  softirqs.TIMER
 1.737e+08 =C2=B1  8%     +73.6%  3.016e+08 =C2=B1 15%  cpuidle.C1-IVT.time
  22888771 =C2=B1  0%     -26.2%   16889065 =C2=B1  0%  cpuidle.C1-IVT.usage
   2819263 =C2=B1 37%     +78.3%    5026446 =C2=B1 36%  cpuidle.POLL.time
    215.75 =C2=B1  7%     +27.6%     275.25 =C2=B1 13%  cpuidle.POLL.usage
     48303 =C2=B1 52%     -98.5%     746.00 =C2=B1 13%  numa-vmstat.node0.n=
uma_other
    625.25 =C2=B1  2%     -11.6%     552.50 =C2=B1  1%  numa-vmstat.node1.n=
r_alloc_batch
     27.00 =C2=B1117%    +263.9%      98.25 =C2=B1 32%  numa-vmstat.node1.n=
r_dirtied
     26.00 =C2=B1119%    +274.0%      97.25 =C2=B1 32%  numa-vmstat.node1.n=
r_written
     29792 =C2=B1 84%    +158.6%      77047 =C2=B1  0%  numa-vmstat.node1.n=
uma_other
    186.00 =C2=B1  3%     -12.4%     163.00 =C2=B1  2%  time.involuntary_co=
ntext_switches
     58.00 =C2=B1  1%     -43.1%      33.00 =C2=B1  9%  time.percent_of_cpu=
_this_job_got
     72.34 =C2=B1  0%     -35.7%      46.50 =C2=B1  1%  time.system_time
      4.30 =C2=B1  3%     -67.0%       1.42 =C2=B1  2%  time.user_time
  11420136 =C2=B1  0%     -26.3%    8421203 =C2=B1  0%  time.voluntary_cont=
ext_switches
   1068857 =C2=B1  0%   +2337.3%   26051614 =C2=B1 21%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
     25448 =C2=B1169%   +2538.9%     671565 =C2=B1107%  latency_stats.avg.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_fdatawait.sync_inodes_sb.sy=
nc_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fastpath
   1068857 =C2=B1  0%   +2337.3%   26051614 =C2=B1 21%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
    501985 =C2=B1171%   +2586.6%   13486271 =C2=B1104%  latency_stats.max.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_fdatawait.sync_inodes_sb.sy=
nc_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fastpath
   1068857 =C2=B1  0%   +2337.3%   26051614 =C2=B1 21%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
    508200 =C2=B1169%   +2555.0%   13492792 =C2=B1103%  latency_stats.sum.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_fdatawait.sync_inodes_sb.sy=
nc_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fastpath
      2.25 =C2=B1  1%     -11.8%       1.99 =C2=B1 10%  turbostat.%Busy
      7.92 =C2=B1  5%     +37.7%      10.91 =C2=B1  7%  turbostat.CPU%c1
     44.22 =C2=B1  3%     +26.4%      55.89 =C2=B1  9%  turbostat.CorWatt
     36.77 =C2=B1  8%     -71.7%      10.39 =C2=B1 32%  turbostat.Pkg%pc2
     70.59 =C2=B1  2%     +16.5%      82.22 =C2=B1  7%  turbostat.PkgWatt
      3.17 =C2=B1  0%     +42.5%       4.52 =C2=B1  4%  turbostat.RAMWatt
      4.00 =C2=B1-25%      +6.2%       4.25 =C2=B1 34%  sched_debug.cfs_rq[=
12]:/.nr_spread_over
     12636 =C2=B1 45%     -46.1%       6808 =C2=B1 18%  sched_debug.cfs_rq[=
13]:/.min_vruntime
     13202 =C2=B1 46%     -57.5%       5615 =C2=B1 17%  sched_debug.cfs_rq[=
14]:/.min_vruntime
     10421 =C2=B1 31%     -29.5%       7347 =C2=B1  8%  sched_debug.cfs_rq[=
18]:/.min_vruntime
      3380 =C2=B1 52%     -50.3%       1680 =C2=B1 72%  sched_debug.cfs_rq[=
19]:/.exec_clock
      6209 =C2=B1 42%     -74.2%       1603 =C2=B1 26%  sched_debug.cfs_rq[=
1]:/.exec_clock
     32.75 =C2=B1 24%     -76.3%       7.75 =C2=B1 69%  sched_debug.cfs_rq[=
1]:/.load_avg
     16499 =C2=B1 28%     -56.5%       7182 =C2=B1 21%  sched_debug.cfs_rq[=
1]:/.min_vruntime
    -35.06 =C2=B1-10948%  +18331.7%      -6461 =C2=B1-20%  sched_debug.cfs_=
rq[1]:/.spread0
     33.00 =C2=B1 24%     -76.5%       7.75 =C2=B1 69%  sched_debug.cfs_rq[=
1]:/.tg_load_avg_contrib
      7.50 =C2=B1142%    +243.3%      25.75 =C2=B1 72%  sched_debug.cfs_rq[=
21]:/.load_avg
      5687 =C2=B1 24%    +101.6%      11466 =C2=B1 44%  sched_debug.cfs_rq[=
21]:/.min_vruntime
    -10848 =C2=B1-58%     -79.9%      -2178 =C2=B1-281%  sched_debug.cfs_rq=
[21]:/.spread0
      7.50 =C2=B1142%    +243.3%      25.75 =C2=B1 72%  sched_debug.cfs_rq[=
21]:/.tg_load_avg_contrib
     20.25 =C2=B1156%    +328.4%      86.75 =C2=B1 52%  sched_debug.cfs_rq[=
21]:/.util_avg
    692.16 =C2=B1 30%     +39.6%     966.37 =C2=B1 19%  sched_debug.cfs_rq[=
23]:/.exec_clock
      4978 =C2=B1 24%     -60.2%       1983 =C2=B1 16%  sched_debug.cfs_rq[=
2]:/.exec_clock
     15545 =C2=B1 29%     -48.2%       8048 =C2=B1 26%  sched_debug.cfs_rq[=
2]:/.min_vruntime
      7.00 =C2=B1 78%     -71.4%       2.00 =C2=B1100%  sched_debug.cfs_rq[=
2]:/.nr_spread_over
    -13574 =C2=B1-39%     -54.5%      -6170 =C2=B1-55%  sched_debug.cfs_rq[=
35]:/.spread0
      4.75 =C2=B1112%    +436.8%      25.50 =C2=B1 86%  sched_debug.cfs_rq[=
36]:/.load_avg
      1.00 =C2=B1-100%    +125.0%       2.25 =C2=B1 36%  sched_debug.cfs_rq=
[36]:/.nr_spread_over
      4.75 =C2=B1112%    +436.8%      25.50 =C2=B1 86%  sched_debug.cfs_rq[=
36]:/.tg_load_avg_contrib
      3410 =C2=B1 18%     -51.0%       1672 =C2=B1 40%  sched_debug.cfs_rq[=
3]:/.exec_clock
     17.50 =C2=B1 47%     -65.7%       6.00 =C2=B1115%  sched_debug.cfs_rq[=
3]:/.load_avg
     11719 =C2=B1 21%     -56.7%       5070 =C2=B1 28%  sched_debug.cfs_rq[=
3]:/.min_vruntime
     17.50 =C2=B1 47%     -67.1%       5.75 =C2=B1123%  sched_debug.cfs_rq[=
3]:/.tg_load_avg_contrib
     10.00 =C2=B1-10%    +170.0%      27.00 =C2=B1 59%  sched_debug.cfs_rq[=
42]:/.load_avg
     10.00 =C2=B1-10%    +170.0%      27.00 =C2=B1 59%  sched_debug.cfs_rq[=
42]:/.tg_load_avg_contrib
     10.00 =C2=B1-10%    +385.0%      48.50 =C2=B1 60%  sched_debug.cfs_rq[=
42]:/.util_avg
     17.00 =C2=B1 -5%     +97.1%      33.50 =C2=B1 58%  sched_debug.cfs_rq[=
47]:/.load_avg
     17.00 =C2=B1 -5%     +97.1%      33.50 =C2=B1 58%  sched_debug.cfs_rq[=
47]:/.tg_load_avg_contrib
     21.00 =C2=B1100%    +135.7%      49.50 =C2=B1 65%  sched_debug.cfs_rq[=
47]:/.util_avg
      3465 =C2=B1 59%     -54.7%       1570 =C2=B1 17%  sched_debug.cfs_rq[=
4]:/.exec_clock
     11228 =C2=B1 27%     -37.8%       6988 =C2=B1 15%  sched_debug.cfs_rq[=
4]:/.min_vruntime
     10.25 =C2=B1 95%     -96.7%       0.33 =C2=B1141%  sched_debug.cfs_rq[=
4]:/.nr_spread_over
      3900 =C2=B1 11%     -63.2%       1434 =C2=B1 77%  sched_debug.cfs_rq[=
6]:/.exec_clock
     12352 =C2=B1 16%     -45.7%       6710 =C2=B1 46%  sched_debug.cfs_rq[=
6]:/.min_vruntime
     10852 =C2=B1 34%     -51.4%       5275 =C2=B1 20%  sched_debug.cfs_rq[=
8]:/.min_vruntime
    157.75 =C2=B1 66%     -86.1%      22.00 =C2=B1155%  sched_debug.cfs_rq[=
9]:/.util_avg
     11194 =C2=B1 34%     -33.5%       7438 =C2=B1  7%  sched_debug.cpu#0.n=
r_load_updates
   1005965 =C2=B1 97%     -80.7%     193952 =C2=B1 78%  sched_debug.cpu#0.n=
r_switches
    -16.50 =C2=B1-38%     -65.2%      -5.75 =C2=B1-14%  sched_debug.cpu#0.n=
r_uninterruptible
    501957 =C2=B1 98%     -81.1%      94817 =C2=B1 80%  sched_debug.cpu#0.s=
ched_goidle
    502829 =C2=B1 98%     -80.4%      98361 =C2=B1 78%  sched_debug.cpu#0.t=
twu_count
     13584 =C2=B1 24%     -51.7%       6565 =C2=B1 15%  sched_debug.cpu#1.n=
r_load_updates
   1561606 =C2=B1 48%     -79.6%     319093 =C2=B1 60%  sched_debug.cpu#1.n=
r_switches
    -23.25 =C2=B1-14%     -87.1%      -3.00 =C2=B1-33%  sched_debug.cpu#1.n=
r_uninterruptible
   1562351 =C2=B1 48%     -79.6%     319325 =C2=B1 60%  sched_debug.cpu#1.s=
ched_count
    780735 =C2=B1 48%     -79.6%     159485 =C2=B1 60%  sched_debug.cpu#1.s=
ched_goidle
    779956 =C2=B1 48%     -79.6%     159415 =C2=B1 60%  sched_debug.cpu#1.t=
twu_count
      9568 =C2=B1 15%     -34.0%       6314 =C2=B1 25%  sched_debug.cpu#11.=
nr_load_updates
    695.25 =C2=B1107%     -73.9%     181.75 =C2=B1 20%  sched_debug.cpu#12.=
ttwu_local
      8113 =C2=B1 34%     -38.8%       4962 =C2=B1 22%  sched_debug.cpu#13.=
nr_load_updates
      0.00 =C2=B1  1%      -Inf%      -1.75 =C2=B1-102%  sched_debug.cpu#14=
.nr_uninterruptible
    794942 =C2=B1 18%     +20.5%     957681 =C2=B1  4%  sched_debug.cpu#15.=
avg_idle
    441.75 =C2=B1 62%     -61.6%     169.50 =C2=B1 27%  sched_debug.cpu#15.=
ttwu_local
      6234 =C2=B1  7%     -37.4%       3902 =C2=B1 10%  sched_debug.cpu#16.=
nr_load_updates
    363.00 =C2=B1 36%     -53.2%     169.75 =C2=B1 15%  sched_debug.cpu#17.=
ttwu_local
     12142 =C2=B1 10%     -40.8%       7188 =C2=B1 11%  sched_debug.cpu#2.n=
r_load_updates
   1272905 =C2=B1 24%     -64.9%     446977 =C2=B1 31%  sched_debug.cpu#2.n=
r_switches
   1274639 =C2=B1 24%     -64.9%     447088 =C2=B1 31%  sched_debug.cpu#2.s=
ched_count
    636392 =C2=B1 24%     -64.9%     223377 =C2=B1 31%  sched_debug.cpu#2.s=
ched_goidle
    632056 =C2=B1 24%     -64.7%     223188 =C2=B1 31%  sched_debug.cpu#2.t=
twu_count
    671.50 =C2=B1 71%     -72.9%     182.00 =C2=B1 14%  sched_debug.cpu#22.=
ttwu_local
      5901 =C2=B1 13%     -32.3%       3993 =C2=B1  9%  sched_debug.cpu#23.=
nr_load_updates
     47101 =C2=B1149%    +261.0%     170053 =C2=B1 34%  sched_debug.cpu#23.=
nr_switches
     47106 =C2=B1149%    +261.4%     170223 =C2=B1 34%  sched_debug.cpu#23.=
sched_count
     23517 =C2=B1149%    +261.4%      84984 =C2=B1 34%  sched_debug.cpu#23.=
sched_goidle
     23219 =C2=B1151%    +266.8%      85180 =C2=B1 34%  sched_debug.cpu#23.=
ttwu_count
    476.50 =C2=B1 92%     -60.3%     189.25 =C2=B1 15%  sched_debug.cpu#23.=
ttwu_local
      1.25 =C2=B1103%    -260.0%      -2.00 =C2=B1-35%  sched_debug.cpu#24.=
nr_uninterruptible
      6066 =C2=B1 20%     -49.3%       3077 =C2=B1  7%  sched_debug.cpu#25.=
nr_load_updates
      2.75 =C2=B1141%    -109.1%      -0.25 =C2=B1-435%  sched_debug.cpu#27=
.nr_uninterruptible
      1373 =C2=B1 87%  +44629.3%     614132 =C2=B1106%  sched_debug.cpu#28.=
nr_switches
    651.25 =C2=B1 91%  +47043.5%     307021 =C2=B1106%  sched_debug.cpu#28.=
sched_goidle
      1585 =C2=B1 83%  +19416.5%     309385 =C2=B1104%  sched_debug.cpu#28.=
ttwu_count
      5461 =C2=B1 19%     -44.7%       3022 =C2=B1 12%  sched_debug.cpu#29.=
nr_load_updates
      0.00 =C2=B1  0%      +Inf%       6.00 =C2=B1 88%  sched_debug.cpu#29.=
nr_uninterruptible
      9976 =C2=B1  6%     -34.5%       6536 =C2=B1 28%  sched_debug.cpu#3.n=
r_load_updates
    879948 =C2=B1 21%     -51.1%     430031 =C2=B1 68%  sched_debug.cpu#3.n=
r_switches
    880415 =C2=B1 21%     -51.1%     430197 =C2=B1 68%  sched_debug.cpu#3.s=
ched_count
    439907 =C2=B1 21%     -51.1%     214947 =C2=B1 68%  sched_debug.cpu#3.s=
ched_goidle
    438872 =C2=B1 21%     -51.1%     214556 =C2=B1 68%  sched_debug.cpu#3.t=
twu_count
      5336 =C2=B1 16%     -45.3%       2917 =C2=B1 12%  sched_debug.cpu#30.=
nr_load_updates
      6028 =C2=B1 25%     -45.4%       3290 =C2=B1 30%  sched_debug.cpu#31.=
nr_load_updates
      5256 =C2=B1 10%     -45.9%       2843 =C2=B1  8%  sched_debug.cpu#32.=
nr_load_updates
      6489 =C2=B1 42%     -55.0%       2923 =C2=B1 10%  sched_debug.cpu#34.=
nr_load_updates
    165.25 =C2=B1 11%     +48.7%     245.75 =C2=B1 21%  sched_debug.cpu#34.=
ttwu_local
      4703 =C2=B1  5%     -41.6%       2746 =C2=B1  2%  sched_debug.cpu#36.=
nr_load_updates
      4641 =C2=B1  4%     -31.9%       3158 =C2=B1 26%  sched_debug.cpu#37.=
nr_load_updates
      1.75 =C2=B1 24%    -128.6%      -0.50 =C2=B1-300%  sched_debug.cpu#37=
.nr_uninterruptible
    148.50 =C2=B1  4%     +24.4%     184.75 =C2=B1 15%  sched_debug.cpu#37.=
ttwu_local
      3485 =C2=B1138%  +17598.4%     616876 =C2=B1 82%  sched_debug.cpu#38.=
nr_switches
      5.00 =C2=B1 16%    -130.0%      -1.50 =C2=B1-57%  sched_debug.cpu#38.=
nr_uninterruptible
      3491 =C2=B1138%  +17600.5%     617925 =C2=B1 82%  sched_debug.cpu#38.=
sched_count
      1698 =C2=B1141%  +18057.6%     308406 =C2=B1 82%  sched_debug.cpu#38.=
sched_goidle
      9765 =C2=B1 28%     -33.6%       6488 =C2=B1  9%  sched_debug.cpu#4.n=
r_load_updates
    284.50 =C2=B1 13%    +101.8%     574.25 =C2=B1 42%  sched_debug.cpu#4.t=
twu_local
      5003 =C2=B1  9%     -46.9%       2656 =C2=B1 10%  sched_debug.cpu#40.=
nr_load_updates
    180.00 =C2=B1  7%     -17.6%     148.25 =C2=B1 13%  sched_debug.cpu#40.=
ttwu_local
      6289 =C2=B1 46%     -55.9%       2772 =C2=B1 24%  sched_debug.cpu#41.=
nr_load_updates
      5385 =C2=B1 21%     -55.1%       2419 =C2=B1  3%  sched_debug.cpu#42.=
nr_load_updates
      5249 =C2=B1 22%     -53.9%       2418 =C2=B1  3%  sched_debug.cpu#43.=
nr_load_updates
      4.50 =C2=B1 57%    -116.7%      -0.75 =C2=B1-145%  sched_debug.cpu#43=
.nr_uninterruptible
      4694 =C2=B1  3%     -46.0%       2533 =C2=B1 11%  sched_debug.cpu#44.=
nr_load_updates
      1.50 =C2=B1100%     -66.7%       0.50 =C2=B1100%  sched_debug.cpu#44.=
nr_uninterruptible
    157.25 =C2=B1  6%     -17.2%     130.25 =C2=B1  5%  sched_debug.cpu#44.=
ttwu_local
      4699 =C2=B1  7%     -49.6%       2368 =C2=B1  5%  sched_debug.cpu#45.=
nr_load_updates
      4498 =C2=B1  5%     -47.7%       2352 =C2=B1  3%  sched_debug.cpu#46.=
nr_load_updates
    322.00 =C2=B1 27%    +355.0%       1465 =C2=B1 70%  sched_debug.cpu#46.=
ttwu_count
    988085 =C2=B1  2%     -14.3%     846764 =C2=B1  9%  sched_debug.cpu#47.=
avg_idle
      5610 =C2=B1 26%     -48.3%       2901 =C2=B1 32%  sched_debug.cpu#47.=
nr_load_updates
    132.00 =C2=B1  7%     +55.3%     205.00 =C2=B1  8%  sched_debug.cpu#47.=
ttwu_local
     10304 =C2=B1  3%     -43.8%       5788 =C2=B1 29%  sched_debug.cpu#6.n=
r_load_updates
   1041518 =C2=B1 12%     -66.0%     354166 =C2=B1 96%  sched_debug.cpu#6.n=
r_switches
   1043597 =C2=B1 12%     -66.0%     354370 =C2=B1 96%  sched_debug.cpu#6.s=
ched_count
    520703 =C2=B1 12%     -66.0%     177028 =C2=B1 96%  sched_debug.cpu#6.s=
ched_goidle
    520372 =C2=B1 12%     -66.1%     176504 =C2=B1 97%  sched_debug.cpu#6.t=
twu_count
     10457 =C2=B1 29%     -51.3%       5090 =C2=B1 13%  sched_debug.cpu#7.n=
r_load_updates
   1086551 =C2=B1 71%     -78.7%     231433 =C2=B1 66%  sched_debug.cpu#7.n=
r_switches
   1092986 =C2=B1 71%     -78.8%     231539 =C2=B1 66%  sched_debug.cpu#7.s=
ched_count
    543145 =C2=B1 71%     -78.7%     115671 =C2=B1 66%  sched_debug.cpu#7.s=
ched_goidle
    543672 =C2=B1 71%     -78.9%     114535 =C2=B1 67%  sched_debug.cpu#7.t=
twu_count
      9814 =C2=B1 26%     -38.1%       6078 =C2=B1 18%  sched_debug.cpu#8.n=
r_load_updates


ivb43: Ivytown Ivy Bridge-EP
Memory: 64G

vm-vp-quantal-x86_64: qemu-system-x86_64 -enable-kvm
Memory: 360M

lkp-ne04: Nehalem-EP
Memory: 12G

wsm: Westmere
Memory: 6G

xps2: Nehalem
Memory: 4G

ivb42: Ivytown Ivy Bridge-EP
Memory: 64G




                                hackbench.throughput

  64000 ++-------------------------*-*----*--------------------------------=
-+
  62000 *+*..*.*.*.*..*.*.*.*..*.*      *   *..*.   .*..*.*.*.  .*.*.*     =
 |
        |                                        *.*          *.           =
 |
  60000 ++                                                                 =
 |
  58000 ++                                                                 =
 |
  56000 ++                                                                 =
 |
  54000 ++                                                                 =
 |
        |                                                                  =
 |
  52000 ++                                                                 =
 |
  50000 ++                                                                 =
 |
  48000 ++                                                                 =
 |
  46000 ++                           O  O O O    O   O        O            =
 |
        |    O O   O  O O O O  O O O           O   O    O O O    O O O O  O=
 O
  44000 O+O      O                                                         =
 |
  42000 ++-----------------------------------------------------------------=
-+


                           hackbench.time.minor_page_faults

    8e+06 ++---------*--------------*--*-*-*---*---------------------------=
-+
          *.*.*.. .*  + .*..*.*.*.*          *       .*.*.  .*.*.   .*     =
 |
  7.5e+06 ++     *     *                          *.*     *.     *.*       =
 |
    7e+06 ++                                                               =
 |
          |                                                                =
 |
  6.5e+06 ++                                                               =
 |
          |                                                                =
 |
    6e+06 ++         O   O    O O O    O O O O      O O   O  O O   O    O  =
 |
          |      O          O       O          O  O     O        O   O     =
 |
  5.5e+06 O+O O    O   O                                                  O=
 |
    5e+06 ++                                                               =
 |
          |                                                                =
 |
  4.5e+06 ++                                                               =
 |
          |                                                                =
 O
    4e+06 ++---------------------------------------------------------------=
-+


                       hackbench.time.voluntary_context_switches

  2.6e+08 ++O--------------------------------------------------------------=
-+
  2.4e+08 O+  O  O O          O O O O    O     O  O O   O O  O   O O    O O=
 |
          |          O O O  O          O   O O        O        O     O     =
 |
  2.2e+08 ++                                                               =
 |
    2e+08 ++                                                               =
 |
          |                                                                =
 O
  1.8e+08 ++                                                               =
 |
  1.6e+08 ++                                                               =
 |
  1.4e+08 ++                                                               =
 |
          |                                                                =
 |
  1.2e+08 ++                                                               =
 |
    1e+08 ++                                                               =
 |
          |                                                                =
 |
    8e+07 *+*.*..*.*.*.*.*..*.*.*.*.*..*.*.*.*.*..*.*.*.*.*..*.*.*.*.*     =
 |
    6e+07 ++---------------------------------------------------------------=
-+


                     hackbench.time.involuntary_context_switches

  7e+07 ++-----------------------------------------------------------------=
-+
        | O                                                                =
 |
  6e+07 O+                                                                 =
 |
        |    O O O          O  O O O    O      O O O O  O O O O  O O O O  O=
 |
        |          O  O O O               O O                              =
 |
  5e+07 ++                           O                                     =
 O
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
  2e+07 ++                       *                                         =
 |
        |.*.. .*.          .*.. + +    .*.*.*..*.*.    .*. .*.  .*.*.      =
 |
  1e+07 *+---*---*-*--*-*-*----*---*-*-------------*-*----*---*------*-----=
-+


                                time.minor_page_faults

    8e+06 ++---------*--------------*--*-*-*---*---------------------------=
-+
          *.*.*.. .*  + .*..*.*.*.*          *       .*.*.  .*.*.   .*     =
 |
  7.5e+06 ++     *     *                          *.*     *.     *.*       =
 |
    7e+06 ++                                                               =
 |
          |                                                                =
 |
  6.5e+06 ++                                                               =
 |
          |                                                                =
 |
    6e+06 ++         O   O    O O O    O O O O      O O   O  O O   O    O  =
 |
          |      O          O       O          O  O     O        O   O     =
 |
  5.5e+06 O+O O    O   O                                                  O=
 |
    5e+06 ++                                                               =
 |
          |                                                                =
 |
  4.5e+06 ++                                                               =
 |
          |                                                                =
 O
    4e+06 ++---------------------------------------------------------------=
-+


                            time.voluntary_context_switches

  2.6e+08 ++O--------------------------------------------------------------=
-+
  2.4e+08 O+  O  O O          O O O O    O     O  O O   O O  O   O O    O O=
 |
          |          O O O  O          O   O O        O        O     O     =
 |
  2.2e+08 ++                                                               =
 |
    2e+08 ++                                                               =
 |
          |                                                                =
 O
  1.8e+08 ++                                                               =
 |
  1.6e+08 ++                                                               =
 |
  1.4e+08 ++                                                               =
 |
          |                                                                =
 |
  1.2e+08 ++                                                               =
 |
    1e+08 ++                                                               =
 |
          |                                                                =
 |
    8e+07 *+*.*..*.*.*.*.*..*.*.*.*.*..*.*.*.*.*..*.*.*.*.*..*.*.*.*.*     =
 |
    6e+07 ++---------------------------------------------------------------=
-+


                          time.involuntary_context_switches

  7e+07 ++-----------------------------------------------------------------=
-+
        | O                                                                =
 |
  6e+07 O+                                                                 =
 |
        |    O O O          O  O O O    O      O O O O  O O O O  O O O O  O=
 |
        |          O  O O O               O O                              =
 |
  5e+07 ++                           O                                     =
 O
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
  2e+07 ++                       *                                         =
 |
        |.*.. .*.          .*.. + +    .*.*.*..*.*.    .*. .*.  .*.*.      =
 |
  1e+07 *+---*---*-*--*-*-*----*---*-*-------------*-*----*---*------*-----=
-+


                             time.file_system_outputs

  220 ++-------------------------------------------------------------------=
-+
  210 *+  .*.    .*. .*.. .*.*..*.*.*..*.*.*..*.                    .*     =
 |
      | *.   *.*.   *    *                      *.*..*.*.*..*.*.*..*       =
 |
  200 ++                                                                   =
 |
  190 ++                                                                   =
 |
      |                                                                    =
 |
  180 ++                                                                   =
 |
  170 ++                                                                   =
 |
  160 ++          O   O  O O O  O O O  O O O  O O O  O O O  O O O  O   O   =
 |
      |                                                                    =
 |
  150 O+O  O O O    O                                                O    O=
 |
  140 ++                                                                   =
 |
      |                                                                    =
 |
  130 ++                                                                   =
 |
  120 ++-------------------------------------------------------------------=
-O


                                  vmstat.system.in

  80000 ++-----------------------------------------------------------------=
-+
        O O                                                                =
 |
  70000 ++   O O O             O O O    O      O O O    O   O    O   O O  O=
 |
        |          O  O O O O             O O        O    O   O    O       =
 |
  60000 ++                           O                                     =
 O
        |                                                                  =
 |
  50000 ++                                                                 =
 |
        |                                                                  =
 |
  40000 ++                                                                 =
 |
        |                                                                  =
 |
  30000 ++                                                                 =
 |
        |                                                                  =
 |
  20000 *+*..*.*.*.*..*.*.*.*..*.*.*.*..*.*.*..*.*.*.*..*.*.*.*..*.*.*     =
 |
        |                                                                  =
 |
  10000 ++-----------------------------------------------------------------=
-+


                                  vmstat.system.cs

  550000 ++----------------------------------------------------------------=
-+
         O O O                                 O                          O=
 |
  500000 ++     O O          O O  O O   O  O O   O O  O O O O  O O O O  O  =
 |
  450000 ++         O O  O O          O                                    =
 |
         |                                                                 =
 |
  400000 ++                                                                =
 O
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
  150000 ++*.*..*.*.*.*.. .*.*.*..*.*.*.*..*.*.*.*.  .*.*.*.*..*.*.*.*     =
 |
         *               *                         *.                      =
 |
  100000 ++----------------------------------------------------------------=
-+


                                 proc-vmstat.numa_hit

  9.5e+06 ++---------------------------------------------------------------=
-+
          |                    .*.*.  .*. .*. .*..                         =
 |
    9e+06 *+ .*..   .*. .*.. .*     *.   *   *    *. .*.*.          .*     =
 |
  8.5e+06 ++*    *.*   *    *                       *     *..*.*.*.*       =
 |
          |                                                                =
 |
    8e+06 ++                                                               =
 |
  7.5e+06 ++                                                               =
 |
          |                                                                =
 |
    7e+06 ++         O   O  O O O O O  O O O O O  O O O O O  O O O O    O  =
 |
  6.5e+06 O+O O  O O   O                                             O    O=
 |
          |                                                                =
 |
    6e+06 ++                                                               =
 |
  5.5e+06 ++                                                               =
 |
          |                                                                =
 O
    5e+06 ++---------------------------------------------------------------=
-+


                                proc-vmstat.numa_local

  9.5e+06 ++---------------------------------------------------------------=
-+
          |                    .*.*.  .*. .*. .*..                         =
 |
    9e+06 *+ .*..   .*. .*.. .*     *.   *   *    *. .*.*.          .*     =
 |
  8.5e+06 ++*    *.*   *    *                       *     *..*.*.*.*       =
 |
          |                                                                =
 |
    8e+06 ++                                                               =
 |
  7.5e+06 ++                                                               =
 |
          |                                                                =
 |
    7e+06 ++         O   O  O O O O O  O O O O O  O O O O O  O O O O    O  =
 |
  6.5e+06 O+O O  O O   O                                             O    O=
 |
          |                                                                =
 |
    6e+06 ++                                                               =
 |
  5.5e+06 ++                                                               =
 |
          |                                                                =
 O
    5e+06 ++---------------------------------------------------------------=
-+


                               proc-vmstat.pgalloc_dma32

  7.5e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    7e+06 *+ .*..   .*. .*..   .*.*.*..*.*.*.*.*..     .*.          .*     =
 |
          | *    *.*   *     .*                   *.*.*   *..*.*. .*       =
 |
  6.5e+06 ++                *                                    *         =
 |
          |                                                                =
 |
    6e+06 ++                                                               =
 |
          |                                                                =
 |
  5.5e+06 ++         O   O  O O O O O  O O O O O    O O O O  O O O O    O  =
 |
          O O      O   O                          O                  O    O=
 |
    5e+06 ++  O  O                                                         =
 |
          |                                                                =
 |
  4.5e+06 ++                                                               =
 |
          |                                                                =
 O
    4e+06 ++---------------------------------------------------------------=
-+


                              proc-vmstat.pgalloc_normal

  6.5e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    6e+06 *+ .*..    *         .*.*.*..*. .*.*.*..                  .*     =
 |
          | *       + + .*.. .*          *        *.*.*.*.*..*.*. .*       =
 |
          |      *.*   *    *                                    *         =
 |
  5.5e+06 ++                                                               =
 |
          |                                                                =
 |
    5e+06 ++                                                               =
 |
          |                   O   O    O   O   O    O O      O O           =
 |
  4.5e+06 ++O      O O   O  O   O   O    O   O    O     O O      O O    O O=
 |
          O   O  O     O                                             O     =
 |
          |                                                                =
 |
    4e+06 ++                                                               =
 |
          |                                                                =
 |
  3.5e+06 ++---------------------------------------------------------------=
-O


                                  proc-vmstat.pgfree

  1.4e+07 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  1.3e+07 *+         *. .*..   .*.*.*..*. .*.*.*..     .*.          .*     =
 |
          | *.*..*. +  *     .*          *        *.*.*   *..*.*. .*       =
 |
  1.2e+07 ++       *        *                                    *         =
 |
          |                                                                =
 |
  1.1e+07 ++                                                               =
 |
          |                                                                =
 |
    1e+07 ++         O   O  O O O O O  O O O O O  O O O O O  O O O O    O  =
 |
          O O O  O O   O                                             O    O=
 |
    9e+06 ++                                                               =
 |
          |                                                                =
 |
    8e+06 ++                                                               =
 |
          |                                                                =
 O
    7e+06 ++---------------------------------------------------------------=
-+


                                  proc-vmstat.pgfault

  8.5e+06 ++---------------------------------------------------------------=
-+
          |                        .*..                                    =
 |
    8e+06 *+ .*..   .*. .*.. .*.*.*    *.*.*.*.*..   .*.*.    .*.   .*     =
 |
  7.5e+06 ++*    *.*   *    *                     *.*     *..*   *.*       =
 |
          |                                                                =
 |
    7e+06 ++                                                               =
 |
          |                                                                =
 |
  6.5e+06 ++                                                               =
 |
          |                   O                                            =
 |
    6e+06 ++         O   O  O   O O O  O O O O O  O O O O O  O O O O    O  =
 |
  5.5e+06 O+O O  O O   O                                             O    O=
 |
          |                                                                =
 |
    5e+06 ++                                                               =
 |
          |                                                                =
 O
  4.5e+06 ++---------------------------------------------------------------=
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

--===============0227001099083063040==
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
LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogZWRlMzYxMzNk
YmExYjUyOWQyY2QxZGFjNWVmYjNhYzYzYTdmNDVlYgptb2RlbDogV2VzdG1lcmUKbWVtb3J5OiA2
Rwpucl9oZGRfcGFydGl0aW9uczogMQpoZGRfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9h
dGEtQVRBUElfaUhFUzIwOF8yXzM3ODIyMDgwMTdfMjUwOTE1NDA0Igpzd2FwX3BhcnRpdGlvbnM6
IApyb290ZnNfcGFydGl0aW9uOiAKbmV0Y29uc29sZV9wb3J0OiA2NjY3CmNhdGVnb3J5OiBiZW5j
aG1hcmsKbnJfdGhyZWFkczogMTYwMCUKcGVyZi1wcm9maWxlOgogIGZyZXE6IDgwMApoYWNrYmVu
Y2g6CiAgbW9kZTogcHJvY2VzcwogIGlwYzogc29ja2V0CnF1ZXVlOiBjeWNsaWMKdGVzdGJveDog
d3NtCnRib3hfZ3JvdXA6IHdzbQprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIw
MTUtMTEtMDYgMTU6NDA6MzMuNDU3OTg4MzE5ICswODowMAppZDogNjA3NzQyNjdhZWVjMDJhMmJh
YTE1ZWEyNDkzMzQ1NDc5ZmRhMjAzMQp1c2VyOiBsa3AKY29tcGlsZXI6IGdjYy00LjkKaGVhZF9j
b21taXQ6IGVkZTM2MTMzZGJhMWI1MjlkMmNkMWRhYzVlZmIzYWM2M2E3ZjQ1ZWIKYmFzZV9jb21t
aXQ6IDZhMTNmZWI5YzgyODAzZTJiODE1ZWNhNzJmYTdhOWY1NTYxZDc4NjEKYnJhbmNoOiBsaW51
eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNTExMDcwMQprZXJuZWw6ICIvcGtnL2xpbnV4L3g4Nl82
NC1yaGVsL2djYy00LjkvZWRlMzYxMzNkYmExYjUyOWQyY2QxZGFjNWVmYjNhYzYzYTdmNDVlYi92
bWxpbnV6LTQuMy4wLWJvY2hzLXZpcnRpby1ncHUtd2wtYXRoLTEzMTE2LWdlZGUzNjEzIgpyb290
ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L2hh
Y2tiZW5jaC9wZXJmb3JtYW5jZS0xNjAwJS1wcm9jZXNzLXNvY2tldC93c20vZGViaWFuLXg4Nl82
NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45L2VkZTM2MTMzZGJhMWI1MjlkMmNk
MWRhYzVlZmIzYWM2M2E3ZjQ1ZWIvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC93c20vY3lj
bGljX2hhY2tiZW5jaC1wZXJmb3JtYW5jZS0xNjAwJS1wcm9jZXNzLXNvY2tldC14ODZfNjQtcmhl
bC1DWUNMSUNfSEVBRC1lZGUzNjEzM2RiYTFiNTI5ZDJjZDFkYWM1ZWZiM2FjNjNhN2Y0NWViLTIw
MTUxMTA2LTYxODUtMW81NTVjby0wLnlhbWwiCmRlcXVldWVfdGltZTogMjAxNS0xMS0wNyAwNzox
NDo0Ny45MDcyMDExNTcgKzA4OjAwCm5yX2NwdTogIiQobnByb2MpIgptYXhfdXB0aW1lOiAyNDAw
CmluaXRyZDogIi9vc2ltYWdlL2RlYmlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpi
b290bG9hZGVyX2FwcGVuZDoKLSByb290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Av
c2NoZWR1bGVkL3dzbS9jeWNsaWNfaGFja2JlbmNoLXBlcmZvcm1hbmNlLTE2MDAlLXByb2Nlc3Mt
c29ja2V0LXg4Nl82NC1yaGVsLUNZQ0xJQ19IRUFELWVkZTM2MTMzZGJhMWI1MjlkMmNkMWRhYzVl
ZmIzYWM2M2E3ZjQ1ZWItMjAxNTExMDYtNjE4NS0xbzU1NWNvLTAueWFtbAotIEFSQ0g9eDg2XzY0
Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD1saW51eC1kZXZlbC9kZXZlbC1ob3VybHkt
MjAxNTExMDcwMQotIGNvbW1pdD1lZGUzNjEzM2RiYTFiNTI5ZDJjZDFkYWM1ZWZiM2FjNjNhN2Y0
NWViCi0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvZWRlMzYxMzNk
YmExYjUyOWQyY2QxZGFjNWVmYjNhYzYzYTdmNDVlYi92bWxpbnV6LTQuMy4wLWJvY2hzLXZpcnRp
by1ncHUtd2wtYXRoLTEzMTE2LWdlZGUzNjEzCi0gbWF4X3VwdGltZT0yNDAwCi0gUkVTVUxUX1JP
T1Q9L3Jlc3VsdC9oYWNrYmVuY2gvcGVyZm9ybWFuY2UtMTYwMCUtcHJvY2Vzcy1zb2NrZXQvd3Nt
L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS9lZGUzNjEz
M2RiYTFiNTI5ZDJjZDFkYWM1ZWZiM2FjNjNhN2Y0NWViLzAKLSBMS1BfU0VSVkVSPWlubgotIHwy
LQoKCiAgZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIHN5c3RlbWQubG9nX2xldmVsPWVycgogIGRl
YnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9zdGFs
bF90aW1lb3V0PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hkb2c9
cGFuaWMgb29wcz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29uc29s
ZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwKCiAgcncKbGtwX2luaXRyZDog
Ii9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2luaXRyZDogIi9wa2cvbGludXgveDg2
XzY0LXJoZWwvZ2NjLTQuOS9lZGUzNjEzM2RiYTFiNTI5ZDJjZDFkYWM1ZWZiM2FjNjNhN2Y0NWVi
L21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAx
NS0wMi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3ovcnVuLWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3ovdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvdHVyYm9zdGF0LmNneiIKam9i
X3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiAxMjE2Ljg4IDEwODMuMzUgNjA4LjAwIDEvMTg4IDE5
Mjk0CnN0YXJ0X3RpbWU6ICcxNDQ2ODUxNzE1JwplbmRfdGltZTogJzE0NDY4NTIzMzMnCnZlcnNp
b246ICIvbGtwL2xrcC8uc3JjLTIwMTUxMTA2LTE5MDAyMSIK

--===============0227001099083063040==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgovdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMTkyIC0tcHJvY2Vz
cyAtbCAxODc1Ci91c3IvYmluL2hhY2tiZW5jaCAtZyAxOTIgLS1wcm9jZXNzIC1sIDE4NzUKL3Vz
ci9iaW4vaGFja2JlbmNoIC1nIDE5MiAtLXByb2Nlc3MgLWwgMTg3NQovdXNyL2Jpbi9oYWNrYmVu
Y2ggLWcgMTkyIC0tcHJvY2VzcyAtbCAxODc1Ci91c3IvYmluL2hhY2tiZW5jaCAtZyAxOTIgLS1w
cm9jZXNzIC1sIDE4NzUKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE5MiAtLXByb2Nlc3MgLWwgMTg3
NQovdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMTkyIC0tcHJvY2VzcyAtbCAxODc1Ci91c3IvYmluL2hh
Y2tiZW5jaCAtZyAxOTIgLS1wcm9jZXNzIC1sIDE4NzUKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE5
MiAtLXByb2Nlc3MgLWwgMTg3NQovdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMTkyIC0tcHJvY2VzcyAt
bCAxODc1Ci91c3IvYmluL2hhY2tiZW5jaCAtZyAxOTIgLS1wcm9jZXNzIC1sIDE4NzUKL3Vzci9i
aW4vaGFja2JlbmNoIC1nIDE5MiAtLXByb2Nlc3MgLWwgMTg3NQovdXNyL2Jpbi9oYWNrYmVuY2gg
LWcgMTkyIC0tcHJvY2VzcyAtbCAxODc1Ci91c3IvYmluL2hhY2tiZW5jaCAtZyAxOTIgLS1wcm9j
ZXNzIC1sIDE4NzUKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE5MiAtLXByb2Nlc3MgLWwgMTg3NQov
dXNyL2Jpbi9oYWNrYmVuY2ggLWcgMTkyIC0tcHJvY2VzcyAtbCAxODc1Ci91c3IvYmluL2hhY2ti
ZW5jaCAtZyAxOTIgLS1wcm9jZXNzIC1sIDE4NzUKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE5MiAt
LXByb2Nlc3MgLWwgMTg3NQovdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMTkyIC0tcHJvY2VzcyAtbCAx
ODc1Cg==

--===============0227001099083063040==--

