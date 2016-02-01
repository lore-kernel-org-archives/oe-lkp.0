Content-Type: multipart/mixed; boundary="===============0089647634584927908=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [lib] 6ffc77f48b: 15.8% aim9.shell_rtns_2.ops_per_sec, +8.7% unixbench.score
Date: Mon, 01 Feb 2016 13:51:35 +0800
Message-ID: <877fipugew.fsf@yhuang-dev.intel.com>
In-Reply-To: <20160201054137.GB28154@tassilo.jf.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0089647634584927908==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Andi Kleen <ak@linux.intel.com> writes:

> On Mon, Feb 01, 2016 at 09:08:44AM +0800, kernel test robot wrote:
>> FYI, we noticed the below changes on
>> =

>> https://github.com/0day-ci/linux Andi-Kleen/Optimize-int_sqrt-for-small-=
values-for-faster-idle/20160129-054629
>> commit 6ffc77f48b85ed9ab9a7b2754a7b49891ebaff83 ("Optimize int_sqrt for =
small values for faster idle")
>> =

>> =

>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/testti=
me:
>>   gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/ivb43/she=
ll_rtns_2/aim9/300s
>> =

>> commit: =

>>   v4.5-rc1
>>   6ffc77f48b85ed9ab9a7b2754a7b49891ebaff83
>> =

>>         v4.5-rc1 6ffc77f48b85ed9ab9a7b2754a =

>> ---------------- -------------------------- =

>>          %stddev     %change         %stddev
>>              \          |                \  =

>>     383.55 .  1%     +15.8%     444.19 .  0%  aim9.shell_rtns_2.ops_per_=
sec
>
> That means it is faster, right? =


Yes.

> That's more than i expected.

Glad to know the data is useful :)

Best Regards,
Huang, Ying

