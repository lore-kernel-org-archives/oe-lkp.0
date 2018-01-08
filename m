Content-Type: multipart/mixed; boundary="===============2491861591023578191=="
MIME-Version: 1.0
From: Vincent Guittot <vincent.guittot@linaro.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/fair] a4c3c04974: unixbench.score -4.3% regression
Date: Mon, 08 Jan 2018 10:34:23 +0100
Message-ID: <CAKfTPtDN2e-Y6c3F3C5f1dtmra6YMv2MC3j8gcPoMsbRCrApcQ@mail.gmail.com>
In-Reply-To: <20171225060709.GF31543@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2491861591023578191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Xiaolong,

On 25 December 2017 at 07:07, kernel test robot <xiaolong.ye@intel.com> w=
rote:
>
> Greeting,
>
> FYI, we noticed a -4.3% regression of unixbench.score due to commit:
>
>
> commit: a4c3c04974d648ee6e1a09ef4131eb32a02ab494 ("sched/fair: Update and=
 fix the runnable propagation rule")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> in testcase: unixbench
> on test machine: 8 threads Ivy Bridge with 16G memory
> with following parameters:
>
>         runtime: 300s
>         nr_task: 100%
>         test: shell1
>         cpufreq_governor: performance
>
> test-description: UnixBench is the original BYTE UNIX benchmark suite aim=
s to test performance of Unix-like system.
> test-url: https://github.com/kdlucas/byte-unixbench
>

I don't have the machine described above so i have tried to reproduce
the problem on my 8 cores cortex A53 platform but I don't have
performance regression.
I have also tried with a VM on a Intel(R) Core(TM) i7-4810MQ and
haven't seen regression too.

Have you seen the regression on other platform ?

Regards,
Vincent

>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/=
testcase:
>   gcc-7/performance/x86_64-rhel-7.2/100%/debian-x86_64-2016-08-31.cgz/300=
s/lkp-ivb-d01/shell1/unixbench
>
> commit:
>   c6b9d9a330 ("sched/wait: Fix add_wait_queue() behavioral change")
>   a4c3c04974 ("sched/fair: Update and fix the runnable propagation rule")
>
> c6b9d9a330290144 a4c3c04974d648ee6e1a09ef41
> ---------------- --------------------------
>          %stddev     %change         %stddev
>              \          |                \
>      13264            -4.3%      12694        unixbench.score
>   10619292           -11.7%    9374917        unixbench.time.involuntary_=
context_switches
>  4.829e+08            -4.3%   4.62e+08        unixbench.time.minor_page_f=
aults
>       1126            -3.6%       1086        unixbench.time.system_time
>       2645            -3.0%       2566        unixbench.time.user_time
>   15855720            -6.2%   14878247        unixbench.time.voluntary_co=
ntext_switches
>       0.00 =C4=85 56%      -0.0        0.00 =C4=85 57%  mpstat.cpu.iowait%
>      79517            -5.7%      74990        vmstat.system.cs
>      16361            -3.3%      15822        vmstat.system.in
>  1.814e+08           -24.0%  1.379e+08        cpuidle.C1.time
>    3436399           -20.6%    2728227        cpuidle.C1.usage
>    7772815            -9.9%    7001076        cpuidle.C1E.usage
>  1.479e+08           +66.1%  2.456e+08        cpuidle.C3.time
>    1437889           +38.7%    1994073        cpuidle.C3.usage
>      18147           +13.9%      20676        cpuidle.POLL.usage
>    3436173           -20.6%    2727580        turbostat.C1
>       3.54            -0.8        2.73        turbostat.C1%
>    7772758            -9.9%    7001012        turbostat.C1E
>    1437858           +38.7%    1994034        turbostat.C3
>       2.88            +2.0        4.86        turbostat.C3%
>      18.50           +10.8%      20.50        turbostat.CPU%c1
>       0.54 =C4=85  2%    +179.6%       1.51        turbostat.CPU%c3
>   2.32e+12            -4.3%   2.22e+12        perf-stat.branch-instructio=
ns
>  6.126e+10            -4.9%  5.823e+10        perf-stat.branch-misses
>       8.64 =C4=85  4%      +0.6        9.25        perf-stat.cache-miss-r=
ate%
>  1.662e+11            -4.3%   1.59e+11        perf-stat.cache-references
>   51040611            -7.0%   47473754        perf-stat.context-switches
>  1.416e+13            -3.6%  1.365e+13        perf-stat.cpu-cycles
>    8396968            -3.9%    8065835        perf-stat.cpu-migrations
>  2.919e+12            -4.3%  2.793e+12        perf-stat.dTLB-loads
>   1.89e+12            -4.3%  1.809e+12        perf-stat.dTLB-stores
>      67.97            +1.1       69.03        perf-stat.iTLB-load-miss-ra=
te%
>  4.767e+09            -1.3%  4.704e+09        perf-stat.iTLB-load-misses
>  2.247e+09            -6.0%  2.111e+09        perf-stat.iTLB-loads
>   1.14e+13            -4.3%  1.091e+13        perf-stat.instructions
>       2391            -3.0%       2319        perf-stat.instructions-per-=
iTLB-miss
>  4.726e+08            -4.3%  4.523e+08        perf-stat.minor-faults
>  4.726e+08            -4.3%  4.523e+08        perf-stat.page-faults
>     585.14 =C4=85  4%     -55.0%     263.59 =C4=85 12%  sched_debug.cfs_r=
q:/.load_avg.avg
>       1470 =C4=85  4%     -42.2%     850.09 =C4=85 24%  sched_debug.cfs_r=
q:/.load_avg.max
>     154.17 =C4=85 22%     -49.2%      78.39 =C4=85  7%  sched_debug.cfs_r=
q:/.load_avg.min
>     438.33 =C4=85  6%     -41.9%     254.49 =C4=85 27%  sched_debug.cfs_r=
q:/.load_avg.stddev
>       2540 =C4=85 15%     +23.5%       3137 =C4=85 11%  sched_debug.cfs_r=
q:/.removed.runnable_sum.avg
>     181.83 =C4=85 11%     -56.3%      79.50 =C4=85 34%  sched_debug.cfs_r=
q:/.runnable_load_avg.avg
>      16.46 =C4=85 37%     -72.9%       4.45 =C4=85110%  sched_debug.cfs_r=
q:/.runnable_load_avg.min
>     294.77 =C4=85  5%     +11.2%     327.87 =C4=85  6%  sched_debug.cfs_r=
q:/.util_avg.stddev
>     220260 =C4=85  8%     +20.3%     264870 =C4=85  4%  sched_debug.cpu.a=
vg_idle.avg
>     502903 =C4=85  4%     +21.0%     608663        sched_debug.cpu.avg_id=
le.max
>     148667 =C4=85  6%     +29.5%     192468 =C4=85  2%  sched_debug.cpu.a=
vg_idle.stddev
>     180.64 =C4=85 10%     -53.4%      84.23 =C4=85 34%  sched_debug.cpu.c=
pu_load[0].avg
>      25.73 =C4=85 15%     -85.6%       3.70 =C4=85113%  sched_debug.cpu.c=
pu_load[0].min
>     176.98 =C4=85  6%     -52.5%      84.06 =C4=85 35%  sched_debug.cpu.c=
pu_load[1].avg
>      53.93 =C4=85 13%     -72.6%      14.75 =C4=85 15%  sched_debug.cpu.c=
pu_load[1].min
>     176.61 =C4=85  4%     -55.3%      78.92 =C4=85 31%  sched_debug.cpu.c=
pu_load[2].avg
>      73.78 =C4=85 11%     -73.4%      19.61 =C4=85  7%  sched_debug.cpu.c=
pu_load[2].min
>     177.42 =C4=85  3%     -58.8%      73.09 =C4=85 21%  sched_debug.cpu.c=
pu_load[3].avg
>      93.01 =C4=85  8%     -73.9%      24.25 =C4=85  6%  sched_debug.cpu.c=
pu_load[3].min
>     173.36 =C4=85  3%     -60.6%      68.26 =C4=85 13%  sched_debug.cpu.c=
pu_load[4].avg
>     274.36 =C4=85  5%     -48.6%     141.16 =C4=85 44%  sched_debug.cpu.c=
pu_load[4].max
>     107.87 =C4=85  6%     -73.0%      29.11 =C4=85  9%  sched_debug.cpu.c=
pu_load[4].min
>      11203 =C4=85  9%      +9.9%      12314 =C4=85  6%  sched_debug.cpu.c=
urr->pid.avg
>    1042556 =C4=85  3%      -6.9%     970165 =C4=85  2%  sched_debug.cpu.s=
ched_goidle.max
>     748905 =C4=85  5%     -13.4%     648459        sched_debug.cpu.sched_=
goidle.min
>      90872 =C4=85 11%     +17.4%     106717 =C4=85  5%  sched_debug.cpu.s=
ched_goidle.stddev
>     457847 =C4=85  4%     -15.0%     389113        sched_debug.cpu.ttwu_l=
ocal.min
>      18.60            -1.1       17.45        perf-profile.calltrace.cycl=
es-pp.secondary_startup_64
>      16.33 =C4=85  2%      -1.0       15.29        perf-profile.calltrace=
.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64
>      16.33 =C4=85  2%      -1.0       15.29        perf-profile.calltrace=
.cycles-pp.start_secondary.secondary_startup_64
>      16.32 =C4=85  2%      -1.0       15.29        perf-profile.calltrace=
.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
>      15.44 =C4=85  2%      -1.0       14.43        perf-profile.calltrace=
.cycles-pp.intel_idle.cpuidle_enter_state.do_idle.cpu_startup_entry.start_s=
econdary
>      15.69 =C4=85  2%      -1.0       14.71        perf-profile.calltrace=
.cycles-pp.cpuidle_enter_state.do_idle.cpu_startup_entry.start_secondary.se=
condary_startup_64
>       5.54            -0.1        5.45        perf-profile.calltrace.cycl=
es-pp.__libc_fork
>      10.28            +0.0       10.32        perf-profile.calltrace.cycl=
es-pp.page_fault
>      10.16            +0.0       10.21        perf-profile.calltrace.cycl=
es-pp.do_page_fault.page_fault
>      10.15            +0.1       10.20        perf-profile.calltrace.cycl=
es-pp.__do_page_fault.do_page_fault.page_fault
>       9.47            +0.1        9.56        perf-profile.calltrace.cycl=
es-pp.__handle_mm_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_=
fault
>      11.49            +0.1       11.59        perf-profile.calltrace.cycl=
es-pp.sys_execve.do_syscall_64.return_from_SYSCALL_64.execve
>       8.28            +0.1        8.38        perf-profile.calltrace.cycl=
es-pp.load_elf_binary.search_binary_handler.do_execveat_common.sys_execve.d=
o_syscall_64
>      11.49            +0.1       11.59        perf-profile.calltrace.cycl=
es-pp.return_from_SYSCALL_64.execve
>      11.49            +0.1       11.59        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.return_from_SYSCALL_64.execve
>       8.30            +0.1        8.41        perf-profile.calltrace.cycl=
es-pp.search_binary_handler.do_execveat_common.sys_execve.do_syscall_64.ret=
urn_from_SYSCALL_64
>      11.46            +0.1       11.58        perf-profile.calltrace.cycl=
es-pp.do_execveat_common.sys_execve.do_syscall_64.return_from_SYSCALL_64.ex=
ecve
>       8.46            +0.1        8.57        perf-profile.calltrace.cycl=
es-pp.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
>       5.21            +0.1        5.34 =C4=85  2%  perf-profile.calltrace=
.cycles-pp.exit_mmap.mmput.do_exit.do_group_exit.__wake_up_parent
>       5.24            +0.1        5.38 =C4=85  2%  perf-profile.calltrace=
.cycles-pp.mmput.do_exit.do_group_exit.__wake_up_parent.entry_SYSCALL_64_fa=
stpath
>      13.20            +0.1       13.34        perf-profile.calltrace.cycl=
es-pp.execve
>       6.79            +0.2        6.94 =C4=85  2%  perf-profile.calltrace=
.cycles-pp.__wake_up_parent.entry_SYSCALL_64_fastpath
>       6.79            +0.2        6.95 =C4=85  2%  perf-profile.calltrace=
.cycles-pp.do_group_exit.__wake_up_parent.entry_SYSCALL_64_fastpath
>       6.78            +0.2        6.94        perf-profile.calltrace.cycl=
es-pp.do_exit.do_group_exit.__wake_up_parent.entry_SYSCALL_64_fastpath
>       5.98            +0.2        6.18        perf-profile.calltrace.cycl=
es-pp.vfprintf.__vsnprintf_chk
>       8.38            +0.2        8.61        perf-profile.calltrace.cycl=
es-pp.__vsnprintf_chk
>      14.17            +0.3       14.49        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_fastpath
>      18.60            -1.1       17.45        perf-profile.children.cycle=
s-pp.do_idle
>      18.60            -1.1       17.45        perf-profile.children.cycle=
s-pp.cpu_startup_entry
>      18.60            -1.1       17.45        perf-profile.children.cycle=
s-pp.secondary_startup_64
>      17.60            -1.1       16.46        perf-profile.children.cycle=
s-pp.intel_idle
>      17.89            -1.1       16.80        perf-profile.children.cycle=
s-pp.cpuidle_enter_state
>      16.33 =C4=85  2%      -1.0       15.29        perf-profile.children.=
cycles-pp.start_secondary
>       5.54            -0.1        5.45        perf-profile.children.cycle=
s-pp.__libc_fork
>      16.15            +0.0       16.18        perf-profile.children.cycle=
s-pp.do_page_fault
>      16.19            +0.0       16.22        perf-profile.children.cycle=
s-pp.page_fault
>       6.24            +0.1        6.29 =C4=85  2%  perf-profile.children.=
cycles-pp.filemap_map_pages
>      16.07            +0.1       16.13        perf-profile.children.cycle=
s-pp.__do_page_fault
>      16.85            +0.1       16.92        perf-profile.children.cycle=
s-pp.do_syscall_64
>      16.85            +0.1       16.92        perf-profile.children.cycle=
s-pp.return_from_SYSCALL_64
>       9.22            +0.1        9.33        perf-profile.children.cycle=
s-pp.search_binary_handler
>      13.49            +0.1       13.61        perf-profile.children.cycle=
s-pp.__handle_mm_fault
>       4.89            +0.1        5.02 =C4=85  2%  perf-profile.children.=
cycles-pp.unmap_page_range
>       9.11            +0.1        9.24        perf-profile.children.cycle=
s-pp.load_elf_binary
>      13.20            +0.1       13.34        perf-profile.children.cycle=
s-pp.execve
>      12.82            +0.1       12.96        perf-profile.children.cycle=
s-pp.sys_execve
>       4.95            +0.2        5.10 =C4=85  2%  perf-profile.children.=
cycles-pp.unmap_vmas
>      12.79            +0.2       12.95        perf-profile.children.cycle=
s-pp.do_execveat_common
>      13.90            +0.2       14.07        perf-profile.children.cycle=
s-pp.handle_mm_fault
>       6.95            +0.2        7.13 =C4=85  2%  perf-profile.children.=
cycles-pp.do_exit
>       6.95            +0.2        7.13 =C4=85  2%  perf-profile.children.=
cycles-pp.do_group_exit
>       6.95            +0.2        7.13 =C4=85  2%  perf-profile.children.=
cycles-pp.__wake_up_parent
>       6.40 =C4=85  2%      +0.2        6.62        perf-profile.children.=
cycles-pp.vfprintf
>       8.38            +0.2        8.61        perf-profile.children.cycle=
s-pp.__vsnprintf_chk
>       9.21            +0.2        9.46        perf-profile.children.cycle=
s-pp.mmput
>       9.16            +0.2        9.41        perf-profile.children.cycle=
s-pp.exit_mmap
>      19.85            +0.3       20.13        perf-profile.children.cycle=
s-pp.entry_SYSCALL_64_fastpath
>      17.60            -1.1       16.46        perf-profile.self.cycles-pp=
.intel_idle
>       6.03 =C4=85  2%      +0.2        6.26        perf-profile.self.cycl=
es-pp.vfprintf
>
>
>
>                                    unixbench.score
>
>   14000 +-+--------------------------------------------------------------=
---+
>         O.O..O.O.O.O..O.O.O.O..O.O.O.O..O.O.O..O.O.O.+    +.+.+..+.+.+.+.=
.+.|
>   12000 +-+                                          :    :              =
   |
>         |                                            :    :              =
   |
>   10000 +-+                                           :   :              =
   |
>         |                                             :  :               =
   |
>    8000 +-+                                           :  :               =
   |
>         |                                             :  :               =
   |
>    6000 +-+                                            : :               =
   |
>         |                                              : :               =
   |
>    4000 +-+                                            : :               =
   |
>         |                                              ::                =
   |
>    2000 +-+                                             :                =
   |
>         |                                               :                =
   |
>       0 +-+--------------------------------------------------------------=
---+
>
>
>
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
>
>
> Thanks,
> Xiaolong

--===============2491861591023578191==--

