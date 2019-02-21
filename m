Content-Type: multipart/mixed; boundary="===============6259247179487620853=="
MIME-Version: 1.0
From: kernel test robot <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [ACPICA] 4c1379d7bb: reaim.jobs_per_min -2.8% regression
Date: Thu, 21 Feb 2019 11:14:46 +0800
Message-ID: <20190221031446.GF28258@shao2-debian>
In-Reply-To: <CF6A88132359CE47947DB4C6E1709ED53C58713D@ORSMSX122.amr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6259247179487620853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 20, 2019 at 08:28:49AM +0800, Schmauss, Erik wrote:
> =

> =

> > -----Original Message-----
> > From: Chen, Rong A
> > Sent: Sunday, February 17, 2019 5:36 PM
> > To: Moore, Robert <robert.moore@intel.com>
> > Cc: Wysocki, Rafael J <rafael.j.wysocki@intel.com>; Schmauss, Erik
> > <erik.schmauss@intel.com>; LKML <linux-kernel@vger.kernel.org>; Lin=
us
> > Torvalds <torvalds@linux-foundation.org>; lkp(a)01.org
> > Subject: [LKP] [ACPICA] 4c1379d7bb: reaim.jobs_per_min -2.8% regression
> > =

> > Greeting,
> > =

> > FYI, we noticed a -2.8% regression of reaim.jobs_per_min due to commit:
> > =

> > =

> > commit: 4c1379d7bb42fa664e0784539208ed74108c53f1 ("ACPICA: Debug
> > output: Add option to display method/object evaluation")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> Hi, =

> =

> Does the performance get back to normal when you apply the following chan=
ges? I've added this as an attachment as well...

No, the regression is still exist.

commit:
   73a049a90f ("ACPICA: disassembler: disassemble OEMx tables as AML")
   40a76ed786 ("es-dbg-experiement-01")

testcase/path_params/tbox_group/run: reaim/performance-1500-100%-300s-all_u=
time-ucode=3D0x3d/lkp-hsw-ep2

73a049a90fb241af  40a76ed786180150065d02ae1f  =

----------------  --------------------------  =

         %stddev      change         %stddev
             \          |                \  =

      0.09 =C2=B1  8%        79%       0.17 =C2=B1  4%  reaim.std_dev_time
      0.45 =C2=B1  8%        79%       0.80 =C2=B1  4%  reaim.std_dev_perce=
nt
    127078              28%     163173 =C2=B1  3%  reaim.time.involuntary_c=
ontext_switches
      0.07 =C2=B1  5%        13%       0.08        reaim.child_systime
     20.93                       21.42        reaim.parent_time
    314488                      307615        reaim.max_jobs_per_min
      6445                        6303        reaim.time.percent_of_cpu_thi=
s_job_got
    308795                      301705        reaim.jobs_per_min
      4288                        4190        reaim.jobs_per_min_child
       321              -5%        304        reaim.time.elapsed_time
       321              -5%        304        reaim.time.elapsed_time.max
      4928              -7%       4599        reaim.time.voluntary_context_=
switches
   1512000              -7%    1404000        reaim.workload
     92671              -7%      86028        reaim.time.minor_page_faults
     20720              -7%      19216        reaim.time.user_time

Best Regards,
Rong Chen

> =

> diff --git a/drivers/acpi/acpica/dsmethod.c b/drivers/acpi/acpica/dsmetho=
d.c
> index f59b4d944f7f..b524b4273d9f 100644
> --- a/drivers/acpi/acpica/dsmethod.c
> +++ b/drivers/acpi/acpica/dsmethod.c
> @@ -552,9 +552,11 @@ acpi_ds_call_control_method(struct acpi_thread_state=
 *thread,
>                           "**** Begin nested execution of [%4.4s] **** Wa=
lkState=3D%p\n",
>                           method_node->name.ascii, next_walk_state));
> =

> +#if 0
>         this_walk_state->method_pathname =3D
>             acpi_ns_get_normalized_pathname(method_node, TRUE);
>         this_walk_state->method_is_nested =3D TRUE;
> +#endif
> =

>         /* Optional object evaluation log */
> =

