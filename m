Content-Type: multipart/mixed; boundary="===============6966744004089142351=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [clocksource] 6c52b5f3cf: stress-ng.opcode.ops_per_sec -14.4% regression
Date: Wed, 21 Apr 2021 06:42:24 -0700
Message-ID: <20210421134224.GR975577@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <04f4752e-6c5a-8439-fe75-6363d212c7b2@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6966744004089142351==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 21, 2021 at 02:07:19PM +0800, Xing, Zhengjun wrote:
> =

> =

> On 4/20/2021 10:05 PM, Paul E. McKenney wrote:
> > On Tue, Apr 20, 2021 at 06:43:31AM -0700, Paul E. McKenney wrote:
> > > On Tue, Apr 20, 2021 at 02:49:34PM +0800, kernel test robot wrote:
> > > > =

> > > > Greeting,
> > > > =

> > > > FYI, we noticed a -14.4% regression of stress-ng.opcode.ops_per_sec=
 due to commit:
> > > > =

> > > > =

> > > > commit: 6c52b5f3cfefd6e429efc4413fd25e3c394e959f ("clocksource: Red=
uce WATCHDOG_THRESHOLD")
> > > > https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.git =
dev.2021.04.13a
> > > > =

> > > > =

> > > > in testcase: stress-ng
> > > > on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GH=
z with 192G memory
> > > > with following parameters:
> > > > =

> > > > 	nr_threads: 10%
> > > > 	disk: 1HDD
> > > > 	testtime: 60s
> > > > 	fs: ext4
> > > > 	class: os
> > > > 	test: opcode
> > > > 	cpufreq_governor: performance
> > > > 	ucode: 0x5003006
> > > Hmmm...  I will try a less-aggressive reduction.  Thank you for testi=
ng!
> > But wait...  This code is only running twice per second.  It is very
> > hard to believe that a clock-read retry twice per second is worth 2% of
> > performance, let alone 14.4%.
> > =

> > Is something else perhaps going on here?
> > =

> > For example, did this run enable any of the new diagnositic clocksource=
.*
> > kernel parameters?
> > =

> > 								Thanx, Paul
> =

> I attached the kernel log, the following logs are related with the
> clocksource.
> [=C2=A0=C2=A0=C2=A0 3.453206] clocksource: timekeeping watchdog on CPU1: =
Marking
> clocksource 'tsc-early' as unstable because the skew is too large:
> [=C2=A0=C2=A0=C2=A0 3.455197] clocksource:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 'hpet' wd_now: 288fcc0
> wd_last: 1a8b333 mask: ffffffff
> [=C2=A0=C2=A0=C2=A0 3.455199] clocksource:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 'tsc-early' cs_now:
> 1def309ebfdee cs_last: 1def2bd70d92c mask: ffffffffffffffff
> [=C2=A0=C2=A0=C2=A0 3.455201] clocksource:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 No current clocksource.
> [=C2=A0=C2=A0=C2=A0 3.457197] tsc: Marking TSC unstable due to clocksourc=
e watchdog
> =

> 6c52b5f3cf reduced WATCHDOG_THRESHOLD, then in clocksource_watchdog, the
> warning logs are print, the TSC is marked as unstable.
> /* Check the deviation from the watchdog clocksource. */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (abs(cs_nsec - wd_nsec) > WATCHDOG_THRESHOLD) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn(=
"timekeeping watchdog on CPU%d: Marking
> clocksource '%s' as unstable because the skew is too large:\n",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 smp_processor_id(), cs->name);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn(=
"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '%s' wd_now: %llx
> wd_last: %llx mask: %llx\n",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 watchdog->name, wdnow, wdlast,
> watchdog->mask);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn(=
"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '%s' cs_now: %llx
> cs_last: %llx mask: %llx\n",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cs->name, csnow, cslast, cs->mask);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __clocks=
ource_unstable(cs);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 }

Aha, so this system really does have an unstable TSC!  Which means that
the patch is operating as designed.

Or are you saying that this is a false positive?

							Thanx, Paul

> > > > In addition to that, the commit also has significant impact on the =
following tests:
> > > > =

> > > > +------------------+-----------------------------------------------=
----------------------------+
> > > > | testcase: change | unixbench: boot-time.dhcp 2.0% regression     =
                            |
> > > > | test machine     | 96 threads Intel(R) Xeon(R) CPU @ 2.30GHz with=
 128G memory                |
> > > > | test parameters  | cpufreq_governor=3Dperformance                =
                              |
> > > > |                  | nr_task=3D1                                   =
                              |
> > > > |                  | runtime=3D300s                                =
                              |
> > > > |                  | test=3Dexecl                                  =
                              |
> > > > |                  | ucode=3D0x4003006                             =
                              |
> > > > +------------------+-----------------------------------------------=
----------------------------+
> > > > | testcase: change | fsmark: fsmark.files_per_sec -37.8% regression=
                            |
> > > > | test machine     | 192 threads Intel(R) Xeon(R) Platinum 9242 CPU=
 @ 2.30GHz with 192G memory |
> > > > | test parameters  | cpufreq_governor=3Dperformance                =
                              |
> > > > |                  | disk=3D1BRD_48G                               =
                              |
> > > > |                  | filesize=3D4M                                 =
                              |
> > > > |                  | fs=3Dbtrfs                                    =
                              |
> > > > |                  | iterations=3D1x                               =
                              |
> > > > |                  | nr_threads=3D1t                               =
                              |
> > > > |                  | sync_method=3DNoSync                          =
                              |
> > > > |                  | test_size=3D24G                               =
                              |
> > > > |                  | ucode=3D0x5003006                             =
                              |
> > > > +------------------+-----------------------------------------------=
----------------------------+
> > > > =

> > > > =

> > > > If you fix the issue, kindly add following tag
> > > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > =

> > > > =

> > > > Details are as below:
> > > > -------------------------------------------------------------------=
------------------------------->
> > > > =

> > > > =

> > > > To reproduce:
> > > > =

> > > >          git clone https://github.com/intel/lkp-tests.git
> > > >          cd lkp-tests
> > > >          bin/lkp install                job.yaml  # job file is att=
ached in this email
> > > >          bin/lkp split-job --compatible job.yaml
> > > >          bin/lkp run                    compatible-job.yaml
> > > > =

> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/t=
box_group/test/testcase/testtime/ucode:
> > > >    os/gcc-9/performance/1HDD/ext4/x86_64-rhel-8.3/10%/debian-10.4-x=
86_64-20200603.cgz/lkp-csl-2sp5/opcode/stress-ng/60s/0x5003006
> > > > =

> > > > commit:
> > > >    d42c7a8d68 ("kcsan: Document "value changed" line")
> > > >    6c52b5f3cf ("clocksource: Reduce WATCHDOG_THRESHOLD")
> > > > =

> > > > d42c7a8d68038bc0 6c52b5f3cfefd6e429efc4413fd
> > > > ---------------- ---------------------------
> > > >           %stddev     %change         %stddev
> > > >               \          |                \
> > > >      570473           -14.4%     488107        stress-ng.opcode.ops
> > > >        9507           -14.4%       8135        stress-ng.opcode.ops=
_per_sec
> > > >      573594           -14.5%     490520        stress-ng.time.invol=
untary_context_switches
> > > >       18566 =C2=B1 13%     -33.6%      12331 =C2=B1 16%  stress-ng.=
time.major_page_faults
> > > >      149469 =C2=B1 44%     -47.1%      79036 =C2=B1  5%  stress-ng.=
time.maximum_resident_set_size
> > > >    38932182 =C2=B1  2%     -14.8%   33173409        stress-ng.time.=
minor_page_faults
> > > >      800.67            +1.6%     813.67        stress-ng.time.perce=
nt_of_cpu_this_job_got
> > > >      289.84           +12.8%     327.07        stress-ng.time.syste=
m_time
> > > >      207.53           -14.1%     178.27        stress-ng.time.user_=
time
> > > >     1045208           -11.5%     924508        stress-ng.time.volun=
tary_context_switches
> > > >       15.47            +1.3%      15.67        boot-time.dhcp
> > > >        2168 =C2=B1  2%      +4.3%       2262        boot-time.idle
> > > >        9.46           -11.9%       8.34        iostat.cpu.system
> > > >        1.91           +18.3%       2.26 =C2=B1  5%  iostat.cpu.user
> > > >       17319 =C2=B1  5%     +40.7%      24370 =C2=B1  2%  numa-memin=
fo.node1.Active
> > > >       16704 =C2=B1  5%     +42.8%      23852        numa-meminfo.no=
de1.Active(anon)
> > > >        4179 =C2=B1  5%     +42.8%       5968        numa-vmstat.nod=
e1.nr_active_anon
> > > >        4179 =C2=B1  5%     +42.8%       5968        numa-vmstat.nod=
e1.nr_zone_active_anon
> > > >       19143 =C2=B1  5%     +37.3%      26281        meminfo.Active
> > > >       17924 =C2=B1  5%     +39.8%      25063        meminfo.Active(=
anon)
> > > >       40996 =C2=B1  2%     +22.7%      50289        meminfo.Shmem
> > > >       88.00            +1.1%      89.00        vmstat.cpu.id
> > > >       68791           -13.1%      59772        vmstat.system.cs
> > > >     2602342 =C2=B1  2%     -21.6%    2038976        vmstat.system.in
> > > >   4.034e+09           -26.6%   2.96e+09        cpuidle.C1.time
> > > >   1.249e+08 =C2=B1  2%     -30.6%   86713543 =C2=B1  2%  cpuidle.C1=
.usage
> > > >    10583871 =C2=B1 19%    +106.1%   21814475 =C2=B1  3%  cpuidle.PO=
LL.time
> > > >      486292 =C2=B1 18%     +23.0%     598021 =C2=B1  2%  cpuidle.PO=
LL.usage
> > > >        2.41            -2.4        0.00        mpstat.cpu.all.irq%
> > > >        0.15            -0.1        0.01 =C2=B1 49%  mpstat.cpu.all.=
soft%
> > > >        6.03            +1.4        7.47        mpstat.cpu.all.sys%
> > > >        1.78            +0.3        2.08 =C2=B1  5%  mpstat.cpu.all.=
usr%
> > > >        0.00 =C2=B1 42%    +133.3%       0.01 =C2=B1 25%  perf-sched=
.sch_delay.avg.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry=
_SYSCALL_64_after_hwframe.[unknown]
> > > >        0.01 =C2=B1 14%     +68.0%       0.01 =C2=B1 18%  perf-sched=
.sch_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.cons=
tprop.0.do_select
> > > >        0.01 =C2=B1 14%     +68.0%       0.01 =C2=B1 18%  perf-sched=
.sch_delay.max.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.cons=
tprop.0.do_select
> > > >        3.07 =C2=B1  5%     +35.4%       4.16 =C2=B1 23%  perf-sched=
.sch_delay.max.ms.worker_thread.kthread.ret_from_fork
> > > >        2.63 =C2=B1 14%     +27.0%       3.34 =C2=B1 17%  sched_debu=
g.cpu.clock.stddev
> > > >      581.67 =C2=B1  4%     -98.6%       8.36 =C2=B1 16%  sched_debu=
g.cpu.clock_task.stddev
> > > >       20072 =C2=B1 41%     -60.5%       7934 =C2=B1114%  sched_debu=
g.cpu.nr_switches.avg
> > > >       34831 =C2=B1 29%     -52.3%      16613 =C2=B1 69%  sched_debu=
g.cpu.nr_switches.max
> > > >        1.00          -100.0%       0.00        sched_debug.sched_cl=
ock_stable()
> > > >       24399 =C2=B1  6%     -13.3%      21148 =C2=B1  7%  slabinfo.c=
red_jar.active_objs
> > > >       24409 =C2=B1  6%     -13.3%      21161 =C2=B1  7%  slabinfo.c=
red_jar.num_objs
> > > >        8294 =C2=B1  2%     -11.1%       7375        slabinfo.pid.ac=
tive_objs
> > > >        8294 =C2=B1  2%     -11.1%       7375        slabinfo.pid.nu=
m_objs
> > > >       29772 =C2=B1  3%     -10.7%      26590 =C2=B1  6%  slabinfo.p=
roc_inode_cache.active_objs
> > > >       29862 =C2=B1  3%     -10.7%      26670 =C2=B1  6%  slabinfo.p=
roc_inode_cache.num_objs
> > > >      511.67          +128.8%       1170        turbostat.Avg_MHz
> > > >       18.44           +23.7       42.13        turbostat.Busy%
> > > >   1.249e+08 =C2=B1  2%     -30.6%   86709326 =C2=B1  2%  turbostat.=
C1
> > > >       65.77           -17.4       48.42        turbostat.C1%
> > > >       80.65           -28.5%      57.65        turbostat.CPU%c1
> > > >     1.7e+08           -22.0%  1.325e+08        turbostat.IRQ
> > > >       55.67 =C2=B1  2%      +3.9%      57.83        turbostat.PkgTmp
> > > >      186.07            +9.8%     204.40        turbostat.PkgWatt
> > > >        4482 =C2=B1  5%     +39.9%       6270        proc-vmstat.nr_=
active_anon
> > > >       19665            -2.8%      19111        proc-vmstat.nr_kerne=
l_stack
> > > >       11209            +9.6%      12282        proc-vmstat.nr_mapped
> > > >       10271 =C2=B1  2%     +22.5%      12583        proc-vmstat.nr_=
shmem
> > > >       24169            -3.0%      23450        proc-vmstat.nr_slab_=
reclaimable
> > > >       52904            -1.4%      52156        proc-vmstat.nr_slab_=
unreclaimable
> > > >        4482 =C2=B1  5%     +39.9%       6270        proc-vmstat.nr_=
zone_active_anon
> > > >    35096977           -13.7%   30280778 =C2=B1  2%  proc-vmstat.num=
a_hit
> > > >    35010436           -13.8%   30194248 =C2=B1  2%  proc-vmstat.num=
a_local
> > > >       10212 =C2=B1  2%     +35.3%      13813 =C2=B1  4%  proc-vmsta=
t.pgactivate
> > > >    37511123           -14.1%   32225979 =C2=B1  2%  proc-vmstat.pga=
lloc_normal
> > > >    39225190 =C2=B1  2%     -14.7%   33455229        proc-vmstat.pgf=
ault
> > > >    37366865           -14.2%   32075663 =C2=B1  2%  proc-vmstat.pgf=
ree
> > > >        9.58 =C2=B1  3%      -7.8%       8.84 =C2=B1  2%  perf-stat.=
i.MPKI
> > > >   6.556e+09            -2.9%  6.366e+09        perf-stat.i.branch-i=
nstructions
> > > >        0.86 =C2=B1  2%      +0.1        0.96        perf-stat.i.bra=
nch-miss-rate%
> > > >    52874393           +10.8%   58588777        perf-stat.i.branch-m=
isses
> > > >    46443118 =C2=B1  2%      -8.2%   42638901        perf-stat.i.cac=
he-misses
> > > >   2.597e+08            -7.0%  2.415e+08        perf-stat.i.cache-re=
ferences
> > > >       70898           -13.3%      61457        perf-stat.i.context-=
switches
> > > >        2.02          +113.8%       4.32        perf-stat.i.cpi
> > > >    5.52e+10          +111.9%   1.17e+11        perf-stat.i.cpu-cycl=
es
> > > >        1881 =C2=B1  4%     -28.7%       1341 =C2=B1  2%  perf-stat.=
i.cpu-migrations
> > > >        1214 =C2=B1  2%    +131.8%       2815        perf-stat.i.cyc=
les-between-cache-misses
> > > >    47257151 =C2=B1  3%     -11.2%   41949022 =C2=B1  7%  perf-stat.=
i.dTLB-load-misses
> > > >   6.448e+09            -7.1%  5.988e+09        perf-stat.i.dTLB-loa=
ds
> > > >        0.15 =C2=B1  4%      -0.0        0.14 =C2=B1  3%  perf-stat.=
i.dTLB-store-miss-rate%
> > > >     7070051 =C2=B1  4%     -18.9%    5731351 =C2=B1  3%  perf-stat.=
i.dTLB-store-misses
> > > >   4.621e+09           -14.0%  3.974e+09        perf-stat.i.dTLB-sto=
res
> > > >       49.48            +5.4       54.88        perf-stat.i.iTLB-loa=
d-miss-rate%
> > > >    29623646            -9.3%   26860981        perf-stat.i.iTLB-loa=
d-misses
> > > >    30337180 =C2=B1  2%     -27.7%   21933274 =C2=B1  2%  perf-stat.=
i.iTLB-loads
> > > >      989.66            +7.8%       1066        perf-stat.i.instruct=
ions-per-iTLB-miss
> > > >        0.50           -53.4%       0.23        perf-stat.i.ipc
> > > >      298.29 =C2=B1 13%     -33.3%     198.98 =C2=B1 16%  perf-stat.=
i.major-faults
> > > >        0.57          +111.9%       1.22        perf-stat.i.metric.G=
Hz
> > > >        0.79           -12.6%       0.69        perf-stat.i.metric.K=
/sec
> > > >      186.95            -7.4%     173.13        perf-stat.i.metric.M=
/sec
> > > >      619972           -14.5%     529911        perf-stat.i.minor-fa=
ults
> > > >    16950944           -12.8%   14775464        perf-stat.i.node-loa=
d-misses
> > > >     1158174            -8.3%    1062165        perf-stat.i.node-loa=
ds
> > > >       82.15            +1.0       83.16        perf-stat.i.node-sto=
re-miss-rate%
> > > >     7266499 =C2=B1  3%      -9.8%    6556262 =C2=B1  2%  perf-stat.=
i.node-store-misses
> > > >     1461472 =C2=B1  3%     -14.1%    1254949 =C2=B1  3%  perf-stat.=
i.node-stores
> > > >      624047           -14.5%     533390        perf-stat.i.page-fau=
lts
> > > >        9.52            -6.0%       8.95        perf-stat.overall.MP=
KI
> > > >        0.81            +0.1        0.92        perf-stat.overall.br=
anch-miss-rate%
> > > >        2.02          +114.3%       4.33        perf-stat.overall.cpi
> > > >        1190 =C2=B1  2%    +130.8%       2747        perf-stat.overa=
ll.cycles-between-cache-misses
> > > >        0.15 =C2=B1  4%      -0.0        0.14 =C2=B1  3%  perf-stat.=
overall.dTLB-store-miss-rate%
> > > >       49.41            +5.6       55.05        perf-stat.overall.iT=
LB-load-miss-rate%
> > > >      921.55            +9.1%       1004        perf-stat.overall.in=
structions-per-iTLB-miss
> > > >        0.49           -53.3%       0.23        perf-stat.overall.ipc
> > > >   6.456e+09            -2.9%  6.268e+09        perf-stat.ps.branch-=
instructions
> > > >    52068658           +10.8%   57699339        perf-stat.ps.branch-=
misses
> > > >    45689361 =C2=B1  2%      -8.2%   41941220        perf-stat.ps.ca=
che-misses
> > > >   2.559e+08            -7.0%  2.379e+08        perf-stat.ps.cache-r=
eferences
> > > >       69875           -13.4%      60528        perf-stat.ps.context=
-switches
> > > >   5.437e+10          +111.9%  1.152e+11        perf-stat.ps.cpu-cyc=
les
> > > >        1856 =C2=B1  4%     -28.7%       1322 =C2=B1  2%  perf-stat.=
ps.cpu-migrations
> > > >    46573389 =C2=B1  3%     -11.2%   41343641 =C2=B1  7%  perf-stat.=
ps.dTLB-load-misses
> > > >   6.354e+09            -7.1%    5.9e+09        perf-stat.ps.dTLB-lo=
ads
> > > >     6967873 =C2=B1  4%     -19.0%    5646326 =C2=B1  3%  perf-stat.=
ps.dTLB-store-misses
> > > >   4.553e+09           -14.0%  3.915e+09        perf-stat.ps.dTLB-st=
ores
> > > >    29182781            -9.3%   26458801        perf-stat.ps.iTLB-lo=
ad-misses
> > > >    29879883 =C2=B1  2%     -27.7%   21606494 =C2=B1  2%  perf-stat.=
ps.iTLB-loads
> > > >      291.21 =C2=B1 13%     -33.3%     194.27 =C2=B1 16%  perf-stat.=
ps.major-faults
> > > >      611056 =C2=B1  2%     -14.6%     521852        perf-stat.ps.mi=
nor-faults
> > > >    16664002           -12.8%   14524399        perf-stat.ps.node-lo=
ad-misses
> > > >     1161220            -8.4%    1063348        perf-stat.ps.node-lo=
ads
> > > >     7141376 =C2=B1  3%      -9.8%    6441085 =C2=B1  2%  perf-stat.=
ps.node-store-misses
> > > >     1446833 =C2=B1  3%     -14.2%    1241728 =C2=B1  3%  perf-stat.=
ps.node-stores
> > > >      615068 =C2=B1  2%     -14.6%     525276        perf-stat.ps.pa=
ge-faults
> > > >    1.71e+12            -2.0%  1.676e+12        perf-stat.total.inst=
ructions
> > > >       14099 =C2=B1 12%     -34.3%       9258 =C2=B1  4%  softirqs.C=
PU0.RCU
> > > >       12872 =C2=B1  6%     +10.3%      14202 =C2=B1  3%  softirqs.C=
PU0.SCHED
> > > >       10233 =C2=B1  7%     -23.9%       7788 =C2=B1  3%  softirqs.C=
PU10.RCU
> > > >        9723 =C2=B1  4%     -20.3%       7752 =C2=B1  2%  softirqs.C=
PU11.RCU
> > > >        9728 =C2=B1  4%     -17.5%       8022 =C2=B1  6%  softirqs.C=
PU12.RCU
> > > >        9552 =C2=B1  7%     -19.0%       7739 =C2=B1  2%  softirqs.C=
PU13.RCU
> > > >       10179 =C2=B1 10%     -22.5%       7891 =C2=B1  3%  softirqs.C=
PU14.RCU
> > > >        9655 =C2=B1  5%     -16.5%       8064 =C2=B1  6%  softirqs.C=
PU15.RCU
> > > >       10140 =C2=B1  6%     -24.1%       7694        softirqs.CPU16.=
RCU
> > > >       10613 =C2=B1  6%     -26.6%       7787 =C2=B1  2%  softirqs.C=
PU17.RCU
> > > >       10154 =C2=B1  4%     -24.7%       7647        softirqs.CPU18.=
RCU
> > > >       10153 =C2=B1  4%     -25.0%       7614 =C2=B1  3%  softirqs.C=
PU19.RCU
> > > >       10271 =C2=B1  4%     -23.3%       7875 =C2=B1  7%  softirqs.C=
PU20.RCU
> > > >       10452 =C2=B1  3%     -24.6%       7884 =C2=B1  7%  softirqs.C=
PU21.RCU
> > > >       10249 =C2=B1  5%     -25.0%       7682 =C2=B1  4%  softirqs.C=
PU22.RCU
> > > >       10037 =C2=B1  4%     -24.3%       7595 =C2=B1  2%  softirqs.C=
PU23.RCU
> > > >       10086 =C2=B1  2%     -22.8%       7791 =C2=B1  3%  softirqs.C=
PU24.RCU
> > > >       10789 =C2=B1 17%     -25.4%       8052 =C2=B1  2%  softirqs.C=
PU25.RCU
> > > >        9938 =C2=B1  5%     -21.0%       7847 =C2=B1  6%  softirqs.C=
PU26.RCU
> > > >       10044 =C2=B1  4%     -24.3%       7604 =C2=B1  5%  softirqs.C=
PU27.RCU
> > > >       10007 =C2=B1  4%     -24.6%       7544 =C2=B1  3%  softirqs.C=
PU28.RCU
> > > >       10093 =C2=B1  7%     -24.6%       7613 =C2=B1  4%  softirqs.C=
PU29.RCU
> > > >       10018 =C2=B1  6%     -24.5%       7560 =C2=B1  3%  softirqs.C=
PU30.RCU
> > > >        9857 =C2=B1  3%     -22.5%       7642 =C2=B1  3%  softirqs.C=
PU31.RCU
> > > >        9618 =C2=B1  5%     -20.6%       7633 =C2=B1  3%  softirqs.C=
PU32.RCU
> > > >        9621 =C2=B1  4%     -21.7%       7528 =C2=B1  2%  softirqs.C=
PU33.RCU
> > > >        9840 =C2=B1  3%     -22.3%       7641 =C2=B1  3%  softirqs.C=
PU34.RCU
> > > >       10038 =C2=B1  8%     -25.6%       7465 =C2=B1  2%  softirqs.C=
PU35.RCU
> > > >        9852 =C2=B1  3%     -22.1%       7678 =C2=B1  4%  softirqs.C=
PU36.RCU
> > > >        9936 =C2=B1  6%     -22.7%       7676 =C2=B1  3%  softirqs.C=
PU37.RCU
> > > >        9721 =C2=B1  4%     -22.7%       7516 =C2=B1  3%  softirqs.C=
PU38.RCU
> > > >        9628 =C2=B1  5%     -21.4%       7572 =C2=B1  5%  softirqs.C=
PU39.RCU
> > > >       10003 =C2=B1  3%     -22.2%       7787 =C2=B1  3%  softirqs.C=
PU4.RCU
> > > >        9694 =C2=B1  4%     -22.1%       7550        softirqs.CPU40.=
RCU
> > > >        9750 =C2=B1  4%     -23.0%       7508 =C2=B1  2%  softirqs.C=
PU41.RCU
> > > >        9724 =C2=B1  5%     -21.7%       7617 =C2=B1  5%  softirqs.C=
PU42.RCU
> > > >        9746 =C2=B1  3%     -23.5%       7454 =C2=B1  2%  softirqs.C=
PU43.RCU
> > > >        9607 =C2=B1  5%     -20.1%       7679 =C2=B1  5%  softirqs.C=
PU44.RCU
> > > >        9600 =C2=B1  5%     -20.3%       7646 =C2=B1  7%  softirqs.C=
PU45.RCU
> > > >       10089 =C2=B1  8%     -24.5%       7622 =C2=B1  5%  softirqs.C=
PU46.RCU
> > > >        9534 =C2=B1  5%     -21.3%       7501 =C2=B1  2%  softirqs.C=
PU47.RCU
> > > >       10060 =C2=B1  4%     -21.8%       7864 =C2=B1  5%  softirqs.C=
PU48.RCU
> > > >        9977 =C2=B1  5%     -19.8%       8000 =C2=B1  4%  softirqs.C=
PU49.RCU
> > > >       10552 =C2=B1  7%     -26.0%       7812 =C2=B1  3%  softirqs.C=
PU50.RCU
> > > >       10431 =C2=B1  5%     -24.2%       7905 =C2=B1  4%  softirqs.C=
PU51.RCU
> > > >       10847 =C2=B1 16%     -26.0%       8023 =C2=B1  5%  softirqs.C=
PU52.RCU
> > > >       10367 =C2=B1  6%     -23.8%       7897 =C2=B1  4%  softirqs.C=
PU53.RCU
> > > >       10330 =C2=B1  3%     -25.1%       7741 =C2=B1  3%  softirqs.C=
PU54.RCU
> > > >       10586 =C2=B1  6%     -25.2%       7914 =C2=B1  2%  softirqs.C=
PU55.RCU
> > > >       10056 =C2=B1  7%     -22.5%       7796        softirqs.CPU56.=
RCU
> > > >       10704 =C2=B1  8%     -25.8%       7942 =C2=B1  3%  softirqs.C=
PU57.RCU
> > > >       10371 =C2=B1  4%     -24.7%       7812 =C2=B1  2%  softirqs.C=
PU58.RCU
> > > >       10294 =C2=B1  3%     -24.1%       7812 =C2=B1  3%  softirqs.C=
PU59.RCU
> > > >        9981 =C2=B1  4%     -20.8%       7909 =C2=B1  6%  softirqs.C=
PU6.RCU
> > > >       10241 =C2=B1  3%     -22.3%       7954 =C2=B1  3%  softirqs.C=
PU60.RCU
> > > >       10376 =C2=B1  7%     -23.6%       7929 =C2=B1  2%  softirqs.C=
PU61.RCU
> > > >       10290 =C2=B1  3%     -22.7%       7958 =C2=B1  4%  softirqs.C=
PU62.RCU
> > > >       10234 =C2=B1  3%     -23.2%       7856 =C2=B1  2%  softirqs.C=
PU63.RCU
> > > >       10616 =C2=B1  2%     -23.3%       8143 =C2=B1  7%  softirqs.C=
PU64.RCU
> > > >       10725 =C2=B1  5%     -26.9%       7835        softirqs.CPU65.=
RCU
> > > >       10809 =C2=B1  3%     -27.5%       7835 =C2=B1  3%  softirqs.C=
PU66.RCU
> > > >       10817 =C2=B1  5%     -27.3%       7867 =C2=B1  3%  softirqs.C=
PU67.RCU
> > > >       10906 =C2=B1  3%     -27.1%       7949 =C2=B1  4%  softirqs.C=
PU68.RCU
> > > >       11060 =C2=B1  3%     -28.7%       7886 =C2=B1  5%  softirqs.C=
PU69.RCU
> > > >        9806 =C2=B1  4%     -19.5%       7894 =C2=B1  3%  softirqs.C=
PU7.RCU
> > > >       10645 =C2=B1  4%     -27.3%       7738 =C2=B1  2%  softirqs.C=
PU70.RCU
> > > >       10764 =C2=B1  8%     -26.8%       7881 =C2=B1  2%  softirqs.C=
PU71.RCU
> > > >       10310 =C2=B1  5%     -25.5%       7680 =C2=B1  3%  softirqs.C=
PU72.RCU
> > > >       10301 =C2=B1  3%     -25.0%       7725 =C2=B1  3%  softirqs.C=
PU73.RCU
> > > >       10715 =C2=B1  2%     -25.7%       7960 =C2=B1  4%  softirqs.C=
PU74.RCU
> > > >       10495 =C2=B1  4%     -26.8%       7687 =C2=B1  2%  softirqs.C=
PU75.RCU
> > > >       10598 =C2=B1  8%     -25.5%       7892 =C2=B1  4%  softirqs.C=
PU76.RCU
> > > >       10592 =C2=B1  9%     -26.5%       7788 =C2=B1  3%  softirqs.C=
PU77.RCU
> > > >       10346 =C2=B1  4%     -25.8%       7678 =C2=B1  5%  softirqs.C=
PU78.RCU
> > > >       10415 =C2=B1  5%     -25.3%       7783 =C2=B1  3%  softirqs.C=
PU79.RCU
> > > >        9678 =C2=B1  5%     -17.8%       7956 =C2=B1  4%  softirqs.C=
PU8.RCU
> > > >       10111 =C2=B1  5%     -24.6%       7628 =C2=B1  3%  softirqs.C=
PU80.RCU
> > > >       10097 =C2=B1  3%     -18.3%       8246 =C2=B1  4%  softirqs.C=
PU81.RCU
> > > >       10222 =C2=B1  4%     -23.1%       7862 =C2=B1  3%  softirqs.C=
PU82.RCU
> > > >       10198 =C2=B1  5%     -23.0%       7855 =C2=B1  2%  softirqs.C=
PU83.RCU
> > > >       10325 =C2=B1  4%     -24.6%       7781 =C2=B1  4%  softirqs.C=
PU84.RCU
> > > >       10255 =C2=B1  3%     -21.9%       8005 =C2=B1  3%  softirqs.C=
PU85.RCU
> > > >       10194 =C2=B1  4%     -22.0%       7951 =C2=B1  2%  softirqs.C=
PU86.RCU
> > > >       10184 =C2=B1  5%     -24.7%       7671 =C2=B1  2%  softirqs.C=
PU87.RCU
> > > >       10368 =C2=B1  3%     -25.3%       7749 =C2=B1  2%  softirqs.C=
PU88.RCU
> > > >       10430 =C2=B1  5%     -24.6%       7862 =C2=B1  4%  softirqs.C=
PU89.RCU
> > > >        9775 =C2=B1  5%     -21.5%       7676 =C2=B1  2%  softirqs.C=
PU9.RCU
> > > >        9910 =C2=B1  4%     -21.9%       7740 =C2=B1  6%  softirqs.C=
PU90.RCU
> > > >       10147 =C2=B1  4%     -23.6%       7751 =C2=B1  3%  softirqs.C=
PU91.RCU
> > > >       10315 =C2=B1  7%     -25.4%       7693 =C2=B1  3%  softirqs.C=
PU92.RCU
> > > >       10103 =C2=B1  5%     -24.8%       7594 =C2=B1  2%  softirqs.C=
PU93.RCU
> > > >       10657 =C2=B1  9%     -27.6%       7713 =C2=B1  3%  softirqs.C=
PU94.RCU
> > > >       10088 =C2=B1  4%     -22.8%       7783 =C2=B1  5%  softirqs.C=
PU95.RCU
> > > >      980712 =C2=B1  4%     -23.2%     753584        softirqs.RCU
> > > >        0.00       +6.5e+103%      65.00 =C2=B1123%  interrupts.192:=
PCI-MSI.31983644-edge.i40e-eth1-TxRx-27
> > > >   1.584e+08           -24.6%  1.194e+08        interrupts.CAL:Funct=
ion_call_interrupts
> > > >     1553818           -21.9%    1212996        interrupts.CPU0.CAL:=
Function_call_interrupts
> > > >        1916 =C2=B1 20%     +99.9%       3829 =C2=B1  2%  interrupts=
.CPU0.NMI:Non-maskable_interrupts
> > > >        1916 =C2=B1 20%     +99.9%       3829 =C2=B1  2%  interrupts=
.CPU0.PMI:Performance_monitoring_interrupts
> > > >      451.50 =C2=B1 10%    +231.5%       1496 =C2=B1  9%  interrupts=
.CPU0.RES:Rescheduling_interrupts
> > > >       92.83 =C2=B1 27%     +34.5%     124.83 =C2=B1 12%  interrupts=
.CPU0.TLB:TLB_shootdowns
> > > >     1555201           -22.0%    1213457        interrupts.CPU1.CAL:=
Function_call_interrupts
> > > >        1693 =C2=B1 36%    +134.4%       3969 =C2=B1  3%  interrupts=
.CPU1.NMI:Non-maskable_interrupts
> > > >        1693 =C2=B1 36%    +134.4%       3969 =C2=B1  3%  interrupts=
.CPU1.PMI:Performance_monitoring_interrupts
> > > >      397.67 =C2=B1  6%    +280.2%       1512 =C2=B1  9%  interrupts=
.CPU1.RES:Rescheduling_interrupts
> > > >     1560119           -22.1%    1215683        interrupts.CPU10.CAL=
:Function_call_interrupts
> > > >      365.67 =C2=B1 10%    +290.6%       1428 =C2=B1 11%  interrupts=
.CPU10.RES:Rescheduling_interrupts
> > > >     1560624           -22.1%    1215999        interrupts.CPU11.CAL=
:Function_call_interrupts
> > > >      366.50 =C2=B1 14%    +287.1%       1418 =C2=B1 11%  interrupts=
.CPU11.RES:Rescheduling_interrupts
> > > >     1561507           -22.1%    1215913        interrupts.CPU12.CAL=
:Function_call_interrupts
> > > >      373.00 =C2=B1  8%    +289.9%       1454 =C2=B1 13%  interrupts=
.CPU12.RES:Rescheduling_interrupts
> > > >     1562400           -22.1%    1216393        interrupts.CPU13.CAL=
:Function_call_interrupts
> > > >      355.17 =C2=B1 11%    +303.6%       1433 =C2=B1 14%  interrupts=
.CPU13.RES:Rescheduling_interrupts
> > > >       80.67 =C2=B1 23%     +33.7%     107.83 =C2=B1 12%  interrupts=
.CPU13.TLB:TLB_shootdowns
> > > >     1562669           -22.2%    1216425        interrupts.CPU14.CAL=
:Function_call_interrupts
> > > >      398.50 =C2=B1 13%    +271.4%       1480 =C2=B1 11%  interrupts=
.CPU14.RES:Rescheduling_interrupts
> > > >     1564260           -22.2%    1217102        interrupts.CPU15.CAL=
:Function_call_interrupts
> > > >      346.50 =C2=B1  9%    +306.3%       1408 =C2=B1  8%  interrupts=
.CPU15.RES:Rescheduling_interrupts
> > > >     1564778           -22.2%    1217389        interrupts.CPU16.CAL=
:Function_call_interrupts
> > > >      344.67 =C2=B1 14%    +284.7%       1325 =C2=B1 11%  interrupts=
.CPU16.RES:Rescheduling_interrupts
> > > >       71.00 =C2=B1 10%     +54.5%     109.67 =C2=B1 19%  interrupts=
.CPU16.TLB:TLB_shootdowns
> > > >     1565548           -22.2%    1217621        interrupts.CPU17.CAL=
:Function_call_interrupts
> > > >      343.50 =C2=B1 14%    +307.0%       1398 =C2=B1 11%  interrupts=
.CPU17.RES:Rescheduling_interrupts
> > > >     1566249           -22.3%    1217608        interrupts.CPU18.CAL=
:Function_call_interrupts
> > > >      323.00 =C2=B1  8%    +334.4%       1403 =C2=B1 10%  interrupts=
.CPU18.RES:Rescheduling_interrupts
> > > >       74.50 =C2=B1 12%     +54.1%     114.83 =C2=B1 25%  interrupts=
.CPU18.TLB:TLB_shootdowns
> > > >     1566835           -22.2%    1218368        interrupts.CPU19.CAL=
:Function_call_interrupts
> > > >      357.50 =C2=B1 13%    +286.9%       1383 =C2=B1 15%  interrupts=
.CPU19.RES:Rescheduling_interrupts
> > > >       76.33 =C2=B1 15%     +41.7%     108.17 =C2=B1 21%  interrupts=
.CPU19.TLB:TLB_shootdowns
> > > >     1555036           -21.9%    1213727        interrupts.CPU2.CAL:=
Function_call_interrupts
> > > >        1916 =C2=B1 29%    +103.5%       3900 =C2=B1  3%  interrupts=
.CPU2.NMI:Non-maskable_interrupts
> > > >        1916 =C2=B1 29%    +103.5%       3900 =C2=B1  3%  interrupts=
.CPU2.PMI:Performance_monitoring_interrupts
> > > >      405.67 =C2=B1  3%    +255.6%       1442 =C2=B1 13%  interrupts=
.CPU2.RES:Rescheduling_interrupts
> > > >     1566774           -22.2%    1218796        interrupts.CPU20.CAL=
:Function_call_interrupts
> > > >      379.00 =C2=B1  9%    +267.4%       1392 =C2=B1 11%  interrupts=
.CPU20.RES:Rescheduling_interrupts
> > > >     1567370           -22.3%    1218379        interrupts.CPU21.CAL=
:Function_call_interrupts
> > > >      384.67 =C2=B1  7%    +276.9%       1450 =C2=B1  9%  interrupts=
.CPU21.RES:Rescheduling_interrupts
> > > >     1568808           -22.3%    1219084        interrupts.CPU22.CAL=
:Function_call_interrupts
> > > >      363.83 =C2=B1  8%    +288.5%       1413 =C2=B1  9%  interrupts=
.CPU22.RES:Rescheduling_interrupts
> > > >     1570464           -22.3%    1219491        interrupts.CPU23.CAL=
:Function_call_interrupts
> > > >      331.33 =C2=B1 16%    +309.1%       1355 =C2=B1 12%  interrupts=
.CPU23.RES:Rescheduling_interrupts
> > > >       69.00 =C2=B1 22%     +58.7%     109.50 =C2=B1 28%  interrupts=
.CPU23.TLB:TLB_shootdowns
> > > >     1570852           -22.4%    1218594        interrupts.CPU24.CAL=
:Function_call_interrupts
> > > >      360.67 =C2=B1 10%    +300.6%       1444 =C2=B1 15%  interrupts=
.CPU24.RES:Rescheduling_interrupts
> > > >     1572421           -22.5%    1218832        interrupts.CPU25.CAL=
:Function_call_interrupts
> > > >      361.50 =C2=B1 12%    +313.7%       1495 =C2=B1 18%  interrupts=
.CPU25.RES:Rescheduling_interrupts
> > > >     1573135           -22.5%    1219681        interrupts.CPU26.CAL=
:Function_call_interrupts
> > > >      346.50 =C2=B1  8%    +312.0%       1427 =C2=B1 16%  interrupts=
.CPU26.RES:Rescheduling_interrupts
> > > >       81.83 =C2=B1 22%     +50.1%     122.83 =C2=B1 20%  interrupts=
.CPU26.TLB:TLB_shootdowns
> > > >        0.00       +6.4e+103%      64.33 =C2=B1124%  interrupts.CPU2=
7.192:PCI-MSI.31983644-edge.i40e-eth1-TxRx-27
> > > >     1573607           -22.5%    1219860        interrupts.CPU27.CAL=
:Function_call_interrupts
> > > >      364.33 =C2=B1 11%    +299.3%       1454 =C2=B1 18%  interrupts=
.CPU27.RES:Rescheduling_interrupts
> > > >     1574486           -22.5%    1220253        interrupts.CPU28.CAL=
:Function_call_interrupts
> > > >      366.17 =C2=B1  4%    +272.5%       1363 =C2=B1 16%  interrupts=
.CPU28.RES:Rescheduling_interrupts
> > > >       73.67 =C2=B1 22%     +57.2%     115.83 =C2=B1 15%  interrupts=
.CPU28.TLB:TLB_shootdowns
> > > >     1576181           -22.5%    1220758        interrupts.CPU29.CAL=
:Function_call_interrupts
> > > >      338.00 =C2=B1 12%    +308.9%       1382 =C2=B1 14%  interrupts=
.CPU29.RES:Rescheduling_interrupts
> > > >       72.17 =C2=B1 18%     +71.4%     123.67 =C2=B1 21%  interrupts=
.CPU29.TLB:TLB_shootdowns
> > > >     1555885           -22.0%    1213686        interrupts.CPU3.CAL:=
Function_call_interrupts
> > > >      408.33 =C2=B1  9%    +252.6%       1439 =C2=B1  8%  interrupts=
.CPU3.RES:Rescheduling_interrupts
> > > >     1577545           -22.6%    1220782        interrupts.CPU30.CAL=
:Function_call_interrupts
> > > >      340.50 =C2=B1 10%    +306.1%       1382 =C2=B1 12%  interrupts=
.CPU30.RES:Rescheduling_interrupts
> > > >     1579433           -22.7%    1221357        interrupts.CPU31.CAL=
:Function_call_interrupts
> > > >      340.83 =C2=B1  7%    +295.1%       1346 =C2=B1 18%  interrupts=
.CPU31.RES:Rescheduling_interrupts
> > > >     1580661           -22.7%    1221936        interrupts.CPU32.CAL=
:Function_call_interrupts
> > > >      342.17 =C2=B1  8%    +281.4%       1305 =C2=B1 12%  interrupts=
.CPU32.RES:Rescheduling_interrupts
> > > >       60.33 =C2=B1 23%     +76.5%     106.50 =C2=B1 22%  interrupts=
.CPU32.TLB:TLB_shootdowns
> > > >     1581769           -22.7%    1222330        interrupts.CPU33.CAL=
:Function_call_interrupts
> > > >        2003 =C2=B1 32%    +105.4%       4115 =C2=B1  4%  interrupts=
.CPU33.NMI:Non-maskable_interrupts
> > > >        2003 =C2=B1 32%    +105.4%       4115 =C2=B1  4%  interrupts=
.CPU33.PMI:Performance_monitoring_interrupts
> > > >      342.00 =C2=B1 12%    +301.3%       1372 =C2=B1 12%  interrupts=
.CPU33.RES:Rescheduling_interrupts
> > > >     1582830           -22.8%    1222702        interrupts.CPU34.CAL=
:Function_call_interrupts
> > > >      357.00 =C2=B1  7%    +288.3%       1386 =C2=B1 14%  interrupts=
.CPU34.RES:Rescheduling_interrupts
> > > >     1586009           -22.9%    1223200        interrupts.CPU35.CAL=
:Function_call_interrupts
> > > >      318.67 =C2=B1 13%    +291.8%       1248 =C2=B1 10%  interrupts=
.CPU35.RES:Rescheduling_interrupts
> > > >     1589398           -23.0%    1223144        interrupts.CPU36.CAL=
:Function_call_interrupts
> > > >        2551 =C2=B1 10%     +61.6%       4122 =C2=B1  5%  interrupts=
.CPU36.NMI:Non-maskable_interrupts
> > > >        2551 =C2=B1 10%     +61.6%       4122 =C2=B1  5%  interrupts=
.CPU36.PMI:Performance_monitoring_interrupts
> > > >      327.17 =C2=B1  9%    +332.6%       1415 =C2=B1 16%  interrupts=
.CPU36.RES:Rescheduling_interrupts
> > > >       79.33 =C2=B1 24%     +62.6%     129.00 =C2=B1 19%  interrupts=
.CPU36.TLB:TLB_shootdowns
> > > >     1592078           -23.1%    1223994        interrupts.CPU37.CAL=
:Function_call_interrupts
> > > >        2525 =C2=B1  5%     +62.1%       4095 =C2=B1  5%  interrupts=
.CPU37.NMI:Non-maskable_interrupts
> > > >        2525 =C2=B1  5%     +62.1%       4095 =C2=B1  5%  interrupts=
.CPU37.PMI:Performance_monitoring_interrupts
> > > >      327.67 =C2=B1 15%    +300.2%       1311 =C2=B1 11%  interrupts=
.CPU37.RES:Rescheduling_interrupts
> > > >     1593159           -23.1%    1224772        interrupts.CPU38.CAL=
:Function_call_interrupts
> > > >        2449 =C2=B1  5%     +71.6%       4203 =C2=B1  3%  interrupts=
.CPU38.NMI:Non-maskable_interrupts
> > > >        2449 =C2=B1  5%     +71.6%       4203 =C2=B1  3%  interrupts=
.CPU38.PMI:Performance_monitoring_interrupts
> > > >      329.17 =C2=B1 11%    +284.5%       1265 =C2=B1  9%  interrupts=
.CPU38.RES:Rescheduling_interrupts
> > > >       77.33 =C2=B1 15%     +53.0%     118.33 =C2=B1 17%  interrupts=
.CPU38.TLB:TLB_shootdowns
> > > >     1597729           -23.3%    1225532        interrupts.CPU39.CAL=
:Function_call_interrupts
> > > >        2375 =C2=B1  7%     +75.5%       4169 =C2=B1  4%  interrupts=
.CPU39.NMI:Non-maskable_interrupts
> > > >        2375 =C2=B1  7%     +75.5%       4169 =C2=B1  4%  interrupts=
.CPU39.PMI:Performance_monitoring_interrupts
> > > >      321.33 =C2=B1 15%    +294.8%       1268 =C2=B1 10%  interrupts=
.CPU39.RES:Rescheduling_interrupts
> > > >       68.33 =C2=B1 35%     +68.3%     115.00 =C2=B1 26%  interrupts=
.CPU39.TLB:TLB_shootdowns
> > > >     1556572           -22.0%    1213891        interrupts.CPU4.CAL:=
Function_call_interrupts
> > > >      370.17 =C2=B1 12%    +288.8%       1439 =C2=B1 10%  interrupts=
.CPU4.RES:Rescheduling_interrupts
> > > >       76.17 =C2=B1 15%     +49.9%     114.17 =C2=B1 12%  interrupts=
.CPU4.TLB:TLB_shootdowns
> > > >     1599710           -23.4%    1226042        interrupts.CPU40.CAL=
:Function_call_interrupts
> > > >        2477 =C2=B1 12%     +67.3%       4144 =C2=B1  5%  interrupts=
.CPU40.NMI:Non-maskable_interrupts
> > > >        2477 =C2=B1 12%     +67.3%       4144 =C2=B1  5%  interrupts=
.CPU40.PMI:Performance_monitoring_interrupts
> > > >      324.83 =C2=B1 15%    +304.5%       1314 =C2=B1 11%  interrupts=
.CPU40.RES:Rescheduling_interrupts
> > > >     1602951           -23.5%    1226709        interrupts.CPU41.CAL=
:Function_call_interrupts
> > > >        2321 =C2=B1  8%     +79.0%       4155 =C2=B1  3%  interrupts=
.CPU41.NMI:Non-maskable_interrupts
> > > >        2321 =C2=B1  8%     +79.0%       4155 =C2=B1  3%  interrupts=
.CPU41.PMI:Performance_monitoring_interrupts
> > > >      320.67 =C2=B1  8%    +285.3%       1235 =C2=B1 15%  interrupts=
.CPU41.RES:Rescheduling_interrupts
> > > >       73.00 =C2=B1 18%     +55.9%     113.83 =C2=B1 19%  interrupts=
.CPU41.TLB:TLB_shootdowns
> > > >     1610138           -23.8%    1227114        interrupts.CPU42.CAL=
:Function_call_interrupts
> > > >        2314 =C2=B1  5%     +78.4%       4128 =C2=B1  5%  interrupts=
.CPU42.NMI:Non-maskable_interrupts
> > > >        2314 =C2=B1  5%     +78.4%       4128 =C2=B1  5%  interrupts=
.CPU42.PMI:Performance_monitoring_interrupts
> > > >      310.33 =C2=B1  8%    +312.2%       1279 =C2=B1 22%  interrupts=
.CPU42.RES:Rescheduling_interrupts
> > > >       66.17 =C2=B1 20%     +80.4%     119.33 =C2=B1 30%  interrupts=
.CPU42.TLB:TLB_shootdowns
> > > >     1611973           -23.8%    1227608        interrupts.CPU43.CAL=
:Function_call_interrupts
> > > >        2347 =C2=B1  9%     +75.8%       4125 =C2=B1  5%  interrupts=
.CPU43.NMI:Non-maskable_interrupts
> > > >        2347 =C2=B1  9%     +75.8%       4125 =C2=B1  5%  interrupts=
.CPU43.PMI:Performance_monitoring_interrupts
> > > >      303.50 =C2=B1  8%    +310.8%       1246 =C2=B1 13%  interrupts=
.CPU43.RES:Rescheduling_interrupts
> > > >       64.50 =C2=B1 16%    +117.1%     140.00 =C2=B1 24%  interrupts=
.CPU43.TLB:TLB_shootdowns
> > > >     1614258           -23.9%    1228447        interrupts.CPU44.CAL=
:Function_call_interrupts
> > > >        2414 =C2=B1  8%     +70.8%       4123 =C2=B1  5%  interrupts=
.CPU44.NMI:Non-maskable_interrupts
> > > >        2414 =C2=B1  8%     +70.8%       4123 =C2=B1  5%  interrupts=
.CPU44.PMI:Performance_monitoring_interrupts
> > > >      305.33 =C2=B1  7%    +316.4%       1271 =C2=B1 12%  interrupts=
.CPU44.RES:Rescheduling_interrupts
> > > >     1618727           -24.0%    1229501        interrupts.CPU45.CAL=
:Function_call_interrupts
> > > >        2425 =C2=B1  8%     +71.1%       4150 =C2=B1  6%  interrupts=
.CPU45.NMI:Non-maskable_interrupts
> > > >        2425 =C2=B1  8%     +71.1%       4150 =C2=B1  6%  interrupts=
.CPU45.PMI:Performance_monitoring_interrupts
> > > >      292.83 =C2=B1  7%    +320.0%       1229 =C2=B1 10%  interrupts=
.CPU45.RES:Rescheduling_interrupts
> > > >     1620732           -24.1%    1229767        interrupts.CPU46.CAL=
:Function_call_interrupts
> > > >        2152 =C2=B1 20%     +91.7%       4126 =C2=B1  5%  interrupts=
.CPU46.NMI:Non-maskable_interrupts
> > > >        2152 =C2=B1 20%     +91.7%       4126 =C2=B1  5%  interrupts=
.CPU46.PMI:Performance_monitoring_interrupts
> > > >      307.33 =C2=B1 14%    +313.6%       1271 =C2=B1 17%  interrupts=
.CPU46.RES:Rescheduling_interrupts
> > > >       63.17 =C2=B1 22%     +91.6%     121.00 =C2=B1 22%  interrupts=
.CPU46.TLB:TLB_shootdowns
> > > >     1625711           -24.3%    1230630        interrupts.CPU47.CAL=
:Function_call_interrupts
> > > >        1913 =C2=B1 29%    +116.8%       4147 =C2=B1  3%  interrupts=
.CPU47.NMI:Non-maskable_interrupts
> > > >        1913 =C2=B1 29%    +116.8%       4147 =C2=B1  3%  interrupts=
.CPU47.PMI:Performance_monitoring_interrupts
> > > >      310.33 =C2=B1  9%    +331.0%       1337 =C2=B1 17%  interrupts=
.CPU47.RES:Rescheduling_interrupts
> > > >       63.67 =C2=B1 20%    +103.9%     129.83 =C2=B1 28%  interrupts=
.CPU47.TLB:TLB_shootdowns
> > > >     1635071           -24.6%    1233173        interrupts.CPU48.CAL=
:Function_call_interrupts
> > > >        1749 =C2=B1 33%    +117.6%       3806 =C2=B1  2%  interrupts=
.CPU48.NMI:Non-maskable_interrupts
> > > >        1749 =C2=B1 33%    +117.6%       3806 =C2=B1  2%  interrupts=
.CPU48.PMI:Performance_monitoring_interrupts
> > > >      440.50 =C2=B1 13%    +285.3%       1697 =C2=B1 15%  interrupts=
.CPU48.RES:Rescheduling_interrupts
> > > >     1636847           -24.6%    1234586        interrupts.CPU49.CAL=
:Function_call_interrupts
> > > >        1907 =C2=B1 32%    +107.9%       3965 =C2=B1  3%  interrupts=
.CPU49.NMI:Non-maskable_interrupts
> > > >        1907 =C2=B1 32%    +107.9%       3965 =C2=B1  3%  interrupts=
.CPU49.PMI:Performance_monitoring_interrupts
> > > >      528.83 =C2=B1 14%    +261.5%       1911 =C2=B1  8%  interrupts=
.CPU49.RES:Rescheduling_interrupts
> > > >       63.67 =C2=B1  9%     +74.3%     111.00 =C2=B1 19%  interrupts=
.CPU49.TLB:TLB_shootdowns
> > > >     1557508           -22.0%    1214275        interrupts.CPU5.CAL:=
Function_call_interrupts
> > > >      360.00 =C2=B1 11%    +304.7%       1456 =C2=B1 13%  interrupts=
.CPU5.RES:Rescheduling_interrupts
> > > >     1638985           -24.6%    1235069        interrupts.CPU50.CAL=
:Function_call_interrupts
> > > >        1916 =C2=B1 28%    +103.7%       3903 =C2=B1  4%  interrupts=
.CPU50.NMI:Non-maskable_interrupts
> > > >        1916 =C2=B1 28%    +103.7%       3903 =C2=B1  4%  interrupts=
.CPU50.PMI:Performance_monitoring_interrupts
> > > >      543.83 =C2=B1  8%    +252.8%       1918 =C2=B1 14%  interrupts=
.CPU50.RES:Rescheduling_interrupts
> > > >       81.67 =C2=B1 11%     +34.9%     110.17 =C2=B1 13%  interrupts=
.CPU50.TLB:TLB_shootdowns
> > > >     1644500           -24.8%    1236087        interrupts.CPU51.CAL=
:Function_call_interrupts
> > > >        1849 =C2=B1 35%    +116.5%       4003 =C2=B1  2%  interrupts=
.CPU51.NMI:Non-maskable_interrupts
> > > >        1849 =C2=B1 35%    +116.5%       4003 =C2=B1  2%  interrupts=
.CPU51.PMI:Performance_monitoring_interrupts
> > > >      521.17 =C2=B1 12%    +261.6%       1884 =C2=B1  7%  interrupts=
.CPU51.RES:Rescheduling_interrupts
> > > >       73.17 =C2=B1 22%     +47.4%     107.83 =C2=B1 28%  interrupts=
.CPU51.TLB:TLB_shootdowns
> > > >     1645993           -24.8%    1237456        interrupts.CPU52.CAL=
:Function_call_interrupts
> > > >      529.00 =C2=B1  5%    +265.5%       1933 =C2=B1  8%  interrupts=
.CPU52.RES:Rescheduling_interrupts
> > > >       73.00 =C2=B1 16%     +50.0%     109.50 =C2=B1 16%  interrupts=
.CPU52.TLB:TLB_shootdowns
> > > >     1649801           -25.0%    1238136        interrupts.CPU53.CAL=
:Function_call_interrupts
> > > >      543.17 =C2=B1  7%    +249.9%       1900 =C2=B1 12%  interrupts=
.CPU53.RES:Rescheduling_interrupts
> > > >       73.50 =C2=B1 24%     +54.4%     113.50 =C2=B1 18%  interrupts=
.CPU53.TLB:TLB_shootdowns
> > > >     1654935           -25.1%    1239258        interrupts.CPU54.CAL=
:Function_call_interrupts
> > > >      560.50 =C2=B1  8%    +239.8%       1904 =C2=B1  9%  interrupts=
.CPU54.RES:Rescheduling_interrupts
> > > >       72.33 =C2=B1 13%     +53.7%     111.17 =C2=B1 15%  interrupts=
.CPU54.TLB:TLB_shootdowns
> > > >     1667829           -25.6%    1240627        interrupts.CPU55.CAL=
:Function_call_interrupts
> > > >      553.50 =C2=B1 13%    +251.8%       1947 =C2=B1  7%  interrupts=
.CPU55.RES:Rescheduling_interrupts
> > > >     1673782           -25.8%    1241296        interrupts.CPU56.CAL=
:Function_call_interrupts
> > > >        2134 =C2=B1 26%     +85.3%       3955 =C2=B1  3%  interrupts=
.CPU56.NMI:Non-maskable_interrupts
> > > >        2134 =C2=B1 26%     +85.3%       3955 =C2=B1  3%  interrupts=
.CPU56.PMI:Performance_monitoring_interrupts
> > > >      558.50 =C2=B1 11%    +232.8%       1858 =C2=B1 10%  interrupts=
.CPU56.RES:Rescheduling_interrupts
> > > >     1673858           -25.7%    1242929        interrupts.CPU57.CAL=
:Function_call_interrupts
> > > >        2169 =C2=B1 23%     +84.0%       3990 =C2=B1  4%  interrupts=
.CPU57.NMI:Non-maskable_interrupts
> > > >        2169 =C2=B1 23%     +84.0%       3990 =C2=B1  4%  interrupts=
.CPU57.PMI:Performance_monitoring_interrupts
> > > >      558.17 =C2=B1  2%    +259.2%       2004 =C2=B1 11%  interrupts=
.CPU57.RES:Rescheduling_interrupts
> > > >     1675001           -25.8%    1243500        interrupts.CPU58.CAL=
:Function_call_interrupts
> > > >        2143 =C2=B1 25%     +82.1%       3903 =C2=B1  3%  interrupts=
.CPU58.NMI:Non-maskable_interrupts
> > > >        2143 =C2=B1 25%     +82.1%       3903 =C2=B1  3%  interrupts=
.CPU58.PMI:Performance_monitoring_interrupts
> > > >      586.00 =C2=B1 13%    +241.5%       2001 =C2=B1  9%  interrupts=
.CPU58.RES:Rescheduling_interrupts
> > > >       76.67 =C2=B1  9%     +33.5%     102.33 =C2=B1 11%  interrupts=
.CPU58.TLB:TLB_shootdowns
> > > >     1677140           -25.8%    1245091        interrupts.CPU59.CAL=
:Function_call_interrupts
> > > >      603.83 =C2=B1 12%    +219.1%       1927 =C2=B1  8%  interrupts=
.CPU59.RES:Rescheduling_interrupts
> > > >     1558142           -22.1%    1214507        interrupts.CPU6.CAL:=
Function_call_interrupts
> > > >      345.83 =C2=B1  6%    +304.8%       1399 =C2=B1  8%  interrupts=
.CPU6.RES:Rescheduling_interrupts
> > > >       78.17 =C2=B1 18%     +47.8%     115.50 =C2=B1 15%  interrupts=
.CPU6.TLB:TLB_shootdowns
> > > >     1682308           -25.9%    1246000        interrupts.CPU60.CAL=
:Function_call_interrupts
> > > >        2358 =C2=B1  8%     +69.8%       4005 =C2=B1  4%  interrupts=
.CPU60.NMI:Non-maskable_interrupts
> > > >        2358 =C2=B1  8%     +69.8%       4005 =C2=B1  4%  interrupts=
.CPU60.PMI:Performance_monitoring_interrupts
> > > >      556.00 =C2=B1  4%    +254.7%       1972 =C2=B1 11%  interrupts=
.CPU60.RES:Rescheduling_interrupts
> > > >     1687753           -26.1%    1247152        interrupts.CPU61.CAL=
:Function_call_interrupts
> > > >      571.67 =C2=B1 12%    +238.6%       1935 =C2=B1 14%  interrupts=
.CPU61.RES:Rescheduling_interrupts
> > > >     1691195           -26.2%    1248322        interrupts.CPU62.CAL=
:Function_call_interrupts
> > > >      554.00 =C2=B1 11%    +256.3%       1973 =C2=B1  4%  interrupts=
.CPU62.RES:Rescheduling_interrupts
> > > >     1693421           -26.2%    1249765        interrupts.CPU63.CAL=
:Function_call_interrupts
> > > >      578.00 =C2=B1  8%    +252.9%       2040 =C2=B1 12%  interrupts=
.CPU63.RES:Rescheduling_interrupts
> > > >     1693802           -26.2%    1250259        interrupts.CPU64.CAL=
:Function_call_interrupts
> > > >      576.50 =C2=B1 13%    +237.9%       1947 =C2=B1  4%  interrupts=
.CPU64.RES:Rescheduling_interrupts
> > > >       70.83 =C2=B1 14%     +48.2%     105.00 =C2=B1 18%  interrupts=
.CPU64.TLB:TLB_shootdowns
> > > >     1696044           -26.2%    1252071        interrupts.CPU65.CAL=
:Function_call_interrupts
> > > >        2000 =C2=B1 20%     +80.8%       3616 =C2=B1 17%  interrupts=
.CPU65.NMI:Non-maskable_interrupts
> > > >        2000 =C2=B1 20%     +80.8%       3616 =C2=B1 17%  interrupts=
.CPU65.PMI:Performance_monitoring_interrupts
> > > >      592.67 =C2=B1 17%    +238.7%       2007 =C2=B1  6%  interrupts=
.CPU65.RES:Rescheduling_interrupts
> > > >     1698659           -26.3%    1252352        interrupts.CPU66.CAL=
:Function_call_interrupts
> > > >      544.00 =C2=B1 11%    +261.3%       1965 =C2=B1 10%  interrupts=
.CPU66.RES:Rescheduling_interrupts
> > > >     1703027           -26.3%    1254746        interrupts.CPU67.CAL=
:Function_call_interrupts
> > > >      558.33 =C2=B1 16%    +264.0%       2032 =C2=B1 12%  interrupts=
.CPU67.RES:Rescheduling_interrupts
> > > >     1705223           -26.3%    1256151        interrupts.CPU68.CAL=
:Function_call_interrupts
> > > >      546.50 =C2=B1 13%    +271.8%       2031 =C2=B1 12%  interrupts=
.CPU68.RES:Rescheduling_interrupts
> > > >     1706279           -26.3%    1257075        interrupts.CPU69.CAL=
:Function_call_interrupts
> > > >        2204 =C2=B1 26%     +84.2%       4061 =C2=B1  2%  interrupts=
.CPU69.NMI:Non-maskable_interrupts
> > > >        2204 =C2=B1 26%     +84.2%       4061 =C2=B1  2%  interrupts=
.CPU69.PMI:Performance_monitoring_interrupts
> > > >      594.17 =C2=B1  8%    +233.8%       1983 =C2=B1  9%  interrupts=
.CPU69.RES:Rescheduling_interrupts
> > > >     1558831           -22.1%    1214955        interrupts.CPU7.CAL:=
Function_call_interrupts
> > > >      375.17 =C2=B1 12%    +281.9%       1432 =C2=B1  7%  interrupts=
.CPU7.RES:Rescheduling_interrupts
> > > >       80.33 =C2=B1 17%     +32.0%     106.00 =C2=B1 17%  interrupts=
.CPU7.TLB:TLB_shootdowns
> > > >     1708194           -26.3%    1259777        interrupts.CPU70.CAL=
:Function_call_interrupts
> > > >        2167 =C2=B1 19%     +88.7%       4090 =C2=B1  2%  interrupts=
.CPU70.NMI:Non-maskable_interrupts
> > > >        2167 =C2=B1 19%     +88.7%       4090 =C2=B1  2%  interrupts=
.CPU70.PMI:Performance_monitoring_interrupts
> > > >      609.17 =C2=B1  3%    +235.2%       2042 =C2=B1  6%  interrupts=
.CPU70.RES:Rescheduling_interrupts
> > > >     1713148           -26.4%    1261613        interrupts.CPU71.CAL=
:Function_call_interrupts
> > > >        2097 =C2=B1 27%     +96.9%       4130 =C2=B1  3%  interrupts=
.CPU71.NMI:Non-maskable_interrupts
> > > >        2097 =C2=B1 27%     +96.9%       4130 =C2=B1  3%  interrupts=
.CPU71.PMI:Performance_monitoring_interrupts
> > > >      578.50 =C2=B1 15%    +254.4%       2050 =C2=B1 12%  interrupts=
.CPU71.RES:Rescheduling_interrupts
> > > >       70.17 =C2=B1 16%     +54.6%     108.50 =C2=B1 21%  interrupts=
.CPU71.TLB:TLB_shootdowns
> > > >     1718192           -26.6%    1260936        interrupts.CPU72.CAL=
:Function_call_interrupts
> > > >        1990 =C2=B1 26%    +111.9%       4217 =C2=B1  6%  interrupts=
.CPU72.NMI:Non-maskable_interrupts
> > > >        1990 =C2=B1 26%    +111.9%       4217 =C2=B1  6%  interrupts=
.CPU72.PMI:Performance_monitoring_interrupts
> > > >      519.33 =C2=B1  9%    +267.9%       1910 =C2=B1 21%  interrupts=
.CPU72.RES:Rescheduling_interrupts
> > > >     1722067           -26.7%    1262027        interrupts.CPU73.CAL=
:Function_call_interrupts
> > > >        2142 =C2=B1 23%     +92.1%       4116 =C2=B1  3%  interrupts=
.CPU73.NMI:Non-maskable_interrupts
> > > >        2142 =C2=B1 23%     +92.1%       4116 =C2=B1  3%  interrupts=
.CPU73.PMI:Performance_monitoring_interrupts
> > > >      531.17 =C2=B1 13%    +271.4%       1972 =C2=B1 12%  interrupts=
.CPU73.RES:Rescheduling_interrupts
> > > >     1724351           -26.6%    1264962        interrupts.CPU74.CAL=
:Function_call_interrupts
> > > >        2222 =C2=B1 23%     +93.6%       4301 =C2=B1  6%  interrupts=
.CPU74.NMI:Non-maskable_interrupts
> > > >        2222 =C2=B1 23%     +93.6%       4301 =C2=B1  6%  interrupts=
.CPU74.PMI:Performance_monitoring_interrupts
> > > >      547.17 =C2=B1 10%    +287.1%       2118 =C2=B1 16%  interrupts=
.CPU74.RES:Rescheduling_interrupts
> > > >       73.50 =C2=B1 22%     +56.7%     115.17 =C2=B1 18%  interrupts=
.CPU74.TLB:TLB_shootdowns
> > > >     1724876           -26.6%    1265941        interrupts.CPU75.CAL=
:Function_call_interrupts
> > > >        2246 =C2=B1 24%     +88.3%       4230 =C2=B1  6%  interrupts=
.CPU75.NMI:Non-maskable_interrupts
> > > >        2246 =C2=B1 24%     +88.3%       4230 =C2=B1  6%  interrupts=
.CPU75.PMI:Performance_monitoring_interrupts
> > > >      530.83 =C2=B1  9%    +276.8%       2000 =C2=B1 12%  interrupts=
.CPU75.RES:Rescheduling_interrupts
> > > >     1726311           -26.5%    1268269        interrupts.CPU76.CAL=
:Function_call_interrupts
> > > >        2045 =C2=B1 25%    +105.6%       4206 =C2=B1  5%  interrupts=
.CPU76.NMI:Non-maskable_interrupts
> > > >        2045 =C2=B1 25%    +105.6%       4206 =C2=B1  5%  interrupts=
.CPU76.PMI:Performance_monitoring_interrupts
> > > >      547.17 =C2=B1  9%    +288.8%       2127 =C2=B1 14%  interrupts=
.CPU76.RES:Rescheduling_interrupts
> > > >       77.17 =C2=B1 19%     +51.4%     116.83 =C2=B1 12%  interrupts=
.CPU76.TLB:TLB_shootdowns
> > > >     1728950           -26.5%    1270182        interrupts.CPU77.CAL=
:Function_call_interrupts
> > > >        2285 =C2=B1 17%     +91.5%       4377 =C2=B1  4%  interrupts=
.CPU77.NMI:Non-maskable_interrupts
> > > >        2285 =C2=B1 17%     +91.5%       4377 =C2=B1  4%  interrupts=
.CPU77.PMI:Performance_monitoring_interrupts
> > > >      564.67 =C2=B1  6%    +269.6%       2087 =C2=B1 11%  interrupts=
.CPU77.RES:Rescheduling_interrupts
> > > >       74.17 =C2=B1 21%     +65.4%     122.67 =C2=B1 23%  interrupts=
.CPU77.TLB:TLB_shootdowns
> > > >     1733767           -26.7%    1271681        interrupts.CPU78.CAL=
:Function_call_interrupts
> > > >        1760 =C2=B1 33%    +135.2%       4140 =C2=B1  4%  interrupts=
.CPU78.NMI:Non-maskable_interrupts
> > > >        1760 =C2=B1 33%    +135.2%       4140 =C2=B1  4%  interrupts=
.CPU78.PMI:Performance_monitoring_interrupts
> > > >      536.67 =C2=B1  7%    +272.3%       1998 =C2=B1 13%  interrupts=
.CPU78.RES:Rescheduling_interrupts
> > > >     1739078           -26.8%    1273254        interrupts.CPU79.CAL=
:Function_call_interrupts
> > > >        2014 =C2=B1 24%    +108.6%       4200 =C2=B1  3%  interrupts=
.CPU79.NMI:Non-maskable_interrupts
> > > >        2014 =C2=B1 24%    +108.6%       4200 =C2=B1  3%  interrupts=
.CPU79.PMI:Performance_monitoring_interrupts
> > > >      550.83 =C2=B1 11%    +256.2%       1961 =C2=B1 12%  interrupts=
.CPU79.RES:Rescheduling_interrupts
> > > >       80.17 =C2=B1 22%     +62.4%     130.17 =C2=B1 20%  interrupts=
.CPU79.TLB:TLB_shootdowns
> > > >     1560071           -22.1%    1214673        interrupts.CPU8.CAL:=
Function_call_interrupts
> > > >      376.67 =C2=B1  7%    +307.9%       1536 =C2=B1 16%  interrupts=
.CPU8.RES:Rescheduling_interrupts
> > > >     1739255           -26.6%    1276667        interrupts.CPU80.CAL=
:Function_call_interrupts
> > > >        1776 =C2=B1 38%    +134.2%       4160 =C2=B1  3%  interrupts=
.CPU80.NMI:Non-maskable_interrupts
> > > >        1776 =C2=B1 38%    +134.2%       4160 =C2=B1  3%  interrupts=
.CPU80.PMI:Performance_monitoring_interrupts
> > > >      593.00 =C2=B1  8%    +247.9%       2063 =C2=B1 12%  interrupts=
.CPU80.RES:Rescheduling_interrupts
> > > >       65.17 =C2=B1 20%     +72.6%     112.50 =C2=B1 24%  interrupts=
.CPU80.TLB:TLB_shootdowns
> > > >     1744994           -26.7%    1279747        interrupts.CPU81.CAL=
:Function_call_interrupts
> > > >        2179 =C2=B1 18%     +72.9%       3768 =C2=B1 17%  interrupts=
.CPU81.NMI:Non-maskable_interrupts
> > > >        2179 =C2=B1 18%     +72.9%       3768 =C2=B1 17%  interrupts=
.CPU81.PMI:Performance_monitoring_interrupts
> > > >      556.33 =C2=B1  6%    +283.2%       2131 =C2=B1 15%  interrupts=
.CPU81.RES:Rescheduling_interrupts
> > > >       84.00 =C2=B1 19%     +42.3%     119.50 =C2=B1 30%  interrupts=
.CPU81.TLB:TLB_shootdowns
> > > >     1746355           -26.5%    1283194        interrupts.CPU82.CAL=
:Function_call_interrupts
> > > >      580.67 =C2=B1 13%    +275.6%       2181 =C2=B1 11%  interrupts=
.CPU82.RES:Rescheduling_interrupts
> > > >       82.33 =C2=B1 23%     +50.2%     123.67 =C2=B1 11%  interrupts=
.CPU82.TLB:TLB_shootdowns
> > > >     1752956           -26.6%    1286255        interrupts.CPU83.CAL=
:Function_call_interrupts
> > > >      581.17 =C2=B1 11%    +267.1%       2133 =C2=B1 12%  interrupts=
.CPU83.RES:Rescheduling_interrupts
> > > >     1764860           -26.9%    1289469        interrupts.CPU84.CAL=
:Function_call_interrupts
> > > >      586.50 =C2=B1 12%    +244.7%       2021 =C2=B1 12%  interrupts=
.CPU84.RES:Rescheduling_interrupts
> > > >     1771742           -27.0%    1293323        interrupts.CPU85.CAL=
:Function_call_interrupts
> > > >      588.50 =C2=B1 11%    +256.0%       2095 =C2=B1 10%  interrupts=
.CPU85.RES:Rescheduling_interrupts
> > > >     1771025           -26.8%    1296747        interrupts.CPU86.CAL=
:Function_call_interrupts
> > > >        2281 =C2=B1 18%     +85.3%       4229 =C2=B1  3%  interrupts=
.CPU86.NMI:Non-maskable_interrupts
> > > >        2281 =C2=B1 18%     +85.3%       4229 =C2=B1  3%  interrupts=
.CPU86.PMI:Performance_monitoring_interrupts
> > > >      580.50 =C2=B1  6%    +270.5%       2150 =C2=B1 11%  interrupts=
.CPU86.RES:Rescheduling_interrupts
> > > >     1781041           -27.0%    1300147        interrupts.CPU87.CAL=
:Function_call_interrupts
> > > >      580.17 =C2=B1  8%    +261.4%       2096 =C2=B1  8%  interrupts=
.CPU87.RES:Rescheduling_interrupts
> > > >     1784978           -26.9%    1304062        interrupts.CPU88.CAL=
:Function_call_interrupts
> > > >        2354 =C2=B1 26%     +78.2%       4195 =C2=B1  5%  interrupts=
.CPU88.NMI:Non-maskable_interrupts
> > > >        2354 =C2=B1 26%     +78.2%       4195 =C2=B1  5%  interrupts=
.CPU88.PMI:Performance_monitoring_interrupts
> > > >      594.33 =C2=B1 11%    +265.4%       2171 =C2=B1 11%  interrupts=
.CPU88.RES:Rescheduling_interrupts
> > > >     1790968           -26.9%    1308585        interrupts.CPU89.CAL=
:Function_call_interrupts
> > > >      629.67 =C2=B1  8%    +241.2%       2148 =C2=B1  9%  interrupts=
.CPU89.RES:Rescheduling_interrupts
> > > >     1559678           -22.1%    1215175        interrupts.CPU9.CAL:=
Function_call_interrupts
> > > >      371.00 =C2=B1 17%    +297.6%       1475 =C2=B1 11%  interrupts=
.CPU9.RES:Rescheduling_interrupts
> > > >     1819853           -28.0%    1310330        interrupts.CPU90.CAL=
:Function_call_interrupts
> > > >      545.67 =C2=B1  6%    +283.6%       2093 =C2=B1 15%  interrupts=
.CPU90.RES:Rescheduling_interrupts
> > > >       67.17 =C2=B1 20%     +66.3%     111.67 =C2=B1 29%  interrupts=
.CPU90.TLB:TLB_shootdowns
> > > >     1817004           -27.7%    1313826        interrupts.CPU91.CAL=
:Function_call_interrupts
> > > >        1953 =C2=B1 25%    +114.4%       4189 =C2=B1  5%  interrupts=
.CPU91.NMI:Non-maskable_interrupts
> > > >        1953 =C2=B1 25%    +114.4%       4189 =C2=B1  5%  interrupts=
.CPU91.PMI:Performance_monitoring_interrupts
> > > >      580.67 =C2=B1 14%    +263.2%       2108 =C2=B1 13%  interrupts=
.CPU91.RES:Rescheduling_interrupts
> > > >       65.33 =C2=B1 17%    +109.4%     136.83 =C2=B1 22%  interrupts=
.CPU91.TLB:TLB_shootdowns
> > > >     1820669           -27.7%    1316902        interrupts.CPU92.CAL=
:Function_call_interrupts
> > > >        2018 =C2=B1 23%     +88.0%       3794 =C2=B1 18%  interrupts=
.CPU92.NMI:Non-maskable_interrupts
> > > >        2018 =C2=B1 23%     +88.0%       3794 =C2=B1 18%  interrupts=
.CPU92.PMI:Performance_monitoring_interrupts
> > > >      565.67 =C2=B1  8%    +269.1%       2087 =C2=B1 15%  interrupts=
.CPU92.RES:Rescheduling_interrupts
> > > >     1828689           -27.7%    1321787        interrupts.CPU93.CAL=
:Function_call_interrupts
> > > >        2272 =C2=B1 21%     +66.8%       3789 =C2=B1 16%  interrupts=
.CPU93.NMI:Non-maskable_interrupts
> > > >        2272 =C2=B1 21%     +66.8%       3789 =C2=B1 16%  interrupts=
.CPU93.PMI:Performance_monitoring_interrupts
> > > >      584.17 =C2=B1  5%    +269.9%       2160 =C2=B1  6%  interrupts=
.CPU93.RES:Rescheduling_interrupts
> > > >       70.33 =C2=B1 18%     +51.4%     106.50 =C2=B1 24%  interrupts=
.CPU93.TLB:TLB_shootdowns
> > > >     1825869           -27.5%    1323766        interrupts.CPU94.CAL=
:Function_call_interrupts
> > > >      594.50 =C2=B1  6%    +245.0%       2051 =C2=B1 10%  interrupts=
.CPU94.RES:Rescheduling_interrupts
> > > >     1835732           -27.0%    1340021        interrupts.CPU95.CAL=
:Function_call_interrupts
> > > >        2131 =C2=B1 18%     +81.2%       3862 =C2=B1 20%  interrupts=
.CPU95.NMI:Non-maskable_interrupts
> > > >        2131 =C2=B1 18%     +81.2%       3862 =C2=B1 20%  interrupts=
.CPU95.PMI:Performance_monitoring_interrupts
> > > >      530.83 =C2=B1  6%    +304.6%       2147 =C2=B1 13%  interrupts=
.CPU95.RES:Rescheduling_interrupts
> > > >       80.33 =C2=B1  7%     +79.3%     144.00 =C2=B1 23%  interrupts=
.CPU95.TLB:TLB_shootdowns
> > > >      205031 =C2=B1  6%     +77.8%     364501        interrupts.NMI:=
Non-maskable_interrupts
> > > >      205031 =C2=B1  6%     +77.8%     364501        interrupts.PMI:=
Performance_monitoring_interrupts
> > > >       43840 =C2=B1  2%    +272.5%     163324 =C2=B1  2%  interrupts=
.RES:Rescheduling_interrupts
> > > >        7385           +49.5%      11042 =C2=B1  3%  interrupts.TLB:=
TLB_shootdowns
> > > >       52.22           -29.6       22.66        perf-profile.calltra=
ce.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_start=
up_entry
> > > >       19.19 =C2=B1  3%      -8.4       10.84        perf-profile.ca=
lltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
> > > >       19.26 =C2=B1  3%      -8.4       10.91        perf-profile.ca=
lltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
> > > >        7.11 =C2=B1  5%      -3.5        3.64        perf-profile.ca=
lltrace.cycles-pp.do_group_exit.__x64_sys_exit_group.do_syscall_64.entry_SY=
SCALL_64_after_hwframe
> > > >        7.11 =C2=B1  5%      -3.5        3.64        perf-profile.ca=
lltrace.cycles-pp.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after=
_hwframe
> > > >        7.10 =C2=B1  5%      -3.5        3.64        perf-profile.ca=
lltrace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64.=
entry_SYSCALL_64_after_hwframe
> > > >        6.56 =C2=B1  5%      -3.2        3.34        perf-profile.ca=
lltrace.cycles-pp.mmput.do_exit.do_group_exit.__x64_sys_exit_group.do_sysca=
ll_64
> > > >        6.53 =C2=B1  5%      -3.2        3.32        perf-profile.ca=
lltrace.cycles-pp.exit_mmap.mmput.do_exit.do_group_exit.__x64_sys_exit_group
> > > >        5.78 =C2=B1  2%      -3.1        2.67        perf-profile.ca=
lltrace.cycles-pp.__sysvec_call_function.sysvec_call_function.asm_sysvec_ca=
ll_function.cpuidle_enter_state.cpuidle_enter
> > > >        5.59 =C2=B1  2%      -3.0        2.58        perf-profile.ca=
lltrace.cycles-pp.flush_smp_call_function_queue.__sysvec_call_function.sysv=
ec_call_function.asm_sysvec_call_function.cpuidle_enter_state
> > > >        6.29            -2.9        3.41 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me
> > > >        6.29            -2.9        3.41 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_6=
4_after_hwframe
> > > >        5.93            -2.7        3.21 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.copy_process.kernel_clone.__do_sys_clone.do_syscall_64.en=
try_SYSCALL_64_after_hwframe
> > > >        5.27            -2.5        2.73        perf-profile.calltra=
ce.cycles-pp.dup_mm.copy_process.kernel_clone.__do_sys_clone.do_syscall_64
> > > >        5.16            -2.5        2.67 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.dup_mmap.dup_mm.copy_process.kernel_clone.__do_sys_clone
> > > >        3.44 =C2=B1  2%      -2.3        1.19 =C2=B1  2%  perf-profi=
le.calltrace.cycles-pp.menu_select.do_idle.cpu_startup_entry.start_secondar=
y.secondary_startup_64_no_verify
> > > >        3.88 =C2=B1  5%      -1.8        2.04        perf-profile.ca=
lltrace.cycles-pp.exc_page_fault.asm_exc_page_fault
> > > >        3.85 =C2=B1  5%      -1.8        2.02        perf-profile.ca=
lltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
> > > >        3.95 =C2=B1  5%      -1.8        2.13 =C2=B1  6%  perf-profi=
le.calltrace.cycles-pp.asm_exc_page_fault
> > > >        3.35 =C2=B1  5%      -1.6        1.76        perf-profile.ca=
lltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc=
_page_fault
> > > >        3.23 =C2=B1  5%      -1.5        1.69        perf-profile.ca=
lltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_=
page_fault.asm_exc_page_fault
> > > >        2.35 =C2=B1  5%      -1.2        1.18 =C2=B1  4%  perf-profi=
le.calltrace.cycles-pp.free_pgtables.exit_mmap.mmput.do_exit.do_group_exit
> > > >        3.86 =C2=B1  4%      -1.1        2.73 =C2=B1  3%  perf-profi=
le.calltrace.cycles-pp.do_seccomp.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame
> > > >        3.85 =C2=B1  4%      -1.1        2.73 =C2=B1  3%  perf-profi=
le.calltrace.cycles-pp.seccomp_set_mode_filter.do_seccomp.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe
> > > >        2.25 =C2=B1  6%      -1.1        1.16 =C2=B1  3%  perf-profi=
le.calltrace.cycles-pp.do_fault.__handle_mm_fault.handle_mm_fault.do_user_a=
ddr_fault.exc_page_fault
> > > >        2.24 =C2=B1  6%      -1.1        1.18 =C2=B1  3%  perf-profi=
le.calltrace.cycles-pp.unmap_vmas.exit_mmap.mmput.do_exit.do_group_exit
> > > >        2.17 =C2=B1  5%      -1.1        1.12 =C2=B1  3%  perf-profi=
le.calltrace.cycles-pp.filemap_map_pages.do_fault.__handle_mm_fault.handle_=
mm_fault.do_user_addr_fault
> > > >        2.11 =C2=B1  7%      -1.0        1.10 =C2=B1  3%  perf-profi=
le.calltrace.cycles-pp.unmap_page_range.unmap_vmas.exit_mmap.mmput.do_exit
> > > >        1.99 =C2=B1  2%      -1.0        0.99 =C2=B1  4%  perf-profi=
le.calltrace.cycles-pp.anon_vma_fork.dup_mmap.dup_mm.copy_process.kernel_cl=
one
> > > >        1.96 =C2=B1  7%      -0.9        1.03 =C2=B1  4%  perf-profi=
le.calltrace.cycles-pp.zap_pte_range.unmap_page_range.unmap_vmas.exit_mmap.=
mmput
> > > >        1.86 =C2=B1  2%      -0.9        0.96        perf-profile.ca=
lltrace.cycles-pp.__flush_tlb_all.flush_smp_call_function_queue.__sysvec_ca=
ll_function.sysvec_call_function.asm_sysvec_call_function
> > > >        3.38 =C2=B1  4%      -0.9        2.50 =C2=B1  3%  perf-profi=
le.calltrace.cycles-pp.bpf_prog_create_from_user.seccomp_set_mode_filter.do=
_seccomp.do_syscall_64.entry_SYSCALL_64_after_hwframe
> > > >        1.83 =C2=B1  2%      -0.9        0.95        perf-profile.ca=
lltrace.cycles-pp.native_flush_tlb_global.__flush_tlb_all.flush_smp_call_fu=
nction_queue.__sysvec_call_function.sysvec_call_function
> > > >        1.11 =C2=B1  2%      -0.8        0.26 =C2=B1100%  perf-profi=
le.calltrace.cycles-pp.llist_reverse_order.flush_smp_call_function_queue.__=
sysvec_call_function.sysvec_call_function.asm_sysvec_call_function
> > > >        1.63 =C2=B1  5%      -0.8        0.82 =C2=B1  3%  perf-profi=
le.calltrace.cycles-pp.unlink_anon_vmas.free_pgtables.exit_mmap.mmput.do_ex=
it
> > > >        1.47 =C2=B1  2%      -0.7        0.74 =C2=B1  3%  perf-profi=
le.calltrace.cycles-pp.anon_vma_clone.anon_vma_fork.dup_mmap.dup_mm.copy_pr=
ocess
> > > >        1.51 =C2=B1  5%      -0.7        0.84 =C2=B1  6%  perf-profi=
le.calltrace.cycles-pp.copy_page_range.dup_mmap.dup_mm.copy_process.kernel_=
clone
> > > >        2.07            -0.7        1.41 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.ret_from_fork
> > > >        2.78 =C2=B1  4%      -0.6        2.15 =C2=B1  3%  perf-profi=
le.calltrace.cycles-pp.bpf_prepare_filter.bpf_prog_create_from_user.seccomp=
_set_mode_filter.do_seccomp.do_syscall_64
> > > >        1.31 =C2=B1  8%      -0.6        0.67 =C2=B1  3%  perf-profi=
le.calltrace.cycles-pp.tlb_finish_mmu.exit_mmap.mmput.do_exit.do_group_exit
> > > >        1.30 =C2=B1  8%      -0.6        0.67 =C2=B1  3%  perf-profi=
le.calltrace.cycles-pp.tlb_flush_mmu.tlb_finish_mmu.exit_mmap.mmput.do_exit
> > > >        2.74 =C2=B1  4%      -0.6        2.13 =C2=B1  3%  perf-profi=
le.calltrace.cycles-pp.bpf_prog_select_runtime.bpf_prepare_filter.bpf_prog_=
create_from_user.seccomp_set_mode_filter.do_seccomp
> > > >        2.73 =C2=B1  4%      -0.6        2.12 =C2=B1  3%  perf-profi=
le.calltrace.cycles-pp.bpf_int_jit_compile.bpf_prog_select_runtime.bpf_prep=
are_filter.bpf_prog_create_from_user.seccomp_set_mode_filter
> > > >        1.27 =C2=B1  6%      -0.6        0.67 =C2=B1  4%  perf-profi=
le.calltrace.cycles-pp.next_uptodate_page.filemap_map_pages.do_fault.__hand=
le_mm_fault.handle_mm_fault
> > > >        1.02 =C2=B1  9%      -0.6        0.44 =C2=B1 44%  perf-profi=
le.calltrace.cycles-pp.release_pages.tlb_flush_mmu.tlb_finish_mmu.exit_mmap=
.mmput
> > > >        1.88            -0.6        1.31 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.kthread.ret_from_fork
> > > >        1.85            -0.6        1.30        perf-profile.calltra=
ce.cycles-pp.worker_thread.kthread.ret_from_fork
> > > >        1.22 =C2=B1  7%      -0.5        0.68 =C2=B1  8%  perf-profi=
le.calltrace.cycles-pp.copy_pte_range.copy_page_range.dup_mmap.dup_mm.copy_=
process
> > > >        1.76            -0.5        1.25 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork
> > > >        1.52            -0.4        1.12 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.bpf_jit_free.process_one_work.worker_thread.kthread.ret_f=
rom_fork
> > > >        1.51            -0.4        1.11 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.__vunmap.bpf_jit_binary_free.bpf_jit_free.process_one_wor=
k.worker_thread
> > > >        1.51            -0.4        1.12 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.bpf_jit_binary_free.bpf_jit_free.process_one_work.worker_=
thread.kthread
> > > >        1.42            -0.3        1.07        perf-profile.calltra=
ce.cycles-pp._vm_unmap_aliases.__vunmap.bpf_jit_binary_free.bpf_jit_free.pr=
ocess_one_work
> > > >        0.68 =C2=B1  5%      -0.3        0.35 =C2=B1 70%  perf-profi=
le.calltrace.cycles-pp.smp_call_function_many_cond.on_each_cpu.cpa_flush.ch=
ange_page_attr_set_clr.set_memory_ro
> > > >        1.06 =C2=B1  3%      -0.3        0.78 =C2=B1  3%  perf-profi=
le.calltrace.cycles-pp.change_page_attr_set_clr.set_memory_x.bpf_int_jit_co=
mpile.bpf_prog_select_runtime.bpf_prepare_filter
> > > >        1.06 =C2=B1  3%      -0.3        0.78 =C2=B1  3%  perf-profi=
le.calltrace.cycles-pp.set_memory_x.bpf_int_jit_compile.bpf_prog_select_run=
time.bpf_prepare_filter.bpf_prog_create_from_user
> > > >        1.47 =C2=B1  4%      -0.2        1.23 =C2=B1  3%  perf-profi=
le.calltrace.cycles-pp.change_page_attr_set_clr.set_memory_ro.bpf_int_jit_c=
ompile.bpf_prog_select_runtime.bpf_prepare_filter
> > > >        1.47 =C2=B1  4%      -0.2        1.23 =C2=B1  3%  perf-profi=
le.calltrace.cycles-pp.set_memory_ro.bpf_int_jit_compile.bpf_prog_select_ru=
ntime.bpf_prepare_filter.bpf_prog_create_from_user
> > > >        0.69 =C2=B1  5%      -0.2        0.53 =C2=B1  4%  perf-profi=
le.calltrace.cycles-pp.cpa_flush.change_page_attr_set_clr.set_memory_ro.bpf=
_int_jit_compile.bpf_prog_select_runtime
> > > >        0.69 =C2=B1  5%      -0.2        0.53 =C2=B1  4%  perf-profi=
le.calltrace.cycles-pp.on_each_cpu.cpa_flush.change_page_attr_set_clr.set_m=
emory_ro.bpf_int_jit_compile
> > > >        0.67 =C2=B1 46%      +0.3        0.94        perf-profile.ca=
lltrace.cycles-pp.cpu_startup_entry.start_kernel.secondary_startup_64_no_ve=
rify
> > > >        0.67 =C2=B1 46%      +0.3        0.94        perf-profile.ca=
lltrace.cycles-pp.do_idle.cpu_startup_entry.start_kernel.secondary_startup_=
64_no_verify
> > > >        0.67 =C2=B1 46%      +0.3        0.94        perf-profile.ca=
lltrace.cycles-pp.start_kernel.secondary_startup_64_no_verify
> > > >        0.62 =C2=B1 46%      +0.3        0.92 =C2=B1  2%  perf-profi=
le.calltrace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_kernel=
.secondary_startup_64_no_verify
> > > >        0.60 =C2=B1 46%      +0.3        0.91 =C2=B1  2%  perf-profi=
le.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startu=
p_entry.start_kernel
> > > >        0.00            +0.7        0.66        perf-profile.calltra=
ce.cycles-pp.read_hpet.ktime_get.tick_sched_timer.__hrtimer_run_queues.hrti=
mer_interrupt
> > > >        0.00            +0.7        0.69        perf-profile.calltra=
ce.cycles-pp.ktime_get.tick_sched_timer.__hrtimer_run_queues.hrtimer_interr=
upt.__sysvec_apic_timer_interrupt
> > > >        0.00            +0.7        0.69        perf-profile.calltra=
ce.cycles-pp.read_hpet.ktime_get.sched_clock_tick.scheduler_tick.update_pro=
cess_times
> > > >        0.00            +0.8        0.76        perf-profile.calltra=
ce.cycles-pp.ktime_get.sched_clock_tick.scheduler_tick.update_process_times=
.tick_sched_handle
> > > >        0.00            +0.8        0.76        perf-profile.calltra=
ce.cycles-pp.sched_clock_tick.scheduler_tick.update_process_times.tick_sche=
d_handle.tick_sched_timer
> > > >        0.00            +0.9        0.85 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.scheduler_tick.update_process_times.tick_sched_handle.tic=
k_sched_timer.__hrtimer_run_queues
> > > >        0.00            +0.9        0.90 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer._=
_hrtimer_run_queues.hrtimer_interrupt
> > > >        0.00            +0.9        0.90        perf-profile.calltra=
ce.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtime=
r_interrupt.__sysvec_apic_timer_interrupt
> > > >        0.00            +1.1        1.06        perf-profile.calltra=
ce.cycles-pp.read_hpet.ktime_get.tick_nohz_irq_exit.sysvec_apic_timer_inter=
rupt.asm_sysvec_apic_timer_interrupt
> > > >        0.00            +1.1        1.08        perf-profile.calltra=
ce.cycles-pp.ktime_get.tick_nohz_irq_exit.sysvec_apic_timer_interrupt.asm_s=
ysvec_apic_timer_interrupt.cpuidle_enter_state
> > > >        0.00            +1.1        1.09        perf-profile.calltra=
ce.cycles-pp.tick_nohz_irq_exit.sysvec_apic_timer_interrupt.asm_sysvec_apic=
_timer_interrupt.cpuidle_enter_state.cpuidle_enter
> > > >        0.00            +1.2        1.17        perf-profile.calltra=
ce.cycles-pp.read_hpet.ktime_get.tick_irq_enter.irq_enter_rcu.sysvec_apic_t=
imer_interrupt
> > > >        0.00            +1.2        1.18        perf-profile.calltra=
ce.cycles-pp.ktime_get.tick_irq_enter.irq_enter_rcu.sysvec_apic_timer_inter=
rupt.asm_sysvec_apic_timer_interrupt
> > > >        0.00            +1.2        1.18        perf-profile.calltra=
ce.cycles-pp.read_hpet.ktime_get_update_offsets_now.hrtimer_interrupt.__sys=
vec_apic_timer_interrupt.sysvec_apic_timer_interrupt
> > > >        0.00            +1.2        1.20        perf-profile.calltra=
ce.cycles-pp.read_hpet.ktime_get.clockevents_program_event.hrtimer_interrup=
t.__sysvec_apic_timer_interrupt
> > > >        0.00            +1.2        1.20        perf-profile.calltra=
ce.cycles-pp.sched_clock_tick.sched_clock_idle_wakeup_event.tick_irq_enter.=
irq_enter_rcu.sysvec_apic_timer_interrupt
> > > >        0.00            +1.2        1.20        perf-profile.calltra=
ce.cycles-pp.ktime_get_update_offsets_now.hrtimer_interrupt.__sysvec_apic_t=
imer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
> > > >        0.00            +1.2        1.22 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.sched_clock_idle_wakeup_event.tick_irq_enter.irq_enter_rc=
u.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
> > > >        0.00            +1.3        1.29        perf-profile.calltra=
ce.cycles-pp.ktime_get.clockevents_program_event.hrtimer_interrupt.__sysvec=
_apic_timer_interrupt.sysvec_apic_timer_interrupt
> > > >        0.00            +1.3        1.33        perf-profile.calltra=
ce.cycles-pp.clockevents_program_event.hrtimer_interrupt.__sysvec_apic_time=
r_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
> > > >        0.56 =C2=B1  4%      +1.6        2.16        perf-profile.ca=
lltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_time=
r_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
> > > >        0.00            +1.6        1.61        perf-profile.calltra=
ce.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sysv=
ec_apic_timer_interrupt.sysvec_apic_timer_interrupt
> > > >        0.00            +2.4        2.41        perf-profile.calltra=
ce.cycles-pp.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_time=
r_interrupt.cpuidle_enter_state.cpuidle_enter
> > > >        0.00            +2.4        2.41        perf-profile.calltra=
ce.cycles-pp.tick_irq_enter.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_s=
ysvec_apic_timer_interrupt.cpuidle_enter_state
> > > >        1.06 =C2=B1 14%      +3.7        4.75        perf-profile.ca=
lltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt=
.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
> > > >        1.04 =C2=B1 14%      +3.7        4.74        perf-profile.ca=
lltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_ap=
ic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
> > > >        2.02 =C2=B1 11%      +6.7        8.68        perf-profile.ca=
lltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuid=
le_enter.do_idle.cpu_startup_entry
> > > >        1.87 =C2=B1 11%      +6.7        8.59        perf-profile.ca=
lltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interru=
pt.cpuidle_enter_state.cpuidle_enter.do_idle
> > > >        0.00            +9.5        9.51        perf-profile.calltra=
ce.cycles-pp.read_hpet.ktime_get.tick_nohz_irq_exit.sysvec_call_function.as=
m_sysvec_call_function
> > > >        0.00            +9.6        9.60        perf-profile.calltra=
ce.cycles-pp.ktime_get.tick_nohz_irq_exit.sysvec_call_function.asm_sysvec_c=
all_function.cpuidle_enter_state
> > > >        0.00            +9.6        9.62        perf-profile.calltra=
ce.cycles-pp.tick_nohz_irq_exit.sysvec_call_function.asm_sysvec_call_functi=
on.cpuidle_enter_state.cpuidle_enter
> > > >        0.00           +10.6       10.61        perf-profile.calltra=
ce.cycles-pp.read_hpet.ktime_get.sched_clock_tick.sched_clock_idle_wakeup_e=
vent.cpuidle_enter_state
> > > >        0.00           +10.8       10.85        perf-profile.calltra=
ce.cycles-pp.ktime_get.sched_clock_tick.sched_clock_idle_wakeup_event.cpuid=
le_enter_state.cpuidle_enter
> > > >        0.00           +10.9       10.93        perf-profile.calltra=
ce.cycles-pp.sched_clock_tick.sched_clock_idle_wakeup_event.cpuidle_enter_s=
tate.cpuidle_enter.do_idle
> > > >        0.00           +11.0       11.04        perf-profile.calltra=
ce.cycles-pp.sched_clock_tick.sched_clock_idle_wakeup_event.tick_irq_enter.=
irq_enter_rcu.sysvec_call_function
> > > >        0.00           +11.1       11.09        perf-profile.calltra=
ce.cycles-pp.sched_clock_idle_wakeup_event.cpuidle_enter_state.cpuidle_ente=
r.do_idle.cpu_startup_entry
> > > >       72.76           +11.1       83.89        perf-profile.calltra=
ce.cycles-pp.start_secondary.secondary_startup_64_no_verify
> > > >       72.76           +11.1       83.89        perf-profile.calltra=
ce.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_veri=
fy
> > > >       72.73           +11.2       83.88        perf-profile.calltra=
ce.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64=
_no_verify
> > > >        0.00           +11.2       11.22        perf-profile.calltra=
ce.cycles-pp.sched_clock_idle_wakeup_event.tick_irq_enter.irq_enter_rcu.sys=
vec_call_function.asm_sysvec_call_function
> > > >       73.49           +11.3       84.83        perf-profile.calltra=
ce.cycles-pp.secondary_startup_64_no_verify
> > > >        0.62 =C2=B1  4%     +11.9       12.51        perf-profile.ca=
lltrace.cycles-pp.ktime_get.tick_irq_enter.irq_enter_rcu.sysvec_call_functi=
on.asm_sysvec_call_function
> > > >        0.00           +12.0       12.05        perf-profile.calltra=
ce.cycles-pp.read_hpet.ktime_get.sched_clock_tick.sched_clock_idle_wakeup_e=
vent.tick_irq_enter
> > > >        0.00           +12.2       12.16        perf-profile.calltra=
ce.cycles-pp.ktime_get.sched_clock_tick.sched_clock_idle_wakeup_event.tick_=
irq_enter.irq_enter_rcu
> > > >        0.00           +12.4       12.36        perf-profile.calltra=
ce.cycles-pp.read_hpet.ktime_get.tick_irq_enter.irq_enter_rcu.sysvec_call_f=
unction
> > > >       68.20           +13.7       81.95        perf-profile.calltra=
ce.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.second=
ary_startup_64_no_verify
> > > >       66.98           +14.1       81.05        perf-profile.calltra=
ce.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.st=
art_secondary
> > > >        0.82 =C2=B1  3%     +23.0       23.86        perf-profile.ca=
lltrace.cycles-pp.irq_enter_rcu.sysvec_call_function.asm_sysvec_call_functi=
on.cpuidle_enter_state.cpuidle_enter
> > > >        0.79 =C2=B1  3%     +23.1       23.84        perf-profile.ca=
lltrace.cycles-pp.tick_irq_enter.irq_enter_rcu.sysvec_call_function.asm_sys=
vec_call_function.cpuidle_enter_state
> > > >       12.46           +25.8       38.27        perf-profile.calltra=
ce.cycles-pp.asm_sysvec_call_function.cpuidle_enter_state.cpuidle_enter.do_=
idle.cpu_startup_entry
> > > >        8.02           +28.5       36.53        perf-profile.calltra=
ce.cycles-pp.sysvec_call_function.asm_sysvec_call_function.cpuidle_enter_st=
ate.cpuidle_enter.do_idle
> > > >       52.41           -29.5       22.89        perf-profile.childre=
n.cycles-pp.intel_idle
> > > >       19.27 =C2=B1  3%      -8.4       10.89        perf-profile.ch=
ildren.cycles-pp.do_syscall_64
> > > >       19.33 =C2=B1  3%      -8.4       10.96        perf-profile.ch=
ildren.cycles-pp.entry_SYSCALL_64_after_hwframe
> > > >        7.14 =C2=B1  5%      -3.5        3.65        perf-profile.ch=
ildren.cycles-pp.do_group_exit
> > > >        7.14 =C2=B1  5%      -3.5        3.65        perf-profile.ch=
ildren.cycles-pp.do_exit
> > > >        7.11 =C2=B1  5%      -3.5        3.64        perf-profile.ch=
ildren.cycles-pp.__x64_sys_exit_group
> > > >        6.45 =C2=B1  2%      -3.5        3.00        perf-profile.ch=
ildren.cycles-pp.__sysvec_call_function
> > > >        6.24 =C2=B1  2%      -3.3        2.90        perf-profile.ch=
ildren.cycles-pp.flush_smp_call_function_queue
> > > >        6.59 =C2=B1  5%      -3.2        3.35        perf-profile.ch=
ildren.cycles-pp.mmput
> > > >        6.57 =C2=B1  5%      -3.2        3.34        perf-profile.ch=
ildren.cycles-pp.exit_mmap
> > > >        6.29            -2.9        3.42 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.__do_sys_clone
> > > >        6.29            -2.9        3.42 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.kernel_clone
> > > >        5.94            -2.7        3.21 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.copy_process
> > > >        5.28            -2.5        2.74 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.dup_mm
> > > >        5.17            -2.5        2.68 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.dup_mmap
> > > >        3.50 =C2=B1  2%      -2.3        1.21 =C2=B1  2%  perf-profi=
le.children.cycles-pp.menu_select
> > > >        4.19 =C2=B1  4%      -1.9        2.25 =C2=B1  5%  perf-profi=
le.children.cycles-pp.asm_exc_page_fault
> > > >        4.06 =C2=B1  4%      -1.9        2.13        perf-profile.ch=
ildren.cycles-pp.exc_page_fault
> > > >        4.04 =C2=B1  4%      -1.9        2.12        perf-profile.ch=
ildren.cycles-pp.do_user_addr_fault
> > > >        3.47 =C2=B1  4%      -1.7        1.82        perf-profile.ch=
ildren.cycles-pp.handle_mm_fault
> > > >        3.34 =C2=B1  4%      -1.6        1.74        perf-profile.ch=
ildren.cycles-pp.__handle_mm_fault
> > > >        2.40 =C2=B1  4%      -1.2        1.20 =C2=B1  4%  perf-profi=
le.children.cycles-pp.free_pgtables
> > > >        2.42 =C2=B1  6%      -1.2        1.27 =C2=B1  3%  perf-profi=
le.children.cycles-pp.unmap_vmas
> > > >        3.86 =C2=B1  4%      -1.1        2.73 =C2=B1  3%  perf-profi=
le.children.cycles-pp.seccomp_set_mode_filter
> > > >        3.86 =C2=B1  4%      -1.1        2.73 =C2=B1  3%  perf-profi=
le.children.cycles-pp.do_seccomp
> > > >        2.28 =C2=B1  5%      -1.1        1.16 =C2=B1  3%  perf-profi=
le.children.cycles-pp.do_fault
> > > >        2.28 =C2=B1  6%      -1.1        1.19 =C2=B1  3%  perf-profi=
le.children.cycles-pp.unmap_page_range
> > > >        2.21 =C2=B1  5%      -1.1        1.13 =C2=B1  3%  perf-profi=
le.children.cycles-pp.filemap_map_pages
> > > >        2.14 =C2=B1  7%      -1.0        1.12 =C2=B1  3%  perf-profi=
le.children.cycles-pp.zap_pte_range
> > > >        2.08 =C2=B1  2%      -1.0        1.07        perf-profile.ch=
ildren.cycles-pp.__flush_tlb_all
> > > >        1.99 =C2=B1  2%      -1.0        0.99 =C2=B1  4%  perf-profi=
le.children.cycles-pp.anon_vma_fork
> > > >        2.05 =C2=B1  2%      -1.0        1.06        perf-profile.ch=
ildren.cycles-pp.native_flush_tlb_global
> > > >        3.38 =C2=B1  4%      -0.9        2.50 =C2=B1  3%  perf-profi=
le.children.cycles-pp.bpf_prog_create_from_user
> > > >        1.65 =C2=B1  5%      -0.8        0.83 =C2=B1  2%  perf-profi=
le.children.cycles-pp.unlink_anon_vmas
> > > >        1.49            -0.8        0.69 =C2=B1  3%  perf-profile.ch=
ildren.cycles-pp.native_irq_return_iret
> > > >        1.47 =C2=B1  5%      -0.7        0.73 =C2=B1  2%  perf-profi=
le.children.cycles-pp.kmem_cache_free
> > > >        1.50 =C2=B1  2%      -0.7        0.76 =C2=B1  3%  perf-profi=
le.children.cycles-pp.anon_vma_clone
> > > >        1.52 =C2=B1  5%      -0.7        0.84 =C2=B1  6%  perf-profi=
le.children.cycles-pp.copy_page_range
> > > >        2.07            -0.7        1.41 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.ret_from_fork
> > > >        1.26            -0.7        0.60 =C2=B1  3%  perf-profile.ch=
ildren.cycles-pp.irq_exit_rcu
> > > >        1.36 =C2=B1  8%      -0.7        0.70 =C2=B1  4%  perf-profi=
le.children.cycles-pp.tlb_finish_mmu
> > > >        1.35 =C2=B1  8%      -0.7        0.69 =C2=B1  4%  perf-profi=
le.children.cycles-pp.tlb_flush_mmu
> > > >        1.23 =C2=B1  2%      -0.7        0.57        perf-profile.ch=
ildren.cycles-pp.llist_reverse_order
> > > >        2.79 =C2=B1  4%      -0.6        2.15 =C2=B1  3%  perf-profi=
le.children.cycles-pp.bpf_prepare_filter
> > > >        1.30 =C2=B1  6%      -0.6        0.68 =C2=B1  5%  perf-profi=
le.children.cycles-pp.next_uptodate_page
> > > >        2.74 =C2=B1  4%      -0.6        2.13 =C2=B1  3%  perf-profi=
le.children.cycles-pp.bpf_prog_select_runtime
> > > >        2.73 =C2=B1  4%      -0.6        2.12 =C2=B1  3%  perf-profi=
le.children.cycles-pp.bpf_int_jit_compile
> > > >        2.37 =C2=B1  2%      -0.6        1.80 =C2=B1  2%  perf-profi=
le.children.cycles-pp.on_each_cpu
> > > >        1.88            -0.6        1.31 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.kthread
> > > >        1.86            -0.6        1.30        perf-profile.childre=
n.cycles-pp.worker_thread
> > > >        2.61 =C2=B1  2%      -0.6        2.06 =C2=B1  2%  perf-profi=
le.children.cycles-pp._vm_unmap_aliases
> > > >        2.34 =C2=B1  2%      -0.5        1.79 =C2=B1  2%  perf-profi=
le.children.cycles-pp.smp_call_function_many_cond
> > > >        1.22 =C2=B1  7%      -0.5        0.69 =C2=B1  9%  perf-profi=
le.children.cycles-pp.copy_pte_range
> > > >        0.93 =C2=B1  2%      -0.5        0.39        perf-profile.ch=
ildren.cycles-pp.__cpa_flush_tlb
> > > >        1.11 =C2=B1  2%      -0.5        0.58        perf-profile.ch=
ildren.cycles-pp.kmem_cache_alloc
> > > >        1.08 =C2=B1  8%      -0.5        0.55 =C2=B1  4%  perf-profi=
le.children.cycles-pp.release_pages
> > > >        2.53 =C2=B1  3%      -0.5        2.00 =C2=B1  3%  perf-profi=
le.children.cycles-pp.change_page_attr_set_clr
> > > >        1.76            -0.5        1.25 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.process_one_work
> > > >        0.98 =C2=B1 11%      -0.5        0.47 =C2=B1  8%  perf-profi=
le.children.cycles-pp.native_flush_tlb_one_user
> > > >        1.03 =C2=B1  3%      -0.5        0.53 =C2=B1  2%  perf-profi=
le.children.cycles-pp.llist_add_batch
> > > >        0.95 =C2=B1 12%      -0.5        0.46 =C2=B1  8%  perf-profi=
le.children.cycles-pp.flush_tlb_one_kernel
> > > >        1.65            -0.5        1.18        perf-profile.childre=
n.cycles-pp.__vunmap
> > > >        0.51 =C2=B1  3%      -0.5        0.06        perf-profile.ch=
ildren.cycles-pp.irqtime_account_irq
> > > >        1.07 =C2=B1  3%      -0.4        0.63 =C2=B1  2%  perf-profi=
le.children.cycles-pp.__alloc_pages_nodemask
> > > >        0.73 =C2=B1 18%      -0.4        0.30 =C2=B1 14%  perf-profi=
le.children.cycles-pp.do_kernel_range_flush
> > > >        0.71 =C2=B1  4%      -0.4        0.28 =C2=B1  3%  perf-profi=
le.children.cycles-pp.tick_nohz_get_sleep_length
> > > >        1.52            -0.4        1.12 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.bpf_jit_free
> > > >        1.51            -0.4        1.12 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.bpf_jit_binary_free
> > > >        0.74 =C2=B1  6%      -0.4        0.39 =C2=B1  2%  perf-profi=
le.children.cycles-pp.page_remove_rmap
> > > >        0.73 =C2=B1  2%      -0.4        0.37 =C2=B1  4%  perf-profi=
le.children.cycles-pp.vm_area_dup
> > > >        0.62 =C2=B1  4%      -0.3        0.29 =C2=B1  3%  perf-profi=
le.children.cycles-pp.remove_vma
> > > >        0.68 =C2=B1  3%      -0.3        0.35 =C2=B1  5%  perf-profi=
le.children.cycles-pp.anon_vma_interval_tree_insert
> > > >        1.12 =C2=B1  2%      -0.3        0.81 =C2=B1  2%  perf-profi=
le.children.cycles-pp.__purge_vmap_area_lazy
> > > >        0.76 =C2=B1  4%      -0.3        0.45 =C2=B1  3%  perf-profi=
le.children.cycles-pp.get_page_from_freelist
> > > >        0.47 =C2=B1  8%      -0.3        0.17 =C2=B1  6%  perf-profi=
le.children.cycles-pp.tick_nohz_next_event
> > > >        1.30 =C2=B1  3%      -0.3        1.01 =C2=B1  3%  perf-profi=
le.children.cycles-pp.cpa_flush
> > > >        0.57 =C2=B1  6%      -0.3        0.28 =C2=B1 10%  perf-profi=
le.children.cycles-pp.unlink_file_vma
> > > >        0.59 =C2=B1  2%      -0.3        0.31 =C2=B1  2%  perf-profi=
le.children.cycles-pp.__do_sys_wait4
> > > >        1.06 =C2=B1  3%      -0.3        0.78 =C2=B1  3%  perf-profi=
le.children.cycles-pp.set_memory_x
> > > >        0.59 =C2=B1  2%      -0.3        0.31 =C2=B1  2%  perf-profi=
le.children.cycles-pp.kernel_wait4
> > > >        0.57 =C2=B1  2%      -0.3        0.29 =C2=B1  4%  perf-profi=
le.children.cycles-pp.do_wait
> > > >        0.60 =C2=B1  3%      -0.3        0.33 =C2=B1  3%  perf-profi=
le.children.cycles-pp.__schedule
> > > >        0.51 =C2=B1  3%      -0.3        0.24 =C2=B1  4%  perf-profi=
le.children.cycles-pp.down_write
> > > >        0.50 =C2=B1  5%      -0.3        0.24 =C2=B1  3%  perf-profi=
le.children.cycles-pp._raw_spin_lock
> > > >        0.65 =C2=B1  2%      -0.3        0.39 =C2=B1  3%  perf-profi=
le.children.cycles-pp.__softirqentry_text_start
> > > >        0.58 =C2=B1 12%      -0.2        0.34 =C2=B1  3%  perf-profi=
le.children.cycles-pp.bpf_prog_alloc
> > > >        1.47 =C2=B1  4%      -0.2        1.23 =C2=B1  3%  perf-profi=
le.children.cycles-pp.set_memory_ro
> > > >        0.47 =C2=B1  6%      -0.2        0.24 =C2=B1  3%  perf-profi=
le.children.cycles-pp.__x64_sys_munmap
> > > >        0.47 =C2=B1  7%      -0.2        0.24 =C2=B1  3%  perf-profi=
le.children.cycles-pp.__vm_munmap
> > > >        0.47 =C2=B1  6%      -0.2        0.24 =C2=B1  3%  perf-profi=
le.children.cycles-pp.__do_munmap
> > > >        0.43 =C2=B1  6%      -0.2        0.20 =C2=B1  6%  perf-profi=
le.children.cycles-pp.do_set_pte
> > > >        0.52 =C2=B1  2%      -0.2        0.30 =C2=B1  5%  perf-profi=
le.children.cycles-pp.pte_alloc_one
> > > >        0.42 =C2=B1  6%      -0.2        0.20 =C2=B1  7%  perf-profi=
le.children.cycles-pp.seccomp_attach_filter
> > > >        0.42 =C2=B1  6%      -0.2        0.20 =C2=B1  7%  perf-profi=
le.children.cycles-pp.seccomp_cache_prepare_bitmap
> > > >        0.35 =C2=B1  8%      -0.2        0.14 =C2=B1 10%  perf-profi=
le.children.cycles-pp.rwsem_down_write_slowpath
> > > >        0.49 =C2=B1  4%      -0.2        0.28 =C2=B1  5%  perf-profi=
le.children.cycles-pp.__pte_alloc
> > > >        0.53 =C2=B1  4%      -0.2        0.34 =C2=B1  4%  perf-profi=
le.children.cycles-pp.prep_new_page
> > > >        0.52 =C2=B1  5%      -0.2        0.32 =C2=B1  4%  perf-profi=
le.children.cycles-pp.clear_page_erms
> > > >        0.39 =C2=B1  3%      -0.2        0.19 =C2=B1  8%  perf-profi=
le.children.cycles-pp.up_write
> > > >        0.44 =C2=B1  7%      -0.2        0.24 =C2=B1  7%  perf-profi=
le.children.cycles-pp.do_anonymous_page
> > > >        0.38 =C2=B1  7%      -0.2        0.19 =C2=B1  5%  perf-profi=
le.children.cycles-pp.__slab_free
> > > >        0.37 =C2=B1 12%      -0.2        0.18 =C2=B1  5%  perf-profi=
le.children.cycles-pp.do_sys_open
> > > >        0.37 =C2=B1 12%      -0.2        0.18 =C2=B1  5%  perf-profi=
le.children.cycles-pp.do_sys_openat2
> > > >        0.36 =C2=B1  7%      -0.2        0.18 =C2=B1  5%  perf-profi=
le.children.cycles-pp.refill_obj_stock
> > > >        0.38 =C2=B1  3%      -0.2        0.19 =C2=B1  6%  perf-profi=
le.children.cycles-pp.anon_vma_interval_tree_remove
> > > >        0.40 =C2=B1  8%      -0.2        0.22 =C2=B1  6%  perf-profi=
le.children.cycles-pp.rcu_core
> > > >        0.36 =C2=B1  4%      -0.2        0.18 =C2=B1  5%  perf-profi=
le.children.cycles-pp.__memcg_kmem_charge
> > > >        0.33 =C2=B1  4%      -0.2        0.15 =C2=B1  5%  perf-profi=
le.children.cycles-pp.page_counter_try_charge
> > > >        0.66 =C2=B1  3%      -0.2        0.48        perf-profile.ch=
ildren.cycles-pp.sched_clock_cpu
> > > >        0.27 =C2=B1  7%      -0.2        0.09 =C2=B1  4%  perf-profi=
le.children.cycles-pp.default_send_IPI_mask_sequence_phys
> > > >        0.34 =C2=B1  3%      -0.2        0.16 =C2=B1  5%  perf-profi=
le.children.cycles-pp._raw_spin_lock_irqsave
> > > >        0.34 =C2=B1  5%      -0.2        0.17 =C2=B1  3%  perf-profi=
le.children.cycles-pp.cpumask_next
> > > >        0.40 =C2=B1  7%      -0.2        0.23 =C2=B1  3%  perf-profi=
le.children.cycles-pp.__vmalloc_node_range
> > > >        0.31 =C2=B1  6%      -0.2        0.14 =C2=B1  6%  perf-profi=
le.children.cycles-pp.page_add_file_rmap
> > > >        0.41 =C2=B1 12%      -0.2        0.24 =C2=B1  3%  perf-profi=
le.children.cycles-pp.pcpu_alloc
> > > >        0.38 =C2=B1  8%      -0.2        0.21 =C2=B1  3%  perf-profi=
le.children.cycles-pp.bpf_prog_alloc_no_stats
> > > >        0.31 =C2=B1  6%      -0.2        0.15 =C2=B1 10%  perf-profi=
le.children.cycles-pp.vma_interval_tree_remove
> > > >        0.36 =C2=B1 11%      -0.2        0.20 =C2=B1  7%  perf-profi=
le.children.cycles-pp.rcu_do_batch
> > > >        0.27 =C2=B1  4%      -0.2        0.12 =C2=B1  6%  perf-profi=
le.children.cycles-pp.rcu_idle_exit
> > > >        0.23 =C2=B1  7%      -0.2        0.08 =C2=B1  6%  perf-profi=
le.children.cycles-pp.__default_send_IPI_dest_field
> > > >        0.32 =C2=B1  4%      -0.2        0.17 =C2=B1  6%  perf-profi=
le.children.cycles-pp.schedule
> > > >        0.34 =C2=B1  5%      -0.1        0.19 =C2=B1  4%  perf-profi=
le.children.cycles-pp.pick_next_task_fair
> > > >        0.33 =C2=B1  4%      -0.1        0.18 =C2=B1  4%  perf-profi=
le.children.cycles-pp.wp_page_copy
> > > >        0.32 =C2=B1  3%      -0.1        0.17 =C2=B1  4%  perf-profi=
le.children.cycles-pp.wait_task_zombie
> > > >        0.30 =C2=B1  4%      -0.1        0.16 =C2=B1  4%  perf-profi=
le.children.cycles-pp.release_task
> > > >        0.28 =C2=B1  7%      -0.1        0.14 =C2=B1  4%  perf-profi=
le.children.cycles-pp.find_vma
> > > >        0.30 =C2=B1  3%      -0.1        0.16 =C2=B1  4%  perf-profi=
le.children.cycles-pp.do_filp_open
> > > >        0.30 =C2=B1  3%      -0.1        0.16 =C2=B1  4%  perf-profi=
le.children.cycles-pp.path_openat
> > > >        0.19 =C2=B1  4%      -0.1        0.05 =C2=B1  7%  perf-profi=
le.children.cycles-pp.__cpa_addr
> > > >        0.33 =C2=B1  4%      -0.1        0.18 =C2=B1  4%  perf-profi=
le.children.cycles-pp.load_balance
> > > >        0.35 =C2=B1  3%      -0.1        0.21 =C2=B1  3%  perf-profi=
le.children.cycles-pp.wake_up_new_task
> > > >        0.28 =C2=B1 11%      -0.1        0.14 =C2=B1  6%  perf-profi=
le.children.cycles-pp.unmap_region
> > > >        0.33 =C2=B1  5%      -0.1        0.19 =C2=B1  2%  perf-profi=
le.children.cycles-pp.dup_task_struct
> > > >        0.28 =C2=B1  6%      -0.1        0.15 =C2=B1  4%  perf-profi=
le.children.cycles-pp.__memcg_kmem_charge_page
> > > >        0.27 =C2=B1  6%      -0.1        0.14 =C2=B1  4%  perf-profi=
le.children.cycles-pp.free_pages_and_swap_cache
> > > >        0.27 =C2=B1  5%      -0.1        0.14 =C2=B1  4%  perf-profi=
le.children.cycles-pp.__mod_memcg_lruvec_state
> > > >        0.28 =C2=B1  3%      -0.1        0.16 =C2=B1  7%  perf-profi=
le.children.cycles-pp.newidle_balance
> > > >        0.21 =C2=B1  7%      -0.1        0.09 =C2=B1 12%  perf-profi=
le.children.cycles-pp.rwsem_spin_on_owner
> > > >        0.23 =C2=B1  5%      -0.1        0.11 =C2=B1  5%  perf-profi=
le.children.cycles-pp.sync_regs
> > > >        0.29 =C2=B1  3%      -0.1        0.16 =C2=B1  4%  perf-profi=
le.children.cycles-pp.find_busiest_group
> > > >        0.28 =C2=B1  3%      -0.1        0.16 =C2=B1  4%  perf-profi=
le.children.cycles-pp.update_sd_lb_stats
> > > >        0.30 =C2=B1  4%      -0.1        0.18 =C2=B1  4%  perf-profi=
le.children.cycles-pp.select_task_rq_fair
> > > >        0.23 =C2=B1 10%      -0.1        0.11 =C2=B1  4%  perf-profi=
le.children.cycles-pp.__put_anon_vma
> > > >        0.58 =C2=B1  2%      -0.1        0.46        perf-profile.ch=
ildren.cycles-pp.sched_clock
> > > >        0.23 =C2=B1  4%      -0.1        0.12 =C2=B1  4%  perf-profi=
le.children.cycles-pp.__list_del_entry_valid
> > > >        0.23 =C2=B1  4%      -0.1        0.12 =C2=B1  7%  perf-profi=
le.children.cycles-pp.get_obj_cgroup_from_current
> > > >        0.19 =C2=B1  5%      -0.1        0.08 =C2=B1  8%  perf-profi=
le.children.cycles-pp.rcu_eqs_exit
> > > >        0.25 =C2=B1 10%      -0.1        0.14 =C2=B1  4%  perf-profi=
le.children.cycles-pp.__get_vm_area_node
> > > >        0.23 =C2=B1  4%      -0.1        0.12 =C2=B1  6%  perf-profi=
le.children.cycles-pp.idle_cpu
> > > >        0.21 =C2=B1  7%      -0.1        0.10 =C2=B1  5%  perf-profi=
le.children.cycles-pp.drain_obj_stock
> > > >        0.54 =C2=B1  2%      -0.1        0.44        perf-profile.ch=
ildren.cycles-pp.native_sched_clock
> > > >        0.21 =C2=B1  4%      -0.1        0.11 =C2=B1  6%  perf-profi=
le.children.cycles-pp._find_next_bit
> > > >        0.26 =C2=B1  5%      -0.1        0.15 =C2=B1  3%  perf-profi=
le.children.cycles-pp.find_idlest_group
> > > >        0.23 =C2=B1 12%      -0.1        0.12 =C2=B1  6%  perf-profi=
le.children.cycles-pp.alloc_vmap_area
> > > >        0.24 =C2=B1 15%      -0.1        0.14 =C2=B1 12%  perf-profi=
le.children.cycles-pp.exit_to_user_mode_prepare
> > > >        0.21 =C2=B1  3%      -0.1        0.10 =C2=B1  4%  perf-profi=
le.children.cycles-pp.dup_userfaultfd
> > > >        0.20 =C2=B1  8%      -0.1        0.10 =C2=B1  5%  perf-profi=
le.children.cycles-pp.unlock_page
> > > >        0.18 =C2=B1 15%      -0.1        0.08 =C2=B1  6%  perf-profi=
le.children.cycles-pp.native_queued_spin_lock_slowpath
> > > >        0.19 =C2=B1 11%      -0.1        0.10 =C2=B1 13%  perf-profi=
le.children.cycles-pp.cpuidle_governor_latency_req
> > > >        0.21 =C2=B1  6%      -0.1        0.12 =C2=B1  8%  perf-profi=
le.children.cycles-pp.alloc_pages_vma
> > > >        0.19 =C2=B1  6%      -0.1        0.09 =C2=B1  5%  perf-profi=
le.children.cycles-pp.___might_sleep
> > > >        0.38 =C2=B1  5%      -0.1        0.29 =C2=B1  5%  perf-profi=
le.children.cycles-pp.flush_tlb_kernel_range
> > > >        0.20 =C2=B1  4%      -0.1        0.10 =C2=B1  7%  perf-profi=
le.children.cycles-pp.obj_cgroup_charge
> > > >        0.20 =C2=B1  4%      -0.1        0.11 =C2=B1  6%  perf-profi=
le.children.cycles-pp.__x64_sys_mprotect
> > > >        0.20 =C2=B1  4%      -0.1        0.11 =C2=B1  6%  perf-profi=
le.children.cycles-pp.do_mprotect_pkey
> > > >        1.13 =C2=B1  3%      -0.1        1.04 =C2=B1  4%  perf-profi=
le.children.cycles-pp.__mutex_lock
> > > >        0.19 =C2=B1  5%      -0.1        0.10 =C2=B1  4%  perf-profi=
le.children.cycles-pp.rmqueue
> > > >        0.17 =C2=B1  8%      -0.1        0.08 =C2=B1  5%  perf-profi=
le.children.cycles-pp.page_counter_uncharge
> > > >        0.13 =C2=B1  8%      -0.1        0.04 =C2=B1 71%  perf-profi=
le.children.cycles-pp.tick_check_broadcast_expired
> > > >        0.15 =C2=B1  4%      -0.1        0.06 =C2=B1  6%  perf-profi=
le.children.cycles-pp.call_cpuidle
> > > >        0.17 =C2=B1  9%      -0.1        0.08 =C2=B1  5%  perf-profi=
le.children.cycles-pp.page_counter_cancel
> > > >        0.13 =C2=B1 10%      -0.1        0.04 =C2=B1 73%  perf-profi=
le.children.cycles-pp.__rb_erase_color
> > > >        0.65 =C2=B1  4%      -0.1        0.57 =C2=B1  4%  perf-profi=
le.children.cycles-pp.mutex_spin_on_owner
> > > >        0.18 =C2=B1  2%      -0.1        0.09 =C2=B1  6%  perf-profi=
le.children.cycles-pp.link_path_walk
> > > >        0.18 =C2=B1  2%      -0.1        0.09 =C2=B1  5%  perf-profi=
le.children.cycles-pp.schedule_tail
> > > >        0.16 =C2=B1  6%      -0.1        0.08 =C2=B1  8%  perf-profi=
le.children.cycles-pp.get_next_timer_interrupt
> > > >        0.18 =C2=B1  4%      -0.1        0.10 =C2=B1  6%  perf-profi=
le.children.cycles-pp.schedule_idle
> > > >        0.24 =C2=B1 11%      -0.1        0.16 =C2=B1  7%  perf-profi=
le.children.cycles-pp.memset_erms
> > > >        0.17 =C2=B1  2%      -0.1        0.09 =C2=B1  5%  perf-profi=
le.children.cycles-pp.mprotect_fixup
> > > >        0.17 =C2=B1  8%      -0.1        0.09 =C2=B1  7%  perf-profi=
le.children.cycles-pp.finish_task_switch
> > > >        0.16 =C2=B1  3%      -0.1        0.08 =C2=B1  4%  perf-profi=
le.children.cycles-pp.walk_component
> > > >        0.15 =C2=B1  4%      -0.1        0.07 =C2=B1  9%  perf-profi=
le.children.cycles-pp.native_apic_mem_write
> > > >        0.17 =C2=B1  7%      -0.1        0.10 =C2=B1  6%  perf-profi=
le.children.cycles-pp.lock_page_memcg
> > > >        0.17 =C2=B1 18%      -0.1        0.10 =C2=B1 15%  perf-profi=
le.children.cycles-pp.arch_do_signal_or_restart
> > > >        0.16 =C2=B1 10%      -0.1        0.09 =C2=B1 12%  perf-profi=
le.children.cycles-pp.__get_free_pages
> > > >        0.15 =C2=B1  9%      -0.1        0.07 =C2=B1  6%  perf-profi=
le.children.cycles-pp.__pagevec_lru_add
> > > >        0.14 =C2=B1 11%      -0.1        0.07 =C2=B1  5%  perf-profi=
le.children.cycles-pp.hrtimer_next_event_without
> > > >        0.17 =C2=B1 11%      -0.1        0.09 =C2=B1 10%  perf-profi=
le.children.cycles-pp.mem_cgroup_charge
> > > >        0.12 =C2=B1  8%      -0.1        0.05 =C2=B1  7%  perf-profi=
le.children.cycles-pp.rcu_eqs_enter
> > > >        0.14 =C2=B1  8%      -0.1        0.07 =C2=B1  5%  perf-profi=
le.children.cycles-pp.free_unref_page_list
> > > >        0.13 =C2=B1  8%      -0.1        0.06 =C2=B1  6%  perf-profi=
le.children.cycles-pp.__memcg_kmem_uncharge
> > > >        0.14 =C2=B1  7%      -0.1        0.07        perf-profile.ch=
ildren.cycles-pp.__cond_resched
> > > >        0.11 =C2=B1  4%      -0.1        0.05        perf-profile.ch=
ildren.cycles-pp.update_rq_clock
> > > >        0.15 =C2=B1  7%      -0.1        0.09 =C2=B1  5%  perf-profi=
le.children.cycles-pp.__slab_alloc
> > > >        0.13 =C2=B1  8%      -0.1        0.07 =C2=B1 11%  perf-profi=
le.children.cycles-pp.purge_fragmented_blocks_allcpus
> > > >        0.14 =C2=B1  6%      -0.1        0.08 =C2=B1  7%  perf-profi=
le.children.cycles-pp.___slab_alloc
> > > >        0.09 =C2=B1  5%      -0.1        0.03 =C2=B1 99%  perf-profi=
le.children.cycles-pp.__might_sleep
> > > >        0.09 =C2=B1 15%      -0.1        0.03 =C2=B1100%  perf-profi=
le.children.cycles-pp.__pud_alloc
> > > >        0.12 =C2=B1  8%      -0.1        0.06 =C2=B1  7%  perf-profi=
le.children.cycles-pp.__rb_insert_augmented
> > > >        0.11 =C2=B1  9%      -0.1        0.06 =C2=B1  9%  perf-profi=
le.children.cycles-pp.lock_page_lruvec_irqsave
> > > >        0.13 =C2=B1 14%      -0.1        0.07 =C2=B1  6%  perf-profi=
le.children.cycles-pp.__vmalloc_node
> > > >        0.11 =C2=B1  9%      -0.1        0.05 =C2=B1  7%  perf-profi=
le.children.cycles-pp.free_pcppages_bulk
> > > >        0.08 =C2=B1  5%      -0.1        0.03 =C2=B1 99%  perf-profi=
le.children.cycles-pp.perf_iterate_sb
> > > >        0.13 =C2=B1  8%      -0.1        0.07 =C2=B1  9%  perf-profi=
le.children.cycles-pp.proc_invalidate_siblings_dcache
> > > >        0.11 =C2=B1  6%      -0.1        0.06 =C2=B1  6%  perf-profi=
le.children.cycles-pp.unmap_single_vma
> > > >        0.13 =C2=B1  5%      -0.1        0.07 =C2=B1  9%  perf-profi=
le.children.cycles-pp.bpf_jit_binary_alloc
> > > >        0.10 =C2=B1  7%      -0.1        0.04 =C2=B1 44%  perf-profi=
le.children.cycles-pp.fput_many
> > > >        0.10 =C2=B1  4%      -0.1        0.04 =C2=B1 44%  perf-profi=
le.children.cycles-pp.flush_tlb_mm_range
> > > >        0.12 =C2=B1  5%      -0.1        0.06 =C2=B1  7%  perf-profi=
le.children.cycles-pp.rebalance_domains
> > > >        0.11 =C2=B1  3%      -0.1        0.06 =C2=B1  8%  perf-profi=
le.children.cycles-pp.__split_vma
> > > >        0.09 =C2=B1  6%      -0.1        0.04 =C2=B1 71%  perf-profi=
le.children.cycles-pp.mm_init
> > > >        0.11 =C2=B1  9%      -0.1        0.06 =C2=B1  8%  perf-profi=
le.children.cycles-pp.kfree
> > > >        0.09 =C2=B1 10%      -0.1        0.04 =C2=B1 71%  perf-profi=
le.children.cycles-pp.do_task_dead
> > > >        0.10 =C2=B1  7%      -0.0        0.06 =C2=B1  9%  perf-profi=
le.children.cycles-pp.vma_interval_tree_insert_after
> > > >        0.09 =C2=B1  7%      -0.0        0.04 =C2=B1 44%  perf-profi=
le.children.cycles-pp.lru_cache_add
> > > >        0.11 =C2=B1  6%      -0.0        0.06 =C2=B1  7%  perf-profi=
le.children.cycles-pp.__pmd_alloc
> > > >        0.11 =C2=B1  6%      -0.0        0.06 =C2=B1  6%  perf-profi=
le.children.cycles-pp.__mod_memcg_state
> > > >        0.11 =C2=B1  6%      -0.0        0.06 =C2=B1  9%  perf-profi=
le.children.cycles-pp.__put_user_nocheck_4
> > > >        0.12 =C2=B1  9%      -0.0        0.07 =C2=B1  8%  perf-profi=
le.children.cycles-pp.__setup_rt_frame
> > > >        0.11 =C2=B1  6%      -0.0        0.07 =C2=B1 11%  perf-profi=
le.children.cycles-pp.copy_fpstate_to_sigframe
> > > >        0.11 =C2=B1  8%      -0.0        0.06 =C2=B1  7%  perf-profi=
le.children.cycles-pp.acct_collect
> > > >        0.11 =C2=B1  6%      -0.0        0.06 =C2=B1  7%  perf-profi=
le.children.cycles-pp.nr_iowait_cpu
> > > >        0.11 =C2=B1  4%      -0.0        0.06        perf-profile.ch=
ildren.cycles-pp.__perf_sw_event
> > > >        0.10 =C2=B1  7%      -0.0        0.06 =C2=B1  6%  perf-profi=
le.children.cycles-pp.try_to_wake_up
> > > >        0.08 =C2=B1 19%      -0.0        0.03 =C2=B1 70%  perf-profi=
le.children.cycles-pp.put_cred_rcu
> > > >        0.09 =C2=B1  4%      -0.0        0.04 =C2=B1 44%  perf-profi=
le.children.cycles-pp.rcu_read_unlock_strict
> > > >        0.09 =C2=B1  5%      -0.0        0.04 =C2=B1 44%  perf-profi=
le.children.cycles-pp.sched_move_task
> > > >        0.07 =C2=B1  8%      -0.0        0.03 =C2=B1 99%  perf-profi=
le.children.cycles-pp.run_rebalance_domains
> > > >        0.09 =C2=B1  5%      -0.0        0.04 =C2=B1 44%  perf-profi=
le.children.cycles-pp.d_invalidate
> > > >        0.10 =C2=B1  6%      -0.0        0.05 =C2=B1  9%  perf-profi=
le.children.cycles-pp.module_alloc
> > > >        0.08 =C2=B1  6%      -0.0        0.03 =C2=B1 70%  perf-profi=
le.children.cycles-pp.do_notify_parent
> > > >        0.09 =C2=B1  5%      -0.0        0.04 =C2=B1 45%  perf-profi=
le.children.cycles-pp.update_load_avg
> > > >        0.07 =C2=B1 10%      -0.0        0.03 =C2=B1 70%  perf-profi=
le.children.cycles-pp.__hrtimer_next_event_base
> > > >        0.09 =C2=B1  7%      -0.0        0.06 =C2=B1  9%  perf-profi=
le.children.cycles-pp.allocate_slab
> > > >        0.11 =C2=B1  4%      -0.0        0.07 =C2=B1  8%  perf-profi=
le.children.cycles-pp.copy_page
> > > >        0.06 =C2=B1  6%      -0.0        0.03 =C2=B1 99%  perf-profi=
le.children.cycles-pp.__x86_indirect_thunk_rax
> > > >        0.11 =C2=B1  4%      -0.0        0.08 =C2=B1 10%  perf-profi=
le.children.cycles-pp.update_ts_time_stats
> > > >        0.10 =C2=B1  6%      -0.0        0.07 =C2=B1 10%  perf-profi=
le.children.cycles-pp.try_charge
> > > >        0.00            +0.1        0.05 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.do_setitimer
> > > >        0.00            +0.1        0.06 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.__x64_sys_setitimer
> > > >        0.00            +0.1        0.10 =C2=B1  3%  perf-profile.ch=
ildren.cycles-pp.tick_nohz_idle_enter
> > > >        0.00            +0.1        0.14 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.tick_nohz_idle_exit
> > > >        0.73 =C2=B1 23%      +0.2        0.94        perf-profile.ch=
ildren.cycles-pp.start_kernel
> > > >        0.08 =C2=B1  7%      +0.5        0.60 =C2=B1  3%  perf-profi=
le.children.cycles-pp.perf_mux_hrtimer_handler
> > > >        0.46 =C2=B1  3%      +0.6        1.09 =C2=B1  2%  perf-profi=
le.children.cycles-pp.tick_sched_handle
> > > >        0.45 =C2=B1  4%      +0.6        1.09        perf-profile.ch=
ildren.cycles-pp.update_process_times
> > > >        0.29 =C2=B1  3%      +0.7        1.02        perf-profile.ch=
ildren.cycles-pp.scheduler_tick
> > > >        0.00            +0.8        0.77        perf-profile.childre=
n.cycles-pp.sched_clock_local
> > > >        0.41 =C2=B1 34%      +1.2        1.57        perf-profile.ch=
ildren.cycles-pp.clockevents_program_event
> > > >        0.09 =C2=B1 10%      +1.3        1.41        perf-profile.ch=
ildren.cycles-pp.ktime_get_update_offsets_now
> > > >        0.55 =C2=B1  2%      +1.4        1.92        perf-profile.ch=
ildren.cycles-pp.tick_sched_timer
> > > >        0.70 =C2=B1  3%      +1.9        2.58        perf-profile.ch=
ildren.cycles-pp.__hrtimer_run_queues
> > > >        1.30 =C2=B1 13%      +4.3        5.63        perf-profile.ch=
ildren.cycles-pp.__sysvec_apic_timer_interrupt
> > > >        1.28 =C2=B1 13%      +4.3        5.62        perf-profile.ch=
ildren.cycles-pp.hrtimer_interrupt
> > > >        2.46 =C2=B1 10%      +7.4        9.91        perf-profile.ch=
ildren.cycles-pp.asm_sysvec_apic_timer_interrupt
> > > >        2.27 =C2=B1  9%      +7.5        9.80        perf-profile.ch=
ildren.cycles-pp.sysvec_apic_timer_interrupt
> > > >        0.58 =C2=B1  7%     +10.4       10.96        perf-profile.ch=
ildren.cycles-pp.tick_nohz_irq_exit
> > > >       72.76           +11.1       83.89        perf-profile.childre=
n.cycles-pp.start_secondary
> > > >       73.49           +11.3       84.83        perf-profile.childre=
n.cycles-pp.secondary_startup_64_no_verify
> > > >       73.49           +11.3       84.83        perf-profile.childre=
n.cycles-pp.cpu_startup_entry
> > > >       73.49           +11.3       84.83        perf-profile.childre=
n.cycles-pp.do_idle
> > > >       68.89           +14.0       82.87        perf-profile.childre=
n.cycles-pp.cpuidle_enter
> > > >       68.86           +14.0       82.85        perf-profile.childre=
n.cycles-pp.cpuidle_enter_state
> > > >        0.00           +24.0       23.97        perf-profile.childre=
n.cycles-pp.sched_clock_idle_wakeup_event
> > > >        0.00           +24.5       24.49        perf-profile.childre=
n.cycles-pp.sched_clock_tick
> > > >        0.97 =C2=B1  2%     +25.8       26.75        perf-profile.ch=
ildren.cycles-pp.irq_enter_rcu
> > > >        0.95 =C2=B1  2%     +25.8       26.74        perf-profile.ch=
ildren.cycles-pp.tick_irq_enter
> > > >       11.42           +27.0       38.45        perf-profile.childre=
n.cycles-pp.asm_sysvec_call_function
> > > >        8.87 =C2=B1  2%     +28.5       37.41        perf-profile.ch=
ildren.cycles-pp.sysvec_call_function
> > > >        1.72 =C2=B1  8%     +50.6       52.31        perf-profile.ch=
ildren.cycles-pp.ktime_get
> > > >        0.00           +53.0       53.01        perf-profile.childre=
n.cycles-pp.read_hpet
> > > >       52.41           -29.5       22.89        perf-profile.self.cy=
cles-pp.intel_idle
> > > >        3.81 =C2=B1  2%      -2.5        1.35        perf-profile.se=
lf.cycles-pp.cpuidle_enter_state
> > > >        2.53 =C2=B1  2%      -1.7        0.80 =C2=B1  2%  perf-profi=
le.self.cycles-pp.menu_select
> > > >        2.05 =C2=B1  2%      -1.0        1.05        perf-profile.se=
lf.cycles-pp.native_flush_tlb_global
> > > >        1.49            -0.8        0.69 =C2=B1  2%  perf-profile.se=
lf.cycles-pp.native_irq_return_iret
> > > >        1.27 =C2=B1  2%      -0.7        0.56 =C2=B1  2%  perf-profi=
le.self.cycles-pp.flush_smp_call_function_queue
> > > >        1.22 =C2=B1  2%      -0.7        0.57        perf-profile.se=
lf.cycles-pp.llist_reverse_order
> > > >        1.37 =C2=B1 10%      -0.6        0.72 =C2=B1  3%  perf-profi=
le.self.cycles-pp.ktime_get
> > > >        1.26 =C2=B1  6%      -0.6        0.64 =C2=B1  4%  perf-profi=
le.self.cycles-pp.next_uptodate_page
> > > >        1.09 =C2=B1  8%      -0.5        0.57 =C2=B1  4%  perf-profi=
le.self.cycles-pp.zap_pte_range
> > > >        1.00 =C2=B1  3%      -0.5        0.50 =C2=B1  2%  perf-profi=
le.self.cycles-pp.llist_add_batch
> > > >        0.97 =C2=B1 11%      -0.5        0.47 =C2=B1  8%  perf-profi=
le.self.cycles-pp.native_flush_tlb_one_user
> > > >        0.71 =C2=B1  9%      -0.4        0.36 =C2=B1  5%  perf-profi=
le.self.cycles-pp.release_pages
> > > >        0.43 =C2=B1 22%      -0.3        0.09 =C2=B1  5%  perf-profi=
le.self.cycles-pp.poll_idle
> > > >        0.63 =C2=B1  6%      -0.3        0.30 =C2=B1  3%  perf-profi=
le.self.cycles-pp.kmem_cache_free
> > > >        0.65 =C2=B1  3%      -0.3        0.33 =C2=B1  5%  perf-profi=
le.self.cycles-pp.anon_vma_interval_tree_insert
> > > >        0.64 =C2=B1  6%      -0.3        0.35 =C2=B1 10%  perf-profi=
le.self.cycles-pp.copy_pte_range
> > > >        0.56 =C2=B1  7%      -0.3        0.28 =C2=B1  2%  perf-profi=
le.self.cycles-pp.page_remove_rmap
> > > >        0.36 =C2=B1  3%      -0.2        0.13 =C2=B1  5%  perf-profi=
le.self.cycles-pp.__cpa_flush_tlb
> > > >        0.44 =C2=B1  3%      -0.2        0.21 =C2=B1  2%  perf-profi=
le.self.cycles-pp.kmem_cache_alloc
> > > >        0.42 =C2=B1  6%      -0.2        0.20 =C2=B1  7%  perf-profi=
le.self.cycles-pp.seccomp_cache_prepare_bitmap
> > > >        0.41 =C2=B1  4%      -0.2        0.20 =C2=B1  2%  perf-profi=
le.self.cycles-pp.down_write
> > > >        0.43 =C2=B1  4%      -0.2        0.21 =C2=B1  4%  perf-profi=
le.self.cycles-pp._raw_spin_lock
> > > >        0.37 =C2=B1  3%      -0.2        0.18 =C2=B1  7%  perf-profi=
le.self.cycles-pp.up_write
> > > >        0.49 =C2=B1  6%      -0.2        0.30 =C2=B1  4%  perf-profi=
le.self.cycles-pp.clear_page_erms
> > > >        0.36 =C2=B1  7%      -0.2        0.18 =C2=B1  5%  perf-profi=
le.self.cycles-pp.__slab_free
> > > >        0.36 =C2=B1  2%      -0.2        0.18 =C2=B1  4%  perf-profi=
le.self.cycles-pp.anon_vma_interval_tree_remove
> > > >        0.33 =C2=B1  2%      -0.2        0.16 =C2=B1  6%  perf-profi=
le.self.cycles-pp.do_idle
> > > >        0.29 =C2=B1  5%      -0.2        0.13 =C2=B1  5%  perf-profi=
le.self.cycles-pp.page_counter_try_charge
> > > >        0.30 =C2=B1  3%      -0.2        0.15 =C2=B1  6%  perf-profi=
le.self.cycles-pp.anon_vma_clone
> > > >        0.23 =C2=B1  7%      -0.2        0.08 =C2=B1  6%  perf-profi=
le.self.cycles-pp.__default_send_IPI_dest_field
> > > >        0.30 =C2=B1  6%      -0.2        0.15 =C2=B1 11%  perf-profi=
le.self.cycles-pp.vma_interval_tree_remove
> > > >        0.19 =C2=B1  4%      -0.1        0.05        perf-profile.se=
lf.cycles-pp.__cpa_addr
> > > >        0.29 =C2=B1  4%      -0.1        0.15 =C2=B1  6%  perf-profi=
le.self.cycles-pp.vm_area_dup
> > > >        0.26 =C2=B1  7%      -0.1        0.11 =C2=B1 10%  perf-profi=
le.self.cycles-pp.page_add_file_rmap
> > > >        0.19 =C2=B1  8%      -0.1        0.06 =C2=B1  6%  perf-profi=
le.self.cycles-pp.irqtime_account_irq
> > > >        0.22 =C2=B1  6%      -0.1        0.09 =C2=B1  7%  perf-profi=
le.self.cycles-pp.sysvec_call_function
> > > >        0.26 =C2=B1  5%      -0.1        0.13 =C2=B1  3%  perf-profi=
le.self.cycles-pp.free_pages_and_swap_cache
> > > >        0.20 =C2=B1  7%      -0.1        0.08 =C2=B1 14%  perf-profi=
le.self.cycles-pp.rwsem_spin_on_owner
> > > >        0.23 =C2=B1  4%      -0.1        0.11 =C2=B1  5%  perf-profi=
le.self.cycles-pp.sync_regs
> > > >        0.23 =C2=B1  3%      -0.1        0.11 =C2=B1  6%  perf-profi=
le.self.cycles-pp._raw_spin_lock_irqsave
> > > >        0.16 =C2=B1  8%      -0.1        0.05 =C2=B1 45%  perf-profi=
le.self.cycles-pp.do_kernel_range_flush
> > > >        0.23 =C2=B1  8%      -0.1        0.12 =C2=B1  3%  perf-profi=
le.self.cycles-pp.dup_mmap
> > > >        0.21 =C2=B1  6%      -0.1        0.10 =C2=B1  4%  perf-profi=
le.self.cycles-pp.filemap_map_pages
> > > >        0.23 =C2=B1  5%      -0.1        0.12 =C2=B1  3%  perf-profi=
le.self.cycles-pp.__list_del_entry_valid
> > > >        0.23 =C2=B1  4%      -0.1        0.12 =C2=B1  6%  perf-profi=
le.self.cycles-pp.idle_cpu
> > > >        0.20 =C2=B1  4%      -0.1        0.10 =C2=B1  3%  perf-profi=
le.self.cycles-pp.asm_sysvec_call_function
> > > >        0.52 =C2=B1  3%      -0.1        0.42        perf-profile.se=
lf.cycles-pp.native_sched_clock
> > > >        0.18 =C2=B1 13%      -0.1        0.07 =C2=B1  6%  perf-profi=
le.self.cycles-pp.native_queued_spin_lock_slowpath
> > > >        0.19 =C2=B1  3%      -0.1        0.09 =C2=B1  5%  perf-profi=
le.self.cycles-pp._find_next_bit
> > > >        0.19 =C2=B1  6%      -0.1        0.09 =C2=B1  5%  perf-profi=
le.self.cycles-pp.find_vma
> > > >        0.20 =C2=B1  6%      -0.1        0.10 =C2=B1  4%  perf-profi=
le.self.cycles-pp.get_obj_cgroup_from_current
> > > >        0.19 =C2=B1  3%      -0.1        0.10 =C2=B1  3%  perf-profi=
le.self.cycles-pp.dup_userfaultfd
> > > >        0.21 =C2=B1  4%      -0.1        0.12 =C2=B1  5%  perf-profi=
le.self.cycles-pp.update_sd_lb_stats
> > > >        0.20 =C2=B1  5%      -0.1        0.11 =C2=B1  4%  perf-profi=
le.self.cycles-pp.__handle_mm_fault
> > > >        0.19 =C2=B1  9%      -0.1        0.09 =C2=B1  5%  perf-profi=
le.self.cycles-pp.unlock_page
> > > >        0.18 =C2=B1  5%      -0.1        0.09 =C2=B1  5%  perf-profi=
le.self.cycles-pp.___might_sleep
> > > >        0.12 =C2=B1  7%      -0.1        0.04 =C2=B1 71%  perf-profi=
le.self.cycles-pp.tick_check_broadcast_expired
> > > >        0.62 =C2=B1  4%      -0.1        0.54 =C2=B1  4%  perf-profi=
le.self.cycles-pp.mutex_spin_on_owner
> > > >        0.15 =C2=B1  3%      -0.1        0.06 =C2=B1  6%  perf-profi=
le.self.cycles-pp.call_cpuidle
> > > >        0.22 =C2=B1  7%      -0.1        0.14 =C2=B1  4%  perf-profi=
le.self.cycles-pp.find_idlest_group
> > > >        0.16 =C2=B1 10%      -0.1        0.08 =C2=B1  8%  perf-profi=
le.self.cycles-pp.__mod_memcg_lruvec_state
> > > >        0.15 =C2=B1  9%      -0.1        0.07 =C2=B1  8%  perf-profi=
le.self.cycles-pp.page_counter_cancel
> > > >        0.22 =C2=B1 11%      -0.1        0.15 =C2=B1  7%  perf-profi=
le.self.cycles-pp.memset_erms
> > > >        0.15 =C2=B1 10%      -0.1        0.07 =C2=B1 10%  perf-profi=
le.self.cycles-pp.unlink_anon_vmas
> > > >        0.17 =C2=B1  7%      -0.1        0.09 =C2=B1  5%  perf-profi=
le.self.cycles-pp.lock_page_memcg
> > > >        0.14 =C2=B1  9%      -0.1        0.07 =C2=B1  7%  perf-profi=
le.self.cycles-pp.refill_obj_stock
> > > >        0.10 =C2=B1  8%      -0.1        0.03 =C2=B1 99%  perf-profi=
le.self.cycles-pp.__purge_vmap_area_lazy
> > > >        0.14 =C2=B1  6%      -0.1        0.07 =C2=B1  9%  perf-profi=
le.self.cycles-pp.native_apic_mem_write
> > > >        0.13 =C2=B1 14%      -0.1        0.06        perf-profile.se=
lf.cycles-pp.cpumask_next
> > > >        0.09 =C2=B1  5%      -0.1        0.03 =C2=B1 99%  perf-profi=
le.self.cycles-pp.unmap_page_range
> > > >        0.10 =C2=B1  8%      -0.1        0.03 =C2=B1 70%  perf-profi=
le.self.cycles-pp.rcu_eqs_exit
> > > >        0.09 =C2=B1  7%      -0.1        0.03 =C2=B1 99%  perf-profi=
le.self.cycles-pp.kfree
> > > >        0.09 =C2=B1 11%      -0.1        0.03 =C2=B1 70%  perf-profi=
le.self.cycles-pp.irq_exit_rcu
> > > >        0.12 =C2=B1  8%      -0.1        0.06 =C2=B1 13%  perf-profi=
le.self.cycles-pp.__rb_insert_augmented
> > > >        0.11 =C2=B1  6%      -0.1        0.05 =C2=B1  9%  perf-profi=
le.self.cycles-pp.unmap_single_vma
> > > >        0.11 =C2=B1  5%      -0.1        0.06 =C2=B1  6%  perf-profi=
le.self.cycles-pp.nr_iowait_cpu
> > > >        0.12 =C2=B1  6%      -0.1        0.07 =C2=B1  5%  perf-profi=
le.self.cycles-pp.alloc_vmap_area
> > > >        0.11 =C2=B1  4%      -0.0        0.06 =C2=B1  6%  perf-profi=
le.self.cycles-pp.acct_collect
> > > >        0.10 =C2=B1  7%      -0.0        0.06 =C2=B1  8%  perf-profi=
le.self.cycles-pp.__mod_memcg_state
> > > >        0.10 =C2=B1  9%      -0.0        0.05        perf-profile.se=
lf.cycles-pp.vma_interval_tree_insert_after
> > > >        0.09 =C2=B1  8%      -0.0        0.04 =C2=B1 44%  perf-profi=
le.self.cycles-pp.purge_fragmented_blocks_allcpus
> > > >        0.10 =C2=B1  4%      -0.0        0.06 =C2=B1  7%  perf-profi=
le.self.cycles-pp.copy_page
> > > >        0.10 =C2=B1  4%      -0.0        0.06 =C2=B1  7%  perf-profi=
le.self.cycles-pp._vm_unmap_aliases
> > > >        0.07 =C2=B1 12%      -0.0        0.05 =C2=B1  7%  perf-profi=
le.self.cycles-pp.sched_clock_cpu
> > > >        0.93 =C2=B1  2%      +0.1        1.07 =C2=B1  3%  perf-profi=
le.self.cycles-pp.smp_call_function_many_cond
> > > >        0.00            +0.5        0.45 =C2=B1  2%  perf-profile.se=
lf.cycles-pp.sched_clock_local
> > > >        0.00           +53.0       52.99        perf-profile.self.cy=
cles-pp.read_hpet
> > > > =

> > > > =

> > > >                               stress-ng.time.user_time
> > > >    215 +-----------------------------------------------------------=
----------+
> > > >        |                  +                                        =
+       .+|
> > > >    210 |+. +. +.+++. +.+ + ++.   +    +.  .++      +.+  +++.+    .+=
 +.++. + :|
> > > >    205 |-++  +      +   +     + + +.++  ++   +  +. :  :+     +. +  =
      +   |
> > > >        |                       +              ++  +   +        +   =
          |
> > > >    200 |-+                                                         =
          |
> > > >    195 |-+                                                         =
          |
> > > >        |                                                           =
          |
> > > >    190 |-+                                                         =
          |
> > > >    185 |-+    O                                                    =
          |
> > > >        |   O                   O    O                              =
          |
> > > >    180 |-+O     OO     OO  OO        O                             =
          |
> > > >    175 |O+   O      O     O   O       O                            =
          |
> > > >        |          O  O           OO                                =
          |
> > > >    170 +-----------------------------------------------------------=
----------+
> > > >                              stress-ng.time.system_time
> > > >    335 +-----------------------------------------------------------=
----------+
> > > >    330 |-+        O  O           OO                                =
          |
> > > >        |O    O      O  OO OOO O       O                            =
          |
> > > >    325 |-+OO    OO             O    OO                             =
          |
> > > >    320 |-+    O                                                    =
          |
> > > >    315 |-+                                                         =
          |
> > > >    310 |-+                                                         =
          |
> > > >        |                                                           =
          |
> > > >    305 |-+                                                         =
          |
> > > >    300 |-+                                                         =
          |
> > > >    295 |-+                     +              +  .+           .+   =
          |
> > > >    290 |-.+ .+   + .+   +.   .+ + +.++ .++.  + ++  :  +.+    +  +. =
     .+   |
> > > >        |+  +  +.+ +  +.+  +++    +    +    ++      +.+   ++.+     +=
++.++  +.+|
> > > >    285 |-+                                                         =
          |
> > > >    280 +-----------------------------------------------------------=
----------+
> > > >                      stress-ng.time.percent_of_cpu_this_job_got
> > > >    820 +-----------------------------------------------------------=
----------+
> > > >        |                                                           =
          |
> > > >        |                       O                                   =
          |
> > > >    815 |-+                        O                                =
          |
> > > >        |  O          O OO OOO O  O  OOO                            =
          |
> > > >        |O  O O    O O                                              =
          |
> > > >    810 |-+    O OO                                                 =
          |
> > > >        |                                                           =
          |
> > > >    805 |-+                                                         =
          |
> > > >        |                                                           =
          |
> > > >        |      +. + .+                           +.           +.+ .+=
          |
> > > >    800 |+.++.+  + +  +. +.+++.++  +.+++.++.++.++  ++.++.+++.+   +  =
++.++.++.+|
> > > >        |               +        : :                                =
          |
> > > >        |                        ::                                 =
          |
> > > >    795 +-----------------------------------------------------------=
----------+
> > > >                             stress-ng.time.minor_page_faults
> > > >      4e+07 +-------------------------------------------------------=
----------+
> > > >            |+         + +.+ + ++.     ::  ::  +     + :          + =
.+ :+ ++. |
> > > >    3.9e+07 |:+  +. + + +   +     +++.+ +.+ +.+ :.+++  +  ++  ++.+ +=
  +  +   +|
> > > >    3.8e+07 |-+++  + +                          +       :+  :+      =
         :|
> > > >            |                                           +   +       =
          |
> > > >    3.7e+07 |-+                                                     =
          |
> > > >            |                                                       =
          |
> > > >    3.6e+07 |-+                                                     =
          |
> > > >            |                                                       =
          |
> > > >    3.5e+07 |O+    OOO                                              =
          |
> > > >    3.4e+07 |-+  O      O                                           =
          |
> > > >            |  OO      O O  O   O     O   O                         =
          |
> > > >    3.3e+07 |-+            O  OO  O O  OO                           =
          |
> > > >            |                                                       =
          |
> > > >    3.2e+07 +-------------------------------------------------------=
----------+
> > > >                       stress-ng.time.involuntary_context_switches
> > > >    590000 +--------------------------------------------------------=
----------+
> > > >    580000 |-+ +                                                    =
   +.   .+|
> > > >           |+. :+.++. + .++ .++.++ .+++.+++.++.    + +.+ +.++.+  .++=
+.+  + +  |
> > > >    570000 |-++      + +   +      +            +  + +   ::     ++   =
      +   |
> > > >    560000 |-+                                  ++      +           =
          |
> > > >    550000 |-+                                                      =
          |
> > > >    540000 |-+                                                      =
          |
> > > >           |                                                        =
          |
> > > >    530000 |-+                                                      =
          |
> > > >    520000 |-+                                                      =
          |
> > > >    510000 |-+ O  OO O                                              =
          |
> > > >    500000 |O+O O     OO O                                          =
          |
> > > >           |              OO  O O     O O                           =
          |
> > > >    490000 |-+               O   O  OO   O                          =
          |
> > > >    480000 +--------------------------------------------------------=
----------+
> > > >                                  stress-ng.opcode.ops
> > > >    580000 +--------------------------------------------------------=
----------+
> > > >    570000 |+. ++.++. + .++ .++.+  .+ +.+++.++.    + +.+ +.++.+    +=
+.+  + +  |
> > > >           |  +      + +   +     ++  +         +  + +   ::     ++.+ =
      +   |
> > > >    560000 |-+                                  ++      +           =
          |
> > > >    550000 |-+                                                      =
          |
> > > >    540000 |-+                                                      =
          |
> > > >    530000 |-+                                                      =
          |
> > > >           |                                                        =
          |
> > > >    520000 |-+                                                      =
          |
> > > >    510000 |O+ O  OO O O                                            =
          |
> > > >    500000 |-+O O     O  O                                          =
          |
> > > >    490000 |-+            OO  O O     O O                           =
          |
> > > >           |                 O   O  OO   O                          =
          |
> > > >    480000 |-+                    O                                 =
          |
> > > >    470000 +--------------------------------------------------------=
----------+
> > > >                             stress-ng.opcode.ops_per_sec
> > > >    9800 +----------------------------------------------------------=
----------+
> > > >    9600 |-+ +.                                                     =
   +    .+|
> > > >         |+. : +++. +. ++. +.++.+ +.++.+++.++.    + .++  ++.++.+ +.+=
+.+ +. +  |
> > > >    9400 |-++      +  +   +      +            +  + +   :+       +   =
      +   |
> > > >    9200 |-+                                   ++      +            =
          |
> > > >         |                                                          =
          |
> > > >    9000 |-+                                                        =
          |
> > > >    8800 |-+                                                        =
          |
> > > >    8600 |-+                                                        =
          |
> > > >         |   O  OO O                                                =
          |
> > > >    8400 |O+O  O    O OO                                            =
          |
> > > >    8200 |-+            O O  OO      O O                            =
          |
> > > >         |                 O    O O O   O                           =
          |
> > > >    8000 |-+                     O                                  =
          |
> > > >    7800 +----------------------------------------------------------=
----------+
> > > > [*] bisect-good sample
> > > > [O] bisect-bad  sample
> > > > =

> > > > *******************************************************************=
********************************
> > > > lkp-csl-2sp4: 96 threads Intel(R) Xeon(R) CPU @ 2.30GHz with 128G m=
emory
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group=
/test/testcase/ucode:
> > > >    gcc-9/performance/x86_64-rhel-8.3/1/debian-10.4-x86_64-20200603.=
cgz/300s/lkp-csl-2sp4/execl/unixbench/0x4003006
> > > > =

> > > > commit:
> > > >    d42c7a8d68 ("kcsan: Document "value changed" line")
> > > >    6c52b5f3cf ("clocksource: Reduce WATCHDOG_THRESHOLD")
> > > > =

> > > > d42c7a8d68038bc0 6c52b5f3cfefd6e429efc4413fd
> > > > ---------------- ---------------------------
> > > >           %stddev     %change         %stddev
> > > >               \          |                \
> > > >       41269 =C2=B1 24%     -24.8%      31015 =C2=B1  4%  unixbench.=
time.involuntary_context_switches
> > > >       87.00            +2.3%      89.00        unixbench.time.perce=
nt_of_cpu_this_job_got
> > > >        9346            -6.5%       8736 =C2=B1  2%  proc-vmstat.pga=
ctivate
> > > >        1.37 =C2=B1 16%      -1.4        0.00        mpstat.cpu.all.=
irq%
> > > >        0.10 =C2=B1 12%      -0.1        0.00 =C2=B1 59%  mpstat.cpu=
.all.soft%
> > > >        1600 =C2=B1  4%      -8.3%       1467 =C2=B1  6%  slabinfo.p=
ool_workqueue.active_objs
> > > >        1609 =C2=B1  4%      -8.8%       1467 =C2=B1  6%  slabinfo.p=
ool_workqueue.num_objs
> > > >       96.50            +2.6%      99.00        vmstat.cpu.id
> > > >        1918 =C2=B1  2%     -19.7%       1539        vmstat.system.cs
> > > >       27.42            +1.0%      27.69        boot-time.boot
> > > >       14.59            +2.0%      14.89        boot-time.dhcp
> > > >        2119            +7.3%       2273        boot-time.idle
> > > >    55342935 =C2=B1146%     -97.1%    1614545 =C2=B1  9%  cpuidle.C1=
.time
> > > >      369013 =C2=B1113%     -87.0%      47814 =C2=B1 10%  cpuidle.PO=
LL.time
> > > >       80151 =C2=B1 24%     -94.7%       4258 =C2=B1 10%  cpuidle.PO=
LL.usage
> > > >       72.00 =C2=B1  5%    +139.4%     172.33        turbostat.Avg_M=
Hz
> > > >        3.76 =C2=B1 11%      +4.7        8.50        turbostat.Busy%
> > > >      113.08            +8.9%     123.12        turbostat.PkgWatt
> > > >       15.27 =C2=B1100%    +582.6%     104.25 =C2=B1 58%  sched_debu=
g.cfs_rq:/.MIN_vruntime.avg
> > > >      144.93 =C2=B1100%    +338.3%     635.26 =C2=B1 54%  sched_debu=
g.cfs_rq:/.MIN_vruntime.stddev
> > > >       15.27 =C2=B1100%    +582.6%     104.25 =C2=B1 58%  sched_debu=
g.cfs_rq:/.max_vruntime.avg
> > > >      144.93 =C2=B1100%    +338.3%     635.26 =C2=B1 54%  sched_debu=
g.cfs_rq:/.max_vruntime.stddev
> > > >      584.77 =C2=B1  3%     -98.3%       9.72 =C2=B1 18%  sched_debu=
g.cpu.clock_task.stddev
> > > >        4639 =C2=B1  7%     -11.6%       4102        sched_debug.cpu=
.nr_switches.avg
> > > >       36958 =C2=B1 11%     -35.6%      23798 =C2=B1 17%  sched_debu=
g.cpu.nr_switches.max
> > > >        4896 =C2=B1  6%     -34.3%       3216 =C2=B1  9%  sched_debu=
g.cpu.nr_switches.stddev
> > > >        1.00          -100.0%       0.00        sched_debug.sched_cl=
ock_stable()
> > > >   9.417e+08 =C2=B1  2%      +7.3%   1.01e+09 =C2=B1  2%  perf-stat.=
i.branch-instructions
> > > >        5.82 =C2=B1 28%      +3.6        9.39 =C2=B1  2%  perf-stat.=
i.cache-miss-rate%
> > > >     2168912 =C2=B1 14%     +20.7%    2618168 =C2=B1  3%  perf-stat.=
i.cache-misses
> > > >        1868 =C2=B1  2%     -19.3%       1508        perf-stat.i.con=
text-switches
> > > >        1.66 =C2=B1 15%    +114.4%       3.57 =C2=B1  2%  perf-stat.=
i.cpi
> > > >   6.219e+09 =C2=B1  6%    +155.1%  1.587e+10        perf-stat.i.cpu=
-cycles
> > > >        2937 =C2=B1  9%    +109.3%       6147 =C2=B1  2%  perf-stat.=
i.cycles-between-cache-misses
> > > >        0.12 =C2=B1 75%      -0.1        0.03 =C2=B1  4%  perf-stat.=
i.dTLB-load-miss-rate%
> > > >      993756 =C2=B1 62%     -63.4%     363963 =C2=B1  2%  perf-stat.=
i.dTLB-load-misses
> > > >        0.08 =C2=B1 30%      -0.0        0.05        perf-stat.i.dTL=
B-store-miss-rate%
> > > >      426111 =C2=B1 18%     -22.7%     329275 =C2=B1  3%  perf-stat.=
i.dTLB-store-misses
> > > >     2650130 =C2=B1  3%      +8.8%    2882167        perf-stat.i.iTL=
B-load-misses
> > > >   4.549e+09 =C2=B1  2%      +6.7%  4.853e+09 =C2=B1  2%  perf-stat.=
i.instructions
> > > >        0.72 =C2=B1  8%     -58.5%       0.30 =C2=B1  2%  perf-stat.=
i.ipc
> > > >        0.06 =C2=B1  6%    +155.1%       0.17        perf-stat.i.met=
ric.GHz
> > > >        0.57 =C2=B1 59%     -63.9%       0.21 =C2=B1  6%  perf-stat.=
i.metric.K/sec
> > > >       83.19            +1.0       84.23        perf-stat.i.node-loa=
d-miss-rate%
> > > >      542248 =C2=B1  9%     +37.4%     745113        perf-stat.i.nod=
e-load-misses
> > > >      112232 =C2=B1 16%     +27.4%     143037 =C2=B1  3%  perf-stat.=
i.node-loads
> > > >       73.15 =C2=B1 29%     +23.3       96.45        perf-stat.i.nod=
e-store-miss-rate%
> > > >      142423 =C2=B1 19%     +81.4%     258350        perf-stat.i.nod=
e-store-misses
> > > >        5.57 =C2=B1 26%      +3.5        9.07 =C2=B1  3%  perf-stat.=
overall.cache-miss-rate%
> > > >        1.37 =C2=B1  9%    +138.8%       3.27 =C2=B1  2%  perf-stat.=
overall.cpi
> > > >        2902 =C2=B1  9%    +109.0%       6065 =C2=B1  2%  perf-stat.=
overall.cycles-between-cache-misses
> > > >        0.08 =C2=B1 64%      -0.1        0.03 =C2=B1  4%  perf-stat.=
overall.dTLB-load-miss-rate%
> > > >        0.07 =C2=B1 20%      -0.0        0.05        perf-stat.overa=
ll.dTLB-store-miss-rate%
> > > >        0.74 =C2=B1  8%     -58.4%       0.31 =C2=B1  2%  perf-stat.=
overall.ipc
> > > >       72.83 =C2=B1 28%     +23.1       95.94        perf-stat.overa=
ll.node-store-miss-rate%
> > > >     1242941           +11.5%    1386048        perf-stat.overall.pa=
th-length
> > > >   9.388e+08 =C2=B1  2%      +7.3%  1.007e+09 =C2=B1  2%  perf-stat.=
ps.branch-instructions
> > > >     2162600 =C2=B1 14%     +20.7%    2610503 =C2=B1  3%  perf-stat.=
ps.cache-misses
> > > >        1863 =C2=B1  2%     -19.3%       1504        perf-stat.ps.co=
ntext-switches
> > > >     6.2e+09 =C2=B1  6%    +155.2%  1.582e+10        perf-stat.ps.cp=
u-cycles
> > > >      990761 =C2=B1 62%     -63.4%     362845 =C2=B1  2%  perf-stat.=
ps.dTLB-load-misses
> > > >      424764 =C2=B1 18%     -22.7%     328252 =C2=B1  3%  perf-stat.=
ps.dTLB-store-misses
> > > >     2641809 =C2=B1  3%      +8.8%    2873343        perf-stat.ps.iT=
LB-load-misses
> > > >   4.536e+09 =C2=B1  2%      +6.7%  4.839e+09 =C2=B1  2%  perf-stat.=
ps.instructions
> > > >      540562 =C2=B1  9%     +37.4%     742841        perf-stat.ps.no=
de-load-misses
> > > >      111898 =C2=B1 16%     +27.5%     142630 =C2=B1  3%  perf-stat.=
ps.node-loads
> > > >      141992 =C2=B1 19%     +81.4%     257582        perf-stat.ps.no=
de-store-misses
> > > >     1.5e+12 =C2=B1  2%      +6.6%    1.6e+12 =C2=B1  2%  perf-stat.=
total.instructions
> > > >        0.01 =C2=B1 23%   +5667.9%       0.51 =C2=B1109%  perf-sched=
.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
> > > >        0.01 =C2=B1 33%  +11121.1%       0.71 =C2=B1 81%  perf-sched=
.sch_delay.avg.ms.do_syslog.part.0.kmsg_read.vfs_read
> > > >        0.00 =C2=B1 40%    +114.3%       0.01        perf-sched.sch_=
delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_sys=
call_64
> > > >        0.01 =C2=B1 47%    +106.7%       0.02 =C2=B1  3%  perf-sched=
.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
> > > >        0.00 =C2=B1 49%   +5141.7%       0.10 =C2=B1215%  perf-sched=
.sch_delay.avg.ms.pipe_read.new_sync_read.vfs_read.ksys_read
> > > >        0.01 =C2=B1 24%     +95.8%       0.02 =C2=B1 15%  perf-sched=
.sch_delay.avg.ms.schedule_timeout.wait_for_completion_interruptible_timeou=
t.usb_stor_msg_common.usb_stor_bulk_transfer_buf
> > > >        0.00 =C2=B1 27%    +268.8%       0.01 =C2=B1  6%  perf-sched=
.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open.isra
> > > >        0.01 =C2=B1 13%     +26.1%       0.01 =C2=B1  3%  perf-sched=
.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork
> > > >        0.01 =C2=B1 27%   +9866.7%       1.00 =C2=B1112%  perf-sched=
.sch_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
> > > >        0.01 =C2=B1 42%  +19611.6%       1.41 =C2=B1 81%  perf-sched=
.sch_delay.max.ms.do_syslog.part.0.kmsg_read.vfs_read
> > > >        0.01 =C2=B1 43%    +110.0%       0.01 =C2=B1 17%  perf-sched=
.sch_delay.max.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry=
_SYSCALL_64_after_hwframe.[unknown]
> > > >        0.03 =C2=B1 72%    +517.5%       0.16 =C2=B1 72%  perf-sched=
.sch_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x6=
4_sys_epoll_wait
> > > >        0.02 =C2=B1 29%     +73.4%       0.03 =C2=B1 11%  perf-sched=
.sch_delay.max.ms.schedule_timeout.wait_for_completion_interruptible_timeou=
t.usb_stor_msg_common.usb_stor_bulk_transfer_buf
> > > >        2.54           +79.1%       4.55 =C2=B1  2%  perf-sched.sch_=
delay.max.ms.worker_thread.kthread.ret_from_fork
> > > >      129.77 =C2=B1  3%     +17.4%     152.41 =C2=B1  4%  perf-sched=
.total_wait_and_delay.average.ms
> > > >       11677 =C2=B1  4%     -12.9%      10170 =C2=B1  5%  perf-sched=
.total_wait_and_delay.count.ms
> > > >      129.77 =C2=B1  3%     +17.4%     152.39 =C2=B1  4%  perf-sched=
.total_wait_time.average.ms
> > > >      188.49 =C2=B1 10%     +27.2%     239.84 =C2=B1  9%  perf-sched=
.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_gr=
oup.do_syscall_64
> > > >        0.11 =C2=B1  7%     +13.5%       0.12 =C2=B1  5%  perf-sched=
.wait_and_delay.avg.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode=
.asm_exc_page_fault.[unknown]
> > > >       71.26 =C2=B1  3%     +26.4%      90.08 =C2=B1  2%  perf-sched=
.wait_and_delay.avg.ms.pipe_read.new_sync_read.vfs_read.ksys_read
> > > >      305.63 =C2=B1  6%     +21.0%     369.75 =C2=B1 10%  perf-sched=
.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
> > > >        0.00 =C2=B1 27%    +287.5%       0.01 =C2=B1 12%  perf-sched=
.wait_and_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open.is=
ra
> > > >      209.83 =C2=B1 16%     -27.3%     152.50 =C2=B1 16%  perf-sched=
.wait_and_delay.count.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.=
asm_exc_page_fault.[unknown]
> > > >      105.33 =C2=B1 14%     -32.6%      71.00 =C2=B1 14%  perf-sched=
.wait_and_delay.count.exit_to_user_mode_prepare.syscall_exit_to_user_mode.e=
ntry_SYSCALL_64_after_hwframe.[unknown]
> > > >        2120 =C2=B1  3%     -21.5%       1665 =C2=B1  2%  perf-sched=
.wait_and_delay.count.pipe_read.new_sync_read.vfs_read.ksys_read
> > > >      144.17 =C2=B1 20%     -33.1%      96.50 =C2=B1 21%  perf-sched=
.wait_and_delay.count.preempt_schedule_common.__cond_resched.do_user_addr_f=
ault.exc_page_fault.asm_exc_page_fault
> > > >       89.00 =C2=B1 11%     -41.0%      52.50 =C2=B1 45%  perf-sched=
.wait_and_delay.count.preempt_schedule_common.__cond_resched.zap_pte_range.=
unmap_page_range.unmap_vmas
> > > >        3080 =C2=B1  8%     -16.7%       2566 =C2=B1  9%  perf-sched=
.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork
> > > >        4587 =C2=B1 50%     -59.8%       1845 =C2=B1103%  perf-sched=
.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait=
.__x64_sys_epoll_wait
> > > >      188.49 =C2=B1 10%     +27.2%     239.83 =C2=B1  9%  perf-sched=
.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.d=
o_syscall_64
> > > >        0.11 =C2=B1  7%     +13.5%       0.12 =C2=B1  5%  perf-sched=
.wait_time.avg.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_=
exc_page_fault.[unknown]
> > > >       71.26 =C2=B1  3%     +26.3%      89.98 =C2=B1  2%  perf-sched=
.wait_time.avg.ms.pipe_read.new_sync_read.vfs_read.ksys_read
> > > >        0.12 =C2=B1 31%     -75.3%       0.03 =C2=B1142%  perf-sched=
.wait_time.avg.ms.preempt_schedule_common.__cond_resched.__kmalloc.security=
_prepare_creds.prepare_creds
> > > >        0.10 =C2=B1  7%     +20.5%       0.12 =C2=B1  7%  perf-sched=
.wait_time.avg.ms.preempt_schedule_common.__cond_resched.copy_strings.isra.0
> > > >        0.10 =C2=B1 31%     +92.3%       0.20 =C2=B1 74%  perf-sched=
.wait_time.avg.ms.preempt_schedule_common.__cond_resched.down_read.walk_com=
ponent.path_lookupat
> > > >        0.11 =C2=B1  8%     +18.3%       0.13 =C2=B1  5%  perf-sched=
.wait_time.avg.ms.preempt_schedule_common.__cond_resched.filemap_read.__ker=
nel_read.exec_binprm
> > > >        0.12 =C2=B1 37%     -66.7%       0.04 =C2=B1104%  perf-sched=
.wait_time.avg.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.g=
etname_kernel.open_exec
> > > >        0.10 =C2=B1 18%     +34.6%       0.14 =C2=B1 12%  perf-sched=
.wait_time.avg.ms.preempt_schedule_common.__cond_resched.unmap_page_range.u=
nmap_vmas.exit_mmap
> > > >        3.58 =C2=B1 34%     -50.4%       1.78 =C2=B1 46%  perf-sched=
.wait_time.avg.ms.schedule_timeout.__skb_wait_for_more_packets.unix_dgram_r=
ecvmsg.__sys_recvfrom
> > > >      305.62 =C2=B1  6%     +21.0%     369.74 =C2=B1 10%  perf-sched=
.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
> > > >        0.15 =C2=B1 37%     -80.4%       0.03 =C2=B1142%  perf-sched=
.wait_time.max.ms.preempt_schedule_common.__cond_resched.__kmalloc.security=
_prepare_creds.prepare_creds
> > > >        0.13 =C2=B1 36%    +437.7%       0.72 =C2=B1155%  perf-sched=
.wait_time.max.ms.preempt_schedule_common.__cond_resched.down_read.walk_com=
ponent.path_lookupat
> > > >        0.16 =C2=B1 28%     +42.2%       0.23 =C2=B1  5%  perf-sched=
.wait_time.max.ms.preempt_schedule_common.__cond_resched.down_write_killabl=
e.setup_arg_pages.load_elf_binary
> > > >        0.14 =C2=B1 37%     -69.1%       0.04 =C2=B1103%  perf-sched=
.wait_time.max.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.g=
etname_kernel.open_exec
> > > >        4587 =C2=B1 50%     -59.8%       1844 =C2=B1103%  perf-sched=
.wait_time.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x6=
4_sys_epoll_wait
> > > >        3.58 =C2=B1 34%     -50.4%       1.78 =C2=B1 46%  perf-sched=
.wait_time.max.ms.schedule_timeout.__skb_wait_for_more_packets.unix_dgram_r=
ecvmsg.__sys_recvfrom
> > > >        0.09 =C2=B1  3%     +13.4%       0.11 =C2=B1  5%  perf-sched=
.wait_time.max.ms.schedule_timeout.wait_for_completion_interruptible.usb_st=
or_control_thread.kthread
> > > >       83958 =C2=B1 22%     -39.2%      51071 =C2=B1  7%  softirqs.C=
PU0.RCU
> > > >       52781 =C2=B1 24%     -42.2%      30516 =C2=B1  4%  softirqs.C=
PU10.RCU
> > > >       57678 =C2=B1 27%     -45.6%      31359 =C2=B1  6%  softirqs.C=
PU11.RCU
> > > >       49173 =C2=B1 17%     -38.0%      30501 =C2=B1  5%  softirqs.C=
PU12.RCU
> > > >       52583 =C2=B1 26%     -38.5%      32315 =C2=B1 11%  softirqs.C=
PU13.RCU
> > > >       53806 =C2=B1 32%     -42.7%      30806 =C2=B1  8%  softirqs.C=
PU14.RCU
> > > >       49603 =C2=B1 21%     -36.6%      31471 =C2=B1 11%  softirqs.C=
PU15.RCU
> > > >       48176 =C2=B1 17%     -37.4%      30155 =C2=B1  8%  softirqs.C=
PU16.RCU
> > > >       44644 =C2=B1 13%     -30.2%      31144 =C2=B1  4%  softirqs.C=
PU17.RCU
> > > >       41356 =C2=B1 12%     -26.0%      30596 =C2=B1  9%  softirqs.C=
PU18.RCU
> > > >       46651 =C2=B1 14%     -34.9%      30377 =C2=B1  8%  softirqs.C=
PU19.RCU
> > > >       58926 =C2=B1 31%     -41.1%      34685 =C2=B1 11%  softirqs.C=
PU2.RCU
> > > >       55066 =C2=B1 41%     -46.6%      29403 =C2=B1  4%  softirqs.C=
PU20.RCU
> > > >       46142 =C2=B1 19%     -34.0%      30462 =C2=B1  8%  softirqs.C=
PU21.RCU
> > > >       46125 =C2=B1 18%     -36.6%      29254 =C2=B1  5%  softirqs.C=
PU22.RCU
> > > >       43186 =C2=B1 12%     -27.6%      31271 =C2=B1  7%  softirqs.C=
PU27.RCU
> > > >       43298 =C2=B1 11%     -30.5%      30080 =C2=B1  4%  softirqs.C=
PU28.RCU
> > > >       45410 =C2=B1 17%     -33.3%      30308 =C2=B1 11%  softirqs.C=
PU29.RCU
> > > >       59941 =C2=B1 35%     -47.8%      31271 =C2=B1  9%  softirqs.C=
PU3.RCU
> > > >       42403 =C2=B1  9%     -32.1%      28793 =C2=B1  6%  softirqs.C=
PU30.RCU
> > > >       43296 =C2=B1 13%     -30.7%      29985 =C2=B1  6%  softirqs.C=
PU31.RCU
> > > >       50475 =C2=B1 15%     -39.1%      30719 =C2=B1  5%  softirqs.C=
PU32.RCU
> > > >       49326 =C2=B1 15%     -35.2%      31981 =C2=B1 17%  softirqs.C=
PU33.RCU
> > > >       51237 =C2=B1 12%     -39.6%      30970 =C2=B1 10%  softirqs.C=
PU34.RCU
> > > >       51711 =C2=B1 11%     -45.2%      28360 =C2=B1  3%  softirqs.C=
PU35.RCU
> > > >       49924 =C2=B1 17%     -43.2%      28373 =C2=B1  6%  softirqs.C=
PU36.RCU
> > > >       49802 =C2=B1 16%     -40.2%      29775 =C2=B1 11%  softirqs.C=
PU37.RCU
> > > >       52954 =C2=B1 17%     -46.1%      28545 =C2=B1  8%  softirqs.C=
PU38.RCU
> > > >       49661 =C2=B1 14%     -41.5%      29067 =C2=B1  8%  softirqs.C=
PU39.RCU
> > > >       60707 =C2=B1 28%     -43.7%      34155 =C2=B1 11%  softirqs.C=
PU4.RCU
> > > >       51390 =C2=B1 16%     -45.8%      27866 =C2=B1  8%  softirqs.C=
PU40.RCU
> > > >       58695 =C2=B1 20%     -51.3%      28563 =C2=B1  4%  softirqs.C=
PU41.RCU
> > > >       51871 =C2=B1 23%     -38.8%      31769 =C2=B1 15%  softirqs.C=
PU42.RCU
> > > >       50183 =C2=B1 12%     -42.7%      28735 =C2=B1  9%  softirqs.C=
PU43.RCU
> > > >       56295 =C2=B1 15%     -46.9%      29880 =C2=B1 14%  softirqs.C=
PU44.RCU
> > > >       54323 =C2=B1 17%     -45.3%      29698 =C2=B1  7%  softirqs.C=
PU45.RCU
> > > >       51361 =C2=B1 16%     -46.3%      27564 =C2=B1  2%  softirqs.C=
PU46.RCU
> > > >      163543 =C2=B1 17%     -43.8%      91839 =C2=B1 13%  softirqs.C=
PU47.RCU
> > > >       60813 =C2=B1 28%     -45.2%      33329 =C2=B1  7%  softirqs.C=
PU5.RCU
> > > >       60658 =C2=B1 27%     -44.3%      33808 =C2=B1 13%  softirqs.C=
PU50.RCU
> > > >       55217 =C2=B1 24%     -39.3%      33499 =C2=B1 13%  softirqs.C=
PU51.RCU
> > > >       58356 =C2=B1 28%     -43.8%      32790 =C2=B1  8%  softirqs.C=
PU52.RCU
> > > >       62221 =C2=B1 23%     -45.9%      33655 =C2=B1  5%  softirqs.C=
PU53.RCU
> > > >       55815 =C2=B1 27%     -44.1%      31202 =C2=B1  9%  softirqs.C=
PU54.RCU
> > > >       58726 =C2=B1 28%     -43.6%      33117 =C2=B1 10%  softirqs.C=
PU55.RCU
> > > >       52856 =C2=B1 26%     -42.7%      30294 =C2=B1  8%  softirqs.C=
PU56.RCU
> > > >       53839 =C2=B1 22%     -44.0%      30174 =C2=B1  8%  softirqs.C=
PU57.RCU
> > > >       55030 =C2=B1 28%     -45.0%      30274 =C2=B1  6%  softirqs.C=
PU58.RCU
> > > >       54756 =C2=B1 22%     -42.8%      31304 =C2=B1  5%  softirqs.C=
PU59.RCU
> > > >       54918 =C2=B1 31%     -47.1%      29032 =C2=B1  3%  softirqs.C=
PU6.RCU
> > > >       53535 =C2=B1 24%     -41.9%      31090 =C2=B1  6%  softirqs.C=
PU60.RCU
> > > >       52174 =C2=B1 23%     -41.2%      30704 =C2=B1  5%  softirqs.C=
PU61.RCU
> > > >       48552 =C2=B1 21%     -36.8%      30663 =C2=B1  8%  softirqs.C=
PU62.RCU
> > > >       56162 =C2=B1 29%     -43.7%      31643 =C2=B1  9%  softirqs.C=
PU63.RCU
> > > >       47055 =C2=B1 27%     -39.2%      28624 =C2=B1  3%  softirqs.C=
PU64.RCU
> > > >       45531 =C2=B1 16%     -36.9%      28741 =C2=B1  4%  softirqs.C=
PU65.RCU
> > > >       43623 =C2=B1 17%     -29.5%      30756 =C2=B1  7%  softirqs.C=
PU66.RCU
> > > >       43174 =C2=B1 20%     -30.6%      29945 =C2=B1  9%  softirqs.C=
PU67.RCU
> > > >       43982 =C2=B1 18%     -31.1%      30302 =C2=B1 10%  softirqs.C=
PU68.RCU
> > > >       45056 =C2=B1 21%     -37.4%      28219        softirqs.CPU69.=
RCU
> > > >       56189 =C2=B1 26%     -42.9%      32065 =C2=B1  9%  softirqs.C=
PU7.RCU
> > > >       47003 =C2=B1 20%     -37.3%      29489 =C2=B1  4%  softirqs.C=
PU70.RCU
> > > >       51052 =C2=B1 20%     -37.4%      31979 =C2=B1 10%  softirqs.C=
PU74.RCU
> > > >       42083 =C2=B1 10%     -24.0%      31964 =C2=B1 20%  softirqs.C=
PU75.RCU
> > > >       48436 =C2=B1 20%     -40.1%      29025 =C2=B1  7%  softirqs.C=
PU76.RCU
> > > >       47672 =C2=B1 22%     -37.1%      29972 =C2=B1  8%  softirqs.C=
PU77.RCU
> > > >       45766 =C2=B1 12%     -35.2%      29661 =C2=B1  8%  softirqs.C=
PU79.RCU
> > > >       55322 =C2=B1 30%     -41.8%      32216 =C2=B1 11%  softirqs.C=
PU8.RCU
> > > >       54363 =C2=B1 11%     -43.3%      30850 =C2=B1  6%  softirqs.C=
PU80.RCU
> > > >       53303 =C2=B1 15%     -37.7%      33196 =C2=B1 13%  softirqs.C=
PU81.RCU
> > > >       51853 =C2=B1 13%     -40.1%      31073 =C2=B1  5%  softirqs.C=
PU82.RCU
> > > >       51969 =C2=B1 13%     -41.2%      30553 =C2=B1  7%  softirqs.C=
PU83.RCU
> > > >       50169 =C2=B1 16%     -43.0%      28586 =C2=B1  4%  softirqs.C=
PU84.RCU
> > > >       51590 =C2=B1 19%     -40.9%      30502 =C2=B1  7%  softirqs.C=
PU85.RCU
> > > >       52550 =C2=B1 14%     -42.5%      30201 =C2=B1  8%  softirqs.C=
PU86.RCU
> > > >       51864 =C2=B1 16%     -42.4%      29871 =C2=B1  6%  softirqs.C=
PU87.RCU
> > > >       51409 =C2=B1 13%     -44.2%      28669 =C2=B1  9%  softirqs.C=
PU88.RCU
> > > >       53518 =C2=B1 15%     -45.4%      29224 =C2=B1  7%  softirqs.C=
PU89.RCU
> > > >       53986 =C2=B1 26%     -39.9%      32454 =C2=B1 12%  softirqs.C=
PU9.RCU
> > > >       48578 =C2=B1 14%     -39.4%      29454 =C2=B1  4%  softirqs.C=
PU90.RCU
> > > >       51131 =C2=B1 16%     -44.9%      28148 =C2=B1  4%  softirqs.C=
PU91.RCU
> > > >       51216 =C2=B1 13%     -43.8%      28775 =C2=B1  7%  softirqs.C=
PU92.RCU
> > > >       53664 =C2=B1 23%     -42.2%      31002 =C2=B1 12%  softirqs.C=
PU93.RCU
> > > >       53551 =C2=B1 14%     -44.8%      29573 =C2=B1  6%  softirqs.C=
PU94.RCU
> > > >       74490 =C2=B1 20%     -39.1%      45358 =C2=B1 11%  softirqs.C=
PU95.RCU
> > > >     5514177 =C2=B1 17%     -37.5%    3445171        softirqs.RCU
> > > >       93120 =C2=B1 31%     +64.2%     152920 =C2=B1 10%  interrupts=
.CAL:Function_call_interrupts
> > > >       20.67 =C2=B1 14%    +408.9%     105.17 =C2=B1 65%  interrupts=
.CPU10.NMI:Non-maskable_interrupts
> > > >       20.67 =C2=B1 14%    +408.9%     105.17 =C2=B1 65%  interrupts=
.CPU10.PMI:Performance_monitoring_interrupts
> > > >       20.33 =C2=B1 11%    +397.5%     101.17 =C2=B1 79%  interrupts=
.CPU11.NMI:Non-maskable_interrupts
> > > >       20.33 =C2=B1 11%    +397.5%     101.17 =C2=B1 79%  interrupts=
.CPU11.PMI:Performance_monitoring_interrupts
> > > >       20.50 =C2=B1 33%    +221.1%      65.83 =C2=B1 40%  interrupts=
.CPU13.NMI:Non-maskable_interrupts
> > > >       20.50 =C2=B1 33%    +221.1%      65.83 =C2=B1 40%  interrupts=
.CPU13.PMI:Performance_monitoring_interrupts
> > > >       11.50 =C2=B1 43%    +318.8%      48.17 =C2=B1 92%  interrupts=
.CPU13.RES:Rescheduling_interrupts
> > > >       16.00 =C2=B1 32%   +1041.7%     182.67 =C2=B1144%  interrupts=
.CPU14.NMI:Non-maskable_interrupts
> > > >       16.00 =C2=B1 32%   +1041.7%     182.67 =C2=B1144%  interrupts=
.CPU14.PMI:Performance_monitoring_interrupts
> > > >       18.67 =C2=B1 28%    +361.6%      86.17 =C2=B1 36%  interrupts=
.CPU15.NMI:Non-maskable_interrupts
> > > >       18.67 =C2=B1 28%    +361.6%      86.17 =C2=B1 36%  interrupts=
.CPU15.PMI:Performance_monitoring_interrupts
> > > >       18.50 =C2=B1 23%    +581.1%     126.00 =C2=B1 77%  interrupts=
.CPU16.NMI:Non-maskable_interrupts
> > > >       18.50 =C2=B1 23%    +581.1%     126.00 =C2=B1 77%  interrupts=
.CPU16.PMI:Performance_monitoring_interrupts
> > > >       20.33 =C2=B1 13%    +287.7%      78.83 =C2=B1 24%  interrupts=
.CPU17.NMI:Non-maskable_interrupts
> > > >       20.33 =C2=B1 13%    +287.7%      78.83 =C2=B1 24%  interrupts=
.CPU17.PMI:Performance_monitoring_interrupts
> > > >       20.33 =C2=B1 17%    +304.1%      82.17 =C2=B1 22%  interrupts=
.CPU18.NMI:Non-maskable_interrupts
> > > >       20.33 =C2=B1 17%    +304.1%      82.17 =C2=B1 22%  interrupts=
.CPU18.PMI:Performance_monitoring_interrupts
> > > >       19.33 =C2=B1 10%    +309.5%      79.17 =C2=B1 36%  interrupts=
.CPU19.NMI:Non-maskable_interrupts
> > > >       19.33 =C2=B1 10%    +309.5%      79.17 =C2=B1 36%  interrupts=
.CPU19.PMI:Performance_monitoring_interrupts
> > > >       20.00 =C2=B1 10%    +261.7%      72.33 =C2=B1 31%  interrupts=
.CPU20.NMI:Non-maskable_interrupts
> > > >       20.00 =C2=B1 10%    +261.7%      72.33 =C2=B1 31%  interrupts=
.CPU20.PMI:Performance_monitoring_interrupts
> > > >       20.00 =C2=B1 10%    +292.5%      78.50 =C2=B1 24%  interrupts=
.CPU21.NMI:Non-maskable_interrupts
> > > >       20.00 =C2=B1 10%    +292.5%      78.50 =C2=B1 24%  interrupts=
.CPU21.PMI:Performance_monitoring_interrupts
> > > >       20.33 =C2=B1 15%    +223.8%      65.83 =C2=B1 39%  interrupts=
.CPU22.NMI:Non-maskable_interrupts
> > > >       20.33 =C2=B1 15%    +223.8%      65.83 =C2=B1 39%  interrupts=
.CPU22.PMI:Performance_monitoring_interrupts
> > > >       41.67 =C2=B1 26%    +102.8%      84.50 =C2=B1 26%  interrupts=
.CPU23.TLB:TLB_shootdowns
> > > >       17.50 =C2=B1 24%    +473.3%     100.33 =C2=B1 65%  interrupts=
.CPU25.NMI:Non-maskable_interrupts
> > > >       17.50 =C2=B1 24%    +473.3%     100.33 =C2=B1 65%  interrupts=
.CPU25.PMI:Performance_monitoring_interrupts
> > > >      551.83 =C2=B1  3%    +108.4%       1150 =C2=B1110%  interrupts=
.CPU26.CAL:Function_call_interrupts
> > > >       25.50 =C2=B1 66%    +359.5%     117.17 =C2=B1 59%  interrupts=
.CPU26.NMI:Non-maskable_interrupts
> > > >       25.50 =C2=B1 66%    +359.5%     117.17 =C2=B1 59%  interrupts=
.CPU26.PMI:Performance_monitoring_interrupts
> > > >       22.50 =C2=B1 29%    +343.7%      99.83 =C2=B1 84%  interrupts=
.CPU28.NMI:Non-maskable_interrupts
> > > >       22.50 =C2=B1 29%    +343.7%      99.83 =C2=B1 84%  interrupts=
.CPU28.PMI:Performance_monitoring_interrupts
> > > >       18.83 =C2=B1 23%    +448.7%     103.33 =C2=B1 64%  interrupts=
.CPU31.NMI:Non-maskable_interrupts
> > > >       18.83 =C2=B1 23%    +448.7%     103.33 =C2=B1 64%  interrupts=
.CPU31.PMI:Performance_monitoring_interrupts
> > > >       22.33 =C2=B1 43%    +264.9%      81.50 =C2=B1 42%  interrupts=
.CPU32.NMI:Non-maskable_interrupts
> > > >       22.33 =C2=B1 43%    +264.9%      81.50 =C2=B1 42%  interrupts=
.CPU32.PMI:Performance_monitoring_interrupts
> > > >       18.00 =C2=B1 26%    +402.8%      90.50 =C2=B1 51%  interrupts=
.CPU34.NMI:Non-maskable_interrupts
> > > >       18.00 =C2=B1 26%    +402.8%      90.50 =C2=B1 51%  interrupts=
.CPU34.PMI:Performance_monitoring_interrupts
> > > >        6.00 =C2=B1 84%    +522.2%      37.33 =C2=B1119%  interrupts=
.CPU34.RES:Rescheduling_interrupts
> > > >       23.83 =C2=B1 62%    +325.9%     101.50 =C2=B1 54%  interrupts=
.CPU36.NMI:Non-maskable_interrupts
> > > >       23.83 =C2=B1 62%    +325.9%     101.50 =C2=B1 54%  interrupts=
.CPU36.PMI:Performance_monitoring_interrupts
> > > >       25.17 =C2=B1 79%    +437.7%     135.33 =C2=B1 75%  interrupts=
.CPU37.NMI:Non-maskable_interrupts
> > > >       25.17 =C2=B1 79%    +437.7%     135.33 =C2=B1 75%  interrupts=
.CPU37.PMI:Performance_monitoring_interrupts
> > > >       18.17 =C2=B1 23%    +337.6%      79.50 =C2=B1 41%  interrupts=
.CPU38.NMI:Non-maskable_interrupts
> > > >       18.17 =C2=B1 23%    +337.6%      79.50 =C2=B1 41%  interrupts=
.CPU38.PMI:Performance_monitoring_interrupts
> > > >       13.83 =C2=B1 32%    +636.1%     101.83 =C2=B1 78%  interrupts=
.CPU39.NMI:Non-maskable_interrupts
> > > >       13.83 =C2=B1 32%    +636.1%     101.83 =C2=B1 78%  interrupts=
.CPU39.PMI:Performance_monitoring_interrupts
> > > >       20.83 =C2=B1 45%    +346.4%      93.00 =C2=B1 57%  interrupts=
.CPU45.NMI:Non-maskable_interrupts
> > > >       20.83 =C2=B1 45%    +346.4%      93.00 =C2=B1 57%  interrupts=
.CPU45.PMI:Performance_monitoring_interrupts
> > > >      677.83 =C2=B1  6%     -12.9%     590.17 =C2=B1  3%  interrupts=
.CPU47.CAL:Function_call_interrupts
> > > >       20.67 =C2=B1 99%    +317.7%      86.33 =C2=B1 33%  interrupts=
.CPU48.TLB:TLB_shootdowns
> > > >       21.17 =C2=B1 30%    +353.5%      96.00 =C2=B1 18%  interrupts=
.CPU5.NMI:Non-maskable_interrupts
> > > >       21.17 =C2=B1 30%    +353.5%      96.00 =C2=B1 18%  interrupts=
.CPU5.PMI:Performance_monitoring_interrupts
> > > >        9.50 =C2=B1 37%    +649.1%      71.17 =C2=B1 84%  interrupts=
.CPU52.RES:Rescheduling_interrupts
> > > >       21.00 =C2=B1 26%    +342.1%      92.83 =C2=B1 13%  interrupts=
.CPU53.NMI:Non-maskable_interrupts
> > > >       21.00 =C2=B1 26%    +342.1%      92.83 =C2=B1 13%  interrupts=
.CPU53.PMI:Performance_monitoring_interrupts
> > > >       20.17 =C2=B1 18%    +330.6%      86.83 =C2=B1 16%  interrupts=
.CPU54.NMI:Non-maskable_interrupts
> > > >       20.17 =C2=B1 18%    +330.6%      86.83 =C2=B1 16%  interrupts=
.CPU54.PMI:Performance_monitoring_interrupts
> > > >       21.50 =C2=B1 22%    +276.7%      81.00 =C2=B1 26%  interrupts=
.CPU55.NMI:Non-maskable_interrupts
> > > >       21.50 =C2=B1 22%    +276.7%      81.00 =C2=B1 26%  interrupts=
.CPU55.PMI:Performance_monitoring_interrupts
> > > >       12.33 =C2=B1 75%    +297.3%      49.00 =C2=B1 66%  interrupts=
.CPU55.RES:Rescheduling_interrupts
> > > >       18.50 =C2=B1 29%    +418.9%      96.00 =C2=B1 23%  interrupts=
.CPU56.NMI:Non-maskable_interrupts
> > > >       18.50 =C2=B1 29%    +418.9%      96.00 =C2=B1 23%  interrupts=
.CPU56.PMI:Performance_monitoring_interrupts
> > > >       19.67 =C2=B1 13%    +444.1%     107.00 =C2=B1 51%  interrupts=
.CPU57.NMI:Non-maskable_interrupts
> > > >       19.67 =C2=B1 13%    +444.1%     107.00 =C2=B1 51%  interrupts=
.CPU57.PMI:Performance_monitoring_interrupts
> > > >       21.17 =C2=B1 14%    +336.2%      92.33 =C2=B1 25%  interrupts=
.CPU58.NMI:Non-maskable_interrupts
> > > >       21.17 =C2=B1 14%    +336.2%      92.33 =C2=B1 25%  interrupts=
.CPU58.PMI:Performance_monitoring_interrupts
> > > >       21.17 =C2=B1 15%    +475.6%     121.83 =C2=B1 73%  interrupts=
.CPU59.NMI:Non-maskable_interrupts
> > > >       21.17 =C2=B1 15%    +475.6%     121.83 =C2=B1 73%  interrupts=
.CPU59.PMI:Performance_monitoring_interrupts
> > > >       18.17 =C2=B1 29%    +379.8%      87.17 =C2=B1 16%  interrupts=
.CPU6.NMI:Non-maskable_interrupts
> > > >       18.17 =C2=B1 29%    +379.8%      87.17 =C2=B1 16%  interrupts=
.CPU6.PMI:Performance_monitoring_interrupts
> > > >        6.33 =C2=B1 81%    +473.7%      36.33 =C2=B1 87%  interrupts=
.CPU6.RES:Rescheduling_interrupts
> > > >       19.83 =C2=B1 15%    +337.0%      86.67 =C2=B1 16%  interrupts=
.CPU61.NMI:Non-maskable_interrupts
> > > >       19.83 =C2=B1 15%    +337.0%      86.67 =C2=B1 16%  interrupts=
.CPU61.PMI:Performance_monitoring_interrupts
> > > >       19.50 =C2=B1 14%    +731.6%     162.17 =C2=B1109%  interrupts=
.CPU62.NMI:Non-maskable_interrupts
> > > >       19.50 =C2=B1 14%    +731.6%     162.17 =C2=B1109%  interrupts=
.CPU62.PMI:Performance_monitoring_interrupts
> > > >       19.67 =C2=B1 33%    +383.1%      95.00 =C2=B1 31%  interrupts=
.CPU63.NMI:Non-maskable_interrupts
> > > >       19.67 =C2=B1 33%    +383.1%      95.00 =C2=B1 31%  interrupts=
.CPU63.PMI:Performance_monitoring_interrupts
> > > >       20.33 =C2=B1 11%    +452.5%     112.33 =C2=B1 58%  interrupts=
.CPU64.NMI:Non-maskable_interrupts
> > > >       20.33 =C2=B1 11%    +452.5%     112.33 =C2=B1 58%  interrupts=
.CPU64.PMI:Performance_monitoring_interrupts
> > > >       21.00 =C2=B1 16%    +312.7%      86.67 =C2=B1 15%  interrupts=
.CPU65.NMI:Non-maskable_interrupts
> > > >       21.00 =C2=B1 16%    +312.7%      86.67 =C2=B1 15%  interrupts=
.CPU65.PMI:Performance_monitoring_interrupts
> > > >       21.33 =C2=B1 20%    +318.0%      89.17 =C2=B1 12%  interrupts=
.CPU66.NMI:Non-maskable_interrupts
> > > >       21.33 =C2=B1 20%    +318.0%      89.17 =C2=B1 12%  interrupts=
.CPU66.PMI:Performance_monitoring_interrupts
> > > >       11.50 =C2=B1 41%    +523.2%      71.67 =C2=B1143%  interrupts=
.CPU66.RES:Rescheduling_interrupts
> > > >       17.83 =C2=B1 13%    +546.7%     115.33 =C2=B1 50%  interrupts=
.CPU67.NMI:Non-maskable_interrupts
> > > >       17.83 =C2=B1 13%    +546.7%     115.33 =C2=B1 50%  interrupts=
.CPU67.PMI:Performance_monitoring_interrupts
> > > >       18.17 =C2=B1 14%    +384.4%      88.00 =C2=B1 15%  interrupts=
.CPU68.NMI:Non-maskable_interrupts
> > > >       18.17 =C2=B1 14%    +384.4%      88.00 =C2=B1 15%  interrupts=
.CPU68.PMI:Performance_monitoring_interrupts
> > > >       19.00 =C2=B1 16%    +320.2%      79.83 =C2=B1 28%  interrupts=
.CPU69.NMI:Non-maskable_interrupts
> > > >       19.00 =C2=B1 16%    +320.2%      79.83 =C2=B1 28%  interrupts=
.CPU69.PMI:Performance_monitoring_interrupts
> > > >       17.17 =C2=B1 37%    +378.6%      82.17 =C2=B1 29%  interrupts=
.CPU7.NMI:Non-maskable_interrupts
> > > >       17.17 =C2=B1 37%    +378.6%      82.17 =C2=B1 29%  interrupts=
.CPU7.PMI:Performance_monitoring_interrupts
> > > >       17.67 =C2=B1 16%    +401.9%      88.67 =C2=B1 17%  interrupts=
.CPU70.NMI:Non-maskable_interrupts
> > > >       17.67 =C2=B1 16%    +401.9%      88.67 =C2=B1 17%  interrupts=
.CPU70.PMI:Performance_monitoring_interrupts
> > > >       17.17 =C2=B1 21%    +599.0%     120.00 =C2=B1 49%  interrupts=
.CPU73.NMI:Non-maskable_interrupts
> > > >       17.17 =C2=B1 21%    +599.0%     120.00 =C2=B1 49%  interrupts=
.CPU73.PMI:Performance_monitoring_interrupts
> > > >       18.33 =C2=B1 17%    +664.5%     140.17 =C2=B1 60%  interrupts=
.CPU74.NMI:Non-maskable_interrupts
> > > >       18.33 =C2=B1 17%    +664.5%     140.17 =C2=B1 60%  interrupts=
.CPU74.PMI:Performance_monitoring_interrupts
> > > >       24.33 =C2=B1 75%    +266.4%      89.17 =C2=B1 76%  interrupts=
.CPU75.NMI:Non-maskable_interrupts
> > > >       24.33 =C2=B1 75%    +266.4%      89.17 =C2=B1 76%  interrupts=
.CPU75.PMI:Performance_monitoring_interrupts
> > > >       18.67 =C2=B1 24%    +688.4%     147.17 =C2=B1 81%  interrupts=
.CPU76.NMI:Non-maskable_interrupts
> > > >       18.67 =C2=B1 24%    +688.4%     147.17 =C2=B1 81%  interrupts=
.CPU76.PMI:Performance_monitoring_interrupts
> > > >       12.17 =C2=B1 44%    +265.8%      44.50 =C2=B1 76%  interrupts=
.CPU77.RES:Rescheduling_interrupts
> > > >       18.83 =C2=B1 25%    +410.6%      96.17 =C2=B1 36%  interrupts=
.CPU79.NMI:Non-maskable_interrupts
> > > >       18.83 =C2=B1 25%    +410.6%      96.17 =C2=B1 36%  interrupts=
.CPU79.PMI:Performance_monitoring_interrupts
> > > >       19.50 =C2=B1 12%    +582.9%     133.17 =C2=B1 89%  interrupts=
.CPU8.NMI:Non-maskable_interrupts
> > > >       19.50 =C2=B1 12%    +582.9%     133.17 =C2=B1 89%  interrupts=
.CPU8.PMI:Performance_monitoring_interrupts
> > > >        9.67 =C2=B1 34%    +286.2%      37.33 =C2=B1 80%  interrupts=
.CPU80.RES:Rescheduling_interrupts
> > > >       18.00 =C2=B1 26%    +412.0%      92.17 =C2=B1 56%  interrupts=
.CPU82.NMI:Non-maskable_interrupts
> > > >       18.00 =C2=B1 26%    +412.0%      92.17 =C2=B1 56%  interrupts=
.CPU82.PMI:Performance_monitoring_interrupts
> > > >        9.67 =C2=B1 50%    +700.0%      77.33 =C2=B1125%  interrupts=
.CPU82.RES:Rescheduling_interrupts
> > > >       19.17 =C2=B1 36%    +463.5%     108.00 =C2=B1 62%  interrupts=
.CPU84.NMI:Non-maskable_interrupts
> > > >       19.17 =C2=B1 36%    +463.5%     108.00 =C2=B1 62%  interrupts=
.CPU84.PMI:Performance_monitoring_interrupts
> > > >       12.83 =C2=B1 42%    +351.9%      58.00 =C2=B1 64%  interrupts=
.CPU85.RES:Rescheduling_interrupts
> > > >       17.83 =C2=B1 24%    +379.4%      85.50 =C2=B1 48%  interrupts=
.CPU86.NMI:Non-maskable_interrupts
> > > >       17.83 =C2=B1 24%    +379.4%      85.50 =C2=B1 48%  interrupts=
.CPU86.PMI:Performance_monitoring_interrupts
> > > >       17.00 =C2=B1 25%    +597.1%     118.50 =C2=B1 96%  interrupts=
.CPU87.NMI:Non-maskable_interrupts
> > > >       17.00 =C2=B1 25%    +597.1%     118.50 =C2=B1 96%  interrupts=
.CPU87.PMI:Performance_monitoring_interrupts
> > > >       18.33 =C2=B1 27%    +469.1%     104.33 =C2=B1 61%  interrupts=
.CPU9.NMI:Non-maskable_interrupts
> > > >       18.33 =C2=B1 27%    +469.1%     104.33 =C2=B1 61%  interrupts=
.CPU9.PMI:Performance_monitoring_interrupts
> > > >        8.00 =C2=B1 61%    +472.9%      45.83 =C2=B1 66%  interrupts=
.CPU9.RES:Rescheduling_interrupts
> > > >       21.50 =C2=B1 43%    +427.1%     113.33 =C2=B1 68%  interrupts=
.CPU93.NMI:Non-maskable_interrupts
> > > >       21.50 =C2=B1 43%    +427.1%     113.33 =C2=B1 68%  interrupts=
.CPU93.PMI:Performance_monitoring_interrupts
> > > >       39.83 =C2=B1 13%    +853.6%     379.83 =C2=B1 24%  interrupts=
.CPU95.TLB:TLB_shootdowns
> > > >        4076 =C2=B1  9%    +145.6%      10013 =C2=B1  3%  interrupts=
.NMI:Non-maskable_interrupts
> > > >        4076 =C2=B1  9%    +145.6%      10013 =C2=B1  3%  interrupts=
.PMI:Performance_monitoring_interrupts
> > > >        1164 =C2=B1 10%    +192.5%       3404 =C2=B1  3%  interrupts=
.RES:Rescheduling_interrupts
> > > >      844.83 =C2=B1 36%    +122.8%       1882 =C2=B1 17%  interrupts=
.TLB:TLB_shootdowns
> > > >       37.96 =C2=B1 13%     -22.4       15.54 =C2=B1 12%  perf-profi=
le.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle=
.cpu_startup_entry
> > > >       14.65 =C2=B1 12%      -9.1        5.59 =C2=B1  7%  perf-profi=
le.calltrace.cycles-pp.do_execveat_common.__x64_sys_execve.do_syscall_64.en=
try_SYSCALL_64_after_hwframe.execve
> > > >       12.64 =C2=B1 10%      -7.7        4.95 =C2=B1  6%  perf-profi=
le.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
> > > >       11.71 =C2=B1 12%      -7.3        4.36 =C2=B1 11%  perf-profi=
le.calltrace.cycles-pp.bprm_execve.do_execveat_common.__x64_sys_execve.do_s=
yscall_64.entry_SYSCALL_64_after_hwframe
> > > >       11.27 =C2=B1 12%      -6.8        4.46 =C2=B1  8%  perf-profi=
le.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
> > > >       10.12 =C2=B1 14%      -6.6        3.49 =C2=B1 11%  perf-profi=
le.calltrace.cycles-pp.exec_binprm.bprm_execve.do_execveat_common.__x64_sys=
_execve.do_syscall_64
> > > >        9.74 =C2=B1 15%      -6.3        3.40 =C2=B1 12%  perf-profi=
le.calltrace.cycles-pp.load_elf_binary.exec_binprm.bprm_execve.do_execveat_=
common.__x64_sys_execve
> > > >        9.39 =C2=B1 11%      -6.0        3.43 =C2=B1 12%  perf-profi=
le.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.execve
> > > >        9.39 =C2=B1 11%      -6.0        3.43 =C2=B1 12%  perf-profi=
le.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve
> > > >        9.39 =C2=B1 11%      -6.0        3.43 =C2=B1 12%  perf-profi=
le.calltrace.cycles-pp.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe.execve
> > > >        9.39 =C2=B1 11%      -6.0        3.43 =C2=B1 12%  perf-profi=
le.calltrace.cycles-pp.execve
> > > >        5.38 =C2=B1 18%      -3.3        2.13 =C2=B1 12%  perf-profi=
le.calltrace.cycles-pp.asm_exc_page_fault
> > > >        5.32 =C2=B1 16%      -3.1        2.18 =C2=B1  5%  perf-profi=
le.calltrace.cycles-pp.main
> > > >        5.29 =C2=B1 16%      -3.1        2.18 =C2=B1  4%  perf-profi=
le.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.execve.main
> > > >        5.29 =C2=B1 16%      -3.1        2.18 =C2=B1  4%  perf-profi=
le.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve.=
main
> > > >        5.29 =C2=B1 16%      -3.1        2.18 =C2=B1  4%  perf-profi=
le.calltrace.cycles-pp.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe.execve.main
> > > >        5.29 =C2=B1 16%      -3.1        2.18 =C2=B1  4%  perf-profi=
le.calltrace.cycles-pp.execve.main
> > > >        4.19 =C2=B1 17%      -3.1        1.12 =C2=B1 17%  perf-profi=
le.calltrace.cycles-pp.menu_select.do_idle.cpu_startup_entry.start_secondar=
y.secondary_startup_64_no_verify
> > > >        4.65 =C2=B1 15%      -3.0        1.65 =C2=B1 11%  perf-profi=
le.calltrace.cycles-pp.begin_new_exec.load_elf_binary.exec_binprm.bprm_exec=
ve.do_execveat_common
> > > >        4.84 =C2=B1 17%      -2.9        1.95 =C2=B1 15%  perf-profi=
le.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault
> > > >        4.80 =C2=B1 17%      -2.9        1.93 =C2=B1 15%  perf-profi=
le.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
> > > >        4.36 =C2=B1 15%      -2.8        1.51 =C2=B1 11%  perf-profi=
le.calltrace.cycles-pp.mmput.begin_new_exec.load_elf_binary.exec_binprm.bpr=
m_execve
> > > >        4.32 =C2=B1 15%      -2.8        1.51 =C2=B1 11%  perf-profi=
le.calltrace.cycles-pp.exit_mmap.mmput.begin_new_exec.load_elf_binary.exec_=
binprm
> > > >        4.82 =C2=B1 12%      -2.7        2.08 =C2=B1  6%  perf-profi=
le.calltrace.cycles-pp.do_sys_open.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame
> > > >        4.80 =C2=B1 13%      -2.7        2.07 =C2=B1  7%  perf-profi=
le.calltrace.cycles-pp.do_sys_openat2.do_sys_open.do_syscall_64.entry_SYSCA=
LL_64_after_hwframe
> > > >        4.15 =C2=B1 33%      -2.7        1.42 =C2=B1 12%  perf-profi=
le.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault=
.exc_page_fault.asm_exc_page_fault
> > > >        4.07 =C2=B1 18%      -2.5        1.53 =C2=B1 11%  perf-profi=
le.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.as=
m_exc_page_fault
> > > >        3.94 =C2=B1 13%      -2.2        1.70 =C2=B1  4%  perf-profi=
le.calltrace.cycles-pp.do_filp_open.do_sys_openat2.do_sys_open.do_syscall_6=
4.entry_SYSCALL_64_after_hwframe
> > > >        3.91 =C2=B1 13%      -2.2        1.68 =C2=B1  4%  perf-profi=
le.calltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.do_sys_open.=
do_syscall_64
> > > >        2.63 =C2=B1 24%      -1.7        0.90 =C2=B1 17%  perf-profi=
le.calltrace.cycles-pp.do_fault.__handle_mm_fault.handle_mm_fault.do_user_a=
ddr_fault.exc_page_fault
> > > >        2.23 =C2=B1 17%      -1.4        0.81 =C2=B1 11%  perf-profi=
le.calltrace.cycles-pp.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_=
apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
> > > >        2.15 =C2=B1  7%      -1.4        0.74 =C2=B1 14%  perf-profi=
le.calltrace.cycles-pp.unmap_vmas.exit_mmap.mmput.begin_new_exec.load_elf_b=
inary
> > > >        2.09 =C2=B1  6%      -1.4        0.73 =C2=B1 14%  perf-profi=
le.calltrace.cycles-pp.unmap_page_range.unmap_vmas.exit_mmap.mmput.begin_ne=
w_exec
> > > >        2.40 =C2=B1 19%      -1.3        1.05 =C2=B1 47%  perf-profi=
le.calltrace.cycles-pp.irq_work_run_list.irq_work_run.__sysvec_irq_work.sys=
vec_irq_work.asm_sysvec_irq_work
> > > >        2.40 =C2=B1 19%      -1.3        1.05 =C2=B1 47%  perf-profi=
le.calltrace.cycles-pp.irq_work_single.irq_work_run_list.irq_work_run.__sys=
vec_irq_work.sysvec_irq_work
> > > >        2.40 =C2=B1 19%      -1.3        1.05 =C2=B1 47%  perf-profi=
le.calltrace.cycles-pp.printk.irq_work_single.irq_work_run_list.irq_work_ru=
n.__sysvec_irq_work
> > > >        2.40 =C2=B1 19%      -1.3        1.05 =C2=B1 47%  perf-profi=
le.calltrace.cycles-pp.vprintk_emit.printk.irq_work_single.irq_work_run_lis=
t.irq_work_run
> > > >        2.40 =C2=B1 19%      -1.3        1.05 =C2=B1 47%  perf-profi=
le.calltrace.cycles-pp.console_unlock.vprintk_emit.printk.irq_work_single.i=
rq_work_run_list
> > > >        2.03 =C2=B1 13%      -1.3        0.69 =C2=B1  8%  perf-profi=
le.calltrace.cycles-pp.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after=
_hwframe
> > > >        2.00 =C2=B1 11%      -1.3        0.68 =C2=B1  7%  perf-profi=
le.calltrace.cycles-pp.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SY=
SCALL_64_after_hwframe
> > > >        2.31 =C2=B1 19%      -1.3        1.00 =C2=B1 47%  perf-profi=
le.calltrace.cycles-pp.serial8250_console_write.console_unlock.vprintk_emit=
.printk.irq_work_single
> > > >        2.02 =C2=B1 13%      -1.3        0.75 =C2=B1 18%  perf-profi=
le.calltrace.cycles-pp.filemap_map_pages.do_fault.__handle_mm_fault.handle_=
mm_fault.do_user_addr_fault
> > > >        2.25 =C2=B1 19%      -1.3        0.98 =C2=B1 47%  perf-profi=
le.calltrace.cycles-pp.uart_console_write.serial8250_console_write.console_=
unlock.vprintk_emit.printk
> > > >        1.90 =C2=B1  7%      -1.2        0.66 =C2=B1 16%  perf-profi=
le.calltrace.cycles-pp.zap_pte_range.unmap_page_range.unmap_vmas.exit_mmap.=
mmput
> > > >        1.87 =C2=B1 10%      -1.2        0.64 =C2=B1  7%  perf-profi=
le.calltrace.cycles-pp.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.=
entry_SYSCALL_64_after_hwframe
> > > >        2.22 =C2=B1 13%      -1.2        1.02 =C2=B1 15%  perf-profi=
le.calltrace.cycles-pp.link_path_walk.path_openat.do_filp_open.do_sys_opena=
t2.do_sys_open
> > > >        2.13 =C2=B1 19%      -1.2        0.94 =C2=B1 47%  perf-profi=
le.calltrace.cycles-pp.wait_for_xmitr.serial8250_console_putchar.uart_conso=
le_write.serial8250_console_write.console_unlock
> > > >        2.13 =C2=B1 19%      -1.2        0.94 =C2=B1 47%  perf-profi=
le.calltrace.cycles-pp.serial8250_console_putchar.uart_console_write.serial=
8250_console_write.console_unlock.vprintk_emit
> > > >        1.68 =C2=B1 11%      -1.2        0.49 =C2=B1 44%  perf-profi=
le.calltrace.cycles-pp.mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do=
_syscall_64
> > > >        1.97 =C2=B1 10%      -1.1        0.91 =C2=B1 16%  perf-profi=
le.calltrace.cycles-pp.walk_component.link_path_walk.path_openat.do_filp_op=
en.do_sys_openat2
> > > >        1.40 =C2=B1 15%      -1.0        0.36 =C2=B1 71%  perf-profi=
le.calltrace.cycles-pp.ret_from_fork
> > > >        1.40 =C2=B1 15%      -1.0        0.36 =C2=B1 71%  perf-profi=
le.calltrace.cycles-pp.kthread.ret_from_fork
> > > >        1.85 =C2=B1  9%      -1.0        0.82 =C2=B1 23%  perf-profi=
le.calltrace.cycles-pp.__do_sys_newstat.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe
> > > >        1.84 =C2=B1 10%      -1.0        0.81 =C2=B1 22%  perf-profi=
le.calltrace.cycles-pp.vfs_statx.__do_sys_newstat.do_syscall_64.entry_SYSCA=
LL_64_after_hwframe
> > > >        1.28 =C2=B1 29%      -1.0        0.26 =C2=B1100%  perf-profi=
le.calltrace.cycles-pp.sched_exec.bprm_execve.do_execveat_common.__x64_sys_=
execve.do_syscall_64
> > > >        1.65 =C2=B1 15%      -1.0        0.64 =C2=B1 11%  perf-profi=
le.calltrace.cycles-pp.__softirqentry_text_start.irq_exit_rcu.sysvec_apic_t=
imer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
> > > >        1.34 =C2=B1 31%      -1.0        0.35 =C2=B1107%  perf-profi=
le.calltrace.cycles-pp.load_elf_interp.load_elf_binary.exec_binprm.bprm_exe=
cve.do_execveat_common
> > > >        1.71 =C2=B1 28%      -1.0        0.73 =C2=B1 47%  perf-profi=
le.calltrace.cycles-pp.io_serial_in.wait_for_xmitr.serial8250_console_putch=
ar.uart_console_write.serial8250_console_write
> > > >        1.80 =C2=B1 13%      -1.0        0.84 =C2=B1 12%  perf-profi=
le.calltrace.cycles-pp.copy_strings.do_execveat_common.__x64_sys_execve.do_=
syscall_64.entry_SYSCALL_64_after_hwframe
> > > >        1.55 =C2=B1 10%      -0.9        0.62 =C2=B1 50%  perf-profi=
le.calltrace.cycles-pp.filename_lookup.vfs_statx.__do_sys_newstat.do_syscal=
l_64.entry_SYSCALL_64_after_hwframe
> > > >        1.51 =C2=B1 12%      -0.9        0.60 =C2=B1 50%  perf-profi=
le.calltrace.cycles-pp.path_lookupat.filename_lookup.vfs_statx.__do_sys_new=
stat.do_syscall_64
> > > >        1.22 =C2=B1 18%      -0.8        0.43 =C2=B1 75%  perf-profi=
le.calltrace.cycles-pp.link_path_walk.path_lookupat.filename_lookup.vfs_sta=
tx.__do_sys_newstat
> > > >        0.73 =C2=B1 21%      +2.3        3.07 =C2=B1  7%  perf-profi=
le.calltrace.cycles-pp.perf_mux_hrtimer_handler.__hrtimer_run_queues.hrtime=
r_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
> > > >        0.00            +2.8        2.80 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.read_hpet.ktime_get.perf_mux_hrtimer_handler.__hrtimer_ru=
n_queues.hrtimer_interrupt
> > > >        0.00            +2.8        2.84 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.ktime_get.perf_mux_hrtimer_handler.__hrtimer_run_queues.h=
rtimer_interrupt.__sysvec_apic_timer_interrupt
> > > >        2.52 =C2=B1 14%      +3.5        6.06 =C2=B1  7%  perf-profi=
le.calltrace.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_que=
ues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
> > > >        2.35 =C2=B1 11%      +3.7        6.05 =C2=B1  7%  perf-profi=
le.calltrace.cycles-pp.update_process_times.tick_sched_handle.tick_sched_ti=
mer.__hrtimer_run_queues.hrtimer_interrupt
> > > >        0.00            +4.5        4.51 =C2=B1  3%  perf-profile.ca=
lltrace.cycles-pp.read_hpet.ktime_get.tick_sched_timer.__hrtimer_run_queues=
.hrtimer_interrupt
> > > >        1.23 =C2=B1 11%      +4.5        5.77 =C2=B1  6%  perf-profi=
le.calltrace.cycles-pp.scheduler_tick.update_process_times.tick_sched_handl=
e.tick_sched_timer.__hrtimer_run_queues
> > > >        0.00            +4.6        4.64 =C2=B1  3%  perf-profile.ca=
lltrace.cycles-pp.ktime_get.tick_sched_timer.__hrtimer_run_queues.hrtimer_i=
nterrupt.__sysvec_apic_timer_interrupt
> > > >        0.00            +4.9        4.94 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.read_hpet.ktime_get.sched_clock_tick.scheduler_tick.updat=
e_process_times
> > > >        0.00            +5.3        5.30 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.ktime_get.sched_clock_tick.scheduler_tick.update_process_=
times.tick_sched_handle
> > > >        0.00            +5.3        5.33 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.sched_clock_tick.scheduler_tick.update_process_times.tick=
_sched_handle.tick_sched_timer
> > > >        0.00            +6.2        6.22 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.read_hpet.ktime_get.sched_clock_tick.sched_clock_idle_wak=
eup_event.cpuidle_enter_state
> > > >        0.00            +6.3        6.29 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.ktime_get.sched_clock_tick.sched_clock_idle_wakeup_event.=
cpuidle_enter_state.cpuidle_enter
> > > >        0.00            +6.4        6.35 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.sched_clock_tick.sched_clock_idle_wakeup_event.cpuidle_en=
ter_state.cpuidle_enter.do_idle
> > > >        0.00            +6.5        6.48 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.sched_clock_idle_wakeup_event.cpuidle_enter_state.cpuidle=
_enter.do_idle.cpu_startup_entry
> > > >        0.59 =C2=B1 80%      +6.8        7.38 =C2=B1  4%  perf-profi=
le.calltrace.cycles-pp.tick_nohz_irq_exit.sysvec_apic_timer_interrupt.asm_s=
ysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
> > > >        0.49 =C2=B1103%      +6.9        7.37 =C2=B1  4%  perf-profi=
le.calltrace.cycles-pp.ktime_get.tick_nohz_irq_exit.sysvec_apic_timer_inter=
rupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
> > > >        1.78 =C2=B1 19%      +7.1        8.90 =C2=B1  2%  perf-profi=
le.calltrace.cycles-pp.clockevents_program_event.hrtimer_interrupt.__sysvec=
_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_int=
errupt
> > > >        0.00            +7.1        7.13 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.read_hpet.ktime_get.tick_nohz_irq_exit.sysvec_apic_timer_=
interrupt.asm_sysvec_apic_timer_interrupt
> > > >        0.61 =C2=B1 51%      +7.4        8.06 =C2=B1  3%  perf-profi=
le.calltrace.cycles-pp.ktime_get.tick_irq_enter.irq_enter_rcu.sysvec_apic_t=
imer_interrupt.asm_sysvec_apic_timer_interrupt
> > > >        0.98 =C2=B1 49%      +7.6        8.54 =C2=B1  2%  perf-profi=
le.calltrace.cycles-pp.ktime_get.clockevents_program_event.hrtimer_interrup=
t.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
> > > >        2.93 =C2=B1 12%      +7.9       10.80 =C2=B1  4%  perf-profi=
le.calltrace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interr=
upt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
> > > >        0.00            +8.0        7.97 =C2=B1  3%  perf-profile.ca=
lltrace.cycles-pp.read_hpet.ktime_get.tick_irq_enter.irq_enter_rcu.sysvec_a=
pic_timer_interrupt
> > > >        0.00            +8.0        8.02 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.read_hpet.ktime_get.clockevents_program_event.hrtimer_int=
errupt.__sysvec_apic_timer_interrupt
> > > >        0.00            +8.3        8.31 =C2=B1  3%  perf-profile.ca=
lltrace.cycles-pp.read_hpet.ktime_get.sched_clock_tick.sched_clock_idle_wak=
eup_event.tick_irq_enter
> > > >        0.00            +8.4        8.39 =C2=B1  3%  perf-profile.ca=
lltrace.cycles-pp.ktime_get.sched_clock_tick.sched_clock_idle_wakeup_event.=
tick_irq_enter.irq_enter_rcu
> > > >        0.00            +8.4        8.44 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.read_hpet.ktime_get_update_offsets_now.hrtimer_interrupt.=
__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
> > > >        0.09 =C2=B1223%      +8.5        8.56 =C2=B1  2%  perf-profi=
le.calltrace.cycles-pp.ktime_get_update_offsets_now.hrtimer_interrupt.__sys=
vec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_=
interrupt
> > > >        0.00            +8.5        8.47 =C2=B1  3%  perf-profile.ca=
lltrace.cycles-pp.sched_clock_tick.sched_clock_idle_wakeup_event.tick_irq_e=
nter.irq_enter_rcu.sysvec_apic_timer_interrupt
> > > >        0.00            +8.6        8.61 =C2=B1  3%  perf-profile.ca=
lltrace.cycles-pp.sched_clock_idle_wakeup_event.tick_irq_enter.irq_enter_rc=
u.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
> > > >        4.41 =C2=B1 17%      +9.8       14.19 =C2=B1  4%  perf-profi=
le.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic=
_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
> > > >        1.23 =C2=B1 22%     +15.5       16.78 =C2=B1  3%  perf-profi=
le.calltrace.cycles-pp.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec=
_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
> > > >        1.20 =C2=B1 24%     +15.6       16.77 =C2=B1  3%  perf-profi=
le.calltrace.cycles-pp.tick_irq_enter.irq_enter_rcu.sysvec_apic_timer_inter=
rupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
> > > >       59.83 =C2=B1  5%     +23.6       83.45        perf-profile.ca=
lltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no=
_verify
> > > >       59.83 =C2=B1  5%     +23.6       83.45        perf-profile.ca=
lltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
> > > >       59.80 =C2=B1  5%     +23.6       83.43        perf-profile.ca=
lltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_start=
up_64_no_verify
> > > >       60.74 =C2=B1  5%     +23.7       84.46        perf-profile.ca=
lltrace.cycles-pp.secondary_startup_64_no_verify
> > > >        7.40 =C2=B1 11%     +24.7       32.10 =C2=B1  2%  perf-profi=
le.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_inte=
rrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
> > > >        7.27 =C2=B1 11%     +24.8       32.06 =C2=B1  2%  perf-profi=
le.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysv=
ec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
> > > >       54.60 =C2=B1  6%     +27.4       81.97        perf-profile.ca=
lltrace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.s=
econdary_startup_64_no_verify
> > > >       53.26 =C2=B1  7%     +28.0       81.27        perf-profile.ca=
lltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_ent=
ry.start_secondary
> > > >       15.89 =C2=B1  8%     +43.1       59.00        perf-profile.ca=
lltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuid=
le_enter.do_idle.cpu_startup_entry
> > > >       12.01 =C2=B1  6%     +45.5       57.50        perf-profile.ca=
lltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interru=
pt.cpuidle_enter_state.cpuidle_enter.do_idle
> > > >       38.06 =C2=B1 13%     -22.4       15.66 =C2=B1 11%  perf-profi=
le.children.cycles-pp.intel_idle
> > > >       27.72 =C2=B1  8%     -17.0       10.74 =C2=B1  5%  perf-profi=
le.children.cycles-pp.entry_SYSCALL_64_after_hwframe
> > > >       26.32 =C2=B1 10%     -16.1       10.24 =C2=B1  6%  perf-profi=
le.children.cycles-pp.do_syscall_64
> > > >       14.71 =C2=B1 12%      -9.1        5.61 =C2=B1  7%  perf-profi=
le.children.cycles-pp.__x64_sys_execve
> > > >       14.68 =C2=B1 12%      -9.1        5.60 =C2=B1  7%  perf-profi=
le.children.cycles-pp.execve
> > > >       14.67 =C2=B1 12%      -9.1        5.60 =C2=B1  7%  perf-profi=
le.children.cycles-pp.do_execveat_common
> > > >       11.72 =C2=B1 12%      -7.3        4.37 =C2=B1 11%  perf-profi=
le.children.cycles-pp.bprm_execve
> > > >       10.12 =C2=B1 14%      -6.4        3.71 =C2=B1 10%  perf-profi=
le.children.cycles-pp.exec_binprm
> > > >       10.05 =C2=B1 14%      -6.4        3.67 =C2=B1 11%  perf-profi=
le.children.cycles-pp.load_elf_binary
> > > >        8.40 =C2=B1 19%      -5.1        3.32 =C2=B1  9%  perf-profi=
le.children.cycles-pp.asm_exc_page_fault
> > > >        7.42 =C2=B1 19%      -4.4        2.99 =C2=B1 11%  perf-profi=
le.children.cycles-pp.exc_page_fault
> > > >        7.38 =C2=B1 19%      -4.4        2.96 =C2=B1 11%  perf-profi=
le.children.cycles-pp.do_user_addr_fault
> > > >        6.70 =C2=B1 20%      -4.1        2.55 =C2=B1  6%  perf-profi=
le.children.cycles-pp.handle_mm_fault
> > > >        6.34 =C2=B1 21%      -4.0        2.39 =C2=B1  8%  perf-profi=
le.children.cycles-pp.__handle_mm_fault
> > > >        5.50 =C2=B1 14%      -3.3        2.21 =C2=B1  4%  perf-profi=
le.children.cycles-pp.main
> > > >        4.25 =C2=B1 17%      -3.1        1.14 =C2=B1 16%  perf-profi=
le.children.cycles-pp.menu_select
> > > >        4.78 =C2=B1 15%      -3.1        1.69 =C2=B1 12%  perf-profi=
le.children.cycles-pp.begin_new_exec
> > > >        4.44 =C2=B1 16%      -2.9        1.54 =C2=B1 11%  perf-profi=
le.children.cycles-pp.mmput
> > > >        4.40 =C2=B1 16%      -2.9        1.53 =C2=B1 11%  perf-profi=
le.children.cycles-pp.exit_mmap
> > > >        4.86 =C2=B1 12%      -2.8        2.09 =C2=B1  6%  perf-profi=
le.children.cycles-pp.do_sys_open
> > > >        4.84 =C2=B1 13%      -2.8        2.08 =C2=B1  6%  perf-profi=
le.children.cycles-pp.do_sys_openat2
> > > >        4.38 =C2=B1 15%      -2.7        1.63 =C2=B1 10%  perf-profi=
le.children.cycles-pp.do_fault
> > > >        4.29 =C2=B1 14%      -2.4        1.92 =C2=B1  5%  perf-profi=
le.children.cycles-pp.do_filp_open
> > > >        4.26 =C2=B1 13%      -2.4        1.91 =C2=B1  5%  perf-profi=
le.children.cycles-pp.path_openat
> > > >        3.39 =C2=B1  8%      -2.1        1.30 =C2=B1 11%  perf-profi=
le.children.cycles-pp.filemap_map_pages
> > > >        3.46 =C2=B1 16%      -1.9        1.52 =C2=B1 11%  perf-profi=
le.children.cycles-pp.walk_component
> > > >        3.58 =C2=B1 15%      -1.9        1.67 =C2=B1 13%  perf-profi=
le.children.cycles-pp.link_path_walk
> > > >        2.95 =C2=B1 12%      -1.7        1.21 =C2=B1 13%  perf-profi=
le.children.cycles-pp.vm_mmap_pgoff
> > > >        2.63 =C2=B1  9%      -1.7        0.98 =C2=B1  8%  perf-profi=
le.children.cycles-pp.__softirqentry_text_start
> > > >        2.72 =C2=B1 12%      -1.7        1.07 =C2=B1  9%  perf-profi=
le.children.cycles-pp.do_mmap
> > > >        2.42 =C2=B1  7%      -1.6        0.83 =C2=B1 13%  perf-profi=
le.children.cycles-pp.unmap_vmas
> > > >        2.58 =C2=B1 16%      -1.5        1.05 =C2=B1 10%  perf-profi=
le.children.cycles-pp.irq_exit_rcu
> > > >        2.33 =C2=B1  6%      -1.5        0.81 =C2=B1 13%  perf-profi=
le.children.cycles-pp.unmap_page_range
> > > >        1.91 =C2=B1 19%      -1.5        0.43 =C2=B1 18%  perf-profi=
le.children.cycles-pp.tick_nohz_get_sleep_length
> > > >        2.43 =C2=B1 13%      -1.5        0.96 =C2=B1 10%  perf-profi=
le.children.cycles-pp.mmap_region
> > > >        2.12 =C2=B1  5%      -1.4        0.73 =C2=B1 14%  perf-profi=
le.children.cycles-pp.zap_pte_range
> > > >        2.18 =C2=B1 13%      -1.4        0.80 =C2=B1  9%  perf-profi=
le.children.cycles-pp.kmem_cache_alloc
> > > >        2.04 =C2=B1 12%      -1.3        0.70 =C2=B1  7%  perf-profi=
le.children.cycles-pp.ksys_mmap_pgoff
> > > >        2.04 =C2=B1 34%      -1.2        0.79 =C2=B1 19%  perf-profi=
le.children.cycles-pp.filename_lookup
> > > >        1.53 =C2=B1 27%      -1.2        0.29 =C2=B1 17%  perf-profi=
le.children.cycles-pp.tick_nohz_next_event
> > > >        1.78 =C2=B1 18%      -1.1        0.68 =C2=B1 11%  perf-profi=
le.children.cycles-pp.__lookup_slow
> > > >        1.50 =C2=B1 20%      -1.1        0.41 =C2=B1 25%  perf-profi=
le.children.cycles-pp.kmem_cache_free
> > > >        1.84 =C2=B1 21%      -1.1        0.77 =C2=B1 19%  perf-profi=
le.children.cycles-pp.path_lookupat
> > > >        1.56 =C2=B1 24%      -1.0        0.51 =C2=B1 13%  perf-profi=
le.children.cycles-pp.__do_munmap
> > > >        1.86 =C2=B1  9%      -1.0        0.82 =C2=B1 23%  perf-profi=
le.children.cycles-pp.__do_sys_newstat
> > > >        1.84 =C2=B1  9%      -1.0        0.81 =C2=B1 22%  perf-profi=
le.children.cycles-pp.vfs_statx
> > > >        1.42 =C2=B1 59%      -1.0        0.41 =C2=B1 15%  perf-profi=
le.children.cycles-pp.tlb_finish_mmu
> > > >        1.40 =C2=B1 60%      -1.0        0.40 =C2=B1 16%  perf-profi=
le.children.cycles-pp.tlb_flush_mmu
> > > >        1.81 =C2=B1 14%      -0.9        0.86 =C2=B1 12%  perf-profi=
le.children.cycles-pp.copy_strings
> > > >        1.45 =C2=B1  2%      -0.9        0.52 =C2=B1 14%  perf-profi=
le.children.cycles-pp.next_uptodate_page
> > > >        1.40 =C2=B1 15%      -0.9        0.50 =C2=B1 14%  perf-profi=
le.children.cycles-pp.kthread
> > > >        1.40 =C2=B1 15%      -0.9        0.50 =C2=B1 15%  perf-profi=
le.children.cycles-pp.ret_from_fork
> > > >        1.49 =C2=B1 14%      -0.9        0.59 =C2=B1 15%  perf-profi=
le.children.cycles-pp.native_irq_return_iret
> > > >        1.19 =C2=B1 70%      -0.9        0.32 =C2=B1 17%  perf-profi=
le.children.cycles-pp.release_pages
> > > >        1.93 =C2=B1 20%      -0.9        1.08 =C2=B1  8%  perf-profi=
le.children.cycles-pp.io_serial_in
> > > >        2.31 =C2=B1 19%      -0.8        1.47 =C2=B1  6%  perf-profi=
le.children.cycles-pp.serial8250_console_write
> > > >        1.22 =C2=B1  3%      -0.8        0.39 =C2=B1 10%  perf-profi=
le.children.cycles-pp.rcu_core
> > > >        1.26 =C2=B1 11%      -0.8        0.43 =C2=B1 16%  perf-profi=
le.children.cycles-pp.create_elf_tables
> > > >        1.28 =C2=B1 30%      -0.8        0.49 =C2=B1  7%  perf-profi=
le.children.cycles-pp.sched_exec
> > > >        1.23 =C2=B1 10%      -0.8        0.44 =C2=B1 10%  perf-profi=
le.children.cycles-pp._raw_spin_lock
> > > >        1.22 =C2=B1 25%      -0.8        0.44 =C2=B1 17%  perf-profi=
le.children.cycles-pp.d_alloc_parallel
> > > >        1.42 =C2=B1 29%      -0.8        0.64 =C2=B1 26%  perf-profi=
le.children.cycles-pp.elf_map
> > > >        1.34 =C2=B1 31%      -0.8        0.57 =C2=B1 33%  perf-profi=
le.children.cycles-pp.load_elf_interp
> > > >        1.15 =C2=B1 15%      -0.7        0.42 =C2=B1  5%  perf-profi=
le.children.cycles-pp.select_task_rq_fair
> > > >        1.11 =C2=B1 13%      -0.7        0.41 =C2=B1 20%  perf-profi=
le.children.cycles-pp.strnlen_user
> > > >        1.10 =C2=B1 17%      -0.7        0.41 =C2=B1  6%  perf-profi=
le.children.cycles-pp.find_idlest_group
> > > >        1.27 =C2=B1 19%      -0.7        0.58 =C2=B1 36%  perf-profi=
le.children.cycles-pp.dput
> > > >        1.03 =C2=B1 35%      -0.7        0.36 =C2=B1 15%  perf-profi=
le.children.cycles-pp.d_alloc
> > > >        1.06 =C2=B1 47%      -0.7        0.40 =C2=B1 11%  perf-profi=
le.children.cycles-pp.__alloc_pages_nodemask
> > > >        0.97 =C2=B1  7%      -0.7        0.32 =C2=B1 16%  perf-profi=
le.children.cycles-pp.rcu_do_batch
> > > >        0.78 =C2=B1 94%      -0.7        0.13 =C2=B1 25%  perf-profi=
le.children.cycles-pp.do_faccessat
> > > >        0.99 =C2=B1 34%      -0.6        0.35 =C2=B1  8%  perf-profi=
le.children.cycles-pp.__split_vma
> > > >        0.95 =C2=B1 56%      -0.6        0.34 =C2=B1 21%  perf-profi=
le.children.cycles-pp.__clear_user
> > > >        0.99 =C2=B1 19%      -0.6        0.38 =C2=B1 10%  perf-profi=
le.children.cycles-pp.perf_event_mmap
> > > >        0.73 =C2=B1 17%      -0.6        0.13 =C2=B1 31%  perf-profi=
le.children.cycles-pp.smpboot_thread_fn
> > > >        0.98 =C2=B1 20%      -0.6        0.38 =C2=B1 10%  perf-profi=
le.children.cycles-pp.exit_to_user_mode_prepare
> > > >        0.92 =C2=B1 18%      -0.6        0.34 =C2=B1 14%  perf-profi=
le.children.cycles-pp.___might_sleep
> > > >        0.85 =C2=B1 35%      -0.6        0.28 =C2=B1 17%  perf-profi=
le.children.cycles-pp.__d_alloc
> > > >        0.69 =C2=B1 24%      -0.6        0.12 =C2=B1 17%  perf-profi=
le.children.cycles-pp.irqtime_account_irq
> > > >        0.99 =C2=B1 32%      -0.6        0.44 =C2=B1 14%  perf-profi=
le.children.cycles-pp.__x64_sys_mprotect
> > > >        0.93 =C2=B1 19%      -0.6        0.38 =C2=B1 19%  perf-profi=
le.children.cycles-pp.alloc_empty_file
> > > >        0.99 =C2=B1 32%      -0.6        0.44 =C2=B1 14%  perf-profi=
le.children.cycles-pp.do_mprotect_pkey
> > > >        0.79 =C2=B1 41%      -0.5        0.24 =C2=B1 26%  perf-profi=
le.children.cycles-pp.__vm_munmap
> > > >        0.90 =C2=B1 21%      -0.5        0.36 =C2=B1 17%  perf-profi=
le.children.cycles-pp.__alloc_file
> > > >        0.79 =C2=B1 37%      -0.5        0.26 =C2=B1 13%  perf-profi=
le.children.cycles-pp.__vma_adjust
> > > >        0.65 =C2=B1 10%      -0.5        0.12 =C2=B1 32%  perf-profi=
le.children.cycles-pp.run_ksoftirqd
> > > >        0.91 =C2=B1 45%      -0.5        0.38 =C2=B1 23%  perf-profi=
le.children.cycles-pp.do_set_pte
> > > >        0.86 =C2=B1 16%      -0.5        0.35 =C2=B1 24%  perf-profi=
le.children.cycles-pp.getname_flags
> > > >        0.90 =C2=B1 33%      -0.5        0.40 =C2=B1 13%  perf-profi=
le.children.cycles-pp.mprotect_fixup
> > > >        1.02 =C2=B1 11%      -0.5        0.54 =C2=B1 33%  perf-profi=
le.children.cycles-pp.step_into
> > > >        0.70 =C2=B1 56%      -0.5        0.23 =C2=B1 19%  perf-profi=
le.children.cycles-pp.wp_page_copy
> > > >        0.73 =C2=B1 33%      -0.5        0.26 =C2=B1 18%  perf-profi=
le.children.cycles-pp.task_work_run
> > > >        0.83 =C2=B1 23%      -0.5        0.37 =C2=B1 14%  perf-profi=
le.children.cycles-pp.rebalance_domains
> > > >        0.71 =C2=B1 21%      -0.4        0.28 =C2=B1 21%  perf-profi=
le.children.cycles-pp.unmap_region
> > > >        0.71 =C2=B1 16%      -0.4        0.28 =C2=B1 17%  perf-profi=
le.children.cycles-pp.do_anonymous_page
> > > >        0.61 =C2=B1 13%      -0.4        0.19 =C2=B1 30%  perf-profi=
le.children.cycles-pp.get_user_arg_ptr
> > > >        0.67 =C2=B1 15%      -0.4        0.25 =C2=B1 22%  perf-profi=
le.children.cycles-pp.strncpy_from_user
> > > >        0.67 =C2=B1  8%      -0.4        0.26 =C2=B1 14%  perf-profi=
le.children.cycles-pp.free_pgtables
> > > >        0.51 =C2=B1 80%      -0.4        0.11 =C2=B1 13%  perf-profi=
le.children.cycles-pp.flush_tlb_mm_range
> > > >        0.53 =C2=B1 70%      -0.4        0.16 =C2=B1 15%  perf-profi=
le.children.cycles-pp.__cond_resched
> > > >        0.57 =C2=B1 58%      -0.4        0.20 =C2=B1 30%  perf-profi=
le.children.cycles-pp.page_add_file_rmap
> > > >        0.51 =C2=B1 53%      -0.4        0.13 =C2=B1 37%  perf-profi=
le.children.cycles-pp.terminate_walk
> > > >        0.58 =C2=B1 23%      -0.4        0.23 =C2=B1 30%  perf-profi=
le.children.cycles-pp.page_remove_rmap
> > > >        0.55 =C2=B1  9%      -0.4        0.20 =C2=B1 17%  perf-profi=
le.children.cycles-pp.time
> > > >        0.59 =C2=B1 17%      -0.3        0.24 =C2=B1 15%  perf-profi=
le.children.cycles-pp.simple_lookup
> > > >        0.48 =C2=B1 57%      -0.3        0.13 =C2=B1 26%  perf-profi=
le.children.cycles-pp.__fput
> > > >        0.55 =C2=B1 17%      -0.3        0.21 =C2=B1 14%  perf-profi=
le.children.cycles-pp.d_add
> > > >        0.70 =C2=B1 13%      -0.3        0.37 =C2=B1  9%  perf-profi=
le.children.cycles-pp.lapic_next_deadline
> > > >        0.59 =C2=B1 23%      -0.3        0.26 =C2=B1 21%  perf-profi=
le.children.cycles-pp.lookup_fast
> > > >        0.44 =C2=B1 63%      -0.3        0.11 =C2=B1 45%  perf-profi=
le.children.cycles-pp.vm_area_alloc
> > > >        0.45 =C2=B1 78%      -0.3        0.12 =C2=B1 17%  perf-profi=
le.children.cycles-pp.vma_interval_tree_insert
> > > >        0.51 =C2=B1 25%      -0.3        0.19 =C2=B1 29%  perf-profi=
le.children.cycles-pp.find_vma
> > > >        0.53 =C2=B1 23%      -0.3        0.21 =C2=B1 26%  perf-profi=
le.children.cycles-pp.sync_regs
> > > >        0.40 =C2=B1 96%      -0.3        0.09 =C2=B1 45%  perf-profi=
le.children.cycles-pp.__memcg_kmem_charge
> > > >        0.49 =C2=B1 25%      -0.3        0.17 =C2=B1 20%  perf-profi=
le.children.cycles-pp._IO_vfscanf
> > > >        0.42 =C2=B1 90%      -0.3        0.10 =C2=B1 10%  perf-profi=
le.children.cycles-pp.__do_fault
> > > >        0.47 =C2=B1 25%      -0.3        0.16 =C2=B1 23%  perf-profi=
le.children.cycles-pp.count
> > > >        0.48 =C2=B1 22%      -0.3        0.18 =C2=B1 34%  perf-profi=
le.children.cycles-pp.rcu_sched_clock_irq
> > > >        0.40 =C2=B1 27%      -0.3        0.10 =C2=B1 45%  perf-profi=
le.children.cycles-pp.rcu_idle_exit
> > > >        0.41 =C2=B1 12%      -0.3        0.11 =C2=B1 18%  perf-profi=
le.children.cycles-pp.__get_user_8
> > > >        0.50 =C2=B1 27%      -0.3        0.20 =C2=B1 12%  perf-profi=
le.children.cycles-pp.vma_link
> > > >        0.45 =C2=B1 18%      -0.3        0.15 =C2=B1 22%  perf-profi=
le.children.cycles-pp.unlock_page
> > > >        0.51 =C2=B1 19%      -0.3        0.23 =C2=B1 16%  perf-profi=
le.children.cycles-pp.load_balance
> > > >        0.44 =C2=B1 23%      -0.3        0.17 =C2=B1 36%  perf-profi=
le.children.cycles-pp.__might_fault
> > > >        0.41 =C2=B1 93%      -0.3        0.14 =C2=B1 33%  perf-profi=
le.children.cycles-pp.pte_alloc_one
> > > >        0.46 =C2=B1 20%      -0.3        0.19 =C2=B1 21%  perf-profi=
le.children.cycles-pp.perf_iterate_sb
> > > >        0.47 =C2=B1 19%      -0.3        0.20 =C2=B1 39%  perf-profi=
le.children.cycles-pp._raw_spin_lock_irqsave
> > > >        0.41 =C2=B1 31%      -0.3        0.14 =C2=B1 48%  perf-profi=
le.children.cycles-pp.setup_arg_pages
> > > >        0.53 =C2=B1 24%      -0.3        0.26 =C2=B1 49%  perf-profi=
le.children.cycles-pp.__dentry_kill
> > > >        0.33 =C2=B1104%      -0.3        0.06 =C2=B1 48%  perf-profi=
le.children.cycles-pp.rcu_all_qs
> > > >        0.37 =C2=B1 12%      -0.3        0.10 =C2=B1 61%  perf-profi=
le.children.cycles-pp.__perf_sw_event
> > > >        0.49 =C2=B1 29%      -0.3        0.23 =C2=B1 11%  perf-profi=
le.children.cycles-pp.get_arg_page
> > > >        0.51 =C2=B1 27%      -0.3        0.25 =C2=B1 10%  perf-profi=
le.children.cycles-pp.get_page_from_freelist
> > > >        0.48 =C2=B1 27%      -0.3        0.22 =C2=B1 11%  perf-profi=
le.children.cycles-pp.__get_user_pages
> > > >        0.42 =C2=B1 23%      -0.3        0.15 =C2=B1 32%  perf-profi=
le.children.cycles-pp.__might_sleep
> > > >        0.49 =C2=B1 28%      -0.3        0.22 =C2=B1  9%  perf-profi=
le.children.cycles-pp.__get_user_pages_remote
> > > >        0.32 =C2=B1107%      -0.3        0.06 =C2=B1 45%  perf-profi=
le.children.cycles-pp.filemap_read
> > > >        0.40 =C2=B1 30%      -0.3        0.15 =C2=B1 17%  perf-profi=
le.children.cycles-pp.get_obj_cgroup_from_current
> > > >        0.39 =C2=B1 30%      -0.2        0.14 =C2=B1 29%  perf-profi=
le.children.cycles-pp.alloc_pages_vma
> > > >        0.30 =C2=B1 41%      -0.2        0.06 =C2=B1 80%  perf-profi=
le.children.cycles-pp.update_ts_time_stats
> > > >        0.30 =C2=B1114%      -0.2        0.06 =C2=B1 50%  perf-profi=
le.children.cycles-pp.__kernel_read
> > > >        0.31 =C2=B1 22%      -0.2        0.07 =C2=B1 48%  perf-profi=
le.children.cycles-pp.rcu_eqs_exit
> > > >        0.33 =C2=B1 75%      -0.2        0.09 =C2=B1 31%  perf-profi=
le.children.cycles-pp.alloc_bprm
> > > >        0.36 =C2=B1 22%      -0.2        0.12 =C2=B1 26%  perf-profi=
le.children.cycles-pp.call_rcu
> > > >        0.57 =C2=B1 21%      -0.2        0.33 =C2=B1 11%  perf-profi=
le.children.cycles-pp.worker_thread
> > > >        0.47 =C2=B1 28%      -0.2        0.23 =C2=B1 18%  perf-profi=
le.children.cycles-pp._copy_from_user
> > > >        0.39 =C2=B1 20%      -0.2        0.15 =C2=B1 23%  perf-profi=
le.children.cycles-pp.try_to_unlazy
> > > >        0.56 =C2=B1 19%      -0.2        0.33 =C2=B1 10%  perf-profi=
le.children.cycles-pp.process_one_work
> > > >        0.48 =C2=B1 22%      -0.2        0.26 =C2=B1 44%  perf-profi=
le.children.cycles-pp.__check_object_size
> > > >        0.28 =C2=B1 22%      -0.2        0.07 =C2=B1 54%  perf-profi=
le.children.cycles-pp.nr_iowait_cpu
> > > >        0.34 =C2=B1 27%      -0.2        0.12 =C2=B1 25%  perf-profi=
le.children.cycles-pp.execl
> > > >        0.54 =C2=B1 17%      -0.2        0.33 =C2=B1 10%  perf-profi=
le.children.cycles-pp.drm_fb_helper_damage_work
> > > >        0.54 =C2=B1 18%      -0.2        0.33 =C2=B1 10%  perf-profi=
le.children.cycles-pp.memcpy_toio
> > > >        0.26 =C2=B1 26%      -0.2        0.05 =C2=B1 78%  perf-profi=
le.children.cycles-pp.flush_tlb_func_common
> > > >        0.31 =C2=B1 29%      -0.2        0.10 =C2=B1 69%  perf-profi=
le.children.cycles-pp.shift_arg_pages
> > > >        0.34 =C2=B1 24%      -0.2        0.14 =C2=B1 37%  perf-profi=
le.children.cycles-pp.__x64_sys_munmap
> > > >        0.32 =C2=B1 22%      -0.2        0.12 =C2=B1 23%  perf-profi=
le.children.cycles-pp.__legitimize_path
> > > >        0.33 =C2=B1 35%      -0.2        0.12 =C2=B1 31%  perf-profi=
le.children.cycles-pp.__hrtimer_next_event_base
> > > >        0.34 =C2=B1 21%      -0.2        0.14 =C2=B1 32%  perf-profi=
le.children.cycles-pp.update_rq_clock
> > > >        0.26 =C2=B1 17%      -0.2        0.06 =C2=B1 80%  perf-profi=
le.children.cycles-pp.syscall_return_via_sysret
> > > >        0.32 =C2=B1 26%      -0.2        0.12 =C2=B1 10%  perf-profi=
le.children.cycles-pp.copy_string_kernel
> > > >        0.30 =C2=B1 26%      -0.2        0.11 =C2=B1 32%  perf-profi=
le.children.cycles-pp.hrtimer_next_event_without
> > > >        0.32 =C2=B1 33%      -0.2        0.13 =C2=B1 22%  perf-profi=
le.children.cycles-pp.user_path_at_empty
> > > >        0.32 =C2=B1 22%      -0.2        0.13 =C2=B1 26%  perf-profi=
le.children.cycles-pp.unlink_anon_vmas
> > > >        0.26 =C2=B1 33%      -0.2        0.08 =C2=B1 50%  perf-profi=
le.children.cycles-pp.__isoc99_sscanf
> > > >        0.34 =C2=B1 14%      -0.2        0.15 =C2=B1 22%  perf-profi=
le.children.cycles-pp.find_busiest_group
> > > >        0.30 =C2=B1 32%      -0.2        0.12 =C2=B1 15%  perf-profi=
le.children.cycles-pp.__anon_vma_prepare
> > > >        0.24 =C2=B1 23%      -0.2        0.06 =C2=B1 52%  perf-profi=
le.children.cycles-pp.__put_user_nocheck_8
> > > >        0.34 =C2=B1 14%      -0.2        0.17 =C2=B1 11%  perf-profi=
le.children.cycles-pp.copy_user_generic_unrolled
> > > >        0.25 =C2=B1 26%      -0.2        0.08 =C2=B1 24%  perf-profi=
le.children.cycles-pp.__cxa_atexit
> > > >        0.22 =C2=B1 37%      -0.2        0.05 =C2=B1 79%  perf-profi=
le.children.cycles-pp.map_vdso
> > > >        0.25 =C2=B1 27%      -0.2        0.08 =C2=B1 17%  perf-profi=
le.children.cycles-pp.get_unmapped_area
> > > >        0.30 =C2=B1 27%      -0.2        0.13 =C2=B1 18%  perf-profi=
le.children.cycles-pp.run_rebalance_domains
> > > >        0.30 =C2=B1 28%      -0.2        0.13 =C2=B1 21%  perf-profi=
le.children.cycles-pp.lru_add_drain
> > > >        0.29 =C2=B1 26%      -0.2        0.12 =C2=B1 15%  perf-profi=
le.children.cycles-pp.update_blocked_averages
> > > >        0.28 =C2=B1 33%      -0.2        0.12 =C2=B1 53%  perf-profi=
le.children.cycles-pp.memmove
> > > >        0.23 =C2=B1 23%      -0.2        0.06 =C2=B1 78%  perf-profi=
le.children.cycles-pp.___perf_sw_event
> > > >        0.25 =C2=B1 14%      -0.2        0.09 =C2=B1 33%  perf-profi=
le.children.cycles-pp.perf_event_mmap_output
> > > >        0.21 =C2=B1 10%      -0.2        0.05 =C2=B1 76%  perf-profi=
le.children.cycles-pp.memcpy_erms
> > > >        0.28 =C2=B1 33%      -0.2        0.12 =C2=B1 24%  perf-profi=
le.children.cycles-pp.__pagevec_lru_add
> > > >        0.28 =C2=B1 25%      -0.2        0.13 =C2=B1 17%  perf-profi=
le.children.cycles-pp.get_next_timer_interrupt
> > > >        0.29 =C2=B1 18%      -0.2        0.14 =C2=B1 22%  perf-profi=
le.children.cycles-pp.update_sd_lb_stats
> > > >        0.22 =C2=B1 46%      -0.2        0.07 =C2=B1 47%  perf-profi=
le.children.cycles-pp.__isoc99_vsscanf
> > > >        0.25 =C2=B1 51%      -0.2        0.10 =C2=B1 57%  perf-profi=
le.children.cycles-pp.ksys_read
> > > >        0.29 =C2=B1 28%      -0.2        0.14 =C2=B1 21%  perf-profi=
le.children.cycles-pp.__mod_memcg_lruvec_state
> > > >        0.22 =C2=B1 37%      -0.2        0.07 =C2=B1 53%  perf-profi=
le.children.cycles-pp._start
> > > >        0.20 =C2=B1 31%      -0.1        0.05 =C2=B1 78%  perf-profi=
le.children.cycles-pp.note_gp_changes
> > > >        0.24 =C2=B1 45%      -0.1        0.09 =C2=B1 57%  perf-profi=
le.children.cycles-pp.vfs_read
> > > >        0.18 =C2=B1 16%      -0.1        0.04 =C2=B1 75%  perf-profi=
le.children.cycles-pp.do_brk_flags
> > > >        0.19 =C2=B1 22%      -0.1        0.06 =C2=B1 50%  perf-profi=
le.children.cycles-pp.vm_brk_flags
> > > >        0.24 =C2=B1 15%      -0.1        0.11 =C2=B1 22%  perf-profi=
le.children.cycles-pp.__d_lookup_done
> > > >        0.16 =C2=B1 41%      -0.1        0.03 =C2=B1100%  perf-profi=
le.children.cycles-pp.arch_get_unmapped_area_topdown
> > > >        0.19 =C2=B1 24%      -0.1        0.06 =C2=B1 50%  perf-profi=
le.children.cycles-pp.page_counter_try_charge
> > > >        0.19 =C2=B1 35%      -0.1        0.06 =C2=B1 52%  perf-profi=
le.children.cycles-pp.fput_many
> > > >        0.21 =C2=B1 50%      -0.1        0.08 =C2=B1 26%  perf-profi=
le.children.cycles-pp.__rb_insert_augmented
> > > >        0.18 =C2=B1 19%      -0.1        0.06 =C2=B1 78%  perf-profi=
le.children.cycles-pp.__d_lookup_rcu
> > > >        0.15 =C2=B1 42%      -0.1        0.03 =C2=B1102%  perf-profi=
le.children.cycles-pp.up_read
> > > >        0.21 =C2=B1 29%      -0.1        0.09 =C2=B1 23%  perf-profi=
le.children.cycles-pp.unlink_file_vma
> > > >        0.18 =C2=B1 26%      -0.1        0.06 =C2=B1 47%  perf-profi=
le.children.cycles-pp.mark_page_accessed
> > > >        0.19 =C2=B1 43%      -0.1        0.07 =C2=B1 11%  perf-profi=
le.children.cycles-pp.__vma_link_rb
> > > >        0.17 =C2=B1 22%      -0.1        0.05 =C2=B1 46%  perf-profi=
le.children.cycles-pp.__check_heap_object
> > > >        0.18 =C2=B1 36%      -0.1        0.06 =C2=B1 32%  perf-profi=
le.children.cycles-pp.vm_normal_page
> > > >        0.26 =C2=B1 35%      -0.1        0.14 =C2=B1 30%  perf-profi=
le.children.cycles-pp.__intel_pmu_enable_all
> > > >        0.19 =C2=B1 31%      -0.1        0.07 =C2=B1 52%  perf-profi=
le.children.cycles-pp.up_write
> > > >        0.17 =C2=B1 67%      -0.1        0.06 =C2=B1 73%  perf-profi=
le.children.cycles-pp.enqueue_hrtimer
> > > >        0.24 =C2=B1 15%      -0.1        0.12 =C2=B1 19%  perf-profi=
le.children.cycles-pp.arch_scale_freq_tick
> > > >        0.14 =C2=B1 38%      -0.1        0.03 =C2=B1100%  perf-profi=
le.children.cycles-pp.__list_del_entry_valid
> > > >        0.17 =C2=B1 53%      -0.1        0.05 =C2=B1 53%  perf-profi=
le.children.cycles-pp.generic_permission
> > > >        0.14 =C2=B1 36%      -0.1        0.03 =C2=B1103%  perf-profi=
le.children.cycles-pp.xas_load
> > > >        0.20 =C2=B1 41%      -0.1        0.09 =C2=B1 33%  perf-profi=
le.children.cycles-pp.__get_free_pages
> > > >        0.14 =C2=B1 23%      -0.1        0.03 =C2=B1104%  perf-profi=
le.children.cycles-pp.lockref_get_not_dead
> > > >        0.18 =C2=B1 24%      -0.1        0.08 =C2=B1 25%  perf-profi=
le.children.cycles-pp.vm_area_dup
> > > >        0.15 =C2=B1 41%      -0.1        0.05 =C2=B1 46%  perf-profi=
le.children.cycles-pp.refill_obj_stock
> > > >        0.15 =C2=B1 29%      -0.1        0.05 =C2=B1 46%  perf-profi=
le.children.cycles-pp.__legitimize_mnt
> > > >        0.14 =C2=B1 26%      -0.1        0.05 =C2=B1 48%  perf-profi=
le.children.cycles-pp.call_cpuidle
> > > >        0.16 =C2=B1 33%      -0.1        0.07 =C2=B1 20%  perf-profi=
le.children.cycles-pp.__hrtimer_get_next_event
> > > >        0.18 =C2=B1 14%      -0.1        0.09 =C2=B1 50%  perf-profi=
le.children.cycles-pp.__pte_alloc
> > > >        0.16 =C2=B1 26%      -0.1        0.07 =C2=B1 30%  perf-profi=
le.children.cycles-pp.__mod_memcg_state
> > > >        0.17 =C2=B1 23%      -0.1        0.08 =C2=B1 54%  perf-profi=
le.children.cycles-pp.d_path
> > > >        0.15 =C2=B1 18%      -0.1        0.07 =C2=B1 54%  perf-profi=
le.children.cycles-pp.finish_fault
> > > >        0.11 =C2=B1 27%      -0.1        0.03 =C2=B1100%  perf-profi=
le.children.cycles-pp.down_read
> > > >        0.11 =C2=B1 27%      -0.1        0.03 =C2=B1101%  perf-profi=
le.children.cycles-pp.__slab_alloc
> > > >        0.10 =C2=B1 27%      -0.1        0.03 =C2=B1102%  perf-profi=
le.children.cycles-pp.___slab_alloc
> > > >        0.10 =C2=B1 15%      -0.1        0.03 =C2=B1103%  perf-profi=
le.children.cycles-pp.expand_downwards
> > > >        0.12 =C2=B1 19%      -0.1        0.05 =C2=B1 48%  perf-profi=
le.children.cycles-pp.io_serial_out
> > > >        0.16 =C2=B1  9%      -0.1        0.10 =C2=B1 28%  perf-profi=
le.children.cycles-pp.do_open
> > > >        0.02 =C2=B1142%      +0.2        0.18 =C2=B1 30%  perf-profi=
le.children.cycles-pp.update_load_avg
> > > >        0.01 =C2=B1223%      +0.2        0.18 =C2=B1 22%  perf-profi=
le.children.cycles-pp.update_curr
> > > >        0.05 =C2=B1 74%      +0.5        0.53 =C2=B1 20%  perf-profi=
le.children.cycles-pp.task_tick_fair
> > > >        0.00            +0.7        0.73 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.sched_clock_local
> > > >        0.74 =C2=B1 21%      +2.4        3.14 =C2=B1  7%  perf-profi=
le.children.cycles-pp.perf_mux_hrtimer_handler
> > > >        2.67 =C2=B1 12%      +4.7        7.33 =C2=B1  8%  perf-profi=
le.children.cycles-pp.tick_sched_handle
> > > >        2.50 =C2=B1  9%      +4.8        7.29 =C2=B1  8%  perf-profi=
le.children.cycles-pp.update_process_times
> > > >        1.32 =C2=B1  8%      +5.5        6.79 =C2=B1  8%  perf-profi=
le.children.cycles-pp.scheduler_tick
> > > >        0.70 =C2=B1 54%      +6.8        7.46 =C2=B1  4%  perf-profi=
le.children.cycles-pp.tick_nohz_irq_exit
> > > >        1.84 =C2=B1 19%      +8.0        9.79 =C2=B1  3%  perf-profi=
le.children.cycles-pp.clockevents_program_event
> > > >        0.40 =C2=B1 27%      +8.3        8.72 =C2=B1  2%  perf-profi=
le.children.cycles-pp.ktime_get_update_offsets_now
> > > >        3.09 =C2=B1 10%      +9.1       12.20 =C2=B1  5%  perf-profi=
le.children.cycles-pp.tick_sched_timer
> > > >        4.60 =C2=B1 16%     +11.1       15.70 =C2=B1  5%  perf-profi=
le.children.cycles-pp.__hrtimer_run_queues
> > > >        0.01 =C2=B1223%     +15.3       15.26 =C2=B1  3%  perf-profi=
le.children.cycles-pp.sched_clock_idle_wakeup_event
> > > >        1.24 =C2=B1 22%     +15.8       17.00 =C2=B1  2%  perf-profi=
le.children.cycles-pp.irq_enter_rcu
> > > >        1.22 =C2=B1 24%     +15.8       16.99 =C2=B1  2%  perf-profi=
le.children.cycles-pp.tick_irq_enter
> > > >        0.00           +20.7       20.69 =C2=B1  3%  perf-profile.ch=
ildren.cycles-pp.sched_clock_tick
> > > >       59.83 =C2=B1  5%     +23.6       83.45        perf-profile.ch=
ildren.cycles-pp.start_secondary
> > > >       60.74 =C2=B1  5%     +23.7       84.46        perf-profile.ch=
ildren.cycles-pp.secondary_startup_64_no_verify
> > > >       60.74 =C2=B1  5%     +23.7       84.46        perf-profile.ch=
ildren.cycles-pp.cpu_startup_entry
> > > >       60.74 =C2=B1  5%     +23.7       84.46        perf-profile.ch=
ildren.cycles-pp.do_idle
> > > >        7.66 =C2=B1 11%     +27.0       34.62 =C2=B1  2%  perf-profi=
le.children.cycles-pp.__sysvec_apic_timer_interrupt
> > > >        7.53 =C2=B1 11%     +27.0       34.58 =C2=B1  2%  perf-profi=
le.children.cycles-pp.hrtimer_interrupt
> > > >       55.45 =C2=B1  6%     +27.5       82.93        perf-profile.ch=
ildren.cycles-pp.cpuidle_enter_state
> > > >       55.45 =C2=B1  6%     +27.5       82.95        perf-profile.ch=
ildren.cycles-pp.cpuidle_enter
> > > >       14.73 =C2=B1  7%     +46.3       61.01 =C2=B1  2%  perf-profi=
le.children.cycles-pp.asm_sysvec_apic_timer_interrupt
> > > >       12.64 =C2=B1  6%     +47.6       60.23 =C2=B1  2%  perf-profi=
le.children.cycles-pp.sysvec_apic_timer_interrupt
> > > >        2.77 =C2=B1 29%     +50.5       53.26 =C2=B1  2%  perf-profi=
le.children.cycles-pp.ktime_get
> > > >        0.00           +60.5       60.51        perf-profile.childre=
n.cycles-pp.read_hpet
> > > >       38.06 =C2=B1 13%     -22.4       15.66 =C2=B1 11%  perf-profi=
le.self.cycles-pp.intel_idle
> > > >        3.26 =C2=B1 35%      -2.2        1.02 =C2=B1 10%  perf-profi=
le.self.cycles-pp.cpuidle_enter_state
> > > >        2.08 =C2=B1 27%      -1.4        0.65 =C2=B1 25%  perf-profi=
le.self.cycles-pp.menu_select
> > > >        1.45 =C2=B1  2%      -1.0        0.44 =C2=B1 14%  perf-profi=
le.self.cycles-pp.next_uptodate_page
> > > >        1.49 =C2=B1 14%      -0.9        0.59 =C2=B1 15%  perf-profi=
le.self.cycles-pp.native_irq_return_iret
> > > >        1.93 =C2=B1 20%      -0.9        1.08 =C2=B1  8%  perf-profi=
le.self.cycles-pp.io_serial_in
> > > >        1.18 =C2=B1 10%      -0.8        0.40 =C2=B1 14%  perf-profi=
le.self.cycles-pp._raw_spin_lock
> > > >        1.08 =C2=B1 14%      -0.7        0.35 =C2=B1 17%  perf-profi=
le.self.cycles-pp.strnlen_user
> > > >        1.03 =C2=B1  8%      -0.7        0.31 =C2=B1 16%  perf-profi=
le.self.cycles-pp.zap_pte_range
> > > >        0.85 =C2=B1 15%      -0.7        0.19 =C2=B1 18%  perf-profi=
le.self.cycles-pp.kmem_cache_free
> > > >        1.01 =C2=B1 15%      -0.6        0.36 =C2=B1  7%  perf-profi=
le.self.cycles-pp.find_idlest_group
> > > >        0.86 =C2=B1 18%      -0.6        0.26 =C2=B1 26%  perf-profi=
le.self.cycles-pp.kmem_cache_alloc
> > > >        0.88 =C2=B1 20%      -0.6        0.29 =C2=B1 11%  perf-profi=
le.self.cycles-pp.___might_sleep
> > > >        0.49 =C2=B1 35%      -0.4        0.12 =C2=B1 17%  perf-profi=
le.self.cycles-pp.irqtime_account_irq
> > > >        0.51 =C2=B1 22%      -0.4        0.16 =C2=B1 26%  perf-profi=
le.self.cycles-pp.release_pages
> > > >        0.70 =C2=B1 14%      -0.3        0.37 =C2=B1  9%  perf-profi=
le.self.cycles-pp.lapic_next_deadline
> > > >        0.52 =C2=B1 25%      -0.3        0.21 =C2=B1 25%  perf-profi=
le.self.cycles-pp.sync_regs
> > > >        0.42 =C2=B1 19%      -0.3        0.12 =C2=B1 31%  perf-profi=
le.self.cycles-pp.unlock_page
> > > >        0.39 =C2=B1  9%      -0.3        0.09 =C2=B1 23%  perf-profi=
le.self.cycles-pp.__get_user_8
> > > >        0.36 =C2=B1 32%      -0.3        0.09 =C2=B1 19%  perf-profi=
le.self.cycles-pp.tick_nohz_next_event
> > > >        0.46 =C2=B1 20%      -0.3        0.19 =C2=B1 39%  perf-profi=
le.self.cycles-pp._raw_spin_lock_irqsave
> > > >        0.42 =C2=B1 26%      -0.3        0.15 =C2=B1 11%  perf-profi=
le.self.cycles-pp.filemap_map_pages
> > > >        0.32 =C2=B1 26%      -0.3        0.06 =C2=B1 50%  perf-profi=
le.self.cycles-pp.update_process_times
> > > >        0.39 =C2=B1 32%      -0.2        0.14 =C2=B1 39%  perf-profi=
le.self.cycles-pp.page_remove_rmap
> > > >        0.37 =C2=B1 16%      -0.2        0.13 =C2=B1 34%  perf-profi=
le.self.cycles-pp.__might_sleep
> > > >        0.39 =C2=B1 33%      -0.2        0.16 =C2=B1 34%  perf-profi=
le.self.cycles-pp.rcu_sched_clock_irq
> > > >        0.30 =C2=B1 24%      -0.2        0.08 =C2=B1 22%  perf-profi=
le.self.cycles-pp.find_vma
> > > >        0.54 =C2=B1 18%      -0.2        0.32 =C2=B1  9%  perf-profi=
le.self.cycles-pp.memcpy_toio
> > > >        0.28 =C2=B1 24%      -0.2        0.06 =C2=B1 58%  perf-profi=
le.self.cycles-pp.nr_iowait_cpu
> > > >        0.32 =C2=B1 45%      -0.2        0.10 =C2=B1 15%  perf-profi=
le.self.cycles-pp.vma_interval_tree_insert
> > > >        0.32 =C2=B1 33%      -0.2        0.11 =C2=B1 35%  perf-profi=
le.self.cycles-pp.page_add_file_rmap
> > > >        0.32 =C2=B1 27%      -0.2        0.11 =C2=B1 23%  perf-profi=
le.self.cycles-pp.ktime_get_update_offsets_now
> > > >        0.26 =C2=B1 17%      -0.2        0.06 =C2=B1 80%  perf-profi=
le.self.cycles-pp.syscall_return_via_sysret
> > > >        0.30 =C2=B1 31%      -0.2        0.11 =C2=B1 16%  perf-profi=
le.self.cycles-pp.get_obj_cgroup_from_current
> > > >        0.25 =C2=B1 18%      -0.2        0.06 =C2=B1 57%  perf-profi=
le.self.cycles-pp.call_rcu
> > > >        0.26 =C2=B1 28%      -0.2        0.08 =C2=B1 50%  perf-profi=
le.self.cycles-pp.strncpy_from_user
> > > >        0.21 =C2=B1  7%      -0.2        0.03 =C2=B1100%  perf-profi=
le.self.cycles-pp.memcpy_erms
> > > >        0.32 =C2=B1 37%      -0.2        0.15 =C2=B1 25%  perf-profi=
le.self.cycles-pp.do_idle
> > > >        0.21 =C2=B1 26%      -0.2        0.05 =C2=B1 54%  perf-profi=
le.self.cycles-pp.__put_user_nocheck_8
> > > >        0.20 =C2=B1 18%      -0.2        0.04 =C2=B1 73%  perf-profi=
le.self.cycles-pp.perf_event_mmap
> > > >        0.20 =C2=B1 31%      -0.2        0.05 =C2=B1 79%  perf-profi=
le.self.cycles-pp.copy_strings
> > > >        0.19 =C2=B1 27%      -0.2        0.04 =C2=B1 72%  perf-profi=
le.self.cycles-pp.rcu_eqs_exit
> > > >        0.26 =C2=B1 41%      -0.1        0.11 =C2=B1 29%  perf-profi=
le.self.cycles-pp.__hrtimer_next_event_base
> > > >        0.26 =C2=B1 15%      -0.1        0.11 =C2=B1  8%  perf-profi=
le.self.cycles-pp.copy_user_generic_unrolled
> > > >        0.19 =C2=B1 42%      -0.1        0.05 =C2=B1101%  perf-profi=
le.self.cycles-pp.copy_page
> > > >        0.22 =C2=B1 33%      -0.1        0.08 =C2=B1 61%  perf-profi=
le.self.cycles-pp.__hrtimer_run_queues
> > > >        0.25 =C2=B1 27%      -0.1        0.11 =C2=B1 27%  perf-profi=
le.self.cycles-pp.update_sd_lb_stats
> > > >        0.18 =C2=B1 19%      -0.1        0.05 =C2=B1102%  perf-profi=
le.self.cycles-pp.__d_lookup_rcu
> > > >        0.19 =C2=B1 39%      -0.1        0.05 =C2=B1 48%  perf-profi=
le.self.cycles-pp.__vma_link_rb
> > > >        0.16 =C2=B1 31%      -0.1        0.03 =C2=B1 99%  perf-profi=
le.self.cycles-pp._IO_vfscanf
> > > >        0.17 =C2=B1 23%      -0.1        0.03 =C2=B1108%  perf-profi=
le.self.cycles-pp.___perf_sw_event
> > > >        0.20 =C2=B1 29%      -0.1        0.07 =C2=B1 18%  perf-profi=
le.self.cycles-pp.__cond_resched
> > > >        0.17 =C2=B1 22%      -0.1        0.04 =C2=B1 71%  perf-profi=
le.self.cycles-pp.__check_heap_object
> > > >        0.18 =C2=B1 30%      -0.1        0.05 =C2=B1 52%  perf-profi=
le.self.cycles-pp.page_counter_try_charge
> > > >        0.16 =C2=B1 33%      -0.1        0.03 =C2=B1105%  perf-profi=
le.self.cycles-pp.vm_normal_page
> > > >        0.15 =C2=B1 29%      -0.1        0.03 =C2=B1100%  perf-profi=
le.self.cycles-pp.__legitimize_mnt
> > > >        0.15 =C2=B1 26%      -0.1        0.03 =C2=B1100%  perf-profi=
le.self.cycles-pp.mark_page_accessed
> > > >        0.26 =C2=B1 35%      -0.1        0.14 =C2=B1 30%  perf-profi=
le.self.cycles-pp.__intel_pmu_enable_all
> > > >        0.24 =C2=B1 15%      -0.1        0.12 =C2=B1 19%  perf-profi=
le.self.cycles-pp.arch_scale_freq_tick
> > > >        0.18 =C2=B1 44%      -0.1        0.06 =C2=B1 60%  perf-profi=
le.self.cycles-pp.rcu_read_unlock_strict
> > > >        0.17 =C2=B1 42%      -0.1        0.06 =C2=B1 48%  perf-profi=
le.self.cycles-pp.__rb_insert_augmented
> > > >        0.14 =C2=B1 23%      -0.1        0.03 =C2=B1102%  perf-profi=
le.self.cycles-pp.lockref_get_not_dead
> > > >        0.17 =C2=B1 32%      -0.1        0.06 =C2=B1 54%  perf-profi=
le.self.cycles-pp.up_write
> > > >        0.14 =C2=B1 41%      -0.1        0.03 =C2=B1108%  perf-profi=
le.self.cycles-pp._raw_spin_unlock_irqrestore
> > > >        0.13 =C2=B1 39%      -0.1        0.03 =C2=B1 99%  perf-profi=
le.self.cycles-pp.__list_del_entry_valid
> > > >        0.16 =C2=B1 26%      -0.1        0.06 =C2=B1 87%  perf-profi=
le.self.cycles-pp.vmacache_find
> > > >        0.14 =C2=B1 27%      -0.1        0.04 =C2=B1 75%  perf-profi=
le.self.cycles-pp.call_cpuidle
> > > >        0.20 =C2=B1 30%      -0.1        0.11 =C2=B1 24%  perf-profi=
le.self.cycles-pp.do_set_pte
> > > >        0.13 =C2=B1 36%      -0.1        0.04 =C2=B1 71%  perf-profi=
le.self.cycles-pp.rcu_all_qs
> > > >        0.15 =C2=B1 30%      -0.1        0.06 =C2=B1 54%  perf-profi=
le.self.cycles-pp.__mod_memcg_state
> > > >        0.13 =C2=B1 44%      -0.1        0.04 =C2=B1 75%  perf-profi=
le.self.cycles-pp.update_rq_clock
> > > >        0.15 =C2=B1 30%      -0.1        0.06 =C2=B1 55%  perf-profi=
le.self.cycles-pp.__check_object_size
> > > >        0.12 =C2=B1 38%      -0.1        0.05 =C2=B1 83%  perf-profi=
le.self.cycles-pp.asm_sysvec_apic_timer_interrupt
> > > >        0.11 =C2=B1 36%      -0.1        0.03 =C2=B1103%  perf-profi=
le.self.cycles-pp.__hrtimer_get_next_event
> > > >        0.14 =C2=B1 29%      -0.1        0.07 =C2=B1 41%  perf-profi=
le.self.cycles-pp.handle_mm_fault
> > > >        0.12 =C2=B1 19%      -0.1        0.05 =C2=B1 48%  perf-profi=
le.self.cycles-pp.io_serial_out
> > > >        0.00            +0.1        0.11 =C2=B1 22%  perf-profile.se=
lf.cycles-pp.update_curr
> > > >        0.00            +0.5        0.49 =C2=B1 11%  perf-profile.se=
lf.cycles-pp.sched_clock_local
> > > >        0.00           +60.5       60.51        perf-profile.self.cy=
cles-pp.read_hpet
> > > > =

> > > > =

> > > > =

> > > > *******************************************************************=
********************************
> > > > lkp-csl-2ap2: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30=
GHz with 192G memory
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > compiler/cpufreq_governor/disk/filesize/fs/iterations/kconfig/nr_th=
reads/rootfs/sync_method/tbox_group/test_size/testcase/ucode:
> > > >    gcc-9/performance/1BRD_48G/4M/btrfs/1x/x86_64-rhel-8.3/1t/debian=
-10.4-x86_64-20200603.cgz/NoSync/lkp-csl-2ap2/24G/fsmark/0x5003006
> > > > =

> > > > commit:
> > > >    d42c7a8d68 ("kcsan: Document "value changed" line")
> > > >    6c52b5f3cf ("clocksource: Reduce WATCHDOG_THRESHOLD")
> > > > =

> > > > d42c7a8d68038bc0 6c52b5f3cfefd6e429efc4413fd
> > > > ---------------- ---------------------------
> > > >           %stddev     %change         %stddev
> > > >               \          |                \
> > > >      264577         +1732.3%    4847771        fsmark.app_overhead
> > > >      399.03           -37.8%     248.35 =C2=B1  2%  fsmark.files_pe=
r_sec
> > > >       21.70           +34.5%      29.19 =C2=B1  3%  fsmark.time.ela=
psed_time
> > > >       21.70           +34.5%      29.19 =C2=B1  3%  fsmark.time.ela=
psed_time.max
> > > >       79.67           +15.1%      91.67        fsmark.time.percent_=
of_cpu_this_job_got
> > > >       17.21           +53.9%      26.49 =C2=B1  2%  fsmark.time.sys=
tem_time
> > > >      169429 =C2=B1  2%     -86.9%      22149 =C2=B1  8%  fsmark.tim=
e.voluntary_context_switches
> > > >      126301 =C2=B1 75%     -98.4%       2017 =C2=B1 85%  cpuidle.PO=
LL.usage
> > > >        5510 =C2=B1  6%     +17.1%       6452 =C2=B1  3%  boot-time.=
idle
> > > >        1.72            +2.4%       1.77        boot-time.smp_boot
> > > >       96.92            +2.0%      98.86        iostat.cpu.idle
> > > >        2.86 =C2=B1  8%     -65.9%       0.97 =C2=B1  5%  iostat.cpu=
.system
> > > >       48.83 =C2=B1 14%    +161.8%     127.83 =C2=B1 34%  turbostat.=
Avg_MHz
> > > >        4.70 =C2=B1  6%      +8.9       13.58 =C2=B1 14%  turbostat.=
Busy%
> > > >       62.27 =C2=B1  2%     +16.4%      72.51 =C2=B1  2%  uptime.boot
> > > >       10421 =C2=B1  2%     +24.8%      13004 =C2=B1  3%  uptime.idle
> > > >        0.05 =C2=B1  5%      -0.0        0.02 =C2=B1 23%  mpstat.cpu=
.all.iowait%
> > > >        1.26 =C2=B1 17%      -1.3        0.00        mpstat.cpu.all.=
irq%
> > > >        0.09 =C2=B1 11%      -0.1        0.00 =C2=B1 48%  mpstat.cpu=
.all.soft%
> > > >        7332 =C2=B1 62%    +122.5%      16311 =C2=B1 39%  numa-memin=
fo.node3.Active
> > > >        4212 =C2=B1 20%    +198.0%      12550 =C2=B1 24%  numa-memin=
fo.node3.Active(anon)
> > > >        7027 =C2=B1 48%    +159.9%      18263 =C2=B1 33%  numa-memin=
fo.node3.Shmem
> > > >        1052 =C2=B1 20%    +196.1%       3117 =C2=B1 24%  numa-vmsta=
t.node3.nr_active_anon
> > > >        1756 =C2=B1 48%    +159.5%       4557 =C2=B1 34%  numa-vmsta=
t.node3.nr_shmem
> > > >        1052 =C2=B1 20%    +196.1%       3117 =C2=B1 24%  numa-vmsta=
t.node3.nr_zone_active_anon
> > > >        7855 =C2=B1 11%     +39.8%      10981 =C2=B1  9%  softirqs.C=
PU0.SCHED
> > > >        5753 =C2=B1 13%     +37.2%       7895 =C2=B1 27%  softirqs.C=
PU1.SCHED
> > > >      970575 =C2=B1  5%     +20.3%    1167382 =C2=B1  3%  softirqs.S=
CHED
> > > >       96.67            +1.4%      98.00        vmstat.cpu.id
> > > >     1008185           -23.6%     770151 =C2=B1  5%  vmstat.io.bo
> > > >       18059 =C2=B1  2%     -74.6%       4595        vmstat.system.cs
> > > >        0.01 =C2=B1 14%     +51.7%       0.02 =C2=B1 11%  perf-sched=
.sch_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.cons=
tprop.0.do_select
> > > >        0.01 =C2=B1 14%     +51.7%       0.02 =C2=B1 11%  perf-sched=
.sch_delay.max.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.cons=
tprop.0.do_select
> > > >        3.00 =C2=B1 12%     +54.8%       4.64 =C2=B1 16%  perf-sched=
.sch_delay.max.ms.worker_thread.kthread.ret_from_fork
> > > >        2.53 =C2=B1 47%     +83.5%       4.64 =C2=B1 16%  perf-sched=
.wait_and_delay.max.ms.worker_thread.kthread.ret_from_fork
> > > >       16335 =C2=B1  6%     +44.7%      23644 =C2=B1 12%  meminfo.Ac=
tive
> > > >        7042 =C2=B1 15%    +103.1%      14304 =C2=B1 20%  meminfo.Ac=
tive(anon)
> > > >    13816046           -10.7%   12342039 =C2=B1  3%  meminfo.Inactiv=
e(file)
> > > >       26979 =C2=B1  4%     +31.6%      35497 =C2=B1  9%  meminfo.Sh=
mem
> > > >     2269754 =C2=B1  3%     -73.2%     607860 =C2=B1  4%  meminfo.Wr=
iteback
> > > >        1940 =C2=B1 26%     -45.2%       1063 =C2=B1 41%  sched_debu=
g.cpu.avg_idle.min
> > > >       32619 =C2=B1  3%     +28.6%      41932 =C2=B1  2%  sched_debu=
g.cpu.clock_task.min
> > > >      645.89 =C2=B1 20%     -97.9%      13.74 =C2=B1 19%  sched_debu=
g.cpu.clock_task.stddev
> > > >      165.42 =C2=B1 15%     -24.1%     125.63 =C2=B1 13%  sched_debu=
g.cpu.curr->pid.avg
> > > >      720.17 =C2=B1  7%     -12.9%     627.50 =C2=B1  6%  sched_debu=
g.cpu.curr->pid.stddev
> > > >        1.00          -100.0%       0.00        sched_debug.sched_cl=
ock_stable()
> > > >      657.83 =C2=B1  3%     -58.6%     272.50 =C2=B1  7%  slabinfo.b=
iovec-max.active_objs
> > > >      684.00 =C2=B1  3%     -54.9%     308.50 =C2=B1  8%  slabinfo.b=
iovec-max.num_objs
> > > >        4867           -13.7%       4202 =C2=B1  5%  slabinfo.btrfs_=
extent_map.active_objs
> > > >        4982           -13.7%       4301 =C2=B1  4%  slabinfo.btrfs_=
extent_map.num_objs
> > > >        3531           -10.2%       3173 =C2=B1  2%  slabinfo.btrfs_=
inode.active_objs
> > > >        3546           -10.0%       3191 =C2=B1  2%  slabinfo.btrfs_=
inode.num_objs
> > > >        6938 =C2=B1  5%     -11.2%       6158 =C2=B1  7%  slabinfo.f=
iles_cache.active_objs
> > > >        6938 =C2=B1  5%     -11.2%       6158 =C2=B1  7%  slabinfo.f=
iles_cache.num_objs
> > > >        2146           -18.1%       1757        slabinfo.kmalloc-8k.=
active_objs
> > > >        2164           -17.8%       1779        slabinfo.kmalloc-8k.=
num_objs
> > > >        1753 =C2=B1 15%    +104.0%       3575 =C2=B1 20%  proc-vmsta=
t.nr_active_anon
> > > >     3742994           -10.4%    3351949 =C2=B1  2%  proc-vmstat.nr_=
file_pages
> > > >    42736503            +1.0%   43175533        proc-vmstat.nr_free_=
pages
> > > >     3474846           -11.3%    3081667 =C2=B1  3%  proc-vmstat.nr_=
inactive_file
> > > >        6738 =C2=B1  4%     +31.7%       8874 =C2=B1  9%  proc-vmsta=
t.nr_shmem
> > > >       44643            -3.1%      43267        proc-vmstat.nr_slab_=
reclaimable
> > > >       77603            -3.7%      74734        proc-vmstat.nr_slab_=
unreclaimable
> > > >      570405 =C2=B1  3%     -73.4%     151983 =C2=B1  4%  proc-vmsta=
t.nr_writeback
> > > >        1753 =C2=B1 15%    +104.0%       3575 =C2=B1 20%  proc-vmsta=
t.nr_zone_active_anon
> > > >     3474846           -11.3%    3081667 =C2=B1  3%  proc-vmstat.nr_=
zone_inactive_file
> > > >     1652814           -22.3%    1284857 =C2=B1  4%  proc-vmstat.nr_=
zone_write_pending
> > > >     1359793           -61.0%     530557 =C2=B1 22%  proc-vmstat.num=
a_foreign
> > > >    11732111            +7.3%   12586943        proc-vmstat.numa_hit
> > > >    11472411            +7.5%   12327232        proc-vmstat.numa_loc=
al
> > > >     1359793           -61.0%     530557 =C2=B1 22%  proc-vmstat.num=
a_miss
> > > >     1619493           -51.2%     790267 =C2=B1 14%  proc-vmstat.num=
a_other
> > > >        3192 =C2=B1  5%     +87.0%       5969 =C2=B1 13%  proc-vmsta=
t.pgactivate
> > > >      126035 =C2=B1  2%     +27.4%     160516 =C2=B1  4%  proc-vmsta=
t.pgfault
> > > >        6459 =C2=B1  3%     +27.7%       8247 =C2=B1  6%  proc-vmsta=
t.pgreuse
> > > >   1.513e+09           -11.7%  1.337e+09 =C2=B1  3%  perf-stat.i.bra=
nch-instructions
> > > >    48492068 =C2=B1  3%     -23.9%   36917714 =C2=B1  5%  perf-stat.=
i.cache-misses
> > > >       19647 =C2=B1  3%     -77.1%       4504        perf-stat.i.con=
text-switches
> > > >        2.03 =C2=B1  8%    +237.1%       6.83 =C2=B1 18%  perf-stat.=
i.cpi
> > > >   1.402e+10 =C2=B1  8%    +200.4%  4.212e+10 =C2=B1 18%  perf-stat.=
i.cpu-cycles
> > > >      259.23 =C2=B1  2%      -8.6%     237.01        perf-stat.i.cpu=
-migrations
> > > >      824.65 =C2=B1 15%    +329.0%       3537 =C2=B1 24%  perf-stat.=
i.cycles-between-cache-misses
> > > >   1.929e+09 =C2=B1  2%     -14.1%  1.658e+09 =C2=B1  4%  perf-stat.=
i.dTLB-loads
> > > >   8.938e+08           -19.1%  7.228e+08 =C2=B1  3%  perf-stat.i.dTL=
B-stores
> > > >    7.72e+09           -13.0%  6.719e+09 =C2=B1  3%  perf-stat.i.ins=
tructions
> > > >        0.54 =C2=B1  8%     -69.7%       0.16 =C2=B1 25%  perf-stat.=
i.ipc
> > > >        9.44 =C2=B1  6%     -26.6%       6.93 =C2=B1 10%  perf-stat.=
i.major-faults
> > > >        0.07 =C2=B1  8%    +200.1%       0.22 =C2=B1 18%  perf-stat.=
i.metric.GHz
> > > >       23.21           -14.5%      19.84 =C2=B1  2%  perf-stat.i.met=
ric.M/sec
> > > >        4560            -2.9%       4426        perf-stat.i.minor-fa=
ults
> > > >    11667068 =C2=B1  4%     -16.9%    9696044 =C2=B1 16%  perf-stat.=
i.node-loads
> > > >     2789878 =C2=B1  8%     -13.9%    2401011 =C2=B1  5%  perf-stat.=
i.node-stores
> > > >        4569            -3.0%       4433        perf-stat.i.page-fau=
lts
> > > >        1.82 =C2=B1  8%    +244.9%       6.26 =C2=B1 17%  perf-stat.=
overall.cpi
> > > >      289.37 =C2=B1  6%    +301.9%       1162 =C2=B1 21%  perf-stat.=
overall.cycles-between-cache-misses
> > > >        0.55 =C2=B1  8%     -69.9%       0.17 =C2=B1 25%  perf-stat.=
overall.ipc
> > > >   1.447e+09           -10.8%  1.291e+09 =C2=B1  3%  perf-stat.ps.br=
anch-instructions
> > > >    46269702 =C2=B1  3%     -23.4%   35462108 =C2=B1  6%  perf-stat.=
ps.cache-misses
> > > >       18723 =C2=B1  3%     -76.8%       4334        perf-stat.ps.co=
ntext-switches
> > > >      183348            +1.3%     185661        perf-stat.ps.cpu-clo=
ck
> > > >    1.34e+10 =C2=B1  8%    +204.0%  4.075e+10 =C2=B1 18%  perf-stat.=
ps.cpu-cycles
> > > >      247.92 =C2=B1  2%      -7.2%     230.01        perf-stat.ps.cp=
u-migrations
> > > >   1.844e+09 =C2=B1  2%     -13.2%    1.6e+09 =C2=B1  4%  perf-stat.=
ps.dTLB-loads
> > > >   8.542e+08           -18.3%  6.977e+08 =C2=B1  3%  perf-stat.ps.dT=
LB-stores
> > > >   7.381e+09           -12.1%   6.49e+09 =C2=B1  2%  perf-stat.ps.in=
structions
> > > >        9.01 =C2=B1  6%     -26.3%       6.64 =C2=B1 10%  perf-stat.=
ps.major-faults
> > > >    11128894 =C2=B1  4%     -16.4%    9301546 =C2=B1 16%  perf-stat.=
ps.node-loads
> > > >      183348            +1.3%     185661        perf-stat.ps.task-cl=
ock
> > > >   1.666e+11           +20.4%  2.006e+11 =C2=B1  6%  perf-stat.total=
.instructions
> > > >       36.10 =C2=B1  5%     -23.5       12.58 =C2=B1 30%  perf-profi=
le.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle=
.cpu_startup_entry
> > > >       19.48 =C2=B1 10%     -15.3        4.21 =C2=B1 15%  perf-profi=
le.calltrace.cycles-pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.en=
try_SYSCALL_64_after_hwframe
> > > >       23.57 =C2=B1  6%     -15.2        8.42 =C2=B1 11%  perf-profi=
le.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
> > > >       23.46 =C2=B1  6%     -15.1        8.38 =C2=B1 11%  perf-profi=
le.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
> > > >       18.86 =C2=B1 10%     -14.7        4.12 =C2=B1  9%  perf-profi=
le.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame
> > > >       18.79 =C2=B1 10%     -14.7        4.11 =C2=B1  9%  perf-profi=
le.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_=
after_hwframe
> > > >       18.66 =C2=B1 10%     -14.6        4.08 =C2=B1  9%  perf-profi=
le.calltrace.cycles-pp.btrfs_file_write_iter.new_sync_write.vfs_write.ksys_=
write.do_syscall_64
> > > >       18.61 =C2=B1 10%     -14.5        4.07 =C2=B1  9%  perf-profi=
le.calltrace.cycles-pp.btrfs_buffered_write.btrfs_file_write_iter.new_sync_=
write.vfs_write.ksys_write
> > > >       10.22 =C2=B1  5%      -8.0        2.24 =C2=B1 16%  perf-profi=
le.calltrace.cycles-pp.ret_from_fork
> > > >       10.22 =C2=B1  5%      -8.0        2.24 =C2=B1 16%  perf-profi=
le.calltrace.cycles-pp.kthread.ret_from_fork
> > > >       10.13 =C2=B1  5%      -7.9        2.20 =C2=B1 15%  perf-profi=
le.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork
> > > >       10.11 =C2=B1  5%      -7.9        2.19 =C2=B1 16%  perf-profi=
le.calltrace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork
> > > >        6.84 =C2=B1 10%      -5.4        1.47 =C2=B1  7%  perf-profi=
le.calltrace.cycles-pp.btrfs_copy_from_user.btrfs_buffered_write.btrfs_file=
_write_iter.new_sync_write.vfs_write
> > > >        6.62 =C2=B1 10%      -5.2        1.43 =C2=B1  7%  perf-profi=
le.calltrace.cycles-pp.iov_iter_copy_from_user_atomic.btrfs_copy_from_user.=
btrfs_buffered_write.btrfs_file_write_iter.new_sync_write
> > > >        6.46 =C2=B1 10%      -5.1        1.38 =C2=B1  7%  perf-profi=
le.calltrace.cycles-pp.copyin.iov_iter_copy_from_user_atomic.btrfs_copy_fro=
m_user.btrfs_buffered_write.btrfs_file_write_iter
> > > >        6.40 =C2=B1 10%      -5.0        1.37 =C2=B1  7%  perf-profi=
le.calltrace.cycles-pp.copy_user_enhanced_fast_string.copyin.iov_iter_copy_=
from_user_atomic.btrfs_copy_from_user.btrfs_buffered_write
> > > >        6.03 =C2=B1  7%      -4.7        1.32 =C2=B1 20%  perf-profi=
le.calltrace.cycles-pp.btrfs_work_helper.process_one_work.worker_thread.kth=
read.ret_from_fork
> > > >        5.84 =C2=B1  7%      -4.6        1.29 =C2=B1 21%  perf-profi=
le.calltrace.cycles-pp.brd_submit_bio.submit_bio_noacct.submit_bio.btrfs_ma=
p_bio.run_one_async_done
> > > >        5.84 =C2=B1  7%      -4.6        1.29 =C2=B1 21%  perf-profi=
le.calltrace.cycles-pp.submit_bio.btrfs_map_bio.run_one_async_done.btrfs_wo=
rk_helper.process_one_work
> > > >        5.84 =C2=B1  7%      -4.6        1.29 =C2=B1 21%  perf-profi=
le.calltrace.cycles-pp.submit_bio_noacct.submit_bio.btrfs_map_bio.run_one_a=
sync_done.btrfs_work_helper
> > > >        5.84 =C2=B1  7%      -4.5        1.29 =C2=B1 21%  perf-profi=
le.calltrace.cycles-pp.run_one_async_done.btrfs_work_helper.process_one_wor=
k.worker_thread.kthread
> > > >        5.84 =C2=B1  7%      -4.5        1.29 =C2=B1 21%  perf-profi=
le.calltrace.cycles-pp.btrfs_map_bio.run_one_async_done.btrfs_work_helper.p=
rocess_one_work.worker_thread
> > > >        5.81 =C2=B1 11%      -4.5        1.27 =C2=B1 15%  perf-profi=
le.calltrace.cycles-pp.btrfs_delalloc_reserve_metadata.btrfs_buffered_write=
.btrfs_file_write_iter.new_sync_write.vfs_write
> > > >        5.65 =C2=B1 11%      -4.4        1.24 =C2=B1 15%  perf-profi=
le.calltrace.cycles-pp.btrfs_reserve_metadata_bytes.btrfs_delalloc_reserve_=
metadata.btrfs_buffered_write.btrfs_file_write_iter.new_sync_write
> > > >        5.64 =C2=B1 11%      -4.4        1.24 =C2=B1 15%  perf-profi=
le.calltrace.cycles-pp.__reserve_bytes.btrfs_reserve_metadata_bytes.btrfs_d=
elalloc_reserve_metadata.btrfs_buffered_write.btrfs_file_write_iter
> > > >        5.52 =C2=B1 11%      -4.3        1.21 =C2=B1 15%  perf-profi=
le.calltrace.cycles-pp.need_preemptive_reclaim.__reserve_bytes.btrfs_reserv=
e_metadata_bytes.btrfs_delalloc_reserve_metadata.btrfs_buffered_write
> > > >        5.42 =C2=B1 11%      -4.2        1.19 =C2=B1 15%  perf-profi=
le.calltrace.cycles-pp.__percpu_counter_sum.need_preemptive_reclaim.__reser=
ve_bytes.btrfs_reserve_metadata_bytes.btrfs_delalloc_reserve_metadata
> > > >        5.20 =C2=B1  8%      -4.1        1.15 =C2=B1 21%  perf-profi=
le.calltrace.cycles-pp.brd_do_bvec.brd_submit_bio.submit_bio_noacct.submit_=
bio.btrfs_map_bio
> > > >        4.59 =C2=B1 19%      -3.6        0.97 =C2=B1 26%  perf-profi=
le.calltrace.cycles-pp.menu_select.do_idle.cpu_startup_entry.start_secondar=
y.secondary_startup_64_no_verify
> > > >        3.20 =C2=B1  8%      -2.6        0.62 =C2=B1 44%  perf-profi=
le.calltrace.cycles-pp.brd_insert_page.brd_do_bvec.brd_submit_bio.submit_bi=
o_noacct.submit_bio
> > > >        3.01 =C2=B1 10%      -2.3        0.69 =C2=B1  8%  perf-profi=
le.calltrace.cycles-pp.prepare_pages.btrfs_buffered_write.btrfs_file_write_=
iter.new_sync_write.vfs_write
> > > >        2.79 =C2=B1  9%      -2.1        0.64 =C2=B1  8%  perf-profi=
le.calltrace.cycles-pp.pagecache_get_page.prepare_pages.btrfs_buffered_writ=
e.btrfs_file_write_iter.new_sync_write
> > > >        2.23 =C2=B1 11%      -1.6        0.65 =C2=B1 37%  perf-profi=
le.calltrace.cycles-pp.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_=
apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
> > > >        0.00            +2.3        2.28 =C2=B1  9%  perf-profile.ca=
lltrace.cycles-pp.read_hpet.ktime_get_real_ts64.__x64_sys_gettimeofday.do_s=
yscall_64.entry_SYSCALL_64_after_hwframe
> > > >        0.00            +2.6        2.55 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.ktime_get_real_ts64.__x64_sys_gettimeofday.do_syscall_64.=
entry_SYSCALL_64_after_hwframe
> > > >        0.00            +2.6        2.60 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.__x64_sys_gettimeofday.do_syscall_64.entry_SYSCALL_64_aft=
er_hwframe
> > > >        0.82 =C2=B1 34%      +4.0        4.84 =C2=B1 10%  perf-profi=
le.calltrace.cycles-pp.perf_mux_hrtimer_handler.__hrtimer_run_queues.hrtime=
r_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
> > > >        2.15 =C2=B1 18%      +4.4        6.55 =C2=B1  8%  perf-profi=
le.calltrace.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_que=
ues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
> > > >        2.04 =C2=B1 15%      +4.5        6.50 =C2=B1  7%  perf-profi=
le.calltrace.cycles-pp.update_process_times.tick_sched_handle.tick_sched_ti=
mer.__hrtimer_run_queues.hrtimer_interrupt
> > > >        0.00            +4.5        4.52 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.read_hpet.ktime_get.perf_mux_hrtimer_handler.__hrtimer_ru=
n_queues.hrtimer_interrupt
> > > >        0.00            +4.6        4.56 =C2=B1  8%  perf-profile.ca=
lltrace.cycles-pp.ktime_get.perf_mux_hrtimer_handler.__hrtimer_run_queues.h=
rtimer_interrupt.__sysvec_apic_timer_interrupt
> > > >        0.99 =C2=B1 15%      +5.2        6.22 =C2=B1  5%  perf-profi=
le.calltrace.cycles-pp.scheduler_tick.update_process_times.tick_sched_handl=
e.tick_sched_timer.__hrtimer_run_queues
> > > >        0.00            +5.4        5.40 =C2=B1  3%  perf-profile.ca=
lltrace.cycles-pp.read_hpet.ktime_get.tick_sched_timer.__hrtimer_run_queues=
.hrtimer_interrupt
> > > >        0.10 =C2=B1223%      +5.5        5.55 =C2=B1  4%  perf-profi=
le.calltrace.cycles-pp.ktime_get.tick_sched_timer.__hrtimer_run_queues.hrti=
mer_interrupt.__sysvec_apic_timer_interrupt
> > > >        0.00            +5.6        5.60 =C2=B1  3%  perf-profile.ca=
lltrace.cycles-pp.read_hpet.ktime_get.sched_clock_tick.scheduler_tick.updat=
e_process_times
> > > >        0.00            +5.8        5.82 =C2=B1  3%  perf-profile.ca=
lltrace.cycles-pp.ktime_get.sched_clock_tick.scheduler_tick.update_process_=
times.tick_sched_handle
> > > >        0.00            +5.8        5.84 =C2=B1  3%  perf-profile.ca=
lltrace.cycles-pp.sched_clock_tick.scheduler_tick.update_process_times.tick=
_sched_handle.tick_sched_timer
> > > >        0.00            +7.2        7.23 =C2=B1 16%  perf-profile.ca=
lltrace.cycles-pp.read_hpet.ktime_get.sched_clock_tick.sched_clock_idle_wak=
eup_event.cpuidle_enter_state
> > > >        0.45 =C2=B1 72%      +7.3        7.73 =C2=B1 14%  perf-profi=
le.calltrace.cycles-pp.ktime_get.tick_nohz_irq_exit.sysvec_apic_timer_inter=
rupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
> > > >        0.46 =C2=B1 72%      +7.3        7.75 =C2=B1 14%  perf-profi=
le.calltrace.cycles-pp.tick_nohz_irq_exit.sysvec_apic_timer_interrupt.asm_s=
ysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
> > > >        0.00            +7.3        7.33 =C2=B1 15%  perf-profile.ca=
lltrace.cycles-pp.ktime_get.sched_clock_tick.sched_clock_idle_wakeup_event.=
cpuidle_enter_state.cpuidle_enter
> > > >        0.00            +7.4        7.37 =C2=B1 15%  perf-profile.ca=
lltrace.cycles-pp.sched_clock_tick.sched_clock_idle_wakeup_event.cpuidle_en=
ter_state.cpuidle_enter.do_idle
> > > >        0.00            +7.5        7.49 =C2=B1 15%  perf-profile.ca=
lltrace.cycles-pp.sched_clock_idle_wakeup_event.cpuidle_enter_state.cpuidle=
_enter.do_idle.cpu_startup_entry
> > > >        0.00            +7.6        7.58 =C2=B1 14%  perf-profile.ca=
lltrace.cycles-pp.read_hpet.ktime_get.tick_nohz_irq_exit.sysvec_apic_timer_=
interrupt.asm_sysvec_apic_timer_interrupt
> > > >        1.96 =C2=B1 28%      +7.6        9.59 =C2=B1 11%  perf-profi=
le.calltrace.cycles-pp.clockevents_program_event.hrtimer_interrupt.__sysvec=
_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_int=
errupt
> > > >        1.07 =C2=B1 56%      +8.2        9.25 =C2=B1 11%  perf-profi=
le.calltrace.cycles-pp.ktime_get.clockevents_program_event.hrtimer_interrup=
t.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
> > > >        1.00 =C2=B1 29%      +8.3        9.26 =C2=B1 17%  perf-profi=
le.calltrace.cycles-pp.ktime_get.tick_irq_enter.irq_enter_rcu.sysvec_apic_t=
imer_interrupt.asm_sysvec_apic_timer_interrupt
> > > >        0.00            +9.0        8.98 =C2=B1 13%  perf-profile.ca=
lltrace.cycles-pp.read_hpet.ktime_get.sched_clock_tick.sched_clock_idle_wak=
eup_event.tick_irq_enter
> > > >        0.00            +9.0        9.02 =C2=B1 11%  perf-profile.ca=
lltrace.cycles-pp.read_hpet.ktime_get.clockevents_program_event.hrtimer_int=
errupt.__sysvec_apic_timer_interrupt
> > > >        0.00            +9.1        9.10 =C2=B1 12%  perf-profile.ca=
lltrace.cycles-pp.ktime_get.sched_clock_tick.sched_clock_idle_wakeup_event.=
tick_irq_enter.irq_enter_rcu
> > > >        0.41 =C2=B1106%      +9.1        9.53 =C2=B1  9%  perf-profi=
le.calltrace.cycles-pp.ktime_get_update_offsets_now.hrtimer_interrupt.__sys=
vec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_=
interrupt
> > > >        0.00            +9.1        9.14 =C2=B1 12%  perf-profile.ca=
lltrace.cycles-pp.sched_clock_tick.sched_clock_idle_wakeup_event.tick_irq_e=
nter.irq_enter_rcu.sysvec_apic_timer_interrupt
> > > >        0.00            +9.2        9.17 =C2=B1 17%  perf-profile.ca=
lltrace.cycles-pp.read_hpet.ktime_get.tick_irq_enter.irq_enter_rcu.sysvec_a=
pic_timer_interrupt
> > > >        0.00            +9.3        9.26 =C2=B1 12%  perf-profile.ca=
lltrace.cycles-pp.sched_clock_idle_wakeup_event.tick_irq_enter.irq_enter_rc=
u.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
> > > >        0.00            +9.4        9.38 =C2=B1  9%  perf-profile.ca=
lltrace.cycles-pp.read_hpet.ktime_get_update_offsets_now.hrtimer_interrupt.=
__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
> > > >        2.58 =C2=B1 14%      +9.6       12.19 =C2=B1  6%  perf-profi=
le.calltrace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interr=
upt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
> > > >        4.12 =C2=B1 18%     +13.3       17.42 =C2=B1  7%  perf-profi=
le.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic=
_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
> > > >        1.36 =C2=B1 23%     +17.3       18.64 =C2=B1 14%  perf-profi=
le.calltrace.cycles-pp.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec=
_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
> > > >        1.33 =C2=B1 23%     +17.3       18.63 =C2=B1 14%  perf-profi=
le.calltrace.cycles-pp.tick_irq_enter.irq_enter_rcu.sysvec_apic_timer_inter=
rupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
> > > >       60.63 =C2=B1  2%     +26.7       87.34        perf-profile.ca=
lltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
> > > >       60.63 =C2=B1  2%     +26.7       87.34        perf-profile.ca=
lltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no=
_verify
> > > >       60.59 =C2=B1  2%     +26.7       87.33        perf-profile.ca=
lltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_start=
up_64_no_verify
> > > >       60.85 =C2=B1  2%     +27.0       87.88        perf-profile.ca=
lltrace.cycles-pp.secondary_startup_64_no_verify
> > > >        7.59 =C2=B1 11%     +29.3       36.93        perf-profile.ca=
lltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt=
.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
> > > >        7.43 =C2=B1 10%     +29.4       36.85        perf-profile.ca=
lltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_ap=
ic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
> > > >       54.95 =C2=B1  2%     +31.0       85.98        perf-profile.ca=
lltrace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.s=
econdary_startup_64_no_verify
> > > >       53.41 =C2=B1  3%     +32.0       85.40        perf-profile.ca=
lltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_ent=
ry.start_secondary
> > > >       17.19 =C2=B1 12%     +48.3       65.47 =C2=B1  5%  perf-profi=
le.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.=
cpuidle_enter.do_idle.cpu_startup_entry
> > > >       12.37 =C2=B1 10%     +51.9       64.29 =C2=B1  6%  perf-profi=
le.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_in=
terrupt.cpuidle_enter_state.cpuidle_enter.do_idle
> > > >       36.20 =C2=B1  5%     -23.6       12.64 =C2=B1 30%  perf-profi=
le.children.cycles-pp.intel_idle
> > > >       24.67 =C2=B1  5%     -15.7        8.99 =C2=B1 10%  perf-profi=
le.children.cycles-pp.entry_SYSCALL_64_after_hwframe
> > > >       24.56 =C2=B1  5%     -15.6        8.95 =C2=B1 10%  perf-profi=
le.children.cycles-pp.do_syscall_64
> > > >       19.66 =C2=B1 10%     -15.2        4.49 =C2=B1 12%  perf-profi=
le.children.cycles-pp.ksys_write
> > > >       19.60 =C2=B1 10%     -15.1        4.47 =C2=B1 12%  perf-profi=
le.children.cycles-pp.vfs_write
> > > >       19.48 =C2=B1 10%     -15.0        4.44 =C2=B1 12%  perf-profi=
le.children.cycles-pp.new_sync_write
> > > >       18.67 =C2=B1 10%     -14.6        4.08 =C2=B1  9%  perf-profi=
le.children.cycles-pp.btrfs_file_write_iter
> > > >       18.62 =C2=B1 10%     -14.6        4.07 =C2=B1  9%  perf-profi=
le.children.cycles-pp.btrfs_buffered_write
> > > >       10.22 =C2=B1  5%      -8.0        2.24 =C2=B1 16%  perf-profi=
le.children.cycles-pp.ret_from_fork
> > > >       10.22 =C2=B1  5%      -8.0        2.24 =C2=B1 16%  perf-profi=
le.children.cycles-pp.kthread
> > > >       10.13 =C2=B1  5%      -7.9        2.20 =C2=B1 15%  perf-profi=
le.children.cycles-pp.worker_thread
> > > >       10.11 =C2=B1  5%      -7.9        2.19 =C2=B1 16%  perf-profi=
le.children.cycles-pp.process_one_work
> > > >        6.84 =C2=B1 10%      -5.4        1.47 =C2=B1  7%  perf-profi=
le.children.cycles-pp.btrfs_copy_from_user
> > > >        6.63 =C2=B1 10%      -5.2        1.43 =C2=B1  7%  perf-profi=
le.children.cycles-pp.iov_iter_copy_from_user_atomic
> > > >        6.49 =C2=B1 10%      -5.1        1.39 =C2=B1  7%  perf-profi=
le.children.cycles-pp.copyin
> > > >        6.44 =C2=B1 10%      -5.1        1.38 =C2=B1  7%  perf-profi=
le.children.cycles-pp.copy_user_enhanced_fast_string
> > > >        6.03 =C2=B1  7%      -4.7        1.32 =C2=B1 20%  perf-profi=
le.children.cycles-pp.btrfs_work_helper
> > > >        5.84 =C2=B1  7%      -4.6        1.29 =C2=B1 21%  perf-profi=
le.children.cycles-pp.submit_bio
> > > >        5.84 =C2=B1  7%      -4.6        1.29 =C2=B1 21%  perf-profi=
le.children.cycles-pp.submit_bio_noacct
> > > >        5.84 =C2=B1  7%      -4.6        1.29 =C2=B1 21%  perf-profi=
le.children.cycles-pp.brd_submit_bio
> > > >        5.84 =C2=B1  7%      -4.5        1.29 =C2=B1 21%  perf-profi=
le.children.cycles-pp.run_one_async_done
> > > >        5.84 =C2=B1  7%      -4.5        1.29 =C2=B1 21%  perf-profi=
le.children.cycles-pp.btrfs_map_bio
> > > >        5.81 =C2=B1 11%      -4.5        1.27 =C2=B1 15%  perf-profi=
le.children.cycles-pp.btrfs_delalloc_reserve_metadata
> > > >        5.71 =C2=B1 11%      -4.5        1.25 =C2=B1 15%  perf-profi=
le.children.cycles-pp.__reserve_bytes
> > > >        5.67 =C2=B1 11%      -4.4        1.24 =C2=B1 15%  perf-profi=
le.children.cycles-pp.btrfs_reserve_metadata_bytes
> > > >        5.54 =C2=B1 11%      -4.3        1.22 =C2=B1 15%  perf-profi=
le.children.cycles-pp.need_preemptive_reclaim
> > > >        5.46 =C2=B1 11%      -4.3        1.20 =C2=B1 15%  perf-profi=
le.children.cycles-pp.__percpu_counter_sum
> > > >        5.21 =C2=B1  7%      -4.1        1.15 =C2=B1 21%  perf-profi=
le.children.cycles-pp.brd_do_bvec
> > > >        4.63 =C2=B1 19%      -3.6        0.99 =C2=B1 26%  perf-profi=
le.children.cycles-pp.menu_select
> > > >        3.09 =C2=B1 17%      -2.7        0.42 =C2=B1  6%  perf-profi=
le.children.cycles-pp.__writeback_single_inode
> > > >        3.09 =C2=B1 17%      -2.7        0.42 =C2=B1  6%  perf-profi=
le.children.cycles-pp.do_writepages
> > > >        3.09 =C2=B1 17%      -2.7        0.42 =C2=B1  6%  perf-profi=
le.children.cycles-pp.extent_writepages
> > > >        3.07 =C2=B1 17%      -2.7        0.42 =C2=B1  6%  perf-profi=
le.children.cycles-pp.extent_write_cache_pages
> > > >        3.22 =C2=B1  8%      -2.5        0.69 =C2=B1 19%  perf-profi=
le.children.cycles-pp.brd_insert_page
> > > >        3.02 =C2=B1 10%      -2.3        0.70 =C2=B1  8%  perf-profi=
le.children.cycles-pp.prepare_pages
> > > >        2.96 =C2=B1  7%      -2.3        0.68 =C2=B1 13%  perf-profi=
le.children.cycles-pp._raw_spin_lock
> > > >        2.92 =C2=B1  9%      -2.3        0.66 =C2=B1  8%  perf-profi=
le.children.cycles-pp.pagecache_get_page
> > > >        2.48 =C2=B1 17%      -2.1        0.34 =C2=B1  5%  perf-profi=
le.children.cycles-pp.__extent_writepage
> > > >        2.31 =C2=B1 11%      -1.8        0.47 =C2=B1 22%  perf-profi=
le.children.cycles-pp.cpumask_next
> > > >        2.36 =C2=B1 14%      -1.7        0.69 =C2=B1 35%  perf-profi=
le.children.cycles-pp.irq_exit_rcu
> > > >        1.94 =C2=B1 11%      -1.5        0.40 =C2=B1 12%  perf-profi=
le.children.cycles-pp.btrfs_dirty_pages
> > > >        1.78 =C2=B1 11%      -1.4        0.35 =C2=B1 30%  perf-profi=
le.children.cycles-pp.tick_nohz_get_sleep_length
> > > >        1.60 =C2=B1 17%      -1.4        0.21 =C2=B1  7%  perf-profi=
le.children.cycles-pp.__extent_writepage_io
> > > >        1.72 =C2=B1  9%      -1.3        0.40 =C2=B1  8%  perf-profi=
le.children.cycles-pp.add_to_page_cache_lru
> > > >        1.45 =C2=B1 16%      -1.2        0.23 =C2=B1 28%  perf-profi=
le.children.cycles-pp.tick_nohz_next_event
> > > >        1.74 =C2=B1 15%      -1.2        0.56 =C2=B1 41%  perf-profi=
le.children.cycles-pp.__softirqentry_text_start
> > > >        1.55 =C2=B1 10%      -1.2        0.38 =C2=B1 14%  perf-profi=
le.children.cycles-pp.__alloc_pages_nodemask
> > > >        1.37 =C2=B1 11%      -1.1        0.30 =C2=B1 24%  perf-profi=
le.children.cycles-pp._find_next_bit
> > > >        1.34 =C2=B1  8%      -1.0        0.32 =C2=B1 15%  perf-profi=
le.children.cycles-pp.get_page_from_freelist
> > > >        1.10 =C2=B1 10%      -0.8        0.26 =C2=B1  8%  perf-profi=
le.children.cycles-pp.__add_to_page_cache_locked
> > > >        0.96 =C2=B1 28%      -0.8        0.14 =C2=B1 16%  perf-profi=
le.children.cycles-pp.irqtime_account_irq
> > > >        1.11 =C2=B1 13%      -0.8        0.35 =C2=B1 34%  perf-profi=
le.children.cycles-pp.rebalance_domains
> > > >        0.88 =C2=B1 11%      -0.7        0.18 =C2=B1 11%  perf-profi=
le.children.cycles-pp.__set_page_dirty_nobuffers
> > > >        0.74 =C2=B1 17%      -0.6        0.10 =C2=B1 12%  perf-profi=
le.children.cycles-pp.btrfs_set_range_writeback
> > > >        0.85 =C2=B1 25%      -0.6        0.24 =C2=B1  6%  perf-profi=
le.children.cycles-pp.native_irq_return_iret
> > > >        0.69 =C2=B1 17%      -0.6        0.10 =C2=B1  6%  perf-profi=
le.children.cycles-pp.writepage_delalloc
> > > >        0.69 =C2=B1  7%      -0.5        0.16 =C2=B1 14%  perf-profi=
le.children.cycles-pp.rmqueue
> > > >        0.96 =C2=B1 16%      -0.5        0.44 =C2=B1 35%  perf-profi=
le.children.cycles-pp.memcpy_toio
> > > >        0.96 =C2=B1 16%      -0.5        0.44 =C2=B1 34%  perf-profi=
le.children.cycles-pp.drm_fb_helper_damage_work
> > > >        0.62 =C2=B1  8%      -0.5        0.14 =C2=B1 24%  perf-profi=
le.children.cycles-pp.end_bio_extent_writepage
> > > >        0.62 =C2=B1  8%      -0.5        0.14 =C2=B1 21%  perf-profi=
le.children.cycles-pp.btrfs_end_bio
> > > >        0.54 =C2=B1 17%      -0.5        0.07 =C2=B1 14%  perf-profi=
le.children.cycles-pp.__test_set_page_writeback
> > > >        0.59 =C2=B1  9%      -0.5        0.14 =C2=B1 12%  perf-profi=
le.children.cycles-pp.lru_cache_add
> > > >        0.77 =C2=B1 19%      -0.5        0.32 =C2=B1 10%  perf-profi=
le.children.cycles-pp.lapic_next_deadline
> > > >        0.54 =C2=B1 17%      -0.5        0.09 =C2=B1 26%  perf-profi=
le.children.cycles-pp.crc_128
> > > >        0.80 =C2=B1 33%      -0.4        0.36 =C2=B1 49%  perf-profi=
le.children.cycles-pp.write
> > > >        0.79 =C2=B1 34%      -0.4        0.35 =C2=B1 50%  perf-profi=
le.children.cycles-pp.devkmsg_write.cold
> > > >        0.79 =C2=B1 34%      -0.4        0.35 =C2=B1 50%  perf-profi=
le.children.cycles-pp.devkmsg_emit
> > > >        0.49 =C2=B1 17%      -0.4        0.07 =C2=B1  8%  perf-profi=
le.children.cycles-pp.__process_pages_contig
> > > >        0.54 =C2=B1 34%      -0.4        0.12 =C2=B1 10%  perf-profi=
le.children.cycles-pp._raw_spin_trylock
> > > >        0.50 =C2=B1 13%      -0.4        0.08 =C2=B1 17%  perf-profi=
le.children.cycles-pp.clear_extent_bit
> > > >        0.49 =C2=B1 12%      -0.4        0.08 =C2=B1 17%  perf-profi=
le.children.cycles-pp.__clear_extent_bit
> > > >        0.53 =C2=B1  8%      -0.4        0.12 =C2=B1 12%  perf-profi=
le.children.cycles-pp.__pagevec_lru_add
> > > >        0.45 =C2=B1 22%      -0.4        0.05 =C2=B1 48%  perf-profi=
le.children.cycles-pp.submit_extent_page
> > > >        0.45 =C2=B1 14%      -0.4        0.06 =C2=B1 57%  perf-profi=
le.children.cycles-pp.crc_42
> > > >        0.44 =C2=B1 15%      -0.4        0.06 =C2=B1  6%  perf-profi=
le.children.cycles-pp.find_lock_delalloc_range
> > > >        0.45 =C2=B1  5%      -0.4        0.09 =C2=B1 23%  perf-profi=
le.children.cycles-pp.rmqueue_bulk
> > > >        0.43 =C2=B1  9%      -0.3        0.10 =C2=B1 23%  perf-profi=
le.children.cycles-pp.end_page_writeback
> > > >        0.38 =C2=B1 10%      -0.3        0.06 =C2=B1 48%  perf-profi=
le.children.cycles-pp.alloc_extent_state
> > > >        0.39 =C2=B1 10%      -0.3        0.09 =C2=B1 22%  perf-profi=
le.children.cycles-pp.test_clear_page_writeback
> > > >        0.41 =C2=B1 16%      -0.3        0.11 =C2=B1 25%  perf-profi=
le.children.cycles-pp.prep_new_page
> > > >        0.37 =C2=B1 24%      -0.3        0.09 =C2=B1 63%  perf-profi=
le.children.cycles-pp.update_rq_clock
> > > >        0.35 =C2=B1  9%      -0.3        0.07 =C2=B1 16%  perf-profi=
le.children.cycles-pp.kmem_cache_alloc
> > > >        0.33 =C2=B1 15%      -0.3        0.06 =C2=B1 17%  perf-profi=
le.children.cycles-pp.__mod_memcg_lruvec_state
> > > >        0.49 =C2=B1 18%      -0.3        0.21 =C2=B1 45%  perf-profi=
le.children.cycles-pp.load_balance
> > > >        0.33 =C2=B1 10%      -0.3        0.06 =C2=B1 11%  perf-profi=
le.children.cycles-pp.xas_load
> > > >        0.34 =C2=B1 14%      -0.3        0.08 =C2=B1 17%  perf-profi=
le.children.cycles-pp.mem_cgroup_charge
> > > >        0.28 =C2=B1 15%      -0.2        0.04 =C2=B1 75%  perf-profi=
le.children.cycles-pp.find_next_bit
> > > >        0.29 =C2=B1 11%      -0.2        0.05 =C2=B1  7%  perf-profi=
le.children.cycles-pp.__mod_lruvec_state
> > > >        0.29 =C2=B1 19%      -0.2        0.06 =C2=B1 16%  perf-profi=
le.children.cycles-pp.account_page_dirtied
> > > >        0.33 =C2=B1 18%      -0.2        0.09 =C2=B1 27%  perf-profi=
le.children.cycles-pp.clear_page_erms
> > > >        0.61 =C2=B1 20%      -0.2        0.39 =C2=B1  8%  perf-profi=
le.children.cycles-pp.sched_clock_cpu
> > > >        0.34 =C2=B1 29%      -0.2        0.13 =C2=B1 43%  perf-profi=
le.children.cycles-pp.hrtimer_update_next_event
> > > >        0.37 =C2=B1 13%      -0.2        0.16 =C2=B1 44%  perf-profi=
le.children.cycles-pp.find_busiest_group
> > > >        0.27 =C2=B1  7%      -0.2        0.07 =C2=B1 16%  perf-profi=
le.children.cycles-pp.set_extent_bit
> > > >        0.27 =C2=B1  7%      -0.2        0.07 =C2=B1 17%  perf-profi=
le.children.cycles-pp.btrfs_set_extent_delalloc
> > > >        0.31 =C2=B1 34%      -0.2        0.11 =C2=B1 48%  perf-profi=
le.children.cycles-pp.__hrtimer_next_event_base
> > > >        0.34 =C2=B1 14%      -0.2        0.15 =C2=B1 46%  perf-profi=
le.children.cycles-pp.update_sd_lb_stats
> > > >        0.52 =C2=B1 15%      -0.2        0.33 =C2=B1 16%  perf-profi=
le.children.cycles-pp.sched_clock
> > > >        0.29 =C2=B1 28%      -0.2        0.11 =C2=B1 64%  perf-profi=
le.children.cycles-pp.rcu_idle_exit
> > > >        0.29 =C2=B1 41%      -0.2        0.10 =C2=B1 66%  perf-profi=
le.children.cycles-pp.update_blocked_averages
> > > >        0.49 =C2=B1 16%      -0.2        0.31 =C2=B1 16%  perf-profi=
le.children.cycles-pp.native_sched_clock
> > > >        0.27 =C2=B1 18%      -0.2        0.10 =C2=B1 18%  perf-profi=
le.children.cycles-pp.get_next_timer_interrupt
> > > >        0.20 =C2=B1 12%      -0.2        0.04 =C2=B1 71%  perf-profi=
le.children.cycles-pp.iov_iter_fault_in_readable
> > > >        0.30 =C2=B1 36%      -0.2        0.14 =C2=B1 35%  perf-profi=
le.children.cycles-pp.__intel_pmu_enable_all
> > > >        0.25 =C2=B1 30%      -0.2        0.09 =C2=B1 35%  perf-profi=
le.children.cycles-pp.hrtimer_next_event_without
> > > >        0.21 =C2=B1 27%      -0.1        0.07 =C2=B1 26%  perf-profi=
le.children.cycles-pp.do_sys_open
> > > >        0.21 =C2=B1 27%      -0.1        0.07 =C2=B1 26%  perf-profi=
le.children.cycles-pp.do_sys_openat2
> > > >        0.21 =C2=B1 29%      -0.1        0.07 =C2=B1 23%  perf-profi=
le.children.cycles-pp.do_filp_open
> > > >        0.21 =C2=B1 29%      -0.1        0.07 =C2=B1 23%  perf-profi=
le.children.cycles-pp.path_openat
> > > >        0.24 =C2=B1 12%      -0.1        0.12 =C2=B1 33%  perf-profi=
le.children.cycles-pp.arch_scale_freq_tick
> > > >        0.20 =C2=B1 27%      -0.1        0.08 =C2=B1 60%  perf-profi=
le.children.cycles-pp.rcu_eqs_exit
> > > >        0.14 =C2=B1 35%      -0.1        0.03 =C2=B1102%  perf-profi=
le.children.cycles-pp.idle_cpu
> > > >        0.17 =C2=B1 27%      -0.1        0.06 =C2=B1 59%  perf-profi=
le.children.cycles-pp.vt_console_print
> > > >        0.17 =C2=B1 29%      -0.1        0.06 =C2=B1 56%  perf-profi=
le.children.cycles-pp.fbcon_redraw
> > > >        0.17 =C2=B1 29%      -0.1        0.06 =C2=B1 59%  perf-profi=
le.children.cycles-pp.lf
> > > >        0.17 =C2=B1 29%      -0.1        0.06 =C2=B1 59%  perf-profi=
le.children.cycles-pp.con_scroll
> > > >        0.17 =C2=B1 29%      -0.1        0.06 =C2=B1 59%  perf-profi=
le.children.cycles-pp.fbcon_scroll
> > > >        0.16 =C2=B1 28%      -0.1        0.06 =C2=B1 59%  perf-profi=
le.children.cycles-pp.fbcon_putcs
> > > >        0.16 =C2=B1 27%      -0.1        0.06 =C2=B1 59%  perf-profi=
le.children.cycles-pp.bit_putcs
> > > >        0.13 =C2=B1 16%      -0.1        0.03 =C2=B1102%  perf-profi=
le.children.cycles-pp.hrtimer_get_next_event
> > > >        0.15 =C2=B1 27%      -0.1        0.05 =C2=B1 59%  perf-profi=
le.children.cycles-pp.drm_fb_helper_sys_imageblit
> > > >        0.12 =C2=B1 39%      -0.1        0.03 =C2=B1 99%  perf-profi=
le.children.cycles-pp.btrfs_create
> > > >        0.15 =C2=B1 26%      -0.1        0.05 =C2=B1 59%  perf-profi=
le.children.cycles-pp.sys_imageblit
> > > >        0.11 =C2=B1 18%      -0.1        0.03 =C2=B1100%  perf-profi=
le.children.cycles-pp.__schedule
> > > >        0.16 =C2=B1 10%      -0.1        0.08 =C2=B1 36%  perf-profi=
le.children.cycles-pp._raw_spin_lock_irq
> > > >        0.09 =C2=B1 19%      -0.1        0.03 =C2=B1108%  perf-profi=
le.children.cycles-pp.cpumask_next_and
> > > >        0.02 =C2=B1142%      +0.1        0.08 =C2=B1 57%  perf-profi=
le.children.cycles-pp.seq_read_iter
> > > >        0.21 =C2=B1  7%      +0.3        0.54 =C2=B1 34%  perf-profi=
le.children.cycles-pp.start_kernel
> > > >        0.00            +0.6        0.63 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.sched_clock_local
> > > >        0.31 =C2=B1 17%      +2.3        2.60 =C2=B1  6%  perf-profi=
le.children.cycles-pp.__x64_sys_gettimeofday
> > > >        0.12 =C2=B1 20%      +2.5        2.58 =C2=B1  6%  perf-profi=
le.children.cycles-pp.ktime_get_real_ts64
> > > >        0.85 =C2=B1 33%      +4.1        4.98 =C2=B1  9%  perf-profi=
le.children.cycles-pp.perf_mux_hrtimer_handler
> > > >        2.25 =C2=B1 17%      +4.6        6.87 =C2=B1  6%  perf-profi=
le.children.cycles-pp.tick_sched_handle
> > > >        2.14 =C2=B1 14%      +4.7        6.82 =C2=B1  6%  perf-profi=
le.children.cycles-pp.update_process_times
> > > >        1.05 =C2=B1 15%      +5.4        6.50 =C2=B1  3%  perf-profi=
le.children.cycles-pp.scheduler_tick
> > > >        0.60 =C2=B1 24%      +7.2        7.81 =C2=B1 14%  perf-profi=
le.children.cycles-pp.tick_nohz_irq_exit
> > > >        2.02 =C2=B1 27%      +8.0        9.99 =C2=B1 11%  perf-profi=
le.children.cycles-pp.clockevents_program_event
> > > >        0.68 =C2=B1 31%      +9.1        9.75 =C2=B1  9%  perf-profi=
le.children.cycles-pp.ktime_get_update_offsets_now
> > > >        2.69 =C2=B1 14%     +10.0       12.69 =C2=B1  5%  perf-profi=
le.children.cycles-pp.tick_sched_timer
> > > >        4.28 =C2=B1 18%     +13.8       18.08 =C2=B1  6%  perf-profi=
le.children.cycles-pp.__hrtimer_run_queues
> > > >        0.00           +16.9       16.89 =C2=B1 13%  perf-profile.ch=
ildren.cycles-pp.sched_clock_idle_wakeup_event
> > > >        1.37 =C2=B1 23%     +17.4       18.78 =C2=B1 14%  perf-profi=
le.children.cycles-pp.irq_enter_rcu
> > > >        1.35 =C2=B1 23%     +17.4       18.78 =C2=B1 14%  perf-profi=
le.children.cycles-pp.tick_irq_enter
> > > >        0.00           +22.7       22.69 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.sched_clock_tick
> > > >       60.63 =C2=B1  2%     +26.7       87.34        perf-profile.ch=
ildren.cycles-pp.start_secondary
> > > >       60.85 =C2=B1  2%     +27.0       87.88        perf-profile.ch=
ildren.cycles-pp.secondary_startup_64_no_verify
> > > >       60.85 =C2=B1  2%     +27.0       87.88        perf-profile.ch=
ildren.cycles-pp.cpu_startup_entry
> > > >       60.85 =C2=B1  2%     +27.0       87.88        perf-profile.ch=
ildren.cycles-pp.do_idle
> > > >        7.82 =C2=B1 11%     +30.4       38.22        perf-profile.ch=
ildren.cycles-pp.__sysvec_apic_timer_interrupt
> > > >        7.67 =C2=B1 10%     +30.5       38.13 =C2=B1  2%  perf-profi=
le.children.cycles-pp.hrtimer_interrupt
> > > >       55.14 =C2=B1  2%     +31.4       86.51        perf-profile.ch=
ildren.cycles-pp.cpuidle_enter
> > > >       55.10 =C2=B1  2%     +31.4       86.49        perf-profile.ch=
ildren.cycles-pp.cpuidle_enter_state
> > > >       15.30 =C2=B1 10%     +51.0       66.31 =C2=B1  6%  perf-profi=
le.children.cycles-pp.asm_sysvec_apic_timer_interrupt
> > > >       12.68 =C2=B1 10%     +53.0       65.66 =C2=B1  6%  perf-profi=
le.children.cycles-pp.sysvec_apic_timer_interrupt
> > > >        3.22 =C2=B1 28%     +56.7       59.87 =C2=B1  9%  perf-profi=
le.children.cycles-pp.ktime_get
> > > >        0.00           +70.8       70.85 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.read_hpet
> > > >       36.19 =C2=B1  5%     -23.6       12.63 =C2=B1 30%  perf-profi=
le.self.cycles-pp.intel_idle
> > > >        6.39 =C2=B1 10%      -5.2        1.21 =C2=B1 11%  perf-profi=
le.self.cycles-pp.copy_user_enhanced_fast_string
> > > >        4.33 =C2=B1 36%      -3.4        0.90 =C2=B1 11%  perf-profi=
le.self.cycles-pp.cpuidle_enter_state
> > > >        3.06 =C2=B1 11%      -2.4        0.61 =C2=B1 19%  perf-profi=
le.self.cycles-pp.__percpu_counter_sum
> > > >        2.90 =C2=B1  6%      -2.3        0.64 =C2=B1 16%  perf-profi=
le.self.cycles-pp._raw_spin_lock
> > > >        2.60 =C2=B1 27%      -2.0        0.55 =C2=B1 24%  perf-profi=
le.self.cycles-pp.menu_select
> > > >        2.72 =C2=B1 32%      -1.7        0.97 =C2=B1 11%  perf-profi=
le.self.cycles-pp.ktime_get
> > > >        1.87 =C2=B1  7%      -1.4        0.42 =C2=B1 28%  perf-profi=
le.self.cycles-pp.brd_do_bvec
> > > >        1.36 =C2=B1 11%      -1.1        0.30 =C2=B1 24%  perf-profi=
le.self.cycles-pp._find_next_bit
> > > >        0.85 =C2=B1 25%      -0.6        0.24 =C2=B1  6%  perf-profi=
le.self.cycles-pp.native_irq_return_iret
> > > >        0.74 =C2=B1 35%      -0.6        0.14 =C2=B1 16%  perf-profi=
le.self.cycles-pp.irqtime_account_irq
> > > >        0.73 =C2=B1 14%      -0.6        0.15 =C2=B1 23%  perf-profi=
le.self.cycles-pp.cpumask_next
> > > >        0.96 =C2=B1 16%      -0.5        0.41 =C2=B1 35%  perf-profi=
le.self.cycles-pp.memcpy_toio
> > > >        0.54 =C2=B1 17%      -0.5        0.08 =C2=B1 32%  perf-profi=
le.self.cycles-pp.crc_128
> > > >        0.77 =C2=B1 19%      -0.5        0.32 =C2=B1 11%  perf-profi=
le.self.cycles-pp.lapic_next_deadline
> > > >        0.57 =C2=B1 36%      -0.4        0.14 =C2=B1 38%  perf-profi=
le.self.cycles-pp.ktime_get_update_offsets_now
> > > >        0.65 =C2=B1 10%      -0.4        0.22 =C2=B1 10%  perf-profi=
le.self.cycles-pp._raw_spin_lock_irqsave
> > > >        0.53 =C2=B1 35%      -0.4        0.12 =C2=B1 10%  perf-profi=
le.self.cycles-pp._raw_spin_trylock
> > > >        0.44 =C2=B1 14%      -0.4        0.06 =C2=B1 59%  perf-profi=
le.self.cycles-pp.crc_42
> > > >        0.36 =C2=B1 15%      -0.3        0.05 =C2=B1 93%  perf-profi=
le.self.cycles-pp.tick_nohz_next_event
> > > >        0.38 =C2=B1  5%      -0.3        0.08 =C2=B1 24%  perf-profi=
le.self.cycles-pp.rmqueue_bulk
> > > >        0.28 =C2=B1 15%      -0.2        0.04 =C2=B1 75%  perf-profi=
le.self.cycles-pp.find_next_bit
> > > >        0.32 =C2=B1 18%      -0.2        0.09 =C2=B1 25%  perf-profi=
le.self.cycles-pp.clear_page_erms
> > > >        0.26 =C2=B1  9%      -0.2        0.03 =C2=B1 70%  perf-profi=
le.self.cycles-pp.xas_load
> > > >        0.25 =C2=B1 12%      -0.2        0.04 =C2=B1 71%  perf-profi=
le.self.cycles-pp.__pagevec_lru_add
> > > >        0.31 =C2=B1 22%      -0.2        0.12 =C2=B1 46%  perf-profi=
le.self.cycles-pp.do_idle
> > > >        0.47 =C2=B1 14%      -0.2        0.30 =C2=B1 16%  perf-profi=
le.self.cycles-pp.native_sched_clock
> > > >        0.30 =C2=B1 36%      -0.2        0.14 =C2=B1 35%  perf-profi=
le.self.cycles-pp.__intel_pmu_enable_all
> > > >        0.26 =C2=B1 34%      -0.2        0.10 =C2=B1 49%  perf-profi=
le.self.cycles-pp.__hrtimer_next_event_base
> > > >        0.18 =C2=B1 19%      -0.1        0.04 =C2=B1 71%  perf-profi=
le.self.cycles-pp.asm_sysvec_apic_timer_interrupt
> > > >        0.24 =C2=B1 12%      -0.1        0.12 =C2=B1 33%  perf-profi=
le.self.cycles-pp.arch_scale_freq_tick
> > > >        0.22 =C2=B1 10%      -0.1        0.10 =C2=B1 45%  perf-profi=
le.self.cycles-pp.update_sd_lb_stats
> > > >        0.13 =C2=B1 36%      -0.1        0.03 =C2=B1102%  perf-profi=
le.self.cycles-pp.idle_cpu
> > > >        0.15 =C2=B1 26%      -0.1        0.05 =C2=B1 59%  perf-profi=
le.self.cycles-pp.sys_imageblit
> > > >        0.18 =C2=B1 27%      -0.1        0.09 =C2=B1 50%  perf-profi=
le.self.cycles-pp.hrtimer_interrupt
> > > >        0.16 =C2=B1 10%      -0.1        0.08 =C2=B1 38%  perf-profi=
le.self.cycles-pp._raw_spin_lock_irq
> > > >        0.00            +0.4        0.40 =C2=B1  2%  perf-profile.se=
lf.cycles-pp.sched_clock_local
> > > >        0.00           +70.8       70.79 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.read_hpet
> > > >       18.50 =C2=B1 33%   +1172.1%     235.33 =C2=B1116%  interrupts=
.34:PCI-MSI.524292-edge.eth0-TxRx-3
> > > >      252658 =C2=B1  2%     -19.6%     203234 =C2=B1  3%  interrupts=
.CAL:Function_call_interrupts
> > > >      953.00 =C2=B1 38%    +165.4%       2529 =C2=B1 48%  interrupts=
.CPU0.CAL:Function_call_interrupts
> > > >      110.33 =C2=B1 17%    +559.5%     727.67 =C2=B1 45%  interrupts=
.CPU0.NMI:Non-maskable_interrupts
> > > >      110.33 =C2=B1 17%    +559.5%     727.67 =C2=B1 45%  interrupts=
.CPU0.PMI:Performance_monitoring_interrupts
> > > >      320.17 =C2=B1149%    +406.0%       1620 =C2=B1 56%  interrupts=
.CPU1.NMI:Non-maskable_interrupts
> > > >      320.17 =C2=B1149%    +406.0%       1620 =C2=B1 56%  interrupts=
.CPU1.PMI:Performance_monitoring_interrupts
> > > >      109.67 =C2=B1 35%    +391.5%     539.00 =C2=B1 21%  interrupts=
.CPU10.NMI:Non-maskable_interrupts
> > > >      109.67 =C2=B1 35%    +391.5%     539.00 =C2=B1 21%  interrupts=
.CPU10.PMI:Performance_monitoring_interrupts
> > > >       93.83 =C2=B1 27%   +1274.6%       1289 =C2=B1155%  interrupts=
.CPU101.NMI:Non-maskable_interrupts
> > > >       93.83 =C2=B1 27%   +1274.6%       1289 =C2=B1155%  interrupts=
.CPU101.PMI:Performance_monitoring_interrupts
> > > >       93.67 =C2=B1 27%    +445.9%     511.33 =C2=B1 55%  interrupts=
.CPU103.NMI:Non-maskable_interrupts
> > > >       93.67 =C2=B1 27%    +445.9%     511.33 =C2=B1 55%  interrupts=
.CPU103.PMI:Performance_monitoring_interrupts
> > > >       94.67 =C2=B1 27%    +444.0%     515.00 =C2=B1 54%  interrupts=
.CPU104.NMI:Non-maskable_interrupts
> > > >       94.67 =C2=B1 27%    +444.0%     515.00 =C2=B1 54%  interrupts=
.CPU104.PMI:Performance_monitoring_interrupts
> > > >       95.33 =C2=B1 26%    +482.3%     555.17 =C2=B1 66%  interrupts=
.CPU105.NMI:Non-maskable_interrupts
> > > >       95.33 =C2=B1 26%    +482.3%     555.17 =C2=B1 66%  interrupts=
.CPU105.PMI:Performance_monitoring_interrupts
> > > >       92.17 =C2=B1 27%    +477.0%     531.83 =C2=B1 60%  interrupts=
.CPU106.NMI:Non-maskable_interrupts
> > > >       92.17 =C2=B1 27%    +477.0%     531.83 =C2=B1 60%  interrupts=
.CPU106.PMI:Performance_monitoring_interrupts
> > > >       91.50 =C2=B1 30%    +463.8%     515.83 =C2=B1 54%  interrupts=
.CPU107.NMI:Non-maskable_interrupts
> > > >       91.50 =C2=B1 30%    +463.8%     515.83 =C2=B1 54%  interrupts=
.CPU107.PMI:Performance_monitoring_interrupts
> > > >      103.00 =C2=B1 28%    +411.5%     526.83 =C2=B1 21%  interrupts=
.CPU11.NMI:Non-maskable_interrupts
> > > >      103.00 =C2=B1 28%    +411.5%     526.83 =C2=B1 21%  interrupts=
.CPU11.PMI:Performance_monitoring_interrupts
> > > >      157.67 =C2=B1 61%    +257.0%     562.83 =C2=B1 47%  interrupts=
.CPU110.NMI:Non-maskable_interrupts
> > > >      157.67 =C2=B1 61%    +257.0%     562.83 =C2=B1 47%  interrupts=
.CPU110.PMI:Performance_monitoring_interrupts
> > > >      116.50 =C2=B1 21%    +437.9%     626.67 =C2=B1 48%  interrupts=
.CPU111.NMI:Non-maskable_interrupts
> > > >      116.50 =C2=B1 21%    +437.9%     626.67 =C2=B1 48%  interrupts=
.CPU111.PMI:Performance_monitoring_interrupts
> > > >       99.83 =C2=B1 39%    +462.3%     561.33 =C2=B1 48%  interrupts=
.CPU112.NMI:Non-maskable_interrupts
> > > >       99.83 =C2=B1 39%    +462.3%     561.33 =C2=B1 48%  interrupts=
.CPU112.PMI:Performance_monitoring_interrupts
> > > >      102.50 =C2=B1 40%    +565.4%     682.00 =C2=B1 56%  interrupts=
.CPU113.NMI:Non-maskable_interrupts
> > > >      102.50 =C2=B1 40%    +565.4%     682.00 =C2=B1 56%  interrupts=
.CPU113.PMI:Performance_monitoring_interrupts
> > > >      132.17 =C2=B1 66%    +373.6%     626.00 =C2=B1 46%  interrupts=
.CPU114.NMI:Non-maskable_interrupts
> > > >      132.17 =C2=B1 66%    +373.6%     626.00 =C2=B1 46%  interrupts=
.CPU114.PMI:Performance_monitoring_interrupts
> > > >      100.33 =C2=B1 38%    +486.5%     588.50 =C2=B1 47%  interrupts=
.CPU116.NMI:Non-maskable_interrupts
> > > >      100.33 =C2=B1 38%    +486.5%     588.50 =C2=B1 47%  interrupts=
.CPU116.PMI:Performance_monitoring_interrupts
> > > >      101.67 =C2=B1 37%    +469.3%     578.83 =C2=B1 48%  interrupts=
.CPU117.NMI:Non-maskable_interrupts
> > > >      101.67 =C2=B1 37%    +469.3%     578.83 =C2=B1 48%  interrupts=
.CPU117.PMI:Performance_monitoring_interrupts
> > > >      106.33 =C2=B1 38%    +441.1%     575.33 =C2=B1 48%  interrupts=
.CPU118.NMI:Non-maskable_interrupts
> > > >      106.33 =C2=B1 38%    +441.1%     575.33 =C2=B1 48%  interrupts=
.CPU118.PMI:Performance_monitoring_interrupts
> > > >      106.67 =C2=B1 43%    +440.6%     576.67 =C2=B1 48%  interrupts=
.CPU119.NMI:Non-maskable_interrupts
> > > >      106.67 =C2=B1 43%    +440.6%     576.67 =C2=B1 48%  interrupts=
.CPU119.PMI:Performance_monitoring_interrupts
> > > >      146.33 =C2=B1 86%    +261.6%     529.17 =C2=B1 52%  interrupts=
.CPU121.NMI:Non-maskable_interrupts
> > > >      146.33 =C2=B1 86%    +261.6%     529.17 =C2=B1 52%  interrupts=
.CPU121.PMI:Performance_monitoring_interrupts
> > > >      101.17 =C2=B1 32%    +421.9%     528.00 =C2=B1 52%  interrupts=
.CPU122.NMI:Non-maskable_interrupts
> > > >      101.17 =C2=B1 32%    +421.9%     528.00 =C2=B1 52%  interrupts=
.CPU122.PMI:Performance_monitoring_interrupts
> > > >      140.67 =C2=B1 51%    +274.8%     527.17 =C2=B1 49%  interrupts=
.CPU124.NMI:Non-maskable_interrupts
> > > >      140.67 =C2=B1 51%    +274.8%     527.17 =C2=B1 49%  interrupts=
.CPU124.PMI:Performance_monitoring_interrupts
> > > >      115.00 =C2=B1 32%    +431.4%     611.17 =C2=B1 54%  interrupts=
.CPU129.NMI:Non-maskable_interrupts
> > > >      115.00 =C2=B1 32%    +431.4%     611.17 =C2=B1 54%  interrupts=
.CPU129.PMI:Performance_monitoring_interrupts
> > > >       18.50 =C2=B1 33%   +1172.1%     235.33 =C2=B1116%  interrupts=
.CPU13.34:PCI-MSI.524292-edge.eth0-TxRx-3
> > > >      113.67 =C2=B1 33%    +438.3%     611.83 =C2=B1 54%  interrupts=
.CPU130.NMI:Non-maskable_interrupts
> > > >      113.67 =C2=B1 33%    +438.3%     611.83 =C2=B1 54%  interrupts=
.CPU130.PMI:Performance_monitoring_interrupts
> > > >      118.17 =C2=B1 33%   +1087.6%       1403 =C2=B1142%  interrupts=
.CPU131.NMI:Non-maskable_interrupts
> > > >      118.17 =C2=B1 33%   +1087.6%       1403 =C2=B1142%  interrupts=
.CPU131.PMI:Performance_monitoring_interrupts
> > > >      115.17 =C2=B1 32%    +446.3%     629.17 =C2=B1 57%  interrupts=
.CPU133.NMI:Non-maskable_interrupts
> > > >      115.17 =C2=B1 32%    +446.3%     629.17 =C2=B1 57%  interrupts=
.CPU133.PMI:Performance_monitoring_interrupts
> > > >      213.33 =C2=B1 68%    +184.6%     607.17 =C2=B1 55%  interrupts=
.CPU134.NMI:Non-maskable_interrupts
> > > >      213.33 =C2=B1 68%    +184.6%     607.17 =C2=B1 55%  interrupts=
.CPU134.PMI:Performance_monitoring_interrupts
> > > >      114.00 =C2=B1 33%    +438.6%     614.00 =C2=B1 55%  interrupts=
.CPU135.NMI:Non-maskable_interrupts
> > > >      114.00 =C2=B1 33%    +438.6%     614.00 =C2=B1 55%  interrupts=
.CPU135.PMI:Performance_monitoring_interrupts
> > > >      115.83 =C2=B1 33%    +349.2%     520.33 =C2=B1 51%  interrupts=
.CPU136.NMI:Non-maskable_interrupts
> > > >      115.83 =C2=B1 33%    +349.2%     520.33 =C2=B1 51%  interrupts=
.CPU136.PMI:Performance_monitoring_interrupts
> > > >      136.50 =C2=B1 43%    +280.3%     519.17 =C2=B1 51%  interrupts=
.CPU137.NMI:Non-maskable_interrupts
> > > >      136.50 =C2=B1 43%    +280.3%     519.17 =C2=B1 51%  interrupts=
.CPU137.PMI:Performance_monitoring_interrupts
> > > >      152.83 =C2=B1 78%    +208.6%     471.67 =C2=B1 27%  interrupts=
.CPU14.NMI:Non-maskable_interrupts
> > > >      152.83 =C2=B1 78%    +208.6%     471.67 =C2=B1 27%  interrupts=
.CPU14.PMI:Performance_monitoring_interrupts
> > > >      123.50 =C2=B1 35%    +515.4%     760.00 =C2=B1102%  interrupts=
.CPU143.NMI:Non-maskable_interrupts
> > > >      123.50 =C2=B1 35%    +515.4%     760.00 =C2=B1102%  interrupts=
.CPU143.PMI:Performance_monitoring_interrupts
> > > >      137.00 =C2=B1 57%    +190.0%     397.33 =C2=B1 26%  interrupts=
.CPU145.NMI:Non-maskable_interrupts
> > > >      137.00 =C2=B1 57%    +190.0%     397.33 =C2=B1 26%  interrupts=
.CPU145.PMI:Performance_monitoring_interrupts
> > > >      124.33 =C2=B1 31%    +678.0%     967.33 =C2=B1130%  interrupts=
.CPU146.NMI:Non-maskable_interrupts
> > > >      124.33 =C2=B1 31%    +678.0%     967.33 =C2=B1130%  interrupts=
.CPU146.PMI:Performance_monitoring_interrupts
> > > >      108.00 =C2=B1 31%    +273.5%     403.33 =C2=B1 25%  interrupts=
.CPU147.NMI:Non-maskable_interrupts
> > > >      108.00 =C2=B1 31%    +273.5%     403.33 =C2=B1 25%  interrupts=
.CPU147.PMI:Performance_monitoring_interrupts
> > > >      110.33 =C2=B1 30%    +327.2%     471.33 =C2=B1 36%  interrupts=
.CPU148.NMI:Non-maskable_interrupts
> > > >      110.33 =C2=B1 30%    +327.2%     471.33 =C2=B1 36%  interrupts=
.CPU148.PMI:Performance_monitoring_interrupts
> > > >      108.83 =C2=B1 31%    +296.6%     431.67 =C2=B1 27%  interrupts=
.CPU149.NMI:Non-maskable_interrupts
> > > >      108.83 =C2=B1 31%    +296.6%     431.67 =C2=B1 27%  interrupts=
.CPU149.PMI:Performance_monitoring_interrupts
> > > >      111.50 =C2=B1 28%    +383.3%     538.83 =C2=B1 42%  interrupts=
.CPU15.NMI:Non-maskable_interrupts
> > > >      111.50 =C2=B1 28%    +383.3%     538.83 =C2=B1 42%  interrupts=
.CPU15.PMI:Performance_monitoring_interrupts
> > > >      110.00 =C2=B1 31%    +302.6%     442.83 =C2=B1 11%  interrupts=
.CPU150.NMI:Non-maskable_interrupts
> > > >      110.00 =C2=B1 31%    +302.6%     442.83 =C2=B1 11%  interrupts=
.CPU150.PMI:Performance_monitoring_interrupts
> > > >      112.67 =C2=B1 30%    +282.0%     430.33 =C2=B1 14%  interrupts=
.CPU151.NMI:Non-maskable_interrupts
> > > >      112.67 =C2=B1 30%    +282.0%     430.33 =C2=B1 14%  interrupts=
.CPU151.PMI:Performance_monitoring_interrupts
> > > >      118.33 =C2=B1 26%    +264.6%     431.50 =C2=B1 14%  interrupts=
.CPU152.NMI:Non-maskable_interrupts
> > > >      118.33 =C2=B1 26%    +264.6%     431.50 =C2=B1 14%  interrupts=
.CPU152.PMI:Performance_monitoring_interrupts
> > > >      109.67 =C2=B1 31%    +290.3%     428.00 =C2=B1 15%  interrupts=
.CPU153.NMI:Non-maskable_interrupts
> > > >      109.67 =C2=B1 31%    +290.3%     428.00 =C2=B1 15%  interrupts=
.CPU153.PMI:Performance_monitoring_interrupts
> > > >      110.33 =C2=B1 30%    +289.3%     429.50 =C2=B1 14%  interrupts=
.CPU154.NMI:Non-maskable_interrupts
> > > >      110.33 =C2=B1 30%    +289.3%     429.50 =C2=B1 14%  interrupts=
.CPU154.PMI:Performance_monitoring_interrupts
> > > >      104.33 =C2=B1 43%    +312.8%     430.67 =C2=B1 14%  interrupts=
.CPU155.NMI:Non-maskable_interrupts
> > > >      104.33 =C2=B1 43%    +312.8%     430.67 =C2=B1 14%  interrupts=
.CPU155.PMI:Performance_monitoring_interrupts
> > > >      105.33 =C2=B1 40%    +418.8%     546.50 =C2=B1 58%  interrupts=
.CPU156.NMI:Non-maskable_interrupts
> > > >      105.33 =C2=B1 40%    +418.8%     546.50 =C2=B1 58%  interrupts=
.CPU156.PMI:Performance_monitoring_interrupts
> > > >      108.83 =C2=B1 38%    +348.2%     487.83 =C2=B1 37%  interrupts=
.CPU157.NMI:Non-maskable_interrupts
> > > >      108.83 =C2=B1 38%    +348.2%     487.83 =C2=B1 37%  interrupts=
.CPU157.PMI:Performance_monitoring_interrupts
> > > >      148.50 =C2=B1 60%    +189.5%     429.83 =C2=B1 14%  interrupts=
.CPU158.NMI:Non-maskable_interrupts
> > > >      148.50 =C2=B1 60%    +189.5%     429.83 =C2=B1 14%  interrupts=
.CPU158.PMI:Performance_monitoring_interrupts
> > > >      116.17 =C2=B1 34%    +271.2%     431.17 =C2=B1 14%  interrupts=
.CPU159.NMI:Non-maskable_interrupts
> > > >      116.17 =C2=B1 34%    +271.2%     431.17 =C2=B1 14%  interrupts=
.CPU159.PMI:Performance_monitoring_interrupts
> > > >      104.00 =C2=B1 20%    +354.3%     472.50 =C2=B1 27%  interrupts=
.CPU16.NMI:Non-maskable_interrupts
> > > >      104.00 =C2=B1 20%    +354.3%     472.50 =C2=B1 27%  interrupts=
.CPU16.PMI:Performance_monitoring_interrupts
> > > >      115.17 =C2=B1 35%    +275.3%     432.17 =C2=B1 13%  interrupts=
.CPU160.NMI:Non-maskable_interrupts
> > > >      115.17 =C2=B1 35%    +275.3%     432.17 =C2=B1 13%  interrupts=
.CPU160.PMI:Performance_monitoring_interrupts
> > > >      121.67 =C2=B1 42%    +235.1%     407.67 =C2=B1 25%  interrupts=
.CPU161.NMI:Non-maskable_interrupts
> > > >      121.67 =C2=B1 42%    +235.1%     407.67 =C2=B1 25%  interrupts=
.CPU161.PMI:Performance_monitoring_interrupts
> > > >      113.50 =C2=B1 35%    +260.4%     409.00 =C2=B1 32%  interrupts=
.CPU162.NMI:Non-maskable_interrupts
> > > >      113.50 =C2=B1 35%    +260.4%     409.00 =C2=B1 32%  interrupts=
.CPU162.PMI:Performance_monitoring_interrupts
> > > >      115.67 =C2=B1 34%    +239.2%     392.33 =C2=B1 25%  interrupts=
.CPU163.NMI:Non-maskable_interrupts
> > > >      115.67 =C2=B1 34%    +239.2%     392.33 =C2=B1 25%  interrupts=
.CPU163.PMI:Performance_monitoring_interrupts
> > > >       94.50 =C2=B1 49%    +361.2%     435.83 =C2=B1 41%  interrupts=
.CPU164.NMI:Non-maskable_interrupts
> > > >       94.50 =C2=B1 49%    +361.2%     435.83 =C2=B1 41%  interrupts=
.CPU164.PMI:Performance_monitoring_interrupts
> > > >      104.50 =C2=B1 41%    +295.1%     412.83 =C2=B1 24%  interrupts=
.CPU165.NMI:Non-maskable_interrupts
> > > >      104.50 =C2=B1 41%    +295.1%     412.83 =C2=B1 24%  interrupts=
.CPU165.PMI:Performance_monitoring_interrupts
> > > >      105.67 =C2=B1 42%    +275.6%     396.83 =C2=B1 25%  interrupts=
.CPU166.NMI:Non-maskable_interrupts
> > > >      105.67 =C2=B1 42%    +275.6%     396.83 =C2=B1 25%  interrupts=
.CPU166.PMI:Performance_monitoring_interrupts
> > > >      110.33 =C2=B1 32%    +257.4%     394.33 =C2=B1 26%  interrupts=
.CPU167.NMI:Non-maskable_interrupts
> > > >      110.33 =C2=B1 32%    +257.4%     394.33 =C2=B1 26%  interrupts=
.CPU167.PMI:Performance_monitoring_interrupts
> > > >      121.67 =C2=B1 28%    +376.0%     579.17 =C2=B1 47%  interrupts=
.CPU169.NMI:Non-maskable_interrupts
> > > >      121.67 =C2=B1 28%    +376.0%     579.17 =C2=B1 47%  interrupts=
.CPU169.PMI:Performance_monitoring_interrupts
> > > >       97.00 =C2=B1 24%    +414.1%     498.67 =C2=B1 31%  interrupts=
.CPU17.NMI:Non-maskable_interrupts
> > > >       97.00 =C2=B1 24%    +414.1%     498.67 =C2=B1 31%  interrupts=
.CPU17.PMI:Performance_monitoring_interrupts
> > > >      132.33 =C2=B1 29%   +1128.8%       1626 =C2=B1135%  interrupts=
.CPU170.NMI:Non-maskable_interrupts
> > > >      132.33 =C2=B1 29%   +1128.8%       1626 =C2=B1135%  interrupts=
.CPU170.PMI:Performance_monitoring_interrupts
> > > >      127.00 =C2=B1 28%    +357.5%     581.00 =C2=B1 47%  interrupts=
.CPU171.NMI:Non-maskable_interrupts
> > > >      127.00 =C2=B1 28%    +357.5%     581.00 =C2=B1 47%  interrupts=
.CPU171.PMI:Performance_monitoring_interrupts
> > > >      126.83 =C2=B1 26%    +390.3%     621.83 =C2=B1 46%  interrupts=
.CPU172.NMI:Non-maskable_interrupts
> > > >      126.83 =C2=B1 26%    +390.3%     621.83 =C2=B1 46%  interrupts=
.CPU172.PMI:Performance_monitoring_interrupts
> > > >      147.33 =C2=B1 45%    +376.5%     702.00 =C2=B1 56%  interrupts=
.CPU174.NMI:Non-maskable_interrupts
> > > >      147.33 =C2=B1 45%    +376.5%     702.00 =C2=B1 56%  interrupts=
.CPU174.PMI:Performance_monitoring_interrupts
> > > >      129.67 =C2=B1 15%    +421.3%     676.00 =C2=B1 50%  interrupts=
.CPU176.NMI:Non-maskable_interrupts
> > > >      129.67 =C2=B1 15%    +421.3%     676.00 =C2=B1 50%  interrupts=
.CPU176.PMI:Performance_monitoring_interrupts
> > > >      147.33 =C2=B1 23%    +362.7%     681.67 =C2=B1 52%  interrupts=
.CPU177.NMI:Non-maskable_interrupts
> > > >      147.33 =C2=B1 23%    +362.7%     681.67 =C2=B1 52%  interrupts=
.CPU177.PMI:Performance_monitoring_interrupts
> > > >      132.83 =C2=B1 75%    +368.0%     621.67 =C2=B1 44%  interrupts=
.CPU18.NMI:Non-maskable_interrupts
> > > >      132.83 =C2=B1 75%    +368.0%     621.67 =C2=B1 44%  interrupts=
.CPU18.PMI:Performance_monitoring_interrupts
> > > >      127.83 =C2=B1 31%    +430.0%     677.50 =C2=B1 51%  interrupts=
.CPU180.NMI:Non-maskable_interrupts
> > > >      127.83 =C2=B1 31%    +430.0%     677.50 =C2=B1 51%  interrupts=
.CPU180.PMI:Performance_monitoring_interrupts
> > > >      127.50 =C2=B1 31%    +605.1%     899.00 =C2=B1 85%  interrupts=
.CPU181.NMI:Non-maskable_interrupts
> > > >      127.50 =C2=B1 31%    +605.1%     899.00 =C2=B1 85%  interrupts=
.CPU181.PMI:Performance_monitoring_interrupts
> > > >      180.00 =C2=B1 49%    +715.6%       1468 =C2=B1131%  interrupts=
.CPU182.NMI:Non-maskable_interrupts
> > > >      180.00 =C2=B1 49%    +715.6%       1468 =C2=B1131%  interrupts=
.CPU182.PMI:Performance_monitoring_interrupts
> > > >      123.17 =C2=B1 28%    +451.6%     679.33 =C2=B1 62%  interrupts=
.CPU184.NMI:Non-maskable_interrupts
> > > >      123.17 =C2=B1 28%    +451.6%     679.33 =C2=B1 62%  interrupts=
.CPU184.PMI:Performance_monitoring_interrupts
> > > >      145.17 =C2=B1 16%    +306.0%     589.33 =C2=B1 57%  interrupts=
.CPU185.NMI:Non-maskable_interrupts
> > > >      145.17 =C2=B1 16%    +306.0%     589.33 =C2=B1 57%  interrupts=
.CPU185.PMI:Performance_monitoring_interrupts
> > > >      127.17 =C2=B1 30%    +355.3%     579.00 =C2=B1 56%  interrupts=
.CPU187.NMI:Non-maskable_interrupts
> > > >      127.17 =C2=B1 30%    +355.3%     579.00 =C2=B1 56%  interrupts=
.CPU187.PMI:Performance_monitoring_interrupts
> > > >      124.33 =C2=B1 27%    +383.4%     601.00 =C2=B1 57%  interrupts=
.CPU188.NMI:Non-maskable_interrupts
> > > >      124.33 =C2=B1 27%    +383.4%     601.00 =C2=B1 57%  interrupts=
.CPU188.PMI:Performance_monitoring_interrupts
> > > >      106.83 =C2=B1 27%    +493.1%     633.67 =C2=B1 38%  interrupts=
.CPU20.NMI:Non-maskable_interrupts
> > > >      106.83 =C2=B1 27%    +493.1%     633.67 =C2=B1 38%  interrupts=
.CPU20.PMI:Performance_monitoring_interrupts
> > > >      106.50 =C2=B1 27%    +478.2%     615.83 =C2=B1 40%  interrupts=
.CPU21.NMI:Non-maskable_interrupts
> > > >      106.50 =C2=B1 27%    +478.2%     615.83 =C2=B1 40%  interrupts=
.CPU21.PMI:Performance_monitoring_interrupts
> > > >      121.33 =C2=B1 19%    +403.8%     611.33 =C2=B1 39%  interrupts=
.CPU22.NMI:Non-maskable_interrupts
> > > >      121.33 =C2=B1 19%    +403.8%     611.33 =C2=B1 39%  interrupts=
.CPU22.PMI:Performance_monitoring_interrupts
> > > >      121.33 =C2=B1 22%    +403.3%     610.67 =C2=B1 39%  interrupts=
.CPU23.NMI:Non-maskable_interrupts
> > > >      121.33 =C2=B1 22%    +403.3%     610.67 =C2=B1 39%  interrupts=
.CPU23.PMI:Performance_monitoring_interrupts
> > > >      149.83 =C2=B1 52%    +307.7%     610.83 =C2=B1 55%  interrupts=
.CPU25.NMI:Non-maskable_interrupts
> > > >      149.83 =C2=B1 52%    +307.7%     610.83 =C2=B1 55%  interrupts=
.CPU25.PMI:Performance_monitoring_interrupts
> > > >      115.17 =C2=B1 29%    +409.3%     586.50 =C2=B1 65%  interrupts=
.CPU26.NMI:Non-maskable_interrupts
> > > >      115.17 =C2=B1 29%    +409.3%     586.50 =C2=B1 65%  interrupts=
.CPU26.PMI:Performance_monitoring_interrupts
> > > >      114.00 =C2=B1 22%    +353.7%     517.17 =C2=B1 55%  interrupts=
.CPU3.NMI:Non-maskable_interrupts
> > > >      114.00 =C2=B1 22%    +353.7%     517.17 =C2=B1 55%  interrupts=
.CPU3.PMI:Performance_monitoring_interrupts
> > > >      115.17 =C2=B1 33%    +402.6%     578.83 =C2=B1 63%  interrupts=
.CPU33.NMI:Non-maskable_interrupts
> > > >      115.17 =C2=B1 33%    +402.6%     578.83 =C2=B1 63%  interrupts=
.CPU33.PMI:Performance_monitoring_interrupts
> > > >      112.50 =C2=B1 34%    +411.4%     575.33 =C2=B1 63%  interrupts=
.CPU34.NMI:Non-maskable_interrupts
> > > >      112.50 =C2=B1 34%    +411.4%     575.33 =C2=B1 63%  interrupts=
.CPU34.PMI:Performance_monitoring_interrupts
> > > >      115.83 =C2=B1 33%   +1500.9%       1854 =C2=B1162%  interrupts=
.CPU35.NMI:Non-maskable_interrupts
> > > >      115.83 =C2=B1 33%   +1500.9%       1854 =C2=B1162%  interrupts=
.CPU35.PMI:Performance_monitoring_interrupts
> > > >      113.83 =C2=B1 34%    +458.1%     635.33 =C2=B1 59%  interrupts=
.CPU37.NMI:Non-maskable_interrupts
> > > >      113.83 =C2=B1 34%    +458.1%     635.33 =C2=B1 59%  interrupts=
.CPU37.PMI:Performance_monitoring_interrupts
> > > >      100.50 =C2=B1 33%    +384.9%     487.33 =C2=B1 60%  interrupts=
.CPU39.NMI:Non-maskable_interrupts
> > > >      100.50 =C2=B1 33%    +384.9%     487.33 =C2=B1 60%  interrupts=
.CPU39.PMI:Performance_monitoring_interrupts
> > > >      172.67 =C2=B1 95%    +306.5%     701.83 =C2=B1 83%  interrupts=
.CPU4.NMI:Non-maskable_interrupts
> > > >      172.67 =C2=B1 95%    +306.5%     701.83 =C2=B1 83%  interrupts=
.CPU4.PMI:Performance_monitoring_interrupts
> > > >      106.83 =C2=B1 21%    +353.4%     484.33 =C2=B1 60%  interrupts=
.CPU40.NMI:Non-maskable_interrupts
> > > >      106.83 =C2=B1 21%    +353.4%     484.33 =C2=B1 60%  interrupts=
.CPU40.PMI:Performance_monitoring_interrupts
> > > >      137.17 =C2=B1 51%    +253.6%     485.00 =C2=B1 59%  interrupts=
.CPU41.NMI:Non-maskable_interrupts
> > > >      137.17 =C2=B1 51%    +253.6%     485.00 =C2=B1 59%  interrupts=
.CPU41.PMI:Performance_monitoring_interrupts
> > > >      118.17 =C2=B1 33%    +479.1%     684.33 =C2=B1 88%  interrupts=
.CPU47.NMI:Non-maskable_interrupts
> > > >      118.17 =C2=B1 33%    +479.1%     684.33 =C2=B1 88%  interrupts=
.CPU47.PMI:Performance_monitoring_interrupts
> > > >       93.33 =C2=B1 25%   +1731.4%       1709 =C2=B1163%  interrupts=
.CPU5.NMI:Non-maskable_interrupts
> > > >       93.33 =C2=B1 25%   +1731.4%       1709 =C2=B1163%  interrupts=
.CPU5.PMI:Performance_monitoring_interrupts
> > > >      130.83 =C2=B1 21%    +624.3%     947.67 =C2=B1139%  interrupts=
.CPU50.NMI:Non-maskable_interrupts
> > > >      130.83 =C2=B1 21%    +624.3%     947.67 =C2=B1139%  interrupts=
.CPU50.PMI:Performance_monitoring_interrupts
> > > >      121.17 =C2=B1 27%    +205.6%     370.33 =C2=B1 32%  interrupts=
.CPU51.NMI:Non-maskable_interrupts
> > > >      121.17 =C2=B1 27%    +205.6%     370.33 =C2=B1 32%  interrupts=
.CPU51.PMI:Performance_monitoring_interrupts
> > > >      120.67 =C2=B1 26%    +302.2%     485.33 =C2=B1 42%  interrupts=
.CPU52.NMI:Non-maskable_interrupts
> > > >      120.67 =C2=B1 26%    +302.2%     485.33 =C2=B1 42%  interrupts=
.CPU52.PMI:Performance_monitoring_interrupts
> > > >      120.83 =C2=B1 27%    +247.6%     420.00 =C2=B1 26%  interrupts=
.CPU53.NMI:Non-maskable_interrupts
> > > >      120.83 =C2=B1 27%    +247.6%     420.00 =C2=B1 26%  interrupts=
.CPU53.PMI:Performance_monitoring_interrupts
> > > >       94.67 =C2=B1 27%    +298.9%     377.67 =C2=B1 29%  interrupts=
.CPU54.NMI:Non-maskable_interrupts
> > > >       94.67 =C2=B1 27%    +298.9%     377.67 =C2=B1 29%  interrupts=
.CPU54.PMI:Performance_monitoring_interrupts
> > > >       97.00 =C2=B1 27%    +272.0%     360.83 =C2=B1 36%  interrupts=
.CPU55.NMI:Non-maskable_interrupts
> > > >       97.00 =C2=B1 27%    +272.0%     360.83 =C2=B1 36%  interrupts=
.CPU55.PMI:Performance_monitoring_interrupts
> > > >      119.00 =C2=B1 29%    +256.9%     424.67 =C2=B1 15%  interrupts=
.CPU56.NMI:Non-maskable_interrupts
> > > >      119.00 =C2=B1 29%    +256.9%     424.67 =C2=B1 15%  interrupts=
.CPU56.PMI:Performance_monitoring_interrupts
> > > >      117.50 =C2=B1 24%    +260.9%     424.00 =C2=B1 15%  interrupts=
.CPU57.NMI:Non-maskable_interrupts
> > > >      117.50 =C2=B1 24%    +260.9%     424.00 =C2=B1 15%  interrupts=
.CPU57.PMI:Performance_monitoring_interrupts
> > > >      111.17 =C2=B1 36%    +281.7%     424.33 =C2=B1 15%  interrupts=
.CPU58.NMI:Non-maskable_interrupts
> > > >      111.17 =C2=B1 36%    +281.7%     424.33 =C2=B1 15%  interrupts=
.CPU58.PMI:Performance_monitoring_interrupts
> > > >      120.50 =C2=B1 27%    +231.8%     399.83 =C2=B1 26%  interrupts=
.CPU59.NMI:Non-maskable_interrupts
> > > >      120.50 =C2=B1 27%    +231.8%     399.83 =C2=B1 26%  interrupts=
.CPU59.PMI:Performance_monitoring_interrupts
> > > >      120.00 =C2=B1 24%    +410.4%     612.50 =C2=B1 77%  interrupts=
.CPU60.NMI:Non-maskable_interrupts
> > > >      120.00 =C2=B1 24%    +410.4%     612.50 =C2=B1 77%  interrupts=
.CPU60.PMI:Performance_monitoring_interrupts
> > > >      123.33 =C2=B1 20%    +302.6%     496.50 =C2=B1 44%  interrupts=
.CPU61.NMI:Non-maskable_interrupts
> > > >      123.33 =C2=B1 20%    +302.6%     496.50 =C2=B1 44%  interrupts=
.CPU61.PMI:Performance_monitoring_interrupts
> > > >      141.67 =C2=B1 43%    +202.5%     428.50 =C2=B1 14%  interrupts=
.CPU62.NMI:Non-maskable_interrupts
> > > >      141.67 =C2=B1 43%    +202.5%     428.50 =C2=B1 14%  interrupts=
.CPU62.PMI:Performance_monitoring_interrupts
> > > >      108.00 =C2=B1 31%    +297.1%     428.83 =C2=B1 14%  interrupts=
.CPU63.NMI:Non-maskable_interrupts
> > > >      108.00 =C2=B1 31%    +297.1%     428.83 =C2=B1 14%  interrupts=
.CPU63.PMI:Performance_monitoring_interrupts
> > > >       89.83 =C2=B1 47%    +376.3%     427.83 =C2=B1 15%  interrupts=
.CPU64.NMI:Non-maskable_interrupts
> > > >       89.83 =C2=B1 47%    +376.3%     427.83 =C2=B1 15%  interrupts=
.CPU64.PMI:Performance_monitoring_interrupts
> > > >      103.50 =C2=B1 45%    +347.7%     463.33 =C2=B1 14%  interrupts=
.CPU65.NMI:Non-maskable_interrupts
> > > >      103.50 =C2=B1 45%    +347.7%     463.33 =C2=B1 14%  interrupts=
.CPU65.PMI:Performance_monitoring_interrupts
> > > >      110.17 =C2=B1 36%    +310.9%     452.67 =C2=B1 21%  interrupts=
.CPU66.NMI:Non-maskable_interrupts
> > > >      110.17 =C2=B1 36%    +310.9%     452.67 =C2=B1 21%  interrupts=
.CPU66.PMI:Performance_monitoring_interrupts
> > > >      102.17 =C2=B1 45%    +321.2%     430.33 =C2=B1 13%  interrupts=
.CPU67.NMI:Non-maskable_interrupts
> > > >      102.17 =C2=B1 45%    +321.2%     430.33 =C2=B1 13%  interrupts=
.CPU67.PMI:Performance_monitoring_interrupts
> > > >      109.33 =C2=B1 32%    +332.6%     473.00 =C2=B1 33%  interrupts=
.CPU68.NMI:Non-maskable_interrupts
> > > >      109.33 =C2=B1 32%    +332.6%     473.00 =C2=B1 33%  interrupts=
.CPU68.PMI:Performance_monitoring_interrupts
> > > >      102.50 =C2=B1 38%    +325.4%     436.00 =C2=B1 28%  interrupts=
.CPU69.NMI:Non-maskable_interrupts
> > > >      102.50 =C2=B1 38%    +325.4%     436.00 =C2=B1 28%  interrupts=
.CPU69.PMI:Performance_monitoring_interrupts
> > > >       93.17 =C2=B1 26%    +504.7%     563.33 =C2=B1 47%  interrupts=
.CPU7.NMI:Non-maskable_interrupts
> > > >       93.17 =C2=B1 26%    +504.7%     563.33 =C2=B1 47%  interrupts=
.CPU7.PMI:Performance_monitoring_interrupts
> > > >      108.67 =C2=B1 31%    +260.1%     391.33 =C2=B1 26%  interrupts=
.CPU70.NMI:Non-maskable_interrupts
> > > >      108.67 =C2=B1 31%    +260.1%     391.33 =C2=B1 26%  interrupts=
.CPU70.PMI:Performance_monitoring_interrupts
> > > >      109.50 =C2=B1 31%    +258.0%     392.00 =C2=B1 26%  interrupts=
.CPU71.NMI:Non-maskable_interrupts
> > > >      109.50 =C2=B1 31%    +258.0%     392.00 =C2=B1 26%  interrupts=
.CPU71.PMI:Performance_monitoring_interrupts
> > > >      115.33 =C2=B1 40%    +374.6%     547.33 =C2=B1 55%  interrupts=
.CPU73.NMI:Non-maskable_interrupts
> > > >      115.33 =C2=B1 40%    +374.6%     547.33 =C2=B1 55%  interrupts=
.CPU73.PMI:Performance_monitoring_interrupts
> > > >      123.67 =C2=B1 41%   +1485.7%       1961 =C2=B1137%  interrupts=
.CPU74.NMI:Non-maskable_interrupts
> > > >      123.67 =C2=B1 41%   +1485.7%       1961 =C2=B1137%  interrupts=
.CPU74.PMI:Performance_monitoring_interrupts
> > > >      128.67 =C2=B1 30%    +402.5%     646.50 =C2=B1 60%  interrupts=
.CPU75.NMI:Non-maskable_interrupts
> > > >      128.67 =C2=B1 30%    +402.5%     646.50 =C2=B1 60%  interrupts=
.CPU75.PMI:Performance_monitoring_interrupts
> > > >      138.00 =C2=B1 17%    +426.1%     726.00 =C2=B1 71%  interrupts=
.CPU76.NMI:Non-maskable_interrupts
> > > >      138.00 =C2=B1 17%    +426.1%     726.00 =C2=B1 71%  interrupts=
.CPU76.PMI:Performance_monitoring_interrupts
> > > >      157.67 =C2=B1 71%    +346.3%     703.67 =C2=B1 61%  interrupts=
.CPU78.NMI:Non-maskable_interrupts
> > > >      157.67 =C2=B1 71%    +346.3%     703.67 =C2=B1 61%  interrupts=
.CPU78.PMI:Performance_monitoring_interrupts
> > > >       93.83 =C2=B1 27%    +559.0%     618.33 =C2=B1 38%  interrupts=
.CPU8.NMI:Non-maskable_interrupts
> > > >       93.83 =C2=B1 27%    +559.0%     618.33 =C2=B1 38%  interrupts=
.CPU8.PMI:Performance_monitoring_interrupts
> > > >      119.67 =C2=B1 27%    +463.2%     674.00 =C2=B1 50%  interrupts=
.CPU80.NMI:Non-maskable_interrupts
> > > >      119.67 =C2=B1 27%    +463.2%     674.00 =C2=B1 50%  interrupts=
.CPU80.PMI:Performance_monitoring_interrupts
> > > >      139.17 =C2=B1 42%    +392.8%     685.83 =C2=B1 52%  interrupts=
.CPU81.NMI:Non-maskable_interrupts
> > > >      139.17 =C2=B1 42%    +392.8%     685.83 =C2=B1 52%  interrupts=
.CPU81.PMI:Performance_monitoring_interrupts
> > > >      110.33 =C2=B1 29%    +482.6%     642.83 =C2=B1 58%  interrupts=
.CPU84.NMI:Non-maskable_interrupts
> > > >      110.33 =C2=B1 29%    +482.6%     642.83 =C2=B1 58%  interrupts=
.CPU84.PMI:Performance_monitoring_interrupts
> > > >      121.33 =C2=B1 28%    +540.9%     777.67 =C2=B1 80%  interrupts=
.CPU85.NMI:Non-maskable_interrupts
> > > >      121.33 =C2=B1 28%    +540.9%     777.67 =C2=B1 80%  interrupts=
.CPU85.PMI:Performance_monitoring_interrupts
> > > >      145.83 =C2=B1 40%   +1180.5%       1867 =C2=B1157%  interrupts=
.CPU86.NMI:Non-maskable_interrupts
> > > >      145.83 =C2=B1 40%   +1180.5%       1867 =C2=B1157%  interrupts=
.CPU86.PMI:Performance_monitoring_interrupts
> > > >      121.17 =C2=B1 25%    +417.9%     627.50 =C2=B1 68%  interrupts=
.CPU88.NMI:Non-maskable_interrupts
> > > >      121.17 =C2=B1 25%    +417.9%     627.50 =C2=B1 68%  interrupts=
.CPU88.PMI:Performance_monitoring_interrupts
> > > >      167.67 =C2=B1 62%    +229.6%     552.67 =C2=B1 56%  interrupts=
.CPU89.NMI:Non-maskable_interrupts
> > > >      167.67 =C2=B1 62%    +229.6%     552.67 =C2=B1 56%  interrupts=
.CPU89.PMI:Performance_monitoring_interrupts
> > > >      109.50 =C2=B1 27%    +391.8%     538.50 =C2=B1 21%  interrupts=
.CPU9.NMI:Non-maskable_interrupts
> > > >      109.50 =C2=B1 27%    +391.8%     538.50 =C2=B1 21%  interrupts=
.CPU9.PMI:Performance_monitoring_interrupts
> > > >      107.83 =C2=B1 30%    +418.7%     559.33 =C2=B1 53%  interrupts=
.CPU91.NMI:Non-maskable_interrupts
> > > >      107.83 =C2=B1 30%    +418.7%     559.33 =C2=B1 53%  interrupts=
.CPU91.PMI:Performance_monitoring_interrupts
> > > >       97.00 =C2=B1 36%    +503.8%     585.67 =C2=B1 57%  interrupts=
.CPU92.NMI:Non-maskable_interrupts
> > > >       97.00 =C2=B1 36%    +503.8%     585.67 =C2=B1 57%  interrupts=
.CPU92.PMI:Performance_monitoring_interrupts
> > > >      152.00 =C2=B1 44%    +377.4%     725.67 =C2=B1 53%  interrupts=
.CPU95.NMI:Non-maskable_interrupts
> > > >      152.00 =C2=B1 44%    +377.4%     725.67 =C2=B1 53%  interrupts=
.CPU95.PMI:Performance_monitoring_interrupts
> > > >       99.33 =C2=B1 25%    +625.5%     720.67 =C2=B1 45%  interrupts=
.CPU96.NMI:Non-maskable_interrupts
> > > >       99.33 =C2=B1 25%    +625.5%     720.67 =C2=B1 45%  interrupts=
.CPU96.PMI:Performance_monitoring_interrupts
> > > >      251.67 =C2=B1126%    +395.4%       1246 =C2=B1 45%  interrupts=
.CPU97.NMI:Non-maskable_interrupts
> > > >      251.67 =C2=B1126%    +395.4%       1246 =C2=B1 45%  interrupts=
.CPU97.PMI:Performance_monitoring_interrupts
> > > >      201.83 =C2=B1 79%    +293.3%     793.83 =C2=B1 90%  interrupts=
.CPU98.NMI:Non-maskable_interrupts
> > > >      201.83 =C2=B1 79%    +293.3%     793.83 =C2=B1 90%  interrupts=
.CPU98.PMI:Performance_monitoring_interrupts
> > > >      111.00 =C2=B1 23%    +362.2%     513.00 =C2=B1 55%  interrupts=
.CPU99.NMI:Non-maskable_interrupts
> > > >      111.00 =C2=B1 23%    +362.2%     513.00 =C2=B1 55%  interrupts=
.CPU99.PMI:Performance_monitoring_interrupts
> > > >       46152 =C2=B1 10%    +158.6%     119363 =C2=B1 19%  interrupts=
.NMI:Non-maskable_interrupts
> > > >       46152 =C2=B1 10%    +158.6%     119363 =C2=B1 19%  interrupts=
.PMI:Performance_monitoring_interrupts
> > > >      398.67 =C2=B1  8%    +240.2%       1356 =C2=B1 17%  interrupts=
.RES:Rescheduling_interrupts
> > > > =

> > > > =

> > > > =

> > > > =

> > > > =

> > > > Disclaimer:
> > > > Results have been estimated based on internal Intel analysis and ar=
e provided
> > > > for informational purposes only. Any difference in system hardware =
or software
> > > > design or configuration may affect actual performance.
> > > > =

> > > > =

> > > > ---
> > > > 0DAY/LKP+ Test Infrastructure                   Open Source Technol=
ogy Center
> > > > https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel=
 Corporation
> > > > =

> > > > Thanks,
> > > > Oliver Sang
> > > > =

> > > > #
> > > > # Automatically generated file; DO NOT EDIT.
> > > > # Linux/x86_64 5.12.0-rc5 Kernel Configuration
> > > > #
> > > > CONFIG_CC_VERSION_TEXT=3D"gcc-9 (Debian 9.3.0-22) 9.3.0"
> > > > CONFIG_CC_IS_GCC=3Dy
> > > > CONFIG_GCC_VERSION=3D90300
> > > > CONFIG_CLANG_VERSION=3D0
> > > > CONFIG_LD_IS_BFD=3Dy
> > > > CONFIG_LD_VERSION=3D23502
> > > > CONFIG_LLD_VERSION=3D0
> > > > CONFIG_CC_CAN_LINK=3Dy
> > > > CONFIG_CC_CAN_LINK_STATIC=3Dy
> > > > CONFIG_CC_HAS_ASM_GOTO=3Dy
> > > > CONFIG_CC_HAS_ASM_INLINE=3Dy
> > > > CONFIG_IRQ_WORK=3Dy
> > > > CONFIG_BUILDTIME_TABLE_SORT=3Dy
> > > > CONFIG_THREAD_INFO_IN_TASK=3Dy
> > > > =

> > > > #
> > > > # General setup
> > > > #
> > > > CONFIG_INIT_ENV_ARG_LIMIT=3D32
> > > > # CONFIG_COMPILE_TEST is not set
> > > > CONFIG_LOCALVERSION=3D""
> > > > CONFIG_LOCALVERSION_AUTO=3Dy
> > > > CONFIG_BUILD_SALT=3D""
> > > > CONFIG_HAVE_KERNEL_GZIP=3Dy
> > > > CONFIG_HAVE_KERNEL_BZIP2=3Dy
> > > > CONFIG_HAVE_KERNEL_LZMA=3Dy
> > > > CONFIG_HAVE_KERNEL_XZ=3Dy
> > > > CONFIG_HAVE_KERNEL_LZO=3Dy
> > > > CONFIG_HAVE_KERNEL_LZ4=3Dy
> > > > CONFIG_HAVE_KERNEL_ZSTD=3Dy
> > > > CONFIG_KERNEL_GZIP=3Dy
> > > > # CONFIG_KERNEL_BZIP2 is not set
> > > > # CONFIG_KERNEL_LZMA is not set
> > > > # CONFIG_KERNEL_XZ is not set
> > > > # CONFIG_KERNEL_LZO is not set
> > > > # CONFIG_KERNEL_LZ4 is not set
> > > > # CONFIG_KERNEL_ZSTD is not set
> > > > CONFIG_DEFAULT_INIT=3D""
> > > > CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> > > > CONFIG_SWAP=3Dy
> > > > CONFIG_SYSVIPC=3Dy
> > > > CONFIG_SYSVIPC_SYSCTL=3Dy
> > > > CONFIG_POSIX_MQUEUE=3Dy
> > > > CONFIG_POSIX_MQUEUE_SYSCTL=3Dy
> > > > # CONFIG_WATCH_QUEUE is not set
> > > > CONFIG_CROSS_MEMORY_ATTACH=3Dy
> > > > # CONFIG_USELIB is not set
> > > > CONFIG_AUDIT=3Dy
> > > > CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> > > > CONFIG_AUDITSYSCALL=3Dy
> > > > =

> > > > #
> > > > # IRQ subsystem
> > > > #
> > > > CONFIG_GENERIC_IRQ_PROBE=3Dy
> > > > CONFIG_GENERIC_IRQ_SHOW=3Dy
> > > > CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=3Dy
> > > > CONFIG_GENERIC_PENDING_IRQ=3Dy
> > > > CONFIG_GENERIC_IRQ_MIGRATION=3Dy
> > > > CONFIG_GENERIC_IRQ_INJECTION=3Dy
> > > > CONFIG_HARDIRQS_SW_RESEND=3Dy
> > > > CONFIG_IRQ_DOMAIN=3Dy
> > > > CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> > > > CONFIG_GENERIC_MSI_IRQ=3Dy
> > > > CONFIG_GENERIC_MSI_IRQ_DOMAIN=3Dy
> > > > CONFIG_IRQ_MSI_IOMMU=3Dy
> > > > CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
> > > > CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
> > > > CONFIG_IRQ_FORCED_THREADING=3Dy
> > > > CONFIG_SPARSE_IRQ=3Dy
> > > > # CONFIG_GENERIC_IRQ_DEBUGFS is not set
> > > > # end of IRQ subsystem
> > > > =

> > > > CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> > > > CONFIG_ARCH_CLOCKSOURCE_INIT=3Dy
> > > > CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
> > > > CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> > > > CONFIG_GENERIC_CLOCKEVENTS=3Dy
> > > > CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
> > > > CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
> > > > CONFIG_GENERIC_CMOS_UPDATE=3Dy
> > > > CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=3Dy
> > > > CONFIG_POSIX_CPU_TIMERS_TASK_WORK=3Dy
> > > > =

> > > > #
> > > > # Timers subsystem
> > > > #
> > > > CONFIG_TICK_ONESHOT=3Dy
> > > > CONFIG_NO_HZ_COMMON=3Dy
> > > > # CONFIG_HZ_PERIODIC is not set
> > > > # CONFIG_NO_HZ_IDLE is not set
> > > > CONFIG_NO_HZ_FULL=3Dy
> > > > CONFIG_CONTEXT_TRACKING=3Dy
> > > > # CONFIG_CONTEXT_TRACKING_FORCE is not set
> > > > CONFIG_NO_HZ=3Dy
> > > > CONFIG_HIGH_RES_TIMERS=3Dy
> > > > # end of Timers subsystem
> > > > =

> > > > # CONFIG_PREEMPT_NONE is not set
> > > > CONFIG_PREEMPT_VOLUNTARY=3Dy
> > > > # CONFIG_PREEMPT is not set
> > > > CONFIG_PREEMPT_COUNT=3Dy
> > > > =

> > > > #
> > > > # CPU/Task time and stats accounting
> > > > #
> > > > CONFIG_VIRT_CPU_ACCOUNTING=3Dy
> > > > CONFIG_VIRT_CPU_ACCOUNTING_GEN=3Dy
> > > > CONFIG_IRQ_TIME_ACCOUNTING=3Dy
> > > > CONFIG_HAVE_SCHED_AVG_IRQ=3Dy
> > > > CONFIG_BSD_PROCESS_ACCT=3Dy
> > > > CONFIG_BSD_PROCESS_ACCT_V3=3Dy
> > > > CONFIG_TASKSTATS=3Dy
> > > > CONFIG_TASK_DELAY_ACCT=3Dy
> > > > CONFIG_TASK_XACCT=3Dy
> > > > CONFIG_TASK_IO_ACCOUNTING=3Dy
> > > > # CONFIG_PSI is not set
> > > > # end of CPU/Task time and stats accounting
> > > > =

> > > > CONFIG_CPU_ISOLATION=3Dy
> > > > =

> > > > #
> > > > # RCU Subsystem
> > > > #
> > > > CONFIG_TREE_RCU=3Dy
> > > > # CONFIG_RCU_EXPERT is not set
> > > > CONFIG_SRCU=3Dy
> > > > CONFIG_TREE_SRCU=3Dy
> > > > CONFIG_TASKS_RCU_GENERIC=3Dy
> > > > CONFIG_TASKS_RCU=3Dy
> > > > CONFIG_LONGWAIT_RCU=3Dy
> > > > CONFIG_TASKS_RUDE_RCU=3Dy
> > > > CONFIG_TASKS_TRACE_RCU=3Dy
> > > > CONFIG_RCU_STALL_COMMON=3Dy
> > > > CONFIG_RCU_NEED_SEGCBLIST=3Dy
> > > > CONFIG_RCU_NOCB_CPU=3Dy
> > > > # end of RCU Subsystem
> > > > =

> > > > CONFIG_BUILD_BIN2C=3Dy
> > > > CONFIG_IKCONFIG=3Dy
> > > > CONFIG_IKCONFIG_PROC=3Dy
> > > > # CONFIG_IKHEADERS is not set
> > > > CONFIG_LOG_BUF_SHIFT=3D20
> > > > CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
> > > > CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> > > > CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> > > > =

> > > > #
> > > > # Scheduler features
> > > > #
> > > > # CONFIG_UCLAMP_TASK is not set
> > > > # end of Scheduler features
> > > > =

> > > > CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
> > > > CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> > > > CONFIG_CC_HAS_INT128=3Dy
> > > > CONFIG_ARCH_SUPPORTS_INT128=3Dy
> > > > CONFIG_NUMA_BALANCING=3Dy
> > > > CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=3Dy
> > > > CONFIG_CGROUPS=3Dy
> > > > CONFIG_PAGE_COUNTER=3Dy
> > > > CONFIG_MEMCG=3Dy
> > > > CONFIG_MEMCG_SWAP=3Dy
> > > > CONFIG_MEMCG_KMEM=3Dy
> > > > CONFIG_BLK_CGROUP=3Dy
> > > > CONFIG_CGROUP_WRITEBACK=3Dy
> > > > CONFIG_CGROUP_SCHED=3Dy
> > > > CONFIG_FAIR_GROUP_SCHED=3Dy
> > > > CONFIG_CFS_BANDWIDTH=3Dy
> > > > CONFIG_RT_GROUP_SCHED=3Dy
> > > > CONFIG_CGROUP_PIDS=3Dy
> > > > CONFIG_CGROUP_RDMA=3Dy
> > > > CONFIG_CGROUP_FREEZER=3Dy
> > > > CONFIG_CGROUP_HUGETLB=3Dy
> > > > CONFIG_CPUSETS=3Dy
> > > > CONFIG_PROC_PID_CPUSET=3Dy
> > > > CONFIG_CGROUP_DEVICE=3Dy
> > > > CONFIG_CGROUP_CPUACCT=3Dy
> > > > CONFIG_CGROUP_PERF=3Dy
> > > > CONFIG_CGROUP_BPF=3Dy
> > > > # CONFIG_CGROUP_DEBUG is not set
> > > > CONFIG_SOCK_CGROUP_DATA=3Dy
> > > > CONFIG_NAMESPACES=3Dy
> > > > CONFIG_UTS_NS=3Dy
> > > > CONFIG_TIME_NS=3Dy
> > > > CONFIG_IPC_NS=3Dy
> > > > CONFIG_USER_NS=3Dy
> > > > CONFIG_PID_NS=3Dy
> > > > CONFIG_NET_NS=3Dy
> > > > # CONFIG_CHECKPOINT_RESTORE is not set
> > > > CONFIG_SCHED_AUTOGROUP=3Dy
> > > > # CONFIG_SYSFS_DEPRECATED is not set
> > > > CONFIG_RELAY=3Dy
> > > > CONFIG_BLK_DEV_INITRD=3Dy
> > > > CONFIG_INITRAMFS_SOURCE=3D""
> > > > CONFIG_RD_GZIP=3Dy
> > > > CONFIG_RD_BZIP2=3Dy
> > > > CONFIG_RD_LZMA=3Dy
> > > > CONFIG_RD_XZ=3Dy
> > > > CONFIG_RD_LZO=3Dy
> > > > CONFIG_RD_LZ4=3Dy
> > > > CONFIG_RD_ZSTD=3Dy
> > > > # CONFIG_BOOT_CONFIG is not set
> > > > CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
> > > > # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> > > > CONFIG_LD_ORPHAN_WARN=3Dy
> > > > CONFIG_SYSCTL=3Dy
> > > > CONFIG_HAVE_UID16=3Dy
> > > > CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> > > > CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> > > > CONFIG_BPF=3Dy
> > > > # CONFIG_EXPERT is not set
> > > > CONFIG_UID16=3Dy
> > > > CONFIG_MULTIUSER=3Dy
> > > > CONFIG_SGETMASK_SYSCALL=3Dy
> > > > CONFIG_SYSFS_SYSCALL=3Dy
> > > > CONFIG_FHANDLE=3Dy
> > > > CONFIG_POSIX_TIMERS=3Dy
> > > > CONFIG_PRINTK=3Dy
> > > > CONFIG_PRINTK_NMI=3Dy
> > > > CONFIG_BUG=3Dy
> > > > CONFIG_ELF_CORE=3Dy
> > > > CONFIG_PCSPKR_PLATFORM=3Dy
> > > > CONFIG_BASE_FULL=3Dy
> > > > CONFIG_FUTEX=3Dy
> > > > CONFIG_FUTEX_PI=3Dy
> > > > CONFIG_EPOLL=3Dy
> > > > CONFIG_SIGNALFD=3Dy
> > > > CONFIG_TIMERFD=3Dy
> > > > CONFIG_EVENTFD=3Dy
> > > > CONFIG_SHMEM=3Dy
> > > > CONFIG_AIO=3Dy
> > > > CONFIG_IO_URING=3Dy
> > > > CONFIG_ADVISE_SYSCALLS=3Dy
> > > > CONFIG_HAVE_ARCH_USERFAULTFD_WP=3Dy
> > > > CONFIG_MEMBARRIER=3Dy
> > > > CONFIG_KALLSYMS=3Dy
> > > > CONFIG_KALLSYMS_ALL=3Dy
> > > > CONFIG_KALLSYMS_ABSOLUTE_PERCPU=3Dy
> > > > CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> > > > # CONFIG_BPF_LSM is not set
> > > > CONFIG_BPF_SYSCALL=3Dy
> > > > CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=3Dy
> > > > CONFIG_BPF_JIT_ALWAYS_ON=3Dy
> > > > CONFIG_BPF_JIT_DEFAULT_ON=3Dy
> > > > # CONFIG_BPF_PRELOAD is not set
> > > > CONFIG_USERFAULTFD=3Dy
> > > > CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
> > > > CONFIG_KCMP=3Dy
> > > > CONFIG_RSEQ=3Dy
> > > > # CONFIG_EMBEDDED is not set
> > > > CONFIG_HAVE_PERF_EVENTS=3Dy
> > > > =

> > > > #
> > > > # Kernel Performance Events And Counters
> > > > #
> > > > CONFIG_PERF_EVENTS=3Dy
> > > > # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> > > > # end of Kernel Performance Events And Counters
> > > > =

> > > > CONFIG_VM_EVENT_COUNTERS=3Dy
> > > > CONFIG_SLUB_DEBUG=3Dy
> > > > # CONFIG_COMPAT_BRK is not set
> > > > # CONFIG_SLAB is not set
> > > > CONFIG_SLUB=3Dy
> > > > CONFIG_SLAB_MERGE_DEFAULT=3Dy
> > > > CONFIG_SLAB_FREELIST_RANDOM=3Dy
> > > > # CONFIG_SLAB_FREELIST_HARDENED is not set
> > > > CONFIG_SHUFFLE_PAGE_ALLOCATOR=3Dy
> > > > CONFIG_SLUB_CPU_PARTIAL=3Dy
> > > > CONFIG_SYSTEM_DATA_VERIFICATION=3Dy
> > > > CONFIG_PROFILING=3Dy
> > > > CONFIG_TRACEPOINTS=3Dy
> > > > # end of General setup
> > > > =

> > > > CONFIG_64BIT=3Dy
> > > > CONFIG_X86_64=3Dy
> > > > CONFIG_X86=3Dy
> > > > CONFIG_INSTRUCTION_DECODER=3Dy
> > > > CONFIG_OUTPUT_FORMAT=3D"elf64-x86-64"
> > > > CONFIG_LOCKDEP_SUPPORT=3Dy
> > > > CONFIG_STACKTRACE_SUPPORT=3Dy
> > > > CONFIG_MMU=3Dy
> > > > CONFIG_ARCH_MMAP_RND_BITS_MIN=3D28
> > > > CONFIG_ARCH_MMAP_RND_BITS_MAX=3D32
> > > > CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
> > > > CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
> > > > CONFIG_GENERIC_ISA_DMA=3Dy
> > > > CONFIG_GENERIC_BUG=3Dy
> > > > CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
> > > > CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
> > > > CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> > > > CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> > > > CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> > > > CONFIG_ARCH_HAS_FILTER_PGPROT=3Dy
> > > > CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> > > > CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> > > > CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> > > > CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> > > > CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> > > > CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
> > > > CONFIG_ZONE_DMA32=3Dy
> > > > CONFIG_AUDIT_ARCH=3Dy
> > > > CONFIG_HAVE_INTEL_TXT=3Dy
> > > > CONFIG_X86_64_SMP=3Dy
> > > > CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> > > > CONFIG_FIX_EARLYCON_MEM=3Dy
> > > > CONFIG_DYNAMIC_PHYSICAL_MASK=3Dy
> > > > CONFIG_PGTABLE_LEVELS=3D5
> > > > CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy
> > > > =

> > > > #
> > > > # Processor type and features
> > > > #
> > > > CONFIG_ZONE_DMA=3Dy
> > > > CONFIG_SMP=3Dy
> > > > CONFIG_X86_FEATURE_NAMES=3Dy
> > > > CONFIG_X86_X2APIC=3Dy
> > > > CONFIG_X86_MPPARSE=3Dy
> > > > # CONFIG_GOLDFISH is not set
> > > > CONFIG_RETPOLINE=3Dy
> > > > CONFIG_X86_CPU_RESCTRL=3Dy
> > > > CONFIG_X86_EXTENDED_PLATFORM=3Dy
> > > > # CONFIG_X86_NUMACHIP is not set
> > > > # CONFIG_X86_VSMP is not set
> > > > CONFIG_X86_UV=3Dy
> > > > # CONFIG_X86_GOLDFISH is not set
> > > > # CONFIG_X86_INTEL_MID is not set
> > > > CONFIG_X86_INTEL_LPSS=3Dy
> > > > CONFIG_X86_AMD_PLATFORM_DEVICE=3Dy
> > > > CONFIG_IOSF_MBI=3Dy
> > > > # CONFIG_IOSF_MBI_DEBUG is not set
> > > > CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
> > > > # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> > > > CONFIG_HYPERVISOR_GUEST=3Dy
> > > > CONFIG_PARAVIRT=3Dy
> > > > # CONFIG_PARAVIRT_DEBUG is not set
> > > > CONFIG_PARAVIRT_SPINLOCKS=3Dy
> > > > CONFIG_X86_HV_CALLBACK_VECTOR=3Dy
> > > > CONFIG_XEN=3Dy
> > > > # CONFIG_XEN_PV is not set
> > > > CONFIG_XEN_PVHVM=3Dy
> > > > CONFIG_XEN_PVHVM_SMP=3Dy
> > > > CONFIG_XEN_PVHVM_GUEST=3Dy
> > > > CONFIG_XEN_SAVE_RESTORE=3Dy
> > > > # CONFIG_XEN_DEBUG_FS is not set
> > > > # CONFIG_XEN_PVH is not set
> > > > CONFIG_KVM_GUEST=3Dy
> > > > CONFIG_ARCH_CPUIDLE_HALTPOLL=3Dy
> > > > # CONFIG_PVH is not set
> > > > CONFIG_PARAVIRT_TIME_ACCOUNTING=3Dy
> > > > CONFIG_PARAVIRT_CLOCK=3Dy
> > > > # CONFIG_JAILHOUSE_GUEST is not set
> > > > # CONFIG_ACRN_GUEST is not set
> > > > # CONFIG_MK8 is not set
> > > > # CONFIG_MPSC is not set
> > > > # CONFIG_MCORE2 is not set
> > > > # CONFIG_MATOM is not set
> > > > CONFIG_GENERIC_CPU=3Dy
> > > > CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
> > > > CONFIG_X86_L1_CACHE_SHIFT=3D6
> > > > CONFIG_X86_TSC=3Dy
> > > > CONFIG_X86_CMPXCHG64=3Dy
> > > > CONFIG_X86_CMOV=3Dy
> > > > CONFIG_X86_MINIMUM_CPU_FAMILY=3D64
> > > > CONFIG_X86_DEBUGCTLMSR=3Dy
> > > > CONFIG_IA32_FEAT_CTL=3Dy
> > > > CONFIG_X86_VMX_FEATURE_NAMES=3Dy
> > > > CONFIG_CPU_SUP_INTEL=3Dy
> > > > CONFIG_CPU_SUP_AMD=3Dy
> > > > CONFIG_CPU_SUP_HYGON=3Dy
> > > > CONFIG_CPU_SUP_CENTAUR=3Dy
> > > > CONFIG_CPU_SUP_ZHAOXIN=3Dy
> > > > CONFIG_HPET_TIMER=3Dy
> > > > CONFIG_HPET_EMULATE_RTC=3Dy
> > > > CONFIG_DMI=3Dy
> > > > # CONFIG_GART_IOMMU is not set
> > > > CONFIG_MAXSMP=3Dy
> > > > CONFIG_NR_CPUS_RANGE_BEGIN=3D8192
> > > > CONFIG_NR_CPUS_RANGE_END=3D8192
> > > > CONFIG_NR_CPUS_DEFAULT=3D8192
> > > > CONFIG_NR_CPUS=3D8192
> > > > CONFIG_SCHED_SMT=3Dy
> > > > CONFIG_SCHED_MC=3Dy
> > > > CONFIG_SCHED_MC_PRIO=3Dy
> > > > CONFIG_X86_LOCAL_APIC=3Dy
> > > > CONFIG_X86_IO_APIC=3Dy
> > > > CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
> > > > CONFIG_X86_MCE=3Dy
> > > > CONFIG_X86_MCELOG_LEGACY=3Dy
> > > > CONFIG_X86_MCE_INTEL=3Dy
> > > > CONFIG_X86_MCE_AMD=3Dy
> > > > CONFIG_X86_MCE_THRESHOLD=3Dy
> > > > CONFIG_X86_MCE_INJECT=3Dm
> > > > =

> > > > #
> > > > # Performance monitoring
> > > > #
> > > > CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dm
> > > > CONFIG_PERF_EVENTS_INTEL_RAPL=3Dm
> > > > CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dm
> > > > CONFIG_PERF_EVENTS_AMD_POWER=3Dm
> > > > # end of Performance monitoring
> > > > =

> > > > CONFIG_X86_16BIT=3Dy
> > > > CONFIG_X86_ESPFIX64=3Dy
> > > > CONFIG_X86_VSYSCALL_EMULATION=3Dy
> > > > CONFIG_X86_IOPL_IOPERM=3Dy
> > > > CONFIG_I8K=3Dm
> > > > CONFIG_MICROCODE=3Dy
> > > > CONFIG_MICROCODE_INTEL=3Dy
> > > > CONFIG_MICROCODE_AMD=3Dy
> > > > CONFIG_MICROCODE_OLD_INTERFACE=3Dy
> > > > CONFIG_X86_MSR=3Dy
> > > > CONFIG_X86_CPUID=3Dy
> > > > CONFIG_X86_5LEVEL=3Dy
> > > > CONFIG_X86_DIRECT_GBPAGES=3Dy
> > > > # CONFIG_X86_CPA_STATISTICS is not set
> > > > CONFIG_AMD_MEM_ENCRYPT=3Dy
> > > > # CONFIG_AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT is not set
> > > > CONFIG_NUMA=3Dy
> > > > CONFIG_AMD_NUMA=3Dy
> > > > CONFIG_X86_64_ACPI_NUMA=3Dy
> > > > CONFIG_NUMA_EMU=3Dy
> > > > CONFIG_NODES_SHIFT=3D10
> > > > CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> > > > CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
> > > > CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> > > > # CONFIG_ARCH_MEMORY_PROBE is not set
> > > > CONFIG_ARCH_PROC_KCORE_TEXT=3Dy
> > > > CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
> > > > CONFIG_X86_PMEM_LEGACY_DEVICE=3Dy
> > > > CONFIG_X86_PMEM_LEGACY=3Dm
> > > > CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
> > > > # CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
> > > > CONFIG_X86_RESERVE_LOW=3D64
> > > > CONFIG_MTRR=3Dy
> > > > CONFIG_MTRR_SANITIZER=3Dy
> > > > CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=3D1
> > > > CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=3D1
> > > > CONFIG_X86_PAT=3Dy
> > > > CONFIG_ARCH_USES_PG_UNCACHED=3Dy
> > > > CONFIG_ARCH_RANDOM=3Dy
> > > > CONFIG_X86_SMAP=3Dy
> > > > CONFIG_X86_UMIP=3Dy
> > > > CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=3Dy
> > > > CONFIG_X86_INTEL_TSX_MODE_OFF=3Dy
> > > > # CONFIG_X86_INTEL_TSX_MODE_ON is not set
> > > > # CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
> > > > # CONFIG_X86_SGX is not set
> > > > CONFIG_EFI=3Dy
> > > > CONFIG_EFI_STUB=3Dy
> > > > CONFIG_EFI_MIXED=3Dy
> > > > # CONFIG_HZ_100 is not set
> > > > # CONFIG_HZ_250 is not set
> > > > # CONFIG_HZ_300 is not set
> > > > CONFIG_HZ_1000=3Dy
> > > > CONFIG_HZ=3D1000
> > > > CONFIG_SCHED_HRTICK=3Dy
> > > > CONFIG_KEXEC=3Dy
> > > > CONFIG_KEXEC_FILE=3Dy
> > > > CONFIG_ARCH_HAS_KEXEC_PURGATORY=3Dy
> > > > # CONFIG_KEXEC_SIG is not set
> > > > CONFIG_CRASH_DUMP=3Dy
> > > > CONFIG_KEXEC_JUMP=3Dy
> > > > CONFIG_PHYSICAL_START=3D0x1000000
> > > > CONFIG_RELOCATABLE=3Dy
> > > > CONFIG_RANDOMIZE_BASE=3Dy
> > > > CONFIG_X86_NEED_RELOCS=3Dy
> > > > CONFIG_PHYSICAL_ALIGN=3D0x200000
> > > > CONFIG_DYNAMIC_MEMORY_LAYOUT=3Dy
> > > > CONFIG_RANDOMIZE_MEMORY=3Dy
> > > > CONFIG_RANDOMIZE_MEMORY_PHYSICAL_PADDING=3D0xa
> > > > CONFIG_HOTPLUG_CPU=3Dy
> > > > CONFIG_BOOTPARAM_HOTPLUG_CPU0=3Dy
> > > > # CONFIG_DEBUG_HOTPLUG_CPU0 is not set
> > > > # CONFIG_COMPAT_VDSO is not set
> > > > CONFIG_LEGACY_VSYSCALL_EMULATE=3Dy
> > > > # CONFIG_LEGACY_VSYSCALL_XONLY is not set
> > > > # CONFIG_LEGACY_VSYSCALL_NONE is not set
> > > > # CONFIG_CMDLINE_BOOL is not set
> > > > CONFIG_MODIFY_LDT_SYSCALL=3Dy
> > > > CONFIG_HAVE_LIVEPATCH=3Dy
> > > > CONFIG_LIVEPATCH=3Dy
> > > > # end of Processor type and features
> > > > =

> > > > CONFIG_ARCH_HAS_ADD_PAGES=3Dy
> > > > CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> > > > CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=3Dy
> > > > CONFIG_USE_PERCPU_NUMA_NODE_ID=3Dy
> > > > CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> > > > CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=3Dy
> > > > CONFIG_ARCH_ENABLE_THP_MIGRATION=3Dy
> > > > =

> > > > #
> > > > # Power management and ACPI options
> > > > #
> > > > CONFIG_ARCH_HIBERNATION_HEADER=3Dy
> > > > CONFIG_SUSPEND=3Dy
> > > > CONFIG_SUSPEND_FREEZER=3Dy
> > > > CONFIG_HIBERNATE_CALLBACKS=3Dy
> > > > CONFIG_HIBERNATION=3Dy
> > > > CONFIG_HIBERNATION_SNAPSHOT_DEV=3Dy
> > > > CONFIG_PM_STD_PARTITION=3D""
> > > > CONFIG_PM_SLEEP=3Dy
> > > > CONFIG_PM_SLEEP_SMP=3Dy
> > > > # CONFIG_PM_AUTOSLEEP is not set
> > > > # CONFIG_PM_WAKELOCKS is not set
> > > > CONFIG_PM=3Dy
> > > > CONFIG_PM_DEBUG=3Dy
> > > > # CONFIG_PM_ADVANCED_DEBUG is not set
> > > > # CONFIG_PM_TEST_SUSPEND is not set
> > > > CONFIG_PM_SLEEP_DEBUG=3Dy
> > > > # CONFIG_PM_TRACE_RTC is not set
> > > > CONFIG_PM_CLK=3Dy
> > > > # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
> > > > # CONFIG_ENERGY_MODEL is not set
> > > > CONFIG_ARCH_SUPPORTS_ACPI=3Dy
> > > > CONFIG_ACPI=3Dy
> > > > CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> > > > CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> > > > CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> > > > # CONFIG_ACPI_DEBUGGER is not set
> > > > CONFIG_ACPI_SPCR_TABLE=3Dy
> > > > # CONFIG_ACPI_FPDT is not set
> > > > CONFIG_ACPI_LPIT=3Dy
> > > > CONFIG_ACPI_SLEEP=3Dy
> > > > CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
> > > > CONFIG_ACPI_EC_DEBUGFS=3Dm
> > > > CONFIG_ACPI_AC=3Dy
> > > > CONFIG_ACPI_BATTERY=3Dy
> > > > CONFIG_ACPI_BUTTON=3Dy
> > > > CONFIG_ACPI_VIDEO=3Dm
> > > > CONFIG_ACPI_FAN=3Dy
> > > > CONFIG_ACPI_TAD=3Dm
> > > > CONFIG_ACPI_DOCK=3Dy
> > > > CONFIG_ACPI_CPU_FREQ_PSS=3Dy
> > > > CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> > > > CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> > > > CONFIG_ACPI_CPPC_LIB=3Dy
> > > > CONFIG_ACPI_PROCESSOR=3Dy
> > > > CONFIG_ACPI_IPMI=3Dm
> > > > CONFIG_ACPI_HOTPLUG_CPU=3Dy
> > > > CONFIG_ACPI_PROCESSOR_AGGREGATOR=3Dm
> > > > CONFIG_ACPI_THERMAL=3Dy
> > > > CONFIG_ACPI_PLATFORM_PROFILE=3Dm
> > > > CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> > > > CONFIG_ACPI_TABLE_UPGRADE=3Dy
> > > > # CONFIG_ACPI_DEBUG is not set
> > > > CONFIG_ACPI_PCI_SLOT=3Dy
> > > > CONFIG_ACPI_CONTAINER=3Dy
> > > > CONFIG_ACPI_HOTPLUG_MEMORY=3Dy
> > > > CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> > > > CONFIG_ACPI_SBS=3Dm
> > > > CONFIG_ACPI_HED=3Dy
> > > > # CONFIG_ACPI_CUSTOM_METHOD is not set
> > > > CONFIG_ACPI_BGRT=3Dy
> > > > CONFIG_ACPI_NFIT=3Dm
> > > > # CONFIG_NFIT_SECURITY_DEBUG is not set
> > > > CONFIG_ACPI_NUMA=3Dy
> > > > # CONFIG_ACPI_HMAT is not set
> > > > CONFIG_HAVE_ACPI_APEI=3Dy
> > > > CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> > > > CONFIG_ACPI_APEI=3Dy
> > > > CONFIG_ACPI_APEI_GHES=3Dy
> > > > CONFIG_ACPI_APEI_PCIEAER=3Dy
> > > > CONFIG_ACPI_APEI_MEMORY_FAILURE=3Dy
> > > > CONFIG_ACPI_APEI_EINJ=3Dm
> > > > CONFIG_ACPI_APEI_ERST_DEBUG=3Dy
> > > > # CONFIG_ACPI_DPTF is not set
> > > > CONFIG_ACPI_WATCHDOG=3Dy
> > > > CONFIG_ACPI_EXTLOG=3Dm
> > > > CONFIG_ACPI_ADXL=3Dy
> > > > # CONFIG_ACPI_CONFIGFS is not set
> > > > CONFIG_PMIC_OPREGION=3Dy
> > > > CONFIG_X86_PM_TIMER=3Dy
> > > > =

> > > > #
> > > > # CPU Frequency scaling
> > > > #
> > > > CONFIG_CPU_FREQ=3Dy
> > > > CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
> > > > CONFIG_CPU_FREQ_GOV_COMMON=3Dy
> > > > CONFIG_CPU_FREQ_STAT=3Dy
> > > > CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=3Dy
> > > > # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> > > > # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
> > > > # CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
> > > > CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> > > > CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
> > > > CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
> > > > CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
> > > > CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
> > > > CONFIG_CPU_FREQ_GOV_SCHEDUTIL=3Dy
> > > > =

> > > > #
> > > > # CPU frequency scaling drivers
> > > > #
> > > > CONFIG_X86_INTEL_PSTATE=3Dy
> > > > # CONFIG_X86_PCC_CPUFREQ is not set
> > > > CONFIG_X86_ACPI_CPUFREQ=3Dm
> > > > CONFIG_X86_ACPI_CPUFREQ_CPB=3Dy
> > > > CONFIG_X86_POWERNOW_K8=3Dm
> > > > CONFIG_X86_AMD_FREQ_SENSITIVITY=3Dm
> > > > # CONFIG_X86_SPEEDSTEP_CENTRINO is not set
> > > > CONFIG_X86_P4_CLOCKMOD=3Dm
> > > > =

> > > > #
> > > > # shared options
> > > > #
> > > > CONFIG_X86_SPEEDSTEP_LIB=3Dm
> > > > # end of CPU Frequency scaling
> > > > =

> > > > #
> > > > # CPU Idle
> > > > #
> > > > CONFIG_CPU_IDLE=3Dy
> > > > # CONFIG_CPU_IDLE_GOV_LADDER is not set
> > > > CONFIG_CPU_IDLE_GOV_MENU=3Dy
> > > > # CONFIG_CPU_IDLE_GOV_TEO is not set
> > > > # CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
> > > > CONFIG_HALTPOLL_CPUIDLE=3Dy
> > > > # end of CPU Idle
> > > > =

> > > > CONFIG_INTEL_IDLE=3Dy
> > > > # end of Power management and ACPI options
> > > > =

> > > > #
> > > > # Bus options (PCI etc.)
> > > > #
> > > > CONFIG_PCI_DIRECT=3Dy
> > > > CONFIG_PCI_MMCONFIG=3Dy
> > > > CONFIG_PCI_XEN=3Dy
> > > > CONFIG_MMCONF_FAM10H=3Dy
> > > > CONFIG_ISA_DMA_API=3Dy
> > > > CONFIG_AMD_NB=3Dy
> > > > # CONFIG_X86_SYSFB is not set
> > > > # end of Bus options (PCI etc.)
> > > > =

> > > > #
> > > > # Binary Emulations
> > > > #
> > > > CONFIG_IA32_EMULATION=3Dy
> > > > # CONFIG_X86_X32 is not set
> > > > CONFIG_COMPAT_32=3Dy
> > > > CONFIG_COMPAT=3Dy
> > > > CONFIG_COMPAT_FOR_U64_ALIGNMENT=3Dy
> > > > CONFIG_SYSVIPC_COMPAT=3Dy
> > > > # end of Binary Emulations
> > > > =

> > > > #
> > > > # Firmware Drivers
> > > > #
> > > > CONFIG_EDD=3Dm
> > > > # CONFIG_EDD_OFF is not set
> > > > CONFIG_FIRMWARE_MEMMAP=3Dy
> > > > CONFIG_DMIID=3Dy
> > > > CONFIG_DMI_SYSFS=3Dy
> > > > CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
> > > > # CONFIG_ISCSI_IBFT is not set
> > > > CONFIG_FW_CFG_SYSFS=3Dy
> > > > # CONFIG_FW_CFG_SYSFS_CMDLINE is not set
> > > > # CONFIG_GOOGLE_FIRMWARE is not set
> > > > =

> > > > #
> > > > # EFI (Extensible Firmware Interface) Support
> > > > #
> > > > CONFIG_EFI_VARS=3Dy
> > > > CONFIG_EFI_ESRT=3Dy
> > > > CONFIG_EFI_VARS_PSTORE=3Dy
> > > > CONFIG_EFI_VARS_PSTORE_DEFAULT_DISABLE=3Dy
> > > > CONFIG_EFI_RUNTIME_MAP=3Dy
> > > > # CONFIG_EFI_FAKE_MEMMAP is not set
> > > > CONFIG_EFI_RUNTIME_WRAPPERS=3Dy
> > > > CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER=3Dy
> > > > # CONFIG_EFI_BOOTLOADER_CONTROL is not set
> > > > # CONFIG_EFI_CAPSULE_LOADER is not set
> > > > # CONFIG_EFI_TEST is not set
> > > > CONFIG_APPLE_PROPERTIES=3Dy
> > > > # CONFIG_RESET_ATTACK_MITIGATION is not set
> > > > # CONFIG_EFI_RCI2_TABLE is not set
> > > > # CONFIG_EFI_DISABLE_PCI_DMA is not set
> > > > # end of EFI (Extensible Firmware Interface) Support
> > > > =

> > > > CONFIG_UEFI_CPER=3Dy
> > > > CONFIG_UEFI_CPER_X86=3Dy
> > > > CONFIG_EFI_DEV_PATH_PARSER=3Dy
> > > > CONFIG_EFI_EARLYCON=3Dy
> > > > CONFIG_EFI_CUSTOM_SSDT_OVERLAYS=3Dy
> > > > =

> > > > #
> > > > # Tegra firmware driver
> > > > #
> > > > # end of Tegra firmware driver
> > > > # end of Firmware Drivers
> > > > =

> > > > CONFIG_HAVE_KVM=3Dy
> > > > CONFIG_HAVE_KVM_IRQCHIP=3Dy
> > > > CONFIG_HAVE_KVM_IRQFD=3Dy
> > > > CONFIG_HAVE_KVM_IRQ_ROUTING=3Dy
> > > > CONFIG_HAVE_KVM_EVENTFD=3Dy
> > > > CONFIG_KVM_MMIO=3Dy
> > > > CONFIG_KVM_ASYNC_PF=3Dy
> > > > CONFIG_HAVE_KVM_MSI=3Dy
> > > > CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=3Dy
> > > > CONFIG_KVM_VFIO=3Dy
> > > > CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=3Dy
> > > > CONFIG_KVM_COMPAT=3Dy
> > > > CONFIG_HAVE_KVM_IRQ_BYPASS=3Dy
> > > > CONFIG_HAVE_KVM_NO_POLL=3Dy
> > > > CONFIG_KVM_XFER_TO_GUEST_WORK=3Dy
> > > > CONFIG_VIRTUALIZATION=3Dy
> > > > CONFIG_KVM=3Dm
> > > > CONFIG_KVM_INTEL=3Dm
> > > > # CONFIG_KVM_AMD is not set
> > > > # CONFIG_KVM_XEN is not set
> > > > CONFIG_KVM_MMU_AUDIT=3Dy
> > > > CONFIG_AS_AVX512=3Dy
> > > > CONFIG_AS_SHA1_NI=3Dy
> > > > CONFIG_AS_SHA256_NI=3Dy
> > > > CONFIG_AS_TPAUSE=3Dy
> > > > =

> > > > #
> > > > # General architecture-dependent options
> > > > #
> > > > CONFIG_CRASH_CORE=3Dy
> > > > CONFIG_KEXEC_CORE=3Dy
> > > > CONFIG_HOTPLUG_SMT=3Dy
> > > > CONFIG_GENERIC_ENTRY=3Dy
> > > > CONFIG_KPROBES=3Dy
> > > > CONFIG_JUMP_LABEL=3Dy
> > > > # CONFIG_STATIC_KEYS_SELFTEST is not set
> > > > # CONFIG_STATIC_CALL_SELFTEST is not set
> > > > CONFIG_OPTPROBES=3Dy
> > > > CONFIG_KPROBES_ON_FTRACE=3Dy
> > > > CONFIG_UPROBES=3Dy
> > > > CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> > > > CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> > > > CONFIG_KRETPROBES=3Dy
> > > > CONFIG_USER_RETURN_NOTIFIER=3Dy
> > > > CONFIG_HAVE_IOREMAP_PROT=3Dy
> > > > CONFIG_HAVE_KPROBES=3Dy
> > > > CONFIG_HAVE_KRETPROBES=3Dy
> > > > CONFIG_HAVE_OPTPROBES=3Dy
> > > > CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
> > > > CONFIG_HAVE_FUNCTION_ERROR_INJECTION=3Dy
> > > > CONFIG_HAVE_NMI=3Dy
> > > > CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> > > > CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> > > > CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> > > > CONFIG_ARCH_HAS_FORTIFY_SOURCE=3Dy
> > > > CONFIG_ARCH_HAS_SET_MEMORY=3Dy
> > > > CONFIG_ARCH_HAS_SET_DIRECT_MAP=3Dy
> > > > CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=3Dy
> > > > CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> > > > CONFIG_HAVE_ASM_MODVERSIONS=3Dy
> > > > CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> > > > CONFIG_HAVE_RSEQ=3Dy
> > > > CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=3Dy
> > > > CONFIG_HAVE_HW_BREAKPOINT=3Dy
> > > > CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> > > > CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> > > > CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> > > > CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
> > > > CONFIG_HAVE_PERF_REGS=3Dy
> > > > CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> > > > CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> > > > CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=3Dy
> > > > CONFIG_MMU_GATHER_TABLE_FREE=3Dy
> > > > CONFIG_MMU_GATHER_RCU_TABLE_FREE=3Dy
> > > > CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> > > > CONFIG_HAVE_ALIGNED_STRUCT_PAGE=3Dy
> > > > CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> > > > CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> > > > CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=3Dy
> > > > CONFIG_ARCH_WANT_OLD_COMPAT_IPC=3Dy
> > > > CONFIG_HAVE_ARCH_SECCOMP=3Dy
> > > > CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> > > > CONFIG_SECCOMP=3Dy
> > > > CONFIG_SECCOMP_FILTER=3Dy
> > > > # CONFIG_SECCOMP_CACHE_DEBUG is not set
> > > > CONFIG_HAVE_ARCH_STACKLEAK=3Dy
> > > > CONFIG_HAVE_STACKPROTECTOR=3Dy
> > > > CONFIG_STACKPROTECTOR=3Dy
> > > > CONFIG_STACKPROTECTOR_STRONG=3Dy
> > > > CONFIG_ARCH_SUPPORTS_LTO_CLANG=3Dy
> > > > CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=3Dy
> > > > CONFIG_LTO_NONE=3Dy
> > > > CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> > > > CONFIG_HAVE_CONTEXT_TRACKING=3Dy
> > > > CONFIG_HAVE_CONTEXT_TRACKING_OFFSTACK=3Dy
> > > > CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
> > > > CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> > > > CONFIG_HAVE_MOVE_PUD=3Dy
> > > > CONFIG_HAVE_MOVE_PMD=3Dy
> > > > CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> > > > CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=3Dy
> > > > CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> > > > CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
> > > > CONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy
> > > > CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
> > > > CONFIG_MODULES_USE_ELF_RELA=3Dy
> > > > CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=3Dy
> > > > CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=3Dy
> > > > CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> > > > CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
> > > > CONFIG_HAVE_EXIT_THREAD=3Dy
> > > > CONFIG_ARCH_MMAP_RND_BITS=3D28
> > > > CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=3Dy
> > > > CONFIG_ARCH_MMAP_RND_COMPAT_BITS=3D8
> > > > CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=3Dy
> > > > CONFIG_HAVE_STACK_VALIDATION=3Dy
> > > > CONFIG_HAVE_RELIABLE_STACKTRACE=3Dy
> > > > CONFIG_OLD_SIGSUSPEND3=3Dy
> > > > CONFIG_COMPAT_OLD_SIGACTION=3Dy
> > > > CONFIG_COMPAT_32BIT_TIME=3Dy
> > > > CONFIG_HAVE_ARCH_VMAP_STACK=3Dy
> > > > CONFIG_VMAP_STACK=3Dy
> > > > CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> > > > CONFIG_STRICT_KERNEL_RWX=3Dy
> > > > CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> > > > CONFIG_STRICT_MODULE_RWX=3Dy
> > > > CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=3Dy
> > > > CONFIG_ARCH_USE_MEMREMAP_PROT=3Dy
> > > > # CONFIG_LOCK_EVENT_COUNTS is not set
> > > > CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
> > > > CONFIG_HAVE_STATIC_CALL=3Dy
> > > > CONFIG_HAVE_STATIC_CALL_INLINE=3Dy
> > > > CONFIG_HAVE_PREEMPT_DYNAMIC=3Dy
> > > > CONFIG_ARCH_WANT_LD_ORPHAN_WARN=3Dy
> > > > CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> > > > CONFIG_ARCH_HAS_ELFCORE_COMPAT=3Dy
> > > > =

> > > > #
> > > > # GCOV-based kernel profiling
> > > > #
> > > > # CONFIG_GCOV_KERNEL is not set
> > > > CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> > > > # end of GCOV-based kernel profiling
> > > > =

> > > > CONFIG_HAVE_GCC_PLUGINS=3Dy
> > > > # end of General architecture-dependent options
> > > > =

> > > > CONFIG_RT_MUTEXES=3Dy
> > > > CONFIG_BASE_SMALL=3D0
> > > > CONFIG_MODULE_SIG_FORMAT=3Dy
> > > > CONFIG_MODULES=3Dy
> > > > CONFIG_MODULE_FORCE_LOAD=3Dy
> > > > CONFIG_MODULE_UNLOAD=3Dy
> > > > # CONFIG_MODULE_FORCE_UNLOAD is not set
> > > > # CONFIG_MODVERSIONS is not set
> > > > # CONFIG_MODULE_SRCVERSION_ALL is not set
> > > > CONFIG_MODULE_SIG=3Dy
> > > > # CONFIG_MODULE_SIG_FORCE is not set
> > > > CONFIG_MODULE_SIG_ALL=3Dy
> > > > # CONFIG_MODULE_SIG_SHA1 is not set
> > > > # CONFIG_MODULE_SIG_SHA224 is not set
> > > > CONFIG_MODULE_SIG_SHA256=3Dy
> > > > # CONFIG_MODULE_SIG_SHA384 is not set
> > > > # CONFIG_MODULE_SIG_SHA512 is not set
> > > > CONFIG_MODULE_SIG_HASH=3D"sha256"
> > > > # CONFIG_MODULE_COMPRESS is not set
> > > > # CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
> > > > CONFIG_MODULES_TREE_LOOKUP=3Dy
> > > > CONFIG_BLOCK=3Dy
> > > > CONFIG_BLK_SCSI_REQUEST=3Dy
> > > > CONFIG_BLK_CGROUP_RWSTAT=3Dy
> > > > CONFIG_BLK_DEV_BSG=3Dy
> > > > CONFIG_BLK_DEV_BSGLIB=3Dy
> > > > CONFIG_BLK_DEV_INTEGRITY=3Dy
> > > > CONFIG_BLK_DEV_INTEGRITY_T10=3Dm
> > > > CONFIG_BLK_DEV_ZONED=3Dy
> > > > CONFIG_BLK_DEV_THROTTLING=3Dy
> > > > # CONFIG_BLK_DEV_THROTTLING_LOW is not set
> > > > # CONFIG_BLK_CMDLINE_PARSER is not set
> > > > CONFIG_BLK_WBT=3Dy
> > > > # CONFIG_BLK_CGROUP_IOLATENCY is not set
> > > > # CONFIG_BLK_CGROUP_IOCOST is not set
> > > > CONFIG_BLK_WBT_MQ=3Dy
> > > > CONFIG_BLK_DEBUG_FS=3Dy
> > > > CONFIG_BLK_DEBUG_FS_ZONED=3Dy
> > > > # CONFIG_BLK_SED_OPAL is not set
> > > > # CONFIG_BLK_INLINE_ENCRYPTION is not set
> > > > =

> > > > #
> > > > # Partition Types
> > > > #
> > > > CONFIG_PARTITION_ADVANCED=3Dy
> > > > # CONFIG_ACORN_PARTITION is not set
> > > > # CONFIG_AIX_PARTITION is not set
> > > > CONFIG_OSF_PARTITION=3Dy
> > > > CONFIG_AMIGA_PARTITION=3Dy
> > > > # CONFIG_ATARI_PARTITION is not set
> > > > CONFIG_MAC_PARTITION=3Dy
> > > > CONFIG_MSDOS_PARTITION=3Dy
> > > > CONFIG_BSD_DISKLABEL=3Dy
> > > > CONFIG_MINIX_SUBPARTITION=3Dy
> > > > CONFIG_SOLARIS_X86_PARTITION=3Dy
> > > > CONFIG_UNIXWARE_DISKLABEL=3Dy
> > > > # CONFIG_LDM_PARTITION is not set
> > > > CONFIG_SGI_PARTITION=3Dy
> > > > # CONFIG_ULTRIX_PARTITION is not set
> > > > CONFIG_SUN_PARTITION=3Dy
> > > > CONFIG_KARMA_PARTITION=3Dy
> > > > CONFIG_EFI_PARTITION=3Dy
> > > > # CONFIG_SYSV68_PARTITION is not set
> > > > # CONFIG_CMDLINE_PARTITION is not set
> > > > # end of Partition Types
> > > > =

> > > > CONFIG_BLOCK_COMPAT=3Dy
> > > > CONFIG_BLK_MQ_PCI=3Dy
> > > > CONFIG_BLK_MQ_VIRTIO=3Dy
> > > > CONFIG_BLK_MQ_RDMA=3Dy
> > > > CONFIG_BLK_PM=3Dy
> > > > =

> > > > #
> > > > # IO Schedulers
> > > > #
> > > > CONFIG_MQ_IOSCHED_DEADLINE=3Dy
> > > > CONFIG_MQ_IOSCHED_KYBER=3Dy
> > > > CONFIG_IOSCHED_BFQ=3Dy
> > > > CONFIG_BFQ_GROUP_IOSCHED=3Dy
> > > > # CONFIG_BFQ_CGROUP_DEBUG is not set
> > > > # end of IO Schedulers
> > > > =

> > > > CONFIG_PREEMPT_NOTIFIERS=3Dy
> > > > CONFIG_PADATA=3Dy
> > > > CONFIG_ASN1=3Dy
> > > > CONFIG_INLINE_SPIN_UNLOCK_IRQ=3Dy
> > > > CONFIG_INLINE_READ_UNLOCK=3Dy
> > > > CONFIG_INLINE_READ_UNLOCK_IRQ=3Dy
> > > > CONFIG_INLINE_WRITE_UNLOCK=3Dy
> > > > CONFIG_INLINE_WRITE_UNLOCK_IRQ=3Dy
> > > > CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> > > > CONFIG_MUTEX_SPIN_ON_OWNER=3Dy
> > > > CONFIG_RWSEM_SPIN_ON_OWNER=3Dy
> > > > CONFIG_LOCK_SPIN_ON_OWNER=3Dy
> > > > CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> > > > CONFIG_QUEUED_SPINLOCKS=3Dy
> > > > CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> > > > CONFIG_QUEUED_RWLOCKS=3Dy
> > > > CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=3Dy
> > > > CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=3Dy
> > > > CONFIG_ARCH_HAS_SYSCALL_WRAPPER=3Dy
> > > > CONFIG_FREEZER=3Dy
> > > > =

> > > > #
> > > > # Executable file formats
> > > > #
> > > > CONFIG_BINFMT_ELF=3Dy
> > > > CONFIG_COMPAT_BINFMT_ELF=3Dy
> > > > CONFIG_ELFCORE=3Dy
> > > > CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=3Dy
> > > > CONFIG_BINFMT_SCRIPT=3Dy
> > > > CONFIG_BINFMT_MISC=3Dm
> > > > CONFIG_COREDUMP=3Dy
> > > > # end of Executable file formats
> > > > =

> > > > #
> > > > # Memory Management options
> > > > #
> > > > CONFIG_SELECT_MEMORY_MODEL=3Dy
> > > > CONFIG_SPARSEMEM_MANUAL=3Dy
> > > > CONFIG_SPARSEMEM=3Dy
> > > > CONFIG_NEED_MULTIPLE_NODES=3Dy
> > > > CONFIG_SPARSEMEM_EXTREME=3Dy
> > > > CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
> > > > CONFIG_SPARSEMEM_VMEMMAP=3Dy
> > > > CONFIG_HAVE_FAST_GUP=3Dy
> > > > CONFIG_NUMA_KEEP_MEMINFO=3Dy
> > > > CONFIG_MEMORY_ISOLATION=3Dy
> > > > CONFIG_HAVE_BOOTMEM_INFO_NODE=3Dy
> > > > CONFIG_MEMORY_HOTPLUG=3Dy
> > > > CONFIG_MEMORY_HOTPLUG_SPARSE=3Dy
> > > > # CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
> > > > CONFIG_MEMORY_HOTREMOVE=3Dy
> > > > CONFIG_SPLIT_PTLOCK_CPUS=3D4
> > > > CONFIG_MEMORY_BALLOON=3Dy
> > > > CONFIG_BALLOON_COMPACTION=3Dy
> > > > CONFIG_COMPACTION=3Dy
> > > > CONFIG_PAGE_REPORTING=3Dy
> > > > CONFIG_MIGRATION=3Dy
> > > > CONFIG_CONTIG_ALLOC=3Dy
> > > > CONFIG_PHYS_ADDR_T_64BIT=3Dy
> > > > CONFIG_BOUNCE=3Dy
> > > > CONFIG_VIRT_TO_BUS=3Dy
> > > > CONFIG_MMU_NOTIFIER=3Dy
> > > > CONFIG_KSM=3Dy
> > > > CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> > > > CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
> > > > CONFIG_MEMORY_FAILURE=3Dy
> > > > CONFIG_HWPOISON_INJECT=3Dm
> > > > CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> > > > CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=3Dy
> > > > # CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
> > > > CONFIG_ARCH_WANTS_THP_SWAP=3Dy
> > > > CONFIG_THP_SWAP=3Dy
> > > > CONFIG_CLEANCACHE=3Dy
> > > > CONFIG_FRONTSWAP=3Dy
> > > > CONFIG_CMA=3Dy
> > > > # CONFIG_CMA_DEBUG is not set
> > > > # CONFIG_CMA_DEBUGFS is not set
> > > > CONFIG_CMA_AREAS=3D19
> > > > CONFIG_ZSWAP=3Dy
> > > > # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
> > > > CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO=3Dy
> > > > # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
> > > > # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
> > > > # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC is not set
> > > > # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
> > > > CONFIG_ZSWAP_COMPRESSOR_DEFAULT=3D"lzo"
> > > > CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD=3Dy
> > > > # CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD is not set
> > > > # CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC is not set
> > > > CONFIG_ZSWAP_ZPOOL_DEFAULT=3D"zbud"
> > > > # CONFIG_ZSWAP_DEFAULT_ON is not set
> > > > CONFIG_ZPOOL=3Dy
> > > > CONFIG_ZBUD=3Dy
> > > > # CONFIG_Z3FOLD is not set
> > > > CONFIG_ZSMALLOC=3Dy
> > > > CONFIG_ZSMALLOC_STAT=3Dy
> > > > CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> > > > CONFIG_DEFERRED_STRUCT_PAGE_INIT=3Dy
> > > > CONFIG_IDLE_PAGE_TRACKING=3Dy
> > > > CONFIG_ARCH_HAS_PTE_DEVMAP=3Dy
> > > > CONFIG_ZONE_DEVICE=3Dy
> > > > CONFIG_DEV_PAGEMAP_OPS=3Dy
> > > > CONFIG_HMM_MIRROR=3Dy
> > > > CONFIG_DEVICE_PRIVATE=3Dy
> > > > CONFIG_VMAP_PFN=3Dy
> > > > CONFIG_ARCH_USES_HIGH_VMA_FLAGS=3Dy
> > > > CONFIG_ARCH_HAS_PKEYS=3Dy
> > > > # CONFIG_PERCPU_STATS is not set
> > > > # CONFIG_GUP_TEST is not set
> > > > # CONFIG_READ_ONLY_THP_FOR_FS is not set
> > > > CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
> > > > # end of Memory Management options
> > > > =

> > > > CONFIG_NET=3Dy
> > > > CONFIG_COMPAT_NETLINK_MESSAGES=3Dy
> > > > CONFIG_NET_INGRESS=3Dy
> > > > CONFIG_NET_EGRESS=3Dy
> > > > CONFIG_SKB_EXTENSIONS=3Dy
> > > > =

> > > > #
> > > > # Networking options
> > > > #
> > > > CONFIG_PACKET=3Dy
> > > > CONFIG_PACKET_DIAG=3Dm
> > > > CONFIG_UNIX=3Dy
> > > > CONFIG_UNIX_SCM=3Dy
> > > > CONFIG_UNIX_DIAG=3Dm
> > > > CONFIG_TLS=3Dm
> > > > CONFIG_TLS_DEVICE=3Dy
> > > > # CONFIG_TLS_TOE is not set
> > > > CONFIG_XFRM=3Dy
> > > > CONFIG_XFRM_OFFLOAD=3Dy
> > > > CONFIG_XFRM_ALGO=3Dy
> > > > CONFIG_XFRM_USER=3Dy
> > > > # CONFIG_XFRM_USER_COMPAT is not set
> > > > # CONFIG_XFRM_INTERFACE is not set
> > > > CONFIG_XFRM_SUB_POLICY=3Dy
> > > > CONFIG_XFRM_MIGRATE=3Dy
> > > > CONFIG_XFRM_STATISTICS=3Dy
> > > > CONFIG_XFRM_AH=3Dm
> > > > CONFIG_XFRM_ESP=3Dm
> > > > CONFIG_XFRM_IPCOMP=3Dm
> > > > CONFIG_NET_KEY=3Dm
> > > > CONFIG_NET_KEY_MIGRATE=3Dy
> > > > # CONFIG_SMC is not set
> > > > CONFIG_XDP_SOCKETS=3Dy
> > > > # CONFIG_XDP_SOCKETS_DIAG is not set
> > > > CONFIG_INET=3Dy
> > > > CONFIG_IP_MULTICAST=3Dy
> > > > CONFIG_IP_ADVANCED_ROUTER=3Dy
> > > > CONFIG_IP_FIB_TRIE_STATS=3Dy
> > > > CONFIG_IP_MULTIPLE_TABLES=3Dy
> > > > CONFIG_IP_ROUTE_MULTIPATH=3Dy
> > > > CONFIG_IP_ROUTE_VERBOSE=3Dy
> > > > CONFIG_IP_ROUTE_CLASSID=3Dy
> > > > CONFIG_IP_PNP=3Dy
> > > > CONFIG_IP_PNP_DHCP=3Dy
> > > > # CONFIG_IP_PNP_BOOTP is not set
> > > > # CONFIG_IP_PNP_RARP is not set
> > > > CONFIG_NET_IPIP=3Dm
> > > > CONFIG_NET_IPGRE_DEMUX=3Dm
> > > > CONFIG_NET_IP_TUNNEL=3Dm
> > > > CONFIG_NET_IPGRE=3Dm
> > > > CONFIG_NET_IPGRE_BROADCAST=3Dy
> > > > CONFIG_IP_MROUTE_COMMON=3Dy
> > > > CONFIG_IP_MROUTE=3Dy
> > > > CONFIG_IP_MROUTE_MULTIPLE_TABLES=3Dy
> > > > CONFIG_IP_PIMSM_V1=3Dy
> > > > CONFIG_IP_PIMSM_V2=3Dy
> > > > CONFIG_SYN_COOKIES=3Dy
> > > > CONFIG_NET_IPVTI=3Dm
> > > > CONFIG_NET_UDP_TUNNEL=3Dm
> > > > # CONFIG_NET_FOU is not set
> > > > # CONFIG_NET_FOU_IP_TUNNELS is not set
> > > > CONFIG_INET_AH=3Dm
> > > > CONFIG_INET_ESP=3Dm
> > > > CONFIG_INET_ESP_OFFLOAD=3Dm
> > > > # CONFIG_INET_ESPINTCP is not set
> > > > CONFIG_INET_IPCOMP=3Dm
> > > > CONFIG_INET_XFRM_TUNNEL=3Dm
> > > > CONFIG_INET_TUNNEL=3Dm
> > > > CONFIG_INET_DIAG=3Dm
> > > > CONFIG_INET_TCP_DIAG=3Dm
> > > > CONFIG_INET_UDP_DIAG=3Dm
> > > > CONFIG_INET_RAW_DIAG=3Dm
> > > > # CONFIG_INET_DIAG_DESTROY is not set
> > > > CONFIG_TCP_CONG_ADVANCED=3Dy
> > > > CONFIG_TCP_CONG_BIC=3Dm
> > > > CONFIG_TCP_CONG_CUBIC=3Dy
> > > > CONFIG_TCP_CONG_WESTWOOD=3Dm
> > > > CONFIG_TCP_CONG_HTCP=3Dm
> > > > CONFIG_TCP_CONG_HSTCP=3Dm
> > > > CONFIG_TCP_CONG_HYBLA=3Dm
> > > > CONFIG_TCP_CONG_VEGAS=3Dm
> > > > CONFIG_TCP_CONG_NV=3Dm
> > > > CONFIG_TCP_CONG_SCALABLE=3Dm
> > > > CONFIG_TCP_CONG_LP=3Dm
> > > > CONFIG_TCP_CONG_VENO=3Dm
> > > > CONFIG_TCP_CONG_YEAH=3Dm
> > > > CONFIG_TCP_CONG_ILLINOIS=3Dm
> > > > CONFIG_TCP_CONG_DCTCP=3Dm
> > > > # CONFIG_TCP_CONG_CDG is not set
> > > > CONFIG_TCP_CONG_BBR=3Dm
> > > > CONFIG_DEFAULT_CUBIC=3Dy
> > > > # CONFIG_DEFAULT_RENO is not set
> > > > CONFIG_DEFAULT_TCP_CONG=3D"cubic"
> > > > CONFIG_TCP_MD5SIG=3Dy
> > > > CONFIG_IPV6=3Dy
> > > > CONFIG_IPV6_ROUTER_PREF=3Dy
> > > > CONFIG_IPV6_ROUTE_INFO=3Dy
> > > > CONFIG_IPV6_OPTIMISTIC_DAD=3Dy
> > > > CONFIG_INET6_AH=3Dm
> > > > CONFIG_INET6_ESP=3Dm
> > > > CONFIG_INET6_ESP_OFFLOAD=3Dm
> > > > # CONFIG_INET6_ESPINTCP is not set
> > > > CONFIG_INET6_IPCOMP=3Dm
> > > > CONFIG_IPV6_MIP6=3Dm
> > > > # CONFIG_IPV6_ILA is not set
> > > > CONFIG_INET6_XFRM_TUNNEL=3Dm
> > > > CONFIG_INET6_TUNNEL=3Dm
> > > > CONFIG_IPV6_VTI=3Dm
> > > > CONFIG_IPV6_SIT=3Dm
> > > > CONFIG_IPV6_SIT_6RD=3Dy
> > > > CONFIG_IPV6_NDISC_NODETYPE=3Dy
> > > > CONFIG_IPV6_TUNNEL=3Dm
> > > > CONFIG_IPV6_GRE=3Dm
> > > > CONFIG_IPV6_MULTIPLE_TABLES=3Dy
> > > > # CONFIG_IPV6_SUBTREES is not set
> > > > CONFIG_IPV6_MROUTE=3Dy
> > > > CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=3Dy
> > > > CONFIG_IPV6_PIMSM_V2=3Dy
> > > > # CONFIG_IPV6_SEG6_LWTUNNEL is not set
> > > > # CONFIG_IPV6_SEG6_HMAC is not set
> > > > # CONFIG_IPV6_RPL_LWTUNNEL is not set
> > > > CONFIG_NETLABEL=3Dy
> > > > # CONFIG_MPTCP is not set
> > > > CONFIG_NETWORK_SECMARK=3Dy
> > > > CONFIG_NET_PTP_CLASSIFY=3Dy
> > > > CONFIG_NETWORK_PHY_TIMESTAMPING=3Dy
> > > > CONFIG_NETFILTER=3Dy
> > > > CONFIG_NETFILTER_ADVANCED=3Dy
> > > > CONFIG_BRIDGE_NETFILTER=3Dm
> > > > =

> > > > #
> > > > # Core Netfilter Configuration
> > > > #
> > > > CONFIG_NETFILTER_INGRESS=3Dy
> > > > CONFIG_NETFILTER_NETLINK=3Dm
> > > > CONFIG_NETFILTER_FAMILY_BRIDGE=3Dy
> > > > CONFIG_NETFILTER_FAMILY_ARP=3Dy
> > > > # CONFIG_NETFILTER_NETLINK_ACCT is not set
> > > > CONFIG_NETFILTER_NETLINK_QUEUE=3Dm
> > > > CONFIG_NETFILTER_NETLINK_LOG=3Dm
> > > > CONFIG_NETFILTER_NETLINK_OSF=3Dm
> > > > CONFIG_NF_CONNTRACK=3Dm
> > > > CONFIG_NF_LOG_COMMON=3Dm
> > > > CONFIG_NF_LOG_NETDEV=3Dm
> > > > CONFIG_NETFILTER_CONNCOUNT=3Dm
> > > > CONFIG_NF_CONNTRACK_MARK=3Dy
> > > > CONFIG_NF_CONNTRACK_SECMARK=3Dy
> > > > CONFIG_NF_CONNTRACK_ZONES=3Dy
> > > > CONFIG_NF_CONNTRACK_PROCFS=3Dy
> > > > CONFIG_NF_CONNTRACK_EVENTS=3Dy
> > > > CONFIG_NF_CONNTRACK_TIMEOUT=3Dy
> > > > CONFIG_NF_CONNTRACK_TIMESTAMP=3Dy
> > > > CONFIG_NF_CONNTRACK_LABELS=3Dy
> > > > CONFIG_NF_CT_PROTO_DCCP=3Dy
> > > > CONFIG_NF_CT_PROTO_GRE=3Dy
> > > > CONFIG_NF_CT_PROTO_SCTP=3Dy
> > > > CONFIG_NF_CT_PROTO_UDPLITE=3Dy
> > > > CONFIG_NF_CONNTRACK_AMANDA=3Dm
> > > > CONFIG_NF_CONNTRACK_FTP=3Dm
> > > > CONFIG_NF_CONNTRACK_H323=3Dm
> > > > CONFIG_NF_CONNTRACK_IRC=3Dm
> > > > CONFIG_NF_CONNTRACK_BROADCAST=3Dm
> > > > CONFIG_NF_CONNTRACK_NETBIOS_NS=3Dm
> > > > CONFIG_NF_CONNTRACK_SNMP=3Dm
> > > > CONFIG_NF_CONNTRACK_PPTP=3Dm
> > > > CONFIG_NF_CONNTRACK_SANE=3Dm
> > > > CONFIG_NF_CONNTRACK_SIP=3Dm
> > > > CONFIG_NF_CONNTRACK_TFTP=3Dm
> > > > CONFIG_NF_CT_NETLINK=3Dm
> > > > CONFIG_NF_CT_NETLINK_TIMEOUT=3Dm
> > > > CONFIG_NF_CT_NETLINK_HELPER=3Dm
> > > > CONFIG_NETFILTER_NETLINK_GLUE_CT=3Dy
> > > > CONFIG_NF_NAT=3Dm
> > > > CONFIG_NF_NAT_AMANDA=3Dm
> > > > CONFIG_NF_NAT_FTP=3Dm
> > > > CONFIG_NF_NAT_IRC=3Dm
> > > > CONFIG_NF_NAT_SIP=3Dm
> > > > CONFIG_NF_NAT_TFTP=3Dm
> > > > CONFIG_NF_NAT_REDIRECT=3Dy
> > > > CONFIG_NF_NAT_MASQUERADE=3Dy
> > > > CONFIG_NETFILTER_SYNPROXY=3Dm
> > > > CONFIG_NF_TABLES=3Dm
> > > > CONFIG_NF_TABLES_INET=3Dy
> > > > CONFIG_NF_TABLES_NETDEV=3Dy
> > > > CONFIG_NFT_NUMGEN=3Dm
> > > > CONFIG_NFT_CT=3Dm
> > > > CONFIG_NFT_COUNTER=3Dm
> > > > CONFIG_NFT_CONNLIMIT=3Dm
> > > > CONFIG_NFT_LOG=3Dm
> > > > CONFIG_NFT_LIMIT=3Dm
> > > > CONFIG_NFT_MASQ=3Dm
> > > > CONFIG_NFT_REDIR=3Dm
> > > > CONFIG_NFT_NAT=3Dm
> > > > # CONFIG_NFT_TUNNEL is not set
> > > > CONFIG_NFT_OBJREF=3Dm
> > > > CONFIG_NFT_QUEUE=3Dm
> > > > CONFIG_NFT_QUOTA=3Dm
> > > > CONFIG_NFT_REJECT=3Dm
> > > > CONFIG_NFT_REJECT_INET=3Dm
> > > > CONFIG_NFT_COMPAT=3Dm
> > > > CONFIG_NFT_HASH=3Dm
> > > > CONFIG_NFT_FIB=3Dm
> > > > CONFIG_NFT_FIB_INET=3Dm
> > > > # CONFIG_NFT_XFRM is not set
> > > > CONFIG_NFT_SOCKET=3Dm
> > > > # CONFIG_NFT_OSF is not set
> > > > # CONFIG_NFT_TPROXY is not set
> > > > # CONFIG_NFT_SYNPROXY is not set
> > > > CONFIG_NF_DUP_NETDEV=3Dm
> > > > CONFIG_NFT_DUP_NETDEV=3Dm
> > > > CONFIG_NFT_FWD_NETDEV=3Dm
> > > > CONFIG_NFT_FIB_NETDEV=3Dm
> > > > # CONFIG_NFT_REJECT_NETDEV is not set
> > > > # CONFIG_NF_FLOW_TABLE is not set
> > > > CONFIG_NETFILTER_XTABLES=3Dy
> > > > =

> > > > #
> > > > # Xtables combined modules
> > > > #
> > > > CONFIG_NETFILTER_XT_MARK=3Dm
> > > > CONFIG_NETFILTER_XT_CONNMARK=3Dm
> > > > CONFIG_NETFILTER_XT_SET=3Dm
> > > > =

> > > > #
> > > > # Xtables targets
> > > > #
> > > > CONFIG_NETFILTER_XT_TARGET_AUDIT=3Dm
> > > > CONFIG_NETFILTER_XT_TARGET_CHECKSUM=3Dm
> > > > CONFIG_NETFILTER_XT_TARGET_CLASSIFY=3Dm
> > > > CONFIG_NETFILTER_XT_TARGET_CONNMARK=3Dm
> > > > CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=3Dm
> > > > CONFIG_NETFILTER_XT_TARGET_CT=3Dm
> > > > CONFIG_NETFILTER_XT_TARGET_DSCP=3Dm
> > > > CONFIG_NETFILTER_XT_TARGET_HL=3Dm
> > > > CONFIG_NETFILTER_XT_TARGET_HMARK=3Dm
> > > > CONFIG_NETFILTER_XT_TARGET_IDLETIMER=3Dm
> > > > # CONFIG_NETFILTER_XT_TARGET_LED is not set
> > > > CONFIG_NETFILTER_XT_TARGET_LOG=3Dm
> > > > CONFIG_NETFILTER_XT_TARGET_MARK=3Dm
> > > > CONFIG_NETFILTER_XT_NAT=3Dm
> > > > CONFIG_NETFILTER_XT_TARGET_NETMAP=3Dm
> > > > CONFIG_NETFILTER_XT_TARGET_NFLOG=3Dm
> > > > CONFIG_NETFILTER_XT_TARGET_NFQUEUE=3Dm
> > > > CONFIG_NETFILTER_XT_TARGET_NOTRACK=3Dm
> > > > CONFIG_NETFILTER_XT_TARGET_RATEEST=3Dm
> > > > CONFIG_NETFILTER_XT_TARGET_REDIRECT=3Dm
> > > > CONFIG_NETFILTER_XT_TARGET_MASQUERADE=3Dm
> > > > CONFIG_NETFILTER_XT_TARGET_TEE=3Dm
> > > > CONFIG_NETFILTER_XT_TARGET_TPROXY=3Dm
> > > > CONFIG_NETFILTER_XT_TARGET_TRACE=3Dm
> > > > CONFIG_NETFILTER_XT_TARGET_SECMARK=3Dm
> > > > CONFIG_NETFILTER_XT_TARGET_TCPMSS=3Dm
> > > > CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=3Dm
> > > > =

> > > > #
> > > > # Xtables matches
> > > > #
> > > > CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_BPF=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_CGROUP=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_CLUSTER=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_COMMENT=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_CONNBYTES=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_CONNLABEL=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_CONNMARK=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_CONNTRACK=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_CPU=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_DCCP=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_DEVGROUP=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_DSCP=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_ECN=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_ESP=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_HELPER=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_HL=3Dm
> > > > # CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set
> > > > CONFIG_NETFILTER_XT_MATCH_IPRANGE=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_IPVS=3Dm
> > > > # CONFIG_NETFILTER_XT_MATCH_L2TP is not set
> > > > CONFIG_NETFILTER_XT_MATCH_LENGTH=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_LIMIT=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_MAC=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_MARK=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_MULTIPORT=3Dm
> > > > # CONFIG_NETFILTER_XT_MATCH_NFACCT is not set
> > > > CONFIG_NETFILTER_XT_MATCH_OSF=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_OWNER=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_POLICY=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_PHYSDEV=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_PKTTYPE=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_QUOTA=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_RATEEST=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_REALM=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_RECENT=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_SCTP=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_SOCKET=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_STATE=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_STATISTIC=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_STRING=3Dm
> > > > CONFIG_NETFILTER_XT_MATCH_TCPMSS=3Dm
> > > > # CONFIG_NETFILTER_XT_MATCH_TIME is not set
> > > > # CONFIG_NETFILTER_XT_MATCH_U32 is not set
> > > > # end of Core Netfilter Configuration
> > > > =

> > > > CONFIG_IP_SET=3Dm
> > > > CONFIG_IP_SET_MAX=3D256
> > > > CONFIG_IP_SET_BITMAP_IP=3Dm
> > > > CONFIG_IP_SET_BITMAP_IPMAC=3Dm
> > > > CONFIG_IP_SET_BITMAP_PORT=3Dm
> > > > CONFIG_IP_SET_HASH_IP=3Dm
> > > > CONFIG_IP_SET_HASH_IPMARK=3Dm
> > > > CONFIG_IP_SET_HASH_IPPORT=3Dm
> > > > CONFIG_IP_SET_HASH_IPPORTIP=3Dm
> > > > CONFIG_IP_SET_HASH_IPPORTNET=3Dm
> > > > CONFIG_IP_SET_HASH_IPMAC=3Dm
> > > > CONFIG_IP_SET_HASH_MAC=3Dm
> > > > CONFIG_IP_SET_HASH_NETPORTNET=3Dm
> > > > CONFIG_IP_SET_HASH_NET=3Dm
> > > > CONFIG_IP_SET_HASH_NETNET=3Dm
> > > > CONFIG_IP_SET_HASH_NETPORT=3Dm
> > > > CONFIG_IP_SET_HASH_NETIFACE=3Dm
> > > > CONFIG_IP_SET_LIST_SET=3Dm
> > > > CONFIG_IP_VS=3Dm
> > > > CONFIG_IP_VS_IPV6=3Dy
> > > > # CONFIG_IP_VS_DEBUG is not set
> > > > CONFIG_IP_VS_TAB_BITS=3D12
> > > > =

> > > > #
> > > > # IPVS transport protocol load balancing support
> > > > #
> > > > CONFIG_IP_VS_PROTO_TCP=3Dy
> > > > CONFIG_IP_VS_PROTO_UDP=3Dy
> > > > CONFIG_IP_VS_PROTO_AH_ESP=3Dy
> > > > CONFIG_IP_VS_PROTO_ESP=3Dy
> > > > CONFIG_IP_VS_PROTO_AH=3Dy
> > > > CONFIG_IP_VS_PROTO_SCTP=3Dy
> > > > =

> > > > #
> > > > # IPVS scheduler
> > > > #
> > > > CONFIG_IP_VS_RR=3Dm
> > > > CONFIG_IP_VS_WRR=3Dm
> > > > CONFIG_IP_VS_LC=3Dm
> > > > CONFIG_IP_VS_WLC=3Dm
> > > > CONFIG_IP_VS_FO=3Dm
> > > > CONFIG_IP_VS_OVF=3Dm
> > > > CONFIG_IP_VS_LBLC=3Dm
> > > > CONFIG_IP_VS_LBLCR=3Dm
> > > > CONFIG_IP_VS_DH=3Dm
> > > > CONFIG_IP_VS_SH=3Dm
> > > > # CONFIG_IP_VS_MH is not set
> > > > CONFIG_IP_VS_SED=3Dm
> > > > CONFIG_IP_VS_NQ=3Dm
> > > > # CONFIG_IP_VS_TWOS is not set
> > > > =

> > > > #
> > > > # IPVS SH scheduler
> > > > #
> > > > CONFIG_IP_VS_SH_TAB_BITS=3D8
> > > > =

> > > > #
> > > > # IPVS MH scheduler
> > > > #
> > > > CONFIG_IP_VS_MH_TAB_INDEX=3D12
> > > > =

> > > > #
> > > > # IPVS application helper
> > > > #
> > > > CONFIG_IP_VS_FTP=3Dm
> > > > CONFIG_IP_VS_NFCT=3Dy
> > > > CONFIG_IP_VS_PE_SIP=3Dm
> > > > =

> > > > #
> > > > # IP: Netfilter Configuration
> > > > #
> > > > CONFIG_NF_DEFRAG_IPV4=3Dm
> > > > CONFIG_NF_SOCKET_IPV4=3Dm
> > > > CONFIG_NF_TPROXY_IPV4=3Dm
> > > > CONFIG_NF_TABLES_IPV4=3Dy
> > > > CONFIG_NFT_REJECT_IPV4=3Dm
> > > > CONFIG_NFT_DUP_IPV4=3Dm
> > > > CONFIG_NFT_FIB_IPV4=3Dm
> > > > CONFIG_NF_TABLES_ARP=3Dy
> > > > CONFIG_NF_DUP_IPV4=3Dm
> > > > CONFIG_NF_LOG_ARP=3Dm
> > > > CONFIG_NF_LOG_IPV4=3Dm
> > > > CONFIG_NF_REJECT_IPV4=3Dm
> > > > CONFIG_NF_NAT_SNMP_BASIC=3Dm
> > > > CONFIG_NF_NAT_PPTP=3Dm
> > > > CONFIG_NF_NAT_H323=3Dm
> > > > CONFIG_IP_NF_IPTABLES=3Dm
> > > > CONFIG_IP_NF_MATCH_AH=3Dm
> > > > CONFIG_IP_NF_MATCH_ECN=3Dm
> > > > CONFIG_IP_NF_MATCH_RPFILTER=3Dm
> > > > CONFIG_IP_NF_MATCH_TTL=3Dm
> > > > CONFIG_IP_NF_FILTER=3Dm
> > > > CONFIG_IP_NF_TARGET_REJECT=3Dm
> > > > CONFIG_IP_NF_TARGET_SYNPROXY=3Dm
> > > > CONFIG_IP_NF_NAT=3Dm
> > > > CONFIG_IP_NF_TARGET_MASQUERADE=3Dm
> > > > CONFIG_IP_NF_TARGET_NETMAP=3Dm
> > > > CONFIG_IP_NF_TARGET_REDIRECT=3Dm
> > > > CONFIG_IP_NF_MANGLE=3Dm
> > > > # CONFIG_IP_NF_TARGET_CLUSTERIP is not set
> > > > CONFIG_IP_NF_TARGET_ECN=3Dm
> > > > CONFIG_IP_NF_TARGET_TTL=3Dm
> > > > CONFIG_IP_NF_RAW=3Dm
> > > > CONFIG_IP_NF_SECURITY=3Dm
> > > > CONFIG_IP_NF_ARPTABLES=3Dm
> > > > CONFIG_IP_NF_ARPFILTER=3Dm
> > > > CONFIG_IP_NF_ARP_MANGLE=3Dm
> > > > # end of IP: Netfilter Configuration
> > > > =

> > > > #
> > > > # IPv6: Netfilter Configuration
> > > > #
> > > > CONFIG_NF_SOCKET_IPV6=3Dm
> > > > CONFIG_NF_TPROXY_IPV6=3Dm
> > > > CONFIG_NF_TABLES_IPV6=3Dy
> > > > CONFIG_NFT_REJECT_IPV6=3Dm
> > > > CONFIG_NFT_DUP_IPV6=3Dm
> > > > CONFIG_NFT_FIB_IPV6=3Dm
> > > > CONFIG_NF_DUP_IPV6=3Dm
> > > > CONFIG_NF_REJECT_IPV6=3Dm
> > > > CONFIG_NF_LOG_IPV6=3Dm
> > > > CONFIG_IP6_NF_IPTABLES=3Dm
> > > > CONFIG_IP6_NF_MATCH_AH=3Dm
> > > > CONFIG_IP6_NF_MATCH_EUI64=3Dm
> > > > CONFIG_IP6_NF_MATCH_FRAG=3Dm
> > > > CONFIG_IP6_NF_MATCH_OPTS=3Dm
> > > > CONFIG_IP6_NF_MATCH_HL=3Dm
> > > > CONFIG_IP6_NF_MATCH_IPV6HEADER=3Dm
> > > > CONFIG_IP6_NF_MATCH_MH=3Dm
> > > > CONFIG_IP6_NF_MATCH_RPFILTER=3Dm
> > > > CONFIG_IP6_NF_MATCH_RT=3Dm
> > > > # CONFIG_IP6_NF_MATCH_SRH is not set
> > > > # CONFIG_IP6_NF_TARGET_HL is not set
> > > > CONFIG_IP6_NF_FILTER=3Dm
> > > > CONFIG_IP6_NF_TARGET_REJECT=3Dm
> > > > CONFIG_IP6_NF_TARGET_SYNPROXY=3Dm
> > > > CONFIG_IP6_NF_MANGLE=3Dm
> > > > CONFIG_IP6_NF_RAW=3Dm
> > > > CONFIG_IP6_NF_SECURITY=3Dm
> > > > CONFIG_IP6_NF_NAT=3Dm
> > > > CONFIG_IP6_NF_TARGET_MASQUERADE=3Dm
> > > > CONFIG_IP6_NF_TARGET_NPT=3Dm
> > > > # end of IPv6: Netfilter Configuration
> > > > =

> > > > CONFIG_NF_DEFRAG_IPV6=3Dm
> > > > CONFIG_NF_TABLES_BRIDGE=3Dm
> > > > # CONFIG_NFT_BRIDGE_META is not set
> > > > CONFIG_NFT_BRIDGE_REJECT=3Dm
> > > > CONFIG_NF_LOG_BRIDGE=3Dm
> > > > # CONFIG_NF_CONNTRACK_BRIDGE is not set
> > > > CONFIG_BRIDGE_NF_EBTABLES=3Dm
> > > > CONFIG_BRIDGE_EBT_BROUTE=3Dm
> > > > CONFIG_BRIDGE_EBT_T_FILTER=3Dm
> > > > CONFIG_BRIDGE_EBT_T_NAT=3Dm
> > > > CONFIG_BRIDGE_EBT_802_3=3Dm
> > > > CONFIG_BRIDGE_EBT_AMONG=3Dm
> > > > CONFIG_BRIDGE_EBT_ARP=3Dm
> > > > CONFIG_BRIDGE_EBT_IP=3Dm
> > > > CONFIG_BRIDGE_EBT_IP6=3Dm
> > > > CONFIG_BRIDGE_EBT_LIMIT=3Dm
> > > > CONFIG_BRIDGE_EBT_MARK=3Dm
> > > > CONFIG_BRIDGE_EBT_PKTTYPE=3Dm
> > > > CONFIG_BRIDGE_EBT_STP=3Dm
> > > > CONFIG_BRIDGE_EBT_VLAN=3Dm
> > > > CONFIG_BRIDGE_EBT_ARPREPLY=3Dm
> > > > CONFIG_BRIDGE_EBT_DNAT=3Dm
> > > > CONFIG_BRIDGE_EBT_MARK_T=3Dm
> > > > CONFIG_BRIDGE_EBT_REDIRECT=3Dm
> > > > CONFIG_BRIDGE_EBT_SNAT=3Dm
> > > > CONFIG_BRIDGE_EBT_LOG=3Dm
> > > > CONFIG_BRIDGE_EBT_NFLOG=3Dm
> > > > # CONFIG_BPFILTER is not set
> > > > # CONFIG_IP_DCCP is not set
> > > > CONFIG_IP_SCTP=3Dm
> > > > # CONFIG_SCTP_DBG_OBJCNT is not set
> > > > # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
> > > > CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=3Dy
> > > > # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
> > > > CONFIG_SCTP_COOKIE_HMAC_MD5=3Dy
> > > > CONFIG_SCTP_COOKIE_HMAC_SHA1=3Dy
> > > > CONFIG_INET_SCTP_DIAG=3Dm
> > > > # CONFIG_RDS is not set
> > > > CONFIG_TIPC=3Dm
> > > > # CONFIG_TIPC_MEDIA_IB is not set
> > > > CONFIG_TIPC_MEDIA_UDP=3Dy
> > > > CONFIG_TIPC_CRYPTO=3Dy
> > > > CONFIG_TIPC_DIAG=3Dm
> > > > CONFIG_ATM=3Dm
> > > > CONFIG_ATM_CLIP=3Dm
> > > > # CONFIG_ATM_CLIP_NO_ICMP is not set
> > > > CONFIG_ATM_LANE=3Dm
> > > > # CONFIG_ATM_MPOA is not set
> > > > CONFIG_ATM_BR2684=3Dm
> > > > # CONFIG_ATM_BR2684_IPFILTER is not set
> > > > CONFIG_L2TP=3Dm
> > > > CONFIG_L2TP_DEBUGFS=3Dm
> > > > CONFIG_L2TP_V3=3Dy
> > > > CONFIG_L2TP_IP=3Dm
> > > > CONFIG_L2TP_ETH=3Dm
> > > > CONFIG_STP=3Dm
> > > > CONFIG_GARP=3Dm
> > > > CONFIG_MRP=3Dm
> > > > CONFIG_BRIDGE=3Dm
> > > > CONFIG_BRIDGE_IGMP_SNOOPING=3Dy
> > > > CONFIG_BRIDGE_VLAN_FILTERING=3Dy
> > > > # CONFIG_BRIDGE_MRP is not set
> > > > # CONFIG_BRIDGE_CFM is not set
> > > > CONFIG_HAVE_NET_DSA=3Dy
> > > > # CONFIG_NET_DSA is not set
> > > > CONFIG_VLAN_8021Q=3Dm
> > > > CONFIG_VLAN_8021Q_GVRP=3Dy
> > > > CONFIG_VLAN_8021Q_MVRP=3Dy
> > > > # CONFIG_DECNET is not set
> > > > CONFIG_LLC=3Dm
> > > > # CONFIG_LLC2 is not set
> > > > # CONFIG_ATALK is not set
> > > > # CONFIG_X25 is not set
> > > > # CONFIG_LAPB is not set
> > > > # CONFIG_PHONET is not set
> > > > CONFIG_6LOWPAN=3Dm
> > > > # CONFIG_6LOWPAN_DEBUGFS is not set
> > > > # CONFIG_6LOWPAN_NHC is not set
> > > > CONFIG_IEEE802154=3Dm
> > > > # CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
> > > > CONFIG_IEEE802154_SOCKET=3Dm
> > > > CONFIG_IEEE802154_6LOWPAN=3Dm
> > > > CONFIG_MAC802154=3Dm
> > > > CONFIG_NET_SCHED=3Dy
> > > > =

> > > > #
> > > > # Queueing/Scheduling
> > > > #
> > > > CONFIG_NET_SCH_CBQ=3Dm
> > > > CONFIG_NET_SCH_HTB=3Dm
> > > > CONFIG_NET_SCH_HFSC=3Dm
> > > > CONFIG_NET_SCH_ATM=3Dm
> > > > CONFIG_NET_SCH_PRIO=3Dm
> > > > CONFIG_NET_SCH_MULTIQ=3Dm
> > > > CONFIG_NET_SCH_RED=3Dm
> > > > CONFIG_NET_SCH_SFB=3Dm
> > > > CONFIG_NET_SCH_SFQ=3Dm
> > > > CONFIG_NET_SCH_TEQL=3Dm
> > > > CONFIG_NET_SCH_TBF=3Dm
> > > > # CONFIG_NET_SCH_CBS is not set
> > > > # CONFIG_NET_SCH_ETF is not set
> > > > # CONFIG_NET_SCH_TAPRIO is not set
> > > > CONFIG_NET_SCH_GRED=3Dm
> > > > CONFIG_NET_SCH_DSMARK=3Dm
> > > > CONFIG_NET_SCH_NETEM=3Dm
> > > > CONFIG_NET_SCH_DRR=3Dm
> > > > CONFIG_NET_SCH_MQPRIO=3Dm
> > > > # CONFIG_NET_SCH_SKBPRIO is not set
> > > > CONFIG_NET_SCH_CHOKE=3Dm
> > > > CONFIG_NET_SCH_QFQ=3Dm
> > > > CONFIG_NET_SCH_CODEL=3Dm
> > > > CONFIG_NET_SCH_FQ_CODEL=3Dy
> > > > # CONFIG_NET_SCH_CAKE is not set
> > > > CONFIG_NET_SCH_FQ=3Dm
> > > > CONFIG_NET_SCH_HHF=3Dm
> > > > CONFIG_NET_SCH_PIE=3Dm
> > > > # CONFIG_NET_SCH_FQ_PIE is not set
> > > > CONFIG_NET_SCH_INGRESS=3Dm
> > > > CONFIG_NET_SCH_PLUG=3Dm
> > > > # CONFIG_NET_SCH_ETS is not set
> > > > CONFIG_NET_SCH_DEFAULT=3Dy
> > > > # CONFIG_DEFAULT_FQ is not set
> > > > # CONFIG_DEFAULT_CODEL is not set
> > > > CONFIG_DEFAULT_FQ_CODEL=3Dy
> > > > # CONFIG_DEFAULT_SFQ is not set
> > > > # CONFIG_DEFAULT_PFIFO_FAST is not set
> > > > CONFIG_DEFAULT_NET_SCH=3D"fq_codel"
> > > > =

> > > > #
> > > > # Classification
> > > > #
> > > > CONFIG_NET_CLS=3Dy
> > > > CONFIG_NET_CLS_BASIC=3Dm
> > > > CONFIG_NET_CLS_TCINDEX=3Dm
> > > > CONFIG_NET_CLS_ROUTE4=3Dm
> > > > CONFIG_NET_CLS_FW=3Dm
> > > > CONFIG_NET_CLS_U32=3Dm
> > > > CONFIG_CLS_U32_PERF=3Dy
> > > > CONFIG_CLS_U32_MARK=3Dy
> > > > CONFIG_NET_CLS_RSVP=3Dm
> > > > CONFIG_NET_CLS_RSVP6=3Dm
> > > > CONFIG_NET_CLS_FLOW=3Dm
> > > > CONFIG_NET_CLS_CGROUP=3Dy
> > > > CONFIG_NET_CLS_BPF=3Dm
> > > > CONFIG_NET_CLS_FLOWER=3Dm
> > > > CONFIG_NET_CLS_MATCHALL=3Dm
> > > > CONFIG_NET_EMATCH=3Dy
> > > > CONFIG_NET_EMATCH_STACK=3D32
> > > > CONFIG_NET_EMATCH_CMP=3Dm
> > > > CONFIG_NET_EMATCH_NBYTE=3Dm
> > > > CONFIG_NET_EMATCH_U32=3Dm
> > > > CONFIG_NET_EMATCH_META=3Dm
> > > > CONFIG_NET_EMATCH_TEXT=3Dm
> > > > # CONFIG_NET_EMATCH_CANID is not set
> > > > CONFIG_NET_EMATCH_IPSET=3Dm
> > > > # CONFIG_NET_EMATCH_IPT is not set
> > > > CONFIG_NET_CLS_ACT=3Dy
> > > > CONFIG_NET_ACT_POLICE=3Dm
> > > > CONFIG_NET_ACT_GACT=3Dm
> > > > CONFIG_GACT_PROB=3Dy
> > > > CONFIG_NET_ACT_MIRRED=3Dm
> > > > CONFIG_NET_ACT_SAMPLE=3Dm
> > > > # CONFIG_NET_ACT_IPT is not set
> > > > CONFIG_NET_ACT_NAT=3Dm
> > > > CONFIG_NET_ACT_PEDIT=3Dm
> > > > CONFIG_NET_ACT_SIMP=3Dm
> > > > CONFIG_NET_ACT_SKBEDIT=3Dm
> > > > CONFIG_NET_ACT_CSUM=3Dm
> > > > # CONFIG_NET_ACT_MPLS is not set
> > > > CONFIG_NET_ACT_VLAN=3Dm
> > > > CONFIG_NET_ACT_BPF=3Dm
> > > > # CONFIG_NET_ACT_CONNMARK is not set
> > > > # CONFIG_NET_ACT_CTINFO is not set
> > > > CONFIG_NET_ACT_SKBMOD=3Dm
> > > > # CONFIG_NET_ACT_IFE is not set
> > > > CONFIG_NET_ACT_TUNNEL_KEY=3Dm
> > > > # CONFIG_NET_ACT_GATE is not set
> > > > # CONFIG_NET_TC_SKB_EXT is not set
> > > > CONFIG_NET_SCH_FIFO=3Dy
> > > > CONFIG_DCB=3Dy
> > > > CONFIG_DNS_RESOLVER=3Dm
> > > > # CONFIG_BATMAN_ADV is not set
> > > > CONFIG_OPENVSWITCH=3Dm
> > > > CONFIG_OPENVSWITCH_GRE=3Dm
> > > > CONFIG_VSOCKETS=3Dm
> > > > CONFIG_VSOCKETS_DIAG=3Dm
> > > > CONFIG_VSOCKETS_LOOPBACK=3Dm
> > > > CONFIG_VMWARE_VMCI_VSOCKETS=3Dm
> > > > CONFIG_VIRTIO_VSOCKETS=3Dm
> > > > CONFIG_VIRTIO_VSOCKETS_COMMON=3Dm
> > > > CONFIG_HYPERV_VSOCKETS=3Dm
> > > > CONFIG_NETLINK_DIAG=3Dm
> > > > CONFIG_MPLS=3Dy
> > > > CONFIG_NET_MPLS_GSO=3Dy
> > > > CONFIG_MPLS_ROUTING=3Dm
> > > > CONFIG_MPLS_IPTUNNEL=3Dm
> > > > CONFIG_NET_NSH=3Dy
> > > > # CONFIG_HSR is not set
> > > > CONFIG_NET_SWITCHDEV=3Dy
> > > > CONFIG_NET_L3_MASTER_DEV=3Dy
> > > > # CONFIG_QRTR is not set
> > > > # CONFIG_NET_NCSI is not set
> > > > CONFIG_RPS=3Dy
> > > > CONFIG_RFS_ACCEL=3Dy
> > > > CONFIG_SOCK_RX_QUEUE_MAPPING=3Dy
> > > > CONFIG_XPS=3Dy
> > > > CONFIG_CGROUP_NET_PRIO=3Dy
> > > > CONFIG_CGROUP_NET_CLASSID=3Dy
> > > > CONFIG_NET_RX_BUSY_POLL=3Dy
> > > > CONFIG_BQL=3Dy
> > > > CONFIG_BPF_JIT=3Dy
> > > > CONFIG_BPF_STREAM_PARSER=3Dy
> > > > CONFIG_NET_FLOW_LIMIT=3Dy
> > > > =

> > > > #
> > > > # Network testing
> > > > #
> > > > CONFIG_NET_PKTGEN=3Dm
> > > > CONFIG_NET_DROP_MONITOR=3Dy
> > > > # end of Network testing
> > > > # end of Networking options
> > > > =

> > > > # CONFIG_HAMRADIO is not set
> > > > CONFIG_CAN=3Dm
> > > > CONFIG_CAN_RAW=3Dm
> > > > CONFIG_CAN_BCM=3Dm
> > > > CONFIG_CAN_GW=3Dm
> > > > # CONFIG_CAN_J1939 is not set
> > > > # CONFIG_CAN_ISOTP is not set
> > > > =

> > > > #
> > > > # CAN Device Drivers
> > > > #
> > > > CONFIG_CAN_VCAN=3Dm
> > > > # CONFIG_CAN_VXCAN is not set
> > > > CONFIG_CAN_SLCAN=3Dm
> > > > CONFIG_CAN_DEV=3Dm
> > > > CONFIG_CAN_CALC_BITTIMING=3Dy
> > > > # CONFIG_CAN_KVASER_PCIEFD is not set
> > > > CONFIG_CAN_C_CAN=3Dm
> > > > CONFIG_CAN_C_CAN_PLATFORM=3Dm
> > > > CONFIG_CAN_C_CAN_PCI=3Dm
> > > > CONFIG_CAN_CC770=3Dm
> > > > # CONFIG_CAN_CC770_ISA is not set
> > > > CONFIG_CAN_CC770_PLATFORM=3Dm
> > > > # CONFIG_CAN_IFI_CANFD is not set
> > > > # CONFIG_CAN_M_CAN is not set
> > > > # CONFIG_CAN_PEAK_PCIEFD is not set
> > > > CONFIG_CAN_SJA1000=3Dm
> > > > CONFIG_CAN_EMS_PCI=3Dm
> > > > # CONFIG_CAN_F81601 is not set
> > > > CONFIG_CAN_KVASER_PCI=3Dm
> > > > CONFIG_CAN_PEAK_PCI=3Dm
> > > > CONFIG_CAN_PEAK_PCIEC=3Dy
> > > > CONFIG_CAN_PLX_PCI=3Dm
> > > > # CONFIG_CAN_SJA1000_ISA is not set
> > > > CONFIG_CAN_SJA1000_PLATFORM=3Dm
> > > > CONFIG_CAN_SOFTING=3Dm
> > > > =

> > > > #
> > > > # CAN SPI interfaces
> > > > #
> > > > # CONFIG_CAN_HI311X is not set
> > > > # CONFIG_CAN_MCP251X is not set
> > > > # CONFIG_CAN_MCP251XFD is not set
> > > > # end of CAN SPI interfaces
> > > > =

> > > > #
> > > > # CAN USB interfaces
> > > > #
> > > > # CONFIG_CAN_8DEV_USB is not set
> > > > # CONFIG_CAN_EMS_USB is not set
> > > > # CONFIG_CAN_ESD_USB2 is not set
> > > > # CONFIG_CAN_GS_USB is not set
> > > > # CONFIG_CAN_KVASER_USB is not set
> > > > # CONFIG_CAN_MCBA_USB is not set
> > > > # CONFIG_CAN_PEAK_USB is not set
> > > > # CONFIG_CAN_UCAN is not set
> > > > # end of CAN USB interfaces
> > > > =

> > > > # CONFIG_CAN_DEBUG_DEVICES is not set
> > > > # end of CAN Device Drivers
> > > > =

> > > > CONFIG_BT=3Dm
> > > > CONFIG_BT_BREDR=3Dy
> > > > CONFIG_BT_RFCOMM=3Dm
> > > > CONFIG_BT_RFCOMM_TTY=3Dy
> > > > CONFIG_BT_BNEP=3Dm
> > > > CONFIG_BT_BNEP_MC_FILTER=3Dy
> > > > CONFIG_BT_BNEP_PROTO_FILTER=3Dy
> > > > CONFIG_BT_HIDP=3Dm
> > > > CONFIG_BT_HS=3Dy
> > > > CONFIG_BT_LE=3Dy
> > > > # CONFIG_BT_6LOWPAN is not set
> > > > # CONFIG_BT_LEDS is not set
> > > > # CONFIG_BT_MSFTEXT is not set
> > > > CONFIG_BT_DEBUGFS=3Dy
> > > > # CONFIG_BT_SELFTEST is not set
> > > > =

> > > > #
> > > > # Bluetooth device drivers
> > > > #
> > > > # CONFIG_BT_HCIBTUSB is not set
> > > > # CONFIG_BT_HCIBTSDIO is not set
> > > > CONFIG_BT_HCIUART=3Dm
> > > > CONFIG_BT_HCIUART_H4=3Dy
> > > > CONFIG_BT_HCIUART_BCSP=3Dy
> > > > CONFIG_BT_HCIUART_ATH3K=3Dy
> > > > # CONFIG_BT_HCIUART_INTEL is not set
> > > > # CONFIG_BT_HCIUART_AG6XX is not set
> > > > # CONFIG_BT_HCIBCM203X is not set
> > > > # CONFIG_BT_HCIBPA10X is not set
> > > > # CONFIG_BT_HCIBFUSB is not set
> > > > CONFIG_BT_HCIVHCI=3Dm
> > > > CONFIG_BT_MRVL=3Dm
> > > > # CONFIG_BT_MRVL_SDIO is not set
> > > > # CONFIG_BT_MTKSDIO is not set
> > > > # end of Bluetooth device drivers
> > > > =

> > > > # CONFIG_AF_RXRPC is not set
> > > > # CONFIG_AF_KCM is not set
> > > > CONFIG_STREAM_PARSER=3Dy
> > > > CONFIG_FIB_RULES=3Dy
> > > > CONFIG_WIRELESS=3Dy
> > > > CONFIG_WEXT_CORE=3Dy
> > > > CONFIG_WEXT_PROC=3Dy
> > > > CONFIG_CFG80211=3Dm
> > > > # CONFIG_NL80211_TESTMODE is not set
> > > > # CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
> > > > CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=3Dy
> > > > CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=3Dy
> > > > CONFIG_CFG80211_DEFAULT_PS=3Dy
> > > > # CONFIG_CFG80211_DEBUGFS is not set
> > > > CONFIG_CFG80211_CRDA_SUPPORT=3Dy
> > > > CONFIG_CFG80211_WEXT=3Dy
> > > > CONFIG_MAC80211=3Dm
> > > > CONFIG_MAC80211_HAS_RC=3Dy
> > > > CONFIG_MAC80211_RC_MINSTREL=3Dy
> > > > CONFIG_MAC80211_RC_DEFAULT_MINSTREL=3Dy
> > > > CONFIG_MAC80211_RC_DEFAULT=3D"minstrel_ht"
> > > > CONFIG_MAC80211_MESH=3Dy
> > > > CONFIG_MAC80211_LEDS=3Dy
> > > > CONFIG_MAC80211_DEBUGFS=3Dy
> > > > # CONFIG_MAC80211_MESSAGE_TRACING is not set
> > > > # CONFIG_MAC80211_DEBUG_MENU is not set
> > > > CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> > > > CONFIG_RFKILL=3Dm
> > > > CONFIG_RFKILL_LEDS=3Dy
> > > > CONFIG_RFKILL_INPUT=3Dy
> > > > # CONFIG_RFKILL_GPIO is not set
> > > > CONFIG_NET_9P=3Dy
> > > > CONFIG_NET_9P_VIRTIO=3Dy
> > > > # CONFIG_NET_9P_XEN is not set
> > > > # CONFIG_NET_9P_RDMA is not set
> > > > # CONFIG_NET_9P_DEBUG is not set
> > > > # CONFIG_CAIF is not set
> > > > CONFIG_CEPH_LIB=3Dm
> > > > # CONFIG_CEPH_LIB_PRETTYDEBUG is not set
> > > > CONFIG_CEPH_LIB_USE_DNS_RESOLVER=3Dy
> > > > # CONFIG_NFC is not set
> > > > CONFIG_PSAMPLE=3Dm
> > > > # CONFIG_NET_IFE is not set
> > > > CONFIG_LWTUNNEL=3Dy
> > > > CONFIG_LWTUNNEL_BPF=3Dy
> > > > CONFIG_DST_CACHE=3Dy
> > > > CONFIG_GRO_CELLS=3Dy
> > > > CONFIG_SOCK_VALIDATE_XMIT=3Dy
> > > > CONFIG_NET_SOCK_MSG=3Dy
> > > > CONFIG_NET_DEVLINK=3Dy
> > > > CONFIG_PAGE_POOL=3Dy
> > > > CONFIG_FAILOVER=3Dm
> > > > CONFIG_ETHTOOL_NETLINK=3Dy
> > > > CONFIG_HAVE_EBPF_JIT=3Dy
> > > > =

> > > > #
> > > > # Device Drivers
> > > > #
> > > > CONFIG_HAVE_EISA=3Dy
> > > > # CONFIG_EISA is not set
> > > > CONFIG_HAVE_PCI=3Dy
> > > > CONFIG_PCI=3Dy
> > > > CONFIG_PCI_DOMAINS=3Dy
> > > > CONFIG_PCIEPORTBUS=3Dy
> > > > CONFIG_HOTPLUG_PCI_PCIE=3Dy
> > > > CONFIG_PCIEAER=3Dy
> > > > CONFIG_PCIEAER_INJECT=3Dm
> > > > CONFIG_PCIE_ECRC=3Dy
> > > > CONFIG_PCIEASPM=3Dy
> > > > CONFIG_PCIEASPM_DEFAULT=3Dy
> > > > # CONFIG_PCIEASPM_POWERSAVE is not set
> > > > # CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
> > > > # CONFIG_PCIEASPM_PERFORMANCE is not set
> > > > CONFIG_PCIE_PME=3Dy
> > > > CONFIG_PCIE_DPC=3Dy
> > > > # CONFIG_PCIE_PTM is not set
> > > > # CONFIG_PCIE_EDR is not set
> > > > CONFIG_PCI_MSI=3Dy
> > > > CONFIG_PCI_MSI_IRQ_DOMAIN=3Dy
> > > > CONFIG_PCI_QUIRKS=3Dy
> > > > # CONFIG_PCI_DEBUG is not set
> > > > # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> > > > CONFIG_PCI_STUB=3Dy
> > > > CONFIG_PCI_PF_STUB=3Dm
> > > > # CONFIG_XEN_PCIDEV_FRONTEND is not set
> > > > CONFIG_PCI_ATS=3Dy
> > > > CONFIG_PCI_LOCKLESS_CONFIG=3Dy
> > > > CONFIG_PCI_IOV=3Dy
> > > > CONFIG_PCI_PRI=3Dy
> > > > CONFIG_PCI_PASID=3Dy
> > > > # CONFIG_PCI_P2PDMA is not set
> > > > CONFIG_PCI_LABEL=3Dy
> > > > CONFIG_PCI_HYPERV=3Dm
> > > > CONFIG_HOTPLUG_PCI=3Dy
> > > > CONFIG_HOTPLUG_PCI_ACPI=3Dy
> > > > CONFIG_HOTPLUG_PCI_ACPI_IBM=3Dm
> > > > # CONFIG_HOTPLUG_PCI_CPCI is not set
> > > > CONFIG_HOTPLUG_PCI_SHPC=3Dy
> > > > =

> > > > #
> > > > # PCI controller drivers
> > > > #
> > > > CONFIG_VMD=3Dy
> > > > CONFIG_PCI_HYPERV_INTERFACE=3Dm
> > > > =

> > > > #
> > > > # DesignWare PCI Core Support
> > > > #
> > > > # CONFIG_PCIE_DW_PLAT_HOST is not set
> > > > # CONFIG_PCI_MESON is not set
> > > > # end of DesignWare PCI Core Support
> > > > =

> > > > #
> > > > # Mobiveil PCIe Core Support
> > > > #
> > > > # end of Mobiveil PCIe Core Support
> > > > =

> > > > #
> > > > # Cadence PCIe controllers support
> > > > #
> > > > # end of Cadence PCIe controllers support
> > > > # end of PCI controller drivers
> > > > =

> > > > #
> > > > # PCI Endpoint
> > > > #
> > > > # CONFIG_PCI_ENDPOINT is not set
> > > > # end of PCI Endpoint
> > > > =

> > > > #
> > > > # PCI switch controller drivers
> > > > #
> > > > # CONFIG_PCI_SW_SWITCHTEC is not set
> > > > # end of PCI switch controller drivers
> > > > =

> > > > # CONFIG_CXL_BUS is not set
> > > > # CONFIG_PCCARD is not set
> > > > # CONFIG_RAPIDIO is not set
> > > > =

> > > > #
> > > > # Generic Driver Options
> > > > #
> > > > # CONFIG_UEVENT_HELPER is not set
> > > > CONFIG_DEVTMPFS=3Dy
> > > > CONFIG_DEVTMPFS_MOUNT=3Dy
> > > > CONFIG_STANDALONE=3Dy
> > > > CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> > > > =

> > > > #
> > > > # Firmware loader
> > > > #
> > > > CONFIG_FW_LOADER=3Dy
> > > > CONFIG_FW_LOADER_PAGED_BUF=3Dy
> > > > CONFIG_EXTRA_FIRMWARE=3D""
> > > > CONFIG_FW_LOADER_USER_HELPER=3Dy
> > > > # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
> > > > # CONFIG_FW_LOADER_COMPRESS is not set
> > > > CONFIG_FW_CACHE=3Dy
> > > > # end of Firmware loader
> > > > =

> > > > CONFIG_ALLOW_DEV_COREDUMP=3Dy
> > > > # CONFIG_DEBUG_DRIVER is not set
> > > > # CONFIG_DEBUG_DEVRES is not set
> > > > # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> > > > # CONFIG_PM_QOS_KUNIT_TEST is not set
> > > > # CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
> > > > CONFIG_KUNIT_DRIVER_PE_TEST=3Dy
> > > > CONFIG_SYS_HYPERVISOR=3Dy
> > > > CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> > > > CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
> > > > CONFIG_REGMAP=3Dy
> > > > CONFIG_REGMAP_I2C=3Dm
> > > > CONFIG_REGMAP_SPI=3Dm
> > > > CONFIG_DMA_SHARED_BUFFER=3Dy
> > > > # CONFIG_DMA_FENCE_TRACE is not set
> > > > # end of Generic Driver Options
> > > > =

> > > > #
> > > > # Bus devices
> > > > #
> > > > # CONFIG_MHI_BUS is not set
> > > > # end of Bus devices
> > > > =

> > > > CONFIG_CONNECTOR=3Dy
> > > > CONFIG_PROC_EVENTS=3Dy
> > > > # CONFIG_GNSS is not set
> > > > # CONFIG_MTD is not set
> > > > # CONFIG_OF is not set
> > > > CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> > > > CONFIG_PARPORT=3Dm
> > > > CONFIG_PARPORT_PC=3Dm
> > > > CONFIG_PARPORT_SERIAL=3Dm
> > > > # CONFIG_PARPORT_PC_FIFO is not set
> > > > # CONFIG_PARPORT_PC_SUPERIO is not set
> > > > # CONFIG_PARPORT_AX88796 is not set
> > > > CONFIG_PARPORT_1284=3Dy
> > > > CONFIG_PNP=3Dy
> > > > # CONFIG_PNP_DEBUG_MESSAGES is not set
> > > > =

> > > > #
> > > > # Protocols
> > > > #
> > > > CONFIG_PNPACPI=3Dy
> > > > CONFIG_BLK_DEV=3Dy
> > > > CONFIG_BLK_DEV_NULL_BLK=3Dm
> > > > CONFIG_BLK_DEV_NULL_BLK_FAULT_INJECTION=3Dy
> > > > # CONFIG_BLK_DEV_FD is not set
> > > > CONFIG_CDROM=3Dm
> > > > # CONFIG_PARIDE is not set
> > > > # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
> > > > # CONFIG_ZRAM is not set
> > > > # CONFIG_BLK_DEV_UMEM is not set
> > > > CONFIG_BLK_DEV_LOOP=3Dm
> > > > CONFIG_BLK_DEV_LOOP_MIN_COUNT=3D0
> > > > # CONFIG_BLK_DEV_CRYPTOLOOP is not set
> > > > # CONFIG_BLK_DEV_DRBD is not set
> > > > CONFIG_BLK_DEV_NBD=3Dm
> > > > # CONFIG_BLK_DEV_SX8 is not set
> > > > CONFIG_BLK_DEV_RAM=3Dm
> > > > CONFIG_BLK_DEV_RAM_COUNT=3D16
> > > > CONFIG_BLK_DEV_RAM_SIZE=3D16384
> > > > CONFIG_CDROM_PKTCDVD=3Dm
> > > > CONFIG_CDROM_PKTCDVD_BUFFERS=3D8
> > > > # CONFIG_CDROM_PKTCDVD_WCACHE is not set
> > > > # CONFIG_ATA_OVER_ETH is not set
> > > > CONFIG_XEN_BLKDEV_FRONTEND=3Dm
> > > > CONFIG_VIRTIO_BLK=3Dm
> > > > CONFIG_BLK_DEV_RBD=3Dm
> > > > # CONFIG_BLK_DEV_RSXX is not set
> > > > =

> > > > #
> > > > # NVME Support
> > > > #
> > > > CONFIG_NVME_CORE=3Dm
> > > > CONFIG_BLK_DEV_NVME=3Dm
> > > > CONFIG_NVME_MULTIPATH=3Dy
> > > > # CONFIG_NVME_HWMON is not set
> > > > CONFIG_NVME_FABRICS=3Dm
> > > > # CONFIG_NVME_RDMA is not set
> > > > CONFIG_NVME_FC=3Dm
> > > > # CONFIG_NVME_TCP is not set
> > > > CONFIG_NVME_TARGET=3Dm
> > > > # CONFIG_NVME_TARGET_PASSTHRU is not set
> > > > CONFIG_NVME_TARGET_LOOP=3Dm
> > > > # CONFIG_NVME_TARGET_RDMA is not set
> > > > CONFIG_NVME_TARGET_FC=3Dm
> > > > CONFIG_NVME_TARGET_FCLOOP=3Dm
> > > > # CONFIG_NVME_TARGET_TCP is not set
> > > > # end of NVME Support
> > > > =

> > > > #
> > > > # Misc devices
> > > > #
> > > > CONFIG_SENSORS_LIS3LV02D=3Dm
> > > > # CONFIG_AD525X_DPOT is not set
> > > > # CONFIG_DUMMY_IRQ is not set
> > > > # CONFIG_IBM_ASM is not set
> > > > # CONFIG_PHANTOM is not set
> > > > CONFIG_TIFM_CORE=3Dm
> > > > CONFIG_TIFM_7XX1=3Dm
> > > > # CONFIG_ICS932S401 is not set
> > > > CONFIG_ENCLOSURE_SERVICES=3Dm
> > > > CONFIG_SGI_XP=3Dm
> > > > CONFIG_HP_ILO=3Dm
> > > > CONFIG_SGI_GRU=3Dm
> > > > # CONFIG_SGI_GRU_DEBUG is not set
> > > > CONFIG_APDS9802ALS=3Dm
> > > > CONFIG_ISL29003=3Dm
> > > > CONFIG_ISL29020=3Dm
> > > > CONFIG_SENSORS_TSL2550=3Dm
> > > > CONFIG_SENSORS_BH1770=3Dm
> > > > CONFIG_SENSORS_APDS990X=3Dm
> > > > # CONFIG_HMC6352 is not set
> > > > # CONFIG_DS1682 is not set
> > > > CONFIG_VMWARE_BALLOON=3Dm
> > > > # CONFIG_LATTICE_ECP3_CONFIG is not set
> > > > # CONFIG_SRAM is not set
> > > > # CONFIG_PCI_ENDPOINT_TEST is not set
> > > > # CONFIG_XILINX_SDFEC is not set
> > > > CONFIG_MISC_RTSX=3Dm
> > > > CONFIG_PVPANIC=3Dy
> > > > # CONFIG_C2PORT is not set
> > > > =

> > > > #
> > > > # EEPROM support
> > > > #
> > > > # CONFIG_EEPROM_AT24 is not set
> > > > # CONFIG_EEPROM_AT25 is not set
> > > > CONFIG_EEPROM_LEGACY=3Dm
> > > > CONFIG_EEPROM_MAX6875=3Dm
> > > > CONFIG_EEPROM_93CX6=3Dm
> > > > # CONFIG_EEPROM_93XX46 is not set
> > > > # CONFIG_EEPROM_IDT_89HPESX is not set
> > > > # CONFIG_EEPROM_EE1004 is not set
> > > > # end of EEPROM support
> > > > =

> > > > CONFIG_CB710_CORE=3Dm
> > > > # CONFIG_CB710_DEBUG is not set
> > > > CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
> > > > =

> > > > #
> > > > # Texas Instruments shared transport line discipline
> > > > #
> > > > # CONFIG_TI_ST is not set
> > > > # end of Texas Instruments shared transport line discipline
> > > > =

> > > > CONFIG_SENSORS_LIS3_I2C=3Dm
> > > > CONFIG_ALTERA_STAPL=3Dm
> > > > CONFIG_INTEL_MEI=3Dm
> > > > CONFIG_INTEL_MEI_ME=3Dm
> > > > # CONFIG_INTEL_MEI_TXE is not set
> > > > # CONFIG_INTEL_MEI_HDCP is not set
> > > > CONFIG_VMWARE_VMCI=3Dm
> > > > # CONFIG_GENWQE is not set
> > > > # CONFIG_ECHO is not set
> > > > # CONFIG_BCM_VK is not set
> > > > # CONFIG_MISC_ALCOR_PCI is not set
> > > > CONFIG_MISC_RTSX_PCI=3Dm
> > > > # CONFIG_MISC_RTSX_USB is not set
> > > > # CONFIG_HABANA_AI is not set
> > > > # CONFIG_UACCE is not set
> > > > # end of Misc devices
> > > > =

> > > > CONFIG_HAVE_IDE=3Dy
> > > > # CONFIG_IDE is not set
> > > > =

> > > > #
> > > > # SCSI device support
> > > > #
> > > > CONFIG_SCSI_MOD=3Dy
> > > > CONFIG_RAID_ATTRS=3Dm
> > > > CONFIG_SCSI=3Dy
> > > > CONFIG_SCSI_DMA=3Dy
> > > > CONFIG_SCSI_NETLINK=3Dy
> > > > CONFIG_SCSI_PROC_FS=3Dy
> > > > =

> > > > #
> > > > # SCSI support type (disk, tape, CD-ROM)
> > > > #
> > > > CONFIG_BLK_DEV_SD=3Dm
> > > > CONFIG_CHR_DEV_ST=3Dm
> > > > CONFIG_BLK_DEV_SR=3Dm
> > > > CONFIG_CHR_DEV_SG=3Dm
> > > > CONFIG_CHR_DEV_SCH=3Dm
> > > > CONFIG_SCSI_ENCLOSURE=3Dm
> > > > CONFIG_SCSI_CONSTANTS=3Dy
> > > > CONFIG_SCSI_LOGGING=3Dy
> > > > CONFIG_SCSI_SCAN_ASYNC=3Dy
> > > > =

> > > > #
> > > > # SCSI Transports
> > > > #
> > > > CONFIG_SCSI_SPI_ATTRS=3Dm
> > > > CONFIG_SCSI_FC_ATTRS=3Dm
> > > > CONFIG_SCSI_ISCSI_ATTRS=3Dm
> > > > CONFIG_SCSI_SAS_ATTRS=3Dm
> > > > CONFIG_SCSI_SAS_LIBSAS=3Dm
> > > > CONFIG_SCSI_SAS_ATA=3Dy
> > > > CONFIG_SCSI_SAS_HOST_SMP=3Dy
> > > > CONFIG_SCSI_SRP_ATTRS=3Dm
> > > > # end of SCSI Transports
> > > > =

> > > > CONFIG_SCSI_LOWLEVEL=3Dy
> > > > # CONFIG_ISCSI_TCP is not set
> > > > # CONFIG_ISCSI_BOOT_SYSFS is not set
> > > > # CONFIG_SCSI_CXGB3_ISCSI is not set
> > > > # CONFIG_SCSI_CXGB4_ISCSI is not set
> > > > # CONFIG_SCSI_BNX2_ISCSI is not set
> > > > # CONFIG_BE2ISCSI is not set
> > > > # CONFIG_BLK_DEV_3W_XXXX_RAID is not set
> > > > # CONFIG_SCSI_HPSA is not set
> > > > # CONFIG_SCSI_3W_9XXX is not set
> > > > # CONFIG_SCSI_3W_SAS is not set
> > > > # CONFIG_SCSI_ACARD is not set
> > > > # CONFIG_SCSI_AACRAID is not set
> > > > # CONFIG_SCSI_AIC7XXX is not set
> > > > # CONFIG_SCSI_AIC79XX is not set
> > > > # CONFIG_SCSI_AIC94XX is not set
> > > > # CONFIG_SCSI_MVSAS is not set
> > > > # CONFIG_SCSI_MVUMI is not set
> > > > # CONFIG_SCSI_DPT_I2O is not set
> > > > # CONFIG_SCSI_ADVANSYS is not set
> > > > # CONFIG_SCSI_ARCMSR is not set
> > > > # CONFIG_SCSI_ESAS2R is not set
> > > > # CONFIG_MEGARAID_NEWGEN is not set
> > > > # CONFIG_MEGARAID_LEGACY is not set
> > > > # CONFIG_MEGARAID_SAS is not set
> > > > CONFIG_SCSI_MPT3SAS=3Dm
> > > > CONFIG_SCSI_MPT2SAS_MAX_SGE=3D128
> > > > CONFIG_SCSI_MPT3SAS_MAX_SGE=3D128
> > > > # CONFIG_SCSI_MPT2SAS is not set
> > > > # CONFIG_SCSI_SMARTPQI is not set
> > > > # CONFIG_SCSI_UFSHCD is not set
> > > > # CONFIG_SCSI_HPTIOP is not set
> > > > # CONFIG_SCSI_BUSLOGIC is not set
> > > > # CONFIG_SCSI_MYRB is not set
> > > > # CONFIG_SCSI_MYRS is not set
> > > > # CONFIG_VMWARE_PVSCSI is not set
> > > > # CONFIG_XEN_SCSI_FRONTEND is not set
> > > > CONFIG_HYPERV_STORAGE=3Dm
> > > > # CONFIG_LIBFC is not set
> > > > # CONFIG_SCSI_SNIC is not set
> > > > # CONFIG_SCSI_DMX3191D is not set
> > > > # CONFIG_SCSI_FDOMAIN_PCI is not set
> > > > CONFIG_SCSI_ISCI=3Dm
> > > > # CONFIG_SCSI_IPS is not set
> > > > # CONFIG_SCSI_INITIO is not set
> > > > # CONFIG_SCSI_INIA100 is not set
> > > > # CONFIG_SCSI_PPA is not set
> > > > # CONFIG_SCSI_IMM is not set
> > > > # CONFIG_SCSI_STEX is not set
> > > > # CONFIG_SCSI_SYM53C8XX_2 is not set
> > > > # CONFIG_SCSI_IPR is not set
> > > > # CONFIG_SCSI_QLOGIC_1280 is not set
> > > > # CONFIG_SCSI_QLA_FC is not set
> > > > # CONFIG_SCSI_QLA_ISCSI is not set
> > > > # CONFIG_SCSI_LPFC is not set
> > > > # CONFIG_SCSI_DC395x is not set
> > > > # CONFIG_SCSI_AM53C974 is not set
> > > > # CONFIG_SCSI_WD719X is not set
> > > > CONFIG_SCSI_DEBUG=3Dm
> > > > # CONFIG_SCSI_PMCRAID is not set
> > > > # CONFIG_SCSI_PM8001 is not set
> > > > # CONFIG_SCSI_BFA_FC is not set
> > > > # CONFIG_SCSI_VIRTIO is not set
> > > > # CONFIG_SCSI_CHELSIO_FCOE is not set
> > > > CONFIG_SCSI_DH=3Dy
> > > > CONFIG_SCSI_DH_RDAC=3Dy
> > > > CONFIG_SCSI_DH_HP_SW=3Dy
> > > > CONFIG_SCSI_DH_EMC=3Dy
> > > > CONFIG_SCSI_DH_ALUA=3Dy
> > > > # end of SCSI device support
> > > > =

> > > > CONFIG_ATA=3Dm
> > > > CONFIG_SATA_HOST=3Dy
> > > > CONFIG_PATA_TIMINGS=3Dy
> > > > CONFIG_ATA_VERBOSE_ERROR=3Dy
> > > > CONFIG_ATA_FORCE=3Dy
> > > > CONFIG_ATA_ACPI=3Dy
> > > > # CONFIG_SATA_ZPODD is not set
> > > > CONFIG_SATA_PMP=3Dy
> > > > =

> > > > #
> > > > # Controllers with non-SFF native interface
> > > > #
> > > > CONFIG_SATA_AHCI=3Dm
> > > > CONFIG_SATA_MOBILE_LPM_POLICY=3D0
> > > > CONFIG_SATA_AHCI_PLATFORM=3Dm
> > > > # CONFIG_SATA_INIC162X is not set
> > > > # CONFIG_SATA_ACARD_AHCI is not set
> > > > # CONFIG_SATA_SIL24 is not set
> > > > CONFIG_ATA_SFF=3Dy
> > > > =

> > > > #
> > > > # SFF controllers with custom DMA interface
> > > > #
> > > > # CONFIG_PDC_ADMA is not set
> > > > # CONFIG_SATA_QSTOR is not set
> > > > # CONFIG_SATA_SX4 is not set
> > > > CONFIG_ATA_BMDMA=3Dy
> > > > =

> > > > #
> > > > # SATA SFF controllers with BMDMA
> > > > #
> > > > CONFIG_ATA_PIIX=3Dm
> > > > # CONFIG_SATA_DWC is not set
> > > > # CONFIG_SATA_MV is not set
> > > > # CONFIG_SATA_NV is not set
> > > > # CONFIG_SATA_PROMISE is not set
> > > > # CONFIG_SATA_SIL is not set
> > > > # CONFIG_SATA_SIS is not set
> > > > # CONFIG_SATA_SVW is not set
> > > > # CONFIG_SATA_ULI is not set
> > > > # CONFIG_SATA_VIA is not set
> > > > # CONFIG_SATA_VITESSE is not set
> > > > =

> > > > #
> > > > # PATA SFF controllers with BMDMA
> > > > #
> > > > # CONFIG_PATA_ALI is not set
> > > > # CONFIG_PATA_AMD is not set
> > > > # CONFIG_PATA_ARTOP is not set
> > > > # CONFIG_PATA_ATIIXP is not set
> > > > # CONFIG_PATA_ATP867X is not set
> > > > # CONFIG_PATA_CMD64X is not set
> > > > # CONFIG_PATA_CYPRESS is not set
> > > > # CONFIG_PATA_EFAR is not set
> > > > # CONFIG_PATA_HPT366 is not set
> > > > # CONFIG_PATA_HPT37X is not set
> > > > # CONFIG_PATA_HPT3X2N is not set
> > > > # CONFIG_PATA_HPT3X3 is not set
> > > > # CONFIG_PATA_IT8213 is not set
> > > > # CONFIG_PATA_IT821X is not set
> > > > # CONFIG_PATA_JMICRON is not set
> > > > # CONFIG_PATA_MARVELL is not set
> > > > # CONFIG_PATA_NETCELL is not set
> > > > # CONFIG_PATA_NINJA32 is not set
> > > > # CONFIG_PATA_NS87415 is not set
> > > > # CONFIG_PATA_OLDPIIX is not set
> > > > # CONFIG_PATA_OPTIDMA is not set
> > > > # CONFIG_PATA_PDC2027X is not set
> > > > # CONFIG_PATA_PDC_OLD is not set
> > > > # CONFIG_PATA_RADISYS is not set
> > > > # CONFIG_PATA_RDC is not set
> > > > # CONFIG_PATA_SCH is not set
> > > > # CONFIG_PATA_SERVERWORKS is not set
> > > > # CONFIG_PATA_SIL680 is not set
> > > > # CONFIG_PATA_SIS is not set
> > > > # CONFIG_PATA_TOSHIBA is not set
> > > > # CONFIG_PATA_TRIFLEX is not set
> > > > # CONFIG_PATA_VIA is not set
> > > > # CONFIG_PATA_WINBOND is not set
> > > > =

> > > > #
> > > > # PIO-only SFF controllers
> > > > #
> > > > # CONFIG_PATA_CMD640_PCI is not set
> > > > # CONFIG_PATA_MPIIX is not set
> > > > # CONFIG_PATA_NS87410 is not set
> > > > # CONFIG_PATA_OPTI is not set
> > > > # CONFIG_PATA_RZ1000 is not set
> > > > =

> > > > #
> > > > # Generic fallback / legacy drivers
> > > > #
> > > > # CONFIG_PATA_ACPI is not set
> > > > CONFIG_ATA_GENERIC=3Dm
> > > > # CONFIG_PATA_LEGACY is not set
> > > > CONFIG_MD=3Dy
> > > > CONFIG_BLK_DEV_MD=3Dy
> > > > CONFIG_MD_AUTODETECT=3Dy
> > > > CONFIG_MD_LINEAR=3Dm
> > > > CONFIG_MD_RAID0=3Dm
> > > > CONFIG_MD_RAID1=3Dm
> > > > CONFIG_MD_RAID10=3Dm
> > > > CONFIG_MD_RAID456=3Dm
> > > > CONFIG_MD_MULTIPATH=3Dm
> > > > CONFIG_MD_FAULTY=3Dm
> > > > CONFIG_MD_CLUSTER=3Dm
> > > > # CONFIG_BCACHE is not set
> > > > CONFIG_BLK_DEV_DM_BUILTIN=3Dy
> > > > CONFIG_BLK_DEV_DM=3Dm
> > > > CONFIG_DM_DEBUG=3Dy
> > > > CONFIG_DM_BUFIO=3Dm
> > > > # CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
> > > > CONFIG_DM_BIO_PRISON=3Dm
> > > > CONFIG_DM_PERSISTENT_DATA=3Dm
> > > > # CONFIG_DM_UNSTRIPED is not set
> > > > CONFIG_DM_CRYPT=3Dm
> > > > CONFIG_DM_SNAPSHOT=3Dm
> > > > CONFIG_DM_THIN_PROVISIONING=3Dm
> > > > CONFIG_DM_CACHE=3Dm
> > > > CONFIG_DM_CACHE_SMQ=3Dm
> > > > CONFIG_DM_WRITECACHE=3Dm
> > > > # CONFIG_DM_EBS is not set
> > > > CONFIG_DM_ERA=3Dm
> > > > # CONFIG_DM_CLONE is not set
> > > > CONFIG_DM_MIRROR=3Dm
> > > > CONFIG_DM_LOG_USERSPACE=3Dm
> > > > CONFIG_DM_RAID=3Dm
> > > > CONFIG_DM_ZERO=3Dm
> > > > CONFIG_DM_MULTIPATH=3Dm
> > > > CONFIG_DM_MULTIPATH_QL=3Dm
> > > > CONFIG_DM_MULTIPATH_ST=3Dm
> > > > # CONFIG_DM_MULTIPATH_HST is not set
> > > > # CONFIG_DM_MULTIPATH_IOA is not set
> > > > CONFIG_DM_DELAY=3Dm
> > > > # CONFIG_DM_DUST is not set
> > > > CONFIG_DM_UEVENT=3Dy
> > > > CONFIG_DM_FLAKEY=3Dm
> > > > CONFIG_DM_VERITY=3Dm
> > > > # CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
> > > > # CONFIG_DM_VERITY_FEC is not set
> > > > CONFIG_DM_SWITCH=3Dm
> > > > CONFIG_DM_LOG_WRITES=3Dm
> > > > CONFIG_DM_INTEGRITY=3Dm
> > > > # CONFIG_DM_ZONED is not set
> > > > CONFIG_TARGET_CORE=3Dm
> > > > CONFIG_TCM_IBLOCK=3Dm
> > > > CONFIG_TCM_FILEIO=3Dm
> > > > CONFIG_TCM_PSCSI=3Dm
> > > > CONFIG_TCM_USER2=3Dm
> > > > CONFIG_LOOPBACK_TARGET=3Dm
> > > > CONFIG_ISCSI_TARGET=3Dm
> > > > # CONFIG_SBP_TARGET is not set
> > > > # CONFIG_FUSION is not set
> > > > =

> > > > #
> > > > # IEEE 1394 (FireWire) support
> > > > #
> > > > CONFIG_FIREWIRE=3Dm
> > > > CONFIG_FIREWIRE_OHCI=3Dm
> > > > CONFIG_FIREWIRE_SBP2=3Dm
> > > > CONFIG_FIREWIRE_NET=3Dm
> > > > # CONFIG_FIREWIRE_NOSY is not set
> > > > # end of IEEE 1394 (FireWire) support
> > > > =

> > > > CONFIG_MACINTOSH_DRIVERS=3Dy
> > > > CONFIG_MAC_EMUMOUSEBTN=3Dy
> > > > CONFIG_NETDEVICES=3Dy
> > > > CONFIG_MII=3Dy
> > > > CONFIG_NET_CORE=3Dy
> > > > # CONFIG_BONDING is not set
> > > > # CONFIG_DUMMY is not set
> > > > # CONFIG_WIREGUARD is not set
> > > > # CONFIG_EQUALIZER is not set
> > > > # CONFIG_NET_FC is not set
> > > > # CONFIG_IFB is not set
> > > > # CONFIG_NET_TEAM is not set
> > > > # CONFIG_MACVLAN is not set
> > > > # CONFIG_IPVLAN is not set
> > > > # CONFIG_VXLAN is not set
> > > > # CONFIG_GENEVE is not set
> > > > # CONFIG_BAREUDP is not set
> > > > # CONFIG_GTP is not set
> > > > # CONFIG_MACSEC is not set
> > > > CONFIG_NETCONSOLE=3Dm
> > > > CONFIG_NETCONSOLE_DYNAMIC=3Dy
> > > > CONFIG_NETPOLL=3Dy
> > > > CONFIG_NET_POLL_CONTROLLER=3Dy
> > > > CONFIG_TUN=3Dm
> > > > # CONFIG_TUN_VNET_CROSS_LE is not set
> > > > CONFIG_VETH=3Dm
> > > > CONFIG_VIRTIO_NET=3Dm
> > > > # CONFIG_NLMON is not set
> > > > # CONFIG_NET_VRF is not set
> > > > # CONFIG_VSOCKMON is not set
> > > > # CONFIG_ARCNET is not set
> > > > CONFIG_ATM_DRIVERS=3Dy
> > > > # CONFIG_ATM_DUMMY is not set
> > > > # CONFIG_ATM_TCP is not set
> > > > # CONFIG_ATM_LANAI is not set
> > > > # CONFIG_ATM_ENI is not set
> > > > # CONFIG_ATM_FIRESTREAM is not set
> > > > # CONFIG_ATM_ZATM is not set
> > > > # CONFIG_ATM_NICSTAR is not set
> > > > # CONFIG_ATM_IDT77252 is not set
> > > > # CONFIG_ATM_AMBASSADOR is not set
> > > > # CONFIG_ATM_HORIZON is not set
> > > > # CONFIG_ATM_IA is not set
> > > > # CONFIG_ATM_FORE200E is not set
> > > > # CONFIG_ATM_HE is not set
> > > > # CONFIG_ATM_SOLOS is not set
> > > > =

> > > > #
> > > > # Distributed Switch Architecture drivers
> > > > #
> > > > # CONFIG_NET_DSA_MV88E6XXX_PTP is not set
> > > > # end of Distributed Switch Architecture drivers
> > > > =

> > > > CONFIG_ETHERNET=3Dy
> > > > CONFIG_MDIO=3Dy
> > > > CONFIG_NET_VENDOR_3COM=3Dy
> > > > # CONFIG_VORTEX is not set
> > > > # CONFIG_TYPHOON is not set
> > > > CONFIG_NET_VENDOR_ADAPTEC=3Dy
> > > > # CONFIG_ADAPTEC_STARFIRE is not set
> > > > CONFIG_NET_VENDOR_AGERE=3Dy
> > > > # CONFIG_ET131X is not set
> > > > CONFIG_NET_VENDOR_ALACRITECH=3Dy
> > > > # CONFIG_SLICOSS is not set
> > > > CONFIG_NET_VENDOR_ALTEON=3Dy
> > > > # CONFIG_ACENIC is not set
> > > > # CONFIG_ALTERA_TSE is not set
> > > > CONFIG_NET_VENDOR_AMAZON=3Dy
> > > > # CONFIG_ENA_ETHERNET is not set
> > > > CONFIG_NET_VENDOR_AMD=3Dy
> > > > # CONFIG_AMD8111_ETH is not set
> > > > # CONFIG_PCNET32 is not set
> > > > # CONFIG_AMD_XGBE is not set
> > > > CONFIG_NET_VENDOR_AQUANTIA=3Dy
> > > > # CONFIG_AQTION is not set
> > > > CONFIG_NET_VENDOR_ARC=3Dy
> > > > CONFIG_NET_VENDOR_ATHEROS=3Dy
> > > > # CONFIG_ATL2 is not set
> > > > # CONFIG_ATL1 is not set
> > > > # CONFIG_ATL1E is not set
> > > > # CONFIG_ATL1C is not set
> > > > # CONFIG_ALX is not set
> > > > CONFIG_NET_VENDOR_BROADCOM=3Dy
> > > > # CONFIG_B44 is not set
> > > > # CONFIG_BCMGENET is not set
> > > > # CONFIG_BNX2 is not set
> > > > # CONFIG_CNIC is not set
> > > > # CONFIG_TIGON3 is not set
> > > > # CONFIG_BNX2X is not set
> > > > # CONFIG_SYSTEMPORT is not set
> > > > # CONFIG_BNXT is not set
> > > > CONFIG_NET_VENDOR_BROCADE=3Dy
> > > > # CONFIG_BNA is not set
> > > > CONFIG_NET_VENDOR_CADENCE=3Dy
> > > > # CONFIG_MACB is not set
> > > > CONFIG_NET_VENDOR_CAVIUM=3Dy
> > > > # CONFIG_THUNDER_NIC_PF is not set
> > > > # CONFIG_THUNDER_NIC_VF is not set
> > > > # CONFIG_THUNDER_NIC_BGX is not set
> > > > # CONFIG_THUNDER_NIC_RGX is not set
> > > > CONFIG_CAVIUM_PTP=3Dy
> > > > # CONFIG_LIQUIDIO is not set
> > > > # CONFIG_LIQUIDIO_VF is not set
> > > > CONFIG_NET_VENDOR_CHELSIO=3Dy
> > > > # CONFIG_CHELSIO_T1 is not set
> > > > # CONFIG_CHELSIO_T3 is not set
> > > > # CONFIG_CHELSIO_T4 is not set
> > > > # CONFIG_CHELSIO_T4VF is not set
> > > > CONFIG_NET_VENDOR_CISCO=3Dy
> > > > # CONFIG_ENIC is not set
> > > > CONFIG_NET_VENDOR_CORTINA=3Dy
> > > > # CONFIG_CX_ECAT is not set
> > > > # CONFIG_DNET is not set
> > > > CONFIG_NET_VENDOR_DEC=3Dy
> > > > # CONFIG_NET_TULIP is not set
> > > > CONFIG_NET_VENDOR_DLINK=3Dy
> > > > # CONFIG_DL2K is not set
> > > > # CONFIG_SUNDANCE is not set
> > > > CONFIG_NET_VENDOR_EMULEX=3Dy
> > > > # CONFIG_BE2NET is not set
> > > > CONFIG_NET_VENDOR_EZCHIP=3Dy
> > > > CONFIG_NET_VENDOR_GOOGLE=3Dy
> > > > # CONFIG_GVE is not set
> > > > CONFIG_NET_VENDOR_HUAWEI=3Dy
> > > > # CONFIG_HINIC is not set
> > > > CONFIG_NET_VENDOR_I825XX=3Dy
> > > > CONFIG_NET_VENDOR_INTEL=3Dy
> > > > # CONFIG_E100 is not set
> > > > CONFIG_E1000=3Dy
> > > > CONFIG_E1000E=3Dy
> > > > CONFIG_E1000E_HWTS=3Dy
> > > > CONFIG_IGB=3Dy
> > > > CONFIG_IGB_HWMON=3Dy
> > > > # CONFIG_IGBVF is not set
> > > > # CONFIG_IXGB is not set
> > > > CONFIG_IXGBE=3Dy
> > > > CONFIG_IXGBE_HWMON=3Dy
> > > > # CONFIG_IXGBE_DCB is not set
> > > > CONFIG_IXGBE_IPSEC=3Dy
> > > > # CONFIG_IXGBEVF is not set
> > > > CONFIG_I40E=3Dy
> > > > # CONFIG_I40E_DCB is not set
> > > > # CONFIG_I40EVF is not set
> > > > # CONFIG_ICE is not set
> > > > # CONFIG_FM10K is not set
> > > > # CONFIG_IGC is not set
> > > > # CONFIG_JME is not set
> > > > CONFIG_NET_VENDOR_MARVELL=3Dy
> > > > # CONFIG_MVMDIO is not set
> > > > # CONFIG_SKGE is not set
> > > > # CONFIG_SKY2 is not set
> > > > # CONFIG_PRESTERA is not set
> > > > CONFIG_NET_VENDOR_MELLANOX=3Dy
> > > > # CONFIG_MLX4_EN is not set
> > > > # CONFIG_MLX5_CORE is not set
> > > > # CONFIG_MLXSW_CORE is not set
> > > > # CONFIG_MLXFW is not set
> > > > CONFIG_NET_VENDOR_MICREL=3Dy
> > > > # CONFIG_KS8842 is not set
> > > > # CONFIG_KS8851 is not set
> > > > # CONFIG_KS8851_MLL is not set
> > > > # CONFIG_KSZ884X_PCI is not set
> > > > CONFIG_NET_VENDOR_MICROCHIP=3Dy
> > > > # CONFIG_ENC28J60 is not set
> > > > # CONFIG_ENCX24J600 is not set
> > > > # CONFIG_LAN743X is not set
> > > > CONFIG_NET_VENDOR_MICROSEMI=3Dy
> > > > CONFIG_NET_VENDOR_MYRI=3Dy
> > > > # CONFIG_MYRI10GE is not set
> > > > # CONFIG_FEALNX is not set
> > > > CONFIG_NET_VENDOR_NATSEMI=3Dy
> > > > # CONFIG_NATSEMI is not set
> > > > # CONFIG_NS83820 is not set
> > > > CONFIG_NET_VENDOR_NETERION=3Dy
> > > > # CONFIG_S2IO is not set
> > > > # CONFIG_VXGE is not set
> > > > CONFIG_NET_VENDOR_NETRONOME=3Dy
> > > > # CONFIG_NFP is not set
> > > > CONFIG_NET_VENDOR_NI=3Dy
> > > > # CONFIG_NI_XGE_MANAGEMENT_ENET is not set
> > > > CONFIG_NET_VENDOR_8390=3Dy
> > > > # CONFIG_NE2K_PCI is not set
> > > > CONFIG_NET_VENDOR_NVIDIA=3Dy
> > > > # CONFIG_FORCEDETH is not set
> > > > CONFIG_NET_VENDOR_OKI=3Dy
> > > > # CONFIG_ETHOC is not set
> > > > CONFIG_NET_VENDOR_PACKET_ENGINES=3Dy
> > > > # CONFIG_HAMACHI is not set
> > > > # CONFIG_YELLOWFIN is not set
> > > > CONFIG_NET_VENDOR_PENSANDO=3Dy
> > > > # CONFIG_IONIC is not set
> > > > CONFIG_NET_VENDOR_QLOGIC=3Dy
> > > > # CONFIG_QLA3XXX is not set
> > > > # CONFIG_QLCNIC is not set
> > > > # CONFIG_NETXEN_NIC is not set
> > > > # CONFIG_QED is not set
> > > > CONFIG_NET_VENDOR_QUALCOMM=3Dy
> > > > # CONFIG_QCOM_EMAC is not set
> > > > # CONFIG_RMNET is not set
> > > > CONFIG_NET_VENDOR_RDC=3Dy
> > > > # CONFIG_R6040 is not set
> > > > CONFIG_NET_VENDOR_REALTEK=3Dy
> > > > # CONFIG_ATP is not set
> > > > # CONFIG_8139CP is not set
> > > > # CONFIG_8139TOO is not set
> > > > CONFIG_R8169=3Dy
> > > > CONFIG_NET_VENDOR_RENESAS=3Dy
> > > > CONFIG_NET_VENDOR_ROCKER=3Dy
> > > > # CONFIG_ROCKER is not set
> > > > CONFIG_NET_VENDOR_SAMSUNG=3Dy
> > > > # CONFIG_SXGBE_ETH is not set
> > > > CONFIG_NET_VENDOR_SEEQ=3Dy
> > > > CONFIG_NET_VENDOR_SOLARFLARE=3Dy
> > > > # CONFIG_SFC is not set
> > > > # CONFIG_SFC_FALCON is not set
> > > > CONFIG_NET_VENDOR_SILAN=3Dy
> > > > # CONFIG_SC92031 is not set
> > > > CONFIG_NET_VENDOR_SIS=3Dy
> > > > # CONFIG_SIS900 is not set
> > > > # CONFIG_SIS190 is not set
> > > > CONFIG_NET_VENDOR_SMSC=3Dy
> > > > # CONFIG_EPIC100 is not set
> > > > # CONFIG_SMSC911X is not set
> > > > # CONFIG_SMSC9420 is not set
> > > > CONFIG_NET_VENDOR_SOCIONEXT=3Dy
> > > > CONFIG_NET_VENDOR_STMICRO=3Dy
> > > > # CONFIG_STMMAC_ETH is not set
> > > > CONFIG_NET_VENDOR_SUN=3Dy
> > > > # CONFIG_HAPPYMEAL is not set
> > > > # CONFIG_SUNGEM is not set
> > > > # CONFIG_CASSINI is not set
> > > > # CONFIG_NIU is not set
> > > > CONFIG_NET_VENDOR_SYNOPSYS=3Dy
> > > > # CONFIG_DWC_XLGMAC is not set
> > > > CONFIG_NET_VENDOR_TEHUTI=3Dy
> > > > # CONFIG_TEHUTI is not set
> > > > CONFIG_NET_VENDOR_TI=3Dy
> > > > # CONFIG_TI_CPSW_PHY_SEL is not set
> > > > # CONFIG_TLAN is not set
> > > > CONFIG_NET_VENDOR_VIA=3Dy
> > > > # CONFIG_VIA_RHINE is not set
> > > > # CONFIG_VIA_VELOCITY is not set
> > > > CONFIG_NET_VENDOR_WIZNET=3Dy
> > > > # CONFIG_WIZNET_W5100 is not set
> > > > # CONFIG_WIZNET_W5300 is not set
> > > > CONFIG_NET_VENDOR_XILINX=3Dy
> > > > # CONFIG_XILINX_EMACLITE is not set
> > > > # CONFIG_XILINX_AXI_EMAC is not set
> > > > # CONFIG_XILINX_LL_TEMAC is not set
> > > > # CONFIG_FDDI is not set
> > > > # CONFIG_HIPPI is not set
> > > > # CONFIG_NET_SB1000 is not set
> > > > CONFIG_PHYLIB=3Dy
> > > > # CONFIG_LED_TRIGGER_PHY is not set
> > > > # CONFIG_FIXED_PHY is not set
> > > > =

> > > > #
> > > > # MII PHY device drivers
> > > > #
> > > > # CONFIG_AMD_PHY is not set
> > > > # CONFIG_ADIN_PHY is not set
> > > > # CONFIG_AQUANTIA_PHY is not set
> > > > # CONFIG_AX88796B_PHY is not set
> > > > # CONFIG_BROADCOM_PHY is not set
> > > > # CONFIG_BCM54140_PHY is not set
> > > > # CONFIG_BCM7XXX_PHY is not set
> > > > # CONFIG_BCM84881_PHY is not set
> > > > # CONFIG_BCM87XX_PHY is not set
> > > > # CONFIG_CICADA_PHY is not set
> > > > # CONFIG_CORTINA_PHY is not set
> > > > # CONFIG_DAVICOM_PHY is not set
> > > > # CONFIG_ICPLUS_PHY is not set
> > > > # CONFIG_LXT_PHY is not set
> > > > # CONFIG_INTEL_XWAY_PHY is not set
> > > > # CONFIG_LSI_ET1011C_PHY is not set
> > > > # CONFIG_MARVELL_PHY is not set
> > > > # CONFIG_MARVELL_10G_PHY is not set
> > > > # CONFIG_MICREL_PHY is not set
> > > > # CONFIG_MICROCHIP_PHY is not set
> > > > # CONFIG_MICROCHIP_T1_PHY is not set
> > > > # CONFIG_MICROSEMI_PHY is not set
> > > > # CONFIG_NATIONAL_PHY is not set
> > > > # CONFIG_NXP_TJA11XX_PHY is not set
> > > > # CONFIG_QSEMI_PHY is not set
> > > > CONFIG_REALTEK_PHY=3Dy
> > > > # CONFIG_RENESAS_PHY is not set
> > > > # CONFIG_ROCKCHIP_PHY is not set
> > > > # CONFIG_SMSC_PHY is not set
> > > > # CONFIG_STE10XP is not set
> > > > # CONFIG_TERANETICS_PHY is not set
> > > > # CONFIG_DP83822_PHY is not set
> > > > # CONFIG_DP83TC811_PHY is not set
> > > > # CONFIG_DP83848_PHY is not set
> > > > # CONFIG_DP83867_PHY is not set
> > > > # CONFIG_DP83869_PHY is not set
> > > > # CONFIG_VITESSE_PHY is not set
> > > > # CONFIG_XILINX_GMII2RGMII is not set
> > > > # CONFIG_MICREL_KS8995MA is not set
> > > > CONFIG_MDIO_DEVICE=3Dy
> > > > CONFIG_MDIO_BUS=3Dy
> > > > CONFIG_MDIO_DEVRES=3Dy
> > > > # CONFIG_MDIO_BITBANG is not set
> > > > # CONFIG_MDIO_BCM_UNIMAC is not set
> > > > # CONFIG_MDIO_MVUSB is not set
> > > > # CONFIG_MDIO_MSCC_MIIM is not set
> > > > # CONFIG_MDIO_THUNDER is not set
> > > > =

> > > > #
> > > > # MDIO Multiplexers
> > > > #
> > > > =

> > > > #
> > > > # PCS device drivers
> > > > #
> > > > # CONFIG_PCS_XPCS is not set
> > > > # end of PCS device drivers
> > > > =

> > > > # CONFIG_PLIP is not set
> > > > # CONFIG_PPP is not set
> > > > # CONFIG_SLIP is not set
> > > > CONFIG_USB_NET_DRIVERS=3Dy
> > > > # CONFIG_USB_CATC is not set
> > > > # CONFIG_USB_KAWETH is not set
> > > > # CONFIG_USB_PEGASUS is not set
> > > > # CONFIG_USB_RTL8150 is not set
> > > > CONFIG_USB_RTL8152=3Dy
> > > > # CONFIG_USB_LAN78XX is not set
> > > > CONFIG_USB_USBNET=3Dy
> > > > CONFIG_USB_NET_AX8817X=3Dy
> > > > CONFIG_USB_NET_AX88179_178A=3Dy
> > > > # CONFIG_USB_NET_CDCETHER is not set
> > > > # CONFIG_USB_NET_CDC_EEM is not set
> > > > # CONFIG_USB_NET_CDC_NCM is not set
> > > > # CONFIG_USB_NET_HUAWEI_CDC_NCM is not set
> > > > # CONFIG_USB_NET_CDC_MBIM is not set
> > > > # CONFIG_USB_NET_DM9601 is not set
> > > > # CONFIG_USB_NET_SR9700 is not set
> > > > # CONFIG_USB_NET_SR9800 is not set
> > > > # CONFIG_USB_NET_SMSC75XX is not set
> > > > # CONFIG_USB_NET_SMSC95XX is not set
> > > > # CONFIG_USB_NET_GL620A is not set
> > > > # CONFIG_USB_NET_NET1080 is not set
> > > > # CONFIG_USB_NET_PLUSB is not set
> > > > # CONFIG_USB_NET_MCS7830 is not set
> > > > # CONFIG_USB_NET_RNDIS_HOST is not set
> > > > # CONFIG_USB_NET_CDC_SUBSET is not set
> > > > # CONFIG_USB_NET_ZAURUS is not set
> > > > # CONFIG_USB_NET_CX82310_ETH is not set
> > > > # CONFIG_USB_NET_KALMIA is not set
> > > > # CONFIG_USB_NET_QMI_WWAN is not set
> > > > # CONFIG_USB_HSO is not set
> > > > # CONFIG_USB_NET_INT51X1 is not set
> > > > # CONFIG_USB_IPHETH is not set
> > > > # CONFIG_USB_SIERRA_NET is not set
> > > > # CONFIG_USB_NET_CH9200 is not set
> > > > # CONFIG_USB_NET_AQC111 is not set
> > > > CONFIG_WLAN=3Dy
> > > > CONFIG_WLAN_VENDOR_ADMTEK=3Dy
> > > > # CONFIG_ADM8211 is not set
> > > > CONFIG_WLAN_VENDOR_ATH=3Dy
> > > > # CONFIG_ATH_DEBUG is not set
> > > > # CONFIG_ATH5K is not set
> > > > # CONFIG_ATH5K_PCI is not set
> > > > # CONFIG_ATH9K is not set
> > > > # CONFIG_ATH9K_HTC is not set
> > > > # CONFIG_CARL9170 is not set
> > > > # CONFIG_ATH6KL is not set
> > > > # CONFIG_AR5523 is not set
> > > > # CONFIG_WIL6210 is not set
> > > > # CONFIG_ATH10K is not set
> > > > # CONFIG_WCN36XX is not set
> > > > # CONFIG_ATH11K is not set
> > > > CONFIG_WLAN_VENDOR_ATMEL=3Dy
> > > > # CONFIG_ATMEL is not set
> > > > # CONFIG_AT76C50X_USB is not set
> > > > CONFIG_WLAN_VENDOR_BROADCOM=3Dy
> > > > # CONFIG_B43 is not set
> > > > # CONFIG_B43LEGACY is not set
> > > > # CONFIG_BRCMSMAC is not set
> > > > # CONFIG_BRCMFMAC is not set
> > > > CONFIG_WLAN_VENDOR_CISCO=3Dy
> > > > # CONFIG_AIRO is not set
> > > > CONFIG_WLAN_VENDOR_INTEL=3Dy
> > > > # CONFIG_IPW2100 is not set
> > > > # CONFIG_IPW2200 is not set
> > > > # CONFIG_IWL4965 is not set
> > > > # CONFIG_IWL3945 is not set
> > > > # CONFIG_IWLWIFI is not set
> > > > CONFIG_WLAN_VENDOR_INTERSIL=3Dy
> > > > # CONFIG_HOSTAP is not set
> > > > # CONFIG_HERMES is not set
> > > > # CONFIG_P54_COMMON is not set
> > > > # CONFIG_PRISM54 is not set
> > > > CONFIG_WLAN_VENDOR_MARVELL=3Dy
> > > > # CONFIG_LIBERTAS is not set
> > > > # CONFIG_LIBERTAS_THINFIRM is not set
> > > > # CONFIG_MWIFIEX is not set
> > > > # CONFIG_MWL8K is not set
> > > > CONFIG_WLAN_VENDOR_MEDIATEK=3Dy
> > > > # CONFIG_MT7601U is not set
> > > > # CONFIG_MT76x0U is not set
> > > > # CONFIG_MT76x0E is not set
> > > > # CONFIG_MT76x2E is not set
> > > > # CONFIG_MT76x2U is not set
> > > > # CONFIG_MT7603E is not set
> > > > # CONFIG_MT7615E is not set
> > > > # CONFIG_MT7663U is not set
> > > > # CONFIG_MT7663S is not set
> > > > # CONFIG_MT7915E is not set
> > > > # CONFIG_MT7921E is not set
> > > > CONFIG_WLAN_VENDOR_MICROCHIP=3Dy
> > > > # CONFIG_WILC1000_SDIO is not set
> > > > # CONFIG_WILC1000_SPI is not set
> > > > CONFIG_WLAN_VENDOR_RALINK=3Dy
> > > > # CONFIG_RT2X00 is not set
> > > > CONFIG_WLAN_VENDOR_REALTEK=3Dy
> > > > # CONFIG_RTL8180 is not set
> > > > # CONFIG_RTL8187 is not set
> > > > CONFIG_RTL_CARDS=3Dm
> > > > # CONFIG_RTL8192CE is not set
> > > > # CONFIG_RTL8192SE is not set
> > > > # CONFIG_RTL8192DE is not set
> > > > # CONFIG_RTL8723AE is not set
> > > > # CONFIG_RTL8723BE is not set
> > > > # CONFIG_RTL8188EE is not set
> > > > # CONFIG_RTL8192EE is not set
> > > > # CONFIG_RTL8821AE is not set
> > > > # CONFIG_RTL8192CU is not set
> > > > # CONFIG_RTL8XXXU is not set
> > > > # CONFIG_RTW88 is not set
> > > > CONFIG_WLAN_VENDOR_RSI=3Dy
> > > > # CONFIG_RSI_91X is not set
> > > > CONFIG_WLAN_VENDOR_ST=3Dy
> > > > # CONFIG_CW1200 is not set
> > > > CONFIG_WLAN_VENDOR_TI=3Dy
> > > > # CONFIG_WL1251 is not set
> > > > # CONFIG_WL12XX is not set
> > > > # CONFIG_WL18XX is not set
> > > > # CONFIG_WLCORE is not set
> > > > CONFIG_WLAN_VENDOR_ZYDAS=3Dy
> > > > # CONFIG_USB_ZD1201 is not set
> > > > # CONFIG_ZD1211RW is not set
> > > > CONFIG_WLAN_VENDOR_QUANTENNA=3Dy
> > > > # CONFIG_QTNFMAC_PCIE is not set
> > > > CONFIG_MAC80211_HWSIM=3Dm
> > > > # CONFIG_USB_NET_RNDIS_WLAN is not set
> > > > # CONFIG_VIRT_WIFI is not set
> > > > # CONFIG_WAN is not set
> > > > CONFIG_IEEE802154_DRIVERS=3Dm
> > > > # CONFIG_IEEE802154_FAKELB is not set
> > > > # CONFIG_IEEE802154_AT86RF230 is not set
> > > > # CONFIG_IEEE802154_MRF24J40 is not set
> > > > # CONFIG_IEEE802154_CC2520 is not set
> > > > # CONFIG_IEEE802154_ATUSB is not set
> > > > # CONFIG_IEEE802154_ADF7242 is not set
> > > > # CONFIG_IEEE802154_CA8210 is not set
> > > > # CONFIG_IEEE802154_MCR20A is not set
> > > > # CONFIG_IEEE802154_HWSIM is not set
> > > > CONFIG_XEN_NETDEV_FRONTEND=3Dy
> > > > # CONFIG_VMXNET3 is not set
> > > > # CONFIG_FUJITSU_ES is not set
> > > > # CONFIG_HYPERV_NET is not set
> > > > CONFIG_NETDEVSIM=3Dm
> > > > CONFIG_NET_FAILOVER=3Dm
> > > > # CONFIG_ISDN is not set
> > > > # CONFIG_NVM is not set
> > > > =

> > > > #
> > > > # Input device support
> > > > #
> > > > CONFIG_INPUT=3Dy
> > > > CONFIG_INPUT_LEDS=3Dy
> > > > CONFIG_INPUT_FF_MEMLESS=3Dm
> > > > CONFIG_INPUT_SPARSEKMAP=3Dm
> > > > # CONFIG_INPUT_MATRIXKMAP is not set
> > > > =

> > > > #
> > > > # Userland interfaces
> > > > #
> > > > CONFIG_INPUT_MOUSEDEV=3Dy
> > > > # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> > > > CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> > > > CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> > > > CONFIG_INPUT_JOYDEV=3Dm
> > > > CONFIG_INPUT_EVDEV=3Dy
> > > > # CONFIG_INPUT_EVBUG is not set
> > > > =

> > > > #
> > > > # Input Device Drivers
> > > > #
> > > > CONFIG_INPUT_KEYBOARD=3Dy
> > > > # CONFIG_KEYBOARD_ADP5588 is not set
> > > > # CONFIG_KEYBOARD_ADP5589 is not set
> > > > # CONFIG_KEYBOARD_APPLESPI is not set
> > > > CONFIG_KEYBOARD_ATKBD=3Dy
> > > > # CONFIG_KEYBOARD_QT1050 is not set
> > > > # CONFIG_KEYBOARD_QT1070 is not set
> > > > # CONFIG_KEYBOARD_QT2160 is not set
> > > > # CONFIG_KEYBOARD_DLINK_DIR685 is not set
> > > > # CONFIG_KEYBOARD_LKKBD is not set
> > > > # CONFIG_KEYBOARD_GPIO is not set
> > > > # CONFIG_KEYBOARD_GPIO_POLLED is not set
> > > > # CONFIG_KEYBOARD_TCA6416 is not set
> > > > # CONFIG_KEYBOARD_TCA8418 is not set
> > > > # CONFIG_KEYBOARD_MATRIX is not set
> > > > # CONFIG_KEYBOARD_LM8323 is not set
> > > > # CONFIG_KEYBOARD_LM8333 is not set
> > > > # CONFIG_KEYBOARD_MAX7359 is not set
> > > > # CONFIG_KEYBOARD_MCS is not set
> > > > # CONFIG_KEYBOARD_MPR121 is not set
> > > > # CONFIG_KEYBOARD_NEWTON is not set
> > > > # CONFIG_KEYBOARD_OPENCORES is not set
> > > > # CONFIG_KEYBOARD_SAMSUNG is not set
> > > > # CONFIG_KEYBOARD_STOWAWAY is not set
> > > > # CONFIG_KEYBOARD_SUNKBD is not set
> > > > # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> > > > # CONFIG_KEYBOARD_XTKBD is not set
> > > > CONFIG_INPUT_MOUSE=3Dy
> > > > CONFIG_MOUSE_PS2=3Dy
> > > > CONFIG_MOUSE_PS2_ALPS=3Dy
> > > > CONFIG_MOUSE_PS2_BYD=3Dy
> > > > CONFIG_MOUSE_PS2_LOGIPS2PP=3Dy
> > > > CONFIG_MOUSE_PS2_SYNAPTICS=3Dy
> > > > CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=3Dy
> > > > CONFIG_MOUSE_PS2_CYPRESS=3Dy
> > > > CONFIG_MOUSE_PS2_LIFEBOOK=3Dy
> > > > CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
> > > > CONFIG_MOUSE_PS2_ELANTECH=3Dy
> > > > CONFIG_MOUSE_PS2_ELANTECH_SMBUS=3Dy
> > > > CONFIG_MOUSE_PS2_SENTELIC=3Dy
> > > > # CONFIG_MOUSE_PS2_TOUCHKIT is not set
> > > > CONFIG_MOUSE_PS2_FOCALTECH=3Dy
> > > > CONFIG_MOUSE_PS2_VMMOUSE=3Dy
> > > > CONFIG_MOUSE_PS2_SMBUS=3Dy
> > > > CONFIG_MOUSE_SERIAL=3Dm
> > > > # CONFIG_MOUSE_APPLETOUCH is not set
> > > > # CONFIG_MOUSE_BCM5974 is not set
> > > > CONFIG_MOUSE_CYAPA=3Dm
> > > > CONFIG_MOUSE_ELAN_I2C=3Dm
> > > > CONFIG_MOUSE_ELAN_I2C_I2C=3Dy
> > > > CONFIG_MOUSE_ELAN_I2C_SMBUS=3Dy
> > > > CONFIG_MOUSE_VSXXXAA=3Dm
> > > > # CONFIG_MOUSE_GPIO is not set
> > > > CONFIG_MOUSE_SYNAPTICS_I2C=3Dm
> > > > # CONFIG_MOUSE_SYNAPTICS_USB is not set
> > > > # CONFIG_INPUT_JOYSTICK is not set
> > > > # CONFIG_INPUT_TABLET is not set
> > > > # CONFIG_INPUT_TOUCHSCREEN is not set
> > > > # CONFIG_INPUT_MISC is not set
> > > > CONFIG_RMI4_CORE=3Dm
> > > > CONFIG_RMI4_I2C=3Dm
> > > > CONFIG_RMI4_SPI=3Dm
> > > > CONFIG_RMI4_SMB=3Dm
> > > > CONFIG_RMI4_F03=3Dy
> > > > CONFIG_RMI4_F03_SERIO=3Dm
> > > > CONFIG_RMI4_2D_SENSOR=3Dy
> > > > CONFIG_RMI4_F11=3Dy
> > > > CONFIG_RMI4_F12=3Dy
> > > > CONFIG_RMI4_F30=3Dy
> > > > CONFIG_RMI4_F34=3Dy
> > > > # CONFIG_RMI4_F3A is not set
> > > > # CONFIG_RMI4_F54 is not set
> > > > CONFIG_RMI4_F55=3Dy
> > > > =

> > > > #
> > > > # Hardware I/O ports
> > > > #
> > > > CONFIG_SERIO=3Dy
> > > > CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> > > > CONFIG_SERIO_I8042=3Dy
> > > > CONFIG_SERIO_SERPORT=3Dy
> > > > # CONFIG_SERIO_CT82C710 is not set
> > > > # CONFIG_SERIO_PARKBD is not set
> > > > # CONFIG_SERIO_PCIPS2 is not set
> > > > CONFIG_SERIO_LIBPS2=3Dy
> > > > CONFIG_SERIO_RAW=3Dm
> > > > CONFIG_SERIO_ALTERA_PS2=3Dm
> > > > # CONFIG_SERIO_PS2MULT is not set
> > > > CONFIG_SERIO_ARC_PS2=3Dm
> > > > CONFIG_HYPERV_KEYBOARD=3Dm
> > > > # CONFIG_SERIO_GPIO_PS2 is not set
> > > > # CONFIG_USERIO is not set
> > > > # CONFIG_GAMEPORT is not set
> > > > # end of Hardware I/O ports
> > > > # end of Input device support
> > > > =

> > > > #
> > > > # Character devices
> > > > #
> > > > CONFIG_TTY=3Dy
> > > > CONFIG_VT=3Dy
> > > > CONFIG_CONSOLE_TRANSLATIONS=3Dy
> > > > CONFIG_VT_CONSOLE=3Dy
> > > > CONFIG_VT_CONSOLE_SLEEP=3Dy
> > > > CONFIG_HW_CONSOLE=3Dy
> > > > CONFIG_VT_HW_CONSOLE_BINDING=3Dy
> > > > CONFIG_UNIX98_PTYS=3Dy
> > > > # CONFIG_LEGACY_PTYS is not set
> > > > CONFIG_LDISC_AUTOLOAD=3Dy
> > > > =

> > > > #
> > > > # Serial drivers
> > > > #
> > > > CONFIG_SERIAL_EARLYCON=3Dy
> > > > CONFIG_SERIAL_8250=3Dy
> > > > # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
> > > > CONFIG_SERIAL_8250_PNP=3Dy
> > > > # CONFIG_SERIAL_8250_16550A_VARIANTS is not set
> > > > # CONFIG_SERIAL_8250_FINTEK is not set
> > > > CONFIG_SERIAL_8250_CONSOLE=3Dy
> > > > CONFIG_SERIAL_8250_DMA=3Dy
> > > > CONFIG_SERIAL_8250_PCI=3Dy
> > > > CONFIG_SERIAL_8250_EXAR=3Dy
> > > > CONFIG_SERIAL_8250_NR_UARTS=3D64
> > > > CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> > > > CONFIG_SERIAL_8250_EXTENDED=3Dy
> > > > CONFIG_SERIAL_8250_MANY_PORTS=3Dy
> > > > CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
> > > > # CONFIG_SERIAL_8250_DETECT_IRQ is not set
> > > > CONFIG_SERIAL_8250_RSA=3Dy
> > > > CONFIG_SERIAL_8250_DWLIB=3Dy
> > > > CONFIG_SERIAL_8250_DW=3Dy
> > > > # CONFIG_SERIAL_8250_RT288X is not set
> > > > CONFIG_SERIAL_8250_LPSS=3Dy
> > > > CONFIG_SERIAL_8250_MID=3Dy
> > > > =

> > > > #
> > > > # Non-8250 serial port support
> > > > #
> > > > # CONFIG_SERIAL_MAX3100 is not set
> > > > # CONFIG_SERIAL_MAX310X is not set
> > > > # CONFIG_SERIAL_UARTLITE is not set
> > > > CONFIG_SERIAL_CORE=3Dy
> > > > CONFIG_SERIAL_CORE_CONSOLE=3Dy
> > > > CONFIG_SERIAL_JSM=3Dm
> > > > # CONFIG_SERIAL_LANTIQ is not set
> > > > # CONFIG_SERIAL_SCCNXP is not set
> > > > # CONFIG_SERIAL_SC16IS7XX is not set
> > > > # CONFIG_SERIAL_BCM63XX is not set
> > > > # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> > > > # CONFIG_SERIAL_ALTERA_UART is not set
> > > > CONFIG_SERIAL_ARC=3Dm
> > > > CONFIG_SERIAL_ARC_NR_PORTS=3D1
> > > > # CONFIG_SERIAL_RP2 is not set
> > > > # CONFIG_SERIAL_FSL_LPUART is not set
> > > > # CONFIG_SERIAL_FSL_LINFLEXUART is not set
> > > > # CONFIG_SERIAL_SPRD is not set
> > > > # end of Serial drivers
> > > > =

> > > > CONFIG_SERIAL_MCTRL_GPIO=3Dy
> > > > CONFIG_SERIAL_NONSTANDARD=3Dy
> > > > # CONFIG_ROCKETPORT is not set
> > > > CONFIG_CYCLADES=3Dm
> > > > # CONFIG_CYZ_INTR is not set
> > > > # CONFIG_MOXA_INTELLIO is not set
> > > > # CONFIG_MOXA_SMARTIO is not set
> > > > CONFIG_SYNCLINK_GT=3Dm
> > > > # CONFIG_ISI is not set
> > > > CONFIG_N_HDLC=3Dm
> > > > CONFIG_N_GSM=3Dm
> > > > CONFIG_NOZOMI=3Dm
> > > > # CONFIG_NULL_TTY is not set
> > > > # CONFIG_TRACE_SINK is not set
> > > > CONFIG_HVC_DRIVER=3Dy
> > > > CONFIG_HVC_IRQ=3Dy
> > > > CONFIG_HVC_XEN=3Dy
> > > > CONFIG_HVC_XEN_FRONTEND=3Dy
> > > > # CONFIG_SERIAL_DEV_BUS is not set
> > > > CONFIG_PRINTER=3Dm
> > > > # CONFIG_LP_CONSOLE is not set
> > > > CONFIG_PPDEV=3Dm
> > > > CONFIG_VIRTIO_CONSOLE=3Dm
> > > > CONFIG_IPMI_HANDLER=3Dm
> > > > CONFIG_IPMI_DMI_DECODE=3Dy
> > > > CONFIG_IPMI_PLAT_DATA=3Dy
> > > > CONFIG_IPMI_PANIC_EVENT=3Dy
> > > > CONFIG_IPMI_PANIC_STRING=3Dy
> > > > CONFIG_IPMI_DEVICE_INTERFACE=3Dm
> > > > CONFIG_IPMI_SI=3Dm
> > > > CONFIG_IPMI_SSIF=3Dm
> > > > CONFIG_IPMI_WATCHDOG=3Dm
> > > > CONFIG_IPMI_POWEROFF=3Dm
> > > > CONFIG_HW_RANDOM=3Dy
> > > > CONFIG_HW_RANDOM_TIMERIOMEM=3Dm
> > > > CONFIG_HW_RANDOM_INTEL=3Dm
> > > > CONFIG_HW_RANDOM_AMD=3Dm
> > > > # CONFIG_HW_RANDOM_BA431 is not set
> > > > CONFIG_HW_RANDOM_VIA=3Dm
> > > > CONFIG_HW_RANDOM_VIRTIO=3Dy
> > > > # CONFIG_HW_RANDOM_XIPHERA is not set
> > > > # CONFIG_APPLICOM is not set
> > > > # CONFIG_MWAVE is not set
> > > > CONFIG_DEVMEM=3Dy
> > > > # CONFIG_DEVKMEM is not set
> > > > CONFIG_NVRAM=3Dy
> > > > CONFIG_RAW_DRIVER=3Dy
> > > > CONFIG_MAX_RAW_DEVS=3D8192
> > > > CONFIG_DEVPORT=3Dy
> > > > CONFIG_HPET=3Dy
> > > > CONFIG_HPET_MMAP=3Dy
> > > > # CONFIG_HPET_MMAP_DEFAULT is not set
> > > > CONFIG_HANGCHECK_TIMER=3Dm
> > > > CONFIG_UV_MMTIMER=3Dm
> > > > CONFIG_TCG_TPM=3Dy
> > > > CONFIG_HW_RANDOM_TPM=3Dy
> > > > CONFIG_TCG_TIS_CORE=3Dy
> > > > CONFIG_TCG_TIS=3Dy
> > > > # CONFIG_TCG_TIS_SPI is not set
> > > > # CONFIG_TCG_TIS_I2C_CR50 is not set
> > > > CONFIG_TCG_TIS_I2C_ATMEL=3Dm
> > > > CONFIG_TCG_TIS_I2C_INFINEON=3Dm
> > > > CONFIG_TCG_TIS_I2C_NUVOTON=3Dm
> > > > CONFIG_TCG_NSC=3Dm
> > > > CONFIG_TCG_ATMEL=3Dm
> > > > CONFIG_TCG_INFINEON=3Dm
> > > > # CONFIG_TCG_XEN is not set
> > > > CONFIG_TCG_CRB=3Dy
> > > > # CONFIG_TCG_VTPM_PROXY is not set
> > > > CONFIG_TCG_TIS_ST33ZP24=3Dm
> > > > CONFIG_TCG_TIS_ST33ZP24_I2C=3Dm
> > > > # CONFIG_TCG_TIS_ST33ZP24_SPI is not set
> > > > CONFIG_TELCLOCK=3Dm
> > > > # CONFIG_XILLYBUS is not set
> > > > # end of Character devices
> > > > =

> > > > # CONFIG_RANDOM_TRUST_CPU is not set
> > > > # CONFIG_RANDOM_TRUST_BOOTLOADER is not set
> > > > =

> > > > #
> > > > # I2C support
> > > > #
> > > > CONFIG_I2C=3Dy
> > > > CONFIG_ACPI_I2C_OPREGION=3Dy
> > > > CONFIG_I2C_BOARDINFO=3Dy
> > > > CONFIG_I2C_COMPAT=3Dy
> > > > CONFIG_I2C_CHARDEV=3Dm
> > > > CONFIG_I2C_MUX=3Dm
> > > > =

> > > > #
> > > > # Multiplexer I2C Chip support
> > > > #
> > > > # CONFIG_I2C_MUX_GPIO is not set
> > > > # CONFIG_I2C_MUX_LTC4306 is not set
> > > > # CONFIG_I2C_MUX_PCA9541 is not set
> > > > # CONFIG_I2C_MUX_PCA954x is not set
> > > > # CONFIG_I2C_MUX_REG is not set
> > > > CONFIG_I2C_MUX_MLXCPLD=3Dm
> > > > # end of Multiplexer I2C Chip support
> > > > =

> > > > CONFIG_I2C_HELPER_AUTO=3Dy
> > > > CONFIG_I2C_SMBUS=3Dy
> > > > CONFIG_I2C_ALGOBIT=3Dy
> > > > CONFIG_I2C_ALGOPCA=3Dm
> > > > =

> > > > #
> > > > # I2C Hardware Bus support
> > > > #
> > > > =

> > > > #
> > > > # PC SMBus host controller drivers
> > > > #
> > > > # CONFIG_I2C_ALI1535 is not set
> > > > # CONFIG_I2C_ALI1563 is not set
> > > > # CONFIG_I2C_ALI15X3 is not set
> > > > CONFIG_I2C_AMD756=3Dm
> > > > CONFIG_I2C_AMD756_S4882=3Dm
> > > > CONFIG_I2C_AMD8111=3Dm
> > > > # CONFIG_I2C_AMD_MP2 is not set
> > > > CONFIG_I2C_I801=3Dy
> > > > CONFIG_I2C_ISCH=3Dm
> > > > CONFIG_I2C_ISMT=3Dm
> > > > CONFIG_I2C_PIIX4=3Dm
> > > > CONFIG_I2C_NFORCE2=3Dm
> > > > CONFIG_I2C_NFORCE2_S4985=3Dm
> > > > # CONFIG_I2C_NVIDIA_GPU is not set
> > > > # CONFIG_I2C_SIS5595 is not set
> > > > # CONFIG_I2C_SIS630 is not set
> > > > CONFIG_I2C_SIS96X=3Dm
> > > > CONFIG_I2C_VIA=3Dm
> > > > CONFIG_I2C_VIAPRO=3Dm
> > > > =

> > > > #
> > > > # ACPI drivers
> > > > #
> > > > CONFIG_I2C_SCMI=3Dm
> > > > =

> > > > #
> > > > # I2C system bus drivers (mostly embedded / system-on-chip)
> > > > #
> > > > # CONFIG_I2C_CBUS_GPIO is not set
> > > > CONFIG_I2C_DESIGNWARE_CORE=3Dm
> > > > # CONFIG_I2C_DESIGNWARE_SLAVE is not set
> > > > CONFIG_I2C_DESIGNWARE_PLATFORM=3Dm
> > > > CONFIG_I2C_DESIGNWARE_BAYTRAIL=3Dy
> > > > # CONFIG_I2C_DESIGNWARE_PCI is not set
> > > > # CONFIG_I2C_EMEV2 is not set
> > > > # CONFIG_I2C_GPIO is not set
> > > > # CONFIG_I2C_OCORES is not set
> > > > CONFIG_I2C_PCA_PLATFORM=3Dm
> > > > CONFIG_I2C_SIMTEC=3Dm
> > > > # CONFIG_I2C_XILINX is not set
> > > > =

> > > > #
> > > > # External I2C/SMBus adapter drivers
> > > > #
> > > > # CONFIG_I2C_DIOLAN_U2C is not set
> > > > CONFIG_I2C_PARPORT=3Dm
> > > > # CONFIG_I2C_ROBOTFUZZ_OSIF is not set
> > > > # CONFIG_I2C_TAOS_EVM is not set
> > > > # CONFIG_I2C_TINY_USB is not set
> > > > =

> > > > #
> > > > # Other I2C/SMBus bus drivers
> > > > #
> > > > CONFIG_I2C_MLXCPLD=3Dm
> > > > # end of I2C Hardware Bus support
> > > > =

> > > > CONFIG_I2C_STUB=3Dm
> > > > # CONFIG_I2C_SLAVE is not set
> > > > # CONFIG_I2C_DEBUG_CORE is not set
> > > > # CONFIG_I2C_DEBUG_ALGO is not set
> > > > # CONFIG_I2C_DEBUG_BUS is not set
> > > > # end of I2C support
> > > > =

> > > > # CONFIG_I3C is not set
> > > > CONFIG_SPI=3Dy
> > > > # CONFIG_SPI_DEBUG is not set
> > > > CONFIG_SPI_MASTER=3Dy
> > > > # CONFIG_SPI_MEM is not set
> > > > =

> > > > #
> > > > # SPI Master Controller Drivers
> > > > #
> > > > # CONFIG_SPI_ALTERA is not set
> > > > # CONFIG_SPI_AXI_SPI_ENGINE is not set
> > > > # CONFIG_SPI_BITBANG is not set
> > > > # CONFIG_SPI_BUTTERFLY is not set
> > > > # CONFIG_SPI_CADENCE is not set
> > > > # CONFIG_SPI_DESIGNWARE is not set
> > > > # CONFIG_SPI_NXP_FLEXSPI is not set
> > > > # CONFIG_SPI_GPIO is not set
> > > > # CONFIG_SPI_LM70_LLP is not set
> > > > # CONFIG_SPI_LANTIQ_SSC is not set
> > > > # CONFIG_SPI_OC_TINY is not set
> > > > # CONFIG_SPI_PXA2XX is not set
> > > > # CONFIG_SPI_ROCKCHIP is not set
> > > > # CONFIG_SPI_SC18IS602 is not set
> > > > # CONFIG_SPI_SIFIVE is not set
> > > > # CONFIG_SPI_MXIC is not set
> > > > # CONFIG_SPI_XCOMM is not set
> > > > # CONFIG_SPI_XILINX is not set
> > > > # CONFIG_SPI_ZYNQMP_GQSPI is not set
> > > > # CONFIG_SPI_AMD is not set
> > > > =

> > > > #
> > > > # SPI Multiplexer support
> > > > #
> > > > # CONFIG_SPI_MUX is not set
> > > > =

> > > > #
> > > > # SPI Protocol Masters
> > > > #
> > > > # CONFIG_SPI_SPIDEV is not set
> > > > # CONFIG_SPI_LOOPBACK_TEST is not set
> > > > # CONFIG_SPI_TLE62X0 is not set
> > > > # CONFIG_SPI_SLAVE is not set
> > > > CONFIG_SPI_DYNAMIC=3Dy
> > > > # CONFIG_SPMI is not set
> > > > # CONFIG_HSI is not set
> > > > CONFIG_PPS=3Dy
> > > > # CONFIG_PPS_DEBUG is not set
> > > > =

> > > > #
> > > > # PPS clients support
> > > > #
> > > > # CONFIG_PPS_CLIENT_KTIMER is not set
> > > > CONFIG_PPS_CLIENT_LDISC=3Dm
> > > > CONFIG_PPS_CLIENT_PARPORT=3Dm
> > > > CONFIG_PPS_CLIENT_GPIO=3Dm
> > > > =

> > > > #
> > > > # PPS generators support
> > > > #
> > > > =

> > > > #
> > > > # PTP clock support
> > > > #
> > > > CONFIG_PTP_1588_CLOCK=3Dy
> > > > # CONFIG_DP83640_PHY is not set
> > > > # CONFIG_PTP_1588_CLOCK_INES is not set
> > > > CONFIG_PTP_1588_CLOCK_KVM=3Dm
> > > > # CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
> > > > # CONFIG_PTP_1588_CLOCK_IDTCM is not set
> > > > # CONFIG_PTP_1588_CLOCK_VMW is not set
> > > > # CONFIG_PTP_1588_CLOCK_OCP is not set
> > > > # end of PTP clock support
> > > > =

> > > > CONFIG_PINCTRL=3Dy
> > > > CONFIG_PINMUX=3Dy
> > > > CONFIG_PINCONF=3Dy
> > > > CONFIG_GENERIC_PINCONF=3Dy
> > > > # CONFIG_DEBUG_PINCTRL is not set
> > > > CONFIG_PINCTRL_AMD=3Dm
> > > > # CONFIG_PINCTRL_MCP23S08 is not set
> > > > # CONFIG_PINCTRL_SX150X is not set
> > > > CONFIG_PINCTRL_BAYTRAIL=3Dy
> > > > # CONFIG_PINCTRL_CHERRYVIEW is not set
> > > > # CONFIG_PINCTRL_LYNXPOINT is not set
> > > > CONFIG_PINCTRL_INTEL=3Dy
> > > > # CONFIG_PINCTRL_ALDERLAKE is not set
> > > > CONFIG_PINCTRL_BROXTON=3Dm
> > > > CONFIG_PINCTRL_CANNONLAKE=3Dm
> > > > CONFIG_PINCTRL_CEDARFORK=3Dm
> > > > CONFIG_PINCTRL_DENVERTON=3Dm
> > > > # CONFIG_PINCTRL_ELKHARTLAKE is not set
> > > > # CONFIG_PINCTRL_EMMITSBURG is not set
> > > > CONFIG_PINCTRL_GEMINILAKE=3Dm
> > > > # CONFIG_PINCTRL_ICELAKE is not set
> > > > # CONFIG_PINCTRL_JASPERLAKE is not set
> > > > # CONFIG_PINCTRL_LAKEFIELD is not set
> > > > CONFIG_PINCTRL_LEWISBURG=3Dm
> > > > CONFIG_PINCTRL_SUNRISEPOINT=3Dm
> > > > # CONFIG_PINCTRL_TIGERLAKE is not set
> > > > =

> > > > #
> > > > # Renesas pinctrl drivers
> > > > #
> > > > # end of Renesas pinctrl drivers
> > > > =

> > > > CONFIG_GPIOLIB=3Dy
> > > > CONFIG_GPIOLIB_FASTPATH_LIMIT=3D512
> > > > CONFIG_GPIO_ACPI=3Dy
> > > > CONFIG_GPIOLIB_IRQCHIP=3Dy
> > > > # CONFIG_DEBUG_GPIO is not set
> > > > CONFIG_GPIO_CDEV=3Dy
> > > > CONFIG_GPIO_CDEV_V1=3Dy
> > > > CONFIG_GPIO_GENERIC=3Dm
> > > > =

> > > > #
> > > > # Memory mapped GPIO drivers
> > > > #
> > > > CONFIG_GPIO_AMDPT=3Dm
> > > > # CONFIG_GPIO_DWAPB is not set
> > > > # CONFIG_GPIO_EXAR is not set
> > > > # CONFIG_GPIO_GENERIC_PLATFORM is not set
> > > > CONFIG_GPIO_ICH=3Dm
> > > > # CONFIG_GPIO_MB86S7X is not set
> > > > # CONFIG_GPIO_VX855 is not set
> > > > # CONFIG_GPIO_AMD_FCH is not set
> > > > # end of Memory mapped GPIO drivers
> > > > =

> > > > #
> > > > # Port-mapped I/O GPIO drivers
> > > > #
> > > > # CONFIG_GPIO_F7188X is not set
> > > > # CONFIG_GPIO_IT87 is not set
> > > > # CONFIG_GPIO_SCH is not set
> > > > # CONFIG_GPIO_SCH311X is not set
> > > > # CONFIG_GPIO_WINBOND is not set
> > > > # CONFIG_GPIO_WS16C48 is not set
> > > > # end of Port-mapped I/O GPIO drivers
> > > > =

> > > > #
> > > > # I2C GPIO expanders
> > > > #
> > > > # CONFIG_GPIO_ADP5588 is not set
> > > > # CONFIG_GPIO_MAX7300 is not set
> > > > # CONFIG_GPIO_MAX732X is not set
> > > > # CONFIG_GPIO_PCA953X is not set
> > > > # CONFIG_GPIO_PCA9570 is not set
> > > > # CONFIG_GPIO_PCF857X is not set
> > > > # CONFIG_GPIO_TPIC2810 is not set
> > > > # end of I2C GPIO expanders
> > > > =

> > > > #
> > > > # MFD GPIO expanders
> > > > #
> > > > # end of MFD GPIO expanders
> > > > =

> > > > #
> > > > # PCI GPIO expanders
> > > > #
> > > > # CONFIG_GPIO_AMD8111 is not set
> > > > # CONFIG_GPIO_BT8XX is not set
> > > > # CONFIG_GPIO_ML_IOH is not set
> > > > # CONFIG_GPIO_PCI_IDIO_16 is not set
> > > > # CONFIG_GPIO_PCIE_IDIO_24 is not set
> > > > # CONFIG_GPIO_RDC321X is not set
> > > > # end of PCI GPIO expanders
> > > > =

> > > > #
> > > > # SPI GPIO expanders
> > > > #
> > > > # CONFIG_GPIO_MAX3191X is not set
> > > > # CONFIG_GPIO_MAX7301 is not set
> > > > # CONFIG_GPIO_MC33880 is not set
> > > > # CONFIG_GPIO_PISOSR is not set
> > > > # CONFIG_GPIO_XRA1403 is not set
> > > > # end of SPI GPIO expanders
> > > > =

> > > > #
> > > > # USB GPIO expanders
> > > > #
> > > > # end of USB GPIO expanders
> > > > =

> > > > #
> > > > # Virtual GPIO drivers
> > > > #
> > > > # CONFIG_GPIO_AGGREGATOR is not set
> > > > # CONFIG_GPIO_MOCKUP is not set
> > > > # end of Virtual GPIO drivers
> > > > =

> > > > # CONFIG_W1 is not set
> > > > CONFIG_POWER_RESET=3Dy
> > > > # CONFIG_POWER_RESET_RESTART is not set
> > > > CONFIG_POWER_SUPPLY=3Dy
> > > > # CONFIG_POWER_SUPPLY_DEBUG is not set
> > > > CONFIG_POWER_SUPPLY_HWMON=3Dy
> > > > # CONFIG_PDA_POWER is not set
> > > > # CONFIG_TEST_POWER is not set
> > > > # CONFIG_CHARGER_ADP5061 is not set
> > > > # CONFIG_BATTERY_CW2015 is not set
> > > > # CONFIG_BATTERY_DS2780 is not set
> > > > # CONFIG_BATTERY_DS2781 is not set
> > > > # CONFIG_BATTERY_DS2782 is not set
> > > > # CONFIG_BATTERY_SBS is not set
> > > > # CONFIG_CHARGER_SBS is not set
> > > > # CONFIG_MANAGER_SBS is not set
> > > > # CONFIG_BATTERY_BQ27XXX is not set
> > > > # CONFIG_BATTERY_MAX17040 is not set
> > > > # CONFIG_BATTERY_MAX17042 is not set
> > > > # CONFIG_CHARGER_MAX8903 is not set
> > > > # CONFIG_CHARGER_LP8727 is not set
> > > > # CONFIG_CHARGER_GPIO is not set
> > > > # CONFIG_CHARGER_LT3651 is not set
> > > > # CONFIG_CHARGER_LTC4162L is not set
> > > > # CONFIG_CHARGER_BQ2415X is not set
> > > > # CONFIG_CHARGER_BQ24257 is not set
> > > > # CONFIG_CHARGER_BQ24735 is not set
> > > > # CONFIG_CHARGER_BQ2515X is not set
> > > > # CONFIG_CHARGER_BQ25890 is not set
> > > > # CONFIG_CHARGER_BQ25980 is not set
> > > > # CONFIG_CHARGER_BQ256XX is not set
> > > > CONFIG_CHARGER_SMB347=3Dm
> > > > # CONFIG_BATTERY_GAUGE_LTC2941 is not set
> > > > # CONFIG_CHARGER_RT9455 is not set
> > > > # CONFIG_CHARGER_BD99954 is not set
> > > > CONFIG_HWMON=3Dy
> > > > CONFIG_HWMON_VID=3Dm
> > > > # CONFIG_HWMON_DEBUG_CHIP is not set
> > > > =

> > > > #
> > > > # Native drivers
> > > > #
> > > > CONFIG_SENSORS_ABITUGURU=3Dm
> > > > CONFIG_SENSORS_ABITUGURU3=3Dm
> > > > # CONFIG_SENSORS_AD7314 is not set
> > > > CONFIG_SENSORS_AD7414=3Dm
> > > > CONFIG_SENSORS_AD7418=3Dm
> > > > CONFIG_SENSORS_ADM1021=3Dm
> > > > CONFIG_SENSORS_ADM1025=3Dm
> > > > CONFIG_SENSORS_ADM1026=3Dm
> > > > CONFIG_SENSORS_ADM1029=3Dm
> > > > CONFIG_SENSORS_ADM1031=3Dm
> > > > # CONFIG_SENSORS_ADM1177 is not set
> > > > CONFIG_SENSORS_ADM9240=3Dm
> > > > CONFIG_SENSORS_ADT7X10=3Dm
> > > > # CONFIG_SENSORS_ADT7310 is not set
> > > > CONFIG_SENSORS_ADT7410=3Dm
> > > > CONFIG_SENSORS_ADT7411=3Dm
> > > > CONFIG_SENSORS_ADT7462=3Dm
> > > > CONFIG_SENSORS_ADT7470=3Dm
> > > > CONFIG_SENSORS_ADT7475=3Dm
> > > > # CONFIG_SENSORS_AHT10 is not set
> > > > # CONFIG_SENSORS_AS370 is not set
> > > > CONFIG_SENSORS_ASC7621=3Dm
> > > > # CONFIG_SENSORS_AXI_FAN_CONTROL is not set
> > > > CONFIG_SENSORS_K8TEMP=3Dm
> > > > CONFIG_SENSORS_K10TEMP=3Dm
> > > > CONFIG_SENSORS_FAM15H_POWER=3Dm
> > > > # CONFIG_SENSORS_AMD_ENERGY is not set
> > > > CONFIG_SENSORS_APPLESMC=3Dm
> > > > CONFIG_SENSORS_ASB100=3Dm
> > > > # CONFIG_SENSORS_ASPEED is not set
> > > > CONFIG_SENSORS_ATXP1=3Dm
> > > > # CONFIG_SENSORS_CORSAIR_CPRO is not set
> > > > # CONFIG_SENSORS_CORSAIR_PSU is not set
> > > > # CONFIG_SENSORS_DRIVETEMP is not set
> > > > CONFIG_SENSORS_DS620=3Dm
> > > > CONFIG_SENSORS_DS1621=3Dm
> > > > CONFIG_SENSORS_DELL_SMM=3Dm
> > > > CONFIG_SENSORS_I5K_AMB=3Dm
> > > > CONFIG_SENSORS_F71805F=3Dm
> > > > CONFIG_SENSORS_F71882FG=3Dm
> > > > CONFIG_SENSORS_F75375S=3Dm
> > > > CONFIG_SENSORS_FSCHMD=3Dm
> > > > # CONFIG_SENSORS_FTSTEUTATES is not set
> > > > CONFIG_SENSORS_GL518SM=3Dm
> > > > CONFIG_SENSORS_GL520SM=3Dm
> > > > CONFIG_SENSORS_G760A=3Dm
> > > > # CONFIG_SENSORS_G762 is not set
> > > > # CONFIG_SENSORS_HIH6130 is not set
> > > > CONFIG_SENSORS_IBMAEM=3Dm
> > > > CONFIG_SENSORS_IBMPEX=3Dm
> > > > CONFIG_SENSORS_I5500=3Dm
> > > > CONFIG_SENSORS_CORETEMP=3Dm
> > > > CONFIG_SENSORS_IT87=3Dm
> > > > CONFIG_SENSORS_JC42=3Dm
> > > > # CONFIG_SENSORS_POWR1220 is not set
> > > > CONFIG_SENSORS_LINEAGE=3Dm
> > > > # CONFIG_SENSORS_LTC2945 is not set
> > > > # CONFIG_SENSORS_LTC2947_I2C is not set
> > > > # CONFIG_SENSORS_LTC2947_SPI is not set
> > > > # CONFIG_SENSORS_LTC2990 is not set
> > > > # CONFIG_SENSORS_LTC2992 is not set
> > > > CONFIG_SENSORS_LTC4151=3Dm
> > > > CONFIG_SENSORS_LTC4215=3Dm
> > > > # CONFIG_SENSORS_LTC4222 is not set
> > > > CONFIG_SENSORS_LTC4245=3Dm
> > > > # CONFIG_SENSORS_LTC4260 is not set
> > > > CONFIG_SENSORS_LTC4261=3Dm
> > > > # CONFIG_SENSORS_MAX1111 is not set
> > > > # CONFIG_SENSORS_MAX127 is not set
> > > > CONFIG_SENSORS_MAX16065=3Dm
> > > > CONFIG_SENSORS_MAX1619=3Dm
> > > > CONFIG_SENSORS_MAX1668=3Dm
> > > > CONFIG_SENSORS_MAX197=3Dm
> > > > # CONFIG_SENSORS_MAX31722 is not set
> > > > # CONFIG_SENSORS_MAX31730 is not set
> > > > # CONFIG_SENSORS_MAX6621 is not set
> > > > CONFIG_SENSORS_MAX6639=3Dm
> > > > CONFIG_SENSORS_MAX6642=3Dm
> > > > CONFIG_SENSORS_MAX6650=3Dm
> > > > CONFIG_SENSORS_MAX6697=3Dm
> > > > # CONFIG_SENSORS_MAX31790 is not set
> > > > CONFIG_SENSORS_MCP3021=3Dm
> > > > # CONFIG_SENSORS_MLXREG_FAN is not set
> > > > # CONFIG_SENSORS_TC654 is not set
> > > > # CONFIG_SENSORS_TPS23861 is not set
> > > > # CONFIG_SENSORS_MR75203 is not set
> > > > # CONFIG_SENSORS_ADCXX is not set
> > > > CONFIG_SENSORS_LM63=3Dm
> > > > # CONFIG_SENSORS_LM70 is not set
> > > > CONFIG_SENSORS_LM73=3Dm
> > > > CONFIG_SENSORS_LM75=3Dm
> > > > CONFIG_SENSORS_LM77=3Dm
> > > > CONFIG_SENSORS_LM78=3Dm
> > > > CONFIG_SENSORS_LM80=3Dm
> > > > CONFIG_SENSORS_LM83=3Dm
> > > > CONFIG_SENSORS_LM85=3Dm
> > > > CONFIG_SENSORS_LM87=3Dm
> > > > CONFIG_SENSORS_LM90=3Dm
> > > > CONFIG_SENSORS_LM92=3Dm
> > > > CONFIG_SENSORS_LM93=3Dm
> > > > CONFIG_SENSORS_LM95234=3Dm
> > > > CONFIG_SENSORS_LM95241=3Dm
> > > > CONFIG_SENSORS_LM95245=3Dm
> > > > CONFIG_SENSORS_PC87360=3Dm
> > > > CONFIG_SENSORS_PC87427=3Dm
> > > > CONFIG_SENSORS_NTC_THERMISTOR=3Dm
> > > > # CONFIG_SENSORS_NCT6683 is not set
> > > > CONFIG_SENSORS_NCT6775=3Dm
> > > > # CONFIG_SENSORS_NCT7802 is not set
> > > > # CONFIG_SENSORS_NCT7904 is not set
> > > > # CONFIG_SENSORS_NPCM7XX is not set
> > > > CONFIG_SENSORS_PCF8591=3Dm
> > > > CONFIG_PMBUS=3Dm
> > > > CONFIG_SENSORS_PMBUS=3Dm
> > > > # CONFIG_SENSORS_ADM1266 is not set
> > > > CONFIG_SENSORS_ADM1275=3Dm
> > > > # CONFIG_SENSORS_BEL_PFE is not set
> > > > # CONFIG_SENSORS_IBM_CFFPS is not set
> > > > # CONFIG_SENSORS_INSPUR_IPSPS is not set
> > > > # CONFIG_SENSORS_IR35221 is not set
> > > > # CONFIG_SENSORS_IR38064 is not set
> > > > # CONFIG_SENSORS_IRPS5401 is not set
> > > > # CONFIG_SENSORS_ISL68137 is not set
> > > > CONFIG_SENSORS_LM25066=3Dm
> > > > CONFIG_SENSORS_LTC2978=3Dm
> > > > # CONFIG_SENSORS_LTC3815 is not set
> > > > CONFIG_SENSORS_MAX16064=3Dm
> > > > # CONFIG_SENSORS_MAX16601 is not set
> > > > # CONFIG_SENSORS_MAX20730 is not set
> > > > # CONFIG_SENSORS_MAX20751 is not set
> > > > # CONFIG_SENSORS_MAX31785 is not set
> > > > CONFIG_SENSORS_MAX34440=3Dm
> > > > CONFIG_SENSORS_MAX8688=3Dm
> > > > # CONFIG_SENSORS_MP2975 is not set
> > > > # CONFIG_SENSORS_PM6764TR is not set
> > > > # CONFIG_SENSORS_PXE1610 is not set
> > > > # CONFIG_SENSORS_Q54SJ108A2 is not set
> > > > # CONFIG_SENSORS_TPS40422 is not set
> > > > # CONFIG_SENSORS_TPS53679 is not set
> > > > CONFIG_SENSORS_UCD9000=3Dm
> > > > CONFIG_SENSORS_UCD9200=3Dm
> > > > # CONFIG_SENSORS_XDPE122 is not set
> > > > CONFIG_SENSORS_ZL6100=3Dm
> > > > # CONFIG_SENSORS_SBTSI is not set
> > > > CONFIG_SENSORS_SHT15=3Dm
> > > > CONFIG_SENSORS_SHT21=3Dm
> > > > # CONFIG_SENSORS_SHT3x is not set
> > > > # CONFIG_SENSORS_SHTC1 is not set
> > > > CONFIG_SENSORS_SIS5595=3Dm
> > > > CONFIG_SENSORS_DME1737=3Dm
> > > > CONFIG_SENSORS_EMC1403=3Dm
> > > > # CONFIG_SENSORS_EMC2103 is not set
> > > > CONFIG_SENSORS_EMC6W201=3Dm
> > > > CONFIG_SENSORS_SMSC47M1=3Dm
> > > > CONFIG_SENSORS_SMSC47M192=3Dm
> > > > CONFIG_SENSORS_SMSC47B397=3Dm
> > > > CONFIG_SENSORS_SCH56XX_COMMON=3Dm
> > > > CONFIG_SENSORS_SCH5627=3Dm
> > > > CONFIG_SENSORS_SCH5636=3Dm
> > > > # CONFIG_SENSORS_STTS751 is not set
> > > > # CONFIG_SENSORS_SMM665 is not set
> > > > # CONFIG_SENSORS_ADC128D818 is not set
> > > > CONFIG_SENSORS_ADS7828=3Dm
> > > > # CONFIG_SENSORS_ADS7871 is not set
> > > > CONFIG_SENSORS_AMC6821=3Dm
> > > > CONFIG_SENSORS_INA209=3Dm
> > > > CONFIG_SENSORS_INA2XX=3Dm
> > > > # CONFIG_SENSORS_INA3221 is not set
> > > > # CONFIG_SENSORS_TC74 is not set
> > > > CONFIG_SENSORS_THMC50=3Dm
> > > > CONFIG_SENSORS_TMP102=3Dm
> > > > # CONFIG_SENSORS_TMP103 is not set
> > > > # CONFIG_SENSORS_TMP108 is not set
> > > > CONFIG_SENSORS_TMP401=3Dm
> > > > CONFIG_SENSORS_TMP421=3Dm
> > > > # CONFIG_SENSORS_TMP513 is not set
> > > > CONFIG_SENSORS_VIA_CPUTEMP=3Dm
> > > > CONFIG_SENSORS_VIA686A=3Dm
> > > > CONFIG_SENSORS_VT1211=3Dm
> > > > CONFIG_SENSORS_VT8231=3Dm
> > > > # CONFIG_SENSORS_W83773G is not set
> > > > CONFIG_SENSORS_W83781D=3Dm
> > > > CONFIG_SENSORS_W83791D=3Dm
> > > > CONFIG_SENSORS_W83792D=3Dm
> > > > CONFIG_SENSORS_W83793=3Dm
> > > > CONFIG_SENSORS_W83795=3Dm
> > > > # CONFIG_SENSORS_W83795_FANCTRL is not set
> > > > CONFIG_SENSORS_W83L785TS=3Dm
> > > > CONFIG_SENSORS_W83L786NG=3Dm
> > > > CONFIG_SENSORS_W83627HF=3Dm
> > > > CONFIG_SENSORS_W83627EHF=3Dm
> > > > # CONFIG_SENSORS_XGENE is not set
> > > > =

> > > > #
> > > > # ACPI drivers
> > > > #
> > > > CONFIG_SENSORS_ACPI_POWER=3Dm
> > > > CONFIG_SENSORS_ATK0110=3Dm
> > > > CONFIG_THERMAL=3Dy
> > > > # CONFIG_THERMAL_NETLINK is not set
> > > > # CONFIG_THERMAL_STATISTICS is not set
> > > > CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> > > > CONFIG_THERMAL_HWMON=3Dy
> > > > CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
> > > > CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
> > > > # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> > > > # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> > > > CONFIG_THERMAL_GOV_FAIR_SHARE=3Dy
> > > > CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> > > > CONFIG_THERMAL_GOV_BANG_BANG=3Dy
> > > > CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> > > > # CONFIG_THERMAL_EMULATION is not set
> > > > =

> > > > #
> > > > # Intel thermal drivers
> > > > #
> > > > CONFIG_INTEL_POWERCLAMP=3Dm
> > > > CONFIG_X86_THERMAL_VECTOR=3Dy
> > > > CONFIG_X86_PKG_TEMP_THERMAL=3Dm
> > > > CONFIG_INTEL_SOC_DTS_IOSF_CORE=3Dm
> > > > # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> > > > =

> > > > #
> > > > # ACPI INT340X thermal drivers
> > > > #
> > > > CONFIG_INT340X_THERMAL=3Dm
> > > > CONFIG_ACPI_THERMAL_REL=3Dm
> > > > # CONFIG_INT3406_THERMAL is not set
> > > > CONFIG_PROC_THERMAL_MMIO_RAPL=3Dm
> > > > # end of ACPI INT340X thermal drivers
> > > > =

> > > > CONFIG_INTEL_PCH_THERMAL=3Dm
> > > > # end of Intel thermal drivers
> > > > =

> > > > CONFIG_WATCHDOG=3Dy
> > > > CONFIG_WATCHDOG_CORE=3Dy
> > > > # CONFIG_WATCHDOG_NOWAYOUT is not set
> > > > CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=3Dy
> > > > CONFIG_WATCHDOG_OPEN_TIMEOUT=3D0
> > > > CONFIG_WATCHDOG_SYSFS=3Dy
> > > > =

> > > > #
> > > > # Watchdog Pretimeout Governors
> > > > #
> > > > # CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
> > > > =

> > > > #
> > > > # Watchdog Device Drivers
> > > > #
> > > > CONFIG_SOFT_WATCHDOG=3Dm
> > > > CONFIG_WDAT_WDT=3Dm
> > > > # CONFIG_XILINX_WATCHDOG is not set
> > > > # CONFIG_ZIIRAVE_WATCHDOG is not set
> > > > # CONFIG_MLX_WDT is not set
> > > > # CONFIG_CADENCE_WATCHDOG is not set
> > > > # CONFIG_DW_WATCHDOG is not set
> > > > # CONFIG_MAX63XX_WATCHDOG is not set
> > > > # CONFIG_ACQUIRE_WDT is not set
> > > > # CONFIG_ADVANTECH_WDT is not set
> > > > CONFIG_ALIM1535_WDT=3Dm
> > > > CONFIG_ALIM7101_WDT=3Dm
> > > > # CONFIG_EBC_C384_WDT is not set
> > > > CONFIG_F71808E_WDT=3Dm
> > > > CONFIG_SP5100_TCO=3Dm
> > > > CONFIG_SBC_FITPC2_WATCHDOG=3Dm
> > > > # CONFIG_EUROTECH_WDT is not set
> > > > CONFIG_IB700_WDT=3Dm
> > > > CONFIG_IBMASR=3Dm
> > > > # CONFIG_WAFER_WDT is not set
> > > > CONFIG_I6300ESB_WDT=3Dy
> > > > CONFIG_IE6XX_WDT=3Dm
> > > > CONFIG_ITCO_WDT=3Dy
> > > > CONFIG_ITCO_VENDOR_SUPPORT=3Dy
> > > > CONFIG_IT8712F_WDT=3Dm
> > > > CONFIG_IT87_WDT=3Dm
> > > > CONFIG_HP_WATCHDOG=3Dm
> > > > CONFIG_HPWDT_NMI_DECODING=3Dy
> > > > # CONFIG_SC1200_WDT is not set
> > > > # CONFIG_PC87413_WDT is not set
> > > > CONFIG_NV_TCO=3Dm
> > > > # CONFIG_60XX_WDT is not set
> > > > # CONFIG_CPU5_WDT is not set
> > > > CONFIG_SMSC_SCH311X_WDT=3Dm
> > > > # CONFIG_SMSC37B787_WDT is not set
> > > > # CONFIG_TQMX86_WDT is not set
> > > > CONFIG_VIA_WDT=3Dm
> > > > CONFIG_W83627HF_WDT=3Dm
> > > > CONFIG_W83877F_WDT=3Dm
> > > > CONFIG_W83977F_WDT=3Dm
> > > > CONFIG_MACHZ_WDT=3Dm
> > > > # CONFIG_SBC_EPX_C3_WATCHDOG is not set
> > > > CONFIG_INTEL_MEI_WDT=3Dm
> > > > # CONFIG_NI903X_WDT is not set
> > > > # CONFIG_NIC7018_WDT is not set
> > > > # CONFIG_MEN_A21_WDT is not set
> > > > CONFIG_XEN_WDT=3Dm
> > > > =

> > > > #
> > > > # PCI-based Watchdog Cards
> > > > #
> > > > CONFIG_PCIPCWATCHDOG=3Dm
> > > > CONFIG_WDTPCI=3Dm
> > > > =

> > > > #
> > > > # USB-based Watchdog Cards
> > > > #
> > > > # CONFIG_USBPCWATCHDOG is not set
> > > > CONFIG_SSB_POSSIBLE=3Dy
> > > > # CONFIG_SSB is not set
> > > > CONFIG_BCMA_POSSIBLE=3Dy
> > > > CONFIG_BCMA=3Dm
> > > > CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> > > > CONFIG_BCMA_HOST_PCI=3Dy
> > > > # CONFIG_BCMA_HOST_SOC is not set
> > > > CONFIG_BCMA_DRIVER_PCI=3Dy
> > > > CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
> > > > CONFIG_BCMA_DRIVER_GPIO=3Dy
> > > > # CONFIG_BCMA_DEBUG is not set
> > > > =

> > > > #
> > > > # Multifunction device drivers
> > > > #
> > > > CONFIG_MFD_CORE=3Dy
> > > > # CONFIG_MFD_AS3711 is not set
> > > > # CONFIG_PMIC_ADP5520 is not set
> > > > # CONFIG_MFD_AAT2870_CORE is not set
> > > > # CONFIG_MFD_BCM590XX is not set
> > > > # CONFIG_MFD_BD9571MWV is not set
> > > > # CONFIG_MFD_AXP20X_I2C is not set
> > > > # CONFIG_MFD_MADERA is not set
> > > > # CONFIG_PMIC_DA903X is not set
> > > > # CONFIG_MFD_DA9052_SPI is not set
> > > > # CONFIG_MFD_DA9052_I2C is not set
> > > > # CONFIG_MFD_DA9055 is not set
> > > > # CONFIG_MFD_DA9062 is not set
> > > > # CONFIG_MFD_DA9063 is not set
> > > > # CONFIG_MFD_DA9150 is not set
> > > > # CONFIG_MFD_DLN2 is not set
> > > > # CONFIG_MFD_MC13XXX_SPI is not set
> > > > # CONFIG_MFD_MC13XXX_I2C is not set
> > > > # CONFIG_MFD_MP2629 is not set
> > > > # CONFIG_HTC_PASIC3 is not set
> > > > # CONFIG_HTC_I2CPLD is not set
> > > > # CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
> > > > CONFIG_LPC_ICH=3Dy
> > > > CONFIG_LPC_SCH=3Dm
> > > > # CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
> > > > CONFIG_MFD_INTEL_LPSS=3Dy
> > > > CONFIG_MFD_INTEL_LPSS_ACPI=3Dy
> > > > CONFIG_MFD_INTEL_LPSS_PCI=3Dy
> > > > # CONFIG_MFD_INTEL_PMC_BXT is not set
> > > > # CONFIG_MFD_INTEL_PMT is not set
> > > > # CONFIG_MFD_IQS62X is not set
> > > > # CONFIG_MFD_JANZ_CMODIO is not set
> > > > # CONFIG_MFD_KEMPLD is not set
> > > > # CONFIG_MFD_88PM800 is not set
> > > > # CONFIG_MFD_88PM805 is not set
> > > > # CONFIG_MFD_88PM860X is not set
> > > > # CONFIG_MFD_MAX14577 is not set
> > > > # CONFIG_MFD_MAX77693 is not set
> > > > # CONFIG_MFD_MAX77843 is not set
> > > > # CONFIG_MFD_MAX8907 is not set
> > > > # CONFIG_MFD_MAX8925 is not set
> > > > # CONFIG_MFD_MAX8997 is not set
> > > > # CONFIG_MFD_MAX8998 is not set
> > > > # CONFIG_MFD_MT6360 is not set
> > > > # CONFIG_MFD_MT6397 is not set
> > > > # CONFIG_MFD_MENF21BMC is not set
> > > > # CONFIG_EZX_PCAP is not set
> > > > # CONFIG_MFD_VIPERBOARD is not set
> > > > # CONFIG_MFD_RETU is not set
> > > > # CONFIG_MFD_PCF50633 is not set
> > > > # CONFIG_MFD_RDC321X is not set
> > > > # CONFIG_MFD_RT5033 is not set
> > > > # CONFIG_MFD_RC5T583 is not set
> > > > # CONFIG_MFD_SEC_CORE is not set
> > > > # CONFIG_MFD_SI476X_CORE is not set
> > > > CONFIG_MFD_SM501=3Dm
> > > > CONFIG_MFD_SM501_GPIO=3Dy
> > > > # CONFIG_MFD_SKY81452 is not set
> > > > # CONFIG_ABX500_CORE is not set
> > > > # CONFIG_MFD_SYSCON is not set
> > > > # CONFIG_MFD_TI_AM335X_TSCADC is not set
> > > > # CONFIG_MFD_LP3943 is not set
> > > > # CONFIG_MFD_LP8788 is not set
> > > > # CONFIG_MFD_TI_LMU is not set
> > > > # CONFIG_MFD_PALMAS is not set
> > > > # CONFIG_TPS6105X is not set
> > > > # CONFIG_TPS65010 is not set
> > > > # CONFIG_TPS6507X is not set
> > > > # CONFIG_MFD_TPS65086 is not set
> > > > # CONFIG_MFD_TPS65090 is not set
> > > > # CONFIG_MFD_TI_LP873X is not set
> > > > # CONFIG_MFD_TPS6586X is not set
> > > > # CONFIG_MFD_TPS65910 is not set
> > > > # CONFIG_MFD_TPS65912_I2C is not set
> > > > # CONFIG_MFD_TPS65912_SPI is not set
> > > > # CONFIG_MFD_TPS80031 is not set
> > > > # CONFIG_TWL4030_CORE is not set
> > > > # CONFIG_TWL6040_CORE is not set
> > > > # CONFIG_MFD_WL1273_CORE is not set
> > > > # CONFIG_MFD_LM3533 is not set
> > > > # CONFIG_MFD_TQMX86 is not set
> > > > CONFIG_MFD_VX855=3Dm
> > > > # CONFIG_MFD_ARIZONA_I2C is not set
> > > > # CONFIG_MFD_ARIZONA_SPI is not set
> > > > # CONFIG_MFD_WM8400 is not set
> > > > # CONFIG_MFD_WM831X_I2C is not set
> > > > # CONFIG_MFD_WM831X_SPI is not set
> > > > # CONFIG_MFD_WM8350_I2C is not set
> > > > # CONFIG_MFD_WM8994 is not set
> > > > # CONFIG_MFD_INTEL_M10_BMC is not set
> > > > # end of Multifunction device drivers
> > > > =

> > > > # CONFIG_REGULATOR is not set
> > > > CONFIG_RC_CORE=3Dm
> > > > CONFIG_RC_MAP=3Dm
> > > > CONFIG_LIRC=3Dy
> > > > CONFIG_RC_DECODERS=3Dy
> > > > CONFIG_IR_NEC_DECODER=3Dm
> > > > CONFIG_IR_RC5_DECODER=3Dm
> > > > CONFIG_IR_RC6_DECODER=3Dm
> > > > CONFIG_IR_JVC_DECODER=3Dm
> > > > CONFIG_IR_SONY_DECODER=3Dm
> > > > CONFIG_IR_SANYO_DECODER=3Dm
> > > > # CONFIG_IR_SHARP_DECODER is not set
> > > > CONFIG_IR_MCE_KBD_DECODER=3Dm
> > > > # CONFIG_IR_XMP_DECODER is not set
> > > > CONFIG_IR_IMON_DECODER=3Dm
> > > > # CONFIG_IR_RCMM_DECODER is not set
> > > > CONFIG_RC_DEVICES=3Dy
> > > > # CONFIG_RC_ATI_REMOTE is not set
> > > > CONFIG_IR_ENE=3Dm
> > > > # CONFIG_IR_IMON is not set
> > > > # CONFIG_IR_IMON_RAW is not set
> > > > # CONFIG_IR_MCEUSB is not set
> > > > CONFIG_IR_ITE_CIR=3Dm
> > > > CONFIG_IR_FINTEK=3Dm
> > > > CONFIG_IR_NUVOTON=3Dm
> > > > # CONFIG_IR_REDRAT3 is not set
> > > > # CONFIG_IR_STREAMZAP is not set
> > > > CONFIG_IR_WINBOND_CIR=3Dm
> > > > # CONFIG_IR_IGORPLUGUSB is not set
> > > > # CONFIG_IR_IGUANA is not set
> > > > # CONFIG_IR_TTUSBIR is not set
> > > > # CONFIG_RC_LOOPBACK is not set
> > > > CONFIG_IR_SERIAL=3Dm
> > > > CONFIG_IR_SERIAL_TRANSMITTER=3Dy
> > > > CONFIG_IR_SIR=3Dm
> > > > # CONFIG_RC_XBOX_DVD is not set
> > > > # CONFIG_IR_TOY is not set
> > > > CONFIG_MEDIA_CEC_SUPPORT=3Dy
> > > > # CONFIG_CEC_CH7322 is not set
> > > > # CONFIG_CEC_SECO is not set
> > > > # CONFIG_USB_PULSE8_CEC is not set
> > > > # CONFIG_USB_RAINSHADOW_CEC is not set
> > > > CONFIG_MEDIA_SUPPORT=3Dm
> > > > # CONFIG_MEDIA_SUPPORT_FILTER is not set
> > > > # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
> > > > =

> > > > #
> > > > # Media device types
> > > > #
> > > > CONFIG_MEDIA_CAMERA_SUPPORT=3Dy
> > > > CONFIG_MEDIA_ANALOG_TV_SUPPORT=3Dy
> > > > CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
> > > > CONFIG_MEDIA_RADIO_SUPPORT=3Dy
> > > > CONFIG_MEDIA_SDR_SUPPORT=3Dy
> > > > CONFIG_MEDIA_PLATFORM_SUPPORT=3Dy
> > > > CONFIG_MEDIA_TEST_SUPPORT=3Dy
> > > > # end of Media device types
> > > > =

> > > > #
> > > > # Media core support
> > > > #
> > > > CONFIG_VIDEO_DEV=3Dm
> > > > CONFIG_MEDIA_CONTROLLER=3Dy
> > > > CONFIG_DVB_CORE=3Dm
> > > > # end of Media core support
> > > > =

> > > > #
> > > > # Video4Linux options
> > > > #
> > > > CONFIG_VIDEO_V4L2=3Dm
> > > > CONFIG_VIDEO_V4L2_I2C=3Dy
> > > > CONFIG_VIDEO_V4L2_SUBDEV_API=3Dy
> > > > # CONFIG_VIDEO_ADV_DEBUG is not set
> > > > # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> > > > # end of Video4Linux options
> > > > =

> > > > #
> > > > # Media controller options
> > > > #
> > > > # CONFIG_MEDIA_CONTROLLER_DVB is not set
> > > > # end of Media controller options
> > > > =

> > > > #
> > > > # Digital TV options
> > > > #
> > > > # CONFIG_DVB_MMAP is not set
> > > > CONFIG_DVB_NET=3Dy
> > > > CONFIG_DVB_MAX_ADAPTERS=3D16
> > > > CONFIG_DVB_DYNAMIC_MINORS=3Dy
> > > > # CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
> > > > # CONFIG_DVB_ULE_DEBUG is not set
> > > > # end of Digital TV options
> > > > =

> > > > #
> > > > # Media drivers
> > > > #
> > > > # CONFIG_MEDIA_USB_SUPPORT is not set
> > > > # CONFIG_MEDIA_PCI_SUPPORT is not set
> > > > CONFIG_RADIO_ADAPTERS=3Dy
> > > > # CONFIG_RADIO_SI470X is not set
> > > > # CONFIG_RADIO_SI4713 is not set
> > > > # CONFIG_USB_MR800 is not set
> > > > # CONFIG_USB_DSBR is not set
> > > > # CONFIG_RADIO_MAXIRADIO is not set
> > > > # CONFIG_RADIO_SHARK is not set
> > > > # CONFIG_RADIO_SHARK2 is not set
> > > > # CONFIG_USB_KEENE is not set
> > > > # CONFIG_USB_RAREMONO is not set
> > > > # CONFIG_USB_MA901 is not set
> > > > # CONFIG_RADIO_TEA5764 is not set
> > > > # CONFIG_RADIO_SAA7706H is not set
> > > > # CONFIG_RADIO_TEF6862 is not set
> > > > # CONFIG_RADIO_WL1273 is not set
> > > > CONFIG_VIDEOBUF2_CORE=3Dm
> > > > CONFIG_VIDEOBUF2_V4L2=3Dm
> > > > CONFIG_VIDEOBUF2_MEMOPS=3Dm
> > > > CONFIG_VIDEOBUF2_VMALLOC=3Dm
> > > > # CONFIG_V4L_PLATFORM_DRIVERS is not set
> > > > # CONFIG_V4L_MEM2MEM_DRIVERS is not set
> > > > # CONFIG_DVB_PLATFORM_DRIVERS is not set
> > > > # CONFIG_SDR_PLATFORM_DRIVERS is not set
> > > > =

> > > > #
> > > > # MMC/SDIO DVB adapters
> > > > #
> > > > # CONFIG_SMS_SDIO_DRV is not set
> > > > # CONFIG_V4L_TEST_DRIVERS is not set
> > > > # CONFIG_DVB_TEST_DRIVERS is not set
> > > > =

> > > > #
> > > > # FireWire (IEEE 1394) Adapters
> > > > #
> > > > # CONFIG_DVB_FIREDTV is not set
> > > > # end of Media drivers
> > > > =

> > > > #
> > > > # Media ancillary drivers
> > > > #
> > > > CONFIG_MEDIA_ATTACH=3Dy
> > > > CONFIG_VIDEO_IR_I2C=3Dm
> > > > =

> > > > #
> > > > # Audio decoders, processors and mixers
> > > > #
> > > > # CONFIG_VIDEO_TVAUDIO is not set
> > > > # CONFIG_VIDEO_TDA7432 is not set
> > > > # CONFIG_VIDEO_TDA9840 is not set
> > > > # CONFIG_VIDEO_TEA6415C is not set
> > > > # CONFIG_VIDEO_TEA6420 is not set
> > > > # CONFIG_VIDEO_MSP3400 is not set
> > > > # CONFIG_VIDEO_CS3308 is not set
> > > > # CONFIG_VIDEO_CS5345 is not set
> > > > # CONFIG_VIDEO_CS53L32A is not set
> > > > # CONFIG_VIDEO_TLV320AIC23B is not set
> > > > # CONFIG_VIDEO_UDA1342 is not set
> > > > # CONFIG_VIDEO_WM8775 is not set
> > > > # CONFIG_VIDEO_WM8739 is not set
> > > > # CONFIG_VIDEO_VP27SMPX is not set
> > > > # CONFIG_VIDEO_SONY_BTF_MPX is not set
> > > > # end of Audio decoders, processors and mixers
> > > > =

> > > > #
> > > > # RDS decoders
> > > > #
> > > > # CONFIG_VIDEO_SAA6588 is not set
> > > > # end of RDS decoders
> > > > =

> > > > #
> > > > # Video decoders
> > > > #
> > > > # CONFIG_VIDEO_ADV7180 is not set
> > > > # CONFIG_VIDEO_ADV7183 is not set
> > > > # CONFIG_VIDEO_ADV7604 is not set
> > > > # CONFIG_VIDEO_ADV7842 is not set
> > > > # CONFIG_VIDEO_BT819 is not set
> > > > # CONFIG_VIDEO_BT856 is not set
> > > > # CONFIG_VIDEO_BT866 is not set
> > > > # CONFIG_VIDEO_KS0127 is not set
> > > > # CONFIG_VIDEO_ML86V7667 is not set
> > > > # CONFIG_VIDEO_SAA7110 is not set
> > > > # CONFIG_VIDEO_SAA711X is not set
> > > > # CONFIG_VIDEO_TC358743 is not set
> > > > # CONFIG_VIDEO_TVP514X is not set
> > > > # CONFIG_VIDEO_TVP5150 is not set
> > > > # CONFIG_VIDEO_TVP7002 is not set
> > > > # CONFIG_VIDEO_TW2804 is not set
> > > > # CONFIG_VIDEO_TW9903 is not set
> > > > # CONFIG_VIDEO_TW9906 is not set
> > > > # CONFIG_VIDEO_TW9910 is not set
> > > > # CONFIG_VIDEO_VPX3220 is not set
> > > > =

> > > > #
> > > > # Video and audio decoders
> > > > #
> > > > # CONFIG_VIDEO_SAA717X is not set
> > > > # CONFIG_VIDEO_CX25840 is not set
> > > > # end of Video decoders
> > > > =

> > > > #
> > > > # Video encoders
> > > > #
> > > > # CONFIG_VIDEO_SAA7127 is not set
> > > > # CONFIG_VIDEO_SAA7185 is not set
> > > > # CONFIG_VIDEO_ADV7170 is not set
> > > > # CONFIG_VIDEO_ADV7175 is not set
> > > > # CONFIG_VIDEO_ADV7343 is not set
> > > > # CONFIG_VIDEO_ADV7393 is not set
> > > > # CONFIG_VIDEO_ADV7511 is not set
> > > > # CONFIG_VIDEO_AD9389B is not set
> > > > # CONFIG_VIDEO_AK881X is not set
> > > > # CONFIG_VIDEO_THS8200 is not set
> > > > # end of Video encoders
> > > > =

> > > > #
> > > > # Video improvement chips
> > > > #
> > > > # CONFIG_VIDEO_UPD64031A is not set
> > > > # CONFIG_VIDEO_UPD64083 is not set
> > > > # end of Video improvement chips
> > > > =

> > > > #
> > > > # Audio/Video compression chips
> > > > #
> > > > # CONFIG_VIDEO_SAA6752HS is not set
> > > > # end of Audio/Video compression chips
> > > > =

> > > > #
> > > > # SDR tuner chips
> > > > #
> > > > # CONFIG_SDR_MAX2175 is not set
> > > > # end of SDR tuner chips
> > > > =

> > > > #
> > > > # Miscellaneous helper chips
> > > > #
> > > > # CONFIG_VIDEO_THS7303 is not set
> > > > # CONFIG_VIDEO_M52790 is not set
> > > > # CONFIG_VIDEO_I2C is not set
> > > > # CONFIG_VIDEO_ST_MIPID02 is not set
> > > > # end of Miscellaneous helper chips
> > > > =

> > > > #
> > > > # Camera sensor devices
> > > > #
> > > > # CONFIG_VIDEO_HI556 is not set
> > > > # CONFIG_VIDEO_IMX214 is not set
> > > > # CONFIG_VIDEO_IMX219 is not set
> > > > # CONFIG_VIDEO_IMX258 is not set
> > > > # CONFIG_VIDEO_IMX274 is not set
> > > > # CONFIG_VIDEO_IMX290 is not set
> > > > # CONFIG_VIDEO_IMX319 is not set
> > > > # CONFIG_VIDEO_IMX355 is not set
> > > > # CONFIG_VIDEO_OV02A10 is not set
> > > > # CONFIG_VIDEO_OV2640 is not set
> > > > # CONFIG_VIDEO_OV2659 is not set
> > > > # CONFIG_VIDEO_OV2680 is not set
> > > > # CONFIG_VIDEO_OV2685 is not set
> > > > # CONFIG_VIDEO_OV2740 is not set
> > > > # CONFIG_VIDEO_OV5647 is not set
> > > > # CONFIG_VIDEO_OV5648 is not set
> > > > # CONFIG_VIDEO_OV6650 is not set
> > > > # CONFIG_VIDEO_OV5670 is not set
> > > > # CONFIG_VIDEO_OV5675 is not set
> > > > # CONFIG_VIDEO_OV5695 is not set
> > > > # CONFIG_VIDEO_OV7251 is not set
> > > > # CONFIG_VIDEO_OV772X is not set
> > > > # CONFIG_VIDEO_OV7640 is not set
> > > > # CONFIG_VIDEO_OV7670 is not set
> > > > # CONFIG_VIDEO_OV7740 is not set
> > > > # CONFIG_VIDEO_OV8856 is not set
> > > > # CONFIG_VIDEO_OV8865 is not set
> > > > # CONFIG_VIDEO_OV9640 is not set
> > > > # CONFIG_VIDEO_OV9650 is not set
> > > > # CONFIG_VIDEO_OV9734 is not set
> > > > # CONFIG_VIDEO_OV13858 is not set
> > > > # CONFIG_VIDEO_VS6624 is not set
> > > > # CONFIG_VIDEO_MT9M001 is not set
> > > > # CONFIG_VIDEO_MT9M032 is not set
> > > > # CONFIG_VIDEO_MT9M111 is not set
> > > > # CONFIG_VIDEO_MT9P031 is not set
> > > > # CONFIG_VIDEO_MT9T001 is not set
> > > > # CONFIG_VIDEO_MT9T112 is not set
> > > > # CONFIG_VIDEO_MT9V011 is not set
> > > > # CONFIG_VIDEO_MT9V032 is not set
> > > > # CONFIG_VIDEO_MT9V111 is not set
> > > > # CONFIG_VIDEO_SR030PC30 is not set
> > > > # CONFIG_VIDEO_NOON010PC30 is not set
> > > > # CONFIG_VIDEO_M5MOLS is not set
> > > > # CONFIG_VIDEO_RDACM20 is not set
> > > > # CONFIG_VIDEO_RDACM21 is not set
> > > > # CONFIG_VIDEO_RJ54N1 is not set
> > > > # CONFIG_VIDEO_S5K6AA is not set
> > > > # CONFIG_VIDEO_S5K6A3 is not set
> > > > # CONFIG_VIDEO_S5K4ECGX is not set
> > > > # CONFIG_VIDEO_S5K5BAF is not set
> > > > # CONFIG_VIDEO_CCS is not set
> > > > # CONFIG_VIDEO_ET8EK8 is not set
> > > > # CONFIG_VIDEO_S5C73M3 is not set
> > > > # end of Camera sensor devices
> > > > =

> > > > #
> > > > # Lens drivers
> > > > #
> > > > # CONFIG_VIDEO_AD5820 is not set
> > > > # CONFIG_VIDEO_AK7375 is not set
> > > > # CONFIG_VIDEO_DW9714 is not set
> > > > # CONFIG_VIDEO_DW9768 is not set
> > > > # CONFIG_VIDEO_DW9807_VCM is not set
> > > > # end of Lens drivers
> > > > =

> > > > #
> > > > # Flash devices
> > > > #
> > > > # CONFIG_VIDEO_ADP1653 is not set
> > > > # CONFIG_VIDEO_LM3560 is not set
> > > > # CONFIG_VIDEO_LM3646 is not set
> > > > # end of Flash devices
> > > > =

> > > > #
> > > > # SPI helper chips
> > > > #
> > > > # CONFIG_VIDEO_GS1662 is not set
> > > > # end of SPI helper chips
> > > > =

> > > > #
> > > > # Media SPI Adapters
> > > > #
> > > > CONFIG_CXD2880_SPI_DRV=3Dm
> > > > # end of Media SPI Adapters
> > > > =

> > > > CONFIG_MEDIA_TUNER=3Dm
> > > > =

> > > > #
> > > > # Customize TV tuners
> > > > #
> > > > CONFIG_MEDIA_TUNER_SIMPLE=3Dm
> > > > CONFIG_MEDIA_TUNER_TDA18250=3Dm
> > > > CONFIG_MEDIA_TUNER_TDA8290=3Dm
> > > > CONFIG_MEDIA_TUNER_TDA827X=3Dm
> > > > CONFIG_MEDIA_TUNER_TDA18271=3Dm
> > > > CONFIG_MEDIA_TUNER_TDA9887=3Dm
> > > > CONFIG_MEDIA_TUNER_TEA5761=3Dm
> > > > CONFIG_MEDIA_TUNER_TEA5767=3Dm
> > > > CONFIG_MEDIA_TUNER_MSI001=3Dm
> > > > CONFIG_MEDIA_TUNER_MT20XX=3Dm
> > > > CONFIG_MEDIA_TUNER_MT2060=3Dm
> > > > CONFIG_MEDIA_TUNER_MT2063=3Dm
> > > > CONFIG_MEDIA_TUNER_MT2266=3Dm
> > > > CONFIG_MEDIA_TUNER_MT2131=3Dm
> > > > CONFIG_MEDIA_TUNER_QT1010=3Dm
> > > > CONFIG_MEDIA_TUNER_XC2028=3Dm
> > > > CONFIG_MEDIA_TUNER_XC5000=3Dm
> > > > CONFIG_MEDIA_TUNER_XC4000=3Dm
> > > > CONFIG_MEDIA_TUNER_MXL5005S=3Dm
> > > > CONFIG_MEDIA_TUNER_MXL5007T=3Dm
> > > > CONFIG_MEDIA_TUNER_MC44S803=3Dm
> > > > CONFIG_MEDIA_TUNER_MAX2165=3Dm
> > > > CONFIG_MEDIA_TUNER_TDA18218=3Dm
> > > > CONFIG_MEDIA_TUNER_FC0011=3Dm
> > > > CONFIG_MEDIA_TUNER_FC0012=3Dm
> > > > CONFIG_MEDIA_TUNER_FC0013=3Dm
> > > > CONFIG_MEDIA_TUNER_TDA18212=3Dm
> > > > CONFIG_MEDIA_TUNER_E4000=3Dm
> > > > CONFIG_MEDIA_TUNER_FC2580=3Dm
> > > > CONFIG_MEDIA_TUNER_M88RS6000T=3Dm
> > > > CONFIG_MEDIA_TUNER_TUA9001=3Dm
> > > > CONFIG_MEDIA_TUNER_SI2157=3Dm
> > > > CONFIG_MEDIA_TUNER_IT913X=3Dm
> > > > CONFIG_MEDIA_TUNER_R820T=3Dm
> > > > CONFIG_MEDIA_TUNER_MXL301RF=3Dm
> > > > CONFIG_MEDIA_TUNER_QM1D1C0042=3Dm
> > > > CONFIG_MEDIA_TUNER_QM1D1B0004=3Dm
> > > > # end of Customize TV tuners
> > > > =

> > > > #
> > > > # Customise DVB Frontends
> > > > #
> > > > =

> > > > #
> > > > # Multistandard (satellite) frontends
> > > > #
> > > > CONFIG_DVB_STB0899=3Dm
> > > > CONFIG_DVB_STB6100=3Dm
> > > > CONFIG_DVB_STV090x=3Dm
> > > > CONFIG_DVB_STV0910=3Dm
> > > > CONFIG_DVB_STV6110x=3Dm
> > > > CONFIG_DVB_STV6111=3Dm
> > > > CONFIG_DVB_MXL5XX=3Dm
> > > > CONFIG_DVB_M88DS3103=3Dm
> > > > =

> > > > #
> > > > # Multistandard (cable + terrestrial) frontends
> > > > #
> > > > CONFIG_DVB_DRXK=3Dm
> > > > CONFIG_DVB_TDA18271C2DD=3Dm
> > > > CONFIG_DVB_SI2165=3Dm
> > > > CONFIG_DVB_MN88472=3Dm
> > > > CONFIG_DVB_MN88473=3Dm
> > > > =

> > > > #
> > > > # DVB-S (satellite) frontends
> > > > #
> > > > CONFIG_DVB_CX24110=3Dm
> > > > CONFIG_DVB_CX24123=3Dm
> > > > CONFIG_DVB_MT312=3Dm
> > > > CONFIG_DVB_ZL10036=3Dm
> > > > CONFIG_DVB_ZL10039=3Dm
> > > > CONFIG_DVB_S5H1420=3Dm
> > > > CONFIG_DVB_STV0288=3Dm
> > > > CONFIG_DVB_STB6000=3Dm
> > > > CONFIG_DVB_STV0299=3Dm
> > > > CONFIG_DVB_STV6110=3Dm
> > > > CONFIG_DVB_STV0900=3Dm
> > > > CONFIG_DVB_TDA8083=3Dm
> > > > CONFIG_DVB_TDA10086=3Dm
> > > > CONFIG_DVB_TDA8261=3Dm
> > > > CONFIG_DVB_VES1X93=3Dm
> > > > CONFIG_DVB_TUNER_ITD1000=3Dm
> > > > CONFIG_DVB_TUNER_CX24113=3Dm
> > > > CONFIG_DVB_TDA826X=3Dm
> > > > CONFIG_DVB_TUA6100=3Dm
> > > > CONFIG_DVB_CX24116=3Dm
> > > > CONFIG_DVB_CX24117=3Dm
> > > > CONFIG_DVB_CX24120=3Dm
> > > > CONFIG_DVB_SI21XX=3Dm
> > > > CONFIG_DVB_TS2020=3Dm
> > > > CONFIG_DVB_DS3000=3Dm
> > > > CONFIG_DVB_MB86A16=3Dm
> > > > CONFIG_DVB_TDA10071=3Dm
> > > > =

> > > > #
> > > > # DVB-T (terrestrial) frontends
> > > > #
> > > > CONFIG_DVB_SP8870=3Dm
> > > > CONFIG_DVB_SP887X=3Dm
> > > > CONFIG_DVB_CX22700=3Dm
> > > > CONFIG_DVB_CX22702=3Dm
> > > > CONFIG_DVB_S5H1432=3Dm
> > > > CONFIG_DVB_DRXD=3Dm
> > > > CONFIG_DVB_L64781=3Dm
> > > > CONFIG_DVB_TDA1004X=3Dm
> > > > CONFIG_DVB_NXT6000=3Dm
> > > > CONFIG_DVB_MT352=3Dm
> > > > CONFIG_DVB_ZL10353=3Dm
> > > > CONFIG_DVB_DIB3000MB=3Dm
> > > > CONFIG_DVB_DIB3000MC=3Dm
> > > > CONFIG_DVB_DIB7000M=3Dm
> > > > CONFIG_DVB_DIB7000P=3Dm
> > > > CONFIG_DVB_DIB9000=3Dm
> > > > CONFIG_DVB_TDA10048=3Dm
> > > > CONFIG_DVB_AF9013=3Dm
> > > > CONFIG_DVB_EC100=3Dm
> > > > CONFIG_DVB_STV0367=3Dm
> > > > CONFIG_DVB_CXD2820R=3Dm
> > > > CONFIG_DVB_CXD2841ER=3Dm
> > > > CONFIG_DVB_RTL2830=3Dm
> > > > CONFIG_DVB_RTL2832=3Dm
> > > > CONFIG_DVB_RTL2832_SDR=3Dm
> > > > CONFIG_DVB_SI2168=3Dm
> > > > CONFIG_DVB_ZD1301_DEMOD=3Dm
> > > > CONFIG_DVB_CXD2880=3Dm
> > > > =

> > > > #
> > > > # DVB-C (cable) frontends
> > > > #
> > > > CONFIG_DVB_VES1820=3Dm
> > > > CONFIG_DVB_TDA10021=3Dm
> > > > CONFIG_DVB_TDA10023=3Dm
> > > > CONFIG_DVB_STV0297=3Dm
> > > > =

> > > > #
> > > > # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
> > > > #
> > > > CONFIG_DVB_NXT200X=3Dm
> > > > CONFIG_DVB_OR51211=3Dm
> > > > CONFIG_DVB_OR51132=3Dm
> > > > CONFIG_DVB_BCM3510=3Dm
> > > > CONFIG_DVB_LGDT330X=3Dm
> > > > CONFIG_DVB_LGDT3305=3Dm
> > > > CONFIG_DVB_LGDT3306A=3Dm
> > > > CONFIG_DVB_LG2160=3Dm
> > > > CONFIG_DVB_S5H1409=3Dm
> > > > CONFIG_DVB_AU8522=3Dm
> > > > CONFIG_DVB_AU8522_DTV=3Dm
> > > > CONFIG_DVB_AU8522_V4L=3Dm
> > > > CONFIG_DVB_S5H1411=3Dm
> > > > CONFIG_DVB_MXL692=3Dm
> > > > =

> > > > #
> > > > # ISDB-T (terrestrial) frontends
> > > > #
> > > > CONFIG_DVB_S921=3Dm
> > > > CONFIG_DVB_DIB8000=3Dm
> > > > CONFIG_DVB_MB86A20S=3Dm
> > > > =

> > > > #
> > > > # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
> > > > #
> > > > CONFIG_DVB_TC90522=3Dm
> > > > CONFIG_DVB_MN88443X=3Dm
> > > > =

> > > > #
> > > > # Digital terrestrial only tuners/PLL
> > > > #
> > > > CONFIG_DVB_PLL=3Dm
> > > > CONFIG_DVB_TUNER_DIB0070=3Dm
> > > > CONFIG_DVB_TUNER_DIB0090=3Dm
> > > > =

> > > > #
> > > > # SEC control devices for DVB-S
> > > > #
> > > > CONFIG_DVB_DRX39XYJ=3Dm
> > > > CONFIG_DVB_LNBH25=3Dm
> > > > CONFIG_DVB_LNBH29=3Dm
> > > > CONFIG_DVB_LNBP21=3Dm
> > > > CONFIG_DVB_LNBP22=3Dm
> > > > CONFIG_DVB_ISL6405=3Dm
> > > > CONFIG_DVB_ISL6421=3Dm
> > > > CONFIG_DVB_ISL6423=3Dm
> > > > CONFIG_DVB_A8293=3Dm
> > > > CONFIG_DVB_LGS8GL5=3Dm
> > > > CONFIG_DVB_LGS8GXX=3Dm
> > > > CONFIG_DVB_ATBM8830=3Dm
> > > > CONFIG_DVB_TDA665x=3Dm
> > > > CONFIG_DVB_IX2505V=3Dm
> > > > CONFIG_DVB_M88RS2000=3Dm
> > > > CONFIG_DVB_AF9033=3Dm
> > > > CONFIG_DVB_HORUS3A=3Dm
> > > > CONFIG_DVB_ASCOT2E=3Dm
> > > > CONFIG_DVB_HELENE=3Dm
> > > > =

> > > > #
> > > > # Common Interface (EN50221) controller drivers
> > > > #
> > > > CONFIG_DVB_CXD2099=3Dm
> > > > CONFIG_DVB_SP2=3Dm
> > > > # end of Customise DVB Frontends
> > > > =

> > > > #
> > > > # Tools to develop new frontends
> > > > #
> > > > # CONFIG_DVB_DUMMY_FE is not set
> > > > # end of Media ancillary drivers
> > > > =

> > > > #
> > > > # Graphics support
> > > > #
> > > > # CONFIG_AGP is not set
> > > > CONFIG_INTEL_GTT=3Dm
> > > > CONFIG_VGA_ARB=3Dy
> > > > CONFIG_VGA_ARB_MAX_GPUS=3D64
> > > > CONFIG_VGA_SWITCHEROO=3Dy
> > > > CONFIG_DRM=3Dm
> > > > CONFIG_DRM_MIPI_DSI=3Dy
> > > > CONFIG_DRM_DP_AUX_CHARDEV=3Dy
> > > > # CONFIG_DRM_DEBUG_SELFTEST is not set
> > > > CONFIG_DRM_KMS_HELPER=3Dm
> > > > CONFIG_DRM_KMS_FB_HELPER=3Dy
> > > > CONFIG_DRM_FBDEV_EMULATION=3Dy
> > > > CONFIG_DRM_FBDEV_OVERALLOC=3D100
> > > > CONFIG_DRM_LOAD_EDID_FIRMWARE=3Dy
> > > > # CONFIG_DRM_DP_CEC is not set
> > > > CONFIG_DRM_TTM=3Dm
> > > > CONFIG_DRM_VRAM_HELPER=3Dm
> > > > CONFIG_DRM_TTM_HELPER=3Dm
> > > > CONFIG_DRM_GEM_SHMEM_HELPER=3Dy
> > > > =

> > > > #
> > > > # I2C encoder or helper chips
> > > > #
> > > > CONFIG_DRM_I2C_CH7006=3Dm
> > > > CONFIG_DRM_I2C_SIL164=3Dm
> > > > # CONFIG_DRM_I2C_NXP_TDA998X is not set
> > > > # CONFIG_DRM_I2C_NXP_TDA9950 is not set
> > > > # end of I2C encoder or helper chips
> > > > =

> > > > #
> > > > # ARM devices
> > > > #
> > > > # end of ARM devices
> > > > =

> > > > # CONFIG_DRM_RADEON is not set
> > > > # CONFIG_DRM_AMDGPU is not set
> > > > # CONFIG_DRM_NOUVEAU is not set
> > > > CONFIG_DRM_I915=3Dm
> > > > CONFIG_DRM_I915_FORCE_PROBE=3D""
> > > > CONFIG_DRM_I915_CAPTURE_ERROR=3Dy
> > > > CONFIG_DRM_I915_COMPRESS_ERROR=3Dy
> > > > CONFIG_DRM_I915_USERPTR=3Dy
> > > > CONFIG_DRM_I915_GVT=3Dy
> > > > CONFIG_DRM_I915_GVT_KVMGT=3Dm
> > > > CONFIG_DRM_I915_FENCE_TIMEOUT=3D10000
> > > > CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=3D250
> > > > CONFIG_DRM_I915_HEARTBEAT_INTERVAL=3D2500
> > > > CONFIG_DRM_I915_PREEMPT_TIMEOUT=3D640
> > > > CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=3D8000
> > > > CONFIG_DRM_I915_STOP_TIMEOUT=3D100
> > > > CONFIG_DRM_I915_TIMESLICE_DURATION=3D1
> > > > # CONFIG_DRM_VGEM is not set
> > > > # CONFIG_DRM_VKMS is not set
> > > > # CONFIG_DRM_VMWGFX is not set
> > > > CONFIG_DRM_GMA500=3Dm
> > > > CONFIG_DRM_GMA600=3Dy
> > > > # CONFIG_DRM_UDL is not set
> > > > CONFIG_DRM_AST=3Dm
> > > > CONFIG_DRM_MGAG200=3Dm
> > > > CONFIG_DRM_QXL=3Dm
> > > > CONFIG_DRM_BOCHS=3Dm
> > > > CONFIG_DRM_VIRTIO_GPU=3Dm
> > > > CONFIG_DRM_PANEL=3Dy
> > > > =

> > > > #
> > > > # Display Panels
> > > > #
> > > > # CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
> > > > # end of Display Panels
> > > > =

> > > > CONFIG_DRM_BRIDGE=3Dy
> > > > CONFIG_DRM_PANEL_BRIDGE=3Dy
> > > > =

> > > > #
> > > > # Display Interface Bridges
> > > > #
> > > > # CONFIG_DRM_ANALOGIX_ANX78XX is not set
> > > > # end of Display Interface Bridges
> > > > =

> > > > # CONFIG_DRM_ETNAVIV is not set
> > > > CONFIG_DRM_CIRRUS_QEMU=3Dm
> > > > # CONFIG_DRM_GM12U320 is not set
> > > > # CONFIG_TINYDRM_HX8357D is not set
> > > > # CONFIG_TINYDRM_ILI9225 is not set
> > > > # CONFIG_TINYDRM_ILI9341 is not set
> > > > # CONFIG_TINYDRM_ILI9486 is not set
> > > > # CONFIG_TINYDRM_MI0283QT is not set
> > > > # CONFIG_TINYDRM_REPAPER is not set
> > > > # CONFIG_TINYDRM_ST7586 is not set
> > > > # CONFIG_TINYDRM_ST7735R is not set
> > > > # CONFIG_DRM_XEN is not set
> > > > # CONFIG_DRM_VBOXVIDEO is not set
> > > > # CONFIG_DRM_LEGACY is not set
> > > > CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
> > > > =

> > > > #
> > > > # Frame buffer Devices
> > > > #
> > > > CONFIG_FB_CMDLINE=3Dy
> > > > CONFIG_FB_NOTIFY=3Dy
> > > > CONFIG_FB=3Dy
> > > > # CONFIG_FIRMWARE_EDID is not set
> > > > CONFIG_FB_BOOT_VESA_SUPPORT=3Dy
> > > > CONFIG_FB_CFB_FILLRECT=3Dy
> > > > CONFIG_FB_CFB_COPYAREA=3Dy
> > > > CONFIG_FB_CFB_IMAGEBLIT=3Dy
> > > > CONFIG_FB_SYS_FILLRECT=3Dm
> > > > CONFIG_FB_SYS_COPYAREA=3Dm
> > > > CONFIG_FB_SYS_IMAGEBLIT=3Dm
> > > > # CONFIG_FB_FOREIGN_ENDIAN is not set
> > > > CONFIG_FB_SYS_FOPS=3Dm
> > > > CONFIG_FB_DEFERRED_IO=3Dy
> > > > # CONFIG_FB_MODE_HELPERS is not set
> > > > CONFIG_FB_TILEBLITTING=3Dy
> > > > =

> > > > #
> > > > # Frame buffer hardware drivers
> > > > #
> > > > # CONFIG_FB_CIRRUS is not set
> > > > # CONFIG_FB_PM2 is not set
> > > > # CONFIG_FB_CYBER2000 is not set
> > > > # CONFIG_FB_ARC is not set
> > > > # CONFIG_FB_ASILIANT is not set
> > > > # CONFIG_FB_IMSTT is not set
> > > > # CONFIG_FB_VGA16 is not set
> > > > # CONFIG_FB_UVESA is not set
> > > > CONFIG_FB_VESA=3Dy
> > > > CONFIG_FB_EFI=3Dy
> > > > # CONFIG_FB_N411 is not set
> > > > # CONFIG_FB_HGA is not set
> > > > # CONFIG_FB_OPENCORES is not set
> > > > # CONFIG_FB_S1D13XXX is not set
> > > > # CONFIG_FB_NVIDIA is not set
> > > > # CONFIG_FB_RIVA is not set
> > > > # CONFIG_FB_I740 is not set
> > > > # CONFIG_FB_LE80578 is not set
> > > > # CONFIG_FB_MATROX is not set
> > > > # CONFIG_FB_RADEON is not set
> > > > # CONFIG_FB_ATY128 is not set
> > > > # CONFIG_FB_ATY is not set
> > > > # CONFIG_FB_S3 is not set
> > > > # CONFIG_FB_SAVAGE is not set
> > > > # CONFIG_FB_SIS is not set
> > > > # CONFIG_FB_VIA is not set
> > > > # CONFIG_FB_NEOMAGIC is not set
> > > > # CONFIG_FB_KYRO is not set
> > > > # CONFIG_FB_3DFX is not set
> > > > # CONFIG_FB_VOODOO1 is not set
> > > > # CONFIG_FB_VT8623 is not set
> > > > # CONFIG_FB_TRIDENT is not set
> > > > # CONFIG_FB_ARK is not set
> > > > # CONFIG_FB_PM3 is not set
> > > > # CONFIG_FB_CARMINE is not set
> > > > # CONFIG_FB_SM501 is not set
> > > > # CONFIG_FB_SMSCUFX is not set
> > > > # CONFIG_FB_UDL is not set
> > > > # CONFIG_FB_IBM_GXT4500 is not set
> > > > # CONFIG_FB_VIRTUAL is not set
> > > > # CONFIG_XEN_FBDEV_FRONTEND is not set
> > > > # CONFIG_FB_METRONOME is not set
> > > > # CONFIG_FB_MB862XX is not set
> > > > CONFIG_FB_HYPERV=3Dm
> > > > # CONFIG_FB_SIMPLE is not set
> > > > # CONFIG_FB_SM712 is not set
> > > > # end of Frame buffer Devices
> > > > =

> > > > #
> > > > # Backlight & LCD device support
> > > > #
> > > > CONFIG_LCD_CLASS_DEVICE=3Dm
> > > > # CONFIG_LCD_L4F00242T03 is not set
> > > > # CONFIG_LCD_LMS283GF05 is not set
> > > > # CONFIG_LCD_LTV350QV is not set
> > > > # CONFIG_LCD_ILI922X is not set
> > > > # CONFIG_LCD_ILI9320 is not set
> > > > # CONFIG_LCD_TDO24M is not set
> > > > # CONFIG_LCD_VGG2432A4 is not set
> > > > CONFIG_LCD_PLATFORM=3Dm
> > > > # CONFIG_LCD_AMS369FG06 is not set
> > > > # CONFIG_LCD_LMS501KF03 is not set
> > > > # CONFIG_LCD_HX8357 is not set
> > > > # CONFIG_LCD_OTM3225A is not set
> > > > CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> > > > # CONFIG_BACKLIGHT_KTD253 is not set
> > > > # CONFIG_BACKLIGHT_PWM is not set
> > > > CONFIG_BACKLIGHT_APPLE=3Dm
> > > > # CONFIG_BACKLIGHT_QCOM_WLED is not set
> > > > # CONFIG_BACKLIGHT_SAHARA is not set
> > > > # CONFIG_BACKLIGHT_ADP8860 is not set
> > > > # CONFIG_BACKLIGHT_ADP8870 is not set
> > > > # CONFIG_BACKLIGHT_LM3630A is not set
> > > > # CONFIG_BACKLIGHT_LM3639 is not set
> > > > CONFIG_BACKLIGHT_LP855X=3Dm
> > > > # CONFIG_BACKLIGHT_GPIO is not set
> > > > # CONFIG_BACKLIGHT_LV5207LP is not set
> > > > # CONFIG_BACKLIGHT_BD6107 is not set
> > > > # CONFIG_BACKLIGHT_ARCXCNN is not set
> > > > # end of Backlight & LCD device support
> > > > =

> > > > CONFIG_HDMI=3Dy
> > > > =

> > > > #
> > > > # Console display driver support
> > > > #
> > > > CONFIG_VGA_CONSOLE=3Dy
> > > > CONFIG_DUMMY_CONSOLE=3Dy
> > > > CONFIG_DUMMY_CONSOLE_COLUMNS=3D80
> > > > CONFIG_DUMMY_CONSOLE_ROWS=3D25
> > > > CONFIG_FRAMEBUFFER_CONSOLE=3Dy
> > > > CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
> > > > CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
> > > > # CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
> > > > # end of Console display driver support
> > > > =

> > > > CONFIG_LOGO=3Dy
> > > > # CONFIG_LOGO_LINUX_MONO is not set
> > > > # CONFIG_LOGO_LINUX_VGA16 is not set
> > > > CONFIG_LOGO_LINUX_CLUT224=3Dy
> > > > # end of Graphics support
> > > > =

> > > > # CONFIG_SOUND is not set
> > > > =

> > > > #
> > > > # HID support
> > > > #
> > > > CONFIG_HID=3Dy
> > > > CONFIG_HID_BATTERY_STRENGTH=3Dy
> > > > CONFIG_HIDRAW=3Dy
> > > > CONFIG_UHID=3Dm
> > > > CONFIG_HID_GENERIC=3Dy
> > > > =

> > > > #
> > > > # Special HID drivers
> > > > #
> > > > CONFIG_HID_A4TECH=3Dm
> > > > # CONFIG_HID_ACCUTOUCH is not set
> > > > CONFIG_HID_ACRUX=3Dm
> > > > # CONFIG_HID_ACRUX_FF is not set
> > > > CONFIG_HID_APPLE=3Dm
> > > > # CONFIG_HID_APPLEIR is not set
> > > > CONFIG_HID_ASUS=3Dm
> > > > CONFIG_HID_AUREAL=3Dm
> > > > CONFIG_HID_BELKIN=3Dm
> > > > # CONFIG_HID_BETOP_FF is not set
> > > > # CONFIG_HID_BIGBEN_FF is not set
> > > > CONFIG_HID_CHERRY=3Dm
> > > > CONFIG_HID_CHICONY=3Dm
> > > > # CONFIG_HID_CORSAIR is not set
> > > > # CONFIG_HID_COUGAR is not set
> > > > # CONFIG_HID_MACALLY is not set
> > > > CONFIG_HID_CMEDIA=3Dm
> > > > # CONFIG_HID_CP2112 is not set
> > > > # CONFIG_HID_CREATIVE_SB0540 is not set
> > > > CONFIG_HID_CYPRESS=3Dm
> > > > CONFIG_HID_DRAGONRISE=3Dm
> > > > # CONFIG_DRAGONRISE_FF is not set
> > > > # CONFIG_HID_EMS_FF is not set
> > > > # CONFIG_HID_ELAN is not set
> > > > CONFIG_HID_ELECOM=3Dm
> > > > # CONFIG_HID_ELO is not set
> > > > CONFIG_HID_EZKEY=3Dm
> > > > CONFIG_HID_GEMBIRD=3Dm
> > > > CONFIG_HID_GFRM=3Dm
> > > > # CONFIG_HID_GLORIOUS is not set
> > > > # CONFIG_HID_HOLTEK is not set
> > > > # CONFIG_HID_VIVALDI is not set
> > > > # CONFIG_HID_GT683R is not set
> > > > CONFIG_HID_KEYTOUCH=3Dm
> > > > CONFIG_HID_KYE=3Dm
> > > > # CONFIG_HID_UCLOGIC is not set
> > > > CONFIG_HID_WALTOP=3Dm
> > > > # CONFIG_HID_VIEWSONIC is not set
> > > > CONFIG_HID_GYRATION=3Dm
> > > > CONFIG_HID_ICADE=3Dm
> > > > CONFIG_HID_ITE=3Dm
> > > > CONFIG_HID_JABRA=3Dm
> > > > CONFIG_HID_TWINHAN=3Dm
> > > > CONFIG_HID_KENSINGTON=3Dm
> > > > CONFIG_HID_LCPOWER=3Dm
> > > > CONFIG_HID_LED=3Dm
> > > > CONFIG_HID_LENOVO=3Dm
> > > > CONFIG_HID_LOGITECH=3Dm
> > > > CONFIG_HID_LOGITECH_DJ=3Dm
> > > > CONFIG_HID_LOGITECH_HIDPP=3Dm
> > > > # CONFIG_LOGITECH_FF is not set
> > > > # CONFIG_LOGIRUMBLEPAD2_FF is not set
> > > > # CONFIG_LOGIG940_FF is not set
> > > > # CONFIG_LOGIWHEELS_FF is not set
> > > > CONFIG_HID_MAGICMOUSE=3Dy
> > > > # CONFIG_HID_MALTRON is not set
> > > > # CONFIG_HID_MAYFLASH is not set
> > > > # CONFIG_HID_REDRAGON is not set
> > > > CONFIG_HID_MICROSOFT=3Dm
> > > > CONFIG_HID_MONTEREY=3Dm
> > > > CONFIG_HID_MULTITOUCH=3Dm
> > > > CONFIG_HID_NTI=3Dm
> > > > # CONFIG_HID_NTRIG is not set
> > > > CONFIG_HID_ORTEK=3Dm
> > > > CONFIG_HID_PANTHERLORD=3Dm
> > > > # CONFIG_PANTHERLORD_FF is not set
> > > > # CONFIG_HID_PENMOUNT is not set
> > > > CONFIG_HID_PETALYNX=3Dm
> > > > CONFIG_HID_PICOLCD=3Dm
> > > > CONFIG_HID_PICOLCD_FB=3Dy
> > > > CONFIG_HID_PICOLCD_BACKLIGHT=3Dy
> > > > CONFIG_HID_PICOLCD_LCD=3Dy
> > > > CONFIG_HID_PICOLCD_LEDS=3Dy
> > > > CONFIG_HID_PICOLCD_CIR=3Dy
> > > > CONFIG_HID_PLANTRONICS=3Dm
> > > > # CONFIG_HID_PLAYSTATION is not set
> > > > CONFIG_HID_PRIMAX=3Dm
> > > > # CONFIG_HID_RETRODE is not set
> > > > # CONFIG_HID_ROCCAT is not set
> > > > CONFIG_HID_SAITEK=3Dm
> > > > CONFIG_HID_SAMSUNG=3Dm
> > > > # CONFIG_HID_SONY is not set
> > > > CONFIG_HID_SPEEDLINK=3Dm
> > > > # CONFIG_HID_STEAM is not set
> > > > CONFIG_HID_STEELSERIES=3Dm
> > > > CONFIG_HID_SUNPLUS=3Dm
> > > > CONFIG_HID_RMI=3Dm
> > > > CONFIG_HID_GREENASIA=3Dm
> > > > # CONFIG_GREENASIA_FF is not set
> > > > CONFIG_HID_HYPERV_MOUSE=3Dm
> > > > CONFIG_HID_SMARTJOYPLUS=3Dm
> > > > # CONFIG_SMARTJOYPLUS_FF is not set
> > > > CONFIG_HID_TIVO=3Dm
> > > > CONFIG_HID_TOPSEED=3Dm
> > > > CONFIG_HID_THINGM=3Dm
> > > > CONFIG_HID_THRUSTMASTER=3Dm
> > > > # CONFIG_THRUSTMASTER_FF is not set
> > > > # CONFIG_HID_UDRAW_PS3 is not set
> > > > # CONFIG_HID_U2FZERO is not set
> > > > # CONFIG_HID_WACOM is not set
> > > > CONFIG_HID_WIIMOTE=3Dm
> > > > CONFIG_HID_XINMO=3Dm
> > > > CONFIG_HID_ZEROPLUS=3Dm
> > > > # CONFIG_ZEROPLUS_FF is not set
> > > > CONFIG_HID_ZYDACRON=3Dm
> > > > CONFIG_HID_SENSOR_HUB=3Dy
> > > > CONFIG_HID_SENSOR_CUSTOM_SENSOR=3Dm
> > > > CONFIG_HID_ALPS=3Dm
> > > > # CONFIG_HID_MCP2221 is not set
> > > > # end of Special HID drivers
> > > > =

> > > > #
> > > > # USB HID support
> > > > #
> > > > CONFIG_USB_HID=3Dy
> > > > # CONFIG_HID_PID is not set
> > > > # CONFIG_USB_HIDDEV is not set
> > > > # end of USB HID support
> > > > =

> > > > #
> > > > # I2C HID support
> > > > #
> > > > # CONFIG_I2C_HID_ACPI is not set
> > > > # end of I2C HID support
> > > > =

> > > > #
> > > > # Intel ISH HID support
> > > > #
> > > > CONFIG_INTEL_ISH_HID=3Dm
> > > > # CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER is not set
> > > > # end of Intel ISH HID support
> > > > =

> > > > #
> > > > # AMD SFH HID Support
> > > > #
> > > > # CONFIG_AMD_SFH_HID is not set
> > > > # end of AMD SFH HID Support
> > > > # end of HID support
> > > > =

> > > > CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> > > > CONFIG_USB_SUPPORT=3Dy
> > > > CONFIG_USB_COMMON=3Dy
> > > > # CONFIG_USB_LED_TRIG is not set
> > > > # CONFIG_USB_ULPI_BUS is not set
> > > > # CONFIG_USB_CONN_GPIO is not set
> > > > CONFIG_USB_ARCH_HAS_HCD=3Dy
> > > > CONFIG_USB=3Dy
> > > > CONFIG_USB_PCI=3Dy
> > > > CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
> > > > =

> > > > #
> > > > # Miscellaneous USB options
> > > > #
> > > > CONFIG_USB_DEFAULT_PERSIST=3Dy
> > > > # CONFIG_USB_FEW_INIT_RETRIES is not set
> > > > # CONFIG_USB_DYNAMIC_MINORS is not set
> > > > # CONFIG_USB_OTG is not set
> > > > # CONFIG_USB_OTG_PRODUCTLIST is not set
> > > > CONFIG_USB_LEDS_TRIGGER_USBPORT=3Dy
> > > > CONFIG_USB_AUTOSUSPEND_DELAY=3D2
> > > > CONFIG_USB_MON=3Dy
> > > > =

> > > > #
> > > > # USB Host Controller Drivers
> > > > #
> > > > # CONFIG_USB_C67X00_HCD is not set
> > > > CONFIG_USB_XHCI_HCD=3Dy
> > > > # CONFIG_USB_XHCI_DBGCAP is not set
> > > > CONFIG_USB_XHCI_PCI=3Dy
> > > > # CONFIG_USB_XHCI_PCI_RENESAS is not set
> > > > # CONFIG_USB_XHCI_PLATFORM is not set
> > > > CONFIG_USB_EHCI_HCD=3Dy
> > > > CONFIG_USB_EHCI_ROOT_HUB_TT=3Dy
> > > > CONFIG_USB_EHCI_TT_NEWSCHED=3Dy
> > > > CONFIG_USB_EHCI_PCI=3Dy
> > > > # CONFIG_USB_EHCI_FSL is not set
> > > > # CONFIG_USB_EHCI_HCD_PLATFORM is not set
> > > > # CONFIG_USB_OXU210HP_HCD is not set
> > > > # CONFIG_USB_ISP116X_HCD is not set
> > > > # CONFIG_USB_FOTG210_HCD is not set
> > > > # CONFIG_USB_MAX3421_HCD is not set
> > > > CONFIG_USB_OHCI_HCD=3Dy
> > > > CONFIG_USB_OHCI_HCD_PCI=3Dy
> > > > # CONFIG_USB_OHCI_HCD_PLATFORM is not set
> > > > CONFIG_USB_UHCI_HCD=3Dy
> > > > # CONFIG_USB_SL811_HCD is not set
> > > > # CONFIG_USB_R8A66597_HCD is not set
> > > > # CONFIG_USB_HCD_BCMA is not set
> > > > # CONFIG_USB_HCD_TEST_MODE is not set
> > > > =

> > > > #
> > > > # USB Device Class drivers
> > > > #
> > > > # CONFIG_USB_ACM is not set
> > > > # CONFIG_USB_PRINTER is not set
> > > > # CONFIG_USB_WDM is not set
> > > > # CONFIG_USB_TMC is not set
> > > > =

> > > > #
> > > > # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> > > > #
> > > > =

> > > > #
> > > > # also be needed; see USB_STORAGE Help for more info
> > > > #
> > > > CONFIG_USB_STORAGE=3Dm
> > > > # CONFIG_USB_STORAGE_DEBUG is not set
> > > > # CONFIG_USB_STORAGE_REALTEK is not set
> > > > # CONFIG_USB_STORAGE_DATAFAB is not set
> > > > # CONFIG_USB_STORAGE_FREECOM is not set
> > > > # CONFIG_USB_STORAGE_ISD200 is not set
> > > > # CONFIG_USB_STORAGE_USBAT is not set
> > > > # CONFIG_USB_STORAGE_SDDR09 is not set
> > > > # CONFIG_USB_STORAGE_SDDR55 is not set
> > > > # CONFIG_USB_STORAGE_JUMPSHOT is not set
> > > > # CONFIG_USB_STORAGE_ALAUDA is not set
> > > > # CONFIG_USB_STORAGE_ONETOUCH is not set
> > > > # CONFIG_USB_STORAGE_KARMA is not set
> > > > # CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
> > > > # CONFIG_USB_STORAGE_ENE_UB6250 is not set
> > > > # CONFIG_USB_UAS is not set
> > > > =

> > > > #
> > > > # USB Imaging devices
> > > > #
> > > > # CONFIG_USB_MDC800 is not set
> > > > # CONFIG_USB_MICROTEK is not set
> > > > # CONFIG_USBIP_CORE is not set
> > > > # CONFIG_USB_CDNS_SUPPORT is not set
> > > > # CONFIG_USB_MUSB_HDRC is not set
> > > > # CONFIG_USB_DWC3 is not set
> > > > # CONFIG_USB_DWC2 is not set
> > > > # CONFIG_USB_CHIPIDEA is not set
> > > > # CONFIG_USB_ISP1760 is not set
> > > > =

> > > > #
> > > > # USB port drivers
> > > > #
> > > > # CONFIG_USB_USS720 is not set
> > > > CONFIG_USB_SERIAL=3Dm
> > > > CONFIG_USB_SERIAL_GENERIC=3Dy
> > > > # CONFIG_USB_SERIAL_SIMPLE is not set
> > > > # CONFIG_USB_SERIAL_AIRCABLE is not set
> > > > # CONFIG_USB_SERIAL_ARK3116 is not set
> > > > # CONFIG_USB_SERIAL_BELKIN is not set
> > > > # CONFIG_USB_SERIAL_CH341 is not set
> > > > # CONFIG_USB_SERIAL_WHITEHEAT is not set
> > > > # CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
> > > > # CONFIG_USB_SERIAL_CP210X is not set
> > > > # CONFIG_USB_SERIAL_CYPRESS_M8 is not set
> > > > # CONFIG_USB_SERIAL_EMPEG is not set
> > > > # CONFIG_USB_SERIAL_FTDI_SIO is not set
> > > > # CONFIG_USB_SERIAL_VISOR is not set
> > > > # CONFIG_USB_SERIAL_IPAQ is not set
> > > > # CONFIG_USB_SERIAL_IR is not set
> > > > # CONFIG_USB_SERIAL_EDGEPORT is not set
> > > > # CONFIG_USB_SERIAL_EDGEPORT_TI is not set
> > > > # CONFIG_USB_SERIAL_F81232 is not set
> > > > # CONFIG_USB_SERIAL_F8153X is not set
> > > > # CONFIG_USB_SERIAL_GARMIN is not set
> > > > # CONFIG_USB_SERIAL_IPW is not set
> > > > # CONFIG_USB_SERIAL_IUU is not set
> > > > # CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
> > > > # CONFIG_USB_SERIAL_KEYSPAN is not set
> > > > # CONFIG_USB_SERIAL_KLSI is not set
> > > > # CONFIG_USB_SERIAL_KOBIL_SCT is not set
> > > > # CONFIG_USB_SERIAL_MCT_U232 is not set
> > > > # CONFIG_USB_SERIAL_METRO is not set
> > > > # CONFIG_USB_SERIAL_MOS7720 is not set
> > > > # CONFIG_USB_SERIAL_MOS7840 is not set
> > > > # CONFIG_USB_SERIAL_MXUPORT is not set
> > > > # CONFIG_USB_SERIAL_NAVMAN is not set
> > > > # CONFIG_USB_SERIAL_PL2303 is not set
> > > > # CONFIG_USB_SERIAL_OTI6858 is not set
> > > > # CONFIG_USB_SERIAL_QCAUX is not set
> > > > # CONFIG_USB_SERIAL_QUALCOMM is not set
> > > > # CONFIG_USB_SERIAL_SPCP8X5 is not set
> > > > # CONFIG_USB_SERIAL_SAFE is not set
> > > > # CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
> > > > # CONFIG_USB_SERIAL_SYMBOL is not set
> > > > # CONFIG_USB_SERIAL_TI is not set
> > > > # CONFIG_USB_SERIAL_CYBERJACK is not set
> > > > # CONFIG_USB_SERIAL_OPTION is not set
> > > > # CONFIG_USB_SERIAL_OMNINET is not set
> > > > # CONFIG_USB_SERIAL_OPTICON is not set
> > > > # CONFIG_USB_SERIAL_XSENS_MT is not set
> > > > # CONFIG_USB_SERIAL_WISHBONE is not set
> > > > # CONFIG_USB_SERIAL_SSU100 is not set
> > > > # CONFIG_USB_SERIAL_QT2 is not set
> > > > # CONFIG_USB_SERIAL_UPD78F0730 is not set
> > > > # CONFIG_USB_SERIAL_XR is not set
> > > > CONFIG_USB_SERIAL_DEBUG=3Dm
> > > > =

> > > > #
> > > > # USB Miscellaneous drivers
> > > > #
> > > > # CONFIG_USB_EMI62 is not set
> > > > # CONFIG_USB_EMI26 is not set
> > > > # CONFIG_USB_ADUTUX is not set
> > > > # CONFIG_USB_SEVSEG is not set
> > > > # CONFIG_USB_LEGOTOWER is not set
> > > > # CONFIG_USB_LCD is not set
> > > > # CONFIG_USB_CYPRESS_CY7C63 is not set
> > > > # CONFIG_USB_CYTHERM is not set
> > > > # CONFIG_USB_IDMOUSE is not set
> > > > # CONFIG_USB_FTDI_ELAN is not set
> > > > # CONFIG_USB_APPLEDISPLAY is not set
> > > > # CONFIG_APPLE_MFI_FASTCHARGE is not set
> > > > # CONFIG_USB_SISUSBVGA is not set
> > > > # CONFIG_USB_LD is not set
> > > > # CONFIG_USB_TRANCEVIBRATOR is not set
> > > > # CONFIG_USB_IOWARRIOR is not set
> > > > # CONFIG_USB_TEST is not set
> > > > # CONFIG_USB_EHSET_TEST_FIXTURE is not set
> > > > # CONFIG_USB_ISIGHTFW is not set
> > > > # CONFIG_USB_YUREX is not set
> > > > # CONFIG_USB_EZUSB_FX2 is not set
> > > > # CONFIG_USB_HUB_USB251XB is not set
> > > > # CONFIG_USB_HSIC_USB3503 is not set
> > > > # CONFIG_USB_HSIC_USB4604 is not set
> > > > # CONFIG_USB_LINK_LAYER_TEST is not set
> > > > # CONFIG_USB_CHAOSKEY is not set
> > > > # CONFIG_USB_ATM is not set
> > > > =

> > > > #
> > > > # USB Physical Layer drivers
> > > > #
> > > > # CONFIG_NOP_USB_XCEIV is not set
> > > > # CONFIG_USB_GPIO_VBUS is not set
> > > > # CONFIG_USB_ISP1301 is not set
> > > > # end of USB Physical Layer drivers
> > > > =

> > > > # CONFIG_USB_GADGET is not set
> > > > CONFIG_TYPEC=3Dy
> > > > # CONFIG_TYPEC_TCPM is not set
> > > > CONFIG_TYPEC_UCSI=3Dy
> > > > # CONFIG_UCSI_CCG is not set
> > > > CONFIG_UCSI_ACPI=3Dy
> > > > # CONFIG_TYPEC_TPS6598X is not set
> > > > # CONFIG_TYPEC_STUSB160X is not set
> > > > =

> > > > #
> > > > # USB Type-C Multiplexer/DeMultiplexer Switch support
> > > > #
> > > > # CONFIG_TYPEC_MUX_PI3USB30532 is not set
> > > > # end of USB Type-C Multiplexer/DeMultiplexer Switch support
> > > > =

> > > > #
> > > > # USB Type-C Alternate Mode drivers
> > > > #
> > > > # CONFIG_TYPEC_DP_ALTMODE is not set
> > > > # end of USB Type-C Alternate Mode drivers
> > > > =

> > > > # CONFIG_USB_ROLE_SWITCH is not set
> > > > CONFIG_MMC=3Dm
> > > > CONFIG_MMC_BLOCK=3Dm
> > > > CONFIG_MMC_BLOCK_MINORS=3D8
> > > > CONFIG_SDIO_UART=3Dm
> > > > # CONFIG_MMC_TEST is not set
> > > > =

> > > > #
> > > > # MMC/SD/SDIO Host Controller Drivers
> > > > #
> > > > # CONFIG_MMC_DEBUG is not set
> > > > CONFIG_MMC_SDHCI=3Dm
> > > > CONFIG_MMC_SDHCI_IO_ACCESSORS=3Dy
> > > > CONFIG_MMC_SDHCI_PCI=3Dm
> > > > CONFIG_MMC_RICOH_MMC=3Dy
> > > > CONFIG_MMC_SDHCI_ACPI=3Dm
> > > > CONFIG_MMC_SDHCI_PLTFM=3Dm
> > > > # CONFIG_MMC_SDHCI_F_SDH30 is not set
> > > > # CONFIG_MMC_WBSD is not set
> > > > # CONFIG_MMC_TIFM_SD is not set
> > > > # CONFIG_MMC_SPI is not set
> > > > # CONFIG_MMC_CB710 is not set
> > > > # CONFIG_MMC_VIA_SDMMC is not set
> > > > # CONFIG_MMC_VUB300 is not set
> > > > # CONFIG_MMC_USHC is not set
> > > > # CONFIG_MMC_USDHI6ROL0 is not set
> > > > # CONFIG_MMC_REALTEK_PCI is not set
> > > > CONFIG_MMC_CQHCI=3Dm
> > > > # CONFIG_MMC_HSQ is not set
> > > > # CONFIG_MMC_TOSHIBA_PCI is not set
> > > > # CONFIG_MMC_MTK is not set
> > > > # CONFIG_MMC_SDHCI_XENON is not set
> > > > # CONFIG_MEMSTICK is not set
> > > > CONFIG_NEW_LEDS=3Dy
> > > > CONFIG_LEDS_CLASS=3Dy
> > > > # CONFIG_LEDS_CLASS_FLASH is not set
> > > > # CONFIG_LEDS_CLASS_MULTICOLOR is not set
> > > > # CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
> > > > =

> > > > #
> > > > # LED drivers
> > > > #
> > > > # CONFIG_LEDS_APU is not set
> > > > CONFIG_LEDS_LM3530=3Dm
> > > > # CONFIG_LEDS_LM3532 is not set
> > > > # CONFIG_LEDS_LM3642 is not set
> > > > # CONFIG_LEDS_PCA9532 is not set
> > > > # CONFIG_LEDS_GPIO is not set
> > > > CONFIG_LEDS_LP3944=3Dm
> > > > # CONFIG_LEDS_LP3952 is not set
> > > > # CONFIG_LEDS_LP50XX is not set
> > > > CONFIG_LEDS_CLEVO_MAIL=3Dm
> > > > # CONFIG_LEDS_PCA955X is not set
> > > > # CONFIG_LEDS_PCA963X is not set
> > > > # CONFIG_LEDS_DAC124S085 is not set
> > > > # CONFIG_LEDS_PWM is not set
> > > > # CONFIG_LEDS_BD2802 is not set
> > > > CONFIG_LEDS_INTEL_SS4200=3Dm
> > > > # CONFIG_LEDS_TCA6507 is not set
> > > > # CONFIG_LEDS_TLC591XX is not set
> > > > # CONFIG_LEDS_LM355x is not set
> > > > =

> > > > #
> > > > # LED driver for blink(1) USB RGB LED is under Special HID drivers =
(HID_THINGM)
> > > > #
> > > > CONFIG_LEDS_BLINKM=3Dm
> > > > CONFIG_LEDS_MLXCPLD=3Dm
> > > > # CONFIG_LEDS_MLXREG is not set
> > > > # CONFIG_LEDS_USER is not set
> > > > # CONFIG_LEDS_NIC78BX is not set
> > > > # CONFIG_LEDS_TI_LMU_COMMON is not set
> > > > =

> > > > #
> > > > # Flash and Torch LED drivers
> > > > #
> > > > =

> > > > #
> > > > # LED Triggers
> > > > #
> > > > CONFIG_LEDS_TRIGGERS=3Dy
> > > > CONFIG_LEDS_TRIGGER_TIMER=3Dm
> > > > CONFIG_LEDS_TRIGGER_ONESHOT=3Dm
> > > > # CONFIG_LEDS_TRIGGER_DISK is not set
> > > > CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dm
> > > > CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dm
> > > > # CONFIG_LEDS_TRIGGER_CPU is not set
> > > > # CONFIG_LEDS_TRIGGER_ACTIVITY is not set
> > > > CONFIG_LEDS_TRIGGER_GPIO=3Dm
> > > > CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dm
> > > > =

> > > > #
> > > > # iptables trigger is under Netfilter config (LED target)
> > > > #
> > > > CONFIG_LEDS_TRIGGER_TRANSIENT=3Dm
> > > > CONFIG_LEDS_TRIGGER_CAMERA=3Dm
> > > > # CONFIG_LEDS_TRIGGER_PANIC is not set
> > > > # CONFIG_LEDS_TRIGGER_NETDEV is not set
> > > > # CONFIG_LEDS_TRIGGER_PATTERN is not set
> > > > CONFIG_LEDS_TRIGGER_AUDIO=3Dm
> > > > # CONFIG_LEDS_TRIGGER_TTY is not set
> > > > =

> > > > #
> > > > # LED Blink
> > > > #
> > > > # CONFIG_LEDS_BLINK is not set
> > > > # CONFIG_ACCESSIBILITY is not set
> > > > CONFIG_INFINIBAND=3Dm
> > > > CONFIG_INFINIBAND_USER_MAD=3Dm
> > > > CONFIG_INFINIBAND_USER_ACCESS=3Dm
> > > > CONFIG_INFINIBAND_USER_MEM=3Dy
> > > > CONFIG_INFINIBAND_ON_DEMAND_PAGING=3Dy
> > > > CONFIG_INFINIBAND_ADDR_TRANS=3Dy
> > > > CONFIG_INFINIBAND_ADDR_TRANS_CONFIGFS=3Dy
> > > > CONFIG_INFINIBAND_VIRT_DMA=3Dy
> > > > # CONFIG_INFINIBAND_MTHCA is not set
> > > > # CONFIG_INFINIBAND_EFA is not set
> > > > # CONFIG_INFINIBAND_I40IW is not set
> > > > # CONFIG_MLX4_INFINIBAND is not set
> > > > # CONFIG_INFINIBAND_OCRDMA is not set
> > > > # CONFIG_INFINIBAND_USNIC is not set
> > > > # CONFIG_INFINIBAND_BNXT_RE is not set
> > > > # CONFIG_INFINIBAND_RDMAVT is not set
> > > > CONFIG_RDMA_RXE=3Dm
> > > > CONFIG_RDMA_SIW=3Dm
> > > > CONFIG_INFINIBAND_IPOIB=3Dm
> > > > # CONFIG_INFINIBAND_IPOIB_CM is not set
> > > > CONFIG_INFINIBAND_IPOIB_DEBUG=3Dy
> > > > # CONFIG_INFINIBAND_IPOIB_DEBUG_DATA is not set
> > > > CONFIG_INFINIBAND_SRP=3Dm
> > > > CONFIG_INFINIBAND_SRPT=3Dm
> > > > # CONFIG_INFINIBAND_ISER is not set
> > > > # CONFIG_INFINIBAND_ISERT is not set
> > > > # CONFIG_INFINIBAND_RTRS_CLIENT is not set
> > > > # CONFIG_INFINIBAND_RTRS_SERVER is not set
> > > > # CONFIG_INFINIBAND_OPA_VNIC is not set
> > > > CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> > > > CONFIG_EDAC_SUPPORT=3Dy
> > > > CONFIG_EDAC=3Dy
> > > > CONFIG_EDAC_LEGACY_SYSFS=3Dy
> > > > # CONFIG_EDAC_DEBUG is not set
> > > > CONFIG_EDAC_DECODE_MCE=3Dm
> > > > CONFIG_EDAC_GHES=3Dy
> > > > CONFIG_EDAC_AMD64=3Dm
> > > > CONFIG_EDAC_E752X=3Dm
> > > > CONFIG_EDAC_I82975X=3Dm
> > > > CONFIG_EDAC_I3000=3Dm
> > > > CONFIG_EDAC_I3200=3Dm
> > > > CONFIG_EDAC_IE31200=3Dm
> > > > CONFIG_EDAC_X38=3Dm
> > > > CONFIG_EDAC_I5400=3Dm
> > > > CONFIG_EDAC_I7CORE=3Dm
> > > > CONFIG_EDAC_I5000=3Dm
> > > > CONFIG_EDAC_I5100=3Dm
> > > > CONFIG_EDAC_I7300=3Dm
> > > > CONFIG_EDAC_SBRIDGE=3Dm
> > > > CONFIG_EDAC_SKX=3Dm
> > > > # CONFIG_EDAC_I10NM is not set
> > > > CONFIG_EDAC_PND2=3Dm
> > > > # CONFIG_EDAC_IGEN6 is not set
> > > > CONFIG_RTC_LIB=3Dy
> > > > CONFIG_RTC_MC146818_LIB=3Dy
> > > > CONFIG_RTC_CLASS=3Dy
> > > > CONFIG_RTC_HCTOSYS=3Dy
> > > > CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
> > > > # CONFIG_RTC_SYSTOHC is not set
> > > > # CONFIG_RTC_DEBUG is not set
> > > > CONFIG_RTC_NVMEM=3Dy
> > > > =

> > > > #
> > > > # RTC interfaces
> > > > #
> > > > CONFIG_RTC_INTF_SYSFS=3Dy
> > > > CONFIG_RTC_INTF_PROC=3Dy
> > > > CONFIG_RTC_INTF_DEV=3Dy
> > > > # CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
> > > > # CONFIG_RTC_DRV_TEST is not set
> > > > =

> > > > #
> > > > # I2C RTC drivers
> > > > #
> > > > # CONFIG_RTC_DRV_ABB5ZES3 is not set
> > > > # CONFIG_RTC_DRV_ABEOZ9 is not set
> > > > # CONFIG_RTC_DRV_ABX80X is not set
> > > > CONFIG_RTC_DRV_DS1307=3Dm
> > > > # CONFIG_RTC_DRV_DS1307_CENTURY is not set
> > > > CONFIG_RTC_DRV_DS1374=3Dm
> > > > # CONFIG_RTC_DRV_DS1374_WDT is not set
> > > > CONFIG_RTC_DRV_DS1672=3Dm
> > > > CONFIG_RTC_DRV_MAX6900=3Dm
> > > > CONFIG_RTC_DRV_RS5C372=3Dm
> > > > CONFIG_RTC_DRV_ISL1208=3Dm
> > > > CONFIG_RTC_DRV_ISL12022=3Dm
> > > > CONFIG_RTC_DRV_X1205=3Dm
> > > > CONFIG_RTC_DRV_PCF8523=3Dm
> > > > # CONFIG_RTC_DRV_PCF85063 is not set
> > > > # CONFIG_RTC_DRV_PCF85363 is not set
> > > > CONFIG_RTC_DRV_PCF8563=3Dm
> > > > CONFIG_RTC_DRV_PCF8583=3Dm
> > > > CONFIG_RTC_DRV_M41T80=3Dm
> > > > CONFIG_RTC_DRV_M41T80_WDT=3Dy
> > > > CONFIG_RTC_DRV_BQ32K=3Dm
> > > > # CONFIG_RTC_DRV_S35390A is not set
> > > > CONFIG_RTC_DRV_FM3130=3Dm
> > > > # CONFIG_RTC_DRV_RX8010 is not set
> > > > CONFIG_RTC_DRV_RX8581=3Dm
> > > > CONFIG_RTC_DRV_RX8025=3Dm
> > > > CONFIG_RTC_DRV_EM3027=3Dm
> > > > # CONFIG_RTC_DRV_RV3028 is not set
> > > > # CONFIG_RTC_DRV_RV3032 is not set
> > > > # CONFIG_RTC_DRV_RV8803 is not set
> > > > # CONFIG_RTC_DRV_SD3078 is not set
> > > > =

> > > > #
> > > > # SPI RTC drivers
> > > > #
> > > > # CONFIG_RTC_DRV_M41T93 is not set
> > > > # CONFIG_RTC_DRV_M41T94 is not set
> > > > # CONFIG_RTC_DRV_DS1302 is not set
> > > > # CONFIG_RTC_DRV_DS1305 is not set
> > > > # CONFIG_RTC_DRV_DS1343 is not set
> > > > # CONFIG_RTC_DRV_DS1347 is not set
> > > > # CONFIG_RTC_DRV_DS1390 is not set
> > > > # CONFIG_RTC_DRV_MAX6916 is not set
> > > > # CONFIG_RTC_DRV_R9701 is not set
> > > > CONFIG_RTC_DRV_RX4581=3Dm
> > > > # CONFIG_RTC_DRV_RS5C348 is not set
> > > > # CONFIG_RTC_DRV_MAX6902 is not set
> > > > # CONFIG_RTC_DRV_PCF2123 is not set
> > > > # CONFIG_RTC_DRV_MCP795 is not set
> > > > CONFIG_RTC_I2C_AND_SPI=3Dy
> > > > =

> > > > #
> > > > # SPI and I2C RTC drivers
> > > > #
> > > > CONFIG_RTC_DRV_DS3232=3Dm
> > > > CONFIG_RTC_DRV_DS3232_HWMON=3Dy
> > > > # CONFIG_RTC_DRV_PCF2127 is not set
> > > > CONFIG_RTC_DRV_RV3029C2=3Dm
> > > > # CONFIG_RTC_DRV_RV3029_HWMON is not set
> > > > # CONFIG_RTC_DRV_RX6110 is not set
> > > > =

> > > > #
> > > > # Platform RTC drivers
> > > > #
> > > > CONFIG_RTC_DRV_CMOS=3Dy
> > > > CONFIG_RTC_DRV_DS1286=3Dm
> > > > CONFIG_RTC_DRV_DS1511=3Dm
> > > > CONFIG_RTC_DRV_DS1553=3Dm
> > > > # CONFIG_RTC_DRV_DS1685_FAMILY is not set
> > > > CONFIG_RTC_DRV_DS1742=3Dm
> > > > CONFIG_RTC_DRV_DS2404=3Dm
> > > > CONFIG_RTC_DRV_STK17TA8=3Dm
> > > > # CONFIG_RTC_DRV_M48T86 is not set
> > > > CONFIG_RTC_DRV_M48T35=3Dm
> > > > CONFIG_RTC_DRV_M48T59=3Dm
> > > > CONFIG_RTC_DRV_MSM6242=3Dm
> > > > CONFIG_RTC_DRV_BQ4802=3Dm
> > > > CONFIG_RTC_DRV_RP5C01=3Dm
> > > > CONFIG_RTC_DRV_V3020=3Dm
> > > > =

> > > > #
> > > > # on-CPU RTC drivers
> > > > #
> > > > # CONFIG_RTC_DRV_FTRTC010 is not set
> > > > =

> > > > #
> > > > # HID Sensor RTC drivers
> > > > #
> > > > CONFIG_DMADEVICES=3Dy
> > > > # CONFIG_DMADEVICES_DEBUG is not set
> > > > =

> > > > #
> > > > # DMA Devices
> > > > #
> > > > CONFIG_DMA_ENGINE=3Dy
> > > > CONFIG_DMA_VIRTUAL_CHANNELS=3Dy
> > > > CONFIG_DMA_ACPI=3Dy
> > > > # CONFIG_ALTERA_MSGDMA is not set
> > > > CONFIG_INTEL_IDMA64=3Dm
> > > > # CONFIG_INTEL_IDXD is not set
> > > > CONFIG_INTEL_IOATDMA=3Dm
> > > > # CONFIG_PLX_DMA is not set
> > > > # CONFIG_XILINX_ZYNQMP_DPDMA is not set
> > > > # CONFIG_QCOM_HIDMA_MGMT is not set
> > > > # CONFIG_QCOM_HIDMA is not set
> > > > CONFIG_DW_DMAC_CORE=3Dy
> > > > CONFIG_DW_DMAC=3Dm
> > > > CONFIG_DW_DMAC_PCI=3Dy
> > > > # CONFIG_DW_EDMA is not set
> > > > # CONFIG_DW_EDMA_PCIE is not set
> > > > CONFIG_HSU_DMA=3Dy
> > > > # CONFIG_SF_PDMA is not set
> > > > # CONFIG_INTEL_LDMA is not set
> > > > =

> > > > #
> > > > # DMA Clients
> > > > #
> > > > CONFIG_ASYNC_TX_DMA=3Dy
> > > > CONFIG_DMATEST=3Dm
> > > > CONFIG_DMA_ENGINE_RAID=3Dy
> > > > =

> > > > #
> > > > # DMABUF options
> > > > #
> > > > CONFIG_SYNC_FILE=3Dy
> > > > # CONFIG_SW_SYNC is not set
> > > > # CONFIG_UDMABUF is not set
> > > > # CONFIG_DMABUF_MOVE_NOTIFY is not set
> > > > # CONFIG_DMABUF_DEBUG is not set
> > > > # CONFIG_DMABUF_SELFTESTS is not set
> > > > # CONFIG_DMABUF_HEAPS is not set
> > > > # end of DMABUF options
> > > > =

> > > > CONFIG_DCA=3Dm
> > > > # CONFIG_AUXDISPLAY is not set
> > > > # CONFIG_PANEL is not set
> > > > CONFIG_UIO=3Dm
> > > > CONFIG_UIO_CIF=3Dm
> > > > CONFIG_UIO_PDRV_GENIRQ=3Dm
> > > > # CONFIG_UIO_DMEM_GENIRQ is not set
> > > > CONFIG_UIO_AEC=3Dm
> > > > CONFIG_UIO_SERCOS3=3Dm
> > > > CONFIG_UIO_PCI_GENERIC=3Dm
> > > > # CONFIG_UIO_NETX is not set
> > > > # CONFIG_UIO_PRUSS is not set
> > > > # CONFIG_UIO_MF624 is not set
> > > > CONFIG_UIO_HV_GENERIC=3Dm
> > > > CONFIG_VFIO_IOMMU_TYPE1=3Dm
> > > > CONFIG_VFIO_VIRQFD=3Dm
> > > > CONFIG_VFIO=3Dm
> > > > CONFIG_VFIO_NOIOMMU=3Dy
> > > > CONFIG_VFIO_PCI=3Dm
> > > > # CONFIG_VFIO_PCI_VGA is not set
> > > > CONFIG_VFIO_PCI_MMAP=3Dy
> > > > CONFIG_VFIO_PCI_INTX=3Dy
> > > > # CONFIG_VFIO_PCI_IGD is not set
> > > > CONFIG_VFIO_MDEV=3Dm
> > > > CONFIG_VFIO_MDEV_DEVICE=3Dm
> > > > CONFIG_IRQ_BYPASS_MANAGER=3Dm
> > > > # CONFIG_VIRT_DRIVERS is not set
> > > > CONFIG_VIRTIO=3Dy
> > > > CONFIG_VIRTIO_PCI_LIB=3Dy
> > > > CONFIG_VIRTIO_MENU=3Dy
> > > > CONFIG_VIRTIO_PCI=3Dy
> > > > CONFIG_VIRTIO_PCI_LEGACY=3Dy
> > > > # CONFIG_VIRTIO_PMEM is not set
> > > > CONFIG_VIRTIO_BALLOON=3Dm
> > > > CONFIG_VIRTIO_MEM=3Dm
> > > > CONFIG_VIRTIO_INPUT=3Dm
> > > > # CONFIG_VIRTIO_MMIO is not set
> > > > CONFIG_VIRTIO_DMA_SHARED_BUFFER=3Dm
> > > > # CONFIG_VDPA is not set
> > > > CONFIG_VHOST_IOTLB=3Dm
> > > > CONFIG_VHOST=3Dm
> > > > CONFIG_VHOST_MENU=3Dy
> > > > CONFIG_VHOST_NET=3Dm
> > > > # CONFIG_VHOST_SCSI is not set
> > > > CONFIG_VHOST_VSOCK=3Dm
> > > > # CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set
> > > > =

> > > > #
> > > > # Microsoft Hyper-V guest support
> > > > #
> > > > CONFIG_HYPERV=3Dm
> > > > CONFIG_HYPERV_TIMER=3Dy
> > > > CONFIG_HYPERV_UTILS=3Dm
> > > > CONFIG_HYPERV_BALLOON=3Dm
> > > > # end of Microsoft Hyper-V guest support
> > > > =

> > > > #
> > > > # Xen driver support
> > > > #
> > > > # CONFIG_XEN_BALLOON is not set
> > > > CONFIG_XEN_DEV_EVTCHN=3Dm
> > > > # CONFIG_XEN_BACKEND is not set
> > > > CONFIG_XENFS=3Dm
> > > > CONFIG_XEN_COMPAT_XENFS=3Dy
> > > > CONFIG_XEN_SYS_HYPERVISOR=3Dy
> > > > CONFIG_XEN_XENBUS_FRONTEND=3Dy
> > > > # CONFIG_XEN_GNTDEV is not set
> > > > # CONFIG_XEN_GRANT_DEV_ALLOC is not set
> > > > # CONFIG_XEN_GRANT_DMA_ALLOC is not set
> > > > CONFIG_SWIOTLB_XEN=3Dy
> > > > # CONFIG_XEN_PVCALLS_FRONTEND is not set
> > > > CONFIG_XEN_PRIVCMD=3Dm
> > > > CONFIG_XEN_EFI=3Dy
> > > > CONFIG_XEN_AUTO_XLATE=3Dy
> > > > CONFIG_XEN_ACPI=3Dy
> > > > # CONFIG_XEN_UNPOPULATED_ALLOC is not set
> > > > # end of Xen driver support
> > > > =

> > > > # CONFIG_GREYBUS is not set
> > > > # CONFIG_STAGING is not set
> > > > CONFIG_X86_PLATFORM_DEVICES=3Dy
> > > > CONFIG_ACPI_WMI=3Dm
> > > > CONFIG_WMI_BMOF=3Dm
> > > > # CONFIG_HUAWEI_WMI is not set
> > > > # CONFIG_UV_SYSFS is not set
> > > > # CONFIG_INTEL_WMI_SBL_FW_UPDATE is not set
> > > > CONFIG_INTEL_WMI_THUNDERBOLT=3Dm
> > > > CONFIG_MXM_WMI=3Dm
> > > > # CONFIG_PEAQ_WMI is not set
> > > > # CONFIG_XIAOMI_WMI is not set
> > > > CONFIG_ACERHDF=3Dm
> > > > # CONFIG_ACER_WIRELESS is not set
> > > > CONFIG_ACER_WMI=3Dm
> > > > # CONFIG_AMD_PMC is not set
> > > > CONFIG_APPLE_GMUX=3Dm
> > > > CONFIG_ASUS_LAPTOP=3Dm
> > > > # CONFIG_ASUS_WIRELESS is not set
> > > > CONFIG_ASUS_WMI=3Dm
> > > > CONFIG_ASUS_NB_WMI=3Dm
> > > > CONFIG_EEEPC_LAPTOP=3Dm
> > > > CONFIG_EEEPC_WMI=3Dm
> > > > # CONFIG_X86_PLATFORM_DRIVERS_DELL is not set
> > > > CONFIG_AMILO_RFKILL=3Dm
> > > > CONFIG_FUJITSU_LAPTOP=3Dm
> > > > CONFIG_FUJITSU_TABLET=3Dm
> > > > # CONFIG_GPD_POCKET_FAN is not set
> > > > CONFIG_HP_ACCEL=3Dm
> > > > CONFIG_HP_WIRELESS=3Dm
> > > > CONFIG_HP_WMI=3Dm
> > > > # CONFIG_IBM_RTL is not set
> > > > CONFIG_IDEAPAD_LAPTOP=3Dm
> > > > CONFIG_SENSORS_HDAPS=3Dm
> > > > CONFIG_THINKPAD_ACPI=3Dm
> > > > # CONFIG_THINKPAD_ACPI_DEBUGFACILITIES is not set
> > > > # CONFIG_THINKPAD_ACPI_DEBUG is not set
> > > > # CONFIG_THINKPAD_ACPI_UNSAFE_LEDS is not set
> > > > CONFIG_THINKPAD_ACPI_VIDEO=3Dy
> > > > CONFIG_THINKPAD_ACPI_HOTKEY_POLL=3Dy
> > > > # CONFIG_INTEL_ATOMISP2_PM is not set
> > > > CONFIG_INTEL_HID_EVENT=3Dm
> > > > # CONFIG_INTEL_INT0002_VGPIO is not set
> > > > # CONFIG_INTEL_MENLOW is not set
> > > > CONFIG_INTEL_OAKTRAIL=3Dm
> > > > CONFIG_INTEL_VBTN=3Dm
> > > > CONFIG_MSI_LAPTOP=3Dm
> > > > CONFIG_MSI_WMI=3Dm
> > > > # CONFIG_PCENGINES_APU2 is not set
> > > > CONFIG_SAMSUNG_LAPTOP=3Dm
> > > > CONFIG_SAMSUNG_Q10=3Dm
> > > > CONFIG_TOSHIBA_BT_RFKILL=3Dm
> > > > # CONFIG_TOSHIBA_HAPS is not set
> > > > # CONFIG_TOSHIBA_WMI is not set
> > > > CONFIG_ACPI_CMPC=3Dm
> > > > CONFIG_COMPAL_LAPTOP=3Dm
> > > > # CONFIG_LG_LAPTOP is not set
> > > > CONFIG_PANASONIC_LAPTOP=3Dm
> > > > CONFIG_SONY_LAPTOP=3Dm
> > > > CONFIG_SONYPI_COMPAT=3Dy
> > > > # CONFIG_SYSTEM76_ACPI is not set
> > > > CONFIG_TOPSTAR_LAPTOP=3Dm
> > > > # CONFIG_I2C_MULTI_INSTANTIATE is not set
> > > > CONFIG_MLX_PLATFORM=3Dm
> > > > CONFIG_INTEL_IPS=3Dm
> > > > CONFIG_INTEL_RST=3Dm
> > > > # CONFIG_INTEL_SMARTCONNECT is not set
> > > > =

> > > > #
> > > > # Intel Speed Select Technology interface support
> > > > #
> > > > # CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
> > > > # end of Intel Speed Select Technology interface support
> > > > =

> > > > CONFIG_INTEL_TURBO_MAX_3=3Dy
> > > > # CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set
> > > > CONFIG_INTEL_PMC_CORE=3Dm
> > > > # CONFIG_INTEL_PUNIT_IPC is not set
> > > > # CONFIG_INTEL_SCU_PCI is not set
> > > > # CONFIG_INTEL_SCU_PLATFORM is not set
> > > > CONFIG_PMC_ATOM=3Dy
> > > > # CONFIG_CHROME_PLATFORMS is not set
> > > > CONFIG_MELLANOX_PLATFORM=3Dy
> > > > CONFIG_MLXREG_HOTPLUG=3Dm
> > > > # CONFIG_MLXREG_IO is not set
> > > > CONFIG_SURFACE_PLATFORMS=3Dy
> > > > # CONFIG_SURFACE3_WMI is not set
> > > > # CONFIG_SURFACE_3_POWER_OPREGION is not set
> > > > # CONFIG_SURFACE_GPE is not set
> > > > # CONFIG_SURFACE_HOTPLUG is not set
> > > > # CONFIG_SURFACE_PRO3_BUTTON is not set
> > > > CONFIG_HAVE_CLK=3Dy
> > > > CONFIG_CLKDEV_LOOKUP=3Dy
> > > > CONFIG_HAVE_CLK_PREPARE=3Dy
> > > > CONFIG_COMMON_CLK=3Dy
> > > > # CONFIG_COMMON_CLK_MAX9485 is not set
> > > > # CONFIG_COMMON_CLK_SI5341 is not set
> > > > # CONFIG_COMMON_CLK_SI5351 is not set
> > > > # CONFIG_COMMON_CLK_SI544 is not set
> > > > # CONFIG_COMMON_CLK_CDCE706 is not set
> > > > # CONFIG_COMMON_CLK_CS2000_CP is not set
> > > > # CONFIG_COMMON_CLK_PWM is not set
> > > > # CONFIG_XILINX_VCU is not set
> > > > CONFIG_HWSPINLOCK=3Dy
> > > > =

> > > > #
> > > > # Clock Source drivers
> > > > #
> > > > CONFIG_CLKEVT_I8253=3Dy
> > > > CONFIG_I8253_LOCK=3Dy
> > > > CONFIG_CLKBLD_I8253=3Dy
> > > > # end of Clock Source drivers
> > > > =

> > > > CONFIG_MAILBOX=3Dy
> > > > CONFIG_PCC=3Dy
> > > > # CONFIG_ALTERA_MBOX is not set
> > > > CONFIG_IOMMU_IOVA=3Dy
> > > > CONFIG_IOASID=3Dy
> > > > CONFIG_IOMMU_API=3Dy
> > > > CONFIG_IOMMU_SUPPORT=3Dy
> > > > =

> > > > #
> > > > # Generic IOMMU Pagetable Support
> > > > #
> > > > CONFIG_IOMMU_IO_PGTABLE=3Dy
> > > > # end of Generic IOMMU Pagetable Support
> > > > =

> > > > # CONFIG_IOMMU_DEBUGFS is not set
> > > > # CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
> > > > CONFIG_IOMMU_DMA=3Dy
> > > > CONFIG_AMD_IOMMU=3Dy
> > > > CONFIG_AMD_IOMMU_V2=3Dm
> > > > CONFIG_DMAR_TABLE=3Dy
> > > > CONFIG_INTEL_IOMMU=3Dy
> > > > # CONFIG_INTEL_IOMMU_SVM is not set
> > > > # CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
> > > > CONFIG_INTEL_IOMMU_FLOPPY_WA=3Dy
> > > > # CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON is not set
> > > > CONFIG_IRQ_REMAP=3Dy
> > > > CONFIG_HYPERV_IOMMU=3Dy
> > > > =

> > > > #
> > > > # Remoteproc drivers
> > > > #
> > > > # CONFIG_REMOTEPROC is not set
> > > > # end of Remoteproc drivers
> > > > =

> > > > #
> > > > # Rpmsg drivers
> > > > #
> > > > # CONFIG_RPMSG_QCOM_GLINK_RPM is not set
> > > > # CONFIG_RPMSG_VIRTIO is not set
> > > > # end of Rpmsg drivers
> > > > =

> > > > # CONFIG_SOUNDWIRE is not set
> > > > =

> > > > #
> > > > # SOC (System On Chip) specific Drivers
> > > > #
> > > > =

> > > > #
> > > > # Amlogic SoC drivers
> > > > #
> > > > # end of Amlogic SoC drivers
> > > > =

> > > > #
> > > > # Broadcom SoC drivers
> > > > #
> > > > # end of Broadcom SoC drivers
> > > > =

> > > > #
> > > > # NXP/Freescale QorIQ SoC drivers
> > > > #
> > > > # end of NXP/Freescale QorIQ SoC drivers
> > > > =

> > > > #
> > > > # i.MX SoC drivers
> > > > #
> > > > # end of i.MX SoC drivers
> > > > =

> > > > #
> > > > # Enable LiteX SoC Builder specific drivers
> > > > #
> > > > # end of Enable LiteX SoC Builder specific drivers
> > > > =

> > > > #
> > > > # Qualcomm SoC drivers
> > > > #
> > > > # end of Qualcomm SoC drivers
> > > > =

> > > > # CONFIG_SOC_TI is not set
> > > > =

> > > > #
> > > > # Xilinx SoC drivers
> > > > #
> > > > # end of Xilinx SoC drivers
> > > > # end of SOC (System On Chip) specific Drivers
> > > > =

> > > > # CONFIG_PM_DEVFREQ is not set
> > > > # CONFIG_EXTCON is not set
> > > > # CONFIG_MEMORY is not set
> > > > # CONFIG_IIO is not set
> > > > CONFIG_NTB=3Dm
> > > > # CONFIG_NTB_MSI is not set
> > > > # CONFIG_NTB_AMD is not set
> > > > # CONFIG_NTB_IDT is not set
> > > > # CONFIG_NTB_INTEL is not set
> > > > # CONFIG_NTB_EPF is not set
> > > > # CONFIG_NTB_SWITCHTEC is not set
> > > > # CONFIG_NTB_PINGPONG is not set
> > > > # CONFIG_NTB_TOOL is not set
> > > > # CONFIG_NTB_PERF is not set
> > > > # CONFIG_NTB_TRANSPORT is not set
> > > > # CONFIG_VME_BUS is not set
> > > > CONFIG_PWM=3Dy
> > > > CONFIG_PWM_SYSFS=3Dy
> > > > # CONFIG_PWM_DEBUG is not set
> > > > # CONFIG_PWM_DWC is not set
> > > > CONFIG_PWM_LPSS=3Dm
> > > > CONFIG_PWM_LPSS_PCI=3Dm
> > > > CONFIG_PWM_LPSS_PLATFORM=3Dm
> > > > # CONFIG_PWM_PCA9685 is not set
> > > > =

> > > > #
> > > > # IRQ chip support
> > > > #
> > > > # end of IRQ chip support
> > > > =

> > > > # CONFIG_IPACK_BUS is not set
> > > > # CONFIG_RESET_CONTROLLER is not set
> > > > =

> > > > #
> > > > # PHY Subsystem
> > > > #
> > > > # CONFIG_GENERIC_PHY is not set
> > > > # CONFIG_USB_LGM_PHY is not set
> > > > # CONFIG_BCM_KONA_USB2_PHY is not set
> > > > # CONFIG_PHY_PXA_28NM_HSIC is not set
> > > > # CONFIG_PHY_PXA_28NM_USB2 is not set
> > > > # CONFIG_PHY_INTEL_LGM_EMMC is not set
> > > > # end of PHY Subsystem
> > > > =

> > > > CONFIG_POWERCAP=3Dy
> > > > CONFIG_INTEL_RAPL_CORE=3Dm
> > > > CONFIG_INTEL_RAPL=3Dm
> > > > # CONFIG_IDLE_INJECT is not set
> > > > # CONFIG_DTPM is not set
> > > > # CONFIG_MCB is not set
> > > > =

> > > > #
> > > > # Performance monitor support
> > > > #
> > > > # end of Performance monitor support
> > > > =

> > > > CONFIG_RAS=3Dy
> > > > # CONFIG_RAS_CEC is not set
> > > > # CONFIG_USB4 is not set
> > > > =

> > > > #
> > > > # Android
> > > > #
> > > > # CONFIG_ANDROID is not set
> > > > # end of Android
> > > > =

> > > > CONFIG_LIBNVDIMM=3Dm
> > > > CONFIG_BLK_DEV_PMEM=3Dm
> > > > CONFIG_ND_BLK=3Dm
> > > > CONFIG_ND_CLAIM=3Dy
> > > > CONFIG_ND_BTT=3Dm
> > > > CONFIG_BTT=3Dy
> > > > CONFIG_ND_PFN=3Dm
> > > > CONFIG_NVDIMM_PFN=3Dy
> > > > CONFIG_NVDIMM_DAX=3Dy
> > > > CONFIG_NVDIMM_KEYS=3Dy
> > > > CONFIG_DAX_DRIVER=3Dy
> > > > CONFIG_DAX=3Dy
> > > > CONFIG_DEV_DAX=3Dm
> > > > CONFIG_DEV_DAX_PMEM=3Dm
> > > > CONFIG_DEV_DAX_KMEM=3Dm
> > > > CONFIG_DEV_DAX_PMEM_COMPAT=3Dm
> > > > CONFIG_NVMEM=3Dy
> > > > CONFIG_NVMEM_SYSFS=3Dy
> > > > # CONFIG_NVMEM_RMEM is not set
> > > > =

> > > > #
> > > > # HW tracing support
> > > > #
> > > > CONFIG_STM=3Dm
> > > > # CONFIG_STM_PROTO_BASIC is not set
> > > > # CONFIG_STM_PROTO_SYS_T is not set
> > > > CONFIG_STM_DUMMY=3Dm
> > > > CONFIG_STM_SOURCE_CONSOLE=3Dm
> > > > CONFIG_STM_SOURCE_HEARTBEAT=3Dm
> > > > CONFIG_STM_SOURCE_FTRACE=3Dm
> > > > CONFIG_INTEL_TH=3Dm
> > > > CONFIG_INTEL_TH_PCI=3Dm
> > > > CONFIG_INTEL_TH_ACPI=3Dm
> > > > CONFIG_INTEL_TH_GTH=3Dm
> > > > CONFIG_INTEL_TH_STH=3Dm
> > > > CONFIG_INTEL_TH_MSU=3Dm
> > > > CONFIG_INTEL_TH_PTI=3Dm
> > > > # CONFIG_INTEL_TH_DEBUG is not set
> > > > # end of HW tracing support
> > > > =

> > > > # CONFIG_FPGA is not set
> > > > # CONFIG_TEE is not set
> > > > # CONFIG_UNISYS_VISORBUS is not set
> > > > # CONFIG_SIOX is not set
> > > > # CONFIG_SLIMBUS is not set
> > > > # CONFIG_INTERCONNECT is not set
> > > > # CONFIG_COUNTER is not set
> > > > # CONFIG_MOST is not set
> > > > # end of Device Drivers
> > > > =

> > > > #
> > > > # File systems
> > > > #
> > > > CONFIG_DCACHE_WORD_ACCESS=3Dy
> > > > # CONFIG_VALIDATE_FS_PARSER is not set
> > > > CONFIG_FS_IOMAP=3Dy
> > > > CONFIG_EXT2_FS=3Dm
> > > > CONFIG_EXT2_FS_XATTR=3Dy
> > > > CONFIG_EXT2_FS_POSIX_ACL=3Dy
> > > > CONFIG_EXT2_FS_SECURITY=3Dy
> > > > # CONFIG_EXT3_FS is not set
> > > > CONFIG_EXT4_FS=3Dy
> > > > CONFIG_EXT4_FS_POSIX_ACL=3Dy
> > > > CONFIG_EXT4_FS_SECURITY=3Dy
> > > > # CONFIG_EXT4_DEBUG is not set
> > > > CONFIG_EXT4_KUNIT_TESTS=3Dm
> > > > CONFIG_JBD2=3Dy
> > > > # CONFIG_JBD2_DEBUG is not set
> > > > CONFIG_FS_MBCACHE=3Dy
> > > > # CONFIG_REISERFS_FS is not set
> > > > # CONFIG_JFS_FS is not set
> > > > CONFIG_XFS_FS=3Dm
> > > > CONFIG_XFS_SUPPORT_V4=3Dy
> > > > CONFIG_XFS_QUOTA=3Dy
> > > > CONFIG_XFS_POSIX_ACL=3Dy
> > > > CONFIG_XFS_RT=3Dy
> > > > CONFIG_XFS_ONLINE_SCRUB=3Dy
> > > > CONFIG_XFS_ONLINE_REPAIR=3Dy
> > > > CONFIG_XFS_DEBUG=3Dy
> > > > CONFIG_XFS_ASSERT_FATAL=3Dy
> > > > CONFIG_GFS2_FS=3Dm
> > > > CONFIG_GFS2_FS_LOCKING_DLM=3Dy
> > > > CONFIG_OCFS2_FS=3Dm
> > > > CONFIG_OCFS2_FS_O2CB=3Dm
> > > > CONFIG_OCFS2_FS_USERSPACE_CLUSTER=3Dm
> > > > CONFIG_OCFS2_FS_STATS=3Dy
> > > > CONFIG_OCFS2_DEBUG_MASKLOG=3Dy
> > > > # CONFIG_OCFS2_DEBUG_FS is not set
> > > > CONFIG_BTRFS_FS=3Dm
> > > > CONFIG_BTRFS_FS_POSIX_ACL=3Dy
> > > > # CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
> > > > # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
> > > > # CONFIG_BTRFS_DEBUG is not set
> > > > # CONFIG_BTRFS_ASSERT is not set
> > > > # CONFIG_BTRFS_FS_REF_VERIFY is not set
> > > > # CONFIG_NILFS2_FS is not set
> > > > CONFIG_F2FS_FS=3Dm
> > > > CONFIG_F2FS_STAT_FS=3Dy
> > > > CONFIG_F2FS_FS_XATTR=3Dy
> > > > CONFIG_F2FS_FS_POSIX_ACL=3Dy
> > > > CONFIG_F2FS_FS_SECURITY=3Dy
> > > > # CONFIG_F2FS_CHECK_FS is not set
> > > > # CONFIG_F2FS_FAULT_INJECTION is not set
> > > > # CONFIG_F2FS_FS_COMPRESSION is not set
> > > > # CONFIG_ZONEFS_FS is not set
> > > > CONFIG_FS_DAX=3Dy
> > > > CONFIG_FS_DAX_PMD=3Dy
> > > > CONFIG_FS_POSIX_ACL=3Dy
> > > > CONFIG_EXPORTFS=3Dy
> > > > CONFIG_EXPORTFS_BLOCK_OPS=3Dy
> > > > CONFIG_FILE_LOCKING=3Dy
> > > > CONFIG_MANDATORY_FILE_LOCKING=3Dy
> > > > CONFIG_FS_ENCRYPTION=3Dy
> > > > CONFIG_FS_ENCRYPTION_ALGS=3Dy
> > > > # CONFIG_FS_VERITY is not set
> > > > CONFIG_FSNOTIFY=3Dy
> > > > CONFIG_DNOTIFY=3Dy
> > > > CONFIG_INOTIFY_USER=3Dy
> > > > CONFIG_FANOTIFY=3Dy
> > > > CONFIG_FANOTIFY_ACCESS_PERMISSIONS=3Dy
> > > > CONFIG_QUOTA=3Dy
> > > > CONFIG_QUOTA_NETLINK_INTERFACE=3Dy
> > > > CONFIG_PRINT_QUOTA_WARNING=3Dy
> > > > # CONFIG_QUOTA_DEBUG is not set
> > > > CONFIG_QUOTA_TREE=3Dy
> > > > # CONFIG_QFMT_V1 is not set
> > > > CONFIG_QFMT_V2=3Dy
> > > > CONFIG_QUOTACTL=3Dy
> > > > CONFIG_AUTOFS4_FS=3Dy
> > > > CONFIG_AUTOFS_FS=3Dy
> > > > CONFIG_FUSE_FS=3Dm
> > > > CONFIG_CUSE=3Dm
> > > > # CONFIG_VIRTIO_FS is not set
> > > > CONFIG_OVERLAY_FS=3Dm
> > > > # CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
> > > > # CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
> > > > # CONFIG_OVERLAY_FS_INDEX is not set
> > > > # CONFIG_OVERLAY_FS_XINO_AUTO is not set
> > > > # CONFIG_OVERLAY_FS_METACOPY is not set
> > > > =

> > > > #
> > > > # Caches
> > > > #
> > > > CONFIG_FSCACHE=3Dm
> > > > CONFIG_FSCACHE_STATS=3Dy
> > > > # CONFIG_FSCACHE_HISTOGRAM is not set
> > > > # CONFIG_FSCACHE_DEBUG is not set
> > > > # CONFIG_FSCACHE_OBJECT_LIST is not set
> > > > CONFIG_CACHEFILES=3Dm
> > > > # CONFIG_CACHEFILES_DEBUG is not set
> > > > # CONFIG_CACHEFILES_HISTOGRAM is not set
> > > > # end of Caches
> > > > =

> > > > #
> > > > # CD-ROM/DVD Filesystems
> > > > #
> > > > CONFIG_ISO9660_FS=3Dm
> > > > CONFIG_JOLIET=3Dy
> > > > CONFIG_ZISOFS=3Dy
> > > > CONFIG_UDF_FS=3Dm
> > > > # end of CD-ROM/DVD Filesystems
> > > > =

> > > > #
> > > > # DOS/FAT/EXFAT/NT Filesystems
> > > > #
> > > > CONFIG_FAT_FS=3Dm
> > > > CONFIG_MSDOS_FS=3Dm
> > > > CONFIG_VFAT_FS=3Dm
> > > > CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> > > > CONFIG_FAT_DEFAULT_IOCHARSET=3D"ascii"
> > > > # CONFIG_FAT_DEFAULT_UTF8 is not set
> > > > # CONFIG_EXFAT_FS is not set
> > > > # CONFIG_NTFS_FS is not set
> > > > # end of DOS/FAT/EXFAT/NT Filesystems
> > > > =

> > > > #
> > > > # Pseudo filesystems
> > > > #
> > > > CONFIG_PROC_FS=3Dy
> > > > CONFIG_PROC_KCORE=3Dy
> > > > CONFIG_PROC_VMCORE=3Dy
> > > > CONFIG_PROC_VMCORE_DEVICE_DUMP=3Dy
> > > > CONFIG_PROC_SYSCTL=3Dy
> > > > CONFIG_PROC_PAGE_MONITOR=3Dy
> > > > CONFIG_PROC_CHILDREN=3Dy
> > > > CONFIG_PROC_PID_ARCH_STATUS=3Dy
> > > > CONFIG_PROC_CPU_RESCTRL=3Dy
> > > > CONFIG_KERNFS=3Dy
> > > > CONFIG_SYSFS=3Dy
> > > > CONFIG_TMPFS=3Dy
> > > > CONFIG_TMPFS_POSIX_ACL=3Dy
> > > > CONFIG_TMPFS_XATTR=3Dy
> > > > # CONFIG_TMPFS_INODE64 is not set
> > > > CONFIG_HUGETLBFS=3Dy
> > > > CONFIG_HUGETLB_PAGE=3Dy
> > > > CONFIG_MEMFD_CREATE=3Dy
> > > > CONFIG_ARCH_HAS_GIGANTIC_PAGE=3Dy
> > > > CONFIG_CONFIGFS_FS=3Dy
> > > > CONFIG_EFIVAR_FS=3Dy
> > > > # end of Pseudo filesystems
> > > > =

> > > > CONFIG_MISC_FILESYSTEMS=3Dy
> > > > # CONFIG_ORANGEFS_FS is not set
> > > > # CONFIG_ADFS_FS is not set
> > > > # CONFIG_AFFS_FS is not set
> > > > # CONFIG_ECRYPT_FS is not set
> > > > # CONFIG_HFS_FS is not set
> > > > # CONFIG_HFSPLUS_FS is not set
> > > > # CONFIG_BEFS_FS is not set
> > > > # CONFIG_BFS_FS is not set
> > > > # CONFIG_EFS_FS is not set
> > > > CONFIG_CRAMFS=3Dm
> > > > CONFIG_CRAMFS_BLOCKDEV=3Dy
> > > > CONFIG_SQUASHFS=3Dm
> > > > # CONFIG_SQUASHFS_FILE_CACHE is not set
> > > > CONFIG_SQUASHFS_FILE_DIRECT=3Dy
> > > > # CONFIG_SQUASHFS_DECOMP_SINGLE is not set
> > > > # CONFIG_SQUASHFS_DECOMP_MULTI is not set
> > > > CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=3Dy
> > > > CONFIG_SQUASHFS_XATTR=3Dy
> > > > CONFIG_SQUASHFS_ZLIB=3Dy
> > > > # CONFIG_SQUASHFS_LZ4 is not set
> > > > CONFIG_SQUASHFS_LZO=3Dy
> > > > CONFIG_SQUASHFS_XZ=3Dy
> > > > # CONFIG_SQUASHFS_ZSTD is not set
> > > > # CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
> > > > # CONFIG_SQUASHFS_EMBEDDED is not set
> > > > CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3D3
> > > > # CONFIG_VXFS_FS is not set
> > > > CONFIG_MINIX_FS=3Dm
> > > > # CONFIG_OMFS_FS is not set
> > > > # CONFIG_HPFS_FS is not set
> > > > # CONFIG_QNX4FS_FS is not set
> > > > # CONFIG_QNX6FS_FS is not set
> > > > # CONFIG_ROMFS_FS is not set
> > > > CONFIG_PSTORE=3Dy
> > > > CONFIG_PSTORE_DEFAULT_KMSG_BYTES=3D10240
> > > > CONFIG_PSTORE_DEFLATE_COMPRESS=3Dy
> > > > # CONFIG_PSTORE_LZO_COMPRESS is not set
> > > > # CONFIG_PSTORE_LZ4_COMPRESS is not set
> > > > # CONFIG_PSTORE_LZ4HC_COMPRESS is not set
> > > > # CONFIG_PSTORE_842_COMPRESS is not set
> > > > # CONFIG_PSTORE_ZSTD_COMPRESS is not set
> > > > CONFIG_PSTORE_COMPRESS=3Dy
> > > > CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=3Dy
> > > > CONFIG_PSTORE_COMPRESS_DEFAULT=3D"deflate"
> > > > # CONFIG_PSTORE_CONSOLE is not set
> > > > # CONFIG_PSTORE_PMSG is not set
> > > > # CONFIG_PSTORE_FTRACE is not set
> > > > CONFIG_PSTORE_RAM=3Dm
> > > > # CONFIG_PSTORE_BLK is not set
> > > > # CONFIG_SYSV_FS is not set
> > > > # CONFIG_UFS_FS is not set
> > > > # CONFIG_EROFS_FS is not set
> > > > CONFIG_NETWORK_FILESYSTEMS=3Dy
> > > > CONFIG_NFS_FS=3Dy
> > > > # CONFIG_NFS_V2 is not set
> > > > CONFIG_NFS_V3=3Dy
> > > > CONFIG_NFS_V3_ACL=3Dy
> > > > CONFIG_NFS_V4=3Dm
> > > > # CONFIG_NFS_SWAP is not set
> > > > CONFIG_NFS_V4_1=3Dy
> > > > CONFIG_NFS_V4_2=3Dy
> > > > CONFIG_PNFS_FILE_LAYOUT=3Dm
> > > > CONFIG_PNFS_BLOCK=3Dm
> > > > CONFIG_PNFS_FLEXFILE_LAYOUT=3Dm
> > > > CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN=3D"kernel.org"
> > > > # CONFIG_NFS_V4_1_MIGRATION is not set
> > > > CONFIG_NFS_V4_SECURITY_LABEL=3Dy
> > > > CONFIG_ROOT_NFS=3Dy
> > > > # CONFIG_NFS_USE_LEGACY_DNS is not set
> > > > CONFIG_NFS_USE_KERNEL_DNS=3Dy
> > > > CONFIG_NFS_DEBUG=3Dy
> > > > CONFIG_NFS_DISABLE_UDP_SUPPORT=3Dy
> > > > # CONFIG_NFS_V4_2_READ_PLUS is not set
> > > > CONFIG_NFSD=3Dm
> > > > CONFIG_NFSD_V2_ACL=3Dy
> > > > CONFIG_NFSD_V3=3Dy
> > > > CONFIG_NFSD_V3_ACL=3Dy
> > > > CONFIG_NFSD_V4=3Dy
> > > > CONFIG_NFSD_PNFS=3Dy
> > > > # CONFIG_NFSD_BLOCKLAYOUT is not set
> > > > CONFIG_NFSD_SCSILAYOUT=3Dy
> > > > # CONFIG_NFSD_FLEXFILELAYOUT is not set
> > > > # CONFIG_NFSD_V4_2_INTER_SSC is not set
> > > > CONFIG_NFSD_V4_SECURITY_LABEL=3Dy
> > > > CONFIG_GRACE_PERIOD=3Dy
> > > > CONFIG_LOCKD=3Dy
> > > > CONFIG_LOCKD_V4=3Dy
> > > > CONFIG_NFS_ACL_SUPPORT=3Dy
> > > > CONFIG_NFS_COMMON=3Dy
> > > > CONFIG_NFS_V4_2_SSC_HELPER=3Dy
> > > > CONFIG_SUNRPC=3Dy
> > > > CONFIG_SUNRPC_GSS=3Dm
> > > > CONFIG_SUNRPC_BACKCHANNEL=3Dy
> > > > CONFIG_RPCSEC_GSS_KRB5=3Dm
> > > > # CONFIG_SUNRPC_DISABLE_INSECURE_ENCTYPES is not set
> > > > CONFIG_SUNRPC_DEBUG=3Dy
> > > > CONFIG_SUNRPC_XPRT_RDMA=3Dm
> > > > CONFIG_CEPH_FS=3Dm
> > > > # CONFIG_CEPH_FSCACHE is not set
> > > > CONFIG_CEPH_FS_POSIX_ACL=3Dy
> > > > # CONFIG_CEPH_FS_SECURITY_LABEL is not set
> > > > CONFIG_CIFS=3Dm
> > > > # CONFIG_CIFS_STATS2 is not set
> > > > CONFIG_CIFS_ALLOW_INSECURE_LEGACY=3Dy
> > > > CONFIG_CIFS_WEAK_PW_HASH=3Dy
> > > > CONFIG_CIFS_UPCALL=3Dy
> > > > CONFIG_CIFS_XATTR=3Dy
> > > > CONFIG_CIFS_POSIX=3Dy
> > > > CONFIG_CIFS_DEBUG=3Dy
> > > > # CONFIG_CIFS_DEBUG2 is not set
> > > > # CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
> > > > CONFIG_CIFS_DFS_UPCALL=3Dy
> > > > # CONFIG_CIFS_SWN_UPCALL is not set
> > > > # CONFIG_CIFS_SMB_DIRECT is not set
> > > > # CONFIG_CIFS_FSCACHE is not set
> > > > # CONFIG_CODA_FS is not set
> > > > # CONFIG_AFS_FS is not set
> > > > # CONFIG_9P_FS is not set
> > > > CONFIG_NLS=3Dy
> > > > CONFIG_NLS_DEFAULT=3D"utf8"
> > > > CONFIG_NLS_CODEPAGE_437=3Dy
> > > > CONFIG_NLS_CODEPAGE_737=3Dm
> > > > CONFIG_NLS_CODEPAGE_775=3Dm
> > > > CONFIG_NLS_CODEPAGE_850=3Dm
> > > > CONFIG_NLS_CODEPAGE_852=3Dm
> > > > CONFIG_NLS_CODEPAGE_855=3Dm
> > > > CONFIG_NLS_CODEPAGE_857=3Dm
> > > > CONFIG_NLS_CODEPAGE_860=3Dm
> > > > CONFIG_NLS_CODEPAGE_861=3Dm
> > > > CONFIG_NLS_CODEPAGE_862=3Dm
> > > > CONFIG_NLS_CODEPAGE_863=3Dm
> > > > CONFIG_NLS_CODEPAGE_864=3Dm
> > > > CONFIG_NLS_CODEPAGE_865=3Dm
> > > > CONFIG_NLS_CODEPAGE_866=3Dm
> > > > CONFIG_NLS_CODEPAGE_869=3Dm
> > > > CONFIG_NLS_CODEPAGE_936=3Dm
> > > > CONFIG_NLS_CODEPAGE_950=3Dm
> > > > CONFIG_NLS_CODEPAGE_932=3Dm
> > > > CONFIG_NLS_CODEPAGE_949=3Dm
> > > > CONFIG_NLS_CODEPAGE_874=3Dm
> > > > CONFIG_NLS_ISO8859_8=3Dm
> > > > CONFIG_NLS_CODEPAGE_1250=3Dm
> > > > CONFIG_NLS_CODEPAGE_1251=3Dm
> > > > CONFIG_NLS_ASCII=3Dy
> > > > CONFIG_NLS_ISO8859_1=3Dm
> > > > CONFIG_NLS_ISO8859_2=3Dm
> > > > CONFIG_NLS_ISO8859_3=3Dm
> > > > CONFIG_NLS_ISO8859_4=3Dm
> > > > CONFIG_NLS_ISO8859_5=3Dm
> > > > CONFIG_NLS_ISO8859_6=3Dm
> > > > CONFIG_NLS_ISO8859_7=3Dm
> > > > CONFIG_NLS_ISO8859_9=3Dm
> > > > CONFIG_NLS_ISO8859_13=3Dm
> > > > CONFIG_NLS_ISO8859_14=3Dm
> > > > CONFIG_NLS_ISO8859_15=3Dm
> > > > CONFIG_NLS_KOI8_R=3Dm
> > > > CONFIG_NLS_KOI8_U=3Dm
> > > > CONFIG_NLS_MAC_ROMAN=3Dm
> > > > CONFIG_NLS_MAC_CELTIC=3Dm
> > > > CONFIG_NLS_MAC_CENTEURO=3Dm
> > > > CONFIG_NLS_MAC_CROATIAN=3Dm
> > > > CONFIG_NLS_MAC_CYRILLIC=3Dm
> > > > CONFIG_NLS_MAC_GAELIC=3Dm
> > > > CONFIG_NLS_MAC_GREEK=3Dm
> > > > CONFIG_NLS_MAC_ICELAND=3Dm
> > > > CONFIG_NLS_MAC_INUIT=3Dm
> > > > CONFIG_NLS_MAC_ROMANIAN=3Dm
> > > > CONFIG_NLS_MAC_TURKISH=3Dm
> > > > CONFIG_NLS_UTF8=3Dm
> > > > CONFIG_DLM=3Dm
> > > > CONFIG_DLM_DEBUG=3Dy
> > > > # CONFIG_UNICODE is not set
> > > > CONFIG_IO_WQ=3Dy
> > > > # end of File systems
> > > > =

> > > > #
> > > > # Security options
> > > > #
> > > > CONFIG_KEYS=3Dy
> > > > # CONFIG_KEYS_REQUEST_CACHE is not set
> > > > CONFIG_PERSISTENT_KEYRINGS=3Dy
> > > > CONFIG_TRUSTED_KEYS=3Dy
> > > > CONFIG_ENCRYPTED_KEYS=3Dy
> > > > # CONFIG_KEY_DH_OPERATIONS is not set
> > > > # CONFIG_SECURITY_DMESG_RESTRICT is not set
> > > > CONFIG_SECURITY=3Dy
> > > > CONFIG_SECURITY_WRITABLE_HOOKS=3Dy
> > > > CONFIG_SECURITYFS=3Dy
> > > > CONFIG_SECURITY_NETWORK=3Dy
> > > > CONFIG_PAGE_TABLE_ISOLATION=3Dy
> > > > # CONFIG_SECURITY_INFINIBAND is not set
> > > > CONFIG_SECURITY_NETWORK_XFRM=3Dy
> > > > CONFIG_SECURITY_PATH=3Dy
> > > > CONFIG_INTEL_TXT=3Dy
> > > > CONFIG_LSM_MMAP_MIN_ADDR=3D65535
> > > > CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
> > > > CONFIG_HARDENED_USERCOPY=3Dy
> > > > CONFIG_HARDENED_USERCOPY_FALLBACK=3Dy
> > > > CONFIG_FORTIFY_SOURCE=3Dy
> > > > # CONFIG_STATIC_USERMODEHELPER is not set
> > > > CONFIG_SECURITY_SELINUX=3Dy
> > > > CONFIG_SECURITY_SELINUX_BOOTPARAM=3Dy
> > > > CONFIG_SECURITY_SELINUX_DISABLE=3Dy
> > > > CONFIG_SECURITY_SELINUX_DEVELOP=3Dy
> > > > CONFIG_SECURITY_SELINUX_AVC_STATS=3Dy
> > > > CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=3D1
> > > > CONFIG_SECURITY_SELINUX_SIDTAB_HASH_BITS=3D9
> > > > CONFIG_SECURITY_SELINUX_SID2STR_CACHE_SIZE=3D256
> > > > # CONFIG_SECURITY_SMACK is not set
> > > > # CONFIG_SECURITY_TOMOYO is not set
> > > > CONFIG_SECURITY_APPARMOR=3Dy
> > > > CONFIG_SECURITY_APPARMOR_HASH=3Dy
> > > > CONFIG_SECURITY_APPARMOR_HASH_DEFAULT=3Dy
> > > > # CONFIG_SECURITY_APPARMOR_DEBUG is not set
> > > > # CONFIG_SECURITY_APPARMOR_KUNIT_TEST is not set
> > > > # CONFIG_SECURITY_LOADPIN is not set
> > > > CONFIG_SECURITY_YAMA=3Dy
> > > > # CONFIG_SECURITY_SAFESETID is not set
> > > > # CONFIG_SECURITY_LOCKDOWN_LSM is not set
> > > > CONFIG_INTEGRITY=3Dy
> > > > CONFIG_INTEGRITY_SIGNATURE=3Dy
> > > > CONFIG_INTEGRITY_ASYMMETRIC_KEYS=3Dy
> > > > CONFIG_INTEGRITY_TRUSTED_KEYRING=3Dy
> > > > # CONFIG_INTEGRITY_PLATFORM_KEYRING is not set
> > > > CONFIG_INTEGRITY_AUDIT=3Dy
> > > > CONFIG_IMA=3Dy
> > > > CONFIG_IMA_MEASURE_PCR_IDX=3D10
> > > > CONFIG_IMA_LSM_RULES=3Dy
> > > > # CONFIG_IMA_TEMPLATE is not set
> > > > CONFIG_IMA_NG_TEMPLATE=3Dy
> > > > # CONFIG_IMA_SIG_TEMPLATE is not set
> > > > CONFIG_IMA_DEFAULT_TEMPLATE=3D"ima-ng"
> > > > CONFIG_IMA_DEFAULT_HASH_SHA1=3Dy
> > > > # CONFIG_IMA_DEFAULT_HASH_SHA256 is not set
> > > > # CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
> > > > CONFIG_IMA_DEFAULT_HASH=3D"sha1"
> > > > # CONFIG_IMA_WRITE_POLICY is not set
> > > > # CONFIG_IMA_READ_POLICY is not set
> > > > CONFIG_IMA_APPRAISE=3Dy
> > > > # CONFIG_IMA_ARCH_POLICY is not set
> > > > # CONFIG_IMA_APPRAISE_BUILD_POLICY is not set
> > > > CONFIG_IMA_APPRAISE_BOOTPARAM=3Dy
> > > > # CONFIG_IMA_APPRAISE_MODSIG is not set
> > > > CONFIG_IMA_TRUSTED_KEYRING=3Dy
> > > > # CONFIG_IMA_BLACKLIST_KEYRING is not set
> > > > # CONFIG_IMA_LOAD_X509 is not set
> > > > CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS=3Dy
> > > > CONFIG_IMA_QUEUE_EARLY_BOOT_KEYS=3Dy
> > > > # CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
> > > > CONFIG_EVM=3Dy
> > > > CONFIG_EVM_ATTR_FSUUID=3Dy
> > > > # CONFIG_EVM_ADD_XATTRS is not set
> > > > # CONFIG_EVM_LOAD_X509 is not set
> > > > CONFIG_DEFAULT_SECURITY_SELINUX=3Dy
> > > > # CONFIG_DEFAULT_SECURITY_APPARMOR is not set
> > > > # CONFIG_DEFAULT_SECURITY_DAC is not set
> > > > CONFIG_LSM=3D"lockdown,yama,loadpin,safesetid,integrity,selinux,sma=
ck,tomoyo,apparmor,bpf"
> > > > =

> > > > #
> > > > # Kernel hardening options
> > > > #
> > > > =

> > > > #
> > > > # Memory initialization
> > > > #
> > > > CONFIG_INIT_STACK_NONE=3Dy
> > > > # CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
> > > > # CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
> > > > # end of Memory initialization
> > > > # end of Kernel hardening options
> > > > # end of Security options
> > > > =

> > > > CONFIG_XOR_BLOCKS=3Dm
> > > > CONFIG_ASYNC_CORE=3Dm
> > > > CONFIG_ASYNC_MEMCPY=3Dm
> > > > CONFIG_ASYNC_XOR=3Dm
> > > > CONFIG_ASYNC_PQ=3Dm
> > > > CONFIG_ASYNC_RAID6_RECOV=3Dm
> > > > CONFIG_CRYPTO=3Dy
> > > > =

> > > > #
> > > > # Crypto core or helper
> > > > #
> > > > CONFIG_CRYPTO_ALGAPI=3Dy
> > > > CONFIG_CRYPTO_ALGAPI2=3Dy
> > > > CONFIG_CRYPTO_AEAD=3Dy
> > > > CONFIG_CRYPTO_AEAD2=3Dy
> > > > CONFIG_CRYPTO_SKCIPHER=3Dy
> > > > CONFIG_CRYPTO_SKCIPHER2=3Dy
> > > > CONFIG_CRYPTO_HASH=3Dy
> > > > CONFIG_CRYPTO_HASH2=3Dy
> > > > CONFIG_CRYPTO_RNG=3Dy
> > > > CONFIG_CRYPTO_RNG2=3Dy
> > > > CONFIG_CRYPTO_RNG_DEFAULT=3Dy
> > > > CONFIG_CRYPTO_AKCIPHER2=3Dy
> > > > CONFIG_CRYPTO_AKCIPHER=3Dy
> > > > CONFIG_CRYPTO_KPP2=3Dy
> > > > CONFIG_CRYPTO_KPP=3Dm
> > > > CONFIG_CRYPTO_ACOMP2=3Dy
> > > > CONFIG_CRYPTO_MANAGER=3Dy
> > > > CONFIG_CRYPTO_MANAGER2=3Dy
> > > > CONFIG_CRYPTO_USER=3Dm
> > > > CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> > > > CONFIG_CRYPTO_GF128MUL=3Dy
> > > > CONFIG_CRYPTO_NULL=3Dy
> > > > CONFIG_CRYPTO_NULL2=3Dy
> > > > CONFIG_CRYPTO_PCRYPT=3Dm
> > > > CONFIG_CRYPTO_CRYPTD=3Dy
> > > > CONFIG_CRYPTO_AUTHENC=3Dm
> > > > CONFIG_CRYPTO_TEST=3Dm
> > > > CONFIG_CRYPTO_SIMD=3Dy
> > > > =

> > > > #
> > > > # Public-key cryptography
> > > > #
> > > > CONFIG_CRYPTO_RSA=3Dy
> > > > CONFIG_CRYPTO_DH=3Dm
> > > > CONFIG_CRYPTO_ECC=3Dm
> > > > CONFIG_CRYPTO_ECDH=3Dm
> > > > # CONFIG_CRYPTO_ECRDSA is not set
> > > > # CONFIG_CRYPTO_SM2 is not set
> > > > # CONFIG_CRYPTO_CURVE25519 is not set
> > > > # CONFIG_CRYPTO_CURVE25519_X86 is not set
> > > > =

> > > > #
> > > > # Authenticated Encryption with Associated Data
> > > > #
> > > > CONFIG_CRYPTO_CCM=3Dm
> > > > CONFIG_CRYPTO_GCM=3Dy
> > > > CONFIG_CRYPTO_CHACHA20POLY1305=3Dm
> > > > # CONFIG_CRYPTO_AEGIS128 is not set
> > > > # CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
> > > > CONFIG_CRYPTO_SEQIV=3Dy
> > > > CONFIG_CRYPTO_ECHAINIV=3Dm
> > > > =

> > > > #
> > > > # Block modes
> > > > #
> > > > CONFIG_CRYPTO_CBC=3Dy
> > > > CONFIG_CRYPTO_CFB=3Dy
> > > > CONFIG_CRYPTO_CTR=3Dy
> > > > CONFIG_CRYPTO_CTS=3Dy
> > > > CONFIG_CRYPTO_ECB=3Dy
> > > > CONFIG_CRYPTO_LRW=3Dm
> > > > # CONFIG_CRYPTO_OFB is not set
> > > > CONFIG_CRYPTO_PCBC=3Dm
> > > > CONFIG_CRYPTO_XTS=3Dy
> > > > # CONFIG_CRYPTO_KEYWRAP is not set
> > > > # CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
> > > > # CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
> > > > # CONFIG_CRYPTO_ADIANTUM is not set
> > > > CONFIG_CRYPTO_ESSIV=3Dm
> > > > =

> > > > #
> > > > # Hash modes
> > > > #
> > > > CONFIG_CRYPTO_CMAC=3Dm
> > > > CONFIG_CRYPTO_HMAC=3Dy
> > > > CONFIG_CRYPTO_XCBC=3Dm
> > > > CONFIG_CRYPTO_VMAC=3Dm
> > > > =

> > > > #
> > > > # Digest
> > > > #
> > > > CONFIG_CRYPTO_CRC32C=3Dy
> > > > CONFIG_CRYPTO_CRC32C_INTEL=3Dm
> > > > CONFIG_CRYPTO_CRC32=3Dm
> > > > CONFIG_CRYPTO_CRC32_PCLMUL=3Dm
> > > > CONFIG_CRYPTO_XXHASH=3Dm
> > > > CONFIG_CRYPTO_BLAKE2B=3Dm
> > > > # CONFIG_CRYPTO_BLAKE2S is not set
> > > > # CONFIG_CRYPTO_BLAKE2S_X86 is not set
> > > > CONFIG_CRYPTO_CRCT10DIF=3Dy
> > > > CONFIG_CRYPTO_CRCT10DIF_PCLMUL=3Dm
> > > > CONFIG_CRYPTO_GHASH=3Dy
> > > > CONFIG_CRYPTO_POLY1305=3Dm
> > > > CONFIG_CRYPTO_POLY1305_X86_64=3Dm
> > > > CONFIG_CRYPTO_MD4=3Dm
> > > > CONFIG_CRYPTO_MD5=3Dy
> > > > CONFIG_CRYPTO_MICHAEL_MIC=3Dm
> > > > CONFIG_CRYPTO_RMD160=3Dm
> > > > CONFIG_CRYPTO_SHA1=3Dy
> > > > CONFIG_CRYPTO_SHA1_SSSE3=3Dy
> > > > CONFIG_CRYPTO_SHA256_SSSE3=3Dy
> > > > CONFIG_CRYPTO_SHA512_SSSE3=3Dm
> > > > CONFIG_CRYPTO_SHA256=3Dy
> > > > CONFIG_CRYPTO_SHA512=3Dy
> > > > CONFIG_CRYPTO_SHA3=3Dm
> > > > # CONFIG_CRYPTO_SM3 is not set
> > > > # CONFIG_CRYPTO_STREEBOG is not set
> > > > CONFIG_CRYPTO_WP512=3Dm
> > > > CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=3Dm
> > > > =

> > > > #
> > > > # Ciphers
> > > > #
> > > > CONFIG_CRYPTO_AES=3Dy
> > > > # CONFIG_CRYPTO_AES_TI is not set
> > > > CONFIG_CRYPTO_AES_NI_INTEL=3Dy
> > > > CONFIG_CRYPTO_ANUBIS=3Dm
> > > > CONFIG_CRYPTO_ARC4=3Dm
> > > > CONFIG_CRYPTO_BLOWFISH=3Dm
> > > > CONFIG_CRYPTO_BLOWFISH_COMMON=3Dm
> > > > CONFIG_CRYPTO_BLOWFISH_X86_64=3Dm
> > > > CONFIG_CRYPTO_CAMELLIA=3Dm
> > > > CONFIG_CRYPTO_CAMELLIA_X86_64=3Dm
> > > > CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=3Dm
> > > > CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=3Dm
> > > > CONFIG_CRYPTO_CAST_COMMON=3Dm
> > > > CONFIG_CRYPTO_CAST5=3Dm
> > > > CONFIG_CRYPTO_CAST5_AVX_X86_64=3Dm
> > > > CONFIG_CRYPTO_CAST6=3Dm
> > > > CONFIG_CRYPTO_CAST6_AVX_X86_64=3Dm
> > > > CONFIG_CRYPTO_DES=3Dm
> > > > CONFIG_CRYPTO_DES3_EDE_X86_64=3Dm
> > > > CONFIG_CRYPTO_FCRYPT=3Dm
> > > > CONFIG_CRYPTO_KHAZAD=3Dm
> > > > CONFIG_CRYPTO_CHACHA20=3Dm
> > > > CONFIG_CRYPTO_CHACHA20_X86_64=3Dm
> > > > CONFIG_CRYPTO_SEED=3Dm
> > > > CONFIG_CRYPTO_SERPENT=3Dm
> > > > CONFIG_CRYPTO_SERPENT_SSE2_X86_64=3Dm
> > > > CONFIG_CRYPTO_SERPENT_AVX_X86_64=3Dm
> > > > CONFIG_CRYPTO_SERPENT_AVX2_X86_64=3Dm
> > > > # CONFIG_CRYPTO_SM4 is not set
> > > > CONFIG_CRYPTO_TEA=3Dm
> > > > CONFIG_CRYPTO_TWOFISH=3Dm
> > > > CONFIG_CRYPTO_TWOFISH_COMMON=3Dm
> > > > CONFIG_CRYPTO_TWOFISH_X86_64=3Dm
> > > > CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dm
> > > > CONFIG_CRYPTO_TWOFISH_AVX_X86_64=3Dm
> > > > =

> > > > #
> > > > # Compression
> > > > #
> > > > CONFIG_CRYPTO_DEFLATE=3Dy
> > > > CONFIG_CRYPTO_LZO=3Dy
> > > > # CONFIG_CRYPTO_842 is not set
> > > > # CONFIG_CRYPTO_LZ4 is not set
> > > > # CONFIG_CRYPTO_LZ4HC is not set
> > > > # CONFIG_CRYPTO_ZSTD is not set
> > > > =

> > > > #
> > > > # Random Number Generation
> > > > #
> > > > CONFIG_CRYPTO_ANSI_CPRNG=3Dm
> > > > CONFIG_CRYPTO_DRBG_MENU=3Dy
> > > > CONFIG_CRYPTO_DRBG_HMAC=3Dy
> > > > CONFIG_CRYPTO_DRBG_HASH=3Dy
> > > > CONFIG_CRYPTO_DRBG_CTR=3Dy
> > > > CONFIG_CRYPTO_DRBG=3Dy
> > > > CONFIG_CRYPTO_JITTERENTROPY=3Dy
> > > > CONFIG_CRYPTO_USER_API=3Dy
> > > > CONFIG_CRYPTO_USER_API_HASH=3Dy
> > > > CONFIG_CRYPTO_USER_API_SKCIPHER=3Dy
> > > > CONFIG_CRYPTO_USER_API_RNG=3Dy
> > > > # CONFIG_CRYPTO_USER_API_RNG_CAVP is not set
> > > > CONFIG_CRYPTO_USER_API_AEAD=3Dy
> > > > CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=3Dy
> > > > # CONFIG_CRYPTO_STATS is not set
> > > > CONFIG_CRYPTO_HASH_INFO=3Dy
> > > > =

> > > > #
> > > > # Crypto library routines
> > > > #
> > > > CONFIG_CRYPTO_LIB_AES=3Dy
> > > > CONFIG_CRYPTO_LIB_ARC4=3Dm
> > > > # CONFIG_CRYPTO_LIB_BLAKE2S is not set
> > > > CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=3Dm
> > > > CONFIG_CRYPTO_LIB_CHACHA_GENERIC=3Dm
> > > > # CONFIG_CRYPTO_LIB_CHACHA is not set
> > > > # CONFIG_CRYPTO_LIB_CURVE25519 is not set
> > > > CONFIG_CRYPTO_LIB_DES=3Dm
> > > > CONFIG_CRYPTO_LIB_POLY1305_RSIZE=3D11
> > > > CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305=3Dm
> > > > CONFIG_CRYPTO_LIB_POLY1305_GENERIC=3Dm
> > > > # CONFIG_CRYPTO_LIB_POLY1305 is not set
> > > > # CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
> > > > CONFIG_CRYPTO_LIB_SHA256=3Dy
> > > > CONFIG_CRYPTO_HW=3Dy
> > > > CONFIG_CRYPTO_DEV_PADLOCK=3Dm
> > > > CONFIG_CRYPTO_DEV_PADLOCK_AES=3Dm
> > > > CONFIG_CRYPTO_DEV_PADLOCK_SHA=3Dm
> > > > # CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
> > > > # CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
> > > > CONFIG_CRYPTO_DEV_CCP=3Dy
> > > > CONFIG_CRYPTO_DEV_CCP_DD=3Dm
> > > > CONFIG_CRYPTO_DEV_SP_CCP=3Dy
> > > > CONFIG_CRYPTO_DEV_CCP_CRYPTO=3Dm
> > > > CONFIG_CRYPTO_DEV_SP_PSP=3Dy
> > > > # CONFIG_CRYPTO_DEV_CCP_DEBUGFS is not set
> > > > CONFIG_CRYPTO_DEV_QAT=3Dm
> > > > CONFIG_CRYPTO_DEV_QAT_DH895xCC=3Dm
> > > > CONFIG_CRYPTO_DEV_QAT_C3XXX=3Dm
> > > > CONFIG_CRYPTO_DEV_QAT_C62X=3Dm
> > > > # CONFIG_CRYPTO_DEV_QAT_4XXX is not set
> > > > CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=3Dm
> > > > CONFIG_CRYPTO_DEV_QAT_C3XXXVF=3Dm
> > > > CONFIG_CRYPTO_DEV_QAT_C62XVF=3Dm
> > > > CONFIG_CRYPTO_DEV_NITROX=3Dm
> > > > CONFIG_CRYPTO_DEV_NITROX_CNN55XX=3Dm
> > > > # CONFIG_CRYPTO_DEV_VIRTIO is not set
> > > > # CONFIG_CRYPTO_DEV_SAFEXCEL is not set
> > > > # CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
> > > > CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> > > > CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> > > > # CONFIG_ASYMMETRIC_TPM_KEY_SUBTYPE is not set
> > > > CONFIG_X509_CERTIFICATE_PARSER=3Dy
> > > > # CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
> > > > CONFIG_PKCS7_MESSAGE_PARSER=3Dy
> > > > # CONFIG_PKCS7_TEST_KEY is not set
> > > > CONFIG_SIGNED_PE_FILE_VERIFICATION=3Dy
> > > > =

> > > > #
> > > > # Certificates for signature checking
> > > > #
> > > > CONFIG_MODULE_SIG_KEY=3D"certs/signing_key.pem"
> > > > CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> > > > CONFIG_SYSTEM_TRUSTED_KEYS=3D""
> > > > # CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
> > > > # CONFIG_SECONDARY_TRUSTED_KEYRING is not set
> > > > CONFIG_SYSTEM_BLACKLIST_KEYRING=3Dy
> > > > CONFIG_SYSTEM_BLACKLIST_HASH_LIST=3D""
> > > > # end of Certificates for signature checking
> > > > =

> > > > CONFIG_BINARY_PRINTF=3Dy
> > > > =

> > > > #
> > > > # Library routines
> > > > #
> > > > CONFIG_RAID6_PQ=3Dm
> > > > CONFIG_RAID6_PQ_BENCHMARK=3Dy
> > > > # CONFIG_PACKING is not set
> > > > CONFIG_BITREVERSE=3Dy
> > > > CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> > > > CONFIG_GENERIC_STRNLEN_USER=3Dy
> > > > CONFIG_GENERIC_NET_UTILS=3Dy
> > > > CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
> > > > CONFIG_CORDIC=3Dm
> > > > # CONFIG_PRIME_NUMBERS is not set
> > > > CONFIG_RATIONAL=3Dy
> > > > CONFIG_GENERIC_PCI_IOMAP=3Dy
> > > > CONFIG_GENERIC_IOMAP=3Dy
> > > > CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
> > > > CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> > > > CONFIG_ARCH_USE_SYM_ANNOTATIONS=3Dy
> > > > CONFIG_CRC_CCITT=3Dy
> > > > CONFIG_CRC16=3Dy
> > > > CONFIG_CRC_T10DIF=3Dy
> > > > CONFIG_CRC_ITU_T=3Dm
> > > > CONFIG_CRC32=3Dy
> > > > # CONFIG_CRC32_SELFTEST is not set
> > > > CONFIG_CRC32_SLICEBY8=3Dy
> > > > # CONFIG_CRC32_SLICEBY4 is not set
> > > > # CONFIG_CRC32_SARWATE is not set
> > > > # CONFIG_CRC32_BIT is not set
> > > > # CONFIG_CRC64 is not set
> > > > # CONFIG_CRC4 is not set
> > > > CONFIG_CRC7=3Dm
> > > > CONFIG_LIBCRC32C=3Dm
> > > > CONFIG_CRC8=3Dm
> > > > CONFIG_XXHASH=3Dy
> > > > # CONFIG_RANDOM32_SELFTEST is not set
> > > > CONFIG_ZLIB_INFLATE=3Dy
> > > > CONFIG_ZLIB_DEFLATE=3Dy
> > > > CONFIG_LZO_COMPRESS=3Dy
> > > > CONFIG_LZO_DECOMPRESS=3Dy
> > > > CONFIG_LZ4_DECOMPRESS=3Dy
> > > > CONFIG_ZSTD_COMPRESS=3Dm
> > > > CONFIG_ZSTD_DECOMPRESS=3Dy
> > > > CONFIG_XZ_DEC=3Dy
> > > > CONFIG_XZ_DEC_X86=3Dy
> > > > CONFIG_XZ_DEC_POWERPC=3Dy
> > > > CONFIG_XZ_DEC_IA64=3Dy
> > > > CONFIG_XZ_DEC_ARM=3Dy
> > > > CONFIG_XZ_DEC_ARMTHUMB=3Dy
> > > > CONFIG_XZ_DEC_SPARC=3Dy
> > > > CONFIG_XZ_DEC_BCJ=3Dy
> > > > # CONFIG_XZ_DEC_TEST is not set
> > > > CONFIG_DECOMPRESS_GZIP=3Dy
> > > > CONFIG_DECOMPRESS_BZIP2=3Dy
> > > > CONFIG_DECOMPRESS_LZMA=3Dy
> > > > CONFIG_DECOMPRESS_XZ=3Dy
> > > > CONFIG_DECOMPRESS_LZO=3Dy
> > > > CONFIG_DECOMPRESS_LZ4=3Dy
> > > > CONFIG_DECOMPRESS_ZSTD=3Dy
> > > > CONFIG_GENERIC_ALLOCATOR=3Dy
> > > > CONFIG_REED_SOLOMON=3Dm
> > > > CONFIG_REED_SOLOMON_ENC8=3Dy
> > > > CONFIG_REED_SOLOMON_DEC8=3Dy
> > > > CONFIG_TEXTSEARCH=3Dy
> > > > CONFIG_TEXTSEARCH_KMP=3Dm
> > > > CONFIG_TEXTSEARCH_BM=3Dm
> > > > CONFIG_TEXTSEARCH_FSM=3Dm
> > > > CONFIG_INTERVAL_TREE=3Dy
> > > > CONFIG_XARRAY_MULTI=3Dy
> > > > CONFIG_ASSOCIATIVE_ARRAY=3Dy
> > > > CONFIG_HAS_IOMEM=3Dy
> > > > CONFIG_HAS_IOPORT_MAP=3Dy
> > > > CONFIG_HAS_DMA=3Dy
> > > > CONFIG_DMA_OPS=3Dy
> > > > CONFIG_NEED_SG_DMA_LENGTH=3Dy
> > > > CONFIG_NEED_DMA_MAP_STATE=3Dy
> > > > CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> > > > CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED=3Dy
> > > > CONFIG_SWIOTLB=3Dy
> > > > CONFIG_DMA_COHERENT_POOL=3Dy
> > > > CONFIG_DMA_CMA=3Dy
> > > > # CONFIG_DMA_PERNUMA_CMA is not set
> > > > =

> > > > #
> > > > # Default contiguous memory area size:
> > > > #
> > > > CONFIG_CMA_SIZE_MBYTES=3D200
> > > > CONFIG_CMA_SIZE_SEL_MBYTES=3Dy
> > > > # CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
> > > > # CONFIG_CMA_SIZE_SEL_MIN is not set
> > > > # CONFIG_CMA_SIZE_SEL_MAX is not set
> > > > CONFIG_CMA_ALIGNMENT=3D8
> > > > # CONFIG_DMA_API_DEBUG is not set
> > > > # CONFIG_DMA_MAP_BENCHMARK is not set
> > > > CONFIG_SGL_ALLOC=3Dy
> > > > CONFIG_CHECK_SIGNATURE=3Dy
> > > > CONFIG_CPUMASK_OFFSTACK=3Dy
> > > > CONFIG_CPU_RMAP=3Dy
> > > > CONFIG_DQL=3Dy
> > > > CONFIG_GLOB=3Dy
> > > > # CONFIG_GLOB_SELFTEST is not set
> > > > CONFIG_NLATTR=3Dy
> > > > CONFIG_CLZ_TAB=3Dy
> > > > CONFIG_IRQ_POLL=3Dy
> > > > CONFIG_MPILIB=3Dy
> > > > CONFIG_SIGNATURE=3Dy
> > > > CONFIG_DIMLIB=3Dy
> > > > CONFIG_OID_REGISTRY=3Dy
> > > > CONFIG_UCS2_STRING=3Dy
> > > > CONFIG_HAVE_GENERIC_VDSO=3Dy
> > > > CONFIG_GENERIC_GETTIMEOFDAY=3Dy
> > > > CONFIG_GENERIC_VDSO_TIME_NS=3Dy
> > > > CONFIG_FONT_SUPPORT=3Dy
> > > > # CONFIG_FONTS is not set
> > > > CONFIG_FONT_8x8=3Dy
> > > > CONFIG_FONT_8x16=3Dy
> > > > CONFIG_SG_POOL=3Dy
> > > > CONFIG_ARCH_HAS_PMEM_API=3Dy
> > > > CONFIG_MEMREGION=3Dy
> > > > CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=3Dy
> > > > CONFIG_ARCH_HAS_COPY_MC=3Dy
> > > > CONFIG_ARCH_STACKWALK=3Dy
> > > > CONFIG_SBITMAP=3Dy
> > > > # CONFIG_STRING_SELFTEST is not set
> > > > # end of Library routines
> > > > =

> > > > #
> > > > # Kernel hacking
> > > > #
> > > > =

> > > > #
> > > > # printk and dmesg options
> > > > #
> > > > CONFIG_PRINTK_TIME=3Dy
> > > > # CONFIG_PRINTK_CALLER is not set
> > > > CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> > > > CONFIG_CONSOLE_LOGLEVEL_QUIET=3D4
> > > > CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> > > > CONFIG_BOOT_PRINTK_DELAY=3Dy
> > > > CONFIG_DYNAMIC_DEBUG=3Dy
> > > > CONFIG_DYNAMIC_DEBUG_CORE=3Dy
> > > > CONFIG_SYMBOLIC_ERRNAME=3Dy
> > > > CONFIG_DEBUG_BUGVERBOSE=3Dy
> > > > # end of printk and dmesg options
> > > > =

> > > > #
> > > > # Compile-time checks and compiler options
> > > > #
> > > > CONFIG_DEBUG_INFO=3Dy
> > > > CONFIG_DEBUG_INFO_REDUCED=3Dy
> > > > # CONFIG_DEBUG_INFO_COMPRESSED is not set
> > > > # CONFIG_DEBUG_INFO_SPLIT is not set
> > > > # CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
> > > > CONFIG_DEBUG_INFO_DWARF4=3Dy
> > > > # CONFIG_DEBUG_INFO_DWARF5 is not set
> > > > CONFIG_PAHOLE_HAS_SPLIT_BTF=3Dy
> > > > # CONFIG_GDB_SCRIPTS is not set
> > > > CONFIG_FRAME_WARN=3D2048
> > > > CONFIG_STRIP_ASM_SYMS=3Dy
> > > > # CONFIG_READABLE_ASM is not set
> > > > # CONFIG_HEADERS_INSTALL is not set
> > > > CONFIG_DEBUG_SECTION_MISMATCH=3Dy
> > > > CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
> > > > CONFIG_STACK_VALIDATION=3Dy
> > > > # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> > > > # end of Compile-time checks and compiler options
> > > > =

> > > > #
> > > > # Generic Kernel Debugging Instruments
> > > > #
> > > > CONFIG_MAGIC_SYSRQ=3Dy
> > > > CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> > > > CONFIG_MAGIC_SYSRQ_SERIAL=3Dy
> > > > CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=3D""
> > > > CONFIG_DEBUG_FS=3Dy
> > > > CONFIG_DEBUG_FS_ALLOW_ALL=3Dy
> > > > # CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
> > > > # CONFIG_DEBUG_FS_ALLOW_NONE is not set
> > > > CONFIG_HAVE_ARCH_KGDB=3Dy
> > > > # CONFIG_KGDB is not set
> > > > CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> > > > # CONFIG_UBSAN is not set
> > > > CONFIG_HAVE_ARCH_KCSAN=3Dy
> > > > # end of Generic Kernel Debugging Instruments
> > > > =

> > > > CONFIG_DEBUG_KERNEL=3Dy
> > > > CONFIG_DEBUG_MISC=3Dy
> > > > =

> > > > #
> > > > # Memory Debugging
> > > > #
> > > > # CONFIG_PAGE_EXTENSION is not set
> > > > # CONFIG_DEBUG_PAGEALLOC is not set
> > > > # CONFIG_PAGE_OWNER is not set
> > > > # CONFIG_PAGE_POISONING is not set
> > > > # CONFIG_DEBUG_PAGE_REF is not set
> > > > # CONFIG_DEBUG_RODATA_TEST is not set
> > > > CONFIG_ARCH_HAS_DEBUG_WX=3Dy
> > > > # CONFIG_DEBUG_WX is not set
> > > > CONFIG_GENERIC_PTDUMP=3Dy
> > > > # CONFIG_PTDUMP_DEBUGFS is not set
> > > > # CONFIG_DEBUG_OBJECTS is not set
> > > > # CONFIG_SLUB_DEBUG_ON is not set
> > > > # CONFIG_SLUB_STATS is not set
> > > > CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> > > > # CONFIG_DEBUG_KMEMLEAK is not set
> > > > # CONFIG_DEBUG_STACK_USAGE is not set
> > > > # CONFIG_SCHED_STACK_END_CHECK is not set
> > > > CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=3Dy
> > > > # CONFIG_DEBUG_VM is not set
> > > > # CONFIG_DEBUG_VM_PGTABLE is not set
> > > > CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> > > > # CONFIG_DEBUG_VIRTUAL is not set
> > > > CONFIG_DEBUG_MEMORY_INIT=3Dy
> > > > # CONFIG_DEBUG_PER_CPU_MAPS is not set
> > > > CONFIG_HAVE_ARCH_KASAN=3Dy
> > > > CONFIG_HAVE_ARCH_KASAN_VMALLOC=3Dy
> > > > CONFIG_CC_HAS_KASAN_GENERIC=3Dy
> > > > CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=3Dy
> > > > # CONFIG_KASAN is not set
> > > > CONFIG_HAVE_ARCH_KFENCE=3Dy
> > > > # CONFIG_KFENCE is not set
> > > > # end of Memory Debugging
> > > > =

> > > > CONFIG_DEBUG_SHIRQ=3Dy
> > > > =

> > > > #
> > > > # Debug Oops, Lockups and Hangs
> > > > #
> > > > CONFIG_PANIC_ON_OOPS=3Dy
> > > > CONFIG_PANIC_ON_OOPS_VALUE=3D1
> > > > CONFIG_PANIC_TIMEOUT=3D0
> > > > CONFIG_LOCKUP_DETECTOR=3Dy
> > > > CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> > > > # CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> > > > CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
> > > > CONFIG_HARDLOCKUP_DETECTOR_PERF=3Dy
> > > > CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=3Dy
> > > > CONFIG_HARDLOCKUP_DETECTOR=3Dy
> > > > CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=3Dy
> > > > CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=3D1
> > > > # CONFIG_DETECT_HUNG_TASK is not set
> > > > # CONFIG_WQ_WATCHDOG is not set
> > > > # CONFIG_TEST_LOCKUP is not set
> > > > # end of Debug Oops, Lockups and Hangs
> > > > =

> > > > #
> > > > # Scheduler Debugging
> > > > #
> > > > CONFIG_SCHED_DEBUG=3Dy
> > > > CONFIG_SCHED_INFO=3Dy
> > > > CONFIG_SCHEDSTATS=3Dy
> > > > # end of Scheduler Debugging
> > > > =

> > > > # CONFIG_DEBUG_TIMEKEEPING is not set
> > > > =

> > > > #
> > > > # Lock Debugging (spinlocks, mutexes, etc...)
> > > > #
> > > > CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
> > > > # CONFIG_PROVE_LOCKING is not set
> > > > # CONFIG_LOCK_STAT is not set
> > > > # CONFIG_DEBUG_RT_MUTEXES is not set
> > > > # CONFIG_DEBUG_SPINLOCK is not set
> > > > # CONFIG_DEBUG_MUTEXES is not set
> > > > # CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
> > > > # CONFIG_DEBUG_RWSEMS is not set
> > > > # CONFIG_DEBUG_LOCK_ALLOC is not set
> > > > CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> > > > # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> > > > CONFIG_LOCK_TORTURE_TEST=3Dm
> > > > # CONFIG_WW_MUTEX_SELFTEST is not set
> > > > # CONFIG_SCF_TORTURE_TEST is not set
> > > > # CONFIG_CSD_LOCK_WAIT_DEBUG is not set
> > > > # end of Lock Debugging (spinlocks, mutexes, etc...)
> > > > =

> > > > # CONFIG_DEBUG_IRQFLAGS is not set
> > > > CONFIG_STACKTRACE=3Dy
> > > > # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
> > > > # CONFIG_DEBUG_KOBJECT is not set
> > > > =

> > > > #
> > > > # Debug kernel data structures
> > > > #
> > > > CONFIG_DEBUG_LIST=3Dy
> > > > # CONFIG_DEBUG_PLIST is not set
> > > > # CONFIG_DEBUG_SG is not set
> > > > # CONFIG_DEBUG_NOTIFIERS is not set
> > > > CONFIG_BUG_ON_DATA_CORRUPTION=3Dy
> > > > # end of Debug kernel data structures
> > > > =

> > > > # CONFIG_DEBUG_CREDENTIALS is not set
> > > > =

> > > > #
> > > > # RCU Debugging
> > > > #
> > > > CONFIG_TORTURE_TEST=3Dm
> > > > CONFIG_RCU_SCALE_TEST=3Dm
> > > > CONFIG_RCU_TORTURE_TEST=3Dm
> > > > # CONFIG_RCU_REF_SCALE_TEST is not set
> > > > CONFIG_RCU_CPU_STALL_TIMEOUT=3D60
> > > > # CONFIG_RCU_TRACE is not set
> > > > # CONFIG_RCU_EQS_DEBUG is not set
> > > > # end of RCU Debugging
> > > > =

> > > > # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> > > > # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
> > > > # CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
> > > > CONFIG_LATENCYTOP=3Dy
> > > > CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> > > > CONFIG_NOP_TRACER=3Dy
> > > > CONFIG_HAVE_FUNCTION_TRACER=3Dy
> > > > CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> > > > CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> > > > CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> > > > CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> > > > CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=3Dy
> > > > CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> > > > CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> > > > CONFIG_HAVE_FENTRY=3Dy
> > > > CONFIG_HAVE_OBJTOOL_MCOUNT=3Dy
> > > > CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> > > > CONFIG_TRACER_MAX_TRACE=3Dy
> > > > CONFIG_TRACE_CLOCK=3Dy
> > > > CONFIG_RING_BUFFER=3Dy
> > > > CONFIG_EVENT_TRACING=3Dy
> > > > CONFIG_CONTEXT_SWITCH_TRACER=3Dy
> > > > CONFIG_TRACING=3Dy
> > > > CONFIG_GENERIC_TRACER=3Dy
> > > > CONFIG_TRACING_SUPPORT=3Dy
> > > > CONFIG_FTRACE=3Dy
> > > > # CONFIG_BOOTTIME_TRACING is not set
> > > > CONFIG_FUNCTION_TRACER=3Dy
> > > > CONFIG_FUNCTION_GRAPH_TRACER=3Dy
> > > > CONFIG_DYNAMIC_FTRACE=3Dy
> > > > CONFIG_DYNAMIC_FTRACE_WITH_REGS=3Dy
> > > > CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> > > > CONFIG_FUNCTION_PROFILER=3Dy
> > > > CONFIG_STACK_TRACER=3Dy
> > > > # CONFIG_IRQSOFF_TRACER is not set
> > > > CONFIG_SCHED_TRACER=3Dy
> > > > CONFIG_HWLAT_TRACER=3Dy
> > > > # CONFIG_MMIOTRACE is not set
> > > > CONFIG_FTRACE_SYSCALLS=3Dy
> > > > CONFIG_TRACER_SNAPSHOT=3Dy
> > > > # CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
> > > > CONFIG_BRANCH_PROFILE_NONE=3Dy
> > > > # CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
> > > > CONFIG_BLK_DEV_IO_TRACE=3Dy
> > > > CONFIG_KPROBE_EVENTS=3Dy
> > > > # CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
> > > > CONFIG_UPROBE_EVENTS=3Dy
> > > > CONFIG_BPF_EVENTS=3Dy
> > > > CONFIG_DYNAMIC_EVENTS=3Dy
> > > > CONFIG_PROBE_EVENTS=3Dy
> > > > # CONFIG_BPF_KPROBE_OVERRIDE is not set
> > > > CONFIG_FTRACE_MCOUNT_RECORD=3Dy
> > > > CONFIG_FTRACE_MCOUNT_USE_CC=3Dy
> > > > CONFIG_TRACING_MAP=3Dy
> > > > CONFIG_SYNTH_EVENTS=3Dy
> > > > CONFIG_HIST_TRIGGERS=3Dy
> > > > # CONFIG_TRACE_EVENT_INJECT is not set
> > > > # CONFIG_TRACEPOINT_BENCHMARK is not set
> > > > CONFIG_RING_BUFFER_BENCHMARK=3Dm
> > > > # CONFIG_TRACE_EVAL_MAP_FILE is not set
> > > > # CONFIG_FTRACE_RECORD_RECURSION is not set
> > > > # CONFIG_FTRACE_STARTUP_TEST is not set
> > > > # CONFIG_RING_BUFFER_STARTUP_TEST is not set
> > > > # CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
> > > > # CONFIG_PREEMPTIRQ_DELAY_TEST is not set
> > > > # CONFIG_SYNTH_EVENT_GEN_TEST is not set
> > > > # CONFIG_KPROBE_EVENT_GEN_TEST is not set
> > > > # CONFIG_HIST_TRIGGERS_DEBUG is not set
> > > > CONFIG_PROVIDE_OHCI1394_DMA_INIT=3Dy
> > > > # CONFIG_SAMPLES is not set
> > > > CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> > > > CONFIG_STRICT_DEVMEM=3Dy
> > > > # CONFIG_IO_STRICT_DEVMEM is not set
> > > > =

> > > > #
> > > > # x86 Debugging
> > > > #
> > > > CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> > > > CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=3Dy
> > > > CONFIG_EARLY_PRINTK_USB=3Dy
> > > > CONFIG_X86_VERBOSE_BOOTUP=3Dy
> > > > CONFIG_EARLY_PRINTK=3Dy
> > > > CONFIG_EARLY_PRINTK_DBGP=3Dy
> > > > CONFIG_EARLY_PRINTK_USB_XDBC=3Dy
> > > > # CONFIG_EFI_PGT_DUMP is not set
> > > > # CONFIG_DEBUG_TLBFLUSH is not set
> > > > CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> > > > CONFIG_X86_DECODER_SELFTEST=3Dy
> > > > CONFIG_IO_DELAY_0X80=3Dy
> > > > # CONFIG_IO_DELAY_0XED is not set
> > > > # CONFIG_IO_DELAY_UDELAY is not set
> > > > # CONFIG_IO_DELAY_NONE is not set
> > > > CONFIG_DEBUG_BOOT_PARAMS=3Dy
> > > > # CONFIG_CPA_DEBUG is not set
> > > > # CONFIG_DEBUG_ENTRY is not set
> > > > # CONFIG_DEBUG_NMI_SELFTEST is not set
> > > > # CONFIG_X86_DEBUG_FPU is not set
> > > > # CONFIG_PUNIT_ATOM_DEBUG is not set
> > > > CONFIG_UNWINDER_ORC=3Dy
> > > > # CONFIG_UNWINDER_FRAME_POINTER is not set
> > > > # end of x86 Debugging
> > > > =

> > > > #
> > > > # Kernel Testing and Coverage
> > > > #
> > > > CONFIG_KUNIT=3Dy
> > > > # CONFIG_KUNIT_DEBUGFS is not set
> > > > CONFIG_KUNIT_TEST=3Dm
> > > > CONFIG_KUNIT_EXAMPLE_TEST=3Dm
> > > > # CONFIG_KUNIT_ALL_TESTS is not set
> > > > # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> > > > CONFIG_FUNCTION_ERROR_INJECTION=3Dy
> > > > CONFIG_FAULT_INJECTION=3Dy
> > > > # CONFIG_FAILSLAB is not set
> > > > # CONFIG_FAIL_PAGE_ALLOC is not set
> > > > # CONFIG_FAULT_INJECTION_USERCOPY is not set
> > > > CONFIG_FAIL_MAKE_REQUEST=3Dy
> > > > # CONFIG_FAIL_IO_TIMEOUT is not set
> > > > # CONFIG_FAIL_FUTEX is not set
> > > > CONFIG_FAULT_INJECTION_DEBUG_FS=3Dy
> > > > # CONFIG_FAIL_FUNCTION is not set
> > > > # CONFIG_FAIL_MMC_REQUEST is not set
> > > > CONFIG_ARCH_HAS_KCOV=3Dy
> > > > CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy
> > > > # CONFIG_KCOV is not set
> > > > CONFIG_RUNTIME_TESTING_MENU=3Dy
> > > > # CONFIG_LKDTM is not set
> > > > # CONFIG_TEST_LIST_SORT is not set
> > > > # CONFIG_TEST_MIN_HEAP is not set
> > > > # CONFIG_TEST_SORT is not set
> > > > # CONFIG_KPROBES_SANITY_TEST is not set
> > > > # CONFIG_BACKTRACE_SELF_TEST is not set
> > > > # CONFIG_RBTREE_TEST is not set
> > > > # CONFIG_REED_SOLOMON_TEST is not set
> > > > # CONFIG_INTERVAL_TREE_TEST is not set
> > > > # CONFIG_PERCPU_TEST is not set
> > > > CONFIG_ATOMIC64_SELFTEST=3Dy
> > > > # CONFIG_ASYNC_RAID6_TEST is not set
> > > > # CONFIG_TEST_HEXDUMP is not set
> > > > # CONFIG_TEST_STRING_HELPERS is not set
> > > > # CONFIG_TEST_STRSCPY is not set
> > > > # CONFIG_TEST_KSTRTOX is not set
> > > > # CONFIG_TEST_PRINTF is not set
> > > > # CONFIG_TEST_BITMAP is not set
> > > > # CONFIG_TEST_UUID is not set
> > > > # CONFIG_TEST_XARRAY is not set
> > > > # CONFIG_TEST_OVERFLOW is not set
> > > > # CONFIG_TEST_RHASHTABLE is not set
> > > > # CONFIG_TEST_HASH is not set
> > > > # CONFIG_TEST_IDA is not set
> > > > # CONFIG_TEST_LKM is not set
> > > > # CONFIG_TEST_BITOPS is not set
> > > > # CONFIG_TEST_VMALLOC is not set
> > > > # CONFIG_TEST_USER_COPY is not set
> > > > CONFIG_TEST_BPF=3Dm
> > > > # CONFIG_TEST_BLACKHOLE_DEV is not set
> > > > # CONFIG_FIND_BIT_BENCHMARK is not set
> > > > # CONFIG_TEST_FIRMWARE is not set
> > > > # CONFIG_TEST_SYSCTL is not set
> > > > # CONFIG_BITFIELD_KUNIT is not set
> > > > # CONFIG_RESOURCE_KUNIT_TEST is not set
> > > > CONFIG_SYSCTL_KUNIT_TEST=3Dm
> > > > CONFIG_LIST_KUNIT_TEST=3Dm
> > > > # CONFIG_LINEAR_RANGES_TEST is not set
> > > > # CONFIG_CMDLINE_KUNIT_TEST is not set
> > > > # CONFIG_BITS_TEST is not set
> > > > # CONFIG_TEST_UDELAY is not set
> > > > # CONFIG_TEST_STATIC_KEYS is not set
> > > > # CONFIG_TEST_KMOD is not set
> > > > # CONFIG_TEST_MEMCAT_P is not set
> > > > # CONFIG_TEST_LIVEPATCH is not set
> > > > # CONFIG_TEST_STACKINIT is not set
> > > > # CONFIG_TEST_MEMINIT is not set
> > > > # CONFIG_TEST_HMM is not set
> > > > # CONFIG_TEST_FREE_PAGES is not set
> > > > # CONFIG_TEST_FPU is not set
> > > > # CONFIG_MEMTEST is not set
> > > > # CONFIG_HYPERV_TESTING is not set
> > > > # end of Kernel Testing and Coverage
> > > > # end of Kernel hacking
> > > > #!/bin/sh
> > > > =

> > > > export_top_env()
> > > > {
> > > > 	export suite=3D'stress-ng'
> > > > 	export testcase=3D'stress-ng'
> > > > 	export category=3D'benchmark'
> > > > 	export nr_threads=3D9
> > > > 	export testtime=3D60
> > > > 	export job_origin=3D'stress-ng-class-os.yaml'
> > > > 	export queue_cmdline_keys=3D'branch
> > > > commit
> > > > queue_at_least_once'
> > > > 	export queue=3D'validate'
> > > > 	export testbox=3D'lkp-csl-2sp5'
> > > > 	export tbox_group=3D'lkp-csl-2sp5'
> > > > 	export kconfig=3D'x86_64-rhel-8.3'
> > > > 	export submit_id=3D'607d1e96a0c2121c87a474d3'
> > > > 	export job_file=3D'/lkp/jobs/scheduled/lkp-csl-2sp5/stress-ng-os-p=
erformance-1HDD-ext4-10%-opcode-60s-ucode=3D0x5003006-monitor=3D05f94038-de=
bian-10.4-x86_64-20200603.cgz-6c52b5f3cfefd-20210419-7303-1x3vyrb-4.yaml'
> > > > 	export id=3D'262661019c585c816b13fd0de1239c8cfc7408a4'
> > > > 	export queuer_version=3D'/lkp-src'
> > > > 	export model=3D'Cascade Lake'
> > > > 	export nr_node=3D2
> > > > 	export nr_cpu=3D96
> > > > 	export memory=3D'192G'
> > > > 	export nr_hdd_partitions=3D1
> > > > 	export nr_ssd_partitions=3D1
> > > > 	export hdd_partitions=3D'/dev/disk/by-id/ata-ST1000NM0011_Z1N2QGYK=
-part5'
> > > > 	export ssd_partitions=3D'/dev/disk/by-id/ata-INTEL_SSDSC2BB800G4_P=
HWL4204006P800RGN-part1'
> > > > 	export swap_partitions=3D
> > > > 	export rootfs_partition=3D'/dev/disk/by-id/ata-ST1000NM0011_Z1N2QG=
YK-part3'
> > > > 	export brand=3D'Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz'
> > > > 	export need_kconfig=3D'CONFIG_BLK_DEV_SD
> > > > CONFIG_SCSI
> > > > CONFIG_BLOCK=3Dy
> > > > CONFIG_SATA_AHCI
> > > > CONFIG_SATA_AHCI_PLATFORM
> > > > CONFIG_ATA
> > > > CONFIG_PCI=3Dy
> > > > CONFIG_EXT4_FS
> > > > CONFIG_SECURITY_APPARMOR=3Dy'
> > > > 	export commit=3D'6c52b5f3cfefd6e429efc4413fd25e3c394e959f'
> > > > 	export need_kconfig_hw=3D'CONFIG_I40E=3Dy
> > > > CONFIG_SATA_AHCI'
> > > > 	export ucode=3D'0x5003006'
> > > > 	export bisect_dmesg=3Dtrue
> > > > 	export enqueue_time=3D'2021-04-19 14:09:27 +0800'
> > > > 	export _id=3D'607d1e9aa0c2121c87a474d4'
> > > > 	export _rt=3D'/result/stress-ng/os-performance-1HDD-ext4-10%-opcod=
e-60s-ucode=3D0x5003006-monitor=3D05f94038/lkp-csl-2sp5/debian-10.4-x86_64-=
20200603.cgz/x86_64-rhel-8.3/gcc-9/6c52b5f3cfefd6e429efc4413fd25e3c394e959f'
> > > > 	export user=3D'lkp'
> > > > 	export compiler=3D'gcc-9'
> > > > 	export LKP_SERVER=3D'internal-lkp-server'
> > > > 	export head_commit=3D'46e792aa75119d2bbdefa2e76b4f6c61a885bdab'
> > > > 	export base_commit=3D'd434405aaab7d0ebc516b68a8fc4100922d7f5ef'
> > > > 	export branch=3D'rcu/dev.2021.04.13a'
> > > > 	export rootfs=3D'debian-10.4-x86_64-20200603.cgz'
> > > > 	export monitor_sha=3D'05f94038'
> > > > 	export result_root=3D'/result/stress-ng/os-performance-1HDD-ext4-1=
0%-opcode-60s-ucode=3D0x5003006-monitor=3D05f94038/lkp-csl-2sp5/debian-10.4=
-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/6c52b5f3cfefd6e429efc4413fd25e3c=
394e959f/3'
> > > > 	export scheduler_version=3D'/lkp/lkp/.src-20210419-111420'
> > > > 	export arch=3D'x86_64'
> > > > 	export max_uptime=3D2100
> > > > 	export initrd=3D'/osimage/debian/debian-10.4-x86_64-20200603.cgz'
> > > > 	export bootloader_append=3D'root=3D/dev/ram0
> > > > user=3Dlkp
> > > > job=3D/lkp/jobs/scheduled/lkp-csl-2sp5/stress-ng-os-performance-1HD=
D-ext4-10%-opcode-60s-ucode=3D0x5003006-monitor=3D05f94038-debian-10.4-x86_=
64-20200603.cgz-6c52b5f3cfefd-20210419-7303-1x3vyrb-4.yaml
> > > > ARCH=3Dx86_64
> > > > kconfig=3Dx86_64-rhel-8.3
> > > > branch=3Drcu/dev.2021.04.13a
> > > > commit=3D6c52b5f3cfefd6e429efc4413fd25e3c394e959f
> > > > BOOT_IMAGE=3D/pkg/linux/x86_64-rhel-8.3/gcc-9/6c52b5f3cfefd6e429efc=
4413fd25e3c394e959f/vmlinuz-5.12.0-rc5-00207-g6c52b5f3cfef
> > > > max_uptime=3D2100
> > > > RESULT_ROOT=3D/result/stress-ng/os-performance-1HDD-ext4-10%-opcode=
-60s-ucode=3D0x5003006-monitor=3D05f94038/lkp-csl-2sp5/debian-10.4-x86_64-2=
0200603.cgz/x86_64-rhel-8.3/gcc-9/6c52b5f3cfefd6e429efc4413fd25e3c394e959f/3
> > > > LKP_SERVER=3Dinternal-lkp-server
> > > > nokaslr
> > > > selinux=3D0
> > > > debug
> > > > apic=3Ddebug
> > > > sysrq_always_enabled
> > > > rcupdate.rcu_cpu_stall_timeout=3D100
> > > > net.ifnames=3D0
> > > > printk.devkmsg=3Don
> > > > panic=3D-1
> > > > softlockup_panic=3D1
> > > > nmi_watchdog=3Dpanic
> > > > oops=3Dpanic
> > > > load_ramdisk=3D2
> > > > prompt_ramdisk=3D0
> > > > drbd.minor_count=3D8
> > > > systemd.log_level=3Derr
> > > > ignore_loglevel
> > > > console=3Dtty0
> > > > earlyprintk=3DttyS0,115200
> > > > console=3DttyS0,115200
> > > > vga=3Dnormal
> > > > rw'
> > > > 	export modules_initrd=3D'/pkg/linux/x86_64-rhel-8.3/gcc-9/6c52b5f3=
cfefd6e429efc4413fd25e3c394e959f/modules.cgz'
> > > > 	export bm_initrd=3D'/osimage/deps/debian-10.4-x86_64-20200603.cgz/=
run-ipconfig_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/lkp=
_20201211.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/rsync-rootfs_20=
200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/fs_20200714.cgz,/o=
simage/deps/debian-10.4-x86_64-20200603.cgz/stress-ng_20210401.cgz,/osimage=
/pkg/debian-10.4-x86_64-20200603.cgz/stress-ng-x86_64-0.11-06_20210401.cgz,=
/osimage/deps/debian-10.4-x86_64-20200603.cgz/mpstat_20200714.cgz,/osimage/=
deps/debian-10.4-x86_64-20200603.cgz/turbostat_20200721.cgz,/osimage/pkg/de=
bian-10.4-x86_64-20200603.cgz/turbostat-x86_64-3.7-4_20200721.cgz,/osimage/=
deps/debian-10.4-x86_64-20200603.cgz/perf_20201126.cgz,/osimage/pkg/debian-=
10.4-x86_64-20200603.cgz/perf-x86_64-d19cc4bfbff1-1_20210401.cgz,/osimage/p=
kg/debian-10.4-x86_64-20200603.cgz/sar-x86_64-34c92ae-1_20200702.cgz,/osima=
ge/deps/debian-10.4-x86_64-20200603.cgz/hw_20200715.cgz'
> > > > 	export ucode_initrd=3D'/osimage/ucode/intel-ucode-20210222.cgz'
> > > > 	export lkp_initrd=3D'/osimage/user/lkp/lkp-x86_64.cgz'
> > > > 	export site=3D'inn'
> > > > 	export LKP_CGI_PORT=3D80
> > > > 	export LKP_CIFS_PORT=3D139
> > > > 	export last_kernel=3D'5.12.0-rc7-intel-next-03134-g0fd3c285cd03'
> > > > 	export repeat_to=3D6
> > > > 	export queue_at_least_once=3D1
> > > > 	export kernel=3D'/pkg/linux/x86_64-rhel-8.3/gcc-9/6c52b5f3cfefd6e4=
29efc4413fd25e3c394e959f/vmlinuz-5.12.0-rc5-00207-g6c52b5f3cfef'
> > > > 	export dequeue_time=3D'2021-04-19 14:10:49 +0800'
> > > > 	export job_initrd=3D'/lkp/jobs/scheduled/lkp-csl-2sp5/stress-ng-os=
-performance-1HDD-ext4-10%-opcode-60s-ucode=3D0x5003006-monitor=3D05f94038-=
debian-10.4-x86_64-20200603.cgz-6c52b5f3cfefd-20210419-7303-1x3vyrb-4.cgz'
> > > > =

> > > > 	[ -n "$LKP_SRC" ] ||
> > > > 	export LKP_SRC=3D/lkp/${user:-lkp}/src
> > > > }
> > > > =

> > > > run_job()
> > > > {
> > > > 	echo $$ > $TMP/run-job.pid
> > > > =

> > > > 	. $LKP_SRC/lib/http.sh
> > > > 	. $LKP_SRC/lib/job.sh
> > > > 	. $LKP_SRC/lib/env.sh
> > > > =

> > > > 	export_top_env
> > > > =

> > > > 	run_setup nr_hdd=3D1 $LKP_SRC/setup/disk
> > > > =

> > > > 	run_setup fs=3D'ext4' $LKP_SRC/setup/fs
> > > > =

> > > > 	run_setup $LKP_SRC/setup/cpufreq_governor 'performance'
> > > > =

> > > > 	run_monitor $LKP_SRC/monitors/wrapper kmsg
> > > > 	run_monitor $LKP_SRC/monitors/no-stdout/wrapper boot-time
> > > > 	run_monitor $LKP_SRC/monitors/wrapper uptime
> > > > 	run_monitor $LKP_SRC/monitors/wrapper iostat
> > > > 	run_monitor $LKP_SRC/monitors/wrapper heartbeat
> > > > 	run_monitor $LKP_SRC/monitors/wrapper vmstat
> > > > 	run_monitor $LKP_SRC/monitors/wrapper numa-numastat
> > > > 	run_monitor $LKP_SRC/monitors/wrapper numa-vmstat
> > > > 	run_monitor $LKP_SRC/monitors/wrapper numa-meminfo
> > > > 	run_monitor $LKP_SRC/monitors/wrapper proc-vmstat
> > > > 	run_monitor $LKP_SRC/monitors/wrapper proc-stat
> > > > 	run_monitor $LKP_SRC/monitors/wrapper meminfo
> > > > 	run_monitor $LKP_SRC/monitors/wrapper slabinfo
> > > > 	run_monitor $LKP_SRC/monitors/wrapper interrupts
> > > > 	run_monitor $LKP_SRC/monitors/wrapper lock_stat
> > > > 	run_monitor lite_mode=3D1 $LKP_SRC/monitors/wrapper perf-sched
> > > > 	run_monitor $LKP_SRC/monitors/wrapper softirqs
> > > > 	run_monitor $LKP_SRC/monitors/one-shot/wrapper bdi_dev_mapping
> > > > 	run_monitor $LKP_SRC/monitors/wrapper diskstats
> > > > 	run_monitor $LKP_SRC/monitors/wrapper nfsstat
> > > > 	run_monitor $LKP_SRC/monitors/wrapper cpuidle
> > > > 	run_monitor $LKP_SRC/monitors/wrapper cpufreq-stats
> > > > 	run_monitor $LKP_SRC/monitors/wrapper turbostat
> > > > 	run_monitor $LKP_SRC/monitors/wrapper sched_debug
> > > > 	run_monitor $LKP_SRC/monitors/wrapper perf-stat
> > > > 	run_monitor $LKP_SRC/monitors/wrapper mpstat
> > > > 	run_monitor $LKP_SRC/monitors/no-stdout/wrapper perf-profile
> > > > 	run_monitor $LKP_SRC/monitors/wrapper oom-killer
> > > > 	run_monitor $LKP_SRC/monitors/plain/watchdog
> > > > =

> > > > 	run_test class=3D'os' test=3D'opcode' $LKP_SRC/tests/wrapper stres=
s-ng
> > > > }
> > > > =

> > > > extract_stats()
> > > > {
> > > > 	export stats_part_begin=3D
> > > > 	export stats_part_end=3D
> > > > =

> > > > 	env class=3D'os' test=3D'opcode' $LKP_SRC/stats/wrapper stress-ng
> > > > 	$LKP_SRC/stats/wrapper kmsg
> > > > 	$LKP_SRC/stats/wrapper boot-time
> > > > 	$LKP_SRC/stats/wrapper uptime
> > > > 	$LKP_SRC/stats/wrapper iostat
> > > > 	$LKP_SRC/stats/wrapper vmstat
> > > > 	$LKP_SRC/stats/wrapper numa-numastat
> > > > 	$LKP_SRC/stats/wrapper numa-vmstat
> > > > 	$LKP_SRC/stats/wrapper numa-meminfo
> > > > 	$LKP_SRC/stats/wrapper proc-vmstat
> > > > 	$LKP_SRC/stats/wrapper meminfo
> > > > 	$LKP_SRC/stats/wrapper slabinfo
> > > > 	$LKP_SRC/stats/wrapper interrupts
> > > > 	$LKP_SRC/stats/wrapper lock_stat
> > > > 	env lite_mode=3D1 $LKP_SRC/stats/wrapper perf-sched
> > > > 	$LKP_SRC/stats/wrapper softirqs
> > > > 	$LKP_SRC/stats/wrapper diskstats
> > > > 	$LKP_SRC/stats/wrapper nfsstat
> > > > 	$LKP_SRC/stats/wrapper cpuidle
> > > > 	$LKP_SRC/stats/wrapper turbostat
> > > > 	$LKP_SRC/stats/wrapper sched_debug
> > > > 	$LKP_SRC/stats/wrapper perf-stat
> > > > 	$LKP_SRC/stats/wrapper mpstat
> > > > 	$LKP_SRC/stats/wrapper perf-profile
> > > > =

> > > > 	$LKP_SRC/stats/wrapper time stress-ng.time
> > > > 	$LKP_SRC/stats/wrapper dmesg
> > > > 	$LKP_SRC/stats/wrapper kmsg
> > > > 	$LKP_SRC/stats/wrapper last_state
> > > > 	$LKP_SRC/stats/wrapper stderr
> > > > 	$LKP_SRC/stats/wrapper time
> > > > }
> > > > =

> > > > "$@"
> > > > ---
> > > > =

> > > > #! jobs/stress-ng-class-os.yaml
> > > > suite: stress-ng
> > > > testcase: stress-ng
> > > > category: benchmark
> > > > nr_threads: 10%
> > > > disk: 1HDD
> > > > testtime: 60s
> > > > fs: ext4
> > > > stress-ng:
> > > >    class: os
> > > >    test: opcode
> > > > job_origin: stress-ng-class-os.yaml
> > > > =

> > > > #! queue options
> > > > queue_cmdline_keys:
> > > > - branch
> > > > - commit
> > > > - queue_at_least_once
> > > > queue: bisect
> > > > testbox: lkp-csl-2sp5
> > > > tbox_group: lkp-csl-2sp5
> > > > kconfig: x86_64-rhel-8.3
> > > > submit_id: 607d0d9ba0c21212d136df70
> > > > job_file: "/lkp/jobs/scheduled/lkp-csl-2sp5/stress-ng-os-performanc=
e-1HDD-ext4-10%-opcode-60s-ucode=3D0x5003006-monitor=3D05f94038-debian-10.4=
-x86_64-20200603.cgz-6c52b5f3cfefd-20210419-4817-mo23r6-2.yaml"
> > > > id: cb3c2cbf6c4ea1ac3728e1099911d2143f8eaf51
> > > > queuer_version: "/lkp-src"
> > > > =

> > > > #! hosts/lkp-csl-2sp5
> > > > model: Cascade Lake
> > > > nr_node: 2
> > > > nr_cpu: 96
> > > > memory: 192G
> > > > nr_hdd_partitions: 1
> > > > nr_ssd_partitions: 1
> > > > hdd_partitions: "/dev/disk/by-id/ata-ST1000NM0011_Z1N2QGYK-part5"
> > > > ssd_partitions: "/dev/disk/by-id/ata-INTEL_SSDSC2BB800G4_PHWL420400=
6P800RGN-part1"
> > > > swap_partitions:
> > > > rootfs_partition: "/dev/disk/by-id/ata-ST1000NM0011_Z1N2QGYK-part3"
> > > > brand: Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz
> > > > =

> > > > #! include/category/benchmark
> > > > kmsg:
> > > > boot-time:
> > > > uptime:
> > > > iostat:
> > > > heartbeat:
> > > > vmstat:
> > > > numa-numastat:
> > > > numa-vmstat:
> > > > numa-meminfo:
> > > > proc-vmstat:
> > > > proc-stat:
> > > > meminfo:
> > > > slabinfo:
> > > > interrupts:
> > > > lock_stat:
> > > > perf-sched:
> > > >    lite_mode: 1
> > > > softirqs:
> > > > bdi_dev_mapping:
> > > > diskstats:
> > > > nfsstat:
> > > > cpuidle:
> > > > cpufreq-stats:
> > > > turbostat:
> > > > sched_debug:
> > > > perf-stat:
> > > > mpstat:
> > > > perf-profile:
> > > > =

> > > > #! include/category/ALL
> > > > cpufreq_governor: performance
> > > > =

> > > > #! include/disk/nr_hdd
> > > > need_kconfig:
> > > > - CONFIG_BLK_DEV_SD
> > > > - CONFIG_SCSI
> > > > - CONFIG_BLOCK=3Dy
> > > > - CONFIG_SATA_AHCI
> > > > - CONFIG_SATA_AHCI_PLATFORM
> > > > - CONFIG_ATA
> > > > - CONFIG_PCI=3Dy
> > > > - CONFIG_EXT4_FS
> > > > - CONFIG_SECURITY_APPARMOR=3Dy
> > > > =

> > > > #! include/fs/OTHERS
> > > > =

> > > > #! include/stress-ng
> > > > =

> > > > #! include/queue/cyclic
> > > > commit: 6c52b5f3cfefd6e429efc4413fd25e3c394e959f
> > > > =

> > > > #! include/testbox/lkp-csl-2sp5
> > > > need_kconfig_hw:
> > > > - CONFIG_I40E=3Dy
> > > > - CONFIG_SATA_AHCI
> > > > ucode: '0x5003006'
> > > > bisect_dmesg: true
> > > > enqueue_time: 2021-04-19 12:56:59.630618044 +08:00
> > > > _id: 607d10eda0c21212d136df72
> > > > _rt: "/result/stress-ng/os-performance-1HDD-ext4-10%-opcode-60s-uco=
de=3D0x5003006-monitor=3D05f94038/lkp-csl-2sp5/debian-10.4-x86_64-20200603.=
cgz/x86_64-rhel-8.3/gcc-9/6c52b5f3cfefd6e429efc4413fd25e3c394e959f"
> > > > =

> > > > #! schedule options
> > > > user: lkp
> > > > compiler: gcc-9
> > > > LKP_SERVER: internal-lkp-server
> > > > head_commit: 46e792aa75119d2bbdefa2e76b4f6c61a885bdab
> > > > base_commit: d434405aaab7d0ebc516b68a8fc4100922d7f5ef
> > > > branch: linux-devel/devel-hourly-20210418-235930
> > > > rootfs: debian-10.4-x86_64-20200603.cgz
> > > > monitor_sha: 05f94038
> > > > result_root: "/result/stress-ng/os-performance-1HDD-ext4-10%-opcode=
-60s-ucode=3D0x5003006-monitor=3D05f94038/lkp-csl-2sp5/debian-10.4-x86_64-2=
0200603.cgz/x86_64-rhel-8.3/gcc-9/6c52b5f3cfefd6e429efc4413fd25e3c394e959f/=
0"
> > > > scheduler_version: "/lkp/lkp/.src-20210419-111420"
> > > > arch: x86_64
> > > > max_uptime: 2100
> > > > initrd: "/osimage/debian/debian-10.4-x86_64-20200603.cgz"
> > > > bootloader_append:
> > > > - root=3D/dev/ram0
> > > > - user=3Dlkp
> > > > - job=3D/lkp/jobs/scheduled/lkp-csl-2sp5/stress-ng-os-performance-1=
HDD-ext4-10%-opcode-60s-ucode=3D0x5003006-monitor=3D05f94038-debian-10.4-x8=
6_64-20200603.cgz-6c52b5f3cfefd-20210419-4817-mo23r6-2.yaml
> > > > - ARCH=3Dx86_64
> > > > - kconfig=3Dx86_64-rhel-8.3
> > > > - branch=3Dlinux-devel/devel-hourly-20210418-235930
> > > > - commit=3D6c52b5f3cfefd6e429efc4413fd25e3c394e959f
> > > > - BOOT_IMAGE=3D/pkg/linux/x86_64-rhel-8.3/gcc-9/6c52b5f3cfefd6e429e=
fc4413fd25e3c394e959f/vmlinuz-5.12.0-rc5-00207-g6c52b5f3cfef
> > > > - max_uptime=3D2100
> > > > - RESULT_ROOT=3D/result/stress-ng/os-performance-1HDD-ext4-10%-opco=
de-60s-ucode=3D0x5003006-monitor=3D05f94038/lkp-csl-2sp5/debian-10.4-x86_64=
-20200603.cgz/x86_64-rhel-8.3/gcc-9/6c52b5f3cfefd6e429efc4413fd25e3c394e959=
f/0
> > > > - LKP_SERVER=3Dinternal-lkp-server
> > > > - nokaslr
> > > > - selinux=3D0
> > > > - debug
> > > > - apic=3Ddebug
> > > > - sysrq_always_enabled
> > > > - rcupdate.rcu_cpu_stall_timeout=3D100
> > > > - net.ifnames=3D0
> > > > - printk.devkmsg=3Don
> > > > - panic=3D-1
> > > > - softlockup_panic=3D1
> > > > - nmi_watchdog=3Dpanic
> > > > - oops=3Dpanic
> > > > - load_ramdisk=3D2
> > > > - prompt_ramdisk=3D0
> > > > - drbd.minor_count=3D8
> > > > - systemd.log_level=3Derr
> > > > - ignore_loglevel
> > > > - console=3Dtty0
> > > > - earlyprintk=3DttyS0,115200
> > > > - console=3DttyS0,115200
> > > > - vga=3Dnormal
> > > > - rw
> > > > modules_initrd: "/pkg/linux/x86_64-rhel-8.3/gcc-9/6c52b5f3cfefd6e42=
9efc4413fd25e3c394e959f/modules.cgz"
> > > > bm_initrd: "/osimage/deps/debian-10.4-x86_64-20200603.cgz/run-ipcon=
fig_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/lkp_20201211=
.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/rsync-rootfs_20200608.cg=
z,/osimage/deps/debian-10.4-x86_64-20200603.cgz/fs_20200714.cgz,/osimage/de=
ps/debian-10.4-x86_64-20200603.cgz/stress-ng_20210401.cgz,/osimage/pkg/debi=
an-10.4-x86_64-20200603.cgz/stress-ng-x86_64-0.11-06_20210401.cgz,/osimage/=
deps/debian-10.4-x86_64-20200603.cgz/mpstat_20200714.cgz,/osimage/deps/debi=
an-10.4-x86_64-20200603.cgz/turbostat_20200721.cgz,/osimage/pkg/debian-10.4=
-x86_64-20200603.cgz/turbostat-x86_64-3.7-4_20200721.cgz,/osimage/deps/debi=
an-10.4-x86_64-20200603.cgz/perf_20201126.cgz,/osimage/pkg/debian-10.4-x86_=
64-20200603.cgz/perf-x86_64-d19cc4bfbff1-1_20210401.cgz,/osimage/pkg/debian=
-10.4-x86_64-20200603.cgz/sar-x86_64-34c92ae-1_20200702.cgz,/osimage/deps/d=
ebian-10.4-x86_64-20200603.cgz/hw_20200715.cgz"
> > > > ucode_initrd: "/osimage/ucode/intel-ucode-20210222.cgz"
> > > > lkp_initrd: "/osimage/user/lkp/lkp-x86_64.cgz"
> > > > site: inn
> > > > =

> > > > #! /lkp/lkp/.src-20210417-193648/include/site/inn
> > > > LKP_CGI_PORT: 80
> > > > LKP_CIFS_PORT: 139
> > > > oom-killer:
> > > > watchdog:
> > > > =

> > > > #! runtime status
> > > > last_kernel: 4.20.0
> > > > repeat_to: 3
> > > > =

> > > > #! user overrides
> > > > queue_at_least_once: 0
> > > > kernel: "/pkg/linux/x86_64-rhel-8.3/gcc-9/6c52b5f3cfefd6e429efc4413=
fd25e3c394e959f/vmlinuz-5.12.0-rc5-00207-g6c52b5f3cfef"
> > > > dequeue_time: 2021-04-19 13:13:07.510308277 +08:00
> > > > =

> > > > #! /lkp/lkp/.src-20210419-111420/include/site/inn
> > > > job_state: finished
> > > > loadavg: 5.06 1.78 0.64 1/872 94437
> > > > start_time: '1618809246'
> > > > end_time: '1618809308'
> > > > version: "/lkp/lkp/.src-20210419-111450:78453b27:2c6b06c3f"
> > > > dmsetup remove_all
> > > > wipefs -a --force /dev/sda5
> > > > mkfs -t ext4 -q -F /dev/sda5
> > > > mkdir -p /fs/sda5
> > > > mount -t ext4 /dev/sda5 /fs/sda5
> > > > =

> > > > for cpu_dir in /sys/devices/system/cpu/cpu[0-9]*
> > > > do
> > > > 	online_file=3D"$cpu_dir"/online
> > > > 	[ -f "$online_file" ] && [ "$(cat "$online_file")" -eq 0 ] && cont=
inue
> > > > =

> > > > 	file=3D"$cpu_dir"/cpufreq/scaling_governor
> > > > 	[ -f "$file" ] && echo "performance" > "$file"
> > > > done
> > > > =

> > > >   "mkdir" "-p" "/mnt/stress-ng"
> > > >   "mount" "/dev/sda5" "/mnt/stress-ng"
> > > >   "stress-ng" "--timeout" "60" "--times" "--verify" "--metrics-brie=
f" "--opcode" "9"
> > _______________________________________________
> > LKP mailing list -- lkp(a)lists.01.org
> > To unsubscribe send an email to lkp-leave(a)lists.01.org
> =

> -- =

> Zhengjun Xing
> =



--===============6966744004089142351==--

