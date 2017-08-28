Content-Type: multipart/mixed; boundary="===============8035931365069590045=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/cfs] 625ed2bf04: unixbench.score -7.4% regression
Date: Mon, 28 Aug 2017 11:13:41 +0200
Message-ID: <20170828091341.fq7jjoyxbm7rtfqz@hirez.programming.kicks-ass.net>
In-Reply-To: <8760d8i698.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8035931365069590045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2017 at 01:57:39PM +0800, Huang, Ying wrote:
> kernel test robot <xiaolong.ye@intel.com> writes:
> =

> > Greeting,
> >
> > FYI, we noticed a -7.4% regression of unixbench.score due to commit:
> >
> >
> > commit: 625ed2bf049d5a352c1bcca962d6e133454eaaff ("sched/cfs: Make util=
/load_avg more stable")
> > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> >
> > in testcase: unixbench
> > on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz w=
ith 64G memory
> > with following parameters:
> >
> > 	runtime: 300s
> > 	nr_task: 100%
> > 	test: spawn
> > 	cpufreq_governor: performance
> >
> > test-description: UnixBench is the original BYTE UNIX benchmark suite a=
ims to test performance of Unix-like system.
> >
> =

> This has been merged by v4.13-rc1, so we checked it again.  If my
> understanding were correct, the patch changes the algorithm to calculate
> the load of CPU, so it influences the load balance behavior for this
> test case.
> =

>       4.73 =C2=B1  8%     -31.3%       3.25 =C2=B1 10%  sched_debug.cpu.n=
r_running.max
>       0.95 =C2=B1  5%     -29.0%       0.67 =C2=B1  4%  sched_debug.cpu.n=
r_running.stddev
> =

> As above, the effect is that the tasks are distributed into more CPUs,
> that is, system is more balanced.  But this triggered more contention on
> tasklist_lock, so hurt the unixbench score, as below.
> =

>      26.60           -10.6       16.05        perf-profile.calltrace.cycl=
es-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.do_idle
>      10.10            +2.4       12.53        perf-profile.calltrace.cycl=
es-pp._raw_write_lock_irq.do_exit.do_group_exit.sys_exit_group.entry_SYSCAL=
L_64_fastpath
>       8.03            +2.6       10.63        perf-profile.calltrace.cycl=
es-pp._raw_write_lock_irq.release_task.wait_consider_task.do_wait.sys_wait4
>      17.98            +5.2       23.14        perf-profile.calltrace.cycl=
es-pp._raw_read_lock.do_wait.sys_wait4.entry_SYSCALL_64_fastpath
>       7.47            +5.9       13.33        perf-profile.calltrace.cycl=
es-pp._raw_write_lock_irq.copy_process._do_fork.sys_clone.do_syscall_64
> =

> =

> The patch makes the tasks distributed more balanced, so I think
> scheduler do better job here.  The problem is that the tasklist_lock
> isn't scalable.  But considering this is only a micro-benchmark which
> specially exercises fork/exit/wait syscall, this may be not a big
> problem in reality.
> =

> So, all in all, I think we can ignore this regression.

Thanks for looking at this!

--===============8035931365069590045==--

