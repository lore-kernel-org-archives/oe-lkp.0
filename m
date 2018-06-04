Content-Type: multipart/mixed; boundary="===============3885639518370148542=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [tracing/x86] 1c758a2202: aim9.disk_rr.ops_per_sec -12.0% regression
Date: Mon, 04 Jun 2018 16:12:31 +0800
Message-ID: <20180604081231.GC15961@intel.com>
In-Reply-To: <20180601174319.52646440@vmware.local.home>
List-Id: <oe-lkp.lists.linux.dev>

--===============3885639518370148542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 01, 2018 at 05:43:19PM -0400, Steven Rostedt wrote:
> On Mon, 28 May 2018 19:34:19 +0800
> kernel test robot <xiaolong.ye@intel.com> wrote:
> =

> > Greeting,
> > =

> > FYI, we noticed a -12.0% regression of aim9.disk_rr.ops_per_sec due to =
commit:
> > =

> > =

> > commit: 1c758a2202a6b4624d0703013a2c6cfa6e7455aa ("tracing/x86: Update =
syscall trace events to handle new prefixed syscall func names")
> =

> How can this commit cause a run time regression. It changes code
> in an __init call (that gets removed after boot)??

Sorry for the noise.

We actually enabled the syscall trace events for a duration of 10s
during many tests to hopefully capture syscall "noise", i.e. does some
syscall start to take more time etc. for a workload?

We failed to notice this monitor has stopped running due to commit
d5a00528b58c ("syscalls/core, syscalls/x86: Rename struct pt_regs-based
sys_*() to  __x64_sys_*()") as you pointed out in your commit's
changelog. And with your fix commit, syscall trace event starts to work
again, and I believe it is the 10s trace that caused some overhead
during the test that it triggered a bisect and ultimately sent out this
misleading report.

Regards,
Aaron

> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > =

> > in testcase: aim9
> > on test machine: 144 threads Intel(R) Xeon(R) CPU E7-8890 v3 @ 2.50GHz =
with 512G memory
> > with following parameters:
> > =

> > 	testtime: 300s
> > 	test: disk_rr
> > 	cpufreq_governor: performance
> > =

> > test-description: Suite IX is the "AIM Independent Resource Benchmark:"=
 the famous synthetic benchmark.
> > test-url: https://sourceforge.net/projects/aimbench/files/aim-suite9/
> > =

> > =

> > Details are as below:
> > -----------------------------------------------------------------------=
--------------------------->  =

> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/testt=
ime:
> >   gcc-7/performance/x86_64-rhel-7.2/debian-x86_64-2016-08-31.cgz/lkp-hs=
x04/disk_rr/aim9/300s
> > =

> > commit: =

> >   1cdae042fc ("tracing: Add missing forward declaration")
> >   1c758a2202 ("tracing/x86: Update syscall trace events to handle new p=
refixed syscall func names")
> > =

> > 1cdae042fc63dd98 1c758a2202a6b4624d0703013a =

> > ---------------- -------------------------- =

> >          %stddev     %change         %stddev
> >              \          |                \  =

> >     633310           -12.0%     557268        aim9.disk_rr.ops_per_sec
> >     244.24            +2.2%     249.57        aim9.time.system_time
> >      55.76            -9.6%      50.43        aim9.time.user_time
> >       8135 =C2=B1 39%     +73.2%      14091 =C2=B1 33%  numa-meminfo.no=
de0.Shmem
> >       1328           -11.9%       1171        pmeter.performance_per_wa=
tt
> >     450606 =C2=B1  3%      -9.5%     407878 =C2=B1  5%  meminfo.Committ=
ed_AS
> >     406.75 =C2=B1173%    +300.1%       1627        meminfo.Mlocked
> >      20124 =C2=B1  4%      +8.4%      21819 =C2=B1  6%  softirqs.NET_RX
> >    8237636 =C2=B1  6%     -15.4%    6965294 =C2=B1  2%  softirqs.RCU
> >       2033 =C2=B1 39%     +73.0%       3518 =C2=B1 33%  numa-vmstat.nod=
e0.nr_shmem
> >      21.25 =C2=B1173%    +378.8%     101.75 =C2=B1 27%  numa-vmstat.nod=
e2.nr_mlock
> >      21.25 =C2=B1173%    +378.8%     101.75 =C2=B1 27%  numa-vmstat.nod=
e3.nr_mlock
> >  9.408e+08 =C2=B1  6%     +53.3%  1.442e+09 =C2=B1 20%  perf-stat.dTLB-=
load-misses
> >      47.39 =C2=B1 17%     -10.4       36.99 =C2=B1  8%  perf-stat.iTLB-=
load-miss-rate%
> >       1279 =C2=B1 27%     +63.4%       2089 =C2=B1 21%  perf-stat.instr=
uctions-per-iTLB-miss
> >      46.73 =C2=B1  5%      -5.4       41.33 =C2=B1  5%  perf-stat.node-=
store-miss-rate%
> >      19240            +1.2%      19474        proc-vmstat.nr_indirectly=
_reclaimable
> >      18868            +4.0%      19628        proc-vmstat.nr_slab_recla=
imable
> >   48395423           -11.8%   42700849        proc-vmstat.numa_hit
> >   48314997           -11.8%   42620296        proc-vmstat.numa_local
> >    3153408           -12.0%    2775642        proc-vmstat.pgactivate
> >   48365477           -11.8%   42678780        proc-vmstat.pgfree
> >       3060           +38.9%       4250        slabinfo.ftrace_event_fie=
ld.active_objs
> >       3060           +38.9%       4250        slabinfo.ftrace_event_fie=
ld.num_objs
> >       2748 =C2=B1  3%      -8.9%       2502 =C2=B1  3%  slabinfo.sighan=
d_cache.active_objs
> >       2763 =C2=B1  3%      -8.9%       2517 =C2=B1  3%  slabinfo.sighan=
d_cache.num_objs
> >       4125 =C2=B1  4%     -10.3%       3700 =C2=B1  2%  slabinfo.signal=
_cache.active_objs
> >       4125 =C2=B1  4%     -10.3%       3700 =C2=B1  2%  slabinfo.signal=
_cache.num_objs
> >       1104           +57.3%       1736        slabinfo.trace_event_file=
.active_objs
> >       1104           +57.3%       1736        slabinfo.trace_event_file=
.num_objs
> >       0.78 =C2=B1  4%      -0.1        0.67 =C2=B1  5%  perf-profile.ca=
lltrace.cycles-pp.rcu_process_callbacks.__softirqentry_text_start.irq_exit.=
smp_apic_timer_interrupt.apic_timer_interrupt
> >       2.10 =C2=B1  2%      -0.1        2.00        perf-profile.calltra=
ce.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.smp_ap=
ic_timer_interrupt.apic_timer_interrupt
> >       1.89            -0.1        1.79        perf-profile.calltrace.cy=
cles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_int=
errupt.smp_apic_timer_interrupt
> >       1.71 =C2=B1  2%      -0.1        1.60        perf-profile.calltra=
ce.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrti=
mer_run_queues.hrtimer_interrupt
> >       0.53 =C2=B1 12%      -0.1        0.44 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp._raw_spin_lock_irqsave
> >       0.17 =C2=B1  7%      -0.0        0.15 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.leave_mm
> >       0.09 =C2=B1  8%      -0.0        0.08 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.cpu_load_update_active
> >       0.17 =C2=B1  8%      +0.0        0.19 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.irq_work_needs_cpu
> >       0.43 =C2=B1 14%      -0.1        0.38 =C2=B1  3%  perf-profile.se=
lf.cycles-pp._raw_spin_lock_irqsave
> >       0.17 =C2=B1  7%      -0.0        0.15 =C2=B1  4%  perf-profile.se=
lf.cycles-pp.leave_mm
> >       0.30            +0.0        0.32 =C2=B1  2%  perf-profile.self.cy=
cles-pp.get_next_timer_interrupt
> >       0.17 =C2=B1  8%      +0.0        0.19 =C2=B1  4%  perf-profile.se=
lf.cycles-pp.irq_work_needs_cpu
> >       0.06 =C2=B1  9%      +0.0        0.08 =C2=B1 15%  perf-profile.se=
lf.cycles-pp.sched_clock
> >       4358 =C2=B1 15%     +25.0%       5446 =C2=B1  7%  sched_debug.cfs=
_rq:/.exec_clock.avg
> >      24231 =C2=B1  7%     +12.3%      27202 =C2=B1  3%  sched_debug.cfs=
_rq:/.exec_clock.stddev
> >      23637 =C2=B1 17%     +33.3%      31501 =C2=B1 14%  sched_debug.cfs=
_rq:/.load.avg
> >      73299 =C2=B1  9%     +19.8%      87807 =C2=B1  8%  sched_debug.cfs=
_rq:/.load.stddev
> >      35584 =C2=B1  7%     +13.2%      40294 =C2=B1  5%  sched_debug.cfs=
_rq:/.min_vruntime.stddev
> >       0.09 =C2=B1 10%     +27.8%       0.12 =C2=B1 15%  sched_debug.cfs=
_rq:/.nr_running.avg
> >      17.10 =C2=B1 18%     +36.5%      23.33 =C2=B1 18%  sched_debug.cfs=
_rq:/.runnable_load_avg.avg
> >      63.20 =C2=B1 10%     +18.9%      75.11 =C2=B1  7%  sched_debug.cfs=
_rq:/.runnable_load_avg.stddev
> >      23618 =C2=B1 17%     +33.3%      31477 =C2=B1 14%  sched_debug.cfs=
_rq:/.runnable_weight.avg
> >      73217 =C2=B1  9%     +19.9%      87751 =C2=B1  8%  sched_debug.cfs=
_rq:/.runnable_weight.stddev
> >      35584 =C2=B1  7%     +13.2%      40294 =C2=B1  5%  sched_debug.cfs=
_rq:/.spread0.stddev
> >      95.02 =C2=B1  9%     +14.5%     108.82 =C2=B1  7%  sched_debug.cfs=
_rq:/.util_avg.avg
> >      19.44 =C2=B1  9%     +23.0%      23.91 =C2=B1 10%  sched_debug.cfs=
_rq:/.util_est_enqueued.avg
> >     323.02 =C2=B1  3%      -6.4%     302.21 =C2=B1  4%  sched_debug.cpu=
.ttwu_local.avg
> > =

> > =

> >                                                                        =
         =

> >                               aim9.disk_rr.ops_per_sec                 =
         =

> >                                                                        =
         =

> >   650000 +-+-----------------------------------------------------------=
-----+   =

> >   640000 +-+                  .+..                                     =
     |   =

> >          |    .+.+..+..+..+..+    +..       .+..          .+..       .+=
..+..|   =

> >   630000 +-++.                       +..+..+    +..+..+.+.    +..+..+  =
     |   =

> >   620000 +-+                                                           =
     |   =

> >          |                                                             =
     |   =

> >   610000 +-+                                                           =
     |   =

> >   600000 +-+                                                           =
     |   =

> >   590000 +-+                                                           =
     |   =

> >          |                                                             =
     |   =

> >   580000 +-+                                                           =
     |   =

> >   570000 +-+                                                           =
     |   =

> >          O     O O     O  O  O O        O  O                     O     =
     |   =

> >   560000 +-+O       O             O  O       O  O  O  O O  O  O     O O=
     |   =

> >   550000 +-+-----------------------------------------------------------=
-----+   =

> >                                                                        =
         =

> >                                                                        =
                                                                           =
              =

> >                                aim9.time.user_time                     =
         =

> >                                                                        =
         =

> >   57 +-+---------------------------------------------------------------=
-----+   =

> >      |                      .+..+..     .+.           .+..             =
    .|   =

> >   56 +-+  .+..+..  .+..+..+.       +..+.   +..  .+..+.    +..  .+..  .+=
..+. |   =

> >   55 +-++.       +.                           +.             +.    +.  =
     |   =

> >      |                                                                 =
     |   =

> >   54 +-+                                                               =
     |   =

> >      |                                                                 =
     |   =

> >   53 +-+                                                               =
     |   =

> >      |                                                                 =
     |   =

> >   52 +-+                              O                                =
     |   =

> >   51 +-+                                                               =
     |   =

> >      |     O  O           O     O  O     O                O     O     O=
     |   =

> >   50 O-+O        O           O                O     O  O     O     O   =
     |   =

> >      |              O  O                   O     O                     =
     |   =

> >   49 +-+---------------------------------------------------------------=
-----+   =

> >                                                                        =
         =

> >                                                                        =
                                                                           =
              =

> >                                aim9.time.system_time                   =
         =

> >                                                                        =
         =

> >   251 +-+--------------------------------------------------------------=
-----+   =

> >       |              O  O                   O     O                    =
     |   =

> >   250 O-+O        O          O                 O     O  O    O     O   =
     |   =

> >   249 +-+   O  O          O     O  O     O                 O    O     O=
     |   =

> >       |                                                                =
     |   =

> >   248 +-+                             O                                =
     |   =

> >       |                                                                =
     |   =

> >   247 +-+                                                              =
     |   =

> >       |                                                                =
     |   =

> >   246 +-+                                                              =
     |   =

> >   245 +-+                                                              =
     |   =

> >       | .+..     .+..                         .+..          .+..  .+.. =
     |   =

> >   244 +-+   +..+.    +..+.+..     .+..+..+..+.    +..+..+..+    +.    +=
..+..|   =

> >       |                      +..+.                                     =
     |   =

> >   243 +-+--------------------------------------------------------------=
-----+   =

> >                                                                        =
         =

> >                                                                        =
         =

> >                                                                        =
         =

> > [*] bisect-good sample
> > [O] bisect-bad  sample
> > =

> > =

> > Disclaimer:
> > Results have been estimated based on internal Intel analysis and are pr=
ovided
> > for informational purposes only. Any difference in system hardware or s=
oftware
> > design or configuration may affect actual performance.
> > =

> > =

> > Thanks,
> > Xiaolong
> =

> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============3885639518370148542==--

