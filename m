Content-Type: multipart/mixed; boundary="===============7502352515483536531=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [lib] 6ffc77f48b: 15.8% aim9.shell_rtns_2.ops_per_sec, +8.7% unixbench.score
Date: Mon, 01 Feb 2016 09:08:44 +0800
Message-ID: <87a8nlkzj7.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7502352515483536531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://github.com/0day-ci/linux Andi-Kleen/Optimize-int_sqrt-for-small-val=
ues-for-faster-idle/20160129-054629
commit 6ffc77f48b85ed9ab9a7b2754a7b49891ebaff83 ("Optimize int_sqrt for sma=
ll values for faster idle")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/testtime:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/ivb43/shell_=
rtns_2/aim9/300s

commit: =

  v4.5-rc1
  6ffc77f48b85ed9ab9a7b2754a7b49891ebaff83

        v4.5-rc1 6ffc77f48b85ed9ab9a7b2754a =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    383.55 =C2=B1  1%     +15.8%     444.19 =C2=B1  0%  aim9.shell_rtns_2.o=
ps_per_sec
    346042 =C2=B1  1%     +15.7%     400253 =C2=B1  0%  aim9.time.involunta=
ry_context_switches
  37653157 =C2=B1  1%     +16.0%   43669205 =C2=B1  0%  aim9.time.minor_pag=
e_faults
     50.58 =C2=B1  1%     +13.5%      57.41 =C2=B1  0%  aim9.time.user_time
    920242 =C2=B1  1%     +15.6%    1063902 =C2=B1  0%  aim9.time.voluntary=
_context_switches
    165192 =C2=B1  0%      -9.3%     149802 =C2=B1  0%  meminfo.Committed_AS
    858.50 =C2=B1112%    +159.7%       2229 =C2=B1  2%  numa-vmstat.node1.n=
r_inactive_anon
      1903 =C2=B1 34%     +49.7%       2850 =C2=B1  1%  numa-vmstat.node1.n=
r_mapped
     15155 =C2=B1  0%      +3.0%      15608 =C2=B1  0%  vmstat.system.cs
      1900 =C2=B1  3%      +8.5%       2061 =C2=B1  1%  vmstat.system.in
      1481 =C2=B1142%    +243.8%       5094 =C2=B1 20%  numa-meminfo.node1.=
AnonHugePages
      3435 =C2=B1112%    +159.6%       8918 =C2=B1  2%  numa-meminfo.node1.=
Inactive(anon)
      7619 =C2=B1 34%     +49.7%      11403 =C2=B1  1%  numa-meminfo.node1.=
Mapped
    346042 =C2=B1  1%     +15.7%     400253 =C2=B1  0%  time.involuntary_co=
ntext_switches
  37653157 =C2=B1  1%     +16.0%   43669205 =C2=B1  0%  time.minor_page_fau=
lts
     50.58 =C2=B1  1%     +13.5%      57.41 =C2=B1  0%  time.user_time
    920242 =C2=B1  1%     +15.6%    1063902 =C2=B1  0%  time.voluntary_cont=
ext_switches
  32159302 =C2=B1  2%     +16.1%   37352805 =C2=B1  0%  proc-vmstat.numa_hit
  32153109 =C2=B1  2%     +16.2%   37346613 =C2=B1  0%  proc-vmstat.numa_lo=
cal
      8294 =C2=B1  4%     +10.3%       9146 =C2=B1  3%  proc-vmstat.pgactiv=
ate
  31753265 =C2=B1  2%     +16.7%   37041704 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
  38274072 =C2=B1  1%     +15.7%   44274006 =C2=B1  0%  proc-vmstat.pgfault
  33586569 =C2=B1  2%     +16.4%   39090694 =C2=B1  0%  proc-vmstat.pgfree
      2.15 =C2=B1  2%     +31.0%       2.81 =C2=B1  1%  turbostat.%Busy
     69.83 =C2=B1  1%     +21.0%      84.50 =C2=B1  1%  turbostat.Avg_MHz
     14.71 =C2=B1 30%    +364.4%      68.29 =C2=B1  2%  turbostat.CPU%c1
      0.13 =C2=B1115%   +4530.3%       5.86 =C2=B1  5%  turbostat.CPU%c3
     83.02 =C2=B1  5%     -72.3%      23.04 =C2=B1  6%  turbostat.CPU%c6
     67.08 =C2=B1  1%     +15.6%      77.53 =C2=B1  0%  turbostat.CorWatt
     13.68 =C2=B1 13%     -96.9%       0.42 =C2=B1102%  turbostat.Pkg%pc2
     97.47 =C2=B1  0%     +10.7%     107.90 =C2=B1  0%  turbostat.PkgWatt
 4.115e+08 =C2=B1 95%   +1040.5%  4.693e+09 =C2=B1  3%  cpuidle.C1-IVT.time
     35607 =C2=B1 31%    +459.1%     199082 =C2=B1  1%  cpuidle.C1-IVT.usage
    692205 =C2=B1 47%  +1.4e+05%  9.935e+08 =C2=B1  2%  cpuidle.C1E-IVT.time
      1987 =C2=B1 17%   +9685.5%     194454 =C2=B1  1%  cpuidle.C1E-IVT.usa=
ge
  17330705 =C2=B1111%   +5212.9%  9.208e+08 =C2=B1  4%  cpuidle.C3-IVT.time
      6416 =C2=B1 72%   +4164.8%     273664 =C2=B1  2%  cpuidle.C3-IVT.usage
  1.37e+10 =C2=B1  3%     -45.7%  7.434e+09 =C2=B1  2%  cpuidle.C6-IVT.time
   2046699 =C2=B1  1%     -20.6%    1625729 =C2=B1  2%  cpuidle.C6-IVT.usage
   9298422 =C2=B1 67%    +725.2%   76732660 =C2=B1  5%  cpuidle.POLL.time
     21792 =C2=B1 13%     -19.9%      17456 =C2=B1  6%  cpuidle.POLL.usage
      8535 =C2=B1  2%      +8.7%       9274 =C2=B1  2%  slabinfo.anon_vma.a=
ctive_objs
      8535 =C2=B1  2%      +8.7%       9274 =C2=B1  2%  slabinfo.anon_vma.n=
um_objs
     25398 =C2=B1  3%     +22.3%      31057 =C2=B1  1%  slabinfo.anon_vma_c=
hain.active_objs
     25427 =C2=B1  3%     +22.5%      31141 =C2=B1  1%  slabinfo.anon_vma_c=
hain.num_objs
     14169 =C2=B1  5%     -13.4%      12270 =C2=B1  0%  slabinfo.kmalloc-25=
6.active_objs
     14612 =C2=B1  5%     -12.5%      12786 =C2=B1  0%  slabinfo.kmalloc-25=
6.num_objs
     39366 =C2=B1  7%     +40.7%      55384 =C2=B1  3%  slabinfo.kmalloc-32=
.active_objs
    307.00 =C2=B1  7%     +41.3%     433.75 =C2=B1  3%  slabinfo.kmalloc-32=
.active_slabs
     39366 =C2=B1  7%     +41.2%      55578 =C2=B1  3%  slabinfo.kmalloc-32=
.num_objs
    307.00 =C2=B1  7%     +41.3%     433.75 =C2=B1  3%  slabinfo.kmalloc-32=
.num_slabs
      1087 =C2=B1  5%      -9.7%     982.50 =C2=B1  1%  slabinfo.mm_struct.=
active_objs
      1087 =C2=B1  5%      -9.7%     982.50 =C2=B1  1%  slabinfo.mm_struct.=
num_objs
      2313 =C2=B1  2%     +12.8%       2609 =C2=B1  3%  slabinfo.signal_cac=
he.active_objs
      2313 =C2=B1  2%     +12.8%       2609 =C2=B1  3%  slabinfo.signal_cac=
he.num_objs
     21538 =C2=B1  1%     +17.1%      25215 =C2=B1  1%  slabinfo.vm_area_st=
ruct.active_objs
     21595 =C2=B1  1%     +17.1%      25279 =C2=B1  1%  slabinfo.vm_area_st=
ruct.num_objs
      2.49 =C2=B1 16%     +38.3%       3.44 =C2=B1 16%  perf-profile.cycles=
-pp.__libc_fork
     39.88 =C2=B1  9%     -26.1%      29.47 =C2=B1 23%  perf-profile.cycles=
-pp.call_cpuidle.cpu_startup_entry.start_secondary
     43.97 =C2=B1  9%     -24.6%      33.16 =C2=B1 21%  perf-profile.cycles=
-pp.cpu_startup_entry.start_secondary
     39.88 =C2=B1  9%     -26.1%      29.46 =C2=B1 23%  perf-profile.cycles=
-pp.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_secondary
     39.49 =C2=B1  9%     -26.3%      29.10 =C2=B1 23%  perf-profile.cycles=
-pp.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_=
secondary
      2.55 =C2=B1 41%     +81.3%       4.62 =C2=B1 29%  perf-profile.cycles=
-pp.do_execveat_common.isra.35.sys_execve.return_from_execve
      9.63 =C2=B1 15%     +30.1%      12.53 =C2=B1 15%  perf-profile.cycles=
-pp.do_page_fault.page_fault
      3.14 =C2=B1 11%     +58.7%       4.99 =C2=B1 20%  perf-profile.cycles=
-pp.execve
      0.75 =C2=B1 10%     +31.3%       0.98 =C2=B1 11%  perf-profile.cycles=
-pp.filename_lookup.user_path_at_empty.sys_access.entry_SYSCALL_64_fastpath
      0.84 =C2=B1 13%     +38.1%       1.16 =C2=B1 16%  perf-profile.cycles=
-pp.free_pages_and_swap_cache.tlb_flush_mmu_free.tlb_finish_mmu.exit_mmap.m=
mput
      8.60 =C2=B1 23%     +37.6%      11.84 =C2=B1 11%  perf-profile.cycles=
-pp.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
     40.37 =C2=B1 10%     -26.5%      29.67 =C2=B1 23%  perf-profile.cycles=
-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_e=
ntry
      0.75 =C2=B1 16%     +99.7%       1.51 =C2=B1 27%  perf-profile.cycles=
-pp.load_elf_binary.search_binary_handler.load_script.search_binary_handler=
.do_execveat_common
      0.84 =C2=B1 15%     +94.7%       1.63 =C2=B1 27%  perf-profile.cycles=
-pp.load_script.search_binary_handler.do_execveat_common.sys_execve.return_=
from_execve
      0.71 =C2=B1 10%     +30.9%       0.92 =C2=B1 12%  perf-profile.cycles=
-pp.path_lookupat.filename_lookup.user_path_at_empty.sys_access.entry_SYSCA=
LL_64_fastpath
      0.75 =C2=B1 13%     +39.9%       1.04 =C2=B1 16%  perf-profile.cycles=
-pp.release_pages.free_pages_and_swap_cache.tlb_flush_mmu_free.tlb_finish_m=
mu.exit_mmap
      2.15 =C2=B1 11%     +51.3%       3.25 =C2=B1 20%  perf-profile.cycles=
-pp.return_from_execve.execve
      0.76 =C2=B1 16%     +98.2%       1.51 =C2=B1 27%  perf-profile.cycles=
-pp.search_binary_handler.load_script.search_binary_handler.do_execveat_com=
mon.sys_execve
     44.09 =C2=B1  9%     -24.5%      33.28 =C2=B1 21%  perf-profile.cycles=
-pp.start_secondary
      1.12 =C2=B1  6%     +23.8%       1.39 =C2=B1  8%  perf-profile.cycles=
-pp.sys_access.entry_SYSCALL_64_fastpath
      2.13 =C2=B1 11%     +53.6%       3.28 =C2=B1 19%  perf-profile.cycles=
-pp.sys_execve.return_from_execve.execve
      1.55 =C2=B1 90%    +179.7%       4.33 =C2=B1 13%  perf-profile.cycles=
-pp.sys_mmap.entry_SYSCALL_64_fastpath
      0.80 =C2=B1 11%     +31.0%       1.05 =C2=B1 11%  perf-profile.cycles=
-pp.user_path_at_empty.sys_access.entry_SYSCALL_64_fastpath
      4128 =C2=B1  9%     +17.8%       4862 =C2=B1  4%  sched_debug.cfs_rq:=
/.exec_clock.11
      4062 =C2=B1  8%     +18.4%       4809 =C2=B1  4%  sched_debug.cfs_rq:=
/.exec_clock.12
      4064 =C2=B1 13%     +34.4%       5461 =C2=B1 27%  sched_debug.cfs_rq:=
/.exec_clock.15
      3879 =C2=B1 14%     +41.0%       5469 =C2=B1 22%  sched_debug.cfs_rq:=
/.exec_clock.18
      3831 =C2=B1 12%     +44.1%       5522 =C2=B1 26%  sched_debug.cfs_rq:=
/.exec_clock.19
      3881 =C2=B1 14%     +18.1%       4582 =C2=B1  3%  sched_debug.cfs_rq:=
/.exec_clock.20
      3658 =C2=B1 14%     -30.8%       2529 =C2=B1 18%  sched_debug.cfs_rq:=
/.exec_clock.25
      3756 =C2=B1 17%     -31.4%       2575 =C2=B1  6%  sched_debug.cfs_rq:=
/.exec_clock.26
      3722 =C2=B1 15%     -32.2%       2524 =C2=B1 10%  sched_debug.cfs_rq:=
/.exec_clock.27
      4727 =C2=B1 20%     -31.5%       3240 =C2=B1 23%  sched_debug.cfs_rq:=
/.exec_clock.28
      4448 =C2=B1 13%     +20.7%       5369 =C2=B1  9%  sched_debug.cfs_rq:=
/.exec_clock.3
      3768 =C2=B1 18%     -32.1%       2559 =C2=B1  5%  sched_debug.cfs_rq:=
/.exec_clock.30
      3743 =C2=B1 16%     -38.2%       2312 =C2=B1  3%  sched_debug.cfs_rq:=
/.exec_clock.31
      3675 =C2=B1 15%     -31.9%       2501 =C2=B1 14%  sched_debug.cfs_rq:=
/.exec_clock.32
      3657 =C2=B1 14%     -33.4%       2434 =C2=B1  7%  sched_debug.cfs_rq:=
/.exec_clock.33
      3653 =C2=B1 15%     -27.1%       2663 =C2=B1 12%  sched_debug.cfs_rq:=
/.exec_clock.34
      3102 =C2=B1 19%     -27.2%       2257 =C2=B1  2%  sched_debug.cfs_rq:=
/.exec_clock.37
      3262 =C2=B1 18%     -30.5%       2269 =C2=B1  2%  sched_debug.cfs_rq:=
/.exec_clock.39
      3315 =C2=B1 16%     -25.5%       2469 =C2=B1  8%  sched_debug.cfs_rq:=
/.exec_clock.40
      3250 =C2=B1 18%     -29.6%       2287 =C2=B1  6%  sched_debug.cfs_rq:=
/.exec_clock.43
      3210 =C2=B1 13%     -28.2%       2304 =C2=B1  5%  sched_debug.cfs_rq:=
/.exec_clock.44
      3140 =C2=B1 16%     -25.7%       2332 =C2=B1 11%  sched_debug.cfs_rq:=
/.exec_clock.46
      4772 =C2=B1  9%     -24.0%       3625 =C2=B1  7%  sched_debug.cfs_rq:=
/.exec_clock.47
      4293 =C2=B1  9%     +23.1%       5283 =C2=B1  3%  sched_debug.cfs_rq:=
/.exec_clock.5
      2601 =C2=B1 10%     -22.9%       2007 =C2=B1  6%  sched_debug.cfs_rq:=
/.exec_clock.min
      1245 =C2=B1 11%     +37.0%       1706 =C2=B1  3%  sched_debug.cfs_rq:=
/.exec_clock.stddev
      4.50 =C2=B1 58%    +883.3%      44.25 =C2=B1115%  sched_debug.cfs_rq:=
/.load_avg.15
      2.00 =C2=B1141%   +2012.5%      42.25 =C2=B1 91%  sched_debug.cfs_rq:=
/.load_avg.26
     92810 =C2=B1  7%     +24.5%     115532 =C2=B1  5%  sched_debug.cfs_rq:=
/.min_vruntime.0
     85375 =C2=B1 10%     +16.7%      99616 =C2=B1  8%  sched_debug.cfs_rq:=
/.min_vruntime.1
     84119 =C2=B1  9%     +17.3%      98679 =C2=B1  6%  sched_debug.cfs_rq:=
/.min_vruntime.11
     76159 =C2=B1 14%     +26.3%      96158 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.12
     73708 =C2=B1 11%     +22.3%      90163 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.13
     73462 =C2=B1 12%     +22.8%      90186 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.14
     78532 =C2=B1 11%     +18.3%      92890 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.15
     75619 =C2=B1 15%     +23.4%      93308 =C2=B1  5%  sched_debug.cfs_rq:=
/.min_vruntime.18
     73782 =C2=B1 12%     +26.1%      93064 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.19
     85825 =C2=B1 12%     +16.9%     100371 =C2=B1  6%  sched_debug.cfs_rq:=
/.min_vruntime.2
     73784 =C2=B1 14%     +26.7%      93455 =C2=B1  3%  sched_debug.cfs_rq:=
/.min_vruntime.20
     77996 =C2=B1 11%     +25.4%      97835 =C2=B1  8%  sched_debug.cfs_rq:=
/.min_vruntime.21
     75401 =C2=B1 12%     +24.0%      93489 =C2=B1  3%  sched_debug.cfs_rq:=
/.min_vruntime.22
     71851 =C2=B1 10%     +25.9%      90432 =C2=B1  8%  sched_debug.cfs_rq:=
/.min_vruntime.23
     85321 =C2=B1 16%     -25.5%      63569 =C2=B1 11%  sched_debug.cfs_rq:=
/.min_vruntime.24
     84385 =C2=B1 16%     -37.7%      52578 =C2=B1 19%  sched_debug.cfs_rq:=
/.min_vruntime.25
     86487 =C2=B1 19%     -38.7%      52989 =C2=B1 10%  sched_debug.cfs_rq:=
/.min_vruntime.26
     85768 =C2=B1 18%     -40.0%      51463 =C2=B1 14%  sched_debug.cfs_rq:=
/.min_vruntime.27
     86568 =C2=B1 17%     -35.1%      56182 =C2=B1  9%  sched_debug.cfs_rq:=
/.min_vruntime.29
     87224 =C2=B1 19%     -38.6%      53580 =C2=B1 10%  sched_debug.cfs_rq:=
/.min_vruntime.30
     86397 =C2=B1 16%     -44.6%      47867 =C2=B1  6%  sched_debug.cfs_rq:=
/.min_vruntime.31
     84687 =C2=B1 17%     -39.7%      51047 =C2=B1 15%  sched_debug.cfs_rq:=
/.min_vruntime.32
     84737 =C2=B1 15%     -43.4%      47972 =C2=B1 11%  sched_debug.cfs_rq:=
/.min_vruntime.33
     84538 =C2=B1 17%     -37.4%      52927 =C2=B1 17%  sched_debug.cfs_rq:=
/.min_vruntime.34
     82873 =C2=B1 16%     -37.1%      52164 =C2=B1  8%  sched_debug.cfs_rq:=
/.min_vruntime.35
     70798 =C2=B1 20%     -27.7%      51222 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.36
     71650 =C2=B1 21%     -35.4%      46267 =C2=B1  5%  sched_debug.cfs_rq:=
/.min_vruntime.37
     72302 =C2=B1 21%     -36.2%      46131 =C2=B1 10%  sched_debug.cfs_rq:=
/.min_vruntime.38
     73956 =C2=B1 20%     -39.9%      44478 =C2=B1  6%  sched_debug.cfs_rq:=
/.min_vruntime.39
     74719 =C2=B1 18%     -35.9%      47906 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.40
     73599 =C2=B1 18%     -41.1%      43371 =C2=B1  7%  sched_debug.cfs_rq:=
/.min_vruntime.41
     74129 =C2=B1 19%     -35.8%      47573 =C2=B1  8%  sched_debug.cfs_rq:=
/.min_vruntime.42
     74757 =C2=B1 21%     -37.4%      46822 =C2=B1  9%  sched_debug.cfs_rq:=
/.min_vruntime.43
     71249 =C2=B1 18%     -38.7%      43668 =C2=B1  3%  sched_debug.cfs_rq:=
/.min_vruntime.44
     70889 =C2=B1 17%     -33.9%      46869 =C2=B1  6%  sched_debug.cfs_rq:=
/.min_vruntime.46
     74088 =C2=B1 17%     -38.5%      45599 =C2=B1 12%  sched_debug.cfs_rq:=
/.min_vruntime.47
     80424 =C2=B1  3%      -8.9%      73252 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.avg
    105781 =C2=B1  3%     +10.4%     116776 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.max
     57525 =C2=B1 10%     -32.3%      38928 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.min
     14190 =C2=B1 24%     +74.0%      24696 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
     -7435 =C2=B1-42%    +114.1%     -15916 =C2=B1-24%  sched_debug.cfs_rq:=
/.spread0.1
     -6966 =C2=B1-86%    +135.3%     -16394 =C2=B1-33%  sched_debug.cfs_rq:=
/.spread0.10
     -7496 =C2=B1-108%    +593.2%     -51965 =C2=B1 -6%  sched_debug.cfs_rq=
:/.spread0.24
     -8433 =C2=B1-93%    +646.5%     -62957 =C2=B1 -7%  sched_debug.cfs_rq:=
/.spread0.25
     -6331 =C2=B1-163%    +887.9%     -62545 =C2=B1 -7%  sched_debug.cfs_rq=
:/.spread0.26
     -7049 =C2=B1-132%    +808.8%     -64072 =C2=B1-10%  sched_debug.cfs_rq=
:/.spread0.27
     -4943 =C2=B1-273%   +1076.4%     -58160 =C2=B1-10%  sched_debug.cfs_rq=
:/.spread0.28
     -6250 =C2=B1-142%    +849.5%     -59353 =C2=B1 -5%  sched_debug.cfs_rq=
:/.spread0.29
     -5595 =C2=B1-201%   +1007.3%     -61955 =C2=B1 -6%  sched_debug.cfs_rq=
:/.spread0.30
     -6423 =C2=B1-124%    +953.4%     -67668 =C2=B1 -7%  sched_debug.cfs_rq=
:/.spread0.31
     -8133 =C2=B1-103%    +692.9%     -64488 =C2=B1 -7%  sched_debug.cfs_rq=
:/.spread0.32
     -8083 =C2=B1-81%    +735.9%     -67563 =C2=B1 -5%  sched_debug.cfs_rq:=
/.spread0.33
     -8282 =C2=B1-100%    +655.9%     -62608 =C2=B1 -9%  sched_debug.cfs_rq=
:/.spread0.34
     -9948 =C2=B1-74%    +537.0%     -63371 =C2=B1 -7%  sched_debug.cfs_rq:=
/.spread0.35
    -22023 =C2=B1-94%    +192.0%     -64313 =C2=B1-10%  sched_debug.cfs_rq:=
/.spread0.36
    -21171 =C2=B1-100%    +227.2%     -69269 =C2=B1 -6%  sched_debug.cfs_rq=
:/.spread0.37
    -20521 =C2=B1-103%    +238.2%     -69404 =C2=B1 -7%  sched_debug.cfs_rq=
:/.spread0.38
    -18866 =C2=B1-112%    +276.6%     -71058 =C2=B1 -6%  sched_debug.cfs_rq=
:/.spread0.39
    -18104 =C2=B1-110%    +273.6%     -67630 =C2=B1-11%  sched_debug.cfs_rq=
:/.spread0.40
    -19223 =C2=B1-99%    +275.4%     -72165 =C2=B1 -9%  sched_debug.cfs_rq:=
/.spread0.41
    -18694 =C2=B1-109%    +263.5%     -67963 =C2=B1-11%  sched_debug.cfs_rq=
:/.spread0.42
    -18066 =C2=B1-122%    +280.3%     -68713 =C2=B1 -4%  sched_debug.cfs_rq=
:/.spread0.43
    -21575 =C2=B1-87%    +233.1%     -71868 =C2=B1 -7%  sched_debug.cfs_rq:=
/.spread0.44
    -22907 =C2=B1-95%    +196.5%     -67923 =C2=B1 -6%  sched_debug.cfs_rq:=
/.spread0.45
    -21935 =C2=B1-83%    +213.0%     -68667 =C2=B1 -9%  sched_debug.cfs_rq:=
/.spread0.46
    -18737 =C2=B1-101%    +273.3%     -69937 =C2=B1 -8%  sched_debug.cfs_rq=
:/.spread0.47
     -3013 =C2=B1-283%    +514.6%     -18522 =C2=B1-37%  sched_debug.cfs_rq=
:/.spread0.6
     -5884 =C2=B1-109%    +282.8%     -22524 =C2=B1-27%  sched_debug.cfs_rq=
:/.spread0.7
     -7321 =C2=B1-61%    +190.8%     -21286 =C2=B1-17%  sched_debug.cfs_rq:=
/.spread0.8
     -8126 =C2=B1-67%    +148.3%     -20175 =C2=B1-28%  sched_debug.cfs_rq:=
/.spread0.9
    -12393 =C2=B1-54%    +241.2%     -42282 =C2=B1-11%  sched_debug.cfs_rq:=
/.spread0.avg
     12967 =C2=B1 38%     -90.4%       1243 =C2=B1 81%  sched_debug.cfs_rq:=
/.spread0.max
    -35294 =C2=B1-29%    +117.1%     -76608 =C2=B1 -8%  sched_debug.cfs_rq:=
/.spread0.min
     14191 =C2=B1 24%     +74.0%      24697 =C2=B1  1%  sched_debug.cfs_rq:=
/.spread0.stddev
     28.17 =C2=B1 19%    +133.4%      65.75 =C2=B1 57%  sched_debug.cfs_rq:=
/.util_avg.2
     32.17 =C2=B1 42%     -62.7%      12.00 =C2=B1113%  sched_debug.cfs_rq:=
/.util_avg.40
     51.00 =C2=B1 74%     -82.4%       9.00 =C2=B1 47%  sched_debug.cfs_rq:=
/.util_avg.45
    980055 =C2=B1  1%     -16.2%     821316 =C2=B1  7%  sched_debug.cpu.avg=
_idle.2
    974897 =C2=B1  2%     -10.6%     872035 =C2=B1  6%  sched_debug.cpu.avg=
_idle.21
    970838 =C2=B1  3%     -17.5%     800879 =C2=B1  9%  sched_debug.cpu.avg=
_idle.24
    922584 =C2=B1  5%     -13.3%     799667 =C2=B1  6%  sched_debug.cpu.avg=
_idle.25
    939820 =C2=B1  6%     -14.1%     807532 =C2=B1  4%  sched_debug.cpu.avg=
_idle.26
    972194 =C2=B1  3%     -15.5%     821130 =C2=B1  8%  sched_debug.cpu.avg=
_idle.27
    943576 =C2=B1  4%     -15.6%     795980 =C2=B1  8%  sched_debug.cpu.avg=
_idle.28
    972757 =C2=B1  4%     -11.8%     858039 =C2=B1  7%  sched_debug.cpu.avg=
_idle.29
    935963 =C2=B1  4%     -15.2%     793464 =C2=B1  3%  sched_debug.cpu.avg=
_idle.31
    961054 =C2=B1  4%     -20.4%     765294 =C2=B1  7%  sched_debug.cpu.avg=
_idle.32
    953272 =C2=B1  4%     -15.5%     805746 =C2=B1  1%  sched_debug.cpu.avg=
_idle.33
    957697 =C2=B1  3%     -19.9%     767409 =C2=B1  9%  sched_debug.cpu.avg=
_idle.35
    976711 =C2=B1  2%     -14.0%     840209 =C2=B1  6%  sched_debug.cpu.avg=
_idle.39
    944871 =C2=B1  3%     -13.8%     814393 =C2=B1  4%  sched_debug.cpu.avg=
_idle.40
    944464 =C2=B1  4%     -17.5%     779383 =C2=B1  4%  sched_debug.cpu.avg=
_idle.42
    960406 =C2=B1  4%     -16.8%     799490 =C2=B1 11%  sched_debug.cpu.avg=
_idle.43
    915603 =C2=B1  5%     -14.6%     781850 =C2=B1  8%  sched_debug.cpu.avg=
_idle.44
    954052 =C2=B1  4%     -13.2%     827775 =C2=B1  5%  sched_debug.cpu.avg=
_idle.46
    950001 =C2=B1  2%      -8.9%     865227 =C2=B1  0%  sched_debug.cpu.avg=
_idle.avg
    566441 =C2=B1 14%     -31.7%     386678 =C2=B1 12%  sched_debug.cpu.avg=
_idle.min
     95996 =C2=B1 24%     +77.9%     170770 =C2=B1  2%  sched_debug.cpu.avg=
_idle.stddev
     10.00 =C2=B1 19%     +37.9%      13.79 =C2=B1 22%  sched_debug.cpu.cpu=
_load[1].max
     33187 =C2=B1  9%     -12.3%      29089 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.1
     33201 =C2=B1  9%     -14.1%      28515 =C2=B1  1%  sched_debug.cpu.nr_=
load_updates.14
     32980 =C2=B1  9%     -15.6%      27828 =C2=B1  2%  sched_debug.cpu.nr_=
load_updates.2
     18677 =C2=B1 11%     -33.2%      12473 =C2=B1  8%  sched_debug.cpu.nr_=
load_updates.24
     18489 =C2=B1 13%     -41.7%      10787 =C2=B1 13%  sched_debug.cpu.nr_=
load_updates.25
     18563 =C2=B1 13%     -43.2%      10537 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.26
     19106 =C2=B1 10%     -44.0%      10694 =C2=B1  5%  sched_debug.cpu.nr_=
load_updates.27
     18840 =C2=B1 14%     -39.1%      11482 =C2=B1  6%  sched_debug.cpu.nr_=
load_updates.28
     19114 =C2=B1 12%     -39.8%      11513 =C2=B1  7%  sched_debug.cpu.nr_=
load_updates.29
     33625 =C2=B1 10%     -13.2%      29191 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.3
     19486 =C2=B1 11%     -42.0%      11305 =C2=B1  6%  sched_debug.cpu.nr_=
load_updates.30
     19086 =C2=B1  9%     -46.3%      10242 =C2=B1  2%  sched_debug.cpu.nr_=
load_updates.31
     18883 =C2=B1  9%     -43.0%      10772 =C2=B1  6%  sched_debug.cpu.nr_=
load_updates.32
     18809 =C2=B1 10%     -42.5%      10815 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.33
     18641 =C2=B1 13%     -37.1%      11717 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.34
     18649 =C2=B1 13%     -41.6%      10892 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.35
     17519 =C2=B1 14%     -36.1%      11197 =C2=B1  1%  sched_debug.cpu.nr_=
load_updates.36
     17605 =C2=B1 13%     -41.2%      10358 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.37
     17665 =C2=B1  9%     -41.1%      10402 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.38
     18083 =C2=B1  9%     -46.4%       9697 =C2=B1  1%  sched_debug.cpu.nr_=
load_updates.39
     33633 =C2=B1  8%     -16.6%      28066 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.4
     18017 =C2=B1 11%     -41.3%      10576 =C2=B1  5%  sched_debug.cpu.nr_=
load_updates.40
     17842 =C2=B1  8%     -46.1%       9614 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.41
     17845 =C2=B1 10%     -39.4%      10814 =C2=B1 10%  sched_debug.cpu.nr_=
load_updates.42
     17710 =C2=B1 12%     -42.2%      10238 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.43
     17732 =C2=B1  9%     -41.9%      10307 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.44
     17219 =C2=B1 13%     -35.3%      11147 =C2=B1 10%  sched_debug.cpu.nr_=
load_updates.45
     17973 =C2=B1  6%     -40.7%      10665 =C2=B1  6%  sched_debug.cpu.nr_=
load_updates.46
     17454 =C2=B1  7%     -42.7%      10006 =C2=B1  9%  sched_debug.cpu.nr_=
load_updates.47
     33843 =C2=B1  8%     -17.7%      27852 =C2=B1  2%  sched_debug.cpu.nr_=
load_updates.5
     33752 =C2=B1  6%     -18.6%      27463 =C2=B1  1%  sched_debug.cpu.nr_=
load_updates.6
     33530 =C2=B1  7%     -20.6%      26609 =C2=B1  0%  sched_debug.cpu.nr_=
load_updates.7
     33082 =C2=B1  7%     -17.8%      27202 =C2=B1  1%  sched_debug.cpu.nr_=
load_updates.8
     25769 =C2=B1  3%     -22.9%      19863 =C2=B1  1%  sched_debug.cpu.nr_=
load_updates.avg
     38510 =C2=B1  3%     -15.1%      32687 =C2=B1  2%  sched_debug.cpu.nr_=
load_updates.max
     15222 =C2=B1 10%     -41.0%       8984 =C2=B1  2%  sched_debug.cpu.nr_=
load_updates.min
      8024 =C2=B1  3%     +15.1%       9238 =C2=B1  0%  sched_debug.cpu.nr_=
load_updates.stddev
     70059 =C2=B1 11%     +18.0%      82660 =C2=B1  1%  sched_debug.cpu.nr_=
switches.0
     68459 =C2=B1 13%     +20.8%      82677 =C2=B1  6%  sched_debug.cpu.nr_=
switches.19
     67062 =C2=B1  8%     +30.8%      87722 =C2=B1 12%  sched_debug.cpu.nr_=
switches.21
     65279 =C2=B1 12%     +35.1%      88170 =C2=B1 15%  sched_debug.cpu.nr_=
switches.22
     27625 =C2=B1  9%     -20.7%      21898 =C2=B1  4%  sched_debug.cpu.nr_=
switches.26
     29791 =C2=B1  9%     -24.7%      22431 =C2=B1  6%  sched_debug.cpu.nr_=
switches.27
     30900 =C2=B1  5%     -21.5%      24260 =C2=B1 13%  sched_debug.cpu.nr_=
switches.30
     29669 =C2=B1  7%     -22.8%      22918 =C2=B1 15%  sched_debug.cpu.nr_=
switches.31
     30269 =C2=B1  6%     -24.3%      22926 =C2=B1  4%  sched_debug.cpu.nr_=
switches.32
     29870 =C2=B1  9%     -23.0%      22992 =C2=B1  3%  sched_debug.cpu.nr_=
switches.33
     29304 =C2=B1 16%     -20.1%      23410 =C2=B1  7%  sched_debug.cpu.nr_=
switches.35
     28165 =C2=B1  6%     -20.9%      22271 =C2=B1  6%  sched_debug.cpu.nr_=
switches.38
     29903 =C2=B1  3%     -26.0%      22122 =C2=B1 22%  sched_debug.cpu.nr_=
switches.39
     29541 =C2=B1  6%     -30.0%      20684 =C2=B1 13%  sched_debug.cpu.nr_=
switches.41
     30230 =C2=B1  7%     -22.8%      23349 =C2=B1 14%  sched_debug.cpu.nr_=
switches.42
     28699 =C2=B1  7%     -22.5%      22246 =C2=B1  4%  sched_debug.cpu.nr_=
switches.44
     30831 =C2=B1 13%     -25.7%      22905 =C2=B1  9%  sched_debug.cpu.nr_=
switches.46
     31671 =C2=B1 18%     -30.8%      21925 =C2=B1 11%  sched_debug.cpu.nr_=
switches.47
     23090 =C2=B1  3%     -23.9%      17565 =C2=B1  2%  sched_debug.cpu.nr_=
switches.min
     20540 =C2=B1  5%     +29.4%      26576 =C2=B1  1%  sched_debug.cpu.nr_=
switches.stddev
    -10.50 =C2=B1-41%     +71.4%     -18.00 =C2=B1-18%  sched_debug.cpu.nr_=
uninterruptible.0
     -1.17 =C2=B1-378%    +714.3%      -9.50 =C2=B1-42%  sched_debug.cpu.nr=
_uninterruptible.19
     -0.67 =C2=B1-320%   +1025.0%      -7.50 =C2=B1-56%  sched_debug.cpu.nr=
_uninterruptible.20
     -0.17 =C2=B1-538%   +6950.0%     -11.75 =C2=B1-76%  sched_debug.cpu.nr=
_uninterruptible.21
      2.67 =C2=B1 63%    +171.9%       7.25 =C2=B1 39%  sched_debug.cpu.nr_=
uninterruptible.25
      2.17 =C2=B1 97%    +246.2%       7.50 =C2=B1 29%  sched_debug.cpu.nr_=
uninterruptible.27
      3.00 =C2=B1101%    +183.3%       8.50 =C2=B1 30%  sched_debug.cpu.nr_=
uninterruptible.29
      2.33 =C2=B1106%    +178.6%       6.50 =C2=B1 17%  sched_debug.cpu.nr_=
uninterruptible.30
      1.67 =C2=B1206%    +320.0%       7.00 =C2=B1 31%  sched_debug.cpu.nr_=
uninterruptible.33
      2.50 =C2=B1125%    +250.0%       8.75 =C2=B1 30%  sched_debug.cpu.nr_=
uninterruptible.34
      2.83 =C2=B1 74%    +226.5%       9.25 =C2=B1 27%  sched_debug.cpu.nr_=
uninterruptible.36
      2.83 =C2=B1 51%    +173.5%       7.75 =C2=B1 10%  sched_debug.cpu.nr_=
uninterruptible.37
      1.83 =C2=B1115%    +377.3%       8.75 =C2=B1 16%  sched_debug.cpu.nr_=
uninterruptible.38
      3.00 =C2=B1 47%    +150.0%       7.50 =C2=B1 35%  sched_debug.cpu.nr_=
uninterruptible.39
      2.17 =C2=B1 62%    +350.0%       9.75 =C2=B1 15%  sched_debug.cpu.nr_=
uninterruptible.40
      2.67 =C2=B1 59%    +200.0%       8.00 =C2=B1 17%  sched_debug.cpu.nr_=
uninterruptible.42
     -1.20 =C2=B1-275%    +483.3%      -7.00 =C2=B1-26%  sched_debug.cpu.nr=
_uninterruptible.8
      8.14 =C2=B1 16%     +80.2%      14.67 =C2=B1  5%  sched_debug.cpu.nr_=
uninterruptible.max
    -16.11 =C2=B1-20%     +56.5%     -25.21 =C2=B1-15%  sched_debug.cpu.nr_=
uninterruptible.min
      5.17 =C2=B1 18%     +89.8%       9.81 =C2=B1  5%  sched_debug.cpu.nr_=
uninterruptible.stddev
     67076 =C2=B1  8%     +36.6%      91617 =C2=B1 12%  sched_debug.cpu.sch=
ed_count.21
     28419 =C2=B1  8%     -22.9%      21908 =C2=B1  4%  sched_debug.cpu.sch=
ed_count.26
     29800 =C2=B1  9%     -24.7%      22440 =C2=B1  6%  sched_debug.cpu.sch=
ed_count.27
     30909 =C2=B1  5%     -18.6%      25155 =C2=B1 11%  sched_debug.cpu.sch=
ed_count.30
     30323 =C2=B1  8%     -24.4%      22929 =C2=B1 15%  sched_debug.cpu.sch=
ed_count.31
     30278 =C2=B1  6%     -24.3%      22935 =C2=B1  4%  sched_debug.cpu.sch=
ed_count.32
     29879 =C2=B1  9%     -19.5%      24052 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.33
     29314 =C2=B1 16%     -20.1%      23419 =C2=B1  7%  sched_debug.cpu.sch=
ed_count.35
     28174 =C2=B1  6%     -20.9%      22281 =C2=B1  6%  sched_debug.cpu.sch=
ed_count.38
     29913 =C2=B1  3%     -26.0%      22134 =C2=B1 22%  sched_debug.cpu.sch=
ed_count.39
     29551 =C2=B1  6%     -30.0%      20693 =C2=B1 13%  sched_debug.cpu.sch=
ed_count.41
     30241 =C2=B1  7%     -22.8%      23358 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.42
     28709 =C2=B1  7%     -22.5%      22255 =C2=B1  4%  sched_debug.cpu.sch=
ed_count.44
     30840 =C2=B1 13%     -25.7%      22913 =C2=B1  9%  sched_debug.cpu.sch=
ed_count.46
     31684 =C2=B1 18%     -30.8%      21934 =C2=B1 11%  sched_debug.cpu.sch=
ed_count.47
     23099 =C2=B1  3%     -23.9%      17574 =C2=B1  2%  sched_debug.cpu.sch=
ed_count.min
     31945 =C2=B1 13%     +18.5%      37850 =C2=B1  6%  sched_debug.cpu.sch=
ed_goidle.19
     30731 =C2=B1  8%     +29.2%      39695 =C2=B1 11%  sched_debug.cpu.sch=
ed_goidle.21
     29857 =C2=B1 13%     +38.4%      41325 =C2=B1 16%  sched_debug.cpu.sch=
ed_goidle.22
     12490 =C2=B1 11%     -23.1%       9605 =C2=B1  3%  sched_debug.cpu.sch=
ed_goidle.26
     13340 =C2=B1 11%     -26.5%       9799 =C2=B1  5%  sched_debug.cpu.sch=
ed_goidle.27
     13706 =C2=B1  8%     -24.1%      10396 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.30
     13151 =C2=B1  9%     -22.9%      10139 =C2=B1 16%  sched_debug.cpu.sch=
ed_goidle.31
     13358 =C2=B1  8%     -25.4%       9966 =C2=B1  4%  sched_debug.cpu.sch=
ed_goidle.32
     13123 =C2=B1 10%     -25.2%       9820 =C2=B1  4%  sched_debug.cpu.sch=
ed_goidle.33
     13108 =C2=B1 13%     -22.4%      10174 =C2=B1  7%  sched_debug.cpu.sch=
ed_goidle.35
     12183 =C2=B1  6%     -22.4%       9458 =C2=B1  6%  sched_debug.cpu.sch=
ed_goidle.38
     12693 =C2=B1  6%     -28.7%       9047 =C2=B1 13%  sched_debug.cpu.sch=
ed_goidle.41
     12945 =C2=B1  8%     -23.3%       9934 =C2=B1 13%  sched_debug.cpu.sch=
ed_goidle.42
     12450 =C2=B1  7%     -23.7%       9505 =C2=B1  3%  sched_debug.cpu.sch=
ed_goidle.44
     13236 =C2=B1 12%     -26.5%       9728 =C2=B1  9%  sched_debug.cpu.sch=
ed_goidle.46
     14021 =C2=B1 23%     -33.7%       9299 =C2=B1 11%  sched_debug.cpu.sch=
ed_goidle.47
     10147 =C2=B1  5%     -24.8%       7633 =C2=B1  1%  sched_debug.cpu.sch=
ed_goidle.min
     10080 =C2=B1  5%     +25.3%      12626 =C2=B1  1%  sched_debug.cpu.sch=
ed_goidle.stddev
     24925 =C2=B1 16%     +35.6%      33805 =C2=B1 12%  sched_debug.cpu.ttw=
u_count.19
      9941 =C2=B1 27%     -33.3%       6634 =C2=B1 15%  sched_debug.cpu.ttw=
u_count.25
      9312 =C2=B1 12%     -30.2%       6496 =C2=B1  6%  sched_debug.cpu.ttw=
u_count.27
     10973 =C2=B1 21%     -34.3%       7215 =C2=B1  8%  sched_debug.cpu.ttw=
u_count.29
      8854 =C2=B1  9%     -24.9%       6652 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.31
      9747 =C2=B1 16%     -29.1%       6909 =C2=B1  5%  sched_debug.cpu.ttw=
u_count.32
     11309 =C2=B1 18%     -33.0%       7579 =C2=B1 19%  sched_debug.cpu.ttw=
u_count.40
      9685 =C2=B1 14%     -30.4%       6741 =C2=B1  7%  sched_debug.cpu.ttw=
u_count.43
     17375 =C2=B1 62%     -58.6%       7191 =C2=B1 16%  sched_debug.cpu.ttw=
u_count.47
      7059 =C2=B1  5%     -23.9%       5373 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.min
      7971 =C2=B1 16%     +34.5%      10722 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.0
      5557 =C2=B1 10%     +23.1%       6839 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.1
      6025 =C2=B1 23%     +32.2%       7968 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.12
      5675 =C2=B1 17%     +24.5%       7066 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.13
      6633 =C2=B1 17%     +27.9%       8486 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.19
      6719 =C2=B1 16%     +42.7%       9586 =C2=B1 15%  sched_debug.cpu.ttw=
u_local.21
      5919 =C2=B1 14%     +21.1%       7165 =C2=B1 13%  sched_debug.cpu.ttw=
u_local.3
      4183 =C2=B1 19%     -38.3%       2582 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.39
      5434 =C2=B1 11%     +30.9%       7115 =C2=B1 10%  sched_debug.cpu.ttw=
u_local.4
      4196 =C2=B1 25%     -37.6%       2616 =C2=B1 12%  sched_debug.cpu.ttw=
u_local.41
      5914 =C2=B1 13%     +16.0%       6863 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.6
      6296 =C2=B1 18%     +24.6%       7842 =C2=B1  9%  sched_debug.cpu.ttw=
u_local.9
      1882 =C2=B1  7%     +27.0%       2390 =C2=B1  1%  sched_debug.cpu.ttw=
u_local.stddev

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/disk/filesize/fs/iterations/kconfig/nr_directories/nr_files_per_di=
rectory/nr_threads/rootfs/sync_method/tbox_group/test_size/testcase:
  gcc-4.9/1HDD/8K/f2fs/1x/x86_64-rhel/16d/256fpd/32t/debian-x86_64-2015-02-=
07.cgz/fsyncBeforeClose/nhm4/400M/fsmark

commit: =

  v4.5-rc1
  6ffc77f48b85ed9ab9a7b2754a7b49891ebaff83

        v4.5-rc1 6ffc77f48b85ed9ab9a7b2754a =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   4680516 =C2=B1  8%     +14.5%    5359884 =C2=B1  4%  fsmark.app_overhead
    525.77 =C2=B1  0%      +4.6%     550.12 =C2=B1  0%  fsmark.files_per_sec
     19446 =C2=B1  1%      -9.8%      17546 =C2=B1  0%  fsmark.time.involun=
tary_context_switches
     14.00 =C2=B1  0%     -17.9%      11.50 =C2=B1  4%  fsmark.time.percent=
_of_cpu_this_job_got
    463972 =C2=B1  0%      -6.8%     432399 =C2=B1  0%  fsmark.time.volunta=
ry_context_switches
    251.60 =C2=B1200%   +2104.3%       5546 =C2=B1100%  latency_stats.sum.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].__f2fs_add_link.[f2fs].f2fs_mkdir.[f2fs].vfs_mkdir.SyS_mkdir.ent=
