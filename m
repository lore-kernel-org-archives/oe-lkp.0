Content-Type: multipart/mixed; boundary="===============6600429064834038380=="
MIME-Version: 1.0
From: Luck, Tony <tony.luck@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/split_lock] b041b525da: stress-ng.lockbus.ops_per_sec -48.3% regression
Date: Fri, 06 May 2022 15:36:37 +0000
Message-ID: <e45c465ac52843168a7ba7c6834fa697@intel.com>
In-Reply-To: <20220506084306.GG23061@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6600429064834038380==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Only -43.8%? That just sounds like I made life "pretty unpleasant", not "mi=
serable" :-)

This regression is expected. No plans to fix it.

You might look into a benchmark that measures performance of other applicat=
ions while this
stress-ng.lockbus.ops_per_sec is running. The intent of this patch is to re=
duce the impact
of bus locks on the rest of the system.

-Tony

-----Original Message-----
From: Sang, Oliver <oliver.sang@intel.com> =

Sent: Friday, May 06, 2022 1:43 AM
To: Luck, Tony <tony.luck@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>; LKML <linux-kernel@vger.kerne=
l.org>; x86(a)kernel.org; lkp(a)lists.01.org; lkp <lkp@intel.com>; Huang,=
 Ying <ying.huang@intel.com>; Tang, Feng <feng.tang@intel.com>; zhengju=
n.xing(a)linux.intel.com; Yin, Fengwei <fengwei.yin@intel.com>
Subject: [x86/split_lock] b041b525da: stress-ng.lockbus.ops_per_sec -48.3% =
regression



Greeting,

FYI, we noticed a -48.3% regression of stress-ng.lockbus.ops_per_sec due to=
 commit:


