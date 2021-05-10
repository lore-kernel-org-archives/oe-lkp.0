Content-Type: multipart/mixed; boundary="===============1942786176752680707=="
MIME-Version: 1.0
From: Shaokun Zhang <zhangshaokun@hisilicon.com>
To: lkp@lists.01.org
Subject: Re: [fs] aec499039e: unixbench.score 19.2% improvement
Date: Mon, 10 May 2021 20:03:22 +0800
Message-ID: <ee1535e9-0a74-a6b5-416c-e04dc691db0c@hisilicon.com>
In-Reply-To: <20210420061014.GC31773@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1942786176752680707==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi maintainers,

A gentle ping.

Thanks,
Shaokun

On 2021/4/20 14:10, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a 19.2% improvement of unixbench.score due to commit:
> =

> =

> commit: aec499039e7b21224ef29e5a2daba328aec14442 ("[PATCH] fs: Optimized =
file struct to improve performance")
> url: https://github.com/0day-ci/linux/commits/Shaokun-Zhang/fs-Optimized-=
file-struct-to-improve-performance/20210409-114859
> base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git 5e4=
6d1b78a03d52306f21f77a4e4a144b6d31486
> =

> in testcase: unixbench
> on test machine: 96 threads Intel(R) Xeon(R) CPU @ 2.30GHz with 128G memo=
ry
> with following parameters:
> =

> 	runtime: 300s
> 	nr_task: 30%
> 	test: syscall
> 	cpufreq_governor: performance
> 	ucode: 0x4003006
> =

> test-description: UnixBench is the original BYTE UNIX benchmark suite aim=
s to test performance of Unix-like system.
> test-url: https://github.com/kdlucas/byte-unixbench
> =

> =

> =

> =

> =

> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install                job.yaml  # job file is attached i=
n this email
>         bin/lkp split-job --compatible job.yaml
>         bin/lkp run                    compatible-job.yaml
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/=
testcase/ucode:
>   gcc-9/performance/x86_64-rhel-8.3/30%/debian-10.4-x86_64-20200603.cgz/3=
00s/lkp-csl-2sp4/syscall/unixbench/0x4003006
> =

> commit: =

>   5e46d1b78a ("reiserfs: update reiserfs_xattrs_initialized() condition")
>   aec499039e ("fs: Optimized file struct to improve performance")
> =

> 5e46d1b78a03d523 aec499039e7b21224ef29e5a2da =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>       2768           +19.2%       3298        unixbench.score
>     176.43           +19.8%     211.43        unixbench.time.user_time
>  1.622e+09           +19.2%  1.933e+09        unixbench.workload
>     348.17 =C2=B1 48%     -25.2%     260.57 =C2=B1 68%  proc-vmstat.nr_ml=
ock
>    4081405 =C2=B1133%     -99.2%      33639 =C2=B1 15%  turbostat.C1
>  1.348e+10 =C2=B1 89%     -76.6%  3.151e+09 =C2=B1190%  cpuidle.C6.time
>    1360129 =C2=B1137%     -86.4%     184629 =C2=B1  2%  cpuidle.POLL.time
>       1.00 =C2=B1 10%      -0.2        0.81 =C2=B1  3%  mpstat.cpu.all.ir=
q%
>       0.49            +0.1        0.59        mpstat.cpu.all.usr%
>       0.01 =C2=B1 23%     -36.4%       0.00 =C2=B1 13%  perf-sched.sch_de=
lay.avg.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
>       0.06 =C2=B1 43%     -48.4%       0.03 =C2=B1 42%  perf-sched.sch_de=
lay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_sysca=
ll_64
>       0.05 =C2=B1 49%     -55.1%       0.02 =C2=B1 47%  perf-sched.sch_de=
lay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_e=
poll_wait
>     765.20 =C2=B1 20%     -34.3%     502.83 =C2=B1 29%  perf-sched.wait_a=
nd_delay.avg.ms.schedule_timeout.io_schedule_timeout.wait_for_completion_io=
.blk_execute_rq
>       1930 =C2=B1 13%     -31.8%       1316 =C2=B1 30%  perf-sched.wait_a=
nd_delay.max.ms.schedule_timeout.io_schedule_timeout.wait_for_completion_io=
.blk_execute_rq
>     765.19 =C2=B1 20%     -34.3%     502.82 =C2=B1 29%  perf-sched.wait_t=
ime.avg.ms.schedule_timeout.io_schedule_timeout.wait_for_completion_io.blk_=
execute_rq
>       1930 =C2=B1 13%     -31.8%       1316 =C2=B1 30%  perf-sched.wait_t=
ime.max.ms.schedule_timeout.io_schedule_timeout.wait_for_completion_io.blk_=
execute_rq
>       2787 =C2=B1215%    -100.0%       0.71 =C2=B1162%  interrupts.124:PC=
I-MSI.31981657-edge.i40e-eth0-TxRx-88
>     385.17 =C2=B1128%     -99.9%       0.29 =C2=B1158%  interrupts.61:PCI=
-MSI.31981594-edge.i40e-eth0-TxRx-25
>       4052 =C2=B1 49%     -57.3%       1732 =C2=B1102%  interrupts.CPU27.=
NMI:Non-maskable_interrupts
>       4052 =C2=B1 49%     -57.3%       1732 =C2=B1102%  interrupts.CPU27.=
PMI:Performance_monitoring_interrupts
>     438.67 =C2=B1122%    +697.3%       3497 =C2=B1 37%  interrupts.CPU3.N=
MI:Non-maskable_interrupts
>     438.67 =C2=B1122%    +697.3%       3497 =C2=B1 37%  interrupts.CPU3.P=
MI:Performance_monitoring_interrupts
>     289.00 =C2=B1 84%   +1542.3%       4746 =C2=B1 24%  interrupts.CPU51.=
NMI:Non-maskable_interrupts
>     289.00 =C2=B1 84%   +1542.3%       4746 =C2=B1 24%  interrupts.CPU51.=
PMI:Performance_monitoring_interrupts
>     135.17 =C2=B1 18%     -29.9%      94.71 =C2=B1 26%  interrupts.CPU59.=
RES:Rescheduling_interrupts
>       4872 =C2=B1 27%     -48.9%       2490 =C2=B1 90%  interrupts.CPU74.=
NMI:Non-maskable_interrupts
>       4872 =C2=B1 27%     -48.9%       2490 =C2=B1 90%  interrupts.CPU74.=
PMI:Performance_monitoring_interrupts
>       2786 =C2=B1215%    -100.0%       0.43 =C2=B1169%  interrupts.CPU88.=
124:PCI-MSI.31981657-edge.i40e-eth0-TxRx-88
>      13.38 =C2=B1  7%     -13.4        0.00        perf-profile.calltrace=
.cycles-pp.dnotify_flush.filp_close.__x64_sys_close.do_syscall_64.entry_SYS=
CALL_64_after_hwframe
>      30.66 =C2=B1  9%      -6.4       24.27 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.filp_close.__x64_sys_close.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe
>      30.82 =C2=B1  9%      -6.4       24.46 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.__x64_sys_close.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       7.10 =C2=B1  8%      -1.3        5.85 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.filp_close.__x64_sys_close.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe.__close
>       7.14 =C2=B1  8%      -1.2        5.89 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.__x64_sys_close.do_syscall_64.entry_SYSCALL_64_after_hwfram=
e.__close
>       7.18 =C2=B1  8%      -1.2        5.93 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.__close
>       7.15 =C2=B1  8%      -1.2        5.91 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
>       7.27 =C2=B1  8%      -1.2        6.04 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.__close
>       5.29 =C2=B1  8%      +5.4       10.68 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.fput_many.filp_close.__x64_sys_close.do_syscall_64.entry_SY=
SCALL_64_after_hwframe
>      13.39 =C2=B1  7%     -13.3        0.07 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.dnotify_flush
>      37.79 =C2=B1  8%      -7.6       30.16 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.filp_close
>      37.97 =C2=B1  8%      -7.6       30.36 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.__x64_sys_close
>       7.30 =C2=B1  8%      -1.2        6.07 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.__close
>       0.70 =C2=B1 10%      -0.1        0.56 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.hrtimer_interrupt
>       0.71 =C2=B1 11%      -0.1        0.57 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.__sysvec_apic_timer_interrupt
>       0.39 =C2=B1 16%      -0.1        0.29 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.__hrtimer_run_queues
>       0.27 =C2=B1 13%      -0.1        0.22 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.tick_sched_timer
>       5.29 =C2=B1  8%      +5.4       10.69 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.fput_many
>      13.33 =C2=B1  7%     -13.3        0.06 =C2=B1 11%  perf-profile.self=
.cycles-pp.dnotify_flush
>       5.27 =C2=B1  8%      +5.4       10.64 =C2=B1 10%  perf-profile.self=
.cycles-pp.fput_many
>      17.97 =C2=B1 46%     -58.2%       7.51 =C2=B1 16%  perf-stat.i.MPKI
>  1.073e+09           +16.2%  1.247e+09        perf-stat.i.branch-instruct=
ions
>       2.60 =C2=B1 34%      -1.0        1.62 =C2=B1  2%  perf-stat.i.branc=
h-miss-rate%
>   56435130 =C2=B1 26%     -31.6%   38588360 =C2=B1 21%  perf-stat.i.cache=
-references
>      12.06 =C2=B1  3%     -15.8%      10.16        perf-stat.i.cpi
>       0.10 =C2=B1100%      -0.1        0.02 =C2=B1202%  perf-stat.i.dTLB-=
load-miss-rate%
>  1.682e+09           +16.9%  1.965e+09        perf-stat.i.dTLB-loads
>       0.03 =C2=B1 93%      -0.0        0.01 =C2=B1142%  perf-stat.i.dTLB-=
store-miss-rate%
>   1.11e+09           +17.5%  1.304e+09        perf-stat.i.dTLB-stores
>  5.314e+09           +16.2%  6.176e+09        perf-stat.i.instructions
>       0.10 =C2=B1 11%     +18.1%       0.12 =C2=B1  2%  perf-stat.i.ipc
>      40.93           +16.1%      47.51        perf-stat.i.metric.M/sec
>      89.63 =C2=B1  2%      +6.5       96.16        perf-stat.i.node-load-=
miss-rate%
>    3653512 =C2=B1  3%     -57.3%    1561506        perf-stat.i.node-load-=
misses
>     371566 =C2=B1 19%     -90.8%      34031 =C2=B1  8%  perf-stat.i.node-=
loads
>      10.59 =C2=B1 25%     -40.8%       6.27 =C2=B1 23%  perf-stat.overall=
.MPKI
>       1.92 =C2=B1  8%      -0.3        1.61        perf-stat.overall.bran=
ch-miss-rate%
>      13.04           -14.2%      11.19        perf-stat.overall.cpi
>       0.02 =C2=B1 89%      -0.0        0.00 =C2=B1148%  perf-stat.overall=
.dTLB-load-miss-rate%
>       0.00 =C2=B1 72%      -0.0        0.00 =C2=B1 69%  perf-stat.overall=
.dTLB-store-miss-rate%
>     318.50           +13.2%     360.58        perf-stat.overall.instructi=
ons-per-iTLB-miss
>       0.08           +16.6%       0.09        perf-stat.overall.ipc
>      90.76 =C2=B1  2%      +7.1       97.87        perf-stat.overall.node=
-load-miss-rate%
>       1286            -2.7%       1251        perf-stat.overall.path-leng=
th
>  1.072e+09           +16.2%  1.246e+09        perf-stat.ps.branch-instruc=
tions
>   1.68e+09           +16.9%  1.964e+09        perf-stat.ps.dTLB-loads
>  1.109e+09           +17.6%  1.303e+09        perf-stat.ps.dTLB-stores
>  5.307e+09           +16.3%  6.171e+09        perf-stat.ps.instructions
>    3649615 =C2=B1  3%     -57.2%    1560409        perf-stat.ps.node-load=
-misses
>     371135 =C2=B1 19%     -90.9%      33946 =C2=B1  8%  perf-stat.ps.node=
-loads
>  2.086e+12           +16.0%  2.419e+12        perf-stat.total.instructions
>      10629 =C2=B1 12%     -17.7%       8746 =C2=B1  8%  softirqs.CPU10.RCU
>       9891 =C2=B1  7%     -14.6%       8447 =C2=B1  9%  softirqs.CPU13.RCU
>      43153 =C2=B1  3%      -7.4%      39975 =C2=B1  4%  softirqs.CPU30.SC=
HED
>       9938 =C2=B1  6%     -12.9%       8660 =C2=B1  2%  softirqs.CPU33.RCU
>       9900 =C2=B1  9%     -14.1%       8500 =C2=B1  5%  softirqs.CPU38.RCU
>       9730 =C2=B1  6%     -10.3%       8731 =C2=B1  7%  softirqs.CPU40.RCU
>      10238 =C2=B1  8%     -15.0%       8703 =C2=B1  9%  softirqs.CPU44.RCU
>      10045 =C2=B1 10%     -15.7%       8471 =C2=B1  6%  softirqs.CPU45.RCU
>      10074 =C2=B1  7%     -15.4%       8524 =C2=B1  6%  softirqs.CPU46.RCU
>       9793 =C2=B1  6%     -12.0%       8617 =C2=B1  8%  softirqs.CPU49.RCU
>      10809 =C2=B1 18%     -19.0%       8750 =C2=B1  8%  softirqs.CPU50.RCU
>      10484 =C2=B1  7%     -13.3%       9088 =C2=B1 10%  softirqs.CPU53.RCU
>      10059 =C2=B1  7%     -13.2%       8732 =C2=B1  7%  softirqs.CPU54.RCU
>      10298 =C2=B1  4%     -13.5%       8912 =C2=B1  7%  softirqs.CPU55.RCU
>       9932 =C2=B1  8%     -12.4%       8699 =C2=B1  5%  softirqs.CPU60.RCU
>      10268 =C2=B1  9%     -17.1%       8514 =C2=B1  7%  softirqs.CPU61.RCU
>       9895 =C2=B1  5%      -9.0%       9008 =C2=B1  5%  softirqs.CPU67.RCU
>      10294 =C2=B1  8%     -12.0%       9060 =C2=B1  5%  softirqs.CPU68.RCU
>      11048 =C2=B1 14%     -17.2%       9152 =C2=B1  6%  softirqs.CPU69.RCU
>       9586 =C2=B1  7%      -9.1%       8715 =C2=B1  5%  softirqs.CPU74.RCU
>       9555 =C2=B1  7%     -10.1%       8587 =C2=B1  5%  softirqs.CPU76.RCU
>       9892 =C2=B1 10%     -14.8%       8425 =C2=B1  5%  softirqs.CPU80.RCU
>       9722 =C2=B1  6%     -13.5%       8407 =C2=B1  6%  softirqs.CPU82.RCU
>       9883 =C2=B1  6%     -12.7%       8624 =C2=B1  4%  softirqs.CPU83.RCU
>       9507 =C2=B1  5%      -9.9%       8567 =C2=B1  4%  softirqs.CPU84.RCU
>       9878 =C2=B1  8%     -14.1%       8485 =C2=B1  3%  softirqs.CPU85.RCU
>      37959 =C2=B1  4%     -12.9%      33055 =C2=B1  6%  softirqs.CPU85.SC=
HED
>      10338 =C2=B1 12%     -16.6%       8623 =C2=B1  4%  softirqs.CPU86.RCU
>       9885 =C2=B1  8%     -14.8%       8423 =C2=B1  4%  softirqs.CPU87.RCU
>       9934 =C2=B1  7%     -12.9%       8649 =C2=B1  5%  softirqs.CPU88.RCU
>      10119 =C2=B1  8%     -16.0%       8502 =C2=B1  5%  softirqs.CPU89.RCU
>       9958 =C2=B1  7%     -13.5%       8612 =C2=B1  4%  softirqs.CPU92.RCU
>       9917 =C2=B1  8%     -14.3%       8498 =C2=B1  5%  softirqs.CPU93.RCU
>      10070 =C2=B1  8%     -14.3%       8625 =C2=B1  6%  softirqs.CPU94.RCU
>      10157 =C2=B1 11%     -11.7%       8967 =C2=B1  7%  softirqs.CPU95.RCU
>      19377 =C2=B1 60%     -69.7%       5871 =C2=B1 82%  softirqs.NET_RX
>     944995 =C2=B1  4%     -10.5%     845954 =C2=B1  6%  softirqs.RCU
> =

> =

>                                                                          =
       =

>                                   unixbench.score                        =
       =

>                                                                          =
       =

>   3400 +-----------------------------------------------------------------=
---+   =

>   3300 |-+O  O      O    OO OO     OO OO                                 =
   |   =

>        |O     O OO O            O         O                              =
   |   =

>   3200 |-+ O          O       O          O                               =
   |   =

>   3100 |-+                                                               =
   |   =

>        |                                                                 =
   |   =

>   3000 |-+                                                               =
   |   =

>   2900 |-+                                                               =
   |   =

>   2800 |-+                                                          .+  +=
+. |   =

>        |                               +.     .++  +.+++.++.++.++.++  :+ =
  +|   =

>   2700 |+.++.     .+   +.     +.+ .++.+  + .++   + :                  +  =
   |   =

>   2600 |-+   ++  +  :.+  +  ++   +        +       +                      =
   |   =

>        |       + :  +     :+                                             =
   |   =

>   2500 |-+      +         +                                              =
   |   =

>   2400 +-----------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                                   unixbench.workload                     =
       =

>                                                                          =
       =

>     2e+09 +--------------------------------------------------------------=
---+   =

>           |  O  O      O   OO OO     OOO O                               =
   |   =

>   1.9e+09 |O+     O OO            O         O                            =
   |   =

>           |   O  O      O       O         O                              =
   |   =

>           |                                                              =
   |   =

>   1.8e+09 |-+                                                            =
   |   =

>           |                                                              =
   |   =

>   1.7e+09 |-+                                                            =
   |   =

>           |                                                          +  +=
+. |   =

>   1.6e+09 |-+ +          +              .+      ++  +.+++.++.+++.++.+ :+ =
  +|   =

>           |+.+ +     +   :+     +.+ .+++  +. +.+  + :                 +  =
   |   =

>           |     ++ .+ + +  +  ++   +        +      +                     =
   |   =

>   1.5e+09 |-+     +    +    :+                                           =
   |   =

>           |                 +                                            =
   |   =

>   1.4e+09 +--------------------------------------------------------------=
---+   =

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

> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Ce=
nter
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpo=
ration
> =

> Thanks,
> Oliver Sang
>=20
--===============1942786176752680707==--

