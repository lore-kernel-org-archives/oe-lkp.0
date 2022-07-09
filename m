Content-Type: multipart/mixed; boundary="===============1169917812061895518=="
MIME-Version: 1.0
From: Abel Wu <wuyun.abel@bytedance.com>
To: lkp@lists.01.org
Subject: [sched/fair] 32fe13cd7a: phoronix-test-suite.fio.SequentialWrite.IO_uring.Yes.No.4KB.DefaultTestDirectory.mb_s -11.7% regression
Date: Sun, 10 Jul 2022 00:14:15 +0800
Message-ID: <9e02396c-0656-e3be-7947-5526fcab48ba@bytedance.com>
In-Reply-To: <YsmT6VAqPybIe9Pu@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1169917812061895518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Robot, thanks for your testing!

On 7/9/22 10:42 PM, kernel test robot Wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a -11.7% regression of phoronix-test-suite.fio.Sequential=
Write.IO_uring.Yes.No.4KB.DefaultTestDirectory.mb_s due to commit:
> =

> =

> commit: 32fe13cd7aa184ed349d698ebf6f420fa426dd73 ("[PATCH v4 7/7] sched/f=
air: de-entropy for SIS filter")
> url: https://github.com/intel-lab-lkp/linux/commits/Abel-Wu/sched-fair-im=
prove-scan-efficiency-of-SIS/20220619-200743
> base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git f3dd3f6745=
55bd9455c5ae7fafce0696bd9931b3
> patch link: https://lore.kernel.org/lkml/20220619120451.95251-8-wuyun.abe=
l(a)bytedance.com
> =

> in testcase: phoronix-test-suite
> on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.=
10GHz with 512G memory

Does SNC enabled?

> with following parameters:
> =

> 	test: fio-1.14.1
> 	option_a: Sequential Write
> 	option_b: IO_uring
> 	option_c: Yes
> 	option_d: No
> 	option_e: 4KB
> 	option_f: Default Test Directory
> 	cpufreq_governor: performance
> 	ucode: 0x500320a
> =

> test-description: The Phoronix Test Suite is the most comprehensive testi=
ng and benchmarking platform available that provides an extensible framewor=
k for which new tests can be easily added.
> test-url: http://www.phoronix-test-suite.com/
> =

> In addition to that, the commit also has significant impact on the follow=
ing tests:
> =

> +------------------+-----------------------------------------------------=
--------------------------------+
> | testcase: change | stress-ng: stress-ng.vm-rw.ops_per_sec 113.5% improv=
ement                           |
> | test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358=
 CPU @ 2.60GHz with 128G memory |
> | test parameters  | class=3Dmemory                                      =
                                  |
> |                  | cpufreq_governor=3Dperformance                      =
                                  |
> |                  | nr_threads=3D100%                                   =
                                  |
> |                  | test=3Dvm-rw                                        =
                                  |
> |                  | testtime=3D60s                                      =
                                  |
> |                  | ucode=3D0xd000331                                   =
                                  |
> +------------------+-----------------------------------------------------=
--------------------------------+
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

>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          sudo bin/lkp install job.yaml           # job file is attached i=
n this email
>          bin/lkp split-job --compatible job.yaml # generate the yaml file=
 for lkp run
>          sudo bin/lkp run generated-yaml-file
> =

>          # if come across any failure that blocks the test,
>          # please remove ~/.lkp and /lkp dir to run from a clean state.
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/option_a/option_b/option_c/option_d/opt=
ion_e/option_f/rootfs/tbox_group/test/testcase/ucode:
>    gcc-11/performance/x86_64-rhel-8.3/Sequential Write/IO_uring/Yes/No/4K=
B/Default Test Directory/debian-x86_64-phoronix/lkp-csl-2sp7/fio-1.14.1/pho=
ronix-test-suite/0x500320a
> =

> commit:
>    fcc108377a ("sched/fair: skip busy cores in SIS search")
>    32fe13cd7a ("sched/fair: de-entropy for SIS filter")

Does the 5th patch applied? It's also important to bail out early if
the system is busy enough that idle cpus can hardly exist.

> =

> fcc108377a7cf79c 32fe13cd7aa184ed349d698ebf6
> ---------------- ---------------------------
>           %stddev     %change         %stddev
>               \          |                \
>      166666           -11.6%     147277 =C2=B1  3%  phoronix-test-suite.f=
io.SequentialWrite.IO_uring.Yes.No.4KB.DefaultTestDirectory.iops
>      651.00           -11.7%     574.83 =C2=B1  3%  phoronix-test-suite.f=
io.SequentialWrite.IO_uring.Yes.No.4KB.DefaultTestDirectory.mb_s
>        3145 =C2=B1  5%     -18.4%       2565 =C2=B1 12%  meminfo.Writeback
>        0.19 =C2=B1  4%      -0.0        0.17 =C2=B1  2%  mpstat.cpu.all.i=
owait%
>        2228 =C2=B1 33%     -37.5%       1392 =C2=B1 21%  numa-meminfo.nod=
e0.Writeback
>      553.33 =C2=B1 37%     -35.9%     354.83 =C2=B1 18%  numa-vmstat.node=
0.nr_writeback

I will try to reproduce the test to see why there is such a big change.

>      445604 =C2=B1  4%     -12.5%     390116 =C2=B1  4%  vmstat.io.bo
>    14697101 =C2=B1  3%     -11.0%   13074497 =C2=B1  4%  perf-stat.i.cach=
e-misses
>        9447 =C2=B1  8%     -37.6%       5890 =C2=B1  5%  perf-stat.i.cpu-=
migrations
>        5125 =C2=B1  6%     +12.9%       5786 =C2=B1  6%  perf-stat.i.inst=
ructions-per-iTLB-miss
>     2330431 =C2=B1  4%     -11.4%    2064845 =C2=B1  4%  perf-stat.i.node=
-loads
>        2.55 =C2=B1104%      -1.6        0.96 =C2=B1 14%  perf-profile.cal=
ltrace.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_c=
all.do_idle
>        2.62 =C2=B1102%      -1.6        0.99 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.poll_idle
>        0.82 =C2=B1 23%      -0.3        0.53 =C2=B1 23%  perf-profile.chi=
ldren.cycles-pp.asm_sysvec_call_function_single
>        0.74 =C2=B1 23%      -0.3        0.46 =C2=B1 23%  perf-profile.chi=
ldren.cycles-pp.sysvec_call_function_single
>        0.69 =C2=B1 24%      -0.3        0.44 =C2=B1 24%  perf-profile.chi=
ldren.cycles-pp.__sysvec_call_function_single
>        0.38 =C2=B1 10%      -0.1        0.28 =C2=B1 18%  perf-profile.chi=
ldren.cycles-pp.__perf_event_header__init_id
>        0.16 =C2=B1 13%      -0.0        0.11 =C2=B1 22%  perf-profile.chi=
ldren.cycles-pp.__task_pid_nr_ns
>        2.10 =C2=B1108%      -1.3        0.79 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.poll_idle
>        0.16 =C2=B1 13%      -0.0        0.11 =C2=B1 22%  perf-profile.sel=
f.cycles-pp.__task_pid_nr_ns
> =

> =

> *************************************************************************=
**************************
> lkp-icl-2sp6: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ =
2.60GHz with 128G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> class/compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test=
/testcase/testtime/ucode:
>    memory/gcc-11/performance/x86_64-rhel-8.3/100%/debian-11.1-x86_64-2022=
0510.cgz/lkp-icl-2sp6/vm-rw/stress-ng/60s/0xd000331
> =

> commit:
>    fcc108377a ("sched/fair: skip busy cores in SIS search")
>    32fe13cd7a ("sched/fair: de-entropy for SIS filter")
> =

> fcc108377a7cf79c 32fe13cd7aa184ed349d698ebf6
> ---------------- ---------------------------
>           %stddev     %change         %stddev
>               \          |                \
>     7328835 =C2=B1 17%   +3441.0%  2.595e+08 =C2=B1 12%  stress-ng.time.i=
nvoluntary_context_switches

It's really horrible..

>      123165 =C2=B1  3%     -14.1%     105742 =C2=B1  2%  stress-ng.time.m=
inor_page_faults
>        8940           +32.8%      11872 =C2=B1  2%  stress-ng.time.percen=
t_of_cpu_this_job_got
>        5268           +33.4%       7027 =C2=B1  2%  stress-ng.time.system=
_time
>      278.70           +21.5%     338.70 =C2=B1  2%  stress-ng.time.user_t=
ime
>   2.554e+08           +13.3%  2.894e+08        stress-ng.time.voluntary_c=
ontext_switches
>   1.283e+08          +113.5%   2.74e+08 =C2=B1  6%  stress-ng.vm-rw.ops
>     2139049          +113.5%    4567054 =C2=B1  6%  stress-ng.vm-rw.ops_p=
er_sec
>       39411 =C2=B1 34%     +56.3%      61612 =C2=B1 24%  numa-meminfo.nod=
e1.Mapped
>        5013           -22.5%       3883 =C2=B1  4%  uptime.idle
>   1.798e+09           -60.3%  7.135e+08 =C2=B1 21%  cpuidle..time >   1.7=
01e+08           -87.3%   21598951 =C2=B1 90%  cpuidle..usage
>       75821 =C2=B1  2%     -11.6%      67063 =C2=B1  5%  meminfo.Active
>       75821 =C2=B1  2%     -11.6%      67063 =C2=B1  5%  meminfo.Active(a=
non)
>       81710 =C2=B1  2%     +20.1%      98158 =C2=B1  3%  meminfo.Mapped
>       26.00           -59.6%      10.50 =C2=B1 18%  vmstat.cpu.id
>      112.00           +10.9%     124.17        vmstat.procs.r
>     6561639           +31.6%    8634043 =C2=B1  2%  vmstat.system.cs
>      990604           -62.4%     372118 =C2=B1 18%  vmstat.system.in
>       24.13           -16.1        8.03 =C2=B1 23%  mpstat.cpu.all.idle%

This indicates that the SIS scan efficiency is largely improved, which
is in line with our expectations.

>        2.71            -1.6        1.11 =C2=B1 10%  mpstat.cpu.all.irq%
>        0.17 =C2=B1  6%      -0.1        0.06 =C2=B1 30%  mpstat.cpu.all.s=
oft%
>       69.33           +17.4       86.71 =C2=B1  2%  mpstat.cpu.all.sys%
>        3.66            +0.4        4.09        mpstat.cpu.all.usr%
>   2.024e+09           +93.3%  3.912e+09 =C2=B1 16%  numa-vmstat.node0.nr_=
foll_pin_acquired
>   2.024e+09           +93.3%  3.912e+09 =C2=B1 16%  numa-vmstat.node0.nr_=
foll_pin_released
>   2.043e+09 =C2=B1  2%    +119.0%  4.473e+09        numa-vmstat.node1.nr_=
foll_pin_acquired
>   2.043e+09 =C2=B1  2%    +119.0%  4.473e+09        numa-vmstat.node1.nr_=
foll_pin_released
>        9865 =C2=B1 34%     +54.1%      15201 =C2=B1 23%  numa-vmstat.node=
1.nr_mapped
>       18954 =C2=B1  2%     -11.5%      16767 =C2=B1  5%  proc-vmstat.nr_a=
ctive_anon
>   4.062e+09          +107.3%  8.419e+09 =C2=B1  7%  proc-vmstat.nr_foll_p=
in_acquired
>   4.062e+09          +107.3%  8.419e+09 =C2=B1  7%  proc-vmstat.nr_foll_p=
in_released
>       87380            +5.3%      92039        proc-vmstat.nr_inactive_an=
on
>       24453            -3.2%      23658        proc-vmstat.nr_kernel_stack
>       20437 =C2=B1  2%     +19.6%      24443 =C2=B1  3%  proc-vmstat.nr_m=
apped
>       18954 =C2=B1  2%     -11.5%      16767 =C2=B1  5%  proc-vmstat.nr_z=
one_active_anon
>       87380            +5.3%      92039        proc-vmstat.nr_zone_inacti=
ve_anon
>      108777 =C2=B1  4%     -17.2%      90014        proc-vmstat.numa_hint=
_faults
>       96756 =C2=B1  6%     -17.6%      79691 =C2=B1  2%  proc-vmstat.numa=
_hint_faults_local
>      490607            -4.4%     469155        proc-vmstat.pgfault
>       80.85           +10.9       91.75        turbostat.Busy%
>        3221            -5.0%       3060        turbostat.Bzy_MHz
>    77259218 =C2=B1  3%     -87.0%   10057388 =C2=B1 92%  turbostat.C1
>        6.74 =C2=B1  2%      -5.9        0.85 =C2=B1 90%  turbostat.C1%
>    92212921           -87.8%   11243535 =C2=B1 91%  turbostat.C1E
>       12.00 =C2=B1 22%      -6.6        5.42 =C2=B1 57%  turbostat.C1E%

and this.

>       16.39 =C2=B1 16%     -62.0%       6.24 =C2=B1 55%  turbostat.CPU%c1
>        0.16 =C2=B1  3%     +74.7%       0.29 =C2=B1  6%  turbostat.IPC
>    65322725           -62.5%   24502370 =C2=B1 18%  turbostat.IRQ
>      339708           -86.5%      45941 =C2=B1 88%  turbostat.POLL
>        0.05            -0.0        0.01 =C2=B1 82%  turbostat.POLL%
>      165121 =C2=B1 23%    -100.0%      39.19 =C2=B1101%  sched_debug.cfs_=
rq:/.MIN_vruntime.avg
>     2462709           -99.9%       3407 =C2=B1102%  sched_debug.cfs_rq:/.=
MIN_vruntime.max
>      607348 =C2=B1 11%     -99.9%     348.57 =C2=B1100%  sched_debug.cfs_=
rq:/.MIN_vruntime.stddev
>        0.56 =C2=B1  4%     +11.8%       0.62 =C2=B1  3%  sched_debug.cfs_=
rq:/.h_nr_running.avg
>        2.58 =C2=B1 13%     -38.7%       1.58 =C2=B1 11%  sched_debug.cfs_=
rq:/.h_nr_running.max
>        0.54 =C2=B1  9%     -39.7%       0.33 =C2=B1  6%  sched_debug.cfs_=
rq:/.h_nr_running.stddev
>      165121 =C2=B1 23%    -100.0%      39.19 =C2=B1101%  sched_debug.cfs_=
rq:/.max_vruntime.avg
>     2462709           -99.9%       3407 =C2=B1102%  sched_debug.cfs_rq:/.=
max_vruntime.max
>      607348 =C2=B1 11%     -99.9%     348.57 =C2=B1100%  sched_debug.cfs_=
rq:/.max_vruntime.stddev
>     2439879           +43.2%    3493834 =C2=B1  4%  sched_debug.cfs_rq:/.=
min_vruntime.avg
>     2485561           +49.1%    3705888        sched_debug.cfs_rq:/.min_v=
runtime.max
>     2129935           +34.5%    2865147 =C2=B1  2%  sched_debug.cfs_rq:/.=
min_vruntime.min
>       35480 =C2=B1 17%    +324.2%     150497 =C2=B1 59%  sched_debug.cfs_=
rq:/.min_vruntime.stddev
>        0.43 =C2=B1  3%     +27.9%       0.55        sched_debug.cfs_rq:/.=
nr_running.avg
>        0.35 =C2=B1  5%     -57.2%       0.15 =C2=B1  4%  sched_debug.cfs_=
rq:/.nr_running.stddev
>        2186 =C2=B1 15%     -27.9%       1575 =C2=B1 11%  sched_debug.cfs_=
rq:/.runnable_avg.max
>      152.08 =C2=B1  6%    +134.5%     356.58 =C2=B1 31%  sched_debug.cfs_=
rq:/.runnable_avg.min
>      399.32 =C2=B1  4%     -50.5%     197.69 =C2=B1  8%  sched_debug.cfs_=
rq:/.runnable_avg.stddev
>       25106 =C2=B1 50%   +1121.1%     306577 =C2=B1 66%  sched_debug.cfs_=
rq:/.spread0.max
>       35510 =C2=B1 17%    +323.3%     150305 =C2=B1 59%  sched_debug.cfs_=
rq:/.spread0.stddev
>      545.95 =C2=B1  3%     +16.4%     635.59        sched_debug.cfs_rq:/.=
util_avg.avg
>        1726 =C2=B1 15%     -26.7%       1266 =C2=B1 14%  sched_debug.cfs_=
rq:/.util_avg.max
>      154.67 =C2=B1  2%    +112.9%     329.33 =C2=B1 30%  sched_debug.cfs_=
rq:/.util_avg.min
>      317.35 =C2=B1  4%     -43.1%     180.53 =C2=B1 10%  sched_debug.cfs_=
rq:/.util_avg.stddev
>      192.70 =C2=B1  6%    +104.5%     393.98 =C2=B1  7%  sched_debug.cfs_=
rq:/.util_est_enqueued.avg
>        5359 =C2=B1  4%     -26.1%       3958 =C2=B1  8%  sched_debug.cpu.=
avg_idle.min
>        4.69 =C2=B1  7%    +136.0%      11.07 =C2=B1  5%  sched_debug.cpu.=
clock.stddev
>        2380 =C2=B1  4%     +31.0%       3117        sched_debug.cpu.curr-=
>pid.avg
>        1818 =C2=B1  3%     -65.9%     620.26 =C2=B1  8%  sched_debug.cpu.=
curr->pid.stddev
>        0.00 =C2=B1  8%     +59.7%       0.00 =C2=B1 10%  sched_debug.cpu.=
next_balance.stddev
>        2.58 =C2=B1 17%     -41.9%       1.50        sched_debug.cpu.nr_ru=
nning.max
>        0.52 =C2=B1  9%     -43.2%       0.29 =C2=B1  5%  sched_debug.cpu.=
nr_running.stddev
>     1610935           +31.3%    2115112 =C2=B1  2%  sched_debug.cpu.nr_sw=
itches.avg
>     1661619           +34.5%    2234069        sched_debug.cpu.nr_switche=
s.max
>     1415677 =C2=B1  3%     +20.3%    1702445        sched_debug.cpu.nr_sw=
itches.min
>       30576 =C2=B1 26%    +151.6%      76923 =C2=B1 37%  sched_debug.cpu.=
nr_switches.stddev
>       25.47           -91.3%       2.21 =C2=B1 69%  perf-stat.i.MPKI
>   3.342e+10           +84.7%  6.172e+10 =C2=B1  5%  perf-stat.i.branch-in=
structions
>        0.58            -0.3        0.33 =C2=B1  5%  perf-stat.i.branch-mi=
ss-rate%
>   1.667e+08           -13.2%  1.448e+08 =C2=B1  2%  perf-stat.i.branch-mi=
sses
>        0.63 =C2=B1 17%      +4.8        5.42 =C2=B1 39%  perf-stat.i.cach=
e-miss-rate%
>    18939524 =C2=B1  4%     -46.6%   10109353 =C2=B1 18%  perf-stat.i.cach=
e-misses
>   4.422e+09           -87.1%  5.724e+08 =C2=B1 77%  perf-stat.i.cache-ref=
erences
>     6897069           +30.8%    9023752 =C2=B1  2%  perf-stat.i.context-s=
witches
>        2.04           -43.3%       1.16 =C2=B1  5%  perf-stat.i.cpi
>   3.523e+11            +3.8%  3.656e+11        perf-stat.i.cpu-cycles
>     2322589           -86.6%     310934 =C2=B1 93%  perf-stat.i.cpu-migra=
tions
>       18560 =C2=B1  4%    +113.2%      39578 =C2=B1 15%  perf-stat.i.cycl=
es-between-cache-misses
>        0.20            -0.2        0.02 =C2=B1 70%  perf-stat.i.dTLB-load=
-miss-rate%
>    85472762           -87.2%   10962661 =C2=B1 82%  perf-stat.i.dTLB-load=
-misses
>   4.266e+10           +83.8%  7.841e+10 =C2=B1  5%  perf-stat.i.dTLB-loads
>        0.10 =C2=B1  4%      -0.1        0.01 =C2=B1 72%  perf-stat.i.dTLB=
-store-miss-rate%
>    25396322 =C2=B1  4%     -86.5%    3437369 =C2=B1 90%  perf-stat.i.dTLB=
-store-misses
>   2.483e+10           +85.2%  4.598e+10 =C2=B1  5%  perf-stat.i.dTLB-stor=
es
>   1.699e+11           +85.8%  3.157e+11 =C2=B1  5%  perf-stat.i.instructi=
ons
>        0.50           +73.4%       0.87 =C2=B1  4%  perf-stat.i.ipc
>        2.75            +3.8%       2.86        perf-stat.i.metric.GHz
>      822.90           +77.2%       1458 =C2=B1  5%  perf-stat.i.metric.M/=
sec
>        5691            -3.4%       5500        perf-stat.i.minor-faults
>       91.09            +4.6       95.71        perf-stat.i.node-load-miss=
-rate%
>      334087 =C2=B1 17%     -67.4%     109033 =C2=B1 18%  perf-stat.i.node=
-loads
>       70.09           +17.6       87.68 =C2=B1  6%  perf-stat.i.node-stor=
e-miss-rate%
>     1559730 =C2=B1  5%     -64.9%     548115 =C2=B1 56%  perf-stat.i.node=
-stores
>        5704            -3.3%       5513        perf-stat.i.page-faults
>       26.03           -92.7%       1.89 =C2=B1 83%  perf-stat.overall.MPKI
>        0.50            -0.3        0.24 =C2=B1  8%  perf-stat.overall.bra=
nch-miss-rate%
>        0.43 =C2=B1  3%      +2.5        2.91 =C2=B1 60%  perf-stat.overal=
l.cache-miss-rate%
>        2.08           -44.0%       1.16 =C2=B1  5%  perf-stat.overall.cpi
>       18664 =C2=B1  4%    +100.4%      37402 =C2=B1 16%  perf-stat.overal=
l.cycles-between-cache-misses
>        0.20            -0.2        0.01 =C2=B1 87%  perf-stat.overall.dTL=
B-load-miss-rate%
>        0.10 =C2=B1  4%      -0.1        0.01 =C2=B1 96%  perf-stat.overal=
l.dTLB-store-miss-rate%
>        0.48           +79.1%       0.86 =C2=B1  4%  perf-stat.overall.ipc
>       91.02            +5.1       96.07        perf-stat.overall.node-loa=
d-miss-rate%
>       70.91           +17.6       88.54 =C2=B1  6%  perf-stat.overall.nod=
e-store-miss-rate%
>   3.289e+10           +85.0%  6.085e+10 =C2=B1  5%  perf-stat.ps.branch-i=
nstructions
>   1.641e+08           -13.1%  1.425e+08 =C2=B1  2%  perf-stat.ps.branch-m=
isses
>    18633656 =C2=B1  4%     -46.7%    9931368 =C2=B1 18%  perf-stat.ps.cac=
he-misses
>   4.354e+09           -87.1%  5.613e+08 =C2=B1 77%  perf-stat.ps.cache-re=
ferences
>     6788892           +31.0%    8894592 =C2=B1  2%  perf-stat.ps.context-=
switches
>    3.47e+11            +3.9%  3.604e+11        perf-stat.ps.cpu-cycles
>     2286778           -86.7%     304327 =C2=B1 94%  perf-stat.ps.cpu-migr=
ations
>    84173329           -87.2%   10770448 =C2=B1 82%  perf-stat.ps.dTLB-loa=
d-misses
>   4.198e+10           +84.1%   7.73e+10 =C2=B1  5%  perf-stat.ps.dTLB-loa=
ds
>    25001705 =C2=B1  4%     -86.5%    3364501 =C2=B1 91%  perf-stat.ps.dTL=
B-store-misses
>   2.444e+10           +85.5%  4.533e+10 =C2=B1  5%  perf-stat.ps.dTLB-sto=
res
>   1.673e+11           +86.1%  3.112e+11 =C2=B1  5%  perf-stat.ps.instruct=
ions
>       12.40            -1.5%      12.22        perf-stat.ps.major-faults
>        5543            -3.9%       5329        perf-stat.ps.minor-faults
>      332272 =C2=B1 17%     -66.0%     112911 =C2=B1 16%  perf-stat.ps.nod=
e-loads
>     1533930 =C2=B1  5%     -65.2%     534337 =C2=B1 57%  perf-stat.ps.nod=
e-stores
>        5556            -3.9%       5341        perf-stat.ps.page-faults
>   1.065e+13           +86.7%  1.988e+13 =C2=B1  5%  perf-stat.total.instr=
uctions
>       18.10           -16.2        1.91 =C2=B1142%  perf-profile.calltrac=
e.cycles-pp.secondary_startup_64_no_verify
>       17.94           -16.1        1.88 =C2=B1142%  perf-profile.calltrac=
e.cycles-pp.start_secondary.secondary_startup_64_no_verify
>       17.93           -16.1        1.88 =C2=B1142%  perf-profile.calltrac=
e.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
>       17.90           -16.0        1.88 =C2=B1142%  perf-profile.calltrac=
e.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_=
no_verify
>       15.83            -8.0        7.86 =C2=B1 20%  perf-profile.calltrac=
e.cycles-pp.read
>       13.06            -8.0        5.11 =C2=B1 30%  perf-profile.calltrac=
e.cycles-pp.pipe_read.new_sync_read.vfs_read.ksys_read.do_syscall_64
>       13.21            -7.9        5.30 =C2=B1 29%  perf-profile.calltrac=
e.cycles-pp.new_sync_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64=
_after_hwframe
>       13.58            -7.9        5.68 =C2=B1 27%  perf-profile.calltrac=
e.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe=
.read
>       14.72            -7.9        6.86 =C2=B1 22%  perf-profile.calltrac=
e.cycles-pp.entry_SYSCALL_64_after_hwframe.read
>       14.51            -7.8        6.73 =C2=B1 22%  perf-profile.calltrac=
e.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
>       13.77            -7.5        6.23 =C2=B1 23%  perf-profile.calltrac=
e.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
>        9.90            -7.1        2.83 =C2=B1 47%  perf-profile.calltrac=
e.cycles-pp.__schedule.schedule.pipe_read.new_sync_read.vfs_read
>        9.96            -7.0        2.92 =C2=B1 45%  perf-profile.calltrac=
e.cycles-pp.schedule.pipe_read.new_sync_read.vfs_read.ksys_read
>        7.84            -6.9        0.94 =C2=B1142%  perf-profile.calltrac=
e.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.sec=
ondary_startup_64_no_verify
>        7.44            -6.8        0.63 =C2=B1142%  perf-profile.calltrac=
e.cycles-pp.flush_smp_call_function_queue.do_idle.cpu_startup_entry.start_s=
econdary.secondary_startup_64_no_verify
>        7.07            -6.2        0.85 =C2=B1142%  perf-profile.calltrac=
e.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start=
_secondary
>        7.03            -6.2        0.84 =C2=B1142%  perf-profile.calltrac=
e.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu=
_startup_entry
>        8.60            -5.3        3.30 =C2=B1 44%  perf-profile.calltrac=
e.cycles-pp.__wake_up_common.__wake_up_common_lock.pipe_write.new_sync_writ=
e.vfs_write
>        8.75            -5.3        3.49 =C2=B1 41%  perf-profile.calltrac=
e.cycles-pp.__wake_up_common_lock.pipe_write.new_sync_write.vfs_write.ksys_=
write
>       10.84            -5.3        5.58 =C2=B1 27%  perf-profile.calltrac=
e.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>       10.53            -5.2        5.29 =C2=B1 28%  perf-profile.calltrac=
e.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me.write
>        6.70            -5.2        1.49 =C2=B1 62%  perf-profile.calltrac=
e.cycles-pp.dequeue_task_fair.__schedule.schedule.pipe_read.new_sync_read
>       10.02            -5.2        4.83 =C2=B1 30%  perf-profile.calltrac=
e.cycles-pp.pipe_write.new_sync_write.vfs_write.ksys_write.do_syscall_64
>        5.64            -5.2        0.48 =C2=B1142%  perf-profile.calltrac=
e.cycles-pp.sched_ttwu_pending.flush_smp_call_function_queue.do_idle.cpu_st=
artup_entry.start_secondary
>       10.08            -5.1        4.98 =C2=B1 29%  perf-profile.calltrac=
e.cycles-pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL=
_64_after_hwframe
>        8.21            -5.1        3.14 =C2=B1 44%  perf-profile.calltrac=
e.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake=
_up_common_lock.pipe_write
>        8.25            -5.1        3.20 =C2=B1 44%  perf-profile.calltrac=
e.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_lock=
.pipe_write.new_sync_write
>        5.11            -4.7        0.40 =C2=B1141%  perf-profile.calltrac=
e.cycles-pp.ttwu_do_activate.sched_ttwu_pending.flush_smp_call_function_que=
ue.do_idle.cpu_startup_entry
>        5.07            -4.7        0.40 =C2=B1141%  perf-profile.calltrac=
e.cycles-pp.enqueue_task_fair.ttwu_do_activate.sched_ttwu_pending.flush_smp=
_call_function_queue.do_idle
>        5.19            -4.6        0.55 =C2=B1141%  perf-profile.calltrac=
e.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.pipe_read
>       20.28            -4.6       15.69 =C2=B1  5%  perf-profile.calltrac=
e.cycles-pp.copy_user_enhanced_fast_string.copyout.copy_page_to_iter.proces=
s_vm_rw_single_vec.process_vm_rw_core
>       20.55            -4.3       16.22 =C2=B1  5%  perf-profile.calltrac=
e.cycles-pp.copyout.copy_page_to_iter.process_vm_rw_single_vec.process_vm_r=
w_core.process_vm_rw
>       10.91            -3.7        7.17 =C2=B1 17%  perf-profile.calltrac=
e.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>       24.78            -3.7       21.12 =C2=B1  2%  perf-profile.calltrac=
e.cycles-pp.copy_page_to_iter.process_vm_rw_single_vec.process_vm_rw_core.p=
rocess_vm_rw.__x64_sys_process_vm_readv
>       10.95            -3.6        7.30 =C2=B1 16%  perf-profile.calltrac=
e.cycles-pp.entry_SYSCALL_64_after_hwframe.write
>       11.15            -3.0        8.18 =C2=B1 13%  perf-profile.calltrac=
e.cycles-pp.write
>        1.03 =C2=B1  4%      -0.4        0.62 =C2=B1 14%  perf-profile.cal=
ltrace.cycles-pp.stress_vm_child
>        0.76 =C2=B1  4%      +0.5        1.22 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.stress_vm_rw
>        0.63            +0.5        1.15 =C2=B1 23%  perf-profile.calltrac=
e.cycles-pp.enqueue_task_fair.ttwu_do_activate.try_to_wake_up.autoremove_wa=
ke_function.__wake_up_common
>        0.53 =C2=B1  2%      +0.5        1.06 =C2=B1  9%  perf-profile.cal=
ltrace.cycles-pp.__might_fault.copy_page_to_iter.process_vm_rw_single_vec.p=
rocess_vm_rw_core.process_vm_rw
>        0.64            +0.5        1.18 =C2=B1 22%  perf-profile.calltrac=
e.cycles-pp.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake=
_up_common.__wake_up_common_lock
>        0.00            +0.6        0.60 =C2=B1  7%  perf-profile.calltrac=
e.cycles-pp.__might_resched.copy_page_to_iter.process_vm_rw_single_vec.proc=
ess_vm_rw_core.process_vm_rw
>        0.00            +1.0        0.96 =C2=B1 15%  perf-profile.calltrac=
e.cycles-pp.__schedule.schedule.exit_to_user_mode_loop.exit_to_user_mode_pr=
epare.syscall_exit_to_user_mode
>        0.00            +1.0        1.02 =C2=B1 17%  perf-profile.calltrac=
e.cycles-pp.mod_node_page_state.gup_put_folio.unpin_user_pages.process_vm_r=
w_single_vec.process_vm_rw_core
>        0.00            +1.0        1.02 =C2=B1 10%  perf-profile.calltrac=
e.cycles-pp.__might_fault.copy_page_from_iter.process_vm_rw_single_vec.proc=
ess_vm_rw_core.process_vm_rw
>        0.00            +1.0        1.03 =C2=B1 15%  perf-profile.calltrac=
e.cycles-pp.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.sysca=
ll_exit_to_user_mode.do_syscall_64
>        0.00            +1.0        1.04 =C2=B1 17%  perf-profile.calltrac=
e.cycles-pp.mod_node_page_state.gup_put_folio.unpin_user_pages_dirty_lock.p=
rocess_vm_rw_single_vec.process_vm_rw_core
>        0.00            +1.1        1.10 =C2=B1 16%  perf-profile.calltrac=
e.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_t=
o_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        1.24 =C2=B1  2%      +1.4        2.60 =C2=B1 11%  perf-profile.cal=
ltrace.cycles-pp._raw_spin_lock.follow_page_pte.__get_user_pages.__get_user=
_pages_remote.process_vm_rw_single_vec
>        0.00            +1.4        1.40 =C2=B1 16%  perf-profile.calltrac=
e.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_=
64.entry_SYSCALL_64_after_hwframe.write
>        0.00            +1.5        1.46 =C2=B1 16%  perf-profile.calltrac=
e.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_=
hwframe.write
>        1.04            +1.5        2.54 =C2=B1 14%  perf-profile.calltrac=
e.cycles-pp.gup_put_folio.unpin_user_pages.process_vm_rw_single_vec.process=
_vm_rw_core.process_vm_rw
>        0.99 =C2=B1  2%      +1.6        2.57 =C2=B1 14%  perf-profile.cal=
ltrace.cycles-pp.gup_put_folio.unpin_user_pages_dirty_lock.process_vm_rw_si=
ngle_vec.process_vm_rw_core.process_vm_rw
>        0.00            +1.7        1.69 =C2=B1 11%  perf-profile.calltrac=
e.cycles-pp.follow_pud_mask.__get_user_pages.__get_user_pages_remote.proces=
s_vm_rw_single_vec.process_vm_rw_core
>        1.35            +1.8        3.20 =C2=B1 14%  perf-profile.calltrac=
e.cycles-pp.unpin_user_pages.process_vm_rw_single_vec.process_vm_rw_core.pr=
ocess_vm_rw.__x64_sys_process_vm_readv
>        0.00            +2.0        1.97 =C2=B1 10%  perf-profile.calltrac=
e.cycles-pp.follow_page_mask.__get_user_pages.__get_user_pages_remote.proce=
ss_vm_rw_single_vec.process_vm_rw_core
>        1.27 =C2=B1  2%      +2.0        3.30 =C2=B1 14%  perf-profile.cal=
ltrace.cycles-pp.unpin_user_pages_dirty_lock.process_vm_rw_single_vec.proce=
ss_vm_rw_core.process_vm_rw.__x64_sys_process_vm_writev
>        0.00            +2.1        2.12 =C2=B1 18%  perf-profile.calltrac=
e.cycles-pp.mod_node_page_state.try_grab_page.follow_page_pte.__get_user_pa=
ges.__get_user_pages_remote
>        0.00            +2.3        2.30 =C2=B1 11%  perf-profile.calltrac=
e.cycles-pp.follow_pmd_mask.__get_user_pages.__get_user_pages_remote.proces=
s_vm_rw_single_vec.process_vm_rw_core
>        3.16 =C2=B1  2%      +2.4        5.51 =C2=B1 11%  perf-profile.cal=
ltrace.cycles-pp.try_grab_page.follow_page_pte.__get_user_pages.__get_user_=
pages_remote.process_vm_rw_single_vec
>       32.57            +5.2       37.78 =C2=B1  3%  perf-profile.calltrac=
e.cycles-pp.process_vm_rw_single_vec.process_vm_rw_core.process_vm_rw.__x64=
_sys_process_vm_readv.do_syscall_64
>       33.67            +5.6       39.24 =C2=B1  3%  perf-profile.calltrac=
e.cycles-pp.process_vm_rw_core.process_vm_rw.__x64_sys_process_vm_readv.do_=
syscall_64.entry_SYSCALL_64_after_hwframe
>        6.24            +6.1       12.34 =C2=B1 10%  perf-profile.calltrac=
e.cycles-pp.__get_user_pages_remote.process_vm_rw_single_vec.process_vm_rw_=
core.process_vm_rw.__x64_sys_process_vm_readv
>       34.23            +6.2       40.39 =C2=B1  3%  perf-profile.calltrac=
e.cycles-pp.process_vm_rw.__x64_sys_process_vm_readv.do_syscall_64.entry_SY=
SCALL_64_after_hwframe.process_vm_readv
>       34.22            +6.2       40.42 =C2=B1  3%  perf-profile.calltrac=
e.cycles-pp.__x64_sys_process_vm_readv.do_syscall_64.entry_SYSCALL_64_after=
_hwframe.process_vm_readv
>       34.39            +6.3       40.68 =C2=B1  3%  perf-profile.calltrac=
e.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.process_vm_readv
>       34.49            +6.4       40.88 =C2=B1  3%  perf-profile.calltrac=
e.cycles-pp.entry_SYSCALL_64_after_hwframe.process_vm_readv
>       34.87            +6.6       41.43 =C2=B1  3%  perf-profile.calltrac=
e.cycles-pp.process_vm_readv
>        6.26            +6.6       12.83 =C2=B1 11%  perf-profile.calltrac=
e.cycles-pp.follow_page_pte.__get_user_pages.__get_user_pages_remote.proces=
s_vm_rw_single_vec.process_vm_rw_core
>        7.43            +6.6       14.02 =C2=B1  8%  perf-profile.calltrac=
e.cycles-pp.copy_user_enhanced_fast_string.copyin.copy_page_from_iter.proce=
ss_vm_rw_single_vec.process_vm_rw_core
>        7.70            +6.9       14.64 =C2=B1  8%  perf-profile.calltrac=
e.cycles-pp.copyin.copy_page_from_iter.process_vm_rw_single_vec.process_vm_=
rw_core.process_vm_rw
>        4.80 =C2=B1  2%      +7.2       11.95 =C2=B1 12%  perf-profile.cal=
ltrace.cycles-pp.__get_user_pages_remote.process_vm_rw_single_vec.process_v=
m_rw_core.process_vm_rw.__x64_sys_process_vm_writev
>        9.52            +9.3       18.86 =C2=B1  8%  perf-profile.calltrac=
e.cycles-pp.copy_page_from_iter.process_vm_rw_single_vec.process_vm_rw_core=
.process_vm_rw.__x64_sys_process_vm_writev
>       10.80           +12.9       23.71 =C2=B1 11%  perf-profile.calltrac=
e.cycles-pp.__get_user_pages.__get_user_pages_remote.process_vm_rw_single_v=
ec.process_vm_rw_core.process_vm_rw
>       16.02 =C2=B1  2%     +19.0       35.05 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.process_vm_rw_single_vec.process_vm_rw_core.process_vm_rw.=
__x64_sys_process_vm_writev.do_syscall_64
>       16.70 =C2=B1  2%     +19.7       36.44 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.process_vm_rw_core.process_vm_rw.__x64_sys_process_vm_writ=
ev.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       17.15 =C2=B1  2%     +20.4       37.51 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.process_vm_rw.__x64_sys_process_vm_writev.do_syscall_64.en=
try_SYSCALL_64_after_hwframe.process_vm_writev
>       17.17 =C2=B1  2%     +20.4       37.55 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.__x64_sys_process_vm_writev.do_syscall_64.entry_SYSCALL_64=
_after_hwframe.process_vm_writev
>       17.26 =C2=B1  2%     +20.5       37.72 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.process_vm_wr=
itev
>       17.31 =C2=B1  2%     +20.5       37.83 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.process_vm_writev
>       17.60 =C2=B1  2%     +20.8       38.42 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.process_vm_writev
>       18.10           -16.2        1.92 =C2=B1141%  perf-profile.children=
.cycles-pp.secondary_startup_64_no_verify
>       18.10           -16.2        1.92 =C2=B1141%  perf-profile.children=
.cycles-pp.cpu_startup_entry
>       18.08           -16.2        1.92 =C2=B1141%  perf-profile.children=
.cycles-pp.do_idle
>       17.94           -16.0        1.89 =C2=B1141%  perf-profile.children=
.cycles-pp.start_secondary
>       16.00            -8.0        8.02 =C2=B1 19%  perf-profile.children=
.cycles-pp.read
>       12.02            -7.9        4.10 =C2=B1 37%  perf-profile.children=
.cycles-pp.__schedule
>       13.10            -7.9        5.18 =C2=B1 30%  perf-profile.children=
.cycles-pp.pipe_read
>       13.22            -7.9        5.31 =C2=B1 29%  perf-profile.children=
.cycles-pp.new_sync_read
>       13.60            -7.9        5.70 =C2=B1 27%  perf-profile.children=
.cycles-pp.vfs_read
>       13.78            -7.5        6.25 =C2=B1 23%  perf-profile.children=
.cycles-pp.ksys_read
>        7.62            -7.0        0.65 =C2=B1142%  perf-profile.children=
.cycles-pp.flush_smp_call_function_queue
>        7.92            -7.0        0.96 =C2=B1142%  perf-profile.children=
.cycles-pp.cpuidle_idle_call
>        7.18            -6.6        0.59 =C2=B1142%  perf-profile.children=
.cycles-pp.sched_ttwu_pending
>        7.14            -6.3        0.86 =C2=B1142%  perf-profile.children=
.cycles-pp.cpuidle_enter
>        7.24            -6.3        0.98 =C2=B1124%  perf-profile.children=
.cycles-pp.update_cfs_group
>        7.12            -6.3        0.86 =C2=B1142%  perf-profile.children=
.cycles-pp.cpuidle_enter_state
>        9.97            -6.0        3.96 =C2=B1 29%  perf-profile.children=
.cycles-pp.schedule
>        6.52            -5.7        0.79 =C2=B1142%  perf-profile.children=
.cycles-pp.mwait_idle_with_hints
>        7.11            -5.4        1.69 =C2=B1 57%  perf-profile.children=
.cycles-pp.ttwu_do_activate
>        7.07            -5.4        1.66 =C2=B1 58%  perf-profile.children=
.cycles-pp.enqueue_task_fair
>        8.61            -5.3        3.30 =C2=B1 44%  perf-profile.children=
.cycles-pp.__wake_up_common
>       10.86            -5.2        5.61 =C2=B1 26%  perf-profile.children=
.cycles-pp.ksys_write
>        8.76            -5.2        3.51 =C2=B1 41%  perf-profile.children=
.cycles-pp.__wake_up_common_lock
>       10.55            -5.2        5.32 =C2=B1 28%  perf-profile.children=
.cycles-pp.vfs_write
>        6.72            -5.2        1.50 =C2=B1 61%  perf-profile.children=
.cycles-pp.dequeue_task_fair
>       10.04            -5.2        4.88 =C2=B1 30%  perf-profile.children=
.cycles-pp.pipe_write
>       10.10            -5.1        5.00 =C2=B1 29%  perf-profile.children=
.cycles-pp.new_sync_write
>        8.26            -5.1        3.20 =C2=B1 44%  perf-profile.children=
.cycles-pp.autoremove_wake_function
>        8.22            -5.0        3.17 =C2=B1 44%  perf-profile.children=
.cycles-pp.try_to_wake_up
>        5.62            -4.7        0.94 =C2=B1 62%  perf-profile.children=
.cycles-pp.enqueue_entity
>       21.11            -4.4       16.69 =C2=B1  5%  perf-profile.children=
.cycles-pp.copyout
>        5.21            -4.4        0.84 =C2=B1 70%  perf-profile.children=
.cycles-pp.dequeue_entity
>        5.50            -4.3        1.25 =C2=B1 48%  perf-profile.children=
.cycles-pp.update_load_avg
>       25.20            -3.0       22.21 =C2=B1  2%  perf-profile.children=
.cycles-pp.copy_page_to_iter
>       11.21            -2.9        8.33 =C2=B1 13%  perf-profile.children=
.cycles-pp.write
>        3.29            -2.5        0.83 =C2=B1 78%  perf-profile.children=
.cycles-pp.select_task_rq
>        3.22            -2.4        0.78 =C2=B1 83%  perf-profile.children=
.cycles-pp.select_task_rq_fair
>        2.78            -2.2        0.62 =C2=B1 93%  perf-profile.children=
.cycles-pp.select_idle_sibling
>        1.80 =C2=B1  2%      -1.5        0.29 =C2=B1137%  perf-profile.chi=
ldren.cycles-pp.available_idle_cpu
>        0.87            -0.6        0.22 =C2=B1 57%  perf-profile.children=
.cycles-pp.finish_task_switch
>        0.98            -0.5        0.45 =C2=B1 23%  perf-profile.children=
.cycles-pp._raw_spin_lock_irqsave
>        0.94            -0.5        0.41 =C2=B1 27%  perf-profile.children=
.cycles-pp.prepare_to_wait_event
>        0.60 =C2=B1  2%      -0.5        0.13 =C2=B1 76%  perf-profile.chi=
ldren.cycles-pp.switch_mm_irqs_off
>        1.04 =C2=B1  4%      -0.4        0.63 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.stress_vm_child
>        0.58            -0.3        0.29 =C2=B1 28%  perf-profile.children=
.cycles-pp.update_rq_clock
>        0.69            -0.3        0.40 =C2=B1 19%  perf-profile.children=
.cycles-pp.prepare_task_switch
>        0.89 =C2=B1  3%      -0.3        0.62 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.asm_sysvec_apic_timer_interrupt
>        0.58            -0.3        0.31 =C2=B1 21%  perf-profile.children=
.cycles-pp.__switch_to_asm
>        0.52            -0.2        0.28 =C2=B1 21%  perf-profile.children=
.cycles-pp.___perf_sw_event
>        0.76 =C2=B1  4%      -0.2        0.56 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.sysvec_apic_timer_interrupt
>        0.28 =C2=B1  3%      -0.2        0.09 =C2=B1 52%  perf-profile.chi=
ldren.cycles-pp._find_next_bit
>        0.50            -0.2        0.33 =C2=B1 13%  perf-profile.children=
.cycles-pp.security_file_permission
>        0.26 =C2=B1  2%      -0.2        0.09 =C2=B1 41%  perf-profile.chi=
ldren.cycles-pp.task_tick_fair
>        0.24 =C2=B1  6%      -0.2        0.08 =C2=B1 57%  perf-profile.chi=
ldren.cycles-pp.__irq_exit_rcu
>        0.48            -0.2        0.32 =C2=B1  5%  perf-profile.children=
.cycles-pp.set_next_entity
>        0.42 =C2=B1  4%      -0.1        0.27 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.__hrtimer_run_queues
>        0.30 =C2=B1  3%      -0.1        0.16 =C2=B1 18%  perf-profile.chi=
ldren.cycles-pp.scheduler_tick
>        0.37 =C2=B1  4%      -0.1        0.24 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.tick_sched_timer
>        0.35 =C2=B1  4%      -0.1        0.22 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.tick_sched_handle
>        0.34 =C2=B1  4%      -0.1        0.22 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.update_process_times
>        0.25 =C2=B1  3%      -0.1        0.12 =C2=B1 40%  perf-profile.chi=
ldren.cycles-pp.find_vma
>        0.19 =C2=B1  7%      -0.1        0.07 =C2=B1 56%  perf-profile.chi=
ldren.cycles-pp.__softirqentry_text_start
>        0.68            -0.1        0.56 =C2=B1  5%  perf-profile.children=
.cycles-pp.mutex_lock
>        0.26 =C2=B1  3%      -0.1        0.14 =C2=B1 34%  perf-profile.chi=
ldren.cycles-pp.find_extend_vma
>        0.38 =C2=B1  2%      -0.1        0.26 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.apparmor_file_permission
>        0.37            -0.1        0.27 =C2=B1  9%  perf-profile.children=
.cycles-pp.__update_load_avg_cfs_rq
>        0.34            -0.1        0.25 =C2=B1 10%  perf-profile.children=
.cycles-pp.perf_trace_sched_wakeup_template
>        0.24 =C2=B1  3%      -0.1        0.16 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.sched_clock_cpu
>        0.17 =C2=B1  4%      -0.1        0.09 =C2=B1 33%  perf-profile.chi=
ldren.cycles-pp.vmacache_find
>        0.64            -0.1        0.56 =C2=B1  6%  perf-profile.children=
.cycles-pp.switch_fpu_return
>        0.53 =C2=B1  4%      -0.1        0.46 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.__sysvec_apic_timer_interrupt
>        0.53 =C2=B1  4%      -0.1        0.46 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.hrtimer_interrupt
>        0.19 =C2=B1  2%      -0.1        0.13 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.native_sched_clock
>        0.57            -0.1        0.50 =C2=B1  5%  perf-profile.children=
.cycles-pp.__switch_to
>        0.27            -0.0        0.22 =C2=B1  2%  perf-profile.children=
.cycles-pp.mutex_unlock
>        0.10 =C2=B1  5%      -0.0        0.06 =C2=B1 17%  perf-profile.chi=
ldren.cycles-pp.anon_pipe_buf_release
>        0.13 =C2=B1  2%      -0.0        0.10 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp._raw_spin_unlock_irqrestore
>        0.17 =C2=B1  2%      -0.0        0.14 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.perf_tp_event
>        0.08 =C2=B1  4%      -0.0        0.05 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.__list_add_valid
>        0.10            -0.0        0.09        perf-profile.children.cycl=
es-pp.finish_wait
>        0.14            +0.0        0.16 =C2=B1  3%  perf-profile.children=
.cycles-pp.atime_needs_update
>        0.12 =C2=B1  4%      +0.0        0.15 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.file_update_time
>        0.06 =C2=B1  6%      +0.0        0.09 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.__rdgsbase_inactive
>        0.10 =C2=B1  6%      +0.0        0.13 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.__wrgsbase_inactive
>        0.75            +0.0        0.79        perf-profile.children.cycl=
es-pp.pick_next_task_fair
>        0.05            +0.0        0.09 =C2=B1  5%  perf-profile.children=
.cycles-pp.pick_next_entity
>        0.19 =C2=B1  2%      +0.0        0.23 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.down_read_killable
>        0.02 =C2=B1141%      +0.0        0.06 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.perf_trace_sched_switch
>        0.05            +0.0        0.10 =C2=B1  6%  perf-profile.children=
.cycles-pp.entry_SYSCALL_64_safe_stack
>        0.02 =C2=B1 99%      +0.1        0.08 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.kmalloc_slab
>        0.14 =C2=B1  2%      +0.1        0.20        perf-profile.children=
.cycles-pp.down_read
>        0.00            +0.1        0.06 =C2=B1  8%  perf-profile.children=
.cycles-pp.resched_curr
>        0.02 =C2=B1 99%      +0.1        0.08 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.perf_trace_sched_stat_runtime
>        0.16 =C2=B1  3%      +0.1        0.21 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.mmput
>        0.00            +0.1        0.06 =C2=B1  9%  perf-profile.children=
.cycles-pp.ktime_get_coarse_real_ts64
>        0.13 =C2=B1  2%      +0.1        0.19 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.get_task_mm
>        0.00            +0.1        0.07 =C2=B1  7%  perf-profile.children=
.cycles-pp.idr_find
>        0.24 =C2=B1  2%      +0.1        0.31 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.__update_load_avg_se
>        0.02 =C2=B1141%      +0.1        0.09 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.__calc_delta
>        0.66            +0.1        0.73 =C2=B1  2%  perf-profile.children=
.cycles-pp.update_curr
>        0.04 =C2=B1 44%      +0.1        0.12 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.memcg_slab_free_hook
>        0.00            +0.1        0.07 =C2=B1 18%  perf-profile.children=
.cycles-pp.cpumask_next_and
>        0.00            +0.1        0.08 =C2=B1 10%  perf-profile.children=
.cycles-pp.syscall_exit_to_user_mode_prepare
>        0.08 =C2=B1  4%      +0.1        0.16 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.up_read
>        0.07 =C2=B1 11%      +0.1        0.15 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.clockevents_program_event
>        0.13            +0.1        0.22 =C2=B1  3%  perf-profile.children=
.cycles-pp.ttwu_do_wakeup
>        0.06 =C2=B1  6%      +0.1        0.15 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.current_time
>        0.00            +0.1        0.09 =C2=B1 10%  perf-profile.children=
.cycles-pp.check_stack_object
>        0.11 =C2=B1  4%      +0.1        0.20 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.check_preempt_curr
>        0.15 =C2=B1  4%      +0.1        0.26 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.os_xsave
>        0.12 =C2=B1  4%      +0.1        0.23 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.syscall_enter_from_user_mode
>        0.16 =C2=B1  3%      +0.1        0.27 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.reweight_entity
>        0.61 =C2=B1  2%      +0.1        0.75 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.find_get_task_by_vpid
>        0.19 =C2=B1  5%      +0.1        0.33 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.__radix_tree_lookup
>        0.10 =C2=B1  3%      +0.2        0.25 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.__check_object_size
>        0.13 =C2=B1  3%      +0.2        0.29 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.syscall_return_via_sysret
>        0.11 =C2=B1  6%      +0.2        0.26 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.follow_huge_addr
>        0.37 =C2=B1  2%      +0.2        0.53 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.mm_access
>        0.00            +0.2        0.17 =C2=B1  9%  perf-profile.children=
.cycles-pp.check_preempt_wakeup
>        0.00            +0.2        0.17 =C2=B1 14%  perf-profile.children=
.cycles-pp.put_prev_entity
>        0.15 =C2=B1  3%      +0.2        0.39 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.pud_huge
>        0.14 =C2=B1  3%      +0.2        0.39 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.mark_page_accessed
>        0.19 =C2=B1  3%      +0.3        0.44 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.kfree
>        0.19 =C2=B1  3%      +0.3        0.50 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.pmd_huge
>        0.31 =C2=B1  3%      +0.3        0.65 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.__kmalloc
>        0.28 =C2=B1  3%      +0.4        0.67 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.entry_SYSRETQ_unsafe_stack
>        0.26 =C2=B1  3%      +0.4        0.70 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.vm_normal_page
>        0.28 =C2=B1  2%      +0.5        0.73 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.folio_mark_accessed
>        0.40 =C2=B1  2%      +0.5        0.86 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.__entry_text_start
>        0.77 =C2=B1  4%      +0.5        1.24 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.stress_vm_rw
>        2.54            +0.6        3.10 =C2=B1  4%  perf-profile.children=
.cycles-pp._raw_spin_lock
>        0.44 =C2=B1  3%      +0.6        1.02 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.__import_iovec
>        0.46 =C2=B1  3%      +0.6        1.05 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.import_iovec
>        0.57 =C2=B1  2%      +0.7        1.26 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp._copy_from_user
>        0.47 =C2=B1  3%      +0.7        1.18 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.rcu_all_qs
>        1.72            +0.9        2.58 =C2=B1  6%  perf-profile.children=
.cycles-pp.__cond_resched
>        0.75 =C2=B1  2%      +1.0        1.71 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.iovec_from_user
>        0.00            +1.1        1.11 =C2=B1 16%  perf-profile.children=
.cycles-pp.exit_to_user_mode_loop
>        0.98 =C2=B1  2%      +1.1        2.10 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.__might_sleep
>        0.70            +1.1        1.84 =C2=B1  9%  perf-profile.children=
.cycles-pp.exit_to_user_mode_prepare
>        0.76 =C2=B1  3%      +1.2        1.95 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.follow_pud_mask
>        0.79            +1.3        2.06 =C2=B1  9%  perf-profile.children=
.cycles-pp.syscall_exit_to_user_mode
>        0.93 =C2=B1  2%      +1.3        2.22 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.follow_page_mask
>        1.30 =C2=B1  2%      +1.5        2.80 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.__might_fault
>        1.03 =C2=B1  2%      +1.6        2.67 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.follow_pmd_mask
>        2.83            +1.7        4.55 =C2=B1  7%  perf-profile.children=
.cycles-pp.__might_resched
>        1.37            +1.9        3.26 =C2=B1 14%  perf-profile.children=
.cycles-pp.unpin_user_pages
>        1.30 =C2=B1  2%      +2.1        3.38 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.unpin_user_pages_dirty_lock
>        3.29 =C2=B1  2%      +2.6        5.87 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.try_grab_page
>       29.19            +2.6       31.78        perf-profile.children.cycl=
es-pp.copy_user_enhanced_fast_string
>        1.40            +3.0        4.42 =C2=B1 17%  perf-profile.children=
.cycles-pp.mod_node_page_state
>        2.13 =C2=B1  2%      +3.2        5.35 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.gup_put_folio
>       34.26            +6.2       40.45 =C2=B1  3%  perf-profile.children=
.cycles-pp.__x64_sys_process_vm_readv
>       34.96            +6.7       41.64 =C2=B1  3%  perf-profile.children=
.cycles-pp.process_vm_readv
>        8.05            +7.0       15.10 =C2=B1  8%  perf-profile.children=
.cycles-pp.copyin
>        6.54            +7.1       13.60 =C2=B1 11%  perf-profile.children=
.cycles-pp.follow_page_pte
>       10.06            +9.7       19.72 =C2=B1  8%  perf-profile.children=
.cycles-pp.copy_page_from_iter
>       10.99           +13.2       24.22 =C2=B1 11%  perf-profile.children=
.cycles-pp.__get_user_pages
>       11.04           +13.3       24.31 =C2=B1 11%  perf-profile.children=
.cycles-pp.__get_user_pages_remote
>       77.15           +15.3       92.46 =C2=B1  2%  perf-profile.children=
.cycles-pp.do_syscall_64
>       77.51           +15.4       92.94 =C2=B1  2%  perf-profile.children=
.cycles-pp.entry_SYSCALL_64_after_hwframe
>       17.18 =C2=B1  2%     +20.4       37.56 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.__x64_sys_process_vm_writev
>       17.69 =C2=B1  2%     +20.9       38.64 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.process_vm_writev
>       48.65           +24.3       72.98 =C2=B1  6%  perf-profile.children=
.cycles-pp.process_vm_rw_single_vec
>       50.39           +25.4       75.74 =C2=B1  6%  perf-profile.children=
.cycles-pp.process_vm_rw_core
>       51.40           +26.5       77.94 =C2=B1  6%  perf-profile.children=
.cycles-pp.process_vm_rw
>        7.23            -6.3        0.97 =C2=B1125%  perf-profile.self.cyc=
les-pp.update_cfs_group
>        6.42            -5.6        0.78 =C2=B1142%  perf-profile.self.cyc=
les-pp.mwait_idle_with_hints
>        4.82            -4.2        0.67 =C2=B1 85%  perf-profile.self.cyc=
les-pp.update_load_avg
>        1.78 =C2=B1  2%      -1.5        0.29 =C2=B1137%  perf-profile.sel=
f.cycles-pp.available_idle_cpu
>        0.96            -0.5        0.42 =C2=B1 26%  perf-profile.self.cyc=
les-pp._raw_spin_lock_irqsave
>        0.98 =C2=B1  2%      -0.5        0.45 =C2=B1 28%  perf-profile.sel=
f.cycles-pp.__schedule
>        0.59 =C2=B1  2%      -0.5        0.13 =C2=B1 78%  perf-profile.sel=
f.cycles-pp.switch_mm_irqs_off
>        0.97            -0.4        0.61 =C2=B1 15%  perf-profile.self.cyc=
les-pp.stress_vm_child
>        0.45 =C2=B1  2%      -0.3        0.14 =C2=B1 58%  perf-profile.sel=
f.cycles-pp.update_rq_clock
>        0.58            -0.3        0.30 =C2=B1 22%  perf-profile.self.cyc=
les-pp.__switch_to_asm
>        0.58            -0.3        0.33 =C2=B1 17%  perf-profile.self.cyc=
les-pp.pipe_read
>        0.35 =C2=B1  3%      -0.2        0.10 =C2=B1 59%  perf-profile.sel=
f.cycles-pp.__wake_up_common
>        0.47            -0.2        0.24 =C2=B1 23%  perf-profile.self.cyc=
les-pp.___perf_sw_event
>        0.32 =C2=B1  2%      -0.2        0.13 =C2=B1 39%  perf-profile.sel=
f.cycles-pp.finish_task_switch
>        0.38 =C2=B1  2%      -0.2        0.21 =C2=B1 20%  perf-profile.sel=
f.cycles-pp.prepare_to_wait_event
>        0.25 =C2=B1  2%      -0.2        0.08 =C2=B1 53%  perf-profile.sel=
f.cycles-pp._find_next_bit
>        0.31 =C2=B1  3%      -0.2        0.14 =C2=B1 27%  perf-profile.sel=
f.cycles-pp.enqueue_entity
>        0.34 =C2=B1 15%      -0.2        0.18 =C2=B1 12%  perf-profile.sel=
f.cycles-pp.read
>        0.26 =C2=B1  2%      -0.2        0.11 =C2=B1 20%  perf-profile.sel=
f.cycles-pp.try_to_wake_up
>        0.29 =C2=B1  3%      -0.2        0.13 =C2=B1 30%  perf-profile.sel=
f.cycles-pp.prepare_task_switch
>        0.45 =C2=B1  2%      -0.1        0.31 =C2=B1  9%  perf-profile.sel=
f.cycles-pp.mutex_lock
>        0.26            -0.1        0.16 =C2=B1 14%  perf-profile.self.cyc=
les-pp.apparmor_file_permission
>        0.13 =C2=B1  2%      -0.1        0.03 =C2=B1103%  perf-profile.sel=
f.cycles-pp.perf_trace_sched_wakeup_template
>        0.35            -0.1        0.26 =C2=B1 11%  perf-profile.self.cyc=
les-pp.__update_load_avg_cfs_rq
>        0.16 =C2=B1  3%      -0.1        0.08 =C2=B1 22%  perf-profile.sel=
f.cycles-pp.dequeue_entity
>        0.56            -0.1        0.48 =C2=B1  5%  perf-profile.self.cyc=
les-pp.__switch_to
>        0.15 =C2=B1  2%      -0.1        0.08 =C2=B1 37%  perf-profile.sel=
f.cycles-pp.vmacache_find
>        0.18 =C2=B1  2%      -0.1        0.11 =C2=B1 25%  perf-profile.sel=
f.cycles-pp.select_idle_sibling
>        0.19 =C2=B1  3%      -0.1        0.13 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.native_sched_clock
>        0.13 =C2=B1  3%      -0.1        0.07 =C2=B1 17%  perf-profile.sel=
f.cycles-pp.security_file_permission
>        0.19            -0.1        0.13 =C2=B1 18%  perf-profile.self.cyc=
les-pp.enqueue_task_fair
>        0.35 =C2=B1  2%      -0.1        0.30 =C2=B1  8%  perf-profile.sel=
f.cycles-pp.update_curr
>        0.15 =C2=B1  2%      -0.1        0.10 =C2=B1 12%  perf-profile.sel=
f.cycles-pp.dequeue_task_fair
>        0.26            -0.0        0.21 =C2=B1  2%  perf-profile.self.cyc=
les-pp.mutex_unlock
>        0.38            -0.0        0.34 =C2=B1  3%  perf-profile.self.cyc=
les-pp.find_get_task_by_vpid
>        0.09 =C2=B1  4%      -0.0        0.06 =C2=B1 13%  perf-profile.sel=
f.cycles-pp.anon_pipe_buf_release
>        0.11 =C2=B1  4%      -0.0        0.08 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.atime_needs_update
>        0.21 =C2=B1  2%      -0.0        0.19 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.vfs_read
>        0.17 =C2=B1  2%      -0.0        0.14 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.switch_fpu_return
>        0.11 =C2=B1  4%      -0.0        0.09 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.aa_file_perm
>        0.08 =C2=B1  6%      -0.0        0.06 =C2=B1 13%  perf-profile.sel=
f.cycles-pp.select_task_rq
>        0.05            +0.0        0.06        perf-profile.self.cycles-p=
p._raw_spin_unlock_irqrestore
>        0.06            +0.0        0.07        perf-profile.self.cycles-p=
p.set_next_entity
>        0.07 =C2=B1  5%      +0.0        0.09        perf-profile.self.cyc=
les-pp.get_task_mm
>        0.06 =C2=B1  9%      +0.0        0.08        perf-profile.self.cyc=
les-pp.__get_user_pages_remote
>        0.06 =C2=B1  6%      +0.0        0.09 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.__rdgsbase_inactive
>        0.10 =C2=B1  5%      +0.0        0.13 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.__wrgsbase_inactive
>        0.11            +0.0        0.15 =C2=B1  2%  perf-profile.self.cyc=
les-pp.pick_next_task_fair
>        0.09 =C2=B1  9%      +0.0        0.13 =C2=B1  8%  perf-profile.sel=
f.cycles-pp.ktime_get
>        0.03 =C2=B1 70%      +0.0        0.08 =C2=B1  6%  perf-profile.sel=
f.cycles-pp.pick_next_entity
>        0.08 =C2=B1  6%      +0.1        0.13 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.vfs_write
>        0.00            +0.1        0.06 =C2=B1  9%  perf-profile.self.cyc=
les-pp.resched_curr
>        0.01 =C2=B1223%      +0.1        0.06 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.perf_trace_sched_switch
>        0.00            +0.1        0.06 =C2=B1  8%  perf-profile.self.cyc=
les-pp.put_prev_entity
>        0.00            +0.1        0.06 =C2=B1  8%  perf-profile.self.cyc=
les-pp.syscall_exit_to_user_mode_prepare
>        0.00            +0.1        0.06 =C2=B1  8%  perf-profile.self.cyc=
les-pp.idr_find
>        0.22 =C2=B1  2%      +0.1        0.28 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.__update_load_avg_se
>        0.00            +0.1        0.06 =C2=B1 11%  perf-profile.self.cyc=
les-pp.ksys_write
>        0.00            +0.1        0.06 =C2=B1 14%  perf-profile.self.cyc=
les-pp.__wake_up_common_lock
>        0.00            +0.1        0.06 =C2=B1  7%  perf-profile.self.cyc=
les-pp.kmalloc_slab
>        0.10 =C2=B1  6%      +0.1        0.16 =C2=B1  6%  perf-profile.sel=
f.cycles-pp.write
>        0.00            +0.1        0.07 =C2=B1 15%  perf-profile.self.cyc=
les-pp.check_preempt_wakeup
>        0.08 =C2=B1  6%      +0.1        0.15 =C2=B1  9%  perf-profile.sel=
f.cycles-pp.up_read
>        0.01 =C2=B1223%      +0.1        0.08 =C2=B1 12%  perf-profile.sel=
f.cycles-pp.perf_trace_sched_stat_runtime
>        0.01 =C2=B1223%      +0.1        0.08 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.__calc_delta
>        0.00            +0.1        0.08 =C2=B1 10%  perf-profile.self.cyc=
les-pp.check_stack_object
>        0.00            +0.1        0.08 =C2=B1 20%  perf-profile.self.cyc=
les-pp.exit_to_user_mode_loop
>        0.02 =C2=B1141%      +0.1        0.09 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.new_sync_write
>        0.02 =C2=B1141%      +0.1        0.09 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.entry_SYSCALL_64_safe_stack
>        0.06 =C2=B1  8%      +0.1        0.14 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.follow_huge_addr
>        0.10 =C2=B1  4%      +0.1        0.19 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.syscall_enter_from_user_mode
>        0.00            +0.1        0.09 =C2=B1 12%  perf-profile.self.cyc=
les-pp.current_time
>        0.06            +0.1        0.15 =C2=B1 11%  perf-profile.self.cyc=
les-pp.__import_iovec
>        0.05 =C2=B1  8%      +0.1        0.14 =C2=B1 13%  perf-profile.sel=
f.cycles-pp.__check_object_size
>        0.03 =C2=B1 70%      +0.1        0.14 =C2=B1 15%  perf-profile.sel=
f.cycles-pp.syscall_exit_to_user_mode
>        0.19 =C2=B1  3%      +0.1        0.30 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.process_vm_readv
>        0.15 =C2=B1  3%      +0.1        0.25 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.os_xsave
>        0.00            +0.1        0.11 =C2=B1  9%  perf-profile.self.cyc=
les-pp.memcg_slab_free_hook
>        0.07 =C2=B1  5%      +0.1        0.18 =C2=B1 10%  perf-profile.sel=
f.cycles-pp._copy_from_user
>        0.15 =C2=B1  2%      +0.1        0.26 =C2=B1  6%  perf-profile.sel=
f.cycles-pp.pipe_write
>        0.05            +0.1        0.16 =C2=B1 12%  perf-profile.self.cyc=
les-pp.exit_to_user_mode_prepare
>        0.12 =C2=B1  3%      +0.1        0.24 =C2=B1  8%  perf-profile.sel=
f.cycles-pp.__entry_text_start
>        0.00            +0.1        0.12 =C2=B1 14%  perf-profile.self.cyc=
les-pp.schedule
>        0.14 =C2=B1 12%      +0.1        0.26 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.process_vm_rw
>        0.38            +0.1        0.51 =C2=B1  6%  perf-profile.self.cyc=
les-pp.entry_SYSCALL_64_after_hwframe
>        0.19 =C2=B1  7%      +0.1        0.32 =C2=B1  6%  perf-profile.sel=
f.cycles-pp.__radix_tree_lookup
>        0.09 =C2=B1  4%      +0.1        0.23 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.iovec_from_user
>        0.09            +0.1        0.24 =C2=B1 11%  perf-profile.self.cyc=
les-pp.mark_page_accessed
>        0.14 =C2=B1  3%      +0.2        0.29 =C2=B1  9%  perf-profile.sel=
f.cycles-pp.process_vm_rw_core
>        0.13 =C2=B1  2%      +0.2        0.28 =C2=B1  9%  perf-profile.sel=
f.cycles-pp.syscall_return_via_sysret
>        0.13 =C2=B1  2%      +0.2        0.29 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.process_vm_writev
>        0.10 =C2=B1  3%      +0.2        0.26 =C2=B1 13%  perf-profile.sel=
f.cycles-pp.pud_huge
>        0.09 =C2=B1  5%      +0.2        0.26 =C2=B1 13%  perf-profile.sel=
f.cycles-pp.pmd_huge
>        0.14 =C2=B1  3%      +0.2        0.31 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.copyout
>        0.14 =C2=B1  4%      +0.2        0.31 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.kfree
>        0.17 =C2=B1  3%      +0.2        0.35 =C2=B1  9%  perf-profile.sel=
f.cycles-pp.do_syscall_64
>        0.18 =C2=B1  3%      +0.2        0.36 =C2=B1  9%  perf-profile.sel=
f.cycles-pp.__kmalloc
>        0.18 =C2=B1  2%      +0.3        0.45 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.copyin
>        0.24 =C2=B1  3%      +0.3        0.50 =C2=B1  9%  perf-profile.sel=
f.cycles-pp.__might_fault
>        0.11 =C2=B1  5%      +0.3        0.41 =C2=B1 22%  perf-profile.sel=
f.cycles-pp.ksys_read
>        0.30 =C2=B1  3%      +0.3        0.65 =C2=B1 12%  perf-profile.sel=
f.cycles-pp.unpin_user_pages
>        0.22 =C2=B1  3%      +0.4        0.58 =C2=B1 12%  perf-profile.sel=
f.cycles-pp.vm_normal_page
>        0.26 =C2=B1  4%      +0.4        0.62 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.rcu_all_qs
>        0.28 =C2=B1  2%      +0.4        0.65 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.entry_SYSRETQ_unsafe_stack
>        0.23 =C2=B1  3%      +0.4        0.61 =C2=B1 12%  perf-profile.sel=
f.cycles-pp.folio_mark_accessed
>        0.28 =C2=B1  4%      +0.5        0.73 =C2=B1 13%  perf-profile.sel=
f.cycles-pp.unpin_user_pages_dirty_lock
>        0.67 =C2=B1  4%      +0.5        1.15 =C2=B1 12%  perf-profile.sel=
f.cycles-pp.stress_vm_rw
>        0.56 =C2=B1  2%      +0.5        1.06 =C2=B1  8%  perf-profile.sel=
f.cycles-pp.process_vm_rw_single_vec
>        0.91            +0.6        1.55 =C2=B1  8%  perf-profile.self.cyc=
les-pp.__cond_resched
>        0.81 =C2=B1  2%      +0.9        1.72 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.__might_sleep
>        0.61 =C2=B1  3%      +0.9        1.55 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.follow_pud_mask
>        1.94            +0.9        2.89 =C2=B1  7%  perf-profile.self.cyc=
les-pp._raw_spin_lock
>        1.60            +1.0        2.57 =C2=B1  7%  perf-profile.self.cyc=
les-pp.copy_page_to_iter
>        2.56 =C2=B1  2%      +1.0        3.61 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.try_grab_page
>        0.88 =C2=B1  2%      +1.1        1.98 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.copy_page_from_iter
>        0.82 =C2=B1  3%      +1.1        1.95 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.follow_page_mask
>        2.60            +1.4        3.98 =C2=B1  6%  perf-profile.self.cyc=
les-pp.__might_resched
>        0.88 =C2=B1  2%      +1.4        2.27 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.follow_pmd_mask
>        0.88 =C2=B1  2%      +1.4        2.28 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.__get_user_pages
>        1.43 =C2=B1  2%      +1.7        3.15 =C2=B1 12%  perf-profile.sel=
f.cycles-pp.gup_put_folio
>        1.50 =C2=B1  3%      +2.3        3.79 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.follow_page_pte
>       28.89            +2.5       31.42        perf-profile.self.cycles-p=
p.copy_user_enhanced_fast_string
>        1.26            +2.8        4.04 =C2=B1 18%  perf-profile.self.cyc=
les-pp.mod_node_page_state
> =

> =

> =

> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =

>=20
--===============1169917812061895518==--

