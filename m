Content-Type: multipart/mixed; boundary="===============5731153483485624423=="
MIME-Version: 1.0
From: Vincent Guittot <vincent.guittot@linaro.org>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 04dfd1bca6: unixbench.score -17.7% regression
Date: Tue, 22 Oct 2019 15:02:25 +0200
Message-ID: <CAKfTPtCpxnQvhDaCeqN09Br3EdmH50cbGP7fV8+m3USRZtYkOA@mail.gmail.com>
In-Reply-To: <20191021084920.GH9296@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5731153483485624423==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Rong,


On Mon, 21 Oct 2019 at 10:49, kernel test robot <rong.a.chen@intel.com> w=
rote:
>
> Greeting,
>
> FYI, we noticed a -17.7% regression of unixbench.score due to commit:
>

Thanks for testing and reporting the regression.

I have pushed a patch on the branch that should fix the regression.
Could you rerun the test with the fix ?

The new top commit of the branch is:
commit: ff61a177adcf60c6bbc96f4bf3d74f980c699558 ("sched/fair: fix
rework of find_idlest_group()")

Thanks
Vincent

>
> commit: 04dfd1bca609c5d1c8b7e073f723e4efb3a38fd0 ("sched/fair: rework fin=
d_idlest_group")
> https://git.linaro.org/people/vincent.guittot/kernel.git sched/pelt
>
> in testcase: unixbench
> on test machine: 104 threads Skylake with 192G memory
> with following parameters:
>
>         runtime: 300s
>         nr_task: 1
>         test: execl
>         cpufreq_governor: performance
>
> test-description: UnixBench is the original BYTE UNIX benchmark suite aim=
s to test performance of Unix-like system.
> test-url: https://github.com/kdlucas/byte-unixbench
>
> In addition to that, the commit also has significant impact on the follow=
ing tests:
>
> +------------------+---------------------------------------------+
> | testcase: change | unixbench: unixbench.score -2.9% regression |
> | test machine     | 104 threads Skylake with 192G memory        |
> | test parameters  | cpufreq_governor=3Dperformance                |
> |                  | nr_task=3D1                                   |
> |                  | runtime=3D300s                                |
> |                  | test=3Dshell8                                 |
> +------------------+---------------------------------------------+
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
>
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
>   gcc-7/performance/x86_64-rhel-7.6/1/debian-x86_64-2019-05-14.cgz/300s/l=
kp-skl-fpga01/execl/unixbench
>
> commit:
>   2871f4abd7 ("sched/fair: optimize find_idlest_group")
>   04dfd1bca6 ("sched/fair: rework find_idlest_group")
>
> 2871f4abd7cefa0c 04dfd1bca609c5d1c8b7e073f72
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>           3:4          -24%           2:4     perf-profile.calltrace.cycl=
es-pp.error_entry
>           4:4          -31%           3:4     perf-profile.children.cycle=
s-pp.error_entry
>           2:4          -12%           1:4     perf-profile.self.cycles-pp=
.error_entry
>          %stddev     %change         %stddev
>              \          |                \
>       1070           -17.7%     881.12        unixbench.score
>      60191 =C2=B1  4%   +1775.4%    1128836        unixbench.time.involun=
tary_context_switches
>   65970423           -17.7%   54298779        unixbench.time.minor_page_f=
aults
>      90.00            -1.1%      89.00        unixbench.time.percent_of_c=
pu_this_job_got
>     224.61            +3.9%     233.40        unixbench.time.system_time
>      73.59           -14.9%      62.62        unixbench.time.user_time
>    1520547           -17.7%    1251223        unixbench.workload
>     519212 =C2=B1  3%     -15.6%     438194 =C2=B1  6%  meminfo.Committed=
_AS
>       0.23            -0.0        0.20 =C2=B1  2%  mpstat.cpu.all.usr%
>      38630          +358.2%     176996        turbostat.C1
>       1804          +551.9%      11763        vmstat.system.cs
>     208621            +1.2%     211137        vmstat.system.in
>     670712 =C2=B1  4%    +357.5%    3068341        cpuidle.C1.time
>      40662          +339.5%     178728        cpuidle.C1.usage
>     218562           +72.8%     377583        cpuidle.POLL.time
>      69106           +11.6%      77147 =C2=B1  3%  cpuidle.POLL.usage
>       6715 =C2=B1  2%     -16.2%       5625        slabinfo.cred_jar.acti=
ve_objs
>       6715 =C2=B1  2%     -16.2%       5625        slabinfo.cred_jar.num_=
objs
>       1350 =C2=B1  9%     -22.5%       1046 =C2=B1 10%  slabinfo.task_gro=
up.active_objs
>       1350 =C2=B1  9%     -22.5%       1046 =C2=B1 10%  slabinfo.task_gro=
up.num_objs
>       8250            -1.2%       8149        proc-vmstat.nr_shmem
>      41931            -1.4%      41363        proc-vmstat.nr_slab_unrecla=
imable
>   51692821           -17.5%   42668044        proc-vmstat.numa_hit
>   51659149           -17.5%   42634283        proc-vmstat.numa_local
>       1458            -2.8%       1416        proc-vmstat.pgactivate
>   53140687           -17.4%   43897196        proc-vmstat.pgalloc_normal
>   66835883           -17.5%   55170602        proc-vmstat.pgfault
>   53125982           -17.4%   43882197        proc-vmstat.pgfree
>       0.00 =C2=B1  8%  +2.5e+25%     151.86 =C2=B1102%  sched_debug.cfs_r=
q:/.MIN_vruntime.stddev
>      38598 =C2=B1 21%     -92.1%       3036 =C2=B1 12%  sched_debug.cfs_r=
q:/.exec_clock.max
>       2.54 =C2=B1 51%  +27421.0%     698.49 =C2=B1 47%  sched_debug.cfs_r=
q:/.exec_clock.min
>       7186 =C2=B1 27%     -93.5%     468.07 =C2=B1 32%  sched_debug.cfs_r=
q:/.exec_clock.stddev
>     423464 =C2=B1  5%     +16.2%     491935 =C2=B1  5%  sched_debug.cfs_r=
q:/.load.max
>     583.83 =C2=B1  3%      +9.7%     640.54 =C2=B1  3%  sched_debug.cfs_r=
q:/.load_avg.max
>       0.00 =C2=B1  8%  +2.5e+25%     151.86 =C2=B1102%  sched_debug.cfs_r=
q:/.max_vruntime.stddev
>      76974 =C2=B1 12%     -54.4%      35135 =C2=B1 11%  sched_debug.cfs_r=
q:/.min_vruntime.max
>      11476 =C2=B1 19%     -63.8%       4149 =C2=B1  7%  sched_debug.cfs_r=
q:/.min_vruntime.stddev
>       0.11 =C2=B1 17%     -31.2%       0.07 =C2=B1 24%  sched_debug.cfs_r=
q:/.nr_running.avg
>       0.30 =C2=B1  7%     -17.3%       0.25 =C2=B1 12%  sched_debug.cfs_r=
q:/.nr_running.stddev
>     412.25 =C2=B1  5%     +15.3%     475.46 =C2=B1  5%  sched_debug.cfs_r=
q:/.runnable_load_avg.max
>     423124 =C2=B1  5%     +15.4%     488472 =C2=B1  5%  sched_debug.cfs_r=
q:/.runnable_weight.max
>      61850 =C2=B1 18%     -69.0%      19159 =C2=B1 33%  sched_debug.cfs_r=
q:/.spread0.max
>      11476 =C2=B1 19%     -63.8%       4149 =C2=B1  7%  sched_debug.cfs_r=
q:/.spread0.stddev
>     950.21           -14.4%     813.33 =C2=B1  8%  sched_debug.cfs_rq:/.u=
til_avg.max
>     207.82 =C2=B1  7%     -22.0%     162.11 =C2=B1 13%  sched_debug.cfs_r=
q:/.util_avg.stddev
>       2.15 =C2=B1  3%      +8.7%       2.33 =C2=B1  4%  sched_debug.cpu.c=
lock.stddev
>       2.15 =C2=B1  3%      +8.7%       2.33 =C2=B1  4%  sched_debug.cpu.c=
lock_task.stddev
>       4499          +316.9%      18757        sched_debug.cpu.nr_switches=
.avg
>     684.75 =C2=B1 18%   +1143.2%       8512 =C2=B1 55%  sched_debug.cpu.n=
r_switches.min
>      21.67 =C2=B1 19%    +115.8%      46.75 =C2=B1 14%  sched_debug.cpu.n=
r_uninterruptible.max
>       7.32 =C2=B1  2%     +39.4%      10.20 =C2=B1  8%  sched_debug.cpu.n=
r_uninterruptible.stddev
>       2619          +542.9%      16841        sched_debug.cpu.sched_count=
.avg
>      83.33 =C2=B1  3%   +8687.1%       7322 =C2=B1 65%  sched_debug.cpu.s=
ched_count.min
>       1041          +473.4%       5973        sched_debug.cpu.sched_goidl=
e.avg
>      41.25 =C2=B1  3%   +6075.3%       2547 =C2=B1 63%  sched_debug.cpu.s=
ched_goidle.min
>       1267          +368.9%       5943        sched_debug.cpu.ttwu_count.=
avg
>      24785 =C2=B1 10%     -27.9%      17863 =C2=B1  7%  sched_debug.cpu.t=
twu_count.max
>      60.71 =C2=B1  2%   +4051.3%       2520 =C2=B1 64%  sched_debug.cpu.t=
twu_count.min
>       3048 =C2=B1  6%     -27.6%       2207 =C2=B1 19%  sched_debug.cpu.t=
twu_count.stddev
>     713.58 =C2=B1  2%    +655.8%       5393        sched_debug.cpu.ttwu_l=
ocal.avg
>      38.33         +6242.2%       2431 =C2=B1 66%  sched_debug.cpu.ttwu_l=
ocal.min
>       4.02 =C2=B1  5%    +165.0%      10.65 =C2=B1  2%  perf-stat.i.MPKI
>   7.59e+08           -11.0%  6.756e+08        perf-stat.i.branch-instruct=
ions
>       1.99            +0.4        2.35        perf-stat.i.branch-miss-rat=
e%
>   15047574 =C2=B1  3%      +5.9%   15940485        perf-stat.i.branch-mis=
ses
>       8.05 =C2=B1 31%      -4.2        3.87 =C2=B1  5%  perf-stat.i.cache=
-miss-rate%
>   14886172 =C2=B1  6%    +147.1%   36779409 =C2=B1  2%  perf-stat.i.cache=
-references
>       1765          +569.3%      11812        perf-stat.i.context-switches
>       1.22 =C2=B1 44%  +2.9e+05%       3487        perf-stat.i.cpu-migrat=
ions
>       0.11 =C2=B1  7%      -0.0        0.11        perf-stat.i.dTLB-store=
-miss-rate%
>     613805 =C2=B1  6%     -16.3%     513668        perf-stat.i.dTLB-store=
-misses
>  5.144e+08 =C2=B1  3%     -11.1%  4.573e+08        perf-stat.i.dTLB-stores
>      24.59 =C2=B1  8%      -3.5       21.13        perf-stat.i.iTLB-load-=
miss-rate%
>     923696 =C2=B1  8%     -22.2%     718931        perf-stat.i.iTLB-load-=
misses
>    2693576            -5.5%    2545675        perf-stat.i.iTLB-loads
>  3.759e+09           -10.4%  3.366e+09        perf-stat.i.instructions
>       6588 =C2=B1 24%     +19.6%       7882        perf-stat.i.instructio=
ns-per-iTLB-miss
>     193948           -17.4%     160274        perf-stat.i.minor-faults
>     361777 =C2=B1  9%     +56.3%     565624 =C2=B1  2%  perf-stat.i.node-=
load-misses
>      95.30            +1.6       96.90        perf-stat.i.node-store-miss=
-rate%
>      32178 =C2=B1 11%    +221.6%     103482 =C2=B1  7%  perf-stat.i.node-=
store-misses
>       2445 =C2=B1 17%     +37.7%       3369 =C2=B1 11%  perf-stat.i.node-=
stores
>     193948           -17.4%     160274        perf-stat.i.page-faults
>       3.96 =C2=B1  5%    +176.0%      10.93 =C2=B1  2%  perf-stat.overall=
.MPKI
>       1.98            +0.4        2.36        perf-stat.overall.branch-mi=
ss-rate%
>       7.71 =C2=B1 27%      -4.2        3.51 =C2=B1  5%  perf-stat.overall=
.cache-miss-rate%
>       1.49 =C2=B1  4%      +7.8%       1.60        perf-stat.overall.cpi
>       0.12 =C2=B1  5%      -0.0        0.11        perf-stat.overall.dTLB=
-store-miss-rate%
>      25.51 =C2=B1  7%      -3.5       22.02        perf-stat.overall.iTLB=
-load-miss-rate%
>       4093 =C2=B1  6%     +14.4%       4683        perf-stat.overall.inst=
ructions-per-iTLB-miss
>      92.87            +3.9       96.81        perf-stat.overall.node-stor=
e-miss-rate%
>     815363            +8.6%     885628        perf-stat.overall.path-leng=
th
>  7.566e+08           -11.0%  6.735e+08        perf-stat.ps.branch-instruc=
tions
>   15000902 =C2=B1  3%      +5.9%   15890901        perf-stat.ps.branch-mi=
sses
>   14839481 =C2=B1  6%    +147.1%   36661599 =C2=B1  2%  perf-stat.ps.cach=
e-references
>       1759          +569.2%      11774        perf-stat.ps.context-switch=
es
>       1.21 =C2=B1 44%  +2.9e+05%       3476        perf-stat.ps.cpu-migra=
tions
>     611824 =C2=B1  6%     -16.3%     512010        perf-stat.ps.dTLB-stor=
e-misses
>  5.128e+08 =C2=B1  3%     -11.1%  4.559e+08        perf-stat.ps.dTLB-stor=
es
>     920724 =C2=B1  8%     -22.2%     716612        perf-stat.ps.iTLB-load=
-misses
>    2685093            -5.5%    2537668        perf-stat.ps.iTLB-loads
>  3.747e+09           -10.4%  3.356e+09        perf-stat.ps.instructions
>     193319           -17.4%     159757        perf-stat.ps.minor-faults
>     360625 =C2=B1  9%     +56.3%     563815 =C2=B1  2%  perf-stat.ps.node=
-load-misses
>      32079 =C2=B1 11%    +221.6%     103151 =C2=B1  7%  perf-stat.ps.node=
-store-misses
>       2443 =C2=B1 17%     +37.6%       3361 =C2=B1 11%  perf-stat.ps.node=
-stores
>     193318           -17.4%     159756        perf-stat.ps.page-faults
>   1.24e+12           -10.6%  1.108e+12        perf-stat.total.instructions
>     153443 =C2=B1 15%     -28.9%     109141 =C2=B1  5%  softirqs.CPU0.TIM=
ER
>     115065 =C2=B1 19%     -18.6%      93661 =C2=B1  2%  softirqs.CPU10.RCU
>     135698 =C2=B1 17%     -21.1%     107003 =C2=B1  4%  softirqs.CPU10.TI=
MER
>     106433 =C2=B1  6%     -10.8%      94899        softirqs.CPU13.RCU
>      99902 =C2=B1  3%     -10.8%      89095        softirqs.CPU15.RCU
>     138814 =C2=B1 18%     -23.9%     105590 =C2=B1  5%  softirqs.CPU15.TI=
MER
>     139505 =C2=B1 42%     -35.3%      90321        softirqs.CPU16.RCU
>     139471 =C2=B1 18%     -25.6%     103749 =C2=B1  4%  softirqs.CPU16.TI=
MER
>     103748 =C2=B1  6%     -13.3%      89914 =C2=B1  2%  softirqs.CPU18.RCU
>     103619 =C2=B1  6%     -16.2%      86872 =C2=B1  8%  softirqs.CPU19.RCU
>      98487 =C2=B1  6%      -8.8%      89786        softirqs.CPU20.RCU
>     101354 =C2=B1  6%     -11.7%      89481        softirqs.CPU21.RCU
>     103605 =C2=B1  6%     -13.1%      90040        softirqs.CPU22.RCU
>     144989 =C2=B1 15%     -25.2%     108382 =C2=B1  4%  softirqs.CPU22.TI=
MER
>     101871 =C2=B1  5%     -11.8%      89864        softirqs.CPU23.RCU
>     100187 =C2=B1  3%     -10.0%      90164        softirqs.CPU24.RCU
>     100311 =C2=B1  4%     -10.4%      89849        softirqs.CPU25.RCU
>     140653 =C2=B1 17%     -23.8%     107138 =C2=B1  4%  softirqs.CPU3.TIM=
ER
>     118375 =C2=B1 17%     -19.9%      94766 =C2=B1  2%  softirqs.CPU4.RCU
>     142764 =C2=B1 15%     -26.5%     104984 =C2=B1  3%  softirqs.CPU5.TIM=
ER
>     118362 =C2=B1 34%     -30.5%      82263 =C2=B1  5%  softirqs.CPU53.RCU
>      92606 =C2=B1  4%      -8.7%      84520 =C2=B1  2%  softirqs.CPU54.RCU
>      93605 =C2=B1  3%     -10.7%      83589 =C2=B1  2%  softirqs.CPU55.RCU
>      94238 =C2=B1  5%     -10.7%      84135        softirqs.CPU56.RCU
>      94095 =C2=B1  4%     -10.5%      84212 =C2=B1  2%  softirqs.CPU57.RCU
>     107752 =C2=B1  6%     -12.0%      94828        softirqs.CPU6.RCU
>     141109 =C2=B1 17%     -25.4%     105326 =C2=B1  3%  softirqs.CPU6.TIM=
ER
>     105204 =C2=B1  5%     -10.9%      93731 =C2=B1  4%  softirqs.CPU60.RCU
>     107821 =C2=B1  7%     -11.6%      95363 =C2=B1  2%  softirqs.CPU61.RCU
>     132456 =C2=B1 34%     -28.0%      95316        softirqs.CPU62.RCU
>     127921 =C2=B1 33%     -24.1%      97108 =C2=B1  3%  softirqs.CPU63.RCU
>     104792 =C2=B1  6%      -9.0%      95373        softirqs.CPU64.RCU
>     109268 =C2=B1  6%     -11.9%      96296 =C2=B1  2%  softirqs.CPU65.RCU
>     103793 =C2=B1  6%      -8.5%      95014        softirqs.CPU67.RCU
>     167387 =C2=B1 58%     -42.9%      95593        softirqs.CPU68.RCU
>     153077 =C2=B1 18%     -35.3%      99031        softirqs.CPU69.TIMER
>     109474 =C2=B1  6%     -15.5%      92503 =C2=B1  5%  softirqs.CPU70.RCU
>     131867 =C2=B1 24%     -25.7%      97998        softirqs.CPU70.TIMER
>     109331 =C2=B1  6%     -13.7%      94390 =C2=B1  2%  softirqs.CPU71.RCU
>     107404 =C2=B1  7%     -13.8%      92615 =C2=B1  4%  softirqs.CPU72.RCU
>     107956 =C2=B1  6%     -11.7%      95322 =C2=B1  2%  softirqs.CPU73.RCU
>     131548 =C2=B1 23%     -25.7%      97705        softirqs.CPU73.TIMER
>     108346 =C2=B1  7%     -12.6%      94681        softirqs.CPU74.RCU
>      78965 =C2=B1  2%     -10.2%      70898        softirqs.CPU75.RCU
>      78863 =C2=B1  2%      -9.8%      71127        softirqs.CPU76.RCU
>     128056 =C2=B1 66%     -44.5%      71075        softirqs.CPU77.RCU
>     101012 =C2=B1  4%      -8.3%      92606 =C2=B1  2%  softirqs.CPU8.RCU
>      65033 =C2=B1 33%     -43.3%      36864 =C2=B1 22%  softirqs.CPU8.SCH=
ED
>      18.01 =C2=B1 12%      -3.4       14.58 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter=
_state.cpuidle_enter.do_idle
>      10.49 =C2=B1 13%      -2.3        8.18 =C2=B1 15%  perf-profile.call=
trace.cycles-pp.hrtimer_interrupt.smp_apic_timer_interrupt.apic_timer_inter=
rupt.cpuidle_enter_state.cpuidle_enter
>       6.94 =C2=B1  9%      -1.9        5.01 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.menu_select.do_idle.cpu_startup_entry.start_secondary.secon=
dary_startup_64
>       4.73 =C2=B1 12%      -1.9        2.86 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.tick_nohz_get_sleep_length.menu_select.do_idle.cpu_startup_=
entry.start_secondary
>       4.07 =C2=B1 14%      -1.7        2.33 =C2=B1 20%  perf-profile.call=
trace.cycles-pp.tick_nohz_next_event.tick_nohz_get_sleep_length.menu_select=
.do_idle.cpu_startup_entry
>       4.33 =C2=B1 12%      -1.6        2.72 =C2=B1 14%  perf-profile.call=
trace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.smp=
_apic_timer_interrupt.apic_timer_interrupt
>       4.81 =C2=B1  9%      -1.4        3.38 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe
>       4.79 =C2=B1  9%      -1.4        3.37 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       1.57 =C2=B1 16%      -1.2        0.38 =C2=B1100%  perf-profile.call=
trace.cycles-pp.timekeeping_max_deferment.tick_nohz_next_event.tick_nohz_ge=
t_sleep_length.menu_select.do_idle
>       3.12 =C2=B1  7%      -1.2        1.94 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrt=
imer_interrupt.smp_apic_timer_interrupt
>       3.05 =C2=B1  7%      -1.2        1.88 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__h=
rtimer_run_queues.hrtimer_interrupt
>       5.04 =C2=B1 12%      -0.9        4.17 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.smp_apic_timer_inter=
rupt.apic_timer_interrupt.cpuidle_enter_state
>       1.87 =C2=B1 12%      -0.8        1.09 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.get_next_timer_interrupt.tick_nohz_next_event.tick_nohz_get=
_sleep_length.menu_select.do_idle
>       4.29 =C2=B1  5%      -0.7        3.60 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.page_fault
>       1.43 =C2=B1 33%      -0.6        0.80 =C2=B1 46%  perf-profile.call=
trace.cycles-pp.irq_enter.smp_apic_timer_interrupt.apic_timer_interrupt.cpu=
idle_enter_state.cpuidle_enter
>       1.11 =C2=B1  8%      -0.5        0.59 =C2=B1 58%  perf-profile.call=
trace.cycles-pp.swapgs_restore_regs_and_return_to_usermode
>       1.12 =C2=B1 19%      -0.5        0.63 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.__next_timer_interrupt.get_next_timer_interrupt.tick_nohz_n=
ext_event.tick_nohz_get_sleep_length.menu_select
>       1.31 =C2=B1 29%      -0.5        0.84 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       1.29 =C2=B1 29%      -0.5        0.82 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_6=
4_after_hwframe
>       1.60 =C2=B1 18%      -0.4        1.18 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.filemap_map_pages.__handle_mm_fault.handle_mm_fault.__do_pa=
ge_fault.do_page_fault
>       0.99 =C2=B1 19%      -0.3        0.72 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_S=
YSCALL_64_after_hwframe
>       0.90 =C2=B1 21%      -0.2        0.65 =C2=B1 13%  perf-profile.call=
trace.cycles-pp.mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscal=
l_64
>       0.79 =C2=B1  4%      -0.1        0.70 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.uart_console_write.serial8250_console_write.console_unlock.=
wake_up_klogd_work_func.irq_work_run_list
>       0.76 =C2=B1  2%      -0.1        0.68 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.serial8250_console_putchar.uart_console_write.serial8250_co=
nsole_write.console_unlock.wake_up_klogd_work_func
>       0.75            -0.1        0.68 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.wait_for_xmitr.serial8250_console_putchar.uart_console_write.ser=
ial8250_console_write.console_unlock
>       0.89 =C2=B1 12%      +0.3        1.23 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.rcu_core.__softirqentry_text_start.irq_exit.smp_apic_timer_=
interrupt.apic_timer_interrupt
>       1.88 =C2=B1 12%      +0.4        2.27 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.unmap_page_range.unmap_vmas.exit_mmap.mmput.flush_old_exec
>       0.28 =C2=B1100%      +0.5        0.73 =C2=B1 15%  perf-profile.call=
trace.cycles-pp.ret_from_fork
>       0.28 =C2=B1100%      +0.5        0.73 =C2=B1 15%  perf-profile.call=
trace.cycles-pp.kthread.ret_from_fork
>       0.15 =C2=B1173%      +0.5        0.61 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.page_fault.__clear_user.load_elf_binary.search_binary_handl=
er.__do_execve_file
>       0.26 =C2=B1100%      +0.6        0.84 =C2=B1 29%  perf-profile.call=
trace.cycles-pp.sched_exec.__do_execve_file.__x64_sys_execve.do_syscall_64.=
entry_SYSCALL_64_after_hwframe
>       0.00            +0.7        0.72 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.serial8250_console_write.console_unlock.wake_up_klogd_work_func.=
irq_work_run_list.smp_call_function_single_interrupt
>       0.00            +0.8        0.79 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.irq_work_run_list.smp_call_function_single_interrupt.call_functi=
on_single_interrupt.cpuidle_enter_state.cpuidle_enter
>       0.00            +0.8        0.79 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.wake_up_klogd_work_func.irq_work_run_list.smp_call_function_sing=
le_interrupt.call_function_single_interrupt.cpuidle_enter_state
>       0.00            +0.8        0.79 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.console_unlock.wake_up_klogd_work_func.irq_work_run_list.smp_cal=
l_function_single_interrupt.call_function_single_interrupt
>       0.00            +0.9        0.87 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.smp_call_function_single_interrupt.call_function_single_interrup=
t.cpuidle_enter_state.cpuidle_enter.do_idle
>       0.00            +0.9        0.91 =C2=B1  7%  perf-profile.calltrace=
.cycles-pp.call_function_single_interrupt.cpuidle_enter_state.cpuidle_enter=
.do_idle.cpu_startup_entry
>       3.46 =C2=B1  2%      +1.0        4.41 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.execve.main
>       3.46 =C2=B1  2%      +1.0        4.41 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve.main
>       3.46 =C2=B1  2%      +1.0        4.41 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me.execve.main
>       3.47 =C2=B1  2%      +1.0        4.44 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.main
>       3.46 =C2=B1  2%      +1.0        4.43 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.execve.main
>      10.53 =C2=B1  8%      +1.6       12.10 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.__do_execve_file.__x64_sys_execve.do_syscall_64.entry_SYSCA=
LL_64_after_hwframe.execve
>      72.39            +2.4       74.76        perf-profile.calltrace.cycl=
es-pp.cpu_startup_entry.start_secondary.secondary_startup_64
>      72.39            +2.4       74.77        perf-profile.calltrace.cycl=
es-pp.start_secondary.secondary_startup_64
>      72.34            +2.4       74.74        perf-profile.calltrace.cycl=
es-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
>      72.89            +2.4       75.32        perf-profile.calltrace.cycl=
es-pp.secondary_startup_64
>      63.09 =C2=B1  2%      +3.8       66.89        perf-profile.calltrace=
.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.star=
t_secondary
>      63.62 =C2=B1  2%      +4.2       67.86        perf-profile.calltrace=
.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.secondar=
y_startup_64
>      41.10 =C2=B1  3%      +7.6       48.75 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_st=
artup_entry
>      19.46 =C2=B1 11%      -4.5       14.94 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.smp_apic_timer_interrupt
>      21.42 =C2=B1  9%      -4.5       16.92 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.apic_timer_interrupt
>      11.76 =C2=B1 11%      -3.3        8.43 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.hrtimer_interrupt
>       7.00 =C2=B1  9%      -1.9        5.07 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.menu_select
>       4.77 =C2=B1 12%      -1.9        2.89 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.tick_nohz_get_sleep_length
>       6.19 =C2=B1  8%      -1.9        4.33 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.__hrtimer_run_queues
>       4.09 =C2=B1 14%      -1.7        2.37 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.tick_nohz_next_event
>       4.53 =C2=B1 11%      -1.7        2.84 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.tick_sched_timer
>       2.53 =C2=B1  7%      -1.6        0.91 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.irq_work_run_list
>       2.51 =C2=B1  7%      -1.6        0.90 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.console_unlock
>       2.38 =C2=B1  7%      -1.6        0.82 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.serial8250_console_write
>       2.29 =C2=B1  8%      -1.5        0.79 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.wait_for_xmitr
>       2.29 =C2=B1  7%      -1.5        0.80 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.uart_console_write
>       2.21 =C2=B1  8%      -1.4        0.78 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.serial8250_console_putchar
>       3.26 =C2=B1  6%      -1.2        2.05 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.tick_sched_handle
>       3.19 =C2=B1  7%      -1.2        2.00 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.update_process_times
>       1.58 =C2=B1 15%      -1.0        0.54 =C2=B1 39%  perf-profile.chil=
dren.cycles-pp.timekeeping_max_deferment
>       6.33 =C2=B1  4%      -0.9        5.42 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.page_fault
>       1.90 =C2=B1 12%      -0.8        1.10 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.get_next_timer_interrupt
>       5.86 =C2=B1  5%      -0.8        5.08 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.do_page_fault
>       5.74 =C2=B1  5%      -0.8        4.98 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__do_page_fault
>       1.41 =C2=B1  7%      -0.8        0.66 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.io_serial_in
>       0.87 =C2=B1 19%      -0.7        0.14 =C2=B1 69%  perf-profile.chil=
dren.cycles-pp.delay_tsc
>       6.02 =C2=B1  6%      -0.7        5.34 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.irq_exit
>       2.54 =C2=B1  4%      -0.6        1.91 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.filemap_map_pages
>       1.31 =C2=B1 34%      -0.6        0.68 =C2=B1 60%  perf-profile.chil=
dren.cycles-pp.tick_irq_enter
>       2.16 =C2=B1  5%      -0.6        1.57 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.native_irq_return_iret
>       1.27 =C2=B1 20%      -0.6        0.71 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.__next_timer_interrupt
>       1.06 =C2=B1 35%      -0.6        0.51 =C2=B1 76%  perf-profile.chil=
dren.cycles-pp.ktime_get_update_offsets_now
>       1.43 =C2=B1  6%      -0.5        0.90 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.swapgs_restore_regs_and_return_to_usermode
>       1.32 =C2=B1 29%      -0.5        0.85 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.ksys_mmap_pgoff
>       0.91 =C2=B1 24%      -0.4        0.55 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.find_next_bit
>       1.29 =C2=B1  5%      -0.3        0.97 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.read_tsc
>       0.57 =C2=B1 65%      -0.3        0.26 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.__x64_sys_munmap
>       0.98 =C2=B1 17%      -0.3        0.67 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.alloc_set_pte
>       0.85 =C2=B1  2%      -0.3        0.58 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.prepare_exit_to_usermode
>       0.36 =C2=B1 29%      -0.3        0.10 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.process_one_work
>       0.35 =C2=B1 24%      -0.3        0.10 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.ast_dirty_update
>       0.35 =C2=B1 28%      -0.3        0.10 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.fb_flashcursor
>       0.35 =C2=B1 28%      -0.2        0.10 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.memcpy_toio
>       0.35 =C2=B1 28%      -0.2        0.10 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.bit_cursor
>       0.35 =C2=B1 28%      -0.2        0.10 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.soft_cursor
>       0.36 =C2=B1 29%      -0.2        0.11 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.worker_thread
>       0.27 =C2=B1 90%      -0.2        0.06 =C2=B1 60%  perf-profile.chil=
dren.cycles-pp.d_path
>       0.26 =C2=B1 96%      -0.2        0.05 =C2=B1 62%  perf-profile.chil=
dren.cycles-pp.prepend_path
>       0.59 =C2=B1 12%      -0.2        0.40 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.hrtimer_next_event_without
>       0.32 =C2=B1 26%      -0.2        0.15 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.run_local_timers
>       0.60 =C2=B1 15%      -0.2        0.44 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.flush_tlb_func_common
>       0.26 =C2=B1  9%      -0.1        0.15 =C2=B1 55%  perf-profile.chil=
dren.cycles-pp.__isoc99_sscanf
>       0.73 =C2=B1 12%      -0.1        0.61 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.rcu_sched_clock_irq
>       0.20 =C2=B1 35%      -0.1        0.09 =C2=B1 38%  perf-profile.chil=
dren.cycles-pp.map_vdso
>       0.44 =C2=B1 11%      -0.1        0.33 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.__hrtimer_next_event_base
>       0.27 =C2=B1 10%      -0.1        0.17 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.menu_reflect
>       0.21 =C2=B1 15%      -0.1        0.11 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.trigger_load_balance
>       0.89 =C2=B1  4%      -0.1        0.79 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.wake_up_klogd_work_func
>       0.27 =C2=B1 19%      -0.1        0.17 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.ptep_clear_flush
>       0.16 =C2=B1 34%      -0.1        0.08 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.__install_special_mapping
>       0.18 =C2=B1  8%      -0.1        0.10 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.__hrtimer_get_next_event
>       0.10 =C2=B1 21%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.sys_imageblit
>       0.10 =C2=B1 21%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.drm_fb_helper_sys_imageblit
>       0.27 =C2=B1  6%      -0.1        0.19 =C2=B1 26%  perf-profile.chil=
dren.cycles-pp.kmem_cache_alloc
>       0.12 =C2=B1  8%      -0.1        0.05 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.bit_putcs
>       0.12 =C2=B1 21%      -0.1        0.05 =C2=B1 61%  perf-profile.chil=
dren.cycles-pp.cpumask_next
>       0.14 =C2=B1 11%      -0.1        0.07 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.fbcon_redraw
>       0.14 =C2=B1 11%      -0.1        0.07 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.con_scroll
>       0.14 =C2=B1 11%      -0.1        0.07 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.lf
>       0.14 =C2=B1 11%      -0.1        0.07 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.fbcon_scroll
>       0.14 =C2=B1 11%      -0.1        0.07 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.vt_console_print
>       0.12 =C2=B1  8%      -0.1        0.07 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.fbcon_putcs
>       0.11 =C2=B1 24%      -0.1        0.05 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.ast_imageblit
>       0.12 =C2=B1 18%      -0.1        0.07 =C2=B1 38%  perf-profile.chil=
dren.cycles-pp.__isoc99_vsscanf
>       0.09 =C2=B1 12%      -0.0        0.06 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.vm_area_alloc
>       0.09 =C2=B1 24%      +0.0        0.12 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.dput
>       0.00            +0.1        0.06 =C2=B1 15%  perf-profile.children.=
cycles-pp.flush_smp_call_function_queue
>       0.02 =C2=B1173%      +0.1        0.08 =C2=B1 29%  perf-profile.chil=
dren.cycles-pp._extract_crng
>       0.02 =C2=B1173%      +0.1        0.08 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.terminate_walk
>       0.01 =C2=B1173%      +0.1        0.08 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.file_free_rcu
>       0.00            +0.1        0.07 =C2=B1 30%  perf-profile.children.=
cycles-pp.__mmdrop
>       0.16 =C2=B1 22%      +0.1        0.24 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.down_write
>       0.03 =C2=B1173%      +0.1        0.11 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp._get_random_bytes
>       0.01 =C2=B1173%      +0.1        0.10 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.find_extend_vma
>       0.03 =C2=B1100%      +0.1        0.12 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.mem_cgroup_throttle_swaprate
>       0.00            +0.1        0.10 =C2=B1 33%  perf-profile.children.=
cycles-pp.finish_task_switch
>       0.06 =C2=B1100%      +0.1        0.15 =C2=B1 30%  perf-profile.chil=
dren.cycles-pp.__pmd_alloc
>       0.00            +0.1        0.10 =C2=B1 24%  perf-profile.children.=
cycles-pp.move_queued_task
>       0.11 =C2=B1 39%      +0.1        0.22 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.remove_vma
>       0.00            +0.1        0.12 =C2=B1 22%  perf-profile.children.=
cycles-pp.migration_cpu_stop
>       0.15 =C2=B1 24%      +0.1        0.27 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.mark_page_accessed
>       0.10 =C2=B1 42%      +0.1        0.22 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.unlink_anon_vmas
>       0.01 =C2=B1173%      +0.1        0.14 =C2=B1 31%  perf-profile.chil=
dren.cycles-pp.switch_mm_irqs_off
>       0.00            +0.1        0.12 =C2=B1 17%  perf-profile.children.=
cycles-pp.cpu_stopper_thread
>       0.10 =C2=B1 29%      +0.1        0.23 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.smp_call_function_single
>       0.18 =C2=B1 26%      +0.1        0.32 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.vma_interval_tree_insert
>       0.18 =C2=B1 34%      +0.2        0.33 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp._cond_resched
>       0.00            +0.2        0.19 =C2=B1 27%  perf-profile.children.=
cycles-pp.preempt_schedule_common
>       0.07 =C2=B1 66%      +0.2        0.26 =C2=B1 36%  perf-profile.chil=
dren.cycles-pp.mem_cgroup_try_charge_delay
>       0.03 =C2=B1105%      +0.2        0.22 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.__slab_free
>       0.35 =C2=B1 18%      +0.2        0.54 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.get_user_pages_remote
>       0.34 =C2=B1 16%      +0.2        0.54 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__get_user_pages
>       0.10 =C2=B1 57%      +0.2        0.30 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.kmem_cache_free
>       0.66 =C2=B1 11%      +0.2        0.86 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock
>       0.02 =C2=B1173%      +0.2        0.22 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.schedule_idle
>       0.00            +0.2        0.21 =C2=B1 19%  perf-profile.children.=
cycles-pp.free_ldt_pgtables
>       0.00            +0.2        0.23 =C2=B1 32%  perf-profile.children.=
cycles-pp.stop_one_cpu
>       0.31 =C2=B1 11%      +0.2        0.56 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.free_pgtables
>       0.27 =C2=B1 42%      +0.3        0.53 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.clear_page_erms
>       0.47 =C2=B1 20%      +0.3        0.73 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.ret_from_fork
>       0.47 =C2=B1 20%      +0.3        0.73 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.kthread
>       0.28 =C2=B1 43%      +0.3        0.56 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.prep_new_page
>       0.45 =C2=B1 19%      +0.4        0.84 =C2=B1 29%  perf-profile.chil=
dren.cycles-pp.sched_exec
>       0.01 =C2=B1173%      +0.4        0.41 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.newidle_balance
>       0.00            +0.5        0.46 =C2=B1  5%  perf-profile.children.=
cycles-pp.find_idlest_group
>       0.04 =C2=B1103%      +0.5        0.51 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.schedule
>       0.05 =C2=B1100%      +0.5        0.59 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.smpboot_thread_fn
>       0.08 =C2=B1 71%      +0.8        0.90 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.__schedule
>       0.00            +0.9        0.87 =C2=B1  5%  perf-profile.children.=
cycles-pp.smp_call_function_single_interrupt
>       0.00            +0.9        0.91 =C2=B1  7%  perf-profile.children.=
cycles-pp.call_function_single_interrupt
>       3.65 =C2=B1  4%      +0.9        4.58 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.main
>      10.62 =C2=B1  8%      +1.5       12.15 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__x64_sys_execve
>      10.58 =C2=B1  8%      +1.5       12.13 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__do_execve_file
>      10.58 =C2=B1  8%      +1.6       12.17 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.execve
>      72.39            +2.4       74.77        perf-profile.children.cycle=
s-pp.start_secondary
>      72.98            +2.4       75.38        perf-profile.children.cycle=
s-pp.do_idle
>      72.89            +2.4       75.32        perf-profile.children.cycle=
s-pp.secondary_startup_64
>      72.89            +2.4       75.32        perf-profile.children.cycle=
s-pp.cpu_startup_entry
>      64.04 =C2=B1  2%      +4.3       68.31        perf-profile.children.=
cycles-pp.cpuidle_enter_state
>      64.07 =C2=B1  2%      +4.3       68.37        perf-profile.children.=
cycles-pp.cpuidle_enter
>      41.35 =C2=B1  3%      +7.5       48.85 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.intel_idle
>       1.58 =C2=B1 15%      -1.0        0.54 =C2=B1 40%  perf-profile.self=
.cycles-pp.timekeeping_max_deferment
>       1.41 =C2=B1  7%      -0.8        0.66 =C2=B1  7%  perf-profile.self=
.cycles-pp.io_serial_in
>       0.86 =C2=B1 18%      -0.7        0.14 =C2=B1 69%  perf-profile.self=
.cycles-pp.delay_tsc
>       2.15 =C2=B1  5%      -0.6        1.56 =C2=B1  6%  perf-profile.self=
.cycles-pp.native_irq_return_iret
>       0.88 =C2=B1 44%      -0.5        0.37 =C2=B1101%  perf-profile.self=
.cycles-pp.ktime_get_update_offsets_now
>       0.78 =C2=B1 24%      -0.3        0.48 =C2=B1 10%  perf-profile.self=
.cycles-pp.find_next_bit
>       1.21 =C2=B1  3%      -0.3        0.92 =C2=B1 12%  perf-profile.self=
.cycles-pp.read_tsc
>       0.59 =C2=B1 17%      -0.3        0.33 =C2=B1 13%  perf-profile.self=
.cycles-pp.__next_timer_interrupt
>       1.23 =C2=B1  5%      -0.3        0.96 =C2=B1  7%  perf-profile.self=
.cycles-pp.filemap_map_pages
>       0.57 =C2=B1 18%      -0.3        0.31 =C2=B1 19%  perf-profile.self=
.cycles-pp.swapgs_restore_regs_and_return_to_usermode
>       0.83 =C2=B1  4%      -0.3        0.58 =C2=B1 19%  perf-profile.self=
.cycles-pp.prepare_exit_to_usermode
>       0.35 =C2=B1 28%      -0.2        0.10 =C2=B1 22%  perf-profile.self=
.cycles-pp.memcpy_toio
>       0.61 =C2=B1  6%      -0.2        0.40 =C2=B1 21%  perf-profile.self=
.cycles-pp.do_syscall_64
>       0.66 =C2=B1 10%      -0.2        0.49 =C2=B1  7%  perf-profile.self=
.cycles-pp.__lock_text_start
>       0.30 =C2=B1 31%      -0.2        0.14 =C2=B1 84%  perf-profile.self=
.cycles-pp.run_local_timers
>       0.16 =C2=B1 19%      -0.1        0.04 =C2=B1 59%  perf-profile.self=
.cycles-pp._IO_vfscanf
>       0.61 =C2=B1  5%      -0.1        0.51 =C2=B1 12%  perf-profile.self=
.cycles-pp.rcu_sched_clock_irq
>       0.34 =C2=B1  8%      -0.1        0.24 =C2=B1 21%  perf-profile.self=
.cycles-pp.page_add_file_rmap
>       0.40 =C2=B1 13%      -0.1        0.31 =C2=B1 18%  perf-profile.self=
.cycles-pp.__hrtimer_next_event_base
>       0.67 =C2=B1  8%      -0.1        0.58 =C2=B1  8%  perf-profile.self=
.cycles-pp._raw_spin_lock_irqsave
>       0.24 =C2=B1  7%      -0.1        0.16 =C2=B1 15%  perf-profile.self=
.cycles-pp.menu_reflect
>       0.19 =C2=B1 20%      -0.1        0.10 =C2=B1 36%  perf-profile.self=
.cycles-pp.trigger_load_balance
>       0.16 =C2=B1 28%      -0.1        0.08 =C2=B1 30%  perf-profile.self=
.cycles-pp.get_next_timer_interrupt
>       0.10 =C2=B1 21%      -0.1        0.03 =C2=B1100%  perf-profile.self=
.cycles-pp.sys_imageblit
>       0.10 =C2=B1  8%      -0.1        0.04 =C2=B1 58%  perf-profile.self=
.cycles-pp.__hrtimer_get_next_event
>       0.17 =C2=B1 19%      -0.1        0.12 =C2=B1 11%  perf-profile.self=
.cycles-pp.kmem_cache_alloc
>       0.00            +0.1        0.06 =C2=B1 11%  perf-profile.self.cycl=
es-pp.file_free_rcu
>       0.10 =C2=B1 22%      +0.1        0.17 =C2=B1 15%  perf-profile.self=
.cycles-pp.down_write
>       0.06 =C2=B1 59%      +0.1        0.14 =C2=B1 21%  perf-profile.self=
.cycles-pp.update_blocked_averages
>       0.06 =C2=B1 77%      +0.1        0.13 =C2=B1 22%  perf-profile.self=
.cycles-pp.irq_exit
>       0.00            +0.1        0.08 =C2=B1 21%  perf-profile.self.cycl=
es-pp.switch_mm_irqs_off
>       0.03 =C2=B1100%      +0.1        0.11 =C2=B1 15%  perf-profile.self=
.cycles-pp.mem_cgroup_throttle_swaprate
>       0.00            +0.1        0.10 =C2=B1 37%  perf-profile.self.cycl=
es-pp.unmap_vmas
>       0.24 =C2=B1 25%      +0.1        0.34 =C2=B1 19%  perf-profile.self=
.cycles-pp.run_timer_softirq
>       0.14 =C2=B1 25%      +0.1        0.24 =C2=B1  6%  perf-profile.self=
.cycles-pp.mark_page_accessed
>       0.09 =C2=B1 41%      +0.1        0.21 =C2=B1  8%  perf-profile.self=
.cycles-pp.smp_call_function_single
>       0.18 =C2=B1 26%      +0.1        0.32 =C2=B1 21%  perf-profile.self=
.cycles-pp.vma_interval_tree_insert
>       0.31 =C2=B1 15%      +0.2        0.46 =C2=B1 22%  perf-profile.self=
.cycles-pp.find_busiest_group
>       0.03 =C2=B1105%      +0.2        0.22 =C2=B1 16%  perf-profile.self=
.cycles-pp.__slab_free
>       0.66 =C2=B1 10%      +0.2        0.86 =C2=B1  6%  perf-profile.self=
.cycles-pp._raw_spin_lock
>       0.26 =C2=B1 46%      +0.3        0.53 =C2=B1 19%  perf-profile.self=
.cycles-pp.clear_page_erms
>       0.00            +0.3        0.29 =C2=B1  2%  perf-profile.self.cycl=
es-pp.find_idlest_group
>       0.44 =C2=B1 16%      +0.3        0.75 =C2=B1 14%  perf-profile.self=
.cycles-pp.page_remove_rmap
>      41.34 =C2=B1  3%      +7.5       48.83 =C2=B1  2%  perf-profile.self=
.cycles-pp.intel_idle
>     357543          +322.3%    1510020 =C2=B1  3%  interrupts.CAL:Functio=
n_call_interrupts
>       2645 =C2=B1 51%    +489.2%      15586 =C2=B1 20%  interrupts.CPU0.C=
AL:Function_call_interrupts
>       7.25 =C2=B1173%  +1.6e+05%      11833 =C2=B1 26%  interrupts.CPU0.T=
LB:TLB_shootdowns
>       3409 =C2=B1  3%    +279.0%      12922 =C2=B1 11%  interrupts.CPU1.C=
AL:Function_call_interrupts
>       0.25 =C2=B1173%  +3.7e+06%       9274 =C2=B1 13%  interrupts.CPU1.T=
LB:TLB_shootdowns
>       3458 =C2=B1  2%    +250.3%      12114 =C2=B1 15%  interrupts.CPU10.=
CAL:Function_call_interrupts
>       6.25 =C2=B1118%  +1.9e+05%      11994 =C2=B1172%  interrupts.CPU10.=
RES:Rescheduling_interrupts
>       0.50 =C2=B1100%  +1.7e+06%       8366 =C2=B1 19%  interrupts.CPU10.=
TLB:TLB_shootdowns
>       3477          +348.3%      15590 =C2=B1  6%  interrupts.CPU100.CAL:=
Function_call_interrupts
>       0.50 =C2=B1100%  +2.4e+06%      11779 =C2=B1  9%  interrupts.CPU100=
.TLB:TLB_shootdowns
>       3476          +372.8%      16436 =C2=B1 10%  interrupts.CPU101.CAL:=
Function_call_interrupts
>       6.50 =C2=B1125%   +1557.7%     107.75 =C2=B1111%  interrupts.CPU101=
.RES:Rescheduling_interrupts
>       0.50 =C2=B1100%  +2.5e+06%      12599 =C2=B1 14%  interrupts.CPU101=
.TLB:TLB_shootdowns
>       3477          +365.9%      16202 =C2=B1 14%  interrupts.CPU102.CAL:=
Function_call_interrupts
>       0.75 =C2=B1 57%  +1.7e+06%      12392 =C2=B1 20%  interrupts.CPU102=
.TLB:TLB_shootdowns
>       3331 =C2=B1  2%    +374.8%      15817 =C2=B1  9%  interrupts.CPU103=
.CAL:Function_call_interrupts
>       0.00       +1.2e+106%      12023 =C2=B1 13%  interrupts.CPU103.TLB:=
TLB_shootdowns
>       3410          +259.7%      12267 =C2=B1 21%  interrupts.CPU11.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +3.4e+06%       8523 =C2=B1 28%  interrupts.CPU11.=
TLB:TLB_shootdowns
>       3457 =C2=B1  2%    +258.0%      12379 =C2=B1 15%  interrupts.CPU12.=
CAL:Function_call_interrupts
>       0.75 =C2=B1110%  +1.2e+06%       8641 =C2=B1 19%  interrupts.CPU12.=
TLB:TLB_shootdowns
>       3408          +280.9%      12985 =C2=B1 18%  interrupts.CPU13.CAL:F=
unction_call_interrupts
>      17.50 =C2=B1137%    +362.9%      81.00 =C2=B1 39%  interrupts.CPU13.=
RES:Rescheduling_interrupts
>       0.25 =C2=B1173%  +3.7e+06%       9246 =C2=B1 22%  interrupts.CPU13.=
TLB:TLB_shootdowns
>       3492          +246.8%      12109 =C2=B1 15%  interrupts.CPU14.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +3.3e+06%       8372 =C2=B1 19%  interrupts.CPU14.=
TLB:TLB_shootdowns
>       3490          +275.1%      13091 =C2=B1 17%  interrupts.CPU15.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +3.7e+06%       9298 =C2=B1 21%  interrupts.CPU15.=
TLB:TLB_shootdowns
>       3466          +297.2%      13768 =C2=B1 15%  interrupts.CPU16.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%    +4e+06%       9977 =C2=B1 18%  interrupts.CPU16.=
TLB:TLB_shootdowns
>       3489          +273.9%      13046 =C2=B1 20%  interrupts.CPU17.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +3.7e+06%       9232 =C2=B1 25%  interrupts.CPU17.=
TLB:TLB_shootdowns
>       3486          +271.2%      12941 =C2=B1 14%  interrupts.CPU18.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +3.7e+06%       9134 =C2=B1 18%  interrupts.CPU18.=
TLB:TLB_shootdowns
>       3484          +289.3%      13564 =C2=B1 23%  interrupts.CPU19.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +3.9e+06%       9756 =C2=B1 30%  interrupts.CPU19.=
TLB:TLB_shootdowns
>       3478 =C2=B1  2%    +290.4%      13580 =C2=B1 12%  interrupts.CPU2.C=
AL:Function_call_interrupts
>       1.00 =C2=B1173%  +9.8e+05%       9814 =C2=B1 15%  interrupts.CPU2.T=
LB:TLB_shootdowns
>       3482          +274.3%      13032 =C2=B1 14%  interrupts.CPU20.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +3.8e+06%       9489 =C2=B1 19%  interrupts.CPU20.=
TLB:TLB_shootdowns
>       3481          +270.1%      12886 =C2=B1 20%  interrupts.CPU21.CAL:F=
unction_call_interrupts
>       7.25 =C2=B1 85%    +631.0%      53.00 =C2=B1 59%  interrupts.CPU21.=
RES:Rescheduling_interrupts
>       0.25 =C2=B1173%  +3.6e+06%       9080 =C2=B1 26%  interrupts.CPU21.=
TLB:TLB_shootdowns
>       3479          +272.2%      12949 =C2=B1 15%  interrupts.CPU22.CAL:F=
unction_call_interrupts
>       0.50 =C2=B1100%  +1.8e+06%       9145 =C2=B1 18%  interrupts.CPU22.=
TLB:TLB_shootdowns
>       3478          +272.4%      12955 =C2=B1 15%  interrupts.CPU23.CAL:F=
unction_call_interrupts
>       8.75 =C2=B1115%  +15651.4%       1378 =C2=B1165%  interrupts.CPU23.=
RES:Rescheduling_interrupts
>       0.25 =C2=B1173%  +3.7e+06%       9152 =C2=B1 20%  interrupts.CPU23.=
TLB:TLB_shootdowns
>       3478          +274.7%      13033 =C2=B1 20%  interrupts.CPU24.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +3.7e+06%       9233 =C2=B1 27%  interrupts.CPU24.=
TLB:TLB_shootdowns
>       3477          +260.8%      12548 =C2=B1 19%  interrupts.CPU25.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +3.5e+06%       8750 =C2=B1 25%  interrupts.CPU25.=
TLB:TLB_shootdowns
>       3476          +427.2%      18327 =C2=B1 12%  interrupts.CPU26.CAL:F=
unction_call_interrupts
>      15.25 =C2=B1 82%   +3568.9%     559.50 =C2=B1161%  interrupts.CPU26.=
RES:Rescheduling_interrupts
>       2.25 =C2=B1148%  +6.5e+05%      14530 =C2=B1 17%  interrupts.CPU26.=
TLB:TLB_shootdowns
>       2680 =C2=B1 51%    +547.8%      17365 =C2=B1 20%  interrupts.CPU27.=
CAL:Function_call_interrupts
>      70.50 =C2=B1173%  +19183.7%      13595 =C2=B1 26%  interrupts.CPU27.=
TLB:TLB_shootdowns
>       3473          +416.5%      17941 =C2=B1 20%  interrupts.CPU28.CAL:F=
unction_call_interrupts
>       6.75 =C2=B1 67%    +888.9%      66.75 =C2=B1 85%  interrupts.CPU28.=
RES:Rescheduling_interrupts
>       1.50 =C2=B1173%  +9.4e+05%      14122 =C2=B1 27%  interrupts.CPU28.=
TLB:TLB_shootdowns
>       3420 =C2=B1  3%    +469.7%      19487 =C2=B1 18%  interrupts.CPU29.=
CAL:Function_call_interrupts
>       0.25 =C2=B1173%  +6.3e+06%      15666 =C2=B1 24%  interrupts.CPU29.=
TLB:TLB_shootdowns
>       3472 =C2=B1  2%    +262.9%      12601 =C2=B1  9%  interrupts.CPU3.C=
AL:Function_call_interrupts
>      48.75 =C2=B1172%  +18031.3%       8839 =C2=B1  9%  interrupts.CPU3.T=
LB:TLB_shootdowns
>       2660 =C2=B1 51%    +612.5%      18952 =C2=B1 26%  interrupts.CPU30.=
CAL:Function_call_interrupts
>      51.00 =C2=B1 74%    +121.6%     113.00 =C2=B1 10%  interrupts.CPU30.=
RES:Rescheduling_interrupts
>       0.25 =C2=B1173%  +6.1e+06%      15321 =C2=B1 33%  interrupts.CPU30.=
TLB:TLB_shootdowns
>       3470          +402.5%      17438 =C2=B1 15%  interrupts.CPU31.CAL:F=
unction_call_interrupts
>       7.25 =C2=B1165%  +1.9e+05%      13614 =C2=B1 20%  interrupts.CPU31.=
TLB:TLB_shootdowns
>       3448 =C2=B1  2%    +419.4%      17912 =C2=B1 22%  interrupts.CPU32.=
CAL:Function_call_interrupts
>       0.50 =C2=B1100%  +2.9e+06%      14282 =C2=B1 30%  interrupts.CPU32.=
TLB:TLB_shootdowns
>       3455          +411.5%      17674 =C2=B1 16%  interrupts.CPU33.CAL:F=
unction_call_interrupts
>       1.25 =C2=B1131%  +1.1e+06%      13862 =C2=B1 22%  interrupts.CPU33.=
TLB:TLB_shootdowns
>       3458          +379.8%      16592 =C2=B1 14%  interrupts.CPU34.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +5.4e+06%      13582 =C2=B1 19%  interrupts.CPU34.=
TLB:TLB_shootdowns
>       3458          +392.6%      17034 =C2=B1 16%  interrupts.CPU35.CAL:F=
unction_call_interrupts
>       0.50 =C2=B1100%  +2.7e+06%      13696 =C2=B1 19%  interrupts.CPU35.=
TLB:TLB_shootdowns
>       3457          +370.3%      16259 =C2=B1 10%  interrupts.CPU36.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +5.1e+06%      12747 =C2=B1 16%  interrupts.CPU36.=
TLB:TLB_shootdowns
>       3454          +389.2%      16900 =C2=B1 14%  interrupts.CPU37.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +5.4e+06%      13417 =C2=B1 21%  interrupts.CPU37.=
TLB:TLB_shootdowns
>       3450          +381.7%      16622 =C2=B1 12%  interrupts.CPU38.CAL:F=
unction_call_interrupts
>      62.25 =C2=B1 58%    +108.4%     129.75 =C2=B1 16%  interrupts.CPU38.=
RES:Rescheduling_interrupts
>       0.25 =C2=B1173%  +5.2e+06%      12980 =C2=B1 17%  interrupts.CPU38.=
TLB:TLB_shootdowns
>       3446          +365.2%      16031 =C2=B1  6%  interrupts.CPU39.CAL:F=
unction_call_interrupts
>       2193 =C2=B1173%    +456.4%      12203 =C2=B1 10%  interrupts.CPU39.=
TLB:TLB_shootdowns
>       3472 =C2=B1  2%    +305.0%      14060 =C2=B1 15%  interrupts.CPU4.C=
AL:Function_call_interrupts
>       0.00         +1e+106%      10300 =C2=B1 19%  interrupts.CPU4.TLB:TL=
B_shootdowns
>       3447          +359.9%      15856 =C2=B1  6%  interrupts.CPU40.CAL:F=
unction_call_interrupts
>      40.50 =C2=B1 86%    +221.0%     130.00 =C2=B1 24%  interrupts.CPU40.=
RES:Rescheduling_interrupts
>       0.25 =C2=B1173%  +4.8e+06%      12029 =C2=B1 10%  interrupts.CPU40.=
TLB:TLB_shootdowns
>       3474          +383.9%      16816 =C2=B1 13%  interrupts.CPU41.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +5.2e+06%      12988 =C2=B1 18%  interrupts.CPU41.=
TLB:TLB_shootdowns
>       3473          +397.4%      17278 =C2=B1 19%  interrupts.CPU42.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +5.4e+06%      13450 =C2=B1 26%  interrupts.CPU42.=
TLB:TLB_shootdowns
>       2674 =C2=B1 51%    +487.9%      15724 =C2=B1  6%  interrupts.CPU43.=
CAL:Function_call_interrupts
>       0.25 =C2=B1173%  +4.8e+06%      11898 =C2=B1  9%  interrupts.CPU43.=
TLB:TLB_shootdowns
>       3470          +346.0%      15479 =C2=B1  9%  interrupts.CPU44.CAL:F=
unction_call_interrupts
>      67.25 =C2=B1 60%     +86.6%     125.50 =C2=B1 18%  interrupts.CPU44.=
RES:Rescheduling_interrupts
>       0.25 =C2=B1173%  +4.7e+06%      11652 =C2=B1 12%  interrupts.CPU44.=
TLB:TLB_shootdowns
>       3471          +374.7%      16478 =C2=B1  2%  interrupts.CPU45.CAL:F=
unction_call_interrupts
>       0.75 =C2=B1110%  +1.7e+06%      12653 =C2=B1  3%  interrupts.CPU45.=
TLB:TLB_shootdowns
>       3495 =C2=B1  2%    +353.8%      15862 =C2=B1  4%  interrupts.CPU46.=
CAL:Function_call_interrupts
>       0.75 =C2=B1 57%  +1.6e+06%      12037 =C2=B1  6%  interrupts.CPU46.=
TLB:TLB_shootdowns
>       3468          +380.7%      16673 =C2=B1  2%  interrupts.CPU47.CAL:F=
unction_call_interrupts
>       3.75 =C2=B1115%  +3.4e+05%      12848 =C2=B1  5%  interrupts.CPU47.=
TLB:TLB_shootdowns
>       3518          +397.0%      17487 =C2=B1 16%  interrupts.CPU48.CAL:F=
unction_call_interrupts
>       1.00 =C2=B1100%   +5575.0%      56.75 =C2=B1 73%  interrupts.CPU48.=
RES:Rescheduling_interrupts
>       0.25 =C2=B1173%  +5.5e+06%      13665 =C2=B1 22%  interrupts.CPU48.=
TLB:TLB_shootdowns
>       3491          +376.2%      16627 =C2=B1 11%  interrupts.CPU49.CAL:F=
unction_call_interrupts
>       1.25 =C2=B1 87%    +1e+06%      12803 =C2=B1 15%  interrupts.CPU49.=
TLB:TLB_shootdowns
>       3472 =C2=B1  2%    +284.3%      13343 =C2=B1 12%  interrupts.CPU5.C=
AL:Function_call_interrupts
>       0.00       +9.6e+105%       9586 =C2=B1 15%  interrupts.CPU5.TLB:TL=
B_shootdowns
>       3490          +382.7%      16848 =C2=B1  3%  interrupts.CPU50.CAL:F=
unction_call_interrupts
>       0.75 =C2=B1 57%  +1.7e+06%      13041 =C2=B1  6%  interrupts.CPU50.=
TLB:TLB_shootdowns
>       3414          +397.7%      16995 =C2=B1  9%  interrupts.CPU51.CAL:F=
unction_call_interrupts
>      32.75 =C2=B1 17%    +235.9%     110.00 =C2=B1 69%  interrupts.CPU51.=
RES:Rescheduling_interrupts
>       0.50 =C2=B1100%  +2.7e+06%      13285 =C2=B1 13%  interrupts.CPU51.=
TLB:TLB_shootdowns
>       3490          +175.5%       9615 =C2=B1 46%  interrupts.CPU52.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +2.3e+06%       5793 =C2=B1 73%  interrupts.CPU52.=
TLB:TLB_shootdowns
>       3488          +248.1%      12142 =C2=B1 20%  interrupts.CPU53.CAL:F=
unction_call_interrupts
>       0.00       +8.3e+105%       8322 =C2=B1 26%  interrupts.CPU53.TLB:T=
LB_shootdowns
>       3489          +230.8%      11543 =C2=B1 26%  interrupts.CPU54.CAL:F=
unction_call_interrupts
>       0.00       +7.7e+105%       7715 =C2=B1 35%  interrupts.CPU54.TLB:T=
LB_shootdowns
>       3485          +259.9%      12543 =C2=B1 20%  interrupts.CPU55.CAL:F=
unction_call_interrupts
>       2195 =C2=B1173%    +297.6%       8727 =C2=B1 26%  interrupts.CPU55.=
TLB:TLB_shootdowns
>       3484          +223.8%      11282 =C2=B1 26%  interrupts.CPU56.CAL:F=
unction_call_interrupts
>       0.00       +7.5e+105%       7470 =C2=B1 36%  interrupts.CPU56.TLB:T=
LB_shootdowns
>       3489          +244.2%      12012 =C2=B1 20%  interrupts.CPU57.CAL:F=
unction_call_interrupts
>       2.00 =C2=B1100%  +4.1e+05%       8222 =C2=B1 27%  interrupts.CPU57.=
TLB:TLB_shootdowns
>       3486          +245.2%      12034 =C2=B1 19%  interrupts.CPU58.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +3.3e+06%       8222 =C2=B1 26%  interrupts.CPU58.=
TLB:TLB_shootdowns
>       3485          +271.3%      12938 =C2=B1 12%  interrupts.CPU59.CAL:F=
unction_call_interrupts
>       0.50 =C2=B1100%  +2.2e+06%      10986 =C2=B1 23%  interrupts.CPU59.=
TLB:TLB_shootdowns
>       3468 =C2=B1  2%    +278.5%      13130 =C2=B1 24%  interrupts.CPU6.C=
AL:Function_call_interrupts
>       3.00 =C2=B1173%  +3.1e+05%       9373 =C2=B1 31%  interrupts.CPU6.T=
LB:TLB_shootdowns
>       3483          +249.0%      12154 =C2=B1 18%  interrupts.CPU60.CAL:F=
unction_call_interrupts
>       1.25 =C2=B1131%   +7620.0%      96.50 =C2=B1 44%  interrupts.CPU60.=
RES:Rescheduling_interrupts
>      18.75 =C2=B1170%  +53997.3%      10143 =C2=B1 38%  interrupts.CPU60.=
TLB:TLB_shootdowns
>       3481          +244.3%      11987 =C2=B1 14%  interrupts.CPU61.CAL:F=
unction_call_interrupts
>       0.50 =C2=B1100%  +1.6e+06%       8143 =C2=B1 19%  interrupts.CPU61.=
TLB:TLB_shootdowns
>       3481          +276.8%      13116 =C2=B1 17%  interrupts.CPU62.CAL:F=
unction_call_interrupts
>      22.00 =C2=B1157%    +354.5%     100.00 =C2=B1 28%  interrupts.CPU62.=
RES:Rescheduling_interrupts
>       0.50 =C2=B1100%  +1.9e+06%       9274 =C2=B1 21%  interrupts.CPU62.=
TLB:TLB_shootdowns
>       3480          +275.0%      13050 =C2=B1 10%  interrupts.CPU63.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +3.7e+06%       9218 =C2=B1 11%  interrupts.CPU63.=
TLB:TLB_shootdowns
>       3479          +265.5%      12716 =C2=B1 14%  interrupts.CPU64.CAL:F=
unction_call_interrupts
>       1.50 =C2=B1137%   +5000.0%      76.50 =C2=B1 54%  interrupts.CPU64.=
RES:Rescheduling_interrupts
>       0.25 =C2=B1173%  +3.6e+06%       8878 =C2=B1 17%  interrupts.CPU64.=
TLB:TLB_shootdowns
>       3479          +249.8%      12168 =C2=B1 14%  interrupts.CPU65.CAL:F=
unction_call_interrupts
>       5.00 =C2=B1 58%   +2005.0%     105.25 =C2=B1 27%  interrupts.CPU65.=
RES:Rescheduling_interrupts
>       0.25 =C2=B1173%  +3.3e+06%       8331 =C2=B1 18%  interrupts.CPU65.=
TLB:TLB_shootdowns
>       3477          +275.6%      13061 =C2=B1 16%  interrupts.CPU66.CAL:F=
unction_call_interrupts
>       1.00 =C2=B1122%   +8900.0%      90.00 =C2=B1 37%  interrupts.CPU66.=
RES:Rescheduling_interrupts
>       0.25 =C2=B1173%  +3.7e+06%       9224 =C2=B1 20%  interrupts.CPU66.=
TLB:TLB_shootdowns
>       3475          +251.2%      12208 =C2=B1 13%  interrupts.CPU67.CAL:F=
unction_call_interrupts
>       0.50 =C2=B1100%  +1.7e+06%       8372 =C2=B1 17%  interrupts.CPU67.=
TLB:TLB_shootdowns
>       3456          +231.4%      11454 =C2=B1 18%  interrupts.CPU68.CAL:F=
unction_call_interrupts
>       1.25 =C2=B1131%   +6900.0%      87.50 =C2=B1 37%  interrupts.CPU68.=
RES:Rescheduling_interrupts
>       0.25 =C2=B1173%    +3e+06%       7617 =C2=B1 24%  interrupts.CPU68.=
TLB:TLB_shootdowns
>       3429 =C2=B1  2%    +260.1%      12350 =C2=B1 12%  interrupts.CPU69.=
CAL:Function_call_interrupts
>       0.00       +8.5e+105%       8517 =C2=B1 14%  interrupts.CPU69.TLB:T=
LB_shootdowns
>       3492          +248.9%      12183 =C2=B1 23%  interrupts.CPU7.CAL:Fu=
nction_call_interrupts
>      29.50 =C2=B1149%  +15107.6%       4486 =C2=B1168%  interrupts.CPU7.R=
ES:Rescheduling_interrupts
>       0.50 =C2=B1100%  +1.7e+06%       8430 =C2=B1 31%  interrupts.CPU7.T=
LB:TLB_shootdowns
>       3472          +253.2%      12266 =C2=B1 15%  interrupts.CPU70.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +3.4e+06%       8430 =C2=B1 18%  interrupts.CPU70.=
TLB:TLB_shootdowns
>       3471          +239.4%      11782 =C2=B1 17%  interrupts.CPU71.CAL:F=
unction_call_interrupts
>       0.50 =C2=B1173%  +1.6e+06%       7956 =C2=B1 23%  interrupts.CPU71.=
TLB:TLB_shootdowns
>       3469          +248.0%      12074 =C2=B1 17%  interrupts.CPU72.CAL:F=
unction_call_interrupts
>       0.50 =C2=B1173%  +15050.0%      75.75 =C2=B1 24%  interrupts.CPU72.=
RES:Rescheduling_interrupts
>       0.25 =C2=B1173%  +3.3e+06%       8243 =C2=B1 22%  interrupts.CPU72.=
TLB:TLB_shootdowns
>       3469          +254.0%      12280 =C2=B1 11%  interrupts.CPU73.CAL:F=
unction_call_interrupts
>       2.50 =C2=B1128%   +3860.0%      99.00 =C2=B1 31%  interrupts.CPU73.=
RES:Rescheduling_interrupts
>       0.25 =C2=B1173%  +3.4e+06%       8427 =C2=B1 12%  interrupts.CPU73.=
TLB:TLB_shootdowns
>       3468          +257.1%      12387 =C2=B1 14%  interrupts.CPU74.CAL:F=
unction_call_interrupts
>       8.25 =C2=B1121%    +775.8%      72.25 =C2=B1 44%  interrupts.CPU74.=
RES:Rescheduling_interrupts
>       0.50 =C2=B1100%  +1.7e+06%       8559 =C2=B1 18%  interrupts.CPU74.=
TLB:TLB_shootdowns
>       3468          +255.3%      12322 =C2=B1 19%  interrupts.CPU75.CAL:F=
unction_call_interrupts
>       0.50 =C2=B1100%  +1.7e+06%       8495 =C2=B1 24%  interrupts.CPU75.=
TLB:TLB_shootdowns
>       3467          +250.0%      12137 =C2=B1 19%  interrupts.CPU76.CAL:F=
unction_call_interrupts
>       0.75 =C2=B1110%  +1.1e+06%       8313 =C2=B1 25%  interrupts.CPU76.=
TLB:TLB_shootdowns
>       3441          +265.6%      12582 =C2=B1 15%  interrupts.CPU77.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +3.5e+06%       8813 =C2=B1 18%  interrupts.CPU77.=
TLB:TLB_shootdowns
>       3465          +323.2%      14662 =C2=B1  4%  interrupts.CPU78.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +4.4e+06%      10885 =C2=B1  8%  interrupts.CPU78.=
TLB:TLB_shootdowns
>       3463          +351.8%      15647 =C2=B1 11%  interrupts.CPU79.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +4.7e+06%      11825 =C2=B1 14%  interrupts.CPU79.=
TLB:TLB_shootdowns
>       3463 =C2=B1  2%    +279.6%      13149 =C2=B1 27%  interrupts.CPU8.C=
AL:Function_call_interrupts
>       1.25 =C2=B1131%  +7.5e+05%       9397 =C2=B1 35%  interrupts.CPU8.T=
LB:TLB_shootdowns
>       3462          +337.6%      15153 =C2=B1 12%  interrupts.CPU80.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +4.5e+06%      11331 =C2=B1 16%  interrupts.CPU80.=
TLB:TLB_shootdowns
>       3462          +288.8%      13461 =C2=B1  5%  interrupts.CPU81.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +3.9e+06%       9691 =C2=B1  6%  interrupts.CPU81.=
TLB:TLB_shootdowns
>       3462          +301.1%      13886 =C2=B1 14%  interrupts.CPU82.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +4.1e+06%      10142 =C2=B1 19%  interrupts.CPU82.=
TLB:TLB_shootdowns
>       3461          +347.0%      15469 =C2=B1 11%  interrupts.CPU83.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +4.7e+06%      11739 =C2=B1 16%  interrupts.CPU83.=
TLB:TLB_shootdowns
>       3472          +321.1%      14621 =C2=B1  7%  interrupts.CPU84.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +4.4e+06%      11024 =C2=B1  9%  interrupts.CPU84.=
TLB:TLB_shootdowns
>       3471          +336.2%      15144 =C2=B1  8%  interrupts.CPU85.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +4.6e+06%      11460 =C2=B1 12%  interrupts.CPU85.=
TLB:TLB_shootdowns
>       3470          +339.7%      15258 =C2=B1 10%  interrupts.CPU86.CAL:F=
unction_call_interrupts
>       0.50 =C2=B1100%  +2.7e+06%      13580 =C2=B1 34%  interrupts.CPU86.=
TLB:TLB_shootdowns
>       3486          +345.2%      15522 =C2=B1 11%  interrupts.CPU87.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +4.7e+06%      11707 =C2=B1 16%  interrupts.CPU87.=
TLB:TLB_shootdowns
>       3484          +369.6%      16363 =C2=B1  6%  interrupts.CPU88.CAL:F=
unction_call_interrupts
>       0.50 =C2=B1100%  +2.5e+06%      12554 =C2=B1 10%  interrupts.CPU88.=
TLB:TLB_shootdowns
>       3483          +349.2%      15645 =C2=B1  7%  interrupts.CPU89.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +4.7e+06%      11859 =C2=B1 10%  interrupts.CPU89.=
TLB:TLB_shootdowns
>       3460 =C2=B1  2%    +281.1%      13186 =C2=B1 19%  interrupts.CPU9.C=
AL:Function_call_interrupts
>       0.25 =C2=B1173%  +3.8e+06%       9436 =C2=B1 24%  interrupts.CPU9.T=
LB:TLB_shootdowns
>       3484          +362.5%      16113 =C2=B1  8%  interrupts.CPU90.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +4.9e+06%      12297 =C2=B1 12%  interrupts.CPU90.=
TLB:TLB_shootdowns
>       3430 =C2=B1  2%    +395.9%      17011 =C2=B1 12%  interrupts.CPU91.=
CAL:Function_call_interrupts
>       0.25 =C2=B1173%  +5.3e+06%      13196 =C2=B1 17%  interrupts.CPU91.=
TLB:TLB_shootdowns
>       3482          +392.0%      17133 =C2=B1 12%  interrupts.CPU92.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +5.3e+06%      13318 =C2=B1 17%  interrupts.CPU92.=
TLB:TLB_shootdowns
>       3482          +363.3%      16131 =C2=B1  4%  interrupts.CPU93.CAL:F=
unction_call_interrupts
>       1.25 =C2=B1131%  +9.9e+05%      12318 =C2=B1  8%  interrupts.CPU93.=
TLB:TLB_shootdowns
>       3480          +351.3%      15708 =C2=B1  2%  interrupts.CPU94.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +4.8e+06%      11894 =C2=B1  4%  interrupts.CPU94.=
TLB:TLB_shootdowns
>       3480          +396.0%      17263 =C2=B1 15%  interrupts.CPU95.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +5.4e+06%      13450 =C2=B1 21%  interrupts.CPU95.=
TLB:TLB_shootdowns
>       3477          +405.2%      17566 =C2=B1 20%  interrupts.CPU96.CAL:F=
unction_call_interrupts
>      10.50 =C2=B1 87%    +650.0%      78.75 =C2=B1 71%  interrupts.CPU96.=
RES:Rescheduling_interrupts
>       3.25 =C2=B1155%  +4.2e+05%      13754 =C2=B1 27%  interrupts.CPU96.=
TLB:TLB_shootdowns
>       3451          +376.7%      16453 =C2=B1 16%  interrupts.CPU97.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%  +5.1e+06%      12666 =C2=B1 23%  interrupts.CPU97.=
TLB:TLB_shootdowns
>       3478          +394.3%      17193 =C2=B1 16%  interrupts.CPU98.CAL:F=
unction_call_interrupts
>       0.50 =C2=B1100%  +2.7e+06%      13381 =C2=B1 21%  interrupts.CPU98.=
TLB:TLB_shootdowns
>       3477          +367.8%      16265 =C2=B1 14%  interrupts.CPU99.CAL:F=
unction_call_interrupts
>       0.25 =C2=B1173%    +5e+06%      12505 =C2=B1 21%  interrupts.CPU99.=
TLB:TLB_shootdowns
>     239059 =C2=B1 14%     -87.3%      30318 =C2=B1 52%  interrupts.RES:Re=
scheduling_interrupts
>       4589 =C2=B1 93%  +24377.6%    1123462 =C2=B1  2%  interrupts.TLB:TL=
B_shootdowns
>
>
>
>                             unixbench.time.user_time
>
>   90 +-+-----------------------------------------------------------------=
---+
>      |                +                +                                 =
   |
>   80 +-++.           +:               +:                 +.             .=
+  |
>   70 +-+  +.++.+.+.++ :  +.+.++.+  +.+ :  +.+.++.+  +.+.+  +.++.+.+.++.+ =
 +.|
>      O OO O OO O O OO O OO O OO O OO O O OO O OO O  :                    =
   |
>   60 +-+               : :      :  :    : :      :  :                    =
   |
>   50 +-+               : :       : :    : :       : :                    =
   |
>      |                 : :       : :    : :       : :                    =
   |
>   40 +-+               : :       : :    : :       : :                    =
   |
>   30 +-+               ::        ::     ::        ::                     =
   |
>      |                 ::        ::     ::        ::                     =
   |
>   20 +-+                :        ::      :        ::                     =
   |
>   10 +-+                :         :      :         :                     =
   |
>      |                  :         :      :         :                     =
   |
>    0 +-+-----------------------------------------------------------------=
---+
>
>
>                             unixbench.time.system_time
>
>   250 +-+----------------------------------------------------------------=
---+
>       O.OO.O.OO.O.OO.O.OO O.OO.O.OO O.OO O OO.O.OO   + .+.+ .+.++.+.++.+.=
++.|
>       |                +  :      :  :  +   :     :   :+    +             =
   |
>   200 +-+              :  :      :  :  :   :     :   :                   =
   |
>       |                :  :      :  :  :   :     :   :                   =
   |
>       |                : :       : :    : :       : :                    =
   |
>   150 +-+              : :       : :    : :       : :                    =
   |
>       |                : :       : :    : :       : :                    =
   |
>   100 +-+               ::        ::    : :       : :                    =
   |
>       |                 ::        ::    : :       : :                    =
   |
>       |                 ::        ::    : :       : :                    =
   |
>    50 +-+               :         :      :         :                     =
   |
>       |                 :         :      :         :                     =
   |
>       |                 :         :      :         :                     =
   |
>     0 +-+----------------------------------------------------------------=
---+
>
>
>                           unixbench.time.minor_page_faults
>
>   7e+07 +-+--------------------------------------------------------------=
---+
>         |.++.++.+.++.+.++  +.+.++.+  +.++   ++.++.+  +.+.++.++.+.++.+.++.=
++.|
>   6e+07 +-+             :  :      :  :  :   :     :  :                   =
   |
>         O OO OO O OO O OO OO O OO O OO OO O OO OO O  :                   =
   |
>   5e+07 +-+             :  :      :  :  :   :     :  :                   =
   |
>         |                : :       : :   : :       : :                   =
   |
>   4e+07 +-+              : :       : :   : :       : :                   =
   |
>         |                : :       : :   : :       : :                   =
   |
>   3e+07 +-+              ::        ::    : :       ::                    =
   |
>         |                ::        ::    : :       ::                    =
   |
>   2e+07 +-+              ::        ::    : :       ::                    =
   |
>         |                 :         :     :         :                    =
   |
>   1e+07 +-+               :         :     :         :                    =
   |
>         |                 :         :     :         :                    =
   |
>       0 +-+--------------------------------------------------------------=
---+
>
>
>                       unixbench.time.involuntary_context_switches
>
>   1.2e+06 +-+------------------------------------------------------------=
---+
>           O OO OO OO O OO OO OO O OO OO OO O OO OO O                     =
   |
>     1e+06 +-+                                                            =
   |
>           |                                                              =
   |
>           |                                                              =
   |
>    800000 +-+                                                            =
   |
>           |                                                              =
   |
>    600000 +-+                                                            =
   |
>           |                                                              =
   |
>    400000 +-+                                                            =
   |
>           |                                                              =
   |
>           |                                                              =
   |
>    200000 +-+                                                            =
   |
>           |.++.++.++.+.++.+ .++.+.++. +.++. .++.++.+ .+.++.++.++.+.++.++.=
++.|
>         0 +-+------------------------------------------------------------=
---+
>
>
>                                   unixbench.score
>
>   1200 +-+---------------------------------------------------------------=
---+
>        |             .++   ++.+.++   ++.+  +.++.+.+  +.+     +.   +.++.+.=
   |
>   1000 +-++.+.++.+.++  :   :     :   :  :  :      :  :  +.+.+  +.+       =
++.|
>        O    O          :   :     :   :  :  :      :  :                   =
   |
>        | OO   OO O OO OO O OO O OO O OO O OO OO O O  :                   =
   |
>    800 +-+              : :       : :    : :      : :                    =
   |
>        |                : :       : :    : :      : :                    =
   |
>    600 +-+              : :       : :    : :      : :                    =
   |
>        |                : :       : :    ::        ::                    =
   |
>    400 +-+              : :       : :    ::        ::                    =
   |
>        |                : :       : :    ::        ::                    =
   |
>        |                 :         :      :        :                     =
   |
>    200 +-+               :         :      :        :                     =
   |
>        |                 :         :      :        :                     =
   |
>      0 +-+---------------------------------------------------------------=
---+
>
>
>                                   unixbench.workload
>
>   1.6e+06 +-+------------------------------------------------------------=
---+
>           |.++.++.++.+.++ :  ++.+.++  +.+:   ++.++.+  +.++.++.++.+.++.++.=
++.|
>   1.4e+06 +-+             :  :     :  :  :   :     :  :                  =
   |
>           O OO OO OO O OO OO OO O OO OO OO O OO OO O  :                  =
   |
>   1.2e+06 +-+             :  :     :  :   :  :     :  :                  =
   |
>     1e+06 +-+             : :       : :   : :      : :                   =
   |
>           |               : :       : :   : :      : :                   =
   |
>    800000 +-+              ::       : :   : :      : :                   =
   |
>           |                ::       ::    : :       ::                   =
   |
>    600000 +-+              ::       ::    : :       ::                   =
   |
>    400000 +-+              ::       ::    : :       ::                   =
   |
>           |                :         :     :        :                    =
   |
>    200000 +-+              :         :     :        :                    =
   |
>           |                :         :     :        :                    =
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
> lkp-skl-fpga01: 104 threads Skylake with 192G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/=
testcase:
>   gcc-7/performance/x86_64-rhel-7.6/1/debian-x86_64-2019-05-14.cgz/300s/l=
kp-skl-fpga01/shell8/unixbench
>
> commit:
>   2871f4abd7 ("sched/fair: optimize find_idlest_group")
>   04dfd1bca6 ("sched/fair: rework find_idlest_group")
>
> 2871f4abd7cefa0c 04dfd1bca609c5d1c8b7e073f72
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>       9665            -2.9%       9381        unixbench.score
>       2989 =C2=B1  2%  +14240.0%     428693        unixbench.time.involun=
tary_context_switches
>   44610754            -3.1%   43231305        unixbench.time.minor_page_f=
aults
>     166.79            +2.6%     171.09        unixbench.time.system_time
>     208.34            -2.2%     203.75        unixbench.time.user_time
>    1311817            -5.6%    1238678        unixbench.time.voluntary_co=
ntext_switches
>     365352            -2.9%     354611        unixbench.workload
>       7021 =C2=B1  7%      -8.7%       6409 =C2=B1  3%  meminfo.PageTables
>       0.16 =C2=B1 97%      -0.2        0.00 =C2=B1 88%  mpstat.cpu.all.so=
ft%
>      51613           +31.7%      67960        vmstat.system.cs
>     203943            +2.0%     208122        vmstat.system.in
>    1105766          +727.8%    9153035        cpuidle.C1.time
>      71977          +137.2%     170760        cpuidle.C1.usage
>     148592 =C2=B1  2%     +41.6%     210365        cpuidle.POLL.time
>       8.66 =C2=B1  7%      -0.7        8.00        turbostat.Busy%
>      70029          +141.9%     169426        turbostat.C1
>       0.02            +0.1        0.13        turbostat.C1%
>       6.71 =C2=B1 82%     -84.5%       1.04 =C2=B1 12%  turbostat.CPU%c6
>      79.03            +4.4%      82.53        turbostat.RAMWatt
>      32260 =C2=B1  5%     +25.4%      40440 =C2=B1  4%  numa-meminfo.node=
0.KReclaimable
>      32260 =C2=B1  5%     +25.4%      40440 =C2=B1  4%  numa-meminfo.node=
0.SReclaimable
>     119681 =C2=B1  6%     +13.8%     136181 =C2=B1  3%  numa-meminfo.node=
0.Slab
>      19253 =C2=B1 24%     -38.3%      11883 =C2=B1 30%  numa-meminfo.node=
1.Inactive
>      19165 =C2=B1 25%     -38.5%      11789 =C2=B1 31%  numa-meminfo.node=
1.Inactive(anon)
>      42295 =C2=B1  4%     -13.6%      36538 =C2=B1  5%  numa-meminfo.node=
1.KReclaimable
>      20367 =C2=B1 12%     -25.8%      15108 =C2=B1 19%  numa-meminfo.node=
1.Mapped
>      42295 =C2=B1  4%     -13.6%      36538 =C2=B1  5%  numa-meminfo.node=
1.SReclaimable
>      20091 =C2=B1 22%     -39.0%      12258 =C2=B1 30%  numa-meminfo.node=
1.Shmem
>       3348 =C2=B1  9%     +41.8%       4748 =C2=B1 14%  numa-vmstat.node0=
.nr_mapped
>       8065 =C2=B1  5%     +25.3%      10109 =C2=B1  4%  numa-vmstat.node0=
.nr_slab_reclaimable
>     161903 =C2=B1  3%     -73.6%      42725 =C2=B1129%  numa-vmstat.node0=
.numa_other
>       4791 =C2=B1 25%     -38.5%       2946 =C2=B1 31%  numa-vmstat.node1=
.nr_inactive_anon
>       5107 =C2=B1 11%     -25.2%       3821 =C2=B1 18%  numa-vmstat.node1=
.nr_mapped
>       5022 =C2=B1 22%     -39.0%       3064 =C2=B1 30%  numa-vmstat.node1=
.nr_shmem
>      10574 =C2=B1  4%     -13.6%       9133 =C2=B1  5%  numa-vmstat.node1=
.nr_slab_reclaimable
>       4791 =C2=B1 25%     -38.5%       2946 =C2=B1 31%  numa-vmstat.node1=
.nr_zone_inactive_anon
>      35382 =C2=B1 19%    +336.8%     154562 =C2=B1 35%  numa-vmstat.node1=
.numa_other
>      16905            +3.3%      17467        proc-vmstat.nr_kernel_stack
>       1754 =C2=B1  4%      -6.5%       1640 =C2=B1  5%  proc-vmstat.nr_pa=
ge_table_pages
>      18638            +3.2%      19244        proc-vmstat.nr_slab_reclaim=
able
>      44076            +8.1%      47634        proc-vmstat.nr_slab_unrecla=
imable
>   34710081            -3.4%   33519012        proc-vmstat.numa_hit
>   34676359            -3.4%   33485351        proc-vmstat.numa_local
>   36953543            -3.0%   35835435        proc-vmstat.pgalloc_normal
>   44806280            -3.1%   43431003        proc-vmstat.pgfault
>   36895855            -3.0%   35771972        proc-vmstat.pgfree
>     649741            -2.9%     630615        proc-vmstat.unevictable_pgs=
_culled
>      15531           +12.5%      17476 =C2=B1  5%  softirqs.CPU0.SCHED
>      19210 =C2=B1  6%     +19.6%      22972 =C2=B1  6%  softirqs.CPU1.RCU
>      16109            +9.0%      17566 =C2=B1  4%  softirqs.CPU28.RCU
>      15615           +14.7%      17917 =C2=B1  5%  softirqs.CPU29.RCU
>       9356 =C2=B1  3%     +11.8%      10456 =C2=B1  3%  softirqs.CPU30.SC=
HED
>      12113 =C2=B1 14%     -19.2%       9791        softirqs.CPU46.SCHED
>      14553 =C2=B1 27%     -31.9%       9905 =C2=B1  2%  softirqs.CPU48.SC=
HED
>      18034 =C2=B1  2%     +14.7%      20677 =C2=B1  8%  softirqs.CPU55.RCU
>      16660           +21.9%      20304 =C2=B1 10%  softirqs.CPU59.RCU
>      20658 =C2=B1  2%     +14.2%      23591 =C2=B1  5%  softirqs.CPU6.RCU
>      19316 =C2=B1  3%     +15.1%      22228 =C2=B1  3%  softirqs.CPU65.RCU
>      19189 =C2=B1  2%     +19.6%      22951 =C2=B1  8%  softirqs.CPU67.RCU
>      15100 =C2=B1  4%     +16.2%      17548 =C2=B1  3%  softirqs.CPU77.RCU
>      18748 =C2=B1  2%     +18.0%      22115 =C2=B1  5%  softirqs.CPU79.RCU
>       0.08 =C2=B1 38%     -76.4%       0.02 =C2=B1 81%  sched_debug.cfs_r=
q:/.exec_clock.avg
>       4.34 =C2=B1 15%     -74.4%       1.11 =C2=B1 66%  sched_debug.cfs_r=
q:/.exec_clock.max
>       0.48 =C2=B1 22%     -72.7%       0.13 =C2=B1 73%  sched_debug.cfs_r=
q:/.exec_clock.stddev
>       1906 =C2=B1  4%     +67.3%       3188 =C2=B1 14%  sched_debug.cfs_r=
q:/.load.avg
>      20017 =C2=B1  3%     +85.7%      37164 =C2=B1 16%  sched_debug.cfs_r=
q:/.load.max
>       5298           +51.5%       8028 =C2=B1 11%  sched_debug.cfs_rq:/.l=
oad.stddev
>      10661 =C2=B1  5%     -16.8%       8869 =C2=B1 14%  sched_debug.cfs_r=
q:/.min_vruntime.min
>       0.12 =C2=B1  9%     +29.4%       0.15 =C2=B1  8%  sched_debug.cfs_r=
q:/.nr_running.avg
>       1.49 =C2=B1  5%     +47.9%       2.21 =C2=B1 13%  sched_debug.cfs_r=
q:/.runnable_load_avg.avg
>       4.42           +22.1%       5.40 =C2=B1  7%  sched_debug.cfs_rq:/.r=
unnable_load_avg.stddev
>       1906 =C2=B1  4%     +33.4%       2543 =C2=B1  9%  sched_debug.cfs_r=
q:/.runnable_weight.avg
>       5298           +14.1%       6046 =C2=B1  4%  sched_debug.cfs_rq:/.r=
unnable_weight.stddev
>       3693 =C2=B1 10%     -95.4%     171.59 =C2=B11586%  sched_debug.cfs_=
rq:/.spread0.avg
>      -2330          +201.4%      -7025        sched_debug.cfs_rq:/.spread=
0.min
>       1024           +39.0%       1423 =C2=B1 14%  sched_debug.cfs_rq:/.u=
til_avg.max
>     246.92 =C2=B1  2%     +34.7%     332.62 =C2=B1  9%  sched_debug.cfs_r=
q:/.util_avg.stddev
>       3.14 =C2=B1  9%     -17.1%       2.61 =C2=B1  6%  sched_debug.cpu.c=
lock.stddev
>       3.14 =C2=B1  9%     -17.1%       2.61 =C2=B1  6%  sched_debug.cpu.c=
lock_task.stddev
>      10683 =C2=B1  5%     +21.4%      12972 =C2=B1  9%  sched_debug.cpu.n=
r_switches.max
>      16.00 =C2=B1  6%    +209.4%      49.50 =C2=B1 15%  sched_debug.cpu.n=
r_uninterruptible.max
>     -19.50           +38.5%     -27.00        sched_debug.cpu.nr_uninterr=
uptible.min
>       6.36 =C2=B1  5%     +57.9%      10.04 =C2=B1  6%  sched_debug.cpu.n=
r_uninterruptible.stddev
>      12.74 =C2=B1 59%     -58.0%       5.35 =C2=B1130%  sched_debug.cpu.s=
ched_count.avg
>     550.50 =C2=B1 63%     -74.3%     141.75 =C2=B1127%  sched_debug.cpu.s=
ched_count.max
>      77.35 =C2=B1 62%     -65.4%      26.75 =C2=B1130%  sched_debug.cpu.s=
ched_count.stddev
>       0.88 =C2=B1 88%     -74.0%       0.23 =C2=B1141%  sched_debug.cpu.t=
twu_count.avg
>      44.00 =C2=B1 93%     -85.2%       6.50 =C2=B1137%  sched_debug.cpu.t=
twu_count.max
>       6.14 =C2=B1 91%     -80.8%       1.18 =C2=B1138%  sched_debug.cpu.t=
twu_count.stddev
>      36201 =C2=B1  2%     +26.6%      45833        slabinfo.anon_vma.acti=
ve_objs
>     790.50 =C2=B1  2%     +26.2%     998.00        slabinfo.anon_vma.acti=
ve_slabs
>      36378 =C2=B1  2%     +26.3%      45942        slabinfo.anon_vma.num_=
objs
>     790.50 =C2=B1  2%     +26.2%     998.00        slabinfo.anon_vma.num_=
slabs
>      56517 =C2=B1  4%     +18.3%      66882        slabinfo.anon_vma_chai=
n.active_objs
>     886.00 =C2=B1  4%     +18.3%       1048        slabinfo.anon_vma_chai=
n.active_slabs
>      56709 =C2=B1  4%     +18.3%      67095        slabinfo.anon_vma_chai=
n.num_objs
>     886.00 =C2=B1  4%     +18.3%       1048        slabinfo.anon_vma_chai=
n.num_slabs
>       5798 =C2=B1  3%    +391.1%      28473 =C2=B1  5%  slabinfo.cred_jar=
.active_objs
>     137.50 =C2=B1  4%    +392.9%     677.75 =C2=B1  5%  slabinfo.cred_jar=
.active_slabs
>       5798 =C2=B1  3%    +391.3%      28489 =C2=B1  5%  slabinfo.cred_jar=
.num_objs
>     137.50 =C2=B1  4%    +392.9%     677.75 =C2=B1  5%  slabinfo.cred_jar=
.num_slabs
>      94553            +9.8%     103804        slabinfo.dentry.active_objs
>       2256            +9.8%       2476        slabinfo.dentry.active_slabs
>      94788            +9.7%     104014        slabinfo.dentry.num_objs
>       2256            +9.8%       2476        slabinfo.dentry.num_slabs
>       9067           -13.7%       7825 =C2=B1  4%  slabinfo.kmalloc-2k.ac=
tive_objs
>       9108           -14.0%       7834 =C2=B1  4%  slabinfo.kmalloc-2k.nu=
m_objs
>     747.00 =C2=B1  4%     -10.7%     667.00 =C2=B1  4%  slabinfo.kmem_cac=
he_node.active_objs
>     800.00 =C2=B1  4%     -10.0%     720.00 =C2=B1  3%  slabinfo.kmem_cac=
he_node.num_objs
>       1045 =C2=B1  2%     -14.6%     892.50 =C2=B1  4%  slabinfo.mnt_cach=
e.active_objs
>       1045 =C2=B1  2%     -14.6%     892.50 =C2=B1  4%  slabinfo.mnt_cach=
e.num_objs
>       4509 =C2=B1  2%    +210.8%      14012        slabinfo.pid.active_ob=
js
>     140.50 =C2=B1  2%    +211.4%     437.50        slabinfo.pid.active_sl=
abs
>       4509 =C2=B1  2%    +210.8%      14012        slabinfo.pid.num_objs
>     140.50 =C2=B1  2%    +211.4%     437.50        slabinfo.pid.num_slabs
>       2529 =C2=B1  2%     +17.7%       2977        slabinfo.sighand_cache=
.active_objs
>       2529 =C2=B1  2%     +17.7%       2978        slabinfo.sighand_cache=
.num_objs
>       4195 =C2=B1  2%    +149.9%      10482        slabinfo.signal_cache.=
active_objs
>     139.50 =C2=B1  2%    +152.0%     351.50        slabinfo.signal_cache.=
active_slabs
>       4195 =C2=B1  2%    +151.8%      10564        slabinfo.signal_cache.=
num_objs
>     139.50 =C2=B1  2%    +152.0%     351.50        slabinfo.signal_cache.=
num_slabs
>       6146           +33.8%       8224 =C2=B1  3%  slabinfo.task_delay_in=
fo.active_objs
>       6146           +33.8%       8224 =C2=B1  3%  slabinfo.task_delay_in=
fo.num_objs
>       1435 =C2=B1  2%     -33.5%     954.00 =C2=B1 12%  slabinfo.task_gro=
up.active_objs
>       1435 =C2=B1  2%     -33.5%     954.00 =C2=B1 12%  slabinfo.task_gro=
up.num_objs
>      21399 =C2=B1  2%      -7.6%      19777        slabinfo.vmap_area.act=
ive_objs
>  4.091e+09            -2.4%  3.991e+09        perf-stat.i.branch-instruct=
ions
>       2.42 =C2=B1  3%      -0.1        2.28        perf-stat.i.branch-mis=
s-rate%
>   93978100 =C2=B1  4%      -7.1%   87268602        perf-stat.i.branch-mis=
ses
>       1.42 =C2=B1  8%      +0.5        1.94        perf-stat.i.cache-miss=
-rate%
>      53979           +31.8%      71126        perf-stat.i.context-switches
>      54.91 =C2=B1 62%  +16323.1%       9018        perf-stat.i.cpu-migrat=
ions
>       8255 =C2=B1 24%     -28.4%       5910        perf-stat.i.cycles-bet=
ween-cache-misses
>  3.201e+09 =C2=B1  4%      -6.1%  3.005e+09        perf-stat.i.dTLB-stores
>      40.79 =C2=B1  3%      -1.9       38.93        perf-stat.i.iTLB-load-=
miss-rate%
>    4211921 =C2=B1  3%      -4.1%    4039405        perf-stat.i.iTLB-load-=
misses
>    5912246            +2.6%    6068466        perf-stat.i.iTLB-loads
>  2.054e+10            -2.3%  2.006e+10        perf-stat.i.instructions
>     694372            -3.1%     672562        perf-stat.i.minor-faults
>      68.40           +16.1       84.47        perf-stat.i.node-load-miss-=
rate%
>     310404 =C2=B1  3%    +205.3%     947615        perf-stat.i.node-load-=
misses
>     145856 =C2=B1  4%     +18.0%     172093 =C2=B1  4%  perf-stat.i.node-=
loads
>      14.89 =C2=B1  5%     +25.5       40.40 =C2=B1  3%  perf-stat.i.node-=
store-miss-rate%
>      37905 =C2=B1  6%    +304.3%     153238 =C2=B1  2%  perf-stat.i.node-=
store-misses
>     694358            -3.1%     672549        perf-stat.i.page-faults
>       2.30 =C2=B1  3%      -0.1        2.19        perf-stat.overall.bran=
ch-miss-rate%
>       1.13 =C2=B1 19%      +0.4        1.53        perf-stat.overall.cach=
e-miss-rate%
>       8166 =C2=B1 24%     -27.5%       5923        perf-stat.overall.cycl=
es-between-cache-misses
>      41.60 =C2=B1  2%      -1.6       39.96        perf-stat.overall.iTLB=
-load-miss-rate%
>      68.04           +16.6       84.63        perf-stat.overall.node-load=
-miss-rate%
>      13.59 =C2=B1  5%     +26.0       39.60 =C2=B1  3%  perf-stat.overall=
.node-store-miss-rate%
>  4.026e+09            -2.4%  3.927e+09        perf-stat.ps.branch-instruc=
tions
>   92481891 =C2=B1  4%      -7.1%   85877045        perf-stat.ps.branch-mi=
sses
>      53115           +31.8%      69984        perf-stat.ps.context-switch=
es
>      54.04 =C2=B1 62%  +16321.0%       8873        perf-stat.ps.cpu-migra=
tions
>   3.15e+09 =C2=B1  4%      -6.1%  2.957e+09        perf-stat.ps.dTLB-stor=
es
>    4144498 =C2=B1  3%      -4.1%    3974539        perf-stat.ps.iTLB-load=
-misses
>    5817704            +2.6%    5971220        perf-stat.ps.iTLB-loads
>  2.021e+10            -2.3%  1.974e+10        perf-stat.ps.instructions
>     683254            -3.1%     661759        perf-stat.ps.minor-faults
>     305472 =C2=B1  3%    +205.2%     932454        perf-stat.ps.node-load=
-misses
>     143546 =C2=B1  4%     +18.0%     169347 =C2=B1  4%  perf-stat.ps.node=
-loads
>      37313 =C2=B1  6%    +304.1%     150787 =C2=B1  2%  perf-stat.ps.node=
-store-misses
>     683240            -3.1%     661746        perf-stat.ps.page-faults
>   1.28e+12            -1.5%  1.261e+12        perf-stat.total.instructions
>       7.14 =C2=B1100%      -7.1        0.00        perf-profile.calltrace=
.cycles-pp.page_fault
>       7.14 =C2=B1100%      -7.1        0.00        perf-profile.calltrace=
.cycles-pp.do_page_fault.page_fault
>       7.14 =C2=B1100%      -7.1        0.00        perf-profile.calltrace=
.cycles-pp.__do_page_fault.do_page_fault.page_fault
>       3.57 =C2=B1100%      -3.6        0.00        perf-profile.calltrace=
.cycles-pp.filemap_map_pages.__handle_mm_fault.handle_mm_fault.__do_page_fa=
ult.do_page_fault
>       3.57 =C2=B1100%      -3.6        0.00        perf-profile.calltrace=
.cycles-pp.find_vma.__do_page_fault.do_page_fault.page_fault
>       3.57 =C2=B1100%      -3.6        0.00        perf-profile.calltrace=
.cycles-pp.syscall_return_via_sysret
>       3.57 =C2=B1100%      -3.6        0.00        perf-profile.calltrace=
.cycles-pp.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       3.57 =C2=B1100%      -3.6        0.00        perf-profile.calltrace=
.cycles-pp.__do_execve_file.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64=
_after_hwframe
>       3.57 =C2=B1100%      -3.6        0.00        perf-profile.calltrace=
.cycles-pp.flush_old_exec.load_elf_binary.search_binary_handler.__do_execve=
_file.__x64_sys_execve
>       3.57 =C2=B1100%      -3.6        0.00        perf-profile.calltrace=
.cycles-pp.__rb_erase_color.unlink_file_vma.free_pgtables.exit_mmap.mmput
>       3.57 =C2=B1100%      -3.6        0.00        perf-profile.calltrace=
.cycles-pp.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
>       3.57 =C2=B1100%      -3.6        0.00        perf-profile.calltrace=
.cycles-pp.search_binary_handler.__do_execve_file.__x64_sys_execve.do_sysca=
ll_64.entry_SYSCALL_64_after_hwframe
>       3.57 =C2=B1100%      -3.6        0.00        perf-profile.calltrace=
.cycles-pp.load_elf_binary.search_binary_handler.__do_execve_file.__x64_sys=
_execve.do_syscall_64
>       3.57 =C2=B1100%      -3.6        0.00        perf-profile.calltrace=
.cycles-pp.mmput.flush_old_exec.load_elf_binary.search_binary_handler.__do_=
execve_file
>       3.57 =C2=B1100%      -3.6        0.00        perf-profile.calltrace=
.cycles-pp.exit_mmap.mmput.flush_old_exec.load_elf_binary.search_binary_han=
dler
>       3.57 =C2=B1100%      -3.6        0.00        perf-profile.calltrace=
.cycles-pp.free_pgtables.exit_mmap.mmput.flush_old_exec.load_elf_binary
>       3.57 =C2=B1100%      -3.6        0.00        perf-profile.calltrace=
.cycles-pp.unlink_file_vma.free_pgtables.exit_mmap.mmput.flush_old_exec
>       3.57 =C2=B1100%      -2.1        1.47 =C2=B1173%  perf-profile.call=
trace.cycles-pp.__handle_mm_fault.handle_mm_fault.__do_page_fault.do_page_f=
ault.page_fault
>       2.58 =C2=B1100%      -0.9        1.67 =C2=B1173%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
>       2.58 =C2=B1100%      -0.9        1.67 =C2=B1173%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
>       7.14 =C2=B1100%      -5.7        1.47 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.page_fault
>       7.14 =C2=B1100%      -5.7        1.47 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.do_page_fault
>       7.14 =C2=B1100%      -5.7        1.47 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.__do_page_fault
>       5.29 =C2=B1 34%      -5.3        0.00        perf-profile.children.=
cycles-pp.syscall_return_via_sysret
>       3.57 =C2=B1100%      -3.6        0.00        perf-profile.children.=
cycles-pp.filemap_map_pages
>       3.57 =C2=B1100%      -3.6        0.00        perf-profile.children.=
cycles-pp.find_vma
>       3.57 =C2=B1100%      -3.6        0.00        perf-profile.children.=
cycles-pp.__x64_sys_execve
>       3.57 =C2=B1100%      -3.6        0.00        perf-profile.children.=
cycles-pp.__do_execve_file
>       3.57 =C2=B1100%      -3.6        0.00        perf-profile.children.=
cycles-pp.flush_old_exec
>       3.57 =C2=B1100%      -3.6        0.00        perf-profile.children.=
cycles-pp.__rb_erase_color
>       3.57 =C2=B1100%      -3.6        0.00        perf-profile.children.=
cycles-pp.search_binary_handler
>       3.57 =C2=B1100%      -3.6        0.00        perf-profile.children.=
cycles-pp.load_elf_binary
>       3.57 =C2=B1100%      -3.6        0.00        perf-profile.children.=
cycles-pp.free_pgtables
>       3.57 =C2=B1100%      -3.6        0.00        perf-profile.children.=
cycles-pp.unlink_file_vma
>       3.57 =C2=B1100%      -2.1        1.47 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.handle_mm_fault
>       3.57 =C2=B1100%      -2.1        1.47 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.__handle_mm_fault
>       3.57 =C2=B1100%      -1.6        1.92 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.mmput
>       3.57 =C2=B1100%      -1.6        1.92 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.exit_mmap
>       2.58 =C2=B1100%      -1.1        1.47 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.entry_SYSCALL_64
>       5.29 =C2=B1 34%      -5.3        0.00        perf-profile.self.cycl=
es-pp.syscall_return_via_sysret
>       3.57 =C2=B1100%      -3.6        0.00        perf-profile.self.cycl=
es-pp.filemap_map_pages
>       3.57 =C2=B1100%      -3.6        0.00        perf-profile.self.cycl=
es-pp.find_vma
>       3.57 =C2=B1100%      -3.6        0.00        perf-profile.self.cycl=
es-pp.__rb_erase_color
>       2.58 =C2=B1100%      -1.1        1.47 =C2=B1173%  perf-profile.self=
.cycles-pp.entry_SYSCALL_64
>      87.50 =C2=B1 21%     +91.4%     167.50 =C2=B1 41%  interrupts.40:PCI=
-MSI.67633155-edge.eth0-TxRx-2
>     154556 =C2=B1 27%    +217.4%     490510 =C2=B1  3%  interrupts.CAL:Fu=
nction_call_interrupts
>       1516 =C2=B1 26%    +232.3%       5039 =C2=B1 21%  interrupts.CPU0.C=
AL:Function_call_interrupts
>      15.00 =C2=B1 60%  +25633.3%       3860 =C2=B1 26%  interrupts.CPU0.T=
LB:TLB_shootdowns
>       1488 =C2=B1 28%    +214.7%       4684 =C2=B1 20%  interrupts.CPU1.C=
AL:Function_call_interrupts
>       5.00 =C2=B1100%  +69595.0%       3484 =C2=B1 24%  interrupts.CPU1.T=
LB:TLB_shootdowns
>       1496 =C2=B1 28%    +176.0%       4129 =C2=B1 16%  interrupts.CPU10.=
CAL:Function_call_interrupts
>       3.50 =C2=B1 71%  +83735.7%       2934 =C2=B1 21%  interrupts.CPU10.=
TLB:TLB_shootdowns
>       1493 =C2=B1 28%    +216.5%       4726 =C2=B1 20%  interrupts.CPU100=
.CAL:Function_call_interrupts
>       0.00       +3.5e+105%       3521 =C2=B1 29%  interrupts.CPU100.TLB:=
TLB_shootdowns
>       1493 =C2=B1 28%    +204.0%       4540 =C2=B1 22%  interrupts.CPU101=
.CAL:Function_call_interrupts
>       1495 =C2=B1 27%    +225.1%       4859 =C2=B1 22%  interrupts.CPU102=
.CAL:Function_call_interrupts
>       0.50 =C2=B1100%  +7.3e+05%       3657 =C2=B1 31%  interrupts.CPU102=
.TLB:TLB_shootdowns
>       1494 =C2=B1 27%    +217.2%       4739 =C2=B1 23%  interrupts.CPU103=
.CAL:Function_call_interrupts
>       1495 =C2=B1 28%    +189.1%       4323 =C2=B1 22%  interrupts.CPU11.=
CAL:Function_call_interrupts
>       3.00 =C2=B1100%    +1e+05%       3128 =C2=B1 28%  interrupts.CPU11.=
TLB:TLB_shootdowns
>       1492 =C2=B1 28%    +198.0%       4447 =C2=B1 20%  interrupts.CPU12.=
CAL:Function_call_interrupts
>       1.50 =C2=B1100%  +2.2e+05%       3253 =C2=B1 26%  interrupts.CPU12.=
TLB:TLB_shootdowns
>       1496 =C2=B1 28%    +208.2%       4610 =C2=B1 21%  interrupts.CPU13.=
CAL:Function_call_interrupts
>       2.50 =C2=B1100%  +1.4e+05%       3415 =C2=B1 25%  interrupts.CPU13.=
TLB:TLB_shootdowns
>       1496 =C2=B1 28%    +214.0%       4699 =C2=B1 24%  interrupts.CPU14.=
CAL:Function_call_interrupts
>       3.50 =C2=B1100%  +99935.7%       3501 =C2=B1 29%  interrupts.CPU14.=
TLB:TLB_shootdowns
>       1496 =C2=B1 28%    +221.7%       4812 =C2=B1 27%  interrupts.CPU15.=
CAL:Function_call_interrupts
>       2.50 =C2=B1100%  +1.4e+05%       3614 =C2=B1 32%  interrupts.CPU15.=
TLB:TLB_shootdowns
>       1493 =C2=B1 28%    +198.8%       4463 =C2=B1 23%  interrupts.CPU16.=
CAL:Function_call_interrupts
>       1.50 =C2=B1100%  +2.2e+05%       3269 =C2=B1 27%  interrupts.CPU16.=
TLB:TLB_shootdowns
>       1493 =C2=B1 28%    +214.3%       4693 =C2=B1 25%  interrupts.CPU17.=
CAL:Function_call_interrupts
>       1.00 =C2=B1100%  +3.5e+05%       3499 =C2=B1 31%  interrupts.CPU17.=
TLB:TLB_shootdowns
>       1493 =C2=B1 28%    +223.6%       4832 =C2=B1 24%  interrupts.CPU18.=
CAL:Function_call_interrupts
>       2.50 =C2=B1100%  +1.5e+05%       3635 =C2=B1 29%  interrupts.CPU18.=
TLB:TLB_shootdowns
>       1497 =C2=B1 28%    +219.1%       4776 =C2=B1 25%  interrupts.CPU19.=
CAL:Function_call_interrupts
>       2.50 =C2=B1 60%  +1.4e+05%       3583 =C2=B1 31%  interrupts.CPU19.=
TLB:TLB_shootdowns
>       1489 =C2=B1 28%    +211.5%       4640 =C2=B1 18%  interrupts.CPU2.C=
AL:Function_call_interrupts
>      94.00 =C2=B1 60%    +456.9%     523.50 =C2=B1 81%  interrupts.CPU2.R=
ES:Rescheduling_interrupts
>       3.50 =C2=B1 42%  +98250.0%       3442 =C2=B1 23%  interrupts.CPU2.T=
LB:TLB_shootdowns
>       1495 =C2=B1 28%    +237.4%       5045 =C2=B1 25%  interrupts.CPU20.=
CAL:Function_call_interrupts
>       2.00 =C2=B1100%  +1.9e+05%       3848 =C2=B1 31%  interrupts.CPU20.=
TLB:TLB_shootdowns
>       1546 =C2=B1 31%    +196.3%       4581 =C2=B1 23%  interrupts.CPU21.=
CAL:Function_call_interrupts
>       0.50 =C2=B1100%  +6.8e+05%       3381 =C2=B1 29%  interrupts.CPU21.=
TLB:TLB_shootdowns
>       1496 =C2=B1 28%    +212.7%       4678 =C2=B1 20%  interrupts.CPU22.=
CAL:Function_call_interrupts
>      10.00 =C2=B1 90%  +34657.5%       3475 =C2=B1 26%  interrupts.CPU22.=
TLB:TLB_shootdowns
>       1495 =C2=B1 28%    +215.0%       4709 =C2=B1 20%  interrupts.CPU23.=
CAL:Function_call_interrupts
>       2.00 =C2=B1100%  +1.8e+05%       3507 =C2=B1 25%  interrupts.CPU23.=
TLB:TLB_shootdowns
>       1492 =C2=B1 28%    +206.8%       4579 =C2=B1 20%  interrupts.CPU24.=
CAL:Function_call_interrupts
>       0.00       +3.4e+105%       3377 =C2=B1 25%  interrupts.CPU24.TLB:T=
LB_shootdowns
>       1491 =C2=B1 28%    +203.0%       4517 =C2=B1 21%  interrupts.CPU25.=
CAL:Function_call_interrupts
>       0.00       +3.3e+105%       3315 =C2=B1 27%  interrupts.CPU25.TLB:T=
LB_shootdowns
>       1083          +319.8%       4548 =C2=B1 18%  interrupts.CPU26.CAL:F=
unction_call_interrupts
>      78.50 =C2=B1 96%   +4261.5%       3423 =C2=B1 25%  interrupts.CPU26.=
TLB:TLB_shootdowns
>       1389 =C2=B1 23%    +221.6%       4467 =C2=B1 19%  interrupts.CPU27.=
CAL:Function_call_interrupts
>       1.50 =C2=B1100%  +2.2e+05%       3318 =C2=B1 31%  interrupts.CPU27.=
TLB:TLB_shootdowns
>       1491 =C2=B1 28%    +194.6%       4393 =C2=B1 22%  interrupts.CPU28.=
CAL:Function_call_interrupts
>       1.00        +3.2e+05%       3238 =C2=B1 31%  interrupts.CPU28.TLB:T=
LB_shootdowns
>       1495 =C2=B1 28%    +182.8%       4229 =C2=B1 21%  interrupts.CPU29.=
CAL:Function_call_interrupts
>       6671 =C2=B1 92%     -97.3%     180.00 =C2=B1 24%  interrupts.CPU29.=
RES:Rescheduling_interrupts
>       4.50 =C2=B1100%  +67588.9%       3046 =C2=B1 30%  interrupts.CPU29.=
TLB:TLB_shootdowns
>       1489 =C2=B1 28%    +210.0%       4615 =C2=B1 19%  interrupts.CPU3.C=
AL:Function_call_interrupts
>       3.00 =C2=B1100%  +1.1e+05%       3417 =C2=B1 24%  interrupts.CPU3.T=
LB:TLB_shootdowns
>       1494 =C2=B1 28%    +175.1%       4109 =C2=B1 19%  interrupts.CPU30.=
CAL:Function_call_interrupts
>       3.00 =C2=B1100%    +1e+05%       3076 =C2=B1 24%  interrupts.CPU30.=
TLB:TLB_shootdowns
>       1491 =C2=B1 28%    +180.3%       4180 =C2=B1 20%  interrupts.CPU31.=
CAL:Function_call_interrupts
>       1.00 =C2=B1100%    +3e+05%       2997 =C2=B1 28%  interrupts.CPU31.=
TLB:TLB_shootdowns
>      87.50 =C2=B1 21%     +91.4%     167.50 =C2=B1 41%  interrupts.CPU32.=
40:PCI-MSI.67633155-edge.eth0-TxRx-2
>       1495 =C2=B1 28%    +203.6%       4540 =C2=B1 18%  interrupts.CPU32.=
CAL:Function_call_interrupts
>       4.50 =C2=B1100%  +74405.6%       3352 =C2=B1 25%  interrupts.CPU32.=
TLB:TLB_shootdowns
>       1492 =C2=B1 28%    +200.0%       4476 =C2=B1 20%  interrupts.CPU33.=
CAL:Function_call_interrupts
>       1.50 =C2=B1100%  +2.2e+05%       3317 =C2=B1 27%  interrupts.CPU33.=
TLB:TLB_shootdowns
>       1493 =C2=B1 28%    +191.1%       4347 =C2=B1 20%  interrupts.CPU34.=
CAL:Function_call_interrupts
>       4.50 =C2=B1100%  +69911.1%       3150 =C2=B1 28%  interrupts.CPU34.=
TLB:TLB_shootdowns
>       1489 =C2=B1 28%    +174.9%       4094 =C2=B1 15%  interrupts.CPU35.=
CAL:Function_call_interrupts
>       1.00 =C2=B1100%  +2.9e+05%       2910 =C2=B1 22%  interrupts.CPU35.=
TLB:TLB_shootdowns
>       1490 =C2=B1 28%    +195.5%       4404 =C2=B1 18%  interrupts.CPU36.=
CAL:Function_call_interrupts
>       2.00 =C2=B1100%  +1.6e+05%       3207 =C2=B1 25%  interrupts.CPU36.=
TLB:TLB_shootdowns
>       1491 =C2=B1 28%    +195.8%       4411 =C2=B1 17%  interrupts.CPU37.=
CAL:Function_call_interrupts
>       1.00 =C2=B1100%  +3.2e+05%       3214 =C2=B1 25%  interrupts.CPU37.=
TLB:TLB_shootdowns
>       1489 =C2=B1 28%    +190.1%       4321 =C2=B1 19%  interrupts.CPU38.=
CAL:Function_call_interrupts
>       1.50 =C2=B1 33%  +2.2e+05%       3249 =C2=B1 24%  interrupts.CPU38.=
TLB:TLB_shootdowns
>       1489 =C2=B1 28%    +207.6%       4581 =C2=B1 18%  interrupts.CPU39.=
CAL:Function_call_interrupts
>       1.50 =C2=B1100%  +2.3e+05%       3438 =C2=B1 25%  interrupts.CPU39.=
TLB:TLB_shootdowns
>       1487 =C2=B1 28%    +186.2%       4256 =C2=B1 21%  interrupts.CPU4.C=
AL:Function_call_interrupts
>       2234 =C2=B1 85%     -90.5%     211.25 =C2=B1 22%  interrupts.CPU4.R=
ES:Rescheduling_interrupts
>       2.00 =C2=B1100%  +1.5e+05%       3060 =C2=B1 27%  interrupts.CPU4.T=
LB:TLB_shootdowns
>       1491 =C2=B1 28%    +194.7%       4393 =C2=B1 17%  interrupts.CPU40.=
CAL:Function_call_interrupts
>       2.00 =C2=B1 50%  +1.6e+05%       3216 =C2=B1 25%  interrupts.CPU40.=
TLB:TLB_shootdowns
>       1489 =C2=B1 28%    +182.7%       4210 =C2=B1 16%  interrupts.CPU41.=
CAL:Function_call_interrupts
>       3.00 =C2=B1100%    +1e+05%       3016 =C2=B1 23%  interrupts.CPU41.=
TLB:TLB_shootdowns
>       1487 =C2=B1 29%    +200.0%       4460 =C2=B1 21%  interrupts.CPU42.=
CAL:Function_call_interrupts
>       3.50 =C2=B1 71%  +93300.0%       3269 =C2=B1 30%  interrupts.CPU42.=
TLB:TLB_shootdowns
>       1540 =C2=B1 24%    +179.4%       4304 =C2=B1 17%  interrupts.CPU43.=
CAL:Function_call_interrupts
>       0.50 =C2=B1100%  +6.2e+05%       3108 =C2=B1 25%  interrupts.CPU43.=
TLB:TLB_shootdowns
>       1490 =C2=B1 28%    +177.3%       4131 =C2=B1 17%  interrupts.CPU44.=
CAL:Function_call_interrupts
>       1.50 =C2=B1100%    +2e+05%       2932 =C2=B1 25%  interrupts.CPU44.=
TLB:TLB_shootdowns
>       1489 =C2=B1 28%    +179.7%       4166 =C2=B1 19%  interrupts.CPU45.=
CAL:Function_call_interrupts
>       0.50 =C2=B1100%  +5.9e+05%       2963 =C2=B1 29%  interrupts.CPU45.=
TLB:TLB_shootdowns
>       1489 =C2=B1 28%    +194.4%       4385 =C2=B1 16%  interrupts.CPU46.=
CAL:Function_call_interrupts
>       4181 =C2=B1 94%     -95.4%     191.25 =C2=B1 21%  interrupts.CPU46.=
RES:Rescheduling_interrupts
>       0.50 =C2=B1100%  +6.4e+05%       3180 =C2=B1 24%  interrupts.CPU46.=
TLB:TLB_shootdowns
>       1490 =C2=B1 28%    +191.0%       4338 =C2=B1 18%  interrupts.CPU47.=
CAL:Function_call_interrupts
>       1.50 =C2=B1100%  +2.1e+05%       3135 =C2=B1 28%  interrupts.CPU47.=
TLB:TLB_shootdowns
>       1491 =C2=B1 28%    +165.4%       3956 =C2=B1 28%  interrupts.CPU48.=
CAL:Function_call_interrupts
>       9014 =C2=B1 97%     -98.1%     175.50 =C2=B1 34%  interrupts.CPU48.=
RES:Rescheduling_interrupts
>       1.00        +2.8e+05%       2758 =C2=B1 42%  interrupts.CPU48.TLB:T=
LB_shootdowns
>       1491 =C2=B1 28%    +178.8%       4157 =C2=B1 25%  interrupts.CPU49.=
CAL:Function_call_interrupts
>       1.50 =C2=B1100%    +2e+05%       2957 =C2=B1 38%  interrupts.CPU49.=
TLB:TLB_shootdowns
>       1089 =C2=B1 75%    +298.2%       4336 =C2=B1 22%  interrupts.CPU5.C=
AL:Function_call_interrupts
>       3.00 =C2=B1100%    +1e+05%       3139 =C2=B1 28%  interrupts.CPU5.T=
LB:TLB_shootdowns
>       1513 =C2=B1 26%    +162.6%       3973 =C2=B1 19%  interrupts.CPU50.=
CAL:Function_call_interrupts
>       1.00        +2.8e+05%       2818 =C2=B1 29%  interrupts.CPU50.TLB:T=
LB_shootdowns
>       1500 =C2=B1 27%    +180.7%       4210 =C2=B1 23%  interrupts.CPU51.=
CAL:Function_call_interrupts
>       0.50 =C2=B1100%    +6e+05%       3015 =C2=B1 35%  interrupts.CPU51.=
TLB:TLB_shootdowns
>       1511 =C2=B1 26%    +208.8%       4666 =C2=B1 21%  interrupts.CPU52.=
CAL:Function_call_interrupts
>       0.50 =C2=B1100%  +6.9e+05%       3461 =C2=B1 26%  interrupts.CPU52.=
TLB:TLB_shootdowns
>       1512 =C2=B1 26%    +216.7%       4789 =C2=B1 25%  interrupts.CPU53.=
CAL:Function_call_interrupts
>       1.00 =C2=B1100%  +3.6e+05%       3582 =C2=B1 33%  interrupts.CPU53.=
TLB:TLB_shootdowns
>       1512 =C2=B1 27%    +213.3%       4738 =C2=B1 23%  interrupts.CPU54.=
CAL:Function_call_interrupts
>     105.50 =C2=B1 83%    +110.9%     222.50 =C2=B1 13%  interrupts.CPU54.=
RES:Rescheduling_interrupts
>       0.50 =C2=B1100%  +7.1e+05%       3532 =C2=B1 30%  interrupts.CPU54.=
TLB:TLB_shootdowns
>       1510 =C2=B1 26%    +201.8%       4559 =C2=B1 24%  interrupts.CPU55.=
CAL:Function_call_interrupts
>       1.00 =C2=B1100%  +3.4e+05%       3359 =C2=B1 30%  interrupts.CPU55.=
TLB:TLB_shootdowns
>       1512 =C2=B1 27%    +220.6%       4847 =C2=B1 23%  interrupts.CPU56.=
CAL:Function_call_interrupts
>       1.50 =C2=B1100%  +2.4e+05%       3643 =C2=B1 29%  interrupts.CPU56.=
TLB:TLB_shootdowns
>       1512 =C2=B1 27%    +226.7%       4941 =C2=B1 21%  interrupts.CPU57.=
CAL:Function_call_interrupts
>       1.50 =C2=B1100%  +2.5e+05%       3735 =C2=B1 27%  interrupts.CPU57.=
TLB:TLB_shootdowns
>       1511 =C2=B1 26%    +226.9%       4941 =C2=B1 21%  interrupts.CPU58.=
CAL:Function_call_interrupts
>       2.00 =C2=B1100%  +1.9e+05%       3737 =C2=B1 26%  interrupts.CPU58.=
TLB:TLB_shootdowns
>       1513 =C2=B1 27%    +231.8%       5020 =C2=B1 23%  interrupts.CPU59.=
CAL:Function_call_interrupts
>       3.00 =C2=B1100%  +1.3e+05%       3821 =C2=B1 29%  interrupts.CPU59.=
TLB:TLB_shootdowns
>       1490 =C2=B1 28%    +191.7%       4347 =C2=B1 20%  interrupts.CPU6.C=
AL:Function_call_interrupts
>       4.50 =C2=B1 77%  +71233.3%       3210 =C2=B1 25%  interrupts.CPU6.T=
LB:TLB_shootdowns
>       1510 =C2=B1 26%    +208.3%       4656 =C2=B1 20%  interrupts.CPU60.=
CAL:Function_call_interrupts
>       0.50 =C2=B1100%  +7.2e+05%       3613 =C2=B1 27%  interrupts.CPU60.=
TLB:TLB_shootdowns
>       1511 =C2=B1 26%    +212.6%       4724 =C2=B1 24%  interrupts.CPU61.=
CAL:Function_call_interrupts
>       1.00 =C2=B1100%  +3.5e+05%       3494 =C2=B1 29%  interrupts.CPU61.=
TLB:TLB_shootdowns
>       1510 =C2=B1 26%    +218.9%       4816 =C2=B1 29%  interrupts.CPU62.=
CAL:Function_call_interrupts
>       1.50 =C2=B1100%  +2.4e+05%       3613 =C2=B1 35%  interrupts.CPU62.=
TLB:TLB_shootdowns
>       1512 =C2=B1 26%    +219.6%       4834 =C2=B1 21%  interrupts.CPU63.=
CAL:Function_call_interrupts
>       3.00 =C2=B1100%  +1.2e+05%       3630 =C2=B1 26%  interrupts.CPU63.=
TLB:TLB_shootdowns
>       1512 =C2=B1 26%    +281.2%       5763 =C2=B1 39%  interrupts.CPU64.=
CAL:Function_call_interrupts
>       2.50 =C2=B1100%  +1.8e+05%       4559 =C2=B1 45%  interrupts.CPU64.=
TLB:TLB_shootdowns
>       1513 =C2=B1 26%    +263.3%       5496 =C2=B1 31%  interrupts.CPU65.=
CAL:Function_call_interrupts
>       2.50 =C2=B1100%  +1.7e+05%       4293 =C2=B1 36%  interrupts.CPU65.=
TLB:TLB_shootdowns
>       1513 =C2=B1 26%    +265.7%       5535 =C2=B1 34%  interrupts.CPU66.=
CAL:Function_call_interrupts
>       3.50 =C2=B1100%  +1.2e+05%       4333 =C2=B1 40%  interrupts.CPU66.=
TLB:TLB_shootdowns
>       1512 =C2=B1 26%    +253.1%       5340 =C2=B1 31%  interrupts.CPU67.=
CAL:Function_call_interrupts
>       3.50 =C2=B1 71%  +1.2e+05%       4139 =C2=B1 36%  interrupts.CPU67.=
TLB:TLB_shootdowns
>       1512 =C2=B1 26%    +261.2%       5462 =C2=B1 27%  interrupts.CPU68.=
CAL:Function_call_interrupts
>       1.50 =C2=B1 33%  +2.8e+05%       4261 =C2=B1 32%  interrupts.CPU68.=
TLB:TLB_shootdowns
>       1509 =C2=B1 26%    +259.1%       5418 =C2=B1 23%  interrupts.CPU69.=
CAL:Function_call_interrupts
>       0.50 =C2=B1100%  +8.4e+05%       4192 =C2=B1 30%  interrupts.CPU69.=
TLB:TLB_shootdowns
>       1489 =C2=B1 28%    +194.3%       4383 =C2=B1 17%  interrupts.CPU7.C=
AL:Function_call_interrupts
>       4.50 =C2=B1100%  +70194.4%       3163 =C2=B1 23%  interrupts.CPU7.T=
LB:TLB_shootdowns
>       1508 =C2=B1 26%    +287.5%       5845 =C2=B1 27%  interrupts.CPU70.=
CAL:Function_call_interrupts
>       1.00 =C2=B1100%  +4.6e+05%       4645 =C2=B1 32%  interrupts.CPU70.=
TLB:TLB_shootdowns
>       1509 =C2=B1 26%    +309.9%       6187 =C2=B1 32%  interrupts.CPU71.=
CAL:Function_call_interrupts
>       1.00          +5e+05%       4989 =C2=B1 39%  interrupts.CPU71.TLB:T=
LB_shootdowns
>       1088          +400.0%       5439 =C2=B1 26%  interrupts.CPU72.CAL:F=
unction_call_interrupts
>       6.50 =C2=B1100%  +65134.6%       4240 =C2=B1 32%  interrupts.CPU72.=
TLB:TLB_shootdowns
>       1510 =C2=B1 26%    +244.9%       5208 =C2=B1 22%  interrupts.CPU73.=
CAL:Function_call_interrupts
>       0.00         +4e+105%       4009 =C2=B1 27%  interrupts.CPU73.TLB:T=
LB_shootdowns
>       1403 =C2=B1 36%    +266.9%       5148 =C2=B1 24%  interrupts.CPU74.=
CAL:Function_call_interrupts
>       0.50 =C2=B1100%  +7.9e+05%       3951 =C2=B1 30%  interrupts.CPU74.=
TLB:TLB_shootdowns
>       1508 =C2=B1 26%    +240.8%       5140 =C2=B1 26%  interrupts.CPU75.=
CAL:Function_call_interrupts
>       0.50 =C2=B1100%  +7.9e+05%       3942 =C2=B1 32%  interrupts.CPU75.=
TLB:TLB_shootdowns
>       1508 =C2=B1 26%    +230.1%       4979 =C2=B1 23%  interrupts.CPU76.=
CAL:Function_call_interrupts
>       0.50 =C2=B1100%  +7.6e+05%       3781 =C2=B1 29%  interrupts.CPU76.=
TLB:TLB_shootdowns
>       1509 =C2=B1 26%    +236.0%       5070 =C2=B1 22%  interrupts.CPU77.=
CAL:Function_call_interrupts
>       0.50 =C2=B1100%  +7.8e+05%       3882 =C2=B1 27%  interrupts.CPU77.=
TLB:TLB_shootdowns
>       1508 =C2=B1 26%    +200.1%       4525 =C2=B1 28%  interrupts.CPU78.=
CAL:Function_call_interrupts
>      75.50 =C2=B1 81%    +211.6%     235.25 =C2=B1 26%  interrupts.CPU78.=
RES:Rescheduling_interrupts
>       1.00        +3.3e+05%       3328 =C2=B1 40%  interrupts.CPU78.TLB:T=
LB_shootdowns
>       1508 =C2=B1 26%    +207.8%       4643 =C2=B1 22%  interrupts.CPU79.=
CAL:Function_call_interrupts
>       1.50 =C2=B1100%  +2.3e+05%       3450 =C2=B1 32%  interrupts.CPU79.=
TLB:TLB_shootdowns
>       1481 =C2=B1 28%    +187.6%       4259 =C2=B1 20%  interrupts.CPU8.C=
AL:Function_call_interrupts
>       4.00 =C2=B1100%  +76500.0%       3064 =C2=B1 27%  interrupts.CPU8.T=
LB:TLB_shootdowns
>       1507 =C2=B1 26%    +202.3%       4557 =C2=B1 24%  interrupts.CPU80.=
CAL:Function_call_interrupts
>       2.00 =C2=B1 50%  +1.7e+05%       3335 =C2=B1 35%  interrupts.CPU80.=
TLB:TLB_shootdowns
>       1505 =C2=B1 27%    +208.8%       4649 =C2=B1 22%  interrupts.CPU81.=
CAL:Function_call_interrupts
>       1.00 =C2=B1100%  +3.5e+05%       3451 =C2=B1 32%  interrupts.CPU81.=
TLB:TLB_shootdowns
>       1509 =C2=B1 26%    +207.2%       4637 =C2=B1 19%  interrupts.CPU82.=
CAL:Function_call_interrupts
>       4.00 =C2=B1100%  +87693.8%       3511 =C2=B1 30%  interrupts.CPU82.=
TLB:TLB_shootdowns
>       1511 =C2=B1 26%    +225.3%       4915 =C2=B1 18%  interrupts.CPU83.=
CAL:Function_call_interrupts
>       6.00 =C2=B1 83%  +61845.8%       3716 =C2=B1 26%  interrupts.CPU83.=
TLB:TLB_shootdowns
>       1505 =C2=B1 27%    +214.0%       4727 =C2=B1 17%  interrupts.CPU84.=
CAL:Function_call_interrupts
>       3.00 =C2=B1100%  +1.2e+05%       3569 =C2=B1 26%  interrupts.CPU84.=
TLB:TLB_shootdowns
>       1504 =C2=B1 27%    +229.7%       4959 =C2=B1 19%  interrupts.CPU85.=
CAL:Function_call_interrupts
>       2.50 =C2=B1100%  +1.5e+05%       3752 =C2=B1 28%  interrupts.CPU85.=
TLB:TLB_shootdowns
>       1501 =C2=B1 27%    +227.1%       4910 =C2=B1 19%  interrupts.CPU86.=
CAL:Function_call_interrupts
>       3.50 =C2=B1100%  +1.1e+05%       3765 =C2=B1 27%  interrupts.CPU86.=
TLB:TLB_shootdowns
>       1497 =C2=B1 27%    +227.1%       4896 =C2=B1 19%  interrupts.CPU87.=
CAL:Function_call_interrupts
>       0.50 =C2=B1100%  +7.4e+05%       3690 =C2=B1 26%  interrupts.CPU87.=
TLB:TLB_shootdowns
>       1495 =C2=B1 27%    +242.9%       5128 =C2=B1 17%  interrupts.CPU88.=
CAL:Function_call_interrupts
>       1.00 =C2=B1100%    +4e+05%       4027 =C2=B1 26%  interrupts.CPU88.=
TLB:TLB_shootdowns
>       1487 =C2=B1 28%    +241.3%       5075 =C2=B1 15%  interrupts.CPU89.=
CAL:Function_call_interrupts
>       0.50 =C2=B1100%  +7.7e+05%       3868 =C2=B1 22%  interrupts.CPU89.=
TLB:TLB_shootdowns
>       1498 =C2=B1 28%    +177.3%       4154 =C2=B1 18%  interrupts.CPU9.C=
AL:Function_call_interrupts
>       2746 =C2=B1 83%     -62.6%       1027 =C2=B1138%  interrupts.CPU9.R=
ES:Rescheduling_interrupts
>       4.00 =C2=B1100%  +73656.2%       2950 =C2=B1 25%  interrupts.CPU9.T=
LB:TLB_shootdowns
>       1496 =C2=B1 27%    +247.9%       5204 =C2=B1 24%  interrupts.CPU90.=
CAL:Function_call_interrupts
>       1.00 =C2=B1100%    +4e+05%       3999 =C2=B1 33%  interrupts.CPU90.=
TLB:TLB_shootdowns
>       1496 =C2=B1 27%    +262.1%       5417 =C2=B1 21%  interrupts.CPU91.=
CAL:Function_call_interrupts
>       0.50 =C2=B1100%  +8.4e+05%       4212 =C2=B1 28%  interrupts.CPU91.=
TLB:TLB_shootdowns
>       1495 =C2=B1 27%    +240.5%       5092 =C2=B1 23%  interrupts.CPU92.=
CAL:Function_call_interrupts
>       1496 =C2=B1 27%    +239.8%       5085 =C2=B1 25%  interrupts.CPU93.=
CAL:Function_call_interrupts
>       1.50 =C2=B1100%  +2.6e+05%       3903 =C2=B1 35%  interrupts.CPU93.=
TLB:TLB_shootdowns
>       1495 =C2=B1 27%    +230.1%       4936 =C2=B1 25%  interrupts.CPU94.=
CAL:Function_call_interrupts
>       0.50 =C2=B1100%  +7.5e+05%       3739 =C2=B1 34%  interrupts.CPU94.=
TLB:TLB_shootdowns
>       1496 =C2=B1 27%    +214.8%       4709 =C2=B1 21%  interrupts.CPU95.=
CAL:Function_call_interrupts
>       1.00 =C2=B1100%  +3.5e+05%       3505 =C2=B1 30%  interrupts.CPU95.=
TLB:TLB_shootdowns
>       1496 =C2=B1 27%    +227.6%       4903 =C2=B1 23%  interrupts.CPU96.=
CAL:Function_call_interrupts
>       1.50 =C2=B1 33%  +2.5e+05%       3701 =C2=B1 32%  interrupts.CPU96.=
TLB:TLB_shootdowns
>       1495 =C2=B1 27%    +231.4%       4954 =C2=B1 24%  interrupts.CPU97.=
CAL:Function_call_interrupts
>       0.00       +3.8e+105%       3754 =C2=B1 33%  interrupts.CPU97.TLB:T=
LB_shootdowns
>       1495 =C2=B1 27%    +227.7%       4898 =C2=B1 24%  interrupts.CPU98.=
CAL:Function_call_interrupts
>       0.50 =C2=B1100%  +7.4e+05%       3694 =C2=B1 35%  interrupts.CPU98.=
TLB:TLB_shootdowns
>       1495 =C2=B1 27%    +223.4%       4836 =C2=B1 19%  interrupts.CPU99.=
CAL:Function_call_interrupts
>       0.50 =C2=B1100%  +7.3e+05%       3633 =C2=B1 27%  interrupts.CPU99.=
TLB:TLB_shootdowns
>      49985 =C2=B1 17%     -43.9%      28043 =C2=B1  7%  interrupts.RES:Re=
scheduling_interrupts
>     286.50 =C2=B1 38%  +1.3e+05%     366863        interrupts.TLB:TLB_sho=
otdowns
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
> Rong Chen
>
--===============5731153483485624423==--