ry_SYSCALL_64_fastpath
     18701 =C2=B1  0%     -11.2%      16611 =C2=B1  1%  proc-vmstat.pgactiv=
ate
     25317 =C2=B1  0%     +11.2%      28145 =C2=B1  0%  softirqs.BLOCK
    267.69 =C2=B1  2%     -12.5%     234.29 =C2=B1  1%  uptime.idle
      6510 =C2=B1  0%      +4.0%       6770 =C2=B1  0%  vmstat.io.bo
     19446 =C2=B1  1%      -9.8%      17546 =C2=B1  0%  time.involuntary_co=
ntext_switches
     14.00 =C2=B1  0%     -17.9%      11.50 =C2=B1  4%  time.percent_of_cpu=
_this_job_got
     13.89 =C2=B1  0%     -22.9%      10.71 =C2=B1  0%  time.system_time
      0.59 =C2=B1  6%     -18.3%       0.48 =C2=B1  3%  time.user_time
     24.32 =C2=B1  0%     +17.5%      28.57 =C2=B1  0%  turbostat.%Busy
    792.00 =C2=B1  1%     +19.5%     946.75 =C2=B1  0%  turbostat.Avg_MHz
     22.05 =C2=B1  0%    +142.3%      53.42 =C2=B1  0%  turbostat.CPU%c1
     44.77 =C2=B1  0%     -70.4%      13.25 =C2=B1  2%  turbostat.CPU%c3
      8.87 =C2=B1  5%     -46.4%       4.76 =C2=B1  1%  turbostat.CPU%c6
  18381428 =C2=B1  3%    +761.8%  1.584e+08 =C2=B1  0%  cpuidle.C1-NHM.time
     32978 =C2=B1  1%    +191.0%      95971 =C2=B1  0%  cpuidle.C1-NHM.usage
  24159280 =C2=B1  1%    +268.7%   89074691 =C2=B1  1%  cpuidle.C1E-NHM.time
     39453 =C2=B1  0%     +31.4%      51846 =C2=B1  1%  cpuidle.C1E-NHM.usa=