> diff --git a/drivers/acpi/acpica/psparse.c b/drivers/acpi/acpica/psparse.c
> index 9b386530ffbe..c39db1a83222 100644
> --- a/drivers/acpi/acpica/psparse.c
> +++ b/drivers/acpi/acpica/psparse.c
> @@ -483,6 +483,7 @@ acpi_status acpi_ps_parse_aml(struct acpi_walk_state =
*walk_state)
> =

>                         /* Optional object evaluation log */
> =

> +#if 0
>                         ACPI_DEBUG_PRINT_RAW((ACPI_DB_EVALUATION,
>                                               "%-26s:  %*s%s\n",
>                                               "   Exit nested method",
> @@ -492,6 +493,7 @@ acpi_status acpi_ps_parse_aml(struct acpi_walk_state =
*walk_state)
>                                               &walk_state->method_pathnam=
e[1]));
> =

>                         ACPI_FREE(walk_state->method_pathname);
> +#endif
>                         walk_state->method_is_nested =3D FALSE;
>                 }
>                 if (status =3D=3D AE_CTRL_TRANSFER) {
> > =

> > in testcase: ftq
> > on test machine: 256 threads Phi with 96G memory with following
> > parameters:
> > =

> > 	nr_task: 100%
> > 	samples: 6000ss
> > 	test: cache
> > 	freq: 20
> > 	cpufreq_governor: performance
> > =

> > test-description: The FTQ benchmarks measure hardware and software
> > interference or 'noise' on a node from the applications perspective.
> > test-url: https://github.com/rminnich/ftq
> > =

> > In addition to that, the commit also has significant impact on the foll=
owing
> > tests:
> > =

> > +------------------+---------------------------------------------------=
---------------------
> > ---+
> > | testcase: change | perf_test:
> > perf_test.msr_test.round1.cpu_util_zero.pass -100.0% undefined |
> > | test machine     | 72 threads Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30G=
Hz
> > with 128G memory     |
> > | test parameters  | type=3Dlkp                                        =
                          |
> > |                  | ucode=3D0x3d                                      =
                          |
> > +------------------+---------------------------------------------------=
---------------------
> > ---+
> > =

> > =

> > Details are as below:
> > -----------------------------------------------------------------------=
-----------------------
> > ---->
> > =

> > =

> > To reproduce:
> > =

> >         git clone https://github.com/intel/lkp-tests.git
> >         cd lkp-tests
> >         bin/lkp install job.yaml  # job file is attached in this email
> >         bin/lkp run     job.yaml
> > =

> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > compiler/cpufreq_governor/kconfig/nr_job/nr_task/rootfs/runtime/tbox_g
> > roup/test/testcase/ucode:
> >   gcc-7/performance/x86_64-rhel-7.2/1500/100%/debian-x86_64-2018-04-
> > 03.cgz/300s/lkp-hsw-ep2/all_utime/reaim/0x3d
> > =

> > commit:
> >   73a049a90f ("ACPICA: disassembler: disassemble OEMx tables as AML")
> >   4c1379d7bb ("ACPICA: Debug output: Add option to display method/object
> > evaluation")
> > =

> > 73a049a90fb241af 4c1379d7bb42fa664e07845392
> > ---------------- --------------------------
> >          %stddev     %change         %stddev
> >              \          |                \
> >       0.07 =C2=B1  3%     +20.2%       0.09 =C2=B1 12%  reaim.child_sys=
time
> >     308866            -2.8%     300200        reaim.jobs_per_min
> >       4289            -2.8%       4169        reaim.jobs_per_min_child
> >     314258            -2.7%     305679        reaim.max_jobs_per_min
> >      20.93            +2.9%      21.53        reaim.parent_time
> >       0.44 =C2=B1  9%     +84.5%       0.82 =C2=B1  6%  reaim.std_dev_p=
ercent
> >       0.09 =C2=B1  9%     +83.7%       0.17 =C2=B1  6%  reaim.std_dev_t=
ime
> >     321.38            -4.7%     306.29        reaim.time.elapsed_time
> >     321.38            -4.7%     306.29        reaim.time.elapsed_time.m=
ax
> >     127264 =C2=B1  2%     +40.6%     178887
> > reaim.time.involuntary_context_switches
> >      93024 =C2=B1  2%      -8.4%      85173        reaim.time.minor_pag=
e_faults
> >       6448            -2.6%       6282        reaim.time.percent_of_cpu=
_this_job_got
> >      20724            -7.2%      19241        reaim.time.user_time
> >       4929            -6.9%       4591        reaim.time.voluntary_cont=
ext_switches
> >    1512000            -7.1%    1404000        reaim.workload
> >     442.00 =C2=B1158%    -100.0%       0.00        meminfo.Mlocked
> >       0.03 =C2=B1  2%      +0.1        0.11        mpstat.cpu.sys%
> >       1231           +56.9%       1932 =C2=B1  3%  vmstat.system.cs
> >      63.75 =C2=B1158%    -100.0%       0.00        numa-vmstat.node0.nr=
_mlock
> >      46.25 =C2=B1159%    -100.0%       0.00        numa-vmstat.node1.nr=
_mlock
> >       1.50 =C2=B1 15%      -0.3        1.24 =C2=B1 15%  perf-stat.overa=
ll.cache-miss-rate%
> >      50.13 =C2=B1  3%      +6.4       56.58 =C2=B1  5%  perf-stat.overa=
ll.iTLB-load-miss-rate%
> >     566199 =C2=B1  6%     -23.7%     432237 =C2=B1  7%  perf-stat.overa=
ll.instructions-per-
> > iTLB-miss
> >      59.86 =C2=B1  3%     -23.1       36.79 =C2=B1 10%  perf-stat.overa=
ll.node-store-miss-rate%
> >    6653969 =C2=B1  8%     +25.4%    8340919 =C2=B1 14%  perf-stat.ps.ca=
che-references
> >       1202           +56.7%       1884 =C2=B1  4%  perf-stat.ps.context=
-switches
> >     185718 =C2=B1  5%     +28.9%     239386 =C2=B1  7%  perf-stat.ps.iT=
LB-load-misses
> >       2755            -1.5%       2713        perf-stat.ps.minor-faults
> >      22055 =C2=B1 22%     -41.6%      12879 =C2=B1 11%  perf-stat.ps.no=
de-store-misses
> >      14552 =C2=B1 12%     +53.3%      22311 =C2=B1 14%  perf-stat.ps.no=
de-stores
> >       2755            -1.5%       2713        perf-stat.ps.page-faults
> >  3.414e+13            -7.1%  3.172e+13        perf-stat.total.instructi=
ons
> >      69181            -1.7%      67973        proc-vmstat.nr_active_anon
> >       6177            +4.6%       6461        proc-vmstat.nr_mapped
> >     109.50 =C2=B1159%    -100.0%       0.00        proc-vmstat.nr_mlock
> >      69181            -1.7%      67973        proc-vmstat.nr_zone_activ=
e_anon
> >      17125 =C2=B1 10%     -55.2%       7668 =C2=B1 20%  proc-vmstat.num=
a_hint_faults
> >       4847 =C2=B1 80%     -81.0%     920.75 =C2=B1 85%  proc-vmstat.num=
a_hint_faults_local
> >     799546            -5.8%     753399        proc-vmstat.numa_hit
> >     785482            -5.9%     739309        proc-vmstat.numa_local
> >      63641 =C2=B1 34%     -57.8%      26863 =C2=B1 93%  proc-vmstat.num=
a_pte_updates
> >     861155            -5.6%     812594        proc-vmstat.pgalloc_normal
> >     922986            -6.5%     863086        proc-vmstat.pgfault
> >     833697            -5.8%     785608        proc-vmstat.pgfree
> >      17.88 =C2=B1  5%      -4.2       13.72 =C2=B1 21%  perf-profile.ca=
lltrace.cycles-
> > pp.scheduler_tick.update_process_times.tick_sched_handle.tick_sched_tim
> > er.__hrtimer_run_queues
> >       8.65 =C2=B1 10%      -2.8        5.83 =C2=B1 26%  perf-profile.ca=
lltrace.cycles-
> > pp.clockevents_program_event.hrtimer_interrupt.smp_apic_timer_interrup
> > t.apic_timer_interrupt
> >       3.81 =C2=B1 39%      -1.9        1.89 =C2=B1 30%  perf-profile.ca=
lltrace.cycles-
> > pp.ktime_get.clockevents_program_event.hrtimer_interrupt.smp_apic_tim
> > er_interrupt.apic_timer_interrupt
> >       4.05 =C2=B1  6%      -1.3        2.72 =C2=B1 25%  perf-profile.ca=
lltrace.cycles-
> > pp.ktime_get_update_offsets_now.hrtimer_interrupt.smp_apic_timer_inte
> > rrupt.apic_timer_interrupt
> >       3.42 =C2=B1100%      -1.3        2.11 =C2=B1173%  perf-profile.ca=
lltrace.cycles-
> > pp.irq_work_interrupt
> >       3.42 =C2=B1100%      -1.3        2.11 =C2=B1173%  perf-profile.ca=
lltrace.cycles-
> > pp.smp_irq_work_interrupt.irq_work_interrupt
> >       3.40 =C2=B1100%      -1.3        2.11 =C2=B1173%  perf-profile.ca=
lltrace.cycles-
> > pp.irq_work_run_list.irq_work_run.smp_irq_work_interrupt.irq_work_inter
> > rupt
> >       3.40 =C2=B1100%      -1.3        2.11 =C2=B1173%  perf-profile.ca=
lltrace.cycles-
> > pp.irq_work_run.smp_irq_work_interrupt.irq_work_interrupt
> >       3.40 =C2=B1100%      -1.1        2.27 =C2=B1173%  perf-profile.ca=
lltrace.cycles-
> > pp.printk.irq_work_run_list.irq_work_run.smp_irq_work_interrupt.irq_wor
> > k_interrupt
> >       3.40 =C2=B1100%      -1.1        2.27 =C2=B1173%  perf-profile.ca=
lltrace.cycles-
> > pp.vprintk_emit.printk.irq_work_run_list.irq_work_run.smp_irq_work_inter
> > rupt
> >       3.40 =C2=B1100%      -1.1        2.27 =C2=B1173%  perf-profile.ca=
lltrace.cycles-
> > pp.console_unlock.vprintk_emit.printk.irq_work_run_list.irq_work_run
> >       3.38 =C2=B1100%      -1.1        2.30 =C2=B1173%  perf-profile.ca=
lltrace.cycles-
> > pp.secondary_startup_64
> >       3.38 =C2=B1100%      -1.1        2.30 =C2=B1173%  perf-profile.ca=
lltrace.cycles-
> > pp.start_secondary.secondary_startup_64
> >       3.38 =C2=B1100%      -1.1        2.30 =C2=B1173%  perf-profile.ca=
lltrace.cycles-
> > pp.cpu_startup_entry.start_secondary.secondary_startup_64
> >       3.37 =C2=B1100%      -1.1        2.30 =C2=B1173%  perf-profile.ca=
lltrace.cycles-
> > pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
> >       3.33 =C2=B1100%      -1.0        2.29 =C2=B1173%  perf-profile.ca=
lltrace.cycles-
> > pp.cpuidle_enter_state.do_idle.cpu_startup_entry.start_secondary.second
> > ary_startup_64
> >       3.29 =C2=B1101%      -1.0        2.29 =C2=B1173%  perf-profile.ca=
lltrace.cycles-
> > pp.intel_idle.cpuidle_enter_state.do_idle.cpu_startup_entry.start_secon=
da
> > ry
> >       2.59 =C2=B1 13%      -0.8        1.78 =C2=B1 20%  perf-profile.ca=
lltrace.cycles-
> > pp.__update_load_avg_se.task_tick_fair.scheduler_tick.update_process_ti
> > mes.tick_sched_handle
> >       1.37 =C2=B1 11%      -0.7        0.65 =C2=B1 64%  perf-profile.ca=
lltrace.cycles-
> > pp.timerqueue_del.__remove_hrtimer.__hrtimer_run_queues.hrtimer_int
> > errupt.smp_apic_timer_interrupt
> >       2.93 =C2=B1101%      -0.7        2.21 =C2=B1173%  perf-profile.ca=
lltrace.cycles-
> > pp.serial8250_console_write.console_unlock.vprintk_emit.printk.irq_work=
_r
> > un_list
> >       2.04 =C2=B1 13%      -0.7        1.35 =C2=B1 30%  perf-profile.ca=
lltrace.cycles-
> > pp.update_curr.task_tick_fair.scheduler_tick.update_process_times.tick_=
sc
> > hed_handle
> >       0.80 =C2=B1 16%      -0.5        0.30 =C2=B1100%  perf-profile.ca=
lltrace.cycles-
> > pp._raw_spin_lock_irq.__hrtimer_run_queues.hrtimer_interrupt.smp_apic
> > _timer_interrupt.apic_timer_interrupt
> >       0.00        +5.5e+11%       5530 =C2=B1110%
> > sched_debug.cfs_rq:/.MIN_vruntime.avg
> >      12338           +45.3%      17924 =C2=B1  7%  sched_debug.cfs_rq:/=
.load.avg
> >      39464 =C2=B1 43%    +709.9%     319609 =C2=B1 46%  sched_debug.cfs=
_rq:/.load.max
> >       5132 =C2=B1 59%    +704.6%      41295 =C2=B1 41%  sched_debug.cfs=
_rq:/.load.stddev
> >     299.73 =C2=B1 28%     +60.1%     479.92 =C2=B1 19%
> > sched_debug.cfs_rq:/.load_avg.max
> >      52.90 =C2=B1 37%     +48.5%      78.55 =C2=B1 11%
> > sched_debug.cfs_rq:/.load_avg.stddev
> >       0.00        +5.5e+11%       5530 =C2=B1110%
> > sched_debug.cfs_rq:/.max_vruntime.avg
> >      56400 =C2=B1 32%    +258.5%     202169 =C2=B1  5%
> > sched_debug.cfs_rq:/.min_vruntime.stddev
> >       0.08 =C2=B1 13%     +26.3%       0.10 =C2=B1 11%
> > sched_debug.cfs_rq:/.nr_running.stddev
> >      11.16 =C2=B1  6%     +26.1%      14.08 =C2=B1  4%
> > sched_debug.cfs_rq:/.runnable_load_avg.avg
> >      34.70 =C2=B1 30%    +486.6%     203.54 =C2=B1 30%
> > sched_debug.cfs_rq:/.runnable_load_avg.max
> >       3.74 =C2=B1 31%    +599.1%      26.17 =C2=B1 30%
> > sched_debug.cfs_rq:/.runnable_load_avg.stddev
> >      12213           +46.1%      17837 =C2=B1  7%
> > sched_debug.cfs_rq:/.runnable_weight.avg
> >      35964 =C2=B1 43%    +788.0%     319358 =C2=B1 46%
> > sched_debug.cfs_rq:/.runnable_weight.max
> >       4732 =C2=B1 62%    +770.0%      41175 =C2=B1 42%
> > sched_debug.cfs_rq:/.runnable_weight.stddev
> >      40678 =C2=B1144%   +3754.8%    1568088 =C2=B1  2%
> > sched_debug.cfs_rq:/.spread0.avg
> >     127330 =C2=B1 55%   +1238.0%    1703696 =C2=B1  3%
> > sched_debug.cfs_rq:/.spread0.max
> >     -87205           -98.1%      -1677        sched_debug.cfs_rq:/.spre=
ad0.min
> >      56217 =C2=B1 32%    +259.5%     202080 =C2=B1  5%
> > sched_debug.cfs_rq:/.spread0.stddev
> >     698851 =C2=B1  8%     -16.4%     584422 =C2=B1  9%  sched_debug.cpu=
.avg_idle.min
> >     165933 =C2=B1  7%     +13.4%     188123        sched_debug.cpu.cloc=
k.avg
> >     165941 =C2=B1  7%     +13.4%     188129        sched_debug.cpu.cloc=
k.max
> >     165919 =C2=B1  7%     +13.4%     188115        sched_debug.cpu.cloc=
k.min
> >       5.35 =C2=B1 23%     -32.9%       3.59 =C2=B1  7%  sched_debug.cpu=
.clock.stddev
> >     165933 =C2=B1  7%     +13.4%     188123        sched_debug.cpu.cloc=
k_task.avg
> >     165941 =C2=B1  7%     +13.4%     188129        sched_debug.cpu.cloc=
k_task.max
> >     165919 =C2=B1  7%     +13.4%     188115        sched_debug.cpu.cloc=
k_task.min
> >       5.35 =C2=B1 23%     -32.9%       3.59 =C2=B1  7%  sched_debug.cpu=
.clock_task.stddev
> >      11.33 =C2=B1  4%     +19.3%      13.51 =C2=B1  9%  sched_debug.cpu=
.cpu_load[0].avg
> >      38.97 =C2=B1 28%    +418.2%     201.92 =C2=B1 30%  sched_debug.cpu=
.cpu_load[0].max
> >       4.46 =C2=B1 41%    +443.0%      24.23 =C2=B1 33%
> > sched_debug.cpu.cpu_load[0].stddev
> >      11.43 =C2=B1  4%     +17.6%      13.44 =C2=B1  8%  sched_debug.cpu=
.cpu_load[1].avg
> >      37.25 =C2=B1 26%    +418.9%     193.29 =C2=B1 30%  sched_debug.cpu=
.cpu_load[1].max
> >       4.08 =C2=B1 36%    +463.5%      23.00 =C2=B1 35%
> > sched_debug.cpu.cpu_load[1].stddev
> >      11.49 =C2=B1  4%     +16.2%      13.34 =C2=B1  7%  sched_debug.cpu=
.cpu_load[2].avg
> >      35.41 =C2=B1 21%    +398.6%     176.54 =C2=B1 30%  sched_debug.cpu=
.cpu_load[2].max
> >       3.74 =C2=B1 31%    +460.0%      20.96 =C2=B1 34%
> > sched_debug.cpu.cpu_load[2].stddev
> >      34.54 =C2=B1 14%    +336.3%     150.71 =C2=B1 21%  sched_debug.cpu=
.cpu_load[3].max
> >       3.51 =C2=B1 22%    +407.6%      17.84 =C2=B1 27%
> > sched_debug.cpu.cpu_load[3].stddev
> >      55.55          +164.1%     146.71 =C2=B1 15%  sched_debug.cpu.cpu_=
load[4].max
> >       5.57 =C2=B1  6%    +202.7%      16.85 =C2=B1 18%  sched_debug.cpu=
.cpu_load[4].stddev
> >       4396 =C2=B1  6%     +13.1%       4974 =C2=B1  7%  sched_debug.cpu=
.curr->pid.avg
> >       3517 =C2=B1 17%     -47.9%       1832 =C2=B1 34%  sched_debug.cpu=
.curr->pid.min
> >     305.14 =C2=B1 37%     +98.3%     604.98 =C2=B1 22%  sched_debug.cpu=
.curr->pid.stddev
> >      12364           +39.5%      17254 =C2=B1 14%  sched_debug.cpu.load=
.avg
> >      39007 =C2=B1 44%    +721.4%     320411 =C2=B1 46%  sched_debug.cpu=
.load.max
> >       5044 =C2=B1 63%    +681.3%      39414 =C2=B1 48%  sched_debug.cpu=
.load.stddev
> >     133158 =C2=B1  9%     +16.9%     155714
> > sched_debug.cpu.nr_load_updates.avg
> >     140928 =C2=B1  9%     +15.6%     162887
> > sched_debug.cpu.nr_load_updates.max
> >       1369 =C2=B1 37%     +66.8%       2283 =C2=B1  4%
> > sched_debug.cpu.nr_load_updates.stddev
> >       0.19 =C2=B1  3%     +22.7%       0.23 =C2=B1 15%  sched_debug.cpu=
.nr_running.stddev
> >       3143 =C2=B1  6%     +52.3%       4788 =C2=B1  3%  sched_debug.cpu=
.nr_switches.avg
> >      11472 =C2=B1 19%     +67.3%      19197 =C2=B1  3%  sched_debug.cpu=
.nr_switches.max
> >       2464 =C2=B1 19%     +73.5%       4275 =C2=B1  6%  sched_debug.cpu=
.nr_switches.stddev
> >     165920 =C2=B1  7%     +13.4%     188116        sched_debug.cpu_clk
> >     162590 =C2=B1  7%     +13.6%     184783        sched_debug.ktime
> >     167206 =C2=B1  6%     +13.6%     189868        sched_debug.sched_clk
> > =

> > =

> > =

> >                         ftq.time.involuntary_context_switches
> > =

> >   260000 +-+-----------------------------------------------------------=
-----+
> >          |O                                                            =
     |
> >   240000 +-+ O                                                         =
     |
> >   220000 O-+   O   O                                                   =
     |
> >          |  O   O O  O                                          O      =
     |
> >   200000 +-+                                            O              =
     |
> >   180000 +-+                                 O OO OO OO  O OOO O  OO OO=
 OO OO
> >          |                  O         O  O                             =
     |
> >   160000 +-+          O OOO  O  O  O O  O  O                           =
     |
> >   140000 +-+                   O  O         O                          =
     |
> >          |                                                             =
     |
> >   120000 +-+                          +                                =
     |
> >   100000 +-+ +.           +.     .+   :+                               =
     |
> >          |+.+  ++.++.++.++  ++.++  +.+  ++.+++.++.++.++.++.+++.++      =
     |
> >    80000 +-+-----------------------------------------------------------=
-----+
> > =

> > =

> > [*] bisect-good sample
> > [O] bisect-bad  sample
> > =

> > **********************************************************
> > *****************************************
> > lkp-hsw-ep2: 72 threads Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GHz with
> > 128G memory
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > compiler/kconfig/rootfs/tbox_group/testcase/type/ucode:
> >   gcc-7/x86_64-rhel-7.2/debian-x86_64-2018-04-03.cgz/lkp-hsw-
> > ep2/perf_test/lkp/0x3d
> > =

> > commit:
> >   73a049a90f ("ACPICA: disassembler: disassemble OEMx tables as AML")
> >   4c1379d7bb ("ACPICA: Debug output: Add option to display method/object
> > evaluation")
> > =

> > 73a049a90fb241af 4c1379d7bb42fa664e07845392
> > ---------------- --------------------------
> >        fail:runs  %reproduction    fail:runs
> >            |             |             |
> >            :8          100%           8:8     perf_test.msr_test.round1=
.cpu_util_zero.fail
> >          %stddev     %change         %stddev
> >              \          |                \
> >       1.00          -100.0%       0.00
> > perf_test.msr_test.round1.cpu_util_zero.pass
> >       1432           +13.1%       1620 =C2=B1  3%  perf_test.time.elaps=
ed_time
> >       1432           +13.1%       1620 =C2=B1  3%  perf_test.time.elaps=
ed_time.max
> >      43385            -6.9%      40403 =C2=B1  2%
> > perf_test.time.involuntary_context_switches
> >      76.62 =C2=B1  2%     +16.3%      89.12 =C2=B1  2%
> > perf_test.time.percent_of_cpu_this_job_got
> >     295.24           +17.2%     346.06 =C2=B1 13%  perf_test.time.syste=
m_time
> >     810.50           +36.5%       1106 =C2=B1  2%  perf_test.time.user_=
time
> >     360596           +43.1%     515953 =C2=B1 17%
> > perf_test.time.voluntary_context_switches
> >      16568           +46.1%      24206        meminfo.Inactive(anon)
> >      30398           +16.8%      35515        meminfo.Mapped
> >       1843 =C2=B1 10%      +9.1%       2010 =C2=B1  7%  meminfo.Mlocked
> >      19473           +39.3%      27124        meminfo.Shmem
> >       2897           -11.6%       2561 =C2=B1  3%  meminfo.max_used_kB
> > =

> > =

> > =

> > =

> > =

> > Disclaimer:
> > Results have been estimated based on internal Intel analysis and are
> > provided
> > for informational purposes only. Any difference in system hardware or
> > software
> > design or configuration may affect actual performance.
> > =

> > =

> > Thanks,
> > Rong Chen



--===============6259247179487620853==--