commit: b041b525dab95352fbd666b14dc73ab898df465f ("x86/split_lock: Make lif=
e miserable for split lockers")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git x86/splitlock

in testcase: stress-ng
on test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @=
 2.60GHz with 128G memory
with following parameters:

	nr_threads: 100%
	testtime: 60s
	class: memory
	test: lockbus
	cpufreq_governor: performance
	ucode: 0xd000331




If you fix the issue, kindly add following tag
Reported-by: kernel test robot <oliver.sang@intel.com>


Details are as below:
---------------------------------------------------------------------------=
----------------------->


To reproduce:

        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        sudo bin/lkp install job.yaml           # job file is attached in t=
his email
        bin/lkp split-job --compatible job.yaml # generate the yaml file fo=
r lkp run
        sudo bin/lkp run generated-yaml-file

        # if come across any failure that blocks the test,
        # please remove ~/.lkp and /lkp dir to run from a clean state.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
class/compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/t=
estcase/testtime/ucode:
  memory/gcc-11/performance/x86_64-rhel-8.3/100%/debian-10.4-x86_64-2020060=
3.cgz/lkp-icl-2sp6/lockbus/stress-ng/60s/0xd000331

commit: =

  v5.18-rc4
  b041b525da ("x86/split_lock: Make life miserable for split lockers")

       v5.18-rc4 b041b525dab95352fbd666b14dc =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     84375           -48.3%      43587 =C2=B1  3%  stress-ng.lockbus.ops
      1400           -48.3%     723.64 =C2=B1  3%  stress-ng.lockbus.ops_pe=
r_sec
     46977 =C2=B1  2%     -61.4%      18141 =C2=B1 11%  stress-ng.time.invo=
luntary_context_switches
      7779           -98.7%      97.67        stress-ng.time.percent_of_cpu=
_this_job_got
    251.13 =C2=B1 21%     -99.3%       1.80 =C2=B1  3%  stress-ng.time.syst=
em_time
      4660           -98.7%      59.55        stress-ng.time.user_time
    431.40 =C2=B1 10%   +8470.7%      36974 =C2=B1 11%  stress-ng.time.volu=
ntary_context_switches
    293203           +12.9%     331056        meminfo.AnonHugePages
      4712 =C2=B1  3%    +156.4%      12081        uptime.idle
 5.616e+08 =C2=B1  2%   +1311.6%  7.927e+09        cpuidle..time
   1017813 =C2=B1 20%   +1502.7%   16312100        cpuidle..usage
      6.44 =C2=B1  8%     +90.9       97.30        mpstat.cpu.all.idle%
     34.59 =C2=B1  7%     -32.8        1.76 =C2=B1 31%  mpstat.cpu.all.irq%
      0.89 =C2=B1 13%      -0.8        0.09 =C2=B1 44%  mpstat.cpu.all.soft%
      5.10 =C2=B1  8%      -5.0        0.07 =C2=B1  3%  mpstat.cpu.all.sys%
     52.99 =C2=B1  6%     -52.2        0.78        mpstat.cpu.all.usr%
    878964 =C2=B1  5%     +10.8%     974067        numa-meminfo.node0.Shmem
   1018902 =C2=B1  7%     +16.1%    1183099 =C2=B1  5%  numa-meminfo.node1.=
Inactive
   1018902 =C2=B1  7%     +16.1%    1183099 =C2=B1  5%  numa-meminfo.node1.=
Inactive(anon)
    842061 =C2=B1  6%     +17.5%     989596 =C2=B1  2%  numa-meminfo.node1.=
Mapped
    848272 =C2=B1  5%     +15.2%     976855        numa-meminfo.node1.Shmem
      9.80 =C2=B1  4%    +886.4%      96.67        vmstat.cpu.id
     50.00 =C2=B1  6%    -100.0%       0.00        vmstat.cpu.us
    121.40           -99.2%       1.00        vmstat.procs.r
      2548           +34.1%       3418 =C2=B1 10%  vmstat.system.cs
    144004 =C2=B1  9%     +74.3%     250999        vmstat.system.in
    282203 =C2=B1  4%     +14.8%     323935 =C2=B1  5%  numa-vmstat.node0.n=
r_inactive_anon
    211496 =C2=B1  6%     +16.6%     246585 =C2=B1  2%  numa-vmstat.node0.n=
r_mapped
    206680 =C2=B1  5%     +18.9%     245754 =C2=B1  2%  numa-vmstat.node0.n=
r_shmem
    282195 =C2=B1  4%     +14.8%     323935 =C2=B1  5%  numa-vmstat.node0.n=
r_zone_inactive_anon
    240558 =C2=B1  8%     +24.0%     298317 =C2=B1  5%  numa-vmstat.node1.n=
r_inactive_anon
    197879 =C2=B1  7%     +26.2%     249742 =C2=B1  2%  numa-vmstat.node1.n=
r_mapped
      1642 =C2=B1 40%     +27.4%       2093 =C2=B1 40%  numa-vmstat.node1.n=
r_page_table_pages
    199997 =C2=B1  6%     +23.2%     246443        numa-vmstat.node1.nr_shm=
em
    240505 =C2=B1  8%     +24.0%     298317 =C2=B1  5%  numa-vmstat.node1.n=
r_zone_inactive_anon
      3066           -97.4%      78.67 =C2=B1 19%  turbostat.Avg_MHz
     93.28           -89.2        4.07 =C2=B1 22%  turbostat.Busy%
      3296           -40.8%       1952 =C2=B1  5%  turbostat.Bzy_MHz
    781444 =C2=B1 54%   +1628.9%   13510398 =C2=B1 28%  turbostat.C1E
      4.23 =C2=B1 61%     +64.0       68.28 =C2=B1 57%  turbostat.C1E%
      4.44 =C2=B1 55%   +1453.3%      69.03 =C2=B1 55%  turbostat.CPU%c1
     63.20           -16.4%      52.83 =C2=B1  4%  turbostat.CoreTmp
   8352767 =C2=B1  8%     +97.6%   16501874        turbostat.IRQ
     63.00 =C2=B1  2%     -16.1%      52.83 =C2=B1  2%  turbostat.PkgTmp
    375.56           -39.9%     225.74 =C2=B1  6%  turbostat.PkgWatt
    121375            +7.5%     130425        proc-vmstat.nr_anon_pages
    987453            +7.0%    1056187        proc-vmstat.nr_file_pages
    537372           +14.8%     616827        proc-vmstat.nr_inactive_anon
    422895           +16.2%     491550        proc-vmstat.nr_mapped
      4107 =C2=B1  2%      +6.8%       4385 =C2=B1  2%  proc-vmstat.nr_page=
_table_pages
    418750           +16.4%     487474        proc-vmstat.nr_shmem
    537370           +14.8%     616827        proc-vmstat.nr_zone_inactive_=
anon
      3330 =C2=B1 61%     -99.7%      11.50 =C2=B1186%  proc-vmstat.numa_hi=
nt_faults
      2035 =C2=B1 59%     -99.9%       1.67 =C2=B1197%  proc-vmstat.numa_hi=
nt_faults_local
   1002524            +4.6%    1048399        proc-vmstat.numa_hit
    886626            +5.0%     931095        proc-vmstat.numa_local
      5946 =C2=B1116%     -98.4%      95.00 =C2=B1223%  proc-vmstat.numa_pa=
ges_migrated
    493749 =C2=B1  3%     -99.8%     853.33 =C2=B1223%  proc-vmstat.numa_pt=
e_updates
   1001222            +4.6%    1046837        proc-vmstat.pgalloc_normal
    841720            +8.6%     914206        proc-vmstat.pgfault
    775048           +18.1%     915055        proc-vmstat.pgfree
      5946 =C2=B1116%     -98.4%      95.00 =C2=B1223%  proc-vmstat.pgmigra=
te_success
     17361           +54.0%      26742        proc-vmstat.pgreuse
 5.129e+08 =C2=B1  7%     -41.1%  3.022e+08 =C2=B1  2%  perf-stat.i.branch-=
instructions
      0.95 =C2=B1 11%      +3.6        4.58 =C2=B1 99%  perf-stat.i.branch-=
miss-rate%
   2382071 =C2=B1  7%     -44.4%    1324699 =C2=B1  8%  perf-stat.i.cache-m=
isses
      2539 =C2=B1  2%     +20.4%       3057 =C2=B1 12%  perf-stat.i.context=
-switches
    426.49 =C2=B1  4%     -97.6%      10.23 =C2=B1 13%  perf-stat.i.cpi
    139782            -8.4%     128033        perf-stat.i.cpu-clock
 2.639e+11           -95.8%  1.118e+10 =C2=B1 11%  perf-stat.i.cpu-cycles
    752036 =C2=B1  5%     -98.0%      14941 =C2=B1 26%  perf-stat.i.cycles-=
between-cache-misses
 5.608e+08 =C2=B1  9%     -32.0%  3.812e+08        perf-stat.i.dTLB-loads
      0.41 =C2=B1  6%      -0.3        0.13 =C2=B1118%  perf-stat.i.dTLB-st=
ore-miss-rate%
 2.391e+08 =C2=B1  9%     -20.5%    1.9e+08        perf-stat.i.dTLB-stores
  2.44e+09 =C2=B1  9%     -38.9%   1.49e+09 =C2=B1  2%  perf-stat.i.instruc=
tions
     54.70 =C2=B1  5%     -77.1%      12.51        perf-stat.i.major-faults
      1.88 =C2=B1  2%     -95.4%       0.09 =C2=B1 11%  perf-stat.i.metric.=
GHz
    944.84 =C2=B1 19%     -64.4%     336.04 =C2=B1112%  perf-stat.i.metric.=
K/sec
      8.61 =C2=B1  8%     -20.7%       6.83        perf-stat.i.metric.M/sec
     10898 =C2=B1  6%     -58.0%       4579        perf-stat.i.minor-faults
     65.86 =C2=B1  4%     +18.6       84.51        perf-stat.i.node-load-mi=
ss-rate%
    141261 =C2=B1  8%     +56.6%     221158 =C2=B1 15%  perf-stat.i.node-lo=
ad-misses
     91471 =C2=B1  5%     -46.1%      49309 =C2=B1 16%  perf-stat.i.node-lo=
ads
     89300 =C2=B1 11%     -54.1%      40980 =C2=B1 21%  perf-stat.i.node-st=
ore-misses
   1212554 =C2=B1  7%     -57.6%     514245 =C2=B1  4%  perf-stat.i.node-st=
ores
     10953 =C2=B1  6%     -58.1%       4591        perf-stat.i.page-faults
    139787            -8.4%     128033        perf-stat.i.task-clock
    254.01 =C2=B1  8%     -97.0%       7.52 =C2=B1 12%  perf-stat.overall.c=
pi
    286326 =C2=B1  9%     -97.0%       8577 =C2=B1 19%  perf-stat.overall.c=
ycles-between-cache-misses
      0.00 =C2=B1  9%   +3300.4%       0.13 =C2=B1 11%  perf-stat.overall.i=
pc
     61.44 =C2=B1  9%     +20.3       81.74        perf-stat.overall.node-l=
oad-miss-rate%
  1.77e+08 =C2=B1  9%     +67.8%   2.97e+08 =C2=B1  2%  perf-stat.ps.branch=
-instructions
   2702583 =C2=B1 18%    +329.2%   11598999 =C2=B1 82%  perf-stat.ps.branch=
-misses
    716805 =C2=B1 10%     +81.6%    1301900 =C2=B1  8%  perf-stat.ps.cache-=
misses
      1459 =C2=B1  5%    +106.1%       3008 =C2=B1 12%  perf-stat.ps.contex=
t-switches
     95205 =C2=B1  8%     +32.3%     125997        perf-stat.ps.cpu-clock
 2.037e+11 =C2=B1  7%     -94.6%    1.1e+10 =C2=B1 11%  perf-stat.ps.cpu-cy=
cles
    120.76 =C2=B1  7%     +42.3%     171.90 =C2=B1  9%  perf-stat.ps.cpu-mi=
grations
 2.002e+08 =C2=B1 10%     +87.2%  3.748e+08        perf-stat.ps.dTLB-loads
  89201266 =C2=B1 11%    +109.5%  1.868e+08        perf-stat.ps.dTLB-stores
 8.074e+08 =C2=B1 10%     +81.4%  1.465e+09 =C2=B1  2%  perf-stat.ps.instru=
ctions
      3184 =C2=B1  8%     +41.1%       4492        perf-stat.ps.minor-faults
     61589 =C2=B1 10%    +253.4%     217652 =C2=B1 15%  perf-stat.ps.node-l=
oad-misses
     29168 =C2=B1  6%     +38.2%      40305 =C2=B1 21%  perf-stat.ps.node-s=
tore-misses
    303641 =C2=B1 13%     +66.2%     504661 =C2=B1  4%  perf-stat.ps.node-s=
tores
      3198 =C2=B1  8%     +40.8%       4504        perf-stat.ps.page-faults
     95207 =C2=B1  8%     +32.3%     125997        perf-stat.ps.task-clock
  4.66e+10 =C2=B1 12%     +99.4%  9.294e+10 =C2=B1  2%  perf-stat.total.ins=
tructions
     32354 =C2=B1 57%     -99.8%      61.76 =C2=B1 70%  sched_debug.cfs_rq:=
/.MIN_vruntime.avg
   2247989 =C2=B1 26%     -99.8%       5064 =C2=B1 56%  sched_debug.cfs_rq:=
/.MIN_vruntime.max
    247145 =C2=B1 39%     -99.8%     537.60 =C2=B1 62%  sched_debug.cfs_rq:=
/.MIN_vruntime.stddev
      0.57 =C2=B1  4%     -83.4%       0.10 =C2=B1 28%  sched_debug.cfs_rq:=
/.h_nr_running.avg
     32354 =C2=B1 57%     -99.8%      61.76 =C2=B1 70%  sched_debug.cfs_rq:=
/.max_vruntime.avg
   2247991 =C2=B1 26%     -99.8%       5064 =C2=B1 56%  sched_debug.cfs_rq:=
/.max_vruntime.max
    247145 =C2=B1 39%     -99.8%     537.60 =C2=B1 62%  sched_debug.cfs_rq:=
/.max_vruntime.stddev
   2763104           -99.7%       8913 =C2=B1 36%  sched_debug.cfs_rq:/.min=
_vruntime.avg
   3358182 =C2=B1  4%     -99.3%      24400 =C2=B1 13%  sched_debug.cfs_rq:=
/.min_vruntime.max
   1538537 =C2=B1 12%     -99.8%       2844 =C2=B1 28%  sched_debug.cfs_rq:=
/.min_vruntime.min
    156471 =C2=B1  5%     -97.6%       3686 =C2=B1 24%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      0.55 =C2=B1  3%     -82.7%       0.10 =C2=B1 28%  sched_debug.cfs_rq:=
/.nr_running.avg
    119.88 =C2=B1 20%     +55.8%     186.73 =C2=B1 29%  sched_debug.cfs_rq:=
/.removed.load_avg.stddev
     59.29 =C2=B1 28%     +51.4%      89.77 =C2=B1 30%  sched_debug.cfs_rq:=
/.removed.util_avg.stddev
    665.61           -64.8%     234.43 =C2=B1 18%  sched_debug.cfs_rq:/.run=
nable_avg.avg
      1886 =C2=B1  8%     -37.4%       1181 =C2=B1 16%  sched_debug.cfs_rq:=
/.runnable_avg.max
    528967 =C2=B1  9%    -101.6%      -8642        sched_debug.cfs_rq:/.spr=
ead0.avg
   1119786 =C2=B1 10%     -99.4%       6842 =C2=B1 55%  sched_debug.cfs_rq:=
/.spread0.max
   -715437           -97.9%     -14712        sched_debug.cfs_rq:/.spread0.=
min
    152488 =C2=B1  7%     -97.6%       3686 =C2=B1 24%  sched_debug.cfs_rq:=
/.spread0.stddev
    628.76           -62.8%     233.60 =C2=B1 18%  sched_debug.cfs_rq:/.uti=
l_avg.avg
      1585 =C2=B1 13%     -25.6%       1179 =C2=B1 16%  sched_debug.cfs_rq:=
/.util_avg.max
    303.61 =C2=B1  3%     -93.0%      21.11 =C2=B1 34%  sched_debug.cfs_rq:=
/.util_est_enqueued.avg
      1127           -32.9%     756.50 =C2=B1 18%  sched_debug.cfs_rq:/.uti=
l_est_enqueued.max
    206.96 =C2=B1  4%     -51.3%     100.87 =C2=B1 22%  sched_debug.cfs_rq:=
/.util_est_enqueued.stddev
   2525689 =C2=B1 11%     -64.2%     903412 =C2=B1  2%  sched_debug.cpu.avg=
_idle.avg
   6234029 =C2=B1  9%     -79.7%    1266582 =C2=B1 16%  sched_debug.cpu.avg=
_idle.max
    299393 =C2=B1 18%     -95.8%      12702 =C2=B1196%  sched_debug.cpu.avg=
_idle.min
   1331474 =C2=B1 13%     -86.1%     185160 =C2=B1 11%  sched_debug.cpu.avg=
_idle.stddev
     68351           -39.0%      41714 =C2=B1 24%  sched_debug.cpu.clock.avg
     68613           -39.2%      41719 =C2=B1 24%  sched_debug.cpu.clock.max
     67731           -38.4%      41708 =C2=B1 24%  sched_debug.cpu.clock.min
    275.33 =C2=B1 28%     -98.9%       3.00 =C2=B1 33%  sched_debug.cpu.clo=
ck.stddev
      1145 =C2=B1 11%     -58.0%     481.20 =C2=B1 36%  sched_debug.cpu.clo=
ck_task.stddev
      3293 =C2=B1  2%     -89.3%     352.66 =C2=B1 26%  sched_debug.cpu.cur=
r->pid.avg
   1704382 =C2=B1  8%     -70.6%     501841        sched_debug.cpu.max_idle=
_balance_cost.avg
   3528217 =C2=B1  7%     -80.3%     695415 =C2=B1 14%  sched_debug.cpu.max=
_idle_balance_cost.max
    638236 =C2=B1 16%     -97.1%      18481 =C2=B1 54%  sched_debug.cpu.max=
_idle_balance_cost.stddev
      0.00 =C2=B1 37%     -97.0%       0.00 =C2=B1 32%  sched_debug.cpu.nex=
t_balance.stddev
      0.57 =C2=B1  3%     -83.3%       0.10 =C2=B1 26%  sched_debug.cpu.nr_=
running.avg
      2.40 =C2=B1  8%     -51.4%       1.17 =C2=B1 31%  sched_debug.cpu.nr_=
running.max
      0.34 =C2=B1  4%     -13.2%       0.29 =C2=B1 15%  sched_debug.cpu.nr_=
running.stddev
     67624           -38.3%      41712 =C2=B1 24%  sched_debug.cpu_clk
     66904           -38.7%      40993 =C2=B1 24%  sched_debug.ktime
      0.00          -100.0%       0.00        sched_debug.rt_rq:/.rt_nr_mig=
ratory.avg
      0.50          -100.0%       0.00        sched_debug.rt_rq:/.rt_nr_mig=
ratory.max
      0.04          -100.0%       0.00        sched_debug.rt_rq:/.rt_nr_mig=
ratory.stddev
      0.00 =C2=B1 33%    -100.0%       0.00        sched_debug.rt_rq:/.rt_n=
r_running.avg
      0.50          -100.0%       0.00        sched_debug.rt_rq:/.rt_nr_run=
ning.max
      0.05 =C2=B1 15%    -100.0%       0.00        sched_debug.rt_rq:/.rt_n=
r_running.stddev
      2.18 =C2=B1 19%    -100.0%       0.00        sched_debug.rt_rq:/.rt_t=
ime.avg
    273.15 =C2=B1 24%    -100.0%       0.00        sched_debug.rt_rq:/.rt_t=
ime.max
     24.05 =C2=B1 24%    -100.0%       0.00        sched_debug.rt_rq:/.rt_t=
ime.stddev
     68997           -37.0%      43458 =C2=B1 25%  sched_debug.sched_clk
    128.87 =C2=B1 15%    -122.8        6.06 =C2=B1 45%  perf-profile.calltr=
ace.cycles-pp.asm_sysvec_apic_timer_interrupt.stress_lockbus
     43.54 =C2=B1 21%     -18.7       24.80 =C2=B1 11%  perf-profile.calltr=
ace.cycles-pp.stress_lockbus
     15.57 =C2=B1  3%     -15.6        0.00        perf-profile.calltrace.c=
ycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.stress=
_lockbus
     13.77 =C2=B1  3%     -13.8        0.00        perf-profile.calltrace.c=
ycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysv=
ec_apic_timer_interrupt.stress_lockbus
     13.65 =C2=B1  3%     -13.7        0.00        perf-profile.calltrace.c=
ycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_=
interrupt.asm_sysvec_apic_timer_interrupt.stress_lockbus
     10.18 =C2=B1  7%      -5.4        4.76 =C2=B1 55%  perf-profile.calltr=
ace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_in=
terrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      6.71 =C2=B1 12%      -3.7        2.97 =C2=B1 54%  perf-profile.calltr=
ace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sys=
vec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      5.91 =C2=B1 14%      -3.6        2.32 =C2=B1 55%  perf-profile.calltr=
ace.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrt=
imer_run_queues.hrtimer_interrupt
      6.06 =C2=B1 14%      -3.5        2.54 =C2=B1 60%  perf-profile.calltr=
ace.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtim=
er_interrupt.__sysvec_apic_timer_interrupt
      4.80 =C2=B1 15%      -3.5        1.31 =C2=B1 44%  perf-profile.calltr=
ace.cycles-pp.scheduler_tick.update_process_times.tick_sched_handle.tick_sc=
hed_timer.__hrtimer_run_queues
      2.12 =C2=B1 10%      -1.3        0.84 =C2=B1 46%  perf-profile.calltr=
ace.cycles-pp.perf_mux_hrtimer_handler.__hrtimer_run_queues.hrtimer_interru=
pt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      2.01 =C2=B1  8%      -0.5        1.49 =C2=B1 19%  perf-profile.calltr=
ace.cycles-pp.clockevents_program_event.hrtimer_interrupt.__sysvec_apic_tim=
er_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.58 =C2=B1  6%      +0.4        1.02 =C2=B1 20%  perf-profile.calltr=
ace.cycles-pp.rebalance_domains.__softirqentry_text_start.__irq_exit_rcu.sy=
svec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.00            +0.6        0.61 =C2=B1  7%  perf-profile.calltrace.c=
ycles-pp.lapic_next_deadline.clockevents_program_event.hrtimer_interrupt.__=
sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.00            +0.7        0.70 =C2=B1 22%  perf-profile.calltrace.c=
ycles-pp.load_balance.rebalance_domains.__softirqentry_text_start.__irq_exi=
t_rcu.sysvec_apic_timer_interrupt
      0.00            +0.8        0.78 =C2=B1 37%  perf-profile.calltrace.c=
ycles-pp.ktime_get.tick_irq_enter.irq_enter_rcu.sysvec_apic_timer_interrupt=
.asm_sysvec_apic_timer_interrupt
      0.00            +1.2        1.17 =C2=B1 27%  perf-profile.calltrace.c=
ycles-pp.tick_irq_enter.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysve=
c_apic_timer_interrupt.cpuidle_enter_state
      0.00            +1.2        1.21 =C2=B1 26%  perf-profile.calltrace.c=
ycles-pp.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_in=
terrupt.cpuidle_enter_state.cpuidle_enter
      0.00            +1.4        1.38 =C2=B1 12%  perf-profile.calltrace.c=
ycles-pp.tick_nohz_next_event.tick_nohz_get_sleep_length.menu_select.cpuidl=
e_idle_call.do_idle
      0.00            +1.9        1.87 =C2=B1 28%  perf-profile.calltrace.c=
ycles-pp.__softirqentry_text_start.__irq_exit_rcu.sysvec_apic_timer_interru=
pt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.00            +2.1        2.10 =C2=B1  6%  perf-profile.calltrace.c=
ycles-pp.tick_nohz_get_sleep_length.menu_select.cpuidle_idle_call.do_idle.c=
pu_startup_entry
      0.00            +2.8        2.84 =C2=B1 14%  perf-profile.calltrace.c=
ycles-pp.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_i=
nterrupt.cpuidle_enter_state.cpuidle_enter
      0.00            +4.4        4.42 =C2=B1 18%  perf-profile.calltrace.c=
ycles-pp.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry.secondary_=
startup_64_no_verify
      0.00            +7.3        7.34 =C2=B1 36%  perf-profile.calltrace.c=
ycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_=
interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.00            +7.5        7.53 =C2=B1 38%  perf-profile.calltrace.c=
ycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysv=
ec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.00           +12.6       12.59 =C2=B1 31%  perf-profile.calltrace.c=
ycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidl=
e_enter_state.cpuidle_enter.cpuidle_idle_call
      0.00           +15.9       15.90 =C2=B1 26%  perf-profile.calltrace.c=
ycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.=
cpuidle_idle_call.do_idle
      0.00           +47.0       47.02 =C2=B1  8%  perf-profile.calltrace.c=
ycles-pp.mwait_idle_with_hints.intel_idle.cpuidle_enter_state.cpuidle_enter=
.cpuidle_idle_call
      0.00           +47.2       47.21 =C2=B1  8%  perf-profile.calltrace.c=
ycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_=
idle
      0.00           +65.0       64.98 =C2=B1  3%  perf-profile.calltrace.c=
ycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_st=
artup_entry
      0.00           +65.3       65.26 =C2=B1  3%  perf-profile.calltrace.c=
ycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.secondar=
y_startup_64_no_verify
      0.00           +70.6       70.57 =C2=B1  4%  perf-profile.calltrace.c=
ycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.secondary_startup_64_n=
o_verify
      0.00           +71.3       71.30 =C2=B1  4%  perf-profile.calltrace.c=
ycles-pp.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
      0.00           +71.4       71.39 =C2=B1  4%  perf-profile.calltrace.c=
ycles-pp.cpu_startup_entry.secondary_startup_64_no_verify
      0.00           +72.0       71.98 =C2=B1  4%  perf-profile.calltrace.c=
ycles-pp.secondary_startup_64_no_verify
     95.06           -68.0       27.09 =C2=B1 12%  perf-profile.children.cy=
cles-pp.stress_lockbus
     80.12 =C2=B1 13%     -61.7       18.47 =C2=B1 23%  perf-profile.childr=
en.cycles-pp.asm_sysvec_apic_timer_interrupt
     14.64 =C2=B1  3%      -7.2        7.48 =C2=B1 36%  perf-profile.childr=
en.cycles-pp.hrtimer_interrupt
     14.76 =C2=B1  3%      -7.1        7.66 =C2=B1 38%  perf-profile.childr=
en.cycles-pp.__sysvec_apic_timer_interrupt
     10.91 =C2=B1  7%      -6.1        4.86 =C2=B1 54%  perf-profile.childr=
en.cycles-pp.__hrtimer_run_queues
      7.20 =C2=B1 12%      -4.2        3.02 =C2=B1 54%  perf-profile.childr=
en.cycles-pp.tick_sched_timer
      6.33 =C2=B1 14%      -4.0        2.38 =C2=B1 55%  perf-profile.childr=
en.cycles-pp.update_process_times
      6.48 =C2=B1 14%      -3.9        2.58 =C2=B1 60%  perf-profile.childr=
en.cycles-pp.tick_sched_handle
      5.18 =C2=B1 15%      -3.8        1.35 =C2=B1 43%  perf-profile.childr=
en.cycles-pp.scheduler_tick
      2.95 =C2=B1  9%      -2.5        0.43 =C2=B1 17%  perf-profile.childr=
en.cycles-pp.entry_SYSCALL_64_after_hwframe
      2.95 =C2=B1  9%      -2.5        0.43 =C2=B1 17%  perf-profile.childr=
en.cycles-pp.do_syscall_64
      2.32 =C2=B1 10%      -1.4        0.87 =C2=B1 43%  perf-profile.childr=
en.cycles-pp.perf_mux_hrtimer_handler
      1.61 =C2=B1  5%      -1.3        0.27 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.__intel_pmu_enable_all
      1.37 =C2=B1 12%      -1.3        0.07 =C2=B1 55%  perf-profile.childr=
en.cycles-pp.update_load_avg
      1.41 =C2=B1  2%      -1.3        0.15 =C2=B1 28%  perf-profile.childr=
en.cycles-pp.error_entry
      1.46 =C2=B1  4%      -0.9        0.56 =C2=B1 21%  perf-profile.childr=
en.cycles-pp.native_sched_clock
      0.82 =C2=B1 10%      -0.7        0.10 =C2=B1 27%  perf-profile.childr=
en.cycles-pp.asm_exc_page_fault
      2.21 =C2=B1  8%      -0.7        1.52 =C2=B1 18%  perf-profile.childr=
en.cycles-pp.clockevents_program_event
      0.71 =C2=B1  9%      -0.6        0.09 =C2=B1 28%  perf-profile.childr=
en.cycles-pp.exc_page_fault
      0.70 =C2=B1  9%      -0.6        0.09 =C2=B1 27%  perf-profile.childr=
en.cycles-pp.do_user_addr_fault
      0.58 =C2=B1  7%      -0.5        0.08 =C2=B1 29%  perf-profile.childr=
en.cycles-pp.handle_mm_fault
      0.53 =C2=B1  7%      -0.5        0.08 =C2=B1 35%  perf-profile.childr=
en.cycles-pp.__handle_mm_fault
      0.53 =C2=B1 10%      -0.5        0.07 =C2=B1 39%  perf-profile.childr=
en.cycles-pp.__update_load_avg_cfs_rq
      0.51 =C2=B1  4%      -0.4        0.09 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.__x64_sys_execve
      0.51 =C2=B1  3%      -0.4        0.09 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.do_execveat_common
      0.50 =C2=B1  2%      -0.4        0.09 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.execve
      0.67 =C2=B1 17%      -0.4        0.28 =C2=B1 30%  perf-profile.childr=
en.cycles-pp.ret_from_fork
      0.65 =C2=B1 17%      -0.4        0.28 =C2=B1 31%  perf-profile.childr=
en.cycles-pp.kthread
      0.76 =C2=B1 10%      -0.3        0.41 =C2=B1 41%  perf-profile.childr=
en.cycles-pp.update_rq_clock
      0.40 =C2=B1  4%      -0.3        0.07 =C2=B1 18%  perf-profile.childr=
en.cycles-pp.bprm_execve
      0.36 =C2=B1  4%      -0.3        0.06 =C2=B1 46%  perf-profile.childr=
en.cycles-pp.exec_binprm
      0.35 =C2=B1  7%      -0.3        0.04 =C2=B1 73%  perf-profile.childr=
en.cycles-pp.exit_mmap
      0.36 =C2=B1  4%      -0.3        0.06 =C2=B1 46%  perf-profile.childr=
en.cycles-pp.search_binary_handler
      0.36 =C2=B1  3%      -0.3        0.06 =C2=B1 46%  perf-profile.childr=
en.cycles-pp.load_elf_binary
      0.35 =C2=B1  6%      -0.3        0.05 =C2=B1 48%  perf-profile.childr=
en.cycles-pp.mmput
      0.40 =C2=B1  7%      -0.3        0.12 =C2=B1 20%  perf-profile.childr=
en.cycles-pp.__schedule
      0.36 =C2=B1  8%      -0.3        0.08 =C2=B1 19%  perf-profile.childr=
en.cycles-pp.schedule
      0.72 =C2=B1  5%      -0.3        0.45 =C2=B1 27%  perf-profile.childr=
en.cycles-pp._raw_spin_lock
      0.30 =C2=B1  3%      -0.3        0.03 =C2=B1100%  perf-profile.childr=
en.cycles-pp.__x64_sys_openat
      0.30 =C2=B1  4%      -0.3        0.03 =C2=B1100%  perf-profile.childr=
en.cycles-pp.do_sys_openat2
      0.34 =C2=B1  8%      -0.3        0.08 =C2=B1 36%  perf-profile.childr=
en.cycles-pp.ksys_read
      0.33 =C2=B1  7%      -0.3        0.08 =C2=B1 37%  perf-profile.childr=
en.cycles-pp.vfs_read
      0.38 =C2=B1  2%      -0.2        0.13 =C2=B1 27%  perf-profile.childr=
en.cycles-pp._raw_spin_lock_irq
      0.27 =C2=B1  2%      -0.2        0.03 =C2=B1100%  perf-profile.childr=
en.cycles-pp.do_filp_open
      0.27 =C2=B1  2%      -0.2        0.03 =C2=B1100%  perf-profile.childr=
en.cycles-pp.path_openat
      0.65 =C2=B1 13%      -0.2        0.45 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.ktime_get_update_offsets_now
      0.33 =C2=B1 17%      -0.2        0.16 =C2=B1 55%  perf-profile.childr=
en.cycles-pp.process_one_work
      0.35 =C2=B1 17%      -0.2        0.18 =C2=B1 42%  perf-profile.childr=
en.cycles-pp.worker_thread
      0.12 =C2=B1 10%      -0.1        0.02 =C2=B1 99%  perf-profile.childr=
en.cycles-pp.smpboot_thread_fn
      0.20 =C2=B1  7%      -0.1        0.11 =C2=B1 33%  perf-profile.childr=
en.cycles-pp._raw_spin_unlock_irqrestore
      0.07 =C2=B1  9%      +0.0        0.10 =C2=B1 20%  perf-profile.childr=
en.cycles-pp.cpumask_next_and
      0.02 =C2=B1122%      +0.1        0.07 =C2=B1 28%  perf-profile.childr=
en.cycles-pp.update_group_capacity
      0.00            +0.1        0.06 =C2=B1 19%  perf-profile.children.cy=
cles-pp.cpuidle_reflect
      0.13 =C2=B1  7%      +0.1        0.20 =C2=B1 27%  perf-profile.childr=
en.cycles-pp._raw_spin_trylock
      0.00            +0.1        0.07 =C2=B1 23%  perf-profile.children.cy=
cles-pp.sched_clock
      0.00            +0.1        0.10 =C2=B1 26%  perf-profile.children.cy=
cles-pp.arch_cpu_idle_exit
      0.00            +0.1        0.11 =C2=B1 41%  perf-profile.children.cy=
cles-pp.rcu_eqs_enter
      0.01 =C2=B1200%      +0.1        0.12 =C2=B1 28%  perf-profile.childr=
en.cycles-pp.__libc_start_main
      0.01 =C2=B1200%      +0.1        0.12 =C2=B1 28%  perf-profile.childr=
en.cycles-pp.main
      0.01 =C2=B1200%      +0.1        0.12 =C2=B1 28%  perf-profile.childr=
en.cycles-pp.run_builtin
      0.24 =C2=B1  4%      +0.1        0.36 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.update_sg_lb_stats
      0.00            +0.1        0.12 =C2=B1 47%  perf-profile.children.cy=
cles-pp.calc_global_load_tick
      0.00            +0.1        0.12 =C2=B1 13%  perf-profile.children.cy=
cles-pp.menu_reflect
      0.00            +0.1        0.13 =C2=B1 67%  perf-profile.children.cy=
cles-pp.tick_nohz_tick_stopped
      0.00            +0.1        0.14 =C2=B1 26%  perf-profile.children.cy=
cles-pp.call_cpuidle
      0.00            +0.2        0.15 =C2=B1 25%  perf-profile.children.cy=
cles-pp.rcu_dynticks_inc
      0.00            +0.2        0.18 =C2=B1 58%  perf-profile.children.cy=
cles-pp.timerqueue_iterate_next
      0.00            +0.2        0.19 =C2=B1 42%  perf-profile.children.cy=
cles-pp.io_serial_in
      0.23 =C2=B1 13%      +0.2        0.44 =C2=B1 17%  perf-profile.childr=
en.cycles-pp.__hrtimer_next_event_base
      0.03 =C2=B1 82%      +0.2        0.26 =C2=B1 45%  perf-profile.childr=
en.cycles-pp.__update_blocked_fair
      0.33 =C2=B1  6%      +0.2        0.56 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.update_sd_lb_stats
      0.00            +0.2        0.24 =C2=B1 65%  perf-profile.children.cy=
cles-pp.nr_iowait_cpu
      0.34 =C2=B1  6%      +0.3        0.59 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.find_busiest_group
      0.00            +0.3        0.25 =C2=B1 46%  perf-profile.children.cy=
cles-pp.serial8250_console_putchar
      0.52 =C2=B1  7%      +0.3        0.78 =C2=B1 17%  perf-profile.childr=
en.cycles-pp.load_balance
      0.39 =C2=B1 15%      +0.3        0.64 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.lapic_next_deadline
      0.00            +0.3        0.26 =C2=B1 43%  perf-profile.children.cy=
cles-pp.wait_for_xmitr
      0.00            +0.3        0.26 =C2=B1 44%  perf-profile.children.cy=
cles-pp.uart_console_write
      0.22 =C2=B1 10%      +0.3        0.48 =C2=B1 48%  perf-profile.childr=
en.cycles-pp.update_blocked_averages
      0.00            +0.3        0.27 =C2=B1 44%  perf-profile.children.cy=
cles-pp.serial8250_console_write
      0.00            +0.3        0.27 =C2=B1 18%  perf-profile.children.cy=
cles-pp.hrtimer_get_next_event
      0.23 =C2=B1 11%      +0.3        0.50 =C2=B1 50%  perf-profile.childr=
en.cycles-pp.run_rebalance_domains
      0.00            +0.3        0.27 =C2=B1 42%  perf-profile.children.cy=
cles-pp.console_unlock
      0.00            +0.3        0.27 =C2=B1 42%  perf-profile.children.cy=
cles-pp.call_console_drivers
      0.03 =C2=B1 82%      +0.3        0.31 =C2=B1 42%  perf-profile.childr=
en.cycles-pp.irq_work_run_list
      0.00            +0.3        0.28 =C2=B1 42%  perf-profile.children.cy=
cles-pp._printk
      0.00            +0.3        0.28 =C2=B1 42%  perf-profile.children.cy=
cles-pp.vprintk_emit
      0.00            +0.3        0.28 =C2=B1 42%  perf-profile.children.cy=
cles-pp.asm_sysvec_irq_work
      0.00            +0.3        0.28 =C2=B1 42%  perf-profile.children.cy=
cles-pp.sysvec_irq_work
      0.00            +0.3        0.28 =C2=B1 42%  perf-profile.children.cy=
cles-pp.__sysvec_irq_work
      0.00            +0.3        0.28 =C2=B1 42%  perf-profile.children.cy=
cles-pp.irq_work_run
      0.00            +0.3        0.28 =C2=B1 42%  perf-profile.children.cy=
cles-pp.irq_work_single
      0.00            +0.3        0.29 =C2=B1 55%  perf-profile.children.cy=
cles-pp.rcu_eqs_exit
      0.00            +0.3        0.31 =C2=B1 16%  perf-profile.children.cy=
cles-pp.tsc_verify_tsc_adjust
      0.00            +0.3        0.32 =C2=B1 18%  perf-profile.children.cy=
cles-pp.arch_cpu_idle_enter
      0.00            +0.3        0.33 =C2=B1 63%  perf-profile.children.cy=
cles-pp.cpuidle_governor_latency_req
      0.20 =C2=B1 13%      +0.4        0.56 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.read_tsc
      0.67 =C2=B1  6%      +0.4        1.06 =C2=B1 18%  perf-profile.childr=
en.cycles-pp.rebalance_domains
      0.00            +0.4        0.41 =C2=B1 16%  perf-profile.children.cy=
cles-pp.tick_nohz_irq_exit
      0.00            +0.4        0.43 =C2=B1 23%  perf-profile.children.cy=
cles-pp.timekeeping_max_deferment
      0.00            +0.5        0.48 =C2=B1 19%  perf-profile.children.cy=
cles-pp.get_next_timer_interrupt
      0.00            +0.5        0.51 =C2=B1 45%  perf-profile.children.cy=
cles-pp.rcu_idle_exit
      1.40 =C2=B1 15%      +0.5        1.94 =C2=B1 27%  perf-profile.childr=
en.cycles-pp.__softirqentry_text_start
      0.10 =C2=B1 11%      +0.5        0.65 =C2=B1 45%  perf-profile.childr=
en.cycles-pp.idle_cpu
      0.00            +0.6        0.59 =C2=B1  9%  perf-profile.children.cy=
cles-pp.hrtimer_next_event_without
      0.00            +0.6        0.60 =C2=B1 14%  perf-profile.children.cy=
cles-pp.start_kernel
      1.43 =C2=B1  9%      +0.8        2.20 =C2=B1 29%  perf-profile.childr=
en.cycles-pp.ktime_get
      0.00            +0.9        0.94 =C2=B1 13%  perf-profile.children.cy=
cles-pp.native_irq_return_iret
      1.92 =C2=B1 10%      +1.0        2.92 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.__irq_exit_rcu
      0.00            +1.2        1.20 =C2=B1 27%  perf-profile.children.cy=
cles-pp.tick_irq_enter
      0.00            +1.2        1.23 =C2=B1 27%  perf-profile.children.cy=
cles-pp.irq_enter_rcu
      0.00            +1.4        1.41 =C2=B1 12%  perf-profile.children.cy=
cles-pp.tick_nohz_next_event
      0.00            +2.1        2.14 =C2=B1  6%  perf-profile.children.cy=
cles-pp.tick_nohz_get_sleep_length
      0.00            +4.5        4.50 =C2=B1 18%  perf-profile.children.cy=
cles-pp.menu_select
      0.00           +47.4       47.42 =C2=B1  8%  perf-profile.children.cy=
cles-pp.mwait_idle_with_hints
      0.00           +47.6       47.62 =C2=B1  8%  perf-profile.children.cy=
cles-pp.intel_idle
      0.00           +65.6       65.64 =C2=B1  3%  perf-profile.children.cy=
cles-pp.cpuidle_enter_state
      0.00           +65.8       65.83 =C2=B1  3%  perf-profile.children.cy=
cles-pp.cpuidle_enter
      0.00           +71.2       71.22 =C2=B1  4%  perf-profile.children.cy=
cles-pp.cpuidle_idle_call
      0.01 =C2=B1200%     +72.0       71.98 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.secondary_startup_64_no_verify
      0.01 =C2=B1200%     +72.0       71.98 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.cpu_startup_entry
      0.01 =C2=B1200%     +72.0       71.98 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.do_idle
     66.95           -41.4       25.58 =C2=B1 13%  perf-profile.self.cycles=
-pp.stress_lockbus
      5.20 =C2=B1 24%      -3.5        1.73 =C2=B1 55%  perf-profile.self.c=
ycles-pp.asm_sysvec_apic_timer_interrupt
      1.56 =C2=B1  5%      -1.3        0.27 =C2=B1 10%  perf-profile.self.c=
ycles-pp.__intel_pmu_enable_all
      1.31 =C2=B1 13%      -1.2        0.09 =C2=B1 36%  perf-profile.self.c=
ycles-pp.clockevents_program_event
      1.44 =C2=B1  4%      -0.9        0.52 =C2=B1 19%  perf-profile.self.c=
ycles-pp.native_sched_clock
      0.45 =C2=B1 10%      -0.4        0.07 =C2=B1 39%  perf-profile.self.c=
ycles-pp.__update_load_avg_cfs_rq
      0.42 =C2=B1 10%      -0.3        0.14 =C2=B1 30%  perf-profile.self.c=
ycles-pp.error_entry
      0.61 =C2=B1 13%      -0.3        0.34 =C2=B1 13%  perf-profile.self.c=
ycles-pp.ktime_get_update_offsets_now
      0.36 =C2=B1  3%      -0.2        0.12 =C2=B1 31%  perf-profile.self.c=
ycles-pp._raw_spin_lock_irq
      0.12 =C2=B1 10%      -0.1        0.04 =C2=B1105%  perf-profile.self.c=
ycles-pp.tick_sched_timer
      0.02 =C2=B1125%      +0.1        0.09 =C2=B1 35%  perf-profile.self.c=
ycles-pp.__softirqentry_text_start
      0.00            +0.1        0.07 =C2=B1 27%  perf-profile.self.cycles=
-pp.update_group_capacity
      0.00            +0.1        0.08 =C2=B1 27%  perf-profile.self.cycles=
-pp.menu_reflect
      0.29 =C2=B1  8%      +0.1        0.38 =C2=B1 11%  perf-profile.self.c=
ycles-pp._raw_spin_lock_irqsave
      0.11 =C2=B1  9%      +0.1        0.20 =C2=B1 27%  perf-profile.self.c=
ycles-pp._raw_spin_trylock
      0.00            +0.1        0.09 =C2=B1 17%  perf-profile.self.cycles=
-pp.sched_clock_cpu
      0.18 =C2=B1  6%      +0.1        0.27 =C2=B1 15%  perf-profile.self.c=
ycles-pp.update_sg_lb_stats
      0.00            +0.1        0.10 =C2=B1 36%  perf-profile.self.cycles=
-pp.rcu_eqs_enter
      0.00            +0.1        0.10 =C2=B1 22%  perf-profile.self.cycles=
-pp.update_sd_lb_stats
      0.02 =C2=B1122%      +0.1        0.13 =C2=B1 37%  perf-profile.self.c=
ycles-pp.load_balance
      0.05            +0.1        0.16 =C2=B1 61%  perf-profile.self.cycles=
-pp.rebalance_domains
      0.00            +0.1        0.12 =C2=B1 26%  perf-profile.self.cycles=
-pp.tick_nohz_get_sleep_length
      0.00            +0.1        0.12 =C2=B1 51%  perf-profile.self.cycles=
-pp.cpuidle_governor_latency_req
      0.00            +0.1        0.12 =C2=B1 48%  perf-profile.self.cycles=
-pp.calc_global_load_tick
      0.00            +0.1        0.13 =C2=B1 27%  perf-profile.self.cycles=
-pp.call_cpuidle
      0.00            +0.1        0.13 =C2=B1 36%  perf-profile.self.cycles=
-pp.cpuidle_enter
      0.02 =C2=B1122%      +0.1        0.16 =C2=B1 87%  perf-profile.self.c=
ycles-pp.sysvec_apic_timer_interrupt
      0.00            +0.1        0.14 =C2=B1 24%  perf-profile.self.cycles=
-pp.rcu_dynticks_inc
      0.00            +0.1        0.14 =C2=B1 64%  perf-profile.self.cycles=
-pp.get_next_timer_interrupt
      0.00            +0.1        0.15 =C2=B1 25%  perf-profile.self.cycles=
-pp.hrtimer_get_next_event
      0.00            +0.2        0.15 =C2=B1 58%  perf-profile.self.cycles=
-pp.__update_blocked_fair
      0.00            +0.2        0.17 =C2=B1  4%  perf-profile.self.cycles=
-pp.hrtimer_next_event_without
      0.00            +0.2        0.18 =C2=B1 61%  perf-profile.self.cycles=
-pp.timerqueue_iterate_next
      0.00            +0.2        0.19 =C2=B1 60%  perf-profile.self.cycles=
-pp.rcu_eqs_exit
      0.00            +0.2        0.19 =C2=B1 42%  perf-profile.self.cycles=
-pp.io_serial_in
      0.00            +0.2        0.20 =C2=B1 36%  perf-profile.self.cycles=
-pp.do_idle
      0.00            +0.2        0.20 =C2=B1 19%  perf-profile.self.cycles=
-pp.rcu_idle_exit
      0.00            +0.2        0.21 =C2=B1 27%  perf-profile.self.cycles=
-pp.intel_idle
      0.00            +0.2        0.23 =C2=B1 69%  perf-profile.self.cycles=
-pp.nr_iowait_cpu
      0.00            +0.3        0.26 =C2=B1 15%  perf-profile.self.cycles=
-pp.tsc_verify_tsc_adjust
      0.37 =C2=B1 15%      +0.3        0.64 =C2=B1  7%  perf-profile.self.c=
ycles-pp.lapic_next_deadline
      0.00            +0.4        0.38 =C2=B1 18%  perf-profile.self.cycles=
-pp.cpuidle_idle_call
      0.16 =C2=B1 16%      +0.4        0.54 =C2=B1  6%  perf-profile.self.c=
ycles-pp.read_tsc
      0.00            +0.4        0.42 =C2=B1 37%  perf-profile.self.cycles=
-pp.tick_nohz_next_event
      0.00            +0.4        0.42 =C2=B1 26%  perf-profile.self.cycles=
-pp.timekeeping_max_deferment
      0.09 =C2=B1 12%      +0.6        0.64 =C2=B1 45%  perf-profile.self.c=
ycles-pp.idle_cpu
      0.00            +0.9        0.94 =C2=B1 13%  perf-profile.self.cycles=
-pp.native_irq_return_iret
      0.00            +1.9        1.93 =C2=B1 28%  perf-profile.self.cycles=
-pp.menu_select
      0.00            +2.5        2.48 =C2=B1 16%  perf-profile.self.cycles=
-pp.cpuidle_enter_state
      0.00           +47.4       47.40 =C2=B1  8%  perf-profile.self.cycles=
-pp.mwait_idle_with_hints




Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp


--===============6600429064834038380==--