> -Andi
>
>>     346042 .  1%     +15.7%     400253 .  0%  aim9.time.involuntary_cont=
ext_switches
>>   37653157 .  1%     +16.0%   43669205 .  0%  aim9.time.minor_page_faults
>>      50.58 .  1%     +13.5%      57.41 .  0%  aim9.time.user_time
>>     920242 .  1%     +15.6%    1063902 .  0%  aim9.time.voluntary_contex=
t_switches
>>     165192 .  0%      -9.3%     149802 .  0%  meminfo.Committed_AS
>>     858.50 .112%    +159.7%       2229 .  2%  numa-vmstat.node1.nr_inact=
ive_anon
>>       1903 . 34%     +49.7%       2850 .  1%  numa-vmstat.node1.nr_mapped
>>      15155 .  0%      +3.0%      15608 .  0%  vmstat.system.cs
>>       1900 .  3%      +8.5%       2061 .  1%  vmstat.system.in
>>       1481 .142%    +243.8%       5094 . 20%  numa-meminfo.node1.AnonHug=
ePages
>>       3435 .112%    +159.6%       8918 .  2%  numa-meminfo.node1.Inactiv=
e(anon)
>>       7619 . 34%     +49.7%      11403 .  1%  numa-meminfo.node1.Mapped
>>     346042 .  1%     +15.7%     400253 .  0%  time.involuntary_context_s=
witches
>>   37653157 .  1%     +16.0%   43669205 .  0%  time.minor_page_faults
>>      50.58 .  1%     +13.5%      57.41 .  0%  time.user_time
>>     920242 .  1%     +15.6%    1063902 .  0%  time.voluntary_context_swi=
tches
>>   32159302 .  2%     +16.1%   37352805 .  0%  proc-vmstat.numa_hit
>>   32153109 .  2%     +16.2%   37346613 .  0%  proc-vmstat.numa_local
>>       8294 .  4%     +10.3%       9146 .  3%  proc-vmstat.pgactivate
>>   31753265 .  2%     +16.7%   37041704 .  0%  proc-vmstat.pgalloc_normal
>>   38274072 .  1%     +15.7%   44274006 .  0%  proc-vmstat.pgfault
>>   33586569 .  2%     +16.4%   39090694 .  0%  proc-vmstat.pgfree
>>       2.15 .  2%     +31.0%       2.81 .  1%  turbostat.%Busy
>>      69.83 .  1%     +21.0%      84.50 .  1%  turbostat.Avg_MHz
>>      14.71 . 30%    +364.4%      68.29 .  2%  turbostat.CPU%c1
>>       0.13 .115%   +4530.3%       5.86 .  5%  turbostat.CPU%c3
>>      83.02 .  5%     -72.3%      23.04 .  6%  turbostat.CPU%c6
>>      67.08 .  1%     +15.6%      77.53 .  0%  turbostat.CorWatt
>>      13.68 . 13%     -96.9%       0.42 .102%  turbostat.Pkg%pc2
>>      97.47 .  0%     +10.7%     107.90 .  0%  turbostat.PkgWatt
>>  4.115e+08 . 95%   +1040.5%  4.693e+09 .  3%  cpuidle.C1-IVT.time
>>      35607 . 31%    +459.1%     199082 .  1%  cpuidle.C1-IVT.usage
>>     692205 . 47%  +1.4e+05%  9.935e+08 .  2%  cpuidle.C1E-IVT.time
>>       1987 . 17%   +9685.5%     194454 .  1%  cpuidle.C1E-IVT.usage
>>   17330705 .111%   +5212.9%  9.208e+08 .  4%  cpuidle.C3-IVT.time
>>       6416 . 72%   +4164.8%     273664 .  2%  cpuidle.C3-IVT.usage
>>   1.37e+10 .  3%     -45.7%  7.434e+09 .  2%  cpuidle.C6-IVT.time
>>    2046699 .  1%     -20.6%    1625729 .  2%  cpuidle.C6-IVT.usage
>>    9298422 . 67%    +725.2%   76732660 .  5%  cpuidle.POLL.time
>>      21792 . 13%     -19.9%      17456 .  6%  cpuidle.POLL.usage
>>       8535 .  2%      +8.7%       9274 .  2%  slabinfo.anon_vma.active_o=
bjs
>>       8535 .  2%      +8.7%       9274 .  2%  slabinfo.anon_vma.num_objs
>>      25398 .  3%     +22.3%      31057 .  1%  slabinfo.anon_vma_chain.ac=
tive_objs
>>      25427 .  3%     +22.5%      31141 .  1%  slabinfo.anon_vma_chain.nu=
m_objs
>>      14169 .  5%     -13.4%      12270 .  0%  slabinfo.kmalloc-256.activ=
e_objs
>>      14612 .  5%     -12.5%      12786 .  0%  slabinfo.kmalloc-256.num_o=
bjs
>>      39366 .  7%     +40.7%      55384 .  3%  slabinfo.kmalloc-32.active=
_objs
>>     307.00 .  7%     +41.3%     433.75 .  3%  slabinfo.kmalloc-32.active=
_slabs
>>      39366 .  7%     +41.2%      55578 .  3%  slabinfo.kmalloc-32.num_ob=
js
>>     307.00 .  7%     +41.3%     433.75 .  3%  slabinfo.kmalloc-32.num_sl=
abs
>>       1087 .  5%      -9.7%     982.50 .  1%  slabinfo.mm_struct.active_=
objs
>>       1087 .  5%      -9.7%     982.50 .  1%  slabinfo.mm_struct.num_objs
>>       2313 .  2%     +12.8%       2609 .  3%  slabinfo.signal_cache.acti=
ve_objs
>>       2313 .  2%     +12.8%       2609 .  3%  slabinfo.signal_cache.num_=
objs
>>      21538 .  1%     +17.1%      25215 .  1%  slabinfo.vm_area_struct.ac=
tive_objs
>>      21595 .  1%     +17.1%      25279 .  1%  slabinfo.vm_area_struct.nu=
m_objs
>>       2.49 . 16%     +38.3%       3.44 . 16%  perf-profile.cycles-pp.__l=
ibc_fork
>> 39.88 . 9% -26.1% 29.47 . 23%
> perf-profile.cycles-pp.call_cpuidle.cpu_startup_entry.start_secondary
>>      43.97 .  9%     -24.6%      33.16 . 21%  perf-profile.cycles-pp.cpu=
_startup_entry.start_secondary
>> 39.88 . 9% -26.1% 29.46 . 23%
> perf-profile.cycles-pp.cpuidle_enter.call_cpuidle.cpu_startup_entry.start=
_secondary
>> 39.49 . 9% -26.3% 29.10 . 23%
> perf-profile.cycles-pp.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu=
_startup_entry.start_secondary
>> 2.55 . 41% +81.3% 4.62 . 29%
> perf-profile.cycles-pp.do_execveat_common.isra.35.sys_execve.return_from_=
execve
>>       9.63 . 15%     +30.1%      12.53 . 15%  perf-profile.cycles-pp.do_=
page_fault.page_fault
>>       3.14 . 11%     +58.7%       4.99 . 20%  perf-profile.cycles-pp.exe=
cve
>> 0.75 . 10% +31.3% 0.98 . 11%
> perf-profile.cycles-pp.filename_lookup.user_path_at_empty.sys_access.entr=
y_SYSCALL_64_fastpath
>> 0.84 . 13% +38.1% 1.16 . 16%
> perf-profile.cycles-pp.free_pages_and_swap_cache.tlb_flush_mmu_free.tlb_f=
inish_mmu.exit_mmap.mmput
>> 8.60 . 23% +37.6% 11.84 . 11%
> perf-profile.cycles-pp.handle_mm_fault.__do_page_fault.do_page_fault.page=
_fault
>> 40.37 . 10% -26.5% 29.67 . 23%
> perf-profile.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.call_=
cpuidle.cpu_startup_entry
>> 0.75 . 16% +99.7% 1.51 . 27%
> perf-profile.cycles-pp.load_elf_binary.search_binary_handler.load_script.=
search_binary_handler.do_execveat_common
>> 0.84 . 15% +94.7% 1.63 . 27%
> perf-profile.cycles-pp.load_script.search_binary_handler.do_execveat_comm=
on.sys_execve.return_from_execve
>> 0.71 . 10% +30.9% 0.92 . 12%
> perf-profile.cycles-pp.path_lookupat.filename_lookup.user_path_at_empty.s=
ys_access.entry_SYSCALL_64_fastpath
>> 0.75 . 13% +39.9% 1.04 . 16%
> perf-profile.cycles-pp.release_pages.free_pages_and_swap_cache.tlb_flush_=
mmu_free.tlb_finish_mmu.exit_mmap
>>       2.15 . 11%     +51.3%       3.25 . 20%  perf-profile.cycles-pp.ret=
urn_from_execve.execve
>> 0.76 . 16% +98.2% 1.51 . 27%
> perf-profile.cycles-pp.search_binary_handler.load_script.search_binary_ha=
ndler.do_execveat_common.sys_execve
>>      44.09 .  9%     -24.5%      33.28 . 21%  perf-profile.cycles-pp.sta=
rt_secondary
>>       1.12 .  6%     +23.8%       1.39 .  8%  perf-profile.cycles-pp.sys=
_access.entry_SYSCALL_64_fastpath
>>       2.13 . 11%     +53.6%       3.28 . 19%  perf-profile.cycles-pp.sys=
_execve.return_from_execve.execve
>>       1.55 . 90%    +179.7%       4.33 . 13%  perf-profile.cycles-pp.sys=
_mmap.entry_SYSCALL_64_fastpath
>> 0.80 . 11% +31.0% 1.05 . 11%
> perf-profile.cycles-pp.user_path_at_empty.sys_access.entry_SYSCALL_64_fas=
tpath
>>       4128 .  9%     +17.8%       4862 .  4%  sched_debug.cfs_rq:/.exec_=
clock.11
>>       4062 .  8%     +18.4%       4809 .  4%  sched_debug.cfs_rq:/.exec_=
clock.12
>>       4064 . 13%     +34.4%       5461 . 27%  sched_debug.cfs_rq:/.exec_=
clock.15
>>       3879 . 14%     +41.0%       5469 . 22%  sched_debug.cfs_rq:/.exec_=
clock.18
>>       3831 . 12%     +44.1%       5522 . 26%  sched_debug.cfs_rq:/.exec_=
clock.19
>>       3881 . 14%     +18.1%       4582 .  3%  sched_debug.cfs_rq:/.exec_=
clock.20
>>       3658 . 14%     -30.8%       2529 . 18%  sched_debug.cfs_rq:/.exec_=
clock.25
>>       3756 . 17%     -31.4%       2575 .  6%  sched_debug.cfs_rq:/.exec_=
clock.26
>>       3722 . 15%     -32.2%       2524 . 10%  sched_debug.cfs_rq:/.exec_=
clock.27
>>       4727 . 20%     -31.5%       3240 . 23%  sched_debug.cfs_rq:/.exec_=
clock.28
>>       4448 . 13%     +20.7%       5369 .  9%  sched_debug.cfs_rq:/.exec_=
clock.3
>>       3768 . 18%     -32.1%       2559 .  5%  sched_debug.cfs_rq:/.exec_=
clock.30
>>       3743 . 16%     -38.2%       2312 .  3%  sched_debug.cfs_rq:/.exec_=
clock.31
>>       3675 . 15%     -31.9%       2501 . 14%  sched_debug.cfs_rq:/.exec_=
clock.32
>>       3657 . 14%     -33.4%       2434 .  7%  sched_debug.cfs_rq:/.exec_=
clock.33
>>       3653 . 15%     -27.1%       2663 . 12%  sched_debug.cfs_rq:/.exec_=
clock.34
>>       3102 . 19%     -27.2%       2257 .  2%  sched_debug.cfs_rq:/.exec_=
clock.37
>>       3262 . 18%     -30.5%       2269 .  2%  sched_debug.cfs_rq:/.exec_=
clock.39
>>       3315 . 16%     -25.5%       2469 .  8%  sched_debug.cfs_rq:/.exec_=
clock.40
>>       3250 . 18%     -29.6%       2287 .  6%  sched_debug.cfs_rq:/.exec_=
clock.43
>>       3210 . 13%     -28.2%       2304 .  5%  sched_debug.cfs_rq:/.exec_=
clock.44
>>       3140 . 16%     -25.7%       2332 . 11%  sched_debug.cfs_rq:/.exec_=
clock.46
>>       4772 .  9%     -24.0%       3625 .  7%  sched_debug.cfs_rq:/.exec_=
clock.47
>>       4293 .  9%     +23.1%       5283 .  3%  sched_debug.cfs_rq:/.exec_=
clock.5
>>       2601 . 10%     -22.9%       2007 .  6%  sched_debug.cfs_rq:/.exec_=
clock.min
>>       1245 . 11%     +37.0%       1706 .  3%  sched_debug.cfs_rq:/.exec_=
clock.stddev
>>       4.50 . 58%    +883.3%      44.25 .115%  sched_debug.cfs_rq:/.load_=
avg.15
>>       2.00 .141%   +2012.5%      42.25 . 91%  sched_debug.cfs_rq:/.load_=
avg.26
>>      92810 .  7%     +24.5%     115532 .  5%  sched_debug.cfs_rq:/.min_v=
runtime.0
>>      85375 . 10%     +16.7%      99616 .  8%  sched_debug.cfs_rq:/.min_v=
runtime.1
>>      84119 .  9%     +17.3%      98679 .  6%  sched_debug.cfs_rq:/.min_v=
runtime.11
>>      76159 . 14%     +26.3%      96158 .  4%  sched_debug.cfs_rq:/.min_v=
runtime.12
>>      73708 . 11%     +22.3%      90163 .  4%  sched_debug.cfs_rq:/.min_v=
runtime.13
>>      73462 . 12%     +22.8%      90186 .  4%  sched_debug.cfs_rq:/.min_v=
runtime.14
>>      78532 . 11%     +18.3%      92890 .  2%  sched_debug.cfs_rq:/.min_v=
runtime.15
>>      75619 . 15%     +23.4%      93308 .  5%  sched_debug.cfs_rq:/.min_v=
runtime.18
>>      73782 . 12%     +26.1%      93064 .  2%  sched_debug.cfs_rq:/.min_v=
runtime.19
>>      85825 . 12%     +16.9%     100371 .  6%  sched_debug.cfs_rq:/.min_v=
runtime.2
>>      73784 . 14%     +26.7%      93455 .  3%  sched_debug.cfs_rq:/.min_v=
runtime.20
>>      77996 . 11%     +25.4%      97835 .  8%  sched_debug.cfs_rq:/.min_v=
runtime.21
>>      75401 . 12%     +24.0%      93489 .  3%  sched_debug.cfs_rq:/.min_v=
runtime.22
>>      71851 . 10%     +25.9%      90432 .  8%  sched_debug.cfs_rq:/.min_v=
runtime.23
>>      85321 . 16%     -25.5%      63569 . 11%  sched_debug.cfs_rq:/.min_v=
runtime.24
>>      84385 . 16%     -37.7%      52578 . 19%  sched_debug.cfs_rq:/.min_v=
runtime.25
>>      86487 . 19%     -38.7%      52989 . 10%  sched_debug.cfs_rq:/.min_v=
runtime.26
>>      85768 . 18%     -40.0%      51463 . 14%  sched_debug.cfs_rq:/.min_v=
runtime.27
>>      86568 . 17%     -35.1%      56182 .  9%  sched_debug.cfs_rq:/.min_v=
runtime.29
>>      87224 . 19%     -38.6%      53580 . 10%  sched_debug.cfs_rq:/.min_v=
runtime.30
>>      86397 . 16%     -44.6%      47867 .  6%  sched_debug.cfs_rq:/.min_v=
runtime.31
>>      84687 . 17%     -39.7%      51047 . 15%  sched_debug.cfs_rq:/.min_v=
runtime.32
>>      84737 . 15%     -43.4%      47972 . 11%  sched_debug.cfs_rq:/.min_v=
runtime.33
>>      84538 . 17%     -37.4%      52927 . 17%  sched_debug.cfs_rq:/.min_v=
runtime.34
>>      82873 . 16%     -37.1%      52164 .  8%  sched_debug.cfs_rq:/.min_v=
runtime.35
>>      70798 . 20%     -27.7%      51222 .  1%  sched_debug.cfs_rq:/.min_v=
runtime.36
>>      71650 . 21%     -35.4%      46267 .  5%  sched_debug.cfs_rq:/.min_v=
runtime.37
>>      72302 . 21%     -36.2%      46131 . 10%  sched_debug.cfs_rq:/.min_v=
runtime.38
>>      73956 . 20%     -39.9%      44478 .  6%  sched_debug.cfs_rq:/.min_v=
runtime.39
>>      74719 . 18%     -35.9%      47906 .  4%  sched_debug.cfs_rq:/.min_v=
runtime.40
>>      73599 . 18%     -41.1%      43371 .  7%  sched_debug.cfs_rq:/.min_v=
runtime.41
>>      74129 . 19%     -35.8%      47573 .  8%  sched_debug.cfs_rq:/.min_v=
runtime.42
>>      74757 . 21%     -37.4%      46822 .  9%  sched_debug.cfs_rq:/.min_v=
runtime.43
>>      71249 . 18%     -38.7%      43668 .  3%  sched_debug.cfs_rq:/.min_v=
runtime.44
>>      70889 . 17%     -33.9%      46869 .  6%  sched_debug.cfs_rq:/.min_v=
runtime.46
>>      74088 . 17%     -38.5%      45599 . 12%  sched_debug.cfs_rq:/.min_v=
runtime.47
>>      80424 .  3%      -8.9%      73252 .  4%  sched_debug.cfs_rq:/.min_v=
runtime.avg
>>     105781 .  3%     +10.4%     116776 .  4%  sched_debug.cfs_rq:/.min_v=
runtime.max
>>      57525 . 10%     -32.3%      38928 .  4%  sched_debug.cfs_rq:/.min_v=
runtime.min
>>      14190 . 24%     +74.0%      24696 .  1%  sched_debug.cfs_rq:/.min_v=
runtime.stddev
>>      -7435 .-42%    +114.1%     -15916 .-24%  sched_debug.cfs_rq:/.sprea=
d0.1
>>      -6966 .-86%    +135.3%     -16394 .-33%  sched_debug.cfs_rq:/.sprea=
d0.10
>>      -7496 .-108%    +593.2%     -51965 . -6%  sched_debug.cfs_rq:/.spre=
ad0.24
>>      -8433 .-93%    +646.5%     -62957 . -7%  sched_debug.cfs_rq:/.sprea=
d0.25
>>      -6331 .-163%    +887.9%     -62545 . -7%  sched_debug.cfs_rq:/.spre=
ad0.26
>>      -7049 .-132%    +808.8%     -64072 .-10%  sched_debug.cfs_rq:/.spre=
ad0.27
>>      -4943 .-273%   +1076.4%     -58160 .-10%  sched_debug.cfs_rq:/.spre=
ad0.28
>>      -6250 .-142%    +849.5%     -59353 . -5%  sched_debug.cfs_rq:/.spre=
ad0.29
>>      -5595 .-201%   +1007.3%     -61955 . -6%  sched_debug.cfs_rq:/.spre=
ad0.30
>>      -6423 .-124%    +953.4%     -67668 . -7%  sched_debug.cfs_rq:/.spre=
ad0.31
>>      -8133 .-103%    +692.9%     -64488 . -7%  sched_debug.cfs_rq:/.spre=
ad0.32
>>      -8083 .-81%    +735.9%     -67563 . -5%  sched_debug.cfs_rq:/.sprea=
d0.33
>>      -8282 .-100%    +655.9%     -62608 . -9%  sched_debug.cfs_rq:/.spre=
ad0.34
>>      -9948 .-74%    +537.0%     -63371 . -7%  sched_debug.cfs_rq:/.sprea=
d0.35
>>     -22023 .-94%    +192.0%     -64313 .-10%  sched_debug.cfs_rq:/.sprea=
d0.36
>>     -21171 .-100%    +227.2%     -69269 . -6%  sched_debug.cfs_rq:/.spre=
ad0.37
>>     -20521 .-103%    +238.2%     -69404 . -7%  sched_debug.cfs_rq:/.spre=
ad0.38
>>     -18866 .-112%    +276.6%     -71058 . -6%  sched_debug.cfs_rq:/.spre=
ad0.39
>>     -18104 .-110%    +273.6%     -67630 .-11%  sched_debug.cfs_rq:/.spre=
ad0.40
>>     -19223 .-99%    +275.4%     -72165 . -9%  sched_debug.cfs_rq:/.sprea=
d0.41
>>     -18694 .-109%    +263.5%     -67963 .-11%  sched_debug.cfs_rq:/.spre=
ad0.42
>>     -18066 .-122%    +280.3%     -68713 . -4%  sched_debug.cfs_rq:/.spre=
ad0.43
>>     -21575 .-87%    +233.1%     -71868 . -7%  sched_debug.cfs_rq:/.sprea=
d0.44
>>     -22907 .-95%    +196.5%     -67923 . -6%  sched_debug.cfs_rq:/.sprea=
d0.45
>>     -21935 .-83%    +213.0%     -68667 . -9%  sched_debug.cfs_rq:/.sprea=
d0.46
>>     -18737 .-101%    +273.3%     -69937 . -8%  sched_debug.cfs_rq:/.spre=
ad0.47
>>      -3013 .-283%    +514.6%     -18522 .-37%  sched_debug.cfs_rq:/.spre=
ad0.6
>>      -5884 .-109%    +282.8%     -22524 .-27%  sched_debug.cfs_rq:/.spre=
ad0.7
>>      -7321 .-61%    +190.8%     -21286 .-17%  sched_debug.cfs_rq:/.sprea=
d0.8
>>      -8126 .-67%    +148.3%     -20175 .-28%  sched_debug.cfs_rq:/.sprea=
d0.9
>>     -12393 .-54%    +241.2%     -42282 .-11%  sched_debug.cfs_rq:/.sprea=
d0.avg
>>      12967 . 38%     -90.4%       1243 . 81%  sched_debug.cfs_rq:/.sprea=
d0.max
>>     -35294 .-29%    +117.1%     -76608 . -8%  sched_debug.cfs_rq:/.sprea=
d0.min
>>      14191 . 24%     +74.0%      24697 .  1%  sched_debug.cfs_rq:/.sprea=
d0.stddev
>>      28.17 . 19%    +133.4%      65.75 . 57%  sched_debug.cfs_rq:/.util_=
avg.2
>>      32.17 . 42%     -62.7%      12.00 .113%  sched_debug.cfs_rq:/.util_=
avg.40
>>      51.00 . 74%     -82.4%       9.00 . 47%  sched_debug.cfs_rq:/.util_=
avg.45
>>     980055 .  1%     -16.2%     821316 .  7%  sched_debug.cpu.avg_idle.2
>>     974897 .  2%     -10.6%     872035 .  6%  sched_debug.cpu.avg_idle.21
>>     970838 .  3%     -17.5%     800879 .  9%  sched_debug.cpu.avg_idle.24
>>     922584 .  5%     -13.3%     799667 .  6%  sched_debug.cpu.avg_idle.25
>>     939820 .  6%     -14.1%     807532 .  4%  sched_debug.cpu.avg_idle.26
>>     972194 .  3%     -15.5%     821130 .  8%  sched_debug.cpu.avg_idle.27
>>     943576 .  4%     -15.6%     795980 .  8%  sched_debug.cpu.avg_idle.28
>>     972757 .  4%     -11.8%     858039 .  7%  sched_debug.cpu.avg_idle.29
>>     935963 .  4%     -15.2%     793464 .  3%  sched_debug.cpu.avg_idle.31
>>     961054 .  4%     -20.4%     765294 .  7%  sched_debug.cpu.avg_idle.32
>>     953272 .  4%     -15.5%     805746 .  1%  sched_debug.cpu.avg_idle.33
>>     957697 .  3%     -19.9%     767409 .  9%  sched_debug.cpu.avg_idle.35
>>     976711 .  2%     -14.0%     840209 .  6%  sched_debug.cpu.avg_idle.39
>>     944871 .  3%     -13.8%     814393 .  4%  sched_debug.cpu.avg_idle.40
>>     944464 .  4%     -17.5%     779383 .  4%  sched_debug.cpu.avg_idle.42
>>     960406 .  4%     -16.8%     799490 . 11%  sched_debug.cpu.avg_idle.43
>>     915603 .  5%     -14.6%     781850 .  8%  sched_debug.cpu.avg_idle.44
>>     954052 .  4%     -13.2%     827775 .  5%  sched_debug.cpu.avg_idle.46
>>     950001 .  2%      -8.9%     865227 .  0%  sched_debug.cpu.avg_idle.a=
vg
>>     566441 . 14%     -31.7%     386678 . 12%  sched_debug.cpu.avg_idle.m=
in
>>      95996 . 24%     +77.9%     170770 .  2%  sched_debug.cpu.avg_idle.s=
tddev
>>      10.00 . 19%     +37.9%      13.79 . 22%  sched_debug.cpu.cpu_load[1=
].max
>>      33187 .  9%     -12.3%      29089 .  4%  sched_debug.cpu.nr_load_up=
dates.1
>>      33201 .  9%     -14.1%      28515 .  1%  sched_debug.cpu.nr_load_up=
dates.14
>>      32980 .  9%     -15.6%      27828 .  2%  sched_debug.cpu.nr_load_up=
dates.2
>>      18677 . 11%     -33.2%      12473 .  8%  sched_debug.cpu.nr_load_up=
dates.24
>>      18489 . 13%     -41.7%      10787 . 13%  sched_debug.cpu.nr_load_up=
dates.25
>>      18563 . 13%     -43.2%      10537 .  3%  sched_debug.cpu.nr_load_up=
dates.26
>>      19106 . 10%     -44.0%      10694 .  5%  sched_debug.cpu.nr_load_up=
dates.27
>>      18840 . 14%     -39.1%      11482 .  6%  sched_debug.cpu.nr_load_up=
dates.28
>>      19114 . 12%     -39.8%      11513 .  7%  sched_debug.cpu.nr_load_up=
dates.29
>>      33625 . 10%     -13.2%      29191 .  3%  sched_debug.cpu.nr_load_up=
dates.3
>>      19486 . 11%     -42.0%      11305 .  6%  sched_debug.cpu.nr_load_up=
dates.30
>>      19086 .  9%     -46.3%      10242 .  2%  sched_debug.cpu.nr_load_up=
dates.31
>>      18883 .  9%     -43.0%      10772 .  6%  sched_debug.cpu.nr_load_up=
dates.32
>>      18809 . 10%     -42.5%      10815 .  3%  sched_debug.cpu.nr_load_up=
dates.33
>>      18641 . 13%     -37.1%      11717 .  4%  sched_debug.cpu.nr_load_up=
dates.34
>>      18649 . 13%     -41.6%      10892 .  4%  sched_debug.cpu.nr_load_up=
dates.35
>>      17519 . 14%     -36.1%      11197 .  1%  sched_debug.cpu.nr_load_up=
dates.36
>>      17605 . 13%     -41.2%      10358 .  4%  sched_debug.cpu.nr_load_up=
dates.37
>>      17665 .  9%     -41.1%      10402 .  4%  sched_debug.cpu.nr_load_up=
dates.38
>>      18083 .  9%     -46.4%       9697 .  1%  sched_debug.cpu.nr_load_up=
dates.39
>>      33633 .  8%     -16.6%      28066 .  3%  sched_debug.cpu.nr_load_up=
dates.4
>>      18017 . 11%     -41.3%      10576 .  5%  sched_debug.cpu.nr_load_up=
dates.40
>>      17842 .  8%     -46.1%       9614 .  3%  sched_debug.cpu.nr_load_up=
dates.41
>>      17845 . 10%     -39.4%      10814 . 10%  sched_debug.cpu.nr_load_up=
dates.42
>>      17710 . 12%     -42.2%      10238 .  4%  sched_debug.cpu.nr_load_up=
dates.43
>>      17732 .  9%     -41.9%      10307 .  3%  sched_debug.cpu.nr_load_up=
dates.44
>>      17219 . 13%     -35.3%      11147 . 10%  sched_debug.cpu.nr_load_up=
dates.45
>>      17973 .  6%     -40.7%      10665 .  6%  sched_debug.cpu.nr_load_up=
dates.46
>>      17454 .  7%     -42.7%      10006 .  9%  sched_debug.cpu.nr_load_up=
dates.47
>>      33843 .  8%     -17.7%      27852 .  2%  sched_debug.cpu.nr_load_up=
dates.5
>>      33752 .  6%     -18.6%      27463 .  1%  sched_debug.cpu.nr_load_up=
dates.6
>>      33530 .  7%     -20.6%      26609 .  0%  sched_debug.cpu.nr_load_up=
dates.7
>>      33082 .  7%     -17.8%      27202 .  1%  sched_debug.cpu.nr_load_up=
dates.8
>>      25769 .  3%     -22.9%      19863 .  1%  sched_debug.cpu.nr_load_up=
dates.avg
>>      38510 .  3%     -15.1%      32687 .  2%  sched_debug.cpu.nr_load_up=
dates.max
>>      15222 . 10%     -41.0%       8984 .  2%  sched_debug.cpu.nr_load_up=
dates.min
>>       8024 .  3%     +15.1%       9238 .  0%  sched_debug.cpu.nr_load_up=
dates.stddev
>>      70059 . 11%     +18.0%      82660 .  1%  sched_debug.cpu.nr_switche=
s.0
>>      68459 . 13%     +20.8%      82677 .  6%  sched_debug.cpu.nr_switche=
s.19
>>      67062 .  8%     +30.8%      87722 . 12%  sched_debug.cpu.nr_switche=
s.21
>>      65279 . 12%     +35.1%      88170 . 15%  sched_debug.cpu.nr_switche=
s.22
>>      27625 .  9%     -20.7%      21898 .  4%  sched_debug.cpu.nr_switche=
s.26
>>      29791 .  9%     -24.7%      22431 .  6%  sched_debug.cpu.nr_switche=
s.27
>>      30900 .  5%     -21.5%      24260 . 13%  sched_debug.cpu.nr_switche=
s.30
>>      29669 .  7%     -22.8%      22918 . 15%  sched_debug.cpu.nr_switche=
s.31
>>      30269 .  6%     -24.3%      22926 .  4%  sched_debug.cpu.nr_switche=
s.32
>>      29870 .  9%     -23.0%      22992 .  3%  sched_debug.cpu.nr_switche=
s.33
>>      29304 . 16%     -20.1%      23410 .  7%  sched_debug.cpu.nr_switche=
s.35
>>      28165 .  6%     -20.9%      22271 .  6%  sched_debug.cpu.nr_switche=
s.38
>>      29903 .  3%     -26.0%      22122 . 22%  sched_debug.cpu.nr_switche=
s.39
>>      29541 .  6%     -30.0%      20684 . 13%  sched_debug.cpu.nr_switche=
s.41
>>      30230 .  7%     -22.8%      23349 . 14%  sched_debug.cpu.nr_switche=
s.42
>>      28699 .  7%     -22.5%      22246 .  4%  sched_debug.cpu.nr_switche=
s.44
>>      30831 . 13%     -25.7%      22905 .  9%  sched_debug.cpu.nr_switche=
s.46
>>      31671 . 18%     -30.8%      21925 . 11%  sched_debug.cpu.nr_switche=
s.47
>>      23090 .  3%     -23.9%      17565 .  2%  sched_debug.cpu.nr_switche=
s.min
>>      20540 .  5%     +29.4%      26576 .  1%  sched_debug.cpu.nr_switche=
s.stddev
>>     -10.50 .-41%     +71.4%     -18.00 .-18%  sched_debug.cpu.nr_uninter=
ruptible.0
>>      -1.17 .-378%    +714.3%      -9.50 .-42%  sched_debug.cpu.nr_uninte=
rruptible.19
>>      -0.67 .-320%   +1025.0%      -7.50 .-56%  sched_debug.cpu.nr_uninte=
rruptible.20
>>      -0.17 .-538%   +6950.0%     -11.75 .-76%  sched_debug.cpu.nr_uninte=
rruptible.21
>>       2.67 . 63%    +171.9%       7.25 . 39%  sched_debug.cpu.nr_uninter=
ruptible.25
>>       2.17 . 97%    +246.2%       7.50 . 29%  sched_debug.cpu.nr_uninter=
ruptible.27
>>       3.00 .101%    +183.3%       8.50 . 30%  sched_debug.cpu.nr_uninter=
ruptible.29
>>       2.33 .106%    +178.6%       6.50 . 17%  sched_debug.cpu.nr_uninter=
ruptible.30
>>       1.67 .206%    +320.0%       7.00 . 31%  sched_debug.cpu.nr_uninter=
ruptible.33
>>       2.50 .125%    +250.0%       8.75 . 30%  sched_debug.cpu.nr_uninter=
ruptible.34
>>       2.83 . 74%    +226.5%       9.25 . 27%  sched_debug.cpu.nr_uninter=
ruptible.36
>>       2.83 . 51%    +173.5%       7.75 . 10%  sched_debug.cpu.nr_uninter=
ruptible.37
>>       1.83 .115%    +377.3%       8.75 . 16%  sched_debug.cpu.nr_uninter=
ruptible.38
>>       3.00 . 47%    +150.0%       7.50 . 35%  sched_debug.cpu.nr_uninter=
ruptible.39
>>       2.17 . 62%    +350.0%       9.75 . 15%  sched_debug.cpu.nr_uninter=
ruptible.40
>>       2.67 . 59%    +200.0%       8.00 . 17%  sched_debug.cpu.nr_uninter=
ruptible.42
>>      -1.20 .-275%    +483.3%      -7.00 .-26%  sched_debug.cpu.nr_uninte=
rruptible.8
>>       8.14 . 16%     +80.2%      14.67 .  5%  sched_debug.cpu.nr_uninter=
ruptible.max
>>     -16.11 .-20%     +56.5%     -25.21 .-15%  sched_debug.cpu.nr_uninter=
ruptible.min
>>       5.17 . 18%     +89.8%       9.81 .  5%  sched_debug.cpu.nr_uninter=
ruptible.stddev
>>      67076 .  8%     +36.6%      91617 . 12%  sched_debug.cpu.sched_coun=
t.21
>>      28419 .  8%     -22.9%      21908 .  4%  sched_debug.cpu.sched_coun=
t.26
>>      29800 .  9%     -24.7%      22440 .  6%  sched_debug.cpu.sched_coun=
t.27
>>      30909 .  5%     -18.6%      25155 . 11%  sched_debug.cpu.sched_coun=
t.30
>>      30323 .  8%     -24.4%      22929 . 15%  sched_debug.cpu.sched_coun=
t.31
>>      30278 .  6%     -24.3%      22935 .  4%  sched_debug.cpu.sched_coun=
t.32
>>      29879 .  9%     -19.5%      24052 . 10%  sched_debug.cpu.sched_coun=
t.33
>>      29314 . 16%     -20.1%      23419 .  7%  sched_debug.cpu.sched_coun=
t.35
>>      28174 .  6%     -20.9%      22281 .  6%  sched_debug.cpu.sched_coun=
t.38
>>      29913 .  3%     -26.0%      22134 . 22%  sched_debug.cpu.sched_coun=
t.39
>>      29551 .  6%     -30.0%      20693 . 13%  sched_debug.cpu.sched_coun=
t.41
>>      30241 .  7%     -22.8%      23358 . 14%  sched_debug.cpu.sched_coun=
t.42
>>      28709 .  7%     -22.5%      22255 .  4%  sched_debug.cpu.sched_coun=
t.44
>>      30840 . 13%     -25.7%      22913 .  9%  sched_debug.cpu.sched_coun=
t.46
>>      31684 . 18%     -30.8%      21934 . 11%  sched_debug.cpu.sched_coun=
t.47
>>      23099 .  3%     -23.9%      17574 .  2%  sched_debug.cpu.sched_coun=
t.min
>>      31945 . 13%     +18.5%      37850 .  6%  sched_debug.cpu.sched_goid=
le.19
>>      30731 .  8%     +29.2%      39695 . 11%  sched_debug.cpu.sched_goid=
le.21
>>      29857 . 13%     +38.4%      41325 . 16%  sched_debug.cpu.sched_goid=
le.22
>>      12490 . 11%     -23.1%       9605 .  3%  sched_debug.cpu.sched_goid=
le.26
>>      13340 . 11%     -26.5%       9799 .  5%  sched_debug.cpu.sched_goid=
le.27
>>      13706 .  8%     -24.1%      10396 . 10%  sched_debug.cpu.sched_goid=
le.30
>>      13151 .  9%     -22.9%      10139 . 16%  sched_debug.cpu.sched_goid=
le.31
>>      13358 .  8%     -25.4%       9966 .  4%  sched_debug.cpu.sched_goid=
le.32
>>      13123 . 10%     -25.2%       9820 .  4%  sched_debug.cpu.sched_goid=
le.33
>>      13108 . 13%     -22.4%      10174 .  7%  sched_debug.cpu.sched_goid=
le.35
>>      12183 .  6%     -22.4%       9458 .  6%  sched_debug.cpu.sched_goid=
le.38
>>      12693 .  6%     -28.7%       9047 . 13%  sched_debug.cpu.sched_goid=
le.41
>>      12945 .  8%     -23.3%       9934 . 13%  sched_debug.cpu.sched_goid=
le.42
>>      12450 .  7%     -23.7%       9505 .  3%  sched_debug.cpu.sched_goid=
le.44
>>      13236 . 12%     -26.5%       9728 .  9%  sched_debug.cpu.sched_goid=
le.46
>>      14021 . 23%     -33.7%       9299 . 11%  sched_debug.cpu.sched_goid=
le.47
>>      10147 .  5%     -24.8%       7633 .  1%  sched_debug.cpu.sched_goid=
le.min
>>      10080 .  5%     +25.3%      12626 .  1%  sched_debug.cpu.sched_goid=
le.stddev
>>      24925 . 16%     +35.6%      33805 . 12%  sched_debug.cpu.ttwu_count=
.19
>>       9941 . 27%     -33.3%       6634 . 15%  sched_debug.cpu.ttwu_count=
.25
>>       9312 . 12%     -30.2%       6496 .  6%  sched_debug.cpu.ttwu_count=
.27
>>      10973 . 21%     -34.3%       7215 .  8%  sched_debug.cpu.ttwu_count=
.29
>>       8854 .  9%     -24.9%       6652 .  2%  sched_debug.cpu.ttwu_count=
.31
>>       9747 . 16%     -29.1%       6909 .  5%  sched_debug.cpu.ttwu_count=
.32
>>      11309 . 18%     -33.0%       7579 . 19%  sched_debug.cpu.ttwu_count=
.40
>>       9685 . 14%     -30.4%       6741 .  7%  sched_debug.cpu.ttwu_count=
.43
>>      17375 . 62%     -58.6%       7191 . 16%  sched_debug.cpu.ttwu_count=
.47
>>       7059 .  5%     -23.9%       5373 .  3%  sched_debug.cpu.ttwu_count=
.min
>>       7971 . 16%     +34.5%      10722 .  4%  sched_debug.cpu.ttwu_local=
.0
>>       5557 . 10%     +23.1%       6839 .  6%  sched_debug.cpu.ttwu_local=
.1
>>       6025 . 23%     +32.2%       7968 .  7%  sched_debug.cpu.ttwu_local=
.12
>>       5675 . 17%     +24.5%       7066 .  8%  sched_debug.cpu.ttwu_local=
.13
>>       6633 . 17%     +27.9%       8486 .  3%  sched_debug.cpu.ttwu_local=
.19
>>       6719 . 16%     +42.7%       9586 . 15%  sched_debug.cpu.ttwu_local=
.21
>>       5919 . 14%     +21.1%       7165 . 13%  sched_debug.cpu.ttwu_local=
.3
>>       4183 . 19%     -38.3%       2582 .  7%  sched_debug.cpu.ttwu_local=
.39
>>       5434 . 11%     +30.9%       7115 . 10%  sched_debug.cpu.ttwu_local=
.4
>>       4196 . 25%     -37.6%       2616 . 12%  sched_debug.cpu.ttwu_local=
.41
>>       5914 . 13%     +16.0%       6863 .  3%  sched_debug.cpu.ttwu_local=
.6
>>       6296 . 18%     +24.6%       7842 .  9%  sched_debug.cpu.ttwu_local=
.9
>>       1882 .  7%     +27.0%       2390 .  1%  sched_debug.cpu.ttwu_local=
.stddev
>> =

