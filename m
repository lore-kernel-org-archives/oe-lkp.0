Content-Type: multipart/mixed; boundary="===============7887592675321010309=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [sched/fair] 0905f04eb2: 39.4% aim9.fork_test.ops_per_sec
Date: Mon, 11 Jan 2016 11:21:01 +0800
Message-ID: <8760z094yq.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7887592675321010309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
commit 0905f04eb21fc1c2e690bed5d0418a061d56c225 ("sched/fair: Fix new task'=
s load avg removed from source CPU in wake_up_new_task()")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/testtime:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lkp-wsx02/fo=
rk_test/aim9/300s

commit: =

  5a1078043f844074cbd53981432778a8d5dd56e9
  0905f04eb21fc1c2e690bed5d0418a061d56c225

5a1078043f844074 0905f04eb21fc1c2e690bed5d0 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      1739 =C2=B1  0%     +39.4%       2424 =C2=B1  0%  aim9.fork_test.ops_=
per_sec
  17399962 =C2=B1  1%     +42.1%   24732114 =C2=B1  0%  aim9.time.minor_pag=
e_faults
    104.00 =C2=B1  0%     -13.0%      90.50 =C2=B1  0%  aim9.time.percent_o=
f_cpu_this_job_got
    303.61 =C2=B1  0%     -12.4%     266.07 =C2=B1  0%  aim9.time.system_ti=
me
   1043745 =C2=B1  0%     +39.4%    1454681 =C2=B1  0%  aim9.time.voluntary=
_context_switches
  18710682 =C2=B1 98%     +73.3%   32430268 =C2=B1149%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
     15163 =C2=B1  0%     -10.1%      13630 =C2=B1  0%  vmstat.system.cs
      1689 =C2=B1  0%      +7.9%       1822 =C2=B1  2%  vmstat.system.in
    103142 =C2=B1  1%    +125.8%     232931 =C2=B1  3%  meminfo.Committed_AS
      9398 =C2=B1  1%     -32.9%       6304 =C2=B1  2%  meminfo.PageTables
    108106 =C2=B1  0%     +16.6%     126062 =C2=B1  0%  meminfo.SUnreclaim
    162111 =C2=B1  0%     +10.9%     179859 =C2=B1  0%  meminfo.Slab
      1.41 =C2=B1  0%     -10.0%       1.27 =C2=B1  1%  turbostat.%Busy
      1407 =C2=B1  0%     +13.1%       1591 =C2=B1  0%  turbostat.Bzy_MHz
      3.03 =C2=B1  0%    +377.1%      14.46 =C2=B1  5%  turbostat.CPU%c1
      0.28 =C2=B1 17%   +2274.7%       6.57 =C2=B1  9%  turbostat.CPU%c3
     95.28 =C2=B1  0%     -18.4%      77.70 =C2=B1  1%  turbostat.CPU%c6
    633.33 =C2=B1  1%     +39.7%     885.00 =C2=B1  5%  time.involuntary_co=
ntext_switches
  17399962 =C2=B1  1%     +42.1%   24732114 =C2=B1  0%  time.minor_page_fau=
lts
    104.00 =C2=B1  0%     -13.0%      90.50 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
    303.61 =C2=B1  0%     -12.4%     266.07 =C2=B1  0%  time.system_time
      9.03 =C2=B1  0%     -19.0%       7.32 =C2=B1  1%  time.user_time
   1043745 =C2=B1  0%     +39.4%    1454681 =C2=B1  0%  time.voluntary_cont=
ext_switches
   4341217 =C2=B1  1%     +51.5%    6578957 =C2=B1 17%  numa-numastat.node0=
.local_node
   4344815 =C2=B1  1%     +51.5%    6582928 =C2=B1 17%  numa-numastat.node0=
.numa_hit
   4523191 =C2=B1  3%     +30.9%    5919318 =C2=B1 15%  numa-numastat.node1=
.local_node
   4528412 =C2=B1  3%     +30.8%    5924519 =C2=B1 15%  numa-numastat.node1=
.numa_hit
   4630005 =C2=B1  1%     +42.1%    6577143 =C2=B1  8%  numa-numastat.node2=
.local_node
   4633468 =C2=B1  1%     +42.0%    6580953 =C2=B1  8%  numa-numastat.node2=
.numa_hit
   4383136 =C2=B1  4%     +33.8%    5862523 =C2=B1 11%  numa-numastat.node3=
.local_node
   4386538 =C2=B1  4%     +33.7%    5865077 =C2=B1 11%  numa-numastat.node3=
.numa_hit
      2345 =C2=B1  1%     -33.0%       1572 =C2=B1  1%  proc-vmstat.nr_page=
_table_pages
     27026 =C2=B1  0%     +16.6%      31508 =C2=B1  0%  proc-vmstat.nr_slab=
_unreclaimable
  17902669 =C2=B1  2%     +39.3%   24946551 =C2=B1  2%  proc-vmstat.numa_hit
  17887297 =C2=B1  2%     +39.4%   24931202 =C2=B1  2%  proc-vmstat.numa_lo=
cal
     15710 =C2=B1  0%     +33.2%      20925 =C2=B1  1%  proc-vmstat.pgactiv=
ate
    476249 =C2=B1  1%     +34.9%     642545 =C2=B1 18%  proc-vmstat.pgalloc=
_dma32
  19039889 =C2=B1  2%     +41.1%   26871442 =C2=B1  1%  proc-vmstat.pgalloc=
_normal
  18158625 =C2=B1  1%     +40.3%   25475877 =C2=B1  0%  proc-vmstat.pgfault
  19506513 =C2=B1  1%     +41.0%   27494955 =C2=B1  1%  proc-vmstat.pgfree
  10217127 =C2=B1 21%    +320.7%   42984841 =C2=B1 28%  cpuidle.C1-NHM.time
    201675 =C2=B1  4%      +7.3%     216493 =C2=B1  7%  cpuidle.C1-NHM.usage
    747167 =C2=B1 97%    +2e+05%  1.531e+09 =C2=B1  6%  cpuidle.C1E-NHM.time
    579.00 =C2=B1 13%   +2696.7%      16192 =C2=B1 10%  cpuidle.C1E-NHM.usa=
ge
  36763837 =C2=B1 16%   +5807.3%  2.172e+09 =C2=B1  5%  cpuidle.C3-NHM.time
      8249 =C2=B1  6%  +13639.0%    1133329 =C2=B1  1%  cpuidle.C3-NHM.usage
 2.375e+10 =C2=B1  0%     -15.6%  2.005e+10 =C2=B1  1%  cpuidle.C6-NHM.time
   4025921 =C2=B1  0%     -69.6%    1225665 =C2=B1  2%  cpuidle.C6-NHM.usage
    396842 =C2=B1 83%    +774.0%    3468403 =C2=B1 57%  cpuidle.POLL.time
     31.00 =C2=B1 13%   +1184.7%     398.25 =C2=B1 11%  cpuidle.POLL.usage
      0.57 =C2=B1  6%     +76.3%       1.00 =C2=B1 24%  perf-profile.cycles=
-pp.__remove_hrtimer.hrtimer_start_range_ns.tick_nohz_stop_sched_tick.__tic=
k_nohz_idle_enter.tick_nohz_idle_enter
      1.47 =C2=B1  8%     +67.5%       2.46 =C2=B1 21%  perf-profile.cycles=
-pp.__tick_nohz_idle_enter.tick_nohz_idle_enter.cpu_startup_entry.start_sec=
ondary
      1.13 =C2=B1  3%     +42.7%       1.61 =C2=B1  3%  perf-profile.cycles=
-pp.do_wait.sys_wait4.entry_SYSCALL_64_fastpath
      1.07 =C2=B1  3%     -49.2%       0.55 =C2=B1  2%  perf-profile.cycles=
-pp.hrtimer_start_range_ns.tick_nohz_restart.tick_nohz_idle_exit.cpu_startu=
p_entry.start_secondary
      1.11 =C2=B1  9%     +74.8%       1.94 =C2=B1 22%  perf-profile.cycles=
-pp.hrtimer_start_range_ns.tick_nohz_stop_sched_tick.__tick_nohz_idle_enter=
.tick_nohz_idle_enter.cpu_startup_entry
      2.79 =C2=B1  7%     -30.4%       1.94 =C2=B1 12%  perf-profile.cycles=
-pp.kthread.ret_from_fork
      0.76 =C2=B1  8%     +27.3%       0.97 =C2=B1  9%  perf-profile.cycles=
-pp.native_apic_msr_write.lapic_next_event.clockevents_program_event.tick_p=
rogram_event.__remove_hrtimer
      1.25 =C2=B1  5%     -18.4%       1.02 =C2=B1 14%  perf-profile.cycles=
-pp.native_apic_msr_write.lapic_next_event.clockevents_program_event.tick_p=
rogram_event.hrtimer_start_range_ns
      1.39 =C2=B1  5%     -65.8%       0.48 =C2=B1 10%  perf-profile.cycles=
-pp.rcu_nocb_kthread.kthread.ret_from_fork
      2.85 =C2=B1  7%     -26.4%       2.10 =C2=B1 15%  perf-profile.cycles=
-pp.ret_from_fork
      1.17 =C2=B1  3%     +42.1%       1.67 =C2=B1  4%  perf-profile.cycles=
-pp.sys_wait4.entry_SYSCALL_64_fastpath
      1.54 =C2=B1  8%     +65.2%       2.55 =C2=B1 21%  perf-profile.cycles=
-pp.tick_nohz_idle_enter.cpu_startup_entry.start_secondary
      2.17 =C2=B1  3%     -42.6%       1.25 =C2=B1  7%  perf-profile.cycles=
-pp.tick_nohz_idle_exit.cpu_startup_entry.start_secondary
      1.79 =C2=B1  3%     -43.5%       1.01 =C2=B1  7%  perf-profile.cycles=
-pp.tick_nohz_restart.tick_nohz_idle_exit.cpu_startup_entry.start_secondary
      1.33 =C2=B1  8%     +71.7%       2.28 =C2=B1 21%  perf-profile.cycles=
-pp.tick_nohz_stop_sched_tick.__tick_nohz_idle_enter.tick_nohz_idle_enter.c=
pu_startup_entry.start_secondary
      1.06 =C2=B1  3%     -66.5%       0.36 =C2=B1 27%  perf-profile.cycles=
-pp.wake_up_new_task._do_fork.sys_clone.entry_SYSCALL_64_fastpath
      0.79 =C2=B1  6%     +73.9%       1.38 =C2=B1 19%  perf-profile.cycles=
-pp.wp_page_copy.isra.58.do_wp_page.handle_mm_fault.__do_page_fault.do_page=
_fault
     36780 =C2=B1 13%     +21.9%      44843 =C2=B1 13%  numa-meminfo.node0.=
Active
     29309 =C2=B1  4%     +12.0%      32825 =C2=B1  3%  numa-meminfo.node0.=
Active(file)
     28983 =C2=B1  8%     +18.2%      34260 =C2=B1  4%  numa-meminfo.node0.=
SUnreclaim
     42937 =C2=B1  2%     +11.4%      47837 =C2=B1  4%  numa-meminfo.node0.=
Slab
     31615 =C2=B1  2%      +7.0%      33821 =C2=B1  4%  numa-meminfo.node1.=
Active(file)
      2879 =C2=B1  0%    +101.1%       5790 =C2=B1 49%  numa-meminfo.node1.=
Mapped
      2589 =C2=B1  1%     -49.9%       1296 =C2=B1 20%  numa-meminfo.node1.=
PageTables
     11730 =C2=B1  7%      +8.8%      12767 =C2=B1  5%  numa-meminfo.node1.=
SReclaimable
     25238 =C2=B1  4%     +16.2%      29315 =C2=B1  5%  numa-meminfo.node1.=
SUnreclaim
    640.67 =C2=B1 14%   +1015.7%       7147 =C2=B1 65%  numa-meminfo.node1.=
Shmem
     36969 =C2=B1  3%     +13.8%      42083 =C2=B1  3%  numa-meminfo.node1.=
Slab
     30131 =C2=B1  5%     +14.3%      34448 =C2=B1  8%  numa-meminfo.node2.=
Active(file)
     12273 =C2=B1 27%     -39.7%       7404 =C2=B1 37%  numa-meminfo.node2.=
AnonPages
      2791 =C2=B1  6%     +10.0%       3071 =C2=B1  7%  numa-meminfo.node2.=
KernelStack
      2580 =C2=B1 12%     -36.9%       1626 =C2=B1  6%  numa-meminfo.node2.=
PageTables
     25301 =C2=B1 10%     +28.9%      32605 =C2=B1  7%  numa-meminfo.node2.=
SUnreclaim
     38896 =C2=B1  7%     +19.4%      46436 =C2=B1  7%  numa-meminfo.node2.=
Slab
      2315 =C2=B1 13%     -39.2%       1408 =C2=B1 21%  numa-meminfo.node3.=
PageTables
      7327 =C2=B1  4%     +12.0%       8206 =C2=B1  3%  numa-vmstat.node0.n=
r_active_file
      7245 =C2=B1  8%     +18.2%       8563 =C2=B1  4%  numa-vmstat.node0.n=
r_slab_unreclaimable
   2242326 =C2=B1  1%     +51.7%    3400847 =C2=B1 20%  numa-vmstat.node0.n=
uma_hit
   2204297 =C2=B1  1%     +52.5%    3362177 =C2=B1 21%  numa-vmstat.node0.n=
uma_local
    719.33 =C2=B1  0%    +101.2%       1447 =C2=B1 49%  numa-vmstat.node1.n=
r_mapped
    642.33 =C2=B1  0%     -49.7%     323.00 =C2=B1 21%  numa-vmstat.node1.n=
r_page_table_pages
    159.67 =C2=B1 14%   +1018.9%       1786 =C2=B1 65%  numa-vmstat.node1.n=
r_shmem
      2932 =C2=B1  7%      +8.8%       3191 =C2=B1  5%  numa-vmstat.node1.n=
r_slab_reclaimable
      6309 =C2=B1  4%     +16.1%       7327 =C2=B1  5%  numa-vmstat.node1.n=
r_slab_unreclaimable
      7532 =C2=B1  5%     +14.3%       8611 =C2=B1  8%  numa-vmstat.node2.n=
r_active_file
      3067 =C2=B1 27%     -39.6%       1851 =C2=B1 38%  numa-vmstat.node2.n=
r_anon_pages
    642.00 =C2=B1 12%     -37.4%     401.75 =C2=B1  6%  numa-vmstat.node2.n=
r_page_table_pages
      6325 =C2=B1 10%     +28.9%       8151 =C2=B1  7%  numa-vmstat.node2.n=
r_slab_unreclaimable
   2421938 =C2=B1  0%     +42.3%    3446023 =C2=B1  8%  numa-vmstat.node2.n=
uma_hit
   2402714 =C2=B1  0%     +42.6%    3425692 =C2=B1  8%  numa-vmstat.node2.n=
uma_local
    575.00 =C2=B1 13%     -39.7%     346.75 =C2=B1 21%  numa-vmstat.node3.n=
r_page_table_pages
   2282593 =C2=B1  5%     +28.0%    2921202 =C2=B1  7%  numa-vmstat.node3.n=
uma_hit
   2232147 =C2=B1  5%     +28.7%    2872288 =C2=B1  8%  numa-vmstat.node3.n=
uma_local
      6296 =C2=B1  0%    +197.7%      18745 =C2=B1  3%  slabinfo.kmalloc-12=
8.active_objs
    196.00 =C2=B1  0%    +204.1%     596.00 =C2=B1  3%  slabinfo.kmalloc-12=
8.active_slabs
      6296 =C2=B1  0%    +203.3%      19095 =C2=B1  3%  slabinfo.kmalloc-12=
8.num_objs
    196.00 =C2=B1  0%    +204.1%     596.00 =C2=B1  3%  slabinfo.kmalloc-12=
8.num_slabs
     10097 =C2=B1  7%    +182.4%      28516 =C2=B1  3%  slabinfo.kmalloc-19=
2.active_objs
    240.33 =C2=B1  6%    +187.0%     689.75 =C2=B1  3%  slabinfo.kmalloc-19=
2.active_slabs
     10121 =C2=B1  7%    +186.4%      28993 =C2=B1  3%  slabinfo.kmalloc-19=
2.num_objs
    240.33 =C2=B1  6%    +187.0%     689.75 =C2=B1  3%  slabinfo.kmalloc-19=
2.num_slabs
     23080 =C2=B1  0%     +32.2%      30520 =C2=B1  6%  slabinfo.kmalloc-32=
.active_objs
     23080 =C2=B1  0%     +32.2%      30520 =C2=B1  6%  slabinfo.kmalloc-32=
.num_objs
     45611 =C2=B1  0%     +93.5%      88280 =C2=B1  1%  slabinfo.kmalloc-64=
.active_objs
    712.33 =C2=B1  0%     +95.1%       1389 =C2=B1  1%  slabinfo.kmalloc-64=
.active_slabs
     45611 =C2=B1  0%     +95.1%      88969 =C2=B1  1%  slabinfo.kmalloc-64=
.num_objs
    712.33 =C2=B1  0%     +95.1%       1389 =C2=B1  1%  slabinfo.kmalloc-64=
.num_slabs
      1713 =C2=B1  3%    +248.7%       5975 =C2=B1  2%  slabinfo.mm_struct.=
active_objs
    100.33 =C2=B1  3%    +263.8%     365.00 =C2=B1  2%  slabinfo.mm_struct.=
active_slabs
      1713 =C2=B1  3%    +262.3%       6208 =C2=B1  2%  slabinfo.mm_struct.=
num_objs
    100.33 =C2=B1  3%    +263.8%     365.00 =C2=B1  2%  slabinfo.mm_struct.=
num_slabs
      3479 =C2=B1  1%     +83.1%       6370 =C2=B1  2%  slabinfo.signal_cac=
he.active_objs
    116.00 =C2=B1  2%     +94.0%     225.00 =C2=B1  2%  slabinfo.signal_cac=
he.active_slabs
      3496 =C2=B1  2%     +93.6%       6768 =C2=B1  2%  slabinfo.signal_cac=
he.num_objs
    116.00 =C2=B1  2%     +94.0%     225.00 =C2=B1  2%  slabinfo.signal_cac=
he.num_slabs
     32431 =C2=B1  1%     -32.2%      22004 =C2=B1  3%  slabinfo.vm_area_st=
ruct.active_objs
    738.00 =C2=B1  1%     -32.3%     499.50 =C2=B1  3%  slabinfo.vm_area_st=
ruct.active_slabs
     32489 =C2=B1  1%     -32.3%      22004 =C2=B1  3%  slabinfo.vm_area_st=
ruct.num_objs
    738.00 =C2=B1  1%     -32.3%     499.50 =C2=B1  3%  slabinfo.vm_area_st=
ruct.num_slabs
    444.41 =C2=B1 31%     -73.9%     115.83 =C2=B1 75%  sched_debug.cfs_rq:=
/.MIN_vruntime.avg
     25025 =C2=B1 36%     -66.7%       8323 =C2=B1 82%  sched_debug.cfs_rq:=
/.MIN_vruntime.max
      3207 =C2=B1 33%     -70.5%     946.53 =C2=B1 80%  sched_debug.cfs_rq:=
/.MIN_vruntime.stddev
      3624 =C2=B1  3%     -28.7%       2586 =C2=B1  3%  sched_debug.cfs_rq:=
/.exec_clock.11
      4092 =C2=B1  1%     -39.1%       2492 =C2=B1 16%  sched_debug.cfs_rq:=
/.exec_clock.12
      3774 =C2=B1  4%     -35.2%       2445 =C2=B1 11%  sched_debug.cfs_rq:=
/.exec_clock.14
      3681 =C2=B1  3%     -42.2%       2128 =C2=B1 21%  sched_debug.cfs_rq:=
/.exec_clock.15
      3874 =C2=B1  3%     -31.4%       2659 =C2=B1 25%  sched_debug.cfs_rq:=
/.exec_clock.18
      3807 =C2=B1  5%     -34.0%       2514 =C2=B1 35%  sched_debug.cfs_rq:=
/.exec_clock.19
      3750 =C2=B1  5%     -36.0%       2400 =C2=B1  3%  sched_debug.cfs_rq:=
/.exec_clock.31
      1944 =C2=B1  1%     -31.2%       1338 =C2=B1 24%  sched_debug.cfs_rq:=
/.exec_clock.32
      1732 =C2=B1  3%     -32.6%       1166 =C2=B1 20%  sched_debug.cfs_rq:=
/.exec_clock.33
      2355 =C2=B1 25%     -50.0%       1178 =C2=B1 18%  sched_debug.cfs_rq:=
/.exec_clock.34
      2078 =C2=B1  7%     -57.8%     876.61 =C2=B1 21%  sched_debug.cfs_rq:=
/.exec_clock.35
      2043 =C2=B1  4%     -57.1%     876.85 =C2=B1  9%  sched_debug.cfs_rq:=
/.exec_clock.36
      1767 =C2=B1  6%     -41.9%       1026 =C2=B1 13%  sched_debug.cfs_rq:=
/.exec_clock.37
      1963 =C2=B1  6%     -45.6%       1067 =C2=B1 26%  sched_debug.cfs_rq:=
/.exec_clock.38
      1899 =C2=B1  4%     -56.1%     832.82 =C2=B1 23%  sched_debug.cfs_rq:=
/.exec_clock.39
      1954 =C2=B1  5%     -47.5%       1026 =C2=B1 32%  sched_debug.cfs_rq:=
/.exec_clock.40
      2627 =C2=B1 49%     -62.2%     994.16 =C2=B1 11%  sched_debug.cfs_rq:=
/.exec_clock.41
      1968 =C2=B1  8%     -47.4%       1036 =C2=B1 25%  sched_debug.cfs_rq:=
/.exec_clock.42
      1906 =C2=B1  2%     -57.3%     814.34 =C2=B1 24%  sched_debug.cfs_rq:=
/.exec_clock.43
      1977 =C2=B1  5%     -49.4%       1001 =C2=B1 19%  sched_debug.cfs_rq:=
/.exec_clock.44
      1945 =C2=B1  1%     -44.1%       1088 =C2=B1 25%  sched_debug.cfs_rq:=
/.exec_clock.46
      1887 =C2=B1  4%     -53.0%     886.48 =C2=B1 28%  sched_debug.cfs_rq:=
/.exec_clock.47
      1950 =C2=B1  3%     -39.9%       1172 =C2=B1 33%  sched_debug.cfs_rq:=
/.exec_clock.48
      1905 =C2=B1  3%     -46.8%       1014 =C2=B1 15%  sched_debug.cfs_rq:=
/.exec_clock.50
      1952 =C2=B1  2%     -57.2%     836.29 =C2=B1 16%  sched_debug.cfs_rq:=
/.exec_clock.51
      1933 =C2=B1  5%     -55.7%     855.98 =C2=B1 10%  sched_debug.cfs_rq:=
/.exec_clock.52
      1876 =C2=B1  3%     -44.0%       1051 =C2=B1 10%  sched_debug.cfs_rq:=
/.exec_clock.54
      1967 =C2=B1  3%     -58.8%     810.03 =C2=B1 10%  sched_debug.cfs_rq:=
/.exec_clock.55
      2000 =C2=B1  9%     -51.7%     966.11 =C2=B1 14%  sched_debug.cfs_rq:=
/.exec_clock.56
      1655 =C2=B1  3%     -37.6%       1033 =C2=B1 23%  sched_debug.cfs_rq:=
/.exec_clock.57
      1834 =C2=B1  6%     -41.6%       1071 =C2=B1 20%  sched_debug.cfs_rq:=
/.exec_clock.58
      1951 =C2=B1  4%     -52.4%     929.32 =C2=B1 20%  sched_debug.cfs_rq:=
/.exec_clock.59
      5292 =C2=B1 32%     -41.5%       3094 =C2=B1 14%  sched_debug.cfs_rq:=
/.exec_clock.6
      1930 =C2=B1  6%     -51.4%     938.42 =C2=B1 13%  sched_debug.cfs_rq:=
/.exec_clock.60
      1766 =C2=B1  2%     -38.0%       1095 =C2=B1 20%  sched_debug.cfs_rq:=
/.exec_clock.61
      1883 =C2=B1  5%     -42.9%       1075 =C2=B1 16%  sched_debug.cfs_rq:=
/.exec_clock.62
      2067 =C2=B1  4%     -53.0%     971.23 =C2=B1 34%  sched_debug.cfs_rq:=
/.exec_clock.63
      4456 =C2=B1 16%     -42.5%       2560 =C2=B1 25%  sched_debug.cfs_rq:=
/.exec_clock.68
      1979 =C2=B1  7%     -45.5%       1079 =C2=B1 21%  sched_debug.cfs_rq:=
/.exec_clock.72
      2153 =C2=B1 29%     -47.3%       1135 =C2=B1 23%  sched_debug.cfs_rq:=
/.exec_clock.73
      1884 =C2=B1  6%     -42.8%       1078 =C2=B1 11%  sched_debug.cfs_rq:=
/.exec_clock.74
      1929 =C2=B1  3%     -56.6%     836.95 =C2=B1 18%  sched_debug.cfs_rq:=
/.exec_clock.75
      1967 =C2=B1  8%     -56.2%     861.47 =C2=B1 13%  sched_debug.cfs_rq:=
/.exec_clock.76
      1847 =C2=B1  3%     -35.8%       1185 =C2=B1 27%  sched_debug.cfs_rq:=
/.exec_clock.77
      1931 =C2=B1  1%     -45.4%       1055 =C2=B1 12%  sched_debug.cfs_rq:=
/.exec_clock.78
      1932 =C2=B1  5%     -45.6%       1052 =C2=B1 14%  sched_debug.cfs_rq:=
/.exec_clock.79
      3018 =C2=B1  0%     -25.2%       2258 =C2=B1  0%  sched_debug.cfs_rq:=
/.exec_clock.avg
      1602 =C2=B1  1%     -63.4%     586.18 =C2=B1  9%  sched_debug.cfs_rq:=
/.exec_clock.min
      1426 =C2=B1  4%     +25.5%       1790 =C2=B1 11%  sched_debug.cfs_rq:=
/.exec_clock.stddev
     42.00 =C2=B1 32%     -88.7%       4.75 =C2=B1173%  sched_debug.cfs_rq:=
/.load.23
     11.93 =C2=B1 15%     -39.1%       7.26 =C2=B1 21%  sched_debug.cfs_rq:=
/.load.avg
     60.41 =C2=B1 11%     -32.1%      41.02 =C2=B1 22%  sched_debug.cfs_rq:=
/.load.stddev
      9.67 =C2=B1 17%     -35.3%       6.25 =C2=B1 30%  sched_debug.cfs_rq:=
/.load_avg.0
      9.00 =C2=B1 55%     -88.9%       1.00 =C2=B1 70%  sched_debug.cfs_rq:=
/.load_avg.10
     10.00 =C2=B1  8%     -55.0%       4.50 =C2=B1 33%  sched_debug.cfs_rq:=
/.load_avg.12
     26.67 =C2=B1101%     -88.8%       3.00 =C2=B1 62%  sched_debug.cfs_rq:=
/.load_avg.13
      5.67 =C2=B1 46%     -73.5%       1.50 =C2=B1137%  sched_debug.cfs_rq:=
/.load_avg.14
      9.67 =C2=B1 48%     -79.3%       2.00 =C2=B1 79%  sched_debug.cfs_rq:=
/.load_avg.15
     22.00 =C2=B1106%     -88.6%       2.50 =C2=B1 72%  sched_debug.cfs_rq:=
/.load_avg.17
      8.00 =C2=B1 35%     -84.4%       1.25 =C2=B1103%  sched_debug.cfs_rq:=
/.load_avg.18
      8.33 =C2=B1 29%     -85.0%       1.25 =C2=B1 34%  sched_debug.cfs_rq:=
/.load_avg.2
     66.33 =C2=B1 85%     -97.4%       1.75 =C2=B1 84%  sched_debug.cfs_rq:=
/.load_avg.22
      8.33 =C2=B1 37%     -76.0%       2.00 =C2=B1 93%  sched_debug.cfs_rq:=
/.load_avg.23
      6.00 =C2=B1 36%     -54.2%       2.75 =C2=B1 47%  sched_debug.cfs_rq:=
/.load_avg.24
     10.67 =C2=B1 38%     -78.9%       2.25 =C2=B1127%  sched_debug.cfs_rq:=
/.load_avg.26
     14.67 =C2=B1 41%     -72.7%       4.00 =C2=B1 46%  sched_debug.cfs_rq:=
/.load_avg.27
      7.67 =C2=B1 22%     -54.3%       3.50 =C2=B1 24%  sched_debug.cfs_rq:=
/.load_avg.29
      3.67 =C2=B1 64%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq:=
/.load_avg.35
      6.67 =C2=B1120%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq:=
/.load_avg.37
      9.00 =C2=B1103%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq:=
/.load_avg.39
     18.00 =C2=B1 99%     -98.6%       0.25 =C2=B1173%  sched_debug.cfs_rq:=
/.load_avg.56
     25.33 =C2=B1 96%     -95.1%       1.25 =C2=B1103%  sched_debug.cfs_rq:=
/.load_avg.6
      5.00 =C2=B1 32%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq:=
/.load_avg.63
      6.33 =C2=B1 32%     -60.5%       2.50 =C2=B1 72%  sched_debug.cfs_rq:=
/.load_avg.66
     24.33 =C2=B1 71%     -87.7%       3.00 =C2=B1 70%  sched_debug.cfs_rq:=
/.load_avg.67
     13.00 =C2=B1 28%     -65.4%       4.50 =C2=B1 50%  sched_debug.cfs_rq:=
/.load_avg.68
      8.00 =C2=B1 35%     -56.2%       3.50 =C2=B1 95%  sched_debug.cfs_rq:=
/.load_avg.69
      8.67 =C2=B1 28%     -62.5%       3.25 =C2=B1 39%  sched_debug.cfs_rq:=
/.load_avg.7
     17.67 =C2=B1  9%     -85.8%       2.50 =C2=B1 34%  sched_debug.cfs_rq:=
/.load_avg.71
      4.33 =C2=B1 60%     -88.5%       0.50 =C2=B1173%  sched_debug.cfs_rq:=
/.load_avg.75
      8.06 =C2=B1 19%     -57.1%       3.46 =C2=B1 18%  sched_debug.cfs_rq:=
/.load_avg.avg
    444.41 =C2=B1 31%     -73.9%     115.83 =C2=B1 75%  sched_debug.cfs_rq:=
/.max_vruntime.avg
     25025 =C2=B1 36%     -66.7%       8323 =C2=B1 82%  sched_debug.cfs_rq:=
/.max_vruntime.max
      3207 =C2=B1 33%     -70.5%     946.53 =C2=B1 80%  sched_debug.cfs_rq:=
/.max_vruntime.stddev
     72196 =C2=B1  5%     -36.2%      46085 =C2=B1 25%  sched_debug.cfs_rq:=
/.min_vruntime.1
     65533 =C2=B1  3%     -23.4%      50230 =C2=B1 14%  sched_debug.cfs_rq:=
/.min_vruntime.14
     59799 =C2=B1  5%     -29.2%      42364 =C2=B1 26%  sched_debug.cfs_rq:=
/.min_vruntime.15
     66772 =C2=B1  4%     -23.2%      51287 =C2=B1 22%  sched_debug.cfs_rq:=
/.min_vruntime.18
     63185 =C2=B1  1%     -25.8%      46898 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.31
     42272 =C2=B1  4%     -40.8%      25011 =C2=B1 29%  sched_debug.cfs_rq:=
/.min_vruntime.32
     43841 =C2=B1  2%     -46.5%      23463 =C2=B1 25%  sched_debug.cfs_rq:=
/.min_vruntime.33
     45148 =C2=B1  6%     -45.2%      24746 =C2=B1 20%  sched_debug.cfs_rq:=
/.min_vruntime.34
     44122 =C2=B1  5%     -57.3%      18830 =C2=B1 25%  sched_debug.cfs_rq:=
/.min_vruntime.35
     45729 =C2=B1  3%     -58.1%      19183 =C2=B1 10%  sched_debug.cfs_rq:=
/.min_vruntime.36
     43861 =C2=B1  5%     -54.3%      20042 =C2=B1 21%  sched_debug.cfs_rq:=
/.min_vruntime.37
     43136 =C2=B1  7%     -44.0%      24137 =C2=B1 26%  sched_debug.cfs_rq:=
/.min_vruntime.38
     43673 =C2=B1  6%     -60.5%      17245 =C2=B1 21%  sched_debug.cfs_rq:=
/.min_vruntime.39
     43344 =C2=B1  6%     -56.2%      18996 =C2=B1 17%  sched_debug.cfs_rq:=
/.min_vruntime.40
     42862 =C2=B1  3%     -50.9%      21046 =C2=B1 18%  sched_debug.cfs_rq:=
/.min_vruntime.41
     44210 =C2=B1  5%     -47.8%      23094 =C2=B1 24%  sched_debug.cfs_rq:=
/.min_vruntime.42
     43868 =C2=B1  4%     -62.2%      16587 =C2=B1 26%  sched_debug.cfs_rq:=
/.min_vruntime.43
     44380 =C2=B1  2%     -54.1%      20363 =C2=B1 19%  sched_debug.cfs_rq:=
/.min_vruntime.44
     44507 =C2=B1  2%     -52.2%      21290 =C2=B1 14%  sched_debug.cfs_rq:=
/.min_vruntime.45
     44889 =C2=B1  4%     -47.5%      23569 =C2=B1 27%  sched_debug.cfs_rq:=
/.min_vruntime.46
     43176 =C2=B1  3%     -53.4%      20117 =C2=B1 35%  sched_debug.cfs_rq:=
/.min_vruntime.47
     42019 =C2=B1  5%     -48.1%      21791 =C2=B1 25%  sched_debug.cfs_rq:=
/.min_vruntime.48
     42773 =C2=B1  0%     -45.2%      23430 =C2=B1 15%  sched_debug.cfs_rq:=
/.min_vruntime.49
     44212 =C2=B1  6%     -48.0%      22990 =C2=B1 16%  sched_debug.cfs_rq:=
/.min_vruntime.50
     43258 =C2=B1  5%     -56.6%      18785 =C2=B1 15%  sched_debug.cfs_rq:=
/.min_vruntime.51
     44647 =C2=B1  5%     -59.6%      18055 =C2=B1 10%  sched_debug.cfs_rq:=
/.min_vruntime.52
     42514 =C2=B1  1%     -42.7%      24340 =C2=B1 23%  sched_debug.cfs_rq:=
/.min_vruntime.53
     44244 =C2=B1  3%     -47.3%      23308 =C2=B1  9%  sched_debug.cfs_rq:=
/.min_vruntime.54
     44250 =C2=B1  7%     -62.3%      16692 =C2=B1 17%  sched_debug.cfs_rq:=
/.min_vruntime.55
     44730 =C2=B1  2%     -54.4%      20414 =C2=B1  8%  sched_debug.cfs_rq:=
/.min_vruntime.56
     41554 =C2=B1  1%     -48.1%      21548 =C2=B1 17%  sched_debug.cfs_rq:=
/.min_vruntime.57
     42974 =C2=B1  8%     -47.7%      22455 =C2=B1 21%  sched_debug.cfs_rq:=
/.min_vruntime.58
     44355 =C2=B1  4%     -57.4%      18874 =C2=B1 25%  sched_debug.cfs_rq:=
/.min_vruntime.59
     44632 =C2=B1  1%     -57.2%      19112 =C2=B1 15%  sched_debug.cfs_rq:=
/.min_vruntime.60
     43793 =C2=B1  0%     -48.8%      22424 =C2=B1 21%  sched_debug.cfs_rq:=
/.min_vruntime.61
     45066 =C2=B1  5%     -50.9%      22145 =C2=B1 14%  sched_debug.cfs_rq:=
/.min_vruntime.62
     45082 =C2=B1  9%     -53.1%      21141 =C2=B1 36%  sched_debug.cfs_rq:=
/.min_vruntime.63
     68922 =C2=B1  4%     -25.8%      51166 =C2=B1 12%  sched_debug.cfs_rq:=
/.min_vruntime.69
     43513 =C2=B1  2%     -48.8%      22283 =C2=B1 20%  sched_debug.cfs_rq:=
/.min_vruntime.72
     44410 =C2=B1  5%     -49.0%      22656 =C2=B1 25%  sched_debug.cfs_rq:=
/.min_vruntime.73
     44150 =C2=B1  7%     -44.5%      24515 =C2=B1 11%  sched_debug.cfs_rq:=
/.min_vruntime.74
     45043 =C2=B1  4%     -61.5%      17344 =C2=B1 21%  sched_debug.cfs_rq:=
/.min_vruntime.75
     45097 =C2=B1  1%     -57.6%      19123 =C2=B1 16%  sched_debug.cfs_rq:=
/.min_vruntime.76
     44819 =C2=B1  5%     -46.3%      24053 =C2=B1 28%  sched_debug.cfs_rq:=
/.min_vruntime.77
     44388 =C2=B1  6%     -49.2%      22546 =C2=B1 15%  sched_debug.cfs_rq:=
/.min_vruntime.78
     43992 =C2=B1  4%     -54.8%      19905 =C2=B1 13%  sched_debug.cfs_rq:=
/.min_vruntime.79
     54255 =C2=B1  0%     -21.8%      42425 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.avg
     78185 =C2=B1  4%     +90.7%     149136 =C2=B1 16%  sched_debug.cfs_rq:=
/.min_vruntime.max
     38604 =C2=B1  2%     -68.8%      12048 =C2=B1  8%  sched_debug.cfs_rq:=
/.min_vruntime.min
     11202 =C2=B1  1%    +165.6%      29749 =C2=B1  8%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      3.33 =C2=B1 37%     -70.0%       1.00 =C2=B1 81%  sched_debug.cfs_rq:=
/.nr_spread_over.6
      5298 =C2=B1 66%    -616.3%     -27355 =C2=B1-34%  sched_debug.cfs_rq:=
/.spread0.1
   -284.26 =C2=B1-2979%   +8342.1%     -23997 =C2=B1-54%  sched_debug.cfs_r=
q:/.spread0.12
     -3713 =C2=B1-87%    +614.9%     -26546 =C2=B1-68%  sched_debug.cfs_rq:=
/.spread0.31
    -23056 =C2=B1-14%    +116.8%     -49980 =C2=B1-32%  sched_debug.cfs_rq:=
/.spread0.33
    -21749 =C2=B1-20%    +123.9%     -48697 =C2=B1-34%  sched_debug.cfs_rq:=
/.spread0.34
    -22775 =C2=B1-17%    +139.8%     -54614 =C2=B1-34%  sched_debug.cfs_rq:=
/.spread0.35
    -21168 =C2=B1 -8%    +156.3%     -54261 =C2=B1-29%  sched_debug.cfs_rq:=
/.spread0.36
    -23036 =C2=B1 -6%    +131.8%     -53402 =C2=B1-31%  sched_debug.cfs_rq:=
/.spread0.37
    -23225 =C2=B1-15%    +142.0%     -56199 =C2=B1-29%  sched_debug.cfs_rq:=
/.spread0.39
    -23553 =C2=B1 -2%    +131.2%     -54448 =C2=B1-35%  sched_debug.cfs_rq:=
/.spread0.40
    -24036 =C2=B1-13%    +118.0%     -52398 =C2=B1-36%  sched_debug.cfs_rq:=
/.spread0.41
    -22688 =C2=B1-15%    +121.9%     -50350 =C2=B1-39%  sched_debug.cfs_rq:=
/.spread0.42
    -23029 =C2=B1-18%    +146.9%     -56857 =C2=B1-31%  sched_debug.cfs_rq:=
/.spread0.43
    -22517 =C2=B1 -6%    +135.7%     -53081 =C2=B1-27%  sched_debug.cfs_rq:=
/.spread0.44
    -22390 =C2=B1 -8%    +132.9%     -52155 =C2=B1-32%  sched_debug.cfs_rq:=
/.spread0.45
    -22009 =C2=B1-13%    +126.6%     -49875 =C2=B1-40%  sched_debug.cfs_rq:=
/.spread0.46
    -23721 =C2=B1-15%    +124.8%     -53327 =C2=B1-38%  sched_debug.cfs_rq:=
/.spread0.47
    -24879 =C2=B1 -7%    +107.6%     -51653 =C2=B1-37%  sched_debug.cfs_rq:=
/.spread0.48
    -24124 =C2=B1-10%    +107.3%     -50014 =C2=B1-31%  sched_debug.cfs_rq:=
/.spread0.49
    -22685 =C2=B1-19%    +122.4%     -50455 =C2=B1-33%  sched_debug.cfs_rq:=
/.spread0.50
    -23640 =C2=B1-19%    +131.2%     -54660 =C2=B1-29%  sched_debug.cfs_rq:=
/.spread0.51
    -22251 =C2=B1 -6%    +148.9%     -55390 =C2=B1-30%  sched_debug.cfs_rq:=
/.spread0.52
    -22654 =C2=B1 -9%    +121.3%     -50137 =C2=B1-35%  sched_debug.cfs_rq:=
/.spread0.54
    -22648 =C2=B1-14%    +150.6%     -56753 =C2=B1-31%  sched_debug.cfs_rq:=
/.spread0.55
    -22168 =C2=B1-11%    +139.2%     -53031 =C2=B1-35%  sched_debug.cfs_rq:=
/.spread0.56
    -23923 =C2=B1-12%    +113.1%     -50990 =C2=B1-38%  sched_debug.cfs_rq:=
/.spread0.58
    -22542 =C2=B1-14%    +142.1%     -54572 =C2=B1-30%  sched_debug.cfs_rq:=
/.spread0.59
    -22265 =C2=B1-11%    +144.0%     -54334 =C2=B1-32%  sched_debug.cfs_rq:=
/.spread0.60
    -23105 =C2=B1 -9%    +120.8%     -51021 =C2=B1-36%  sched_debug.cfs_rq:=
/.spread0.61
    -21832 =C2=B1 -9%    +135.0%     -51301 =C2=B1-34%  sched_debug.cfs_rq:=
/.spread0.62
    -21816 =C2=B1-24%    +139.7%     -52305 =C2=B1-39%  sched_debug.cfs_rq:=
/.spread0.63
      2023 =C2=B1 87%   -1201.0%     -22280 =C2=B1-87%  sched_debug.cfs_rq:=
/.spread0.69
    -23385 =C2=B1-14%    +118.8%     -51164 =C2=B1-35%  sched_debug.cfs_rq:=
/.spread0.72
    -22487 =C2=B1 -3%    +125.9%     -50791 =C2=B1-30%  sched_debug.cfs_rq:=
/.spread0.73
    -22748 =C2=B1-13%    +115.1%     -48931 =C2=B1-40%  sched_debug.cfs_rq:=
/.spread0.74
    -21855 =C2=B1-15%    +156.7%     -56103 =C2=B1-30%  sched_debug.cfs_rq:=
/.spread0.75
    -21801 =C2=B1-12%    +149.2%     -54324 =C2=B1-33%  sched_debug.cfs_rq:=
/.spread0.76
    -22510 =C2=B1-16%    +126.1%     -50901 =C2=B1-34%  sched_debug.cfs_rq:=
/.spread0.78
    -22906 =C2=B1-15%    +133.7%     -53542 =C2=B1-29%  sched_debug.cfs_rq:=
/.spread0.79
     11286 =C2=B1  8%    +570.6%      75693 =C2=B1 22%  sched_debug.cfs_rq:=
/.spread0.max
    -28294 =C2=B1 -6%    +117.0%     -61397 =C2=B1-27%  sched_debug.cfs_rq:=
/.spread0.min
     11203 =C2=B1  1%    +165.6%      29750 =C2=B1  8%  sched_debug.cfs_rq:=
/.spread0.stddev
     56.00 =C2=B1 82%     -84.4%       8.75 =C2=B1 41%  sched_debug.cfs_rq:=
/.util_avg.15
     83.00 =C2=B1 64%     -86.4%      11.25 =C2=B1 51%  sched_debug.cfs_rq:=
/.util_avg.2
     85.33 =C2=B1 60%     -73.0%      23.00 =C2=B1 88%  sched_debug.cfs_rq:=
/.util_avg.22
     10.33 =C2=B1 19%     -41.9%       6.00 =C2=B1 20%  sched_debug.cfs_rq:=
/.util_avg.43
     15.00 =C2=B1 56%     -75.0%       3.75 =C2=B1 76%  sched_debug.cfs_rq:=
/.util_avg.47
     30.33 =C2=B1 38%     -66.2%      10.25 =C2=B1 38%  sched_debug.cfs_rq:=
/.util_avg.50
     34.00 =C2=B1 40%     -75.7%       8.25 =C2=B1 71%  sched_debug.cfs_rq:=
/.util_avg.60
     22.33 =C2=B1 46%     -81.0%       4.25 =C2=B1 94%  sched_debug.cfs_rq:=
/.util_avg.63
     30.00 =C2=B1 58%     -89.2%       3.25 =C2=B1 70%  sched_debug.cfs_rq:=
/.util_avg.74
     35.33 =C2=B1 53%     -78.8%       7.50 =C2=B1 42%  sched_debug.cfs_rq:=
/.util_avg.75
     16.67 =C2=B1 39%     -65.5%       5.75 =C2=B1 18%  sched_debug.cfs_rq:=
/.util_avg.79
     38.67 =C2=B1 30%    +118.5%      84.50 =C2=B1 40%  sched_debug.cfs_rq:=
/.util_avg.8
    312.56 =C2=B1 18%     +37.0%     428.21 =C2=B1  4%  sched_debug.cfs_rq:=
/.util_avg.max
     49.20 =C2=B1 15%     +38.6%      68.20 =C2=B1  6%  sched_debug.cfs_rq:=
/.util_avg.stddev
    911680 =C2=B1  6%      +9.7%     999774 =C2=B1  0%  sched_debug.cpu.avg=
_idle.15
    928131 =C2=B1  5%      +6.1%     985033 =C2=B1  1%  sched_debug.cpu.avg=
_idle.50
    470633 =C2=B1 21%     -46.7%     250844 =C2=B1 11%  sched_debug.cpu.avg=
_idle.min
      5.08 =C2=B1 13%    +235.0%      17.03 =C2=B1 26%  sched_debug.cpu.clo=
ck.stddev
      5.08 =C2=B1 13%    +235.0%      17.03 =C2=B1 26%  sched_debug.cpu.clo=
ck_task.stddev
      0.96 =C2=B1 43%     -54.6%       0.43 =C2=B1 62%  sched_debug.cpu.cpu=
_load[2].avg
     53.17 =C2=B1 48%     -57.7%      22.50 =C2=B1 83%  sched_debug.cpu.cpu=
_load[2].max
      6.19 =C2=B1 47%     -56.3%       2.70 =C2=B1 75%  sched_debug.cpu.cpu=
_load[2].stddev
      2.00 =C2=B1 70%    -100.0%       0.00 =C2=B1  0%  sched_debug.cpu.cpu=
_load[3].22
      0.98 =C2=B1 37%     -62.0%       0.37 =C2=B1 44%  sched_debug.cpu.cpu=
_load[3].avg
     51.33 =C2=B1 48%     -67.0%      16.92 =C2=B1 66%  sched_debug.cpu.cpu=
_load[3].max
      6.07 =C2=B1 45%     -65.4%       2.10 =C2=B1 57%  sched_debug.cpu.cpu=
_load[3].stddev
      0.98 =C2=B1 28%     -63.7%       0.36 =C2=B1 32%  sched_debug.cpu.cpu=
_load[4].avg
     51.44 =C2=B1 39%     -72.5%      14.17 =C2=B1 51%  sched_debug.cpu.cpu=
_load[4].max
      6.04 =C2=B1 36%     -69.7%       1.83 =C2=B1 42%  sched_debug.cpu.cpu=
_load[4].stddev
      0.00 =C2=B1 12%     +84.1%       0.00 =C2=B1 24%  sched_debug.cpu.nex=
t_balance.stddev
     29627 =C2=B1  5%     -32.5%      19990 =C2=B1  8%  sched_debug.cpu.nr_=
load_updates.0
     29448 =C2=B1  5%     -38.5%      18101 =C2=B1  9%  sched_debug.cpu.nr_=
load_updates.1
     25502 =C2=B1  5%     -26.6%      18712 =C2=B1 18%  sched_debug.cpu.nr_=
load_updates.10
     27550 =C2=B1  5%     -38.2%      17021 =C2=B1  1%  sched_debug.cpu.nr_=
load_updates.11
     30239 =C2=B1  4%     -41.8%      17601 =C2=B1  6%  sched_debug.cpu.nr_=
load_updates.12
     27616 =C2=B1  7%     -33.5%      18352 =C2=B1  5%  sched_debug.cpu.nr_=
load_updates.13
     27704 =C2=B1  4%     -40.2%      16578 =C2=B1  7%  sched_debug.cpu.nr_=
load_updates.14
     27826 =C2=B1  5%     -43.8%      15625 =C2=B1  9%  sched_debug.cpu.nr_=
load_updates.15
     30454 =C2=B1  5%     -34.5%      19938 =C2=B1 13%  sched_debug.cpu.nr_=
load_updates.16
     26810 =C2=B1  2%     -22.5%      20785 =C2=B1 18%  sched_debug.cpu.nr_=
load_updates.17
     27849 =C2=B1  3%     -36.9%      17578 =C2=B1 10%  sched_debug.cpu.nr_=
load_updates.18
     28035 =C2=B1  5%     -40.0%      16811 =C2=B1 15%  sched_debug.cpu.nr_=
load_updates.19
     28583 =C2=B1  4%     -37.0%      18016 =C2=B1 12%  sched_debug.cpu.nr_=
load_updates.2
     29807 =C2=B1  5%     -36.3%      18996 =C2=B1  9%  sched_debug.cpu.nr_=
load_updates.20
     26331 =C2=B1  2%     -22.4%      20441 =C2=B1 17%  sched_debug.cpu.nr_=
load_updates.21
     27179 =C2=B1  0%     -33.5%      18065 =C2=B1 11%  sched_debug.cpu.nr_=
load_updates.22
     27966 =C2=B1  5%     -37.5%      17476 =C2=B1 24%  sched_debug.cpu.nr_=
load_updates.23
     30041 =C2=B1  6%     -35.7%      19330 =C2=B1 14%  sched_debug.cpu.nr_=
load_updates.24
     26946 =C2=B1  2%     -26.2%      19890 =C2=B1 10%  sched_debug.cpu.nr_=
load_updates.26
     27725 =C2=B1  6%     -34.0%      18305 =C2=B1 15%  sched_debug.cpu.nr_=
load_updates.27
     29270 =C2=B1  5%     -31.2%      20143 =C2=B1 14%  sched_debug.cpu.nr_=
load_updates.28
     28399 =C2=B1  5%     -35.0%      18446 =C2=B1  7%  sched_debug.cpu.nr_=
load_updates.3
     26534 =C2=B1  3%     -29.8%      18637 =C2=B1 10%  sched_debug.cpu.nr_=
load_updates.30
     27628 =C2=B1  5%     -40.8%      16366 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.31
     15360 =C2=B1  5%     -28.6%      10971 =C2=B1  5%  sched_debug.cpu.nr_=
load_updates.32
     13483 =C2=B1  1%     -23.1%      10375 =C2=B1  6%  sched_debug.cpu.nr_=
load_updates.33
     14902 =C2=B1  1%     -29.5%      10511 =C2=B1  6%  sched_debug.cpu.nr_=
load_updates.34
     15167 =C2=B1  5%     -36.6%       9608 =C2=B1  5%  sched_debug.cpu.nr_=
load_updates.35
     16083 =C2=B1  5%     -40.1%       9641 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.36
     13563 =C2=B1  1%     -26.3%       9993 =C2=B1  5%  sched_debug.cpu.nr_=
load_updates.37
     14850 =C2=B1  2%     -30.9%      10263 =C2=B1  7%  sched_debug.cpu.nr_=
load_updates.38
     14750 =C2=B1  6%     -35.9%       9455 =C2=B1  6%  sched_debug.cpu.nr_=
load_updates.39
     31405 =C2=B1  2%     -32.6%      21161 =C2=B1 15%  sched_debug.cpu.nr_=
load_updates.4
     14869 =C2=B1  5%     -34.6%       9731 =C2=B1  8%  sched_debug.cpu.nr_=
load_updates.40
     13525 =C2=B1  3%     -26.9%       9885 =C2=B1  5%  sched_debug.cpu.nr_=
load_updates.41
     14684 =C2=B1  5%     -30.7%      10182 =C2=B1  7%  sched_debug.cpu.nr_=
load_updates.42
     14746 =C2=B1  5%     -36.9%       9311 =C2=B1  5%  sched_debug.cpu.nr_=
load_updates.43
     14396 =C2=B1  8%     -30.1%      10056 =C2=B1  6%  sched_debug.cpu.nr_=
load_updates.44
     13466 =C2=B1  0%     -22.1%      10490 =C2=B1  8%  sched_debug.cpu.nr_=
load_updates.45
     14565 =C2=B1  3%     -30.7%      10086 =C2=B1  8%  sched_debug.cpu.nr_=
load_updates.46
     14557 =C2=B1  6%     -35.3%       9418 =C2=B1  7%  sched_debug.cpu.nr_=
load_updates.47
     15346 =C2=B1  6%     -32.4%      10374 =C2=B1  6%  sched_debug.cpu.nr_=
load_updates.48
     13194 =C2=B1  0%     -20.7%      10469 =C2=B1  7%  sched_debug.cpu.nr_=
load_updates.49
     26621 =C2=B1  0%     -27.9%      19185 =C2=B1 10%  sched_debug.cpu.nr_=
load_updates.5
     14806 =C2=B1  4%     -32.7%       9964 =C2=B1  7%  sched_debug.cpu.nr_=
load_updates.50
     15122 =C2=B1  6%     -39.0%       9231 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.51
     14677 =C2=B1  8%     -35.8%       9416 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.52
     13475 =C2=B1  3%     -21.8%      10543 =C2=B1  9%  sched_debug.cpu.nr_=
load_updates.53
     14274 =C2=B1  3%     -29.6%      10054 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.54
     14866 =C2=B1  5%     -38.8%       9100 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.55
     14627 =C2=B1  8%     -34.3%       9610 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.56
     13063 =C2=B1  0%     -26.2%       9639 =C2=B1  7%  sched_debug.cpu.nr_=
load_updates.57
     14101 =C2=B1  5%     -29.0%      10013 =C2=B1  6%  sched_debug.cpu.nr_=
load_updates.58
     14746 =C2=B1  5%     -37.4%       9233 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.59
     26091 =C2=B1  5%     -26.9%      19082 =C2=B1  5%  sched_debug.cpu.nr_=
load_updates.6
     14390 =C2=B1  6%     -32.8%       9672 =C2=B1  5%  sched_debug.cpu.nr_=
load_updates.60
     13139 =C2=B1  1%     -25.0%       9853 =C2=B1  7%  sched_debug.cpu.nr_=
load_updates.61
     14262 =C2=B1  2%     -30.8%       9868 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.62
     14910 =C2=B1  5%     -36.0%       9543 =C2=B1 10%  sched_debug.cpu.nr_=
load_updates.63
     29355 =C2=B1  6%     -33.7%      19457 =C2=B1 12%  sched_debug.cpu.nr_=
load_updates.64
     25784 =C2=B1  2%     -27.3%      18734 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.65
     26541 =C2=B1  3%     -29.0%      18833 =C2=B1 15%  sched_debug.cpu.nr_=
load_updates.66
     27365 =C2=B1  5%     -36.2%      17458 =C2=B1 18%  sched_debug.cpu.nr_=
load_updates.67
     29221 =C2=B1  5%     -44.2%      16302 =C2=B1  9%  sched_debug.cpu.nr_=
load_updates.68
     25609 =C2=B1  1%     -33.5%      17040 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.69
     27899 =C2=B1  4%     -33.7%      18494 =C2=B1 12%  sched_debug.cpu.nr_=
load_updates.7
     26744 =C2=B1  0%     -39.0%      16324 =C2=B1 17%  sched_debug.cpu.nr_=
load_updates.70
     26964 =C2=B1  4%     -28.1%      19379 =C2=B1 24%  sched_debug.cpu.nr_=
load_updates.71
     14506 =C2=B1  7%     -34.1%       9556 =C2=B1  6%  sched_debug.cpu.nr_=
load_updates.72
     13042 =C2=B1  1%     -24.9%       9793 =C2=B1  7%  sched_debug.cpu.nr_=
load_updates.73
     13867 =C2=B1  2%     -30.5%       9637 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.74
     14260 =C2=B1  5%     -37.4%       8927 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.75
     14113 =C2=B1  7%     -35.3%       9126 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.76
     13340 =C2=B1  1%     -27.2%       9717 =C2=B1  7%  sched_debug.cpu.nr_=
load_updates.77
     13865 =C2=B1  4%     -29.8%       9728 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.78
     14139 =C2=B1  7%     -35.8%       9077 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.79
     21109 =C2=B1  0%     -32.3%      14293 =C2=B1  0%  sched_debug.cpu.nr_=
load_updates.avg
     12554 =C2=B1  1%     -34.1%       8272 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.min
      7072 =C2=B1  0%     -24.9%       5310 =C2=B1  5%  sched_debug.cpu.nr_=
load_updates.stddev
     60538 =C2=B1  2%     -16.6%      50515 =C2=B1  7%  sched_debug.cpu.nr_=
switches.0
     41367 =C2=B1  7%     -14.9%      35218 =C2=B1  8%  sched_debug.cpu.nr_=
switches.11
     52695 =C2=B1 20%     -41.8%      30663 =C2=B1 19%  sched_debug.cpu.nr_=
switches.14
     42409 =C2=B1  4%     -26.0%      31399 =C2=B1 11%  sched_debug.cpu.nr_=
switches.15
     58427 =C2=B1  5%     -23.9%      44444 =C2=B1 27%  sched_debug.cpu.nr_=
switches.16
     54376 =C2=B1 11%     -33.5%      36136 =C2=B1 32%  sched_debug.cpu.nr_=
switches.2
     11764 =C2=B1  3%     -19.6%       9462 =C2=B1 21%  sched_debug.cpu.nr_=
switches.33
     14572 =C2=B1  2%     -37.7%       9072 =C2=B1 12%  sched_debug.cpu.nr_=
switches.34
     15058 =C2=B1 12%     -47.8%       7858 =C2=B1 25%  sched_debug.cpu.nr_=
switches.35
     17006 =C2=B1 11%     -54.9%       7664 =C2=B1  7%  sched_debug.cpu.nr_=
switches.36
     12048 =C2=B1  0%     -31.6%       8246 =C2=B1 17%  sched_debug.cpu.nr_=
switches.37
     14437 =C2=B1 14%     -49.3%       7317 =C2=B1 28%  sched_debug.cpu.nr_=
switches.39
     15276 =C2=B1 11%     -46.7%       8143 =C2=B1 20%  sched_debug.cpu.nr_=
switches.40
     11810 =C2=B1  3%     -32.6%       7961 =C2=B1 13%  sched_debug.cpu.nr_=
switches.41
     18488 =C2=B1 41%     -52.9%       8716 =C2=B1 25%  sched_debug.cpu.nr_=
switches.42
     14546 =C2=B1 11%     -51.8%       7012 =C2=B1 25%  sched_debug.cpu.nr_=
switches.43
     13918 =C2=B1 17%     -33.5%       9252 =C2=B1 19%  sched_debug.cpu.nr_=
switches.44
     12174 =C2=B1  0%     -23.2%       9355 =C2=B1 21%  sched_debug.cpu.nr_=
switches.45
     14257 =C2=B1  9%     -39.8%       8580 =C2=B1 25%  sched_debug.cpu.nr_=
switches.46
     14670 =C2=B1 11%     -47.9%       7650 =C2=B1 38%  sched_debug.cpu.nr_=
switches.47
     16764 =C2=B1 14%     -40.4%       9997 =C2=B1 12%  sched_debug.cpu.nr_=
switches.48
     15043 =C2=B1 11%     -43.2%       8539 =C2=B1 11%  sched_debug.cpu.nr_=
switches.50
     15629 =C2=B1 13%     -51.4%       7598 =C2=B1 15%  sched_debug.cpu.nr_=
switches.51
     14181 =C2=B1 11%     -38.6%       8701 =C2=B1 11%  sched_debug.cpu.nr_=
switches.54
     15194 =C2=B1 11%     -54.0%       6992 =C2=B1 19%  sched_debug.cpu.nr_=
switches.55
     14908 =C2=B1 17%     -42.0%       8641 =C2=B1 11%  sched_debug.cpu.nr_=
switches.56
     11761 =C2=B1  1%     -26.7%       8621 =C2=B1 16%  sched_debug.cpu.nr_=
switches.57
     13951 =C2=B1 11%     -36.5%       8853 =C2=B1 16%  sched_debug.cpu.nr_=
switches.58
     14954 =C2=B1 12%     -46.8%       7952 =C2=B1 23%  sched_debug.cpu.nr_=
switches.59
     15506 =C2=B1 20%     -44.6%       8598 =C2=B1 17%  sched_debug.cpu.nr_=
switches.60
     14301 =C2=B1  7%     -44.7%       7910 =C2=B1  7%  sched_debug.cpu.nr_=
switches.62
     15307 =C2=B1 14%     -41.8%       8909 =C2=B1 36%  sched_debug.cpu.nr_=
switches.63
     39796 =C2=B1  7%     +13.6%      45189 =C2=B1  8%  sched_debug.cpu.nr_=
switches.65
     15418 =C2=B1 13%     -41.5%       9021 =C2=B1 11%  sched_debug.cpu.nr_=
switches.72
     13903 =C2=B1  6%     -37.9%       8634 =C2=B1 12%  sched_debug.cpu.nr_=
switches.74
     14552 =C2=B1 11%     -48.5%       7497 =C2=B1 18%  sched_debug.cpu.nr_=
switches.75
     14575 =C2=B1 16%     -48.6%       7487 =C2=B1  4%  sched_debug.cpu.nr_=
switches.76
     19708 =C2=B1 48%     -50.1%       9827 =C2=B1 20%  sched_debug.cpu.nr_=
switches.77
     13926 =C2=B1 12%     -37.5%       8708 =C2=B1 10%  sched_debug.cpu.nr_=
switches.78
     30604 =C2=B1  0%     -10.1%      27500 =C2=B1  0%  sched_debug.cpu.nr_=
switches.avg
     69947 =C2=B1  7%     +42.8%      99919 =C2=B1 18%  sched_debug.cpu.nr_=
switches.max
     11260 =C2=B1  1%     -53.7%       5215 =C2=B1  8%  sched_debug.cpu.nr_=
switches.min
     17799 =C2=B1  2%     +30.8%      23277 =C2=B1  7%  sched_debug.cpu.nr_=
switches.stddev
      0.67 =C2=B1187%    -662.5%      -3.75 =C2=B1-136%  sched_debug.cpu.nr=
_uninterruptible.0
     -4.00 =C2=B1-73%    -112.5%       0.50 =C2=B1412%  sched_debug.cpu.nr_=
uninterruptible.22
     -1.00 =C2=B1-81%    -425.0%       3.25 =C2=B1 39%  sched_debug.cpu.nr_=
uninterruptible.41
      2.33 =C2=B1202%     +17.9%       2.75 =C2=B1 39%  sched_debug.cpu.nr_=
uninterruptible.47
     -4.33 =C2=B1-43%    -117.3%       0.75 =C2=B1288%  sched_debug.cpu.nr_=
uninterruptible.5
      8.00 =C2=B1103%     -75.0%       2.00 =C2=B1108%  sched_debug.cpu.nr_=
uninterruptible.53
      5.33 =C2=B1 17%     -71.9%       1.50 =C2=B1 57%  sched_debug.cpu.nr_=
uninterruptible.61
      5.67 =C2=B1 22%     -55.9%       2.50 =C2=B1 44%  sched_debug.cpu.nr_=
uninterruptible.62
     -6.33 =C2=B1-32%     -84.2%      -1.00 =C2=B1-254%  sched_debug.cpu.nr=
_uninterruptible.64
     -6.33 =C2=B1-37%    +176.3%     -17.50 =C2=B1-14%  sched_debug.cpu.nr_=
uninterruptible.68
     -5.00 =C2=B1-32%    -125.0%       1.25 =C2=B1261%  sched_debug.cpu.nr_=
uninterruptible.71
     19.00 =C2=B1  8%     -56.6%       8.25 =C2=B1 20%  sched_debug.cpu.nr_=
uninterruptible.max
     41890 =C2=B1  5%     -14.9%      35654 =C2=B1  9%  sched_debug.cpu.sch=
ed_count.11
     53096 =C2=B1 19%     -42.2%      30671 =C2=B1 19%  sched_debug.cpu.sch=
ed_count.14
     42939 =C2=B1  3%     -25.4%      32027 =C2=B1 13%  sched_debug.cpu.sch=
ed_count.15
     83027 =C2=B1 41%     -54.3%      37982 =C2=B1 33%  sched_debug.cpu.sch=
ed_count.2
     11770 =C2=B1  3%     -19.5%       9469 =C2=B1 21%  sched_debug.cpu.sch=
ed_count.33
     14579 =C2=B1  2%     -37.7%       9077 =C2=B1 12%  sched_debug.cpu.sch=
ed_count.34
     15065 =C2=B1 12%     -47.8%       7865 =C2=B1 25%  sched_debug.cpu.sch=
ed_count.35
     17012 =C2=B1 11%     -54.9%       7669 =C2=B1  7%  sched_debug.cpu.sch=
ed_count.36
     12054 =C2=B1  0%     -31.5%       8253 =C2=B1 17%  sched_debug.cpu.sch=
ed_count.37
     14443 =C2=B1 14%     -49.3%       7323 =C2=B1 28%  sched_debug.cpu.sch=
ed_count.39
     15283 =C2=B1 11%     -46.7%       8150 =C2=B1 20%  sched_debug.cpu.sch=
ed_count.40
     11820 =C2=B1  3%     -32.6%       7968 =C2=B1 13%  sched_debug.cpu.sch=
ed_count.41
     18495 =C2=B1 41%     -52.8%       8722 =C2=B1 25%  sched_debug.cpu.sch=
ed_count.42
     14552 =C2=B1 11%     -51.8%       7018 =C2=B1 25%  sched_debug.cpu.sch=
ed_count.43
     13927 =C2=B1 17%     -33.5%       9260 =C2=B1 19%  sched_debug.cpu.sch=
ed_count.44
     12181 =C2=B1  0%     -23.1%       9362 =C2=B1 21%  sched_debug.cpu.sch=
ed_count.45
     14262 =C2=B1  9%     -39.8%       8585 =C2=B1 25%  sched_debug.cpu.sch=
ed_count.46
     14677 =C2=B1 11%     -40.8%       8684 =C2=B1 30%  sched_debug.cpu.sch=
ed_count.47
     16769 =C2=B1 14%     -36.9%      10584 =C2=B1 15%  sched_debug.cpu.sch=
ed_count.48
     15049 =C2=B1 11%     -43.2%       8545 =C2=B1 11%  sched_debug.cpu.sch=
ed_count.50
     15635 =C2=B1 13%     -51.4%       7605 =C2=B1 15%  sched_debug.cpu.sch=
ed_count.51
     15281 =C2=B1 20%     -43.0%       8706 =C2=B1 11%  sched_debug.cpu.sch=
ed_count.54
     15200 =C2=B1 11%     -54.0%       6998 =C2=B1 19%  sched_debug.cpu.sch=
ed_count.55
     14914 =C2=B1 17%     -42.0%       8648 =C2=B1 11%  sched_debug.cpu.sch=
ed_count.56
     11767 =C2=B1  1%     -26.7%       8628 =C2=B1 16%  sched_debug.cpu.sch=
ed_count.57
     13958 =C2=B1 11%     -36.5%       8860 =C2=B1 16%  sched_debug.cpu.sch=
ed_count.58
     14959 =C2=B1 12%     -46.8%       7960 =C2=B1 23%  sched_debug.cpu.sch=
ed_count.59
     15512 =C2=B1 20%     -44.5%       8603 =C2=B1 17%  sched_debug.cpu.sch=
ed_count.60
     14308 =C2=B1  7%     -44.7%       7916 =C2=B1  7%  sched_debug.cpu.sch=
ed_count.62
     16369 =C2=B1  8%     -45.5%       8916 =C2=B1 36%  sched_debug.cpu.sch=
ed_count.63
     39805 =C2=B1  7%     +14.4%      45534 =C2=B1  8%  sched_debug.cpu.sch=
ed_count.65
     15423 =C2=B1 13%     -40.4%       9187 =C2=B1  8%  sched_debug.cpu.sch=
ed_count.72
     13909 =C2=B1  6%     -37.9%       8640 =C2=B1 12%  sched_debug.cpu.sch=
ed_count.74
     14561 =C2=B1 11%     -48.5%       7503 =C2=B1 18%  sched_debug.cpu.sch=
ed_count.75
     14581 =C2=B1 16%     -48.6%       7493 =C2=B1  4%  sched_debug.cpu.sch=
ed_count.76
     19716 =C2=B1 48%     -50.1%       9832 =C2=B1 20%  sched_debug.cpu.sch=
ed_count.77
     13932 =C2=B1 12%     -37.5%       8713 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.78
     44025 =C2=B1 13%     +30.0%      57217 =C2=B1 19%  sched_debug.cpu.sch=
ed_count.9
     11267 =C2=B1  1%     -53.7%       5220 =C2=B1  8%  sched_debug.cpu.sch=
ed_count.min
     28669 =C2=B1  2%     -17.3%      23700 =C2=B1  8%  sched_debug.cpu.sch=
ed_goidle.0
     20412 =C2=B1  7%     -14.1%      17526 =C2=B1  8%  sched_debug.cpu.sch=
ed_goidle.11
     26189 =C2=B1 20%     -42.0%      15195 =C2=B1 19%  sched_debug.cpu.sch=
ed_goidle.14
     21061 =C2=B1  4%     -25.8%      15620 =C2=B1 11%  sched_debug.cpu.sch=
ed_goidle.15
     27003 =C2=B1 11%     -33.5%      17962 =C2=B1 33%  sched_debug.cpu.sch=
ed_goidle.2
      5780 =C2=B1  4%     -19.6%       4644 =C2=B1 21%  sched_debug.cpu.sch=
ed_goidle.33
      7165 =C2=B1  3%     -37.7%       4464 =C2=B1 12%  sched_debug.cpu.sch=
ed_goidle.34
      7425 =C2=B1 12%     -48.2%       3850 =C2=B1 26%  sched_debug.cpu.sch=
ed_goidle.35
      8402 =C2=B1 11%     -55.3%       3757 =C2=B1  7%  sched_debug.cpu.sch=
ed_goidle.36
      5916 =C2=B1  0%     -31.6%       4044 =C2=B1 17%  sched_debug.cpu.sch=
ed_goidle.37
      7114 =C2=B1 15%     -49.6%       3586 =C2=B1 28%  sched_debug.cpu.sch=
ed_goidle.39
      7530 =C2=B1 11%     -46.9%       3998 =C2=B1 20%  sched_debug.cpu.sch=
ed_goidle.40
      5789 =C2=B1  3%     -32.5%       3906 =C2=B1 13%  sched_debug.cpu.sch=
ed_goidle.41
      9139 =C2=B1 42%     -53.0%       4291 =C2=B1 26%  sched_debug.cpu.sch=
ed_goidle.42
      7167 =C2=B1 11%     -52.0%       3438 =C2=B1 25%  sched_debug.cpu.sch=
ed_goidle.43
      6855 =C2=B1 18%     -33.7%       4544 =C2=B1 19%  sched_debug.cpu.sch=
ed_goidle.44
      5988 =C2=B1  0%     -27.7%       4326 =C2=B1 18%  sched_debug.cpu.sch=
ed_goidle.45
      7026 =C2=B1  9%     -39.9%       4223 =C2=B1 25%  sched_debug.cpu.sch=
ed_goidle.46
      7239 =C2=B1 12%     -48.1%       3760 =C2=B1 39%  sched_debug.cpu.sch=
ed_goidle.47
      8232 =C2=B1 15%     -40.6%       4887 =C2=B1 12%  sched_debug.cpu.sch=
ed_goidle.48
      7403 =C2=B1 11%     -43.2%       4204 =C2=B1 11%  sched_debug.cpu.sch=
ed_goidle.50
      7715 =C2=B1 13%     -51.6%       3732 =C2=B1 16%  sched_debug.cpu.sch=
ed_goidle.51
      6904 =C2=B1 10%     -37.9%       4290 =C2=B1 11%  sched_debug.cpu.sch=
ed_goidle.54
      7492 =C2=B1 11%     -54.2%       3429 =C2=B1 20%  sched_debug.cpu.sch=
ed_goidle.55
      7341 =C2=B1 17%     -42.1%       4250 =C2=B1 11%  sched_debug.cpu.sch=
ed_goidle.56
      5783 =C2=B1  1%     -26.6%       4248 =C2=B1 17%  sched_debug.cpu.sch=
ed_goidle.57
      6869 =C2=B1 11%     -36.4%       4366 =C2=B1 16%  sched_debug.cpu.sch=
ed_goidle.58
      7379 =C2=B1 12%     -48.8%       3775 =C2=B1 22%  sched_debug.cpu.sch=
ed_goidle.59
      7645 =C2=B1 20%     -45.0%       4201 =C2=B1 18%  sched_debug.cpu.sch=
ed_goidle.60
      7044 =C2=B1  7%     -45.0%       3874 =C2=B1  7%  sched_debug.cpu.sch=
ed_goidle.62
      7557 =C2=B1 14%     -42.1%       4374 =C2=B1 36%  sched_debug.cpu.sch=
ed_goidle.63
     19766 =C2=B1  7%     +13.7%      22481 =C2=B1  8%  sched_debug.cpu.sch=
ed_goidle.65
      7566 =C2=B1 13%     -41.7%       4411 =C2=B1 11%  sched_debug.cpu.sch=
ed_goidle.72
      6844 =C2=B1  7%     -37.9%       4247 =C2=B1 12%  sched_debug.cpu.sch=
ed_goidle.74
      7166 =C2=B1 11%     -48.7%       3679 =C2=B1 19%  sched_debug.cpu.sch=
ed_goidle.75
      7172 =C2=B1 16%     -48.9%       3666 =C2=B1  5%  sched_debug.cpu.sch=
ed_goidle.76
      9752 =C2=B1 49%     -50.3%       4842 =C2=B1 20%  sched_debug.cpu.sch=
ed_goidle.77
      6857 =C2=B1 13%     -37.5%       4283 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.78
     15120 =C2=B1  0%     -10.0%      13615 =C2=B1  0%  sched_debug.cpu.sch=
ed_goidle.avg
     34451 =C2=B1  8%     +44.5%      49771 =C2=B1 18%  sched_debug.cpu.sch=
ed_goidle.max
      5535 =C2=B1  1%     -54.0%       2547 =C2=B1  8%  sched_debug.cpu.sch=
ed_goidle.min
      8812 =C2=B1  2%     +31.5%      11588 =C2=B1  7%  sched_debug.cpu.sch=
ed_goidle.stddev
     20422 =C2=B1  6%     -42.6%      11718 =C2=B1 20%  sched_debug.cpu.ttw=
u_count.12
     22948 =C2=B1  9%     -44.5%      12746 =C2=B1 16%  sched_debug.cpu.ttw=
u_count.16
     29500 =C2=B1 70%     -67.8%       9503 =C2=B1 28%  sched_debug.cpu.ttw=
u_count.19
     23051 =C2=B1 22%     -45.6%      12538 =C2=B1 12%  sched_debug.cpu.ttw=
u_count.20
     20779 =C2=B1 19%     -37.4%      13014 =C2=B1 30%  sched_debug.cpu.ttw=
u_count.24
     15412 =C2=B1 21%     -34.8%      10043 =C2=B1 40%  sched_debug.cpu.ttw=
u_count.3
     10127 =C2=B1 25%     -58.4%       4213 =C2=B1  9%  sched_debug.cpu.ttw=
u_count.32
      5329 =C2=B1  3%     -14.9%       4537 =C2=B1  9%  sched_debug.cpu.ttw=
u_count.33
      7308 =C2=B1 28%     -45.3%       3998 =C2=B1 27%  sched_debug.cpu.ttw=
u_count.38
      6165 =C2=B1  2%     -31.8%       4205 =C2=B1 31%  sched_debug.cpu.ttw=
u_count.39
     20016 =C2=B1 17%     -23.0%      15408 =C2=B1  7%  sched_debug.cpu.ttw=
u_count.4
      5394 =C2=B1  5%     -34.9%       3511 =C2=B1 13%  sched_debug.cpu.ttw=
u_count.41
     12837 =C2=B1 40%     -64.4%       4572 =C2=B1 20%  sched_debug.cpu.ttw=
u_count.42
     12869 =C2=B1 34%     -63.5%       4698 =C2=B1 13%  sched_debug.cpu.ttw=
u_count.44
      5974 =C2=B1  3%     -27.7%       4316 =C2=B1 13%  sched_debug.cpu.ttw=
u_count.50
      6058 =C2=B1  6%     -46.0%       3271 =C2=B1 18%  sched_debug.cpu.ttw=
u_count.51
      6830 =C2=B1 17%     -51.5%       3309 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.52
      8482 =C2=B1 27%     -51.4%       4120 =C2=B1 13%  sched_debug.cpu.ttw=
u_count.58
     20011 =C2=B1 12%     -40.1%      11983 =C2=B1 22%  sched_debug.cpu.ttw=
u_count.64
     13970 =C2=B1 11%     -25.5%      10411 =C2=B1 13%  sched_debug.cpu.ttw=
u_count.66
     22783 =C2=B1  8%     -54.7%      10312 =C2=B1 25%  sched_debug.cpu.ttw=
u_count.68
     13710 =C2=B1  9%     -36.8%       8660 =C2=B1 31%  sched_debug.cpu.ttw=
u_count.71
      9878 =C2=B1 32%     -65.3%       3428 =C2=B1  8%  sched_debug.cpu.ttw=
u_count.76
     10355 =C2=B1 19%     -52.7%       4896 =C2=B1 18%  sched_debug.cpu.ttw=
u_count.78
     26159 =C2=B1 46%     -55.9%      11536 =C2=B1 13%  sched_debug.cpu.ttw=
u_count.8
     12042 =C2=B1  0%     -23.8%       9177 =C2=B1  0%  sched_debug.cpu.ttw=
u_count.avg
      4953 =C2=B1  0%     -56.7%       2146 =C2=B1 12%  sched_debug.cpu.ttw=
u_count.min
      7418 =C2=B1  6%     -17.7%       6104 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.stddev
    721.33 =C2=B1 26%    +119.8%       1585 =C2=B1 20%  sched_debug.cpu.ttw=
u_local.11
    719.33 =C2=B1 25%     +85.2%       1332 =C2=B1 39%  sched_debug.cpu.ttw=
u_local.31
    613.00 =C2=B1 61%     -47.3%     323.00 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.34
    697.33 =C2=B1 70%     -56.4%     304.00 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.38
    403.33 =C2=B1 23%     -26.5%     296.25 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.42
    351.33 =C2=B1  3%     -16.7%     292.75 =C2=B1  9%  sched_debug.cpu.ttw=
u_local.46
      2100 =C2=B1  1%     -30.3%       1464 =C2=B1 26%  sched_debug.cpu.ttw=
u_local.5
    350.00 =C2=B1  1%     -19.4%     282.00 =C2=B1  2%  sched_debug.cpu.ttw=
u_local.50
    335.33 =C2=B1  2%     -13.9%     288.75 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.51
    354.67 =C2=B1  2%     -16.4%     296.50 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.52
    345.67 =C2=B1  1%     -19.7%     277.50 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.54
    365.00 =C2=B1  3%     -15.8%     307.25 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.55
    345.33 =C2=B1  1%     -14.9%     293.75 =C2=B1  1%  sched_debug.cpu.ttw=
u_local.58
      2269 =C2=B1 10%     -24.9%       1703 =C2=B1 18%  sched_debug.cpu.ttw=
u_local.69
    891.00 =C2=B1 14%     +54.7%       1378 =C2=B1 21%  sched_debug.cpu.ttw=
u_local.7
    314.78 =C2=B1  1%     -18.2%     257.50 =C2=B1  1%  sched_debug.cpu.ttw=
u_local.min


lkp-wsx02: Westmere-EX
Memory: 128G


                                  cpuidle.C3-NHM.time

    4e+09 O+---------------------------------------------------------------=
-+
          |     O                                                          =
 |
  3.5e+09 ++O  O                                                           =
 |
    3e+09 ++                                                               =
 |
          |                                                                =
 |
  2.5e+09 ++                                                               =
 |
          |          O O                O  O  O     O O                    =
 |
    2e+09 ++       O    O O  OO O OO OO  O   O  OO O                       =
 |
          |                O                                               =
 |
  1.5e+09 ++                                                               =
 |
    1e+09 ++                                                               =
 |
          |                                                                =
 |
    5e+08 ++                                                               =
 |
          |                                                                =
 |
        0 *+*O-**-O*-*-**-**-**-*-**-**-**-*-**-**-**-*-**-**-**-*-**-**-**=
-*


                                 cpuidle.C3-NHM.usage

  1.4e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  1.2e+06 ++         O        O   O  O  O  O  O       O                    =
 |
          |        O   OO    O  O  O  O  O       O OO                      =
 |
    1e+06 ++              OO                 O  O                          =
 |
          |                                                                =
 |
   800000 O+    O                                                          =
 |
          | O  O                                                           =
 |
   600000 ++                                                               =
 |
          |                                                                =
 |
   400000 ++                                                               =
 |
          |                                                                =
 |
   200000 ++                                                               =
 |
          |                                                                =
 |
        0 *+*O-**-O*-*-**-**-**-*-**-**-**-*-**-**-**-*-**-**-**-*-**-**-**=
-*


                                  cpuidle.C6-NHM.time

  2.5e+10 ++---------------------------------------------------------------=
-+
          *.**.**.**.*.**.**.**.*.**.**.**.*.**.**.*  *  *.**.**.*.**.*  **=
.*
          |                O                 O  O  :  :  :            :  : =
 |
    2e+10 O+O  OO  O O OO O  OO O OO OO OO O  O  O OO O  :            :  : =
 |
          |                                        :  :  :            :  : =
 |
          |                                        : : : :            : :  =
 |
  1.5e+10 ++                                       : : : :            : :  =
 |
          |                                        : : : :            : :  =
 |
    1e+10 ++                                        :: ::              ::  =
 |
          |                                         :: ::              ::  =
 |
          |                                         :: ::              ::  =
 |
    5e+09 ++                                        :   :              :   =
 |
          |                                         :   :              :   =
 |
          |                                         :   :              :   =
 |
        0 ++-O----O---------------------------------*---*--------------*---=
-+


                                 cpuidle.C6-NHM.usage

  4.5e+06 ++---------------------------------------------------------------=
-+
          |.**.    *.*.* .*    .*.*    .**.   *.* .*  *  *. *.**.*.**.*  * =
.*
    4e+06 *+   **.*     *  *.**    *.**    *.*   * :  :  : *          :  :*=
 |
  3.5e+06 ++                                       :  :  :            :  : =
 |
          |                                        :  :  :            :  : =
 |
    3e+06 ++                                       : : : :            : :  =
 |
  2.5e+06 ++                                       : : : :            : :  =
 |
          |                                        : : : :            : :  =
 |
    2e+06 ++                                        :: ::              ::  =
 |
  1.5e+06 ++O  O                                    :: ::              ::  =
 |
          O     O  O O OO OO OO O OO OO OO O OO OO OO:O::              ::  =
 |
    1e+06 ++                                        :   :              :   =
 |
   500000 ++                                        :   :              :   =
 |
          |                                         :   :              :   =
 |
        0 ++-O----O---------------------------------*---*--------------*---=
-+


                                 turbostat.Bzy_MHz

  1800 ++------------------------------------------------------------------=
-+
       |                                           O                       =
 |
  1600 O+O  O O  O OO OO O OO O OO O OO O OO OO O O  O                     =
 |
  1400 *+**.*.**.*.**.**.*.**.*.**.*.**.*.**.**.*.*  *  *.*.**.*.**.**   **=
.*
       |                                          :  :  :            :   : =
 |
  1200 ++                                         :  :  :            :   : =
 |
  1000 ++                                         : : : :             : :  =
 |
       |                                          : : : :             : :  =
 |
   800 ++                                         : : : :             : :  =
 |
   600 ++                                          :: ::              : :  =
 |
       |                                           :: ::              : :  =
 |
   400 ++                                          :: ::              : :  =
 |
   200 ++                                          :   :               :   =
 |
       |                                           :   :               :   =
 |
     0 ++-O----O-----------------------------------*---*---------------*---=
-+


                                turbostat.CPU_c3

  20 ++--------------------------------------------------------------------=
-+
  18 O+                                                                    =
 |
     | O  O O                                                              =
 |
  16 ++                                                                    =
 |
  14 ++                                                                    =
 |
     |                                                                     =
 |
  12 ++                                                                    =
 |
  10 ++                                                                    =
 |
   8 ++                                                                    =
 |
     |         O O O                 O             OO                      =
 |
   6 ++             O O OO O OO O OO   O OO O OO O                         =
 |
   4 ++                                                                    =
 |
     |                                                                     =
 |
   2 ++                                                                    =
 |
   0 *+*O-*-*O-*-*-**-*-**-*-**-*-**-*-*-**-*-**-*-**-*-**-*-**-*-*-**-*-**=
-*


                                 turbostat.CPU_c6

  100 ++-------------------------------------------------------------------=
-+
   90 *+**.*.**.*.**.*.**.*.**.*.**.*.**.*.**.*.**   *  *.**.*.**.*.**   **=
.*
      |                                          :   :  :            :   : =
 |
   80 O+O  O O  O OO O OO O OO O OO O OO O OO O OO O O  :            :   : =
 |
   70 ++                                         :   :  :            :   : =
 |
      |                                           : :: :              : :  =
 |
   60 ++                                          : :: :              : :  =
 |
   50 ++                                          : :: :              : :  =
 |
   40 ++                                          : : ::              : :  =
 |
      |                                           : : ::              : :  =
 |
   30 ++                                          : : ::              : :  =
 |
   20 ++                                           :  :                :   =
 |
      |                                            :  :                :   =
 |
   10 ++                                           :  :                :   =
 |
    0 ++-O----O------------------------------------*--*----------------*---=
-+


                               aim9.time.system_time

  350 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  300 *+**.*.**.*.**.*.**.*.**.*.**.*.**.*.**.*.**   *  *.**.*.**.*.**   **=
.*
      O O  O O  O OO O OO O OO O OO O OO O OO O OO O O  :            :   : =
 |
  250 ++                                         :   :  :            :   : =
 |
      |                                           :  :  :             :  : =
 |
  200 ++                                          : :: :              : :  =
 |
      |                                           : :: :              : :  =
 |
  150 ++                                          : : ::              : :  =
 |
      |                                           : : ::              : :  =
 |
  100 ++                                          : : ::              : :  =
 |
      |                                            :: ::               ::  =
 |
   50 ++                                           :  :                :   =
 |
      |                                            :  :                :   =
 |
    0 ++-O----O------------------------------------*--*----------------*---=
-+


                       aim9.time.percent_of_cpu_this_job_got

  120 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  100 *+**.*.**.*.**.*.**.*.**.*.**.*.**.*.**.*.**   *  *.**.*.**.*.**   **=
.*
      O O  O O  O OO O OO O OO O OO O OO O OO O OO O O  :            :   : =
 |
      |                                          :   :  :            :   : =
 |
   80 ++                                          :  :  :             :  : =
 |
      |                                           : :: :              : :  =
 |
   60 ++                                          : :: :              : :  =
 |
      |                                           : : ::              : :  =
 |
   40 ++                                          : : ::              : :  =
 |
      |                                           : : ::              : :  =
 |
      |                                            :: ::               ::  =
 |
   20 ++                                           :  :                :   =
 |
      |                                            :  :                :   =
 |
    0 ++-O----O------------------------------------*--*----------------*---=
-+


                                 time.system_time

  350 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  300 *+**.*.**.*.**.*.**.*.**.*.**.*.**.*.**.*.**   *  *.**.*.**.*.**   **=
.*
      O O  O O  O OO O OO O OO O OO O OO O OO O OO O O  :            :   : =
 |
  250 ++                                         :   :  :            :   : =
 |
      |                                           :  :  :             :  : =
 |
  200 ++                                          : :: :              : :  =
 |
      |                                           : :: :              : :  =
 |
  150 ++                                          : : ::              : :  =
 |
      |                                           : : ::              : :  =
 |
  100 ++                                          : : ::              : :  =
 |
      |                                            :: ::               ::  =
 |
   50 ++                                           :  :                :   =
 |
      |                                            :  :                :   =
 |
    0 ++-O----O------------------------------------*--*----------------*---=
-+


                         time.percent_of_cpu_this_job_got

  120 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  100 *+**.*.**.*.**.*.**.*.**.*.**.*.**.*.**.*.**   *  *.**.*.**.*.**   **=
.*
      O O  O O  O OO O OO O OO O OO O OO O OO O OO O O  :            :   : =
 |
      |                                          :   :  :            :   : =
 |
   80 ++                                          :  :  :             :  : =
 |
      |                                           : :: :              : :  =
 |
   60 ++                                          : :: :              : :  =
 |
      |                                           : : ::              : :  =
 |
   40 ++                                          : : ::              : :  =
 |
      |                                           : : ::              : :  =
 |
      |                                            :: ::               ::  =
 |
   20 ++                                           :  :                :   =
 |
      |                                            :  :                :   =
 |
    0 ++-O----O------------------------------------*--*----------------*---=
-+


                         time.involuntary_context_switches

  1200 ++------------------------------------------------------------------=
-+
       |    O                                                              =
 |
  1000 ++O                                                                 =
 |
       O         O  O  O                             O                     =
 |
       |      O    O  O  O OO O OO O O  O OO OO O OO                       =
 |
   800 ++                             O                                    =
 |
       |  *.      .*   *.      .*      .*.  .*                             =
 |
   600 *+*  *.**.*  *.*  *.**.*  *.*.**   **  *.*.*  *  *.*.**.*.**.**   **=
.*
       |                                          :  :  :            :   : =
 |
   400 ++                                         : : : :             : :  =
 |
       |                                          : : : :             : :  =
 |
       |                                           :: ::              : :  =
 |
   200 ++                                          :: ::              : :  =
 |
       |                                           :   :               :   =
 |
     0 ++-O----O-----------------------------------*---*---------------*---=
-+


                          proc-vmstat.nr_slab_unreclaimable

  35000 ++-----------------------------------------------------------------=
-+
        O O  OO   OO O OO OO O O  O  O OO O OO OO O OO                     =
 |
  30000 ++                      O   O                                      =
 |
        *.**.**.*.**.*.**.**.*.**.*.**.**.*.**.**.*  *   **.**.*.**.*.*  **=
.*
  25000 ++                                        :  :   :            :  : =
 |
        |                                         :  :   :            :  : =
 |
  20000 ++                                         : :: :             : :  =
 |
        |                                          : :: :             : :  =
 |
  15000 ++                                         : :: :             : :  =
 |
        |                                          :: : :              ::  =
 |
  10000 ++                                         :: : :              ::  =
 |
        |                                          :: : :              ::  =
 |
   5000 ++                                          :  :               :   =
 |
        |                                           :  :               :   =
 |
      0 ++-O----O-----------------------------------*--*---------------*---=
-+


                          proc-vmstat.nr_page_table_pages

  2500 ++-*------*--------------*-------*------------------------*---*-----=
-+
       |.* + .* + + *. *.    .*  :.*. *  + *.    .*  *  *.   *.*  *.*:   **=
.*
       *    *  *   *  *  *.**    *   *    *  **.* :  :  : *.*        :   : =
 |
  2000 ++                                         :  :  :            :   : =
 |
       |                                          :  :  :             :  : =
 |
       O O  O O  O OO OO O OO O OO O OO O OO OO O OO:O: :             : :  =
 |
  1500 ++                                         : : : :             : :  =
 |
       |                                          : : : :             : :  =
 |
  1000 ++                                          :: ::              : :  =
 |
       |                                           :: ::              : :  =
 |
       |                                           :: ::              : :  =
 |
   500 ++                                          :   :               :   =
 |
       |                                           :   :               :   =
 |
       |                                           :   :               :   =
 |
     0 ++-O----O-----------------------------------*---*---------------*---=
-+


                                    meminfo.Slab

  200000 ++----------------------------------------------------------------=
-+
  180000 O+O  OO   OO OO O OO OO   O  OO O OO OO OO O O                    =
 |
         |                       O  O                                      =
 |
  160000 *+**.**.*.**.**.*.**.**.*.**.**.*.**.**.**   *  **.*.**.**.*.*  **=
.*
  140000 ++                                       :   :  :            :  : =
 |
         |                                        :   :  :            :  : =
 |
  120000 ++                                        : :: :             : :  =
 |
  100000 ++                                        : :: :             : :  =
 |
   80000 ++                                        : :: :             : :  =
 |
         |                                         : : ::              ::  =
 |
   60000 ++                                        : : ::              ::  =
 |
   40000 ++                                        : : ::              ::  =
 |
         |                                          :  :               :   =
 |
   20000 ++                                         :  :               :   =
 |
       0 ++-O----O----------------------------------*--*---------------*---=
-+


                                 meminfo.SUnreclaim

  140000 ++----------------------------------------------------------------=
-+
         O O  OO   OO OO O OO OO   O  OO O OO OO OO O O                    =
 |
  120000 ++                      O  O                                      =
 |
         *.**.**.*.**.**.*.**.**.*.**.**.*.**.**.**   *  **.*.**.**.*.*  **=
.*
  100000 ++                                       :   :  :            :  : =
 |
         |                                        :   :  :            :  : =
 |
   80000 ++                                        : :: :             : :  =
 |
         |                                         : :: :             : :  =
 |
   60000 ++                                        : :: :             : :  =
 |
         |                                         : : ::              ::  =
 |
   40000 ++                                        : : ::              ::  =
 |
         |                                         : : ::              ::  =
 |
   20000 ++                                         :  :               :   =
 |
         |                                          :  :               :   =
 |
       0 ++-O----O----------------------------------*--*---------------*---=
-+


                                 meminfo.PageTables

  10000 ++-*------*-------------*-------*------------------------*----*----=
-+
   9000 ++* + *. + :.*. *.    .* + .* .* + .**.  .*  *   *   *.*  *.* :  **=
.*
        *    *  *  *   *  **.*    *  *    *    ** :  :   :*.*         :  : =
 |
   8000 ++                                        :  :   :            :  : =
 |
   7000 ++                                        :  :   :            :  : =
 |
        O O  OO   OO O OO OO O OO O OO OO O OO OO O:OO: :             : :  =
 |
   6000 ++                                         : :: :             : :  =
 |
   5000 ++                                         : :: :              ::  =
 |
   4000 ++                                         :: : :              ::  =
 |
        |                                          :: : :              ::  =
 |
   3000 ++                                         :: : :              ::  =
 |
   2000 ++                                          :  :               :   =
 |
        |                                           :  :               :   =
 |
   1000 ++                                          :  :               :   =
 |
      0 ++-O----O-----------------------------------*--*---------------*---=
-+


                                meminfo.Committed_AS

  300000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  250000 ++                            O   O  O                            =
 |
         O O  OO   OO OO O OO OO O  O    O  O  O OO O                      =
 |
         |                         O  O               O                    =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  150000 ++                                                                =
 |
         |                                                                 =
 |
  100000 *+**.**.*.**.**.*.**.**.*.**.**.*.**.**.**   *  **.*.**.**.*.*  **=
.*
         |                                        :   :  :            :  : =
 |
         |                                         : :: :             : :  =
 |
   50000 ++                                        : : ::              ::  =
 |
         |                                          :  :               :   =
 |
       0 ++-O----O----------------------------------*--*---------------*---=
-+


                         slabinfo.vm_area_struct.active_objs

  35000 ++-------------------------------------*---------------------------=
-+
        *.**.**.*.**.*.**.**.*.**.*.**.**.*.**  *.*  *   **.**.*.**.*.*  **=
.*
  30000 ++                                        :  :   :            :  : =
 |
        |                                         :  :   :            :  : =
 |
  25000 ++              O         O  O            :  :   :            :  : =
 |
        O O  O    OO O    OO O OO   O  OO O OO OO O: O: :             : :  =
 |
  20000 ++    O        O                           :O:: :             : :  =
 |
        |                                          : :: :             : :  =
 |
  15000 ++                                         :: : :              ::  =
 |
        |                                          :: : :              ::  =
 |
  10000 ++                                         :: : :              ::  =
 |
        |                                           :  :               :   =
 |
   5000 ++                                          :  :               :   =
 |
        |                                           :  :               :   =
 |
      0 ++-O----O-----------------------------------*--*---------------*---=
-+


                          slabinfo.vm_area_struct.num_objs

  35000 ++-------------------------------------*---------------------------=
-+
        *.**.**.*.**.*.**.**.*.**.*.**.**.*.**  *.*  *   **.**.*.**.*.*  **=
.*
  30000 ++                                        :  :   :            :  : =
 |
        |                                         :  :   :            :  : =
 |
  25000 ++              O         O  O            :  :   :            :  : =
 |
        O O  O    OO O    OO O OO   O  OO O OO OO O: O: :             : :  =
 |
  20000 ++    O        O                           :O:: :             : :  =
 |
        |                                          : :: :             : :  =
 |
  15000 ++                                         :: : :              ::  =
 |
        |                                          :: : :              ::  =
 |
  10000 ++                                         :: : :              ::  =
 |
        |                                           :  :               :   =
 |
   5000 ++                                          :  :               :   =
 |
        |                                           :  :               :   =
 |
      0 ++-O----O-----------------------------------*--*---------------*---=
-+


                       slabinfo.vm_area_struct.active_slabs

  800 ++-------------------------------------------------------------------=
-+
      *.**.*.**.*.**.*.**. .**.*.**.*.**.*.**.*. *   *  *.**.*.**.*.**   **=
.*
  700 ++                  *                     *:   :  :            :   : =
 |
  600 ++                                         :   :  :            :   : =
 |
      |                O                         :   :  :            :   : =
 |
  500 O+O  O    O OO    O O OO O OO O OO O OO O  O: :O :              : :  =
 |
      |      O       O                          O :O:: :              : :  =
 |
  400 ++                                          : :: :              : :  =
 |
      |                                           : : ::              : :  =
 |
  300 ++                                          : : ::              : :  =
 |
  200 ++                                          : : ::              : :  =
 |
      |                                            :  :                :   =
 |
  100 ++                                           :  :                :   =
 |
      |                                            :  :                :   =
 |
    0 ++-O----O------------------------------------*--*----------------*---=
-+


                         slabinfo.vm_area_struct.num_slabs

  800 ++-------------------------------------------------------------------=
-+
      *.**.*.**.*.**.*.**. .**.*.**.*.**.*.**.*. *   *  *.**.*.**.*.**   **=
.*
  700 ++                  *                     *:   :  :            :   : =
 |
  600 ++                                         :   :  :            :   : =
 |
      |                O                         :   :  :            :   : =
 |
  500 O+O  O    O OO    O O OO O OO O OO O OO O  O: :O :              : :  =
 |
      |      O       O                          O :O:: :              : :  =
 |
  400 ++                                          : :: :              : :  =
 |
      |                                           : : ::              : :  =
 |
  300 ++                                          : : ::              : :  =
 |
  200 ++                                          : : ::              : :  =
 |
      |                                            :  :                :   =
 |
  100 ++                                           :  :                :   =
 |
      |                                            :  :                :   =
 |
    0 ++-O----O------------------------------------*--*----------------*---=
-+


                          slabinfo.mm_struct.active_objs

  7000 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  6000 O+O  O O  O OO OO O OO O  O   OO O OO OO O O  O                     =
 |
       |                        O  O               O                       =
 |
  5000 ++                                                                  =
 |
       |                                                                   =
 |
  4000 ++                                                                  =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++ *.*. *.*.  .**.*.    .**.    .*.* .*   .*  *  *.   *.*.*         =
.*
       *.*    *    **      **.*    *.**    *  *.* :  :: : *.*     *.**   **=
 |
  1000 ++                                          :: : :             : :  =
 |
       |                                           ::  :              : :  =
 |
     0 ++-O----O-----------------------------------*---*---------------*---=
-+


                            slabinfo.mm_struct.num_objs

  7000 ++------------------------------------------------------------------=
-+
       O O  O    O                    O O       O O  O                     =
 |
  6000 ++     O    OO OO O OO O OO O O    OO OO    O                       =
 |
       |                                                                   =
 |
  5000 ++                                                                  =
 |
       |                                                                   =
 |
  4000 ++                                                                  =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++ *.*. *.*.  .**.*.    .**.    .*.* .*   .*  *  *.   *.*.*         =
.*
       *.*    *    **      **.*    *.**    *  *.* :  :: : *.*     *.**   **=
 |
  1000 ++                                          :: : :             : :  =
 |
       |                                           ::  :              : :  =
 |
     0 ++-O----O-----------------------------------*---*---------------*---=
-+


                          slabinfo.mm_struct.active_slabs

  400 ++-------------------------------------------------------------------=
-+
      O O  O O  O OO   OO O OO   O  O OO O OO O OO   O                     =
 |
  350 ++             O         O  O                O                       =
 |
  300 ++                                                                   =
 |
      |                                                                    =
 |
  250 ++                                                                   =
 |
      |                                                                    =
 |
  200 ++                                                                   =
 |
      |                                                                    =
 |
  150 ++                                                                   =
 |
  100 ++**.*. *.*.  .*.**.*. *.*.*   .**.*. *.   *   *  *.  .*.**.   *     =
.*
      *      *    **        *     *.*      *  *.* :  :  : **      *.* :  **=
 |
   50 ++                                          : : ::              : :  =
 |
      |                                            :: ::               ::  =
 |
    0 ++-O----O------------------------------------*--*----------------*---=
-+


                           slabinfo.mm_struct.num_slabs

  400 ++-------------------------------------------------------------------=
-+
      O O  O O  O OO   OO O OO   O  O OO O OO O OO   O                     =
 |
  350 ++             O         O  O                O                       =
 |
  300 ++                                                                   =
 |
      |                                                                    =
 |
  250 ++                                                                   =
 |
      |                                                                    =
 |
  200 ++                                                                   =
 |
      |                                                                    =
 |
  150 ++                                                                   =
 |
  100 ++**.*. *.*.  .*.**.*. *.*.*   .**.*. *.   *   *  *.  .*.**.   *     =
.*
      *      *    **        *     *.*      *  *.* :  :  : **      *.* :  **=
 |
   50 ++                                          : : ::              : :  =
 |
      |                                            :: ::               ::  =
 |
    0 ++-O----O------------------------------------*--*----------------*---=
-+


                         slabinfo.signal_cache.active_objs

  8000 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  7000 ++O    O    O          O                                            =
 |
  6000 O+   O    O  O OO O OO   OO O OO O OO OO O OO O                     =
 |
       |                                                                   =
 |
  5000 ++                                                                  =
 |
       |                                                                   =
 |
  4000 ++                                                  .*              =
 |
       *.**.*.**.*.**.**.*.**.*.**.*.**.*.**.**.*.*  *  *.*  *.*.**.**   **=
.*
  3000 ++                                         :  :  :            :   : =
 |
  2000 ++                                         : : : :             : :  =
 |
       |                                           :: : :             : :  =
 |
  1000 ++                                          :: ::              : :  =
 |
       |                                           :   :               :   =
 |
     0 ++-O----O-----------------------------------*---*---------------*---=
-+


                          slabinfo.signal_cache.num_objs

  8000 ++------------------------------------------------------------------=
-+
       |           O                                                       =
 |
  7000 O+O  O O  O  O OO O OO O OO O O  O OO OO   OO O                     =
 |
  6000 ++                             O         O                          =
 |
       |                                                                   =
 |
  5000 ++                                                                  =
 |
       |                                                                   =
 |
  4000 ++    .*                   .*.      *.              .*              =
 |
       *.**.*  *.*.**.**.*.**.*.**   **.*.*  **.*.*  *  *.*  *.*.**.**   **=
.*
  3000 ++                                         :  :  :            :   : =
 |
  2000 ++                                         : : : :             : :  =
 |
       |                                           :: : :             : :  =
 |
  1000 ++                                          :: ::              : :  =
 |
       |                                           :   :               :   =
 |
     0 ++-O----O-----------------------------------*---*---------------*---=
-+


                        slabinfo.signal_cache.active_slabs

  250 ++----------O--------------------------------------------------------=
-+
      | O  O O  O  O   OO O OO           O OO O  O O O                     =
 |
      O              O         O OO O OO        O                          =
 |
  200 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  150 ++                                                                   =
 |
      |  *. .**.   *. .**.    .*. *.   *. .**.       *  *. *.*.*           =
.*
  100 *+*  *    *.*  *    *.**   *  *.*  *    *.**   :  : *     *.*.**   **=
 |
      |                                          :  :: :             :   : =
 |
      |                                           : :: :              : :  =
 |
   50 ++                                          : : ::              : :  =
 |
      |                                           : : ::              : :  =
 |
      |                                            :  :                :   =
 |
    0 ++-O----O------------------------------------*--*----------------*---=
-+


                          slabinfo.signal_cache.num_slabs

  250 ++----------O--------------------------------------------------------=
-+
      | O  O O  O  O   OO O OO           O OO O  O O O                     =
 |
      O              O         O OO O OO        O                          =
 |
  200 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  150 ++                                                                   =
 |
      |  *. .**.   *. .**.    .*. *.   *. .**.       *  *. *.*.*           =
.*
  100 *+*  *    *.*  *    *.**   *  *.*  *    *.**   :  : *     *.*.**   **=
 |
      |                                          :  :: :             :   : =
 |
      |                                           : :: :              : :  =
 |
   50 ++                                          : : ::              : :  =
 |
      |                                           : : ::              : :  =
 |
      |                                            :  :                :   =
 |
    0 ++-O----O------------------------------------*--*----------------*---=
-+


                          slabinfo.kmalloc-192.active_objs

  35000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  30000 O+O  OO   OO   O  O            OO O  O  O   O                      =
 |
        |               O  O O OO O OO      O  O  O  O                     =
 |
  25000 ++           O                                                     =
 |
        |                                                                  =
 |
  20000 ++                                                                 =
 |
        |                                                                  =
 |
  15000 ++                                                                 =
 |
        |                                                                  =
 |
  10000 *+**.**.*.**.*.**.**.*.**.*.**.**.*.**.**.*  *   **.**.*.**.*.*  **=
.*
        |                                          : ::  :            :  : =
 |
   5000 ++                                         : :: :              ::  =
 |
        |                                           :  ::              ::  =
 |
      0 ++-O----O-----------------------------------*--*---------------*---=
-+


                            slabinfo.kmalloc-192.num_objs

  35000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  30000 O+O  OO   OO   OO O  O  O   O  OO O  O  O   O                      =
 |
        |            O     O   O  O  O      O  O  O  O                     =
 |
  25000 ++                                                                 =
 |
        |                                                                  =
 |
  20000 ++                                                                 =
 |
        |                                                                  =
 |
  15000 ++                                                                 =
 |
        |                                                                  =
 |
  10000 *+**.**.*.**.*.**.**.*.**.*.**.**.*.**.**.*  *   **.**.*.**.*.*  **=
.*
        |                                          : ::  :            :  : =
 |
   5000 ++                                         : :: :              ::  =
 |
        |                                           :  ::              ::  =
 |
      0 ++-O----O-----------------------------------*--*---------------*---=
-+


                         slabinfo.kmalloc-192.active_slabs

  800 ++-------------------------------------------------------------------=
-+
      | O    O  O    O                             O                       =
 |
  700 O+   O      O    OO O OO O OO O OO O  O   O    O                     =
 |
  600 ++           O                       O  O  O                         =
 |
      |                                                                    =
 |
  500 ++                                                                   =
 |
      |                                                                    =
 |
  400 ++                                                                   =
 |
      |                                                                    =
 |
  300 ++                                                                   =
 |
  200 *+**.*.**.*.**.*.**.*.**.*.**.*.**.*.**.*.**   *  *.**.*.**.*.**   **=
.*
      |                                           :  :  :             :  : =
 |
  100 ++                                          : : ::              : :  =
 |
      |                                            :: ::               ::  =
 |
    0 ++-O----O------------------------------------*--*----------------*---=
-+


                          slabinfo.kmalloc-192.num_slabs

  800 ++-------------------------------------------------------------------=
-+
      | O    O  O    O                             O                       =
 |
  700 O+   O      O    OO O OO O OO O OO O  O   O    O                     =
 |
  600 ++           O                       O  O  O                         =
 |
      |                                                                    =
 |
  500 ++                                                                   =
 |
      |                                                                    =
 |
  400 ++                                                                   =
 |
      |                                                                    =
 |
  300 ++                                                                   =
 |
  200 *+**.*.**.*.**.*.**.*.**.*.**.*.**.*.**.*.**   *  *.**.*.**.*.**   **=
.*
      |                                           :  :  :             :  : =
 |
  100 ++                                          : : ::              : :  =
 |
      |                                            :: ::               ::  =
 |
    0 ++-O----O------------------------------------*--*----------------*---=
-+


                          slabinfo.kmalloc-128.active_objs

  25000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
        |                                                                  =
 |
  20000 O+O   O   OO O  O  O      O  O            O  O                     =
 |
        |    O         O  O  O OO   O  OO O OO OO   O                      =
 |
        |                                                                  =
 |
  15000 ++                                                                 =
 |
        |                                                                  =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
        |     *.*.  .*.  .**.      .*      .**. *.   *   * .**.*.*   .*  * =
.*
   5000 *+**.*    **   **    *.**.*  *.**.*    *  *  ::  :*       *.* :  :*=
 |
        |                                          : :: :              ::  =
 |
        |                                          ::  ::              ::  =
 |
      0 ++-O----O-----------------------------------*--*---------------*---=
-+


                            slabinfo.kmalloc-128.num_objs

  25000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
        |                         O  O                                     =
 |
  20000 O+O   O   OO O  O OO O  O   O             O OO                     =
 |
        |    O         O       O       OO O OO OO                          =
 |
        |                                                                  =
 |
  15000 ++                                                                 =
 |
        |                                                                  =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
        |     *.*.  .*.  .**.      .*      .**. *.   *   * .**.*.*   .*  * =
.*
   5000 *+**.*    **   **    *.**.*  *.**.*    *  *  ::  :*       *.* :  :*=
 |
        |                                          : :: :              ::  =
 |
        |                                          ::  ::              ::  =
 |
      0 ++-O----O-----------------------------------*--*---------------*---=
-+


                         slabinfo.kmalloc-128.active_slabs

  700 ++-------------------------------------------------------------------=
-+
      O O          O             O  O                                      =
 |
  600 ++     O  O O  O OO O OO O  O    O O  O    O O O                     =
 |
      |    O                          O    O  O O                          =
 |
  500 ++                                                                   =
 |
      |                                                                    =
 |
  400 ++                                                                   =
 |
      |                                                                    =
 |
  300 ++                                                                   =
 |
      |                                                                    =
 |
  200 *+**.*.**.*.**.*.**.*.**.*.**.*.**.*.**.*.**   *  *.**.*.**.*.**   **=
.*
      |                                           :  :  :             :  : =
 |
  100 ++                                          : : ::              : :  =
 |
      |                                            :: ::               ::  =
 |
    0 ++-O----O------------------------------------*--*----------------*---=
-+


                          slabinfo.kmalloc-128.num_slabs

  700 ++-------------------------------------------------------------------=
-+
      O O          O             O  O                                      =
 |
  600 ++     O  O O  O OO O OO O  O    O O  O    O O O                     =
 |
      |    O                          O    O  O O                          =
 |
  500 ++                                                                   =
 |
      |                                                                    =
 |
  400 ++                                                                   =
 |
      |                                                                    =
 |
  300 ++                                                                   =
 |
      |                                                                    =
 |
  200 *+**.*.**.*.**.*.**.*.**.*.**.*.**.*.**.*.**   *  *.**.*.**.*.**   **=
.*
      |                                           :  :  :             :  : =
 |
  100 ++                                          : : ::              : :  =
 |
      |                                            :: ::               ::  =
 |
    0 ++-O----O------------------------------------*--*----------------*---=
-+


                           slabinfo.kmalloc-64.active_objs

  100000 ++----------------------------------------------------------------=
-+
   90000 O+        O  O  O    OO       O O        O                        =
 |
         | O  OO    O  O   OO    O OO O    OO OO O  O O                    =
 |
   80000 ++                                                                =
 |
   70000 ++                                                                =
 |
         |                                                                 =
 |
   60000 ++                                                                =
 |
   50000 *+            *.    .*      .*        *.     *  * .*. *.* .*.     =
 |
   40000 ++**.**.*.**.*  *.**  *.*.**  *.*.**.*  **   :  :*   *   *   *  **=
.*
         |                                        :  :: :             :  : =
 |
   30000 ++                                        : :: :             : :  =
 |
   20000 ++                                        : : ::              ::  =
 |
         |                                         : : ::              ::  =
 |
   10000 ++                                         :  :               :   =
 |
       0 ++-O----O----------------------------------*--*---------------*---=
-+


                            slabinfo.kmalloc-64.num_objs

  100000 ++----------------------------------------------------------------=
-+
   90000 O+        O  O  O O  OO       O O  O  O  O O                      =
 |
         | O  OO    O  O    O    O OO O    O  O  O    O                    =
 |
   80000 ++                                                                =
 |
   70000 ++                                                                =
 |
         |                                                                 =
 |
   60000 ++                                                                =
 |
   50000 *+            *.    .*      .*        *.     *  * .*. *.* .*.     =
 |
   40000 ++**.**.*.**.*  *.**  *.*.**  *.*.**.*  **   :  :*   *   *   *  **=
.*
         |                                        :  :: :             :  : =
 |
   30000 ++                                        : :: :             : :  =
 |
   20000 ++                                        : : ::              ::  =
 |
         |                                         : : ::              ::  =
 |
   10000 ++                                         :  :               :   =
 |
       0 ++-O----O----------------------------------*--*---------------*---=
-+


                         slabinfo.kmalloc-64.active_slabs

  1600 ++------------------------------------------------------------------=
-+
       O         O          O         O                                    =
 |
  1400 ++O  O O    OO OO O O  O OO O O  O OO OO O OO O                     =
 |
  1200 ++                                                                  =
 |
       |                                                                   =
 |
  1000 ++                                                                  =
 |
       |                                                                   =
 |
   800 *+                   *.      .*                                     =
 |
       | **.*.**.*.**.**.*.*  *.**.*  *.*.**.**.*.*  *  *.*.**.*.**.**   **=
.*
   600 ++                                         :  :  :            :   : =
 |
   400 ++                                         : : : :             : :  =
 |
       |                                           :: : :             : :  =
 |
   200 ++                                          :: ::              : :  =
 |
       |                                           :   :               :   =
 |
     0 ++-O----O-----------------------------------*---*---------------*---=
-+


                           slabinfo.kmalloc-64.num_slabs

  1600 ++------------------------------------------------------------------=
-+
       O         O          O         O                                    =
 |
  1400 ++O  O O    OO OO O O  O OO O O  O OO OO O OO O                     =
 |
  1200 ++                                                                  =
 |
       |                                                                   =
 |
  1000 ++                                                                  =
 |
       |                                                                   =
 |
   800 *+                   *.      .*                                     =
 |
       | **.*.**.*.**.**.*.*  *.**.*  *.*.**.**.*.*  *  *.*.**.*.**.**   **=
.*
   600 ++                                         :  :  :            :   : =
 |
   400 ++                                         : : : :             : :  =
 |
       |                                           :: : :             : :  =
 |
   200 ++                                          :: ::              : :  =
 |
       |                                           :   :               :   =
 |
     0 ++-O----O-----------------------------------*---*---------------*---=
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

--===============7887592675321010309==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogYWltOQpkZWZhdWx0LW1vbml0b3JzOgogIHdhaXQ6IGFjdGl2YXRlLW1vbml0b3IK
ICBrbXNnOiAKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0
OiAKICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJv
Yy1zdGF0OgogICAgaW50ZXJ2YWw6IDEwCiAgbWVtaW5mbzogCiAgc2xhYmluZm86IAogIGludGVy
cnVwdHM6IAogIGxvY2tfc3RhdDogCiAgbGF0ZW5jeV9zdGF0czogCiAgc29mdGlycXM6IAogIGJk
aV9kZXZfbWFwcGluZzogCiAgZGlza3N0YXRzOiAKICBuZnNzdGF0OiAKICBjcHVpZGxlOiAKICBj
cHVmcmVxLXN0YXRzOiAKICB0dXJib3N0YXQ6IAogIHBtZXRlcjogCiAgc2NoZWRfZGVidWc6CiAg
ICBpbnRlcnZhbDogNjAKY3B1ZnJlcV9nb3Zlcm5vcjogcGVyZm9ybWFuY2UKZGVmYXVsdC13YXRj
aGRvZ3M6CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IDA5MDVmMDRlYjIxZmMx
YzJlNjkwYmVkNWQwNDE4YTA2MWQ1NmMyMjUKbW9kZWw6IFdlc3RtZXJlLUVYCm1lbW9yeTogMTI4
Rwpucl9jcHU6IDgwCm5yX2hkZF9wYXJ0aXRpb25zOiAwCmhkZF9wYXJ0aXRpb25zOiAKc3dhcF9w
YXJ0aXRpb25zOiAKcm9vdGZzX3BhcnRpdGlvbjogCmNhdGVnb3J5OiBiZW5jaG1hcmsKcGVyZi1w
cm9maWxlOiAKYWltOToKICB0ZXN0dGltZTogMzAwcwogIHRlc3Q6IGZvcmtfdGVzdApxdWV1ZTog
YmlzZWN0CnRlc3Rib3g6IGxrcC13c3gwMgp0Ym94X2dyb3VwOiBsa3Atd3N4MDIKa2NvbmZpZzog
eDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE2LTAxLTA5IDE0OjM2OjAwLjAyMTk1MDExOCAr
MDg6MDAKaWQ6IDBjN2QyODRlZjg5YTY2ZTNiNmQwMjY5NGQwNGNhY2ViZjEwMmMwMjIKdXNlcjog
bGtwCmNvbXBpbGVyOiBnY2MtNC45CmhlYWRfY29tbWl0OiA0ZWM4ZDExNDUwYzlmZjhjNzYwZjgy
OTQyNzY2ZWViOWQxNWE0ODg4CmJhc2VfY29tbWl0OiAxNjgzMDk4NTVhN2QxZTE2ZGI3NTFlOWM2
NDcxMTlmZTJkMmRjODc4CmJyYW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTYwMTA3
MDIKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9yb290OiAiL3Jl
c3VsdC9haW05L3BlcmZvcm1hbmNlLTMwMHMtZm9ya190ZXN0L2xrcC13c3gwMi9kZWJpYW4teDg2
XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvMDkwNWYwNGViMjFmYzFjMmU2
OTBiZWQ1ZDA0MThhMDYxZDU2YzIyNS8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL2xrcC13
c3gwMi9iaXNlY3RfYWltOS1wZXJmb3JtYW5jZS0zMDBzLWZvcmtfdGVzdC1kZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6LXg4Nl82NC1yaGVsLTA5MDVmMDRlYjIxZmMxYzJlNjkwYmVkNWQwNDE4
YTA2MWQ1NmMyMjUtMjAxNjAxMDktOTY5MTgtcmVseThlLTAueWFtbCIKbWF4X3VwdGltZTogMTI5
Mi41Mgppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNn
eiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpvYj0v
bGtwL3NjaGVkdWxlZC9sa3Atd3N4MDIvYmlzZWN0X2FpbTktcGVyZm9ybWFuY2UtMzAwcy1mb3Jr
X3Rlc3QtZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei14ODZfNjQtcmhlbC0wOTA1ZjA0ZWIy
MWZjMWMyZTY5MGJlZDVkMDQxOGEwNjFkNTZjMjI1LTIwMTYwMTA5LTk2OTE4LXJlbHk4ZS0wLnlh
bWwKLSBBUkNIPXg4Nl82NAotIGtjb25maWc9eDg2XzY0LXJoZWwKLSBicmFuY2g9bGludXgtZGV2
ZWwvZGV2ZWwtaG91cmx5LTIwMTYwMTA3MDIKLSBjb21taXQ9MDkwNWYwNGViMjFmYzFjMmU2OTBi
ZWQ1ZDA0MThhMDYxZDU2YzIyNQotIEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQtcmhlbC9n
Y2MtNC45LzA5MDVmMDRlYjIxZmMxYzJlNjkwYmVkNWQwNDE4YTA2MWQ1NmMyMjUvdm1saW51ei00
LjQuMC1yYzgtMDAwNDMtZzA5MDVmMDQKLSBtYXhfdXB0aW1lPTEyOTIKLSBSRVNVTFRfUk9PVD0v
cmVzdWx0L2FpbTkvcGVyZm9ybWFuY2UtMzAwcy1mb3JrX3Rlc3QvbGtwLXdzeDAyL2RlYmlhbi14
ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS8wOTA1ZjA0ZWIyMWZjMWMy
ZTY5MGJlZDVkMDQxOGEwNjFkNTZjMjI1LzAKLSBMS1BfU0VSVkVSPWlubgotIHwyLQoKCiAgZWFy
bHlwcmludGs9dHR5UzAsMTE1MjAwIHN5c3RlbWQubG9nX2xldmVsPWVycgogIGRlYnVnIGFwaWM9
ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0
PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29w
cz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29uc29sZT10dHlTMCwx
MTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwKCiAgcncKbGtwX2luaXRyZDogIi9sa3AvbGtw
L2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwv
Z2NjLTQuOS8wOTA1ZjA0ZWIyMWZjMWMyZTY5MGJlZDVkMDQxOGEwNjFkNTZjMjI1L21vZHVsZXMu
Y2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5j
Z3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovcnVu
LWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ov
dHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFy
a3MvYWltOS14ODZfNjQuY2d6IgpsaW51eF9oZWFkZXJzX2luaXRyZDogIi9wa2cvbGludXgveDg2
XzY0LXJoZWwvZ2NjLTQuOS8wOTA1ZjA0ZWIyMWZjMWMyZTY5MGJlZDVkMDQxOGEwNjFkNTZjMjI1
L2xpbnV4LWhlYWRlcnMuY2d6IgpyZXBlYXRfdG86IDIKa2VybmVsOiAiL3BrZy9saW51eC94ODZf
NjQtcmhlbC9nY2MtNC45LzA5MDVmMDRlYjIxZmMxYzJlNjkwYmVkNWQwNDE4YTA2MWQ1NmMyMjUv
dm1saW51ei00LjQuMC1yYzgtMDAwNDMtZzA5MDVmMDQiCmRlcXVldWVfdGltZTogMjAxNi0wMS0w
OSAxNDo0NDoxNi40NTA4ODU1NzYgKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2Zzog
MS4xMCAwLjU4IDAuMjUgMi83NzggOTcwMApzdGFydF90aW1lOiAnMTQ1MjMyMTkxOCcKZW5kX3Rp
bWU6ICcxNDUyMzIyMjE4Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE2MDEwOC0xNzE2NTYi
Cg==

--===============7887592675321010309==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNi0wMS0wOSAxNDo0NToxNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0wOSAxNDo0NToxNyBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMS0wOSAxNDo0NToxNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDEtMDkgMTQ6NDU6MTcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA5IDE0OjQ1OjE3IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMS0wOSAxNDo0NToxNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEt
MDkgMTQ6NDU6MTcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA5IDE0OjQ1OjE3IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMS0wOSAxNDo0NToxNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMDkg
MTQ6NDU6MTcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA5IDE0OjQ1OjE3IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxOC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMS0wOSAxNDo0NToxNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMDkgMTQ6
NDU6MTcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMDkgMTQ6NDU6MTcgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTAxLTA5IDE0OjQ1OjE3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUyMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0wOSAxNDo0NTox
NyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjIvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMDkgMTQ6NDU6MTcgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTAxLTA5IDE0OjQ1OjE3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHUyNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0wOSAxNDo0NToxNyBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjUvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMDkgMTQ6NDU6MTcgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAxLTA5IDE0OjQ1OjE3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUyNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0wOSAxNDo0NToxNyBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjgvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDEtMDkgMTQ6NDU6MTcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAx
LTA5IDE0OjQ1OjE3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA5IDE0OjQ1OjE3IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMS0wOSAxNDo0NToxNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MzEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMDkg
MTQ6NDU6MTcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA5IDE0OjQ1OjE3IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMy9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMS0wOSAxNDo0NToxNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MzQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMDkgMTQ6
NDU6MTcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA5IDE0OjQ1OjE3IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMS0wOSAxNDo0NToxNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MzcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMDkgMTQ6NDU6
MTcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA5IDE0OjQ1OjE3IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wMS0wOSAxNDo0NToxNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0wOSAxNDo0NToxNyBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMDkgMTQ6NDU6MTcgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAxLTA5IDE0OjQ1OjE3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU0Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0wOSAxNDo0NToxNyBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDMvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDEtMDkgMTQ6NDU6MTcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAx
LTA5IDE0OjQ1OjE3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU0NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0wOSAxNDo0NToxNyBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDEtMDkgMTQ6NDU6MTcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTQ3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA5
IDE0OjQ1OjE3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0
OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0wOSAxNDo0NToxNyBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDkvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDEtMDkgMTQ6NDU6MTcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMDkgMTQ6
NDU6MTcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUwL2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA5IDE0OjQ1OjE3IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMS0wOSAxNDo0NToxNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NTIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMDkgMTQ6NDU6
MTcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUzL2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA5IDE0OjQ1OjE3IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wMS0wOSAxNDo0NToxNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMDkgMTQ6NDU6MTcg
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU2L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA5IDE0OjQ1OjE3IGVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAx
Ni0wMS0wOSAxNDo0NToxNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1NTgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMDkgMTQ6NDU6MTcgZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU5L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA5IDE0OjQ1OjE3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAx
LTA5IDE0OjQ1OjE3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU2MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0wOSAxNDo0NToxNyBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjEvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDEtMDkgMTQ6NDU6MTcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTYyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA5
IDE0OjQ1OjE3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2
My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0wOSAxNDo0NToxNyBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjQvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDEtMDkgMTQ6NDU6MTcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTY1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA5IDE0
OjQ1OjE3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2Ni9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0wOSAxNDo0NToxNyBlY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCjIwMTYtMDEtMDkgMTQ6NDU6MTcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTY4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA5IDE0OjQ1
OjE3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2OS9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0wOSAxNDo0NToxNyBlY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wMS0wOSAxNDo0NToxNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NzAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMDkgMTQ6NDU6MTcg
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcxL2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA5IDE0OjQ1OjE3IGVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAx
Ni0wMS0wOSAxNDo0NToxNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1NzMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMDkgMTQ6NDU6MTcgZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTc0L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA5IDE0OjQ1OjE3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHU3NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
MS0wOSAxNDo0NToxNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1NzYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMDkgMTQ6NDU6MTcgZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTc3L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgoyMDE2LTAxLTA5IDE0OjQ1OjE3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHU3OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0w
OSAxNDo0NToxNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
NzkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMDkgMTQ6NDU6MTcgZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDEtMDkgMTQ6NDU6MTcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCg==

--===============7887592675321010309==--

