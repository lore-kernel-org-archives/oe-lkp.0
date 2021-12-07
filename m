Content-Type: multipart/mixed; boundary="===============2542132941836245975=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/signal] 3aac3ebea0: will-it-scale.per_thread_ops -11.9% regression
Date: Tue, 07 Dec 2021 09:44:44 +0800
Message-ID: <20211207014444.GB16074@xsang-OptiPlex-9020>
In-Reply-To: <20211207012128.GA16074@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2542132941836245975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BTW, attached dmesg, and parent dmesg (dmesg-parent.xz) FYI

On Tue, Dec 07, 2021 at 09:21:28AM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> (please be noted we made some further analysis before reporting out,
> and thought it's likely the regression is related with the extra spinlock
> introducded by enalbling DYNAMIC_SIGFRAME. below is the full report.)
> =

> FYI, we noticed a -11.9% regression of will-it-scale.per_thread_ops due t=
o commit:
> =

> =

> commit: 3aac3ebea08f2d342364f827c8979ab0e1dd591e ("x86/signal: Implement =
sigaltstack size validation")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: will-it-scale
> on test machine: 144 threads 4 sockets Intel(R) Xeon(R) CPU E7-8890 v3 @ =
2.50GHz with 512G memory
> with following parameters:
> =

> 	nr_task: 16
> 	mode: thread
> 	test: signal1
> 	cpufreq_governor: performance
> 	ucode: 0x16
> =

> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale
> =

> In addition to that, the commit also has significant impact on the follow=
ing tests:
> =

> +------------------+-----------------------------------------------------=
--------------------------------+
> | testcase: change | will-it-scale: will-it-scale.per_thread_ops -13.5% r=
egression                       |
> | test machine     | 144 threads 4 sockets Intel(R) Xeon(R) Gold 5318H CP=
U @ 2.50GHz with 128G memory    |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                  |
> |                  | mode=3Dthread                                       =
                                  |
> |                  | nr_task=3D16                                        =
                                  |
> |                  | test=3Dsignal1                                      =
                                  |
> |                  | ucode=3D0x7002302                                   =
                                  |
> +------------------+-----------------------------------------------------=
--------------------------------+
> | testcase: change | will-it-scale: will-it-scale.per_thread_ops -12.8% r=
egression                       |
> | test machine     | 88 threads 2 sockets Intel(R) Xeon(R) Gold 6238M CPU=
 @ 2.10GHz with 128G memory     |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                  |
> |                  | mode=3Dthread                                       =
                                  |
> |                  | nr_task=3D16                                        =
                                  |
> |                  | test=3Dsignal1                                      =
                                  |
> |                  | ucode=3D0x5003006                                   =
                                  |
> +------------------+-----------------------------------------------------=
--------------------------------+
> | testcase: change | will-it-scale: will-it-scale.per_thread_ops -10.2% r=
egression                       |
> | test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358=
 CPU @ 2.60GHz with 128G memory |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                  |
> |                  | mode=3Dthread                                       =
                                  |
> |                  | nr_task=3D16                                        =
                                  |
> |                  | test=3Dsignal1                                      =
                                  |
> |                  | ucode=3D0xd000280                                   =
                                  |
> +------------------+-----------------------------------------------------=
--------------------------------+
> | testcase: change | will-it-scale: will-it-scale.per_thread_ops -11.9% r=
egression                       |
> | test machine     | 144 threads 4 sockets Intel(R) Xeon(R) CPU E7-8890 v=
3 @ 2.50GHz with 512G memory    |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                  |
> |                  | debug-setup=3Dno-monitor                            =
                                  |
> |                  | mode=3Dthread                                       =
                                  |
> |                  | nr_task=3D16                                        =
                                  |
> |                  | test=3Dsignal1                                      =
                                  |
> |                  | ucode=3D0x16                                        =
                                  |
> +------------------+-----------------------------------------------------=
--------------------------------+
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

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         sudo bin/lkp install job.yaml           # job file is attached in=
 this email
>         bin/lkp split-job --compatible job.yaml # generate the yaml file =
for lkp run
>         sudo bin/lkp run generated-yaml-file
> =

>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/tes=
tcase/ucode:
>   gcc-9/performance/x86_64-rhel-8.3/thread/16/debian-10.4-x86_64-20200603=
.cgz/lkp-hsw-4ex1/signal1/will-it-scale/0x16
> =

> commit: =

>   1bdda24c4a ("signal: Add an optional check for altstack size")
>   3aac3ebea0 ("x86/signal: Implement sigaltstack size validation")
> =

> 1bdda24c4af64cd2 3aac3ebea08f2d342364f827c89 =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     754824 =C2=B1  2%     -11.9%     664668 =C2=B1  2%  will-it-scale.16.=
threads
>      47176 =C2=B1  2%     -11.9%      41541 =C2=B1  2%  will-it-scale.per=
_thread_ops
>     754824 =C2=B1  2%     -11.9%     664668 =C2=B1  2%  will-it-scale.wor=
kload
>    1422782 =C2=B1  8%  +3.3e+05     1751520 =C2=B1 12%  syscalls.sys_getp=
id.noise.5%
>  1.583e+10            -2.1%   1.55e+10        perf-stat.i.instructions
>    6328594 =C2=B1  2%     +11.1%    7032338 =C2=B1  2%  perf-stat.overall=
.path-length
>  1.578e+10            -2.1%  1.545e+10        perf-stat.ps.instructions
>  4.774e+12            -2.2%  4.671e+12        perf-stat.total.instructions
>       0.00            +6.3        6.33 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.do_sigaltsta=
ck.restore_altstack.__x64_sys_rt_sigreturn
>       0.00            +6.5        6.51 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock_irq.do_sigaltstack.restore_altstack.__x64_sys_rt_=
sigreturn.do_syscall_64
>       0.00            +6.6        6.58 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.do_sigaltstack.restore_altstack.__x64_sys_rt_sigreturn.do_syscal=
l_64.entry_SYSCALL_64_after_hwframe
>       0.00            +6.6        6.62 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.restore_altstack.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe.raise
>       0.00            +6.9        6.88 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame.raise
>       7.99 =C2=B1 12%      +6.0       14.00 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.__x64_sys_rt_sigreturn
>       0.05 =C2=B1 44%      +6.6        6.62 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.restore_altstack
>       0.00            +6.6        6.58 =C2=B1  8%  perf-profile.children.=
cycles-pp.do_sigaltstack
> =

> =

> *************************************************************************=
**************************
> lkp-cpl-4sp1: 144 threads 4 sockets Intel(R) Xeon(R) Gold 5318H CPU @ 2.5=
0GHz with 128G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/tes=
tcase/ucode:
>   gcc-9/performance/x86_64-rhel-8.3/thread/16/debian-10.4-x86_64-20200603=
.cgz/lkp-cpl-4sp1/signal1/will-it-scale/0x7002302
> =

> commit: =

>   1bdda24c4a ("signal: Add an optional check for altstack size")
>   3aac3ebea0 ("x86/signal: Implement sigaltstack size validation")
> =

> 1bdda24c4af64cd2 3aac3ebea08f2d342364f827c89 =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     675380           -13.5%     584407        will-it-scale.16.threads
>      42210           -13.5%      36524        will-it-scale.per_thread_ops
>     675380           -13.5%     584407        will-it-scale.workload
>       0.15 =C2=B1  5%      -0.0        0.13 =C2=B1  3%  mpstat.cpu.all.us=
r%
>      63069 =C2=B1 94%    +215.0%     198665 =C2=B1 69%  numa-numastat.nod=
e2.local_node
>     124789 =C2=B1 47%    +101.2%     251132 =C2=B1 55%  numa-numastat.nod=
e2.numa_hit
>       4994 =C2=B1129%    +930.8%      51482 =C2=B1120%  numa-meminfo.node=
2.AnonPages
>       8822 =C2=B1104%    +546.6%      57051 =C2=B1103%  numa-meminfo.node=
2.Inactive
>       8822 =C2=B1104%    +546.6%      57051 =C2=B1103%  numa-meminfo.node=
2.Inactive(anon)
>       1248 =C2=B1129%    +930.8%      12868 =C2=B1120%  numa-vmstat.node2=
.nr_anon_pages
>       2205 =C2=B1104%    +546.6%      14260 =C2=B1102%  numa-vmstat.node2=
.nr_inactive_anon
>       2205 =C2=B1104%    +546.6%      14260 =C2=B1102%  numa-vmstat.node2=
.nr_zone_inactive_anon
>       6100 =C2=B1114%    +323.1%      25809 =C2=B1 49%  proc-vmstat.numa_=
pages_migrated
>      55034 =C2=B1 12%     +66.9%      91844 =C2=B1 28%  proc-vmstat.numa_=
pte_updates
>       6100 =C2=B1114%    +323.1%      25809 =C2=B1 49%  proc-vmstat.pgmig=
rate_success
>  1.244e+09 =C2=B1  2%      -6.6%  1.163e+09        perf-stat.i.branch-ins=
tructions
>  1.666e+09 =C2=B1  2%      -7.4%  1.543e+09 =C2=B1  2%  perf-stat.i.dTLB-=
loads
>   8.87e+08 =C2=B1  2%      -9.5%  8.031e+08        perf-stat.i.dTLB-stores
>    5723495            -9.7%    5166133 =C2=B1  2%  perf-stat.i.iTLB-load-=
misses
>  5.918e+09 =C2=B1  2%      -6.8%  5.513e+09 =C2=B1  2%  perf-stat.i.instr=
uctions
>      27.07 =C2=B1  2%      -9.3%      24.54        perf-stat.i.metric.M/s=
ec
>    2636841            +7.7%    2840349 =C2=B1  2%  perf-stat.overall.path=
-length
>   1.24e+09 =C2=B1  2%      -6.6%  1.159e+09        perf-stat.ps.branch-in=
structions
>  1.661e+09 =C2=B1  2%      -7.4%  1.538e+09 =C2=B1  2%  perf-stat.ps.dTLB=
-loads
>   8.84e+08 =C2=B1  2%      -9.5%  8.004e+08        perf-stat.ps.dTLB-stor=
es
>    5704350            -9.7%    5148701 =C2=B1  2%  perf-stat.ps.iTLB-load=
-misses
>  5.898e+09 =C2=B1  2%      -6.8%  5.494e+09 =C2=B1  2%  perf-stat.ps.inst=
ructions
>  1.781e+12 =C2=B1  2%      -6.8%   1.66e+12 =C2=B1  2%  perf-stat.total.i=
nstructions
>       0.00            +8.6        8.55 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.do_sigaltsta=
ck.restore_altstack.__x64_sys_rt_sigreturn
>       0.00            +8.7        8.71 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock_irq.do_sigaltstack.restore_altstack.__x64_sys_rt_=
sigreturn.do_syscall_64
>       0.00            +8.8        8.77 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.do_sigaltstack.restore_altstack.__x64_sys_rt_sigreturn.do_syscal=
l_64.entry_SYSCALL_64_after_hwframe
>       0.00            +8.8        8.83 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.restore_altstack.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe.raise
>       0.31 =C2=B1 86%      +8.9        9.19 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after=
_hwframe.raise
>       0.39 =C2=B1  5%      -0.0        0.34 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.__dequeue_signal
>       0.24 =C2=B1  8%      -0.0        0.21 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.__sigqueue_alloc
>       0.15 =C2=B1  7%      -0.0        0.12 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.inc_rlimit_ucounts
>      11.19 =C2=B1  9%      +7.3       18.49 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.__x64_sys_rt_sigreturn
>       0.07 =C2=B1 14%      +8.8        8.83 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.restore_altstack
>       0.00            +8.8        8.77 =C2=B1  8%  perf-profile.children.=
cycles-pp.do_sigaltstack
>       0.23 =C2=B1 10%      -0.0        0.19 =C2=B1 10%  perf-profile.self=
.cycles-pp.syscall_return_via_sysret
>       0.15 =C2=B1  7%      -0.0        0.12 =C2=B1 10%  perf-profile.self=
.cycles-pp.inc_rlimit_ucounts
>       0.10 =C2=B1 13%      +0.1        0.23 =C2=B1 11%  perf-profile.self=
.cycles-pp.entry_SYSCALL_64_after_hwframe
> =

> =

> =

> *************************************************************************=
**************************
> lkp-csl-2sp9: 88 threads 2 sockets Intel(R) Xeon(R) Gold 6238M CPU @ 2.10=
GHz with 128G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/tes=
tcase/ucode:
>   gcc-9/performance/x86_64-rhel-8.3/thread/16/debian-10.4-x86_64-20200603=
.cgz/lkp-csl-2sp9/signal1/will-it-scale/0x5003006
> =

> commit: =

>   1bdda24c4a ("signal: Add an optional check for altstack size")
>   3aac3ebea0 ("x86/signal: Implement sigaltstack size validation")
> =

> 1bdda24c4af64cd2 3aac3ebea08f2d342364f827c89 =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     644316 =C2=B1  2%     -12.8%     561880        will-it-scale.16.threa=
ds
>      40269 =C2=B1  2%     -12.8%      35117        will-it-scale.per_thre=
ad_ops
>     644316 =C2=B1  2%     -12.8%     561880        will-it-scale.workload
>       0.28            -0.0        0.24 =C2=B1  2%  mpstat.cpu.all.usr%
>       1453 =C2=B1  6%    +109.8%       3049 =C2=B1113%  interrupts.CPU5.C=
AL:Function_call_interrupts
>     605222           -23.8%     461290 =C2=B1 29%  interrupts.CPU82.LOC:L=
ocal_timer_interrupts
>      15.18 =C2=B1 12%     +23.5%      18.74 =C2=B1 11%  perf-stat.i.MPKI
>   1.64e+09            -5.4%  1.551e+09        perf-stat.i.branch-instruct=
ions
>       6.29            +6.7%       6.71        perf-stat.i.cpi
>  2.009e+09            -6.3%  1.883e+09        perf-stat.i.dTLB-loads
>  7.932e+08 =C2=B1  2%     -10.8%  7.078e+08        perf-stat.i.dTLB-stores
>    5140324           -12.9%    4475639        perf-stat.i.iTLB-load-misses
>  7.391e+09            -5.9%  6.952e+09        perf-stat.i.instructions
>       1443            +8.0%       1558        perf-stat.i.instructions-pe=
r-iTLB-miss
>       0.16            -6.2%       0.15        perf-stat.i.ipc
>      51.74            -6.2%      48.53        perf-stat.i.metric.M/sec
>      15.11 =C2=B1 12%     +23.3%      18.63 =C2=B1 11%  perf-stat.overall=
.MPKI
>       6.25            +6.6%       6.67        perf-stat.overall.cpi
>       1437            +8.1%       1553        perf-stat.overall.instructi=
ons-per-iTLB-miss
>       0.16            -6.2%       0.15        perf-stat.overall.ipc
>    3451539            +7.8%    3720150        perf-stat.overall.path-leng=
th
>  1.634e+09            -5.4%  1.546e+09        perf-stat.ps.branch-instruc=
tions
>  2.002e+09            -6.3%  1.876e+09        perf-stat.ps.dTLB-loads
>  7.905e+08 =C2=B1  2%     -10.8%  7.053e+08        perf-stat.ps.dTLB-stor=
es
>    5123258           -12.9%    4460593        perf-stat.ps.iTLB-load-miss=
es
>  7.366e+09            -5.9%  6.928e+09        perf-stat.ps.instructions
>  2.223e+12            -6.0%   2.09e+12        perf-stat.total.instructions
>      23.41            -4.4       18.99 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_prepare.syscall_exit=
_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      22.62            -4.2       18.44 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.__x64_sys_rt_sigprocmask.do_syscall_64.entry_SYSCALL_64_after_hw=
frame.raise
>      22.34            -4.1       18.20 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.sigprocmask.__x64_sys_rt_sigprocmask.do_syscall_64.entry_SYSCALL=
_64_after_hwframe.raise
>      22.31            -4.1       18.18 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.__set_current_blocked.sigprocmask.__x64_sys_rt_sigprocmask.do_sy=
scall_64.entry_SYSCALL_64_after_hwframe
>      21.51            -4.0       17.52 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock_irq.__set_current_blocked.sigprocmask.__x64_sys_r=
t_sigprocmask.do_syscall_64
>      21.03            -3.8       17.21 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__set_curren=
t_blocked.sigprocmask.__x64_sys_rt_sigprocmask
>      12.26            -2.3        9.95 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_h=
wframe.raise
>      11.59 =C2=B1  2%      -2.3        9.29 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.__restore_rt
>      12.21            -2.3        9.92 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_6=
4.entry_SYSCALL_64_after_hwframe.raise
>      11.53 =C2=B1  2%      -2.3        9.25 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.__restore_rt
>      11.50 =C2=B1  2%      -2.3        9.23 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after=
_hwframe.__restore_rt
>      11.52 =C2=B1  2%      -2.3        9.24 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__restore_rt
>      11.25 =C2=B1  2%      -2.2        9.03 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.__set_current_blocked.__x64_sys_rt_sigreturn.do_syscall_64.=
entry_SYSCALL_64_after_hwframe.__restore_rt
>      11.70 =C2=B1  2%      -2.2        9.48 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.handler
>      11.79 =C2=B1  2%      -2.2        9.60 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.do_tkill.__x64_sys_tgkill.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe.raise
>      11.79 =C2=B1  2%      -2.2        9.60 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.__x64_sys_tgkill.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me.raise
>      11.74 =C2=B1  2%      -2.2        9.55 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.do_send_specific.do_tkill.__x64_sys_tgkill.do_syscall_64.en=
try_SYSCALL_64_after_hwframe
>      10.86 =C2=B1  2%      -2.2        8.70 =C2=B1  9%  perf-profile.call=
trace.cycles-pp._raw_spin_lock_irq.__set_current_blocked.__x64_sys_rt_sigre=
turn.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      11.26 =C2=B1  2%      -2.1        9.13 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.handler
>      11.26 =C2=B1  2%      -2.1        9.13 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.handler
>      11.25 =C2=B1  2%      -2.1        9.12 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe.handler
>      11.25 =C2=B1  2%      -2.1        9.12 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_sysc=
all_64.entry_SYSCALL_64_after_hwframe.handler
>      11.35 =C2=B1  2%      -2.1        9.22 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.do_send_sig_info.do_send_specific.do_tkill.__x64_sys_tgkill=
.do_syscall_64
>      11.38            -2.1        9.26 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_prepare.s=
yscall_exit_to_user_mode.do_syscall_64
>      10.63 =C2=B1  2%      -2.1        8.52 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__set_c=
urrent_blocked.__x64_sys_rt_sigreturn.do_syscall_64
>      11.03 =C2=B1  2%      -2.1        8.94 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.signal_setup_done.arch_do_signal_or_restart.exit_to_user_mo=
de_prepare.syscall_exit_to_user_mode.do_syscall_64
>      11.01 =C2=B1  2%      -2.1        8.92 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.__set_current_blocked.signal_setup_done.arch_do_signal_or_r=
estart.exit_to_user_mode_prepare.syscall_exit_to_user_mode
>      10.80            -2.0        8.78 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock_irq.get_signal.arch_do_signal_or_restart.exit_to_=
user_mode_prepare.syscall_exit_to_user_mode
>      10.61 =C2=B1  2%      -2.0        8.60 =C2=B1  9%  perf-profile.call=
trace.cycles-pp._raw_spin_lock_irq.__set_current_blocked.signal_setup_done.=
arch_do_signal_or_restart.exit_to_user_mode_prepare
>      10.64 =C2=B1  2%      -2.0        8.66 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.__lock_task_sighand.do_send_sig_info.do_send_specific.do_tk=
ill.__x64_sys_tgkill
>      10.63 =C2=B1  2%      -2.0        8.65 =C2=B1 10%  perf-profile.call=
trace.cycles-pp._raw_spin_lock_irqsave.__lock_task_sighand.do_send_sig_info=
.do_send_specific.do_tkill
>      10.40            -2.0        8.43 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__set_curren=
t_blocked.signal_setup_done.arch_do_signal_or_restart
>      10.60            -2.0        8.63 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.get_signal.a=
rch_do_signal_or_restart.exit_to_user_mode_prepare
>      10.40 =C2=B1  2%      -1.9        8.48 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__l=
ock_task_sighand.do_send_sig_info.do_send_specific
>       0.64 =C2=B1  3%      -0.2        0.39 =C2=B1 63%  perf-profile.call=
trace.cycles-pp.copy_fpstate_to_sigframe.__setup_rt_frame.arch_do_signal_or=
_restart.exit_to_user_mode_prepare.syscall_exit_to_user_mode
>       0.66 =C2=B1  4%      -0.2        0.42 =C2=B1 63%  perf-profile.call=
trace.cycles-pp.__set_task_blocked.__set_current_blocked.sigprocmask.__x64_=
sys_rt_sigprocmask.do_syscall_64
>       0.65 =C2=B1  4%      -0.2        0.41 =C2=B1 63%  perf-profile.call=
trace.cycles-pp.recalc_sigpending.__set_task_blocked.__set_current_blocked.=
sigprocmask.__x64_sys_rt_sigprocmask
>       0.76 =C2=B1  4%      -0.2        0.54 =C2=B1 42%  perf-profile.call=
trace.cycles-pp.__setup_rt_frame.arch_do_signal_or_restart.exit_to_user_mod=
e_prepare.syscall_exit_to_user_mode.do_syscall_64
>       0.00            +8.6        8.56 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.do_sigaltsta=
ck.restore_altstack.__x64_sys_rt_sigreturn
>       0.59 =C2=B1  3%      +8.7        9.29 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after=
_hwframe.raise
>       0.00            +8.7        8.75 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock_irq.do_sigaltstack.restore_altstack.__x64_sys_rt_=
sigreturn.do_syscall_64
>       0.00            +8.8        8.80 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.do_sigaltstack.restore_altstack.__x64_sys_rt_sigreturn.do_syscal=
l_64.entry_SYSCALL_64_after_hwframe
>       0.00            +8.9        8.87 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.restore_altstack.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe.raise
>      44.60            -8.5       36.15 =C2=B1  9%  perf-profile.children.=
cycles-pp.__set_current_blocked
>      23.53            -4.4       19.09 =C2=B1  9%  perf-profile.children.=
cycles-pp.syscall_exit_to_user_mode
>      23.47            -4.4       19.05 =C2=B1  9%  perf-profile.children.=
cycles-pp.exit_to_user_mode_prepare
>      23.41            -4.4       19.00 =C2=B1  9%  perf-profile.children.=
cycles-pp.arch_do_signal_or_restart
>      22.62            -4.2       18.45 =C2=B1  9%  perf-profile.children.=
cycles-pp.__x64_sys_rt_sigprocmask
>      22.34            -4.1       18.20 =C2=B1  9%  perf-profile.children.=
cycles-pp.sigprocmask
>      11.63 =C2=B1  2%      -2.3        9.33 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.__restore_rt
>      11.73 =C2=B1  2%      -2.2        9.50 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.handler
>      11.79 =C2=B1  2%      -2.2        9.60 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.do_tkill
>      11.80 =C2=B1  2%      -2.2        9.60 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.__x64_sys_tgkill
>      11.74 =C2=B1  2%      -2.2        9.55 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.do_send_specific
>      11.35 =C2=B1  2%      -2.1        9.22 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.do_send_sig_info
>      11.39            -2.1        9.26 =C2=B1  9%  perf-profile.children.=
cycles-pp.get_signal
>      11.03 =C2=B1  2%      -2.1        8.94 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.signal_setup_done
>      10.66 =C2=B1  2%      -2.0        8.67 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irqsave
>      10.64 =C2=B1  2%      -2.0        8.66 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.__lock_task_sighand
>       1.32 =C2=B1  4%      -0.2        1.10 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.recalc_sigpending
>       1.32 =C2=B1  4%      -0.2        1.10 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.__set_task_blocked
>       0.76 =C2=B1  4%      -0.2        0.61 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.__setup_rt_frame
>       0.65 =C2=B1  3%      -0.1        0.53 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.copy_fpstate_to_sigframe
>       0.63 =C2=B1  3%      -0.1        0.51 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.restore_sigcontext
>       0.59 =C2=B1  2%      -0.1        0.48 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.__send_signal
>       0.42 =C2=B1  4%      -0.1        0.33 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.native_irq_return_iret
>       0.49 =C2=B1  3%      -0.1        0.40 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.fpu__restore_sig
>       0.45 =C2=B1  5%      -0.1        0.36 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.dequeue_signal
>       0.49 =C2=B1  3%      -0.1        0.40 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.__fpu_restore_sig
>       0.41 =C2=B1  5%      -0.1        0.33 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.__dequeue_signal
>       0.33 =C2=B1  6%      -0.1        0.26 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.__sigqueue_free
>       0.34 =C2=B1  3%      -0.1        0.27 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp._copy_from_user
>       0.34 =C2=B1  4%      -0.1        0.27 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.recalc_sigpending_tsk
>       0.32 =C2=B1  6%      -0.1        0.26 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.dec_rlimit_ucounts
>       0.27 =C2=B1  6%      -0.1        0.21 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.__sigqueue_alloc
>       0.29 =C2=B1  6%      -0.1        0.24 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.syscall_return_via_sysret
>       0.17 =C2=B1  7%      -0.0        0.14 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.copy_user_generic_unrolled
>       0.19 =C2=B1  4%      -0.0        0.16 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.copy_user_enhanced_fast_string
>       0.25 =C2=B1  4%      -0.0        0.22 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.security_task_kill
>       0.20 =C2=B1  5%      -0.0        0.16 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.fpu__clear_user_states
>       0.24 =C2=B1  4%      -0.0        0.21 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.apparmor_task_kill
>      12.10 =C2=B1  2%      +6.4       18.52 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.__x64_sys_rt_sigreturn
>       0.08 =C2=B1 10%      +8.8        8.87 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.restore_altstack
>       0.00            +8.8        8.81 =C2=B1  9%  perf-profile.children.=
cycles-pp.do_sigaltstack
>       0.99 =C2=B1  4%      -0.2        0.83 =C2=B1 10%  perf-profile.self=
.cycles-pp.recalc_sigpending
>       1.13 =C2=B1  2%      -0.1        1.00 =C2=B1 10%  perf-profile.self=
.cycles-pp._raw_spin_lock_irq
>       0.42 =C2=B1  4%      -0.1        0.33 =C2=B1  9%  perf-profile.self=
.cycles-pp.native_irq_return_iret
>       0.40 =C2=B1  3%      -0.1        0.32 =C2=B1 11%  perf-profile.self=
.cycles-pp.copy_fpstate_to_sigframe
>       0.34 =C2=B1  4%      -0.1        0.27 =C2=B1 12%  perf-profile.self=
.cycles-pp.recalc_sigpending_tsk
>       0.31 =C2=B1  3%      -0.1        0.25 =C2=B1  9%  perf-profile.self=
.cycles-pp.__send_signal
>       0.32 =C2=B1  6%      -0.1        0.26 =C2=B1 12%  perf-profile.self=
.cycles-pp.dec_rlimit_ucounts
>       0.25 =C2=B1  5%      -0.1        0.20 =C2=B1  8%  perf-profile.self=
.cycles-pp._raw_spin_lock_irqsave
>       0.31 =C2=B1  3%      -0.1        0.25 =C2=B1 12%  perf-profile.self=
.cycles-pp.__fpu_restore_sig
>       0.29 =C2=B1  6%      -0.1        0.23 =C2=B1 13%  perf-profile.self=
.cycles-pp.syscall_return_via_sysret
>       0.17 =C2=B1  6%      -0.0        0.13 =C2=B1 11%  perf-profile.self=
.cycles-pp.copy_user_generic_unrolled
>       0.18 =C2=B1  4%      -0.0        0.15 =C2=B1  8%  perf-profile.self=
.cycles-pp.copy_user_enhanced_fast_string
>       0.16 =C2=B1  3%      -0.0        0.13 =C2=B1 12%  perf-profile.self=
.cycles-pp.fpu__clear_user_states
>       0.07 =C2=B1  5%      -0.0        0.05 =C2=B1  8%  perf-profile.self=
.cycles-pp.__set_current_blocked
>       0.12 =C2=B1  9%      +0.1        0.25 =C2=B1 10%  perf-profile.self=
.cycles-pp.entry_SYSCALL_64_after_hwframe
> =

> =

> =

> *************************************************************************=
**************************
> lkp-icl-2sp6: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ =
2.60GHz with 128G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/tes=
tcase/ucode:
>   gcc-9/performance/x86_64-rhel-8.3/thread/16/debian-10.4-x86_64-20200603=
.cgz/lkp-icl-2sp6/signal1/will-it-scale/0xd000280
> =

> commit: =

>   1bdda24c4a ("signal: Add an optional check for altstack size")
>   3aac3ebea0 ("x86/signal: Implement sigaltstack size validation")
> =

> 1bdda24c4af64cd2 3aac3ebea08f2d342364f827c89 =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     980404 =C2=B1  3%     -10.2%     880436 =C2=B1  2%  will-it-scale.16.=
threads
>      61274 =C2=B1  3%     -10.2%      55027 =C2=B1  2%  will-it-scale.per=
_thread_ops
>     980404 =C2=B1  3%     -10.2%     880436 =C2=B1  2%  will-it-scale.wor=
kload
>    9745749 =C2=B1 18%     +26.8%   12356608 =C2=B1  4%  meminfo.DirectMap=
2M
>       0.19 =C2=B1  3%      -0.0        0.17        mpstat.cpu.all.usr%
>     678.67 =C2=B1102%    +162.5%       1781        numa-meminfo.node0.Mlo=
cked
>     169.33 =C2=B1102%    +162.8%     445.00        numa-vmstat.node0.nr_m=
lock
>      14980 =C2=B1 24%     +32.1%      19788 =C2=B1 15%  softirqs.CPU10.SC=
HED
>      22443 =C2=B1 26%     -31.6%      15357 =C2=B1 11%  softirqs.CPU3.SCH=
ED
>      22798 =C2=B1  8%     +25.2%      28542 =C2=B1  9%  softirqs.CPU70.SC=
HED
>       1027 =C2=B1  8%      +9.1%       1120 =C2=B1  5%  slabinfo.file_loc=
k_cache.active_objs
>       1027 =C2=B1  8%      +9.1%       1120 =C2=B1  5%  slabinfo.file_loc=
k_cache.num_objs
>       2206 =C2=B1  5%      +9.2%       2410 =C2=B1  4%  slabinfo.khugepag=
ed_mm_slot.active_objs
>       2206 =C2=B1  5%      +9.2%       2410 =C2=B1  4%  slabinfo.khugepag=
ed_mm_slot.num_objs
>      71217 =C2=B1  3%      -9.3%      64617 =C2=B1  4%  slabinfo.vm_area_=
struct.active_objs
>       1782 =C2=B1  3%      -9.1%       1620 =C2=B1  4%  slabinfo.vm_area_=
struct.active_slabs
>      71334 =C2=B1  3%      -9.1%      64821 =C2=B1  4%  slabinfo.vm_area_=
struct.num_objs
>       1782 =C2=B1  3%      -9.1%       1620 =C2=B1  4%  slabinfo.vm_area_=
struct.num_slabs
>  2.198e+09            -4.3%  2.103e+09        perf-stat.i.branch-instruct=
ions
>       5.71            +3.4%       5.90        perf-stat.i.cpi
>   2.75e+09            -4.8%  2.619e+09        perf-stat.i.dTLB-loads
>  1.002e+10            -4.6%  9.559e+09        perf-stat.i.instructions
>      33163 =C2=B1 14%     +26.0%      41783 =C2=B1  6%  perf-stat.i.node-=
stores
>       5.68            +3.3%       5.87        perf-stat.overall.cpi
>    3079620 =C2=B1  2%      +6.3%    3272934        perf-stat.overall.path=
-length
>  2.191e+09            -4.3%  2.096e+09        perf-stat.ps.branch-instruc=
tions
>  2.741e+09            -4.8%   2.61e+09        perf-stat.ps.dTLB-loads
>  9.988e+09            -4.6%  9.526e+09        perf-stat.ps.instructions
>      33002 =C2=B1 14%     +25.9%      41562 =C2=B1  6%  perf-stat.ps.node=
-stores
>  3.017e+12            -4.5%   2.88e+12        perf-stat.total.instructions
>       0.33 =C2=B1223%  +54200.0%     181.00 =C2=B1133%  interrupts.153:PC=
I-MSI.12058647-edge.i40e-eth0-TxRx-22
>     706.83 =C2=B1  8%     -36.5%     449.00 =C2=B1 18%  interrupts.CPU127=
.NMI:Non-maskable_interrupts
>     706.83 =C2=B1  8%     -36.5%     449.00 =C2=B1 18%  interrupts.CPU127=
.PMI:Performance_monitoring_interrupts
>     366.17 =C2=B1 11%     -18.9%     297.00 =C2=B1 15%  interrupts.CPU14.=
TLB:TLB_shootdowns
>     255.83 =C2=B1 21%     -33.2%     171.00 =C2=B1 14%  interrupts.CPU16.=
NMI:Non-maskable_interrupts
>     255.83 =C2=B1 21%     -33.2%     171.00 =C2=B1 14%  interrupts.CPU16.=
PMI:Performance_monitoring_interrupts
>     445.17 =C2=B1 16%     +53.4%     682.75 =C2=B1 34%  interrupts.CPU2.C=
AL:Function_call_interrupts
>      13115 =C2=B1 43%     -98.8%     163.75 =C2=B1 16%  interrupts.CPU2.N=
MI:Non-maskable_interrupts
>      13115 =C2=B1 43%     -98.8%     163.75 =C2=B1 16%  interrupts.CPU2.P=
MI:Performance_monitoring_interrupts
>       0.17 =C2=B1223%  +1.1e+05%     180.50 =C2=B1133%  interrupts.CPU22.=
153:PCI-MSI.12058647-edge.i40e-eth0-TxRx-22
>     439.17 =C2=B1 17%     +24.2%     545.50 =C2=B1  8%  interrupts.CPU5.C=
AL:Function_call_interrupts
>     262.17 =C2=B1 20%     +51.6%     397.50 =C2=B1 15%  interrupts.CPU6.T=
LB:TLB_shootdowns
>       2824 =C2=B1213%    +251.7%       9935 =C2=B1 67%  interrupts.CPU65.=
NMI:Non-maskable_interrupts
>       2824 =C2=B1213%    +251.7%       9935 =C2=B1 67%  interrupts.CPU65.=
PMI:Performance_monitoring_interrupts
>       2624 =C2=B1149%    +525.3%      16413        interrupts.CPU66.NMI:N=
on-maskable_interrupts
>       2624 =C2=B1149%    +525.3%      16413        interrupts.CPU66.PMI:P=
erformance_monitoring_interrupts
>     150.33 =C2=B1 26%     +52.7%     229.50 =C2=B1 19%  interrupts.CPU78.=
TLB:TLB_shootdowns
>     216.83 =C2=B1 19%     -29.1%     153.75 =C2=B1  7%  interrupts.CPU85.=
NMI:Non-maskable_interrupts
>     216.83 =C2=B1 19%     -29.1%     153.75 =C2=B1  7%  interrupts.CPU85.=
PMI:Performance_monitoring_interrupts
>     196.00 =C2=B1 13%    +847.6%       1857 =C2=B1144%  interrupts.CPU87.=
CAL:Function_call_interrupts
>      28.72            -3.7       25.02        perf-profile.calltrace.cycl=
es-pp.__x64_sys_rt_sigprocmask.do_syscall_64.entry_SYSCALL_64_after_hwframe=
.raise
>      28.25            -3.7       24.57        perf-profile.calltrace.cycl=
es-pp.__set_current_blocked.sigprocmask.__x64_sys_rt_sigprocmask.do_syscall=
_64.entry_SYSCALL_64_after_hwframe
>      28.27            -3.7       24.59        perf-profile.calltrace.cycl=
es-pp.sigprocmask.__x64_sys_rt_sigprocmask.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe.raise
>      29.98            -3.6       26.39        perf-profile.calltrace.cycl=
es-pp.arch_do_signal_or_restart.exit_to_user_mode_prepare.syscall_exit_to_u=
ser_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      27.65            -3.6       24.08        perf-profile.calltrace.cycl=
es-pp._raw_spin_lock_irq.__set_current_blocked.sigprocmask.__x64_sys_rt_sig=
procmask.do_syscall_64
>      26.88            -3.5       23.41        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__set_current_blo=
cked.sigprocmask.__x64_sys_rt_sigprocmask
>      14.84            -2.4       12.46        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__restore_rt
>      14.94            -2.4       12.56        perf-profile.calltrace.cycl=
es-pp.__restore_rt
>      14.85            -2.4       12.47        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.__restore_rt
>      14.81            -2.4       12.43        perf-profile.calltrace.cycl=
es-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe._=
_restore_rt
>      14.34            -2.3       12.02        perf-profile.calltrace.cycl=
es-pp.__set_current_blocked.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe.__restore_rt
>      14.06            -2.3       11.77        perf-profile.calltrace.cycl=
es-pp._raw_spin_lock_irq.__set_current_blocked.__x64_sys_rt_sigreturn.do_sy=
scall_64.entry_SYSCALL_64_after_hwframe
>      13.61            -2.2       11.41        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__set_current_blo=
cked.__x64_sys_rt_sigreturn.do_syscall_64
>      15.40 =C2=B1  2%      -2.1       13.35        perf-profile.calltrace=
.cycles-pp.handler
>      15.57            -1.8       13.75        perf-profile.calltrace.cycl=
es-pp.__x64_sys_tgkill.do_syscall_64.entry_SYSCALL_64_after_hwframe.raise
>      15.56            -1.8       13.74        perf-profile.calltrace.cycl=
es-pp.do_tkill.__x64_sys_tgkill.do_syscall_64.entry_SYSCALL_64_after_hwfram=
e.raise
>      14.63            -1.8       12.81        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.handler
>      14.63            -1.8       12.81        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.handler
>      14.62            -1.8       12.80        perf-profile.calltrace.cycl=
es-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe.handler
>      14.62            -1.8       12.80        perf-profile.calltrace.cycl=
es-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwfram=
e.handler
>      15.46            -1.8       13.64        perf-profile.calltrace.cycl=
es-pp.do_send_specific.do_tkill.__x64_sys_tgkill.do_syscall_64.entry_SYSCAL=
L_64_after_hwframe
>      14.26            -1.8       12.48        perf-profile.calltrace.cycl=
es-pp.__set_current_blocked.signal_setup_done.arch_do_signal_or_restart.exi=
t_to_user_mode_prepare.syscall_exit_to_user_mode
>      14.28            -1.8       12.50        perf-profile.calltrace.cycl=
es-pp.signal_setup_done.arch_do_signal_or_restart.exit_to_user_mode_prepare=
.syscall_exit_to_user_mode.do_syscall_64
>      15.55            -1.8       13.77        perf-profile.calltrace.cycl=
es-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwfram=
e.raise
>      15.47            -1.8       13.70        perf-profile.calltrace.cycl=
es-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe.raise
>      14.80            -1.8       13.04        perf-profile.calltrace.cycl=
es-pp.do_send_sig_info.do_send_specific.do_tkill.__x64_sys_tgkill.do_syscal=
l_64
>      13.97            -1.7       12.23        perf-profile.calltrace.cycl=
es-pp._raw_spin_lock_irq.__set_current_blocked.signal_setup_done.arch_do_si=
gnal_or_restart.exit_to_user_mode_prepare
>      13.56            -1.7       11.87        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__set_current_blo=
cked.signal_setup_done.arch_do_signal_or_restart
>      14.39            -1.7       12.72        perf-profile.calltrace.cycl=
es-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_prepare.syscal=
l_exit_to_user_mode.do_syscall_64
>      13.91            -1.7       12.26        perf-profile.calltrace.cycl=
es-pp.__lock_task_sighand.do_send_sig_info.do_send_specific.do_tkill.__x64_=
sys_tgkill
>      13.90            -1.6       12.25        perf-profile.calltrace.cycl=
es-pp._raw_spin_lock_irqsave.__lock_task_sighand.do_send_sig_info.do_send_s=
pecific.do_tkill
>      13.48            -1.6       11.85        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__lock_task_s=
ighand.do_send_sig_info.do_send_specific
>      13.80            -1.6       12.18        perf-profile.calltrace.cycl=
es-pp._raw_spin_lock_irq.get_signal.arch_do_signal_or_restart.exit_to_user_=
mode_prepare.syscall_exit_to_user_mode
>      13.55            -1.6       11.96        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.get_signal.arch_d=
o_signal_or_restart.exit_to_user_mode_prepare
>       0.74 =C2=B1  3%      -0.1        0.64 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__send_signal.do_send_sig_info.do_send_specific.do_tkill.__=
x64_sys_tgkill
>      61.68            +5.1       66.82        perf-profile.calltrace.cycl=
es-pp.raise
>      60.97            +5.2       66.13        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.raise
>      61.08            +5.2       66.24        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.raise
>       0.00           +12.1       12.06        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.do_sigaltstack.re=
store_altstack.__x64_sys_rt_sigreturn
>       0.90 =C2=B1  5%     +12.4       13.32        perf-profile.calltrace=
.cycles-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame.raise
>       0.00           +12.4       12.43        perf-profile.calltrace.cycl=
es-pp._raw_spin_lock_irq.do_sigaltstack.restore_altstack.__x64_sys_rt_sigre=
turn.do_syscall_64
>       0.00           +12.5       12.50        perf-profile.calltrace.cycl=
es-pp.do_sigaltstack.restore_altstack.__x64_sys_rt_sigreturn.do_syscall_64.=
entry_SYSCALL_64_after_hwframe
>       0.00           +12.6       12.63        perf-profile.calltrace.cycl=
es-pp.restore_altstack.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_6=
4_after_hwframe.raise
>      56.89            -7.8       49.10        perf-profile.children.cycle=
s-pp.__set_current_blocked
>      28.31            -3.7       24.62        perf-profile.children.cycle=
s-pp.sigprocmask
>      28.74            -3.6       25.10        perf-profile.children.cycle=
s-pp.__x64_sys_rt_sigprocmask
>      30.21            -3.6       26.61        perf-profile.children.cycle=
s-pp.syscall_exit_to_user_mode
>      30.10            -3.6       26.52        perf-profile.children.cycle=
s-pp.exit_to_user_mode_prepare
>      29.98            -3.6       26.40        perf-profile.children.cycle=
s-pp.arch_do_signal_or_restart
>      15.02            -2.4       12.62        perf-profile.children.cycle=
s-pp.__restore_rt
>      15.29            -1.9       13.40        perf-profile.children.cycle=
s-pp.handler
>      15.58            -1.8       13.75        perf-profile.children.cycle=
s-pp.__x64_sys_tgkill
>      15.57            -1.8       13.74        perf-profile.children.cycle=
s-pp.do_tkill
>      15.47            -1.8       13.66        perf-profile.children.cycle=
s-pp.do_send_specific
>      14.28            -1.8       12.50        perf-profile.children.cycle=
s-pp.signal_setup_done
>      14.82            -1.8       13.05        perf-profile.children.cycle=
s-pp.do_send_sig_info
>      14.40            -1.7       12.73        perf-profile.children.cycle=
s-pp.get_signal
>      13.96            -1.7       12.30        perf-profile.children.cycle=
s-pp._raw_spin_lock_irqsave
>      13.92            -1.7       12.27        perf-profile.children.cycle=
s-pp.__lock_task_sighand
>       1.02 =C2=B1  4%      -0.1        0.91 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.restore_sigcontext
>       0.74 =C2=B1  3%      -0.1        0.65 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__send_signal
>       0.46            -0.0        0.40        perf-profile.children.cycle=
s-pp.dequeue_signal
>       0.40 =C2=B1  5%      -0.0        0.35 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__sigqueue_alloc
>       0.23 =C2=B1  9%      -0.0        0.19 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.recalc_sigpending_tsk
>       0.39 =C2=B1  2%      -0.0        0.35        perf-profile.children.=
cycles-pp.__dequeue_signal
>       0.29 =C2=B1  6%      -0.0        0.26        perf-profile.children.=
cycles-pp.fpu__clear_user_states
>       0.42 =C2=B1  2%      -0.0        0.39 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.apparmor_task_kill
>       0.44            -0.0        0.41 =C2=B1  2%  perf-profile.children.=
cycles-pp.security_task_kill
>       0.24 =C2=B1  7%      -0.0        0.21 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__might_fault
>       0.12 =C2=B1  7%      -0.0        0.10 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp._copy_to_user
>       0.22 =C2=B1  4%      -0.0        0.20 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__sigqueue_free
>       0.10 =C2=B1  4%      -0.0        0.08 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.find_task_by_vpid
>       0.22 =C2=B1  3%      -0.0        0.20 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.aa_get_task_label
>       0.09 =C2=B1  5%      -0.0        0.07        perf-profile.children.=
cycles-pp.__radix_tree_lookup
>       0.09 =C2=B1  8%      -0.0        0.07 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp._raw_spin_unlock_irqrestore
>      69.51            +3.2       72.74        perf-profile.children.cycle=
s-pp._raw_spin_lock_irq
>      62.03            +5.1       67.12        perf-profile.children.cycle=
s-pp.raise
>      15.72           +10.0       25.76        perf-profile.children.cycle=
s-pp.__x64_sys_rt_sigreturn
>       0.15 =C2=B1  3%     +12.5       12.64        perf-profile.children.=
cycles-pp.restore_altstack
>       0.00           +12.5       12.51        perf-profile.children.cycle=
s-pp.do_sigaltstack
>       0.31 =C2=B1  3%      -0.0        0.26 =C2=B1  4%  perf-profile.self=
.cycles-pp.__send_signal
>       0.09 =C2=B1  5%      -0.0        0.07 =C2=B1  6%  perf-profile.self=
.cycles-pp.__radix_tree_lookup
>       0.06 =C2=B1 13%      +0.1        0.14 =C2=B1  6%  perf-profile.self=
.cycles-pp.__x64_sys_rt_sigprocmask
>       1.90 =C2=B1  3%      +0.1        2.02        perf-profile.self.cycl=
es-pp._raw_spin_lock_irq
> =

> =

> =

> *************************************************************************=
**************************
> lkp-hsw-4ex1: 144 threads 4 sockets Intel(R) Xeon(R) CPU E7-8890 v3 @ 2.5=
0GHz with 512G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/debug-setup/kconfig/mode/nr_task/rootfs/tbox_gr=
oup/test/testcase/ucode:
>   gcc-9/performance/no-monitor/x86_64-rhel-8.3/thread/16/debian-10.4-x86_=
64-20200603.cgz/lkp-hsw-4ex1/signal1/will-it-scale/0x16
> =

> commit: =

>   1bdda24c4a ("signal: Add an optional check for altstack size")
>   3aac3ebea0 ("x86/signal: Implement sigaltstack size validation")
> =

> 1bdda24c4af64cd2 3aac3ebea08f2d342364f827c89 =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     779005 =C2=B1  2%     -11.9%     686435 =C2=B1  2%  will-it-scale.16.=
threads
>      48687 =C2=B1  2%     -11.9%      42901 =C2=B1  2%  will-it-scale.per=
_thread_ops
>     779005 =C2=B1  2%     -11.9%     686435 =C2=B1  2%  will-it-scale.wor=
kload
> =

> =

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
> =


> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/x86_64 5.15.0-rc5 Kernel Configuration
> #
> CONFIG_CC_VERSION_TEXT=3D"gcc-9 (Debian 9.3.0-22) 9.3.0"
> CONFIG_CC_IS_GCC=3Dy
> CONFIG_GCC_VERSION=3D90300
> CONFIG_CLANG_VERSION=3D0
> CONFIG_AS_IS_GNU=3Dy
> CONFIG_AS_VERSION=3D23502
> CONFIG_LD_IS_BFD=3Dy
> CONFIG_LD_VERSION=3D23502
> CONFIG_LLD_VERSION=3D0
> CONFIG_CC_CAN_LINK=3Dy
> CONFIG_CC_CAN_LINK_STATIC=3Dy
> CONFIG_CC_HAS_ASM_GOTO=3Dy
> CONFIG_CC_HAS_ASM_INLINE=3Dy
> CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=3Dy
> CONFIG_IRQ_WORK=3Dy
> CONFIG_BUILDTIME_TABLE_SORT=3Dy
> CONFIG_THREAD_INFO_IN_TASK=3Dy
> =

> #
> # General setup
> #
> CONFIG_INIT_ENV_ARG_LIMIT=3D32
> # CONFIG_COMPILE_TEST is not set
> # CONFIG_WERROR is not set
> CONFIG_LOCALVERSION=3D""
> CONFIG_LOCALVERSION_AUTO=3Dy
> CONFIG_BUILD_SALT=3D""
> CONFIG_HAVE_KERNEL_GZIP=3Dy
> CONFIG_HAVE_KERNEL_BZIP2=3Dy
> CONFIG_HAVE_KERNEL_LZMA=3Dy
> CONFIG_HAVE_KERNEL_XZ=3Dy
> CONFIG_HAVE_KERNEL_LZO=3Dy
> CONFIG_HAVE_KERNEL_LZ4=3Dy
> CONFIG_HAVE_KERNEL_ZSTD=3Dy
> CONFIG_KERNEL_GZIP=3Dy
> # CONFIG_KERNEL_BZIP2 is not set
> # CONFIG_KERNEL_LZMA is not set
> # CONFIG_KERNEL_XZ is not set
> # CONFIG_KERNEL_LZO is not set
> # CONFIG_KERNEL_LZ4 is not set
> # CONFIG_KERNEL_ZSTD is not set
> CONFIG_DEFAULT_INIT=3D""
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> CONFIG_SWAP=3Dy
> CONFIG_SYSVIPC=3Dy
> CONFIG_SYSVIPC_SYSCTL=3Dy
> CONFIG_POSIX_MQUEUE=3Dy
> CONFIG_POSIX_MQUEUE_SYSCTL=3Dy
> # CONFIG_WATCH_QUEUE is not set
> CONFIG_CROSS_MEMORY_ATTACH=3Dy
> # CONFIG_USELIB is not set
> CONFIG_AUDIT=3Dy
> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> CONFIG_AUDITSYSCALL=3Dy
> =

> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_PROBE=3Dy
> CONFIG_GENERIC_IRQ_SHOW=3Dy
> CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=3Dy
> CONFIG_GENERIC_PENDING_IRQ=3Dy
> CONFIG_GENERIC_IRQ_MIGRATION=3Dy
> CONFIG_GENERIC_IRQ_INJECTION=3Dy
> CONFIG_HARDIRQS_SW_RESEND=3Dy
> CONFIG_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> CONFIG_GENERIC_MSI_IRQ=3Dy
> CONFIG_GENERIC_MSI_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_MSI_IOMMU=3Dy
> CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
> CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
> CONFIG_IRQ_FORCED_THREADING=3Dy
> CONFIG_SPARSE_IRQ=3Dy
> # CONFIG_GENERIC_IRQ_DEBUGFS is not set
> # end of IRQ subsystem
> =

> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> CONFIG_ARCH_CLOCKSOURCE_INIT=3Dy
> CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
> CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> CONFIG_GENERIC_CLOCKEVENTS=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
> CONFIG_GENERIC_CMOS_UPDATE=3Dy
> CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=3Dy
> CONFIG_POSIX_CPU_TIMERS_TASK_WORK=3Dy
> =

> #
> # Timers subsystem
> #
> CONFIG_TICK_ONESHOT=3Dy
> CONFIG_NO_HZ_COMMON=3Dy
> # CONFIG_HZ_PERIODIC is not set
> # CONFIG_NO_HZ_IDLE is not set
> CONFIG_NO_HZ_FULL=3Dy
> CONFIG_CONTEXT_TRACKING=3Dy
> # CONFIG_CONTEXT_TRACKING_FORCE is not set
> CONFIG_NO_HZ=3Dy
> CONFIG_HIGH_RES_TIMERS=3Dy
> # end of Timers subsystem
> =

> CONFIG_BPF=3Dy
> CONFIG_HAVE_EBPF_JIT=3Dy
> CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=3Dy
> =

> #
> # BPF subsystem
> #
> CONFIG_BPF_SYSCALL=3Dy
> CONFIG_BPF_JIT=3Dy
> CONFIG_BPF_JIT_ALWAYS_ON=3Dy
> CONFIG_BPF_JIT_DEFAULT_ON=3Dy
> # CONFIG_BPF_UNPRIV_DEFAULT_OFF is not set
> # CONFIG_BPF_PRELOAD is not set
> # CONFIG_BPF_LSM is not set
> # end of BPF subsystem
> =

> # CONFIG_PREEMPT_NONE is not set
> CONFIG_PREEMPT_VOLUNTARY=3Dy
> # CONFIG_PREEMPT is not set
> CONFIG_PREEMPT_COUNT=3Dy
> # CONFIG_SCHED_CORE is not set
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_VIRT_CPU_ACCOUNTING=3Dy
> CONFIG_VIRT_CPU_ACCOUNTING_GEN=3Dy
> CONFIG_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_SCHED_AVG_IRQ=3Dy
> CONFIG_BSD_PROCESS_ACCT=3Dy
> CONFIG_BSD_PROCESS_ACCT_V3=3Dy
> CONFIG_TASKSTATS=3Dy
> CONFIG_TASK_DELAY_ACCT=3Dy
> CONFIG_TASK_XACCT=3Dy
> CONFIG_TASK_IO_ACCOUNTING=3Dy
> # CONFIG_PSI is not set
> # end of CPU/Task time and stats accounting
> =

> CONFIG_CPU_ISOLATION=3Dy
> =

> #
> # RCU Subsystem
> #
> CONFIG_TREE_RCU=3Dy
> # CONFIG_RCU_EXPERT is not set
> CONFIG_SRCU=3Dy
> CONFIG_TREE_SRCU=3Dy
> CONFIG_TASKS_RCU_GENERIC=3Dy
> CONFIG_TASKS_RUDE_RCU=3Dy
> CONFIG_TASKS_TRACE_RCU=3Dy
> CONFIG_RCU_STALL_COMMON=3Dy
> CONFIG_RCU_NEED_SEGCBLIST=3Dy
> CONFIG_RCU_NOCB_CPU=3Dy
> # end of RCU Subsystem
> =

> CONFIG_BUILD_BIN2C=3Dy
> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> # CONFIG_IKHEADERS is not set
> CONFIG_LOG_BUF_SHIFT=3D20
> CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> # CONFIG_PRINTK_INDEX is not set
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> =

> #
> # Scheduler features
> #
> # CONFIG_UCLAMP_TASK is not set
> # end of Scheduler features
> =

> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> CONFIG_CC_HAS_INT128=3Dy
> CONFIG_ARCH_SUPPORTS_INT128=3Dy
> CONFIG_NUMA_BALANCING=3Dy
> CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=3Dy
> CONFIG_CGROUPS=3Dy
> CONFIG_PAGE_COUNTER=3Dy
> CONFIG_MEMCG=3Dy
> CONFIG_MEMCG_SWAP=3Dy
> CONFIG_MEMCG_KMEM=3Dy
> CONFIG_BLK_CGROUP=3Dy
> CONFIG_CGROUP_WRITEBACK=3Dy
> CONFIG_CGROUP_SCHED=3Dy
> CONFIG_FAIR_GROUP_SCHED=3Dy
> CONFIG_CFS_BANDWIDTH=3Dy
> CONFIG_RT_GROUP_SCHED=3Dy
> CONFIG_CGROUP_PIDS=3Dy
> CONFIG_CGROUP_RDMA=3Dy
> CONFIG_CGROUP_FREEZER=3Dy
> CONFIG_CGROUP_HUGETLB=3Dy
> CONFIG_CPUSETS=3Dy
> CONFIG_PROC_PID_CPUSET=3Dy
> CONFIG_CGROUP_DEVICE=3Dy
> CONFIG_CGROUP_CPUACCT=3Dy
> CONFIG_CGROUP_PERF=3Dy
> CONFIG_CGROUP_BPF=3Dy
> # CONFIG_CGROUP_MISC is not set
> # CONFIG_CGROUP_DEBUG is not set
> CONFIG_SOCK_CGROUP_DATA=3Dy
> CONFIG_NAMESPACES=3Dy
> CONFIG_UTS_NS=3Dy
> CONFIG_TIME_NS=3Dy
> CONFIG_IPC_NS=3Dy
> CONFIG_USER_NS=3Dy
> CONFIG_PID_NS=3Dy
> CONFIG_NET_NS=3Dy
> # CONFIG_CHECKPOINT_RESTORE is not set
> CONFIG_SCHED_AUTOGROUP=3Dy
> # CONFIG_SYSFS_DEPRECATED is not set
> CONFIG_RELAY=3Dy
> CONFIG_BLK_DEV_INITRD=3Dy
> CONFIG_INITRAMFS_SOURCE=3D""
> CONFIG_RD_GZIP=3Dy
> CONFIG_RD_BZIP2=3Dy
> CONFIG_RD_LZMA=3Dy
> CONFIG_RD_XZ=3Dy
> CONFIG_RD_LZO=3Dy
> CONFIG_RD_LZ4=3Dy
> CONFIG_RD_ZSTD=3Dy
> # CONFIG_BOOT_CONFIG is not set
> CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
> # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> CONFIG_LD_ORPHAN_WARN=3Dy
> CONFIG_SYSCTL=3Dy
> CONFIG_HAVE_UID16=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> # CONFIG_EXPERT is not set
> CONFIG_UID16=3Dy
> CONFIG_MULTIUSER=3Dy
> CONFIG_SGETMASK_SYSCALL=3Dy
> CONFIG_SYSFS_SYSCALL=3Dy
> CONFIG_FHANDLE=3Dy
> CONFIG_POSIX_TIMERS=3Dy
> CONFIG_PRINTK=3Dy
> CONFIG_BUG=3Dy
> CONFIG_ELF_CORE=3Dy
> CONFIG_PCSPKR_PLATFORM=3Dy
> CONFIG_BASE_FULL=3Dy
> CONFIG_FUTEX=3Dy
> CONFIG_FUTEX_PI=3Dy
> CONFIG_EPOLL=3Dy
> CONFIG_SIGNALFD=3Dy
> CONFIG_TIMERFD=3Dy
> CONFIG_EVENTFD=3Dy
> CONFIG_SHMEM=3Dy
> CONFIG_AIO=3Dy
> CONFIG_IO_URING=3Dy
> CONFIG_ADVISE_SYSCALLS=3Dy
> CONFIG_HAVE_ARCH_USERFAULTFD_WP=3Dy
> CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=3Dy
> CONFIG_MEMBARRIER=3Dy
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> CONFIG_KALLSYMS_ABSOLUTE_PERCPU=3Dy
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> CONFIG_USERFAULTFD=3Dy
> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
> CONFIG_KCMP=3Dy
> CONFIG_RSEQ=3Dy
> # CONFIG_EMBEDDED is not set
> CONFIG_HAVE_PERF_EVENTS=3Dy
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> # end of Kernel Performance Events And Counters
> =

> CONFIG_VM_EVENT_COUNTERS=3Dy
> CONFIG_SLUB_DEBUG=3Dy
> # CONFIG_COMPAT_BRK is not set
> # CONFIG_SLAB is not set
> CONFIG_SLUB=3Dy
> CONFIG_SLAB_MERGE_DEFAULT=3Dy
> CONFIG_SLAB_FREELIST_RANDOM=3Dy
> # CONFIG_SLAB_FREELIST_HARDENED is not set
> CONFIG_SHUFFLE_PAGE_ALLOCATOR=3Dy
> CONFIG_SLUB_CPU_PARTIAL=3Dy
> CONFIG_SYSTEM_DATA_VERIFICATION=3Dy
> CONFIG_PROFILING=3Dy
> CONFIG_TRACEPOINTS=3Dy
> # end of General setup
> =

> CONFIG_64BIT=3Dy
> CONFIG_X86_64=3Dy
> CONFIG_X86=3Dy
> CONFIG_INSTRUCTION_DECODER=3Dy
> CONFIG_OUTPUT_FORMAT=3D"elf64-x86-64"
> CONFIG_LOCKDEP_SUPPORT=3Dy
> CONFIG_STACKTRACE_SUPPORT=3Dy
> CONFIG_MMU=3Dy
> CONFIG_ARCH_MMAP_RND_BITS_MIN=3D28
> CONFIG_ARCH_MMAP_RND_BITS_MAX=3D32
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
> CONFIG_GENERIC_ISA_DMA=3Dy
> CONFIG_GENERIC_BUG=3Dy
> CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
> CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
> CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> CONFIG_ARCH_HAS_FILTER_PGPROT=3Dy
> CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> CONFIG_ARCH_NR_GPIO=3D1024
> CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
> CONFIG_AUDIT_ARCH=3Dy
> CONFIG_HAVE_INTEL_TXT=3Dy
> CONFIG_X86_64_SMP=3Dy
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_PGTABLE_LEVELS=3D5
> CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy
> =

> #
> # Processor type and features
> #
> CONFIG_SMP=3Dy
> CONFIG_X86_FEATURE_NAMES=3Dy
> CONFIG_X86_X2APIC=3Dy
> CONFIG_X86_MPPARSE=3Dy
> # CONFIG_GOLDFISH is not set
> CONFIG_RETPOLINE=3Dy
> # CONFIG_X86_CPU_RESCTRL is not set
> CONFIG_X86_EXTENDED_PLATFORM=3Dy
> # CONFIG_X86_NUMACHIP is not set
> # CONFIG_X86_VSMP is not set
> CONFIG_X86_UV=3Dy
> # CONFIG_X86_GOLDFISH is not set
> # CONFIG_X86_INTEL_MID is not set
> CONFIG_X86_INTEL_LPSS=3Dy
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> CONFIG_IOSF_MBI=3Dy
> # CONFIG_IOSF_MBI_DEBUG is not set
> CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> CONFIG_PARAVIRT_SPINLOCKS=3Dy
> CONFIG_X86_HV_CALLBACK_VECTOR=3Dy
> # CONFIG_XEN is not set
> CONFIG_KVM_GUEST=3Dy
> CONFIG_ARCH_CPUIDLE_HALTPOLL=3Dy
> # CONFIG_PVH is not set
> CONFIG_PARAVIRT_TIME_ACCOUNTING=3Dy
> CONFIG_PARAVIRT_CLOCK=3Dy
> # CONFIG_JAILHOUSE_GUEST is not set
> # CONFIG_ACRN_GUEST is not set
> # CONFIG_MK8 is not set
> # CONFIG_MPSC is not set
> # CONFIG_MCORE2 is not set
> # CONFIG_MATOM is not set
> CONFIG_GENERIC_CPU=3Dy
> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
> CONFIG_X86_L1_CACHE_SHIFT=3D6
> CONFIG_X86_TSC=3Dy
> CONFIG_X86_CMPXCHG64=3Dy
> CONFIG_X86_CMOV=3Dy
> CONFIG_X86_MINIMUM_CPU_FAMILY=3D64
> CONFIG_X86_DEBUGCTLMSR=3Dy
> CONFIG_IA32_FEAT_CTL=3Dy
> CONFIG_X86_VMX_FEATURE_NAMES=3Dy
> CONFIG_CPU_SUP_INTEL=3Dy
> CONFIG_CPU_SUP_AMD=3Dy
> CONFIG_CPU_SUP_HYGON=3Dy
> CONFIG_CPU_SUP_CENTAUR=3Dy
> CONFIG_CPU_SUP_ZHAOXIN=3Dy
> CONFIG_HPET_TIMER=3Dy
> CONFIG_HPET_EMULATE_RTC=3Dy
> CONFIG_DMI=3Dy
> # CONFIG_GART_IOMMU is not set
> CONFIG_MAXSMP=3Dy
> CONFIG_NR_CPUS_RANGE_BEGIN=3D8192
> CONFIG_NR_CPUS_RANGE_END=3D8192
> CONFIG_NR_CPUS_DEFAULT=3D8192
> CONFIG_NR_CPUS=3D8192
> CONFIG_SCHED_SMT=3Dy
> CONFIG_SCHED_MC=3Dy
> CONFIG_SCHED_MC_PRIO=3Dy
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
> CONFIG_X86_MCE=3Dy
> CONFIG_X86_MCELOG_LEGACY=3Dy
> CONFIG_X86_MCE_INTEL=3Dy
> CONFIG_X86_MCE_AMD=3Dy
> CONFIG_X86_MCE_THRESHOLD=3Dy
> CONFIG_X86_MCE_INJECT=3Dm
> =

> #
> # Performance monitoring
> #
> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dm
> CONFIG_PERF_EVENTS_INTEL_RAPL=3Dm
> CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dm
> # CONFIG_PERF_EVENTS_AMD_POWER is not set
> CONFIG_PERF_EVENTS_AMD_UNCORE=3Dy
> # end of Performance monitoring
> =

> CONFIG_X86_16BIT=3Dy
> CONFIG_X86_ESPFIX64=3Dy
> CONFIG_X86_VSYSCALL_EMULATION=3Dy
> CONFIG_X86_IOPL_IOPERM=3Dy
> CONFIG_I8K=3Dm
> CONFIG_MICROCODE=3Dy
> CONFIG_MICROCODE_INTEL=3Dy
> CONFIG_MICROCODE_AMD=3Dy
> CONFIG_MICROCODE_OLD_INTERFACE=3Dy
> CONFIG_X86_MSR=3Dy
> CONFIG_X86_CPUID=3Dy
> CONFIG_X86_5LEVEL=3Dy
> CONFIG_X86_DIRECT_GBPAGES=3Dy
> # CONFIG_X86_CPA_STATISTICS is not set
> # CONFIG_AMD_MEM_ENCRYPT is not set
> CONFIG_NUMA=3Dy
> # CONFIG_AMD_NUMA is not set
> CONFIG_X86_64_ACPI_NUMA=3Dy
> CONFIG_NUMA_EMU=3Dy
> CONFIG_NODES_SHIFT=3D10
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> # CONFIG_ARCH_MEMORY_PROBE is not set
> CONFIG_ARCH_PROC_KCORE_TEXT=3Dy
> CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
> CONFIG_X86_PMEM_LEGACY_DEVICE=3Dy
> CONFIG_X86_PMEM_LEGACY=3Dm
> CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
> # CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
> CONFIG_MTRR=3Dy
> CONFIG_MTRR_SANITIZER=3Dy
> CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=3D1
> CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=3D1
> CONFIG_X86_PAT=3Dy
> CONFIG_ARCH_USES_PG_UNCACHED=3Dy
> CONFIG_ARCH_RANDOM=3Dy
> CONFIG_X86_SMAP=3Dy
> CONFIG_X86_UMIP=3Dy
> CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=3Dy
> CONFIG_X86_INTEL_TSX_MODE_OFF=3Dy
> # CONFIG_X86_INTEL_TSX_MODE_ON is not set
> # CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
> # CONFIG_X86_SGX is not set
> CONFIG_EFI=3Dy
> CONFIG_EFI_STUB=3Dy
> CONFIG_EFI_MIXED=3Dy
> # CONFIG_HZ_100 is not set
> # CONFIG_HZ_250 is not set
> # CONFIG_HZ_300 is not set
> CONFIG_HZ_1000=3Dy
> CONFIG_HZ=3D1000
> CONFIG_SCHED_HRTICK=3Dy
> CONFIG_KEXEC=3Dy
> CONFIG_KEXEC_FILE=3Dy
> CONFIG_ARCH_HAS_KEXEC_PURGATORY=3Dy
> # CONFIG_KEXEC_SIG is not set
> CONFIG_CRASH_DUMP=3Dy
> CONFIG_KEXEC_JUMP=3Dy
> CONFIG_PHYSICAL_START=3D0x1000000
> CONFIG_RELOCATABLE=3Dy
> CONFIG_RANDOMIZE_BASE=3Dy
> CONFIG_X86_NEED_RELOCS=3Dy
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> CONFIG_DYNAMIC_MEMORY_LAYOUT=3Dy
> CONFIG_RANDOMIZE_MEMORY=3Dy
> CONFIG_RANDOMIZE_MEMORY_PHYSICAL_PADDING=3D0xa
> CONFIG_HOTPLUG_CPU=3Dy
> CONFIG_BOOTPARAM_HOTPLUG_CPU0=3Dy
> # CONFIG_DEBUG_HOTPLUG_CPU0 is not set
> # CONFIG_COMPAT_VDSO is not set
> CONFIG_LEGACY_VSYSCALL_EMULATE=3Dy
> # CONFIG_LEGACY_VSYSCALL_XONLY is not set
> # CONFIG_LEGACY_VSYSCALL_NONE is not set
> # CONFIG_CMDLINE_BOOL is not set
> CONFIG_MODIFY_LDT_SYSCALL=3Dy
> # CONFIG_STRICT_SIGALTSTACK_SIZE is not set
> CONFIG_HAVE_LIVEPATCH=3Dy
> CONFIG_LIVEPATCH=3Dy
> # end of Processor type and features
> =

> CONFIG_ARCH_HAS_ADD_PAGES=3Dy
> CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=3Dy
> CONFIG_USE_PERCPU_NUMA_NODE_ID=3Dy
> =

> #
> # Power management and ACPI options
> #
> CONFIG_ARCH_HIBERNATION_HEADER=3Dy
> CONFIG_SUSPEND=3Dy
> CONFIG_SUSPEND_FREEZER=3Dy
> CONFIG_HIBERNATE_CALLBACKS=3Dy
> CONFIG_HIBERNATION=3Dy
> CONFIG_HIBERNATION_SNAPSHOT_DEV=3Dy
> CONFIG_PM_STD_PARTITION=3D""
> CONFIG_PM_SLEEP=3Dy
> CONFIG_PM_SLEEP_SMP=3Dy
> # CONFIG_PM_AUTOSLEEP is not set
> # CONFIG_PM_WAKELOCKS is not set
> CONFIG_PM=3Dy
> CONFIG_PM_DEBUG=3Dy
> # CONFIG_PM_ADVANCED_DEBUG is not set
> # CONFIG_PM_TEST_SUSPEND is not set
> CONFIG_PM_SLEEP_DEBUG=3Dy
> # CONFIG_PM_TRACE_RTC is not set
> CONFIG_PM_CLK=3Dy
> # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
> # CONFIG_ENERGY_MODEL is not set
> CONFIG_ARCH_SUPPORTS_ACPI=3Dy
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> # CONFIG_ACPI_DEBUGGER is not set
> CONFIG_ACPI_SPCR_TABLE=3Dy
> # CONFIG_ACPI_FPDT is not set
> CONFIG_ACPI_LPIT=3Dy
> CONFIG_ACPI_SLEEP=3Dy
> CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
> CONFIG_ACPI_EC_DEBUGFS=3Dm
> CONFIG_ACPI_AC=3Dy
> CONFIG_ACPI_BATTERY=3Dy
> CONFIG_ACPI_BUTTON=3Dy
> CONFIG_ACPI_VIDEO=3Dm
> CONFIG_ACPI_FAN=3Dy
> CONFIG_ACPI_TAD=3Dm
> CONFIG_ACPI_DOCK=3Dy
> CONFIG_ACPI_CPU_FREQ_PSS=3Dy
> CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> CONFIG_ACPI_CPPC_LIB=3Dy
> CONFIG_ACPI_PROCESSOR=3Dy
> CONFIG_ACPI_IPMI=3Dm
> CONFIG_ACPI_HOTPLUG_CPU=3Dy
> CONFIG_ACPI_PROCESSOR_AGGREGATOR=3Dm
> CONFIG_ACPI_THERMAL=3Dy
> CONFIG_ACPI_PLATFORM_PROFILE=3Dm
> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> CONFIG_ACPI_TABLE_UPGRADE=3Dy
> # CONFIG_ACPI_DEBUG is not set
> CONFIG_ACPI_PCI_SLOT=3Dy
> CONFIG_ACPI_CONTAINER=3Dy
> CONFIG_ACPI_HOTPLUG_MEMORY=3Dy
> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> CONFIG_ACPI_SBS=3Dm
> CONFIG_ACPI_HED=3Dy
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> CONFIG_ACPI_BGRT=3Dy
> CONFIG_ACPI_NFIT=3Dm
> # CONFIG_NFIT_SECURITY_DEBUG is not set
> CONFIG_ACPI_NUMA=3Dy
> # CONFIG_ACPI_HMAT is not set
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> CONFIG_ACPI_APEI=3Dy
> CONFIG_ACPI_APEI_GHES=3Dy
> CONFIG_ACPI_APEI_PCIEAER=3Dy
> CONFIG_ACPI_APEI_MEMORY_FAILURE=3Dy
> CONFIG_ACPI_APEI_EINJ=3Dm
> # CONFIG_ACPI_APEI_ERST_DEBUG is not set
> # CONFIG_ACPI_DPTF is not set
> CONFIG_ACPI_WATCHDOG=3Dy
> CONFIG_ACPI_EXTLOG=3Dm
> CONFIG_ACPI_ADXL=3Dy
> # CONFIG_ACPI_CONFIGFS is not set
> CONFIG_PMIC_OPREGION=3Dy
> CONFIG_X86_PM_TIMER=3Dy
> CONFIG_ACPI_PRMT=3Dy
> =

> #
> # CPU Frequency scaling
> #
> CONFIG_CPU_FREQ=3Dy
> CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
> CONFIG_CPU_FREQ_GOV_COMMON=3Dy
> CONFIG_CPU_FREQ_STAT=3Dy
> CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=3Dy
> # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
> CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
> CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
> CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
> CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
> CONFIG_CPU_FREQ_GOV_SCHEDUTIL=3Dy
> =

> #
> # CPU frequency scaling drivers
> #
> CONFIG_X86_INTEL_PSTATE=3Dy
> # CONFIG_X86_PCC_CPUFREQ is not set
> CONFIG_X86_ACPI_CPUFREQ=3Dm
> CONFIG_X86_ACPI_CPUFREQ_CPB=3Dy
> CONFIG_X86_POWERNOW_K8=3Dm
> # CONFIG_X86_AMD_FREQ_SENSITIVITY is not set
> # CONFIG_X86_SPEEDSTEP_CENTRINO is not set
> CONFIG_X86_P4_CLOCKMOD=3Dm
> =

> #
> # shared options
> #
> CONFIG_X86_SPEEDSTEP_LIB=3Dm
> # end of CPU Frequency scaling
> =

> #
> # CPU Idle
> #
> CONFIG_CPU_IDLE=3Dy
> # CONFIG_CPU_IDLE_GOV_LADDER is not set
> CONFIG_CPU_IDLE_GOV_MENU=3Dy
> # CONFIG_CPU_IDLE_GOV_TEO is not set
> # CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
> CONFIG_HALTPOLL_CPUIDLE=3Dy
> # end of CPU Idle
> =

> CONFIG_INTEL_IDLE=3Dy
> # end of Power management and ACPI options
> =

> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI_DIRECT=3Dy
> CONFIG_PCI_MMCONFIG=3Dy
> CONFIG_MMCONF_FAM10H=3Dy
> CONFIG_ISA_DMA_API=3Dy
> CONFIG_AMD_NB=3Dy
> # end of Bus options (PCI etc.)
> =

> #
> # Binary Emulations
> #
> CONFIG_IA32_EMULATION=3Dy
> # CONFIG_X86_X32 is not set
> CONFIG_COMPAT_32=3Dy
> CONFIG_COMPAT=3Dy
> CONFIG_COMPAT_FOR_U64_ALIGNMENT=3Dy
> CONFIG_SYSVIPC_COMPAT=3Dy
> # end of Binary Emulations
> =

> CONFIG_HAVE_KVM=3Dy
> CONFIG_HAVE_KVM_IRQCHIP=3Dy
> CONFIG_HAVE_KVM_IRQFD=3Dy
> CONFIG_HAVE_KVM_IRQ_ROUTING=3Dy
> CONFIG_HAVE_KVM_EVENTFD=3Dy
> CONFIG_KVM_MMIO=3Dy
> CONFIG_KVM_ASYNC_PF=3Dy
> CONFIG_HAVE_KVM_MSI=3Dy
> CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=3Dy
> CONFIG_KVM_VFIO=3Dy
> CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=3Dy
> CONFIG_KVM_COMPAT=3Dy
> CONFIG_HAVE_KVM_IRQ_BYPASS=3Dy
> CONFIG_HAVE_KVM_NO_POLL=3Dy
> CONFIG_KVM_XFER_TO_GUEST_WORK=3Dy
> CONFIG_HAVE_KVM_PM_NOTIFIER=3Dy
> CONFIG_VIRTUALIZATION=3Dy
> CONFIG_KVM=3Dm
> CONFIG_KVM_INTEL=3Dm
> # CONFIG_KVM_AMD is not set
> # CONFIG_KVM_XEN is not set
> CONFIG_KVM_MMU_AUDIT=3Dy
> CONFIG_AS_AVX512=3Dy
> CONFIG_AS_SHA1_NI=3Dy
> CONFIG_AS_SHA256_NI=3Dy
> CONFIG_AS_TPAUSE=3Dy
> =

> #
> # General architecture-dependent options
> #
> CONFIG_CRASH_CORE=3Dy
> CONFIG_KEXEC_CORE=3Dy
> CONFIG_HOTPLUG_SMT=3Dy
> CONFIG_GENERIC_ENTRY=3Dy
> CONFIG_KPROBES=3Dy
> CONFIG_JUMP_LABEL=3Dy
> # CONFIG_STATIC_KEYS_SELFTEST is not set
> # CONFIG_STATIC_CALL_SELFTEST is not set
> CONFIG_OPTPROBES=3Dy
> CONFIG_KPROBES_ON_FTRACE=3Dy
> CONFIG_UPROBES=3Dy
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> CONFIG_KRETPROBES=3Dy
> CONFIG_USER_RETURN_NOTIFIER=3Dy
> CONFIG_HAVE_IOREMAP_PROT=3Dy
> CONFIG_HAVE_KPROBES=3Dy
> CONFIG_HAVE_KRETPROBES=3Dy
> CONFIG_HAVE_OPTPROBES=3Dy
> CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
> CONFIG_HAVE_FUNCTION_ERROR_INJECTION=3Dy
> CONFIG_HAVE_NMI=3Dy
> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> CONFIG_ARCH_HAS_FORTIFY_SOURCE=3Dy
> CONFIG_ARCH_HAS_SET_MEMORY=3Dy
> CONFIG_ARCH_HAS_SET_DIRECT_MAP=3Dy
> CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=3Dy
> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> CONFIG_ARCH_WANTS_NO_INSTR=3Dy
> CONFIG_HAVE_ASM_MODVERSIONS=3Dy
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> CONFIG_HAVE_RSEQ=3Dy
> CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=3Dy
> CONFIG_HAVE_HW_BREAKPOINT=3Dy
> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
> CONFIG_HAVE_PERF_REGS=3Dy
> CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=3Dy
> CONFIG_MMU_GATHER_TABLE_FREE=3Dy
> CONFIG_MMU_GATHER_RCU_TABLE_FREE=3Dy
> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> CONFIG_HAVE_ALIGNED_STRUCT_PAGE=3Dy
> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=3Dy
> CONFIG_ARCH_WANT_OLD_COMPAT_IPC=3Dy
> CONFIG_HAVE_ARCH_SECCOMP=3Dy
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> CONFIG_SECCOMP=3Dy
> CONFIG_SECCOMP_FILTER=3Dy
> # CONFIG_SECCOMP_CACHE_DEBUG is not set
> CONFIG_HAVE_ARCH_STACKLEAK=3Dy
> CONFIG_HAVE_STACKPROTECTOR=3Dy
> CONFIG_STACKPROTECTOR=3Dy
> CONFIG_STACKPROTECTOR_STRONG=3Dy
> CONFIG_ARCH_SUPPORTS_LTO_CLANG=3Dy
> CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=3Dy
> CONFIG_LTO_NONE=3Dy
> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> CONFIG_HAVE_CONTEXT_TRACKING=3Dy
> CONFIG_HAVE_CONTEXT_TRACKING_OFFSTACK=3Dy
> CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_MOVE_PUD=3Dy
> CONFIG_HAVE_MOVE_PMD=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=3Dy
> CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
> CONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy
> CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
> CONFIG_MODULES_USE_ELF_RELA=3Dy
> CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=3Dy
> CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=3Dy
> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
> CONFIG_HAVE_EXIT_THREAD=3Dy
> CONFIG_ARCH_MMAP_RND_BITS=3D28
> CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=3Dy
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS=3D8
> CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=3Dy
> CONFIG_HAVE_STACK_VALIDATION=3Dy
> CONFIG_HAVE_RELIABLE_STACKTRACE=3Dy
> CONFIG_OLD_SIGSUSPEND3=3Dy
> CONFIG_COMPAT_OLD_SIGACTION=3Dy
> CONFIG_COMPAT_32BIT_TIME=3Dy
> CONFIG_HAVE_ARCH_VMAP_STACK=3Dy
> CONFIG_VMAP_STACK=3Dy
> CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=3Dy
> # CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> CONFIG_STRICT_KERNEL_RWX=3Dy
> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> CONFIG_STRICT_MODULE_RWX=3Dy
> CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=3Dy
> CONFIG_ARCH_USE_MEMREMAP_PROT=3Dy
> # CONFIG_LOCK_EVENT_COUNTS is not set
> CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
> CONFIG_HAVE_STATIC_CALL=3Dy
> CONFIG_HAVE_STATIC_CALL_INLINE=3Dy
> CONFIG_HAVE_PREEMPT_DYNAMIC=3Dy
> CONFIG_ARCH_WANT_LD_ORPHAN_WARN=3Dy
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> CONFIG_ARCH_HAS_ELFCORE_COMPAT=3Dy
> CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=3Dy
> CONFIG_DYNAMIC_SIGFRAME=3Dy
> =

> #
> # GCOV-based kernel profiling
> #
> # CONFIG_GCOV_KERNEL is not set
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> # end of GCOV-based kernel profiling
> =

> CONFIG_HAVE_GCC_PLUGINS=3Dy
> # end of General architecture-dependent options
> =

> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D0
> CONFIG_MODULE_SIG_FORMAT=3Dy
> CONFIG_MODULES=3Dy
> CONFIG_MODULE_FORCE_LOAD=3Dy
> CONFIG_MODULE_UNLOAD=3Dy
> # CONFIG_MODULE_FORCE_UNLOAD is not set
> # CONFIG_MODVERSIONS is not set
> # CONFIG_MODULE_SRCVERSION_ALL is not set
> CONFIG_MODULE_SIG=3Dy
> # CONFIG_MODULE_SIG_FORCE is not set
> CONFIG_MODULE_SIG_ALL=3Dy
> # CONFIG_MODULE_SIG_SHA1 is not set
> # CONFIG_MODULE_SIG_SHA224 is not set
> CONFIG_MODULE_SIG_SHA256=3Dy
> # CONFIG_MODULE_SIG_SHA384 is not set
> # CONFIG_MODULE_SIG_SHA512 is not set
> CONFIG_MODULE_SIG_HASH=3D"sha256"
> CONFIG_MODULE_COMPRESS_NONE=3Dy
> # CONFIG_MODULE_COMPRESS_GZIP is not set
> # CONFIG_MODULE_COMPRESS_XZ is not set
> # CONFIG_MODULE_COMPRESS_ZSTD is not set
> # CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
> CONFIG_MODPROBE_PATH=3D"/sbin/modprobe"
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> CONFIG_BLOCK=3Dy
> CONFIG_BLK_CGROUP_RWSTAT=3Dy
> CONFIG_BLK_DEV_BSG_COMMON=3Dy
> CONFIG_BLK_DEV_BSGLIB=3Dy
> CONFIG_BLK_DEV_INTEGRITY=3Dy
> CONFIG_BLK_DEV_INTEGRITY_T10=3Dm
> # CONFIG_BLK_DEV_ZONED is not set
> CONFIG_BLK_DEV_THROTTLING=3Dy
> # CONFIG_BLK_DEV_THROTTLING_LOW is not set
> CONFIG_BLK_WBT=3Dy
> CONFIG_BLK_WBT_MQ=3Dy
> # CONFIG_BLK_CGROUP_IOLATENCY is not set
> # CONFIG_BLK_CGROUP_FC_APPID is not set
> # CONFIG_BLK_CGROUP_IOCOST is not set
> # CONFIG_BLK_CGROUP_IOPRIO is not set
> CONFIG_BLK_DEBUG_FS=3Dy
> # CONFIG_BLK_SED_OPAL is not set
> # CONFIG_BLK_INLINE_ENCRYPTION is not set
> =

> #
> # Partition Types
> #
> CONFIG_PARTITION_ADVANCED=3Dy
> # CONFIG_ACORN_PARTITION is not set
> # CONFIG_AIX_PARTITION is not set
> CONFIG_OSF_PARTITION=3Dy
> CONFIG_AMIGA_PARTITION=3Dy
> # CONFIG_ATARI_PARTITION is not set
> CONFIG_MAC_PARTITION=3Dy
> CONFIG_MSDOS_PARTITION=3Dy
> CONFIG_BSD_DISKLABEL=3Dy
> CONFIG_MINIX_SUBPARTITION=3Dy
> CONFIG_SOLARIS_X86_PARTITION=3Dy
> CONFIG_UNIXWARE_DISKLABEL=3Dy
> # CONFIG_LDM_PARTITION is not set
> CONFIG_SGI_PARTITION=3Dy
> # CONFIG_ULTRIX_PARTITION is not set
> CONFIG_SUN_PARTITION=3Dy
> CONFIG_KARMA_PARTITION=3Dy
> CONFIG_EFI_PARTITION=3Dy
> # CONFIG_SYSV68_PARTITION is not set
> # CONFIG_CMDLINE_PARTITION is not set
> # end of Partition Types
> =

> CONFIG_BLOCK_COMPAT=3Dy
> CONFIG_BLK_MQ_PCI=3Dy
> CONFIG_BLK_MQ_VIRTIO=3Dy
> CONFIG_BLK_PM=3Dy
> CONFIG_BLOCK_HOLDER_DEPRECATED=3Dy
> =

> #
> # IO Schedulers
> #
> CONFIG_MQ_IOSCHED_DEADLINE=3Dy
> CONFIG_MQ_IOSCHED_KYBER=3Dy
> CONFIG_IOSCHED_BFQ=3Dy
> CONFIG_BFQ_GROUP_IOSCHED=3Dy
> # CONFIG_BFQ_CGROUP_DEBUG is not set
> # end of IO Schedulers
> =

> CONFIG_PREEMPT_NOTIFIERS=3Dy
> CONFIG_PADATA=3Dy
> CONFIG_ASN1=3Dy
> CONFIG_INLINE_SPIN_UNLOCK_IRQ=3Dy
> CONFIG_INLINE_READ_UNLOCK=3Dy
> CONFIG_INLINE_READ_UNLOCK_IRQ=3Dy
> CONFIG_INLINE_WRITE_UNLOCK=3Dy
> CONFIG_INLINE_WRITE_UNLOCK_IRQ=3Dy
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> CONFIG_MUTEX_SPIN_ON_OWNER=3Dy
> CONFIG_RWSEM_SPIN_ON_OWNER=3Dy
> CONFIG_LOCK_SPIN_ON_OWNER=3Dy
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> CONFIG_QUEUED_SPINLOCKS=3Dy
> CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> CONFIG_QUEUED_RWLOCKS=3Dy
> CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=3Dy
> CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=3Dy
> CONFIG_ARCH_HAS_SYSCALL_WRAPPER=3Dy
> CONFIG_FREEZER=3Dy
> =

> #
> # Executable file formats
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_COMPAT_BINFMT_ELF=3Dy
> CONFIG_ELFCORE=3Dy
> CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> CONFIG_BINFMT_MISC=3Dm
> CONFIG_COREDUMP=3Dy
> # end of Executable file formats
> =

> #
> # Memory Management options
> #
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> CONFIG_SPARSEMEM_MANUAL=3Dy
> CONFIG_SPARSEMEM=3Dy
> CONFIG_SPARSEMEM_EXTREME=3Dy
> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
> CONFIG_SPARSEMEM_VMEMMAP=3Dy
> CONFIG_HAVE_FAST_GUP=3Dy
> CONFIG_NUMA_KEEP_MEMINFO=3Dy
> CONFIG_MEMORY_ISOLATION=3Dy
> CONFIG_HAVE_BOOTMEM_INFO_NODE=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> CONFIG_MEMORY_HOTPLUG=3Dy
> CONFIG_MEMORY_HOTPLUG_SPARSE=3Dy
> # CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=3Dy
> CONFIG_MEMORY_HOTREMOVE=3Dy
> CONFIG_MHP_MEMMAP_ON_MEMORY=3Dy
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> CONFIG_MEMORY_BALLOON=3Dy
> CONFIG_BALLOON_COMPACTION=3Dy
> CONFIG_COMPACTION=3Dy
> CONFIG_PAGE_REPORTING=3Dy
> CONFIG_MIGRATION=3Dy
> CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=3Dy
> CONFIG_ARCH_ENABLE_THP_MIGRATION=3Dy
> CONFIG_CONTIG_ALLOC=3Dy
> CONFIG_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_VIRT_TO_BUS=3Dy
> CONFIG_MMU_NOTIFIER=3Dy
> CONFIG_KSM=3Dy
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
> CONFIG_MEMORY_FAILURE=3Dy
> CONFIG_HWPOISON_INJECT=3Dm
> CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=3Dy
> # CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
> CONFIG_ARCH_WANTS_THP_SWAP=3Dy
> CONFIG_THP_SWAP=3Dy
> CONFIG_CLEANCACHE=3Dy
> CONFIG_FRONTSWAP=3Dy
> # CONFIG_CMA is not set
> CONFIG_ZSWAP=3Dy
> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
> CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO=3Dy
> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC is not set
> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
> CONFIG_ZSWAP_COMPRESSOR_DEFAULT=3D"lzo"
> CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD=3Dy
> # CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD is not set
> # CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC is not set
> CONFIG_ZSWAP_ZPOOL_DEFAULT=3D"zbud"
> # CONFIG_ZSWAP_DEFAULT_ON is not set
> CONFIG_ZPOOL=3Dy
> CONFIG_ZBUD=3Dy
> # CONFIG_Z3FOLD is not set
> CONFIG_ZSMALLOC=3Dy
> CONFIG_ZSMALLOC_STAT=3Dy
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> CONFIG_DEFERRED_STRUCT_PAGE_INIT=3Dy
> CONFIG_PAGE_IDLE_FLAG=3Dy
> CONFIG_IDLE_PAGE_TRACKING=3Dy
> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> CONFIG_ARCH_HAS_PTE_DEVMAP=3Dy
> CONFIG_ZONE_DMA=3Dy
> CONFIG_ZONE_DMA32=3Dy
> CONFIG_ZONE_DEVICE=3Dy
> CONFIG_DEV_PAGEMAP_OPS=3Dy
> CONFIG_DEVICE_PRIVATE=3Dy
> CONFIG_VMAP_PFN=3Dy
> CONFIG_ARCH_USES_HIGH_VMA_FLAGS=3Dy
> CONFIG_ARCH_HAS_PKEYS=3Dy
> # CONFIG_PERCPU_STATS is not set
> # CONFIG_GUP_TEST is not set
> # CONFIG_READ_ONLY_THP_FOR_FS is not set
> CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
> CONFIG_SECRETMEM=3Dy
> =

> #
> # Data Access Monitoring
> #
> # CONFIG_DAMON is not set
> # end of Data Access Monitoring
> # end of Memory Management options
> =

> CONFIG_NET=3Dy
> CONFIG_NET_INGRESS=3Dy
> CONFIG_NET_EGRESS=3Dy
> CONFIG_SKB_EXTENSIONS=3Dy
> =

> #
> # Networking options
> #
> # CONFIG_PACKET is not set
> CONFIG_UNIX=3Dy
> CONFIG_UNIX_SCM=3Dy
> CONFIG_AF_UNIX_OOB=3Dy
> CONFIG_UNIX_DIAG=3Dm
> CONFIG_TLS=3Dm
> CONFIG_TLS_DEVICE=3Dy
> # CONFIG_TLS_TOE is not set
> CONFIG_XFRM=3Dy
> CONFIG_XFRM_OFFLOAD=3Dy
> CONFIG_XFRM_ALGO=3Dy
> CONFIG_XFRM_USER=3Dy
> # CONFIG_XFRM_USER_COMPAT is not set
> # CONFIG_XFRM_INTERFACE is not set
> CONFIG_XFRM_SUB_POLICY=3Dy
> CONFIG_XFRM_MIGRATE=3Dy
> CONFIG_XFRM_STATISTICS=3Dy
> CONFIG_XFRM_AH=3Dm
> CONFIG_XFRM_ESP=3Dm
> CONFIG_XFRM_IPCOMP=3Dm
> CONFIG_NET_KEY=3Dm
> CONFIG_NET_KEY_MIGRATE=3Dy
> CONFIG_XDP_SOCKETS=3Dy
> # CONFIG_XDP_SOCKETS_DIAG is not set
> CONFIG_INET=3Dy
> CONFIG_IP_MULTICAST=3Dy
> CONFIG_IP_ADVANCED_ROUTER=3Dy
> CONFIG_IP_FIB_TRIE_STATS=3Dy
> CONFIG_IP_MULTIPLE_TABLES=3Dy
> CONFIG_IP_ROUTE_MULTIPATH=3Dy
> CONFIG_IP_ROUTE_VERBOSE=3Dy
> CONFIG_IP_ROUTE_CLASSID=3Dy
> CONFIG_IP_PNP=3Dy
> CONFIG_IP_PNP_DHCP=3Dy
> # CONFIG_IP_PNP_BOOTP is not set
> # CONFIG_IP_PNP_RARP is not set
> CONFIG_NET_IPIP=3Dm
> CONFIG_NET_IPGRE_DEMUX=3Dm
> CONFIG_NET_IP_TUNNEL=3Dm
> CONFIG_NET_IPGRE=3Dm
> CONFIG_NET_IPGRE_BROADCAST=3Dy
> CONFIG_IP_MROUTE_COMMON=3Dy
> CONFIG_IP_MROUTE=3Dy
> CONFIG_IP_MROUTE_MULTIPLE_TABLES=3Dy
> CONFIG_IP_PIMSM_V1=3Dy
> CONFIG_IP_PIMSM_V2=3Dy
> CONFIG_SYN_COOKIES=3Dy
> CONFIG_NET_IPVTI=3Dm
> CONFIG_NET_UDP_TUNNEL=3Dm
> # CONFIG_NET_FOU is not set
> # CONFIG_NET_FOU_IP_TUNNELS is not set
> CONFIG_INET_AH=3Dm
> CONFIG_INET_ESP=3Dm
> CONFIG_INET_ESP_OFFLOAD=3Dm
> # CONFIG_INET_ESPINTCP is not set
> CONFIG_INET_IPCOMP=3Dm
> CONFIG_INET_XFRM_TUNNEL=3Dm
> CONFIG_INET_TUNNEL=3Dm
> CONFIG_INET_DIAG=3Dm
> CONFIG_INET_TCP_DIAG=3Dm
> CONFIG_INET_UDP_DIAG=3Dm
> CONFIG_INET_RAW_DIAG=3Dm
> # CONFIG_INET_DIAG_DESTROY is not set
> CONFIG_TCP_CONG_ADVANCED=3Dy
> CONFIG_TCP_CONG_BIC=3Dm
> CONFIG_TCP_CONG_CUBIC=3Dy
> CONFIG_TCP_CONG_WESTWOOD=3Dm
> CONFIG_TCP_CONG_HTCP=3Dm
> CONFIG_TCP_CONG_HSTCP=3Dm
> CONFIG_TCP_CONG_HYBLA=3Dm
> CONFIG_TCP_CONG_VEGAS=3Dm
> CONFIG_TCP_CONG_NV=3Dm
> CONFIG_TCP_CONG_SCALABLE=3Dm
> CONFIG_TCP_CONG_LP=3Dm
> CONFIG_TCP_CONG_VENO=3Dm
> CONFIG_TCP_CONG_YEAH=3Dm
> CONFIG_TCP_CONG_ILLINOIS=3Dm
> CONFIG_TCP_CONG_DCTCP=3Dm
> # CONFIG_TCP_CONG_CDG is not set
> CONFIG_TCP_CONG_BBR=3Dm
> CONFIG_DEFAULT_CUBIC=3Dy
> # CONFIG_DEFAULT_RENO is not set
> CONFIG_DEFAULT_TCP_CONG=3D"cubic"
> CONFIG_TCP_MD5SIG=3Dy
> CONFIG_IPV6=3Dy
> CONFIG_IPV6_ROUTER_PREF=3Dy
> CONFIG_IPV6_ROUTE_INFO=3Dy
> CONFIG_IPV6_OPTIMISTIC_DAD=3Dy
> CONFIG_INET6_AH=3Dm
> CONFIG_INET6_ESP=3Dm
> CONFIG_INET6_ESP_OFFLOAD=3Dm
> # CONFIG_INET6_ESPINTCP is not set
> CONFIG_INET6_IPCOMP=3Dm
> CONFIG_IPV6_MIP6=3Dm
> # CONFIG_IPV6_ILA is not set
> CONFIG_INET6_XFRM_TUNNEL=3Dm
> CONFIG_INET6_TUNNEL=3Dm
> CONFIG_IPV6_VTI=3Dm
> CONFIG_IPV6_SIT=3Dm
> CONFIG_IPV6_SIT_6RD=3Dy
> CONFIG_IPV6_NDISC_NODETYPE=3Dy
> CONFIG_IPV6_TUNNEL=3Dm
> CONFIG_IPV6_GRE=3Dm
> CONFIG_IPV6_MULTIPLE_TABLES=3Dy
> # CONFIG_IPV6_SUBTREES is not set
> CONFIG_IPV6_MROUTE=3Dy
> CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=3Dy
> CONFIG_IPV6_PIMSM_V2=3Dy
> # CONFIG_IPV6_SEG6_LWTUNNEL is not set
> # CONFIG_IPV6_SEG6_HMAC is not set
> # CONFIG_IPV6_RPL_LWTUNNEL is not set
> # CONFIG_IPV6_IOAM6_LWTUNNEL is not set
> CONFIG_NETLABEL=3Dy
> # CONFIG_MPTCP is not set
> CONFIG_NETWORK_SECMARK=3Dy
> CONFIG_NET_PTP_CLASSIFY=3Dy
> CONFIG_NETWORK_PHY_TIMESTAMPING=3Dy
> CONFIG_NETFILTER=3Dy
> CONFIG_NETFILTER_ADVANCED=3Dy
> CONFIG_BRIDGE_NETFILTER=3Dm
> =

> #
> # Core Netfilter Configuration
> #
> CONFIG_NETFILTER_INGRESS=3Dy
> CONFIG_NETFILTER_NETLINK=3Dm
> CONFIG_NETFILTER_FAMILY_BRIDGE=3Dy
> CONFIG_NETFILTER_FAMILY_ARP=3Dy
> # CONFIG_NETFILTER_NETLINK_HOOK is not set
> # CONFIG_NETFILTER_NETLINK_ACCT is not set
> CONFIG_NETFILTER_NETLINK_QUEUE=3Dm
> CONFIG_NETFILTER_NETLINK_LOG=3Dm
> CONFIG_NETFILTER_NETLINK_OSF=3Dm
> CONFIG_NF_CONNTRACK=3Dm
> CONFIG_NF_LOG_SYSLOG=3Dm
> CONFIG_NETFILTER_CONNCOUNT=3Dm
> CONFIG_NF_CONNTRACK_MARK=3Dy
> CONFIG_NF_CONNTRACK_SECMARK=3Dy
> CONFIG_NF_CONNTRACK_ZONES=3Dy
> CONFIG_NF_CONNTRACK_PROCFS=3Dy
> CONFIG_NF_CONNTRACK_EVENTS=3Dy
> CONFIG_NF_CONNTRACK_TIMEOUT=3Dy
> CONFIG_NF_CONNTRACK_TIMESTAMP=3Dy
> CONFIG_NF_CONNTRACK_LABELS=3Dy
> CONFIG_NF_CT_PROTO_DCCP=3Dy
> CONFIG_NF_CT_PROTO_GRE=3Dy
> CONFIG_NF_CT_PROTO_SCTP=3Dy
> CONFIG_NF_CT_PROTO_UDPLITE=3Dy
> CONFIG_NF_CONNTRACK_AMANDA=3Dm
> CONFIG_NF_CONNTRACK_FTP=3Dm
> CONFIG_NF_CONNTRACK_H323=3Dm
> CONFIG_NF_CONNTRACK_IRC=3Dm
> CONFIG_NF_CONNTRACK_BROADCAST=3Dm
> CONFIG_NF_CONNTRACK_NETBIOS_NS=3Dm
> CONFIG_NF_CONNTRACK_SNMP=3Dm
> CONFIG_NF_CONNTRACK_PPTP=3Dm
> CONFIG_NF_CONNTRACK_SANE=3Dm
> CONFIG_NF_CONNTRACK_SIP=3Dm
> CONFIG_NF_CONNTRACK_TFTP=3Dm
> CONFIG_NF_CT_NETLINK=3Dm
> CONFIG_NF_CT_NETLINK_TIMEOUT=3Dm
> CONFIG_NF_CT_NETLINK_HELPER=3Dm
> CONFIG_NETFILTER_NETLINK_GLUE_CT=3Dy
> CONFIG_NF_NAT=3Dm
> CONFIG_NF_NAT_AMANDA=3Dm
> CONFIG_NF_NAT_FTP=3Dm
> CONFIG_NF_NAT_IRC=3Dm
> CONFIG_NF_NAT_SIP=3Dm
> CONFIG_NF_NAT_TFTP=3Dm
> CONFIG_NF_NAT_REDIRECT=3Dy
> CONFIG_NF_NAT_MASQUERADE=3Dy
> CONFIG_NETFILTER_SYNPROXY=3Dm
> CONFIG_NF_TABLES=3Dm
> CONFIG_NF_TABLES_INET=3Dy
> CONFIG_NF_TABLES_NETDEV=3Dy
> CONFIG_NFT_NUMGEN=3Dm
> CONFIG_NFT_CT=3Dm
> CONFIG_NFT_COUNTER=3Dm
> CONFIG_NFT_CONNLIMIT=3Dm
> CONFIG_NFT_LOG=3Dm
> CONFIG_NFT_LIMIT=3Dm
> CONFIG_NFT_MASQ=3Dm
> CONFIG_NFT_REDIR=3Dm
> CONFIG_NFT_NAT=3Dm
> # CONFIG_NFT_TUNNEL is not set
> CONFIG_NFT_OBJREF=3Dm
> CONFIG_NFT_QUEUE=3Dm
> CONFIG_NFT_QUOTA=3Dm
> CONFIG_NFT_REJECT=3Dm
> CONFIG_NFT_REJECT_INET=3Dm
> CONFIG_NFT_COMPAT=3Dm
> CONFIG_NFT_HASH=3Dm
> CONFIG_NFT_FIB=3Dm
> CONFIG_NFT_FIB_INET=3Dm
> # CONFIG_NFT_XFRM is not set
> CONFIG_NFT_SOCKET=3Dm
> # CONFIG_NFT_OSF is not set
> # CONFIG_NFT_TPROXY is not set
> # CONFIG_NFT_SYNPROXY is not set
> CONFIG_NF_DUP_NETDEV=3Dm
> CONFIG_NFT_DUP_NETDEV=3Dm
> CONFIG_NFT_FWD_NETDEV=3Dm
> CONFIG_NFT_FIB_NETDEV=3Dm
> # CONFIG_NFT_REJECT_NETDEV is not set
> # CONFIG_NF_FLOW_TABLE is not set
> CONFIG_NETFILTER_XTABLES=3Dy
> CONFIG_NETFILTER_XTABLES_COMPAT=3Dy
> =

> #
> # Xtables combined modules
> #
> CONFIG_NETFILTER_XT_MARK=3Dm
> CONFIG_NETFILTER_XT_CONNMARK=3Dm
> CONFIG_NETFILTER_XT_SET=3Dm
> =

> #
> # Xtables targets
> #
> CONFIG_NETFILTER_XT_TARGET_AUDIT=3Dm
> CONFIG_NETFILTER_XT_TARGET_CHECKSUM=3Dm
> CONFIG_NETFILTER_XT_TARGET_CLASSIFY=3Dm
> CONFIG_NETFILTER_XT_TARGET_CONNMARK=3Dm
> CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=3Dm
> CONFIG_NETFILTER_XT_TARGET_CT=3Dm
> CONFIG_NETFILTER_XT_TARGET_DSCP=3Dm
> CONFIG_NETFILTER_XT_TARGET_HL=3Dm
> CONFIG_NETFILTER_XT_TARGET_HMARK=3Dm
> CONFIG_NETFILTER_XT_TARGET_IDLETIMER=3Dm
> # CONFIG_NETFILTER_XT_TARGET_LED is not set
> CONFIG_NETFILTER_XT_TARGET_LOG=3Dm
> CONFIG_NETFILTER_XT_TARGET_MARK=3Dm
> CONFIG_NETFILTER_XT_NAT=3Dm
> CONFIG_NETFILTER_XT_TARGET_NETMAP=3Dm
> CONFIG_NETFILTER_XT_TARGET_NFLOG=3Dm
> CONFIG_NETFILTER_XT_TARGET_NFQUEUE=3Dm
> CONFIG_NETFILTER_XT_TARGET_NOTRACK=3Dm
> CONFIG_NETFILTER_XT_TARGET_RATEEST=3Dm
> CONFIG_NETFILTER_XT_TARGET_REDIRECT=3Dm
> CONFIG_NETFILTER_XT_TARGET_MASQUERADE=3Dm
> CONFIG_NETFILTER_XT_TARGET_TEE=3Dm
> CONFIG_NETFILTER_XT_TARGET_TPROXY=3Dm
> CONFIG_NETFILTER_XT_TARGET_TRACE=3Dm
> CONFIG_NETFILTER_XT_TARGET_SECMARK=3Dm
> CONFIG_NETFILTER_XT_TARGET_TCPMSS=3Dm
> CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=3Dm
> =

> #
> # Xtables matches
> #
> CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=3Dm
> CONFIG_NETFILTER_XT_MATCH_BPF=3Dm
> CONFIG_NETFILTER_XT_MATCH_CGROUP=3Dm
> CONFIG_NETFILTER_XT_MATCH_CLUSTER=3Dm
> CONFIG_NETFILTER_XT_MATCH_COMMENT=3Dm
> CONFIG_NETFILTER_XT_MATCH_CONNBYTES=3Dm
> CONFIG_NETFILTER_XT_MATCH_CONNLABEL=3Dm
> CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=3Dm
> CONFIG_NETFILTER_XT_MATCH_CONNMARK=3Dm
> CONFIG_NETFILTER_XT_MATCH_CONNTRACK=3Dm
> CONFIG_NETFILTER_XT_MATCH_CPU=3Dm
> CONFIG_NETFILTER_XT_MATCH_DCCP=3Dm
> CONFIG_NETFILTER_XT_MATCH_DEVGROUP=3Dm
> CONFIG_NETFILTER_XT_MATCH_DSCP=3Dm
> CONFIG_NETFILTER_XT_MATCH_ECN=3Dm
> CONFIG_NETFILTER_XT_MATCH_ESP=3Dm
> CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=3Dm
> CONFIG_NETFILTER_XT_MATCH_HELPER=3Dm
> CONFIG_NETFILTER_XT_MATCH_HL=3Dm
> # CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set
> CONFIG_NETFILTER_XT_MATCH_IPRANGE=3Dm
> CONFIG_NETFILTER_XT_MATCH_IPVS=3Dm
> # CONFIG_NETFILTER_XT_MATCH_L2TP is not set
> CONFIG_NETFILTER_XT_MATCH_LENGTH=3Dm
> CONFIG_NETFILTER_XT_MATCH_LIMIT=3Dm
> CONFIG_NETFILTER_XT_MATCH_MAC=3Dm
> CONFIG_NETFILTER_XT_MATCH_MARK=3Dm
> CONFIG_NETFILTER_XT_MATCH_MULTIPORT=3Dm
> # CONFIG_NETFILTER_XT_MATCH_NFACCT is not set
> CONFIG_NETFILTER_XT_MATCH_OSF=3Dm
> CONFIG_NETFILTER_XT_MATCH_OWNER=3Dm
> CONFIG_NETFILTER_XT_MATCH_POLICY=3Dm
> CONFIG_NETFILTER_XT_MATCH_PHYSDEV=3Dm
> CONFIG_NETFILTER_XT_MATCH_PKTTYPE=3Dm
> CONFIG_NETFILTER_XT_MATCH_QUOTA=3Dm
> CONFIG_NETFILTER_XT_MATCH_RATEEST=3Dm
> CONFIG_NETFILTER_XT_MATCH_REALM=3Dm
> CONFIG_NETFILTER_XT_MATCH_RECENT=3Dm
> CONFIG_NETFILTER_XT_MATCH_SCTP=3Dm
> CONFIG_NETFILTER_XT_MATCH_SOCKET=3Dm
> CONFIG_NETFILTER_XT_MATCH_STATE=3Dm
> CONFIG_NETFILTER_XT_MATCH_STATISTIC=3Dm
> CONFIG_NETFILTER_XT_MATCH_STRING=3Dm
> CONFIG_NETFILTER_XT_MATCH_TCPMSS=3Dm
> # CONFIG_NETFILTER_XT_MATCH_TIME is not set
> # CONFIG_NETFILTER_XT_MATCH_U32 is not set
> # end of Core Netfilter Configuration
> =

> CONFIG_IP_SET=3Dm
> CONFIG_IP_SET_MAX=3D256
> CONFIG_IP_SET_BITMAP_IP=3Dm
> CONFIG_IP_SET_BITMAP_IPMAC=3Dm
> CONFIG_IP_SET_BITMAP_PORT=3Dm
> CONFIG_IP_SET_HASH_IP=3Dm
> CONFIG_IP_SET_HASH_IPMARK=3Dm
> CONFIG_IP_SET_HASH_IPPORT=3Dm
> CONFIG_IP_SET_HASH_IPPORTIP=3Dm
> CONFIG_IP_SET_HASH_IPPORTNET=3Dm
> CONFIG_IP_SET_HASH_IPMAC=3Dm
> CONFIG_IP_SET_HASH_MAC=3Dm
> CONFIG_IP_SET_HASH_NETPORTNET=3Dm
> CONFIG_IP_SET_HASH_NET=3Dm
> CONFIG_IP_SET_HASH_NETNET=3Dm
> CONFIG_IP_SET_HASH_NETPORT=3Dm
> CONFIG_IP_SET_HASH_NETIFACE=3Dm
> CONFIG_IP_SET_LIST_SET=3Dm
> CONFIG_IP_VS=3Dm
> CONFIG_IP_VS_IPV6=3Dy
> # CONFIG_IP_VS_DEBUG is not set
> CONFIG_IP_VS_TAB_BITS=3D12
> =

> #
> # IPVS transport protocol load balancing support
> #
> CONFIG_IP_VS_PROTO_TCP=3Dy
> CONFIG_IP_VS_PROTO_UDP=3Dy
> CONFIG_IP_VS_PROTO_AH_ESP=3Dy
> CONFIG_IP_VS_PROTO_ESP=3Dy
> CONFIG_IP_VS_PROTO_AH=3Dy
> CONFIG_IP_VS_PROTO_SCTP=3Dy
> =

> #
> # IPVS scheduler
> #
> CONFIG_IP_VS_RR=3Dm
> CONFIG_IP_VS_WRR=3Dm
> CONFIG_IP_VS_LC=3Dm
> CONFIG_IP_VS_WLC=3Dm
> CONFIG_IP_VS_FO=3Dm
> CONFIG_IP_VS_OVF=3Dm
> CONFIG_IP_VS_LBLC=3Dm
> CONFIG_IP_VS_LBLCR=3Dm
> CONFIG_IP_VS_DH=3Dm
> CONFIG_IP_VS_SH=3Dm
> # CONFIG_IP_VS_MH is not set
> CONFIG_IP_VS_SED=3Dm
> CONFIG_IP_VS_NQ=3Dm
> # CONFIG_IP_VS_TWOS is not set
> =

> #
> # IPVS SH scheduler
> #
> CONFIG_IP_VS_SH_TAB_BITS=3D8
> =

> #
> # IPVS MH scheduler
> #
> CONFIG_IP_VS_MH_TAB_INDEX=3D12
> =

> #
> # IPVS application helper
> #
> CONFIG_IP_VS_FTP=3Dm
> CONFIG_IP_VS_NFCT=3Dy
> CONFIG_IP_VS_PE_SIP=3Dm
> =

> #
> # IP: Netfilter Configuration
> #
> CONFIG_NF_DEFRAG_IPV4=3Dm
> CONFIG_NF_SOCKET_IPV4=3Dm
> CONFIG_NF_TPROXY_IPV4=3Dm
> CONFIG_NF_TABLES_IPV4=3Dy
> CONFIG_NFT_REJECT_IPV4=3Dm
> CONFIG_NFT_DUP_IPV4=3Dm
> CONFIG_NFT_FIB_IPV4=3Dm
> CONFIG_NF_TABLES_ARP=3Dy
> CONFIG_NF_DUP_IPV4=3Dm
> CONFIG_NF_LOG_ARP=3Dm
> CONFIG_NF_LOG_IPV4=3Dm
> CONFIG_NF_REJECT_IPV4=3Dm
> CONFIG_NF_NAT_SNMP_BASIC=3Dm
> CONFIG_NF_NAT_PPTP=3Dm
> CONFIG_NF_NAT_H323=3Dm
> CONFIG_IP_NF_IPTABLES=3Dm
> CONFIG_IP_NF_MATCH_AH=3Dm
> CONFIG_IP_NF_MATCH_ECN=3Dm
> CONFIG_IP_NF_MATCH_RPFILTER=3Dm
> CONFIG_IP_NF_MATCH_TTL=3Dm
> CONFIG_IP_NF_FILTER=3Dm
> CONFIG_IP_NF_TARGET_REJECT=3Dm
> CONFIG_IP_NF_TARGET_SYNPROXY=3Dm
> CONFIG_IP_NF_NAT=3Dm
> CONFIG_IP_NF_TARGET_MASQUERADE=3Dm
> CONFIG_IP_NF_TARGET_NETMAP=3Dm
> CONFIG_IP_NF_TARGET_REDIRECT=3Dm
> CONFIG_IP_NF_MANGLE=3Dm
> # CONFIG_IP_NF_TARGET_CLUSTERIP is not set
> CONFIG_IP_NF_TARGET_ECN=3Dm
> CONFIG_IP_NF_TARGET_TTL=3Dm
> CONFIG_IP_NF_RAW=3Dm
> CONFIG_IP_NF_SECURITY=3Dm
> CONFIG_IP_NF_ARPTABLES=3Dm
> CONFIG_IP_NF_ARPFILTER=3Dm
> CONFIG_IP_NF_ARP_MANGLE=3Dm
> # end of IP: Netfilter Configuration
> =

> #
> # IPv6: Netfilter Configuration
> #
> CONFIG_NF_SOCKET_IPV6=3Dm
> CONFIG_NF_TPROXY_IPV6=3Dm
> CONFIG_NF_TABLES_IPV6=3Dy
> CONFIG_NFT_REJECT_IPV6=3Dm
> CONFIG_NFT_DUP_IPV6=3Dm
> CONFIG_NFT_FIB_IPV6=3Dm
> CONFIG_NF_DUP_IPV6=3Dm
> CONFIG_NF_REJECT_IPV6=3Dm
> CONFIG_NF_LOG_IPV6=3Dm
> CONFIG_IP6_NF_IPTABLES=3Dm
> CONFIG_IP6_NF_MATCH_AH=3Dm
> CONFIG_IP6_NF_MATCH_EUI64=3Dm
> CONFIG_IP6_NF_MATCH_FRAG=3Dm
> CONFIG_IP6_NF_MATCH_OPTS=3Dm
> CONFIG_IP6_NF_MATCH_HL=3Dm
> CONFIG_IP6_NF_MATCH_IPV6HEADER=3Dm
> CONFIG_IP6_NF_MATCH_MH=3Dm
> CONFIG_IP6_NF_MATCH_RPFILTER=3Dm
> CONFIG_IP6_NF_MATCH_RT=3Dm
> # CONFIG_IP6_NF_MATCH_SRH is not set
> # CONFIG_IP6_NF_TARGET_HL is not set
> CONFIG_IP6_NF_FILTER=3Dm
> CONFIG_IP6_NF_TARGET_REJECT=3Dm
> CONFIG_IP6_NF_TARGET_SYNPROXY=3Dm
> CONFIG_IP6_NF_MANGLE=3Dm
> CONFIG_IP6_NF_RAW=3Dm
> CONFIG_IP6_NF_SECURITY=3Dm
> CONFIG_IP6_NF_NAT=3Dm
> CONFIG_IP6_NF_TARGET_MASQUERADE=3Dm
> CONFIG_IP6_NF_TARGET_NPT=3Dm
> # end of IPv6: Netfilter Configuration
> =

> CONFIG_NF_DEFRAG_IPV6=3Dm
> CONFIG_NF_TABLES_BRIDGE=3Dm
> # CONFIG_NFT_BRIDGE_META is not set
> CONFIG_NFT_BRIDGE_REJECT=3Dm
> # CONFIG_NF_CONNTRACK_BRIDGE is not set
> CONFIG_BRIDGE_NF_EBTABLES=3Dm
> CONFIG_BRIDGE_EBT_BROUTE=3Dm
> CONFIG_BRIDGE_EBT_T_FILTER=3Dm
> CONFIG_BRIDGE_EBT_T_NAT=3Dm
> CONFIG_BRIDGE_EBT_802_3=3Dm
> CONFIG_BRIDGE_EBT_AMONG=3Dm
> CONFIG_BRIDGE_EBT_ARP=3Dm
> CONFIG_BRIDGE_EBT_IP=3Dm
> CONFIG_BRIDGE_EBT_IP6=3Dm
> CONFIG_BRIDGE_EBT_LIMIT=3Dm
> CONFIG_BRIDGE_EBT_MARK=3Dm
> CONFIG_BRIDGE_EBT_PKTTYPE=3Dm
> CONFIG_BRIDGE_EBT_STP=3Dm
> CONFIG_BRIDGE_EBT_VLAN=3Dm
> CONFIG_BRIDGE_EBT_ARPREPLY=3Dm
> CONFIG_BRIDGE_EBT_DNAT=3Dm
> CONFIG_BRIDGE_EBT_MARK_T=3Dm
> CONFIG_BRIDGE_EBT_REDIRECT=3Dm
> CONFIG_BRIDGE_EBT_SNAT=3Dm
> CONFIG_BRIDGE_EBT_LOG=3Dm
> CONFIG_BRIDGE_EBT_NFLOG=3Dm
> # CONFIG_BPFILTER is not set
> CONFIG_IP_DCCP=3Dy
> CONFIG_INET_DCCP_DIAG=3Dm
> =

> #
> # DCCP CCIDs Configuration
> #
> # CONFIG_IP_DCCP_CCID2_DEBUG is not set
> CONFIG_IP_DCCP_CCID3=3Dy
> # CONFIG_IP_DCCP_CCID3_DEBUG is not set
> CONFIG_IP_DCCP_TFRC_LIB=3Dy
> # end of DCCP CCIDs Configuration
> =

> #
> # DCCP Kernel Hacking
> #
> # CONFIG_IP_DCCP_DEBUG is not set
> # end of DCCP Kernel Hacking
> =

> CONFIG_IP_SCTP=3Dm
> # CONFIG_SCTP_DBG_OBJCNT is not set
> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
> CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=3Dy
> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
> CONFIG_SCTP_COOKIE_HMAC_MD5=3Dy
> CONFIG_SCTP_COOKIE_HMAC_SHA1=3Dy
> CONFIG_INET_SCTP_DIAG=3Dm
> # CONFIG_RDS is not set
> CONFIG_TIPC=3Dm
> CONFIG_TIPC_MEDIA_UDP=3Dy
> CONFIG_TIPC_CRYPTO=3Dy
> CONFIG_TIPC_DIAG=3Dm
> CONFIG_ATM=3Dm
> CONFIG_ATM_CLIP=3Dm
> # CONFIG_ATM_CLIP_NO_ICMP is not set
> CONFIG_ATM_LANE=3Dm
> # CONFIG_ATM_MPOA is not set
> CONFIG_ATM_BR2684=3Dm
> # CONFIG_ATM_BR2684_IPFILTER is not set
> CONFIG_L2TP=3Dm
> CONFIG_L2TP_DEBUGFS=3Dm
> CONFIG_L2TP_V3=3Dy
> CONFIG_L2TP_IP=3Dm
> CONFIG_L2TP_ETH=3Dm
> CONFIG_STP=3Dm
> CONFIG_GARP=3Dm
> CONFIG_MRP=3Dm
> CONFIG_BRIDGE=3Dm
> CONFIG_BRIDGE_IGMP_SNOOPING=3Dy
> CONFIG_BRIDGE_VLAN_FILTERING=3Dy
> # CONFIG_BRIDGE_MRP is not set
> # CONFIG_BRIDGE_CFM is not set
> # CONFIG_NET_DSA is not set
> CONFIG_VLAN_8021Q=3Dm
> CONFIG_VLAN_8021Q_GVRP=3Dy
> CONFIG_VLAN_8021Q_MVRP=3Dy
> # CONFIG_DECNET is not set
> CONFIG_LLC=3Dm
> # CONFIG_LLC2 is not set
> # CONFIG_ATALK is not set
> # CONFIG_X25 is not set
> # CONFIG_LAPB is not set
> # CONFIG_PHONET is not set
> CONFIG_6LOWPAN=3Dm
> # CONFIG_6LOWPAN_DEBUGFS is not set
> # CONFIG_6LOWPAN_NHC is not set
> CONFIG_IEEE802154=3Dm
> # CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
> CONFIG_IEEE802154_SOCKET=3Dm
> CONFIG_IEEE802154_6LOWPAN=3Dm
> CONFIG_MAC802154=3Dm
> CONFIG_NET_SCHED=3Dy
> =

> #
> # Queueing/Scheduling
> #
> CONFIG_NET_SCH_CBQ=3Dm
> CONFIG_NET_SCH_HTB=3Dm
> CONFIG_NET_SCH_HFSC=3Dm
> CONFIG_NET_SCH_ATM=3Dm
> CONFIG_NET_SCH_PRIO=3Dm
> CONFIG_NET_SCH_MULTIQ=3Dm
> CONFIG_NET_SCH_RED=3Dm
> CONFIG_NET_SCH_SFB=3Dm
> CONFIG_NET_SCH_SFQ=3Dm
> CONFIG_NET_SCH_TEQL=3Dm
> CONFIG_NET_SCH_TBF=3Dm
> # CONFIG_NET_SCH_CBS is not set
> # CONFIG_NET_SCH_ETF is not set
> # CONFIG_NET_SCH_TAPRIO is not set
> CONFIG_NET_SCH_GRED=3Dm
> CONFIG_NET_SCH_DSMARK=3Dm
> CONFIG_NET_SCH_NETEM=3Dm
> CONFIG_NET_SCH_DRR=3Dm
> CONFIG_NET_SCH_MQPRIO=3Dm
> # CONFIG_NET_SCH_SKBPRIO is not set
> CONFIG_NET_SCH_CHOKE=3Dm
> CONFIG_NET_SCH_QFQ=3Dm
> CONFIG_NET_SCH_CODEL=3Dm
> CONFIG_NET_SCH_FQ_CODEL=3Dy
> # CONFIG_NET_SCH_CAKE is not set
> CONFIG_NET_SCH_FQ=3Dm
> CONFIG_NET_SCH_HHF=3Dm
> CONFIG_NET_SCH_PIE=3Dm
> # CONFIG_NET_SCH_FQ_PIE is not set
> CONFIG_NET_SCH_INGRESS=3Dm
> CONFIG_NET_SCH_PLUG=3Dm
> # CONFIG_NET_SCH_ETS is not set
> CONFIG_NET_SCH_DEFAULT=3Dy
> # CONFIG_DEFAULT_FQ is not set
> # CONFIG_DEFAULT_CODEL is not set
> CONFIG_DEFAULT_FQ_CODEL=3Dy
> # CONFIG_DEFAULT_SFQ is not set
> # CONFIG_DEFAULT_PFIFO_FAST is not set
> CONFIG_DEFAULT_NET_SCH=3D"fq_codel"
> =

> #
> # Classification
> #
> CONFIG_NET_CLS=3Dy
> CONFIG_NET_CLS_BASIC=3Dm
> CONFIG_NET_CLS_TCINDEX=3Dm
> CONFIG_NET_CLS_ROUTE4=3Dm
> CONFIG_NET_CLS_FW=3Dm
> CONFIG_NET_CLS_U32=3Dm
> CONFIG_CLS_U32_PERF=3Dy
> CONFIG_CLS_U32_MARK=3Dy
> CONFIG_NET_CLS_RSVP=3Dm
> CONFIG_NET_CLS_RSVP6=3Dm
> CONFIG_NET_CLS_FLOW=3Dm
> CONFIG_NET_CLS_CGROUP=3Dy
> CONFIG_NET_CLS_BPF=3Dm
> CONFIG_NET_CLS_FLOWER=3Dm
> CONFIG_NET_CLS_MATCHALL=3Dm
> CONFIG_NET_EMATCH=3Dy
> CONFIG_NET_EMATCH_STACK=3D32
> CONFIG_NET_EMATCH_CMP=3Dm
> CONFIG_NET_EMATCH_NBYTE=3Dm
> CONFIG_NET_EMATCH_U32=3Dm
> CONFIG_NET_EMATCH_META=3Dm
> CONFIG_NET_EMATCH_TEXT=3Dm
> # CONFIG_NET_EMATCH_CANID is not set
> CONFIG_NET_EMATCH_IPSET=3Dm
> # CONFIG_NET_EMATCH_IPT is not set
> CONFIG_NET_CLS_ACT=3Dy
> CONFIG_NET_ACT_POLICE=3Dm
> CONFIG_NET_ACT_GACT=3Dm
> CONFIG_GACT_PROB=3Dy
> CONFIG_NET_ACT_MIRRED=3Dm
> CONFIG_NET_ACT_SAMPLE=3Dm
> # CONFIG_NET_ACT_IPT is not set
> CONFIG_NET_ACT_NAT=3Dm
> CONFIG_NET_ACT_PEDIT=3Dm
> CONFIG_NET_ACT_SIMP=3Dm
> CONFIG_NET_ACT_SKBEDIT=3Dm
> CONFIG_NET_ACT_CSUM=3Dm
> # CONFIG_NET_ACT_MPLS is not set
> CONFIG_NET_ACT_VLAN=3Dm
> CONFIG_NET_ACT_BPF=3Dm
> # CONFIG_NET_ACT_CONNMARK is not set
> # CONFIG_NET_ACT_CTINFO is not set
> CONFIG_NET_ACT_SKBMOD=3Dm
> # CONFIG_NET_ACT_IFE is not set
> CONFIG_NET_ACT_TUNNEL_KEY=3Dm
> # CONFIG_NET_ACT_GATE is not set
> # CONFIG_NET_TC_SKB_EXT is not set
> CONFIG_NET_SCH_FIFO=3Dy
> CONFIG_DCB=3Dy
> CONFIG_DNS_RESOLVER=3Dm
> # CONFIG_BATMAN_ADV is not set
> CONFIG_OPENVSWITCH=3Dm
> CONFIG_OPENVSWITCH_GRE=3Dm
> CONFIG_VSOCKETS=3Dm
> CONFIG_VSOCKETS_DIAG=3Dm
> CONFIG_VSOCKETS_LOOPBACK=3Dm
> CONFIG_VMWARE_VMCI_VSOCKETS=3Dm
> CONFIG_VIRTIO_VSOCKETS=3Dm
> CONFIG_VIRTIO_VSOCKETS_COMMON=3Dm
> CONFIG_HYPERV_VSOCKETS=3Dm
> CONFIG_NETLINK_DIAG=3Dm
> CONFIG_MPLS=3Dy
> CONFIG_NET_MPLS_GSO=3Dy
> CONFIG_MPLS_ROUTING=3Dm
> CONFIG_MPLS_IPTUNNEL=3Dm
> CONFIG_NET_NSH=3Dy
> # CONFIG_HSR is not set
> CONFIG_NET_SWITCHDEV=3Dy
> CONFIG_NET_L3_MASTER_DEV=3Dy
> # CONFIG_QRTR is not set
> # CONFIG_NET_NCSI is not set
> CONFIG_PCPU_DEV_REFCNT=3Dy
> CONFIG_RPS=3Dy
> CONFIG_RFS_ACCEL=3Dy
> CONFIG_SOCK_RX_QUEUE_MAPPING=3Dy
> CONFIG_XPS=3Dy
> CONFIG_CGROUP_NET_PRIO=3Dy
> CONFIG_CGROUP_NET_CLASSID=3Dy
> CONFIG_NET_RX_BUSY_POLL=3Dy
> CONFIG_BQL=3Dy
> CONFIG_BPF_STREAM_PARSER=3Dy
> CONFIG_NET_FLOW_LIMIT=3Dy
> =

> #
> # Network testing
> #
> CONFIG_NET_PKTGEN=3Dm
> CONFIG_NET_DROP_MONITOR=3Dy
> # end of Network testing
> # end of Networking options
> =

> # CONFIG_HAMRADIO is not set
> CONFIG_CAN=3Dm
> CONFIG_CAN_RAW=3Dm
> CONFIG_CAN_BCM=3Dm
> CONFIG_CAN_GW=3Dm
> # CONFIG_CAN_J1939 is not set
> # CONFIG_CAN_ISOTP is not set
> =

> #
> # CAN Device Drivers
> #
> CONFIG_CAN_VCAN=3Dm
> # CONFIG_CAN_VXCAN is not set
> CONFIG_CAN_SLCAN=3Dm
> CONFIG_CAN_DEV=3Dm
> CONFIG_CAN_CALC_BITTIMING=3Dy
> # CONFIG_CAN_KVASER_PCIEFD is not set
> CONFIG_CAN_C_CAN=3Dm
> CONFIG_CAN_C_CAN_PLATFORM=3Dm
> CONFIG_CAN_C_CAN_PCI=3Dm
> CONFIG_CAN_CC770=3Dm
> # CONFIG_CAN_CC770_ISA is not set
> CONFIG_CAN_CC770_PLATFORM=3Dm
> # CONFIG_CAN_IFI_CANFD is not set
> # CONFIG_CAN_M_CAN is not set
> # CONFIG_CAN_PEAK_PCIEFD is not set
> CONFIG_CAN_SJA1000=3Dm
> CONFIG_CAN_EMS_PCI=3Dm
> # CONFIG_CAN_F81601 is not set
> CONFIG_CAN_KVASER_PCI=3Dm
> CONFIG_CAN_PEAK_PCI=3Dm
> CONFIG_CAN_PEAK_PCIEC=3Dy
> CONFIG_CAN_PLX_PCI=3Dm
> # CONFIG_CAN_SJA1000_ISA is not set
> CONFIG_CAN_SJA1000_PLATFORM=3Dm
> CONFIG_CAN_SOFTING=3Dm
> =

> #
> # CAN SPI interfaces
> #
> # CONFIG_CAN_HI311X is not set
> # CONFIG_CAN_MCP251X is not set
> # CONFIG_CAN_MCP251XFD is not set
> # end of CAN SPI interfaces
> =

> #
> # CAN USB interfaces
> #
> # CONFIG_CAN_8DEV_USB is not set
> # CONFIG_CAN_EMS_USB is not set
> # CONFIG_CAN_ESD_USB2 is not set
> # CONFIG_CAN_ETAS_ES58X is not set
> # CONFIG_CAN_GS_USB is not set
> # CONFIG_CAN_KVASER_USB is not set
> # CONFIG_CAN_MCBA_USB is not set
> # CONFIG_CAN_PEAK_USB is not set
> # CONFIG_CAN_UCAN is not set
> # end of CAN USB interfaces
> =

> # CONFIG_CAN_DEBUG_DEVICES is not set
> # end of CAN Device Drivers
> =

> CONFIG_BT=3Dm
> CONFIG_BT_BREDR=3Dy
> CONFIG_BT_RFCOMM=3Dm
> CONFIG_BT_RFCOMM_TTY=3Dy
> CONFIG_BT_BNEP=3Dm
> CONFIG_BT_BNEP_MC_FILTER=3Dy
> CONFIG_BT_BNEP_PROTO_FILTER=3Dy
> CONFIG_BT_HIDP=3Dm
> CONFIG_BT_HS=3Dy
> CONFIG_BT_LE=3Dy
> # CONFIG_BT_6LOWPAN is not set
> # CONFIG_BT_LEDS is not set
> # CONFIG_BT_MSFTEXT is not set
> # CONFIG_BT_AOSPEXT is not set
> CONFIG_BT_DEBUGFS=3Dy
> # CONFIG_BT_SELFTEST is not set
> =

> #
> # Bluetooth device drivers
> #
> # CONFIG_BT_HCIBTUSB is not set
> # CONFIG_BT_HCIBTSDIO is not set
> CONFIG_BT_HCIUART=3Dm
> CONFIG_BT_HCIUART_H4=3Dy
> CONFIG_BT_HCIUART_BCSP=3Dy
> CONFIG_BT_HCIUART_ATH3K=3Dy
> # CONFIG_BT_HCIUART_INTEL is not set
> # CONFIG_BT_HCIUART_AG6XX is not set
> # CONFIG_BT_HCIBCM203X is not set
> # CONFIG_BT_HCIBPA10X is not set
> # CONFIG_BT_HCIBFUSB is not set
> CONFIG_BT_HCIVHCI=3Dm
> CONFIG_BT_MRVL=3Dm
> # CONFIG_BT_MRVL_SDIO is not set
> # CONFIG_BT_MTKSDIO is not set
> # CONFIG_BT_VIRTIO is not set
> # end of Bluetooth device drivers
> =

> # CONFIG_AF_RXRPC is not set
> # CONFIG_AF_KCM is not set
> CONFIG_STREAM_PARSER=3Dy
> # CONFIG_MCTP is not set
> CONFIG_FIB_RULES=3Dy
> CONFIG_WIRELESS=3Dy
> CONFIG_CFG80211=3Dm
> # CONFIG_NL80211_TESTMODE is not set
> # CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
> CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=3Dy
> CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=3Dy
> CONFIG_CFG80211_DEFAULT_PS=3Dy
> # CONFIG_CFG80211_DEBUGFS is not set
> CONFIG_CFG80211_CRDA_SUPPORT=3Dy
> # CONFIG_CFG80211_WEXT is not set
> CONFIG_MAC80211=3Dm
> CONFIG_MAC80211_HAS_RC=3Dy
> CONFIG_MAC80211_RC_MINSTREL=3Dy
> CONFIG_MAC80211_RC_DEFAULT_MINSTREL=3Dy
> CONFIG_MAC80211_RC_DEFAULT=3D"minstrel_ht"
> # CONFIG_MAC80211_MESH is not set
> CONFIG_MAC80211_LEDS=3Dy
> CONFIG_MAC80211_DEBUGFS=3Dy
> # CONFIG_MAC80211_MESSAGE_TRACING is not set
> # CONFIG_MAC80211_DEBUG_MENU is not set
> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> CONFIG_RFKILL=3Dm
> CONFIG_RFKILL_LEDS=3Dy
> CONFIG_RFKILL_INPUT=3Dy
> # CONFIG_RFKILL_GPIO is not set
> CONFIG_NET_9P=3Dy
> CONFIG_NET_9P_VIRTIO=3Dy
> # CONFIG_NET_9P_DEBUG is not set
> # CONFIG_CAIF is not set
> CONFIG_CEPH_LIB=3Dm
> # CONFIG_CEPH_LIB_PRETTYDEBUG is not set
> CONFIG_CEPH_LIB_USE_DNS_RESOLVER=3Dy
> # CONFIG_NFC is not set
> CONFIG_PSAMPLE=3Dm
> # CONFIG_NET_IFE is not set
> CONFIG_LWTUNNEL=3Dy
> CONFIG_LWTUNNEL_BPF=3Dy
> CONFIG_DST_CACHE=3Dy
> CONFIG_GRO_CELLS=3Dy
> CONFIG_SOCK_VALIDATE_XMIT=3Dy
> CONFIG_NET_SELFTESTS=3Dy
> CONFIG_NET_SOCK_MSG=3Dy
> CONFIG_FAILOVER=3Dm
> CONFIG_ETHTOOL_NETLINK=3Dy
> =

> #
> # Device Drivers
> #
> CONFIG_HAVE_EISA=3Dy
> # CONFIG_EISA is not set
> CONFIG_HAVE_PCI=3Dy
> CONFIG_PCI=3Dy
> CONFIG_PCI_DOMAINS=3Dy
> CONFIG_PCIEPORTBUS=3Dy
> CONFIG_HOTPLUG_PCI_PCIE=3Dy
> CONFIG_PCIEAER=3Dy
> CONFIG_PCIEAER_INJECT=3Dm
> CONFIG_PCIE_ECRC=3Dy
> CONFIG_PCIEASPM=3Dy
> CONFIG_PCIEASPM_DEFAULT=3Dy
> # CONFIG_PCIEASPM_POWERSAVE is not set
> # CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
> # CONFIG_PCIEASPM_PERFORMANCE is not set
> CONFIG_PCIE_PME=3Dy
> CONFIG_PCIE_DPC=3Dy
> # CONFIG_PCIE_PTM is not set
> # CONFIG_PCIE_EDR is not set
> CONFIG_PCI_MSI=3Dy
> CONFIG_PCI_MSI_IRQ_DOMAIN=3Dy
> CONFIG_PCI_QUIRKS=3Dy
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> CONFIG_PCI_STUB=3Dy
> CONFIG_PCI_PF_STUB=3Dm
> CONFIG_PCI_ATS=3Dy
> CONFIG_PCI_LOCKLESS_CONFIG=3Dy
> CONFIG_PCI_IOV=3Dy
> CONFIG_PCI_PRI=3Dy
> CONFIG_PCI_PASID=3Dy
> # CONFIG_PCI_P2PDMA is not set
> CONFIG_PCI_LABEL=3Dy
> CONFIG_PCI_HYPERV=3Dm
> CONFIG_HOTPLUG_PCI=3Dy
> CONFIG_HOTPLUG_PCI_ACPI=3Dy
> CONFIG_HOTPLUG_PCI_ACPI_IBM=3Dm
> # CONFIG_HOTPLUG_PCI_CPCI is not set
> CONFIG_HOTPLUG_PCI_SHPC=3Dy
> =

> #
> # PCI controller drivers
> #
> CONFIG_VMD=3Dy
> CONFIG_PCI_HYPERV_INTERFACE=3Dm
> =

> #
> # DesignWare PCI Core Support
> #
> # CONFIG_PCIE_DW_PLAT_HOST is not set
> # CONFIG_PCI_MESON is not set
> # end of DesignWare PCI Core Support
> =

> #
> # Mobiveil PCIe Core Support
> #
> # end of Mobiveil PCIe Core Support
> =

> #
> # Cadence PCIe controllers support
> #
> # end of Cadence PCIe controllers support
> # end of PCI controller drivers
> =

> #
> # PCI Endpoint
> #
> # CONFIG_PCI_ENDPOINT is not set
> # end of PCI Endpoint
> =

> #
> # PCI switch controller drivers
> #
> # CONFIG_PCI_SW_SWITCHTEC is not set
> # end of PCI switch controller drivers
> =

> # CONFIG_CXL_BUS is not set
> # CONFIG_PCCARD is not set
> # CONFIG_RAPIDIO is not set
> =

> #
> # Generic Driver Options
> #
> CONFIG_AUXILIARY_BUS=3Dy
> # CONFIG_UEVENT_HELPER is not set
> CONFIG_DEVTMPFS=3Dy
> CONFIG_DEVTMPFS_MOUNT=3Dy
> CONFIG_STANDALONE=3Dy
> CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> =

> #
> # Firmware loader
> #
> CONFIG_FW_LOADER=3Dy
> CONFIG_FW_LOADER_PAGED_BUF=3Dy
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
> # CONFIG_FW_LOADER_COMPRESS is not set
> CONFIG_FW_CACHE=3Dy
> # end of Firmware loader
> =

> CONFIG_ALLOW_DEV_COREDUMP=3Dy
> # CONFIG_DEBUG_DRIVER is not set
> # CONFIG_DEBUG_DEVRES is not set
> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> # CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dm
> CONFIG_REGMAP_SPI=3Dm
> CONFIG_DMA_SHARED_BUFFER=3Dy
> # CONFIG_DMA_FENCE_TRACE is not set
> # end of Generic Driver Options
> =

> #
> # Bus devices
> #
> # CONFIG_MHI_BUS is not set
> # end of Bus devices
> =

> CONFIG_CONNECTOR=3Dy
> CONFIG_PROC_EVENTS=3Dy
> =

> #
> # Firmware Drivers
> #
> =

> #
> # ARM System Control and Management Interface Protocol
> #
> # end of ARM System Control and Management Interface Protocol
> =

> CONFIG_EDD=3Dm
> # CONFIG_EDD_OFF is not set
> CONFIG_FIRMWARE_MEMMAP=3Dy
> CONFIG_DMIID=3Dy
> CONFIG_DMI_SYSFS=3Dy
> CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
> # CONFIG_ISCSI_IBFT is not set
> CONFIG_FW_CFG_SYSFS=3Dy
> # CONFIG_FW_CFG_SYSFS_CMDLINE is not set
> CONFIG_SYSFB=3Dy
> # CONFIG_SYSFB_SIMPLEFB is not set
> # CONFIG_GOOGLE_FIRMWARE is not set
> =

> #
> # EFI (Extensible Firmware Interface) Support
> #
> CONFIG_EFI_VARS=3Dy
> CONFIG_EFI_ESRT=3Dy
> CONFIG_EFI_VARS_PSTORE=3Dy
> CONFIG_EFI_VARS_PSTORE_DEFAULT_DISABLE=3Dy
> CONFIG_EFI_RUNTIME_MAP=3Dy
> # CONFIG_EFI_FAKE_MEMMAP is not set
> CONFIG_EFI_RUNTIME_WRAPPERS=3Dy
> CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER=3Dy
> # CONFIG_EFI_BOOTLOADER_CONTROL is not set
> # CONFIG_EFI_CAPSULE_LOADER is not set
> # CONFIG_EFI_TEST is not set
> CONFIG_APPLE_PROPERTIES=3Dy
> # CONFIG_RESET_ATTACK_MITIGATION is not set
> # CONFIG_EFI_RCI2_TABLE is not set
> # CONFIG_EFI_DISABLE_PCI_DMA is not set
> # end of EFI (Extensible Firmware Interface) Support
> =

> CONFIG_UEFI_CPER=3Dy
> CONFIG_UEFI_CPER_X86=3Dy
> CONFIG_EFI_DEV_PATH_PARSER=3Dy
> CONFIG_EFI_EARLYCON=3Dy
> CONFIG_EFI_CUSTOM_SSDT_OVERLAYS=3Dy
> =

> #
> # Tegra firmware driver
> #
> # end of Tegra firmware driver
> # end of Firmware Drivers
> =

> # CONFIG_GNSS is not set
> # CONFIG_MTD is not set
> # CONFIG_OF is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> CONFIG_PARPORT=3Dm
> CONFIG_PARPORT_PC=3Dm
> CONFIG_PARPORT_SERIAL=3Dm
> # CONFIG_PARPORT_PC_FIFO is not set
> # CONFIG_PARPORT_PC_SUPERIO is not set
> # CONFIG_PARPORT_AX88796 is not set
> CONFIG_PARPORT_1284=3Dy
> CONFIG_PNP=3Dy
> # CONFIG_PNP_DEBUG_MESSAGES is not set
> =

> #
> # Protocols
> #
> CONFIG_PNPACPI=3Dy
> CONFIG_BLK_DEV=3Dy
> CONFIG_BLK_DEV_NULL_BLK=3Dm
> # CONFIG_BLK_DEV_FD is not set
> CONFIG_CDROM=3Dm
> # CONFIG_PARIDE is not set
> # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
> # CONFIG_ZRAM is not set
> CONFIG_BLK_DEV_LOOP=3Dm
> CONFIG_BLK_DEV_LOOP_MIN_COUNT=3D0
> # CONFIG_BLK_DEV_CRYPTOLOOP is not set
> # CONFIG_BLK_DEV_DRBD is not set
> CONFIG_BLK_DEV_NBD=3Dm
> # CONFIG_BLK_DEV_SX8 is not set
> CONFIG_BLK_DEV_RAM=3Dm
> CONFIG_BLK_DEV_RAM_COUNT=3D16
> CONFIG_BLK_DEV_RAM_SIZE=3D16384
> CONFIG_CDROM_PKTCDVD=3Dm
> CONFIG_CDROM_PKTCDVD_BUFFERS=3D8
> # CONFIG_CDROM_PKTCDVD_WCACHE is not set
> # CONFIG_ATA_OVER_ETH is not set
> CONFIG_VIRTIO_BLK=3Dm
> CONFIG_BLK_DEV_RBD=3Dm
> # CONFIG_BLK_DEV_RSXX is not set
> =

> #
> # NVME Support
> #
> CONFIG_NVME_CORE=3Dm
> CONFIG_BLK_DEV_NVME=3Dm
> CONFIG_NVME_MULTIPATH=3Dy
> # CONFIG_NVME_HWMON is not set
> CONFIG_NVME_FABRICS=3Dm
> CONFIG_NVME_FC=3Dm
> # CONFIG_NVME_TCP is not set
> CONFIG_NVME_TARGET=3Dm
> # CONFIG_NVME_TARGET_PASSTHRU is not set
> CONFIG_NVME_TARGET_LOOP=3Dm
> CONFIG_NVME_TARGET_FC=3Dm
> CONFIG_NVME_TARGET_FCLOOP=3Dm
> # CONFIG_NVME_TARGET_TCP is not set
> # end of NVME Support
> =

> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=3Dm
> # CONFIG_AD525X_DPOT is not set
> # CONFIG_DUMMY_IRQ is not set
> # CONFIG_IBM_ASM is not set
> # CONFIG_PHANTOM is not set
> CONFIG_TIFM_CORE=3Dm
> CONFIG_TIFM_7XX1=3Dm
> # CONFIG_ICS932S401 is not set
> CONFIG_ENCLOSURE_SERVICES=3Dm
> CONFIG_SGI_XP=3Dm
> CONFIG_HP_ILO=3Dm
> CONFIG_SGI_GRU=3Dm
> # CONFIG_SGI_GRU_DEBUG is not set
> CONFIG_APDS9802ALS=3Dm
> CONFIG_ISL29003=3Dm
> CONFIG_ISL29020=3Dm
> CONFIG_SENSORS_TSL2550=3Dm
> CONFIG_SENSORS_BH1770=3Dm
> CONFIG_SENSORS_APDS990X=3Dm
> # CONFIG_HMC6352 is not set
> # CONFIG_DS1682 is not set
> CONFIG_VMWARE_BALLOON=3Dm
> # CONFIG_LATTICE_ECP3_CONFIG is not set
> # CONFIG_SRAM is not set
> # CONFIG_DW_XDATA_PCIE is not set
> # CONFIG_PCI_ENDPOINT_TEST is not set
> # CONFIG_XILINX_SDFEC is not set
> CONFIG_MISC_RTSX=3Dm
> # CONFIG_C2PORT is not set
> =

> #
> # EEPROM support
> #
> # CONFIG_EEPROM_AT24 is not set
> # CONFIG_EEPROM_AT25 is not set
> CONFIG_EEPROM_LEGACY=3Dm
> CONFIG_EEPROM_MAX6875=3Dm
> CONFIG_EEPROM_93CX6=3Dm
> # CONFIG_EEPROM_93XX46 is not set
> # CONFIG_EEPROM_IDT_89HPESX is not set
> # CONFIG_EEPROM_EE1004 is not set
> # end of EEPROM support
> =

> CONFIG_CB710_CORE=3Dm
> # CONFIG_CB710_DEBUG is not set
> CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
> =

> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> # end of Texas Instruments shared transport line discipline
> =

> CONFIG_SENSORS_LIS3_I2C=3Dm
> CONFIG_ALTERA_STAPL=3Dm
> CONFIG_INTEL_MEI=3Dm
> CONFIG_INTEL_MEI_ME=3Dm
> # CONFIG_INTEL_MEI_TXE is not set
> # CONFIG_INTEL_MEI_HDCP is not set
> CONFIG_VMWARE_VMCI=3Dm
> # CONFIG_GENWQE is not set
> # CONFIG_ECHO is not set
> # CONFIG_BCM_VK is not set
> # CONFIG_MISC_ALCOR_PCI is not set
> CONFIG_MISC_RTSX_PCI=3Dm
> # CONFIG_MISC_RTSX_USB is not set
> # CONFIG_HABANA_AI is not set
> # CONFIG_UACCE is not set
> CONFIG_PVPANIC=3Dy
> # CONFIG_PVPANIC_MMIO is not set
> # CONFIG_PVPANIC_PCI is not set
> # end of Misc devices
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> CONFIG_RAID_ATTRS=3Dm
> CONFIG_SCSI_COMMON=3Dy
> CONFIG_SCSI=3Dy
> CONFIG_SCSI_DMA=3Dy
> CONFIG_SCSI_NETLINK=3Dy
> CONFIG_SCSI_PROC_FS=3Dy
> =

> #
> # SCSI support type (disk, tape, CD-ROM)
> #
> CONFIG_BLK_DEV_SD=3Dm
> CONFIG_CHR_DEV_ST=3Dm
> CONFIG_BLK_DEV_SR=3Dm
> CONFIG_CHR_DEV_SG=3Dm
> CONFIG_BLK_DEV_BSG=3Dy
> CONFIG_CHR_DEV_SCH=3Dm
> CONFIG_SCSI_ENCLOSURE=3Dm
> CONFIG_SCSI_CONSTANTS=3Dy
> CONFIG_SCSI_LOGGING=3Dy
> CONFIG_SCSI_SCAN_ASYNC=3Dy
> =

> #
> # SCSI Transports
> #
> CONFIG_SCSI_SPI_ATTRS=3Dm
> CONFIG_SCSI_FC_ATTRS=3Dm
> CONFIG_SCSI_ISCSI_ATTRS=3Dm
> CONFIG_SCSI_SAS_ATTRS=3Dm
> CONFIG_SCSI_SAS_LIBSAS=3Dm
> CONFIG_SCSI_SAS_ATA=3Dy
> CONFIG_SCSI_SAS_HOST_SMP=3Dy
> CONFIG_SCSI_SRP_ATTRS=3Dm
> # end of SCSI Transports
> =

> CONFIG_SCSI_LOWLEVEL=3Dy
> # CONFIG_ISCSI_TCP is not set
> # CONFIG_ISCSI_BOOT_SYSFS is not set
> # CONFIG_SCSI_CXGB3_ISCSI is not set
> # CONFIG_SCSI_CXGB4_ISCSI is not set
> # CONFIG_SCSI_BNX2_ISCSI is not set
> # CONFIG_BE2ISCSI is not set
> # CONFIG_BLK_DEV_3W_XXXX_RAID is not set
> # CONFIG_SCSI_HPSA is not set
> # CONFIG_SCSI_3W_9XXX is not set
> # CONFIG_SCSI_3W_SAS is not set
> # CONFIG_SCSI_ACARD is not set
> # CONFIG_SCSI_AACRAID is not set
> # CONFIG_SCSI_AIC7XXX is not set
> # CONFIG_SCSI_AIC79XX is not set
> # CONFIG_SCSI_AIC94XX is not set
> # CONFIG_SCSI_MVSAS is not set
> # CONFIG_SCSI_MVUMI is not set
> # CONFIG_SCSI_DPT_I2O is not set
> # CONFIG_SCSI_ADVANSYS is not set
> # CONFIG_SCSI_ARCMSR is not set
> # CONFIG_SCSI_ESAS2R is not set
> # CONFIG_MEGARAID_NEWGEN is not set
> # CONFIG_MEGARAID_LEGACY is not set
> # CONFIG_MEGARAID_SAS is not set
> CONFIG_SCSI_MPT3SAS=3Dm
> CONFIG_SCSI_MPT2SAS_MAX_SGE=3D128
> CONFIG_SCSI_MPT3SAS_MAX_SGE=3D128
> # CONFIG_SCSI_MPT2SAS is not set
> # CONFIG_SCSI_MPI3MR is not set
> # CONFIG_SCSI_SMARTPQI is not set
> # CONFIG_SCSI_UFSHCD is not set
> # CONFIG_SCSI_HPTIOP is not set
> # CONFIG_SCSI_BUSLOGIC is not set
> # CONFIG_SCSI_MYRB is not set
> # CONFIG_SCSI_MYRS is not set
> # CONFIG_VMWARE_PVSCSI is not set
> CONFIG_HYPERV_STORAGE=3Dm
> # CONFIG_LIBFC is not set
> # CONFIG_SCSI_SNIC is not set
> # CONFIG_SCSI_DMX3191D is not set
> # CONFIG_SCSI_FDOMAIN_PCI is not set
> CONFIG_SCSI_ISCI=3Dm
> # CONFIG_SCSI_IPS is not set
> # CONFIG_SCSI_INITIO is not set
> # CONFIG_SCSI_INIA100 is not set
> # CONFIG_SCSI_PPA is not set
> # CONFIG_SCSI_IMM is not set
> # CONFIG_SCSI_STEX is not set
> # CONFIG_SCSI_SYM53C8XX_2 is not set
> # CONFIG_SCSI_IPR is not set
> # CONFIG_SCSI_QLOGIC_1280 is not set
> # CONFIG_SCSI_QLA_FC is not set
> # CONFIG_SCSI_QLA_ISCSI is not set
> # CONFIG_SCSI_LPFC is not set
> # CONFIG_SCSI_EFCT is not set
> # CONFIG_SCSI_DC395x is not set
> # CONFIG_SCSI_AM53C974 is not set
> # CONFIG_SCSI_WD719X is not set
> CONFIG_SCSI_DEBUG=3Dm
> # CONFIG_SCSI_PMCRAID is not set
> # CONFIG_SCSI_PM8001 is not set
> # CONFIG_SCSI_BFA_FC is not set
> # CONFIG_SCSI_VIRTIO is not set
> # CONFIG_SCSI_CHELSIO_FCOE is not set
> CONFIG_SCSI_DH=3Dy
> CONFIG_SCSI_DH_RDAC=3Dy
> CONFIG_SCSI_DH_HP_SW=3Dy
> CONFIG_SCSI_DH_EMC=3Dy
> CONFIG_SCSI_DH_ALUA=3Dy
> # end of SCSI device support
> =

> CONFIG_ATA=3Dm
> CONFIG_SATA_HOST=3Dy
> CONFIG_PATA_TIMINGS=3Dy
> CONFIG_ATA_VERBOSE_ERROR=3Dy
> CONFIG_ATA_FORCE=3Dy
> CONFIG_ATA_ACPI=3Dy
> # CONFIG_SATA_ZPODD is not set
> CONFIG_SATA_PMP=3Dy
> =

> #
> # Controllers with non-SFF native interface
> #
> CONFIG_SATA_AHCI=3Dm
> CONFIG_SATA_MOBILE_LPM_POLICY=3D0
> CONFIG_SATA_AHCI_PLATFORM=3Dm
> # CONFIG_SATA_INIC162X is not set
> # CONFIG_SATA_ACARD_AHCI is not set
> # CONFIG_SATA_SIL24 is not set
> CONFIG_ATA_SFF=3Dy
> =

> #
> # SFF controllers with custom DMA interface
> #
> # CONFIG_PDC_ADMA is not set
> # CONFIG_SATA_QSTOR is not set
> # CONFIG_SATA_SX4 is not set
> CONFIG_ATA_BMDMA=3Dy
> =

> #
> # SATA SFF controllers with BMDMA
> #
> CONFIG_ATA_PIIX=3Dm
> # CONFIG_SATA_DWC is not set
> # CONFIG_SATA_MV is not set
> # CONFIG_SATA_NV is not set
> # CONFIG_SATA_PROMISE is not set
> # CONFIG_SATA_SIL is not set
> # CONFIG_SATA_SIS is not set
> # CONFIG_SATA_SVW is not set
> # CONFIG_SATA_ULI is not set
> # CONFIG_SATA_VIA is not set
> # CONFIG_SATA_VITESSE is not set
> =

> #
> # PATA SFF controllers with BMDMA
> #
> # CONFIG_PATA_ALI is not set
> # CONFIG_PATA_AMD is not set
> # CONFIG_PATA_ARTOP is not set
> # CONFIG_PATA_ATIIXP is not set
> # CONFIG_PATA_ATP867X is not set
> # CONFIG_PATA_CMD64X is not set
> # CONFIG_PATA_CYPRESS is not set
> # CONFIG_PATA_EFAR is not set
> # CONFIG_PATA_HPT366 is not set
> # CONFIG_PATA_HPT37X is not set
> # CONFIG_PATA_HPT3X2N is not set
> # CONFIG_PATA_HPT3X3 is not set
> # CONFIG_PATA_IT8213 is not set
> # CONFIG_PATA_IT821X is not set
> # CONFIG_PATA_JMICRON is not set
> # CONFIG_PATA_MARVELL is not set
> # CONFIG_PATA_NETCELL is not set
> # CONFIG_PATA_NINJA32 is not set
> # CONFIG_PATA_NS87415 is not set
> # CONFIG_PATA_OLDPIIX is not set
> # CONFIG_PATA_OPTIDMA is not set
> # CONFIG_PATA_PDC2027X is not set
> # CONFIG_PATA_PDC_OLD is not set
> # CONFIG_PATA_RADISYS is not set
> # CONFIG_PATA_RDC is not set
> # CONFIG_PATA_SCH is not set
> # CONFIG_PATA_SERVERWORKS is not set
> # CONFIG_PATA_SIL680 is not set
> # CONFIG_PATA_SIS is not set
> # CONFIG_PATA_TOSHIBA is not set
> # CONFIG_PATA_TRIFLEX is not set
> # CONFIG_PATA_VIA is not set
> # CONFIG_PATA_WINBOND is not set
> =

> #
> # PIO-only SFF controllers
> #
> # CONFIG_PATA_CMD640_PCI is not set
> # CONFIG_PATA_MPIIX is not set
> # CONFIG_PATA_NS87410 is not set
> # CONFIG_PATA_OPTI is not set
> # CONFIG_PATA_RZ1000 is not set
> =

> #
> # Generic fallback / legacy drivers
> #
> # CONFIG_PATA_ACPI is not set
> CONFIG_ATA_GENERIC=3Dm
> # CONFIG_PATA_LEGACY is not set
> CONFIG_MD=3Dy
> CONFIG_BLK_DEV_MD=3Dy
> CONFIG_MD_AUTODETECT=3Dy
> CONFIG_MD_LINEAR=3Dm
> CONFIG_MD_RAID0=3Dm
> CONFIG_MD_RAID1=3Dm
> CONFIG_MD_RAID10=3Dm
> CONFIG_MD_RAID456=3Dm
> # CONFIG_MD_MULTIPATH is not set
> CONFIG_MD_FAULTY=3Dm
> CONFIG_MD_CLUSTER=3Dm
> # CONFIG_BCACHE is not set
> CONFIG_BLK_DEV_DM_BUILTIN=3Dy
> CONFIG_BLK_DEV_DM=3Dm
> CONFIG_DM_DEBUG=3Dy
> CONFIG_DM_BUFIO=3Dm
> # CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
> CONFIG_DM_BIO_PRISON=3Dm
> CONFIG_DM_PERSISTENT_DATA=3Dm
> # CONFIG_DM_UNSTRIPED is not set
> CONFIG_DM_CRYPT=3Dm
> CONFIG_DM_SNAPSHOT=3Dm
> CONFIG_DM_THIN_PROVISIONING=3Dm
> CONFIG_DM_CACHE=3Dm
> CONFIG_DM_CACHE_SMQ=3Dm
> CONFIG_DM_WRITECACHE=3Dm
> # CONFIG_DM_EBS is not set
> CONFIG_DM_ERA=3Dm
> # CONFIG_DM_CLONE is not set
> CONFIG_DM_MIRROR=3Dm
> CONFIG_DM_LOG_USERSPACE=3Dm
> CONFIG_DM_RAID=3Dm
> CONFIG_DM_ZERO=3Dm
> CONFIG_DM_MULTIPATH=3Dm
> CONFIG_DM_MULTIPATH_QL=3Dm
> CONFIG_DM_MULTIPATH_ST=3Dm
> # CONFIG_DM_MULTIPATH_HST is not set
> # CONFIG_DM_MULTIPATH_IOA is not set
> CONFIG_DM_DELAY=3Dm
> # CONFIG_DM_DUST is not set
> CONFIG_DM_UEVENT=3Dy
> CONFIG_DM_FLAKEY=3Dm
> CONFIG_DM_VERITY=3Dm
> # CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
> # CONFIG_DM_VERITY_FEC is not set
> CONFIG_DM_SWITCH=3Dm
> CONFIG_DM_LOG_WRITES=3Dm
> CONFIG_DM_INTEGRITY=3Dm
> CONFIG_TARGET_CORE=3Dm
> CONFIG_TCM_IBLOCK=3Dm
> CONFIG_TCM_FILEIO=3Dm
> CONFIG_TCM_PSCSI=3Dm
> CONFIG_TCM_USER2=3Dm
> CONFIG_LOOPBACK_TARGET=3Dm
> CONFIG_ISCSI_TARGET=3Dm
> # CONFIG_SBP_TARGET is not set
> # CONFIG_FUSION is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> CONFIG_FIREWIRE=3Dm
> CONFIG_FIREWIRE_OHCI=3Dm
> CONFIG_FIREWIRE_SBP2=3Dm
> CONFIG_FIREWIRE_NET=3Dm
> # CONFIG_FIREWIRE_NOSY is not set
> # end of IEEE 1394 (FireWire) support
> =

> CONFIG_MACINTOSH_DRIVERS=3Dy
> CONFIG_MAC_EMUMOUSEBTN=3Dy
> CONFIG_NETDEVICES=3Dy
> CONFIG_MII=3Dy
> CONFIG_NET_CORE=3Dy
> # CONFIG_BONDING is not set
> # CONFIG_DUMMY is not set
> # CONFIG_WIREGUARD is not set
> # CONFIG_EQUALIZER is not set
> # CONFIG_NET_FC is not set
> # CONFIG_IFB is not set
> # CONFIG_NET_TEAM is not set
> # CONFIG_MACVLAN is not set
> # CONFIG_IPVLAN is not set
> # CONFIG_VXLAN is not set
> # CONFIG_GENEVE is not set
> # CONFIG_BAREUDP is not set
> # CONFIG_GTP is not set
> # CONFIG_MACSEC is not set
> CONFIG_NETCONSOLE=3Dm
> CONFIG_NETCONSOLE_DYNAMIC=3Dy
> CONFIG_NETPOLL=3Dy
> CONFIG_NET_POLL_CONTROLLER=3Dy
> CONFIG_TUN=3Dm
> # CONFIG_TUN_VNET_CROSS_LE is not set
> # CONFIG_VETH is not set
> CONFIG_VIRTIO_NET=3Dm
> # CONFIG_NLMON is not set
> # CONFIG_NET_VRF is not set
> # CONFIG_VSOCKMON is not set
> # CONFIG_ARCNET is not set
> CONFIG_ATM_DRIVERS=3Dy
> # CONFIG_ATM_DUMMY is not set
> # CONFIG_ATM_TCP is not set
> # CONFIG_ATM_LANAI is not set
> # CONFIG_ATM_ENI is not set
> # CONFIG_ATM_FIRESTREAM is not set
> # CONFIG_ATM_ZATM is not set
> # CONFIG_ATM_NICSTAR is not set
> # CONFIG_ATM_IDT77252 is not set
> # CONFIG_ATM_AMBASSADOR is not set
> # CONFIG_ATM_HORIZON is not set
> # CONFIG_ATM_IA is not set
> # CONFIG_ATM_FORE200E is not set
> # CONFIG_ATM_HE is not set
> # CONFIG_ATM_SOLOS is not set
> CONFIG_ETHERNET=3Dy
> CONFIG_MDIO=3Dy
> # CONFIG_NET_VENDOR_3COM is not set
> CONFIG_NET_VENDOR_ADAPTEC=3Dy
> # CONFIG_ADAPTEC_STARFIRE is not set
> CONFIG_NET_VENDOR_AGERE=3Dy
> # CONFIG_ET131X is not set
> CONFIG_NET_VENDOR_ALACRITECH=3Dy
> # CONFIG_SLICOSS is not set
> CONFIG_NET_VENDOR_ALTEON=3Dy
> # CONFIG_ACENIC is not set
> # CONFIG_ALTERA_TSE is not set
> CONFIG_NET_VENDOR_AMAZON=3Dy
> # CONFIG_ENA_ETHERNET is not set
> CONFIG_NET_VENDOR_AMD=3Dy
> # CONFIG_AMD8111_ETH is not set
> # CONFIG_PCNET32 is not set
> # CONFIG_AMD_XGBE is not set
> CONFIG_NET_VENDOR_AQUANTIA=3Dy
> # CONFIG_AQTION is not set
> CONFIG_NET_VENDOR_ARC=3Dy
> CONFIG_NET_VENDOR_ATHEROS=3Dy
> # CONFIG_ATL2 is not set
> # CONFIG_ATL1 is not set
> # CONFIG_ATL1E is not set
> # CONFIG_ATL1C is not set
> # CONFIG_ALX is not set
> CONFIG_NET_VENDOR_BROADCOM=3Dy
> # CONFIG_B44 is not set
> # CONFIG_BCMGENET is not set
> # CONFIG_BNX2 is not set
> # CONFIG_CNIC is not set
> # CONFIG_TIGON3 is not set
> # CONFIG_BNX2X is not set
> # CONFIG_SYSTEMPORT is not set
> # CONFIG_BNXT is not set
> CONFIG_NET_VENDOR_BROCADE=3Dy
> # CONFIG_BNA is not set
> CONFIG_NET_VENDOR_CADENCE=3Dy
> # CONFIG_MACB is not set
> CONFIG_NET_VENDOR_CAVIUM=3Dy
> # CONFIG_THUNDER_NIC_PF is not set
> # CONFIG_THUNDER_NIC_VF is not set
> # CONFIG_THUNDER_NIC_BGX is not set
> # CONFIG_THUNDER_NIC_RGX is not set
> CONFIG_CAVIUM_PTP=3Dy
> # CONFIG_LIQUIDIO is not set
> # CONFIG_LIQUIDIO_VF is not set
> CONFIG_NET_VENDOR_CHELSIO=3Dy
> # CONFIG_CHELSIO_T1 is not set
> # CONFIG_CHELSIO_T3 is not set
> # CONFIG_CHELSIO_T4 is not set
> # CONFIG_CHELSIO_T4VF is not set
> CONFIG_NET_VENDOR_CISCO=3Dy
> # CONFIG_ENIC is not set
> CONFIG_NET_VENDOR_CORTINA=3Dy
> # CONFIG_CX_ECAT is not set
> # CONFIG_DNET is not set
> CONFIG_NET_VENDOR_DEC=3Dy
> # CONFIG_NET_TULIP is not set
> CONFIG_NET_VENDOR_DLINK=3Dy
> # CONFIG_DL2K is not set
> # CONFIG_SUNDANCE is not set
> CONFIG_NET_VENDOR_EMULEX=3Dy
> # CONFIG_BE2NET is not set
> CONFIG_NET_VENDOR_EZCHIP=3Dy
> CONFIG_NET_VENDOR_GOOGLE=3Dy
> # CONFIG_GVE is not set
> CONFIG_NET_VENDOR_HUAWEI=3Dy
> # CONFIG_HINIC is not set
> CONFIG_NET_VENDOR_I825XX=3Dy
> CONFIG_NET_VENDOR_INTEL=3Dy
> # CONFIG_E100 is not set
> CONFIG_E1000=3Dy
> CONFIG_E1000E=3Dy
> CONFIG_E1000E_HWTS=3Dy
> CONFIG_IGB=3Dy
> CONFIG_IGB_HWMON=3Dy
> # CONFIG_IGBVF is not set
> # CONFIG_IXGB is not set
> CONFIG_IXGBE=3Dy
> CONFIG_IXGBE_HWMON=3Dy
> # CONFIG_IXGBE_DCB is not set
> CONFIG_IXGBE_IPSEC=3Dy
> # CONFIG_IXGBEVF is not set
> CONFIG_I40E=3Dy
> # CONFIG_I40E_DCB is not set
> # CONFIG_I40EVF is not set
> # CONFIG_ICE is not set
> # CONFIG_FM10K is not set
> CONFIG_IGC=3Dy
> CONFIG_NET_VENDOR_MICROSOFT=3Dy
> # CONFIG_MICROSOFT_MANA is not set
> # CONFIG_JME is not set
> CONFIG_NET_VENDOR_LITEX=3Dy
> CONFIG_NET_VENDOR_MARVELL=3Dy
> # CONFIG_MVMDIO is not set
> # CONFIG_SKGE is not set
> # CONFIG_SKY2 is not set
> # CONFIG_PRESTERA is not set
> CONFIG_NET_VENDOR_MELLANOX=3Dy
> # CONFIG_MLX4_EN is not set
> # CONFIG_MLX5_CORE is not set
> # CONFIG_MLXSW_CORE is not set
> # CONFIG_MLXFW is not set
> CONFIG_NET_VENDOR_MICREL=3Dy
> # CONFIG_KS8842 is not set
> # CONFIG_KS8851 is not set
> # CONFIG_KS8851_MLL is not set
> # CONFIG_KSZ884X_PCI is not set
> CONFIG_NET_VENDOR_MICROCHIP=3Dy
> # CONFIG_ENC28J60 is not set
> # CONFIG_ENCX24J600 is not set
> # CONFIG_LAN743X is not set
> CONFIG_NET_VENDOR_MICROSEMI=3Dy
> CONFIG_NET_VENDOR_MYRI=3Dy
> # CONFIG_MYRI10GE is not set
> # CONFIG_FEALNX is not set
> CONFIG_NET_VENDOR_NATSEMI=3Dy
> # CONFIG_NATSEMI is not set
> # CONFIG_NS83820 is not set
> CONFIG_NET_VENDOR_NETERION=3Dy
> # CONFIG_S2IO is not set
> # CONFIG_VXGE is not set
> CONFIG_NET_VENDOR_NETRONOME=3Dy
> # CONFIG_NFP is not set
> CONFIG_NET_VENDOR_NI=3Dy
> # CONFIG_NI_XGE_MANAGEMENT_ENET is not set
> CONFIG_NET_VENDOR_8390=3Dy
> # CONFIG_NE2K_PCI is not set
> CONFIG_NET_VENDOR_NVIDIA=3Dy
> # CONFIG_FORCEDETH is not set
> CONFIG_NET_VENDOR_OKI=3Dy
> # CONFIG_ETHOC is not set
> CONFIG_NET_VENDOR_PACKET_ENGINES=3Dy
> # CONFIG_HAMACHI is not set
> # CONFIG_YELLOWFIN is not set
> CONFIG_NET_VENDOR_PENSANDO=3Dy
> # CONFIG_IONIC is not set
> CONFIG_NET_VENDOR_QLOGIC=3Dy
> # CONFIG_QLA3XXX is not set
> # CONFIG_QLCNIC is not set
> # CONFIG_NETXEN_NIC is not set
> # CONFIG_QED is not set
> CONFIG_NET_VENDOR_QUALCOMM=3Dy
> # CONFIG_QCOM_EMAC is not set
> # CONFIG_RMNET is not set
> CONFIG_NET_VENDOR_RDC=3Dy
> # CONFIG_R6040 is not set
> CONFIG_NET_VENDOR_REALTEK=3Dy
> # CONFIG_ATP is not set
> # CONFIG_8139CP is not set
> # CONFIG_8139TOO is not set
> CONFIG_R8169=3Dy
> CONFIG_NET_VENDOR_RENESAS=3Dy
> CONFIG_NET_VENDOR_ROCKER=3Dy
> # CONFIG_ROCKER is not set
> CONFIG_NET_VENDOR_SAMSUNG=3Dy
> # CONFIG_SXGBE_ETH is not set
> CONFIG_NET_VENDOR_SEEQ=3Dy
> CONFIG_NET_VENDOR_SOLARFLARE=3Dy
> # CONFIG_SFC is not set
> # CONFIG_SFC_FALCON is not set
> CONFIG_NET_VENDOR_SILAN=3Dy
> # CONFIG_SC92031 is not set
> CONFIG_NET_VENDOR_SIS=3Dy
> # CONFIG_SIS900 is not set
> # CONFIG_SIS190 is not set
> CONFIG_NET_VENDOR_SMSC=3Dy
> # CONFIG_EPIC100 is not set
> # CONFIG_SMSC911X is not set
> # CONFIG_SMSC9420 is not set
> CONFIG_NET_VENDOR_SOCIONEXT=3Dy
> CONFIG_NET_VENDOR_STMICRO=3Dy
> # CONFIG_STMMAC_ETH is not set
> CONFIG_NET_VENDOR_SUN=3Dy
> # CONFIG_HAPPYMEAL is not set
> # CONFIG_SUNGEM is not set
> # CONFIG_CASSINI is not set
> # CONFIG_NIU is not set
> CONFIG_NET_VENDOR_SYNOPSYS=3Dy
> # CONFIG_DWC_XLGMAC is not set
> CONFIG_NET_VENDOR_TEHUTI=3Dy
> # CONFIG_TEHUTI is not set
> CONFIG_NET_VENDOR_TI=3Dy
> # CONFIG_TI_CPSW_PHY_SEL is not set
> # CONFIG_TLAN is not set
> CONFIG_NET_VENDOR_VIA=3Dy
> # CONFIG_VIA_RHINE is not set
> # CONFIG_VIA_VELOCITY is not set
> CONFIG_NET_VENDOR_WIZNET=3Dy
> # CONFIG_WIZNET_W5100 is not set
> # CONFIG_WIZNET_W5300 is not set
> CONFIG_NET_VENDOR_XILINX=3Dy
> # CONFIG_XILINX_EMACLITE is not set
> # CONFIG_XILINX_AXI_EMAC is not set
> # CONFIG_XILINX_LL_TEMAC is not set
> # CONFIG_FDDI is not set
> # CONFIG_HIPPI is not set
> # CONFIG_NET_SB1000 is not set
> CONFIG_PHYLIB=3Dy
> CONFIG_SWPHY=3Dy
> # CONFIG_LED_TRIGGER_PHY is not set
> CONFIG_FIXED_PHY=3Dy
> =

> #
> # MII PHY device drivers
> #
> # CONFIG_AMD_PHY is not set
> # CONFIG_ADIN_PHY is not set
> # CONFIG_AQUANTIA_PHY is not set
> CONFIG_AX88796B_PHY=3Dy
> # CONFIG_BROADCOM_PHY is not set
> # CONFIG_BCM54140_PHY is not set
> # CONFIG_BCM7XXX_PHY is not set
> # CONFIG_BCM84881_PHY is not set
> # CONFIG_BCM87XX_PHY is not set
> # CONFIG_CICADA_PHY is not set
> # CONFIG_CORTINA_PHY is not set
> # CONFIG_DAVICOM_PHY is not set
> # CONFIG_ICPLUS_PHY is not set
> # CONFIG_LXT_PHY is not set
> # CONFIG_INTEL_XWAY_PHY is not set
> # CONFIG_LSI_ET1011C_PHY is not set
> # CONFIG_MARVELL_PHY is not set
> # CONFIG_MARVELL_10G_PHY is not set
> # CONFIG_MARVELL_88X2222_PHY is not set
> # CONFIG_MAXLINEAR_GPHY is not set
> # CONFIG_MEDIATEK_GE_PHY is not set
> # CONFIG_MICREL_PHY is not set
> # CONFIG_MICROCHIP_PHY is not set
> # CONFIG_MICROCHIP_T1_PHY is not set
> # CONFIG_MICROSEMI_PHY is not set
> # CONFIG_MOTORCOMM_PHY is not set
> # CONFIG_NATIONAL_PHY is not set
> # CONFIG_NXP_C45_TJA11XX_PHY is not set
> # CONFIG_NXP_TJA11XX_PHY is not set
> # CONFIG_QSEMI_PHY is not set
> CONFIG_REALTEK_PHY=3Dy
> # CONFIG_RENESAS_PHY is not set
> # CONFIG_ROCKCHIP_PHY is not set
> # CONFIG_SMSC_PHY is not set
> # CONFIG_STE10XP is not set
> # CONFIG_TERANETICS_PHY is not set
> # CONFIG_DP83822_PHY is not set
> # CONFIG_DP83TC811_PHY is not set
> # CONFIG_DP83848_PHY is not set
> # CONFIG_DP83867_PHY is not set
> # CONFIG_DP83869_PHY is not set
> # CONFIG_VITESSE_PHY is not set
> # CONFIG_XILINX_GMII2RGMII is not set
> # CONFIG_MICREL_KS8995MA is not set
> CONFIG_MDIO_DEVICE=3Dy
> CONFIG_MDIO_BUS=3Dy
> CONFIG_FWNODE_MDIO=3Dy
> CONFIG_ACPI_MDIO=3Dy
> CONFIG_MDIO_DEVRES=3Dy
> # CONFIG_MDIO_BITBANG is not set
> # CONFIG_MDIO_BCM_UNIMAC is not set
> # CONFIG_MDIO_MVUSB is not set
> # CONFIG_MDIO_MSCC_MIIM is not set
> # CONFIG_MDIO_THUNDER is not set
> =

> #
> # MDIO Multiplexers
> #
> =

> #
> # PCS device drivers
> #
> # CONFIG_PCS_XPCS is not set
> # end of PCS device drivers
> =

> # CONFIG_PLIP is not set
> # CONFIG_PPP is not set
> # CONFIG_SLIP is not set
> CONFIG_USB_NET_DRIVERS=3Dy
> # CONFIG_USB_CATC is not set
> # CONFIG_USB_KAWETH is not set
> # CONFIG_USB_PEGASUS is not set
> # CONFIG_USB_RTL8150 is not set
> CONFIG_USB_RTL8152=3Dy
> # CONFIG_USB_LAN78XX is not set
> CONFIG_USB_USBNET=3Dy
> CONFIG_USB_NET_AX8817X=3Dy
> CONFIG_USB_NET_AX88179_178A=3Dy
> # CONFIG_USB_NET_CDCETHER is not set
> # CONFIG_USB_NET_CDC_EEM is not set
> # CONFIG_USB_NET_CDC_NCM is not set
> # CONFIG_USB_NET_HUAWEI_CDC_NCM is not set
> # CONFIG_USB_NET_CDC_MBIM is not set
> # CONFIG_USB_NET_DM9601 is not set
> # CONFIG_USB_NET_SR9700 is not set
> # CONFIG_USB_NET_SR9800 is not set
> # CONFIG_USB_NET_SMSC75XX is not set
> # CONFIG_USB_NET_SMSC95XX is not set
> # CONFIG_USB_NET_GL620A is not set
> # CONFIG_USB_NET_NET1080 is not set
> # CONFIG_USB_NET_PLUSB is not set
> # CONFIG_USB_NET_MCS7830 is not set
> # CONFIG_USB_NET_RNDIS_HOST is not set
> # CONFIG_USB_NET_CDC_SUBSET is not set
> # CONFIG_USB_NET_ZAURUS is not set
> # CONFIG_USB_NET_CX82310_ETH is not set
> # CONFIG_USB_NET_KALMIA is not set
> # CONFIG_USB_NET_QMI_WWAN is not set
> # CONFIG_USB_HSO is not set
> # CONFIG_USB_NET_INT51X1 is not set
> # CONFIG_USB_IPHETH is not set
> # CONFIG_USB_SIERRA_NET is not set
> # CONFIG_USB_NET_CH9200 is not set
> # CONFIG_USB_NET_AQC111 is not set
> CONFIG_WLAN=3Dy
> CONFIG_WLAN_VENDOR_ADMTEK=3Dy
> # CONFIG_ADM8211 is not set
> CONFIG_WLAN_VENDOR_ATH=3Dy
> # CONFIG_ATH_DEBUG is not set
> # CONFIG_ATH5K is not set
> # CONFIG_ATH5K_PCI is not set
> # CONFIG_ATH9K is not set
> # CONFIG_ATH9K_HTC is not set
> # CONFIG_CARL9170 is not set
> # CONFIG_ATH6KL is not set
> # CONFIG_AR5523 is not set
> # CONFIG_WIL6210 is not set
> # CONFIG_ATH10K is not set
> # CONFIG_WCN36XX is not set
> # CONFIG_ATH11K is not set
> CONFIG_WLAN_VENDOR_ATMEL=3Dy
> # CONFIG_ATMEL is not set
> # CONFIG_AT76C50X_USB is not set
> CONFIG_WLAN_VENDOR_BROADCOM=3Dy
> # CONFIG_B43 is not set
> # CONFIG_B43LEGACY is not set
> # CONFIG_BRCMSMAC is not set
> # CONFIG_BRCMFMAC is not set
> CONFIG_WLAN_VENDOR_CISCO=3Dy
> # CONFIG_AIRO is not set
> CONFIG_WLAN_VENDOR_INTEL=3Dy
> # CONFIG_IPW2100 is not set
> # CONFIG_IPW2200 is not set
> # CONFIG_IWL4965 is not set
> # CONFIG_IWL3945 is not set
> # CONFIG_IWLWIFI is not set
> CONFIG_WLAN_VENDOR_INTERSIL=3Dy
> # CONFIG_HOSTAP is not set
> # CONFIG_HERMES is not set
> # CONFIG_P54_COMMON is not set
> CONFIG_WLAN_VENDOR_MARVELL=3Dy
> # CONFIG_LIBERTAS is not set
> # CONFIG_LIBERTAS_THINFIRM is not set
> # CONFIG_MWIFIEX is not set
> # CONFIG_MWL8K is not set
> # CONFIG_WLAN_VENDOR_MEDIATEK is not set
> CONFIG_WLAN_VENDOR_MICROCHIP=3Dy
> # CONFIG_WILC1000_SDIO is not set
> # CONFIG_WILC1000_SPI is not set
> CONFIG_WLAN_VENDOR_RALINK=3Dy
> # CONFIG_RT2X00 is not set
> CONFIG_WLAN_VENDOR_REALTEK=3Dy
> # CONFIG_RTL8180 is not set
> # CONFIG_RTL8187 is not set
> CONFIG_RTL_CARDS=3Dm
> # CONFIG_RTL8192CE is not set
> # CONFIG_RTL8192SE is not set
> # CONFIG_RTL8192DE is not set
> # CONFIG_RTL8723AE is not set
> # CONFIG_RTL8723BE is not set
> # CONFIG_RTL8188EE is not set
> # CONFIG_RTL8192EE is not set
> # CONFIG_RTL8821AE is not set
> # CONFIG_RTL8192CU is not set
> # CONFIG_RTL8XXXU is not set
> # CONFIG_RTW88 is not set
> CONFIG_WLAN_VENDOR_RSI=3Dy
> # CONFIG_RSI_91X is not set
> CONFIG_WLAN_VENDOR_ST=3Dy
> # CONFIG_CW1200 is not set
> CONFIG_WLAN_VENDOR_TI=3Dy
> # CONFIG_WL1251 is not set
> # CONFIG_WL12XX is not set
> # CONFIG_WL18XX is not set
> # CONFIG_WLCORE is not set
> CONFIG_WLAN_VENDOR_ZYDAS=3Dy
> # CONFIG_USB_ZD1201 is not set
> # CONFIG_ZD1211RW is not set
> CONFIG_WLAN_VENDOR_QUANTENNA=3Dy
> # CONFIG_QTNFMAC_PCIE is not set
> # CONFIG_MAC80211_HWSIM is not set
> # CONFIG_USB_NET_RNDIS_WLAN is not set
> # CONFIG_VIRT_WIFI is not set
> # CONFIG_WAN is not set
> CONFIG_IEEE802154_DRIVERS=3Dm
> # CONFIG_IEEE802154_FAKELB is not set
> # CONFIG_IEEE802154_AT86RF230 is not set
> # CONFIG_IEEE802154_MRF24J40 is not set
> # CONFIG_IEEE802154_CC2520 is not set
> # CONFIG_IEEE802154_ATUSB is not set
> # CONFIG_IEEE802154_ADF7242 is not set
> # CONFIG_IEEE802154_CA8210 is not set
> # CONFIG_IEEE802154_MCR20A is not set
> # CONFIG_IEEE802154_HWSIM is not set
> =

> #
> # Wireless WAN
> #
> # CONFIG_WWAN is not set
> # end of Wireless WAN
> =

> # CONFIG_VMXNET3 is not set
> # CONFIG_FUJITSU_ES is not set
> # CONFIG_HYPERV_NET is not set
> # CONFIG_NETDEVSIM is not set
> CONFIG_NET_FAILOVER=3Dm
> # CONFIG_ISDN is not set
> =

> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
> CONFIG_INPUT_LEDS=3Dy
> CONFIG_INPUT_FF_MEMLESS=3Dm
> CONFIG_INPUT_SPARSEKMAP=3Dm
> # CONFIG_INPUT_MATRIXKMAP is not set
> =

> #
> # Userland interfaces
> #
> CONFIG_INPUT_MOUSEDEV=3Dy
> # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> CONFIG_INPUT_JOYDEV=3Dm
> CONFIG_INPUT_EVDEV=3Dy
> # CONFIG_INPUT_EVBUG is not set
> =

> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
> # CONFIG_KEYBOARD_ADP5588 is not set
> # CONFIG_KEYBOARD_ADP5589 is not set
> # CONFIG_KEYBOARD_APPLESPI is not set
> CONFIG_KEYBOARD_ATKBD=3Dy
> # CONFIG_KEYBOARD_QT1050 is not set
> # CONFIG_KEYBOARD_QT1070 is not set
> # CONFIG_KEYBOARD_QT2160 is not set
> # CONFIG_KEYBOARD_DLINK_DIR685 is not set
> # CONFIG_KEYBOARD_LKKBD is not set
> # CONFIG_KEYBOARD_GPIO is not set
> # CONFIG_KEYBOARD_GPIO_POLLED is not set
> # CONFIG_KEYBOARD_TCA6416 is not set
> # CONFIG_KEYBOARD_TCA8418 is not set
> # CONFIG_KEYBOARD_MATRIX is not set
> # CONFIG_KEYBOARD_LM8323 is not set
> # CONFIG_KEYBOARD_LM8333 is not set
> # CONFIG_KEYBOARD_MAX7359 is not set
> # CONFIG_KEYBOARD_MCS is not set
> # CONFIG_KEYBOARD_MPR121 is not set
> # CONFIG_KEYBOARD_NEWTON is not set
> # CONFIG_KEYBOARD_OPENCORES is not set
> # CONFIG_KEYBOARD_SAMSUNG is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> CONFIG_INPUT_MOUSE=3Dy
> CONFIG_MOUSE_PS2=3Dy
> CONFIG_MOUSE_PS2_ALPS=3Dy
> CONFIG_MOUSE_PS2_BYD=3Dy
> CONFIG_MOUSE_PS2_LOGIPS2PP=3Dy
> CONFIG_MOUSE_PS2_SYNAPTICS=3Dy
> CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=3Dy
> CONFIG_MOUSE_PS2_CYPRESS=3Dy
> CONFIG_MOUSE_PS2_LIFEBOOK=3Dy
> CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
> CONFIG_MOUSE_PS2_ELANTECH=3Dy
> CONFIG_MOUSE_PS2_ELANTECH_SMBUS=3Dy
> CONFIG_MOUSE_PS2_SENTELIC=3Dy
> # CONFIG_MOUSE_PS2_TOUCHKIT is not set
> CONFIG_MOUSE_PS2_FOCALTECH=3Dy
> CONFIG_MOUSE_PS2_VMMOUSE=3Dy
> CONFIG_MOUSE_PS2_SMBUS=3Dy
> CONFIG_MOUSE_SERIAL=3Dm
> # CONFIG_MOUSE_APPLETOUCH is not set
> # CONFIG_MOUSE_BCM5974 is not set
> CONFIG_MOUSE_CYAPA=3Dm
> CONFIG_MOUSE_ELAN_I2C=3Dm
> CONFIG_MOUSE_ELAN_I2C_I2C=3Dy
> CONFIG_MOUSE_ELAN_I2C_SMBUS=3Dy
> CONFIG_MOUSE_VSXXXAA=3Dm
> # CONFIG_MOUSE_GPIO is not set
> CONFIG_MOUSE_SYNAPTICS_I2C=3Dm
> # CONFIG_MOUSE_SYNAPTICS_USB is not set
> # CONFIG_INPUT_JOYSTICK is not set
> # CONFIG_INPUT_TABLET is not set
> # CONFIG_INPUT_TOUCHSCREEN is not set
> # CONFIG_INPUT_MISC is not set
> CONFIG_RMI4_CORE=3Dm
> CONFIG_RMI4_I2C=3Dm
> CONFIG_RMI4_SPI=3Dm
> CONFIG_RMI4_SMB=3Dm
> CONFIG_RMI4_F03=3Dy
> CONFIG_RMI4_F03_SERIO=3Dm
> CONFIG_RMI4_2D_SENSOR=3Dy
> CONFIG_RMI4_F11=3Dy
> CONFIG_RMI4_F12=3Dy
> CONFIG_RMI4_F30=3Dy
> CONFIG_RMI4_F34=3Dy
> # CONFIG_RMI4_F3A is not set
> # CONFIG_RMI4_F54 is not set
> CONFIG_RMI4_F55=3Dy
> =

> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> CONFIG_SERIO_I8042=3Dy
> CONFIG_SERIO_SERPORT=3Dy
> # CONFIG_SERIO_CT82C710 is not set
> # CONFIG_SERIO_PARKBD is not set
> # CONFIG_SERIO_PCIPS2 is not set
> CONFIG_SERIO_LIBPS2=3Dy
> CONFIG_SERIO_RAW=3Dm
> CONFIG_SERIO_ALTERA_PS2=3Dm
> # CONFIG_SERIO_PS2MULT is not set
> CONFIG_SERIO_ARC_PS2=3Dm
> CONFIG_HYPERV_KEYBOARD=3Dm
> # CONFIG_SERIO_GPIO_PS2 is not set
> # CONFIG_USERIO is not set
> # CONFIG_GAMEPORT is not set
> # end of Hardware I/O ports
> # end of Input device support
> =

> #
> # Character devices
> #
> CONFIG_TTY=3Dy
> CONFIG_VT=3Dy
> CONFIG_CONSOLE_TRANSLATIONS=3Dy
> CONFIG_VT_CONSOLE=3Dy
> CONFIG_VT_CONSOLE_SLEEP=3Dy
> CONFIG_HW_CONSOLE=3Dy
> CONFIG_VT_HW_CONSOLE_BINDING=3Dy
> CONFIG_UNIX98_PTYS=3Dy
> # CONFIG_LEGACY_PTYS is not set
> CONFIG_LDISC_AUTOLOAD=3Dy
> =

> #
> # Serial drivers
> #
> CONFIG_SERIAL_EARLYCON=3Dy
> CONFIG_SERIAL_8250=3Dy
> # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
> CONFIG_SERIAL_8250_PNP=3Dy
> # CONFIG_SERIAL_8250_16550A_VARIANTS is not set
> # CONFIG_SERIAL_8250_FINTEK is not set
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> CONFIG_SERIAL_8250_DMA=3Dy
> CONFIG_SERIAL_8250_PCI=3Dy
> CONFIG_SERIAL_8250_EXAR=3Dy
> CONFIG_SERIAL_8250_NR_UARTS=3D64
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> CONFIG_SERIAL_8250_EXTENDED=3Dy
> CONFIG_SERIAL_8250_MANY_PORTS=3Dy
> CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
> # CONFIG_SERIAL_8250_DETECT_IRQ is not set
> CONFIG_SERIAL_8250_RSA=3Dy
> CONFIG_SERIAL_8250_DWLIB=3Dy
> CONFIG_SERIAL_8250_DW=3Dy
> # CONFIG_SERIAL_8250_RT288X is not set
> CONFIG_SERIAL_8250_LPSS=3Dy
> CONFIG_SERIAL_8250_MID=3Dy
> =

> #
> # Non-8250 serial port support
> #
> # CONFIG_SERIAL_MAX3100 is not set
> # CONFIG_SERIAL_MAX310X is not set
> # CONFIG_SERIAL_UARTLITE is not set
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> CONFIG_SERIAL_JSM=3Dm
> # CONFIG_SERIAL_LANTIQ is not set
> # CONFIG_SERIAL_SCCNXP is not set
> # CONFIG_SERIAL_SC16IS7XX is not set
> # CONFIG_SERIAL_BCM63XX is not set
> # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> # CONFIG_SERIAL_ALTERA_UART is not set
> CONFIG_SERIAL_ARC=3Dm
> CONFIG_SERIAL_ARC_NR_PORTS=3D1
> # CONFIG_SERIAL_RP2 is not set
> # CONFIG_SERIAL_FSL_LPUART is not set
> # CONFIG_SERIAL_FSL_LINFLEXUART is not set
> # CONFIG_SERIAL_SPRD is not set
> # end of Serial drivers
> =

> CONFIG_SERIAL_MCTRL_GPIO=3Dy
> CONFIG_SERIAL_NONSTANDARD=3Dy
> # CONFIG_MOXA_INTELLIO is not set
> # CONFIG_MOXA_SMARTIO is not set
> CONFIG_SYNCLINK_GT=3Dm
> CONFIG_N_HDLC=3Dm
> CONFIG_N_GSM=3Dm
> CONFIG_NOZOMI=3Dm
> # CONFIG_NULL_TTY is not set
> CONFIG_HVC_DRIVER=3Dy
> # CONFIG_SERIAL_DEV_BUS is not set
> CONFIG_PRINTER=3Dm
> # CONFIG_LP_CONSOLE is not set
> CONFIG_PPDEV=3Dm
> CONFIG_VIRTIO_CONSOLE=3Dm
> CONFIG_IPMI_HANDLER=3Dm
> CONFIG_IPMI_DMI_DECODE=3Dy
> CONFIG_IPMI_PLAT_DATA=3Dy
> CONFIG_IPMI_PANIC_EVENT=3Dy
> CONFIG_IPMI_PANIC_STRING=3Dy
> CONFIG_IPMI_DEVICE_INTERFACE=3Dm
> CONFIG_IPMI_SI=3Dm
> CONFIG_IPMI_SSIF=3Dm
> CONFIG_IPMI_WATCHDOG=3Dm
> CONFIG_IPMI_POWEROFF=3Dm
> CONFIG_HW_RANDOM=3Dy
> CONFIG_HW_RANDOM_TIMERIOMEM=3Dm
> CONFIG_HW_RANDOM_INTEL=3Dm
> CONFIG_HW_RANDOM_AMD=3Dm
> # CONFIG_HW_RANDOM_BA431 is not set
> CONFIG_HW_RANDOM_VIA=3Dm
> CONFIG_HW_RANDOM_VIRTIO=3Dy
> # CONFIG_HW_RANDOM_XIPHERA is not set
> # CONFIG_APPLICOM is not set
> # CONFIG_MWAVE is not set
> CONFIG_DEVMEM=3Dy
> CONFIG_NVRAM=3Dy
> CONFIG_DEVPORT=3Dy
> CONFIG_HPET=3Dy
> CONFIG_HPET_MMAP=3Dy
> # CONFIG_HPET_MMAP_DEFAULT is not set
> CONFIG_HANGCHECK_TIMER=3Dm
> CONFIG_UV_MMTIMER=3Dm
> CONFIG_TCG_TPM=3Dy
> CONFIG_HW_RANDOM_TPM=3Dy
> CONFIG_TCG_TIS_CORE=3Dy
> CONFIG_TCG_TIS=3Dy
> # CONFIG_TCG_TIS_SPI is not set
> # CONFIG_TCG_TIS_I2C_CR50 is not set
> CONFIG_TCG_TIS_I2C_ATMEL=3Dm
> CONFIG_TCG_TIS_I2C_INFINEON=3Dm
> CONFIG_TCG_TIS_I2C_NUVOTON=3Dm
> CONFIG_TCG_NSC=3Dm
> CONFIG_TCG_ATMEL=3Dm
> CONFIG_TCG_INFINEON=3Dm
> CONFIG_TCG_CRB=3Dy
> # CONFIG_TCG_VTPM_PROXY is not set
> CONFIG_TCG_TIS_ST33ZP24=3Dm
> CONFIG_TCG_TIS_ST33ZP24_I2C=3Dm
> # CONFIG_TCG_TIS_ST33ZP24_SPI is not set
> CONFIG_TELCLOCK=3Dm
> # CONFIG_XILLYBUS is not set
> # CONFIG_XILLYUSB is not set
> # CONFIG_RANDOM_TRUST_CPU is not set
> # CONFIG_RANDOM_TRUST_BOOTLOADER is not set
> # end of Character devices
> =

> #
> # I2C support
> #
> CONFIG_I2C=3Dy
> CONFIG_ACPI_I2C_OPREGION=3Dy
> CONFIG_I2C_BOARDINFO=3Dy
> CONFIG_I2C_COMPAT=3Dy
> CONFIG_I2C_CHARDEV=3Dm
> CONFIG_I2C_MUX=3Dm
> =

> #
> # Multiplexer I2C Chip support
> #
> # CONFIG_I2C_MUX_GPIO is not set
> # CONFIG_I2C_MUX_LTC4306 is not set
> # CONFIG_I2C_MUX_PCA9541 is not set
> # CONFIG_I2C_MUX_PCA954x is not set
> # CONFIG_I2C_MUX_REG is not set
> CONFIG_I2C_MUX_MLXCPLD=3Dm
> # end of Multiplexer I2C Chip support
> =

> CONFIG_I2C_HELPER_AUTO=3Dy
> CONFIG_I2C_SMBUS=3Dy
> CONFIG_I2C_ALGOBIT=3Dy
> CONFIG_I2C_ALGOPCA=3Dm
> =

> #
> # I2C Hardware Bus support
> #
> =

> #
> # PC SMBus host controller drivers
> #
> # CONFIG_I2C_ALI1535 is not set
> # CONFIG_I2C_ALI1563 is not set
> # CONFIG_I2C_ALI15X3 is not set
> CONFIG_I2C_AMD756=3Dm
> CONFIG_I2C_AMD756_S4882=3Dm
> CONFIG_I2C_AMD8111=3Dm
> # CONFIG_I2C_AMD_MP2 is not set
> CONFIG_I2C_I801=3Dy
> CONFIG_I2C_ISCH=3Dm
> CONFIG_I2C_ISMT=3Dm
> CONFIG_I2C_PIIX4=3Dm
> CONFIG_I2C_NFORCE2=3Dm
> CONFIG_I2C_NFORCE2_S4985=3Dm
> # CONFIG_I2C_NVIDIA_GPU is not set
> # CONFIG_I2C_SIS5595 is not set
> # CONFIG_I2C_SIS630 is not set
> CONFIG_I2C_SIS96X=3Dm
> CONFIG_I2C_VIA=3Dm
> CONFIG_I2C_VIAPRO=3Dm
> =

> #
> # ACPI drivers
> #
> CONFIG_I2C_SCMI=3Dm
> =

> #
> # I2C system bus drivers (mostly embedded / system-on-chip)
> #
> # CONFIG_I2C_CBUS_GPIO is not set
> CONFIG_I2C_DESIGNWARE_CORE=3Dm
> # CONFIG_I2C_DESIGNWARE_SLAVE is not set
> CONFIG_I2C_DESIGNWARE_PLATFORM=3Dm
> CONFIG_I2C_DESIGNWARE_BAYTRAIL=3Dy
> # CONFIG_I2C_DESIGNWARE_PCI is not set
> # CONFIG_I2C_EMEV2 is not set
> # CONFIG_I2C_GPIO is not set
> # CONFIG_I2C_OCORES is not set
> CONFIG_I2C_PCA_PLATFORM=3Dm
> CONFIG_I2C_SIMTEC=3Dm
> # CONFIG_I2C_XILINX is not set
> =

> #
> # External I2C/SMBus adapter drivers
> #
> # CONFIG_I2C_DIOLAN_U2C is not set
> # CONFIG_I2C_CP2615 is not set
> CONFIG_I2C_PARPORT=3Dm
> # CONFIG_I2C_ROBOTFUZZ_OSIF is not set
> # CONFIG_I2C_TAOS_EVM is not set
> # CONFIG_I2C_TINY_USB is not set
> =

> #
> # Other I2C/SMBus bus drivers
> #
> CONFIG_I2C_MLXCPLD=3Dm
> # CONFIG_I2C_VIRTIO is not set
> # end of I2C Hardware Bus support
> =

> CONFIG_I2C_STUB=3Dm
> # CONFIG_I2C_SLAVE is not set
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # end of I2C support
> =

> # CONFIG_I3C is not set
> CONFIG_SPI=3Dy
> # CONFIG_SPI_DEBUG is not set
> CONFIG_SPI_MASTER=3Dy
> # CONFIG_SPI_MEM is not set
> =

> #
> # SPI Master Controller Drivers
> #
> # CONFIG_SPI_ALTERA is not set
> # CONFIG_SPI_AXI_SPI_ENGINE is not set
> # CONFIG_SPI_BITBANG is not set
> # CONFIG_SPI_BUTTERFLY is not set
> # CONFIG_SPI_CADENCE is not set
> # CONFIG_SPI_DESIGNWARE is not set
> # CONFIG_SPI_NXP_FLEXSPI is not set
> # CONFIG_SPI_GPIO is not set
> # CONFIG_SPI_LM70_LLP is not set
> # CONFIG_SPI_LANTIQ_SSC is not set
> # CONFIG_SPI_OC_TINY is not set
> # CONFIG_SPI_PXA2XX is not set
> # CONFIG_SPI_ROCKCHIP is not set
> # CONFIG_SPI_SC18IS602 is not set
> # CONFIG_SPI_SIFIVE is not set
> # CONFIG_SPI_MXIC is not set
> # CONFIG_SPI_XCOMM is not set
> # CONFIG_SPI_XILINX is not set
> # CONFIG_SPI_ZYNQMP_GQSPI is not set
> # CONFIG_SPI_AMD is not set
> =

> #
> # SPI Multiplexer support
> #
> # CONFIG_SPI_MUX is not set
> =

> #
> # SPI Protocol Masters
> #
> # CONFIG_SPI_SPIDEV is not set
> # CONFIG_SPI_LOOPBACK_TEST is not set
> # CONFIG_SPI_TLE62X0 is not set
> # CONFIG_SPI_SLAVE is not set
> CONFIG_SPI_DYNAMIC=3Dy
> # CONFIG_SPMI is not set
> # CONFIG_HSI is not set
> CONFIG_PPS=3Dy
> # CONFIG_PPS_DEBUG is not set
> =

> #
> # PPS clients support
> #
> # CONFIG_PPS_CLIENT_KTIMER is not set
> CONFIG_PPS_CLIENT_LDISC=3Dm
> CONFIG_PPS_CLIENT_PARPORT=3Dm
> CONFIG_PPS_CLIENT_GPIO=3Dm
> =

> #
> # PPS generators support
> #
> =

> #
> # PTP clock support
> #
> CONFIG_PTP_1588_CLOCK=3Dy
> CONFIG_PTP_1588_CLOCK_OPTIONAL=3Dy
> # CONFIG_DP83640_PHY is not set
> # CONFIG_PTP_1588_CLOCK_INES is not set
> CONFIG_PTP_1588_CLOCK_KVM=3Dm
> # CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
> # CONFIG_PTP_1588_CLOCK_IDTCM is not set
> # CONFIG_PTP_1588_CLOCK_VMW is not set
> # end of PTP clock support
> =

> CONFIG_PINCTRL=3Dy
> CONFIG_PINMUX=3Dy
> CONFIG_PINCONF=3Dy
> CONFIG_GENERIC_PINCONF=3Dy
> # CONFIG_DEBUG_PINCTRL is not set
> CONFIG_PINCTRL_AMD=3Dm
> # CONFIG_PINCTRL_MCP23S08 is not set
> # CONFIG_PINCTRL_SX150X is not set
> CONFIG_PINCTRL_BAYTRAIL=3Dy
> # CONFIG_PINCTRL_CHERRYVIEW is not set
> # CONFIG_PINCTRL_LYNXPOINT is not set
> CONFIG_PINCTRL_INTEL=3Dy
> # CONFIG_PINCTRL_ALDERLAKE is not set
> CONFIG_PINCTRL_BROXTON=3Dm
> CONFIG_PINCTRL_CANNONLAKE=3Dm
> CONFIG_PINCTRL_CEDARFORK=3Dm
> CONFIG_PINCTRL_DENVERTON=3Dm
> # CONFIG_PINCTRL_ELKHARTLAKE is not set
> # CONFIG_PINCTRL_EMMITSBURG is not set
> CONFIG_PINCTRL_GEMINILAKE=3Dm
> # CONFIG_PINCTRL_ICELAKE is not set
> # CONFIG_PINCTRL_JASPERLAKE is not set
> # CONFIG_PINCTRL_LAKEFIELD is not set
> CONFIG_PINCTRL_LEWISBURG=3Dm
> CONFIG_PINCTRL_SUNRISEPOINT=3Dm
> # CONFIG_PINCTRL_TIGERLAKE is not set
> =

> #
> # Renesas pinctrl drivers
> #
> # end of Renesas pinctrl drivers
> =

> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIOLIB_FASTPATH_LIMIT=3D512
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> # CONFIG_DEBUG_GPIO is not set
> CONFIG_GPIO_CDEV=3Dy
> CONFIG_GPIO_CDEV_V1=3Dy
> CONFIG_GPIO_GENERIC=3Dm
> =

> #
> # Memory mapped GPIO drivers
> #
> CONFIG_GPIO_AMDPT=3Dm
> # CONFIG_GPIO_DWAPB is not set
> # CONFIG_GPIO_EXAR is not set
> # CONFIG_GPIO_GENERIC_PLATFORM is not set
> CONFIG_GPIO_ICH=3Dm
> # CONFIG_GPIO_MB86S7X is not set
> # CONFIG_GPIO_VX855 is not set
> # CONFIG_GPIO_AMD_FCH is not set
> # end of Memory mapped GPIO drivers
> =

> #
> # Port-mapped I/O GPIO drivers
> #
> # CONFIG_GPIO_F7188X is not set
> # CONFIG_GPIO_IT87 is not set
> # CONFIG_GPIO_SCH is not set
> # CONFIG_GPIO_SCH311X is not set
> # CONFIG_GPIO_WINBOND is not set
> # CONFIG_GPIO_WS16C48 is not set
> # end of Port-mapped I/O GPIO drivers
> =

> #
> # I2C GPIO expanders
> #
> # CONFIG_GPIO_ADP5588 is not set
> # CONFIG_GPIO_MAX7300 is not set
> # CONFIG_GPIO_MAX732X is not set
> # CONFIG_GPIO_PCA953X is not set
> # CONFIG_GPIO_PCA9570 is not set
> # CONFIG_GPIO_PCF857X is not set
> # CONFIG_GPIO_TPIC2810 is not set
> # end of I2C GPIO expanders
> =

> #
> # MFD GPIO expanders
> #
> # end of MFD GPIO expanders
> =

> #
> # PCI GPIO expanders
> #
> # CONFIG_GPIO_AMD8111 is not set
> # CONFIG_GPIO_BT8XX is not set
> # CONFIG_GPIO_ML_IOH is not set
> # CONFIG_GPIO_PCI_IDIO_16 is not set
> # CONFIG_GPIO_PCIE_IDIO_24 is not set
> # CONFIG_GPIO_RDC321X is not set
> # end of PCI GPIO expanders
> =

> #
> # SPI GPIO expanders
> #
> # CONFIG_GPIO_MAX3191X is not set
> # CONFIG_GPIO_MAX7301 is not set
> # CONFIG_GPIO_MC33880 is not set
> # CONFIG_GPIO_PISOSR is not set
> # CONFIG_GPIO_XRA1403 is not set
> # end of SPI GPIO expanders
> =

> #
> # USB GPIO expanders
> #
> # end of USB GPIO expanders
> =

> #
> # Virtual GPIO drivers
> #
> # CONFIG_GPIO_AGGREGATOR is not set
> # CONFIG_GPIO_MOCKUP is not set
> # CONFIG_GPIO_VIRTIO is not set
> # end of Virtual GPIO drivers
> =

> # CONFIG_W1 is not set
> CONFIG_POWER_RESET=3Dy
> # CONFIG_POWER_RESET_RESTART is not set
> CONFIG_POWER_SUPPLY=3Dy
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> CONFIG_POWER_SUPPLY_HWMON=3Dy
> # CONFIG_PDA_POWER is not set
> # CONFIG_TEST_POWER is not set
> # CONFIG_CHARGER_ADP5061 is not set
> # CONFIG_BATTERY_CW2015 is not set
> # CONFIG_BATTERY_DS2780 is not set
> # CONFIG_BATTERY_DS2781 is not set
> # CONFIG_BATTERY_DS2782 is not set
> # CONFIG_BATTERY_SBS is not set
> # CONFIG_CHARGER_SBS is not set
> # CONFIG_MANAGER_SBS is not set
> # CONFIG_BATTERY_BQ27XXX is not set
> # CONFIG_BATTERY_MAX17040 is not set
> # CONFIG_BATTERY_MAX17042 is not set
> # CONFIG_CHARGER_MAX8903 is not set
> # CONFIG_CHARGER_LP8727 is not set
> # CONFIG_CHARGER_GPIO is not set
> # CONFIG_CHARGER_LT3651 is not set
> # CONFIG_CHARGER_LTC4162L is not set
> # CONFIG_CHARGER_BQ2415X is not set
> # CONFIG_CHARGER_BQ24257 is not set
> # CONFIG_CHARGER_BQ24735 is not set
> # CONFIG_CHARGER_BQ2515X is not set
> # CONFIG_CHARGER_BQ25890 is not set
> # CONFIG_CHARGER_BQ25980 is not set
> # CONFIG_CHARGER_BQ256XX is not set
> # CONFIG_BATTERY_GAUGE_LTC2941 is not set
> # CONFIG_BATTERY_GOLDFISH is not set
> # CONFIG_BATTERY_RT5033 is not set
> # CONFIG_CHARGER_RT9455 is not set
> # CONFIG_CHARGER_BD99954 is not set
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dm
> # CONFIG_HWMON_DEBUG_CHIP is not set
> =

> #
> # Native drivers
> #
> CONFIG_SENSORS_ABITUGURU=3Dm
> CONFIG_SENSORS_ABITUGURU3=3Dm
> # CONFIG_SENSORS_AD7314 is not set
> CONFIG_SENSORS_AD7414=3Dm
> CONFIG_SENSORS_AD7418=3Dm
> CONFIG_SENSORS_ADM1021=3Dm
> CONFIG_SENSORS_ADM1025=3Dm
> CONFIG_SENSORS_ADM1026=3Dm
> CONFIG_SENSORS_ADM1029=3Dm
> CONFIG_SENSORS_ADM1031=3Dm
> # CONFIG_SENSORS_ADM1177 is not set
> CONFIG_SENSORS_ADM9240=3Dm
> CONFIG_SENSORS_ADT7X10=3Dm
> # CONFIG_SENSORS_ADT7310 is not set
> CONFIG_SENSORS_ADT7410=3Dm
> CONFIG_SENSORS_ADT7411=3Dm
> CONFIG_SENSORS_ADT7462=3Dm
> CONFIG_SENSORS_ADT7470=3Dm
> CONFIG_SENSORS_ADT7475=3Dm
> # CONFIG_SENSORS_AHT10 is not set
> # CONFIG_SENSORS_AQUACOMPUTER_D5NEXT is not set
> # CONFIG_SENSORS_AS370 is not set
> CONFIG_SENSORS_ASC7621=3Dm
> # CONFIG_SENSORS_AXI_FAN_CONTROL is not set
> CONFIG_SENSORS_K8TEMP=3Dm
> CONFIG_SENSORS_K10TEMP=3Dm
> CONFIG_SENSORS_FAM15H_POWER=3Dm
> CONFIG_SENSORS_APPLESMC=3Dm
> CONFIG_SENSORS_ASB100=3Dm
> # CONFIG_SENSORS_ASPEED is not set
> CONFIG_SENSORS_ATXP1=3Dm
> # CONFIG_SENSORS_CORSAIR_CPRO is not set
> # CONFIG_SENSORS_CORSAIR_PSU is not set
> # CONFIG_SENSORS_DRIVETEMP is not set
> CONFIG_SENSORS_DS620=3Dm
> CONFIG_SENSORS_DS1621=3Dm
> CONFIG_SENSORS_DELL_SMM=3Dm
> CONFIG_SENSORS_I5K_AMB=3Dm
> CONFIG_SENSORS_F71805F=3Dm
> CONFIG_SENSORS_F71882FG=3Dm
> CONFIG_SENSORS_F75375S=3Dm
> CONFIG_SENSORS_FSCHMD=3Dm
> # CONFIG_SENSORS_FTSTEUTATES is not set
> CONFIG_SENSORS_GL518SM=3Dm
> CONFIG_SENSORS_GL520SM=3Dm
> CONFIG_SENSORS_G760A=3Dm
> # CONFIG_SENSORS_G762 is not set
> # CONFIG_SENSORS_HIH6130 is not set
> CONFIG_SENSORS_IBMAEM=3Dm
> CONFIG_SENSORS_IBMPEX=3Dm
> CONFIG_SENSORS_I5500=3Dm
> CONFIG_SENSORS_CORETEMP=3Dm
> CONFIG_SENSORS_IT87=3Dm
> CONFIG_SENSORS_JC42=3Dm
> # CONFIG_SENSORS_POWR1220 is not set
> CONFIG_SENSORS_LINEAGE=3Dm
> # CONFIG_SENSORS_LTC2945 is not set
> # CONFIG_SENSORS_LTC2947_I2C is not set
> # CONFIG_SENSORS_LTC2947_SPI is not set
> # CONFIG_SENSORS_LTC2990 is not set
> # CONFIG_SENSORS_LTC2992 is not set
> CONFIG_SENSORS_LTC4151=3Dm
> CONFIG_SENSORS_LTC4215=3Dm
> # CONFIG_SENSORS_LTC4222 is not set
> CONFIG_SENSORS_LTC4245=3Dm
> # CONFIG_SENSORS_LTC4260 is not set
> CONFIG_SENSORS_LTC4261=3Dm
> # CONFIG_SENSORS_MAX1111 is not set
> # CONFIG_SENSORS_MAX127 is not set
> CONFIG_SENSORS_MAX16065=3Dm
> CONFIG_SENSORS_MAX1619=3Dm
> CONFIG_SENSORS_MAX1668=3Dm
> CONFIG_SENSORS_MAX197=3Dm
> # CONFIG_SENSORS_MAX31722 is not set
> # CONFIG_SENSORS_MAX31730 is not set
> # CONFIG_SENSORS_MAX6621 is not set
> CONFIG_SENSORS_MAX6639=3Dm
> CONFIG_SENSORS_MAX6642=3Dm
> CONFIG_SENSORS_MAX6650=3Dm
> CONFIG_SENSORS_MAX6697=3Dm
> # CONFIG_SENSORS_MAX31790 is not set
> CONFIG_SENSORS_MCP3021=3Dm
> # CONFIG_SENSORS_MLXREG_FAN is not set
> # CONFIG_SENSORS_TC654 is not set
> # CONFIG_SENSORS_TPS23861 is not set
> # CONFIG_SENSORS_MR75203 is not set
> # CONFIG_SENSORS_ADCXX is not set
> CONFIG_SENSORS_LM63=3Dm
> # CONFIG_SENSORS_LM70 is not set
> CONFIG_SENSORS_LM73=3Dm
> CONFIG_SENSORS_LM75=3Dm
> CONFIG_SENSORS_LM77=3Dm
> CONFIG_SENSORS_LM78=3Dm
> CONFIG_SENSORS_LM80=3Dm
> CONFIG_SENSORS_LM83=3Dm
> CONFIG_SENSORS_LM85=3Dm
> CONFIG_SENSORS_LM87=3Dm
> CONFIG_SENSORS_LM90=3Dm
> CONFIG_SENSORS_LM92=3Dm
> CONFIG_SENSORS_LM93=3Dm
> CONFIG_SENSORS_LM95234=3Dm
> CONFIG_SENSORS_LM95241=3Dm
> CONFIG_SENSORS_LM95245=3Dm
> CONFIG_SENSORS_PC87360=3Dm
> CONFIG_SENSORS_PC87427=3Dm
> CONFIG_SENSORS_NTC_THERMISTOR=3Dm
> # CONFIG_SENSORS_NCT6683 is not set
> CONFIG_SENSORS_NCT6775=3Dm
> # CONFIG_SENSORS_NCT7802 is not set
> # CONFIG_SENSORS_NCT7904 is not set
> # CONFIG_SENSORS_NPCM7XX is not set
> # CONFIG_SENSORS_NZXT_KRAKEN2 is not set
> CONFIG_SENSORS_PCF8591=3Dm
> CONFIG_PMBUS=3Dm
> CONFIG_SENSORS_PMBUS=3Dm
> # CONFIG_SENSORS_ADM1266 is not set
> CONFIG_SENSORS_ADM1275=3Dm
> # CONFIG_SENSORS_BEL_PFE is not set
> # CONFIG_SENSORS_BPA_RS600 is not set
> # CONFIG_SENSORS_FSP_3Y is not set
> # CONFIG_SENSORS_IBM_CFFPS is not set
> # CONFIG_SENSORS_DPS920AB is not set
> # CONFIG_SENSORS_INSPUR_IPSPS is not set
> # CONFIG_SENSORS_IR35221 is not set
> # CONFIG_SENSORS_IR36021 is not set
> # CONFIG_SENSORS_IR38064 is not set
> # CONFIG_SENSORS_IRPS5401 is not set
> # CONFIG_SENSORS_ISL68137 is not set
> CONFIG_SENSORS_LM25066=3Dm
> CONFIG_SENSORS_LTC2978=3Dm
> # CONFIG_SENSORS_LTC3815 is not set
> # CONFIG_SENSORS_MAX15301 is not set
> CONFIG_SENSORS_MAX16064=3Dm
> # CONFIG_SENSORS_MAX16601 is not set
> # CONFIG_SENSORS_MAX20730 is not set
> # CONFIG_SENSORS_MAX20751 is not set
> # CONFIG_SENSORS_MAX31785 is not set
> CONFIG_SENSORS_MAX34440=3Dm
> CONFIG_SENSORS_MAX8688=3Dm
> # CONFIG_SENSORS_MP2888 is not set
> # CONFIG_SENSORS_MP2975 is not set
> # CONFIG_SENSORS_PIM4328 is not set
> # CONFIG_SENSORS_PM6764TR is not set
> # CONFIG_SENSORS_PXE1610 is not set
> # CONFIG_SENSORS_Q54SJ108A2 is not set
> # CONFIG_SENSORS_STPDDC60 is not set
> # CONFIG_SENSORS_TPS40422 is not set
> # CONFIG_SENSORS_TPS53679 is not set
> CONFIG_SENSORS_UCD9000=3Dm
> CONFIG_SENSORS_UCD9200=3Dm
> # CONFIG_SENSORS_XDPE122 is not set
> CONFIG_SENSORS_ZL6100=3Dm
> # CONFIG_SENSORS_SBTSI is not set
> # CONFIG_SENSORS_SBRMI is not set
> CONFIG_SENSORS_SHT15=3Dm
> CONFIG_SENSORS_SHT21=3Dm
> # CONFIG_SENSORS_SHT3x is not set
> # CONFIG_SENSORS_SHT4x is not set
> # CONFIG_SENSORS_SHTC1 is not set
> CONFIG_SENSORS_SIS5595=3Dm
> CONFIG_SENSORS_DME1737=3Dm
> CONFIG_SENSORS_EMC1403=3Dm
> # CONFIG_SENSORS_EMC2103 is not set
> CONFIG_SENSORS_EMC6W201=3Dm
> CONFIG_SENSORS_SMSC47M1=3Dm
> CONFIG_SENSORS_SMSC47M192=3Dm
> CONFIG_SENSORS_SMSC47B397=3Dm
> CONFIG_SENSORS_SCH56XX_COMMON=3Dm
> CONFIG_SENSORS_SCH5627=3Dm
> CONFIG_SENSORS_SCH5636=3Dm
> # CONFIG_SENSORS_STTS751 is not set
> # CONFIG_SENSORS_SMM665 is not set
> # CONFIG_SENSORS_ADC128D818 is not set
> CONFIG_SENSORS_ADS7828=3Dm
> # CONFIG_SENSORS_ADS7871 is not set
> CONFIG_SENSORS_AMC6821=3Dm
> CONFIG_SENSORS_INA209=3Dm
> CONFIG_SENSORS_INA2XX=3Dm
> # CONFIG_SENSORS_INA3221 is not set
> # CONFIG_SENSORS_TC74 is not set
> CONFIG_SENSORS_THMC50=3Dm
> CONFIG_SENSORS_TMP102=3Dm
> # CONFIG_SENSORS_TMP103 is not set
> # CONFIG_SENSORS_TMP108 is not set
> CONFIG_SENSORS_TMP401=3Dm
> CONFIG_SENSORS_TMP421=3Dm
> # CONFIG_SENSORS_TMP513 is not set
> CONFIG_SENSORS_VIA_CPUTEMP=3Dm
> CONFIG_SENSORS_VIA686A=3Dm
> CONFIG_SENSORS_VT1211=3Dm
> CONFIG_SENSORS_VT8231=3Dm
> # CONFIG_SENSORS_W83773G is not set
> CONFIG_SENSORS_W83781D=3Dm
> CONFIG_SENSORS_W83791D=3Dm
> CONFIG_SENSORS_W83792D=3Dm
> CONFIG_SENSORS_W83793=3Dm
> CONFIG_SENSORS_W83795=3Dm
> # CONFIG_SENSORS_W83795_FANCTRL is not set
> CONFIG_SENSORS_W83L785TS=3Dm
> CONFIG_SENSORS_W83L786NG=3Dm
> CONFIG_SENSORS_W83627HF=3Dm
> CONFIG_SENSORS_W83627EHF=3Dm
> # CONFIG_SENSORS_XGENE is not set
> =

> #
> # ACPI drivers
> #
> CONFIG_SENSORS_ACPI_POWER=3Dm
> CONFIG_SENSORS_ATK0110=3Dm
> CONFIG_THERMAL=3Dy
> # CONFIG_THERMAL_NETLINK is not set
> # CONFIG_THERMAL_STATISTICS is not set
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> CONFIG_THERMAL_HWMON=3Dy
> CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> CONFIG_THERMAL_GOV_FAIR_SHARE=3Dy
> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> CONFIG_THERMAL_GOV_BANG_BANG=3Dy
> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> # CONFIG_THERMAL_EMULATION is not set
> =

> #
> # Intel thermal drivers
> #
> CONFIG_INTEL_POWERCLAMP=3Dm
> CONFIG_X86_THERMAL_VECTOR=3Dy
> CONFIG_X86_PKG_TEMP_THERMAL=3Dm
> CONFIG_INTEL_SOC_DTS_IOSF_CORE=3Dm
> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> =

> #
> # ACPI INT340X thermal drivers
> #
> CONFIG_INT340X_THERMAL=3Dm
> CONFIG_ACPI_THERMAL_REL=3Dm
> # CONFIG_INT3406_THERMAL is not set
> CONFIG_PROC_THERMAL_MMIO_RAPL=3Dm
> # end of ACPI INT340X thermal drivers
> =

> CONFIG_INTEL_PCH_THERMAL=3Dm
> # CONFIG_INTEL_TCC_COOLING is not set
> # CONFIG_INTEL_MENLOW is not set
> # end of Intel thermal drivers
> =

> CONFIG_WATCHDOG=3Dy
> CONFIG_WATCHDOG_CORE=3Dy
> # CONFIG_WATCHDOG_NOWAYOUT is not set
> CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=3Dy
> CONFIG_WATCHDOG_OPEN_TIMEOUT=3D0
> CONFIG_WATCHDOG_SYSFS=3Dy
> # CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set
> =

> #
> # Watchdog Pretimeout Governors
> #
> # CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
> =

> #
> # Watchdog Device Drivers
> #
> CONFIG_SOFT_WATCHDOG=3Dm
> CONFIG_WDAT_WDT=3Dm
> # CONFIG_XILINX_WATCHDOG is not set
> # CONFIG_ZIIRAVE_WATCHDOG is not set
> # CONFIG_MLX_WDT is not set
> # CONFIG_CADENCE_WATCHDOG is not set
> # CONFIG_DW_WATCHDOG is not set
> # CONFIG_MAX63XX_WATCHDOG is not set
> # CONFIG_ACQUIRE_WDT is not set
> # CONFIG_ADVANTECH_WDT is not set
> CONFIG_ALIM1535_WDT=3Dm
> CONFIG_ALIM7101_WDT=3Dm
> # CONFIG_EBC_C384_WDT is not set
> CONFIG_F71808E_WDT=3Dm
> CONFIG_SP5100_TCO=3Dm
> CONFIG_SBC_FITPC2_WATCHDOG=3Dm
> # CONFIG_EUROTECH_WDT is not set
> CONFIG_IB700_WDT=3Dm
> CONFIG_IBMASR=3Dm
> # CONFIG_WAFER_WDT is not set
> CONFIG_I6300ESB_WDT=3Dy
> CONFIG_IE6XX_WDT=3Dm
> CONFIG_ITCO_WDT=3Dy
> CONFIG_ITCO_VENDOR_SUPPORT=3Dy
> CONFIG_IT8712F_WDT=3Dm
> CONFIG_IT87_WDT=3Dm
> CONFIG_HP_WATCHDOG=3Dm
> CONFIG_HPWDT_NMI_DECODING=3Dy
> # CONFIG_SC1200_WDT is not set
> # CONFIG_PC87413_WDT is not set
> CONFIG_NV_TCO=3Dm
> # CONFIG_60XX_WDT is not set
> # CONFIG_CPU5_WDT is not set
> CONFIG_SMSC_SCH311X_WDT=3Dm
> # CONFIG_SMSC37B787_WDT is not set
> # CONFIG_TQMX86_WDT is not set
> CONFIG_VIA_WDT=3Dm
> CONFIG_W83627HF_WDT=3Dm
> CONFIG_W83877F_WDT=3Dm
> CONFIG_W83977F_WDT=3Dm
> CONFIG_MACHZ_WDT=3Dm
> # CONFIG_SBC_EPX_C3_WATCHDOG is not set
> CONFIG_INTEL_MEI_WDT=3Dm
> # CONFIG_NI903X_WDT is not set
> # CONFIG_NIC7018_WDT is not set
> # CONFIG_MEN_A21_WDT is not set
> =

> #
> # PCI-based Watchdog Cards
> #
> CONFIG_PCIPCWATCHDOG=3Dm
> CONFIG_WDTPCI=3Dm
> =

> #
> # USB-based Watchdog Cards
> #
> # CONFIG_USBPCWATCHDOG is not set
> CONFIG_SSB_POSSIBLE=3Dy
> # CONFIG_SSB is not set
> CONFIG_BCMA_POSSIBLE=3Dy
> CONFIG_BCMA=3Dm
> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> CONFIG_BCMA_HOST_PCI=3Dy
> # CONFIG_BCMA_HOST_SOC is not set
> CONFIG_BCMA_DRIVER_PCI=3Dy
> CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
> CONFIG_BCMA_DRIVER_GPIO=3Dy
> # CONFIG_BCMA_DEBUG is not set
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> # CONFIG_MFD_AS3711 is not set
> # CONFIG_PMIC_ADP5520 is not set
> # CONFIG_MFD_AAT2870_CORE is not set
> # CONFIG_MFD_BCM590XX is not set
> # CONFIG_MFD_BD9571MWV is not set
> # CONFIG_MFD_AXP20X_I2C is not set
> # CONFIG_MFD_MADERA is not set
> # CONFIG_PMIC_DA903X is not set
> # CONFIG_MFD_DA9052_SPI is not set
> # CONFIG_MFD_DA9052_I2C is not set
> # CONFIG_MFD_DA9055 is not set
> # CONFIG_MFD_DA9062 is not set
> # CONFIG_MFD_DA9063 is not set
> # CONFIG_MFD_DA9150 is not set
> # CONFIG_MFD_DLN2 is not set
> # CONFIG_MFD_MC13XXX_SPI is not set
> # CONFIG_MFD_MC13XXX_I2C is not set
> # CONFIG_MFD_MP2629 is not set
> # CONFIG_HTC_PASIC3 is not set
> # CONFIG_HTC_I2CPLD is not set
> # CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
> CONFIG_LPC_ICH=3Dy
> CONFIG_LPC_SCH=3Dm
> # CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
> CONFIG_MFD_INTEL_LPSS=3Dy
> CONFIG_MFD_INTEL_LPSS_ACPI=3Dy
> CONFIG_MFD_INTEL_LPSS_PCI=3Dy
> # CONFIG_MFD_INTEL_PMC_BXT is not set
> # CONFIG_MFD_INTEL_PMT is not set
> # CONFIG_MFD_IQS62X is not set
> # CONFIG_MFD_JANZ_CMODIO is not set
> # CONFIG_MFD_KEMPLD is not set
> # CONFIG_MFD_88PM800 is not set
> # CONFIG_MFD_88PM805 is not set
> # CONFIG_MFD_88PM860X is not set
> # CONFIG_MFD_MAX14577 is not set
> # CONFIG_MFD_MAX77693 is not set
> # CONFIG_MFD_MAX77843 is not set
> # CONFIG_MFD_MAX8907 is not set
> # CONFIG_MFD_MAX8925 is not set
> # CONFIG_MFD_MAX8997 is not set
> # CONFIG_MFD_MAX8998 is not set
> # CONFIG_MFD_MT6360 is not set
> # CONFIG_MFD_MT6397 is not set
> # CONFIG_MFD_MENF21BMC is not set
> # CONFIG_EZX_PCAP is not set
> # CONFIG_MFD_VIPERBOARD is not set
> # CONFIG_MFD_RETU is not set
> # CONFIG_MFD_PCF50633 is not set
> # CONFIG_MFD_RDC321X is not set
> # CONFIG_MFD_RT4831 is not set
> # CONFIG_MFD_RT5033 is not set
> # CONFIG_MFD_RC5T583 is not set
> # CONFIG_MFD_SI476X_CORE is not set
> CONFIG_MFD_SM501=3Dm
> CONFIG_MFD_SM501_GPIO=3Dy
> # CONFIG_MFD_SKY81452 is not set
> # CONFIG_MFD_SYSCON is not set
> # CONFIG_MFD_TI_AM335X_TSCADC is not set
> # CONFIG_MFD_LP3943 is not set
> # CONFIG_MFD_LP8788 is not set
> # CONFIG_MFD_TI_LMU is not set
> # CONFIG_MFD_PALMAS is not set
> # CONFIG_TPS6105X is not set
> # CONFIG_TPS65010 is not set
> # CONFIG_TPS6507X is not set
> # CONFIG_MFD_TPS65086 is not set
> # CONFIG_MFD_TPS65090 is not set
> # CONFIG_MFD_TI_LP873X is not set
> # CONFIG_MFD_TPS6586X is not set
> # CONFIG_MFD_TPS65910 is not set
> # CONFIG_MFD_TPS65912_I2C is not set
> # CONFIG_MFD_TPS65912_SPI is not set
> # CONFIG_MFD_TPS80031 is not set
> # CONFIG_TWL4030_CORE is not set
> # CONFIG_TWL6040_CORE is not set
> # CONFIG_MFD_WL1273_CORE is not set
> # CONFIG_MFD_LM3533 is not set
> # CONFIG_MFD_TQMX86 is not set
> CONFIG_MFD_VX855=3Dm
> # CONFIG_MFD_ARIZONA_I2C is not set
> # CONFIG_MFD_ARIZONA_SPI is not set
> # CONFIG_MFD_WM8400 is not set
> # CONFIG_MFD_WM831X_I2C is not set
> # CONFIG_MFD_WM831X_SPI is not set
> # CONFIG_MFD_WM8350_I2C is not set
> # CONFIG_MFD_WM8994 is not set
> # CONFIG_MFD_ATC260X_I2C is not set
> # CONFIG_MFD_INTEL_M10_BMC is not set
> # end of Multifunction device drivers
> =

> # CONFIG_REGULATOR is not set
> CONFIG_RC_CORE=3Dm
> CONFIG_RC_MAP=3Dm
> CONFIG_LIRC=3Dy
> CONFIG_RC_DECODERS=3Dy
> CONFIG_IR_NEC_DECODER=3Dm
> CONFIG_IR_RC5_DECODER=3Dm
> CONFIG_IR_RC6_DECODER=3Dm
> CONFIG_IR_JVC_DECODER=3Dm
> CONFIG_IR_SONY_DECODER=3Dm
> CONFIG_IR_SANYO_DECODER=3Dm
> # CONFIG_IR_SHARP_DECODER is not set
> CONFIG_IR_MCE_KBD_DECODER=3Dm
> # CONFIG_IR_XMP_DECODER is not set
> CONFIG_IR_IMON_DECODER=3Dm
> # CONFIG_IR_RCMM_DECODER is not set
> CONFIG_RC_DEVICES=3Dy
> # CONFIG_RC_ATI_REMOTE is not set
> CONFIG_IR_ENE=3Dm
> # CONFIG_IR_IMON is not set
> # CONFIG_IR_IMON_RAW is not set
> # CONFIG_IR_MCEUSB is not set
> CONFIG_IR_ITE_CIR=3Dm
> CONFIG_IR_FINTEK=3Dm
> CONFIG_IR_NUVOTON=3Dm
> # CONFIG_IR_REDRAT3 is not set
> # CONFIG_IR_STREAMZAP is not set
> CONFIG_IR_WINBOND_CIR=3Dm
> # CONFIG_IR_IGORPLUGUSB is not set
> # CONFIG_IR_IGUANA is not set
> # CONFIG_IR_TTUSBIR is not set
> # CONFIG_RC_LOOPBACK is not set
> CONFIG_IR_SERIAL=3Dm
> CONFIG_IR_SERIAL_TRANSMITTER=3Dy
> CONFIG_IR_SIR=3Dm
> # CONFIG_RC_XBOX_DVD is not set
> # CONFIG_IR_TOY is not set
> CONFIG_MEDIA_CEC_SUPPORT=3Dy
> # CONFIG_CEC_CH7322 is not set
> # CONFIG_CEC_SECO is not set
> # CONFIG_USB_PULSE8_CEC is not set
> # CONFIG_USB_RAINSHADOW_CEC is not set
> CONFIG_MEDIA_SUPPORT=3Dm
> # CONFIG_MEDIA_SUPPORT_FILTER is not set
> # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
> =

> #
> # Media device types
> #
> CONFIG_MEDIA_CAMERA_SUPPORT=3Dy
> CONFIG_MEDIA_ANALOG_TV_SUPPORT=3Dy
> CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
> CONFIG_MEDIA_RADIO_SUPPORT=3Dy
> CONFIG_MEDIA_SDR_SUPPORT=3Dy
> CONFIG_MEDIA_PLATFORM_SUPPORT=3Dy
> CONFIG_MEDIA_TEST_SUPPORT=3Dy
> # end of Media device types
> =

> #
> # Media core support
> #
> CONFIG_VIDEO_DEV=3Dm
> CONFIG_MEDIA_CONTROLLER=3Dy
> CONFIG_DVB_CORE=3Dm
> # end of Media core support
> =

> #
> # Video4Linux options
> #
> CONFIG_VIDEO_V4L2=3Dm
> CONFIG_VIDEO_V4L2_I2C=3Dy
> CONFIG_VIDEO_V4L2_SUBDEV_API=3Dy
> # CONFIG_VIDEO_ADV_DEBUG is not set
> # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> # end of Video4Linux options
> =

> #
> # Media controller options
> #
> # CONFIG_MEDIA_CONTROLLER_DVB is not set
> # end of Media controller options
> =

> #
> # Digital TV options
> #
> # CONFIG_DVB_MMAP is not set
> CONFIG_DVB_NET=3Dy
> CONFIG_DVB_MAX_ADAPTERS=3D16
> CONFIG_DVB_DYNAMIC_MINORS=3Dy
> # CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
> # CONFIG_DVB_ULE_DEBUG is not set
> # end of Digital TV options
> =

> #
> # Media drivers
> #
> # CONFIG_MEDIA_USB_SUPPORT is not set
> # CONFIG_MEDIA_PCI_SUPPORT is not set
> CONFIG_RADIO_ADAPTERS=3Dy
> # CONFIG_RADIO_SI470X is not set
> # CONFIG_RADIO_SI4713 is not set
> # CONFIG_USB_MR800 is not set
> # CONFIG_USB_DSBR is not set
> # CONFIG_RADIO_MAXIRADIO is not set
> # CONFIG_RADIO_SHARK is not set
> # CONFIG_RADIO_SHARK2 is not set
> # CONFIG_USB_KEENE is not set
> # CONFIG_USB_RAREMONO is not set
> # CONFIG_USB_MA901 is not set
> # CONFIG_RADIO_TEA5764 is not set
> # CONFIG_RADIO_SAA7706H is not set
> # CONFIG_RADIO_TEF6862 is not set
> # CONFIG_RADIO_WL1273 is not set
> CONFIG_VIDEOBUF2_CORE=3Dm
> CONFIG_VIDEOBUF2_V4L2=3Dm
> CONFIG_VIDEOBUF2_MEMOPS=3Dm
> CONFIG_VIDEOBUF2_VMALLOC=3Dm
> # CONFIG_V4L_PLATFORM_DRIVERS is not set
> # CONFIG_V4L_MEM2MEM_DRIVERS is not set
> # CONFIG_DVB_PLATFORM_DRIVERS is not set
> # CONFIG_SDR_PLATFORM_DRIVERS is not set
> =

> #
> # MMC/SDIO DVB adapters
> #
> # CONFIG_SMS_SDIO_DRV is not set
> # CONFIG_V4L_TEST_DRIVERS is not set
> # CONFIG_DVB_TEST_DRIVERS is not set
> =

> #
> # FireWire (IEEE 1394) Adapters
> #
> # CONFIG_DVB_FIREDTV is not set
> # end of Media drivers
> =

> #
> # Media ancillary drivers
> #
> CONFIG_MEDIA_ATTACH=3Dy
> CONFIG_VIDEO_IR_I2C=3Dm
> =

> #
> # Audio decoders, processors and mixers
> #
> # CONFIG_VIDEO_TVAUDIO is not set
> # CONFIG_VIDEO_TDA7432 is not set
> # CONFIG_VIDEO_TDA9840 is not set
> # CONFIG_VIDEO_TEA6415C is not set
> # CONFIG_VIDEO_TEA6420 is not set
> # CONFIG_VIDEO_MSP3400 is not set
> # CONFIG_VIDEO_CS3308 is not set
> # CONFIG_VIDEO_CS5345 is not set
> # CONFIG_VIDEO_CS53L32A is not set
> # CONFIG_VIDEO_TLV320AIC23B is not set
> # CONFIG_VIDEO_UDA1342 is not set
> # CONFIG_VIDEO_WM8775 is not set
> # CONFIG_VIDEO_WM8739 is not set
> # CONFIG_VIDEO_VP27SMPX is not set
> # CONFIG_VIDEO_SONY_BTF_MPX is not set
> # end of Audio decoders, processors and mixers
> =

> #
> # RDS decoders
> #
> # CONFIG_VIDEO_SAA6588 is not set
> # end of RDS decoders
> =

> #
> # Video decoders
> #
> # CONFIG_VIDEO_ADV7180 is not set
> # CONFIG_VIDEO_ADV7183 is not set
> # CONFIG_VIDEO_ADV7604 is not set
> # CONFIG_VIDEO_ADV7842 is not set
> # CONFIG_VIDEO_BT819 is not set
> # CONFIG_VIDEO_BT856 is not set
> # CONFIG_VIDEO_BT866 is not set
> # CONFIG_VIDEO_KS0127 is not set
> # CONFIG_VIDEO_ML86V7667 is not set
> # CONFIG_VIDEO_SAA7110 is not set
> # CONFIG_VIDEO_SAA711X is not set
> # CONFIG_VIDEO_TC358743 is not set
> # CONFIG_VIDEO_TVP514X is not set
> # CONFIG_VIDEO_TVP5150 is not set
> # CONFIG_VIDEO_TVP7002 is not set
> # CONFIG_VIDEO_TW2804 is not set
> # CONFIG_VIDEO_TW9903 is not set
> # CONFIG_VIDEO_TW9906 is not set
> # CONFIG_VIDEO_TW9910 is not set
> # CONFIG_VIDEO_VPX3220 is not set
> =

> #
> # Video and audio decoders
> #
> # CONFIG_VIDEO_SAA717X is not set
> # CONFIG_VIDEO_CX25840 is not set
> # end of Video decoders
> =

> #
> # Video encoders
> #
> # CONFIG_VIDEO_SAA7127 is not set
> # CONFIG_VIDEO_SAA7185 is not set
> # CONFIG_VIDEO_ADV7170 is not set
> # CONFIG_VIDEO_ADV7175 is not set
> # CONFIG_VIDEO_ADV7343 is not set
> # CONFIG_VIDEO_ADV7393 is not set
> # CONFIG_VIDEO_ADV7511 is not set
> # CONFIG_VIDEO_AD9389B is not set
> # CONFIG_VIDEO_AK881X is not set
> # CONFIG_VIDEO_THS8200 is not set
> # end of Video encoders
> =

> #
> # Video improvement chips
> #
> # CONFIG_VIDEO_UPD64031A is not set
> # CONFIG_VIDEO_UPD64083 is not set
> # end of Video improvement chips
> =

> #
> # Audio/Video compression chips
> #
> # CONFIG_VIDEO_SAA6752HS is not set
> # end of Audio/Video compression chips
> =

> #
> # SDR tuner chips
> #
> # CONFIG_SDR_MAX2175 is not set
> # end of SDR tuner chips
> =

> #
> # Miscellaneous helper chips
> #
> # CONFIG_VIDEO_THS7303 is not set
> # CONFIG_VIDEO_M52790 is not set
> # CONFIG_VIDEO_I2C is not set
> # CONFIG_VIDEO_ST_MIPID02 is not set
> # end of Miscellaneous helper chips
> =

> #
> # Camera sensor devices
> #
> # CONFIG_VIDEO_HI556 is not set
> # CONFIG_VIDEO_IMX208 is not set
> # CONFIG_VIDEO_IMX214 is not set
> # CONFIG_VIDEO_IMX219 is not set
> # CONFIG_VIDEO_IMX258 is not set
> # CONFIG_VIDEO_IMX274 is not set
> # CONFIG_VIDEO_IMX290 is not set
> # CONFIG_VIDEO_IMX319 is not set
> # CONFIG_VIDEO_IMX355 is not set
> # CONFIG_VIDEO_OV02A10 is not set
> # CONFIG_VIDEO_OV2640 is not set
> # CONFIG_VIDEO_OV2659 is not set
> # CONFIG_VIDEO_OV2680 is not set
> # CONFIG_VIDEO_OV2685 is not set
> # CONFIG_VIDEO_OV2740 is not set
> # CONFIG_VIDEO_OV5647 is not set
> # CONFIG_VIDEO_OV5648 is not set
> # CONFIG_VIDEO_OV6650 is not set
> # CONFIG_VIDEO_OV5670 is not set
> # CONFIG_VIDEO_OV5675 is not set
> # CONFIG_VIDEO_OV5695 is not set
> # CONFIG_VIDEO_OV7251 is not set
> # CONFIG_VIDEO_OV772X is not set
> # CONFIG_VIDEO_OV7640 is not set
> # CONFIG_VIDEO_OV7670 is not set
> # CONFIG_VIDEO_OV7740 is not set
> # CONFIG_VIDEO_OV8856 is not set
> # CONFIG_VIDEO_OV8865 is not set
> # CONFIG_VIDEO_OV9640 is not set
> # CONFIG_VIDEO_OV9650 is not set
> # CONFIG_VIDEO_OV9734 is not set
> # CONFIG_VIDEO_OV13858 is not set
> # CONFIG_VIDEO_VS6624 is not set
> # CONFIG_VIDEO_MT9M001 is not set
> # CONFIG_VIDEO_MT9M032 is not set
> # CONFIG_VIDEO_MT9M111 is not set
> # CONFIG_VIDEO_MT9P031 is not set
> # CONFIG_VIDEO_MT9T001 is not set
> # CONFIG_VIDEO_MT9T112 is not set
> # CONFIG_VIDEO_MT9V011 is not set
> # CONFIG_VIDEO_MT9V032 is not set
> # CONFIG_VIDEO_MT9V111 is not set
> # CONFIG_VIDEO_SR030PC30 is not set
> # CONFIG_VIDEO_NOON010PC30 is not set
> # CONFIG_VIDEO_M5MOLS is not set
> # CONFIG_VIDEO_RDACM20 is not set
> # CONFIG_VIDEO_RDACM21 is not set
> # CONFIG_VIDEO_RJ54N1 is not set
> # CONFIG_VIDEO_S5K6AA is not set
> # CONFIG_VIDEO_S5K6A3 is not set
> # CONFIG_VIDEO_S5K4ECGX is not set
> # CONFIG_VIDEO_S5K5BAF is not set
> # CONFIG_VIDEO_CCS is not set
> # CONFIG_VIDEO_ET8EK8 is not set
> # CONFIG_VIDEO_S5C73M3 is not set
> # end of Camera sensor devices
> =

> #
> # Lens drivers
> #
> # CONFIG_VIDEO_AD5820 is not set
> # CONFIG_VIDEO_AK7375 is not set
> # CONFIG_VIDEO_DW9714 is not set
> # CONFIG_VIDEO_DW9768 is not set
> # CONFIG_VIDEO_DW9807_VCM is not set
> # end of Lens drivers
> =

> #
> # Flash devices
> #
> # CONFIG_VIDEO_ADP1653 is not set
> # CONFIG_VIDEO_LM3560 is not set
> # CONFIG_VIDEO_LM3646 is not set
> # end of Flash devices
> =

> #
> # SPI helper chips
> #
> # CONFIG_VIDEO_GS1662 is not set
> # end of SPI helper chips
> =

> #
> # Media SPI Adapters
> #
> CONFIG_CXD2880_SPI_DRV=3Dm
> # end of Media SPI Adapters
> =

> CONFIG_MEDIA_TUNER=3Dm
> =

> #
> # Customize TV tuners
> #
> CONFIG_MEDIA_TUNER_SIMPLE=3Dm
> CONFIG_MEDIA_TUNER_TDA18250=3Dm
> CONFIG_MEDIA_TUNER_TDA8290=3Dm
> CONFIG_MEDIA_TUNER_TDA827X=3Dm
> CONFIG_MEDIA_TUNER_TDA18271=3Dm
> CONFIG_MEDIA_TUNER_TDA9887=3Dm
> CONFIG_MEDIA_TUNER_TEA5761=3Dm
> CONFIG_MEDIA_TUNER_TEA5767=3Dm
> CONFIG_MEDIA_TUNER_MSI001=3Dm
> CONFIG_MEDIA_TUNER_MT20XX=3Dm
> CONFIG_MEDIA_TUNER_MT2060=3Dm
> CONFIG_MEDIA_TUNER_MT2063=3Dm
> CONFIG_MEDIA_TUNER_MT2266=3Dm
> CONFIG_MEDIA_TUNER_MT2131=3Dm
> CONFIG_MEDIA_TUNER_QT1010=3Dm
> CONFIG_MEDIA_TUNER_XC2028=3Dm
> CONFIG_MEDIA_TUNER_XC5000=3Dm
> CONFIG_MEDIA_TUNER_XC4000=3Dm
> CONFIG_MEDIA_TUNER_MXL5005S=3Dm
> CONFIG_MEDIA_TUNER_MXL5007T=3Dm
> CONFIG_MEDIA_TUNER_MC44S803=3Dm
> CONFIG_MEDIA_TUNER_MAX2165=3Dm
> CONFIG_MEDIA_TUNER_TDA18218=3Dm
> CONFIG_MEDIA_TUNER_FC0011=3Dm
> CONFIG_MEDIA_TUNER_FC0012=3Dm
> CONFIG_MEDIA_TUNER_FC0013=3Dm
> CONFIG_MEDIA_TUNER_TDA18212=3Dm
> CONFIG_MEDIA_TUNER_E4000=3Dm
> CONFIG_MEDIA_TUNER_FC2580=3Dm
> CONFIG_MEDIA_TUNER_M88RS6000T=3Dm
> CONFIG_MEDIA_TUNER_TUA9001=3Dm
> CONFIG_MEDIA_TUNER_SI2157=3Dm
> CONFIG_MEDIA_TUNER_IT913X=3Dm
> CONFIG_MEDIA_TUNER_R820T=3Dm
> CONFIG_MEDIA_TUNER_MXL301RF=3Dm
> CONFIG_MEDIA_TUNER_QM1D1C0042=3Dm
> CONFIG_MEDIA_TUNER_QM1D1B0004=3Dm
> # end of Customize TV tuners
> =

> #
> # Customise DVB Frontends
> #
> =

> #
> # Multistandard (satellite) frontends
> #
> CONFIG_DVB_STB0899=3Dm
> CONFIG_DVB_STB6100=3Dm
> CONFIG_DVB_STV090x=3Dm
> CONFIG_DVB_STV0910=3Dm
> CONFIG_DVB_STV6110x=3Dm
> CONFIG_DVB_STV6111=3Dm
> CONFIG_DVB_MXL5XX=3Dm
> CONFIG_DVB_M88DS3103=3Dm
> =

> #
> # Multistandard (cable + terrestrial) frontends
> #
> CONFIG_DVB_DRXK=3Dm
> CONFIG_DVB_TDA18271C2DD=3Dm
> CONFIG_DVB_SI2165=3Dm
> CONFIG_DVB_MN88472=3Dm
> CONFIG_DVB_MN88473=3Dm
> =

> #
> # DVB-S (satellite) frontends
> #
> CONFIG_DVB_CX24110=3Dm
> CONFIG_DVB_CX24123=3Dm
> CONFIG_DVB_MT312=3Dm
> CONFIG_DVB_ZL10036=3Dm
> CONFIG_DVB_ZL10039=3Dm
> CONFIG_DVB_S5H1420=3Dm
> CONFIG_DVB_STV0288=3Dm
> CONFIG_DVB_STB6000=3Dm
> CONFIG_DVB_STV0299=3Dm
> CONFIG_DVB_STV6110=3Dm
> CONFIG_DVB_STV0900=3Dm
> CONFIG_DVB_TDA8083=3Dm
> CONFIG_DVB_TDA10086=3Dm
> CONFIG_DVB_TDA8261=3Dm
> CONFIG_DVB_VES1X93=3Dm
> CONFIG_DVB_TUNER_ITD1000=3Dm
> CONFIG_DVB_TUNER_CX24113=3Dm
> CONFIG_DVB_TDA826X=3Dm
> CONFIG_DVB_TUA6100=3Dm
> CONFIG_DVB_CX24116=3Dm
> CONFIG_DVB_CX24117=3Dm
> CONFIG_DVB_CX24120=3Dm
> CONFIG_DVB_SI21XX=3Dm
> CONFIG_DVB_TS2020=3Dm
> CONFIG_DVB_DS3000=3Dm
> CONFIG_DVB_MB86A16=3Dm
> CONFIG_DVB_TDA10071=3Dm
> =

> #
> # DVB-T (terrestrial) frontends
> #
> CONFIG_DVB_SP887X=3Dm
> CONFIG_DVB_CX22700=3Dm
> CONFIG_DVB_CX22702=3Dm
> CONFIG_DVB_S5H1432=3Dm
> CONFIG_DVB_DRXD=3Dm
> CONFIG_DVB_L64781=3Dm
> CONFIG_DVB_TDA1004X=3Dm
> CONFIG_DVB_NXT6000=3Dm
> CONFIG_DVB_MT352=3Dm
> CONFIG_DVB_ZL10353=3Dm
> CONFIG_DVB_DIB3000MB=3Dm
> CONFIG_DVB_DIB3000MC=3Dm
> CONFIG_DVB_DIB7000M=3Dm
> CONFIG_DVB_DIB7000P=3Dm
> CONFIG_DVB_DIB9000=3Dm
> CONFIG_DVB_TDA10048=3Dm
> CONFIG_DVB_AF9013=3Dm
> CONFIG_DVB_EC100=3Dm
> CONFIG_DVB_STV0367=3Dm
> CONFIG_DVB_CXD2820R=3Dm
> CONFIG_DVB_CXD2841ER=3Dm
> CONFIG_DVB_RTL2830=3Dm
> CONFIG_DVB_RTL2832=3Dm
> CONFIG_DVB_RTL2832_SDR=3Dm
> CONFIG_DVB_SI2168=3Dm
> CONFIG_DVB_ZD1301_DEMOD=3Dm
> CONFIG_DVB_CXD2880=3Dm
> =

> #
> # DVB-C (cable) frontends
> #
> CONFIG_DVB_VES1820=3Dm
> CONFIG_DVB_TDA10021=3Dm
> CONFIG_DVB_TDA10023=3Dm
> CONFIG_DVB_STV0297=3Dm
> =

> #
> # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
> #
> CONFIG_DVB_NXT200X=3Dm
> CONFIG_DVB_OR51211=3Dm
> CONFIG_DVB_OR51132=3Dm
> CONFIG_DVB_BCM3510=3Dm
> CONFIG_DVB_LGDT330X=3Dm
> CONFIG_DVB_LGDT3305=3Dm
> CONFIG_DVB_LGDT3306A=3Dm
> CONFIG_DVB_LG2160=3Dm
> CONFIG_DVB_S5H1409=3Dm
> CONFIG_DVB_AU8522=3Dm
> CONFIG_DVB_AU8522_DTV=3Dm
> CONFIG_DVB_AU8522_V4L=3Dm
> CONFIG_DVB_S5H1411=3Dm
> CONFIG_DVB_MXL692=3Dm
> =

> #
> # ISDB-T (terrestrial) frontends
> #
> CONFIG_DVB_S921=3Dm
> CONFIG_DVB_DIB8000=3Dm
> CONFIG_DVB_MB86A20S=3Dm
> =

> #
> # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
> #
> CONFIG_DVB_TC90522=3Dm
> CONFIG_DVB_MN88443X=3Dm
> =

> #
> # Digital terrestrial only tuners/PLL
> #
> CONFIG_DVB_PLL=3Dm
> CONFIG_DVB_TUNER_DIB0070=3Dm
> CONFIG_DVB_TUNER_DIB0090=3Dm
> =

> #
> # SEC control devices for DVB-S
> #
> CONFIG_DVB_DRX39XYJ=3Dm
> CONFIG_DVB_LNBH25=3Dm
> CONFIG_DVB_LNBH29=3Dm
> CONFIG_DVB_LNBP21=3Dm
> CONFIG_DVB_LNBP22=3Dm
> CONFIG_DVB_ISL6405=3Dm
> CONFIG_DVB_ISL6421=3Dm
> CONFIG_DVB_ISL6423=3Dm
> CONFIG_DVB_A8293=3Dm
> CONFIG_DVB_LGS8GL5=3Dm
> CONFIG_DVB_LGS8GXX=3Dm
> CONFIG_DVB_ATBM8830=3Dm
> CONFIG_DVB_TDA665x=3Dm
> CONFIG_DVB_IX2505V=3Dm
> CONFIG_DVB_M88RS2000=3Dm
> CONFIG_DVB_AF9033=3Dm
> CONFIG_DVB_HORUS3A=3Dm
> CONFIG_DVB_ASCOT2E=3Dm
> CONFIG_DVB_HELENE=3Dm
> =

> #
> # Common Interface (EN50221) controller drivers
> #
> CONFIG_DVB_CXD2099=3Dm
> CONFIG_DVB_SP2=3Dm
> # end of Customise DVB Frontends
> =

> #
> # Tools to develop new frontends
> #
> # CONFIG_DVB_DUMMY_FE is not set
> # end of Media ancillary drivers
> =

> #
> # Graphics support
> #
> # CONFIG_AGP is not set
> CONFIG_INTEL_GTT=3Dm
> CONFIG_VGA_ARB=3Dy
> CONFIG_VGA_ARB_MAX_GPUS=3D64
> CONFIG_VGA_SWITCHEROO=3Dy
> CONFIG_DRM=3Dm
> CONFIG_DRM_MIPI_DSI=3Dy
> CONFIG_DRM_DP_AUX_CHARDEV=3Dy
> # CONFIG_DRM_DEBUG_SELFTEST is not set
> CONFIG_DRM_KMS_HELPER=3Dm
> CONFIG_DRM_FBDEV_EMULATION=3Dy
> CONFIG_DRM_FBDEV_OVERALLOC=3D100
> CONFIG_DRM_LOAD_EDID_FIRMWARE=3Dy
> # CONFIG_DRM_DP_CEC is not set
> CONFIG_DRM_TTM=3Dm
> CONFIG_DRM_VRAM_HELPER=3Dm
> CONFIG_DRM_TTM_HELPER=3Dm
> CONFIG_DRM_GEM_SHMEM_HELPER=3Dy
> =

> #
> # I2C encoder or helper chips
> #
> CONFIG_DRM_I2C_CH7006=3Dm
> CONFIG_DRM_I2C_SIL164=3Dm
> # CONFIG_DRM_I2C_NXP_TDA998X is not set
> # CONFIG_DRM_I2C_NXP_TDA9950 is not set
> # end of I2C encoder or helper chips
> =

> #
> # ARM devices
> #
> # end of ARM devices
> =

> # CONFIG_DRM_RADEON is not set
> # CONFIG_DRM_AMDGPU is not set
> # CONFIG_DRM_NOUVEAU is not set
> CONFIG_DRM_I915=3Dm
> CONFIG_DRM_I915_FORCE_PROBE=3D""
> CONFIG_DRM_I915_CAPTURE_ERROR=3Dy
> CONFIG_DRM_I915_COMPRESS_ERROR=3Dy
> CONFIG_DRM_I915_USERPTR=3Dy
> CONFIG_DRM_I915_GVT=3Dy
> # CONFIG_DRM_I915_GVT_KVMGT is not set
> CONFIG_DRM_I915_REQUEST_TIMEOUT=3D20000
> CONFIG_DRM_I915_FENCE_TIMEOUT=3D10000
> CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=3D250
> CONFIG_DRM_I915_HEARTBEAT_INTERVAL=3D2500
> CONFIG_DRM_I915_PREEMPT_TIMEOUT=3D640
> CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=3D8000
> CONFIG_DRM_I915_STOP_TIMEOUT=3D100
> CONFIG_DRM_I915_TIMESLICE_DURATION=3D1
> # CONFIG_DRM_VGEM is not set
> # CONFIG_DRM_VKMS is not set
> # CONFIG_DRM_VMWGFX is not set
> CONFIG_DRM_GMA500=3Dm
> # CONFIG_DRM_UDL is not set
> CONFIG_DRM_AST=3Dm
> CONFIG_DRM_MGAG200=3Dm
> CONFIG_DRM_QXL=3Dm
> CONFIG_DRM_VIRTIO_GPU=3Dm
> CONFIG_DRM_PANEL=3Dy
> =

> #
> # Display Panels
> #
> # CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
> # CONFIG_DRM_PANEL_WIDECHIPS_WS2401 is not set
> # end of Display Panels
> =

> CONFIG_DRM_BRIDGE=3Dy
> CONFIG_DRM_PANEL_BRIDGE=3Dy
> =

> #
> # Display Interface Bridges
> #
> # CONFIG_DRM_ANALOGIX_ANX78XX is not set
> # end of Display Interface Bridges
> =

> # CONFIG_DRM_ETNAVIV is not set
> CONFIG_DRM_BOCHS=3Dm
> CONFIG_DRM_CIRRUS_QEMU=3Dm
> # CONFIG_DRM_GM12U320 is not set
> # CONFIG_DRM_SIMPLEDRM is not set
> # CONFIG_TINYDRM_HX8357D is not set
> # CONFIG_TINYDRM_ILI9225 is not set
> # CONFIG_TINYDRM_ILI9341 is not set
> # CONFIG_TINYDRM_ILI9486 is not set
> # CONFIG_TINYDRM_MI0283QT is not set
> # CONFIG_TINYDRM_REPAPER is not set
> # CONFIG_TINYDRM_ST7586 is not set
> # CONFIG_TINYDRM_ST7735R is not set
> # CONFIG_DRM_VBOXVIDEO is not set
> # CONFIG_DRM_GUD is not set
> # CONFIG_DRM_HYPERV is not set
> # CONFIG_DRM_LEGACY is not set
> CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
> =

> #
> # Frame buffer Devices
> #
> CONFIG_FB_CMDLINE=3Dy
> CONFIG_FB_NOTIFY=3Dy
> CONFIG_FB=3Dy
> # CONFIG_FIRMWARE_EDID is not set
> CONFIG_FB_BOOT_VESA_SUPPORT=3Dy
> CONFIG_FB_CFB_FILLRECT=3Dy
> CONFIG_FB_CFB_COPYAREA=3Dy
> CONFIG_FB_CFB_IMAGEBLIT=3Dy
> CONFIG_FB_SYS_FILLRECT=3Dm
> CONFIG_FB_SYS_COPYAREA=3Dm
> CONFIG_FB_SYS_IMAGEBLIT=3Dm
> # CONFIG_FB_FOREIGN_ENDIAN is not set
> CONFIG_FB_SYS_FOPS=3Dm
> CONFIG_FB_DEFERRED_IO=3Dy
> # CONFIG_FB_MODE_HELPERS is not set
> CONFIG_FB_TILEBLITTING=3Dy
> =

> #
> # Frame buffer hardware drivers
> #
> # CONFIG_FB_CIRRUS is not set
> # CONFIG_FB_PM2 is not set
> # CONFIG_FB_CYBER2000 is not set
> # CONFIG_FB_ARC is not set
> # CONFIG_FB_ASILIANT is not set
> # CONFIG_FB_IMSTT is not set
> # CONFIG_FB_VGA16 is not set
> # CONFIG_FB_UVESA is not set
> CONFIG_FB_VESA=3Dy
> CONFIG_FB_EFI=3Dy
> # CONFIG_FB_N411 is not set
> # CONFIG_FB_HGA is not set
> # CONFIG_FB_OPENCORES is not set
> # CONFIG_FB_S1D13XXX is not set
> # CONFIG_FB_NVIDIA is not set
> # CONFIG_FB_RIVA is not set
> # CONFIG_FB_I740 is not set
> # CONFIG_FB_LE80578 is not set
> # CONFIG_FB_MATROX is not set
> # CONFIG_FB_RADEON is not set
> # CONFIG_FB_ATY128 is not set
> # CONFIG_FB_ATY is not set
> # CONFIG_FB_S3 is not set
> # CONFIG_FB_SAVAGE is not set
> # CONFIG_FB_SIS is not set
> # CONFIG_FB_VIA is not set
> # CONFIG_FB_NEOMAGIC is not set
> # CONFIG_FB_KYRO is not set
> # CONFIG_FB_3DFX is not set
> # CONFIG_FB_VOODOO1 is not set
> # CONFIG_FB_VT8623 is not set
> # CONFIG_FB_TRIDENT is not set
> # CONFIG_FB_ARK is not set
> # CONFIG_FB_PM3 is not set
> # CONFIG_FB_CARMINE is not set
> # CONFIG_FB_SM501 is not set
> # CONFIG_FB_SMSCUFX is not set
> # CONFIG_FB_UDL is not set
> # CONFIG_FB_IBM_GXT4500 is not set
> # CONFIG_FB_VIRTUAL is not set
> # CONFIG_FB_METRONOME is not set
> # CONFIG_FB_MB862XX is not set
> CONFIG_FB_HYPERV=3Dm
> # CONFIG_FB_SIMPLE is not set
> # CONFIG_FB_SSD1307 is not set
> # CONFIG_FB_SM712 is not set
> # end of Frame buffer Devices
> =

> #
> # Backlight & LCD device support
> #
> CONFIG_LCD_CLASS_DEVICE=3Dm
> # CONFIG_LCD_L4F00242T03 is not set
> # CONFIG_LCD_LMS283GF05 is not set
> # CONFIG_LCD_LTV350QV is not set
> # CONFIG_LCD_ILI922X is not set
> # CONFIG_LCD_ILI9320 is not set
> # CONFIG_LCD_TDO24M is not set
> # CONFIG_LCD_VGG2432A4 is not set
> CONFIG_LCD_PLATFORM=3Dm
> # CONFIG_LCD_AMS369FG06 is not set
> # CONFIG_LCD_LMS501KF03 is not set
> # CONFIG_LCD_HX8357 is not set
> # CONFIG_LCD_OTM3225A is not set
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> # CONFIG_BACKLIGHT_KTD253 is not set
> # CONFIG_BACKLIGHT_PWM is not set
> CONFIG_BACKLIGHT_APPLE=3Dm
> # CONFIG_BACKLIGHT_QCOM_WLED is not set
> # CONFIG_BACKLIGHT_SAHARA is not set
> # CONFIG_BACKLIGHT_ADP8860 is not set
> # CONFIG_BACKLIGHT_ADP8870 is not set
> # CONFIG_BACKLIGHT_LM3630A is not set
> # CONFIG_BACKLIGHT_LM3639 is not set
> CONFIG_BACKLIGHT_LP855X=3Dm
> # CONFIG_BACKLIGHT_GPIO is not set
> # CONFIG_BACKLIGHT_LV5207LP is not set
> # CONFIG_BACKLIGHT_BD6107 is not set
> # CONFIG_BACKLIGHT_ARCXCNN is not set
> # end of Backlight & LCD device support
> =

> CONFIG_HDMI=3Dy
> =

> #
> # Console display driver support
> #
> CONFIG_VGA_CONSOLE=3Dy
> CONFIG_DUMMY_CONSOLE=3Dy
> CONFIG_DUMMY_CONSOLE_COLUMNS=3D80
> CONFIG_DUMMY_CONSOLE_ROWS=3D25
> CONFIG_FRAMEBUFFER_CONSOLE=3Dy
> CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
> CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
> # CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
> # end of Console display driver support
> =

> CONFIG_LOGO=3Dy
> # CONFIG_LOGO_LINUX_MONO is not set
> # CONFIG_LOGO_LINUX_VGA16 is not set
> CONFIG_LOGO_LINUX_CLUT224=3Dy
> # end of Graphics support
> =

> # CONFIG_SOUND is not set
> =

> #
> # HID support
> #
> CONFIG_HID=3Dy
> CONFIG_HID_BATTERY_STRENGTH=3Dy
> CONFIG_HIDRAW=3Dy
> CONFIG_UHID=3Dm
> CONFIG_HID_GENERIC=3Dy
> =

> #
> # Special HID drivers
> #
> CONFIG_HID_A4TECH=3Dm
> # CONFIG_HID_ACCUTOUCH is not set
> CONFIG_HID_ACRUX=3Dm
> # CONFIG_HID_ACRUX_FF is not set
> CONFIG_HID_APPLE=3Dm
> # CONFIG_HID_APPLEIR is not set
> CONFIG_HID_ASUS=3Dm
> CONFIG_HID_AUREAL=3Dm
> CONFIG_HID_BELKIN=3Dm
> # CONFIG_HID_BETOP_FF is not set
> # CONFIG_HID_BIGBEN_FF is not set
> CONFIG_HID_CHERRY=3Dm
> CONFIG_HID_CHICONY=3Dm
> # CONFIG_HID_CORSAIR is not set
> # CONFIG_HID_COUGAR is not set
> # CONFIG_HID_MACALLY is not set
> CONFIG_HID_CMEDIA=3Dm
> # CONFIG_HID_CP2112 is not set
> # CONFIG_HID_CREATIVE_SB0540 is not set
> CONFIG_HID_CYPRESS=3Dm
> CONFIG_HID_DRAGONRISE=3Dm
> # CONFIG_DRAGONRISE_FF is not set
> # CONFIG_HID_EMS_FF is not set
> # CONFIG_HID_ELAN is not set
> CONFIG_HID_ELECOM=3Dm
> # CONFIG_HID_ELO is not set
> CONFIG_HID_EZKEY=3Dm
> # CONFIG_HID_FT260 is not set
> CONFIG_HID_GEMBIRD=3Dm
> CONFIG_HID_GFRM=3Dm
> # CONFIG_HID_GLORIOUS is not set
> # CONFIG_HID_HOLTEK is not set
> # CONFIG_HID_VIVALDI is not set
> # CONFIG_HID_GT683R is not set
> CONFIG_HID_KEYTOUCH=3Dm
> CONFIG_HID_KYE=3Dm
> # CONFIG_HID_UCLOGIC is not set
> CONFIG_HID_WALTOP=3Dm
> # CONFIG_HID_VIEWSONIC is not set
> CONFIG_HID_GYRATION=3Dm
> CONFIG_HID_ICADE=3Dm
> CONFIG_HID_ITE=3Dm
> CONFIG_HID_JABRA=3Dm
> CONFIG_HID_TWINHAN=3Dm
> CONFIG_HID_KENSINGTON=3Dm
> CONFIG_HID_LCPOWER=3Dm
> CONFIG_HID_LED=3Dm
> CONFIG_HID_LENOVO=3Dm
> CONFIG_HID_LOGITECH=3Dm
> CONFIG_HID_LOGITECH_DJ=3Dm
> CONFIG_HID_LOGITECH_HIDPP=3Dm
> # CONFIG_LOGITECH_FF is not set
> # CONFIG_LOGIRUMBLEPAD2_FF is not set
> # CONFIG_LOGIG940_FF is not set
> # CONFIG_LOGIWHEELS_FF is not set
> CONFIG_HID_MAGICMOUSE=3Dy
> # CONFIG_HID_MALTRON is not set
> # CONFIG_HID_MAYFLASH is not set
> # CONFIG_HID_REDRAGON is not set
> CONFIG_HID_MICROSOFT=3Dm
> CONFIG_HID_MONTEREY=3Dm
> CONFIG_HID_MULTITOUCH=3Dm
> CONFIG_HID_NTI=3Dm
> # CONFIG_HID_NTRIG is not set
> CONFIG_HID_ORTEK=3Dm
> CONFIG_HID_PANTHERLORD=3Dm
> # CONFIG_PANTHERLORD_FF is not set
> # CONFIG_HID_PENMOUNT is not set
> CONFIG_HID_PETALYNX=3Dm
> CONFIG_HID_PICOLCD=3Dm
> CONFIG_HID_PICOLCD_FB=3Dy
> CONFIG_HID_PICOLCD_BACKLIGHT=3Dy
> CONFIG_HID_PICOLCD_LCD=3Dy
> CONFIG_HID_PICOLCD_LEDS=3Dy
> CONFIG_HID_PICOLCD_CIR=3Dy
> CONFIG_HID_PLANTRONICS=3Dm
> # CONFIG_HID_PLAYSTATION is not set
> CONFIG_HID_PRIMAX=3Dm
> # CONFIG_HID_RETRODE is not set
> # CONFIG_HID_ROCCAT is not set
> CONFIG_HID_SAITEK=3Dm
> CONFIG_HID_SAMSUNG=3Dm
> # CONFIG_HID_SEMITEK is not set
> # CONFIG_HID_SONY is not set
> CONFIG_HID_SPEEDLINK=3Dm
> # CONFIG_HID_STEAM is not set
> CONFIG_HID_STEELSERIES=3Dm
> CONFIG_HID_SUNPLUS=3Dm
> CONFIG_HID_RMI=3Dm
> CONFIG_HID_GREENASIA=3Dm
> # CONFIG_GREENASIA_FF is not set
> CONFIG_HID_HYPERV_MOUSE=3Dm
> CONFIG_HID_SMARTJOYPLUS=3Dm
> # CONFIG_SMARTJOYPLUS_FF is not set
> CONFIG_HID_TIVO=3Dm
> CONFIG_HID_TOPSEED=3Dm
> CONFIG_HID_THINGM=3Dm
> CONFIG_HID_THRUSTMASTER=3Dm
> # CONFIG_THRUSTMASTER_FF is not set
> # CONFIG_HID_UDRAW_PS3 is not set
> # CONFIG_HID_U2FZERO is not set
> # CONFIG_HID_WACOM is not set
> CONFIG_HID_WIIMOTE=3Dm
> CONFIG_HID_XINMO=3Dm
> CONFIG_HID_ZEROPLUS=3Dm
> # CONFIG_ZEROPLUS_FF is not set
> CONFIG_HID_ZYDACRON=3Dm
> CONFIG_HID_SENSOR_HUB=3Dy
> CONFIG_HID_SENSOR_CUSTOM_SENSOR=3Dm
> CONFIG_HID_ALPS=3Dm
> # CONFIG_HID_MCP2221 is not set
> # end of Special HID drivers
> =

> #
> # USB HID support
> #
> CONFIG_USB_HID=3Dy
> # CONFIG_HID_PID is not set
> # CONFIG_USB_HIDDEV is not set
> # end of USB HID support
> =

> #
> # I2C HID support
> #
> # CONFIG_I2C_HID_ACPI is not set
> # end of I2C HID support
> =

> #
> # Intel ISH HID support
> #
> CONFIG_INTEL_ISH_HID=3Dm
> # CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER is not set
> # end of Intel ISH HID support
> =

> #
> # AMD SFH HID Support
> #
> # CONFIG_AMD_SFH_HID is not set
> # end of AMD SFH HID Support
> # end of HID support
> =

> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> CONFIG_USB_SUPPORT=3Dy
> CONFIG_USB_COMMON=3Dy
> # CONFIG_USB_LED_TRIG is not set
> # CONFIG_USB_ULPI_BUS is not set
> # CONFIG_USB_CONN_GPIO is not set
> CONFIG_USB_ARCH_HAS_HCD=3Dy
> CONFIG_USB=3Dy
> CONFIG_USB_PCI=3Dy
> CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
> =

> #
> # Miscellaneous USB options
> #
> CONFIG_USB_DEFAULT_PERSIST=3Dy
> # CONFIG_USB_FEW_INIT_RETRIES is not set
> # CONFIG_USB_DYNAMIC_MINORS is not set
> # CONFIG_USB_OTG is not set
> # CONFIG_USB_OTG_PRODUCTLIST is not set
> CONFIG_USB_LEDS_TRIGGER_USBPORT=3Dy
> CONFIG_USB_AUTOSUSPEND_DELAY=3D2
> CONFIG_USB_MON=3Dy
> =

> #
> # USB Host Controller Drivers
> #
> # CONFIG_USB_C67X00_HCD is not set
> CONFIG_USB_XHCI_HCD=3Dy
> # CONFIG_USB_XHCI_DBGCAP is not set
> CONFIG_USB_XHCI_PCI=3Dy
> # CONFIG_USB_XHCI_PCI_RENESAS is not set
> # CONFIG_USB_XHCI_PLATFORM is not set
> CONFIG_USB_EHCI_HCD=3Dy
> CONFIG_USB_EHCI_ROOT_HUB_TT=3Dy
> CONFIG_USB_EHCI_TT_NEWSCHED=3Dy
> CONFIG_USB_EHCI_PCI=3Dy
> # CONFIG_USB_EHCI_FSL is not set
> # CONFIG_USB_EHCI_HCD_PLATFORM is not set
> # CONFIG_USB_OXU210HP_HCD is not set
> # CONFIG_USB_ISP116X_HCD is not set
> # CONFIG_USB_FOTG210_HCD is not set
> # CONFIG_USB_MAX3421_HCD is not set
> CONFIG_USB_OHCI_HCD=3Dy
> CONFIG_USB_OHCI_HCD_PCI=3Dy
> # CONFIG_USB_OHCI_HCD_PLATFORM is not set
> CONFIG_USB_UHCI_HCD=3Dy
> # CONFIG_USB_SL811_HCD is not set
> # CONFIG_USB_R8A66597_HCD is not set
> # CONFIG_USB_HCD_BCMA is not set
> # CONFIG_USB_HCD_TEST_MODE is not set
> =

> #
> # USB Device Class drivers
> #
> # CONFIG_USB_ACM is not set
> # CONFIG_USB_PRINTER is not set
> # CONFIG_USB_WDM is not set
> # CONFIG_USB_TMC is not set
> =

> #
> # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> #
> =

> #
> # also be needed; see USB_STORAGE Help for more info
> #
> CONFIG_USB_STORAGE=3Dm
> # CONFIG_USB_STORAGE_DEBUG is not set
> # CONFIG_USB_STORAGE_REALTEK is not set
> # CONFIG_USB_STORAGE_DATAFAB is not set
> # CONFIG_USB_STORAGE_FREECOM is not set
> # CONFIG_USB_STORAGE_ISD200 is not set
> # CONFIG_USB_STORAGE_USBAT is not set
> # CONFIG_USB_STORAGE_SDDR09 is not set
> # CONFIG_USB_STORAGE_SDDR55 is not set
> # CONFIG_USB_STORAGE_JUMPSHOT is not set
> # CONFIG_USB_STORAGE_ALAUDA is not set
> # CONFIG_USB_STORAGE_ONETOUCH is not set
> # CONFIG_USB_STORAGE_KARMA is not set
> # CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
> # CONFIG_USB_STORAGE_ENE_UB6250 is not set
> # CONFIG_USB_UAS is not set
> =

> #
> # USB Imaging devices
> #
> # CONFIG_USB_MDC800 is not set
> # CONFIG_USB_MICROTEK is not set
> # CONFIG_USBIP_CORE is not set
> # CONFIG_USB_CDNS_SUPPORT is not set
> # CONFIG_USB_MUSB_HDRC is not set
> # CONFIG_USB_DWC3 is not set
> # CONFIG_USB_DWC2 is not set
> # CONFIG_USB_CHIPIDEA is not set
> # CONFIG_USB_ISP1760 is not set
> =

> #
> # USB port drivers
> #
> # CONFIG_USB_USS720 is not set
> CONFIG_USB_SERIAL=3Dm
> CONFIG_USB_SERIAL_GENERIC=3Dy
> # CONFIG_USB_SERIAL_SIMPLE is not set
> # CONFIG_USB_SERIAL_AIRCABLE is not set
> # CONFIG_USB_SERIAL_ARK3116 is not set
> # CONFIG_USB_SERIAL_BELKIN is not set
> # CONFIG_USB_SERIAL_CH341 is not set
> # CONFIG_USB_SERIAL_WHITEHEAT is not set
> # CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
> # CONFIG_USB_SERIAL_CP210X is not set
> # CONFIG_USB_SERIAL_CYPRESS_M8 is not set
> # CONFIG_USB_SERIAL_EMPEG is not set
> # CONFIG_USB_SERIAL_FTDI_SIO is not set
> # CONFIG_USB_SERIAL_VISOR is not set
> # CONFIG_USB_SERIAL_IPAQ is not set
> # CONFIG_USB_SERIAL_IR is not set
> # CONFIG_USB_SERIAL_EDGEPORT is not set
> # CONFIG_USB_SERIAL_EDGEPORT_TI is not set
> # CONFIG_USB_SERIAL_F81232 is not set
> # CONFIG_USB_SERIAL_F8153X is not set
> # CONFIG_USB_SERIAL_GARMIN is not set
> # CONFIG_USB_SERIAL_IPW is not set
> # CONFIG_USB_SERIAL_IUU is not set
> # CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
> # CONFIG_USB_SERIAL_KEYSPAN is not set
> # CONFIG_USB_SERIAL_KLSI is not set
> # CONFIG_USB_SERIAL_KOBIL_SCT is not set
> # CONFIG_USB_SERIAL_MCT_U232 is not set
> # CONFIG_USB_SERIAL_METRO is not set
> # CONFIG_USB_SERIAL_MOS7720 is not set
> # CONFIG_USB_SERIAL_MOS7840 is not set
> # CONFIG_USB_SERIAL_MXUPORT is not set
> # CONFIG_USB_SERIAL_NAVMAN is not set
> # CONFIG_USB_SERIAL_PL2303 is not set
> # CONFIG_USB_SERIAL_OTI6858 is not set
> # CONFIG_USB_SERIAL_QCAUX is not set
> # CONFIG_USB_SERIAL_QUALCOMM is not set
> # CONFIG_USB_SERIAL_SPCP8X5 is not set
> # CONFIG_USB_SERIAL_SAFE is not set
> # CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
> # CONFIG_USB_SERIAL_SYMBOL is not set
> # CONFIG_USB_SERIAL_TI is not set
> # CONFIG_USB_SERIAL_CYBERJACK is not set
> # CONFIG_USB_SERIAL_OPTION is not set
> # CONFIG_USB_SERIAL_OMNINET is not set
> # CONFIG_USB_SERIAL_OPTICON is not set
> # CONFIG_USB_SERIAL_XSENS_MT is not set
> # CONFIG_USB_SERIAL_WISHBONE is not set
> # CONFIG_USB_SERIAL_SSU100 is not set
> # CONFIG_USB_SERIAL_QT2 is not set
> # CONFIG_USB_SERIAL_UPD78F0730 is not set
> # CONFIG_USB_SERIAL_XR is not set
> CONFIG_USB_SERIAL_DEBUG=3Dm
> =

> #
> # USB Miscellaneous drivers
> #
> # CONFIG_USB_EMI62 is not set
> # CONFIG_USB_EMI26 is not set
> # CONFIG_USB_ADUTUX is not set
> # CONFIG_USB_SEVSEG is not set
> # CONFIG_USB_LEGOTOWER is not set
> # CONFIG_USB_LCD is not set
> # CONFIG_USB_CYPRESS_CY7C63 is not set
> # CONFIG_USB_CYTHERM is not set
> # CONFIG_USB_IDMOUSE is not set
> # CONFIG_USB_FTDI_ELAN is not set
> # CONFIG_USB_APPLEDISPLAY is not set
> # CONFIG_APPLE_MFI_FASTCHARGE is not set
> # CONFIG_USB_SISUSBVGA is not set
> # CONFIG_USB_LD is not set
> # CONFIG_USB_TRANCEVIBRATOR is not set
> # CONFIG_USB_IOWARRIOR is not set
> # CONFIG_USB_TEST is not set
> # CONFIG_USB_EHSET_TEST_FIXTURE is not set
> # CONFIG_USB_ISIGHTFW is not set
> # CONFIG_USB_YUREX is not set
> # CONFIG_USB_EZUSB_FX2 is not set
> # CONFIG_USB_HUB_USB251XB is not set
> # CONFIG_USB_HSIC_USB3503 is not set
> # CONFIG_USB_HSIC_USB4604 is not set
> # CONFIG_USB_LINK_LAYER_TEST is not set
> # CONFIG_USB_CHAOSKEY is not set
> # CONFIG_USB_ATM is not set
> =

> #
> # USB Physical Layer drivers
> #
> # CONFIG_NOP_USB_XCEIV is not set
> # CONFIG_USB_GPIO_VBUS is not set
> # CONFIG_USB_ISP1301 is not set
> # end of USB Physical Layer drivers
> =

> # CONFIG_USB_GADGET is not set
> CONFIG_TYPEC=3Dy
> # CONFIG_TYPEC_TCPM is not set
> CONFIG_TYPEC_UCSI=3Dy
> # CONFIG_UCSI_CCG is not set
> CONFIG_UCSI_ACPI=3Dy
> # CONFIG_TYPEC_TPS6598X is not set
> # CONFIG_TYPEC_STUSB160X is not set
> =

> #
> # USB Type-C Multiplexer/DeMultiplexer Switch support
> #
> # CONFIG_TYPEC_MUX_PI3USB30532 is not set
> # end of USB Type-C Multiplexer/DeMultiplexer Switch support
> =

> #
> # USB Type-C Alternate Mode drivers
> #
> # CONFIG_TYPEC_DP_ALTMODE is not set
> # end of USB Type-C Alternate Mode drivers
> =

> # CONFIG_USB_ROLE_SWITCH is not set
> CONFIG_MMC=3Dm
> CONFIG_MMC_BLOCK=3Dm
> CONFIG_MMC_BLOCK_MINORS=3D8
> CONFIG_SDIO_UART=3Dm
> # CONFIG_MMC_TEST is not set
> =

> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> # CONFIG_MMC_DEBUG is not set
> CONFIG_MMC_SDHCI=3Dm
> CONFIG_MMC_SDHCI_IO_ACCESSORS=3Dy
> CONFIG_MMC_SDHCI_PCI=3Dm
> CONFIG_MMC_RICOH_MMC=3Dy
> CONFIG_MMC_SDHCI_ACPI=3Dm
> CONFIG_MMC_SDHCI_PLTFM=3Dm
> # CONFIG_MMC_SDHCI_F_SDH30 is not set
> # CONFIG_MMC_WBSD is not set
> # CONFIG_MMC_TIFM_SD is not set
> # CONFIG_MMC_SPI is not set
> # CONFIG_MMC_CB710 is not set
> # CONFIG_MMC_VIA_SDMMC is not set
> # CONFIG_MMC_VUB300 is not set
> # CONFIG_MMC_USHC is not set
> # CONFIG_MMC_USDHI6ROL0 is not set
> # CONFIG_MMC_REALTEK_PCI is not set
> CONFIG_MMC_CQHCI=3Dm
> # CONFIG_MMC_HSQ is not set
> # CONFIG_MMC_TOSHIBA_PCI is not set
> # CONFIG_MMC_MTK is not set
> # CONFIG_MMC_SDHCI_XENON is not set
> # CONFIG_MEMSTICK is not set
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> # CONFIG_LEDS_CLASS_FLASH is not set
> # CONFIG_LEDS_CLASS_MULTICOLOR is not set
> # CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
> =

> #
> # LED drivers
> #
> # CONFIG_LEDS_APU is not set
> CONFIG_LEDS_LM3530=3Dm
> # CONFIG_LEDS_LM3532 is not set
> # CONFIG_LEDS_LM3642 is not set
> # CONFIG_LEDS_PCA9532 is not set
> # CONFIG_LEDS_GPIO is not set
> CONFIG_LEDS_LP3944=3Dm
> # CONFIG_LEDS_LP3952 is not set
> # CONFIG_LEDS_LP50XX is not set
> CONFIG_LEDS_CLEVO_MAIL=3Dm
> # CONFIG_LEDS_PCA955X is not set
> # CONFIG_LEDS_PCA963X is not set
> # CONFIG_LEDS_DAC124S085 is not set
> # CONFIG_LEDS_PWM is not set
> # CONFIG_LEDS_BD2802 is not set
> CONFIG_LEDS_INTEL_SS4200=3Dm
> CONFIG_LEDS_LT3593=3Dm
> # CONFIG_LEDS_TCA6507 is not set
> # CONFIG_LEDS_TLC591XX is not set
> # CONFIG_LEDS_LM355x is not set
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> CONFIG_LEDS_BLINKM=3Dm
> CONFIG_LEDS_MLXCPLD=3Dm
> # CONFIG_LEDS_MLXREG is not set
> # CONFIG_LEDS_USER is not set
> # CONFIG_LEDS_NIC78BX is not set
> # CONFIG_LEDS_TI_LMU_COMMON is not set
> =

> #
> # Flash and Torch LED drivers
> #
> =

> #
> # LED Triggers
> #
> CONFIG_LEDS_TRIGGERS=3Dy
> CONFIG_LEDS_TRIGGER_TIMER=3Dm
> CONFIG_LEDS_TRIGGER_ONESHOT=3Dm
> # CONFIG_LEDS_TRIGGER_DISK is not set
> CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dm
> CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dm
> # CONFIG_LEDS_TRIGGER_CPU is not set
> # CONFIG_LEDS_TRIGGER_ACTIVITY is not set
> CONFIG_LEDS_TRIGGER_GPIO=3Dm
> CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dm
> =

> #
> # iptables trigger is under Netfilter config (LED target)
> #
> CONFIG_LEDS_TRIGGER_TRANSIENT=3Dm
> CONFIG_LEDS_TRIGGER_CAMERA=3Dm
> # CONFIG_LEDS_TRIGGER_PANIC is not set
> # CONFIG_LEDS_TRIGGER_NETDEV is not set
> # CONFIG_LEDS_TRIGGER_PATTERN is not set
> CONFIG_LEDS_TRIGGER_AUDIO=3Dm
> # CONFIG_LEDS_TRIGGER_TTY is not set
> # CONFIG_ACCESSIBILITY is not set
> # CONFIG_INFINIBAND is not set
> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> CONFIG_EDAC_SUPPORT=3Dy
> CONFIG_EDAC=3Dy
> CONFIG_EDAC_LEGACY_SYSFS=3Dy
> # CONFIG_EDAC_DEBUG is not set
> CONFIG_EDAC_DECODE_MCE=3Dm
> CONFIG_EDAC_GHES=3Dy
> CONFIG_EDAC_AMD64=3Dm
> CONFIG_EDAC_E752X=3Dm
> CONFIG_EDAC_I82975X=3Dm
> CONFIG_EDAC_I3000=3Dm
> CONFIG_EDAC_I3200=3Dm
> CONFIG_EDAC_IE31200=3Dm
> CONFIG_EDAC_X38=3Dm
> CONFIG_EDAC_I5400=3Dm
> CONFIG_EDAC_I7CORE=3Dm
> CONFIG_EDAC_I5000=3Dm
> CONFIG_EDAC_I5100=3Dm
> CONFIG_EDAC_I7300=3Dm
> CONFIG_EDAC_SBRIDGE=3Dm
> CONFIG_EDAC_SKX=3Dm
> # CONFIG_EDAC_I10NM is not set
> CONFIG_EDAC_PND2=3Dm
> # CONFIG_EDAC_IGEN6 is not set
> CONFIG_RTC_LIB=3Dy
> CONFIG_RTC_MC146818_LIB=3Dy
> CONFIG_RTC_CLASS=3Dy
> CONFIG_RTC_HCTOSYS=3Dy
> CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
> # CONFIG_RTC_SYSTOHC is not set
> # CONFIG_RTC_DEBUG is not set
> CONFIG_RTC_NVMEM=3Dy
> =

> #
> # RTC interfaces
> #
> CONFIG_RTC_INTF_SYSFS=3Dy
> CONFIG_RTC_INTF_PROC=3Dy
> CONFIG_RTC_INTF_DEV=3Dy
> # CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
> # CONFIG_RTC_DRV_TEST is not set
> =

> #
> # I2C RTC drivers
> #
> # CONFIG_RTC_DRV_ABB5ZES3 is not set
> # CONFIG_RTC_DRV_ABEOZ9 is not set
> # CONFIG_RTC_DRV_ABX80X is not set
> CONFIG_RTC_DRV_DS1307=3Dm
> # CONFIG_RTC_DRV_DS1307_CENTURY is not set
> CONFIG_RTC_DRV_DS1374=3Dm
> # CONFIG_RTC_DRV_DS1374_WDT is not set
> CONFIG_RTC_DRV_DS1672=3Dm
> CONFIG_RTC_DRV_MAX6900=3Dm
> CONFIG_RTC_DRV_RS5C372=3Dm
> CONFIG_RTC_DRV_ISL1208=3Dm
> CONFIG_RTC_DRV_ISL12022=3Dm
> CONFIG_RTC_DRV_X1205=3Dm
> CONFIG_RTC_DRV_PCF8523=3Dm
> # CONFIG_RTC_DRV_PCF85063 is not set
> # CONFIG_RTC_DRV_PCF85363 is not set
> CONFIG_RTC_DRV_PCF8563=3Dm
> CONFIG_RTC_DRV_PCF8583=3Dm
> CONFIG_RTC_DRV_M41T80=3Dm
> CONFIG_RTC_DRV_M41T80_WDT=3Dy
> CONFIG_RTC_DRV_BQ32K=3Dm
> # CONFIG_RTC_DRV_S35390A is not set
> CONFIG_RTC_DRV_FM3130=3Dm
> # CONFIG_RTC_DRV_RX8010 is not set
> CONFIG_RTC_DRV_RX8581=3Dm
> CONFIG_RTC_DRV_RX8025=3Dm
> CONFIG_RTC_DRV_EM3027=3Dm
> # CONFIG_RTC_DRV_RV3028 is not set
> # CONFIG_RTC_DRV_RV3032 is not set
> # CONFIG_RTC_DRV_RV8803 is not set
> # CONFIG_RTC_DRV_SD3078 is not set
> =

> #
> # SPI RTC drivers
> #
> # CONFIG_RTC_DRV_M41T93 is not set
> # CONFIG_RTC_DRV_M41T94 is not set
> # CONFIG_RTC_DRV_DS1302 is not set
> # CONFIG_RTC_DRV_DS1305 is not set
> # CONFIG_RTC_DRV_DS1343 is not set
> # CONFIG_RTC_DRV_DS1347 is not set
> # CONFIG_RTC_DRV_DS1390 is not set
> # CONFIG_RTC_DRV_MAX6916 is not set
> # CONFIG_RTC_DRV_R9701 is not set
> CONFIG_RTC_DRV_RX4581=3Dm
> # CONFIG_RTC_DRV_RS5C348 is not set
> # CONFIG_RTC_DRV_MAX6902 is not set
> # CONFIG_RTC_DRV_PCF2123 is not set
> # CONFIG_RTC_DRV_MCP795 is not set
> CONFIG_RTC_I2C_AND_SPI=3Dy
> =

> #
> # SPI and I2C RTC drivers
> #
> CONFIG_RTC_DRV_DS3232=3Dm
> CONFIG_RTC_DRV_DS3232_HWMON=3Dy
> # CONFIG_RTC_DRV_PCF2127 is not set
> CONFIG_RTC_DRV_RV3029C2=3Dm
> # CONFIG_RTC_DRV_RV3029_HWMON is not set
> # CONFIG_RTC_DRV_RX6110 is not set
> =

> #
> # Platform RTC drivers
> #
> CONFIG_RTC_DRV_CMOS=3Dy
> CONFIG_RTC_DRV_DS1286=3Dm
> CONFIG_RTC_DRV_DS1511=3Dm
> CONFIG_RTC_DRV_DS1553=3Dm
> # CONFIG_RTC_DRV_DS1685_FAMILY is not set
> CONFIG_RTC_DRV_DS1742=3Dm
> CONFIG_RTC_DRV_DS2404=3Dm
> CONFIG_RTC_DRV_STK17TA8=3Dm
> # CONFIG_RTC_DRV_M48T86 is not set
> CONFIG_RTC_DRV_M48T35=3Dm
> CONFIG_RTC_DRV_M48T59=3Dm
> CONFIG_RTC_DRV_MSM6242=3Dm
> CONFIG_RTC_DRV_BQ4802=3Dm
> CONFIG_RTC_DRV_RP5C01=3Dm
> CONFIG_RTC_DRV_V3020=3Dm
> =

> #
> # on-CPU RTC drivers
> #
> # CONFIG_RTC_DRV_FTRTC010 is not set
> =

> #
> # HID Sensor RTC drivers
> #
> # CONFIG_RTC_DRV_GOLDFISH is not set
> CONFIG_DMADEVICES=3Dy
> # CONFIG_DMADEVICES_DEBUG is not set
> =

> #
> # DMA Devices
> #
> CONFIG_DMA_ENGINE=3Dy
> CONFIG_DMA_VIRTUAL_CHANNELS=3Dy
> CONFIG_DMA_ACPI=3Dy
> # CONFIG_ALTERA_MSGDMA is not set
> CONFIG_INTEL_IDMA64=3Dm
> # CONFIG_INTEL_IDXD is not set
> # CONFIG_INTEL_IDXD_COMPAT is not set
> CONFIG_INTEL_IOATDMA=3Dm
> # CONFIG_PLX_DMA is not set
> # CONFIG_AMD_PTDMA is not set
> # CONFIG_QCOM_HIDMA_MGMT is not set
> # CONFIG_QCOM_HIDMA is not set
> CONFIG_DW_DMAC_CORE=3Dy
> CONFIG_DW_DMAC=3Dm
> CONFIG_DW_DMAC_PCI=3Dy
> # CONFIG_DW_EDMA is not set
> # CONFIG_DW_EDMA_PCIE is not set
> CONFIG_HSU_DMA=3Dy
> # CONFIG_SF_PDMA is not set
> # CONFIG_INTEL_LDMA is not set
> =

> #
> # DMA Clients
> #
> CONFIG_ASYNC_TX_DMA=3Dy
> CONFIG_DMATEST=3Dm
> CONFIG_DMA_ENGINE_RAID=3Dy
> =

> #
> # DMABUF options
> #
> CONFIG_SYNC_FILE=3Dy
> # CONFIG_SW_SYNC is not set
> # CONFIG_UDMABUF is not set
> # CONFIG_DMABUF_MOVE_NOTIFY is not set
> # CONFIG_DMABUF_DEBUG is not set
> # CONFIG_DMABUF_SELFTESTS is not set
> # CONFIG_DMABUF_HEAPS is not set
> # CONFIG_DMABUF_SYSFS_STATS is not set
> # end of DMABUF options
> =

> CONFIG_DCA=3Dm
> # CONFIG_AUXDISPLAY is not set
> # CONFIG_PANEL is not set
> CONFIG_UIO=3Dm
> CONFIG_UIO_CIF=3Dm
> CONFIG_UIO_PDRV_GENIRQ=3Dm
> # CONFIG_UIO_DMEM_GENIRQ is not set
> CONFIG_UIO_AEC=3Dm
> CONFIG_UIO_SERCOS3=3Dm
> CONFIG_UIO_PCI_GENERIC=3Dm
> # CONFIG_UIO_NETX is not set
> # CONFIG_UIO_PRUSS is not set
> # CONFIG_UIO_MF624 is not set
> CONFIG_UIO_HV_GENERIC=3Dm
> CONFIG_VFIO=3Dm
> CONFIG_VFIO_IOMMU_TYPE1=3Dm
> CONFIG_VFIO_VIRQFD=3Dm
> CONFIG_VFIO_NOIOMMU=3Dy
> CONFIG_VFIO_PCI_CORE=3Dm
> CONFIG_VFIO_PCI_MMAP=3Dy
> CONFIG_VFIO_PCI_INTX=3Dy
> CONFIG_VFIO_PCI=3Dm
> # CONFIG_VFIO_PCI_VGA is not set
> # CONFIG_VFIO_PCI_IGD is not set
> CONFIG_VFIO_MDEV=3Dm
> CONFIG_IRQ_BYPASS_MANAGER=3Dm
> # CONFIG_VIRT_DRIVERS is not set
> CONFIG_VIRTIO=3Dy
> CONFIG_VIRTIO_PCI_LIB=3Dy
> CONFIG_VIRTIO_MENU=3Dy
> CONFIG_VIRTIO_PCI=3Dy
> CONFIG_VIRTIO_PCI_LEGACY=3Dy
> # CONFIG_VIRTIO_PMEM is not set
> CONFIG_VIRTIO_BALLOON=3Dm
> CONFIG_VIRTIO_MEM=3Dm
> CONFIG_VIRTIO_INPUT=3Dm
> # CONFIG_VIRTIO_MMIO is not set
> CONFIG_VIRTIO_DMA_SHARED_BUFFER=3Dm
> # CONFIG_VDPA is not set
> CONFIG_VHOST_IOTLB=3Dm
> CONFIG_VHOST=3Dm
> CONFIG_VHOST_MENU=3Dy
> CONFIG_VHOST_NET=3Dm
> # CONFIG_VHOST_SCSI is not set
> CONFIG_VHOST_VSOCK=3Dm
> # CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set
> =

> #
> # Microsoft Hyper-V guest support
> #
> CONFIG_HYPERV=3Dm
> CONFIG_HYPERV_TIMER=3Dy
> CONFIG_HYPERV_UTILS=3Dm
> CONFIG_HYPERV_BALLOON=3Dm
> # end of Microsoft Hyper-V guest support
> =

> # CONFIG_GREYBUS is not set
> # CONFIG_COMEDI is not set
> # CONFIG_STAGING is not set
> CONFIG_X86_PLATFORM_DEVICES=3Dy
> CONFIG_ACPI_WMI=3Dm
> CONFIG_WMI_BMOF=3Dm
> # CONFIG_HUAWEI_WMI is not set
> # CONFIG_UV_SYSFS is not set
> CONFIG_MXM_WMI=3Dm
> # CONFIG_PEAQ_WMI is not set
> # CONFIG_XIAOMI_WMI is not set
> # CONFIG_GIGABYTE_WMI is not set
> CONFIG_ACERHDF=3Dm
> # CONFIG_ACER_WIRELESS is not set
> CONFIG_ACER_WMI=3Dm
> # CONFIG_AMD_PMC is not set
> # CONFIG_ADV_SWBUTTON is not set
> CONFIG_APPLE_GMUX=3Dm
> CONFIG_ASUS_LAPTOP=3Dm
> # CONFIG_ASUS_WIRELESS is not set
> CONFIG_ASUS_WMI=3Dm
> CONFIG_ASUS_NB_WMI=3Dm
> # CONFIG_MERAKI_MX100 is not set
> CONFIG_EEEPC_LAPTOP=3Dm
> CONFIG_EEEPC_WMI=3Dm
> # CONFIG_X86_PLATFORM_DRIVERS_DELL is not set
> CONFIG_AMILO_RFKILL=3Dm
> CONFIG_FUJITSU_LAPTOP=3Dm
> CONFIG_FUJITSU_TABLET=3Dm
> # CONFIG_GPD_POCKET_FAN is not set
> CONFIG_HP_ACCEL=3Dm
> # CONFIG_WIRELESS_HOTKEY is not set
> CONFIG_HP_WMI=3Dm
> # CONFIG_IBM_RTL is not set
> CONFIG_IDEAPAD_LAPTOP=3Dm
> CONFIG_SENSORS_HDAPS=3Dm
> CONFIG_THINKPAD_ACPI=3Dm
> # CONFIG_THINKPAD_ACPI_DEBUGFACILITIES is not set
> # CONFIG_THINKPAD_ACPI_DEBUG is not set
> # CONFIG_THINKPAD_ACPI_UNSAFE_LEDS is not set
> CONFIG_THINKPAD_ACPI_VIDEO=3Dy
> CONFIG_THINKPAD_ACPI_HOTKEY_POLL=3Dy
> # CONFIG_THINKPAD_LMI is not set
> CONFIG_X86_PLATFORM_DRIVERS_INTEL=3Dy
> # CONFIG_INTEL_ATOMISP2_PM is not set
> # CONFIG_INTEL_SAR_INT1092 is not set
> CONFIG_INTEL_PMC_CORE=3Dm
> =

> #
> # Intel Speed Select Technology interface support
> #
> # CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
> # end of Intel Speed Select Technology interface support
> =

> CONFIG_INTEL_WMI=3Dy
> # CONFIG_INTEL_WMI_SBL_FW_UPDATE is not set
> CONFIG_INTEL_WMI_THUNDERBOLT=3Dm
> CONFIG_INTEL_HID_EVENT=3Dm
> CONFIG_INTEL_VBTN=3Dm
> # CONFIG_INTEL_INT0002_VGPIO is not set
> CONFIG_INTEL_OAKTRAIL=3Dm
> # CONFIG_INTEL_PUNIT_IPC is not set
> CONFIG_INTEL_RST=3Dm
> # CONFIG_INTEL_SMARTCONNECT is not set
> CONFIG_INTEL_TURBO_MAX_3=3Dy
> # CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set
> CONFIG_MSI_LAPTOP=3Dm
> CONFIG_MSI_WMI=3Dm
> # CONFIG_PCENGINES_APU2 is not set
> CONFIG_SAMSUNG_LAPTOP=3Dm
> CONFIG_SAMSUNG_Q10=3Dm
> CONFIG_TOSHIBA_BT_RFKILL=3Dm
> # CONFIG_TOSHIBA_HAPS is not set
> # CONFIG_TOSHIBA_WMI is not set
> CONFIG_ACPI_CMPC=3Dm
> CONFIG_COMPAL_LAPTOP=3Dm
> # CONFIG_LG_LAPTOP is not set
> CONFIG_PANASONIC_LAPTOP=3Dm
> CONFIG_SONY_LAPTOP=3Dm
> CONFIG_SONYPI_COMPAT=3Dy
> # CONFIG_SYSTEM76_ACPI is not set
> CONFIG_TOPSTAR_LAPTOP=3Dm
> # CONFIG_I2C_MULTI_INSTANTIATE is not set
> CONFIG_MLX_PLATFORM=3Dm
> CONFIG_INTEL_IPS=3Dm
> # CONFIG_INTEL_SCU_PCI is not set
> # CONFIG_INTEL_SCU_PLATFORM is not set
> CONFIG_PMC_ATOM=3Dy
> # CONFIG_CHROME_PLATFORMS is not set
> CONFIG_MELLANOX_PLATFORM=3Dy
> CONFIG_MLXREG_HOTPLUG=3Dm
> # CONFIG_MLXREG_IO is not set
> CONFIG_SURFACE_PLATFORMS=3Dy
> # CONFIG_SURFACE3_WMI is not set
> # CONFIG_SURFACE_3_POWER_OPREGION is not set
> # CONFIG_SURFACE_GPE is not set
> # CONFIG_SURFACE_HOTPLUG is not set
> # CONFIG_SURFACE_PRO3_BUTTON is not set
> CONFIG_HAVE_CLK=3Dy
> CONFIG_HAVE_CLK_PREPARE=3Dy
> CONFIG_COMMON_CLK=3Dy
> =

> #
> # Clock driver for ARM Reference designs
> #
> # CONFIG_ICST is not set
> # CONFIG_CLK_SP810 is not set
> # end of Clock driver for ARM Reference designs
> =

> # CONFIG_LMK04832 is not set
> # CONFIG_COMMON_CLK_MAX9485 is not set
> # CONFIG_COMMON_CLK_SI5341 is not set
> # CONFIG_COMMON_CLK_SI5351 is not set
> # CONFIG_COMMON_CLK_SI544 is not set
> # CONFIG_COMMON_CLK_CDCE706 is not set
> # CONFIG_COMMON_CLK_CS2000_CP is not set
> # CONFIG_COMMON_CLK_PWM is not set
> # CONFIG_XILINX_VCU is not set
> CONFIG_HWSPINLOCK=3Dy
> =

> #
> # Clock Source drivers
> #
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_I8253_LOCK=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> # end of Clock Source drivers
> =

> CONFIG_MAILBOX=3Dy
> CONFIG_PCC=3Dy
> # CONFIG_ALTERA_MBOX is not set
> CONFIG_IOMMU_IOVA=3Dy
> CONFIG_IOASID=3Dy
> CONFIG_IOMMU_API=3Dy
> CONFIG_IOMMU_SUPPORT=3Dy
> =

> #
> # Generic IOMMU Pagetable Support
> #
> # end of Generic IOMMU Pagetable Support
> =

> # CONFIG_IOMMU_DEBUGFS is not set
> # CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
> CONFIG_IOMMU_DEFAULT_DMA_LAZY=3Dy
> # CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
> CONFIG_IOMMU_DMA=3Dy
> # CONFIG_AMD_IOMMU is not set
> CONFIG_DMAR_TABLE=3Dy
> CONFIG_INTEL_IOMMU=3Dy
> # CONFIG_INTEL_IOMMU_SVM is not set
> # CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
> CONFIG_INTEL_IOMMU_FLOPPY_WA=3Dy
> CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON=3Dy
> CONFIG_IRQ_REMAP=3Dy
> CONFIG_HYPERV_IOMMU=3Dy
> # CONFIG_VIRTIO_IOMMU is not set
> =

> #
> # Remoteproc drivers
> #
> # CONFIG_REMOTEPROC is not set
> # end of Remoteproc drivers
> =

> #
> # Rpmsg drivers
> #
> # CONFIG_RPMSG_QCOM_GLINK_RPM is not set
> # CONFIG_RPMSG_VIRTIO is not set
> # end of Rpmsg drivers
> =

> # CONFIG_SOUNDWIRE is not set
> =

> #
> # SOC (System On Chip) specific Drivers
> #
> =

> #
> # Amlogic SoC drivers
> #
> # end of Amlogic SoC drivers
> =

> #
> # Broadcom SoC drivers
> #
> # end of Broadcom SoC drivers
> =

> #
> # NXP/Freescale QorIQ SoC drivers
> #
> # end of NXP/Freescale QorIQ SoC drivers
> =

> #
> # i.MX SoC drivers
> #
> # end of i.MX SoC drivers
> =

> #
> # Enable LiteX SoC Builder specific drivers
> #
> # end of Enable LiteX SoC Builder specific drivers
> =

> #
> # Qualcomm SoC drivers
> #
> # end of Qualcomm SoC drivers
> =

> # CONFIG_SOC_TI is not set
> =

> #
> # Xilinx SoC drivers
> #
> # end of Xilinx SoC drivers
> # end of SOC (System On Chip) specific Drivers
> =

> # CONFIG_PM_DEVFREQ is not set
> # CONFIG_EXTCON is not set
> # CONFIG_MEMORY is not set
> # CONFIG_IIO is not set
> CONFIG_NTB=3Dm
> # CONFIG_NTB_MSI is not set
> # CONFIG_NTB_AMD is not set
> # CONFIG_NTB_IDT is not set
> # CONFIG_NTB_INTEL is not set
> # CONFIG_NTB_EPF is not set
> # CONFIG_NTB_SWITCHTEC is not set
> # CONFIG_NTB_PINGPONG is not set
> # CONFIG_NTB_TOOL is not set
> # CONFIG_NTB_PERF is not set
> # CONFIG_NTB_TRANSPORT is not set
> # CONFIG_VME_BUS is not set
> CONFIG_PWM=3Dy
> CONFIG_PWM_SYSFS=3Dy
> # CONFIG_PWM_DEBUG is not set
> # CONFIG_PWM_DWC is not set
> CONFIG_PWM_LPSS=3Dm
> CONFIG_PWM_LPSS_PCI=3Dm
> CONFIG_PWM_LPSS_PLATFORM=3Dm
> # CONFIG_PWM_PCA9685 is not set
> =

> #
> # IRQ chip support
> #
> # end of IRQ chip support
> =

> # CONFIG_IPACK_BUS is not set
> # CONFIG_RESET_CONTROLLER is not set
> =

> #
> # PHY Subsystem
> #
> # CONFIG_GENERIC_PHY is not set
> # CONFIG_USB_LGM_PHY is not set
> # CONFIG_PHY_CAN_TRANSCEIVER is not set
> # CONFIG_BCM_KONA_USB2_PHY is not set
> # CONFIG_PHY_PXA_28NM_HSIC is not set
> # CONFIG_PHY_PXA_28NM_USB2 is not set
> # CONFIG_PHY_INTEL_LGM_EMMC is not set
> # end of PHY Subsystem
> =

> CONFIG_POWERCAP=3Dy
> CONFIG_INTEL_RAPL_CORE=3Dm
> CONFIG_INTEL_RAPL=3Dm
> # CONFIG_IDLE_INJECT is not set
> # CONFIG_DTPM is not set
> # CONFIG_MCB is not set
> =

> #
> # Performance monitor support
> #
> # end of Performance monitor support
> =

> CONFIG_RAS=3Dy
> # CONFIG_RAS_CEC is not set
> # CONFIG_USB4 is not set
> =

> #
> # Android
> #
> # CONFIG_ANDROID is not set
> # end of Android
> =

> CONFIG_LIBNVDIMM=3Dm
> CONFIG_BLK_DEV_PMEM=3Dm
> CONFIG_ND_BLK=3Dm
> CONFIG_ND_CLAIM=3Dy
> CONFIG_ND_BTT=3Dm
> CONFIG_BTT=3Dy
> CONFIG_ND_PFN=3Dm
> CONFIG_NVDIMM_PFN=3Dy
> CONFIG_NVDIMM_DAX=3Dy
> CONFIG_NVDIMM_KEYS=3Dy
> CONFIG_DAX_DRIVER=3Dy
> CONFIG_DAX=3Dy
> CONFIG_DEV_DAX=3Dm
> CONFIG_DEV_DAX_PMEM=3Dm
> CONFIG_DEV_DAX_KMEM=3Dm
> CONFIG_DEV_DAX_PMEM_COMPAT=3Dm
> CONFIG_NVMEM=3Dy
> CONFIG_NVMEM_SYSFS=3Dy
> # CONFIG_NVMEM_RMEM is not set
> =

> #
> # HW tracing support
> #
> CONFIG_STM=3Dm
> # CONFIG_STM_PROTO_BASIC is not set
> # CONFIG_STM_PROTO_SYS_T is not set
> CONFIG_STM_DUMMY=3Dm
> CONFIG_STM_SOURCE_CONSOLE=3Dm
> CONFIG_STM_SOURCE_HEARTBEAT=3Dm
> CONFIG_STM_SOURCE_FTRACE=3Dm
> CONFIG_INTEL_TH=3Dm
> CONFIG_INTEL_TH_PCI=3Dm
> CONFIG_INTEL_TH_ACPI=3Dm
> CONFIG_INTEL_TH_GTH=3Dm
> CONFIG_INTEL_TH_STH=3Dm
> CONFIG_INTEL_TH_MSU=3Dm
> CONFIG_INTEL_TH_PTI=3Dm
> # CONFIG_INTEL_TH_DEBUG is not set
> # end of HW tracing support
> =

> # CONFIG_FPGA is not set
> # CONFIG_TEE is not set
> # CONFIG_UNISYS_VISORBUS is not set
> # CONFIG_SIOX is not set
> # CONFIG_SLIMBUS is not set
> # CONFIG_INTERCONNECT is not set
> # CONFIG_COUNTER is not set
> # CONFIG_MOST is not set
> # end of Device Drivers
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> # CONFIG_VALIDATE_FS_PARSER is not set
> CONFIG_FS_IOMAP=3Dy
> CONFIG_EXT2_FS=3Dm
> # CONFIG_EXT2_FS_XATTR is not set
> # CONFIG_EXT3_FS is not set
> CONFIG_EXT4_FS=3Dy
> CONFIG_EXT4_FS_POSIX_ACL=3Dy
> CONFIG_EXT4_FS_SECURITY=3Dy
> # CONFIG_EXT4_DEBUG is not set
> CONFIG_JBD2=3Dy
> # CONFIG_JBD2_DEBUG is not set
> CONFIG_FS_MBCACHE=3Dy
> # CONFIG_REISERFS_FS is not set
> # CONFIG_JFS_FS is not set
> CONFIG_XFS_FS=3Dm
> CONFIG_XFS_SUPPORT_V4=3Dy
> CONFIG_XFS_QUOTA=3Dy
> CONFIG_XFS_POSIX_ACL=3Dy
> CONFIG_XFS_RT=3Dy
> CONFIG_XFS_ONLINE_SCRUB=3Dy
> # CONFIG_XFS_ONLINE_REPAIR is not set
> CONFIG_XFS_DEBUG=3Dy
> CONFIG_XFS_ASSERT_FATAL=3Dy
> CONFIG_GFS2_FS=3Dm
> CONFIG_GFS2_FS_LOCKING_DLM=3Dy
> CONFIG_OCFS2_FS=3Dm
> CONFIG_OCFS2_FS_O2CB=3Dm
> CONFIG_OCFS2_FS_USERSPACE_CLUSTER=3Dm
> CONFIG_OCFS2_FS_STATS=3Dy
> CONFIG_OCFS2_DEBUG_MASKLOG=3Dy
> # CONFIG_OCFS2_DEBUG_FS is not set
> CONFIG_BTRFS_FS=3Dm
> CONFIG_BTRFS_FS_POSIX_ACL=3Dy
> # CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
> # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
> # CONFIG_BTRFS_DEBUG is not set
> # CONFIG_BTRFS_ASSERT is not set
> # CONFIG_BTRFS_FS_REF_VERIFY is not set
> # CONFIG_NILFS2_FS is not set
> CONFIG_F2FS_FS=3Dm
> CONFIG_F2FS_STAT_FS=3Dy
> CONFIG_F2FS_FS_XATTR=3Dy
> CONFIG_F2FS_FS_POSIX_ACL=3Dy
> # CONFIG_F2FS_FS_SECURITY is not set
> # CONFIG_F2FS_CHECK_FS is not set
> # CONFIG_F2FS_FAULT_INJECTION is not set
> # CONFIG_F2FS_FS_COMPRESSION is not set
> CONFIG_F2FS_IOSTAT=3Dy
> CONFIG_FS_DAX=3Dy
> CONFIG_FS_DAX_PMD=3Dy
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_EXPORTFS=3Dy
> CONFIG_EXPORTFS_BLOCK_OPS=3Dy
> CONFIG_FILE_LOCKING=3Dy
> CONFIG_FS_ENCRYPTION=3Dy
> CONFIG_FS_ENCRYPTION_ALGS=3Dy
> # CONFIG_FS_VERITY is not set
> CONFIG_FSNOTIFY=3Dy
> CONFIG_DNOTIFY=3Dy
> CONFIG_INOTIFY_USER=3Dy
> CONFIG_FANOTIFY=3Dy
> CONFIG_FANOTIFY_ACCESS_PERMISSIONS=3Dy
> CONFIG_QUOTA=3Dy
> CONFIG_QUOTA_NETLINK_INTERFACE=3Dy
> CONFIG_PRINT_QUOTA_WARNING=3Dy
> # CONFIG_QUOTA_DEBUG is not set
> CONFIG_QUOTA_TREE=3Dy
> # CONFIG_QFMT_V1 is not set
> CONFIG_QFMT_V2=3Dy
> CONFIG_QUOTACTL=3Dy
> CONFIG_AUTOFS4_FS=3Dy
> CONFIG_AUTOFS_FS=3Dy
> CONFIG_FUSE_FS=3Dm
> CONFIG_CUSE=3Dm
> # CONFIG_VIRTIO_FS is not set
> CONFIG_OVERLAY_FS=3Dm
> # CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
> # CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
> # CONFIG_OVERLAY_FS_INDEX is not set
> # CONFIG_OVERLAY_FS_XINO_AUTO is not set
> # CONFIG_OVERLAY_FS_METACOPY is not set
> =

> #
> # Caches
> #
> CONFIG_NETFS_SUPPORT=3Dm
> CONFIG_NETFS_STATS=3Dy
> CONFIG_FSCACHE=3Dm
> CONFIG_FSCACHE_STATS=3Dy
> # CONFIG_FSCACHE_DEBUG is not set
> CONFIG_CACHEFILES=3Dm
> # CONFIG_CACHEFILES_DEBUG is not set
> # end of Caches
> =

> #
> # CD-ROM/DVD Filesystems
> #
> CONFIG_ISO9660_FS=3Dm
> CONFIG_JOLIET=3Dy
> CONFIG_ZISOFS=3Dy
> CONFIG_UDF_FS=3Dm
> # end of CD-ROM/DVD Filesystems
> =

> #
> # DOS/FAT/EXFAT/NT Filesystems
> #
> CONFIG_FAT_FS=3Dm
> CONFIG_MSDOS_FS=3Dm
> CONFIG_VFAT_FS=3Dm
> CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> CONFIG_FAT_DEFAULT_IOCHARSET=3D"ascii"
> # CONFIG_FAT_DEFAULT_UTF8 is not set
> # CONFIG_EXFAT_FS is not set
> # CONFIG_NTFS_FS is not set
> # CONFIG_NTFS3_FS is not set
> # end of DOS/FAT/EXFAT/NT Filesystems
> =

> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=3Dy
> CONFIG_PROC_KCORE=3Dy
> CONFIG_PROC_VMCORE=3Dy
> CONFIG_PROC_VMCORE_DEVICE_DUMP=3Dy
> CONFIG_PROC_SYSCTL=3Dy
> CONFIG_PROC_PAGE_MONITOR=3Dy
> CONFIG_PROC_CHILDREN=3Dy
> CONFIG_PROC_PID_ARCH_STATUS=3Dy
> CONFIG_KERNFS=3Dy
> CONFIG_SYSFS=3Dy
> CONFIG_TMPFS=3Dy
> CONFIG_TMPFS_POSIX_ACL=3Dy
> CONFIG_TMPFS_XATTR=3Dy
> # CONFIG_TMPFS_INODE64 is not set
> CONFIG_HUGETLBFS=3Dy
> CONFIG_HUGETLB_PAGE=3Dy
> CONFIG_HUGETLB_PAGE_FREE_VMEMMAP=3Dy
> # CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON is not set
> CONFIG_MEMFD_CREATE=3Dy
> CONFIG_ARCH_HAS_GIGANTIC_PAGE=3Dy
> CONFIG_CONFIGFS_FS=3Dy
> CONFIG_EFIVAR_FS=3Dy
> # end of Pseudo filesystems
> =

> CONFIG_MISC_FILESYSTEMS=3Dy
> # CONFIG_ORANGEFS_FS is not set
> # CONFIG_ADFS_FS is not set
> # CONFIG_AFFS_FS is not set
> # CONFIG_ECRYPT_FS is not set
> # CONFIG_HFS_FS is not set
> # CONFIG_HFSPLUS_FS is not set
> # CONFIG_BEFS_FS is not set
> # CONFIG_BFS_FS is not set
> # CONFIG_EFS_FS is not set
> CONFIG_CRAMFS=3Dm
> CONFIG_CRAMFS_BLOCKDEV=3Dy
> CONFIG_SQUASHFS=3Dm
> # CONFIG_SQUASHFS_FILE_CACHE is not set
> CONFIG_SQUASHFS_FILE_DIRECT=3Dy
> # CONFIG_SQUASHFS_DECOMP_SINGLE is not set
> # CONFIG_SQUASHFS_DECOMP_MULTI is not set
> CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=3Dy
> CONFIG_SQUASHFS_XATTR=3Dy
> CONFIG_SQUASHFS_ZLIB=3Dy
> # CONFIG_SQUASHFS_LZ4 is not set
> CONFIG_SQUASHFS_LZO=3Dy
> CONFIG_SQUASHFS_XZ=3Dy
> # CONFIG_SQUASHFS_ZSTD is not set
> # CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
> # CONFIG_SQUASHFS_EMBEDDED is not set
> CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3D3
> # CONFIG_VXFS_FS is not set
> # CONFIG_MINIX_FS is not set
> # CONFIG_OMFS_FS is not set
> # CONFIG_HPFS_FS is not set
> # CONFIG_QNX4FS_FS is not set
> # CONFIG_QNX6FS_FS is not set
> # CONFIG_ROMFS_FS is not set
> CONFIG_PSTORE=3Dy
> CONFIG_PSTORE_DEFAULT_KMSG_BYTES=3D10240
> CONFIG_PSTORE_DEFLATE_COMPRESS=3Dy
> # CONFIG_PSTORE_LZO_COMPRESS is not set
> # CONFIG_PSTORE_LZ4_COMPRESS is not set
> # CONFIG_PSTORE_LZ4HC_COMPRESS is not set
> # CONFIG_PSTORE_842_COMPRESS is not set
> # CONFIG_PSTORE_ZSTD_COMPRESS is not set
> CONFIG_PSTORE_COMPRESS=3Dy
> CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=3Dy
> CONFIG_PSTORE_COMPRESS_DEFAULT=3D"deflate"
> # CONFIG_PSTORE_CONSOLE is not set
> # CONFIG_PSTORE_PMSG is not set
> # CONFIG_PSTORE_FTRACE is not set
> CONFIG_PSTORE_RAM=3Dm
> # CONFIG_SYSV_FS is not set
> # CONFIG_UFS_FS is not set
> # CONFIG_EROFS_FS is not set
> CONFIG_NETWORK_FILESYSTEMS=3Dy
> CONFIG_NFS_FS=3Dy
> # CONFIG_NFS_V2 is not set
> CONFIG_NFS_V3=3Dy
> CONFIG_NFS_V3_ACL=3Dy
> CONFIG_NFS_V4=3Dm
> # CONFIG_NFS_SWAP is not set
> CONFIG_NFS_V4_1=3Dy
> CONFIG_NFS_V4_2=3Dy
> CONFIG_PNFS_FILE_LAYOUT=3Dm
> CONFIG_PNFS_BLOCK=3Dm
> CONFIG_PNFS_FLEXFILE_LAYOUT=3Dm
> CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN=3D"kernel.org"
> # CONFIG_NFS_V4_1_MIGRATION is not set
> CONFIG_NFS_V4_SECURITY_LABEL=3Dy
> CONFIG_ROOT_NFS=3Dy
> # CONFIG_NFS_USE_LEGACY_DNS is not set
> CONFIG_NFS_USE_KERNEL_DNS=3Dy
> CONFIG_NFS_DEBUG=3Dy
> CONFIG_NFS_DISABLE_UDP_SUPPORT=3Dy
> # CONFIG_NFS_V4_2_READ_PLUS is not set
> CONFIG_NFSD=3Dm
> CONFIG_NFSD_V2_ACL=3Dy
> CONFIG_NFSD_V3=3Dy
> CONFIG_NFSD_V3_ACL=3Dy
> CONFIG_NFSD_V4=3Dy
> CONFIG_NFSD_PNFS=3Dy
> # CONFIG_NFSD_BLOCKLAYOUT is not set
> CONFIG_NFSD_SCSILAYOUT=3Dy
> # CONFIG_NFSD_FLEXFILELAYOUT is not set
> # CONFIG_NFSD_V4_2_INTER_SSC is not set
> CONFIG_NFSD_V4_SECURITY_LABEL=3Dy
> CONFIG_GRACE_PERIOD=3Dy
> CONFIG_LOCKD=3Dy
> CONFIG_LOCKD_V4=3Dy
> CONFIG_NFS_ACL_SUPPORT=3Dy
> CONFIG_NFS_COMMON=3Dy
> CONFIG_NFS_V4_2_SSC_HELPER=3Dy
> CONFIG_SUNRPC=3Dy
> CONFIG_SUNRPC_GSS=3Dm
> CONFIG_SUNRPC_BACKCHANNEL=3Dy
> CONFIG_RPCSEC_GSS_KRB5=3Dm
> # CONFIG_SUNRPC_DISABLE_INSECURE_ENCTYPES is not set
> CONFIG_SUNRPC_DEBUG=3Dy
> CONFIG_CEPH_FS=3Dm
> # CONFIG_CEPH_FSCACHE is not set
> CONFIG_CEPH_FS_POSIX_ACL=3Dy
> # CONFIG_CEPH_FS_SECURITY_LABEL is not set
> CONFIG_CIFS=3Dm
> CONFIG_CIFS_STATS2=3Dy
> CONFIG_CIFS_ALLOW_INSECURE_LEGACY=3Dy
> CONFIG_CIFS_UPCALL=3Dy
> CONFIG_CIFS_XATTR=3Dy
> CONFIG_CIFS_POSIX=3Dy
> CONFIG_CIFS_DEBUG=3Dy
> # CONFIG_CIFS_DEBUG2 is not set
> # CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
> CONFIG_CIFS_DFS_UPCALL=3Dy
> # CONFIG_CIFS_SWN_UPCALL is not set
> # CONFIG_CIFS_FSCACHE is not set
> # CONFIG_SMB_SERVER is not set
> CONFIG_SMBFS_COMMON=3Dm
> # CONFIG_CODA_FS is not set
> # CONFIG_AFS_FS is not set
> # CONFIG_9P_FS is not set
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"utf8"
> CONFIG_NLS_CODEPAGE_437=3Dy
> CONFIG_NLS_CODEPAGE_737=3Dm
> CONFIG_NLS_CODEPAGE_775=3Dm
> CONFIG_NLS_CODEPAGE_850=3Dm
> CONFIG_NLS_CODEPAGE_852=3Dm
> CONFIG_NLS_CODEPAGE_855=3Dm
> CONFIG_NLS_CODEPAGE_857=3Dm
> CONFIG_NLS_CODEPAGE_860=3Dm
> CONFIG_NLS_CODEPAGE_861=3Dm
> CONFIG_NLS_CODEPAGE_862=3Dm
> CONFIG_NLS_CODEPAGE_863=3Dm
> CONFIG_NLS_CODEPAGE_864=3Dm
> CONFIG_NLS_CODEPAGE_865=3Dm
> CONFIG_NLS_CODEPAGE_866=3Dm
> CONFIG_NLS_CODEPAGE_869=3Dm
> CONFIG_NLS_CODEPAGE_936=3Dm
> CONFIG_NLS_CODEPAGE_950=3Dm
> CONFIG_NLS_CODEPAGE_932=3Dm
> CONFIG_NLS_CODEPAGE_949=3Dm
> CONFIG_NLS_CODEPAGE_874=3Dm
> CONFIG_NLS_ISO8859_8=3Dm
> CONFIG_NLS_CODEPAGE_1250=3Dm
> CONFIG_NLS_CODEPAGE_1251=3Dm
> CONFIG_NLS_ASCII=3Dy
> CONFIG_NLS_ISO8859_1=3Dm
> CONFIG_NLS_ISO8859_2=3Dm
> CONFIG_NLS_ISO8859_3=3Dm
> CONFIG_NLS_ISO8859_4=3Dm
> CONFIG_NLS_ISO8859_5=3Dm
> CONFIG_NLS_ISO8859_6=3Dm
> CONFIG_NLS_ISO8859_7=3Dm
> CONFIG_NLS_ISO8859_9=3Dm
> CONFIG_NLS_ISO8859_13=3Dm
> CONFIG_NLS_ISO8859_14=3Dm
> CONFIG_NLS_ISO8859_15=3Dm
> CONFIG_NLS_KOI8_R=3Dm
> CONFIG_NLS_KOI8_U=3Dm
> CONFIG_NLS_MAC_ROMAN=3Dm
> CONFIG_NLS_MAC_CELTIC=3Dm
> CONFIG_NLS_MAC_CENTEURO=3Dm
> CONFIG_NLS_MAC_CROATIAN=3Dm
> CONFIG_NLS_MAC_CYRILLIC=3Dm
> CONFIG_NLS_MAC_GAELIC=3Dm
> CONFIG_NLS_MAC_GREEK=3Dm
> CONFIG_NLS_MAC_ICELAND=3Dm
> CONFIG_NLS_MAC_INUIT=3Dm
> CONFIG_NLS_MAC_ROMANIAN=3Dm
> CONFIG_NLS_MAC_TURKISH=3Dm
> CONFIG_NLS_UTF8=3Dm
> CONFIG_DLM=3Dm
> CONFIG_DLM_DEBUG=3Dy
> # CONFIG_UNICODE is not set
> CONFIG_IO_WQ=3Dy
> # end of File systems
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> # CONFIG_KEYS_REQUEST_CACHE is not set
> CONFIG_PERSISTENT_KEYRINGS=3Dy
> CONFIG_TRUSTED_KEYS=3Dy
> CONFIG_ENCRYPTED_KEYS=3Dy
> # CONFIG_KEY_DH_OPERATIONS is not set
> # CONFIG_SECURITY_DMESG_RESTRICT is not set
> CONFIG_SECURITY=3Dy
> CONFIG_SECURITY_WRITABLE_HOOKS=3Dy
> CONFIG_SECURITYFS=3Dy
> CONFIG_SECURITY_NETWORK=3Dy
> CONFIG_PAGE_TABLE_ISOLATION=3Dy
> CONFIG_SECURITY_NETWORK_XFRM=3Dy
> CONFIG_SECURITY_PATH=3Dy
> CONFIG_INTEL_TXT=3Dy
> CONFIG_LSM_MMAP_MIN_ADDR=3D65535
> CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
> CONFIG_HARDENED_USERCOPY=3Dy
> CONFIG_HARDENED_USERCOPY_FALLBACK=3Dy
> CONFIG_FORTIFY_SOURCE=3Dy
> # CONFIG_STATIC_USERMODEHELPER is not set
> CONFIG_SECURITY_SELINUX=3Dy
> CONFIG_SECURITY_SELINUX_BOOTPARAM=3Dy
> CONFIG_SECURITY_SELINUX_DISABLE=3Dy
> CONFIG_SECURITY_SELINUX_DEVELOP=3Dy
> CONFIG_SECURITY_SELINUX_AVC_STATS=3Dy
> CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=3D1
> CONFIG_SECURITY_SELINUX_SIDTAB_HASH_BITS=3D9
> CONFIG_SECURITY_SELINUX_SID2STR_CACHE_SIZE=3D256
> # CONFIG_SECURITY_SMACK is not set
> # CONFIG_SECURITY_TOMOYO is not set
> CONFIG_SECURITY_APPARMOR=3Dy
> CONFIG_SECURITY_APPARMOR_HASH=3Dy
> CONFIG_SECURITY_APPARMOR_HASH_DEFAULT=3Dy
> # CONFIG_SECURITY_APPARMOR_DEBUG is not set
> # CONFIG_SECURITY_LOADPIN is not set
> CONFIG_SECURITY_YAMA=3Dy
> # CONFIG_SECURITY_SAFESETID is not set
> # CONFIG_SECURITY_LOCKDOWN_LSM is not set
> # CONFIG_SECURITY_LANDLOCK is not set
> CONFIG_INTEGRITY=3Dy
> CONFIG_INTEGRITY_SIGNATURE=3Dy
> CONFIG_INTEGRITY_ASYMMETRIC_KEYS=3Dy
> CONFIG_INTEGRITY_TRUSTED_KEYRING=3Dy
> # CONFIG_INTEGRITY_PLATFORM_KEYRING is not set
> CONFIG_INTEGRITY_AUDIT=3Dy
> CONFIG_IMA=3Dy
> CONFIG_IMA_MEASURE_PCR_IDX=3D10
> CONFIG_IMA_LSM_RULES=3Dy
> # CONFIG_IMA_TEMPLATE is not set
> CONFIG_IMA_NG_TEMPLATE=3Dy
> # CONFIG_IMA_SIG_TEMPLATE is not set
> CONFIG_IMA_DEFAULT_TEMPLATE=3D"ima-ng"
> CONFIG_IMA_DEFAULT_HASH_SHA1=3Dy
> # CONFIG_IMA_DEFAULT_HASH_SHA256 is not set
> # CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
> CONFIG_IMA_DEFAULT_HASH=3D"sha1"
> # CONFIG_IMA_WRITE_POLICY is not set
> # CONFIG_IMA_READ_POLICY is not set
> CONFIG_IMA_APPRAISE=3Dy
> # CONFIG_IMA_ARCH_POLICY is not set
> # CONFIG_IMA_APPRAISE_BUILD_POLICY is not set
> CONFIG_IMA_APPRAISE_BOOTPARAM=3Dy
> # CONFIG_IMA_APPRAISE_MODSIG is not set
> CONFIG_IMA_TRUSTED_KEYRING=3Dy
> # CONFIG_IMA_BLACKLIST_KEYRING is not set
> # CONFIG_IMA_LOAD_X509 is not set
> CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS=3Dy
> CONFIG_IMA_QUEUE_EARLY_BOOT_KEYS=3Dy
> # CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
> # CONFIG_IMA_DISABLE_HTABLE is not set
> CONFIG_EVM=3Dy
> CONFIG_EVM_ATTR_FSUUID=3Dy
> # CONFIG_EVM_ADD_XATTRS is not set
> # CONFIG_EVM_LOAD_X509 is not set
> CONFIG_DEFAULT_SECURITY_SELINUX=3Dy
> # CONFIG_DEFAULT_SECURITY_APPARMOR is not set
> # CONFIG_DEFAULT_SECURITY_DAC is not set
> CONFIG_LSM=3D"landlock,lockdown,yama,loadpin,safesetid,integrity,selinux,=
smack,tomoyo,apparmor,bpf"
> =

> #
> # Kernel hardening options
> #
> =

> #
> # Memory initialization
> #
> CONFIG_INIT_STACK_NONE=3Dy
> # CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
> # CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
> # end of Memory initialization
> # end of Kernel hardening options
> # end of Security options
> =

> CONFIG_XOR_BLOCKS=3Dm
> CONFIG_ASYNC_CORE=3Dm
> CONFIG_ASYNC_MEMCPY=3Dm
> CONFIG_ASYNC_XOR=3Dm
> CONFIG_ASYNC_PQ=3Dm
> CONFIG_ASYNC_RAID6_RECOV=3Dm
> CONFIG_CRYPTO=3Dy
> =

> #
> # Crypto core or helper
> #
> CONFIG_CRYPTO_ALGAPI=3Dy
> CONFIG_CRYPTO_ALGAPI2=3Dy
> CONFIG_CRYPTO_AEAD=3Dy
> CONFIG_CRYPTO_AEAD2=3Dy
> CONFIG_CRYPTO_SKCIPHER=3Dy
> CONFIG_CRYPTO_SKCIPHER2=3Dy
> CONFIG_CRYPTO_HASH=3Dy
> CONFIG_CRYPTO_HASH2=3Dy
> CONFIG_CRYPTO_RNG=3Dy
> CONFIG_CRYPTO_RNG2=3Dy
> CONFIG_CRYPTO_RNG_DEFAULT=3Dy
> CONFIG_CRYPTO_AKCIPHER2=3Dy
> CONFIG_CRYPTO_AKCIPHER=3Dy
> CONFIG_CRYPTO_KPP2=3Dy
> CONFIG_CRYPTO_KPP=3Dm
> CONFIG_CRYPTO_ACOMP2=3Dy
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> CONFIG_CRYPTO_USER=3Dm
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dy
> CONFIG_CRYPTO_NULL2=3Dy
> CONFIG_CRYPTO_PCRYPT=3Dm
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_AUTHENC=3Dm
> CONFIG_CRYPTO_TEST=3Dm
> CONFIG_CRYPTO_SIMD=3Dy
> =

> #
> # Public-key cryptography
> #
> CONFIG_CRYPTO_RSA=3Dy
> CONFIG_CRYPTO_DH=3Dm
> CONFIG_CRYPTO_ECC=3Dm
> CONFIG_CRYPTO_ECDH=3Dm
> # CONFIG_CRYPTO_ECDSA is not set
> # CONFIG_CRYPTO_ECRDSA is not set
> # CONFIG_CRYPTO_SM2 is not set
> # CONFIG_CRYPTO_CURVE25519 is not set
> # CONFIG_CRYPTO_CURVE25519_X86 is not set
> =

> #
> # Authenticated Encryption with Associated Data
> #
> CONFIG_CRYPTO_CCM=3Dm
> CONFIG_CRYPTO_GCM=3Dy
> CONFIG_CRYPTO_CHACHA20POLY1305=3Dm
> # CONFIG_CRYPTO_AEGIS128 is not set
> # CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
> CONFIG_CRYPTO_SEQIV=3Dy
> CONFIG_CRYPTO_ECHAINIV=3Dm
> =

> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=3Dy
> CONFIG_CRYPTO_CFB=3Dy
> CONFIG_CRYPTO_CTR=3Dy
> CONFIG_CRYPTO_CTS=3Dm
> CONFIG_CRYPTO_ECB=3Dy
> CONFIG_CRYPTO_LRW=3Dm
> # CONFIG_CRYPTO_OFB is not set
> CONFIG_CRYPTO_PCBC=3Dm
> CONFIG_CRYPTO_XTS=3Dm
> # CONFIG_CRYPTO_KEYWRAP is not set
> # CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
> # CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
> # CONFIG_CRYPTO_ADIANTUM is not set
> CONFIG_CRYPTO_ESSIV=3Dm
> =

> #
> # Hash modes
> #
> CONFIG_CRYPTO_CMAC=3Dm
> CONFIG_CRYPTO_HMAC=3Dy
> CONFIG_CRYPTO_XCBC=3Dm
> CONFIG_CRYPTO_VMAC=3Dm
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dy
> CONFIG_CRYPTO_CRC32C_INTEL=3Dm
> CONFIG_CRYPTO_CRC32=3Dm
> CONFIG_CRYPTO_CRC32_PCLMUL=3Dm
> CONFIG_CRYPTO_XXHASH=3Dm
> CONFIG_CRYPTO_BLAKE2B=3Dm
> # CONFIG_CRYPTO_BLAKE2S is not set
> # CONFIG_CRYPTO_BLAKE2S_X86 is not set
> CONFIG_CRYPTO_CRCT10DIF=3Dy
> CONFIG_CRYPTO_CRCT10DIF_PCLMUL=3Dm
> CONFIG_CRYPTO_GHASH=3Dy
> CONFIG_CRYPTO_POLY1305=3Dm
> CONFIG_CRYPTO_POLY1305_X86_64=3Dm
> CONFIG_CRYPTO_MD4=3Dm
> CONFIG_CRYPTO_MD5=3Dy
> CONFIG_CRYPTO_MICHAEL_MIC=3Dm
> CONFIG_CRYPTO_RMD160=3Dm
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA1_SSSE3=3Dy
> CONFIG_CRYPTO_SHA256_SSSE3=3Dy
> CONFIG_CRYPTO_SHA512_SSSE3=3Dm
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dy
> CONFIG_CRYPTO_SHA3=3Dm
> # CONFIG_CRYPTO_SM3 is not set
> # CONFIG_CRYPTO_STREEBOG is not set
> CONFIG_CRYPTO_WP512=3Dm
> CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=3Dm
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> # CONFIG_CRYPTO_AES_TI is not set
> CONFIG_CRYPTO_AES_NI_INTEL=3Dy
> CONFIG_CRYPTO_ANUBIS=3Dm
> CONFIG_CRYPTO_ARC4=3Dm
> CONFIG_CRYPTO_BLOWFISH=3Dm
> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dm
> CONFIG_CRYPTO_BLOWFISH_X86_64=3Dm
> CONFIG_CRYPTO_CAMELLIA=3Dm
> CONFIG_CRYPTO_CAMELLIA_X86_64=3Dm
> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=3Dm
> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=3Dm
> CONFIG_CRYPTO_CAST_COMMON=3Dm
> CONFIG_CRYPTO_CAST5=3Dm
> CONFIG_CRYPTO_CAST5_AVX_X86_64=3Dm
> CONFIG_CRYPTO_CAST6=3Dm
> CONFIG_CRYPTO_CAST6_AVX_X86_64=3Dm
> CONFIG_CRYPTO_DES=3Dm
> # CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
> CONFIG_CRYPTO_FCRYPT=3Dm
> CONFIG_CRYPTO_KHAZAD=3Dm
> CONFIG_CRYPTO_CHACHA20=3Dm
> CONFIG_CRYPTO_CHACHA20_X86_64=3Dm
> CONFIG_CRYPTO_SEED=3Dm
> CONFIG_CRYPTO_SERPENT=3Dm
> CONFIG_CRYPTO_SERPENT_SSE2_X86_64=3Dm
> CONFIG_CRYPTO_SERPENT_AVX_X86_64=3Dm
> CONFIG_CRYPTO_SERPENT_AVX2_X86_64=3Dm
> # CONFIG_CRYPTO_SM4 is not set
> # CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64 is not set
> # CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64 is not set
> CONFIG_CRYPTO_TEA=3Dm
> CONFIG_CRYPTO_TWOFISH=3Dm
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dm
> CONFIG_CRYPTO_TWOFISH_X86_64=3Dm
> CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dm
> CONFIG_CRYPTO_TWOFISH_AVX_X86_64=3Dm
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dy
> CONFIG_CRYPTO_LZO=3Dy
> # CONFIG_CRYPTO_842 is not set
> # CONFIG_CRYPTO_LZ4 is not set
> # CONFIG_CRYPTO_LZ4HC is not set
> # CONFIG_CRYPTO_ZSTD is not set
> =

> #
> # Random Number Generation
> #
> CONFIG_CRYPTO_ANSI_CPRNG=3Dm
> CONFIG_CRYPTO_DRBG_MENU=3Dy
> CONFIG_CRYPTO_DRBG_HMAC=3Dy
> CONFIG_CRYPTO_DRBG_HASH=3Dy
> CONFIG_CRYPTO_DRBG_CTR=3Dy
> CONFIG_CRYPTO_DRBG=3Dy
> CONFIG_CRYPTO_JITTERENTROPY=3Dy
> CONFIG_CRYPTO_USER_API=3Dy
> CONFIG_CRYPTO_USER_API_HASH=3Dy
> CONFIG_CRYPTO_USER_API_SKCIPHER=3Dy
> CONFIG_CRYPTO_USER_API_RNG=3Dy
> # CONFIG_CRYPTO_USER_API_RNG_CAVP is not set
> CONFIG_CRYPTO_USER_API_AEAD=3Dy
> CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=3Dy
> # CONFIG_CRYPTO_STATS is not set
> CONFIG_CRYPTO_HASH_INFO=3Dy
> =

> #
> # Crypto library routines
> #
> CONFIG_CRYPTO_LIB_AES=3Dy
> CONFIG_CRYPTO_LIB_ARC4=3Dm
> # CONFIG_CRYPTO_LIB_BLAKE2S is not set
> CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=3Dm
> CONFIG_CRYPTO_LIB_CHACHA_GENERIC=3Dm
> # CONFIG_CRYPTO_LIB_CHACHA is not set
> # CONFIG_CRYPTO_LIB_CURVE25519 is not set
> CONFIG_CRYPTO_LIB_DES=3Dm
> CONFIG_CRYPTO_LIB_POLY1305_RSIZE=3D11
> CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305=3Dm
> CONFIG_CRYPTO_LIB_POLY1305_GENERIC=3Dm
> # CONFIG_CRYPTO_LIB_POLY1305 is not set
> # CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
> CONFIG_CRYPTO_LIB_SHA256=3Dy
> CONFIG_CRYPTO_HW=3Dy
> CONFIG_CRYPTO_DEV_PADLOCK=3Dm
> CONFIG_CRYPTO_DEV_PADLOCK_AES=3Dm
> CONFIG_CRYPTO_DEV_PADLOCK_SHA=3Dm
> # CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
> # CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
> CONFIG_CRYPTO_DEV_CCP=3Dy
> CONFIG_CRYPTO_DEV_CCP_DD=3Dm
> CONFIG_CRYPTO_DEV_SP_CCP=3Dy
> CONFIG_CRYPTO_DEV_CCP_CRYPTO=3Dm
> CONFIG_CRYPTO_DEV_SP_PSP=3Dy
> # CONFIG_CRYPTO_DEV_CCP_DEBUGFS is not set
> CONFIG_CRYPTO_DEV_QAT=3Dm
> CONFIG_CRYPTO_DEV_QAT_DH895xCC=3Dm
> CONFIG_CRYPTO_DEV_QAT_C3XXX=3Dm
> CONFIG_CRYPTO_DEV_QAT_C62X=3Dm
> # CONFIG_CRYPTO_DEV_QAT_4XXX is not set
> CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=3Dm
> CONFIG_CRYPTO_DEV_QAT_C3XXXVF=3Dm
> CONFIG_CRYPTO_DEV_QAT_C62XVF=3Dm
> CONFIG_CRYPTO_DEV_NITROX=3Dm
> CONFIG_CRYPTO_DEV_NITROX_CNN55XX=3Dm
> # CONFIG_CRYPTO_DEV_VIRTIO is not set
> # CONFIG_CRYPTO_DEV_SAFEXCEL is not set
> # CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> # CONFIG_ASYMMETRIC_TPM_KEY_SUBTYPE is not set
> CONFIG_X509_CERTIFICATE_PARSER=3Dy
> # CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
> CONFIG_PKCS7_MESSAGE_PARSER=3Dy
> # CONFIG_PKCS7_TEST_KEY is not set
> CONFIG_SIGNED_PE_FILE_VERIFICATION=3Dy
> =

> #
> # Certificates for signature checking
> #
> CONFIG_MODULE_SIG_KEY=3D"certs/signing_key.pem"
> CONFIG_MODULE_SIG_KEY_TYPE_RSA=3Dy
> # CONFIG_MODULE_SIG_KEY_TYPE_ECDSA is not set
> CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> CONFIG_SYSTEM_TRUSTED_KEYS=3D""
> # CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
> # CONFIG_SECONDARY_TRUSTED_KEYRING is not set
> CONFIG_SYSTEM_BLACKLIST_KEYRING=3Dy
> CONFIG_SYSTEM_BLACKLIST_HASH_LIST=3D""
> # CONFIG_SYSTEM_REVOCATION_LIST is not set
> # end of Certificates for signature checking
> =

> CONFIG_BINARY_PRINTF=3Dy
> =

> #
> # Library routines
> #
> CONFIG_RAID6_PQ=3Dm
> CONFIG_RAID6_PQ_BENCHMARK=3Dy
> # CONFIG_PACKING is not set
> CONFIG_BITREVERSE=3Dy
> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> CONFIG_GENERIC_STRNLEN_USER=3Dy
> CONFIG_GENERIC_NET_UTILS=3Dy
> CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
> CONFIG_CORDIC=3Dm
> # CONFIG_PRIME_NUMBERS is not set
> CONFIG_RATIONAL=3Dy
> CONFIG_GENERIC_PCI_IOMAP=3Dy
> CONFIG_GENERIC_IOMAP=3Dy
> CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> CONFIG_ARCH_USE_SYM_ANNOTATIONS=3Dy
> CONFIG_CRC_CCITT=3Dy
> CONFIG_CRC16=3Dy
> CONFIG_CRC_T10DIF=3Dy
> CONFIG_CRC_ITU_T=3Dm
> CONFIG_CRC32=3Dy
> # CONFIG_CRC32_SELFTEST is not set
> CONFIG_CRC32_SLICEBY8=3Dy
> # CONFIG_CRC32_SLICEBY4 is not set
> # CONFIG_CRC32_SARWATE is not set
> # CONFIG_CRC32_BIT is not set
> # CONFIG_CRC64 is not set
> # CONFIG_CRC4 is not set
> CONFIG_CRC7=3Dm
> CONFIG_LIBCRC32C=3Dm
> CONFIG_CRC8=3Dm
> CONFIG_XXHASH=3Dy
> # CONFIG_RANDOM32_SELFTEST is not set
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_LZ4_DECOMPRESS=3Dy
> CONFIG_ZSTD_COMPRESS=3Dm
> CONFIG_ZSTD_DECOMPRESS=3Dy
> CONFIG_XZ_DEC=3Dy
> CONFIG_XZ_DEC_X86=3Dy
> CONFIG_XZ_DEC_POWERPC=3Dy
> CONFIG_XZ_DEC_IA64=3Dy
> CONFIG_XZ_DEC_ARM=3Dy
> CONFIG_XZ_DEC_ARMTHUMB=3Dy
> CONFIG_XZ_DEC_SPARC=3Dy
> CONFIG_XZ_DEC_BCJ=3Dy
> # CONFIG_XZ_DEC_TEST is not set
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_BZIP2=3Dy
> CONFIG_DECOMPRESS_LZMA=3Dy
> CONFIG_DECOMPRESS_XZ=3Dy
> CONFIG_DECOMPRESS_LZO=3Dy
> CONFIG_DECOMPRESS_LZ4=3Dy
> CONFIG_DECOMPRESS_ZSTD=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_REED_SOLOMON=3Dm
> CONFIG_REED_SOLOMON_ENC8=3Dy
> CONFIG_REED_SOLOMON_DEC8=3Dy
> CONFIG_TEXTSEARCH=3Dy
> CONFIG_TEXTSEARCH_KMP=3Dm
> CONFIG_TEXTSEARCH_BM=3Dm
> CONFIG_TEXTSEARCH_FSM=3Dm
> CONFIG_INTERVAL_TREE=3Dy
> CONFIG_XARRAY_MULTI=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_DMA_OPS=3Dy
> CONFIG_NEED_SG_DMA_LENGTH=3Dy
> CONFIG_NEED_DMA_MAP_STATE=3Dy
> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> CONFIG_SWIOTLB=3Dy
> # CONFIG_DMA_API_DEBUG is not set
> # CONFIG_DMA_MAP_BENCHMARK is not set
> CONFIG_SGL_ALLOC=3Dy
> CONFIG_CHECK_SIGNATURE=3Dy
> CONFIG_CPUMASK_OFFSTACK=3Dy
> CONFIG_CPU_RMAP=3Dy
> CONFIG_DQL=3Dy
> CONFIG_GLOB=3Dy
> # CONFIG_GLOB_SELFTEST is not set
> CONFIG_NLATTR=3Dy
> CONFIG_CLZ_TAB=3Dy
> CONFIG_IRQ_POLL=3Dy
> CONFIG_MPILIB=3Dy
> CONFIG_SIGNATURE=3Dy
> CONFIG_OID_REGISTRY=3Dy
> CONFIG_UCS2_STRING=3Dy
> CONFIG_HAVE_GENERIC_VDSO=3Dy
> CONFIG_GENERIC_GETTIMEOFDAY=3Dy
> CONFIG_GENERIC_VDSO_TIME_NS=3Dy
> CONFIG_FONT_SUPPORT=3Dy
> # CONFIG_FONTS is not set
> CONFIG_FONT_8x8=3Dy
> CONFIG_FONT_8x16=3Dy
> CONFIG_SG_POOL=3Dy
> CONFIG_ARCH_HAS_PMEM_API=3Dy
> CONFIG_MEMREGION=3Dy
> CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=3Dy
> CONFIG_ARCH_HAS_COPY_MC=3Dy
> CONFIG_ARCH_STACKWALK=3Dy
> CONFIG_SBITMAP=3Dy
> # end of Library routines
> =

> CONFIG_ASN1_ENCODER=3Dy
> =

> #
> # Kernel hacking
> #
> =

> #
> # printk and dmesg options
> #
> CONFIG_PRINTK_TIME=3Dy
> CONFIG_PRINTK_CALLER=3Dy
> # CONFIG_STACKTRACE_BUILD_ID is not set
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> CONFIG_CONSOLE_LOGLEVEL_QUIET=3D4
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> CONFIG_BOOT_PRINTK_DELAY=3Dy
> CONFIG_DYNAMIC_DEBUG=3Dy
> CONFIG_DYNAMIC_DEBUG_CORE=3Dy
> CONFIG_SYMBOLIC_ERRNAME=3Dy
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> # end of printk and dmesg options
> =

> #
> # Compile-time checks and compiler options
> #
> CONFIG_DEBUG_INFO=3Dy
> CONFIG_DEBUG_INFO_REDUCED=3Dy
> # CONFIG_DEBUG_INFO_COMPRESSED is not set
> # CONFIG_DEBUG_INFO_SPLIT is not set
> # CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
> CONFIG_DEBUG_INFO_DWARF4=3Dy
> # CONFIG_DEBUG_INFO_DWARF5 is not set
> CONFIG_PAHOLE_HAS_SPLIT_BTF=3Dy
> # CONFIG_GDB_SCRIPTS is not set
> CONFIG_FRAME_WARN=3D2048
> CONFIG_STRIP_ASM_SYMS=3Dy
> # CONFIG_READABLE_ASM is not set
> # CONFIG_HEADERS_INSTALL is not set
> CONFIG_DEBUG_SECTION_MISMATCH=3Dy
> CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
> CONFIG_STACK_VALIDATION=3Dy
> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> # end of Compile-time checks and compiler options
> =

> #
> # Generic Kernel Debugging Instruments
> #
> CONFIG_MAGIC_SYSRQ=3Dy
> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> CONFIG_MAGIC_SYSRQ_SERIAL=3Dy
> CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=3D""
> CONFIG_DEBUG_FS=3Dy
> CONFIG_DEBUG_FS_ALLOW_ALL=3Dy
> # CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
> # CONFIG_DEBUG_FS_ALLOW_NONE is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> # CONFIG_UBSAN is not set
> CONFIG_HAVE_ARCH_KCSAN=3Dy
> # end of Generic Kernel Debugging Instruments
> =

> CONFIG_DEBUG_KERNEL=3Dy
> CONFIG_DEBUG_MISC=3Dy
> =

> #
> # Memory Debugging
> #
> # CONFIG_PAGE_EXTENSION is not set
> # CONFIG_DEBUG_PAGEALLOC is not set
> # CONFIG_PAGE_OWNER is not set
> # CONFIG_PAGE_POISONING is not set
> # CONFIG_DEBUG_PAGE_REF is not set
> # CONFIG_DEBUG_RODATA_TEST is not set
> CONFIG_ARCH_HAS_DEBUG_WX=3Dy
> # CONFIG_DEBUG_WX is not set
> CONFIG_GENERIC_PTDUMP=3Dy
> # CONFIG_PTDUMP_DEBUGFS is not set
> # CONFIG_DEBUG_OBJECTS is not set
> # CONFIG_SLUB_DEBUG_ON is not set
> # CONFIG_SLUB_STATS is not set
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> # CONFIG_DEBUG_STACK_USAGE is not set
> # CONFIG_SCHED_STACK_END_CHECK is not set
> CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=3Dy
> # CONFIG_DEBUG_VM is not set
> # CONFIG_DEBUG_VM_PGTABLE is not set
> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> # CONFIG_DEBUG_VIRTUAL is not set
> CONFIG_DEBUG_MEMORY_INIT=3Dy
> # CONFIG_DEBUG_PER_CPU_MAPS is not set
> CONFIG_HAVE_ARCH_KASAN=3Dy
> CONFIG_HAVE_ARCH_KASAN_VMALLOC=3Dy
> CONFIG_CC_HAS_KASAN_GENERIC=3Dy
> CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=3Dy
> # CONFIG_KASAN is not set
> CONFIG_HAVE_ARCH_KFENCE=3Dy
> # CONFIG_KFENCE is not set
> # end of Memory Debugging
> =

> CONFIG_DEBUG_SHIRQ=3Dy
> =

> #
> # Debug Oops, Lockups and Hangs
> #
> CONFIG_PANIC_ON_OOPS=3Dy
> CONFIG_PANIC_ON_OOPS_VALUE=3D1
> CONFIG_PANIC_TIMEOUT=3D0
> CONFIG_LOCKUP_DETECTOR=3Dy
> CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> # CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
> CONFIG_HARDLOCKUP_DETECTOR_PERF=3Dy
> CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=3Dy
> CONFIG_HARDLOCKUP_DETECTOR=3Dy
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=3Dy
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=3D1
> CONFIG_DETECT_HUNG_TASK=3Dy
> CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D480
> # CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
> CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D0
> CONFIG_WQ_WATCHDOG=3Dy
> # CONFIG_TEST_LOCKUP is not set
> # end of Debug Oops, Lockups and Hangs
> =

> #
> # Scheduler Debugging
> #
> CONFIG_SCHED_DEBUG=3Dy
> CONFIG_SCHED_INFO=3Dy
> CONFIG_SCHEDSTATS=3Dy
> # end of Scheduler Debugging
> =

> # CONFIG_DEBUG_TIMEKEEPING is not set
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
> # CONFIG_PROVE_LOCKING is not set
> # CONFIG_LOCK_STAT is not set
> # CONFIG_DEBUG_RT_MUTEXES is not set
> # CONFIG_DEBUG_SPINLOCK is not set
> # CONFIG_DEBUG_MUTEXES is not set
> # CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
> # CONFIG_DEBUG_RWSEMS is not set
> # CONFIG_DEBUG_LOCK_ALLOC is not set
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> # CONFIG_LOCK_TORTURE_TEST is not set
> # CONFIG_WW_MUTEX_SELFTEST is not set
> # CONFIG_SCF_TORTURE_TEST is not set
> # CONFIG_CSD_LOCK_WAIT_DEBUG is not set
> # end of Lock Debugging (spinlocks, mutexes, etc...)
> =

> # CONFIG_DEBUG_IRQFLAGS is not set
> CONFIG_STACKTRACE=3Dy
> # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
> # CONFIG_DEBUG_KOBJECT is not set
> =

> #
> # Debug kernel data structures
> #
> CONFIG_DEBUG_LIST=3Dy
> # CONFIG_DEBUG_PLIST is not set
> # CONFIG_DEBUG_SG is not set
> # CONFIG_DEBUG_NOTIFIERS is not set
> CONFIG_BUG_ON_DATA_CORRUPTION=3Dy
> # end of Debug kernel data structures
> =

> # CONFIG_DEBUG_CREDENTIALS is not set
> =

> #
> # RCU Debugging
> #
> # CONFIG_RCU_SCALE_TEST is not set
> # CONFIG_RCU_TORTURE_TEST is not set
> # CONFIG_RCU_REF_SCALE_TEST is not set
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D60
> # CONFIG_RCU_TRACE is not set
> # CONFIG_RCU_EQS_DEBUG is not set
> # end of RCU Debugging
> =

> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> # CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
> CONFIG_LATENCYTOP=3Dy
> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> CONFIG_NOP_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=3Dy
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> CONFIG_HAVE_FENTRY=3Dy
> CONFIG_HAVE_OBJTOOL_MCOUNT=3Dy
> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> CONFIG_TRACER_MAX_TRACE=3Dy
> CONFIG_TRACE_CLOCK=3Dy
> CONFIG_RING_BUFFER=3Dy
> CONFIG_EVENT_TRACING=3Dy
> CONFIG_CONTEXT_SWITCH_TRACER=3Dy
> CONFIG_TRACING=3Dy
> CONFIG_GENERIC_TRACER=3Dy
> CONFIG_TRACING_SUPPORT=3Dy
> CONFIG_FTRACE=3Dy
> # CONFIG_BOOTTIME_TRACING is not set
> CONFIG_FUNCTION_TRACER=3Dy
> CONFIG_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_DYNAMIC_FTRACE=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_ARGS=3Dy
> CONFIG_FUNCTION_PROFILER=3Dy
> CONFIG_STACK_TRACER=3Dy
> # CONFIG_IRQSOFF_TRACER is not set
> CONFIG_SCHED_TRACER=3Dy
> CONFIG_HWLAT_TRACER=3Dy
> # CONFIG_OSNOISE_TRACER is not set
> # CONFIG_TIMERLAT_TRACER is not set
> # CONFIG_MMIOTRACE is not set
> CONFIG_FTRACE_SYSCALLS=3Dy
> CONFIG_TRACER_SNAPSHOT=3Dy
> # CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
> CONFIG_BRANCH_PROFILE_NONE=3Dy
> # CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
> CONFIG_BLK_DEV_IO_TRACE=3Dy
> CONFIG_KPROBE_EVENTS=3Dy
> # CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
> CONFIG_UPROBE_EVENTS=3Dy
> CONFIG_BPF_EVENTS=3Dy
> CONFIG_DYNAMIC_EVENTS=3Dy
> CONFIG_PROBE_EVENTS=3Dy
> # CONFIG_BPF_KPROBE_OVERRIDE is not set
> CONFIG_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_FTRACE_MCOUNT_USE_CC=3Dy
> CONFIG_TRACING_MAP=3Dy
> CONFIG_SYNTH_EVENTS=3Dy
> CONFIG_HIST_TRIGGERS=3Dy
> # CONFIG_TRACE_EVENT_INJECT is not set
> # CONFIG_TRACEPOINT_BENCHMARK is not set
> CONFIG_RING_BUFFER_BENCHMARK=3Dm
> # CONFIG_TRACE_EVAL_MAP_FILE is not set
> # CONFIG_FTRACE_RECORD_RECURSION is not set
> # CONFIG_FTRACE_STARTUP_TEST is not set
> # CONFIG_RING_BUFFER_STARTUP_TEST is not set
> # CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
> # CONFIG_PREEMPTIRQ_DELAY_TEST is not set
> # CONFIG_SYNTH_EVENT_GEN_TEST is not set
> # CONFIG_KPROBE_EVENT_GEN_TEST is not set
> # CONFIG_HIST_TRIGGERS_DEBUG is not set
> CONFIG_PROVIDE_OHCI1394_DMA_INIT=3Dy
> # CONFIG_SAMPLES is not set
> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> CONFIG_STRICT_DEVMEM=3Dy
> # CONFIG_IO_STRICT_DEVMEM is not set
> =

> #
> # x86 Debugging
> #
> CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=3Dy
> CONFIG_EARLY_PRINTK_USB=3Dy
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> CONFIG_EARLY_PRINTK_DBGP=3Dy
> CONFIG_EARLY_PRINTK_USB_XDBC=3Dy
> # CONFIG_EFI_PGT_DUMP is not set
> # CONFIG_DEBUG_TLBFLUSH is not set
> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> CONFIG_X86_DECODER_SELFTEST=3Dy
> CONFIG_IO_DELAY_0X80=3Dy
> # CONFIG_IO_DELAY_0XED is not set
> # CONFIG_IO_DELAY_UDELAY is not set
> # CONFIG_IO_DELAY_NONE is not set
> CONFIG_DEBUG_BOOT_PARAMS=3Dy
> # CONFIG_CPA_DEBUG is not set
> # CONFIG_DEBUG_ENTRY is not set
> # CONFIG_DEBUG_NMI_SELFTEST is not set
> # CONFIG_X86_DEBUG_FPU is not set
> # CONFIG_PUNIT_ATOM_DEBUG is not set
> CONFIG_UNWINDER_ORC=3Dy
> # CONFIG_UNWINDER_FRAME_POINTER is not set
> # end of x86 Debugging
> =

> #
> # Kernel Testing and Coverage
> #
> # CONFIG_KUNIT is not set
> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> CONFIG_FUNCTION_ERROR_INJECTION=3Dy
> # CONFIG_FAULT_INJECTION is not set
> CONFIG_ARCH_HAS_KCOV=3Dy
> CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy
> # CONFIG_KCOV is not set
> CONFIG_RUNTIME_TESTING_MENU=3Dy
> # CONFIG_LKDTM is not set
> # CONFIG_TEST_MIN_HEAP is not set
> # CONFIG_TEST_DIV64 is not set
> # CONFIG_KPROBES_SANITY_TEST is not set
> # CONFIG_BACKTRACE_SELF_TEST is not set
> # CONFIG_RBTREE_TEST is not set
> # CONFIG_REED_SOLOMON_TEST is not set
> # CONFIG_INTERVAL_TREE_TEST is not set
> # CONFIG_PERCPU_TEST is not set
> CONFIG_ATOMIC64_SELFTEST=3Dy
> # CONFIG_ASYNC_RAID6_TEST is not set
> # CONFIG_TEST_HEXDUMP is not set
> # CONFIG_STRING_SELFTEST is not set
> # CONFIG_TEST_STRING_HELPERS is not set
> # CONFIG_TEST_STRSCPY is not set
> # CONFIG_TEST_KSTRTOX is not set
> # CONFIG_TEST_PRINTF is not set
> # CONFIG_TEST_SCANF is not set
> # CONFIG_TEST_BITMAP is not set
> # CONFIG_TEST_UUID is not set
> # CONFIG_TEST_XARRAY is not set
> # CONFIG_TEST_OVERFLOW is not set
> # CONFIG_TEST_RHASHTABLE is not set
> # CONFIG_TEST_HASH is not set
> # CONFIG_TEST_IDA is not set
> # CONFIG_TEST_LKM is not set
> # CONFIG_TEST_BITOPS is not set
> # CONFIG_TEST_VMALLOC is not set
> # CONFIG_TEST_USER_COPY is not set
> CONFIG_TEST_BPF=3Dm
> # CONFIG_TEST_BLACKHOLE_DEV is not set
> # CONFIG_FIND_BIT_BENCHMARK is not set
> # CONFIG_TEST_FIRMWARE is not set
> # CONFIG_TEST_SYSCTL is not set
> # CONFIG_TEST_UDELAY is not set
> # CONFIG_TEST_STATIC_KEYS is not set
> # CONFIG_TEST_KMOD is not set
> # CONFIG_TEST_MEMCAT_P is not set
> # CONFIG_TEST_LIVEPATCH is not set
> # CONFIG_TEST_STACKINIT is not set
> # CONFIG_TEST_MEMINIT is not set
> # CONFIG_TEST_HMM is not set
> # CONFIG_TEST_FREE_PAGES is not set
> # CONFIG_TEST_FPU is not set
> # CONFIG_TEST_CLOCKSOURCE_WATCHDOG is not set
> CONFIG_ARCH_USE_MEMTEST=3Dy
> # CONFIG_MEMTEST is not set
> # CONFIG_HYPERV_TESTING is not set
> # end of Kernel Testing and Coverage
> # end of Kernel hacking

> #!/bin/sh
> =

> export_top_env()
> {
> 	export suite=3D'will-it-scale'
> 	export testcase=3D'will-it-scale'
> 	export category=3D'benchmark'
> 	export nr_task=3D16
> 	export job_origin=3D'will-it-scale-part4.yaml'
> 	export testbox=3D'lkp-hsw-4ex1'
> 	export arch=3D'x86_64'
> 	export tbox_group=3D'lkp-hsw-4ex1'
> 	export serial_servers=3D'lkp-wildcat lkp-nhm-dp2 lkp-nhm-d01 lkp-serial0=
2 lkp-serial03 lkp-serial04'
> 	export boot_watchdog_mail=3D'ignore'
> 	export queue_cmdline_keys=3D
> 	export schedule_notify_address=3D
> 	export queue=3D'vip'
> 	export branch=3D'linus/master'
> 	export commit=3D'3aac3ebea08f2d342364f827c8979ab0e1dd591e'
> 	export kconfig=3D'x86_64-rhel-8.3'
> 	export submit_id=3D'61a866eb0b9a93fb97f8a107'
> 	export job_file=3D'/lkp/jobs/scheduled/lkp-hsw-4ex1/will-it-scale-perfor=
mance-thread-16-signal1-ucode=3D0x16-debian-10.4-x86_64-20200603.cgz-3aac3e=
bea08f2d342364f827c8979ab0e1dd591e-20211202-64407-vaznym-0.yaml'
> 	export id=3D'b18865e73bc3268790d6bce8b871591cb54175ce'
> 	export queuer_version=3D'/lkp/xsang/.src-20211202-092226'
> 	export model=3D'Haswell-EX'
> 	export nr_node=3D4
> 	export nr_cpu=3D144
> 	export memory=3D'512G'
> 	export nr_ssd_partitions=3D1
> 	export nr_hdd_partitions=3D1
> 	export hdd_partitions=3D'/dev/disk/by-id/wwn-0x5000c50067bdf9c3-part1'
> 	export ssd_partitions=3D'/dev/disk/by-id/wwn-0x55cd2e40003aeb61-part1'
> 	export swap_partitions=3D
> 	export rootfs_partition=3D'/dev/disk/by-id/wwn-0x55cd2e404c2e98e3-part1'
> 	export brand=3D'Intel(R) Xeon(R) CPU E7-8890 v3 @ 2.50GHz'
> 	export ucode=3D'0x16'
> 	export kernel_cmdline_hw=3D'cma=3D0'
> 	export need_kconfig_hw=3D'{"IXGBE"=3D>"y"}
> SCSI_MPT3SAS
> SATA_AHCI'
> 	export bisect_dmesg=3Dtrue
> 	export rootfs=3D'debian-10.4-x86_64-20200603.cgz'
> 	export enqueue_time=3D'2021-12-02 14:25:47 +0800'
> 	export compiler=3D'gcc-9'
> 	export _id=3D'61a866eb0b9a93fb97f8a107'
> 	export _rt=3D'/result/will-it-scale/performance-thread-16-signal1-ucode=
=3D0x16/lkp-hsw-4ex1/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/=
3aac3ebea08f2d342364f827c8979ab0e1dd591e'
> 	export user=3D'lkp'
> 	export LKP_SERVER=3D'internal-lkp-server'
> 	export kernel=3D'/pkg/linux/x86_64-rhel-8.3/gcc-9/3aac3ebea08f2d342364f8=
27c8979ab0e1dd591e/vmlinuz-5.15.0-rc5-00088-g3aac3ebea08f'
> 	export result_root=3D'/result/will-it-scale/performance-thread-16-signal=
1-ucode=3D0x16/lkp-hsw-4ex1/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3=
/gcc-9/3aac3ebea08f2d342364f827c8979ab0e1dd591e/8'
> 	export dequeue_time=3D'2021-12-02 15:25:08 +0800'
> 	export scheduler_version=3D'/lkp/lkp/.src-20211202-144518'
> 	export max_uptime=3D2100
> 	export initrd=3D'/osimage/debian/debian-10.4-x86_64-20200603.cgz'
> 	export bootloader_append=3D'root=3D/dev/ram0
> user=3Dlkp
> job=3D/lkp/jobs/scheduled/lkp-hsw-4ex1/will-it-scale-performance-thread-1=
6-signal1-ucode=3D0x16-debian-10.4-x86_64-20200603.cgz-3aac3ebea08f2d342364=
f827c8979ab0e1dd591e-20211202-64407-vaznym-0.yaml
> ARCH=3Dx86_64
> kconfig=3Dx86_64-rhel-8.3
> branch=3Dlinus/master
> commit=3D3aac3ebea08f2d342364f827c8979ab0e1dd591e
> BOOT_IMAGE=3D/pkg/linux/x86_64-rhel-8.3/gcc-9/3aac3ebea08f2d342364f827c89=
79ab0e1dd591e/vmlinuz-5.15.0-rc5-00088-g3aac3ebea08f
> cma=3D0
> max_uptime=3D2100
> RESULT_ROOT=3D/result/will-it-scale/performance-thread-16-signal1-ucode=
=3D0x16/lkp-hsw-4ex1/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/=
3aac3ebea08f2d342364f827c8979ab0e1dd591e/8
> LKP_SERVER=3Dinternal-lkp-server
> nokaslr
> selinux=3D0
> debug
> apic=3Ddebug
> sysrq_always_enabled
> rcupdate.rcu_cpu_stall_timeout=3D100
> net.ifnames=3D0
> printk.devkmsg=3Don
> panic=3D-1
> softlockup_panic=3D1
> nmi_watchdog=3Dpanic
> oops=3Dpanic
> load_ramdisk=3D2
> prompt_ramdisk=3D0
> drbd.minor_count=3D8
> systemd.log_level=3Derr
> ignore_loglevel
> console=3Dtty0
> earlyprintk=3DttyS0,115200
> console=3DttyS0,115200
> vga=3Dnormal
> rw'
> 	export modules_initrd=3D'/pkg/linux/x86_64-rhel-8.3/gcc-9/3aac3ebea08f2d=
342364f827c8979ab0e1dd591e/modules.cgz'
> 	export bm_initrd=3D'/osimage/deps/debian-10.4-x86_64-20200603.cgz/run-ip=
config_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/lkp_20210=
707.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/rsync-rootfs_20200608=
.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/will-it-scale_20210906.c=
gz,/osimage/pkg/debian-10.4-x86_64-20200603.cgz/will-it-scale-x86_64-a34a85=
c-1_20211201.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/mpstat_20200=
714.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/turbostat_20200721.cg=
z,/osimage/pkg/debian-10.4-x86_64-20200603.cgz/turbostat-x86_64-3.7-4_20200=
721.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/perf_20211128.cgz,/os=
image/pkg/debian-10.4-x86_64-20200603.cgz/perf-x86_64-4f0dda359c45-1_202111=
27.cgz,/osimage/pkg/debian-10.4-x86_64-20200603.cgz/sar-x86_64-34c92ae-1_20=
200702.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/hw_20200715.cgz'
> 	export ucode_initrd=3D'/osimage/ucode/intel-ucode-20210222.cgz'
> 	export lkp_initrd=3D'/osimage/user/lkp/lkp-x86_64.cgz'
> 	export site=3D'inn'
> 	export LKP_CGI_PORT=3D80
> 	export LKP_CIFS_PORT=3D139
> 	export job_initrd=3D'/lkp/jobs/scheduled/lkp-hsw-4ex1/will-it-scale-perf=
ormance-thread-16-signal1-ucode=3D0x16-debian-10.4-x86_64-20200603.cgz-3aac=
3ebea08f2d342364f827c8979ab0e1dd591e-20211202-64407-vaznym-0.cgz'
> =

> 	[ -n "$LKP_SRC" ] ||
> 	export LKP_SRC=3D/lkp/${user:-lkp}/src
> }
> =

> run_job()
> {
> 	echo $$ > $TMP/run-job.pid
> =

> 	. $LKP_SRC/lib/http.sh
> 	. $LKP_SRC/lib/job.sh
> 	. $LKP_SRC/lib/env.sh
> =

> 	export_top_env
> =

> 	run_setup $LKP_SRC/setup/cpufreq_governor 'performance'
> =

> 	run_monitor $LKP_SRC/monitors/wrapper kmsg
> 	run_monitor $LKP_SRC/monitors/no-stdout/wrapper boot-time
> 	run_monitor $LKP_SRC/monitors/wrapper uptime
> 	run_monitor $LKP_SRC/monitors/wrapper iostat
> 	run_monitor $LKP_SRC/monitors/wrapper heartbeat
> 	run_monitor $LKP_SRC/monitors/wrapper vmstat
> 	run_monitor $LKP_SRC/monitors/wrapper numa-numastat
> 	run_monitor $LKP_SRC/monitors/wrapper numa-vmstat
> 	run_monitor $LKP_SRC/monitors/wrapper numa-meminfo
> 	run_monitor $LKP_SRC/monitors/wrapper proc-vmstat
> 	run_monitor $LKP_SRC/monitors/wrapper proc-stat
> 	run_monitor $LKP_SRC/monitors/wrapper meminfo
> 	run_monitor $LKP_SRC/monitors/wrapper slabinfo
> 	run_monitor $LKP_SRC/monitors/wrapper interrupts
> 	run_monitor $LKP_SRC/monitors/wrapper lock_stat
> 	run_monitor lite_mode=3D1 $LKP_SRC/monitors/wrapper perf-sched
> 	run_monitor $LKP_SRC/monitors/wrapper softirqs
> 	run_monitor $LKP_SRC/monitors/one-shot/wrapper bdi_dev_mapping
> 	run_monitor $LKP_SRC/monitors/wrapper diskstats
> 	run_monitor $LKP_SRC/monitors/wrapper nfsstat
> 	run_monitor $LKP_SRC/monitors/wrapper cpuidle
> 	run_monitor $LKP_SRC/monitors/wrapper cpufreq-stats
> 	run_monitor $LKP_SRC/monitors/wrapper turbostat
> 	run_monitor $LKP_SRC/monitors/wrapper sched_debug
> 	run_monitor $LKP_SRC/monitors/wrapper perf-stat
> 	run_monitor $LKP_SRC/monitors/wrapper mpstat
> 	run_monitor debug_mode=3D0 $LKP_SRC/monitors/no-stdout/wrapper perf-prof=
ile
> 	run_monitor $LKP_SRC/monitors/wrapper syscalls
> 	run_monitor $LKP_SRC/monitors/wrapper oom-killer
> 	run_monitor $LKP_SRC/monitors/plain/watchdog
> =

> 	run_test mode=3D'thread' test=3D'signal1' $LKP_SRC/tests/wrapper will-it=
-scale
> }
> =

> extract_stats()
> {
> 	export stats_part_begin=3D
> 	export stats_part_end=3D
> =

> 	env mode=3D'thread' test=3D'signal1' $LKP_SRC/stats/wrapper will-it-scale
> 	$LKP_SRC/stats/wrapper kmsg
> 	$LKP_SRC/stats/wrapper boot-time
> 	$LKP_SRC/stats/wrapper uptime
> 	$LKP_SRC/stats/wrapper iostat
> 	$LKP_SRC/stats/wrapper vmstat
> 	$LKP_SRC/stats/wrapper numa-numastat
> 	$LKP_SRC/stats/wrapper numa-vmstat
> 	$LKP_SRC/stats/wrapper numa-meminfo
> 	$LKP_SRC/stats/wrapper proc-vmstat
> 	$LKP_SRC/stats/wrapper meminfo
> 	$LKP_SRC/stats/wrapper slabinfo
> 	$LKP_SRC/stats/wrapper interrupts
> 	$LKP_SRC/stats/wrapper lock_stat
> 	env lite_mode=3D1 $LKP_SRC/stats/wrapper perf-sched
> 	$LKP_SRC/stats/wrapper softirqs
> 	$LKP_SRC/stats/wrapper diskstats
> 	$LKP_SRC/stats/wrapper nfsstat
> 	$LKP_SRC/stats/wrapper cpuidle
> 	$LKP_SRC/stats/wrapper turbostat
> 	$LKP_SRC/stats/wrapper sched_debug
> 	$LKP_SRC/stats/wrapper perf-stat
> 	$LKP_SRC/stats/wrapper mpstat
> 	env debug_mode=3D0 $LKP_SRC/stats/wrapper perf-profile
> 	$LKP_SRC/stats/wrapper syscalls
> =

> 	$LKP_SRC/stats/wrapper time will-it-scale.time
> 	$LKP_SRC/stats/wrapper dmesg
> 	$LKP_SRC/stats/wrapper kmsg
> 	$LKP_SRC/stats/wrapper last_state
> 	$LKP_SRC/stats/wrapper stderr
> 	$LKP_SRC/stats/wrapper time
> }
> =

> "$@"

> ---
> :#! jobs/will-it-scale-part4.yaml:
> suite: will-it-scale
> testcase: will-it-scale
> category: benchmark
> nr_task: 16
> will-it-scale:
>   mode: thread
>   test: signal1
> job_origin: will-it-scale-part4.yaml
> :#! queue options:
> queue_cmdline_keys:
> - branch
> - commit
> - queue_at_least_once
> queue: bisect
> testbox: lkp-hsw-4ex1
> tbox_group: lkp-hsw-4ex1
> kconfig: x86_64-rhel-8.3
> submit_id: 61974237ee612662cdc02cac
> job_file: "/lkp/jobs/scheduled/lkp-hsw-4ex1/will-it-scale-performance-thr=
ead-16-signal1-ucode=3D0x16-debian-10.4-x86_64-20200603.cgz-3aac3ebea08f2d3=
42364f827c8979ab0e1dd591e-20211119-25293-1xwl88w-2.yaml"
> id: accafc438a742cc8ba0870fe939abce809c22e1a
> queuer_version: "/lkp-src"
> :#! hosts/lkp-hsw-4ex1:
> model: Haswell-EX
> nr_node: 4
> nr_cpu: 144
> memory: 512G
> nr_ssd_partitions: 1
> nr_hdd_partitions: 1
> hdd_partitions: "/dev/disk/by-id/wwn-0x5000c50067bdf9c3-part1"
> ssd_partitions: "/dev/disk/by-id/ata-INTEL_SSDSC2BB800G4_PHWL41710016800R=
GN-part1"
> swap_partitions:
> rootfs_partition: "/dev/disk/by-id/ata-INTEL_SSDSC2BA400G4_BTHV634503K340=
0NGN-part1"
> brand: Intel(R) Xeon(R) CPU E7-8890 v3 @ 2.50GHz
> :#! include/category/benchmark:
> kmsg:
> boot-time:
> uptime:
> iostat:
> heartbeat:
> vmstat:
> numa-numastat:
> numa-vmstat:
> numa-meminfo:
> proc-vmstat:
> proc-stat:
> meminfo:
> slabinfo:
> interrupts:
> lock_stat:
> perf-sched:
>   lite_mode: 1
> softirqs:
> bdi_dev_mapping:
> diskstats:
> nfsstat:
> cpuidle:
> cpufreq-stats:
> turbostat:
> sched_debug:
> perf-stat:
> mpstat:
> perf-profile:
>   lite_mode: 1
> :#! include/category/ALL:
> cpufreq_governor: performance
> :#! include/queue/cyclic:
> commit: 3aac3ebea08f2d342364f827c8979ab0e1dd591e
> :#! include/testbox/lkp-hsw-4ex1:
> syscalls:
> ucode: '0x16'
> kernel_cmdline_hw: cma=3D0
> need_kconfig_hw:
> - IXGBE: y
> - SCSI_MPT3SAS
> - SATA_AHCI
> bisect_dmesg: true
> enqueue_time: 2021-11-19 14:20:39.278604666 +08:00
> _id: 61975062ee612662cdc02cae
> _rt: "/result/will-it-scale/performance-thread-16-signal1-ucode=3D0x16/lk=
p-hsw-4ex1/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/3aac3ebea0=
8f2d342364f827c8979ab0e1dd591e"
> :#! schedule options:
> user: lkp
> compiler: gcc-9
> LKP_SERVER: internal-lkp-server
> head_commit: 853b3fee2abc699bce0c12f889b12c8efb65c38b
> base_commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
> branch: linux-devel/devel-hourly-20211115-110950
> rootfs: debian-10.4-x86_64-20200603.cgz
> result_root: "/result/will-it-scale/performance-thread-16-signal1-ucode=
=3D0x16/lkp-hsw-4ex1/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/=
3aac3ebea08f2d342364f827c8979ab0e1dd591e/1"
> scheduler_version: "/lkp/lkp/.src-20211118-213456"
> arch: x86_64
> max_uptime: 2100
> initrd: "/osimage/debian/debian-10.4-x86_64-20200603.cgz"
> bootloader_append:
> - root=3D/dev/ram0
> - user=3Dlkp
> - job=3D/lkp/jobs/scheduled/lkp-hsw-4ex1/will-it-scale-performance-thread=
-16-signal1-ucode=3D0x16-debian-10.4-x86_64-20200603.cgz-3aac3ebea08f2d3423=
64f827c8979ab0e1dd591e-20211119-25293-1xwl88w-2.yaml
> - ARCH=3Dx86_64
> - kconfig=3Dx86_64-rhel-8.3
> - branch=3Dlinux-devel/devel-hourly-20211115-110950
> - commit=3D3aac3ebea08f2d342364f827c8979ab0e1dd591e
> - BOOT_IMAGE=3D/pkg/linux/x86_64-rhel-8.3/gcc-9/3aac3ebea08f2d342364f827c=
8979ab0e1dd591e/vmlinuz-5.15.0-rc5-00088-g3aac3ebea08f
> - cma=3D0
> - max_uptime=3D2100
> - RESULT_ROOT=3D/result/will-it-scale/performance-thread-16-signal1-ucode=
=3D0x16/lkp-hsw-4ex1/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/=
3aac3ebea08f2d342364f827c8979ab0e1dd591e/1
> - LKP_SERVER=3Dinternal-lkp-server
> - nokaslr
> - selinux=3D0
> - debug
> - apic=3Ddebug
> - sysrq_always_enabled
> - rcupdate.rcu_cpu_stall_timeout=3D100
> - net.ifnames=3D0
> - printk.devkmsg=3Don
> - panic=3D-1
> - softlockup_panic=3D1
> - nmi_watchdog=3Dpanic
> - oops=3Dpanic
> - load_ramdisk=3D2
> - prompt_ramdisk=3D0
> - drbd.minor_count=3D8
> - systemd.log_level=3Derr
> - ignore_loglevel
> - console=3Dtty0
> - earlyprintk=3DttyS0,115200
> - console=3DttyS0,115200
> - vga=3Dnormal
> - rw
> modules_initrd: "/pkg/linux/x86_64-rhel-8.3/gcc-9/3aac3ebea08f2d342364f82=
7c8979ab0e1dd591e/modules.cgz"
> bm_initrd: "/osimage/deps/debian-10.4-x86_64-20200603.cgz/run-ipconfig_20=
200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/lkp_20210707.cgz,/=
osimage/deps/debian-10.4-x86_64-20200603.cgz/rsync-rootfs_20200608.cgz,/osi=
mage/deps/debian-10.4-x86_64-20200603.cgz/will-it-scale_20210906.cgz,/osima=
ge/pkg/debian-10.4-x86_64-20200603.cgz/will-it-scale-x86_64-a34a85c-1_20211=
108.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/mpstat_20200714.cgz,/=
osimage/deps/debian-10.4-x86_64-20200603.cgz/turbostat_20200721.cgz,/osimag=
e/pkg/debian-10.4-x86_64-20200603.cgz/turbostat-x86_64-3.7-4_20200721.cgz,/=
osimage/deps/debian-10.4-x86_64-20200603.cgz/perf_20211114.cgz,/osimage/pkg=
/debian-10.4-x86_64-20200603.cgz/perf-x86_64-ccfff0a2bd2a-1_20211113.cgz,/o=
simage/pkg/debian-10.4-x86_64-20200603.cgz/sar-x86_64-34c92ae-1_20200702.cg=
z,/osimage/deps/debian-10.4-x86_64-20200603.cgz/hw_20200715.cgz"
> ucode_initrd: "/osimage/ucode/intel-ucode-20210222.cgz"
> lkp_initrd: "/osimage/user/lkp/lkp-x86_64.cgz"
> site: inn
> :#! /lkp/lkp/.src-20211117-140011/include/site/inn:
> LKP_CGI_PORT: 80
> LKP_CIFS_PORT: 139
> oom-killer:
> watchdog:
> :#! runtime status:
> last_kernel: 5.15.0-rc5-00088-g3aac3ebea08f
> repeat_to: 3
> schedule_notify_address:
> :#! user overrides:
> queue_at_least_once: 0
> kernel: "/pkg/linux/x86_64-rhel-8.3/gcc-9/3aac3ebea08f2d342364f827c8979ab=
0e1dd591e/vmlinuz-5.15.0-rc5-00088-g3aac3ebea08f"
> dequeue_time: 2021-11-19 15:33:13.789026489 +08:00
> :#! /cephfs/db/releases/20211118215618/lkp-src/include/site/inn:
> job_state: finished
> loadavg: 9.49 9.38 4.46 1/1066 18864
> start_time: '1637307290'
> end_time: '1637307591'
> version: "/lkp/lkp/.src-20211118-213535:f3e25d58:eeb639dcd"

> =

> for cpu_dir in /sys/devices/system/cpu/cpu[0-9]*
> do
> 	online_file=3D"$cpu_dir"/online
> 	[ -f "$online_file" ] && [ "$(cat "$online_file")" -eq 0 ] && continue
> =

> 	file=3D"$cpu_dir"/cpufreq/scaling_governor
> 	[ -f "$file" ] && echo "performance" > "$file"
> done
> =

>  "/lkp/benchmarks/python3/bin/python3" "./runtest.py" "signal1" "295" "th=
read" "16"


--===============2542132941836245975==
Content-Type: application/x-xz
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="dmesg.xz"

/Td6WFoAAATm1rRGAgAhARYAAAB0L+Wj5BFuk59dACIZSGcigsEOvS5SJPSSiEZN91kUwkoEoc4C
r7bBXWVIIW1d8ua7xL90VOjS12pSkksYKGnr3QZkrpcjQY85mvAb7yj9lWdQr5WS2URV5y7Dfi2J
AH4w7/t2JzD6lUVdPlTHbxXcjnjmXXZFgXXXoVaMDH50XjMmkNGW2WhQtw88WHwmYKzaCqlmSIxR
Wh7ePua53V3dUbPlau22TubPnY+fZZO3t2SAkCcqi1JJCgXxSSHvwq8K+PBSe6v1YsCQGlJE93XB
MdGbpoBDwlXhhOzbGUAy73dcbDaSDpX99vCwow6vxAoxBbbmVFMVkEY2z72hZMHdajbXPyPze9yM
PzNqFsDjOqCqx0lvcDq/DaL3nWX1n4GC8uMWBqn0pPdzPLI0i8JK66k/M8zpzDq0i7Dl57bjGbX8
C8Q/xMzmtl8Rlanuh2jORMg7bB6cFrznd8+BMUU/L0gDumE5/jQVhqyTujbCVdr/gsVsh/6vQL8O
qAQ6JRHPDPdJQqQ5tgkdqHy7KdPOOGqO9UF0w1B2FozimLJTZtpCclxaUp5eB2wvwEV+/5pA37Vg
ildBD0X/QkXxuHJL2UHIhYT+QPkv7vjj+WpPt5weQTUeJyu+qwTd/4h2NWbCdjLE+uubPAz/hdWJ
ZJMYLG/Unkb9+mnt5lhRkYDAl1zd5RIpxAqWRPRR4JEJt4zWlQdbk4aw9ZnP3i4bKteOIjzR7B0x
dW7vr3Ho2loka5VPdnFzVBcSZ2IS/ScxIXLJp7nly9OX5N4JwDccTzQlupJcPxreLXwGi+zjG5Ju
0tZ13BZV+hakHgAMEgiLbk/pY9awTE1KnXuuxrAJqlHGsLfQJAK4MHk4/QQ04HpdlFsQ3goPDg0P
8ujd2d6pQC187gR8S0LZ0ykoFLMPHgTSXJFMc4F5DNhczb0UrDGw1/B7bDutSmGfE4hCeayVBCrw
7ibe/RE1UIsxfxNWo2BehCN+qEdZctyIT8+KgijWE7x0ytedKEbzpw/6Z75J+8Vpf742rtwOuvpW
NxeSfLUSDlflb1Eo6aYfuudyV05IjlcwQeiCBNGMjGwfvYA9/bYfi4h28sxx/bS2gjm7Ctqf9zp6
gcvxYd0J/4ql6BEl7eWNDIpt0mqKVzw+5ii8+Rf9+UcVCbyko53Rh2vba672UP4gN/xSBscg/xEP
IjzvV5b0ideMYP0aoO96SUCZHJYOU7Jwh1/a1jRCWoTNyDkERAJ2XSrq5idsf9P/6P//7wp//urD
eqsy2O5a1KwEhOa7Gcs6AZLmHLT87nXM7AqM70kqxU8bk6ojV9ApTmb0gk5X2pOUV0wDvm7kbtqq
a/D6QBNEIiSiO1d/CyjZVFKDHQzvx4DhzA2LTiY3Cg3qaby14xbvBWeTQxRIYCmswpTUZdjREFVB
jpLrK7j+hCigdLRkbVuqstRrkKV2nyehf4p5jdp0PtPWNDJP+502l/yJRhPir6dcHqtmWX/p+Iex
jyiWQfB/lyOKyaUyXiQlzTPW3eUJbaDoaKaQQBvm799onKLEEII6vy9FRytzXa+6V96Uzw8gGXIl
fBPYcSeA48H2XHOVzwWHVYnsE4iaGgMuVS9nebXjCc2ePeF4dRfpHLmi/j0W/xea+2HQWOEV37fM
JJxULijKd+QfLaAUnYQEKR2IyPIQDTI0h6CTNeouW49GZHoi/w2dZJZrfgy99wzeQ/AudJ/uHuTJ
ZHmHPoCnNFGDJpF0KcKAw5YOXllTtnckKjabh4M2dDzJQTVuvC+rQ5nC9VjfRaYzoHTDnUFS88VZ
uBOLD6RTiCsxTWzVC9Lpx8RUK1VnDPimzgkCjBQgop5lueG7SiuqNOeJFQbl53vlIER1umgmG9C3
hedClT9cTUdZskdgffWgmszosvj6O9hEe6GsDMG2S459+RT5LLMbOIG4RMY2qKVHGgu62V3CNstz
eD64+pmTDYN4lyeiqwGCX+0yzDYoQhONbqc7qE7yZovNPz6Xi7MhGUX5RyfLMxE6W6Nw2vJUG8zj
9462/P3rkfWUema8wzwSkif+pY7krhBa1XEbvEIkTWq1KQyKuoV95kT+j5oO99AMIk9lB78zHXtD
IGrUy9m9HDy5t3cgJXVTosIJTRDcPb4zwxoJCFuhOnKAfLl8sXpOU1JqqOpzC5wCHxpCAAeiLxrh
Zbq8YzdYO39I6iNOXxk3jV3MHjCWhi2lZXDOSPuITx10IuleM8RcqAZoJO+2HOmjvwJom5+sPmGX
BKldi/xvarvlNbN2ZNtwNBfChsv7Jqrb44rrFGCSsRUGddeQB3nPk4K1I+SRy+aIghQ1UsRlbTyh
MlIEmVyE8ygQexnohSQQ+gIZmXSlaIcVsYGz4vVhLnxglycpzwVamGyrBmmvSbD+ZTtZuWzWZWJy
v+D4DoNdJ6Zim7M9edsIPQITyZ7OnXditDLqGAcplkRoPAx9Dt79MlWzEm10Z3VPmcTksOMpkHU1
yzHcNEUM7BCeOJCLrF2iGwddOvh+0KLd2o9+24V5i7A03cyRWJnUlmMtLqI0303+UAcMCPed1Hre
cy8cq+kiQdzFBmJ6x7uL3Xl/yD2OZK3Kiw6m2Vli2RzHTUBNO4QoGzLPiOaLuUJKy61mvyf7KH2z
fnSkDyrADP3HuP67i1zMJX9961/oI652z8BxNztt9SoLBcSxZhQFyGLHmiuWnmdDJtoMg6wXjaXk
bB9sd40h8fm2uOoSCS77HSiuZEJlOdZY1WArJrPYGyOqs8IcgRiBOFoTPo6W3EbRnGKHFVeSsHhA
mmA6Z+lxyuLMCyOYDCjNSadfJGYSg11XYNknvTRM7/N9I319f/ROQnRs9EofLFzeGEyNjP1hoHXP
TfSF7+EAmUHUIrgAbF2SYxbT8NHmv3i4YjpPZTD32WRBdEEizpxMrm7Wj2zAyfcaIHGi2XVJiI30
4NF5Qiz29skgIH6H1+lJ0A0e4J2WLjuJhL+ASdA4ysU23tVXVwlFozogjZ4k0OfbpvxqRE3k04pi
OIpNET0sPE+IkNQo8jhrkk/+xeWaNbooSPoF0iZywc40tAwwMwiTwTgYfpZbKucL4GIvFNtPxYVo
jxOt7Campqo1t7MPWJzVKXDG5fakNhrdJs4JZ81x8TzxmSgZAConAJfIPrcLgFe+IOBIyX6I9y9M
oZv53pN0aFbSo2azQIrm3bVxuNo+0w0W/BM7XOOUTU4T2iPd+wICviwBSuzcEMpfenRalbN4njhc
u51UaZynG4DP8auJ2eWBbzxT0qtW0l/LXkVqIFaPZ5qQNtfOmzfMdp6PqdnQXAUB8fRhsPGCb0HO
VjkHcBr7aNLWFUBjWHaBuG7q9WhCE9Klc9Nxi/qtkANi3QKUN1mulF9jL948mwHlZb2NOcFN2dBa
SRSPRGOgSseZdhyuFIGOI0cRB2vaIwE4tz/XY0NNaurk9ddfxq0++2S3+PfjbKg4x9c94tS9Uhmq
rRJ9/EbeM0XYNNgpZHoqf2dPUOEzYBjmkzhdauX5dC4/X1OXEt7LTnWRjNNLUC5+6jp7OLdHAVtL
TsSSnSbT3sFhFZ3iF47Wex/AY4DZ3YHKlMi01y7cqgPhpjR+CbIEY704qYFcu8q3LnSuY/NctVRM
gmzBJZwo1ddI31I0Ze9aow6mrSNpFkW54MFeJqgVwWD0N2r6IuyNvmqcMVRb1W1B0pRt0cD+Ef9a
RC9ThZEjrnLnnhLwIFIi/PsaK985iaMDbP2yDnJsX6uUz0YU4Zb8cZ1+/opM5Cm5WfNNYhbF1h8n
Y8z3jw/2YFdjAs9pVNwAsgtO69aQ9JFLKKBl0NYKMeHZ2Aug77cXgbGH2rSp/Q+vjA5Hmn4N/Eo3
iQzYDKgB+xB3rWlY5p9P4dm+Njj129Elc9/f1mxz53LFzMjhq1eacNuCWBgcUvRh7eI3heH/4F7K
4JCSxe39+t0dURF8Lp1MT131z/n58zLxrMg+RQXlLOiV9ftcxptNAq/K4ldULIpFnjdUXxdyWupv
fBw8Ft7Z9JHzwfKB5f7VN/0dQiZ82Forq+OkSEYS3xe7YGSJQH7zLVQa8Q6LhmYS8m9JZUtfs0Os
9aySw+sRFn1zuPT/kphQ+CFyAo3ggXSp1A4m9wfxQu+CsGzg8M57qdnQiuUaDHl53DJyy2OEuS+r
XFNQqT0i8dZFnZQhHcwFX1oV7nIMRWezmYWmSzq33Xj/qtX3YczZioZMlAHQnlx5UuJNTT+1Arhx
/Fl/V78dIF937uSXa7tfqvxK6HfGORKttv5661gC7S7oae39lzVDo+yXq//Wzqqz/MT4eh78e7eT
Bi7sb+OSxqLq5585XUQbMTT/lQv6sAGZmMtXGaGKFXnFb91gN/GQyqiUSMxVUSRtBb3l+SpGAu4s
UjaaMys5tPotDJG/7GnJVhaqgTKbTF/t5pUd9Fu/iO3dP1PzdMAdADCY0GoyQ5d2SJyfZ20ZeTrt
5+mdxCblYgk5+ipeSHFP6PX50NT3lzi/lJa0dG4PkIYcB/sDm4iBfjPbF0taFtpAu0bF4FLn3chH
yySuyHrnAO97zwaWZwCvcB/NRozO9wDQ9B7U8IlDdhldstKjpX+c1QZ/4Oo2EeG9EJLSiLrbQlqy
dWEPmoGxhdrzwBZirS5eHx0vd9W7z7Ik6+whFuyw9ibjzzr6vDnVeZP7/MraFPUs9tzJ/yloV/BP
QeXlcdQ+PeH7BtNpiGEkpWI+NkrMxKuQdIzGLcunmrAB/2oqWFUK0uZGpUIJN4W64pXlf0Ir0TCi
1WJs90LdmMyj1rYI51LX0+dlLqmB+OudM3qFOLGULUoh0kICDjoccP3XrqDOkOGyyz8iPXftcbQe
oEmpmTPVD0k1+MKjurhlh4ICu1xrLEQboeP/fr9Go2EJ3SzYUC1MpNoGp4HYPmqLff4aKkyYNah5
6kO2+catz4TnKpNul51gqm4kV+9GoAoH9ALGVFxnhSZlQzfFYPUfNagTZZ7nviJ56cZscloDWnqm
kWXVx4ZJJI/qwDI2uaiREj2pL8bX5aNNlXG8/+OZXTLL2S7hvADyIAynQGEDXn+UlbNd+Qr4bPyT
pGnvkUJT64Qk57DRh3OzR+3h5T9m9uRWc86K5/qnJf1GYQ34cU97cEC/+s+B7AsTWrbt+hhrkNCR
rCI0OJ7gUV1lWVMYS4CIrfuYRVSzD/CyJy9f20+Hhh84mfpbXdfD9naTeWxZsDyELxiGimxfRyJ+
J9ReD1dmX1QDpIqTYynNqimS4RqcCfoWEmQRIW6VrCxRXrvRqmmPjYisskUJP7fL6bzCNt3rOici
5yetFuhk7BswCLdWXd8uQTet2MbgpQpboYBA2/bu+5sdeDV7td/n6LTS9dp19/wiQoLEn6Pv7e16
LxGVxLjOcdGP8wmNqb/ECov14d2+LA4JKzfuFjtt2G1G8bVVsr/kK91ttzRVgS2316tbksDxqSeL
na4uzKlcihv846fJltkrN7uvSYBawfxi0h3WV5dAoDOk876HpfThnQXy3HK5BkaoehsYdBdkHop9
jcTbEXdgjPTcKXaKIHbRmhCTD1OE/gFnuBPk26K/XwoXp0FV/gmCL6TtrZvIszJf+ta81fKIs176
OogXdHYpF1yfkn9JVeUi7s90tVjZAOksbrGvqBFx4u+jH69Kgg+lebbIECdyjAJsAUZAm7dhhccn
Mlm/L1x0k98lDhq+PwQRK9860V/v0/pdxaCoS8+XiJA80SPxBiMkf0C1j3Fyu51Wb1Qp6poEsrUh
UEdyVM+X2k6Mbm5/gN8z6J0qEtGMPuu2imdFD1E/3LSgqWqqNT92KINsvyXQMTOfjnG0sX622TZl
SAkpjUDfnpFoRIq2LfoM2vEkf4iy/PyhlUWTq9cBYJrCR9B+nUhCL9Jg4DDk2XJGZKPGLhkqD5KA
EpL/DasF9dr+CxsehocN+tAHLd0e2SAhBP2JVzJY72fgtj3/1qfI0y7DXd4tFoFHAvai/S9jKxKK
q9TzIj7q3vzcN7IOfhD7gb+CJBeVNZy9aB4fTlnR+GHCXKScB2d4bwrTKMs4npfVv849/AQMV5xS
4jZ4swIS4HJ6m76AmDybdnrOx7q1B7nRqX1HqfsRlA47AddJ+twkYtLVyD84z5R8oO19Al11Jzl+
CbFKi+uNU5S5AfAOgkgECOpLWZX6vZ1WrJUm8OTq21z0uZ+LrLPkGEv2Oz4HzMpczDgIoCdPhXRW
iBDMlTCJlcsp07kbovvCBHW6b+CXKCN8ldj31di2Zbv00/iO8zT0dhk02/biyYu9ixn9yNTSq2ic
29SMYfVrKV6/oyKrMs3/W09SMR0oWPFG/oVs6Q/605uG1lyBTQGRfFqRkJGq4zuWU0UA/smW05Tp
k2E5xmgnSJ3fBsvaHQaAbiNRBdpReOsRz8zdqXEpJWbDzZolW0sw+gZxqlyLXKyefG2+Qiz9RC1I
MxD4lWLzGc1qKYGCkNRd1k9ai9DX1TbqqYVzAZ41QJ20duIrKOfvng8OcQLpnKsM6bMb1C3qVT7R
qpIm5YFqueAJw203oquHzfA+I90YDt6vBKSCwCHBSoVSsDk6WWN/P5lShXFufHhZqUieshrxbqhK
W86xFkjRx5O+jgB5sMlEBUgVmrTLzyoKCTSQGj7OT6OuaUDysIZ6hFLNl7AenGZcyD5xOEa0rC9d
W+pCsIPMNGu8AQ54cn5Bc21y6REhZkp9Th4AAkQU+gtJzqAJ+/B/iPvk8GuJ+QeNzDg9hG9aPNaM
PfmRwMX8M57CEOqEg1NhPrCeBLRmtWw056vypMzifHpPgWCenuvvvuJmNclPM0bRAZpR964B31L/
eJJ2Whqc0c+cfk39O9UVP3TZWKdnQK2eRba13k2vR7d5Ivveim833h7Fl9YK0A4fwCU2XTeJj0AU
+En9V4TSzEe7WyJRb3zFdBJ/y4YYNHZXyyG6L5+g4zguaP+l+XLucUEgFvgH3htjUJpfn/CiqlCw
Jqp4Q08ArpxvyJbWl1+d+v6RTqqFrOEFTt+8auCqfYr98md7QaC0uCs5orUYlt9mLuxVaDc7J0aE
AvM/FEp0eNH5ucCHCrkjhmA6H0DhqjufaBv+2bTCqJMaayM/qhWRj+cmJHVH/Tx0whyYYju6lWaw
d/w+THxuAPpc/zGUULMgcGRmvPMNuTkuED6BpvSKqfoEjHVn1USGfXBlWOgvzp4Dy8KL4/ppR6m+
Qj0Tsb6+UxN5mx5xN+9pnWgy/NQhAeP2rm9O+SElNN6GW+zieq2A9HFvM/N/HAL0MSJpBnPb97yc
+0kNauMCiNxQgnrO2YsAH0jnql67b+Ngw0Mj5Ikw4BoSsIYV8he8O7VMvlWyVu/mE7jwvWWCShr5
yKOruK+JEF9Raq0QiY+i7v1pdybnWKM9fpbWurvphHkfusMdVixPINHzjbdwCZ1mZpEwti4qPclE
ncckiIq/hghfZVj7E4CtyY3XgJISuZIzaBHPMkEdDOg6aQryIMHUnl3WRIokUNFzAV740TnA24QW
ZxgRT0uXaXEt4OUTJhWThbYGBFY93v/JGv8WpqldvM7Tb/3zgcAdSWP+UJ/ahy8NJQ18s2aoHJV/
iQCArsQ6PhOJ+tN62VSJy8XG1zKeyIQPj/WbmEYHKS17PDvmkZsaGYyNdDXzWW1sE3gm+hAGYXxv
WtLQJWQAxvAjB4F59b1bIoHUgu7sYBN6tQdwTOpnV2uK3r9xmn1AH3cPBtE/CtmhvKlfvcjmg5Mk
KDl8TSbBU9pagK1nJVvw/G4pFjgRb2JMGWC5rTnfONa9A8Woe96hZxkifXMBmDvowpGhlX3KHTiR
CthYQiODD4gbjrTzkletaFo/N9pISeSRTKBOajaKjYG6z8TqOGrdRio7vU8X0Dg0u5BiiWykh/y7
zfLZLToF0s2XTUwqh2AbVbgDB9kzNDswAdmpXYKgx8Icl7KUYQI38rXkHkfmnHw0c6Oyz3iwzHZz
g7oSlofTr0MzI6LqXWAXKeUcKZaSjFVi/7QPY1fyaDM6HdMEHUCGT1QVhRwGeqgwReEzKCUMzCEt
SXGuIs8MzRvaedjAFv8ss6OaghtwPhkmhJ637eHXF2lGEJC60tfv9T/nSN8B33Nc8sghMpfDGgIX
EUzbgzUP7/c6B0IxF+5dusUSISXVOvsKSjJvLfoKpsG5r7HwYW94+VL7iN8yq9HnIrKWpL0Fdyk2
Gyb6xxgj55jjCDPt/sKRNmT8iKuvGEGpnWPY8Hlq7goeV+NQCu+HT239cNftr4SgobDMomUMCEfA
ddGdVArrDl13DYE2NMms/gJpaCX9NS7LuOmWaPsbwZ1ah06zh7AazCZU1V3+NVRWHdP16Yb35jLt
PgxoREvlc4fHwRgzvnsXn9pLPTBl3rVKPQ2uPqhvIh4FmQHfKZKqRrrJwAlNii72GAi026Me+D1x
NlGc3/pv9scGizQnlrzu5/bju8fpGRVxJW9wWCGS/SbNNbll/hKrmu0ypooJ0Q0q1H6jOXevLXpn
yXn42K6+KmEb8HJqCPo8TL2iir+qr/OdkvFYSkUpG2xzXQIvaFeO2C22KdyP7rFFORSsACd55fti
0ZrIUlhOqCFfwyv44pdMbfnERv7+9d46028hK3tmX5F8sCIRSESgxK2Sqn7fLz3zL0bWBC3LcBeN
cMPo2cXVZsLkZeAvKXA1jHKDLTNnBaziWZ8kZ6T18rrXMlc9f1o2VW1/O+Ni//j08eJFmu9J/W8j
vxs3LigAle80kyz5p+EmuywNfrfmI5F4125YsjGDPekvHo5kUFzux4ngspw70SZCbLXpiDSrilbH
s2HKSlje578NhZYaYYfTyYoI0K0ufvehk8bvqXYjQlNa63ZOXtYqL0xJaj8eQnqg9TssK9j+tK6Z
nMVJ+IqZG4UbtZGqAnVW7aUCSFe5CqIPZGANmMs1dmDXfKdMQGnlC8E12IaBh5JdKeQgos2wHf1C
v1aEfDxxfOUi7FelQLllpU9x0maxUv1Qm+Ul9MedBY2G+Y1HzwfUKJPiYl4hNLCngjdOUhpTxisg
QzkdTKx702KE2F1iglMUpBABPcxmgTOlBpNJs3eOpKi3lgvEQoKlyzb5IwlvnQYgDPVNQ3hfyIRW
4BF+/CQbvMxcfyEriO7uFgAYdrn83V3i42dCqHSSrDDG+PNd9JZLygWZNoaXmIIVgUP7pkv2fgn4
yBmodbkSY2gqMjzvHxllbGE3PKJ4rfn0cWaSON2cghJfA2uVmyyjKErutrsN6aJ3eOWQLiX1n3kp
VSyl11lYfojnEm4cZYQZxcBmwt0eT7YOHFRt7vefKcRJiCqeWwcQAtZPqNYJ+mX6ySx+2n101EG3
xEpw2QzvzVbtHtbIXkrwSniF5bxGXsV2+MW3KrKbycqfDHefdMtns5AgUhr6DFpC7d002gD9/btt
+KrnaN3V8DeiFX+knAf28TpN7CG+8aaIlmgaNV16W7rWUp9cs1VsePfuh8/sGcuismvD5DdP2aCn
ZYdCwMigfKtmFiuo3qG3pHt4HUSs4VeMJerdhVsGS3Cc3ollDW4hiqmjbqSF60N0hG0e7k+s/2TI
q/gidvtO2eztan+9W5Gb8EyHBNOvtm6koS+Yl7sjdw8l5PPONLHQPghKHRDlctojcKFWUBhKqqnp
gTG8sLFAJF7PYjGakKfBiWkBlv0qgSSCLP8zq6/RZzFlk4HkY6w03Qkj4dlu00Cgxe5sl6RFuPV6
Psz4lGhWoON8bnYf7yBnD6hUhmB6Ap80KxLLcptSFKj141puvSbFqm/xB3Va2XvLg7hekxKVY/h5
AqWhjmyuLDdIpkseSBeMXTDgLH5IpSCvLRk9Xw000keZNGd59qPj3+b2UV1df9xaepIxQWKxYUP6
Zctzzz0+5h1dVzat5wi8qOGPMVWUe1qVPziYLUEjvDAC08HzdqoOUQT8SQc595aHvL0783SwNqMt
xcPHw53ogB7ohdjl4Kuoj4aYzq/MJdYsPtyePypp++lwm58KJv6OkS06toyTLS6jOia1x/U6xMUL
O2sNTW7WCXCTzhy8oisJlwWksv5Fg1Q3496k7bAVUBEp8nvFeCsEyPVPxLCg3j2gVRcJnLqLKbAN
Zi1n8h5y4mTn9iqpQc/bt8tkvYga7k+kuL6andlXYUOHT79P1lIGiGejR0Tnm1BSQNYIKpZ51V0b
BD/ymfIXZv3E4i2Hx1SgpfvuCoUpd+Iu/6ZcpzuX42JlDjleJr8ebQjfFxmM/zOz6TJHJTFWTPLw
VzgtfCQW8oV3brmFJCoDKGn9br6nnh6V5mTirdMefTHVIPgVV/wePC4ZzOEATARmecP9lXH+iT23
W8yIjaTIlVh5qU2SeL1nNm5Cnm8WuNf/aE9m/wiMmGI4zTv3995U1CFTsxyH0UsprOg+ToQrMefu
gK29N7R0mnsRybKFEZQqvj0fX0dYSwl9dKu1ghJ4szhFP6etJwarauZyNGPfs0jHoHqdtvuk9Gdp
Ruj6gQeT747RbWfhW+mu+jYZNW6XOzNCT9VRlswfJkD50UfQHXJuf4YYmHLoDC3qQcF9G2BdZOYJ
3+0FMyG02hoBRi+tIvU3Uq1OQk759CeW1c0ziCJPR6n+9k4rAUHJcJlyAxQu9Ov8T7yX86ZWIGne
hek90obraeN7dZhyfplG4Rw9OT6jpBVe5bmIPOIdys9tA8ECtxKSRsKBguuPYEyClJi4zew9uTKK
YoPI3vwwkJJyKzPUPgp3el/Z69O2wT4x9VSYGCND2MZj6FZ77NkpG2QTQ1tZl96q2qY9T2VVw9WV
HE3cYy7L49ABQ6wkYhVLGQIYP51pvZI+iHouQVMNY8jNtqZAP/hCI/4pSJmfCgGTtRPZiHbI5Ynf
gm4JvUapZOvI6f07d5ct7ugLF0cszFQ8KgqIWxLO8WcC1RJKxKJDeLNmFGEoWDjGWs2VrR+eBqWp
iOQUgeuZIqbwPpdR/VyYQyrR9crxVyn+uUeK7/fYHxnBcdAMMT7193PYP8M7Wb5McZLZI+ykwEbF
ETJlN8HupMOd39ZD1xSguhxtX0xSK2O6a1xD1QtiB9Oj7/8oE3auGaqASqHSOPEI8Mt1GZB+S4Rv
68e4egZ1ZrQV5FAMg9Pnh3Ce8maO4isOSLG58F3lciByOswEAh98qyQlLZLJx+G2xtF3NdrDOVgP
V0ii7etsJa7M7Q5PdLoX6WKejiGODXgAmMZUvbu0QR/TcTCyOwNad+oLucIS9urTprsKZ3fuR4vW
4U+HIOkRSJbnTOhFIX8F3Z0sHn5PqZJJ//zE0C5bcU+0MMgCpW+UjxoIOs3bWPrYi4gVdNQizV4E
1hMEJKv6CqiSt8s8aiqVbWUhlOYYf+Srs5HqLEXRhVtJOkTiQyUPa6gCxbDv0/AEB9ZWFSiNaAfD
JmHRmARI1d8bC0haexnmMIatIkvGebf1VsxvRJDkD4TKiBw50YGbFsDjRgRyQpsfuh0FxM2witCU
i4OOUONW3KwGqCFjMqHmwlEGluhK5qU+W7KmibeCEjOko0L2Tz7QomUpv7O5Iasj2lfMocXVNof5
T8jSv7VupUyhlxDECEk3Q61mB/ONca/foPN5L9J6KlMRBXAtl9g8HeuivpfPO52QvUnpB7Fn/Obt
R1Q32ipditg9FKd9WxMMgYAKrgpyOgptfYUj4jhqjsjdtSS6VwaIN4GRLwbG84jCbGhYFQjCEoYb
HPycXYtKjnrwB61e/qy4Wx63frC/YjZtOokEzwnGzJLc8lFDQyKSV39/VT9dw/Sx5mAzoW/IuKbU
zCx4F8X6OUhDXwT8hw/XOBlbYEltG2q6bZNHZcmOZX+uMqxFW3GHWSmvHlw69wj8mBSaqmTO1dfz
U9MYqX2Om29VEFZ1e/+Sj/po6u+fSuVkJW+Bjx02g38q43zp6Ixe9WDaM6x8DP0GkAgzzQkTx1Bj
eCQGpZMMfD3v3NU5JoTg3WYNOAgDE86EbXC82euepPoz+5f8rFBX5YMLdOo6T9isIFknuDe41IFv
theF1ESWPymf1fEIdZV/Gq9gSHR4sx2XY1VPOMWTcFNZnfI1P0qgfEvJxGH3bdxZWlpn66T7EFpC
F1JuWuUaSi+Oi1ju+a5b5AQv0zTQcxhRrnn9uQTa2ppJN56SujX2j2pdakJ2yIMCNWYb2xCzcywU
Itd7LlYfJXIr4yxjeUp8tQF5YLuI85Q0x/R5wfyjuKynJDpwIy9HOGVcisN0wYjTx8EuBN4zld7y
DNrghJ2nsaoBP7vZZQsU1lB/sy2kmMSJ2afAvyios7azgfjMsqovk0WYEQvcWdE23MyMR6ET4Avs
SKNVjM96Ju/1DX4tJFfF1EGPyC9DnJAKIme+5AQuULOc7+21Y1nOaQ0mnNUo0KPZrvON5nKcDeCU
CDVmQVwDpzIU6gjrwvlEoYBpyFtXVb/rYAuDzOUPnYr3nh9HgtlhL0UpSIemt7rawDUVVOop4jI9
71wlrh4covGjA+pPvcdONb00HzZ2K0TVckQtd7TiMHxIaeXx7DIvJNthhfKFtXcmhGla25pLloLA
0jvWDl5O7GWVa8E6UKMmxCzpFf3rk9xRo6rutNnotGmfwhlx0y6ox7XAtEFmuzQlFmVtenJyrGIj
7YHxvMydYUw4OG9lCIXb2PcRIzPbm/+KcBN0SYGXBY+hTHAzYQqeRYN/MtY6aOQoZx68GJ53AciG
Tgl9B7PDCOTG9ghRTod1zSWY/ZS+p0BvVWjQZeRddro1QvsbDaKEaCJ41NGvco94ecj0lPzAll/q
2tBzacRGqUIL5OVEIAdosZlQozoUMulMQZkT4ScrXuwf+G2917Nj5kU/oPl3BSm4mWivHV2CNuOU
6JujUvyRHfJk3PHnAwxI275Y/bAVszP4af0QY1wrKzW+2vTtrf+s/TDdvMA5kWNTmDjsh0YqdJTc
reIKSlcRoFeE/g/NuvlmB0XH4sIBNrPHb0W4iSVac2q/5mXDMIhCyImqIxauMv0JNkBiba7AN3vV
7Uf9WTNfcUQ9LgkRzUSl+nkSVOs4tKsvrEpBUfkjmdyM4VS1srMU2cSbkTWy6HUJShrPt9cRPH/J
9wNVG6UbyOnKaRHub/VFgh98nnIHjcETQXb1YGE6PkjRfNyJAGoTrZCBMm6WuPD59OXCEbafAIhS
lShbI+D7Ei5chaVjrYarHh+9X2Nhth1G8PKF2j4ZEIgW8daadn/y5p45wF3MmxsTTqYXro/ulWUQ
XQW5LcjnbMV4/Tcw3E3WkoM6oznJlf1b8uu/aiozTtlRv9O1xvReus18kpqrZqT4Ihra24Q2uG5k
Er2BwtTruo3/nL3NsjABhuZmRAZY8PyxnxdPCIbe1ifdVV5Pr0Xwrwv00FSA97nQqh+KonYJV420
30pqs4W3EblTBaWqMANQejVVE3elLkip2O1bQOWg8zEX4xYQOAybBCbPhxcfHJ/gY+9ieiD0FcTM
SRs787Pa/ysA5eYtZyxXfxhrMkujKkz3hJUS7OZ/dThyIDfC1UfKfJMXGEt5fMl5kMT5bOPvqIrL
MkVB44tx8YKfybCNQxIzUaMszH9tXOeTggpr6FwDBVz8G/Qa5BJbS5HfNaVSqmqG2Q/WPXA6ws8z
bLTxD3g8SCAJfDYHRoDiEWiLbacBJzYS7gMCrNmfYChzKDMST2ODtwZCD+jbJkcNqNAUV9i60bwL
5AJnVueVmfvFgc/DzG3IZJrVFGCS5BaObGh2kG6C7IwKnY2rgH3ATS5C/gZRcjlMvGU3VmRaHLwr
eqnU1hKXCHdAb3AYxFbYzU/qGYQ+x/66Ruyu1xuKu2jf11ruzyOE16hSKlgHRyvwpatk0eXfnsDW
RyUrtZWr8a7hRVo9+/Wzh5PleAP1rcBHJMnsXxJnvm/9TBHKqImuw7L58g/Dv1aOBN5KGfQ9peNi
ysaGRfyXoExH+HLR50+nQmlReAb4Q+X5QC/NMFdfZ34QY9uiH5EHtZCO7SaUQkWvCy/Q59hbVZNf
XDpmX3I7tnN5HUUBz7fG3Uh9Or/82UdJ+wMtxJLlLI0uhjUQC6n3pah/tTNQB4KZpzpsKntMlqc3
wzumtHnfOHyyUK7yyA4EzTGXsTFAMhhO64uGDCJF6dRbuSvmv4uL9BZBKmkTHAl1V32TzX6REIkZ
RvKqzRrfbUcgjZkGS13Fm9n5X31OTpqVheHKf6WImTz+eGOiEfKboHldvD2RIfmL7GCIrGysDkZk
9tYWFKzKOaXjuqGm70Bf9pk7kNixQM5gu5b/AbUBQQz00IzIMvqwHWowbXfEdT9IhelKIV9aGrUM
HNOoM0hWyPjE5FF3yDU1OP4kCLcoAUT3gRjROmmxG9wYtpT0D0IthreFkIbsxN+E2pqGNX0QJQxD
MPhy0lTcOiHRgQrWd4yIU4YI7OGfcLN4yvuhN7OYQZ6R9azoNIJ/NExe/mtx98cG8l2QSOWE1NyN
6yTssLwal6R8dW7K3QlaJhf/EfB+5uvzE2l8jdOM4sbkwQtWHsY9vCueSC3cW8Bn4+Iho/ghX81p
Z9yiBdKlXVl7fdWXE/QuV3ZQevyFPwL1UM2H5ixIn+dAro2t+xSS3g+utxITVAdXivGjlF3ZBjHd
7+AKbokK7u8Jht6lx53r/HadWm6g67WY5um22A24wMNTJ7U+0xzwR6ZhfM53aycYytnT9o3jj5oR
8xkQFYEE8/3YkiKcf7qH3cOnPH9VmDDCqpF2aOGpMxR+mffWVn/dY75Rvu28n0BC+3TUhhuObDRW
7ohB5TtFz0rjPHQC9X23SjOEaOOtPnW41+mhZ6r9cwqYewAtgh2mH1snsCCZ8rG/Fbs2WkUxbdr6
vIbQqjMdBySTqQzlZIo9ky2xDI2x03+XFvkMOOIrEZw1Sqrd3hx2s0sligoMJxdlvLwU+RFw9br0
CVds3kZ6lDhyBcz/J1TPbj9ppMOP5w+/t3ErLJIPuzJE/gFqqlYng/NN8dh6qJ+NKqKu1G48ZXxQ
pm8gOlWINig9z4owhycmqiP2UMrZWtIykqxyXBy6VFlffK+mGHuzPgnYNuQJdYN8yILqDmxj4A2b
ttmdUWmQzFUYJQAUWyIGBaysn5EVWrmgGWsbEBxZalGbvSm2uiBAGmKwmvFYTlk9CDWRBZX/dyGa
FTMZ90brpoeT/jPkXBEI9GKLv57YZQ41fPAoVYTZX8i8wXLJOzu9TqJ0MCeDmCoxSOvngqujnpj4
GvhMpQK4y5FjIvkwDUczr1vZGt25czzwNq03U9KOJaFtY+T8aaxrmUaXlSRJsjbeXf0+NLCgugmJ
1PCM7zAPHSsrjqu/Ki3966FIkEU+X8hgSir4P+YWEpXSQZAdMpEVrWfw6usl2f+vJx55XNBGorOw
7bw8d5Qc2dQVJsTo5S0mFqQl/X0eDkDamIhOtT+ppdCyD1t2GRVw/d4SaEzU2Z5TuG2owd9dZZ5L
mzb1Jmi/dhbaPboGkQ3u+KuDlEHDdOSwvOaToxlUbtPZ8eczl8sEGv/9ENUIcwauoiMfpd1LEqJh
dBhELqfVtVhFbPpcScvCtImed4MrpR4JQvVzP1Ga3nAG1W2V9JoL+NeWGW/lE4dxzQ8KD1018cdh
qq2D1P36npgQrC9uSflVU2eCpJPSxx2rcrR933mfPryBrpMLf657+e4Phszp0hzGBAOlrTrLSZND
uOa3PU2yfFtdHN46cN4jce07ww5L3RMnvwukTOJ+8+M7VVsk7LXo1mfCiOAWFUgHYcLGAKVLSLSS
AiVbwcBuKtU7VE1WTi1FDSRQgPOZZZE8P5jfdeArkc/8hN3+y4J3DAt+wb/6lK0CHc1TzHm0ZKxv
HwB3kzhtXDjSgoHQi+OvkuE1APcTPciY8+g1tur46D5UdnVqoNGlUyW74xTcpg7yDg7spdMFmZOE
bn/pe6XGjOHEo+KQqhhfpLj03PQ+KDiGWx/M+33EsxxPt+Rjz/5vLPAeYGzlguZ5PomgNuhRPKJi
MekX/0S0OqnyyTg9DBOyt817U1MXDDOZwvREiQN1myHvXVDklXPEq69iK5yq6cdnW1FPSs+MHuZ2
1kIQhyHL9gjI1uII8sXsKdJlzntBuGKfjLvU2Q6mJJXw4r0NuI9mqLhux/meMcLdWiwDslyePamE
zZGc6LavD3VZC5Gp9jj6aizEcerSsOXjI3fLhSBu1QnqS9NbEsXACKLS/Irpr6g5kLyh2vYdoEXB
745SP813CRo0ZRdJTUTSlsn8N15YSGvGq7d8V5gXSywbMbXQF69F6tjttN9grZ9EDNGuz+bNhSqV
rk9USRemwPyCV1v+qtM/i3I6ICIMpOsEEiCJHmWcdYt19MSIa17Y740c7YppHgc3ulAoCMxGDixc
I7UL0ip8Qq/QC9mdyKwcsLjl0PC/XPm+wl9JT8KSx45DDeZbwm5tmYl5pn6tdvfii855t7C2K29S
qXogElh25x0lZbRBBYtozluo9ji+3UN2KAv43Oa6f300mvxY0bj0IeF0UoBZ36Jf47O94S/lvsxX
DWVZHiWn42pX9XH3a5KykL9GBF7Z8u90bGmGYS1r4odaaP+AIkUbr4pnRA1JjYa/TyefFg4bQVmg
uQmSnKqd05PLL6mwutCDN/GadE5Dp7u4EbtVDR1GuMgM2nOqCP2aHc4DVpCl/sb0EII4FfTi5NL9
v0V/gggvcG2sade6OKjV+fZhh0O82JO5mUGfk6CEHsxynCI7oA7/ct+D2N7lhKOYlQS/u02TJskw
vMuQ33Br2e+gmRwlq+7UplfrgZ90IobHR6dLWNQd4OkDJDow73f8SoksMyiBtZFw5xrdCIK+eJpG
ps6SXcwWtw5ZGonyEspxggNtTM8PQ8ezzukH6A5fzmJxz1U43bg0sCsWMikScuIEVgAjZhil86kY
R81/cO8SN8fnyig0/Ko+u11aRLQV5eyMbnQlfyJNznucN4si0lv9HQOgCa/3/phtUEntbMtNJLpL
fvdIoKTCeIB8qL+vH/FqpMA+CVxs4MeFFICk3QXU3RL+itTpoXPJ+4ugGQ6zm0jKpag5uRXv2mEK
D63qYxYz+0ONXnipebxQn2mSJZPqZlem7hywx3gGSPsjzZZqXzYVIHayEe1eUn+cNE2vqBYG4bN5
Q1+hJN/5iZpzzUmppfamCrW5RsbZyi1u38aPqk7n86cdodLSkHwJPB6Uy0RmNAmYR7YT0jOht/S4
fPR6RAHlMjtOE3MDSKb/Zn+N9snx7aeTBT8X9Ncx9tvIxOY3UKT7uSXvlo8Z2liL+LrKg8O1ZIt1
a3BOGx4I/CS+QunlpjCWWDDSzIlnEPaqyEw99W1LiLBi55Za9c4EYkYIa9gVJW6MCi5kc8UXTSha
klk+W0cFbPZzleyHTI2qCXHvASiSzOuwdjmVBWyoAam72DYU+gzAiM4HEeMgFzO32DaAW3ey5iGW
26Wgolirbh+dvzTtr0qZPheoIVxmjWvfknpCAtAguRfdaolVvlwgdMwhz/Z2KqPff3W9C5hK8YYO
HBvozeEvABEmbhUitnuM493kfmpy+OiyWTRAHYXiFScuQz9tlvwQW/qMetJe+nd8ZzxlhcsU46SP
wK37BFLxpDi8Tuwbq0gATz2kpLi9byK0L0GMENsAZQ0Uw9XdpL42jqrhGLxJuAJVftCgwHlyYvgv
FfBlExGLh4zAlrocCJY1p+xplQt6T75UsE0TLrTS/drpNcHYc1SHLO8hzunrORp2mu+B/BOWExFX
R+6SIqz6tIIh3JGiIYFe0u1M0PJQyq7bZHSbs+1HMS6a1WqpmHPlNppmZYxG5LJV7vKE5EHX8/GH
J4gzPUXOGQM6pJdcUyqdCn16udoOvWRPi6QaRoXHIbW4jWu7SzCF6dlhzx/27KL9QvFru+JhA1GL
Io15tlfStd/e4ncq3m8/nlArGpJy44ECN+G/RM8Votq/UiA2agMjhknepORnM3fu3yRrCf6uTtYi
me0K9x8qlNCtHZsenXD4Ekx9BlRGxWIKfktP0EErooDKhCEtxfKuh2tby5hikQ//heLC/9UyzqiV
OpHe8Aqo+hJLOUkZc2truW2vgUiRQTm3K0yncgEqdZ+7jYsM9cQm2voL/Hs4QLRuujlz6lASwlBo
GNqqp1WF6OX+le4n81NYdpuwcIYe/QDdqMoQT3kCuykFWHOTUm6x4Mf3bKcacDzJeeGmBt0x5m2E
XsT575ZYKRym9kpl/Y9MZbWh/AnVUz8RqRDGw4xg0HAz5kgV9OF388Wjp7wH28jMCRDkCrh2BIu9
K2YXHF004IaCEOrFjLWrH3XgKrQQYHOXBtNstxdQmYTNd2/G1C/9pS+PaUMx6buFMl0eeAFadYiN
bBfYoHxG3Tu7YHP8lakYcNkHIg4ltq126qgNWqGSqzoNdnd86Bxg0YF9+tnK7RJa/9U7O3KZr1vH
AWYBuX6nxvd5rewZTEVunCZuokFMXeFvSVaois0udpPDg+FZrw31k81fpyTFDKqwmlXhmhqd9Ma0
7sWmilfpGrobjRrgShbCg6d5Joe7Y99LKX8O50Mv8dfK2pc0tU0VZi9RZJnu1SoyEcgrUhXVVJNj
qfwUrqTuwMhsWwm7ZEV0syaCi251jjzLu2+4eS4W3ugKFTAxtCrzvtMdwFl5nHh9qRjZHwv+jI01
NAxXORgmhWVzomIJphDJQxuuB6LcSXcsAXVI8RfjW3PNMKZK9aK3RTNLHXo5qvzcN6V2jprEhOni
ZU60NBPeIt1DQ1NoXmnMchtcc105O+gz+B5yMGgbS272KjtBW+r9bm9jqEND910HlpNGs9aBr04v
LAOzDAyJgV7R1clUzwswfZk7bGarG9r+/2M5aWQKZNlYtloAwfpd20DdDeF4daEqyxhKu4XfLnMT
f/IEQDGWRToXkcZ4f4Ux+Bqi4FIZVnM0qxryWhHFsDMSrhikVnVpumf+gWhdMIqP8PZxvGZEY+HK
TF8F3uPX8FWjVTMZToM8Pb7GOA+5w4i3N0hCyStrcE9rP4Ro1JY9mc8DM2YiufjQGANrHu49Xk74
Rbzdxqq/WXhJ5PbhHbFAUZQBt1waMdIIPRp3Nicm4I59NmxrYSSpqaXLQa5aXSh9lLX1RX7IUONM
mRVTRGjFoZRdAPjkEY60qkwzoh1Ot6mj1yyYczULUzpIWzaSzSS+JDyL2FWFjLPzhZqjTpNw6uTr
u4bQljpzq5Qy8edT/RWOnRzQMaMQ3vNdnfC5C3o1m6ScGZ/YL3mssl2qQaMNLD94LS8TbXiypmAs
6Uc3L0twrwGhh0TWu+At8uT5TLeu43+Eam2OIT1YkBVydp7ybNIY1zwrOgpADNNJqrPDm9OVkG+U
GHFii3GO9KcEX7p+p9mlX5GqyfsQh4JKluhUZZFz0Povv2rninK/X2zfamFTTVmpgAea0w65Ksk0
Qvd98C/uucS3HCDZQXh0jIeMxr5agkOq7ZJTBWNeVoBtJioUHlpZMeiSiEvL1LnJCLwmCMCdshUf
q64jxCvlOPwH1G+z3bdvdmYNhxaTC11eufQRmwCdeyJaNmT3iglBIzR4AAknm3N+L5h3bnb3cyYE
ajTZ+1gF1+pVVCfwNM4msLt1rmFrW6+e8gQo2RWufwXOGve4Su1F8+y9Ssb8WALOsqaTXvJPRz9Y
pO+OSKvKqXhjzbPke/YrnK2mQxRDqzwUds40Q41OPaCUK4/lbFIqlGvlVkb2m2pTPht/rRo9dnAR
u2j4p6bNOF34Jm8Xdlqxew9Fb1/0XWlGbLtSy2x/V2Vo4sds1RpTakLp/+n/BzSc+3nLQNtP5Dss
nkhEsXnB1f6JaWwcwAx31cI6a9kANWkgprxOTk7n8hTuU3M3B4FcU+0XR9Ym8Gwufp33ZvreC9jH
QLnMm0QWvZq77Iqg/q40Uh/L0Ze+wXBeTumm+lskZcTcBAOQJn/+hE+LaJhEKf1Sft9BQrvXwBa7
8j9c3oaBpYOU76DWNJOV0pjNXj8mLxo9B+2l00WHj+1eDGs8GMtTnhbElJXeqPUNl0gIJgASPuqO
W3P6W+oyR7NFBuha5/IFuv616uI2jmchYdO8DKsbIBxGKKkdBpCjhmU/EsF/zbDCuZo4eYawj6A7
WeIIxbZeMKqudCMELpyStSuZy25Jo45ZQnuGs9SLKn9Jdd11WxIhte8A6d2pjHv+R230YKC81PYr
PokwFYbTqeGLKgfoWvn+GEfSmzwPmVCIGKXA2dt32UPeIj4ky11P67ag4qwNml7tkGjOzmXrBhu9
EnXlfTdEu4egr+7Fzmuhp0tX0KVnXal+oiSWtXQPBs5/3Ppf0S4mbu49P4JvKIl8g13FcQesakio
sLz6dDb0xefF2c7tQHQlrCHa0RE/0JcE3VFsgF2tPunJGHasxU+FD0ybInEQrUDwVr5AUBNEIMsi
Q8KnFWb6ESawW+Loyfi7YAOvmN7D0Dx3gSNyxf1ahNn+XydLX48RTUTY5azNUnRqDyBmP/8OEnCm
Icu3ntwJDcX4+0iA4VGClyQpLf4h6h7m9yJSMWXn0H7MX3HC0Wt4U9Qi8VPYK0q3UaLIKwac2B+M
GNVecCFESsoShvltJcQ0BZbiphdrfWHPv0153rTPTIoLsOGYLtvx6BMGCoHtdHYAMwVpHj0/KmdR
Ph3Hgo3q5LCBEEo1YYk4b5I2Temiv8L4yS6W8gAj47NQpquINa6EgWoeYgvLe4YRGt4vAOevShix
pIndp6tQtedt1K1Fm2CSxkWEkuulH2eMfA7uzbs7GHRLNk2Ub/+yMscARFmjVHoViLuHpnZLc5dQ
jEf/WK5XY2v20BqVbiM57znUy7SEA3xeS4fIaPKSQrL5jnCnnZUBE9n3z4YH01qbYSDAUFJPMy9g
MfZduW8PrgPRvcZFm6k9E0IowRhA7LfjfD51NPwhCqEJS7FpRheZBqO3dlQtHGslJt9xPJyLiAbU
nk8CdXHm0q2QkvSzN9eLPn9rH1K94wEal3k4R6qeca5dmMH8njHezgzbqgTMv3onf6dv3d4tfwo+
W2oMQgypZNwVTObG36nKltM9C1zxJk4H5jgDB+3L9UXcIKQEtDJ6kTDhZ0Iz5DIBo3cmSWWAmpaF
5qmyNRM79xAxolcVEmdkqH79ItaaCb2m4r7ZDxo5sAR5Brmzwi4Z9/0vgx2SK1sJRfyG9N2xFeDN
0aUUyehm8wumLRwxlANnkM0+FEHlF6OXNkPtd2/SWbpVaMYBZ5z2GEq8uwiGb8PcDzi77IXLOG+Z
m72iwe2Nn9CXdkGDmq8p0FOrTFvnI1kzlJH/xDvMiWYSSTRCVX0BnjBctYKU33wg9zPuJFiwld9Z
6bEPpUaku1+EpbR4J8CbbSLzdl2Vhl7kSr6G/LXHmJtEH/d7KhnKTSQszMelTGtwx2L4z8+x2hrZ
HRYZn4V3jOlSw4CTRs6oxnU+ZBsytFX6DzzFfAX9t0Cblc9THO9pB1ch/Az9ZkvXtI3LU1Ap8fBu
RCoW1CxKJ5yXhmluKRqCOKXRO7MxgfmEwubciqN9QkRAwJ2hvuagvdiGgvylR3uouoRKVQ4cb2mt
wmm6TiK1XJBYuEJZZj/CjHXbXcrzo4SK8f0eDvR77WKT4j0Fhu2GmPkOGNfSstp+J6Qb2Pf/+6u/
hTjzJoiHvbE0STm7Ab6RqRpdKKYWN1UmycPFrrNBVIUwJN0xAOrD3ZZNShQ7ggd7JGt23hIte+z9
hYKZaxBhbPmaLVTuKMN+0gy8js7N2Qifm2zTmiiuwz6dEnT4OLO39W+pqwU628Y5uqMySTNLYlYE
8fedP5+5eTjpAfdAk9LScb/+0y1lNR1ebkqMryW5rSlvr5z2m4Uik86BOFnJojCmhxYvT1dcLDpB
4Ev5F4VNDB42xgsmiQDuHBgPEzxab1jM3pRI6qo2Op98SY69GHZW6yuZeLCMnfclG5QRwyPILT1d
X9vxfEC1Q/eVzrDgcbGUDKuXJtXTF38qYFFS3foz24uPzc0qxMCjwrx6DOLjzAVqY/qr0MZUWh5O
TqneZaIHbolwRPyqqkaRU7xb6gB1ezLnt0+f2zBqujtg2pE2/zDEoH86mO2SHzSgipPnWp+iyZ3T
xgbQRuh/tVeAa7BQm+c1YiwW63NRUoe0yqK2XK53FmJqLcpB5wRisVPJ5LfdEQdFpwhr3R7MLwpA
EbSrBidTOR3BGl1af9titdMRs2vrx0sNJKUd2L2E2eIareLusm4KZb3YWvxqPGzVIdJN1rTxkQZl
PsNRGdD1KikI+Iq/cRYr7vhfrO+5VZl9jwOOkMML1M+vGHtNF74nKtjVzqiVBHM/lXg2k1wsBBZ6
XiKYn8XCzdQhLsAAyNL0fg8+NLBcuiU8/Y1W7fa75WDO19hW0+mBo4XkVq2p4bAxN4sJzD+u06aH
1Y2k5kwkzQMeLnYOXllTW95aJtDtXiLbWu8TmY26s1WcFd+9q5aGMk/E0bLDd/BpXaxY10HM3hIy
4hKj36s0iN2EXcuFyWHH+HowbxdPNPrXJTMpw/MQya4o879bv/i8oSb4tA4S6vLSv/4xtcn/fdi4
kJ/7tveEg5Fn19mwR0wUpNKn1NXkrzoEkYFjFhYsNIVhMzXiHBa7KnCIQo50hlQt/PnQuzHDGs6a
guApT0AdX7TLFaeBLOkdMUq3rKRxsWQVLiOrZuE9WwEKWubM5jyprkPI1dXYq+hzsYryML6jNeWK
EFpYcMk3vlBhfK6JMb4TX5eck5eo7hep+8WqvtNvrFJElKKKTGb9s/3DiJi+yKNRhIYQEIKs0Zi2
rBFl2u1pS9p9uMTrGuepRD30EQ5Wr1kIwWYJxcILPChOZsv8NfP8ejef0jrCbqqWDc4PYt5DEI/C
sAPeJfi/oMC2vhUpS7RHi6oC6xbCu0niSUCNtLCTMsAB1sr5iV2X+IzEvfX3rt8nHhevcNkDvL1V
/7KMQYKxRgzsKdlpz7zxf8k/y5TWJmfQZdzlB32hg0l0a5GOR9NFOuPA5Zl03uS96JiyjI2lLt8U
rBYgQDG9yK+xuSgfuJsN67UdiDmswgwK1O0fZivvTuBgghCegz6SIvbKWm4VtKQT71B4S4TM9U+5
so7YTlzvDdDmwILQFU2bet2xnqnjNla8xPxE7YjAIuQpjGYYTM6PzPChN7DtI4FVoBdOLLErbmQg
pYJ2MAYtmGunZsJbcYAw7j7YR9qnu4g/GVXCMmGBdAH3iLzC/stbLdQdo9PYyYjg0bP7PrBqJK3c
yJvzx43VFTT1bYS0iCQBUKoSaIQG5lG+KTsee1/06H/DvMlEQCtT/Xhfpz5sk7X4OtPa7b2LY1GN
cy5CbK82a30gnx5O0X0UVuTwfN5vP4gtnl2Kjn+KrKUCuezYbxb8bumd6Vte9TrDp+nYixPMz1fZ
rXN4AV6aCQsia9wkxGKOwvCUzWSy++HRAhhMAvjsZtUcuAt7XDRaxlSqRqUGNATsSFiUBP0LBBqa
11DYR6cxOdokx38wdEFXCLw77+EscYOjZhhaLlz6cn90NIHpFguYokXZTtk8EizEN0ZvgDR7ChOO
MQ6IpScylWonr6Rb99Wb97b9aCL1QV5uY/V0GbIOmvEl0SEuOTXUy9O6P/9RgP/qoHHp6aKwrSwi
rjiRBSEYWZm2fHqMH16O47FxL7uLona3FjAaER6zeZz6/KDz0ap9fSnCLb44Gb4P88zYfTZK0zOw
t6omhDeax3gKTKw14zgvQQju7Ss4GV9ybbqM/yH2bin39Li//SnkgHFjE9pm2Jl2GTYMKUj3kyTl
H6IYDkxJBFKIJhxs3w+wpwKaDfRtVj5333PXYwl+NRqq7slCDFWh/jQ5i43dSWc+YA3ZBEBPNrqE
fUoY6pdZsOVlYiuTN7zxkvUJrdNIqprNWjeFdbCA9myFVbKBBMhLeq7uOLJ2Xjm1wvcTeQ1HFncQ
ldGcMxx60mO9eNcmv7TxSfvmG25YQ5FCSmplwGvzATbP2AXM7VCQ01Dq5oIDC1mdWXYiYtmSs0cX
A0sKFKYwBRToyNNd2Qe3fu9oTerLmmajyYvFlF4mmwvd0rH6HPfgqjmwrvgj3dUEU6CbVpfzHcFx
mSZmHkNIshdmIhsHYZ5TcGPqczDAFED1dn8+uC4HxO8Js6+RfJEhSUMTEqq3f6NGMQLiXGDNu9p3
2SAWol86GsUfer2LCbvOiWy88nO4hN7m09eO7RAH41R34yBJbCVkOhDpj/EljK39X244voq3rCpk
W5BRlpykkUzw4BeKNdLHBvZwV7O9X77vblr45+6XdmWyKFxEhpnyMy1/dMJasec1z7lzmxUV6Hu9
qEdZ8vRGxVolHZ8FaAkEX1iIiVesFLoku0rUqcI4GEmpWgS4QetoaA6Xm1wasCYrWdr+jjsvVmim
w0R4jGZTWKT9Z07RmdmP1Cmb5ntPrSWsrzEYospPSiZqmIpNSKKgNuH8Uk259uR7ZcQmA/LI7t0C
05oaustMlqesQhvFqhNAPxw06jcE8j7PxM/wSzXGxopALJ9hcIkQKkR3QQGb1KJYrb46w7LjL23o
GVBVZz/OiWvmChTQbB4gC+i/aqQTyVD3PkV4ocqQs44LFAfs9VfNT1GKsOwzKqklYB3C2KsF4Qqv
mrhlHU+eZ7DYFb5VpYOIlDNZTLb+F7mFp3qR6p8/brb2AlwKPf3T8++jcJBCdyOV9HUoP9blautc
24n7nO4gkIbQnTz1/OIsLTThRQhxZecqgJG3yhfc8CclSNvcCb5ipmJlZIUgQmSLXn6In30ctf6n
U5p9mT54T1oHTyBTKMr+opbBsi7t+OJ+pR+BpwvBxBI68dAArssELA7OnCqD8vB8PgKJzRZYS8dF
Ccym5cqsCPGA7xMd9xBva5B02ItCzLdoc52rzpMgh/QltlfJIThbXOHUFj97BrpzcPGtHo0aR5V5
GKMpCmGT+GW3J72vO1YtpjqnRm/phEHkL/oUQWMWB+wM+0RyX2gmZ5UFKgv/8FCni24uq9icrgjD
Xglzj3V9fUcY1tAPb/D0FXme3lQQOny9BlYfKOCeMuRSeN/IJD25QRK27A6kb75WWZK0qTJRDOZs
6RRnSYaSycjnE3KX+dKPFmNPfRE4zCoHHzUqz+5spCSuZDg0yUdinf/teXuVY5o26ZQC3NznClQ4
lGDJ3o+hvmx/6bTJTNyKJOtMgPWiEJ75YH5HElekDYHan4u4ZJs6g8B1uzY+FEkWom2J3UTaKXha
rBES/CLFkiuwoXtePK/Yb0N6xwIMfc15JddMa/qWawnUQN1GS3YV1gRZpCqSCgpBKgsvf6KRJNDb
tg/WFikEuvuv4IAMxro26kFhiCd6FocBaC3CdYkd3uBBAxoeW0kyIq2dmV/I6D0DwSXWfXHeZhiR
VnXQDZmKMX25jzpyi1I+CRreBgTFB2JsyvtLJhCeN4lVd8JyomwEzVZ0E9jpi09TwTvPoaEtFsOc
BCUajB8BnS2T3u7gaWQfLl4eB6jGuzha3gc2IOnIQOik/8CNgJwru/lVNg/sEP8WxSPiSE97zJ3Q
X9IDATF2gXt6ADEmn35U9GJqr/dFDlwX7cAvzASnl/g6E/CvgkugocJ1S1DrhiP4Zka8Fgo3RoXS
/gULr7/X3kHhCTC57LVTYDKdkq4dq5BsYNvxiZoP76yTmEMIApc4o2oSEHk7WP8HB2FpjtMd5ymb
xIiqnidmaN7JWeJ2UyRzaHF6YaSkaHNz+r4aB+7N6tRm4f6zH2xKxYU3tAf5IYH1SSXGZwtAGatG
DBh+jpPUNQSXhlwPTj9pZm3caew0iqIg0CZ2Zvp9yfwx/a8x8va5xN+/b/NRNEFfeeCyRb7tm8Ze
FCMyqe8Vpfy51B0yAuo/tNcs4Zzy1LS4V4KcnQugWFdz4CyTtct6fFpsqFCLuolmn1/pNxcTJx/K
pWVXfsvwD+jrU8OGY+eV352i1QALnTi/ym45snWwNf5XGWBFiU2AwxGb0qJuRR7ET2Jxt2l1g1r+
/i6RGoKr5xjykd7zgnzt0mlqmOuNnrWSmvN77IR9E0OoPVqnIIdO7m4a4OM/uco27iIrQpZW0qmk
BN8slqe2PBWCJdnhvKuf6tC7CBqZvlZ2RPbHwA6SK58WWR6AnLfU23kGANAMT/KytxhXOLhCdc4G
6BBQTuqwbKF3gg0vvREJj5UFsV36HDiWAolLv81jg6vsvWF3HKIRPSOBaL/oTZhaQLiLkMdznBT/
Fj62ccwjdyxUh14pTnLIbpGWT3OV30pG6OP83KGPXaK5WeIJrb/5FlQmCm7zOYXqXADdABglPDRt
b27o29NMSQ1ResTYKdOCbK8nolyzO+CC4yTsdG3j/QMTxBHasVaW41G95w0azwRN8LQy6C1VBTOJ
AHKuKHQE2H2PggxfUNrA3LqdVLywc3y7xonALas1G9M+squPnwuBiAlX6xTySMdzIWtdRBSoVX0g
otw3X1Qh9t08WiL6L+w+82i6K6VE4hc2As4bNNaYwWKAM1t8C0Zk9EB96IxTzmLSmN9W5kwgisJ8
opac7T4Ac2XPdC3aBZ1LBEIuPDkUl0l5q4Q0PYRj+dzT3dTqZWeH3JglujzaTIziVnoVbKMi92SI
U8SDaB9YzSrs5Mv0JnXO+OHg08gEAiHRupqRK7lqeZf9LXt67r7YvzSPRkqnHIt6uOoyQFr70QxB
bHxfNsFbFTHBLvry73JuepXt2ffMBEDftIziwK5zOqUBpYhth8dvUPCfD4Ct4wsq3mKVUfpB8bua
kCMaZ8XJm3Zfv1n9wSAQ1LaKuvL1zVacWbZclLFC9XFb2r5R/HqMluHX7s9VMzw6RgODqnqW2QMb
il7x4PU9pbht0h181akGdfOsmZ5IRrOSzLvQo4i5hVtmcEQHteI2b8xMnNXCQlc1FRXJdoPgSIaz
aTcPI9r3xYO/VNbDtHPUf98eIyOpLOP1wfRz5IOMlOz6hV5HUzuG4tO0fH7hXhw3qXn5/B2xiJv7
KCV5NKnadhoBog9x1u4djMcNgNxBtMUjPkkdat1qDxh46oqekeneROftyoVBfy7fFFBus6sKd65A
xhYvr5tpASyJMDmYbvM1Er2rAevO1g1gTI2P9ZzWNlfup1JWkunS9PkuXpJKZDHuzl1ytseZAgs0
BC6Crq9dr+cqSGUt+u057ryT9N/v2VjoO3wWTKX2dWKihaH/HQBHzFOmoq+g92gOnN41p2wDMVwO
UxYhpBONeDkY2jrfryTeQDJ5sDJ36bXx9BsBOjdqbXDl3ZCkpe2nDKWOBpBAs8m64jkWJ+dErErg
m0CP44AI1pB/vQU2tT73oUfzm5vTWdVmkmdyJQtmwX05NVTY87vWN+V35KlLFwGzP8reXUl01rdU
Jc7yu5TTKzFaV6xWpgWesD75TtIxzAcpxPehaKsjeTiAbah18NHvxhP7TGpRSvV4i0vJJ178LJeq
TRBkyftXNfmuO8eSbm/wwG/wZuX7m9+J+Rz4zuvbDj9baLDP7CV8cyyOkZpCWvGvJWr6B1eN197f
U/ZZjU7o4o3r7zglazh5dWmZGiEwX7RrMD1PKkDXEDbIKt41oLnoqeJoJfGW6/5ZoFfzHHxrcp+L
J6jetpFWI3WNFb2JYpiXVpkEKfdrmHNRztJuiEHmaf03FMK8Bl1JsosdDcJ1TIjnsocLRLLSjFN4
Sn4VaJ2PuavH6xmseoU89tc9mPE2N7TXtarJwwIejdTXiX0CL1kSfBUX1rcWkD66xK6nfyo+wVdf
zqT8uiUfjhS3bV96KxPvhQag/+KpMPUmzAWFySDUZ475RBx00eYBZf4CTDz1qDOqWBHiio6p3zwv
5yDnT4gUXsUT4syhOlCllxV4nZcMfbDEXGxMLKboq3iKAkMTWlFNJCO0fL7TQffS0RyfG4LIy3P9
a55zVWmUXVvt1UmwxrSFlHWJIaCsYOcQAv0i5UdOXGIy9OahCi5+C7fMdh86rG050ecG7haXwUAb
VAFwQXmS+r1Tb579G0w0dCc9d0fcdDPGj+6fmTXpINJ+x9kxAnjyoATU4RUBKVrQhaWX/6dQC4tJ
CfddS1sMkQ7NCEu/IjQ+3vtLh1nzI/xcpd+veq+WYFBHD0hjgbX72JC/Rj5tqDVRMByPdPr+lPl9
tYP7Zcf//bP1Zk/Zb2vTAfOrRSmgOjztmLZOlGa+2FHZ+SpzrZJTgeTD7ffk101dnlhcQRJBINbR
PpsH11sOju6NS44mzC+3B0fNIwG/rRLQ0Wlc8xh7Xvk6W48vFmd7Kw1sGwG5/onApvgdnCTMqBf+
G9dbS0ngl9S5GB+wK5rOfOdCLKdP1N+Fw07BGr2D4TPpxxAlHHBRJuib9vqHiz0iWPPksdp+Cbr9
dyBTQrRA5coGQAlOPdvI1nMXcL7w2o0FVUY2rKcSBZfpd9iakXAoBIF3Z54FGQyXnAOLkJVVZ1em
137PI59U6zqYUQJYHh3X9Z1yD2/8TyMTDRJH81CIeQfymSsSp8dnsS+nBbMvEgtcsNC8VYWSxiZm
4iff3rJxp6/OsgMG2ivd7R/5FSATu8TVbAl1tMjthG1UMBcVDa31c8IH9bxGpBKr4ty6ZF74tbYw
CE8MROsiUR4krqqUmKdhWeyhqbUJFvW4fWdJeBeETqQ5RqwXZ/EP4fcTTrpufS1U1+SzbPlpt7tN
L6WVv2BRAN1FW4H6bLbO9Znrw77qO1Wenit2JRZBlFHL6kfoH/8hP3IOb1IB72vBa2LnG6BFhtBf
CwzxnoLjFXzXmmCN64B129gJP6Q3wwyxW7VhOOumcjg8yUTFH7rfmb5fWeSLheRaX/o1J/MACVAX
q8va50ailBVwRkTogBDMUMCyEPWzAaaMf4Y+usnvkO1b8kr/1t6k4QMm58SHd2QWnKC5/zI6Hj/E
4zSyxFp0mNWVtKXGsJmDYLauWWH3iFou9MPJPcRznmk+0JglLS4F182/mobqFlnwSS8CplZINLj2
pwF07G4u/8bL8yaxByuvXNz2NuXR3nlahtxbBGfsrT4/2E4c8etNkhmenyJnmBY7DPgc7d6qODXS
OJLJK6Ya1vcH+9d7oKZ906M6/EB50Kw2qzixQDr5d7OERs3haI6UjGNY1sgr0TOVuDR/j6j7MLUz
JUKVWSaHNYN2w3gPpesOk08UuFssRiJIxu1CHxT+AQL0JBVXI9D99v8+LxUWPygBXzNMWWPkIEbM
YnBn41si2F+ZKyoNMwJ7WCwFHaUzyO+Z99NPeeFJcv5Ya2v7qS42ez+FLFTytSEzRxJwwNODoswB
wknqQqyUZRlX6SxNt49wh3vv0K3kE17pt37WS4p0TGSlTgoR6d0acUxe/0FC7UIURTgqF56ZnzC9
i5L/yP16GODM97YoGWGPyQr75HP2McikrdjH7xdmjUm7c4y8pNQDoF9jM7S6Ie8L6yFsu6XAKyyA
Cl2AVYmnjYdzpKpazWc1LRy75Cdqhrf3P+UlyIHQaqLh1b4SYVYsWdJUhDlK3xYIU0U+VIOq9lTx
ewKlg7sTMeUG54EWWlfqslua0vfyjtLtTOSyCL6CN8qtfOk3O7TJtzOqochQcNQOpvlcZSFFhgUS
GonX6J2OTtlIRInD/T9gUnAywbQDFieFb620n3BR+AGWsQMkABJudPz47G6OW5QnX48YMfcVPtqF
GxzvMtOogw9B543Vz8NbEJCNk0oMBxhsBGZ3uE19K9na8TdG9ccrWiozPecLGm5xl9twtU6tQmn/
Sx7K8Ac6Mhn+/Pa9nBg9RVsBMbhG9WQesbUWTWOf6LiZvLkj7zMlhCTLnea+Y7NmcV+sBJ7R00jA
NkxQAj2g5Zk7RSVii9c4aIKYbh/ywZJKjmEebDNEAzGd1IPL14nAUOuegn15EJBfyjssL+mnO2Sv
UFnLPte4NSwjkpLfofjpmcnkDRYAFFMaaf/hDl+UsF4w8Tv4u9dr9/GU+d6v96w/dHXLNbkLPy/X
vRL7M9vPOUcwa5yQCPsZZ7YiDtZzDk9+CaQ6Wx2SjaR2D6cVtRn2qEYz74SqCd395MpfytWPIUCC
vPphFIKs+KCrDIeWolhVNVtJ1A9VmMSoB6DSAWn5xoUAU3pyvYvdNoQhV1vu2a3UU6xaCsYxTSOi
Dwxbk6Mbb4j4T3sW1MJe71UD4ahHYn3gasq1ePjpTW0yFOmSgPSOfHEvLvHWVUkwvGzbQ+s4NCSC
wQ12T2MaBQsV973hRXKrOY+Rg/3t3+ti/bq46SLZPFSgNYTqbRQ4Wc7cTmvEYP9ghhLLYX602x/C
tzNucBQdCfxAK+Q9+RJrrkDQoeK0ErFkALn5syoCe2J11KbDL3ySa77gx6DbkpJ5c1ZUXOdsXaXE
JGN6/CK0NnLn4LCvJFODpvVotD1kM9vSBCn8aIfhS1QTIVK06sFiMooGcJytcBe51XGIp90U6tAb
HTdYS7SdV/y4HMoMHu7t72PEan62IgqEaMcjsUcwuP3sxDX5LzyfPLulwWOzTZUMQQ3ePf3tu8lN
UxyuTxp4Oo6PKGqB/zvi+vCsj509caDdW5Ir14xoMGlVjhyTeWZLrf7QewERIGBPl+lbQW6fnpFg
O004W0yLHqOpKNNA7eD9qH7jPapaRQI3QH/D8NRFvAXoehxIGKiYKGpXuj9Of1n8qDKX7d5qsXL0
JqEhbcGxt51c6PFMSsBpbVLcyf8gE+URT+gBOuRFj4/dhR2UK2ftGBTum24xSf0HyeDxBTNTqkrc
g96kybo+XaG+JX7owlv9R/sRLXVnWjoxl/qQvL2RmohxejWP4NsUJ0jEDKLf9pNunHloQkuxoBlT
P/5gsCWNytjBRaelPelbXdRG4m1PC7FEI66h6h7ErMtVlhvpmoh74KSgpWosG+kgaPpUA6bLARvv
/QvtUpzy595SdA9uYposR5q1wl8VI1dUTJFdxg8M7jvVFEnvcC1w7NcJE/hOIH9d4p7XmbKvDc3j
aBejLR8DM2USU4bzKCCUTdQiJY84AdYpR4+glI1miu8pHovqHPCSI0ObOpT8SKxNNjbv13pSYsIK
wIfADyi48Gwx4lHfB4tLfjUvEW3FDzTygRQiWV59DnWdQDm1xyCtwfzUpaaoJdsYcIxgBF2iwh6c
PmAtpyj+yP8plZSbiGF88GErl/U07tVCfYeYnw96SpAzti6rmWGSFDINDCNOhBC1S/Vu/emlBaK3
hbROgwYT0o1vFXwSPegr2MzFMigxwYyFQjwM1vSmFAI4ZR1yX8Gyecmb1bqW9eOhbuNkxX8EJ+aS
KV8AfZ3zLt/+LvJda3lGnGRc1v4uWemnPjkISpEO9PA6w1dyyA1hzLKL+3zR0tABcd/iX0xqIRyb
Ot9JEKGh2HxTnjd1CpTYRn7hJKI6THXT+bWB6TMFgCcNxruXgQ6/yfcYXV2P/a748HKQedbriwjV
eX+IsHN3hHYcHO80W+/O82RT7hXC7KaKYLoFHHHpMiAUknB0KwTN8S6HnQS8Cd9FxT368P0Ac5yz
Mn48a5pzc7qLOiHWKcZgCNRn7wZ21LTuxbvUrwzx4nvIYNGyYexcqajGd/8p7NzxzLb2c+cTIwvo
oPzD8UrgY8LxctMX7OB+psBpaVagRNuYzlR4e/ENm45JVVuCJHxFjmow6rD1O/TpgGjUDMXG46ba
Af71Oq8hnYbRwKpTfSmjUXMU4aH0WA7HNNRp7jqoEOQetY2T0lT7/4baCGbcrSd5xC3EfXV8i9hn
r269Wd7qQQMj6qywvLTRJTjj6xWFipb7xA6GfoNXlcQkbwp4EIb3avgGBKpBsI37ZHLDK2Jgg5ja
eYSXlXx36nogZGGXeiI5yUn5HSaYHBA8vE9+lGkMSQ8dtzFqSvxS6zW12gKaUpp7coiD9kImpKR1
R4VG1Y+SyL+78XO5giV/HeDLgfsxyxJOEs4IkfO7BqkTmGtsXAy8SkiSstEKBo0RcVIRFtBC2cDx
F0pxQGuYy7tMIl/wDoiacfpwffskvJTAjETdKHBcd3ORpqOxM2BnL30s1qacKWae3t1v7K0E9PEb
E3GlY7DtbkNtn+biDZ6p738xUApbYnEwnEnJyE9z9bxh3fton194n0DJO/BB1swmJ+1SwBx1r/8X
AxZ2FiYHDxW+zowE5sK5/O8LOoaQh2WmnwCemDqp7Pe3TNfk70ytJZinPxbvOFYN8MM5R9/iAeGm
f5o44wmPEy0wK6PKLbj1w//io9weG+FrLScW+WN+uP/z9UAGqMooq0RlY2P2RnLpIMoop5tkH9Nb
2+rJe+gjh6akM1WjSBmMb3XLX+ajFJjIa6YpcWkq3hKAjznP2vTMVXoRL/E2NLU76JdTftq/TMjf
3XVXSRr8SITFudzt13z3aViu0O6MoqzmbnPf7JIJlyH1DFtxmirfCGsOcFV4kufAlfu5QqYtB/5g
FWm1z959cuJd1nE6rX9eI+HxPJD9rhBsq7IDnt/0ufRtaQEY4Tm+0tVI64D4lSgVnxzRJVK3i1vi
PLeo6gJInS2jQzEWvsbPdND+7tTAk0hcKYw6plPpF3Avthgw0NYIlXlNNsh1kk/vGHAdqNiBcgga
v+swi3VwfuiQ/spbMxwuhPeOnj08TwQRBQg4E4Ubpxfg+4ql0tjFrEa4NunGhzrx+6TWsjL1CulM
6rsFTbem1w0SmG/QEd+m0tF1RAeVoyeWOkjXNz4OJOGnPMk4lBvnBUfE6mMkzS99p2hEF4hv4vij
i5hYMUIPBOcg3DH/x5Jzdo4YtlbUtOi04AHw0jd8ms+WnIyR80lVLboqClWcI2dm+wyWscD15TDb
n+JGq3lzpGyxQnyJdc2+XVPStqkEZOvxPenlMIjHwQ9QlY9l6rc0cojwLRdkVYZ6q/HBnq5O5zQT
X2CxaAxiIlZyVUrD9rrSAk5s2n/Bz4Kc7iYk87XtUXdoAasyDcRmH11FKzI6Rl5pKobJDT9Dix2/
9oD2QU6HH1kyyXAgnyau2cutpWybTHpdW9pBFeWkLStC+E3AjRzmtzQiSxOtCHeuMypJZZgSPd8f
ehiNw0gPRg9e0luvz7PFeJUUtkrRmeW2hwycbYAv0ISUG9MbWZzjaCk7QJF8OWXaUc4x8iopCFsn
g0TCDLAOcK87M7Wmi0PJayFq9olEbG+lF1M21KU/DmCftHI6nkfcDdIFHKbjHhmvxwElE1vXzawF
y7ntHc/znJ1DtfZKZr3MlSAlC31QxK1r7O2YZ6CFbOQouBFnyuuU8QycxUUVHrGExN0Jrhq8TAUo
pTocSYF+ZMX+1FQSfO0qAqso4fUv9iB8FUItovrzNyzfBbuS1nCZseWxl2UQpxBrye8311r1O+po
IwcbVofClj9TSUcDHKZWrZIXaYpw6vwWCYkZ3McqpfY4enBlqeArgkh/lgFywARLSj8K1IeeQhTg
nPVIjM5opaXI9KDrPjnd6l6k7XThgh2Y+qf9VjLYrj/LObzEBQl/yufN49EGJ0sifxqVI+ROYXGT
vqC5ljXbXxFiGlpUrRNEn2IYsoJgoNTogQ5JOrWXsA9t7Z6olLAGB7YqQTN/1kNwO6/8pKBupXeD
VVdkIdK8JXHJLUv1NVUUNy97ISPG84uLRcsWwF9hIFgpim1rGDPWL1TTWuXxWBRyhZdY/VCaH+sE
RrDnZK7rfKlDBfIpH+17kQaavowHNI5OJ4HXhw/1yG8ANvKwL6tnAkjMEsD9xcTnkGMGg/W7KhOM
kaZK5wHDlhsSLsUjLO/YVzouzUpTNy71XbnxYDMPUMgNYhmFX0PUkPoRimwfgInzbwTiI5ECahOO
3jL/GGLbfVNksN7n5K6qfI8B2P0IGul5JwOmDbetuJANi8fBZCe7WradZmpoU3pfyCJct4Vboaaj
VeZNJPTRAl616Xo26oNQ7BeVQLAXje1CFnTpYWBhGK+NHR8nFUCyKVpx9ZJwZk+fuc88ycylrxfM
urHIXykMf10A2nbSQLVkW/G9DNadK4F0R9XR4Vn6BcK2oQ0MQt4AQFe/VbEWpXYAXPaYgEigTaRh
Q/dbCxKAwx5QsA1Dn3jmfnXHG+VLjyTOiyMZPxGJOHeD/kU2vhzchWy3R/IF8BvOUtB6tC3c9HPL
9GD5tA+0MKmTWzSvhle10Fn3yl/vWr8I2tONbEdTrxceqK8h9RVbX5A7o2GT4N5GGWTNu7ZFdLPj
kMDZRiBlLWVTM0MM279NXw2RVTi/iGZqBe4VkFzTgAjiWnNC/j/1mXizbuQrzaUN2eXoKviZx3EQ
kztuvv77pWZBcnQl87ON2Qcp5DlzQwiSO6ClwUSuaQSMPciUaM+W9QqzI9i+n7OIFomB1v1jQUs6
38/+BeT5AcGxkJKBATIcWkN1DJoVj06G1Wp43pyRjx8deN4XDtzjBMrRWG4aHQQdRRE6j1ktrXC+
YZyz4j7UJsiEUK6LdWZL6ICpq3iBfRm/4QADG0QgGnaRFYTBXM8e5BGoxR5/Bv50KyDwesPKIu/P
7mOqOh7pjNnAKim7nBRbpQr2E4le5+MCwJuUEfVLHeJL+Ki4uXOJs8G2wYY1kwtbfOAcaqc5hrhT
CoDy1d0yJdEdOPSuJtLU/5bxJn5N2zKaYSL9PUNB8Yl2uU+zfHdPbIVr5vSMdlzuE1Uxru1uKSQ/
w3dQIwucfq0ZELx6owlIMl+NF64UhZ4xh9D7CcoAvTFTxgGkGy3Tn8z9eEWt74AbyIucDnC/ZBhg
tLNcx6GHoXqw0hiKN3CLaVp8n0c4DTXFLaivcLnA3rM4tPej3QLyLmSt0sjTF6F/asCrrTjq3Om8
TSXLnBSjW6ItbyC4UJvyPpwcbhUfe77DepkaAqCrji57NzjxzfiAfpmj7tYY5f2wbYuMFC069AQj
mIZc5+F0uED6KZccEYsXu24/MWQ3EKvbM7+xB6E23NPFMV3iCNAH3Zu67Amt5AxzYslJ1aWqmXq/
J7UaoZIkW1+0cp9MeC74cqRfqewR6SluXPowqPfMCZFAJKkG9qelULeBEiBAHsWvkSzy8iK32BOt
i45MmsO5rDFMLVhxOchtOTF7stuINDXvNRVU91BoE54zGad4tOShhPxkz07olvCk/1eBf73jYvkS
2SXET45m0/+FpXSYAZi+lNyaGiTUxYKllMhPEHbEHyaxccUphVgMcfhC4gkFHYoZRRCR1lYXhiTC
JDU8XSCmnWpc82EGaU0NJ2W17eb1Q/91dm2GTwP/WYRAuY60OXaCQSmjQe0J1UOMwvg6Qevp1KQ+
vyOt4UC09Jnlk6l3nUljNcGOjJom00/VWjSxH2kIYYH3sMpLgik5w85PQ3Kq/D37STHR4LZzQBBg
HJEi6+VjdHh4rDo2Uruy3XQTN84Ljc1hglOOaVtjcQlhaKtqF3rjy7S/NYxdtcsk67nXpomWXnH/
9i8Nd3E+AEIbd6lEaiab6boJqzYY2kddxKV/pEtpUonWpYndi84FABG6D34azH3ECsknkgonXU5L
E4LkhRHhTFkO00Mh4sQ/ZOC5FJF3pnSi2accoTzfViMZbPF3IIe5XI1WVQpAM9n/VcOEey6VmX98
FnoUf0V/ToNSDWJwEN+O31GKgpffzf9W2ymKM5++wVPmHGkr374++Jt/fC/Alu4Iu593CaVKH35e
ja7PHVlMJDe3xazXribue78cDQbz18w4f3idu7teh8l3lRKiEdUH5jIVvbHeSEfrwSVSKjdaaZu+
9cx/mQ7gmG1vpeJ7kg7ETpsgM3l+BS1jpLfc2mkePJI3lY0+2sjP81qAmb8Pm8PQ2B8aP2YuHKam
Ie+Bovm41fLlPQqA9RIBVU9/GcBub/XkmWCpnbZczcLWFDT7JTqNfM+qNxviRIwXe4p3YR1ClmbU
s/3rEU0suOet2RtsrjKSa4MFDNboHtbOV+0TFvl/W3UyvgMStnVNUX7mRmm/X++caug2e1x11YbA
9bCmO2aPrVL3I9YCeHHTuVkM3lGAeosCNsP7v82t2PALKpEsdLk5flX4qTR4Kpyrzptx8ti+DJjQ
0CzaIDQB//3pq479WBax36pmCz9Ny1PWoakIAA8Xn4acMWIxBT4P66hG103XGAiUKDNYJhw3H0kW
DmOpU9Q7z07ZlpGGR5iWjGoHs4MAtuW9i0ne+cUWZrk33/PLnwYUVmQNLcz0TCjYqSw+b1ymMrx9
eVdLc6BmcNeOCR3XIpAZZ0AAriRMqK3rBEQSp3BgF23sbFDBHPRtkLhT9KVxto+se79BoTFy0dMY
XSudR+9vlU13d4DvVVJIQ20+YT0cAXoFXfa3Jx20XWkF40+k6terz1skcfvFtUOlRwz0Q4pI6n+P
z8JyKsMEUniQCAyTUTXJuZYs/Hv1oWWnIKJ+7pD9xftadU4fDvTwpDtnnC/ULR9bF0+pt7jHmdAx
qP4oTsplo7izH3kXk0GHzHthM2Rf8Nf32TAxKEBAlktXy6qe4t9N1uxXlBHeRqug/V9DJ6W7mPvu
D4tZz6qDN40u4jE8PbHflFl9RQH/vg+CHm+L/pzKR/4GdhG60Q0aIn7fx0irGWkvd0M0kfZFY/O8
uMYYkqqD3HSBL/Wg4aguJfz2lqo1JDFd6dFUL4lZh2lrRnAB82JStQa9MOybZ2rcprosxdV6vIeH
VzXQXTgdMpyfLv1HWWPJ4Zf6YHGA5NkeBXWa5PpqoqPx7rA0dSODjXBFvVwfUS1PmdJ9RHu0ab4/
TOrUnm8OVc4FiQrL8H+xF/dzsvwC8ZvNWeCl2h9qkNlvrF7dorJJ9XnWj8neZHDfgoXOaDihJO6S
eXkfeL75B2HHNEpVKr3TJl5Umk91qEqrZJLMV7nIxBlRdAnEt1u5wzaH5PXi0zh5JHLiJQN0r+tN
ENYD5nfou8XPZowBo6ieAsRtVnK01Z4jIj1isrTrl8HzS7hI4clvuWbYloTNh9ycr21yiyJLoVLQ
WpEBsVpzTmBxC1n617hm/7lgagMTEHvMyUV6Ky348ZEwgh3w0oGRIyHWXwH80RRUBCIStB18j/S/
0Ab5+u8kMbNoakg1kLHwdh8B79PD6mNXsZUoz6iIjXCYw8Aa69TPDxQXf7NhvYkIa3H9fqENePS4
S2pOTcgTFy2R5PRcDx6SM3zoTZ3X4WBqrLVnlG4JYeP8vWpeU7lsXmiAt26iQ8L80NYoNhml/isr
EyTLwJ2lOBiWA7UTrKoDdqz6d+q/zQapgQFnztugjpp1u+PW3aSlioH2PXFVNnaOe3Fm66EbYzoP
FyC9HViqIOCTFzN6iDJ/y4HD0FELV5fgC3qxjUMfPCo3RI1PLPB76W8hMzdzj8uM4YG96M5piD9Z
+/l6de92HK6qZtgYcM9EbQE6QWBNeEg9JlXU08js5iQlaHNPwI7B1XSKef9upbTJlNssLUPkBDU1
SFGzp0vU1xqJBU4Dv9xVHeqSlb6/S5+SlcGUMnr8Sp0SYIxMzVJ2E/hzTAgMcNolFPVblmewV2dN
NZASZDx6+gMdPgdXCWGCmJowx5Ba9CFupJ/gSKLUCEtqLflp0qU8+6gA2J3UUqqnOfe2JzSeo0N/
G/FhTh6iApIft81rOlqVWehOxadhECI2y12/V8MN38Tw9GeauCav3FII5jta7nIBoRf9WNGDU3LF
bslwIFGfvUnpeaCyz/dU1oHGeeIMQXu05CFOlGFDxIa9rwZPOurJqHlAn718hu7aV/XLUzrzylWm
J4rhmeG1/JZIJyjdUpVa+h+ArYPPA6DsWEkHzu71qjnhlAGHspK0+qMt+AwaK7vuiObs1Pj26VTh
XJ+QQasfVDsflOx9TBsT6Lmnn/1WPmjgVpthLsKH+TnMU0sN1r8dAOurb7FVJACFBsO3bFFI8536
AxcMrmyLw8pwyDAVNCXpAW8jCLBhAxqerFkjdPo5fLyjI4KP3W8FZDmgMRf3aGB254Wy17NUTlHq
YwQZrBWrqlH6BizKuBT4lHxJEGEl05IO9DEK0W7muSennxZ0d03YP4nOIc7ibUaTkDbk0oVQtS6h
RIDUfh1qzqKCUAj5JTjSDU6VnDwsYO4gf7e7C2T0uJiIKCss61E0Ldrvw/XVdXzWlzXPp77RG6E7
uDNivd0DUkwfEJAzuRejDTUKknrO8/v5BLzHhKMwM3cewIsbTC3I1UJE+OULprk9JqdyslbipYau
IA4p0bVOb/O4S/GFjleVdljg1IbcyktjF+6ZEyKNd2uu9wC6azgu/ZXtYqobkOccv5qa7yYHtRWb
4skXmLBcAvK02lQtoHVdJj+n/ObKUrUGhXV9f+zdk1/iU6Ln0pWfbOANcmLCdWIOKD9XLnnbTS+y
zsu82q/oW9Xj0wEiv1n3Vc+eJTr9X4I3fgdrI47ThqXX4wR8xAjKNyUKfJHepZtLFmafGHXq7suP
x8OjGz4yDFd6jYB1hHtTZmby7bBnK9JukaOIDQSDNTn+0Kwv4tfxc/H1x6gJ6SaaZ7pPhVXFvef3
UjMAvCJdCP2+JBwYif00u83pHGrpSzPcnexyzCm4kpEt5JJmJBbeim+rOYosCzYwChXB3yE7RJyE
WWQZXaWDmaCOPrnWjksO1Apro821avpHOeqkxjbE4VItf63r/GRfqUYmlghTmmrAFmI24LjlUL6U
t48SAnK37Y3+VIiUFDZNucfDaEcuKDf+vdbMGoACn/1u9ej/m11Y2RXT250Lp11bOZnVEzS7JXAY
W9vEm1r/Rx/ClyfxrfC18MQeNo2/4zduULike+8FbULa6/CpBvoK28cCDs2pVgIc9MN39kO2GmKP
ZAk/i8uCGnJsk35oY3X+mH32PFrRhpyUbrrXr3HwOPvkG3VU7/Dxg0IZYPARytCxNbBdcpfz73Jj
yrJwoaNdbJWTPyEE4Bw3afuA41/9z6Aj+geKCXfb0BHLRLtO2OrS90Flme5c/kdM15N97+KeJ5Qe
hQ8MNszhnWYLMuM5VA8gvMY+dIVIY4IVSBLvX8IWMevmFgB/dJyuo+E0RqbYkUPvgFVo0hGL/5x3
R8T48I2RMc93hOR+6xKzpd86x9zN5G3UKW+AqJLs9/s7XARbGQ+vb5Z4gE2ht7KPQueTZOCya68Z
eOFSum8TsWLx5zJEgHiKOjlXPgcSdxFtKwzRiD6Q7o8XNKz39MwZhvw5CyL3gnqUX8d1HhndOXX/
LH98o5OGp+aGVee/WF6PPrIyl5Mty5Ahyg/86irmWoGAncXS32iQzFMqmE2InKy8qMlXQqbJUk6c
wFmy+qAv/5AgXzuHmQgucKPmZ3B2iG47e7wBxJ0lgefGRg2PntO2/kDZNUO1Vep7HuuqBtyLpFpF
cvIm72eh6OiVQ/i14Gj3ozYVL1A3pnOS/NxgNjrc85f+tw0eGEXyrqb2tMce+DEUENBLU423s7A+
GabqAfJlrJFHsx07yIr24O9EUjUXOI32ggwDj8QxQJFYQ0Gubf+W4VQGT74k6UlUyTOtVwiD6qW1
ox9ahvVyMtejPKjXIcPkwF1vaXH6qMmdcxr+yoypCPFXhExl4Wk5FrZ6E2J4vDTPOZNlrf/z9t//
eRr8shvpOdjk6M4J19fts5qUaTS+9f2pM/zSkbC1qWefxO9L6MrpSujd8p6GqdhaJaqssKvmTTs3
42uiNFcwfJ+5v1j9WeOLpzohQcPNwulwgvI+EgZ9pIJHbV2lQrSoRJDr+VfBItBZI3MyzAUCD94D
WzVBUnacwfEjfbKhXQuXaAXqE1h4PqrXJ+btpmW6QcAJ2pmnJDTggtf62yA/0OZCo6W8t6ZXjP44
6Myd9kZ6WMNF8QXjHGGZDSPKufvsWvzstuLb8l7UhjfWIJExkGF+f43jLjj8ulIju1LX4vfoXCob
VlygjWAClv8L6ZNxF6nqKhFOrPvTTpKNRPyJZExlIF5gT7CYc4AcMCi/80jpyo6cyRK1pF4jBuKv
B0n09RSYgPAacHUTJXJuZ9el2uPA5WY4kDJ9bLRAXHb8WNzV0aJXpLC4tpS1a8NDVFIVMzs67ZDz
RNdKI3FXoVJEKXEG53AZZtO+iW+iIH5xK2HywRtHmiGQ+o+yC6BaCOUDPupbB4a0HSVvVTWynthl
S3fDvk7O6ILMLOrchvLc1lwuf3527e1pxfooAsS2ozxtAPdi2juXOP2xD9Rb1z6YmFv2YwFqhhac
jpO5cBlvh8rToPF8WK7orW0WqkPHFQydGdeXJ5iCyLAiRjZ1bNYDNqa5JwgBbLNj5oleKCxL1hdY
dQXgPBfAJdwNU+jtWsJw2W5N6WNnifvm1CFLbtYg0Czi90zv7TPK5K5fll+J2pqAJoPPMEkHwG8m
6wHdicLv5JZKwsqzMUm7Cl5GHZybBYOjhd4ObTinO+0HGkYr3QXqz791YlBD1cjmeBMMPc1Wyt9j
L109NiEoKZfyYYAWgfUrbSQxnv3dpvydKR2X6Zo28uWkuGcAOe5Oobs7y7+EFVLBSZxnq1seLpqd
drM3ZIadkgWJt2MYt9uUQBFNX5YxbOoYwBywrYa6nITWVZfMuS3ypytDpN+B/oVPbhOeZgMl297p
3WcF5oNOXq6S/7lASKkFD26+z9Db/YGdvKQ/F9ooBj/eMRU7ZaqqEVZvvk9w6dBueqmIFiOL8e5R
W8NwZf3rvjJ9GVUT9Rs/oTatfN/GiQcgY08WNiQfjerNbmFwXI/a2Are5lTx9iAKgDG3SJIjeCiT
yOO9JGi7v2R7DB6BLgjskyz4lknItt3t1QQRqL3WBDNdt7vRPRRDE9VDgPmMqoaaSmumPoHNmq2f
iAA9lHHUBX2tQZsUPRSKKIp2uK8w94z+KuHh0lR61sGvdFI9km/pEVtuFIOFnIUWYAyOdCoKbV+9
iK9zE19WoJgn9Y7wyZsqRfXuFzwgX0FpW5kXjoCjwgkbWNB2WDfoksist/Xd4GRrEvgfVZlgf+cG
csCKfV8Rl2G86vZNF0XVvfNz8XkgWiTubX/Ed2Rs2mu3mKBOsz+mwoN3lVIUd3WWDL+XvNunDEIW
dq5brCkqp368Lt5WGl0mH1v1R9VQYaFr2zGkV5gGCIxTaC2H9Oa9u+7iUX7f3F1pQ64ZR30InSvr
WRvgQMGH07xKDk501BPKTfxdAWH2dfTZNILCHaZhuEKkb/Z3aPpkHHpB5PX/HaOPatRBvd7d3fdb
R4fhGHWnSMDR6RjtnFQhxeFaRz77H0mXieb0+B2OhrRQtuCJumjs52+gcINNIHIcT0QBg37ifjWN
wYf/wtd86V8v4Pl8UmdsQiRRaNGrpTcWKNPs5KfmBoiuWsGzBrLEAj5pDAYbbQ1UzrlibTx43B/V
NV7Nro9n1XDhlkGHT+PdjektKz8uzWrtsw56oQsgsNS16ffvtoHRZ7r2fs/jWpkOyY7nl7UJKvhI
w72OCoah0NSbxE4wc/uRdYhp3hOSHUzjuy2O3Ud0gQ8sYhJa3mziok+6rsn0W3n5YTWBzvo5auU+
rxodDtNmYOioJNDEYS6Y5/E6kFmX+SJMMomDki450PVY9uCdWHTtx4FtRnR58neICH1ojUm3l6Dj
t86lPffAaR+wn0rUGj36lBrXKiRjRHp0YoIY8YfQgsCY8u4IrXAuo6EpW62ro7rUvCnbqraQLu4s
DzvHsc9MERYWiv53dBA3Ds4FCJTEmcmG7dGPvKf8PdbzPRDNDKEnxBdcQryk9UpOxcjVx8nv8Ix7
VJWrEjo5QS/WssdivVS3XhdJJHbC9+pYAZKNRHu4gN/sGlKeWLp3GYMlZYPar63mOpqbWFpc+FtD
miHbXijtmsRS5QIIT2ihVbcm7rJT6/HCquY4GW168wYyjGpytG12Z/9ogekSKAL6x0t3w7b5DmtJ
nhyS95Y8m/eb23RiQgJYyczV5OTvtH70FYWweMfGWVQnlSR+fA1kzKPFHG0KDu4rQC0VKXlrD3+R
BerkHF9QwjX5HbdxgeR1BrzN1el57x7r2LewRU4Q4JjgpsZ8vA4ClYFjl6t1XVkXuVgG2T93Kamd
DqovceJmP5g56YRC/6UUVt6MVU82yZCO4gU9/T9TlvhBBW//GqVnQEFqGyk3sDlzfz6D9AzYYmNd
uwTQQDzCeV6BDSue3lQ9pp7DqXMww2QimCKTus5rpMahCYoCaM9UgsSYldVKf9a5VLJP6+J9kgwK
0wF1pWc30gHXASVs3jaQJj1dgNmjTyM1Y2jR9+CD2ICjB6G/4R9LqjC3h9k5zXAYoR2Y8n7zklab
P0rMIbW7tfyeXQ1f7py26RlzRNctK25XWz8i85lymceFwRSVXVX0YXiJWx8DTx+HtGPelU6tb7Ea
o5SiowpsWUE+UCEd0uc45C9fm8jWRA5b7YroNd1cbcsnfeTwqZkYMO5uisnqmwYeqMJAUUdi3PNj
1ymj/QRgBUFtVZO/qTslrv5Ks4jiHQPoXLZdxC/FvLOyXNG7C5guxZzqLcHY2oc0NIvaC/qv+j+3
cbTC+p3AtzfajBnLx171kGMKY3F53rRm9Tj5UZLYMuvuxwiLUcMfqqQIjCdHGkpdDTHd5Gbwuek9
KzxQOGIQzOx6L3zrq0Yjq7cFKwZIJezvZ6+eSmET2vB4Vuh9EFjSayukaLlluB4oUPTPE+skv8xn
Vz0p9G9R+eCIyCvrh6GeQ1E7u2AwCazo7gAHG79kFJbxNaWh1CZwysN/FTxyIH+SxL2+YlYobLM6
WCkTLrwEiz+WPKm1pvzFLFknAiA3dXsIeqKzHg42DGj3lR/PACFev+efSx6yIvyJcer62QIle/tk
WvD24RiWi+DDy5G0jwReQfalMAvzB8ddEna+PU5mYRmbJzVRrdn7OdoSFCVHc+fZjhi9cTOeCCV7
Fo/o7BSchozs9ODHSf06bu4Y0pmw0P41a4BQM1gU3W5MEjowf7cqIrUbfEbanWDzrsafp/+1nw7g
R+yQTHhKIdNZO5eJywl1XJDQVenWqe6tjMtnsswjel3vARHegtJq1CTZGLeMrG9+PdrjVsFEywDH
2O2uNgtSFDct9rR/ID+ggowovsOcNAxnGSQRxCxddMRjga1JYMQAHTwEFcmPMIuoxw6LnfE+Z5Iq
iv7zn5npmfAttFvBpbfqvwZb1He1g77QNDPBIWDbjqHTa3pgV+avk4HLUN/v575dLKdiuVRJWjVT
cFtJSk1GVXqEn6dZf5fbFoxS3nKwgGIlfD8RWUsHsWwS1wWTTYpKA4FO62SRYGx4tU8wyokynM8s
ODIHqaRPe0rTe6K8HyovhmeZ5nsvzLbfXtr+7oMZa1jccTOYRI9hScb3uHtz6XvZMo6aSQO2qIYj
i7iqNs9/vQ6I77sj0saKR/DSPHrb1kKidim9fHQYSeVW0FufoQnvAWL8DsF0BJlUOTyID9C9PrD5
RRmy5aUogUTSvprujpj2tCt/Is7gxYitcAg2LhzVce4HC4KVXV+Ky2nzQe6MXTYKfzaRHxo40Tp/
4DX4nkSGio5q00MEtPX0LRaEKAnBxzWHiN5+zZ5FsC+sNWYNrLQ28iam1Imeb5/zCJ6Iuy8VZDCJ
pxzMq79vl/mgl7VIu5Gm5gw142sdMKWW0S/lDpXNP0NeBbLobzkADUGicn4vUZ6ceOs06FmrWXkZ
Ytbayp9YSxvIooTw9O+r2g/6XkPUf8OHDPSNePyIdLtz/cOBUp8xwoeuAD5OnvyCIfWgBxBgfRGZ
iwtDeNY6hr1sg5t3csxgr5uf/6OgVZfQZutPXes0veYUWAnTgjC1/B9v1NwTVkZvk94pZbJINx1+
qELwx0owYTL5BPeRuC0cDRzZSGX9gZjniynxo5BptcxlfhrKDzy8UwssDZJCbobv5uRGynMhhBmv
njgxpfOOb7zcJUe5T4TyrfHTbIiQU2xr0eQNQPs8Q4knzfLmnKVzHRn3EbXVwzjFlbSRrLwZ2xhD
k7VWq+UFEeBLiCq+CIbcBg5P1ccRiRzZJhhbiN5kTFF8EKZMLjSlOEC7UQ6aZyvVH3B/pTwLq8zn
GLATJN5T4c6jUX9tz1BJBye0RnzzUBr6RIxg3hLym0LIorkRxNvXnZSLFjF1Vge3Ji1DGLr6wDFI
wd16vVEjsyB49qez3vIHSkUffy73C0dlWmTNYFeJhmIZzmEx1dm8kXUTmjxAGBxLLHMeF0aLcXe3
BXii0eJOEQ1TGVtXv9TnKz4vGkBTW8AdzXivOYwte2U2kEs2bTy9RwrwLEFupbXrCnenwR6usLLL
MS28Syb2JVk3QZLOdPcSwuFLGsbeCdnzkZ/sq8Wsik6xlK5EFNE2hAe7GJZc4x29jxnNL477gZQQ
pVE/pRQTwRIrcesrAZj1Tk+Qm7aV0H7pcZ2WPk6hXPfBVneBN9+7IEWzLI5vojb7dGYwIpvtZewV
hzVEIpS+D/oyP/ODCuQOSpQHaZeoSXleeOi/FhTkkCTMj/HFcTDEOG0L+GlLlA030YvxCZJ3nX4k
xBREZtSgnL9Rdj4KOLsXuGETjoirU0HoQvLGkDbtYpB82MCsgbK2ce0i4qNP7w6FnsNjt2AtpLPx
jzdUhMdVpgIrOGMT4SLpWY2UL8bTEJc9m+HJ1XNeIWVgpQZha60gMuTa3Ltt6UDMBr4gPpWI5xJK
i7OP3lcVd3RYN8v0SZKOD4eMzt9pwWfnZmChUIazxZ3+WO+ftQ70CUbmEeb0QgVrt34tT5OgRfGW
ZBqRt7tKX5bnSFQDSnzeAUL1xRw5cvkTByRBqTkQrppgiGQ5f26JAOs+Sw0ZwskKX8Y7TneDfHaZ
eF4CxMEoipn8y3TUTS2EXSr9p5Hx2zXl9QA7PReTUiQOsIEf+aRsecaTEEL279tYfaNfF1WiYe9/
Dt/a1BTEdizHXDHbWxw89QAys1DDQiWRZBLXGFuUxRcq9fzKG2qq7sgCJUSjetyiS0BVZiMfB6RL
bLr9ZFftEZVER/9NZFP2D4b+akVOKpzPvnN6lfLP7UiJ1nXKcGnq9+E0vCfrsxw6UGCqmhelCThm
6YL0c+mCRsDhGaeEirR4DUDNncYrXdT9BMOFt8YnrsKsOZvwgiiphUFGvSTwgmAIZREF/uDZFj1i
YeWUa3WzG2oG6xKVXEAVT/sBTMvpFZlPlGggIsQKn3S0xb/94okGAZtFwUUN8Kt7Hl1ZYkgzycVl
5gd9s+12wDxb87u6ihIfBrf1x2usrG9PjdTjlIolrRa3Y3LsrdI0D8P95iWtBZoGz+shRDdmb8Dy
euAbm6Lvd/TwAewowt0O5wM/HpD2Np13j/Qccs3g4uEBQlV1b0CmQddD+8z9oqJFU+UCTbj7p/N5
OPnG/PWVsPoDBCt5B6OZEtv3a8mdDVEVXQ1cCMUU/vrq4M4Ln6gDgntSbXI/q7EIbY754dqTeRS5
X4gUHdjxNPhpSJM7PR99bxxVAwKADM6b1T+8LTUT8+vVfETRqRpquUNRbGL1fFVsZ9cPJZ6VFi9T
+ATZIRXo0nb8AAfC3vtGZGHp8nl7Op6+ckXw5jkiIrg2m3ovhfslne5AweXRM1wEcoOokgqf892Q
X8hBMvSR6EpPVQBLXsRf0Ep9VTMExkmzopf10hT6oDEUC7cXR1c5M4kHtUAjx8qx390BO1ATgpnW
KVA1wxy32pN5w71ARVJbJC9+5aK08+7dY6RcC4D+nG8aSwtoa3X5Ez3wcx8PB/tfhGk8jkOfOpF0
xZx+PDi47BrafiPSlC1xtBBMGocme5Xyjwgv05PaYCl3iYTKBh6sTILlbBZn0mKP9SPJ+4yzBu6g
ND4XYU57tcbFTxnJxvQU4Q0N/tshy3+m8GuN3oCyOHPwovF3b3GlanlhuvO1oV0tcFziseM2h7jN
ocstVc5hwuZRh6EftpOPo2UM1ngDhfsXkLOlvT9GQyeniV5A5IHXr0KNWpEliEpMNEbxHGWvwC7a
d8Oy1mByRMtEwxtVuejA5AhAVOozjFbJqPvF1SA717xAVh/tAv2hbSMdXkBE3ePNI/CCmGMwjRQr
+oRP8uyk6NC5rO51v9lWZwjUY5qn7MAVAQS4PKGTrfImFlfdBvJrHD0BAHuVH8KZzd35EFsxStjl
OcvmEE9/bchHSdxxS98wPrqGLDTkP++1gJ1r/h5zWS+S3Bc8hDlHl6HUevOklUgdn9OAumobWt/j
I+j5na8+Lynp40p5sip6vEFOsNK7RfxnJZ2SUnVtQCR0tLMoYY6OqNafZw2hRl876CxL1fmCouUX
sDHlEjKieP4tiDy2g1Kws5eRLtj6/0l+Rgn6wF8t2OPMr702vyOy4sTEMF6OKXkWfduVxAcht17J
VUIPGMcBWiT7Q+ApdmvjzM5QSZXn66C/2AAxtvxUqu8EmElbmXoyU+6U+wOs4xN3vDPm3fjj+Ubn
YQLUnnOcd0eEclg39nUr1L9QQdUcgBihIcHsXV6/Nz4WPPoF6x+W6yz6DP/MLJzIWzOWsySX6SxD
j3QLPGuzHw2B6TtH1sUYeRElKfWRWA3im7dI36F/T2CT3YDAl2qHTifsoHlwO/OF4biSTJFOi8OY
Hzaqxi76bHfsazX0+JChHEdDiblY7RD5gqXW4v2Oh8muCkLLKSU4xACpd6LblxJbV2rzs5q5+TM1
UzHi+m+rbGqDRqrzkBEzFhrZA9r8W0L75iSUaAT/D9S8EYsxfUE1UvndYffmB7RO2km0gFGUsYt2
Rwrul3D2LoeGVjqqixzHiUoC5F7TxdlBQj3DlH2PXVTTPs0eDjFAO8Wl+GKO8PWa0fsNW1YKFnnQ
yy2cZuGN0VlpsDrHxTEbspXFNsuimk0E69AyVgdZd+CHOlfTqD0TUcGIrE4M3grg+/JhCDBTPXJe
8xOSnI598Tu63eLSk2CXtQm0dU7dpcvDP/RoCQ5Aa9T1ZbQeuscP3skjlM+lhhO9LtPonYKDpp4F
z9Ciij/S3xNRjpkWTcr7VhAsORV5HcjKBVYqczVhQp5DHu8BaR08zPWMoGm9ccgA31FLAZSlqaY6
zmV7+yevSx/dFsXbIGRsbckFbJ6qZihe7tN5brXxKncNKG1oVC0f5kJv0GWicb4x3Bqx2Oi7Ogos
RxWMaNT8rTeV6/BdePN67ef0YKwiO0DO8a1nQYTX3ZOz4V18UcfrY1LgPxV9xkDazms9Z0e9kKPu
PmjpDwXB5Wo8U4owj8zgWtAexV6ODHWnEV5WrQKYcpbIazJARDoc38ym5Dxhj7r5x+ZSlvFQbNZp
k+AUYuo5BZ5rXpeZ5AVepzFIeTSBVqxSbLDpYA2LsJN3v9zguR3ZHkXe8XAmp0gYJEZIyPkk9Ifg
g3P2MsMefYZ47p/IJ+Gubf7w14KFDNdqkcMD2jXEeNwWzjRb9X8tFgp7savinaYmZzmWt679CJ4M
s/LEPwXljWrv+e3q+eg+GpBKiSjkj/Hgr3v355YxUTh9B64fK9U/lZOG0Ob4UQoQ8yH2YPX8QmQ7
oipHxyPnuGAqazUgTpJHY7ZWrgzuZk+qeemxF0w8+ofOiLLMVOUy7IXeGOhkokWlv0hTNdHi1Vhp
PTC2QAAs2xRJwDb0gP/1kspuNl985eALBDE7rUpKgfyhb3GorQRtdmZ8sCQDGsU2HSrMfEKSuBji
jt9axc9iId1NpQiS3NLyHHemX8K77YcFszTf51gF4M1OQART7jXpm9vBel4A90gJGaw606MnhcvV
Tq6RqBK6DKXNQzmXHvn0FB3FmN7LvHb6YTjgAdooyVPlgxZipeWojGIV0x9rn7KSRJZINWiyFcZl
bx4yYeqgdK4ocLYDJ0KIhCwD3y9xrb/mifii1QetF4vyYduKQXK39WvQiDNmeKWnmoYSXq2HlvUu
ugDKdwgYkdoCTtBMoEBK/PPkXUIgjedOrp3RlJAHUXwfz9fNWLLUhIs0zhM0/U2FSYdjSfFt9UDz
u5DUN63+ZOIu9b2SVl5oVZG7qpvQ8vlNjyRQcjcdiQmnEryBl/CGaJmtkWxnIIsjcetxBZWdxgnE
d4vZCv9DWxNPu1d9QIBbKAe4zm6A6p6WlvrF+ILUvp1mAPiP2YA0F/1QVS7HPLoAzCMcW96PIZPj
EbXWGTJlyE7MriL3roULjbmbNNung7I1sDTUMt5xcr+m2XgouANTrqPWbcGIf/RJMLYIjo+/yuM9
ez/NAETcabtFWD3KGyCMeYBtBW9oafIw+UVh0SRJEILNItoUv5oSgsXCsmVd8Gf1iy57UxV7Tfat
mpEaN0fCp/MKqfxLMOq50j9sHzzyU6CJmnKnHaf0rSq5ve94B2TjM1DugTPND/r2dXN4mLvrtQF5
Z8+HUJFGKngKd+n5zbnEqN4xzQSkKzs1I5/gOdGjx/b9H+PcDZYmbwCXtCHQk6VKspxMCbnQjOP6
L2b+qr4mPIqmdUpW0zNG9biahKOstZ0v0LJZ1+KL+s84MbXKLSq2njYSsflxS0Cv+6hNpuQINxGt
gSeRi0UeaM6AOuzi2Xt7rU4m6MxAU9Ez9uYslNkaPgc3Xu3XjrJfgkN/Tz2jHN7JrMllZBrrt+2j
Ah6mLW33Xa1TqS7h6r29beBIF0IEVCjHybCr/gAFHstYO1QIShi2dl9vEE7pSo5Gj/p3fym5YLUM
PHwwrwKNcGtVsBbponixFL9xepcF/51ucP/gKPiXPp/xeQGv0w9nAowsKCxiG6oAUHEuvwZhgcSi
rrRZF1amzQqA3TLz57K/bJZE4QmwgUQH1frnsw/tAcRMAKssghBPAFOISeGXEOgeNY9EdWKXH+rh
qbdX5scHbDIeA/90b7+g0Wr7Bjo61t3q/upk8NoxesqbXnQoxNJL+vzqMx4sXo4tVQGSx/BCov7+
uo3FrM54iADX9+dIFCWAI90FtgK3sHmAr8o5qhOfAmMqWTN+BnHc79wrZc1KQsjGDj210SRvk4AO
D4+Kn3e54R89kB4CHSazJect6dq+ETpO/HUcmPRvl1C9vojaKeDuqSnGH7aCW68OL0hHjoKmq19B
sxmeF9Wd96Z1iP/U/6aeEYaTJGHzXjM5mNShI1oHX/tebPEowB+4y9eeUw6U7TDKmWpn8tP60Z6C
wfNiPr+zkw1chaplcML0vG4f6EVkZRIBOsk2F3wPzL2wurqv3+QC6UT340YeMWRu/0AW87ON96XW
D2fWdU2uXrZTp7DMVX2C9JrQDFbaoj2ZlPiBykmdjqn4ROEdwwwyI0p4iJgfXj3DKLvHSWslQ6Ot
JGpRZaW2DdBBAaDJmuEj7EjtoeqO95AoT7w2DMiXj/vBZ/K+f0u7mliEMfSER1yta3FFIj+5/32g
Gj3NBjMnkUteddpL5a5wmDYQ/ccaj+rFMmS8UGJOcJoWYq0ZXecajA0S9sQTRmjSAZzr35s0ebFs
WJm8pAKQibjpguHWS3SRozrKRYJzLoMLO+VHXv0qtDYmINOjfsmOI2bb42jvSCiNt0PW78ncKBJP
qS4lLo5Ib49kLa582YcWd351y6kLV/8RRLvNgv/vQNKqv51lR9l4Uaqgj/Y/nplpq1RDwFj1H0zz
OMR7/2s92E9PazN46R8OrmJBjy+ZMWhgZ0IlS0ipET7hcTChFNE/QW7g+lrvv3CkWuvqzk4YCzQI
HLjqH0Vux607mCSG+2xhPKyFbsuIs1XeXJ2js+aBgwb7w/S74ffDkjQrXIam/HffGgSlQznYO10y
l8QL7rJ2f1lOXeEblj2QrOybc/IGU7oKnoTDV4u7vAd4rZYDE09GliL7VJjNhOeNhwncbsn/oIVK
2cmMADM0ldfIywsY925DGnJVVDCVB2JuEUH5T9/jERLEk1816SSw7RYG2O7wgDC3BRekrh+8tTbW
oRRrU9RPuz193J6rFlqp6iBYydOsuNq6vvfcHWfioMSjveqtyEGdtnk7CR8lGd338M6zs5VBzM6J
LZIiF2ztO4zVd9aRlsy2EnGjcliSBRIGtIa3lTpI5rH3w6Y+nTozjSl4zMA5O2lcSg3dYWzgBSWK
LGerTXyXaLioD+hGm5CEJ2ak1onGFubsQL4rTx4ux4YOO/fyrqilH6iLf+UTbdUY8ogDC8wRBXQT
xEEQ9erjz0INhTIcPaqnaU1hSdVRwEHGwU5rxwjTW3i2KV7A5XuWpttynTbErbKDt4nMzL5G/K6E
M1BbgN3oGb0Qypptjubs0X8t5khod9HqhPZXPLBpSzTbOeo4itARu6+BJt84+jB8J5cim7pcOlAA
Q0EnmRUOHTXD3caEhRQzlb0DU8cZ+cAh9wq7u8WDXN02QbOUKkBy1lmOTsQQgS8PNcElRSmgDXcf
3JM8c2tJr0rttp19PPtYPgGdyug64LTrYlgiYGxDgcRDncD6x7nw3ZvgTrEIsZflFwVhHiAUCrwa
PuGrvJzmAIOBxu8q3N1DvyGeSBOI0ZwTD+P2CIzfdw3GfX1akv36SjFJ157HolXs1i9vp+c+BVlg
nqEt9lxR4jv8Ck2u3URsxB7KUVdrjDqs9rIOIsgVFvBmJHoTeinEfEeHXbByZgG7XjxvJ+zFP7M7
vp+dg91hthp6bPMERbj6idj8snTihGmPpyIhDWvE1SFG7r8d+NTIJWOlLzUGky8yqar4Akgy6v5B
AeTRBJP0ojZtFjlQ6vjUyFyRZthpXefEUekcl+QH7JMMNLv8W1LX2Q5CkqunjaGGIbXBXOE3LvaZ
BdSYG0ADT3obSyek236iwlwBRDIAAU9xXqQRiIbV6gAAD4eyINr9JhgAAbunAu+iEPTlbvixxGf7
AgAAAAAEWVo=
--===============2542132941836245975==
Content-Type: application/x-xz
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="dmesg-parent.xz"

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
--===============2542132941836245975==--