>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
> compiler/disk/filesize/fs/iterations/kconfig/nr_directories/nr_files_per_=
directory/nr_threads/rootfs/sync_method/tbox_group/test_size/testcase:
>>   gcc-4.9/1HDD/8K/f2fs/1x/x86_64-rhel/16d/256fpd/32t/debian-x86_64-2015-=
02-07.cgz/fsyncBeforeClose/nhm4/400M/fsmark
>> =

>> commit: =

>>   v4.5-rc1
>>   6ffc77f48b85ed9ab9a7b2754a7b49891ebaff83
>> =

>>         v4.5-rc1 6ffc77f48b85ed9ab9a7b2754a =

>> ---------------- -------------------------- =

>>          %stddev     %change         %stddev
>>              \          |                \  =

>>    4680516 .  8%     +14.5%    5359884 .  4%  fsmark.app_overhead
>>     525.77 .  0%      +4.6%     550.12 .  0%  fsmark.files_per_sec
>>      19446 .  1%      -9.8%      17546 .  0%  fsmark.time.involuntary_co=
ntext_switches
>>      14.00 .  0%     -17.9%      11.50 .  4%  fsmark.time.percent_of_cpu=
_this_job_got
>>     463972 .  0%      -6.8%     432399 .  0%  fsmark.time.voluntary_cont=
ext_switches
>> 251.60 .200% +2104.3% 5546 .100%
> latency_stats.sum.wait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2f=
s_wait_on_page_writeback.[f2fs].__f2fs_add_link.[f2fs].f2fs_mkdir.[f2fs].vf=
s_mkdir.SyS_mkdir.entry_SYSCALL_64_fastpath
>>      18701 .  0%     -11.2%      16611 .  1%  proc-vmstat.pgactivate
>>      25317 .  0%     +11.2%      28145 .  0%  softirqs.BLOCK
>>     267.69 .  2%     -12.5%     234.29 .  1%  uptime.idle
>>       6510 .  0%      +4.0%       6770 .  0%  vmstat.io.bo
>>      19446 .  1%      -9.8%      17546 .  0%  time.involuntary_context_s=
witches
>>      14.00 .  0%     -17.9%      11.50 .  4%  time.percent_of_cpu_this_j=
ob_got
>>      13.89 .  0%     -22.9%      10.71 .  0%  time.system_time
>>       0.59 .  6%     -18.3%       0.48 .  3%  time.user_time
>>      24.32 .  0%     +17.5%      28.57 .  0%  turbostat.%Busy
>>     792.00 .  1%     +19.5%     946.75 .  0%  turbostat.Avg_MHz
>>      22.05 .  0%    +142.3%      53.42 .  0%  turbostat.CPU%c1
>>      44.77 .  0%     -70.4%      13.25 .  2%  turbostat.CPU%c3
>>       8.87 .  5%     -46.4%       4.76 .  1%  turbostat.CPU%c6
>>   18381428 .  3%    +761.8%  1.584e+08 .  0%  cpuidle.C1-NHM.time
>>      32978 .  1%    +191.0%      95971 .  0%  cpuidle.C1-NHM.usage
>>   24159280 .  1%    +268.7%   89074691 .  1%  cpuidle.C1E-NHM.time
>>      39453 .  0%     +31.4%      51846 .  1%  cpuidle.C1E-NHM.usage
>>   3.87e+08 .  0%     -48.4%  1.998e+08 .  0%  cpuidle.C3-NHM.time
>>     209952 .  0%     -41.9%     122009 .  0%  cpuidle.C3-NHM.usage
>>  1.726e+08 .  2%     -45.9%   93298544 .  2%  cpuidle.C6-NHM.time
>>      84430 .  1%     -50.4%      41860 .  1%  cpuidle.C6-NHM.usage
>>  1.748e+08 .  0%     +15.4%  2.018e+08 .  0%  cpuidle.POLL.time
>>     120026 .  0%     +32.3%     158824 .  0%  cpuidle.POLL.usage
>>       1432 . 52%     -34.0%     945.59 .  7%  sched_debug.cfs_rq:/.exec_=
clock.1
>>       1099 .  7%     -17.3%     909.21 .  7%  sched_debug.cfs_rq:/.exec_=
clock.2
>>       1102 .  4%     -19.5%     887.21 .  4%  sched_debug.cfs_rq:/.exec_=
clock.3
>>       2120 . 44%     -70.8%     618.32 .  6%  sched_debug.cfs_rq:/.exec_=
clock.4
>>     741.50 .  6%     -19.6%     595.94 .  9%  sched_debug.cfs_rq:/.exec_=
clock.5
>>     848.32 . 12%     -17.9%     696.64 . 14%  sched_debug.cfs_rq:/.exec_=
clock.7
>>       1242 .  0%     -12.2%       1091 .  0%  sched_debug.cfs_rq:/.exec_=
clock.avg
>>     706.35 .  2%     -19.0%     572.30 .  5%  sched_debug.cfs_rq:/.exec_=
clock.min
>>     696.95 . 12%     +26.4%     881.26 .  3%  sched_debug.cfs_rq:/.exec_=
clock.stddev
>>      80.73 . 17%     +31.5%     106.16 . 16%  sched_debug.cfs_rq:/.load_=
avg.avg
>>       3549 . 15%     +37.7%       4888 .  7%  sched_debug.cfs_rq:/.min_v=
runtime.0
>>       3473 . 25%     -52.9%       1636 . 15%  sched_debug.cfs_rq:/.min_v=
runtime.4
>>       2195 . 19%     -24.9%       1649 . 14%  sched_debug.cfs_rq:/.min_v=
runtime.5
>>       2198 . 16%     -22.2%       1711 . 15%  sched_debug.cfs_rq:/.min_v=
runtime.7
>>       2703 .  0%     -10.5%       2419 .  0%  sched_debug.cfs_rq:/.min_v=
runtime.avg
>>       4291 .  8%     +13.9%       4888 .  7%  sched_debug.cfs_rq:/.min_v=
runtime.max
>>       1806 .  5%     -21.1%       1424 .  5%  sched_debug.cfs_rq:/.min_v=
runtime.min
>>     788.12 . 11%     +30.8%       1030 . 14%  sched_debug.cfs_rq:/.min_v=
runtime.stddev
>>    -577.72 .-184%    +349.5%      -2596 .-25%  sched_debug.cfs_rq:/.spre=
ad0.1
>>    -798.00 .-80%    +189.1%      -2306 .-17%  sched_debug.cfs_rq:/.sprea=
d0.2
>>      -1088 .-70%    +121.2%      -2408 .-15%  sched_debug.cfs_rq:/.sprea=
d0.3
>>     -77.23 .-1651%   +4110.9%      -3251 .-17%  sched_debug.cfs_rq:/.spr=
ead0.4
>>      -1355 .-11%    +139.0%      -3239 .-16%  sched_debug.cfs_rq:/.sprea=
d0.5
>>    -846.87 .-66%    +191.5%      -2469 .-15%  sched_debug.cfs_rq:/.sprea=
d0.avg
>>      -1744 .-34%     +98.5%      -3463 .-13%  sched_debug.cfs_rq:/.sprea=
d0.min
>>     788.41 . 11%     +30.8%       1031 . 14%  sched_debug.cfs_rq:/.sprea=
d0.stddev
>>     166.83 . 33%     +86.1%     310.50 . 55%  sched_debug.cfs_rq:/.util_=
avg.5
>>     633424 . 20%     +36.3%     863396 . 13%  sched_debug.cpu.avg_idle.7
>>     359464 . 23%     +34.2%     482294 . 17%  sched_debug.cpu.avg_idle.m=
in
>>       0.75 .110%    +300.0%       3.00 . 81%  sched_debug.cpu.cpu_load[1=
].3
>>       0.50 .100%    +450.0%       2.75 . 69%  sched_debug.cpu.cpu_load[2=
].3
>>       0.50 .173%    +500.0%       3.00 . 52%  sched_debug.cpu.cpu_load[3=
].3
>>       0.25 .173%   +1300.0%       3.50 . 58%  sched_debug.cpu.cpu_load[4=
].3
>>       6351 . 12%     -30.0%       4445 .  2%  sched_debug.cpu.nr_load_up=
dates.4
>>      37017 .  6%     +11.2%      41155 .  7%  sched_debug.cpu.nr_switche=
s.7
>>      13595 .  8%     +14.2%      15525 .  7%  sched_debug.cpu.nr_switche=
s.stddev
>>      -2130 . -4%     -17.3%      -1761 . -4%  sched_debug.cpu.nr_uninter=
ruptible.0
>>    -337.83 .-28%     -42.9%    -192.75 .-15%  sched_debug.cpu.nr_uninter=
ruptible.2
>>     784.00 .  9%     -30.2%     547.25 . 19%  sched_debug.cpu.nr_uninter=
ruptible.5
>>     926.00 .  7%     -25.6%     688.50 .  2%  sched_debug.cpu.nr_uninter=
ruptible.max
>>      -2129 . -4%     -17.3%      -1760 . -4%  sched_debug.cpu.nr_uninter=
ruptible.min
>>     959.80 .  5%     -20.8%     759.81 .  2%  sched_debug.cpu.nr_uninter=
ruptible.stddev
>>      37044 .  6%     +11.2%      41177 .  7%  sched_debug.cpu.sched_coun=
t.7
>>      14921 .  8%     +16.0%      17307 .  9%  sched_debug.cpu.sched_goid=
le.7
>>      21799 .  4%     +10.5%      24078 .  1%  sched_debug.cpu.ttwu_count=
.stddev
>>      22901 .  2%     +12.5%      25754 .  4%  sched_debug.cpu.ttwu_local=
.0
>>       4759 . 11%     -27.2%       3465 .  3%  sched_debug.cpu.ttwu_local=
.4
>>      22984 .  1%     +12.4%      25827 .  4%  sched_debug.cpu.ttwu_local=
.max
>>       6202 .  1%     +16.4%       7217 .  5%  sched_debug.cpu.ttwu_local=
.stddev
>> =