ge
  3.87e+08 =C2=B1  0%     -48.4%  1.998e+08 =C2=B1  0%  cpuidle.C3-NHM.time
    209952 =C2=B1  0%     -41.9%     122009 =C2=B1  0%  cpuidle.C3-NHM.usage
 1.726e+08 =C2=B1  2%     -45.9%   93298544 =C2=B1  2%  cpuidle.C6-NHM.time
     84430 =C2=B1  1%     -50.4%      41860 =C2=B1  1%  cpuidle.C6-NHM.usage
 1.748e+08 =C2=B1  0%     +15.4%  2.018e+08 =C2=B1  0%  cpuidle.POLL.time
    120026 =C2=B1  0%     +32.3%     158824 =C2=B1  0%  cpuidle.POLL.usage
      1432 =C2=B1 52%     -34.0%     945.59 =C2=B1  7%  sched_debug.cfs_rq:=
/.exec_clock.1
      1099 =C2=B1  7%     -17.3%     909.21 =C2=B1  7%  sched_debug.cfs_rq:=
/.exec_clock.2
      1102 =C2=B1  4%     -19.5%     887.21 =C2=B1  4%  sched_debug.cfs_rq:=
/.exec_clock.3
      2120 =C2=B1 44%     -70.8%     618.32 =C2=B1  6%  sched_debug.cfs_rq:=
