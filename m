Content-Type: multipart/mixed; boundary="===============2618980983609305556=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [locking/rwsem] 617f3ef951: unixbench.score -21.2% regression
Date: Wed, 23 Dec 2020 15:37:08 +0800
Message-ID: <5edd2ba6-9e81-ff31-a086-9e44773a2c23@linux.intel.com>
In-Reply-To: <20201217013242.GA27932@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2618980983609305556==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Waiman,

    Do you have time to look at this? Thanks.
    As you describe in commit: 617f3ef95177840c77f59c2aec1029d27d5547d6 =

("locking/rwsem: Remove reader optimistic spinning"), The patch that =

disables reader optimistic spinning shows reduced performance at lightly =

loaded cases, so for this regression, Is it as expected?

On 12/17/2020 9:33 AM, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed a -21.2% regression of unixbench.score due to commit:
> =

> =

> commit: 617f3ef95177840c77f59c2aec1029d27d5547d6 ("locking/rwsem: Remove =
reader optimistic spinning")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> =

> in testcase: unixbench
> on test machine: 16 threads Intel(R) Xeon(R) E-2278G CPU @ 3.40GHz with 3=
2G memory
> with following parameters:
> =

> 	runtime: 300s
> 	nr_task: 30%
> 	test: shell8
> 	cpufreq_governor: performance
> 	ucode: 0xde
> =

> test-description: UnixBench is the original BYTE UNIX benchmark suite aim=
s to test performance of Unix-like system.
> test-url: https://github.com/kdlucas/byte-unixbench
> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
> =

> =

> To reproduce:
> =

>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp install job.yaml  # job file is attached in this email
>          bin/lkp run     job.yaml
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/=
testcase/ucode:
>    gcc-9/performance/x86_64-rhel-8.3/30%/debian-10.4-x86_64-20200603.cgz/=
300s/lkp-cfl-e1/shell8/unixbench/0xde
> =

> commit:
>    1a728dff85 ("locking/rwsem: Enable reader optimistic lock stealing")
>    617f3ef951 ("locking/rwsem: Remove reader optimistic spinning")
> =

> 1a728dff855a318b 617f3ef95177840c77f59c2aec1
> ---------------- ---------------------------
>         fail:runs  %reproduction    fail:runs
>             |             |             |
>           39:4         -992%            :4     perf-profile.calltrace.cyc=
les-pp.error_entry
>           25:4         -635%            :4     perf-profile.children.cycl=
es-pp.error_entry
>           %stddev     %change         %stddev
>               \          |                \
>       21807 =C2=B1  3%     -21.2%      17186        unixbench.score
>     1287072 =C2=B1  3%     -38.7%     788414        unixbench.time.involu=
ntary_context_switches
>       37161 =C2=B1  4%     +31.3%      48798        unixbench.time.major_=
page_faults
>   1.047e+08 =C2=B1  3%     -21.1%   82610985        unixbench.time.minor_=
page_faults
>        1341           -27.1%     978.00        unixbench.time.percent_of_=
cpu_this_job_got
>      370.87           -33.3%     247.55        unixbench.time.system_time
>      490.05           -23.3%     376.03        unixbench.time.user_time
>     3083520 =C2=B1  3%     +59.7%    4924900        unixbench.time.volunt=
ary_context_switches
>      824314 =C2=B1  3%     -21.2%     649654        unixbench.workload
>        0.03 =C2=B1 27%     -51.9%       0.02 =C2=B1 59%  perf-sched.sch_d=
elay.avg.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
>      385.15 =C2=B1  2%     +62.5%     625.72        uptime.idle
>       17.03            -1.8%      16.73        boot-time.boot
>       11.01            -1.6%      10.83        boot-time.dhcp
>      214.12 =C2=B1  3%      -3.1%     207.49        boot-time.idle
>       13.72 =C2=B1  4%     +23.5       37.24        mpstat.cpu.all.idle%
>        1.06            -0.1        0.94        mpstat.cpu.all.irq%
>       49.32 =C2=B1  2%     -11.8       37.53        mpstat.cpu.all.sys%
>       35.24 =C2=B1  2%     -11.6       23.68        mpstat.cpu.all.usr%
>       15.50 =C2=B1  3%    +145.2%      38.00        vmstat.cpu.id
>       49.00 =C2=B1  2%     -22.4%      38.00        vmstat.cpu.sy
>       33.75 =C2=B1  2%     -33.3%      22.50 =C2=B1  2%  vmstat.cpu.us
>       21.75 =C2=B1  3%     -33.3%      14.50 =C2=B1  3%  vmstat.procs.r
>       97370 =C2=B1  3%     +56.4%     152258        vmstat.system.cs
>       37589            -2.1%      36804        vmstat.system.in
>       11861 =C2=B1  9%     -18.0%       9730        slabinfo.filp.active_=
objs
>       13242 =C2=B1  8%     -15.5%      11184        slabinfo.filp.num_objs
>       14731 =C2=B1  7%      -9.5%      13325 =C2=B1  5%  slabinfo.kmalloc=
-8.active_objs
>       14731 =C2=B1  7%      -9.5%      13325 =C2=B1  5%  slabinfo.kmalloc=
-8.num_objs
>        5545 =C2=B1  2%     -13.8%       4780 =C2=B1  4%  slabinfo.pid.act=
ive_objs
>        5563 =C2=B1  2%     -13.8%       4793 =C2=B1  4%  slabinfo.pid.num=
_objs
>        5822 =C2=B1 14%     -40.4%       3468 =C2=B1  5%  slabinfo.task_de=
lay_info.active_objs
>        5825 =C2=B1 14%     -40.5%       3468 =C2=B1  5%  slabinfo.task_de=
lay_info.num_objs
>    32104492 =C2=B1  3%    +303.3%  1.295e+08 =C2=B1 11%  cpuidle.C1.time
>      882330 =C2=B1  5%    +131.5%    2042656 =C2=B1 10%  cpuidle.C1.usage
>    21965263 =C2=B1  3%    +340.5%   96762398 =C2=B1 14%  cpuidle.C1E.time
>      442911 =C2=B1  2%    +211.3%    1378866 =C2=B1 14%  cpuidle.C1E.usage
>     6511399 =C2=B1  4%    +606.6%   46010023 =C2=B1 13%  cpuidle.C3.time
>       66498 =C2=B1  5%    +559.3%     438404 =C2=B1  9%  cpuidle.C3.usage
>      101453 =C2=B1 18%    +139.9%     243422 =C2=B1  7%  cpuidle.C6.usage
>    11612925 =C2=B1 66%    +228.1%   38105483 =C2=B1 21%  cpuidle.C8.time
>       12182 =C2=B1 65%    +220.7%      39070 =C2=B1 21%  cpuidle.C8.usage
>      173670 =C2=B1 30%    +166.5%     462831 =C2=B1  7%  cpuidle.POLL.time
>       17441 =C2=B1 18%    +195.6%      51559 =C2=B1  6%  cpuidle.POLL.usa=
ge
>       59652            +0.6%      60011        proc-vmstat.nr_inactive_an=
on
>        5840            +1.4%       5922        proc-vmstat.nr_kernel_stack
>        1404            +3.1%       1447        proc-vmstat.nr_page_table_=
pages
>       13255            -1.7%      13026        proc-vmstat.nr_slab_reclai=
mable
>       14861            -6.9%      13835 =C2=B1  4%  proc-vmstat.nr_slab_u=
nreclaimable
>       59652            +0.6%      60011        proc-vmstat.nr_zone_inacti=
ve_anon
>    70705198 =C2=B1  3%     -21.1%   55762717        proc-vmstat.numa_hit
>    70705198 =C2=B1  3%     -21.1%   55762717        proc-vmstat.numa_local
>      116793 =C2=B1  3%     -32.1%      79354        proc-vmstat.pgactivate
>    74803470 =C2=B1  3%     -20.7%   59317396        proc-vmstat.pgalloc_n=
ormal
>   1.049e+08 =C2=B1  3%     -21.1%   82849276        proc-vmstat.pgfault
>    74776100 =C2=B1  3%     -20.7%   59288922        proc-vmstat.pgfree
>     5338118 =C2=B1  3%     -24.5%    4030373        proc-vmstat.pgreuse
>        3413 =C2=B1  2%     -19.6%       2745        proc-vmstat.thp_fault=
_alloc
>     1466090 =C2=B1  3%     -21.2%    1155570        proc-vmstat.unevictab=
le_pgs_culled
>      382612 =C2=B1 60%     -66.4%     128559 =C2=B1  7%  sched_debug.cfs_=
rq:/.load.max
>      274.29 =C2=B1 53%     -48.2%     142.09 =C2=B1 15%  sched_debug.cfs_=
rq:/.load_avg.avg
>      452211           -25.5%     336912        sched_debug.cfs_rq:/.min_v=
runtime.avg
>      489002           -22.6%     378258 =C2=B1  2%  sched_debug.cfs_rq:/.=
min_vruntime.max
>      440439           -26.4%     324253        sched_debug.cfs_rq:/.min_v=
runtime.min
>      210358 =C2=B1  8%     -21.6%     164917 =C2=B1  9%  sched_debug.cpu.=
avg_idle.avg
>      666992 =C2=B1  9%     -14.4%     571102 =C2=B1  3%  sched_debug.cpu.=
avg_idle.max
>      183734 =C2=B1  2%     -10.3%     164859        sched_debug.cpu.avg_i=
dle.stddev
>        0.54 =C2=B1 19%     -29.1%       0.38 =C2=B1 15%  sched_debug.cpu.=
clock.stddev
>      199240 =C2=B1  3%     +53.0%     304861        sched_debug.cpu.nr_sw=
itches.avg
>      215766 =C2=B1  3%     +48.7%     320802        sched_debug.cpu.nr_sw=
itches.max
>      186135 =C2=B1  3%     +55.3%     289040        sched_debug.cpu.nr_sw=
itches.min
>       82.12 =C2=B1 12%    +247.2%     285.12 =C2=B1 11%  sched_debug.cpu.=
nr_uninterruptible.max
>     -122.88          +312.6%    -507.00        sched_debug.cpu.nr_uninter=
ruptible.min
>       51.87 =C2=B1 13%    +263.6%     188.58 =C2=B1  8%  sched_debug.cpu.=
nr_uninterruptible.stddev
>      242600 =C2=B1  5%     -33.6%     161055        softirqs.CPU0.RCU
>       15144 =C2=B1  2%     +14.4%      17328 =C2=B1  3%  softirqs.CPU0.SC=
HED
>       14371           +13.8%      16354 =C2=B1  3%  softirqs.CPU1.SCHED
>       14064 =C2=B1  2%     +10.1%      15480        softirqs.CPU10.SCHED
>      241990 =C2=B1  4%     -33.1%     161882        softirqs.CPU11.RCU
>       13889           +12.7%      15650        softirqs.CPU11.SCHED
>      239184 =C2=B1  7%     -33.4%     159310        softirqs.CPU12.RCU
>       13988 =C2=B1  3%     +12.3%      15711        softirqs.CPU13.SCHED
>       13744 =C2=B1  2%     +14.1%      15688 =C2=B1  2%  softirqs.CPU14.S=
CHED
>       14104           +12.8%      15912 =C2=B1  2%  softirqs.CPU2.SCHED
>      240729 =C2=B1  4%     -32.5%     162396        softirqs.CPU3.RCU
>       14143 =C2=B1  2%     +13.6%      16064 =C2=B1  3%  softirqs.CPU3.SC=
HED
>      240581 =C2=B1  5%     -31.9%     163890        softirqs.CPU4.RCU
>       13936           +10.5%      15402        softirqs.CPU5.SCHED
>       13761 =C2=B1  3%     +12.9%      15532        softirqs.CPU6.SCHED
>       14059           +11.8%      15724 =C2=B1  2%  softirqs.CPU7.SCHED
>      241270 =C2=B1  5%     -34.5%     157931 =C2=B1  2%  softirqs.CPU8.RCU
>       13695           +11.8%      15314 =C2=B1  2%  softirqs.CPU8.SCHED
>      225021           +12.1%     252248        softirqs.SCHED
>       14.09 =C2=B1 73%     -14.1        0.00        perf-profile.calltrac=
e.cycles-pp.do_filp_open.do_sys_openat2.do_sys_open.do_syscall_64.entry_SYS=
CALL_64_after_hwframe
>       14.09 =C2=B1 73%     -14.1        0.00        perf-profile.calltrac=
e.cycles-pp.path_openat.do_filp_open.do_sys_openat2.do_sys_open.do_syscall_=
64
>       10.52 =C2=B1 60%     -10.5        0.00        perf-profile.calltrac=
e.cycles-pp.setlocale
>        9.13 =C2=B1104%      -9.1        0.00        perf-profile.calltrac=
e.cycles-pp.free_pgtables.exit_mmap.mmput.do_exit.do_group_exit
>        8.43 =C2=B1 62%      -8.4        0.00        perf-profile.calltrac=
e.cycles-pp.entry_SYSCALL_64_after_hwframe.__open64_nocancel.setlocale
>        8.43 =C2=B1 62%      -8.4        0.00        perf-profile.calltrac=
e.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__open64_nocancel.=
setlocale
>        8.43 =C2=B1 62%      -8.4        0.00        perf-profile.calltrac=
e.cycles-pp.do_sys_open.do_syscall_64.entry_SYSCALL_64_after_hwframe.__open=
64_nocancel.setlocale
>        8.43 =C2=B1 62%      -8.4        0.00        perf-profile.calltrac=
e.cycles-pp.do_sys_openat2.do_sys_open.do_syscall_64.entry_SYSCALL_64_after=
_hwframe.__open64_nocancel
>        8.43 =C2=B1 62%      -8.4        0.00        perf-profile.calltrac=
e.cycles-pp.__open64_nocancel.setlocale
>        6.35 =C2=B1101%      -6.3        0.00        perf-profile.calltrac=
e.cycles-pp.unlink_file_vma.free_pgtables.exit_mmap.mmput.do_exit
>        4.86 =C2=B1102%      -4.9        0.00        perf-profile.calltrac=
e.cycles-pp.terminate_walk.path_openat.do_filp_open.do_sys_openat2.do_sys_o=
pen
>        6.35 =C2=B1101%      -3.6        2.78 =C2=B1173%  perf-profile.cal=
ltrace.cycles-pp.exit_mmap.mmput.do_exit.do_group_exit.__x64_sys_exit_group
>        6.35 =C2=B1101%      -3.6        2.78 =C2=B1173%  perf-profile.cal=
ltrace.cycles-pp.mmput.do_exit.do_group_exit.__x64_sys_exit_group.do_syscal=
l_64
>        7.98 =C2=B1 60%      -3.0        5.00 =C2=B1173%  perf-profile.cal=
ltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_=
SYSCALL_64_after_hwframe
>        7.98 =C2=B1 60%      -3.0        5.00 =C2=B1173%  perf-profile.cal=
ltrace.cycles-pp.arch_do_signal.exit_to_user_mode_prepare.syscall_exit_to_u=
ser_mode.entry_SYSCALL_64_after_hwframe
>        7.98 =C2=B1 60%      -3.0        5.00 =C2=B1173%  perf-profile.cal=
ltrace.cycles-pp.do_group_exit.get_signal.arch_do_signal.exit_to_user_mode_=
prepare.syscall_exit_to_user_mode
>        7.98 =C2=B1 60%      -3.0        5.00 =C2=B1173%  perf-profile.cal=
ltrace.cycles-pp.do_exit.do_group_exit.get_signal.arch_do_signal.exit_to_us=
er_mode_prepare
>        7.98 =C2=B1 60%      -3.0        5.00 =C2=B1173%  perf-profile.cal=
ltrace.cycles-pp.exit_mmap.mmput.do_exit.do_group_exit.get_signal
>        7.98 =C2=B1 60%      -3.0        5.00 =C2=B1173%  perf-profile.cal=
ltrace.cycles-pp.get_signal.arch_do_signal.exit_to_user_mode_prepare.syscal=
l_exit_to_user_mode.entry_SYSCALL_64_after_hwframe
>        7.98 =C2=B1 60%      -3.0        5.00 =C2=B1173%  perf-profile.cal=
ltrace.cycles-pp.mmput.do_exit.do_group_exit.get_signal.arch_do_signal
>        7.98 =C2=B1 60%      -3.0        5.00 =C2=B1173%  perf-profile.cal=
ltrace.cycles-pp.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe
>        6.35 =C2=B1101%      -0.8        5.55 =C2=B1173%  perf-profile.cal=
ltrace.cycles-pp.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after_=
hwframe
>        6.35 =C2=B1101%      -0.8        5.55 =C2=B1173%  perf-profile.cal=
ltrace.cycles-pp.do_group_exit.__x64_sys_exit_group.do_syscall_64.entry_SYS=
CALL_64_after_hwframe
>        6.35 =C2=B1101%      -0.8        5.55 =C2=B1173%  perf-profile.cal=
ltrace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64.e=
ntry_SYSCALL_64_after_hwframe
>       14.09 =C2=B1 73%     -14.1        0.00        perf-profile.children=
.cycles-pp.do_filp_open
>       14.09 =C2=B1 73%     -14.1        0.00        perf-profile.children=
.cycles-pp.do_sys_open
>       14.09 =C2=B1 73%     -14.1        0.00        perf-profile.children=
.cycles-pp.do_sys_openat2
>       14.09 =C2=B1 73%     -14.1        0.00        perf-profile.children=
.cycles-pp.path_openat
>       10.52 =C2=B1 60%     -10.5        0.00        perf-profile.children=
.cycles-pp.setlocale
>        9.13 =C2=B1104%      -9.1        0.00        perf-profile.children=
.cycles-pp.free_pgtables
>        8.43 =C2=B1 62%      -8.4        0.00        perf-profile.children=
.cycles-pp.__open64_nocancel
>        6.35 =C2=B1101%      -6.3        0.00        perf-profile.children=
.cycles-pp.sync_regs
>        6.35 =C2=B1101%      -6.3        0.00        perf-profile.children=
.cycles-pp.unlink_file_vma
>        4.86 =C2=B1102%      -4.9        0.00        perf-profile.children=
.cycles-pp.terminate_walk
>        7.98 =C2=B1 60%      -3.0        5.00 =C2=B1173%  perf-profile.chi=
ldren.cycles-pp.exit_to_user_mode_prepare
>        7.98 =C2=B1 60%      -3.0        5.00 =C2=B1173%  perf-profile.chi=
ldren.cycles-pp.arch_do_signal
>        7.98 =C2=B1 60%      -3.0        5.00 =C2=B1173%  perf-profile.chi=
ldren.cycles-pp.get_signal
>        7.98 =C2=B1 60%      -3.0        5.00 =C2=B1173%  perf-profile.chi=
ldren.cycles-pp.syscall_exit_to_user_mode
>        6.35 =C2=B1101%      -0.8        5.55 =C2=B1173%  perf-profile.chi=
ldren.cycles-pp.__x64_sys_exit_group
>        5.65 =C2=B1106%      -0.7        5.00 =C2=B1173%  perf-profile.chi=
ldren.cycles-pp.__mod_memcg_lruvec_state
>        5.65 =C2=B1106%      -0.1        5.55 =C2=B1173%  perf-profile.chi=
ldren.cycles-pp.handle_mm_fault
>        6.35 =C2=B1101%      -6.3        0.00        perf-profile.self.cyc=
les-pp.sync_regs
>       31246 =C2=B1  5%    +200.7%      93965        interrupts.CAL:Functi=
on_call_interrupts
>        2091 =C2=B1 11%    +179.5%       5844        interrupts.CPU0.CAL:F=
unction_call_interrupts
>       26624 =C2=B1  2%     -20.9%      21057        interrupts.CPU0.RES:R=
escheduling_interrupts
>      500.25 =C2=B1  7%    +378.2%       2392        interrupts.CPU0.TLB:T=
LB_shootdowns
>        1931 =C2=B1  4%    +201.7%       5827        interrupts.CPU1.CAL:F=
unction_call_interrupts
>       26939 =C2=B1  4%     -22.2%      20957        interrupts.CPU1.RES:R=
escheduling_interrupts
>      499.25 =C2=B1  5%    +374.8%       2370 =C2=B1  4%  interrupts.CPU1.=
TLB:TLB_shootdowns
>        1967 =C2=B1  6%    +195.8%       5820        interrupts.CPU10.CAL:=
Function_call_interrupts
>       26951 =C2=B1  2%     -19.9%      21594        interrupts.CPU10.RES:=
Rescheduling_interrupts
>      546.25          +336.4%       2384 =C2=B1  4%  interrupts.CPU10.TLB:=
TLB_shootdowns
>        1927 =C2=B1  3%    +211.0%       5994        interrupts.CPU11.CAL:=
Function_call_interrupts
>       26619 =C2=B1  2%     -18.7%      21630        interrupts.CPU11.RES:=
Rescheduling_interrupts
>      514.25 =C2=B1  6%    +361.8%       2374 =C2=B1  2%  interrupts.CPU11=
.TLB:TLB_shootdowns
>        1887 =C2=B1  9%    +206.9%       5791 =C2=B1  4%  interrupts.CPU12=
.CAL:Function_call_interrupts
>       26377 =C2=B1  4%     -19.5%      21237 =C2=B1  2%  interrupts.CPU12=
.RES:Rescheduling_interrupts
>      496.00 =C2=B1  3%    +372.8%       2345 =C2=B1  2%  interrupts.CPU12=
.TLB:TLB_shootdowns
>        1912 =C2=B1  7%    +208.6%       5899 =C2=B1  2%  interrupts.CPU13=
.CAL:Function_call_interrupts
>       27187 =C2=B1  4%     -20.1%      21734 =C2=B1  2%  interrupts.CPU13=
.RES:Rescheduling_interrupts
>      500.50 =C2=B1  5%    +380.5%       2405 =C2=B1  3%  interrupts.CPU13=
.TLB:TLB_shootdowns
>        1891 =C2=B1  7%    +215.1%       5960 =C2=B1  2%  interrupts.CPU14=
.CAL:Function_call_interrupts
>       26046 =C2=B1  4%     -17.0%      21627        interrupts.CPU14.RES:=
Rescheduling_interrupts
>      506.25 =C2=B1  9%    +367.9%       2368 =C2=B1  2%  interrupts.CPU14=
.TLB:TLB_shootdowns
>        1960 =C2=B1  4%    +195.8%       5798        interrupts.CPU15.CAL:=
Function_call_interrupts
>       26567 =C2=B1  4%     -19.7%      21342 =C2=B1  2%  interrupts.CPU15=
.RES:Rescheduling_interrupts
>      536.50 =C2=B1  3%    +350.6%       2417        interrupts.CPU15.TLB:=
TLB_shootdowns
>        2001 =C2=B1  4%    +190.3%       5811 =C2=B1  2%  interrupts.CPU2.=
CAL:Function_call_interrupts
>       27172 =C2=B1  3%     -21.5%      21338        interrupts.CPU2.RES:R=
escheduling_interrupts
>      539.00 =C2=B1  4%    +332.7%       2332 =C2=B1  3%  interrupts.CPU2.=
TLB:TLB_shootdowns
>        1950 =C2=B1  6%    +198.1%       5814        interrupts.CPU3.CAL:F=
unction_call_interrupts
>       26579 =C2=B1  2%     -19.2%      21479        interrupts.CPU3.RES:R=
escheduling_interrupts
>      504.75 =C2=B1  8%    +369.0%       2367 =C2=B1  4%  interrupts.CPU3.=
TLB:TLB_shootdowns
>        1965 =C2=B1 10%    +199.8%       5891        interrupts.CPU4.CAL:F=
unction_call_interrupts
>       26811 =C2=B1  3%     -19.8%      21512        interrupts.CPU4.RES:R=
escheduling_interrupts
>      515.75 =C2=B1  5%    +358.1%       2362 =C2=B1  2%  interrupts.CPU4.=
TLB:TLB_shootdowns
>        1935 =C2=B1  7%    +206.3%       5926        interrupts.CPU5.CAL:F=
unction_call_interrupts
>       26997 =C2=B1  3%     -20.4%      21486        interrupts.CPU5.RES:R=
escheduling_interrupts
>      531.25 =C2=B1  3%    +348.6%       2383        interrupts.CPU5.TLB:T=
LB_shootdowns
>        1904 =C2=B1  5%    +214.0%       5979        interrupts.CPU6.CAL:F=
unction_call_interrupts
>       26702 =C2=B1  4%     -20.1%      21341        interrupts.CPU6.RES:R=
escheduling_interrupts
>      505.25 =C2=B1  3%    +354.6%       2296 =C2=B1  2%  interrupts.CPU6.=
TLB:TLB_shootdowns
>        1933 =C2=B1  4%    +205.3%       5901        interrupts.CPU7.CAL:F=
unction_call_interrupts
>       26505 =C2=B1  3%     -19.6%      21302        interrupts.CPU7.RES:R=
escheduling_interrupts
>      494.00 =C2=B1  4%    +371.1%       2327 =C2=B1  3%  interrupts.CPU7.=
TLB:TLB_shootdowns
>        2003 =C2=B1  5%    +190.5%       5818        interrupts.CPU8.CAL:F=
unction_call_interrupts
>       26799 =C2=B1  3%     -20.2%      21376 =C2=B1  2%  interrupts.CPU8.=
RES:Rescheduling_interrupts
>      519.00 =C2=B1  4%    +364.7%       2411 =C2=B1  4%  interrupts.CPU8.=
TLB:TLB_shootdowns
>        1986 =C2=B1 10%    +196.5%       5888 =C2=B1  2%  interrupts.CPU9.=
CAL:Function_call_interrupts
>       26994 =C2=B1  3%     -20.6%      21439        interrupts.CPU9.RES:R=
escheduling_interrupts
>      526.00 =C2=B1  6%    +351.8%       2376        interrupts.CPU9.TLB:T=
LB_shootdowns
>      427874 =C2=B1  3%     -20.0%     342458        interrupts.RES:Resche=
duling_interrupts
>        8234 =C2=B1  2%    +360.4%      37914 =C2=B1  2%  interrupts.TLB:T=
LB_shootdowns
>       47.20            +6.4%      50.22        perf-stat.i.MPKI
>   9.902e+09 =C2=B1  3%     -19.6%  7.965e+09        perf-stat.i.branch-in=
structions
>        2.24            +0.1        2.32        perf-stat.i.branch-miss-ra=
te%
>   2.143e+08 =C2=B1  3%     -16.4%  1.791e+08        perf-stat.i.branch-mi=
sses
>    99172014 =C2=B1  2%     -15.6%   83714922        perf-stat.i.cache-mis=
ses
>   2.363e+09 =C2=B1  3%     -14.4%  2.022e+09        perf-stat.i.cache-ref=
erences
>      101957 =C2=B1  3%     +56.1%     159180        perf-stat.i.context-s=
witches
>        1.20 =C2=B1  3%      -5.8%       1.13        perf-stat.i.cpi
>   5.571e+10           -23.7%  4.249e+10        perf-stat.i.cpu-cycles
>       15111 =C2=B1  3%    +116.2%      32667        perf-stat.i.cpu-migra=
tions
>      610.84 =C2=B1  2%     -10.2%     548.56        perf-stat.i.cycles-be=
tween-cache-misses
>   1.234e+10 =C2=B1  3%     -19.7%  9.908e+09        perf-stat.i.dTLB-loads
>        0.05            +0.0        0.05        perf-stat.i.dTLB-store-mis=
s-rate%
>     3568011 =C2=B1  3%     -14.8%    3038208        perf-stat.i.dTLB-stor=
e-misses
>   7.127e+09 =C2=B1  3%     -19.9%  5.706e+09        perf-stat.i.dTLB-stor=
es
>       57.81            -2.0       55.78        perf-stat.i.iTLB-load-miss=
-rate%
>    10339942 =C2=B1  3%     -16.8%    8603048        perf-stat.i.iTLB-load=
-misses
>     7643641 =C2=B1  3%      -7.7%    7057126        perf-stat.i.iTLB-loads
>   4.833e+10 =C2=B1  3%     -19.6%  3.887e+10        perf-stat.i.instructi=
ons
>        5183            -1.9%       5085        perf-stat.i.instructions-p=
er-iTLB-miss
>        0.85 =C2=B1  4%      +5.6%       0.90        perf-stat.i.ipc
>      577.76 =C2=B1  4%     +32.0%     762.53        perf-stat.i.major-fau=
lts
>        3.48           -23.7%       2.66        perf-stat.i.metric.GHz
>        0.55 =C2=B1 44%     -77.5%       0.12 =C2=B1 30%  perf-stat.i.metr=
ic.K/sec
>        1986 =C2=B1  3%     -19.3%       1602        perf-stat.i.metric.M/=
sec
>     1599403 =C2=B1  3%     -20.7%    1268462        perf-stat.i.minor-fau=
lts
>     5321084 =C2=B1  3%     -15.9%    4474662        perf-stat.i.node-loads
>    32016465 =C2=B1  3%     -17.1%   26551337        perf-stat.i.node-stor=
es
>     1599980 =C2=B1  3%     -20.7%    1269225        perf-stat.i.page-faul=
ts
>       48.88            +6.4%      52.03        perf-stat.overall.MPKI
>        2.16            +0.1        2.25        perf-stat.overall.branch-m=
iss-rate%
>        4.20            -0.1        4.14        perf-stat.overall.cache-mi=
ss-rate%
>        1.15 =C2=B1  4%      -5.3%       1.09        perf-stat.overall.cpi
>      562.37 =C2=B1  3%      -9.7%     507.65        perf-stat.overall.cyc=
les-between-cache-misses
>        0.05            +0.0        0.05        perf-stat.overall.dTLB-sto=
re-miss-rate%
>       57.50            -2.6       54.94        perf-stat.overall.iTLB-loa=
d-miss-rate%
>        4674            -3.3%       4518        perf-stat.overall.instruct=
ions-per-iTLB-miss
>        0.87 =C2=B1  4%      +5.4%       0.91        perf-stat.overall.ipc
>   9.742e+09 =C2=B1  3%     -19.6%  7.836e+09        perf-stat.ps.branch-i=
nstructions
>   2.108e+08 =C2=B1  3%     -16.5%  1.762e+08        perf-stat.ps.branch-m=
isses
>    97569500 =C2=B1  2%     -15.6%   82348192        perf-stat.ps.cache-mi=
sses
>   2.324e+09 =C2=B1  3%     -14.4%  1.989e+09        perf-stat.ps.cache-re=
ferences
>      100305 =C2=B1  3%     +56.1%     156566        perf-stat.ps.context-=
switches
>   5.481e+10           -23.7%   4.18e+10        perf-stat.ps.cpu-cycles
>       14866 =C2=B1  3%    +116.1%      32130        perf-stat.ps.cpu-migr=
ations
>   1.214e+10 =C2=B1  3%     -19.7%  9.746e+09        perf-stat.ps.dTLB-loa=
ds
>     3510146 =C2=B1  3%     -14.9%    2988346        perf-stat.ps.dTLB-sto=
re-misses
>   7.012e+09 =C2=B1  3%     -20.0%  5.612e+09        perf-stat.ps.dTLB-sto=
res
>    10172369 =C2=B1  3%     -16.8%    8461956        perf-stat.ps.iTLB-loa=
d-misses
>     7519764 =C2=B1  3%      -7.7%    6941264        perf-stat.ps.iTLB-loa=
ds
>   4.755e+10 =C2=B1  3%     -19.6%  3.823e+10        perf-stat.ps.instruct=
ions
>      568.39 =C2=B1  4%     +32.0%     750.01        perf-stat.ps.major-fa=
ults
>     1573444 =C2=B1  3%     -20.7%    1247622        perf-stat.ps.minor-fa=
ults
>     5235200 =C2=B1  3%     -15.9%    4401366        perf-stat.ps.node-loa=
ds
>    31497428 =C2=B1  3%     -17.1%   26115335        perf-stat.ps.node-sto=
res
>     1574012 =C2=B1  3%     -20.7%    1248372        perf-stat.ps.page-fau=
lts
>   3.111e+12 =C2=B1  3%     -20.5%  2.473e+12        perf-stat.total.instr=
uctions
> =

> =

>                                                                          =
        =

>                               unixbench.time.user_time
>                                                                          =
        =

>    500 +-----------------------------------------------------------------=
----+
>        |.   +..+..+    +..+..+.+..+..+.+..+..+.+..+..+.+..+..+..+.+..+..+=
.+..|
>    480 |-+                                                               =
    |
>        |                                                                 =
    |
>    460 |-+                                                               =
    |
>        |                                                                 =
    |
>    440 |-+                                                               =
    |
>        |                                                                 =
    |
>    420 |-+                                                               =
    |
>        |                                                                 =
    |
>    400 |-+                                                               =
    |
>        |                                                                 =
    |
>    380 |-+                                   O    O  O O                 =
    |
>        |  O O  O  O O  O  O  O O  O  O O  O    O                         =
    |
>    360 +-----------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                              unixbench.time.system_time
>                                                                          =
        =

>    380 +-----------------------------------------------------------------=
----+
>        |..+.+..+..+.+..+..+..+.+..+.   +.    +.+..+..+.+..+..+..+.+.    +=
.+..|
>    360 |-+                                                               =
    |
>        |                                                                 =
    |
>    340 |-+                                                               =
    |
>        |                                                                 =
    |
>    320 |-+                                                               =
    |
>        |                                                                 =
    |
>    300 |-+                                                               =
    |
>        |                                                                 =
    |
>    280 |-+                                                               =
    |
>        |                                                                 =
    |
>    260 |-+                                O                              =
    |
>        |  O O  O  O O  O  O  O O  O  O O     O O  O  O O                 =
    |
>    240 +-----------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                      unixbench.time.percent_of_cpu_this_job_got
>                                                                          =
        =

>    1400 +----------------------------------------------------------------=
----+
>         |..+.+..+..+.+..    .+..  .+.+..+..+.+..+.+..+..+.+..+..+.       =
    |
>    1350 |-+             +..+    +.                                +..+..+=
.+..|
>    1300 |-+                                                              =
    |
>         |                                                                =
    |
>    1250 |-+                                                              =
    |
>    1200 |-+                                                              =
    |
>         |                                                                =
    |
>    1150 |-+                                                              =
    |
>    1100 |-+                                                              =
    |
>         |                                                                =
    |
>    1050 |-+                                                              =
    |
>    1000 |-+                                                              =
    |
>         |  O O  O  O O  O  O O  O  O O  O  O O  O O  O  O                =
    |
>     950 +----------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                             unixbench.time.minor_page_faults
>                                                                          =
        =

>     1.1e+08 +------------------------------------------------------------=
----+
>             |..+.+..+.+..+.+..+.+..+.+    +    +..+.+..+.+..+.+    +    +=
..+.|
>    1.05e+08 |-+                       :   ::   :               :   ::   :=
    |
>             |                          : :  : :                 : :  : : =
    |
>       1e+08 |-+                        : :  : :                 : :  : : =
    |
>             |                           +    +                   +    +  =
    |
>     9.5e+07 |-+                                                          =
    |
>             |                                                            =
    |
>       9e+07 |-+                                                          =
    |
>             |                                                            =
    |
>     8.5e+07 |-+                                                          =
    |
>             |  O O  O O  O O  O O    O    O    O  O O  O O               =
    |
>       8e+07 |-+                                                          =
    |
>             |                                                            =
    |
>     7.5e+07 +------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                         unixbench.time.voluntary_context_switches
>                                                                          =
        =

>      5e+06 +-------------------------------------------------------------=
----+
>            |  O O  O O  O O  O O    O    O       O                       =
    |
>            |                      O    O                                 =
    |
>    4.5e+06 |-+                              O                            =
    |
>            |                                                             =
    |
>            |                                                             =
    |
>      4e+06 |-+                                                           =
    |
>            |                                                             =
    |
>    3.5e+06 |-+                                                           =
    |
>            |                                                             =
    |
>            | .+.       .+.+..+.+..+.     +..   +.+..+.+..+.+..     +    +=
.+..|
>      3e+06 |.+  +..+.+.             +.. +    ..               +. .. + .. =
    |
>            |                           +    +                   +    +   =
    |
>            |                                                             =
    |
>    2.5e+06 +-------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                        unixbench.time.involuntary_context_switches
>                                                                          =
        =

>    1.4e+06 +-------------------------------------------------------------=
----+
>            |..+.+..+.+..+.+..     +.+..  +..   +.+..+.+..+.+..+    +    +=
    |
>    1.3e+06 |-+                  ..      +    ..                + .. + .. =
+ ..|
>            |                 +.+       +    +                   +    +   =
 +  |
>    1.2e+06 |-+                                                           =
    |
>            |                                                             =
    |
>    1.1e+06 |-+                                                           =
    |
>            |                                                             =
    |
>      1e+06 |-+                                                           =
    |
>            |                                                             =
    |
>     900000 |-+                                                           =
    |
>            |                                                             =
    |
>     800000 |-+O O  O O  O O    O    O    O     O O  O O  O               =
    |
>            |                 O    O    O    O                            =
    |
>     700000 +-------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                                     unixbench.score
>                                                                          =
        =

>    23000 +---------------------------------------------------------------=
----+
>          |..+.+..+.+..+..+.+..+..+.+    +     +.+..+.+..+..+.+     +    +=
.+..|
>    22000 |-+                        +  : :   :                :   : :  : =
    |
>    21000 |-+                         + :  :  :                 :  : :  : =
    |
>          |                            +   : :                  : :   ::  =
    |
>    20000 |-+                               +                    +    +   =
    |
>          |                                                               =
    |
>    19000 |-+                                                             =
    |
>          |                                                               =
    |
>    18000 |-+                                                             =
    |
>    17000 |-+O    O O  O  O O  O               O O  O O  O                =
    |
>          |    O                    O    O                                =
    |
>    16000 |-+                                                             =
    |
>          |                       O    O    O                             =
    |
>    15000 +---------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                                   unixbench.workload
>                                                                          =
        =

>    900000 +--------------------------------------------------------------=
----+
>           |                                                              =
    |
>    850000 |..+.+..+.+..+.+..+..+.+..+    +    +..+.+..+.+..+..+    +    +=
.+..|
>           |                          :  + +  :                 :  + :  + =
    |
>    800000 |-+                        : +   + :                 : +  : +  =
    |
>           |                           +     +                   +    +   =
    |
>    750000 |-+                                                            =
    |
>           |                                                              =
    |
>    700000 |-+                                                            =
    |
>           |                                                              =
    |
>    650000 |-+O O  O O  O O  O  O    O    O    O  O O  O O                =
    |
>           |                                                              =
    |
>    600000 |-+                    O    O     O                            =
    |
>           |                                                              =
    |
>    550000 +--------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
        =

> [*] bisect-good sample
> [O] bisect-bad  sample
> =

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
> Oliver Sang
> =

> =

> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
> =


-- =

Zhengjun Xing
--===============2618980983609305556==--