>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/testcas=
e:
>>   gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/lkp-ivb=
-d02/execl/unixbench
>> =

>> commit: =

>>   v4.5-rc1
>>   6ffc77f48b85ed9ab9a7b2754a7b49891ebaff83
>> =

>>         v4.5-rc1 6ffc77f48b85ed9ab9a7b2754a =

>> ---------------- -------------------------- =

>>          %stddev     %change         %stddev
>>              \          |                \  =

>>       1260 .  0%      +8.7%       1369 .  0%  unixbench.score
>>     484658 .  0%      +8.7%     526705 .  0%  unixbench.time.involuntary=
_context_switches
>>   22562139 .  0%      +8.7%   24527176 .  0%  unixbench.time.minor_page_=
faults
>>     515.20 .  3%     +84.1%     948.25 .  2%  time.voluntary_context_swi=
tches
>>      17071 .  0%      +7.9%      18427 .  0%  vmstat.system.cs
>>       2842 .  2%    +110.9%       5993 .  0%  vmstat.system.in
>>   40099209 .  5%    +367.2%  1.873e+08 .  4%  cpuidle.C1E-IVB.time
>>     314651 .  5%    +221.5%    1011451 .  0%  cpuidle.C1E-IVB.usage
>>   48936191 .  9%     -66.3%   16512783 . 27%  cpuidle.C3-IVB.time
>>     141452 .  9%     -79.3%      29263 . 29%  cpuidle.C3-IVB.usage
>>  2.177e+08 .  3%     -55.1%   97821419 .  4%  cpuidle.C6-IVB.time
>>     292192 .  3%     -82.4%      51299 . 15%  cpuidle.C6-IVB.usage
>>     142094 .  2%     +14.3%     162480 .  1%  sched_debug.cpu.nr_switche=
s.0
>>     150091 .  2%     +13.5%     170367 .  1%  sched_debug.cpu.sched_coun=
t.0
>>     153262 .  3%     +11.2%     170368 .  1%  sched_debug.cpu.sched_coun=
t.max
>>      51184 .  4%     +16.6%      59659 .  2%  sched_debug.cpu.sched_goid=
le.0
>>      41761 .  5%      +8.2%      45170 .  3%  sched_debug.cpu.sched_goid=
le.min
>>      40770 .  4%     +14.0%      46477 .  6%  sched_debug.cpu.ttwu_count=
.min
>>      43310 .  3%     +12.5%      48739 .  0%  sched_debug.cpu.ttwu_local=
.0
>>      35767 .  1%     +11.3%      39826 .  2%  sched_debug.cpu.ttwu_local=
.3
>>      22.72 .  0%      +5.6%      23.99 .  0%  turbostat.%Busy
>>     747.40 .  0%      +5.7%     789.75 .  0%  turbostat.Avg_MHz
>>      41.33 .  2%     +60.1%      66.16 .  0%  turbostat.CPU%c1
>>      25.99 .  3%     -96.0%       1.03 . 26%  turbostat.CPU%c3
>>       9.96 .  1%     -11.4%       8.83 .  2%  turbostat.CPU%c6
>>      10.22 .  0%      +7.2%      10.96 .  0%  turbostat.CorWatt
>>       0.22 . 49%    +273.9%       0.83 . 50%  turbostat.Pkg%pc3
>>       8.98 .  2%     -16.2%       7.53 .  5%  turbostat.Pkg%pc6
>>      27.07 .  0%      +2.7%      27.81 .  0%  turbostat.PkgWatt
>> =