/.exec_clock.4
    741.50 =C2=B1  6%     -19.6%     595.94 =C2=B1  9%  sched_debug.cfs_rq:=
/.exec_clock.5
    848.32 =C2=B1 12%     -17.9%     696.64 =C2=B1 14%  sched_debug.cfs_rq:=
/.exec_clock.7
      1242 =C2=B1  0%     -12.2%       1091 =C2=B1  0%  sched_debug.cfs_rq:=
/.exec_clock.avg
    706.35 =C2=B1  2%     -19.0%     572.30 =C2=B1  5%  sched_debug.cfs_rq:=
/.exec_clock.min
    696.95 =C2=B1 12%     +26.4%     881.26 =C2=B1  3%  sched_debug.cfs_rq:=
/.exec_clock.stddev
     80.73 =C2=B1 17%     +31.5%     106.16 =C2=B1 16%  sched_debug.cfs_rq:=
/.load_avg.avg
      3549 =C2=B1 15%     +37.7%       4888 =C2=B1  7%  sched_debug.cfs_rq:=
/.min_vruntime.0
      3473 =C2=B1 25%     -52.9%       1636 =C2=B1 15%  sched_debug.cfs_rq:=
/.min_vruntime.4
      2195 =C2=B1 19%     -24.9%       1649 =C2=B1 14%  sched_debug.cfs_rq:=
