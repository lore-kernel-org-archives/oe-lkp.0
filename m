Content-Type: multipart/mixed; boundary="===============1758241116385340861=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [mm/writeback] e5dbd33218: will-it-scale.per_process_ops -3.8% regression
Date: Fri, 23 Apr 2021 13:47:53 +0100
Message-ID: <20210423124753.GA235567@casper.infradead.org>
In-Reply-To: <20210423054601.GC13944@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1758241116385340861==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 01:46:01PM +0800, kernel test robot wrote:
> FYI, we noticed a -3.8% regression of will-it-scale.per_process_ops due t=
o commit:
> commit: e5dbd33218bd8d87ab69f730ab90aed5fab7eb26 ("mm/writeback: Add wait=
_on_page_writeback_killable")

That commit just adds a function.  It doesn't add any callers.  It must
just be moving something around ...

> 39f985c8f667c80a e5dbd33218bd8d87ab69f730ab9 =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>    9359770            -3.8%    9001769        will-it-scale.16.processes
>     584985            -3.8%     562610        will-it-scale.per_process_o=
ps
>    9359770            -3.8%    9001769        will-it-scale.workload
>      15996            -1.2%      15811        proc-vmstat.nr_kernel_stack
>      23577 =C2=B1 10%     +18.5%      27937 =C2=B1  7%  softirqs.CPU48.SC=
HED
>       5183 =C2=B1 41%     +47.2%       7630 =C2=B1  7%  interrupts.CPU1.N=
MI:Non-maskable_interrupts
>       5183 =C2=B1 41%     +47.2%       7630 =C2=B1  7%  interrupts.CPU1.P=
MI:Performance_monitoring_interrupts
>      54.33 =C2=B1 12%     +18.4%      64.33 =C2=B1  7%  perf-sched.wait_a=
nd_delay.count.schedule_hrtimeout_range_clock.poll_schedule_timeout.constpr=
op.0.do_sys_poll
>     153.34 =C2=B1 24%     -45.9%      83.00 =C2=B1 25%  perf-sched.wait_a=
nd_delay.max.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
>     153.33 =C2=B1 24%     -45.9%      82.99 =C2=B1 25%  perf-sched.wait_t=
ime.max.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
>  2.424e+10            -3.8%  2.332e+10        perf-stat.i.branch-instruct=
ions
>       0.47            +3.7%       0.48        perf-stat.i.cpi
>  2.529e+10            -4.0%  2.428e+10        perf-stat.i.dTLB-loads
>   1.15e+10            -3.8%  1.106e+10        perf-stat.i.dTLB-stores
>   54249733            -4.8%   51627939        perf-stat.i.iTLB-load-misses
>  1.004e+11            -3.8%  9.661e+10        perf-stat.i.instructions
>       2.15            -3.6%       2.07        perf-stat.i.ipc
>     693.66            -3.9%     666.70        perf-stat.i.metric.M/sec
>       0.46            +3.7%       0.48        perf-stat.overall.cpi
>       2.15            -3.6%       2.08        perf-stat.overall.ipc
>  2.416e+10            -3.8%  2.324e+10        perf-stat.ps.branch-instruc=
tions
>   2.52e+10            -4.0%  2.419e+10        perf-stat.ps.dTLB-loads
>  1.146e+10            -3.8%  1.102e+10        perf-stat.ps.dTLB-stores
>   54065825            -4.8%   51454019        perf-stat.ps.iTLB-load-miss=
es
>  1.001e+11            -3.8%  9.628e+10        perf-stat.ps.instructions
>  3.025e+13            -3.9%  2.908e+13        perf-stat.total.instructions
>       0.89 =C2=B1 14%      -0.1        0.77 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.atime_needs_update.touch_atime.shmem_mmap.mmap_region.do_mm=
ap
>       0.14 =C2=B1 13%      -0.1        0.04 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.common_mmap
>       0.61 =C2=B1 12%      -0.1        0.52 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.common_file_perm
>       0.21 =C2=B1  8%      -0.0        0.17 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.vma_set_page_prot
>       0.12 =C2=B1  8%      -0.0        0.09 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.blocking_notifier_call_chain
>       0.12 =C2=B1 14%      -0.0        0.09 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.get_mmap_base
>       0.09 =C2=B1  8%      -0.0        0.07 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.vm_pgprot_modify
>       0.13 =C2=B1 15%      +0.1        0.19 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.cap_capable
>       0.03 =C2=B1102%      +0.1        0.12 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.munmap(a)plt
>       0.14 =C2=B1 13%      +0.1        0.24 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.testcase
>       0.33 =C2=B1 10%      -0.1        0.23 =C2=B1 10%  perf-profile.self=
.cycles-pp.cap_vm_enough_memory
>       0.13 =C2=B1 11%      -0.1        0.03 =C2=B1100%  perf-profile.self=
.cycles-pp.common_mmap
>       0.48 =C2=B1 12%      -0.1        0.41 =C2=B1 12%  perf-profile.self=
.cycles-pp.common_file_perm
>       0.49 =C2=B1 12%      -0.1        0.43 =C2=B1 13%  perf-profile.self=
.cycles-pp.vm_area_alloc
>       0.12 =C2=B1  8%      -0.0        0.09 =C2=B1 12%  perf-profile.self=
.cycles-pp.blocking_notifier_call_chain
>       0.12 =C2=B1 13%      -0.0        0.09 =C2=B1 14%  perf-profile.self=
.cycles-pp.get_mmap_base
>       0.11 =C2=B1  8%      +0.0        0.16 =C2=B1 10%  perf-profile.self=
.cycles-pp.__x64_sys_munmap
>       0.11 =C2=B1 14%      +0.1        0.18 =C2=B1  8%  perf-profile.self=
.cycles-pp.cap_capable
>       0.12 =C2=B1 11%      +0.1        0.20 =C2=B1  6%  perf-profile.self=
.cycles-pp.testcase
>       0.01 =C2=B1223%      +0.1        0.11 =C2=B1 13%  perf-profile.self=
.cycles-pp.munmap(a)plt

I'm struggling to see anything in that that says anything other than
"we did 3-4% less work".  Maybe someone else has something useful to
say about it?
--===============1758241116385340861==--