>> =

>> ivb43: Ivytown Ivy Bridge-EP
>> Memory: 64G
>> =

>> nhm4: Nehalem
>> Memory: 4G
>> =

>> lkp-ivb-d02: Ivy Bridge
>> Memory: 8G
>> =

>>                      fsmark.time.percent_of_cpu_this_job_got
>> =

>>   14 *+-*--*--*--*--*--*--*--*--*--*-----*-*-----*--*--*--*--*--*--*--*-=
-*--*
>>      |                                 ..      ..                       =
    |
>>   13 ++                               *       *                         =
    |
>>   12 ++                                          O  O        O  O       =
    |
>>      |                                                                  =
    |
>>   11 ++                   O  O  O  O  O  O O  O        O  O        O  O =
    |
>>      |                                                                  =
    |
>>   10 ++                                                                 =
    |
>>      |                                                                  =
    |
>>    9 ++                                                                 =
    |
>>    8 ++                                                                 =
    |
>>      |                                                                  =
    |
>>    7 ++       O     O                                                   =
    |
>>      |                                                                  =
    |
>>    6 O+-O--O-----O-----O------------------------------------------------=
----+
>> =

>> =

>>                                   cpuidle.C1-NHM.time
>> =

>>   2.5e+08 ++-O--O----O-----O--------------------------------------------=
----+
>>           O       O     O                                               =
    |
