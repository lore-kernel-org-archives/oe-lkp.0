Content-Type: multipart/mixed; boundary="===============2789650160194805888=="
MIME-Version: 1.0
From: Vincent Guittot <vincent.guittot@linaro.org>
To: lkp@lists.01.org
Subject: Re: [sched/numa] f6183ef98b: phoronix-test-suite.aom-av1.0.frames_per_second -25.0% regression
Date: Wed, 26 Feb 2020 09:03:26 +0100
Message-ID: <CAKfTPtD_ZJhJywWkPjZh6o_7TVZKbvH-D+-K_9RSoi+8L6cC2A@mail.gmail.com>
In-Reply-To: <20200226013255.GC6548@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============2789650160194805888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Rong,

On Wed, 26 Feb 2020 at 02:33, kernel test robot <rong.a.chen@intel.com> w=
rote:
>
> Greeting,
>
> FYI, we noticed a -25.0% regression of phoronix-test-suite.aom-av1.0.fram=
es_per_second due to commit:
>
>
> commit: f6183ef98bba39a5de563d4ab4bc889ff2b600d7 ("sched/numa: replace ru=
nnable_load_avg by load_avg")
> https://git.kernel.org/cgit/linux/kernel/git/mel/linux.git sched-lbnuma-r=
ewrite-v2r6

The following patches in the branch recover the perf regression. Do
you see regression on the whole branch ?

>
> in testcase: phoronix-test-suite
> on test machine: 16 threads Intel(R) Xeon(R) CPU X5570 @ 2.93GHz with 48G=
 memory
> with following parameters:
>
>         test: aom-av1-1.2.0
>         cpufreq_governor: performance
>         ucode: 0x1d
>
> test-description: The Phoronix Test Suite is the most comprehensive testi=
ng and benchmarking platform available that provides an extensible framewor=
k for which new tests can be easily added.
> test-url: http://www.phoronix-test-suite.com/
>
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
> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/ucode:
>   gcc-7/performance/x86_64-rhel-7.6/debian-x86_64-phoronix/lkp-nhm-2ep1/a=
om-av1-1.2.0/phoronix-test-suite/0x1d
>
> commit:
>   91d7637912 ("sched/fair: reorder enqueue/dequeue_task_fair path")
>   f6183ef98b ("sched/numa: replace runnable_load_avg by load_avg")
>
> 91d76379120e4640 f6183ef98bba39a5de563d4ab4b
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>       0.04           -25.0%       0.03        phoronix-test-suite.aom-av1=
.0.frames_per_second
>       1648           +24.6%       2055        phoronix-test-suite.time.el=
apsed_time
>       1648           +24.6%       2055        phoronix-test-suite.time.el=
apsed_time.max
>       1935           -19.6%       1556        meminfo.max_used_kB
>  1.518e+10 =C2=B1 29%     +39.9%  2.124e+10        cpuidle.C1E.time
>   33131701 =C2=B1 34%     +35.9%   45011103 =C2=B1  2%  cpuidle.C1E.usage
>     672.00          -100.0%       0.00        slabinfo.dmaengine-unmap-16=
.active_objs
>     672.00          -100.0%       0.00        slabinfo.dmaengine-unmap-16=
.num_objs
>      67.50            -2.2%      66.00        vmstat.cpu.id
>      31.00            +6.5%      33.00        vmstat.cpu.us
>     467.75            +5.0%     491.00        proc-vmstat.nr_mlock
>     484.75            +4.8%     508.00        proc-vmstat.nr_unevictable
>     484.75            +4.8%     508.00        proc-vmstat.nr_zone_unevict=
able
>    3492646 =C2=B1  7%     +67.4%    5846384 =C2=B1  3%  proc-vmstat.numa_=
hint_faults
>    2478506 =C2=B1  6%    +127.8%    5646434 =C2=B1  4%  proc-vmstat.numa_=
hint_faults_local
>    3650509           +13.5%    4141674        proc-vmstat.numa_hit
>      76734           +98.1%     151980 =C2=B1  2%  proc-vmstat.numa_huge_=
pte_updates
>    3647139           +13.5%    4138249        proc-vmstat.numa_local
>    3408776 =C2=B1  7%     -80.4%     667824 =C2=B1  8%  proc-vmstat.numa_=
pages_migrated
>   42828088           +95.3%   83628988 =C2=B1  2%  proc-vmstat.numa_pte_u=
pdates
>    7766914 =C2=B1  3%     -25.6%    5776215        proc-vmstat.pgalloc_no=
rmal
>    7771023 =C2=B1  3%     +43.5%   11147904 =C2=B1  2%  proc-vmstat.pgfau=
lt
>    7716195 =C2=B1  3%     -25.8%    5726088        proc-vmstat.pgfree
>       1152 =C2=B1 19%     -88.9%     128.00 =C2=B1173%  proc-vmstat.pgmig=
rate_fail
>    3408776 =C2=B1  7%     -80.4%     667824 =C2=B1  8%  proc-vmstat.pgmig=
rate_success
>       0.13 =C2=B1173%      +0.5        0.63 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter=
_state.cpuidle_enter.do_idle
>       0.14 =C2=B1173%      +0.5        0.67 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.do_i=
dle.cpu_startup_entry
>       4.40 =C2=B1 47%      +3.5        7.87 =C2=B1 16%  perf-profile.call=
trace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry=
.start_kernel
>       4.40 =C2=B1 47%      +3.5        7.87 =C2=B1 16%  perf-profile.call=
trace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_kernel.second=
ary_startup_64
>       4.41 =C2=B1 47%      +3.5        7.94 =C2=B1 16%  perf-profile.call=
trace.cycles-pp.cpu_startup_entry.start_kernel.secondary_startup_64
>       4.41 =C2=B1 47%      +3.5        7.94 =C2=B1 16%  perf-profile.call=
trace.cycles-pp.do_idle.cpu_startup_entry.start_kernel.secondary_startup_64
>       4.41 =C2=B1 47%      +3.5        7.94 =C2=B1 16%  perf-profile.call=
trace.cycles-pp.start_kernel.secondary_startup_64
>       0.05 =C2=B1 67%      +0.1        0.12 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.ktime_get
>       0.01 =C2=B1173%      +0.1        0.10 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irqsave
>       0.00            +0.1        0.10 =C2=B1 36%  perf-profile.children.=
cycles-pp.rcu_core
>       0.32 =C2=B1 86%      +0.5        0.85 =C2=B1 54%  perf-profile.chil=
dren.cycles-pp.__libc_start_main
>       0.60 =C2=B1 46%      +0.6        1.19 =C2=B1 41%  perf-profile.chil=
dren.cycles-pp.do_syscall_64
>       0.60 =C2=B1 46%      +0.6        1.19 =C2=B1 41%  perf-profile.chil=
dren.cycles-pp.entry_SYSCALL_64_after_hwframe
>       0.34 =C2=B1 82%      +0.6        0.94 =C2=B1 51%  perf-profile.chil=
dren.cycles-pp.vfs_read
>       0.34 =C2=B1 82%      +0.6        0.94 =C2=B1 51%  perf-profile.chil=
dren.cycles-pp.ksys_read
>       0.29 =C2=B1 96%      +0.6        0.90 =C2=B1 53%  perf-profile.chil=
dren.cycles-pp.perf_event_read
>       0.29 =C2=B1 96%      +0.6        0.90 =C2=B1 53%  perf-profile.chil=
dren.cycles-pp.smp_call_function_single
>       0.30 =C2=B1 96%      +0.6        0.91 =C2=B1 53%  perf-profile.chil=
dren.cycles-pp.__libc_read
>       0.29 =C2=B1 96%      +0.6        0.91 =C2=B1 52%  perf-profile.chil=
dren.cycles-pp.perf_read
>       4.41 =C2=B1 47%      +3.5        7.94 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.start_kernel
>       0.01 =C2=B1173%      +0.1        0.07 =C2=B1 19%  perf-profile.self=
.cycles-pp.cpuidle_enter_state
>       0.29 =C2=B1 98%      +0.6        0.90 =C2=B1 53%  perf-profile.self=
.cycles-pp.smp_call_function_single
>     161465 =C2=B1  7%     +66.5%     268796 =C2=B1 16%  softirqs.CPU0.SCH=
ED
>     154149 =C2=B1  4%     +57.3%     242412 =C2=B1  5%  softirqs.CPU1.SCH=
ED
>     217783 =C2=B1 10%     +17.4%     255655 =C2=B1  3%  softirqs.CPU10.RCU
>     685538 =C2=B1  6%     +16.3%     797133 =C2=B1  3%  softirqs.CPU10.TI=
MER
>     647482           +29.6%     839256 =C2=B1 14%  softirqs.CPU11.TIMER
>     215207 =C2=B1  9%     +19.8%     257893 =C2=B1  5%  softirqs.CPU12.RCU
>     676241 =C2=B1  4%     +20.5%     814890        softirqs.CPU12.TIMER
>     218513 =C2=B1  8%     +17.8%     257505 =C2=B1  4%  softirqs.CPU14.RCU
>     665815 =C2=B1  5%     +20.2%     800244 =C2=B1  3%  softirqs.CPU14.TI=
MER
>     217764 =C2=B1 10%     +16.0%     252579 =C2=B1  2%  softirqs.CPU15.RCU
>     671996 =C2=B1  2%     +18.0%     792743 =C2=B1 10%  softirqs.CPU15.TI=
MER
>     216810 =C2=B1 10%     +16.2%     251864 =C2=B1  3%  softirqs.CPU2.RCU
>     168050 =C2=B1  8%     +53.2%     257377 =C2=B1  4%  softirqs.CPU2.SCH=
ED
>     687608 =C2=B1  7%     +13.9%     783359 =C2=B1  5%  softirqs.CPU2.TIM=
ER
>     214659 =C2=B1 10%     +17.4%     252030 =C2=B1  2%  softirqs.CPU3.RCU
>     201381 =C2=B1  8%     +26.8%     255401 =C2=B1 10%  softirqs.CPU3.SCH=
ED
>     218567 =C2=B1  9%     +15.1%     251588 =C2=B1  4%  softirqs.CPU4.RCU
>     162228 =C2=B1 14%     +39.7%     226690 =C2=B1 21%  softirqs.CPU4.SCH=
ED
>     686728 =C2=B1  7%     +15.4%     792699 =C2=B1  4%  softirqs.CPU4.TIM=
ER
>     598763 =C2=B1  4%     +33.1%     796983 =C2=B1 15%  softirqs.CPU5.TIM=
ER
>     219495 =C2=B1 10%     +15.8%     254260 =C2=B1  4%  softirqs.CPU6.RCU
>     685621 =C2=B1  6%     +15.4%     790913 =C2=B1  4%  softirqs.CPU6.TIM=
ER
>     213675 =C2=B1 10%     +18.1%     252314 =C2=B1  2%  softirqs.CPU7.RCU
>     607580 =C2=B1  4%     +27.7%     776035 =C2=B1  7%  softirqs.CPU7.TIM=
ER
>     217328 =C2=B1 10%     +17.9%     256261 =C2=B1  4%  softirqs.CPU8.RCU
>     672277 =C2=B1  8%     +18.4%     795798 =C2=B1  3%  softirqs.CPU8.TIM=
ER
>     662696 =C2=B1 15%     +22.2%     809936 =C2=B1  6%  softirqs.CPU9.TIM=
ER
>    3471815 =C2=B1 10%     +16.7%    4051741 =C2=B1  2%  softirqs.RCU
>    2788089           +21.0%    3372673 =C2=B1  2%  softirqs.SCHED
>   10668573 =C2=B1  2%     +17.5%   12539415 =C2=B1  5%  softirqs.TIMER
>     250541           +31.8%     330137 =C2=B1  3%  sched_debug.cfs_rq:/.e=
xec_clock.avg
>     446877 =C2=B1  7%     +68.2%     751493 =C2=B1 18%  sched_debug.cfs_r=
q:/.exec_clock.max
>     112331 =C2=B1 17%    +122.7%     250151 =C2=B1 35%  sched_debug.cfs_r=
q:/.exec_clock.stddev
>    1517645           +35.0%    2049553 =C2=B1  3%  sched_debug.cfs_rq:/.m=
in_vruntime.avg
>    2633991 =C2=B1  6%     +65.2%    4352247 =C2=B1 18%  sched_debug.cfs_r=
q:/.min_vruntime.max
>     684251 =C2=B1 18%    +118.2%    1492888 =C2=B1 37%  sched_debug.cfs_r=
q:/.min_vruntime.stddev
>       0.46 =C2=B1  2%      +8.1%       0.50 =C2=B1  4%  sched_debug.cfs_r=
q:/.nr_running.avg
>    -292907          -321.0%     647293 =C2=B1 49%  sched_debug.cfs_rq:/.s=
pread0.avg
>     823435 =C2=B1 35%    +258.3%    2949987 =C2=B1 32%  sched_debug.cfs_r=
q:/.spread0.max
>     684251 =C2=B1 18%    +118.2%    1492888 =C2=B1 37%  sched_debug.cfs_r=
q:/.spread0.stddev
>     389.08           +10.3%     429.08 =C2=B1  3%  sched_debug.cfs_rq:/.u=
til_avg.avg
>     282.99 =C2=B1  2%     +13.1%     320.08 =C2=B1  6%  sched_debug.cfs_r=
q:/.util_est_enqueued.avg
>     383.98 =C2=B1  2%      +8.6%     416.84 =C2=B1  3%  sched_debug.cfs_r=
q:/.util_est_enqueued.stddev
>     842328           +25.8%    1059503        sched_debug.cpu.clock.avg
>     842329           +25.8%    1059503        sched_debug.cpu.clock.max
>     842327           +25.8%    1059502        sched_debug.cpu.clock.min
>       1.02 =C2=B1 69%     -49.5%       0.51        sched_debug.cpu.clock.=
stddev
>     842328           +25.8%    1059503        sched_debug.cpu.clock_task.=
avg
>     842329           +25.8%    1059503        sched_debug.cpu.clock_task.=
max
>     842327           +25.8%    1059502        sched_debug.cpu.clock_task.=
min
>       1.02 =C2=B1 69%     -49.5%       0.51        sched_debug.cpu.clock_=
task.stddev
>       6159 =C2=B1  3%     +29.3%       7966 =C2=B1  6%  sched_debug.cpu.c=
urr->pid.avg
>      21434           +25.0%      26795        sched_debug.cpu.curr->pid.m=
ax
>       7691 =C2=B1  2%     +26.8%       9755        sched_debug.cpu.curr->=
pid.stddev
>      57507 =C2=B1  2%     +27.2%      73171        sched_debug.cpu.nr_swi=
tches.avg
>      98634 =C2=B1  8%     +51.9%     149817 =C2=B1 22%  sched_debug.cpu.n=
r_switches.max
>      21105 =C2=B1 18%     +85.3%      39113 =C2=B1 41%  sched_debug.cpu.n=
r_switches.stddev
>      52692 =C2=B1  2%     +29.9%      68458        sched_debug.cpu.sched_=
count.avg
>      94966 =C2=B1  8%     +50.3%     142769 =C2=B1 25%  sched_debug.cpu.s=
ched_count.max
>      25787 =C2=B1  2%     +27.6%      32917        sched_debug.cpu.sched_=
goidle.avg
>      47100 =C2=B1  8%     +48.8%      70064 =C2=B1 26%  sched_debug.cpu.s=
ched_goidle.max
>      25109 =C2=B1  2%     +28.2%      32200        sched_debug.cpu.ttwu_c=
ount.avg
>      47736 =C2=B1  4%     +55.9%      74430 =C2=B1  9%  sched_debug.cpu.t=
twu_count.max
>      10778 =C2=B1 13%     +80.8%      19490 =C2=B1 29%  sched_debug.cpu.t=
twu_count.stddev
>      11888 =C2=B1  4%     +30.1%      15462        sched_debug.cpu.ttwu_l=
ocal.avg
>     842327           +25.8%    1059502        sched_debug.cpu_clk
>     839741           +25.9%    1056916        sched_debug.ktime
>     843284           +25.8%    1060461        sched_debug.sched_clk
>       1307           +27.3%       1663 =C2=B1 10%  interrupts.35:PCI-MSI.=
524289-edge.eth0-rx-0
>     884.50 =C2=B1  2%     +45.9%       1290 =C2=B1 26%  interrupts.42:PCI=
-MSI.524296-edge.eth0-tx-3
>    1810554 =C2=B1  9%     -24.9%    1359040        interrupts.CAL:Functio=
n_call_interrupts
>     128994 =C2=B1 13%     -54.5%      58688 =C2=B1 11%  interrupts.CPU0.C=
AL:Function_call_interrupts
>    3136833 =C2=B1  9%     +30.6%    4097106        interrupts.CPU0.LOC:Lo=
cal_timer_interrupts
>     147624 =C2=B1 12%     -63.5%      53903 =C2=B1  7%  interrupts.CPU0.T=
LB:TLB_shootdowns
>     131316 =C2=B1 12%     -58.5%      54545 =C2=B1  3%  interrupts.CPU1.C=
AL:Function_call_interrupts
>    3196967 =C2=B1  6%     +28.8%    4117877        interrupts.CPU1.LOC:Lo=
cal_timer_interrupts
>       1316 =C2=B1 44%    +134.5%       3086 =C2=B1 54%  interrupts.CPU1.R=
ES:Rescheduling_interrupts
>     150414 =C2=B1 17%     -65.7%      51585 =C2=B1 14%  interrupts.CPU1.T=
LB:TLB_shootdowns
>    3214233 =C2=B1  5%     +28.6%    4132526        interrupts.CPU10.LOC:L=
ocal_timer_interrupts
>       9879 =C2=B1 80%     -85.4%       1445 =C2=B1 45%  interrupts.CPU10.=
RES:Rescheduling_interrupts
>    3177700 =C2=B1  6%     +29.8%    4126192        interrupts.CPU11.LOC:L=
ocal_timer_interrupts
>     559.50 =C2=B1 46%    +253.3%       1976 =C2=B1 51%  interrupts.CPU11.=
RES:Rescheduling_interrupts
>       1307           +27.3%       1663 =C2=B1 10%  interrupts.CPU12.35:PC=
I-MSI.524289-edge.eth0-rx-0
>    3234073 =C2=B1  4%     +27.7%    4130544        interrupts.CPU12.LOC:L=
ocal_timer_interrupts
>       9543 =C2=B1 47%     -86.8%       1263 =C2=B1 55%  interrupts.CPU12.=
RES:Rescheduling_interrupts
>    3178037 =C2=B1  7%     +29.8%    4124112        interrupts.CPU13.LOC:L=
ocal_timer_interrupts
>    3234950 =C2=B1  4%     +27.7%    4130372        interrupts.CPU14.LOC:L=
ocal_timer_interrupts
>       7845 =C2=B1 61%     -86.3%       1074 =C2=B1 77%  interrupts.CPU14.=
RES:Rescheduling_interrupts
>    3177518 =C2=B1  7%     +29.8%    4123846        interrupts.CPU15.LOC:L=
ocal_timer_interrupts
>     115381 =C2=B1 14%     -46.8%      61375 =C2=B1 38%  interrupts.CPU2.C=
AL:Function_call_interrupts
>    3211923 =C2=B1  4%     +28.3%    4122113        interrupts.CPU2.LOC:Lo=
cal_timer_interrupts
>     128739 =C2=B1 17%     -57.7%      54470 =C2=B1 48%  interrupts.CPU2.T=
LB:TLB_shootdowns
>     884.50 =C2=B1  2%     +45.9%       1290 =C2=B1 26%  interrupts.CPU3.4=
2:PCI-MSI.524296-edge.eth0-tx-3
>    3189990 =C2=B1  6%     +29.1%    4119429        interrupts.CPU3.LOC:Lo=
cal_timer_interrupts
>       1680 =C2=B1 89%    +222.4%       5418 =C2=B1 50%  interrupts.CPU3.R=
ES:Rescheduling_interrupts
>    3207702 =C2=B1  5%     +28.7%    4126732        interrupts.CPU4.LOC:Lo=
cal_timer_interrupts
>     132646 =C2=B1 21%     -46.4%      71034 =C2=B1 60%  interrupts.CPU4.T=
LB:TLB_shootdowns
>    3185259 =C2=B1  7%     +29.4%    4121092        interrupts.CPU5.LOC:Lo=
cal_timer_interrupts
>       1237 =C2=B1 56%    +203.8%       3757 =C2=B1 37%  interrupts.CPU5.R=
ES:Rescheduling_interrupts
>    3200005 =C2=B1  5%     +29.0%    4128870        interrupts.CPU6.LOC:Lo=
cal_timer_interrupts
>    3187267 =C2=B1  7%     +29.4%    4125551        interrupts.CPU7.LOC:Lo=
cal_timer_interrupts
>     802.00 =C2=B1 53%    +280.5%       3051 =C2=B1 26%  interrupts.CPU7.R=
ES:Rescheduling_interrupts
>    3266308 =C2=B1  2%     +26.5%    4132734        interrupts.CPU8.LOC:Lo=
cal_timer_interrupts
>      23706 =C2=B1 90%     -82.0%       4262 =C2=B1 66%  interrupts.CPU8.R=
ES:Rescheduling_interrupts
>    3163000 =C2=B1  8%     +30.5%    4128371        interrupts.CPU9.LOC:Lo=
cal_timer_interrupts
>   51161770 =C2=B1  6%     +29.0%   65987472        interrupts.LOC:Local_t=
imer_interrupts
>    1944653 =C2=B1 10%     -31.9%    1325214        interrupts.TLB:TLB_sho=
otdowns
>       4.79           +19.6%       5.73        perf-stat.i.MPKI
>  1.596e+09           -19.9%  1.278e+09        perf-stat.i.branch-instruct=
ions
>       1.66            +0.1        1.76        perf-stat.i.branch-miss-rat=
e%
>   26901389           -14.4%   23036625        perf-stat.i.branch-misses
>   1.39e+08            -2.8%  1.351e+08        perf-stat.i.cache-references
>       0.61 =C2=B1  6%     +17.9%       0.72        perf-stat.i.cpi
>      16.50 =C2=B1  5%    +145.5%      40.52 =C2=B1  2%  perf-stat.i.cpu-m=
igrations
>       5919            -3.6%       5706 =C2=B1  2%  perf-stat.i.cycles-bet=
ween-cache-misses
>       0.05 =C2=B1  2%      +0.0        0.07        perf-stat.i.dTLB-load-=
miss-rate%
>    3285384 =C2=B1  3%     +15.2%    3784496        perf-stat.i.dTLB-load-=
misses
>  7.201e+09           -19.5%  5.793e+09        perf-stat.i.dTLB-loads
>       0.20 =C2=B1  2%      +0.0        0.22 =C2=B1  4%  perf-stat.i.dTLB-=
store-miss-rate%
>    3641778 =C2=B1  2%      -7.6%    3366197 =C2=B1  5%  perf-stat.i.dTLB-=
store-misses
>  1.925e+09           -19.5%  1.549e+09        perf-stat.i.dTLB-stores
>       0.01 =C2=B1  5%      +0.0        0.02 =C2=B1  2%  perf-stat.i.iTLB-=
load-miss-rate%
>    2872660 =C2=B1  2%     +25.9%    3617061 =C2=B1  2%  perf-stat.i.iTLB-=
load-misses
>  2.816e+10           -19.7%  2.261e+10        perf-stat.i.iTLB-loads
>  2.819e+10           -19.8%  2.261e+10        perf-stat.i.instructions
>      10654 =C2=B1  3%     -27.1%       7764 =C2=B1  2%  perf-stat.i.instr=
uctions-per-iTLB-miss
>       1.70 =C2=B1  4%     -14.9%       1.45        perf-stat.i.ipc
>       0.08 =C2=B1  2%     -20.0%       0.07 =C2=B1  2%  perf-stat.i.major=
-faults
>       4638 =C2=B1  3%     +15.4%       5354 =C2=B1  2%  perf-stat.i.minor=
-faults
>       4638 =C2=B1  3%     +15.4%       5354 =C2=B1  2%  perf-stat.i.page-=
faults
>       4.93           +21.2%       5.97        perf-stat.overall.MPKI
>       1.69            +0.1        1.80        perf-stat.overall.branch-mi=
ss-rate%
>       2.48 =C2=B1  4%      +0.2        2.66 =C2=B1  2%  perf-stat.overall=
.cache-miss-rate%
>       0.58 =C2=B1  2%     +25.2%       0.73        perf-stat.overall.cpi
>       0.05 =C2=B1  3%      +0.0        0.07        perf-stat.overall.dTLB=
-load-miss-rate%
>       0.19 =C2=B1  2%      +0.0        0.22 =C2=B1  5%  perf-stat.overall=
.dTLB-store-miss-rate%
>       0.01            +0.0        0.02 =C2=B1  2%  perf-stat.overall.iTLB=
-load-miss-rate%
>       9815 =C2=B1  2%     -36.3%       6253 =C2=B1  2%  perf-stat.overall=
.instructions-per-iTLB-miss
>       1.72 =C2=B1  2%     -20.2%       1.37        perf-stat.overall.ipc
>  1.595e+09           -19.9%  1.278e+09        perf-stat.ps.branch-instruc=
tions
>   26891393           -14.3%   23033727        perf-stat.ps.branch-misses
>  1.389e+08            -2.8%   1.35e+08        perf-stat.ps.cache-referenc=
es
>      16.50 =C2=B1  5%    +145.4%      40.50 =C2=B1  2%  perf-stat.ps.cpu-=
migrations
>    3283187 =C2=B1  3%     +15.2%    3782278        perf-stat.ps.dTLB-load=
-misses
>  7.196e+09           -19.5%   5.79e+09        perf-stat.ps.dTLB-loads
>    3639422 =C2=B1  2%      -7.6%    3364334 =C2=B1  5%  perf-stat.ps.dTLB=
-store-misses
>  1.924e+09           -19.5%  1.548e+09        perf-stat.ps.dTLB-stores
>    2870820 =C2=B1  2%     +25.9%    3614797 =C2=B1  2%  perf-stat.ps.iTLB=
-load-misses
>  2.814e+10           -19.7%   2.26e+10        perf-stat.ps.iTLB-loads
>  2.817e+10           -19.8%  2.259e+10        perf-stat.ps.instructions
>       0.08 =C2=B1  2%     -20.0%       0.07 =C2=B1  2%  perf-stat.ps.majo=
r-faults
>       4636 =C2=B1  3%     +15.5%       5353 =C2=B1  2%  perf-stat.ps.mino=
r-faults
>       4636 =C2=B1  3%     +15.5%       5353 =C2=B1  2%  perf-stat.ps.page=
-faults
>
>
>
>                    phoronix-test-suite.aom-av1.0.frames_per_second
>
>    0.04 +----------------------------------------------------------------=
---+
>         |                                                                =
   |
>   0.035 |-+                                                              =
   |
>    0.03 |-O  O O O O  O O O O  O O O O  O O O  O   O O  O   O O  O O O O =
 O |
>         |                                                                =
   |
>   0.025 |-+                                                              =
   |
>         |                                                                =
   |
>    0.02 |-+                                                              =
   |
>         |                                                                =
   |
>   0.015 |-+                                                              =
   |
>    0.01 |-+                                                              =
   |
>         |                                                                =
   |
>   0.005 |-+                                                              =
   |
>         |                                                                =
   |
>       0 +----------------------------------------------------------------=
---+
>
>
> [*] bisect-good sample
> [O] bisect-bad  sample
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
--===============2789650160194805888==--

