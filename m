Content-Type: multipart/mixed; boundary="===============8573789018843677940=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [ucounts] 59ec71575a: will-it-scale.per_process_ops -10.3% regression
Date: Wed, 12 Jan 2022 13:08:23 -0600
Message-ID: <874k68pyag.fsf@email.froward.int.ebiederm.org>
In-Reply-To: <20220112134211.GA10024@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8573789018843677940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <oliver.sang@intel.com> writes:

> Greeting,
>
> FYI, we noticed a -10.3% regression of will-it-scale.per_process_ops due =
to commit:


I am having a bit of a challenge reading this report.  Does the -10.3%
mean that will-it-scale.per_process_ops is performing 70873 operations
per second instead of 78995 aka -10.3% fewer operations per second?

The per-profile.self-cycles-pp.do_dec_rlimits_put_ucounts now takes +2.6
more cycles, and perf-profile.self.cycles.pp.inc_rlimit_get_ucounts now
takes +3.8 more cycles.

Which if I read this correctly is a regression report about two
functions taking 3 or 4 cycles more after the code was rearranged inside
of them.

Is that correct?  Is this a regression report saying those two functions
are taking a few cycles more which leads to
will-it-scale.per_process_ops not being able to perform as many
operations per second?

Given the change in the commit mentioned I think this is all down to a
bug fix causing the code to be rearranged and a compiler optimizations.

I don't see much room to do anything about this.

Eric