/.min_vruntime.5
      2198 =C2=B1 16%     -22.2%       1711 =C2=B1 15%  sched_debug.cfs_rq:=
/.min_vruntime.7
      2703 =C2=B1  0%     -10.5%       2419 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.avg
      4291 =C2=B1  8%     +13.9%       4888 =C2=B1  7%  sched_debug.cfs_rq:=
/.min_vruntime.max
      1806 =C2=B1  5%     -21.1%       1424 =C2=B1  5%  sched_debug.cfs_rq:=
/.min_vruntime.min
    788.12 =C2=B1 11%     +30.8%       1030 =C2=B1 14%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
   -577.72 =C2=B1-184%    +349.5%      -2596 =C2=B1-25%  sched_debug.cfs_rq=
:/.spread0.1
   -798.00 =C2=B1-80%    +189.1%      -2306 =C2=B1-17%  sched_debug.cfs_rq:=
/.spread0.2
     -1088 =C2=B1-70%    +121.2%      -2408 =C2=B1-15%  sched_debug.cfs_rq:=
/.spread0.3
    -77.23 =C2=B1-1651%   +4110.9%      -3251 =C2=B1-17%  sched_debug.cfs_r=
q:/.spread0.4
     -1355 =C2=B1-11%    +139.0%      -3239 =C2=B1-16%  sched_debug.cfs_rq:=
