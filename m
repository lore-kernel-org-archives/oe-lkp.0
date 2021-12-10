Content-Type: multipart/mixed; boundary="===============5821677866720842693=="
MIME-Version: 1.0
From: Carel Si <beibei.si@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/signal] 3aac3ebea0: will-it-scale.per_thread_ops -11.9% regression
Date: Fri, 10 Dec 2021 12:15:15 +0800
Message-ID: <20211210041514.GA11309@linux.intel.com>
In-Reply-To: <bbc24579-b6ee-37cb-4bbf-10e3476537e0@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5821677866720842693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Tue, Dec 07, 2021 at 03:14:38PM -0800, Dave Hansen wrote:
> On 12/6/21 5:21 PM, kernel test robot wrote:
> > =

> > 1bdda24c4af64cd2 3aac3ebea08f2d342364f827c89 =

> > ---------------- --------------------------- =

> >          %stddev     %change         %stddev
> >              \          |                \  =

> >     980404 =C2=B1  3%     -10.2%     880436 =C2=B1  2%  will-it-scale.1=
6.threads
> >      61274 =C2=B1  3%     -10.2%      55027 =C2=B1  2%  will-it-scale.p=
er_thread_ops
> >     980404 =C2=B1  3%     -10.2%     880436 =C2=B1  2%  will-it-scale.w=
orkload
> >    9745749 =C2=B1 18%     +26.8%   12356608 =C2=B1  4%  meminfo.DirectM=
ap2M
> =

> Something else funky is going on here.  Why would there all of a sudden
> be so many more 2M pages in the direct map?  I also see gunk like
> interrupts on the network card going up.  I can certainly see that
> happening if something else on the network was messing around.
> =

> Granted, this was seen across several systems, but it's really odd.  I
> guess I'll go try to dig up one of the actual ones where this was seen.
> =

> I tried on a smaller Skylake system and I don't see any regression at
> all or any interesting delta in a perf profile.
> =

> Oliver or Chang, could you try to reproduce this by hand on one of the
> suspect systems?  Build:
> =

>   1bdda24c4a ("signal: Add an optional check for altstack size")
> =

> then run will-it-scale by hand.  Then build:
> =

>   3aac3ebea0 ("x86/signal: Implement sigaltstack size validation")
> =

> and run it again.  Also, do we see any higher core-count regressions?
> These all seem to happen with:
> =

> 	mode=3Dthread
> 	nr_task=3D16
> =

> That's really odd to see that for these systems with probably ~50 cores
> each.  I'd expect to see it get worse at higher core counts.

We tested 144 threads, it has -10.6% regression. Thanks. =


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testc=
ase/ucode:
  gcc-9/performance/x86_64-rhel-8.3/thread/100%/debian-10.4-x86_64-20200603=
.cgz/lkp-hsw-4ex1/signal1/will-it-scale/0x16

commit: =

  1bdda24c4a ("signal: Add an optional check for altstack size")
  3aac3ebea0 ("x86/signal: Implement sigaltstack size validation")

1bdda24c4af64cd2 3aac3ebea08f2d342364f827c89 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    279993           -10.6%     250241        will-it-scale.144.threads
      1943           -10.6%       1737        will-it-scale.per_thread_ops
    279993           -10.6%     250241        will-it-scale.workload
   3376415 =C2=B1  3%  +1.7e+05     3546025 =C2=B1  4%  syscalls.sys_getpid=
.noise.100%
     32.92            -4.2       28.77        perf-profile.calltrace.cycles=
-pp.sigprocmask.__x64_sys_rt_sigprocmask.do_syscall_64.entry_SYSCALL_64_aft=
er_hwframe.raise
     32.90            -4.2       28.75        perf-profile.calltrace.cycles=
-pp.__set_current_blocked.sigprocmask.__x64_sys_rt_sigprocmask.do_syscall_6=
4.entry_SYSCALL_64_after_hwframe
     32.96            -4.2       28.80        perf-profile.calltrace.cycles=