>>           |                                                             =
    |
>>     2e+08 ++                                                            =
    |
>>           |                                                             =
    |
>>           |                  O  O  O  O O  O  O  O O  O  O  O O  O  O  O=
    |
>>   1.5e+08 ++                                                            =
    |
>>           |                                                             =
    |
>>     1e+08 ++                                                            =
    |
>>           |                                                             =
    |
>>           |                                                             =
    |
>>     5e+07 ++                                                            =
    |
>>           |                                                             =
    |
>>           *..*..*.*..*..*..*.*..*..*..*.*..*..*..*.*..*..*..*.*..*..*..*=
.*..*
>>         0 ++------------------------------------------------------------=
----+
>> =

>> =

>>                                 cpuidle.C1-NHM.usage
>> =

>>   120000 O+-O-----------------------------------------------------------=
----+
>>          |     O O  O  O  O                                             =
    |
>>   110000 ++                                                             =
    |
>>   100000 ++                          O  O       O                       =
    |
>>          |                   O O  O        O O     O  O O  O  O  O  O O =
    |
>>    90000 ++                                                             =
    |
>>    80000 ++                                                             =
    |
>>          |                                                              =
    |
>>    70000 ++                                                             =
    |
>>    60000 ++                                                             =
    |
>>          |                                                              =
    |