/.spread0.5
   -846.87 =C2=B1-66%    +191.5%      -2469 =C2=B1-15%  sched_debug.cfs_rq:=
/.spread0.avg
     -1744 =C2=B1-34%     +98.5%      -3463 =C2=B1-13%  sched_debug.cfs_rq:=
/.spread0.min
    788.41 =C2=B1 11%     +30.8%       1031 =C2=B1 14%  sched_debug.cfs_rq:=
/.spread0.stddev
    166.83 =C2=B1 33%     +86.1%     310.50 =C2=B1 55%  sched_debug.cfs_rq:=
/.util_avg.5
    633424 =C2=B1 20%     +36.3%     863396 =C2=B1 13%  sched_debug.cpu.avg=
_idle.7
    359464 =C2=B1 23%     +34.2%     482294 =C2=B1 17%  sched_debug.cpu.avg=
_idle.min
      0.75 =C2=B1110%    +300.0%       3.00 =C2=B1 81%  sched_debug.cpu.cpu=
_load[1].3
      0.50 =C2=B1100%    +450.0%       2.75 =C2=B1 69%  sched_debug.cpu.cpu=
_load[2].3
      0.50 =C2=B1173%    +500.0%       3.00 =C2=B1 52%  sched_debug.cpu.cpu=
_load[3].3
      0.25 =C2=B1173%   +1300.0%       3.50 =C2=B1 58%  sched_debug.cpu.cpu=
_load[4].3
      6351 =C2=B1 12%     -30.0%       4445 =C2=B1  2%  sched_debug.cpu.nr_=
load_updates.4
     37017 =C2=B1  6%     +11.2%      41155 =C2=B1  7%  sched_debug.cpu.nr_=
switches.7
     13595 =C2=B1  8%     +14.2%      15525 =C2=B1  7%  sched_debug.cpu.nr_=
switches.stddev
     -2130 =C2=B1 -4%     -17.3%      -1761 =C2=B1 -4%  sched_debug.cpu.nr_=
uninterruptible.0
   -337.83 =C2=B1-28%     -42.9%    -192.75 =C2=B1-15%  sched_debug.cpu.nr_=
uninterruptible.2
    784.00 =C2=B1  9%     -30.2%     547.25 =C2=B1 19%  sched_debug.cpu.nr_=
uninterruptible.5
    926.00 =C2=B1  7%     -25.6%     688.50 =C2=B1  2%  sched_debug.cpu.nr_=
uninterruptible.max
     -2129 =C2=B1 -4%     -17.3%      -1760 =C2=B1 -4%  sched_debug.cpu.nr_=
uninterruptible.min
    959.80 =C2=B1  5%     -20.8%     759.81 =C2=B1  2%  sched_debug.cpu.nr_=
uninterruptible.stddev
     37044 =C2=B1  6%     +11.2%      41177 =C2=B1  7%  sched_debug.cpu.sch=
ed_count.7
     14921 =C2=B1  8%     +16.0%      17307 =C2=B1  9%  sched_debug.cpu.sch=
ed_goidle.7
     21799 =C2=B1  4%     +10.5%      24078 =C2=B1  1%  sched_debug.cpu.ttw=
u_count.stddev
     22901 =C2=B1  2%     +12.5%      25754 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.0
      4759 =C2=B1 11%     -27.2%       3465 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.4
     22984 =C2=B1  1%     +12.4%      25827 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.max
      6202 =C2=B1  1%     +16.4%       7217 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.stddev

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/lkp-ivb-d0=
2/execl/unixbench

commit: =

  v4.5-rc1
  6ffc77f48b85ed9ab9a7b2754a7b49891ebaff83

        v4.5-rc1 6ffc77f48b85ed9ab9a7b2754a =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      1260 =C2=B1  0%      +8.7%       1369 =C2=B1  0%  unixbench.score
    484658 =C2=B1  0%      +8.7%     526705 =C2=B1  0%  unixbench.time.invo=
luntary_context_switches
  22562139 =C2=B1  0%      +8.7%   24527176 =C2=B1  0%  unixbench.time.mino=
r_page_faults
    515.20 =C2=B1  3%     +84.1%     948.25 =C2=B1  2%  time.voluntary_cont=
ext_switches
     17071 =C2=B1  0%      +7.9%      18427 =C2=B1  0%  vmstat.system.cs
      2842 =C2=B1  2%    +110.9%       5993 =C2=B1  0%  vmstat.system.in
  40099209 =C2=B1  5%    +367.2%  1.873e+08 =C2=B1  4%  cpuidle.C1E-IVB.time
    314651 =C2=B1  5%    +221.5%    1011451 =C2=B1  0%  cpuidle.C1E-IVB.usa=
ge
  48936191 =C2=B1  9%     -66.3%   16512783 =C2=B1 27%  cpuidle.C3-IVB.time
    141452 =C2=B1  9%     -79.3%      29263 =C2=B1 29%  cpuidle.C3-IVB.usage
 2.177e+08 =C2=B1  3%     -55.1%   97821419 =C2=B1  4%  cpuidle.C6-IVB.time
    292192 =C2=B1  3%     -82.4%      51299 =C2=B1 15%  cpuidle.C6-IVB.usage
    142094 =C2=B1  2%     +14.3%     162480 =C2=B1  1%  sched_debug.cpu.nr_=
switches.0
    150091 =C2=B1  2%     +13.5%     170367 =C2=B1  1%  sched_debug.cpu.sch=
ed_count.0
    153262 =C2=B1  3%     +11.2%     170368 =C2=B1  1%  sched_debug.cpu.sch=
ed_count.max
     51184 =C2=B1  4%     +16.6%      59659 =C2=B1  2%  sched_debug.cpu.sch=
ed_goidle.0
     41761 =C2=B1  5%      +8.2%      45170 =C2=B1  3%  sched_debug.cpu.sch=
ed_goidle.min
     40770 =C2=B1  4%     +14.0%      46477 =C2=B1  6%  sched_debug.cpu.ttw=
u_count.min
     43310 =C2=B1  3%     +12.5%      48739 =C2=B1  0%  sched_debug.cpu.ttw=
u_local.0
     35767 =C2=B1  1%     +11.3%      39826 =C2=B1  2%  sched_debug.cpu.ttw=
