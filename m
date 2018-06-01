Content-Type: multipart/mixed; boundary="===============6783962521271201746=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [tracing/x86] 1c758a2202: aim9.disk_rr.ops_per_sec -12.0% regression
Date: Fri, 01 Jun 2018 17:43:19 -0400
Message-ID: <20180601174319.52646440@vmware.local.home>
In-Reply-To: <20180528113419.GE9904@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6783962521271201746==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 28 May 2018 19:34:19 +0800
kernel test robot <xiaolong.ye@intel.com> wrote:

> Greeting,
> =

> FYI, we noticed a -12.0% regression of aim9.disk_rr.ops_per_sec due to co=
mmit:
> =

> =

> commit: 1c758a2202a6b4624d0703013a2c6cfa6e7455aa ("tracing/x86: Update sy=
scall trace events to handle new prefixed syscall func names")

How can this commit cause a run time regression. It changes code
in an __init call (that gets removed after boot)??

-- Steve
 =


> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: aim9
> on test machine: 144 threads Intel(R) Xeon(R) CPU E7-8890 v3 @ 2.50GHz wi=
th 512G memory
> with following parameters:
> =

> 	testtime: 300s
> 	test: disk_rr
> 	cpufreq_governor: performance
> =

> test-description: Suite IX is the "AIM Independent Resource Benchmark:" t=
he famous synthetic benchmark.
> test-url: https://sourceforge.net/projects/aimbench/files/aim-suite9/
> =

> =

> Details are as below:
> -------------------------------------------------------------------------=
------------------------->  =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/testtim=
e:
>   gcc-7/performance/x86_64-rhel-7.2/debian-x86_64-2016-08-31.cgz/lkp-hsx0=
4/disk_rr/aim9/300s
> =

> commit: =

>   1cdae042fc ("tracing: Add missing forward declaration")
>   1c758a2202 ("tracing/x86: Update syscall trace events to handle new pre=
fixed syscall func names")
> =

> 1cdae042fc63dd98 1c758a2202a6b4624d0703013a =

> ---------------- -------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     633310           -12.0%     557268        aim9.disk_rr.ops_per_sec
>     244.24            +2.2%     249.57        aim9.time.system_time
>      55.76            -9.6%      50.43        aim9.time.user_time
>       8135 =C2=B1 39%     +73.2%      14091 =C2=B1 33%  numa-meminfo.node=
0.Shmem
>       1328           -11.9%       1171        pmeter.performance_per_watt
>     450606 =C2=B1  3%      -9.5%     407878 =C2=B1  5%  meminfo.Committed=
_AS
>     406.75 =C2=B1173%    +300.1%       1627        meminfo.Mlocked
>      20124 =C2=B1  4%      +8.4%      21819 =C2=B1  6%  softirqs.NET_RX
>    8237636 =C2=B1  6%     -15.4%    6965294 =C2=B1  2%  softirqs.RCU
>       2033 =C2=B1 39%     +73.0%       3518 =C2=B1 33%  numa-vmstat.node0=
.nr_shmem
>      21.25 =C2=B1173%    +378.8%     101.75 =C2=B1 27%  numa-vmstat.node2=
.nr_mlock
>      21.25 =C2=B1173%    +378.8%     101.75 =C2=B1 27%  numa-vmstat.node3=
.nr_mlock
>  9.408e+08 =C2=B1  6%     +53.3%  1.442e+09 =C2=B1 20%  perf-stat.dTLB-lo=
ad-misses
>      47.39 =C2=B1 17%     -10.4       36.99 =C2=B1  8%  perf-stat.iTLB-lo=
ad-miss-rate%
>       1279 =C2=B1 27%     +63.4%       2089 =C2=B1 21%  perf-stat.instruc=
tions-per-iTLB-miss
>      46.73 =C2=B1  5%      -5.4       41.33 =C2=B1  5%  perf-stat.node-st=
ore-miss-rate%
>      19240            +1.2%      19474        proc-vmstat.nr_indirectly_r=
eclaimable
>      18868            +4.0%      19628        proc-vmstat.nr_slab_reclaim=
able
>   48395423           -11.8%   42700849        proc-vmstat.numa_hit
>   48314997           -11.8%   42620296        proc-vmstat.numa_local
>    3153408           -12.0%    2775642        proc-vmstat.pgactivate
>   48365477           -11.8%   42678780        proc-vmstat.pgfree
>       3060           +38.9%       4250        slabinfo.ftrace_event_field=
.active_objs
>       3060           +38.9%       4250        slabinfo.ftrace_event_field=
.num_objs
>       2748 =C2=B1  3%      -8.9%       2502 =C2=B1  3%  slabinfo.sighand_=
cache.active_objs
>       2763 =C2=B1  3%      -8.9%       2517 =C2=B1  3%  slabinfo.sighand_=
cache.num_objs
>       4125 =C2=B1  4%     -10.3%       3700 =C2=B1  2%  slabinfo.signal_c=
ache.active_objs
>       4125 =C2=B1  4%     -10.3%       3700 =C2=B1  2%  slabinfo.signal_c=
ache.num_objs
>       1104           +57.3%       1736        slabinfo.trace_event_file.a=
ctive_objs
>       1104           +57.3%       1736        slabinfo.trace_event_file.n=
um_objs
>       0.78 =C2=B1  4%      -0.1        0.67 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.rcu_process_callbacks.__softirqentry_text_start.irq_exit.sm=
p_apic_timer_interrupt.apic_timer_interrupt
>       2.10 =C2=B1  2%      -0.1        2.00        perf-profile.calltrace=
.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.smp_apic=
_timer_interrupt.apic_timer_interrupt
>       1.89            -0.1        1.79        perf-profile.calltrace.cycl=
es-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_inter=
rupt.smp_apic_timer_interrupt
>       1.71 =C2=B1  2%      -0.1        1.60        perf-profile.calltrace=
.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrtime=
r_run_queues.hrtimer_interrupt
>       0.53 =C2=B1 12%      -0.1        0.44 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irqsave
>       0.17 =C2=B1  7%      -0.0        0.15 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.leave_mm
>       0.09 =C2=B1  8%      -0.0        0.08 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.cpu_load_update_active
>       0.17 =C2=B1  8%      +0.0        0.19 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.irq_work_needs_cpu
>       0.43 =C2=B1 14%      -0.1        0.38 =C2=B1  3%  perf-profile.self=
.cycles-pp._raw_spin_lock_irqsave
>       0.17 =C2=B1  7%      -0.0        0.15 =C2=B1  4%  perf-profile.self=
.cycles-pp.leave_mm
>       0.30            +0.0        0.32 =C2=B1  2%  perf-profile.self.cycl=
es-pp.get_next_timer_interrupt
>       0.17 =C2=B1  8%      +0.0        0.19 =C2=B1  4%  perf-profile.self=
.cycles-pp.irq_work_needs_cpu
>       0.06 =C2=B1  9%      +0.0        0.08 =C2=B1 15%  perf-profile.self=
.cycles-pp.sched_clock
>       4358 =C2=B1 15%     +25.0%       5446 =C2=B1  7%  sched_debug.cfs_r=
q:/.exec_clock.avg
>      24231 =C2=B1  7%     +12.3%      27202 =C2=B1  3%  sched_debug.cfs_r=
q:/.exec_clock.stddev
>      23637 =C2=B1 17%     +33.3%      31501 =C2=B1 14%  sched_debug.cfs_r=
q:/.load.avg
>      73299 =C2=B1  9%     +19.8%      87807 =C2=B1  8%  sched_debug.cfs_r=
q:/.load.stddev
>      35584 =C2=B1  7%     +13.2%      40294 =C2=B1  5%  sched_debug.cfs_r=
q:/.min_vruntime.stddev
>       0.09 =C2=B1 10%     +27.8%       0.12 =C2=B1 15%  sched_debug.cfs_r=
q:/.nr_running.avg
>      17.10 =C2=B1 18%     +36.5%      23.33 =C2=B1 18%  sched_debug.cfs_r=
q:/.runnable_load_avg.avg
>      63.20 =C2=B1 10%     +18.9%      75.11 =C2=B1  7%  sched_debug.cfs_r=
q:/.runnable_load_avg.stddev
>      23618 =C2=B1 17%     +33.3%      31477 =C2=B1 14%  sched_debug.cfs_r=
q:/.runnable_weight.avg
>      73217 =C2=B1  9%     +19.9%      87751 =C2=B1  8%  sched_debug.cfs_r=
q:/.runnable_weight.stddev
>      35584 =C2=B1  7%     +13.2%      40294 =C2=B1  5%  sched_debug.cfs_r=
q:/.spread0.stddev
>      95.02 =C2=B1  9%     +14.5%     108.82 =C2=B1  7%  sched_debug.cfs_r=
q:/.util_avg.avg
>      19.44 =C2=B1  9%     +23.0%      23.91 =C2=B1 10%  sched_debug.cfs_r=
q:/.util_est_enqueued.avg
>     323.02 =C2=B1  3%      -6.4%     302.21 =C2=B1  4%  sched_debug.cpu.t=
twu_local.avg
> =

> =

>                                                                          =
       =

>                               aim9.disk_rr.ops_per_sec                   =
       =

>                                                                          =
       =

>   650000 +-+-------------------------------------------------------------=
---+   =

>   640000 +-+                  .+..                                       =
   |   =

>          |    .+.+..+..+..+..+    +..       .+..          .+..       .+..=
+..|   =

>   630000 +-++.                       +..+..+    +..+..+.+.    +..+..+    =
   |   =

>   620000 +-+                                                             =
   |   =

>          |                                                               =
   |   =

>   610000 +-+                                                             =
   |   =

>   600000 +-+                                                             =
   |   =

>   590000 +-+                                                             =
   |   =

>          |                                                               =
   |   =

>   580000 +-+                                                             =
   |   =

>   570000 +-+                                                             =
   |   =

>          O     O O     O  O  O O        O  O                     O       =
   |   =

>   560000 +-+O       O             O  O       O  O  O  O O  O  O     O O  =
   |   =

>   550000 +-+-------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                                aim9.time.user_time                       =
       =

>                                                                          =
       =

>   57 +-+-----------------------------------------------------------------=
---+   =

>      |                      .+..+..     .+.           .+..               =
  .|   =

>   56 +-+  .+..+..  .+..+..+.       +..+.   +..  .+..+.    +..  .+..  .+..=
+. |   =

>   55 +-++.       +.                           +.             +.    +.    =
   |   =

>      |                                                                   =
   |   =

>   54 +-+                                                                 =
   |   =

>      |                                                                   =
   |   =

>   53 +-+                                                                 =
   |   =

>      |                                                                   =
   |   =

>   52 +-+                              O                                  =
   |   =

>   51 +-+                                                                 =
   |   =

>      |     O  O           O     O  O     O                O     O     O  =
   |   =

>   50 O-+O        O           O                O     O  O     O     O     =
   |   =

>      |              O  O                   O     O                       =
   |   =

>   49 +-+-----------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                                aim9.time.system_time                     =
       =

>                                                                          =
       =

>   251 +-+----------------------------------------------------------------=
---+   =

>       |              O  O                   O     O                      =
   |   =

>   250 O-+O        O          O                 O     O  O    O     O     =
   |   =

>   249 +-+   O  O          O     O  O     O                 O    O     O  =
   |   =

>       |                                                                  =
   |   =

>   248 +-+                             O                                  =
   |   =

>       |                                                                  =
   |   =

>   247 +-+                                                                =
   |   =

>       |                                                                  =
   |   =

>   246 +-+                                                                =
   |   =

>   245 +-+                                                                =
   |   =

>       | .+..     .+..                         .+..          .+..  .+..   =
   |   =

>   244 +-+   +..+.    +..+.+..     .+..+..+..+.    +..+..+..+    +.    +..=
+..|   =

>       |                      +..+.                                       =
   |   =

>   243 +-+----------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
       =

>                                                                          =
       =

> [*] bisect-good sample
> [O] bisect-bad  sample
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
> Xiaolong


--===============6783962521271201746==--

