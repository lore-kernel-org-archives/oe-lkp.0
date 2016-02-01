Content-Type: multipart/mixed; boundary="===============5755570249360601741=="
MIME-Version: 1.0
From: Andi Kleen <ak@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [lib] 6ffc77f48b: 15.8% aim9.shell_rtns_2.ops_per_sec, +8.7% unixbench.score
Date: Sun, 31 Jan 2016 21:41:37 -0800
Message-ID: <20160201054137.GB28154@tassilo.jf.intel.com>
In-Reply-To: <87a8nlkzj7.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5755570249360601741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 01, 2016 at 09:08:44AM +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://github.com/0day-ci/linux Andi-Kleen/Optimize-int_sqrt-for-small-v=
alues-for-faster-idle/20160129-054629
> commit 6ffc77f48b85ed9ab9a7b2754a7b49891ebaff83 ("Optimize int_sqrt for s=
mall values for faster idle")
> =

> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/testtim=
e:
>   gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/ivb43/shel=
l_rtns_2/aim9/300s
> =

> commit: =

>   v4.5-rc1
>   6ffc77f48b85ed9ab9a7b2754a7b49891ebaff83
> =

>         v4.5-rc1 6ffc77f48b85ed9ab9a7b2754a =

> ---------------- -------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     383.55 =C2=B1  1%     +15.8%     444.19 =C2=B1  0%  aim9.shell_rtns_2=
.ops_per_sec

That means it is faster, right? =


That's more than i expected.


-Andi

>     346042 =C2=B1  1%     +15.7%     400253 =C2=B1  0%  aim9.time.involun=
tary_context_switches
>   37653157 =C2=B1  1%     +16.0%   43669205 =C2=B1  0%  aim9.time.minor_p=
age_faults
>      50.58 =C2=B1  1%     +13.5%      57.41 =C2=B1  0%  aim9.time.user_ti=
me
>     920242 =C2=B1  1%     +15.6%    1063902 =C2=B1  0%  aim9.time.volunta=
ry_context_switches
>     165192 =C2=B1  0%      -9.3%     149802 =C2=B1  0%  meminfo.Committed=
_AS
>     858.50 =C2=B1112%    +159.7%       2229 =C2=B1  2%  numa-vmstat.node1=
.nr_inactive_anon
>       1903 =C2=B1 34%     +49.7%       2850 =C2=B1  1%  numa-vmstat.node1=
.nr_mapped
>      15155 =C2=B1  0%      +3.0%      15608 =C2=B1  0%  vmstat.system.cs
>       1900 =C2=B1  3%      +8.5%       2061 =C2=B1  1%  vmstat.system.in
>       1481 =C2=B1142%    +243.8%       5094 =C2=B1 20%  numa-meminfo.node=
1.AnonHugePages
>       3435 =C2=B1112%    +159.6%       8918 =C2=B1  2%  numa-meminfo.node=
1.Inactive(anon)
>       7619 =C2=B1 34%     +49.7%      11403 =C2=B1  1%  numa-meminfo.node=
1.Mapped
>     346042 =C2=B1  1%     +15.7%     400253 =C2=B1  0%  time.involuntary_=
context_switches
>   37653157 =C2=B1  1%     +16.0%   43669205 =C2=B1  0%  time.minor_page_f=
aults
>      50.58 =C2=B1  1%     +13.5%      57.41 =C2=B1  0%  time.user_time
>     920242 =C2=B1  1%     +15.6%    1063902 =C2=B1  0%  time.voluntary_co=
ntext_switches
>   32159302 =C2=B1  2%     +16.1%   37352805 =C2=B1  0%  proc-vmstat.numa_=
hit
>   32153109 =C2=B1  2%     +16.2%   37346613 =C2=B1  0%  proc-vmstat.numa_=
local
>       8294 =C2=B1  4%     +10.3%       9146 =C2=B1  3%  proc-vmstat.pgact=
ivate
>   31753265 =C2=B1  2%     +16.7%   37041704 =C2=B1  0%  proc-vmstat.pgall=
oc_normal
>   38274072 =C2=B1  1%     +15.7%   44274006 =C2=B1  0%  proc-vmstat.pgfau=
lt
>   33586569 =C2=B1  2%     +16.4%   39090694 =C2=B1  0%  proc-vmstat.pgfree
>       2.15 =C2=B1  2%     +31.0%       2.81 =C2=B1  1%  turbostat.%Busy
>      69.83 =C2=B1  1%     +21.0%      84.50 =C2=B1  1%  turbostat.Avg_MHz
>      14.71 =C2=B1 30%    +364.4%      68.29 =C2=B1  2%  turbostat.CPU%c1
>       0.13 =C2=B1115%   +4530.3%       5.86 =C2=B1  5%  turbostat.CPU%c3
>      83.02 =C2=B1  5%     -72.3%      23.04 =C2=B1  6%  turbostat.CPU%c6
>      67.08 =C2=B1  1%     +15.6%      77.53 =C2=B1  0%  turbostat.CorWatt
>      13.68 =C2=B1 13%     -96.9%       0.42 =C2=B1102%  turbostat.Pkg%pc2
>      97.47 =C2=B1  0%     +10.7%     107.90 =C2=B1  0%  turbostat.PkgWatt
>  4.115e+08 =C2=B1 95%   +1040.5%  4.693e+09 =C2=B1  3%  cpuidle.C1-IVT.ti=
me
>      35607 =C2=B1 31%    +459.1%     199082 =C2=B1  1%  cpuidle.C1-IVT.us=
age
>     692205 =C2=B1 47%  +1.4e+05%  9.935e+08 =C2=B1  2%  cpuidle.C1E-IVT.t=
ime
>       1987 =C2=B1 17%   +9685.5%     194454 =C2=B1  1%  cpuidle.C1E-IVT.u=
sage
>   17330705 =C2=B1111%   +5212.9%  9.208e+08 =C2=B1  4%  cpuidle.C3-IVT.ti=
me
>       6416 =C2=B1 72%   +4164.8%     273664 =C2=B1  2%  cpuidle.C3-IVT.us=
age
>   1.37e+10 =C2=B1  3%     -45.7%  7.434e+09 =C2=B1  2%  cpuidle.C6-IVT.ti=
me
>    2046699 =C2=B1  1%     -20.6%    1625729 =C2=B1  2%  cpuidle.C6-IVT.us=
age
>    9298422 =C2=B1 67%    +725.2%   76732660 =C2=B1  5%  cpuidle.POLL.time
>      21792 =C2=B1 13%     -19.9%      17456 =C2=B1  6%  cpuidle.POLL.usage
>       8535 =C2=B1  2%      +8.7%       9274 =C2=B1  2%  slabinfo.anon_vma=
.active_objs
>       8535 =C2=B1  2%      +8.7%       9274 =C2=B1  2%  slabinfo.anon_vma=
.num_objs
>      25398 =C2=B1  3%     +22.3%      31057 =C2=B1  1%  slabinfo.anon_vma=
_chain.active_objs
>      25427 =C2=B1  3%     +22.5%      31141 =C2=B1  1%  slabinfo.anon_vma=
_chain.num_objs
>      14169 =C2=B1  5%     -13.4%      12270 =C2=B1  0%  slabinfo.kmalloc-=
256.active_objs
>      14612 =C2=B1  5%     -12.5%      12786 =C2=B1  0%  slabinfo.kmalloc-=
256.num_objs
>      39366 =C2=B1  7%     +40.7%      55384 =C2=B1  3%  slabinfo.kmalloc-=
32.active_objs
>     307.00 =C2=B1  7%     +41.3%     433.75 =C2=B1  3%  slabinfo.kmalloc-=
32.active_slabs
>      39366 =C2=B1  7%     +41.2%      55578 =C2=B1  3%  slabinfo.kmalloc-=
32.num_objs
>     307.00 =C2=B1  7%     +41.3%     433.75 =C2=B1  3%  slabinfo.kmalloc-=
32.num_slabs
>       1087 =C2=B1  5%      -9.7%     982.50 =C2=B1  1%  slabinfo.mm_struc=
t.active_objs
>       1087 =C2=B1  5%      -9.7%     982.50 =C2=B1  1%  slabinfo.mm_struc=
t.num_objs
>       2313 =C2=B1  2%     +12.8%       2609 =C2=B1  3%  slabinfo.signal_c=
ache.active_objs
>       2313 =C2=B1  2%     +12.8%       2609 =C2=B1  3%  slabinfo.signal_c=
ache.num_objs
>      21538 =C2=B1  1%     +17.1%      25215 =C2=B1  1%  slabinfo.vm_area_=
struct.active_objs
>      21595 =C2=B1  1%     +17.1%      25279 =C2=B1  1%  slabinfo.vm_area_=
struct.num_objs
>       2.49 =C2=B1 16%     +38.3%       3.44 =C2=B1 16%  perf-profile.cycl=
es-pp.__libc_fork
>      39.88 =C2=B1  9%     -26.1%      29.47 =C2=B1 23%  perf-profile.cycl=
es-pp.call_cpuidle.cpu_startup_entry.start_secondary
>      43.97 =C2=B1  9%     -24.6%      33.16 =C2=B1 21%  perf-profile.cycl=
es-pp.cpu_startup_entry.start_secondary
>      39.88 =C2=B1  9%     -26.1%      29.46 =C2=B1 23%  perf-profile.cycl=
es-pp.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_secondary
>      39.49 =C2=B1  9%     -26.3%      29.10 =C2=B1 23%  perf-profile.cycl=
es-pp.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry.star=
t_secondary
>       2.55 =C2=B1 41%     +81.3%       4.62 =C2=B1 29%  perf-profile.cycl=
es-pp.do_execveat_common.isra.35.sys_execve.return_from_execve
>       9.63 =C2=B1 15%     +30.1%      12.53 =C2=B1 15%  perf-profile.cycl=
es-pp.do_page_fault.page_fault
>       3.14 =C2=B1 11%     +58.7%       4.99 =C2=B1 20%  perf-profile.cycl=
es-pp.execve
>       0.75 =C2=B1 10%     +31.3%       0.98 =C2=B1 11%  perf-profile.cycl=
es-pp.filename_lookup.user_path_at_empty.sys_access.entry_SYSCALL_64_fastpa=
th
>       0.84 =C2=B1 13%     +38.1%       1.16 =C2=B1 16%  perf-profile.cycl=
es-pp.free_pages_and_swap_cache.tlb_flush_mmu_free.tlb_finish_mmu.exit_mmap=
.mmput
>       8.60 =C2=B1 23%     +37.6%      11.84 =C2=B1 11%  perf-profile.cycl=
es-pp.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
>      40.37 =C2=B1 10%     -26.5%      29.67 =C2=B1 23%  perf-profile.cycl=
es-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup=
_entry
>       0.75 =C2=B1 16%     +99.7%       1.51 =C2=B1 27%  perf-profile.cycl=
es-pp.load_elf_binary.search_binary_handler.load_script.search_binary_handl=
er.do_execveat_common
>       0.84 =C2=B1 15%     +94.7%       1.63 =C2=B1 27%  perf-profile.cycl=
es-pp.load_script.search_binary_handler.do_execveat_common.sys_execve.retur=
n_from_execve
>       0.71 =C2=B1 10%     +30.9%       0.92 =C2=B1 12%  perf-profile.cycl=
es-pp.path_lookupat.filename_lookup.user_path_at_empty.sys_access.entry_SYS=
CALL_64_fastpath
>       0.75 =C2=B1 13%     +39.9%       1.04 =C2=B1 16%  perf-profile.cycl=
es-pp.release_pages.free_pages_and_swap_cache.tlb_flush_mmu_free.tlb_finish=
_mmu.exit_mmap
>       2.15 =C2=B1 11%     +51.3%       3.25 =C2=B1 20%  perf-profile.cycl=
es-pp.return_from_execve.execve
>       0.76 =C2=B1 16%     +98.2%       1.51 =C2=B1 27%  perf-profile.cycl=
es-pp.search_binary_handler.load_script.search_binary_handler.do_execveat_c=
ommon.sys_execve
>      44.09 =C2=B1  9%     -24.5%      33.28 =C2=B1 21%  perf-profile.cycl=
es-pp.start_secondary
>       1.12 =C2=B1  6%     +23.8%       1.39 =C2=B1  8%  perf-profile.cycl=
es-pp.sys_access.entry_SYSCALL_64_fastpath
>       2.13 =C2=B1 11%     +53.6%       3.28 =C2=B1 19%  perf-profile.cycl=
es-pp.sys_execve.return_from_execve.execve
>       1.55 =C2=B1 90%    +179.7%       4.33 =C2=B1 13%  perf-profile.cycl=
es-pp.sys_mmap.entry_SYSCALL_64_fastpath
>       0.80 =C2=B1 11%     +31.0%       1.05 =C2=B1 11%  perf-profile.cycl=
es-pp.user_path_at_empty.sys_access.entry_SYSCALL_64_fastpath
>       4128 =C2=B1  9%     +17.8%       4862 =C2=B1  4%  sched_debug.cfs_r=
q:/.exec_clock.11
>       4062 =C2=B1  8%     +18.4%       4809 =C2=B1  4%  sched_debug.cfs_r=
q:/.exec_clock.12
>       4064 =C2=B1 13%     +34.4%       5461 =C2=B1 27%  sched_debug.cfs_r=
q:/.exec_clock.15
>       3879 =C2=B1 14%     +41.0%       5469 =C2=B1 22%  sched_debug.cfs_r=
q:/.exec_clock.18
>       3831 =C2=B1 12%     +44.1%       5522 =C2=B1 26%  sched_debug.cfs_r=
q:/.exec_clock.19
>       3881 =C2=B1 14%     +18.1%       4582 =C2=B1  3%  sched_debug.cfs_r=
q:/.exec_clock.20
>       3658 =C2=B1 14%     -30.8%       2529 =C2=B1 18%  sched_debug.cfs_r=
q:/.exec_clock.25
>       3756 =C2=B1 17%     -31.4%       2575 =C2=B1  6%  sched_debug.cfs_r=
q:/.exec_clock.26
>       3722 =C2=B1 15%     -32.2%       2524 =C2=B1 10%  sched_debug.cfs_r=
q:/.exec_clock.27
>       4727 =C2=B1 20%     -31.5%       3240 =C2=B1 23%  sched_debug.cfs_r=
q:/.exec_clock.28
>       4448 =C2=B1 13%     +20.7%       5369 =C2=B1  9%  sched_debug.cfs_r=
q:/.exec_clock.3
>       3768 =C2=B1 18%     -32.1%       2559 =C2=B1  5%  sched_debug.cfs_r=
q:/.exec_clock.30
>       3743 =C2=B1 16%     -38.2%       2312 =C2=B1  3%  sched_debug.cfs_r=
q:/.exec_clock.31
>       3675 =C2=B1 15%     -31.9%       2501 =C2=B1 14%  sched_debug.cfs_r=
q:/.exec_clock.32
>       3657 =C2=B1 14%     -33.4%       2434 =C2=B1  7%  sched_debug.cfs_r=
q:/.exec_clock.33
>       3653 =C2=B1 15%     -27.1%       2663 =C2=B1 12%  sched_debug.cfs_r=
q:/.exec_clock.34
>       3102 =C2=B1 19%     -27.2%       2257 =C2=B1  2%  sched_debug.cfs_r=
q:/.exec_clock.37
>       3262 =C2=B1 18%     -30.5%       2269 =C2=B1  2%  sched_debug.cfs_r=
q:/.exec_clock.39
>       3315 =C2=B1 16%     -25.5%       2469 =C2=B1  8%  sched_debug.cfs_r=
q:/.exec_clock.40
>       3250 =C2=B1 18%     -29.6%       2287 =C2=B1  6%  sched_debug.cfs_r=
q:/.exec_clock.43
>       3210 =C2=B1 13%     -28.2%       2304 =C2=B1  5%  sched_debug.cfs_r=
q:/.exec_clock.44
>       3140 =C2=B1 16%     -25.7%       2332 =C2=B1 11%  sched_debug.cfs_r=
q:/.exec_clock.46
>       4772 =C2=B1  9%     -24.0%       3625 =C2=B1  7%  sched_debug.cfs_r=
q:/.exec_clock.47
>       4293 =C2=B1  9%     +23.1%       5283 =C2=B1  3%  sched_debug.cfs_r=
q:/.exec_clock.5
>       2601 =C2=B1 10%     -22.9%       2007 =C2=B1  6%  sched_debug.cfs_r=
q:/.exec_clock.min
>       1245 =C2=B1 11%     +37.0%       1706 =C2=B1  3%  sched_debug.cfs_r=
q:/.exec_clock.stddev
>       4.50 =C2=B1 58%    +883.3%      44.25 =C2=B1115%  sched_debug.cfs_r=
q:/.load_avg.15
>       2.00 =C2=B1141%   +2012.5%      42.25 =C2=B1 91%  sched_debug.cfs_r=
q:/.load_avg.26
>      92810 =C2=B1  7%     +24.5%     115532 =C2=B1  5%  sched_debug.cfs_r=
q:/.min_vruntime.0
>      85375 =C2=B1 10%     +16.7%      99616 =C2=B1  8%  sched_debug.cfs_r=
q:/.min_vruntime.1
>      84119 =C2=B1  9%     +17.3%      98679 =C2=B1  6%  sched_debug.cfs_r=
q:/.min_vruntime.11
>      76159 =C2=B1 14%     +26.3%      96158 =C2=B1  4%  sched_debug.cfs_r=
q:/.min_vruntime.12
>      73708 =C2=B1 11%     +22.3%      90163 =C2=B1  4%  sched_debug.cfs_r=
q:/.min_vruntime.13
>      73462 =C2=B1 12%     +22.8%      90186 =C2=B1  4%  sched_debug.cfs_r=
q:/.min_vruntime.14
>      78532 =C2=B1 11%     +18.3%      92890 =C2=B1  2%  sched_debug.cfs_r=
q:/.min_vruntime.15
>      75619 =C2=B1 15%     +23.4%      93308 =C2=B1  5%  sched_debug.cfs_r=
q:/.min_vruntime.18
>      73782 =C2=B1 12%     +26.1%      93064 =C2=B1  2%  sched_debug.cfs_r=
q:/.min_vruntime.19
>      85825 =C2=B1 12%     +16.9%     100371 =C2=B1  6%  sched_debug.cfs_r=
q:/.min_vruntime.2
>      73784 =C2=B1 14%     +26.7%      93455 =C2=B1  3%  sched_debug.cfs_r=
q:/.min_vruntime.20
>      77996 =C2=B1 11%     +25.4%      97835 =C2=B1  8%  sched_debug.cfs_r=
q:/.min_vruntime.21
>      75401 =C2=B1 12%     +24.0%      93489 =C2=B1  3%  sched_debug.cfs_r=
q:/.min_vruntime.22
>      71851 =C2=B1 10%     +25.9%      90432 =C2=B1  8%  sched_debug.cfs_r=
q:/.min_vruntime.23
>      85321 =C2=B1 16%     -25.5%      63569 =C2=B1 11%  sched_debug.cfs_r=
q:/.min_vruntime.24
>      84385 =C2=B1 16%     -37.7%      52578 =C2=B1 19%  sched_debug.cfs_r=
q:/.min_vruntime.25
>      86487 =C2=B1 19%     -38.7%      52989 =C2=B1 10%  sched_debug.cfs_r=
q:/.min_vruntime.26
>      85768 =C2=B1 18%     -40.0%      51463 =C2=B1 14%  sched_debug.cfs_r=
q:/.min_vruntime.27
>      86568 =C2=B1 17%     -35.1%      56182 =C2=B1  9%  sched_debug.cfs_r=
q:/.min_vruntime.29
>      87224 =C2=B1 19%     -38.6%      53580 =C2=B1 10%  sched_debug.cfs_r=
q:/.min_vruntime.30
>      86397 =C2=B1 16%     -44.6%      47867 =C2=B1  6%  sched_debug.cfs_r=
q:/.min_vruntime.31
>      84687 =C2=B1 17%     -39.7%      51047 =C2=B1 15%  sched_debug.cfs_r=
q:/.min_vruntime.32
>      84737 =C2=B1 15%     -43.4%      47972 =C2=B1 11%  sched_debug.cfs_r=
q:/.min_vruntime.33
>      84538 =C2=B1 17%     -37.4%      52927 =C2=B1 17%  sched_debug.cfs_r=
q:/.min_vruntime.34
>      82873 =C2=B1 16%     -37.1%      52164 =C2=B1  8%  sched_debug.cfs_r=
q:/.min_vruntime.35
>      70798 =C2=B1 20%     -27.7%      51222 =C2=B1  1%  sched_debug.cfs_r=
q:/.min_vruntime.36
>      71650 =C2=B1 21%     -35.4%      46267 =C2=B1  5%  sched_debug.cfs_r=
q:/.min_vruntime.37
>      72302 =C2=B1 21%     -36.2%      46131 =C2=B1 10%  sched_debug.cfs_r=
q:/.min_vruntime.38
>      73956 =C2=B1 20%     -39.9%      44478 =C2=B1  6%  sched_debug.cfs_r=
q:/.min_vruntime.39
>      74719 =C2=B1 18%     -35.9%      47906 =C2=B1  4%  sched_debug.cfs_r=
q:/.min_vruntime.40
>      73599 =C2=B1 18%     -41.1%      43371 =C2=B1  7%  sched_debug.cfs_r=
q:/.min_vruntime.41
>      74129 =C2=B1 19%     -35.8%      47573 =C2=B1  8%  sched_debug.cfs_r=
q:/.min_vruntime.42
>      74757 =C2=B1 21%     -37.4%      46822 =C2=B1  9%  sched_debug.cfs_r=
q:/.min_vruntime.43
>      71249 =C2=B1 18%     -38.7%      43668 =C2=B1  3%  sched_debug.cfs_r=
q:/.min_vruntime.44
>      70889 =C2=B1 17%     -33.9%      46869 =C2=B1  6%  sched_debug.cfs_r=
q:/.min_vruntime.46
>      74088 =C2=B1 17%     -38.5%      45599 =C2=B1 12%  sched_debug.cfs_r=
q:/.min_vruntime.47
>      80424 =C2=B1  3%      -8.9%      73252 =C2=B1  4%  sched_debug.cfs_r=
q:/.min_vruntime.avg
>     105781 =C2=B1  3%     +10.4%     116776 =C2=B1  4%  sched_debug.cfs_r=
q:/.min_vruntime.max
>      57525 =C2=B1 10%     -32.3%      38928 =C2=B1  4%  sched_debug.cfs_r=
q:/.min_vruntime.min
>      14190 =C2=B1 24%     +74.0%      24696 =C2=B1  1%  sched_debug.cfs_r=
q:/.min_vruntime.stddev
>      -7435 =C2=B1-42%    +114.1%     -15916 =C2=B1-24%  sched_debug.cfs_r=
q:/.spread0.1
>      -6966 =C2=B1-86%    +135.3%     -16394 =C2=B1-33%  sched_debug.cfs_r=
q:/.spread0.10
>      -7496 =C2=B1-108%    +593.2%     -51965 =C2=B1 -6%  sched_debug.cfs_=
rq:/.spread0.24
>      -8433 =C2=B1-93%    +646.5%     -62957 =C2=B1 -7%  sched_debug.cfs_r=
q:/.spread0.25
>      -6331 =C2=B1-163%    +887.9%     -62545 =C2=B1 -7%  sched_debug.cfs_=
rq:/.spread0.26
>      -7049 =C2=B1-132%    +808.8%     -64072 =C2=B1-10%  sched_debug.cfs_=
rq:/.spread0.27
>      -4943 =C2=B1-273%   +1076.4%     -58160 =C2=B1-10%  sched_debug.cfs_=
rq:/.spread0.28
>      -6250 =C2=B1-142%    +849.5%     -59353 =C2=B1 -5%  sched_debug.cfs_=
rq:/.spread0.29
>      -5595 =C2=B1-201%   +1007.3%     -61955 =C2=B1 -6%  sched_debug.cfs_=
rq:/.spread0.30
>      -6423 =C2=B1-124%    +953.4%     -67668 =C2=B1 -7%  sched_debug.cfs_=
rq:/.spread0.31
>      -8133 =C2=B1-103%    +692.9%     -64488 =C2=B1 -7%  sched_debug.cfs_=
rq:/.spread0.32
>      -8083 =C2=B1-81%    +735.9%     -67563 =C2=B1 -5%  sched_debug.cfs_r=
q:/.spread0.33
>      -8282 =C2=B1-100%    +655.9%     -62608 =C2=B1 -9%  sched_debug.cfs_=
rq:/.spread0.34
>      -9948 =C2=B1-74%    +537.0%     -63371 =C2=B1 -7%  sched_debug.cfs_r=
q:/.spread0.35
>     -22023 =C2=B1-94%    +192.0%     -64313 =C2=B1-10%  sched_debug.cfs_r=
q:/.spread0.36
>     -21171 =C2=B1-100%    +227.2%     -69269 =C2=B1 -6%  sched_debug.cfs_=
rq:/.spread0.37
>     -20521 =C2=B1-103%    +238.2%     -69404 =C2=B1 -7%  sched_debug.cfs_=
rq:/.spread0.38
>     -18866 =C2=B1-112%    +276.6%     -71058 =C2=B1 -6%  sched_debug.cfs_=
rq:/.spread0.39
>     -18104 =C2=B1-110%    +273.6%     -67630 =C2=B1-11%  sched_debug.cfs_=
rq:/.spread0.40
>     -19223 =C2=B1-99%    +275.4%     -72165 =C2=B1 -9%  sched_debug.cfs_r=
q:/.spread0.41
>     -18694 =C2=B1-109%    +263.5%     -67963 =C2=B1-11%  sched_debug.cfs_=
rq:/.spread0.42
>     -18066 =C2=B1-122%    +280.3%     -68713 =C2=B1 -4%  sched_debug.cfs_=
rq:/.spread0.43
>     -21575 =C2=B1-87%    +233.1%     -71868 =C2=B1 -7%  sched_debug.cfs_r=
q:/.spread0.44
>     -22907 =C2=B1-95%    +196.5%     -67923 =C2=B1 -6%  sched_debug.cfs_r=
q:/.spread0.45
>     -21935 =C2=B1-83%    +213.0%     -68667 =C2=B1 -9%  sched_debug.cfs_r=
q:/.spread0.46
>     -18737 =C2=B1-101%    +273.3%     -69937 =C2=B1 -8%  sched_debug.cfs_=
rq:/.spread0.47
>      -3013 =C2=B1-283%    +514.6%     -18522 =C2=B1-37%  sched_debug.cfs_=
rq:/.spread0.6
>      -5884 =C2=B1-109%    +282.8%     -22524 =C2=B1-27%  sched_debug.cfs_=
rq:/.spread0.7
>      -7321 =C2=B1-61%    +190.8%     -21286 =C2=B1-17%  sched_debug.cfs_r=
q:/.spread0.8
>      -8126 =C2=B1-67%    +148.3%     -20175 =C2=B1-28%  sched_debug.cfs_r=
q:/.spread0.9
>     -12393 =C2=B1-54%    +241.2%     -42282 =C2=B1-11%  sched_debug.cfs_r=
q:/.spread0.avg
>      12967 =C2=B1 38%     -90.4%       1243 =C2=B1 81%  sched_debug.cfs_r=
q:/.spread0.max
>     -35294 =C2=B1-29%    +117.1%     -76608 =C2=B1 -8%  sched_debug.cfs_r=
q:/.spread0.min
>      14191 =C2=B1 24%     +74.0%      24697 =C2=B1  1%  sched_debug.cfs_r=
q:/.spread0.stddev
>      28.17 =C2=B1 19%    +133.4%      65.75 =C2=B1 57%  sched_debug.cfs_r=
q:/.util_avg.2
>      32.17 =C2=B1 42%     -62.7%      12.00 =C2=B1113%  sched_debug.cfs_r=
q:/.util_avg.40
>      51.00 =C2=B1 74%     -82.4%       9.00 =C2=B1 47%  sched_debug.cfs_r=
q:/.util_avg.45
>     980055 =C2=B1  1%     -16.2%     821316 =C2=B1  7%  sched_debug.cpu.a=
vg_idle.2
>     974897 =C2=B1  2%     -10.6%     872035 =C2=B1  6%  sched_debug.cpu.a=
vg_idle.21
>     970838 =C2=B1  3%     -17.5%     800879 =C2=B1  9%  sched_debug.cpu.a=
vg_idle.24
>     922584 =C2=B1  5%     -13.3%     799667 =C2=B1  6%  sched_debug.cpu.a=
vg_idle.25
>     939820 =C2=B1  6%     -14.1%     807532 =C2=B1  4%  sched_debug.cpu.a=
vg_idle.26
>     972194 =C2=B1  3%     -15.5%     821130 =C2=B1  8%  sched_debug.cpu.a=
vg_idle.27
>     943576 =C2=B1  4%     -15.6%     795980 =C2=B1  8%  sched_debug.cpu.a=
vg_idle.28
>     972757 =C2=B1  4%     -11.8%     858039 =C2=B1  7%  sched_debug.cpu.a=
vg_idle.29
>     935963 =C2=B1  4%     -15.2%     793464 =C2=B1  3%  sched_debug.cpu.a=
vg_idle.31
>     961054 =C2=B1  4%     -20.4%     765294 =C2=B1  7%  sched_debug.cpu.a=
vg_idle.32
>     953272 =C2=B1  4%     -15.5%     805746 =C2=B1  1%  sched_debug.cpu.a=
vg_idle.33
>     957697 =C2=B1  3%     -19.9%     767409 =C2=B1  9%  sched_debug.cpu.a=
vg_idle.35
>     976711 =C2=B1  2%     -14.0%     840209 =C2=B1  6%  sched_debug.cpu.a=
vg_idle.39
>     944871 =C2=B1  3%     -13.8%     814393 =C2=B1  4%  sched_debug.cpu.a=
vg_idle.40
>     944464 =C2=B1  4%     -17.5%     779383 =C2=B1  4%  sched_debug.cpu.a=
vg_idle.42
>     960406 =C2=B1  4%     -16.8%     799490 =C2=B1 11%  sched_debug.cpu.a=
vg_idle.43
>     915603 =C2=B1  5%     -14.6%     781850 =C2=B1  8%  sched_debug.cpu.a=
vg_idle.44
>     954052 =C2=B1  4%     -13.2%     827775 =C2=B1  5%  sched_debug.cpu.a=
vg_idle.46
>     950001 =C2=B1  2%      -8.9%     865227 =C2=B1  0%  sched_debug.cpu.a=
vg_idle.avg
>     566441 =C2=B1 14%     -31.7%     386678 =C2=B1 12%  sched_debug.cpu.a=
vg_idle.min
>      95996 =C2=B1 24%     +77.9%     170770 =C2=B1  2%  sched_debug.cpu.a=
vg_idle.stddev
>      10.00 =C2=B1 19%     +37.9%      13.79 =C2=B1 22%  sched_debug.cpu.c=
pu_load[1].max
>      33187 =C2=B1  9%     -12.3%      29089 =C2=B1  4%  sched_debug.cpu.n=
r_load_updates.1
>      33201 =C2=B1  9%     -14.1%      28515 =C2=B1  1%  sched_debug.cpu.n=
r_load_updates.14
>      32980 =C2=B1  9%     -15.6%      27828 =C2=B1  2%  sched_debug.cpu.n=
r_load_updates.2
>      18677 =C2=B1 11%     -33.2%      12473 =C2=B1  8%  sched_debug.cpu.n=
r_load_updates.24
>      18489 =C2=B1 13%     -41.7%      10787 =C2=B1 13%  sched_debug.cpu.n=
r_load_updates.25
>      18563 =C2=B1 13%     -43.2%      10537 =C2=B1  3%  sched_debug.cpu.n=
r_load_updates.26
>      19106 =C2=B1 10%     -44.0%      10694 =C2=B1  5%  sched_debug.cpu.n=
r_load_updates.27
>      18840 =C2=B1 14%     -39.1%      11482 =C2=B1  6%  sched_debug.cpu.n=
r_load_updates.28
>      19114 =C2=B1 12%     -39.8%      11513 =C2=B1  7%  sched_debug.cpu.n=
r_load_updates.29
>      33625 =C2=B1 10%     -13.2%      29191 =C2=B1  3%  sched_debug.cpu.n=
r_load_updates.3
>      19486 =C2=B1 11%     -42.0%      11305 =C2=B1  6%  sched_debug.cpu.n=
r_load_updates.30
>      19086 =C2=B1  9%     -46.3%      10242 =C2=B1  2%  sched_debug.cpu.n=
r_load_updates.31
>      18883 =C2=B1  9%     -43.0%      10772 =C2=B1  6%  sched_debug.cpu.n=
r_load_updates.32
>      18809 =C2=B1 10%     -42.5%      10815 =C2=B1  3%  sched_debug.cpu.n=
r_load_updates.33
>      18641 =C2=B1 13%     -37.1%      11717 =C2=B1  4%  sched_debug.cpu.n=
r_load_updates.34
>      18649 =C2=B1 13%     -41.6%      10892 =C2=B1  4%  sched_debug.cpu.n=
r_load_updates.35
>      17519 =C2=B1 14%     -36.1%      11197 =C2=B1  1%  sched_debug.cpu.n=
r_load_updates.36
>      17605 =C2=B1 13%     -41.2%      10358 =C2=B1  4%  sched_debug.cpu.n=
r_load_updates.37
>      17665 =C2=B1  9%     -41.1%      10402 =C2=B1  4%  sched_debug.cpu.n=
r_load_updates.38
>      18083 =C2=B1  9%     -46.4%       9697 =C2=B1  1%  sched_debug.cpu.n=
r_load_updates.39
>      33633 =C2=B1  8%     -16.6%      28066 =C2=B1  3%  sched_debug.cpu.n=
r_load_updates.4
>      18017 =C2=B1 11%     -41.3%      10576 =C2=B1  5%  sched_debug.cpu.n=
r_load_updates.40
>      17842 =C2=B1  8%     -46.1%       9614 =C2=B1  3%  sched_debug.cpu.n=
r_load_updates.41
>      17845 =C2=B1 10%     -39.4%      10814 =C2=B1 10%  sched_debug.cpu.n=
r_load_updates.42
>      17710 =C2=B1 12%     -42.2%      10238 =C2=B1  4%  sched_debug.cpu.n=
r_load_updates.43
>      17732 =C2=B1  9%     -41.9%      10307 =C2=B1  3%  sched_debug.cpu.n=
r_load_updates.44
>      17219 =C2=B1 13%     -35.3%      11147 =C2=B1 10%  sched_debug.cpu.n=
r_load_updates.45
>      17973 =C2=B1  6%     -40.7%      10665 =C2=B1  6%  sched_debug.cpu.n=
r_load_updates.46
>      17454 =C2=B1  7%     -42.7%      10006 =C2=B1  9%  sched_debug.cpu.n=
r_load_updates.47
>      33843 =C2=B1  8%     -17.7%      27852 =C2=B1  2%  sched_debug.cpu.n=
r_load_updates.5
>      33752 =C2=B1  6%     -18.6%      27463 =C2=B1  1%  sched_debug.cpu.n=
r_load_updates.6
>      33530 =C2=B1  7%     -20.6%      26609 =C2=B1  0%  sched_debug.cpu.n=
r_load_updates.7
>      33082 =C2=B1  7%     -17.8%      27202 =C2=B1  1%  sched_debug.cpu.n=
r_load_updates.8
>      25769 =C2=B1  3%     -22.9%      19863 =C2=B1  1%  sched_debug.cpu.n=
r_load_updates.avg
>      38510 =C2=B1  3%     -15.1%      32687 =C2=B1  2%  sched_debug.cpu.n=
r_load_updates.max
>      15222 =C2=B1 10%     -41.0%       8984 =C2=B1  2%  sched_debug.cpu.n=
r_load_updates.min
>       8024 =C2=B1  3%     +15.1%       9238 =C2=B1  0%  sched_debug.cpu.n=
r_load_updates.stddev
>      70059 =C2=B1 11%     +18.0%      82660 =C2=B1  1%  sched_debug.cpu.n=
r_switches.0
>      68459 =C2=B1 13%     +20.8%      82677 =C2=B1  6%  sched_debug.cpu.n=
r_switches.19
>      67062 =C2=B1  8%     +30.8%      87722 =C2=B1 12%  sched_debug.cpu.n=
r_switches.21
>      65279 =C2=B1 12%     +35.1%      88170 =C2=B1 15%  sched_debug.cpu.n=
r_switches.22
>      27625 =C2=B1  9%     -20.7%      21898 =C2=B1  4%  sched_debug.cpu.n=
r_switches.26
>      29791 =C2=B1  9%     -24.7%      22431 =C2=B1  6%  sched_debug.cpu.n=
r_switches.27
>      30900 =C2=B1  5%     -21.5%      24260 =C2=B1 13%  sched_debug.cpu.n=
r_switches.30
>      29669 =C2=B1  7%     -22.8%      22918 =C2=B1 15%  sched_debug.cpu.n=
r_switches.31
>      30269 =C2=B1  6%     -24.3%      22926 =C2=B1  4%  sched_debug.cpu.n=
r_switches.32
>      29870 =C2=B1  9%     -23.0%      22992 =C2=B1  3%  sched_debug.cpu.n=
r_switches.33
>      29304 =C2=B1 16%     -20.1%      23410 =C2=B1  7%  sched_debug.cpu.n=
r_switches.35
>      28165 =C2=B1  6%     -20.9%      22271 =C2=B1  6%  sched_debug.cpu.n=
r_switches.38
>      29903 =C2=B1  3%     -26.0%      22122 =C2=B1 22%  sched_debug.cpu.n=
r_switches.39
>      29541 =C2=B1  6%     -30.0%      20684 =C2=B1 13%  sched_debug.cpu.n=
r_switches.41
>      30230 =C2=B1  7%     -22.8%      23349 =C2=B1 14%  sched_debug.cpu.n=
r_switches.42
>      28699 =C2=B1  7%     -22.5%      22246 =C2=B1  4%  sched_debug.cpu.n=
r_switches.44
>      30831 =C2=B1 13%     -25.7%      22905 =C2=B1  9%  sched_debug.cpu.n=
r_switches.46
>      31671 =C2=B1 18%     -30.8%      21925 =C2=B1 11%  sched_debug.cpu.n=
r_switches.47
>      23090 =C2=B1  3%     -23.9%      17565 =C2=B1  2%  sched_debug.cpu.n=
r_switches.min
>      20540 =C2=B1  5%     +29.4%      26576 =C2=B1  1%  sched_debug.cpu.n=
r_switches.stddev
>     -10.50 =C2=B1-41%     +71.4%     -18.00 =C2=B1-18%  sched_debug.cpu.n=
r_uninterruptible.0
>      -1.17 =C2=B1-378%    +714.3%      -9.50 =C2=B1-42%  sched_debug.cpu.=
nr_uninterruptible.19
>      -0.67 =C2=B1-320%   +1025.0%      -7.50 =C2=B1-56%  sched_debug.cpu.=
nr_uninterruptible.20
>      -0.17 =C2=B1-538%   +6950.0%     -11.75 =C2=B1-76%  sched_debug.cpu.=
nr_uninterruptible.21
>       2.67 =C2=B1 63%    +171.9%       7.25 =C2=B1 39%  sched_debug.cpu.n=
r_uninterruptible.25
>       2.17 =C2=B1 97%    +246.2%       7.50 =C2=B1 29%  sched_debug.cpu.n=
r_uninterruptible.27
>       3.00 =C2=B1101%    +183.3%       8.50 =C2=B1 30%  sched_debug.cpu.n=
r_uninterruptible.29
>       2.33 =C2=B1106%    +178.6%       6.50 =C2=B1 17%  sched_debug.cpu.n=
r_uninterruptible.30
>       1.67 =C2=B1206%    +320.0%       7.00 =C2=B1 31%  sched_debug.cpu.n=
r_uninterruptible.33
>       2.50 =C2=B1125%    +250.0%       8.75 =C2=B1 30%  sched_debug.cpu.n=
r_uninterruptible.34
>       2.83 =C2=B1 74%    +226.5%       9.25 =C2=B1 27%  sched_debug.cpu.n=
r_uninterruptible.36
>       2.83 =C2=B1 51%    +173.5%       7.75 =C2=B1 10%  sched_debug.cpu.n=
r_uninterruptible.37
>       1.83 =C2=B1115%    +377.3%       8.75 =C2=B1 16%  sched_debug.cpu.n=
r_uninterruptible.38
>       3.00 =C2=B1 47%    +150.0%       7.50 =C2=B1 35%  sched_debug.cpu.n=
r_uninterruptible.39
>       2.17 =C2=B1 62%    +350.0%       9.75 =C2=B1 15%  sched_debug.cpu.n=
r_uninterruptible.40
>       2.67 =C2=B1 59%    +200.0%       8.00 =C2=B1 17%  sched_debug.cpu.n=
r_uninterruptible.42
>      -1.20 =C2=B1-275%    +483.3%      -7.00 =C2=B1-26%  sched_debug.cpu.=
nr_uninterruptible.8
>       8.14 =C2=B1 16%     +80.2%      14.67 =C2=B1  5%  sched_debug.cpu.n=
r_uninterruptible.max
>     -16.11 =C2=B1-20%     +56.5%     -25.21 =C2=B1-15%  sched_debug.cpu.n=
r_uninterruptible.min
>       5.17 =C2=B1 18%     +89.8%       9.81 =C2=B1  5%  sched_debug.cpu.n=
r_uninterruptible.stddev
>      67076 =C2=B1  8%     +36.6%      91617 =C2=B1 12%  sched_debug.cpu.s=
ched_count.21
>      28419 =C2=B1  8%     -22.9%      21908 =C2=B1  4%  sched_debug.cpu.s=
ched_count.26
>      29800 =C2=B1  9%     -24.7%      22440 =C2=B1  6%  sched_debug.cpu.s=
ched_count.27
>      30909 =C2=B1  5%     -18.6%      25155 =C2=B1 11%  sched_debug.cpu.s=
ched_count.30
>      30323 =C2=B1  8%     -24.4%      22929 =C2=B1 15%  sched_debug.cpu.s=
ched_count.31
>      30278 =C2=B1  6%     -24.3%      22935 =C2=B1  4%  sched_debug.cpu.s=
ched_count.32
>      29879 =C2=B1  9%     -19.5%      24052 =C2=B1 10%  sched_debug.cpu.s=
ched_count.33
>      29314 =C2=B1 16%     -20.1%      23419 =C2=B1  7%  sched_debug.cpu.s=
ched_count.35
>      28174 =C2=B1  6%     -20.9%      22281 =C2=B1  6%  sched_debug.cpu.s=
ched_count.38
>      29913 =C2=B1  3%     -26.0%      22134 =C2=B1 22%  sched_debug.cpu.s=
ched_count.39
>      29551 =C2=B1  6%     -30.0%      20693 =C2=B1 13%  sched_debug.cpu.s=
ched_count.41
>      30241 =C2=B1  7%     -22.8%      23358 =C2=B1 14%  sched_debug.cpu.s=
ched_count.42
>      28709 =C2=B1  7%     -22.5%      22255 =C2=B1  4%  sched_debug.cpu.s=
ched_count.44
>      30840 =C2=B1 13%     -25.7%      22913 =C2=B1  9%  sched_debug.cpu.s=
ched_count.46
>      31684 =C2=B1 18%     -30.8%      21934 =C2=B1 11%  sched_debug.cpu.s=
ched_count.47
>      23099 =C2=B1  3%     -23.9%      17574 =C2=B1  2%  sched_debug.cpu.s=
ched_count.min
>      31945 =C2=B1 13%     +18.5%      37850 =C2=B1  6%  sched_debug.cpu.s=
ched_goidle.19
>      30731 =C2=B1  8%     +29.2%      39695 =C2=B1 11%  sched_debug.cpu.s=
ched_goidle.21
>      29857 =C2=B1 13%     +38.4%      41325 =C2=B1 16%  sched_debug.cpu.s=
ched_goidle.22
>      12490 =C2=B1 11%     -23.1%       9605 =C2=B1  3%  sched_debug.cpu.s=
ched_goidle.26
>      13340 =C2=B1 11%     -26.5%       9799 =C2=B1  5%  sched_debug.cpu.s=
ched_goidle.27
>      13706 =C2=B1  8%     -24.1%      10396 =C2=B1 10%  sched_debug.cpu.s=
ched_goidle.30
>      13151 =C2=B1  9%     -22.9%      10139 =C2=B1 16%  sched_debug.cpu.s=
ched_goidle.31
>      13358 =C2=B1  8%     -25.4%       9966 =C2=B1  4%  sched_debug.cpu.s=
ched_goidle.32
>      13123 =C2=B1 10%     -25.2%       9820 =C2=B1  4%  sched_debug.cpu.s=
ched_goidle.33
>      13108 =C2=B1 13%     -22.4%      10174 =C2=B1  7%  sched_debug.cpu.s=
ched_goidle.35
>      12183 =C2=B1  6%     -22.4%       9458 =C2=B1  6%  sched_debug.cpu.s=
ched_goidle.38
>      12693 =C2=B1  6%     -28.7%       9047 =C2=B1 13%  sched_debug.cpu.s=
ched_goidle.41
>      12945 =C2=B1  8%     -23.3%       9934 =C2=B1 13%  sched_debug.cpu.s=
ched_goidle.42
>      12450 =C2=B1  7%     -23.7%       9505 =C2=B1  3%  sched_debug.cpu.s=
ched_goidle.44
>      13236 =C2=B1 12%     -26.5%       9728 =C2=B1  9%  sched_debug.cpu.s=
ched_goidle.46
>      14021 =C2=B1 23%     -33.7%       9299 =C2=B1 11%  sched_debug.cpu.s=
ched_goidle.47
>      10147 =C2=B1  5%     -24.8%       7633 =C2=B1  1%  sched_debug.cpu.s=
ched_goidle.min
>      10080 =C2=B1  5%     +25.3%      12626 =C2=B1  1%  sched_debug.cpu.s=
ched_goidle.stddev
>      24925 =C2=B1 16%     +35.6%      33805 =C2=B1 12%  sched_debug.cpu.t=
twu_count.19
>       9941 =C2=B1 27%     -33.3%       6634 =C2=B1 15%  sched_debug.cpu.t=
twu_count.25
>       9312 =C2=B1 12%     -30.2%       6496 =C2=B1  6%  sched_debug.cpu.t=
twu_count.27
>      10973 =C2=B1 21%     -34.3%       7215 =C2=B1  8%  sched_debug.cpu.t=
twu_count.29
>       8854 =C2=B1  9%     -24.9%       6652 =C2=B1  2%  sched_debug.cpu.t=
twu_count.31
>       9747 =C2=B1 16%     -29.1%       6909 =C2=B1  5%  sched_debug.cpu.t=
twu_count.32
>      11309 =C2=B1 18%     -33.0%       7579 =C2=B1 19%  sched_debug.cpu.t=
twu_count.40
>       9685 =C2=B1 14%     -30.4%       6741 =C2=B1  7%  sched_debug.cpu.t=
twu_count.43
>      17375 =C2=B1 62%     -58.6%       7191 =C2=B1 16%  sched_debug.cpu.t=
twu_count.47
>       7059 =C2=B1  5%     -23.9%       5373 =C2=B1  3%  sched_debug.cpu.t=
twu_count.min
>       7971 =C2=B1 16%     +34.5%      10722 =C2=B1  4%  sched_debug.cpu.t=
twu_local.0
>       5557 =C2=B1 10%     +23.1%       6839 =C2=B1  6%  sched_debug.cpu.t=
twu_local.1
>       6025 =C2=B1 23%     +32.2%       7968 =C2=B1  7%  sched_debug.cpu.t=
twu_local.12
>       5675 =C2=B1 17%     +24.5%       7066 =C2=B1  8%  sched_debug.cpu.t=
twu_local.13
>       6633 =C2=B1 17%     +27.9%       8486 =C2=B1  3%  sched_debug.cpu.t=
twu_local.19
>       6719 =C2=B1 16%     +42.7%       9586 =C2=B1 15%  sched_debug.cpu.t=
twu_local.21
>       5919 =C2=B1 14%     +21.1%       7165 =C2=B1 13%  sched_debug.cpu.t=
twu_local.3
>       4183 =C2=B1 19%     -38.3%       2582 =C2=B1  7%  sched_debug.cpu.t=
twu_local.39
>       5434 =C2=B1 11%     +30.9%       7115 =C2=B1 10%  sched_debug.cpu.t=
twu_local.4
>       4196 =C2=B1 25%     -37.6%       2616 =C2=B1 12%  sched_debug.cpu.t=
twu_local.41
>       5914 =C2=B1 13%     +16.0%       6863 =C2=B1  3%  sched_debug.cpu.t=
twu_local.6
>       6296 =C2=B1 18%     +24.6%       7842 =C2=B1  9%  sched_debug.cpu.t=
twu_local.9
>       1882 =C2=B1  7%     +27.0%       2390 =C2=B1  1%  sched_debug.cpu.t=
twu_local.stddev
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/disk/filesize/fs/iterations/kconfig/nr_directories/nr_files_per_=
directory/nr_threads/rootfs/sync_method/tbox_group/test_size/testcase:
>   gcc-4.9/1HDD/8K/f2fs/1x/x86_64-rhel/16d/256fpd/32t/debian-x86_64-2015-0=
2-07.cgz/fsyncBeforeClose/nhm4/400M/fsmark
> =

> commit: =

>   v4.5-rc1
>   6ffc77f48b85ed9ab9a7b2754a7b49891ebaff83
> =

>         v4.5-rc1 6ffc77f48b85ed9ab9a7b2754a =

> ---------------- -------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>    4680516 =C2=B1  8%     +14.5%    5359884 =C2=B1  4%  fsmark.app_overhe=
ad
>     525.77 =C2=B1  0%      +4.6%     550.12 =C2=B1  0%  fsmark.files_per_=
sec
>      19446 =C2=B1  1%      -9.8%      17546 =C2=B1  0%  fsmark.time.invol=
untary_context_switches
>      14.00 =C2=B1  0%     -17.9%      11.50 =C2=B1  4%  fsmark.time.perce=
nt_of_cpu_this_job_got
>     463972 =C2=B1  0%      -6.8%     432399 =C2=B1  0%  fsmark.time.volun=
tary_context_switches
>     251.60 =C2=B1200%   +2104.3%       5546 =C2=B1100%  latency_stats.sum=
.wait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writ=
eback.[f2fs].__f2fs_add_link.[f2fs].f2fs_mkdir.[f2fs].vfs_mkdir.SyS_mkdir.e=
ntry_SYSCALL_64_fastpath
>      18701 =C2=B1  0%     -11.2%      16611 =C2=B1  1%  proc-vmstat.pgact=
ivate
>      25317 =C2=B1  0%     +11.2%      28145 =C2=B1  0%  softirqs.BLOCK
>     267.69 =C2=B1  2%     -12.5%     234.29 =C2=B1  1%  uptime.idle
>       6510 =C2=B1  0%      +4.0%       6770 =C2=B1  0%  vmstat.io.bo
>      19446 =C2=B1  1%      -9.8%      17546 =C2=B1  0%  time.involuntary_=
context_switches
>      14.00 =C2=B1  0%     -17.9%      11.50 =C2=B1  4%  time.percent_of_c=
pu_this_job_got
>      13.89 =C2=B1  0%     -22.9%      10.71 =C2=B1  0%  time.system_time
>       0.59 =C2=B1  6%     -18.3%       0.48 =C2=B1  3%  time.user_time
>      24.32 =C2=B1  0%     +17.5%      28.57 =C2=B1  0%  turbostat.%Busy
>     792.00 =C2=B1  1%     +19.5%     946.75 =C2=B1  0%  turbostat.Avg_MHz
>      22.05 =C2=B1  0%    +142.3%      53.42 =C2=B1  0%  turbostat.CPU%c1
>      44.77 =C2=B1  0%     -70.4%      13.25 =C2=B1  2%  turbostat.CPU%c3
>       8.87 =C2=B1  5%     -46.4%       4.76 =C2=B1  1%  turbostat.CPU%c6
>   18381428 =C2=B1  3%    +761.8%  1.584e+08 =C2=B1  0%  cpuidle.C1-NHM.ti=
me
>      32978 =C2=B1  1%    +191.0%      95971 =C2=B1  0%  cpuidle.C1-NHM.us=
age
>   24159280 =C2=B1  1%    +268.7%   89074691 =C2=B1  1%  cpuidle.C1E-NHM.t=
ime
>      39453 =C2=B1  0%     +31.4%      51846 =C2=B1  1%  cpuidle.C1E-NHM.u=
sage
>   3.87e+08 =C2=B1  0%     -48.4%  1.998e+08 =C2=B1  0%  cpuidle.C3-NHM.ti=
me
>     209952 =C2=B1  0%     -41.9%     122009 =C2=B1  0%  cpuidle.C3-NHM.us=
age
>  1.726e+08 =C2=B1  2%     -45.9%   93298544 =C2=B1  2%  cpuidle.C6-NHM.ti=
me
>      84430 =C2=B1  1%     -50.4%      41860 =C2=B1  1%  cpuidle.C6-NHM.us=
age
>  1.748e+08 =C2=B1  0%     +15.4%  2.018e+08 =C2=B1  0%  cpuidle.POLL.time
>     120026 =C2=B1  0%     +32.3%     158824 =C2=B1  0%  cpuidle.POLL.usage
>       1432 =C2=B1 52%     -34.0%     945.59 =C2=B1  7%  sched_debug.cfs_r=
q:/.exec_clock.1
>       1099 =C2=B1  7%     -17.3%     909.21 =C2=B1  7%  sched_debug.cfs_r=
q:/.exec_clock.2
>       1102 =C2=B1  4%     -19.5%     887.21 =C2=B1  4%  sched_debug.cfs_r=
q:/.exec_clock.3
>       2120 =C2=B1 44%     -70.8%     618.32 =C2=B1  6%  sched_debug.cfs_r=
q:/.exec_clock.4
>     741.50 =C2=B1  6%     -19.6%     595.94 =C2=B1  9%  sched_debug.cfs_r=
q:/.exec_clock.5
>     848.32 =C2=B1 12%     -17.9%     696.64 =C2=B1 14%  sched_debug.cfs_r=
q:/.exec_clock.7
>       1242 =C2=B1  0%     -12.2%       1091 =C2=B1  0%  sched_debug.cfs_r=
q:/.exec_clock.avg
>     706.35 =C2=B1  2%     -19.0%     572.30 =C2=B1  5%  sched_debug.cfs_r=
q:/.exec_clock.min
>     696.95 =C2=B1 12%     +26.4%     881.26 =C2=B1  3%  sched_debug.cfs_r=
q:/.exec_clock.stddev
>      80.73 =C2=B1 17%     +31.5%     106.16 =C2=B1 16%  sched_debug.cfs_r=
q:/.load_avg.avg
>       3549 =C2=B1 15%     +37.7%       4888 =C2=B1  7%  sched_debug.cfs_r=
q:/.min_vruntime.0
>       3473 =C2=B1 25%     -52.9%       1636 =C2=B1 15%  sched_debug.cfs_r=
q:/.min_vruntime.4
>       2195 =C2=B1 19%     -24.9%       1649 =C2=B1 14%  sched_debug.cfs_r=
q:/.min_vruntime.5
>       2198 =C2=B1 16%     -22.2%       1711 =C2=B1 15%  sched_debug.cfs_r=
q:/.min_vruntime.7
>       2703 =C2=B1  0%     -10.5%       2419 =C2=B1  0%  sched_debug.cfs_r=
q:/.min_vruntime.avg
>       4291 =C2=B1  8%     +13.9%       4888 =C2=B1  7%  sched_debug.cfs_r=
q:/.min_vruntime.max
>       1806 =C2=B1  5%     -21.1%       1424 =C2=B1  5%  sched_debug.cfs_r=
q:/.min_vruntime.min
>     788.12 =C2=B1 11%     +30.8%       1030 =C2=B1 14%  sched_debug.cfs_r=
q:/.min_vruntime.stddev
>    -577.72 =C2=B1-184%    +349.5%      -2596 =C2=B1-25%  sched_debug.cfs_=
rq:/.spread0.1
>    -798.00 =C2=B1-80%    +189.1%      -2306 =C2=B1-17%  sched_debug.cfs_r=
q:/.spread0.2
>      -1088 =C2=B1-70%    +121.2%      -2408 =C2=B1-15%  sched_debug.cfs_r=
q:/.spread0.3
>     -77.23 =C2=B1-1651%   +4110.9%      -3251 =C2=B1-17%  sched_debug.cfs=
_rq:/.spread0.4
>      -1355 =C2=B1-11%    +139.0%      -3239 =C2=B1-16%  sched_debug.cfs_r=
q:/.spread0.5
>    -846.87 =C2=B1-66%    +191.5%      -2469 =C2=B1-15%  sched_debug.cfs_r=
q:/.spread0.avg
>      -1744 =C2=B1-34%     +98.5%      -3463 =C2=B1-13%  sched_debug.cfs_r=
q:/.spread0.min
>     788.41 =C2=B1 11%     +30.8%       1031 =C2=B1 14%  sched_debug.cfs_r=
q:/.spread0.stddev
>     166.83 =C2=B1 33%     +86.1%     310.50 =C2=B1 55%  sched_debug.cfs_r=
q:/.util_avg.5
>     633424 =C2=B1 20%     +36.3%     863396 =C2=B1 13%  sched_debug.cpu.a=
vg_idle.7
>     359464 =C2=B1 23%     +34.2%     482294 =C2=B1 17%  sched_debug.cpu.a=
vg_idle.min
>       0.75 =C2=B1110%    +300.0%       3.00 =C2=B1 81%  sched_debug.cpu.c=
pu_load[1].3
>       0.50 =C2=B1100%    +450.0%       2.75 =C2=B1 69%  sched_debug.cpu.c=
pu_load[2].3
>       0.50 =C2=B1173%    +500.0%       3.00 =C2=B1 52%  sched_debug.cpu.c=
pu_load[3].3
>       0.25 =C2=B1173%   +1300.0%       3.50 =C2=B1 58%  sched_debug.cpu.c=
pu_load[4].3
>       6351 =C2=B1 12%     -30.0%       4445 =C2=B1  2%  sched_debug.cpu.n=
r_load_updates.4
>      37017 =C2=B1  6%     +11.2%      41155 =C2=B1  7%  sched_debug.cpu.n=
r_switches.7
>      13595 =C2=B1  8%     +14.2%      15525 =C2=B1  7%  sched_debug.cpu.n=
r_switches.stddev
>      -2130 =C2=B1 -4%     -17.3%      -1761 =C2=B1 -4%  sched_debug.cpu.n=
r_uninterruptible.0
>    -337.83 =C2=B1-28%     -42.9%    -192.75 =C2=B1-15%  sched_debug.cpu.n=
r_uninterruptible.2
>     784.00 =C2=B1  9%     -30.2%     547.25 =C2=B1 19%  sched_debug.cpu.n=
r_uninterruptible.5
>     926.00 =C2=B1  7%     -25.6%     688.50 =C2=B1  2%  sched_debug.cpu.n=
r_uninterruptible.max
>      -2129 =C2=B1 -4%     -17.3%      -1760 =C2=B1 -4%  sched_debug.cpu.n=
r_uninterruptible.min
>     959.80 =C2=B1  5%     -20.8%     759.81 =C2=B1  2%  sched_debug.cpu.n=
r_uninterruptible.stddev
>      37044 =C2=B1  6%     +11.2%      41177 =C2=B1  7%  sched_debug.cpu.s=
ched_count.7
>      14921 =C2=B1  8%     +16.0%      17307 =C2=B1  9%  sched_debug.cpu.s=
ched_goidle.7
>      21799 =C2=B1  4%     +10.5%      24078 =C2=B1  1%  sched_debug.cpu.t=
twu_count.stddev
>      22901 =C2=B1  2%     +12.5%      25754 =C2=B1  4%  sched_debug.cpu.t=
twu_local.0
>       4759 =C2=B1 11%     -27.2%       3465 =C2=B1  3%  sched_debug.cpu.t=
twu_local.4
>      22984 =C2=B1  1%     +12.4%      25827 =C2=B1  4%  sched_debug.cpu.t=
twu_local.max
>       6202 =C2=B1  1%     +16.4%       7217 =C2=B1  5%  sched_debug.cpu.t=
twu_local.stddev
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/testcase:
>   gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/lkp-ivb-=
d02/execl/unixbench
> =

> commit: =

>   v4.5-rc1
>   6ffc77f48b85ed9ab9a7b2754a7b49891ebaff83
> =

>         v4.5-rc1 6ffc77f48b85ed9ab9a7b2754a =

> ---------------- -------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>       1260 =C2=B1  0%      +8.7%       1369 =C2=B1  0%  unixbench.score
>     484658 =C2=B1  0%      +8.7%     526705 =C2=B1  0%  unixbench.time.in=
voluntary_context_switches
>   22562139 =C2=B1  0%      +8.7%   24527176 =C2=B1  0%  unixbench.time.mi=
nor_page_faults
>     515.20 =C2=B1  3%     +84.1%     948.25 =C2=B1  2%  time.voluntary_co=
ntext_switches
>      17071 =C2=B1  0%      +7.9%      18427 =C2=B1  0%  vmstat.system.cs
>       2842 =C2=B1  2%    +110.9%       5993 =C2=B1  0%  vmstat.system.in
>   40099209 =C2=B1  5%    +367.2%  1.873e+08 =C2=B1  4%  cpuidle.C1E-IVB.t=
ime
>     314651 =C2=B1  5%    +221.5%    1011451 =C2=B1  0%  cpuidle.C1E-IVB.u=
sage
>   48936191 =C2=B1  9%     -66.3%   16512783 =C2=B1 27%  cpuidle.C3-IVB.ti=
me
>     141452 =C2=B1  9%     -79.3%      29263 =C2=B1 29%  cpuidle.C3-IVB.us=
age
>  2.177e+08 =C2=B1  3%     -55.1%   97821419 =C2=B1  4%  cpuidle.C6-IVB.ti=
me
>     292192 =C2=B1  3%     -82.4%      51299 =C2=B1 15%  cpuidle.C6-IVB.us=
age
>     142094 =C2=B1  2%     +14.3%     162480 =C2=B1  1%  sched_debug.cpu.n=
r_switches.0
>     150091 =C2=B1  2%     +13.5%     170367 =C2=B1  1%  sched_debug.cpu.s=
ched_count.0
>     153262 =C2=B1  3%     +11.2%     170368 =C2=B1  1%  sched_debug.cpu.s=
ched_count.max
>      51184 =C2=B1  4%     +16.6%      59659 =C2=B1  2%  sched_debug.cpu.s=
ched_goidle.0
>      41761 =C2=B1  5%      +8.2%      45170 =C2=B1  3%  sched_debug.cpu.s=
ched_goidle.min
>      40770 =C2=B1  4%     +14.0%      46477 =C2=B1  6%  sched_debug.cpu.t=
twu_count.min
>      43310 =C2=B1  3%     +12.5%      48739 =C2=B1  0%  sched_debug.cpu.t=
twu_local.0
>      35767 =C2=B1  1%     +11.3%      39826 =C2=B1  2%  sched_debug.cpu.t=
twu_local.3
>      22.72 =C2=B1  0%      +5.6%      23.99 =C2=B1  0%  turbostat.%Busy
>     747.40 =C2=B1  0%      +5.7%     789.75 =C2=B1  0%  turbostat.Avg_MHz
>      41.33 =C2=B1  2%     +60.1%      66.16 =C2=B1  0%  turbostat.CPU%c1
>      25.99 =C2=B1  3%     -96.0%       1.03 =C2=B1 26%  turbostat.CPU%c3
>       9.96 =C2=B1  1%     -11.4%       8.83 =C2=B1  2%  turbostat.CPU%c6
>      10.22 =C2=B1  0%      +7.2%      10.96 =C2=B1  0%  turbostat.CorWatt
>       0.22 =C2=B1 49%    +273.9%       0.83 =C2=B1 50%  turbostat.Pkg%pc3
>       8.98 =C2=B1  2%     -16.2%       7.53 =C2=B1  5%  turbostat.Pkg%pc6
>      27.07 =C2=B1  0%      +2.7%      27.81 =C2=B1  0%  turbostat.PkgWatt
> =

> =

> ivb43: Ivytown Ivy Bridge-EP
> Memory: 64G
> =

> nhm4: Nehalem
> Memory: 4G
> =

> lkp-ivb-d02: Ivy Bridge
> Memory: 8G
> =

>                      fsmark.time.percent_of_cpu_this_job_got
> =

>   14 *+-*--*--*--*--*--*--*--*--*--*-----*-*-----*--*--*--*--*--*--*--*--=
*--*
>      |                                 ..      ..                        =
   |
>   13 ++                               *       *                          =
   |
>   12 ++                                          O  O        O  O        =
   |
>      |                                                                   =
   |
>   11 ++                   O  O  O  O  O  O O  O        O  O        O  O  =
   |
>      |                                                                   =
   |
>   10 ++                                                                  =
   |
>      |                                                                   =
   |
>    9 ++                                                                  =
   |
>    8 ++                                                                  =
   |
>      |                                                                   =
   |
>    7 ++       O     O                                                    =
   |
>      |                                                                   =
   |
>    6 O+-O--O-----O-----O-------------------------------------------------=
---+
> =

> =

>                                   cpuidle.C1-NHM.time
> =

>   2.5e+08 ++-O--O----O-----O---------------------------------------------=
---+
>           O       O     O                                                =
   |
>           |                                                              =
   |
>     2e+08 ++                                                             =
   |
>           |                                                              =
   |
>           |                  O  O  O  O O  O  O  O O  O  O  O O  O  O  O =
   |
>   1.5e+08 ++                                                             =
   |
>           |                                                              =
   |
>     1e+08 ++                                                             =
   |
>           |                                                              =
   |
>           |                                                              =
   |
>     5e+07 ++                                                             =
   |
>           |                                                              =
   |
>           *..*..*.*..*..*..*.*..*..*..*.*..*..*..*.*..*..*..*.*..*..*..*.=
*..*
>         0 ++-------------------------------------------------------------=
---+
> =

> =

>                                 cpuidle.C1-NHM.usage
> =

>   120000 O+-O------------------------------------------------------------=
---+
>          |     O O  O  O  O                                              =
   |
>   110000 ++                                                              =
   |
>   100000 ++                          O  O       O                        =
   |
>          |                   O O  O        O O     O  O O  O  O  O  O O  =
   |
>    90000 ++                                                              =
   |
>    80000 ++                                                              =
   |
>          |                                                               =
   |
>    70000 ++                                                              =
   |
>    60000 ++                                                              =
   |
>          |                                                               =
   |
>    50000 ++                                                              =
   |
>    40000 ++                             *..     *..                      =
   |
>          |      .*..                  ..      ..          .*..          .=
*..|
>    30000 *+-*--*----*--*--*--*-*--*--*-----*-*-----*--*-*-----*--*--*-*--=
---*
> =

> =

>                                 cpuidle.C1E-NHM.time
> =

>   1e+08 ++---------------------------------------------------------------=
---+
>         |                                                                =
   |
>   9e+07 ++               O  O  O  O O  O  O     O  O O  O  O  O  O  O O  =
   |
>   8e+07 O+ O  O  O O  O                      O                           =
   |
>         |                                                                =
   |
>   7e+07 ++                                                               =
   |
>         |                                                                =
   |
>   6e+07 ++                                                               =
   |
>         |                                                                =
   |
>   5e+07 ++                                                               =
   |
>   4e+07 ++                                                               =
   |
>         |                                                                =
   |
>   3e+07 ++                            .*..     .*..                      =
   |
>         *..*..*..*.*..*..*..*..*..*.*.    *..*.    *.*..*..*..*..*..*.*..=
*..*
>   2e+07 ++---------------------------------------------------------------=
---+
> =

> =

>                                   cpuidle.C3-NHM.time
> =

>   4.5e+08 ++-------------------------------------------------------------=
---+
>           |                                                              =
   |
>     4e+08 ++           .*..*.*..*..*..*.*..*..*..*.                      =
   |
>           *..*..*.*..*.                            *..*..*..*.*..*..*..*.=
*..*
>           |                                                              =
   |
>   3.5e+08 ++                                                             =
   |
>           |                                                              =
   |
>     3e+08 ++                                                             =
   |
>           |                                                              =
   |
>   2.5e+08 ++                                                             =
   |
>           |                                                              =
   |
>           |                           O    O                             =
   |
>     2e+08 O+      O  O  O    O  O  O    O     O  O O  O  O  O O  O  O  O =
   |
>           |  O  O          O                                             =
   |
>   1.5e+08 ++-------------------------------------------------------------=
---+
> =

> =

>                                 cpuidle.C3-NHM.usage
> =

>   280000 ++--------------------------------------------------------------=
---+
>          |                              *       *                        =
   |
>   260000 ++                            : :     : :                       =
   |
>   240000 ++                            :  :    :  :                      =
   |
>          |                            :   :   :   :                      =
   |
>   220000 *+.*.. .*..*..*..*..*.*..*..*     *.*     *..*.  .*..*..*..*.  .=
*..*
>   200000 ++    *                                        *.            *. =
   |
>          |                                                               =
   |
>   180000 ++                                                              =
   |
>   160000 ++                                                              =
   |
>          |                           O                                   =
   |
>   140000 O+                                                              =
   |
>   120000 ++                  O O  O     O  O O  O  O  O O  O  O  O  O O  =
   |
>          |  O  O O  O  O  O                                              =
   |
>   100000 ++--------------------------------------------------------------=
---+
> =

> =

>                                   cpuidle.C6-NHM.time
> =

>     2e+08 ++-------------------------------------------------------------=
---+
>           |                                                              =
   |
>   1.8e+08 ++   .*               *..                     .*..          .* =
   |
>           *..*.  +     .*..*. ..     .*    *..*..  *..*.        .*..*.  +=
   |
>           |       *..*.      *     *.  :  +       +         *.*.         =
*..*
>   1.6e+08 ++                           : +       *                       =
   |
>           |                             *                                =
   |
>   1.4e+08 ++                                                             =
   |
>           |                                                              =
   |
>   1.2e+08 ++                                                             =
   |
>           |                                                              =
   |
>           |                                   O                          =
   |
>     1e+08 ++                 O  O  O       O     O    O  O       O  O    =
   |
>           |  O    O  O  O             O O          O        O O        O =
   |
>     8e+07 O+----O----------O---------------------------------------------=
---+
> =

> =

>                                 cpuidle.C6-NHM.usage
> =

>   90000 ++---------------------*-----------------------------------------=
---+
>         *..*..*..    .*..*.. ..    .*..  .*..*..*..*.*..*..     .*..*.*..=
   |
>   80000 ++       *.*.       *     *    *.                  *..*.         =
*..*
>         |                                                                =
   |
>         |                                                                =
   |
>   70000 ++                                                               =
   |
>         |                                                                =
   |
>   60000 ++                                                               =
   |
>         |                                                                =
   |
>   50000 ++                                                               =
   |
>         |                                                                =
   |
>         |          O  O     O  O  O O     O  O  O  O O  O  O  O  O  O O  =
   |
>   40000 O+ O  O  O       O             O                                 =
   |
>         |                                                                =
   |
>   30000 ++---------------------------------------------------------------=
---+
> =

> =

> =

>                            aim9.shell_rtns_2.ops_per_sec
> =

>   460 ++-----------------------------------------------------------------=
---+
>       |    O                                                             =
   |
>   450 O+ O       O O          O       O  O  O       O O                  =
   |
>   440 ++      O       O  O  O    O            O  O       O  O            =
   |
>       |                             O                                    =
   |
>   430 ++                                                                 =
   |
>   420 ++                                                                 =
   |
>       |                                                                  =
   |
>   410 ++                                                                 =
   |
>   400 ++                                      *                          =
   |
>       |       *..                            : :            *..          =
*..|
>   390 ++     +   *.                          :  :          +   *.       :=
   *
>   380 *+.   +      *..     .*.*..*..*.*..*..*   :  .*.    +      *..    :=
   |
>       |  *.*          *..*.                      *.   *..*          *..* =
   |
>   370 ++-----------------------------------------------------------------=
---+
> =

> =

>                                aim9.time.user_time
> =

>   58 ++-------------------------------O----------------------------------=
---+
>      |  O O        O O  O  O  O O  O     O O  O  O O  O  O  O            =
   |
>   57 O+         O                                                        =
   |
>   56 ++      O                                                           =
   |
>      |                                                                   =
   |
>   55 ++                                                                  =
   |
>   54 ++                                                                  =
   |
>      |                                                                   =
   |
>   53 ++                                                                  =
   |
>   52 ++                                       *                          =
   |
>      |       *..                             + +            *.           =
*..|
>   51 ++     +   *..                         +   +          +  *..       :=
   *
>   50 *+.*. +       *    *..*..*.*..*..  .*.*     *.*..*.. +      *..*.. :=
   |
>      |    *         + ..              *.                 *             * =
   |
>   49 ++--------------*---------------------------------------------------=
---+
> =

> =

>                               aim9.time.minor_page_faults
> =

>   4.5e+07 ++-------------------------------------------------------------=
---+
>           O    O                                                         =
   |
>   4.4e+07 ++ O    O O  O O  O O  O      O  O  O O  O O  O O  O           =
   |
>   4.3e+07 ++                       O  O                                  =
   |
>           |                                                              =
   |
>   4.2e+07 ++                                                             =
   |
>   4.1e+07 ++                                                             =
   |
>           |                                                              =
   |
>     4e+07 ++                                                             =
   |
>   3.9e+07 ++                                    *                        =
   |
>           |       *.                           : +           *.          =
*..|
>   3.8e+07 ++    ..  *..      .*..*.*..         :  +        ..  *..      +=
   *
>   3.7e+07 *+.*.*       *.*..*         *.*..*..*    *.*..*.*       *.*..* =
   |
>           |                                                              =
   |
>   3.6e+07 ++-------------------------------------------------------------=
---+
> =

> =

>                          aim9.time.voluntary_context_switches
> =

>    1.1e+06 ++------------------------------------------------------------=
---+
>   1.08e+06 ++   O                                                        =
   |
>            O  O      O            O      O  O O       O O                =
   |
>   1.06e+06 ++      O    O O  O O    O            O O       O O           =
   |
>   1.04e+06 ++                          O                                 =
   |
>            |                                                             =
   |
>   1.02e+06 ++                                                            =
   |
>      1e+06 ++                                                            =
   |
>     980000 ++                                                            =
   |
>            |                                                             =
   |
>     960000 ++                                    *                       =
   |
>     940000 ++      *.                           + :          *..         =
 *.|
>            |      +  *..         .*.*..        +  :         :   *.       =
+  *
>     920000 *+.   +      *.    .*.      *.*..*.*    *..*.    :     *..   +=
   |
>     900000 ++-*-*---------*--*--------------------------*--*---------*-*-=
---+
> =

> =

>                        aim9.time.involuntary_context_switches
> =

>   420000 ++--------------------------------------------------------------=
---+
>          |                                                               =
   |
>   410000 O+ O O    O            O       O                                =
   |
>   400000 ++      O    O O  O  O    O       O O       O O                 =
   |
>          |                           O          O O       O  O           =
   |
>   390000 ++                                                              =
   |
>          |                                                               =
   |
>   380000 ++                                                              =
   |
>          |                                                               =
   |
>   370000 ++                                                              =
   |
>   360000 ++                                     *                        =
   |
>          |       *.                            + :           *.          =
*..|
>   350000 ++     +  *..*.     .*.*..*.*..*..*. +  :          +  *..      :=
   *
>          *..   +        *..*.                *    *..*.    +      *.    :=
   |
>   340000 ++-*-*----------------------------------------*--*---------*--*-=
---+
> =

> =

>                                   unixbench.score
> =

>   1400 ++----------------------------------------------------------------=
---+
>        |                         O O O O O                               =
   |
>   1380 O+O O O   O O O   O O O O          O                              =
   |
>   1360 ++      O                            O O O O O O O O              =
   |
>        |               O                                                 =
   |
>   1340 ++                                                                =
   |
>        |                                                                 =
   |
>   1320 ++                                                                =
   |
>        |                                                                 =
   |
>   1300 ++                                                                =
   |
>   1280 ++                                                                =
   |
>        |                      .*.*. .*.                                  =
   |
>   1260 *+*.*.*.*.*.*.*. .*.*.*     *   *.**.*.*.*.*.*. .*.*.*.*.*.*.*.*.*=
. .*
>        |               *                              *                  =
 * |
>   1240 ++----------------------------------------------------------------=
---+
> =

> =

>                      unixbench.time.involuntary_context_switches
> =

>   540000 ++--------------------------------------------------------------=
---+
>          |         O            O O O O   OO                             =
   |
>   530000 ++O   O      O   O O           O                                =
   |
>          O   O   O  O         O              O O O O O O O O             =
   |
>          |              O                                                =
   |
>   520000 ++                                                              =
   |
>          |                                                               =
   |
>   510000 ++                                                              =
   |
>          |                                                               =
   |
>   500000 ++                                                              =
   |
>          |                                                               =
   |
>          |                                                               =
   |
>   490000 ++   .*.          .*. .*.*. .*.    .*.                 .*       =
   |
>          *.*.*   *.**. .*.*   *     *   *.**   *.*.*. .*.*.*.*.*  *.*.*. =
.*.*
>   480000 ++-----------*------------------------------*------------------*=
---+
> =

> 	[*] bisect-good sample
> 	[O] bisect-bad  sample
> =

> To reproduce:
> =

>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =

> =

> Thanks,
> Ying Huang

> ---
> LKP_SERVER: inn
> LKP_CGI_PORT: 80
> LKP_CIFS_PORT: 139
> testcase: unixbench
> default-monitors:
>   wait: activate-monitor
>   kmsg: =

>   uptime: =

>   iostat: =

>   vmstat: =

>   numa-numastat: =

>   numa-vmstat: =

>   numa-meminfo: =

>   proc-vmstat: =

>   proc-stat:
>     interval: 10
>   meminfo: =

>   slabinfo: =

>   interrupts: =

>   lock_stat: =

>   latency_stats: =

>   softirqs: =

>   bdi_dev_mapping: =

>   diskstats: =

>   nfsstat: =

>   cpuidle: =

>   cpufreq-stats: =

>   turbostat: =

>   pmeter: =

>   sched_debug:
>     interval: 60
> cpufreq_governor: performance
> default-watchdogs:
>   oom-killer: =

>   watchdog: =

> commit: 6ffc77f48b85ed9ab9a7b2754a7b49891ebaff83
> model: Ivy Bridge
> nr_cpu: 4
> memory: 8G
> nr_hdd_partitions: 1
> hdd_partitions: "/dev/disk/by-id/ata-ST1000DM003-1CH162_Z1DBQSB0-part1"
> swap_partitions: "/dev/disk/by-id/ata-ST1000DM003-1CH162_Z1DBQSB0-part3"
> rootfs_partition: "/dev/disk/by-id/ata-ST1000DM003-1CH162_Z1DBQSB0-part4"
> netconsole_port: 66723
> category: benchmark
> nr_task: 1
> unixbench:
>   test: execl
> queue: bisect
> testbox: lkp-ivb-d02
> tbox_group: lkp-ivb-d02
> kconfig: x86_64-rhel
> enqueue_time: 2016-02-01 04:41:40.844697988 +08:00
> id: ab239be39f92df1f1f155f9ff8ab50bd48a204bb
> user: lkp
> compiler: gcc-4.9
> head_commit: a66aef2038ce0ce7386c40e2a010beb2cb7895d2
> base_commit: 92e963f50fc74041b5e9e744c330dca48e04f08d
> branch: linux-devel/devel-hourly-2016013119
> rootfs: debian-x86_64-2015-02-07.cgz
> result_root: "/result/unixbench/performance-1-execl/lkp-ivb-d02/debian-x8=
6_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/6ffc77f48b85ed9ab9a7b2754a7b49891eb=
aff83/1"
> job_file: "/lkp/scheduled/lkp-ivb-d02/bisect_unixbench-performance-1-exec=
l-debian-x86_64-2015-02-07.cgz-x86_64-rhel-6ffc77f48b85ed9ab9a7b2754a7b4989=
1ebaff83-20160201-118510-14qlhxm-1.yaml"
> max_uptime: 836.86
> initrd: "/osimage/debian/debian-x86_64-2015-02-07.cgz"
> bootloader_append:
> - root=3D/dev/ram0
> - user=3Dlkp
> - job=3D/lkp/scheduled/lkp-ivb-d02/bisect_unixbench-performance-1-execl-d=
ebian-x86_64-2015-02-07.cgz-x86_64-rhel-6ffc77f48b85ed9ab9a7b2754a7b49891eb=
aff83-20160201-118510-14qlhxm-1.yaml
> - ARCH=3Dx86_64
> - kconfig=3Dx86_64-rhel
> - branch=3Dlinux-devel/devel-hourly-2016013119
> - commit=3D6ffc77f48b85ed9ab9a7b2754a7b49891ebaff83
> - BOOT_IMAGE=3D/pkg/linux/x86_64-rhel/gcc-4.9/6ffc77f48b85ed9ab9a7b2754a7=
b49891ebaff83/vmlinuz-4.5.0-rc1-00001-g6ffc77f
> - max_uptime=3D836
> - RESULT_ROOT=3D/result/unixbench/performance-1-execl/lkp-ivb-d02/debian-=
x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/6ffc77f48b85ed9ab9a7b2754a7b49891=
ebaff83/1
> - LKP_SERVER=3Dinn
> - |2-
> =

> =

>   earlyprintk=3DttyS0,115200 systemd.log_level=3Derr
>   debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=
=3D100
>   panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_=
ramdisk=3D2 prompt_ramdisk=3D0
>   console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal
> =

>   rw
> lkp_initrd: "/lkp/lkp/lkp-x86_64.cgz"
> modules_initrd: "/pkg/linux/x86_64-rhel/gcc-4.9/6ffc77f48b85ed9ab9a7b2754=
a7b49891ebaff83/modules.cgz"
> bm_initrd: "/osimage/deps/debian-x86_64-2015-02-07.cgz/lkp.cgz,/osimage/d=
eps/debian-x86_64-2015-02-07.cgz/run-ipconfig.cgz,/osimage/deps/debian-x86_=
64-2015-02-07.cgz/turbostat.cgz,/lkp/benchmarks/turbostat.cgz,/lkp/benchmar=
ks/unixbench.cgz"
> linux_headers_initrd: "/pkg/linux/x86_64-rhel/gcc-4.9/6ffc77f48b85ed9ab9a=
7b2754a7b49891ebaff83/linux-headers.cgz"
> repeat_to: 2
> kernel: "/pkg/linux/x86_64-rhel/gcc-4.9/6ffc77f48b85ed9ab9a7b2754a7b49891=
ebaff83/vmlinuz-4.5.0-rc1-00001-g6ffc77f"
> dequeue_time: 2016-02-01 04:49:05.273523858 +08:00
> job_state: finished
> loadavg: 0.75 0.27 0.10 1/120 2153
> start_time: '1454273365'
> end_time: '1454273464'
> version: "/lkp/lkp/.src-20160127-223853"



-- =

ak(a)linux.intel.com -- Speaking for myself only

--===============5755570249360601741==--