u_local.3
     22.72 =C2=B1  0%      +5.6%      23.99 =C2=B1  0%  turbostat.%Busy
    747.40 =C2=B1  0%      +5.7%     789.75 =C2=B1  0%  turbostat.Avg_MHz
     41.33 =C2=B1  2%     +60.1%      66.16 =C2=B1  0%  turbostat.CPU%c1
     25.99 =C2=B1  3%     -96.0%       1.03 =C2=B1 26%  turbostat.CPU%c3
      9.96 =C2=B1  1%     -11.4%       8.83 =C2=B1  2%  turbostat.CPU%c6
     10.22 =C2=B1  0%      +7.2%      10.96 =C2=B1  0%  turbostat.CorWatt
      0.22 =C2=B1 49%    +273.9%       0.83 =C2=B1 50%  turbostat.Pkg%pc3
      8.98 =C2=B1  2%     -16.2%       7.53 =C2=B1  5%  turbostat.Pkg%pc6
     27.07 =C2=B1  0%      +2.7%      27.81 =C2=B1  0%  turbostat.PkgWatt


ivb43: Ivytown Ivy Bridge-EP
Memory: 64G

nhm4: Nehalem
Memory: 4G

lkp-ivb-d02: Ivy Bridge
Memory: 8G

                     fsmark.time.percent_of_cpu_this_job_got

  14 *+-*--*--*--*--*--*--*--*--*--*-----*-*-----*--*--*--*--*--*--*--*--*-=
-*
     |                                 ..      ..                          =
 |
  13 ++                               *       *                            =
 |
  12 ++                                          O  O        O  O          =
 |
     |                                                                     =
 |
  11 ++                   O  O  O  O  O  O O  O        O  O        O  O    =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     |                                                                     =
 |
   9 ++                                                                    =
 |
   8 ++                                                                    =
 |
     |                                                                     =
 |
   7 ++       O     O                                                      =
 |
     |                                                                     =
 |
   6 O+-O--O-----O-----O---------------------------------------------------=
-+


                                  cpuidle.C1-NHM.time

  2.5e+08 ++-O--O----O-----O-----------------------------------------------=
-+
          O       O     O                                                  =
 |
          |                                                                =
 |
    2e+08 ++                                                               =
 |
          |                                                                =
 |
          |                  O  O  O  O O  O  O  O O  O  O  O O  O  O  O   =
 |
  1.5e+08 ++                                                               =
 |
          |                                                                =
 |
    1e+08 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
    5e+07 ++                                                               =
 |
          |                                                                =
 |
          *..*..*.*..*..*..*.*..*..*..*.*..*..*..*.*..*..*..*.*..*..*..*.*.=
.*
        0 ++---------------------------------------------------------------=
-+


                                cpuidle.C1-NHM.usage

  120000 O+-O--------------------------------------------------------------=
-+
         |     O O  O  O  O                                                =
 |
  110000 ++                                                                =
 |
  100000 ++                          O  O       O                          =
 |
         |                   O O  O        O O     O  O O  O  O  O  O O    =
 |
   90000 ++                                                                =
 |
   80000 ++                                                                =
 |
         |                                                                 =
 |
   70000 ++                                                                =
 |
   60000 ++                                                                =
 |
         |                                                                 =
 |
   50000 ++                                                                =
 |
   40000 ++                             *..     *..                        =
 |
         |      .*..                  ..      ..          .*..          .*.=
.|
   30000 *+-*--*----*--*--*--*-*--*--*-----*-*-----*--*-*-----*--*--*-*----=
-*


                                cpuidle.C1E-NHM.time

  1e+08 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  9e+07 ++               O  O  O  O O  O  O     O  O O  O  O  O  O  O O    =
 |
  8e+07 O+ O  O  O O  O                      O                             =
 |
        |                                                                  =
 |
  7e+07 ++                                                                 =
 |
        |                                                                  =
 |
  6e+07 ++                                                                 =
 |
        |                                                                  =
 |
  5e+07 ++                                                                 =
 |
  4e+07 ++                                                                 =
 |
        |                                                                  =
 |
  3e+07 ++                            .*..     .*..                        =
 |
        *..*..*..*.*..*..*..*..*..*.*.    *..*.    *.*..*..*..*..*..*.*..*.=
.*
  2e+07 ++-----------------------------------------------------------------=
-+


                                  cpuidle.C3-NHM.time

  4.5e+08 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    4e+08 ++           .*..*.*..*..*..*.*..*..*..*.                        =
 |
          *..*..*.*..*.                            *..*..*..*.*..*..*..*.*.=
.*
          |                                                                =
 |
  3.5e+08 ++                                                               =
 |
          |                                                                =
 |
    3e+08 ++                                                               =
 |
          |                                                                =
 |
  2.5e+08 ++                                                               =
 |
          |                                                                =
 |
          |                           O    O                               =
 |
    2e+08 O+      O  O  O    O  O  O    O     O  O O  O  O  O O  O  O  O   =
 |
          |  O  O          O                                               =
 |
  1.5e+08 ++---------------------------------------------------------------=
-+


                                cpuidle.C3-NHM.usage

  280000 ++----------------------------------------------------------------=
-+
         |                              *       *                          =
 |
  260000 ++                            : :     : :                         =
 |
  240000 ++                            :  :    :  :                        =
 |
         |                            :   :   :   :                        =
 |
  220000 *+.*.. .*..*..*..*..*.*..*..*     *.*     *..*.  .*..*..*..*.  .*.=
.*
  200000 ++    *                                        *.            *.   =
 |
         |                                                                 =
 |
  180000 ++                                                                =
 |
  160000 ++                                                                =
 |
         |                           O                                     =
 |
  140000 O+                                                                =
 |
  120000 ++                  O O  O     O  O O  O  O  O O  O  O  O  O O    =
 |
         |  O  O O  O  O  O                                                =
 |
  100000 ++----------------------------------------------------------------=
-+


                                  cpuidle.C6-NHM.time

    2e+08 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  1.8e+08 ++   .*               *..                     .*..          .*   =
 |
          *..*.  +     .*..*. ..     .*    *..*..  *..*.        .*..*.  +  =
 |
          |       *..*.      *     *.  :  +       +         *.*.         *.=
.*
  1.6e+08 ++                           : +       *                         =
 |
          |                             *                                  =
 |
  1.4e+08 ++                                                               =
 |
          |                                                                =
 |
  1.2e+08 ++                                                               =
 |
          |                                                                =
 |
          |                                   O                            =
 |
    1e+08 ++                 O  O  O       O     O    O  O       O  O      =
 |
          |  O    O  O  O             O O          O        O O        O   =
 |
    8e+07 O+----O----------O-----------------------------------------------=
-+


                                cpuidle.C6-NHM.usage

  90000 ++---------------------*-------------------------------------------=
-+
        *..*..*..    .*..*.. ..    .*..  .*..*..*..*.*..*..     .*..*.*..  =
 |
  80000 ++       *.*.       *     *    *.                  *..*.         *.=
.*
        |                                                                  =
 |
        |                                                                  =
 |
  70000 ++                                                                 =
 |
        |                                                                  =
 |
  60000 ++                                                                 =
 |
        |                                                                  =
 |
  50000 ++                                                                 =
 |
        |                                                                  =
 |
        |          O  O     O  O  O O     O  O  O  O O  O  O  O  O  O O    =
 |
  40000 O+ O  O  O       O             O                                   =
 |
        |                                                                  =
 |
  30000 ++-----------------------------------------------------------------=
-+



                           aim9.shell_rtns_2.ops_per_sec

  460 ++-------------------------------------------------------------------=
-+
      |    O                                                               =
 |
  450 O+ O       O O          O       O  O  O       O O                    =
 |
  440 ++      O       O  O  O    O            O  O       O  O              =
 |
      |                             O                                      =
 |
  430 ++                                                                   =
 |
  420 ++                                                                   =
 |
      |                                                                    =
 |
  410 ++                                                                   =
 |
  400 ++                                      *                            =
 |
      |       *..                            : :            *..          *.=
.|
  390 ++     +   *.                          :  :          +   *.       :  =
 *
  380 *+.   +      *..     .*.*..*..*.*..*..*   :  .*.    +      *..    :  =
 |
      |  *.*          *..*.                      *.   *..*          *..*   =
 |
  370 ++-------------------------------------------------------------------=
-+


                               aim9.time.user_time

  58 ++-------------------------------O------------------------------------=
-+
     |  O O        O O  O  O  O O  O     O O  O  O O  O  O  O              =
 |
  57 O+         O                                                          =
 |
  56 ++      O                                                             =
 |
     |                                                                     =
 |
  55 ++                                                                    =
 |
  54 ++                                                                    =
 |
     |                                                                     =
 |
  53 ++                                                                    =
 |
  52 ++                                       *                            =
 |
     |       *..                             + +            *.           *.=
.|
  51 ++     +   *..                         +   +          +  *..       :  =
 *
  50 *+.*. +       *    *..*..*.*..*..  .*.*     *.*..*.. +      *..*.. :  =
 |
     |    *         + ..              *.                 *             *   =
 |
  49 ++--------------*-----------------------------------------------------=
-+


                              aim9.time.minor_page_faults

  4.5e+07 ++---------------------------------------------------------------=
-+
          O    O                                                           =
 |
  4.4e+07 ++ O    O O  O O  O O  O      O  O  O O  O O  O O  O             =
 |
  4.3e+07 ++                       O  O                                    =
 |
          |                                                                =
 |
  4.2e+07 ++                                                               =
 |
  4.1e+07 ++                                                               =
 |
          |                                                                =
 |
    4e+07 ++                                                               =
 |
  3.9e+07 ++                                    *                          =
 |
          |       *.                           : +           *.          *.=
.|
  3.8e+07 ++    ..  *..      .*..*.*..         :  +        ..  *..      +  =
 *
  3.7e+07 *+.*.*       *.*..*         *.*..*..*    *.*..*.*       *.*..*   =
 |
          |                                                                =
 |
  3.6e+07 ++---------------------------------------------------------------=
-+


                         aim9.time.voluntary_context_switches

   1.1e+06 ++--------------------------------------------------------------=
