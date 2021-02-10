Content-Type: multipart/mixed; boundary="===============3235070855904607216=="
MIME-Version: 1.0
From: Petr Mladek <pmladek@suse.com>
To: lkp@lists.01.org
Subject: Re: [init/console] a91bd6223e: unixbench.score -5.9% regression
Date: Wed, 10 Feb 2021 09:49:18 +0100
Message-ID: <YCOeDrKC7dq9hz6M@alley>
In-Reply-To: <20210209054925.GB13872@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3235070855904607216==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

just for record.

On Tue 2021-02-09 13:49:25, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed a -5.9% regression of unixbench.score due to commit:
> =

> =

> commit: a91bd6223ecd46addc71ee6fcd432206d39365d2 ("Revert "init/console: =
Use ttynull as a fallback when there is no console"")
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
> 	test: dhry2reg
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
00s/lkp-cfl-e1/dhry2reg/unixbench/0xde
> =

> commit: =

>   c4cc3b1de3 ("Merge tag 'gcc-plugins-v5.11-rc3' of git://git.kernel.org/=
pub/scm/linux/kernel/git/kees/linux")
>   a91bd6223e ("Revert "init/console: Use ttynull as a fallback when there=
 is no console"")
> =

> c4cc3b1de31b76f4 a91bd6223ecd46addc71ee6fcd4 =

> ---------------- --------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>           0:4            2%           0:4     perf-profile.children.cycle=
s-pp.error_entry
>          %stddev     %change         %stddev
>              \          |                \  =

>      19487            -5.9%      18336        unixbench.score
>  8.875e+10            -5.9%  8.351e+10        unixbench.workload
>       0.50            +0.1        0.61 =C2=B1  3%  mpstat.cpu.all.irq%
>      44280 =C2=B1  4%     +15.9%      51322 =C2=B1  3%  softirqs.CPU0.SCH=
ED
>      29624 =C2=B1  3%      +9.6%      32476        vmstat.system.in

>       2207 =C2=B11927%   +3559.5%      80796 =C2=B1 18%  sched_debug.cfs_=
rq:/.spread0.avg
>     135343 =C2=B1 38%     +61.1%     218075 =C2=B1 16%  sched_debug.cfs_r=
q:/.spread0.max
>       0.01 =C2=B1 31%     +78.3%       0.01 =C2=B1 22%  perf-sched.sch_de=
lay.avg.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall_64
>       0.01 =C2=B1  7%     +22.8%       0.02 =C2=B1  2%  perf-sched.sch_de=
lay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_sysca=
ll_64
>       0.02 =C2=B1 15%     +27.1%       0.02 =C2=B1 11%  perf-sched.sch_de=
lay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
>       0.02 =C2=B1 44%    +113.3%       0.04 =C2=B1 12%  perf-sched.sch_de=
lay.avg.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCAL=
L_64_after_hwframe.[unknown]
>       0.02 =C2=B1 10%     +56.1%       0.03 =C2=B1 25%  perf-sched.sch_de=
lay.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0=
.do_select
>       0.02 =C2=B1 44%    +113.3%       0.04 =C2=B1 12%  perf-sched.sch_de=
lay.max.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCAL=
L_64_after_hwframe.[unknown]
>       0.01 =C2=B1 11%     +37.5%       0.01 =C2=B1 19%  perf-sched.total_=
sch_delay.average.ms
>       2001          +120.7%       4416 =C2=B1 33%  perf-sched.wait_and_de=
lay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_sysca=
ll_64
>       0.05 =C2=B1 54%     +56.5%       0.08 =C2=B1  7%  perf-sched.wait_t=
ime.avg.ms.schedule_timeout.khugepaged.kthread.ret_from_fork
>       2001          +120.7%       4416 =C2=B1 33%  perf-sched.wait_time.m=
ax.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
>       0.05 =C2=B1 54%     +56.5%       0.08 =C2=B1  7%  perf-sched.wait_t=
ime.max.ms.schedule_timeout.khugepaged.kthread.ret_from_fork

>       0.07 =C2=B1173%      +0.2        0.27 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.io_serial_in
>       0.07 =C2=B1173%      +0.2        0.30 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.serial8250_console_putchar
>       0.07 =C2=B1173%      +0.2        0.31 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.wait_for_xmitr
>       0.08 =C2=B1173%      +0.2        0.32 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.uart_console_write
>       0.08 =C2=B1173%      +0.2        0.33 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.serial8250_console_write
>       0.09 =C2=B1173%      +0.2        0.33 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.asm_sysvec_irq_work
>       0.09 =C2=B1173%      +0.2        0.33 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.sysvec_irq_work
>       0.09 =C2=B1173%      +0.2        0.33 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.__sysvec_irq_work
>       0.09 =C2=B1173%      +0.2        0.33 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.irq_work_run
>       0.09 =C2=B1173%      +0.2        0.33 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.irq_work_single
>       0.09 =C2=B1173%      +0.2        0.33 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.printk
>       0.09 =C2=B1173%      +0.2        0.33 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.vprintk_emit
>       0.09 =C2=B1173%      +0.2        0.33 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.console_unlock
>       0.09 =C2=B1173%      +0.3        0.34 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.irq_work_run_list

The commit fixed regression in registration of console drivers.
A console was likely not registered before and saved some cycles.
But people want consoles ;-)

By other words, this regression is kind of expected.

Best Regards,
Petr
--===============3235070855904607216==--