> commit: 59ec71575ab440cd5ca0aa53b2a2985b3639fad4 ("ucounts: Fix rlimit ma=
x values check")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> in testcase: will-it-scale
> on test machine: 144 threads 4 sockets Intel(R) Xeon(R) Gold 5318H CPU @ =
2.50GHz with 128G memory
> with following parameters:
>
> 	nr_task: 100%
> 	mode: process
> 	test: signal1
> 	cpufreq_governor: performance
> 	ucode: 0x7002302
>
> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
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
>         sudo bin/lkp install job.yaml           # job file is attached in=
 this email
>         bin/lkp split-job --compatible job.yaml # generate the yaml file =
for lkp run
>         sudo bin/lkp run generated-yaml-file
>
>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/tes=
tcase/ucode:
>   gcc-9/performance/x86_64-rhel-8.3/process/100%/debian-10.4-x86_64-20200=
603.cgz/lkp-cpl-4sp1/signal1/will-it-scale/0x7002302
>
> commit: =

>   v5.16-rc2
>   59ec71575a ("ucounts: Fix rlimit max values check")
>
>        v5.16-rc2 59ec71575ab440cd5ca0aa53b2a =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>   11375458           -10.3%   10205843        will-it-scale.144.processes
>      78995           -10.3%      70873        will-it-scale.per_process_o=
ps
>   11375458           -10.3%   10205843        will-it-scale.workload
>      35.26            +4.6%      36.90        turbostat.RAMWatt
>  1.177e+10           -10.1%  1.058e+10        perf-stat.i.branch-instruct=
ions
>   87846548            -6.7%   81932988        perf-stat.i.branch-misses
>      43.42            +2.7       46.09        perf-stat.i.cache-miss-rate%
>   91079467 =C2=B1  2%     +27.6%  1.162e+08        perf-stat.i.cache-miss=
es
>  2.086e+08           +20.7%  2.517e+08        perf-stat.i.cache-references
>       7.77           +11.8%       8.68        perf-stat.i.cpi
>       5126           -21.1%       4044        perf-stat.i.cycles-between-=
cache-misses
>  1.814e+10           -10.6%  1.621e+10 =C2=B1  2%  perf-stat.i.dTLB-loads
>   1.17e+10           -11.1%   1.04e+10 =C2=B1  2%  perf-stat.i.dTLB-stores
>   53823400           -22.3%   41823499 =C2=B1 16%  perf-stat.i.iTLB-load-=
misses
>      6e+10            -9.9%  5.405e+10        perf-stat.i.instructions
>       0.13           -10.5%       0.12        perf-stat.i.ipc
>     290.39           -10.4%     260.05 =C2=B1  2%  perf-stat.i.metric.M/s=
ec
>    5934502 =C2=B1  3%     +38.4%    8213006        perf-stat.i.node-load-=
misses
>     504440 =C2=B1  3%     +34.1%     676425 =C2=B1  2%  perf-stat.i.node-=
loads
>       3.48           +34.0%       4.66        perf-stat.overall.MPKI
>       0.75            +0.0        0.77 =C2=B1  2%  perf-stat.overall.bran=
ch-miss-rate%
>      43.63            +2.5       46.13        perf-stat.overall.cache-mis=
s-rate%
>       7.78           +11.8%       8.70        perf-stat.overall.cpi
>       5128           -21.1%       4045        perf-stat.overall.cycles-be=
tween-cache-misses
>       0.13           -10.5%       0.11        perf-stat.overall.ipc
>  1.174e+10           -10.1%  1.055e+10        perf-stat.ps.branch-instruc=
tions
>   87583795            -6.8%   81664372        perf-stat.ps.branch-misses
>   90844134 =C2=B1  2%     +27.5%  1.158e+08        perf-stat.ps.cache-mis=
ses
>  2.082e+08           +20.6%  2.511e+08        perf-stat.ps.cache-referenc=
es
>  1.809e+10           -10.7%  1.616e+10 =C2=B1  2%  perf-stat.ps.dTLB-loads
>  1.167e+10           -11.1%  1.037e+10 =C2=B1  2%  perf-stat.ps.dTLB-stor=
es
>   53794169           -22.4%   41750328 =C2=B1 16%  perf-stat.ps.iTLB-load=
-misses
>  5.984e+10           -10.0%  5.388e+10        perf-stat.ps.instructions
>    5915765 =C2=B1  3%     +38.4%    8188054        perf-stat.ps.node-load=
-misses
>     542552 =C2=B1  4%     +30.8%     709510 =C2=B1  3%  perf-stat.ps.node=
-loads
>  1.826e+13           -10.5%  1.634e+13        perf-stat.total.instructions
>      48.83            -8.5       40.29        perf-profile.calltrace.cycl=
es-pp.security_task_kill.do_send_specific.do_tkill.__x64_sys_tgkill.do_sysc=
all_64
>      48.72            -8.5       40.21        perf-profile.calltrace.cycl=
es-pp.apparmor_task_kill.security_task_kill.do_send_specific.do_tkill.__x64=
_sys_tgkill
>      66.93            -4.7       62.21        perf-profile.calltrace.cycl=
es-pp.__x64_sys_tgkill.do_syscall_64.entry_SYSCALL_64_after_hwframe.raise
>      66.86            -4.7       62.16        perf-profile.calltrace.cycl=
es-pp.do_tkill.__x64_sys_tgkill.do_syscall_64.entry_SYSCALL_64_after_hwfram=
e.raise
>      66.62            -4.7       61.93        perf-profile.calltrace.cycl=
es-pp.do_send_specific.do_tkill.__x64_sys_tgkill.do_syscall_64.entry_SYSCAL=
L_64_after_hwframe
>      21.22            -4.1       17.12        perf-profile.calltrace.cycl=
es-pp.aa_get_task_label.apparmor_task_kill.security_task_kill.do_send_speci=
fic.do_tkill
>      95.18            -1.5       93.70        perf-profile.calltrace.cycl=
es-pp.raise
>       2.11            -1.1        0.96 =C2=B1100%  perf-profile.calltrace=
.cycles-pp.__setup_rt_frame.arch_do_signal_or_restart.exit_to_user_mode_pre=
pare.syscall_exit_to_user_mode.do_syscall_64
>       1.70            -0.9        0.78 =C2=B1100%  perf-profile.calltrace=
.cycles-pp.copy_fpstate_to_sigframe.__setup_rt_frame.arch_do_signal_or_rest=
art.exit_to_user_mode_prepare.syscall_exit_to_user_mode
>       1.48            -0.8        0.70 =C2=B1100%  perf-profile.calltrace=
.cycles-pp.__fpu_restore_sig.fpu__restore_sig.restore_sigcontext.__x64_sys_=
rt_sigreturn.do_syscall_64
>      92.89            -0.8       92.13        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.raise
>      92.54            -0.7       91.80        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.raise
>       1.04            -0.5        0.50 =C2=B1100%  perf-profile.calltrace=
.cycles-pp.restore_fpregs_from_user.__fpu_restore_sig.fpu__restore_sig.rest=
ore_sigcontext.__x64_sys_rt_sigreturn
>       2.38 =C2=B1  5%      -0.4        1.96 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.aa_may_signal.apparmor_task_kill.security_task_kill.do_send=
_specific.do_tkill
>       1.50            -0.4        1.11 =C2=B1 23%  perf-profile.calltrace=
.cycles-pp.__entry_text_start.raise
>       1.56            -0.2        1.40 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SY=
SCALL_64_after_hwframe.raise
>       1.52            -0.2        1.36 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn.do_sy=
scall_64.entry_SYSCALL_64_after_hwframe
>       2.20            +0.3        2.54 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame.raise
>       0.62 =C2=B1  3%      +0.5        1.12 =C2=B1 26%  perf-profile.call=
trace.cycles-pp.restore_altstack.__x64_sys_rt_sigreturn.do_syscall_64.entry=
_SYSCALL_64_after_hwframe.raise
>       1.69 =C2=B1  2%      +0.6        2.25 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.handler
>       1.70 =C2=B1  2%      +0.6        2.26 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.handler
>       1.68 =C2=B1  2%      +0.6        2.24 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_sysc=
all_64.entry_SYSCALL_64_after_hwframe.handler
>       1.68 =C2=B1  2%      +0.6        2.25 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe.handler
>       0.00            +0.6        0.64 =C2=B1 15%  perf-profile.calltrace=
.cycles-pp.__set_current_blocked.__x64_sys_rt_sigreturn.do_syscall_64.entry=
_SYSCALL_64_after_hwframe
>       0.00            +0.8        0.84 =C2=B1 36%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock_irq.do_sigaltstack.restore_altstack.__x64_sys_rt_=
sigreturn.do_syscall_64
>       0.00            +0.9        0.89 =C2=B1 34%  perf-profile.calltrace=
.cycles-pp.do_sigaltstack.restore_altstack.__x64_sys_rt_sigreturn.do_syscal=
l_64.entry_SYSCALL_64_after_hwframe
>       1.08 =C2=B1  4%      +1.0        2.11 =C2=B1  4%  perf-profile.call=
trace.cycles-pp._raw_spin_lock_irq.__set_current_blocked.sigprocmask.__x64_=
sys_rt_sigprocmask.do_syscall_64
>       2.65            +1.3        3.90 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.__x64_sys_rt_sigprocmask.do_syscall_64.entry_SYSCALL_64_after_hw=
frame.raise
>       4.24            +1.3        5.56 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.handler
>       1.76 =C2=B1  2%      +1.3        3.11 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.sigprocmask.__x64_sys_rt_sigprocmask.do_syscall_64.entry_SY=
SCALL_64_after_hwframe.raise
>       1.70 =C2=B1  2%      +1.4        3.06 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.__set_current_blocked.sigprocmask.__x64_sys_rt_sigprocmask.=
do_syscall_64.entry_SYSCALL_64_after_hwframe
>      20.17 =C2=B1  2%      +2.5       22.62        perf-profile.calltrace=
.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_h=
wframe.raise
>      19.97 =C2=B1  2%      +2.5       22.47        perf-profile.calltrace=
.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_6=
4.entry_SYSCALL_64_after_hwframe.raise
>      16.45 =C2=B1  2%      +3.8       20.23        perf-profile.calltrace=
.cycles-pp.__send_signal.do_send_sig_info.do_send_specific.do_tkill.__x64_s=
ys_tgkill
>      16.19 =C2=B1  2%      +3.8       20.00        perf-profile.calltrace=
.cycles-pp.__sigqueue_alloc.__send_signal.do_send_sig_info.do_send_specific=
.do_tkill
>      15.60 =C2=B1  2%      +3.8       19.44        perf-profile.calltrace=
.cycles-pp.inc_rlimit_get_ucounts.__sigqueue_alloc.__send_signal.do_send_si=
g_info.do_send_specific
>      17.39 =C2=B1  2%      +3.9       21.29        perf-profile.calltrace=
.cycles-pp.do_send_sig_info.do_send_specific.do_tkill.__x64_sys_tgkill.do_s=
yscall_64
>      48.84            -8.5       40.29        perf-profile.children.cycle=
s-pp.security_task_kill
>      48.81            -8.5       40.27        perf-profile.children.cycle=
s-pp.apparmor_task_kill
>      66.95            -4.7       62.22        perf-profile.children.cycle=
s-pp.__x64_sys_tgkill
>      66.87            -4.7       62.16        perf-profile.children.cycle=
s-pp.do_tkill
>      66.62            -4.7       61.93        perf-profile.children.cycle=
s-pp.do_send_specific
>      21.31 =C2=B1  2%      -4.1       17.17        perf-profile.children.=
cycles-pp.aa_get_task_label
>      95.20            -1.0       94.16        perf-profile.children.cycle=
s-pp.raise
>       1.49            -0.6        0.91 =C2=B1 55%  perf-profile.children.=
cycles-pp.__fpu_restore_sig
>       2.38 =C2=B1  5%      -0.4        1.96 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.aa_may_signal
>       1.92            -0.2        1.73 =C2=B1  4%  perf-profile.children.=
cycles-pp.restore_sigcontext
>       2.12            -0.2        1.93        perf-profile.children.cycle=
s-pp.__setup_rt_frame
>       1.72            -0.2        1.56        perf-profile.children.cycle=
s-pp.copy_fpstate_to_sigframe
>       1.52            -0.2        1.37 =C2=B1  4%  perf-profile.children.=
cycles-pp.fpu__restore_sig
>       1.00            -0.1        0.89 =C2=B1  2%  perf-profile.children.=
cycles-pp._copy_from_user
>       1.00            -0.1        0.88        perf-profile.children.cycle=
s-pp.__entry_text_start
>       1.04            -0.1        0.93 =C2=B1  7%  perf-profile.children.=
cycles-pp.restore_fpregs_from_user
>       0.89            -0.1        0.78 =C2=B1  2%  perf-profile.children.=
cycles-pp.syscall_return_via_sysret
>       0.52            -0.1        0.46 =C2=B1  2%  perf-profile.children.=
cycles-pp.copy_user_enhanced_fast_string
>       0.49            -0.1        0.44        perf-profile.children.cycle=
s-pp.copy_user_generic_unrolled
>       0.64            -0.0        0.59 =C2=B1  5%  perf-profile.children.=
cycles-pp.__might_fault
>       0.12 =C2=B1  4%      -0.0        0.08 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.syscall_exit_to_user_mode_prepare
>       0.27 =C2=B1  2%      -0.0        0.24 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__clear_user
>       0.19 =C2=B1  2%      -0.0        0.16 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.__might_sleep
>       0.25            -0.0        0.23 =C2=B1  2%  perf-profile.children.=
cycles-pp.__get_user_nocheck_8
>       0.20 =C2=B1  3%      -0.0        0.18 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__put_user_nocheck_4
>       0.14 =C2=B1  3%      -0.0        0.12 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.syscall_enter_from_user_mode
>       0.15            -0.0        0.14 =C2=B1  3%  perf-profile.children.=
cycles-pp.entry_SYSCALL_64_safe_stack
>       0.15 =C2=B1  3%      -0.0        0.13 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__x64_sys_getpid
>       0.63 =C2=B1  5%      +0.1        0.75 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irqsave
>       0.95            +0.1        1.08 =C2=B1  7%  perf-profile.children.=
cycles-pp.fpu__clear_user_states
>       0.63 =C2=B1  4%      +0.2        0.83 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.fpregs_mark_activate
>       1.20            +0.4        1.59        perf-profile.children.cycle=
s-pp.native_irq_return_iret
>       0.66 =C2=B1  5%      +0.4        1.08 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.signal_setup_done
>       3.37            +0.5        3.86 =C2=B1  2%  perf-profile.children.=
cycles-pp.__x64_sys_rt_sigreturn
>       0.63 =C2=B1  3%      +0.5        1.13 =C2=B1 26%  perf-profile.chil=
dren.cycles-pp.restore_altstack
>       0.35 =C2=B1  5%      +0.5        0.89 =C2=B1 34%  perf-profile.chil=
dren.cycles-pp.do_sigaltstack
>       1.88 =C2=B1  4%      +0.6        2.50 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.recalc_sigpending
>       3.17            +0.9        4.08 =C2=B1  5%  perf-profile.children.=
cycles-pp.handler
>       2.67            +1.2        3.92 =C2=B1  3%  perf-profile.children.=
cycles-pp.__x64_sys_rt_sigprocmask
>       1.77 =C2=B1  2%      +1.3        3.12 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.sigprocmask
>       2.77 =C2=B1  2%      +2.0        4.77 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.__set_current_blocked
>       2.49 =C2=B1  3%      +2.0        4.54        perf-profile.children.=
cycles-pp._raw_spin_lock_irq
>      15.12 =C2=B1  2%      +2.6       17.72        perf-profile.children.=
cycles-pp.do_dec_rlimit_put_ucounts
>      16.73 =C2=B1  2%      +2.7       19.40 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.dequeue_signal
>      17.48 =C2=B1  2%      +2.7       20.15 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.get_signal
>      21.90 =C2=B1  2%      +3.0       24.92        perf-profile.children.=
cycles-pp.syscall_exit_to_user_mode
>      21.34 =C2=B1  2%      +3.0       24.39        perf-profile.children.=
cycles-pp.arch_do_signal_or_restart
>      21.67 =C2=B1  2%      +3.1       24.74        perf-profile.children.=
cycles-pp.exit_to_user_mode_prepare
>      16.48 =C2=B1  2%      +3.8       20.25        perf-profile.children.=
cycles-pp.__send_signal
>      16.20 =C2=B1  2%      +3.8       20.01        perf-profile.children.=
cycles-pp.__sigqueue_alloc
>      15.60 =C2=B1  2%      +3.8       19.44        perf-profile.children.=
cycles-pp.inc_rlimit_get_ucounts
>      17.40 =C2=B1  2%      +3.9       21.30        perf-profile.children.=
cycles-pp.do_send_sig_info
>      21.19            -4.1       17.07        perf-profile.self.cycles-pp=
.aa_get_task_label
>      24.97            -4.0       21.02        perf-profile.self.cycles-pp=
.apparmor_task_kill
>       0.81            -0.4        0.40 =C2=B1 85%  perf-profile.self.cycl=
es-pp.restore_fpregs_from_user
>       2.37 =C2=B1  5%      -0.4        1.95 =C2=B1  4%  perf-profile.self=
.cycles-pp.aa_may_signal
>       0.89            -0.1        0.78 =C2=B1  2%  perf-profile.self.cycl=
es-pp.syscall_return_via_sysret
>       0.88            -0.1        0.77        perf-profile.self.cycles-pp=
.raise
>       0.93            -0.1        0.84 =C2=B1  2%  perf-profile.self.cycl=
es-pp.copy_fpstate_to_sigframe
>       0.54            -0.1        0.47 =C2=B1  5%  perf-profile.self.cycl=
es-pp.fpu__clear_user_states
>       0.50            -0.1        0.44 =C2=B1  2%  perf-profile.self.cycl=
es-pp.copy_user_enhanced_fast_string
>       0.36 =C2=B1  2%      -0.1        0.31 =C2=B1  8%  perf-profile.self=
.cycles-pp.__setup_rt_frame
>       0.47            -0.1        0.42        perf-profile.self.cycles-pp=
.copy_user_generic_unrolled
>       0.16 =C2=B1  3%      -0.0        0.11 =C2=B1 26%  perf-profile.self=
.cycles-pp.kmem_cache_free
>       0.38            -0.0        0.34 =C2=B1  2%  perf-profile.self.cycl=
es-pp.entry_SYSCALL_64_after_hwframe
>       0.43            -0.0        0.38        perf-profile.self.cycles-pp=
.__entry_text_start
>       0.22            -0.0        0.19 =C2=B1  3%  perf-profile.self.cycl=
es-pp.__x64_sys_rt_sigprocmask
>       0.17 =C2=B1  2%      -0.0        0.14 =C2=B1 10%  perf-profile.self=
.cycles-pp.__might_sleep
>       0.25            -0.0        0.22 =C2=B1  3%  perf-profile.self.cycl=
es-pp.__get_user_nocheck_8
>       0.19 =C2=B1  2%      -0.0        0.17 =C2=B1  2%  perf-profile.self=
.cycles-pp.__put_user_nocheck_4
>       0.16 =C2=B1  2%      -0.0        0.14 =C2=B1  4%  perf-profile.self=
.cycles-pp.__send_signal
>       0.17 =C2=B1  2%      -0.0        0.15 =C2=B1  3%  perf-profile.self=
.cycles-pp.__clear_user
>       0.22 =C2=B1  2%      -0.0        0.20 =C2=B1  3%  perf-profile.self=
.cycles-pp.kmem_cache_alloc
>       0.13            -0.0        0.11 =C2=B1  3%  perf-profile.self.cycl=
es-pp.syscall_enter_from_user_mode
>       0.15            -0.0        0.13 =C2=B1  3%  perf-profile.self.cycl=
es-pp.entry_SYSCALL_64_safe_stack
>       0.12 =C2=B1  2%      -0.0        0.10 =C2=B1  4%  perf-profile.self=
.cycles-pp._copy_from_user
>       0.10 =C2=B1  4%      -0.0        0.09 =C2=B1  5%  perf-profile.self=
.cycles-pp.handler
>       0.14 =C2=B1  3%      -0.0        0.12 =C2=B1  5%  perf-profile.self=
.cycles-pp.get_signal
>       0.11            -0.0        0.09 =C2=B1  5%  perf-profile.self.cycl=
es-pp.__might_fault
>       0.08 =C2=B1  5%      -0.0        0.07        perf-profile.self.cycl=
es-pp.__sigqueue_alloc
>       0.09 =C2=B1  3%      -0.0        0.08 =C2=B1  4%  perf-profile.self=
.cycles-pp.restore_sigcontext
>       0.63 =C2=B1  5%      +0.1        0.75 =C2=B1  7%  perf-profile.self=
.cycles-pp._raw_spin_lock_irqsave
>       0.60 =C2=B1  5%      +0.2        0.81 =C2=B1 11%  perf-profile.self=
.cycles-pp.fpregs_mark_activate
>       1.20            +0.4        1.59        perf-profile.self.cycles-pp=
.native_irq_return_iret
>       1.48 =C2=B1  5%      +0.7        2.22 =C2=B1 14%  perf-profile.self=
.cycles-pp.recalc_sigpending
>       2.48 =C2=B1  3%      +2.0        4.53        perf-profile.self.cycl=
es-pp._raw_spin_lock_irq
>      15.12 =C2=B1  2%      +2.6       17.72        perf-profile.self.cycl=
es-pp.do_dec_rlimit_put_ucounts
>      15.60 =C2=B1  2%      +3.8       19.44        perf-profile.self.cycl=
es-pp.inc_rlimit_get_ucounts
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
> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Ce=
nter
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpo=
ration
>
> Thanks,
> Oliver Sang
--===============8573789018843677940==--