-+
  1.08e+06 ++   O                                                          =
 |
           O  O      O            O      O  O O       O O                  =
 |
  1.06e+06 ++      O    O O  O O    O            O O       O O             =
 |
  1.04e+06 ++                          O                                   =
 |
           |                                                               =
 |
  1.02e+06 ++                                                              =
 |
     1e+06 ++                                                              =
 |
    980000 ++                                                              =
 |
           |                                                               =
 |
    960000 ++                                    *                         =
 |
    940000 ++      *.                           + :          *..          *=
.|
           |      +  *..         .*.*..        +  :         :   *.       + =
 *
    920000 *+.   +      *.    .*.      *.*..*.*    *..*.    :     *..   +  =
 |
    900000 ++-*-*---------*--*--------------------------*--*---------*-*---=
-+


                       aim9.time.involuntary_context_switches

  420000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  410000 O+ O O    O            O       O                                  =
 |
  400000 ++      O    O O  O  O    O       O O       O O                   =
 |
         |                           O          O O       O  O             =
 |
  390000 ++                                                                =
 |
         |                                                                 =
 |
  380000 ++                                                                =
 |
         |                                                                 =
 |
  370000 ++                                                                =
 |
  360000 ++                                     *                          =
 |
         |       *.                            + :           *.          *.=
.|
  350000 ++     +  *..*.     .*.*..*.*..*..*. +  :          +  *..      :  =
 *
         *..   +        *..*.                *    *..*.    +      *.    :  =
 |
  340000 ++-*-*----------------------------------------*--*---------*--*---=
-+


                                  unixbench.score

  1400 ++------------------------------------------------------------------=
-+
       |                         O O O O O                                 =
 |
  1380 O+O O O   O O O   O O O O          O                                =
 |
  1360 ++      O                            O O O O O O O O                =
 |
       |               O                                                   =
 |
  1340 ++                                                                  =
 |
       |                                                                   =
 |
  1320 ++                                                                  =
 |
       |                                                                   =
 |
  1300 ++                                                                  =
 |
  1280 ++                                                                  =
 |
       |                      .*.*. .*.                                    =
 |
  1260 *+*.*.*.*.*.*.*. .*.*.*     *   *.**.*.*.*.*.*. .*.*.*.*.*.*.*.*.*. =
.*
       |               *                              *                   *=
 |
  1240 ++------------------------------------------------------------------=
-+


                     unixbench.time.involuntary_context_switches

  540000 ++----------------------------------------------------------------=
-+
         |         O            O O O O   OO                               =
 |
  530000 ++O   O      O   O O           O                                  =
 |
         O   O   O  O         O              O O O O O O O O               =
 |
         |              O                                                  =
 |
  520000 ++                                                                =
 |
         |                                                                 =
 |
  510000 ++                                                                =
 |
         |                                                                 =
 |
  500000 ++                                                                =
 |
         |                                                                 =
 |
         |                                                                 =
 |
  490000 ++   .*.          .*. .*.*. .*.    .*.                 .*         =
 |
         *.*.*   *.**. .*.*   *     *   *.**   *.*.*. .*.*.*.*.*  *.*.*. .*=
.*
  480000 ++-----------*------------------------------*------------------*--=
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

--===============7502352515483536531==
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
ZzoKICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiBwZXJmb3JtYW5jZQpkZWZhdWx0
LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogNmZmYzc3ZjQ4
Yjg1ZWQ5YWI5YTdiMjc1NGE3YjQ5ODkxZWJhZmY4Mwptb2RlbDogSXZ5IEJyaWRnZQpucl9jcHU6
IDQKbWVtb3J5OiA4Rwpucl9oZGRfcGFydGl0aW9uczogMQpoZGRfcGFydGl0aW9uczogIi9kZXYv
ZGlzay9ieS1pZC9hdGEtU1QxMDAwRE0wMDMtMUNIMTYyX1oxREJRU0IwLXBhcnQxIgpzd2FwX3Bh
cnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLVNUMTAwMERNMDAzLTFDSDE2Ml9aMURCUVNC
MC1wYXJ0MyIKcm9vdGZzX3BhcnRpdGlvbjogIi9kZXYvZGlzay9ieS1pZC9hdGEtU1QxMDAwRE0w
MDMtMUNIMTYyX1oxREJRU0IwLXBhcnQ0IgpuZXRjb25zb2xlX3BvcnQ6IDY2NzIzCmNhdGVnb3J5
OiBiZW5jaG1hcmsKbnJfdGFzazogMQp1bml4YmVuY2g6CiAgdGVzdDogZXhlY2wKcXVldWU6IGJp
c2VjdAp0ZXN0Ym94OiBsa3AtaXZiLWQwMgp0Ym94X2dyb3VwOiBsa3AtaXZiLWQwMgprY29uZmln
OiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTYtMDItMDEgMDQ6NDE6NDAuODQ0Njk3OTg4
ICswODowMAppZDogYWIyMzliZTM5ZjkyZGYxZjFmMTU1ZjlmZjhhYjUwYmQ0OGEyMDRiYgp1c2Vy
OiBsa3AKY29tcGlsZXI6IGdjYy00LjkKaGVhZF9jb21taXQ6IGE2NmFlZjIwMzhjZTBjZTczODZj
NDBlMmEwMTBiZWIyY2I3ODk1ZDIKYmFzZV9jb21taXQ6IDkyZTk2M2Y1MGZjNzQwNDFiNWU5ZTc0
NGMzMzBkY2E0OGUwNGYwOGQKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjAx
MzExOQpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oKcmVzdWx0X3Jvb3Q6ICIv
cmVzdWx0L3VuaXhiZW5jaC9wZXJmb3JtYW5jZS0xLWV4ZWNsL2xrcC1pdmItZDAyL2RlYmlhbi14
ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS82ZmZjNzdmNDhiODVlZDlh
YjlhN2IyNzU0YTdiNDk4OTFlYmFmZjgzLzEiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvbGtw
LWl2Yi1kMDIvYmlzZWN0X3VuaXhiZW5jaC1wZXJmb3JtYW5jZS0xLWV4ZWNsLWRlYmlhbi14ODZf
NjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtNmZmYzc3ZjQ4Yjg1ZWQ5YWI5YTdiMjc1NGE3
YjQ5ODkxZWJhZmY4My0yMDE2MDIwMS0xMTg1MTAtMTRxbGh4bS0xLnlhbWwiCm1heF91cHRpbWU6
IDgzNi44Ngppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3
LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpv
Yj0vbGtwL3NjaGVkdWxlZC9sa3AtaXZiLWQwMi9iaXNlY3RfdW5peGJlbmNoLXBlcmZvcm1hbmNl
LTEtZXhlY2wtZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei14ODZfNjQtcmhlbC02ZmZjNzdm
NDhiODVlZDlhYjlhN2IyNzU0YTdiNDk4OTFlYmFmZjgzLTIwMTYwMjAxLTExODUxMC0xNHFsaHht
LTEueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD1saW51
eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjAxMzExOQotIGNvbW1pdD02ZmZjNzdmNDhiODVlZDlh
YjlhN2IyNzU0YTdiNDk4OTFlYmFmZjgzCi0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1y
aGVsL2djYy00LjkvNmZmYzc3ZjQ4Yjg1ZWQ5YWI5YTdiMjc1NGE3YjQ5ODkxZWJhZmY4My92bWxp
bnV6LTQuNS4wLXJjMS0wMDAwMS1nNmZmYzc3ZgotIG1heF91cHRpbWU9ODM2Ci0gUkVTVUxUX1JP
T1Q9L3Jlc3VsdC91bml4YmVuY2gvcGVyZm9ybWFuY2UtMS1leGVjbC9sa3AtaXZiLWQwMi9kZWJp
YW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvNmZmYzc3ZjQ4Yjg1
ZWQ5YWI5YTdiMjc1NGE3YjQ5ODkxZWJhZmY4My8xCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgog
IGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBh
cGljPWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGlt
ZW91dD0xMDAKICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmlj
IG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5
UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtw
L2xrcC9sa3AteDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1y
aGVsL2djYy00LjkvNmZmYzc3ZjQ4Yjg1ZWQ5YWI5YTdiMjc1NGE3YjQ5ODkxZWJhZmY4My9tb2R1
bGVzLmNneiIKYm1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDIt
MDcuY2d6L2xrcC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6
L3J1bi1pcGNvbmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcu
Y2d6L3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5j
aG1hcmtzL3VuaXhiZW5jaC5jZ3oiCmxpbnV4X2hlYWRlcnNfaW5pdHJkOiAiL3BrZy9saW51eC94
ODZfNjQtcmhlbC9nY2MtNC45LzZmZmM3N2Y0OGI4NWVkOWFiOWE3YjI3NTRhN2I0OTg5MWViYWZm
ODMvbGludXgtaGVhZGVycy5jZ3oiCnJlcGVhdF90bzogMgprZXJuZWw6ICIvcGtnL2xpbnV4L3g4
Nl82NC1yaGVsL2djYy00LjkvNmZmYzc3ZjQ4Yjg1ZWQ5YWI5YTdiMjc1NGE3YjQ5ODkxZWJhZmY4
My92bWxpbnV6LTQuNS4wLXJjMS0wMDAwMS1nNmZmYzc3ZiIKZGVxdWV1ZV90aW1lOiAyMDE2LTAy
LTAxIDA0OjQ5OjA1LjI3MzUyMzg1OCArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZn
OiAwLjc1IDAuMjcgMC4xMCAxLzEyMCAyMTUzCnN0YXJ0X3RpbWU6ICcxNDU0MjczMzY1JwplbmRf
dGltZTogJzE0NTQyNzM0NjQnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTYwMTI3LTIyMzg1
MyIK

--===============7502352515483536531==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNi0wMi0wMSAwNDo0NzoyMSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0wMSAwNDo0NzoyMSBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMi0wMSAwNDo0NzoyMSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
Mi0wMSAwNDo0NzoyMSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0wMSAwNDo0NzoyMiAuL1J1biBl
eGVjbCAtYyAxCg==

--===============7502352515483536531==--