>>    50000 ++                                                             =
    |
>>    40000 ++                             *..     *..                     =
    |
>>          |      .*..                  ..      ..          .*..          =
.*..|
>>    30000 *+-*--*----*--*--*--*-*--*--*-----*-*-----*--*-*-----*--*--*-*-=
----*
>> =

>> =

>>                                 cpuidle.C1E-NHM.time
>> =

>>   1e+08 ++--------------------------------------------------------------=
----+
>>         |                                                               =
    |
>>   9e+07 ++               O  O  O  O O  O  O     O  O O  O  O  O  O  O O =
    |
>>   8e+07 O+ O  O  O O  O                      O                          =
    |
>>         |                                                               =
    |
>>   7e+07 ++                                                              =
    |
>>         |                                                               =
    |
>>   6e+07 ++                                                              =
    |
>>         |                                                               =
    |
>>   5e+07 ++                                                              =
    |
>>   4e+07 ++                                                              =
    |
>>         |                                                               =
    |
>>   3e+07 ++                            .*..     .*..                     =
    |
>>         *..*..*..*.*..*..*..*..*..*.*.    *..*.    *.*..*..*..*..*..*.*.=
.*..*
>>   2e+07 ++--------------------------------------------------------------=
----+
>> =

>> =

>>                                   cpuidle.C3-NHM.time
>> =

>>   4.5e+08 ++------------------------------------------------------------=
----+
>>           |                                                             =
    |
>>     4e+08 ++           .*..*.*..*..*..*.*..*..*..*.                     =
    |
>>           *..*..*.*..*.                            *..*..*..*.*..*..*..*=
.*..*
>>           |                                                             =
    |
>>   3.5e+08 ++                                                            =
    |
>>           |                                                             =
    |
>>     3e+08 ++                                                            =
    |
>>           |                                                             =
    |
>>   2.5e+08 ++                                                            =
    |
>>           |                                                             =
    |
>>           |                           O    O                            =
    |
>>     2e+08 O+      O  O  O    O  O  O    O     O  O O  O  O  O O  O  O  O=
    |
>>           |  O  O          O                                            =
    |
>>   1.5e+08 ++------------------------------------------------------------=
----+
>> =

>> =

>>                                 cpuidle.C3-NHM.usage
>> =

>>   280000 ++-------------------------------------------------------------=
----+
>>          |                              *       *                       =
    |
>>   260000 ++                            : :     : :                      =
    |
>>   240000 ++                            :  :    :  :                     =
    |
>>          |                            :   :   :   :                     =
    |
>>   220000 *+.*.. .*..*..*..*..*.*..*..*     *.*     *..*.  .*..*..*..*.  =
.*..*
>>   200000 ++    *                                        *.            *.=
    |
>>          |                                                              =
    |
>>   180000 ++                                                             =
    |
>>   160000 ++                                                             =
    |
>>          |                           O                                  =
    |
>>   140000 O+                                                             =
    |
>>   120000 ++                  O O  O     O  O O  O  O  O O  O  O  O  O O =
    |
>>          |  O  O O  O  O  O                                             =
    |
>>   100000 ++-------------------------------------------------------------=
----+
>> =

>> =

>>                                   cpuidle.C6-NHM.time
>> =

>>     2e+08 ++------------------------------------------------------------=
----+
>>           |                                                             =
    |
>>   1.8e+08 ++   .*               *..                     .*..          .*=
    |
>>           *..*.  +     .*..*. ..     .*    *..*..  *..*.        .*..*.  =
+   |
>>           |       *..*.      *     *.  :  +       +         *.*.        =
 *..*
>>   1.6e+08 ++                           : +       *                      =
    |
>>           |                             *                               =
    |
>>   1.4e+08 ++                                                            =
    |
>>           |                                                             =
    |
>>   1.2e+08 ++                                                            =
    |
>>           |                                                             =
    |
>>           |                                   O                         =
    |
>>     1e+08 ++                 O  O  O       O     O    O  O       O  O   =
    |
>>           |  O    O  O  O             O O          O        O O        O=
    |
>>     8e+07 O+----O----------O--------------------------------------------=
----+
>> =

>> =

>>                                 cpuidle.C6-NHM.usage
>> =

>>   90000 ++---------------------*----------------------------------------=
----+
>>         *..*..*..    .*..*.. ..    .*..  .*..*..*..*.*..*..     .*..*.*.=
.   |
>>   80000 ++       *.*.       *     *    *.                  *..*.        =
 *..*
>>         |                                                               =
    |
>>         |                                                               =
    |
>>   70000 ++                                                              =
    |
>>         |                                                               =
    |
>>   60000 ++                                                              =
    |
>>         |                                                               =
    |
>>   50000 ++                                                              =
    |
>>         |                                                               =
    |
>>         |          O  O     O  O  O O     O  O  O  O O  O  O  O  O  O O =
    |
>>   40000 O+ O  O  O       O             O                                =
    |
>>         |                                                               =
    |
>>   30000 ++--------------------------------------------------------------=
----+
>> =

>> =

>> =

>>                            aim9.shell_rtns_2.ops_per_sec
>> =

>>   460 ++----------------------------------------------------------------=
----+
>>       |    O                                                            =
    |
>>   450 O+ O       O O          O       O  O  O       O O                 =
    |
>>   440 ++      O       O  O  O    O            O  O       O  O           =
    |
>>       |                             O                                   =
    |
>>   430 ++                                                                =
    |
>>   420 ++                                                                =
    |
>>       |                                                                 =
    |
>>   410 ++                                                                =
    |
>>   400 ++                                      *                         =
    |
>>       |       *..                            : :            *..         =
 *..|
>>   390 ++     +   *.                          :  :          +   *.       =
:   *
>>   380 *+.   +      *..     .*.*..*..*.*..*..*   :  .*.    +      *..    =
:   |
>>       |  *.*          *..*.                      *.   *..*          *..*=
    |
>>   370 ++----------------------------------------------------------------=
----+
>> =

>> =

>>                                aim9.time.user_time
>> =

>>   58 ++-------------------------------O---------------------------------=
----+
>>      |  O O        O O  O  O  O O  O     O O  O  O O  O  O  O           =
    |
>>   57 O+         O                                                       =
    |
>>   56 ++      O                                                          =
    |
>>      |                                                                  =
    |
>>   55 ++                                                                 =
    |
>>   54 ++                                                                 =
    |
>>      |                                                                  =
    |
>>   53 ++                                                                 =
    |
>>   52 ++                                       *                         =
    |
>>      |       *..                             + +            *.          =
 *..|
>>   51 ++     +   *..                         +   +          +  *..       =
:   *
>>   50 *+.*. +       *    *..*..*.*..*..  .*.*     *.*..*.. +      *..*.. =
:   |
>>      |    *         + ..              *.                 *             *=
    |
>>   49 ++--------------*--------------------------------------------------=
----+
>> =

>> =

>>                               aim9.time.minor_page_faults
>> =

>>   4.5e+07 ++------------------------------------------------------------=
----+
>>           O    O                                                        =
    |
>>   4.4e+07 ++ O    O O  O O  O O  O      O  O  O O  O O  O O  O          =
    |
>>   4.3e+07 ++                       O  O                                 =
    |
>>           |                                                             =
    |
>>   4.2e+07 ++                                                            =
    |
>>   4.1e+07 ++                                                            =
    |
>>           |                                                             =
    |
>>     4e+07 ++                                                            =
    |
>>   3.9e+07 ++                                    *                       =
    |
>>           |       *.                           : +           *.         =
 *..|
>>   3.8e+07 ++    ..  *..      .*..*.*..         :  +        ..  *..      =
+   *
>>   3.7e+07 *+.*.*       *.*..*         *.*..*..*    *.*..*.*       *.*..*=
    |
>>           |                                                             =
    |
>>   3.6e+07 ++------------------------------------------------------------=
----+
>> =

>> =

>>                          aim9.time.voluntary_context_switches
>> =

>>    1.1e+06 ++-----------------------------------------------------------=
----+
>>   1.08e+06 ++   O                                                       =
    |
>>            O  O      O            O      O  O O       O O               =
    |
>>   1.06e+06 ++      O    O O  O O    O            O O       O O          =
    |
>>   1.04e+06 ++                          O                                =
    |
>>            |                                                            =
    |
>>   1.02e+06 ++                                                           =
    |
>>      1e+06 ++                                                           =
    |
>>     980000 ++                                                           =
    |
>>            |                                                            =
    |
>>     960000 ++                                    *                      =
    |
>>     940000 ++      *.                           + :          *..        =
  *.|