-pp.__x64_sys_rt_sigprocmask.do_syscall_64.entry_SYSCALL_64_after_hwframe.r=
aise
     32.60            -4.1       28.50        perf-profile.calltrace.cycles=
-pp._raw_spin_lock_irq.__set_current_blocked.sigprocmask.__x64_sys_rt_sigpr=
ocmask.do_syscall_64
     32.52            -4.1       28.43        perf-profile.calltrace.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__set_current_block=
ed.sigprocmask.__x64_sys_rt_sigprocmask
     32.80            -3.9       28.91        perf-profile.calltrace.cycles=
-pp.arch_do_signal_or_restart.exit_to_user_mode_prepare.syscall_exit_to_use=
r_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
     14.80            -2.5       12.30        perf-profile.calltrace.cycles=
-pp.__restore_rt
     14.79            -2.5       12.29        perf-profile.calltrace.cycles=
-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__restore_rt
     14.79            -2.5       12.29        perf-profile.calltrace.cycles=
-pp.entry_SYSCALL_64_after_hwframe.__restore_rt
     14.75            -2.5       12.25        perf-profile.calltrace.cycles=
-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe.__r=
estore_rt
     14.71            -2.5       12.22        perf-profile.calltrace.cycles=
-pp.__set_current_blocked.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCAL=
L_64_after_hwframe.__restore_rt
     14.57            -2.5       12.11        perf-profile.calltrace.cycles=
-pp._raw_spin_lock_irq.__set_current_blocked.__x64_sys_rt_sigreturn.do_sysc=
all_64.entry_SYSCALL_64_after_hwframe
     14.53            -2.5       12.07        perf-profile.calltrace.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__set_current_block=
ed.__x64_sys_rt_sigreturn.do_syscall_64
     16.35            -2.0       14.33        perf-profile.calltrace.cycles=
-pp.handler
     16.28            -2.0       14.27        perf-profile.calltrace.cycles=
-pp.entry_SYSCALL_64_after_hwframe.handler
     16.28            -2.0       14.27        perf-profile.calltrace.cycles=
-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.=
handler
     16.28            -2.0       14.27        perf-profile.calltrace.cycles=
-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.handler
     16.22            -2.0       14.21        perf-profile.calltrace.cycles=
-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry=
_SYSCALL_64_after_hwframe.handler
     16.20            -2.0       14.19        perf-profile.calltrace.cycles=
-pp.__set_current_blocked.signal_setup_done.arch_do_signal_or_restart.exit_=
to_user_mode_prepare.syscall_exit_to_user_mode
     16.20            -2.0       14.20        perf-profile.calltrace.cycles=
-pp.signal_setup_done.arch_do_signal_or_restart.exit_to_user_mode_prepare.s=
yscall_exit_to_user_mode.do_syscall_64
     16.06            -2.0       14.06        perf-profile.calltrace.cycles=
-pp._raw_spin_lock_irq.__set_current_blocked.signal_setup_done.arch_do_sign=
al_or_restart.exit_to_user_mode_prepare
     16.03            -2.0       14.04        perf-profile.calltrace.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__set_current_block=
ed.signal_setup_done.arch_do_signal_or_restart
     17.06            -1.9       15.14        perf-profile.calltrace.cycles=
-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.=
raise
     16.50            -1.9       14.63        perf-profile.calltrace.cycles=
-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_prepare.syscall_=
exit_to_user_mode.do_syscall_64
     16.62            -1.9       14.76        perf-profile.calltrace.cycles=
-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry=
_SYSCALL_64_after_hwframe.raise
     16.30            -1.8       14.45        perf-profile.calltrace.cycles=
-pp._raw_spin_lock_irq.get_signal.arch_do_signal_or_restart.exit_to_user_mo=
de_prepare.syscall_exit_to_user_mode
     16.27            -1.8       14.42        perf-profile.calltrace.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.get_signal.arch_do_=
signal_or_restart.exit_to_user_mode_prepare
     18.18            -1.5       16.70        perf-profile.calltrace.cycles=
-pp.__x64_sys_tgkill.do_syscall_64.entry_SYSCALL_64_after_hwframe.raise
     18.16            -1.5       16.68        perf-profile.calltrace.cycles=
