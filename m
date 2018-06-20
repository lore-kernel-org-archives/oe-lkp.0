Content-Type: multipart/mixed; boundary="===============7603667932669970252=="
MIME-Version: 1.0
From: Vincent Guittot <vincent.guittot@linaro.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched] f432b34f82: will-it-scale.per_thread_ops -12.6% regression
Date: Wed, 20 Jun 2018 14:05:03 +0200
Message-ID: <CAKfTPtDpx4iebk4aAQYAst6pmhfK-Sa-sfD41b49O3V6gDuddg@mail.gmail.com>
In-Reply-To: <20180620073453.GI11011@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7603667932669970252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 20 Jun 2018 at 09:38, kernel test robot <xiaolong.ye@intel.com> w=
rote:
>
>
> Greeting,
>
> FYI, we noticed a -12.6% regression of will-it-scale.per_thread_ops due t=
o commit:
>
>
> commit: f432b34f825d49999b8ad5417cff4b5f104b74d4 ("sched: use pelt for sc=
ale_rt_capacity()")
> https://git.linaro.org/people/vincent.guittot/kernel.git sched-rt-utiliza=
tion
>
> in testcase: will-it-scale
> on test machine: 8 threads Ivy Bridge with 16G memory
> with following parameters:
>
>         nr_task: 100%
>         mode: thread
>         test: sched_yield
>         cpufreq_governor: performance
>
> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale

Thanks for the report.
How many time the test is run ? I can see some high stdev value which
suggest instability is test results

>
> In addition to that, the commit also has significant impact on the follow=
ing tests:
>
> +------------------+-----------------------------------------------------=
------------+
> | testcase: change | unixbench: unixbench.score 7.4% improvement         =
            |
> | test machine     | 8 threads Intel(R) Core(TM) i7 CPU 870 @ 2.93GHz wit=
h 6G memory |
> | test parameters  | nr_task=3D100%                                      =
              |
> |                  | runtime=3D300s                                      =
              |
> |                  | test=3Dexecl                                        =
              |
> +------------------+-----------------------------------------------------=
------------+
>

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
> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/tes=
tcase:
>   gcc-7/performance/x86_64-rhel-7.2/thread/100%/debian-x86_64-2016-08-31.=
cgz/lkp-ivb-d01/sched_yield/will-it-scale
>
> commit:
>   3cd6eb61ec ("cpufreq/schedutil: take into account interrupt")
>   f432b34f82 ("sched: use pelt for scale_rt_capacity()")
>
> 3cd6eb61ecbc03a6 f432b34f825d49999b8ad5417c
> ---------------- --------------------------
>          %stddev     %change         %stddev
>              \          |                \
>    2193002           -12.6%    1916998 =C4=85 10%  will-it-scale.per_thre=
ad_ops
>    6932284 =C4=85  2%   +7144.3%  5.022e+08 =C4=85 71%  will-it-scale.tim=
e.involuntary_context_switches
>     792.00           -10.8%     706.75 =C4=85  8%  will-it-scale.time.per=
cent_of_cpu_this_job_got
>       1842            -9.9%       1660 =C4=85  7%  will-it-scale.time.sys=
tem_time
>     544.32           -13.9%     468.66 =C4=85 11%  will-it-scale.time.use=
r_time
>   17544019           -12.6%   15335987 =C4=85 10%  will-it-scale.workload
>       0.64           +10.5       11.10 =C4=85 69%  mpstat.cpu.idle%
>      39211         +4177.4%    1677224 =C4=85 70%  vmstat.system.cs
>     290602 =C4=85  7%     -24.2%     220391 =C4=85 23%  softirqs.RCU
>      23897 =C4=85  4%    +160.0%      62125 =C4=85 39%  softirqs.SCHED
>      20490            +3.3%      21172        proc-vmstat.nr_active_anon
>       6128            +0.9%       6183        proc-vmstat.nr_mapped
>       3480 =C4=85  3%      +9.0%       3792 =C4=85  5%  proc-vmstat.nr_sh=
mem
>      20490            +3.3%      21172        proc-vmstat.nr_zone_active_=
anon
>       1173 =C4=85 17%     +40.4%       1648 =C4=85 21%  proc-vmstat.pgact=
ivate
>     321823            +1.3%     325849        proc-vmstat.pgalloc_normal
>     317059            +1.3%     321126        proc-vmstat.pgfree
>       3680           -10.4%       3298 =C4=85  8%  turbostat.Avg_MHz
>     113297 =C4=85  2%   +2190.9%    2595491 =C4=85 36%  turbostat.C1
>       0.04            +0.8        0.87 =C4=85 36%  turbostat.C1%
>     211.75 =C4=85  9%    +584.7%       1449 =C4=85 83%  turbostat.C1E
>     162.25 =C4=85 19%   +1010.6%       1802 =C4=85 76%  turbostat.C3
>       7843 =C4=85 10%   +3025.2%     245131 =C4=85 77%  turbostat.C6
>       0.30 =C4=85 10%      +9.5        9.76 =C4=85 77%  turbostat.C6%
>       0.11 =C4=85 10%   +9616.3%      10.45 =C4=85 73%  turbostat.CPU%c1
>     991835         +2010.0%   20928148 =C4=85 36%  cpuidle.C1.time
>     114701 =C4=85  2%   +2165.3%    2598349 =C4=85 36%  cpuidle.C1.usage
>      28432 =C4=85 20%    +557.1%     186822 =C4=85 78%  cpuidle.C1E.time
>     275.75 =C4=85 14%    +451.9%       1522 =C4=85 78%  cpuidle.C1E.usage
>      54932 =C4=85 18%    +697.3%     438003 =C4=85 66%  cpuidle.C3.time
>     209.50 =C4=85 18%    +784.4%       1852 =C4=85 73%  cpuidle.C3.usage
>    8498054         +2689.5%  2.371e+08 =C4=85 76%  cpuidle.C6.time
>       9209 =C4=85  2%   +2576.7%     246513 =C4=85 76%  cpuidle.C6.usage
>       1106 =C4=85 12%   +3290.7%      37501 =C4=85 39%  cpuidle.POLL.time
>     345.25 =C4=85 22%   +2197.0%       7930 =C4=85 37%  cpuidle.POLL.usage
>  9.444e+11           -57.4%  4.026e+11 =C4=85 32%  perf-stat.branch-instr=
uctions
>       2.27            -0.1        2.16 =C4=85  3%  perf-stat.branch-miss-=
rate%
>   2.14e+10           -59.7%  8.632e+09 =C4=85 29%  perf-stat.branch-misses
>       5.06 =C4=85 16%      +7.3       12.37 =C4=85 52%  perf-stat.cache-m=
iss-rate%
>   11908086         +4181.7%  5.099e+08 =C4=85 70%  perf-stat.context-swit=
ches
>  8.855e+12           -59.5%  3.587e+12 =C4=85 29%  perf-stat.cpu-cycles
>      34115 =C4=85  9%     -70.0%      10248 =C4=85 42%  perf-stat.cpu-mig=
rations
>  3.556e+10 =C4=85  2%     -62.3%  1.342e+10 =C4=85 30%  perf-stat.dTLB-lo=
ad-misses
>    1.4e+12           -57.6%  5.941e+11 =C4=85 31%  perf-stat.dTLB-loads
>       0.00 =C4=85 36%      +0.0        0.03 =C4=85115%  perf-stat.dTLB-st=
ore-miss-rate%
>  9.282e+11           -57.9%  3.905e+11 =C4=85 31%  perf-stat.dTLB-stores
>      52.07 =C4=85  5%     -11.3       40.80 =C4=85 22%  perf-stat.iTLB-lo=
ad-miss-rate%
>  5.605e+09 =C4=85  9%     -73.2%  1.503e+09 =C4=85 14%  perf-stat.iTLB-lo=
ad-misses
>  5.136e+09 =C4=85  3%     -53.4%  2.395e+09 =C4=85 47%  perf-stat.iTLB-lo=
ads
>  4.548e+12           -57.7%  1.925e+12 =C4=85 31%  perf-stat.instructions
>     818.96 =C4=85  9%     +56.1%       1278 =C4=85 26%  perf-stat.instruc=
tions-per-iTLB-miss
>     259253           -49.2%     131782 =C4=85 45%  perf-stat.path-length
>      14.08 =C4=85  2%      -2.7       11.40 =C4=85  6%  perf-profile.call=
trace.cycles-pp.update_curr.pick_next_task_fair.__schedule.schedule.__x64_s=
ys_sched_yield
>      40.73            -2.6       38.12 =C4=85  4%  perf-profile.calltrace=
.cycles-pp.schedule.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe
>      39.59            -2.4       37.15 =C4=85  4%  perf-profile.calltrace=
.cycles-pp.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64.entry_SY=
SCALL_64_after_hwframe
>      48.35            -2.4       45.91 =C4=85  4%  perf-profile.calltrace=
.cycles-pp.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me
>      25.93            -2.2       23.74 =C4=85  5%  perf-profile.calltrace=
.cycles-pp.syscall_return_via_sysret
>      23.12            -1.6       21.55 =C4=85  4%  perf-profile.calltrace=
.cycles-pp.pick_next_task_fair.__schedule.schedule.__x64_sys_sched_yield.do=
_syscall_64
>       4.20            -0.6        3.58 =C4=85  5%  perf-profile.calltrace=
.cycles-pp.__calc_delta.update_curr.pick_next_task_fair.__schedule.schedule
>       2.72 =C4=85  3%      -0.4        2.28 =C4=85  8%  perf-profile.call=
trace.cycles-pp.pick_next_task_fair
>       1.69 =C4=85  2%      -0.3        1.38 =C4=85  5%  perf-profile.call=
trace.cycles-pp.yield_task_fair
>       1.62 =C4=85  4%      -0.3        1.35        perf-profile.calltrace=
.cycles-pp.update_curr
>       0.64 =C4=85  2%      -0.1        0.55 =C4=85  6%  perf-profile.call=
trace.cycles-pp.do_syscall_64
>       0.44 =C4=85 58%      +0.3        0.73 =C4=85 17%  perf-profile.call=
trace.cycles-pp.__list_del_entry_valid.pick_next_task_fair.__schedule.sched=
ule.__x64_sys_sched_yield
>       1.21 =C4=85  3%      +0.9        2.10 =C4=85 37%  perf-profile.call=
trace.cycles-pp.yield_task_fair.do_sched_yield.__x64_sys_sched_yield.do_sys=
call_64.entry_SYSCALL_64_after_hwframe
>      40.76            -2.6       38.17 =C4=85  4%  perf-profile.children.=
cycles-pp.schedule
>      39.83            -2.5       37.34 =C4=85  4%  perf-profile.children.=
cycles-pp.__schedule
>      49.28            -2.5       46.80 =C4=85  4%  perf-profile.children.=
cycles-pp.__x64_sys_sched_yield
>      15.74 =C4=85  2%      -2.5       13.29 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.update_curr
>      25.93            -2.2       23.75 =C4=85  5%  perf-profile.children.=
cycles-pp.syscall_return_via_sysret
>      25.84            -2.0       23.84 =C4=85  4%  perf-profile.children.=
cycles-pp.pick_next_task_fair
>       4.69            -0.7        4.04 =C4=85  4%  perf-profile.children.=
cycles-pp.__calc_delta
>       0.79 =C4=85  3%      +0.2        1.04 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.clear_buddies
>      25.93            -2.2       23.75 =C4=85  5%  perf-profile.self.cycl=
es-pp.syscall_return_via_sysret
>       9.70 =C4=85  4%      -1.8        7.95 =C4=85  5%  perf-profile.self=
.cycles-pp.update_curr
>       9.44 =C4=85  2%      -0.9        8.59 =C4=85  6%  perf-profile.self=
.cycles-pp.__schedule
>       4.69            -0.7        4.04 =C4=85  4%  perf-profile.self.cycl=
es-pp.__calc_delta
>       2.54 =C4=85  2%      -0.5        2.08 =C4=85 10%  perf-profile.self=
.cycles-pp.do_sched_yield
>       2.83 =C4=85  2%      -0.5        2.37 =C4=85  8%  perf-profile.self=
.cycles-pp.yield_task_fair
>       2.78 =C4=85  5%      -0.3        2.52 =C4=85  6%  perf-profile.self=
.cycles-pp.__x64_sys_sched_yield
>       0.79 =C4=85  3%      +0.2        1.04 =C4=85 10%  perf-profile.self=
.cycles-pp.clear_buddies
>     141060           -52.6%      66832 =C4=85 56%  sched_debug.cfs_rq:/.e=
xec_clock.min
>       2868 =C4=85 20%    +976.5%      30878 =C4=85 59%  sched_debug.cfs_r=
q:/.exec_clock.stddev
>    1200492           -16.8%     998858 =C4=85 12%  sched_debug.cfs_rq:/.m=
in_vruntime.avg
>    1151085           -53.5%     535255 =C4=85 56%  sched_debug.cfs_rq:/.m=
in_vruntime.min
>      26141 =C4=85 21%    +882.4%     256804 =C4=85 54%  sched_debug.cfs_r=
q:/.min_vruntime.stddev
>       1.23 =C4=85  8%     -14.8%       1.05 =C4=85  7%  sched_debug.cfs_r=
q:/.nr_spread_over.avg
>      26137 =C4=85 21%    +882.5%     256802 =C4=85 54%  sched_debug.cfs_r=
q:/.spread0.stddev
>     843.54 =C4=85  2%     -49.4%     427.08 =C4=85 49%  sched_debug.cfs_r=
q:/.util_avg.min
>      88.78 =C4=85 21%    +166.9%     236.92 =C4=85 33%  sched_debug.cfs_r=
q:/.util_avg.stddev
>       1.02 =C4=85  8%     -31.6%       0.70 =C4=85 31%  sched_debug.cpu.c=
lock.stddev
>       1.02 =C4=85  8%     -31.6%       0.70 =C4=85 31%  sched_debug.cpu.c=
lock_task.stddev
>      94.08           -36.2%      60.00 =C4=85 55%  sched_debug.cpu.cpu_lo=
ad[0].min
>      94.42           -35.6%      60.79 =C4=85 42%  sched_debug.cpu.cpu_lo=
ad[1].min
>     175.12 =C4=85  8%     +18.1%     206.83 =C4=85  3%  sched_debug.cpu.c=
pu_load[2].max
>      95.75           -43.4%      54.21 =C4=85 42%  sched_debug.cpu.cpu_lo=
ad[2].min
>      26.63 =C4=85 18%     +75.2%      46.64 =C4=85 24%  sched_debug.cpu.c=
pu_load[2].stddev
>     156.75 =C4=85  6%     +29.2%     202.46 =C4=85  6%  sched_debug.cpu.c=
pu_load[3].max
>      96.79           -53.2%      45.29 =C4=85 45%  sched_debug.cpu.cpu_lo=
ad[3].min
>      20.25 =C4=85 15%    +135.2%      47.63 =C4=85 29%  sched_debug.cpu.c=
pu_load[3].stddev
>     141.08 =C4=85  4%     +39.2%     196.33 =C4=85  8%  sched_debug.cpu.c=
pu_load[4].max
>      97.54           -59.3%      39.67 =C4=85 51%  sched_debug.cpu.cpu_lo=
ad[4].min
>      14.80 =C4=85 12%    +219.8%      47.34 =C4=85 33%  sched_debug.cpu.c=
pu_load[4].stddev
>    1170938         +2870.5%   34782808 =C4=85 57%  sched_debug.cpu.nr_swi=
tches.avg
>    4811815 =C4=85 26%   +3077.4%  1.529e+08 =C4=85 49%  sched_debug.cpu.n=
r_switches.max
>      58201 =C4=85 15%     -72.5%      15998 =C4=85 99%  sched_debug.cpu.n=
r_switches.min
>    1633456 =C4=85 20%   +3373.7%   56741908 =C4=85 62%  sched_debug.cpu.n=
r_switches.stddev
>  3.097e+08           -52.9%  1.459e+08 =C4=85 58%  sched_debug.cpu.sched_=
count.min
>    7185897 =C4=85 19%    +826.3%   66559915 =C4=85 58%  sched_debug.cpu.s=
ched_count.stddev
>      12004 =C4=85  2%   +2153.0%     270459 =C4=85 36%  sched_debug.cpu.s=
ched_goidle.avg
>      64148 =C4=85 16%   +2818.1%    1871943 =C4=85 35%  sched_debug.cpu.s=
ched_goidle.max
>      21941 =C4=85 10%   +2722.7%     619331 =C4=85 35%  sched_debug.cpu.s=
ched_goidle.stddev
>       7011 =C4=85 17%     -67.7%       2265 =C4=85 59%  sched_debug.cpu.t=
twu_count.min
>       5763 =C4=85 18%     -73.5%       1527 =C4=85 76%  sched_debug.cpu.t=
twu_local.min
>  3.055e+08 =C4=85  2%     -53.1%  1.433e+08 =C4=85 58%  sched_debug.cpu.y=
ld_count.min
>    8644751 =C4=85 18%    +684.3%   67800425 =C4=85 57%  sched_debug.cpu.y=
ld_count.stddev
>
>
>
>                     will-it-scale.time.involuntary_context_switches
>
>   2.5e+09 +-+------------------------------------------------------------=
---+
>           |                                                              =
   |
>           |                                                              =
   |
>     2e+09 +-+      O                                                     =
   |
>           |                                                              =
   |
>           |                                                              =
   |
>   1.5e+09 +-+                         O                                  =
   |
>           |                                                              =
   |
>     1e+09 +-+    O         O        O                       O            =
   |
>           |                    O                                         =
   |
>           |                                                              =
   |
>     5e+08 +-O                O                                           =
   |
>           O    O      O O         O        O    O   O    O    O O        =
   |
>           |                              O   O    O    O           O     =
   |
>         0 +-+------------------------------------------------------------=
---+
>
>
> [*] bisect-good sample
> [O] bisect-bad  sample
>
> *************************************************************************=
**************************
> nhm-white: 8 threads Intel(R) Core(TM) i7 CPU 870 @ 2.93GHz with 6G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
>   gcc-7/x86_64-rhel-7.2/100%/debian-x86_64-2018-04-03.cgz/300s/nhm-white/=
execl/unixbench
>
> commit:
>   3cd6eb61ec ("cpufreq/schedutil: take into account interrupt")
>   f432b34f82 ("sched: use pelt for scale_rt_capacity()")
>
> 3cd6eb61ecbc03a6 f432b34f825d49999b8ad5417c
> ---------------- --------------------------
>          %stddev     %change         %stddev
>              \          |                \
>       4301            +7.4%       4619        unixbench.score
>    4180477           -35.5%    2695696 =C4=85  3%  unixbench.time.involun=
tary_context_switches
>  2.583e+08            +9.0%  2.817e+08        unixbench.time.minor_page_f=
aults
>       1655            +5.7%       1750        unixbench.time.system_time
>     362.72            +4.4%     378.68        unixbench.time.user_time
>    3279113 =C4=85  3%     +48.3%    4861315 =C4=85  4%  unixbench.time.vo=
luntary_context_switches
>    6252322 =C4=85  3%      +7.3%    6709345 =C4=85  3%  unixbench.workload
>    1001980 =C4=85  3%     -43.5%     566495 =C4=85  7%  interrupts.CAL:Fu=
nction_call_interrupts
>      19.30 =C4=85  7%      -4.0       15.26 =C4=85 12%  mpstat.cpu.idle%
>      56649            -7.5%      52419        vmstat.system.cs
>      14780            -9.1%      13434        vmstat.system.in
>  2.016e+08            +9.0%  2.196e+08        proc-vmstat.numa_hit
>  2.016e+08            +9.0%  2.196e+08        proc-vmstat.numa_local
>       5989            +6.4%       6370        proc-vmstat.pgactivate
>  2.071e+08            +9.0%  2.258e+08        proc-vmstat.pgalloc_normal
>   2.61e+08            +9.3%  2.852e+08        proc-vmstat.pgfault
>   2.07e+08            +9.0%  2.258e+08        proc-vmstat.pgfree
>  1.219e+08 =C4=85  2%     -31.2%   83948754 =C4=85  5%  cpuidle.C1.time
>    5089762 =C4=85  2%     +15.7%    5888875 =C4=85  3%  cpuidle.C1.usage
>   87816352 =C4=85  3%     -59.2%   35819088 =C4=85  8%  cpuidle.C1E.time
>    2025352 =C4=85  2%     -57.4%     863049 =C4=85  7%  cpuidle.C1E.usage
>     430285 =C4=85 14%     -35.1%     279134 =C4=85 17%  cpuidle.C3.usage
>    1967162 =C4=85  2%     -11.4%    1742236 =C4=85  3%  cpuidle.POLL.time
>     114825 =C4=85  3%     +21.4%     139387 =C4=85  3%  cpuidle.POLL.usage
>       2401 =C4=85  2%      +9.7%       2635 =C4=85  2%  turbostat.Avg_MHz
>    5089676 =C4=85  2%     +15.7%    5888833 =C4=85  3%  turbostat.C1
>       4.50            -1.4        3.10 =C4=85  4%  turbostat.C1%
>    2025326 =C4=85  2%     -57.4%     863042 =C4=85  7%  turbostat.C1E
>       3.24            -1.9        1.32 =C4=85  7%  turbostat.C1E%
>     430222 =C4=85 14%     -35.1%     279119 =C4=85 17%  turbostat.C3
>      10.11 =C4=85  3%     -37.3%       6.33 =C4=85  8%  turbostat.CPU%c1
>    6014414 =C4=85  3%     -15.0%    5110077 =C4=85  3%  turbostat.IRQ
>  6.982e+11            +7.4%  7.499e+11        perf-stat.branch-instructio=
ns
>  3.524e+10            +6.2%  3.741e+10        perf-stat.branch-misses
>   19295137            -7.8%   17797227 =C4=85  2%  perf-stat.context-swit=
ches
>  6.455e+12            +9.9%  7.092e+12        perf-stat.cpu-cycles
>    4273261           -48.8%    2188451 =C4=85  5%  perf-stat.cpu-migratio=
ns
>  1.352e+12            +7.1%  1.448e+12        perf-stat.dTLB-loads
>  6.033e+11            +6.4%   6.42e+11 =C4=85  2%  perf-stat.dTLB-stores
>  2.725e+09 =C4=85  2%      +6.6%  2.906e+09 =C4=85  2%  perf-stat.iTLB-lo=
ad-misses
>  3.492e+12            +7.0%  3.737e+12        perf-stat.iTLB-loads
>  3.489e+12            +7.0%  3.735e+12        perf-stat.instructions
>       0.54            -2.6%       0.53        perf-stat.ipc
>   2.48e+08            +9.0%  2.704e+08        perf-stat.minor-faults
>   2.48e+08            +9.0%  2.704e+08        perf-stat.page-faults
>      35944 =C4=85 28%     +74.2%      62632 =C4=85 27%  sched_debug.cfs_r=
q:/.MIN_vruntime.avg
>     287559 =C4=85 28%     +59.1%     457421 =C4=85 30%  sched_debug.cfs_r=
q:/.MIN_vruntime.max
>      95101 =C4=85 28%     +63.3%     155341 =C4=85 28%  sched_debug.cfs_r=
q:/.MIN_vruntime.stddev
>      35944 =C4=85 28%     +74.2%      62632 =C4=85 27%  sched_debug.cfs_r=
q:/.max_vruntime.avg
>     287559 =C4=85 28%     +59.1%     457421 =C4=85 30%  sched_debug.cfs_r=
q:/.max_vruntime.max
>      95101 =C4=85 28%     +63.3%     155341 =C4=85 28%  sched_debug.cfs_r=
q:/.max_vruntime.stddev
>     790964           +14.9%     908896        sched_debug.cfs_rq:/.min_vr=
untime.avg
>     827175 =C4=85  2%     +14.3%     945176 =C4=85  2%  sched_debug.cfs_r=
q:/.min_vruntime.max
>     723861 =C4=85  4%     +13.4%     820615 =C4=85  4%  sched_debug.cfs_r=
q:/.min_vruntime.min
>     705.87 =C4=85 18%     +24.0%     875.53 =C4=85  9%  sched_debug.cfs_r=
q:/.util_avg.avg
>     461.75 =C4=85 27%     +43.7%     663.40 =C4=85 14%  sched_debug.cfs_r=
q:/.util_est_enqueued.avg
>     193562 =C4=85 15%     -51.0%      94833 =C4=85 62%  sched_debug.cpu.a=
vg_idle.min
>       0.77 =C4=85 10%     +32.6%       1.02 =C4=85 19%  sched_debug.cpu.c=
lock.stddev
>       0.76 =C4=85 10%     +33.3%       1.02 =C4=85 19%  sched_debug.cpu.c=
lock_task.stddev
>      74.29           +11.8%      83.08 =C4=85  9%  sched_debug.cpu.cpu_lo=
ad[3].min
>    1123755            -8.6%    1027327        sched_debug.cpu.nr_switches=
.avg
>    1197214 =C4=85  2%      -8.1%    1100171        sched_debug.cpu.nr_swi=
tches.max
>     795.50 =C4=85 17%     -74.2%     205.42 =C4=85 20%  sched_debug.cpu.n=
r_uninterruptible.max
>      -1575           -86.9%    -207.17        sched_debug.cpu.nr_uninterr=
uptible.min
>     751.08 =C4=85 40%     -81.4%     139.62 =C4=85 18%  sched_debug.cpu.n=
r_uninterruptible.stddev
>    1116957            -8.6%    1020656        sched_debug.cpu.sched_count=
.avg
>    1190399 =C4=85  2%      -8.2%    1092751        sched_debug.cpu.sched_=
count.max
>     304608 =C4=85  2%     -26.8%     223083        sched_debug.cpu.ttwu_l=
ocal.avg
>     337393 =C4=85  3%     -26.3%     248739 =C4=85  2%  sched_debug.cpu.t=
twu_local.max
>     264918 =C4=85  4%     -25.0%     198599 =C4=85  4%  sched_debug.cpu.t=
twu_local.min
>      21128 =C4=85 24%     -23.7%      16117 =C4=85 10%  sched_debug.cpu.t=
twu_local.stddev
>      10.90 =C4=85 16%      -4.1        6.85 =C4=85 10%  perf-profile.call=
trace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64
>      10.90 =C4=85 16%      -4.1        6.85 =C4=85 10%  perf-profile.call=
trace.cycles-pp.start_secondary.secondary_startup_64
>      10.90 =C4=85 16%      -4.1        6.84 =C4=85 10%  perf-profile.call=
trace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup=
_64
>      10.08 =C4=85 15%      -3.9        6.15 =C4=85 12%  perf-profile.call=
trace.cycles-pp.cpuidle_enter_state.do_idle.cpu_startup_entry.start_seconda=
ry.secondary_startup_64
>       9.78 =C4=85 15%      -3.8        5.95 =C4=85 13%  perf-profile.call=
trace.cycles-pp.intel_idle.cpuidle_enter_state.do_idle.cpu_startup_entry.st=
art_secondary
>      12.20 =C4=85  7%      -3.6        8.60 =C4=85 11%  perf-profile.call=
trace.cycles-pp.secondary_startup_64
>       0.86 =C4=85  5%      -0.5        0.36 =C4=85100%  perf-profile.call=
trace.cycles-pp.smpboot_thread_fn.kthread.ret_from_fork
>       0.90 =C4=85  4%      -0.3        0.65 =C4=85 17%  perf-profile.call=
trace.cycles-pp.ret_from_fork
>       0.90 =C4=85  4%      -0.3        0.65 =C4=85 17%  perf-profile.call=
trace.cycles-pp.kthread.ret_from_fork
>       0.68 =C4=85  3%      +0.1        0.75        perf-profile.calltrace=
.cycles-pp.mark_page_accessed.unmap_page_range.unmap_vmas.exit_mmap.mmput
>       1.21 =C4=85  3%      +0.1        1.33 =C4=85  7%  perf-profile.call=
trace.cycles-pp.alloc_pages_vma.__handle_mm_fault.handle_mm_fault.__do_page=
_fault.do_page_fault
>       1.00 =C4=85  6%      +0.1        1.13 =C4=85  9%  perf-profile.call=
trace.cycles-pp.do_open_execat.do_execveat_common.__x64_sys_execve.do_sysca=
ll_64.entry_SYSCALL_64_after_hwframe
>       0.97 =C4=85  6%      +0.1        1.10 =C4=85 10%  perf-profile.call=
trace.cycles-pp.do_filp_open.do_open_execat.do_execveat_common.__x64_sys_ex=
ecve.do_syscall_64
>       1.51 =C4=85  3%      +0.1        1.65 =C4=85  4%  perf-profile.call=
trace.cycles-pp.do_sys_open.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       0.93 =C4=85  8%      +0.2        1.08 =C4=85 10%  perf-profile.call=
trace.cycles-pp.path_openat.do_filp_open.do_open_execat.do_execveat_common.=
__x64_sys_execve
>       1.23 =C4=85  3%      +0.2        1.40 =C4=85  6%  perf-profile.call=
trace.cycles-pp.do_filp_open.do_sys_open.do_syscall_64.entry_SYSCALL_64_aft=
er_hwframe
>       1.23 =C4=85  5%      +0.2        1.40 =C4=85  4%  perf-profile.call=
trace.cycles-pp.walk_component.path_lookupat.filename_lookup.do_faccessat.d=
o_syscall_64
>       1.20 =C4=85  5%      +0.2        1.38 =C4=85  6%  perf-profile.call=
trace.cycles-pp.path_openat.do_filp_open.do_sys_open.do_syscall_64.entry_SY=
SCALL_64_after_hwframe
>       0.99 =C4=85 10%      +0.2        1.18 =C4=85  9%  perf-profile.call=
trace.cycles-pp.perf_event_mmap.mmap_region.do_mmap.vm_mmap_pgoff.elf_map
>       2.09 =C4=85  5%      +0.2        2.29 =C4=85  6%  perf-profile.call=
trace.cycles-pp.wp_page_copy.do_wp_page.__handle_mm_fault.handle_mm_fault._=
_do_page_fault
>       0.26 =C4=85100%      +0.3        0.56 =C4=85  5%  perf-profile.call=
trace.cycles-pp.vma_interval_tree_insert.__vma_adjust.__split_vma.mprotect_=
fixup.do_mprotect_pkey
>       2.71 =C4=85  4%      +0.3        3.03 =C4=85  5%  perf-profile.call=
trace.cycles-pp.do_mmap.vm_mmap_pgoff.elf_map.load_elf_binary.search_binary=
_handler
>       4.43 =C4=85  3%      +0.3        4.76 =C4=85  2%  perf-profile.call=
trace.cycles-pp.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_S=
YSCALL_64_after_hwframe
>       0.47 =C4=85 58%      +0.3        0.81 =C4=85  7%  perf-profile.call=
trace.cycles-pp.unlink_file_vma.free_pgtables.exit_mmap.mmput.flush_old_exec
>       4.82            +0.4        5.18 =C4=85  3%  perf-profile.calltrace=
.cycles-pp.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_aft=
er_hwframe
>       1.71 =C4=85  8%      +0.4        2.06 =C4=85  4%  perf-profile.call=
trace.cycles-pp.free_pgtables.exit_mmap.mmput.flush_old_exec.load_elf_binary
>       3.83 =C4=85  3%      +0.4        4.20 =C4=85  2%  perf-profile.call=
trace.cycles-pp.mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscal=
l_64
>       4.92            +0.4        5.33 =C4=85  4%  perf-profile.calltrace=
.cycles-pp.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       0.12 =C4=85173%      +0.5        0.62 =C4=85 12%  perf-profile.call=
trace.cycles-pp.__vma_adjust.__split_vma.do_munmap.vm_munmap.elf_map
>      12.06 =C4=85  5%      +0.8       12.91        perf-profile.calltrace=
.cycles-pp.exit_mmap.mmput.flush_old_exec.load_elf_binary.search_binary_han=
dler
>      12.10 =C4=85  5%      +0.9       12.98        perf-profile.calltrace=
.cycles-pp.mmput.flush_old_exec.load_elf_binary.search_binary_handler.do_ex=
ecveat_common
>      12.57 =C4=85  5%      +0.9       13.49 =C4=85  2%  perf-profile.call=
trace.cycles-pp.flush_old_exec.load_elf_binary.search_binary_handler.do_exe=
cveat_common.__x64_sys_execve
>      27.55 =C4=85  2%      +1.8       29.34 =C4=85  3%  perf-profile.call=
trace.cycles-pp.load_elf_binary.search_binary_handler.do_execveat_common.__=
x64_sys_execve.do_syscall_64
>      27.65 =C4=85  2%      +1.8       29.45 =C4=85  3%  perf-profile.call=
trace.cycles-pp.search_binary_handler.do_execveat_common.__x64_sys_execve.d=
o_syscall_64.entry_SYSCALL_64_after_hwframe
>      38.27 =C4=85  2%      +2.3       40.61 =C4=85  2%  perf-profile.call=
trace.cycles-pp.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me.execve
>      38.27 =C4=85  2%      +2.3       40.62 =C4=85  2%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve
>      38.27 =C4=85  2%      +2.4       40.62 =C4=85  2%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.execve
>      38.21 =C4=85  2%      +2.4       40.56 =C4=85  2%  perf-profile.call=
trace.cycles-pp.do_execveat_common.__x64_sys_execve.do_syscall_64.entry_SYS=
CALL_64_after_hwframe.execve
>      40.44 =C4=85  2%      +2.4       42.83 =C4=85  2%  perf-profile.call=
trace.cycles-pp.execve
>      10.90 =C4=85 16%      -4.1        6.85 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.start_secondary
>      12.21 =C4=85  7%      -3.6        8.61 =C4=85 11%  perf-profile.chil=
dren.cycles-pp.do_idle
>      12.20 =C4=85  7%      -3.6        8.60 =C4=85 11%  perf-profile.chil=
dren.cycles-pp.secondary_startup_64
>      12.20 =C4=85  7%      -3.6        8.60 =C4=85 11%  perf-profile.chil=
dren.cycles-pp.cpu_startup_entry
>      11.26 =C4=85  7%      -3.5        7.75 =C4=85 13%  perf-profile.chil=
dren.cycles-pp.cpuidle_enter_state
>      10.93 =C4=85  7%      -3.5        7.47 =C4=85 13%  perf-profile.chil=
dren.cycles-pp.intel_idle
>       0.86 =C4=85  5%      -0.3        0.60 =C4=85 22%  perf-profile.chil=
dren.cycles-pp.smpboot_thread_fn
>       0.91 =C4=85  4%      -0.3        0.65 =C4=85 17%  perf-profile.chil=
dren.cycles-pp.ret_from_fork
>       0.90 =C4=85  4%      -0.3        0.65 =C4=85 17%  perf-profile.chil=
dren.cycles-pp.kthread
>       0.28 =C4=85 34%      -0.2        0.04 =C4=85108%  perf-profile.chil=
dren.cycles-pp.ksys_write
>       0.27 =C4=85 38%      -0.2        0.04 =C4=85108%  perf-profile.chil=
dren.cycles-pp.vfs_write
>       0.27 =C4=85 39%      -0.2        0.04 =C4=85108%  perf-profile.chil=
dren.cycles-pp.__vfs_write
>       0.25 =C4=85 44%      -0.2        0.03 =C4=85100%  perf-profile.chil=
dren.cycles-pp.__generic_file_write_iter
>       0.25 =C4=85 44%      -0.2        0.03 =C4=85100%  perf-profile.chil=
dren.cycles-pp.generic_file_write_iter
>       0.25 =C4=85 43%      -0.2        0.03 =C4=85105%  perf-profile.chil=
dren.cycles-pp.generic_perform_write
>       0.54 =C4=85 22%      -0.2        0.35 =C4=85 17%  perf-profile.chil=
dren.cycles-pp.cpu_stopper_thread
>       0.57 =C4=85  8%      -0.2        0.40 =C4=85 21%  perf-profile.chil=
dren.cycles-pp.radix_tree_next_chunk
>       1.16 =C4=85  4%      -0.1        1.05 =C4=85  8%  perf-profile.chil=
dren.cycles-pp.__might_sleep
>       0.45 =C4=85  4%      -0.1        0.35 =C4=85 25%  perf-profile.chil=
dren.cycles-pp.stop_one_cpu
>       0.41 =C4=85  4%      -0.1        0.31 =C4=85 24%  perf-profile.chil=
dren.cycles-pp.up_write
>       0.16 =C4=85 26%      -0.1        0.07 =C4=85 38%  perf-profile.chil=
dren.cycles-pp.smp_call_function_single
>       0.26 =C4=85 16%      -0.1        0.17 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.free_ldt_pgtables
>       0.14 =C4=85 23%      -0.1        0.08 =C4=85 60%  perf-profile.chil=
dren.cycles-pp.wake_up_q
>       0.08 =C4=85 20%      +0.0        0.11 =C4=85 16%  perf-profile.chil=
dren.cycles-pp.selinux_bprm_set_creds
>       0.06 =C4=85 58%      +0.0        0.09 =C4=85 13%  perf-profile.chil=
dren.cycles-pp.switch_mm
>       0.78 =C4=85  3%      +0.0        0.83 =C4=85  3%  perf-profile.chil=
dren.cycles-pp.mark_page_accessed
>       0.03 =C4=85100%      +0.0        0.07 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.mntput_no_expire
>       0.00            +0.1        0.05        perf-profile.children.cycle=
s-pp.__calc_delta
>       0.15 =C4=85 19%      +0.1        0.20 =C4=85 19%  perf-profile.chil=
dren.cycles-pp.mem_cgroup_uncharge_list
>       0.01 =C4=85173%      +0.1        0.07 =C4=85 23%  perf-profile.chil=
dren.cycles-pp.task_work_add
>       0.00            +0.1        0.06 =C4=85 20%  perf-profile.children.=
cycles-pp.file_ra_state_init
>       0.13 =C4=85  9%      +0.1        0.20 =C4=85 15%  perf-profile.chil=
dren.cycles-pp.may_open
>       0.10 =C4=85 21%      +0.1        0.18 =C4=85 18%  perf-profile.chil=
dren.cycles-pp.security_file_alloc
>       0.07 =C4=85 27%      +0.1        0.15 =C4=85 46%  perf-profile.chil=
dren.cycles-pp.may_expand_vm
>       0.00            +0.1        0.07 =C4=85 30%  perf-profile.children.=
cycles-pp.selinux_task_getsecid
>       0.12 =C4=85 29%      +0.1        0.19 =C4=85 25%  perf-profile.chil=
dren.cycles-pp.lookup_memtype
>       0.08 =C4=85 23%      +0.1        0.16 =C4=85 20%  perf-profile.chil=
dren.cycles-pp.selinux_file_alloc_security
>       0.07 =C4=85 58%      +0.1        0.16 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.should_failslab
>       0.28 =C4=85  8%      +0.1        0.37 =C4=85  6%  perf-profile.chil=
dren.cycles-pp.get_empty_filp
>       0.41 =C4=85 18%      +0.1        0.54 =C4=85 20%  perf-profile.chil=
dren.cycles-pp.native_flush_tlb_one_user
>       1.53 =C4=85  3%      +0.1        1.66 =C4=85  4%  perf-profile.chil=
dren.cycles-pp.do_sys_open
>       0.56 =C4=85  5%      +0.1        0.69 =C4=85  5%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irqsave
>       0.20 =C4=85 19%      +0.2        0.35 =C4=85 16%  perf-profile.chil=
dren.cycles-pp.mem_cgroup_commit_charge
>       1.78 =C4=85  4%      +0.2        1.94 =C4=85  5%  perf-profile.chil=
dren.cycles-pp.walk_component
>       0.94 =C4=85 11%      +0.2        1.10 =C4=85  4%  perf-profile.chil=
dren.cycles-pp.irq_exit
>       0.61 =C4=85 16%      +0.2        0.78 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.free_pgd_range
>       0.50 =C4=85 12%      +0.2        0.70 =C4=85 19%  perf-profile.chil=
dren.cycles-pp.expand_downwards
>       2.10 =C4=85  5%      +0.2        2.30 =C4=85  5%  perf-profile.chil=
dren.cycles-pp.wp_page_copy
>       1.02 =C4=85 12%      +0.2        1.24 =C4=85  4%  perf-profile.chil=
dren.cycles-pp.vma_interval_tree_insert
>       2.73 =C4=85  3%      +0.2        2.95 =C4=85  4%  perf-profile.chil=
dren.cycles-pp.__vma_adjust
>       1.00 =C4=85  8%      +0.2        1.25 =C4=85  6%  perf-profile.chil=
dren.cycles-pp.unlink_file_vma
>       2.19 =C4=85  6%      +0.4        2.56 =C4=85  5%  perf-profile.chil=
dren.cycles-pp.free_pgtables
>       4.93            +0.4        5.34 =C4=85  4%  perf-profile.children.=
cycles-pp.ksys_mmap_pgoff
>       3.11 =C4=85  7%      +0.4        3.54 =C4=85  5%  perf-profile.chil=
dren.cycles-pp.do_filp_open
>       3.02 =C4=85  7%      +0.5        3.49 =C4=85  5%  perf-profile.chil=
dren.cycles-pp.path_openat
>       6.21            +0.6        6.84 =C4=85  3%  perf-profile.children.=
cycles-pp.mmap_region
>       7.17            +0.6        7.80 =C4=85  2%  perf-profile.children.=
cycles-pp.do_mmap
>       7.91            +0.7        8.61 =C4=85  2%  perf-profile.children.=
cycles-pp.vm_mmap_pgoff
>      12.07 =C4=85  5%      +0.8       12.92        perf-profile.children.=
cycles-pp.exit_mmap
>      12.11 =C4=85  5%      +0.9       12.99        perf-profile.children.=
cycles-pp.mmput
>      12.58 =C4=85  5%      +0.9       13.49 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.flush_old_exec
>      27.57 =C4=85  2%      +1.8       29.38 =C4=85  3%  perf-profile.chil=
dren.cycles-pp.load_elf_binary
>      27.69 =C4=85  2%      +1.8       29.51 =C4=85  3%  perf-profile.chil=
dren.cycles-pp.search_binary_handler
>      38.45 =C4=85  2%      +2.3       40.77 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.__x64_sys_execve
>      38.38 =C4=85  2%      +2.3       40.71 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.do_execveat_common
>      40.44 =C4=85  2%      +2.4       42.83 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.execve
>      55.45 =C4=85  2%      +2.9       58.30        perf-profile.children.=
cycles-pp.entry_SYSCALL_64_after_hwframe
>      55.36 =C4=85  2%      +2.9       58.23        perf-profile.children.=
cycles-pp.do_syscall_64
>      10.91 =C4=85  7%      -3.4        7.46 =C4=85 13%  perf-profile.self=
.cycles-pp.intel_idle
>       0.55 =C4=85 11%      -0.2        0.39 =C4=85 23%  perf-profile.self=
.cycles-pp.radix_tree_next_chunk
>       0.41 =C4=85  4%      -0.1        0.30 =C4=85 27%  perf-profile.self=
.cycles-pp.up_write
>       0.14 =C4=85 34%      -0.1        0.04 =C4=85107%  perf-profile.self=
.cycles-pp.smp_call_function_single
>       0.14 =C4=85 40%      -0.1        0.08 =C4=85 46%  perf-profile.self=
.cycles-pp.unmap_vmas
>       0.19 =C4=85 10%      -0.0        0.15 =C4=85  4%  perf-profile.self=
.cycles-pp.unmapped_area_topdown
>       0.05 =C4=85 58%      +0.0        0.08 =C4=85  5%  perf-profile.self=
.cycles-pp.exit_mmap
>       0.01 =C4=85173%      +0.0        0.05 =C4=85  9%  perf-profile.self=
.cycles-pp.selinux_bprm_set_creds
>       0.03 =C4=85100%      +0.0        0.07 =C4=85 14%  perf-profile.self=
.cycles-pp.mntput_no_expire
>       0.00            +0.1        0.05        perf-profile.self.cycles-pp=
.__calc_delta
>       0.06 =C4=85 62%      +0.1        0.12 =C4=85 15%  perf-profile.self=
.cycles-pp.remove_vma
>       0.00            +0.1        0.06 =C4=85 20%  perf-profile.self.cycl=
es-pp.file_ra_state_init
>       0.03 =C4=85100%      +0.1        0.10 =C4=85 21%  perf-profile.self=
.cycles-pp.mem_cgroup_uncharge_list
>       0.07 =C4=85 22%      +0.1        0.15 =C4=85 46%  perf-profile.self=
.cycles-pp.may_expand_vm
>       0.14 =C4=85 25%      +0.1        0.22 =C4=85  8%  perf-profile.self=
.cycles-pp.cpumask_any_but
>       0.08 =C4=85 36%      +0.1        0.16 =C4=85 11%  perf-profile.self=
.cycles-pp.mem_cgroup_commit_charge
>       0.07 =C4=85 58%      +0.1        0.15 =C4=85  5%  perf-profile.self=
.cycles-pp.should_failslab
>       0.20 =C4=85 28%      +0.1        0.32 =C4=85  6%  perf-profile.self=
.cycles-pp.load_elf_binary
>       0.15 =C4=85 36%      +0.1        0.27 =C4=85  6%  perf-profile.self=
.cycles-pp.free_pgd_range
>       0.41 =C4=85 18%      +0.1        0.54 =C4=85 20%  perf-profile.self=
.cycles-pp.native_flush_tlb_one_user
>       0.96 =C4=85  5%      +0.2        1.13 =C4=85  8%  perf-profile.self=
.cycles-pp.kmem_cache_alloc
>       1.00 =C4=85 13%      +0.2        1.23 =C4=85  4%  perf-profile.self=
.cycles-pp.vma_interval_tree_insert
>       3.35 =C4=85  8%      +0.5        3.80 =C4=85  8%  perf-profile.self=
.cycles-pp.unmap_page_range
>
>
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

--===============7603667932669970252==--