>>            |      +  *..         .*.*..        +  :         :   *.      =
 +  *
>>     920000 *+.   +      *.    .*.      *.*..*.*    *..*.    :     *..   =
+   |
>>     900000 ++-*-*---------*--*--------------------------*--*---------*-*=
----+
>> =

>> =

>>                        aim9.time.involuntary_context_switches
>> =

>>   420000 ++-------------------------------------------------------------=
----+
>>          |                                                              =
    |
>>   410000 O+ O O    O            O       O                               =
    |
>>   400000 ++      O    O O  O  O    O       O O       O O                =
    |
>>          |                           O          O O       O  O          =
    |
>>   390000 ++                                                             =
    |
>>          |                                                              =
    |
>>   380000 ++                                                             =
    |
>>          |                                                              =
    |
>>   370000 ++                                                             =
    |
>>   360000 ++                                     *                       =
    |
>>          |       *.                            + :           *.         =
 *..|
>>   350000 ++     +  *..*.     .*.*..*.*..*..*. +  :          +  *..      =
:   *
>>          *..   +        *..*.                *    *..*.    +      *.    =
:   |
>>   340000 ++-*-*----------------------------------------*--*---------*--*=
----+
>> =

>> =

>>                                   unixbench.score
>> =

>>   1400 ++---------------------------------------------------------------=
----+
>>        |                         O O O O O                              =
    |
>>   1380 O+O O O   O O O   O O O O          O                             =
    |
>>   1360 ++      O                            O O O O O O O O             =
    |
>>        |               O                                                =
    |
>>   1340 ++                                                               =
    |
>>        |                                                                =
    |
>>   1320 ++                                                               =
    |
>>        |                                                                =
    |
>>   1300 ++                                                               =
    |
>>   1280 ++                                                               =
    |
>>        |                      .*.*. .*.                                 =
    |
>>   1260 *+*.*.*.*.*.*.*. .*.*.*     *   *.**.*.*.*.*.*. .*.*.*.*.*.*.*.*.=
*. .*
>>        |               *                              *                 =
  * |
>>   1240 ++---------------------------------------------------------------=
----+
>> =

>> =

>>                      unixbench.time.involuntary_context_switches
>> =

>>   540000 ++-------------------------------------------------------------=
----+
>>          |         O            O O O O   OO                            =
    |
>>   530000 ++O   O      O   O O           O                               =
    |
>>          O   O   O  O         O              O O O O O O O O            =
    |
>>          |              O                                               =
    |
>>   520000 ++                                                             =
    |
>>          |                                                              =
    |
>>   510000 ++                                                             =
    |
>>          |                                                              =
    |
>>   500000 ++                                                             =
    |
>>          |                                                              =
    |
>>          |                                                              =
    |
>>   490000 ++   .*.          .*. .*.*. .*.    .*.                 .*      =
    |
>>          *.*.*   *.**. .*.*   *     *   *.**   *.*.*. .*.*.*.*.*  *.*.*.=
 .*.*
>>   480000 ++-----------*------------------------------*------------------=
*---+
>> =

>> 	[*] bisect-good sample
>> 	[O] bisect-bad  sample
>> =

>> To reproduce:
>> =

>>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-=
tests.git
>>         cd lkp-tests
>>         bin/lkp install job.yaml  # job file is attached in this email
>>         bin/lkp run     job.yaml
>> =

>> =

>> Disclaimer:
>> Results have been estimated based on internal Intel analysis and are pro=
vided
>> for informational purposes only. Any difference in system hardware or so=
ftware
>> design or configuration may affect actual performance.
>> =

>> =

>> Thanks,
>> Ying Huang
>
>> ---
>> LKP_SERVER: inn
>> LKP_CGI_PORT: 80
>> LKP_CIFS_PORT: 139
>> testcase: unixbench
>> default-monitors:
>>   wait: activate-monitor
>>   kmsg: =

>>   uptime: =

>>   iostat: =

>>   vmstat: =

>>   numa-numastat: =

>>   numa-vmstat: =

>>   numa-meminfo: =

>>   proc-vmstat: =

>>   proc-stat:
>>     interval: 10
>>   meminfo: =

>>   slabinfo: =

>>   interrupts: =

>>   lock_stat: =

>>   latency_stats: =

>>   softirqs: =

>>   bdi_dev_mapping: =

>>   diskstats: =

>>   nfsstat: =

>>   cpuidle: =

>>   cpufreq-stats: =

>>   turbostat: =

>>   pmeter: =

>>   sched_debug:
>>     interval: 60
>> cpufreq_governor: performance
>> default-watchdogs:
>>   oom-killer: =

>>   watchdog: =

>> commit: 6ffc77f48b85ed9ab9a7b2754a7b49891ebaff83
>> model: Ivy Bridge
>> nr_cpu: 4
>> memory: 8G
>> nr_hdd_partitions: 1
>> hdd_partitions: "/dev/disk/by-id/ata-ST1000DM003-1CH162_Z1DBQSB0-part1"
>> swap_partitions: "/dev/disk/by-id/ata-ST1000DM003-1CH162_Z1DBQSB0-part3"
>> rootfs_partition: "/dev/disk/by-id/ata-ST1000DM003-1CH162_Z1DBQSB0-part4"
>> netconsole_port: 66723
>> category: benchmark
>> nr_task: 1
>> unixbench:
>>   test: execl
>> queue: bisect
>> testbox: lkp-ivb-d02
>> tbox_group: lkp-ivb-d02
>> kconfig: x86_64-rhel
>> enqueue_time: 2016-02-01 04:41:40.844697988 +08:00
>> id: ab239be39f92df1f1f155f9ff8ab50bd48a204bb
>> user: lkp
>> compiler: gcc-4.9
>> head_commit: a66aef2038ce0ce7386c40e2a010beb2cb7895d2
>> base_commit: 92e963f50fc74041b5e9e744c330dca48e04f08d
>> branch: linux-devel/devel-hourly-2016013119
>> rootfs: debian-x86_64-2015-02-07.cgz
>> result_root:
> "/result/unixbench/performance-1-execl/lkp-ivb-d02/debian-x86_64-2015-02-=
07.cgz/x86_64-rhel/gcc-4.9/6ffc77f48b85ed9ab9a7b2754a7b49891ebaff83/1"
>> job_file:
> "/lkp/scheduled/lkp-ivb-d02/bisect_unixbench-performance-1-execl-debian-x=
86_64-2015-02-07.cgz-x86_64-rhel-6ffc77f48b85ed9ab9a7b2754a7b49891ebaff83-2=
0160201-118510-14qlhxm-1.yaml"
>> max_uptime: 836.86
>> initrd: "/osimage/debian/debian-x86_64-2015-02-07.cgz"
>> bootloader_append:
>> - root=3D/dev/ram0
>> - user=3Dlkp
>> -
> job=3D/lkp/scheduled/lkp-ivb-d02/bisect_unixbench-performance-1-execl-deb=
ian-x86_64-2015-02-07.cgz-x86_64-rhel-6ffc77f48b85ed9ab9a7b2754a7b49891ebaf=
f83-20160201-118510-14qlhxm-1.yaml
>> - ARCH=3Dx86_64
>> - kconfig=3Dx86_64-rhel
>> - branch=3Dlinux-devel/devel-hourly-2016013119
>> - commit=3D6ffc77f48b85ed9ab9a7b2754a7b49891ebaff83
>> -
> BOOT_IMAGE=3D/pkg/linux/x86_64-rhel/gcc-4.9/6ffc77f48b85ed9ab9a7b2754a7b4=
9891ebaff83/vmlinuz-4.5.0-rc1-00001-g6ffc77f
>> - max_uptime=3D836
>> -
> RESULT_ROOT=3D/result/unixbench/performance-1-execl/lkp-ivb-d02/debian-x8=
6_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/6ffc77f48b85ed9ab9a7b2754a7b49891eb=
aff83/1
>> - LKP_SERVER=3Dinn
>> - |2-
>> =

>> =

>>   earlyprintk=3DttyS0,115200 systemd.log_level=3Derr
>>   debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=
=3D100
>>   panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load=
_ramdisk=3D2 prompt_ramdisk=3D0
>>   console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal
>> =

>>   rw
>> lkp_initrd: "/lkp/lkp/lkp-x86_64.cgz"
>> modules_initrd: "/pkg/linux/x86_64-rhel/gcc-4.9/6ffc77f48b85ed9ab9a7b275=
4a7b49891ebaff83/modules.cgz"
>> bm_initrd:
> "/osimage/deps/debian-x86_64-2015-02-07.cgz/lkp.cgz,/osimage/deps/debian-=
x86_64-2015-02-07.cgz/run-ipconfig.cgz,/osimage/deps/debian-x86_64-2015-02-=
07.cgz/turbostat.cgz,/lkp/benchmarks/turbostat.cgz,/lkp/benchmarks/unixbenc=
h.cgz"
>> linux_headers_initrd: "/pkg/linux/x86_64-rhel/gcc-4.9/6ffc77f48b85ed9ab9=
a7b2754a7b49891ebaff83/linux-headers.cgz"
>> repeat_to: 2
>> kernel: "/pkg/linux/x86_64-rhel/gcc-4.9/6ffc77f48b85ed9ab9a7b2754a7b4989=
1ebaff83/vmlinuz-4.5.0-rc1-00001-g6ffc77f"
>> dequeue_time: 2016-02-01 04:49:05.273523858 +08:00
>> job_state: finished
>> loadavg: 0.75 0.27 0.10 1/120 2153
>> start_time: '1454273365'
>> end_time: '1454273464'
>> version: "/lkp/lkp/.src-20160127-223853"

--===============0089647634584927908==--