-pp.do_send_specific.do_tkill.__x64_sys_tgkill.do_syscall_64.entry_SYSCALL_=
64_after_hwframe
     18.18            -1.5       16.69        perf-profile.calltrace.cycles=
-pp.do_tkill.__x64_sys_tgkill.do_syscall_64.entry_SYSCALL_64_after_hwframe.=
raise
     18.10            -1.5       16.63        perf-profile.calltrace.cycles=
-pp.do_send_sig_info.do_send_specific.do_tkill.__x64_sys_tgkill.do_syscall_=
64
     17.82            -1.4       16.38        perf-profile.calltrace.cycles=
-pp.__lock_task_sighand.do_send_sig_info.do_send_specific.do_tkill.__x64_sy=
s_tgkill
     17.82            -1.4       16.38        perf-profile.calltrace.cycles=
-pp._raw_spin_lock_irqsave.__lock_task_sighand.do_send_sig_info.do_send_spe=
cific.do_tkill
     17.77            -1.4       16.33        perf-profile.calltrace.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__lock_task_sig=
hand.do_send_sig_info.do_send_specific
     68.68            +4.5       73.21        perf-profile.calltrace.cycles=
-pp.raise
     68.45            +4.6       73.01        perf-profile.calltrace.cycles=
-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.raise
     68.47            +4.6       73.02        perf-profile.calltrace.cycles=
-pp.entry_SYSCALL_64_after_hwframe.raise
      0.00           +12.0       12.01        perf-profile.calltrace.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.do_sigaltstack.rest=
ore_altstack.__x64_sys_rt_sigreturn
      0.00           +12.0       12.04        perf-profile.calltrace.cycles=
-pp._raw_spin_lock_irq.do_sigaltstack.restore_altstack.__x64_sys_rt_sigretu=
rn.do_syscall_64
      0.00           +12.1       12.13        perf-profile.calltrace.cycles=
-pp.do_sigaltstack.restore_altstack.__x64_sys_rt_sigreturn.do_syscall_64.en=
try_SYSCALL_64_after_hwframe
      0.00           +12.1       12.15        perf-profile.calltrace.cycles=
-pp.restore_altstack.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_=
after_hwframe.raise
      0.00           +12.2       12.17        perf-profile.calltrace.cycles=
-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe.rai=
se
     63.84            -8.7       55.19        perf-profile.children.cycles-=
pp.__set_current_blocked
     32.92            -4.2       28.77        perf-profile.children.cycles-=
pp.sigprocmask
     32.96            -4.2       28.80        perf-profile.children.cycles-=
pp.__x64_sys_rt_sigprocmask
     33.34            -3.9       29.42        perf-profile.children.cycles-=
pp.syscall_exit_to_user_mode
     32.80            -3.9       28.91        perf-profile.children.cycles-=
pp.arch_do_signal_or_restart
     32.84            -3.9       28.98        perf-profile.children.cycles-=
pp.exit_to_user_mode_prepare
     14.80            -2.5       12.30        perf-profile.children.cycles-=
pp.__restore_rt
     16.35            -2.0       14.33        perf-profile.children.cycles-=
pp.handler
     16.20            -2.0       14.20        perf-profile.children.cycles-=
pp.signal_setup_done
     16.51            -1.9       14.64        perf-profile.children.cycles-=
pp.get_signal
     18.18            -1.5       16.69        perf-profile.children.cycles-=
pp.do_tkill
     18.18            -1.5       16.70        perf-profile.children.cycles-=
pp.__x64_sys_tgkill
     18.16            -1.5       16.68        perf-profile.children.cycles-=
pp.do_send_specific
     18.10            -1.5       16.63        perf-profile.children.cycles-=
pp.do_send_sig_info
     17.82            -1.4       16.38        perf-profile.children.cycles-=
pp._raw_spin_lock_irqsave
     17.82            -1.4       16.38        perf-profile.children.cycles-=
pp.__lock_task_sighand
      0.05            -0.1        0.00        perf-profile.children.cycles-=
pp.trace_clock_x86_tsc
      0.05 =C2=B1  7%      -0.0        0.01 =C2=B1200%  perf-profile.childr=
en.cycles-pp.copy_fpstate_to_sigframe
      0.04 =C2=B1 44%      -0.0        0.00        perf-profile.children.cy=
cles-pp.ring_buffer_unlock_commit
      0.22 =C2=B1  4%      -0.0        0.19 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.syscall_trace_enter
      0.20 =C2=B1  4%      -0.0        0.17 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.ftrace_syscall_enter
      0.19 =C2=B1  3%      -0.0        0.17 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.trace_buffer_lock_reserve
      0.15 =C2=B1  2%      -0.0        0.13 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.recalc_sigpending
      0.15 =C2=B1  3%      -0.0        0.13 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.__set_task_blocked
      0.15 =C2=B1  4%      -0.0        0.13        perf-profile.children.cy=
cles-pp.ring_buffer_lock_reserve
      0.19 =C2=B1  3%      -0.0        0.17 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.syscall_exit_to_user_mode_prepare
      0.02 =C2=B1 99%      -0.0        0.01 =C2=B1200%  perf-profile.childr=
en.cycles-pp.__task_pid_nr_ns
      0.10 =C2=B1  4%      -0.0        0.09        perf-profile.children.cy=
cles-pp.__rb_reserve_next
      0.17 =C2=B1  2%      -0.0        0.15 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.ftrace_syscall_exit
      0.14 =C2=B1  5%      -0.0        0.13 =C2=B1  3%  perf-profile.childr=
en.cycles-pp._raw_spin_unlock_irqrestore
      0.08 =C2=B1  5%      -0.0        0.07        perf-profile.children.cy=
cles-pp.dequeue_signal
      0.10 =C2=B1  4%      -0.0        0.09 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.syscall_return_via_sysret
      0.08 =C2=B1  4%      -0.0        0.07 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.__dequeue_signal
      0.12 =C2=B1  6%      -0.0        0.11 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.__entry_text_start
      0.10 =C2=B1  3%      -0.0        0.09        perf-profile.children.cy=
cles-pp.__send_signal
      0.03 =C2=B1100%      -0.0        0.02 =C2=B1123%  perf-profile.childr=
en.cycles-pp.__libc_start_main
      0.03 =C2=B1100%      -0.0        0.02 =C2=B1123%  perf-profile.childr=
en.cycles-pp.main
      0.03 =C2=B1100%      -0.0        0.02 =C2=B1123%  perf-profile.childr=
en.cycles-pp.run_builtin
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cy=
cles-pp.perf_output_copy
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cy=
cles-pp.security_task_kill
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cy=
cles-pp.__libc_write
      0.06 =C2=B1  6%      -0.0        0.05        perf-profile.children.cy=
cles-pp.trace_buffer_unlock_commit_regs
      0.03 =C2=B1100%      -0.0        0.02 =C2=B1123%  perf-profile.childr=
en.cycles-pp.cmd_sched
      0.03 =C2=B1100%      -0.0        0.02 =C2=B1125%  perf-profile.childr=
en.cycles-pp.cmd_record
      0.68            -0.0        0.67 =C2=B1  2%  perf-profile.children.cy=
cles-pp.asm_sysvec_apic_timer_interrupt
      0.03 =C2=B1100%      -0.0        0.02 =C2=B1125%  perf-profile.childr=
en.cycles-pp.record__finish_output
      0.03 =C2=B1100%      -0.0        0.02 =C2=B1125%  perf-profile.childr=
en.cycles-pp.perf_session__process_events
      0.06 =C2=B1  7%      -0.0        0.06        perf-profile.children.cy=
cles-pp.__setup_rt_frame
      0.03 =C2=B1100%      -0.0        0.02 =C2=B1125%  perf-profile.childr=
en.cycles-pp.process_simple
      0.62            -0.0        0.62        perf-profile.children.cycles-=
pp.sysvec_apic_timer_interrupt
      0.06 =C2=B1  7%      -0.0        0.06        perf-profile.children.cy=
cles-pp.memcpy_erms
      0.05 =C2=B1  7%      -0.0        0.05        perf-profile.children.cy=
cles-pp.native_irq_return_iret
      0.05 =C2=B1  7%      -0.0        0.05        perf-profile.children.cy=
cles-pp.__sigqueue_alloc
      0.14 =C2=B1  3%      -0.0        0.14 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.unwind_next_frame
      0.06 =C2=B1  6%      -0.0        0.06 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.__get_user_nocheck_8
      0.05            -0.0        0.05        perf-profile.children.cycles-=
pp.restore_sigcontext
      0.06 =C2=B1  6%      +0.0        0.06 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.__unwind_start
      0.59            +0.0        0.59        perf-profile.children.cycles-=
pp.__sysvec_apic_timer_interrupt
      0.06 =C2=B1  9%      +0.0        0.06 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.asm_exc_page_fault
      0.59 =C2=B1  2%      +0.0        0.59        perf-profile.children.cy=
cles-pp.hrtimer_interrupt
      0.06 =C2=B1  6%      +0.0        0.06        perf-profile.children.cy=
cles-pp.perf_callchain_user
      0.26 =C2=B1  4%      +0.0        0.26 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.perf_prepare_sample
      0.24 =C2=B1  3%      +0.0        0.25 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.get_perf_callchain
      0.06 =C2=B1  8%      +0.0        0.06        perf-profile.children.cy=
cles-pp.perf_output_sample
      0.18 =C2=B1  3%      +0.0        0.19 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.perf_callchain_kernel
      0.35 =C2=B1  3%      +0.0        0.36 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.update_curr
      0.24 =C2=B1  3%      +0.0        0.25 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.perf_callchain
      0.43 =C2=B1  2%      +0.0        0.43        perf-profile.children.cy=
cles-pp.scheduler_tick
      0.33 =C2=B1  3%      +0.0        0.34        perf-profile.children.cy=
cles-pp.perf_swevent_overflow
      0.34 =C2=B1  3%      +0.0        0.34 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.perf_trace_sched_stat_runtime
      0.33 =C2=B1  3%      +0.0        0.33 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.__perf_event_overflow
      0.33 =C2=B1  3%      +0.0        0.33 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.perf_event_output_forward
      0.40 =C2=B1  2%      +0.0        0.41        perf-profile.children.cy=
cles-pp.task_tick_fair
      0.47 =C2=B1  2%      +0.0        0.48        perf-profile.children.cy=
cles-pp.tick_sched_timer
      0.46 =C2=B1  2%      +0.0        0.47        perf-profile.children.cy=
cles-pp.tick_sched_handle
      0.45 =C2=B1  2%      +0.0        0.46        perf-profile.children.cy=
cles-pp.update_process_times
      0.34 =C2=B1  2%      +0.0        0.34 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.perf_tp_event
      0.52 =C2=B1  2%      +0.0        0.52        perf-profile.children.cy=
cles-pp.__hrtimer_run_queues
      0.00            +0.0        0.01 =C2=B1200%  perf-profile.children.cy=
cles-pp.ordered_events__queue
      0.00            +0.0        0.01 =C2=B1200%  perf-profile.children.cy=
cles-pp.queue_event
     99.63            +0.0       99.66        perf-profile.children.cycles-=
pp.entry_SYSCALL_64_after_hwframe
     99.61            +0.0       99.65        perf-profile.children.cycles-=
pp.do_syscall_64
     97.13            +0.2       97.31        perf-profile.children.cycles-=
pp.native_queued_spin_lock_slowpath
     79.54            +1.6       81.16        perf-profile.children.cycles-=
pp._raw_spin_lock_irq
     68.70            +4.5       73.22        perf-profile.children.cycles-=
pp.raise
     14.79            +9.6       24.43        perf-profile.children.cycles-=
pp.__x64_sys_rt_sigreturn
      0.00           +12.1       12.14        perf-profile.children.cycles-=
pp.do_sigaltstack

> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============5821677866720842693==--

