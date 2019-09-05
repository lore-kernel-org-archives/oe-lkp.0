Content-Type: multipart/mixed; boundary="===============4811761945175766285=="
MIME-Version: 1.0
From: kernel test robot <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: [locking/rwsem] 00f3c5a3df: will-it-scale.per_thread_ops -5.1% regression
Date: Thu, 05 Sep 2019 15:52:54 +0800
Message-ID: <20190905075254.GY22468@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4811761945175766285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Greeting,

FYI, we noticed a -5.1% regression of will-it-scale.per_thread_ops due to c=
ommit:


commit: 00f3c5a3df2c1e3dab14d0dd2b71f852d46be97f ("locking/rwsem: Always re=
lease wait_lock before waking up tasks")
https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux.git=
 master

in testcase: will-it-scale
on test machine: 96 threads Intel(R) Xeon(R) CPU @ 2.30GHz with 128G memory
with following parameters:

	nr_task: 50%
	mode: thread
	test: mmap2
	ucode: 0x400001c
	cpufreq_governor: performance

test-description: Will It Scale takes a testcase and runs it from 1 through=
 to n parallel copies to see if the testcase will scale. It builds both a p=
rocess and threads based test in order to see any differences between the t=
wo.
test-url: https://github.com/antonblanchard/will-it-scale

In addition to that, the commit also has significant impact on the followin=
g tests:

+------------------+-------------------------------------------------------=
-----------------+
| testcase: change | reaim: boot-time.boot 2.6% regression                 =
                 |
| test machine     | 144 threads Intel(R) Xeon(R) CPU E7-8890 v3 @ 2.50GHz =
with 512G memory |
| test parameters  | cpufreq_governor=3Dperformance                        =
                   |
|                  | iterations=3D30                                       =
                   |
|                  | nr_task=3D1600%                                       =
                   |
|                  | test=3Dnew_dbase                                      =
                   |
|                  | ucode=3D0x14                                          =
                   |
+------------------+-------------------------------------------------------=
-----------------+
| testcase: change | aim7:                                                 =
                 |
| test machine     | 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00GHz w=
ith 384G memory  |
| test parameters  | cpufreq_governor=3Dperformance                        =
                   |
|                  | disk=3D4BRD_12G                                       =
                   |
|                  | fs=3Dext4                                             =
                   |
|                  | load=3D3000                                           =
                   |
|                  | md=3DRAID1                                            =
                   |
|                  | test=3Ddisk_src                                       =
                   |
+------------------+-------------------------------------------------------=
-----------------+
| testcase: change | aim7:                                                 =
                 |
| test machine     | 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00GHz w=
ith 384G memory  |
| test parameters  | cpufreq_governor=3Dperformance                        =
                   |
|                  | disk=3D4BRD_12G                                       =
                   |
|                  | fs=3Dxfs                                              =
                   |
|                  | load=3D3000                                           =
                   |
|                  | md=3DRAID1                                            =
                   |
|                  | test=3Ddisk_wrt                                       =
                   |
+------------------+-------------------------------------------------------=
-----------------+
| testcase: change | aim7: iostat.md0.wkB/s 56.8% improvement              =
                 |
| test machine     | 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00GHz w=
ith 384G memory  |
| test parameters  | cpufreq_governor=3Dperformance                        =
                   |
|                  | disk=3D4BRD_12G                                       =
                   |
|                  | fs=3Dxfs                                              =
                   |
|                  | load=3D3000                                           =
                   |
|                  | md=3DRAID1                                            =
                   |
|                  | test=3Ddisk_wrt                                       =
                   |
+------------------+-------------------------------------------------------=
-----------------+
| testcase: change | reaim: reaim.child_utime -1.6% undefined              =
                 |
| test machine     | 144 threads Intel(R) Xeon(R) CPU E7-8890 v3 @ 2.50GHz =
with 512G memory |
| test parameters  | cpufreq_governor=3Dperformance                        =
                   |
|                  | iterations=3D20                                       =
                   |
|                  | nr_task=3D1600%                                       =
                   |
|                  | test=3Daim9                                           =
                   |
|                  | ucode=3D0x14                                          =
                   |
+------------------+-------------------------------------------------------=
-----------------+
| testcase: change | unixbench:                                            =
                 |
| test machine     | 192 threads Skylake-SP with 256G memory               =
                 |
| test parameters  | cpufreq_governor=3Dperformance                        =
                   |
|                  | nr_task=3D30%                                         =
                   |
|                  | runtime=3D300s                                        =
                   |
|                  | test=3Dshell8                                         =
                   |
+------------------+-------------------------------------------------------=
-----------------+
| testcase: change | will-it-scale:                                        =
                 |
| test machine     | 192 threads Skylake-SP with 256G memory               =
                 |
| test parameters  | cpufreq_governor=3Dperformance                        =
                   |
|                  | mode=3Dprocess                                        =
                   |
|                  | nr_task=3D100%                                        =
                   |
|                  | test=3Dpwrite2                                        =
                   |
+------------------+-------------------------------------------------------=
-----------------+
| testcase: change | reaim: boot-time.boot -4.1% improvement               =
                 |
| test machine     | 144 threads Intel(R) Xeon(R) CPU E7-8890 v3 @ 2.50GHz =
with 512G memory |
| test parameters  | cpufreq_governor=3Dperformance                        =
                   |
|                  | iterations=3D10                                       =
                   |
|                  | nr_task=3D1600%                                       =
                   |
|                  | test=3Dcustom                                         =
                   |
|                  | ucode=3D0x14                                          =
                   |
+------------------+-------------------------------------------------------=
-----------------+
| testcase: change | aim7:                                                 =
                 |
| test machine     | 192 threads Intel(R) Xeon(R) CPU E7-8890 v4 @ 2.20GHz =
with 496G memory |
| test parameters  | cpufreq_governor=3Dperformance                        =
                   |
|                  | load=3D2000                                           =
                   |
|                  | test=3Dfork_test                                      =
                   |
|                  | ucode=3D0xb000036                                     =
                   |
+------------------+-------------------------------------------------------=
-----------------+
| testcase: change | aim7:                                                 =
                 |
| test machine     | 192 threads Intel(R) Xeon(R) CPU E7-8890 v4 @ 2.20GHz =
with 496G memory |
| test parameters  | cpufreq_governor=3Dperformance                        =
                   |
|                  | load=3D8000                                           =
                   |
|                  | test=3Dmisc_rtns_1                                    =
                   |
|                  | ucode=3D0xb000036                                     =
                   |
+------------------+-------------------------------------------------------=
-----------------+
| testcase: change | will-it-scale:                                        =
                 |
| test machine     | 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz w=
ith 80G memory   |
| test parameters  | cpufreq_governor=3Dperformance                        =
                   |
|                  | mode=3Dthread                                         =
                   |
|                  | nr_task=3D100%                                        =
                   |
|                  | test=3Dunlink1                                        =
                   |
+------------------+-------------------------------------------------------=
-----------------+
| testcase: change | reaim: reaim.child_systime 23.3% undefined            =
                 |
| test machine     | 72 threads Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GHz w=
ith 256G memory  |
| test parameters  | cpufreq_governor=3Dperformance                        =
                   |
|                  | nr_task=3D1600%                                       =
                   |
|                  | runtime=3D300s                                        =
                   |
|                  | test=3Dalltests                                       =
                   |
|                  | ucode=3D0x43                                          =
                   |
+------------------+-------------------------------------------------------=
-----------------+
| testcase: change | reaim: reaim.child_systime -2.7% undefined            =
                 |
| test machine     | 48 threads Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz w=
ith 64G memory   |
| test parameters  | cpufreq_governor=3Dperformance                        =
                   |
|                  | nr_task=3D900t                                        =
                   |
|                  | runtime=3D300s                                        =
                   |
|                  | test=3Ddisk_cp                                        =
                   |
|                  | ucode=3D0x42e                                         =
                   |
+------------------+-------------------------------------------------------=
-----------------+
| testcase: change | reaim:                                                =
                 |
| test machine     | 72 threads Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GHz w=
ith 256G memory  |
| test parameters  | cpufreq_governor=3Dperformance                        =
                   |
|                  | nr_task=3D1600%                                       =
                   |
|                  | runtime=3D300s                                        =
                   |
|                  | test=3Dnew_dbase                                      =
                   |
|                  | ucode=3D0x43                                          =
                   |
+------------------+-------------------------------------------------------=
-----------------+
| testcase: change | reaim:                                                =
                 |
| test machine     | 48 threads Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz w=
ith 64G memory   |
| test parameters  | cpufreq_governor=3Dperformance                        =
                   |
|                  | nr_task=3D300t                                        =
                   |
|                  | runtime=3D300s                                        =
                   |
|                  | test=3Ddisk_wrt                                       =
                   |
|                  | ucode=3D0x42e                                         =
                   |
+------------------+-------------------------------------------------------=
-----------------+
| testcase: change | vm-scalability: boot-time.boot 2.0% regression        =
                 |
| test machine     | 160 threads Intel(R) Xeon(R) CPU E7-8890 v4 @ 2.20GHz =
with 256G memory |
| test parameters  | cpufreq_governor=3Dperformance                        =
                   |
|                  | runtime=3D300s                                        =
                   |
|                  | test=3Dsmall-allocs                                   =
                   |
|                  | ucode=3D0xb000036                                     =
                   |
+------------------+-------------------------------------------------------=
-----------------+
| testcase: change | reaim: boot-time.boot 3.3% regression                 =
                 |
| test machine     | 144 threads Intel(R) Xeon(R) CPU E7-8890 v3 @ 2.50GHz =
with 512G memory |
| test parameters  | cpufreq_governor=3Dperformance                        =
                   |
|                  | iterations=3D30                                       =
                   |
|                  | nr_task=3D1600%                                       =
                   |
|                  | test=3Ddbase                                          =
                   |
|                  | ucode=3D0x14                                          =
                   |
+------------------+-------------------------------------------------------=
-----------------+
| testcase: change | aim7:                                                 =
                 |
| test machine     | 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz w=
ith 128G memory  |
| test parameters  | cpufreq_governor=3Dperformance                        =
                   |
|                  | load=3D2000                                           =
                   |
|                  | test=3Dfork_test                                      =
                   |
|                  | ucode=3D0xb000036                                     =
                   |
+------------------+-------------------------------------------------------=
-----------------+
| testcase: change | aim7:                                                 =
                 |
| test machine     | 192 threads Intel(R) Xeon(R) CPU E7-8890 v4 @ 2.20GHz =
with 496G memory |
| test parameters  | cpufreq_governor=3Dperformance                        =
                   |
|                  | load=3D8000                                           =
                   |
|                  | test=3Ddisk_src                                       =
                   |
|                  | ucode=3D0xb000036                                     =
                   |
+------------------+-------------------------------------------------------=
-----------------+
| testcase: change | reaim:                                                =
                 |
| test machine     | 48 threads Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz w=
ith 64G memory   |
| test parameters  | cpufreq_governor=3Dperformance                        =
                   |
|                  | nr_task=3D7000t                                       =
                   |
|                  | runtime=3D300s                                        =
                   |
|                  | test=3Dshared_memory                                  =
                   |
|                  | ucode=3D0x42e                                         =
                   |
+------------------+-------------------------------------------------------=
-----------------+
| testcase: change | reaim:                                                =
                 |
| test machine     | 48 threads Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz w=
ith 64G memory   |
| test parameters  | cpufreq_governor=3Dperformance                        =
                   |
|                  | nr_task=3D400t                                        =
                   |
|                  | runtime=3D300s                                        =
                   |
|                  | test=3Ddisk_src                                       =
                   |
|                  | ucode=3D0x42e                                         =
                   |
+------------------+-------------------------------------------------------=
-----------------+
| testcase: change | fxmark: iostat.sda.wkB/s 1.8% improvement             =
                 |
| test machine     | 48 threads Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz w=
ith 64G memory   |
| test parameters  | cpufreq_governor=3Dperformance                        =
                   |
|                  | directio=3Ddirectio                                   =
                   |
|                  | disk=3D1HDD                                           =
                   |
|                  | fstype=3Dxfs                                          =
                   |
|                  | media=3Dhdd                                           =
                   |
|                  | test=3DMWUL                                           =
                   |
|                  | ucode=3D0x42e                                         =
                   |
+------------------+-------------------------------------------------------=
-----------------+


If you fix the issue, kindly add following tag
Reported-by: kernel test robot <oliver.sang@intel.com>


Details are as below:
---------------------------------------------------------------------------=
----------------------->


To reproduce:

        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp install job.yaml  # job file is attached in this email
        bin/lkp run     job.yaml

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testc=
ase/ucode:
  gcc-7/performance/x86_64-rhel-7.2-clear/thread/50%/clear-ota-25590-x86_64=
-2018-10-18.cgz/lkp-csl-2sp4/mmap2/will-it-scale/0x400001c

commit: =

  4f23dbc1e6 ("locking/rwsem: Implement lock handoff to prevent lock starva=
tion")
  00f3c5a3df ("locking/rwsem: Always release wait_lock before waking up tas=
ks")

4f23dbc1e657951e 00f3c5a3df2c1e3dab14d0dd2b7 =

---------------- --------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :4           25%           1:4     dmesg.WARNING:at#for_ip_inter=
rupt_entry/0x
         %stddev     %change         %stddev
             \          |                \  =

      5762            -5.1%       5467        will-it-scale.per_thread_ops
    176.00            +1.3%     178.25        will-it-scale.time.percent_of=
_cpu_this_job_got
    521.49            +1.2%     527.84        will-it-scale.time.system_time
  56180812            -2.1%   55004407        will-it-scale.time.voluntary_=
context_switches
    276626            -5.1%     262480        will-it-scale.workload
      6836            -1.8%       6710        boot-time.idle
   4584795           -12.7%    4004010        meminfo.Committed_AS
      1501 =C2=B1  5%     -15.4%       1270 =C2=B1  5%  slabinfo.task_group=
.active_objs
      1501 =C2=B1  5%     -15.4%       1270 =C2=B1  5%  slabinfo.task_group=
.num_objs
    371197            -4.5%     354429 =C2=B1  2%  vmstat.system.cs
    206566            -1.9%     202660        vmstat.system.in
  4.91e+08 =C2=B1 11%     -23.4%  3.762e+08 =C2=B1  4%  cpuidle.C1.time
   5335198 =C2=B1  3%      -9.2%    4845346 =C2=B1  4%  cpuidle.C1.usage
   9660501 =C2=B1  2%     -12.4%    8459367 =C2=B1  6%  cpuidle.POLL.usage
   5332157 =C2=B1  3%      -9.2%    4843565 =C2=B1  4%  turbostat.C1
      1.69 =C2=B1 11%      -0.4        1.26 =C2=B1  3%  turbostat.C1%
      0.39 =C2=B1  5%    +184.1%       1.12 =C2=B1 59%  turbostat.CPU%c6
   2637533 =C2=B1  8%     +18.5%    3124786 =C2=B1  5%  numa-vmstat.node0.n=
uma_hit
   2621013 =C2=B1  8%     +18.8%    3114498 =C2=B1  5%  numa-vmstat.node0.n=
uma_local
   2195535 =C2=B1 12%     -19.2%    1773999 =C2=B1 10%  numa-vmstat.node1.n=
uma_hit
    986533 =C2=B1 27%     -43.4%     558697 =C2=B1 33%  numa-vmstat.node1.n=
uma_local
    258.33 =C2=B1 16%     +27.8%     330.25 =C2=B1  8%  sched_debug.cfs_rq:=
/.runnable_load_avg.max
    256.92 =C2=B1 17%     +28.5%     330.25 =C2=B1  8%  sched_debug.cpu.cpu=
_load[0].max
    276147 =C2=B1 30%     +41.1%     389714 =C2=B1  7%  sched_debug.cpu.loa=
d.max
     59345 =C2=B1  3%      +9.7%      65073 =C2=B1  9%  sched_debug.cpu.max=
_idle_balance_cost.avg
      2.60 =C2=B1 16%     -17.3%       2.15 =C2=B1 13%  sched_debug.cpu.nr_=
uninterruptible.stddev
      8182 =C2=B1133%    +541.6%      52501 =C2=B1 50%  interrupts.CPU10.RE=
S:Rescheduling_interrupts
     72730 =C2=B1 18%     -79.8%      14676 =C2=B1 60%  interrupts.CPU30.RE=
S:Rescheduling_interrupts
     68164 =C2=B1 32%     -56.6%      29579 =C2=B1 55%  interrupts.CPU49.RE=
S:Rescheduling_interrupts
    115055 =C2=B1 36%     -71.6%      32664 =C2=B1 49%  interrupts.CPU52.RE=
S:Rescheduling_interrupts
     29073 =C2=B1 71%    +150.2%      72747 =C2=B1 43%  interrupts.CPU54.RE=
S:Rescheduling_interrupts
     54063 =C2=B1 38%     -61.0%      21064 =C2=B1 54%  interrupts.CPU67.RE=
S:Rescheduling_interrupts
     82518 =C2=B1 29%     -69.0%      25542 =C2=B1 76%  interrupts.CPU73.RE=
S:Rescheduling_interrupts
      2782 =C2=B1 31%     +39.5%       3880 =C2=B1  8%  interrupts.CPU77.CA=
L:Function_call_interrupts
     24230 =C2=B1 22%     +71.2%      41476 =C2=B1 33%  interrupts.CPU79.RE=
S:Rescheduling_interrupts
      3298 =C2=B1 11%     +18.4%       3906 =C2=B1  8%  interrupts.CPU85.CA=
L:Function_call_interrupts
      3200 =C2=B1  6%     +22.0%       3903 =C2=B1  8%  interrupts.CPU86.CA=
L:Function_call_interrupts
    641.50 =C2=B1 27%     +37.2%     880.00 =C2=B1 11%  interrupts.CPU89.NM=
I:Non-maskable_interrupts
    641.50 =C2=B1 27%     +37.2%     880.00 =C2=B1 11%  interrupts.CPU89.PM=
I:Performance_monitoring_interrupts
      3241 =C2=B1 13%     +20.3%       3900 =C2=B1  8%  interrupts.CPU92.CA=
L:Function_call_interrupts
    674.00 =C2=B1 20%     +25.2%     844.00 =C2=B1  7%  interrupts.CPU95.NM=
I:Non-maskable_interrupts
    674.00 =C2=B1 20%     +25.2%     844.00 =C2=B1  7%  interrupts.CPU95.PM=
I:Performance_monitoring_interrupts
   4571304 =C2=B1  9%     -23.3%    3507482 =C2=B1  5%  interrupts.RES:Resc=
heduling_interrupts
    306.75 =C2=B1  8%     +16.7%     358.00 =C2=B1  5%  interrupts.TLB:TLB_=
shootdowns
     10.88           +13.6%      12.36 =C2=B1  9%  perf-stat.i.MPKI
 1.174e+09            -3.6%  1.131e+09 =C2=B1  2%  perf-stat.i.branch-instr=
uctions
    375713            -4.2%     359844 =C2=B1  2%  perf-stat.i.context-swit=
ches
      1.88            +9.1%       2.05 =C2=B1  7%  perf-stat.i.cpi
 1.466e+09            -3.6%  1.413e+09 =C2=B1  2%  perf-stat.i.dTLB-loads
 8.112e+08            -4.2%  7.773e+08 =C2=B1  2%  perf-stat.i.dTLB-stores
     71.13            -1.2       69.98        perf-stat.i.iTLB-load-miss-ra=
te%
 5.361e+09            -3.8%  5.159e+09 =C2=B1  2%  perf-stat.i.instructions
      0.53            -3.9%       0.51 =C2=B1  2%  perf-stat.i.ipc
      1.86            +3.7%       1.93 =C2=B1  2%  perf-stat.overall.cpi
     71.15            -0.8       70.34        perf-stat.overall.iTLB-load-m=
iss-rate%
      0.54            -3.5%       0.52 =C2=B1  2%  perf-stat.overall.ipc
   5789520            +3.8%    6012086        perf-stat.overall.path-length
  1.17e+09            -3.6%  1.128e+09 =C2=B1  2%  perf-stat.ps.branch-inst=
ructions
    374455            -4.2%     358648 =C2=B1  2%  perf-stat.ps.context-swi=
tches
 1.461e+09            -3.6%  1.408e+09 =C2=B1  2%  perf-stat.ps.dTLB-loads
 8.085e+08            -4.2%  7.747e+08 =C2=B1  2%  perf-stat.ps.dTLB-stores
 5.343e+09            -3.8%  5.142e+09 =C2=B1  2%  perf-stat.ps.instructions
    100352 =C2=B1  2%     +13.0%     113434 =C2=B1  6%  softirqs.CPU10.TIMER
    101777 =C2=B1  3%     +11.5%     113486 =C2=B1  5%  softirqs.CPU11.TIMER
    100055 =C2=B1  3%     +10.0%     110075 =C2=B1  5%  softirqs.CPU13.TIMER
    101021 =C2=B1  3%     +32.8%     134115 =C2=B1 16%  softirqs.CPU15.TIMER
     99491 =C2=B1  2%     +13.5%     112882 =C2=B1  9%  softirqs.CPU16.TIMER
    100003 =C2=B1  2%      +9.9%     109934 =C2=B1  5%  softirqs.CPU17.TIMER
     37527 =C2=B1  2%     +15.4%      43321 =C2=B1 12%  softirqs.CPU19.SCHED
    103667 =C2=B1  4%     +11.6%     115707 =C2=B1  4%  softirqs.CPU2.TIMER
    101609 =C2=B1  4%      +9.0%     110781 =C2=B1  7%  softirqs.CPU23.TIMER
     97414 =C2=B1  2%     +12.8%     109926 =C2=B1  7%  softirqs.CPU25.TIMER
     99800 =C2=B1  5%     +10.8%     110574 =C2=B1  8%  softirqs.CPU26.TIMER
     99683 =C2=B1  5%     +13.5%     113100 =C2=B1  6%  softirqs.CPU27.TIMER
     97869 =C2=B1  2%     +10.8%     108412 =C2=B1  5%  softirqs.CPU30.TIMER
     98332 =C2=B1  3%     +14.8%     112847 =C2=B1  7%  softirqs.CPU33.TIMER
     37531 =C2=B1  2%     +12.7%      42283 =C2=B1 10%  softirqs.CPU34.SCHED
     99845 =C2=B1  6%     +11.6%     111447 =C2=B1  6%  softirqs.CPU34.TIMER
    100067 =C2=B1  6%     +12.8%     112851 =C2=B1  6%  softirqs.CPU35.TIMER
     98909 =C2=B1  4%     +11.5%     110324 =C2=B1  6%  softirqs.CPU36.TIMER
     99760 =C2=B1  4%     +11.1%     110797 =C2=B1  6%  softirqs.CPU37.TIMER
     99036 =C2=B1  2%     +12.8%     111684 =C2=B1  6%  softirqs.CPU38.TIMER
    100075 =C2=B1  2%     +11.4%     111475 =C2=B1  4%  softirqs.CPU4.TIMER
    100876 =C2=B1  6%     +12.9%     113938 =C2=B1  7%  softirqs.CPU41.TIMER
     98943 =C2=B1  5%     +12.1%     110934 =C2=B1  6%  softirqs.CPU42.TIMER
     37554 =C2=B1  2%      +9.8%      41249 =C2=B1  4%  softirqs.CPU43.SCHED
    100322 =C2=B1  5%     +13.3%     113660 =C2=B1  8%  softirqs.CPU43.TIMER
     39193 =C2=B1  6%     +11.8%      43810 =C2=B1 11%  softirqs.CPU44.SCHED
     37486 =C2=B1  2%     +12.0%      41992 =C2=B1  7%  softirqs.CPU45.SCHED
     99330 =C2=B1  5%     +14.4%     113605 =C2=B1  5%  softirqs.CPU45.TIMER
    100692 =C2=B1  5%     +12.0%     112743 =C2=B1  5%  softirqs.CPU46.TIMER
     37703 =C2=B1  3%      +6.7%      40218 =C2=B1  3%  softirqs.CPU68.SCHED
     98362 =C2=B1  2%     +10.5%     108699 =C2=B1  6%  softirqs.CPU68.TIMER
     36569 =C2=B1  4%     +10.3%      40344 =C2=B1  6%  softirqs.CPU74.SCHED
     94622 =C2=B1  2%     +11.3%     105361 =C2=B1  5%  softirqs.CPU76.TIMER
     35949 =C2=B1  3%      +9.7%      39444 =C2=B1  3%  softirqs.CPU78.SCHED
     96464           +10.2%     106340 =C2=B1  4%  softirqs.CPU80.TIMER
     95793 =C2=B1  4%      +9.2%     104568 =C2=B1  3%  softirqs.CPU88.TIMER
     96624 =C2=B1  2%      +7.8%     104154 =C2=B1  5%  softirqs.CPU89.TIMER
    101648 =C2=B1  3%     +10.5%     112304 =C2=B1  6%  softirqs.CPU9.TIMER
     36172 =C2=B1  3%      +8.0%      39083 =C2=B1  6%  softirqs.CPU91.SCHED
     97133 =C2=B1  4%     +11.4%     108210 =C2=B1  7%  softirqs.CPU92.TIMER
     35978 =C2=B1  3%     +11.3%      40060 =C2=B1  4%  softirqs.CPU93.SCHED
     97301 =C2=B1  3%     +20.1%     116847 =C2=B1 19%  softirqs.CPU93.TIMER
     95831 =C2=B1  2%      +9.4%     104867 =C2=B1  4%  softirqs.CPU95.TIMER
     66.97 =C2=B1  2%      -2.0       65.01        perf-profile.calltrace.c=
ycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.start_=
secondary
     67.56 =C2=B1  2%      -1.9       65.61        perf-profile.calltrace.c=
ycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.secondary_=
startup_64
     77.08            -1.9       75.15        perf-profile.calltrace.cycles=
-pp.start_secondary.secondary_startup_64
     77.07            -1.9       75.15        perf-profile.calltrace.cycles=
-pp.cpu_startup_entry.start_secondary.secondary_startup_64
     77.02            -1.9       75.10        perf-profile.calltrace.cycles=
-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
     78.27            -1.8       76.45        perf-profile.calltrace.cycles=
-pp.secondary_startup_64
     59.20            -1.7       57.45        perf-profile.calltrace.cycles=
-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry
      1.64            -0.2        1.40 =C2=B1  4%  perf-profile.calltrace.c=
ycles-pp.schedule.rwsem_down_write_slowpath.down_write_killable.__vm_munmap=
.__x64_sys_munmap
      1.57 =C2=B1  2%      -0.2        1.34 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.__sched_text_start.schedule.rwsem_down_write_slowpath.down_wr=
ite_killable.__vm_munmap
      1.18 =C2=B1  4%      -0.1        1.06 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_start=
up_entry
      0.56 =C2=B1  4%      +0.0        0.60 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.arch_stack_walk.stack_trace_save_tsk.__account_scheduler_late=
ncy.enqueue_entity.enqueue_task_fair
      0.82 =C2=B1  2%      +0.1        0.91 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.__account_scheduler_latency.enqueue_entity.enqueue_task_fair.=
activate_task.ttwu_do_activate
      0.80 =C2=B1  6%      +0.1        0.90 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.find_vma.__do_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_=
64
      1.12 =C2=B1  3%      +0.1        1.24 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.unmap_region.__do_munmap.__vm_munmap.__x64_sys_munmap.do_sysc=
all_64
      1.39            +0.1        1.53 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.sc=
hed_ttwu_pending
      0.86 =C2=B1  9%      +0.2        1.01 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.rwsem_spin_on_owner.rwsem_down_write_slowpath.down_write_kill=
able.__vm_munmap.__x64_sys_munmap
      1.52            +0.2        1.68 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.enqueue_task_fair.activate_task.ttwu_do_activate.sched_ttwu_pendin=
g.do_idle
      1.54            +0.2        1.70 =C2=B1  3%  perf-profile.calltrace.c=
ycles-pp.activate_task.ttwu_do_activate.sched_ttwu_pending.do_idle.cpu_star=
tup_entry
      1.54            +0.2        1.71 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.ttwu_do_activate.sched_ttwu_pending.do_idle.cpu_startup_entry.star=
t_secondary
      0.41 =C2=B1 58%      +0.2        0.62        perf-profile.calltrace.c=
ycles-pp.rwsem_spin_on_owner.rwsem_down_write_slowpath.down_write_killable.=
vm_mmap_pgoff.ksys_mmap_pgoff
      0.66 =C2=B1  8%      +0.2        0.89 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.unmapped_area_topdown.arch_get_unmapped_area_topdown.shmem_ge=
t_unmapped_area.get_unmapped_area.do_mmap
      2.28 =C2=B1  3%      +0.2        2.51 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.sched_ttwu_pending.do_idle.cpu_startup_entry.start_secondary.=
secondary_startup_64
      0.77 =C2=B1  9%      +0.3        1.03 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.arch_get_unmapped_area_topdown.shmem_get_unmapped_area.get_un=
mapped_area.do_mmap.vm_mmap_pgoff
      0.88 =C2=B1  9%      +0.3        1.13 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.shmem_get_unmapped_area.get_unmapped_area.do_mmap.vm_mmap_pgo=
ff.ksys_mmap_pgoff
      1.13 =C2=B1  4%      +0.3        1.39 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.__sched_text_start.schedule.rwsem_down_write_slowpath.down_wr=
ite_killable.vm_mmap_pgoff
      1.17 =C2=B1  5%      +0.3        1.44 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.schedule.rwsem_down_write_slowpath.down_write_killable.vm_mma=
p_pgoff.ksys_mmap_pgoff
      0.98 =C2=B1  7%      +0.3        1.27 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.get_unmapped_area.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_sy=
scall_64
      3.32 =C2=B1  4%      +0.3        3.65 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.__do_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_=
SYSCALL_64_after_hwframe
      0.13 =C2=B1173%      +0.4        0.52 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.vma_link.mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff
      3.63 =C2=B1  4%      +0.4        4.08        perf-profile.calltrace.c=
ycles-pp.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_=
64_after_hwframe
      0.00            +0.6        0.55 =C2=B1  3%  perf-profile.calltrace.c=
ycles-pp.unmap_vmas.unmap_region.__do_munmap.__vm_munmap.__x64_sys_munmap
      2.87 =C2=B1  4%      +0.7        3.58 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff.k=
sys_mmap_pgoff.do_syscall_64
      3.10 =C2=B1  4%      +0.7        3.83 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_=
64.entry_SYSCALL_64_after_hwframe
     10.07 =C2=B1  4%      +1.3       11.35 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_=
after_hwframe
     10.22 =C2=B1  4%      +1.3       11.51 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
     20.46 =C2=B1  4%      +1.8       22.31 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.entry_SYSCALL_64_after_hwframe
     20.40 =C2=B1  4%      +1.8       22.24 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
     77.08            -1.9       75.15        perf-profile.children.cycles-=
pp.start_secondary
     68.72            -1.8       66.88        perf-profile.children.cycles-=
pp.cpuidle_enter
     68.69            -1.8       66.86        perf-profile.children.cycles-=
pp.cpuidle_enter_state
     78.27            -1.8       76.45        perf-profile.children.cycles-=
pp.secondary_startup_64
     78.27            -1.8       76.45        perf-profile.children.cycles-=
pp.cpu_startup_entry
     78.29            -1.8       76.48        perf-profile.children.cycles-=
pp.do_idle
     59.20            -1.7       57.46        perf-profile.children.cycles-=
pp.intel_idle
      0.64 =C2=B1 10%      -0.2        0.47 =C2=B1 28%  perf-profile.childr=
en.cycles-pp.tick_nohz_irq_exit
      1.18 =C2=B1  4%      -0.1        1.06 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.poll_idle
      0.47 =C2=B1 10%      -0.1        0.39 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.reschedule_interrupt
      0.41 =C2=B1 11%      -0.1        0.33 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.scheduler_ipi
      0.12 =C2=B1  6%      -0.0        0.10 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.run_timer_softirq
      0.26            -0.0        0.23 =C2=B1  6%  perf-profile.children.cy=
cles-pp.rcu_eqs_enter
      0.36            -0.0        0.34 =C2=B1  4%  perf-profile.children.cy=
cles-pp.irq_enter
      0.09 =C2=B1  5%      -0.0        0.07 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.kfree
      0.07 =C2=B1  7%      -0.0        0.05        perf-profile.children.cy=
cles-pp.tlb_finish_mmu
      0.07 =C2=B1 16%      +0.0        0.09 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.rcu_all_qs
      0.06 =C2=B1 14%      +0.0        0.08 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.__list_del_entry_valid
      0.15 =C2=B1  7%      +0.0        0.17 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.fput_many
      0.11 =C2=B1  6%      +0.0        0.13 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.vma_merge
      0.39 =C2=B1  3%      +0.0        0.41 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.lapic_next_deadline
      0.61 =C2=B1  2%      +0.0        0.64        perf-profile.children.cy=
cles-pp.native_write_msr
      0.32 =C2=B1  2%      +0.0        0.35 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.vma_compute_subtree_gap
      0.19 =C2=B1  7%      +0.0        0.22 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.__vm_enough_memory
      0.48 =C2=B1  5%      +0.0        0.52        perf-profile.children.cy=
cles-pp.vma_link
      0.36 =C2=B1  4%      +0.0        0.40 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.find_next_bit
      0.13 =C2=B1 14%      +0.0        0.18 =C2=B1  2%  perf-profile.childr=
en.cycles-pp._cond_resched
      0.18 =C2=B1 12%      +0.0        0.23 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.___might_sleep
      1.02 =C2=B1  3%      +0.1        1.12 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.rwsem_mark_wake
      0.80 =C2=B1  6%      +0.1        0.91 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.find_vma
      1.13 =C2=B1  3%      +0.1        1.25 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.unmap_region
      0.67 =C2=B1  9%      +0.1        0.78        perf-profile.children.cy=
cles-pp._raw_spin_lock_irq
      0.44 =C2=B1  4%      +0.1        0.57 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.unmap_vmas
      0.38 =C2=B1  6%      +0.1        0.51 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.unmap_page_range
      0.20 =C2=B1 35%      +0.2        0.36 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.run_local_timers
      0.66 =C2=B1  8%      +0.2        0.89 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.unmapped_area_topdown
      1.39 =C2=B1  8%      +0.2        1.64        perf-profile.children.cy=
cles-pp.rwsem_spin_on_owner
      0.78 =C2=B1  8%      +0.3        1.04 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.arch_get_unmapped_area_topdown
      0.88 =C2=B1  9%      +0.3        1.13 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.shmem_get_unmapped_area
      0.99 =C2=B1  7%      +0.3        1.27 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.get_unmapped_area
      3.34 =C2=B1  4%      +0.3        3.67 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.__do_munmap
      3.64 =C2=B1  4%      +0.5        4.09        perf-profile.children.cy=
cles-pp.do_mmap
      6.32 =C2=B1  4%      +0.8        7.07 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.rwsem_down_write_slowpath
      6.81 =C2=B1  4%      +0.8        7.62 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.down_write_killable
     10.07 =C2=B1  4%      +1.3       11.35 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.vm_mmap_pgoff
     10.22 =C2=B1  4%      +1.3       11.51 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.ksys_mmap_pgoff
     20.46 =C2=B1  4%      +1.8       22.31 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.entry_SYSCALL_64_after_hwframe
     20.41 =C2=B1  4%      +1.8       22.26 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.do_syscall_64
     59.19            -1.7       57.44        perf-profile.self.cycles-pp.i=
ntel_idle
      1.14 =C2=B1  3%      -0.1        1.03 =C2=B1  5%  perf-profile.self.c=
ycles-pp.poll_idle
      0.15 =C2=B1  5%      -0.0        0.12 =C2=B1  8%  perf-profile.self.c=
ycles-pp.call_cpuidle
      0.06 =C2=B1 14%      +0.0        0.08 =C2=B1 10%  perf-profile.self.c=
ycles-pp.__list_del_entry_valid
      0.11 =C2=B1  6%      +0.0        0.13 =C2=B1 12%  perf-profile.self.c=
ycles-pp.vma_merge
      0.04 =C2=B1 57%      +0.0        0.06 =C2=B1  6%  perf-profile.self.c=
ycles-pp.rcu_all_qs
      0.61 =C2=B1  2%      +0.0        0.64        perf-profile.self.cycles=
-pp.native_write_msr
      0.30 =C2=B1  2%      +0.0        0.34 =C2=B1  2%  perf-profile.self.c=
ycles-pp.vma_compute_subtree_gap
      0.28 =C2=B1  5%      +0.0        0.32 =C2=B1  3%  perf-profile.self.c=
ycles-pp.__do_munmap
      0.17 =C2=B1 13%      +0.0        0.21 =C2=B1  3%  perf-profile.self.c=
ycles-pp.___might_sleep
      0.38 =C2=B1  6%      +0.0        0.42        perf-profile.self.cycles=
-pp.mmap_region
      0.12 =C2=B1  9%      +0.0        0.16 =C2=B1 22%  perf-profile.self.c=
ycles-pp.__account_scheduler_latency
      0.44 =C2=B1  6%      +0.0        0.48 =C2=B1  5%  perf-profile.self.c=
ycles-pp.down_write_killable
      0.23 =C2=B1  9%      +0.0        0.28 =C2=B1  4%  perf-profile.self.c=
ycles-pp.rwsem_mark_wake
      0.22 =C2=B1  6%      +0.1        0.29 =C2=B1  5%  perf-profile.self.c=
ycles-pp.unmap_page_range
      0.65 =C2=B1  7%      +0.1        0.74 =C2=B1  8%  perf-profile.self.c=
ycles-pp.find_vma
      0.37 =C2=B1  9%      +0.1        0.47 =C2=B1  4%  perf-profile.self.c=
ycles-pp._raw_spin_lock_irq
      0.74 =C2=B1  6%      +0.1        0.89 =C2=B1  4%  perf-profile.self.c=
ycles-pp.rwsem_down_write_slowpath
      0.20 =C2=B1 35%      +0.2        0.35 =C2=B1  8%  perf-profile.self.c=
ycles-pp.run_local_timers
      0.66 =C2=B1  8%      +0.2        0.88 =C2=B1  5%  perf-profile.self.c=
ycles-pp.unmapped_area_topdown
      1.39 =C2=B1  8%      +0.2        1.63        perf-profile.self.cycles=
-pp.rwsem_spin_on_owner


                                                                           =
     =

                           will-it-scale.per_thread_ops                    =
     =

                                                                           =
     =

  7000 +-+-----------------------------------------------------------------=
-+   =

       |                                                                   =
 |   =

  6000 +-++.+..+.+..+.+..+.+..+..+.+..+.+..+.+..+.+..+..+.+..+.+..         =
 |   =

       |  :                                                  O O  O.O  O O =
 O   =

  5000 +-+:                                                                =
 |   =

       O :  O    O  O O  O O  O  O O  O O  O    O    O  O                  =
 |   =

  4000 +-+O    O                             O    O       O                =
 |   =

       | :                                                                 =
 |   =

  3000 +-+                                                                 =
 |   =

       |:                                                                  =
 |   =

  2000 +-+                                                                 =
 |   =

       |:                                                                  =
 |   =

  1000 +-+                                                                 =
 |   =

       |                                                                   =
 |   =

     0 +-+-----------------------------------------------------------------=
-+   =

                                                                           =
     =

                                                                           =
     =

[*] bisect-good sample
[O] bisect-bad  sample

***************************************************************************=
************************
lkp-hsw-4ex1: 144 threads Intel(R) Xeon(R) CPU E7-8890 v3 @ 2.50GHz with 51=
2G memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/iterations/kconfig/nr_task/rootfs/tbox_group/test=
/testcase/ucode:
  gcc-7/performance/30/x86_64-rhel-7.6/1600%/debian-x86_64-2019-05-14.cgz/l=
kp-hsw-4ex1/new_dbase/reaim/0x14

commit: =

  4f23dbc1e6 ("locking/rwsem: Implement lock handoff to prevent lock starva=
tion")
  00f3c5a3df ("locking/rwsem: Always release wait_lock before waking up tas=
ks")

4f23dbc1e657951e 00f3c5a3df2c1e3dab14d0dd2b7 =

---------------- --------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

          1:4          -25%            :2     dmesg.WARNING:at_ip_do_semtim=
edop/0x
           :4           50%           2:2     dmesg.WARNING:at_ip_perf_even=
t_mmap_output/0x
          1:4          -14%           1:2     perf-profile.children.cycles-=
pp.error_entry
          1:4          -11%           0:2     perf-profile.self.cycles-pp.e=
rror_entry
         %stddev     %change         %stddev
             \          |                \  =

   1046913            -1.5%    1031046        reaim.max_jobs_per_min
    193655 =C2=B1 19%     -18.9%     157005 =C2=B1  2%  softirqs.CPU43.TIMER
      5.00 =C2=B1 61%    +220.0%      16.00 =C2=B1 18%  vmstat.procs.b
      1.29 =C2=B1 70%      +1.2        2.51 =C2=B1  4%  turbostat.C1E%
     66.48            +1.2%      67.31        turbostat.RAMWatt
     37.58 =C2=B1  2%      +2.6%      38.57        boot-time.boot
     23.94            +0.7%      24.11        boot-time.dhcp
      4655 =C2=B1  3%      +3.2%       4801        boot-time.idle
   9479168 =C2=B1 12%     +27.5%   12090368 =C2=B1  8%  meminfo.DirectMap2M
      1601 =C2=B1 28%     -50.9%     787.00        meminfo.Mlocked
    114587 =C2=B1  7%     +13.5%     130108        meminfo.Shmem
      4681 =C2=B1 11%     +17.6%       5507 =C2=B1  7%  slabinfo.kmalloc-rc=
l-64.active_objs
      4681 =C2=B1 11%     +17.6%       5507 =C2=B1  7%  slabinfo.kmalloc-rc=
l-64.num_objs
      1076 =C2=B1  7%     -15.7%     908.00        slabinfo.xfrm_state.acti=
ve_objs
      1076 =C2=B1  7%     -15.7%     908.00        slabinfo.xfrm_state.num_=
objs
    294089 =C2=B1  8%      +7.1%     315115 =C2=B1  8%  numa-meminfo.node1.=
FilePages
      1741 =C2=B1 55%     +80.2%       3139 =C2=B1  3%  numa-meminfo.node1.=
Inactive
      1559 =C2=B1 61%     +88.6%       2939 =C2=B1  3%  numa-meminfo.node1.=
Inactive(anon)
     20963 =C2=B1 16%     +65.1%      34612 =C2=B1 29%  numa-meminfo.node1.=
KReclaimable
     20963 =C2=B1 16%     +65.1%      34612 =C2=B1 29%  numa-meminfo.node1.=
SReclaimable
     21840 =C2=B1132%    +132.2%      50711 =C2=B1 86%  numa-meminfo.node1.=
Shmem
    446783 =C2=B1 17%     -24.6%     337072 =C2=B1  3%  numa-meminfo.node3.=
AnonPages
    110.50 =C2=B1 32%     -50.2%      55.00 =C2=B1 29%  numa-vmstat.node0.n=
r_mlock
     73537 =C2=B1  8%      +7.0%      78692 =C2=B1  8%  numa-vmstat.node1.n=
r_file_pages
    388.50 =C2=B1 61%     +89.6%     736.50 =C2=B1  3%  numa-vmstat.node1.n=
r_inactive_anon
      1668 =C2=B1  3%      +9.5%       1827 =C2=B1  7%  numa-vmstat.node1.n=
r_mapped
    102.75 =C2=B1 44%     -61.1%      40.00 =C2=B1  2%  numa-vmstat.node1.n=
r_mlock
      5475 =C2=B1132%    +130.0%      12591 =C2=B1 86%  numa-vmstat.node1.n=
r_shmem
      5242 =C2=B1 16%     +65.1%       8653 =C2=B1 29%  numa-vmstat.node1.n=
r_slab_reclaimable
    388.50 =C2=B1 61%     +89.6%     736.50 =C2=B1  3%  numa-vmstat.node1.n=
r_zone_inactive_anon
     83.50 =C2=B1 28%     -52.7%      39.50        numa-vmstat.node2.nr_mlo=
ck
    112398 =C2=B1 16%     -24.1%      85258 =C2=B1  4%  numa-vmstat.node3.n=
r_anon_pages
    284891            +1.3%     288657        proc-vmstat.nr_file_pages
      5637            +2.4%       5770        proc-vmstat.nr_inactive_anon
    401.25 =C2=B1 28%     -52.0%     192.50        proc-vmstat.nr_mlock
     28688 =C2=B1  7%     +13.3%      32516 =C2=B1  2%  proc-vmstat.nr_shmem
      5637            +2.4%       5770        proc-vmstat.nr_zone_inactive_=
anon
      7134 =C2=B1 61%     +78.7%      12750 =C2=B1  6%  proc-vmstat.numa_hi=
nt_faults
 1.194e+09            +0.7%  1.203e+09        proc-vmstat.numa_hit
 1.194e+09            +0.7%  1.203e+09        proc-vmstat.numa_local
     54546 =C2=B1  2%      +7.2%      58468 =C2=B1  3%  proc-vmstat.pgactiv=
ate
 1.204e+09            +0.7%  1.212e+09        proc-vmstat.pgalloc_normal
 1.203e+09            +0.7%  1.212e+09        proc-vmstat.pgfree
    571.58 =C2=B1  5%     +15.9%     662.44 =C2=B1  2%  sched_debug.cfs_rq:=
/.load_avg.max
      0.42 =C2=B1 29%    +100.0%       0.83 =C2=B1  6%  sched_debug.cfs_rq:=
/.load_avg.min
      0.52 =C2=B1 15%     +24.0%       0.65 =C2=B1  4%  sched_debug.cfs_rq:=
/.nr_running.avg
    628.88 =C2=B1 13%     +19.7%     752.45 =C2=B1  4%  sched_debug.cfs_rq:=
/.util_avg.avg
      1383 =C2=B1  9%     +11.5%       1542 =C2=B1  6%  sched_debug.cfs_rq:=
/.util_avg.max
    248.75 =C2=B1 15%     +33.8%     332.72 =C2=B1  8%  sched_debug.cfs_rq:=
/.util_avg.min
    119.07 =C2=B1 27%     +35.0%     160.71 =C2=B1 10%  sched_debug.cfs_rq:=
/.util_est_enqueued.avg
      0.06 =C2=B1173%    +500.0%       0.33 =C2=B1 33%  sched_debug.cfs_rq:=
/.util_est_enqueued.min
    146725 =C2=B1 15%     +34.6%     197510 =C2=B1  3%  sched_debug.cpu.avg=
_idle.min
     85.85 =C2=B1 10%     +25.7%     107.90 =C2=B1 10%  sched_debug.cpu.clo=
ck.stddev
     85.85 =C2=B1 10%     +25.7%     107.90 =C2=B1 10%  sched_debug.cpu.clo=
ck_task.stddev
     25195 =C2=B1 12%     +18.2%      29793 =C2=B1  5%  sched_debug.cpu.cur=
r->pid.stddev
      0.00 =C2=B1  9%     +22.5%       0.00 =C2=B1  9%  sched_debug.cpu.nex=
t_balance.stddev
     10.13 =C2=B1  2%     +13.9%      11.54 =C2=B1  5%  sched_debug.cpu.nr_=
uninterruptible.avg
  15162686 =C2=B1 75%    +707.2%  1.224e+08 =C2=B1 79%  syscalls.sys_brk.max
 1.345e+08 =C2=B1 10%  +2.6e+07   1.602e+08 =C2=B1  3%  syscalls.sys_brk.no=
ise.100%
 1.471e+08 =C2=B1 12%  +2.7e+07   1.741e+08 =C2=B1  2%  syscalls.sys_brk.no=
ise.2%
 1.437e+08 =C2=B1 11%  +2.7e+07   1.706e+08 =C2=B1  2%  syscalls.sys_brk.no=
ise.25%
 1.467e+08 =C2=B1 12%  +2.7e+07   1.736e+08 =C2=B1  2%  syscalls.sys_brk.no=
ise.5%
 1.397e+08 =C2=B1 11%  +2.7e+07   1.663e+08 =C2=B1  2%  syscalls.sys_brk.no=
ise.50%
 1.367e+08 =C2=B1 11%  +2.6e+07   1.626e+08 =C2=B1  2%  syscalls.sys_brk.no=
ise.75%
 6.435e+08 =C2=B1 78%    +108.2%  1.339e+09        syscalls.sys_mmap.max
    320983 =C2=B1138%   +5348.2%   17487893 =C2=B1 13%  syscalls.sys_newsta=
t.max
      3342 =C2=B1101%    +130.9%       7718        syscalls.sys_newstat.med
 1.073e+08 =C2=B1100%  +1.2e+08   2.271e+08 =C2=B1  3%  syscalls.sys_newsta=
t.noise.2%
  1.01e+08 =C2=B1100%  +1.1e+08   2.106e+08 =C2=B1  3%  syscalls.sys_newsta=
t.noise.25%
 1.071e+08 =C2=B1100%  +1.2e+08   2.263e+08 =C2=B1  3%  syscalls.sys_newsta=
t.noise.5%
  87529237 =C2=B1100%  +9.3e+07   1.802e+08 =C2=B1  3%  syscalls.sys_newsta=
t.noise.50%
     23.08 =C2=B1  4%     -12.8%      20.13 =C2=B1  3%  perf-stat.i.MPKI
      1.38            +0.1        1.45        perf-stat.i.cache-miss-rate%
     84942 =C2=B1  2%      +3.4%      87812        perf-stat.i.context-swit=
ches
      1.89 =C2=B1  7%     -17.3%       1.56        perf-stat.i.cpi
      8139 =C2=B1 11%     -24.0%       6183 =C2=B1  2%  perf-stat.i.cycles-=
between-cache-misses
      0.28 =C2=B1 12%      -0.1        0.21 =C2=B1  6%  perf-stat.i.dTLB-lo=
ad-miss-rate%
      0.14            -0.0        0.13 =C2=B1  2%  perf-stat.i.dTLB-store-m=
iss-rate%
     58.16 =C2=B1  2%      -2.2       55.97        perf-stat.i.iTLB-load-mi=
ss-rate%
  10359697 =C2=B1  3%      +6.6%   11042136 =C2=B1  3%  perf-stat.i.iTLB-lo=
ads
      0.79            +3.3%       0.82        perf-stat.i.ipc
   6896869 =C2=B1  2%      +2.9%    7098370        perf-stat.i.node-loads
   8004284 =C2=B1  3%      +4.2%    8341263        perf-stat.i.node-store-m=
isses
   7417146 =C2=B1  5%      +8.7%    8061221 =C2=B1  3%  perf-stat.i.node-st=
ores
      1.42            +0.0        1.44        perf-stat.overall.cache-miss-=
rate%
      4567            -1.6%       4493        perf-stat.overall.cycles-betw=
een-cache-misses
  10320774 =C2=B1  3%      +6.5%   10994114 =C2=B1  3%  perf-stat.ps.iTLB-l=
oads
   6871230 =C2=B1  2%      +2.9%    7067176        perf-stat.ps.node-loads
   7969678 =C2=B1  3%      +4.1%    8297859        perf-stat.ps.node-store-=
misses
   7413339 =C2=B1  5%      +8.7%    8057926 =C2=B1  3%  perf-stat.ps.node-s=
tores
      1296 =C2=B1106%     -67.7%     418.50 =C2=B1  2%  interrupts.45:PCI-M=
SI.1572864-edge.eth0-TxRx-0
    440.50 =C2=B1 59%    +324.0%       1867 =C2=B1 36%  interrupts.48:PCI-M=
SI.1572867-edge.eth0-TxRx-3
    266.50 =C2=B1  5%     +51.4%     403.50 =C2=B1 28%  interrupts.54:PCI-M=
SI.1572873-edge.eth0-TxRx-9
    279.25 =C2=B1  8%     +62.4%     453.50 =C2=B1 26%  interrupts.60:PCI-M=
SI.1572879-edge.eth0-TxRx-15
    279.25 =C2=B1  6%     -11.2%     248.00        interrupts.63:PCI-MSI.15=
72882-edge.eth0-TxRx-18
    929442 =C2=B1  2%      +3.4%     960727        interrupts.CAL:Function_=
call_interrupts
      1296 =C2=B1106%     -67.7%     418.50 =C2=B1  2%  interrupts.CPU0.45:=
PCI-MSI.1572864-edge.eth0-TxRx-0
      1788 =C2=B1  3%     +13.5%       2030 =C2=B1  2%  interrupts.CPU0.TLB=
:TLB_shootdowns
      1773 =C2=B1  2%     +21.2%       2149 =C2=B1  2%  interrupts.CPU1.TLB=
:TLB_shootdowns
      6356 =C2=B1  5%      +7.1%       6808 =C2=B1  3%  interrupts.CPU10.CA=
L:Function_call_interrupts
    677.00 =C2=B1172%    +408.1%       3440        interrupts.CPU10.NMI:Non=
-maskable_interrupts
    677.00 =C2=B1172%    +408.1%       3440        interrupts.CPU10.PMI:Per=
formance_monitoring_interrupts
      1766           +22.5%       2162        interrupts.CPU10.TLB:TLB_shoo=
tdowns
      1834 =C2=B1  4%     +15.6%       2120 =C2=B1  3%  interrupts.CPU100.T=
LB:TLB_shootdowns
      1539 =C2=B1 76%    +235.8%       5168 =C2=B1 30%  interrupts.CPU101.N=
MI:Non-maskable_interrupts
      1539 =C2=B1 76%    +235.8%       5168 =C2=B1 30%  interrupts.CPU101.P=
MI:Performance_monitoring_interrupts
      1810 =C2=B1  3%     +15.4%       2088 =C2=B1  3%  interrupts.CPU101.T=
LB:TLB_shootdowns
      1842 =C2=B1  8%     +11.8%       2060 =C2=B1  6%  interrupts.CPU103.T=
LB:TLB_shootdowns
      1796 =C2=B1  4%     +13.0%       2029 =C2=B1  3%  interrupts.CPU104.T=
LB:TLB_shootdowns
      1835 =C2=B1  4%     +16.2%       2132        interrupts.CPU105.TLB:TL=
B_shootdowns
      1848 =C2=B1  5%     +14.7%       2120 =C2=B1  2%  interrupts.CPU106.T=
LB:TLB_shootdowns
      1834 =C2=B1  2%     +15.0%       2110        interrupts.CPU107.TLB:TL=
B_shootdowns
      1825 =C2=B1  3%     +14.5%       2090        interrupts.CPU108.TLB:TL=
B_shootdowns
      1844 =C2=B1  4%     +14.0%       2103 =C2=B1  2%  interrupts.CPU109.T=
LB:TLB_shootdowns
      6380 =C2=B1  6%      +8.9%       6950 =C2=B1  2%  interrupts.CPU11.CA=
L:Function_call_interrupts
    694.50 =C2=B1166%    +633.8%       5096 =C2=B1 32%  interrupts.CPU11.NM=
I:Non-maskable_interrupts
    694.50 =C2=B1166%    +633.8%       5096 =C2=B1 32%  interrupts.CPU11.PM=
I:Performance_monitoring_interrupts
      1828 =C2=B1  4%     +15.1%       2105 =C2=B1  4%  interrupts.CPU11.TL=
B:TLB_shootdowns
      1819 =C2=B1  5%     +18.0%       2147 =C2=B1  6%  interrupts.CPU110.T=
LB:TLB_shootdowns
      3634 =C2=B1 58%     -99.0%      36.00 =C2=B1 97%  interrupts.CPU111.N=
MI:Non-maskable_interrupts
      3634 =C2=B1 58%     -99.0%      36.00 =C2=B1 97%  interrupts.CPU111.P=
MI:Performance_monitoring_interrupts
      1876 =C2=B1  8%     +13.8%       2135 =C2=B1  5%  interrupts.CPU111.T=
LB:TLB_shootdowns
      5937 =C2=B1 12%    -100.0%       0.50 =C2=B1100%  interrupts.CPU112.N=
MI:Non-maskable_interrupts
      5937 =C2=B1 12%    -100.0%       0.50 =C2=B1100%  interrupts.CPU112.P=
MI:Performance_monitoring_interrupts
      1835 =C2=B1  6%     +13.7%       2087 =C2=B1  4%  interrupts.CPU112.T=
LB:TLB_shootdowns
      5033 =C2=B1 18%     -33.0%       3374 =C2=B1  2%  interrupts.CPU113.N=
MI:Non-maskable_interrupts
      5033 =C2=B1 18%     -33.0%       3374 =C2=B1  2%  interrupts.CPU113.P=
MI:Performance_monitoring_interrupts
      1798 =C2=B1  4%     +17.8%       2118 =C2=B1  4%  interrupts.CPU113.T=
LB:TLB_shootdowns
      1818 =C2=B1  3%     +19.9%       2180 =C2=B1  3%  interrupts.CPU114.T=
LB:TLB_shootdowns
      1787 =C2=B1  3%     +17.1%       2093 =C2=B1  4%  interrupts.CPU115.T=
LB:TLB_shootdowns
      5083 =C2=B1 28%     +35.1%       6868 =C2=B1  3%  interrupts.CPU116.N=
MI:Non-maskable_interrupts
      5083 =C2=B1 28%     +35.1%       6868 =C2=B1  3%  interrupts.CPU116.P=
MI:Performance_monitoring_interrupts
      2939 =C2=B1 60%    +134.2%       6885 =C2=B1  2%  interrupts.CPU117.N=
MI:Non-maskable_interrupts
      2939 =C2=B1 60%    +134.2%       6885 =C2=B1  2%  interrupts.CPU117.P=
MI:Performance_monitoring_interrupts
      1777 =C2=B1  2%     +18.4%       2104        interrupts.CPU117.TLB:TL=
B_shootdowns
      1799 =C2=B1  5%     +22.8%       2209 =C2=B1  3%  interrupts.CPU118.T=
LB:TLB_shootdowns
      1861 =C2=B1  3%     +17.8%       2193        interrupts.CPU119.TLB:TL=
B_shootdowns
      1895 =C2=B1  7%     +11.9%       2120 =C2=B1  2%  interrupts.CPU12.TL=
B:TLB_shootdowns
      1846 =C2=B1  3%     +19.5%       2206 =C2=B1  4%  interrupts.CPU120.T=
LB:TLB_shootdowns
      1806 =C2=B1  5%     +18.4%       2139        interrupts.CPU121.TLB:TL=
B_shootdowns
      1856 =C2=B1  6%     +15.7%       2148 =C2=B1  2%  interrupts.CPU122.T=
LB:TLB_shootdowns
      1768 =C2=B1  4%     +21.7%       2152 =C2=B1  2%  interrupts.CPU123.T=
LB:TLB_shootdowns
      1821 =C2=B1  3%     +13.5%       2067 =C2=B1  4%  interrupts.CPU124.T=
LB:TLB_shootdowns
    733.75 =C2=B1168%    +354.2%       3333 =C2=B1 97%  interrupts.CPU125.N=
MI:Non-maskable_interrupts
    733.75 =C2=B1168%    +354.2%       3333 =C2=B1 97%  interrupts.CPU125.P=
MI:Performance_monitoring_interrupts
      1828 =C2=B1  3%     +14.4%       2091        interrupts.CPU125.TLB:TL=
B_shootdowns
      1806 =C2=B1  4%     +12.1%       2024 =C2=B1  4%  interrupts.CPU126.T=
LB:TLB_shootdowns
      1359 =C2=B1172%    +279.4%       5156 =C2=B1 30%  interrupts.CPU127.N=
MI:Non-maskable_interrupts
      1359 =C2=B1172%    +279.4%       5156 =C2=B1 30%  interrupts.CPU127.P=
MI:Performance_monitoring_interrupts
      1834 =C2=B1  5%     +15.9%       2125 =C2=B1  3%  interrupts.CPU127.T=
LB:TLB_shootdowns
      1810 =C2=B1  3%     +14.8%       2078        interrupts.CPU128.TLB:TL=
B_shootdowns
      1841 =C2=B1  5%     +14.3%       2105        interrupts.CPU129.TLB:TL=
B_shootdowns
      5913 =C2=B1 12%     -70.4%       1748 =C2=B1 99%  interrupts.CPU13.NM=
I:Non-maskable_interrupts
      5913 =C2=B1 12%     -70.4%       1748 =C2=B1 99%  interrupts.CPU13.PM=
I:Performance_monitoring_interrupts
      1778 =C2=B1  4%     +18.9%       2114        interrupts.CPU13.TLB:TLB=
_shootdowns
      1861 =C2=B1  6%     +11.7%       2080 =C2=B1  6%  interrupts.CPU130.T=
LB:TLB_shootdowns
      1768           +25.3%       2216 =C2=B1  2%  interrupts.CPU131.TLB:TL=
B_shootdowns
      1810 =C2=B1  3%     +16.9%       2115 =C2=B1  4%  interrupts.CPU132.T=
LB:TLB_shootdowns
      2343 =C2=B1 87%    +119.8%       5152 =C2=B1 30%  interrupts.CPU133.N=
MI:Non-maskable_interrupts
      2343 =C2=B1 87%    +119.8%       5152 =C2=B1 30%  interrupts.CPU133.P=
MI:Performance_monitoring_interrupts
      1842 =C2=B1  5%     +14.8%       2115 =C2=B1  3%  interrupts.CPU133.T=
LB:TLB_shootdowns
      1866 =C2=B1  6%     +12.0%       2090 =C2=B1  3%  interrupts.CPU134.T=
LB:TLB_shootdowns
      1829 =C2=B1  3%     +15.5%       2113 =C2=B1  2%  interrupts.CPU135.T=
LB:TLB_shootdowns
      1898 =C2=B1  5%     +13.8%       2159 =C2=B1  3%  interrupts.CPU136.T=
LB:TLB_shootdowns
      1778 =C2=B1  3%     +24.8%       2219 =C2=B1  6%  interrupts.CPU137.T=
LB:TLB_shootdowns
      1887 =C2=B1  5%     +13.3%       2138 =C2=B1  3%  interrupts.CPU138.T=
LB:TLB_shootdowns
      9349 =C2=B1  2%     +10.8%      10359        interrupts.CPU139.RES:Re=
scheduling_interrupts
      1824 =C2=B1  3%     +21.0%       2206 =C2=B1  2%  interrupts.CPU139.T=
LB:TLB_shootdowns
      1815 =C2=B1  3%     +19.0%       2161 =C2=B1  3%  interrupts.CPU14.TL=
B:TLB_shootdowns
      1815 =C2=B1  6%     +18.1%       2143 =C2=B1  4%  interrupts.CPU140.T=
LB:TLB_shootdowns
      1815 =C2=B1  3%     +16.3%       2110 =C2=B1  3%  interrupts.CPU141.T=
LB:TLB_shootdowns
      1843 =C2=B1  5%     +16.4%       2145        interrupts.CPU142.TLB:TL=
B_shootdowns
      9028            +8.2%       9767        interrupts.CPU143.RES:Resched=
uling_interrupts
      1782 =C2=B1  3%     +20.4%       2147 =C2=B1  2%  interrupts.CPU143.T=
LB:TLB_shootdowns
    279.25 =C2=B1  8%     +62.4%     453.50 =C2=B1 26%  interrupts.CPU15.60=
:PCI-MSI.1572879-edge.eth0-TxRx-15
      6215 =C2=B1  2%     +12.7%       7006        interrupts.CPU15.CAL:Fun=
ction_call_interrupts
      1608 =C2=B1141%    +328.5%       6893        interrupts.CPU15.NMI:Non=
-maskable_interrupts
      1608 =C2=B1141%    +328.5%       6893        interrupts.CPU15.PMI:Per=
formance_monitoring_interrupts
      1885 =C2=B1  7%     +12.8%       2128 =C2=B1  3%  interrupts.CPU15.TL=
B:TLB_shootdowns
      1784 =C2=B1  2%     +21.3%       2165 =C2=B1  2%  interrupts.CPU16.TL=
B:TLB_shootdowns
      6329 =C2=B1  5%      +9.3%       6917 =C2=B1  2%  interrupts.CPU17.CA=
L:Function_call_interrupts
      1808 =C2=B1  3%     +17.2%       2120 =C2=B1  2%  interrupts.CPU17.TL=
B:TLB_shootdowns
    279.25 =C2=B1  6%     -11.2%     248.00        interrupts.CPU18.63:PCI-=
MSI.1572882-edge.eth0-TxRx-18
      1783 =C2=B1  5%     +19.8%       2136 =C2=B1  6%  interrupts.CPU18.TL=
B:TLB_shootdowns
      6202 =C2=B1  3%      +7.9%       6692 =C2=B1  3%  interrupts.CPU19.CA=
L:Function_call_interrupts
      1314 =C2=B1173%    +165.9%       3495 =C2=B1 99%  interrupts.CPU19.NM=
I:Non-maskable_interrupts
      1314 =C2=B1173%    +165.9%       3495 =C2=B1 99%  interrupts.CPU19.PM=
I:Performance_monitoring_interrupts
      1814 =C2=B1  7%     +19.1%       2161 =C2=B1  3%  interrupts.CPU19.TL=
B:TLB_shootdowns
      6427 =C2=B1  5%      +5.9%       6806 =C2=B1  3%  interrupts.CPU2.CAL=
:Function_call_interrupts
    697.75 =C2=B1162%    +875.9%       6809 =C2=B1  2%  interrupts.CPU2.NMI=
:Non-maskable_interrupts
    697.75 =C2=B1162%    +875.9%       6809 =C2=B1  2%  interrupts.CPU2.PMI=
:Performance_monitoring_interrupts
      1824 =C2=B1  4%     +17.3%       2141 =C2=B1  5%  interrupts.CPU2.TLB=
:TLB_shootdowns
      1843 =C2=B1  6%     +16.6%       2149 =C2=B1  3%  interrupts.CPU20.TL=
B:TLB_shootdowns
      3475 =C2=B1 65%    +100.0%       6949 =C2=B1  2%  interrupts.CPU21.NM=
I:Non-maskable_interrupts
      3475 =C2=B1 65%    +100.0%       6949 =C2=B1  2%  interrupts.CPU21.PM=
I:Performance_monitoring_interrupts
      1813 =C2=B1  4%     +18.7%       2153 =C2=B1  2%  interrupts.CPU21.TL=
B:TLB_shootdowns
      1859 =C2=B1  3%     +14.3%       2124        interrupts.CPU22.TLB:TLB=
_shootdowns
      6549 =C2=B1  3%      +6.3%       6962 =C2=B1  2%  interrupts.CPU23.CA=
L:Function_call_interrupts
      2528 =C2=B1 63%    +170.2%       6833 =C2=B1  2%  interrupts.CPU23.NM=
I:Non-maskable_interrupts
      2528 =C2=B1 63%    +170.2%       6833 =C2=B1  2%  interrupts.CPU23.PM=
I:Performance_monitoring_interrupts
      1837 =C2=B1  6%     +17.0%       2150 =C2=B1  4%  interrupts.CPU23.TL=
B:TLB_shootdowns
      1808 =C2=B1  3%     +15.7%       2093 =C2=B1  4%  interrupts.CPU24.TL=
B:TLB_shootdowns
      1816 =C2=B1  4%     +18.0%       2142 =C2=B1  2%  interrupts.CPU25.TL=
B:TLB_shootdowns
      1812 =C2=B1  5%     +17.0%       2120        interrupts.CPU26.TLB:TLB=
_shootdowns
      1769 =C2=B1  3%     +19.5%       2115 =C2=B1  7%  interrupts.CPU27.TL=
B:TLB_shootdowns
      1862           +12.5%       2094        interrupts.CPU28.TLB:TLB_shoo=
tdowns
      1838 =C2=B1  5%     +11.9%       2057 =C2=B1  5%  interrupts.CPU29.TL=
B:TLB_shootdowns
    440.50 =C2=B1 59%    +324.0%       1867 =C2=B1 36%  interrupts.CPU3.48:=
PCI-MSI.1572867-edge.eth0-TxRx-3
      6171 =C2=B1  2%      +9.6%       6764 =C2=B1  5%  interrupts.CPU3.CAL=
:Function_call_interrupts
      1280 =C2=B1173%    +302.0%       5146 =C2=B1 32%  interrupts.CPU3.NMI=
:Non-maskable_interrupts
      1280 =C2=B1173%    +302.0%       5146 =C2=B1 32%  interrupts.CPU3.PMI=
:Performance_monitoring_interrupts
      1769 =C2=B1  3%     +20.8%       2137 =C2=B1  4%  interrupts.CPU3.TLB=
:TLB_shootdowns
    905.25 =C2=B1169%    +471.1%       5169 =C2=B1 34%  interrupts.CPU30.NM=
I:Non-maskable_interrupts
    905.25 =C2=B1169%    +471.1%       5169 =C2=B1 34%  interrupts.CPU30.PM=
I:Performance_monitoring_interrupts
      1798 =C2=B1  5%     +19.2%       2145 =C2=B1  4%  interrupts.CPU31.TL=
B:TLB_shootdowns
      1821 =C2=B1  3%     +19.5%       2176 =C2=B1  5%  interrupts.CPU33.TL=
B:TLB_shootdowns
      6256 =C2=B1  3%     +12.4%       7031        interrupts.CPU34.CAL:Fun=
ction_call_interrupts
    252.00 =C2=B1172%   +1926.4%       5106 =C2=B1 31%  interrupts.CPU34.NM=
I:Non-maskable_interrupts
    252.00 =C2=B1172%   +1926.4%       5106 =C2=B1 31%  interrupts.CPU34.PM=
I:Performance_monitoring_interrupts
      1877 =C2=B1  5%     +14.3%       2145 =C2=B1  8%  interrupts.CPU34.TL=
B:TLB_shootdowns
      1804 =C2=B1  6%     +17.5%       2120 =C2=B1  7%  interrupts.CPU35.TL=
B:TLB_shootdowns
      6188 =C2=B1  4%     +11.6%       6909        interrupts.CPU36.CAL:Fun=
ction_call_interrupts
      1347 =C2=B1173%    +280.4%       5126 =C2=B1 36%  interrupts.CPU36.NM=
I:Non-maskable_interrupts
      1347 =C2=B1173%    +280.4%       5126 =C2=B1 36%  interrupts.CPU36.PM=
I:Performance_monitoring_interrupts
      1751 =C2=B1  4%     +19.7%       2096 =C2=B1  3%  interrupts.CPU36.TL=
B:TLB_shootdowns
      1772 =C2=B1  4%     +18.1%       2093 =C2=B1  5%  interrupts.CPU37.TL=
B:TLB_shootdowns
      1875 =C2=B1  3%     +12.6%       2111        interrupts.CPU38.TLB:TLB=
_shootdowns
    900.75 =C2=B1172%    +675.1%       6981 =C2=B1  3%  interrupts.CPU39.NM=
I:Non-maskable_interrupts
    900.75 =C2=B1172%    +675.1%       6981 =C2=B1  3%  interrupts.CPU39.PM=
I:Performance_monitoring_interrupts
      1818 =C2=B1  4%     +15.9%       2106 =C2=B1  3%  interrupts.CPU39.TL=
B:TLB_shootdowns
      1827 =C2=B1  6%     +17.2%       2142 =C2=B1  3%  interrupts.CPU4.TLB=
:TLB_shootdowns
      6197 =C2=B1  2%     +13.4%       7027        interrupts.CPU40.CAL:Fun=
ction_call_interrupts
      1.25 =C2=B1 34%  +5.4e+05%       6793 =C2=B1  3%  interrupts.CPU40.NM=
I:Non-maskable_interrupts
      1.25 =C2=B1 34%  +5.4e+05%       6793 =C2=B1  3%  interrupts.CPU40.PM=
I:Performance_monitoring_interrupts
      1811 =C2=B1  3%     +22.0%       2210 =C2=B1  2%  interrupts.CPU40.TL=
B:TLB_shootdowns
      1372 =C2=B1168%    +406.5%       6951        interrupts.CPU41.NMI:Non=
-maskable_interrupts
      1372 =C2=B1168%    +406.5%       6951        interrupts.CPU41.PMI:Per=
formance_monitoring_interrupts
      1827 =C2=B1  6%     +13.9%       2081 =C2=B1  4%  interrupts.CPU41.TL=
B:TLB_shootdowns
      2099 =C2=B1108%    +227.5%       6874 =C2=B1  2%  interrupts.CPU42.NM=
I:Non-maskable_interrupts
      2099 =C2=B1108%    +227.5%       6874 =C2=B1  2%  interrupts.CPU42.PM=
I:Performance_monitoring_interrupts
      1824 =C2=B1  5%     +14.7%       2091 =C2=B1  4%  interrupts.CPU42.TL=
B:TLB_shootdowns
      2912 =C2=B1 92%    +139.0%       6960 =C2=B1  2%  interrupts.CPU43.NM=
I:Non-maskable_interrupts
      2912 =C2=B1 92%    +139.0%       6960 =C2=B1  2%  interrupts.CPU43.PM=
I:Performance_monitoring_interrupts
      1775 =C2=B1  2%     +20.1%       2133 =C2=B1  2%  interrupts.CPU43.TL=
B:TLB_shootdowns
      1815 =C2=B1  4%     +13.4%       2058        interrupts.CPU44.TLB:TLB=
_shootdowns
      1803 =C2=B1  2%     +19.9%       2162 =C2=B1  4%  interrupts.CPU45.TL=
B:TLB_shootdowns
    722.00 =C2=B1149%    +856.6%       6906 =C2=B1  2%  interrupts.CPU46.NM=
I:Non-maskable_interrupts
    722.00 =C2=B1149%    +856.6%       6906 =C2=B1  2%  interrupts.CPU46.PM=
I:Performance_monitoring_interrupts
      1821 =C2=B1  2%     +20.6%       2196 =C2=B1  2%  interrupts.CPU46.TL=
B:TLB_shootdowns
      1350 =C2=B1173%    +403.6%       6802 =C2=B1  3%  interrupts.CPU47.NM=
I:Non-maskable_interrupts
      1350 =C2=B1173%    +403.6%       6802 =C2=B1  3%  interrupts.CPU47.PM=
I:Performance_monitoring_interrupts
      1784 =C2=B1  5%     +16.2%       2073 =C2=B1  3%  interrupts.CPU47.TL=
B:TLB_shootdowns
      1.00 =C2=B1 70%  +3.4e+05%       3397 =C2=B1 93%  interrupts.CPU48.NM=
I:Non-maskable_interrupts
      1.00 =C2=B1 70%  +3.4e+05%       3397 =C2=B1 93%  interrupts.CPU48.PM=
I:Performance_monitoring_interrupts
      1919 =C2=B1  8%     +10.4%       2119 =C2=B1  4%  interrupts.CPU48.TL=
B:TLB_shootdowns
      6184            +8.5%       6707 =C2=B1  3%  interrupts.CPU49.CAL:Fun=
ction_call_interrupts
      6.50 =C2=B1155%  +1.1e+05%       6876        interrupts.CPU49.NMI:Non=
-maskable_interrupts
      6.50 =C2=B1155%  +1.1e+05%       6876        interrupts.CPU49.PMI:Per=
formance_monitoring_interrupts
      1774           +20.6%       2139 =C2=B1  4%  interrupts.CPU49.TLB:TLB=
_shootdowns
      1809 =C2=B1  2%     +15.6%       2091 =C2=B1  2%  interrupts.CPU5.TLB=
:TLB_shootdowns
      6218            +8.9%       6771 =C2=B1  4%  interrupts.CPU50.CAL:Fun=
ction_call_interrupts
      4.25 =C2=B1 87%  +1.6e+05%       6759 =C2=B1  3%  interrupts.CPU50.NM=
I:Non-maskable_interrupts
      4.25 =C2=B1 87%  +1.6e+05%       6759 =C2=B1  3%  interrupts.CPU50.PM=
I:Performance_monitoring_interrupts
      1802 =C2=B1  3%     +19.5%       2154 =C2=B1  2%  interrupts.CPU50.TL=
B:TLB_shootdowns
      1885 =C2=B1  2%     +10.6%       2085        interrupts.CPU51.TLB:TLB=
_shootdowns
      1818 =C2=B1  3%     +20.2%       2187        interrupts.CPU52.TLB:TLB=
_shootdowns
      1839 =C2=B1  6%     +14.0%       2096 =C2=B1  8%  interrupts.CPU53.TL=
B:TLB_shootdowns
      6314 =C2=B1  4%      +5.6%       6669 =C2=B1  3%  interrupts.CPU54.CA=
L:Function_call_interrupts
      1735 =C2=B1  4%     +22.1%       2118 =C2=B1  2%  interrupts.CPU54.TL=
B:TLB_shootdowns
      4565 =C2=B1 59%    -100.0%       0.00        interrupts.CPU55.NMI:Non=
-maskable_interrupts
      4565 =C2=B1 59%    -100.0%       0.00        interrupts.CPU55.PMI:Per=
formance_monitoring_interrupts
      1792 =C2=B1  4%     +16.9%       2095 =C2=B1  3%  interrupts.CPU55.TL=
B:TLB_shootdowns
     10308 =C2=B1  2%      +8.8%      11220 =C2=B1  2%  interrupts.CPU56.RE=
S:Rescheduling_interrupts
      1848 =C2=B1  6%     +13.7%       2102 =C2=B1  2%  interrupts.CPU56.TL=
B:TLB_shootdowns
      6284 =C2=B1  4%      +9.1%       6854        interrupts.CPU57.CAL:Fun=
ction_call_interrupts
      1791 =C2=B1131%    +283.6%       6871        interrupts.CPU57.NMI:Non=
-maskable_interrupts
      1791 =C2=B1131%    +283.6%       6871        interrupts.CPU57.PMI:Per=
formance_monitoring_interrupts
     10680 =C2=B1  4%     +11.1%      11866 =C2=B1  2%  interrupts.CPU57.RE=
S:Rescheduling_interrupts
      1776           +19.1%       2116 =C2=B1  3%  interrupts.CPU57.TLB:TLB=
_shootdowns
      1849 =C2=B1  3%     +11.7%       2066 =C2=B1  2%  interrupts.CPU58.TL=
B:TLB_shootdowns
      1774 =C2=B1  6%     +27.3%       2258 =C2=B1  4%  interrupts.CPU59.TL=
B:TLB_shootdowns
      1799 =C2=B1  4%     +24.7%       2243 =C2=B1  7%  interrupts.CPU6.TLB=
:TLB_shootdowns
      1839 =C2=B1  5%     +14.6%       2107        interrupts.CPU60.TLB:TLB=
_shootdowns
      1819 =C2=B1  3%     +11.4%       2027 =C2=B1  2%  interrupts.CPU61.TL=
B:TLB_shootdowns
      9953 =C2=B1  2%     +14.5%      11400 =C2=B1  8%  interrupts.CPU62.RE=
S:Rescheduling_interrupts
      1839 =C2=B1  2%     +15.4%       2123        interrupts.CPU62.TLB:TLB=
_shootdowns
      1840 =C2=B1  3%     +13.8%       2093 =C2=B1  2%  interrupts.CPU63.TL=
B:TLB_shootdowns
      1829 =C2=B1  3%     +20.9%       2212 =C2=B1  4%  interrupts.CPU64.TL=
B:TLB_shootdowns
      1802 =C2=B1  2%     +16.6%       2100        interrupts.CPU65.TLB:TLB=
_shootdowns
      1850 =C2=B1  4%     +10.8%       2050 =C2=B1  7%  interrupts.CPU66.TL=
B:TLB_shootdowns
      1816 =C2=B1  5%     +13.6%       2064 =C2=B1  4%  interrupts.CPU67.TL=
B:TLB_shootdowns
      1841 =C2=B1  4%     +12.9%       2079 =C2=B1  2%  interrupts.CPU68.TL=
B:TLB_shootdowns
      6374 =C2=B1  2%      +9.4%       6974        interrupts.CPU7.CAL:Func=
tion_call_interrupts
    789.25 =C2=B1153%    +531.0%       4980 =C2=B1 31%  interrupts.CPU7.NMI=
:Non-maskable_interrupts
    789.25 =C2=B1153%    +531.0%       4980 =C2=B1 31%  interrupts.CPU7.PMI=
:Performance_monitoring_interrupts
      1886 =C2=B1  6%     +12.4%       2119 =C2=B1  3%  interrupts.CPU7.TLB=
:TLB_shootdowns
      1841 =C2=B1  7%     +13.0%       2080        interrupts.CPU70.TLB:TLB=
_shootdowns
      1781 =C2=B1  3%     +25.0%       2227        interrupts.CPU71.TLB:TLB=
_shootdowns
      1805 =C2=B1  3%     +17.9%       2129 =C2=B1  3%  interrupts.CPU72.TL=
B:TLB_shootdowns
      1844 =C2=B1  5%     +16.8%       2153        interrupts.CPU73.TLB:TLB=
_shootdowns
      1848 =C2=B1  5%     +16.2%       2148 =C2=B1  2%  interrupts.CPU74.TL=
B:TLB_shootdowns
      1850 =C2=B1  3%     +15.4%       2136 =C2=B1  5%  interrupts.CPU75.TL=
B:TLB_shootdowns
      1872 =C2=B1  4%     +18.0%       2210        interrupts.CPU76.TLB:TLB=
_shootdowns
      3894 =C2=B1 61%     +75.1%       6818 =C2=B1  2%  interrupts.CPU77.NM=
I:Non-maskable_interrupts
      3894 =C2=B1 61%     +75.1%       6818 =C2=B1  2%  interrupts.CPU77.PM=
I:Performance_monitoring_interrupts
      1778 =C2=B1  3%     +18.2%       2102 =C2=B1  3%  interrupts.CPU77.TL=
B:TLB_shootdowns
      4300 =C2=B1 24%     +58.6%       6819        interrupts.CPU78.NMI:Non=
-maskable_interrupts
      4300 =C2=B1 24%     +58.6%       6819        interrupts.CPU78.PMI:Per=
formance_monitoring_interrupts
      1799           +18.2%       2127 =C2=B1  4%  interrupts.CPU78.TLB:TLB=
_shootdowns
      4562 =C2=B1 41%     -98.5%      69.50 =C2=B1 51%  interrupts.CPU79.NM=
I:Non-maskable_interrupts
      4562 =C2=B1 41%     -98.5%      69.50 =C2=B1 51%  interrupts.CPU79.PM=
I:Performance_monitoring_interrupts
      1783 =C2=B1  3%     +20.7%       2152        interrupts.CPU79.TLB:TLB=
_shootdowns
      1843           +14.2%       2106        interrupts.CPU8.TLB:TLB_shoot=
downs
      1769 =C2=B1  2%     +19.6%       2115        interrupts.CPU80.TLB:TLB=
_shootdowns
      1828 =C2=B1  5%     +14.9%       2101        interrupts.CPU81.TLB:TLB=
_shootdowns
      1844           +15.9%       2137 =C2=B1  4%  interrupts.CPU82.TLB:TLB=
_shootdowns
      1793 =C2=B1  5%     +19.4%       2141        interrupts.CPU83.TLB:TLB=
_shootdowns
     47.25 =C2=B1120%    +704.2%     380.00 =C2=B1 80%  interrupts.CPU84.NM=
I:Non-maskable_interrupts
     47.25 =C2=B1120%    +704.2%     380.00 =C2=B1 80%  interrupts.CPU84.PM=
I:Performance_monitoring_interrupts
      1834 =C2=B1  7%     +19.1%       2184        interrupts.CPU85.TLB:TLB=
_shootdowns
      1855 =C2=B1  3%     +15.1%       2135 =C2=B1  3%  interrupts.CPU86.TL=
B:TLB_shootdowns
      3879 =C2=B1 69%    -100.0%       1.50 =C2=B1 33%  interrupts.CPU87.NM=
I:Non-maskable_interrupts
      3879 =C2=B1 69%    -100.0%       1.50 =C2=B1 33%  interrupts.CPU87.PM=
I:Performance_monitoring_interrupts
      1852 =C2=B1  2%     +15.7%       2143 =C2=B1  4%  interrupts.CPU87.TL=
B:TLB_shootdowns
      1790 =C2=B1  5%     +19.1%       2131 =C2=B1  4%  interrupts.CPU88.TL=
B:TLB_shootdowns
      1848 =C2=B1  6%     +18.1%       2183 =C2=B1  4%  interrupts.CPU89.TL=
B:TLB_shootdowns
    266.50 =C2=B1  5%     +51.4%     403.50 =C2=B1 28%  interrupts.CPU9.54:=
PCI-MSI.1572873-edge.eth0-TxRx-9
      1816 =C2=B1  3%     +19.1%       2162 =C2=B1  2%  interrupts.CPU9.TLB=
:TLB_shootdowns
      1842 =C2=B1  4%     +15.4%       2125 =C2=B1  5%  interrupts.CPU90.TL=
B:TLB_shootdowns
      1795 =C2=B1  4%     +21.1%       2174        interrupts.CPU91.TLB:TLB=
_shootdowns
      1804 =C2=B1  4%     +17.5%       2120        interrupts.CPU92.TLB:TLB=
_shootdowns
      1791 =C2=B1  5%     +23.8%       2218        interrupts.CPU93.TLB:TLB=
_shootdowns
      1874 =C2=B1  6%     +14.3%       2142 =C2=B1  3%  interrupts.CPU94.TL=
B:TLB_shootdowns
      5182 =C2=B1 29%    -100.0%       1.00        interrupts.CPU95.NMI:Non=
-maskable_interrupts
      5182 =C2=B1 29%    -100.0%       1.00        interrupts.CPU95.PMI:Per=
formance_monitoring_interrupts
      1841 =C2=B1  5%     +16.0%       2135 =C2=B1  4%  interrupts.CPU95.TL=
B:TLB_shootdowns
      1821 =C2=B1  4%     +15.8%       2109 =C2=B1  3%  interrupts.CPU96.TL=
B:TLB_shootdowns
      1789 =C2=B1  2%     +19.6%       2140        interrupts.CPU97.TLB:TLB=
_shootdowns
      1789 =C2=B1  4%     +22.3%       2188 =C2=B1  3%  interrupts.CPU98.TL=
B:TLB_shootdowns
      1797 =C2=B1  5%     +19.4%       2146 =C2=B1  3%  interrupts.CPU99.TL=
B:TLB_shootdowns
    101.25 =C2=B1 23%     +46.7%     148.50 =C2=B1  7%  interrupts.IWI:IRQ_=
work_interrupts
    401089 =C2=B1 11%     +20.2%     481954 =C2=B1  6%  interrupts.NMI:Non-=
maskable_interrupts
    401089 =C2=B1 11%     +20.2%     481954 =C2=B1  6%  interrupts.PMI:Perf=
ormance_monitoring_interrupts
    262999 =C2=B1  3%     +16.5%     306361 =C2=B1  3%  interrupts.TLB:TLB_=
shootdowns
      9.50 =C2=B1103%      -9.5        0.00        perf-profile.calltrace.c=
ycles-pp.sieve
      0.51 =C2=B1 60%      +0.3        0.81        perf-profile.calltrace.c=
ycles-pp.unmap_vmas.exit_mmap.mmput.do_exit.do_group_exit
      0.55 =C2=B1 61%      +0.3        0.89        perf-profile.calltrace.c=
ycles-pp.filemap_map_pages.__handle_mm_fault.handle_mm_fault.__do_page_faul=
t.do_page_fault
      0.32 =C2=B1100%      +0.4        0.68 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.tlb_finish_mmu.exit_mmap.mmput.do_exit.do_group_exit
      0.31 =C2=B1100%      +0.4        0.68 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.tlb_flush_mmu.tlb_finish_mmu.exit_mmap.mmput.do_exit
      1.00 =C2=B1 31%      +0.4        1.38 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.rwsem_down_write_slowpath.down_write.unlink_file_vma.free_pgt=
ables.unmap_region
      1.02 =C2=B1 31%      +0.4        1.41 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.unlink_file_vma.free_pgtables.unmap_region.__do_munmap.mmap_r=
egion
      1.02 =C2=B1 31%      +0.4        1.40 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.down_write.unlink_file_vma.free_pgtables.unmap_region.__do_mu=
nmap
      0.37 =C2=B1100%      +0.4        0.77 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.unmap_page_range.unmap_vmas.exit_mmap.mmput.do_exit
      0.14 =C2=B1173%      +0.4        0.54 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.release_pages.tlb_flush_mmu.tlb_finish_mmu.exit_mmap.mmput
      0.32 =C2=B1100%      +0.4        0.73 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.clear_page_erms.prep_new_page.get_page_from_freelist.__alloc_=
pages_nodemask.alloc_pages_vma
      0.14 =C2=B1173%      +0.4        0.55 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.release_pages.tlb_flush_mmu.tlb_finish_mmu.unmap_region.__do_=
munmap
      0.36 =C2=B1100%      +0.4        0.79        perf-profile.calltrace.c=
ycles-pp.native_flush_tlb_one_user.flush_tlb_func_common.flush_tlb_mm_range=
.tlb_flush_mmu.tlb_finish_mmu
      1.10 =C2=B1 31%      +0.4        1.52 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.free_pgtables.unmap_region.__do_munmap.mmap_region.do_mmap
      0.37 =C2=B1100%      +0.4        0.80        perf-profile.calltrace.c=
ycles-pp.flush_tlb_func_common.flush_tlb_mm_range.tlb_flush_mmu.tlb_finish_=
mmu.unmap_region
      0.34 =C2=B1100%      +0.4        0.77 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.prep_new_page.get_page_from_freelist.__alloc_pages_nodemask.a=
lloc_pages_vma.do_anonymous_page
      1.14 =C2=B1 31%      +0.4        1.58 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.unmap_region.__do_munmap.mmap_region.do_mmap.vm_mmap_pgoff
      0.61 =C2=B1 63%      +0.4        1.06 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_vma=
.do_anonymous_page.__handle_mm_fault
      0.35 =C2=B1100%      +0.4        0.79 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.rwsem_down_write_slowpath.down_write.__vma_adjust.__split_vma=
.__do_munmap
      0.38 =C2=B1100%      +0.4        0.83        perf-profile.calltrace.c=
ycles-pp.flush_tlb_mm_range.tlb_flush_mmu.tlb_finish_mmu.unmap_region.__do_=
munmap
      0.35 =C2=B1100%      +0.4        0.80 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.down_write.__vma_adjust.__split_vma.__do_munmap.mmap_region
      0.96 =C2=B1 38%      +0.5        1.44        perf-profile.calltrace.c=
ycles-pp.tlb_flush_mmu.tlb_finish_mmu.unmap_region.__do_munmap.__x64_sys_brk
      0.41 =C2=B1100%      +0.5        0.90 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.__split_vma.__do_munmap.mmap_region.do_mmap.vm_mmap_pgoff
      0.40 =C2=B1100%      +0.5        0.89 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.__vma_adjust.__split_vma.__do_munmap.mmap_region.do_mmap
      0.97 =C2=B1 39%      +0.5        1.46        perf-profile.calltrace.c=
ycles-pp.tlb_finish_mmu.unmap_region.__do_munmap.__x64_sys_brk.do_syscall_64
      0.79 =C2=B1 64%      +0.5        1.32        perf-profile.calltrace.c=
ycles-pp.prepare_exit_to_usermode.swapgs_restore_regs_and_return_to_usermode
      0.76 =C2=B1 63%      +0.5        1.31 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.__alloc_pages_nodemask.alloc_pages_vma.do_anonymous_page.__ha=
ndle_mm_fault.handle_mm_fault
      0.83 =C2=B1 63%      +0.6        1.43        perf-profile.calltrace.c=
ycles-pp.alloc_pages_vma.do_anonymous_page.__handle_mm_fault.handle_mm_faul=
t.__do_page_fault
      1.26 =C2=B1 38%      +0.6        1.90        perf-profile.calltrace.c=
ycles-pp.unmap_region.__do_munmap.__x64_sys_brk.do_syscall_64.entry_SYSCALL=
_64_after_hwframe
      0.93 =C2=B1 66%      +0.7        1.64        perf-profile.calltrace.c=
ycles-pp.do_brk_flags.__x64_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hw=
frame
      1.77 =C2=B1 31%      +0.7        2.50 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.__do_munmap.mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff
      1.98 =C2=B1 25%      +0.8        2.74        perf-profile.calltrace.c=
ycles-pp.do_anonymous_page.__handle_mm_fault.handle_mm_fault.__do_page_faul=
t.do_page_fault
      1.18 =C2=B1 67%      +0.9        2.09        perf-profile.calltrace.c=
ycles-pp.__do_munmap.__x64_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame
      3.50 =C2=B1 21%      +1.1        4.61        perf-profile.calltrace.c=
ycles-pp.__handle_mm_fault.handle_mm_fault.__do_page_fault.do_page_fault.pa=
ge_fault
      3.34 =C2=B1 34%      +1.5        4.86        perf-profile.calltrace.c=
ycles-pp.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      2.51 =C2=B1 49%      +1.6        4.06        perf-profile.calltrace.c=
ycles-pp.__x64_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.87 =C2=B1 35%      +1.8        5.63        perf-profile.calltrace.c=
ycles-pp.__do_page_fault.do_page_fault.page_fault
      4.00 =C2=B1 35%      +1.8        5.81        perf-profile.calltrace.c=
ycles-pp.do_page_fault.page_fault
      4.04 =C2=B1 35%      +1.8        5.87        perf-profile.calltrace.c=
ycles-pp.page_fault
      5.13 =C2=B1 31%      +2.0        7.17        perf-profile.calltrace.c=
ycles-pp.mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      5.16 =C2=B1 31%      +2.0        7.21        perf-profile.calltrace.c=
ycles-pp.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_=
64_after_hwframe
      5.18 =C2=B1 31%      +2.1        7.23        perf-profile.calltrace.c=
ycles-pp.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after=
_hwframe
      5.19 =C2=B1 31%      +2.1        7.25        perf-profile.calltrace.c=
ycles-pp.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.34 =C2=B1 30%      +2.1        7.41 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.unlink_file_vma.free_pgtables.exit_mmap.mmput.do_exit
      5.58 =C2=B1 30%      +2.1        7.73 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.free_pgtables.exit_mmap.mmput.do_exit.do_group_exit
      6.82 =C2=B1 29%      +2.5        9.36 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.mmput.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      6.81 =C2=B1 29%      +2.5        9.35 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.exit_mmap.mmput.do_exit.do_group_exit.__x64_sys_exit_group
      7.25 =C2=B1 28%      +2.7        9.93 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
      7.25 =C2=B1 28%      +2.7        9.93 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame
      7.25 =C2=B1 28%      +2.7        9.93 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.do_group_exit.__x64_sys_exit_group.do_syscall_64.entry_SYSCAL=
L_64_after_hwframe
      8.01 =C2=B1 33%      +3.3       11.32 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.copy_process._do_fork.do_syscall_64.entry_SYSCALL_64_after_hw=
frame
      8.12 =C2=B1 33%      +3.4       11.47 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp._do_fork.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.72 =C2=B1 34%      +3.4       12.12 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.osq_lock.rwsem_down_write_slowpath.down_write.dup_mm.copy_pro=
cess
      8.99 =C2=B1 33%      +3.5       12.52 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.rwsem_down_write_slowpath.down_write.dup_mm.copy_process._do_=
fork
      9.03 =C2=B1 33%      +3.5       12.58 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.down_write.dup_mm.copy_process._do_fork.do_syscall_64
     10.29 =C2=B1 33%      +4.0       14.31 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.dup_mm.copy_process._do_fork.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe
     33.92 =C2=B1 38%     +15.3       49.23        perf-profile.calltrace.c=
ycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
     33.96 =C2=B1 38%     +15.3       49.30        perf-profile.calltrace.c=
ycles-pp.entry_SYSCALL_64_after_hwframe
      9.51 =C2=B1103%      -9.5        0.00        perf-profile.children.cy=
cles-pp.sieve
      0.07 =C2=B1 19%      +0.0        0.09        perf-profile.children.cy=
cles-pp.strlcpy
      0.06 =C2=B1 20%      +0.0        0.08 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.__do_fault
      0.06 =C2=B1 20%      +0.0        0.08 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.__tlb_remove_page_size
      0.10 =C2=B1 12%      +0.0        0.12 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.__mod_lruvec_state
      0.07 =C2=B1 17%      +0.0        0.09 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.__list_add_valid
      0.07 =C2=B1 17%      +0.0        0.09        perf-profile.children.cy=
cles-pp.mem_cgroup_charge_statistics
      0.07 =C2=B1 20%      +0.0        0.10        perf-profile.children.cy=
cles-pp.__check_object_size
      0.04 =C2=B1 58%      +0.0        0.07        perf-profile.children.cy=
cles-pp.mem_cgroup_update_lru_size
      0.09 =C2=B1 24%      +0.0        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.down_read
      0.08 =C2=B1 19%      +0.0        0.11 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.strncpy_from_user
      0.11 =C2=B1 21%      +0.0        0.14 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.new_sync_read
      0.08 =C2=B1 22%      +0.0        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.finish_task_switch
      0.08 =C2=B1 21%      +0.0        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.down_write_killable
      0.07 =C2=B1 20%      +0.0        0.10 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.do_notify_parent
      0.08 =C2=B1 23%      +0.0        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.try_charge
      0.09 =C2=B1 20%      +0.0        0.12 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.__fxstat64
      0.08 =C2=B1 23%      +0.0        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.mem_cgroup_uncharge_list
      0.07 =C2=B1 26%      +0.0        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.find_get_entry
      0.05 =C2=B1 60%      +0.0        0.08        perf-profile.children.cy=
cles-pp.free_pgd_range
      0.08 =C2=B1 26%      +0.0        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.__count_memcg_events
      0.05 =C2=B1 61%      +0.0        0.08 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.d_alloc_parallel
      0.03 =C2=B1100%      +0.0        0.06        perf-profile.children.cy=
cles-pp.inode_permission
      0.03 =C2=B1100%      +0.0        0.06        perf-profile.children.cy=
cles-pp.move_queued_task
      0.11 =C2=B1 15%      +0.0        0.14 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.free_pcppages_bulk
      0.11 =C2=B1 20%      +0.0        0.15 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.page_add_file_rmap
      0.10 =C2=B1 25%      +0.0        0.14 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.memcpy_erms
      0.10 =C2=B1 28%      +0.0        0.13 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.stack_trace_save_tsk
      0.04 =C2=B1 59%      +0.0        0.08        perf-profile.children.cy=
cles-pp.shift_arg_pages
      0.10 =C2=B1 23%      +0.0        0.14 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.arch_get_unmapped_area_topdown
      0.11 =C2=B1 22%      +0.0        0.15 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.do_open_execat
      0.10 =C2=B1 23%      +0.0        0.14 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.sched_ttwu_pending
      0.03 =C2=B1100%      +0.0        0.07 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.free_p4d_range
      0.03 =C2=B1100%      +0.0        0.07 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.__update_load_avg_se
      0.12 =C2=B1 27%      +0.0        0.15 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.dequeue_task_fair
      0.12 =C2=B1 26%      +0.0        0.16 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.dput
      0.11 =C2=B1 28%      +0.0        0.15 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.__d_lookup_rcu
      0.10 =C2=B1 25%      +0.0        0.14        perf-profile.children.cy=
cles-pp.time
      0.10 =C2=B1 17%      +0.0        0.14 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.__x64_sys_munmap
      0.06 =C2=B1 58%      +0.0        0.10        perf-profile.children.cy=
cles-pp.cap_vm_enough_memory
      0.11 =C2=B1 28%      +0.0        0.15 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.__account_scheduler_latency
      0.11 =C2=B1 23%      +0.0        0.15        perf-profile.children.cy=
cles-pp.__might_sleep
      0.07 =C2=B1 24%      +0.0        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.lookup_slow
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.__ctype_init
      0.09 =C2=B1 29%      +0.0        0.13        perf-profile.children.cy=
cles-pp.setup_arg_pages
      0.03 =C2=B1100%      +0.0        0.08 =C2=B1  6%  perf-profile.childr=
en.cycles-pp._IO_file_open
      0.12 =C2=B1 24%      +0.0        0.17 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.do_task_dead
      0.10 =C2=B1 23%      +0.0        0.15        perf-profile.children.cy=
cles-pp.__rb_insert_augmented
      0.05 =C2=B1 62%      +0.0        0.10        perf-profile.children.cy=
cles-pp.__lookup_slow
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.__wake_up_common_lock
      0.01 =C2=B1173%      +0.0        0.06        perf-profile.children.cy=
cles-pp.khugepaged_enter_vma_merge
      0.15 =C2=B1 21%      +0.0        0.20        perf-profile.children.cy=
cles-pp.copy_user_highpage
      0.15 =C2=B1 21%      +0.0        0.20        perf-profile.children.cy=
cles-pp.copy_page
      0.03 =C2=B1100%      +0.0        0.08 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.__wake_up_common
      0.11 =C2=B1 25%      +0.0        0.15 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.refcount_dec_not_one
      0.04 =C2=B1100%      +0.0        0.08 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.rcu_all_qs
      0.05 =C2=B1 61%      +0.1        0.10 =C2=B1 19%  perf-profile.childr=
en.cycles-pp.__vma_link_rb
      0.00            +0.1        0.05        perf-profile.children.cycles-=
pp.filemap_fault
      0.00            +0.1        0.05        perf-profile.children.cycles-=
pp.mark_page_accessed
      0.00            +0.1        0.05        perf-profile.children.cycles-=
pp._exit
      0.00            +0.1        0.05        perf-profile.children.cycles-=
pp.memmem
      0.00            +0.1        0.05        perf-profile.children.cycles-=
pp.perf_exclude_event
      0.14 =C2=B1 27%      +0.1        0.19 =C2=B1  5%  perf-profile.childr=
en.cycles-pp._cond_resched
      0.14 =C2=B1 26%      +0.1        0.20 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.selinux_inode_permission
      0.09 =C2=B1 31%      +0.1        0.15 =C2=B1 31%  perf-profile.childr=
en.cycles-pp.__generic_file_write_iter
      0.01 =C2=B1173%      +0.1        0.07 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.__slab_alloc
      0.15 =C2=B1 24%      +0.1        0.20 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.update_curr
      0.10 =C2=B1 29%      +0.1        0.15 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.free_uid
      0.10 =C2=B1 29%      +0.1        0.15 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.refcount_dec_and_lock_irqsave
      0.14 =C2=B1 26%      +0.1        0.20 =C2=B1 23%  perf-profile.childr=
en.cycles-pp.new_sync_write
      0.10 =C2=B1 32%      +0.1        0.15 =C2=B1 29%  perf-profile.childr=
en.cycles-pp.generic_file_write_iter
      0.00            +0.1        0.06 =C2=B1  9%  perf-profile.children.cy=
cles-pp.__mod_zone_page_state
      0.00            +0.1        0.06 =C2=B1  9%  perf-profile.children.cy=
cles-pp.___slab_alloc
      0.00            +0.1        0.06 =C2=B1  9%  perf-profile.children.cy=
cles-pp.uncharge_batch
      0.16 =C2=B1 27%      +0.1        0.22 =C2=B1 20%  perf-profile.childr=
en.cycles-pp.vfs_write
      0.14 =C2=B1 23%      +0.1        0.20        perf-profile.children.cy=
cles-pp.do_faccessat
      0.13 =C2=B1 25%      +0.1        0.19        perf-profile.children.cy=
cles-pp.remove_vma
      0.12 =C2=B1 24%      +0.1        0.18        perf-profile.children.cy=
cles-pp.strnlen_user
      0.12 =C2=B1 22%      +0.1        0.17 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.mem_cgroup_commit_charge
      0.15 =C2=B1 29%      +0.1        0.21 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.security_inode_permission
      0.16 =C2=B1 29%      +0.1        0.21 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.anon_vma_interval_tree_insert
      0.17 =C2=B1 28%      +0.1        0.23 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.__clear_user
      0.15 =C2=B1 27%      +0.1        0.21 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.wake_up_new_task
      0.12 =C2=B1 22%      +0.1        0.18 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.anon_vma_interval_tree_remove
      0.00            +0.1        0.06        perf-profile.children.cycles-=
pp.unmap_single_vma
      0.17 =C2=B1 26%      +0.1        0.23        perf-profile.children.cy=
cles-pp.lookup_fast
      0.16 =C2=B1 27%      +0.1        0.22 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.sched_exec
      0.12 =C2=B1 24%      +0.1        0.18 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.perf_event_mmap_output
      0.16 =C2=B1 25%      +0.1        0.23 =C2=B1 20%  perf-profile.childr=
en.cycles-pp.ksys_write
      0.20 =C2=B1 26%      +0.1        0.26        perf-profile.children.cy=
cles-pp.free_pages_and_swap_cache
      0.20 =C2=B1 16%      +0.1        0.27 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.lru_add_drain_cpu
      0.20 =C2=B1 16%      +0.1        0.27 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.lru_add_drain
      0.24 =C2=B1 19%      +0.1        0.31 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.free_unref_page_list
      0.20 =C2=B1 29%      +0.1        0.27        perf-profile.children.cy=
cles-pp.enqueue_entity
      0.18 =C2=B1 25%      +0.1        0.25        perf-profile.children.cy=
cles-pp.___might_sleep
      0.25 =C2=B1 20%      +0.1        0.33 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.get_unmapped_area
      0.21 =C2=B1 28%      +0.1        0.30 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.kmem_cache_alloc
      0.23 =C2=B1 29%      +0.1        0.31 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.enqueue_task_fair
      0.19 =C2=B1 31%      +0.1        0.28 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.smpboot_thread_fn
      0.31 =C2=B1 20%      +0.1        0.41 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.wp_page_copy
      0.23 =C2=B1 24%      +0.1        0.33        perf-profile.children.cy=
cles-pp.alloc_set_pte
      0.29 =C2=B1 28%      +0.1        0.39        perf-profile.children.cy=
cles-pp.mmap64
      0.25 =C2=B1 24%      +0.1        0.35        perf-profile.children.cy=
cles-pp.walk_component
      0.31 =C2=B1 25%      +0.1        0.42 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.find_vma
      0.34 =C2=B1 23%      +0.1        0.45        perf-profile.children.cy=
cles-pp.link_path_walk
      0.17 =C2=B1 25%      +0.1        0.28 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.put_cred_rcu
      0.31 =C2=B1 30%      +0.1        0.42 =C2=B1  4%  perf-profile.childr=
en.cycles-pp._dl_addr
      0.29 =C2=B1 25%      +0.1        0.41 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.select_task_rq_fair
      0.30 =C2=B1 26%      +0.1        0.42 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.copy_strings
      0.39 =C2=B1 18%      +0.1        0.50 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.do_wp_page
      0.31 =C2=B1 19%      +0.1        0.42 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.__pagevec_lru_add_fn
      0.31 =C2=B1 23%      +0.1        0.43 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.perf_iterate_sb
      0.36 =C2=B1 21%      +0.1        0.48 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.iterate_supers
      0.46 =C2=B1 19%      +0.1        0.58 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.entry_SYSCALL_64
      0.38 =C2=B1 22%      +0.1        0.50 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.__x64_sys_sync
      0.38 =C2=B1 22%      +0.1        0.50 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.ksys_sync
      0.39 =C2=B1 17%      +0.1        0.52 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.__lru_cache_add
      0.38 =C2=B1 23%      +0.1        0.51 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.sync
      0.35 =C2=B1 29%      +0.1        0.49 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.vma_interval_tree_insert
      0.47 =C2=B1 22%      +0.1        0.61 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.syscall_return_via_sysret
      0.36 =C2=B1 21%      +0.1        0.51 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.vma_merge
      0.33 =C2=B1 27%      +0.2        0.48 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.rcu_core
      0.43 =C2=B1 27%      +0.2        0.58        perf-profile.children.cy=
cles-pp.copy_p4d_range
      0.44 =C2=B1 28%      +0.2        0.60        perf-profile.children.cy=
cles-pp.copy_page_range
      0.54 =C2=B1 15%      +0.2        0.71        perf-profile.children.cy=
cles-pp.pagevec_lru_move_fn
      0.57 =C2=B1 22%      +0.2        0.77        perf-profile.children.cy=
cles-pp.perf_event_mmap
      0.61 =C2=B1 27%      +0.2        0.81 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.load_balance
      0.68 =C2=B1 21%      +0.2        0.89        perf-profile.children.cy=
cles-pp.native_flush_tlb_one_user
      0.57 =C2=B1 29%      +0.2        0.78 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.rwsem_spin_on_owner
      0.70 =C2=B1 20%      +0.2        0.92        perf-profile.children.cy=
cles-pp.flush_tlb_func_common
      0.76 =C2=B1 20%      +0.2        1.00 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.flush_tlb_mm_range
      0.64 =C2=B1 27%      +0.2        0.89 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.pick_next_task_fair
      0.60 =C2=B1 26%      +0.3        0.85 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.do_sys_open
      0.79 =C2=B1 20%      +0.3        1.06 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.clear_page_erms
      0.63 =C2=B1 26%      +0.3        0.89 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.do_filp_open
      0.62 =C2=B1 27%      +0.3        0.88 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.path_openat
      0.68 =C2=B1 27%      +0.3        0.95 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.schedule
      0.79 =C2=B1 25%      +0.3        1.06 =C2=B1  4%  perf-profile.childr=
en.cycles-pp._raw_spin_lock_irqsave
      0.84 =C2=B1 20%      +0.3        1.11 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.prep_new_page
      0.77 =C2=B1 33%      +0.3        1.08 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.rwsem_wake
      1.09 =C2=B1 22%      +0.3        1.40        perf-profile.children.cy=
cles-pp.prepare_exit_to_usermode
      1.15 =C2=B1 20%      +0.3        1.46        perf-profile.children.cy=
cles-pp.release_pages
      0.70 =C2=B1 32%      +0.3        1.05 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.wake_up_q
      0.94 =C2=B1 27%      +0.4        1.29 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.__schedule
      1.22 =C2=B1 19%      +0.4        1.57        perf-profile.children.cy=
cles-pp.alloc_pages_vma
      1.22 =C2=B1 21%      +0.4        1.59 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.get_page_from_freelist
      0.76 =C2=B1 31%      +0.4        1.13 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.try_to_wake_up
      1.29 =C2=B1 20%      +0.4        1.69        perf-profile.children.cy=
cles-pp.do_brk_flags
      1.19 =C2=B1 26%      +0.4        1.60        perf-profile.children.cy=
cles-pp.filemap_map_pages
      1.46 =C2=B1 21%      +0.4        1.91 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.__alloc_pages_nodemask
      1.27 =C2=B1 24%      +0.4        1.71        perf-profile.children.cy=
cles-pp.unmap_page_range
      1.33 =C2=B1 24%      +0.5        1.81        perf-profile.children.cy=
cles-pp.unmap_vmas
      1.98 =C2=B1 21%      +0.6        2.54        perf-profile.children.cy=
cles-pp.tlb_finish_mmu
      1.95 =C2=B1 21%      +0.6        2.52        perf-profile.children.cy=
cles-pp.tlb_flush_mmu
      2.19 =C2=B1 19%      +0.7        2.85        perf-profile.children.cy=
cles-pp.do_anonymous_page
      2.88 =C2=B1 24%      +0.9        3.78 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.unmap_region
      3.15 =C2=B1 20%      +1.0        4.11        perf-profile.children.cy=
cles-pp.__x64_sys_brk
      3.91 =C2=B1 25%      +1.3        5.20 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.__do_munmap
      4.39 =C2=B1 21%      +1.4        5.79        perf-profile.children.cy=
cles-pp.__handle_mm_fault
      4.61 =C2=B1 21%      +1.5        6.08        perf-profile.children.cy=
cles-pp.handle_mm_fault
      4.53 =C2=B1 31%      +1.5        6.04 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.__vma_adjust
      5.54 =C2=B1 19%      +1.6        7.16        perf-profile.children.cy=
cles-pp.page_fault
      5.20 =C2=B1 22%      +1.6        6.85        perf-profile.children.cy=
cles-pp.__do_page_fault
      5.35 =C2=B1 22%      +1.7        7.04        perf-profile.children.cy=
cles-pp.do_page_fault
      5.42 =C2=B1 31%      +2.2        7.58        perf-profile.children.cy=
cles-pp.ksys_mmap_pgoff
      7.28 =C2=B1 28%      +2.7        9.98 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.__x64_sys_exit_group
      7.28 =C2=B1 28%      +2.7        9.98 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.do_group_exit
      7.28 =C2=B1 28%      +2.7        9.98 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.do_exit
     10.30 =C2=B1 33%      +4.0       14.31 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.dup_mm
     10.75 =C2=B1 33%      +4.1       14.87 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.copy_process
     10.93 =C2=B1 33%      +4.2       15.12 =C2=B1  2%  perf-profile.childr=
en.cycles-pp._do_fork
     29.33 =C2=B1 31%      +9.7       39.08        perf-profile.children.cy=
cles-pp.rwsem_down_write_slowpath
     29.57 =C2=B1 31%      +9.9       39.42        perf-profile.children.cy=
cles-pp.down_write
     45.34 =C2=B1 29%     +15.0       60.32        perf-profile.children.cy=
cles-pp.do_syscall_64
     45.39 =C2=B1 29%     +15.0       60.38        perf-profile.children.cy=
cles-pp.entry_SYSCALL_64_after_hwframe
      9.39 =C2=B1103%      -9.4        0.00        perf-profile.self.cycles=
-pp.sieve
      0.08 =C2=B1 19%      +0.0        0.10 =C2=B1 10%  perf-profile.self.c=
ycles-pp.sync_regs
      0.09 =C2=B1 21%      +0.0        0.11 =C2=B1  4%  perf-profile.self.c=
ycles-pp.page_add_file_rmap
      0.08 =C2=B1 19%      +0.0        0.11 =C2=B1  4%  perf-profile.self.c=
ycles-pp.unlock_page
      0.08 =C2=B1 16%      +0.0        0.11 =C2=B1  4%  perf-profile.self.c=
ycles-pp.do_brk_flags
      0.05 =C2=B1 58%      +0.0        0.08 =C2=B1  6%  perf-profile.self.c=
ycles-pp.__mod_memcg_state
      0.07 =C2=B1 23%      +0.0        0.10 =C2=B1  5%  perf-profile.self.c=
ycles-pp.unlink_anon_vmas
      0.08 =C2=B1 24%      +0.0        0.11        perf-profile.self.cycles=
-pp.__count_memcg_events
      0.08 =C2=B1 24%      +0.0        0.11 =C2=B1  9%  perf-profile.self.c=
ycles-pp.perf_event_mmap_output
      0.09 =C2=B1 20%      +0.0        0.12 =C2=B1  4%  perf-profile.self.c=
ycles-pp.update_curr
      0.10 =C2=B1 23%      +0.0        0.13 =C2=B1  7%  perf-profile.self.c=
ycles-pp.memcpy_erms
      0.05 =C2=B1 60%      +0.0        0.08 =C2=B1  5%  perf-profile.self.c=
ycles-pp.free_pcppages_bulk
      0.09 =C2=B1 29%      +0.0        0.12 =C2=B1 12%  perf-profile.self.c=
ycles-pp.vma_compute_subtree_gap
      0.03 =C2=B1100%      +0.0        0.07 =C2=B1  7%  perf-profile.self.c=
ycles-pp.rcu_all_qs
      0.10 =C2=B1 27%      +0.0        0.14        perf-profile.self.cycles=
-pp.__might_sleep
      0.03 =C2=B1100%      +0.0        0.07        perf-profile.self.cycles=
-pp.dup_mm
      0.13 =C2=B1 26%      +0.0        0.17 =C2=B1  5%  perf-profile.self.c=
ycles-pp.vma_interval_tree_remove
      0.04 =C2=B1 58%      +0.0        0.08 =C2=B1  5%  perf-profile.self.c=
ycles-pp._raw_spin_lock_irq
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1  9%  perf-profile.self.c=
ycles-pp.down_write_killable
      0.09 =C2=B1 25%      +0.0        0.14 =C2=B1  3%  perf-profile.self.c=
ycles-pp.strnlen_user
      0.09 =C2=B1 22%      +0.0        0.14 =C2=B1  3%  perf-profile.self.c=
ycles-pp.__rb_insert_augmented
      0.16 =C2=B1 18%      +0.0        0.21 =C2=B1  2%  perf-profile.self.c=
ycles-pp.perf_iterate_sb
      0.14 =C2=B1 23%      +0.0        0.18 =C2=B1  2%  perf-profile.self.c=
ycles-pp.perf_event_mmap
      0.15 =C2=B1 20%      +0.0        0.20 =C2=B1  2%  perf-profile.self.c=
ycles-pp.copy_page
      0.19 =C2=B1 20%      +0.0        0.24 =C2=B1  4%  perf-profile.self.c=
ycles-pp.__list_del_entry_valid
      0.05 =C2=B1 62%      +0.0        0.10 =C2=B1  5%  perf-profile.self.c=
ycles-pp.put_cred_rcu
      0.13 =C2=B1 18%      +0.0        0.18        perf-profile.self.cycles=
-pp.__vma_adjust
      0.11 =C2=B1 25%      +0.0        0.15 =C2=B1  3%  perf-profile.self.c=
ycles-pp.refcount_dec_not_one
      0.00            +0.1        0.05        perf-profile.self.cycles-pp._=
__slab_alloc
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.p=
md_devmap_trans_unstable
      0.00            +0.1        0.05        perf-profile.self.cycles-pp._=
vm_normal_page
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.m=
ark_page_accessed
      0.11 =C2=B1 24%      +0.1        0.16 =C2=B1  9%  perf-profile.self.c=
ycles-pp.anon_vma_interval_tree_remove
      0.20 =C2=B1 20%      +0.1        0.25 =C2=B1  4%  perf-profile.self.c=
ycles-pp.ftrace_syscall_enter
      0.15 =C2=B1 23%      +0.1        0.20        perf-profile.self.cycles=
-pp.find_vma
      0.15 =C2=B1 25%      +0.1        0.21 =C2=B1  2%  perf-profile.self.c=
ycles-pp.__slab_free
      0.12 =C2=B1 17%      +0.1        0.17 =C2=B1  2%  perf-profile.self.c=
ycles-pp.handle_mm_fault
      0.00            +0.1        0.06 =C2=B1  9%  perf-profile.self.cycles=
-pp.__mod_zone_page_state
      0.17 =C2=B1 20%      +0.1        0.23 =C2=B1  2%  perf-profile.self.c=
ycles-pp.__do_page_fault
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.u=
nmap_single_vma
      0.15 =C2=B1 31%      +0.1        0.21 =C2=B1  2%  perf-profile.self.c=
ycles-pp.anon_vma_interval_tree_insert
      0.19 =C2=B1 20%      +0.1        0.26        perf-profile.self.cycles=
-pp.__pagevec_lru_add_fn
      0.17 =C2=B1 26%      +0.1        0.24        perf-profile.self.cycles=
-pp.___might_sleep
      0.18 =C2=B1 24%      +0.1        0.25        perf-profile.self.cycles=
-pp.down_write
      0.13 =C2=B1 28%      +0.1        0.20 =C2=B1  4%  perf-profile.self.c=
ycles-pp.try_to_wake_up
      0.21 =C2=B1 25%      +0.1        0.29        perf-profile.self.cycles=
-pp.select_task_rq_fair
      0.23 =C2=B1 27%      +0.1        0.33        perf-profile.self.cycles=
-pp.copy_p4d_range
      0.28 =C2=B1 19%      +0.1        0.38        perf-profile.self.cycles=
-pp.__handle_mm_fault
      0.29 =C2=B1 30%      +0.1        0.41 =C2=B1  3%  perf-profile.self.c=
ycles-pp._dl_addr
      0.35 =C2=B1 29%      +0.1        0.48 =C2=B1  2%  perf-profile.self.c=
ycles-pp.vma_interval_tree_insert
      0.45 =C2=B1 21%      +0.1        0.57 =C2=B1  6%  perf-profile.self.c=
ycles-pp.entry_SYSCALL_64
      0.37 =C2=B1 23%      +0.1        0.51        perf-profile.self.cycles=
-pp._raw_spin_lock
      0.37 =C2=B1 27%      +0.1        0.51 =C2=B1  8%  perf-profile.self.c=
ycles-pp.update_sd_lb_stats
      0.47 =C2=B1 22%      +0.1        0.61 =C2=B1  4%  perf-profile.self.c=
ycles-pp.syscall_return_via_sysret
      0.45 =C2=B1 28%      +0.2        0.62 =C2=B1  3%  perf-profile.self.c=
ycles-pp.rwsem_spin_on_owner
      0.55 =C2=B1 23%      +0.2        0.73        perf-profile.self.cycles=
-pp.release_pages
      0.68 =C2=B1 21%      +0.2        0.89        perf-profile.self.cycles=
-pp.native_flush_tlb_one_user
      0.79 =C2=B1 21%      +0.3        1.04 =C2=B1  3%  perf-profile.self.c=
ycles-pp.clear_page_erms
      0.72 =C2=B1 30%      +0.3        0.98 =C2=B1  3%  perf-profile.self.c=
ycles-pp.rwsem_down_write_slowpath
      0.70 =C2=B1 26%      +0.3        0.97        perf-profile.self.cycles=
-pp.unmap_page_range
      0.82 =C2=B1 27%      +0.3        1.10        perf-profile.self.cycles=
-pp.filemap_map_pages
      1.04 =C2=B1 22%      +0.3        1.35        perf-profile.self.cycles=
-pp.prepare_exit_to_usermode
      1.28 =C2=B1 22%      +0.4        1.67        perf-profile.self.cycles=
-pp.do_syscall_64



***************************************************************************=
************************
lkp-ivb-ep01: 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00GHz with 384=
G memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/fs/kconfig/load/md/rootfs/tbox_group/test/te=
stcase:
  gcc-7/performance/4BRD_12G/ext4/x86_64-rhel-7.6/3000/RAID1/debian-x86_64-=
2019-05-14.cgz/lkp-ivb-ep01/disk_src/aim7

commit: =

  4f23dbc1e6 ("locking/rwsem: Implement lock handoff to prevent lock starva=
tion")
  00f3c5a3df ("locking/rwsem: Always release wait_lock before waking up tas=
ks")

4f23dbc1e657951e 00f3c5a3df2c1e3dab14d0dd2b7 =

---------------- --------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :4           25%           1:2     dmesg.WARNING:at#for_ip_inter=
rupt_entry/0x
          2:4          -50%            :2     dmesg.WARNING:at#for_ip_swapg=
s_restore_regs_and_return_to_usermode/0x
         %stddev     %change         %stddev
             \          |                \  =

      2930 =C2=B1  2%      -4.4%       2802        aim7.time.maximum_reside=
nt_set_size
    309.25 =C2=B1173%    +304.2%       1250        meminfo.Mlocked
      0.03 =C2=B1 31%      +0.0        0.04 =C2=B1 25%  mpstat.cpu.all.iowa=
it%
      2.54 =C2=B1 76%      -2.0        0.53 =C2=B1  5%  turbostat.C1%
   1468703 =C2=B1 75%    +176.4%    4059526 =C2=B1 62%  turbostat.C3
      5.75 =C2=B1 93%      +8.9       14.62 =C2=B1 72%  turbostat.C3%
 4.132e+08 =C2=B1 95%    +160.6%  1.077e+09 =C2=B1 71%  cpuidle.C3.time
   1469107 =C2=B1 75%    +176.4%    4059905 =C2=B1 62%  cpuidle.C3.usage
    106863 =C2=B1  3%     +13.0%     120776        cpuidle.POLL.time
      6635 =C2=B1  5%     +12.3%       7451 =C2=B1  4%  cpuidle.POLL.usage
    109506            +1.1%     110712        proc-vmstat.nr_active_anon
    107428            +1.0%     108475        proc-vmstat.nr_anon_pages
     77.25 =C2=B1173%    +303.9%     312.00        proc-vmstat.nr_mlock
    109506            +1.1%     110712        proc-vmstat.nr_zone_active_an=
on
      1778 =C2=B1  5%     -79.3%     368.50 =C2=B1 50%  numa-meminfo.node0.=
Active(file)
    356.25 =C2=B1 26%    +399.8%       1780 =C2=B1  9%  numa-meminfo.node1.=
Active(file)
     55033 =C2=B1 37%     +93.4%     106429 =C2=B1 15%  numa-meminfo.node1.=
AnonHugePages
    214912 =C2=B1 14%     +15.9%     249074 =C2=B1  7%  numa-meminfo.node1.=
AnonPages
   1237733 =C2=B1 12%     +52.8%    1890859 =C2=B1 29%  numa-meminfo.node1.=
MemUsed
      5280 =C2=B1 15%     +16.2%       6133 =C2=B1 10%  slabinfo.dmaengine-=
unmap-16.active_objs
      5283 =C2=B1 15%     +16.2%       6140 =C2=B1 10%  slabinfo.dmaengine-=
unmap-16.num_objs
     20271 =C2=B1  6%      +8.8%      22058 =C2=B1  2%  slabinfo.kmalloc-32=
.active_objs
    191.25 =C2=B1 35%     +49.0%     285.00 =C2=B1 10%  slabinfo.request_qu=
eue.num_objs
      1732 =C2=B1 10%     +19.2%       2064        slabinfo.skbuff_head_cac=
he.active_objs
      1840 =C2=B1 10%     +19.1%       2192        slabinfo.skbuff_head_cac=
he.num_objs
      0.75 =C2=B1  3%      -0.1        0.65 =C2=B1  3%  perf-stat.i.dTLB-lo=
ad-miss-rate%
  17735473 =C2=B1 11%     -19.1%   14349602 =C2=B1  4%  perf-stat.i.dTLB-lo=
ad-misses
      0.19 =C2=B1  4%      -0.0        0.15 =C2=B1  3%  perf-stat.i.dTLB-st=
ore-miss-rate%
   1897982 =C2=B1  4%     -20.9%    1500903 =C2=B1  3%  perf-stat.i.dTLB-st=
ore-misses
   2188000 =C2=B1  3%      -4.4%    2091270        perf-stat.i.iTLB-load-mi=
sses
      0.74 =C2=B1  3%      -0.1        0.64 =C2=B1  4%  perf-stat.overall.d=
TLB-load-miss-rate%
      0.19 =C2=B1  5%      -0.0        0.15 =C2=B1  3%  perf-stat.overall.d=
TLB-store-miss-rate%
  17630676 =C2=B1 11%     -19.1%   14270976 =C2=B1  4%  perf-stat.ps.dTLB-l=
oad-misses
   1886940 =C2=B1  4%     -20.9%    1492696 =C2=B1  3%  perf-stat.ps.dTLB-s=
tore-misses
    434.30 =C2=B1 16%     +31.3%     570.43 =C2=B1  6%  sched_debug.cfs_rq:=
/.exec_clock.stddev
     20136 =C2=B1  5%     +17.9%      23747 =C2=B1  7%  sched_debug.cfs_rq:=
/.load.avg
      2.00 =C2=B1 40%     +75.0%       3.50 =C2=B1  7%  sched_debug.cfs_rq:=
/.load_avg.min
      0.31 =C2=B1 12%     +14.2%       0.36 =C2=B1  8%  sched_debug.cfs_rq:=
/.nr_running.avg
      2.06 =C2=B1  5%     +33.3%       2.75 =C2=B1  9%  sched_debug.cfs_rq:=
/.nr_spread_over.max
      7.64 =C2=B1  8%     +11.2%       8.50 =C2=B1  5%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
    142834 =C2=B1 14%     +14.9%     164118 =C2=B1  4%  sched_debug.cfs_rq:=
/.spread0.max
    151.79 =C2=B1 18%     +21.5%     184.50 =C2=B1  5%  sched_debug.cfs_rq:=
/.util_avg.min
      9.16 =C2=B1  4%     -11.3%       8.12 =C2=B1  2%  sched_debug.cpu.cpu=
_load[1].avg
      2364 =C2=B1 10%     +25.7%       2971 =C2=B1  9%  sched_debug.cpu.nr_=
switches.stddev
     -0.23         -5554.5%      12.50 =C2=B1 20%  sched_debug.cpu.nr_unint=
erruptible.min
    126.66 =C2=B1 16%     +17.4%     148.73        sched_debug.cpu.ttwu_loc=
al.stddev
    176.50 =C2=B1 61%     +46.2%     258.00 =C2=B1 46%  interrupts.42:IR-PC=
I-MSI.524292-edge.eth0-TxRx-3
    135.50 =C2=B1 26%     +60.5%     217.50 =C2=B1  5%  interrupts.43:IR-PC=
I-MSI.524293-edge.eth0-TxRx-4
    784.00 =C2=B1 86%     -85.9%     110.50 =C2=B1  2%  interrupts.45:IR-PC=
I-MSI.524295-edge.eth0-TxRx-6
    319.50 =C2=B1 45%     -68.7%     100.00 =C2=B1  5%  interrupts.46:IR-PC=
I-MSI.524296-edge.eth0-TxRx-7
      2847 =C2=B1 12%     +18.4%       3371 =C2=B1  5%  interrupts.CPU0.RES=
:Rescheduling_interrupts
      1236 =C2=B1  3%    -100.0%       0.00        interrupts.CPU12.10:IR-I=
O-APIC.10-edge.ipmi_si
      2600 =C2=B1  2%     +10.0%       2861 =C2=B1  3%  interrupts.CPU18.RE=
S:Rescheduling_interrupts
    477.75 =C2=B1 96%    +108.3%     995.00 =C2=B1  9%  interrupts.CPU21.NM=
I:Non-maskable_interrupts
    477.75 =C2=B1 96%    +108.3%     995.00 =C2=B1  9%  interrupts.CPU21.PM=
I:Performance_monitoring_interrupts
    176.50 =C2=B1 61%     +46.2%     258.00 =C2=B1 46%  interrupts.CPU36.42=
:IR-PCI-MSI.524292-edge.eth0-TxRx-3
    135.50 =C2=B1 26%     +60.5%     217.50 =C2=B1  5%  interrupts.CPU38.43=
:IR-PCI-MSI.524293-edge.eth0-TxRx-4
    784.00 =C2=B1 86%     -85.9%     110.50 =C2=B1  2%  interrupts.CPU4.45:=
IR-PCI-MSI.524295-edge.eth0-TxRx-6
    319.50 =C2=B1 45%     -68.7%     100.00 =C2=B1  5%  interrupts.CPU6.46:=
IR-PCI-MSI.524296-edge.eth0-TxRx-7
    444.50 =C2=B1  5%     -79.3%      92.00 =C2=B1 50%  numa-vmstat.node0.n=
r_active_file
     17870           -97.4%     462.00 =C2=B1 40%  numa-vmstat.node0.nr_dir=
tied
     44.50 =C2=B1173%    +250.6%     156.00 =C2=B1 16%  numa-vmstat.node0.n=
r_mlock
     17843           -97.6%     432.50 =C2=B1 41%  numa-vmstat.node0.nr_wri=
tten
    444.50 =C2=B1  5%     -79.3%      92.00 =C2=B1 50%  numa-vmstat.node0.n=
r_zone_active_file
    831590 =C2=B1  3%     -33.4%     553775 =C2=B1 22%  numa-vmstat.node0.n=
uma_hit
    819665 =C2=B1  4%     -39.6%     494911 =C2=B1 15%  numa-vmstat.node0.n=
uma_local
     11924 =C2=B1108%    +393.6%      58863 =C2=B1 77%  numa-vmstat.node0.n=
uma_other
     88.75 =C2=B1 26%    +400.8%     444.50 =C2=B1  9%  numa-vmstat.node1.n=
r_active_file
     53723 =C2=B1 14%     +15.9%      62267 =C2=B1  7%  numa-vmstat.node1.n=
r_anon_pages
    694.50 =C2=B1 28%   +2499.2%      18051        numa-vmstat.node1.nr_dir=
tied
     32.75 =C2=B1173%    +374.8%     155.50 =C2=B1 15%  numa-vmstat.node1.n=
r_mlock
    665.75 =C2=B1 29%   +2605.9%      18014        numa-vmstat.node1.nr_wri=
tten
     88.75 =C2=B1 26%    +400.8%     444.50 =C2=B1  9%  numa-vmstat.node1.n=
r_zone_active_file
    510127 =C2=B1  7%     +55.2%     791681 =C2=B1 15%  numa-vmstat.node1.n=
uma_hit
    343005 =C2=B1 12%     +95.7%     671266 =C2=B1 11%  numa-vmstat.node1.n=
uma_local
     52986            +7.8%      57135 =C2=B1  2%  softirqs.CPU0.RCU
     54275            +8.0%      58613 =C2=B1  4%  softirqs.CPU1.RCU
     28664 =C2=B1  3%     +10.6%      31701 =C2=B1  2%  softirqs.CPU1.SCHED
     74527 =C2=B1  5%     -17.7%      61372 =C2=B1  4%  softirqs.CPU1.TIMER
     52906           +11.4%      58960        softirqs.CPU11.RCU
     52231           +12.0%      58488 =C2=B1  6%  softirqs.CPU13.RCU
     28678 =C2=B1  3%      +9.8%      31491 =C2=B1  4%  softirqs.CPU13.SCHED
     52884 =C2=B1  2%     +11.4%      58899        softirqs.CPU18.RCU
     52822            +9.9%      58040 =C2=B1  2%  softirqs.CPU19.RCU
     52881 =C2=B1  2%      +9.9%      58100 =C2=B1  4%  softirqs.CPU2.RCU
     52515 =C2=B1  2%      +9.2%      57356 =C2=B1  2%  softirqs.CPU20.RCU
     54018           +14.4%      61810 =C2=B1  4%  softirqs.CPU21.RCU
     28115           +12.9%      31748        softirqs.CPU21.SCHED
     54773 =C2=B1  2%      +6.5%      58316 =C2=B1  3%  softirqs.CPU22.RCU
     53536           +11.4%      59660 =C2=B1  5%  softirqs.CPU23.RCU
     29616 =C2=B1  5%      +7.1%      31705 =C2=B1  5%  softirqs.CPU23.SCHED
     27797            +9.0%      30292 =C2=B1  2%  softirqs.CPU24.SCHED
     55008            +8.5%      59698 =C2=B1  4%  softirqs.CPU25.RCU
     55186 =C2=B1  2%      +7.3%      59236 =C2=B1  4%  softirqs.CPU27.RCU
     54285            +9.1%      59232 =C2=B1  5%  softirqs.CPU29.RCU
     53456            +8.1%      57762 =C2=B1  3%  softirqs.CPU3.RCU
     53396           +10.8%      59144 =C2=B1  3%  softirqs.CPU31.RCU
     54044           +10.2%      59576 =C2=B1  5%  softirqs.CPU5.RCU
      1.22 =C2=B1  2%      -0.1        1.11 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.ext4_orphan_add.ext4_unlink.vfs_unlink.do_unlinkat.do_syscall=
_64
      0.65 =C2=B1  6%      +0.1        0.73 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.crc32c_pcl_intel_update.creat
      1.16 =C2=B1  9%      +0.1        1.29        perf-profile.calltrace.c=
ycles-pp.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_ent=
er_state.cpuidle_enter
      1.00 =C2=B1 10%      +0.2        1.16        perf-profile.calltrace.c=
ycles-pp.__softirqentry_text_start.irq_exit.smp_apic_timer_interrupt.apic_t=
imer_interrupt.cpuidle_enter_state
      4.58 =C2=B1  3%      +0.2        4.78 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.ext4_evict_inode.evict.do_unlinkat.do_syscall_64.entry_SYSCAL=
L_64_after_hwframe
      4.89 =C2=B1  3%      +0.2        5.08 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.evict.do_unlinkat.do_syscall_64.entry_SYSCALL_64_after_hwfram=
e.unlink
      0.47 =C2=B1 57%      +0.2        0.71 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.smp_a=
pic_timer_interrupt.apic_timer_interrupt
      0.13 =C2=B1173%      +0.5        0.60 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtim=
er_interrupt.smp_apic_timer_interrupt
      0.00            +0.5        0.54 =C2=B1  6%  perf-profile.calltrace.c=
ycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_=
run_queues.hrtimer_interrupt
      0.24 =C2=B1 22%      -0.1        0.17        perf-profile.children.cy=
cles-pp.mutex_lock
      0.39 =C2=B1  7%      -0.1        0.33        perf-profile.children.cy=
cles-pp.dput
      0.12 =C2=B1 13%      -0.1        0.07 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.tick_nohz_next_event
      0.41 =C2=B1  3%      -0.0        0.37 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.inode_permission
      0.18 =C2=B1  8%      -0.0        0.15 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.may_delete
      0.09 =C2=B1 17%      -0.0        0.06        perf-profile.children.cy=
cles-pp.__hrtimer_next_event_base
      0.12 =C2=B1 12%      -0.0        0.10 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.find_inode_bit
      0.11 =C2=B1  7%      -0.0        0.08 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.find_next_zero_bit
      0.05 =C2=B1  8%      +0.0        0.07        perf-profile.children.cy=
cles-pp.open64
      0.09 =C2=B1 12%      +0.0        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.set_next_entity
      0.14 =C2=B1 10%      +0.0        0.16 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.mark_page_accessed
      0.06 =C2=B1 14%      +0.0        0.08        perf-profile.children.cy=
cles-pp.generic_file_read_iter
      0.18 =C2=B1  8%      +0.0        0.20        perf-profile.children.cy=
cles-pp.switch_fpu_return
      0.08 =C2=B1  8%      +0.0        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.fsnotify_grab_connector
      0.07 =C2=B1 14%      +0.0        0.10 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.security_file_alloc
      0.12 =C2=B1 19%      +0.0        0.15 =C2=B1 17%  perf-profile.childr=
en.cycles-pp.vfs_read
      0.10 =C2=B1  8%      +0.0        0.13 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.run_timer_softirq
      0.07 =C2=B1 15%      +0.0        0.10 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.note_gp_changes
      0.13 =C2=B1 16%      +0.0        0.16 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.ksys_read
      0.04 =C2=B1 58%      +0.0        0.07 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.__ext4_handle_dirty_super
      0.04 =C2=B1 60%      +0.0        0.08 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.update_cfs_rq_h_load
      0.08 =C2=B1  6%      +0.0        0.11 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.new_sync_read
      0.12 =C2=B1 17%      +0.0        0.16 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.rcu_all_qs
      0.13 =C2=B1 10%      +0.0        0.17 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.ext4_release_file
      0.04 =C2=B1 59%      +0.0        0.08 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.__srcu_read_lock
      0.16 =C2=B1  6%      +0.0        0.20 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.avc_has_perm
      0.29 =C2=B1  5%      +0.0        0.33        perf-profile.children.cy=
cles-pp.d_lookup
      0.44 =C2=B1  5%      +0.0        0.48 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.__fput
      0.05 =C2=B1 61%      +0.0        0.09 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.__kernel_text_address
      0.11 =C2=B1 17%      +0.0        0.15 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.ext4_inode_attach_jinode
      0.19 =C2=B1 11%      +0.0        0.23 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.switch_mm_irqs_off
      0.03 =C2=B1100%      +0.0        0.08 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.kernel_text_address
      0.03 =C2=B1102%      +0.0        0.08 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.ttwu_do_wakeup
      0.15 =C2=B1  5%      +0.0        0.20 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.read
      0.01 =C2=B1173%      +0.0        0.06        perf-profile.children.cy=
cles-pp.check_preempt_curr
      0.22 =C2=B1 14%      +0.0        0.27 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.update_blocked_averages
      0.20 =C2=B1 19%      +0.0        0.24 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.__alloc_file
      0.17 =C2=B1 15%      +0.0        0.21 =C2=B1  2%  perf-profile.childr=
en.cycles-pp._raw_spin_trylock
      0.00            +0.1        0.05        perf-profile.children.cycles-=
pp.native_apic_mem_write
      0.00            +0.1        0.05        perf-profile.children.cycles-=
pp.__note_gp_changes
      0.23 =C2=B1 15%      +0.1        0.28 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.run_rebalance_domains
      0.30 =C2=B1 14%      +0.1        0.35 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.clockevents_program_event
      0.27 =C2=B1  7%      +0.1        0.33        perf-profile.children.cy=
cles-pp.__d_lookup
      0.23 =C2=B1 15%      +0.1        0.28 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.alloc_empty_file
      0.38 =C2=B1 11%      +0.1        0.45 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.jbd2_journal_stop
      0.52 =C2=B1  6%      +0.1        0.59 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.rcu_core
      0.41 =C2=B1  7%      +0.1        0.49 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.__ext4_journal_stop
      0.14 =C2=B1 11%      +0.1        0.22 =C2=B1 28%  perf-profile.childr=
en.cycles-pp.__virt_addr_valid
      0.50 =C2=B1  4%      +0.1        0.60 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.ext4_map_blocks
      0.72 =C2=B1  7%      +0.1        0.82 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.getname_flags
      0.47 =C2=B1  7%      +0.1        0.57 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.strncpy_from_user
      0.33 =C2=B1  6%      +0.1        0.43 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.ext4_es_lookup_extent
      0.23 =C2=B1 35%      +0.1        0.35 =C2=B1 28%  perf-profile.childr=
en.cycles-pp.io_serial_in
      0.89 =C2=B1  9%      +0.1        1.01 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.tick_sched_handle
      1.03 =C2=B1  9%      +0.1        1.16 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.tick_sched_timer
      1.38 =C2=B1  6%      +0.1        1.52        perf-profile.children.cy=
cles-pp.irq_exit
      1.21 =C2=B1  8%      +0.2        1.38 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.__softirqentry_text_start
      1.55 =C2=B1  5%      +0.2        1.73        perf-profile.children.cy=
cles-pp.crc32c_pcl_intel_update
      4.59 =C2=B1  3%      +0.2        4.79 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.ext4_evict_inode
      4.89 =C2=B1  3%      +0.2        5.08 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.evict
      4.23 =C2=B1  4%      +0.2        4.46        perf-profile.children.cy=
cles-pp.smp_apic_timer_interrupt
      4.49 =C2=B1  4%      +0.2        4.72        perf-profile.children.cy=
cles-pp.apic_timer_interrupt
      0.20 =C2=B1 18%      -0.0        0.15 =C2=B1  3%  perf-profile.self.c=
ycles-pp.mutex_lock
      0.07 =C2=B1 12%      -0.0        0.03 =C2=B1100%  perf-profile.self.c=
ycles-pp.tick_nohz_next_event
      0.13 =C2=B1  6%      -0.0        0.10 =C2=B1 10%  perf-profile.self.c=
ycles-pp.jbd2__journal_start
      0.09 =C2=B1 17%      -0.0        0.06        perf-profile.self.cycles=
-pp.__hrtimer_next_event_base
      0.09 =C2=B1  9%      -0.0        0.06        perf-profile.self.cycles=
-pp.inode_init_always
      0.11 =C2=B1  7%      -0.0        0.08 =C2=B1  5%  perf-profile.self.c=
ycles-pp.find_next_zero_bit
      0.06 =C2=B1  6%      +0.0        0.08 =C2=B1  6%  perf-profile.self.c=
ycles-pp.ext4_alloc_inode
      0.13 =C2=B1 10%      +0.0        0.15 =C2=B1  3%  perf-profile.self.c=
ycles-pp.__virt_addr_valid
      0.13 =C2=B1 12%      +0.0        0.16 =C2=B1  6%  perf-profile.self.c=
ycles-pp.mark_page_accessed
      0.07 =C2=B1 11%      +0.0        0.11 =C2=B1  4%  perf-profile.self.c=
ycles-pp.update_blocked_averages
      0.11 =C2=B1 14%      +0.0        0.15 =C2=B1 10%  perf-profile.self.c=
ycles-pp.ext4_mark_inode_dirty
      0.04 =C2=B1 60%      +0.0        0.08 =C2=B1  6%  perf-profile.self.c=
ycles-pp.update_cfs_rq_h_load
      0.04 =C2=B1 59%      +0.0        0.08 =C2=B1 12%  perf-profile.self.c=
ycles-pp.__srcu_read_lock
      0.22 =C2=B1 10%      +0.0        0.26 =C2=B1  7%  perf-profile.self.c=
ycles-pp.strncpy_from_user
      0.16 =C2=B1 12%      +0.0        0.20 =C2=B1  7%  perf-profile.self.c=
ycles-pp.ktime_get
      0.15 =C2=B1 10%      +0.0        0.20 =C2=B1  2%  perf-profile.self.c=
ycles-pp.avc_has_perm
      0.11 =C2=B1 14%      +0.0        0.15 =C2=B1 16%  perf-profile.self.c=
ycles-pp.switch_mm_irqs_off
      0.32 =C2=B1  9%      +0.0        0.37 =C2=B1  2%  perf-profile.self.c=
ycles-pp.jbd2_journal_stop
      0.16 =C2=B1 14%      +0.0        0.21        perf-profile.self.cycles=
-pp._raw_spin_trylock
      0.21 =C2=B1 12%      +0.0        0.26 =C2=B1  3%  perf-profile.self.c=
ycles-pp.__d_lookup
      0.13 =C2=B1 17%      +0.0        0.18 =C2=B1 16%  perf-profile.self.c=
ycles-pp.__schedule
      0.03 =C2=B1100%      +0.1        0.08 =C2=B1  6%  perf-profile.self.c=
ycles-pp.__getblk_gfp
      0.24 =C2=B1  6%      +0.1        0.30 =C2=B1  8%  perf-profile.self.c=
ycles-pp.find_get_entry
      0.10 =C2=B1 22%      +0.1        0.15 =C2=B1 35%  perf-profile.self.c=
ycles-pp.add_dirent_to_buf
      0.21 =C2=B1  8%      +0.1        0.32 =C2=B1 15%  perf-profile.self.c=
ycles-pp.ext4_es_lookup_extent
      1.21 =C2=B1  4%      +0.2        1.40        perf-profile.self.cycles=
-pp.crc32c_pcl_intel_update



***************************************************************************=
************************
lkp-ivb-ep01: 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00GHz with 384=
G memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/fs/kconfig/load/md/rootfs/tbox_group/test/te=
stcase:
  gcc-7/performance/4BRD_12G/xfs/x86_64-rhel-7.6/3000/RAID1/debian-x86_64-2=
018-04-03.cgz/lkp-ivb-ep01/disk_wrt/aim7

commit: =

  4f23dbc1e6 ("locking/rwsem: Implement lock handoff to prevent lock starva=
tion")
  00f3c5a3df ("locking/rwsem: Always release wait_lock before waking up tas=
ks")

4f23dbc1e657951e 00f3c5a3df2c1e3dab14d0dd2b7 =

---------------- --------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

          1:4          -25%            :2     dmesg.WARNING:at#for_ip_inter=
rupt_entry/0x
         %stddev     %change         %stddev
             \          |                \  =

     63.75            +2.0%      65.00        turbostat.PkgTmp
    280.00 =C2=B1 12%     +37.1%     384.00 =C2=B1  8%  slabinfo.biovec-64.=
active_objs
    280.00 =C2=B1 12%     +37.1%     384.00 =C2=B1  8%  slabinfo.biovec-64.=
num_objs
     20468            +0.6%      20586        perf-stat.i.context-switches
      2875 =C2=B1  4%      +5.8%       3043        perf-stat.overall.instru=
ctions-per-iTLB-miss
      0.74            +0.8%       0.74        perf-stat.overall.ipc
     20280            +0.6%      20397        perf-stat.ps.context-switches
    124.21 =C2=B1 11%     +21.6%     150.99        sched_debug.cfs_rq:/.loa=
d_avg.stddev
     87668 =C2=B1 31%     +30.1%     114018 =C2=B1  9%  sched_debug.cfs_rq:=
/.spread0.max
     47.30 =C2=B1  9%     -31.3%      32.48 =C2=B1  3%  sched_debug.cfs_rq:=
/.util_est_enqueued.avg
    884.66 =C2=B1 20%     +28.0%       1132 =C2=B1  7%  sched_debug.cpu.cur=
r->pid.avg
      1213 =C2=B1 11%     +20.2%       1458        sched_debug.cpu.curr->pi=
d.stddev
    122.38 =C2=B1  5%     +13.8%     139.25        sched_debug.cpu.ttwu_loc=
al.min
      1870            -1.5%       1843        proc-vmstat.nr_dirty
      2284            -1.8%       2242        proc-vmstat.nr_inactive_file
      2284            -1.8%       2242        proc-vmstat.nr_zone_inactive_=
file
      1673 =C2=B1  2%      -4.9%       1591        proc-vmstat.nr_zone_writ=
e_pending
    562.25 =C2=B1158%    +366.7%       2624 =C2=B1 19%  proc-vmstat.numa_pa=
ges_migrated
      1286 =C2=B1130%   +2496.0%      33384        proc-vmstat.numa_pte_upd=
ates
    562.25 =C2=B1158%    +366.7%       2624 =C2=B1 19%  proc-vmstat.pgmigra=
te_success
     50132 =C2=B1 12%     +26.4%      63389 =C2=B1  7%  softirqs.CPU1.TIMER
     19663 =C2=B1 10%     +12.7%      22151 =C2=B1  8%  softirqs.CPU12.RCU
     18448 =C2=B1  2%      +8.3%      19976 =C2=B1  3%  softirqs.CPU18.RCU
     49885 =C2=B1  5%      -8.7%      45564        softirqs.CPU20.TIMER
     18240 =C2=B1  4%     +14.6%      20897 =C2=B1  8%  softirqs.CPU22.RCU
     18703 =C2=B1  2%      +8.1%      20219 =C2=B1  4%  softirqs.CPU24.RCU
     16173            +7.7%      17418 =C2=B1  4%  softirqs.CPU25.SCHED
    161721 =C2=B1 24%     +34.3%     217174 =C2=B1  2%  numa-meminfo.node0.=
Active
    161373 =C2=B1 24%     +33.7%     215820 =C2=B1  2%  numa-meminfo.node0.=
Active(anon)
    348.00 =C2=B1166%    +289.1%       1354        numa-meminfo.node0.Activ=
e(file)
    156218 =C2=B1 24%     +33.7%     208918 =C2=B1  2%  numa-meminfo.node0.=
AnonPages
     12329 =C2=B1 41%     +35.8%      16737 =C2=B1 10%  numa-meminfo.node1.=
Inactive(anon)
      4700 =C2=B1 14%     -24.2%       3561        numa-meminfo.node1.Inact=
ive(file)
     52814 =C2=B1 87%     -96.4%       1915 =C2=B1  9%  numa-meminfo.node1.=
PageTables
     82374 =C2=B1 46%     -47.9%      42926        numa-meminfo.node1.SUnre=
claim
     40389 =C2=B1 24%     +33.9%      54061 =C2=B1  2%  numa-vmstat.node0.n=
r_active_anon
     87.00 =C2=B1166%    +289.1%     338.50        numa-vmstat.node0.nr_act=
ive_file
     39099 =C2=B1 24%     +33.9%      52339 =C2=B1  2%  numa-vmstat.node0.n=
r_anon_pages
      1076 =C2=B1 16%     +28.0%       1377 =C2=B1  2%  numa-vmstat.node0.n=
r_inactive_file
     40389 =C2=B1 24%     +33.9%      54061 =C2=B1  2%  numa-vmstat.node0.n=
r_zone_active_anon
     87.00 =C2=B1166%    +289.1%     338.50        numa-vmstat.node0.nr_zon=
e_active_file
      1076 =C2=B1 15%     +27.5%       1372 =C2=B1  2%  numa-vmstat.node0.n=
r_zone_inactive_file
     41725 =C2=B1129%     +78.0%      74289 =C2=B1 82%  numa-vmstat.node0.n=
uma_other
      3083 =C2=B1 41%     +35.7%       4184 =C2=B1 10%  numa-vmstat.node1.n=
r_inactive_anon
      1183 =C2=B1 12%     -22.4%     918.50 =C2=B1  5%  numa-vmstat.node1.n=
r_inactive_file
     13205 =C2=B1 87%     -96.4%     479.00 =C2=B1  9%  numa-vmstat.node1.n=
r_page_table_pages
     20593 =C2=B1 46%     -47.9%      10739        numa-vmstat.node1.nr_sla=
b_unreclaimable
      3083 =C2=B1 41%     +35.7%       4184 =C2=B1 10%  numa-vmstat.node1.n=
r_zone_inactive_anon
      1181 =C2=B1 12%     -22.4%     917.50 =C2=B1  4%  numa-vmstat.node1.n=
r_zone_inactive_file
     67.00 =C2=B1  9%     +50.7%     101.00 =C2=B1 28%  interrupts.44:IR-PC=
I-MSI.524294-edge.eth0-TxRx-5
    305.50 =C2=B1144%    +435.4%       1635 =C2=B1 31%  interrupts.CPU11.NM=
I:Non-maskable_interrupts
    305.50 =C2=B1144%    +435.4%       1635 =C2=B1 31%  interrupts.CPU11.PM=
I:Performance_monitoring_interrupts
    845.00 =C2=B1 17%     -27.0%     617.00 =C2=B1  7%  interrupts.CPU12.RE=
S:Rescheduling_interrupts
    973.75 =C2=B1 17%     -28.4%     697.00 =C2=B1  4%  interrupts.CPU14.RE=
S:Rescheduling_interrupts
    706.75 =C2=B1 21%     +20.1%     849.00 =C2=B1 14%  interrupts.CPU16.RE=
S:Rescheduling_interrupts
      1656 =C2=B1 32%     -67.1%     544.50 =C2=B1 99%  interrupts.CPU18.NM=
I:Non-maskable_interrupts
      1656 =C2=B1 32%     -67.1%     544.50 =C2=B1 99%  interrupts.CPU18.PM=
I:Performance_monitoring_interrupts
     67.00 =C2=B1  9%     +50.7%     101.00 =C2=B1 28%  interrupts.CPU2.44:=
IR-PCI-MSI.524294-edge.eth0-TxRx-5
      1195 =C2=B1 12%     +16.7%       1395 =C2=B1 12%  interrupts.CPU2.CAL=
:Function_call_interrupts
     95.75 =C2=B1173%   +1649.9%       1675 =C2=B1 32%  interrupts.CPU2.NMI=
:Non-maskable_interrupts
     95.75 =C2=B1173%   +1649.9%       1675 =C2=B1 32%  interrupts.CPU2.PMI=
:Performance_monitoring_interrupts
      1197 =C2=B1 11%     +10.7%       1325 =C2=B1  8%  interrupts.CPU20.CA=
L:Function_call_interrupts
      1633 =C2=B1 33%     -69.9%     492.00 =C2=B1 92%  interrupts.CPU22.NM=
I:Non-maskable_interrupts
      1633 =C2=B1 33%     -69.9%     492.00 =C2=B1 92%  interrupts.CPU22.PM=
I:Performance_monitoring_interrupts
    860.75 =C2=B1 13%     -32.7%     579.50 =C2=B1 12%  interrupts.CPU22.RE=
S:Rescheduling_interrupts
      1652 =C2=B1 33%     -95.2%      79.00 =C2=B1100%  interrupts.CPU24.NM=
I:Non-maskable_interrupts
      1652 =C2=B1 33%     -95.2%      79.00 =C2=B1100%  interrupts.CPU24.PM=
I:Performance_monitoring_interrupts
      1193 =C2=B1  9%     +11.6%       1331 =C2=B1 10%  interrupts.CPU28.CA=
L:Function_call_interrupts
    636.25 =C2=B1 16%     +30.4%     829.50 =C2=B1 10%  interrupts.CPU30.RE=
S:Rescheduling_interrupts
    784.00 =C2=B1  8%     +20.5%     944.50        interrupts.CPU31.RES:Res=
cheduling_interrupts
      1174 =C2=B1 12%     +19.5%       1403 =C2=B1 13%  interrupts.CPU32.CA=
L:Function_call_interrupts
      7.75 =C2=B1173%  +14248.4%       1112        interrupts.CPU32.NMI:Non=
-maskable_interrupts
      7.75 =C2=B1173%  +14248.4%       1112        interrupts.CPU32.PMI:Per=
formance_monitoring_interrupts
    276.00 =C2=B1172%    +211.1%     858.50 =C2=B1 95%  interrupts.CPU33.NM=
I:Non-maskable_interrupts
    276.00 =C2=B1172%    +211.1%     858.50 =C2=B1 95%  interrupts.CPU33.PM=
I:Performance_monitoring_interrupts
    280.00 =C2=B1166%    +320.4%       1177 =C2=B1 85%  interrupts.CPU34.NM=
I:Non-maskable_interrupts
    280.00 =C2=B1166%    +320.4%       1177 =C2=B1 85%  interrupts.CPU34.PM=
I:Performance_monitoring_interrupts
     83.00 =C2=B1172%    +608.4%     588.00 =C2=B1 80%  interrupts.CPU38.NM=
I:Non-maskable_interrupts
     83.00 =C2=B1172%    +608.4%     588.00 =C2=B1 80%  interrupts.CPU38.PM=
I:Performance_monitoring_interrupts
    572.75 =C2=B1 18%     +22.9%     704.00 =C2=B1  5%  interrupts.CPU38.RE=
S:Rescheduling_interrupts
    278.25 =C2=B1173%    +490.7%       1643 =C2=B1 31%  interrupts.CPU4.NMI=
:Non-maskable_interrupts
    278.25 =C2=B1173%    +490.7%       1643 =C2=B1 31%  interrupts.CPU4.PMI=
:Performance_monitoring_interrupts
    663.50 =C2=B1 14%     +24.6%     826.50 =C2=B1 12%  interrupts.CPU4.RES=
:Rescheduling_interrupts
      1306 =C2=B1 62%     -46.5%     699.00        interrupts.CPU7.RES:Resc=
heduling_interrupts
      1090 =C2=B1 70%     +53.6%       1674 =C2=B1 31%  interrupts.CPU9.NMI=
:Non-maskable_interrupts
      1090 =C2=B1 70%     +53.6%       1674 =C2=B1 31%  interrupts.CPU9.PMI=
:Performance_monitoring_interrupts
     42.50            -1.0       41.50        perf-profile.calltrace.cycles=
-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     42.85            -1.0       41.87        perf-profile.calltrace.cycles=
-pp.entry_SYSCALL_64_after_hwframe.write
     36.02            -0.8       35.22        perf-profile.calltrace.cycles=
-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     34.94            -0.8       34.18        perf-profile.calltrace.cycles=
-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     30.66            -0.7       29.95        perf-profile.calltrace.cycles=
-pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe
     28.84            -0.7       28.16        perf-profile.calltrace.cycles=
-pp.xfs_file_buffered_aio_write.new_sync_write.vfs_write.ksys_write.do_sysc=
all_64
     23.88            -0.7       23.21        perf-profile.calltrace.cycles=
-pp.iomap_file_buffered_write.xfs_file_buffered_aio_write.new_sync_write.vf=
s_write.ksys_write
     23.66            -0.6       23.02        perf-profile.calltrace.cycles=
-pp.iomap_apply.iomap_file_buffered_write.xfs_file_buffered_aio_write.new_s=
ync_write.vfs_write
      1.48 =C2=B1  2%      -0.1        1.39 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.get_page_from_freelist.__alloc_pages_nodemask.pagecache_get_p=
age.grab_cache_page_write_begin.iomap_write_begin
      0.55 =C2=B1  3%      +0.1        0.60 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.xfs_dir_ialloc.xfs_create.xfs_generic_create.path_openat.do_f=
ilp_open
      0.54 =C2=B1  2%      +0.1        0.60 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.xfs_ialloc.xfs_dir_ialloc.xfs_create.xfs_generic_create.path_=
openat
      0.72 =C2=B1  4%      +0.1        0.79 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.rwsem_down_write_slowpath.down_write.do_unlinkat.do_syscall_6=
4.entry_SYSCALL_64_after_hwframe
      0.72 =C2=B1  5%      +0.1        0.80 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.down_write.do_unlinkat.do_syscall_64.entry_SYSCALL_64_after_h=
wframe.unlink
      1.31 =C2=B1  2%      +0.1        1.39 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.xfs_create.xfs_generic_create.path_openat.do_filp_open.do_sys=
_open
      0.59 =C2=B1  2%      +0.1        0.67 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.rwsem_spin_on_owner.rwsem_down_write_slowpath.down_write.do_u=
nlinkat.do_syscall_64
      0.90 =C2=B1  8%      +0.1        1.02        perf-profile.calltrace.c=
ycles-pp.hrtimer_interrupt.smp_apic_timer_interrupt.apic_timer_interrupt.cp=
uidle_enter_state.cpuidle_enter
      2.34 =C2=B1  4%      +0.1        2.47        perf-profile.calltrace.c=
ycles-pp.entry_SYSCALL_64_after_hwframe.unlink
      2.34 =C2=B1  4%      +0.1        2.47        perf-profile.calltrace.c=
ycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      2.74 =C2=B1  2%      +0.1        2.87        perf-profile.calltrace.c=
ycles-pp.syscall_return_via_sysret.write
      1.73 =C2=B1  2%      +0.1        1.86 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.__add_to_page_cache_locked.add_to_page_cache_lru.pagecache_ge=
t_page.grab_cache_page_write_begin.iomap_write_begin
      2.30 =C2=B1  4%      +0.1        2.44        perf-profile.calltrace.c=
ycles-pp.do_unlinkat.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      2.39 =C2=B1  3%      +0.2        2.54        perf-profile.calltrace.c=
ycles-pp.unlink
      3.35 =C2=B1  3%      +0.2        3.59        perf-profile.calltrace.c=
ycles-pp.entry_SYSCALL_64.write
     36.04            -0.8       35.23        perf-profile.children.cycles-=
pp.ksys_write
     52.54            -0.8       51.76        perf-profile.children.cycles-=
pp.entry_SYSCALL_64_after_hwframe
     52.20            -0.8       51.43        perf-profile.children.cycles-=
pp.do_syscall_64
     34.98            -0.8       34.22        perf-profile.children.cycles-=
pp.vfs_write
     30.68            -0.7       29.97        perf-profile.children.cycles-=
pp.new_sync_write
     28.89            -0.7       28.20        perf-profile.children.cycles-=
pp.xfs_file_buffered_aio_write
     23.89            -0.7       23.23        perf-profile.children.cycles-=
pp.iomap_file_buffered_write
     23.71            -0.7       23.05        perf-profile.children.cycles-=
pp.iomap_apply
      0.37 =C2=B1  5%      -0.1        0.28 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.node_dirty_ok
      0.14 =C2=B1 16%      -0.1        0.04 =C2=B1100%  perf-profile.childr=
en.cycles-pp.get_mem_cgroup_from_mm
      1.51 =C2=B1  2%      -0.1        1.43 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.get_page_from_freelist
      0.56 =C2=B1  4%      -0.1        0.48        perf-profile.children.cy=
cles-pp._cond_resched
      0.28 =C2=B1 10%      -0.0        0.23 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.rcu_all_qs
      0.16 =C2=B1 13%      -0.0        0.13        perf-profile.children.cy=
cles-pp.__xfs_btree_check_sblock
      0.19 =C2=B1  2%      -0.0        0.17 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.xfs_da3_node_read
      0.15 =C2=B1 10%      -0.0        0.12 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.xfs_get_extsz_hint
      0.10 =C2=B1  5%      -0.0        0.08 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.orc_find
      0.11 =C2=B1  4%      +0.0        0.14 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.dequeue_task_fair
      0.15 =C2=B1  7%      +0.0        0.17        perf-profile.children.cy=
cles-pp.xfs_btree_increment
      0.06 =C2=B1 20%      +0.0        0.08 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.xfs_btree_read_buf_block
      0.09 =C2=B1 20%      +0.0        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.xfs_btree_lookup_get_block
      0.04 =C2=B1 58%      +0.0        0.07        perf-profile.children.cy=
cles-pp.xas_find
      0.26 =C2=B1  8%      +0.0        0.29        perf-profile.children.cy=
cles-pp.iov_iter_advance
      0.16 =C2=B1  5%      +0.0        0.20 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.xfs_dir_ino_validate
      0.04 =C2=B1 58%      +0.0        0.08 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.__x86_indirect_thunk_r15
      0.14 =C2=B1  9%      +0.0        0.18 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.xfs_buf_item_format
      0.08 =C2=B1 19%      +0.0        0.12 =C2=B1  8%  perf-profile.childr=
en.cycles-pp._xfs_trans_bjoin
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.__inc_numa_state
      0.03 =C2=B1100%      +0.0        0.07        perf-profile.children.cy=
cles-pp.xfs_trans_free
      0.06 =C2=B1 67%      +0.0        0.10 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.xfs_find_daxdev_for_inode
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.__unwind_start
      0.55 =C2=B1  3%      +0.1        0.60 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.xfs_dir_ialloc
      0.34 =C2=B1  6%      +0.1        0.40 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.__generic_write_end
      0.54 =C2=B1  2%      +0.1        0.60 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.xfs_ialloc
      0.47 =C2=B1  3%      +0.1        0.54 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.xfs_dialloc
      1.31 =C2=B1  2%      +0.1        1.39 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.xfs_create
      1.01 =C2=B1  4%      +0.1        1.09 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.___might_sleep
      0.95 =C2=B1  4%      +0.1        1.03 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.rwsem_spin_on_owner
      0.53 =C2=B1 12%      +0.1        0.62 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.__xfs_dir3_data_check
      0.53 =C2=B1 12%      +0.1        0.62 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.xfs_dir3_data_check
      2.31 =C2=B1  4%      +0.1        2.44        perf-profile.children.cy=
cles-pp.do_unlinkat
      2.40 =C2=B1  3%      +0.2        2.55        perf-profile.children.cy=
cles-pp.unlink
      3.07            +0.2        3.25        perf-profile.children.cycles-=
pp.syscall_return_via_sysret
      3.39 =C2=B1  3%      +0.2        3.63        perf-profile.children.cy=
cles-pp.entry_SYSCALL_64
      0.99 =C2=B1  4%      -0.1        0.86        perf-profile.self.cycles=
-pp.xfs_file_buffered_aio_write
      0.14 =C2=B1 16%      -0.1        0.04 =C2=B1100%  perf-profile.self.c=
ycles-pp.get_mem_cgroup_from_mm
      0.18 =C2=B1 30%      -0.1        0.09 =C2=B1 11%  perf-profile.self.c=
ycles-pp.lock_page_memcg
      0.47 =C2=B1  4%      -0.1        0.40 =C2=B1  3%  perf-profile.self.c=
ycles-pp.iomap_write_end
      0.25 =C2=B1  7%      -0.1        0.19 =C2=B1  5%  perf-profile.self.c=
ycles-pp.node_dirty_ok
      0.43 =C2=B1  7%      -0.0        0.38        perf-profile.self.cycles=
-pp.__pagevec_lru_add_fn
      0.27 =C2=B1  4%      -0.0        0.22        perf-profile.self.cycles=
-pp.xfs_bmbt_to_iomap
      0.11 =C2=B1  9%      -0.0        0.08 =C2=B1 12%  perf-profile.self.c=
ycles-pp.node_page_state
      0.26            -0.0        0.23 =C2=B1  2%  perf-profile.self.cycles=
-pp.file_update_time
      0.11 =C2=B1 12%      -0.0        0.08 =C2=B1  5%  perf-profile.self.c=
ycles-pp.xfs_get_extsz_hint
      0.08            -0.0        0.06 =C2=B1 16%  perf-profile.self.cycles=
-pp.xfs_agino_range
      0.08 =C2=B1  5%      +0.0        0.10 =C2=B1  5%  perf-profile.self.c=
ycles-pp.mem_cgroup_try_charge
      0.08 =C2=B1 10%      +0.0        0.10 =C2=B1  5%  perf-profile.self.c=
ycles-pp.truncate_cleanup_page
      0.09 =C2=B1 12%      +0.0        0.11 =C2=B1  4%  perf-profile.self.c=
ycles-pp.xas_create
      0.06 =C2=B1 17%      +0.0        0.09 =C2=B1 17%  perf-profile.self.c=
ycles-pp.rcu_sched_clock_irq
      0.04 =C2=B1 58%      +0.0        0.07 =C2=B1  7%  perf-profile.self.c=
ycles-pp.free_unref_page_list
      0.15 =C2=B1  5%      +0.0        0.18 =C2=B1  2%  perf-profile.self.c=
ycles-pp.__fdget_pos
      0.07 =C2=B1 17%      +0.0        0.10 =C2=B1 14%  perf-profile.self.c=
ycles-pp.memcpy_erms
      0.17 =C2=B1  4%      +0.0        0.21 =C2=B1  2%  perf-profile.self.c=
ycles-pp.__mod_lruvec_state
      0.31 =C2=B1  7%      +0.0        0.35        perf-profile.self.cycles=
-pp._raw_spin_lock_irqsave
      0.27 =C2=B1  7%      +0.0        0.31 =C2=B1  6%  perf-profile.self.c=
ycles-pp.__add_to_page_cache_locked
      0.26 =C2=B1 10%      +0.0        0.30 =C2=B1  3%  perf-profile.self.c=
ycles-pp.free_pcppages_bulk
      0.05 =C2=B1 74%      +0.0        0.10 =C2=B1 19%  perf-profile.self.c=
ycles-pp.xfs_find_daxdev_for_inode
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1 16%  perf-profile.self.c=
ycles-pp.hrtimer_interrupt
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.x=
fs_buf_item_init
      0.03 =C2=B1100%      +0.1        0.08 =C2=B1  6%  perf-profile.self.c=
ycles-pp.__x86_indirect_thunk_r15
      0.19 =C2=B1 27%      +0.1        0.24 =C2=B1  4%  perf-profile.self.c=
ycles-pp.__sb_end_write
      0.12 =C2=B1 16%      +0.1        0.18 =C2=B1  2%  perf-profile.self.c=
ycles-pp.mem_cgroup_commit_charge
      0.97 =C2=B1  3%      +0.1        1.04 =C2=B1  4%  perf-profile.self.c=
ycles-pp.___might_sleep
      0.61 =C2=B1  9%      +0.1        0.69 =C2=B1  5%  perf-profile.self.c=
ycles-pp.xas_load
      0.51 =C2=B1  3%      +0.1        0.59 =C2=B1  2%  perf-profile.self.c=
ycles-pp.write
      0.91 =C2=B1  3%      +0.1        1.00 =C2=B1  4%  perf-profile.self.c=
ycles-pp.rwsem_spin_on_owner
      0.26 =C2=B1  9%      +0.1        0.36 =C2=B1  6%  perf-profile.self.c=
ycles-pp.__alloc_pages_nodemask
      3.06            +0.2        3.24        perf-profile.self.cycles-pp.s=
yscall_return_via_sysret
      3.03 =C2=B1  3%      +0.2        3.25        perf-profile.self.cycles=
-pp.entry_SYSCALL_64



***************************************************************************=
************************
lkp-ivb-ep01: 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00GHz with 384=
G memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/fs/kconfig/load/md/rootfs/tbox_group/test/te=
stcase:
  gcc-7/performance/4BRD_12G/xfs/x86_64-rhel-7.6/3000/RAID1/debian-x86_64-2=
019-05-14.cgz/lkp-ivb-ep01/disk_wrt/aim7

commit: =

  4f23dbc1e6 ("locking/rwsem: Implement lock handoff to prevent lock starva=
tion")
  00f3c5a3df ("locking/rwsem: Always release wait_lock before waking up tas=
ks")

4f23dbc1e657951e 00f3c5a3df2c1e3dab14d0dd2b7 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      1304            -3.1%       1263        aim7.time.system_time
      5.18 =C2=B1  4%      +0.7        5.91        mpstat.cpu.all.usr%
     69.05            -5.1%      65.53        iostat.cpu.idle
     25.78 =C2=B1  3%     +10.8%      28.56        iostat.cpu.system
      5.11 =C2=B1  4%     +14.2%       5.83        iostat.cpu.user
      1024 =C2=B1 54%     +56.8%       1607 =C2=B1  5%  iostat.md0.wkB/s
     68.50            -5.1%      65.00        vmstat.cpu.id
      1024 =C2=B1 54%     +56.7%       1604 =C2=B1  5%  vmstat.io.bo
      4.00          +500.0%      24.00        vmstat.memory.buff
     17890 =C2=B1  3%     +13.5%      20313        vmstat.system.cs
      1101 =C2=B1  2%      +7.3%       1181 =C2=B1  2%  slabinfo.UNIX.activ=
e_objs
      1101 =C2=B1  2%      +7.3%       1181 =C2=B1  2%  slabinfo.UNIX.num_o=
bjs
      4346 =C2=B1  4%     +11.5%       4846 =C2=B1  2%  slabinfo.kmalloc-1k=
.active_objs
      4378 =C2=B1  4%     +11.0%       4859 =C2=B1  2%  slabinfo.kmalloc-1k=
.num_objs
      1952 =C2=B1 18%     +31.1%       2560        slabinfo.skbuff_head_cac=
he.active_objs
      2040 =C2=B1 17%     +31.8%       2688        slabinfo.skbuff_head_cac=
he.num_objs
    194684 =C2=B1  7%     -49.0%      99382        meminfo.AnonHugePages
   2519569            +9.0%    2747468        meminfo.Committed_AS
   6016512           +25.8%    7570432 =C2=B1  6%  meminfo.DirectMap2M
      6647 =C2=B1  7%     +11.7%       7424 =C2=B1  2%  meminfo.Dirty
      8149 =C2=B1  5%     +11.5%       9090 =C2=B1  2%  meminfo.Inactive(fi=
le)
      1977 =C2=B1 11%    -100.0%       0.00        meminfo.Mlocked
     20229 =C2=B1  6%     +15.5%      23363        meminfo.max_used_kB
    167735 =C2=B1 28%     +20.1%     201529 =C2=B1 28%  numa-meminfo.node0.=
Active(anon)
    106332 =C2=B1 16%     -61.9%      40537 =C2=B1 27%  numa-meminfo.node0.=
AnonHugePages
    162893 =C2=B1 28%     +22.3%     199190 =C2=B1 29%  numa-meminfo.node0.=
AnonPages
      8638 =C2=B1 28%     +59.4%      13773 =C2=B1 16%  numa-meminfo.node0.=
Inactive
      4576 =C2=B1 56%    +110.7%       9640 =C2=B1 30%  numa-meminfo.node0.=
Inactive(anon)
      1140 =C2=B1 10%    -100.0%       0.00        numa-meminfo.node0.Mlock=
ed
     88219 =C2=B1 15%     -33.5%      58632 =C2=B1 17%  numa-meminfo.node1.=
AnonHugePages
      3251 =C2=B1  6%     +10.0%       3575 =C2=B1  2%  numa-meminfo.node1.=
Dirty
      4053 =C2=B1 18%     +18.0%       4781 =C2=B1 14%  numa-meminfo.node1.=
Inactive(file)
    407.00 =C2=B1  3%     +11.2%     452.50        turbostat.Avg_MHz
      0.86 =C2=B1112%    +176.5%       2.38 =C2=B1 82%  turbostat.CPU%c3
     33.81 =C2=B1  3%     +17.8%      39.83        turbostat.CorWatt
     51.75 =C2=B1  5%     +23.7%      64.00        turbostat.CoreTmp
     10.75 =C2=B1 34%     -57.4%       4.58        turbostat.Pkg%pc2
      0.03 =C2=B1173%    +483.3%       0.18 =C2=B1 94%  turbostat.Pkg%pc3
      2.94 =C2=B1 39%     -90.3%       0.29 =C2=B1 96%  turbostat.Pkg%pc6
     52.00 =C2=B1  5%     +23.1%      64.00        turbostat.PkgTmp
     59.26           +11.4%      66.03        turbostat.PkgWatt
     10206 =C2=B1  3%     -13.0%       8884        turbostat.SMI
    337.75            +1.0%     341.00        proc-vmstat.nr_active_file
     94.25 =C2=B1  7%     -49.1%      48.00        proc-vmstat.nr_anon_tran=
sparent_hugepages
      1610 =C2=B1  5%     +12.8%       1816        proc-vmstat.nr_dirty
      1979 =C2=B1  4%     +12.2%       2220        proc-vmstat.nr_inactive_=
file
     48494 =C2=B1  3%     +12.0%      54334        proc-vmstat.nr_kernel_st=
ack
    494.75 =C2=B1 11%    -100.0%       0.00        proc-vmstat.nr_mlock
     39652            +5.8%      41942        proc-vmstat.nr_slab_unreclaim=
able
     28998 =C2=B1 58%     +44.2%      41804 =C2=B1  4%  proc-vmstat.nr_writ=
ten
    337.75            +1.0%     341.00        proc-vmstat.nr_zone_active_fi=
le
      1978 =C2=B1  4%     +12.2%       2220        proc-vmstat.nr_zone_inac=
tive_file
      1419 =C2=B1  7%     +11.7%       1586 =C2=B1  3%  proc-vmstat.nr_zone=
_write_pending
     23827 =C2=B1  6%     -94.6%       1292 =C2=B1 99%  proc-vmstat.numa_pt=
e_updates
    483395            -9.5%     437383        proc-vmstat.pgfault
      1724 =C2=B1  2%      -2.9%       1675        proc-vmstat.unevictable_=
pgs_culled
     40697 =C2=B1 28%     +22.3%      49761 =C2=B1 29%  numa-vmstat.node0.n=
r_anon_pages
  19766117 =C2=B1  3%     -12.6%   17268001        numa-vmstat.node0.nr_dir=
tied
    820.75 =C2=B1  3%     +13.6%     932.00        numa-vmstat.node0.nr_dir=
ty
      1146 =C2=B1 56%    +110.2%       2409 =C2=B1 30%  numa-vmstat.node0.n=
r_inactive_anon
    285.50 =C2=B1 10%    -100.0%       0.00        numa-vmstat.node0.nr_mlo=
ck
      1146 =C2=B1 56%    +110.2%       2409 =C2=B1 30%  numa-vmstat.node0.n=
r_zone_inactive_anon
    732.25 =C2=B1  2%     +11.4%     816.00        numa-vmstat.node0.nr_zon=
e_write_pending
  20278495 =C2=B1  3%     -12.6%   17727979        numa-vmstat.node0.numa_h=
it
  20276149 =C2=B1  3%     -12.9%   17656262        numa-vmstat.node0.numa_l=
ocal
      2353 =C2=B1 90%   +2947.3%      71725 =C2=B1 89%  numa-vmstat.node0.n=
uma_other
  19859884 =C2=B1  3%     -13.8%   17124582        numa-vmstat.node1.nr_dir=
tied
    817.25 =C2=B1  4%     +11.3%     909.50        numa-vmstat.node1.nr_dir=
ty
      1006 =C2=B1 17%     +19.1%       1198 =C2=B1 11%  numa-vmstat.node1.n=
r_inactive_file
    208.75 =C2=B1 11%    -100.0%       0.00        numa-vmstat.node1.nr_mlo=
ck
      1006 =C2=B1 17%     +19.3%       1201 =C2=B1 10%  numa-vmstat.node1.n=
r_zone_inactive_file
    723.25 =C2=B1  3%     +11.1%     803.50        numa-vmstat.node1.nr_zon=
e_write_pending
  20396643 =C2=B1  3%     -13.3%   17691336        numa-vmstat.node1.numa_h=
it
  20225241 =C2=B1  3%     -13.0%   17589172        numa-vmstat.node1.numa_l=
ocal
     52229 =C2=B1  7%     -13.5%      45200        interrupts.CAL:Function_=
call_interrupts
      1037 =C2=B1 10%     +61.8%       1678 =C2=B1  5%  interrupts.CPU0.RES=
:Rescheduling_interrupts
      1301 =C2=B1  6%     -17.5%       1073        interrupts.CPU10.CAL:Fun=
ction_call_interrupts
      1289 =C2=B1  2%     -15.7%       1087 =C2=B1  8%  interrupts.CPU12.CA=
L:Function_call_interrupts
      1322 =C2=B1  7%     -14.5%       1131 =C2=B1  4%  interrupts.CPU19.CA=
L:Function_call_interrupts
     17.00 =C2=B1169%   +6250.0%       1079 =C2=B1  2%  interrupts.CPU2.NMI=
:Non-maskable_interrupts
     17.00 =C2=B1169%   +6250.0%       1079 =C2=B1  2%  interrupts.CPU2.PMI=
:Performance_monitoring_interrupts
      1923 =C2=B1 23%     -73.2%     515.00 =C2=B1 99%  interrupts.CPU21.NM=
I:Non-maskable_interrupts
      1923 =C2=B1 23%     -73.2%     515.00 =C2=B1 99%  interrupts.CPU21.PM=
I:Performance_monitoring_interrupts
      1350 =C2=B1  5%     -27.6%     978.00 =C2=B1  6%  interrupts.CPU22.CA=
L:Function_call_interrupts
      1959 =C2=B1 24%     -91.7%     162.50 =C2=B1 99%  interrupts.CPU22.NM=
I:Non-maskable_interrupts
      1959 =C2=B1 24%     -91.7%     162.50 =C2=B1 99%  interrupts.CPU22.PM=
I:Performance_monitoring_interrupts
      1046 =C2=B1 21%     -41.0%     617.50 =C2=B1  2%  interrupts.CPU22.RE=
S:Rescheduling_interrupts
      1341 =C2=B1  8%     -18.0%       1100        interrupts.CPU23.CAL:Fun=
ction_call_interrupts
    880.75 =C2=B1 12%     -29.0%     625.50        interrupts.CPU23.RES:Res=
cheduling_interrupts
      1323 =C2=B1 10%     -15.9%       1112        interrupts.CPU25.CAL:Fun=
ction_call_interrupts
    872.75 =C2=B1 12%     -29.5%     615.00 =C2=B1  2%  interrupts.CPU25.RE=
S:Rescheduling_interrupts
    347.75 =C2=B1133%    +210.7%       1080 =C2=B1  5%  interrupts.CPU30.NM=
I:Non-maskable_interrupts
    347.75 =C2=B1133%    +210.7%       1080 =C2=B1  5%  interrupts.CPU30.PM=
I:Performance_monitoring_interrupts
      1316 =C2=B1 10%     -15.8%       1108        interrupts.CPU31.CAL:Fun=
ction_call_interrupts
    721.75 =C2=B1  5%     -14.6%     616.50 =C2=B1  3%  interrupts.CPU31.RE=
S:Rescheduling_interrupts
      1304 =C2=B1 15%     -21.7%       1021 =C2=B1  2%  interrupts.CPU36.CA=
L:Function_call_interrupts
    711.75 =C2=B1 13%    +162.6%       1869 =C2=B1 54%  interrupts.CPU5.RES=
:Rescheduling_interrupts
      1331 =C2=B1  7%     -20.3%       1061 =C2=B1  2%  interrupts.CPU6.CAL=
:Function_call_interrupts
    802.75 =C2=B1 11%     -21.8%     628.00        interrupts.CPU6.RES:Resc=
heduling_interrupts
      1325 =C2=B1  5%     -14.2%       1138 =C2=B1  4%  interrupts.CPU7.CAL=
:Function_call_interrupts
      1314 =C2=B1  6%     -15.8%       1106        interrupts.CPU9.CAL:Func=
tion_call_interrupts
      9961           +11.7%      11124        sched_debug.cfs_rq:/.exec_clo=
ck.max
    162.13 =C2=B1 11%    +102.1%     327.63 =C2=B1  7%  sched_debug.cfs_rq:=
/.exec_clock.stddev
    237563 =C2=B1  5%      +6.4%     252874 =C2=B1  3%  sched_debug.cfs_rq:=
/.min_vruntime.max
      0.39 =C2=B1  7%     -14.5%       0.33        sched_debug.cfs_rq:/.nr_=
running.avg
     12.54          +148.2%      31.13 =C2=B1 21%  sched_debug.cfs_rq:/.rem=
oved.load_avg.avg
     78.34           +52.8%     119.68 =C2=B1 11%  sched_debug.cfs_rq:/.rem=
oved.load_avg.stddev
    577.48          +149.3%       1439 =C2=B1 21%  sched_debug.cfs_rq:/.rem=
oved.runnable_sum.avg
      3606           +53.4%       5533 =C2=B1 11%  sched_debug.cfs_rq:/.rem=
oved.runnable_sum.stddev
      3.67 =C2=B1 28%    +203.5%      11.12 =C2=B1 16%  sched_debug.cfs_rq:=
/.removed.util_avg.avg
    146.62 =C2=B1 28%     +43.4%     210.25 =C2=B1  9%  sched_debug.cfs_rq:=
/.removed.util_avg.max
     22.89 =C2=B1 28%     +91.2%      43.76 =C2=B1  4%  sched_debug.cfs_rq:=
/.removed.util_avg.stddev
     10.87 =C2=B1  9%     +69.8%      18.47 =C2=B1 39%  sched_debug.cfs_rq:=
/.runnable_load_avg.stddev
     39019          +663.6%     297940 =C2=B1 86%  sched_debug.cfs_rq:/.run=
nable_weight.max
     17929          +218.3%      57063 =C2=B1 68%  sched_debug.cfs_rq:/.run=
nable_weight.stddev
     60838 =C2=B1 26%     +49.2%      90778 =C2=B1 11%  sched_debug.cfs_rq:=
/.spread0.max
    371.50 =C2=B1 21%     +31.5%     488.50 =C2=B1 10%  sched_debug.cfs_rq:=
/.util_est_enqueued.max
    477488 =C2=B1 75%     -84.5%      74077 =C2=B1  2%  sched_debug.cpu.clo=
ck.avg
    477508 =C2=B1 75%     -84.5%      74095 =C2=B1  2%  sched_debug.cpu.clo=
ck.max
    477467 =C2=B1 75%     -84.5%      74058 =C2=B1  2%  sched_debug.cpu.clo=
ck.min
    477488 =C2=B1 75%     -84.5%      74077 =C2=B1  2%  sched_debug.cpu.clo=
ck_task.avg
    477508 =C2=B1 75%     -84.5%      74095 =C2=B1  2%  sched_debug.cpu.clo=
ck_task.max
    477467 =C2=B1 75%     -84.5%      74058 =C2=B1  2%  sched_debug.cpu.clo=
ck_task.min
      7.81 =C2=B1  8%     +19.0%       9.29 =C2=B1  5%  sched_debug.cpu.cpu=
_load[0].avg
      8.75 =C2=B1  7%     +18.3%      10.34 =C2=B1  6%  sched_debug.cpu.cpu=
_load[1].avg
      9.42 =C2=B1  7%     +18.1%      11.12 =C2=B1  2%  sched_debug.cpu.cpu=
_load[2].avg
     43.38 =C2=B1 11%     +91.4%      83.00 =C2=B1 43%  sched_debug.cpu.cpu=
_load[2].max
      8.80 =C2=B1  9%     +67.0%      14.70 =C2=B1 35%  sched_debug.cpu.cpu=
_load[2].stddev
      9.72 =C2=B1  9%     +23.6%      12.01        sched_debug.cpu.cpu_load=
[3].avg
     46.62 =C2=B1 18%     +71.6%      80.00 =C2=B1 19%  sched_debug.cpu.cpu=
_load[3].max
      8.60 =C2=B1 14%     +69.9%      14.61 =C2=B1 17%  sched_debug.cpu.cpu=
_load[3].stddev
      8.47 =C2=B1 10%     +61.0%      13.64 =C2=B1  7%  sched_debug.cpu.cpu=
_load[4].avg
     41.12 =C2=B1 15%    +336.5%     179.50 =C2=B1 12%  sched_debug.cpu.cpu=
_load[4].max
      8.28 =C2=B1 13%    +248.2%      28.83 =C2=B1 12%  sched_debug.cpu.cpu=
_load[4].stddev
     42318 =C2=B1  9%     -11.5%      37470        sched_debug.cpu.nr_load_=
updates.avg
     39974 =C2=B1  9%     -13.0%      34783        sched_debug.cpu.nr_load_=
updates.min
      0.38 =C2=B1  8%     -16.4%       0.32        sched_debug.cpu.nr_runni=
ng.avg
     15.56 =C2=B1  3%     +15.8%      18.02 =C2=B1  4%  sched_debug.cpu.nr_=
uninterruptible.stddev
      8499            +6.5%       9050 =C2=B1  4%  sched_debug.cpu.ttwu_cou=
nt.max
    455.17 =C2=B1  8%     +14.3%     520.19 =C2=B1  5%  sched_debug.cpu.ttw=
u_count.stddev
    121.12 =C2=B1  3%      +7.3%     130.00 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.min
    477466 =C2=B1 75%     -84.5%      74058 =C2=B1  2%  sched_debug.cpu_clk
    473896 =C2=B1 75%     -85.1%      70485 =C2=B1  2%  sched_debug.ktime
    477908 =C2=B1 74%     -84.4%      74502 =C2=B1  2%  sched_debug.sched_c=
lk
     18.97 =C2=B1 14%     -39.7%      11.43 =C2=B1  8%  perf-stat.i.MPKI
 2.325e+09 =C2=B1  3%     +14.8%  2.669e+09        perf-stat.i.branch-instr=
uctions
      3.65 =C2=B1  9%      -1.2        2.47 =C2=B1  3%  perf-stat.i.branch-=
miss-rate%
  40992858 =C2=B1  4%     +17.0%   47962008        perf-stat.i.branch-misses
      9.45 =C2=B1 14%      -2.3        7.17        perf-stat.i.cache-miss-r=
ate%
   5752408 =C2=B1  2%      +7.9%    6205826 =C2=B1  3%  perf-stat.i.cache-m=
isses
  99449480 =C2=B1  4%     +12.5%  1.119e+08 =C2=B1  2%  perf-stat.i.cache-r=
eferences
     18273 =C2=B1  3%     +12.5%      20561        perf-stat.i.context-swit=
ches
      2.48 =C2=B1  8%     -31.7%       1.70 =C2=B1  3%  perf-stat.i.cpi
 1.629e+10 =C2=B1  4%     +11.1%  1.809e+10        perf-stat.i.cpu-cycles
    945.35 =C2=B1  4%      +9.1%       1031        perf-stat.i.cpu-migratio=
ns
      2944 =C2=B1  3%      +4.2%       3067        perf-stat.i.cycles-betwe=
en-cache-misses
 3.591e+09 =C2=B1  3%     +14.3%  4.102e+09        perf-stat.i.dTLB-loads
   7154623 =C2=B1  8%     +13.3%    8105429        perf-stat.i.dTLB-store-m=
isses
 2.473e+09 =C2=B1  3%     +14.4%   2.83e+09        perf-stat.i.dTLB-stores
     82.21 =C2=B1  2%      -3.2       79.06        perf-stat.i.iTLB-load-mi=
ss-rate%
   1050734 =C2=B1 12%     +15.3%    1210985        perf-stat.i.iTLB-loads
 1.172e+10 =C2=B1  3%     +14.8%  1.345e+10        perf-stat.i.instructions
      2449           +27.2%       3114        perf-stat.i.instructions-per-=
iTLB-miss
      0.62 =C2=B1  2%     +14.3%       0.71        perf-stat.i.ipc
   1295155 =C2=B1  7%     +17.5%    1522168 =C2=B1  3%  perf-stat.i.node-lo=
ad-misses
   1692798 =C2=B1  5%     +17.0%    1980114        perf-stat.i.node-loads
    761603 =C2=B1  8%     +15.8%     882204        perf-stat.i.node-store-m=
isses
   1197239 =C2=B1  9%     +17.3%    1403801        perf-stat.i.node-stores
      1.76            +0.0        1.80        perf-stat.overall.branch-miss=
-rate%
      1.39            -3.2%       1.35        perf-stat.overall.cpi
     79.96            -1.9       78.04        perf-stat.overall.iTLB-load-m=
iss-rate%
      2811 =C2=B1  2%     +11.2%       3125        perf-stat.overall.instru=
ctions-per-iTLB-miss
      0.72            +3.3%       0.74        perf-stat.overall.ipc
 2.306e+09 =C2=B1  3%     +14.7%  2.645e+09        perf-stat.ps.branch-inst=
ructions
  40663464 =C2=B1  4%     +16.9%   47517919        perf-stat.ps.branch-miss=
es
   5707130 =C2=B1  2%      +7.7%    6149393 =C2=B1  3%  perf-stat.ps.cache-=
misses
  98651423 =C2=B1  4%     +12.4%  1.109e+08 =C2=B1  2%  perf-stat.ps.cache-=
references
     18126 =C2=B1  3%     +12.4%      20371        perf-stat.ps.context-swi=
tches
 1.616e+10 =C2=B1  4%     +10.9%  1.793e+10        perf-stat.ps.cpu-cycles
    937.88 =C2=B1  4%      +9.0%       1022        perf-stat.ps.cpu-migrati=
ons
 3.562e+09 =C2=B1  3%     +14.1%  4.064e+09        perf-stat.ps.dTLB-loads
   7096976 =C2=B1  8%     +13.2%    8030377        perf-stat.ps.dTLB-store-=
misses
 2.454e+09 =C2=B1  3%     +14.3%  2.804e+09        perf-stat.ps.dTLB-stores
   1042256 =C2=B1 12%     +15.1%    1199770        perf-stat.ps.iTLB-loads
 1.162e+10 =C2=B1  3%     +14.6%  1.332e+10        perf-stat.ps.instructions
   1284746 =C2=B1  7%     +17.4%    1508066 =C2=B1  3%  perf-stat.ps.node-l=
oad-misses
   1679220 =C2=B1  5%     +16.8%    1961768        perf-stat.ps.node-loads
    755495 =C2=B1  8%     +15.7%     874037        perf-stat.ps.node-store-=
misses
   1187940 =C2=B1  9%     +17.1%    1390847        perf-stat.ps.node-stores
     54528 =C2=B1  2%     -22.6%      42229 =C2=B1  6%  softirqs.CPU0.TIMER
     19067 =C2=B1  4%     -10.6%      17047        softirqs.CPU1.SCHED
     53953           -17.8%      44323 =C2=B1  7%  softirqs.CPU1.TIMER
     18615 =C2=B1  5%      -9.4%      16866        softirqs.CPU10.SCHED
     18576 =C2=B1  3%      -7.5%      17176        softirqs.CPU11.SCHED
     49349 =C2=B1  6%     -15.8%      41544 =C2=B1  7%  softirqs.CPU11.TIMER
     18891 =C2=B1  5%     -10.9%      16837 =C2=B1  2%  softirqs.CPU12.SCHED
     57456 =C2=B1 14%     -28.2%      41276 =C2=B1  4%  softirqs.CPU12.TIMER
     18784 =C2=B1  2%     -10.1%      16884        softirqs.CPU13.SCHED
     49424 =C2=B1  5%     -16.5%      41289 =C2=B1  9%  softirqs.CPU13.TIMER
     19223 =C2=B1  2%     -11.2%      17070        softirqs.CPU14.SCHED
     51678 =C2=B1  8%     -19.0%      41856 =C2=B1  6%  softirqs.CPU14.TIMER
     19010 =C2=B1  2%      -9.7%      17160        softirqs.CPU15.SCHED
     19306 =C2=B1  2%     -12.1%      16971        softirqs.CPU16.SCHED
     52068 =C2=B1  8%     -20.7%      41291 =C2=B1  7%  softirqs.CPU16.TIMER
     19982 =C2=B1  7%      +7.6%      21503 =C2=B1  5%  softirqs.CPU17.RCU
     18737 =C2=B1  3%      -8.4%      17166        softirqs.CPU17.SCHED
     19111 =C2=B1  3%     -11.8%      16858 =C2=B1  2%  softirqs.CPU18.SCHED
     18896 =C2=B1  4%      -9.2%      17159        softirqs.CPU19.SCHED
     52848 =C2=B1  5%     -21.2%      41638 =C2=B1  5%  softirqs.CPU19.TIMER
     19445 =C2=B1  2%     -11.8%      17151        softirqs.CPU2.SCHED
     53871 =C2=B1 11%     -23.9%      40994 =C2=B1  7%  softirqs.CPU2.TIMER
     52506 =C2=B1 12%     -21.1%      41435 =C2=B1  6%  softirqs.CPU20.TIMER
     20471 =C2=B1  6%      +7.7%      22044 =C2=B1  2%  softirqs.CPU21.RCU
     18435 =C2=B1  4%     -10.0%      16590        softirqs.CPU22.SCHED
     49458 =C2=B1  3%     -18.2%      40465 =C2=B1  4%  softirqs.CPU22.TIMER
     20835 =C2=B1  5%     +15.4%      24044 =C2=B1  8%  softirqs.CPU23.RCU
     18719 =C2=B1  4%      -9.2%      16999        softirqs.CPU24.SCHED
     49855 =C2=B1  4%     -16.3%      41723 =C2=B1  6%  softirqs.CPU24.TIMER
     49582 =C2=B1  5%     -15.7%      41774 =C2=B1  5%  softirqs.CPU25.TIMER
     18825 =C2=B1  4%      -9.7%      16996        softirqs.CPU26.SCHED
     50142 =C2=B1  4%     -17.3%      41468 =C2=B1  6%  softirqs.CPU26.TIMER
     49521 =C2=B1  6%     -16.6%      41297 =C2=B1  6%  softirqs.CPU27.TIMER
     19061 =C2=B1  4%     -11.3%      16913        softirqs.CPU28.SCHED
     56138 =C2=B1 16%     -26.7%      41134 =C2=B1  7%  softirqs.CPU28.TIMER
     49305 =C2=B1  7%     -16.3%      41278 =C2=B1  7%  softirqs.CPU29.TIMER
     50274 =C2=B1  6%     -17.8%      41305 =C2=B1  5%  softirqs.CPU3.TIMER
     19289 =C2=B1  5%     -13.7%      16652        softirqs.CPU30.SCHED
     19318 =C2=B1  7%     -12.3%      16948        softirqs.CPU32.SCHED
     18563 =C2=B1  3%      -8.1%      17055        softirqs.CPU33.SCHED
     19555 =C2=B1  3%     -13.5%      16910        softirqs.CPU34.SCHED
     54208 =C2=B1  9%     -23.6%      41413 =C2=B1  7%  softirqs.CPU34.TIMER
     18777 =C2=B1  3%      -9.6%      16972        softirqs.CPU35.SCHED
     18985 =C2=B1  3%     -10.1%      17066        softirqs.CPU36.SCHED
     52365 =C2=B1  9%     -19.2%      42299 =C2=B1  8%  softirqs.CPU36.TIMER
     18686 =C2=B1  4%      -8.9%      17030        softirqs.CPU37.SCHED
     51287 =C2=B1  5%     -17.9%      42102 =C2=B1  7%  softirqs.CPU37.TIMER
     19511 =C2=B1  2%     -14.0%      16783        softirqs.CPU38.SCHED
     58324 =C2=B1 11%     -29.9%      40875 =C2=B1  8%  softirqs.CPU38.TIMER
     18670 =C2=B1  3%      -8.6%      17072        softirqs.CPU39.SCHED
     52113 =C2=B1  4%     -19.7%      41828 =C2=B1  7%  softirqs.CPU39.TIMER
     49903 =C2=B1  5%     -16.3%      41768 =C2=B1  8%  softirqs.CPU4.TIMER
     49614 =C2=B1  6%     -16.3%      41528 =C2=B1  5%  softirqs.CPU5.TIMER
     18943 =C2=B1  6%      -9.5%      17144        softirqs.CPU6.SCHED
     49359 =C2=B1  5%     -15.6%      41661 =C2=B1  7%  softirqs.CPU6.TIMER
     49260 =C2=B1  6%     -14.8%      41974 =C2=B1  4%  softirqs.CPU7.TIMER
     19050 =C2=B1  5%     -10.9%      16982        softirqs.CPU8.SCHED
     18876 =C2=B1  3%      -8.1%      17339        softirqs.CPU9.SCHED
    760956 =C2=B1  3%      -9.5%     688784        softirqs.SCHED
   2064576 =C2=B1  3%     -17.5%    1704059 =C2=B1  6%  softirqs.TIMER
      9.99            -0.8        9.21 =C2=B1  3%  perf-profile.calltrace.c=
ycles-pp.iomap_write_begin.iomap_write_actor.iomap_apply.iomap_file_buffere=
d_write.xfs_file_buffered_aio_write
      7.40            -0.7        6.73 =C2=B1  4%  perf-profile.calltrace.c=
ycles-pp.grab_cache_page_write_begin.iomap_write_begin.iomap_write_actor.io=
map_apply.iomap_file_buffered_write
      7.11            -0.7        6.45 =C2=B1  3%  perf-profile.calltrace.c=
ycles-pp.pagecache_get_page.grab_cache_page_write_begin.iomap_write_begin.i=
omap_write_actor.iomap_apply
      1.78 =C2=B1  3%      -0.3        1.44 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.__add_to_page_cache_locked.add_to_page_cache_lru.pagecache_ge=
t_page.grab_cache_page_write_begin.iomap_write_begin
      2.94 =C2=B1  2%      -0.3        2.60 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.add_to_page_cache_lru.pagecache_get_page.grab_cache_page_writ=
e_begin.iomap_write_begin.iomap_write_actor
      0.55            -0.3        0.27 =C2=B1100%  perf-profile.calltrace.c=
ycles-pp.xfs_ifree.xfs_inactive_ifree.xfs_inactive.xfs_fs_destroy_inode.des=
troy_inode
      0.87 =C2=B1 16%      -0.2        0.62 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.__sb_start_write.vfs_write.ksys_write.do_syscall_64.entry_SYS=
CALL_64_after_hwframe
      1.50 =C2=B1  2%      -0.2        1.34 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.find_get_entry.pagecache_get_page.grab_cache_page_write_begin=
.iomap_write_begin.iomap_write_actor
      0.82 =C2=B1  5%      -0.1        0.74        perf-profile.calltrace.c=
ycles-pp.xfs_file_iomap_end.iomap_apply.iomap_file_buffered_write.xfs_file_=
buffered_aio_write.new_sync_write
      0.60            +0.0        0.61        perf-profile.calltrace.cycles=
-pp.rwsem_spin_on_owner.rwsem_down_write_slowpath.down_write.do_unlinkat.do=
_syscall_64
      0.44 =C2=B1 59%      +0.2        0.68 =C2=B1 10%  perf-profile.calltr=
ace.cycles-pp.xfs_iext_lookup_extent.xfs_file_iomap_begin_delay.xfs_file_io=
map_begin.iomap_apply.iomap_file_buffered_write
      0.14 =C2=B1173%      +0.4        0.58 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.iov_iter_fault_in_readable.iomap_write_actor.iomap_apply.ioma=
p_file_buffered_write.xfs_file_buffered_aio_write
      1.12 =C2=B1  8%      +0.5        1.64 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.xfs_file_write_iter.new_sync_write.vfs_write.ksys_write.do_sy=
scall_64
     10.03            -0.8        9.25 =C2=B1  3%  perf-profile.children.cy=
cles-pp.iomap_write_begin
      7.43            -0.7        6.76 =C2=B1  4%  perf-profile.children.cy=
cles-pp.grab_cache_page_write_begin
      7.14            -0.7        6.48 =C2=B1  4%  perf-profile.children.cy=
cles-pp.pagecache_get_page
      1.82 =C2=B1  3%      -0.4        1.46 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.__add_to_page_cache_locked
      2.95 =C2=B1  2%      -0.3        2.60 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.add_to_page_cache_lru
      0.95 =C2=B1 14%      -0.3        0.68 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.__sb_start_write
      0.97 =C2=B1  3%      -0.2        0.78 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.xas_load
      1.52            -0.2        1.36 =C2=B1  2%  perf-profile.children.cy=
cles-pp.find_get_entry
      0.93 =C2=B1  5%      -0.1        0.80 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.xfs_iunlock
      0.43 =C2=B1  4%      -0.1        0.33 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.xfs_errortag_test
      0.67 =C2=B1  2%      -0.1        0.56 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.up_write
      0.38 =C2=B1  8%      -0.1        0.29 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.xas_start
      0.36 =C2=B1 14%      -0.1        0.27 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.node_dirty_ok
      0.86 =C2=B1  6%      -0.1        0.78        perf-profile.children.cy=
cles-pp.xfs_file_iomap_end
      1.06 =C2=B1  3%      -0.1        0.97        perf-profile.children.cy=
cles-pp.___might_sleep
      0.49 =C2=B1  4%      -0.1        0.41        perf-profile.children.cy=
cles-pp.xfs_trans_read_buf_map
      0.45 =C2=B1 16%      -0.1        0.39        perf-profile.children.cy=
cles-pp.scheduler_tick
      0.36 =C2=B1 15%      -0.1        0.30 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.xfs_trans_alloc
      0.21 =C2=B1  5%      -0.1        0.15 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.workingset_update_node
      0.35 =C2=B1  4%      -0.1        0.29        perf-profile.children.cy=
cles-pp.xfs_buf_read_map
      0.23 =C2=B1 16%      -0.1        0.17 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.xfs_log_reserve
      0.19 =C2=B1  9%      -0.1        0.13        perf-profile.children.cy=
cles-pp.lock_page_memcg
      0.55            -0.0        0.50 =C2=B1  6%  perf-profile.children.cy=
cles-pp.xfs_ifree
      0.08 =C2=B1  5%      -0.0        0.03 =C2=B1100%  perf-profile.childr=
en.cycles-pp.__update_load_avg_se
      0.33 =C2=B1  3%      -0.0        0.28 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.xfs_buf_get_map
      0.07 =C2=B1 10%      -0.0        0.03 =C2=B1100%  perf-profile.childr=
en.cycles-pp.get_next_timer_interrupt
      0.24 =C2=B1 20%      -0.0        0.20        perf-profile.children.cy=
cles-pp.task_tick_fair
      0.31            -0.0        0.27        perf-profile.children.cycles-=
pp.xfs_buf_find
      0.27 =C2=B1  4%      -0.0        0.23 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.xfs_read_agi
      0.12 =C2=B1 15%      -0.0        0.08 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.xas_create
      0.09 =C2=B1 16%      -0.0        0.06 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.memcg_check_events
      0.14 =C2=B1 12%      -0.0        0.11        perf-profile.children.cy=
cles-pp.update_load_avg
      0.08 =C2=B1  8%      -0.0        0.06 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.__x86_indirect_thunk_r10
      0.35 =C2=B1  3%      -0.0        0.33        perf-profile.children.cy=
cles-pp.xfs_dir_createname
      0.08 =C2=B1 11%      -0.0        0.06 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.xfs_btree_read_buf_block
      0.07 =C2=B1  5%      -0.0        0.06        perf-profile.children.cy=
cles-pp.xfs_dir3_data_get_ftype
      0.03 =C2=B1100%      +0.0        0.07 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.xfs_perag_get
      0.04 =C2=B1 60%      +0.0        0.08 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.uncharge_page
      0.09 =C2=B1 37%      +0.0        0.13        perf-profile.children.cy=
cles-pp.ret_from_fork
      0.08 =C2=B1 35%      +0.0        0.13        perf-profile.children.cy=
cles-pp.kthread
      0.49 =C2=B1  7%      +0.0        0.54 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.__x86_indirect_thunk_rax
      0.00            +0.1        0.05        perf-profile.children.cycles-=
pp.__generic_file_write_iter
      0.00            +0.1        0.06 =C2=B1  9%  perf-profile.children.cy=
cles-pp.free_unref_page_prepare
      0.22 =C2=B1 12%      +0.1        0.28 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.xfs_bmapi_reserve_delalloc
      1.29 =C2=B1  6%      +0.1        1.36 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.iomap_set_range_uptodate
      0.34 =C2=B1  4%      +0.1        0.42        perf-profile.children.cy=
cles-pp.__fsnotify_parent
      0.11 =C2=B1 10%      +0.1        0.19 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.delay_tsc
      0.64 =C2=B1  9%      +0.1        0.72        perf-profile.children.cy=
cles-pp._raw_spin_lock
      0.28 =C2=B1 19%      +0.1        0.37        perf-profile.children.cy=
cles-pp.uart_console_write
      0.49 =C2=B1  6%      +0.1        0.58 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.iov_iter_fault_in_readable
      0.28 =C2=B1 19%      +0.1        0.37        perf-profile.children.cy=
cles-pp.serial8250_console_putchar
      0.58 =C2=B1 12%      +0.1        0.71 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.xfs_iext_lookup_extent
      1.13 =C2=B1  8%      +0.5        1.64 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.xfs_file_write_iter
      0.99 =C2=B1  3%      -0.2        0.83 =C2=B1  4%  perf-profile.self.c=
ycles-pp.xfs_file_buffered_aio_write
      0.40 =C2=B1 14%      -0.1        0.26 =C2=B1  3%  perf-profile.self.c=
ycles-pp.security_file_permission
      0.59 =C2=B1  3%      -0.1        0.48 =C2=B1 12%  perf-profile.self.c=
ycles-pp.xas_load
      0.40 =C2=B1  6%      -0.1        0.29 =C2=B1  8%  perf-profile.self.c=
ycles-pp.xfs_errortag_test
      0.60 =C2=B1  3%      -0.1        0.51        perf-profile.self.cycles=
-pp.up_write
      1.02 =C2=B1  2%      -0.1        0.94        perf-profile.self.cycles=
-pp.___might_sleep
      0.31 =C2=B1 12%      -0.1        0.23        perf-profile.self.cycles=
-pp.__add_to_page_cache_locked
      0.30 =C2=B1  4%      -0.1        0.22 =C2=B1  6%  perf-profile.self.c=
ycles-pp.file_update_time
      0.19 =C2=B1  6%      -0.1        0.12 =C2=B1  8%  perf-profile.self.c=
ycles-pp.workingset_update_node
      0.48 =C2=B1  3%      -0.1        0.42 =C2=B1  6%  perf-profile.self.c=
ycles-pp.xfs_file_iomap_begin
      0.29 =C2=B1  8%      -0.1        0.23 =C2=B1  4%  perf-profile.self.c=
ycles-pp.xfs_fs_dirty_inode
      0.17 =C2=B1 12%      -0.1        0.11 =C2=B1  4%  perf-profile.self.c=
ycles-pp.lock_page_memcg
      0.07 =C2=B1 11%      -0.0        0.03 =C2=B1100%  perf-profile.self.c=
ycles-pp.__update_load_avg_se
      0.14 =C2=B1  7%      -0.0        0.10 =C2=B1 15%  perf-profile.self.c=
ycles-pp.mem_cgroup_commit_charge
      0.10 =C2=B1 18%      -0.0        0.06        perf-profile.self.cycles=
-pp.xas_create
      0.15 =C2=B1  7%      -0.0        0.12 =C2=B1  8%  perf-profile.self.c=
ycles-pp.__fdget_pos
      0.09 =C2=B1 21%      -0.0        0.06 =C2=B1  9%  perf-profile.self.c=
ycles-pp.mem_cgroup_try_charge
      0.07 =C2=B1 12%      -0.0        0.05        perf-profile.self.cycles=
-pp.__percpu_counter_sum
      0.07            -0.0        0.06        perf-profile.self.cycles-pp.x=
fs_dir3_data_get_ftype
      0.06 =C2=B1 17%      +0.0        0.08 =C2=B1 12%  perf-profile.self.c=
ycles-pp.__hrtimer_run_queues
      0.36 =C2=B1  4%      +0.0        0.39 =C2=B1  2%  perf-profile.self.c=
ycles-pp.xas_store
      0.05 =C2=B1 58%      +0.0        0.08 =C2=B1  6%  perf-profile.self.c=
ycles-pp.xfs_agino_range
      0.47 =C2=B1  3%      +0.0        0.51        perf-profile.self.cycles=
-pp.__list_del_entry_valid
      0.25 =C2=B1 11%      +0.0        0.29 =C2=B1  6%  perf-profile.self.c=
ycles-pp.__alloc_pages_nodemask
      0.04 =C2=B1 58%      +0.0        0.08 =C2=B1 12%  perf-profile.self.c=
ycles-pp.uncharge_page
      0.42 =C2=B1  8%      +0.0        0.46        perf-profile.self.cycles=
-pp.__x86_indirect_thunk_rax
      0.41 =C2=B1  4%      +0.0        0.46        perf-profile.self.cycles=
-pp.__mark_inode_dirty
      0.32 =C2=B1  5%      +0.0        0.36 =C2=B1  5%  perf-profile.self.c=
ycles-pp.entry_SYSCALL_64_after_hwframe
      0.11 =C2=B1 10%      +0.0        0.15 =C2=B1  6%  perf-profile.self.c=
ycles-pp.delay_tsc
      0.08 =C2=B1 23%      +0.1        0.13 =C2=B1  7%  perf-profile.self.c=
ycles-pp.__lru_cache_add
      0.47 =C2=B1  6%      +0.1        0.53 =C2=B1  4%  perf-profile.self.c=
ycles-pp.iov_iter_fault_in_readable
      0.41 =C2=B1  3%      +0.1        0.47 =C2=B1  5%  perf-profile.self.c=
ycles-pp._raw_spin_lock
      0.31 =C2=B1 10%      +0.1        0.38 =C2=B1  5%  perf-profile.self.c=
ycles-pp.new_sync_write
      0.32 =C2=B1  4%      +0.1        0.40 =C2=B1  3%  perf-profile.self.c=
ycles-pp.__fsnotify_parent
      0.57 =C2=B1 13%      +0.1        0.66 =C2=B1  6%  perf-profile.self.c=
ycles-pp.xfs_iext_lookup_extent
      0.55 =C2=B1  8%      +0.1        0.65 =C2=B1  5%  perf-profile.self.c=
ycles-pp.iomap_write_actor
      1.08 =C2=B1  9%      +0.5        1.56 =C2=B1  2%  perf-profile.self.c=
ycles-pp.xfs_file_write_iter



***************************************************************************=
************************
lkp-hsw-4ex1: 144 threads Intel(R) Xeon(R) CPU E7-8890 v3 @ 2.50GHz with 51=
2G memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/iterations/kconfig/nr_task/rootfs/tbox_group/test=
/testcase/ucode:
  gcc-7/performance/20/x86_64-rhel-7.6/1600%/debian-x86_64-2019-05-14.cgz/l=
kp-hsw-4ex1/aim9/reaim/0x14

commit: =

  4f23dbc1e6 ("locking/rwsem: Implement lock handoff to prevent lock starva=
tion")
  00f3c5a3df ("locking/rwsem: Always release wait_lock before waking up tas=
ks")

4f23dbc1e657951e 00f3c5a3df2c1e3dab14d0dd2b7 =

---------------- --------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

          1:4          -25%            :2     dmesg.WARNING:at#for_ip_inter=
rupt_entry/0x
          0:4           -4%           0:2     perf-profile.children.cycles-=
pp.error_entry
          0:4           -3%           0:2     perf-profile.self.cycles-pp.e=
rror_entry
         %stddev     %change         %stddev
             \          |                \  =

      1589            -1.6%       1564        reaim.child_utime
     92.73            +3.1%      95.62        reaim.jti
      6.68 =C2=B1 20%     -39.9%       4.02 =C2=B1  4%  reaim.std_dev_perce=
nt
      2.29 =C2=B1 25%     -37.7%       1.43 =C2=B1  2%  reaim.std_dev_time
   9735811 =C2=B1  5%     -20.4%    7751707        reaim.time.involuntary_c=
ontext_switches
      4456            +2.0%       4544        reaim.time.maximum_resident_s=
et_size
 9.237e+08            +1.4%  9.371e+08        reaim.time.minor_page_faults
     31822            -1.6%      31324        reaim.time.user_time
  39972125 =C2=B1  3%      +7.1%   42816711        reaim.time.voluntary_con=
text_switches
      5363 =C2=B1  9%     -12.5%       4693        boot-time.idle
     18335 =C2=B1 68%     -98.1%     355.00        numa-numastat.node0.othe=
r_node
    866.09 =C2=B1  3%      +4.9%     908.47        pmeter.Average_Active_Po=
wer
    374417 =C2=B1  9%     -25.0%     280892 =C2=B1  5%  meminfo.DirectMap4k
    244169 =C2=B1  3%      +9.3%     266898 =C2=B1  2%  meminfo.PageTables
      0.08 =C2=B1 16%      -0.0        0.04 =C2=B1  2%  mpstat.cpu.all.iowa=
it%
      0.02 =C2=B1 10%      +0.0        0.02 =C2=B1  8%  mpstat.cpu.all.soft%
      2.67 =C2=B1 17%     +68.8%       4.50 =C2=B1 11%  vmstat.procs.b
    102516 =C2=B1  5%     +15.0%     117851        vmstat.system.cs
    306586 =C2=B1  9%     -14.3%     262885 =C2=B1  2%  softirqs.CPU133.TIM=
ER
    301177 =C2=B1 10%     -14.4%     257932 =C2=B1  2%  softirqs.CPU134.TIM=
ER
    348974 =C2=B1 20%     -25.6%     259770 =C2=B1  2%  softirqs.CPU61.TIMER
    299486 =C2=B1  9%     -15.4%     253362        softirqs.CPU64.TIMER
     80298 =C2=B1  3%      +9.2%      87708 =C2=B1  3%  softirqs.CPU94.NET_=
RX
     27.45 =C2=B1  4%      -5.2       22.24 =C2=B1 11%  turbostat.C6%
      0.85 =C2=B1107%    +292.7%       3.32 =C2=B1 90%  turbostat.CPU%c3
     16.26 =C2=B1  4%     -43.9%       9.12 =C2=B1 34%  turbostat.CPU%c6
     52.33 =C2=B1  4%     +11.8%      58.50        turbostat.CoreTmp
     11.62 =C2=B1  7%     -30.6%       8.06 =C2=B1  2%  turbostat.Pkg%pc2
      0.59 =C2=B1 17%     -61.0%       0.23 =C2=B1100%  turbostat.Pkg%pc6
     56.67 =C2=B1  3%      +8.5%      61.50        turbostat.PkgTmp
    496.32 =C2=B1  3%      +6.4%     528.04        turbostat.PkgWatt
     72.66            +4.6%      76.01        turbostat.RAMWatt
     10083 =C2=B1  3%     +50.5%      15171 =C2=B1 28%  numa-vmstat.node0.n=
r_slab_reclaimable
     19593 =C2=B1 64%     -93.1%       1353 =C2=B1 30%  numa-vmstat.node0.n=
uma_other
    126905 =C2=B1  7%     -14.4%     108652        numa-vmstat.node1.nr_fil=
e_pages
     22060 =C2=B1 13%     +42.3%      31389 =C2=B1 26%  numa-vmstat.node1.n=
r_kernel_stack
     11946 =C2=B1 13%     +48.1%      17697 =C2=B1 25%  numa-vmstat.node1.n=
r_page_table_pages
     62212 =C2=B1  8%     -32.9%      41751        numa-vmstat.node1.nr_shm=
em
     51065 =C2=B1 15%     -18.8%      41449 =C2=B1  4%  numa-vmstat.node2.n=
r_shmem
    152702 =C2=B1 12%     +20.5%     184056 =C2=B1  6%  numa-vmstat.node3.n=
r_active_anon
     95312 =C2=B1 15%     +34.3%     128000        numa-vmstat.node3.nr_ano=
n_pages
     47.00 =C2=B1 51%    +124.5%     105.50 =C2=B1 22%  numa-vmstat.node3.n=
r_dirtied
     47.00 =C2=B1 51%    +124.5%     105.50 =C2=B1 22%  numa-vmstat.node3.n=
r_written
    152702 =C2=B1 12%     +20.5%     184051 =C2=B1  6%  numa-vmstat.node3.n=
r_zone_active_anon
  17552894        +1.7e+06    19268273        syscalls.sys_close.noise.2%
  15759501 =C2=B1  2%  +1.9e+06    17627007        syscalls.sys_close.noise=
.25%
  17442873        +1.7e+06    19155505        syscalls.sys_close.noise.5%
  13169085 =C2=B1  2%  +1.9e+06    15084330        syscalls.sys_close.noise=
.50%
  10857762 =C2=B1  5%  +1.1e+06    11964287 =C2=B1  3%  syscalls.sys_close.=
noise.75%
 1.219e+09 =C2=B1 93%     -93.4%   80431405 =C2=B1 21%  syscalls.sys_read.m=
ax
 2.569e+09 =C2=B1123%  -2.3e+09   2.578e+08 =C2=B1 10%  syscalls.sys_read.n=
oise.100%
 2.596e+09 =C2=B1122%  -2.3e+09    2.88e+08 =C2=B1  9%  syscalls.sys_read.n=
oise.2%
 2.591e+09 =C2=B1122%  -2.3e+09   2.817e+08 =C2=B1 10%  syscalls.sys_read.n=
oise.25%
 2.596e+09 =C2=B1122%  -2.3e+09   2.878e+08 =C2=B1  9%  syscalls.sys_read.n=
oise.5%
 2.581e+09 =C2=B1123%  -2.3e+09    2.71e+08 =C2=B1 10%  syscalls.sys_read.n=
oise.50%
 2.574e+09 =C2=B1123%  -2.3e+09   2.622e+08 =C2=B1 10%  syscalls.sys_read.n=
oise.75%
    399915 =C2=B1  3%      +9.9%     439446        proc-vmstat.nr_anon_pages
    176.67 =C2=B1  3%      +6.1%     187.50        proc-vmstat.nr_dirtied
    487035 =C2=B1  5%      -6.0%     457770        proc-vmstat.nr_file_pages
    110310 =C2=B1  3%      +7.8%     118870        proc-vmstat.nr_kernel_st=
ack
      6819 =C2=B1  2%      +3.8%       7080        proc-vmstat.nr_mapped
     60748 =C2=B1  3%      +9.9%      66752 =C2=B1  2%  proc-vmstat.nr_page=
_table_pages
    231076 =C2=B1 11%     -12.5%     202112        proc-vmstat.nr_shmem
    118658            +2.4%     121531        proc-vmstat.nr_slab_unreclaim=
able
    175.33 =C2=B1  3%      +7.2%     188.00        proc-vmstat.nr_written
    226291 =C2=B1 21%     -32.6%     152628 =C2=B1  3%  proc-vmstat.numa_hi=
nt_faults
    175326 =C2=B1 20%     -30.7%     121440        proc-vmstat.numa_pages_m=
igrated
 9.266e+08            +1.4%  9.397e+08        proc-vmstat.pgfault
    175326 =C2=B1 20%     -30.7%     121440        proc-vmstat.pgmigrate_su=
ccess
     40337 =C2=B1  3%     +50.6%      60759 =C2=B1 28%  numa-meminfo.node0.=
KReclaimable
      8745 =C2=B1 28%     +26.4%      11057 =C2=B1  3%  numa-meminfo.node0.=
Mapped
     40337 =C2=B1  3%     +50.6%      60759 =C2=B1 28%  numa-meminfo.node0.=
SReclaimable
     31869 =C2=B1 79%    -100.0%       0.00        numa-meminfo.node1.AnonH=
ugePages
    508265 =C2=B1  7%     -14.6%     434111        numa-meminfo.node1.FileP=
ages
     22056 =C2=B1 13%     +41.2%      31138 =C2=B1 25%  numa-meminfo.node1.=
KernelStack
     47686 =C2=B1 13%     +47.1%      70141 =C2=B1 25%  numa-meminfo.node1.=
PageTables
    249498 =C2=B1  8%     -33.3%     166508        numa-meminfo.node1.Shmem
    204458 =C2=B1 13%     -19.1%     165313 =C2=B1  5%  numa-meminfo.node2.=
Shmem
    613353 =C2=B1 12%     +19.6%     733539 =C2=B1  6%  numa-meminfo.node3.=
Active
    613302 =C2=B1 12%     +19.6%     733387 =C2=B1  6%  numa-meminfo.node3.=
Active(anon)
     48847 =C2=B1 73%    +189.7%     141490 =C2=B1  2%  numa-meminfo.node3.=
AnonHugePages
    382035 =C2=B1 15%     +33.5%     510087        numa-meminfo.node3.AnonP=
ages
      5411            +7.5%       5817 =C2=B1  4%  numa-meminfo.node3.Mapped
    171762 =C2=B1 27%     +41.6%     243282 =C2=B1  2%  slabinfo.Acpi-Parse=
.active_objs
      2382 =C2=B1 27%     +41.9%       3380 =C2=B1  2%  slabinfo.Acpi-Parse=
.active_slabs
    173961 =C2=B1 27%     +41.9%     246813 =C2=B1  2%  slabinfo.Acpi-Parse=
.num_objs
      2382 =C2=B1 27%     +41.9%       3380 =C2=B1  2%  slabinfo.Acpi-Parse=
.num_slabs
    987.67 =C2=B1  2%     +19.1%       1176        slabinfo.biovec-128.acti=
ve_objs
    987.67 =C2=B1  2%     +19.1%       1176        slabinfo.biovec-128.num_=
objs
      1358 =C2=B1  8%     -14.9%       1155        slabinfo.kmalloc-rcl-96.=
active_objs
      1358 =C2=B1  8%     -14.9%       1155        slabinfo.kmalloc-rcl-96.=
num_objs
    191139 =C2=B1  8%     -28.7%     136191 =C2=B1  6%  slabinfo.lsm_file_c=
ache.active_objs
    746.00 =C2=B1  8%     -28.8%     531.50 =C2=B1  6%  slabinfo.lsm_file_c=
ache.active_slabs
    191139 =C2=B1  8%     -28.7%     136191 =C2=B1  6%  slabinfo.lsm_file_c=
ache.num_objs
    746.00 =C2=B1  8%     -28.8%     531.50 =C2=B1  6%  slabinfo.lsm_file_c=
ache.num_slabs
      1638 =C2=B1  7%     +15.0%       1883 =C2=B1  6%  slabinfo.nfs_read_d=
ata.active_objs
      1638 =C2=B1  7%     +15.0%       1883 =C2=B1  6%  slabinfo.nfs_read_d=
ata.num_objs
    767.69 =C2=B1 15%     +28.1%     983.45 =C2=B1  4%  sched_debug.cfs_rq:=
/.exec_clock.stddev
      0.31 =C2=B1  5%     +19.5%       0.37        sched_debug.cfs_rq:/.nr_=
running.stddev
     13.37 =C2=B1  8%     -16.3%      11.19 =C2=B1  3%  sched_debug.cfs_rq:=
/.removed.load_avg.avg
    716.88 =C2=B1 16%     +19.6%     857.73 =C2=B1  3%  sched_debug.cfs_rq:=
/.removed.load_avg.max
    611.11 =C2=B1  7%     -15.6%     515.87 =C2=B1  3%  sched_debug.cfs_rq:=
/.removed.runnable_sum.avg
     33176 =C2=B1 16%     +19.6%      39678 =C2=B1  3%  sched_debug.cfs_rq:=
/.removed.runnable_sum.max
      2.24 =C2=B1 21%     -44.5%       1.24 =C2=B1 14%  sched_debug.cfs_rq:=
/.removed.util_avg.avg
     16.35 =C2=B1 12%     -29.0%      11.62 =C2=B1 16%  sched_debug.cfs_rq:=
/.removed.util_avg.stddev
      5.39 =C2=B1  9%     -32.7%       3.63        sched_debug.cfs_rq:/.run=
nable_load_avg.avg
    369.63 =C2=B1 29%     -44.1%     206.73 =C2=B1  8%  sched_debug.cfs_rq:=
/.runnable_load_avg.max
     36.03 =C2=B1 19%     -41.6%      21.04        sched_debug.cfs_rq:/.run=
nable_load_avg.stddev
    225.53 =C2=B1  4%     +34.9%     304.13 =C2=B1  3%  sched_debug.cfs_rq:=
/.util_avg.min
    228.37 =C2=B1  5%     -12.8%     199.11        sched_debug.cfs_rq:/.uti=
l_avg.stddev
     66833 =C2=B1 10%     +72.7%     115413 =C2=B1  2%  sched_debug.cpu.avg=
_idle.min
      5.81 =C2=B1 22%     -35.2%       3.76 =C2=B1  8%  sched_debug.cpu.cpu=
_load[0].avg
    445.72 =C2=B1 16%     -25.6%     331.77 =C2=B1  4%  sched_debug.cpu.cpu=
_load[0].max
     42.06 =C2=B1 20%     -32.8%      28.27 =C2=B1  5%  sched_debug.cpu.cpu=
_load[0].stddev
      5.69 =C2=B1 19%     -35.5%       3.67 =C2=B1  5%  sched_debug.cpu.cpu=
_load[1].avg
    337.12 =C2=B1 10%     -25.8%     250.03 =C2=B1  5%  sched_debug.cpu.cpu=
_load[1].max
     32.57 =C2=B1 14%     -32.0%      22.16 =C2=B1  3%  sched_debug.cpu.cpu=
_load[1].stddev
      5.52 =C2=B1 16%     -34.0%       3.65        sched_debug.cpu.cpu_load=
[2].avg
    257.90 =C2=B1  6%     -22.0%     201.17 =C2=B1 12%  sched_debug.cpu.cpu=
_load[2].max
     26.25 =C2=B1  9%     -27.9%      18.93 =C2=B1  8%  sched_debug.cpu.cpu=
_load[2].stddev
      5.15 =C2=B1 14%     -33.3%       3.43        sched_debug.cpu.cpu_load=
[3].avg
     19.84 =C2=B1  7%     -23.9%      15.10 =C2=B1 11%  sched_debug.cpu.cpu=
_load[3].stddev
      4.52 =C2=B1 14%     -32.9%       3.03 =C2=B1  2%  sched_debug.cpu.cpu=
_load[4].avg
     28161 =C2=B1  5%      +9.7%      30894 =C2=B1  4%  sched_debug.cpu.cur=
r->pid.stddev
    597.66 =C2=B1 39%    +150.9%       1499 =C2=B1 26%  sched_debug.cpu.max=
_idle_balance_cost.stddev
      6.97 =C2=B1  5%     +19.7%       8.35        sched_debug.cpu.nr_unint=
erruptible.avg
    385919 =C2=B1  5%      +9.4%     422383 =C2=B1  6%  sched_debug.cpu.sch=
ed_count.max
    104453 =C2=B1  7%     +21.8%     127211        sched_debug.cpu.sched_go=
idle.avg
    110916 =C2=B1  7%     +19.5%     132580        sched_debug.cpu.sched_go=
idle.max
    100330 =C2=B1  7%     +22.9%     123301        sched_debug.cpu.sched_go=
idle.min
    157482 =C2=B1  4%     +13.6%     178917        sched_debug.cpu.ttwu_cou=
nt.avg
    163535 =C2=B1  4%     +13.5%     185634        sched_debug.cpu.ttwu_cou=
nt.max
    152786 =C2=B1  5%     +14.1%     174393        sched_debug.cpu.ttwu_cou=
nt.min
    673.39 =C2=B1  6%     -20.9%     532.74 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.stddev
     15.49 =C2=B1 17%     -32.2%      10.50 =C2=B1  5%  perf-stat.i.MPKI
 2.531e+10 =C2=B1  7%      +6.3%  2.692e+10        perf-stat.i.branch-instr=
uctions
      2.16 =C2=B1 19%      -0.7        1.46 =C2=B1  4%  perf-stat.i.branch-=
miss-rate%
 2.407e+08 =C2=B1  7%      +6.3%  2.559e+08        perf-stat.i.branch-misses
      7.10 =C2=B1  3%      +1.1        8.17        perf-stat.i.cache-miss-r=
ate%
  88290679 =C2=B1  7%     +13.3%      1e+08        perf-stat.i.cache-misses
 1.015e+09 =C2=B1  7%      +7.1%  1.087e+09        perf-stat.i.cache-refere=
nces
    103162 =C2=B1  5%     +14.9%     118526        perf-stat.i.context-swit=
ches
      2.68 =C2=B1 13%     -23.2%       2.05        perf-stat.i.cpi
     35426 =C2=B1  6%     +15.7%      40979        perf-stat.i.cpu-migratio=
ns
     10332 =C2=B1 27%     -45.3%       5653 =C2=B1  4%  perf-stat.i.cycles-=
between-cache-misses
      0.39 =C2=B1  7%      -0.1        0.31 =C2=B1 12%  perf-stat.i.dTLB-lo=
ad-miss-rate%
 4.634e+10 =C2=B1  7%      +6.3%  4.926e+10        perf-stat.i.dTLB-loads
      0.12 =C2=B1  3%      -0.0        0.11        perf-stat.i.dTLB-store-m=
iss-rate%
   7036966 =C2=B1  7%      +8.8%    7657668        perf-stat.i.iTLB-loads
 1.595e+11 =C2=B1  7%      +6.3%  1.695e+11        perf-stat.i.instructions
      7596           +11.9%       8503        perf-stat.i.instructions-per-=
iTLB-miss
      0.53 =C2=B1  2%      +7.9%       0.57        perf-stat.i.ipc
  50913654 =C2=B1  7%     +15.4%   58779174        perf-stat.i.node-load-mi=
sses
  16212935 =C2=B1  7%     +11.2%   18030635        perf-stat.i.node-loads
  10815686 =C2=B1  7%     +10.5%   11953107        perf-stat.i.node-store-m=
isses
   9536170 =C2=B1  7%      +7.9%   10287859        perf-stat.i.node-stores
      8.69            +0.5        9.20        perf-stat.overall.cache-miss-=
rate%
      1.68            -1.8%       1.65        perf-stat.overall.cpi
      3030            -7.9%       2789        perf-stat.overall.cycles-betw=
een-cache-misses
      0.11 =C2=B1  3%      -0.0        0.10        perf-stat.overall.dTLB-s=
tore-miss-rate%
     72.17            -1.6       70.56        perf-stat.overall.iTLB-load-m=
iss-rate%
      8739 =C2=B1  2%      +5.7%       9236        perf-stat.overall.instru=
ctions-per-iTLB-miss
      0.60            +1.9%       0.61        perf-stat.overall.ipc
     75.84            +0.7       76.52        perf-stat.overall.node-load-m=
iss-rate%
     53.12            +0.6       53.73        perf-stat.overall.node-store-=
miss-rate%
 2.523e+10 =C2=B1  7%      +6.4%  2.685e+10        perf-stat.ps.branch-inst=
ructions
   2.4e+08 =C2=B1  7%      +6.4%  2.553e+08        perf-stat.ps.branch-miss=
es
  87961660 =C2=B1  7%     +13.4%   99747792        perf-stat.ps.cache-misses
 1.012e+09 =C2=B1  7%      +7.2%  1.084e+09        perf-stat.ps.cache-refer=
ences
    102771 =C2=B1  5%     +15.0%     118185        perf-stat.ps.context-swi=
tches
     35287 =C2=B1  6%     +15.8%      40858        perf-stat.ps.cpu-migrati=
ons
 4.619e+10 =C2=B1  7%      +6.4%  4.914e+10        perf-stat.ps.dTLB-loads
   7013138 =C2=B1  7%      +8.9%    7637838        perf-stat.ps.iTLB-loads
  1.59e+11 =C2=B1  7%      +6.4%  1.691e+11        perf-stat.ps.instructions
  50716358 =C2=B1  7%     +15.6%   58608142        perf-stat.ps.node-load-m=
isses
  16157092 =C2=B1  7%     +11.3%   17983416        perf-stat.ps.node-loads
  10773759 =C2=B1  7%     +10.6%   11918485        perf-stat.ps.node-store-=
misses
   9505149 =C2=B1  7%      +8.0%   10262547        perf-stat.ps.node-stores
      1.62 =C2=B1 36%      -1.3        0.28 =C2=B1100%  perf-profile.calltr=
ace.cycles-pp.ftrace_syscall_enter.syscall_trace_enter.do_syscall_64.entry_=
SYSCALL_64_after_hwframe
      1.96 =C2=B1 30%      -1.2        0.75 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.syscall_trace_enter.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame
      5.10 =C2=B1 16%      -1.2        3.92        perf-profile.calltrace.c=
ycles-pp.__generic_file_write_iter.generic_file_write_iter.new_sync_write.v=
fs_write.ksys_write
      4.84 =C2=B1 16%      -1.1        3.72        perf-profile.calltrace.c=
ycles-pp.generic_perform_write.__generic_file_write_iter.generic_file_write=
_iter.new_sync_write.vfs_write
      1.56 =C2=B1 33%      -1.0        0.59        perf-profile.calltrace.c=
ycles-pp.syscall_slow_exit_work.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.36 =C2=B1 38%      +0.6        1.96        perf-profile.calltrace.c=
ycles-pp.filemap_map_pages.__handle_mm_fault.handle_mm_fault.__do_page_faul=
t.do_page_fault
      0.00            +0.6        0.65 =C2=B1  9%  perf-profile.calltrace.c=
ycles-pp.down_write.__vma_adjust.__split_vma.__do_munmap.mmap_region
      0.00            +0.6        0.65 =C2=B1  9%  perf-profile.calltrace.c=
ycles-pp.rwsem_down_write_slowpath.down_write.__vma_adjust.__split_vma.__do=
_munmap
      0.00            +0.7        0.69 =C2=B1  8%  perf-profile.calltrace.c=
ycles-pp.__vma_adjust.__split_vma.__do_munmap.mmap_region.do_mmap
      0.00            +0.7        0.69 =C2=B1  8%  perf-profile.calltrace.c=
ycles-pp.__split_vma.__do_munmap.mmap_region.do_mmap.vm_mmap_pgoff
      2.64 =C2=B1 33%      +0.7        3.33 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.__handle_mm_fault.handle_mm_fault.__do_page_fault.do_page_fau=
lt.page_fault
      2.71 =C2=B1 33%      +0.7        3.42 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      0.36 =C2=B1 70%      +0.9        1.28 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.rwsem_down_write_slowpath.down_write.unlink_file_vma.free_pgt=
ables.unmap_region
      0.36 =C2=B1 70%      +0.9        1.29 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.down_write.unlink_file_vma.free_pgtables.unmap_region.__do_mu=
nmap
      0.36 =C2=B1 70%      +0.9        1.30 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.unlink_file_vma.free_pgtables.unmap_region.__do_munmap.mmap_r=
egion
      0.38 =C2=B1 70%      +1.0        1.34 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.free_pgtables.unmap_region.__do_munmap.mmap_region.do_mmap
      0.42 =C2=B1 70%      +1.0        1.39 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.unmap_region.__do_munmap.mmap_region.do_mmap.vm_mmap_pgoff
      1.12 =C2=B1 34%      +1.0        2.13 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.osq_lock.rwsem_down_write_slowpath.down_write.vma_link.mmap_r=
egion
      2.79 =C2=B1 30%      +1.1        3.84 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.flush_old_exec.load_elf_binary.search_binary_handler.__do_exe=
cve_file.__x64_sys_execve
      2.77 =C2=B1 30%      +1.1        3.83 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.mmput.flush_old_exec.load_elf_binary.search_binary_handler.__=
do_execve_file
      1.16 =C2=B1 35%      +1.1        2.21 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.down_write.vma_link.mmap_region.do_mmap.vm_mmap_pgoff
      1.15 =C2=B1 34%      +1.1        2.21 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.rwsem_down_write_slowpath.down_write.vma_link.mmap_region.do_=
mmap
      1.29 =C2=B1 34%      +1.1        2.37 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.vma_link.mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff
      1.08 =C2=B1 39%      +1.3        2.43 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.rwsem_down_write_slowpath.down_write.__vma_adjust.__split_vma=
.mprotect_fixup
      1.10 =C2=B1 38%      +1.4        2.45 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.down_write.__vma_adjust.__split_vma.mprotect_fixup.do_mprotec=
t_pkey
      1.29 =C2=B1 37%      +1.4        2.69 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.__split_vma.mprotect_fixup.do_mprotect_pkey.__x64_sys_mprotec=
t.do_syscall_64
      1.27 =C2=B1 37%      +1.4        2.67 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.__vma_adjust.__split_vma.mprotect_fixup.do_mprotect_pkey.__x6=
4_sys_mprotect
      1.36 =C2=B1 37%      +1.4        2.77 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.__x64_sys_mprotect.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me
      1.36 =C2=B1 37%      +1.4        2.77 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.do_mprotect_pkey.__x64_sys_mprotect.do_syscall_64.entry_SYSCA=
LL_64_after_hwframe
      1.34 =C2=B1 37%      +1.4        2.75 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.mprotect_fixup.do_mprotect_pkey.__x64_sys_mprotect.do_syscall=
_64.entry_SYSCALL_64_after_hwframe
      2.96 =C2=B1 37%      +1.4        4.39 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.free_pgtables.exit_mmap.mmput.flush_old_exec.load_elf_binary
      0.64 =C2=B1 70%      +1.4        2.09 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.__do_munmap.mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff
      3.32 =C2=B1 37%      +1.5        4.79 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.exit_mmap.mmput.flush_old_exec.load_elf_binary.search_binary_=
handler
      2.58 =C2=B1 31%      +1.5        4.11 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.unlink_file_vma.free_pgtables.exit_mmap.mmput.flush_old_exec
      0.87 =C2=B1 71%      +2.1        2.96 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.osq_lock.rwsem_down_write_slowpath.down_write.__vma_adjust.__=
split_vma
      2.20 =C2=B1 37%      +2.4        4.62 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.16 =C2=B1 37%      +2.4        4.59 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYS=
CALL_64_after_hwframe
      2.19 =C2=B1 37%      +2.4        4.62 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_=
after_hwframe
      2.12 =C2=B1 37%      +2.4        4.55 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_=
64
     10.81 =C2=B1 51%      +8.5       19.27 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.free_pgtables.exit_mmap.mmput.do_exit.do_group_exit
     12.55 =C2=B1 49%      +8.7       21.27 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.dup_mm.copy_process._do_fork.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe
     13.39 =C2=B1 48%      +8.8       22.17 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.copy_process._do_fork.do_syscall_64.entry_SYSCALL_64_after_hw=
frame
     13.62 =C2=B1 48%      +8.8       22.43 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp._do_fork.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.40 =C2=B1 39%      +9.0       17.41 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.osq_lock.rwsem_down_write_slowpath.down_write.dup_mm.copy_pro=
cess
     12.77 =C2=B1 51%      +9.2       21.96 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.exit_mmap.mmput.do_exit.do_group_exit.__x64_sys_exit_group
     12.78 =C2=B1 51%      +9.2       21.98 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.mmput.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      8.56 =C2=B1 40%      +9.3       17.88 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.rwsem_down_write_slowpath.down_write.dup_mm.copy_process._do_=
fork
      8.63 =C2=B1 40%      +9.4       17.98 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.down_write.dup_mm.copy_process._do_fork.do_syscall_64
     13.46 =C2=B1 51%      +9.4       22.87 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
     13.46 =C2=B1 51%      +9.4       22.87 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.do_group_exit.__x64_sys_exit_group.do_syscall_64.entry_SYSCAL=
L_64_after_hwframe
     13.46 =C2=B1 51%      +9.4       22.88 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame
      8.45 =C2=B1 44%      +9.6       18.02 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.unlink_file_vma.free_pgtables.exit_mmap.mmput.do_exit
     10.85 =C2=B1 40%     +11.0       21.84 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.rwsem_down_write_slowpath.down_write.unlink_file_vma.free_pgt=
ables.exit_mmap
     10.94 =C2=B1 40%     +11.0       21.97 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.down_write.unlink_file_vma.free_pgtables.exit_mmap.mmput
     10.75 =C2=B1 41%     +11.7       22.43 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.osq_lock.rwsem_down_write_slowpath.down_write.unlink_file_vma=
.free_pgtables
      6.37 =C2=B1 66%      -4.6        1.77 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.apic_timer_interrupt
      6.00 =C2=B1 66%      -4.3        1.71 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.smp_apic_timer_interrupt
      4.04 =C2=B1 68%      -2.9        1.12        perf-profile.children.cy=
cles-pp.hrtimer_interrupt
      2.89 =C2=B1 59%      -1.9        0.99        perf-profile.children.cy=
cles-pp.__hrtimer_run_queues
      1.89 =C2=B1 91%      -1.8        0.07 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.menu_select
      1.97 =C2=B1 30%      -1.2        0.76 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.syscall_trace_enter
      4.86 =C2=B1 16%      -1.1        3.74        perf-profile.children.cy=
cles-pp.generic_perform_write
      1.64 =C2=B1 35%      -1.1        0.53 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.ftrace_syscall_enter
      1.22 =C2=B1 58%      -1.1        0.17 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.trace_buffer_lock_reserve
      1.89 =C2=B1 48%      -1.0        0.86        perf-profile.children.cy=
cles-pp.tick_sched_timer
      1.57 =C2=B1 32%      -1.0        0.60        perf-profile.children.cy=
cles-pp.syscall_slow_exit_work
      1.39 =C2=B1 37%      -0.9        0.46 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.ftrace_syscall_exit
      1.71 =C2=B1 44%      -0.9        0.84        perf-profile.children.cy=
cles-pp.tick_sched_handle
      0.97 =C2=B1 61%      -0.9        0.11 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.ring_buffer_lock_reserve
      0.86 =C2=B1 95%      -0.8        0.06 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.ktime_get
      1.59 =C2=B1 40%      -0.8        0.83        perf-profile.children.cy=
cles-pp.update_process_times
      1.30 =C2=B1 48%      -0.8        0.54 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.irq_exit
      0.70 =C2=B1 91%      -0.6        0.07 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.clockevents_program_event
      1.08 =C2=B1 31%      -0.5        0.59 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.__softirqentry_text_start
      0.41 =C2=B1 83%      -0.4        0.03 =C2=B1100%  perf-profile.childr=
en.cycles-pp.perf_mux_hrtimer_handler
      1.08 =C2=B1 20%      -0.3        0.73 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.scheduler_tick
      0.32 =C2=B1 82%      -0.3        0.03 =C2=B1100%  perf-profile.childr=
en.cycles-pp.native_write_msr
      0.33 =C2=B1 67%      -0.3        0.06 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.rebalance_domains
      0.41 =C2=B1 37%      -0.2        0.21 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.native_irq_return_iret
      0.60 =C2=B1 17%      -0.2        0.41 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.iov_iter_copy_from_user_atomic
      0.38 =C2=B1 26%      -0.2        0.20 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.__x86_indirect_thunk_rax
      0.51 =C2=B1 15%      -0.2        0.34 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.copyin
      0.24 =C2=B1 35%      -0.1        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.memcpy_erms
      0.30 =C2=B1 33%      -0.1        0.18        perf-profile.children.cy=
cles-pp.elf_map
      0.15 =C2=B1 45%      -0.1        0.04 =C2=B1100%  perf-profile.childr=
en.cycles-pp.run_rebalance_domains
      0.41 =C2=B1 14%      -0.1        0.30 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.shmem_alloc_page
      0.18 =C2=B1 44%      -0.1        0.08        perf-profile.children.cy=
cles-pp._raw_spin_unlock_irqrestore
      0.15 =C2=B1 35%      -0.1        0.07 =C2=B1 28%  perf-profile.childr=
en.cycles-pp.update_blocked_averages
      0.23 =C2=B1  9%      -0.1        0.17 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.get_unmapped_area
      0.14 =C2=B1 22%      -0.1        0.09 =C2=B1 17%  perf-profile.childr=
en.cycles-pp.update_rq_clock
      0.15 =C2=B1 10%      -0.1        0.10 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.vfs_statx
      0.18 =C2=B1 14%      -0.0        0.14 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.__x64_sys_getdents
      0.18 =C2=B1 12%      -0.0        0.14 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.iterate_dir
      0.13 =C2=B1  6%      -0.0        0.10 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.__do_sys_newstat
      0.12 =C2=B1  6%      -0.0        0.08 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.sock_write_iter
      0.06            -0.0        0.03 =C2=B1100%  perf-profile.children.cy=
cles-pp.__ip_queue_xmit
      0.06            -0.0        0.03 =C2=B1100%  perf-profile.children.cy=
cles-pp.sock_read_iter
      0.12 =C2=B1 10%      -0.0        0.08 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.sock_sendmsg
      0.08            -0.0        0.05        perf-profile.children.cycles-=
pp.__x64_sys_kill
      0.08 =C2=B1  5%      -0.0        0.06 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.iov_iter_advance
      0.09 =C2=B1 10%      -0.0        0.06        perf-profile.children.cy=
cles-pp.__set_page_dirty_no_writeback
      0.08 =C2=B1  6%      -0.0        0.05        perf-profile.children.cy=
cles-pp.__x64_sys_write
      0.10 =C2=B1 12%      -0.0        0.07        perf-profile.children.cy=
cles-pp.do_signal
      0.09 =C2=B1 13%      -0.0        0.07        perf-profile.children.cy=
cles-pp.security_mmap_addr
      0.09 =C2=B1  9%      -0.0        0.07        perf-profile.children.cy=
cles-pp.arch_get_unmapped_area_topdown
      0.08 =C2=B1 17%      -0.0        0.06        perf-profile.children.cy=
cles-pp.fpregs_assert_state_consistent
      0.08 =C2=B1  6%      -0.0        0.06        perf-profile.children.cy=
cles-pp.ip_output
      0.07 =C2=B1  7%      -0.0        0.05        perf-profile.children.cy=
cles-pp.__tcp_transmit_skb
      0.04 =C2=B1 71%      +0.0        0.07        perf-profile.children.cy=
cles-pp.pipe_read
      0.02 =C2=B1141%      +0.0        0.06        perf-profile.children.cy=
cles-pp.pipe_wait
      0.07 =C2=B1 70%      +0.0        0.12        perf-profile.children.cy=
cles-pp.osq_unlock
      0.07 =C2=B1 71%      +0.1        0.14 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.dequeue_entity
      0.15 =C2=B1 35%      +0.1        0.22 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.__pte_alloc
      0.13 =C2=B1 39%      +0.1        0.19 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.put_cred_rcu
      0.07 =C2=B1 72%      +0.1        0.14 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.schedule_idle
      0.13 =C2=B1 73%      +0.1        0.27 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.do_task_dead
      0.50 =C2=B1  5%      +0.1        0.63 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.load_balance
      0.33 =C2=B1  8%      +0.2        0.49 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.find_busiest_group
      0.31 =C2=B1 12%      +0.2        0.48 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.update_sd_lb_stats
      0.72 =C2=B1 26%      +0.2        0.95 =C2=B1  2%  perf-profile.childr=
en.cycles-pp._raw_spin_lock_irqsave
      0.41 =C2=B1 37%      +0.2        0.64 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.schedule
      0.37 =C2=B1 49%      +0.3        0.69 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.pick_next_task_fair
      0.65 =C2=B1 42%      +0.4        1.05 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.__schedule
      0.34 =C2=B1 62%      +0.5        0.79        perf-profile.children.cy=
cles-pp.wake_up_q
      0.42 =C2=B1 59%      +0.5        0.88        perf-profile.children.cy=
cles-pp.rwsem_wake
      0.51 =C2=B1 53%      +0.5        0.99        perf-profile.children.cy=
cles-pp.try_to_wake_up
      1.39 =C2=B1 37%      +0.6        1.99        perf-profile.children.cy=
cles-pp.filemap_map_pages
      0.79 =C2=B1 35%      +0.8        1.63 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.unmap_region
      1.43 =C2=B1 33%      +1.0        2.42 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.vma_link
      1.22 =C2=B1 34%      +1.3        2.47 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.__do_munmap
      3.51 =C2=B1 30%      +1.3        4.80 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.flush_old_exec
      1.36 =C2=B1 37%      +1.4        2.77 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.__x64_sys_mprotect
      1.36 =C2=B1 37%      +1.4        2.77 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.do_mprotect_pkey
      1.35 =C2=B1 37%      +1.4        2.77 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.mprotect_fixup
      1.64 =C2=B1 37%      +1.8        3.47 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.__split_vma
      1.81 =C2=B1 35%      +1.8        3.65 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.__vma_adjust
      2.37 =C2=B1 35%      +2.4        4.72 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.vm_mmap_pgoff
      2.28 =C2=B1 36%      +2.4        4.64 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.mmap_region
      2.32 =C2=B1 36%      +2.4        4.69 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.do_mmap
      2.20 =C2=B1 37%      +2.4        4.62 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.ksys_mmap_pgoff
     12.55 =C2=B1 49%      +8.7       21.27 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.dup_mm
     13.39 =C2=B1 48%      +8.8       22.17 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.copy_process
     13.62 =C2=B1 48%      +8.8       22.43 =C2=B1  2%  perf-profile.childr=
en.cycles-pp._do_fork
     13.46 =C2=B1 51%      +9.4       22.87 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.do_group_exit
     13.46 =C2=B1 51%      +9.4       22.87 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.do_exit
     13.46 =C2=B1 51%      +9.4       22.88 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.__x64_sys_exit_group
     16.26 =C2=B1 46%     +10.5       26.75 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.exit_mmap
     16.27 =C2=B1 46%     +10.5       26.77 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.mmput
     14.39 =C2=B1 46%     +10.6       25.03 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.free_pgtables
     11.62 =C2=B1 38%     +11.8       23.45 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.unlink_file_vma
     26.18 =C2=B1 46%     +19.5       45.70 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.osq_lock
     27.24 =C2=B1 46%     +20.3       47.53 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.rwsem_down_write_slowpath
     27.66 =C2=B1 46%     +20.4       48.02 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.down_write
      0.32 =C2=B1 82%      -0.3        0.03 =C2=B1100%  perf-profile.self.c=
ycles-pp.native_write_msr
      0.34 =C2=B1 43%      -0.2        0.10 =C2=B1 10%  perf-profile.self.c=
ycles-pp.ring_buffer_lock_reserve
      0.66 =C2=B1  3%      -0.2        0.44 =C2=B1 11%  perf-profile.self.c=
ycles-pp.ftrace_syscall_enter
      0.41 =C2=B1 37%      -0.2        0.21 =C2=B1  4%  perf-profile.self.c=
ycles-pp.native_irq_return_iret
      0.34 =C2=B1 26%      -0.2        0.17 =C2=B1  5%  perf-profile.self.c=
ycles-pp.__x86_indirect_thunk_rax
      0.50 =C2=B1 15%      -0.1        0.35        perf-profile.self.cycles=
-pp.ftrace_syscall_exit
      0.23 =C2=B1 37%      -0.1        0.10        perf-profile.self.cycles=
-pp.memcpy_erms
      0.32 =C2=B1 11%      -0.1        0.22 =C2=B1  6%  perf-profile.self.c=
ycles-pp.syscall_trace_enter
      0.24 =C2=B1  7%      -0.1        0.18 =C2=B1 11%  perf-profile.self.c=
ycles-pp.get_page_from_freelist
      0.11 =C2=B1 25%      -0.0        0.07        perf-profile.self.cycles=
-pp.trace_buffer_lock_reserve
      0.13 =C2=B1 13%      -0.0        0.10 =C2=B1  5%  perf-profile.self.c=
ycles-pp.generic_file_write_iter
      0.13 =C2=B1 12%      -0.0        0.10        perf-profile.self.cycles=
-pp.generic_perform_write
      0.08 =C2=B1 10%      -0.0        0.05        perf-profile.self.cycles=
-pp.__set_page_dirty_no_writeback
      0.08 =C2=B1 10%      -0.0        0.06 =C2=B1  9%  perf-profile.self.c=
ycles-pp.ksys_write
      0.08 =C2=B1 10%      -0.0        0.06 =C2=B1  9%  perf-profile.self.c=
ycles-pp.__x64_sys_brk
      0.08 =C2=B1  6%      -0.0        0.06 =C2=B1  9%  perf-profile.self.c=
ycles-pp.iov_iter_advance
      0.09 =C2=B1 10%      -0.0        0.07 =C2=B1  7%  perf-profile.self.c=
ycles-pp.shmem_write_begin
      0.07 =C2=B1 11%      -0.0        0.05        perf-profile.self.cycles=
-pp.__fdget_pos
      0.07 =C2=B1 11%      -0.0        0.05        perf-profile.self.cycles=
-pp.file_update_time
      0.06 =C2=B1  7%      -0.0        0.05        perf-profile.self.cycles=
-pp.vma_merge
      0.03 =C2=B1 70%      +0.0        0.07 =C2=B1  7%  perf-profile.self.c=
ycles-pp.put_cred_rcu
      0.04 =C2=B1 71%      +0.0        0.08 =C2=B1  6%  perf-profile.self.c=
ycles-pp.vm_area_dup
      0.07 =C2=B1 71%      +0.0        0.11 =C2=B1  4%  perf-profile.self.c=
ycles-pp.osq_unlock
      0.00            +0.1        0.05        perf-profile.self.cycles-pp._=
_anon_vma_interval_tree_augment_rotate
      0.05 =C2=B1 74%      +0.1        0.11        perf-profile.self.cycles=
-pp.try_to_wake_up
      0.24 =C2=B1 17%      +0.1        0.38 =C2=B1  5%  perf-profile.self.c=
ycles-pp.update_sd_lb_stats
      0.39 =C2=B1 42%      +0.3        0.69        perf-profile.self.cycles=
-pp.rwsem_down_write_slowpath
      0.98 =C2=B1 39%      +0.5        1.48        perf-profile.self.cycles=
-pp.filemap_map_pages
     25.86 =C2=B1 46%     +19.3       45.15 =C2=B1  5%  perf-profile.self.c=
ycles-pp.osq_lock
    739.00 =C2=B1 42%     -39.4%     448.00 =C2=B1  2%  interrupts.51:PCI-M=
SI.1572870-edge.eth0-TxRx-6
    477.67 =C2=B1  9%    +245.7%       1651 =C2=B1  7%  interrupts.53:PCI-M=
SI.1572872-edge.eth0-TxRx-8
    683.00 =C2=B1 32%     -33.6%     453.50        interrupts.60:PCI-MSI.15=
72879-edge.eth0-TxRx-15
    499.67 =C2=B1  9%     -13.4%     432.50        interrupts.72:PCI-MSI.15=
72891-edge.eth0-TxRx-27
     24632 =C2=B1  6%     -12.4%      21588 =C2=B1  2%  interrupts.CPU0.RES=
:Rescheduling_interrupts
     22338 =C2=B1  4%     -12.9%      19463        interrupts.CPU1.RES:Resc=
heduling_interrupts
      2217 =C2=B1  9%     +12.7%       2498 =C2=B1  2%  interrupts.CPU1.TLB=
:TLB_shootdowns
     21081 =C2=B1  3%     -17.2%      17455 =C2=B1  2%  interrupts.CPU10.RE=
S:Rescheduling_interrupts
      2023 =C2=B1 11%     +14.2%       2311 =C2=B1  4%  interrupts.CPU10.TL=
B:TLB_shootdowns
     10088 =C2=B1  3%     -10.4%       9042 =C2=B1  2%  interrupts.CPU100.C=
AL:Function_call_interrupts
      2940 =C2=B1 84%     -99.5%      15.00 =C2=B1100%  interrupts.CPU100.N=
MI:Non-maskable_interrupts
      2940 =C2=B1 84%     -99.5%      15.00 =C2=B1100%  interrupts.CPU100.P=
MI:Performance_monitoring_interrupts
     21754           -18.6%      17712 =C2=B1  3%  interrupts.CPU100.RES:Re=
scheduling_interrupts
      2052 =C2=B1 11%     +17.6%       2413 =C2=B1  2%  interrupts.CPU100.T=
LB:TLB_shootdowns
      1161 =C2=B1 40%     -77.6%     260.00 =C2=B1100%  interrupts.CPU101.N=
MI:Non-maskable_interrupts
      1161 =C2=B1 40%     -77.6%     260.00 =C2=B1100%  interrupts.CPU101.P=
MI:Performance_monitoring_interrupts
     20386           -28.0%      14672        interrupts.CPU101.RES:Resched=
uling_interrupts
      2093 =C2=B1 13%     +16.0%       2428 =C2=B1  2%  interrupts.CPU101.T=
LB:TLB_shootdowns
     20075           -23.1%      15434        interrupts.CPU102.RES:Resched=
uling_interrupts
      1991 =C2=B1  9%     +20.3%       2396        interrupts.CPU102.TLB:TL=
B_shootdowns
     20283 =C2=B1  4%     -20.8%      16055        interrupts.CPU103.RES:Re=
scheduling_interrupts
     20393           -23.8%      15537        interrupts.CPU104.RES:Resched=
uling_interrupts
     20123           -23.5%      15401 =C2=B1  3%  interrupts.CPU105.RES:Re=
scheduling_interrupts
      2049 =C2=B1  9%     +17.4%       2405 =C2=B1  2%  interrupts.CPU105.T=
LB:TLB_shootdowns
     20391 =C2=B1  2%     -25.1%      15272 =C2=B1  5%  interrupts.CPU106.R=
ES:Rescheduling_interrupts
      2079 =C2=B1  6%     +18.2%       2457 =C2=B1  2%  interrupts.CPU106.T=
LB:TLB_shootdowns
     19707           -22.7%      15239 =C2=B1  5%  interrupts.CPU107.RES:Re=
scheduling_interrupts
      2143 =C2=B1  7%     +16.1%       2487 =C2=B1  3%  interrupts.CPU107.T=
LB:TLB_shootdowns
      3426 =C2=B1 68%     -99.7%      11.00 =C2=B1100%  interrupts.CPU108.N=
MI:Non-maskable_interrupts
      3426 =C2=B1 68%     -99.7%      11.00 =C2=B1100%  interrupts.CPU108.P=
MI:Performance_monitoring_interrupts
     21621           -18.6%      17600        interrupts.CPU108.RES:Resched=
uling_interrupts
      1947 =C2=B1 10%     +19.0%       2318        interrupts.CPU108.TLB:TL=
B_shootdowns
      2418 =C2=B1121%    +195.3%       7141        interrupts.CPU109.NMI:No=
n-maskable_interrupts
      2418 =C2=B1121%    +195.3%       7141        interrupts.CPU109.PMI:Pe=
rformance_monitoring_interrupts
     21399 =C2=B1  2%     -13.9%      18430 =C2=B1  2%  interrupts.CPU109.R=
ES:Rescheduling_interrupts
      1978 =C2=B1  9%     +25.1%       2474        interrupts.CPU109.TLB:TL=
B_shootdowns
     20465 =C2=B1  2%     -22.3%      15895        interrupts.CPU11.RES:Res=
cheduling_interrupts
     21345 =C2=B1  2%     -18.3%      17435 =C2=B1  4%  interrupts.CPU110.R=
ES:Rescheduling_interrupts
      1971 =C2=B1  8%     +18.6%       2338 =C2=B1  4%  interrupts.CPU110.T=
LB:TLB_shootdowns
     20086 =C2=B1  3%     -19.1%      16258 =C2=B1  2%  interrupts.CPU111.R=
ES:Rescheduling_interrupts
      2047 =C2=B1  5%     +17.2%       2399 =C2=B1 13%  interrupts.CPU111.T=
LB:TLB_shootdowns
      1472 =C2=B1109%    +380.9%       7082 =C2=B1  2%  interrupts.CPU112.N=
MI:Non-maskable_interrupts
      1472 =C2=B1109%    +380.9%       7082 =C2=B1  2%  interrupts.CPU112.P=
MI:Performance_monitoring_interrupts
     20424           -20.0%      16331        interrupts.CPU112.RES:Resched=
uling_interrupts
      2094 =C2=B1 11%     +12.6%       2358 =C2=B1  3%  interrupts.CPU112.T=
LB:TLB_shootdowns
     20019           -21.5%      15722 =C2=B1  4%  interrupts.CPU113.RES:Re=
scheduling_interrupts
      2022 =C2=B1 13%     +17.1%       2368 =C2=B1  3%  interrupts.CPU113.T=
LB:TLB_shootdowns
     20327           -19.4%      16374 =C2=B1  2%  interrupts.CPU114.RES:Re=
scheduling_interrupts
      2022 =C2=B1 12%     +19.0%       2407        interrupts.CPU114.TLB:TL=
B_shootdowns
     20429 =C2=B1  2%     -21.3%      16079 =C2=B1  5%  interrupts.CPU115.R=
ES:Rescheduling_interrupts
      2091 =C2=B1  9%     +15.5%       2415        interrupts.CPU115.TLB:TL=
B_shootdowns
     20389 =C2=B1  2%     -13.6%      17614        interrupts.CPU116.RES:Re=
scheduling_interrupts
      2041 =C2=B1 11%     +17.8%       2405 =C2=B1  2%  interrupts.CPU116.T=
LB:TLB_shootdowns
     20250 =C2=B1  2%     -18.7%      16460 =C2=B1  2%  interrupts.CPU117.R=
ES:Rescheduling_interrupts
     20035           -20.8%      15878        interrupts.CPU118.RES:Resched=
uling_interrupts
      1960 =C2=B1  8%     +16.7%       2288 =C2=B1  7%  interrupts.CPU118.T=
LB:TLB_shootdowns
     19647 =C2=B1  2%     -21.1%      15504 =C2=B1  5%  interrupts.CPU119.R=
ES:Rescheduling_interrupts
      2159 =C2=B1  6%      +7.4%       2319 =C2=B1  2%  interrupts.CPU119.T=
LB:TLB_shootdowns
      2359 =C2=B1123%    +200.0%       7078        interrupts.CPU12.NMI:Non=
-maskable_interrupts
      2359 =C2=B1123%    +200.0%       7078        interrupts.CPU12.PMI:Per=
formance_monitoring_interrupts
     20907 =C2=B1  3%     -13.9%      17995        interrupts.CPU12.RES:Res=
cheduling_interrupts
      3773 =C2=B1 54%     +87.1%       7060        interrupts.CPU120.NMI:No=
n-maskable_interrupts
      3773 =C2=B1 54%     +87.1%       7060        interrupts.CPU120.PMI:Pe=
rformance_monitoring_interrupts
     20164           -19.9%      16159        interrupts.CPU120.RES:Resched=
uling_interrupts
      2107 =C2=B1 10%     +14.7%       2417 =C2=B1  4%  interrupts.CPU120.T=
LB:TLB_shootdowns
      1520 =C2=B1 87%    +365.3%       7076        interrupts.CPU121.NMI:No=
n-maskable_interrupts
      1520 =C2=B1 87%    +365.3%       7076        interrupts.CPU121.PMI:Pe=
rformance_monitoring_interrupts
     19674 =C2=B1  3%     -17.3%      16266        interrupts.CPU121.RES:Re=
scheduling_interrupts
      1950 =C2=B1 11%     +23.2%       2403 =C2=B1  2%  interrupts.CPU121.T=
LB:TLB_shootdowns
    264.67 =C2=B1100%   +1873.2%       5222 =C2=B1 30%  interrupts.CPU122.N=
MI:Non-maskable_interrupts
    264.67 =C2=B1100%   +1873.2%       5222 =C2=B1 30%  interrupts.CPU122.P=
MI:Performance_monitoring_interrupts
     19613 =C2=B1  2%     -17.5%      16190        interrupts.CPU122.RES:Re=
scheduling_interrupts
      2100 =C2=B1 10%     +20.5%       2530 =C2=B1 10%  interrupts.CPU122.T=
LB:TLB_shootdowns
      1136 =C2=B1 54%     -93.0%      80.00 =C2=B1100%  interrupts.CPU123.N=
MI:Non-maskable_interrupts
      1136 =C2=B1 54%     -93.0%      80.00 =C2=B1100%  interrupts.CPU123.P=
MI:Performance_monitoring_interrupts
     20297           -26.2%      14973        interrupts.CPU123.RES:Resched=
uling_interrupts
     20612 =C2=B1  3%     -19.7%      16553 =C2=B1  2%  interrupts.CPU124.R=
ES:Rescheduling_interrupts
      2179 =C2=B1 39%    +142.7%       5289 =C2=B1 31%  interrupts.CPU125.N=
MI:Non-maskable_interrupts
      2179 =C2=B1 39%    +142.7%       5289 =C2=B1 31%  interrupts.CPU125.P=
MI:Performance_monitoring_interrupts
     20258           -20.6%      16085        interrupts.CPU125.RES:Resched=
uling_interrupts
      2161 =C2=B1 39%    +225.4%       7032        interrupts.CPU126.NMI:No=
n-maskable_interrupts
      2161 =C2=B1 39%    +225.4%       7032        interrupts.CPU126.PMI:Pe=
rformance_monitoring_interrupts
     22110 =C2=B1  3%     -13.9%      19029        interrupts.CPU126.RES:Re=
scheduling_interrupts
      2050 =C2=B1  9%     +16.7%       2391 =C2=B1  5%  interrupts.CPU126.T=
LB:TLB_shootdowns
     21262           -12.1%      18698        interrupts.CPU127.RES:Resched=
uling_interrupts
      2097 =C2=B1 10%     +14.6%       2404        interrupts.CPU127.TLB:TL=
B_shootdowns
     21213 =C2=B1  3%     -15.8%      17857 =C2=B1  2%  interrupts.CPU128.R=
ES:Rescheduling_interrupts
      1999 =C2=B1 12%     +21.0%       2418 =C2=B1  4%  interrupts.CPU128.T=
LB:TLB_shootdowns
     20900 =C2=B1  2%     -20.3%      16649 =C2=B1  4%  interrupts.CPU129.R=
ES:Rescheduling_interrupts
      2038 =C2=B1 12%     +11.9%       2280 =C2=B1  4%  interrupts.CPU129.T=
LB:TLB_shootdowns
      2670 =C2=B1106%     +99.1%       5316 =C2=B1 35%  interrupts.CPU13.NM=
I:Non-maskable_interrupts
      2670 =C2=B1106%     +99.1%       5316 =C2=B1 35%  interrupts.CPU13.PM=
I:Performance_monitoring_interrupts
     20950 =C2=B1  3%     -14.5%      17911        interrupts.CPU13.RES:Res=
cheduling_interrupts
      2117 =C2=B1 11%      +9.3%       2315 =C2=B1  7%  interrupts.CPU13.TL=
B:TLB_shootdowns
      1031 =C2=B1 73%    +411.8%       5280 =C2=B1 31%  interrupts.CPU130.N=
MI:Non-maskable_interrupts
      1031 =C2=B1 73%    +411.8%       5280 =C2=B1 31%  interrupts.CPU130.P=
MI:Performance_monitoring_interrupts
     20559 =C2=B1  2%     -19.7%      16516        interrupts.CPU130.RES:Re=
scheduling_interrupts
      1991 =C2=B1  9%     +16.8%       2326        interrupts.CPU130.TLB:TL=
B_shootdowns
      2630 =C2=B1108%    +100.7%       5279 =C2=B1 30%  interrupts.CPU131.N=
MI:Non-maskable_interrupts
      2630 =C2=B1108%    +100.7%       5279 =C2=B1 30%  interrupts.CPU131.P=
MI:Performance_monitoring_interrupts
     20323 =C2=B1  2%     -17.9%      16683        interrupts.CPU131.RES:Re=
scheduling_interrupts
      2094 =C2=B1 10%     +12.0%       2347 =C2=B1  4%  interrupts.CPU131.T=
LB:TLB_shootdowns
      2703 =C2=B1 38%    +157.0%       6949        interrupts.CPU132.NMI:No=
n-maskable_interrupts
      2703 =C2=B1 38%    +157.0%       6949        interrupts.CPU132.PMI:Pe=
rformance_monitoring_interrupts
     21400 =C2=B1  2%     -11.1%      19014        interrupts.CPU132.RES:Re=
scheduling_interrupts
      2116 =C2=B1  8%     +13.5%       2402 =C2=B1  9%  interrupts.CPU132.T=
LB:TLB_shootdowns
     20862 =C2=B1  2%     -21.9%      16294 =C2=B1  2%  interrupts.CPU133.R=
ES:Rescheduling_interrupts
      2036 =C2=B1  8%     +12.1%       2283 =C2=B1  6%  interrupts.CPU133.T=
LB:TLB_shootdowns
      1662 =C2=B1 77%    +215.9%       5252 =C2=B1 31%  interrupts.CPU134.N=
MI:Non-maskable_interrupts
      1662 =C2=B1 77%    +215.9%       5252 =C2=B1 31%  interrupts.CPU134.P=
MI:Performance_monitoring_interrupts
     20319           -19.9%      16272        interrupts.CPU134.RES:Resched=
uling_interrupts
      2045 =C2=B1 10%     +10.0%       2249 =C2=B1  5%  interrupts.CPU134.T=
LB:TLB_shootdowns
     20071 =C2=B1  2%     -19.9%      16068 =C2=B1  4%  interrupts.CPU135.R=
ES:Rescheduling_interrupts
      2031 =C2=B1 10%     +12.1%       2276 =C2=B1  5%  interrupts.CPU135.T=
LB:TLB_shootdowns
     20438           -19.5%      16448 =C2=B1  3%  interrupts.CPU136.RES:Re=
scheduling_interrupts
      2045 =C2=B1 10%     +23.0%       2515        interrupts.CPU136.TLB:TL=
B_shootdowns
    788.00 =C2=B1 72%    +797.5%       7072 =C2=B1  2%  interrupts.CPU137.N=
MI:Non-maskable_interrupts
    788.00 =C2=B1 72%    +797.5%       7072 =C2=B1  2%  interrupts.CPU137.P=
MI:Performance_monitoring_interrupts
     20227           -18.2%      16546        interrupts.CPU137.RES:Resched=
uling_interrupts
      2074 =C2=B1 10%     +12.9%       2341 =C2=B1  4%  interrupts.CPU137.T=
LB:TLB_shootdowns
      1653 =C2=B1 90%    +332.2%       7147 =C2=B1  2%  interrupts.CPU138.N=
MI:Non-maskable_interrupts
      1653 =C2=B1 90%    +332.2%       7147 =C2=B1  2%  interrupts.CPU138.P=
MI:Performance_monitoring_interrupts
     20251 =C2=B1  2%     -18.0%      16607        interrupts.CPU138.RES:Re=
scheduling_interrupts
     19889 =C2=B1  2%     -22.3%      15451        interrupts.CPU139.RES:Re=
scheduling_interrupts
      2040 =C2=B1  7%     +19.8%       2444 =C2=B1  4%  interrupts.CPU139.T=
LB:TLB_shootdowns
      3569 =C2=B1 67%    -100.0%       0.50 =C2=B1100%  interrupts.CPU14.NM=
I:Non-maskable_interrupts
      3569 =C2=B1 67%    -100.0%       0.50 =C2=B1100%  interrupts.CPU14.PM=
I:Performance_monitoring_interrupts
     20557 =C2=B1  2%     -19.9%      16471        interrupts.CPU14.RES:Res=
cheduling_interrupts
    482.00 =C2=B1122%   +1360.9%       7041 =C2=B1  2%  interrupts.CPU140.N=
MI:Non-maskable_interrupts
    482.00 =C2=B1122%   +1360.9%       7041 =C2=B1  2%  interrupts.CPU140.P=
MI:Performance_monitoring_interrupts
     21150           -15.1%      17964 =C2=B1  2%  interrupts.CPU140.RES:Re=
scheduling_interrupts
    872.33 =C2=B1 69%    +505.7%       5283 =C2=B1 31%  interrupts.CPU141.N=
MI:Non-maskable_interrupts
    872.33 =C2=B1 69%    +505.7%       5283 =C2=B1 31%  interrupts.CPU141.P=
MI:Performance_monitoring_interrupts
     20878 =C2=B1  3%     -12.5%      18258        interrupts.CPU141.RES:Re=
scheduling_interrupts
      1889 =C2=B1 10%     +23.5%       2333 =C2=B1  4%  interrupts.CPU141.T=
LB:TLB_shootdowns
      2737 =C2=B1 37%     +93.6%       5300 =C2=B1 32%  interrupts.CPU142.N=
MI:Non-maskable_interrupts
      2737 =C2=B1 37%     +93.6%       5300 =C2=B1 32%  interrupts.CPU142.P=
MI:Performance_monitoring_interrupts
     20634           -20.8%      16339        interrupts.CPU142.RES:Resched=
uling_interrupts
      2004 =C2=B1 12%     +24.1%       2487 =C2=B1  2%  interrupts.CPU142.T=
LB:TLB_shootdowns
      2756 =C2=B1 38%     -98.3%      47.00 =C2=B1 23%  interrupts.CPU143.N=
MI:Non-maskable_interrupts
      2756 =C2=B1 38%     -98.3%      47.00 =C2=B1 23%  interrupts.CPU143.P=
MI:Performance_monitoring_interrupts
     19788 =C2=B1  2%     -25.4%      14763        interrupts.CPU143.RES:Re=
scheduling_interrupts
      2147 =C2=B1 10%     +17.3%       2518        interrupts.CPU143.TLB:TL=
B_shootdowns
    683.00 =C2=B1 32%     -33.6%     453.50        interrupts.CPU15.60:PCI-=
MSI.1572879-edge.eth0-TxRx-15
     20730 =C2=B1  2%     -18.7%      16860        interrupts.CPU15.RES:Res=
cheduling_interrupts
     20331 =C2=B1  2%     -23.6%      15523        interrupts.CPU16.RES:Res=
cheduling_interrupts
      1949 =C2=B1 14%     +23.5%       2407        interrupts.CPU16.TLB:TLB=
_shootdowns
     20198 =C2=B1  3%     -20.5%      16063        interrupts.CPU17.RES:Res=
cheduling_interrupts
      2090 =C2=B1 12%     +15.2%       2409 =C2=B1  2%  interrupts.CPU17.TL=
B:TLB_shootdowns
     22240 =C2=B1  5%     -16.8%      18511 =C2=B1  3%  interrupts.CPU19.RE=
S:Rescheduling_interrupts
      1074 =C2=B1141%    +395.0%       5316 =C2=B1 34%  interrupts.CPU2.NMI=
:Non-maskable_interrupts
      1074 =C2=B1141%    +395.0%       5316 =C2=B1 34%  interrupts.CPU2.PMI=
:Performance_monitoring_interrupts
     21389 =C2=B1  3%      -8.4%      19582        interrupts.CPU2.RES:Resc=
heduling_interrupts
     21922 =C2=B1  2%     -16.9%      18226 =C2=B1  2%  interrupts.CPU20.RE=
S:Rescheduling_interrupts
     22730 =C2=B1  4%     -17.2%      18809 =C2=B1  5%  interrupts.CPU21.RE=
S:Rescheduling_interrupts
     21374 =C2=B1  3%     -16.8%      17777 =C2=B1  2%  interrupts.CPU22.RE=
S:Rescheduling_interrupts
      2034 =C2=B1  9%     +16.3%       2365 =C2=B1  3%  interrupts.CPU22.TL=
B:TLB_shootdowns
      2148 =C2=B1141%    +144.1%       5244 =C2=B1 35%  interrupts.CPU23.NM=
I:Non-maskable_interrupts
      2148 =C2=B1141%    +144.1%       5244 =C2=B1 35%  interrupts.CPU23.PM=
I:Performance_monitoring_interrupts
     20429 =C2=B1  4%     -14.3%      17512        interrupts.CPU23.RES:Res=
cheduling_interrupts
      1964 =C2=B1  9%     +21.5%       2386 =C2=B1  2%  interrupts.CPU23.TL=
B:TLB_shootdowns
     20429           -15.6%      17238 =C2=B1  2%  interrupts.CPU24.RES:Res=
cheduling_interrupts
      1925 =C2=B1 12%     +25.1%       2408 =C2=B1  2%  interrupts.CPU24.TL=
B:TLB_shootdowns
     20575           -16.3%      17216 =C2=B1  5%  interrupts.CPU25.RES:Res=
cheduling_interrupts
      2015 =C2=B1 10%     +19.3%       2405        interrupts.CPU25.TLB:TLB=
_shootdowns
     20893 =C2=B1  3%     -18.9%      16938 =C2=B1  5%  interrupts.CPU26.RE=
S:Rescheduling_interrupts
      1972 =C2=B1  9%     +19.5%       2356 =C2=B1  4%  interrupts.CPU26.TL=
B:TLB_shootdowns
    499.67 =C2=B1  9%     -13.4%     432.50        interrupts.CPU27.72:PCI-=
MSI.1572891-edge.eth0-TxRx-27
      1707 =C2=B1 79%    +205.5%       5217 =C2=B1 31%  interrupts.CPU27.NM=
I:Non-maskable_interrupts
      1707 =C2=B1 79%    +205.5%       5217 =C2=B1 31%  interrupts.CPU27.PM=
I:Performance_monitoring_interrupts
     20676 =C2=B1  3%     -17.7%      17015        interrupts.CPU27.RES:Res=
cheduling_interrupts
    612.67 =C2=B1136%    +751.8%       5219 =C2=B1 32%  interrupts.CPU28.NM=
I:Non-maskable_interrupts
    612.67 =C2=B1136%    +751.8%       5219 =C2=B1 32%  interrupts.CPU28.PM=
I:Performance_monitoring_interrupts
      2018 =C2=B1 14%     +19.1%       2404 =C2=B1  2%  interrupts.CPU28.TL=
B:TLB_shootdowns
      2331 =C2=B1130%    +129.0%       5340 =C2=B1 34%  interrupts.CPU29.NM=
I:Non-maskable_interrupts
      2331 =C2=B1130%    +129.0%       5340 =C2=B1 34%  interrupts.CPU29.PM=
I:Performance_monitoring_interrupts
      2056 =C2=B1 10%     +16.1%       2386 =C2=B1  3%  interrupts.CPU29.TL=
B:TLB_shootdowns
      0.67 =C2=B1141%  +5.7e+05%       3796 =C2=B1 86%  interrupts.CPU3.NMI=
:Non-maskable_interrupts
      0.67 =C2=B1141%  +5.7e+05%       3796 =C2=B1 86%  interrupts.CPU3.PMI=
:Performance_monitoring_interrupts
     21956           -14.3%      18823        interrupts.CPU3.RES:Reschedul=
ing_interrupts
      2066 =C2=B1 12%     +14.1%       2356 =C2=B1  4%  interrupts.CPU3.TLB=
:TLB_shootdowns
     20772 =C2=B1  4%     -21.9%      16220 =C2=B1  5%  interrupts.CPU30.RE=
S:Rescheduling_interrupts
      2015 =C2=B1 12%     +18.5%       2388 =C2=B1  6%  interrupts.CPU30.TL=
B:TLB_shootdowns
     20566           -21.4%      16163        interrupts.CPU31.RES:Reschedu=
ling_interrupts
     20370 =C2=B1  3%     -19.6%      16372 =C2=B1  2%  interrupts.CPU32.RE=
S:Rescheduling_interrupts
     21077 =C2=B1  4%     -19.6%      16949        interrupts.CPU33.RES:Res=
cheduling_interrupts
     20812           -20.3%      16588 =C2=B1  2%  interrupts.CPU34.RES:Res=
cheduling_interrupts
      2005 =C2=B1 15%     +18.7%       2381 =C2=B1  3%  interrupts.CPU34.TL=
B:TLB_shootdowns
     20487 =C2=B1  3%     -22.1%      15957 =C2=B1  2%  interrupts.CPU35.RE=
S:Rescheduling_interrupts
      2015 =C2=B1  7%     +16.9%       2357        interrupts.CPU35.TLB:TLB=
_shootdowns
    948.67 =C2=B1 75%    +648.6%       7101 =C2=B1  2%  interrupts.CPU36.NM=
I:Non-maskable_interrupts
    948.67 =C2=B1 75%    +648.6%       7101 =C2=B1  2%  interrupts.CPU36.PM=
I:Performance_monitoring_interrupts
      1991 =C2=B1 12%     +21.4%       2417 =C2=B1  8%  interrupts.CPU36.TL=
B:TLB_shootdowns
     21592           -16.4%      18055        interrupts.CPU37.RES:Reschedu=
ling_interrupts
      2080 =C2=B1 10%     +15.8%       2408 =C2=B1  2%  interrupts.CPU37.TL=
B:TLB_shootdowns
      2071 =C2=B1 11%     +15.3%       2389 =C2=B1  4%  interrupts.CPU38.TL=
B:TLB_shootdowns
     21635 =C2=B1  2%     -14.2%      18572 =C2=B1  3%  interrupts.CPU39.RE=
S:Rescheduling_interrupts
      2047 =C2=B1  8%     +17.7%       2409 =C2=B1  5%  interrupts.CPU39.TL=
B:TLB_shootdowns
     22078 =C2=B1  6%     -15.4%      18681        interrupts.CPU4.RES:Resc=
heduling_interrupts
      1926 =C2=B1 12%     +18.8%       2288        interrupts.CPU4.TLB:TLB_=
shootdowns
     20553           -20.6%      16318        interrupts.CPU40.RES:Reschedu=
ling_interrupts
      1973 =C2=B1 15%     +21.2%       2391 =C2=B1  4%  interrupts.CPU40.TL=
B:TLB_shootdowns
     20719 =C2=B1  2%     -18.5%      16878 =C2=B1  7%  interrupts.CPU41.RE=
S:Rescheduling_interrupts
      1942 =C2=B1 13%     +21.7%       2364 =C2=B1  3%  interrupts.CPU41.TL=
B:TLB_shootdowns
     21622 =C2=B1  4%     -21.1%      17064 =C2=B1  4%  interrupts.CPU42.RE=
S:Rescheduling_interrupts
     21437 =C2=B1  2%     -20.5%      17049 =C2=B1  6%  interrupts.CPU43.RE=
S:Rescheduling_interrupts
      1996 =C2=B1 10%     +24.1%       2477 =C2=B1  2%  interrupts.CPU43.TL=
B:TLB_shootdowns
     21385           -16.5%      17866        interrupts.CPU44.RES:Reschedu=
ling_interrupts
     21222 =C2=B1  3%     -17.4%      17519 =C2=B1  5%  interrupts.CPU45.RE=
S:Rescheduling_interrupts
     21934           -21.4%      17233        interrupts.CPU46.RES:Reschedu=
ling_interrupts
      2117 =C2=B1  7%     +15.4%       2443 =C2=B1  5%  interrupts.CPU46.TL=
B:TLB_shootdowns
     20216 =C2=B1  2%     -19.0%      16366 =C2=B1  2%  interrupts.CPU47.RE=
S:Rescheduling_interrupts
     19863           -21.9%      15513        interrupts.CPU48.RES:Reschedu=
ling_interrupts
      2055 =C2=B1  8%     +16.7%       2398 =C2=B1  2%  interrupts.CPU48.TL=
B:TLB_shootdowns
     20442 =C2=B1  3%     -22.6%      15830        interrupts.CPU49.RES:Res=
cheduling_interrupts
     21033 =C2=B1  4%     -15.7%      17732        interrupts.CPU5.RES:Resc=
heduling_interrupts
     20830 =C2=B1  2%     -23.9%      15855        interrupts.CPU50.RES:Res=
cheduling_interrupts
      2060 =C2=B1  9%     +13.6%       2341 =C2=B1  2%  interrupts.CPU50.TL=
B:TLB_shootdowns
      1199 =C2=B1120%    +201.4%       3615        interrupts.CPU51.NMI:Non=
-maskable_interrupts
      1199 =C2=B1120%    +201.4%       3615        interrupts.CPU51.PMI:Per=
formance_monitoring_interrupts
     20247 =C2=B1  4%     -16.4%      16927        interrupts.CPU51.RES:Res=
cheduling_interrupts
      2070 =C2=B1 10%     +17.6%       2434 =C2=B1  7%  interrupts.CPU51.TL=
B:TLB_shootdowns
      1618 =C2=B1 91%    +227.9%       5307 =C2=B1 30%  interrupts.CPU52.NM=
I:Non-maskable_interrupts
      1618 =C2=B1 91%    +227.9%       5307 =C2=B1 30%  interrupts.CPU52.PM=
I:Performance_monitoring_interrupts
     21352           -17.4%      17631        interrupts.CPU52.RES:Reschedu=
ling_interrupts
     20631           -17.6%      17002        interrupts.CPU53.RES:Reschedu=
ling_interrupts
      2143 =C2=B1  6%      +8.8%       2333 =C2=B1  4%  interrupts.CPU53.TL=
B:TLB_shootdowns
     23539 =C2=B1  2%     -14.1%      20216 =C2=B1  3%  interrupts.CPU54.RE=
S:Rescheduling_interrupts
      2037 =C2=B1  9%     +11.4%       2269 =C2=B1  4%  interrupts.CPU54.TL=
B:TLB_shootdowns
     22685           -19.3%      18306 =C2=B1  4%  interrupts.CPU55.RES:Res=
cheduling_interrupts
      2107 =C2=B1 10%      +9.0%       2296 =C2=B1  5%  interrupts.CPU55.TL=
B:TLB_shootdowns
     21677           -15.8%      18247 =C2=B1  4%  interrupts.CPU56.RES:Res=
cheduling_interrupts
      2008 =C2=B1  9%     +17.3%       2355 =C2=B1  7%  interrupts.CPU56.TL=
B:TLB_shootdowns
     21908 =C2=B1  2%     -15.3%      18548        interrupts.CPU57.RES:Res=
cheduling_interrupts
      2047 =C2=B1 12%     +13.4%       2321 =C2=B1  7%  interrupts.CPU57.TL=
B:TLB_shootdowns
      2270 =C2=B1130%     -99.9%       1.50 =C2=B1 33%  interrupts.CPU58.NM=
I:Non-maskable_interrupts
      2270 =C2=B1130%     -99.9%       1.50 =C2=B1 33%  interrupts.CPU58.PM=
I:Performance_monitoring_interrupts
     20646           -19.4%      16650        interrupts.CPU58.RES:Reschedu=
ling_interrupts
     21046           -21.5%      16522 =C2=B1  2%  interrupts.CPU59.RES:Res=
cheduling_interrupts
      1992 =C2=B1 14%     +22.0%       2430        interrupts.CPU59.TLB:TLB=
_shootdowns
    739.00 =C2=B1 42%     -39.4%     448.00 =C2=B1  2%  interrupts.CPU6.51:=
PCI-MSI.1572870-edge.eth0-TxRx-6
    919.33 =C2=B1141%     +86.4%       1713 =C2=B1 99%  interrupts.CPU6.NMI=
:Non-maskable_interrupts
    919.33 =C2=B1141%     +86.4%       1713 =C2=B1 99%  interrupts.CPU6.PMI=
:Performance_monitoring_interrupts
      1926 =C2=B1  9%     +16.8%       2251 =C2=B1  5%  interrupts.CPU6.TLB=
:TLB_shootdowns
     21628 =C2=B1  2%     -14.4%      18524        interrupts.CPU60.RES:Res=
cheduling_interrupts
      2054 =C2=B1 12%     +17.5%       2413        interrupts.CPU60.TLB:TLB=
_shootdowns
      1723 =C2=B1 82%    +311.3%       7088 =C2=B1  2%  interrupts.CPU61.NM=
I:Non-maskable_interrupts
      1723 =C2=B1 82%    +311.3%       7088 =C2=B1  2%  interrupts.CPU61.PM=
I:Performance_monitoring_interrupts
     21809           -14.8%      18586        interrupts.CPU61.RES:Reschedu=
ling_interrupts
      2111 =C2=B1 10%     +15.6%       2440 =C2=B1  3%  interrupts.CPU61.TL=
B:TLB_shootdowns
     20756           -23.3%      15923 =C2=B1  2%  interrupts.CPU62.RES:Res=
cheduling_interrupts
     21028           -19.4%      16955 =C2=B1  2%  interrupts.CPU63.RES:Res=
cheduling_interrupts
      2187 =C2=B1  4%     +11.1%       2430 =C2=B1  7%  interrupts.CPU63.TL=
B:TLB_shootdowns
     20854 =C2=B1  2%     -15.7%      17577        interrupts.CPU64.RES:Res=
cheduling_interrupts
      2076 =C2=B1  8%     +10.7%       2297 =C2=B1  5%  interrupts.CPU64.TL=
B:TLB_shootdowns
     20753           -22.6%      16067        interrupts.CPU65.RES:Reschedu=
ling_interrupts
     20470 =C2=B1  2%     -23.3%      15699        interrupts.CPU66.RES:Res=
cheduling_interrupts
      2014 =C2=B1 11%     +15.1%       2319        interrupts.CPU66.TLB:TLB=
_shootdowns
      1691 =C2=B1 79%    +211.8%       5272 =C2=B1 31%  interrupts.CPU67.NM=
I:Non-maskable_interrupts
      1691 =C2=B1 79%    +211.8%       5272 =C2=B1 31%  interrupts.CPU67.PM=
I:Performance_monitoring_interrupts
     21412 =C2=B1  2%     -15.3%      18129        interrupts.CPU67.RES:Res=
cheduling_interrupts
      2057 =C2=B1 10%     +16.8%       2404 =C2=B1  2%  interrupts.CPU67.TL=
B:TLB_shootdowns
     21473 =C2=B1  2%     -16.0%      18042 =C2=B1  2%  interrupts.CPU68.RE=
S:Rescheduling_interrupts
      2056 =C2=B1 11%     +16.3%       2391 =C2=B1  3%  interrupts.CPU68.TL=
B:TLB_shootdowns
     21768 =C2=B1  3%     -19.6%      17502        interrupts.CPU69.RES:Res=
cheduling_interrupts
      2102 =C2=B1  7%     +15.1%       2419 =C2=B1  2%  interrupts.CPU69.TL=
B:TLB_shootdowns
      2637 =C2=B1103%    -100.0%       0.00        interrupts.CPU7.NMI:Non-=
maskable_interrupts
      2637 =C2=B1103%    -100.0%       0.00        interrupts.CPU7.PMI:Perf=
ormance_monitoring_interrupts
     21803           -20.8%      17265        interrupts.CPU7.RES:Reschedul=
ing_interrupts
      2027 =C2=B1 10%     +25.0%       2534        interrupts.CPU7.TLB:TLB_=
shootdowns
     20582           -20.4%      16392        interrupts.CPU70.RES:Reschedu=
ling_interrupts
      1253 =C2=B1141%    +465.2%       7086 =C2=B1  2%  interrupts.CPU71.NM=
I:Non-maskable_interrupts
      1253 =C2=B1141%    +465.2%       7086 =C2=B1  2%  interrupts.CPU71.PM=
I:Performance_monitoring_interrupts
      1417 =C2=B1 93%    +396.7%       7042        interrupts.CPU72.NMI:Non=
-maskable_interrupts
      1417 =C2=B1 93%    +396.7%       7042        interrupts.CPU72.PMI:Per=
formance_monitoring_interrupts
      1976 =C2=B1  9%     +20.7%       2385        interrupts.CPU72.TLB:TLB=
_shootdowns
     21584 =C2=B1  2%     -14.4%      18475        interrupts.CPU73.RES:Res=
cheduling_interrupts
      1936 =C2=B1 11%     +22.0%       2362 =C2=B1  2%  interrupts.CPU73.TL=
B:TLB_shootdowns
     21004 =C2=B1  2%     -20.2%      16753        interrupts.CPU74.RES:Res=
cheduling_interrupts
      2068 =C2=B1  6%     +16.7%       2415        interrupts.CPU74.TLB:TLB=
_shootdowns
     21152           -19.9%      16943 =C2=B1  5%  interrupts.CPU75.RES:Res=
cheduling_interrupts
      2022 =C2=B1 12%     +12.2%       2268 =C2=B1  4%  interrupts.CPU75.TL=
B:TLB_shootdowns
      2334 =C2=B1119%    +124.7%       5244 =C2=B1 31%  interrupts.CPU76.NM=
I:Non-maskable_interrupts
      2334 =C2=B1119%    +124.7%       5244 =C2=B1 31%  interrupts.CPU76.PM=
I:Performance_monitoring_interrupts
     21464           -13.7%      18515        interrupts.CPU76.RES:Reschedu=
ling_interrupts
      1645 =C2=B1 75%    +330.1%       7078        interrupts.CPU77.NMI:Non=
-maskable_interrupts
      1645 =C2=B1 75%    +330.1%       7078        interrupts.CPU77.PMI:Per=
formance_monitoring_interrupts
     21447 =C2=B1  2%     -18.9%      17392        interrupts.CPU77.RES:Res=
cheduling_interrupts
     20921 =C2=B1  5%     -16.2%      17536        interrupts.CPU78.RES:Res=
cheduling_interrupts
      1969 =C2=B1 10%     +21.8%       2398 =C2=B1 11%  interrupts.CPU78.TL=
B:TLB_shootdowns
    593.33 =C2=B1141%    +789.1%       5275 =C2=B1 31%  interrupts.CPU79.NM=
I:Non-maskable_interrupts
    593.33 =C2=B1141%    +789.1%       5275 =C2=B1 31%  interrupts.CPU79.PM=
I:Performance_monitoring_interrupts
     20456 =C2=B1  3%     -14.8%      17424 =C2=B1  2%  interrupts.CPU79.RE=
S:Rescheduling_interrupts
      2007 =C2=B1  5%     +18.2%       2373 =C2=B1  5%  interrupts.CPU79.TL=
B:TLB_shootdowns
    477.67 =C2=B1  9%    +245.7%       1651 =C2=B1  7%  interrupts.CPU8.53:=
PCI-MSI.1572872-edge.eth0-TxRx-8
      2284 =C2=B1 65%    +134.0%       5346 =C2=B1 34%  interrupts.CPU8.NMI=
:Non-maskable_interrupts
      2284 =C2=B1 65%    +134.0%       5346 =C2=B1 34%  interrupts.CPU8.PMI=
:Performance_monitoring_interrupts
     20918 =C2=B1  4%     -16.7%      17427 =C2=B1  4%  interrupts.CPU8.RES=
:Rescheduling_interrupts
     20186 =C2=B1  2%     -20.3%      16087 =C2=B1  5%  interrupts.CPU80.RE=
S:Rescheduling_interrupts
      2751 =C2=B1 38%     -99.8%       5.50 =C2=B1 81%  interrupts.CPU81.NM=
I:Non-maskable_interrupts
      2751 =C2=B1 38%     -99.8%       5.50 =C2=B1 81%  interrupts.CPU81.PM=
I:Performance_monitoring_interrupts
     20462           -25.4%      15275        interrupts.CPU81.RES:Reschedu=
ling_interrupts
      2053 =C2=B1 10%     +22.0%       2505 =C2=B1  4%  interrupts.CPU81.TL=
B:TLB_shootdowns
     20707 =C2=B1  3%     -19.2%      16737        interrupts.CPU82.RES:Res=
cheduling_interrupts
      3209 =C2=B1 71%    +121.7%       7115 =C2=B1  2%  interrupts.CPU83.NM=
I:Non-maskable_interrupts
      3209 =C2=B1 71%    +121.7%       7115 =C2=B1  2%  interrupts.CPU83.PM=
I:Performance_monitoring_interrupts
     20304           -21.3%      15973        interrupts.CPU83.RES:Reschedu=
ling_interrupts
      2031 =C2=B1 13%     +15.0%       2337 =C2=B1  6%  interrupts.CPU83.TL=
B:TLB_shootdowns
      2143 =C2=B1 38%     -95.8%      91.00 =C2=B1 86%  interrupts.CPU84.NM=
I:Non-maskable_interrupts
      2143 =C2=B1 38%     -95.8%      91.00 =C2=B1 86%  interrupts.CPU84.PM=
I:Performance_monitoring_interrupts
     21467 =C2=B1  2%     -22.0%      16750        interrupts.CPU84.RES:Res=
cheduling_interrupts
      2054 =C2=B1 14%     +17.9%       2421 =C2=B1  4%  interrupts.CPU84.TL=
B:TLB_shootdowns
     20823 =C2=B1  2%     -22.3%      16175        interrupts.CPU85.RES:Res=
cheduling_interrupts
      2156 =C2=B1 12%     +18.4%       2553 =C2=B1 16%  interrupts.CPU85.TL=
B:TLB_shootdowns
      1525 =C2=B1 16%    +247.0%       5292 =C2=B1 31%  interrupts.CPU86.NM=
I:Non-maskable_interrupts
      1525 =C2=B1 16%    +247.0%       5292 =C2=B1 31%  interrupts.CPU86.PM=
I:Performance_monitoring_interrupts
     20385           -18.1%      16698        interrupts.CPU86.RES:Reschedu=
ling_interrupts
     20292           -21.2%      15997 =C2=B1  4%  interrupts.CPU87.RES:Res=
cheduling_interrupts
      2020 =C2=B1 16%     +24.2%       2510 =C2=B1  3%  interrupts.CPU87.TL=
B:TLB_shootdowns
      1071 =C2=B1 73%    +402.3%       5380 =C2=B1 34%  interrupts.CPU88.NM=
I:Non-maskable_interrupts
      1071 =C2=B1 73%    +402.3%       5380 =C2=B1 34%  interrupts.CPU88.PM=
I:Performance_monitoring_interrupts
     20153 =C2=B1  2%     -17.3%      16669        interrupts.CPU88.RES:Res=
cheduling_interrupts
      2125 =C2=B1 12%     +14.3%       2429 =C2=B1  4%  interrupts.CPU88.TL=
B:TLB_shootdowns
     20208           -24.7%      15207 =C2=B1  8%  interrupts.CPU89.RES:Res=
cheduling_interrupts
      2167 =C2=B1 12%     +13.9%       2468 =C2=B1  3%  interrupts.CPU89.TL=
B:TLB_shootdowns
      2132 =C2=B1141%    +149.4%       5318 =C2=B1 35%  interrupts.CPU9.NMI=
:Non-maskable_interrupts
      2132 =C2=B1141%    +149.4%       5318 =C2=B1 35%  interrupts.CPU9.PMI=
:Performance_monitoring_interrupts
     20990 =C2=B1  3%     -15.7%      17687        interrupts.CPU9.RES:Resc=
heduling_interrupts
      2037 =C2=B1 13%     +13.3%       2308 =C2=B1  6%  interrupts.CPU9.TLB=
:TLB_shootdowns
      3629 =C2=B1 57%     +46.6%       5321 =C2=B1 31%  interrupts.CPU90.NM=
I:Non-maskable_interrupts
      3629 =C2=B1 57%     +46.6%       5321 =C2=B1 31%  interrupts.CPU90.PM=
I:Performance_monitoring_interrupts
     22658 =C2=B1  3%     -16.2%      18998        interrupts.CPU90.RES:Res=
cheduling_interrupts
      2055 =C2=B1 12%     +16.1%       2386 =C2=B1  8%  interrupts.CPU90.TL=
B:TLB_shootdowns
      1761 =C2=B1 89%    +201.8%       5314 =C2=B1 34%  interrupts.CPU91.NM=
I:Non-maskable_interrupts
      1761 =C2=B1 89%    +201.8%       5314 =C2=B1 34%  interrupts.CPU91.PM=
I:Performance_monitoring_interrupts
     21470 =C2=B1  2%     -14.4%      18381        interrupts.CPU91.RES:Res=
cheduling_interrupts
      2008 =C2=B1 12%     +18.0%       2371 =C2=B1  5%  interrupts.CPU91.TL=
B:TLB_shootdowns
     20890 =C2=B1  3%     -18.1%      17101 =C2=B1  2%  interrupts.CPU92.RE=
S:Rescheduling_interrupts
      2194 =C2=B1 11%     +11.9%       2456 =C2=B1  4%  interrupts.CPU92.TL=
B:TLB_shootdowns
     22379           -15.5%      18910 =C2=B1  4%  interrupts.CPU93.RES:Res=
cheduling_interrupts
      1974 =C2=B1  8%     +18.9%       2346 =C2=B1  2%  interrupts.CPU93.TL=
B:TLB_shootdowns
     21107           -20.7%      16740 =C2=B1  6%  interrupts.CPU94.RES:Res=
cheduling_interrupts
     20073           -20.6%      15938        interrupts.CPU95.RES:Reschedu=
ling_interrupts
      2011 =C2=B1 11%     +18.4%       2382 =C2=B1  2%  interrupts.CPU95.TL=
B:TLB_shootdowns
     20381           -18.5%      16618 =C2=B1  4%  interrupts.CPU96.RES:Res=
cheduling_interrupts
     20631           -20.2%      16466 =C2=B1  3%  interrupts.CPU97.RES:Res=
cheduling_interrupts
      2062 =C2=B1  6%     +13.8%       2347        interrupts.CPU97.TLB:TLB=
_shootdowns
     20499           -25.1%      15362 =C2=B1  2%  interrupts.CPU98.RES:Res=
cheduling_interrupts
      1521 =C2=B1 85%    -100.0%       0.50 =C2=B1100%  interrupts.CPU99.NM=
I:Non-maskable_interrupts
      1521 =C2=B1 85%    -100.0%       0.50 =C2=B1100%  interrupts.CPU99.PM=
I:Performance_monitoring_interrupts
     20320           -26.1%      15026        interrupts.CPU99.RES:Reschedu=
ling_interrupts
   3022635           -18.3%    2470301        interrupts.RES:Rescheduling_i=
nterrupts
    296038 =C2=B1 10%     +15.1%     340639 =C2=B1  3%  interrupts.TLB:TLB_=
shootdowns



***************************************************************************=
************************
lkp-skl-4sp1: 192 threads Skylake-SP with 256G memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/te=
stcase:
  gcc-7/performance/x86_64-rhel-7.6/30%/debian-x86_64-2019-05-14.cgz/300s/l=
kp-skl-4sp1/shell8/unixbench

commit: =

  4f23dbc1e6 ("locking/rwsem: Implement lock handoff to prevent lock starva=
tion")
  00f3c5a3df ("locking/rwsem: Always release wait_lock before waking up tas=
ks")

4f23dbc1e657951e 00f3c5a3df2c1e3dab14d0dd2b7 =

---------------- --------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

          0:4           45%           2:2     perf-profile.calltrace.cycles=
-pp.error_entry
          2:4           -2%           2:2     perf-profile.children.cycles-=
pp.error_entry
          1:4           20%           2:2     perf-profile.self.cycles-pp.e=
rror_entry
         %stddev     %change         %stddev
             \          |                \  =

 4.215e+09 =C2=B1 33%     +43.4%  6.046e+09 =C2=B1 31%  cpuidle.C1E.time
      0.00 =C2=B1135%      +0.0        0.01 =C2=B1 80%  mpstat.cpu.all.soft%
      1047 =C2=B1155%     -99.5%       5.00        proc-vmstat.numa_hint_fa=
ults_local
     30037 =C2=B1 45%     -96.4%       1092 =C2=B1 64%  proc-vmstat.numa_pt=
e_updates
     32.20 =C2=B1 31%     +13.2       45.39 =C2=B1 28%  turbostat.C1E%
     62.11 =C2=B1  8%      +9.8%      68.22 =C2=B1  7%  turbostat.CPU%c1
    516.50 =C2=B1  9%     +17.3%     606.00 =C2=B1  5%  slabinfo.skbuff_fcl=
one_cache.active_objs
    516.50 =C2=B1  9%     +17.3%     606.00 =C2=B1  5%  slabinfo.skbuff_fcl=
one_cache.num_objs
     26982 =C2=B1  4%      -7.6%      24934        slabinfo.vmap_area.activ=
e_objs
     63208 =C2=B1  5%      +7.2%      67766 =C2=B1  4%  numa-vmstat.node0.n=
r_file_pages
     13378 =C2=B1  9%     -14.6%      11428 =C2=B1  2%  numa-vmstat.node1.n=
r_kernel_stack
      6558 =C2=B1 28%     -29.8%       4601        numa-vmstat.node1.nr_pag=
e_table_pages
      5421 =C2=B1 11%     +20.5%       6535 =C2=B1  3%  numa-vmstat.node3.n=
r_page_table_pages
    272.75 =C2=B1 34%    +191.3%     794.50 =C2=B1 42%  numa-vmstat.node3.n=
r_shmem
      6026 =C2=B1 23%     +30.4%       7856 =C2=B1 17%  numa-vmstat.node3.n=
r_slab_reclaimable
      3.11 =C2=B1  6%      -0.2        2.92        perf-stat.i.branch-miss-=
rate%
     19.24 =C2=B1  6%      +2.3       21.55 =C2=B1  8%  perf-stat.i.cache-m=
iss-rate%
     30.43 =C2=B1  3%      -1.4       29.05        perf-stat.i.iTLB-load-mi=
ss-rate%
     90.26            +0.5       90.81        perf-stat.i.node-load-miss-ra=
te%
     20.05 =C2=B1  6%      +2.4       22.49 =C2=B1 10%  perf-stat.overall.c=
ache-miss-rate%
     78.86            +0.9       79.75        perf-stat.overall.node-store-=
miss-rate%
     49116 =C2=B1 58%     -98.8%     612.50 =C2=B1 58%  numa-meminfo.node0.=
AnonHugePages
    252747 =C2=B1  5%      +7.3%     271178 =C2=B1  4%  numa-meminfo.node0.=
FilePages
      3256 =C2=B1 40%     -67.0%       1075 =C2=B1 13%  numa-meminfo.node1.=
Inactive
    829650 =C2=B1 10%     -21.7%     649923        numa-meminfo.node1.MemUs=
ed
     26061 =C2=B1 29%     -29.2%      18456        numa-meminfo.node1.PageT=
ables
      5095 =C2=B1168%    +311.5%      20968 =C2=B1 85%  numa-meminfo.node2.=
AnonHugePages
     24108 =C2=B1 23%     +30.3%      31425 =C2=B1 17%  numa-meminfo.node3.=
KReclaimable
     21780 =C2=B1 11%     +21.2%      26407 =C2=B1  2%  numa-meminfo.node3.=
PageTables
     24108 =C2=B1 23%     +30.3%      31425 =C2=B1 17%  numa-meminfo.node3.=
SReclaimable
      1094 =C2=B1 34%    +190.6%       3179 =C2=B1 42%  numa-meminfo.node3.=
Shmem
    100972 =C2=B1  8%      +9.4%     110438 =C2=B1  6%  numa-meminfo.node3.=
Slab
      2534 =C2=B1100%    +203.6%       7695 =C2=B1 29%  sched_debug.cfs_rq:=
/.MIN_vruntime.avg
    486638 =C2=B1100%    +105.9%    1001882 =C2=B1  3%  sched_debug.cfs_rq:=
/.MIN_vruntime.max
     35028 =C2=B1100%    +145.6%      86026 =C2=B1 13%  sched_debug.cfs_rq:=
/.MIN_vruntime.stddev
      2534 =C2=B1100%    +203.6%       7695 =C2=B1 29%  sched_debug.cfs_rq:=
/.max_vruntime.avg
    486638 =C2=B1100%    +105.9%    1001882 =C2=B1  3%  sched_debug.cfs_rq:=
/.max_vruntime.max
     35028 =C2=B1100%    +145.6%      86026 =C2=B1 13%  sched_debug.cfs_rq:=
/.max_vruntime.stddev
      0.29 =C2=B1 15%     +16.7%       0.34 =C2=B1  5%  sched_debug.cfs_rq:=
/.nr_spread_over.stddev
     10223 =C2=B1107%    +180.5%      28676 =C2=B1 46%  sched_debug.cfs_rq:=
/.spread0.avg
     82274 =C2=B1 16%     +26.7%     104241 =C2=B1  6%  sched_debug.cfs_rq:=
/.spread0.max
    -41611           -39.3%     -25237        sched_debug.cfs_rq:/.spread0.=
min
      1.47 =C2=B1 72%     -54.7%       0.67 =C2=B1  2%  sched_debug.cpu.cpu=
_load[0].avg
     11.54 =C2=B1130%     -78.0%       2.54 =C2=B1  3%  sched_debug.cpu.cpu=
_load[0].stddev
     60.88 =C2=B1 26%     +38.8%      84.50 =C2=B1  8%  sched_debug.cpu.cpu=
_load[3].max
      9596 =C2=B1 20%     +26.1%      12101 =C2=B1 14%  sched_debug.cpu.cur=
r->pid.avg
    280526 =C2=B1 91%     -92.8%      20294        sched_debug.cpu.load.max
     50817 =C2=B1  6%     +17.6%      59740 =C2=B1  6%  sched_debug.cpu.nr_=
load_updates.max
      1454 =C2=B1 11%     +34.6%       1957 =C2=B1  7%  sched_debug.cpu.nr_=
load_updates.stddev
     14922 =C2=B1  6%     +12.0%      16718        softirqs.CPU0.SCHED
     17109 =C2=B1  2%     +17.3%      20074 =C2=B1 11%  softirqs.CPU10.RCU
     16556 =C2=B1  2%     +10.4%      18285 =C2=B1  4%  softirqs.CPU109.RCU
     10912 =C2=B1  4%      +6.6%      11636 =C2=B1  3%  softirqs.CPU109.SCH=
ED
     26380 =C2=B1  5%     +19.5%      31531 =C2=B1 13%  softirqs.CPU109.TIM=
ER
     17052 =C2=B1  4%     +34.2%      22878 =C2=B1 26%  softirqs.CPU11.RCU
     10926 =C2=B1  4%     +27.8%      13963 =C2=B1 12%  softirqs.CPU11.SCHED
     27695 =C2=B1  5%     +44.6%      40059 =C2=B1 23%  softirqs.CPU11.TIMER
     17034            +6.5%      18135 =C2=B1  3%  softirqs.CPU119.RCU
     10905 =C2=B1  3%      +7.3%      11705 =C2=B1  5%  softirqs.CPU119.SCH=
ED
     10900 =C2=B1  5%      +5.2%      11462 =C2=B1  5%  softirqs.CPU12.SCHED
     10705 =C2=B1  3%      +4.6%      11195 =C2=B1  4%  softirqs.CPU121.SCH=
ED
     10596 =C2=B1  4%      +5.1%      11139 =C2=B1  5%  softirqs.CPU138.SCH=
ED
     16059 =C2=B1  7%     +14.7%      18424 =C2=B1 10%  softirqs.CPU141.RCU
     10472 =C2=B1  5%      +5.5%      11044 =C2=B1  5%  softirqs.CPU143.SCH=
ED
     10663 =C2=B1  4%      +3.7%      11059 =C2=B1  4%  softirqs.CPU159.SCH=
ED
     10779 =C2=B1  5%     +13.0%      12177 =C2=B1  4%  softirqs.CPU180.SCH=
ED
     17166 =C2=B1  2%     +10.7%      19002 =C2=B1  5%  softirqs.CPU19.RCU
     27980 =C2=B1  5%     +15.6%      32334 =C2=B1  2%  softirqs.CPU2.TIMER
     16568 =C2=B1  3%     +10.7%      18348 =C2=B1  3%  softirqs.CPU24.RCU
     16860 =C2=B1  2%     +14.6%      19322 =C2=B1 10%  softirqs.CPU25.RCU
     10843 =C2=B1  2%      +5.7%      11459 =C2=B1  3%  softirqs.CPU38.SCHED
     10689 =C2=B1  3%      +4.4%      11163 =C2=B1  5%  softirqs.CPU46.SCHED
     11435 =C2=B1 12%     +16.7%      13347 =C2=B1 13%  softirqs.CPU55.SCHED
     28041 =C2=B1 11%     +13.1%      31725 =C2=B1 10%  softirqs.CPU55.TIMER
     10694 =C2=B1  4%     +10.6%      11832 =C2=B1  3%  softirqs.CPU61.SCHED
     11175 =C2=B1  6%     +10.5%      12354 =C2=B1  8%  softirqs.CPU72.SCHED
      0.72 =C2=B1115%      +1.1        1.85 =C2=B1 28%  perf-profile.calltr=
ace.cycles-pp.__x64_sys_mprotect.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me
      0.72 =C2=B1115%      +1.1        1.85 =C2=B1 28%  perf-profile.calltr=
ace.cycles-pp.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYS=
CALL_64_after_hwframe
      0.72 =C2=B1115%      +1.1        1.85 =C2=B1 28%  perf-profile.calltr=
ace.cycles-pp.do_mprotect_pkey.__x64_sys_mprotect.do_syscall_64.entry_SYSCA=
LL_64_after_hwframe
      0.72 =C2=B1115%      +1.1        1.85 =C2=B1 28%  perf-profile.calltr=
ace.cycles-pp.mprotect_fixup.do_mprotect_pkey.__x64_sys_mprotect.do_syscall=
_64.entry_SYSCALL_64_after_hwframe
      0.47 =C2=B1100%      +1.4        1.85 =C2=B1 28%  perf-profile.calltr=
ace.cycles-pp.mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_=
64
      0.43 =C2=B1173%      +1.4        1.85 =C2=B1 28%  perf-profile.calltr=
ace.cycles-pp.do_dentry_open.path_openat.do_filp_open.do_sys_open.do_syscal=
l_64
      0.00            +1.9        1.85 =C2=B1 28%  perf-profile.calltrace.c=
ycles-pp.clockevents_program_event.hrtimer_interrupt.smp_apic_timer_interru=
pt.apic_timer_interrupt.cpuidle_enter_state
     44.74 =C2=B1 11%      +8.3       53.00 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_star=
tup_entry
     47.19 =C2=B1 14%     +10.0       57.23        perf-profile.calltrace.c=
ycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.start_=
secondary
     47.15 =C2=B1 14%     +11.3       58.42        perf-profile.calltrace.c=
ycles-pp.secondary_startup_64
     47.15 =C2=B1 14%     +11.3       58.42        perf-profile.calltrace.c=
ycles-pp.start_secondary.secondary_startup_64
     47.15 =C2=B1 14%     +11.3       58.42        perf-profile.calltrace.c=
ycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64
     47.15 =C2=B1 14%     +11.3       58.42        perf-profile.calltrace.c=
ycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
     46.93 =C2=B1 14%     +11.5       58.42        perf-profile.calltrace.c=
ycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.secondary_=
startup_64
     40.50 =C2=B1 19%     -10.9       29.62 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.entry_SYSCALL_64_after_hwframe
     40.29 =C2=B1 19%     -10.7       29.62 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.do_syscall_64
      2.91 =C2=B1 47%      -2.2        0.67 =C2=B1100%  perf-profile.childr=
en.cycles-pp.mutex_lock
      0.72 =C2=B1115%      +1.1        1.85 =C2=B1 28%  perf-profile.childr=
en.cycles-pp.__x64_sys_mprotect
      0.72 =C2=B1115%      +1.1        1.85 =C2=B1 28%  perf-profile.childr=
en.cycles-pp.do_mmap
      0.72 =C2=B1115%      +1.1        1.85 =C2=B1 28%  perf-profile.childr=
en.cycles-pp.do_mprotect_pkey
      0.72 =C2=B1115%      +1.1        1.85 =C2=B1 28%  perf-profile.childr=
en.cycles-pp.ksys_mmap_pgoff
      0.72 =C2=B1115%      +1.1        1.85 =C2=B1 28%  perf-profile.childr=
en.cycles-pp.mprotect_fixup
      0.72 =C2=B1115%      +1.1        1.85 =C2=B1 28%  perf-profile.childr=
en.cycles-pp.vm_mmap_pgoff
      0.47 =C2=B1100%      +1.4        1.85 =C2=B1 28%  perf-profile.childr=
en.cycles-pp.mmap_region
      0.43 =C2=B1173%      +1.4        1.85 =C2=B1 28%  perf-profile.childr=
en.cycles-pp.do_dentry_open
      0.00            +1.9        1.85 =C2=B1 28%  perf-profile.children.cy=
cles-pp.clockevents_program_event
      0.00            +3.7        3.71 =C2=B1 28%  perf-profile.children.cy=
cles-pp._raw_spin_lock
     44.74 =C2=B1 11%      +8.3       53.00 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.intel_idle
     47.15 =C2=B1 14%     +11.3       58.42        perf-profile.children.cy=
cles-pp.secondary_startup_64
     47.15 =C2=B1 14%     +11.3       58.42        perf-profile.children.cy=
cles-pp.start_secondary
     47.15 =C2=B1 14%     +11.3       58.42        perf-profile.children.cy=
cles-pp.cpu_startup_entry
     47.15 =C2=B1 14%     +11.3       58.42        perf-profile.children.cy=
cles-pp.do_idle
     46.93 =C2=B1 14%     +11.5       58.42        perf-profile.children.cy=
cles-pp.cpuidle_enter
     46.93 =C2=B1 14%     +11.5       58.42        perf-profile.children.cy=
cles-pp.cpuidle_enter_state
      2.91 =C2=B1 47%      -2.2        0.67 =C2=B1100%  perf-profile.self.c=
ycles-pp.mutex_lock
      0.00            +3.7        3.71 =C2=B1 28%  perf-profile.self.cycles=
-pp._raw_spin_lock
     44.74 =C2=B1 11%      +8.3       53.00 =C2=B1  5%  perf-profile.self.c=
ycles-pp.intel_idle
      1846 =C2=B1  5%     +11.6%       2060 =C2=B1  7%  interrupts.CPU0.TLB=
:TLB_shootdowns
      2000 =C2=B1  2%     +10.2%       2205 =C2=B1  7%  interrupts.CPU1.TLB=
:TLB_shootdowns
      2086 =C2=B1  4%      +9.8%       2291 =C2=B1  8%  interrupts.CPU100.T=
LB:TLB_shootdowns
      2030 =C2=B1  5%     +12.5%       2285 =C2=B1  8%  interrupts.CPU103.T=
LB:TLB_shootdowns
    746.75 =C2=B1  8%     -14.1%     641.50 =C2=B1  3%  interrupts.CPU104.R=
ES:Rescheduling_interrupts
      1989 =C2=B1  5%     +13.6%       2259 =C2=B1  4%  interrupts.CPU107.T=
LB:TLB_shootdowns
      2014 =C2=B1  5%     +11.6%       2247 =C2=B1  3%  interrupts.CPU108.T=
LB:TLB_shootdowns
      2024 =C2=B1  4%      +9.7%       2222 =C2=B1  4%  interrupts.CPU109.T=
LB:TLB_shootdowns
      2008 =C2=B1  2%     +16.0%       2330 =C2=B1  6%  interrupts.CPU11.TL=
B:TLB_shootdowns
      2013 =C2=B1  4%      +9.9%       2212 =C2=B1  7%  interrupts.CPU113.T=
LB:TLB_shootdowns
      1967 =C2=B1  5%     +14.0%       2243 =C2=B1  4%  interrupts.CPU114.T=
LB:TLB_shootdowns
      1989 =C2=B1  5%      +9.6%       2180 =C2=B1  8%  interrupts.CPU117.T=
LB:TLB_shootdowns
      2015 =C2=B1  2%     +10.0%       2216 =C2=B1  4%  interrupts.CPU118.T=
LB:TLB_shootdowns
      2006 =C2=B1  5%     +14.0%       2286 =C2=B1  4%  interrupts.CPU119.T=
LB:TLB_shootdowns
    899.25 =C2=B1  4%     +11.0%     998.00 =C2=B1  3%  interrupts.CPU120.R=
ES:Rescheduling_interrupts
      1881 =C2=B1  6%     +12.9%       2124 =C2=B1  8%  interrupts.CPU120.T=
LB:TLB_shootdowns
      2070 =C2=B1  6%      +7.9%       2233 =C2=B1  6%  interrupts.CPU121.T=
LB:TLB_shootdowns
    134762 =C2=B1  4%     +16.7%     157232 =C2=B1  4%  interrupts.CPU128.L=
OC:Local_timer_interrupts
      1999 =C2=B1  4%     +12.2%       2244 =C2=B1 10%  interrupts.CPU128.T=
LB:TLB_shootdowns
      2039 =C2=B1  8%      +8.4%       2212 =C2=B1  6%  interrupts.CPU129.T=
LB:TLB_shootdowns
      2019 =C2=B1  5%     +17.3%       2369 =C2=B1  7%  interrupts.CPU13.TL=
B:TLB_shootdowns
    133696 =C2=B1  4%      +6.1%     141813 =C2=B1  4%  interrupts.CPU130.L=
OC:Local_timer_interrupts
      2071 =C2=B1  7%      +8.0%       2236 =C2=B1  8%  interrupts.CPU131.T=
LB:TLB_shootdowns
      2063 =C2=B1  4%     +10.0%       2270 =C2=B1  6%  interrupts.CPU135.T=
LB:TLB_shootdowns
      2033 =C2=B1  5%     +11.5%       2266 =C2=B1  6%  interrupts.CPU136.T=
LB:TLB_shootdowns
    132973 =C2=B1  4%      +6.2%     141217 =C2=B1  4%  interrupts.CPU139.L=
OC:Local_timer_interrupts
      2041 =C2=B1  6%     +10.9%       2265 =C2=B1  9%  interrupts.CPU140.T=
LB:TLB_shootdowns
      2036 =C2=B1  5%     +10.8%       2255 =C2=B1  8%  interrupts.CPU141.T=
LB:TLB_shootdowns
      2023 =C2=B1  7%     +11.9%       2263 =C2=B1  5%  interrupts.CPU143.T=
LB:TLB_shootdowns
      2030 =C2=B1  6%     +10.0%       2233 =C2=B1  9%  interrupts.CPU145.T=
LB:TLB_shootdowns
      1991 =C2=B1  4%     +18.5%       2360 =C2=B1  5%  interrupts.CPU159.T=
LB:TLB_shootdowns
      2091 =C2=B1  5%      +7.9%       2256 =C2=B1  7%  interrupts.CPU160.T=
LB:TLB_shootdowns
      2070 =C2=B1  4%     +10.6%       2290 =C2=B1  5%  interrupts.CPU161.T=
LB:TLB_shootdowns
      2064 =C2=B1  7%     +11.9%       2310 =C2=B1  5%  interrupts.CPU162.T=
LB:TLB_shootdowns
      2062 =C2=B1  5%     +13.2%       2336 =C2=B1  7%  interrupts.CPU163.T=
LB:TLB_shootdowns
      2064 =C2=B1  8%     +12.7%       2326 =C2=B1 10%  interrupts.CPU165.T=
LB:TLB_shootdowns
      2033 =C2=B1  6%     +13.2%       2302 =C2=B1  9%  interrupts.CPU166.T=
LB:TLB_shootdowns
      2088 =C2=B1  6%      +9.7%       2292 =C2=B1  5%  interrupts.CPU167.T=
LB:TLB_shootdowns
      2004 =C2=B1  6%      +9.8%       2201 =C2=B1 10%  interrupts.CPU174.T=
LB:TLB_shootdowns
      2047 =C2=B1  2%     +12.2%       2297 =C2=B1  9%  interrupts.CPU176.T=
LB:TLB_shootdowns
    763.00 =C2=B1  6%     -10.4%     683.50        interrupts.CPU181.RES:Re=
scheduling_interrupts
      2087 =C2=B1  7%      +7.5%       2244 =C2=B1  7%  interrupts.CPU182.T=
LB:TLB_shootdowns
      2101 =C2=B1  3%     +11.5%       2342 =C2=B1  9%  interrupts.CPU186.T=
LB:TLB_shootdowns
      2009 =C2=B1  4%     +14.4%       2299 =C2=B1  9%  interrupts.CPU187.T=
LB:TLB_shootdowns
      2073 =C2=B1  2%      +6.2%       2201 =C2=B1  6%  interrupts.CPU189.T=
LB:TLB_shootdowns
      2070 =C2=B1  9%      +8.5%       2246 =C2=B1  6%  interrupts.CPU190.T=
LB:TLB_shootdowns
      1995 =C2=B1  4%     +11.4%       2223 =C2=B1  5%  interrupts.CPU23.TL=
B:TLB_shootdowns
    890.25 =C2=B1  5%      +8.4%     965.00 =C2=B1  4%  interrupts.CPU24.RE=
S:Rescheduling_interrupts
    133004 =C2=B1  4%      +6.7%     141981 =C2=B1  5%  interrupts.CPU35.LO=
C:Local_timer_interrupts
      2057 =C2=B1  6%      +9.7%       2257 =C2=B1  4%  interrupts.CPU36.TL=
B:TLB_shootdowns
      2033 =C2=B1  3%     +10.0%       2237 =C2=B1  7%  interrupts.CPU37.TL=
B:TLB_shootdowns
    133340 =C2=B1  5%      +5.9%     141238 =C2=B1  4%  interrupts.CPU42.LO=
C:Local_timer_interrupts
    134080 =C2=B1  5%      +6.2%     142377 =C2=B1  5%  interrupts.CPU44.LO=
C:Local_timer_interrupts
      2075 =C2=B1  2%     +12.6%       2335 =C2=B1  6%  interrupts.CPU44.TL=
B:TLB_shootdowns
      2018 =C2=B1  4%     +16.7%       2355 =C2=B1  9%  interrupts.CPU45.TL=
B:TLB_shootdowns
      2029 =C2=B1  4%     +16.1%       2356 =C2=B1  3%  interrupts.CPU5.TLB=
:TLB_shootdowns
      2125 =C2=B1  4%      +8.0%       2296 =C2=B1  4%  interrupts.CPU50.TL=
B:TLB_shootdowns
      2054            +8.6%       2231 =C2=B1  7%  interrupts.CPU54.TLB:TLB=
_shootdowns
      2043 =C2=B1  5%     +12.9%       2306 =C2=B1  9%  interrupts.CPU56.TL=
B:TLB_shootdowns
      2098 =C2=B1  5%      +8.4%       2274 =C2=B1  2%  interrupts.CPU61.TL=
B:TLB_shootdowns
      2027 =C2=B1  2%     +13.7%       2306 =C2=B1  7%  interrupts.CPU63.TL=
B:TLB_shootdowns
      2018 =C2=B1  9%     +13.1%       2283 =C2=B1  7%  interrupts.CPU66.TL=
B:TLB_shootdowns
    772.25 =C2=B1  6%     -10.1%     694.50        interrupts.CPU69.RES:Res=
cheduling_interrupts
      2050 =C2=B1  5%     +12.8%       2312 =C2=B1 10%  interrupts.CPU70.TL=
B:TLB_shootdowns
      2114 =C2=B1  3%      +8.5%       2295 =C2=B1  6%  interrupts.CPU74.TL=
B:TLB_shootdowns
      2179 =C2=B1  6%      +8.4%       2361 =C2=B1  5%  interrupts.CPU86.TL=
B:TLB_shootdowns
      2043 =C2=B1  5%     +11.3%       2273 =C2=B1  7%  interrupts.CPU9.TLB=
:TLB_shootdowns
      2078 =C2=B1  2%     +10.8%       2301 =C2=B1  7%  interrupts.CPU90.TL=
B:TLB_shootdowns
      2036 =C2=B1  4%      +8.2%       2204 =C2=B1  6%  interrupts.CPU92.TL=
B:TLB_shootdowns
      2063 =C2=B1  8%     +11.0%       2289 =C2=B1  9%  interrupts.CPU93.TL=
B:TLB_shootdowns
      2008 =C2=B1  5%     +10.7%       2223 =C2=B1  6%  interrupts.CPU96.TL=
B:TLB_shootdowns
      1985 =C2=B1  6%     +11.7%       2218 =C2=B1  7%  interrupts.CPU98.TL=
B:TLB_shootdowns
    395318 =C2=B1  4%      +8.3%     428205 =C2=B1  8%  interrupts.TLB:TLB_=
shootdowns



***************************************************************************=
************************
lkp-skl-4sp1: 192 threads Skylake-SP with 256G memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testc=
ase:
  gcc-7/performance/x86_64-rhel-7.6/process/100%/debian-x86_64-2019-05-14.c=
gz/lkp-skl-4sp1/pwrite2/will-it-scale

commit: =

  4f23dbc1e6 ("locking/rwsem: Implement lock handoff to prevent lock starva=
tion")
  00f3c5a3df ("locking/rwsem: Always release wait_lock before waking up tas=
ks")

4f23dbc1e657951e 00f3c5a3df2c1e3dab14d0dd2b7 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    407.25 =C2=B1  5%     -21.8%     318.50 =C2=B1 16%  kthread_noise.total=
_time
      0.00 =C2=B1  6%      +0.0        0.00 =C2=B1 61%  mpstat.cpu.all.soft%
      0.05 =C2=B1  3%      +0.0        0.06 =C2=B1  9%  mpstat.cpu.all.usr%
      6.41 =C2=B1 12%     -36.3%       4.08 =C2=B1 26%  irq_exception_noise=
.__do_page_fault.95th
     11.54 =C2=B1  5%     -30.4%       8.02 =C2=B1  6%  irq_exception_noise=
.__do_page_fault.99th
    201126 =C2=B1  4%     +35.7%     272858 =C2=B1 24%  irq_exception_noise=
.softirq_time
     25808            +1.6%      26225        proc-vmstat.nr_slab_reclaimab=
le
    472.50 =C2=B1 56%    +628.3%       3441 =C2=B1 80%  proc-vmstat.numa_hi=
nt_faults_local
   1555625            -2.4%    1517554        proc-vmstat.numa_hit
   1410822 =C2=B1  2%      -2.7%    1372898        proc-vmstat.numa_local
      2706 =C2=B1  7%     +13.1%       3060 =C2=B1  8%  proc-vmstat.pgactiv=
ate
     67.00           +28.4%      86.00 =C2=B1 19%  turbostat.Avg_MHz
      4.69            +1.2        5.85 =C2=B1 18%  turbostat.Busy%
      0.09 =C2=B1 28%   +1883.3%       1.79 =C2=B1 92%  turbostat.Pkg%pc2
     37.00            +5.4%      39.00        turbostat.PkgTmp
    191.96            +4.7%     200.91 =C2=B1  3%  turbostat.PkgWatt
     52.35           +17.2%      61.37 =C2=B1 12%  turbostat.RAMWatt
     16717 =C2=B1  5%     +11.2%      18597        slabinfo.cred_jar.active=
_objs
     16717 =C2=B1  5%     +11.2%      18597        slabinfo.cred_jar.num_ob=
js
      4493 =C2=B1  3%     -10.8%       4007 =C2=B1  2%  slabinfo.eventpoll_=
pwq.active_objs
      4493 =C2=B1  3%     -10.8%       4007 =C2=B1  2%  slabinfo.eventpoll_=
pwq.num_objs
     51900 =C2=B1  4%      +6.3%      55166 =C2=B1  3%  slabinfo.filp.activ=
e_objs
     52293 =C2=B1  4%      +6.9%      55879 =C2=B1  3%  slabinfo.filp.num_o=
bjs
      1299 =C2=B1  6%     +11.8%       1453 =C2=B1  4%  slabinfo.task_group=
.active_objs
      1299 =C2=B1  6%     +11.8%       1453 =C2=B1  4%  slabinfo.task_group=
.num_objs
     10619 =C2=B1 85%     -95.4%     485.50 =C2=B1 63%  numa-meminfo.node1.=
Inactive(anon)
      1041 =C2=B1112%    +892.0%      10332 =C2=B1 75%  numa-meminfo.node2.=
Inactive
    320.75 =C2=B1 34%   +3121.2%      10332 =C2=B1 75%  numa-meminfo.node2.=
Inactive(anon)
     15907 =C2=B1 21%     +60.7%      25570 =C2=B1 17%  numa-meminfo.node2.=
KReclaimable
      6626 =C2=B1  6%     +15.9%       7683 =C2=B1  7%  numa-meminfo.node2.=
KernelStack
      8908 =C2=B1  8%     +53.3%      13657 =C2=B1 31%  numa-meminfo.node2.=
PageTables
     15907 =C2=B1 21%     +60.7%      25570 =C2=B1 17%  numa-meminfo.node2.=
SReclaimable
     53362 =C2=B1 10%     +25.5%      66971        numa-meminfo.node2.SUnre=
claim
    927.75 =C2=B1 95%   +1203.5%      12093 =C2=B1 53%  numa-meminfo.node2.=
Shmem
     69269 =C2=B1 12%     +33.6%      92541 =C2=B1  5%  numa-meminfo.node2.=
Slab
      2654 =C2=B1 85%     -95.4%     121.00 =C2=B1 63%  numa-vmstat.node1.n=
r_inactive_anon
      2161 =C2=B1 23%     -40.1%       1294        numa-vmstat.node1.nr_map=
ped
      2654 =C2=B1 85%     -95.4%     121.00 =C2=B1 63%  numa-vmstat.node1.n=
r_zone_inactive_anon
     79.75 =C2=B1 34%   +3138.2%       2582 =C2=B1 75%  numa-vmstat.node2.n=
r_inactive_anon
      6622 =C2=B1  6%     +15.9%       7676 =C2=B1  7%  numa-vmstat.node2.n=
r_kernel_stack
      1465 =C2=B1 21%     +38.6%       2030 =C2=B1 30%  numa-vmstat.node2.n=
r_mapped
      2224 =C2=B1  8%     +53.4%       3412 =C2=B1 30%  numa-vmstat.node2.n=
r_page_table_pages
    231.25 =C2=B1 95%   +1207.0%       3022 =C2=B1 53%  numa-vmstat.node2.n=
r_shmem
      3976 =C2=B1 21%     +60.8%       6392 =C2=B1 17%  numa-vmstat.node2.n=
r_slab_reclaimable
     13340 =C2=B1 10%     +25.5%      16744        numa-vmstat.node2.nr_sla=
b_unreclaimable
     79.75 =C2=B1 34%   +3138.2%       2582 =C2=B1 75%  numa-vmstat.node2.n=
r_zone_inactive_anon
    465714 =C2=B1 32%     +62.3%     755809 =C2=B1 36%  numa-vmstat.node2.n=
uma_hit
    336044 =C2=B1 46%     +90.6%     640510 =C2=B1 46%  numa-vmstat.node2.n=
uma_local
      2005 =C2=B1  2%     +11.6%       2238 =C2=B1 10%  sched_debug.cfs_rq:=
/.exec_clock.avg
     14.00 =C2=B1  4%     -12.0%      12.31        sched_debug.cpu.clock.st=
ddev
     14.00 =C2=B1  4%     -12.0%      12.31        sched_debug.cpu.clock_ta=
sk.stddev
      1.37 =C2=B1  4%     +17.5%       1.61 =C2=B1  4%  sched_debug.cpu.cpu=
_load[1].avg
    199.10 =C2=B1  2%     +24.5%     247.97 =C2=B1  3%  sched_debug.cpu.cpu=
_load[1].max
     14.80 =C2=B1  2%     +21.4%      17.97 =C2=B1  4%  sched_debug.cpu.cpu=
_load[1].stddev
      1.31 =C2=B1  5%     +11.0%       1.46 =C2=B1  2%  sched_debug.cpu.cpu=
_load[2].avg
    195.25 =C2=B1  2%     +13.3%     221.23        sched_debug.cpu.cpu_load=
[2].max
     14.48 =C2=B1  2%     +10.9%      16.06        sched_debug.cpu.cpu_load=
[2].stddev
      5483 =C2=B1 15%    +201.0%      16507 =C2=B1 60%  sched_debug.cpu.max=
_idle_balance_cost.stddev
      0.00 =C2=B1  8%     -11.9%       0.00        sched_debug.cpu.next_bal=
ance.stddev
    130966           +11.5%     146000 =C2=B1 10%  sched_debug.cpu.nr_load_=
updates.avg
    139797           +11.3%     155637 =C2=B1  9%  sched_debug.cpu.nr_load_=
updates.max
    127184           +12.5%     143112 =C2=B1  9%  sched_debug.cpu.nr_load_=
updates.min
      2.20            +3.6        5.82 =C2=B1 61%  perf-stat.i.branch-miss-=
rate%
  17065871          +128.2%   38940396 =C2=B1 54%  perf-stat.i.branch-misses
  15171379 =C2=B1  4%     -11.5%   13428822 =C2=B1  5%  perf-stat.i.cache-m=
isses
      3.61           +34.7%       4.87 =C2=B1 23%  perf-stat.i.cpi
 1.207e+10           +26.4%  1.525e+10 =C2=B1 18%  perf-stat.i.cpu-cycles
    873.59 =C2=B1 11%     +32.5%       1157 =C2=B1 22%  perf-stat.i.cycles-=
between-cache-misses
      0.00 =C2=B1  4%      +0.1        0.09 =C2=B1 94%  perf-stat.i.dTLB-st=
ore-miss-rate%
     24641 =C2=B1  3%   +1481.0%     389570 =C2=B1 92%  perf-stat.i.dTLB-st=
ore-misses
      0.28           -21.4%       0.22 =C2=B1 23%  perf-stat.i.ipc
     33574 =C2=B1  6%     +17.3%      39391 =C2=B1  9%  perf-stat.i.node-lo=
ads
   1501402 =C2=B1 11%     -16.1%    1260418 =C2=B1  4%  perf-stat.i.node-st=
ore-misses
      2.35            +3.5        5.82 =C2=B1 58%  perf-stat.overall.branch=
-miss-rate%
      3.54           +33.5%       4.72 =C2=B1 23%  perf-stat.overall.cpi
    798.25 =C2=B1  5%     +44.0%       1149 =C2=B1 23%  perf-stat.overall.c=
ycles-between-cache-misses
      0.00 =C2=B1  3%      +0.1        0.08 =C2=B1 93%  perf-stat.overall.d=
TLB-store-miss-rate%
      0.28           -20.8%       0.22 =C2=B1 23%  perf-stat.overall.ipc
  17098757          +127.2%   38846297 =C2=B1 54%  perf-stat.ps.branch-miss=
es
  15119630 =C2=B1  4%     -11.5%   13383715 =C2=B1  5%  perf-stat.ps.cache-=
misses
 1.204e+10           +26.3%   1.52e+10 =C2=B1 17%  perf-stat.ps.cpu-cycles
     24654 =C2=B1  3%   +1475.3%     388374 =C2=B1 92%  perf-stat.ps.dTLB-s=
tore-misses
     33486 =C2=B1  6%     +17.3%      39294 =C2=B1  8%  perf-stat.ps.node-l=
oads
   1496284 =C2=B1 11%     -16.1%    1256127 =C2=B1  4%  perf-stat.ps.node-s=
tore-misses
     19.96 =C2=B1 21%      -7.3       12.65 =C2=B1 10%  perf-profile.calltr=
ace.cycles-pp.new_sync_write.vfs_write.ksys_pwrite64.do_syscall_64.entry_SY=
SCALL_64_after_hwframe
     20.20 =C2=B1 21%      -7.3       12.89 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.vfs_write.ksys_pwrite64.do_syscall_64.entry_SYSCALL_64_after_=
hwframe.__libc_pwrite
     20.25 =C2=B1 21%      -7.3       12.95 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.ksys_pwrite64.do_syscall_64.entry_SYSCALL_64_after_hwframe.__=
libc_pwrite
     20.35 =C2=B1 21%      -7.3       13.05 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_pwrite
     20.36 =C2=B1 21%      -7.3       13.07 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_pwrite
     19.85 =C2=B1 21%      -7.3       12.56 =C2=B1 10%  perf-profile.calltr=
ace.cycles-pp.generic_file_write_iter.new_sync_write.vfs_write.ksys_pwrite6=
4.do_syscall_64
     20.92 =C2=B1 20%      -7.3       13.66 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.__libc_pwrite
     14.24 =C2=B1 31%      -6.7        7.52 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.down_write.generic_file_write_iter.new_sync_write.vfs_write.k=
sys_pwrite64
     13.94 =C2=B1 32%      -6.7        7.26 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.rwsem_down_write_slowpath.down_write.generic_file_write_iter.=
new_sync_write.vfs_write
      0.54 =C2=B1  4%      +0.0        0.58 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.stack_trace_save_tsk.__account_scheduler_latency.enqueue_enti=
ty.enqueue_task_fair.activate_task
      1.04 =C2=B1 12%      +0.5        1.50        perf-profile.calltrace.c=
ycles-pp.tick_irq_enter.irq_enter.smp_apic_timer_interrupt.apic_timer_inter=
rupt.cpuidle_enter_state
      0.00            +0.5        0.53 =C2=B1  3%  perf-profile.calltrace.c=
ycles-pp.arch_stack_walk.stack_trace_save_tsk.__account_scheduler_latency.e=
nqueue_entity.enqueue_task_fair
      1.23 =C2=B1 11%      +0.7        1.88 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.irq_enter.smp_apic_timer_interrupt.apic_timer_interrupt.cpuid=
le_enter_state.cpuidle_enter
      3.32 =C2=B1 14%      +0.7        4.05 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.smp_a=
pic_timer_interrupt.apic_timer_interrupt
      1.06 =C2=B1  9%      +0.8        1.86        perf-profile.calltrace.c=
ycles-pp.perf_mux_hrtimer_handler.__hrtimer_run_queues.hrtimer_interrupt.sm=
p_apic_timer_interrupt.apic_timer_interrupt
      0.00            +0.9        0.93 =C2=B1 11%  perf-profile.calltrace.c=
ycles-pp.ktime_get.perf_mux_hrtimer_handler.__hrtimer_run_queues.hrtimer_in=
terrupt.smp_apic_timer_interrupt
      4.92 =C2=B1 12%      +2.2        7.08 =C2=B1 12%  perf-profile.calltr=
ace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.smp_apic_timer_interru=
pt.apic_timer_interrupt.cpuidle_enter_state
      9.38 =C2=B1 14%      +2.8       12.21 =C2=B1 10%  perf-profile.calltr=
ace.cycles-pp.hrtimer_interrupt.smp_apic_timer_interrupt.apic_timer_interru=
pt.cpuidle_enter_state.cpuidle_enter
     20.57 =C2=B1 10%      +3.0       23.55 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.do_idl=
e.cpu_startup_entry
     17.96 =C2=B1 10%      +3.0       21.00 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter_s=
tate.cpuidle_enter.do_idle
     43.67 =C2=B1  5%      +5.1       48.73 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_star=
tup_entry
     77.15 =C2=B1  7%      +8.3       85.41        perf-profile.calltrace.c=
ycles-pp.secondary_startup_64
     76.62 =C2=B1  7%      +8.4       85.03        perf-profile.calltrace.c=
ycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64
     76.62 =C2=B1  7%      +8.4       85.03        perf-profile.calltrace.c=
ycles-pp.start_secondary.secondary_startup_64
     76.58 =C2=B1  7%      +8.4       85.00        perf-profile.calltrace.c=
ycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
     64.90 =C2=B1  6%      +8.9       73.77 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.secon=
dary_startup_64
     64.56 =C2=B1  6%      +9.0       73.60 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.s=
tart_secondary
     21.55 =C2=B1 26%      -8.2       13.31 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.do_syscall_64
     21.57 =C2=B1 26%      -8.2       13.33 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.entry_SYSCALL_64_after_hwframe
     19.97 =C2=B1 21%      -7.3       12.66 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.new_sync_write
     20.25 =C2=B1 21%      -7.3       12.95 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.ksys_pwrite64
     20.21 =C2=B1 21%      -7.3       12.91 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.vfs_write
     19.85 =C2=B1 21%      -7.3       12.56 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.generic_file_write_iter
     20.96 =C2=B1 20%      -7.3       13.70 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.__libc_pwrite
     14.29 =C2=B1 32%      -6.8        7.52 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.down_write
     14.02 =C2=B1 32%      -6.7        7.29 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.rwsem_down_write_slowpath
      2.11 =C2=B1 35%      -0.7        1.39 =C2=B1 15%  perf-profile.childr=
en.cycles-pp._raw_spin_lock_irqsave
      0.47 =C2=B1 17%      -0.2        0.30 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.arch_cpu_idle_enter
      0.41 =C2=B1 19%      -0.2        0.25 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.tsc_verify_tsc_adjust
      0.53 =C2=B1  8%      -0.1        0.41 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.update_load_avg
      0.22 =C2=B1 11%      -0.1        0.15 =C2=B1 20%  perf-profile.childr=
en.cycles-pp.__update_load_avg_se
      0.47 =C2=B1  3%      -0.1        0.42 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.run_timer_softirq
      0.10 =C2=B1  8%      +0.0        0.13 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.__orc_find
      0.06 =C2=B1 11%      +0.0        0.09 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.get_cpu_device
      0.14 =C2=B1  6%      +0.0        0.17 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.rcu_irq_exit
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.update_rt_rq_load_avg
      0.08 =C2=B1 12%      +0.0        0.12 =C2=B1 19%  perf-profile.childr=
en.cycles-pp.intel_pmu_disable_all
      0.00            +0.1        0.07 =C2=B1 14%  perf-profile.children.cy=
cles-pp.rcu_needs_cpu
      0.58 =C2=B1  4%      +0.1        0.67 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.sched_clock
      0.41 =C2=B1  6%      +0.1        0.49 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.unlock_page
      0.56 =C2=B1  4%      +0.1        0.65 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.native_sched_clock
      0.05 =C2=B1  8%      +0.1        0.15 =C2=B1 58%  perf-profile.childr=
en.cycles-pp.run_posix_cpu_timers
      0.53 =C2=B1  5%      +0.1        0.66 =C2=B1 15%  perf-profile.childr=
en.cycles-pp.sched_clock_cpu
      0.11 =C2=B1  4%      +0.2        0.27 =C2=B1 32%  perf-profile.childr=
en.cycles-pp.rcu_irq_enter
      0.03 =C2=B1100%      +0.2        0.18 =C2=B1 67%  perf-profile.childr=
en.cycles-pp.hrtimer_forward
      0.06 =C2=B1 14%      +0.3        0.33 =C2=B1 78%  perf-profile.childr=
en.cycles-pp.tick_check_broadcast_expired
      1.06 =C2=B1 12%      +0.5        1.52        perf-profile.children.cy=
cles-pp.tick_irq_enter
      1.26 =C2=B1 11%      +0.7        1.93 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.irq_enter
      1.09 =C2=B1  9%      +0.8        1.92        perf-profile.children.cy=
cles-pp.perf_mux_hrtimer_handler
      5.15 =C2=B1 10%      +2.1        7.21 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.__hrtimer_run_queues
      9.72 =C2=B1 12%      +2.7       12.41 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.hrtimer_interrupt
     18.39 =C2=B1 10%      +2.9       21.27 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.smp_apic_timer_interrupt
     19.78 =C2=B1 10%      +2.9       22.66 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.apic_timer_interrupt
     43.98 =C2=B1  4%      +5.0       48.98 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.intel_idle
     77.21 =C2=B1  7%      +8.2       85.46        perf-profile.children.cy=
cles-pp.do_idle
     77.15 =C2=B1  7%      +8.3       85.41        perf-profile.children.cy=
cles-pp.secondary_startup_64
     77.15 =C2=B1  7%      +8.3       85.41        perf-profile.children.cy=
cles-pp.cpu_startup_entry
     76.62 =C2=B1  7%      +8.4       85.03        perf-profile.children.cy=
cles-pp.start_secondary
     65.36 =C2=B1  6%      +8.7       74.10 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.cpuidle_enter
     65.33 =C2=B1  6%      +8.8       74.08 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.cpuidle_enter_state
      0.39 =C2=B1 19%      -0.2        0.20        perf-profile.self.cycles=
-pp.tsc_verify_tsc_adjust
      0.47 =C2=B1  9%      -0.1        0.32 =C2=B1 10%  perf-profile.self.c=
ycles-pp.__softirqentry_text_start
      0.23 =C2=B1  4%      -0.1        0.14 =C2=B1 42%  perf-profile.self.c=
ycles-pp.shmem_write_end
      0.20 =C2=B1 10%      -0.1        0.14 =C2=B1 21%  perf-profile.self.c=
ycles-pp.__update_load_avg_se
      0.22 =C2=B1 10%      -0.1        0.16 =C2=B1  6%  perf-profile.self.c=
ycles-pp.trace_event_raw_event_softirq
      0.07 =C2=B1 17%      +0.0        0.08 =C2=B1  5%  perf-profile.self.c=
ycles-pp.intel_pmu_disable_all
      0.04 =C2=B1 58%      +0.0        0.07 =C2=B1  7%  perf-profile.self.c=
ycles-pp.hrtimer_next_event_without
      0.10 =C2=B1  8%      +0.0        0.12 =C2=B1 12%  perf-profile.self.c=
ycles-pp.__orc_find
      0.23            +0.0        0.26 =C2=B1  3%  perf-profile.self.cycles=
-pp.lapic_next_event
      0.13 =C2=B1  5%      +0.0        0.17 =C2=B1  5%  perf-profile.self.c=
ycles-pp.rcu_irq_exit
      0.04 =C2=B1 59%      +0.0        0.09 =C2=B1 11%  perf-profile.self.c=
ycles-pp.get_cpu_device
      0.28 =C2=B1 10%      +0.1        0.35 =C2=B1 17%  perf-profile.self.c=
ycles-pp.hrtimer_interrupt
      0.00            +0.1        0.07 =C2=B1 14%  perf-profile.self.cycles=
-pp.rcu_needs_cpu
      0.40 =C2=B1  5%      +0.1        0.48 =C2=B1 11%  perf-profile.self.c=
ycles-pp.unlock_page
      0.05 =C2=B1  8%      +0.1        0.15 =C2=B1 58%  perf-profile.self.c=
ycles-pp.run_posix_cpu_timers
      0.07 =C2=B1 11%      +0.1        0.17 =C2=B1 41%  perf-profile.self.c=
ycles-pp.scheduler_tick
      0.15 =C2=B1 17%      +0.1        0.24 =C2=B1 26%  perf-profile.self.c=
ycles-pp.perf_mux_hrtimer_handler
      0.01 =C2=B1173%      +0.1        0.11 =C2=B1 54%  perf-profile.self.c=
ycles-pp.timerqueue_del
      0.01 =C2=B1173%      +0.1        0.12 =C2=B1 47%  perf-profile.self.c=
ycles-pp.irq_enter
      0.01 =C2=B1173%      +0.1        0.12 =C2=B1 58%  perf-profile.self.c=
ycles-pp.sched_clock
      0.13 =C2=B1  5%      +0.1        0.27 =C2=B1 47%  perf-profile.self.c=
ycles-pp.__hrtimer_run_queues
      0.00            +0.1        0.14 =C2=B1 44%  perf-profile.self.cycles=
-pp.rcu_irq_enter
      0.00            +0.2        0.17 =C2=B1 65%  perf-profile.self.cycles=
-pp.hrtimer_forward
      0.04 =C2=B1 58%      +0.3        0.32 =C2=B1 81%  perf-profile.self.c=
ycles-pp.tick_check_broadcast_expired
     43.97 =C2=B1  4%      +4.9       48.83 =C2=B1  7%  perf-profile.self.c=
ycles-pp.intel_idle
     31419 =C2=B1 15%     -24.2%      23802        softirqs.CPU1.RCU
     30103 =C2=B1 22%     -25.2%      22515 =C2=B1  3%  softirqs.CPU100.RCU
     30145 =C2=B1 22%     -25.7%      22383 =C2=B1  3%  softirqs.CPU101.RCU
     29952 =C2=B1 21%     -24.9%      22503 =C2=B1  3%  softirqs.CPU102.RCU
     29935 =C2=B1 22%     -25.4%      22342 =C2=B1  4%  softirqs.CPU103.RCU
     30697 =C2=B1 19%     -27.5%      22263 =C2=B1  4%  softirqs.CPU104.RCU
     29884 =C2=B1 22%     -22.8%      23067        softirqs.CPU105.RCU
     30351 =C2=B1 22%     -26.2%      22407 =C2=B1  4%  softirqs.CPU106.RCU
     30122 =C2=B1 22%     -25.9%      22317 =C2=B1  3%  softirqs.CPU107.RCU
     30203 =C2=B1 21%     -26.8%      22111 =C2=B1  5%  softirqs.CPU108.RCU
     29667 =C2=B1 22%     -25.0%      22235 =C2=B1  3%  softirqs.CPU109.RCU
     30310 =C2=B1 25%     -26.3%      22324 =C2=B1  2%  softirqs.CPU11.RCU
     29722 =C2=B1 22%     -25.9%      22034 =C2=B1  3%  softirqs.CPU110.RCU
     30799 =C2=B1 19%     -28.2%      22126 =C2=B1  3%  softirqs.CPU111.RCU
     29287 =C2=B1 22%     -27.6%      21205 =C2=B1  5%  softirqs.CPU112.RCU
     29356 =C2=B1 23%     -27.8%      21186 =C2=B1  7%  softirqs.CPU113.RCU
     29350 =C2=B1 23%     -29.4%      20727 =C2=B1  9%  softirqs.CPU114.RCU
     29271 =C2=B1 22%     -29.2%      20733 =C2=B1 10%  softirqs.CPU115.RCU
     29889 =C2=B1 22%     -28.7%      21315 =C2=B1  6%  softirqs.CPU116.RCU
     29521 =C2=B1 24%     -28.1%      21217 =C2=B1  6%  softirqs.CPU117.RCU
     29332 =C2=B1 22%     -27.3%      21338 =C2=B1  6%  softirqs.CPU118.RCU
     29485 =C2=B1 22%     -27.9%      21262 =C2=B1  6%  softirqs.CPU119.RCU
     29350 =C2=B1 21%     -24.5%      22155 =C2=B1  3%  softirqs.CPU12.RCU
     29902 =C2=B1 26%     -26.4%      21994        softirqs.CPU129.RCU
     29654 =C2=B1 21%     -25.6%      22076 =C2=B1  2%  softirqs.CPU13.RCU
     29163 =C2=B1 21%     -28.0%      21003 =C2=B1  8%  softirqs.CPU132.RCU
     28891 =C2=B1 21%     -25.2%      21622 =C2=B1  2%  softirqs.CPU141.RCU
     29024 =C2=B1 25%     -27.7%      20971 =C2=B1  3%  softirqs.CPU146.RCU
     29658 =C2=B1 24%     -26.6%      21768 =C2=B1  2%  softirqs.CPU149.RCU
     29962 =C2=B1 19%     -24.4%      22650        softirqs.CPU15.RCU
     29597 =C2=B1 23%     -26.4%      21786 =C2=B1  2%  softirqs.CPU153.RCU
     29312 =C2=B1 24%     -26.4%      21562 =C2=B1  3%  softirqs.CPU154.RCU
     29587 =C2=B1 23%     -26.7%      21700 =C2=B1  2%  softirqs.CPU155.RCU
     31189 =C2=B1 18%     -29.1%      22113 =C2=B1  4%  softirqs.CPU16.RCU
     28949 =C2=B1 24%     -28.6%      20677 =C2=B1  3%  softirqs.CPU160.RCU
     29190 =C2=B1 23%     -29.5%      20579 =C2=B1  4%  softirqs.CPU161.RCU
     29015 =C2=B1 25%     -32.1%      19710 =C2=B1  6%  softirqs.CPU162.RCU
     28928 =C2=B1 24%     -28.8%      20599 =C2=B1  3%  softirqs.CPU164.RCU
     28777 =C2=B1 24%     -29.7%      20239 =C2=B1  4%  softirqs.CPU165.RCU
     28013 =C2=B1 23%     -29.2%      19826 =C2=B1  8%  softirqs.CPU168.RCU
     28886 =C2=B1 23%     -28.7%      20589 =C2=B1  7%  softirqs.CPU169.RCU
     28894 =C2=B1 23%     -29.3%      20436 =C2=B1  9%  softirqs.CPU170.RCU
     29063 =C2=B1 23%     -29.4%      20528 =C2=B1  7%  softirqs.CPU172.RCU
     29041 =C2=B1 21%     -29.7%      20408 =C2=B1  7%  softirqs.CPU174.RCU
     29317 =C2=B1 22%     -30.1%      20500 =C2=B1  7%  softirqs.CPU175.RCU
     28672 =C2=B1 23%     -25.0%      21504 =C2=B1  3%  softirqs.CPU178.RCU
     28472 =C2=B1 23%     -27.3%      20700 =C2=B1  5%  softirqs.CPU181.RCU
     28458 =C2=B1 23%     -25.6%      21161 =C2=B1  3%  softirqs.CPU182.RCU
     28616 =C2=B1 23%     -26.5%      21035 =C2=B1  4%  softirqs.CPU183.RCU
     28791 =C2=B1 23%     -25.9%      21339 =C2=B1  3%  softirqs.CPU184.RCU
     29064 =C2=B1 22%     -26.4%      21381 =C2=B1  4%  softirqs.CPU185.RCU
     28681 =C2=B1 23%     -27.2%      20885 =C2=B1  4%  softirqs.CPU186.RCU
     28700 =C2=B1 23%     -26.3%      21163 =C2=B1  3%  softirqs.CPU187.RCU
     28551 =C2=B1 23%     -26.5%      20974        softirqs.CPU188.RCU
     28521 =C2=B1 23%     -25.6%      21214 =C2=B1  2%  softirqs.CPU189.RCU
     29479 =C2=B1 22%     -27.4%      21403 =C2=B1  7%  softirqs.CPU19.RCU
     28570 =C2=B1 24%     -25.6%      21255 =C2=B1  3%  softirqs.CPU190.RCU
     28954 =C2=B1 22%     -26.3%      21340 =C2=B1  3%  softirqs.CPU191.RCU
     29496 =C2=B1 22%     -26.8%      21604 =C2=B1  6%  softirqs.CPU20.RCU
     29924 =C2=B1 23%     -28.0%      21549 =C2=B1  6%  softirqs.CPU21.RCU
     29499 =C2=B1 21%     -26.2%      21768 =C2=B1  6%  softirqs.CPU23.RCU
     29133 =C2=B1 20%     -25.2%      21795        softirqs.CPU33.RCU
    103342            +9.2%     112860        softirqs.CPU33.TIMER
     29694 =C2=B1 21%     -24.0%      22576 =C2=B1  3%  softirqs.CPU4.RCU
     29369 =C2=B1 19%     -23.8%      22377 =C2=B1  2%  softirqs.CPU45.RCU
     30046 =C2=B1 23%     -28.7%      21416 =C2=B1  6%  softirqs.CPU49.RCU
     29434 =C2=B1 22%     -24.1%      22330 =C2=B1  2%  softirqs.CPU5.RCU
     29605 =C2=B1 23%     -26.1%      21874 =C2=B1  2%  softirqs.CPU54.RCU
     29537 =C2=B1 22%     -24.8%      22222        softirqs.CPU55.RCU
     29138 =C2=B1 23%     -24.1%      22112        softirqs.CPU56.RCU
     29665 =C2=B1 23%     -25.5%      22090        softirqs.CPU57.RCU
     29672 =C2=B1 23%     -25.6%      22074 =C2=B1  2%  softirqs.CPU58.RCU
     29388 =C2=B1 21%     -23.8%      22407 =C2=B1  3%  softirqs.CPU6.RCU
     29921 =C2=B1 23%     -27.7%      21641 =C2=B1  4%  softirqs.CPU60.RCU
     29906 =C2=B1 24%     -27.5%      21696 =C2=B1  2%  softirqs.CPU61.RCU
     29619 =C2=B1 23%     -25.5%      22072 =C2=B1  2%  softirqs.CPU62.RCU
     29673 =C2=B1 23%     -25.7%      22053 =C2=B1  2%  softirqs.CPU63.RCU
     29114 =C2=B1 22%     -24.4%      21998 =C2=B1  2%  softirqs.CPU64.RCU
     29106 =C2=B1 23%     -28.4%      20827 =C2=B1  2%  softirqs.CPU65.RCU
     28473 =C2=B1 22%     -29.9%      19972 =C2=B1  4%  softirqs.CPU66.RCU
     28763 =C2=B1 24%     -27.8%      20761 =C2=B1  2%  softirqs.CPU67.RCU
     28660 =C2=B1 23%     -27.2%      20876 =C2=B1  2%  softirqs.CPU68.RCU
     28962 =C2=B1 23%     -29.5%      20431 =C2=B1  3%  softirqs.CPU69.RCU
     28894 =C2=B1 24%     -27.2%      21033 =C2=B1  2%  softirqs.CPU70.RCU
     29887 =C2=B1 28%     -28.4%      21401        softirqs.CPU71.RCU
     28072 =C2=B1 20%     -28.8%      19980 =C2=B1  7%  softirqs.CPU72.RCU
     28418 =C2=B1 23%     -27.7%      20550 =C2=B1  6%  softirqs.CPU73.RCU
     28601 =C2=B1 22%     -29.0%      20316 =C2=B1  8%  softirqs.CPU74.RCU
     28833 =C2=B1 22%     -28.6%      20575 =C2=B1  7%  softirqs.CPU75.RCU
     28743 =C2=B1 23%     -28.0%      20690 =C2=B1  7%  softirqs.CPU76.RCU
    102826 =C2=B1  3%     +30.7%     134349 =C2=B1 23%  softirqs.CPU77.TIMER
     28531 =C2=B1 23%     -28.6%      20368 =C2=B1  6%  softirqs.CPU78.RCU
     28899 =C2=B1 21%     -29.2%      20464 =C2=B1  6%  softirqs.CPU79.RCU
     28775 =C2=B1 23%     -26.4%      21190 =C2=B1  3%  softirqs.CPU80.RCU
     28592 =C2=B1 23%     -26.5%      21007 =C2=B1  2%  softirqs.CPU81.RCU
     29934 =C2=B1 24%     -30.4%      20825 =C2=B1  6%  softirqs.CPU84.RCU
     28802 =C2=B1 22%     -27.2%      20978 =C2=B1  5%  softirqs.CPU85.RCU
     28764 =C2=B1 22%     -25.3%      21500 =C2=B1  2%  softirqs.CPU86.RCU
     28839 =C2=B1 22%     -26.5%      21187 =C2=B1  3%  softirqs.CPU87.RCU
     28545 =C2=B1 22%     -24.4%      21574 =C2=B1  2%  softirqs.CPU88.RCU
     29941 =C2=B1 24%     -28.0%      21557 =C2=B1  3%  softirqs.CPU89.RCU
     29404 =C2=B1 22%     -23.5%      22508 =C2=B1  2%  softirqs.CPU9.RCU
     29032 =C2=B1 22%     -26.8%      21248 =C2=B1  5%  softirqs.CPU90.RCU
     29070 =C2=B1 22%     -26.8%      21273 =C2=B1  2%  softirqs.CPU91.RCU
     28791 =C2=B1 22%     -25.1%      21564 =C2=B1  2%  softirqs.CPU92.RCU
     28534 =C2=B1 22%     -24.3%      21596 =C2=B1  2%  softirqs.CPU93.RCU
     28411 =C2=B1 22%     -23.7%      21689 =C2=B1  2%  softirqs.CPU94.RCU
     28526 =C2=B1 22%     -24.2%      21609 =C2=B1  3%  softirqs.CPU95.RCU
     31022 =C2=B1 19%     -30.6%      21526 =C2=B1  7%  softirqs.CPU96.RCU
     29709 =C2=B1 22%     -29.4%      20981 =C2=B1  9%  softirqs.CPU97.RCU
     29889 =C2=B1 22%     -25.8%      22190 =C2=B1  4%  softirqs.CPU99.RCU
   5598226 =C2=B1 22%     -26.0%    4141614 =C2=B1  4%  softirqs.RCU
    210.75 =C2=B1 20%    +128.2%     481.00 =C2=B1 35%  interrupts.34:PCI-M=
SI.26738691-edge.eth0-TxRx-2
   1224085 =C2=B1  7%      -7.2%    1135614        interrupts.CAL:Function_=
call_interrupts
      7650 =C2=B1  5%     -50.3%       3803 =C2=B1 47%  interrupts.CPU1.RES=
:Rescheduling_interrupts
    210.75 =C2=B1 20%    +128.2%     481.00 =C2=B1 35%  interrupts.CPU10.34=
:PCI-MSI.26738691-edge.eth0-TxRx-2
    514.50 =C2=B1  7%     -31.5%     352.50 =C2=B1 18%  interrupts.CPU10.NM=
I:Non-maskable_interrupts
    514.50 =C2=B1  7%     -31.5%     352.50 =C2=B1 18%  interrupts.CPU10.PM=
I:Performance_monitoring_interrupts
    369.75 =C2=B1 31%     +41.7%     524.00 =C2=B1  9%  interrupts.CPU100.N=
MI:Non-maskable_interrupts
    369.75 =C2=B1 31%     +41.7%     524.00 =C2=B1  9%  interrupts.CPU100.P=
MI:Performance_monitoring_interrupts
    337.75 =C2=B1 31%     +49.8%     506.00 =C2=B1 12%  interrupts.CPU101.N=
MI:Non-maskable_interrupts
    337.75 =C2=B1 31%     +49.8%     506.00 =C2=B1 12%  interrupts.CPU101.P=
MI:Performance_monitoring_interrupts
      6985 =C2=B1  5%     -41.6%       4081 =C2=B1 47%  interrupts.CPU101.R=
ES:Rescheduling_interrupts
    292.75 =C2=B1 29%     +74.0%     509.50 =C2=B1 10%  interrupts.CPU102.N=
MI:Non-maskable_interrupts
    292.75 =C2=B1 29%     +74.0%     509.50 =C2=B1 10%  interrupts.CPU102.P=
MI:Performance_monitoring_interrupts
      7501 =C2=B1 11%     -43.2%       4259 =C2=B1 46%  interrupts.CPU102.R=
ES:Rescheduling_interrupts
    360.25 =C2=B1 33%     +46.8%     529.00 =C2=B1 10%  interrupts.CPU103.N=
MI:Non-maskable_interrupts
    360.25 =C2=B1 33%     +46.8%     529.00 =C2=B1 10%  interrupts.CPU103.P=
MI:Performance_monitoring_interrupts
    342.25 =C2=B1 27%     +47.0%     503.00 =C2=B1 10%  interrupts.CPU104.N=
MI:Non-maskable_interrupts
    342.25 =C2=B1 27%     +47.0%     503.00 =C2=B1 10%  interrupts.CPU104.P=
MI:Performance_monitoring_interrupts
      7726 =C2=B1  7%     -43.0%       4402 =C2=B1 46%  interrupts.CPU104.R=
ES:Rescheduling_interrupts
    350.50 =C2=B1 32%     +54.9%     543.00 =C2=B1 10%  interrupts.CPU106.N=
MI:Non-maskable_interrupts
    350.50 =C2=B1 32%     +54.9%     543.00 =C2=B1 10%  interrupts.CPU106.P=
MI:Performance_monitoring_interrupts
      7558 =C2=B1  8%     -45.0%       4155 =C2=B1 54%  interrupts.CPU106.R=
ES:Rescheduling_interrupts
    366.25 =C2=B1 32%     +49.9%     549.00 =C2=B1 13%  interrupts.CPU107.N=
MI:Non-maskable_interrupts
    366.25 =C2=B1 32%     +49.9%     549.00 =C2=B1 13%  interrupts.CPU107.P=
MI:Performance_monitoring_interrupts
      7650 =C2=B1  5%     -43.8%       4300 =C2=B1 51%  interrupts.CPU108.R=
ES:Rescheduling_interrupts
    338.00 =C2=B1 34%     +62.9%     550.50 =C2=B1  3%  interrupts.CPU109.N=
MI:Non-maskable_interrupts
    338.00 =C2=B1 34%     +62.9%     550.50 =C2=B1  3%  interrupts.CPU109.P=
MI:Performance_monitoring_interrupts
      7347 =C2=B1  4%     -45.4%       4015 =C2=B1 41%  interrupts.CPU109.R=
ES:Rescheduling_interrupts
      7213 =C2=B1  6%     -38.5%       4438 =C2=B1 46%  interrupts.CPU110.R=
ES:Rescheduling_interrupts
    340.00 =C2=B1 30%     +56.3%     531.50 =C2=B1  9%  interrupts.CPU111.N=
MI:Non-maskable_interrupts
    340.00 =C2=B1 30%     +56.3%     531.50 =C2=B1  9%  interrupts.CPU111.P=
MI:Performance_monitoring_interrupts
      7143 =C2=B1  3%     -39.0%       4360 =C2=B1 49%  interrupts.CPU112.R=
ES:Rescheduling_interrupts
    368.25 =C2=B1 27%     +49.9%     552.00 =C2=B1  4%  interrupts.CPU113.N=
MI:Non-maskable_interrupts
    368.25 =C2=B1 27%     +49.9%     552.00 =C2=B1  4%  interrupts.CPU113.P=
MI:Performance_monitoring_interrupts
    369.50 =C2=B1 27%     +41.7%     523.50 =C2=B1 10%  interrupts.CPU114.N=
MI:Non-maskable_interrupts
    369.50 =C2=B1 27%     +41.7%     523.50 =C2=B1 10%  interrupts.CPU114.P=
MI:Performance_monitoring_interrupts
    349.25 =C2=B1 30%     +47.9%     516.50 =C2=B1 14%  interrupts.CPU116.N=
MI:Non-maskable_interrupts
    349.25 =C2=B1 30%     +47.9%     516.50 =C2=B1 14%  interrupts.CPU116.P=
MI:Performance_monitoring_interrupts
      7127 =C2=B1  2%     -38.7%       4370 =C2=B1 49%  interrupts.CPU116.R=
ES:Rescheduling_interrupts
    347.50 =C2=B1 34%     +47.5%     512.50 =C2=B1  7%  interrupts.CPU117.N=
MI:Non-maskable_interrupts
    347.50 =C2=B1 34%     +47.5%     512.50 =C2=B1  7%  interrupts.CPU117.P=
MI:Performance_monitoring_interrupts
      6399 =C2=B1  7%      -8.2%       5877        interrupts.CPU118.CAL:Fu=
nction_call_interrupts
    347.25 =C2=B1 29%     +55.8%     541.00 =C2=B1  9%  interrupts.CPU118.N=
MI:Non-maskable_interrupts
    347.25 =C2=B1 29%     +55.8%     541.00 =C2=B1  9%  interrupts.CPU118.P=
MI:Performance_monitoring_interrupts
      8105 =C2=B1  5%     -44.4%       4504 =C2=B1 49%  interrupts.CPU118.R=
ES:Rescheduling_interrupts
      6419 =C2=B1  7%      -7.9%       5909        interrupts.CPU119.CAL:Fu=
nction_call_interrupts
    404.25 =C2=B1 21%     +31.5%     531.50 =C2=B1  9%  interrupts.CPU119.N=
MI:Non-maskable_interrupts
    404.25 =C2=B1 21%     +31.5%     531.50 =C2=B1  9%  interrupts.CPU119.P=
MI:Performance_monitoring_interrupts
      6957 =C2=B1  8%     -39.9%       4181 =C2=B1 48%  interrupts.CPU119.R=
ES:Rescheduling_interrupts
      6403 =C2=B1  7%      -7.6%       5915        interrupts.CPU12.CAL:Fun=
ction_call_interrupts
      6524 =C2=B1 14%     -50.9%       3201 =C2=B1 54%  interrupts.CPU120.R=
ES:Rescheduling_interrupts
    409.50 =C2=B1 23%     +31.5%     538.50 =C2=B1  3%  interrupts.CPU121.N=
MI:Non-maskable_interrupts
    409.50 =C2=B1 23%     +31.5%     538.50 =C2=B1  3%  interrupts.CPU121.P=
MI:Performance_monitoring_interrupts
      6429 =C2=B1  6%      -8.0%       5917        interrupts.CPU125.CAL:Fu=
nction_call_interrupts
      6424 =C2=B1  6%      -7.7%       5930        interrupts.CPU127.CAL:Fu=
nction_call_interrupts
      6418 =C2=B1  6%      -7.9%       5913        interrupts.CPU128.CAL:Fu=
nction_call_interrupts
      6413 =C2=B1  6%      -7.5%       5934        interrupts.CPU129.CAL:Fu=
nction_call_interrupts
      6409 =C2=B1  6%      -8.5%       5862        interrupts.CPU130.CAL:Fu=
nction_call_interrupts
      7341 =C2=B1  6%     -42.7%       4204 =C2=B1 48%  interrupts.CPU130.R=
ES:Rescheduling_interrupts
      6409 =C2=B1  6%      -7.4%       5937        interrupts.CPU131.CAL:Fu=
nction_call_interrupts
      6413 =C2=B1  6%      -7.6%       5928        interrupts.CPU132.CAL:Fu=
nction_call_interrupts
    385.50 =C2=B1 18%     +33.7%     515.50 =C2=B1 12%  interrupts.CPU133.N=
MI:Non-maskable_interrupts
    385.50 =C2=B1 18%     +33.7%     515.50 =C2=B1 12%  interrupts.CPU133.P=
MI:Performance_monitoring_interrupts
    403.25 =C2=B1 29%     +33.4%     538.00 =C2=B1 14%  interrupts.CPU135.N=
MI:Non-maskable_interrupts
    403.25 =C2=B1 29%     +33.4%     538.00 =C2=B1 14%  interrupts.CPU135.P=
MI:Performance_monitoring_interrupts
      7641 =C2=B1  2%     -39.0%       4662 =C2=B1 51%  interrupts.CPU137.R=
ES:Rescheduling_interrupts
    402.00 =C2=B1 29%     +29.7%     521.50 =C2=B1 15%  interrupts.CPU138.N=
MI:Non-maskable_interrupts
    402.00 =C2=B1 29%     +29.7%     521.50 =C2=B1 15%  interrupts.CPU138.P=
MI:Performance_monitoring_interrupts
    349.75 =C2=B1 32%     +45.8%     510.00 =C2=B1  7%  interrupts.CPU139.N=
MI:Non-maskable_interrupts
    349.75 =C2=B1 32%     +45.8%     510.00 =C2=B1  7%  interrupts.CPU139.P=
MI:Performance_monitoring_interrupts
      7371           -39.1%       4487 =C2=B1 44%  interrupts.CPU14.RES:Res=
cheduling_interrupts
    342.50 =C2=B1 33%     +55.5%     532.50 =C2=B1 11%  interrupts.CPU142.N=
MI:Non-maskable_interrupts
    342.50 =C2=B1 33%     +55.5%     532.50 =C2=B1 11%  interrupts.CPU142.P=
MI:Performance_monitoring_interrupts
      6402 =C2=B1  6%      -7.5%       5920        interrupts.CPU144.CAL:Fu=
nction_call_interrupts
      6442 =C2=B1  6%      -8.0%       5929        interrupts.CPU145.CAL:Fu=
nction_call_interrupts
    333.00 =C2=B1 28%     +46.5%     488.00 =C2=B1 10%  interrupts.CPU146.N=
MI:Non-maskable_interrupts
    333.00 =C2=B1 28%     +46.5%     488.00 =C2=B1 10%  interrupts.CPU146.P=
MI:Performance_monitoring_interrupts
    351.25 =C2=B1 32%     +46.0%     513.00 =C2=B1  3%  interrupts.CPU147.N=
MI:Non-maskable_interrupts
    351.25 =C2=B1 32%     +46.0%     513.00 =C2=B1  3%  interrupts.CPU147.P=
MI:Performance_monitoring_interrupts
    348.50 =C2=B1 31%     +55.2%     541.00 =C2=B1 12%  interrupts.CPU148.N=
MI:Non-maskable_interrupts
    348.50 =C2=B1 31%     +55.2%     541.00 =C2=B1 12%  interrupts.CPU148.P=
MI:Performance_monitoring_interrupts
    350.75 =C2=B1 33%     +52.8%     536.00 =C2=B1 15%  interrupts.CPU149.N=
MI:Non-maskable_interrupts
    350.75 =C2=B1 33%     +52.8%     536.00 =C2=B1 15%  interrupts.CPU149.P=
MI:Performance_monitoring_interrupts
      7512 =C2=B1  2%     -45.3%       4107 =C2=B1 50%  interrupts.CPU15.RE=
S:Rescheduling_interrupts
    337.50 =C2=B1 31%     +48.9%     502.50 =C2=B1  7%  interrupts.CPU150.N=
MI:Non-maskable_interrupts
    337.50 =C2=B1 31%     +48.9%     502.50 =C2=B1  7%  interrupts.CPU150.P=
MI:Performance_monitoring_interrupts
    349.75 =C2=B1 28%     +47.7%     516.50 =C2=B1 10%  interrupts.CPU151.N=
MI:Non-maskable_interrupts
    349.75 =C2=B1 28%     +47.7%     516.50 =C2=B1 10%  interrupts.CPU151.P=
MI:Performance_monitoring_interrupts
      7436 =C2=B1  3%     -39.5%       4502 =C2=B1 51%  interrupts.CPU151.R=
ES:Rescheduling_interrupts
    284.75 =C2=B1 36%     +83.1%     521.50 =C2=B1  6%  interrupts.CPU155.N=
MI:Non-maskable_interrupts
    284.75 =C2=B1 36%     +83.1%     521.50 =C2=B1  6%  interrupts.CPU155.P=
MI:Performance_monitoring_interrupts
    286.25 =C2=B1 31%     +68.4%     482.00 =C2=B1 11%  interrupts.CPU156.N=
MI:Non-maskable_interrupts
    286.25 =C2=B1 31%     +68.4%     482.00 =C2=B1 11%  interrupts.CPU156.P=
MI:Performance_monitoring_interrupts
    285.25 =C2=B1 29%     +76.0%     502.00 =C2=B1 13%  interrupts.CPU157.N=
MI:Non-maskable_interrupts
    285.25 =C2=B1 29%     +76.0%     502.00 =C2=B1 13%  interrupts.CPU157.P=
MI:Performance_monitoring_interrupts
    281.75 =C2=B1 30%     +91.3%     539.00 =C2=B1 12%  interrupts.CPU158.N=
MI:Non-maskable_interrupts
    281.75 =C2=B1 30%     +91.3%     539.00 =C2=B1 12%  interrupts.CPU158.P=
MI:Performance_monitoring_interrupts
    284.25 =C2=B1 39%     +81.9%     517.00 =C2=B1  8%  interrupts.CPU159.N=
MI:Non-maskable_interrupts
    284.25 =C2=B1 39%     +81.9%     517.00 =C2=B1  8%  interrupts.CPU159.P=
MI:Performance_monitoring_interrupts
      6392 =C2=B1  7%      -7.6%       5908        interrupts.CPU16.CAL:Fun=
ction_call_interrupts
    286.75 =C2=B1 29%     +81.5%     520.50 =C2=B1 12%  interrupts.CPU160.N=
MI:Non-maskable_interrupts
    286.75 =C2=B1 29%     +81.5%     520.50 =C2=B1 12%  interrupts.CPU160.P=
MI:Performance_monitoring_interrupts
    287.75 =C2=B1 29%     +80.0%     518.00 =C2=B1 13%  interrupts.CPU161.N=
MI:Non-maskable_interrupts
    287.75 =C2=B1 29%     +80.0%     518.00 =C2=B1 13%  interrupts.CPU161.P=
MI:Performance_monitoring_interrupts
    279.75 =C2=B1 30%     +88.2%     526.50 =C2=B1  5%  interrupts.CPU162.N=
MI:Non-maskable_interrupts
    279.75 =C2=B1 30%     +88.2%     526.50 =C2=B1  5%  interrupts.CPU162.P=
MI:Performance_monitoring_interrupts
      6407 =C2=B1  7%      -7.7%       5912        interrupts.CPU165.CAL:Fu=
nction_call_interrupts
    412.25 =C2=B1 13%     +24.6%     513.50 =C2=B1 11%  interrupts.CPU167.N=
MI:Non-maskable_interrupts
    412.25 =C2=B1 13%     +24.6%     513.50 =C2=B1 11%  interrupts.CPU167.P=
MI:Performance_monitoring_interrupts
      7213           -35.4%       4657 =C2=B1 41%  interrupts.CPU17.RES:Res=
cheduling_interrupts
    354.00 =C2=B1 29%     +37.9%     488.00 =C2=B1 12%  interrupts.CPU171.N=
MI:Non-maskable_interrupts
    354.00 =C2=B1 29%     +37.9%     488.00 =C2=B1 12%  interrupts.CPU171.P=
MI:Performance_monitoring_interrupts
    343.50 =C2=B1 32%     +50.5%     517.00 =C2=B1 12%  interrupts.CPU172.N=
MI:Non-maskable_interrupts
    343.50 =C2=B1 32%     +50.5%     517.00 =C2=B1 12%  interrupts.CPU172.P=
MI:Performance_monitoring_interrupts
      6444 =C2=B1  6%      -7.8%       5939        interrupts.CPU174.CAL:Fu=
nction_call_interrupts
      6413 =C2=B1  7%      -7.7%       5919        interrupts.CPU18.CAL:Fun=
ction_call_interrupts
      6402 =C2=B1  7%      -7.7%       5910        interrupts.CPU19.CAL:Fun=
ction_call_interrupts
      6840 =C2=B1  5%     -43.9%       3839 =C2=B1 46%  interrupts.CPU191.R=
ES:Rescheduling_interrupts
      6397 =C2=B1  7%      -7.6%       5909        interrupts.CPU20.CAL:Fun=
ction_call_interrupts
      6848 =C2=B1  8%     -41.5%       4003 =C2=B1 40%  interrupts.CPU20.RE=
S:Rescheduling_interrupts
      6417 =C2=B1  7%      -8.0%       5903        interrupts.CPU21.CAL:Fun=
ction_call_interrupts
      7703 =C2=B1 10%     -47.5%       4045 =C2=B1 47%  interrupts.CPU21.RE=
S:Rescheduling_interrupts
      7202 =C2=B1  8%     -44.1%       4025 =C2=B1 44%  interrupts.CPU22.RE=
S:Rescheduling_interrupts
      7280 =C2=B1  3%     -43.7%       4098 =C2=B1 44%  interrupts.CPU23.RE=
S:Rescheduling_interrupts
      6404 =C2=B1  7%      -8.0%       5890        interrupts.CPU26.CAL:Fun=
ction_call_interrupts
      6415 =C2=B1  7%     -16.1%       5384 =C2=B1 10%  interrupts.CPU3.CAL=
:Function_call_interrupts
    470.00 =C2=B1  6%     +16.2%     546.00 =C2=B1 12%  interrupts.CPU32.NM=
I:Non-maskable_interrupts
    470.00 =C2=B1  6%     +16.2%     546.00 =C2=B1 12%  interrupts.CPU32.PM=
I:Performance_monitoring_interrupts
      6414 =C2=B1  6%      -7.6%       5923        interrupts.CPU35.CAL:Fun=
ction_call_interrupts
      6409 =C2=B1  6%      -7.0%       5958        interrupts.CPU36.CAL:Fun=
ction_call_interrupts
    465.00 =C2=B1  8%     +14.0%     530.00 =C2=B1 13%  interrupts.CPU38.NM=
I:Non-maskable_interrupts
    465.00 =C2=B1  8%     +14.0%     530.00 =C2=B1 13%  interrupts.CPU38.PM=
I:Performance_monitoring_interrupts
      6412 =C2=B1  6%      -7.7%       5918        interrupts.CPU39.CAL:Fun=
ction_call_interrupts
    462.50 =C2=B1 12%     +11.8%     517.00 =C2=B1  9%  interrupts.CPU39.NM=
I:Non-maskable_interrupts
    462.50 =C2=B1 12%     +11.8%     517.00 =C2=B1  9%  interrupts.CPU39.PM=
I:Performance_monitoring_interrupts
      6851 =C2=B1  6%     -42.2%       3963 =C2=B1 49%  interrupts.CPU4.RES=
:Rescheduling_interrupts
    455.00 =C2=B1  7%     +14.6%     521.50 =C2=B1 13%  interrupts.CPU41.NM=
I:Non-maskable_interrupts
    455.00 =C2=B1  7%     +14.6%     521.50 =C2=B1 13%  interrupts.CPU41.PM=
I:Performance_monitoring_interrupts
      6422 =C2=B1  6%      -7.3%       5951        interrupts.CPU42.CAL:Fun=
ction_call_interrupts
      7549 =C2=B1  3%     -41.2%       4437 =C2=B1 50%  interrupts.CPU42.RE=
S:Rescheduling_interrupts
      6428 =C2=B1  7%      -7.6%       5940        interrupts.CPU43.CAL:Fun=
ction_call_interrupts
      6431 =C2=B1  7%      -7.7%       5938        interrupts.CPU44.CAL:Fun=
ction_call_interrupts
      6376 =C2=B1  6%      -7.0%       5931        interrupts.CPU47.CAL:Fun=
ction_call_interrupts
    500.00 =C2=B1 11%     -28.1%     359.50 =C2=B1 23%  interrupts.CPU49.NM=
I:Non-maskable_interrupts
    500.00 =C2=B1 11%     -28.1%     359.50 =C2=B1 23%  interrupts.CPU49.PM=
I:Performance_monitoring_interrupts
      6415 =C2=B1  6%      -8.2%       5889        interrupts.CPU50.CAL:Fun=
ction_call_interrupts
      6407 =C2=B1  7%      -9.4%       5805        interrupts.CPU51.CAL:Fun=
ction_call_interrupts
    409.50 =C2=B1 22%     +39.1%     569.50 =C2=B1  5%  interrupts.CPU51.NM=
I:Non-maskable_interrupts
    409.50 =C2=B1 22%     +39.1%     569.50 =C2=B1  5%  interrupts.CPU51.PM=
I:Performance_monitoring_interrupts
      6408 =C2=B1  7%      -8.0%       5896        interrupts.CPU52.CAL:Fun=
ction_call_interrupts
    342.75 =C2=B1 33%     +58.0%     541.50 =C2=B1 10%  interrupts.CPU52.NM=
I:Non-maskable_interrupts
    342.75 =C2=B1 33%     +58.0%     541.50 =C2=B1 10%  interrupts.CPU52.PM=
I:Performance_monitoring_interrupts
      6411 =C2=B1  7%      -7.8%       5910        interrupts.CPU53.CAL:Fun=
ction_call_interrupts
    348.00 =C2=B1 35%     +50.6%     524.00 =C2=B1  7%  interrupts.CPU53.NM=
I:Non-maskable_interrupts
    348.00 =C2=B1 35%     +50.6%     524.00 =C2=B1  7%  interrupts.CPU53.PM=
I:Performance_monitoring_interrupts
      6416 =C2=B1  6%      -7.7%       5919        interrupts.CPU54.CAL:Fun=
ction_call_interrupts
    338.75 =C2=B1 31%     +51.7%     514.00 =C2=B1 12%  interrupts.CPU54.NM=
I:Non-maskable_interrupts
    338.75 =C2=B1 31%     +51.7%     514.00 =C2=B1 12%  interrupts.CPU54.PM=
I:Performance_monitoring_interrupts
      6419 =C2=B1  7%      -8.4%       5883        interrupts.CPU55.CAL:Fun=
ction_call_interrupts
    350.00 =C2=B1 34%     +53.3%     536.50 =C2=B1  8%  interrupts.CPU55.NM=
I:Non-maskable_interrupts
    350.00 =C2=B1 34%     +53.3%     536.50 =C2=B1  8%  interrupts.CPU55.PM=
I:Performance_monitoring_interrupts
      6422 =C2=B1  6%      -7.9%       5914        interrupts.CPU56.CAL:Fun=
ction_call_interrupts
    401.00 =C2=B1 21%     +34.8%     540.50 =C2=B1  8%  interrupts.CPU56.NM=
I:Non-maskable_interrupts
    401.00 =C2=B1 21%     +34.8%     540.50 =C2=B1  8%  interrupts.CPU56.PM=
I:Performance_monitoring_interrupts
      6418 =C2=B1  7%      -7.7%       5926        interrupts.CPU57.CAL:Fun=
ction_call_interrupts
    411.00 =C2=B1 21%     +30.4%     536.00 =C2=B1 10%  interrupts.CPU58.NM=
I:Non-maskable_interrupts
    411.00 =C2=B1 21%     +30.4%     536.00 =C2=B1 10%  interrupts.CPU58.PM=
I:Performance_monitoring_interrupts
      6410 =C2=B1  6%      -7.9%       5904        interrupts.CPU59.CAL:Fun=
ction_call_interrupts
    403.00 =C2=B1 24%     +25.7%     506.50 =C2=B1  8%  interrupts.CPU59.NM=
I:Non-maskable_interrupts
    403.00 =C2=B1 24%     +25.7%     506.50 =C2=B1  8%  interrupts.CPU59.PM=
I:Performance_monitoring_interrupts
      7397 =C2=B1  3%     -40.2%       4424 =C2=B1 50%  interrupts.CPU6.RES=
:Rescheduling_interrupts
      6403 =C2=B1  7%      -7.6%       5917        interrupts.CPU60.CAL:Fun=
ction_call_interrupts
    394.50 =C2=B1 22%     +35.2%     533.50 =C2=B1 14%  interrupts.CPU60.NM=
I:Non-maskable_interrupts
    394.50 =C2=B1 22%     +35.2%     533.50 =C2=B1 14%  interrupts.CPU60.PM=
I:Performance_monitoring_interrupts
      6406 =C2=B1  7%      -7.3%       5939        interrupts.CPU62.CAL:Fun=
ction_call_interrupts
    403.25 =C2=B1 22%     +25.9%     507.50 =C2=B1 10%  interrupts.CPU62.NM=
I:Non-maskable_interrupts
    403.25 =C2=B1 22%     +25.9%     507.50 =C2=B1 10%  interrupts.CPU62.PM=
I:Performance_monitoring_interrupts
    427.25 =C2=B1 23%     +19.4%     510.00 =C2=B1  6%  interrupts.CPU63.NM=
I:Non-maskable_interrupts
    427.25 =C2=B1 23%     +19.4%     510.00 =C2=B1  6%  interrupts.CPU63.PM=
I:Performance_monitoring_interrupts
    457.50 =C2=B1  8%     +12.0%     512.50 =C2=B1 11%  interrupts.CPU64.NM=
I:Non-maskable_interrupts
    457.50 =C2=B1  8%     +12.0%     512.50 =C2=B1 11%  interrupts.CPU64.PM=
I:Performance_monitoring_interrupts
    473.25 =C2=B1 11%     +13.7%     538.00 =C2=B1 11%  interrupts.CPU71.NM=
I:Non-maskable_interrupts
    473.25 =C2=B1 11%     +13.7%     538.00 =C2=B1 11%  interrupts.CPU71.PM=
I:Performance_monitoring_interrupts
      6421 =C2=B1  6%     -16.0%       5395 =C2=B1  4%  interrupts.CPU72.CA=
L:Function_call_interrupts
      6311 =C2=B1  7%     -59.7%       2542 =C2=B1 56%  interrupts.CPU72.RE=
S:Rescheduling_interrupts
      6434 =C2=B1  6%     -12.8%       5611 =C2=B1  6%  interrupts.CPU73.CA=
L:Function_call_interrupts
      6931 =C2=B1  6%     -47.7%       3623 =C2=B1 40%  interrupts.CPU73.RE=
S:Rescheduling_interrupts
      6415 =C2=B1  6%      -7.3%       5945        interrupts.CPU75.CAL:Fun=
ction_call_interrupts
      6427 =C2=B1  6%      -7.6%       5941        interrupts.CPU76.CAL:Fun=
ction_call_interrupts
      6428 =C2=B1  6%      -7.5%       5946        interrupts.CPU78.CAL:Fun=
ction_call_interrupts
      7307 =C2=B1  7%     -41.7%       4262 =C2=B1 50%  interrupts.CPU8.RES=
:Rescheduling_interrupts
      6428 =C2=B1  6%      -7.7%       5930        interrupts.CPU82.CAL:Fun=
ction_call_interrupts
      6402 =C2=B1  6%      -7.4%       5927        interrupts.CPU86.CAL:Fun=
ction_call_interrupts
    469.75 =C2=B1  8%     +12.0%     526.00 =C2=B1 10%  interrupts.CPU86.NM=
I:Non-maskable_interrupts
    469.75 =C2=B1  8%     +12.0%     526.00 =C2=B1 10%  interrupts.CPU86.PM=
I:Performance_monitoring_interrupts
      6410 =C2=B1  6%      -7.7%       5918        interrupts.CPU87.CAL:Fun=
ction_call_interrupts
      6411 =C2=B1  6%      -7.5%       5928        interrupts.CPU88.CAL:Fun=
ction_call_interrupts
      6413 =C2=B1  6%      -7.7%       5922        interrupts.CPU89.CAL:Fun=
ction_call_interrupts
      6417 =C2=B1  7%      -7.6%       5931        interrupts.CPU91.CAL:Fun=
ction_call_interrupts
      6409 =C2=B1  7%      -7.5%       5926        interrupts.CPU94.CAL:Fun=
ction_call_interrupts
      6405 =C2=B1  6%      -8.4%       5865        interrupts.CPU96.CAL:Fun=
ction_call_interrupts
      8173 =C2=B1  5%     -42.6%       4691 =C2=B1 38%  interrupts.CPU96.RE=
S:Rescheduling_interrupts
      6417 =C2=B1  7%      -7.8%       5918        interrupts.CPU97.CAL:Fun=
ction_call_interrupts
      7758 =C2=B1  6%     -39.6%       4687 =C2=B1 38%  interrupts.CPU98.RE=
S:Rescheduling_interrupts
      6987 =C2=B1  6%     -42.4%       4027 =C2=B1 28%  interrupts.CPU99.RE=
S:Rescheduling_interrupts
     80504 =C2=B1  7%     +15.5%      92961 =C2=B1  8%  interrupts.NMI:Non-=
maskable_interrupts
     80504 =C2=B1  7%     +15.5%      92961 =C2=B1  8%  interrupts.PMI:Perf=
ormance_monitoring_interrupts



***************************************************************************=
************************
lkp-hsw-4ex1: 144 threads Intel(R) Xeon(R) CPU E7-8890 v3 @ 2.50GHz with 51=
2G memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/iterations/kconfig/nr_task/rootfs/tbox_group/test=
/testcase/ucode:
  gcc-7/performance/10/x86_64-rhel-7.6/1600%/debian-x86_64-2019-05-14.cgz/l=
kp-hsw-4ex1/custom/reaim/0x14

commit: =

  4f23dbc1e6 ("locking/rwsem: Implement lock handoff to prevent lock starva=
tion")
  00f3c5a3df ("locking/rwsem: Always release wait_lock before waking up tas=
ks")

4f23dbc1e657951e 00f3c5a3df2c1e3dab14d0dd2b7 =

---------------- --------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

          0:4          -11%           0:2     perf-profile.children.cycles-=
pp.error_entry
          0:4          -10%           0:2     perf-profile.self.cycles-pp.e=
rror_entry
         %stddev     %change         %stddev
             \          |                \  =

      2549 =C2=B1  2%      +5.2%       2683 =C2=B1  2%  reaim.child_systime
     25527 =C2=B1  2%      +5.2%      26866 =C2=B1  2%  reaim.time.system_t=
ime
    364348 =C2=B1  5%     +14.8%     418108        meminfo.DirectMap4k
     97407 =C2=B1 94%    +331.6%     420408 =C2=B1 38%  syscalls.sys_rt_sig=
action.max
     18.16 =C2=B1 25%      -7.9       10.27 =C2=B1 38%  turbostat.C3%
     38.28 =C2=B1  2%      -4.1%      36.72        boot-time.boot
      4721 =C2=B1  2%      -3.7%       4548        boot-time.idle
   2156912 =C2=B1  6%     +71.9%    3707777 =C2=B1 29%  cpuidle.POLL.time
    468846 =C2=B1 11%     +47.5%     691572 =C2=B1 15%  cpuidle.POLL.usage
     62557 =C2=B1  2%      +5.7%      66113 =C2=B1  6%  numa-vmstat.node1.n=
r_unevictable
     62557 =C2=B1  2%      +5.7%      66113 =C2=B1  6%  numa-vmstat.node1.n=
r_zone_unevictable
      5732 =C2=B1 29%     +41.4%       8104 =C2=B1 27%  numa-vmstat.node3.n=
r_slab_reclaimable
      7305 =C2=B1 29%     +22.8%       8969 =C2=B1 30%  numa-meminfo.node1.=
Mapped
    250228 =C2=B1  2%      +5.7%     264457 =C2=B1  6%  numa-meminfo.node1.=
Unevictable
     22894 =C2=B1 29%     +41.9%      32489 =C2=B1 27%  numa-meminfo.node3.=
KReclaimable
      6373 =C2=B1  5%     +15.9%       7384 =C2=B1 13%  numa-meminfo.node3.=
Mapped
     22894 =C2=B1 29%     +41.9%      32489 =C2=B1 27%  numa-meminfo.node3.=
SReclaimable
     21.79 =C2=B1  4%      -7.6%      20.14        perf-stat.i.MPKI
      1.48 =C2=B1 11%      -0.2        1.25        perf-stat.i.branch-miss-=
rate%
      2626            +3.5%       2720        perf-stat.overall.cycles-betw=
een-cache-misses
  26402092 =C2=B1  2%      +3.9%   27418780        perf-stat.overall.path-l=
ength
 6.083e+13 =C2=B1  2%      +3.9%  6.317e+13        perf-stat.total.instruct=
ions
     42744 =C2=B1  6%      -7.8%      39414        softirqs.CPU124.NET_RX
     40812 =C2=B1  2%      +7.6%      43917 =C2=B1  5%  softirqs.CPU48.NET_=
RX
     38081 =C2=B1  3%      +7.8%      41070 =C2=B1  4%  softirqs.CPU59.NET_=
RX
     40706 =C2=B1  4%      +9.7%      44636 =C2=B1  3%  softirqs.CPU64.NET_=
RX
     38992 =C2=B1  2%     +16.8%      45528        softirqs.CPU83.NET_RX
     38859 =C2=B1  2%     +16.2%      45160        softirqs.CPU88.NET_RX
    115563 =C2=B1  5%     +10.6%     127765 =C2=B1  5%  slabinfo.kmalloc-32=
.active_objs
    903.00 =C2=B1  5%     +10.5%     998.00 =C2=B1  5%  slabinfo.kmalloc-32=
.active_slabs
    115656 =C2=B1  5%     +10.5%     127819 =C2=B1  5%  slabinfo.kmalloc-32=
.num_objs
    903.00 =C2=B1  5%     +10.5%     998.00 =C2=B1  5%  slabinfo.kmalloc-32=
.num_slabs
     58841 =C2=B1 18%     -23.3%      45131        slabinfo.lsm_file_cache.=
active_objs
     58841 =C2=B1 18%     -23.3%      45131        slabinfo.lsm_file_cache.=
num_objs
    888.75 =C2=B1 14%     +35.1%       1200 =C2=B1  6%  slabinfo.xfrm_state=
.active_objs
    888.75 =C2=B1 14%     +35.1%       1200 =C2=B1  6%  slabinfo.xfrm_state=
.num_objs
    117.75 =C2=B1  4%      +8.3%     127.50        proc-vmstat.nr_dirtied
    280918            +1.4%     284967        proc-vmstat.nr_file_pages
      5847            +2.9%       6019        proc-vmstat.nr_inactive_anon
    102732 =C2=B1  2%      +2.2%     105006        proc-vmstat.nr_kernel_st=
ack
      7804 =C2=B1  2%      +4.5%       8154        proc-vmstat.nr_mapped
     25837 =C2=B1  7%     +10.4%      28533        proc-vmstat.nr_shmem
    116.75 =C2=B1  5%      +7.5%     125.50        proc-vmstat.nr_written
      5847            +2.9%       6019        proc-vmstat.nr_zone_inactive_=
anon
 4.568e+08            -3.4%  4.414e+08        proc-vmstat.numa_hit
 4.566e+08            -3.4%  4.413e+08        proc-vmstat.numa_local
     34509 =C2=B1  3%      +6.9%      36895        proc-vmstat.pgactivate
 4.683e+08            -3.3%  4.529e+08        proc-vmstat.pgalloc_normal
 4.682e+08            -3.3%  4.528e+08        proc-vmstat.pgfree
    673.67 =C2=B1  7%     -13.4%     583.64 =C2=B1  2%  sched_debug.cfs_rq:=
/.exec_clock.stddev
      0.93 =C2=B1  7%     +23.1%       1.14        sched_debug.cfs_rq:/.loa=
d_avg.min
      1.23 =C2=B1  9%     -18.4%       1.00        sched_debug.cfs_rq:/.nr_=
running.max
    779.44 =C2=B1  9%     +15.0%     896.36 =C2=B1  2%  sched_debug.cfs_rq:=
/.removed.load_avg.max
     35998 =C2=B1  9%     +15.0%      41403        sched_debug.cfs_rq:/.rem=
oved.runnable_sum.max
    314.12 =C2=B1 26%     -49.0%     160.29 =C2=B1  5%  sched_debug.cfs_rq:=
/.runnable_load_avg.max
    243.17 =C2=B1 17%     +20.1%     292.07 =C2=B1 11%  sched_debug.cfs_rq:=
/.util_avg.min
     53.89 =C2=B1 15%     +23.0%      66.26 =C2=B1  5%  sched_debug.cpu.clo=
ck.stddev
     53.89 =C2=B1 15%     +23.0%      66.26 =C2=B1  5%  sched_debug.cpu.clo=
ck_task.stddev
     23.03 =C2=B1  8%     +13.3%      26.09 =C2=B1  8%  sched_debug.cpu.cpu=
_load[2].stddev
    185.49 =C2=B1 18%     +23.0%     228.21 =C2=B1  4%  sched_debug.cpu.cpu=
_load[3].max
     18.25 =C2=B1 14%     +27.2%      23.22 =C2=B1  3%  sched_debug.cpu.cpu=
_load[3].stddev
      3.41 =C2=B1 12%     +14.7%       3.91        sched_debug.cpu.cpu_load=
[4].avg
    171.67 =C2=B1 27%     +32.5%     227.50 =C2=B1 10%  sched_debug.cpu.cpu=
_load[4].max
     16.29 =C2=B1 23%     +37.1%      22.33 =C2=B1  2%  sched_debug.cpu.cpu=
_load[4].stddev
      0.00 =C2=B1  8%     +32.6%       0.00 =C2=B1  2%  sched_debug.cpu.nex=
t_balance.stddev
      9.29 =C2=B1 12%     +22.2%      11.35        sched_debug.cpu.nr_unint=
erruptible.avg
      3.04 =C2=B1100%      -3.0        0.00        perf-profile.calltrace.c=
ycles-pp.sieve
      0.52 =C2=B1 60%      +0.3        0.80 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.do_wp_page.__handle_mm_fault.handle_mm_fault.__do_page_fault.=
do_page_fault
      1.24 =C2=B1 18%      +0.3        1.55 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.unmap_page_range.unmap_vmas.exit_mmap.mmput.do_exit
      1.30 =C2=B1 18%      +0.3        1.62 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.unmap_vmas.exit_mmap.mmput.do_exit.do_group_exit
      0.29 =C2=B1100%      +0.3        0.64 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidl=
e_enter_state.cpuidle_enter
      0.56 =C2=B1 63%      +0.3        0.91 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.copy_p4d_range.copy_page_range.dup_mm.copy_process._do_fork
      0.57 =C2=B1 63%      +0.4        0.94 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.copy_page_range.dup_mm.copy_process._do_fork.do_syscall_64
      0.12 =C2=B1173%      +0.5        0.59 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.__softirqentry_text_start.irq_exit.smp_apic_timer_interrupt.a=
pic_timer_interrupt.cpuidle_enter_state
      0.16 =C2=B1173%      +0.5        0.65        perf-profile.calltrace.c=
ycles-pp.__do_sys_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.16 =C2=B1173%      +0.5        0.65        perf-profile.calltrace.c=
ycles-pp.kernel_wait4.__do_sys_wait4.do_syscall_64.entry_SYSCALL_64_after_h=
wframe
      1.38 =C2=B1 23%      +0.5        1.86 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.filemap_map_pages.__handle_mm_fault.handle_mm_fault.__do_page=
_fault.do_page_fault
      0.75 =C2=B1 38%      +0.5        1.29        perf-profile.calltrace.c=
ycles-pp.anon_vma_fork.dup_mm.copy_process._do_fork.do_syscall_64
      0.36 =C2=B1105%      +0.6        0.94        perf-profile.calltrace.c=
ycles-pp.anon_vma_clone.anon_vma_fork.dup_mm.copy_process._do_fork
      2.83 =C2=B1 20%      +0.6        3.48 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.__handle_mm_fault.handle_mm_fault.__do_page_fault.do_page_fau=
lt.page_fault
      2.92 =C2=B1 20%      +0.7        3.58 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      3.26 =C2=B1 19%      +0.7        3.94 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.__do_page_fault.do_page_fault.page_fault
     11.68 =C2=B1 25%      +3.9       15.58 =C2=B1 12%  perf-profile.calltr=
ace.cycles-pp.dup_mm.copy_process._do_fork.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe
      9.38 =C2=B1 34%      +4.0       13.43 =C2=B1 15%  perf-profile.calltr=
ace.cycles-pp.free_pgtables.exit_mmap.mmput.do_exit.do_group_exit
     11.97 =C2=B1 27%      +4.6       16.54 =C2=B1 11%  perf-profile.calltr=
ace.cycles-pp.exit_mmap.mmput.do_exit.do_group_exit.__x64_sys_exit_group
     11.98 =C2=B1 27%      +4.6       16.55 =C2=B1 11%  perf-profile.calltr=
ace.cycles-pp.mmput.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
     12.86 =C2=B1 26%      +4.6       17.47 =C2=B1 10%  perf-profile.calltr=
ace.cycles-pp.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame
     12.86 =C2=B1 26%      +4.6       17.47 =C2=B1 10%  perf-profile.calltr=
ace.cycles-pp.do_group_exit.__x64_sys_exit_group.do_syscall_64.entry_SYSCAL=
L_64_after_hwframe
     12.86 =C2=B1 26%      +4.6       17.47 =C2=B1 10%  perf-profile.calltr=
ace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
      8.05 =C2=B1 44%      +6.0       14.07 =C2=B1 14%  perf-profile.calltr=
ace.cycles-pp.copy_process._do_fork.do_syscall_64.entry_SYSCALL_64_after_hw=
frame
      8.23 =C2=B1 44%      +6.1       14.34 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp._do_fork.do_syscall_64.entry_SYSCALL_64_after_hwframe
     37.29 =C2=B1 20%     +11.1       48.38 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
     37.31 =C2=B1 20%     +11.1       48.41 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.entry_SYSCALL_64_after_hwframe
      3.04 =C2=B1100%      -3.0        0.00        perf-profile.children.cy=
cles-pp.sieve
      0.41 =C2=B1 21%      -0.2        0.22 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.syscall_trace_enter
      0.20 =C2=B1 39%      -0.2        0.03 =C2=B1100%  perf-profile.childr=
en.cycles-pp.trace_buffer_lock_reserve
      0.37 =C2=B1 32%      -0.2        0.20 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.menu_select
      0.33 =C2=B1 18%      -0.2        0.16        perf-profile.children.cy=
cles-pp.syscall_slow_exit_work
      0.32 =C2=B1 24%      -0.2        0.17 =C2=B1 15%  perf-profile.childr=
en.cycles-pp.ftrace_syscall_enter
      0.28 =C2=B1 22%      -0.2        0.12 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.ftrace_syscall_exit
      0.17 =C2=B1 38%      -0.1        0.03 =C2=B1100%  perf-profile.childr=
en.cycles-pp.ring_buffer_lock_reserve
      0.11 =C2=B1 29%      -0.1        0.06        perf-profile.children.cy=
cles-pp.irq_enter
      0.07 =C2=B1 14%      -0.0        0.03 =C2=B1100%  perf-profile.childr=
en.cycles-pp.sched_clock_cpu
      0.16 =C2=B1 15%      -0.0        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.free_pcppages_bulk
      0.07 =C2=B1 13%      -0.0        0.05        perf-profile.children.cy=
cles-pp.__list_add_valid
      0.14 =C2=B1 18%      +0.0        0.17 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.vm_area_dup
      0.15 =C2=B1  9%      +0.0        0.18 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.refcount_dec_and_lock_irqsave
      0.12 =C2=B1 18%      +0.0        0.15 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.__put_user_4
      0.15 =C2=B1 11%      +0.0        0.19 =C2=B1 15%  perf-profile.childr=
en.cycles-pp.free_uid
      0.19 =C2=B1 14%      +0.0        0.23 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.anon_vma_interval_tree_remove
      0.10 =C2=B1 24%      +0.0        0.14 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.schedule_tail
      0.25 =C2=B1 14%      +0.0        0.30 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.wake_up_new_task
      0.01 =C2=B1173%      +0.0        0.06        perf-profile.children.cy=
cles-pp.__put_task_struct
      0.15 =C2=B1 11%      +0.1        0.21 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.refcount_dec_not_one
      0.04 =C2=B1103%      +0.1        0.10 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.autoremove_wake_function
      0.05 =C2=B1 74%      +0.1        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.pipe_wait
      0.14 =C2=B1 28%      +0.1        0.21 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.__wake_up_common
      0.24 =C2=B1 14%      +0.1        0.31 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.put_cred_rcu
      0.07 =C2=B1 70%      +0.1        0.14 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.pipe_read
      0.15 =C2=B1 29%      +0.1        0.23 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.__wake_up_common_lock
      0.04 =C2=B1104%      +0.1        0.14 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.pipe_write
      0.48 =C2=B1 10%      +0.1        0.60 =C2=B1 15%  perf-profile.childr=
en.cycles-pp.rcu_core
      0.79 =C2=B1  9%      +0.1        0.94 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.__softirqentry_text_start
      0.74 =C2=B1 15%      +0.1        0.89 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.unlink_anon_vmas
      0.37 =C2=B1 19%      +0.2        0.52 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.anon_vma_interval_tree_insert
      0.74 =C2=B1 18%      +0.2        0.90 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.do_wp_page
      0.63 =C2=B1 20%      +0.2        0.79 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.wp_page_copy
      0.74 =C2=B1 17%      +0.2        0.98 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.anon_vma_clone
      0.99 =C2=B1 20%      +0.3        1.33        perf-profile.children.cy=
cles-pp.anon_vma_fork
      2.20 =C2=B1 17%      +0.4        2.62 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.filemap_map_pages
     11.68 =C2=B1 25%      +3.9       15.59 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.dup_mm
     12.60 =C2=B1 23%      +3.9       16.52 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.copy_process
     17.92 =C2=B1 18%      +3.9       21.86 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.exit_mmap
     17.94 =C2=B1 18%      +3.9       21.88 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.mmput
     12.90 =C2=B1 22%      +4.0       16.86 =C2=B1 11%  perf-profile.childr=
en.cycles-pp._do_fork
     12.90 =C2=B1 25%      +4.6       17.49 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.do_exit
     12.91 =C2=B1 25%      +4.6       17.50 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.__x64_sys_exit_group
     12.91 =C2=B1 25%      +4.6       17.50 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.do_group_exit
     50.20 =C2=B1 10%      +5.2       55.40 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.entry_SYSCALL_64_after_hwframe
     50.16 =C2=B1 10%      +5.2       55.37 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.do_syscall_64
      3.00 =C2=B1100%      -3.0        0.00        perf-profile.self.cycles=
-pp.sieve
      0.17 =C2=B1 25%      -0.1        0.11 =C2=B1  4%  perf-profile.self.c=
ycles-pp.cpuidle_enter_state
      0.13 =C2=B1  9%      -0.0        0.09 =C2=B1 11%  perf-profile.self.c=
ycles-pp.ftrace_syscall_exit
      0.06 =C2=B1  6%      +0.0        0.08 =C2=B1  6%  perf-profile.self.c=
ycles-pp.update_load_avg
      0.07 =C2=B1 11%      +0.0        0.10 =C2=B1  5%  perf-profile.self.c=
ycles-pp.put_cred_rcu
      0.13 =C2=B1 14%      +0.0        0.16        perf-profile.self.cycles=
-pp.unlock_page
      0.12 =C2=B1 13%      +0.0        0.15 =C2=B1  6%  perf-profile.self.c=
ycles-pp.anon_vma_clone
      0.18 =C2=B1 14%      +0.0        0.21 =C2=B1 11%  perf-profile.self.c=
ycles-pp.anon_vma_interval_tree_remove
      0.15 =C2=B1 11%      +0.0        0.20 =C2=B1 10%  perf-profile.self.c=
ycles-pp.refcount_dec_not_one
      0.00            +0.1        0.05        perf-profile.self.cycles-pp._=
_anon_vma_interval_tree_augment_rotate
      0.01 =C2=B1173%      +0.1        0.08 =C2=B1 33%  perf-profile.self.c=
ycles-pp.update_blocked_averages
      0.30 =C2=B1 24%      +0.1        0.39 =C2=B1 10%  perf-profile.self.c=
ycles-pp.copy_page
      0.37 =C2=B1 19%      +0.1        0.52 =C2=B1  6%  perf-profile.self.c=
ycles-pp.anon_vma_interval_tree_insert
      1.56 =C2=B1 20%      +0.4        1.98 =C2=B1  8%  perf-profile.self.c=
ycles-pp.filemap_map_pages
    315.75 =C2=B1 49%     -36.2%     201.50 =C2=B1  3%  interrupts.47:PCI-M=
SI.1572866-edge.eth0-TxRx-2
    209.50 =C2=B1  7%    +607.6%       1482 =C2=B1 85%  interrupts.48:PCI-M=
SI.1572867-edge.eth0-TxRx-3
    261.00 =C2=B1 40%     +47.3%     384.50 =C2=B1 43%  interrupts.54:PCI-M=
SI.1572873-edge.eth0-TxRx-9
    262.75 =C2=B1 21%     -20.5%     209.00        interrupts.60:PCI-MSI.15=
72879-edge.eth0-TxRx-15
    194.25 =C2=B1  8%     +15.6%     224.50 =C2=B1  9%  interrupts.70:PCI-M=
SI.1572889-edge.eth0-TxRx-25
    194.50 =C2=B1  8%     +20.3%     234.00 =C2=B1 13%  interrupts.72:PCI-M=
SI.1572891-edge.eth0-TxRx-27
    194.00 =C2=B1  8%    +100.3%     388.50 =C2=B1 48%  interrupts.76:PCI-M=
SI.1572895-edge.eth0-TxRx-31
     16378 =C2=B1  4%     -10.9%      14598        interrupts.CPU0.RES:Resc=
heduling_interrupts
    611.75 =C2=B1131%    +693.1%       4851 =C2=B1  6%  interrupts.CPU10.NM=
I:Non-maskable_interrupts
    611.75 =C2=B1131%    +693.1%       4851 =C2=B1  6%  interrupts.CPU10.PM=
I:Performance_monitoring_interrupts
      2966 =C2=B1 65%     -99.3%      22.00 =C2=B1 72%  interrupts.CPU100.N=
MI:Non-maskable_interrupts
      2966 =C2=B1 65%     -99.3%      22.00 =C2=B1 72%  interrupts.CPU100.P=
MI:Performance_monitoring_interrupts
     12853 =C2=B1  5%     -14.1%      11047        interrupts.CPU100.RES:Re=
scheduling_interrupts
      4472 =C2=B1  7%     -71.9%       1257 =C2=B1 97%  interrupts.CPU101.N=
MI:Non-maskable_interrupts
      4472 =C2=B1  7%     -71.9%       1257 =C2=B1 97%  interrupts.CPU101.P=
MI:Performance_monitoring_interrupts
      9931 =C2=B1 10%     -14.3%       8514        interrupts.CPU102.RES:Re=
scheduling_interrupts
      9671 =C2=B1  8%     -13.4%       8377        interrupts.CPU103.RES:Re=
scheduling_interrupts
      1674 =C2=B1106%    +184.5%       4762 =C2=B1  8%  interrupts.CPU106.N=
MI:Non-maskable_interrupts
      1674 =C2=B1106%    +184.5%       4762 =C2=B1  8%  interrupts.CPU106.P=
MI:Performance_monitoring_interrupts
     12916 =C2=B1  6%     -14.7%      11018        interrupts.CPU108.RES:Re=
scheduling_interrupts
     12536 =C2=B1  9%     -17.8%      10301 =C2=B1  4%  interrupts.CPU109.R=
ES:Rescheduling_interrupts
     10666 =C2=B1  6%     -17.7%       8781        interrupts.CPU11.RES:Res=
cheduling_interrupts
     10791 =C2=B1  7%     -13.4%       9347        interrupts.CPU111.RES:Re=
scheduling_interrupts
      1536 =C2=B1121%    +209.4%       4753 =C2=B1  7%  interrupts.CPU112.N=
MI:Non-maskable_interrupts
      1536 =C2=B1121%    +209.4%       4753 =C2=B1  7%  interrupts.CPU112.P=
MI:Performance_monitoring_interrupts
      3978 =C2=B1 27%     -99.9%       3.50 =C2=B1 14%  interrupts.CPU118.N=
MI:Non-maskable_interrupts
      3978 =C2=B1 27%     -99.9%       3.50 =C2=B1 14%  interrupts.CPU118.P=
MI:Performance_monitoring_interrupts
     10560 =C2=B1  5%     -18.5%       8611 =C2=B1  6%  interrupts.CPU118.R=
ES:Rescheduling_interrupts
     12039 =C2=B1  7%     -21.1%       9504 =C2=B1  6%  interrupts.CPU12.RE=
S:Rescheduling_interrupts
      1123 =C2=B1169%    +329.2%       4823 =C2=B1  8%  interrupts.CPU122.N=
MI:Non-maskable_interrupts
      1123 =C2=B1169%    +329.2%       4823 =C2=B1  8%  interrupts.CPU122.P=
MI:Performance_monitoring_interrupts
      9473 =C2=B1  6%     -13.5%       8193 =C2=B1  4%  interrupts.CPU123.R=
ES:Rescheduling_interrupts
      1023 =C2=B1173%    +124.4%       2297 =C2=B1 99%  interrupts.CPU124.N=
MI:Non-maskable_interrupts
      1023 =C2=B1173%    +124.4%       2297 =C2=B1 99%  interrupts.CPU124.P=
MI:Performance_monitoring_interrupts
      1620 =C2=B1112%    +120.1%       3565 =C2=B1 25%  interrupts.CPU125.N=
MI:Non-maskable_interrupts
      1620 =C2=B1112%    +120.1%       3565 =C2=B1 25%  interrupts.CPU125.P=
MI:Performance_monitoring_interrupts
      1000 =C2=B1169%    +183.7%       2836 =C2=B1 84%  interrupts.CPU126.N=
MI:Non-maskable_interrupts
      1000 =C2=B1169%    +183.7%       2836 =C2=B1 84%  interrupts.CPU126.P=
MI:Performance_monitoring_interrupts
     12071 =C2=B1  6%     -16.4%      10091 =C2=B1  6%  interrupts.CPU126.R=
ES:Rescheduling_interrupts
     13431 =C2=B1  3%     -14.6%      11466 =C2=B1  4%  interrupts.CPU127.R=
ES:Rescheduling_interrupts
     10962 =C2=B1  6%     -13.7%       9459        interrupts.CPU129.RES:Re=
scheduling_interrupts
     11360 =C2=B1  5%     -13.8%       9787 =C2=B1  5%  interrupts.CPU13.RE=
S:Rescheduling_interrupts
      3423 =C2=B1 58%     +41.9%       4857 =C2=B1  6%  interrupts.CPU130.N=
MI:Non-maskable_interrupts
      3423 =C2=B1 58%     +41.9%       4857 =C2=B1  6%  interrupts.CPU130.P=
MI:Performance_monitoring_interrupts
      9669 =C2=B1  6%     -13.0%       8411 =C2=B1  4%  interrupts.CPU131.R=
ES:Rescheduling_interrupts
     12576 =C2=B1  7%     -13.7%      10857        interrupts.CPU132.RES:Re=
scheduling_interrupts
      3946 =C2=B1 27%     -91.5%     334.50 =C2=B1 96%  interrupts.CPU134.N=
MI:Non-maskable_interrupts
      3946 =C2=B1 27%     -91.5%     334.50 =C2=B1 96%  interrupts.CPU134.P=
MI:Performance_monitoring_interrupts
     10151 =C2=B1  8%     -16.7%       8455 =C2=B1  4%  interrupts.CPU134.R=
ES:Rescheduling_interrupts
      2942 =C2=B1 65%     -99.3%      21.00 =C2=B1100%  interrupts.CPU139.N=
MI:Non-maskable_interrupts
      2942 =C2=B1 65%     -99.3%      21.00 =C2=B1100%  interrupts.CPU139.P=
MI:Performance_monitoring_interrupts
      9758 =C2=B1  8%     -16.7%       8125 =C2=B1  2%  interrupts.CPU139.R=
ES:Rescheduling_interrupts
      1224 =C2=B1172%    +203.8%       3719 =C2=B1 38%  interrupts.CPU14.NM=
I:Non-maskable_interrupts
      1224 =C2=B1172%    +203.8%       3719 =C2=B1 38%  interrupts.CPU14.PM=
I:Performance_monitoring_interrupts
     10654 =C2=B1 10%     -14.9%       9071        interrupts.CPU14.RES:Res=
cheduling_interrupts
     11715 =C2=B1  7%     -15.8%       9863        interrupts.CPU140.RES:Re=
scheduling_interrupts
     10556 =C2=B1  5%     -15.3%       8938 =C2=B1  3%  interrupts.CPU141.R=
ES:Rescheduling_interrupts
      2317 =C2=B1 96%    +113.1%       4939 =C2=B1  5%  interrupts.CPU143.N=
MI:Non-maskable_interrupts
      2317 =C2=B1 96%    +113.1%       4939 =C2=B1  5%  interrupts.CPU143.P=
MI:Performance_monitoring_interrupts
    262.75 =C2=B1 21%     -20.5%     209.00        interrupts.CPU15.60:PCI-=
MSI.1572879-edge.eth0-TxRx-15
      9911 =C2=B1  5%     -10.1%       8914        interrupts.CPU16.RES:Res=
cheduling_interrupts
     15340 =C2=B1  2%     -14.5%      13116 =C2=B1  7%  interrupts.CPU18.RE=
S:Rescheduling_interrupts
     12851 =C2=B1  4%     -11.4%      11384 =C2=B1  5%  interrupts.CPU19.RE=
S:Rescheduling_interrupts
    315.75 =C2=B1 49%     -36.2%     201.50 =C2=B1  3%  interrupts.CPU2.47:=
PCI-MSI.1572866-edge.eth0-TxRx-2
      0.75 =C2=B1173%  +1.7e+05%       1252 =C2=B1 76%  interrupts.CPU20.NM=
I:Non-maskable_interrupts
      0.75 =C2=B1173%  +1.7e+05%       1252 =C2=B1 76%  interrupts.CPU20.PM=
I:Performance_monitoring_interrupts
     12010 =C2=B1  8%     -12.0%      10567 =C2=B1  2%  interrupts.CPU20.RE=
S:Rescheduling_interrupts
     13261 =C2=B1  2%     -19.3%      10706        interrupts.CPU21.RES:Res=
cheduling_interrupts
    726.00 =C2=B1173%    +541.1%       4654 =C2=B1  7%  interrupts.CPU22.NM=
I:Non-maskable_interrupts
    726.00 =C2=B1173%    +541.1%       4654 =C2=B1  7%  interrupts.CPU22.PM=
I:Performance_monitoring_interrupts
     12065 =C2=B1  6%     -15.6%      10178 =C2=B1  4%  interrupts.CPU22.RE=
S:Rescheduling_interrupts
    194.25 =C2=B1  8%     +15.6%     224.50 =C2=B1  9%  interrupts.CPU25.70=
:PCI-MSI.1572889-edge.eth0-TxRx-25
     10775 =C2=B1  7%     -15.8%       9069 =C2=B1  3%  interrupts.CPU25.RE=
S:Rescheduling_interrupts
     10707 =C2=B1 10%     -13.3%       9279        interrupts.CPU26.RES:Res=
cheduling_interrupts
    194.50 =C2=B1  8%     +20.3%     234.00 =C2=B1 13%  interrupts.CPU27.72=
:PCI-MSI.1572891-edge.eth0-TxRx-27
      6.75 =C2=B1156%  +16277.8%       1105 =C2=B1 98%  interrupts.CPU27.NM=
I:Non-maskable_interrupts
      6.75 =C2=B1156%  +16277.8%       1105 =C2=B1 98%  interrupts.CPU27.PM=
I:Performance_monitoring_interrupts
     10577 =C2=B1  6%     -11.9%       9316 =C2=B1  2%  interrupts.CPU27.RE=
S:Rescheduling_interrupts
      1240 =C2=B1160%    +277.1%       4676 =C2=B1  6%  interrupts.CPU28.NM=
I:Non-maskable_interrupts
      1240 =C2=B1160%    +277.1%       4676 =C2=B1  6%  interrupts.CPU28.PM=
I:Performance_monitoring_interrupts
     16.00 =C2=B1129%  +21987.5%       3534 =C2=B1 26%  interrupts.CPU29.NM=
I:Non-maskable_interrupts
     16.00 =C2=B1129%  +21987.5%       3534 =C2=B1 26%  interrupts.CPU29.PM=
I:Performance_monitoring_interrupts
    209.50 =C2=B1  7%    +607.6%       1482 =C2=B1 85%  interrupts.CPU3.48:=
PCI-MSI.1572867-edge.eth0-TxRx-3
     12626 =C2=B1  5%     -12.0%      11109 =C2=B1  3%  interrupts.CPU3.RES=
:Rescheduling_interrupts
    194.00 =C2=B1  8%    +100.3%     388.50 =C2=B1 48%  interrupts.CPU31.76=
:PCI-MSI.1572895-edge.eth0-TxRx-31
      1051 =C2=B1100%    +356.8%       4802 =C2=B1  8%  interrupts.CPU31.NM=
I:Non-maskable_interrupts
      1051 =C2=B1100%    +356.8%       4802 =C2=B1  8%  interrupts.CPU31.PM=
I:Performance_monitoring_interrupts
      5.50 =C2=B1152%   +1700.0%      99.00 =C2=B1 69%  interrupts.CPU32.NM=
I:Non-maskable_interrupts
      5.50 =C2=B1152%   +1700.0%      99.00 =C2=B1 69%  interrupts.CPU32.PM=
I:Performance_monitoring_interrupts
     10150 =C2=B1  7%     -15.1%       8618 =C2=B1  6%  interrupts.CPU32.RE=
S:Rescheduling_interrupts
     10730 =C2=B1  6%     -14.0%       9231 =C2=B1  4%  interrupts.CPU33.RE=
S:Rescheduling_interrupts
     10838 =C2=B1  5%     -17.9%       8894 =C2=B1  2%  interrupts.CPU34.RE=
S:Rescheduling_interrupts
      9877 =C2=B1  7%     -12.8%       8611 =C2=B1  5%  interrupts.CPU35.RE=
S:Rescheduling_interrupts
      1209 =C2=B1 90%     -99.7%       3.50 =C2=B1100%  interrupts.CPU36.NM=
I:Non-maskable_interrupts
      1209 =C2=B1 90%     -99.7%       3.50 =C2=B1100%  interrupts.CPU36.PM=
I:Performance_monitoring_interrupts
     14558 =C2=B1  2%     -15.8%      12260 =C2=B1  4%  interrupts.CPU36.RE=
S:Rescheduling_interrupts
     13040 =C2=B1  5%     -18.1%      10680 =C2=B1  7%  interrupts.CPU37.RE=
S:Rescheduling_interrupts
     12539 =C2=B1  5%     -12.7%      10943        interrupts.CPU38.RES:Res=
cheduling_interrupts
    639.75 =C2=B1173%    +124.9%       1439 =C2=B1 80%  interrupts.CPU39.NM=
I:Non-maskable_interrupts
    639.75 =C2=B1173%    +124.9%       1439 =C2=B1 80%  interrupts.CPU39.PM=
I:Performance_monitoring_interrupts
     12261 =C2=B1  6%     -14.5%      10481 =C2=B1  6%  interrupts.CPU39.RE=
S:Rescheduling_interrupts
     13154 =C2=B1  4%     -18.0%      10789 =C2=B1  3%  interrupts.CPU4.RES=
:Rescheduling_interrupts
     11044 =C2=B1  3%     -16.1%       9267 =C2=B1  5%  interrupts.CPU40.RE=
S:Rescheduling_interrupts
     11192 =C2=B1  5%     -18.5%       9124 =C2=B1  3%  interrupts.CPU42.RE=
S:Rescheduling_interrupts
     11388 =C2=B1  5%     -19.5%       9171        interrupts.CPU43.RES:Res=
cheduling_interrupts
     12405 =C2=B1  4%     -13.0%      10791        interrupts.CPU44.RES:Res=
cheduling_interrupts
     12086 =C2=B1  7%     -15.6%      10203 =C2=B1  7%  interrupts.CPU45.RE=
S:Rescheduling_interrupts
     93.75 =C2=B1155%   +5034.9%       4814 =C2=B1  6%  interrupts.CPU46.NM=
I:Non-maskable_interrupts
     93.75 =C2=B1155%   +5034.9%       4814 =C2=B1  6%  interrupts.CPU46.PM=
I:Performance_monitoring_interrupts
     10908 =C2=B1  6%     -14.3%       9346 =C2=B1  3%  interrupts.CPU47.RE=
S:Rescheduling_interrupts
     10191 =C2=B1  7%     -15.6%       8604 =C2=B1  6%  interrupts.CPU48.RE=
S:Rescheduling_interrupts
     10421 =C2=B1  9%     -14.5%       8913        interrupts.CPU49.RES:Res=
cheduling_interrupts
     11994 =C2=B1  5%     -19.2%       9690 =C2=B1  3%  interrupts.CPU5.RES=
:Rescheduling_interrupts
      3398 =C2=B1 58%    -100.0%       0.00        interrupts.CPU50.NMI:Non=
-maskable_interrupts
      3398 =C2=B1 58%    -100.0%       0.00        interrupts.CPU50.PMI:Per=
formance_monitoring_interrupts
     10739 =C2=B1  4%     -17.6%       8844 =C2=B1  4%  interrupts.CPU50.RE=
S:Rescheduling_interrupts
     10198 =C2=B1 10%     -16.1%       8552 =C2=B1  3%  interrupts.CPU51.RE=
S:Rescheduling_interrupts
     11673 =C2=B1  6%     -19.0%       9456 =C2=B1  7%  interrupts.CPU52.RE=
S:Rescheduling_interrupts
     12088 =C2=B1  8%     -18.9%       9808 =C2=B1  5%  interrupts.CPU53.RE=
S:Rescheduling_interrupts
     15591 =C2=B1  3%     -15.4%      13192 =C2=B1  2%  interrupts.CPU54.RE=
S:Rescheduling_interrupts
     12738 =C2=B1  3%     -18.7%      10357 =C2=B1  2%  interrupts.CPU55.RE=
S:Rescheduling_interrupts
     11467 =C2=B1  7%     -15.1%       9732 =C2=B1  2%  interrupts.CPU56.RE=
S:Rescheduling_interrupts
      1174 =C2=B1 98%    +313.2%       4852 =C2=B1  8%  interrupts.CPU57.NM=
I:Non-maskable_interrupts
      1174 =C2=B1 98%    +313.2%       4852 =C2=B1  8%  interrupts.CPU57.PM=
I:Performance_monitoring_interrupts
     11791 =C2=B1  5%      -8.2%      10822        interrupts.CPU57.RES:Res=
cheduling_interrupts
     10778 =C2=B1  7%     -15.6%       9094        interrupts.CPU58.RES:Res=
cheduling_interrupts
     10887 =C2=B1  7%     -15.7%       9183        interrupts.CPU59.RES:Res=
cheduling_interrupts
     11517 =C2=B1  9%     -18.4%       9395 =C2=B1  3%  interrupts.CPU6.RES=
:Rescheduling_interrupts
     12452 =C2=B1  4%     -12.2%      10931        interrupts.CPU61.RES:Res=
cheduling_interrupts
     76.75 =C2=B1173%   +6202.3%       4837 =C2=B1  6%  interrupts.CPU62.NM=
I:Non-maskable_interrupts
     76.75 =C2=B1173%   +6202.3%       4837 =C2=B1  6%  interrupts.CPU62.PM=
I:Performance_monitoring_interrupts
      9.50 =C2=B1173%   +1194.7%     123.00 =C2=B1 86%  interrupts.CPU63.NM=
I:Non-maskable_interrupts
      9.50 =C2=B1173%   +1194.7%     123.00 =C2=B1 86%  interrupts.CPU63.PM=
I:Performance_monitoring_interrupts
     10589 =C2=B1  8%     -17.2%       8766 =C2=B1  3%  interrupts.CPU63.RE=
S:Rescheduling_interrupts
     11311 =C2=B1  9%     -14.8%       9641 =C2=B1  2%  interrupts.CPU64.RE=
S:Rescheduling_interrupts
      1059 =C2=B1173%    +111.6%       2242 =C2=B1 97%  interrupts.CPU65.NM=
I:Non-maskable_interrupts
      1059 =C2=B1173%    +111.6%       2242 =C2=B1 97%  interrupts.CPU65.PM=
I:Performance_monitoring_interrupts
      9977 =C2=B1  6%     -10.7%       8910        interrupts.CPU65.RES:Res=
cheduling_interrupts
     52.75 =C2=B1156%     -97.2%       1.50 =C2=B1 33%  interrupts.CPU66.NM=
I:Non-maskable_interrupts
     52.75 =C2=B1156%     -97.2%       1.50 =C2=B1 33%  interrupts.CPU66.PM=
I:Performance_monitoring_interrupts
     10196 =C2=B1  6%     -15.8%       8583 =C2=B1  4%  interrupts.CPU66.RE=
S:Rescheduling_interrupts
      1030 =C2=B1166%    +244.1%       3545 =C2=B1 29%  interrupts.CPU67.NM=
I:Non-maskable_interrupts
      1030 =C2=B1166%    +244.1%       3545 =C2=B1 29%  interrupts.CPU67.PM=
I:Performance_monitoring_interrupts
     12609 =C2=B1  4%     -17.6%      10389 =C2=B1  2%  interrupts.CPU68.RE=
S:Rescheduling_interrupts
     11849 =C2=B1  7%     -16.7%       9867        interrupts.CPU69.RES:Res=
cheduling_interrupts
     12074 =C2=B1  6%     -19.1%       9767 =C2=B1  3%  interrupts.CPU7.RES=
:Rescheduling_interrupts
     10885 =C2=B1  2%     -16.4%       9097 =C2=B1  2%  interrupts.CPU70.RE=
S:Rescheduling_interrupts
     13025 =C2=B1  9%     -23.9%       9908        interrupts.CPU71.RES:Res=
cheduling_interrupts
     13167 =C2=B1  4%     -15.1%      11182 =C2=B1  3%  interrupts.CPU72.RE=
S:Rescheduling_interrupts
      1786 =C2=B1112%    +113.0%       3803 =C2=B1 37%  interrupts.CPU73.NM=
I:Non-maskable_interrupts
      1786 =C2=B1112%    +113.0%       3803 =C2=B1 37%  interrupts.CPU73.PM=
I:Performance_monitoring_interrupts
     13026 =C2=B1 10%     -17.2%      10791 =C2=B1  3%  interrupts.CPU73.RE=
S:Rescheduling_interrupts
     11187 =C2=B1  5%     -15.0%       9507 =C2=B1  5%  interrupts.CPU74.RE=
S:Rescheduling_interrupts
     12505 =C2=B1  3%     -14.3%      10719 =C2=B1  2%  interrupts.CPU76.RE=
S:Rescheduling_interrupts
     10949 =C2=B1  6%     -11.6%       9680        interrupts.CPU8.RES:Resc=
heduling_interrupts
     10064 =C2=B1  8%     -18.4%       8214        interrupts.CPU80.RES:Res=
cheduling_interrupts
      2392 =C2=B1 73%     -99.9%       3.00 =C2=B1100%  interrupts.CPU82.NM=
I:Non-maskable_interrupts
      2392 =C2=B1 73%     -99.9%       3.00 =C2=B1100%  interrupts.CPU82.PM=
I:Performance_monitoring_interrupts
     10354 =C2=B1  8%     -16.7%       8624 =C2=B1  4%  interrupts.CPU82.RE=
S:Rescheduling_interrupts
      1082 =C2=B1160%    +235.1%       3628 =C2=B1 28%  interrupts.CPU84.NM=
I:Non-maskable_interrupts
      1082 =C2=B1160%    +235.1%       3628 =C2=B1 28%  interrupts.CPU84.PM=
I:Performance_monitoring_interrupts
     11224 =C2=B1  6%     -17.3%       9280        interrupts.CPU85.RES:Res=
cheduling_interrupts
      2319 =C2=B1 99%    +109.4%       4857 =C2=B1  6%  interrupts.CPU89.NM=
I:Non-maskable_interrupts
      2319 =C2=B1 99%    +109.4%       4857 =C2=B1  6%  interrupts.CPU89.PM=
I:Performance_monitoring_interrupts
    261.00 =C2=B1 40%     +47.3%     384.50 =C2=B1 43%  interrupts.CPU9.54:=
PCI-MSI.1572873-edge.eth0-TxRx-9
    800.75 =C2=B1162%    +258.5%       2870 =C2=B1 88%  interrupts.CPU9.NMI=
:Non-maskable_interrupts
    800.75 =C2=B1162%    +258.5%       2870 =C2=B1 88%  interrupts.CPU9.PMI=
:Performance_monitoring_interrupts
     10918 =C2=B1  6%     -16.9%       9070        interrupts.CPU9.RES:Resc=
heduling_interrupts
     13417 =C2=B1  9%     -19.6%      10786 =C2=B1  3%  interrupts.CPU90.RE=
S:Rescheduling_interrupts
      2188 =C2=B1 67%     +59.6%       3492 =C2=B1 25%  interrupts.CPU91.NM=
I:Non-maskable_interrupts
      2188 =C2=B1 67%     +59.6%       3492 =C2=B1 25%  interrupts.CPU91.PM=
I:Performance_monitoring_interrupts
     11478 =C2=B1  4%     -15.5%       9703 =C2=B1  7%  interrupts.CPU92.RE=
S:Rescheduling_interrupts
     11186 =C2=B1  7%     -13.3%       9702 =C2=B1  5%  interrupts.CPU94.RE=
S:Rescheduling_interrupts
     10416 =C2=B1  9%     -14.6%       8892        interrupts.CPU95.RES:Res=
cheduling_interrupts
     10373 =C2=B1  7%     -12.4%       9091        interrupts.CPU96.RES:Res=
cheduling_interrupts
      4550 =C2=B1  6%     -46.3%       2445 =C2=B1  7%  interrupts.CPU97.NM=
I:Non-maskable_interrupts
      4550 =C2=B1  6%     -46.3%       2445 =C2=B1  7%  interrupts.CPU97.PM=
I:Performance_monitoring_interrupts
     10449 =C2=B1  8%     -13.9%       8993 =C2=B1  4%  interrupts.CPU97.RE=
S:Rescheduling_interrupts
      4478 =C2=B1  7%     -71.7%       1268 =C2=B1 97%  interrupts.CPU99.NM=
I:Non-maskable_interrupts
      4478 =C2=B1  7%     -71.7%       1268 =C2=B1 97%  interrupts.CPU99.PM=
I:Performance_monitoring_interrupts
   1602258 =C2=B1  6%     -13.8%    1381405 =C2=B1  3%  interrupts.RES:Resc=
heduling_interrupts



***************************************************************************=
************************
lkp-bdw-ex1: 192 threads Intel(R) Xeon(R) CPU E7-8890 v4 @ 2.20GHz with 496=
G memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/load/rootfs/tbox_group/test/testcase/ucod=
e:
  gcc-7/performance/x86_64-rhel-7.6/2000/debian-x86_64-2019-05-14.cgz/lkp-b=
dw-ex1/fork_test/aim7/0xb000036

commit: =

  4f23dbc1e6 ("locking/rwsem: Implement lock handoff to prevent lock starva=
tion")
  00f3c5a3df ("locking/rwsem: Always release wait_lock before waking up tas=
ks")

4f23dbc1e657951e 00f3c5a3df2c1e3dab14d0dd2b7 =

---------------- --------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :2           50%           1:2     dmesg.WARNING:at#for_ip_swapg=
s_restore_regs_and_return_to_usermode/0x
           :2           50%           1:2     dmesg.WARNING:stack_recursion



***************************************************************************=
************************
lkp-bdw-ex1: 192 threads Intel(R) Xeon(R) CPU E7-8890 v4 @ 2.20GHz with 496=
G memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/load/rootfs/tbox_group/test/testcase/ucod=
e:
  gcc-7/performance/x86_64-rhel-7.6/8000/debian-x86_64-2019-05-14.cgz/lkp-b=
dw-ex1/misc_rtns_1/aim7/0xb000036

commit: =

  4f23dbc1e6 ("locking/rwsem: Implement lock handoff to prevent lock starva=
tion")
  00f3c5a3df ("locking/rwsem: Always release wait_lock before waking up tas=
ks")

4f23dbc1e657951e 00f3c5a3df2c1e3dab14d0dd2b7 =

---------------- --------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

          0:4           -5%           0:2     perf-profile.children.cycles-=
pp.error_entry
          0:4           -3%           0:2     perf-profile.self.cycles-pp.e=
rror_entry
         %stddev     %change         %stddev
             \          |                \  =

      2288 =C2=B1  2%      +9.2%       2500        aim7.time.involuntary_co=
ntext_switches
      2890            +2.9%       2974        aim7.time.maximum_resident_se=
t_size
      0.00 =C2=B1 14%      -0.0        0.00 =C2=B1  2%  mpstat.cpu.all.iowa=
it%
      0.01 =C2=B1 30%      +0.0        0.01 =C2=B1  6%  mpstat.cpu.all.soft%
     30.00 =C2=B1173%    +383.3%     145.00 =C2=B1  9%  proc-vmstat.nr_mlock
     94893 =C2=B1  3%      +6.4%     100935 =C2=B1  3%  proc-vmstat.nr_page=
_table_pages
      5058            +1.5%       5134        proc-vmstat.unevictable_pgs_c=
ulled
    252673            +6.3%     268545 =C2=B1  5%  numa-meminfo.node1.Unevi=
ctable
    380351 =C2=B1 60%     -73.7%      99869 =C2=B1 27%  numa-meminfo.node2.=
AnonPages
    176112 =C2=B1 88%     -90.9%      16067 =C2=B1 19%  numa-meminfo.node2.=
PageTables
      4988 =C2=B1  2%     +55.8%       7772 =C2=B1 31%  numa-meminfo.node3.=
Mapped
      4180 =C2=B1  9%     +21.1%       5062 =C2=B1  7%  slabinfo.eventpoll_=
pwq.active_objs
      4180 =C2=B1  9%     +21.1%       5062 =C2=B1  7%  slabinfo.eventpoll_=
pwq.num_objs
    541.75 =C2=B1 14%     +25.5%     680.00        slabinfo.skbuff_fclone_c=
ache.active_objs
    541.75 =C2=B1 14%     +25.5%     680.00        slabinfo.skbuff_fclone_c=
ache.num_objs
      6.20 =C2=B1  5%      +0.4        6.57 =C2=B1  3%  perf-stat.i.cache-m=
iss-rate%
      0.28            +0.0        0.29        perf-stat.i.dTLB-store-miss-r=
ate%
  12479108            -2.2%   12200011        perf-stat.i.node-load-misses
      0.29            +0.0        0.29        perf-stat.overall.dTLB-store-=
miss-rate%
  12329381            -2.2%   12053893        perf-stat.ps.node-load-misses
     53.00 =C2=B1  3%    +140.6%     127.50 =C2=B1 49%  interrupts.139:PCI-=
MSI.1574921-edge.eth3-TxRx-9
      1996 =C2=B1 10%     -16.8%       1660        interrupts.CPU160.RES:Re=
scheduling_interrupts
      1968 =C2=B1  9%     -20.2%       1570 =C2=B1  4%  interrupts.CPU163.R=
ES:Rescheduling_interrupts
      1979 =C2=B1 10%     -20.4%       1575 =C2=B1  9%  interrupts.CPU56.RE=
S:Rescheduling_interrupts
      1926 =C2=B1  8%     -14.6%       1645 =C2=B1  2%  interrupts.CPU66.RE=
S:Rescheduling_interrupts
     53.00 =C2=B1  3%    +140.6%     127.50 =C2=B1 49%  interrupts.CPU9.139=
:PCI-MSI.1574921-edge.eth3-TxRx-9
      1235            +8.3%       1337 =C2=B1  6%  numa-vmstat.node1.nr_map=
ped
     63169            +6.3%      67134 =C2=B1  5%  numa-vmstat.node1.nr_une=
victable
     63169            +6.3%      67134 =C2=B1  5%  numa-vmstat.node1.nr_zon=
e_unevictable
     95077 =C2=B1 61%     -73.7%      24959 =C2=B1 28%  numa-vmstat.node2.n=
r_anon_pages
     44094 =C2=B1 88%     -90.9%       4014 =C2=B1 19%  numa-vmstat.node2.n=
r_page_table_pages
      1309 =C2=B1 10%     +57.2%       2058 =C2=B1 24%  numa-vmstat.node3.n=
r_mapped
    376579 =C2=B1  7%     +22.1%     459946 =C2=B1 12%  numa-vmstat.node3.n=
uma_hit
    278936 =C2=B1 13%     +24.4%     347071 =C2=B1 16%  numa-vmstat.node3.n=
uma_local
     14.31 =C2=B1 54%   +1356.5%     208.44 =C2=B1 91%  sched_debug.cfs_rq:=
/.load_avg.avg
    485.50 =C2=B1 10%   +4220.5%      20976 =C2=B1 97%  sched_debug.cfs_rq:=
/.load_avg.max
     64.90 =C2=B1 34%   +3027.9%       2030 =C2=B1 96%  sched_debug.cfs_rq:=
/.load_avg.stddev
     58047 =C2=B1 10%     +23.4%      71641 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
     37.00 =C2=B1  4%     -12.8%      32.25        sched_debug.cfs_rq:/.run=
nable_load_avg.max
     58045 =C2=B1 10%     +23.4%      71609 =C2=B1  2%  sched_debug.cfs_rq:=
/.spread0.stddev
    149.17 =C2=B1 15%     +30.3%     194.33 =C2=B1  5%  sched_debug.cfs_rq:=
/.util_avg.avg
      8.45 =C2=B1 34%     +53.5%      12.97 =C2=B1 10%  sched_debug.cfs_rq:=
/.util_est_enqueued.avg
     42.87 =C2=B1 21%     +24.7%      53.47        sched_debug.cfs_rq:/.uti=
l_est_enqueued.stddev
     37.00 =C2=B1  4%     -12.8%      32.25        sched_debug.cpu.cpu_load=
[0].max
      0.85 =C2=B1 10%     +22.9%       1.04        sched_debug.cpu.cpu_load=
[4].avg
     70.12 =C2=B1 11%     +48.0%     103.75 =C2=B1 22%  sched_debug.cpu.cpu=
_load[4].max
      5.40 =C2=B1 10%     +43.2%       7.73 =C2=B1 19%  sched_debug.cpu.cpu=
_load[4].stddev
     22047 =C2=B1  3%      +7.5%      23711 =C2=B1  7%  sched_debug.cpu.nr_=
switches.max
     13940 =C2=B1  4%     +15.9%      16158 =C2=B1  6%  sched_debug.cpu.ttw=
u_count.max
    433.88 =C2=B1 11%     +20.1%     521.25 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.max
     37.71 =C2=B1  4%     +10.2%      41.56        sched_debug.cpu.ttwu_loc=
al.stddev
      0.49 =C2=B1104%      +0.9        1.42 =C2=B1 32%  perf-profile.calltr=
ace.cycles-pp.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      0.59 =C2=B1103%      +0.9        1.53 =C2=B1 23%  perf-profile.calltr=
ace.cycles-pp.__do_page_fault.do_page_fault.page_fault
      0.61 =C2=B1103%      +0.9        1.55 =C2=B1 21%  perf-profile.calltr=
ace.cycles-pp.page_fault
      0.61 =C2=B1103%      +0.9        1.55 =C2=B1 21%  perf-profile.calltr=
ace.cycles-pp.do_page_fault.page_fault
      0.46 =C2=B1104%      +1.9        2.33 =C2=B1 61%  perf-profile.calltr=
ace.cycles-pp.__handle_mm_fault.handle_mm_fault.__do_page_fault.do_page_fau=
lt.page_fault
      1.05 =C2=B1 77%      -0.9        0.18 =C2=B1100%  perf-profile.childr=
en.cycles-pp.perf_mux_hrtimer_handler
      0.99 =C2=B1 87%      -0.9        0.12 =C2=B1100%  perf-profile.childr=
en.cycles-pp.load_balance
      0.88 =C2=B1103%      -0.8        0.09 =C2=B1100%  perf-profile.childr=
en.cycles-pp.find_busiest_group
      0.97 =C2=B1 87%      -0.8        0.18 =C2=B1100%  perf-profile.childr=
en.cycles-pp.native_write_msr
      0.84 =C2=B1110%      -0.8        0.09 =C2=B1 99%  perf-profile.childr=
en.cycles-pp.update_sd_lb_stats
      0.72 =C2=B1137%      -0.7        0.06 =C2=B1100%  perf-profile.childr=
en.cycles-pp.ksys_write
      0.70 =C2=B1142%      -0.7        0.04 =C2=B1100%  perf-profile.childr=
en.cycles-pp.vfs_write
      0.70 =C2=B1143%      -0.7        0.04 =C2=B1100%  perf-profile.childr=
en.cycles-pp.new_sync_write
      0.71 =C2=B1141%      -0.7        0.05 =C2=B1100%  perf-profile.childr=
en.cycles-pp.idle_cpu
      0.23 =C2=B1 60%      +0.9        1.11 =C2=B1 69%  perf-profile.childr=
en.cycles-pp._raw_spin_lock_irq
      0.09 =C2=B1102%      +0.9        1.02 =C2=B1 84%  perf-profile.childr=
en.cycles-pp.lockref_get_not_dead
      0.10 =C2=B1101%      +0.9        1.04 =C2=B1 81%  perf-profile.childr=
en.cycles-pp.unlazy_walk
      0.07 =C2=B1103%      +1.0        1.02 =C2=B1 85%  perf-profile.childr=
en.cycles-pp.filp_close
      0.05 =C2=B1103%      +1.0        1.00 =C2=B1 88%  perf-profile.childr=
en.cycles-pp.__do_fault
      0.01 =C2=B1173%      +1.0        0.98 =C2=B1 92%  perf-profile.childr=
en.cycles-pp.walk_component
      0.56 =C2=B1 83%      +1.8        2.38 =C2=B1 58%  perf-profile.childr=
en.cycles-pp.handle_mm_fault
      0.52 =C2=B1 83%      +1.8        2.34 =C2=B1 61%  perf-profile.childr=
en.cycles-pp.__handle_mm_fault
      0.66 =C2=B1 86%      +1.8        2.48 =C2=B1 52%  perf-profile.childr=
en.cycles-pp.__do_page_fault
      0.68 =C2=B1 86%      +1.8        2.50 =C2=B1 50%  perf-profile.childr=
en.cycles-pp.do_page_fault
      0.10 =C2=B1100%      +1.9        2.00 =C2=B1 88%  perf-profile.childr=
en.cycles-pp.link_path_walk
      0.97 =C2=B1 87%      -0.8        0.18 =C2=B1100%  perf-profile.self.c=
ycles-pp.native_write_msr
      0.71 =C2=B1141%      -0.7        0.05 =C2=B1100%  perf-profile.self.c=
ycles-pp.idle_cpu
      0.12 =C2=B1 62%      +0.9        1.04 =C2=B1 80%  perf-profile.self.c=
ycles-pp._raw_spin_lock_irq
      0.09 =C2=B1102%      +0.9        1.02 =C2=B1 84%  perf-profile.self.c=
ycles-pp.lockref_get_not_dead
     40636 =C2=B1 10%     +17.1%      47594 =C2=B1  6%  softirqs.CPU0.TIMER
     14166           +14.8%      16269 =C2=B1  2%  softirqs.CPU1.SCHED
     38044 =C2=B1 13%     +29.5%      49279 =C2=B1  9%  softirqs.CPU119.TIM=
ER
     35559 =C2=B1 11%     +16.2%      41310 =C2=B1  4%  softirqs.CPU120.TIM=
ER
     35455 =C2=B1 11%     +17.0%      41488 =C2=B1  2%  softirqs.CPU121.TIM=
ER
     35068 =C2=B1 10%     +16.1%      40722 =C2=B1  5%  softirqs.CPU122.TIM=
ER
     35803 =C2=B1 10%     +13.0%      40466 =C2=B1  5%  softirqs.CPU123.TIM=
ER
     35825 =C2=B1 10%     +14.1%      40893 =C2=B1  3%  softirqs.CPU124.TIM=
ER
     35520 =C2=B1 11%     +13.7%      40369 =C2=B1  4%  softirqs.CPU125.TIM=
ER
     35467 =C2=B1 12%     +17.5%      41691 =C2=B1  8%  softirqs.CPU126.TIM=
ER
     34958 =C2=B1 11%     +15.1%      40232 =C2=B1  4%  softirqs.CPU127.TIM=
ER
     35118 =C2=B1 11%     +14.4%      40160 =C2=B1  4%  softirqs.CPU128.TIM=
ER
     35132 =C2=B1 11%     +16.9%      41075 =C2=B1  6%  softirqs.CPU129.TIM=
ER
     35102 =C2=B1 11%     +16.8%      40985 =C2=B1  3%  softirqs.CPU130.TIM=
ER
     34985 =C2=B1 11%     +14.6%      40090 =C2=B1  4%  softirqs.CPU131.TIM=
ER
     34851 =C2=B1 11%     +15.2%      40142 =C2=B1  4%  softirqs.CPU132.TIM=
ER
     35377 =C2=B1 12%     +13.3%      40081 =C2=B1  4%  softirqs.CPU133.TIM=
ER
     35590 =C2=B1 11%     +13.4%      40345 =C2=B1  4%  softirqs.CPU134.TIM=
ER
     35790 =C2=B1  8%     +12.2%      40158 =C2=B1  4%  softirqs.CPU135.TIM=
ER
     35199 =C2=B1 10%     +14.1%      40152 =C2=B1  4%  softirqs.CPU136.TIM=
ER
     35621 =C2=B1 10%     +12.7%      40149 =C2=B1  4%  softirqs.CPU137.TIM=
ER
     34932 =C2=B1 11%     +14.9%      40122 =C2=B1  4%  softirqs.CPU138.TIM=
ER
     35099 =C2=B1 10%     +14.2%      40084 =C2=B1  4%  softirqs.CPU139.TIM=
ER
     35072 =C2=B1 11%     +14.2%      40039 =C2=B1  4%  softirqs.CPU140.TIM=
ER
     35675 =C2=B1 12%     +13.5%      40489 =C2=B1  5%  softirqs.CPU141.TIM=
ER
     35764 =C2=B1 12%     +12.6%      40259 =C2=B1  4%  softirqs.CPU142.TIM=
ER
     36980 =C2=B1  9%     +14.4%      42313 =C2=B1  4%  softirqs.CPU25.TIMER
     36698 =C2=B1 11%     +13.6%      41699 =C2=B1  4%  softirqs.CPU26.TIMER
     35995 =C2=B1 10%     +15.4%      41530 =C2=B1  4%  softirqs.CPU27.TIMER
     36891 =C2=B1  9%     +12.2%      41375 =C2=B1  4%  softirqs.CPU28.TIMER
     36396 =C2=B1 10%     +13.4%      41291 =C2=B1  4%  softirqs.CPU29.TIMER
     36554 =C2=B1 11%     +12.4%      41089 =C2=B1  4%  softirqs.CPU30.TIMER
     36128 =C2=B1 10%     +14.0%      41170 =C2=B1  4%  softirqs.CPU31.TIMER
     36231 =C2=B1 10%     +16.3%      42151 =C2=B1  6%  softirqs.CPU32.TIMER
     36349 =C2=B1 11%     +15.7%      42052 =C2=B1  6%  softirqs.CPU33.TIMER
     36689 =C2=B1  9%     +12.6%      41328 =C2=B1  4%  softirqs.CPU34.TIMER
     36109 =C2=B1 10%     +14.4%      41318 =C2=B1  4%  softirqs.CPU35.TIMER
     36038 =C2=B1 10%     +14.0%      41098 =C2=B1  3%  softirqs.CPU36.TIMER
     36379 =C2=B1 11%     +13.0%      41123 =C2=B1  4%  softirqs.CPU37.TIMER
     36229 =C2=B1 11%     +13.5%      41132 =C2=B1  4%  softirqs.CPU38.TIMER
     36601 =C2=B1 11%     +12.2%      41074 =C2=B1  3%  softirqs.CPU39.TIMER
     36723 =C2=B1  9%     +12.0%      41148 =C2=B1  3%  softirqs.CPU40.TIMER
     36789 =C2=B1 10%     +11.5%      41010 =C2=B1  3%  softirqs.CPU41.TIMER
     36238 =C2=B1  8%     +13.4%      41097 =C2=B1  3%  softirqs.CPU42.TIMER
     36335 =C2=B1 12%     +13.1%      41079 =C2=B1  3%  softirqs.CPU43.TIMER
     36114 =C2=B1  9%     +13.8%      41110 =C2=B1  4%  softirqs.CPU44.TIMER
     36427 =C2=B1 11%     +13.5%      41361 =C2=B1  4%  softirqs.CPU45.TIMER
     36312 =C2=B1 11%     +13.8%      41311 =C2=B1  4%  softirqs.CPU46.TIMER
     23726 =C2=B1  6%     +12.0%      26584 =C2=B1  3%  softirqs.CPU47.RCU
     13762 =C2=B1  2%     +12.5%      15485 =C2=B1  6%  softirqs.CPU48.SCHED
     38329 =C2=B1 11%     +30.0%      49841 =C2=B1 16%  softirqs.CPU48.TIMER



***************************************************************************=
************************
lkp-knm01: 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz with 80G me=
mory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testc=
ase:
  gcc-7/performance/x86_64-rhel-7.6/thread/100%/debian-x86_64-2019-05-14.cg=
z/lkp-knm01/unlink1/will-it-scale

commit: =

  4f23dbc1e6 ("locking/rwsem: Implement lock handoff to prevent lock starva=
tion")
  00f3c5a3df ("locking/rwsem: Always release wait_lock before waking up tas=
ks")

4f23dbc1e657951e 00f3c5a3df2c1e3dab14d0dd2b7 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      1119 =C2=B1  2%      +3.1%       1154        will-it-scale.time.invol=
untary_context_switches
    318.75 =C2=B1  5%      +9.2%     348.00 =C2=B1  3%  will-it-scale.time.=
percent_of_cpu_this_job_got
    928.56 =C2=B1  5%      +9.6%       1017 =C2=B1  3%  will-it-scale.time.=
system_time
      1.07 =C2=B1  7%      +0.2        1.26 =C2=B1 10%  mpstat.cpu.all.sys%
    275596            +1.2%     278949        proc-vmstat.nr_file_pages
     94.05            +2.6%      96.48 =C2=B1  2%  turbostat.PkgWatt
      1821 =C2=B1  7%     +14.4%       2084 =C2=B1  4%  sched_debug.cfs_rq:=
/.exec_clock.avg
     43331 =C2=B1  3%     +10.0%      47671 =C2=B1  3%  sched_debug.cfs_rq:=
/.load.stddev
    272381 =C2=B1  8%     -19.1%     220404 =C2=B1  5%  sched_debug.cfs_rq:=
/.min_vruntime.avg
     43257 =C2=B1  3%     +10.2%      47663 =C2=B1  3%  sched_debug.cfs_rq:=
/.runnable_weight.stddev
     21.49 =C2=B1  4%     -12.9%      18.71 =C2=B1  7%  sched_debug.cpu.cpu=
_load[0].stddev
    348.60 =C2=B1  4%     -15.0%     296.25 =C2=B1  9%  sched_debug.cpu.cpu=
_load[1].max
    348.25 =C2=B1  3%     -15.1%     295.83 =C2=B1 10%  sched_debug.cpu.cpu=
_load[2].max
     -5.76           -30.5%      -4.00        sched_debug.cpu.nr_uninterrup=
tible.min
     62873 =C2=B1  7%     -20.3%      50079        sched_debug.cpu.sched_co=
unt.max
    152.30 =C2=B1  6%     +12.9%     171.99 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.avg
 7.873e+08 =C2=B1  2%      +4.0%  8.191e+08        perf-stat.i.branch-instr=
uctions
      8.29 =C2=B1  7%      +1.8       10.08 =C2=B1 11%  perf-stat.i.branch-=
miss-rate%
  65211385 =C2=B1  8%     +26.6%   82541419 =C2=B1 12%  perf-stat.i.branch-=
misses
     12.91 =C2=B1  4%     +24.6%      16.08 =C2=B1 18%  perf-stat.i.cpi
  4.73e+10 =C2=B1  5%     +28.9%  6.098e+10 =C2=B1 19%  perf-stat.i.cpu-cyc=
les
      1.80            +0.1        1.86 =C2=B1  3%  perf-stat.i.iTLB-load-mi=
ss-rate%
  67010767 =C2=B1  2%      +7.4%   71977406 =C2=B1  3%  perf-stat.i.iTLB-lo=
ad-misses
 3.694e+09 =C2=B1  2%      +3.4%  3.819e+09        perf-stat.i.iTLB-loads
 3.691e+09 =C2=B1  2%      +3.4%  3.817e+09        perf-stat.i.instructions
      2527            +0.5%       2539        perf-stat.i.minor-faults
      2527            +0.5%       2540        perf-stat.i.page-faults
      8.28 =C2=B1  7%      +1.8       10.07 =C2=B1 11%  perf-stat.overall.b=
ranch-miss-rate%
     12.81 =C2=B1  4%     +24.6%      15.96 =C2=B1 18%  perf-stat.overall.c=
pi
      1.78            +0.1        1.85 =C2=B1  3%  perf-stat.overall.iTLB-l=
oad-miss-rate%
  36179580 =C2=B1  3%     +17.7%   42571444 =C2=B1 13%  perf-stat.overall.p=
ath-length
 7.846e+08 =C2=B1  2%      +4.0%  8.163e+08        perf-stat.ps.branch-inst=
ructions
  64994927 =C2=B1  8%     +26.6%   82258003 =C2=B1 12%  perf-stat.ps.branch=
-misses
 4.714e+10 =C2=B1  5%     +28.9%  6.076e+10 =C2=B1 19%  perf-stat.ps.cpu-cy=
cles
  66779111 =C2=B1  2%      +7.4%   71724036 =C2=B1  3%  perf-stat.ps.iTLB-l=
oad-misses
 3.681e+09 =C2=B1  2%      +3.4%  3.806e+09        perf-stat.ps.iTLB-loads
 3.678e+09 =C2=B1  2%      +3.4%  3.804e+09        perf-stat.ps.instructions
      2519            +0.5%       2531        perf-stat.ps.minor-faults
      2519            +0.5%       2532        perf-stat.ps.page-faults
 1.105e+12 =C2=B1  2%      +3.8%  1.147e+12        perf-stat.total.instruct=
ions
    110711 =C2=B1  4%      +7.0%     118470 =C2=B1  5%  softirqs.CPU109.TIM=
ER
    110627 =C2=B1  4%      +6.2%     117444 =C2=B1  5%  softirqs.CPU112.TIM=
ER
    112989 =C2=B1  7%      +8.4%     122443 =C2=B1  5%  softirqs.CPU123.TIM=
ER
    109980 =C2=B1  3%      +5.1%     115558 =C2=B1  4%  softirqs.CPU14.TIMER
    109702 =C2=B1  4%      +4.8%     114978 =C2=B1  4%  softirqs.CPU17.TIMER
    114458 =C2=B1  6%      +7.4%     122929 =C2=B1  4%  softirqs.CPU195.TIM=
ER
    113939 =C2=B1  3%      +5.0%     119644 =C2=B1  5%  softirqs.CPU236.TIM=
ER
    110976 =C2=B1  6%      +4.9%     116424 =C2=B1  5%  softirqs.CPU240.TIM=
ER
    108141 =C2=B1  5%      +6.4%     115052 =C2=B1  7%  softirqs.CPU253.TIM=
ER
    109346 =C2=B1  6%      +8.2%     118301 =C2=B1  2%  softirqs.CPU256.TIM=
ER
    109601 =C2=B1  5%      +7.0%     117275 =C2=B1  4%  softirqs.CPU266.TIM=
ER
    111080 =C2=B1  2%      +6.8%     118592 =C2=B1  5%  softirqs.CPU268.TIM=
ER
    110244 =C2=B1  5%      +4.5%     115237 =C2=B1  6%  softirqs.CPU274.TIM=
ER
    109345 =C2=B1  6%      +8.0%     118148 =C2=B1  8%  softirqs.CPU275.TIM=
ER
    105278 =C2=B1  2%     +11.3%     117150 =C2=B1  8%  softirqs.CPU287.TIM=
ER
     25916 =C2=B1  3%      +3.4%      26788 =C2=B1  4%  softirqs.CPU3.SCHED
    109550 =C2=B1  6%      +7.1%     117288 =C2=B1  7%  softirqs.CPU51.TIMER
    109353 =C2=B1  4%      +7.6%     117652 =C2=B1  6%  softirqs.CPU61.TIMER
    109018 =C2=B1  3%      +7.4%     117069 =C2=B1  6%  softirqs.CPU66.TIMER
    111093 =C2=B1  2%      +8.6%     120616 =C2=B1  8%  softirqs.CPU67.TIMER
    108126 =C2=B1  3%      +7.5%     116246 =C2=B1  6%  softirqs.CPU69.TIMER
    109627 =C2=B1  4%      +8.4%     118799 =C2=B1  6%  softirqs.CPU70.TIMER
    106067           +11.0%     117778 =C2=B1  7%  softirqs.CPU71.TIMER
    109417 =C2=B1  4%      +6.5%     116523 =C2=B1  6%  softirqs.CPU77.TIMER
    112795            +8.9%     122821 =C2=B1  7%  softirqs.CPU83.TIMER
    110905 =C2=B1  4%      +5.5%     117001 =C2=B1  5%  softirqs.CPU89.TIMER
     26108            +6.3%      27763 =C2=B1  5%  softirqs.CPU92.SCHED
      1.41 =C2=B1 11%      +0.2        1.58        perf-profile.calltrace.c=
ycles-pp.perf_event_task_tick.scheduler_tick.update_process_times.tick_sche=
d_handle.tick_sched_timer
      0.93 =C2=B1 18%      +0.2        1.17 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.ktime_get.clockevents_program_event.hrtimer_interrupt.smp_api=
c_timer_interrupt.apic_timer_interrupt
      1.61 =C2=B1 12%      +0.3        1.89 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.clockevents_program_event.hrtimer_interrupt.smp_apic_timer_in=
terrupt.apic_timer_interrupt.cpuidle_enter_state
     93.17            +0.6       93.78        perf-profile.calltrace.cycles=
-pp.cpu_startup_entry.start_secondary.secondary_startup_64
     93.17            +0.6       93.78        perf-profile.calltrace.cycles=
-pp.start_secondary.secondary_startup_64
     93.05            +0.6       93.66        perf-profile.calltrace.cycles=
-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
      7.79 =C2=B1  6%      +0.7        8.52 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrt=
imer_run_queues.hrtimer_interrupt
      8.40 =C2=B1  7%      +0.8        9.25 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtim=
er_interrupt.smp_apic_timer_interrupt
      3.12            -0.3        2.84 =C2=B1  6%  perf-profile.children.cy=
cles-pp.sched_clock_cpu
      1.03 =C2=B1 15%      -0.2        0.84 =C2=B1  4%  perf-profile.childr=
en.cycles-pp._raw_spin_lock
      0.68 =C2=B1 11%      -0.1        0.62        perf-profile.children.cy=
cles-pp.update_sd_lb_stats
      0.06 =C2=B1  6%      -0.0        0.03 =C2=B1100%  perf-profile.childr=
en.cycles-pp.__strcspn_sse42
      0.06 =C2=B1  6%      -0.0        0.03 =C2=B1100%  perf-profile.childr=
en.cycles-pp.generic_start_main
      0.06 =C2=B1  6%      -0.0        0.03 =C2=B1100%  perf-profile.childr=
en.cycles-pp.main
      0.06 =C2=B1  6%      -0.0        0.03 =C2=B1100%  perf-profile.childr=
en.cycles-pp.run_builtin
      0.13 =C2=B1  9%      -0.0        0.10 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.__intel_pmu_enable_all
      0.12 =C2=B1 13%      +0.0        0.16 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.retint_kernel
      0.00            +0.1        0.06 =C2=B1  9%  perf-profile.children.cy=
cles-pp.tick_nohz_idle_retain_tick
      1.68 =C2=B1 12%      +0.3        1.95 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.clockevents_program_event
     93.17            +0.6       93.78        perf-profile.children.cycles-=
pp.start_secondary
      7.99 =C2=B1  6%      +0.7        8.64 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.update_process_times
      8.59 =C2=B1  7%      +0.8        9.38 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.tick_sched_handle
      3.99 =C2=B1  8%      -0.4        3.54 =C2=B1  4%  perf-profile.self.c=
ycles-pp.__hrtimer_run_queues
      0.99 =C2=B1 15%      -0.2        0.81 =C2=B1  3%  perf-profile.self.c=
ycles-pp._raw_spin_lock
      0.55 =C2=B1  3%      -0.1        0.47 =C2=B1  5%  perf-profile.self.c=
ycles-pp.tick_nohz_next_event
      0.09 =C2=B1  5%      -0.0        0.07 =C2=B1  7%  perf-profile.self.c=
ycles-pp.irq_work_run_list
      0.16 =C2=B1  6%      +0.0        0.19        perf-profile.self.cycles=
-pp.lapic_next_deadline
      0.12 =C2=B1 15%      +0.0        0.15 =C2=B1  6%  perf-profile.self.c=
ycles-pp.retint_kernel
      1198 =C2=B1 11%     -60.8%     470.50 =C2=B1 28%  interrupts.32:IR-PC=
I-MSI.2097155-edge.eth0-TxRx-2
    620.25 =C2=B1 12%     -43.2%     352.00 =C2=B1 25%  interrupts.33:IR-PC=
I-MSI.2097156-edge.eth0-TxRx-3
      1083 =C2=B1 37%     +71.1%       1853 =C2=B1 15%  interrupts.CPU112.N=
MI:Non-maskable_interrupts
      1083 =C2=B1 37%     +71.1%       1853 =C2=B1 15%  interrupts.CPU112.P=
MI:Performance_monitoring_interrupts
     62.50 =C2=B1 82%     -86.4%       8.50 =C2=B1  5%  interrupts.CPU112.T=
LB:TLB_shootdowns
      1137 =C2=B1 28%     +59.1%       1809 =C2=B1 14%  interrupts.CPU114.N=
MI:Non-maskable_interrupts
      1137 =C2=B1 28%     +59.1%       1809 =C2=B1 14%  interrupts.CPU114.P=
MI:Performance_monitoring_interrupts
      1137 =C2=B1 28%     +63.1%       1855 =C2=B1 13%  interrupts.CPU115.N=
MI:Non-maskable_interrupts
      1137 =C2=B1 28%     +63.1%       1855 =C2=B1 13%  interrupts.CPU115.P=
MI:Performance_monitoring_interrupts
      1196 =C2=B1 31%     +57.8%       1888 =C2=B1 16%  interrupts.CPU116.N=
MI:Non-maskable_interrupts
      1196 =C2=B1 31%     +57.8%       1888 =C2=B1 16%  interrupts.CPU116.P=
MI:Performance_monitoring_interrupts
      1198 =C2=B1 11%     -60.8%     470.50 =C2=B1 28%  interrupts.CPU12.32=
:IR-PCI-MSI.2097155-edge.eth0-TxRx-2
      1375 =C2=B1 23%     +43.4%       1972 =C2=B1 16%  interrupts.CPU120.N=
MI:Non-maskable_interrupts
      1375 =C2=B1 23%     +43.4%       1972 =C2=B1 16%  interrupts.CPU120.P=
MI:Performance_monitoring_interrupts
      1377 =C2=B1 24%     +45.2%       2000 =C2=B1 15%  interrupts.CPU121.N=
MI:Non-maskable_interrupts
      1377 =C2=B1 24%     +45.2%       2000 =C2=B1 15%  interrupts.CPU121.P=
MI:Performance_monitoring_interrupts
    799.75 =C2=B1  9%     +25.7%       1005 =C2=B1  6%  interrupts.CPU123.R=
ES:Rescheduling_interrupts
    898.50 =C2=B1 17%     -25.9%     665.50 =C2=B1  9%  interrupts.CPU129.R=
ES:Rescheduling_interrupts
    620.25 =C2=B1 12%     -43.2%     352.00 =C2=B1 25%  interrupts.CPU13.33=
:IR-PCI-MSI.2097156-edge.eth0-TxRx-3
    875.75 =C2=B1  7%     -28.5%     626.50 =C2=B1  9%  interrupts.CPU13.RE=
S:Rescheduling_interrupts
      1219 =C2=B1 40%     +58.7%       1934 =C2=B1 12%  interrupts.CPU131.N=
MI:Non-maskable_interrupts
      1219 =C2=B1 40%     +58.7%       1934 =C2=B1 12%  interrupts.CPU131.P=
MI:Performance_monitoring_interrupts
      1011 =C2=B1 45%     +93.8%       1960 =C2=B1 12%  interrupts.CPU132.N=
MI:Non-maskable_interrupts
      1011 =C2=B1 45%     +93.8%       1960 =C2=B1 12%  interrupts.CPU132.P=
MI:Performance_monitoring_interrupts
      1186 =C2=B1 34%     +51.9%       1802 =C2=B1 11%  interrupts.CPU133.N=
MI:Non-maskable_interrupts
      1186 =C2=B1 34%     +51.9%       1802 =C2=B1 11%  interrupts.CPU133.P=
MI:Performance_monitoring_interrupts
      1158 =C2=B1 33%     +58.5%       1836 =C2=B1 18%  interrupts.CPU134.N=
MI:Non-maskable_interrupts
      1158 =C2=B1 33%     +58.5%       1836 =C2=B1 18%  interrupts.CPU134.P=
MI:Performance_monitoring_interrupts
      1858 =C2=B1 64%     -66.4%     625.00 =C2=B1 23%  interrupts.CPU134.R=
ES:Rescheduling_interrupts
      1290 =C2=B1 27%     +39.1%       1794 =C2=B1 15%  interrupts.CPU135.N=
MI:Non-maskable_interrupts
      1290 =C2=B1 27%     +39.1%       1794 =C2=B1 15%  interrupts.CPU135.P=
MI:Performance_monitoring_interrupts
      1399 =C2=B1 71%     -57.9%     589.50 =C2=B1  3%  interrupts.CPU135.R=
ES:Rescheduling_interrupts
      1173 =C2=B1 35%     +58.8%       1863 =C2=B1 16%  interrupts.CPU136.N=
MI:Non-maskable_interrupts
      1173 =C2=B1 35%     +58.8%       1863 =C2=B1 16%  interrupts.CPU136.P=
MI:Performance_monitoring_interrupts
      1342 =C2=B1 26%     +44.2%       1936 =C2=B1 17%  interrupts.CPU137.N=
MI:Non-maskable_interrupts
      1342 =C2=B1 26%     +44.2%       1936 =C2=B1 17%  interrupts.CPU137.P=
MI:Performance_monitoring_interrupts
    885.50 =C2=B1 14%     -30.3%     617.50 =C2=B1  9%  interrupts.CPU137.R=
ES:Rescheduling_interrupts
    645.00 =C2=B1 12%     +19.1%     768.00 =C2=B1  6%  interrupts.CPU14.RE=
S:Rescheduling_interrupts
    861.75 =C2=B1  9%     -31.5%     590.50 =C2=B1  4%  interrupts.CPU140.R=
ES:Rescheduling_interrupts
      1142 =C2=B1 28%     +66.7%       1904 =C2=B1 14%  interrupts.CPU144.N=
MI:Non-maskable_interrupts
      1142 =C2=B1 28%     +66.7%       1904 =C2=B1 14%  interrupts.CPU144.P=
MI:Performance_monitoring_interrupts
      1386 =C2=B1 27%     +39.3%       1931 =C2=B1 13%  interrupts.CPU147.N=
MI:Non-maskable_interrupts
      1386 =C2=B1 27%     +39.3%       1931 =C2=B1 13%  interrupts.CPU147.P=
MI:Performance_monitoring_interrupts
      1392 =C2=B1 25%     +42.2%       1981 =C2=B1 14%  interrupts.CPU148.N=
MI:Non-maskable_interrupts
      1392 =C2=B1 25%     +42.2%       1981 =C2=B1 14%  interrupts.CPU148.P=
MI:Performance_monitoring_interrupts
      1383 =C2=B1 24%     +34.2%       1856 =C2=B1 11%  interrupts.CPU149.N=
MI:Non-maskable_interrupts
      1383 =C2=B1 24%     +34.2%       1856 =C2=B1 11%  interrupts.CPU149.P=
MI:Performance_monitoring_interrupts
      1365 =C2=B1 21%     +36.8%       1868 =C2=B1 14%  interrupts.CPU150.N=
MI:Non-maskable_interrupts
      1365 =C2=B1 21%     +36.8%       1868 =C2=B1 14%  interrupts.CPU150.P=
MI:Performance_monitoring_interrupts
      1386 =C2=B1 25%     +29.3%       1792 =C2=B1 11%  interrupts.CPU151.N=
MI:Non-maskable_interrupts
      1386 =C2=B1 25%     +29.3%       1792 =C2=B1 11%  interrupts.CPU151.P=
MI:Performance_monitoring_interrupts
      1381 =C2=B1 21%     +36.9%       1891 =C2=B1 13%  interrupts.CPU152.N=
MI:Non-maskable_interrupts
      1381 =C2=B1 21%     +36.9%       1891 =C2=B1 13%  interrupts.CPU152.P=
MI:Performance_monitoring_interrupts
      1348 =C2=B1 24%     +38.9%       1872 =C2=B1 14%  interrupts.CPU153.N=
MI:Non-maskable_interrupts
      1348 =C2=B1 24%     +38.9%       1872 =C2=B1 14%  interrupts.CPU153.P=
MI:Performance_monitoring_interrupts
      1435 =C2=B1 27%     +39.5%       2003 =C2=B1 13%  interrupts.CPU157.N=
MI:Non-maskable_interrupts
      1435 =C2=B1 27%     +39.5%       2003 =C2=B1 13%  interrupts.CPU157.P=
MI:Performance_monitoring_interrupts
     32.75 =C2=B1 64%    +193.1%      96.00 =C2=B1 23%  interrupts.CPU158.T=
LB:TLB_shootdowns
      1297 =C2=B1 26%     +36.2%       1766 =C2=B1  8%  interrupts.CPU159.N=
MI:Non-maskable_interrupts
      1297 =C2=B1 26%     +36.2%       1766 =C2=B1  8%  interrupts.CPU159.P=
MI:Performance_monitoring_interrupts
    920.00 =C2=B1  8%     -36.1%     587.50 =C2=B1 17%  interrupts.CPU159.R=
ES:Rescheduling_interrupts
      1329 =C2=B1 25%     +39.4%       1853 =C2=B1 18%  interrupts.CPU160.N=
MI:Non-maskable_interrupts
      1329 =C2=B1 25%     +39.4%       1853 =C2=B1 18%  interrupts.CPU160.P=
MI:Performance_monitoring_interrupts
      1377 =C2=B1 26%     +37.2%       1889 =C2=B1 14%  interrupts.CPU161.N=
MI:Non-maskable_interrupts
      1377 =C2=B1 26%     +37.2%       1889 =C2=B1 14%  interrupts.CPU161.P=
MI:Performance_monitoring_interrupts
      1397 =C2=B1 20%     +36.8%       1910 =C2=B1 13%  interrupts.CPU162.N=
MI:Non-maskable_interrupts
      1397 =C2=B1 20%     +36.8%       1910 =C2=B1 13%  interrupts.CPU162.P=
MI:Performance_monitoring_interrupts
      1350 =C2=B1 23%     +33.0%       1796 =C2=B1 11%  interrupts.CPU163.N=
MI:Non-maskable_interrupts
      1350 =C2=B1 23%     +33.0%       1796 =C2=B1 11%  interrupts.CPU163.P=
MI:Performance_monitoring_interrupts
      1408 =C2=B1 26%     +43.0%       2013 =C2=B1 18%  interrupts.CPU164.N=
MI:Non-maskable_interrupts
      1408 =C2=B1 26%     +43.0%       2013 =C2=B1 18%  interrupts.CPU164.P=
MI:Performance_monitoring_interrupts
    695.25 =C2=B1 21%     +21.2%     842.50 =C2=B1  9%  interrupts.CPU17.RE=
S:Rescheduling_interrupts
      1396 =C2=B1 25%     +30.5%       1823 =C2=B1  7%  interrupts.CPU184.N=
MI:Non-maskable_interrupts
      1396 =C2=B1 25%     +30.5%       1823 =C2=B1  7%  interrupts.CPU184.P=
MI:Performance_monitoring_interrupts
      1354 =C2=B1 25%     +36.8%       1852 =C2=B1  8%  interrupts.CPU185.N=
MI:Non-maskable_interrupts
      1354 =C2=B1 25%     +36.8%       1852 =C2=B1  8%  interrupts.CPU185.P=
MI:Performance_monitoring_interrupts
      1169 =C2=B1 27%     +62.3%       1897 =C2=B1 17%  interrupts.CPU190.N=
MI:Non-maskable_interrupts
      1169 =C2=B1 27%     +62.3%       1897 =C2=B1 17%  interrupts.CPU190.P=
MI:Performance_monitoring_interrupts
      1059 =C2=B1 21%     -27.3%     770.50        interrupts.CPU190.RES:Re=
scheduling_interrupts
      1124 =C2=B1 29%     +64.0%       1843 =C2=B1 17%  interrupts.CPU191.N=
MI:Non-maskable_interrupts
      1124 =C2=B1 29%     +64.0%       1843 =C2=B1 17%  interrupts.CPU191.P=
MI:Performance_monitoring_interrupts
      1159 =C2=B1 29%     +71.5%       1988 =C2=B1 17%  interrupts.CPU192.N=
MI:Non-maskable_interrupts
      1159 =C2=B1 29%     +71.5%       1988 =C2=B1 17%  interrupts.CPU192.P=
MI:Performance_monitoring_interrupts
      1223 =C2=B1 30%     +57.9%       1931 =C2=B1 12%  interrupts.CPU194.N=
MI:Non-maskable_interrupts
      1223 =C2=B1 30%     +57.9%       1931 =C2=B1 12%  interrupts.CPU194.P=
MI:Performance_monitoring_interrupts
      1234 =C2=B1 32%     +53.0%       1888 =C2=B1 11%  interrupts.CPU195.N=
MI:Non-maskable_interrupts
      1234 =C2=B1 32%     +53.0%       1888 =C2=B1 11%  interrupts.CPU195.P=
MI:Performance_monitoring_interrupts
      1173 =C2=B1 25%     +68.7%       1980 =C2=B1 11%  interrupts.CPU196.N=
MI:Non-maskable_interrupts
      1173 =C2=B1 25%     +68.7%       1980 =C2=B1 11%  interrupts.CPU196.P=
MI:Performance_monitoring_interrupts
    685.25 =C2=B1 10%     +19.0%     815.50 =C2=B1 16%  interrupts.CPU2.NMI=
:Non-maskable_interrupts
    685.25 =C2=B1 10%     +19.0%     815.50 =C2=B1 16%  interrupts.CPU2.PMI=
:Performance_monitoring_interrupts
     79.75 =C2=B1 56%     -67.4%      26.00 =C2=B1  7%  interrupts.CPU208.T=
LB:TLB_shootdowns
    786.00 =C2=B1  9%     +90.1%       1494 =C2=B1 47%  interrupts.CPU220.N=
MI:Non-maskable_interrupts
    786.00 =C2=B1  9%     +90.1%       1494 =C2=B1 47%  interrupts.CPU220.P=
MI:Performance_monitoring_interrupts
    749.25 =C2=B1  4%    +100.5%       1502 =C2=B1 45%  interrupts.CPU221.N=
MI:Non-maskable_interrupts
    749.25 =C2=B1  4%    +100.5%       1502 =C2=B1 45%  interrupts.CPU221.P=
MI:Performance_monitoring_interrupts
    749.75 =C2=B1  3%    +149.4%       1870 =C2=B1 18%  interrupts.CPU223.N=
MI:Non-maskable_interrupts
    749.75 =C2=B1  3%    +149.4%       1870 =C2=B1 18%  interrupts.CPU223.P=
MI:Performance_monitoring_interrupts
    706.25 =C2=B1  3%    +156.1%       1809 =C2=B1 19%  interrupts.CPU224.N=
MI:Non-maskable_interrupts
    706.25 =C2=B1  3%    +156.1%       1809 =C2=B1 19%  interrupts.CPU224.P=
MI:Performance_monitoring_interrupts
     22.00 =C2=B1 68%    +256.8%      78.50 =C2=B1 40%  interrupts.CPU227.T=
LB:TLB_shootdowns
      1002 =C2=B1 37%     +45.5%       1458 =C2=B1 43%  interrupts.CPU231.N=
MI:Non-maskable_interrupts
      1002 =C2=B1 37%     +45.5%       1458 =C2=B1 43%  interrupts.CPU231.P=
MI:Performance_monitoring_interrupts
    977.50 =C2=B1 35%     +55.0%       1515 =C2=B1 46%  interrupts.CPU233.N=
MI:Non-maskable_interrupts
    977.50 =C2=B1 35%     +55.0%       1515 =C2=B1 46%  interrupts.CPU233.P=
MI:Performance_monitoring_interrupts
    970.00 =C2=B1 34%     +57.6%       1529 =C2=B1 45%  interrupts.CPU239.N=
MI:Non-maskable_interrupts
    970.00 =C2=B1 34%     +57.6%       1529 =C2=B1 45%  interrupts.CPU239.P=
MI:Performance_monitoring_interrupts
      1999 =C2=B1100%     -67.0%     659.00        interrupts.CPU239.RES:Re=
scheduling_interrupts
    979.75 =C2=B1 35%     +53.1%       1500 =C2=B1 43%  interrupts.CPU240.N=
MI:Non-maskable_interrupts
    979.75 =C2=B1 35%     +53.1%       1500 =C2=B1 43%  interrupts.CPU240.P=
MI:Performance_monitoring_interrupts
      1019 =C2=B1 38%     +46.7%       1495 =C2=B1 43%  interrupts.CPU241.N=
MI:Non-maskable_interrupts
      1019 =C2=B1 38%     +46.7%       1495 =C2=B1 43%  interrupts.CPU241.P=
MI:Performance_monitoring_interrupts
    687.75 =C2=B1 19%     +51.1%       1039 =C2=B1  3%  interrupts.CPU241.R=
ES:Rescheduling_interrupts
    872.00 =C2=B1 11%     +61.3%       1406 =C2=B1 19%  interrupts.CPU243.R=
ES:Rescheduling_interrupts
    763.00 =C2=B1  7%     -12.1%     670.50        interrupts.CPU25.RES:Res=
cheduling_interrupts
    933.25 =C2=B1 33%     +53.0%       1428 =C2=B1 43%  interrupts.CPU253.N=
MI:Non-maskable_interrupts
    933.25 =C2=B1 33%     +53.0%       1428 =C2=B1 43%  interrupts.CPU253.P=
MI:Performance_monitoring_interrupts
    924.75 =C2=B1 35%     +57.1%       1453 =C2=B1 46%  interrupts.CPU256.N=
MI:Non-maskable_interrupts
    924.75 =C2=B1 35%     +57.1%       1453 =C2=B1 46%  interrupts.CPU256.P=
MI:Performance_monitoring_interrupts
    938.50 =C2=B1 36%     +54.5%       1450 =C2=B1 44%  interrupts.CPU257.N=
MI:Non-maskable_interrupts
    938.50 =C2=B1 36%     +54.5%       1450 =C2=B1 44%  interrupts.CPU257.P=
MI:Performance_monitoring_interrupts
      1122 =C2=B1 29%     -43.5%     634.00 =C2=B1 13%  interrupts.CPU258.R=
ES:Rescheduling_interrupts
      1225 =C2=B1 27%     -40.6%     727.50 =C2=B1  5%  interrupts.CPU259.R=
ES:Rescheduling_interrupts
     41.75 =C2=B1 27%     +79.6%      75.00 =C2=B1 33%  interrupts.CPU261.T=
LB:TLB_shootdowns
    725.50 =C2=B1  8%     -24.5%     548.00 =C2=B1 10%  interrupts.CPU264.R=
ES:Rescheduling_interrupts
    741.25 =C2=B1  7%    +103.8%       1511 =C2=B1 47%  interrupts.CPU268.N=
MI:Non-maskable_interrupts
    741.25 =C2=B1  7%    +103.8%       1511 =C2=B1 47%  interrupts.CPU268.P=
MI:Performance_monitoring_interrupts
    683.25 =C2=B1  7%    +113.6%       1459 =C2=B1 44%  interrupts.CPU269.N=
MI:Non-maskable_interrupts
    683.25 =C2=B1  7%    +113.6%       1459 =C2=B1 44%  interrupts.CPU269.P=
MI:Performance_monitoring_interrupts
    793.00 =C2=B1 17%     +56.6%       1242 =C2=B1 26%  interrupts.CPU271.R=
ES:Rescheduling_interrupts
    690.50 =C2=B1  8%     +97.6%       1364 =C2=B1 44%  interrupts.CPU274.N=
MI:Non-maskable_interrupts
    690.50 =C2=B1  8%     +97.6%       1364 =C2=B1 44%  interrupts.CPU274.P=
MI:Performance_monitoring_interrupts
    690.50 =C2=B1  9%     +95.7%       1351 =C2=B1 46%  interrupts.CPU276.N=
MI:Non-maskable_interrupts
    690.50 =C2=B1  9%     +95.7%       1351 =C2=B1 46%  interrupts.CPU276.P=
MI:Performance_monitoring_interrupts
    888.75 =C2=B1 22%     -26.6%     652.00 =C2=B1  2%  interrupts.CPU278.R=
ES:Rescheduling_interrupts
    944.25 =C2=B1 43%     +44.2%       1362 =C2=B1 45%  interrupts.CPU279.N=
MI:Non-maskable_interrupts
    944.25 =C2=B1 43%     +44.2%       1362 =C2=B1 45%  interrupts.CPU279.P=
MI:Performance_monitoring_interrupts
    594.00 =C2=B1 13%     +18.5%     704.00 =C2=B1  3%  interrupts.CPU28.RE=
S:Rescheduling_interrupts
    812.75 =C2=B1  9%     -34.2%     534.50 =C2=B1 25%  interrupts.CPU280.R=
ES:Rescheduling_interrupts
    724.75 =C2=B1  7%     -16.3%     606.50 =C2=B1  4%  interrupts.CPU281.R=
ES:Rescheduling_interrupts
    660.50 =C2=B1  8%     +29.6%     856.00 =C2=B1 17%  interrupts.CPU3.NMI=
:Non-maskable_interrupts
    660.50 =C2=B1  8%     +29.6%     856.00 =C2=B1 17%  interrupts.CPU3.PMI=
:Performance_monitoring_interrupts
    697.75 =C2=B1 15%     +64.2%       1145 =C2=B1 12%  interrupts.CPU30.NM=
I:Non-maskable_interrupts
    697.75 =C2=B1 15%     +64.2%       1145 =C2=B1 12%  interrupts.CPU30.PM=
I:Performance_monitoring_interrupts
    694.25 =C2=B1  8%     +72.5%       1197 =C2=B1 17%  interrupts.CPU31.NM=
I:Non-maskable_interrupts
    694.25 =C2=B1  8%     +72.5%       1197 =C2=B1 17%  interrupts.CPU31.PM=
I:Performance_monitoring_interrupts
    643.25 =C2=B1 14%     +33.2%     857.00 =C2=B1 19%  interrupts.CPU32.NM=
I:Non-maskable_interrupts
    643.25 =C2=B1 14%     +33.2%     857.00 =C2=B1 19%  interrupts.CPU32.PM=
I:Performance_monitoring_interrupts
    861.75 =C2=B1  7%     -17.3%     712.50        interrupts.CPU32.RES:Res=
cheduling_interrupts
    633.75 =C2=B1 14%     +37.3%     870.00 =C2=B1 19%  interrupts.CPU33.NM=
I:Non-maskable_interrupts
    633.75 =C2=B1 14%     +37.3%     870.00 =C2=B1 19%  interrupts.CPU33.PM=
I:Performance_monitoring_interrupts
    642.75 =C2=B1  9%     +34.3%     863.00 =C2=B1 18%  interrupts.CPU34.NM=
I:Non-maskable_interrupts
    642.75 =C2=B1  9%     +34.3%     863.00 =C2=B1 18%  interrupts.CPU34.PM=
I:Performance_monitoring_interrupts
    649.00 =C2=B1  5%     +31.9%     856.00 =C2=B1 20%  interrupts.CPU35.NM=
I:Non-maskable_interrupts
    649.00 =C2=B1  5%     +31.9%     856.00 =C2=B1 20%  interrupts.CPU35.PM=
I:Performance_monitoring_interrupts
    644.75 =C2=B1  7%     +37.4%     886.00 =C2=B1 19%  interrupts.CPU38.NM=
I:Non-maskable_interrupts
    644.75 =C2=B1  7%     +37.4%     886.00 =C2=B1 19%  interrupts.CPU38.PM=
I:Performance_monitoring_interrupts
    667.25 =C2=B1  6%     +30.5%     870.50 =C2=B1 21%  interrupts.CPU39.NM=
I:Non-maskable_interrupts
    667.25 =C2=B1  6%     +30.5%     870.50 =C2=B1 21%  interrupts.CPU39.PM=
I:Performance_monitoring_interrupts
    673.75           +26.3%     851.00 =C2=B1 15%  interrupts.CPU4.NMI:Non-=
maskable_interrupts
    673.75           +26.3%     851.00 =C2=B1 15%  interrupts.CPU4.PMI:Perf=
ormance_monitoring_interrupts
    664.50 =C2=B1 10%     +28.7%     855.00 =C2=B1 17%  interrupts.CPU41.NM=
I:Non-maskable_interrupts
    664.50 =C2=B1 10%     +28.7%     855.00 =C2=B1 17%  interrupts.CPU41.PM=
I:Performance_monitoring_interrupts
    697.75 =C2=B1 16%     +31.4%     917.00 =C2=B1 12%  interrupts.CPU42.RE=
S:Rescheduling_interrupts
    775.00 =C2=B1  5%     -16.1%     650.50 =C2=B1  2%  interrupts.CPU45.RE=
S:Rescheduling_interrupts
    690.75 =C2=B1  4%     +34.4%     928.50 =C2=B1 20%  interrupts.CPU48.NM=
I:Non-maskable_interrupts
    690.75 =C2=B1  4%     +34.4%     928.50 =C2=B1 20%  interrupts.CPU48.PM=
I:Performance_monitoring_interrupts
    761.50 =C2=B1  5%     +27.1%     967.50 =C2=B1 20%  interrupts.CPU49.NM=
I:Non-maskable_interrupts
    761.50 =C2=B1  5%     +27.1%     967.50 =C2=B1 20%  interrupts.CPU49.PM=
I:Performance_monitoring_interrupts
    643.50 =C2=B1  3%     +32.6%     853.00 =C2=B1 22%  interrupts.CPU5.NMI=
:Non-maskable_interrupts
    643.50 =C2=B1  3%     +32.6%     853.00 =C2=B1 22%  interrupts.CPU5.PMI=
:Performance_monitoring_interrupts
    835.75 =C2=B1 14%    +310.5%       3430 =C2=B1 67%  interrupts.CPU55.RE=
S:Rescheduling_interrupts
    636.75 =C2=B1  5%     +34.1%     854.00 =C2=B1 19%  interrupts.CPU6.NMI=
:Non-maskable_interrupts
    636.75 =C2=B1  5%     +34.1%     854.00 =C2=B1 19%  interrupts.CPU6.PMI=
:Performance_monitoring_interrupts
    857.75 =C2=B1 30%     +45.2%       1245 =C2=B1 15%  interrupts.CPU61.NM=
I:Non-maskable_interrupts
    857.75 =C2=B1 30%     +45.2%       1245 =C2=B1 15%  interrupts.CPU61.PM=
I:Performance_monitoring_interrupts
      1333 =C2=B1 49%     -46.3%     716.50        interrupts.CPU62.RES:Res=
cheduling_interrupts
    836.50 =C2=B1 32%     +43.5%       1200 =C2=B1  8%  interrupts.CPU63.NM=
I:Non-maskable_interrupts
    836.50 =C2=B1 32%     +43.5%       1200 =C2=B1  8%  interrupts.CPU63.PM=
I:Performance_monitoring_interrupts
      1363 =C2=B1 39%     -47.1%     721.00 =C2=B1  6%  interrupts.CPU63.RE=
S:Rescheduling_interrupts
    842.00 =C2=B1 34%     +46.6%       1234 =C2=B1 10%  interrupts.CPU65.NM=
I:Non-maskable_interrupts
    842.00 =C2=B1 34%     +46.6%       1234 =C2=B1 10%  interrupts.CPU65.PM=
I:Performance_monitoring_interrupts
    813.75 =C2=B1 14%     -22.6%     629.50        interrupts.CPU66.RES:Res=
cheduling_interrupts
     65.25 =C2=B1 71%     -72.4%      18.00 =C2=B1 38%  interrupts.CPU66.TL=
B:TLB_shootdowns
    646.25 =C2=B1  4%     +28.7%     831.50 =C2=B1 17%  interrupts.CPU7.NMI=
:Non-maskable_interrupts
    646.25 =C2=B1  4%     +28.7%     831.50 =C2=B1 17%  interrupts.CPU7.PMI=
:Performance_monitoring_interrupts
    816.25 =C2=B1 13%     -23.6%     623.50 =C2=B1  4%  interrupts.CPU72.RE=
S:Rescheduling_interrupts
    963.25 =C2=B1 28%     -33.1%     644.00 =C2=B1  9%  interrupts.CPU76.RE=
S:Rescheduling_interrupts
     59.50 =C2=B1 53%     -65.5%      20.50 =C2=B1 31%  interrupts.CPU77.TL=
B:TLB_shootdowns
    856.00 =C2=B1 10%     -24.7%     644.50 =C2=B1  9%  interrupts.CPU78.RE=
S:Rescheduling_interrupts
    639.50 =C2=B1  5%     +31.4%     840.50 =C2=B1 19%  interrupts.CPU8.NMI=
:Non-maskable_interrupts
    639.50 =C2=B1  5%     +31.4%     840.50 =C2=B1 19%  interrupts.CPU8.PMI=
:Performance_monitoring_interrupts
    771.00 =C2=B1  4%     +91.1%       1473 =C2=B1 43%  interrupts.CPU80.NM=
I:Non-maskable_interrupts
    771.00 =C2=B1  4%     +91.1%       1473 =C2=B1 43%  interrupts.CPU80.PM=
I:Performance_monitoring_interrupts
    767.50 =C2=B1  6%     +20.7%     926.50 =C2=B1 11%  interrupts.CPU81.NM=
I:Non-maskable_interrupts
    767.50 =C2=B1  6%     +20.7%     926.50 =C2=B1 11%  interrupts.CPU81.PM=
I:Performance_monitoring_interrupts
    779.25 =C2=B1  4%     +14.9%     895.00 =C2=B1 12%  interrupts.CPU83.NM=
I:Non-maskable_interrupts
    779.25 =C2=B1  4%     +14.9%     895.00 =C2=B1 12%  interrupts.CPU83.PM=
I:Performance_monitoring_interrupts
    114.25 =C2=B1 96%     -83.8%      18.50 =C2=B1  2%  interrupts.CPU84.TL=
B:TLB_shootdowns
    915.75 =C2=B1 24%     +48.9%       1363 =C2=B1 21%  interrupts.CPU87.NM=
I:Non-maskable_interrupts
    915.75 =C2=B1 24%     +48.9%       1363 =C2=B1 21%  interrupts.CPU87.PM=
I:Performance_monitoring_interrupts
    720.50 =C2=B1 19%     +17.8%     849.00 =C2=B1  4%  interrupts.CPU87.RE=
S:Rescheduling_interrupts
    952.25 =C2=B1 30%     +30.7%       1245 =C2=B1 22%  interrupts.CPU88.NM=
I:Non-maskable_interrupts
    952.25 =C2=B1 30%     +30.7%       1245 =C2=B1 22%  interrupts.CPU88.PM=
I:Performance_monitoring_interrupts
    947.25 =C2=B1 28%     +33.5%       1264 =C2=B1 20%  interrupts.CPU89.NM=
I:Non-maskable_interrupts
    947.25 =C2=B1 28%     +33.5%       1264 =C2=B1 20%  interrupts.CPU89.PM=
I:Performance_monitoring_interrupts
    647.75 =C2=B1  7%     +28.5%     832.50 =C2=B1 19%  interrupts.CPU9.NMI=
:Non-maskable_interrupts
    647.75 =C2=B1  7%     +28.5%     832.50 =C2=B1 19%  interrupts.CPU9.PMI=
:Performance_monitoring_interrupts
    948.50 =C2=B1 28%     +37.0%       1299 =C2=B1 21%  interrupts.CPU90.NM=
I:Non-maskable_interrupts
    948.50 =C2=B1 28%     +37.0%       1299 =C2=B1 21%  interrupts.CPU90.PM=
I:Performance_monitoring_interrupts
    933.00 =C2=B1 31%     +39.4%       1301 =C2=B1 22%  interrupts.CPU91.NM=
I:Non-maskable_interrupts
    933.00 =C2=B1 31%     +39.4%       1301 =C2=B1 22%  interrupts.CPU91.PM=
I:Performance_monitoring_interrupts
    914.75 =C2=B1 26%    +103.3%       1859 =C2=B1 21%  interrupts.CPU92.NM=
I:Non-maskable_interrupts
    914.75 =C2=B1 26%    +103.3%       1859 =C2=B1 21%  interrupts.CPU92.PM=
I:Performance_monitoring_interrupts
    927.00 =C2=B1 30%    +105.9%       1908 =C2=B1 21%  interrupts.CPU93.NM=
I:Non-maskable_interrupts
    927.00 =C2=B1 30%    +105.9%       1908 =C2=B1 21%  interrupts.CPU93.PM=
I:Performance_monitoring_interrupts
      1009 =C2=B1 29%     +91.5%       1933 =C2=B1 21%  interrupts.CPU94.NM=
I:Non-maskable_interrupts
      1009 =C2=B1 29%     +91.5%       1933 =C2=B1 21%  interrupts.CPU94.PM=
I:Performance_monitoring_interrupts
      1114 =C2=B1 30%     +68.9%       1882 =C2=B1 18%  interrupts.CPU95.NM=
I:Non-maskable_interrupts
      1114 =C2=B1 30%     +68.9%       1882 =C2=B1 18%  interrupts.CPU95.PM=
I:Performance_monitoring_interrupts
      1124 =C2=B1 31%     +70.6%       1918 =C2=B1 16%  interrupts.CPU96.NM=
I:Non-maskable_interrupts
      1124 =C2=B1 31%     +70.6%       1918 =C2=B1 16%  interrupts.CPU96.PM=
I:Performance_monitoring_interrupts
      1133 =C2=B1 36%     +66.8%       1889 =C2=B1 13%  interrupts.CPU97.NM=
I:Non-maskable_interrupts
      1133 =C2=B1 36%     +66.8%       1889 =C2=B1 13%  interrupts.CPU97.PM=
I:Performance_monitoring_interrupts
      3962 =C2=B1138%     -85.8%     561.50 =C2=B1 24%  interrupts.CPU99.RE=
S:Rescheduling_interrupts



***************************************************************************=
************************
lkp-hsw-ep2: 72 threads Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GHz with 256G=
 memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/te=
stcase/ucode:
  gcc-7/performance/x86_64-rhel-7.6/1600%/debian-x86_64-2019-05-14.cgz/300s=
/lkp-hsw-ep2/alltests/reaim/0x43

commit: =

  4f23dbc1e6 ("locking/rwsem: Implement lock handoff to prevent lock starva=
tion")
  00f3c5a3df ("locking/rwsem: Always release wait_lock before waking up tas=
ks")

4f23dbc1e657951e 00f3c5a3df2c1e3dab14d0dd2b7 =

---------------- --------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :4           25%           1:2     dmesg.WARNING:at_ip__slab_fre=
e/0x
          2:4          -37%           0:2     perf-profile.children.cycles-=
pp.error_entry
          1:4          -30%           0:2     perf-profile.self.cycles-pp.e=
rror_entry
         %stddev     %change         %stddev
             \          |                \  =

    160.75 =C2=B1  7%     +23.3%     198.29 =C2=B1 16%  reaim.child_systime
    506927            -1.7%     498446        reaim.max_jobs_per_min
   7931060            -3.2%    7678799        reaim.time.involuntary_contex=
t_switches
      3107 =C2=B1  5%     +18.1%       3668 =C2=B1 13%  reaim.time.system_t=
ime
   7217664 =C2=B1  6%     +11.2%    8027136        meminfo.DirectMap2M
     16.52 =C2=B1  5%      +2.6       19.11 =C2=B1 10%  mpstat.cpu.all.sys%
     14534 =C2=B1  4%      -6.2%      13628        proc-vmstat.nr_shmem
      2809 =C2=B1 11%     +35.4%       3805        slabinfo.eventpoll_pwq.a=
ctive_objs
      2809 =C2=B1 11%     +35.4%       3805        slabinfo.eventpoll_pwq.n=
um_objs
     39477 =C2=B1  4%      -9.9%      35575        softirqs.CPU21.NET_RX
     39035 =C2=B1  2%      -9.3%      35393        softirqs.CPU29.NET_RX
     41045 =C2=B1  7%     -11.1%      36472        softirqs.CPU4.NET_RX
     38754 =C2=B1  3%      -9.8%      34966        softirqs.CPU64.NET_RX
 1.498e+10            +1.7%  1.523e+10        perf-stat.i.branch-instructio=
ns
      2.23 =C2=B1  2%      +0.1        2.34 =C2=B1  2%  perf-stat.i.cache-m=
iss-rate%
     36.48            +0.8       37.33        perf-stat.i.node-store-miss-r=
ate%
     35.22            +0.5       35.71        perf-stat.overall.node-store-=
miss-rate%
  16774806            +2.7%   17222201 =C2=B1  2%  perf-stat.overall.path-l=
ength
 1.493e+10            +1.7%  1.518e+10        perf-stat.ps.branch-instructi=
ons
      1777 =C2=B1 19%     +33.1%       2366 =C2=B1  5%  sched_debug.cfs_rq:=
/.load.min
      0.43 =C2=B1 16%     +53.8%       0.67        sched_debug.cfs_rq:/.nr_=
running.min
      0.17 =C2=B1  6%     -32.9%       0.12 =C2=B1 12%  sched_debug.cfs_rq:=
/.nr_running.stddev
      3.35 =C2=B1 27%     -85.7%       0.48 =C2=B1 50%  sched_debug.cfs_rq:=
/.removed.util_avg.avg
    125.62 =C2=B1 10%     -81.3%      23.50 =C2=B1 46%  sched_debug.cfs_rq:=
/.removed.util_avg.max
     18.92 =C2=B1 19%     -84.7%       2.89 =C2=B1 46%  sched_debug.cfs_rq:=
/.removed.util_avg.stddev
      0.58 =C2=B1 46%     +59.4%       0.92 =C2=B1  9%  sched_debug.cfs_rq:=
/.runnable_load_avg.min
      1088 =C2=B1 21%     +50.8%       1641 =C2=B1 11%  sched_debug.cfs_rq:=
/.runnable_weight.min
    -92558          -305.9%     190556 =C2=B1  5%  sched_debug.cfs_rq:/.spr=
ead0.avg
    511049 =C2=B1 44%     +69.5%     866184 =C2=B1 19%  sched_debug.cfs_rq:=
/.spread0.max
    600188 =C2=B1  6%     +13.4%     680581 =C2=B1  6%  sched_debug.cpu.avg=
_idle.avg
     28.76 =C2=B1 20%     +29.4%      37.21 =C2=B1 12%  sched_debug.cpu.clo=
ck.stddev
     28.76 =C2=B1 20%     +29.4%      37.21 =C2=B1 12%  sched_debug.cpu.clo=
ck_task.stddev
      2705 =C2=B1100%    +314.4%      11209 =C2=B1 39%  sched_debug.cpu.cur=
r->pid.min
      9054 =C2=B1  9%     -21.8%       7084 =C2=B1  8%  sched_debug.cpu.cur=
r->pid.stddev
     19617 =C2=B1 14%     -25.3%      14660 =C2=B1 13%  sched_debug.cpu.loa=
d.avg
    534995 =C2=B1 35%     -62.1%     202918 =C2=B1 77%  sched_debug.cpu.loa=
d.max
      1777 =C2=B1 19%     +33.1%       2366 =C2=B1  5%  sched_debug.cpu.loa=
d.min
     65254 =C2=B1 31%     -59.2%      26605 =C2=B1 73%  sched_debug.cpu.loa=
d.stddev
      0.43 =C2=B1 16%     +53.8%       0.67        sched_debug.cpu.nr_runni=
ng.min
    278.68 =C2=B1  3%     +13.9%     317.50        sched_debug.cpu.nr_unint=
erruptible.max
      3.18 =C2=B1 18%      -1.6        1.56 =C2=B1 20%  perf-profile.calltr=
ace.cycles-pp.free_pgtables.exit_mmap.mmput.do_exit.do_group_exit
      1.92 =C2=B1 49%      -1.3        0.58 =C2=B1 11%  perf-profile.calltr=
ace.cycles-pp.down_write.unlink_file_vma.free_pgtables.exit_mmap.mmput
      2.04 =C2=B1 34%      -1.3        0.76 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.unlink_file_vma.free_pgtables.exit_mmap.mmput.do_exit
      5.01 =C2=B1 21%      -2.5        2.53 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.down_write
      4.24 =C2=B1 28%      -2.3        1.96 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.rwsem_down_write_slowpath
      4.70 =C2=B1 14%      -2.2        2.46 =C2=B1 23%  perf-profile.childr=
en.cycles-pp.free_pgtables
      3.58 =C2=B1 34%      -2.0        1.55 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.osq_lock
      2.96 =C2=B1 27%      -1.8        1.20 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.unlink_file_vma
      0.78 =C2=B1 12%      -0.3        0.45 =C2=B1 25%  perf-profile.childr=
en.cycles-pp.vma_link
      0.18 =C2=B1 13%      -0.1        0.11 =C2=B1 27%  perf-profile.childr=
en.cycles-pp.rwsem_wake
      0.17 =C2=B1 15%      -0.1        0.10 =C2=B1 15%  perf-profile.childr=
en.cycles-pp.queued_read_lock_slowpath
      0.08 =C2=B1 23%      -0.1        0.03 =C2=B1100%  perf-profile.childr=
en.cycles-pp.__alloc_fd
      0.07 =C2=B1 11%      -0.0        0.03 =C2=B1100%  perf-profile.childr=
en.cycles-pp.sched_clock
      0.14 =C2=B1  8%      -0.0        0.09 =C2=B1 22%  perf-profile.childr=
en.cycles-pp.wake_up_q
      0.09 =C2=B1 14%      -0.0        0.05        perf-profile.children.cy=
cles-pp.sched_clock_cpu
      0.01 =C2=B1173%      +0.1        0.08 =C2=B1 41%  perf-profile.childr=
en.cycles-pp.memcpy_toio
      0.01 =C2=B1173%      +0.1        0.08 =C2=B1 41%  perf-profile.childr=
en.cycles-pp.fb_flashcursor
      0.01 =C2=B1173%      +0.1        0.08 =C2=B1 41%  perf-profile.childr=
en.cycles-pp.bit_cursor
      0.01 =C2=B1173%      +0.1        0.08 =C2=B1 41%  perf-profile.childr=
en.cycles-pp.soft_cursor
      0.01 =C2=B1173%      +0.1        0.08 =C2=B1 41%  perf-profile.childr=
en.cycles-pp.mga_dirty_update
      0.04 =C2=B1173%      +0.2        0.28 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.start_kernel
      3.54 =C2=B1 34%      -2.0        1.54 =C2=B1 12%  perf-profile.self.c=
ycles-pp.osq_lock
      0.27 =C2=B1 16%      -0.1        0.16 =C2=B1 31%  perf-profile.self.c=
ycles-pp.rwsem_down_write_slowpath
      0.07 =C2=B1  5%      -0.0        0.06 =C2=B1  9%  perf-profile.self.c=
ycles-pp.vfprintf
      0.01 =C2=B1173%      +0.1        0.08 =C2=B1 41%  perf-profile.self.c=
ycles-pp.memcpy_toio
    178.25 =C2=B1 14%     +21.7%     217.00 =C2=B1 15%  interrupts.49:PCI-M=
SI.1572878-edge.eth0-TxRx-14
    151.50            +7.9%     163.50 =C2=B1  2%  interrupts.81:PCI-MSI.15=
72910-edge.eth0-TxRx-46
    824.75 =C2=B1162%    +603.2%       5799 =C2=B1  3%  interrupts.CPU0.NMI=
:Non-maskable_interrupts
    824.75 =C2=B1162%    +603.2%       5799 =C2=B1  3%  interrupts.CPU0.PMI=
:Performance_monitoring_interrupts
     38973 =C2=B1  4%      -6.1%      36586        interrupts.CPU10.RES:Res=
cheduling_interrupts
    178.25 =C2=B1 14%     +21.7%     217.00 =C2=B1 15%  interrupts.CPU14.49=
:PCI-MSI.1572878-edge.eth0-TxRx-14
      4727 =C2=B1 30%     -70.4%       1397 =C2=B1 99%  interrupts.CPU17.NM=
I:Non-maskable_interrupts
      4727 =C2=B1 30%     -70.4%       1397 =C2=B1 99%  interrupts.CPU17.PM=
I:Performance_monitoring_interrupts
    163.50 =C2=B1 14%     +28.7%     210.50 =C2=B1  6%  interrupts.CPU21.TL=
B:TLB_shootdowns
      1151 =C2=B1100%    +276.3%       4331 =C2=B1 28%  interrupts.CPU31.NM=
I:Non-maskable_interrupts
      1151 =C2=B1100%    +276.3%       4331 =C2=B1 28%  interrupts.CPU31.PM=
I:Performance_monitoring_interrupts
      4371 =C2=B1 25%     -99.3%      29.00 =C2=B1 96%  interrupts.CPU32.NM=
I:Non-maskable_interrupts
      4371 =C2=B1 25%     -99.3%      29.00 =C2=B1 96%  interrupts.CPU32.PM=
I:Performance_monitoring_interrupts
      2828 =C2=B1  5%      +9.9%       3110 =C2=B1  2%  interrupts.CPU33.CA=
L:Function_call_interrupts
    173.00 =C2=B1  8%     -22.5%     134.00 =C2=B1  2%  interrupts.CPU33.TL=
B:TLB_shootdowns
      5807 =C2=B1 16%     -76.3%       1378 =C2=B1 99%  interrupts.CPU38.NM=
I:Non-maskable_interrupts
      5807 =C2=B1 16%     -76.3%       1378 =C2=B1 99%  interrupts.CPU38.PM=
I:Performance_monitoring_interrupts
    206.25 =C2=B1  8%     -19.5%     166.00 =C2=B1  7%  interrupts.CPU40.TL=
B:TLB_shootdowns
    151.50            +7.9%     163.50 =C2=B1  2%  interrupts.CPU46.81:PCI-=
MSI.1572910-edge.eth0-TxRx-46
    166.50 =C2=B1  5%     +18.3%     197.00 =C2=B1  6%  interrupts.CPU5.TLB=
:TLB_shootdowns
      5546 =C2=B1 25%     -47.7%       2902 =C2=B1  4%  interrupts.CPU50.NM=
I:Non-maskable_interrupts
      5546 =C2=B1 25%     -47.7%       2902 =C2=B1  4%  interrupts.CPU50.PM=
I:Performance_monitoring_interrupts
      2270 =C2=B1 53%    -100.0%       0.00        interrupts.CPU56.NMI:Non=
-maskable_interrupts
      2270 =C2=B1 53%    -100.0%       0.00        interrupts.CPU56.PMI:Per=
formance_monitoring_interrupts
    142.00 =C2=B1 13%     +33.8%     190.00 =C2=B1 11%  interrupts.CPU56.TL=
B:TLB_shootdowns
     38592 =C2=B1  2%      +5.0%      40532 =C2=B1  3%  interrupts.CPU58.RE=
S:Rescheduling_interrupts
    212.75 =C2=B1 26%     -31.6%     145.50 =C2=B1  7%  interrupts.CPU59.TL=
B:TLB_shootdowns
      2086 =C2=B1 60%    +180.0%       5841 =C2=B1  4%  interrupts.CPU60.NM=
I:Non-maskable_interrupts
      2086 =C2=B1 60%    +180.0%       5841 =C2=B1  4%  interrupts.CPU60.PM=
I:Performance_monitoring_interrupts
     26.25 =C2=B1128%   +6105.7%       1629 =C2=B1 89%  interrupts.CPU61.NM=
I:Non-maskable_interrupts
     26.25 =C2=B1128%   +6105.7%       1629 =C2=B1 89%  interrupts.CPU61.PM=
I:Performance_monitoring_interrupts
      4792 =C2=B1 35%     -39.1%       2918 =C2=B1  5%  interrupts.CPU63.NM=
I:Non-maskable_interrupts
      4792 =C2=B1 35%     -39.1%       2918 =C2=B1  5%  interrupts.CPU63.PM=
I:Performance_monitoring_interrupts
    168.00 =C2=B1 16%     -23.8%     128.00 =C2=B1  5%  interrupts.CPU66.TL=
B:TLB_shootdowns
      3936 =C2=B1 32%     -83.3%     655.50 =C2=B1100%  interrupts.CPU67.NM=
I:Non-maskable_interrupts
      3936 =C2=B1 32%     -83.3%     655.50 =C2=B1100%  interrupts.CPU67.PM=
I:Performance_monitoring_interrupts
      2560 =C2=B1 85%    +124.6%       5751 =C2=B1  5%  interrupts.CPU68.NM=
I:Non-maskable_interrupts
      2560 =C2=B1 85%    +124.6%       5751 =C2=B1  5%  interrupts.CPU68.PM=
I:Performance_monitoring_interrupts
      3693 =C2=B1 21%     +58.6%       5857 =C2=B1  4%  interrupts.CPU70.NM=
I:Non-maskable_interrupts
      3693 =C2=B1 21%     +58.6%       5857 =C2=B1  4%  interrupts.CPU70.PM=
I:Performance_monitoring_interrupts
    112.00 =C2=B1  7%      -8.9%     102.00        interrupts.IWI:IRQ_work_=
interrupts



***************************************************************************=
************************
lkp-ivb-2ep1: 48 threads Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz with 64G=
 memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/te=
stcase/ucode:
  gcc-7/performance/x86_64-rhel-7.6/900t/debian-x86_64-2019-05-14.cgz/300s/=
lkp-ivb-2ep1/disk_cp/reaim/0x42e

commit: =

  4f23dbc1e6 ("locking/rwsem: Implement lock handoff to prevent lock starva=
tion")
  00f3c5a3df ("locking/rwsem: Always release wait_lock before waking up tas=
ks")

4f23dbc1e657951e 00f3c5a3df2c1e3dab14d0dd2b7 =

---------------- --------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

          1:4          -15%           0:2     perf-profile.children.cycles-=
pp.error_entry
          0:4          -11%           0:2     perf-profile.self.cycles-pp.e=
rror_entry
         %stddev     %change         %stddev
             \          |                \  =

      1116            -2.7%       1087        reaim.child_systime
    173.74            +1.0%     175.47        reaim.child_utime
      2468            -1.7%       2425        reaim.time.percent_of_cpu_thi=
s_job_got
      6702            -2.7%       6524        reaim.time.system_time
      1042            +1.0%       1052        reaim.time.user_time
  17750445            +1.1%   17946505        reaim.time.voluntary_context_=
switches
      3128 =C2=B1 16%     +25.7%       3930 =C2=B1  2%  numa-vmstat.node1.n=
r_mapped
    108987 =C2=B1  3%     +29.1%     140714 =C2=B1 21%  softirqs.CPU28.TIMER
     47.75            +2.6%      49.00        vmstat.cpu.id
 8.151e+08 =C2=B1 27%     +32.2%  1.078e+09        cpuidle.C1E.time
   5709370 =C2=B1 25%     +25.1%    7144757        cpuidle.C1E.usage
      1294 =C2=B1  5%     +13.7%       1471 =C2=B1  8%  slabinfo.pool_workq=
ueue.active_objs
      1308 =C2=B1  4%     +12.5%       1472 =C2=B1  8%  slabinfo.pool_workq=
ueue.num_objs
      1586            -1.8%       1558        turbostat.Avg_MHz
   5709242 =C2=B1 25%     +25.1%    7144385        turbostat.C1E
      5.38 =C2=B1 27%      +1.8        7.13        turbostat.C1E%
      0.01 =C2=B1110%    +233.3%       0.03 =C2=B1 19%  turbostat.Pkg%pc3
      5342 =C2=B1173%    +595.0%      37130 =C2=B1 28%  sched_debug.cfs_rq:=
/.MIN_vruntime.avg
    256451 =C2=B1173%    +595.0%    1782246 =C2=B1 28%  sched_debug.cfs_rq:=
/.MIN_vruntime.max
     36628 =C2=B1173%    +595.0%     254551 =C2=B1 28%  sched_debug.cfs_rq:=
/.MIN_vruntime.stddev
    477.71 =C2=B1 29%    +214.6%       1503 =C2=B1 57%  sched_debug.cfs_rq:=
/.load_avg.max
     89.14 =C2=B1 27%    +160.7%     232.44 =C2=B1 54%  sched_debug.cfs_rq:=
/.load_avg.stddev
      5342 =C2=B1173%    +595.0%      37130 =C2=B1 28%  sched_debug.cfs_rq:=
/.max_vruntime.avg
    256451 =C2=B1173%    +595.0%    1782246 =C2=B1 28%  sched_debug.cfs_rq:=
/.max_vruntime.max
     36628 =C2=B1173%    +595.0%     254551 =C2=B1 28%  sched_debug.cfs_rq:=
/.max_vruntime.stddev
      1.00           +16.7%       1.17        sched_debug.cfs_rq:/.nr_runni=
ng.max
     33.74 =C2=B1  6%     -16.1%      28.32 =C2=B1  2%  sched_debug.cfs_rq:=
/.util_est_enqueued.avg
     11.40            +4.7%      11.93        perf-stat.i.MPKI
 7.907e+09            -2.3%  7.726e+09        perf-stat.i.branch-instructio=
ns
      1.74            +0.1        1.83        perf-stat.i.branch-miss-rate%
 4.285e+08            +1.2%  4.335e+08        perf-stat.i.cache-references
    139218            +1.1%     140680        perf-stat.i.context-switches
 7.603e+10            -1.9%  7.457e+10        perf-stat.i.cpu-cycles
    925.05            -2.7%     900.07        perf-stat.i.cycles-between-ca=
che-misses
 1.161e+10            -2.5%  1.132e+10        perf-stat.i.dTLB-loads
  10864114            -1.1%   10743610        perf-stat.i.iTLB-load-misses
   1201431            +4.7%    1258341        perf-stat.i.iTLB-loads
 3.926e+10            -2.4%  3.832e+10        perf-stat.i.instructions
     10.91            +3.6%      11.31        perf-stat.overall.MPKI
      1.63            +0.1        1.68        perf-stat.overall.branch-miss=
-rate%
    921.98            -2.6%     898.33        perf-stat.overall.cycles-betw=
een-cache-misses
  22791180            -2.5%   22226281        perf-stat.overall.path-length
 7.882e+09            -2.3%  7.701e+09        perf-stat.ps.branch-instructi=
ons
 4.271e+08            +1.2%  4.321e+08        perf-stat.ps.cache-references
    138768            +1.1%     140229        perf-stat.ps.context-switches
 7.578e+10            -1.9%  7.434e+10        perf-stat.ps.cpu-cycles
 1.157e+10            -2.5%  1.129e+10        perf-stat.ps.dTLB-loads
  10829073            -1.1%   10709146        perf-stat.ps.iTLB-load-misses
   1197556            +4.7%    1254304        perf-stat.ps.iTLB-loads
 3.914e+10            -2.4%   3.82e+10        perf-stat.ps.instructions
 1.231e+13            -2.5%    1.2e+13        perf-stat.total.instructions
    925085 =C2=B1  3%      +5.5%     976146        interrupts.CAL:Function_=
call_interrupts
     11296 =C2=B1  4%      +9.2%      12340 =C2=B1  3%  interrupts.CPU0.RES=
:Rescheduling_interrupts
      3692 =C2=B1 32%    -100.0%       0.50 =C2=B1100%  interrupts.CPU10.NM=
I:Non-maskable_interrupts
      3692 =C2=B1 32%    -100.0%       0.50 =C2=B1100%  interrupts.CPU10.PM=
I:Performance_monitoring_interrupts
      3699 =C2=B1 32%     -96.4%     132.00 =C2=B1 64%  interrupts.CPU20.NM=
I:Non-maskable_interrupts
      3699 =C2=B1 32%     -96.4%     132.00 =C2=B1 64%  interrupts.CPU20.PM=
I:Performance_monitoring_interrupts
    635.25 =C2=B1163%     -99.9%       0.50 =C2=B1100%  interrupts.CPU22.NM=
I:Non-maskable_interrupts
    635.25 =C2=B1163%     -99.9%       0.50 =C2=B1100%  interrupts.CPU22.PM=
I:Performance_monitoring_interrupts
     19144 =C2=B1  2%      +9.9%      21036        interrupts.CPU23.CAL:Fun=
ction_call_interrupts
    706.75 =C2=B1143%    +420.9%       3681 =C2=B1 31%  interrupts.CPU23.NM=
I:Non-maskable_interrupts
    706.75 =C2=B1143%    +420.9%       3681 =C2=B1 31%  interrupts.CPU23.PM=
I:Performance_monitoring_interrupts
     16166           +10.2%      17809        interrupts.CPU23.TLB:TLB_shoo=
tdowns
     16484 =C2=B1  5%      +5.7%      17432 =C2=B1  4%  interrupts.CPU25.TL=
B:TLB_shootdowns
    654.75 =C2=B1157%    +464.7%       3697 =C2=B1 30%  interrupts.CPU27.NM=
I:Non-maskable_interrupts
    654.75 =C2=B1157%    +464.7%       3697 =C2=B1 30%  interrupts.CPU27.PM=
I:Performance_monitoring_interrupts
     15719 =C2=B1  4%      +7.8%      16941 =C2=B1  5%  interrupts.CPU29.TL=
B:TLB_shootdowns
    191.75 =C2=B1152%   +1195.2%       2483 =C2=B1  4%  interrupts.CPU30.NM=
I:Non-maskable_interrupts
    191.75 =C2=B1152%   +1195.2%       2483 =C2=B1  4%  interrupts.CPU30.PM=
I:Performance_monitoring_interrupts
      2.50 =C2=B1 82%  +1.5e+05%       3665 =C2=B1 30%  interrupts.CPU34.NM=
I:Non-maskable_interrupts
      2.50 =C2=B1 82%  +1.5e+05%       3665 =C2=B1 30%  interrupts.CPU34.PM=
I:Performance_monitoring_interrupts
     10577 =C2=B1  2%      +5.7%      11181 =C2=B1  5%  interrupts.CPU34.RE=
S:Rescheduling_interrupts
    671.50 =C2=B1151%    +449.5%       3690 =C2=B1 30%  interrupts.CPU44.NM=
I:Non-maskable_interrupts
    671.50 =C2=B1151%    +449.5%       3690 =C2=B1 30%  interrupts.CPU44.PM=
I:Performance_monitoring_interrupts
     10379 =C2=B1  3%      +8.5%      11258 =C2=B1  3%  interrupts.CPU44.RE=
S:Rescheduling_interrupts
     16081 =C2=B1  2%     +11.2%      17882 =C2=B1  2%  interrupts.CPU47.TL=
B:TLB_shootdowns
     18858 =C2=B1  5%      +7.0%      20175 =C2=B1  4%  interrupts.CPU5.CAL=
:Function_call_interrupts
     15595 =C2=B1  6%      +7.9%      16826 =C2=B1  5%  interrupts.CPU5.TLB=
:TLB_shootdowns
     20.85            -1.1       19.71 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.osq_lock.rwsem_down_write_slowpath.down_write.unlink_file_vma.free=
_pgtables
     14.50            -0.9       13.56 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.load_elf_binary.search_binary_handler.__do_execve_file.__x64_sys_e=
xecve.do_syscall_64
     14.52            -0.9       13.59 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.search_binary_handler.__do_execve_file.__x64_sys_execve.do_syscall=
_64.entry_SYSCALL_64_after_hwframe
     12.03            -0.8       11.20        perf-profile.calltrace.cycles=
-pp.exit_mmap.mmput.flush_old_exec.load_elf_binary.search_binary_handler
     12.13            -0.8       11.31        perf-profile.calltrace.cycles=
-pp.flush_old_exec.load_elf_binary.search_binary_handler.__do_execve_file._=
_x64_sys_execve
     12.04            -0.8       11.22        perf-profile.calltrace.cycles=
-pp.mmput.flush_old_exec.load_elf_binary.search_binary_handler.__do_execve_=
file
     10.75            -0.7       10.01        perf-profile.calltrace.cycles=
-pp.free_pgtables.exit_mmap.mmput.flush_old_exec.load_elf_binary
      9.92            -0.7        9.21        perf-profile.calltrace.cycles=
-pp.unlink_file_vma.free_pgtables.exit_mmap.mmput.flush_old_exec
     24.45            -1.2       23.26 =C2=B1  3%  perf-profile.children.cy=
cles-pp.free_pgtables
     22.85            -1.1       21.73 =C2=B1  2%  perf-profile.children.cy=
cles-pp.unlink_file_vma
     15.96            -1.0       15.00 =C2=B1  2%  perf-profile.children.cy=
cles-pp.__do_execve_file
     16.03            -0.9       15.09 =C2=B1  2%  perf-profile.children.cy=
cles-pp.__x64_sys_execve
     14.52            -0.9       13.58 =C2=B1  2%  perf-profile.children.cy=
cles-pp.search_binary_handler
     14.50            -0.9       13.56 =C2=B1  2%  perf-profile.children.cy=
cles-pp.load_elf_binary
     12.14            -0.8       11.31        perf-profile.children.cycles-=
pp.flush_old_exec
      0.30 =C2=B1  2%      -0.0        0.27 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.perf_iterate_sb
      0.17 =C2=B1  5%      -0.0        0.15 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.unwind_next_frame
      0.10            -0.0        0.08 =C2=B1  6%  perf-profile.children.cy=
cles-pp.copy_user_generic_unrolled
      0.14 =C2=B1  6%      -0.0        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.perf_event_mmap_output
      0.08 =C2=B1 10%      -0.0        0.06        perf-profile.children.cy=
cles-pp.move_queued_task
      0.05 =C2=B1  9%      +0.0        0.07        perf-profile.children.cy=
cles-pp.__x64_sys_close
      0.06 =C2=B1  7%      +0.0        0.08 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.fput_many
      0.04 =C2=B1 57%      +0.0        0.06        perf-profile.children.cy=
cles-pp.lapic_next_deadline
      0.54 =C2=B1  4%      +0.0        0.56 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.alloc_set_pte
      0.15 =C2=B1  8%      +0.0        0.18 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.__d_lookup_rcu
      0.20 =C2=B1 10%      +0.0        0.23 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.wait_consider_task
      0.10 =C2=B1 21%      +0.0        0.14 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.ksys_write
      0.09 =C2=B1 23%      +0.0        0.13 =C2=B1 15%  perf-profile.childr=
en.cycles-pp.new_sync_write
      0.06 =C2=B1 68%      +0.0        0.11 =C2=B1 23%  perf-profile.childr=
en.cycles-pp.__waitpid
      0.24 =C2=B1  6%      +0.0        0.28 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.lookup_fast
      0.57 =C2=B1  6%      +0.0        0.61 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.anon_vma_fork
      0.00            +0.1        0.05        perf-profile.children.cycles-=
pp.cp_new_stat
      0.10 =C2=B1  4%      +0.1        0.16 =C2=B1 25%  perf-profile.childr=
en.cycles-pp.ktime_get
      0.10 =C2=B1  5%      +0.1        0.16 =C2=B1 31%  perf-profile.childr=
en.cycles-pp.clockevents_program_event
      0.68 =C2=B1  4%      +0.1        0.74 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.schedule
      1.11 =C2=B1  6%      +0.1        1.18 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.__schedule
      0.32 =C2=B1  7%      +0.1        0.39 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.__slab_free
      0.09 =C2=B1 13%      -0.0        0.07        perf-profile.self.cycles=
-pp.cpuidle_enter_state
      0.07 =C2=B1  6%      +0.0        0.08        perf-profile.self.cycles=
-pp.___slab_alloc
      0.09 =C2=B1  4%      +0.0        0.10        perf-profile.self.cycles=
-pp.avc_has_perm_noaudit
      0.17 =C2=B1  4%      +0.0        0.18 =C2=B1  2%  perf-profile.self.c=
ycles-pp.alloc_set_pte
      0.05            +0.0        0.07 =C2=B1  7%  perf-profile.self.cycles=
-pp._vm_normal_page
      0.21 =C2=B1  6%      +0.0        0.24 =C2=B1  4%  perf-profile.self.c=
ycles-pp.anon_vma_interval_tree_insert
      0.34 =C2=B1  6%      +0.0        0.38        perf-profile.self.cycles=
-pp.__handle_mm_fault
      0.15 =C2=B1  7%      +0.0        0.18 =C2=B1  5%  perf-profile.self.c=
ycles-pp.__d_lookup_rcu
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.p=
ath_openat
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.e=
nqueue_task_fair



***************************************************************************=
************************
lkp-hsw-ep2: 72 threads Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GHz with 256G=
 memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/te=
stcase/ucode:
  gcc-7/performance/x86_64-rhel-7.6/1600%/debian-x86_64-2019-05-14.cgz/300s=
/lkp-hsw-ep2/new_dbase/reaim/0x43

commit: =

  4f23dbc1e6 ("locking/rwsem: Implement lock handoff to prevent lock starva=
tion")
  00f3c5a3df ("locking/rwsem: Always release wait_lock before waking up tas=
ks")

4f23dbc1e657951e 00f3c5a3df2c1e3dab14d0dd2b7 =

---------------- --------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

          1:4          -25%            :2     dmesg.WARNING:at_ip_perf_even=
t_mmap_output/0x
          1:4          -17%           0:2     perf-profile.children.cycles-=
pp.error_entry
         %stddev     %change         %stddev
             \          |                \  =

  10584147            +1.9%   10785891        perf-stat.i.node-load-misses
  10542342            +1.9%   10743011        perf-stat.ps.node-load-misses
      1393 =C2=B1  7%     -19.5%       1122 =C2=B1  2%  slabinfo.task_group=
.active_objs
      1393 =C2=B1  7%     -19.5%       1122 =C2=B1  2%  slabinfo.task_group=
.num_objs
     34065            +0.9%      34375        proc-vmstat.nr_kernel_stack
     13974            +2.7%      14349        proc-vmstat.nr_page_table_pag=
es
      3127 =C2=B1 92%     +91.2%       5980 =C2=B1 34%  proc-vmstat.numa_hi=
nt_faults
    122943 =C2=B1 12%     +12.9%     138853 =C2=B1 12%  numa-vmstat.node0.n=
r_active_anon
     13963 =C2=B1 48%     +34.6%      18801 =C2=B1 41%  numa-vmstat.node0.n=
r_kernel_stack
      4857 =C2=B1 76%     +56.6%       7609 =C2=B1 57%  numa-vmstat.node0.n=
r_page_table_pages
    122943 =C2=B1 12%     +12.9%     138852 =C2=B1 12%  numa-vmstat.node0.n=
r_zone_active_anon
    494560 =C2=B1 12%     +12.6%     557012 =C2=B1 12%  numa-meminfo.node0.=
Active
    494224 =C2=B1 12%     +12.6%     556676 =C2=B1 12%  numa-meminfo.node0.=
Active(anon)
    474941 =C2=B1 14%     +13.0%     536795 =C2=B1 14%  numa-meminfo.node0.=
AnonPages
     13949 =C2=B1 49%     +32.9%      18544 =C2=B1 40%  numa-meminfo.node0.=
KernelStack
   1479782 =C2=B1  9%      +9.4%    1618507 =C2=B1  8%  numa-meminfo.node0.=
MemUsed
     19602 =C2=B1 76%     +52.1%      29814 =C2=B1 56%  numa-meminfo.node0.=
PageTables
    117010           +24.4%     145600 =C2=B1 14%  softirqs.CPU10.TIMER
     13137 =C2=B1  2%     -12.0%      11564        softirqs.CPU18.SCHED
     82501 =C2=B1  5%      +8.2%      89260 =C2=B1  8%  softirqs.CPU29.RCU
    117180           +12.4%     131653 =C2=B1  5%  softirqs.CPU35.TIMER
     12029 =C2=B1  5%      -6.1%      11294        softirqs.CPU37.SCHED
    117019           +10.1%     128814 =C2=B1  5%  softirqs.CPU46.TIMER
     74749 =C2=B1  6%      +9.2%      81658 =C2=B1  6%  softirqs.CPU60.RCU
     72124 =C2=B1  6%     +10.9%      80008 =C2=B1  9%  softirqs.CPU65.RCU
    117036 =C2=B1  2%     +20.5%     141060 =C2=B1 13%  softirqs.CPU71.TIMER
      0.10 =C2=B1 16%     +37.6%       0.14        sched_debug.cfs_rq:/.nr_=
running.stddev
     11.66 =C2=B1  6%     -17.7%       9.60 =C2=B1  8%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
     90.96 =C2=B1 19%     +18.5%     107.82 =C2=B1  9%  sched_debug.cpu.clo=
ck.stddev
     90.96 =C2=B1 19%     +18.5%     107.82 =C2=B1  9%  sched_debug.cpu.clo=
ck_task.stddev
     16220           -13.9%      13969        sched_debug.cpu.nr_switches.s=
tddev
    321.04 =C2=B1  4%     +39.0%     446.25 =C2=B1 13%  sched_debug.cpu.nr_=
uninterruptible.max
    142.97           +20.7%     172.63 =C2=B1  8%  sched_debug.cpu.nr_unint=
erruptible.stddev
     17028 =C2=B1  2%      -9.8%      15355        sched_debug.cpu.sched_co=
unt.stddev
     21177 =C2=B1  3%     +12.2%      23770        sched_debug.cpu.ttwu_cou=
nt.min
     10062 =C2=B1  2%     -11.7%       8882        sched_debug.cpu.ttwu_cou=
nt.stddev
     12442           +12.0%      13935        sched_debug.cpu.ttwu_local.min
      5892 =C2=B1  3%     -12.1%       5178        sched_debug.cpu.ttwu_loc=
al.stddev
    169.25 =C2=B1  8%    +344.9%     753.00 =C2=B1 75%  interrupts.38:PCI-M=
SI.1572867-edge.eth0-TxRx-3
    491.50 =C2=B1 72%     -64.8%     173.00        interrupts.39:PCI-MSI.15=
72868-edge.eth0-TxRx-4
    299.25 =C2=B1 58%     -42.5%     172.00        interrupts.45:PCI-MSI.15=
72874-edge.eth0-TxRx-10
    178.50 =C2=B1  7%     +97.8%     353.00 =C2=B1  9%  interrupts.48:PCI-M=
SI.1572877-edge.eth0-TxRx-13
    210.75 =C2=B1 27%     +72.0%     362.50 =C2=B1 31%  interrupts.50:PCI-M=
SI.1572879-edge.eth0-TxRx-15
    150.00            +7.3%     161.00 =C2=B1  6%  interrupts.73:PCI-MSI.15=
72902-edge.eth0-TxRx-38
    150.00            +6.7%     160.00 =C2=B1  5%  interrupts.96:PCI-MSI.15=
72925-edge.eth0-TxRx-61
    299.25 =C2=B1 58%     -42.5%     172.00        interrupts.CPU10.45:PCI-=
MSI.1572874-edge.eth0-TxRx-10
    178.50 =C2=B1  7%     +97.8%     353.00 =C2=B1  9%  interrupts.CPU13.48=
:PCI-MSI.1572877-edge.eth0-TxRx-13
      2731 =C2=B1  8%     +11.9%       3055 =C2=B1  2%  interrupts.CPU13.CA=
L:Function_call_interrupts
    210.75 =C2=B1 27%     +72.0%     362.50 =C2=B1 31%  interrupts.CPU15.50=
:PCI-MSI.1572879-edge.eth0-TxRx-15
      2401 =C2=B1100%    -100.0%       1.00 =C2=B1100%  interrupts.CPU15.NM=
I:Non-maskable_interrupts
      2401 =C2=B1100%    -100.0%       1.00 =C2=B1100%  interrupts.CPU15.PM=
I:Performance_monitoring_interrupts
    138.50 =C2=B1 25%     +26.4%     175.00 =C2=B1  6%  interrupts.CPU17.TL=
B:TLB_shootdowns
      4544 =C2=B1 57%    -100.0%       0.00        interrupts.CPU26.NMI:Non=
-maskable_interrupts
      4544 =C2=B1 57%    -100.0%       0.00        interrupts.CPU26.PMI:Per=
formance_monitoring_interrupts
    169.25 =C2=B1  8%    +344.9%     753.00 =C2=B1 75%  interrupts.CPU3.38:=
PCI-MSI.1572867-edge.eth0-TxRx-3
    825.50 =C2=B1152%    +450.6%       4545 =C2=B1 32%  interrupts.CPU36.NM=
I:Non-maskable_interrupts
    825.50 =C2=B1152%    +450.6%       4545 =C2=B1 32%  interrupts.CPU36.PM=
I:Performance_monitoring_interrupts
    150.00            +7.3%     161.00 =C2=B1  6%  interrupts.CPU38.73:PCI-=
MSI.1572902-edge.eth0-TxRx-38
    491.50 =C2=B1 72%     -64.8%     173.00        interrupts.CPU4.39:PCI-M=
SI.1572868-edge.eth0-TxRx-4
    176.50 =C2=B1 11%     -24.9%     132.50 =C2=B1 16%  interrupts.CPU4.TLB=
:TLB_shootdowns
      4580 =C2=B1 33%     -66.0%       1558 =C2=B1 95%  interrupts.CPU44.NM=
I:Non-maskable_interrupts
      4580 =C2=B1 33%     -66.0%       1558 =C2=B1 95%  interrupts.CPU44.PM=
I:Performance_monitoring_interrupts
      2732 =C2=B1 80%     -95.9%     111.50 =C2=B1  9%  interrupts.CPU47.NM=
I:Non-maskable_interrupts
      2732 =C2=B1 80%     -95.9%     111.50 =C2=B1  9%  interrupts.CPU47.PM=
I:Performance_monitoring_interrupts
    144.75 =C2=B1  5%     +10.5%     160.00 =C2=B1  4%  interrupts.CPU56.TL=
B:TLB_shootdowns
      1725 =C2=B1145%    +188.6%       4981 =C2=B1 22%  interrupts.CPU58.NM=
I:Non-maskable_interrupts
      1725 =C2=B1145%    +188.6%       4981 =C2=B1 22%  interrupts.CPU58.PM=
I:Performance_monitoring_interrupts
    145.25 =C2=B1 16%     +30.8%     190.00        interrupts.CPU58.TLB:TLB=
_shootdowns
      1515 =C2=B1173%    +201.8%       4573 =C2=B1 33%  interrupts.CPU6.NMI=
:Non-maskable_interrupts
      1515 =C2=B1173%    +201.8%       4573 =C2=B1 33%  interrupts.CPU6.PMI=
:Performance_monitoring_interrupts
    150.00            +6.7%     160.00 =C2=B1  5%  interrupts.CPU61.96:PCI-=
MSI.1572925-edge.eth0-TxRx-61
      2881 =C2=B1  4%      +9.1%       3143        interrupts.CPU62.CAL:Fun=
ction_call_interrupts
      1622 =C2=B1159%    +183.6%       4602 =C2=B1 33%  interrupts.CPU62.NM=
I:Non-maskable_interrupts
      1622 =C2=B1159%    +183.6%       4602 =C2=B1 33%  interrupts.CPU62.PM=
I:Performance_monitoring_interrupts
      2449 =C2=B1 97%    +150.0%       6124        interrupts.CPU68.NMI:Non=
-maskable_interrupts
      2449 =C2=B1 97%    +150.0%       6124        interrupts.CPU68.PMI:Per=
formance_monitoring_interrupts
      2846 =C2=B1  5%     +10.1%       3133        interrupts.CPU7.CAL:Func=
tion_call_interrupts
      3055 =C2=B1 70%     +50.6%       4601 =C2=B1 32%  interrupts.CPU7.NMI=
:Non-maskable_interrupts
      3055 =C2=B1 70%     +50.6%       4601 =C2=B1 32%  interrupts.CPU7.PMI=
:Performance_monitoring_interrupts
     33.94 =C2=B1  6%      -3.0       30.98        perf-profile.calltrace.c=
ycles-pp.sieve
      9.37 =C2=B1  6%      -0.9        8.44        perf-profile.calltrace.c=
ycles-pp.string_rtns_1
      3.44 =C2=B1  6%      -0.3        3.10        perf-profile.calltrace.c=
ycles-pp.brk
      2.53 =C2=B1  8%      -0.3        2.26 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.page_test
      2.72 =C2=B1  6%      -0.3        2.46        perf-profile.calltrace.c=
ycles-pp.entry_SYSCALL_64_after_hwframe.brk
      2.71 =C2=B1  6%      -0.3        2.45        perf-profile.calltrace.c=
ycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      2.25 =C2=B1  6%      -0.2        2.04        perf-profile.calltrace.c=
ycles-pp.__x64_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      1.55 =C2=B1  7%      -0.2        1.38 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.page_fault.page_test
      1.55 =C2=B1  7%      -0.2        1.38 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.do_page_fault.page_fault.page_test
      1.48 =C2=B1  7%      -0.2        1.31 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.__do_page_fault.do_page_fault.page_fault.page_test
      1.25 =C2=B1  7%      -0.1        1.10 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.handle_mm_fault.__do_page_fault.do_page_fault.page_fault.page=
_test
      0.89 =C2=B1  8%      -0.1        0.79        perf-profile.calltrace.c=
ycles-pp.do_brk_flags.__x64_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hw=
frame.brk
      1.16 =C2=B1  5%      -0.1        1.07        perf-profile.calltrace.c=
ycles-pp.__do_munmap.__x64_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame.brk
      0.77 =C2=B1  6%      -0.1        0.69        perf-profile.calltrace.c=
ycles-pp.tlb_flush_mmu.tlb_finish_mmu.unmap_region.__do_munmap.__x64_sys_brk
      0.78 =C2=B1  6%      -0.1        0.70        perf-profile.calltrace.c=
ycles-pp.tlb_finish_mmu.unmap_region.__do_munmap.__x64_sys_brk.do_syscall_64
      0.41 =C2=B1 57%      +0.2        0.59 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.prepare_exit_to_usermode.swapgs_restore_regs_and_return_to_us=
ermode
      0.55 =C2=B1 57%      +0.3        0.82 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.swapgs_restore_regs_and_return_to_usermode
      3.17 =C2=B1  8%      +0.3        3.45 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.__handle_mm_fault.handle_mm_fault.__do_page_fault.do_page_fau=
lt.page_fault
      0.85 =C2=B1 21%      +0.3        1.14 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.__libc_fork
      1.31 =C2=B1 18%      +0.3        1.60 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.unmap_region.__do_munmap.__x64_sys_brk.do_syscall_64.entry_SY=
SCALL_64_after_hwframe
      0.59 =C2=B1 59%      +0.4        0.97 =C2=B1 11%  perf-profile.calltr=
ace.cycles-pp.copy_process._do_fork.do_syscall_64.entry_SYSCALL_64_after_hw=
frame.__libc_fork
      0.63 =C2=B1 59%      +0.4        1.01 =C2=B1 11%  perf-profile.calltr=
ace.cycles-pp._do_fork.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_=
fork
      0.30 =C2=B1100%      +0.4        0.69 =C2=B1 10%  perf-profile.calltr=
ace.cycles-pp.__do_munmap.__x64_sys_brk.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe
      0.63 =C2=B1 59%      +0.4        1.02 =C2=B1 11%  perf-profile.calltr=
ace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_fork
      0.63 =C2=B1 59%      +0.4        1.02 =C2=B1 11%  perf-profile.calltr=
ace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_fork
      0.13 =C2=B1173%      +0.4        0.53 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_vma=
.do_anonymous_page.__handle_mm_fault
      2.11 =C2=B1 17%      +0.4        2.52        perf-profile.calltrace.c=
ycles-pp.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      2.44 =C2=B1 17%      +0.5        2.91 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.__do_page_fault.do_page_fault.page_fault
      2.58 =C2=B1 16%      +0.5        3.05 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.page_fault
      2.53 =C2=B1 17%      +0.5        3.00 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.do_page_fault.page_fault
      1.58 =C2=B1 25%      +0.5        2.09 =C2=B1 12%  perf-profile.calltr=
ace.cycles-pp.copy_process._do_fork.do_syscall_64.entry_SYSCALL_64_after_hw=
frame
      1.66 =C2=B1 24%      +0.5        2.17 =C2=B1 12%  perf-profile.calltr=
ace.cycles-pp._do_fork.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.33 =C2=B1105%      +0.5        0.86 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.rwsem_down_write_slowpath.down_write.vma_link.mmap_region.do_=
mmap
      0.33 =C2=B1105%      +0.5        0.87 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.down_write.vma_link.mmap_region.do_mmap.vm_mmap_pgoff
      1.23 =C2=B1 39%      +0.6        1.79 =C2=B1 15%  perf-profile.calltr=
ace.cycles-pp.unlink_file_vma.free_pgtables.exit_mmap.mmput.do_exit
      0.35 =C2=B1104%      +0.6        0.93 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.vma_link.mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff
      1.33 =C2=B1 37%      +0.6        1.90 =C2=B1 14%  perf-profile.calltr=
ace.cycles-pp.free_pgtables.exit_mmap.mmput.do_exit.do_group_exit
      0.77 =C2=B1 62%      +0.6        1.38        perf-profile.calltrace.c=
ycles-pp.mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      0.82 =C2=B1 62%      +0.6        1.43 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.79 =C2=B1 62%      +0.6        1.41 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYS=
CALL_64_after_hwframe
      0.00            +0.6        0.61 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.do_brk_flags.__x64_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hw=
frame
      0.81 =C2=B1 62%      +0.6        1.43 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_=
after_hwframe
      0.81 =C2=B1 60%      +0.6        1.44 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.__x64_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.20 =C2=B1173%      +0.6        0.82        perf-profile.calltrace.c=
ycles-pp.osq_lock.rwsem_down_write_slowpath.down_write.vma_link.mmap_region
      1.14 =C2=B1 58%      +0.7        1.79        perf-profile.calltrace.c=
ycles-pp.__do_execve_file.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe
      1.15 =C2=B1 58%      +0.7        1.80        perf-profile.calltrace.c=
ycles-pp.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.12 =C2=B1 27%      +0.7        2.83 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.mmput.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      2.12 =C2=B1 27%      +0.7        2.83 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.exit_mmap.mmput.do_exit.do_group_exit.__x64_sys_exit_group
      3.23 =C2=B1 29%      +0.7        3.94 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.load_elf_binary.search_binary_handler.__do_execve_file.__x64_=
sys_execve.do_syscall_64
      0.90 =C2=B1 74%      +0.7        1.62 =C2=B1 37%  perf-profile.calltr=
ace.cycles-pp.osq_lock.rwsem_down_write_slowpath.down_write.dup_mm.copy_pro=
cess
      3.24 =C2=B1 29%      +0.7        3.96 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.search_binary_handler.__do_execve_file.__x64_sys_execve.do_sy=
scall_64.entry_SYSCALL_64_after_hwframe
      2.38 =C2=B1 25%      +0.7        3.12 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
      2.38 =C2=B1 25%      +0.7        3.12 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame
      2.38 =C2=B1 25%      +0.7        3.12 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.do_group_exit.__x64_sys_exit_group.do_syscall_64.entry_SYSCAL=
L_64_after_hwframe
      0.92 =C2=B1 74%      +0.8        1.68 =C2=B1 36%  perf-profile.calltr=
ace.cycles-pp.rwsem_down_write_slowpath.down_write.dup_mm.copy_process._do_=
fork
      0.93 =C2=B1 74%      +0.8        1.69 =C2=B1 36%  perf-profile.calltr=
ace.cycles-pp.down_write.dup_mm.copy_process._do_fork.do_syscall_64
      3.83 =C2=B1  7%      +0.8        4.60 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.secondary_startup_64
      3.02 =C2=B1 11%      +0.8        3.79 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_star=
tup_entry
      3.50 =C2=B1  9%      +0.8        4.32 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.s=
tart_secondary
      3.53 =C2=B1  9%      +0.8        4.36 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.secon=
dary_startup_64
      3.76 =C2=B1  8%      +0.8        4.60 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
      3.77 =C2=B1  8%      +0.8        4.60 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.start_secondary.secondary_startup_64
      3.77 =C2=B1  8%      +0.8        4.60 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64
      1.91 =C2=B1 35%      +0.8        2.75 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.dup_mm.copy_process._do_fork.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe
      2.28 =C2=B1 60%      +1.2        3.53 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.osq_lock.rwsem_down_write_slowpath.down_write.unlink_file_vma=
.free_pgtables
      2.39 =C2=B1 60%      +1.3        3.67 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.rwsem_down_write_slowpath.down_write.unlink_file_vma.free_pgt=
ables.exit_mmap
      2.42 =C2=B1 60%      +1.3        3.71 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.down_write.unlink_file_vma.free_pgtables.exit_mmap.mmput
      8.91 =C2=B1 28%      +3.3       12.18 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.93 =C2=B1 28%      +3.3       12.20 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.entry_SYSCALL_64_after_hwframe
     33.97 =C2=B1  6%      -3.0       31.00        perf-profile.children.cy=
cles-pp.sieve
      9.44 =C2=B1  6%      -0.9        8.49        perf-profile.children.cy=
cles-pp.string_rtns_1
      3.47 =C2=B1  6%      -0.3        3.12        perf-profile.children.cy=
cles-pp.brk
      2.87 =C2=B1  8%      -0.3        2.57 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.page_test
      0.16 =C2=B1  8%      -0.0        0.13        perf-profile.children.cy=
cles-pp.__libc_calloc
      0.17 =C2=B1  2%      -0.0        0.16        perf-profile.children.cy=
cles-pp.free
      0.07 =C2=B1  6%      +0.0        0.08        perf-profile.children.cy=
cles-pp.wait_consider_task
      0.05 =C2=B1  8%      +0.0        0.07 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.dequeue_task_fair
      0.06 =C2=B1  7%      +0.0        0.07        perf-profile.children.cy=
cles-pp.finish_task_switch
      0.05            +0.0        0.07 =C2=B1  7%  perf-profile.children.cy=
cles-pp.up_read
      0.10 =C2=B1 11%      +0.0        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.__slab_free
      0.09 =C2=B1  9%      +0.0        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.__x64_sys_munmap
      0.08 =C2=B1 14%      +0.0        0.10 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.enqueue_entity
      0.05 =C2=B1  8%      +0.0        0.07        perf-profile.children.cy=
cles-pp.do_dentry_open
      0.12 =C2=B1  9%      +0.0        0.14 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.vmacache_find
      0.19 =C2=B1  5%      +0.0        0.21        perf-profile.children.cy=
cles-pp.exit_to_usermode_loop
      0.08 =C2=B1 11%      +0.0        0.10 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.load_balance
      0.07 =C2=B1 13%      +0.0        0.08 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.ttwu_do_activate
      0.06 =C2=B1 11%      +0.0        0.08 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.mem_cgroup_throttle_swaprate
      0.32 =C2=B1  4%      +0.0        0.34        perf-profile.children.cy=
cles-pp.copy_p4d_range
      0.09 =C2=B1 12%      +0.0        0.11 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.wake_up_q
      0.06 =C2=B1  7%      +0.0        0.08 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.__tlb_remove_page_size
      0.11 =C2=B1 13%      +0.0        0.14 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.wait4
      0.21 =C2=B1  5%      +0.0        0.24 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.kmem_cache_alloc
      0.08 =C2=B1 10%      +0.0        0.11        perf-profile.children.cy=
cles-pp.activate_task
      0.04 =C2=B1 58%      +0.0        0.07        perf-profile.children.cy=
cles-pp.__list_add_valid
      0.27 =C2=B1  8%      +0.0        0.30 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.page_remove_rmap
      0.28 =C2=B1  5%      +0.0        0.31 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.mem_cgroup_try_charge_delay
      0.15 =C2=B1 11%      +0.0        0.18 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.do_wait
      0.30 =C2=B1  4%      +0.0        0.33        perf-profile.children.cy=
cles-pp.perf_iterate_sb
      0.24 =C2=B1 11%      +0.0        0.27 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.lru_add_drain_cpu
      0.11 =C2=B1  7%      +0.0        0.15 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.pick_next_task_fair
      0.21 =C2=B1 10%      +0.0        0.25        perf-profile.children.cy=
cles-pp.anon_vma_fork
      0.08 =C2=B1 10%      +0.0        0.12 =C2=B1 25%  perf-profile.childr=
en.cycles-pp.memcpy_erms
      0.24 =C2=B1  7%      +0.0        0.28 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.schedule
      0.23 =C2=B1 13%      +0.0        0.27 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.lru_add_drain
      0.27 =C2=B1  8%      +0.0        0.30        perf-profile.children.cy=
cles-pp.scheduler_tick
      0.19 =C2=B1  9%      +0.0        0.23 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.anon_vma_clone
      0.33 =C2=B1  7%      +0.0        0.36 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.__pagevec_lru_add_fn
      0.16 =C2=B1 13%      +0.0        0.20 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.kernel_wait4
      0.41 =C2=B1  7%      +0.0        0.46        perf-profile.children.cy=
cles-pp.syscall_return_via_sysret
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.interrupt_entry
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.find_busiest_group
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.copy_user_generic_unrolled
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.update_load_avg
      0.17 =C2=B1  6%      +0.0        0.21 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.try_to_wake_up
      0.16 =C2=B1 13%      +0.0        0.21 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.__do_sys_wait4
      0.11 =C2=B1 29%      +0.0        0.16 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.rwsem_spin_on_owner
      0.00            +0.1        0.05        perf-profile.children.cycles-=
pp.update_sd_lb_stats
      0.40 =C2=B1  6%      +0.1        0.45 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.update_process_times
      0.42 =C2=B1  6%      +0.1        0.47 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.tick_sched_handle
      0.51 =C2=B1  6%      +0.1        0.56 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.do_sys_open
      0.52 =C2=B1  6%      +0.1        0.57 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.path_openat
      0.52 =C2=B1  6%      +0.1        0.58 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.do_filp_open
      0.45 =C2=B1  5%      +0.1        0.52 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.tick_sched_timer
      0.55 =C2=B1  5%      +0.1        0.62 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.perf_event_mmap
      0.33 =C2=B1  7%      +0.1        0.40 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.__schedule
      0.32 =C2=B1 16%      +0.1        0.40 =C2=B1 13%  perf-profile.childr=
en.cycles-pp._raw_spin_lock
      0.40 =C2=B1 15%      +0.1        0.48 =C2=B1  7%  perf-profile.childr=
en.cycles-pp._raw_spin_lock_irqsave
      0.62 =C2=B1  3%      +0.1        0.70        perf-profile.children.cy=
cles-pp.__hrtimer_run_queues
      0.59 =C2=B1 10%      +0.1        0.67 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.pagevec_lru_move_fn
      0.80 =C2=B1  3%      +0.1        0.91        perf-profile.children.cy=
cles-pp.hrtimer_interrupt
      0.42 =C2=B1 18%      +0.1        0.53        perf-profile.children.cy=
cles-pp.native_queued_spin_lock_slowpath
      1.42 =C2=B1  7%      +0.1        1.53        perf-profile.children.cy=
cles-pp.swapgs_restore_regs_and_return_to_usermode
      0.91 =C2=B1 10%      +0.1        1.02 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.release_pages
      0.82 =C2=B1  9%      +0.1        0.95 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.filemap_map_pages
      1.01 =C2=B1  8%      +0.1        1.14 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.unmap_page_range
      1.07 =C2=B1  8%      +0.1        1.21 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.unmap_vmas
      1.27 =C2=B1  7%      +0.2        1.42        perf-profile.children.cy=
cles-pp.do_brk_flags
      1.57 =C2=B1  8%      +0.2        1.73 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.tlb_flush_mmu
      1.59 =C2=B1  8%      +0.2        1.77 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.tlb_finish_mmu
      1.19 =C2=B1  5%      +0.2        1.37 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.smp_apic_timer_interrupt
      1.32 =C2=B1  3%      +0.2        1.50 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.apic_timer_interrupt
      1.77 =C2=B1  9%      +0.2        1.99 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.unmap_region
      2.11 =C2=B1 10%      +0.3        2.38 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.__do_munmap
      0.90 =C2=B1 21%      +0.3        1.18 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.__libc_fork
      3.90 =C2=B1  8%      +0.3        4.23        perf-profile.children.cy=
cles-pp.__handle_mm_fault
      4.12 =C2=B1  7%      +0.3        4.46        perf-profile.children.cy=
cles-pp.handle_mm_fault
      3.14 =C2=B1  8%      +0.4        3.49 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.__x64_sys_brk
      0.74 =C2=B1 36%      +0.5        1.20        perf-profile.children.cy=
cles-pp.vma_link
      1.12 =C2=B1 29%      +0.5        1.62 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.ksys_mmap_pgoff
      1.22 =C2=B1 29%      +0.6        1.79        perf-profile.children.cy=
cles-pp.mmap_region
      1.31 =C2=B1 28%      +0.6        1.88        perf-profile.children.cy=
cles-pp.do_mmap
      1.36 =C2=B1 27%      +0.6        1.93        perf-profile.children.cy=
cles-pp.vm_mmap_pgoff
      3.32 =C2=B1 24%      +0.6        3.96 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.search_binary_handler
      3.98 =C2=B1 21%      +0.6        4.62 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.__do_execve_file
      4.00 =C2=B1 21%      +0.6        4.65 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.__x64_sys_execve
      3.07 =C2=B1 11%      +0.7        3.79 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.intel_idle
      2.40 =C2=B1 25%      +0.7        3.15 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.__x64_sys_exit_group
      2.40 =C2=B1 25%      +0.7        3.15 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.do_group_exit
      2.40 =C2=B1 25%      +0.8        3.15 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.do_exit
      3.60 =C2=B1  8%      +0.8        4.36 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.cpuidle_enter
      3.60 =C2=B1  8%      +0.8        4.36 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.cpuidle_enter_state
      2.01 =C2=B1 28%      +0.8        2.78 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.dup_mm
      3.83 =C2=B1  7%      +0.8        4.60 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.do_idle
      3.83 =C2=B1  7%      +0.8        4.60 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.secondary_startup_64
      3.83 =C2=B1  7%      +0.8        4.60 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.cpu_startup_entry
      2.31 =C2=B1 25%      +0.8        3.09 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.copy_process
      2.43 =C2=B1 24%      +0.8        3.22 =C2=B1 12%  perf-profile.childr=
en.cycles-pp._do_fork
      3.77 =C2=B1  8%      +0.8        4.60 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.start_secondary
      2.89 =C2=B1 39%      +1.1        4.01 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.unlink_file_vma
      3.24 =C2=B1 36%      +1.1        4.38 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.free_pgtables
      4.46 =C2=B1 28%      +1.3        5.72 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.exit_mmap
      4.46 =C2=B1 28%      +1.3        5.73 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.mmput
      5.02 =C2=B1 40%      +2.2        7.23 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.osq_lock
      5.33 =C2=B1 40%      +2.4        7.70 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.rwsem_down_write_slowpath
      5.50 =C2=B1 39%      +2.4        7.88 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.down_write
     17.38 =C2=B1 16%      +3.4       20.80 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.do_syscall_64
     17.43 =C2=B1 16%      +3.4       20.86 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.entry_SYSCALL_64_after_hwframe
     33.64 =C2=B1  6%      -2.9       30.71        perf-profile.self.cycles=
-pp.sieve
      9.29 =C2=B1  6%      -0.9        8.35        perf-profile.self.cycles=
-pp.string_rtns_1
      0.43 =C2=B1  9%      -0.0        0.40        perf-profile.self.cycles=
-pp.page_test
      0.14 =C2=B1  3%      -0.0        0.11 =C2=B1  4%  perf-profile.self.c=
ycles-pp.free
      0.09 =C2=B1  9%      -0.0        0.07        perf-profile.self.cycles=
-pp.memcpy
      0.08            +0.0        0.09        perf-profile.self.cycles-pp.a=
lloc_set_pte
      0.05 =C2=B1  9%      +0.0        0.07        perf-profile.self.cycles=
-pp.native_write_msr
      0.12 =C2=B1  9%      +0.0        0.14 =C2=B1  3%  perf-profile.self.c=
ycles-pp.vmacache_find
      0.10 =C2=B1 11%      +0.0        0.11 =C2=B1  4%  perf-profile.self.c=
ycles-pp._raw_spin_lock_irqsave
      0.16 =C2=B1 11%      +0.0        0.18 =C2=B1  2%  perf-profile.self.c=
ycles-pp.copy_p4d_range
      0.15 =C2=B1  5%      +0.0        0.17        perf-profile.self.cycles=
-pp.perf_iterate_sb
      0.04 =C2=B1 58%      +0.0        0.07 =C2=B1  7%  perf-profile.self.c=
ycles-pp.mem_cgroup_throttle_swaprate
      0.23 =C2=B1  8%      +0.0        0.26        perf-profile.self.cycles=
-pp.page_remove_rmap
      0.18 =C2=B1  8%      +0.0        0.21 =C2=B1  2%  perf-profile.self.c=
ycles-pp.__pagevec_lru_add_fn
      0.04 =C2=B1 58%      +0.0        0.07        perf-profile.self.cycles=
-pp.__list_add_valid
      0.08 =C2=B1 26%      +0.0        0.12 =C2=B1 13%  perf-profile.self.c=
ycles-pp.rwsem_spin_on_owner
      0.22 =C2=B1  7%      +0.0        0.26 =C2=B1  9%  perf-profile.self.c=
ycles-pp._raw_spin_lock
      0.03 =C2=B1100%      +0.0        0.07 =C2=B1  7%  perf-profile.self.c=
ycles-pp.cpuidle_enter_state
      0.41 =C2=B1  7%      +0.0        0.46        perf-profile.self.cycles=
-pp.syscall_return_via_sysret
      0.32 =C2=B1  8%      +0.0        0.36        perf-profile.self.cycles=
-pp.release_pages
      0.35 =C2=B1  7%      +0.0        0.39 =C2=B1  2%  perf-profile.self.c=
ycles-pp.swapgs_restore_regs_and_return_to_usermode
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1  9%  perf-profile.self.c=
ycles-pp.interrupt_entry
      0.56 =C2=B1  8%      +0.1        0.62        perf-profile.self.cycles=
-pp.unmap_page_range
      0.19 =C2=B1 36%      +0.1        0.29 =C2=B1 12%  perf-profile.self.c=
ycles-pp.rwsem_down_write_slowpath
      0.42 =C2=B1 18%      +0.1        0.53        perf-profile.self.cycles=
-pp.native_queued_spin_lock_slowpath
      3.07 =C2=B1 11%      +0.7        3.79 =C2=B1  3%  perf-profile.self.c=
ycles-pp.intel_idle
      4.97 =C2=B1 41%      +2.2        7.17 =C2=B1 11%  perf-profile.self.c=
ycles-pp.osq_lock



***************************************************************************=
************************
lkp-ivb-2ep1: 48 threads Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz with 64G=
 memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/te=
stcase/ucode:
  gcc-7/performance/x86_64-rhel-7.6/300t/debian-x86_64-2019-05-14.cgz/300s/=
lkp-ivb-2ep1/disk_wrt/reaim/0x42e

commit: =

  4f23dbc1e6 ("locking/rwsem: Implement lock handoff to prevent lock starva=
tion")
  00f3c5a3df ("locking/rwsem: Always release wait_lock before waking up tas=
ks")

4f23dbc1e657951e 00f3c5a3df2c1e3dab14d0dd2b7 =

---------------- --------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

          0:4           -4%           0:2     perf-profile.children.cycles-=
pp.error_entry
          0:4           -3%           0:2     perf-profile.self.cycles-pp.e=
rror_entry



***************************************************************************=
************************
lkp-bdw-ex2: 160 threads Intel(R) Xeon(R) CPU E7-8890 v4 @ 2.20GHz with 256=
G memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcase/u=
code:
  gcc-7/performance/x86_64-rhel-7.6/debian-x86_64-2019-05-14.cgz/300s/lkp-b=
dw-ex2/small-allocs/vm-scalability/0xb000036

commit: =

  4f23dbc1e6 ("locking/rwsem: Implement lock handoff to prevent lock starva=
tion")
  00f3c5a3df ("locking/rwsem: Always release wait_lock before waking up tas=
ks")

4f23dbc1e657951e 00f3c5a3df2c1e3dab14d0dd2b7 =

---------------- --------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

          2:4          -27%           1:2     perf-profile.calltrace.cycles=
-pp.error_entry.do_access
          2:4          -32%           1:2     perf-profile.children.cycles-=
pp.error_entry
          2:4          -26%           1:2     perf-profile.self.cycles-pp.e=
rror_entry
         %stddev     %change         %stddev
             \          |                \  =

      3852            -4.9%       3664        vm-scalability.time.maximum_r=
esident_set_size
      0.02 =C2=B1109%      +0.0        0.05 =C2=B1 63%  mpstat.cpu.all.soft%
     57.25            -2.2%      56.00        turbostat.PkgTmp
     53.13            +2.0%      54.21        boot-time.boot
      8844 =C2=B1  2%      +3.5%       9154        boot-time.idle
    117451 =C2=B1  5%     +14.1%     134069 =C2=B1  6%  softirqs.CPU191.TIM=
ER
     20234 =C2=B1  8%      +6.3%      21507 =C2=B1  7%  softirqs.CPU88.RCU
    615729            -1.5%     606471        proc-vmstat.nr_page_table_pag=
es
     24641            +1.4%      24974        proc-vmstat.nr_slab_reclaimab=
le
   1632391            -1.5%    1607656        proc-vmstat.nr_slab_unreclaim=
able
    717417 =C2=B1 10%     +64.0%    1176379 =C2=B1  3%  numa-numastat.node2=
.local_node
    743836 =C2=B1  9%     +58.2%    1176412 =C2=B1  3%  numa-numastat.node2=
.numa_hit
     26418 =C2=B1 30%     -99.9%      37.50 =C2=B1 44%  numa-numastat.node2=
.other_node
     15524 =C2=B1 72%    +100.3%      31101        numa-numastat.node3.othe=
r_node
      6.28 =C2=B1  8%      +9.1%       6.86 =C2=B1  8%  perf-stat.i.MPKI
      0.45 =C2=B1  5%      +0.0        0.50 =C2=B1  3%  perf-stat.i.branch-=
miss-rate%
  47984336 =C2=B1  4%      +9.8%   52679218 =C2=B1  2%  perf-stat.i.branch-=
misses
  2.18e+08 =C2=B1  8%      +9.3%  2.383e+08 =C2=B1  8%  perf-stat.i.cache-r=
eferences
   4924680 =C2=B1  6%      +7.9%    5312753 =C2=B1  7%  perf-stat.i.iTLB-lo=
ad-misses
    491869 =C2=B1  5%      +5.7%     520141 =C2=B1  4%  perf-stat.i.node-lo=
ads
      3.03 =C2=B1  5%     +13.8%       3.45 =C2=B1  9%  perf-stat.overall.M=
PKI
      0.29            +0.0        0.32        perf-stat.overall.branch-miss=
-rate%
  47906630 =C2=B1  4%      +9.8%   52585388 =C2=B1  2%  perf-stat.ps.branch=
-misses
 2.176e+08 =C2=B1  8%      +9.3%  2.379e+08 =C2=B1  8%  perf-stat.ps.cache-=
references
   4917994 =C2=B1  6%      +7.8%    5303407 =C2=B1  7%  perf-stat.ps.iTLB-l=
oad-misses
    489770 =C2=B1  5%      +5.8%     518214 =C2=B1  4%  perf-stat.ps.node-l=
oads
     17149 =C2=B1 28%     -52.0%       8235 =C2=B1  3%  sched_debug.cfs_rq:=
/.exec_clock.max
   1378506 =C2=B1 52%     -92.1%     108984 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.avg
   1439941 =C2=B1 51%     -89.9%     144995 =C2=B1  3%  sched_debug.cfs_rq:=
/.min_vruntime.max
   1173447 =C2=B1 53%     -94.3%      67349 =C2=B1 10%  sched_debug.cfs_rq:=
/.min_vruntime.min
      0.15 =C2=B1 35%     -59.2%       0.06 =C2=B1 12%  sched_debug.cfs_rq:=
/.nr_running.avg
      0.15 =C2=B1 33%     -57.3%       0.07        sched_debug.cfs_rq:/.nr_=
spread_over.avg
      1.89 =C2=B1 34%     -54.4%       0.86 =C2=B1  2%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
    176.85 =C2=B1 27%     -43.4%     100.17 =C2=B1  3%  sched_debug.cfs_rq:=
/.util_avg.avg
     94.34 =C2=B1 59%     -92.3%       7.23 =C2=B1 11%  sched_debug.cfs_rq:=
/.util_est_enqueued.avg
      1.21 =C2=B1 20%     -40.7%       0.71        sched_debug.cpu.cpu_load=
[0].avg
    450.75 =C2=B1 41%     -61.6%     173.13 =C2=B1  6%  sched_debug.cpu.cur=
r->pid.avg
      8160 =C2=B1  9%     -19.4%       6580 =C2=B1  2%  sched_debug.cpu.cur=
r->pid.max
    914.49 =C2=B1  6%     -13.8%     788.17 =C2=B1  3%  sched_debug.cpu.cur=
r->pid.stddev
     72735 =C2=B1  4%    +144.1%     177555 =C2=B1 56%  sched_debug.cpu.loa=
d.max
      1077 =C2=B1  5%     +29.6%       1396 =C2=B1 22%  sched_debug.cpu.nr_=
load_updates.stddev
      0.14 =C2=B1 43%     -61.4%       0.05 =C2=B1  7%  sched_debug.cpu.nr_=
running.avg
      0.70 =C2=B1  5%      +9.7%       0.77        sched_debug.cpu.nr_unint=
erruptible.avg
     89157 =C2=B1 40%     -81.2%      16779 =C2=B1 92%  numa-meminfo.node0.=
Active
     89092 =C2=B1 40%     -81.2%      16779 =C2=B1 92%  numa-meminfo.node0.=
Active(anon)
     60805 =C2=B1 41%     -84.3%       9523 =C2=B1100%  numa-meminfo.node0.=
AnonHugePages
     83875 =C2=B1 40%     -84.5%      13028 =C2=B1 91%  numa-meminfo.node0.=
AnonPages
    255728 =C2=B1  4%    +108.4%     532879        numa-meminfo.node2.FileP=
ages
      1763 =C2=B1 11%  +13493.2%     239750        numa-meminfo.node2.Inact=
ive
      1188 =C2=B1 46%  +20035.5%     239361        numa-meminfo.node2.Inact=
ive(anon)
     15779 =C2=B1 28%    +125.9%      35646 =C2=B1  6%  numa-meminfo.node2.=
KReclaimable
      5937 =C2=B1 10%     +68.2%       9985        numa-meminfo.node2.Kerne=
lStack
     15779 =C2=B1 28%    +125.9%      35646 =C2=B1  6%  numa-meminfo.node2.=
SReclaimable
      2215 =C2=B1 67%  +11124.7%     248655        numa-meminfo.node2.Shmem
    252853 =C2=B1  3%     +12.2%     283657        numa-meminfo.node2.Unevi=
ctable
     83953 =C2=B1 11%     +59.0%     133447 =C2=B1 20%  numa-meminfo.node3.=
Active
     83842 =C2=B1 11%     +59.1%     133371 =C2=B1 20%  numa-meminfo.node3.=
Active(anon)
     54812 =C2=B1 18%     +77.5%      97277 =C2=B1 21%  numa-meminfo.node3.=
AnonHugePages
     78034 =C2=B1 11%     +69.6%     132378 =C2=B1 20%  numa-meminfo.node3.=
AnonPages
    513368 =C2=B1  3%     -51.0%     251319        numa-meminfo.node3.FileP=
ages
    239267           -99.3%       1632 =C2=B1  2%  numa-meminfo.node3.Inact=
ive
    238889           -99.7%     667.50 =C2=B1  6%  numa-meminfo.node3.Inact=
ive(anon)
      9016 =C2=B1 18%     -33.3%       6017 =C2=B1  4%  numa-meminfo.node3.=
KernelStack
   2964209 =C2=B1  4%      -9.6%    2678216        numa-meminfo.node3.MemUs=
ed
    243897           -99.6%     862.00 =C2=B1 10%  numa-meminfo.node3.Shmem
     22271 =C2=B1 40%     -81.2%       4197 =C2=B1 92%  numa-vmstat.node0.n=
r_active_anon
     20968 =C2=B1 40%     -84.4%       3263 =C2=B1 91%  numa-vmstat.node0.n=
r_anon_pages
     22271 =C2=B1 40%     -81.2%       4197 =C2=B1 92%  numa-vmstat.node0.n=
r_zone_active_anon
     63932 =C2=B1  4%    +108.4%     133212        numa-vmstat.node2.nr_fil=
e_pages
    296.50 =C2=B1 46%  +20081.3%      59837        numa-vmstat.node2.nr_ina=
ctive_anon
      5938 =C2=B1 10%     +68.3%       9996        numa-vmstat.node2.nr_ker=
nel_stack
      1234           +12.3%       1386        numa-vmstat.node2.nr_mapped
    553.25 =C2=B1 67%  +11134.9%      62157        numa-vmstat.node2.nr_shm=
em
      3944 =C2=B1 28%    +125.9%       8910 =C2=B1  6%  numa-vmstat.node2.n=
r_slab_reclaimable
     63213 =C2=B1  3%     +12.2%      70914        numa-vmstat.node2.nr_une=
victable
    296.50 =C2=B1 46%  +20081.3%      59837        numa-vmstat.node2.nr_zon=
e_inactive_anon
     63213 =C2=B1  3%     +12.2%      70914        numa-vmstat.node2.nr_zon=
e_unevictable
    674596 =C2=B1 10%     +55.5%    1049184 =C2=B1  5%  numa-vmstat.node2.n=
uma_hit
    565285 =C2=B1 13%     +70.8%     965693 =C2=B1  5%  numa-vmstat.node2.n=
uma_local
    109311 =C2=B1  7%     -23.6%      83491        numa-vmstat.node2.numa_o=
ther
     20964 =C2=B1 11%     +59.0%      33339 =C2=B1 20%  numa-vmstat.node3.n=
r_active_anon
     19515 =C2=B1 11%     +69.6%      33089 =C2=B1 20%  numa-vmstat.node3.n=
r_anon_pages
    128296 =C2=B1  3%     -51.0%      62829        numa-vmstat.node3.nr_fil=
e_pages
     59679           -99.7%     166.50 =C2=B1  6%  numa-vmstat.node3.nr_ina=
ctive_anon
      9013 =C2=B1 18%     -33.3%       6014 =C2=B1  4%  numa-vmstat.node3.n=
r_kernel_stack
     60929           -99.6%     215.00 =C2=B1 10%  numa-vmstat.node3.nr_shm=
em
     20964 =C2=B1 11%     +59.0%      33339 =C2=B1 20%  numa-vmstat.node3.n=
r_zone_active_anon
     59679           -99.7%     166.50 =C2=B1  6%  numa-vmstat.node3.nr_zon=
e_inactive_anon
     98042 =C2=B1 11%     +16.1%     113819        numa-vmstat.node3.numa_o=
ther
      2.35 =C2=B1  7%      -0.4        1.94        perf-profile.calltrace.c=
ycles-pp.mmap64
      2.29 =C2=B1  8%      -0.4        1.89        perf-profile.calltrace.c=
ycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.mmap64
      2.29 =C2=B1  8%      -0.4        1.89        perf-profile.calltrace.c=
ycles-pp.entry_SYSCALL_64_after_hwframe.mmap64
      2.21 =C2=B1  7%      -0.4        1.83        perf-profile.calltrace.c=
ycles-pp.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.mmap64
      2.14 =C2=B1  8%      -0.4        1.78        perf-profile.calltrace.c=
ycles-pp.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after=
_hwframe.mmap64
      0.66 =C2=B1 10%      +0.1        0.77 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.scheduler_tick.update_process_times.tick_sched_handle.tick_sc=
hed_timer.__hrtimer_run_queues
      0.40 =C2=B1 57%      +0.2        0.56 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.wake_up_q.rwsem_wake.vma_link.mmap_region.do_mmap
      0.72 =C2=B1 22%      +0.2        0.90 =C2=B1 11%  perf-profile.calltr=
ace.cycles-pp.irq_enter.smp_apic_timer_interrupt.apic_timer_interrupt.cpuid=
le_enter_state.cpuidle_enter
      7.35            +0.2        7.56        perf-profile.calltrace.cycles=
-pp.do_rw_once
      1.32 =C2=B1  6%      +0.2        1.55        perf-profile.calltrace.c=
ycles-pp.tick_nohz_next_event.tick_nohz_get_sleep_length.menu_select.do_idl=
e.cpu_startup_entry
      1.69 =C2=B1  6%      +0.2        1.94 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.tick_nohz_get_sleep_length.menu_select.do_idle.cpu_startup_en=
try.start_secondary
      0.49 =C2=B1 61%      +0.3        0.74 =C2=B1 10%  perf-profile.calltr=
ace.cycles-pp.tick_irq_enter.irq_enter.smp_apic_timer_interrupt.apic_timer_=
interrupt.cpuidle_enter_state
      1.39 =C2=B1 20%      +0.3        1.72 =C2=B1 11%  perf-profile.calltr=
ace.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrt=
imer_run_queues.hrtimer_interrupt
      1.53 =C2=B1 20%      +0.4        1.89 =C2=B1 11%  perf-profile.calltr=
ace.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtim=
er_interrupt.smp_apic_timer_interrupt
      0.14 =C2=B1173%      +0.4        0.54 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.try_to_wake_up.wake_up_q.rwsem_wake.vma_link.mmap_region
      1.74 =C2=B1 18%      +0.4        2.15 =C2=B1 10%  perf-profile.calltr=
ace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.smp_a=
pic_timer_interrupt.apic_timer_interrupt
      4.31 =C2=B1  9%      +0.6        4.92 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.hrtimer_interrupt.smp_apic_timer_interrupt.apic_timer_interru=
pt.cpuidle_enter_state.cpuidle_enter
      8.64 =C2=B1  6%      +0.7        9.36 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.do_idl=
e.cpu_startup_entry
     61.25 =C2=B1  2%      +1.3       62.53        perf-profile.calltrace.c=
ycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.start_=
secondary
     61.75 =C2=B1  2%      +1.4       63.12        perf-profile.calltrace.c=
ycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.secondary_=
startup_64
     67.87 =C2=B1  2%      +1.6       69.50        perf-profile.calltrace.c=
ycles-pp.secondary_startup_64
     67.47 =C2=B1  2%      +1.7       69.17        perf-profile.calltrace.c=
ycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64
     67.47 =C2=B1  2%      +1.7       69.17        perf-profile.calltrace.c=
ycles-pp.start_secondary.secondary_startup_64
     67.41 =C2=B1  2%      +1.7       69.12        perf-profile.calltrace.c=
ycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
      2.36 =C2=B1  7%      -0.4        1.96        perf-profile.children.cy=
cles-pp.mmap64
      0.12 =C2=B1 13%      +0.0        0.15 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.run_posix_cpu_timers
      0.13 =C2=B1  5%      +0.0        0.15 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.rcu_idle_exit
      0.09 =C2=B1  7%      +0.0        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.cpu_load_update
      0.31 =C2=B1  6%      +0.0        0.34        perf-profile.children.cy=
cles-pp._raw_spin_lock
      0.23 =C2=B1  3%      +0.0        0.26 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.sched_clock
      0.08 =C2=B1 15%      +0.0        0.11 =C2=B1 18%  perf-profile.childr=
en.cycles-pp.rcu_irq_exit
      0.10 =C2=B1 21%      +0.0        0.14 =C2=B1 18%  perf-profile.childr=
en.cycles-pp.rcu_dynticks_eqs_exit
      0.04 =C2=B1 57%      +0.0        0.07 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.hrtimer_forward
      0.10 =C2=B1 26%      +0.0        0.14 =C2=B1 18%  perf-profile.childr=
en.cycles-pp.rcu_irq_enter
      0.10 =C2=B1 24%      +0.0        0.14 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.perf_event_task_tick
      0.03 =C2=B1100%      +0.0        0.07 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.irq_work_tick
      0.09 =C2=B1 22%      +0.0        0.13 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.__hrtimer_get_next_event
      0.14 =C2=B1 22%      +0.0        0.18 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.interrupt_entry
      0.30 =C2=B1  5%      +0.0        0.34        perf-profile.children.cy=
cles-pp.sched_clock_cpu
      0.05 =C2=B1 64%      +0.1        0.11 =C2=B1 23%  perf-profile.childr=
en.cycles-pp.rb_insert_color
      0.01 =C2=B1173%      +0.1        0.07 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.tick_sched_do_timer
      0.30 =C2=B1  8%      +0.1        0.35 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.find_next_bit
      0.49 =C2=B1  9%      +0.1        0.56 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.__next_timer_interrupt
      0.24 =C2=B1 25%      +0.1        0.32 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.__hrtimer_next_event_base
      0.20 =C2=B1 32%      +0.1        0.28 =C2=B1 17%  perf-profile.childr=
en.cycles-pp.timerqueue_add
      0.30 =C2=B1 10%      +0.1        0.39 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.read_tsc
      0.23 =C2=B1 30%      +0.1        0.32 =C2=B1 15%  perf-profile.childr=
en.cycles-pp.enqueue_hrtimer
      0.61 =C2=B1 22%      +0.1        0.76 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.tick_irq_enter
      0.28 =C2=B1 17%      +0.2        0.46 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.lapic_next_deadline
      0.75 =C2=B1 21%      +0.2        0.93 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.irq_enter
      1.36 =C2=B1  6%      +0.2        1.58        perf-profile.children.cy=
cles-pp.tick_nohz_next_event
      1.71 =C2=B1  5%      +0.2        1.95 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.tick_nohz_get_sleep_length
      1.59 =C2=B1 14%      +0.3        1.86 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.update_process_times
      1.73 =C2=B1 14%      +0.3        2.03 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.tick_sched_handle
      1.96 =C2=B1 13%      +0.3        2.29 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.tick_sched_timer
      3.23 =C2=B1  7%      +0.3        3.56 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.menu_select
      3.37 =C2=B1 13%      +0.4        3.76 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.__hrtimer_run_queues
      4.67 =C2=B1  7%      +0.6        5.30 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.hrtimer_interrupt
     62.12 =C2=B1  2%      +1.3       63.42        perf-profile.children.cy=
cles-pp.cpuidle_enter
     62.10 =C2=B1  2%      +1.3       63.41        perf-profile.children.cy=
cles-pp.cpuidle_enter_state
     67.88 =C2=B1  2%      +1.6       69.51        perf-profile.children.cy=
cles-pp.do_idle
     67.87 =C2=B1  2%      +1.6       69.50        perf-profile.children.cy=
cles-pp.secondary_startup_64
     67.87 =C2=B1  2%      +1.6       69.50        perf-profile.children.cy=
cles-pp.cpu_startup_entry
     67.47 =C2=B1  2%      +1.7       69.17        perf-profile.children.cy=
cles-pp.start_secondary
      0.29            -0.0        0.27        perf-profile.self.cycles-pp.d=
o_syscall_64
      0.06 =C2=B1  6%      +0.0        0.08 =C2=B1  6%  perf-profile.self.c=
ycles-pp.__perf_sw_event
      0.12 =C2=B1 13%      +0.0        0.15 =C2=B1 10%  perf-profile.self.c=
ycles-pp.run_posix_cpu_timers
      0.09 =C2=B1  7%      +0.0        0.11 =C2=B1  4%  perf-profile.self.c=
ycles-pp.cpu_load_update
      0.29 =C2=B1  6%      +0.0        0.32        perf-profile.self.cycles=
-pp._raw_spin_lock
      0.20 =C2=B1  2%      +0.0        0.23 =C2=B1  4%  perf-profile.self.c=
ycles-pp.native_sched_clock
      0.10 =C2=B1 21%      +0.0        0.13 =C2=B1 15%  perf-profile.self.c=
ycles-pp.rcu_dynticks_eqs_exit
      0.08 =C2=B1 15%      +0.0        0.11 =C2=B1 18%  perf-profile.self.c=
ycles-pp.rcu_irq_exit
      0.04 =C2=B1 59%      +0.0        0.08 =C2=B1  6%  perf-profile.self.c=
ycles-pp.__hrtimer_get_next_event
      0.04 =C2=B1 57%      +0.0        0.07 =C2=B1 14%  perf-profile.self.c=
ycles-pp.hrtimer_forward
      0.03 =C2=B1100%      +0.0        0.06        perf-profile.self.cycles=
-pp.rcu_idle_exit
      0.14 =C2=B1 19%      +0.0        0.17 =C2=B1 17%  perf-profile.self.c=
ycles-pp.interrupt_entry
      0.10 =C2=B1 24%      +0.0        0.14 =C2=B1 11%  perf-profile.self.c=
ycles-pp.perf_event_task_tick
      0.26 =C2=B1  8%      +0.0        0.30 =C2=B1  6%  perf-profile.self.c=
ycles-pp.find_next_bit
      0.06 =C2=B1 26%      +0.0        0.11        perf-profile.self.cycles=
-pp.lapic_next_deadline
      0.13 =C2=B1 13%      +0.1        0.18 =C2=B1  2%  perf-profile.self.c=
ycles-pp.hrtimer_interrupt
      0.21 =C2=B1 17%      +0.1        0.27 =C2=B1 13%  perf-profile.self.c=
ycles-pp.__hrtimer_next_event_base
      0.04 =C2=B1103%      +0.1        0.11 =C2=B1 23%  perf-profile.self.c=
ycles-pp.rb_insert_color
      0.28 =C2=B1 10%      +0.1        0.37 =C2=B1 10%  perf-profile.self.c=
ycles-pp.read_tsc
      0.85 =C2=B1 10%      +0.1        0.98 =C2=B1  4%  perf-profile.self.c=
ycles-pp.cpuidle_enter_state
      0.30 =C2=B1 35%      +0.2        0.47 =C2=B1  7%  perf-profile.self.c=
ycles-pp.tick_nohz_next_event
    519.50 =C2=B1 25%     +24.0%     644.00 =C2=B1 17%  interrupts.110:PCI-=
MSI.1574912-edge.eth1-TxRx-0
    196.25 =C2=B1  9%     +57.7%     309.50 =C2=B1 20%  interrupts.116:PCI-=
MSI.1574918-edge.eth1-TxRx-6
    310.50 =C2=B1 53%     -43.2%     176.50        interrupts.122:PCI-MSI.1=
574924-edge.eth1-TxRx-12
    183.25           +15.4%     211.50 =C2=B1 11%  interrupts.161:PCI-MSI.1=
574963-edge.eth1-TxRx-51
    180.25 =C2=B1  2%     +55.1%     279.50 =C2=B1 32%  interrupts.164:PCI-=
MSI.1574966-edge.eth1-TxRx-54
    519.50 =C2=B1 25%     +24.0%     644.00 =C2=B1 17%  interrupts.CPU0.110=
:PCI-MSI.1574912-edge.eth1-TxRx-0
      1203 =C2=B1  6%     -28.0%     866.50 =C2=B1 20%  interrupts.CPU1.NMI=
:Non-maskable_interrupts
      1203 =C2=B1  6%     -28.0%     866.50 =C2=B1 20%  interrupts.CPU1.PMI=
:Performance_monitoring_interrupts
      5359 =C2=B1 39%     +60.5%       8604 =C2=B1  6%  interrupts.CPU10.RE=
S:Rescheduling_interrupts
      5784 =C2=B1 37%     +58.5%       9168 =C2=B1 15%  interrupts.CPU11.RE=
S:Rescheduling_interrupts
    909.00 =C2=B1 26%     +39.5%       1268 =C2=B1  4%  interrupts.CPU110.N=
MI:Non-maskable_interrupts
    909.00 =C2=B1 26%     +39.5%       1268 =C2=B1  4%  interrupts.CPU110.P=
MI:Performance_monitoring_interrupts
    922.25 =C2=B1 25%     +34.0%       1236        interrupts.CPU111.NMI:No=
n-maskable_interrupts
    922.25 =C2=B1 25%     +34.0%       1236        interrupts.CPU111.PMI:Pe=
rformance_monitoring_interrupts
    922.00 =C2=B1 30%     +34.8%       1243 =C2=B1  4%  interrupts.CPU114.N=
MI:Non-maskable_interrupts
    922.00 =C2=B1 30%     +34.8%       1243 =C2=B1  4%  interrupts.CPU114.P=
MI:Performance_monitoring_interrupts
      1033 =C2=B1 24%     +19.0%       1229 =C2=B1  4%  interrupts.CPU116.N=
MI:Non-maskable_interrupts
      1033 =C2=B1 24%     +19.0%       1229 =C2=B1  4%  interrupts.CPU116.P=
MI:Performance_monitoring_interrupts
    867.50 =C2=B1 30%     +33.7%       1160 =C2=B1  7%  interrupts.CPU118.N=
MI:Non-maskable_interrupts
    867.50 =C2=B1 30%     +33.7%       1160 =C2=B1  7%  interrupts.CPU118.P=
MI:Performance_monitoring_interrupts
      6329 =C2=B1 35%     +30.5%       8260 =C2=B1 23%  interrupts.CPU119.R=
ES:Rescheduling_interrupts
    310.50 =C2=B1 53%     -43.2%     176.50        interrupts.CPU12.122:PCI=
-MSI.1574924-edge.eth1-TxRx-12
      6510 =C2=B1 26%     +25.0%       8140 =C2=B1 22%  interrupts.CPU120.R=
ES:Rescheduling_interrupts
      6814 =C2=B1 26%     +41.7%       9655        interrupts.CPU122.RES:Re=
scheduling_interrupts
      6239 =C2=B1 29%     +24.6%       7774 =C2=B1 23%  interrupts.CPU125.R=
ES:Rescheduling_interrupts
      6504 =C2=B1 28%     +25.1%       8138 =C2=B1 24%  interrupts.CPU126.R=
ES:Rescheduling_interrupts
      6206 =C2=B1 30%     +28.5%       7974 =C2=B1 22%  interrupts.CPU128.R=
ES:Rescheduling_interrupts
      6156 =C2=B1 30%     +23.8%       7620 =C2=B1 25%  interrupts.CPU129.R=
ES:Rescheduling_interrupts
      5867 =C2=B1 38%     +57.2%       9223 =C2=B1 22%  interrupts.CPU13.RE=
S:Rescheduling_interrupts
      6343 =C2=B1 29%     +22.4%       7765 =C2=B1 28%  interrupts.CPU132.R=
ES:Rescheduling_interrupts
      6263 =C2=B1 32%     +26.6%       7926 =C2=B1 27%  interrupts.CPU138.R=
ES:Rescheduling_interrupts
      1071 =C2=B1  9%     +20.7%       1294        interrupts.CPU14.NMI:Non=
-maskable_interrupts
      1071 =C2=B1  9%     +20.7%       1294        interrupts.CPU14.PMI:Per=
formance_monitoring_interrupts
      6903 =C2=B1 25%     +40.6%       9702 =C2=B1  8%  interrupts.CPU142.R=
ES:Rescheduling_interrupts
      5677 =C2=B1 40%     +53.7%       8724 =C2=B1 30%  interrupts.CPU16.RE=
S:Rescheduling_interrupts
    721.25 =C2=B1 24%     +39.3%       1004 =C2=B1 32%  interrupts.CPU160.N=
MI:Non-maskable_interrupts
    721.25 =C2=B1 24%     +39.3%       1004 =C2=B1 32%  interrupts.CPU160.P=
MI:Performance_monitoring_interrupts
    785.75 =C2=B1 29%     +27.8%       1004 =C2=B1 29%  interrupts.CPU161.N=
MI:Non-maskable_interrupts
    785.75 =C2=B1 29%     +27.8%       1004 =C2=B1 29%  interrupts.CPU161.P=
MI:Performance_monitoring_interrupts
    778.50 =C2=B1 34%     +49.2%       1161 =C2=B1  8%  interrupts.CPU162.N=
MI:Non-maskable_interrupts
    778.50 =C2=B1 34%     +49.2%       1161 =C2=B1  8%  interrupts.CPU162.P=
MI:Performance_monitoring_interrupts
      4841 =C2=B1 22%     +59.2%       7707 =C2=B1  9%  interrupts.CPU170.R=
ES:Rescheduling_interrupts
      5010 =C2=B1 26%     +41.1%       7067 =C2=B1 17%  interrupts.CPU175.R=
ES:Rescheduling_interrupts
      5333 =C2=B1 30%     +50.5%       8025 =C2=B1 11%  interrupts.CPU176.R=
ES:Rescheduling_interrupts
      4825 =C2=B1 19%     +52.4%       7354 =C2=B1 17%  interrupts.CPU179.R=
ES:Rescheduling_interrupts
    827.00 =C2=B1 36%     +38.0%       1141 =C2=B1 14%  interrupts.CPU180.N=
MI:Non-maskable_interrupts
    827.00 =C2=B1 36%     +38.0%       1141 =C2=B1 14%  interrupts.CPU180.P=
MI:Performance_monitoring_interrupts
      1266 =C2=B1  3%     -30.5%     880.00 =C2=B1 28%  interrupts.CPU2.NMI=
:Non-maskable_interrupts
      1266 =C2=B1  3%     -30.5%     880.00 =C2=B1 28%  interrupts.CPU2.PMI=
:Performance_monitoring_interrupts
      6759 =C2=B1 31%     +36.8%       9246 =C2=B1  5%  interrupts.CPU20.RE=
S:Rescheduling_interrupts
      5976 =C2=B1 35%     +41.2%       8438 =C2=B1 14%  interrupts.CPU21.RE=
S:Rescheduling_interrupts
      5601 =C2=B1 39%     +72.7%       9674 =C2=B1 14%  interrupts.CPU22.RE=
S:Rescheduling_interrupts
      6356 =C2=B1 30%     +34.8%       8568 =C2=B1 14%  interrupts.CPU25.RE=
S:Rescheduling_interrupts
      6356 =C2=B1 29%     +24.6%       7922 =C2=B1 22%  interrupts.CPU26.RE=
S:Rescheduling_interrupts
      1287 =C2=B1  4%      -5.7%       1213        interrupts.CPU27.NMI:Non=
-maskable_interrupts
      1287 =C2=B1  4%      -5.7%       1213        interrupts.CPU27.PMI:Per=
formance_monitoring_interrupts
      6381 =C2=B1 29%     +42.2%       9075 =C2=B1 10%  interrupts.CPU27.RE=
S:Rescheduling_interrupts
      6168 =C2=B1 28%     +27.0%       7833 =C2=B1 23%  interrupts.CPU28.RE=
S:Rescheduling_interrupts
      6346 =C2=B1 29%     +25.3%       7955 =C2=B1 24%  interrupts.CPU29.RE=
S:Rescheduling_interrupts
      6413 =C2=B1 26%     +26.7%       8128 =C2=B1 23%  interrupts.CPU30.RE=
S:Rescheduling_interrupts
      6115 =C2=B1 33%     +70.4%      10417 =C2=B1  7%  interrupts.CPU31.RE=
S:Rescheduling_interrupts
      6226 =C2=B1 28%     +26.1%       7853 =C2=B1 25%  interrupts.CPU32.RE=
S:Rescheduling_interrupts
      5697 =C2=B1 33%     +69.0%       9630 =C2=B1 11%  interrupts.CPU4.RES=
:Rescheduling_interrupts
      6328 =C2=B1 27%     +38.1%       8740 =C2=B1  8%  interrupts.CPU41.RE=
S:Rescheduling_interrupts
      6079 =C2=B1 31%     +22.8%       7465 =C2=B1 28%  interrupts.CPU42.RE=
S:Rescheduling_interrupts
      6296 =C2=B1 26%     +20.2%       7565 =C2=B1 25%  interrupts.CPU44.RE=
S:Rescheduling_interrupts
      6309 =C2=B1 32%     +25.8%       7939 =C2=B1 27%  interrupts.CPU47.RE=
S:Rescheduling_interrupts
    927.75 =C2=B1 33%     +41.3%       1310 =C2=B1  3%  interrupts.CPU48.NM=
I:Non-maskable_interrupts
    927.75 =C2=B1 33%     +41.3%       1310 =C2=B1  3%  interrupts.CPU48.PM=
I:Performance_monitoring_interrupts
    701.75 =C2=B1 18%     +69.4%       1188 =C2=B1  7%  interrupts.CPU50.NM=
I:Non-maskable_interrupts
    701.75 =C2=B1 18%     +69.4%       1188 =C2=B1  7%  interrupts.CPU50.PM=
I:Performance_monitoring_interrupts
    183.25           +15.4%     211.50 =C2=B1 11%  interrupts.CPU51.161:PCI=
-MSI.1574963-edge.eth1-TxRx-51
    180.25 =C2=B1  2%     +55.1%     279.50 =C2=B1 32%  interrupts.CPU54.16=
4:PCI-MSI.1574966-edge.eth1-TxRx-54
      1273           -23.5%     974.00 =C2=B1 13%  interrupts.CPU54.NMI:Non=
-maskable_interrupts
      1273           -23.5%     974.00 =C2=B1 13%  interrupts.CPU54.PMI:Per=
formance_monitoring_interrupts
      1250 =C2=B1  2%     -27.2%     910.50 =C2=B1  3%  interrupts.CPU55.NM=
I:Non-maskable_interrupts
      1250 =C2=B1  2%     -27.2%     910.50 =C2=B1  3%  interrupts.CPU55.PM=
I:Performance_monitoring_interrupts
      6200 =C2=B1 26%     +43.9%       8925 =C2=B1 22%  interrupts.CPU55.RE=
S:Rescheduling_interrupts
      6497 =C2=B1 23%     +34.0%       8708 =C2=B1 16%  interrupts.CPU58.RE=
S:Rescheduling_interrupts
    196.25 =C2=B1  9%     +57.7%     309.50 =C2=B1 20%  interrupts.CPU6.116=
:PCI-MSI.1574918-edge.eth1-TxRx-6
      1197 =C2=B1 10%     -43.8%     673.00 =C2=B1  3%  interrupts.CPU64.NM=
I:Non-maskable_interrupts
      1197 =C2=B1 10%     -43.8%     673.00 =C2=B1  3%  interrupts.CPU64.PM=
I:Performance_monitoring_interrupts
      1286 =C2=B1  4%     -48.6%     661.50        interrupts.CPU65.NMI:Non=
-maskable_interrupts
      1286 =C2=B1  4%     -48.6%     661.50        interrupts.CPU65.PMI:Per=
formance_monitoring_interrupts
      1059 =C2=B1 27%     -51.1%     518.50 =C2=B1  8%  interrupts.CPU68.NM=
I:Non-maskable_interrupts
      1059 =C2=B1 27%     -51.1%     518.50 =C2=B1  8%  interrupts.CPU68.PM=
I:Performance_monitoring_interrupts
      1076 =C2=B1 25%     -50.0%     537.50        interrupts.CPU69.NMI:Non=
-maskable_interrupts
      1076 =C2=B1 25%     -50.0%     537.50        interrupts.CPU69.PMI:Per=
formance_monitoring_interrupts
      5701 =C2=B1 21%     +40.9%       8032 =C2=B1 20%  interrupts.CPU72.RE=
S:Rescheduling_interrupts
      5004 =C2=B1 30%     +51.4%       7576 =C2=B1 18%  interrupts.CPU73.RE=
S:Rescheduling_interrupts
      5079 =C2=B1 34%     +53.5%       7796 =C2=B1 16%  interrupts.CPU74.RE=
S:Rescheduling_interrupts
      4924 =C2=B1 33%     +64.4%       8098 =C2=B1  2%  interrupts.CPU75.RE=
S:Rescheduling_interrupts
      1056 =C2=B1 24%     -44.4%     587.00 =C2=B1  2%  interrupts.CPU77.NM=
I:Non-maskable_interrupts
      1056 =C2=B1 24%     -44.4%     587.00 =C2=B1  2%  interrupts.CPU77.PM=
I:Performance_monitoring_interrupts
      5362 =C2=B1 25%     +44.7%       7759 =C2=B1 13%  interrupts.CPU77.RE=
S:Rescheduling_interrupts
      5660 =C2=B1 37%     +37.9%       7807 =C2=B1 20%  interrupts.CPU8.RES=
:Rescheduling_interrupts
      4760 =C2=B1 26%     +58.6%       7549 =C2=B1 14%  interrupts.CPU81.RE=
S:Rescheduling_interrupts
    786.50 =C2=B1 34%     +41.9%       1116 =C2=B1 16%  interrupts.CPU83.NM=
I:Non-maskable_interrupts
    786.50 =C2=B1 34%     +41.9%       1116 =C2=B1 16%  interrupts.CPU83.PM=
I:Performance_monitoring_interrupts
      5101 =C2=B1 29%     +58.7%       8095 =C2=B1  8%  interrupts.CPU83.RE=
S:Rescheduling_interrupts
      5037 =C2=B1 25%     +56.7%       7895 =C2=B1  4%  interrupts.CPU86.RE=
S:Rescheduling_interrupts
      5031 =C2=B1 24%     +33.8%       6731 =C2=B1  8%  interrupts.CPU89.RE=
S:Rescheduling_interrupts
      5011 =C2=B1 20%     +35.5%       6789 =C2=B1  5%  interrupts.CPU90.RE=
S:Rescheduling_interrupts
      5051 =C2=B1 21%     +43.0%       7224 =C2=B1  6%  interrupts.CPU91.RE=
S:Rescheduling_interrupts
      5231 =C2=B1 17%     +41.0%       7373 =C2=B1 12%  interrupts.CPU93.RE=
S:Rescheduling_interrupts
   1156218 =C2=B1 26%     +23.3%    1425107 =C2=B1 18%  interrupts.RES:Resc=
heduling_interrupts



***************************************************************************=
************************
lkp-hsw-4ex1: 144 threads Intel(R) Xeon(R) CPU E7-8890 v3 @ 2.50GHz with 51=
2G memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/iterations/kconfig/nr_task/rootfs/tbox_group/test=
/testcase/ucode:
  gcc-7/performance/30/x86_64-rhel-7.6/1600%/debian-x86_64-2019-05-14.cgz/l=
kp-hsw-4ex1/dbase/reaim/0x14

commit: =

  4f23dbc1e6 ("locking/rwsem: Implement lock handoff to prevent lock starva=
tion")
  00f3c5a3df ("locking/rwsem: Always release wait_lock before waking up tas=
ks")

4f23dbc1e657951e 00f3c5a3df2c1e3dab14d0dd2b7 =

---------------- --------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :4           14%           0:2     perf-profile.calltrace.cycles=
-pp.error_entry
          1:4           -8%           1:2     perf-profile.children.cycles-=
pp.error_entry
          1:4           -7%           0:2     perf-profile.self.cycles-pp.e=
rror_entry
         %stddev     %change         %stddev
             \          |                \  =

    442.37 =C2=B1  3%      -5.1%     419.99 =C2=B1  2%  reaim.child_systime
     13286 =C2=B1  3%      -5.1%      12615 =C2=B1  2%  reaim.time.system_t=
ime
    111693 =C2=B1  6%     +10.8%     123765        meminfo.Shmem
     26070 =C2=B1 22%     +39.0%      36245        numa-numastat.node3.othe=
r_node
     38.05 =C2=B1  2%      +3.3%      39.30        boot-time.boot
      4698 =C2=B1  2%      +4.2%       4897        boot-time.idle
     87.32 =C2=B1  8%     -12.7%      76.27 =C2=B1  2%  sched_debug.cpu.clo=
ck.stddev
     87.32 =C2=B1  8%     -12.7%      76.27 =C2=B1  2%  sched_debug.cpu.clo=
ck_task.stddev
     28159 =C2=B1 19%     -28.9%      20019        numa-vmstat.node1.nr_sla=
b_unreclaimable
     98486 =C2=B1 11%     +17.2%     115461 =C2=B1  4%  numa-vmstat.node2.n=
r_anon_pages
     19281 =C2=B1  3%     +15.5%      22264 =C2=B1 10%  numa-vmstat.node3.n=
r_kernel_stack
     23454           +16.2%      27253 =C2=B1  9%  numa-vmstat.node3.nr_sla=
b_unreclaimable
    107391 =C2=B1  5%      +9.7%     117758        numa-vmstat.node3.numa_o=
ther
    150.50 =C2=B1  3%     +14.6%     172.50 =C2=B1  3%  proc-vmstat.nr_dirt=
ied
    283397            +1.5%     287623        proc-vmstat.nr_file_pages
     27944 =C2=B1  6%     +10.5%      30887        proc-vmstat.nr_shmem
    150.50 =C2=B1  3%     +14.3%     172.00 =C2=B1  3%  proc-vmstat.nr_writ=
ten
     49856 =C2=B1  4%      +4.2%      51959        proc-vmstat.pgactivate
      5655 =C2=B1 11%     +12.7%       6376 =C2=B1 10%  numa-meminfo.node1.=
Mapped
    112281 =C2=B1 19%     -28.6%      80154        numa-meminfo.node1.SUnre=
claim
     28102 =C2=B1117%    +196.1%      83206 =C2=B1  4%  numa-meminfo.node2.=
AnonHugePages
    393685 =C2=B1 11%     +17.6%     463066 =C2=B1  4%  numa-meminfo.node2.=
AnonPages
     19251 =C2=B1  4%     +17.0%      22515 =C2=B1 10%  numa-meminfo.node3.=
KernelStack
     93821           +16.6%     109402 =C2=B1  9%  numa-meminfo.node3.SUnre=
claim
     90973 =C2=B1  2%      +2.5%      93275        perf-stat.i.context-swit=
ches
      1.61 =C2=B1  2%      -5.8%       1.52        perf-stat.i.cpi
     26562            +1.4%      26929        perf-stat.i.cpu-migrations
  22500284            +2.5%   23068436        perf-stat.i.dTLB-store-misses
  13732559 =C2=B1  5%      -8.0%   12628121        perf-stat.i.iTLB-load-mi=
sses
     15609 =C2=B1  3%      +8.3%      16896        perf-stat.i.instructions=
-per-iTLB-miss
      0.82            +1.5%       0.84        perf-stat.i.ipc
  35101206            +1.1%   35493977        perf-stat.i.node-load-misses
      0.12            +0.0        0.12        perf-stat.overall.dTLB-store-=
miss-rate%
     16572 =C2=B1  3%      +8.1%      17908        perf-stat.overall.instru=
ctions-per-iTLB-miss
     26438            +1.3%      26785        perf-stat.ps.cpu-migrations
  22411063            +2.5%   22965030        perf-stat.ps.dTLB-store-misses
  13678545 =C2=B1  5%      -8.1%   12571691        perf-stat.ps.iTLB-load-m=
isses
  34938255            +1.0%   35300180        perf-stat.ps.node-load-misses
    844.25 =C2=B1 10%     +31.1%       1106 =C2=B1  3%  slabinfo.biovec-128=
.active_objs
    844.25 =C2=B1 10%     +31.1%       1106 =C2=B1  3%  slabinfo.biovec-128=
.num_objs
      1555 =C2=B1 10%     +22.4%       1904 =C2=B1  3%  slabinfo.dmaengine-=
unmap-16.active_objs
      1555 =C2=B1 10%     +22.4%       1904 =C2=B1  3%  slabinfo.dmaengine-=
unmap-16.num_objs
      3626 =C2=B1  8%     +19.3%       4325 =C2=B1  8%  slabinfo.eventpoll_=
pwq.active_objs
      3626 =C2=B1  8%     +19.3%       4325 =C2=B1  8%  slabinfo.eventpoll_=
pwq.num_objs
    697.00 =C2=B1  7%     -11.2%     619.00        slabinfo.file_lock_cache=
.active_objs
    697.00 =C2=B1  7%     -11.2%     619.00        slabinfo.file_lock_cache=
.num_objs
      4278 =C2=B1  6%     +26.2%       5399 =C2=B1  8%  slabinfo.kmalloc-rc=
l-64.active_objs
      4278 =C2=B1  6%     +26.2%       5399 =C2=B1  8%  slabinfo.kmalloc-rc=
l-64.num_objs
     88376 =C2=B1 17%     -40.0%      53057        slabinfo.lsm_file_cache.=
active_objs
    344.75 =C2=B1 17%     -40.0%     207.00        slabinfo.lsm_file_cache.=
active_slabs
     88376 =C2=B1 17%     -40.0%      53057        slabinfo.lsm_file_cache.=
num_objs
    344.75 =C2=B1 17%     -40.0%     207.00        slabinfo.lsm_file_cache.=
num_slabs
      1391 =C2=B1 13%     +23.5%       1717        slabinfo.nfs_read_data.a=
ctive_objs
      1391 =C2=B1 13%     +23.5%       1717        slabinfo.nfs_read_data.n=
um_objs
      1663 =C2=B1 11%     +40.6%       2340 =C2=B1  8%  slabinfo.skbuff_ext=
_cache.active_objs
      1663 =C2=B1 11%     +40.6%       2340 =C2=B1  8%  slabinfo.skbuff_ext=
_cache.num_objs
      1808 =C2=B1 18%     +17.6%       2126 =C2=B1  6%  slabinfo.skbuff_fcl=
one_cache.active_objs
      1808 =C2=B1 18%     +17.6%       2126 =C2=B1  6%  slabinfo.skbuff_fcl=
one_cache.num_objs
    937.75 =C2=B1 11%     +28.2%       1202        slabinfo.xfrm_state.acti=
ve_objs
    937.75 =C2=B1 11%     +28.2%       1202        slabinfo.xfrm_state.num_=
objs
    356.25 =C2=B1 34%    +209.1%       1101 =C2=B1 18%  interrupts.47:PCI-M=
SI.1572866-edge.eth0-TxRx-2
    514.25 =C2=B1 21%     -46.3%     276.00        interrupts.48:PCI-MSI.15=
72867-edge.eth0-TxRx-3
    349.50 =C2=B1 45%    +124.2%     783.50 =C2=B1  6%  interrupts.52:PCI-M=
SI.1572871-edge.eth0-TxRx-7
    388.25 =C2=B1 44%     -34.4%     254.50 =C2=B1  2%  interrupts.57:PCI-M=
SI.1572876-edge.eth0-TxRx-12
    259.50 =C2=B1  3%    +105.8%     534.00 =C2=B1 50%  interrupts.60:PCI-M=
SI.1572879-edge.eth0-TxRx-15
      4201 =C2=B1 67%    -100.0%       1.50 =C2=B1 33%  interrupts.CPU102.N=
MI:Non-maskable_interrupts
      4201 =C2=B1 67%    -100.0%       1.50 =C2=B1 33%  interrupts.CPU102.P=
MI:Performance_monitoring_interrupts
      6610 =C2=B1  6%      +6.0%       7008 =C2=B1  5%  interrupts.CPU104.C=
AL:Function_call_interrupts
      2142 =C2=B1  9%      +8.7%       2328 =C2=B1  7%  interrupts.CPU107.T=
LB:TLB_shootdowns
      3156 =C2=B1100%    +110.9%       6658        interrupts.CPU108.NMI:No=
n-maskable_interrupts
      3156 =C2=B1100%    +110.9%       6658        interrupts.CPU108.PMI:Pe=
rformance_monitoring_interrupts
      2160 =C2=B1 10%     +11.1%       2399 =C2=B1  5%  interrupts.CPU112.T=
LB:TLB_shootdowns
      1430 =C2=B1150%    +245.3%       4938 =C2=B1 33%  interrupts.CPU119.N=
MI:Non-maskable_interrupts
      1430 =C2=B1150%    +245.3%       4938 =C2=B1 33%  interrupts.CPU119.P=
MI:Performance_monitoring_interrupts
    388.25 =C2=B1 44%     -34.4%     254.50 =C2=B1  2%  interrupts.CPU12.57=
:PCI-MSI.1572876-edge.eth0-TxRx-12
      1678 =C2=B1160%    +304.1%       6781 =C2=B1  3%  interrupts.CPU13.NM=
I:Non-maskable_interrupts
      1678 =C2=B1160%    +304.1%       6781 =C2=B1  3%  interrupts.CPU13.PM=
I:Performance_monitoring_interrupts
      2866 =C2=B1101%    -100.0%       0.50 =C2=B1100%  interrupts.CPU131.N=
MI:Non-maskable_interrupts
      2866 =C2=B1101%    -100.0%       0.50 =C2=B1100%  interrupts.CPU131.P=
MI:Performance_monitoring_interrupts
      1572 =C2=B1170%    +314.2%       6515        interrupts.CPU137.NMI:No=
n-maskable_interrupts
      1572 =C2=B1170%    +314.2%       6515        interrupts.CPU137.PMI:Pe=
rformance_monitoring_interrupts
      3900 =C2=B1 65%     +67.4%       6529 =C2=B1  2%  interrupts.CPU141.N=
MI:Non-maskable_interrupts
      3900 =C2=B1 65%     +67.4%       6529 =C2=B1  2%  interrupts.CPU141.P=
MI:Performance_monitoring_interrupts
    259.50 =C2=B1  3%    +105.8%     534.00 =C2=B1 50%  interrupts.CPU15.60=
:PCI-MSI.1572879-edge.eth0-TxRx-15
     10701 =C2=B1  4%      -9.7%       9658        interrupts.CPU15.RES:Res=
cheduling_interrupts
    356.25 =C2=B1 34%    +209.1%       1101 =C2=B1 18%  interrupts.CPU2.47:=
PCI-MSI.1572866-edge.eth0-TxRx-2
      4498 =C2=B1 49%    -100.0%       2.00        interrupts.CPU22.NMI:Non=
-maskable_interrupts
      4498 =C2=B1 49%    -100.0%       2.00        interrupts.CPU22.PMI:Per=
formance_monitoring_interrupts
      4182 =C2=B1 63%     -98.2%      75.50 =C2=B1 90%  interrupts.CPU23.NM=
I:Non-maskable_interrupts
      4182 =C2=B1 63%     -98.2%      75.50 =C2=B1 90%  interrupts.CPU23.PM=
I:Performance_monitoring_interrupts
      2150 =C2=B1 12%     +30.9%       2814 =C2=B1 23%  interrupts.CPU26.TL=
B:TLB_shootdowns
    514.25 =C2=B1 21%     -46.3%     276.00        interrupts.CPU3.48:PCI-M=
SI.1572867-edge.eth0-TxRx-3
      2126 =C2=B1  8%      +9.1%       2319 =C2=B1  5%  interrupts.CPU37.TL=
B:TLB_shootdowns
      3959 =C2=B1 57%     +69.3%       6704        interrupts.CPU42.NMI:Non=
-maskable_interrupts
      3959 =C2=B1 57%     +69.3%       6704        interrupts.CPU42.PMI:Per=
formance_monitoring_interrupts
      4068 =C2=B1 34%     -85.2%     603.50 =C2=B1 99%  interrupts.CPU47.NM=
I:Non-maskable_interrupts
      4068 =C2=B1 34%     -85.2%     603.50 =C2=B1 99%  interrupts.CPU47.PM=
I:Performance_monitoring_interrupts
      6374 =C2=B1  4%      +6.3%       6776 =C2=B1  5%  interrupts.CPU48.CA=
L:Function_call_interrupts
      2782 =C2=B1 76%    -100.0%       0.50 =C2=B1100%  interrupts.CPU58.NM=
I:Non-maskable_interrupts
      2782 =C2=B1 76%    -100.0%       0.50 =C2=B1100%  interrupts.CPU58.PM=
I:Performance_monitoring_interrupts
      3930 =C2=B1 68%     +70.1%       6684        interrupts.CPU60.NMI:Non=
-maskable_interrupts
      3930 =C2=B1 68%     +70.1%       6684        interrupts.CPU60.PMI:Per=
formance_monitoring_interrupts
      2355 =C2=B1108%    +110.9%       4966 =C2=B1 31%  interrupts.CPU62.NM=
I:Non-maskable_interrupts
      2355 =C2=B1108%    +110.9%       4966 =C2=B1 31%  interrupts.CPU62.PM=
I:Performance_monitoring_interrupts
      3140 =C2=B1 70%    +110.4%       6608        interrupts.CPU63.NMI:Non=
-maskable_interrupts
      3140 =C2=B1 70%    +110.4%       6608        interrupts.CPU63.PMI:Per=
formance_monitoring_interrupts
      3356 =C2=B1 71%    -100.0%       0.00        interrupts.CPU65.NMI:Non=
-maskable_interrupts
      3356 =C2=B1 71%    -100.0%       0.00        interrupts.CPU65.PMI:Per=
formance_monitoring_interrupts
      2113 =C2=B1 11%     +11.1%       2348 =C2=B1  6%  interrupts.CPU66.TL=
B:TLB_shootdowns
    349.50 =C2=B1 45%    +124.2%     783.50 =C2=B1  6%  interrupts.CPU7.52:=
PCI-MSI.1572871-edge.eth0-TxRx-7
      6486 =C2=B1  3%      +9.3%       7091        interrupts.CPU7.CAL:Func=
tion_call_interrupts
      1.25 =C2=B1173%  +5.3e+05%       6593        interrupts.CPU7.NMI:Non-=
maskable_interrupts
      1.25 =C2=B1173%  +5.3e+05%       6593        interrupts.CPU7.PMI:Perf=
ormance_monitoring_interrupts
      2089 =C2=B1  9%     +11.5%       2330 =C2=B1 11%  interrupts.CPU74.TL=
B:TLB_shootdowns
      5708 =C2=B1 27%     -99.5%      26.00 =C2=B1 76%  interrupts.CPU79.NM=
I:Non-maskable_interrupts
      5708 =C2=B1 27%     -99.5%      26.00 =C2=B1 76%  interrupts.CPU79.PM=
I:Performance_monitoring_interrupts
    846.25 =C2=B1168%    +316.0%       3520 =C2=B1 89%  interrupts.CPU83.NM=
I:Non-maskable_interrupts
    846.25 =C2=B1168%    +316.0%       3520 =C2=B1 89%  interrupts.CPU83.PM=
I:Performance_monitoring_interrupts
      2117 =C2=B1 10%     +10.4%       2337 =C2=B1  6%  interrupts.CPU84.TL=
B:TLB_shootdowns
      3002 =C2=B1 73%    +122.1%       6667        interrupts.CPU9.NMI:Non-=
maskable_interrupts
      3002 =C2=B1 73%    +122.1%       6667        interrupts.CPU9.PMI:Perf=
ormance_monitoring_interrupts
      2132 =C2=B1  8%      +8.8%       2320 =C2=B1  6%  interrupts.CPU93.TL=
B:TLB_shootdowns
      2002 =C2=B1110%    +144.9%       4904 =C2=B1 31%  interrupts.CPU94.NM=
I:Non-maskable_interrupts
      2002 =C2=B1110%    +144.9%       4904 =C2=B1 31%  interrupts.CPU94.PM=
I:Performance_monitoring_interrupts
      2099 =C2=B1  7%     +13.1%       2375 =C2=B1  3%  interrupts.CPU96.TL=
B:TLB_shootdowns
      1896 =C2=B1144%    +257.9%       6786        interrupts.CPU99.NMI:Non=
-maskable_interrupts
      1896 =C2=B1144%    +257.9%       6786        interrupts.CPU99.PMI:Per=
formance_monitoring_interrupts
     17.22 =C2=B1 68%     -17.2        0.00        perf-profile.calltrace.c=
ycles-pp.sieve
      4.71 =C2=B1 68%      -4.7        0.00        perf-profile.calltrace.c=
ycles-pp.string_rtns_1
      0.13 =C2=B1173%      +0.4        0.52 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.entry_SYSCALL_64_after_hwframe.setlocale
      0.18 =C2=B1173%      +0.5        0.67 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.task_tick_fair.scheduler_tick.update_process_times.tick_sched=
_handle.tick_sched_timer
      0.35 =C2=B1108%      +0.5        0.85 =C2=B1 11%  perf-profile.calltr=
ace.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtim=
er_interrupt.smp_apic_timer_interrupt
      0.19 =C2=B1173%      +0.5        0.70 =C2=B1 15%  perf-profile.calltr=
ace.cycles-pp.clear_page_erms.prep_new_page.get_page_from_freelist.__alloc_=
pages_nodemask.alloc_pages_vma
      0.36 =C2=B1107%      +0.5        0.88 =C2=B1 11%  perf-profile.calltr=
ace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.smp_a=
pic_timer_interrupt.apic_timer_interrupt
      0.20 =C2=B1173%      +0.5        0.74 =C2=B1 14%  perf-profile.calltr=
ace.cycles-pp.prep_new_page.get_page_from_freelist.__alloc_pages_nodemask.a=
lloc_pages_vma.do_anonymous_page
      0.87 =C2=B1 38%      +0.6        1.44 =C2=B1 15%  perf-profile.calltr=
ace.cycles-pp.tlb_flush_mmu.tlb_finish_mmu.unmap_region.__do_munmap.__x64_s=
ys_brk
      0.20 =C2=B1173%      +0.6        0.77 =C2=B1 10%  perf-profile.calltr=
ace.cycles-pp.scheduler_tick.update_process_times.tick_sched_handle.tick_sc=
hed_timer.__hrtimer_run_queues
      0.88 =C2=B1 38%      +0.6        1.46 =C2=B1 15%  perf-profile.calltr=
ace.cycles-pp.tlb_finish_mmu.unmap_region.__do_munmap.__x64_sys_brk.do_sysc=
all_64
      0.41 =C2=B1107%      +0.6        0.99 =C2=B1 11%  perf-profile.calltr=
ace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.smp_apic_timer_interru=
pt.apic_timer_interrupt
      0.45 =C2=B1106%      +0.6        1.04 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_vma=
.do_anonymous_page.__handle_mm_fault
      0.20 =C2=B1173%      +0.6        0.79 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.native_flush_tlb_one_user.flush_tlb_func_common.flush_tlb_mm_=
range.tlb_flush_mmu.tlb_finish_mmu
      0.20 =C2=B1173%      +0.6        0.80 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.flush_tlb_func_common.flush_tlb_mm_range.tlb_flush_mmu.tlb_fi=
nish_mmu.unmap_region
      0.40 =C2=B1107%      +0.6        1.00 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.setlocale
      0.23 =C2=B1173%      +0.6        0.84 =C2=B1 11%  perf-profile.calltr=
ace.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrt=
imer_run_queues.hrtimer_interrupt
      0.46 =C2=B1107%      +0.7        1.11 =C2=B1 11%  perf-profile.calltr=
ace.cycles-pp.hrtimer_interrupt.smp_apic_timer_interrupt.apic_timer_interru=
pt
      0.20 =C2=B1173%      +0.7        0.86 =C2=B1 17%  perf-profile.calltr=
ace.cycles-pp.flush_tlb_mm_range.tlb_flush_mmu.tlb_finish_mmu.unmap_region.=
__do_munmap
      0.38 =C2=B1102%      +0.7        1.06 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.filemap_map_pages.__handle_mm_fault.handle_mm_fault.__do_page=
_fault.do_page_fault
      0.55 =C2=B1107%      +0.7        1.27 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.__alloc_pages_nodemask.alloc_pages_vma.do_anonymous_page.__ha=
ndle_mm_fault.handle_mm_fault
      1.16 =C2=B1 39%      +0.7        1.89 =C2=B1 14%  perf-profile.calltr=
ace.cycles-pp.unmap_region.__do_munmap.__x64_sys_brk.do_syscall_64.entry_SY=
SCALL_64_after_hwframe
      0.59 =C2=B1107%      +0.8        1.39 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.alloc_pages_vma.do_anonymous_page.__handle_mm_fault.handle_mm=
_fault.__do_page_fault
      0.58 =C2=B1108%      +0.8        1.39 =C2=B1 11%  perf-profile.calltr=
ace.cycles-pp.smp_apic_timer_interrupt.apic_timer_interrupt
      0.54 =C2=B1107%      +0.8        1.35 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.prepare_exit_to_usermode.swapgs_restore_regs_and_return_to_us=
ermode
      0.59 =C2=B1108%      +0.8        1.42 =C2=B1 11%  perf-profile.calltr=
ace.cycles-pp.apic_timer_interrupt
      0.64 =C2=B1110%      +1.0        1.65 =C2=B1 12%  perf-profile.calltr=
ace.cycles-pp.do_brk_flags.__x64_sys_brk.do_syscall_64.entry_SYSCALL_64_aft=
er_hwframe
      0.73 =C2=B1107%      +1.1        1.82 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.swapgs_restore_regs_and_return_to_usermode
      1.57 =C2=B1 51%      +1.1        2.69 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.do_anonymous_page.__handle_mm_fault.handle_mm_fault.__do_page=
_fault.do_page_fault
      0.80 =C2=B1110%      +1.3        2.06 =C2=B1 14%  perf-profile.calltr=
ace.cycles-pp.__do_munmap.__x64_sys_brk.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe
      2.92 =C2=B1 37%      +2.2        5.11 =C2=B1 17%  perf-profile.calltr=
ace.cycles-pp.__handle_mm_fault.handle_mm_fault.__do_page_fault.do_page_fau=
lt.page_fault
      1.59 =C2=B1110%      +2.5        4.06 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.__x64_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.56 =C2=B1 62%      +2.8        5.37 =C2=B1 17%  perf-profile.calltr=
ace.cycles-pp.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      2.96 =C2=B1 63%      +3.2        6.16 =C2=B1 16%  perf-profile.calltr=
ace.cycles-pp.__do_page_fault.do_page_fault.page_fault
      3.06 =C2=B1 63%      +3.3        6.33 =C2=B1 16%  perf-profile.calltr=
ace.cycles-pp.do_page_fault.page_fault
      3.10 =C2=B1 63%      +3.3        6.41 =C2=B1 16%  perf-profile.calltr=
ace.cycles-pp.page_fault
     15.46 =C2=B1 36%     +16.9       32.39 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_star=
tup_entry
     16.01 =C2=B1 35%     +17.2       33.22 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.s=
tart_secondary
     16.04 =C2=B1 35%     +17.2       33.26 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.secon=
dary_startup_64
     16.41 =C2=B1 34%     +17.4       33.85 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
     16.41 =C2=B1 34%     +17.4       33.85 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64
     16.41 =C2=B1 34%     +17.4       33.85 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.start_secondary.secondary_startup_64
     16.53 =C2=B1 34%     +17.5       34.08 =C2=B1 12%  perf-profile.calltr=
ace.cycles-pp.secondary_startup_64
     17.23 =C2=B1 68%     -17.2        0.00        perf-profile.children.cy=
cles-pp.sieve
      4.75 =C2=B1 68%      -4.7        0.00        perf-profile.children.cy=
cles-pp.string_rtns_1
      0.34 =C2=B1 24%      -0.1        0.22        perf-profile.children.cy=
cles-pp.__xstat64
      0.08 =C2=B1 10%      +0.0        0.10 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.perf_mux_hrtimer_handler
      0.07 =C2=B1 34%      +0.0        0.10 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.mem_cgroup_uncharge_list
      0.11 =C2=B1 27%      +0.0        0.14 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.ksys_read
      0.05 =C2=B1 63%      +0.0        0.09 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.mem_cgroup_charge_statistics
      0.09 =C2=B1 33%      +0.0        0.13 =C2=B1 15%  perf-profile.childr=
en.cycles-pp.__mod_lruvec_state
      0.09 =C2=B1 26%      +0.0        0.13 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.new_sync_read
      0.03 =C2=B1100%      +0.0        0.07 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.__update_load_avg_se
      0.11 =C2=B1 30%      +0.0        0.15 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.trailing_symlink
      0.03 =C2=B1102%      +0.0        0.07 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.page_get_link
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.schedule_tail
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.arch_dup_task_struct
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.migration_cpu_stop
      0.10 =C2=B1 18%      +0.0        0.14 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.clockevents_program_event
      0.03 =C2=B1100%      +0.0        0.08 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.free_pgd_range
      0.05 =C2=B1 64%      +0.0        0.10 =C2=B1  5%  perf-profile.childr=
en.cycles-pp._raw_spin_unlock_irqrestore
      0.04 =C2=B1102%      +0.0        0.08 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.up_read
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.copy_user_generic_unrolled
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.cap_mmap_addr
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.d_alloc
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.shmem_getpage_gfp
      0.03 =C2=B1102%      +0.0        0.08 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.avc_has_perm
      0.11 =C2=B1 28%      +0.0        0.15 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.new_sync_write
      0.08 =C2=B1 44%      +0.0        0.13 =C2=B1 15%  perf-profile.childr=
en.cycles-pp.vma_compute_subtree_gap
      0.05 =C2=B1 67%      +0.0        0.10 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.strlcpy
      0.02 =C2=B1173%      +0.0        0.07 =C2=B1 23%  perf-profile.childr=
en.cycles-pp.inode_permission
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1 16%  perf-profile.childr=
en.cycles-pp._vm_normal_page
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.__getpid
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.security_mmap_file
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.d_path
      0.01 =C2=B1173%      +0.0        0.06        perf-profile.children.cy=
cles-pp.unmap_single_vma
      0.04 =C2=B1103%      +0.0        0.09 =C2=B1 17%  perf-profile.childr=
en.cycles-pp.pgd_alloc
      0.03 =C2=B1100%      +0.0        0.08 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.__vsnprintf_chk
      0.11 =C2=B1 30%      +0.0        0.16 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.mem_cgroup_commit_charge
      0.12 =C2=B1 26%      +0.0        0.17 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.vfs_write
      0.06 =C2=B1 67%      +0.1        0.11 =C2=B1 18%  perf-profile.childr=
en.cycles-pp.sync_regs
      0.03 =C2=B1102%      +0.1        0.08 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.__wake_up_common
      0.01 =C2=B1173%      +0.1        0.07 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.wake_q_add
      0.01 =C2=B1173%      +0.1        0.07 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.cpumask_next_and
      0.00            +0.1        0.05        perf-profile.children.cycles-=
pp.vma_interval_tree_augment_rotate
      0.00            +0.1        0.05        perf-profile.children.cycles-=
pp.find_next_and_bit
      0.00            +0.1        0.05        perf-profile.children.cycles-=
pp.fopen
      0.13 =C2=B1 29%      +0.1        0.18 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.ksys_write
      0.07 =C2=B1 39%      +0.1        0.12 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.vm_area_dup
      0.07 =C2=B1 64%      +0.1        0.12 =C2=B1  8%  perf-profile.childr=
en.cycles-pp._raw_spin_lock_irq
      0.03 =C2=B1105%      +0.1        0.08 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.d_alloc_parallel
      0.03 =C2=B1100%      +0.1        0.08 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.__update_load_avg_cfs_rq
      0.04 =C2=B1103%      +0.1        0.09 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.__tlb_remove_page_size
      0.08 =C2=B1 34%      +0.1        0.13 =C2=B1 30%  perf-profile.childr=
en.cycles-pp.__count_memcg_events
      0.08 =C2=B1 42%      +0.1        0.13 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.create_elf_tables
      0.08 =C2=B1 42%      +0.1        0.13 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.copy_strings_kernel
      0.02 =C2=B1173%      +0.1        0.07 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.__anon_vma_prepare
      0.01 =C2=B1173%      +0.1        0.07 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.generic_file_read_iter
      0.04 =C2=B1102%      +0.1        0.09 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.__list_add_valid
      0.03 =C2=B1102%      +0.1        0.08 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.osq_unlock
      0.06 =C2=B1 71%      +0.1        0.11 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.__pmd_alloc
      0.04 =C2=B1101%      +0.1        0.10 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.__check_object_size
      0.00            +0.1        0.06 =C2=B1  9%  perf-profile.children.cy=
cles-pp.__cxa_atexit
      0.01 =C2=B1173%      +0.1        0.07 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.kernel_read
      0.04 =C2=B1 59%      +0.1        0.10 =C2=B1 19%  perf-profile.childr=
en.cycles-pp.__vmalloc_node_range
      0.04 =C2=B1 63%      +0.1        0.10 =C2=B1 30%  perf-profile.childr=
en.cycles-pp.generic_perform_write
      0.05 =C2=B1102%      +0.1        0.10 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.mm_init
      0.03 =C2=B1100%      +0.1        0.09 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.mem_cgroup_throttle_swaprate
      0.08 =C2=B1 37%      +0.1        0.14        perf-profile.children.cy=
cles-pp.do_open_execat
      0.02 =C2=B1173%      +0.1        0.08 =C2=B1  6%  perf-profile.childr=
en.cycles-pp._IO_file_open
      0.01 =C2=B1173%      +0.1        0.07 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.__ctype_init
      0.10 =C2=B1 39%      +0.1        0.16 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.__might_sleep
      0.09 =C2=B1 37%      +0.1        0.15 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.__x86_indirect_thunk_rax
      0.06 =C2=B1 60%      +0.1        0.11 =C2=B1 30%  perf-profile.childr=
en.cycles-pp.generic_file_write_iter
      0.04 =C2=B1107%      +0.1        0.10 =C2=B1 15%  perf-profile.childr=
en.cycles-pp.do_dentry_open
      0.05 =C2=B1 64%      +0.1        0.11 =C2=B1 36%  perf-profile.childr=
en.cycles-pp.worker_thread
      0.03 =C2=B1100%      +0.1        0.09 =C2=B1 17%  perf-profile.childr=
en.cycles-pp.xas_find
      0.07 =C2=B1 39%      +0.1        0.14 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.__alloc_file
      0.06 =C2=B1 70%      +0.1        0.12 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.setup_arg_pages
      0.04 =C2=B1108%      +0.1        0.10 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.lookup_slow
      0.03 =C2=B1105%      +0.1        0.10 =C2=B1 15%  perf-profile.childr=
en.cycles-pp.unwind_next_frame
      0.03 =C2=B1100%      +0.1        0.09 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.xas_load
      0.02 =C2=B1173%      +0.1        0.08        perf-profile.children.cy=
cles-pp._copy_from_user
      0.08 =C2=B1 34%      +0.1        0.14 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.__rb_insert_augmented
      0.05 =C2=B1 62%      +0.1        0.11 =C2=B1 27%  perf-profile.childr=
en.cycles-pp.__generic_file_write_iter
      0.04 =C2=B1106%      +0.1        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.change_protection
      0.08 =C2=B1 45%      +0.1        0.15 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.alloc_empty_file
      0.07 =C2=B1 30%      +0.1        0.14 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.update_rq_clock
      0.10 =C2=B1 42%      +0.1        0.16 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.anon_vma_interval_tree_remove
      0.12 =C2=B1 40%      +0.1        0.19 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.selinux_inode_permission
      0.12 =C2=B1 40%      +0.1        0.18 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.__get_free_pages
      0.12 =C2=B1 43%      +0.1        0.18 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.__pte_alloc
      0.13 =C2=B1 32%      +0.1        0.20 =C2=B1 15%  perf-profile.childr=
en.cycles-pp.vfs_read
      0.12 =C2=B1 30%      +0.1        0.18 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.copy_user_highpage
      0.09 =C2=B1 39%      +0.1        0.16 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.dequeue_task_fair
      0.09 =C2=B1 33%      +0.1        0.16        perf-profile.children.cy=
cles-pp.time
      0.06 =C2=B1 70%      +0.1        0.13        perf-profile.children.cy=
cles-pp.dequeue_entity
      0.04 =C2=B1108%      +0.1        0.11 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.release_task
      0.12 =C2=B1 33%      +0.1        0.18 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.copy_page
      0.12 =C2=B1 38%      +0.1        0.19 =C2=B1 21%  perf-profile.childr=
en.cycles-pp.avc_has_perm_noaudit
      0.04 =C2=B1102%      +0.1        0.10 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.switch_mm_irqs_off
      0.04 =C2=B1104%      +0.1        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.unlock_page
      0.09 =C2=B1 40%      +0.1        0.16 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.__d_lookup_rcu
      0.04 =C2=B1106%      +0.1        0.11 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.rwsem_mark_wake
      0.04 =C2=B1107%      +0.1        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.__strcasecmp
      0.13 =C2=B1 36%      +0.1        0.21 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.security_inode_permission
      0.11 =C2=B1 38%      +0.1        0.18 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.do_faccessat
      0.10 =C2=B1 47%      +0.1        0.17 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.get_user_pages_remote
      0.04 =C2=B1100%      +0.1        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.update_load_avg
      0.12 =C2=B1 35%      +0.1        0.20 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.update_curr
      0.12 =C2=B1 40%      +0.1        0.20 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.__slab_free
      0.09 =C2=B1 40%      +0.1        0.17 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.do_task_dead
      0.13 =C2=B1 44%      +0.1        0.21 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.wake_up_new_task
      0.04 =C2=B1108%      +0.1        0.12        perf-profile.children.cy=
cles-pp.finish_task_switch
      0.09 =C2=B1 37%      +0.1        0.17 =C2=B1 15%  perf-profile.childr=
en.cycles-pp.page_add_file_rmap
      0.07 =C2=B1 39%      +0.1        0.15 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.stack_trace_save_tsk
      0.16 =C2=B1 34%      +0.1        0.24 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.mem_cgroup_try_charge
      0.12 =C2=B1 37%      +0.1        0.21 =C2=B1 21%  perf-profile.childr=
en.cycles-pp.cred_has_capability
      0.14 =C2=B1 38%      +0.1        0.22 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.anon_vma_interval_tree_insert
      0.06 =C2=B1 68%      +0.1        0.14 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.arch_stack_walk
      0.10 =C2=B1 44%      +0.1        0.19 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.remove_vma
      0.09 =C2=B1 41%      +0.1        0.17 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.__account_scheduler_latency
      0.06 =C2=B1 77%      +0.1        0.15 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.refcount_dec_not_one
      0.06 =C2=B1 77%      +0.1        0.15 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.free_uid
      0.06 =C2=B1 77%      +0.1        0.15 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.refcount_dec_and_lock_irqsave
      0.05 =C2=B1108%      +0.1        0.15 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.wait_consider_task
      0.15 =C2=B1 36%      +0.1        0.25 =C2=B1 24%  perf-profile.childr=
en.cycles-pp.selinux_vm_enough_memory
      0.15 =C2=B1 38%      +0.1        0.24 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.lookup_fast
      0.06 =C2=B1 70%      +0.1        0.16 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.sched_ttwu_pending
      0.05 =C2=B1106%      +0.1        0.15 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.queued_write_lock_slowpath
      0.15 =C2=B1 42%      +0.1        0.26 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.___might_sleep
      0.04 =C2=B1103%      +0.1        0.15 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.idle_cpu
      0.19 =C2=B1 41%      +0.1        0.30 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.kmem_cache_alloc
      0.15 =C2=B1 40%      +0.1        0.26 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.free_pages_and_swap_cache
      0.17 =C2=B1 37%      +0.1        0.28 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.up_write
      0.23 =C2=B1 36%      +0.1        0.34 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.get_unmapped_area
      0.22 =C2=B1 34%      +0.1        0.34 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.mem_cgroup_try_charge_delay
      0.20 =C2=B1 38%      +0.1        0.32 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.alloc_set_pte
      0.14 =C2=B1 44%      +0.1        0.27 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.wait4
      0.29 =C2=B1 35%      +0.1        0.42 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.__pagevec_lru_add_fn
      0.18 =C2=B1 38%      +0.1        0.32 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.kmem_cache_free
      0.06 =C2=B1 65%      +0.1        0.19        perf-profile.children.cy=
cles-pp.schedule_idle
      0.24 =C2=B1 37%      +0.1        0.38 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.security_vm_enough_memory_mm
      0.21 =C2=B1 38%      +0.1        0.35 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.walk_component
      0.25 =C2=B1 34%      +0.1        0.39 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.wp_page_copy
      0.13 =C2=B1 46%      +0.1        0.27 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.put_cred_rcu
      0.27 =C2=B1 40%      +0.1        0.41 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.find_vma
      0.27 =C2=B1 40%      +0.1        0.41 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.unlink_anon_vmas
      0.14 =C2=B1 39%      +0.1        0.29 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.ttwu_do_activate
      0.26 =C2=B1 43%      +0.2        0.41 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.select_task_rq_fair
      0.15 =C2=B1 40%      +0.2        0.31 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.enqueue_entity
      0.32 =C2=B1 36%      +0.2        0.47 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.vma_merge
      0.23 =C2=B1 38%      +0.2        0.38 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.kthread
      0.35 =C2=B1 35%      +0.2        0.51 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.__lru_cache_add
      0.26 =C2=B1 44%      +0.2        0.42 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.perf_iterate_sb
      0.17 =C2=B1 39%      +0.2        0.33 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.activate_task
      0.30 =C2=B1 40%      +0.2        0.46 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.link_path_walk
      0.18 =C2=B1 38%      +0.2        0.35 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.enqueue_task_fair
      0.26 =C2=B1 44%      +0.2        0.44 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.copy_strings
      0.26 =C2=B1 44%      +0.2        0.44 =C2=B1  9%  perf-profile.childr=
en.cycles-pp._dl_addr
      0.26 =C2=B1 39%      +0.2        0.45 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.ret_from_fork
      0.23 =C2=B1 49%      +0.2        0.43        perf-profile.children.cy=
cles-pp.do_wait
      0.38 =C2=B1 32%      +0.2        0.58 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.entry_SYSCALL_64
      0.46 =C2=B1 38%      +0.2        0.67 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.path_lookupat
      0.23 =C2=B1 51%      +0.2        0.45        perf-profile.children.cy=
cles-pp.kernel_wait4
      0.47 =C2=B1 37%      +0.2        0.69 =C2=B1 15%  perf-profile.childr=
en.cycles-pp.filename_lookup
      0.26 =C2=B1 41%      +0.2        0.47 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.rcu_core
      0.23 =C2=B1 51%      +0.2        0.45 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.__do_sys_wait4
      0.47 =C2=B1 36%      +0.2        0.69 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.pagevec_lru_move_fn
      0.29 =C2=B1 43%      +0.2        0.52 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.vma_interval_tree_insert
      0.39 =C2=B1 38%      +0.2        0.62 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.syscall_return_via_sysret
      0.43 =C2=B1 35%      +0.3        0.71 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.native_irq_return_iret
      0.45 =C2=B1 31%      +0.3        0.73 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.do_sys_open
      0.33 =C2=B1 40%      +0.3        0.61 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.copy_p4d_range
      0.46 =C2=B1 31%      +0.3        0.75 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.do_filp_open
      0.46 =C2=B1 31%      +0.3        0.74 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.path_openat
      0.48 =C2=B1 40%      +0.3        0.76 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.perf_event_mmap
      0.34 =C2=B1 40%      +0.3        0.62 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.copy_page_range
      0.41 =C2=B1 25%      +0.3        0.71 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.__softirqentry_text_start
      0.72 =C2=B1 36%      +0.3        1.02 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.clear_page_erms
      0.44 =C2=B1 23%      +0.3        0.76 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.irq_exit
      0.57 =C2=B1 36%      +0.3        0.89 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.native_flush_tlb_one_user
      0.46 =C2=B1 42%      +0.3        0.79 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.rwsem_spin_on_owner
      0.59 =C2=B1 35%      +0.3        0.92 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.flush_tlb_func_common
      0.75 =C2=B1 35%      +0.3        1.08 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.prep_new_page
      0.35 =C2=B1 39%      +0.4        0.71        perf-profile.children.cy=
cles-pp.update_sd_lb_stats
      0.84 =C2=B1 33%      +0.4        1.21 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.scheduler_tick
      0.36 =C2=B1 40%      +0.4        0.73        perf-profile.children.cy=
cles-pp.find_busiest_group
      0.64 =C2=B1 36%      +0.4        1.02 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.flush_tlb_mm_range
      0.58 =C2=B1 45%      +0.4        1.00 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.setlocale
      0.97 =C2=B1 30%      +0.4        1.40 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.tick_sched_handle
      0.96 =C2=B1 31%      +0.4        1.39 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.update_process_times
      0.46 =C2=B1 39%      +0.4        0.89        perf-profile.children.cy=
cles-pp.load_balance
      1.01 =C2=B1 30%      +0.4        1.46 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.tick_sched_timer
      1.07 =C2=B1 35%      +0.5        1.53 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.alloc_pages_vma
      0.49 =C2=B1 42%      +0.5        0.96 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.pick_next_task_fair
      1.21 =C2=B1 26%      +0.5        1.70 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.__hrtimer_run_queues
      0.55 =C2=B1 40%      +0.5        1.04 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.schedule
      1.11 =C2=B1 37%      +0.5        1.60 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.get_page_from_freelist
      0.93 =C2=B1 35%      +0.5        1.43 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.prepare_exit_to_usermode
      0.32 =C2=B1 34%      +0.5        0.84 =C2=B1 46%  perf-profile.childr=
en.cycles-pp.do_wp_page
      1.42 =C2=B1 25%      +0.5        1.96 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.hrtimer_interrupt
      1.31 =C2=B1 37%      +0.6        1.90 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.__alloc_pages_nodemask
      1.11 =C2=B1 38%      +0.6        1.71 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.do_brk_flags
      0.61 =C2=B1 43%      +0.6        1.23        perf-profile.children.cy=
cles-pp.rwsem_wake
      0.55 =C2=B1 45%      +0.6        1.20        perf-profile.children.cy=
cles-pp.wake_up_q
      1.00 =C2=B1 44%      +0.7        1.66 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.unmap_page_range
      0.61 =C2=B1 44%      +0.7        1.28 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.try_to_wake_up
      1.26 =C2=B1 36%      +0.7        1.93 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.swapgs_restore_regs_and_return_to_usermode
      1.06 =C2=B1 44%      +0.7        1.75 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.unmap_vmas
      0.73 =C2=B1 40%      +0.7        1.43 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.__schedule
      0.63 =C2=B1 41%      +0.8        1.45 =C2=B1 25%  perf-profile.childr=
en.cycles-pp._raw_spin_lock_irqsave
      0.76 =C2=B1 50%      +0.8        1.59 =C2=B1 19%  perf-profile.childr=
en.cycles-pp.native_queued_spin_lock_slowpath
      1.95 =C2=B1 23%      +0.9        2.80        perf-profile.children.cy=
cles-pp.smp_apic_timer_interrupt
      2.04 =C2=B1 22%      +0.9        2.90        perf-profile.children.cy=
cles-pp.apic_timer_interrupt
      1.94 =C2=B1 35%      +0.9        2.81 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.do_anonymous_page
      1.58 =C2=B1 40%      +0.9        2.45 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.tlb_flush_mmu
      1.05 =C2=B1 34%      +0.9        1.93 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.filemap_map_pages
      1.59 =C2=B1 41%      +0.9        2.49 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.tlb_finish_mmu
      2.75 =C2=B1 36%      +1.4        4.12 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.__x64_sys_brk
      3.85 =C2=B1 35%      +2.6        6.48 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.__handle_mm_fault
      4.04 =C2=B1 35%      +2.7        6.79 =C2=B1 15%  perf-profile.childr=
en.cycles-pp.handle_mm_fault
      4.97 =C2=B1 31%      +2.9        7.88 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.page_fault
      4.55 =C2=B1 35%      +3.0        7.55 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.__do_page_fault
      4.70 =C2=B1 35%      +3.0        7.74 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.do_page_fault
     15.57 =C2=B1 37%     +17.0       32.62 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.intel_idle
     16.16 =C2=B1 35%     +17.3       33.48 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.cpuidle_enter_state
     16.16 =C2=B1 35%     +17.3       33.48 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.cpuidle_enter
     16.41 =C2=B1 34%     +17.4       33.85 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.start_secondary
     16.53 =C2=B1 34%     +17.5       34.08 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.do_idle
     16.53 =C2=B1 34%     +17.5       34.08 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.secondary_startup_64
     16.53 =C2=B1 34%     +17.5       34.08 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.cpu_startup_entry
     17.02 =C2=B1 68%     -17.0        0.00        perf-profile.self.cycles=
-pp.sieve
      4.65 =C2=B1 68%      -4.7        0.00        perf-profile.self.cycles=
-pp.string_rtns_1
      0.07 =C2=B1 34%      +0.0        0.10 =C2=B1 14%  perf-profile.self.c=
ycles-pp.do_brk_flags
      0.07 =C2=B1 34%      +0.0        0.10 =C2=B1 14%  perf-profile.self.c=
ycles-pp.selinux_inode_permission
      0.03 =C2=B1102%      +0.0        0.07 =C2=B1 14%  perf-profile.self.c=
ycles-pp.__mod_node_page_state
      0.08 =C2=B1 34%      +0.0        0.12 =C2=B1  8%  perf-profile.self.c=
ycles-pp.update_curr
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1  9%  perf-profile.self.c=
ycles-pp.alloc_pages_vma
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1  9%  perf-profile.self.c=
ycles-pp.prep_new_page
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1  9%  perf-profile.self.c=
ycles-pp.anon_vma_fork
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1  9%  perf-profile.self.c=
ycles-pp.unwind_next_frame
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1  9%  perf-profile.self.c=
ycles-pp.cap_mmap_addr
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1  9%  perf-profile.self.c=
ycles-pp.unmap_single_vma
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1  9%  perf-profile.self.c=
ycles-pp.queued_write_lock_slowpath
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1  9%  perf-profile.self.c=
ycles-pp.cap_vm_enough_memory
      0.03 =C2=B1100%      +0.0        0.07 =C2=B1 14%  perf-profile.self.c=
ycles-pp.mem_cgroup_throttle_swaprate
      0.07 =C2=B1 34%      +0.0        0.11 =C2=B1  4%  perf-profile.self.c=
ycles-pp.perf_event_mmap_output
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1 16%  perf-profile.self.c=
ycles-pp.do_wp_page
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1 16%  perf-profile.self.c=
ycles-pp.fpregs_assert_state_consistent
      0.08 =C2=B1 34%      +0.0        0.12 =C2=B1 12%  perf-profile.self.c=
ycles-pp.__x86_indirect_thunk_rax
      0.03 =C2=B1105%      +0.0        0.08 =C2=B1 12%  perf-profile.self.c=
ycles-pp.__list_add_valid
      0.07 =C2=B1 26%      +0.0        0.12 =C2=B1  8%  perf-profile.self.c=
ycles-pp.update_rq_clock
      0.06 =C2=B1 66%      +0.0        0.10 =C2=B1 14%  perf-profile.self.c=
ycles-pp.sync_regs
      0.03 =C2=B1102%      +0.1        0.08 =C2=B1 12%  perf-profile.self.c=
ycles-pp.mem_cgroup_try_charge
      0.01 =C2=B1173%      +0.1        0.07 =C2=B1  7%  perf-profile.self.c=
ycles-pp.wake_q_add
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.w=
ake_up_q
      0.00            +0.1        0.05        perf-profile.self.cycles-pp._=
_lru_cache_add
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.v=
ma_interval_tree_augment_rotate
      0.03 =C2=B1105%      +0.1        0.09 =C2=B1 17%  perf-profile.self.c=
ycles-pp.entry_SYSCALL_64_after_hwframe
      0.03 =C2=B1100%      +0.1        0.08        perf-profile.self.cycles=
-pp.__update_load_avg_cfs_rq
      0.04 =C2=B1102%      +0.1        0.09 =C2=B1 11%  perf-profile.self.c=
ycles-pp.syscall_slow_exit_work
      0.03 =C2=B1102%      +0.1        0.08 =C2=B1  5%  perf-profile.self.c=
ycles-pp.__schedule
      0.04 =C2=B1101%      +0.1        0.10 =C2=B1 15%  perf-profile.self.c=
ycles-pp.anon_vma_clone
      0.09 =C2=B1 41%      +0.1        0.14 =C2=B1  7%  perf-profile.self.c=
ycles-pp.__might_sleep
      0.07 =C2=B1 72%      +0.1        0.12 =C2=B1 16%  perf-profile.self.c=
ycles-pp.vma_compute_subtree_gap
      0.01 =C2=B1173%      +0.1        0.07 =C2=B1 14%  perf-profile.self.c=
ycles-pp._cond_resched
      0.01 =C2=B1173%      +0.1        0.07        perf-profile.self.cycles=
-pp.dup_mm
      0.03 =C2=B1100%      +0.1        0.09        perf-profile.self.cycles=
-pp.vma_merge
      0.03 =C2=B1100%      +0.1        0.08 =C2=B1  5%  perf-profile.self.c=
ycles-pp.osq_unlock
      0.07 =C2=B1 34%      +0.1        0.13 =C2=B1 30%  perf-profile.self.c=
ycles-pp.__count_memcg_events
      0.01 =C2=B1173%      +0.1        0.07 =C2=B1 14%  perf-profile.self.c=
ycles-pp.switch_mm_irqs_off
      0.11 =C2=B1 35%      +0.1        0.16 =C2=B1  9%  perf-profile.self.c=
ycles-pp.__vma_adjust
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.l=
oad_balance
      0.11 =C2=B1 43%      +0.1        0.17 =C2=B1 17%  perf-profile.self.c=
ycles-pp.handle_mm_fault
      0.09 =C2=B1 43%      +0.1        0.15 =C2=B1 13%  perf-profile.self.c=
ycles-pp.anon_vma_interval_tree_remove
      0.03 =C2=B1105%      +0.1        0.10 =C2=B1  5%  perf-profile.self.c=
ycles-pp.put_cred_rcu
      0.02 =C2=B1173%      +0.1        0.08        perf-profile.self.cycles=
-pp._raw_spin_lock_irq
      0.04 =C2=B1106%      +0.1        0.11 =C2=B1  4%  perf-profile.self.c=
ycles-pp.unlock_page
      0.01 =C2=B1173%      +0.1        0.08        perf-profile.self.cycles=
-pp.__alloc_file
      0.09 =C2=B1 40%      +0.1        0.16 =C2=B1  9%  perf-profile.self.c=
ycles-pp.__d_lookup_rcu
      0.12 =C2=B1 33%      +0.1        0.18 =C2=B1  2%  perf-profile.self.c=
ycles-pp.copy_page
      0.12 =C2=B1 40%      +0.1        0.19 =C2=B1  5%  perf-profile.self.c=
ycles-pp.__slab_free
      0.07 =C2=B1 34%      +0.1        0.14 =C2=B1 14%  perf-profile.self.c=
ycles-pp.page_add_file_rmap
      0.06 =C2=B1 67%      +0.1        0.13 =C2=B1  7%  perf-profile.self.c=
ycles-pp.__rb_insert_augmented
      0.11 =C2=B1 38%      +0.1        0.18 =C2=B1 18%  perf-profile.self.c=
ycles-pp.avc_has_perm_noaudit
      0.05 =C2=B1 67%      +0.1        0.12 =C2=B1 12%  perf-profile.self.c=
ycles-pp.kmem_cache_free
      0.17 =C2=B1 35%      +0.1        0.24 =C2=B1 10%  perf-profile.self.c=
ycles-pp.__pagevec_lru_add_fn
      0.12 =C2=B1 42%      +0.1        0.21 =C2=B1 12%  perf-profile.self.c=
ycles-pp.perf_iterate_sb
      0.13 =C2=B1 40%      +0.1        0.21 =C2=B1 14%  perf-profile.self.c=
ycles-pp.find_vma
      0.14 =C2=B1 38%      +0.1        0.22 =C2=B1  6%  perf-profile.self.c=
ycles-pp.anon_vma_interval_tree_insert
      0.11 =C2=B1 41%      +0.1        0.19 =C2=B1  5%  perf-profile.self.c=
ycles-pp.vma_interval_tree_remove
      0.15 =C2=B1 38%      +0.1        0.24 =C2=B1 14%  perf-profile.self.c=
ycles-pp.__do_page_fault
      0.06 =C2=B1 77%      +0.1        0.15 =C2=B1 13%  perf-profile.self.c=
ycles-pp.refcount_dec_not_one
      0.15 =C2=B1 40%      +0.1        0.24 =C2=B1 10%  perf-profile.self.c=
ycles-pp.___might_sleep
      0.18 =C2=B1 42%      +0.1        0.28 =C2=B1 12%  perf-profile.self.c=
ycles-pp.select_task_rq_fair
      0.14 =C2=B1 41%      +0.1        0.24 =C2=B1  4%  perf-profile.self.c=
ycles-pp.free_pages_and_swap_cache
      0.04 =C2=B1101%      +0.1        0.15 =C2=B1  3%  perf-profile.self.c=
ycles-pp.idle_cpu
      0.14 =C2=B1 34%      +0.1        0.24 =C2=B1  2%  perf-profile.self.c=
ycles-pp._raw_spin_lock_irqsave
      0.16 =C2=B1 35%      +0.1        0.27 =C2=B1  7%  perf-profile.self.c=
ycles-pp.up_write
      0.15 =C2=B1 36%      +0.1        0.28 =C2=B1  3%  perf-profile.self.c=
ycles-pp.down_write
      0.11 =C2=B1 42%      +0.1        0.23 =C2=B1  2%  perf-profile.self.c=
ycles-pp.try_to_wake_up
      0.32 =C2=B1 36%      +0.2        0.49 =C2=B1 13%  perf-profile.self.c=
ycles-pp.swapgs_restore_regs_and_return_to_usermode
      0.24 =C2=B1 34%      +0.2        0.42 =C2=B1 10%  perf-profile.self.c=
ycles-pp.__handle_mm_fault
      0.25 =C2=B1 45%      +0.2        0.43 =C2=B1  9%  perf-profile.self.c=
ycles-pp._dl_addr
      0.17 =C2=B1 41%      +0.2        0.35 =C2=B1  5%  perf-profile.self.c=
ycles-pp.copy_p4d_range
      0.31 =C2=B1 36%      +0.2        0.52        perf-profile.self.cycles=
-pp._raw_spin_lock
      0.35 =C2=B1 37%      +0.2        0.57 =C2=B1  9%  perf-profile.self.c=
ycles-pp.entry_SYSCALL_64
      0.39 =C2=B1 38%      +0.2        0.62 =C2=B1  6%  perf-profile.self.c=
ycles-pp.syscall_return_via_sysret
      0.28 =C2=B1 44%      +0.2        0.51 =C2=B1  3%  perf-profile.self.c=
ycles-pp.vma_interval_tree_insert
      0.27 =C2=B1 42%      +0.3        0.54        perf-profile.self.cycles=
-pp.update_sd_lb_stats
      0.43 =C2=B1 34%      +0.3        0.70 =C2=B1 11%  perf-profile.self.c=
ycles-pp.native_irq_return_iret
      0.36 =C2=B1 42%      +0.3        0.63 =C2=B1  3%  perf-profile.self.c=
ycles-pp.rwsem_spin_on_owner
      0.70 =C2=B1 36%      +0.3        1.01 =C2=B1 12%  perf-profile.self.c=
ycles-pp.clear_page_erms
      0.57 =C2=B1 35%      +0.3        0.89 =C2=B1 12%  perf-profile.self.c=
ycles-pp.native_flush_tlb_one_user
      0.62 =C2=B1 35%      +0.4        0.98 =C2=B1  5%  perf-profile.self.c=
ycles-pp.rwsem_down_write_slowpath
      0.56 =C2=B1 45%      +0.4        0.94 =C2=B1  8%  perf-profile.self.c=
ycles-pp.unmap_page_range
      0.89 =C2=B1 36%      +0.5        1.38 =C2=B1 12%  perf-profile.self.c=
ycles-pp.prepare_exit_to_usermode
      1.07 =C2=B1 39%      +0.6        1.72 =C2=B1 10%  perf-profile.self.c=
ycles-pp.do_syscall_64
      0.74 =C2=B1 33%      +0.7        1.40 =C2=B1  6%  perf-profile.self.c=
ycles-pp.filemap_map_pages
      0.75 =C2=B1 50%      +0.8        1.59 =C2=B1 19%  perf-profile.self.c=
ycles-pp.native_queued_spin_lock_slowpath
     15.56 =C2=B1 37%     +17.0       32.59 =C2=B1 12%  perf-profile.self.c=
ycles-pp.intel_idle



***************************************************************************=
************************
lkp-bdw-ep2: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz with 128G=
 memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/load/rootfs/tbox_group/test/testcase/ucod=
e:
  gcc-7/performance/x86_64-rhel-7.6/2000/debian-x86_64-2019-05-14.cgz/lkp-b=
dw-ep2/fork_test/aim7/0xb000036

commit: =

  4f23dbc1e6 ("locking/rwsem: Implement lock handoff to prevent lock starva=
tion")
  00f3c5a3df ("locking/rwsem: Always release wait_lock before waking up tas=
ks")

4f23dbc1e657951e 00f3c5a3df2c1e3dab14d0dd2b7 =

---------------- --------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

          0:4           -7%           0:2     perf-profile.children.cycles-=
pp.error_entry
         %stddev     %change         %stddev
             \          |                \  =

    330032 =C2=B1  5%      +8.1%     356656 =C2=B1  5%  meminfo.DirectMap4k
      0.00 =C2=B1173%   +5700.0%       0.15 =C2=B1 51%  turbostat.Pkg%pc6
     20.03            +1.4%      20.32        turbostat.RAMWatt
      1552 =C2=B1106%    +185.7%       4436        numa-vmstat.node0.nr_ina=
ctive_anon
      1552 =C2=B1106%    +185.7%       4436        numa-vmstat.node0.nr_zon=
e_inactive_anon
     15713 =C2=B1 57%     -60.7%       6171        numa-vmstat.node1.nr_pag=
e_table_pages
      1703 =C2=B1  8%      +9.7%       1869 =C2=B1  5%  slabinfo.dmaengine-=
unmap-16.active_objs
      1703 =C2=B1  8%      +9.7%       1869 =C2=B1  5%  slabinfo.dmaengine-=
unmap-16.num_objs
      7189            +8.8%       7820 =C2=B1  6%  slabinfo.files_cache.act=
ive_objs
      7189            +8.8%       7820 =C2=B1  6%  slabinfo.files_cache.num=
_objs
      0.51 =C2=B1  7%      +0.1        0.56        perf-stat.i.branch-miss-=
rate%
     15.18            +0.3       15.49        perf-stat.i.cache-miss-rate%
  36584641 =C2=B1  7%      +5.9%   38751965        perf-stat.i.dTLB-load-mi=
sses
     15.37            +0.3       15.69        perf-stat.overall.cache-miss-=
rate%
  36528779 =C2=B1  7%      +5.9%   38692724        perf-stat.ps.dTLB-load-m=
isses
    121293            +1.8%     123486        proc-vmstat.nr_active_anon
     81294            +1.9%      82802        proc-vmstat.nr_anon_pages
     31379            -7.4%      29054 =C2=B1  3%  proc-vmstat.nr_page_tabl=
e_pages
    121293            +1.8%     123486        proc-vmstat.nr_zone_active_an=
on
      1732 =C2=B1130%     -98.2%      31.00 =C2=B1100%  proc-vmstat.numa_hi=
nt_faults_local
      6396 =C2=B1104%    +179.6%      17884        numa-meminfo.node0.Inact=
ive
      6239 =C2=B1105%    +185.4%      17806 =C2=B1  2%  numa-meminfo.node0.=
Inactive(anon)
     12314 =C2=B1 16%     +29.6%      15963        numa-meminfo.node0.Mapped
     91839 =C2=B1 25%     +28.3%     117810 =C2=B1 10%  numa-meminfo.node1.=
AnonHugePages
     14708 =C2=B1 12%     -23.6%      11243 =C2=B1  2%  numa-meminfo.node1.=
Mapped
     62843 =C2=B1 57%     -60.7%      24674        numa-meminfo.node1.PageT=
ables
   8540823 =C2=B1 15%     -58.5%    3542528 =C2=B1 79%  sched_debug.cfs_rq:=
/.MIN_vruntime.max
    960.57 =C2=B1  5%     -17.2%     795.67 =C2=B1  3%  sched_debug.cfs_rq:=
/.exec_clock.stddev
      4.34 =C2=B1  6%      +9.3%       4.75 =C2=B1  3%  sched_debug.cfs_rq:=
/.load_avg.min
   8540823 =C2=B1 15%     -58.5%    3542528 =C2=B1 79%  sched_debug.cfs_rq:=
/.max_vruntime.max
    196336 =C2=B1 30%     +74.9%     343381 =C2=B1  7%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
    170.62 =C2=B1 19%     +32.7%     226.38        sched_debug.cfs_rq:/.rem=
oved.util_avg.max
   -218268          -209.2%     238323 =C2=B1 11%  sched_debug.cfs_rq:/.spr=
ead0.avg
    213438 =C2=B1 59%    +314.5%     884735        sched_debug.cfs_rq:/.spr=
ead0.max
   -650962           -44.1%    -363711        sched_debug.cfs_rq:/.spread0.=
min
    196606 =C2=B1 30%     +74.6%     343259 =C2=B1  7%  sched_debug.cfs_rq:=
/.spread0.stddev
    133.29 =C2=B1 19%     +20.9%     161.21 =C2=B1  9%  sched_debug.cpu.cpu=
_load[2].max
     67.65 =C2=B1 10%     +10.0%      74.42 =C2=B1  6%  sched_debug.cpu.cpu=
_load[4].max
      5021 =C2=B1  7%     -20.8%       3978 =C2=B1  8%  sched_debug.cpu.nr_=
switches.stddev
    613.25 =C2=B1 39%     -35.6%     395.00        interrupts.105:IR-PCI-MS=
I.1574916-edge.eth1-TxRx-4
    538.00 =C2=B1 51%     +36.2%     733.00 =C2=B1 46%  interrupts.109:IR-P=
CI-MSI.1574920-edge.eth1-TxRx-8
    394.00 =C2=B1  6%      +6.1%     418.00 =C2=B1  5%  interrupts.111:IR-P=
CI-MSI.1574922-edge.eth1-TxRx-10
    345.00 =C2=B1  2%     +24.1%     428.00 =C2=B1 18%  interrupts.146:IR-P=
CI-MSI.1574957-edge.eth1-TxRx-45
    631.25 =C2=B1  4%     +25.1%     790.00 =C2=B1  5%  interrupts.CPU1.TLB=
:TLB_shootdowns
    394.00 =C2=B1  6%      +6.1%     418.00 =C2=B1  5%  interrupts.CPU10.11=
1:IR-PCI-MSI.1574922-edge.eth1-TxRx-10
    649.25 =C2=B1 10%     +12.4%     729.50 =C2=B1  4%  interrupts.CPU12.TL=
B:TLB_shootdowns
    601.75 =C2=B1  4%     +32.6%     798.00 =C2=B1  7%  interrupts.CPU13.TL=
B:TLB_shootdowns
    629.00 =C2=B1  9%     +24.1%     780.50        interrupts.CPU14.TLB:TLB=
_shootdowns
    601.25 =C2=B1 16%     +27.7%     767.50 =C2=B1 15%  interrupts.CPU15.TL=
B:TLB_shootdowns
    635.25 =C2=B1  8%     +15.7%     735.00 =C2=B1  6%  interrupts.CPU17.TL=
B:TLB_shootdowns
    604.50 =C2=B1 13%     +18.3%     715.00 =C2=B1  2%  interrupts.CPU18.TL=
B:TLB_shootdowns
    635.25 =C2=B1 10%     +15.7%     735.00 =C2=B1  6%  interrupts.CPU19.TL=
B:TLB_shootdowns
    607.25 =C2=B1  8%     +27.7%     775.50        interrupts.CPU2.TLB:TLB_=
shootdowns
    686.50 =C2=B1  9%     +18.2%     811.50 =C2=B1 16%  interrupts.CPU21.TL=
B:TLB_shootdowns
      5748 =C2=B1  2%     -31.4%       3942 =C2=B1 32%  interrupts.CPU22.NM=
I:Non-maskable_interrupts
      5748 =C2=B1  2%     -31.4%       3942 =C2=B1 32%  interrupts.CPU22.PM=
I:Performance_monitoring_interrupts
    651.25 =C2=B1 11%     +17.2%     763.50 =C2=B1 10%  interrupts.CPU22.TL=
B:TLB_shootdowns
      5735 =C2=B1  3%     -31.3%       3941 =C2=B1 32%  interrupts.CPU23.NM=
I:Non-maskable_interrupts
      5735 =C2=B1  3%     -31.3%       3941 =C2=B1 32%  interrupts.CPU23.PM=
I:Performance_monitoring_interrupts
      5679 =C2=B1  2%     -30.6%       3942 =C2=B1 31%  interrupts.CPU24.NM=
I:Non-maskable_interrupts
      5679 =C2=B1  2%     -30.6%       3942 =C2=B1 31%  interrupts.CPU24.PM=
I:Performance_monitoring_interrupts
    647.50 =C2=B1  6%     +35.5%     877.50 =C2=B1  8%  interrupts.CPU24.TL=
B:TLB_shootdowns
    621.00 =C2=B1  3%     +34.5%     835.50 =C2=B1  4%  interrupts.CPU26.TL=
B:TLB_shootdowns
    597.75 =C2=B1  9%     +26.8%     758.00 =C2=B1  5%  interrupts.CPU27.TL=
B:TLB_shootdowns
    587.25 =C2=B1  7%     +19.2%     700.00 =C2=B1  6%  interrupts.CPU37.TL=
B:TLB_shootdowns
    613.25 =C2=B1 39%     -35.6%     395.00        interrupts.CPU4.105:IR-P=
CI-MSI.1574916-edge.eth1-TxRx-4
    668.25 =C2=B1 11%     +19.5%     798.50 =C2=B1  4%  interrupts.CPU40.TL=
B:TLB_shootdowns
    646.25 =C2=B1  7%     +11.5%     720.50 =C2=B1  9%  interrupts.CPU43.TL=
B:TLB_shootdowns
    345.00 =C2=B1  2%     +24.1%     428.00 =C2=B1 18%  interrupts.CPU45.14=
6:IR-PCI-MSI.1574957-edge.eth1-TxRx-45
    587.00 =C2=B1 13%     +18.2%     694.00 =C2=B1 10%  interrupts.CPU45.TL=
B:TLB_shootdowns
    616.75 =C2=B1  3%     +16.9%     721.00 =C2=B1  9%  interrupts.CPU49.TL=
B:TLB_shootdowns
    680.00 =C2=B1  9%     +24.9%     849.50 =C2=B1  2%  interrupts.CPU50.TL=
B:TLB_shootdowns
    661.75 =C2=B1 11%     +24.1%     821.00 =C2=B1  2%  interrupts.CPU6.TLB=
:TLB_shootdowns
    606.50 =C2=B1 13%     +25.2%     759.50 =C2=B1  7%  interrupts.CPU62.TL=
B:TLB_shootdowns
    611.25 =C2=B1 11%     +18.2%     722.50        interrupts.CPU63.TLB:TLB=
_shootdowns
    576.50 =C2=B1 10%     +31.7%     759.50 =C2=B1  8%  interrupts.CPU64.TL=
B:TLB_shootdowns
    166.25 =C2=B1173%    +304.5%     672.50        interrupts.CPU65.168:IR-=
PCI-MSI.512000-edge.ahci[0000:00:1f.2]
      5687 =C2=B1  4%     -30.2%       3969 =C2=B1 30%  interrupts.CPU66.NM=
I:Non-maskable_interrupts
      5687 =C2=B1  4%     -30.2%       3969 =C2=B1 30%  interrupts.CPU66.PM=
I:Performance_monitoring_interrupts
      5683 =C2=B1  3%     -30.7%       3938 =C2=B1 31%  interrupts.CPU67.NM=
I:Non-maskable_interrupts
      5683 =C2=B1  3%     -30.7%       3938 =C2=B1 31%  interrupts.CPU67.PM=
I:Performance_monitoring_interrupts
      5706 =C2=B1  2%     -30.7%       3955 =C2=B1 32%  interrupts.CPU68.NM=
I:Non-maskable_interrupts
      5706 =C2=B1  2%     -30.7%       3955 =C2=B1 32%  interrupts.CPU68.PM=
I:Performance_monitoring_interrupts
    610.50 =C2=B1 10%     +17.3%     716.00 =C2=B1  5%  interrupts.CPU68.TL=
B:TLB_shootdowns
      5624 =C2=B1  2%     -29.5%       3967 =C2=B1 32%  interrupts.CPU70.NM=
I:Non-maskable_interrupts
      5624 =C2=B1  2%     -29.5%       3967 =C2=B1 32%  interrupts.CPU70.PM=
I:Performance_monitoring_interrupts
    562.75 =C2=B1 15%     +14.5%     644.50 =C2=B1 11%  interrupts.CPU71.TL=
B:TLB_shootdowns
      5672 =C2=B1  3%     -30.2%       3957 =C2=B1 30%  interrupts.CPU74.NM=
I:Non-maskable_interrupts
      5672 =C2=B1  3%     -30.2%       3957 =C2=B1 30%  interrupts.CPU74.PM=
I:Performance_monitoring_interrupts
    606.00 =C2=B1  8%     +25.5%     760.50        interrupts.CPU76.TLB:TLB=
_shootdowns
      5739 =C2=B1  2%     -31.6%       3923 =C2=B1 30%  interrupts.CPU79.NM=
I:Non-maskable_interrupts
      5739 =C2=B1  2%     -31.6%       3923 =C2=B1 30%  interrupts.CPU79.PM=
I:Performance_monitoring_interrupts
    538.00 =C2=B1 51%     +36.2%     733.00 =C2=B1 46%  interrupts.CPU8.109=
:IR-PCI-MSI.1574920-edge.eth1-TxRx-8
    655.25 =C2=B1  7%     +17.1%     767.00 =C2=B1 13%  interrupts.CPU81.TL=
B:TLB_shootdowns
    575.75 =C2=B1 11%     +47.8%     851.00 =C2=B1  9%  interrupts.CPU82.TL=
B:TLB_shootdowns
    684.75 =C2=B1  4%     +16.8%     800.00 =C2=B1  6%  interrupts.CPU84.TL=
B:TLB_shootdowns
     30.75 =C2=B1  2%      -3.6       27.16 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.secondary_startup_64
     29.27 =C2=B1  3%      -3.6       25.70 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_star=
tup_entry
     29.82 =C2=B1  2%      -3.6       26.24 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.secon=
dary_startup_64
     29.79 =C2=B1  2%      -3.6       26.21 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.s=
tart_secondary
     30.37 =C2=B1  2%      -3.5       26.83 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64
     30.37 =C2=B1  2%      -3.5       26.83 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
     30.37 =C2=B1  2%      -3.5       26.84 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.start_secondary.secondary_startup_64
      0.71 =C2=B1  3%      +0.1        0.84        perf-profile.calltrace.c=
ycles-pp.do_wp_page.__handle_mm_fault.handle_mm_fault.__do_page_fault.do_pa=
ge_fault
      0.63 =C2=B1  4%      +0.1        0.77        perf-profile.calltrace.c=
ycles-pp.wp_page_copy.do_wp_page.__handle_mm_fault.handle_mm_fault.__do_pag=
e_fault
      0.83 =C2=B1 10%      +0.2        1.01        perf-profile.calltrace.c=
ycles-pp.native_queued_spin_lock_slowpath.queued_read_lock_slowpath.do_wait=
.kernel_wait4.__do_sys_wait4
      0.98 =C2=B1  9%      +0.2        1.17 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.queued_read_lock_slowpath.do_wait.kernel_wait4.__do_sys_wait4=
.do_syscall_64
      0.40 =C2=B1 57%      +0.2        0.60        perf-profile.calltrace.c=
ycles-pp.release_task.wait_consider_task.do_wait.kernel_wait4.__do_sys_wait4
      0.42 =C2=B1 57%      +0.2        0.64        perf-profile.calltrace.c=
ycles-pp.wait_consider_task.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_=
64
      1.92 =C2=B1  5%      +0.3        2.17 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.__handle_mm_fault.handle_mm_fault.__do_page_fault.do_page_fau=
lt.page_fault
      1.95 =C2=B1  5%      +0.3        2.22 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      2.12 =C2=B1  5%      +0.3        2.41 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.__do_page_fault.do_page_fault.page_fault
      2.17 =C2=B1  5%      +0.3        2.46 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.page_fault
      2.15 =C2=B1  5%      +0.3        2.44 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.do_page_fault.page_fault
      1.81 =C2=B1  8%      +0.3        2.11        perf-profile.calltrace.c=
ycles-pp.__do_sys_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe.wait
      1.99 =C2=B1  8%      +0.3        2.30        perf-profile.calltrace.c=
ycles-pp.wait
      1.78 =C2=B1  8%      +0.3        2.09        perf-profile.calltrace.c=
ycles-pp.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64.entry_SYSCALL_64=
_after_hwframe
      1.85 =C2=B1  8%      +0.3        2.16        perf-profile.calltrace.c=
ycles-pp.entry_SYSCALL_64_after_hwframe.wait
      1.84 =C2=B1  8%      +0.3        2.16        perf-profile.calltrace.c=
ycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.wait
      1.80 =C2=B1  8%      +0.3        2.11        perf-profile.calltrace.c=
ycles-pp.kernel_wait4.__do_sys_wait4.do_syscall_64.entry_SYSCALL_64_after_h=
wframe.wait
      0.27 =C2=B1100%      +0.3        0.60        perf-profile.calltrace.c=
ycles-pp.worker_thread.kthread.ret_from_fork
      0.28 =C2=B1100%      +0.3        0.61        perf-profile.calltrace.c=
ycles-pp.ret_from_fork
      0.28 =C2=B1100%      +0.3        0.61        perf-profile.calltrace.c=
ycles-pp.kthread.ret_from_fork
      0.29 =C2=B1100%      +0.3        0.64        perf-profile.calltrace.c=
ycles-pp.__vmalloc_node_range.copy_process._do_fork.do_syscall_64.entry_SYS=
CALL_64_after_hwframe
      0.13 =C2=B1173%      +0.4        0.56        perf-profile.calltrace.c=
ycles-pp.process_one_work.worker_thread.kthread.ret_from_fork
      0.13 =C2=B1173%      +0.4        0.56        perf-profile.calltrace.c=
ycles-pp.__get_vm_area_node.__vmalloc_node_range.copy_process._do_fork.do_s=
yscall_64
      0.00            +0.5        0.53        perf-profile.calltrace.cycles=
-pp.__vunmap.free_work.process_one_work.worker_thread.kthread
      0.00            +0.5        0.53        perf-profile.calltrace.cycles=
-pp.alloc_vmap_area.__get_vm_area_node.__vmalloc_node_range.copy_process._d=
o_fork
      0.00            +0.5        0.53        perf-profile.calltrace.cycles=
-pp.free_work.process_one_work.worker_thread.kthread.ret_from_fork
     15.78            +0.7       16.50        perf-profile.calltrace.cycles=
-pp.osq_lock.rwsem_down_write_slowpath.down_write.anon_vma_clone.anon_vma_f=
ork
     16.55            +0.7       17.28        perf-profile.calltrace.cycles=
-pp.down_write.anon_vma_clone.anon_vma_fork.dup_mm.copy_process
     16.44            +0.7       17.17        perf-profile.calltrace.cycles=
-pp.rwsem_down_write_slowpath.down_write.anon_vma_clone.anon_vma_fork.dup_mm
     20.26            +0.8       21.02        perf-profile.calltrace.cycles=
-pp.osq_lock.rwsem_down_write_slowpath.down_write.unlink_anon_vmas.free_pgt=
ables
     20.90            +0.8       21.75        perf-profile.calltrace.cycles=
-pp.rwsem_down_write_slowpath.down_write.unlink_anon_vmas.free_pgtables.exi=
t_mmap
     21.04            +0.8       21.88        perf-profile.calltrace.cycles=
-pp.down_write.unlink_anon_vmas.free_pgtables.exit_mmap.mmput
     17.93            +0.8       18.77        perf-profile.calltrace.cycles=
-pp.anon_vma_clone.anon_vma_fork.dup_mm.copy_process._do_fork
     25.06 =C2=B1  2%      +1.0       26.04        perf-profile.calltrace.c=
ycles-pp.anon_vma_fork.dup_mm.copy_process._do_fork.do_syscall_64
     26.77 =C2=B1  2%      +1.1       27.86        perf-profile.calltrace.c=
ycles-pp.dup_mm.copy_process._do_fork.do_syscall_64.entry_SYSCALL_64_after_=
hwframe
     32.33            +1.3       33.63        perf-profile.calltrace.cycles=
-pp.exit_mmap.mmput.do_exit.do_group_exit.__x64_sys_exit_group
     32.35            +1.3       33.65        perf-profile.calltrace.cycles=
-pp.mmput.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
     28.27            +1.3       29.60        perf-profile.calltrace.cycles=
-pp.copy_process._do_fork.do_syscall_64.entry_SYSCALL_64_after_hwframe.__li=
bc_fork
     28.61            +1.4       29.97        perf-profile.calltrace.cycles=
-pp.entry_SYSCALL_64_after_hwframe.__libc_fork.fork_test
     28.61            +1.4       29.97        perf-profile.calltrace.cycles=
-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_fork.fork_test
     28.59            +1.4       29.95        perf-profile.calltrace.cycles=
-pp._do_fork.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_fork.fork_=
test
     29.46            +1.4       30.87        perf-profile.calltrace.cycles=
-pp.__libc_fork.fork_test
     33.46            +1.4       34.91        perf-profile.calltrace.cycles=
-pp.entry_SYSCALL_64_after_hwframe
     33.46            +1.4       34.91        perf-profile.calltrace.cycles=
-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
     33.45            +1.5       34.91        perf-profile.calltrace.cycles=
-pp.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after_hwframe
     33.45            +1.5       34.91        perf-profile.calltrace.cycles=
-pp.do_group_exit.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after=
_hwframe
     33.45            +1.5       34.91        perf-profile.calltrace.cycles=
-pp.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_=
64_after_hwframe
     29.95            +1.5       31.41        perf-profile.calltrace.cycles=
-pp.fork_test
     29.64 =C2=B1  3%      -3.6       26.01 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.intel_idle
     30.20 =C2=B1  2%      -3.6       26.56 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.cpuidle_enter
     30.19 =C2=B1  2%      -3.6       26.56 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.cpuidle_enter_state
     30.75 =C2=B1  2%      -3.6       27.16 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.do_idle
     30.75 =C2=B1  2%      -3.6       27.16 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.secondary_startup_64
     30.75 =C2=B1  2%      -3.6       27.16 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.cpu_startup_entry
     30.37 =C2=B1  2%      -3.5       26.84 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.start_secondary
      0.38 =C2=B1  6%      -0.1        0.33 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.start_kernel
      0.06 =C2=B1  7%      +0.0        0.07        perf-profile.children.cy=
cles-pp.security_vm_enough_memory_mm
      0.10 =C2=B1  5%      +0.0        0.11        perf-profile.children.cy=
cles-pp.___perf_sw_event
      0.07 =C2=B1  7%      +0.0        0.08        perf-profile.children.cy=
cles-pp.put_task_stack
      0.09 =C2=B1  4%      +0.0        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.rwsem_mark_wake
      0.11 =C2=B1  7%      +0.0        0.13        perf-profile.children.cy=
cles-pp.sched_move_task
      0.19 =C2=B1  3%      +0.0        0.21        perf-profile.children.cy=
cles-pp.dequeue_task_fair
      0.18 =C2=B1  5%      +0.0        0.20        perf-profile.children.cy=
cles-pp.__wake_up_common_lock
      0.06            +0.0        0.08        perf-profile.children.cycles-=
pp.__pagevec_lru_add_fn
      0.16 =C2=B1  2%      +0.0        0.18 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.dequeue_entity
      0.18 =C2=B1  6%      +0.0        0.21        perf-profile.children.cy=
cles-pp.unlink_file_vma
      0.18 =C2=B1  6%      +0.0        0.20        perf-profile.children.cy=
cles-pp.__wake_up_common
      0.15 =C2=B1  3%      +0.0        0.18 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.flush_tlb_func_common
      0.14 =C2=B1  5%      +0.0        0.17 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.native_flush_tlb_one_user
      0.22 =C2=B1  4%      +0.0        0.25 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.schedule_idle
      0.18 =C2=B1  2%      +0.0        0.21 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.ptep_clear_flush
      0.15 =C2=B1  2%      +0.0        0.17 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.pagevec_lru_move_fn
      0.21 =C2=B1  3%      +0.0        0.24 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.flush_tlb_mm_range
      0.14 =C2=B1  8%      +0.0        0.17 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.finish_task_switch
      0.34 =C2=B1  4%      +0.0        0.37 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.find_busiest_group
      0.53 =C2=B1  2%      +0.0        0.56        perf-profile.children.cy=
cles-pp.schedule
      0.45 =C2=B1  3%      +0.0        0.48 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.load_balance
      0.36 =C2=B1  6%      +0.0        0.39 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.prepare_exit_to_usermode
      0.27 =C2=B1  2%      +0.0        0.30 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.up_write
      0.22 =C2=B1  9%      +0.0        0.26        perf-profile.children.cy=
cles-pp.schedule_tail
      0.00            +0.1        0.05        perf-profile.children.cycles-=
pp.__list_add_valid
      0.00            +0.1        0.05        perf-profile.children.cycles-=
pp.queue_work_on
      0.02 =C2=B1173%      +0.1        0.08        perf-profile.children.cy=
cles-pp.__lru_cache_add
      0.38 =C2=B1  5%      +0.1        0.45        perf-profile.children.cy=
cles-pp.copy_page
      0.39 =C2=B1  6%      +0.1        0.46        perf-profile.children.cy=
cles-pp.copy_user_highpage
      0.98 =C2=B1  3%      +0.1        1.04        perf-profile.children.cy=
cles-pp.__schedule
      0.51 =C2=B1  9%      +0.1        0.60        perf-profile.children.cy=
cles-pp.release_task
      0.54 =C2=B1  9%      +0.1        0.64        perf-profile.children.cy=
cles-pp.wait_consider_task
      1.04 =C2=B1  4%      +0.1        1.14        perf-profile.children.cy=
cles-pp.rwsem_wake
      0.37 =C2=B1 19%      +0.1        0.48        perf-profile.children.cy=
cles-pp.find_vmap_area
      0.93 =C2=B1  3%      +0.1        1.04        perf-profile.children.cy=
cles-pp.wake_up_q
      0.41 =C2=B1 16%      +0.1        0.53        perf-profile.children.cy=
cles-pp.alloc_vmap_area
      0.44 =C2=B1 15%      +0.1        0.56        perf-profile.children.cy=
cles-pp.__get_vm_area_node
      0.41 =C2=B1 17%      +0.1        0.53        perf-profile.children.cy=
cles-pp.__vunmap
      0.49 =C2=B1 14%      +0.1        0.61        perf-profile.children.cy=
cles-pp.kthread
      0.48 =C2=B1 15%      +0.1        0.60        perf-profile.children.cy=
cles-pp.worker_thread
      0.43 =C2=B1 15%      +0.1        0.56        perf-profile.children.cy=
cles-pp.process_one_work
      0.41 =C2=B1 17%      +0.1        0.53        perf-profile.children.cy=
cles-pp.free_work
      1.10 =C2=B1  5%      +0.1        1.23        perf-profile.children.cy=
cles-pp.rwsem_spin_on_owner
      0.51 =C2=B1 14%      +0.1        0.64        perf-profile.children.cy=
cles-pp.__vmalloc_node_range
      1.28 =C2=B1  4%      +0.1        1.42        perf-profile.children.cy=
cles-pp._raw_spin_lock_irqsave
      1.08 =C2=B1  4%      +0.1        1.22        perf-profile.children.cy=
cles-pp.try_to_wake_up
      0.93 =C2=B1  4%      +0.2        1.08 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.wp_page_copy
      0.74 =C2=B1 12%      +0.2        0.91        perf-profile.children.cy=
cles-pp.ret_from_fork
      1.05 =C2=B1  4%      +0.2        1.22 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.do_wp_page
      0.98 =C2=B1  9%      +0.2        1.17 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.queued_read_lock_slowpath
      1.00 =C2=B1 10%      +0.2        1.19 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.queued_write_lock_slowpath
      1.08 =C2=B1 14%      +0.2        1.33        perf-profile.children.cy=
cles-pp._raw_spin_lock
      2.01 =C2=B1  8%      +0.3        2.32        perf-profile.children.cy=
cles-pp.wait
      1.81 =C2=B1  8%      +0.3        2.12        perf-profile.children.cy=
cles-pp.__do_sys_wait4
      1.78 =C2=B1  8%      +0.3        2.09        perf-profile.children.cy=
cles-pp.do_wait
      1.80 =C2=B1  8%      +0.3        2.11        perf-profile.children.cy=
cles-pp.kernel_wait4
      3.58 =C2=B1  9%      +0.7        4.27        perf-profile.children.cy=
cles-pp.native_queued_spin_lock_slowpath
     17.93            +0.9       18.78        perf-profile.children.cycles-=
pp.anon_vma_clone
     25.07 =C2=B1  2%      +1.0       26.04        perf-profile.children.cy=
cles-pp.anon_vma_fork
     26.78 =C2=B1  2%      +1.1       27.87        perf-profile.children.cy=
cles-pp.dup_mm
     32.33            +1.3       33.63        perf-profile.children.cycles-=
pp.exit_mmap
     32.35            +1.3       33.65        perf-profile.children.cycles-=
pp.mmput
     28.27            +1.3       29.61        perf-profile.children.cycles-=
pp.copy_process
     28.59            +1.4       29.95        perf-profile.children.cycles-=
pp._do_fork
     29.50            +1.4       30.92        perf-profile.children.cycles-=
pp.__libc_fork
     33.51            +1.5       34.97        perf-profile.children.cycles-=
pp.do_exit
     33.52            +1.5       34.98        perf-profile.children.cycles-=
pp.__x64_sys_exit_group
     33.52            +1.5       34.98        perf-profile.children.cycles-=
pp.do_group_exit
     30.00            +1.5       31.47        perf-profile.children.cycles-=
pp.fork_test
     64.03            +3.1       67.16        perf-profile.children.cycles-=
pp.do_syscall_64
     64.04            +3.1       67.16        perf-profile.children.cycles-=
pp.entry_SYSCALL_64_after_hwframe
     29.63 =C2=B1  3%      -3.6       25.99 =C2=B1  3%  perf-profile.self.c=
ycles-pp.intel_idle
      0.14 =C2=B1  5%      +0.0        0.17 =C2=B1  3%  perf-profile.self.c=
ycles-pp.native_flush_tlb_one_user
      0.16 =C2=B1 11%      +0.0        0.19 =C2=B1  5%  perf-profile.self.c=
ycles-pp.unlock_page
      0.27 =C2=B1  3%      +0.0        0.30 =C2=B1  3%  perf-profile.self.c=
ycles-pp.up_write
      1.12            +0.0        1.17        perf-profile.self.cycles-pp.r=
wsem_down_write_slowpath
      0.00            +0.1        0.05        perf-profile.self.cycles-pp._=
_pagevec_lru_add_fn
      0.00            +0.1        0.05        perf-profile.self.cycles-pp._=
_list_add_valid
      0.38 =C2=B1  6%      +0.1        0.44        perf-profile.self.cycles=
-pp.copy_page
      0.92 =C2=B1  6%      +0.1        1.04        perf-profile.self.cycles=
-pp.rwsem_spin_on_owner
      3.56 =C2=B1  9%      +0.7        4.25        perf-profile.self.cycles=
-pp.native_queued_spin_lock_slowpath



***************************************************************************=
************************
lkp-bdw-ex1: 192 threads Intel(R) Xeon(R) CPU E7-8890 v4 @ 2.20GHz with 496=
G memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/load/rootfs/tbox_group/test/testcase/ucod=
e:
  gcc-7/performance/x86_64-rhel-7.6/8000/debian-x86_64-2019-05-14.cgz/lkp-b=
dw-ex1/disk_src/aim7/0xb000036

commit: =

  4f23dbc1e6 ("locking/rwsem: Implement lock handoff to prevent lock starva=
tion")
  00f3c5a3df ("locking/rwsem: Always release wait_lock before waking up tas=
ks")

4f23dbc1e657951e 00f3c5a3df2c1e3dab14d0dd2b7 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     38518            +1.2%      38996        proc-vmstat.nr_slab_reclaimab=
le
    233358 =C2=B1 29%     -83.8%      37823 =C2=B1  4%  numa-numastat.node0=
.local_node
    233390 =C2=B1 29%     -70.5%      68854 =C2=B1  2%  numa-numastat.node0=
.numa_hit
     34.25 =C2=B1108%  +90501.5%      31031        numa-numastat.node0.othe=
r_node
     62521 =C2=B1 58%    +441.7%     338669        numa-numastat.node2.loca=
l_node
     93578 =C2=B1 38%    +288.4%     363493 =C2=B1  3%  numa-numastat.node2=
.numa_hit
     31070           -79.7%       6300 =C2=B1 98%  numa-numastat.node3.othe=
r_node
     60884 =C2=B1  6%      -8.3%      55851        slabinfo.shmem_inode_cac=
he.active_objs
      1327 =C2=B1  6%      -8.4%       1216        slabinfo.shmem_inode_cac=
he.active_slabs
     61092 =C2=B1  6%      -8.4%      55988        slabinfo.shmem_inode_cac=
he.num_objs
      1327 =C2=B1  6%      -8.4%       1216        slabinfo.shmem_inode_cac=
he.num_slabs
    771.50 =C2=B1 17%     -21.4%     606.50 =C2=B1  5%  slabinfo.skbuff_ext=
_cache.active_objs
    771.50 =C2=B1 17%     -21.4%     606.50 =C2=B1  5%  slabinfo.skbuff_ext=
_cache.num_objs
 3.357e+08            -2.1%  3.287e+08        perf-stat.i.cache-references
      6168 =C2=B1 12%     +24.6%       7686 =C2=B1  6%  perf-stat.i.cycles-=
between-cache-misses
      0.40            +3.1%       0.41 =C2=B1  2%  perf-stat.i.ipc
   1343568 =C2=B1 10%     +21.3%    1630157 =C2=B1  6%  perf-stat.i.node-lo=
ads
     17.33            -4.9%      16.48        perf-stat.overall.MPKI
      2.39            -3.4%       2.30        perf-stat.overall.cpi
      0.42            +3.6%       0.43        perf-stat.overall.ipc
 3.315e+08            -2.1%  3.244e+08        perf-stat.ps.cache-references
      7455            +1.4%       7560        perf-stat.ps.minor-faults
   1325962 =C2=B1 10%     +21.2%    1607636 =C2=B1  6%  perf-stat.ps.node-l=
oads
      7454            +1.4%       7559        perf-stat.ps.page-faults
     48.50 =C2=B1  7%    +187.6%     139.50 =C2=B1 62%  interrupts.145:PCI-=
MSI.1574927-edge.eth3-TxRx-15
      1528 =C2=B1 18%     +67.9%       2565 =C2=B1 35%  interrupts.CPU1.RES=
:Rescheduling_interrupts
      1355 =C2=B1  8%     +20.5%       1632 =C2=B1  7%  interrupts.CPU11.RE=
S:Rescheduling_interrupts
      1058 =C2=B1 48%    +154.3%       2690 =C2=B1 49%  interrupts.CPU138.R=
ES:Rescheduling_interrupts
      1571 =C2=B1 16%     +19.7%       1881 =C2=B1 11%  interrupts.CPU144.R=
ES:Rescheduling_interrupts
      1438 =C2=B1 17%     +18.5%       1704 =C2=B1 11%  interrupts.CPU145.R=
ES:Rescheduling_interrupts
      1440 =C2=B1 14%     +19.7%       1724 =C2=B1  4%  interrupts.CPU149.R=
ES:Rescheduling_interrupts
     48.50 =C2=B1  7%    +187.6%     139.50 =C2=B1 62%  interrupts.CPU15.14=
5:PCI-MSI.1574927-edge.eth3-TxRx-15
      1412 =C2=B1 14%     +11.5%       1574 =C2=B1 11%  interrupts.CPU155.R=
ES:Rescheduling_interrupts
      1407 =C2=B1 14%     +15.8%       1629 =C2=B1 10%  interrupts.CPU157.R=
ES:Rescheduling_interrupts
      1334 =C2=B1  3%     +10.2%       1470        interrupts.CPU27.RES:Res=
cheduling_interrupts
      1393 =C2=B1  5%     +10.5%       1539 =C2=B1  7%  interrupts.CPU29.RE=
S:Rescheduling_interrupts
      1122 =C2=B1 22%    +354.4%       5099 =C2=B1 73%  interrupts.CPU34.RE=
S:Rescheduling_interrupts
      1132 =C2=B1 21%    +299.5%       4525 =C2=B1 67%  interrupts.CPU35.RE=
S:Rescheduling_interrupts
      2028 =C2=B1 49%     -62.6%     758.00 =C2=B1 70%  interrupts.CPU40.RE=
S:Rescheduling_interrupts
      1159 =C2=B1 35%    +148.2%       2878 =C2=B1 48%  interrupts.CPU45.RE=
S:Rescheduling_interrupts
      1356 =C2=B1 16%     +19.3%       1618 =C2=B1 10%  interrupts.CPU71.RE=
S:Rescheduling_interrupts
      1.03 =C2=B1100%      +1.5        2.56 =C2=B1 11%  perf-profile.calltr=
ace.cycles-pp.unmap_vmas.exit_mmap.mmput.do_exit.do_group_exit
      0.49 =C2=B1173%      +2.1        2.56 =C2=B1 11%  perf-profile.calltr=
ace.cycles-pp.unmap_page_range.unmap_vmas.exit_mmap.mmput.do_exit
      0.98 =C2=B1173%      +2.7        3.71 =C2=B1 22%  perf-profile.calltr=
ace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
      0.98 =C2=B1173%      +2.7        3.71 =C2=B1 22%  perf-profile.calltr=
ace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      0.49 =C2=B1173%      +3.2        3.71 =C2=B1 22%  perf-profile.calltr=
ace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me.read
      0.49 =C2=B1173%      +3.2        3.71 =C2=B1 22%  perf-profile.calltr=
ace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      0.00            +3.7        3.71 =C2=B1 22%  perf-profile.calltrace.c=
ycles-pp.seq_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_h=
wframe
      0.98 =C2=B1173%      +4.2        5.13 =C2=B1 11%  perf-profile.calltr=
ace.cycles-pp.read
      1.03 =C2=B1100%      +1.5        2.56 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.unmap_vmas
      0.49 =C2=B1173%      +2.1        2.56 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.entry_SYSCALL_64
      0.49 =C2=B1173%      +2.1        2.56 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.unmap_page_range
      0.00            +2.6        2.56 =C2=B1 11%  perf-profile.children.cy=
cles-pp.mutex_unlock
     18.25 =C2=B1 10%      +3.4       21.66 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.do_group_exit
     18.25 =C2=B1 10%      +3.4       21.66 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.do_exit
      0.98 =C2=B1173%      +4.2        5.13 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.read
      0.49 =C2=B1173%      +2.1        2.56 =C2=B1 11%  perf-profile.self.c=
ycles-pp.entry_SYSCALL_64
      0.00            +2.6        2.56 =C2=B1 11%  perf-profile.self.cycles=
-pp.mutex_unlock
      3235 =C2=B1  3%     -59.2%       1318 =C2=B1 98%  sched_debug.cfs_rq:=
/.exec_clock.max
     10.08 =C2=B1 24%    +109.8%      21.14 =C2=B1 30%  sched_debug.cfs_rq:=
/.load_avg.avg
    440.50 =C2=B1 11%     +75.9%     774.75 =C2=B1 32%  sched_debug.cfs_rq:=
/.load_avg.max
     51.31 =C2=B1 21%     +92.3%      98.66 =C2=B1 34%  sched_debug.cfs_rq:=
/.load_avg.stddev
    416493 =C2=B1  3%     -69.9%     125500 =C2=B1 71%  sched_debug.cfs_rq:=
/.min_vruntime.max
      1.36 =C2=B1173%    +360.0%       6.26 =C2=B1 26%  sched_debug.cfs_rq:=
/.removed.load_avg.avg
    122.00 =C2=B1173%    +522.5%     759.50 =C2=B1 34%  sched_debug.cfs_rq:=
/.removed.load_avg.max
     12.77 =C2=B1173%    +437.4%      68.61 =C2=B1 30%  sched_debug.cfs_rq:=
/.removed.load_avg.stddev
     62.75 =C2=B1173%    +360.3%     288.79 =C2=B1 26%  sched_debug.cfs_rq:=
/.removed.runnable_sum.avg
      5623 =C2=B1173%    +522.8%      35019 =C2=B1 34%  sched_debug.cfs_rq:=
/.removed.runnable_sum.max
    588.63 =C2=B1173%    +437.5%       3164 =C2=B1 30%  sched_debug.cfs_rq:=
/.removed.runnable_sum.stddev
      0.55 =C2=B1173%    +473.9%       3.14 =C2=B1 26%  sched_debug.cfs_rq:=
/.removed.util_avg.avg
     61.62 =C2=B1173%    +517.8%     380.75 =C2=B1 34%  sched_debug.cfs_rq:=
/.removed.util_avg.max
      5.31 =C2=B1173%    +547.6%      34.40 =C2=B1 30%  sched_debug.cfs_rq:=
/.removed.util_avg.stddev
      0.79 =C2=B1 14%     +24.7%       0.99 =C2=B1  8%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
    288696 =C2=B1 13%     -90.7%      26906 =C2=B1 96%  sched_debug.cfs_rq:=
/.spread0.max
    135.02 =C2=B1  3%     +32.0%     178.17 =C2=B1  9%  sched_debug.cfs_rq:=
/.util_avg.avg
      6.14 =C2=B1 20%     +96.1%      12.04 =C2=B1 40%  sched_debug.cfs_rq:=
/.util_est_enqueued.avg
    282.25           +40.7%     397.00 =C2=B1 24%  sched_debug.cfs_rq:/.uti=
l_est_enqueued.max
     36.69 =C2=B1 11%     +72.8%      63.38 =C2=B1 33%  sched_debug.cfs_rq:=
/.util_est_enqueued.stddev
    143.02 =C2=B1  6%     -65.3%      49.57 =C2=B1 83%  sched_debug.cpu.clo=
ck.stddev
    143.02 =C2=B1  6%     -65.3%      49.57 =C2=B1 83%  sched_debug.cpu.clo=
ck_task.stddev
     85.62 =C2=B1 18%     -35.2%      55.50 =C2=B1  4%  sched_debug.cpu.cpu=
_load[4].max
      6.55 =C2=B1 16%     -24.0%       4.98        sched_debug.cpu.cpu_load=
[4].stddev
      0.00 =C2=B1  6%     -61.0%       0.00 =C2=B1 62%  sched_debug.cpu.nex=
t_balance.stddev
    212392 =C2=B1 71%     -71.1%      61441 =C2=B1  5%  numa-meminfo.node0.=
Active
    212340 =C2=B1 71%     -71.1%      61441 =C2=B1  5%  numa-meminfo.node0.=
Active(anon)
     25308 =C2=B1 36%     -96.0%       1024 =C2=B1100%  numa-meminfo.node0.=
AnonHugePages
    203492 =C2=B1 74%     -69.7%      61607 =C2=B1  5%  numa-meminfo.node0.=
AnonPages
     96358 =C2=B1  8%     -66.7%      32077 =C2=B1  3%  numa-meminfo.node0.=
KReclaimable
   1236693 =C2=B1 41%     -36.1%     790523        numa-meminfo.node0.MemUs=
ed
     96358 =C2=B1  8%     -66.7%      32077 =C2=B1  3%  numa-meminfo.node0.=
SReclaimable
    157686 =C2=B1 55%     -45.7%      85674        numa-meminfo.node0.SUnre=
claim
     28625 =C2=B1  3%     -30.4%      19912        numa-meminfo.node0.Shmem
    254045 =C2=B1 36%     -53.6%     117751        numa-meminfo.node0.Slab
      1162 =C2=B1 27%     -76.0%     279.00 =C2=B1 81%  numa-meminfo.node1.=
Inactive
      1069 =C2=B1 25%     -82.3%     189.50 =C2=B1 72%  numa-meminfo.node1.=
Inactive(anon)
      1110 =C2=B1 23%     -49.7%     558.00 =C2=B1  7%  numa-meminfo.node1.=
Shmem
    107470 =C2=B1 48%    +329.4%     461499 =C2=B1  6%  numa-meminfo.node2.=
Active
    107469 =C2=B1 48%    +329.3%     461407 =C2=B1  6%  numa-meminfo.node2.=
Active(anon)
    107671 =C2=B1 48%    +325.7%     458377 =C2=B1  5%  numa-meminfo.node2.=
AnonPages
    249548            +8.9%     271751 =C2=B1  7%  numa-meminfo.node2.FileP=
ages
     15548 =C2=B1  7%    +247.4%      54007 =C2=B1 12%  numa-meminfo.node2.=
KReclaimable
      5609 =C2=B1  2%   +2180.6%     127917        numa-meminfo.node2.Kerne=
lStack
    589997 =C2=B1  8%    +214.5%    1855314 =C2=B1  5%  numa-meminfo.node2.=
MemUsed
      2892 =C2=B1 57%   +9676.0%     282747 =C2=B1  8%  numa-meminfo.node2.=
PageTables
     15548 =C2=B1  7%    +247.4%      54007 =C2=B1 12%  numa-meminfo.node2.=
SReclaimable
     59530 =C2=B1  6%    +379.2%     285257        numa-meminfo.node2.SUnre=
claim
      1011 =C2=B1 19%    +310.3%       4149 =C2=B1 53%  numa-meminfo.node2.=
Shmem
     75078 =C2=B1  5%    +351.9%     339265 =C2=B1  2%  numa-meminfo.node2.=
Slab
    248134            +7.5%     266686 =C2=B1  6%  numa-meminfo.node2.Unevi=
ctable
    578.25 =C2=B1 71%    +132.0%       1341 =C2=B1 44%  numa-meminfo.node3.=
Inactive(anon)
     23848 =C2=B1 39%    +116.8%      51695 =C2=B1  9%  numa-meminfo.node3.=
KReclaimable
    209891 =C2=B1 56%     -99.0%       2018 =C2=B1 35%  numa-meminfo.node3.=
PageTables
     23848 =C2=B1 39%    +116.8%      51695 =C2=B1  9%  numa-meminfo.node3.=
SReclaimable
      1612 =C2=B1 48%    +377.7%       7701 =C2=B1 26%  numa-meminfo.node3.=
Shmem
     52988 =C2=B1 71%     -70.9%      15424 =C2=B1  5%  numa-vmstat.node0.n=
r_active_anon
     50771 =C2=B1 74%     -69.5%      15467 =C2=B1  5%  numa-vmstat.node0.n=
r_anon_pages
      7156 =C2=B1  3%     -30.4%       4978        numa-vmstat.node0.nr_shm=
em
     24067 =C2=B1  8%     -66.7%       8025 =C2=B1  3%  numa-vmstat.node0.n=
r_slab_reclaimable
     39378 =C2=B1 55%     -45.5%      21444        numa-vmstat.node0.nr_sla=
b_unreclaimable
     52988 =C2=B1 71%     -70.9%      15424 =C2=B1  5%  numa-vmstat.node0.n=
r_zone_active_anon
    674305 =C2=B1 19%     -23.6%     515357 =C2=B1  3%  numa-vmstat.node0.n=
uma_hit
    672585 =C2=B1 19%     -28.0%     484049 =C2=B1  3%  numa-vmstat.node0.n=
uma_local
      1719 =C2=B1  3%   +1720.5%      31307        numa-vmstat.node0.numa_o=
ther
    267.25 =C2=B1 25%     -82.4%      47.00 =C2=B1 72%  numa-vmstat.node1.n=
r_inactive_anon
      1267 =C2=B1  4%      +3.3%       1309 =C2=B1  4%  numa-vmstat.node1.n=
r_mapped
    277.50 =C2=B1 23%     -49.9%     139.00 =C2=B1  7%  numa-vmstat.node1.n=
r_shmem
    267.25 =C2=B1 25%     -82.4%      47.00 =C2=B1 72%  numa-vmstat.node1.n=
r_zone_inactive_anon
     26830 =C2=B1 48%    +330.4%     115485 =C2=B1  5%  numa-vmstat.node2.n=
r_active_anon
     26878 =C2=B1 48%    +326.7%     114684 =C2=B1  5%  numa-vmstat.node2.n=
r_anon_pages
     62390            +8.9%      67941 =C2=B1  7%  numa-vmstat.node2.nr_fil=
e_pages
      5612 =C2=B1  2%   +2183.0%     128119        numa-vmstat.node2.nr_ker=
nel_stack
      1238            +6.2%       1315 =C2=B1  5%  numa-vmstat.node2.nr_map=
ped
    719.50 =C2=B1 57%   +9745.0%      70835 =C2=B1  8%  numa-vmstat.node2.n=
r_page_table_pages
    253.25 =C2=B1 19%    +311.1%       1041 =C2=B1 53%  numa-vmstat.node2.n=
r_shmem
      3889 =C2=B1  7%    +247.5%      13517 =C2=B1 12%  numa-vmstat.node2.n=
r_slab_reclaimable
     14889 =C2=B1  6%    +379.5%      71397        numa-vmstat.node2.nr_sla=
b_unreclaimable
     62037            +7.5%      66670 =C2=B1  6%  numa-vmstat.node2.nr_une=
victable
     26830 =C2=B1 48%    +330.4%     115485 =C2=B1  5%  numa-vmstat.node2.n=
r_zone_active_anon
     62037            +7.5%      66670 =C2=B1  6%  numa-vmstat.node2.nr_zon=
e_unevictable
    298653 =C2=B1  7%     +95.0%     582384        numa-vmstat.node2.numa_h=
it
    185598 =C2=B1 11%    +155.9%     474964        numa-vmstat.node2.numa_l=
ocal
    144.25 =C2=B1 71%    +132.2%     335.00 =C2=B1 45%  numa-vmstat.node3.n=
r_inactive_anon
     52258 =C2=B1 56%     -99.0%     504.50 =C2=B1 36%  numa-vmstat.node3.n=
r_page_table_pages
    403.50 =C2=B1 48%    +376.8%       1924 =C2=B1 26%  numa-vmstat.node3.n=
r_shmem
      5961 =C2=B1 39%    +116.9%      12927 =C2=B1  9%  numa-vmstat.node3.n=
r_slab_reclaimable
    144.25 =C2=B1 71%    +132.2%     335.00 =C2=B1 45%  numa-vmstat.node3.n=
r_zone_inactive_anon
    112785           -21.2%      88887 =C2=B1  6%  numa-vmstat.node3.numa_o=
ther
     32578 =C2=B1 10%     -13.9%      28035        softirqs.CPU10.TIMER
     31748 =C2=B1  9%     -14.3%      27201        softirqs.CPU100.TIMER
     31646 =C2=B1  8%     -12.3%      27766        softirqs.CPU101.TIMER
     31008 =C2=B1  7%     -12.7%      27078        softirqs.CPU102.TIMER
     31788 =C2=B1 10%     -14.9%      27056        softirqs.CPU103.TIMER
     31729 =C2=B1  8%     -14.7%      27073        softirqs.CPU104.TIMER
     31415 =C2=B1  7%     -13.9%      27037        softirqs.CPU105.TIMER
     31606 =C2=B1 10%     -14.8%      26924        softirqs.CPU106.TIMER
     30924 =C2=B1  8%     -12.7%      26983        softirqs.CPU107.TIMER
     31042 =C2=B1  7%     -13.2%      26952        softirqs.CPU108.TIMER
     31113 =C2=B1  6%     -12.6%      27182        softirqs.CPU109.TIMER
     32157 =C2=B1  8%     -12.8%      28041        softirqs.CPU11.TIMER
     31768 =C2=B1  7%     -15.1%      26969        softirqs.CPU110.TIMER
     31708 =C2=B1  9%     -14.8%      27018        softirqs.CPU111.TIMER
     31989 =C2=B1  6%     -15.3%      27088        softirqs.CPU112.TIMER
     32354 =C2=B1  7%     -16.6%      26968        softirqs.CPU113.TIMER
     31293 =C2=B1  6%     -14.2%      26843        softirqs.CPU114.TIMER
     31129 =C2=B1  7%     -13.7%      26870        softirqs.CPU115.TIMER
     31818 =C2=B1  5%     -14.9%      27074        softirqs.CPU117.TIMER
     31706 =C2=B1  6%     -14.6%      27067        softirqs.CPU118.TIMER
     32302 =C2=B1  8%     -12.7%      28198 =C2=B1  2%  softirqs.CPU12.TIMER
     32852 =C2=B1  9%     -14.6%      28058        softirqs.CPU13.TIMER
     28951 =C2=B1  6%      -7.4%      26808        softirqs.CPU147.TIMER
     29375 =C2=B1  7%      -7.9%      27053        softirqs.CPU148.TIMER
     32964 =C2=B1  9%     -14.8%      28077        softirqs.CPU15.TIMER
     29081 =C2=B1  6%      -7.2%      26984        softirqs.CPU150.TIMER
     29028 =C2=B1  6%      -7.5%      26853        softirqs.CPU152.TIMER
     28918 =C2=B1  7%      -7.4%      26780        softirqs.CPU158.TIMER
     29128 =C2=B1  7%      -7.9%      26840        softirqs.CPU159.TIMER
     32669 =C2=B1  9%     -13.9%      28130        softirqs.CPU16.TIMER
     28807 =C2=B1  6%      -8.1%      26482        softirqs.CPU162.TIMER
     29120 =C2=B1  7%      -8.8%      26544        softirqs.CPU164.TIMER
     33381 =C2=B1  9%     -16.0%      28032        softirqs.CPU17.TIMER
     24424 =C2=B1  3%     +11.4%      27218 =C2=B1  5%  softirqs.CPU170.RCU
     30548 =C2=B1 10%     -13.5%      26436        softirqs.CPU171.TIMER
     30675 =C2=B1  9%     -13.7%      26469        softirqs.CPU172.TIMER
     30949 =C2=B1 10%     -13.9%      26650        softirqs.CPU173.TIMER
     30559 =C2=B1  9%     -15.0%      25980        softirqs.CPU174.TIMER
     30435 =C2=B1 10%     -13.8%      26234        softirqs.CPU176.TIMER
     30427 =C2=B1 10%     -14.2%      26104        softirqs.CPU177.TIMER
     30221 =C2=B1 10%     -13.2%      26220        softirqs.CPU178.TIMER
     30497 =C2=B1 11%     -13.4%      26402        softirqs.CPU179.TIMER
     32166 =C2=B1  8%     -13.2%      27924        softirqs.CPU18.TIMER
     30188 =C2=B1  9%     -13.0%      26256        softirqs.CPU180.TIMER
     30317 =C2=B1  9%     -13.6%      26205        softirqs.CPU181.TIMER
     30256 =C2=B1  9%     -13.3%      26227        softirqs.CPU182.TIMER
     30373 =C2=B1  9%     -14.3%      26017 =C2=B1  2%  softirqs.CPU184.TIM=
ER
     30857 =C2=B1  8%     -14.3%      26434        softirqs.CPU185.TIMER
     30779 =C2=B1  8%     -14.8%      26234        softirqs.CPU186.TIMER
     30871 =C2=B1 11%     -17.4%      25500 =C2=B1  3%  softirqs.CPU187.TIM=
ER
     30105 =C2=B1  9%     -12.4%      26357        softirqs.CPU188.TIMER
     30180 =C2=B1  9%     -11.8%      26622        softirqs.CPU189.TIMER
     32606 =C2=B1  8%     -11.7%      28778        softirqs.CPU19.TIMER
     30348 =C2=B1 10%     -12.9%      26426        softirqs.CPU190.TIMER
     32679 =C2=B1  8%     -12.8%      28484 =C2=B1  2%  softirqs.CPU2.TIMER
     32633 =C2=B1  9%     -12.7%      28482        softirqs.CPU20.TIMER
     32846 =C2=B1  9%     -14.5%      28092        softirqs.CPU21.TIMER
     32451 =C2=B1  7%     -13.6%      28038        softirqs.CPU22.TIMER
     31888 =C2=B1  8%     -12.2%      27989        softirqs.CPU23.TIMER
     32673 =C2=B1  9%     -13.3%      28340        softirqs.CPU3.TIMER
     30578 =C2=B1  7%     -10.0%      27535        softirqs.CPU49.TIMER
     32571 =C2=B1  7%     -13.4%      28205        softirqs.CPU5.TIMER
     30578 =C2=B1  6%      -9.5%      27667        softirqs.CPU51.TIMER
     30173 =C2=B1  7%      -8.2%      27697        softirqs.CPU52.TIMER
     29841 =C2=B1  6%      -7.9%      27496        softirqs.CPU53.TIMER
     29906 =C2=B1  6%      -8.0%      27527        softirqs.CPU56.TIMER
     29967 =C2=B1  5%      -7.6%      27701        softirqs.CPU57.TIMER
     29938 =C2=B1  6%      -7.3%      27765        softirqs.CPU58.TIMER
     30465 =C2=B1  6%      -9.6%      27541        softirqs.CPU59.TIMER
     32882 =C2=B1  6%     -14.1%      28238        softirqs.CPU6.TIMER
     30412 =C2=B1  7%      -9.6%      27507        softirqs.CPU60.TIMER
     31318 =C2=B1  6%     -11.7%      27643        softirqs.CPU62.TIMER
     31305 =C2=B1  7%     -11.3%      27776        softirqs.CPU63.TIMER
     24337 =C2=B1  5%      +8.7%      26447 =C2=B1  4%  softirqs.CPU66.RCU
     30129 =C2=B1  5%      -8.3%      27630        softirqs.CPU66.TIMER
     24350 =C2=B1  4%      +8.2%      26346 =C2=B1  5%  softirqs.CPU67.RCU
     31037 =C2=B1  6%     -11.7%      27413        softirqs.CPU68.TIMER
     30792 =C2=B1  7%      -9.4%      27893        softirqs.CPU69.TIMER
     32250 =C2=B1  7%     -12.4%      28241        softirqs.CPU7.TIMER
     30980 =C2=B1  5%      -9.7%      27967        softirqs.CPU70.TIMER
     30611 =C2=B1  5%     -10.1%      27526        softirqs.CPU71.TIMER
     31699 =C2=B1  9%     -11.9%      27921 =C2=B1  2%  softirqs.CPU73.TIMER
     31857 =C2=B1 10%     -13.4%      27585        softirqs.CPU77.TIMER
     31624 =C2=B1  9%     -15.3%      26795 =C2=B1  2%  softirqs.CPU78.TIMER
     31386 =C2=B1  9%     -12.8%      27368        softirqs.CPU79.TIMER
     32576 =C2=B1  9%     -13.5%      28174        softirqs.CPU8.TIMER
     31444 =C2=B1 10%     -14.0%      27045        softirqs.CPU80.TIMER
     31232 =C2=B1 10%     -12.5%      27325        softirqs.CPU81.TIMER
     31572 =C2=B1 11%     -13.9%      27185        softirqs.CPU82.TIMER
     31527 =C2=B1 10%     -14.1%      27071        softirqs.CPU83.TIMER
     31293 =C2=B1  9%     -13.6%      27025        softirqs.CPU84.TIMER
     31232 =C2=B1  9%     -13.7%      26962        softirqs.CPU85.TIMER
     31197 =C2=B1 10%     -15.1%      26492 =C2=B1  2%  softirqs.CPU86.TIMER
     31215 =C2=B1  9%     -12.7%      27238        softirqs.CPU87.TIMER
     31372 =C2=B1 10%     -13.0%      27308        softirqs.CPU88.TIMER
     31465 =C2=B1  9%     -14.3%      26968 =C2=B1  3%  softirqs.CPU89.TIMER
     32612 =C2=B1  9%     -14.3%      27953        softirqs.CPU9.TIMER
     31643 =C2=B1  8%     -16.5%      26422 =C2=B1  3%  softirqs.CPU90.TIMER
     30989 =C2=B1  9%     -14.4%      26521 =C2=B1  2%  softirqs.CPU92.TIMER
     31242 =C2=B1  9%     -12.0%      27494        softirqs.CPU93.TIMER
     31073 =C2=B1  9%     -13.4%      26913        softirqs.CPU94.TIMER
     25373           -12.6%      22177 =C2=B1  3%  softirqs.CPU95.RCU
     33071 =C2=B1  8%     -17.2%      27398        softirqs.CPU97.TIMER
     26081 =C2=B1  6%      -9.1%      23705        softirqs.CPU98.RCU
     31449 =C2=B1  9%     -15.7%      26505        softirqs.CPU98.TIMER
     31934 =C2=B1  8%     -14.5%      27300        softirqs.CPU99.TIMER



***************************************************************************=
************************
lkp-ivb-2ep1: 48 threads Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz with 64G=
 memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/te=
stcase/ucode:
  gcc-7/performance/x86_64-rhel-7.6/7000t/debian-x86_64-2019-05-14.cgz/300s=
/lkp-ivb-2ep1/shared_memory/reaim/0x42e

commit: =

  4f23dbc1e6 ("locking/rwsem: Implement lock handoff to prevent lock starva=
tion")
  00f3c5a3df ("locking/rwsem: Always release wait_lock before waking up tas=
ks")

4f23dbc1e657951e 00f3c5a3df2c1e3dab14d0dd2b7 =

---------------- --------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

          1:4          -25%            :2     dmesg.WARNING:at#for_ip_inter=
rupt_entry/0x
         %stddev     %change         %stddev
             \          |                \  =

     45.00 =C2=B1 16%     +25.6%      56.50 =C2=B1 11%  vmstat.procs.r
 6.093e+08 =C2=B1 19%     +41.0%  8.588e+08 =C2=B1 32%  cpuidle.C1.time
   8005497 =C2=B1 11%     +34.4%   10759454 =C2=B1 28%  cpuidle.C1.usage
   8001963 =C2=B1 11%     +34.4%   10756594 =C2=B1 28%  turbostat.C1
      4.03 =C2=B1 19%      +1.6        5.67 =C2=B1 32%  turbostat.C1%
      6.89 =C2=B1 29%     +48.0%      10.20 =C2=B1 12%  turbostat.CPU%c6
      2.18 =C2=B1 26%     +47.4%       3.21 =C2=B1 23%  turbostat.Pkg%pc2
    202.00            +9.9%     222.00        proc-vmstat.nr_inactive_file
     16125            +2.1%      16469        proc-vmstat.nr_shmem
     19096            -2.9%      18541        proc-vmstat.nr_slab_reclaimab=
le
    202.00            +9.9%     222.00        proc-vmstat.nr_zone_inactive_=
file
      5269 =C2=B1  5%     +10.4%       5819 =C2=B1  3%  proc-vmstat.pgactiv=
ate
    105576 =C2=B1  2%     +31.9%     139239 =C2=B1 16%  softirqs.CPU28.TIMER
      6097 =C2=B1169%     -98.4%      96.50 =C2=B1  9%  softirqs.CPU29.NET_=
RX
      6060 =C2=B1169%    +294.5%      23910        softirqs.CPU31.NET_RX
     81682 =C2=B1  7%     +12.4%      91797        softirqs.CPU37.RCU
    106031            +9.1%     115712 =C2=B1  5%  softirqs.CPU4.TIMER
    938.75 =C2=B1  9%     +13.4%       1064 =C2=B1  3%  slabinfo.dmaengine-=
unmap-16.active_objs
    938.75 =C2=B1  9%     +13.4%       1064 =C2=B1  3%  slabinfo.dmaengine-=
unmap-16.num_objs
    558.00           +16.7%     651.00 =C2=B1  4%  slabinfo.numa_policy.act=
ive_objs
    558.00           +16.7%     651.00 =C2=B1  4%  slabinfo.numa_policy.num=
_objs
    153.00           +50.0%     229.50 =C2=B1 11%  slabinfo.xfrm_dst_cache.=
active_objs
    153.00           +50.0%     229.50 =C2=B1 11%  slabinfo.xfrm_dst_cache.=
num_objs
 6.594e+09            +1.2%  6.672e+09        perf-stat.i.branch-instructio=
ns
     15.39            +0.3       15.72        perf-stat.i.cache-miss-rate%
      2.28            -3.1%       2.21        perf-stat.i.cpi
 9.788e+09            +1.0%  9.889e+09        perf-stat.i.dTLB-loads
  21054228            -4.0%   20216327        perf-stat.i.iTLB-load-misses
 3.493e+10            +1.2%  3.535e+10        perf-stat.i.instructions
      1785 =C2=B1  2%      +7.5%       1920        perf-stat.i.instructions=
-per-iTLB-miss
      0.45            +2.2%       0.46        perf-stat.i.ipc
     14.34            +0.2       14.56        perf-stat.overall.cache-miss-=
rate%
      1661            +5.3%       1749        perf-stat.overall.instruction=
s-per-iTLB-miss
      0.46            +1.1%       0.47        perf-stat.overall.ipc
    743013            +1.5%     754422        perf-stat.overall.path-length
 6.569e+09            +1.2%  6.646e+09        perf-stat.ps.branch-instructi=
ons
 9.752e+09            +1.0%  9.852e+09        perf-stat.ps.dTLB-loads
 3.479e+10            +1.2%  3.522e+10        perf-stat.ps.instructions
 1.092e+13            +1.5%  1.109e+13        perf-stat.total.instructions
    168.00 =C2=B1  2%      +8.6%     182.50 =C2=B1  5%  interrupts.36:IR-PC=
I-MSI.2621442-edge.eth0-TxRx-1
    169.25 =C2=B1  3%     +11.4%     188.50 =C2=B1  3%  interrupts.39:IR-PC=
I-MSI.2621445-edge.eth0-TxRx-4
     12023 =C2=B1170%    +296.0%      47614        interrupts.42:IR-PCI-MSI=
.2621448-edge.eth0-TxRx-7
      1857 =C2=B1 57%    +157.2%       4777 =C2=B1 32%  interrupts.CPU10.NM=
I:Non-maskable_interrupts
      1857 =C2=B1 57%    +157.2%       4777 =C2=B1 32%  interrupts.CPU10.PM=
I:Performance_monitoring_interrupts
      9964 =C2=B1  8%      +9.7%      10927 =C2=B1  7%  interrupts.CPU14.RE=
S:Rescheduling_interrupts
    708.75 =C2=B1169%    +370.2%       3332 =C2=B1 96%  interrupts.CPU15.NM=
I:Non-maskable_interrupts
    708.75 =C2=B1169%    +370.2%       3332 =C2=B1 96%  interrupts.CPU15.PM=
I:Performance_monitoring_interrupts
      9702 =C2=B1  4%      +9.0%      10579 =C2=B1  4%  interrupts.CPU16.RE=
S:Rescheduling_interrupts
      3535 =C2=B1 12%     -14.5%       3023        interrupts.CPU18.CAL:Fun=
ction_call_interrupts
      9525 =C2=B1  5%     +10.5%      10524        interrupts.CPU19.RES:Res=
cheduling_interrupts
      1664 =C2=B1 68%     +91.4%       3185        interrupts.CPU20.NMI:Non=
-maskable_interrupts
      1664 =C2=B1 68%     +91.4%       3185        interrupts.CPU20.PMI:Per=
formance_monitoring_interrupts
    168.00 =C2=B1  2%      +8.6%     182.50 =C2=B1  5%  interrupts.CPU25.36=
:IR-PCI-MSI.2621442-edge.eth0-TxRx-1
      1757 =C2=B1 58%    +172.3%       4785 =C2=B1 32%  interrupts.CPU27.NM=
I:Non-maskable_interrupts
      1757 =C2=B1 58%    +172.3%       4785 =C2=B1 32%  interrupts.CPU27.PM=
I:Performance_monitoring_interrupts
    169.25 =C2=B1  3%     +11.4%     188.50 =C2=B1  3%  interrupts.CPU28.39=
:IR-PCI-MSI.2621445-edge.eth0-TxRx-4
    189.25 =C2=B1126%   +1794.1%       3584 =C2=B1 82%  interrupts.CPU28.NM=
I:Non-maskable_interrupts
    189.25 =C2=B1126%   +1794.1%       3584 =C2=B1 82%  interrupts.CPU28.PM=
I:Performance_monitoring_interrupts
    624.75 =C2=B1172%    +409.3%       3182 =C2=B1 97%  interrupts.CPU29.NM=
I:Non-maskable_interrupts
    624.75 =C2=B1172%    +409.3%       3182 =C2=B1 97%  interrupts.CPU29.PM=
I:Performance_monitoring_interrupts
     12023 =C2=B1170%    +296.0%      47614        interrupts.CPU31.42:IR-P=
CI-MSI.2621448-edge.eth0-TxRx-7
      2004 =C2=B1 58%     +59.1%       3187        interrupts.CPU36.NMI:Non=
-maskable_interrupts
      2004 =C2=B1 58%     +59.1%       3187        interrupts.CPU36.PMI:Per=
formance_monitoring_interrupts
      1848 =C2=B1110%    +158.4%       4775 =C2=B1 32%  interrupts.CPU42.NM=
I:Non-maskable_interrupts
      1848 =C2=B1110%    +158.4%       4775 =C2=B1 32%  interrupts.CPU42.PM=
I:Performance_monitoring_interrupts
      9944 =C2=B1  7%     +16.6%      11595 =C2=B1  4%  interrupts.CPU42.RE=
S:Rescheduling_interrupts
      2432 =C2=B1  4%     -99.6%      10.00 =C2=B1 90%  interrupts.CPU44.NM=
I:Non-maskable_interrupts
      2432 =C2=B1  4%     -99.6%      10.00 =C2=B1 90%  interrupts.CPU44.PM=
I:Performance_monitoring_interrupts
    623.75 =C2=B1173%    +663.3%       4761 =C2=B1 32%  interrupts.CPU6.NMI=
:Non-maskable_interrupts
    623.75 =C2=B1173%    +663.3%       4761 =C2=B1 32%  interrupts.CPU6.PMI=
:Performance_monitoring_interrupts
      1193 =C2=B1172%    +298.6%       4756 =C2=B1 32%  interrupts.CPU9.NMI=
:Non-maskable_interrupts
      1193 =C2=B1172%    +298.6%       4756 =C2=B1 32%  interrupts.CPU9.PMI=
:Performance_monitoring_interrupts
      9355 =C2=B1  8%     +13.2%      10593 =C2=B1  6%  interrupts.CPU9.RES=
:Rescheduling_interrupts
     66.50 =C2=B1 44%     -45.9%      36.00 =C2=B1  8%  interrupts.CPU9.TLB=
:TLB_shootdowns
     95338 =C2=B1 13%     +24.4%     118623 =C2=B1 10%  interrupts.NMI:Non-=
maskable_interrupts
     95338 =C2=B1 13%     +24.4%     118623 =C2=B1 10%  interrupts.PMI:Perf=
ormance_monitoring_interrupts
     18276 =C2=B1 34%     +95.4%      35703 =C2=B1 29%  sched_debug.cfs_rq:=
/.load.avg
    396888 =C2=B1 33%     +32.9%     527407 =C2=B1  8%  sched_debug.cfs_rq:=
/.load.max
     68973 =C2=B1 26%     +67.5%     115530 =C2=B1 15%  sched_debug.cfs_rq:=
/.load.stddev
     35.56 =C2=B1 10%     +27.5%      45.33 =C2=B1  4%  sched_debug.cfs_rq:=
/.load_avg.avg
    102.31 =C2=B1 14%     +38.2%     141.35 =C2=B1  4%  sched_debug.cfs_rq:=
/.load_avg.stddev
      6.07 =C2=B1 63%    +103.5%      12.35 =C2=B1 14%  sched_debug.cfs_rq:=
/.removed.load_avg.avg
     26.67 =C2=B1 59%     +64.5%      43.88 =C2=B1  6%  sched_debug.cfs_rq:=
/.removed.load_avg.stddev
    280.13 =C2=B1 63%    +103.3%     569.61 =C2=B1 14%  sched_debug.cfs_rq:=
/.removed.runnable_sum.avg
      1230 =C2=B1 59%     +64.4%       2023 =C2=B1  6%  sched_debug.cfs_rq:=
/.removed.runnable_sum.stddev
      1.61 =C2=B1 58%    +188.3%       4.64        sched_debug.cfs_rq:/.rem=
oved.util_avg.avg
     47.17 =C2=B1 64%     +57.6%      74.33 =C2=B1 16%  sched_debug.cfs_rq:=
/.removed.util_avg.max
      8.04 =C2=B1 60%    +110.8%      16.95 =C2=B1  8%  sched_debug.cfs_rq:=
/.removed.util_avg.stddev
     12.11 =C2=B1 33%     +76.7%      21.40 =C2=B1 13%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
     51.67 =C2=B1 26%     +68.8%      87.23        sched_debug.cfs_rq:/.run=
nable_load_avg.stddev
     17578 =C2=B1 36%    +100.8%      35303 =C2=B1 29%  sched_debug.cfs_rq:=
/.runnable_weight.avg
    380029 =C2=B1 35%     +37.8%     523711 =C2=B1  9%  sched_debug.cfs_rq:=
/.runnable_weight.max
     66430 =C2=B1 27%     +72.8%     114787 =C2=B1 15%  sched_debug.cfs_rq:=
/.runnable_weight.stddev
    279.47 =C2=B1 26%     -49.7%     140.62 =C2=B1  3%  sched_debug.cfs_rq:=
/.util_avg.avg
      6.87 =C2=B1 42%     -82.1%       1.23 =C2=B1 16%  sched_debug.cpu.clo=
ck.stddev
      6.87 =C2=B1 42%     -82.1%       1.23 =C2=B1 16%  sched_debug.cpu.clo=
ck_task.stddev
     12.26 =C2=B1 33%     +42.1%      17.42 =C2=B1  7%  sched_debug.cpu.cpu=
_load[0].avg
     51.68 =C2=B1 26%     +54.0%      79.58 =C2=B1  9%  sched_debug.cpu.cpu=
_load[0].stddev
     12.43 =C2=B1 31%     +39.9%      17.39 =C2=B1 14%  sched_debug.cpu.cpu=
_load[1].avg
    312.42 =C2=B1 23%     +51.9%     474.58 =C2=B1 14%  sched_debug.cpu.cpu=
_load[1].max
     50.56 =C2=B1 23%     +56.7%      79.25 =C2=B1 15%  sched_debug.cpu.cpu=
_load[1].stddev
     11.92 =C2=B1 28%     +41.7%      16.90 =C2=B1 15%  sched_debug.cpu.cpu=
_load[2].avg
    325.07 =C2=B1 18%     +66.9%     542.67 =C2=B1 13%  sched_debug.cpu.cpu=
_load[2].max
     49.19 =C2=B1 18%     +67.7%      82.48 =C2=B1 15%  sched_debug.cpu.cpu=
_load[2].stddev
     11.52 =C2=B1 25%     +40.7%      16.21 =C2=B1 13%  sched_debug.cpu.cpu=
_load[3].avg
    335.89 =C2=B1 14%     +76.2%     591.83 =C2=B1 11%  sched_debug.cpu.cpu=
_load[3].max
     49.24 =C2=B1 14%     +74.6%      85.98 =C2=B1 12%  sched_debug.cpu.cpu=
_load[3].stddev
     11.46 =C2=B1 26%     +40.7%      16.12 =C2=B1 10%  sched_debug.cpu.cpu=
_load[4].avg
    355.26 =C2=B1  8%     +82.7%     649.08 =C2=B1  9%  sched_debug.cpu.cpu=
_load[4].max
     51.09 =C2=B1  8%     +82.0%      92.95 =C2=B1  9%  sched_debug.cpu.cpu=
_load[4].stddev
      5957 =C2=B1 87%     -72.0%       1667        sched_debug.cpu.curr->pi=
d.avg
     15141 =C2=B1 19%     -28.5%      10833        sched_debug.cpu.curr->pi=
d.stddev
     77073 =C2=B1 31%     +33.7%     103028 =C2=B1  5%  sched_debug.cpu.loa=
d.stddev
      0.18 =C2=B1 52%     -42.0%       0.10 =C2=B1  3%  sched_debug.cpu.nr_=
running.avg
      1.30 =C2=B1  4%     -23.1%       1.00        sched_debug.cpu.nr_runni=
ng.max
      0.35 =C2=B1 10%     -18.0%       0.28        sched_debug.cpu.nr_runni=
ng.stddev
      8109 =C2=B1 11%     +49.7%      12141 =C2=B1 28%  sched_debug.cpu.ttw=
u_local.max
    459.06 =C2=B1 14%    +101.8%     926.21 =C2=B1 44%  sched_debug.cpu.ttw=
u_local.stddev
      0.78 =C2=B1  3%      -0.1        0.64        perf-profile.calltrace.c=
ycles-pp.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      0.90 =C2=B1  2%      -0.1        0.77        perf-profile.calltrace.c=
ycles-pp.do_page_fault.page_fault
      0.91 =C2=B1  2%      -0.1        0.78        perf-profile.calltrace.c=
ycles-pp.page_fault
      0.88 =C2=B1  3%      -0.1        0.75        perf-profile.calltrace.c=
ycles-pp.__do_page_fault.do_page_fault.page_fault
      0.74 =C2=B1  4%      -0.1        0.61        perf-profile.calltrace.c=
ycles-pp.__handle_mm_fault.handle_mm_fault.__do_page_fault.do_page_fault.pa=
ge_fault
      0.54 =C2=B1  5%      +0.1        0.60 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.dentry_kill.dput.__fput.task_work_run.exit_to_usermode_loop
      0.56 =C2=B1  6%      +0.1        0.64 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.dput.__fput.task_work_run.exit_to_usermode_loop.do_syscall_64
      0.72 =C2=B1  6%      +0.1        0.80        perf-profile.calltrace.c=
ycles-pp.__fput.task_work_run.exit_to_usermode_loop.do_syscall_64.entry_SYS=
CALL_64_after_hwframe
      0.73 =C2=B1  8%      +0.1        0.82 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.newseg.ipcget.__x64_sys_shmget.do_syscall_64.entry_SYSCALL_64=
_after_hwframe
      0.77 =C2=B1  7%      +0.1        0.86 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.task_work_run.exit_to_usermode_loop.do_syscall_64.entry_SYSCA=
LL_64_after_hwframe
      0.80 =C2=B1  7%      +0.1        0.90        perf-profile.calltrace.c=
ycles-pp.down_write.shmctl_down.ksys_shmctl.do_syscall_64.entry_SYSCALL_64_=
after_hwframe
      0.81 =C2=B1  7%      +0.1        0.91        perf-profile.calltrace.c=
ycles-pp.exit_to_usermode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.91 =C2=B1  5%      +0.1        1.02 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.do_smart_wakeup_zero.do_smart_update.do_semtimedop.do_syscall=
_64.entry_SYSCALL_64_after_hwframe
      1.43 =C2=B1  6%      +0.1        1.54        perf-profile.calltrace.c=
ycles-pp.shmctl_down.ksys_shmctl.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me
      1.43 =C2=B1  6%      +0.1        1.56        perf-profile.calltrace.c=
ycles-pp.ksys_shmctl.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.93 =C2=B1  9%      +0.1        1.07 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.down_write.do_shmat.__x64_sys_shmat.do_syscall_64.entry_SYSCA=
LL_64_after_hwframe
      0.89 =C2=B1  9%      +0.1        1.04 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.rwsem_down_write_slowpath.down_write.do_shmat.__x64_sys_shmat=
.do_syscall_64
      1.34 =C2=B1  7%      +0.2        1.50        perf-profile.calltrace.c=
ycles-pp._copy_from_user.do_semtimedop.do_syscall_64.entry_SYSCALL_64_after=
_hwframe
      1.77 =C2=B1  6%      +0.2        1.94        perf-profile.calltrace.c=
ycles-pp.do_smart_update.do_semtimedop.do_syscall_64.entry_SYSCALL_64_after=
_hwframe
      0.40 =C2=B1 58%      +0.2        0.59 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.__dentry_kill.dentry_kill.dput.__fput.task_work_run
      0.41 =C2=B1 57%      +0.2        0.62 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.perform_atomic_semop.do_semtimedop.do_syscall_64.entry_SYSCAL=
L_64_after_hwframe
      2.00 =C2=B1  5%      +0.3        2.27 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.do_shmat.__x64_sys_shmat.do_syscall_64.entry_SYSCALL_64_after=
_hwframe
      2.00 =C2=B1  5%      +0.3        2.28 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.__x64_sys_shmat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.19 =C2=B1  5%      +0.4        4.54        perf-profile.calltrace.c=
ycles-pp.ipc_obtain_object_check.do_semtimedop.do_syscall_64.entry_SYSCALL_=
64_after_hwframe
      0.13 =C2=B1173%      +0.4        0.52        perf-profile.calltrace.c=
ycles-pp.do_mmap.do_shmat.__x64_sys_shmat.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe
      1.12 =C2=B1 12%      +0.4        1.50 =C2=B1 13%  perf-profile.calltr=
ace.cycles-pp.osq_lock.rwsem_down_write_slowpath.down_write.shm_close.remov=
e_vma
      1.58 =C2=B1  9%      +0.4        1.98 =C2=B1 10%  perf-profile.calltr=
ace.cycles-pp.rwsem_down_write_slowpath.down_write.shm_close.remove_vma.__d=
o_munmap
      1.62 =C2=B1  9%      +0.4        2.04 =C2=B1 10%  perf-profile.calltr=
ace.cycles-pp.down_write.shm_close.remove_vma.__do_munmap.ksys_shmdt
      1.67 =C2=B1  9%      +0.4        2.10 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.shm_close.remove_vma.__do_munmap.ksys_shmdt.do_syscall_64
      2.16 =C2=B1  8%      +0.4        2.61 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.remove_vma.__do_munmap.ksys_shmdt.do_syscall_64.entry_SYSCALL=
_64_after_hwframe
      2.69 =C2=B1  8%      +0.5        3.17 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.__do_munmap.ksys_shmdt.do_syscall_64.entry_SYSCALL_64_after_h=
wframe
      2.73 =C2=B1  8%      +0.5        3.22 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.ksys_shmdt.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.02 =C2=B1  6%      +0.5        6.53 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.syscall_return_via_sysret
      8.28 =C2=B1 32%      +3.6       11.89 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.ipcget.__x64_sys_shmget.do_syscall_64.entry_SYSCALL_64_after_=
hwframe
      8.29 =C2=B1 32%      +3.6       11.91 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.__x64_sys_shmget.do_syscall_64.entry_SYSCALL_64_after_hwframe
     49.89 =C2=B1  9%      +6.4       56.31        perf-profile.calltrace.c=
ycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
     50.69 =C2=B1  9%      +6.5       57.20        perf-profile.calltrace.c=
ycles-pp.entry_SYSCALL_64_after_hwframe
      1.49 =C2=B1 11%      -0.4        1.14 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.apic_timer_interrupt
      1.42 =C2=B1 11%      -0.3        1.08 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.smp_apic_timer_interrupt
      1.04 =C2=B1  6%      -0.3        0.78        perf-profile.children.cy=
cles-pp.page_fault
      1.01 =C2=B1  5%      -0.3        0.75        perf-profile.children.cy=
cles-pp.__do_page_fault
      1.02 =C2=B1  6%      -0.3        0.77        perf-profile.children.cy=
cles-pp.do_page_fault
      0.89 =C2=B1  5%      -0.2        0.65        perf-profile.children.cy=
cles-pp.handle_mm_fault
      0.86 =C2=B1  5%      -0.2        0.61        perf-profile.children.cy=
cles-pp.__handle_mm_fault
      0.82 =C2=B1 13%      -0.2        0.64 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.hrtimer_interrupt
      0.34 =C2=B1 23%      -0.2        0.17        perf-profile.children.cy=
cles-pp.menu_select
      0.48 =C2=B1 10%      -0.1        0.39 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.irq_exit
      0.38 =C2=B1 12%      -0.1        0.32        perf-profile.children.cy=
cles-pp.tick_sched_timer
      0.11 =C2=B1 12%      -0.1        0.05        perf-profile.children.cy=
cles-pp.load_balance
      0.08 =C2=B1 10%      -0.1        0.03 =C2=B1100%  perf-profile.childr=
en.cycles-pp.run_rebalance_domains
      0.08 =C2=B1 11%      -0.1        0.03 =C2=B1100%  perf-profile.childr=
en.cycles-pp.update_blocked_averages
      0.10 =C2=B1 21%      -0.0        0.07 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.rebalance_domains
      0.10 =C2=B1 18%      -0.0        0.07        perf-profile.children.cy=
cles-pp.swapgs_restore_regs_and_return_to_usermode
      0.07 =C2=B1 13%      -0.0        0.05        perf-profile.children.cy=
cles-pp.__update_load_avg_cfs_rq
      0.11 =C2=B1  3%      +0.0        0.12 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.up_write
      0.11 =C2=B1  8%      +0.0        0.12 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.idr_alloc_u32
      0.07 =C2=B1 10%      +0.0        0.08 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.idr_replace
      0.11 =C2=B1 11%      +0.0        0.13 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.idr_alloc_cyclic
      0.11 =C2=B1  6%      +0.0        0.13        perf-profile.children.cy=
cles-pp.shmem_get_unmapped_area
      0.10 =C2=B1  8%      +0.0        0.12        perf-profile.children.cy=
cles-pp.arch_get_unmapped_area_topdown
      0.25 =C2=B1  4%      +0.0        0.27        perf-profile.children.cy=
cles-pp.fpregs_assert_state_consistent
      0.17 =C2=B1  4%      +0.0        0.20 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.shm_destroy
      0.14 =C2=B1  5%      +0.0        0.17 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.get_unmapped_area
      0.10 =C2=B1 15%      +0.0        0.14 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.task_tick_fair
      0.28 =C2=B1  5%      +0.0        0.32        perf-profile.children.cy=
cles-pp.arch_stack_walk
      0.24 =C2=B1  7%      +0.0        0.28        perf-profile.children.cy=
cles-pp.newary
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1  9%  perf-profile.childr=
en.cycles-pp._cond_resched
      1.04 =C2=B1  4%      +0.1        1.10 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.do_smart_wakeup_zero
      0.76 =C2=B1  4%      +0.1        0.81        perf-profile.children.cy=
cles-pp.__fput
      0.81 =C2=B1  5%      +0.1        0.86 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.task_work_run
      0.86 =C2=B1  4%      +0.1        0.92        perf-profile.children.cy=
cles-pp.exit_to_usermode_loop
      0.76 =C2=B1  2%      +0.1        0.82 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.newseg
      0.32 =C2=B1  7%      +0.1        0.39        perf-profile.children.cy=
cles-pp.ipc_addid
      1.47 =C2=B1  5%      +0.1        1.54        perf-profile.children.cy=
cles-pp._copy_from_user
      0.35 =C2=B1  5%      +0.1        0.43 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.ksys_semget
      0.57            +0.1        0.66 =C2=B1  2%  perf-profile.children.cy=
cles-pp.perform_atomic_semop
      0.28 =C2=B1  7%      +0.1        0.39 =C2=B1 19%  perf-profile.childr=
en.cycles-pp.semctl_down
      0.37 =C2=B1  5%      +0.1        0.48 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.ksys_semctl
      2.10 =C2=B1  6%      +0.2        2.27 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.do_shmat
      2.10 =C2=B1  5%      +0.2        2.28 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.__x64_sys_shmat
      1.74 =C2=B1  7%      +0.4        2.10 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.shm_close
      2.25 =C2=B1  6%      +0.4        2.62 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.remove_vma
      0.08 =C2=B1 15%      -0.1        0.03 =C2=B1100%  perf-profile.self.c=
ycles-pp.cpuidle_enter_state
      0.16 =C2=B1 16%      -0.1        0.11        perf-profile.self.cycles=
-pp.menu_select
      0.11 =C2=B1  4%      -0.0        0.10 =C2=B1  5%  perf-profile.self.c=
ycles-pp.wake_up_q
      0.23 =C2=B1  3%      +0.0        0.25        perf-profile.self.cycles=
-pp.fpregs_assert_state_consistent
      0.13 =C2=B1  6%      +0.0        0.15 =C2=B1  3%  perf-profile.self.c=
ycles-pp.unwind_next_frame
      0.16 =C2=B1  4%      +0.0        0.18 =C2=B1  5%  perf-profile.self.c=
ycles-pp.down_write
      0.63 =C2=B1  2%      +0.0        0.66        perf-profile.self.cycles=
-pp.do_smart_wakeup_zero
      0.01 =C2=B1173%      +0.0        0.06 =C2=B1  9%  perf-profile.self.c=
ycles-pp.ktime_get_real_seconds
      0.72 =C2=B1  4%      +0.0        0.77        perf-profile.self.cycles=
-pp.entry_SYSCALL_64_after_hwframe
      0.29 =C2=B1  6%      +0.0        0.34        perf-profile.self.cycles=
-pp._copy_from_user
      0.56            +0.1        0.64        perf-profile.self.cycles-pp.p=
erform_atomic_semop



***************************************************************************=
************************
lkp-ivb-2ep1: 48 threads Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz with 64G=
 memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/te=
stcase/ucode:
  gcc-7/performance/x86_64-rhel-7.6/400t/debian-x86_64-2019-05-14.cgz/300s/=
lkp-ivb-2ep1/disk_src/reaim/0x42e

commit: =

  4f23dbc1e6 ("locking/rwsem: Implement lock handoff to prevent lock starva=
tion")
  00f3c5a3df ("locking/rwsem: Always release wait_lock before waking up tas=
ks")

4f23dbc1e657951e 00f3c5a3df2c1e3dab14d0dd2b7 =

---------------- --------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :4           25%           1:2     dmesg.WARNING:at#for_ip_inter=
rupt_entry/0x
          2:4          -50%            :2     dmesg.WARNING:at#for_ip_swapg=
s_restore_regs_and_return_to_usermode/0x
           :4           25%           1:2     dmesg.WARNING:at_ip__fsnotify=
_parent/0x



***************************************************************************=
************************
lkp-ivb-2ep1: 48 threads Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz with 64G=
 memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/directio/disk/fstype/kconfig/media/rootfs/tbox_gr=
oup/test/testcase/ucode:
  gcc-7/performance/directio/1HDD/xfs/x86_64-rhel-7.6/hdd/debian-x86_64-201=
9-05-14.cgz/lkp-ivb-2ep1/MWUL/fxmark/0x42e

commit: =

  4f23dbc1e6 ("locking/rwsem: Implement lock handoff to prevent lock starva=
tion")
  00f3c5a3df ("locking/rwsem: Always release wait_lock before waking up tas=
ks")

4f23dbc1e657951e 00f3c5a3df2c1e3dab14d0dd2b7 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      0.18 =C2=B1 17%     +30.0%       0.23        fxmark.hdd_xfs_MWUL_12_d=
irectio.iowait_util
      1145            +0.9%       1156        boot-time.idle
    197.75            +2.9%     203.50        vmstat.io.bi
  46933823           +15.4%   54152343 =C2=B1 11%  cpuidle.C1.time
    675211            +8.7%     733632 =C2=B1  7%  cpuidle.C1.usage
    441822 =C2=B1 74%    +107.2%     915380 =C2=B1 11%  cpuidle.C1E.usage
      0.87 =C2=B1  6%     +14.6%       0.99 =C2=B1  5%  iostat.cpu.iowait
     12.52            +3.9%      13.01        iostat.cpu.system
      9725            +1.8%       9900        iostat.sda.wkB/s
    250.50 =C2=B1  7%     +50.7%     377.50 =C2=B1  4%  slabinfo.numa_polic=
y.active_objs
      1586 =C2=B1  2%     +17.4%       1862 =C2=B1 11%  slabinfo.proc_inode=
_cache.active_objs
      2208 =C2=B1  3%     +17.4%       2592 =C2=B1  7%  slabinfo.proc_inode=
_cache.num_objs
     15301 =C2=B1  3%     +19.6%      18303 =C2=B1  4%  softirqs.BLOCK
      9332 =C2=B1  4%     +10.0%      10265 =C2=B1  5%  softirqs.CPU11.TIMER
      9806 =C2=B1  5%     +76.8%      17339 =C2=B1  3%  softirqs.CPU12.TIMER
     13390 =C2=B1 14%     +19.5%      15996        softirqs.CPU3.RCU
     10236 =C2=B1  6%     -18.3%       8364 =C2=B1  9%  softirqs.CPU40.TIMER
      5703            +2.3%       5834        proc-vmstat.nr_inactive_file
     24468            +0.8%      24675        proc-vmstat.nr_slab_unreclaim=
able
      5703            +2.3%       5834        proc-vmstat.nr_zone_inactive_=
file
      3368 =C2=B1 81%    +190.8%       9794 =C2=B1  8%  proc-vmstat.numa_pa=
ges_migrated
     20369 =C2=B1 59%    +164.1%      53802 =C2=B1 27%  proc-vmstat.numa_pt=
e_updates
      3368 =C2=B1 81%    +190.8%       9794 =C2=B1  8%  proc-vmstat.pgmigra=
te_success
    221862 =C2=B1 15%     -24.2%     168110 =C2=B1  3%  perf-stat.i.dTLB-lo=
ad-misses
      3966            +1.6%       4028        perf-stat.i.minor-faults
     19254 =C2=B1  7%     +12.3%      21613 =C2=B1  6%  perf-stat.i.node-lo=
ad-misses
      2.21 =C2=B1 17%      +0.5        2.72        perf-stat.i.node-store-m=
iss-rate%
     16644 =C2=B1 12%     +20.2%      20014 =C2=B1  6%  perf-stat.i.node-st=
ore-misses
      3966            +1.6%       4028        perf-stat.i.page-faults
    219511 =C2=B1 15%     -24.2%     166480 =C2=B1  3%  perf-stat.ps.dTLB-l=
oad-misses
     19050 =C2=B1  7%     +12.4%      21404 =C2=B1  6%  perf-stat.ps.node-l=
oad-misses
     16480 =C2=B1 12%     +20.3%      19830 =C2=B1  6%  perf-stat.ps.node-s=
tore-misses
     32707 =C2=B1 12%     -49.4%      16539 =C2=B1  3%  numa-meminfo.node0.=
Inactive
     14732 =C2=B1  3%     -88.7%       1669 =C2=B1 16%  numa-meminfo.node0.=
Inactive(anon)
     16642           -10.0%      14973        numa-meminfo.node0.Mapped
     14864 =C2=B1  3%     -88.0%       1778 =C2=B1 14%  numa-meminfo.node0.=
Shmem
    534994           +10.7%     592351        numa-meminfo.node0.Unevictable
      6988 =C2=B1 55%    +230.7%      23113        numa-meminfo.node1.Inact=
ive
      1740 =C2=B1 32%    +749.7%      14785 =C2=B1  2%  numa-meminfo.node1.=
Inactive(anon)
     14910           +11.8%      16667        numa-meminfo.node1.Mapped
     37981 =C2=B1  4%     +14.0%      43311        numa-meminfo.node1.SUnre=
claim
      1788 =C2=B1 32%    +730.6%      14853        numa-meminfo.node1.Shmem
    587633            -9.7%     530463        numa-meminfo.node1.Unevictable
     71788 =C2=B1  4%     +13.3%      81318        interrupts.CAL:Function_=
call_interrupts
      2387 =C2=B1 26%     +78.0%       4249 =C2=B1 18%  interrupts.CPU0.CAL=
:Function_call_interrupts
      2160 =C2=B1 18%     +62.1%       3502 =C2=B1 16%  interrupts.CPU1.CAL=
:Function_call_interrupts
      2464 =C2=B1 15%     +67.9%       4137 =C2=B1 14%  interrupts.CPU2.CAL=
:Function_call_interrupts
    161.25 =C2=B1 20%    +118.6%     352.50 =C2=B1 33%  interrupts.CPU21.RE=
S:Rescheduling_interrupts
      1705 =C2=B1 14%     +18.9%       2028 =C2=B1  4%  interrupts.CPU22.CA=
L:Function_call_interrupts
      2565 =C2=B1 22%     +43.4%       3679        interrupts.CPU3.CAL:Func=
tion_call_interrupts
      1151 =C2=B1 13%     +21.7%       1401        interrupts.CPU3.RES:Resc=
heduling_interrupts
    760.00 =C2=B1 14%    +143.6%       1851 =C2=B1 52%  interrupts.CPU4.RES=
:Rescheduling_interrupts
      2400 =C2=B1 24%     +34.3%       3224 =C2=B1 14%  interrupts.CPU6.CAL=
:Function_call_interrupts
      2011 =C2=B1  3%     +32.5%       2665 =C2=B1  3%  interrupts.CPU7.CAL=
:Function_call_interrupts
     59.75 =C2=B1150%    +141.0%     144.00 =C2=B1 80%  interrupts.CPU8.RES=
:Rescheduling_interrupts
      3681 =C2=B1  3%     -88.7%     416.50 =C2=B1 17%  numa-vmstat.node0.n=
r_inactive_anon
      3714 =C2=B1  3%     -88.1%     442.00 =C2=B1 15%  numa-vmstat.node0.n=
r_shmem
    133747           +10.7%     148087        numa-vmstat.node0.nr_unevicta=
ble
      3681 =C2=B1  3%     -88.7%     416.50 =C2=B1 17%  numa-vmstat.node0.n=
r_zone_inactive_anon
    133747           +10.7%     148087        numa-vmstat.node0.nr_zone_une=
victable
    566715 =C2=B1  5%     +11.1%     629665        numa-vmstat.node0.numa_l=
ocal
    434.75 =C2=B1 31%    +750.1%       3696 =C2=B1  2%  numa-vmstat.node1.n=
r_inactive_anon
    446.75 =C2=B1 32%    +731.2%       3713        numa-vmstat.node1.nr_shm=
em
      9486 =C2=B1  4%     +14.2%      10831        numa-vmstat.node1.nr_sla=
b_unreclaimable
    146908            -9.7%     132615        numa-vmstat.node1.nr_unevicta=
ble
    434.75 =C2=B1 31%    +750.1%       3696 =C2=B1  2%  numa-vmstat.node1.n=
r_zone_inactive_anon
    146908            -9.7%     132615        numa-vmstat.node1.nr_zone_une=
victable
    308139 =C2=B1 10%     -17.1%     255441 =C2=B1  2%  numa-vmstat.node1.n=
uma_local
     75.28 =C2=B1 22%     +88.6%     141.96 =C2=B1 12%  sched_debug.cfs_rq:=
/.load_avg.avg
    210.99 =C2=B1 18%     +49.2%     314.68 =C2=B1  5%  sched_debug.cfs_rq:=
/.load_avg.stddev
      4917 =C2=B1  6%     -16.5%       4106        sched_debug.cfs_rq:/.min=
_vruntime.stddev
     15.85 =C2=B1110%    +429.8%      83.99 =C2=B1 23%  sched_debug.cfs_rq:=
/.removed.load_avg.avg
     87.02 =C2=B1102%    +217.6%     276.43 =C2=B1 10%  sched_debug.cfs_rq:=
/.removed.load_avg.stddev
    725.97 =C2=B1110%    +434.6%       3881 =C2=B1 23%  sched_debug.cfs_rq:=
/.removed.runnable_sum.avg
      3986 =C2=B1102%    +220.4%      12776 =C2=B1 10%  sched_debug.cfs_rq:=
/.removed.runnable_sum.stddev
      5.03 =C2=B1106%    +451.8%      27.76 =C2=B1 16%  sched_debug.cfs_rq:=
/.removed.util_avg.avg
    167.00 =C2=B1100%    +164.4%     441.50 =C2=B1 17%  sched_debug.cfs_rq:=
/.removed.util_avg.max
     27.99 =C2=B1100%    +237.2%      94.38        sched_debug.cfs_rq:/.rem=
oved.util_avg.stddev
     -3468           -52.9%      -1633        sched_debug.cfs_rq:/.spread0.=
min
      4917 =C2=B1  6%     -16.5%       4104        sched_debug.cfs_rq:/.spr=
ead0.stddev
      7.26 =C2=B1 26%     -28.6%       5.18 =C2=B1  2%  sched_debug.cpu.cpu=
_load[1].avg
      8.21 =C2=B1 16%     -28.6%       5.86        sched_debug.cpu.cpu_load=
[2].avg
      9.19 =C2=B1  6%     -20.0%       7.35        sched_debug.cpu.cpu_load=
[3].avg
     10.94 =C2=B1  6%     -14.5%       9.35        sched_debug.cpu.cpu_load=
[4].avg
      2077 =C2=B1  5%      +9.0%       2264        sched_debug.cpu.nr_switc=
hes.stddev





Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Oliver Sang


--===============4811761945175766285==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config-5.2.0-rc5-00067-g00f3c5a"

IwojIEF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgojIExpbnV4L3g4
Nl82NCA1LjIuMC1yYzUgS2VybmVsIENvbmZpZ3VyYXRpb24KIwoKIwojIENvbXBpbGVyOiBnY2Mt
NyAoRGViaWFuIDcuNC4wLTkpIDcuNC4wCiMKQ09ORklHX0NDX0lTX0dDQz15CkNPTkZJR19HQ0Nf
VkVSU0lPTj03MDQwMApDT05GSUdfQ0xBTkdfVkVSU0lPTj0wCkNPTkZJR19DQ19IQVNfQVNNX0dP
VE89eQpDT05GSUdfQ0NfSEFTX1dBUk5fTUFZQkVfVU5JTklUSUFMSVpFRD15CkNPTkZJR19JUlFf
V09SSz15CkNPTkZJR19CVUlMRFRJTUVfRVhUQUJMRV9TT1JUPXkKQ09ORklHX1RIUkVBRF9JTkZP
X0lOX1RBU0s9eQoKIwojIEdlbmVyYWwgc2V0dXAKIwpDT05GSUdfSU5JVF9FTlZfQVJHX0xJTUlU
PTMyCiMgQ09ORklHX0NPTVBJTEVfVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19MT0NBTFZFUlNJT049
IiIKQ09ORklHX0xPQ0FMVkVSU0lPTl9BVVRPPXkKQ09ORklHX0JVSUxEX1NBTFQ9IiIKQ09ORklH
X0hBVkVfS0VSTkVMX0daSVA9eQpDT05GSUdfSEFWRV9LRVJORUxfQlpJUDI9eQpDT05GSUdfSEFW
RV9LRVJORUxfTFpNQT15CkNPTkZJR19IQVZFX0tFUk5FTF9YWj15CkNPTkZJR19IQVZFX0tFUk5F
TF9MWk89eQpDT05GSUdfSEFWRV9LRVJORUxfTFo0PXkKQ09ORklHX0tFUk5FTF9HWklQPXkKIyBD
T05GSUdfS0VSTkVMX0JaSVAyIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VSTkVMX0xaTUEgaXMgbm90
IHNldAojIENPTkZJR19LRVJORUxfWFogaXMgbm90IHNldAojIENPTkZJR19LRVJORUxfTFpPIGlz
IG5vdCBzZXQKIyBDT05GSUdfS0VSTkVMX0xaNCBpcyBub3Qgc2V0CkNPTkZJR19ERUZBVUxUX0hP
U1ROQU1FPSIobm9uZSkiCkNPTkZJR19TV0FQPXkKQ09ORklHX1NZU1ZJUEM9eQpDT05GSUdfU1lT
VklQQ19TWVNDVEw9eQpDT05GSUdfUE9TSVhfTVFVRVVFPXkKQ09ORklHX1BPU0lYX01RVUVVRV9T
WVNDVEw9eQpDT05GSUdfQ1JPU1NfTUVNT1JZX0FUVEFDSD15CkNPTkZJR19VU0VMSUI9eQpDT05G
SUdfQVVESVQ9eQpDT05GSUdfSEFWRV9BUkNIX0FVRElUU1lTQ0FMTD15CkNPTkZJR19BVURJVFNZ
U0NBTEw9eQoKIwojIElSUSBzdWJzeXN0ZW0KIwpDT05GSUdfR0VORVJJQ19JUlFfUFJPQkU9eQpD
T05GSUdfR0VORVJJQ19JUlFfU0hPVz15CkNPTkZJR19HRU5FUklDX0lSUV9FRkZFQ1RJVkVfQUZG
X01BU0s9eQpDT05GSUdfR0VORVJJQ19QRU5ESU5HX0lSUT15CkNPTkZJR19HRU5FUklDX0lSUV9N
SUdSQVRJT049eQpDT05GSUdfSVJRX0RPTUFJTj15CkNPTkZJR19JUlFfU0lNPXkKQ09ORklHX0lS
UV9ET01BSU5fSElFUkFSQ0hZPXkKQ09ORklHX0dFTkVSSUNfTVNJX0lSUT15CkNPTkZJR19HRU5F
UklDX01TSV9JUlFfRE9NQUlOPXkKQ09ORklHX0dFTkVSSUNfSVJRX01BVFJJWF9BTExPQ0FUT1I9
eQpDT05GSUdfR0VORVJJQ19JUlFfUkVTRVJWQVRJT05fTU9ERT15CkNPTkZJR19JUlFfRk9SQ0VE
X1RIUkVBRElORz15CkNPTkZJR19TUEFSU0VfSVJRPXkKIyBDT05GSUdfR0VORVJJQ19JUlFfREVC
VUdGUyBpcyBub3Qgc2V0CiMgZW5kIG9mIElSUSBzdWJzeXN0ZW0KCkNPTkZJR19DTE9DS1NPVVJD
RV9XQVRDSERPRz15CkNPTkZJR19BUkNIX0NMT0NLU09VUkNFX0RBVEE9eQpDT05GSUdfQVJDSF9D
TE9DS1NPVVJDRV9JTklUPXkKQ09ORklHX0NMT0NLU09VUkNFX1ZBTElEQVRFX0xBU1RfQ1lDTEU9
eQpDT05GSUdfR0VORVJJQ19USU1FX1ZTWVNDQUxMPXkKQ09ORklHX0dFTkVSSUNfQ0xPQ0tFVkVO
VFM9eQpDT05GSUdfR0VORVJJQ19DTE9DS0VWRU5UU19CUk9BRENBU1Q9eQpDT05GSUdfR0VORVJJ
Q19DTE9DS0VWRU5UU19NSU5fQURKVVNUPXkKQ09ORklHX0dFTkVSSUNfQ01PU19VUERBVEU9eQoK
IwojIFRpbWVycyBzdWJzeXN0ZW0KIwpDT05GSUdfVElDS19PTkVTSE9UPXkKQ09ORklHX05PX0ha
X0NPTU1PTj15CiMgQ09ORklHX0haX1BFUklPRElDIGlzIG5vdCBzZXQKIyBDT05GSUdfTk9fSFpf
SURMRSBpcyBub3Qgc2V0CkNPTkZJR19OT19IWl9GVUxMPXkKQ09ORklHX0NPTlRFWFRfVFJBQ0tJ
Tkc9eQojIENPTkZJR19DT05URVhUX1RSQUNLSU5HX0ZPUkNFIGlzIG5vdCBzZXQKQ09ORklHX05P
X0haPXkKQ09ORklHX0hJR0hfUkVTX1RJTUVSUz15CiMgZW5kIG9mIFRpbWVycyBzdWJzeXN0ZW0K
CiMgQ09ORklHX1BSRUVNUFRfTk9ORSBpcyBub3Qgc2V0CkNPTkZJR19QUkVFTVBUX1ZPTFVOVEFS
WT15CiMgQ09ORklHX1BSRUVNUFQgaXMgbm90IHNldApDT05GSUdfUFJFRU1QVF9DT1VOVD15Cgoj
CiMgQ1BVL1Rhc2sgdGltZSBhbmQgc3RhdHMgYWNjb3VudGluZwojCkNPTkZJR19WSVJUX0NQVV9B
Q0NPVU5USU5HPXkKQ09ORklHX1ZJUlRfQ1BVX0FDQ09VTlRJTkdfR0VOPXkKIyBDT05GSUdfSVJR
X1RJTUVfQUNDT1VOVElORyBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX1NDSEVEX0FWR19JUlE9eQpD
T05GSUdfQlNEX1BST0NFU1NfQUNDVD15CkNPTkZJR19CU0RfUFJPQ0VTU19BQ0NUX1YzPXkKQ09O
RklHX1RBU0tTVEFUUz15CkNPTkZJR19UQVNLX0RFTEFZX0FDQ1Q9eQpDT05GSUdfVEFTS19YQUND
VD15CkNPTkZJR19UQVNLX0lPX0FDQ09VTlRJTkc9eQojIENPTkZJR19QU0kgaXMgbm90IHNldAoj
IGVuZCBvZiBDUFUvVGFzayB0aW1lIGFuZCBzdGF0cyBhY2NvdW50aW5nCgpDT05GSUdfQ1BVX0lT
T0xBVElPTj15CgojCiMgUkNVIFN1YnN5c3RlbQojCkNPTkZJR19UUkVFX1JDVT15CiMgQ09ORklH
X1JDVV9FWFBFUlQgaXMgbm90IHNldApDT05GSUdfU1JDVT15CkNPTkZJR19UUkVFX1NSQ1U9eQpD
T05GSUdfVEFTS1NfUkNVPXkKQ09ORklHX1JDVV9TVEFMTF9DT01NT049eQpDT05GSUdfUkNVX05F
RURfU0VHQ0JMSVNUPXkKQ09ORklHX1JDVV9OT0NCX0NQVT15CiMgZW5kIG9mIFJDVSBTdWJzeXN0
ZW0KCkNPTkZJR19JS0NPTkZJRz15CkNPTkZJR19JS0NPTkZJR19QUk9DPXkKIyBDT05GSUdfSUtI
RUFERVJTIGlzIG5vdCBzZXQKQ09ORklHX0xPR19CVUZfU0hJRlQ9MjAKQ09ORklHX0xPR19DUFVf
TUFYX0JVRl9TSElGVD0xMgpDT05GSUdfUFJJTlRLX1NBRkVfTE9HX0JVRl9TSElGVD0xMwpDT05G
SUdfSEFWRV9VTlNUQUJMRV9TQ0hFRF9DTE9DSz15CkNPTkZJR19BUkNIX1NVUFBPUlRTX05VTUFf
QkFMQU5DSU5HPXkKQ09ORklHX0FSQ0hfV0FOVF9CQVRDSEVEX1VOTUFQX1RMQl9GTFVTSD15CkNP
TkZJR19BUkNIX1NVUFBPUlRTX0lOVDEyOD15CkNPTkZJR19OVU1BX0JBTEFOQ0lORz15CkNPTkZJ
R19OVU1BX0JBTEFOQ0lOR19ERUZBVUxUX0VOQUJMRUQ9eQpDT05GSUdfQ0dST1VQUz15CkNPTkZJ
R19QQUdFX0NPVU5URVI9eQpDT05GSUdfTUVNQ0c9eQpDT05GSUdfTUVNQ0dfU1dBUD15CkNPTkZJ
R19NRU1DR19TV0FQX0VOQUJMRUQ9eQpDT05GSUdfTUVNQ0dfS01FTT15CkNPTkZJR19CTEtfQ0dS
T1VQPXkKIyBDT05GSUdfREVCVUdfQkxLX0NHUk9VUCBpcyBub3Qgc2V0CkNPTkZJR19DR1JPVVBf
V1JJVEVCQUNLPXkKQ09ORklHX0NHUk9VUF9TQ0hFRD15CkNPTkZJR19GQUlSX0dST1VQX1NDSEVE
PXkKQ09ORklHX0NGU19CQU5EV0lEVEg9eQpDT05GSUdfUlRfR1JPVVBfU0NIRUQ9eQpDT05GSUdf
Q0dST1VQX1BJRFM9eQpDT05GSUdfQ0dST1VQX1JETUE9eQpDT05GSUdfQ0dST1VQX0ZSRUVaRVI9
eQpDT05GSUdfQ0dST1VQX0hVR0VUTEI9eQpDT05GSUdfQ1BVU0VUUz15CkNPTkZJR19QUk9DX1BJ
RF9DUFVTRVQ9eQpDT05GSUdfQ0dST1VQX0RFVklDRT15CkNPTkZJR19DR1JPVVBfQ1BVQUNDVD15
CkNPTkZJR19DR1JPVVBfUEVSRj15CkNPTkZJR19DR1JPVVBfQlBGPXkKIyBDT05GSUdfQ0dST1VQ
X0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX1NPQ0tfQ0dST1VQX0RBVEE9eQpDT05GSUdfTkFNRVNQ
QUNFUz15CkNPTkZJR19VVFNfTlM9eQpDT05GSUdfSVBDX05TPXkKQ09ORklHX1VTRVJfTlM9eQpD
T05GSUdfUElEX05TPXkKQ09ORklHX05FVF9OUz15CkNPTkZJR19DSEVDS1BPSU5UX1JFU1RPUkU9
eQpDT05GSUdfU0NIRURfQVVUT0dST1VQPXkKIyBDT05GSUdfU1lTRlNfREVQUkVDQVRFRCBpcyBu
b3Qgc2V0CkNPTkZJR19SRUxBWT15CkNPTkZJR19CTEtfREVWX0lOSVRSRD15CkNPTkZJR19JTklU
UkFNRlNfU09VUkNFPSIiCkNPTkZJR19SRF9HWklQPXkKQ09ORklHX1JEX0JaSVAyPXkKQ09ORklH
X1JEX0xaTUE9eQpDT05GSUdfUkRfWFo9eQpDT05GSUdfUkRfTFpPPXkKQ09ORklHX1JEX0xaND15
CkNPTkZJR19DQ19PUFRJTUlaRV9GT1JfUEVSRk9STUFOQ0U9eQojIENPTkZJR19DQ19PUFRJTUla
RV9GT1JfU0laRSBpcyBub3Qgc2V0CkNPTkZJR19TWVNDVEw9eQpDT05GSUdfSEFWRV9VSUQxNj15
CkNPTkZJR19TWVNDVExfRVhDRVBUSU9OX1RSQUNFPXkKQ09ORklHX0hBVkVfUENTUEtSX1BMQVRG
T1JNPXkKQ09ORklHX0JQRj15CkNPTkZJR19FWFBFUlQ9eQpDT05GSUdfVUlEMTY9eQpDT05GSUdf
TVVMVElVU0VSPXkKQ09ORklHX1NHRVRNQVNLX1NZU0NBTEw9eQpDT05GSUdfU1lTRlNfU1lTQ0FM
TD15CiMgQ09ORklHX1NZU0NUTF9TWVNDQUxMIGlzIG5vdCBzZXQKQ09ORklHX0ZIQU5ETEU9eQpD
T05GSUdfUE9TSVhfVElNRVJTPXkKQ09ORklHX1BSSU5USz15CkNPTkZJR19QUklOVEtfTk1JPXkK
Q09ORklHX0JVRz15CkNPTkZJR19FTEZfQ09SRT15CkNPTkZJR19QQ1NQS1JfUExBVEZPUk09eQpD
T05GSUdfQkFTRV9GVUxMPXkKQ09ORklHX0ZVVEVYPXkKQ09ORklHX0ZVVEVYX1BJPXkKQ09ORklH
X0VQT0xMPXkKQ09ORklHX1NJR05BTEZEPXkKQ09ORklHX1RJTUVSRkQ9eQpDT05GSUdfRVZFTlRG
RD15CkNPTkZJR19TSE1FTT15CkNPTkZJR19BSU89eQpDT05GSUdfSU9fVVJJTkc9eQpDT05GSUdf
QURWSVNFX1NZU0NBTExTPXkKQ09ORklHX01FTUJBUlJJRVI9eQpDT05GSUdfS0FMTFNZTVM9eQpD
T05GSUdfS0FMTFNZTVNfQUxMPXkKQ09ORklHX0tBTExTWU1TX0FCU09MVVRFX1BFUkNQVT15CkNP
TkZJR19LQUxMU1lNU19CQVNFX1JFTEFUSVZFPXkKQ09ORklHX0JQRl9TWVNDQUxMPXkKIyBDT05G
SUdfQlBGX0pJVF9BTFdBWVNfT04gaXMgbm90IHNldApDT05GSUdfVVNFUkZBVUxURkQ9eQpDT05G
SUdfQVJDSF9IQVNfTUVNQkFSUklFUl9TWU5DX0NPUkU9eQpDT05GSUdfUlNFUT15CiMgQ09ORklH
X0RFQlVHX1JTRVEgaXMgbm90IHNldApDT05GSUdfRU1CRURERUQ9eQpDT05GSUdfSEFWRV9QRVJG
X0VWRU5UUz15CiMgQ09ORklHX1BDMTA0IGlzIG5vdCBzZXQKCiMKIyBLZXJuZWwgUGVyZm9ybWFu
Y2UgRXZlbnRzIEFuZCBDb3VudGVycwojCkNPTkZJR19QRVJGX0VWRU5UUz15CiMgQ09ORklHX0RF
QlVHX1BFUkZfVVNFX1ZNQUxMT0MgaXMgbm90IHNldAojIGVuZCBvZiBLZXJuZWwgUGVyZm9ybWFu
Y2UgRXZlbnRzIEFuZCBDb3VudGVycwoKQ09ORklHX1ZNX0VWRU5UX0NPVU5URVJTPXkKQ09ORklH
X1NMVUJfREVCVUc9eQojIENPTkZJR19TTFVCX01FTUNHX1NZU0ZTX09OIGlzIG5vdCBzZXQKIyBD
T05GSUdfQ09NUEFUX0JSSyBpcyBub3Qgc2V0CiMgQ09ORklHX1NMQUIgaXMgbm90IHNldApDT05G
SUdfU0xVQj15CiMgQ09ORklHX1NMT0IgaXMgbm90IHNldApDT05GSUdfU0xBQl9NRVJHRV9ERUZB
VUxUPXkKIyBDT05GSUdfU0xBQl9GUkVFTElTVF9SQU5ET00gaXMgbm90IHNldAojIENPTkZJR19T
TEFCX0ZSRUVMSVNUX0hBUkRFTkVEIGlzIG5vdCBzZXQKIyBDT05GSUdfU0hVRkZMRV9QQUdFX0FM
TE9DQVRPUiBpcyBub3Qgc2V0CkNPTkZJR19TTFVCX0NQVV9QQVJUSUFMPXkKQ09ORklHX1NZU1RF
TV9EQVRBX1ZFUklGSUNBVElPTj15CkNPTkZJR19QUk9GSUxJTkc9eQpDT05GSUdfVFJBQ0VQT0lO
VFM9eQojIGVuZCBvZiBHZW5lcmFsIHNldHVwCgpDT05GSUdfNjRCSVQ9eQpDT05GSUdfWDg2XzY0
PXkKQ09ORklHX1g4Nj15CkNPTkZJR19JTlNUUlVDVElPTl9ERUNPREVSPXkKQ09ORklHX09VVFBV
VF9GT1JNQVQ9ImVsZjY0LXg4Ni02NCIKQ09ORklHX0FSQ0hfREVGQ09ORklHPSJhcmNoL3g4Ni9j
b25maWdzL3g4Nl82NF9kZWZjb25maWciCkNPTkZJR19MT0NLREVQX1NVUFBPUlQ9eQpDT05GSUdf
U1RBQ0tUUkFDRV9TVVBQT1JUPXkKQ09ORklHX01NVT15CkNPTkZJR19BUkNIX01NQVBfUk5EX0JJ
VFNfTUlOPTI4CkNPTkZJR19BUkNIX01NQVBfUk5EX0JJVFNfTUFYPTMyCkNPTkZJR19BUkNIX01N
QVBfUk5EX0NPTVBBVF9CSVRTX01JTj04CkNPTkZJR19BUkNIX01NQVBfUk5EX0NPTVBBVF9CSVRT
X01BWD0xNgpDT05GSUdfR0VORVJJQ19JU0FfRE1BPXkKQ09ORklHX0dFTkVSSUNfQlVHPXkKQ09O
RklHX0dFTkVSSUNfQlVHX1JFTEFUSVZFX1BPSU5URVJTPXkKQ09ORklHX0FSQ0hfTUFZX0hBVkVf
UENfRkRDPXkKQ09ORklHX0dFTkVSSUNfQ0FMSUJSQVRFX0RFTEFZPXkKQ09ORklHX0FSQ0hfSEFT
X0NQVV9SRUxBWD15CkNPTkZJR19BUkNIX0hBU19DQUNIRV9MSU5FX1NJWkU9eQpDT05GSUdfQVJD
SF9IQVNfRklMVEVSX1BHUFJPVD15CkNPTkZJR19IQVZFX1NFVFVQX1BFUl9DUFVfQVJFQT15CkNP
TkZJR19ORUVEX1BFUl9DUFVfRU1CRURfRklSU1RfQ0hVTks9eQpDT05GSUdfTkVFRF9QRVJfQ1BV
X1BBR0VfRklSU1RfQ0hVTks9eQpDT05GSUdfQVJDSF9ISUJFUk5BVElPTl9QT1NTSUJMRT15CkNP
TkZJR19BUkNIX1NVU1BFTkRfUE9TU0lCTEU9eQpDT05GSUdfQVJDSF9XQU5UX0hVR0VfUE1EX1NI
QVJFPXkKQ09ORklHX0FSQ0hfV0FOVF9HRU5FUkFMX0hVR0VUTEI9eQpDT05GSUdfWk9ORV9ETUEz
Mj15CkNPTkZJR19BVURJVF9BUkNIPXkKQ09ORklHX0FSQ0hfU1VQUE9SVFNfREVCVUdfUEFHRUFM
TE9DPXkKQ09ORklHX0hBVkVfSU5URUxfVFhUPXkKQ09ORklHX1g4Nl82NF9TTVA9eQpDT05GSUdf
QVJDSF9TVVBQT1JUU19VUFJPQkVTPXkKQ09ORklHX0ZJWF9FQVJMWUNPTl9NRU09eQpDT05GSUdf
UEdUQUJMRV9MRVZFTFM9NQpDT05GSUdfQ0NfSEFTX1NBTkVfU1RBQ0tQUk9URUNUT1I9eQoKIwoj
IFByb2Nlc3NvciB0eXBlIGFuZCBmZWF0dXJlcwojCkNPTkZJR19aT05FX0RNQT15CkNPTkZJR19T
TVA9eQpDT05GSUdfWDg2X0ZFQVRVUkVfTkFNRVM9eQpDT05GSUdfWDg2X1gyQVBJQz15CkNPTkZJ
R19YODZfTVBQQVJTRT15CiMgQ09ORklHX0dPTERGSVNIIGlzIG5vdCBzZXQKQ09ORklHX1JFVFBP
TElORT15CkNPTkZJR19YODZfQ1BVX1JFU0NUUkw9eQpDT05GSUdfWDg2X0VYVEVOREVEX1BMQVRG
T1JNPXkKIyBDT05GSUdfWDg2X05VTUFDSElQIGlzIG5vdCBzZXQKIyBDT05GSUdfWDg2X1ZTTVAg
aXMgbm90IHNldApDT05GSUdfWDg2X1VWPXkKIyBDT05GSUdfWDg2X0dPTERGSVNIIGlzIG5vdCBz
ZXQKIyBDT05GSUdfWDg2X0lOVEVMX01JRCBpcyBub3Qgc2V0CkNPTkZJR19YODZfSU5URUxfTFBT
Uz15CiMgQ09ORklHX1g4Nl9BTURfUExBVEZPUk1fREVWSUNFIGlzIG5vdCBzZXQKQ09ORklHX0lP
U0ZfTUJJPXkKIyBDT05GSUdfSU9TRl9NQklfREVCVUcgaXMgbm90IHNldApDT05GSUdfWDg2X1NV
UFBPUlRTX01FTU9SWV9GQUlMVVJFPXkKIyBDT05GSUdfU0NIRURfT01JVF9GUkFNRV9QT0lOVEVS
IGlzIG5vdCBzZXQKQ09ORklHX0hZUEVSVklTT1JfR1VFU1Q9eQpDT05GSUdfUEFSQVZJUlQ9eQpD
T05GSUdfUEFSQVZJUlRfWFhMPXkKIyBDT05GSUdfUEFSQVZJUlRfREVCVUcgaXMgbm90IHNldApD
T05GSUdfUEFSQVZJUlRfU1BJTkxPQ0tTPXkKQ09ORklHX1hFTj15CkNPTkZJR19YRU5fUFY9eQpD
T05GSUdfWEVOX1BWX1NNUD15CkNPTkZJR19YRU5fRE9NMD15CkNPTkZJR19YRU5fUFZIVk09eQpD
T05GSUdfWEVOX1BWSFZNX1NNUD15CkNPTkZJR19YRU5fNTEyR0I9eQpDT05GSUdfWEVOX1NBVkVf
UkVTVE9SRT15CiMgQ09ORklHX1hFTl9ERUJVR19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX1hFTl9Q
VkggaXMgbm90IHNldApDT05GSUdfS1ZNX0dVRVNUPXkKIyBDT05GSUdfUFZIIGlzIG5vdCBzZXQK
IyBDT05GSUdfS1ZNX0RFQlVHX0ZTIGlzIG5vdCBzZXQKQ09ORklHX1BBUkFWSVJUX1RJTUVfQUND
T1VOVElORz15CkNPTkZJR19QQVJBVklSVF9DTE9DSz15CiMgQ09ORklHX0pBSUxIT1VTRV9HVUVT
VCBpcyBub3Qgc2V0CiMgQ09ORklHX01LOCBpcyBub3Qgc2V0CiMgQ09ORklHX01QU0MgaXMgbm90
IHNldAojIENPTkZJR19NQ09SRTIgaXMgbm90IHNldAojIENPTkZJR19NQVRPTSBpcyBub3Qgc2V0
CkNPTkZJR19HRU5FUklDX0NQVT15CkNPTkZJR19YODZfSU5URVJOT0RFX0NBQ0hFX1NISUZUPTYK
Q09ORklHX1g4Nl9MMV9DQUNIRV9TSElGVD02CkNPTkZJR19YODZfVFNDPXkKQ09ORklHX1g4Nl9D
TVBYQ0hHNjQ9eQpDT05GSUdfWDg2X0NNT1Y9eQpDT05GSUdfWDg2X01JTklNVU1fQ1BVX0ZBTUlM
WT02NApDT05GSUdfWDg2X0RFQlVHQ1RMTVNSPXkKIyBDT05GSUdfUFJPQ0VTU09SX1NFTEVDVCBp
cyBub3Qgc2V0CkNPTkZJR19DUFVfU1VQX0lOVEVMPXkKQ09ORklHX0NQVV9TVVBfQU1EPXkKQ09O
RklHX0NQVV9TVVBfSFlHT049eQpDT05GSUdfQ1BVX1NVUF9DRU5UQVVSPXkKQ09ORklHX0hQRVRf
VElNRVI9eQpDT05GSUdfSFBFVF9FTVVMQVRFX1JUQz15CkNPTkZJR19ETUk9eQpDT05GSUdfR0FS
VF9JT01NVT15CiMgQ09ORklHX0NBTEdBUllfSU9NTVUgaXMgbm90IHNldApDT05GSUdfTUFYU01Q
PXkKQ09ORklHX05SX0NQVVNfUkFOR0VfQkVHSU49ODE5MgpDT05GSUdfTlJfQ1BVU19SQU5HRV9F
TkQ9ODE5MgpDT05GSUdfTlJfQ1BVU19ERUZBVUxUPTgxOTIKQ09ORklHX05SX0NQVVM9ODE5MgpD
T05GSUdfU0NIRURfU01UPXkKQ09ORklHX1NDSEVEX01DPXkKQ09ORklHX1NDSEVEX01DX1BSSU89
eQpDT05GSUdfWDg2X0xPQ0FMX0FQSUM9eQpDT05GSUdfWDg2X0lPX0FQSUM9eQpDT05GSUdfWDg2
X1JFUk9VVEVfRk9SX0JST0tFTl9CT09UX0lSUVM9eQpDT05GSUdfWDg2X01DRT15CkNPTkZJR19Y
ODZfTUNFTE9HX0xFR0FDWT15CkNPTkZJR19YODZfTUNFX0lOVEVMPXkKQ09ORklHX1g4Nl9NQ0Vf
QU1EPXkKQ09ORklHX1g4Nl9NQ0VfVEhSRVNIT0xEPXkKQ09ORklHX1g4Nl9NQ0VfSU5KRUNUPW0K
Q09ORklHX1g4Nl9USEVSTUFMX1ZFQ1RPUj15CgojCiMgUGVyZm9ybWFuY2UgbW9uaXRvcmluZwoj
CkNPTkZJR19QRVJGX0VWRU5UU19JTlRFTF9VTkNPUkU9eQpDT05GSUdfUEVSRl9FVkVOVFNfSU5U
RUxfUkFQTD15CkNPTkZJR19QRVJGX0VWRU5UU19JTlRFTF9DU1RBVEU9eQojIENPTkZJR19QRVJG
X0VWRU5UU19BTURfUE9XRVIgaXMgbm90IHNldAojIGVuZCBvZiBQZXJmb3JtYW5jZSBtb25pdG9y
aW5nCgpDT05GSUdfWDg2XzE2QklUPXkKQ09ORklHX1g4Nl9FU1BGSVg2ND15CkNPTkZJR19YODZf
VlNZU0NBTExfRU1VTEFUSU9OPXkKQ09ORklHX0k4Sz1tCkNPTkZJR19NSUNST0NPREU9eQpDT05G
SUdfTUlDUk9DT0RFX0lOVEVMPXkKQ09ORklHX01JQ1JPQ09ERV9BTUQ9eQpDT05GSUdfTUlDUk9D
T0RFX09MRF9JTlRFUkZBQ0U9eQpDT05GSUdfWDg2X01TUj15CkNPTkZJR19YODZfQ1BVSUQ9eQpD
T05GSUdfWDg2XzVMRVZFTD15CkNPTkZJR19YODZfRElSRUNUX0dCUEFHRVM9eQojIENPTkZJR19Y
ODZfQ1BBX1NUQVRJU1RJQ1MgaXMgbm90IHNldApDT05GSUdfQVJDSF9IQVNfTUVNX0VOQ1JZUFQ9
eQojIENPTkZJR19BTURfTUVNX0VOQ1JZUFQgaXMgbm90IHNldApDT05GSUdfTlVNQT15CkNPTkZJ
R19BTURfTlVNQT15CkNPTkZJR19YODZfNjRfQUNQSV9OVU1BPXkKQ09ORklHX05PREVTX1NQQU5f
T1RIRVJfTk9ERVM9eQojIENPTkZJR19OVU1BX0VNVSBpcyBub3Qgc2V0CkNPTkZJR19OT0RFU19T
SElGVD0xMApDT05GSUdfQVJDSF9TUEFSU0VNRU1fRU5BQkxFPXkKQ09ORklHX0FSQ0hfU1BBUlNF
TUVNX0RFRkFVTFQ9eQpDT05GSUdfQVJDSF9TRUxFQ1RfTUVNT1JZX01PREVMPXkKQ09ORklHX0FS
Q0hfTUVNT1JZX1BST0JFPXkKQ09ORklHX0FSQ0hfUFJPQ19LQ09SRV9URVhUPXkKQ09ORklHX0lM
TEVHQUxfUE9JTlRFUl9WQUxVRT0weGRlYWQwMDAwMDAwMDAwMDAKQ09ORklHX1g4Nl9QTUVNX0xF
R0FDWV9ERVZJQ0U9eQpDT05GSUdfWDg2X1BNRU1fTEVHQUNZPW0KQ09ORklHX1g4Nl9DSEVDS19C
SU9TX0NPUlJVUFRJT049eQojIENPTkZJR19YODZfQk9PVFBBUkFNX01FTU9SWV9DT1JSVVBUSU9O
X0NIRUNLIGlzIG5vdCBzZXQKQ09ORklHX1g4Nl9SRVNFUlZFX0xPVz02NApDT05GSUdfTVRSUj15
CkNPTkZJR19NVFJSX1NBTklUSVpFUj15CkNPTkZJR19NVFJSX1NBTklUSVpFUl9FTkFCTEVfREVG
QVVMVD0wCkNPTkZJR19NVFJSX1NBTklUSVpFUl9TUEFSRV9SRUdfTlJfREVGQVVMVD0xCkNPTkZJ
R19YODZfUEFUPXkKQ09ORklHX0FSQ0hfVVNFU19QR19VTkNBQ0hFRD15CkNPTkZJR19BUkNIX1JB
TkRPTT15CkNPTkZJR19YODZfU01BUD15CkNPTkZJR19YODZfSU5URUxfVU1JUD15CkNPTkZJR19Y
ODZfSU5URUxfTVBYPXkKQ09ORklHX1g4Nl9JTlRFTF9NRU1PUllfUFJPVEVDVElPTl9LRVlTPXkK
Q09ORklHX0VGST15CkNPTkZJR19FRklfU1RVQj15CiMgQ09ORklHX0VGSV9NSVhFRCBpcyBub3Qg
c2V0CkNPTkZJR19TRUNDT01QPXkKIyBDT05GSUdfSFpfMTAwIGlzIG5vdCBzZXQKIyBDT05GSUdf
SFpfMjUwIGlzIG5vdCBzZXQKIyBDT05GSUdfSFpfMzAwIGlzIG5vdCBzZXQKQ09ORklHX0haXzEw
MDA9eQpDT05GSUdfSFo9MTAwMApDT05GSUdfU0NIRURfSFJUSUNLPXkKQ09ORklHX0tFWEVDPXkK
IyBDT05GSUdfS0VYRUNfRklMRSBpcyBub3Qgc2V0CkNPTkZJR19DUkFTSF9EVU1QPXkKQ09ORklH
X0tFWEVDX0pVTVA9eQpDT05GSUdfUEhZU0lDQUxfU1RBUlQ9MHgxMDAwMDAwCkNPTkZJR19SRUxP
Q0FUQUJMRT15CiMgQ09ORklHX1JBTkRPTUlaRV9CQVNFIGlzIG5vdCBzZXQKQ09ORklHX1BIWVNJ
Q0FMX0FMSUdOPTB4MTAwMDAwMApDT05GSUdfRFlOQU1JQ19NRU1PUllfTEFZT1VUPXkKQ09ORklH
X0hPVFBMVUdfQ1BVPXkKQ09ORklHX0JPT1RQQVJBTV9IT1RQTFVHX0NQVTA9eQojIENPTkZJR19E
RUJVR19IT1RQTFVHX0NQVTAgaXMgbm90IHNldAojIENPTkZJR19DT01QQVRfVkRTTyBpcyBub3Qg
c2V0CkNPTkZJR19MRUdBQ1lfVlNZU0NBTExfRU1VTEFURT15CiMgQ09ORklHX0xFR0FDWV9WU1lT
Q0FMTF9OT05FIGlzIG5vdCBzZXQKIyBDT05GSUdfQ01ETElORV9CT09MIGlzIG5vdCBzZXQKQ09O
RklHX01PRElGWV9MRFRfU1lTQ0FMTD15CkNPTkZJR19IQVZFX0xJVkVQQVRDSD15CiMgQ09ORklH
X0xJVkVQQVRDSCBpcyBub3Qgc2V0CiMgZW5kIG9mIFByb2Nlc3NvciB0eXBlIGFuZCBmZWF0dXJl
cwoKQ09ORklHX0FSQ0hfSEFTX0FERF9QQUdFUz15CkNPTkZJR19BUkNIX0VOQUJMRV9NRU1PUllf
SE9UUExVRz15CkNPTkZJR19BUkNIX0VOQUJMRV9NRU1PUllfSE9UUkVNT1ZFPXkKQ09ORklHX1VT
RV9QRVJDUFVfTlVNQV9OT0RFX0lEPXkKQ09ORklHX0FSQ0hfRU5BQkxFX1NQTElUX1BNRF9QVExP
Q0s9eQpDT05GSUdfQVJDSF9FTkFCTEVfSFVHRVBBR0VfTUlHUkFUSU9OPXkKQ09ORklHX0FSQ0hf
RU5BQkxFX1RIUF9NSUdSQVRJT049eQoKIwojIFBvd2VyIG1hbmFnZW1lbnQgYW5kIEFDUEkgb3B0
aW9ucwojCkNPTkZJR19BUkNIX0hJQkVSTkFUSU9OX0hFQURFUj15CkNPTkZJR19TVVNQRU5EPXkK
Q09ORklHX1NVU1BFTkRfRlJFRVpFUj15CiMgQ09ORklHX1NVU1BFTkRfU0tJUF9TWU5DIGlzIG5v
dCBzZXQKQ09ORklHX0hJQkVSTkFURV9DQUxMQkFDS1M9eQpDT05GSUdfSElCRVJOQVRJT049eQpD
T05GSUdfUE1fU1REX1BBUlRJVElPTj0iIgpDT05GSUdfUE1fU0xFRVA9eQpDT05GSUdfUE1fU0xF
RVBfU01QPXkKIyBDT05GSUdfUE1fQVVUT1NMRUVQIGlzIG5vdCBzZXQKIyBDT05GSUdfUE1fV0FL
RUxPQ0tTIGlzIG5vdCBzZXQKQ09ORklHX1BNPXkKQ09ORklHX1BNX0RFQlVHPXkKQ09ORklHX1BN
X0FEVkFOQ0VEX0RFQlVHPXkKQ09ORklHX1BNX1RFU1RfU1VTUEVORD15CkNPTkZJR19QTV9TTEVF
UF9ERUJVRz15CiMgQ09ORklHX0RQTV9XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklHX1BNX1RS
QUNFX1JUQyBpcyBub3Qgc2V0CkNPTkZJR19QTV9DTEs9eQojIENPTkZJR19XUV9QT1dFUl9FRkZJ
Q0lFTlRfREVGQVVMVCBpcyBub3Qgc2V0CiMgQ09ORklHX0VORVJHWV9NT0RFTCBpcyBub3Qgc2V0
CkNPTkZJR19BUkNIX1NVUFBPUlRTX0FDUEk9eQpDT05GSUdfQUNQST15CkNPTkZJR19BQ1BJX0xF
R0FDWV9UQUJMRVNfTE9PS1VQPXkKQ09ORklHX0FSQ0hfTUlHSFRfSEFWRV9BQ1BJX1BEQz15CkNP
TkZJR19BQ1BJX1NZU1RFTV9QT1dFUl9TVEFURVNfU1VQUE9SVD15CiMgQ09ORklHX0FDUElfREVC
VUdHRVIgaXMgbm90IHNldApDT05GSUdfQUNQSV9TUENSX1RBQkxFPXkKQ09ORklHX0FDUElfTFBJ
VD15CkNPTkZJR19BQ1BJX1NMRUVQPXkKIyBDT05GSUdfQUNQSV9QUk9DRlNfUE9XRVIgaXMgbm90
IHNldApDT05GSUdfQUNQSV9SRVZfT1ZFUlJJREVfUE9TU0lCTEU9eQpDT05GSUdfQUNQSV9FQ19E
RUJVR0ZTPW0KQ09ORklHX0FDUElfQUM9eQpDT05GSUdfQUNQSV9CQVRURVJZPXkKQ09ORklHX0FD
UElfQlVUVE9OPXkKQ09ORklHX0FDUElfVklERU89bQpDT05GSUdfQUNQSV9GQU49eQojIENPTkZJ
R19BQ1BJX1RBRCBpcyBub3Qgc2V0CkNPTkZJR19BQ1BJX0RPQ0s9eQpDT05GSUdfQUNQSV9DUFVf
RlJFUV9QU1M9eQpDT05GSUdfQUNQSV9QUk9DRVNTT1JfQ1NUQVRFPXkKQ09ORklHX0FDUElfUFJP
Q0VTU09SX0lETEU9eQpDT05GSUdfQUNQSV9DUFBDX0xJQj15CkNPTkZJR19BQ1BJX1BST0NFU1NP
Uj15CkNPTkZJR19BQ1BJX0lQTUk9bQpDT05GSUdfQUNQSV9IT1RQTFVHX0NQVT15CkNPTkZJR19B
Q1BJX1BST0NFU1NPUl9BR0dSRUdBVE9SPW0KQ09ORklHX0FDUElfVEhFUk1BTD15CkNPTkZJR19B
Q1BJX05VTUE9eQpDT05GSUdfQVJDSF9IQVNfQUNQSV9UQUJMRV9VUEdSQURFPXkKQ09ORklHX0FD
UElfVEFCTEVfVVBHUkFERT15CkNPTkZJR19BQ1BJX0RFQlVHPXkKQ09ORklHX0FDUElfUENJX1NM
T1Q9eQpDT05GSUdfQUNQSV9DT05UQUlORVI9eQpDT05GSUdfQUNQSV9IT1RQTFVHX01FTU9SWT15
CkNPTkZJR19BQ1BJX0hPVFBMVUdfSU9BUElDPXkKQ09ORklHX0FDUElfU0JTPW0KQ09ORklHX0FD
UElfSEVEPXkKQ09ORklHX0FDUElfQ1VTVE9NX01FVEhPRD1tCkNPTkZJR19BQ1BJX0JHUlQ9eQoj
IENPTkZJR19BQ1BJX1JFRFVDRURfSEFSRFdBUkVfT05MWSBpcyBub3Qgc2V0CkNPTkZJR19BQ1BJ
X05GSVQ9bQojIENPTkZJR19ORklUX1NFQ1VSSVRZX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdf
QUNQSV9ITUFUIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfQUNQSV9BUEVJPXkKQ09ORklHX0hBVkVf
QUNQSV9BUEVJX05NST15CkNPTkZJR19BQ1BJX0FQRUk9eQpDT05GSUdfQUNQSV9BUEVJX0dIRVM9
eQpDT05GSUdfQUNQSV9BUEVJX1BDSUVBRVI9eQpDT05GSUdfQUNQSV9BUEVJX01FTU9SWV9GQUlM
VVJFPXkKQ09ORklHX0FDUElfQVBFSV9FSU5KPW0KQ09ORklHX0FDUElfQVBFSV9FUlNUX0RFQlVH
PXkKIyBDT05GSUdfRFBURl9QT1dFUiBpcyBub3Qgc2V0CkNPTkZJR19BQ1BJX1dBVENIRE9HPXkK
Q09ORklHX0FDUElfRVhUTE9HPW0KQ09ORklHX0FDUElfQURYTD15CiMgQ09ORklHX1BNSUNfT1BS
RUdJT04gaXMgbm90IHNldAojIENPTkZJR19BQ1BJX0NPTkZJR0ZTIGlzIG5vdCBzZXQKQ09ORklH
X1g4Nl9QTV9USU1FUj15CkNPTkZJR19TRkk9eQoKIwojIENQVSBGcmVxdWVuY3kgc2NhbGluZwoj
CkNPTkZJR19DUFVfRlJFUT15CkNPTkZJR19DUFVfRlJFUV9HT1ZfQVRUUl9TRVQ9eQpDT05GSUdf
Q1BVX0ZSRVFfR09WX0NPTU1PTj15CiMgQ09ORklHX0NQVV9GUkVRX1NUQVQgaXMgbm90IHNldAoj
IENPTkZJR19DUFVfRlJFUV9ERUZBVUxUX0dPVl9QRVJGT1JNQU5DRSBpcyBub3Qgc2V0CiMgQ09O
RklHX0NQVV9GUkVRX0RFRkFVTFRfR09WX1BPV0VSU0FWRSBpcyBub3Qgc2V0CiMgQ09ORklHX0NQ
VV9GUkVRX0RFRkFVTFRfR09WX1VTRVJTUEFDRSBpcyBub3Qgc2V0CkNPTkZJR19DUFVfRlJFUV9E
RUZBVUxUX0dPVl9PTkRFTUFORD15CiMgQ09ORklHX0NQVV9GUkVRX0RFRkFVTFRfR09WX0NPTlNF
UlZBVElWRSBpcyBub3Qgc2V0CiMgQ09ORklHX0NQVV9GUkVRX0RFRkFVTFRfR09WX1NDSEVEVVRJ
TCBpcyBub3Qgc2V0CkNPTkZJR19DUFVfRlJFUV9HT1ZfUEVSRk9STUFOQ0U9eQpDT05GSUdfQ1BV
X0ZSRVFfR09WX1BPV0VSU0FWRT15CkNPTkZJR19DUFVfRlJFUV9HT1ZfVVNFUlNQQUNFPXkKQ09O
RklHX0NQVV9GUkVRX0dPVl9PTkRFTUFORD15CkNPTkZJR19DUFVfRlJFUV9HT1ZfQ09OU0VSVkFU
SVZFPXkKIyBDT05GSUdfQ1BVX0ZSRVFfR09WX1NDSEVEVVRJTCBpcyBub3Qgc2V0CgojCiMgQ1BV
IGZyZXF1ZW5jeSBzY2FsaW5nIGRyaXZlcnMKIwpDT05GSUdfWDg2X0lOVEVMX1BTVEFURT15CkNP
TkZJR19YODZfUENDX0NQVUZSRVE9bQpDT05GSUdfWDg2X0FDUElfQ1BVRlJFUT1tCkNPTkZJR19Y
ODZfQUNQSV9DUFVGUkVRX0NQQj15CkNPTkZJR19YODZfUE9XRVJOT1dfSzg9bQpDT05GSUdfWDg2
X0FNRF9GUkVRX1NFTlNJVElWSVRZPW0KIyBDT05GSUdfWDg2X1NQRUVEU1RFUF9DRU5UUklOTyBp
cyBub3Qgc2V0CkNPTkZJR19YODZfUDRfQ0xPQ0tNT0Q9bQoKIwojIHNoYXJlZCBvcHRpb25zCiMK
Q09ORklHX1g4Nl9TUEVFRFNURVBfTElCPW0KIyBlbmQgb2YgQ1BVIEZyZXF1ZW5jeSBzY2FsaW5n
CgojCiMgQ1BVIElkbGUKIwpDT05GSUdfQ1BVX0lETEU9eQojIENPTkZJR19DUFVfSURMRV9HT1Zf
TEFEREVSIGlzIG5vdCBzZXQKQ09ORklHX0NQVV9JRExFX0dPVl9NRU5VPXkKIyBDT05GSUdfQ1BV
X0lETEVfR09WX1RFTyBpcyBub3Qgc2V0CiMgZW5kIG9mIENQVSBJZGxlCgpDT05GSUdfSU5URUxf
SURMRT15CiMgZW5kIG9mIFBvd2VyIG1hbmFnZW1lbnQgYW5kIEFDUEkgb3B0aW9ucwoKIwojIEJ1
cyBvcHRpb25zIChQQ0kgZXRjLikKIwpDT05GSUdfUENJX0RJUkVDVD15CkNPTkZJR19QQ0lfTU1D
T05GSUc9eQpDT05GSUdfUENJX1hFTj15CkNPTkZJR19NTUNPTkZfRkFNMTBIPXkKIyBDT05GSUdf
UENJX0NOQjIwTEVfUVVJUksgaXMgbm90IHNldAojIENPTkZJR19JU0FfQlVTIGlzIG5vdCBzZXQK
Q09ORklHX0lTQV9ETUFfQVBJPXkKQ09ORklHX0FNRF9OQj15CiMgQ09ORklHX1g4Nl9TWVNGQiBp
cyBub3Qgc2V0CiMgZW5kIG9mIEJ1cyBvcHRpb25zIChQQ0kgZXRjLikKCiMKIyBCaW5hcnkgRW11
bGF0aW9ucwojCkNPTkZJR19JQTMyX0VNVUxBVElPTj15CiMgQ09ORklHX1g4Nl9YMzIgaXMgbm90
IHNldApDT05GSUdfQ09NUEFUXzMyPXkKQ09ORklHX0NPTVBBVD15CkNPTkZJR19DT01QQVRfRk9S
X1U2NF9BTElHTk1FTlQ9eQpDT05GSUdfU1lTVklQQ19DT01QQVQ9eQojIGVuZCBvZiBCaW5hcnkg
RW11bGF0aW9ucwoKQ09ORklHX0hBVkVfR0VORVJJQ19HVVA9eQoKIwojIEZpcm13YXJlIERyaXZl
cnMKIwpDT05GSUdfRUREPW0KIyBDT05GSUdfRUREX09GRiBpcyBub3Qgc2V0CkNPTkZJR19GSVJN
V0FSRV9NRU1NQVA9eQpDT05GSUdfRE1JSUQ9eQpDT05GSUdfRE1JX1NZU0ZTPXkKQ09ORklHX0RN
SV9TQ0FOX01BQ0hJTkVfTk9OX0VGSV9GQUxMQkFDSz15CkNPTkZJR19JU0NTSV9JQkZUX0ZJTkQ9
eQpDT05GSUdfSVNDU0lfSUJGVD1tCiMgQ09ORklHX0ZXX0NGR19TWVNGUyBpcyBub3Qgc2V0CiMg
Q09ORklHX0dPT0dMRV9GSVJNV0FSRSBpcyBub3Qgc2V0CgojCiMgRUZJIChFeHRlbnNpYmxlIEZp
cm13YXJlIEludGVyZmFjZSkgU3VwcG9ydAojCkNPTkZJR19FRklfVkFSUz15CkNPTkZJR19FRklf
RVNSVD15CkNPTkZJR19FRklfVkFSU19QU1RPUkU9eQpDT05GSUdfRUZJX1ZBUlNfUFNUT1JFX0RF
RkFVTFRfRElTQUJMRT15CkNPTkZJR19FRklfUlVOVElNRV9NQVA9eQojIENPTkZJR19FRklfRkFL
RV9NRU1NQVAgaXMgbm90IHNldApDT05GSUdfRUZJX1JVTlRJTUVfV1JBUFBFUlM9eQojIENPTkZJ
R19FRklfQk9PVExPQURFUl9DT05UUk9MIGlzIG5vdCBzZXQKIyBDT05GSUdfRUZJX0NBUFNVTEVf
TE9BREVSIGlzIG5vdCBzZXQKIyBDT05GSUdfRUZJX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19B
UFBMRV9QUk9QRVJUSUVTIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVTRVRfQVRUQUNLX01JVElHQVRJ
T04gaXMgbm90IHNldAojIGVuZCBvZiBFRkkgKEV4dGVuc2libGUgRmlybXdhcmUgSW50ZXJmYWNl
KSBTdXBwb3J0CgpDT05GSUdfVUVGSV9DUEVSPXkKQ09ORklHX1VFRklfQ1BFUl9YODY9eQpDT05G
SUdfRUZJX0VBUkxZQ09OPXkKCiMKIyBUZWdyYSBmaXJtd2FyZSBkcml2ZXIKIwojIGVuZCBvZiBU
ZWdyYSBmaXJtd2FyZSBkcml2ZXIKIyBlbmQgb2YgRmlybXdhcmUgRHJpdmVycwoKQ09ORklHX0hB
VkVfS1ZNPXkKQ09ORklHX0hBVkVfS1ZNX0lSUUNISVA9eQpDT05GSUdfSEFWRV9LVk1fSVJRRkQ9
eQpDT05GSUdfSEFWRV9LVk1fSVJRX1JPVVRJTkc9eQpDT05GSUdfSEFWRV9LVk1fRVZFTlRGRD15
CkNPTkZJR19LVk1fTU1JTz15CkNPTkZJR19LVk1fQVNZTkNfUEY9eQpDT05GSUdfSEFWRV9LVk1f
TVNJPXkKQ09ORklHX0hBVkVfS1ZNX0NQVV9SRUxBWF9JTlRFUkNFUFQ9eQpDT05GSUdfS1ZNX1ZG
SU89eQpDT05GSUdfS1ZNX0dFTkVSSUNfRElSVFlMT0dfUkVBRF9QUk9URUNUPXkKQ09ORklHX0tW
TV9DT01QQVQ9eQpDT05GSUdfSEFWRV9LVk1fSVJRX0JZUEFTUz15CkNPTkZJR19WSVJUVUFMSVpB
VElPTj15CkNPTkZJR19LVk09bQpDT05GSUdfS1ZNX0lOVEVMPW0KQ09ORklHX0tWTV9BTUQ9bQpD
T05GSUdfS1ZNX01NVV9BVURJVD15CkNPTkZJR19WSE9TVF9ORVQ9bQojIENPTkZJR19WSE9TVF9T
Q1NJIGlzIG5vdCBzZXQKIyBDT05GSUdfVkhPU1RfVlNPQ0sgaXMgbm90IHNldApDT05GSUdfVkhP
U1Q9bQojIENPTkZJR19WSE9TVF9DUk9TU19FTkRJQU5fTEVHQUNZIGlzIG5vdCBzZXQKCiMKIyBH
ZW5lcmFsIGFyY2hpdGVjdHVyZS1kZXBlbmRlbnQgb3B0aW9ucwojCkNPTkZJR19DUkFTSF9DT1JF
PXkKQ09ORklHX0tFWEVDX0NPUkU9eQpDT05GSUdfSE9UUExVR19TTVQ9eQpDT05GSUdfT1BST0ZJ
TEU9bQpDT05GSUdfT1BST0ZJTEVfRVZFTlRfTVVMVElQTEVYPXkKQ09ORklHX0hBVkVfT1BST0ZJ
TEU9eQpDT05GSUdfT1BST0ZJTEVfTk1JX1RJTUVSPXkKQ09ORklHX0tQUk9CRVM9eQpDT05GSUdf
SlVNUF9MQUJFTD15CiMgQ09ORklHX1NUQVRJQ19LRVlTX1NFTEZURVNUIGlzIG5vdCBzZXQKQ09O
RklHX09QVFBST0JFUz15CkNPTkZJR19LUFJPQkVTX09OX0ZUUkFDRT15CkNPTkZJR19VUFJPQkVT
PXkKQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1M9eQpDT05GSUdfQVJDSF9V
U0VfQlVJTFRJTl9CU1dBUD15CkNPTkZJR19LUkVUUFJPQkVTPXkKQ09ORklHX1VTRVJfUkVUVVJO
X05PVElGSUVSPXkKQ09ORklHX0hBVkVfSU9SRU1BUF9QUk9UPXkKQ09ORklHX0hBVkVfS1BST0JF
Uz15CkNPTkZJR19IQVZFX0tSRVRQUk9CRVM9eQpDT05GSUdfSEFWRV9PUFRQUk9CRVM9eQpDT05G
SUdfSEFWRV9LUFJPQkVTX09OX0ZUUkFDRT15CkNPTkZJR19IQVZFX0ZVTkNUSU9OX0VSUk9SX0lO
SkVDVElPTj15CkNPTkZJR19IQVZFX05NST15CkNPTkZJR19IQVZFX0FSQ0hfVFJBQ0VIT09LPXkK
Q09ORklHX0hBVkVfRE1BX0NPTlRJR1VPVVM9eQpDT05GSUdfR0VORVJJQ19TTVBfSURMRV9USFJF
QUQ9eQpDT05GSUdfQVJDSF9IQVNfRk9SVElGWV9TT1VSQ0U9eQpDT05GSUdfQVJDSF9IQVNfU0VU
X01FTU9SWT15CkNPTkZJR19BUkNIX0hBU19TRVRfRElSRUNUX01BUD15CkNPTkZJR19IQVZFX0FS
Q0hfVEhSRUFEX1NUUlVDVF9XSElURUxJU1Q9eQpDT05GSUdfQVJDSF9XQU5UU19EWU5BTUlDX1RB
U0tfU1RSVUNUPXkKQ09ORklHX0hBVkVfUkVHU19BTkRfU1RBQ0tfQUNDRVNTX0FQST15CkNPTkZJ
R19IQVZFX1JTRVE9eQpDT05GSUdfSEFWRV9GVU5DVElPTl9BUkdfQUNDRVNTX0FQST15CkNPTkZJ
R19IQVZFX0NMSz15CkNPTkZJR19IQVZFX0hXX0JSRUFLUE9JTlQ9eQpDT05GSUdfSEFWRV9NSVhF
RF9CUkVBS1BPSU5UU19SRUdTPXkKQ09ORklHX0hBVkVfVVNFUl9SRVRVUk5fTk9USUZJRVI9eQpD
T05GSUdfSEFWRV9QRVJGX0VWRU5UU19OTUk9eQpDT05GSUdfSEFWRV9IQVJETE9DS1VQX0RFVEVD
VE9SX1BFUkY9eQpDT05GSUdfSEFWRV9QRVJGX1JFR1M9eQpDT05GSUdfSEFWRV9QRVJGX1VTRVJf
U1RBQ0tfRFVNUD15CkNPTkZJR19IQVZFX0FSQ0hfSlVNUF9MQUJFTD15CkNPTkZJR19IQVZFX0FS
Q0hfSlVNUF9MQUJFTF9SRUxBVElWRT15CkNPTkZJR19IQVZFX1JDVV9UQUJMRV9GUkVFPXkKQ09O
RklHX0FSQ0hfSEFWRV9OTUlfU0FGRV9DTVBYQ0hHPXkKQ09ORklHX0hBVkVfQUxJR05FRF9TVFJV
Q1RfUEFHRT15CkNPTkZJR19IQVZFX0NNUFhDSEdfTE9DQUw9eQpDT05GSUdfSEFWRV9DTVBYQ0hH
X0RPVUJMRT15CkNPTkZJR19BUkNIX1dBTlRfQ09NUEFUX0lQQ19QQVJTRV9WRVJTSU9OPXkKQ09O
RklHX0FSQ0hfV0FOVF9PTERfQ09NUEFUX0lQQz15CkNPTkZJR19IQVZFX0FSQ0hfU0VDQ09NUF9G
SUxURVI9eQpDT05GSUdfU0VDQ09NUF9GSUxURVI9eQpDT05GSUdfSEFWRV9BUkNIX1NUQUNLTEVB
Sz15CkNPTkZJR19IQVZFX1NUQUNLUFJPVEVDVE9SPXkKQ09ORklHX0NDX0hBU19TVEFDS1BST1RF
Q1RPUl9OT05FPXkKQ09ORklHX1NUQUNLUFJPVEVDVE9SPXkKQ09ORklHX1NUQUNLUFJPVEVDVE9S
X1NUUk9ORz15CkNPTkZJR19IQVZFX0FSQ0hfV0lUSElOX1NUQUNLX0ZSQU1FUz15CkNPTkZJR19I
QVZFX0NPTlRFWFRfVFJBQ0tJTkc9eQpDT05GSUdfSEFWRV9WSVJUX0NQVV9BQ0NPVU5USU5HX0dF
Tj15CkNPTkZJR19IQVZFX0lSUV9USU1FX0FDQ09VTlRJTkc9eQpDT05GSUdfSEFWRV9NT1ZFX1BN
RD15CkNPTkZJR19IQVZFX0FSQ0hfVFJBTlNQQVJFTlRfSFVHRVBBR0U9eQpDT05GSUdfSEFWRV9B
UkNIX1RSQU5TUEFSRU5UX0hVR0VQQUdFX1BVRD15CkNPTkZJR19IQVZFX0FSQ0hfSFVHRV9WTUFQ
PXkKQ09ORklHX0hBVkVfQVJDSF9TT0ZUX0RJUlRZPXkKQ09ORklHX0hBVkVfTU9EX0FSQ0hfU1BF
Q0lGSUM9eQpDT05GSUdfTU9EVUxFU19VU0VfRUxGX1JFTEE9eQpDT05GSUdfSEFWRV9JUlFfRVhJ
VF9PTl9JUlFfU1RBQ0s9eQpDT05GSUdfQVJDSF9IQVNfRUxGX1JBTkRPTUlaRT15CkNPTkZJR19I
QVZFX0FSQ0hfTU1BUF9STkRfQklUUz15CkNPTkZJR19IQVZFX0VYSVRfVEhSRUFEPXkKQ09ORklH
X0FSQ0hfTU1BUF9STkRfQklUUz0yOApDT05GSUdfSEFWRV9BUkNIX01NQVBfUk5EX0NPTVBBVF9C
SVRTPXkKQ09ORklHX0FSQ0hfTU1BUF9STkRfQ09NUEFUX0JJVFM9OApDT05GSUdfSEFWRV9BUkNI
X0NPTVBBVF9NTUFQX0JBU0VTPXkKQ09ORklHX0hBVkVfQ09QWV9USFJFQURfVExTPXkKQ09ORklH
X0hBVkVfU1RBQ0tfVkFMSURBVElPTj15CkNPTkZJR19IQVZFX1JFTElBQkxFX1NUQUNLVFJBQ0U9
eQpDT05GSUdfT0xEX1NJR1NVU1BFTkQzPXkKQ09ORklHX0NPTVBBVF9PTERfU0lHQUNUSU9OPXkK
Q09ORklHXzY0QklUX1RJTUU9eQpDT05GSUdfQ09NUEFUXzMyQklUX1RJTUU9eQpDT05GSUdfSEFW
RV9BUkNIX1ZNQVBfU1RBQ0s9eQpDT05GSUdfVk1BUF9TVEFDSz15CkNPTkZJR19BUkNIX0hBU19T
VFJJQ1RfS0VSTkVMX1JXWD15CkNPTkZJR19TVFJJQ1RfS0VSTkVMX1JXWD15CkNPTkZJR19BUkNI
X0hBU19TVFJJQ1RfTU9EVUxFX1JXWD15CkNPTkZJR19TVFJJQ1RfTU9EVUxFX1JXWD15CkNPTkZJ
R19BUkNIX0hBU19SRUZDT1VOVD15CiMgQ09ORklHX1JFRkNPVU5UX0ZVTEwgaXMgbm90IHNldApD
T05GSUdfSEFWRV9BUkNIX1BSRUwzMl9SRUxPQ0FUSU9OUz15CkNPTkZJR19BUkNIX1VTRV9NRU1S
RU1BUF9QUk9UPXkKIyBDT05GSUdfTE9DS19FVkVOVF9DT1VOVFMgaXMgbm90IHNldAoKIwojIEdD
T1YtYmFzZWQga2VybmVsIHByb2ZpbGluZwojCiMgQ09ORklHX0dDT1ZfS0VSTkVMIGlzIG5vdCBz
ZXQKQ09ORklHX0FSQ0hfSEFTX0dDT1ZfUFJPRklMRV9BTEw9eQojIGVuZCBvZiBHQ09WLWJhc2Vk
IGtlcm5lbCBwcm9maWxpbmcKCkNPTkZJR19QTFVHSU5fSE9TVENDPSJnKysiCkNPTkZJR19IQVZF
X0dDQ19QTFVHSU5TPXkKQ09ORklHX0dDQ19QTFVHSU5TPXkKCiMKIyBHQ0MgcGx1Z2lucwojCiMg
Q09ORklHX0dDQ19QTFVHSU5fQ1lDX0NPTVBMRVhJVFkgaXMgbm90IHNldAojIENPTkZJR19HQ0Nf
UExVR0lOX0xBVEVOVF9FTlRST1BZIGlzIG5vdCBzZXQKIyBDT05GSUdfR0NDX1BMVUdJTl9SQU5E
U1RSVUNUIGlzIG5vdCBzZXQKIyBlbmQgb2YgR0NDIHBsdWdpbnMKIyBlbmQgb2YgR2VuZXJhbCBh
cmNoaXRlY3R1cmUtZGVwZW5kZW50IG9wdGlvbnMKCkNPTkZJR19SVF9NVVRFWEVTPXkKQ09ORklH
X0JBU0VfU01BTEw9MApDT05GSUdfTU9EVUxFUz15CkNPTkZJR19NT0RVTEVfRk9SQ0VfTE9BRD15
CkNPTkZJR19NT0RVTEVfVU5MT0FEPXkKIyBDT05GSUdfTU9EVUxFX0ZPUkNFX1VOTE9BRCBpcyBu
b3Qgc2V0CiMgQ09ORklHX01PRFZFUlNJT05TIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9EVUxFX1NS
Q1ZFUlNJT05fQUxMIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9EVUxFX1NJRyBpcyBub3Qgc2V0CiMg
Q09ORklHX01PRFVMRV9DT01QUkVTUyBpcyBub3Qgc2V0CiMgQ09ORklHX1RSSU1fVU5VU0VEX0tT
WU1TIGlzIG5vdCBzZXQKQ09ORklHX01PRFVMRVNfVFJFRV9MT09LVVA9eQpDT05GSUdfQkxPQ0s9
eQpDT05GSUdfQkxLX1NDU0lfUkVRVUVTVD15CkNPTkZJR19CTEtfREVWX0JTRz15CkNPTkZJR19C
TEtfREVWX0JTR0xJQj15CkNPTkZJR19CTEtfREVWX0lOVEVHUklUWT15CkNPTkZJR19CTEtfREVW
X1pPTkVEPXkKQ09ORklHX0JMS19ERVZfVEhST1RUTElORz15CiMgQ09ORklHX0JMS19ERVZfVEhS
T1RUTElOR19MT1cgaXMgbm90IHNldAojIENPTkZJR19CTEtfQ01ETElORV9QQVJTRVIgaXMgbm90
IHNldAojIENPTkZJR19CTEtfV0JUIGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX0NHUk9VUF9JT0xB
VEVOQ1kgaXMgbm90IHNldApDT05GSUdfQkxLX0RFQlVHX0ZTPXkKQ09ORklHX0JMS19ERUJVR19G
U19aT05FRD15CiMgQ09ORklHX0JMS19TRURfT1BBTCBpcyBub3Qgc2V0CgojCiMgUGFydGl0aW9u
IFR5cGVzCiMKQ09ORklHX1BBUlRJVElPTl9BRFZBTkNFRD15CiMgQ09ORklHX0FDT1JOX1BBUlRJ
VElPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0FJWF9QQVJUSVRJT04gaXMgbm90IHNldApDT05GSUdf
T1NGX1BBUlRJVElPTj15CkNPTkZJR19BTUlHQV9QQVJUSVRJT049eQojIENPTkZJR19BVEFSSV9Q
QVJUSVRJT04gaXMgbm90IHNldApDT05GSUdfTUFDX1BBUlRJVElPTj15CkNPTkZJR19NU0RPU19Q
QVJUSVRJT049eQpDT05GSUdfQlNEX0RJU0tMQUJFTD15CkNPTkZJR19NSU5JWF9TVUJQQVJUSVRJ
T049eQpDT05GSUdfU09MQVJJU19YODZfUEFSVElUSU9OPXkKQ09ORklHX1VOSVhXQVJFX0RJU0tM
QUJFTD15CiMgQ09ORklHX0xETV9QQVJUSVRJT04gaXMgbm90IHNldApDT05GSUdfU0dJX1BBUlRJ
VElPTj15CiMgQ09ORklHX1VMVFJJWF9QQVJUSVRJT04gaXMgbm90IHNldApDT05GSUdfU1VOX1BB
UlRJVElPTj15CkNPTkZJR19LQVJNQV9QQVJUSVRJT049eQpDT05GSUdfRUZJX1BBUlRJVElPTj15
CiMgQ09ORklHX1NZU1Y2OF9QQVJUSVRJT04gaXMgbm90IHNldAojIENPTkZJR19DTURMSU5FX1BB
UlRJVElPTiBpcyBub3Qgc2V0CiMgZW5kIG9mIFBhcnRpdGlvbiBUeXBlcwoKQ09ORklHX0JMT0NL
X0NPTVBBVD15CkNPTkZJR19CTEtfTVFfUENJPXkKQ09ORklHX0JMS19NUV9WSVJUSU89eQpDT05G
SUdfQkxLX1BNPXkKCiMKIyBJTyBTY2hlZHVsZXJzCiMKQ09ORklHX01RX0lPU0NIRURfREVBRExJ
TkU9eQpDT05GSUdfTVFfSU9TQ0hFRF9LWUJFUj15CiMgQ09ORklHX0lPU0NIRURfQkZRIGlzIG5v
dCBzZXQKIyBlbmQgb2YgSU8gU2NoZWR1bGVycwoKQ09ORklHX1BSRUVNUFRfTk9USUZJRVJTPXkK
Q09ORklHX1BBREFUQT15CkNPTkZJR19BU04xPXkKQ09ORklHX0lOTElORV9TUElOX1VOTE9DS19J
UlE9eQpDT05GSUdfSU5MSU5FX1JFQURfVU5MT0NLPXkKQ09ORklHX0lOTElORV9SRUFEX1VOTE9D
S19JUlE9eQpDT05GSUdfSU5MSU5FX1dSSVRFX1VOTE9DSz15CkNPTkZJR19JTkxJTkVfV1JJVEVf
VU5MT0NLX0lSUT15CkNPTkZJR19BUkNIX1NVUFBPUlRTX0FUT01JQ19STVc9eQpDT05GSUdfTVVU
RVhfU1BJTl9PTl9PV05FUj15CkNPTkZJR19SV1NFTV9TUElOX09OX09XTkVSPXkKQ09ORklHX0xP
Q0tfU1BJTl9PTl9PV05FUj15CkNPTkZJR19BUkNIX1VTRV9RVUVVRURfU1BJTkxPQ0tTPXkKQ09O
RklHX1FVRVVFRF9TUElOTE9DS1M9eQpDT05GSUdfQVJDSF9VU0VfUVVFVUVEX1JXTE9DS1M9eQpD
T05GSUdfUVVFVUVEX1JXTE9DS1M9eQpDT05GSUdfQVJDSF9IQVNfU1lOQ19DT1JFX0JFRk9SRV9V
U0VSTU9ERT15CkNPTkZJR19BUkNIX0hBU19TWVNDQUxMX1dSQVBQRVI9eQpDT05GSUdfRlJFRVpF
Uj15CgojCiMgRXhlY3V0YWJsZSBmaWxlIGZvcm1hdHMKIwpDT05GSUdfQklORk1UX0VMRj15CkNP
TkZJR19DT01QQVRfQklORk1UX0VMRj15CkNPTkZJR19FTEZDT1JFPXkKQ09ORklHX0NPUkVfRFVN
UF9ERUZBVUxUX0VMRl9IRUFERVJTPXkKQ09ORklHX0JJTkZNVF9TQ1JJUFQ9eQpDT05GSUdfQklO
Rk1UX01JU0M9bQpDT05GSUdfQ09SRURVTVA9eQojIGVuZCBvZiBFeGVjdXRhYmxlIGZpbGUgZm9y
bWF0cwoKIwojIE1lbW9yeSBNYW5hZ2VtZW50IG9wdGlvbnMKIwpDT05GSUdfU0VMRUNUX01FTU9S
WV9NT0RFTD15CkNPTkZJR19TUEFSU0VNRU1fTUFOVUFMPXkKQ09ORklHX1NQQVJTRU1FTT15CkNP
TkZJR19ORUVEX01VTFRJUExFX05PREVTPXkKQ09ORklHX0hBVkVfTUVNT1JZX1BSRVNFTlQ9eQpD
T05GSUdfU1BBUlNFTUVNX0VYVFJFTUU9eQpDT05GSUdfU1BBUlNFTUVNX1ZNRU1NQVBfRU5BQkxF
PXkKQ09ORklHX1NQQVJTRU1FTV9WTUVNTUFQPXkKQ09ORklHX0hBVkVfTUVNQkxPQ0tfTk9ERV9N
QVA9eQpDT05GSUdfTUVNT1JZX0lTT0xBVElPTj15CkNPTkZJR19IQVZFX0JPT1RNRU1fSU5GT19O
T0RFPXkKQ09ORklHX01FTU9SWV9IT1RQTFVHPXkKQ09ORklHX01FTU9SWV9IT1RQTFVHX1NQQVJT
RT15CiMgQ09ORklHX01FTU9SWV9IT1RQTFVHX0RFRkFVTFRfT05MSU5FIGlzIG5vdCBzZXQKQ09O
RklHX01FTU9SWV9IT1RSRU1PVkU9eQpDT05GSUdfU1BMSVRfUFRMT0NLX0NQVVM9NApDT05GSUdf
TUVNT1JZX0JBTExPT049eQpDT05GSUdfQkFMTE9PTl9DT01QQUNUSU9OPXkKQ09ORklHX0NPTVBB
Q1RJT049eQpDT05GSUdfTUlHUkFUSU9OPXkKQ09ORklHX0NPTlRJR19BTExPQz15CkNPTkZJR19Q
SFlTX0FERFJfVF82NEJJVD15CkNPTkZJR19CT1VOQ0U9eQpDT05GSUdfVklSVF9UT19CVVM9eQpD
T05GSUdfTU1VX05PVElGSUVSPXkKQ09ORklHX0tTTT15CkNPTkZJR19ERUZBVUxUX01NQVBfTUlO
X0FERFI9NDA5NgpDT05GSUdfQVJDSF9TVVBQT1JUU19NRU1PUllfRkFJTFVSRT15CkNPTkZJR19N
RU1PUllfRkFJTFVSRT15CkNPTkZJR19IV1BPSVNPTl9JTkpFQ1Q9bQpDT05GSUdfVFJBTlNQQVJF
TlRfSFVHRVBBR0U9eQpDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0VfQUxXQVlTPXkKIyBDT05G
SUdfVFJBTlNQQVJFTlRfSFVHRVBBR0VfTUFEVklTRSBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX1dB
TlRTX1RIUF9TV0FQPXkKQ09ORklHX1RIUF9TV0FQPXkKQ09ORklHX1RSQU5TUEFSRU5UX0hVR0Vf
UEFHRUNBQ0hFPXkKQ09ORklHX0NMRUFOQ0FDSEU9eQpDT05GSUdfRlJPTlRTV0FQPXkKQ09ORklH
X0NNQT15CiMgQ09ORklHX0NNQV9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0NNQV9ERUJVR0ZT
IGlzIG5vdCBzZXQKQ09ORklHX0NNQV9BUkVBUz03CiMgQ09ORklHX01FTV9TT0ZUX0RJUlRZIGlz
IG5vdCBzZXQKQ09ORklHX1pTV0FQPXkKQ09ORklHX1pQT09MPXkKQ09ORklHX1pCVUQ9eQojIENP
TkZJR19aM0ZPTEQgaXMgbm90IHNldApDT05GSUdfWlNNQUxMT0M9eQojIENPTkZJR19QR1RBQkxF
X01BUFBJTkcgaXMgbm90IHNldAojIENPTkZJR19aU01BTExPQ19TVEFUIGlzIG5vdCBzZXQKQ09O
RklHX0dFTkVSSUNfRUFSTFlfSU9SRU1BUD15CiMgQ09ORklHX0RFRkVSUkVEX1NUUlVDVF9QQUdF
X0lOSVQgaXMgbm90IHNldApDT05GSUdfSURMRV9QQUdFX1RSQUNLSU5HPXkKQ09ORklHX0FSQ0hf
SEFTX1pPTkVfREVWSUNFPXkKQ09ORklHX1pPTkVfREVWSUNFPXkKQ09ORklHX0FSQ0hfSEFTX0hN
TV9NSVJST1I9eQpDT05GSUdfQVJDSF9IQVNfSE1NX0RFVklDRT15CkNPTkZJR19BUkNIX0hBU19I
TU09eQpDT05GSUdfREVWX1BBR0VNQVBfT1BTPXkKIyBDT05GSUdfSE1NX01JUlJPUiBpcyBub3Qg
c2V0CiMgQ09ORklHX0RFVklDRV9QUklWQVRFIGlzIG5vdCBzZXQKIyBDT05GSUdfREVWSUNFX1BV
QkxJQyBpcyBub3Qgc2V0CkNPTkZJR19GUkFNRV9WRUNUT1I9eQpDT05GSUdfQVJDSF9VU0VTX0hJ
R0hfVk1BX0ZMQUdTPXkKQ09ORklHX0FSQ0hfSEFTX1BLRVlTPXkKIyBDT05GSUdfUEVSQ1BVX1NU
QVRTIGlzIG5vdCBzZXQKIyBDT05GSUdfR1VQX0JFTkNITUFSSyBpcyBub3Qgc2V0CkNPTkZJR19B
UkNIX0hBU19QVEVfU1BFQ0lBTD15CiMgZW5kIG9mIE1lbW9yeSBNYW5hZ2VtZW50IG9wdGlvbnMK
CkNPTkZJR19ORVQ9eQpDT05GSUdfQ09NUEFUX05FVExJTktfTUVTU0FHRVM9eQpDT05GSUdfTkVU
X0lOR1JFU1M9eQpDT05GSUdfTkVUX0VHUkVTUz15CkNPTkZJR19TS0JfRVhURU5TSU9OUz15Cgoj
CiMgTmV0d29ya2luZyBvcHRpb25zCiMKQ09ORklHX1BBQ0tFVD15CkNPTkZJR19QQUNLRVRfRElB
Rz1tCkNPTkZJR19VTklYPXkKQ09ORklHX1VOSVhfU0NNPXkKQ09ORklHX1VOSVhfRElBRz1tCiMg
Q09ORklHX1RMUyBpcyBub3Qgc2V0CkNPTkZJR19YRlJNPXkKQ09ORklHX1hGUk1fQUxHTz15CkNP
TkZJR19YRlJNX1VTRVI9eQojIENPTkZJR19YRlJNX0lOVEVSRkFDRSBpcyBub3Qgc2V0CkNPTkZJ
R19YRlJNX1NVQl9QT0xJQ1k9eQpDT05GSUdfWEZSTV9NSUdSQVRFPXkKQ09ORklHX1hGUk1fU1RB
VElTVElDUz15CkNPTkZJR19YRlJNX0lQQ09NUD1tCkNPTkZJR19ORVRfS0VZPW0KQ09ORklHX05F
VF9LRVlfTUlHUkFURT15CiMgQ09ORklHX1hEUF9TT0NLRVRTIGlzIG5vdCBzZXQKQ09ORklHX0lO
RVQ9eQpDT05GSUdfSVBfTVVMVElDQVNUPXkKQ09ORklHX0lQX0FEVkFOQ0VEX1JPVVRFUj15CkNP
TkZJR19JUF9GSUJfVFJJRV9TVEFUUz15CkNPTkZJR19JUF9NVUxUSVBMRV9UQUJMRVM9eQpDT05G
SUdfSVBfUk9VVEVfTVVMVElQQVRIPXkKQ09ORklHX0lQX1JPVVRFX1ZFUkJPU0U9eQpDT05GSUdf
SVBfUk9VVEVfQ0xBU1NJRD15CkNPTkZJR19JUF9QTlA9eQpDT05GSUdfSVBfUE5QX0RIQ1A9eQoj
IENPTkZJR19JUF9QTlBfQk9PVFAgaXMgbm90IHNldAojIENPTkZJR19JUF9QTlBfUkFSUCBpcyBu
b3Qgc2V0CkNPTkZJR19ORVRfSVBJUD1tCkNPTkZJR19ORVRfSVBHUkVfREVNVVg9bQpDT05GSUdf
TkVUX0lQX1RVTk5FTD1tCkNPTkZJR19ORVRfSVBHUkU9bQpDT05GSUdfTkVUX0lQR1JFX0JST0FE
Q0FTVD15CkNPTkZJR19JUF9NUk9VVEVfQ09NTU9OPXkKQ09ORklHX0lQX01ST1VURT15CkNPTkZJ
R19JUF9NUk9VVEVfTVVMVElQTEVfVEFCTEVTPXkKQ09ORklHX0lQX1BJTVNNX1YxPXkKQ09ORklH
X0lQX1BJTVNNX1YyPXkKQ09ORklHX1NZTl9DT09LSUVTPXkKQ09ORklHX05FVF9JUFZUST1tCkNP
TkZJR19ORVRfVURQX1RVTk5FTD1tCkNPTkZJR19ORVRfRk9VPW0KQ09ORklHX05FVF9GT1VfSVBf
VFVOTkVMUz15CkNPTkZJR19JTkVUX0FIPW0KQ09ORklHX0lORVRfRVNQPW0KIyBDT05GSUdfSU5F
VF9FU1BfT0ZGTE9BRCBpcyBub3Qgc2V0CkNPTkZJR19JTkVUX0lQQ09NUD1tCkNPTkZJR19JTkVU
X1hGUk1fVFVOTkVMPW0KQ09ORklHX0lORVRfVFVOTkVMPW0KQ09ORklHX0lORVRfRElBRz1tCkNP
TkZJR19JTkVUX1RDUF9ESUFHPW0KQ09ORklHX0lORVRfVURQX0RJQUc9bQojIENPTkZJR19JTkVU
X1JBV19ESUFHIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5FVF9ESUFHX0RFU1RST1kgaXMgbm90IHNl
dApDT05GSUdfVENQX0NPTkdfQURWQU5DRUQ9eQpDT05GSUdfVENQX0NPTkdfQklDPW0KQ09ORklH
X1RDUF9DT05HX0NVQklDPXkKQ09ORklHX1RDUF9DT05HX1dFU1RXT09EPW0KQ09ORklHX1RDUF9D
T05HX0hUQ1A9bQpDT05GSUdfVENQX0NPTkdfSFNUQ1A9bQpDT05GSUdfVENQX0NPTkdfSFlCTEE9
bQpDT05GSUdfVENQX0NPTkdfVkVHQVM9bQojIENPTkZJR19UQ1BfQ09OR19OViBpcyBub3Qgc2V0
CkNPTkZJR19UQ1BfQ09OR19TQ0FMQUJMRT1tCkNPTkZJR19UQ1BfQ09OR19MUD1tCkNPTkZJR19U
Q1BfQ09OR19WRU5PPW0KQ09ORklHX1RDUF9DT05HX1lFQUg9bQpDT05GSUdfVENQX0NPTkdfSUxM
SU5PSVM9bQojIENPTkZJR19UQ1BfQ09OR19EQ1RDUCBpcyBub3Qgc2V0CiMgQ09ORklHX1RDUF9D
T05HX0NERyBpcyBub3Qgc2V0CiMgQ09ORklHX1RDUF9DT05HX0JCUiBpcyBub3Qgc2V0CkNPTkZJ
R19ERUZBVUxUX0NVQklDPXkKIyBDT05GSUdfREVGQVVMVF9SRU5PIGlzIG5vdCBzZXQKQ09ORklH
X0RFRkFVTFRfVENQX0NPTkc9ImN1YmljIgpDT05GSUdfVENQX01ENVNJRz15CkNPTkZJR19JUFY2
PXkKQ09ORklHX0lQVjZfUk9VVEVSX1BSRUY9eQpDT05GSUdfSVBWNl9ST1VURV9JTkZPPXkKQ09O
RklHX0lQVjZfT1BUSU1JU1RJQ19EQUQ9eQpDT05GSUdfSU5FVDZfQUg9bQpDT05GSUdfSU5FVDZf
RVNQPW0KIyBDT05GSUdfSU5FVDZfRVNQX09GRkxPQUQgaXMgbm90IHNldApDT05GSUdfSU5FVDZf
SVBDT01QPW0KQ09ORklHX0lQVjZfTUlQNj1tCiMgQ09ORklHX0lQVjZfSUxBIGlzIG5vdCBzZXQK
Q09ORklHX0lORVQ2X1hGUk1fVFVOTkVMPW0KQ09ORklHX0lORVQ2X1RVTk5FTD1tCkNPTkZJR19J
UFY2X1ZUST1tCkNPTkZJR19JUFY2X1NJVD1tCkNPTkZJR19JUFY2X1NJVF82UkQ9eQpDT05GSUdf
SVBWNl9ORElTQ19OT0RFVFlQRT15CkNPTkZJR19JUFY2X1RVTk5FTD1tCiMgQ09ORklHX0lQVjZf
R1JFIGlzIG5vdCBzZXQKQ09ORklHX0lQVjZfRk9VPW0KQ09ORklHX0lQVjZfRk9VX1RVTk5FTD1t
CkNPTkZJR19JUFY2X01VTFRJUExFX1RBQkxFUz15CiMgQ09ORklHX0lQVjZfU1VCVFJFRVMgaXMg
bm90IHNldApDT05GSUdfSVBWNl9NUk9VVEU9eQpDT05GSUdfSVBWNl9NUk9VVEVfTVVMVElQTEVf
VEFCTEVTPXkKQ09ORklHX0lQVjZfUElNU01fVjI9eQpDT05GSUdfSVBWNl9TRUc2X0xXVFVOTkVM
PXkKIyBDT05GSUdfSVBWNl9TRUc2X0hNQUMgaXMgbm90IHNldApDT05GSUdfSVBWNl9TRUc2X0JQ
Rj15CkNPTkZJR19ORVRMQUJFTD15CkNPTkZJR19ORVRXT1JLX1NFQ01BUks9eQpDT05GSUdfTkVU
X1BUUF9DTEFTU0lGWT15CkNPTkZJR19ORVRXT1JLX1BIWV9USU1FU1RBTVBJTkc9eQpDT05GSUdf
TkVURklMVEVSPXkKQ09ORklHX05FVEZJTFRFUl9BRFZBTkNFRD15CkNPTkZJR19CUklER0VfTkVU
RklMVEVSPW0KCiMKIyBDb3JlIE5ldGZpbHRlciBDb25maWd1cmF0aW9uCiMKQ09ORklHX05FVEZJ
TFRFUl9JTkdSRVNTPXkKQ09ORklHX05FVEZJTFRFUl9ORVRMSU5LPW0KQ09ORklHX05FVEZJTFRF
Ul9GQU1JTFlfQlJJREdFPXkKQ09ORklHX05FVEZJTFRFUl9GQU1JTFlfQVJQPXkKQ09ORklHX05F
VEZJTFRFUl9ORVRMSU5LX0FDQ1Q9bQpDT05GSUdfTkVURklMVEVSX05FVExJTktfUVVFVUU9bQpD
T05GSUdfTkVURklMVEVSX05FVExJTktfTE9HPW0KQ09ORklHX05FVEZJTFRFUl9ORVRMSU5LX09T
Rj1tCkNPTkZJR19ORl9DT05OVFJBQ0s9bQpDT05GSUdfTkZfTE9HX0NPTU1PTj1tCiMgQ09ORklH
X05GX0xPR19ORVRERVYgaXMgbm90IHNldApDT05GSUdfTkVURklMVEVSX0NPTk5DT1VOVD1tCkNP
TkZJR19ORl9DT05OVFJBQ0tfTUFSSz15CkNPTkZJR19ORl9DT05OVFJBQ0tfU0VDTUFSSz15CkNP
TkZJR19ORl9DT05OVFJBQ0tfWk9ORVM9eQpDT05GSUdfTkZfQ09OTlRSQUNLX1BST0NGUz15CkNP
TkZJR19ORl9DT05OVFJBQ0tfRVZFTlRTPXkKIyBDT05GSUdfTkZfQ09OTlRSQUNLX1RJTUVPVVQg
aXMgbm90IHNldApDT05GSUdfTkZfQ09OTlRSQUNLX1RJTUVTVEFNUD15CkNPTkZJR19ORl9DT05O
VFJBQ0tfTEFCRUxTPXkKQ09ORklHX05GX0NUX1BST1RPX0RDQ1A9eQpDT05GSUdfTkZfQ1RfUFJP
VE9fR1JFPXkKQ09ORklHX05GX0NUX1BST1RPX1NDVFA9eQpDT05GSUdfTkZfQ1RfUFJPVE9fVURQ
TElURT15CkNPTkZJR19ORl9DT05OVFJBQ0tfQU1BTkRBPW0KQ09ORklHX05GX0NPTk5UUkFDS19G
VFA9bQpDT05GSUdfTkZfQ09OTlRSQUNLX0gzMjM9bQpDT05GSUdfTkZfQ09OTlRSQUNLX0lSQz1t
CkNPTkZJR19ORl9DT05OVFJBQ0tfQlJPQURDQVNUPW0KQ09ORklHX05GX0NPTk5UUkFDS19ORVRC
SU9TX05TPW0KQ09ORklHX05GX0NPTk5UUkFDS19TTk1QPW0KQ09ORklHX05GX0NPTk5UUkFDS19Q
UFRQPW0KQ09ORklHX05GX0NPTk5UUkFDS19TQU5FPW0KQ09ORklHX05GX0NPTk5UUkFDS19TSVA9
bQpDT05GSUdfTkZfQ09OTlRSQUNLX1RGVFA9bQpDT05GSUdfTkZfQ1RfTkVUTElOSz1tCiMgQ09O
RklHX05FVEZJTFRFUl9ORVRMSU5LX0dMVUVfQ1QgaXMgbm90IHNldApDT05GSUdfTkZfTkFUPW0K
Q09ORklHX05GX05BVF9BTUFOREE9bQpDT05GSUdfTkZfTkFUX0ZUUD1tCkNPTkZJR19ORl9OQVRf
SVJDPW0KQ09ORklHX05GX05BVF9TSVA9bQpDT05GSUdfTkZfTkFUX1RGVFA9bQpDT05GSUdfTkZf
TkFUX1JFRElSRUNUPXkKQ09ORklHX05GX05BVF9NQVNRVUVSQURFPXkKQ09ORklHX05FVEZJTFRF
Ul9TWU5QUk9YWT1tCkNPTkZJR19ORl9UQUJMRVM9bQojIENPTkZJR19ORl9UQUJMRVNfU0VUIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkZfVEFCTEVTX0lORVQgaXMgbm90IHNldAojIENPTkZJR19ORl9U
QUJMRVNfTkVUREVWIGlzIG5vdCBzZXQKIyBDT05GSUdfTkZUX05VTUdFTiBpcyBub3Qgc2V0CkNP
TkZJR19ORlRfQ1Q9bQpDT05GSUdfTkZUX0NPVU5URVI9bQojIENPTkZJR19ORlRfQ09OTkxJTUlU
IGlzIG5vdCBzZXQKQ09ORklHX05GVF9MT0c9bQpDT05GSUdfTkZUX0xJTUlUPW0KIyBDT05GSUdf
TkZUX01BU1EgaXMgbm90IHNldAojIENPTkZJR19ORlRfUkVESVIgaXMgbm90IHNldAojIENPTkZJ
R19ORlRfVFVOTkVMIGlzIG5vdCBzZXQKIyBDT05GSUdfTkZUX09CSlJFRiBpcyBub3Qgc2V0CiMg
Q09ORklHX05GVF9RVUVVRSBpcyBub3Qgc2V0CiMgQ09ORklHX05GVF9RVU9UQSBpcyBub3Qgc2V0
CiMgQ09ORklHX05GVF9SRUpFQ1QgaXMgbm90IHNldApDT05GSUdfTkZUX0NPTVBBVD1tCkNPTkZJ
R19ORlRfSEFTSD1tCiMgQ09ORklHX05GVF9YRlJNIGlzIG5vdCBzZXQKIyBDT05GSUdfTkZUX1NP
Q0tFVCBpcyBub3Qgc2V0CiMgQ09ORklHX05GVF9PU0YgaXMgbm90IHNldAojIENPTkZJR19ORlRf
VFBST1hZIGlzIG5vdCBzZXQKIyBDT05GSUdfTkZfRkxPV19UQUJMRSBpcyBub3Qgc2V0CkNPTkZJ
R19ORVRGSUxURVJfWFRBQkxFUz15CgojCiMgWHRhYmxlcyBjb21iaW5lZCBtb2R1bGVzCiMKQ09O
RklHX05FVEZJTFRFUl9YVF9NQVJLPW0KQ09ORklHX05FVEZJTFRFUl9YVF9DT05OTUFSSz1tCkNP
TkZJR19ORVRGSUxURVJfWFRfU0VUPW0KCiMKIyBYdGFibGVzIHRhcmdldHMKIwpDT05GSUdfTkVU
RklMVEVSX1hUX1RBUkdFVF9BVURJVD1tCkNPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX0NIRUNL
U1VNPW0KQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfQ0xBU1NJRlk9bQpDT05GSUdfTkVURklM
VEVSX1hUX1RBUkdFVF9DT05OTUFSSz1tCkNPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX0NPTk5T
RUNNQVJLPW0KQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfQ1Q9bQpDT05GSUdfTkVURklMVEVS
X1hUX1RBUkdFVF9EU0NQPW0KQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfSEw9bQpDT05GSUdf
TkVURklMVEVSX1hUX1RBUkdFVF9ITUFSSz1tCkNPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX0lE
TEVUSU1FUj1tCkNPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX0xFRD1tCkNPTkZJR19ORVRGSUxU
RVJfWFRfVEFSR0VUX0xPRz1tCkNPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX01BUks9bQpDT05G
SUdfTkVURklMVEVSX1hUX05BVD1tCkNPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX05FVE1BUD1t
CkNPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX05GTE9HPW0KQ09ORklHX05FVEZJTFRFUl9YVF9U
QVJHRVRfTkZRVUVVRT1tCkNPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX05PVFJBQ0s9bQpDT05G
SUdfTkVURklMVEVSX1hUX1RBUkdFVF9SQVRFRVNUPW0KQ09ORklHX05FVEZJTFRFUl9YVF9UQVJH
RVRfUkVESVJFQ1Q9bQpDT05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9NQVNRVUVSQURFPW0KQ09O
RklHX05FVEZJTFRFUl9YVF9UQVJHRVRfVEVFPW0KQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRf
VFBST1hZPW0KQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfVFJBQ0U9bQpDT05GSUdfTkVURklM
VEVSX1hUX1RBUkdFVF9TRUNNQVJLPW0KQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfVENQTVNT
PW0KQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfVENQT1BUU1RSSVA9bQoKIwojIFh0YWJsZXMg
bWF0Y2hlcwojCkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfQUREUlRZUEU9bQpDT05GSUdfTkVU
RklMVEVSX1hUX01BVENIX0JQRj1tCiMgQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9DR1JPVVAg
aXMgbm90IHNldApDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0NMVVNURVI9bQpDT05GSUdfTkVU
RklMVEVSX1hUX01BVENIX0NPTU1FTlQ9bQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0NPTk5C
WVRFUz1tCkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfQ09OTkxBQkVMPW0KQ09ORklHX05FVEZJ
TFRFUl9YVF9NQVRDSF9DT05OTElNSVQ9bQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0NPTk5N
QVJLPW0KQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9DT05OVFJBQ0s9bQpDT05GSUdfTkVURklM
VEVSX1hUX01BVENIX0NQVT1tCkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfRENDUD1tCkNPTkZJ
R19ORVRGSUxURVJfWFRfTUFUQ0hfREVWR1JPVVA9bQpDT05GSUdfTkVURklMVEVSX1hUX01BVENI
X0RTQ1A9bQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0VDTj1tCkNPTkZJR19ORVRGSUxURVJf
WFRfTUFUQ0hfRVNQPW0KQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9IQVNITElNSVQ9bQpDT05G
SUdfTkVURklMVEVSX1hUX01BVENIX0hFTFBFUj1tCkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hf
SEw9bQojIENPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfSVBDT01QIGlzIG5vdCBzZXQKQ09ORklH
X05FVEZJTFRFUl9YVF9NQVRDSF9JUFJBTkdFPW0KQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9J
UFZTPW0KQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9MMlRQPW0KQ09ORklHX05FVEZJTFRFUl9Y
VF9NQVRDSF9MRU5HVEg9bQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0xJTUlUPW0KQ09ORklH
X05FVEZJTFRFUl9YVF9NQVRDSF9NQUM9bQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX01BUks9
bQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX01VTFRJUE9SVD1tCkNPTkZJR19ORVRGSUxURVJf
WFRfTUFUQ0hfTkZBQ0NUPW0KQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9PU0Y9bQpDT05GSUdf
TkVURklMVEVSX1hUX01BVENIX09XTkVSPW0KQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9QT0xJ
Q1k9bQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX1BIWVNERVY9bQpDT05GSUdfTkVURklMVEVS
X1hUX01BVENIX1BLVFRZUEU9bQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX1FVT1RBPW0KQ09O
RklHX05FVEZJTFRFUl9YVF9NQVRDSF9SQVRFRVNUPW0KQ09ORklHX05FVEZJTFRFUl9YVF9NQVRD
SF9SRUFMTT1tCkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfUkVDRU5UPW0KQ09ORklHX05FVEZJ
TFRFUl9YVF9NQVRDSF9TQ1RQPW0KIyBDT05GSUdfTkVURklMVEVSX1hUX01BVENIX1NPQ0tFVCBp
cyBub3Qgc2V0CkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfU1RBVEU9bQpDT05GSUdfTkVURklM
VEVSX1hUX01BVENIX1NUQVRJU1RJQz1tCkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfU1RSSU5H
PW0KQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9UQ1BNU1M9bQpDT05GSUdfTkVURklMVEVSX1hU
X01BVENIX1RJTUU9bQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX1UzMj1tCiMgZW5kIG9mIENv
cmUgTmV0ZmlsdGVyIENvbmZpZ3VyYXRpb24KCkNPTkZJR19JUF9TRVQ9bQpDT05GSUdfSVBfU0VU
X01BWD0yNTYKQ09ORklHX0lQX1NFVF9CSVRNQVBfSVA9bQpDT05GSUdfSVBfU0VUX0JJVE1BUF9J
UE1BQz1tCkNPTkZJR19JUF9TRVRfQklUTUFQX1BPUlQ9bQpDT05GSUdfSVBfU0VUX0hBU0hfSVA9
bQojIENPTkZJR19JUF9TRVRfSEFTSF9JUE1BUksgaXMgbm90IHNldApDT05GSUdfSVBfU0VUX0hB
U0hfSVBQT1JUPW0KQ09ORklHX0lQX1NFVF9IQVNIX0lQUE9SVElQPW0KQ09ORklHX0lQX1NFVF9I
QVNIX0lQUE9SVE5FVD1tCiMgQ09ORklHX0lQX1NFVF9IQVNIX0lQTUFDIGlzIG5vdCBzZXQKIyBD
T05GSUdfSVBfU0VUX0hBU0hfTUFDIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBfU0VUX0hBU0hfTkVU
UE9SVE5FVCBpcyBub3Qgc2V0CkNPTkZJR19JUF9TRVRfSEFTSF9ORVQ9bQojIENPTkZJR19JUF9T
RVRfSEFTSF9ORVRORVQgaXMgbm90IHNldApDT05GSUdfSVBfU0VUX0hBU0hfTkVUUE9SVD1tCkNP
TkZJR19JUF9TRVRfSEFTSF9ORVRJRkFDRT1tCkNPTkZJR19JUF9TRVRfTElTVF9TRVQ9bQpDT05G
SUdfSVBfVlM9bQpDT05GSUdfSVBfVlNfSVBWNj15CiMgQ09ORklHX0lQX1ZTX0RFQlVHIGlzIG5v
dCBzZXQKQ09ORklHX0lQX1ZTX1RBQl9CSVRTPTEyCgojCiMgSVBWUyB0cmFuc3BvcnQgcHJvdG9j
b2wgbG9hZCBiYWxhbmNpbmcgc3VwcG9ydAojCkNPTkZJR19JUF9WU19QUk9UT19UQ1A9eQpDT05G
SUdfSVBfVlNfUFJPVE9fVURQPXkKQ09ORklHX0lQX1ZTX1BST1RPX0FIX0VTUD15CkNPTkZJR19J
UF9WU19QUk9UT19FU1A9eQpDT05GSUdfSVBfVlNfUFJPVE9fQUg9eQpDT05GSUdfSVBfVlNfUFJP
VE9fU0NUUD15CgojCiMgSVBWUyBzY2hlZHVsZXIKIwpDT05GSUdfSVBfVlNfUlI9bQpDT05GSUdf
SVBfVlNfV1JSPW0KQ09ORklHX0lQX1ZTX0xDPW0KQ09ORklHX0lQX1ZTX1dMQz1tCiMgQ09ORklH
X0lQX1ZTX0ZPIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBfVlNfT1ZGIGlzIG5vdCBzZXQKQ09ORklH
X0lQX1ZTX0xCTEM9bQpDT05GSUdfSVBfVlNfTEJMQ1I9bQpDT05GSUdfSVBfVlNfREg9bQpDT05G
SUdfSVBfVlNfU0g9bQojIENPTkZJR19JUF9WU19NSCBpcyBub3Qgc2V0CkNPTkZJR19JUF9WU19T
RUQ9bQpDT05GSUdfSVBfVlNfTlE9bQoKIwojIElQVlMgU0ggc2NoZWR1bGVyCiMKQ09ORklHX0lQ
X1ZTX1NIX1RBQl9CSVRTPTgKCiMKIyBJUFZTIE1IIHNjaGVkdWxlcgojCkNPTkZJR19JUF9WU19N
SF9UQUJfSU5ERVg9MTIKCiMKIyBJUFZTIGFwcGxpY2F0aW9uIGhlbHBlcgojCkNPTkZJR19JUF9W
U19GVFA9bQpDT05GSUdfSVBfVlNfTkZDVD15CkNPTkZJR19JUF9WU19QRV9TSVA9bQoKIwojIElQ
OiBOZXRmaWx0ZXIgQ29uZmlndXJhdGlvbgojCkNPTkZJR19ORl9ERUZSQUdfSVBWND1tCiMgQ09O
RklHX05GX1NPQ0tFVF9JUFY0IGlzIG5vdCBzZXQKQ09ORklHX05GX1RQUk9YWV9JUFY0PW0KIyBD
T05GSUdfTkZfVEFCTEVTX0lQVjQgaXMgbm90IHNldAojIENPTkZJR19ORl9UQUJMRVNfQVJQIGlz
IG5vdCBzZXQKQ09ORklHX05GX0RVUF9JUFY0PW0KIyBDT05GSUdfTkZfTE9HX0FSUCBpcyBub3Qg
c2V0CkNPTkZJR19ORl9MT0dfSVBWND1tCkNPTkZJR19ORl9SRUpFQ1RfSVBWND1tCkNPTkZJR19O
Rl9OQVRfU05NUF9CQVNJQz1tCkNPTkZJR19ORl9OQVRfUFBUUD1tCkNPTkZJR19ORl9OQVRfSDMy
Mz1tCkNPTkZJR19JUF9ORl9JUFRBQkxFUz1tCkNPTkZJR19JUF9ORl9NQVRDSF9BSD1tCkNPTkZJ
R19JUF9ORl9NQVRDSF9FQ049bQpDT05GSUdfSVBfTkZfTUFUQ0hfUlBGSUxURVI9bQpDT05GSUdf
SVBfTkZfTUFUQ0hfVFRMPW0KQ09ORklHX0lQX05GX0ZJTFRFUj1tCkNPTkZJR19JUF9ORl9UQVJH
RVRfUkVKRUNUPW0KQ09ORklHX0lQX05GX1RBUkdFVF9TWU5QUk9YWT1tCkNPTkZJR19JUF9ORl9O
QVQ9bQpDT05GSUdfSVBfTkZfVEFSR0VUX01BU1FVRVJBREU9bQpDT05GSUdfSVBfTkZfVEFSR0VU
X05FVE1BUD1tCkNPTkZJR19JUF9ORl9UQVJHRVRfUkVESVJFQ1Q9bQpDT05GSUdfSVBfTkZfTUFO
R0xFPW0KQ09ORklHX0lQX05GX1RBUkdFVF9DTFVTVEVSSVA9bQpDT05GSUdfSVBfTkZfVEFSR0VU
X0VDTj1tCkNPTkZJR19JUF9ORl9UQVJHRVRfVFRMPW0KQ09ORklHX0lQX05GX1JBVz1tCkNPTkZJ
R19JUF9ORl9TRUNVUklUWT1tCkNPTkZJR19JUF9ORl9BUlBUQUJMRVM9bQpDT05GSUdfSVBfTkZf
QVJQRklMVEVSPW0KQ09ORklHX0lQX05GX0FSUF9NQU5HTEU9bQojIGVuZCBvZiBJUDogTmV0Zmls
dGVyIENvbmZpZ3VyYXRpb24KCiMKIyBJUHY2OiBOZXRmaWx0ZXIgQ29uZmlndXJhdGlvbgojCiMg
Q09ORklHX05GX1NPQ0tFVF9JUFY2IGlzIG5vdCBzZXQKQ09ORklHX05GX1RQUk9YWV9JUFY2PW0K
IyBDT05GSUdfTkZfVEFCTEVTX0lQVjYgaXMgbm90IHNldApDT05GSUdfTkZfRFVQX0lQVjY9bQpD
T05GSUdfTkZfUkVKRUNUX0lQVjY9bQpDT05GSUdfTkZfTE9HX0lQVjY9bQpDT05GSUdfSVA2X05G
X0lQVEFCTEVTPW0KQ09ORklHX0lQNl9ORl9NQVRDSF9BSD1tCkNPTkZJR19JUDZfTkZfTUFUQ0hf
RVVJNjQ9bQpDT05GSUdfSVA2X05GX01BVENIX0ZSQUc9bQpDT05GSUdfSVA2X05GX01BVENIX09Q
VFM9bQpDT05GSUdfSVA2X05GX01BVENIX0hMPW0KQ09ORklHX0lQNl9ORl9NQVRDSF9JUFY2SEVB
REVSPW0KQ09ORklHX0lQNl9ORl9NQVRDSF9NSD1tCkNPTkZJR19JUDZfTkZfTUFUQ0hfUlBGSUxU
RVI9bQpDT05GSUdfSVA2X05GX01BVENIX1JUPW0KIyBDT05GSUdfSVA2X05GX01BVENIX1NSSCBp
cyBub3Qgc2V0CkNPTkZJR19JUDZfTkZfVEFSR0VUX0hMPW0KQ09ORklHX0lQNl9ORl9GSUxURVI9
bQpDT05GSUdfSVA2X05GX1RBUkdFVF9SRUpFQ1Q9bQpDT05GSUdfSVA2X05GX1RBUkdFVF9TWU5Q
Uk9YWT1tCkNPTkZJR19JUDZfTkZfTUFOR0xFPW0KQ09ORklHX0lQNl9ORl9SQVc9bQpDT05GSUdf
SVA2X05GX1NFQ1VSSVRZPW0KIyBDT05GSUdfSVA2X05GX05BVCBpcyBub3Qgc2V0CiMgZW5kIG9m
IElQdjY6IE5ldGZpbHRlciBDb25maWd1cmF0aW9uCgpDT05GSUdfTkZfREVGUkFHX0lQVjY9bQoj
IENPTkZJR19ORl9UQUJMRVNfQlJJREdFIGlzIG5vdCBzZXQKQ09ORklHX0JSSURHRV9ORl9FQlRB
QkxFUz1tCkNPTkZJR19CUklER0VfRUJUX0JST1VURT1tCkNPTkZJR19CUklER0VfRUJUX1RfRklM
VEVSPW0KQ09ORklHX0JSSURHRV9FQlRfVF9OQVQ9bQpDT05GSUdfQlJJREdFX0VCVF84MDJfMz1t
CkNPTkZJR19CUklER0VfRUJUX0FNT05HPW0KQ09ORklHX0JSSURHRV9FQlRfQVJQPW0KQ09ORklH
X0JSSURHRV9FQlRfSVA9bQpDT05GSUdfQlJJREdFX0VCVF9JUDY9bQpDT05GSUdfQlJJREdFX0VC
VF9MSU1JVD1tCkNPTkZJR19CUklER0VfRUJUX01BUks9bQpDT05GSUdfQlJJREdFX0VCVF9QS1RU
WVBFPW0KQ09ORklHX0JSSURHRV9FQlRfU1RQPW0KQ09ORklHX0JSSURHRV9FQlRfVkxBTj1tCkNP
TkZJR19CUklER0VfRUJUX0FSUFJFUExZPW0KQ09ORklHX0JSSURHRV9FQlRfRE5BVD1tCkNPTkZJ
R19CUklER0VfRUJUX01BUktfVD1tCkNPTkZJR19CUklER0VfRUJUX1JFRElSRUNUPW0KQ09ORklH
X0JSSURHRV9FQlRfU05BVD1tCkNPTkZJR19CUklER0VfRUJUX0xPRz1tCkNPTkZJR19CUklER0Vf
RUJUX05GTE9HPW0KIyBDT05GSUdfQlBGSUxURVIgaXMgbm90IHNldApDT05GSUdfSVBfRENDUD1t
CkNPTkZJR19JTkVUX0RDQ1BfRElBRz1tCgojCiMgRENDUCBDQ0lEcyBDb25maWd1cmF0aW9uCiMK
IyBDT05GSUdfSVBfRENDUF9DQ0lEMl9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19JUF9EQ0NQX0ND
SUQzPXkKIyBDT05GSUdfSVBfRENDUF9DQ0lEM19ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19JUF9E
Q0NQX1RGUkNfTElCPXkKIyBlbmQgb2YgRENDUCBDQ0lEcyBDb25maWd1cmF0aW9uCgojCiMgREND
UCBLZXJuZWwgSGFja2luZwojCiMgQ09ORklHX0lQX0RDQ1BfREVCVUcgaXMgbm90IHNldAojIGVu
ZCBvZiBEQ0NQIEtlcm5lbCBIYWNraW5nCgpDT05GSUdfSVBfU0NUUD1tCiMgQ09ORklHX1NDVFBf
REJHX09CSkNOVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDVFBfREVGQVVMVF9DT09LSUVfSE1BQ19N
RDUgaXMgbm90IHNldApDT05GSUdfU0NUUF9ERUZBVUxUX0NPT0tJRV9ITUFDX1NIQTE9eQojIENP
TkZJR19TQ1RQX0RFRkFVTFRfQ09PS0lFX0hNQUNfTk9ORSBpcyBub3Qgc2V0CkNPTkZJR19TQ1RQ
X0NPT0tJRV9ITUFDX01ENT15CkNPTkZJR19TQ1RQX0NPT0tJRV9ITUFDX1NIQTE9eQpDT05GSUdf
SU5FVF9TQ1RQX0RJQUc9bQojIENPTkZJR19SRFMgaXMgbm90IHNldApDT05GSUdfVElQQz1tCkNP
TkZJR19USVBDX01FRElBX1VEUD15CkNPTkZJR19USVBDX0RJQUc9bQpDT05GSUdfQVRNPW0KQ09O
RklHX0FUTV9DTElQPW0KIyBDT05GSUdfQVRNX0NMSVBfTk9fSUNNUCBpcyBub3Qgc2V0CkNPTkZJ
R19BVE1fTEFORT1tCiMgQ09ORklHX0FUTV9NUE9BIGlzIG5vdCBzZXQKQ09ORklHX0FUTV9CUjI2
ODQ9bQojIENPTkZJR19BVE1fQlIyNjg0X0lQRklMVEVSIGlzIG5vdCBzZXQKQ09ORklHX0wyVFA9
bQpDT05GSUdfTDJUUF9ERUJVR0ZTPW0KQ09ORklHX0wyVFBfVjM9eQpDT05GSUdfTDJUUF9JUD1t
CkNPTkZJR19MMlRQX0VUSD1tCkNPTkZJR19TVFA9bQpDT05GSUdfR0FSUD1tCkNPTkZJR19NUlA9
bQpDT05GSUdfQlJJREdFPW0KQ09ORklHX0JSSURHRV9JR01QX1NOT09QSU5HPXkKQ09ORklHX0JS
SURHRV9WTEFOX0ZJTFRFUklORz15CkNPTkZJR19IQVZFX05FVF9EU0E9eQojIENPTkZJR19ORVRf
RFNBIGlzIG5vdCBzZXQKQ09ORklHX1ZMQU5fODAyMVE9bQpDT05GSUdfVkxBTl84MDIxUV9HVlJQ
PXkKQ09ORklHX1ZMQU5fODAyMVFfTVZSUD15CiMgQ09ORklHX0RFQ05FVCBpcyBub3Qgc2V0CkNP
TkZJR19MTEM9bQojIENPTkZJR19MTEMyIGlzIG5vdCBzZXQKIyBDT05GSUdfQVRBTEsgaXMgbm90
IHNldAojIENPTkZJR19YMjUgaXMgbm90IHNldAojIENPTkZJR19MQVBCIGlzIG5vdCBzZXQKIyBD
T05GSUdfUEhPTkVUIGlzIG5vdCBzZXQKIyBDT05GSUdfNkxPV1BBTiBpcyBub3Qgc2V0CkNPTkZJ
R19JRUVFODAyMTU0PW0KIyBDT05GSUdfSUVFRTgwMjE1NF9OTDgwMjE1NF9FWFBFUklNRU5UQUwg
aXMgbm90IHNldApDT05GSUdfSUVFRTgwMjE1NF9TT0NLRVQ9bQpDT05GSUdfTUFDODAyMTU0PW0K
Q09ORklHX05FVF9TQ0hFRD15CgojCiMgUXVldWVpbmcvU2NoZWR1bGluZwojCkNPTkZJR19ORVRf
U0NIX0NCUT1tCkNPTkZJR19ORVRfU0NIX0hUQj1tCkNPTkZJR19ORVRfU0NIX0hGU0M9bQpDT05G
SUdfTkVUX1NDSF9BVE09bQpDT05GSUdfTkVUX1NDSF9QUklPPW0KQ09ORklHX05FVF9TQ0hfTVVM
VElRPW0KQ09ORklHX05FVF9TQ0hfUkVEPW0KQ09ORklHX05FVF9TQ0hfU0ZCPW0KQ09ORklHX05F
VF9TQ0hfU0ZRPW0KQ09ORklHX05FVF9TQ0hfVEVRTD1tCkNPTkZJR19ORVRfU0NIX1RCRj1tCiMg
Q09ORklHX05FVF9TQ0hfQ0JTIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9FVEYgaXMgbm90
IHNldAojIENPTkZJR19ORVRfU0NIX1RBUFJJTyBpcyBub3Qgc2V0CkNPTkZJR19ORVRfU0NIX0dS
RUQ9bQpDT05GSUdfTkVUX1NDSF9EU01BUks9bQpDT05GSUdfTkVUX1NDSF9ORVRFTT1tCkNPTkZJ
R19ORVRfU0NIX0RSUj1tCkNPTkZJR19ORVRfU0NIX01RUFJJTz1tCiMgQ09ORklHX05FVF9TQ0hf
U0tCUFJJTyBpcyBub3Qgc2V0CkNPTkZJR19ORVRfU0NIX0NIT0tFPW0KQ09ORklHX05FVF9TQ0hf
UUZRPW0KQ09ORklHX05FVF9TQ0hfQ09ERUw9bQpDT05GSUdfTkVUX1NDSF9GUV9DT0RFTD1tCiMg
Q09ORklHX05FVF9TQ0hfQ0FLRSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfRlEgaXMgbm90
IHNldAojIENPTkZJR19ORVRfU0NIX0hIRiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfUElF
IGlzIG5vdCBzZXQKQ09ORklHX05FVF9TQ0hfSU5HUkVTUz1tCkNPTkZJR19ORVRfU0NIX1BMVUc9
bQojIENPTkZJR19ORVRfU0NIX0RFRkFVTFQgaXMgbm90IHNldAoKIwojIENsYXNzaWZpY2F0aW9u
CiMKQ09ORklHX05FVF9DTFM9eQpDT05GSUdfTkVUX0NMU19CQVNJQz1tCkNPTkZJR19ORVRfQ0xT
X1RDSU5ERVg9bQpDT05GSUdfTkVUX0NMU19ST1VURTQ9bQpDT05GSUdfTkVUX0NMU19GVz1tCkNP
TkZJR19ORVRfQ0xTX1UzMj1tCkNPTkZJR19DTFNfVTMyX1BFUkY9eQpDT05GSUdfQ0xTX1UzMl9N
QVJLPXkKQ09ORklHX05FVF9DTFNfUlNWUD1tCkNPTkZJR19ORVRfQ0xTX1JTVlA2PW0KQ09ORklH
X05FVF9DTFNfRkxPVz1tCkNPTkZJR19ORVRfQ0xTX0NHUk9VUD15CkNPTkZJR19ORVRfQ0xTX0JQ
Rj1tCiMgQ09ORklHX05FVF9DTFNfRkxPV0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0NMU19N
QVRDSEFMTCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfRU1BVENIPXkKQ09ORklHX05FVF9FTUFUQ0hf
U1RBQ0s9MzIKQ09ORklHX05FVF9FTUFUQ0hfQ01QPW0KQ09ORklHX05FVF9FTUFUQ0hfTkJZVEU9
bQpDT05GSUdfTkVUX0VNQVRDSF9VMzI9bQpDT05GSUdfTkVUX0VNQVRDSF9NRVRBPW0KQ09ORklH
X05FVF9FTUFUQ0hfVEVYVD1tCiMgQ09ORklHX05FVF9FTUFUQ0hfQ0FOSUQgaXMgbm90IHNldApD
T05GSUdfTkVUX0VNQVRDSF9JUFNFVD1tCiMgQ09ORklHX05FVF9FTUFUQ0hfSVBUIGlzIG5vdCBz
ZXQKQ09ORklHX05FVF9DTFNfQUNUPXkKQ09ORklHX05FVF9BQ1RfUE9MSUNFPW0KQ09ORklHX05F
VF9BQ1RfR0FDVD1tCkNPTkZJR19HQUNUX1BST0I9eQpDT05GSUdfTkVUX0FDVF9NSVJSRUQ9bQoj
IENPTkZJR19ORVRfQUNUX1NBTVBMRSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfQUNUX0lQVD1tCkNP
TkZJR19ORVRfQUNUX05BVD1tCkNPTkZJR19ORVRfQUNUX1BFRElUPW0KQ09ORklHX05FVF9BQ1Rf
U0lNUD1tCkNPTkZJR19ORVRfQUNUX1NLQkVESVQ9bQpDT05GSUdfTkVUX0FDVF9DU1VNPW0KIyBD
T05GSUdfTkVUX0FDVF9WTEFOIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0FDVF9CUEYgaXMgbm90
IHNldAojIENPTkZJR19ORVRfQUNUX0NPTk5NQVJLIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0FD
VF9TS0JNT0QgaXMgbm90IHNldAojIENPTkZJR19ORVRfQUNUX0lGRSBpcyBub3Qgc2V0CiMgQ09O
RklHX05FVF9BQ1RfVFVOTkVMX0tFWSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfQ0xTX0lORD15CkNP
TkZJR19ORVRfU0NIX0ZJRk89eQpDT05GSUdfRENCPXkKQ09ORklHX0ROU19SRVNPTFZFUj1tCiMg
Q09ORklHX0JBVE1BTl9BRFYgaXMgbm90IHNldApDT05GSUdfT1BFTlZTV0lUQ0g9bQpDT05GSUdf
T1BFTlZTV0lUQ0hfR1JFPW0KQ09ORklHX09QRU5WU1dJVENIX1ZYTEFOPW0KQ09ORklHX1ZTT0NL
RVRTPW0KQ09ORklHX1ZTT0NLRVRTX0RJQUc9bQpDT05GSUdfVk1XQVJFX1ZNQ0lfVlNPQ0tFVFM9
bQojIENPTkZJR19WSVJUSU9fVlNPQ0tFVFMgaXMgbm90IHNldAojIENPTkZJR19IWVBFUlZfVlNP
Q0tFVFMgaXMgbm90IHNldApDT05GSUdfTkVUTElOS19ESUFHPW0KQ09ORklHX01QTFM9eQpDT05G
SUdfTkVUX01QTFNfR1NPPW0KQ09ORklHX01QTFNfUk9VVElORz1tCkNPTkZJR19NUExTX0lQVFVO
TkVMPW0KQ09ORklHX05FVF9OU0g9bQojIENPTkZJR19IU1IgaXMgbm90IHNldAojIENPTkZJR19O
RVRfU1dJVENIREVWIGlzIG5vdCBzZXQKQ09ORklHX05FVF9MM19NQVNURVJfREVWPXkKIyBDT05G
SUdfTkVUX05DU0kgaXMgbm90IHNldApDT05GSUdfUlBTPXkKQ09ORklHX1JGU19BQ0NFTD15CkNP
TkZJR19YUFM9eQpDT05GSUdfQ0dST1VQX05FVF9QUklPPXkKQ09ORklHX0NHUk9VUF9ORVRfQ0xB
U1NJRD15CkNPTkZJR19ORVRfUlhfQlVTWV9QT0xMPXkKQ09ORklHX0JRTD15CkNPTkZJR19CUEZf
SklUPXkKQ09ORklHX0JQRl9TVFJFQU1fUEFSU0VSPXkKQ09ORklHX05FVF9GTE9XX0xJTUlUPXkK
CiMKIyBOZXR3b3JrIHRlc3RpbmcKIwpDT05GSUdfTkVUX1BLVEdFTj1tCkNPTkZJR19ORVRfRFJP
UF9NT05JVE9SPXkKIyBlbmQgb2YgTmV0d29yayB0ZXN0aW5nCiMgZW5kIG9mIE5ldHdvcmtpbmcg
b3B0aW9ucwoKIyBDT05GSUdfSEFNUkFESU8gaXMgbm90IHNldApDT05GSUdfQ0FOPW0KQ09ORklH
X0NBTl9SQVc9bQpDT05GSUdfQ0FOX0JDTT1tCkNPTkZJR19DQU5fR1c9bQoKIwojIENBTiBEZXZp
Y2UgRHJpdmVycwojCkNPTkZJR19DQU5fVkNBTj1tCiMgQ09ORklHX0NBTl9WWENBTiBpcyBub3Qg
c2V0CiMgQ09ORklHX0NBTl9TTENBTiBpcyBub3Qgc2V0CkNPTkZJR19DQU5fREVWPW0KQ09ORklH
X0NBTl9DQUxDX0JJVFRJTUlORz15CiMgQ09ORklHX0NBTl9DX0NBTiBpcyBub3Qgc2V0CiMgQ09O
RklHX0NBTl9DQzc3MCBpcyBub3Qgc2V0CiMgQ09ORklHX0NBTl9JRklfQ0FORkQgaXMgbm90IHNl
dAojIENPTkZJR19DQU5fTV9DQU4gaXMgbm90IHNldAojIENPTkZJR19DQU5fUEVBS19QQ0lFRkQg
aXMgbm90IHNldAojIENPTkZJR19DQU5fU0pBMTAwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0NBTl9T
T0ZUSU5HIGlzIG5vdCBzZXQKCiMKIyBDQU4gU1BJIGludGVyZmFjZXMKIwojIENPTkZJR19DQU5f
SEkzMTFYIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FOX01DUDI1MVggaXMgbm90IHNldAojIGVuZCBv
ZiBDQU4gU1BJIGludGVyZmFjZXMKCiMKIyBDQU4gVVNCIGludGVyZmFjZXMKIwojIENPTkZJR19D
QU5fOERFVl9VU0IgaXMgbm90IHNldAojIENPTkZJR19DQU5fRU1TX1VTQiBpcyBub3Qgc2V0CiMg
Q09ORklHX0NBTl9FU0RfVVNCMiBpcyBub3Qgc2V0CiMgQ09ORklHX0NBTl9HU19VU0IgaXMgbm90
IHNldAojIENPTkZJR19DQU5fS1ZBU0VSX1VTQiBpcyBub3Qgc2V0CiMgQ09ORklHX0NBTl9NQ0JB
X1VTQiBpcyBub3Qgc2V0CiMgQ09ORklHX0NBTl9QRUFLX1VTQiBpcyBub3Qgc2V0CiMgQ09ORklH
X0NBTl9VQ0FOIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ0FOIFVTQiBpbnRlcmZhY2VzCgojIENPTkZJ
R19DQU5fREVCVUdfREVWSUNFUyBpcyBub3Qgc2V0CiMgZW5kIG9mIENBTiBEZXZpY2UgRHJpdmVy
cwoKIyBDT05GSUdfQlQgaXMgbm90IHNldAojIENPTkZJR19BRl9SWFJQQyBpcyBub3Qgc2V0CiMg
Q09ORklHX0FGX0tDTSBpcyBub3Qgc2V0CkNPTkZJR19TVFJFQU1fUEFSU0VSPXkKQ09ORklHX0ZJ
Ql9SVUxFUz15CkNPTkZJR19XSVJFTEVTUz15CkNPTkZJR19XSVJFTEVTU19FWFQ9eQpDT05GSUdf
V0VYVF9DT1JFPXkKQ09ORklHX1dFWFRfUFJPQz15CkNPTkZJR19XRVhUX1BSSVY9eQpDT05GSUdf
Q0ZHODAyMTE9bQojIENPTkZJR19OTDgwMjExX1RFU1RNT0RFIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q0ZHODAyMTFfREVWRUxPUEVSX1dBUk5JTkdTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0ZHODAyMTFf
Q0VSVElGSUNBVElPTl9PTlVTIGlzIG5vdCBzZXQKQ09ORklHX0NGRzgwMjExX1JFUVVJUkVfU0lH
TkVEX1JFR0RCPXkKQ09ORklHX0NGRzgwMjExX1VTRV9LRVJORUxfUkVHREJfS0VZUz15CkNPTkZJ
R19DRkc4MDIxMV9ERUZBVUxUX1BTPXkKIyBDT05GSUdfQ0ZHODAyMTFfREVCVUdGUyBpcyBub3Qg
c2V0CkNPTkZJR19DRkc4MDIxMV9DUkRBX1NVUFBPUlQ9eQpDT05GSUdfQ0ZHODAyMTFfV0VYVD15
CkNPTkZJR19MSUI4MDIxMT1tCiMgQ09ORklHX0xJQjgwMjExX0RFQlVHIGlzIG5vdCBzZXQKQ09O
RklHX01BQzgwMjExPW0KQ09ORklHX01BQzgwMjExX0hBU19SQz15CkNPTkZJR19NQUM4MDIxMV9S
Q19NSU5TVFJFTD15CkNPTkZJR19NQUM4MDIxMV9SQ19ERUZBVUxUX01JTlNUUkVMPXkKQ09ORklH
X01BQzgwMjExX1JDX0RFRkFVTFQ9Im1pbnN0cmVsX2h0IgpDT05GSUdfTUFDODAyMTFfTUVTSD15
CkNPTkZJR19NQUM4MDIxMV9MRURTPXkKQ09ORklHX01BQzgwMjExX0RFQlVHRlM9eQojIENPTkZJ
R19NQUM4MDIxMV9NRVNTQUdFX1RSQUNJTkcgaXMgbm90IHNldAojIENPTkZJR19NQUM4MDIxMV9E
RUJVR19NRU5VIGlzIG5vdCBzZXQKQ09ORklHX01BQzgwMjExX1NUQV9IQVNIX01BWF9TSVpFPTAK
IyBDT05GSUdfV0lNQVggaXMgbm90IHNldApDT05GSUdfUkZLSUxMPW0KQ09ORklHX1JGS0lMTF9M
RURTPXkKQ09ORklHX1JGS0lMTF9JTlBVVD15CiMgQ09ORklHX1JGS0lMTF9HUElPIGlzIG5vdCBz
ZXQKQ09ORklHX05FVF85UD15CkNPTkZJR19ORVRfOVBfVklSVElPPXkKIyBDT05GSUdfTkVUXzlQ
X1hFTiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF85UF9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklH
X0NBSUYgaXMgbm90IHNldAojIENPTkZJR19DRVBIX0xJQiBpcyBub3Qgc2V0CiMgQ09ORklHX05G
QyBpcyBub3Qgc2V0CiMgQ09ORklHX1BTQU1QTEUgaXMgbm90IHNldAojIENPTkZJR19ORVRfSUZF
IGlzIG5vdCBzZXQKQ09ORklHX0xXVFVOTkVMPXkKQ09ORklHX0xXVFVOTkVMX0JQRj15CkNPTkZJ
R19EU1RfQ0FDSEU9eQpDT05GSUdfR1JPX0NFTExTPXkKQ09ORklHX05FVF9TT0NLX01TRz15CkNP
TkZJR19ORVRfREVWTElOSz15CkNPTkZJR19GQUlMT1ZFUj15CkNPTkZJR19IQVZFX0VCUEZfSklU
PXkKCiMKIyBEZXZpY2UgRHJpdmVycwojCkNPTkZJR19IQVZFX0VJU0E9eQojIENPTkZJR19FSVNB
IGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfUENJPXkKQ09ORklHX1BDST15CkNPTkZJR19QQ0lfRE9N
QUlOUz15CkNPTkZJR19QQ0lFUE9SVEJVUz15CkNPTkZJR19IT1RQTFVHX1BDSV9QQ0lFPXkKQ09O
RklHX1BDSUVBRVI9eQpDT05GSUdfUENJRUFFUl9JTkpFQ1Q9bQpDT05GSUdfUENJRV9FQ1JDPXkK
Q09ORklHX1BDSUVBU1BNPXkKIyBDT05GSUdfUENJRUFTUE1fREVCVUcgaXMgbm90IHNldApDT05G
SUdfUENJRUFTUE1fREVGQVVMVD15CiMgQ09ORklHX1BDSUVBU1BNX1BPV0VSU0FWRSBpcyBub3Qg
c2V0CiMgQ09ORklHX1BDSUVBU1BNX1BPV0VSX1NVUEVSU0FWRSBpcyBub3Qgc2V0CiMgQ09ORklH
X1BDSUVBU1BNX1BFUkZPUk1BTkNFIGlzIG5vdCBzZXQKQ09ORklHX1BDSUVfUE1FPXkKIyBDT05G
SUdfUENJRV9EUEMgaXMgbm90IHNldAojIENPTkZJR19QQ0lFX1BUTSBpcyBub3Qgc2V0CiMgQ09O
RklHX1BDSUVfQlcgaXMgbm90IHNldApDT05GSUdfUENJX01TST15CkNPTkZJR19QQ0lfTVNJX0lS
UV9ET01BSU49eQpDT05GSUdfUENJX1FVSVJLUz15CiMgQ09ORklHX1BDSV9ERUJVRyBpcyBub3Qg
c2V0CiMgQ09ORklHX1BDSV9SRUFMTE9DX0VOQUJMRV9BVVRPIGlzIG5vdCBzZXQKQ09ORklHX1BD
SV9TVFVCPXkKIyBDT05GSUdfUENJX1BGX1NUVUIgaXMgbm90IHNldAojIENPTkZJR19YRU5fUENJ
REVWX0ZST05URU5EIGlzIG5vdCBzZXQKQ09ORklHX1BDSV9BVFM9eQpDT05GSUdfUENJX0xPQ0tM
RVNTX0NPTkZJRz15CkNPTkZJR19QQ0lfSU9WPXkKQ09ORklHX1BDSV9QUkk9eQpDT05GSUdfUENJ
X1BBU0lEPXkKIyBDT05GSUdfUENJX1AyUERNQSBpcyBub3Qgc2V0CkNPTkZJR19QQ0lfTEFCRUw9
eQojIENPTkZJR19QQ0lfSFlQRVJWIGlzIG5vdCBzZXQKQ09ORklHX0hPVFBMVUdfUENJPXkKQ09O
RklHX0hPVFBMVUdfUENJX0FDUEk9eQpDT05GSUdfSE9UUExVR19QQ0lfQUNQSV9JQk09bQojIENP
TkZJR19IT1RQTFVHX1BDSV9DUENJIGlzIG5vdCBzZXQKIyBDT05GSUdfSE9UUExVR19QQ0lfU0hQ
QyBpcyBub3Qgc2V0CgojCiMgUENJIGNvbnRyb2xsZXIgZHJpdmVycwojCgojCiMgQ2FkZW5jZSBQ
Q0llIGNvbnRyb2xsZXJzIHN1cHBvcnQKIwojIGVuZCBvZiBDYWRlbmNlIFBDSWUgY29udHJvbGxl
cnMgc3VwcG9ydAoKIyBDT05GSUdfVk1EIGlzIG5vdCBzZXQKCiMKIyBEZXNpZ25XYXJlIFBDSSBD
b3JlIFN1cHBvcnQKIwojIENPTkZJR19QQ0lFX0RXX1BMQVRfSE9TVCBpcyBub3Qgc2V0CiMgQ09O
RklHX1BDSV9NRVNPTiBpcyBub3Qgc2V0CiMgZW5kIG9mIERlc2lnbldhcmUgUENJIENvcmUgU3Vw
cG9ydAojIGVuZCBvZiBQQ0kgY29udHJvbGxlciBkcml2ZXJzCgojCiMgUENJIEVuZHBvaW50CiMK
IyBDT05GSUdfUENJX0VORFBPSU5UIGlzIG5vdCBzZXQKIyBlbmQgb2YgUENJIEVuZHBvaW50Cgoj
CiMgUENJIHN3aXRjaCBjb250cm9sbGVyIGRyaXZlcnMKIwojIENPTkZJR19QQ0lfU1dfU1dJVENI
VEVDIGlzIG5vdCBzZXQKIyBlbmQgb2YgUENJIHN3aXRjaCBjb250cm9sbGVyIGRyaXZlcnMKCkNP
TkZJR19QQ0NBUkQ9eQojIENPTkZJR19QQ01DSUEgaXMgbm90IHNldApDT05GSUdfQ0FSREJVUz15
CgojCiMgUEMtY2FyZCBicmlkZ2VzCiMKQ09ORklHX1lFTlRBPW0KQ09ORklHX1lFTlRBX08yPXkK
Q09ORklHX1lFTlRBX1JJQ09IPXkKQ09ORklHX1lFTlRBX1RJPXkKQ09ORklHX1lFTlRBX0VORV9U
VU5FPXkKQ09ORklHX1lFTlRBX1RPU0hJQkE9eQojIENPTkZJR19SQVBJRElPIGlzIG5vdCBzZXQK
CiMKIyBHZW5lcmljIERyaXZlciBPcHRpb25zCiMKQ09ORklHX1VFVkVOVF9IRUxQRVI9eQpDT05G
SUdfVUVWRU5UX0hFTFBFUl9QQVRIPSIiCkNPTkZJR19ERVZUTVBGUz15CkNPTkZJR19ERVZUTVBG
U19NT1VOVD15CkNPTkZJR19TVEFOREFMT05FPXkKQ09ORklHX1BSRVZFTlRfRklSTVdBUkVfQlVJ
TEQ9eQoKIwojIEZpcm13YXJlIGxvYWRlcgojCkNPTkZJR19GV19MT0FERVI9eQpDT05GSUdfRVhU
UkFfRklSTVdBUkU9IiIKQ09ORklHX0ZXX0xPQURFUl9VU0VSX0hFTFBFUj15CkNPTkZJR19GV19M
T0FERVJfVVNFUl9IRUxQRVJfRkFMTEJBQ0s9eQojIGVuZCBvZiBGaXJtd2FyZSBsb2FkZXIKCkNP
TkZJR19BTExPV19ERVZfQ09SRURVTVA9eQojIENPTkZJR19ERUJVR19EUklWRVIgaXMgbm90IHNl
dAojIENPTkZJR19ERUJVR19ERVZSRVMgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19URVNUX0RS
SVZFUl9SRU1PVkUgaXMgbm90IHNldAojIENPTkZJR19URVNUX0FTWU5DX0RSSVZFUl9QUk9CRSBp
cyBub3Qgc2V0CkNPTkZJR19TWVNfSFlQRVJWSVNPUj15CkNPTkZJR19HRU5FUklDX0NQVV9BVVRP
UFJPQkU9eQpDT05GSUdfR0VORVJJQ19DUFVfVlVMTkVSQUJJTElUSUVTPXkKQ09ORklHX1JFR01B
UD15CkNPTkZJR19SRUdNQVBfSTJDPXkKQ09ORklHX1JFR01BUF9TUEk9eQpDT05GSUdfRE1BX1NI
QVJFRF9CVUZGRVI9eQojIENPTkZJR19ETUFfRkVOQ0VfVFJBQ0UgaXMgbm90IHNldAojIGVuZCBv
ZiBHZW5lcmljIERyaXZlciBPcHRpb25zCgojCiMgQnVzIGRldmljZXMKIwojIGVuZCBvZiBCdXMg
ZGV2aWNlcwoKQ09ORklHX0NPTk5FQ1RPUj15CkNPTkZJR19QUk9DX0VWRU5UUz15CiMgQ09ORklH
X0dOU1MgaXMgbm90IHNldApDT05GSUdfTVREPW0KIyBDT05GSUdfTVREX1RFU1RTIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTVREX0NNRExJTkVfUEFSVFMgaXMgbm90IHNldAojIENPTkZJR19NVERfQVI3
X1BBUlRTIGlzIG5vdCBzZXQKCiMKIyBQYXJ0aXRpb24gcGFyc2VycwojCiMgQ09ORklHX01URF9S
RURCT09UX1BBUlRTIGlzIG5vdCBzZXQKIyBlbmQgb2YgUGFydGl0aW9uIHBhcnNlcnMKCiMKIyBV
c2VyIE1vZHVsZXMgQW5kIFRyYW5zbGF0aW9uIExheWVycwojCkNPTkZJR19NVERfQkxLREVWUz1t
CkNPTkZJR19NVERfQkxPQ0s9bQojIENPTkZJR19NVERfQkxPQ0tfUk8gaXMgbm90IHNldAojIENP
TkZJR19GVEwgaXMgbm90IHNldAojIENPTkZJR19ORlRMIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5G
VEwgaXMgbm90IHNldAojIENPTkZJR19SRkRfRlRMIGlzIG5vdCBzZXQKIyBDT05GSUdfU1NGREMg
aXMgbm90IHNldAojIENPTkZJR19TTV9GVEwgaXMgbm90IHNldAojIENPTkZJR19NVERfT09QUyBp
cyBub3Qgc2V0CiMgQ09ORklHX01URF9TV0FQIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX1BBUlRJ
VElPTkVEX01BU1RFUiBpcyBub3Qgc2V0CgojCiMgUkFNL1JPTS9GbGFzaCBjaGlwIGRyaXZlcnMK
IwojIENPTkZJR19NVERfQ0ZJIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX0pFREVDUFJPQkUgaXMg
bm90IHNldApDT05GSUdfTVREX01BUF9CQU5LX1dJRFRIXzE9eQpDT05GSUdfTVREX01BUF9CQU5L
X1dJRFRIXzI9eQpDT05GSUdfTVREX01BUF9CQU5LX1dJRFRIXzQ9eQpDT05GSUdfTVREX0NGSV9J
MT15CkNPTkZJR19NVERfQ0ZJX0kyPXkKIyBDT05GSUdfTVREX1JBTSBpcyBub3Qgc2V0CiMgQ09O
RklHX01URF9ST00gaXMgbm90IHNldAojIENPTkZJR19NVERfQUJTRU5UIGlzIG5vdCBzZXQKIyBl
bmQgb2YgUkFNL1JPTS9GbGFzaCBjaGlwIGRyaXZlcnMKCiMKIyBNYXBwaW5nIGRyaXZlcnMgZm9y
IGNoaXAgYWNjZXNzCiMKIyBDT05GSUdfTVREX0NPTVBMRVhfTUFQUElOR1MgaXMgbm90IHNldAoj
IENPTkZJR19NVERfSU5URUxfVlJfTk9SIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX1BMQVRSQU0g
aXMgbm90IHNldAojIGVuZCBvZiBNYXBwaW5nIGRyaXZlcnMgZm9yIGNoaXAgYWNjZXNzCgojCiMg
U2VsZi1jb250YWluZWQgTVREIGRldmljZSBkcml2ZXJzCiMKIyBDT05GSUdfTVREX1BNQzU1MSBp
cyBub3Qgc2V0CiMgQ09ORklHX01URF9EQVRBRkxBU0ggaXMgbm90IHNldAojIENPTkZJR19NVERf
TUNIUDIzSzI1NiBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9TU1QyNUwgaXMgbm90IHNldAojIENP
TkZJR19NVERfU0xSQU0gaXMgbm90IHNldAojIENPTkZJR19NVERfUEhSQU0gaXMgbm90IHNldAoj
IENPTkZJR19NVERfTVREUkFNIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX0JMT0NLMk1URCBpcyBu
b3Qgc2V0CgojCiMgRGlzay1Pbi1DaGlwIERldmljZSBEcml2ZXJzCiMKIyBDT05GSUdfTVREX0RP
Q0czIGlzIG5vdCBzZXQKIyBlbmQgb2YgU2VsZi1jb250YWluZWQgTVREIGRldmljZSBkcml2ZXJz
CgojIENPTkZJR19NVERfT05FTkFORCBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9SQVdfTkFORCBp
cyBub3Qgc2V0CiMgQ09ORklHX01URF9TUElfTkFORCBpcyBub3Qgc2V0CgojCiMgTFBERFIgJiBM
UEREUjIgUENNIG1lbW9yeSBkcml2ZXJzCiMKIyBDT05GSUdfTVREX0xQRERSIGlzIG5vdCBzZXQK
IyBlbmQgb2YgTFBERFIgJiBMUEREUjIgUENNIG1lbW9yeSBkcml2ZXJzCgojIENPTkZJR19NVERf
U1BJX05PUiBpcyBub3Qgc2V0CkNPTkZJR19NVERfVUJJPW0KQ09ORklHX01URF9VQklfV0xfVEhS
RVNIT0xEPTQwOTYKQ09ORklHX01URF9VQklfQkVCX0xJTUlUPTIwCiMgQ09ORklHX01URF9VQklf
RkFTVE1BUCBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9VQklfR0xVRUJJIGlzIG5vdCBzZXQKIyBD
T05GSUdfTVREX1VCSV9CTE9DSyBpcyBub3Qgc2V0CiMgQ09ORklHX09GIGlzIG5vdCBzZXQKQ09O
RklHX0FSQ0hfTUlHSFRfSEFWRV9QQ19QQVJQT1JUPXkKQ09ORklHX1BBUlBPUlQ9bQpDT05GSUdf
UEFSUE9SVF9QQz1tCkNPTkZJR19QQVJQT1JUX1NFUklBTD1tCiMgQ09ORklHX1BBUlBPUlRfUENf
RklGTyBpcyBub3Qgc2V0CiMgQ09ORklHX1BBUlBPUlRfUENfU1VQRVJJTyBpcyBub3Qgc2V0CiMg
Q09ORklHX1BBUlBPUlRfQVg4ODc5NiBpcyBub3Qgc2V0CkNPTkZJR19QQVJQT1JUXzEyODQ9eQpD
T05GSUdfUEFSUE9SVF9OT1RfUEM9eQpDT05GSUdfUE5QPXkKIyBDT05GSUdfUE5QX0RFQlVHX01F
U1NBR0VTIGlzIG5vdCBzZXQKCiMKIyBQcm90b2NvbHMKIwpDT05GSUdfUE5QQUNQST15CkNPTkZJ
R19CTEtfREVWPXkKQ09ORklHX0JMS19ERVZfTlVMTF9CTEs9bQpDT05GSUdfQkxLX0RFVl9OVUxM
X0JMS19GQVVMVF9JTkpFQ1RJT049eQpDT05GSUdfQkxLX0RFVl9GRD1tCkNPTkZJR19DRFJPTT1t
CiMgQ09ORklHX1BBUklERSBpcyBub3Qgc2V0CkNPTkZJR19CTEtfREVWX1BDSUVTU0RfTVRJUDMy
WFg9bQojIENPTkZJR19aUkFNIGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX0RFVl9VTUVNIGlzIG5v
dCBzZXQKQ09ORklHX0JMS19ERVZfTE9PUD1tCkNPTkZJR19CTEtfREVWX0xPT1BfTUlOX0NPVU5U
PTAKIyBDT05GSUdfQkxLX0RFVl9DUllQVE9MT09QIGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX0RF
Vl9EUkJEIGlzIG5vdCBzZXQKQ09ORklHX0JMS19ERVZfTkJEPW0KIyBDT05GSUdfQkxLX0RFVl9T
S0QgaXMgbm90IHNldApDT05GSUdfQkxLX0RFVl9TWDg9bQpDT05GSUdfQkxLX0RFVl9SQU09bQpD
T05GSUdfQkxLX0RFVl9SQU1fQ09VTlQ9MTYKQ09ORklHX0JMS19ERVZfUkFNX1NJWkU9MTYzODQK
Q09ORklHX0NEUk9NX1BLVENEVkQ9bQpDT05GSUdfQ0RST01fUEtUQ0RWRF9CVUZGRVJTPTgKIyBD
T05GSUdfQ0RST01fUEtUQ0RWRF9XQ0FDSEUgaXMgbm90IHNldApDT05GSUdfQVRBX09WRVJfRVRI
PW0KQ09ORklHX1hFTl9CTEtERVZfRlJPTlRFTkQ9bQojIENPTkZJR19YRU5fQkxLREVWX0JBQ0tF
TkQgaXMgbm90IHNldApDT05GSUdfVklSVElPX0JMSz15CiMgQ09ORklHX1ZJUlRJT19CTEtfU0NT
SSBpcyBub3Qgc2V0CiMgQ09ORklHX0JMS19ERVZfUkJEIGlzIG5vdCBzZXQKQ09ORklHX0JMS19E
RVZfUlNYWD1tCgojCiMgTlZNRSBTdXBwb3J0CiMKQ09ORklHX05WTUVfQ09SRT1tCkNPTkZJR19C
TEtfREVWX05WTUU9bQpDT05GSUdfTlZNRV9NVUxUSVBBVEg9eQpDT05GSUdfTlZNRV9GQUJSSUNT
PW0KIyBDT05GSUdfTlZNRV9GQyBpcyBub3Qgc2V0CiMgQ09ORklHX05WTUVfVENQIGlzIG5vdCBz
ZXQKQ09ORklHX05WTUVfVEFSR0VUPW0KQ09ORklHX05WTUVfVEFSR0VUX0xPT1A9bQojIENPTkZJ
R19OVk1FX1RBUkdFVF9GQyBpcyBub3Qgc2V0CiMgQ09ORklHX05WTUVfVEFSR0VUX1RDUCBpcyBu
b3Qgc2V0CiMgZW5kIG9mIE5WTUUgU3VwcG9ydAoKIwojIE1pc2MgZGV2aWNlcwojCkNPTkZJR19T
RU5TT1JTX0xJUzNMVjAyRD1tCiMgQ09ORklHX0FENTI1WF9EUE9UIGlzIG5vdCBzZXQKIyBDT05G
SUdfRFVNTVlfSVJRIGlzIG5vdCBzZXQKIyBDT05GSUdfSUJNX0FTTSBpcyBub3Qgc2V0CiMgQ09O
RklHX1BIQU5UT00gaXMgbm90IHNldApDT05GSUdfU0dJX0lPQzQ9bQpDT05GSUdfVElGTV9DT1JF
PW0KQ09ORklHX1RJRk1fN1hYMT1tCiMgQ09ORklHX0lDUzkzMlM0MDEgaXMgbm90IHNldApDT05G
SUdfRU5DTE9TVVJFX1NFUlZJQ0VTPW0KQ09ORklHX1NHSV9YUD1tCkNPTkZJR19IUF9JTE89bQpD
T05GSUdfU0dJX0dSVT1tCiMgQ09ORklHX1NHSV9HUlVfREVCVUcgaXMgbm90IHNldApDT05GSUdf
QVBEUzk4MDJBTFM9bQpDT05GSUdfSVNMMjkwMDM9bQpDT05GSUdfSVNMMjkwMjA9bQpDT05GSUdf
U0VOU09SU19UU0wyNTUwPW0KQ09ORklHX1NFTlNPUlNfQkgxNzcwPW0KQ09ORklHX1NFTlNPUlNf
QVBEUzk5MFg9bQojIENPTkZJR19ITUM2MzUyIGlzIG5vdCBzZXQKIyBDT05GSUdfRFMxNjgyIGlz
IG5vdCBzZXQKQ09ORklHX1ZNV0FSRV9CQUxMT09OPW0KIyBDT05GSUdfVVNCX1NXSVRDSF9GU0E5
NDgwIGlzIG5vdCBzZXQKIyBDT05GSUdfTEFUVElDRV9FQ1AzX0NPTkZJRyBpcyBub3Qgc2V0CiMg
Q09ORklHX1NSQU0gaXMgbm90IHNldAojIENPTkZJR19QQ0lfRU5EUE9JTlRfVEVTVCBpcyBub3Qg
c2V0CkNPTkZJR19QVlBBTklDPXkKIyBDT05GSUdfQzJQT1JUIGlzIG5vdCBzZXQKCiMKIyBFRVBS
T00gc3VwcG9ydAojCkNPTkZJR19FRVBST01fQVQyND1tCiMgQ09ORklHX0VFUFJPTV9BVDI1IGlz
IG5vdCBzZXQKQ09ORklHX0VFUFJPTV9MRUdBQ1k9bQpDT05GSUdfRUVQUk9NX01BWDY4NzU9bQpD
T05GSUdfRUVQUk9NXzkzQ1g2PW0KIyBDT05GSUdfRUVQUk9NXzkzWFg0NiBpcyBub3Qgc2V0CiMg
Q09ORklHX0VFUFJPTV9JRFRfODlIUEVTWCBpcyBub3Qgc2V0CiMgQ09ORklHX0VFUFJPTV9FRTEw
MDQgaXMgbm90IHNldAojIGVuZCBvZiBFRVBST00gc3VwcG9ydAoKQ09ORklHX0NCNzEwX0NPUkU9
bQojIENPTkZJR19DQjcxMF9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19DQjcxMF9ERUJVR19BU1NV
TVBUSU9OUz15CgojCiMgVGV4YXMgSW5zdHJ1bWVudHMgc2hhcmVkIHRyYW5zcG9ydCBsaW5lIGRp
c2NpcGxpbmUKIwojIENPTkZJR19USV9TVCBpcyBub3Qgc2V0CiMgZW5kIG9mIFRleGFzIEluc3Ry
dW1lbnRzIHNoYXJlZCB0cmFuc3BvcnQgbGluZSBkaXNjaXBsaW5lCgpDT05GSUdfU0VOU09SU19M
SVMzX0kyQz1tCkNPTkZJR19BTFRFUkFfU1RBUEw9bQpDT05GSUdfSU5URUxfTUVJPXkKQ09ORklH
X0lOVEVMX01FSV9NRT15CiMgQ09ORklHX0lOVEVMX01FSV9UWEUgaXMgbm90IHNldAojIENPTkZJ
R19JTlRFTF9NRUlfSERDUCBpcyBub3Qgc2V0CkNPTkZJR19WTVdBUkVfVk1DST1tCgojCiMgSW50
ZWwgTUlDICYgcmVsYXRlZCBzdXBwb3J0CiMKCiMKIyBJbnRlbCBNSUMgQnVzIERyaXZlcgojCiMg
Q09ORklHX0lOVEVMX01JQ19CVVMgaXMgbm90IHNldAoKIwojIFNDSUYgQnVzIERyaXZlcgojCiMg
Q09ORklHX1NDSUZfQlVTIGlzIG5vdCBzZXQKCiMKIyBWT1AgQnVzIERyaXZlcgojCiMgQ09ORklH
X1ZPUF9CVVMgaXMgbm90IHNldAoKIwojIEludGVsIE1JQyBIb3N0IERyaXZlcgojCgojCiMgSW50
ZWwgTUlDIENhcmQgRHJpdmVyCiMKCiMKIyBTQ0lGIERyaXZlcgojCgojCiMgSW50ZWwgTUlDIENv
cHJvY2Vzc29yIFN0YXRlIE1hbmFnZW1lbnQgKENPU00pIERyaXZlcnMKIwoKIwojIFZPUCBEcml2
ZXIKIwojIGVuZCBvZiBJbnRlbCBNSUMgJiByZWxhdGVkIHN1cHBvcnQKCiMgQ09ORklHX0dFTldR
RSBpcyBub3Qgc2V0CiMgQ09ORklHX0VDSE8gaXMgbm90IHNldAojIENPTkZJR19NSVNDX0FMQ09S
X1BDSSBpcyBub3Qgc2V0CiMgQ09ORklHX01JU0NfUlRTWF9QQ0kgaXMgbm90IHNldAojIENPTkZJ
R19NSVNDX1JUU1hfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfSEFCQU5BX0FJIGlzIG5vdCBzZXQK
IyBlbmQgb2YgTWlzYyBkZXZpY2VzCgpDT05GSUdfSEFWRV9JREU9eQojIENPTkZJR19JREUgaXMg
bm90IHNldAoKIwojIFNDU0kgZGV2aWNlIHN1cHBvcnQKIwpDT05GSUdfU0NTSV9NT0Q9eQpDT05G
SUdfUkFJRF9BVFRSUz1tCkNPTkZJR19TQ1NJPXkKQ09ORklHX1NDU0lfRE1BPXkKQ09ORklHX1ND
U0lfTkVUTElOSz15CkNPTkZJR19TQ1NJX1BST0NfRlM9eQoKIwojIFNDU0kgc3VwcG9ydCB0eXBl
IChkaXNrLCB0YXBlLCBDRC1ST00pCiMKQ09ORklHX0JMS19ERVZfU0Q9bQpDT05GSUdfQ0hSX0RF
Vl9TVD1tCkNPTkZJR19DSFJfREVWX09TU1Q9bQpDT05GSUdfQkxLX0RFVl9TUj1tCkNPTkZJR19C
TEtfREVWX1NSX1ZFTkRPUj15CkNPTkZJR19DSFJfREVWX1NHPW0KQ09ORklHX0NIUl9ERVZfU0NI
PW0KQ09ORklHX1NDU0lfRU5DTE9TVVJFPW0KQ09ORklHX1NDU0lfQ09OU1RBTlRTPXkKQ09ORklH
X1NDU0lfTE9HR0lORz15CkNPTkZJR19TQ1NJX1NDQU5fQVNZTkM9eQoKIwojIFNDU0kgVHJhbnNw
b3J0cwojCkNPTkZJR19TQ1NJX1NQSV9BVFRSUz1tCkNPTkZJR19TQ1NJX0ZDX0FUVFJTPW0KQ09O
RklHX1NDU0lfSVNDU0lfQVRUUlM9bQpDT05GSUdfU0NTSV9TQVNfQVRUUlM9bQpDT05GSUdfU0NT
SV9TQVNfTElCU0FTPW0KQ09ORklHX1NDU0lfU0FTX0FUQT15CkNPTkZJR19TQ1NJX1NBU19IT1NU
X1NNUD15CkNPTkZJR19TQ1NJX1NSUF9BVFRSUz1tCiMgZW5kIG9mIFNDU0kgVHJhbnNwb3J0cwoK
Q09ORklHX1NDU0lfTE9XTEVWRUw9eQpDT05GSUdfSVNDU0lfVENQPW0KQ09ORklHX0lTQ1NJX0JP
T1RfU1lTRlM9bQpDT05GSUdfU0NTSV9DWEdCM19JU0NTST1tCkNPTkZJR19TQ1NJX0NYR0I0X0lT
Q1NJPW0KQ09ORklHX1NDU0lfQk5YMl9JU0NTST1tCkNPTkZJR19TQ1NJX0JOWDJYX0ZDT0U9bQpD
T05GSUdfQkUySVNDU0k9bQojIENPTkZJR19CTEtfREVWXzNXX1hYWFhfUkFJRCBpcyBub3Qgc2V0
CkNPTkZJR19TQ1NJX0hQU0E9bQpDT05GSUdfU0NTSV8zV185WFhYPW0KQ09ORklHX1NDU0lfM1df
U0FTPW0KIyBDT05GSUdfU0NTSV9BQ0FSRCBpcyBub3Qgc2V0CkNPTkZJR19TQ1NJX0FBQ1JBSUQ9
bQojIENPTkZJR19TQ1NJX0FJQzdYWFggaXMgbm90IHNldApDT05GSUdfU0NTSV9BSUM3OVhYPW0K
Q09ORklHX0FJQzc5WFhfQ01EU19QRVJfREVWSUNFPTQKQ09ORklHX0FJQzc5WFhfUkVTRVRfREVM
QVlfTVM9MTUwMDAKIyBDT05GSUdfQUlDNzlYWF9ERUJVR19FTkFCTEUgaXMgbm90IHNldApDT05G
SUdfQUlDNzlYWF9ERUJVR19NQVNLPTAKIyBDT05GSUdfQUlDNzlYWF9SRUdfUFJFVFRZX1BSSU5U
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9BSUM5NFhYIGlzIG5vdCBzZXQKQ09ORklHX1NDU0lf
TVZTQVM9bQojIENPTkZJR19TQ1NJX01WU0FTX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX1NDU0lf
TVZTQVNfVEFTS0xFVD15CkNPTkZJR19TQ1NJX01WVU1JPW0KIyBDT05GSUdfU0NTSV9EUFRfSTJP
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9BRFZBTlNZUyBpcyBub3Qgc2V0CkNPTkZJR19TQ1NJ
X0FSQ01TUj1tCiMgQ09ORklHX1NDU0lfRVNBUzJSIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVHQVJB
SURfTkVXR0VOIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVHQVJBSURfTEVHQUNZIGlzIG5vdCBzZXQK
Q09ORklHX01FR0FSQUlEX1NBUz1tCkNPTkZJR19TQ1NJX01QVDNTQVM9bQpDT05GSUdfU0NTSV9N
UFQyU0FTX01BWF9TR0U9MTI4CkNPTkZJR19TQ1NJX01QVDNTQVNfTUFYX1NHRT0xMjgKQ09ORklH
X1NDU0lfTVBUMlNBUz1tCiMgQ09ORklHX1NDU0lfU01BUlRQUUkgaXMgbm90IHNldApDT05GSUdf
U0NTSV9VRlNIQ0Q9bQpDT05GSUdfU0NTSV9VRlNIQ0RfUENJPW0KIyBDT05GSUdfU0NTSV9VRlNf
RFdDX1RDX1BDSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfVUZTSENEX1BMQVRGT1JNIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0NTSV9VRlNfQlNHIGlzIG5vdCBzZXQKQ09ORklHX1NDU0lfSFBUSU9Q
PW0KIyBDT05GSUdfU0NTSV9CVVNMT0dJQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfTVlSQiBp
cyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfTVlSUyBpcyBub3Qgc2V0CkNPTkZJR19WTVdBUkVfUFZT
Q1NJPW0KIyBDT05GSUdfWEVOX1NDU0lfRlJPTlRFTkQgaXMgbm90IHNldApDT05GSUdfSFlQRVJW
X1NUT1JBR0U9bQpDT05GSUdfTElCRkM9bQpDT05GSUdfTElCRkNPRT1tCkNPTkZJR19GQ09FPW0K
Q09ORklHX0ZDT0VfRk5JQz1tCiMgQ09ORklHX1NDU0lfU05JQyBpcyBub3Qgc2V0CiMgQ09ORklH
X1NDU0lfRE1YMzE5MUQgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0dEVEggaXMgbm90IHNldApD
T05GSUdfU0NTSV9JU0NJPW0KIyBDT05GSUdfU0NTSV9JUFMgaXMgbm90IHNldApDT05GSUdfU0NT
SV9JTklUSU89bQojIENPTkZJR19TQ1NJX0lOSUExMDAgaXMgbm90IHNldAojIENPTkZJR19TQ1NJ
X1BQQSBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfSU1NIGlzIG5vdCBzZXQKQ09ORklHX1NDU0lf
U1RFWD1tCiMgQ09ORklHX1NDU0lfU1lNNTNDOFhYXzIgaXMgbm90IHNldApDT05GSUdfU0NTSV9J
UFI9bQpDT05GSUdfU0NTSV9JUFJfVFJBQ0U9eQpDT05GSUdfU0NTSV9JUFJfRFVNUD15CiMgQ09O
RklHX1NDU0lfUUxPR0lDXzEyODAgaXMgbm90IHNldApDT05GSUdfU0NTSV9RTEFfRkM9bQojIENP
TkZJR19UQ01fUUxBMlhYWCBpcyBub3Qgc2V0CkNPTkZJR19TQ1NJX1FMQV9JU0NTST1tCiMgQ09O
RklHX1NDU0lfTFBGQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfREMzOTV4IGlzIG5vdCBzZXQK
IyBDT05GSUdfU0NTSV9BTTUzQzk3NCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfV0Q3MTlYIGlz
IG5vdCBzZXQKQ09ORklHX1NDU0lfREVCVUc9bQpDT05GSUdfU0NTSV9QTUNSQUlEPW0KQ09ORklH
X1NDU0lfUE04MDAxPW0KIyBDT05GSUdfU0NTSV9CRkFfRkMgaXMgbm90IHNldApDT05GSUdfU0NT
SV9WSVJUSU89bQpDT05GSUdfU0NTSV9DSEVMU0lPX0ZDT0U9bQpDT05GSUdfU0NTSV9ESD15CkNP
TkZJR19TQ1NJX0RIX1JEQUM9eQpDT05GSUdfU0NTSV9ESF9IUF9TVz15CkNPTkZJR19TQ1NJX0RI
X0VNQz15CkNPTkZJR19TQ1NJX0RIX0FMVUE9eQojIGVuZCBvZiBTQ1NJIGRldmljZSBzdXBwb3J0
CgpDT05GSUdfQVRBPW0KQ09ORklHX0FUQV9WRVJCT1NFX0VSUk9SPXkKQ09ORklHX0FUQV9BQ1BJ
PXkKIyBDT05GSUdfU0FUQV9aUE9ERCBpcyBub3Qgc2V0CkNPTkZJR19TQVRBX1BNUD15CgojCiMg
Q29udHJvbGxlcnMgd2l0aCBub24tU0ZGIG5hdGl2ZSBpbnRlcmZhY2UKIwpDT05GSUdfU0FUQV9B
SENJPW0KQ09ORklHX1NBVEFfTU9CSUxFX0xQTV9QT0xJQ1k9MApDT05GSUdfU0FUQV9BSENJX1BM
QVRGT1JNPW0KIyBDT05GSUdfU0FUQV9JTklDMTYyWCBpcyBub3Qgc2V0CkNPTkZJR19TQVRBX0FD
QVJEX0FIQ0k9bQpDT05GSUdfU0FUQV9TSUwyND1tCkNPTkZJR19BVEFfU0ZGPXkKCiMKIyBTRkYg
Y29udHJvbGxlcnMgd2l0aCBjdXN0b20gRE1BIGludGVyZmFjZQojCkNPTkZJR19QRENfQURNQT1t
CkNPTkZJR19TQVRBX1FTVE9SPW0KQ09ORklHX1NBVEFfU1g0PW0KQ09ORklHX0FUQV9CTURNQT15
CgojCiMgU0FUQSBTRkYgY29udHJvbGxlcnMgd2l0aCBCTURNQQojCkNPTkZJR19BVEFfUElJWD1t
CiMgQ09ORklHX1NBVEFfRFdDIGlzIG5vdCBzZXQKQ09ORklHX1NBVEFfTVY9bQpDT05GSUdfU0FU
QV9OVj1tCkNPTkZJR19TQVRBX1BST01JU0U9bQpDT05GSUdfU0FUQV9TSUw9bQpDT05GSUdfU0FU
QV9TSVM9bQpDT05GSUdfU0FUQV9TVlc9bQpDT05GSUdfU0FUQV9VTEk9bQpDT05GSUdfU0FUQV9W
SUE9bQpDT05GSUdfU0FUQV9WSVRFU1NFPW0KCiMKIyBQQVRBIFNGRiBjb250cm9sbGVycyB3aXRo
IEJNRE1BCiMKQ09ORklHX1BBVEFfQUxJPW0KQ09ORklHX1BBVEFfQU1EPW0KQ09ORklHX1BBVEFf
QVJUT1A9bQpDT05GSUdfUEFUQV9BVElJWFA9bQpDT05GSUdfUEFUQV9BVFA4NjdYPW0KQ09ORklH
X1BBVEFfQ01ENjRYPW0KIyBDT05GSUdfUEFUQV9DWVBSRVNTIGlzIG5vdCBzZXQKIyBDT05GSUdf
UEFUQV9FRkFSIGlzIG5vdCBzZXQKQ09ORklHX1BBVEFfSFBUMzY2PW0KQ09ORklHX1BBVEFfSFBU
MzdYPW0KQ09ORklHX1BBVEFfSFBUM1gyTj1tCkNPTkZJR19QQVRBX0hQVDNYMz1tCiMgQ09ORklH
X1BBVEFfSFBUM1gzX0RNQSBpcyBub3Qgc2V0CkNPTkZJR19QQVRBX0lUODIxMz1tCkNPTkZJR19Q
QVRBX0lUODIxWD1tCkNPTkZJR19QQVRBX0pNSUNST049bQpDT05GSUdfUEFUQV9NQVJWRUxMPW0K
Q09ORklHX1BBVEFfTkVUQ0VMTD1tCkNPTkZJR19QQVRBX05JTkpBMzI9bQojIENPTkZJR19QQVRB
X05TODc0MTUgaXMgbm90IHNldApDT05GSUdfUEFUQV9PTERQSUlYPW0KIyBDT05GSUdfUEFUQV9P
UFRJRE1BIGlzIG5vdCBzZXQKQ09ORklHX1BBVEFfUERDMjAyN1g9bQpDT05GSUdfUEFUQV9QRENf
T0xEPW0KIyBDT05GSUdfUEFUQV9SQURJU1lTIGlzIG5vdCBzZXQKQ09ORklHX1BBVEFfUkRDPW0K
Q09ORklHX1BBVEFfU0NIPW0KQ09ORklHX1BBVEFfU0VSVkVSV09SS1M9bQpDT05GSUdfUEFUQV9T
SUw2ODA9bQpDT05GSUdfUEFUQV9TSVM9bQpDT05GSUdfUEFUQV9UT1NISUJBPW0KIyBDT05GSUdf
UEFUQV9UUklGTEVYIGlzIG5vdCBzZXQKQ09ORklHX1BBVEFfVklBPW0KIyBDT05GSUdfUEFUQV9X
SU5CT05EIGlzIG5vdCBzZXQKCiMKIyBQSU8tb25seSBTRkYgY29udHJvbGxlcnMKIwojIENPTkZJ
R19QQVRBX0NNRDY0MF9QQ0kgaXMgbm90IHNldAojIENPTkZJR19QQVRBX01QSUlYIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUEFUQV9OUzg3NDEwIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9PUFRJIGlz
IG5vdCBzZXQKIyBDT05GSUdfUEFUQV9QTEFURk9STSBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFf
UloxMDAwIGlzIG5vdCBzZXQKCiMKIyBHZW5lcmljIGZhbGxiYWNrIC8gbGVnYWN5IGRyaXZlcnMK
IwpDT05GSUdfUEFUQV9BQ1BJPW0KQ09ORklHX0FUQV9HRU5FUklDPW0KIyBDT05GSUdfUEFUQV9M
RUdBQ1kgaXMgbm90IHNldApDT05GSUdfTUQ9eQpDT05GSUdfQkxLX0RFVl9NRD15CkNPTkZJR19N
RF9BVVRPREVURUNUPXkKQ09ORklHX01EX0xJTkVBUj1tCkNPTkZJR19NRF9SQUlEMD1tCkNPTkZJ
R19NRF9SQUlEMT1tCkNPTkZJR19NRF9SQUlEMTA9bQpDT05GSUdfTURfUkFJRDQ1Nj1tCkNPTkZJ
R19NRF9NVUxUSVBBVEg9bQpDT05GSUdfTURfRkFVTFRZPW0KIyBDT05GSUdfTURfQ0xVU1RFUiBp
cyBub3Qgc2V0CiMgQ09ORklHX0JDQUNIRSBpcyBub3Qgc2V0CkNPTkZJR19CTEtfREVWX0RNX0JV
SUxUSU49eQpDT05GSUdfQkxLX0RFVl9ETT1tCkNPTkZJR19ETV9ERUJVRz15CkNPTkZJR19ETV9C
VUZJTz1tCiMgQ09ORklHX0RNX0RFQlVHX0JMT0NLX01BTkFHRVJfTE9DS0lORyBpcyBub3Qgc2V0
CkNPTkZJR19ETV9CSU9fUFJJU09OPW0KQ09ORklHX0RNX1BFUlNJU1RFTlRfREFUQT1tCiMgQ09O
RklHX0RNX1VOU1RSSVBFRCBpcyBub3Qgc2V0CkNPTkZJR19ETV9DUllQVD1tCkNPTkZJR19ETV9T
TkFQU0hPVD1tCkNPTkZJR19ETV9USElOX1BST1ZJU0lPTklORz1tCkNPTkZJR19ETV9DQUNIRT1t
CkNPTkZJR19ETV9DQUNIRV9TTVE9bQojIENPTkZJR19ETV9XUklURUNBQ0hFIGlzIG5vdCBzZXQK
IyBDT05GSUdfRE1fRVJBIGlzIG5vdCBzZXQKQ09ORklHX0RNX01JUlJPUj1tCkNPTkZJR19ETV9M
T0dfVVNFUlNQQUNFPW0KQ09ORklHX0RNX1JBSUQ9bQpDT05GSUdfRE1fWkVSTz1tCkNPTkZJR19E
TV9NVUxUSVBBVEg9bQpDT05GSUdfRE1fTVVMVElQQVRIX1FMPW0KQ09ORklHX0RNX01VTFRJUEFU
SF9TVD1tCkNPTkZJR19ETV9ERUxBWT1tCiMgQ09ORklHX0RNX0RVU1QgaXMgbm90IHNldApDT05G
SUdfRE1fVUVWRU5UPXkKQ09ORklHX0RNX0ZMQUtFWT1tCkNPTkZJR19ETV9WRVJJVFk9bQojIENP
TkZJR19ETV9WRVJJVFlfRkVDIGlzIG5vdCBzZXQKQ09ORklHX0RNX1NXSVRDSD1tCkNPTkZJR19E
TV9MT0dfV1JJVEVTPW0KIyBDT05GSUdfRE1fSU5URUdSSVRZIGlzIG5vdCBzZXQKIyBDT05GSUdf
RE1fWk9ORUQgaXMgbm90IHNldApDT05GSUdfVEFSR0VUX0NPUkU9bQpDT05GSUdfVENNX0lCTE9D
Sz1tCkNPTkZJR19UQ01fRklMRUlPPW0KQ09ORklHX1RDTV9QU0NTST1tCiMgQ09ORklHX1RDTV9V
U0VSMiBpcyBub3Qgc2V0CkNPTkZJR19MT09QQkFDS19UQVJHRVQ9bQpDT05GSUdfVENNX0ZDPW0K
Q09ORklHX0lTQ1NJX1RBUkdFVD1tCiMgQ09ORklHX0lTQ1NJX1RBUkdFVF9DWEdCNCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NCUF9UQVJHRVQgaXMgbm90IHNldApDT05GSUdfRlVTSU9OPXkKQ09ORklH
X0ZVU0lPTl9TUEk9bQojIENPTkZJR19GVVNJT05fRkMgaXMgbm90IHNldApDT05GSUdfRlVTSU9O
X1NBUz1tCkNPTkZJR19GVVNJT05fTUFYX1NHRT0xMjgKQ09ORklHX0ZVU0lPTl9DVEw9bQpDT05G
SUdfRlVTSU9OX0xPR0dJTkc9eQoKIwojIElFRUUgMTM5NCAoRmlyZVdpcmUpIHN1cHBvcnQKIwpD
T05GSUdfRklSRVdJUkU9bQpDT05GSUdfRklSRVdJUkVfT0hDST1tCkNPTkZJR19GSVJFV0lSRV9T
QlAyPW0KQ09ORklHX0ZJUkVXSVJFX05FVD1tCiMgQ09ORklHX0ZJUkVXSVJFX05PU1kgaXMgbm90
IHNldAojIGVuZCBvZiBJRUVFIDEzOTQgKEZpcmVXaXJlKSBzdXBwb3J0CgpDT05GSUdfTUFDSU5U
T1NIX0RSSVZFUlM9eQpDT05GSUdfTUFDX0VNVU1PVVNFQlROPXkKQ09ORklHX05FVERFVklDRVM9
eQpDT05GSUdfTUlJPXkKQ09ORklHX05FVF9DT1JFPXkKQ09ORklHX0JPTkRJTkc9bQpDT05GSUdf
RFVNTVk9bQojIENPTkZJR19FUVVBTElaRVIgaXMgbm90IHNldApDT05GSUdfTkVUX0ZDPXkKQ09O
RklHX0lGQj1tCkNPTkZJR19ORVRfVEVBTT1tCkNPTkZJR19ORVRfVEVBTV9NT0RFX0JST0FEQ0FT
VD1tCkNPTkZJR19ORVRfVEVBTV9NT0RFX1JPVU5EUk9CSU49bQpDT05GSUdfTkVUX1RFQU1fTU9E
RV9SQU5ET009bQpDT05GSUdfTkVUX1RFQU1fTU9ERV9BQ1RJVkVCQUNLVVA9bQpDT05GSUdfTkVU
X1RFQU1fTU9ERV9MT0FEQkFMQU5DRT1tCkNPTkZJR19NQUNWTEFOPW0KQ09ORklHX01BQ1ZUQVA9
bQojIENPTkZJR19JUFZMQU4gaXMgbm90IHNldApDT05GSUdfVlhMQU49bQojIENPTkZJR19HRU5F
VkUgaXMgbm90IHNldAojIENPTkZJR19HVFAgaXMgbm90IHNldApDT05GSUdfTUFDU0VDPXkKQ09O
RklHX05FVENPTlNPTEU9bQpDT05GSUdfTkVUQ09OU09MRV9EWU5BTUlDPXkKQ09ORklHX05FVFBP
TEw9eQpDT05GSUdfTkVUX1BPTExfQ09OVFJPTExFUj15CkNPTkZJR19UVU49bQpDT05GSUdfVEFQ
PW0KIyBDT05GSUdfVFVOX1ZORVRfQ1JPU1NfTEUgaXMgbm90IHNldApDT05GSUdfVkVUSD1tCkNP
TkZJR19WSVJUSU9fTkVUPXkKQ09ORklHX05MTU9OPW0KQ09ORklHX05FVF9WUkY9eQojIENPTkZJ
R19BUkNORVQgaXMgbm90IHNldAojIENPTkZJR19BVE1fRFJJVkVSUyBpcyBub3Qgc2V0CgojCiMg
Q0FJRiB0cmFuc3BvcnQgZHJpdmVycwojCgojCiMgRGlzdHJpYnV0ZWQgU3dpdGNoIEFyY2hpdGVj
dHVyZSBkcml2ZXJzCiMKIyBlbmQgb2YgRGlzdHJpYnV0ZWQgU3dpdGNoIEFyY2hpdGVjdHVyZSBk
cml2ZXJzCgpDT05GSUdfRVRIRVJORVQ9eQpDT05GSUdfTURJTz15CiMgQ09ORklHX05FVF9WRU5E
T1JfM0NPTSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfQURBUFRFQyBpcyBub3Qgc2V0
CkNPTkZJR19ORVRfVkVORE9SX0FHRVJFPXkKIyBDT05GSUdfRVQxMzFYIGlzIG5vdCBzZXQKQ09O
RklHX05FVF9WRU5ET1JfQUxBQ1JJVEVDSD15CiMgQ09ORklHX1NMSUNPU1MgaXMgbm90IHNldAoj
IENPTkZJR19ORVRfVkVORE9SX0FMVEVPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0FMVEVSQV9UU0Ug
aXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9BTUFaT049eQojIENPTkZJR19FTkFfRVRIRVJO
RVQgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX0FNRCBpcyBub3Qgc2V0CkNPTkZJR19O
RVRfVkVORE9SX0FRVUFOVElBPXkKIyBDT05GSUdfQVFUSU9OIGlzIG5vdCBzZXQKQ09ORklHX05F
VF9WRU5ET1JfQVJDPXkKQ09ORklHX05FVF9WRU5ET1JfQVRIRVJPUz15CkNPTkZJR19BVEwyPW0K
Q09ORklHX0FUTDE9bQpDT05GSUdfQVRMMUU9bQpDT05GSUdfQVRMMUM9bQpDT05GSUdfQUxYPW0K
IyBDT05GSUdfTkVUX1ZFTkRPUl9BVVJPUkEgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9C
Uk9BRENPTT15CkNPTkZJR19CNDQ9bQpDT05GSUdfQjQ0X1BDSV9BVVRPU0VMRUNUPXkKQ09ORklH
X0I0NF9QQ0lDT1JFX0FVVE9TRUxFQ1Q9eQpDT05GSUdfQjQ0X1BDST15CiMgQ09ORklHX0JDTUdF
TkVUIGlzIG5vdCBzZXQKQ09ORklHX0JOWDI9bQpDT05GSUdfQ05JQz1tCkNPTkZJR19USUdPTjM9
eQpDT05GSUdfVElHT04zX0hXTU9OPXkKIyBDT05GSUdfQk5YMlggaXMgbm90IHNldAojIENPTkZJ
R19TWVNURU1QT1JUIGlzIG5vdCBzZXQKIyBDT05GSUdfQk5YVCBpcyBub3Qgc2V0CkNPTkZJR19O
RVRfVkVORE9SX0JST0NBREU9eQpDT05GSUdfQk5BPW0KQ09ORklHX05FVF9WRU5ET1JfQ0FERU5D
RT15CiMgQ09ORklHX01BQ0IgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9DQVZJVU09eQoj
IENPTkZJR19USFVOREVSX05JQ19QRiBpcyBub3Qgc2V0CiMgQ09ORklHX1RIVU5ERVJfTklDX1ZG
IGlzIG5vdCBzZXQKIyBDT05GSUdfVEhVTkRFUl9OSUNfQkdYIGlzIG5vdCBzZXQKIyBDT05GSUdf
VEhVTkRFUl9OSUNfUkdYIGlzIG5vdCBzZXQKQ09ORklHX0NBVklVTV9QVFA9eQojIENPTkZJR19M
SVFVSURJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0xJUVVJRElPX1ZGIGlzIG5vdCBzZXQKQ09ORklH
X05FVF9WRU5ET1JfQ0hFTFNJTz15CiMgQ09ORklHX0NIRUxTSU9fVDEgaXMgbm90IHNldApDT05G
SUdfQ0hFTFNJT19UMz1tCkNPTkZJR19DSEVMU0lPX1Q0PW0KIyBDT05GSUdfQ0hFTFNJT19UNF9E
Q0IgaXMgbm90IHNldApDT05GSUdfQ0hFTFNJT19UNFZGPW0KQ09ORklHX0NIRUxTSU9fTElCPW0K
Q09ORklHX05FVF9WRU5ET1JfQ0lTQ089eQpDT05GSUdfRU5JQz1tCkNPTkZJR19ORVRfVkVORE9S
X0NPUlRJTkE9eQojIENPTkZJR19DWF9FQ0FUIGlzIG5vdCBzZXQKQ09ORklHX0RORVQ9bQpDT05G
SUdfTkVUX1ZFTkRPUl9ERUM9eQpDT05GSUdfTkVUX1RVTElQPXkKQ09ORklHX0RFMjEwNFg9bQpD
T05GSUdfREUyMTA0WF9EU0w9MApDT05GSUdfVFVMSVA9eQojIENPTkZJR19UVUxJUF9NV0kgaXMg
bm90IHNldApDT05GSUdfVFVMSVBfTU1JTz15CiMgQ09ORklHX1RVTElQX05BUEkgaXMgbm90IHNl
dApDT05GSUdfREU0WDU9bQpDT05GSUdfV0lOQk9ORF84NDA9bQpDT05GSUdfRE05MTAyPW0KQ09O
RklHX1VMSTUyNlg9bQpDT05GSUdfUENNQ0lBX1hJUkNPTT1tCiMgQ09ORklHX05FVF9WRU5ET1Jf
RExJTksgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9FTVVMRVg9eQpDT05GSUdfQkUyTkVU
PW0KQ09ORklHX0JFMk5FVF9IV01PTj15CkNPTkZJR19CRTJORVRfQkUyPXkKQ09ORklHX0JFMk5F
VF9CRTM9eQpDT05GSUdfQkUyTkVUX0xBTkNFUj15CkNPTkZJR19CRTJORVRfU0tZSEFXSz15CkNP
TkZJR19ORVRfVkVORE9SX0VaQ0hJUD15CiMgQ09ORklHX05FVF9WRU5ET1JfSFAgaXMgbm90IHNl
dApDT05GSUdfTkVUX1ZFTkRPUl9IVUFXRUk9eQojIENPTkZJR19ISU5JQyBpcyBub3Qgc2V0CiMg
Q09ORklHX05FVF9WRU5ET1JfSTgyNVhYIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfSU5U
RUw9eQojIENPTkZJR19FMTAwIGlzIG5vdCBzZXQKQ09ORklHX0UxMDAwPXkKQ09ORklHX0UxMDAw
RT15CkNPTkZJR19FMTAwMEVfSFdUUz15CkNPTkZJR19JR0I9eQpDT05GSUdfSUdCX0hXTU9OPXkK
Q09ORklHX0lHQlZGPW0KQ09ORklHX0lYR0I9eQpDT05GSUdfSVhHQkU9eQpDT05GSUdfSVhHQkVf
SFdNT049eQpDT05GSUdfSVhHQkVfRENCPXkKQ09ORklHX0lYR0JFVkY9bQpDT05GSUdfSTQwRT15
CiMgQ09ORklHX0k0MEVfRENCIGlzIG5vdCBzZXQKIyBDT05GSUdfSTQwRVZGIGlzIG5vdCBzZXQK
IyBDT05GSUdfSUNFIGlzIG5vdCBzZXQKIyBDT05GSUdfRk0xMEsgaXMgbm90IHNldAojIENPTkZJ
R19JR0MgaXMgbm90IHNldApDT05GSUdfSk1FPW0KQ09ORklHX05FVF9WRU5ET1JfTUFSVkVMTD15
CkNPTkZJR19NVk1ESU89bQpDT05GSUdfU0tHRT15CkNPTkZJR19TS0dFX0RFQlVHPXkKQ09ORklH
X1NLR0VfR0VORVNJUz15CkNPTkZJR19TS1kyPW0KQ09ORklHX1NLWTJfREVCVUc9eQpDT05GSUdf
TkVUX1ZFTkRPUl9NRUxMQU5PWD15CkNPTkZJR19NTFg0X0VOPW0KQ09ORklHX01MWDRfRU5fRENC
PXkKQ09ORklHX01MWDRfQ09SRT1tCkNPTkZJR19NTFg0X0RFQlVHPXkKQ09ORklHX01MWDRfQ09S
RV9HRU4yPXkKIyBDT05GSUdfTUxYNV9DT1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfTUxYU1dfQ09S
RSBpcyBub3Qgc2V0CiMgQ09ORklHX01MWEZXIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRP
Ul9NSUNSRUwgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9NSUNST0NISVA9eQojIENPTkZJ
R19FTkMyOEo2MCBpcyBub3Qgc2V0CiMgQ09ORklHX0VOQ1gyNEo2MDAgaXMgbm90IHNldAojIENP
TkZJR19MQU43NDNYIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfTUlDUk9TRU1JPXkKQ09O
RklHX05FVF9WRU5ET1JfTVlSST15CkNPTkZJR19NWVJJMTBHRT1tCiMgQ09ORklHX0ZFQUxOWCBp
cyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfTkFUU0VNSSBpcyBub3Qgc2V0CkNPTkZJR19O
RVRfVkVORE9SX05FVEVSSU9OPXkKIyBDT05GSUdfUzJJTyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZY
R0UgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9ORVRST05PTUU9eQojIENPTkZJR19ORlAg
aXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9OST15CiMgQ09ORklHX05JX1hHRV9NQU5BR0VN
RU5UX0VORVQgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX05WSURJQSBpcyBub3Qgc2V0
CkNPTkZJR19ORVRfVkVORE9SX09LST15CkNPTkZJR19FVEhPQz1tCkNPTkZJR19ORVRfVkVORE9S
X1BBQ0tFVF9FTkdJTkVTPXkKIyBDT05GSUdfSEFNQUNISSBpcyBub3Qgc2V0CkNPTkZJR19ZRUxM
T1dGSU49bQpDT05GSUdfTkVUX1ZFTkRPUl9RTE9HSUM9eQpDT05GSUdfUUxBM1hYWD1tCkNPTkZJ
R19RTENOSUM9bQpDT05GSUdfUUxDTklDX1NSSU9WPXkKQ09ORklHX1FMQ05JQ19EQ0I9eQpDT05G
SUdfUUxDTklDX0hXTU9OPXkKQ09ORklHX1FMR0U9bQpDT05GSUdfTkVUWEVOX05JQz1tCiMgQ09O
RklHX1FFRCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX1FVQUxDT01NPXkKIyBDT05GSUdf
UUNPTV9FTUFDIGlzIG5vdCBzZXQKIyBDT05GSUdfUk1ORVQgaXMgbm90IHNldAojIENPTkZJR19O
RVRfVkVORE9SX1JEQyBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX1JFQUxURUs9eQojIENP
TkZJR19BVFAgaXMgbm90IHNldApDT05GSUdfODEzOUNQPXkKQ09ORklHXzgxMzlUT089eQpDT05G
SUdfODEzOVRPT19QSU89eQojIENPTkZJR184MTM5VE9PX1RVTkVfVFdJU1RFUiBpcyBub3Qgc2V0
CkNPTkZJR184MTM5VE9PXzgxMjk9eQojIENPTkZJR184MTM5X09MRF9SWF9SRVNFVCBpcyBub3Qg
c2V0CkNPTkZJR19SODE2OT15CkNPTkZJR19ORVRfVkVORE9SX1JFTkVTQVM9eQpDT05GSUdfTkVU
X1ZFTkRPUl9ST0NLRVI9eQpDT05GSUdfTkVUX1ZFTkRPUl9TQU1TVU5HPXkKIyBDT05GSUdfU1hH
QkVfRVRIIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9TRUVRIGlzIG5vdCBzZXQKQ09O
RklHX05FVF9WRU5ET1JfU09MQVJGTEFSRT15CkNPTkZJR19TRkM9bQpDT05GSUdfU0ZDX01URD15
CkNPTkZJR19TRkNfTUNESV9NT049eQpDT05GSUdfU0ZDX1NSSU9WPXkKQ09ORklHX1NGQ19NQ0RJ
X0xPR0dJTkc9eQojIENPTkZJR19TRkNfRkFMQ09OIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZF
TkRPUl9TSUxBTiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfU0lTIGlzIG5vdCBzZXQK
Q09ORklHX05FVF9WRU5ET1JfU01TQz15CkNPTkZJR19FUElDMTAwPW0KIyBDT05GSUdfU01TQzkx
MVggaXMgbm90IHNldApDT05GSUdfU01TQzk0MjA9bQpDT05GSUdfTkVUX1ZFTkRPUl9TT0NJT05F
WFQ9eQojIENPTkZJR19ORVRfVkVORE9SX1NUTUlDUk8gaXMgbm90IHNldAojIENPTkZJR19ORVRf
VkVORE9SX1NVTiBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX1NZTk9QU1lTPXkKIyBDT05G
SUdfRFdDX1hMR01BQyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfVEVIVVRJIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9USSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5E
T1JfVklBIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9XSVpORVQgaXMgbm90IHNldApD
T05GSUdfTkVUX1ZFTkRPUl9YSUxJTlg9eQojIENPTkZJR19YSUxJTlhfTExfVEVNQUMgaXMgbm90
IHNldAojIENPTkZJR19GRERJIGlzIG5vdCBzZXQKIyBDT05GSUdfSElQUEkgaXMgbm90IHNldAoj
IENPTkZJR19ORVRfU0IxMDAwIGlzIG5vdCBzZXQKQ09ORklHX01ESU9fREVWSUNFPXkKQ09ORklH
X01ESU9fQlVTPXkKIyBDT05GSUdfTURJT19CQ01fVU5JTUFDIGlzIG5vdCBzZXQKQ09ORklHX01E
SU9fQklUQkFORz1tCiMgQ09ORklHX01ESU9fR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX01ESU9f
TVNDQ19NSUlNIGlzIG5vdCBzZXQKIyBDT05GSUdfTURJT19USFVOREVSIGlzIG5vdCBzZXQKQ09O
RklHX1BIWUxJQj15CkNPTkZJR19TV1BIWT15CiMgQ09ORklHX0xFRF9UUklHR0VSX1BIWSBpcyBu
b3Qgc2V0CgojCiMgTUlJIFBIWSBkZXZpY2UgZHJpdmVycwojCkNPTkZJR19BTURfUEhZPW0KIyBD
T05GSUdfQVFVQU5USUFfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfQVNJWF9QSFkgaXMgbm90IHNl
dApDT05GSUdfQVQ4MDNYX1BIWT1tCiMgQ09ORklHX0JDTTdYWFhfUEhZIGlzIG5vdCBzZXQKQ09O
RklHX0JDTTg3WFhfUEhZPW0KQ09ORklHX0JDTV9ORVRfUEhZTElCPW0KQ09ORklHX0JST0FEQ09N
X1BIWT1tCkNPTkZJR19DSUNBREFfUEhZPW0KIyBDT05GSUdfQ09SVElOQV9QSFkgaXMgbm90IHNl
dApDT05GSUdfREFWSUNPTV9QSFk9bQojIENPTkZJR19EUDgzODIyX1BIWSBpcyBub3Qgc2V0CiMg
Q09ORklHX0RQODNUQzgxMV9QSFkgaXMgbm90IHNldAojIENPTkZJR19EUDgzODQ4X1BIWSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0RQODM4NjdfUEhZIGlzIG5vdCBzZXQKQ09ORklHX0ZJWEVEX1BIWT15
CkNPTkZJR19JQ1BMVVNfUEhZPW0KIyBDT05GSUdfSU5URUxfWFdBWV9QSFkgaXMgbm90IHNldApD
T05GSUdfTFNJX0VUMTAxMUNfUEhZPW0KQ09ORklHX0xYVF9QSFk9bQpDT05GSUdfTUFSVkVMTF9Q
SFk9bQojIENPTkZJR19NQVJWRUxMXzEwR19QSFkgaXMgbm90IHNldApDT05GSUdfTUlDUkVMX1BI
WT1tCiMgQ09ORklHX01JQ1JPQ0hJUF9QSFkgaXMgbm90IHNldAojIENPTkZJR19NSUNST0NISVBf
VDFfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfTUlDUk9TRU1JX1BIWSBpcyBub3Qgc2V0CkNPTkZJ
R19OQVRJT05BTF9QSFk9bQpDT05GSUdfUVNFTUlfUEhZPW0KQ09ORklHX1JFQUxURUtfUEhZPXkK
IyBDT05GSUdfUkVORVNBU19QSFkgaXMgbm90IHNldAojIENPTkZJR19ST0NLQ0hJUF9QSFkgaXMg
bm90IHNldApDT05GSUdfU01TQ19QSFk9bQpDT05GSUdfU1RFMTBYUD1tCiMgQ09ORklHX1RFUkFO
RVRJQ1NfUEhZIGlzIG5vdCBzZXQKQ09ORklHX1ZJVEVTU0VfUEhZPW0KIyBDT05GSUdfWElMSU5Y
X0dNSUkyUkdNSUkgaXMgbm90IHNldAojIENPTkZJR19NSUNSRUxfS1M4OTk1TUEgaXMgbm90IHNl
dAojIENPTkZJR19QTElQIGlzIG5vdCBzZXQKQ09ORklHX1BQUD1tCkNPTkZJR19QUFBfQlNEQ09N
UD1tCkNPTkZJR19QUFBfREVGTEFURT1tCkNPTkZJR19QUFBfRklMVEVSPXkKQ09ORklHX1BQUF9N
UFBFPW0KQ09ORklHX1BQUF9NVUxUSUxJTks9eQpDT05GSUdfUFBQT0FUTT1tCkNPTkZJR19QUFBP
RT1tCkNPTkZJR19QUFRQPW0KQ09ORklHX1BQUE9MMlRQPW0KQ09ORklHX1BQUF9BU1lOQz1tCkNP
TkZJR19QUFBfU1lOQ19UVFk9bQpDT05GSUdfU0xJUD1tCkNPTkZJR19TTEhDPW0KQ09ORklHX1NM
SVBfQ09NUFJFU1NFRD15CkNPTkZJR19TTElQX1NNQVJUPXkKIyBDT05GSUdfU0xJUF9NT0RFX1NM
SVA2IGlzIG5vdCBzZXQKQ09ORklHX1VTQl9ORVRfRFJJVkVSUz15CkNPTkZJR19VU0JfQ0FUQz15
CkNPTkZJR19VU0JfS0FXRVRIPXkKQ09ORklHX1VTQl9QRUdBU1VTPXkKQ09ORklHX1VTQl9SVEw4
MTUwPXkKQ09ORklHX1VTQl9SVEw4MTUyPW0KIyBDT05GSUdfVVNCX0xBTjc4WFggaXMgbm90IHNl
dApDT05GSUdfVVNCX1VTQk5FVD15CkNPTkZJR19VU0JfTkVUX0FYODgxN1g9eQpDT05GSUdfVVNC
X05FVF9BWDg4MTc5XzE3OEE9bQpDT05GSUdfVVNCX05FVF9DRENFVEhFUj15CkNPTkZJR19VU0Jf
TkVUX0NEQ19FRU09eQpDT05GSUdfVVNCX05FVF9DRENfTkNNPW0KIyBDT05GSUdfVVNCX05FVF9I
VUFXRUlfQ0RDX05DTSBpcyBub3Qgc2V0CkNPTkZJR19VU0JfTkVUX0NEQ19NQklNPW0KQ09ORklH
X1VTQl9ORVRfRE05NjAxPXkKIyBDT05GSUdfVVNCX05FVF9TUjk3MDAgaXMgbm90IHNldAojIENP
TkZJR19VU0JfTkVUX1NSOTgwMCBpcyBub3Qgc2V0CkNPTkZJR19VU0JfTkVUX1NNU0M3NVhYPXkK
Q09ORklHX1VTQl9ORVRfU01TQzk1WFg9eQpDT05GSUdfVVNCX05FVF9HTDYyMEE9eQpDT05GSUdf
VVNCX05FVF9ORVQxMDgwPXkKQ09ORklHX1VTQl9ORVRfUExVU0I9eQpDT05GSUdfVVNCX05FVF9N
Q1M3ODMwPXkKQ09ORklHX1VTQl9ORVRfUk5ESVNfSE9TVD15CkNPTkZJR19VU0JfTkVUX0NEQ19T
VUJTRVRfRU5BQkxFPXkKQ09ORklHX1VTQl9ORVRfQ0RDX1NVQlNFVD15CkNPTkZJR19VU0JfQUxJ
X001NjMyPXkKQ09ORklHX1VTQl9BTjI3MjA9eQpDT05GSUdfVVNCX0JFTEtJTj15CkNPTkZJR19V
U0JfQVJNTElOVVg9eQpDT05GSUdfVVNCX0VQU09OMjg4OD15CkNPTkZJR19VU0JfS0MyMTkwPXkK
Q09ORklHX1VTQl9ORVRfWkFVUlVTPXkKQ09ORklHX1VTQl9ORVRfQ1g4MjMxMF9FVEg9bQpDT05G
SUdfVVNCX05FVF9LQUxNSUE9bQpDT05GSUdfVVNCX05FVF9RTUlfV1dBTj1tCkNPTkZJR19VU0Jf
SFNPPW0KQ09ORklHX1VTQl9ORVRfSU5UNTFYMT15CkNPTkZJR19VU0JfSVBIRVRIPXkKQ09ORklH
X1VTQl9TSUVSUkFfTkVUPXkKQ09ORklHX1VTQl9WTDYwMD1tCiMgQ09ORklHX1VTQl9ORVRfQ0g5
MjAwIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX05FVF9BUUMxMTEgaXMgbm90IHNldApDT05GSUdf
V0xBTj15CiMgQ09ORklHX1dJUkVMRVNTX1dEUyBpcyBub3Qgc2V0CkNPTkZJR19XTEFOX1ZFTkRP
Ul9BRE1URUs9eQojIENPTkZJR19BRE04MjExIGlzIG5vdCBzZXQKQ09ORklHX1dMQU5fVkVORE9S
X0FUSD15CiMgQ09ORklHX0FUSF9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0FUSDVLIGlzIG5v
dCBzZXQKIyBDT05GSUdfQVRINUtfUENJIGlzIG5vdCBzZXQKIyBDT05GSUdfQVRIOUsgaXMgbm90
IHNldAojIENPTkZJR19BVEg5S19IVEMgaXMgbm90IHNldAojIENPTkZJR19DQVJMOTE3MCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0FUSDZLTCBpcyBub3Qgc2V0CiMgQ09ORklHX0FSNTUyMyBpcyBub3Qg
c2V0CiMgQ09ORklHX1dJTDYyMTAgaXMgbm90IHNldAojIENPTkZJR19BVEgxMEsgaXMgbm90IHNl
dAojIENPTkZJR19XQ04zNlhYIGlzIG5vdCBzZXQKQ09ORklHX1dMQU5fVkVORE9SX0FUTUVMPXkK
IyBDT05GSUdfQVRNRUwgaXMgbm90IHNldAojIENPTkZJR19BVDc2QzUwWF9VU0IgaXMgbm90IHNl
dApDT05GSUdfV0xBTl9WRU5ET1JfQlJPQURDT009eQojIENPTkZJR19CNDMgaXMgbm90IHNldAoj
IENPTkZJR19CNDNMRUdBQ1kgaXMgbm90IHNldAojIENPTkZJR19CUkNNU01BQyBpcyBub3Qgc2V0
CiMgQ09ORklHX0JSQ01GTUFDIGlzIG5vdCBzZXQKQ09ORklHX1dMQU5fVkVORE9SX0NJU0NPPXkK
IyBDT05GSUdfQUlSTyBpcyBub3Qgc2V0CkNPTkZJR19XTEFOX1ZFTkRPUl9JTlRFTD15CiMgQ09O
RklHX0lQVzIxMDAgaXMgbm90IHNldAojIENPTkZJR19JUFcyMjAwIGlzIG5vdCBzZXQKIyBDT05G
SUdfSVdMNDk2NSBpcyBub3Qgc2V0CiMgQ09ORklHX0lXTDM5NDUgaXMgbm90IHNldAojIENPTkZJ
R19JV0xXSUZJIGlzIG5vdCBzZXQKQ09ORklHX1dMQU5fVkVORE9SX0lOVEVSU0lMPXkKIyBDT05G
SUdfSE9TVEFQIGlzIG5vdCBzZXQKIyBDT05GSUdfSEVSTUVTIGlzIG5vdCBzZXQKIyBDT05GSUdf
UDU0X0NPTU1PTiBpcyBub3Qgc2V0CiMgQ09ORklHX1BSSVNNNTQgaXMgbm90IHNldApDT05GSUdf
V0xBTl9WRU5ET1JfTUFSVkVMTD15CiMgQ09ORklHX0xJQkVSVEFTIGlzIG5vdCBzZXQKIyBDT05G
SUdfTElCRVJUQVNfVEhJTkZJUk0gaXMgbm90IHNldAojIENPTkZJR19NV0lGSUVYIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTVdMOEsgaXMgbm90IHNldApDT05GSUdfV0xBTl9WRU5ET1JfTUVESUFURUs9
eQojIENPTkZJR19NVDc2MDFVIGlzIG5vdCBzZXQKIyBDT05GSUdfTVQ3NngwVSBpcyBub3Qgc2V0
CiMgQ09ORklHX01UNzZ4MEUgaXMgbm90IHNldAojIENPTkZJR19NVDc2eDJFIGlzIG5vdCBzZXQK
IyBDT05GSUdfTVQ3NngyVSBpcyBub3Qgc2V0CiMgQ09ORklHX01UNzYwM0UgaXMgbm90IHNldAoj
IENPTkZJR19NVDc2MTVFIGlzIG5vdCBzZXQKQ09ORklHX1dMQU5fVkVORE9SX1JBTElOSz15CiMg
Q09ORklHX1JUMlgwMCBpcyBub3Qgc2V0CkNPTkZJR19XTEFOX1ZFTkRPUl9SRUFMVEVLPXkKIyBD
T05GSUdfUlRMODE4MCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUTDgxODcgaXMgbm90IHNldApDT05G
SUdfUlRMX0NBUkRTPW0KIyBDT05GSUdfUlRMODE5MkNFIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRM
ODE5MlNFIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRMODE5MkRFIGlzIG5vdCBzZXQKIyBDT05GSUdf
UlRMODcyM0FFIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRMODcyM0JFIGlzIG5vdCBzZXQKIyBDT05G
SUdfUlRMODE4OEVFIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRMODE5MkVFIGlzIG5vdCBzZXQKIyBD
T05GSUdfUlRMODgyMUFFIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRMODE5MkNVIGlzIG5vdCBzZXQK
IyBDT05GSUdfUlRMOFhYWFUgaXMgbm90IHNldAojIENPTkZJR19SVFc4OCBpcyBub3Qgc2V0CkNP
TkZJR19XTEFOX1ZFTkRPUl9SU0k9eQojIENPTkZJR19SU0lfOTFYIGlzIG5vdCBzZXQKQ09ORklH
X1dMQU5fVkVORE9SX1NUPXkKIyBDT05GSUdfQ1cxMjAwIGlzIG5vdCBzZXQKQ09ORklHX1dMQU5f
VkVORE9SX1RJPXkKIyBDT05GSUdfV0wxMjUxIGlzIG5vdCBzZXQKIyBDT05GSUdfV0wxMlhYIGlz
IG5vdCBzZXQKIyBDT05GSUdfV0wxOFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfV0xDT1JFIGlzIG5v
dCBzZXQKQ09ORklHX1dMQU5fVkVORE9SX1pZREFTPXkKIyBDT05GSUdfVVNCX1pEMTIwMSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1pEMTIxMVJXIGlzIG5vdCBzZXQKQ09ORklHX1dMQU5fVkVORE9SX1FV
QU5URU5OQT15CiMgQ09ORklHX1FUTkZNQUNfUENJRSBpcyBub3Qgc2V0CkNPTkZJR19NQUM4MDIx
MV9IV1NJTT1tCiMgQ09ORklHX1VTQl9ORVRfUk5ESVNfV0xBTiBpcyBub3Qgc2V0CiMgQ09ORklH
X1ZJUlRfV0lGSSBpcyBub3Qgc2V0CgojCiMgRW5hYmxlIFdpTUFYIChOZXR3b3JraW5nIG9wdGlv
bnMpIHRvIHNlZSB0aGUgV2lNQVggZHJpdmVycwojCkNPTkZJR19XQU49eQojIENPTkZJR19MQU5N
RURJQSBpcyBub3Qgc2V0CkNPTkZJR19IRExDPW0KQ09ORklHX0hETENfUkFXPW0KIyBDT05GSUdf
SERMQ19SQVdfRVRIIGlzIG5vdCBzZXQKQ09ORklHX0hETENfQ0lTQ089bQpDT05GSUdfSERMQ19G
Uj1tCkNPTkZJR19IRExDX1BQUD1tCgojCiMgWC4yNS9MQVBCIHN1cHBvcnQgaXMgZGlzYWJsZWQK
IwojIENPTkZJR19QQ0kyMDBTWU4gaXMgbm90IHNldAojIENPTkZJR19XQU5YTCBpcyBub3Qgc2V0
CiMgQ09ORklHX1BDMzAwVE9PIGlzIG5vdCBzZXQKIyBDT05GSUdfRkFSU1lOQyBpcyBub3Qgc2V0
CiMgQ09ORklHX0RTQ0M0IGlzIG5vdCBzZXQKQ09ORklHX0RMQ0k9bQpDT05GSUdfRExDSV9NQVg9
OAojIENPTkZJR19TQk5JIGlzIG5vdCBzZXQKQ09ORklHX0lFRUU4MDIxNTRfRFJJVkVSUz1tCkNP
TkZJR19JRUVFODAyMTU0X0ZBS0VMQj1tCiMgQ09ORklHX0lFRUU4MDIxNTRfQVQ4NlJGMjMwIGlz
IG5vdCBzZXQKIyBDT05GSUdfSUVFRTgwMjE1NF9NUkYyNEo0MCBpcyBub3Qgc2V0CiMgQ09ORklH
X0lFRUU4MDIxNTRfQ0MyNTIwIGlzIG5vdCBzZXQKIyBDT05GSUdfSUVFRTgwMjE1NF9BVFVTQiBp
cyBub3Qgc2V0CiMgQ09ORklHX0lFRUU4MDIxNTRfQURGNzI0MiBpcyBub3Qgc2V0CiMgQ09ORklH
X0lFRUU4MDIxNTRfQ0E4MjEwIGlzIG5vdCBzZXQKIyBDT05GSUdfSUVFRTgwMjE1NF9NQ1IyMEEg
aXMgbm90IHNldAojIENPTkZJR19JRUVFODAyMTU0X0hXU0lNIGlzIG5vdCBzZXQKQ09ORklHX1hF
Tl9ORVRERVZfRlJPTlRFTkQ9bQojIENPTkZJR19YRU5fTkVUREVWX0JBQ0tFTkQgaXMgbm90IHNl
dApDT05GSUdfVk1YTkVUMz1tCiMgQ09ORklHX0ZVSklUU1VfRVMgaXMgbm90IHNldApDT05GSUdf
SFlQRVJWX05FVD1tCkNPTkZJR19ORVRERVZTSU09bQpDT05GSUdfTkVUX0ZBSUxPVkVSPXkKQ09O
RklHX0lTRE49eQpDT05GSUdfSVNETl9JNEw9bQpDT05GSUdfSVNETl9QUFA9eQpDT05GSUdfSVNE
Tl9QUFBfVko9eQpDT05GSUdfSVNETl9NUFA9eQpDT05GSUdfSVBQUF9GSUxURVI9eQojIENPTkZJ
R19JU0ROX1BQUF9CU0RDT01QIGlzIG5vdCBzZXQKQ09ORklHX0lTRE5fQVVESU89eQpDT05GSUdf
SVNETl9UVFlfRkFYPXkKCiMKIyBJU0ROIGZlYXR1cmUgc3VibW9kdWxlcwojCkNPTkZJR19JU0RO
X0RJVkVSU0lPTj1tCiMgZW5kIG9mIElTRE4gZmVhdHVyZSBzdWJtb2R1bGVzCgojCiMgSVNETjRM
aW51eCBoYXJkd2FyZSBkcml2ZXJzCiMKCiMKIyBQYXNzaXZlIGNhcmRzCiMKIyBDT05GSUdfSVNE
Tl9EUlZfSElTQVggaXMgbm90IHNldAojIGVuZCBvZiBQYXNzaXZlIGNhcmRzCgpDT05GSUdfSVNE
Tl9DQVBJPW0KIyBDT05GSUdfQ0FQSV9UUkFDRSBpcyBub3Qgc2V0CkNPTkZJR19JU0ROX0NBUElf
Q0FQSTIwPW0KQ09ORklHX0lTRE5fQ0FQSV9NSURETEVXQVJFPXkKQ09ORklHX0lTRE5fQ0FQSV9D
QVBJRFJWPW0KIyBDT05GSUdfSVNETl9DQVBJX0NBUElEUlZfVkVSQk9TRSBpcyBub3Qgc2V0Cgoj
CiMgQ0FQSSBoYXJkd2FyZSBkcml2ZXJzCiMKQ09ORklHX0NBUElfQVZNPXkKQ09ORklHX0lTRE5f
RFJWX0FWTUIxX0IxUENJPW0KQ09ORklHX0lTRE5fRFJWX0FWTUIxX0IxUENJVjQ9eQpDT05GSUdf
SVNETl9EUlZfQVZNQjFfVDFQQ0k9bQpDT05GSUdfSVNETl9EUlZfQVZNQjFfQzQ9bQpDT05GSUdf
SVNETl9EUlZfR0lHQVNFVD1tCkNPTkZJR19HSUdBU0VUX0NBUEk9eQpDT05GSUdfR0lHQVNFVF9C
QVNFPW0KQ09ORklHX0dJR0FTRVRfTTEwNT1tCkNPTkZJR19HSUdBU0VUX00xMDE9bQojIENPTkZJ
R19HSUdBU0VUX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX0hZU0ROPW0KQ09ORklHX0hZU0ROX0NB
UEk9eQpDT05GSUdfTUlTRE49bQpDT05GSUdfTUlTRE5fRFNQPW0KQ09ORklHX01JU0ROX0wxT0lQ
PW0KCiMKIyBtSVNETiBoYXJkd2FyZSBkcml2ZXJzCiMKQ09ORklHX01JU0ROX0hGQ1BDST1tCkNP
TkZJR19NSVNETl9IRkNNVUxUST1tCkNPTkZJR19NSVNETl9IRkNVU0I9bQpDT05GSUdfTUlTRE5f
QVZNRlJJVFo9bQpDT05GSUdfTUlTRE5fU1BFRURGQVg9bQpDT05GSUdfTUlTRE5fSU5GSU5FT049
bQpDT05GSUdfTUlTRE5fVzY2OTI9bQpDT05GSUdfTUlTRE5fTkVUSkVUPW0KQ09ORklHX01JU0RO
X0lQQUM9bQpDT05GSUdfTUlTRE5fSVNBUj1tCkNPTkZJR19JU0ROX0hETEM9bQpDT05GSUdfTlZN
PXkKIyBDT05GSUdfTlZNX1BCTEsgaXMgbm90IHNldAoKIwojIElucHV0IGRldmljZSBzdXBwb3J0
CiMKQ09ORklHX0lOUFVUPXkKQ09ORklHX0lOUFVUX0xFRFM9eQpDT05GSUdfSU5QVVRfRkZfTUVN
TEVTUz15CkNPTkZJR19JTlBVVF9QT0xMREVWPW0KQ09ORklHX0lOUFVUX1NQQVJTRUtNQVA9bQoj
IENPTkZJR19JTlBVVF9NQVRSSVhLTUFQIGlzIG5vdCBzZXQKCiMKIyBVc2VybGFuZCBpbnRlcmZh
Y2VzCiMKQ09ORklHX0lOUFVUX01PVVNFREVWPXkKIyBDT05GSUdfSU5QVVRfTU9VU0VERVZfUFNB
VVggaXMgbm90IHNldApDT05GSUdfSU5QVVRfTU9VU0VERVZfU0NSRUVOX1g9MTAyNApDT05GSUdf
SU5QVVRfTU9VU0VERVZfU0NSRUVOX1k9NzY4CiMgQ09ORklHX0lOUFVUX0pPWURFViBpcyBub3Qg
c2V0CkNPTkZJR19JTlBVVF9FVkRFVj15CiMgQ09ORklHX0lOUFVUX0VWQlVHIGlzIG5vdCBzZXQK
CiMKIyBJbnB1dCBEZXZpY2UgRHJpdmVycwojCkNPTkZJR19JTlBVVF9LRVlCT0FSRD15CiMgQ09O
RklHX0tFWUJPQVJEX0FEUDU1ODggaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9BRFA1NTg5
IGlzIG5vdCBzZXQKQ09ORklHX0tFWUJPQVJEX0FUS0JEPXkKIyBDT05GSUdfS0VZQk9BUkRfUVQx
MDUwIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfUVQxMDcwIGlzIG5vdCBzZXQKIyBDT05G
SUdfS0VZQk9BUkRfUVQyMTYwIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfRExJTktfRElS
Njg1IGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfTEtLQkQgaXMgbm90IHNldAojIENPTkZJ
R19LRVlCT0FSRF9HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfR1BJT19QT0xMRUQg
aXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9UQ0E2NDE2IGlzIG5vdCBzZXQKIyBDT05GSUdf
S0VZQk9BUkRfVENBODQxOCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX01BVFJJWCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX0xNODMyMyBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJP
QVJEX0xNODMzMyBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX01BWDczNTkgaXMgbm90IHNl
dAojIENPTkZJR19LRVlCT0FSRF9NQ1MgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9NUFIx
MjEgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9ORVdUT04gaXMgbm90IHNldAojIENPTkZJ
R19LRVlCT0FSRF9PUEVOQ09SRVMgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9TQU1TVU5H
IGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfU1RPV0FXQVkgaXMgbm90IHNldAojIENPTkZJ
R19LRVlCT0FSRF9TVU5LQkQgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9UTTJfVE9VQ0hL
RVkgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9YVEtCRCBpcyBub3Qgc2V0CkNPTkZJR19J
TlBVVF9NT1VTRT15CkNPTkZJR19NT1VTRV9QUzI9eQpDT05GSUdfTU9VU0VfUFMyX0FMUFM9eQpD
T05GSUdfTU9VU0VfUFMyX0JZRD15CkNPTkZJR19NT1VTRV9QUzJfTE9HSVBTMlBQPXkKQ09ORklH
X01PVVNFX1BTMl9TWU5BUFRJQ1M9eQpDT05GSUdfTU9VU0VfUFMyX1NZTkFQVElDU19TTUJVUz15
CkNPTkZJR19NT1VTRV9QUzJfQ1lQUkVTUz15CkNPTkZJR19NT1VTRV9QUzJfTElGRUJPT0s9eQpD
T05GSUdfTU9VU0VfUFMyX1RSQUNLUE9JTlQ9eQpDT05GSUdfTU9VU0VfUFMyX0VMQU5URUNIPXkK
Q09ORklHX01PVVNFX1BTMl9FTEFOVEVDSF9TTUJVUz15CkNPTkZJR19NT1VTRV9QUzJfU0VOVEVM
SUM9eQojIENPTkZJR19NT1VTRV9QUzJfVE9VQ0hLSVQgaXMgbm90IHNldApDT05GSUdfTU9VU0Vf
UFMyX0ZPQ0FMVEVDSD15CiMgQ09ORklHX01PVVNFX1BTMl9WTU1PVVNFIGlzIG5vdCBzZXQKQ09O
RklHX01PVVNFX1BTMl9TTUJVUz15CkNPTkZJR19NT1VTRV9TRVJJQUw9bQpDT05GSUdfTU9VU0Vf
QVBQTEVUT1VDSD1tCkNPTkZJR19NT1VTRV9CQ001OTc0PW0KQ09ORklHX01PVVNFX0NZQVBBPW0K
IyBDT05GSUdfTU9VU0VfRUxBTl9JMkMgaXMgbm90IHNldApDT05GSUdfTU9VU0VfVlNYWFhBQT1t
CiMgQ09ORklHX01PVVNFX0dQSU8gaXMgbm90IHNldApDT05GSUdfTU9VU0VfU1lOQVBUSUNTX0ky
Qz1tCkNPTkZJR19NT1VTRV9TWU5BUFRJQ1NfVVNCPW0KIyBDT05GSUdfSU5QVVRfSk9ZU1RJQ0sg
aXMgbm90IHNldApDT05GSUdfSU5QVVRfVEFCTEVUPXkKQ09ORklHX1RBQkxFVF9VU0JfQUNFQ0FE
PW0KQ09ORklHX1RBQkxFVF9VU0JfQUlQVEVLPW0KQ09ORklHX1RBQkxFVF9VU0JfR1RDTz1tCiMg
Q09ORklHX1RBQkxFVF9VU0JfSEFOV0FORyBpcyBub3Qgc2V0CkNPTkZJR19UQUJMRVRfVVNCX0tC
VEFCPW0KIyBDT05GSUdfVEFCTEVUX1VTQl9QRUdBU1VTIGlzIG5vdCBzZXQKIyBDT05GSUdfVEFC
TEVUX1NFUklBTF9XQUNPTTQgaXMgbm90IHNldApDT05GSUdfSU5QVVRfVE9VQ0hTQ1JFRU49eQpD
T05GSUdfVE9VQ0hTQ1JFRU5fUFJPUEVSVElFUz15CiMgQ09ORklHX1RPVUNIU0NSRUVOX0FEUzc4
NDYgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9BRDc4NzcgaXMgbm90IHNldAojIENP
TkZJR19UT1VDSFNDUkVFTl9BRDc4NzkgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9B
VE1FTF9NWFQgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9BVU9fUElYQ0lSIGlzIG5v
dCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fQlUyMTAxMyBpcyBub3Qgc2V0CiMgQ09ORklHX1RP
VUNIU0NSRUVOX0JVMjEwMjkgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9DSElQT05F
X0lDTjg1MDUgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9DWThDVE1HMTEwIGlzIG5v
dCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fQ1lUVFNQX0NPUkUgaXMgbm90IHNldAojIENPTkZJ
R19UT1VDSFNDUkVFTl9DWVRUU1A0X0NPUkUgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVF
Tl9EWU5BUFJPIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fSEFNUFNISVJFIGlzIG5v
dCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fRUVUSSBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNI
U0NSRUVOX0VHQUxBWF9TRVJJQUwgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9FWEMz
MDAwIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fRlVKSVRTVSBpcyBub3Qgc2V0CiMg
Q09ORklHX1RPVUNIU0NSRUVOX0dPT0RJWCBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVO
X0hJREVFUCBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0lMSTIxMFggaXMgbm90IHNl
dAojIENPTkZJR19UT1VDSFNDUkVFTl9TNlNZNzYxIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hT
Q1JFRU5fR1VOWkUgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9FS1RGMjEyNyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0VMQU4gaXMgbm90IHNldAojIENPTkZJR19UT1VD
SFNDUkVFTl9FTE8gaXMgbm90IHNldApDT05GSUdfVE9VQ0hTQ1JFRU5fV0FDT01fVzgwMDE9bQpD
T05GSUdfVE9VQ0hTQ1JFRU5fV0FDT01fSTJDPW0KIyBDT05GSUdfVE9VQ0hTQ1JFRU5fTUFYMTE4
MDEgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9NQ1M1MDAwIGlzIG5vdCBzZXQKIyBD
T05GSUdfVE9VQ0hTQ1JFRU5fTU1TMTE0IGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5f
TUVMRkFTX01JUDQgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9NVE9VQ0ggaXMgbm90
IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9JTkVYSU8gaXMgbm90IHNldAojIENPTkZJR19UT1VD
SFNDUkVFTl9NSzcxMiBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1BFTk1PVU5UIGlz
IG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fRURUX0ZUNVgwNiBpcyBub3Qgc2V0CiMgQ09O
RklHX1RPVUNIU0NSRUVOX1RPVUNIUklHSFQgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVF
Tl9UT1VDSFdJTiBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1BJWENJUiBpcyBub3Qg
c2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1dEVDg3WFhfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdf
VE9VQ0hTQ1JFRU5fV005N1hYIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fVVNCX0NP
TVBPU0lURSBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1RPVUNISVQyMTMgaXMgbm90
IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9UU0NfU0VSSU8gaXMgbm90IHNldAojIENPTkZJR19U
T1VDSFNDUkVFTl9UU0MyMDA0IGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fVFNDMjAw
NSBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1RTQzIwMDcgaXMgbm90IHNldAojIENP
TkZJR19UT1VDSFNDUkVFTl9STV9UUyBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1NJ
TEVBRCBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1NJU19JMkMgaXMgbm90IHNldAoj
IENPTkZJR19UT1VDSFNDUkVFTl9TVDEyMzIgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVF
Tl9TVE1GVFMgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9TVVI0MCBpcyBub3Qgc2V0
CiMgQ09ORklHX1RPVUNIU0NSRUVOX1NVUkZBQ0UzX1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1RP
VUNIU0NSRUVOX1NYODY1NCBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1RQUzY1MDdY
IGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fWkVUNjIyMyBpcyBub3Qgc2V0CiMgQ09O
RklHX1RPVUNIU0NSRUVOX1pGT1JDRSBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1JP
SE1fQlUyMTAyMyBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0lRUzVYWCBpcyBub3Qg
c2V0CkNPTkZJR19JTlBVVF9NSVNDPXkKIyBDT05GSUdfSU5QVVRfQUQ3MTRYIGlzIG5vdCBzZXQK
IyBDT05GSUdfSU5QVVRfQk1BMTUwIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfRTNYMF9CVVRU
T04gaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9NU01fVklCUkFUT1IgaXMgbm90IHNldApDT05G
SUdfSU5QVVRfUENTUEtSPW0KIyBDT05GSUdfSU5QVVRfTU1BODQ1MCBpcyBub3Qgc2V0CkNPTkZJ
R19JTlBVVF9BUEFORUw9bQojIENPTkZJR19JTlBVVF9HUDJBIGlzIG5vdCBzZXQKIyBDT05GSUdf
SU5QVVRfR1BJT19CRUVQRVIgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9HUElPX0RFQ09ERVIg
aXMgbm90IHNldAojIENPTkZJR19JTlBVVF9HUElPX1ZJQlJBIGlzIG5vdCBzZXQKQ09ORklHX0lO
UFVUX0FUTEFTX0JUTlM9bQpDT05GSUdfSU5QVVRfQVRJX1JFTU9URTI9bQpDT05GSUdfSU5QVVRf
S0VZU1BBTl9SRU1PVEU9bQojIENPTkZJR19JTlBVVF9LWFRKOSBpcyBub3Qgc2V0CkNPTkZJR19J
TlBVVF9QT1dFUk1BVEU9bQpDT05GSUdfSU5QVVRfWUVBTElOSz1tCkNPTkZJR19JTlBVVF9DTTEw
OT1tCkNPTkZJR19JTlBVVF9VSU5QVVQ9bQojIENPTkZJR19JTlBVVF9QQ0Y4NTc0IGlzIG5vdCBz
ZXQKIyBDT05GSUdfSU5QVVRfUFdNX0JFRVBFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX1BX
TV9WSUJSQSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0dQSU9fUk9UQVJZX0VOQ09ERVIgaXMg
bm90IHNldAojIENPTkZJR19JTlBVVF9BRFhMMzRYIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRf
SU1TX1BDVSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0NNQTMwMDAgaXMgbm90IHNldApDT05G
SUdfSU5QVVRfWEVOX0tCRERFVl9GUk9OVEVORD1tCiMgQ09ORklHX0lOUFVUX0lERUFQQURfU0xJ
REVCQVIgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9EUlYyNjBYX0hBUFRJQ1MgaXMgbm90IHNl
dAojIENPTkZJR19JTlBVVF9EUlYyNjY1X0hBUFRJQ1MgaXMgbm90IHNldAojIENPTkZJR19JTlBV
VF9EUlYyNjY3X0hBUFRJQ1MgaXMgbm90IHNldAojIENPTkZJR19STUk0X0NPUkUgaXMgbm90IHNl
dAoKIwojIEhhcmR3YXJlIEkvTyBwb3J0cwojCkNPTkZJR19TRVJJTz15CkNPTkZJR19BUkNIX01J
R0hUX0hBVkVfUENfU0VSSU89eQpDT05GSUdfU0VSSU9fSTgwNDI9eQpDT05GSUdfU0VSSU9fU0VS
UE9SVD15CiMgQ09ORklHX1NFUklPX0NUODJDNzEwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSU9f
UEFSS0JEIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSU9fUENJUFMyIGlzIG5vdCBzZXQKQ09ORklH
X1NFUklPX0xJQlBTMj15CkNPTkZJR19TRVJJT19SQVc9bQpDT05GSUdfU0VSSU9fQUxURVJBX1BT
Mj1tCiMgQ09ORklHX1NFUklPX1BTMk1VTFQgaXMgbm90IHNldApDT05GSUdfU0VSSU9fQVJDX1BT
Mj1tCkNPTkZJR19IWVBFUlZfS0VZQk9BUkQ9bQojIENPTkZJR19TRVJJT19HUElPX1BTMiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1VTRVJJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0dBTUVQT1JUIGlzIG5v
dCBzZXQKIyBlbmQgb2YgSGFyZHdhcmUgSS9PIHBvcnRzCiMgZW5kIG9mIElucHV0IGRldmljZSBz
dXBwb3J0CgojCiMgQ2hhcmFjdGVyIGRldmljZXMKIwpDT05GSUdfVFRZPXkKQ09ORklHX1ZUPXkK
Q09ORklHX0NPTlNPTEVfVFJBTlNMQVRJT05TPXkKQ09ORklHX1ZUX0NPTlNPTEU9eQpDT05GSUdf
VlRfQ09OU09MRV9TTEVFUD15CkNPTkZJR19IV19DT05TT0xFPXkKQ09ORklHX1ZUX0hXX0NPTlNP
TEVfQklORElORz15CkNPTkZJR19VTklYOThfUFRZUz15CiMgQ09ORklHX0xFR0FDWV9QVFlTIGlz
IG5vdCBzZXQKQ09ORklHX1NFUklBTF9OT05TVEFOREFSRD15CiMgQ09ORklHX1JPQ0tFVFBPUlQg
aXMgbm90IHNldApDT05GSUdfQ1lDTEFERVM9bQojIENPTkZJR19DWVpfSU5UUiBpcyBub3Qgc2V0
CkNPTkZJR19NT1hBX0lOVEVMTElPPW0KQ09ORklHX01PWEFfU01BUlRJTz1tCkNPTkZJR19TWU5D
TElOSz1tCkNPTkZJR19TWU5DTElOS01QPW0KQ09ORklHX1NZTkNMSU5LX0dUPW0KQ09ORklHX05P
Wk9NST1tCiMgQ09ORklHX0lTSSBpcyBub3Qgc2V0CkNPTkZJR19OX0hETEM9bQpDT05GSUdfTl9H
U009bQojIENPTkZJR19UUkFDRV9TSU5LIGlzIG5vdCBzZXQKIyBDT05GSUdfTlVMTF9UVFkgaXMg
bm90IHNldApDT05GSUdfTERJU0NfQVVUT0xPQUQ9eQpDT05GSUdfREVWTUVNPXkKIyBDT05GSUdf
REVWS01FTSBpcyBub3Qgc2V0CgojCiMgU2VyaWFsIGRyaXZlcnMKIwpDT05GSUdfU0VSSUFMX0VB
UkxZQ09OPXkKQ09ORklHX1NFUklBTF84MjUwPXkKIyBDT05GSUdfU0VSSUFMXzgyNTBfREVQUkVD
QVRFRF9PUFRJT05TIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF84MjUwX1BOUD15CiMgQ09ORklH
X1NFUklBTF84MjUwX0ZJTlRFSyBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxfODI1MF9DT05TT0xF
PXkKQ09ORklHX1NFUklBTF84MjUwX0RNQT15CkNPTkZJR19TRVJJQUxfODI1MF9QQ0k9eQpDT05G
SUdfU0VSSUFMXzgyNTBfRVhBUj15CkNPTkZJR19TRVJJQUxfODI1MF9OUl9VQVJUUz0zMgpDT05G
SUdfU0VSSUFMXzgyNTBfUlVOVElNRV9VQVJUUz00CkNPTkZJR19TRVJJQUxfODI1MF9FWFRFTkRF
RD15CkNPTkZJR19TRVJJQUxfODI1MF9NQU5ZX1BPUlRTPXkKQ09ORklHX1NFUklBTF84MjUwX1NI
QVJFX0lSUT15CiMgQ09ORklHX1NFUklBTF84MjUwX0RFVEVDVF9JUlEgaXMgbm90IHNldApDT05G
SUdfU0VSSUFMXzgyNTBfUlNBPXkKQ09ORklHX1NFUklBTF84MjUwX0RXPXkKIyBDT05GSUdfU0VS
SUFMXzgyNTBfUlQyODhYIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF84MjUwX0xQU1M9eQpDT05G
SUdfU0VSSUFMXzgyNTBfTUlEPXkKIyBDT05GSUdfU0VSSUFMXzgyNTBfTU9YQSBpcyBub3Qgc2V0
CgojCiMgTm9uLTgyNTAgc2VyaWFsIHBvcnQgc3VwcG9ydAojCiMgQ09ORklHX1NFUklBTF9NQVgz
MTAwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX01BWDMxMFggaXMgbm90IHNldAojIENPTkZJ
R19TRVJJQUxfVUFSVExJVEUgaXMgbm90IHNldApDT05GSUdfU0VSSUFMX0NPUkU9eQpDT05GSUdf
U0VSSUFMX0NPUkVfQ09OU09MRT15CkNPTkZJR19TRVJJQUxfSlNNPW0KIyBDT05GSUdfU0VSSUFM
X1NDQ05YUCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9TQzE2SVM3WFggaXMgbm90IHNldAoj
IENPTkZJR19TRVJJQUxfQUxURVJBX0pUQUdVQVJUIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFM
X0FMVEVSQV9VQVJUIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX0lGWDZYNjAgaXMgbm90IHNl
dApDT05GSUdfU0VSSUFMX0FSQz1tCkNPTkZJR19TRVJJQUxfQVJDX05SX1BPUlRTPTEKIyBDT05G
SUdfU0VSSUFMX1JQMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9GU0xfTFBVQVJUIGlzIG5v
dCBzZXQKIyBlbmQgb2YgU2VyaWFsIGRyaXZlcnMKCiMgQ09ORklHX1NFUklBTF9ERVZfQlVTIGlz
IG5vdCBzZXQKIyBDT05GSUdfVFRZX1BSSU5USyBpcyBub3Qgc2V0CkNPTkZJR19QUklOVEVSPW0K
IyBDT05GSUdfTFBfQ09OU09MRSBpcyBub3Qgc2V0CkNPTkZJR19QUERFVj1tCkNPTkZJR19IVkNf
RFJJVkVSPXkKQ09ORklHX0hWQ19JUlE9eQpDT05GSUdfSFZDX1hFTj15CkNPTkZJR19IVkNfWEVO
X0ZST05URU5EPXkKQ09ORklHX1ZJUlRJT19DT05TT0xFPXkKQ09ORklHX0lQTUlfSEFORExFUj1t
CkNPTkZJR19JUE1JX0RNSV9ERUNPREU9eQpDT05GSUdfSVBNSV9QTEFUX0RBVEE9eQojIENPTkZJ
R19JUE1JX1BBTklDX0VWRU5UIGlzIG5vdCBzZXQKQ09ORklHX0lQTUlfREVWSUNFX0lOVEVSRkFD
RT1tCkNPTkZJR19JUE1JX1NJPW0KIyBDT05GSUdfSVBNSV9TU0lGIGlzIG5vdCBzZXQKQ09ORklH
X0lQTUlfV0FUQ0hET0c9bQpDT05GSUdfSVBNSV9QT1dFUk9GRj1tCkNPTkZJR19IV19SQU5ET009
eQpDT05GSUdfSFdfUkFORE9NX1RJTUVSSU9NRU09bQpDT05GSUdfSFdfUkFORE9NX0lOVEVMPW0K
Q09ORklHX0hXX1JBTkRPTV9BTUQ9bQpDT05GSUdfSFdfUkFORE9NX1ZJQT1tCkNPTkZJR19IV19S
QU5ET01fVklSVElPPXkKQ09ORklHX05WUkFNPXkKIyBDT05GSUdfQVBQTElDT00gaXMgbm90IHNl
dAojIENPTkZJR19NV0FWRSBpcyBub3Qgc2V0CkNPTkZJR19SQVdfRFJJVkVSPXkKQ09ORklHX01B
WF9SQVdfREVWUz04MTkyCkNPTkZJR19IUEVUPXkKQ09ORklHX0hQRVRfTU1BUD15CiMgQ09ORklH
X0hQRVRfTU1BUF9ERUZBVUxUIGlzIG5vdCBzZXQKQ09ORklHX0hBTkdDSEVDS19USU1FUj1tCkNP
TkZJR19VVl9NTVRJTUVSPW0KQ09ORklHX1RDR19UUE09eQpDT05GSUdfSFdfUkFORE9NX1RQTT15
CkNPTkZJR19UQ0dfVElTX0NPUkU9eQpDT05GSUdfVENHX1RJUz15CiMgQ09ORklHX1RDR19USVNf
U1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfVENHX1RJU19JMkNfQVRNRUwgaXMgbm90IHNldAojIENP
TkZJR19UQ0dfVElTX0kyQ19JTkZJTkVPTiBpcyBub3Qgc2V0CiMgQ09ORklHX1RDR19USVNfSTJD
X05VVk9UT04gaXMgbm90IHNldApDT05GSUdfVENHX05TQz1tCkNPTkZJR19UQ0dfQVRNRUw9bQpD
T05GSUdfVENHX0lORklORU9OPW0KIyBDT05GSUdfVENHX1hFTiBpcyBub3Qgc2V0CkNPTkZJR19U
Q0dfQ1JCPXkKIyBDT05GSUdfVENHX1ZUUE1fUFJPWFkgaXMgbm90IHNldAojIENPTkZJR19UQ0df
VElTX1NUMzNaUDI0X0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1RDR19USVNfU1QzM1pQMjRfU1BJ
IGlzIG5vdCBzZXQKQ09ORklHX1RFTENMT0NLPW0KQ09ORklHX0RFVlBPUlQ9eQojIENPTkZJR19Y
SUxMWUJVUyBpcyBub3Qgc2V0CiMgZW5kIG9mIENoYXJhY3RlciBkZXZpY2VzCgojIENPTkZJR19S
QU5ET01fVFJVU1RfQ1BVIGlzIG5vdCBzZXQKCiMKIyBJMkMgc3VwcG9ydAojCkNPTkZJR19JMkM9
eQpDT05GSUdfQUNQSV9JMkNfT1BSRUdJT049eQpDT05GSUdfSTJDX0JPQVJESU5GTz15CkNPTkZJ
R19JMkNfQ09NUEFUPXkKQ09ORklHX0kyQ19DSEFSREVWPW0KQ09ORklHX0kyQ19NVVg9bQoKIwoj
IE11bHRpcGxleGVyIEkyQyBDaGlwIHN1cHBvcnQKIwojIENPTkZJR19JMkNfTVVYX0dQSU8gaXMg
bm90IHNldAojIENPTkZJR19JMkNfTVVYX0xUQzQzMDYgaXMgbm90IHNldAojIENPTkZJR19JMkNf
TVVYX1BDQTk1NDEgaXMgbm90IHNldAojIENPTkZJR19JMkNfTVVYX1BDQTk1NHggaXMgbm90IHNl
dAojIENPTkZJR19JMkNfTVVYX1JFRyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19NVVhfTUxYQ1BM
RCBpcyBub3Qgc2V0CiMgZW5kIG9mIE11bHRpcGxleGVyIEkyQyBDaGlwIHN1cHBvcnQKCkNPTkZJ
R19JMkNfSEVMUEVSX0FVVE89eQpDT05GSUdfSTJDX1NNQlVTPXkKQ09ORklHX0kyQ19BTEdPQklU
PXkKQ09ORklHX0kyQ19BTEdPUENBPW0KCiMKIyBJMkMgSGFyZHdhcmUgQnVzIHN1cHBvcnQKIwoK
IwojIFBDIFNNQnVzIGhvc3QgY29udHJvbGxlciBkcml2ZXJzCiMKIyBDT05GSUdfSTJDX0FMSTE1
MzUgaXMgbm90IHNldAojIENPTkZJR19JMkNfQUxJMTU2MyBpcyBub3Qgc2V0CiMgQ09ORklHX0ky
Q19BTEkxNVgzIGlzIG5vdCBzZXQKQ09ORklHX0kyQ19BTUQ3NTY9bQpDT05GSUdfSTJDX0FNRDc1
Nl9TNDg4Mj1tCkNPTkZJR19JMkNfQU1EODExMT1tCiMgQ09ORklHX0kyQ19BTURfTVAyIGlzIG5v
dCBzZXQKQ09ORklHX0kyQ19JODAxPXkKQ09ORklHX0kyQ19JU0NIPW0KQ09ORklHX0kyQ19JU01U
PW0KQ09ORklHX0kyQ19QSUlYND1tCkNPTkZJR19JMkNfTkZPUkNFMj1tCkNPTkZJR19JMkNfTkZP
UkNFMl9TNDk4NT1tCiMgQ09ORklHX0kyQ19OVklESUFfR1BVIGlzIG5vdCBzZXQKIyBDT05GSUdf
STJDX1NJUzU1OTUgaXMgbm90IHNldAojIENPTkZJR19JMkNfU0lTNjMwIGlzIG5vdCBzZXQKQ09O
RklHX0kyQ19TSVM5Nlg9bQpDT05GSUdfSTJDX1ZJQT1tCkNPTkZJR19JMkNfVklBUFJPPW0KCiMK
IyBBQ1BJIGRyaXZlcnMKIwpDT05GSUdfSTJDX1NDTUk9bQoKIwojIEkyQyBzeXN0ZW0gYnVzIGRy
aXZlcnMgKG1vc3RseSBlbWJlZGRlZCAvIHN5c3RlbS1vbi1jaGlwKQojCiMgQ09ORklHX0kyQ19D
QlVTX0dQSU8gaXMgbm90IHNldApDT05GSUdfSTJDX0RFU0lHTldBUkVfQ09SRT1tCkNPTkZJR19J
MkNfREVTSUdOV0FSRV9QTEFURk9STT1tCiMgQ09ORklHX0kyQ19ERVNJR05XQVJFX1NMQVZFIGlz
IG5vdCBzZXQKQ09ORklHX0kyQ19ERVNJR05XQVJFX1BDST1tCiMgQ09ORklHX0kyQ19ERVNJR05X
QVJFX0JBWVRSQUlMIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0VNRVYyIGlzIG5vdCBzZXQKIyBD
T05GSUdfSTJDX0dQSU8gaXMgbm90IHNldAojIENPTkZJR19JMkNfT0NPUkVTIGlzIG5vdCBzZXQK
Q09ORklHX0kyQ19QQ0FfUExBVEZPUk09bQpDT05GSUdfSTJDX1NJTVRFQz1tCiMgQ09ORklHX0ky
Q19YSUxJTlggaXMgbm90IHNldAoKIwojIEV4dGVybmFsIEkyQy9TTUJ1cyBhZGFwdGVyIGRyaXZl
cnMKIwpDT05GSUdfSTJDX0RJT0xBTl9VMkM9bQpDT05GSUdfSTJDX1BBUlBPUlQ9bQpDT05GSUdf
STJDX1BBUlBPUlRfTElHSFQ9bQojIENPTkZJR19JMkNfUk9CT1RGVVpaX09TSUYgaXMgbm90IHNl
dAojIENPTkZJR19JMkNfVEFPU19FVk0gaXMgbm90IHNldApDT05GSUdfSTJDX1RJTllfVVNCPW0K
Q09ORklHX0kyQ19WSVBFUkJPQVJEPW0KCiMKIyBPdGhlciBJMkMvU01CdXMgYnVzIGRyaXZlcnMK
IwojIENPTkZJR19JMkNfTUxYQ1BMRCBpcyBub3Qgc2V0CiMgZW5kIG9mIEkyQyBIYXJkd2FyZSBC
dXMgc3VwcG9ydAoKQ09ORklHX0kyQ19TVFVCPW0KIyBDT05GSUdfSTJDX1NMQVZFIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSTJDX0RFQlVHX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19JMkNfREVCVUdf
QUxHTyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19ERUJVR19CVVMgaXMgbm90IHNldAojIGVuZCBv
ZiBJMkMgc3VwcG9ydAoKIyBDT05GSUdfSTNDIGlzIG5vdCBzZXQKQ09ORklHX1NQST15CiMgQ09O
RklHX1NQSV9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19TUElfTUFTVEVSPXkKIyBDT05GSUdfU1BJ
X01FTSBpcyBub3Qgc2V0CgojCiMgU1BJIE1hc3RlciBDb250cm9sbGVyIERyaXZlcnMKIwojIENP
TkZJR19TUElfQUxURVJBIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX0FYSV9TUElfRU5HSU5FIGlz
IG5vdCBzZXQKIyBDT05GSUdfU1BJX0JJVEJBTkcgaXMgbm90IHNldAojIENPTkZJR19TUElfQlVU
VEVSRkxZIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX0NBREVOQ0UgaXMgbm90IHNldApDT05GSUdf
U1BJX0RFU0lHTldBUkU9bQojIENPTkZJR19TUElfRFdfUENJIGlzIG5vdCBzZXQKIyBDT05GSUdf
U1BJX0RXX01NSU8gaXMgbm90IHNldAojIENPTkZJR19TUElfTlhQX0ZMRVhTUEkgaXMgbm90IHNl
dAojIENPTkZJR19TUElfR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9MTTcwX0xMUCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NQSV9PQ19USU5ZIGlzIG5vdCBzZXQKQ09ORklHX1NQSV9QWEEyWFg9
bQpDT05GSUdfU1BJX1BYQTJYWF9QQ0k9bQojIENPTkZJR19TUElfUk9DS0NISVAgaXMgbm90IHNl
dAojIENPTkZJR19TUElfU0MxOElTNjAyIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX1NJRklWRSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NQSV9NWElDIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX1hDT01N
IGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX1hJTElOWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9a
WU5RTVBfR1FTUEkgaXMgbm90IHNldAoKIwojIFNQSSBQcm90b2NvbCBNYXN0ZXJzCiMKIyBDT05G
SUdfU1BJX1NQSURFViBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9MT09QQkFDS19URVNUIGlzIG5v
dCBzZXQKIyBDT05GSUdfU1BJX1RMRTYyWDAgaXMgbm90IHNldAojIENPTkZJR19TUElfU0xBVkUg
aXMgbm90IHNldAojIENPTkZJR19TUE1JIGlzIG5vdCBzZXQKIyBDT05GSUdfSFNJIGlzIG5vdCBz
ZXQKQ09ORklHX1BQUz15CiMgQ09ORklHX1BQU19ERUJVRyBpcyBub3Qgc2V0CgojCiMgUFBTIGNs
aWVudHMgc3VwcG9ydAojCiMgQ09ORklHX1BQU19DTElFTlRfS1RJTUVSIGlzIG5vdCBzZXQKQ09O
RklHX1BQU19DTElFTlRfTERJU0M9bQpDT05GSUdfUFBTX0NMSUVOVF9QQVJQT1JUPW0KQ09ORklH
X1BQU19DTElFTlRfR1BJTz1tCgojCiMgUFBTIGdlbmVyYXRvcnMgc3VwcG9ydAojCgojCiMgUFRQ
IGNsb2NrIHN1cHBvcnQKIwpDT05GSUdfUFRQXzE1ODhfQ0xPQ0s9eQpDT05GSUdfRFA4MzY0MF9Q
SFk9bQpDT05GSUdfUFRQXzE1ODhfQ0xPQ0tfS1ZNPXkKIyBlbmQgb2YgUFRQIGNsb2NrIHN1cHBv
cnQKCkNPTkZJR19QSU5DVFJMPXkKQ09ORklHX1BJTk1VWD15CkNPTkZJR19QSU5DT05GPXkKQ09O
RklHX0dFTkVSSUNfUElOQ09ORj15CiMgQ09ORklHX0RFQlVHX1BJTkNUUkwgaXMgbm90IHNldAoj
IENPTkZJR19QSU5DVFJMX0FNRCBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfTUNQMjNTMDgg
aXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1NYMTUwWCBpcyBub3Qgc2V0CkNPTkZJR19QSU5D
VFJMX0JBWVRSQUlMPXkKIyBDT05GSUdfUElOQ1RSTF9DSEVSUllWSUVXIGlzIG5vdCBzZXQKIyBD
T05GSUdfUElOQ1RSTF9CUk9YVE9OIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9DQU5OT05M
QUtFIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9DRURBUkZPUksgaXMgbm90IHNldAojIENP
TkZJR19QSU5DVFJMX0RFTlZFUlRPTiBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfR0VNSU5J
TEFLRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfSUNFTEFLRSBpcyBub3Qgc2V0CiMgQ09O
RklHX1BJTkNUUkxfTEVXSVNCVVJHIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9TVU5SSVNF
UE9JTlQgaXMgbm90IHNldApDT05GSUdfR1BJT0xJQj15CkNPTkZJR19HUElPTElCX0ZBU1RQQVRI
X0xJTUlUPTUxMgpDT05GSUdfR1BJT19BQ1BJPXkKQ09ORklHX0dQSU9MSUJfSVJRQ0hJUD15CiMg
Q09ORklHX0RFQlVHX0dQSU8gaXMgbm90IHNldApDT05GSUdfR1BJT19TWVNGUz15CgojCiMgTWVt
b3J5IG1hcHBlZCBHUElPIGRyaXZlcnMKIwojIENPTkZJR19HUElPX0FNRFBUIGlzIG5vdCBzZXQK
IyBDT05GSUdfR1BJT19EV0FQQiBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fRVhBUiBpcyBub3Qg
c2V0CiMgQ09ORklHX0dQSU9fR0VORVJJQ19QTEFURk9STSBpcyBub3Qgc2V0CiMgQ09ORklHX0dQ
SU9fSUNIIGlzIG5vdCBzZXQKQ09ORklHX0dQSU9fTFlOWFBPSU5UPW0KIyBDT05GSUdfR1BJT19N
Qjg2UzdYIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19WWDg1NSBpcyBub3Qgc2V0CiMgQ09ORklH
X0dQSU9fQU1EX0ZDSCBpcyBub3Qgc2V0CiMgZW5kIG9mIE1lbW9yeSBtYXBwZWQgR1BJTyBkcml2
ZXJzCgojCiMgUG9ydC1tYXBwZWQgSS9PIEdQSU8gZHJpdmVycwojCiMgQ09ORklHX0dQSU9fRjcx
ODhYIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19JVDg3IGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJ
T19TQ0ggaXMgbm90IHNldAojIENPTkZJR19HUElPX1NDSDMxMVggaXMgbm90IHNldAojIENPTkZJ
R19HUElPX1dJTkJPTkQgaXMgbm90IHNldAojIENPTkZJR19HUElPX1dTMTZDNDggaXMgbm90IHNl
dAojIGVuZCBvZiBQb3J0LW1hcHBlZCBJL08gR1BJTyBkcml2ZXJzCgojCiMgSTJDIEdQSU8gZXhw
YW5kZXJzCiMKIyBDT05GSUdfR1BJT19BRFA1NTg4IGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19N
QVg3MzAwIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19NQVg3MzJYIGlzIG5vdCBzZXQKIyBDT05G
SUdfR1BJT19QQ0E5NTNYIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19QQ0Y4NTdYIGlzIG5vdCBz
ZXQKIyBDT05GSUdfR1BJT19UUElDMjgxMCBpcyBub3Qgc2V0CiMgZW5kIG9mIEkyQyBHUElPIGV4
cGFuZGVycwoKIwojIE1GRCBHUElPIGV4cGFuZGVycwojCiMgZW5kIG9mIE1GRCBHUElPIGV4cGFu
ZGVycwoKIwojIFBDSSBHUElPIGV4cGFuZGVycwojCiMgQ09ORklHX0dQSU9fQU1EODExMSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0dQSU9fTUxfSU9IIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19QQ0lf
SURJT18xNiBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fUENJRV9JRElPXzI0IGlzIG5vdCBzZXQK
IyBDT05GSUdfR1BJT19SREMzMjFYIGlzIG5vdCBzZXQKIyBlbmQgb2YgUENJIEdQSU8gZXhwYW5k
ZXJzCgojCiMgU1BJIEdQSU8gZXhwYW5kZXJzCiMKIyBDT05GSUdfR1BJT19NQVgzMTkxWCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0dQSU9fTUFYNzMwMSBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fTUMz
Mzg4MCBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fUElTT1NSIGlzIG5vdCBzZXQKIyBDT05GSUdf
R1BJT19YUkExNDAzIGlzIG5vdCBzZXQKIyBlbmQgb2YgU1BJIEdQSU8gZXhwYW5kZXJzCgojCiMg
VVNCIEdQSU8gZXhwYW5kZXJzCiMKIyBDT05GSUdfR1BJT19WSVBFUkJPQVJEIGlzIG5vdCBzZXQK
IyBlbmQgb2YgVVNCIEdQSU8gZXhwYW5kZXJzCgpDT05GSUdfR1BJT19NT0NLVVA9eQojIENPTkZJ
R19XMSBpcyBub3Qgc2V0CiMgQ09ORklHX1BPV0VSX0FWUyBpcyBub3Qgc2V0CkNPTkZJR19QT1dF
Ul9SRVNFVD15CiMgQ09ORklHX1BPV0VSX1JFU0VUX1JFU1RBUlQgaXMgbm90IHNldApDT05GSUdf
UE9XRVJfU1VQUExZPXkKIyBDT05GSUdfUE9XRVJfU1VQUExZX0RFQlVHIGlzIG5vdCBzZXQKIyBD
T05GSUdfUERBX1BPV0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9QT1dFUiBpcyBub3Qgc2V0
CiMgQ09ORklHX0NIQVJHRVJfQURQNTA2MSBpcyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfRFMy
NzgwIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV9EUzI3ODEgaXMgbm90IHNldAojIENPTkZJ
R19CQVRURVJZX0RTMjc4MiBpcyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfU0JTIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQ0hBUkdFUl9TQlMgaXMgbm90IHNldAojIENPTkZJR19NQU5BR0VSX1NCUyBp
cyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfQlEyN1hYWCBpcyBub3Qgc2V0CiMgQ09ORklHX0JB
VFRFUllfTUFYMTcwNDAgaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX01BWDE3MDQyIGlzIG5v
dCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9JU1AxNzA0IGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdF
Ul9NQVg4OTAzIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9MUDg3MjcgaXMgbm90IHNldAoj
IENPTkZJR19DSEFSR0VSX0dQSU8gaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0xUMzY1MSBp
cyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfQlEyNDE1WCBpcyBub3Qgc2V0CiMgQ09ORklHX0NI
QVJHRVJfQlEyNDE5MCBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfQlEyNDI1NyBpcyBub3Qg
c2V0CiMgQ09ORklHX0NIQVJHRVJfQlEyNDczNSBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJf
QlEyNTg5MCBpcyBub3Qgc2V0CkNPTkZJR19DSEFSR0VSX1NNQjM0Nz1tCiMgQ09ORklHX0JBVFRF
UllfR0FVR0VfTFRDMjk0MSBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfUlQ5NDU1IGlzIG5v
dCBzZXQKQ09ORklHX0hXTU9OPXkKQ09ORklHX0hXTU9OX1ZJRD1tCiMgQ09ORklHX0hXTU9OX0RF
QlVHX0NISVAgaXMgbm90IHNldAoKIwojIE5hdGl2ZSBkcml2ZXJzCiMKQ09ORklHX1NFTlNPUlNf
QUJJVFVHVVJVPW0KQ09ORklHX1NFTlNPUlNfQUJJVFVHVVJVMz1tCiMgQ09ORklHX1NFTlNPUlNf
QUQ3MzE0IGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfQUQ3NDE0PW0KQ09ORklHX1NFTlNPUlNf
QUQ3NDE4PW0KQ09ORklHX1NFTlNPUlNfQURNMTAyMT1tCkNPTkZJR19TRU5TT1JTX0FETTEwMjU9
bQpDT05GSUdfU0VOU09SU19BRE0xMDI2PW0KQ09ORklHX1NFTlNPUlNfQURNMTAyOT1tCkNPTkZJ
R19TRU5TT1JTX0FETTEwMzE9bQpDT05GSUdfU0VOU09SU19BRE05MjQwPW0KQ09ORklHX1NFTlNP
UlNfQURUN1gxMD1tCiMgQ09ORklHX1NFTlNPUlNfQURUNzMxMCBpcyBub3Qgc2V0CkNPTkZJR19T
RU5TT1JTX0FEVDc0MTA9bQpDT05GSUdfU0VOU09SU19BRFQ3NDExPW0KQ09ORklHX1NFTlNPUlNf
QURUNzQ2Mj1tCkNPTkZJR19TRU5TT1JTX0FEVDc0NzA9bQpDT05GSUdfU0VOU09SU19BRFQ3NDc1
PW0KQ09ORklHX1NFTlNPUlNfQVNDNzYyMT1tCkNPTkZJR19TRU5TT1JTX0s4VEVNUD1tCkNPTkZJ
R19TRU5TT1JTX0sxMFRFTVA9bQpDT05GSUdfU0VOU09SU19GQU0xNUhfUE9XRVI9bQpDT05GSUdf
U0VOU09SU19BUFBMRVNNQz1tCkNPTkZJR19TRU5TT1JTX0FTQjEwMD1tCiMgQ09ORklHX1NFTlNP
UlNfQVNQRUVEIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfQVRYUDE9bQpDT05GSUdfU0VOU09S
U19EUzYyMD1tCkNPTkZJR19TRU5TT1JTX0RTMTYyMT1tCkNPTkZJR19TRU5TT1JTX0RFTExfU01N
PW0KQ09ORklHX1NFTlNPUlNfSTVLX0FNQj1tCkNPTkZJR19TRU5TT1JTX0Y3MTgwNUY9bQpDT05G
SUdfU0VOU09SU19GNzE4ODJGRz1tCkNPTkZJR19TRU5TT1JTX0Y3NTM3NVM9bQpDT05GSUdfU0VO
U09SU19GU0NITUQ9bQojIENPTkZJR19TRU5TT1JTX0ZUU1RFVVRBVEVTIGlzIG5vdCBzZXQKQ09O
RklHX1NFTlNPUlNfR0w1MThTTT1tCkNPTkZJR19TRU5TT1JTX0dMNTIwU009bQpDT05GSUdfU0VO
U09SU19HNzYwQT1tCiMgQ09ORklHX1NFTlNPUlNfRzc2MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfSElINjEzMCBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0lCTUFFTT1tCkNPTkZJR19T
RU5TT1JTX0lCTVBFWD1tCiMgQ09ORklHX1NFTlNPUlNfSTU1MDAgaXMgbm90IHNldApDT05GSUdf
U0VOU09SU19DT1JFVEVNUD1tCkNPTkZJR19TRU5TT1JTX0lUODc9bQojIENPTkZJR19TRU5TT1JT
X0pDNDIgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1BPV1IxMjIwIGlzIG5vdCBzZXQKQ09O
RklHX1NFTlNPUlNfTElORUFHRT1tCiMgQ09ORklHX1NFTlNPUlNfTFRDMjk0NSBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFTlNPUlNfTFRDMjk5MCBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0xUQzQx
NTE9bQpDT05GSUdfU0VOU09SU19MVEM0MjE1PW0KIyBDT05GSUdfU0VOU09SU19MVEM0MjIyIGlz
IG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfTFRDNDI0NT1tCiMgQ09ORklHX1NFTlNPUlNfTFRDNDI2
MCBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0xUQzQyNjE9bQojIENPTkZJR19TRU5TT1JTX01B
WDExMTEgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19NQVgxNjA2NT1tCkNPTkZJR19TRU5TT1JT
X01BWDE2MTk9bQpDT05GSUdfU0VOU09SU19NQVgxNjY4PW0KQ09ORklHX1NFTlNPUlNfTUFYMTk3
PW0KIyBDT05GSUdfU0VOU09SU19NQVgzMTcyMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNf
TUFYNjYyMSBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX01BWDY2Mzk9bQpDT05GSUdfU0VOU09S
U19NQVg2NjQyPW0KQ09ORklHX1NFTlNPUlNfTUFYNjY1MD1tCkNPTkZJR19TRU5TT1JTX01BWDY2
OTc9bQojIENPTkZJR19TRU5TT1JTX01BWDMxNzkwIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNf
TUNQMzAyMT1tCiMgQ09ORklHX1NFTlNPUlNfVEM2NTQgaXMgbm90IHNldAojIENPTkZJR19TRU5T
T1JTX0FEQ1hYIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfTE02Mz1tCiMgQ09ORklHX1NFTlNP
UlNfTE03MCBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0xNNzM9bQpDT05GSUdfU0VOU09SU19M
TTc1PW0KQ09ORklHX1NFTlNPUlNfTE03Nz1tCkNPTkZJR19TRU5TT1JTX0xNNzg9bQpDT05GSUdf
U0VOU09SU19MTTgwPW0KQ09ORklHX1NFTlNPUlNfTE04Mz1tCkNPTkZJR19TRU5TT1JTX0xNODU9
bQpDT05GSUdfU0VOU09SU19MTTg3PW0KQ09ORklHX1NFTlNPUlNfTE05MD1tCkNPTkZJR19TRU5T
T1JTX0xNOTI9bQpDT05GSUdfU0VOU09SU19MTTkzPW0KQ09ORklHX1NFTlNPUlNfTE05NTIzND1t
CkNPTkZJR19TRU5TT1JTX0xNOTUyNDE9bQpDT05GSUdfU0VOU09SU19MTTk1MjQ1PW0KQ09ORklH
X1NFTlNPUlNfUEM4NzM2MD1tCkNPTkZJR19TRU5TT1JTX1BDODc0Mjc9bQpDT05GSUdfU0VOU09S
U19OVENfVEhFUk1JU1RPUj1tCiMgQ09ORklHX1NFTlNPUlNfTkNUNjY4MyBpcyBub3Qgc2V0CkNP
TkZJR19TRU5TT1JTX05DVDY3NzU9bQojIENPTkZJR19TRU5TT1JTX05DVDc4MDIgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX05DVDc5MDQgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX05Q
Q003WFggaXMgbm90IHNldApDT05GSUdfU0VOU09SU19QQ0Y4NTkxPW0KQ09ORklHX1BNQlVTPW0K
Q09ORklHX1NFTlNPUlNfUE1CVVM9bQpDT05GSUdfU0VOU09SU19BRE0xMjc1PW0KIyBDT05GSUdf
U0VOU09SU19JQk1fQ0ZGUFMgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0lSMzUyMjEgaXMg
bm90IHNldAojIENPTkZJR19TRU5TT1JTX0lSMzgwNjQgaXMgbm90IHNldAojIENPTkZJR19TRU5T
T1JTX0lTTDY4MTM3IGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfTE0yNTA2Nj1tCkNPTkZJR19T
RU5TT1JTX0xUQzI5Nzg9bQojIENPTkZJR19TRU5TT1JTX0xUQzM4MTUgaXMgbm90IHNldApDT05G
SUdfU0VOU09SU19NQVgxNjA2ND1tCiMgQ09ORklHX1NFTlNPUlNfTUFYMjA3NTEgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX01BWDMxNzg1IGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfTUFY
MzQ0NDA9bQpDT05GSUdfU0VOU09SU19NQVg4Njg4PW0KIyBDT05GSUdfU0VOU09SU19UUFM0MDQy
MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVFBTNTM2NzkgaXMgbm90IHNldApDT05GSUdf
U0VOU09SU19VQ0Q5MDAwPW0KQ09ORklHX1NFTlNPUlNfVUNEOTIwMD1tCkNPTkZJR19TRU5TT1JT
X1pMNjEwMD1tCiMgQ09ORklHX1NFTlNPUlNfU0hUMTUgaXMgbm90IHNldApDT05GSUdfU0VOU09S
U19TSFQyMT1tCiMgQ09ORklHX1NFTlNPUlNfU0hUM3ggaXMgbm90IHNldAojIENPTkZJR19TRU5T
T1JTX1NIVEMxIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfU0lTNTU5NT1tCkNPTkZJR19TRU5T
T1JTX0RNRTE3Mzc9bQpDT05GSUdfU0VOU09SU19FTUMxNDAzPW0KIyBDT05GSUdfU0VOU09SU19F
TUMyMTAzIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfRU1DNlcyMDE9bQpDT05GSUdfU0VOU09S
U19TTVNDNDdNMT1tCkNPTkZJR19TRU5TT1JTX1NNU0M0N00xOTI9bQpDT05GSUdfU0VOU09SU19T
TVNDNDdCMzk3PW0KQ09ORklHX1NFTlNPUlNfU0NINTZYWF9DT01NT049bQpDT05GSUdfU0VOU09S
U19TQ0g1NjI3PW0KQ09ORklHX1NFTlNPUlNfU0NINTYzNj1tCiMgQ09ORklHX1NFTlNPUlNfU1RU
Uzc1MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU01NNjY1IGlzIG5vdCBzZXQKIyBDT05G
SUdfU0VOU09SU19BREMxMjhEODE4IGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfQURTMTAxNT1t
CkNPTkZJR19TRU5TT1JTX0FEUzc4Mjg9bQojIENPTkZJR19TRU5TT1JTX0FEUzc4NzEgaXMgbm90
IHNldApDT05GSUdfU0VOU09SU19BTUM2ODIxPW0KQ09ORklHX1NFTlNPUlNfSU5BMjA5PW0KQ09O
RklHX1NFTlNPUlNfSU5BMlhYPW0KIyBDT05GSUdfU0VOU09SU19JTkEzMjIxIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0VOU09SU19UQzc0IGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfVEhNQzUwPW0K
Q09ORklHX1NFTlNPUlNfVE1QMTAyPW0KIyBDT05GSUdfU0VOU09SU19UTVAxMDMgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX1RNUDEwOCBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX1RNUDQw
MT1tCkNPTkZJR19TRU5TT1JTX1RNUDQyMT1tCkNPTkZJR19TRU5TT1JTX1ZJQV9DUFVURU1QPW0K
Q09ORklHX1NFTlNPUlNfVklBNjg2QT1tCkNPTkZJR19TRU5TT1JTX1ZUMTIxMT1tCkNPTkZJR19T
RU5TT1JTX1ZUODIzMT1tCiMgQ09ORklHX1NFTlNPUlNfVzgzNzczRyBpcyBub3Qgc2V0CkNPTkZJ
R19TRU5TT1JTX1c4Mzc4MUQ9bQpDT05GSUdfU0VOU09SU19XODM3OTFEPW0KQ09ORklHX1NFTlNP
UlNfVzgzNzkyRD1tCkNPTkZJR19TRU5TT1JTX1c4Mzc5Mz1tCkNPTkZJR19TRU5TT1JTX1c4Mzc5
NT1tCiMgQ09ORklHX1NFTlNPUlNfVzgzNzk1X0ZBTkNUUkwgaXMgbm90IHNldApDT05GSUdfU0VO
U09SU19XODNMNzg1VFM9bQpDT05GSUdfU0VOU09SU19XODNMNzg2Tkc9bQpDT05GSUdfU0VOU09S
U19XODM2MjdIRj1tCkNPTkZJR19TRU5TT1JTX1c4MzYyN0VIRj1tCiMgQ09ORklHX1NFTlNPUlNf
WEdFTkUgaXMgbm90IHNldAoKIwojIEFDUEkgZHJpdmVycwojCkNPTkZJR19TRU5TT1JTX0FDUElf
UE9XRVI9bQpDT05GSUdfU0VOU09SU19BVEswMTEwPW0KQ09ORklHX1RIRVJNQUw9eQojIENPTkZJ
R19USEVSTUFMX1NUQVRJU1RJQ1MgaXMgbm90IHNldApDT05GSUdfVEhFUk1BTF9FTUVSR0VOQ1lf
UE9XRVJPRkZfREVMQVlfTVM9MApDT05GSUdfVEhFUk1BTF9IV01PTj15CkNPTkZJR19USEVSTUFM
X1dSSVRBQkxFX1RSSVBTPXkKQ09ORklHX1RIRVJNQUxfREVGQVVMVF9HT1ZfU1RFUF9XSVNFPXkK
IyBDT05GSUdfVEhFUk1BTF9ERUZBVUxUX0dPVl9GQUlSX1NIQVJFIGlzIG5vdCBzZXQKIyBDT05G
SUdfVEhFUk1BTF9ERUZBVUxUX0dPVl9VU0VSX1NQQUNFIGlzIG5vdCBzZXQKIyBDT05GSUdfVEhF
Uk1BTF9ERUZBVUxUX0dPVl9QT1dFUl9BTExPQ0FUT1IgaXMgbm90IHNldApDT05GSUdfVEhFUk1B
TF9HT1ZfRkFJUl9TSEFSRT15CkNPTkZJR19USEVSTUFMX0dPVl9TVEVQX1dJU0U9eQpDT05GSUdf
VEhFUk1BTF9HT1ZfQkFOR19CQU5HPXkKQ09ORklHX1RIRVJNQUxfR09WX1VTRVJfU1BBQ0U9eQoj
IENPTkZJR19USEVSTUFMX0dPVl9QT1dFUl9BTExPQ0FUT1IgaXMgbm90IHNldAojIENPTkZJR19D
TE9DS19USEVSTUFMIGlzIG5vdCBzZXQKIyBDT05GSUdfREVWRlJFUV9USEVSTUFMIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVEhFUk1BTF9FTVVMQVRJT04gaXMgbm90IHNldAoKIwojIEludGVsIHRoZXJt
YWwgZHJpdmVycwojCkNPTkZJR19JTlRFTF9QT1dFUkNMQU1QPW0KQ09ORklHX1g4Nl9QS0dfVEVN
UF9USEVSTUFMPW0KIyBDT05GSUdfSU5URUxfU09DX0RUU19USEVSTUFMIGlzIG5vdCBzZXQKCiMK
IyBBQ1BJIElOVDM0MFggdGhlcm1hbCBkcml2ZXJzCiMKIyBDT05GSUdfSU5UMzQwWF9USEVSTUFM
IGlzIG5vdCBzZXQKIyBlbmQgb2YgQUNQSSBJTlQzNDBYIHRoZXJtYWwgZHJpdmVycwoKQ09ORklH
X0lOVEVMX1BDSF9USEVSTUFMPW0KIyBlbmQgb2YgSW50ZWwgdGhlcm1hbCBkcml2ZXJzCgpDT05G
SUdfV0FUQ0hET0c9eQpDT05GSUdfV0FUQ0hET0dfQ09SRT15CiMgQ09ORklHX1dBVENIRE9HX05P
V0FZT1VUIGlzIG5vdCBzZXQKQ09ORklHX1dBVENIRE9HX0hBTkRMRV9CT09UX0VOQUJMRUQ9eQoj
IENPTkZJR19XQVRDSERPR19TWVNGUyBpcyBub3Qgc2V0CgojCiMgV2F0Y2hkb2cgUHJldGltZW91
dCBHb3Zlcm5vcnMKIwojIENPTkZJR19XQVRDSERPR19QUkVUSU1FT1VUX0dPViBpcyBub3Qgc2V0
CgojCiMgV2F0Y2hkb2cgRGV2aWNlIERyaXZlcnMKIwpDT05GSUdfU09GVF9XQVRDSERPRz1tCkNP
TkZJR19XREFUX1dEVD1tCiMgQ09ORklHX1hJTElOWF9XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09O
RklHX1pJSVJBVkVfV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19DQURFTkNFX1dBVENIRE9H
IGlzIG5vdCBzZXQKIyBDT05GSUdfRFdfV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19NQVg2
M1hYX1dBVENIRE9HIGlzIG5vdCBzZXQKIyBDT05GSUdfQUNRVUlSRV9XRFQgaXMgbm90IHNldAoj
IENPTkZJR19BRFZBTlRFQ0hfV0RUIGlzIG5vdCBzZXQKQ09ORklHX0FMSU0xNTM1X1dEVD1tCkNP
TkZJR19BTElNNzEwMV9XRFQ9bQojIENPTkZJR19FQkNfQzM4NF9XRFQgaXMgbm90IHNldApDT05G
SUdfRjcxODA4RV9XRFQ9bQpDT05GSUdfU1A1MTAwX1RDTz1tCkNPTkZJR19TQkNfRklUUEMyX1dB
VENIRE9HPW0KIyBDT05GSUdfRVVST1RFQ0hfV0RUIGlzIG5vdCBzZXQKQ09ORklHX0lCNzAwX1dE
VD1tCkNPTkZJR19JQk1BU1I9bQojIENPTkZJR19XQUZFUl9XRFQgaXMgbm90IHNldApDT05GSUdf
STYzMDBFU0JfV0RUPXkKQ09ORklHX0lFNlhYX1dEVD1tCkNPTkZJR19JVENPX1dEVD15CkNPTkZJ
R19JVENPX1ZFTkRPUl9TVVBQT1JUPXkKQ09ORklHX0lUODcxMkZfV0RUPW0KQ09ORklHX0lUODdf
V0RUPW0KQ09ORklHX0hQX1dBVENIRE9HPW0KQ09ORklHX0hQV0RUX05NSV9ERUNPRElORz15CiMg
Q09ORklHX1NDMTIwMF9XRFQgaXMgbm90IHNldAojIENPTkZJR19QQzg3NDEzX1dEVCBpcyBub3Qg
c2V0CkNPTkZJR19OVl9UQ089bQojIENPTkZJR182MFhYX1dEVCBpcyBub3Qgc2V0CiMgQ09ORklH
X0NQVTVfV0RUIGlzIG5vdCBzZXQKQ09ORklHX1NNU0NfU0NIMzExWF9XRFQ9bQojIENPTkZJR19T
TVNDMzdCNzg3X1dEVCBpcyBub3Qgc2V0CiMgQ09ORklHX1RRTVg4Nl9XRFQgaXMgbm90IHNldApD
T05GSUdfVklBX1dEVD1tCkNPTkZJR19XODM2MjdIRl9XRFQ9bQpDT05GSUdfVzgzODc3Rl9XRFQ9
bQpDT05GSUdfVzgzOTc3Rl9XRFQ9bQpDT05GSUdfTUFDSFpfV0RUPW0KIyBDT05GSUdfU0JDX0VQ
WF9DM19XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVMX01FSV9XRFQgaXMgbm90IHNl
dAojIENPTkZJR19OSTkwM1hfV0RUIGlzIG5vdCBzZXQKIyBDT05GSUdfTklDNzAxOF9XRFQgaXMg
bm90IHNldAojIENPTkZJR19NRU5fQTIxX1dEVCBpcyBub3Qgc2V0CkNPTkZJR19YRU5fV0RUPW0K
CiMKIyBQQ0ktYmFzZWQgV2F0Y2hkb2cgQ2FyZHMKIwpDT05GSUdfUENJUENXQVRDSERPRz1tCkNP
TkZJR19XRFRQQ0k9bQoKIwojIFVTQi1iYXNlZCBXYXRjaGRvZyBDYXJkcwojCkNPTkZJR19VU0JQ
Q1dBVENIRE9HPW0KQ09ORklHX1NTQl9QT1NTSUJMRT15CkNPTkZJR19TU0I9bQpDT05GSUdfU1NC
X1NQUk9NPXkKQ09ORklHX1NTQl9QQ0lIT1NUX1BPU1NJQkxFPXkKQ09ORklHX1NTQl9QQ0lIT1NU
PXkKQ09ORklHX1NTQl9TRElPSE9TVF9QT1NTSUJMRT15CkNPTkZJR19TU0JfU0RJT0hPU1Q9eQpD
T05GSUdfU1NCX0RSSVZFUl9QQ0lDT1JFX1BPU1NJQkxFPXkKQ09ORklHX1NTQl9EUklWRVJfUENJ
Q09SRT15CiMgQ09ORklHX1NTQl9EUklWRVJfR1BJTyBpcyBub3Qgc2V0CkNPTkZJR19CQ01BX1BP
U1NJQkxFPXkKQ09ORklHX0JDTUE9bQpDT05GSUdfQkNNQV9IT1NUX1BDSV9QT1NTSUJMRT15CkNP
TkZJR19CQ01BX0hPU1RfUENJPXkKIyBDT05GSUdfQkNNQV9IT1NUX1NPQyBpcyBub3Qgc2V0CkNP
TkZJR19CQ01BX0RSSVZFUl9QQ0k9eQpDT05GSUdfQkNNQV9EUklWRVJfR01BQ19DTU49eQojIENP
TkZJR19CQ01BX0RSSVZFUl9HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfQkNNQV9ERUJVRyBpcyBu
b3Qgc2V0CgojCiMgTXVsdGlmdW5jdGlvbiBkZXZpY2UgZHJpdmVycwojCkNPTkZJR19NRkRfQ09S
RT15CiMgQ09ORklHX01GRF9BUzM3MTEgaXMgbm90IHNldAojIENPTkZJR19QTUlDX0FEUDU1MjAg
aXMgbm90IHNldAojIENPTkZJR19NRkRfQUFUMjg3MF9DT1JFIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUZEX0JDTTU5MFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0JEOTU3MU1XViBpcyBub3Qgc2V0
CiMgQ09ORklHX01GRF9BWFAyMFhfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0NST1NfRUMg
aXMgbm90IHNldAojIENPTkZJR19NRkRfTUFERVJBIGlzIG5vdCBzZXQKIyBDT05GSUdfUE1JQ19E
QTkwM1ggaXMgbm90IHNldAojIENPTkZJR19NRkRfREE5MDUyX1NQSSBpcyBub3Qgc2V0CiMgQ09O
RklHX01GRF9EQTkwNTJfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0RBOTA1NSBpcyBub3Qg
c2V0CiMgQ09ORklHX01GRF9EQTkwNjIgaXMgbm90IHNldAojIENPTkZJR19NRkRfREE5MDYzIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEX0RBOTE1MCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9ETE4y
IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX01DMTNYWFhfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUZEX01DMTNYWFhfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfSFRDX1BBU0lDMyBpcyBub3Qgc2V0
CiMgQ09ORklHX0hUQ19JMkNQTEQgaXMgbm90IHNldAojIENPTkZJR19NRkRfSU5URUxfUVVBUktf
STJDX0dQSU8gaXMgbm90IHNldApDT05GSUdfTFBDX0lDSD15CkNPTkZJR19MUENfU0NIPW0KIyBD
T05GSUdfSU5URUxfU09DX1BNSUNfQ0hURENfVEkgaXMgbm90IHNldAojIENPTkZJR19NRkRfSU5U
RUxfTFBTU19BQ1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0lOVEVMX0xQU1NfUENJIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUZEX0pBTlpfQ01PRElPIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0tF
TVBMRCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF84OFBNODAwIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUZEXzg4UE04MDUgaXMgbm90IHNldAojIENPTkZJR19NRkRfODhQTTg2MFggaXMgbm90IHNldAoj
IENPTkZJR19NRkRfTUFYMTQ1NzcgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYNzc2OTMgaXMg
bm90IHNldAojIENPTkZJR19NRkRfTUFYNzc4NDMgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFY
ODkwNyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NQVg4OTI1IGlzIG5vdCBzZXQKIyBDT05GSUdf
TUZEX01BWDg5OTcgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYODk5OCBpcyBub3Qgc2V0CiMg
Q09ORklHX01GRF9NVDYzOTcgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUVORjIxQk1DIGlzIG5v
dCBzZXQKIyBDT05GSUdfRVpYX1BDQVAgaXMgbm90IHNldApDT05GSUdfTUZEX1ZJUEVSQk9BUkQ9
bQojIENPTkZJR19NRkRfUkVUVSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9QQ0Y1MDYzMyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1VDQjE0MDBfQ09SRSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9SREMz
MjFYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1JUNTAzMyBpcyBub3Qgc2V0CiMgQ09ORklHX01G
RF9SQzVUNTgzIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NFQ19DT1JFIGlzIG5vdCBzZXQKIyBD
T05GSUdfTUZEX1NJNDc2WF9DT1JFIGlzIG5vdCBzZXQKQ09ORklHX01GRF9TTTUwMT1tCiMgQ09O
RklHX01GRF9TTTUwMV9HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NLWTgxNDUyIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUZEX1NNU0MgaXMgbm90IHNldAojIENPTkZJR19BQlg1MDBfQ09SRSBp
cyBub3Qgc2V0CiMgQ09ORklHX01GRF9TWVNDT04gaXMgbm90IHNldAojIENPTkZJR19NRkRfVElf
QU0zMzVYX1RTQ0FEQyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9MUDM5NDMgaXMgbm90IHNldAoj
IENPTkZJR19NRkRfTFA4Nzg4IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RJX0xNVSBpcyBub3Qg
c2V0CiMgQ09ORklHX01GRF9QQUxNQVMgaXMgbm90IHNldAojIENPTkZJR19UUFM2MTA1WCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RQUzY1MDEwIGlzIG5vdCBzZXQKIyBDT05GSUdfVFBTNjUwN1ggaXMg
bm90IHNldAojIENPTkZJR19NRkRfVFBTNjUwODYgaXMgbm90IHNldAojIENPTkZJR19NRkRfVFBT
NjUwOTAgaXMgbm90IHNldAojIENPTkZJR19NRkRfVElfTFA4NzNYIGlzIG5vdCBzZXQKIyBDT05G
SUdfTUZEX1RQUzY1ODZYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RQUzY1OTEwIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTUZEX1RQUzY1OTEyX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9UUFM2
NTkxMl9TUEkgaXMgbm90IHNldAojIENPTkZJR19NRkRfVFBTODAwMzEgaXMgbm90IHNldAojIENP
TkZJR19UV0w0MDMwX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19UV0w2MDQwX0NPUkUgaXMgbm90
IHNldAojIENPTkZJR19NRkRfV0wxMjczX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19NRkRfTE0z
NTMzIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RRTVg4NiBpcyBub3Qgc2V0CkNPTkZJR19NRkRf
Vlg4NTU9bQojIENPTkZJR19NRkRfQVJJWk9OQV9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRf
QVJJWk9OQV9TUEkgaXMgbm90IHNldAojIENPTkZJR19NRkRfV004NDAwIGlzIG5vdCBzZXQKIyBD
T05GSUdfTUZEX1dNODMxWF9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfV004MzFYX1NQSSBp
cyBub3Qgc2V0CiMgQ09ORklHX01GRF9XTTgzNTBfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZE
X1dNODk5NCBpcyBub3Qgc2V0CiMgZW5kIG9mIE11bHRpZnVuY3Rpb24gZGV2aWNlIGRyaXZlcnMK
CiMgQ09ORklHX1JFR1VMQVRPUiBpcyBub3Qgc2V0CkNPTkZJR19SQ19DT1JFPW0KQ09ORklHX1JD
X01BUD1tCkNPTkZJR19MSVJDPXkKQ09ORklHX1JDX0RFQ09ERVJTPXkKQ09ORklHX0lSX05FQ19E
RUNPREVSPW0KQ09ORklHX0lSX1JDNV9ERUNPREVSPW0KQ09ORklHX0lSX1JDNl9ERUNPREVSPW0K
Q09ORklHX0lSX0pWQ19ERUNPREVSPW0KQ09ORklHX0lSX1NPTllfREVDT0RFUj1tCkNPTkZJR19J
Ul9TQU5ZT19ERUNPREVSPW0KQ09ORklHX0lSX1NIQVJQX0RFQ09ERVI9bQpDT05GSUdfSVJfTUNF
X0tCRF9ERUNPREVSPW0KQ09ORklHX0lSX1hNUF9ERUNPREVSPW0KIyBDT05GSUdfSVJfSU1PTl9E
RUNPREVSIGlzIG5vdCBzZXQKIyBDT05GSUdfSVJfUkNNTV9ERUNPREVSIGlzIG5vdCBzZXQKQ09O
RklHX1JDX0RFVklDRVM9eQpDT05GSUdfUkNfQVRJX1JFTU9URT1tCkNPTkZJR19JUl9FTkU9bQpD
T05GSUdfSVJfSU1PTj1tCiMgQ09ORklHX0lSX0lNT05fUkFXIGlzIG5vdCBzZXQKQ09ORklHX0lS
X01DRVVTQj1tCkNPTkZJR19JUl9JVEVfQ0lSPW0KQ09ORklHX0lSX0ZJTlRFSz1tCkNPTkZJR19J
Ul9OVVZPVE9OPW0KQ09ORklHX0lSX1JFRFJBVDM9bQpDT05GSUdfSVJfU1RSRUFNWkFQPW0KQ09O
RklHX0lSX1dJTkJPTkRfQ0lSPW0KIyBDT05GSUdfSVJfSUdPUlBMVUdVU0IgaXMgbm90IHNldApD
T05GSUdfSVJfSUdVQU5BPW0KQ09ORklHX0lSX1RUVVNCSVI9bQpDT05GSUdfUkNfTE9PUEJBQ0s9
bQojIENPTkZJR19JUl9TRVJJQUwgaXMgbm90IHNldAojIENPTkZJR19JUl9TSVIgaXMgbm90IHNl
dAojIENPTkZJR19SQ19YQk9YX0RWRCBpcyBub3Qgc2V0CkNPTkZJR19NRURJQV9TVVBQT1JUPW0K
CiMKIyBNdWx0aW1lZGlhIGNvcmUgc3VwcG9ydAojCkNPTkZJR19NRURJQV9DQU1FUkFfU1VQUE9S
VD15CkNPTkZJR19NRURJQV9BTkFMT0dfVFZfU1VQUE9SVD15CkNPTkZJR19NRURJQV9ESUdJVEFM
X1RWX1NVUFBPUlQ9eQpDT05GSUdfTUVESUFfUkFESU9fU1VQUE9SVD15CiMgQ09ORklHX01FRElB
X1NEUl9TVVBQT1JUIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVESUFfQ0VDX1NVUFBPUlQgaXMgbm90
IHNldApDT05GSUdfTUVESUFfQ09OVFJPTExFUj15CkNPTkZJR19NRURJQV9DT05UUk9MTEVSX0RW
Qj15CkNPTkZJR19WSURFT19ERVY9bQojIENPTkZJR19WSURFT19WNEwyX1NVQkRFVl9BUEkgaXMg
bm90IHNldApDT05GSUdfVklERU9fVjRMMj1tCiMgQ09ORklHX1ZJREVPX0FEVl9ERUJVRyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1ZJREVPX0ZJWEVEX01JTk9SX1JBTkdFUyBpcyBub3Qgc2V0CkNPTkZJ
R19WSURFT19UVU5FUj1tCkNPTkZJR19WSURFT0JVRl9HRU49bQpDT05GSUdfVklERU9CVUZfRE1B
X1NHPW0KQ09ORklHX1ZJREVPQlVGX1ZNQUxMT0M9bQpDT05GSUdfRFZCX0NPUkU9bQojIENPTkZJ
R19EVkJfTU1BUCBpcyBub3Qgc2V0CkNPTkZJR19EVkJfTkVUPXkKQ09ORklHX1RUUENJX0VFUFJP
TT1tCkNPTkZJR19EVkJfTUFYX0FEQVBURVJTPTgKQ09ORklHX0RWQl9EWU5BTUlDX01JTk9SUz15
CiMgQ09ORklHX0RWQl9ERU1VWF9TRUNUSU9OX0xPU1NfTE9HIGlzIG5vdCBzZXQKIyBDT05GSUdf
RFZCX1VMRV9ERUJVRyBpcyBub3Qgc2V0CgojCiMgTWVkaWEgZHJpdmVycwojCkNPTkZJR19NRURJ
QV9VU0JfU1VQUE9SVD15CgojCiMgV2ViY2FtIGRldmljZXMKIwpDT05GSUdfVVNCX1ZJREVPX0NM
QVNTPW0KQ09ORklHX1VTQl9WSURFT19DTEFTU19JTlBVVF9FVkRFVj15CkNPTkZJR19VU0JfR1NQ
Q0E9bQpDT05GSUdfVVNCX001NjAyPW0KQ09ORklHX1VTQl9TVFYwNlhYPW0KQ09ORklHX1VTQl9H
TDg2MD1tCkNPTkZJR19VU0JfR1NQQ0FfQkVOUT1tCkNPTkZJR19VU0JfR1NQQ0FfQ09ORVg9bQpD
T05GSUdfVVNCX0dTUENBX0NQSUExPW0KIyBDT05GSUdfVVNCX0dTUENBX0RUQ1MwMzMgaXMgbm90
IHNldApDT05GSUdfVVNCX0dTUENBX0VUT01TPW0KQ09ORklHX1VTQl9HU1BDQV9GSU5FUElYPW0K
Q09ORklHX1VTQl9HU1BDQV9KRUlMSU5KPW0KQ09ORklHX1VTQl9HU1BDQV9KTDIwMDVCQ0Q9bQoj
IENPTkZJR19VU0JfR1NQQ0FfS0lORUNUIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9HU1BDQV9LT05J
Q0E9bQpDT05GSUdfVVNCX0dTUENBX01BUlM9bQpDT05GSUdfVVNCX0dTUENBX01SOTczMTBBPW0K
Q09ORklHX1VTQl9HU1BDQV9OVzgwWD1tCkNPTkZJR19VU0JfR1NQQ0FfT1Y1MTk9bQpDT05GSUdf
VVNCX0dTUENBX09WNTM0PW0KQ09ORklHX1VTQl9HU1BDQV9PVjUzNF85PW0KQ09ORklHX1VTQl9H
U1BDQV9QQUMyMDc9bQpDT05GSUdfVVNCX0dTUENBX1BBQzczMDI9bQpDT05GSUdfVVNCX0dTUENB
X1BBQzczMTE9bQpDT05GSUdfVVNCX0dTUENBX1NFNDAxPW0KQ09ORklHX1VTQl9HU1BDQV9TTjlD
MjAyOD1tCkNPTkZJR19VU0JfR1NQQ0FfU045QzIwWD1tCkNPTkZJR19VU0JfR1NQQ0FfU09OSVhC
PW0KQ09ORklHX1VTQl9HU1BDQV9TT05JWEo9bQpDT05GSUdfVVNCX0dTUENBX1NQQ0E1MDA9bQpD
T05GSUdfVVNCX0dTUENBX1NQQ0E1MDE9bQpDT05GSUdfVVNCX0dTUENBX1NQQ0E1MDU9bQpDT05G
SUdfVVNCX0dTUENBX1NQQ0E1MDY9bQpDT05GSUdfVVNCX0dTUENBX1NQQ0E1MDg9bQpDT05GSUdf
VVNCX0dTUENBX1NQQ0E1NjE9bQpDT05GSUdfVVNCX0dTUENBX1NQQ0ExNTI4PW0KQ09ORklHX1VT
Ql9HU1BDQV9TUTkwNT1tCkNPTkZJR19VU0JfR1NQQ0FfU1E5MDVDPW0KQ09ORklHX1VTQl9HU1BD
QV9TUTkzMFg9bQpDT05GSUdfVVNCX0dTUENBX1NUSzAxND1tCiMgQ09ORklHX1VTQl9HU1BDQV9T
VEsxMTM1IGlzIG5vdCBzZXQKQ09ORklHX1VTQl9HU1BDQV9TVFYwNjgwPW0KQ09ORklHX1VTQl9H
U1BDQV9TVU5QTFVTPW0KQ09ORklHX1VTQl9HU1BDQV9UNjEzPW0KQ09ORklHX1VTQl9HU1BDQV9U
T1BSTz1tCiMgQ09ORklHX1VTQl9HU1BDQV9UT1VQVEVLIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9H
U1BDQV9UVjg1MzI9bQpDT05GSUdfVVNCX0dTUENBX1ZDMDMyWD1tCkNPTkZJR19VU0JfR1NQQ0Ff
VklDQU09bQpDT05GSUdfVVNCX0dTUENBX1hJUkxJTktfQ0lUPW0KQ09ORklHX1VTQl9HU1BDQV9a
QzNYWD1tCkNPTkZJR19VU0JfUFdDPW0KIyBDT05GSUdfVVNCX1BXQ19ERUJVRyBpcyBub3Qgc2V0
CkNPTkZJR19VU0JfUFdDX0lOUFVUX0VWREVWPXkKIyBDT05GSUdfVklERU9fQ1BJQTIgaXMgbm90
IHNldApDT05GSUdfVVNCX1pSMzY0WFg9bQpDT05GSUdfVVNCX1NUS1dFQkNBTT1tCkNPTkZJR19V
U0JfUzIyNTU9bQojIENPTkZJR19WSURFT19VU0JUViBpcyBub3Qgc2V0CgojCiMgQW5hbG9nIFRW
IFVTQiBkZXZpY2VzCiMKQ09ORklHX1ZJREVPX1BWUlVTQjI9bQpDT05GSUdfVklERU9fUFZSVVNC
Ml9TWVNGUz15CkNPTkZJR19WSURFT19QVlJVU0IyX0RWQj15CiMgQ09ORklHX1ZJREVPX1BWUlVT
QjJfREVCVUdJRkMgaXMgbm90IHNldApDT05GSUdfVklERU9fSERQVlI9bQpDT05GSUdfVklERU9f
VVNCVklTSU9OPW0KIyBDT05GSUdfVklERU9fU1RLMTE2MF9DT01NT04gaXMgbm90IHNldAojIENP
TkZJR19WSURFT19HTzcwMDcgaXMgbm90IHNldAoKIwojIEFuYWxvZy9kaWdpdGFsIFRWIFVTQiBk
ZXZpY2VzCiMKQ09ORklHX1ZJREVPX0FVMDgyOD1tCkNPTkZJR19WSURFT19BVTA4MjhfVjRMMj15
CiMgQ09ORklHX1ZJREVPX0FVMDgyOF9SQyBpcyBub3Qgc2V0CkNPTkZJR19WSURFT19DWDIzMVhY
PW0KQ09ORklHX1ZJREVPX0NYMjMxWFhfUkM9eQpDT05GSUdfVklERU9fQ1gyMzFYWF9BTFNBPW0K
Q09ORklHX1ZJREVPX0NYMjMxWFhfRFZCPW0KQ09ORklHX1ZJREVPX1RNNjAwMD1tCkNPTkZJR19W
SURFT19UTTYwMDBfQUxTQT1tCkNPTkZJR19WSURFT19UTTYwMDBfRFZCPW0KCiMKIyBEaWdpdGFs
IFRWIFVTQiBkZXZpY2VzCiMKQ09ORklHX0RWQl9VU0I9bQojIENPTkZJR19EVkJfVVNCX0RFQlVH
IGlzIG5vdCBzZXQKQ09ORklHX0RWQl9VU0JfRElCMzAwME1DPW0KQ09ORklHX0RWQl9VU0JfQTgw
MD1tCkNPTkZJR19EVkJfVVNCX0RJQlVTQl9NQj1tCiMgQ09ORklHX0RWQl9VU0JfRElCVVNCX01C
X0ZBVUxUWSBpcyBub3Qgc2V0CkNPTkZJR19EVkJfVVNCX0RJQlVTQl9NQz1tCkNPTkZJR19EVkJf
VVNCX0RJQjA3MDA9bQpDT05GSUdfRFZCX1VTQl9VTVRfMDEwPW0KQ09ORklHX0RWQl9VU0JfQ1hV
U0I9bQpDT05GSUdfRFZCX1VTQl9NOTIwWD1tCkNPTkZJR19EVkJfVVNCX0RJR0lUVj1tCkNPTkZJ
R19EVkJfVVNCX1ZQNzA0NT1tCkNPTkZJR19EVkJfVVNCX1ZQNzAyWD1tCkNPTkZJR19EVkJfVVNC
X0dQOFBTSz1tCkNPTkZJR19EVkJfVVNCX05PVkFfVF9VU0IyPW0KQ09ORklHX0RWQl9VU0JfVFRV
U0IyPW0KQ09ORklHX0RWQl9VU0JfRFRUMjAwVT1tCkNPTkZJR19EVkJfVVNCX09QRVJBMT1tCkNP
TkZJR19EVkJfVVNCX0FGOTAwNT1tCkNPTkZJR19EVkJfVVNCX0FGOTAwNV9SRU1PVEU9bQpDT05G
SUdfRFZCX1VTQl9QQ1RWNDUyRT1tCkNPTkZJR19EVkJfVVNCX0RXMjEwMj1tCkNPTkZJR19EVkJf
VVNCX0NJTkVSR1lfVDI9bQpDT05GSUdfRFZCX1VTQl9EVFY1MTAwPW0KQ09ORklHX0RWQl9VU0Jf
QVo2MDI3PW0KQ09ORklHX0RWQl9VU0JfVEVDSE5JU0FUX1VTQjI9bQpDT05GSUdfRFZCX1VTQl9W
Mj1tCkNPTkZJR19EVkJfVVNCX0FGOTAxNT1tCkNPTkZJR19EVkJfVVNCX0FGOTAzNT1tCkNPTkZJ
R19EVkJfVVNCX0FOWVNFRT1tCkNPTkZJR19EVkJfVVNCX0FVNjYxMD1tCkNPTkZJR19EVkJfVVNC
X0FaNjAwNz1tCkNPTkZJR19EVkJfVVNCX0NFNjIzMD1tCkNPTkZJR19EVkJfVVNCX0VDMTY4PW0K
Q09ORklHX0RWQl9VU0JfR0w4NjE9bQpDT05GSUdfRFZCX1VTQl9MTUUyNTEwPW0KQ09ORklHX0RW
Ql9VU0JfTVhMMTExU0Y9bQpDT05GSUdfRFZCX1VTQl9SVEwyOFhYVT1tCiMgQ09ORklHX0RWQl9V
U0JfRFZCU0tZIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX1VTQl9aRDEzMDEgaXMgbm90IHNldApD
T05GSUdfRFZCX1RUVVNCX0JVREdFVD1tCkNPTkZJR19EVkJfVFRVU0JfREVDPW0KQ09ORklHX1NN
U19VU0JfRFJWPW0KQ09ORklHX0RWQl9CMkMyX0ZMRVhDT1BfVVNCPW0KIyBDT05GSUdfRFZCX0Iy
QzJfRkxFWENPUF9VU0JfREVCVUcgaXMgbm90IHNldAojIENPTkZJR19EVkJfQVMxMDIgaXMgbm90
IHNldAoKIwojIFdlYmNhbSwgVFYgKGFuYWxvZy9kaWdpdGFsKSBVU0IgZGV2aWNlcwojCkNPTkZJ
R19WSURFT19FTTI4WFg9bQojIENPTkZJR19WSURFT19FTTI4WFhfVjRMMiBpcyBub3Qgc2V0CkNP
TkZJR19WSURFT19FTTI4WFhfQUxTQT1tCkNPTkZJR19WSURFT19FTTI4WFhfRFZCPW0KQ09ORklH
X1ZJREVPX0VNMjhYWF9SQz1tCkNPTkZJR19NRURJQV9QQ0lfU1VQUE9SVD15CgojCiMgTWVkaWEg
Y2FwdHVyZSBzdXBwb3J0CiMKIyBDT05GSUdfVklERU9fTUVZRSBpcyBub3Qgc2V0CiMgQ09ORklH
X1ZJREVPX1NPTE82WDEwIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fVFc1ODY0IGlzIG5vdCBz
ZXQKIyBDT05GSUdfVklERU9fVFc2OCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1RXNjg2WCBp
cyBub3Qgc2V0CgojCiMgTWVkaWEgY2FwdHVyZS9hbmFsb2cgVFYgc3VwcG9ydAojCkNPTkZJR19W
SURFT19JVlRWPW0KIyBDT05GSUdfVklERU9fSVZUVl9ERVBSRUNBVEVEX0lPQ1RMUyBpcyBub3Qg
c2V0CiMgQ09ORklHX1ZJREVPX0lWVFZfQUxTQSBpcyBub3Qgc2V0CkNPTkZJR19WSURFT19GQl9J
VlRWPW0KIyBDT05GSUdfVklERU9fRkJfSVZUVl9GT1JDRV9QQVQgaXMgbm90IHNldAojIENPTkZJ
R19WSURFT19IRVhJVU1fR0VNSU5JIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fSEVYSVVNX09S
SU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fTVhCIGlzIG5vdCBzZXQKIyBDT05GSUdfVklE
RU9fRFQzMTU1IGlzIG5vdCBzZXQKCiMKIyBNZWRpYSBjYXB0dXJlL2FuYWxvZy9oeWJyaWQgVFYg
c3VwcG9ydAojCkNPTkZJR19WSURFT19DWDE4PW0KQ09ORklHX1ZJREVPX0NYMThfQUxTQT1tCkNP
TkZJR19WSURFT19DWDIzODg1PW0KQ09ORklHX01FRElBX0FMVEVSQV9DST1tCiMgQ09ORklHX1ZJ
REVPX0NYMjU4MjEgaXMgbm90IHNldApDT05GSUdfVklERU9fQ1g4OD1tCkNPTkZJR19WSURFT19D
WDg4X0FMU0E9bQpDT05GSUdfVklERU9fQ1g4OF9CTEFDS0JJUkQ9bQpDT05GSUdfVklERU9fQ1g4
OF9EVkI9bQpDT05GSUdfVklERU9fQ1g4OF9FTkFCTEVfVlAzMDU0PXkKQ09ORklHX1ZJREVPX0NY
ODhfVlAzMDU0PW0KQ09ORklHX1ZJREVPX0NYODhfTVBFRz1tCkNPTkZJR19WSURFT19CVDg0OD1t
CkNPTkZJR19EVkJfQlQ4WFg9bQpDT05GSUdfVklERU9fU0FBNzEzND1tCkNPTkZJR19WSURFT19T
QUE3MTM0X0FMU0E9bQpDT05GSUdfVklERU9fU0FBNzEzNF9SQz15CkNPTkZJR19WSURFT19TQUE3
MTM0X0RWQj1tCkNPTkZJR19WSURFT19TQUE3MTY0PW0KCiMKIyBNZWRpYSBkaWdpdGFsIFRWIFBD
SSBBZGFwdGVycwojCkNPTkZJR19EVkJfQVY3MTEwX0lSPXkKQ09ORklHX0RWQl9BVjcxMTA9bQpD
T05GSUdfRFZCX0FWNzExMF9PU0Q9eQpDT05GSUdfRFZCX0JVREdFVF9DT1JFPW0KQ09ORklHX0RW
Ql9CVURHRVQ9bQpDT05GSUdfRFZCX0JVREdFVF9DST1tCkNPTkZJR19EVkJfQlVER0VUX0FWPW0K
Q09ORklHX0RWQl9CVURHRVRfUEFUQ0g9bQpDT05GSUdfRFZCX0IyQzJfRkxFWENPUF9QQ0k9bQoj
IENPTkZJR19EVkJfQjJDMl9GTEVYQ09QX1BDSV9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19EVkJf
UExVVE8yPW0KQ09ORklHX0RWQl9ETTExMDU9bQpDT05GSUdfRFZCX1BUMT1tCiMgQ09ORklHX0RW
Ql9QVDMgaXMgbm90IHNldApDT05GSUdfTUFOVElTX0NPUkU9bQpDT05GSUdfRFZCX01BTlRJUz1t
CkNPTkZJR19EVkJfSE9QUEVSPW0KQ09ORklHX0RWQl9OR0VORT1tCkNPTkZJR19EVkJfRERCUklE
R0U9bQojIENPTkZJR19EVkJfRERCUklER0VfTVNJRU5BQkxFIGlzIG5vdCBzZXQKIyBDT05GSUdf
RFZCX1NNSVBDSUUgaXMgbm90IHNldAojIENPTkZJR19EVkJfTkVUVVBfVU5JRFZCIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVjRMX1BMQVRGT1JNX0RSSVZFUlMgaXMgbm90IHNldAojIENPTkZJR19WNExf
TUVNMk1FTV9EUklWRVJTIGlzIG5vdCBzZXQKIyBDT05GSUdfVjRMX1RFU1RfRFJJVkVSUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0RWQl9QTEFURk9STV9EUklWRVJTIGlzIG5vdCBzZXQKCiMKIyBTdXBw
b3J0ZWQgTU1DL1NESU8gYWRhcHRlcnMKIwpDT05GSUdfU01TX1NESU9fRFJWPW0KQ09ORklHX1JB
RElPX0FEQVBURVJTPXkKQ09ORklHX1JBRElPX1RFQTU3NVg9bQojIENPTkZJR19SQURJT19TSTQ3
MFggaXMgbm90IHNldAojIENPTkZJR19SQURJT19TSTQ3MTMgaXMgbm90IHNldAojIENPTkZJR19V
U0JfTVI4MDAgaXMgbm90IHNldAojIENPTkZJR19VU0JfRFNCUiBpcyBub3Qgc2V0CiMgQ09ORklH
X1JBRElPX01BWElSQURJTyBpcyBub3Qgc2V0CiMgQ09ORklHX1JBRElPX1NIQVJLIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUkFESU9fU0hBUksyIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0tFRU5FIGlz
IG5vdCBzZXQKIyBDT05GSUdfVVNCX1JBUkVNT05PIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX01B
OTAxIGlzIG5vdCBzZXQKIyBDT05GSUdfUkFESU9fVEVBNTc2NCBpcyBub3Qgc2V0CiMgQ09ORklH
X1JBRElPX1NBQTc3MDZIIGlzIG5vdCBzZXQKIyBDT05GSUdfUkFESU9fVEVGNjg2MiBpcyBub3Qg
c2V0CiMgQ09ORklHX1JBRElPX1dMMTI3MyBpcyBub3Qgc2V0CgojCiMgVGV4YXMgSW5zdHJ1bWVu
dHMgV0wxMjh4IEZNIGRyaXZlciAoU1QgYmFzZWQpCiMKIyBlbmQgb2YgVGV4YXMgSW5zdHJ1bWVu
dHMgV0wxMjh4IEZNIGRyaXZlciAoU1QgYmFzZWQpCgojCiMgU3VwcG9ydGVkIEZpcmVXaXJlIChJ
RUVFIDEzOTQpIEFkYXB0ZXJzCiMKQ09ORklHX0RWQl9GSVJFRFRWPW0KQ09ORklHX0RWQl9GSVJF
RFRWX0lOUFVUPXkKQ09ORklHX01FRElBX0NPTU1PTl9PUFRJT05TPXkKCiMKIyBjb21tb24gZHJp
dmVyIG9wdGlvbnMKIwpDT05GSUdfVklERU9fQ1gyMzQxWD1tCkNPTkZJR19WSURFT19UVkVFUFJP
TT1tCkNPTkZJR19DWVBSRVNTX0ZJUk1XQVJFPW0KQ09ORklHX1ZJREVPQlVGMl9DT1JFPW0KQ09O
RklHX1ZJREVPQlVGMl9WNEwyPW0KQ09ORklHX1ZJREVPQlVGMl9NRU1PUFM9bQpDT05GSUdfVklE
RU9CVUYyX1ZNQUxMT0M9bQpDT05GSUdfVklERU9CVUYyX0RNQV9TRz1tCkNPTkZJR19WSURFT0JV
RjJfRFZCPW0KQ09ORklHX0RWQl9CMkMyX0ZMRVhDT1A9bQpDT05GSUdfVklERU9fU0FBNzE0Nj1t
CkNPTkZJR19WSURFT19TQUE3MTQ2X1ZWPW0KQ09ORklHX1NNU19TSUFOT19NRFRWPW0KQ09ORklH
X1NNU19TSUFOT19SQz15CiMgQ09ORklHX1NNU19TSUFOT19ERUJVR0ZTIGlzIG5vdCBzZXQKCiMK
IyBNZWRpYSBhbmNpbGxhcnkgZHJpdmVycyAodHVuZXJzLCBzZW5zb3JzLCBpMmMsIHNwaSwgZnJv
bnRlbmRzKQojCkNPTkZJR19NRURJQV9TVUJEUlZfQVVUT1NFTEVDVD15CkNPTkZJR19NRURJQV9B
VFRBQ0g9eQpDT05GSUdfVklERU9fSVJfSTJDPW0KCiMKIyBBdWRpbyBkZWNvZGVycywgcHJvY2Vz
c29ycyBhbmQgbWl4ZXJzCiMKQ09ORklHX1ZJREVPX1RWQVVESU89bQpDT05GSUdfVklERU9fVERB
NzQzMj1tCkNPTkZJR19WSURFT19NU1AzNDAwPW0KQ09ORklHX1ZJREVPX0NTMzMwOD1tCkNPTkZJ
R19WSURFT19DUzUzNDU9bQpDT05GSUdfVklERU9fQ1M1M0wzMkE9bQpDT05GSUdfVklERU9fV004
Nzc1PW0KQ09ORklHX1ZJREVPX1dNODczOT1tCkNPTkZJR19WSURFT19WUDI3U01QWD1tCgojCiMg
UkRTIGRlY29kZXJzCiMKQ09ORklHX1ZJREVPX1NBQTY1ODg9bQoKIwojIFZpZGVvIGRlY29kZXJz
CiMKQ09ORklHX1ZJREVPX1NBQTcxMVg9bQoKIwojIFZpZGVvIGFuZCBhdWRpbyBkZWNvZGVycwoj
CkNPTkZJR19WSURFT19TQUE3MTdYPW0KQ09ORklHX1ZJREVPX0NYMjU4NDA9bQoKIwojIFZpZGVv
IGVuY29kZXJzCiMKQ09ORklHX1ZJREVPX1NBQTcxMjc9bQoKIwojIENhbWVyYSBzZW5zb3IgZGV2
aWNlcwojCgojCiMgTGVucyBkcml2ZXJzCiMKCiMKIyBGbGFzaCBkZXZpY2VzCiMKCiMKIyBWaWRl
byBpbXByb3ZlbWVudCBjaGlwcwojCkNPTkZJR19WSURFT19VUEQ2NDAzMUE9bQpDT05GSUdfVklE
RU9fVVBENjQwODM9bQoKIwojIEF1ZGlvL1ZpZGVvIGNvbXByZXNzaW9uIGNoaXBzCiMKQ09ORklH
X1ZJREVPX1NBQTY3NTJIUz1tCgojCiMgU0RSIHR1bmVyIGNoaXBzCiMKCiMKIyBNaXNjZWxsYW5l
b3VzIGhlbHBlciBjaGlwcwojCkNPTkZJR19WSURFT19NNTI3OTA9bQoKIwojIE1lZGlhIFNQSSBB
ZGFwdGVycwojCiMgQ09ORklHX0NYRDI4ODBfU1BJX0RSViBpcyBub3Qgc2V0CiMgZW5kIG9mIE1l
ZGlhIFNQSSBBZGFwdGVycwoKQ09ORklHX01FRElBX1RVTkVSPW0KQ09ORklHX01FRElBX1RVTkVS
X1NJTVBMRT1tCkNPTkZJR19NRURJQV9UVU5FUl9UREExODI1MD1tCkNPTkZJR19NRURJQV9UVU5F
Ul9UREE4MjkwPW0KQ09ORklHX01FRElBX1RVTkVSX1REQTgyN1g9bQpDT05GSUdfTUVESUFfVFVO
RVJfVERBMTgyNzE9bQpDT05GSUdfTUVESUFfVFVORVJfVERBOTg4Nz1tCkNPTkZJR19NRURJQV9U
VU5FUl9URUE1NzYxPW0KQ09ORklHX01FRElBX1RVTkVSX1RFQTU3Njc9bQpDT05GSUdfTUVESUFf
VFVORVJfTVQyMFhYPW0KQ09ORklHX01FRElBX1RVTkVSX01UMjA2MD1tCkNPTkZJR19NRURJQV9U
VU5FUl9NVDIwNjM9bQpDT05GSUdfTUVESUFfVFVORVJfTVQyMjY2PW0KQ09ORklHX01FRElBX1RV
TkVSX01UMjEzMT1tCkNPTkZJR19NRURJQV9UVU5FUl9RVDEwMTA9bQpDT05GSUdfTUVESUFfVFVO
RVJfWEMyMDI4PW0KQ09ORklHX01FRElBX1RVTkVSX1hDNTAwMD1tCkNPTkZJR19NRURJQV9UVU5F
Ul9YQzQwMDA9bQpDT05GSUdfTUVESUFfVFVORVJfTVhMNTAwNVM9bQpDT05GSUdfTUVESUFfVFVO
RVJfTVhMNTAwN1Q9bQpDT05GSUdfTUVESUFfVFVORVJfTUM0NFM4MDM9bQpDT05GSUdfTUVESUFf
VFVORVJfTUFYMjE2NT1tCkNPTkZJR19NRURJQV9UVU5FUl9UREExODIxOD1tCkNPTkZJR19NRURJ
QV9UVU5FUl9GQzAwMTE9bQpDT05GSUdfTUVESUFfVFVORVJfRkMwMDEyPW0KQ09ORklHX01FRElB
X1RVTkVSX0ZDMDAxMz1tCkNPTkZJR19NRURJQV9UVU5FUl9UREExODIxMj1tCkNPTkZJR19NRURJ
QV9UVU5FUl9FNDAwMD1tCkNPTkZJR19NRURJQV9UVU5FUl9GQzI1ODA9bQpDT05GSUdfTUVESUFf
VFVORVJfTTg4UlM2MDAwVD1tCkNPTkZJR19NRURJQV9UVU5FUl9UVUE5MDAxPW0KQ09ORklHX01F
RElBX1RVTkVSX1NJMjE1Nz1tCkNPTkZJR19NRURJQV9UVU5FUl9JVDkxM1g9bQpDT05GSUdfTUVE
SUFfVFVORVJfUjgyMFQ9bQpDT05GSUdfTUVESUFfVFVORVJfUU0xRDFDMDA0Mj1tCkNPTkZJR19N
RURJQV9UVU5FUl9RTTFEMUIwMDA0PW0KCiMKIyBNdWx0aXN0YW5kYXJkIChzYXRlbGxpdGUpIGZy
b250ZW5kcwojCkNPTkZJR19EVkJfU1RCMDg5OT1tCkNPTkZJR19EVkJfU1RCNjEwMD1tCkNPTkZJ
R19EVkJfU1RWMDkweD1tCkNPTkZJR19EVkJfU1RWMDkxMD1tCkNPTkZJR19EVkJfU1RWNjExMHg9
bQpDT05GSUdfRFZCX1NUVjYxMTE9bQpDT05GSUdfRFZCX01YTDVYWD1tCkNPTkZJR19EVkJfTTg4
RFMzMTAzPW0KCiMKIyBNdWx0aXN0YW5kYXJkIChjYWJsZSArIHRlcnJlc3RyaWFsKSBmcm9udGVu
ZHMKIwpDT05GSUdfRFZCX0RSWEs9bQpDT05GSUdfRFZCX1REQTE4MjcxQzJERD1tCkNPTkZJR19E
VkJfU0kyMTY1PW0KQ09ORklHX0RWQl9NTjg4NDcyPW0KQ09ORklHX0RWQl9NTjg4NDczPW0KCiMK
IyBEVkItUyAoc2F0ZWxsaXRlKSBmcm9udGVuZHMKIwpDT05GSUdfRFZCX0NYMjQxMTA9bQpDT05G
SUdfRFZCX0NYMjQxMjM9bQpDT05GSUdfRFZCX01UMzEyPW0KQ09ORklHX0RWQl9aTDEwMDM2PW0K
Q09ORklHX0RWQl9aTDEwMDM5PW0KQ09ORklHX0RWQl9TNUgxNDIwPW0KQ09ORklHX0RWQl9TVFYw
Mjg4PW0KQ09ORklHX0RWQl9TVEI2MDAwPW0KQ09ORklHX0RWQl9TVFYwMjk5PW0KQ09ORklHX0RW
Ql9TVFY2MTEwPW0KQ09ORklHX0RWQl9TVFYwOTAwPW0KQ09ORklHX0RWQl9UREE4MDgzPW0KQ09O
RklHX0RWQl9UREExMDA4Nj1tCkNPTkZJR19EVkJfVERBODI2MT1tCkNPTkZJR19EVkJfVkVTMVg5
Mz1tCkNPTkZJR19EVkJfVFVORVJfSVREMTAwMD1tCkNPTkZJR19EVkJfVFVORVJfQ1gyNDExMz1t
CkNPTkZJR19EVkJfVERBODI2WD1tCkNPTkZJR19EVkJfVFVBNjEwMD1tCkNPTkZJR19EVkJfQ1gy
NDExNj1tCkNPTkZJR19EVkJfQ1gyNDExNz1tCkNPTkZJR19EVkJfQ1gyNDEyMD1tCkNPTkZJR19E
VkJfU0kyMVhYPW0KQ09ORklHX0RWQl9UUzIwMjA9bQpDT05GSUdfRFZCX0RTMzAwMD1tCkNPTkZJ
R19EVkJfTUI4NkExNj1tCkNPTkZJR19EVkJfVERBMTAwNzE9bQoKIwojIERWQi1UICh0ZXJyZXN0
cmlhbCkgZnJvbnRlbmRzCiMKQ09ORklHX0RWQl9TUDg4NzA9bQpDT05GSUdfRFZCX1NQODg3WD1t
CkNPTkZJR19EVkJfQ1gyMjcwMD1tCkNPTkZJR19EVkJfQ1gyMjcwMj1tCkNPTkZJR19EVkJfRFJY
RD1tCkNPTkZJR19EVkJfTDY0NzgxPW0KQ09ORklHX0RWQl9UREExMDA0WD1tCkNPTkZJR19EVkJf
TlhUNjAwMD1tCkNPTkZJR19EVkJfTVQzNTI9bQpDT05GSUdfRFZCX1pMMTAzNTM9bQpDT05GSUdf
RFZCX0RJQjMwMDBNQj1tCkNPTkZJR19EVkJfRElCMzAwME1DPW0KQ09ORklHX0RWQl9ESUI3MDAw
TT1tCkNPTkZJR19EVkJfRElCNzAwMFA9bQpDT05GSUdfRFZCX1REQTEwMDQ4PW0KQ09ORklHX0RW
Ql9BRjkwMTM9bQpDT05GSUdfRFZCX0VDMTAwPW0KQ09ORklHX0RWQl9TVFYwMzY3PW0KQ09ORklH
X0RWQl9DWEQyODIwUj1tCkNPTkZJR19EVkJfQ1hEMjg0MUVSPW0KQ09ORklHX0RWQl9SVEwyODMw
PW0KQ09ORklHX0RWQl9SVEwyODMyPW0KQ09ORklHX0RWQl9TSTIxNjg9bQpDT05GSUdfRFZCX0dQ
OFBTS19GRT1tCgojCiMgRFZCLUMgKGNhYmxlKSBmcm9udGVuZHMKIwpDT05GSUdfRFZCX1ZFUzE4
MjA9bQpDT05GSUdfRFZCX1REQTEwMDIxPW0KQ09ORklHX0RWQl9UREExMDAyMz1tCkNPTkZJR19E
VkJfU1RWMDI5Nz1tCgojCiMgQVRTQyAoTm9ydGggQW1lcmljYW4vS29yZWFuIFRlcnJlc3RyaWFs
L0NhYmxlIERUVikgZnJvbnRlbmRzCiMKQ09ORklHX0RWQl9OWFQyMDBYPW0KQ09ORklHX0RWQl9P
UjUxMjExPW0KQ09ORklHX0RWQl9PUjUxMTMyPW0KQ09ORklHX0RWQl9CQ00zNTEwPW0KQ09ORklH
X0RWQl9MR0RUMzMwWD1tCkNPTkZJR19EVkJfTEdEVDMzMDU9bQpDT05GSUdfRFZCX0xHRFQzMzA2
QT1tCkNPTkZJR19EVkJfTEcyMTYwPW0KQ09ORklHX0RWQl9TNUgxNDA5PW0KQ09ORklHX0RWQl9B
VTg1MjI9bQpDT05GSUdfRFZCX0FVODUyMl9EVFY9bQpDT05GSUdfRFZCX0FVODUyMl9WNEw9bQpD
T05GSUdfRFZCX1M1SDE0MTE9bQoKIwojIElTREItVCAodGVycmVzdHJpYWwpIGZyb250ZW5kcwoj
CkNPTkZJR19EVkJfUzkyMT1tCkNPTkZJR19EVkJfRElCODAwMD1tCkNPTkZJR19EVkJfTUI4NkEy
MFM9bQoKIwojIElTREItUyAoc2F0ZWxsaXRlKSAmIElTREItVCAodGVycmVzdHJpYWwpIGZyb250
ZW5kcwojCkNPTkZJR19EVkJfVEM5MDUyMj1tCgojCiMgRGlnaXRhbCB0ZXJyZXN0cmlhbCBvbmx5
IHR1bmVycy9QTEwKIwpDT05GSUdfRFZCX1BMTD1tCkNPTkZJR19EVkJfVFVORVJfRElCMDA3MD1t
CkNPTkZJR19EVkJfVFVORVJfRElCMDA5MD1tCgojCiMgU0VDIGNvbnRyb2wgZGV2aWNlcyBmb3Ig
RFZCLVMKIwpDT05GSUdfRFZCX0RSWDM5WFlKPW0KQ09ORklHX0RWQl9MTkJIMjU9bQpDT05GSUdf
RFZCX0xOQlAyMT1tCkNPTkZJR19EVkJfTE5CUDIyPW0KQ09ORklHX0RWQl9JU0w2NDA1PW0KQ09O
RklHX0RWQl9JU0w2NDIxPW0KQ09ORklHX0RWQl9JU0w2NDIzPW0KQ09ORklHX0RWQl9BODI5Mz1t
CkNPTkZJR19EVkJfTEdTOEdYWD1tCkNPTkZJR19EVkJfQVRCTTg4MzA9bQpDT05GSUdfRFZCX1RE
QTY2NXg9bQpDT05GSUdfRFZCX0lYMjUwNVY9bQpDT05GSUdfRFZCX004OFJTMjAwMD1tCkNPTkZJ
R19EVkJfQUY5MDMzPW0KCiMKIyBDb21tb24gSW50ZXJmYWNlIChFTjUwMjIxKSBjb250cm9sbGVy
IGRyaXZlcnMKIwpDT05GSUdfRFZCX0NYRDIwOTk9bQoKIwojIFRvb2xzIHRvIGRldmVsb3AgbmV3
IGZyb250ZW5kcwojCkNPTkZJR19EVkJfRFVNTVlfRkU9bQoKIwojIEdyYXBoaWNzIHN1cHBvcnQK
IwpDT05GSUdfQUdQPXkKQ09ORklHX0FHUF9BTUQ2ND15CkNPTkZJR19BR1BfSU5URUw9eQpDT05G
SUdfQUdQX1NJUz15CkNPTkZJR19BR1BfVklBPXkKQ09ORklHX0lOVEVMX0dUVD15CkNPTkZJR19W
R0FfQVJCPXkKQ09ORklHX1ZHQV9BUkJfTUFYX0dQVVM9NjQKQ09ORklHX1ZHQV9TV0lUQ0hFUk9P
PXkKQ09ORklHX0RSTT1tCkNPTkZJR19EUk1fTUlQSV9EU0k9eQojIENPTkZJR19EUk1fRFBfQVVY
X0NIQVJERVYgaXMgbm90IHNldApDT05GSUdfRFJNX0RFQlVHX1NFTEZURVNUPW0KQ09ORklHX0RS
TV9LTVNfSEVMUEVSPW0KQ09ORklHX0RSTV9LTVNfRkJfSEVMUEVSPXkKQ09ORklHX0RSTV9GQkRF
Vl9FTVVMQVRJT049eQpDT05GSUdfRFJNX0ZCREVWX09WRVJBTExPQz0xMDAKIyBDT05GSUdfRFJN
X0ZCREVWX0xFQUtfUEhZU19TTUVNIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9MT0FEX0VESURfRklS
TVdBUkU9eQojIENPTkZJR19EUk1fRFBfQ0VDIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9UVE09bQpD
T05GSUdfRFJNX0dFTV9TSE1FTV9IRUxQRVI9eQoKIwojIEkyQyBlbmNvZGVyIG9yIGhlbHBlciBj
aGlwcwojCkNPTkZJR19EUk1fSTJDX0NINzAwNj1tCkNPTkZJR19EUk1fSTJDX1NJTDE2ND1tCkNP
TkZJR19EUk1fSTJDX05YUF9UREE5OThYPW0KIyBDT05GSUdfRFJNX0kyQ19OWFBfVERBOTk1MCBp
cyBub3Qgc2V0CiMgZW5kIG9mIEkyQyBlbmNvZGVyIG9yIGhlbHBlciBjaGlwcwoKIwojIEFSTSBk
ZXZpY2VzCiMKIyBlbmQgb2YgQVJNIGRldmljZXMKCiMgQ09ORklHX0RSTV9SQURFT04gaXMgbm90
IHNldAojIENPTkZJR19EUk1fQU1ER1BVIGlzIG5vdCBzZXQKCiMKIyBBQ1AgKEF1ZGlvIENvUHJv
Y2Vzc29yKSBDb25maWd1cmF0aW9uCiMKIyBlbmQgb2YgQUNQIChBdWRpbyBDb1Byb2Nlc3Nvcikg
Q29uZmlndXJhdGlvbgoKIyBDT05GSUdfRFJNX05PVVZFQVUgaXMgbm90IHNldApDT05GSUdfRFJN
X0k5MTU9bQojIENPTkZJR19EUk1fSTkxNV9BTFBIQV9TVVBQT1JUIGlzIG5vdCBzZXQKQ09ORklH
X0RSTV9JOTE1X0NBUFRVUkVfRVJST1I9eQpDT05GSUdfRFJNX0k5MTVfQ09NUFJFU1NfRVJST1I9
eQpDT05GSUdfRFJNX0k5MTVfVVNFUlBUUj15CiMgQ09ORklHX0RSTV9JOTE1X0dWVCBpcyBub3Qg
c2V0CgojCiMgZHJtL2k5MTUgRGVidWdnaW5nCiMKIyBDT05GSUdfRFJNX0k5MTVfV0VSUk9SIGlz
IG5vdCBzZXQKIyBDT05GSUdfRFJNX0k5MTVfREVCVUcgaXMgbm90IHNldAojIENPTkZJR19EUk1f
STkxNV9TV19GRU5DRV9ERUJVR19PQkpFQ1RTIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0k5MTVf
U1dfRkVOQ0VfQ0hFQ0tfREFHIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0k5MTVfREVCVUdfR1VD
IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0k5MTVfU0VMRlRFU1QgaXMgbm90IHNldAojIENPTkZJ
R19EUk1fSTkxNV9MT1dfTEVWRUxfVFJBQ0VQT0lOVFMgaXMgbm90IHNldAojIENPTkZJR19EUk1f
STkxNV9ERUJVR19WQkxBTktfRVZBREUgaXMgbm90IHNldAojIENPTkZJR19EUk1fSTkxNV9ERUJV
R19SVU5USU1FX1BNIGlzIG5vdCBzZXQKIyBlbmQgb2YgZHJtL2k5MTUgRGVidWdnaW5nCgpDT05G
SUdfRFJNX1ZHRU09bQojIENPTkZJR19EUk1fVktNUyBpcyBub3Qgc2V0CkNPTkZJR19EUk1fVk1X
R0ZYPW0KQ09ORklHX0RSTV9WTVdHRlhfRkJDT049eQpDT05GSUdfRFJNX0dNQTUwMD1tCkNPTkZJ
R19EUk1fR01BNjAwPXkKQ09ORklHX0RSTV9HTUEzNjAwPXkKQ09ORklHX0RSTV9VREw9bQpDT05G
SUdfRFJNX0FTVD1tCkNPTkZJR19EUk1fTUdBRzIwMD1tCkNPTkZJR19EUk1fQ0lSUlVTX1FFTVU9
bQpDT05GSUdfRFJNX1FYTD1tCiMgQ09ORklHX0RSTV9CT0NIUyBpcyBub3Qgc2V0CiMgQ09ORklH
X0RSTV9WSVJUSU9fR1BVIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9QQU5FTD15CgojCiMgRGlzcGxh
eSBQYW5lbHMKIwojIENPTkZJR19EUk1fUEFORUxfUkFTUEJFUlJZUElfVE9VQ0hTQ1JFRU4gaXMg
bm90IHNldAojIGVuZCBvZiBEaXNwbGF5IFBhbmVscwoKQ09ORklHX0RSTV9CUklER0U9eQpDT05G
SUdfRFJNX1BBTkVMX0JSSURHRT15CgojCiMgRGlzcGxheSBJbnRlcmZhY2UgQnJpZGdlcwojCiMg
Q09ORklHX0RSTV9BTkFMT0dJWF9BTlg3OFhYIGlzIG5vdCBzZXQKIyBlbmQgb2YgRGlzcGxheSBJ
bnRlcmZhY2UgQnJpZGdlcwoKIyBDT05GSUdfRFJNX0VUTkFWSVYgaXMgbm90IHNldAojIENPTkZJ
R19EUk1fSElTSV9ISUJNQyBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9USU5ZRFJNIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRFJNX1hFTiBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9WQk9YVklERU8gaXMg
bm90IHNldAojIENPTkZJR19EUk1fTEVHQUNZIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9QQU5FTF9P
UklFTlRBVElPTl9RVUlSS1M9eQpDT05GSUdfRFJNX0xJQl9SQU5ET009eQoKIwojIEZyYW1lIGJ1
ZmZlciBEZXZpY2VzCiMKQ09ORklHX0ZCX0NNRExJTkU9eQpDT05GSUdfRkJfTk9USUZZPXkKQ09O
RklHX0ZCPXkKIyBDT05GSUdfRklSTVdBUkVfRURJRCBpcyBub3Qgc2V0CkNPTkZJR19GQl9CT09U
X1ZFU0FfU1VQUE9SVD15CkNPTkZJR19GQl9DRkJfRklMTFJFQ1Q9eQpDT05GSUdfRkJfQ0ZCX0NP
UFlBUkVBPXkKQ09ORklHX0ZCX0NGQl9JTUFHRUJMSVQ9eQpDT05GSUdfRkJfU1lTX0ZJTExSRUNU
PW0KQ09ORklHX0ZCX1NZU19DT1BZQVJFQT1tCkNPTkZJR19GQl9TWVNfSU1BR0VCTElUPW0KIyBD
T05GSUdfRkJfRk9SRUlHTl9FTkRJQU4gaXMgbm90IHNldApDT05GSUdfRkJfU1lTX0ZPUFM9bQpD
T05GSUdfRkJfREVGRVJSRURfSU89eQojIENPTkZJR19GQl9NT0RFX0hFTFBFUlMgaXMgbm90IHNl
dApDT05GSUdfRkJfVElMRUJMSVRUSU5HPXkKCiMKIyBGcmFtZSBidWZmZXIgaGFyZHdhcmUgZHJp
dmVycwojCiMgQ09ORklHX0ZCX0NJUlJVUyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1BNMiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0ZCX0NZQkVSMjAwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX0FSQyBp
cyBub3Qgc2V0CiMgQ09ORklHX0ZCX0FTSUxJQU5UIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfSU1T
VFQgaXMgbm90IHNldAojIENPTkZJR19GQl9WR0ExNiBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1VW
RVNBIGlzIG5vdCBzZXQKQ09ORklHX0ZCX1ZFU0E9eQpDT05GSUdfRkJfRUZJPXkKIyBDT05GSUdf
RkJfTjQxMSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX0hHQSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZC
X09QRU5DT1JFUyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1MxRDEzWFhYIGlzIG5vdCBzZXQKIyBD
T05GSUdfRkJfTlZJRElBIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfUklWQSBpcyBub3Qgc2V0CiMg
Q09ORklHX0ZCX0k3NDAgaXMgbm90IHNldAojIENPTkZJR19GQl9MRTgwNTc4IGlzIG5vdCBzZXQK
IyBDT05GSUdfRkJfSU5URUwgaXMgbm90IHNldAojIENPTkZJR19GQl9NQVRST1ggaXMgbm90IHNl
dAojIENPTkZJR19GQl9SQURFT04gaXMgbm90IHNldAojIENPTkZJR19GQl9BVFkxMjggaXMgbm90
IHNldAojIENPTkZJR19GQl9BVFkgaXMgbm90IHNldAojIENPTkZJR19GQl9TMyBpcyBub3Qgc2V0
CiMgQ09ORklHX0ZCX1NBVkFHRSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1NJUyBpcyBub3Qgc2V0
CiMgQ09ORklHX0ZCX1ZJQSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX05FT01BR0lDIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRkJfS1lSTyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCXzNERlggaXMgbm90IHNl
dAojIENPTkZJR19GQl9WT09ET08xIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfVlQ4NjIzIGlzIG5v
dCBzZXQKIyBDT05GSUdfRkJfVFJJREVOVCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX0FSSyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0ZCX1BNMyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX0NBUk1JTkUgaXMg
bm90IHNldAojIENPTkZJR19GQl9TTTUwMSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1NNU0NVRlgg
aXMgbm90IHNldAojIENPTkZJR19GQl9VREwgaXMgbm90IHNldAojIENPTkZJR19GQl9JQk1fR1hU
NDUwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1ZJUlRVQUwgaXMgbm90IHNldAojIENPTkZJR19Y
RU5fRkJERVZfRlJPTlRFTkQgaXMgbm90IHNldAojIENPTkZJR19GQl9NRVRST05PTUUgaXMgbm90
IHNldAojIENPTkZJR19GQl9NQjg2MlhYIGlzIG5vdCBzZXQKQ09ORklHX0ZCX0hZUEVSVj1tCiMg
Q09ORklHX0ZCX1NJTVBMRSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1NNNzEyIGlzIG5vdCBzZXQK
IyBlbmQgb2YgRnJhbWUgYnVmZmVyIERldmljZXMKCiMKIyBCYWNrbGlnaHQgJiBMQ0QgZGV2aWNl
IHN1cHBvcnQKIwpDT05GSUdfTENEX0NMQVNTX0RFVklDRT1tCiMgQ09ORklHX0xDRF9MNEYwMDI0
MlQwMyBpcyBub3Qgc2V0CiMgQ09ORklHX0xDRF9MTVMyODNHRjA1IGlzIG5vdCBzZXQKIyBDT05G
SUdfTENEX0xUVjM1MFFWIGlzIG5vdCBzZXQKIyBDT05GSUdfTENEX0lMSTkyMlggaXMgbm90IHNl
dAojIENPTkZJR19MQ0RfSUxJOTMyMCBpcyBub3Qgc2V0CiMgQ09ORklHX0xDRF9URE8yNE0gaXMg
bm90IHNldAojIENPTkZJR19MQ0RfVkdHMjQzMkE0IGlzIG5vdCBzZXQKQ09ORklHX0xDRF9QTEFU
Rk9STT1tCiMgQ09ORklHX0xDRF9BTVMzNjlGRzA2IGlzIG5vdCBzZXQKIyBDT05GSUdfTENEX0xN
UzUwMUtGMDMgaXMgbm90IHNldAojIENPTkZJR19MQ0RfSFg4MzU3IGlzIG5vdCBzZXQKIyBDT05G
SUdfTENEX09UTTMyMjVBIGlzIG5vdCBzZXQKQ09ORklHX0JBQ0tMSUdIVF9DTEFTU19ERVZJQ0U9
eQojIENPTkZJR19CQUNLTElHSFRfR0VORVJJQyBpcyBub3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdI
VF9QV00gaXMgbm90IHNldApDT05GSUdfQkFDS0xJR0hUX0FQUExFPW0KIyBDT05GSUdfQkFDS0xJ
R0hUX1BNODk0MV9XTEVEIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX1NBSEFSQSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdIVF9BRFA4ODYwIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFD
S0xJR0hUX0FEUDg4NzAgaXMgbm90IHNldAojIENPTkZJR19CQUNLTElHSFRfTE0zNjMwQSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdIVF9MTTM2MzkgaXMgbm90IHNldAojIENPTkZJR19CQUNL
TElHSFRfTFA4NTVYIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX0dQSU8gaXMgbm90IHNl
dAojIENPTkZJR19CQUNLTElHSFRfTFY1MjA3TFAgaXMgbm90IHNldAojIENPTkZJR19CQUNLTElH
SFRfQkQ2MTA3IGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX0FSQ1hDTk4gaXMgbm90IHNl
dAojIGVuZCBvZiBCYWNrbGlnaHQgJiBMQ0QgZGV2aWNlIHN1cHBvcnQKCkNPTkZJR19IRE1JPXkK
CiMKIyBDb25zb2xlIGRpc3BsYXkgZHJpdmVyIHN1cHBvcnQKIwpDT05GSUdfVkdBX0NPTlNPTEU9
eQpDT05GSUdfVkdBQ09OX1NPRlRfU0NST0xMQkFDSz15CkNPTkZJR19WR0FDT05fU09GVF9TQ1JP
TExCQUNLX1NJWkU9NjQKIyBDT05GSUdfVkdBQ09OX1NPRlRfU0NST0xMQkFDS19QRVJTSVNURU5U
X0VOQUJMRV9CWV9ERUZBVUxUIGlzIG5vdCBzZXQKQ09ORklHX0RVTU1ZX0NPTlNPTEU9eQpDT05G
SUdfRFVNTVlfQ09OU09MRV9DT0xVTU5TPTgwCkNPTkZJR19EVU1NWV9DT05TT0xFX1JPV1M9MjUK
Q09ORklHX0ZSQU1FQlVGRkVSX0NPTlNPTEU9eQpDT05GSUdfRlJBTUVCVUZGRVJfQ09OU09MRV9E
RVRFQ1RfUFJJTUFSWT15CkNPTkZJR19GUkFNRUJVRkZFUl9DT05TT0xFX1JPVEFUSU9OPXkKIyBD
T05GSUdfRlJBTUVCVUZGRVJfQ09OU09MRV9ERUZFUlJFRF9UQUtFT1ZFUiBpcyBub3Qgc2V0CiMg
ZW5kIG9mIENvbnNvbGUgZGlzcGxheSBkcml2ZXIgc3VwcG9ydAoKQ09ORklHX0xPR089eQojIENP
TkZJR19MT0dPX0xJTlVYX01PTk8gaXMgbm90IHNldAojIENPTkZJR19MT0dPX0xJTlVYX1ZHQTE2
IGlzIG5vdCBzZXQKQ09ORklHX0xPR09fTElOVVhfQ0xVVDIyND15CiMgZW5kIG9mIEdyYXBoaWNz
IHN1cHBvcnQKCkNPTkZJR19TT1VORD1tCkNPTkZJR19TT1VORF9PU1NfQ09SRT15CkNPTkZJR19T
T1VORF9PU1NfQ09SRV9QUkVDTEFJTT15CkNPTkZJR19TTkQ9bQpDT05GSUdfU05EX1RJTUVSPW0K
Q09ORklHX1NORF9QQ009bQpDT05GSUdfU05EX0hXREVQPW0KQ09ORklHX1NORF9TRVFfREVWSUNF
PW0KQ09ORklHX1NORF9SQVdNSURJPW0KQ09ORklHX1NORF9KQUNLPXkKQ09ORklHX1NORF9KQUNL
X0lOUFVUX0RFVj15CkNPTkZJR19TTkRfT1NTRU1VTD15CiMgQ09ORklHX1NORF9NSVhFUl9PU1Mg
aXMgbm90IHNldAojIENPTkZJR19TTkRfUENNX09TUyBpcyBub3Qgc2V0CkNPTkZJR19TTkRfUENN
X1RJTUVSPXkKQ09ORklHX1NORF9IUlRJTUVSPW0KQ09ORklHX1NORF9EWU5BTUlDX01JTk9SUz15
CkNPTkZJR19TTkRfTUFYX0NBUkRTPTMyCiMgQ09ORklHX1NORF9TVVBQT1JUX09MRF9BUEkgaXMg
bm90IHNldApDT05GSUdfU05EX1BST0NfRlM9eQpDT05GSUdfU05EX1ZFUkJPU0VfUFJPQ0ZTPXkK
IyBDT05GSUdfU05EX1ZFUkJPU0VfUFJJTlRLIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0RFQlVH
IGlzIG5vdCBzZXQKQ09ORklHX1NORF9WTUFTVEVSPXkKQ09ORklHX1NORF9ETUFfU0dCVUY9eQpD
T05GSUdfU05EX1NFUVVFTkNFUj1tCkNPTkZJR19TTkRfU0VRX0RVTU1ZPW0KQ09ORklHX1NORF9T
RVFVRU5DRVJfT1NTPW0KQ09ORklHX1NORF9TRVFfSFJUSU1FUl9ERUZBVUxUPXkKQ09ORklHX1NO
RF9TRVFfTUlESV9FVkVOVD1tCkNPTkZJR19TTkRfU0VRX01JREk9bQpDT05GSUdfU05EX1NFUV9N
SURJX0VNVUw9bQpDT05GSUdfU05EX1NFUV9WSVJNSURJPW0KQ09ORklHX1NORF9NUFU0MDFfVUFS
VD1tCkNPTkZJR19TTkRfT1BMM19MSUI9bQpDT05GSUdfU05EX09QTDNfTElCX1NFUT1tCkNPTkZJ
R19TTkRfVlhfTElCPW0KQ09ORklHX1NORF9BQzk3X0NPREVDPW0KQ09ORklHX1NORF9EUklWRVJT
PXkKQ09ORklHX1NORF9QQ1NQPW0KQ09ORklHX1NORF9EVU1NWT1tCkNPTkZJR19TTkRfQUxPT1A9
bQpDT05GSUdfU05EX1ZJUk1JREk9bQpDT05GSUdfU05EX01UUEFWPW0KIyBDT05GSUdfU05EX01U
UzY0IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NFUklBTF9VMTY1NTAgaXMgbm90IHNldApDT05G
SUdfU05EX01QVTQwMT1tCiMgQ09ORklHX1NORF9QT1JUTUFOMlg0IGlzIG5vdCBzZXQKQ09ORklH
X1NORF9BQzk3X1BPV0VSX1NBVkU9eQpDT05GSUdfU05EX0FDOTdfUE9XRVJfU0FWRV9ERUZBVUxU
PTUKQ09ORklHX1NORF9QQ0k9eQpDT05GSUdfU05EX0FEMTg4OT1tCiMgQ09ORklHX1NORF9BTFMz
MDAgaXMgbm90IHNldAojIENPTkZJR19TTkRfQUxTNDAwMCBpcyBub3Qgc2V0CkNPTkZJR19TTkRf
QUxJNTQ1MT1tCkNPTkZJR19TTkRfQVNJSFBJPW0KQ09ORklHX1NORF9BVElJWFA9bQpDT05GSUdf
U05EX0FUSUlYUF9NT0RFTT1tCkNPTkZJR19TTkRfQVU4ODEwPW0KQ09ORklHX1NORF9BVTg4MjA9
bQpDT05GSUdfU05EX0FVODgzMD1tCiMgQ09ORklHX1NORF9BVzIgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfQVpUMzMyOCBpcyBub3Qgc2V0CkNPTkZJR19TTkRfQlQ4N1g9bQojIENPTkZJR19TTkRf
QlQ4N1hfT1ZFUkNMT0NLIGlzIG5vdCBzZXQKQ09ORklHX1NORF9DQTAxMDY9bQpDT05GSUdfU05E
X0NNSVBDST1tCkNPTkZJR19TTkRfT1hZR0VOX0xJQj1tCkNPTkZJR19TTkRfT1hZR0VOPW0KIyBD
T05GSUdfU05EX0NTNDI4MSBpcyBub3Qgc2V0CkNPTkZJR19TTkRfQ1M0NlhYPW0KQ09ORklHX1NO
RF9DUzQ2WFhfTkVXX0RTUD15CkNPTkZJR19TTkRfQ1RYRkk9bQpDT05GSUdfU05EX0RBUkxBMjA9
bQpDT05GSUdfU05EX0dJTkEyMD1tCkNPTkZJR19TTkRfTEFZTEEyMD1tCkNPTkZJR19TTkRfREFS
TEEyND1tCkNPTkZJR19TTkRfR0lOQTI0PW0KQ09ORklHX1NORF9MQVlMQTI0PW0KQ09ORklHX1NO
RF9NT05BPW0KQ09ORklHX1NORF9NSUE9bQpDT05GSUdfU05EX0VDSE8zRz1tCkNPTkZJR19TTkRf
SU5ESUdPPW0KQ09ORklHX1NORF9JTkRJR09JTz1tCkNPTkZJR19TTkRfSU5ESUdPREo9bQpDT05G
SUdfU05EX0lORElHT0lPWD1tCkNPTkZJR19TTkRfSU5ESUdPREpYPW0KQ09ORklHX1NORF9FTVUx
MEsxPW0KQ09ORklHX1NORF9FTVUxMEsxX1NFUT1tCkNPTkZJR19TTkRfRU1VMTBLMVg9bQpDT05G
SUdfU05EX0VOUzEzNzA9bQpDT05GSUdfU05EX0VOUzEzNzE9bQojIENPTkZJR19TTkRfRVMxOTM4
IGlzIG5vdCBzZXQKQ09ORklHX1NORF9FUzE5Njg9bQpDT05GSUdfU05EX0VTMTk2OF9JTlBVVD15
CkNPTkZJR19TTkRfRVMxOTY4X1JBRElPPXkKIyBDT05GSUdfU05EX0ZNODAxIGlzIG5vdCBzZXQK
Q09ORklHX1NORF9IRFNQPW0KQ09ORklHX1NORF9IRFNQTT1tCkNPTkZJR19TTkRfSUNFMTcxMj1t
CkNPTkZJR19TTkRfSUNFMTcyND1tCkNPTkZJR19TTkRfSU5URUw4WDA9bQpDT05GSUdfU05EX0lO
VEVMOFgwTT1tCkNPTkZJR19TTkRfS09SRzEyMTI9bQpDT05GSUdfU05EX0xPTEE9bQpDT05GSUdf
U05EX0xYNjQ2NEVTPW0KQ09ORklHX1NORF9NQUVTVFJPMz1tCkNPTkZJR19TTkRfTUFFU1RSTzNf
SU5QVVQ9eQpDT05GSUdfU05EX01JWEFSVD1tCiMgQ09ORklHX1NORF9OTTI1NiBpcyBub3Qgc2V0
CkNPTkZJR19TTkRfUENYSFI9bQojIENPTkZJR19TTkRfUklQVElERSBpcyBub3Qgc2V0CkNPTkZJ
R19TTkRfUk1FMzI9bQpDT05GSUdfU05EX1JNRTk2PW0KQ09ORklHX1NORF9STUU5NjUyPW0KIyBD
T05GSUdfU05EX1NPTklDVklCRVMgaXMgbm90IHNldApDT05GSUdfU05EX1RSSURFTlQ9bQpDT05G
SUdfU05EX1ZJQTgyWFg9bQpDT05GSUdfU05EX1ZJQTgyWFhfTU9ERU09bQpDT05GSUdfU05EX1ZJ
UlRVT1NPPW0KQ09ORklHX1NORF9WWDIyMj1tCiMgQ09ORklHX1NORF9ZTUZQQ0kgaXMgbm90IHNl
dAoKIwojIEhELUF1ZGlvCiMKQ09ORklHX1NORF9IREE9bQpDT05GSUdfU05EX0hEQV9JTlRFTD1t
CkNPTkZJR19TTkRfSERBX0hXREVQPXkKIyBDT05GSUdfU05EX0hEQV9SRUNPTkZJRyBpcyBub3Qg
c2V0CkNPTkZJR19TTkRfSERBX0lOUFVUX0JFRVA9eQpDT05GSUdfU05EX0hEQV9JTlBVVF9CRUVQ
X01PREU9MAojIENPTkZJR19TTkRfSERBX1BBVENIX0xPQURFUiBpcyBub3Qgc2V0CkNPTkZJR19T
TkRfSERBX0NPREVDX1JFQUxURUs9bQpDT05GSUdfU05EX0hEQV9DT0RFQ19BTkFMT0c9bQpDT05G
SUdfU05EX0hEQV9DT0RFQ19TSUdNQVRFTD1tCkNPTkZJR19TTkRfSERBX0NPREVDX1ZJQT1tCkNP
TkZJR19TTkRfSERBX0NPREVDX0hETUk9bQpDT05GSUdfU05EX0hEQV9DT0RFQ19DSVJSVVM9bQpD
T05GSUdfU05EX0hEQV9DT0RFQ19DT05FWEFOVD1tCkNPTkZJR19TTkRfSERBX0NPREVDX0NBMDEx
MD1tCkNPTkZJR19TTkRfSERBX0NPREVDX0NBMDEzMj1tCkNPTkZJR19TTkRfSERBX0NPREVDX0NB
MDEzMl9EU1A9eQpDT05GSUdfU05EX0hEQV9DT0RFQ19DTUVESUE9bQpDT05GSUdfU05EX0hEQV9D
T0RFQ19TSTMwNTQ9bQpDT05GSUdfU05EX0hEQV9HRU5FUklDPW0KQ09ORklHX1NORF9IREFfUE9X
RVJfU0FWRV9ERUZBVUxUPTAKIyBlbmQgb2YgSEQtQXVkaW8KCkNPTkZJR19TTkRfSERBX0NPUkU9
bQpDT05GSUdfU05EX0hEQV9EU1BfTE9BREVSPXkKQ09ORklHX1NORF9IREFfQ09NUE9ORU5UPXkK
Q09ORklHX1NORF9IREFfSTkxNT15CkNPTkZJR19TTkRfSERBX1BSRUFMTE9DX1NJWkU9NTEyCkNP
TkZJR19TTkRfU1BJPXkKQ09ORklHX1NORF9VU0I9eQpDT05GSUdfU05EX1VTQl9BVURJTz1tCkNP
TkZJR19TTkRfVVNCX0FVRElPX1VTRV9NRURJQV9DT05UUk9MTEVSPXkKQ09ORklHX1NORF9VU0Jf
VUExMDE9bQpDT05GSUdfU05EX1VTQl9VU1gyWT1tCkNPTkZJR19TTkRfVVNCX0NBSUFRPW0KQ09O
RklHX1NORF9VU0JfQ0FJQVFfSU5QVVQ9eQpDT05GSUdfU05EX1VTQl9VUzEyMkw9bQpDT05GSUdf
U05EX1VTQl82RklSRT1tCiMgQ09ORklHX1NORF9VU0JfSElGQUNFIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX0JDRDIwMDAgaXMgbm90IHNldAojIENPTkZJR19TTkRfVVNCX1BPRCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9VU0JfUE9ESEQgaXMgbm90IHNldAojIENPTkZJR19TTkRfVVNCX1RPTkVQ
T1JUIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1VTQl9WQVJJQVggaXMgbm90IHNldApDT05GSUdf
U05EX0ZJUkVXSVJFPXkKQ09ORklHX1NORF9GSVJFV0lSRV9MSUI9bQojIENPTkZJR19TTkRfRElD
RSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9PWEZXIGlzIG5vdCBzZXQKQ09ORklHX1NORF9JU0lH
SFQ9bQojIENPTkZJR19TTkRfRklSRVdPUktTIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0JFQk9C
IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0ZJUkVXSVJFX0RJR0kwMFggaXMgbm90IHNldAojIENP
TkZJR19TTkRfRklSRVdJUkVfVEFTQ0FNIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0ZJUkVXSVJF
X01PVFUgaXMgbm90IHNldAojIENPTkZJR19TTkRfRklSRUZBQ0UgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfU09DIGlzIG5vdCBzZXQKQ09ORklHX1NORF9YODY9eQojIENPTkZJR19IRE1JX0xQRV9B
VURJTyBpcyBub3Qgc2V0CkNPTkZJR19TTkRfU1lOVEhfRU1VWD1tCiMgQ09ORklHX1NORF9YRU5f
RlJPTlRFTkQgaXMgbm90IHNldApDT05GSUdfQUM5N19CVVM9bQoKIwojIEhJRCBzdXBwb3J0CiMK
Q09ORklHX0hJRD15CkNPTkZJR19ISURfQkFUVEVSWV9TVFJFTkdUSD15CkNPTkZJR19ISURSQVc9
eQpDT05GSUdfVUhJRD1tCkNPTkZJR19ISURfR0VORVJJQz15CgojCiMgU3BlY2lhbCBISUQgZHJp
dmVycwojCkNPTkZJR19ISURfQTRURUNIPXkKIyBDT05GSUdfSElEX0FDQ1VUT1VDSCBpcyBub3Qg
c2V0CkNPTkZJR19ISURfQUNSVVg9bQojIENPTkZJR19ISURfQUNSVVhfRkYgaXMgbm90IHNldApD
T05GSUdfSElEX0FQUExFPXkKQ09ORklHX0hJRF9BUFBMRUlSPW0KIyBDT05GSUdfSElEX0FTVVMg
aXMgbm90IHNldApDT05GSUdfSElEX0FVUkVBTD1tCkNPTkZJR19ISURfQkVMS0lOPXkKIyBDT05G
SUdfSElEX0JFVE9QX0ZGIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0JJR0JFTl9GRiBpcyBub3Qg
c2V0CkNPTkZJR19ISURfQ0hFUlJZPXkKQ09ORklHX0hJRF9DSElDT05ZPXkKIyBDT05GSUdfSElE
X0NPUlNBSVIgaXMgbm90IHNldAojIENPTkZJR19ISURfQ09VR0FSIGlzIG5vdCBzZXQKIyBDT05G
SUdfSElEX01BQ0FMTFkgaXMgbm90IHNldApDT05GSUdfSElEX1BST0RJS0VZUz1tCiMgQ09ORklH
X0hJRF9DTUVESUEgaXMgbm90IHNldAojIENPTkZJR19ISURfQ1AyMTEyIGlzIG5vdCBzZXQKQ09O
RklHX0hJRF9DWVBSRVNTPXkKQ09ORklHX0hJRF9EUkFHT05SSVNFPW0KIyBDT05GSUdfRFJBR09O
UklTRV9GRiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9FTVNfRkYgaXMgbm90IHNldAojIENPTkZJ
R19ISURfRUxBTiBpcyBub3Qgc2V0CkNPTkZJR19ISURfRUxFQ09NPW0KIyBDT05GSUdfSElEX0VM
TyBpcyBub3Qgc2V0CkNPTkZJR19ISURfRVpLRVk9eQojIENPTkZJR19ISURfR0VNQklSRCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0hJRF9HRlJNIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9IT0xURUs9bQoj
IENPTkZJR19IT0xURUtfRkYgaXMgbm90IHNldAojIENPTkZJR19ISURfR1Q2ODNSIGlzIG5vdCBz
ZXQKQ09ORklHX0hJRF9LRVlUT1VDSD1tCkNPTkZJR19ISURfS1lFPW0KQ09ORklHX0hJRF9VQ0xP
R0lDPW0KQ09ORklHX0hJRF9XQUxUT1A9bQojIENPTkZJR19ISURfVklFV1NPTklDIGlzIG5vdCBz
ZXQKQ09ORklHX0hJRF9HWVJBVElPTj1tCkNPTkZJR19ISURfSUNBREU9bQojIENPTkZJR19ISURf
SVRFIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0pBQlJBIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9U
V0lOSEFOPW0KQ09ORklHX0hJRF9LRU5TSU5HVE9OPXkKQ09ORklHX0hJRF9MQ1BPV0VSPW0KQ09O
RklHX0hJRF9MRUQ9bQojIENPTkZJR19ISURfTEVOT1ZPIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9M
T0dJVEVDSD15CkNPTkZJR19ISURfTE9HSVRFQ0hfREo9bQpDT05GSUdfSElEX0xPR0lURUNIX0hJ
RFBQPW0KIyBDT05GSUdfTE9HSVRFQ0hfRkYgaXMgbm90IHNldAojIENPTkZJR19MT0dJUlVNQkxF
UEFEMl9GRiBpcyBub3Qgc2V0CiMgQ09ORklHX0xPR0lHOTQwX0ZGIGlzIG5vdCBzZXQKIyBDT05G
SUdfTE9HSVdIRUVMU19GRiBpcyBub3Qgc2V0CkNPTkZJR19ISURfTUFHSUNNT1VTRT15CiMgQ09O
RklHX0hJRF9NQUxUUk9OIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX01BWUZMQVNIIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSElEX1JFRFJBR09OIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9NSUNST1NPRlQ9
eQpDT05GSUdfSElEX01PTlRFUkVZPXkKQ09ORklHX0hJRF9NVUxUSVRPVUNIPW0KIyBDT05GSUdf
SElEX05USSBpcyBub3Qgc2V0CkNPTkZJR19ISURfTlRSSUc9eQpDT05GSUdfSElEX09SVEVLPW0K
Q09ORklHX0hJRF9QQU5USEVSTE9SRD1tCiMgQ09ORklHX1BBTlRIRVJMT1JEX0ZGIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSElEX1BFTk1PVU5UIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9QRVRBTFlOWD1t
CkNPTkZJR19ISURfUElDT0xDRD1tCkNPTkZJR19ISURfUElDT0xDRF9GQj15CkNPTkZJR19ISURf
UElDT0xDRF9CQUNLTElHSFQ9eQpDT05GSUdfSElEX1BJQ09MQ0RfTENEPXkKQ09ORklHX0hJRF9Q
SUNPTENEX0xFRFM9eQpDT05GSUdfSElEX1BJQ09MQ0RfQ0lSPXkKQ09ORklHX0hJRF9QTEFOVFJP
TklDUz15CkNPTkZJR19ISURfUFJJTUFYPW0KIyBDT05GSUdfSElEX1JFVFJPREUgaXMgbm90IHNl
dApDT05GSUdfSElEX1JPQ0NBVD1tCkNPTkZJR19ISURfU0FJVEVLPW0KQ09ORklHX0hJRF9TQU1T
VU5HPW0KQ09ORklHX0hJRF9TT05ZPW0KIyBDT05GSUdfU09OWV9GRiBpcyBub3Qgc2V0CkNPTkZJ
R19ISURfU1BFRURMSU5LPW0KIyBDT05GSUdfSElEX1NURUFNIGlzIG5vdCBzZXQKQ09ORklHX0hJ
RF9TVEVFTFNFUklFUz1tCkNPTkZJR19ISURfU1VOUExVUz1tCiMgQ09ORklHX0hJRF9STUkgaXMg
bm90IHNldApDT05GSUdfSElEX0dSRUVOQVNJQT1tCiMgQ09ORklHX0dSRUVOQVNJQV9GRiBpcyBu
b3Qgc2V0CkNPTkZJR19ISURfSFlQRVJWX01PVVNFPW0KQ09ORklHX0hJRF9TTUFSVEpPWVBMVVM9
bQojIENPTkZJR19TTUFSVEpPWVBMVVNfRkYgaXMgbm90IHNldApDT05GSUdfSElEX1RJVk89bQpD
T05GSUdfSElEX1RPUFNFRUQ9bQpDT05GSUdfSElEX1RISU5HTT1tCkNPTkZJR19ISURfVEhSVVNU
TUFTVEVSPW0KIyBDT05GSUdfVEhSVVNUTUFTVEVSX0ZGIGlzIG5vdCBzZXQKIyBDT05GSUdfSElE
X1VEUkFXX1BTMyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9VMkZaRVJPIGlzIG5vdCBzZXQKQ09O
RklHX0hJRF9XQUNPTT1tCkNPTkZJR19ISURfV0lJTU9URT1tCiMgQ09ORklHX0hJRF9YSU5NTyBp
cyBub3Qgc2V0CkNPTkZJR19ISURfWkVST1BMVVM9bQojIENPTkZJR19aRVJPUExVU19GRiBpcyBu
b3Qgc2V0CkNPTkZJR19ISURfWllEQUNST049bQojIENPTkZJR19ISURfU0VOU09SX0hVQiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0hJRF9BTFBTIGlzIG5vdCBzZXQKIyBlbmQgb2YgU3BlY2lhbCBISUQg
ZHJpdmVycwoKIwojIFVTQiBISUQgc3VwcG9ydAojCkNPTkZJR19VU0JfSElEPXkKQ09ORklHX0hJ
RF9QSUQ9eQpDT05GSUdfVVNCX0hJRERFVj15CiMgZW5kIG9mIFVTQiBISUQgc3VwcG9ydAoKIwoj
IEkyQyBISUQgc3VwcG9ydAojCkNPTkZJR19JMkNfSElEPW0KIyBlbmQgb2YgSTJDIEhJRCBzdXBw
b3J0CgojCiMgSW50ZWwgSVNIIEhJRCBzdXBwb3J0CiMKIyBDT05GSUdfSU5URUxfSVNIX0hJRCBp
cyBub3Qgc2V0CiMgZW5kIG9mIEludGVsIElTSCBISUQgc3VwcG9ydAojIGVuZCBvZiBISUQgc3Vw
cG9ydAoKQ09ORklHX1VTQl9PSENJX0xJVFRMRV9FTkRJQU49eQpDT05GSUdfVVNCX1NVUFBPUlQ9
eQpDT05GSUdfVVNCX0NPTU1PTj15CkNPTkZJR19VU0JfQVJDSF9IQVNfSENEPXkKQ09ORklHX1VT
Qj15CkNPTkZJR19VU0JfUENJPXkKQ09ORklHX1VTQl9BTk5PVU5DRV9ORVdfREVWSUNFUz15Cgoj
CiMgTWlzY2VsbGFuZW91cyBVU0Igb3B0aW9ucwojCkNPTkZJR19VU0JfREVGQVVMVF9QRVJTSVNU
PXkKIyBDT05GSUdfVVNCX0RZTkFNSUNfTUlOT1JTIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX09U
RyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9PVEdfV0hJVEVMSVNUIGlzIG5vdCBzZXQKIyBDT05G
SUdfVVNCX09UR19CTEFDS0xJU1RfSFVCIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0xFRFNfVFJJ
R0dFUl9VU0JQT1JUIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9BVVRPU1VTUEVORF9ERUxBWT0yCkNP
TkZJR19VU0JfTU9OPXkKQ09ORklHX1VTQl9XVVNCPW0KQ09ORklHX1VTQl9XVVNCX0NCQUY9bQoj
IENPTkZJR19VU0JfV1VTQl9DQkFGX0RFQlVHIGlzIG5vdCBzZXQKCiMKIyBVU0IgSG9zdCBDb250
cm9sbGVyIERyaXZlcnMKIwojIENPTkZJR19VU0JfQzY3WDAwX0hDRCBpcyBub3Qgc2V0CkNPTkZJ
R19VU0JfWEhDSV9IQ0Q9eQojIENPTkZJR19VU0JfWEhDSV9EQkdDQVAgaXMgbm90IHNldApDT05G
SUdfVVNCX1hIQ0lfUENJPXkKQ09ORklHX1VTQl9YSENJX1BMQVRGT1JNPXkKQ09ORklHX1VTQl9F
SENJX0hDRD15CkNPTkZJR19VU0JfRUhDSV9ST09UX0hVQl9UVD15CkNPTkZJR19VU0JfRUhDSV9U
VF9ORVdTQ0hFRD15CkNPTkZJR19VU0JfRUhDSV9QQ0k9eQojIENPTkZJR19VU0JfRUhDSV9GU0wg
aXMgbm90IHNldAojIENPTkZJR19VU0JfRUhDSV9IQ0RfUExBVEZPUk0gaXMgbm90IHNldAojIENP
TkZJR19VU0JfT1hVMjEwSFBfSENEIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0lTUDExNlhfSENE
IGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0ZPVEcyMTBfSENEIGlzIG5vdCBzZXQKIyBDT05GSUdf
VVNCX01BWDM0MjFfSENEIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9PSENJX0hDRD15CkNPTkZJR19V
U0JfT0hDSV9IQ0RfUENJPXkKIyBDT05GSUdfVVNCX09IQ0lfSENEX1BMQVRGT1JNIGlzIG5vdCBz
ZXQKQ09ORklHX1VTQl9VSENJX0hDRD15CiMgQ09ORklHX1VTQl9VMTMyX0hDRCBpcyBub3Qgc2V0
CiMgQ09ORklHX1VTQl9TTDgxMV9IQ0QgaXMgbm90IHNldAojIENPTkZJR19VU0JfUjhBNjY1OTdf
SENEIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1dIQ0lfSENEIGlzIG5vdCBzZXQKQ09ORklHX1VT
Ql9IV0FfSENEPW0KIyBDT05GSUdfVVNCX0hDRF9CQ01BIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNC
X0hDRF9TU0IgaXMgbm90IHNldAojIENPTkZJR19VU0JfSENEX1RFU1RfTU9ERSBpcyBub3Qgc2V0
CgojCiMgVVNCIERldmljZSBDbGFzcyBkcml2ZXJzCiMKQ09ORklHX1VTQl9BQ009bQpDT05GSUdf
VVNCX1BSSU5URVI9bQpDT05GSUdfVVNCX1dETT1tCkNPTkZJR19VU0JfVE1DPW0KCiMKIyBOT1RF
OiBVU0JfU1RPUkFHRSBkZXBlbmRzIG9uIFNDU0kgYnV0IEJMS19ERVZfU0QgbWF5CiMKCiMKIyBh
bHNvIGJlIG5lZWRlZDsgc2VlIFVTQl9TVE9SQUdFIEhlbHAgZm9yIG1vcmUgaW5mbwojCkNPTkZJ
R19VU0JfU1RPUkFHRT1tCiMgQ09ORklHX1VTQl9TVE9SQUdFX0RFQlVHIGlzIG5vdCBzZXQKQ09O
RklHX1VTQl9TVE9SQUdFX1JFQUxURUs9bQpDT05GSUdfUkVBTFRFS19BVVRPUE09eQpDT05GSUdf
VVNCX1NUT1JBR0VfREFUQUZBQj1tCkNPTkZJR19VU0JfU1RPUkFHRV9GUkVFQ09NPW0KQ09ORklH
X1VTQl9TVE9SQUdFX0lTRDIwMD1tCkNPTkZJR19VU0JfU1RPUkFHRV9VU0JBVD1tCkNPTkZJR19V
U0JfU1RPUkFHRV9TRERSMDk9bQpDT05GSUdfVVNCX1NUT1JBR0VfU0REUjU1PW0KQ09ORklHX1VT
Ql9TVE9SQUdFX0pVTVBTSE9UPW0KQ09ORklHX1VTQl9TVE9SQUdFX0FMQVVEQT1tCkNPTkZJR19V
U0JfU1RPUkFHRV9PTkVUT1VDSD1tCkNPTkZJR19VU0JfU1RPUkFHRV9LQVJNQT1tCkNPTkZJR19V
U0JfU1RPUkFHRV9DWVBSRVNTX0FUQUNCPW0KQ09ORklHX1VTQl9TVE9SQUdFX0VORV9VQjYyNTA9
bQpDT05GSUdfVVNCX1VBUz1tCgojCiMgVVNCIEltYWdpbmcgZGV2aWNlcwojCkNPTkZJR19VU0Jf
TURDODAwPW0KQ09ORklHX1VTQl9NSUNST1RFSz1tCiMgQ09ORklHX1VTQklQX0NPUkUgaXMgbm90
IHNldAojIENPTkZJR19VU0JfTVVTQl9IRFJDIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9EV0MzPXkK
IyBDT05GSUdfVVNCX0RXQzNfSE9TVCBpcyBub3Qgc2V0CkNPTkZJR19VU0JfRFdDM19HQURHRVQ9
eQojIENPTkZJR19VU0JfRFdDM19EVUFMX1JPTEUgaXMgbm90IHNldAoKIwojIFBsYXRmb3JtIEds
dWUgRHJpdmVyIFN1cHBvcnQKIwpDT05GSUdfVVNCX0RXQzNfUENJPXkKQ09ORklHX1VTQl9EV0Mz
X0hBUFM9eQojIENPTkZJR19VU0JfRFdDMiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9DSElQSURF
QSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9JU1AxNzYwIGlzIG5vdCBzZXQKCiMKIyBVU0IgcG9y
dCBkcml2ZXJzCiMKQ09ORklHX1VTQl9VU1M3MjA9bQpDT05GSUdfVVNCX1NFUklBTD15CkNPTkZJ
R19VU0JfU0VSSUFMX0NPTlNPTEU9eQpDT05GSUdfVVNCX1NFUklBTF9HRU5FUklDPXkKIyBDT05G
SUdfVVNCX1NFUklBTF9TSU1QTEUgaXMgbm90IHNldApDT05GSUdfVVNCX1NFUklBTF9BSVJDQUJM
RT1tCkNPTkZJR19VU0JfU0VSSUFMX0FSSzMxMTY9bQpDT05GSUdfVVNCX1NFUklBTF9CRUxLSU49
bQpDT05GSUdfVVNCX1NFUklBTF9DSDM0MT1tCkNPTkZJR19VU0JfU0VSSUFMX1dISVRFSEVBVD1t
CkNPTkZJR19VU0JfU0VSSUFMX0RJR0lfQUNDRUxFUE9SVD1tCkNPTkZJR19VU0JfU0VSSUFMX0NQ
MjEwWD1tCkNPTkZJR19VU0JfU0VSSUFMX0NZUFJFU1NfTTg9bQpDT05GSUdfVVNCX1NFUklBTF9F
TVBFRz1tCkNPTkZJR19VU0JfU0VSSUFMX0ZURElfU0lPPW0KQ09ORklHX1VTQl9TRVJJQUxfVklT
T1I9bQpDT05GSUdfVVNCX1NFUklBTF9JUEFRPW0KQ09ORklHX1VTQl9TRVJJQUxfSVI9bQpDT05G
SUdfVVNCX1NFUklBTF9FREdFUE9SVD1tCkNPTkZJR19VU0JfU0VSSUFMX0VER0VQT1JUX1RJPW0K
IyBDT05GSUdfVVNCX1NFUklBTF9GODEyMzIgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFM
X0Y4MTUzWCBpcyBub3Qgc2V0CkNPTkZJR19VU0JfU0VSSUFMX0dBUk1JTj1tCkNPTkZJR19VU0Jf
U0VSSUFMX0lQVz1tCkNPTkZJR19VU0JfU0VSSUFMX0lVVT1tCkNPTkZJR19VU0JfU0VSSUFMX0tF
WVNQQU5fUERBPW0KQ09ORklHX1VTQl9TRVJJQUxfS0VZU1BBTj1tCkNPTkZJR19VU0JfU0VSSUFM
X0tMU0k9bQpDT05GSUdfVVNCX1NFUklBTF9LT0JJTF9TQ1Q9bQpDT05GSUdfVVNCX1NFUklBTF9N
Q1RfVTIzMj1tCiMgQ09ORklHX1VTQl9TRVJJQUxfTUVUUk8gaXMgbm90IHNldApDT05GSUdfVVNC
X1NFUklBTF9NT1M3NzIwPW0KQ09ORklHX1VTQl9TRVJJQUxfTU9TNzcxNV9QQVJQT1JUPXkKQ09O
RklHX1VTQl9TRVJJQUxfTU9TNzg0MD1tCiMgQ09ORklHX1VTQl9TRVJJQUxfTVhVUE9SVCBpcyBu
b3Qgc2V0CkNPTkZJR19VU0JfU0VSSUFMX05BVk1BTj1tCkNPTkZJR19VU0JfU0VSSUFMX1BMMjMw
Mz1tCkNPTkZJR19VU0JfU0VSSUFMX09USTY4NTg9bQpDT05GSUdfVVNCX1NFUklBTF9RQ0FVWD1t
CkNPTkZJR19VU0JfU0VSSUFMX1FVQUxDT01NPW0KQ09ORklHX1VTQl9TRVJJQUxfU1BDUDhYNT1t
CkNPTkZJR19VU0JfU0VSSUFMX1NBRkU9bQpDT05GSUdfVVNCX1NFUklBTF9TQUZFX1BBRERFRD15
CkNPTkZJR19VU0JfU0VSSUFMX1NJRVJSQVdJUkVMRVNTPW0KQ09ORklHX1VTQl9TRVJJQUxfU1lN
Qk9MPW0KIyBDT05GSUdfVVNCX1NFUklBTF9USSBpcyBub3Qgc2V0CkNPTkZJR19VU0JfU0VSSUFM
X0NZQkVSSkFDSz1tCkNPTkZJR19VU0JfU0VSSUFMX1hJUkNPTT1tCkNPTkZJR19VU0JfU0VSSUFM
X1dXQU49bQpDT05GSUdfVVNCX1NFUklBTF9PUFRJT049bQpDT05GSUdfVVNCX1NFUklBTF9PTU5J
TkVUPW0KQ09ORklHX1VTQl9TRVJJQUxfT1BUSUNPTj1tCkNPTkZJR19VU0JfU0VSSUFMX1hTRU5T
X01UPW0KIyBDT05GSUdfVVNCX1NFUklBTF9XSVNIQk9ORSBpcyBub3Qgc2V0CkNPTkZJR19VU0Jf
U0VSSUFMX1NTVTEwMD1tCkNPTkZJR19VU0JfU0VSSUFMX1FUMj1tCiMgQ09ORklHX1VTQl9TRVJJ
QUxfVVBENzhGMDczMCBpcyBub3Qgc2V0CkNPTkZJR19VU0JfU0VSSUFMX0RFQlVHPW0KCiMKIyBV
U0IgTWlzY2VsbGFuZW91cyBkcml2ZXJzCiMKQ09ORklHX1VTQl9FTUk2Mj1tCkNPTkZJR19VU0Jf
RU1JMjY9bQpDT05GSUdfVVNCX0FEVVRVWD1tCkNPTkZJR19VU0JfU0VWU0VHPW0KIyBDT05GSUdf
VVNCX1JJTzUwMCBpcyBub3Qgc2V0CkNPTkZJR19VU0JfTEVHT1RPV0VSPW0KQ09ORklHX1VTQl9M
Q0Q9bQojIENPTkZJR19VU0JfQ1lQUkVTU19DWTdDNjMgaXMgbm90IHNldAojIENPTkZJR19VU0Jf
Q1lUSEVSTSBpcyBub3Qgc2V0CkNPTkZJR19VU0JfSURNT1VTRT1tCkNPTkZJR19VU0JfRlRESV9F
TEFOPW0KQ09ORklHX1VTQl9BUFBMRURJU1BMQVk9bQpDT05GSUdfVVNCX1NJU1VTQlZHQT1tCkNP
TkZJR19VU0JfU0lTVVNCVkdBX0NPTj15CkNPTkZJR19VU0JfTEQ9bQojIENPTkZJR19VU0JfVFJB
TkNFVklCUkFUT1IgaXMgbm90IHNldApDT05GSUdfVVNCX0lPV0FSUklPUj1tCiMgQ09ORklHX1VT
Ql9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0VIU0VUX1RFU1RfRklYVFVSRSBpcyBub3Qg
c2V0CkNPTkZJR19VU0JfSVNJR0hURlc9bQojIENPTkZJR19VU0JfWVVSRVggaXMgbm90IHNldApD
T05GSUdfVVNCX0VaVVNCX0ZYMj1tCiMgQ09ORklHX1VTQl9IVUJfVVNCMjUxWEIgaXMgbm90IHNl
dApDT05GSUdfVVNCX0hTSUNfVVNCMzUwMz1tCiMgQ09ORklHX1VTQl9IU0lDX1VTQjQ2MDQgaXMg
bm90IHNldAojIENPTkZJR19VU0JfTElOS19MQVlFUl9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdf
VVNCX0NIQU9TS0VZIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9BVE09bQpDT05GSUdfVVNCX1NQRUVE
VE9VQ0g9bQpDT05GSUdfVVNCX0NYQUNSVT1tCkNPTkZJR19VU0JfVUVBR0xFQVRNPW0KQ09ORklH
X1VTQl9YVVNCQVRNPW0KCiMKIyBVU0IgUGh5c2ljYWwgTGF5ZXIgZHJpdmVycwojCkNPTkZJR19V
U0JfUEhZPXkKQ09ORklHX05PUF9VU0JfWENFSVY9eQojIENPTkZJR19VU0JfR1BJT19WQlVTIGlz
IG5vdCBzZXQKIyBDT05GSUdfVVNCX0lTUDEzMDEgaXMgbm90IHNldAojIGVuZCBvZiBVU0IgUGh5
c2ljYWwgTGF5ZXIgZHJpdmVycwoKQ09ORklHX1VTQl9HQURHRVQ9eQojIENPTkZJR19VU0JfR0FE
R0VUX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0dBREdFVF9ERUJVR19GSUxFUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1VTQl9HQURHRVRfREVCVUdfRlMgaXMgbm90IHNldApDT05GSUdfVVNC
X0dBREdFVF9WQlVTX0RSQVc9MgpDT05GSUdfVVNCX0dBREdFVF9TVE9SQUdFX05VTV9CVUZGRVJT
PTIKCiMKIyBVU0IgUGVyaXBoZXJhbCBDb250cm9sbGVyCiMKIyBDT05GSUdfVVNCX0ZPVEcyMTBf
VURDIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0dSX1VEQyBpcyBub3Qgc2V0CiMgQ09ORklHX1VT
Ql9SOEE2NjU5NyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9QWEEyN1ggaXMgbm90IHNldAojIENP
TkZJR19VU0JfTVZfVURDIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX01WX1UzRCBpcyBub3Qgc2V0
CiMgQ09ORklHX1VTQl9NNjY1OTIgaXMgbm90IHNldAojIENPTkZJR19VU0JfQkRDX1VEQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1VTQl9BTUQ1NTM2VURDIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX05F
VDIyNzIgaXMgbm90IHNldAojIENPTkZJR19VU0JfTkVUMjI4MCBpcyBub3Qgc2V0CiMgQ09ORklH
X1VTQl9HT0tVIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0VHMjBUIGlzIG5vdCBzZXQKIyBDT05G
SUdfVVNCX0RVTU1ZX0hDRCBpcyBub3Qgc2V0CiMgZW5kIG9mIFVTQiBQZXJpcGhlcmFsIENvbnRy
b2xsZXIKCkNPTkZJR19VU0JfTElCQ09NUE9TSVRFPW0KQ09ORklHX1VTQl9GX01BU1NfU1RPUkFH
RT1tCiMgQ09ORklHX1VTQl9DT05GSUdGUyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9aRVJPIGlz
IG5vdCBzZXQKIyBDT05GSUdfVVNCX0FVRElPIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0VUSCBp
cyBub3Qgc2V0CiMgQ09ORklHX1VTQl9HX05DTSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9HQURH
RVRGUyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9GVU5DVElPTkZTIGlzIG5vdCBzZXQKQ09ORklH
X1VTQl9NQVNTX1NUT1JBR0U9bQojIENPTkZJR19VU0JfR0FER0VUX1RBUkdFVCBpcyBub3Qgc2V0
CiMgQ09ORklHX1VTQl9HX1NFUklBTCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9NSURJX0dBREdF
VCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9HX1BSSU5URVIgaXMgbm90IHNldAojIENPTkZJR19V
U0JfQ0RDX0NPTVBPU0lURSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9HX0FDTV9NUyBpcyBub3Qg
c2V0CiMgQ09ORklHX1VTQl9HX01VTFRJIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0dfSElEIGlz
IG5vdCBzZXQKIyBDT05GSUdfVVNCX0dfREJHUCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9HX1dF
QkNBTSBpcyBub3Qgc2V0CiMgQ09ORklHX1RZUEVDIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1JP
TEVfU1dJVENIIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0xFRF9UUklHIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX1VMUElfQlVTIGlzIG5vdCBzZXQKQ09ORklHX1VXQj1tCkNPTkZJR19VV0JfSFdB
PW0KQ09ORklHX1VXQl9XSENJPW0KQ09ORklHX1VXQl9JMTQ4MFU9bQpDT05GSUdfTU1DPW0KQ09O
RklHX01NQ19CTE9DSz1tCkNPTkZJR19NTUNfQkxPQ0tfTUlOT1JTPTgKQ09ORklHX1NESU9fVUFS
VD1tCiMgQ09ORklHX01NQ19URVNUIGlzIG5vdCBzZXQKCiMKIyBNTUMvU0QvU0RJTyBIb3N0IENv
bnRyb2xsZXIgRHJpdmVycwojCiMgQ09ORklHX01NQ19ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19N
TUNfU0RIQ0k9bQpDT05GSUdfTU1DX1NESENJX1BDST1tCkNPTkZJR19NTUNfUklDT0hfTU1DPXkK
Q09ORklHX01NQ19TREhDSV9BQ1BJPW0KQ09ORklHX01NQ19TREhDSV9QTFRGTT1tCiMgQ09ORklH
X01NQ19TREhDSV9GX1NESDMwIGlzIG5vdCBzZXQKIyBDT05GSUdfTU1DX1dCU0QgaXMgbm90IHNl
dApDT05GSUdfTU1DX1RJRk1fU0Q9bQojIENPTkZJR19NTUNfU1BJIGlzIG5vdCBzZXQKQ09ORklH
X01NQ19DQjcxMD1tCkNPTkZJR19NTUNfVklBX1NETU1DPW0KQ09ORklHX01NQ19WVUIzMDA9bQpD
T05GSUdfTU1DX1VTSEM9bQojIENPTkZJR19NTUNfVVNESEk2Uk9MMCBpcyBub3Qgc2V0CkNPTkZJ
R19NTUNfQ1FIQ0k9bQojIENPTkZJR19NTUNfVE9TSElCQV9QQ0kgaXMgbm90IHNldAojIENPTkZJ
R19NTUNfTVRLIGlzIG5vdCBzZXQKIyBDT05GSUdfTU1DX1NESENJX1hFTk9OIGlzIG5vdCBzZXQK
Q09ORklHX01FTVNUSUNLPW0KIyBDT05GSUdfTUVNU1RJQ0tfREVCVUcgaXMgbm90IHNldAoKIwoj
IE1lbW9yeVN0aWNrIGRyaXZlcnMKIwojIENPTkZJR19NRU1TVElDS19VTlNBRkVfUkVTVU1FIGlz
IG5vdCBzZXQKQ09ORklHX01TUFJPX0JMT0NLPW0KIyBDT05GSUdfTVNfQkxPQ0sgaXMgbm90IHNl
dAoKIwojIE1lbW9yeVN0aWNrIEhvc3QgQ29udHJvbGxlciBEcml2ZXJzCiMKQ09ORklHX01FTVNU
SUNLX1RJRk1fTVM9bQpDT05GSUdfTUVNU1RJQ0tfSk1JQ1JPTl8zOFg9bQpDT05GSUdfTUVNU1RJ
Q0tfUjU5Mj1tCkNPTkZJR19ORVdfTEVEUz15CkNPTkZJR19MRURTX0NMQVNTPXkKIyBDT05GSUdf
TEVEU19DTEFTU19GTEFTSCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfQlJJR0hUTkVTU19IV19D
SEFOR0VEIGlzIG5vdCBzZXQKCiMKIyBMRUQgZHJpdmVycwojCiMgQ09ORklHX0xFRFNfQVBVIGlz
IG5vdCBzZXQKQ09ORklHX0xFRFNfTE0zNTMwPW0KIyBDT05GSUdfTEVEU19MTTM1MzIgaXMgbm90
IHNldAojIENPTkZJR19MRURTX0xNMzY0MiBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfUENBOTUz
MiBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfR1BJTyBpcyBub3Qgc2V0CkNPTkZJR19MRURTX0xQ
Mzk0ND1tCiMgQ09ORklHX0xFRFNfTFAzOTUyIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfTFA1NVhY
X0NPTU1PTj1tCkNPTkZJR19MRURTX0xQNTUyMT1tCkNPTkZJR19MRURTX0xQNTUyMz1tCkNPTkZJ
R19MRURTX0xQNTU2Mj1tCiMgQ09ORklHX0xFRFNfTFA4NTAxIGlzIG5vdCBzZXQKQ09ORklHX0xF
RFNfQ0xFVk9fTUFJTD1tCiMgQ09ORklHX0xFRFNfUENBOTU1WCBpcyBub3Qgc2V0CiMgQ09ORklH
X0xFRFNfUENBOTYzWCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfREFDMTI0UzA4NSBpcyBub3Qg
c2V0CiMgQ09ORklHX0xFRFNfUFdNIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19CRDI4MDIgaXMg
bm90IHNldApDT05GSUdfTEVEU19JTlRFTF9TUzQyMDA9bQojIENPTkZJR19MRURTX1RDQTY1MDcg
aXMgbm90IHNldAojIENPTkZJR19MRURTX1RMQzU5MVhYIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVE
U19MTTM1NXggaXMgbm90IHNldAoKIwojIExFRCBkcml2ZXIgZm9yIGJsaW5rKDEpIFVTQiBSR0Ig
TEVEIGlzIHVuZGVyIFNwZWNpYWwgSElEIGRyaXZlcnMgKEhJRF9USElOR00pCiMKQ09ORklHX0xF
RFNfQkxJTktNPW0KIyBDT05GSUdfTEVEU19NTFhDUExEIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVE
U19NTFhSRUcgaXMgbm90IHNldAojIENPTkZJR19MRURTX1VTRVIgaXMgbm90IHNldAojIENPTkZJ
R19MRURTX05JQzc4QlggaXMgbm90IHNldAoKIwojIExFRCBUcmlnZ2VycwojCkNPTkZJR19MRURT
X1RSSUdHRVJTPXkKQ09ORklHX0xFRFNfVFJJR0dFUl9USU1FUj1tCkNPTkZJR19MRURTX1RSSUdH
RVJfT05FU0hPVD1tCiMgQ09ORklHX0xFRFNfVFJJR0dFUl9ESVNLIGlzIG5vdCBzZXQKIyBDT05G
SUdfTEVEU19UUklHR0VSX01URCBpcyBub3Qgc2V0CkNPTkZJR19MRURTX1RSSUdHRVJfSEVBUlRC
RUFUPW0KQ09ORklHX0xFRFNfVFJJR0dFUl9CQUNLTElHSFQ9bQojIENPTkZJR19MRURTX1RSSUdH
RVJfQ1BVIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19UUklHR0VSX0FDVElWSVRZIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTEVEU19UUklHR0VSX0dQSU8gaXMgbm90IHNldApDT05GSUdfTEVEU19UUklH
R0VSX0RFRkFVTFRfT049bQoKIwojIGlwdGFibGVzIHRyaWdnZXIgaXMgdW5kZXIgTmV0ZmlsdGVy
IGNvbmZpZyAoTEVEIHRhcmdldCkKIwpDT05GSUdfTEVEU19UUklHR0VSX1RSQU5TSUVOVD1tCkNP
TkZJR19MRURTX1RSSUdHRVJfQ0FNRVJBPW0KIyBDT05GSUdfTEVEU19UUklHR0VSX1BBTklDIGlz
IG5vdCBzZXQKIyBDT05GSUdfTEVEU19UUklHR0VSX05FVERFViBpcyBub3Qgc2V0CiMgQ09ORklH
X0xFRFNfVFJJR0dFUl9QQVRURVJOIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfVFJJR0dFUl9BVURJ
Tz1tCiMgQ09ORklHX0FDQ0VTU0lCSUxJVFkgaXMgbm90IHNldAojIENPTkZJR19JTkZJTklCQU5E
IGlzIG5vdCBzZXQKQ09ORklHX0VEQUNfQVRPTUlDX1NDUlVCPXkKQ09ORklHX0VEQUNfU1VQUE9S
VD15CkNPTkZJR19FREFDPXkKQ09ORklHX0VEQUNfTEVHQUNZX1NZU0ZTPXkKIyBDT05GSUdfRURB
Q19ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19FREFDX0RFQ09ERV9NQ0U9bQojIENPTkZJR19FREFD
X0dIRVMgaXMgbm90IHNldApDT05GSUdfRURBQ19BTUQ2ND1tCiMgQ09ORklHX0VEQUNfQU1ENjRf
RVJST1JfSU5KRUNUSU9OIGlzIG5vdCBzZXQKQ09ORklHX0VEQUNfRTc1Mlg9bQpDT05GSUdfRURB
Q19JODI5NzVYPW0KQ09ORklHX0VEQUNfSTMwMDA9bQpDT05GSUdfRURBQ19JMzIwMD1tCiMgQ09O
RklHX0VEQUNfSUUzMTIwMCBpcyBub3Qgc2V0CkNPTkZJR19FREFDX1gzOD1tCkNPTkZJR19FREFD
X0k1NDAwPW0KQ09ORklHX0VEQUNfSTdDT1JFPW0KQ09ORklHX0VEQUNfSTUwMDA9bQpDT05GSUdf
RURBQ19JNTEwMD1tCkNPTkZJR19FREFDX0k3MzAwPW0KQ09ORklHX0VEQUNfU0JSSURHRT1tCkNP
TkZJR19FREFDX1NLWD1tCiMgQ09ORklHX0VEQUNfSTEwTk0gaXMgbm90IHNldAojIENPTkZJR19F
REFDX1BORDIgaXMgbm90IHNldApDT05GSUdfUlRDX0xJQj15CkNPTkZJR19SVENfTUMxNDY4MThf
TElCPXkKQ09ORklHX1JUQ19DTEFTUz15CkNPTkZJR19SVENfSENUT1NZUz15CkNPTkZJR19SVENf
SENUT1NZU19ERVZJQ0U9InJ0YzAiCiMgQ09ORklHX1JUQ19TWVNUT0hDIGlzIG5vdCBzZXQKIyBD
T05GSUdfUlRDX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX1JUQ19OVk1FTT15CgojCiMgUlRDIGlu
dGVyZmFjZXMKIwpDT05GSUdfUlRDX0lOVEZfU1lTRlM9eQpDT05GSUdfUlRDX0lOVEZfUFJPQz15
CkNPTkZJR19SVENfSU5URl9ERVY9eQojIENPTkZJR19SVENfSU5URl9ERVZfVUlFX0VNVUwgaXMg
bm90IHNldAojIENPTkZJR19SVENfRFJWX1RFU1QgaXMgbm90IHNldAoKIwojIEkyQyBSVEMgZHJp
dmVycwojCiMgQ09ORklHX1JUQ19EUlZfQUJCNVpFUzMgaXMgbm90IHNldAojIENPTkZJR19SVENf
RFJWX0FCRU9aOSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfQUJYODBYIGlzIG5vdCBzZXQK
Q09ORklHX1JUQ19EUlZfRFMxMzA3PW0KIyBDT05GSUdfUlRDX0RSVl9EUzEzMDdfQ0VOVFVSWSBp
cyBub3Qgc2V0CkNPTkZJR19SVENfRFJWX0RTMTM3ND1tCiMgQ09ORklHX1JUQ19EUlZfRFMxMzc0
X1dEVCBpcyBub3Qgc2V0CkNPTkZJR19SVENfRFJWX0RTMTY3Mj1tCkNPTkZJR19SVENfRFJWX01B
WDY5MDA9bQpDT05GSUdfUlRDX0RSVl9SUzVDMzcyPW0KQ09ORklHX1JUQ19EUlZfSVNMMTIwOD1t
CkNPTkZJR19SVENfRFJWX0lTTDEyMDIyPW0KQ09ORklHX1JUQ19EUlZfWDEyMDU9bQpDT05GSUdf
UlRDX0RSVl9QQ0Y4NTIzPW0KIyBDT05GSUdfUlRDX0RSVl9QQ0Y4NTA2MyBpcyBub3Qgc2V0CiMg
Q09ORklHX1JUQ19EUlZfUENGODUzNjMgaXMgbm90IHNldApDT05GSUdfUlRDX0RSVl9QQ0Y4NTYz
PW0KQ09ORklHX1JUQ19EUlZfUENGODU4Mz1tCkNPTkZJR19SVENfRFJWX000MVQ4MD1tCkNPTkZJ
R19SVENfRFJWX000MVQ4MF9XRFQ9eQpDT05GSUdfUlRDX0RSVl9CUTMySz1tCiMgQ09ORklHX1JU
Q19EUlZfUzM1MzkwQSBpcyBub3Qgc2V0CkNPTkZJR19SVENfRFJWX0ZNMzEzMD1tCiMgQ09ORklH
X1JUQ19EUlZfUlg4MDEwIGlzIG5vdCBzZXQKQ09ORklHX1JUQ19EUlZfUlg4NTgxPW0KQ09ORklH
X1JUQ19EUlZfUlg4MDI1PW0KQ09ORklHX1JUQ19EUlZfRU0zMDI3PW0KIyBDT05GSUdfUlRDX0RS
Vl9SVjMwMjggaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1JWODgwMyBpcyBub3Qgc2V0CiMg
Q09ORklHX1JUQ19EUlZfU0QzMDc4IGlzIG5vdCBzZXQKCiMKIyBTUEkgUlRDIGRyaXZlcnMKIwoj
IENPTkZJR19SVENfRFJWX000MVQ5MyBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfTTQxVDk0
IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9EUzEzMDIgaXMgbm90IHNldAojIENPTkZJR19S
VENfRFJWX0RTMTMwNSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfRFMxMzQzIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUlRDX0RSVl9EUzEzNDcgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0RT
MTM5MCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfTUFYNjkxNiBpcyBub3Qgc2V0CiMgQ09O
RklHX1JUQ19EUlZfUjk3MDEgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1JYNDU4MSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUlg2MTEwIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RS
Vl9SUzVDMzQ4IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9NQVg2OTAyIGlzIG5vdCBzZXQK
IyBDT05GSUdfUlRDX0RSVl9QQ0YyMTIzIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9NQ1A3
OTUgaXMgbm90IHNldApDT05GSUdfUlRDX0kyQ19BTkRfU1BJPXkKCiMKIyBTUEkgYW5kIEkyQyBS
VEMgZHJpdmVycwojCkNPTkZJR19SVENfRFJWX0RTMzIzMj1tCkNPTkZJR19SVENfRFJWX0RTMzIz
Ml9IV01PTj15CiMgQ09ORklHX1JUQ19EUlZfUENGMjEyNyBpcyBub3Qgc2V0CkNPTkZJR19SVENf
RFJWX1JWMzAyOUMyPW0KQ09ORklHX1JUQ19EUlZfUlYzMDI5X0hXTU9OPXkKCiMKIyBQbGF0Zm9y
bSBSVEMgZHJpdmVycwojCkNPTkZJR19SVENfRFJWX0NNT1M9eQpDT05GSUdfUlRDX0RSVl9EUzEy
ODY9bQpDT05GSUdfUlRDX0RSVl9EUzE1MTE9bQpDT05GSUdfUlRDX0RSVl9EUzE1NTM9bQojIENP
TkZJR19SVENfRFJWX0RTMTY4NV9GQU1JTFkgaXMgbm90IHNldApDT05GSUdfUlRDX0RSVl9EUzE3
NDI9bQpDT05GSUdfUlRDX0RSVl9EUzI0MDQ9bQpDT05GSUdfUlRDX0RSVl9TVEsxN1RBOD1tCiMg
Q09ORklHX1JUQ19EUlZfTTQ4VDg2IGlzIG5vdCBzZXQKQ09ORklHX1JUQ19EUlZfTTQ4VDM1PW0K
Q09ORklHX1JUQ19EUlZfTTQ4VDU5PW0KQ09ORklHX1JUQ19EUlZfTVNNNjI0Mj1tCkNPTkZJR19S
VENfRFJWX0JRNDgwMj1tCkNPTkZJR19SVENfRFJWX1JQNUMwMT1tCkNPTkZJR19SVENfRFJWX1Yz
MDIwPW0KCiMKIyBvbi1DUFUgUlRDIGRyaXZlcnMKIwojIENPTkZJR19SVENfRFJWX0ZUUlRDMDEw
IGlzIG5vdCBzZXQKCiMKIyBISUQgU2Vuc29yIFJUQyBkcml2ZXJzCiMKQ09ORklHX0RNQURFVklD
RVM9eQojIENPTkZJR19ETUFERVZJQ0VTX0RFQlVHIGlzIG5vdCBzZXQKCiMKIyBETUEgRGV2aWNl
cwojCkNPTkZJR19ETUFfRU5HSU5FPXkKQ09ORklHX0RNQV9WSVJUVUFMX0NIQU5ORUxTPXkKQ09O
RklHX0RNQV9BQ1BJPXkKIyBDT05GSUdfQUxURVJBX01TR0RNQSBpcyBub3Qgc2V0CiMgQ09ORklH
X0lOVEVMX0lETUE2NCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVMX0lPQVRETUEgaXMgbm90IHNl
dAojIENPTkZJR19RQ09NX0hJRE1BX01HTVQgaXMgbm90IHNldAojIENPTkZJR19RQ09NX0hJRE1B
IGlzIG5vdCBzZXQKQ09ORklHX0RXX0RNQUNfQ09SRT15CkNPTkZJR19EV19ETUFDPW0KQ09ORklH
X0RXX0RNQUNfUENJPXkKQ09ORklHX0hTVV9ETUE9eQoKIwojIERNQSBDbGllbnRzCiMKQ09ORklH
X0FTWU5DX1RYX0RNQT15CkNPTkZJR19ETUFURVNUPW0KQ09ORklHX0RNQV9FTkdJTkVfUkFJRD15
CgojCiMgRE1BQlVGIG9wdGlvbnMKIwpDT05GSUdfU1lOQ19GSUxFPXkKQ09ORklHX1NXX1NZTkM9
eQojIENPTkZJR19VRE1BQlVGIGlzIG5vdCBzZXQKIyBlbmQgb2YgRE1BQlVGIG9wdGlvbnMKCkNP
TkZJR19BVVhESVNQTEFZPXkKIyBDT05GSUdfSEQ0NDc4MCBpcyBub3Qgc2V0CkNPTkZJR19LUzAx
MDg9bQpDT05GSUdfS1MwMTA4X1BPUlQ9MHgzNzgKQ09ORklHX0tTMDEwOF9ERUxBWT0yCkNPTkZJ
R19DRkFHMTI4NjRCPW0KQ09ORklHX0NGQUcxMjg2NEJfUkFURT0yMAojIENPTkZJR19JTUdfQVND
SUlfTENEIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFSUE9SVF9QQU5FTCBpcyBub3Qgc2V0CiMgQ09O
RklHX0NIQVJMQ0RfQkxfT0ZGIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkxDRF9CTF9PTiBpcyBu
b3Qgc2V0CkNPTkZJR19DSEFSTENEX0JMX0ZMQVNIPXkKIyBDT05GSUdfUEFORUwgaXMgbm90IHNl
dApDT05GSUdfVUlPPW0KQ09ORklHX1VJT19DSUY9bQpDT05GSUdfVUlPX1BEUlZfR0VOSVJRPW0K
IyBDT05GSUdfVUlPX0RNRU1fR0VOSVJRIGlzIG5vdCBzZXQKQ09ORklHX1VJT19BRUM9bQpDT05G
SUdfVUlPX1NFUkNPUzM9bQpDT05GSUdfVUlPX1BDSV9HRU5FUklDPW0KIyBDT05GSUdfVUlPX05F
VFggaXMgbm90IHNldAojIENPTkZJR19VSU9fUFJVU1MgaXMgbm90IHNldAojIENPTkZJR19VSU9f
TUY2MjQgaXMgbm90IHNldAojIENPTkZJR19VSU9fSFZfR0VORVJJQyBpcyBub3Qgc2V0CkNPTkZJ
R19WRklPX0lPTU1VX1RZUEUxPW0KQ09ORklHX1ZGSU9fVklSUUZEPW0KQ09ORklHX1ZGSU89bQoj
IENPTkZJR19WRklPX05PSU9NTVUgaXMgbm90IHNldApDT05GSUdfVkZJT19QQ0k9bQojIENPTkZJ
R19WRklPX1BDSV9WR0EgaXMgbm90IHNldApDT05GSUdfVkZJT19QQ0lfTU1BUD15CkNPTkZJR19W
RklPX1BDSV9JTlRYPXkKQ09ORklHX1ZGSU9fUENJX0lHRD15CiMgQ09ORklHX1ZGSU9fTURFViBp
cyBub3Qgc2V0CkNPTkZJR19JUlFfQllQQVNTX01BTkFHRVI9bQojIENPTkZJR19WSVJUX0RSSVZF
UlMgaXMgbm90IHNldApDT05GSUdfVklSVElPPXkKQ09ORklHX1ZJUlRJT19NRU5VPXkKQ09ORklH
X1ZJUlRJT19QQ0k9eQpDT05GSUdfVklSVElPX1BDSV9MRUdBQ1k9eQpDT05GSUdfVklSVElPX0JB
TExPT049eQojIENPTkZJR19WSVJUSU9fSU5QVVQgaXMgbm90IHNldAojIENPTkZJR19WSVJUSU9f
TU1JTyBpcyBub3Qgc2V0CgojCiMgTWljcm9zb2Z0IEh5cGVyLVYgZ3Vlc3Qgc3VwcG9ydAojCkNP
TkZJR19IWVBFUlY9bQpDT05GSUdfSFlQRVJWX1RTQ1BBR0U9eQpDT05GSUdfSFlQRVJWX1VUSUxT
PW0KQ09ORklHX0hZUEVSVl9CQUxMT09OPW0KIyBlbmQgb2YgTWljcm9zb2Z0IEh5cGVyLVYgZ3Vl
c3Qgc3VwcG9ydAoKIwojIFhlbiBkcml2ZXIgc3VwcG9ydAojCkNPTkZJR19YRU5fQkFMTE9PTj15
CiMgQ09ORklHX1hFTl9TRUxGQkFMTE9PTklORyBpcyBub3Qgc2V0CiMgQ09ORklHX1hFTl9CQUxM
T09OX01FTU9SWV9IT1RQTFVHIGlzIG5vdCBzZXQKQ09ORklHX1hFTl9TQ1JVQl9QQUdFU19ERUZB
VUxUPXkKQ09ORklHX1hFTl9ERVZfRVZUQ0hOPW0KQ09ORklHX1hFTl9CQUNLRU5EPXkKQ09ORklH
X1hFTkZTPW0KQ09ORklHX1hFTl9DT01QQVRfWEVORlM9eQpDT05GSUdfWEVOX1NZU19IWVBFUlZJ
U09SPXkKQ09ORklHX1hFTl9YRU5CVVNfRlJPTlRFTkQ9eQojIENPTkZJR19YRU5fR05UREVWIGlz
IG5vdCBzZXQKIyBDT05GSUdfWEVOX0dSQU5UX0RFVl9BTExPQyBpcyBub3Qgc2V0CiMgQ09ORklH
X1hFTl9HUkFOVF9ETUFfQUxMT0MgaXMgbm90IHNldApDT05GSUdfU1dJT1RMQl9YRU49eQpDT05G
SUdfWEVOX1RNRU09bQpDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5EPW0KIyBDT05GSUdfWEVOX1BW
Q0FMTFNfRlJPTlRFTkQgaXMgbm90IHNldAojIENPTkZJR19YRU5fUFZDQUxMU19CQUNLRU5EIGlz
IG5vdCBzZXQKIyBDT05GSUdfWEVOX1NDU0lfQkFDS0VORCBpcyBub3Qgc2V0CkNPTkZJR19YRU5f
UFJJVkNNRD1tCkNPTkZJR19YRU5fQUNQSV9QUk9DRVNTT1I9bQojIENPTkZJR19YRU5fTUNFX0xP
RyBpcyBub3Qgc2V0CkNPTkZJR19YRU5fSEFWRV9QVk1NVT15CkNPTkZJR19YRU5fRUZJPXkKQ09O
RklHX1hFTl9BVVRPX1hMQVRFPXkKQ09ORklHX1hFTl9BQ1BJPXkKQ09ORklHX1hFTl9TWU1TPXkK
Q09ORklHX1hFTl9IQVZFX1ZQTVU9eQojIGVuZCBvZiBYZW4gZHJpdmVyIHN1cHBvcnQKCkNPTkZJ
R19TVEFHSU5HPXkKIyBDT05GSUdfUFJJU00yX1VTQiBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTUVE
SSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUTDgxOTJVIGlzIG5vdCBzZXQKQ09ORklHX1JUTExJQj1t
CkNPTkZJR19SVExMSUJfQ1JZUFRPX0NDTVA9bQpDT05GSUdfUlRMTElCX0NSWVBUT19US0lQPW0K
Q09ORklHX1JUTExJQl9DUllQVE9fV0VQPW0KQ09ORklHX1JUTDgxOTJFPW0KIyBDT05GSUdfUlRM
ODcyM0JTIGlzIG5vdCBzZXQKQ09ORklHX1I4NzEyVT1tCiMgQ09ORklHX1I4MTg4RVUgaXMgbm90
IHNldAojIENPTkZJR19SVFM1MjA4IGlzIG5vdCBzZXQKIyBDT05GSUdfVlQ2NjU1IGlzIG5vdCBz
ZXQKIyBDT05GSUdfVlQ2NjU2IGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfU003NTAgaXMgbm90IHNl
dAoKIwojIFNwZWFrdXAgY29uc29sZSBzcGVlY2gKIwojIENPTkZJR19TUEVBS1VQIGlzIG5vdCBz
ZXQKIyBlbmQgb2YgU3BlYWt1cCBjb25zb2xlIHNwZWVjaAoKIyBDT05GSUdfU1RBR0lOR19NRURJ
QSBpcyBub3Qgc2V0CgojCiMgQW5kcm9pZAojCiMgQ09ORklHX0FTSE1FTSBpcyBub3Qgc2V0CiMg
Q09ORklHX0FORFJPSURfVlNPQyBpcyBub3Qgc2V0CkNPTkZJR19JT049eQpDT05GSUdfSU9OX1NZ
U1RFTV9IRUFQPXkKIyBDT05GSUdfSU9OX0NBUlZFT1VUX0hFQVAgaXMgbm90IHNldAojIENPTkZJ
R19JT05fQ0hVTktfSEVBUCBpcyBub3Qgc2V0CiMgQ09ORklHX0lPTl9DTUFfSEVBUCBpcyBub3Qg
c2V0CiMgZW5kIG9mIEFuZHJvaWQKCiMgQ09ORklHX0xURV9HRE03MjRYIGlzIG5vdCBzZXQKQ09O
RklHX0ZJUkVXSVJFX1NFUklBTD1tCkNPTkZJR19GV1RUWV9NQVhfVE9UQUxfUE9SVFM9NjQKQ09O
RklHX0ZXVFRZX01BWF9DQVJEX1BPUlRTPTMyCiMgQ09ORklHX0dTX0ZQR0FCT09UIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVU5JU1lTU1BBUiBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1RGVCBpcyBub3Qg
c2V0CiMgQ09ORklHX1dJTEMxMDAwX1NESU8gaXMgbm90IHNldAojIENPTkZJR19XSUxDMTAwMF9T
UEkgaXMgbm90IHNldAojIENPTkZJR19NT1NUIGlzIG5vdCBzZXQKIyBDT05GSUdfS1M3MDEwIGlz
IG5vdCBzZXQKIyBDT05GSUdfR1JFWUJVUyBpcyBub3Qgc2V0CiMgQ09ORklHX1BJNDMzIGlzIG5v
dCBzZXQKCiMKIyBHYXNrZXQgZGV2aWNlcwojCiMgQ09ORklHX1NUQUdJTkdfR0FTS0VUX0ZSQU1F
V09SSyBpcyBub3Qgc2V0CiMgZW5kIG9mIEdhc2tldCBkZXZpY2VzCgojIENPTkZJR19FUk9GU19G
UyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZJRUxEQlVTX0RFViBpcyBub3Qgc2V0CiMgQ09ORklHX0tQ
QzIwMDAgaXMgbm90IHNldApDT05GSUdfWDg2X1BMQVRGT1JNX0RFVklDRVM9eQpDT05GSUdfQUNF
Ul9XTUk9bQojIENPTkZJR19BQ0VSX1dJUkVMRVNTIGlzIG5vdCBzZXQKQ09ORklHX0FDRVJIREY9
bQojIENPTkZJR19BTElFTldBUkVfV01JIGlzIG5vdCBzZXQKQ09ORklHX0FTVVNfTEFQVE9QPW0K
Q09ORklHX0RDREJBUz1tCiMgQ09ORklHX0RFTExfU01CSU9TIGlzIG5vdCBzZXQKQ09ORklHX0RF
TExfV01JX0FJTz1tCiMgQ09ORklHX0RFTExfV01JX0xFRCBpcyBub3Qgc2V0CiMgQ09ORklHX0RF
TExfU01PODgwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RFTExfUkJUTiBpcyBub3Qgc2V0CkNPTkZJ
R19ERUxMX1JCVT1tCkNPTkZJR19GVUpJVFNVX0xBUFRPUD1tCkNPTkZJR19GVUpJVFNVX1RBQkxF
VD1tCkNPTkZJR19BTUlMT19SRktJTEw9bQojIENPTkZJR19HUERfUE9DS0VUX0ZBTiBpcyBub3Qg
c2V0CkNPTkZJR19IUF9BQ0NFTD1tCiMgQ09ORklHX0hQX1dJUkVMRVNTIGlzIG5vdCBzZXQKQ09O
RklHX0hQX1dNST1tCiMgQ09ORklHX0xHX0xBUFRPUCBpcyBub3Qgc2V0CkNPTkZJR19NU0lfTEFQ
VE9QPW0KQ09ORklHX1BBTkFTT05JQ19MQVBUT1A9bQpDT05GSUdfQ09NUEFMX0xBUFRPUD1tCkNP
TkZJR19TT05ZX0xBUFRPUD1tCkNPTkZJR19TT05ZUElfQ09NUEFUPXkKQ09ORklHX0lERUFQQURf
TEFQVE9QPW0KIyBDT05GSUdfU1VSRkFDRTNfV01JIGlzIG5vdCBzZXQKQ09ORklHX1RISU5LUEFE
X0FDUEk9bQpDT05GSUdfVEhJTktQQURfQUNQSV9BTFNBX1NVUFBPUlQ9eQojIENPTkZJR19USElO
S1BBRF9BQ1BJX0RFQlVHRkFDSUxJVElFUyBpcyBub3Qgc2V0CiMgQ09ORklHX1RISU5LUEFEX0FD
UElfREVCVUcgaXMgbm90IHNldAojIENPTkZJR19USElOS1BBRF9BQ1BJX1VOU0FGRV9MRURTIGlz
IG5vdCBzZXQKQ09ORklHX1RISU5LUEFEX0FDUElfVklERU89eQpDT05GSUdfVEhJTktQQURfQUNQ
SV9IT1RLRVlfUE9MTD15CkNPTkZJR19TRU5TT1JTX0hEQVBTPW0KIyBDT05GSUdfSU5URUxfTUVO
TE9XIGlzIG5vdCBzZXQKQ09ORklHX0VFRVBDX0xBUFRPUD1tCkNPTkZJR19BU1VTX1dNST1tCkNP
TkZJR19BU1VTX05CX1dNST1tCkNPTkZJR19FRUVQQ19XTUk9bQojIENPTkZJR19BU1VTX1dJUkVM
RVNTIGlzIG5vdCBzZXQKQ09ORklHX0FDUElfV01JPW0KQ09ORklHX1dNSV9CTU9GPW0KIyBDT05G
SUdfSU5URUxfV01JX1RIVU5ERVJCT0xUIGlzIG5vdCBzZXQKQ09ORklHX01TSV9XTUk9bQojIENP
TkZJR19QRUFRX1dNSSBpcyBub3Qgc2V0CkNPTkZJR19UT1BTVEFSX0xBUFRPUD1tCkNPTkZJR19U
T1NISUJBX0JUX1JGS0lMTD1tCiMgQ09ORklHX1RPU0hJQkFfSEFQUyBpcyBub3Qgc2V0CiMgQ09O
RklHX1RPU0hJQkFfV01JIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUxfSU5UMDAwMl9WR1BJTyBp
cyBub3Qgc2V0CiMgQ09ORklHX0lOVEVMX0hJRF9FVkVOVCBpcyBub3Qgc2V0CiMgQ09ORklHX0lO
VEVMX1ZCVE4gaXMgbm90IHNldApDT05GSUdfSU5URUxfSVBTPW0KIyBDT05GSUdfSU5URUxfUE1D
X0NPUkUgaXMgbm90IHNldAojIENPTkZJR19JQk1fUlRMIGlzIG5vdCBzZXQKQ09ORklHX1NBTVNV
TkdfTEFQVE9QPW0KQ09ORklHX01YTV9XTUk9bQpDT05GSUdfSU5URUxfT0FLVFJBSUw9bQpDT05G
SUdfQVBQTEVfR01VWD1tCiMgQ09ORklHX0lOVEVMX1JTVCBpcyBub3Qgc2V0CiMgQ09ORklHX0lO
VEVMX1NNQVJUQ09OTkVDVCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVMX1BNQ19JUEMgaXMgbm90
IHNldAojIENPTkZJR19TVVJGQUNFX1BSTzNfQlVUVE9OIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5U
RUxfUFVOSVRfSVBDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUxYX1BMQVRGT1JNIGlzIG5vdCBzZXQK
IyBDT05GSUdfSU5URUxfVFVSQk9fTUFYXzMgaXMgbm90IHNldAojIENPTkZJR19JMkNfTVVMVElf
SU5TVEFOVElBVEUgaXMgbm90IHNldAojIENPTkZJR19JTlRFTF9BVE9NSVNQMl9QTSBpcyBub3Qg
c2V0CiMgQ09ORklHX0hVQVdFSV9XTUkgaXMgbm90IHNldAojIENPTkZJR19QQ0VOR0lORVNfQVBV
MiBpcyBub3Qgc2V0CkNPTkZJR19QTUNfQVRPTT15CiMgQ09ORklHX0NIUk9NRV9QTEFURk9STVMg
aXMgbm90IHNldAojIENPTkZJR19NRUxMQU5PWF9QTEFURk9STSBpcyBub3Qgc2V0CkNPTkZJR19D
TEtERVZfTE9PS1VQPXkKQ09ORklHX0hBVkVfQ0xLX1BSRVBBUkU9eQpDT05GSUdfQ09NTU9OX0NM
Sz15CgojCiMgQ29tbW9uIENsb2NrIEZyYW1ld29yawojCiMgQ09ORklHX0NPTU1PTl9DTEtfTUFY
OTQ4NSBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfU0k1MzUxIGlzIG5vdCBzZXQKIyBD
T05GSUdfQ09NTU9OX0NMS19TSTU0NCBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfQ0RD
RTcwNiBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfQ1MyMDAwX0NQIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ09NTU9OX0NMS19QV00gaXMgbm90IHNldAojIGVuZCBvZiBDb21tb24gQ2xvY2sg
RnJhbWV3b3JrCgojIENPTkZJR19IV1NQSU5MT0NLIGlzIG5vdCBzZXQKCiMKIyBDbG9jayBTb3Vy
Y2UgZHJpdmVycwojCkNPTkZJR19DTEtFVlRfSTgyNTM9eQpDT05GSUdfSTgyNTNfTE9DSz15CkNP
TkZJR19DTEtCTERfSTgyNTM9eQojIGVuZCBvZiBDbG9jayBTb3VyY2UgZHJpdmVycwoKQ09ORklH
X01BSUxCT1g9eQpDT05GSUdfUENDPXkKIyBDT05GSUdfQUxURVJBX01CT1ggaXMgbm90IHNldApD
T05GSUdfSU9NTVVfSU9WQT15CkNPTkZJR19JT01NVV9BUEk9eQpDT05GSUdfSU9NTVVfU1VQUE9S
VD15CgojCiMgR2VuZXJpYyBJT01NVSBQYWdldGFibGUgU3VwcG9ydAojCiMgZW5kIG9mIEdlbmVy
aWMgSU9NTVUgUGFnZXRhYmxlIFN1cHBvcnQKCiMgQ09ORklHX0lPTU1VX0RFQlVHRlMgaXMgbm90
IHNldAojIENPTkZJR19JT01NVV9ERUZBVUxUX1BBU1NUSFJPVUdIIGlzIG5vdCBzZXQKQ09ORklH
X0FNRF9JT01NVT15CkNPTkZJR19BTURfSU9NTVVfVjI9bQpDT05GSUdfRE1BUl9UQUJMRT15CkNP
TkZJR19JTlRFTF9JT01NVT15CiMgQ09ORklHX0lOVEVMX0lPTU1VX1NWTSBpcyBub3Qgc2V0CiMg
Q09ORklHX0lOVEVMX0lPTU1VX0RFRkFVTFRfT04gaXMgbm90IHNldApDT05GSUdfSU5URUxfSU9N
TVVfRkxPUFBZX1dBPXkKQ09ORklHX0lSUV9SRU1BUD15CkNPTkZJR19IWVBFUlZfSU9NTVU9eQoK
IwojIFJlbW90ZXByb2MgZHJpdmVycwojCiMgQ09ORklHX1JFTU9URVBST0MgaXMgbm90IHNldAoj
IGVuZCBvZiBSZW1vdGVwcm9jIGRyaXZlcnMKCiMKIyBScG1zZyBkcml2ZXJzCiMKIyBDT05GSUdf
UlBNU0dfUUNPTV9HTElOS19SUE0gaXMgbm90IHNldAojIENPTkZJR19SUE1TR19WSVJUSU8gaXMg
bm90IHNldAojIGVuZCBvZiBScG1zZyBkcml2ZXJzCgojIENPTkZJR19TT1VORFdJUkUgaXMgbm90
IHNldAoKIwojIFNPQyAoU3lzdGVtIE9uIENoaXApIHNwZWNpZmljIERyaXZlcnMKIwoKIwojIEFt
bG9naWMgU29DIGRyaXZlcnMKIwojIGVuZCBvZiBBbWxvZ2ljIFNvQyBkcml2ZXJzCgojCiMgQXNw
ZWVkIFNvQyBkcml2ZXJzCiMKIyBlbmQgb2YgQXNwZWVkIFNvQyBkcml2ZXJzCgojCiMgQnJvYWRj
b20gU29DIGRyaXZlcnMKIwojIGVuZCBvZiBCcm9hZGNvbSBTb0MgZHJpdmVycwoKIwojIE5YUC9G
cmVlc2NhbGUgUW9ySVEgU29DIGRyaXZlcnMKIwojIGVuZCBvZiBOWFAvRnJlZXNjYWxlIFFvcklR
IFNvQyBkcml2ZXJzCgojCiMgaS5NWCBTb0MgZHJpdmVycwojCiMgZW5kIG9mIGkuTVggU29DIGRy
aXZlcnMKCiMKIyBJWFA0eHggU29DIGRyaXZlcnMKIwojIENPTkZJR19JWFA0WFhfUU1HUiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lYUDRYWF9OUEUgaXMgbm90IHNldAojIGVuZCBvZiBJWFA0eHggU29D
IGRyaXZlcnMKCiMKIyBRdWFsY29tbSBTb0MgZHJpdmVycwojCiMgZW5kIG9mIFF1YWxjb21tIFNv
QyBkcml2ZXJzCgojIENPTkZJR19TT0NfVEkgaXMgbm90IHNldAoKIwojIFhpbGlueCBTb0MgZHJp
dmVycwojCiMgQ09ORklHX1hJTElOWF9WQ1UgaXMgbm90IHNldAojIGVuZCBvZiBYaWxpbnggU29D
IGRyaXZlcnMKIyBlbmQgb2YgU09DIChTeXN0ZW0gT24gQ2hpcCkgc3BlY2lmaWMgRHJpdmVycwoK
Q09ORklHX1BNX0RFVkZSRVE9eQoKIwojIERFVkZSRVEgR292ZXJub3JzCiMKQ09ORklHX0RFVkZS
RVFfR09WX1NJTVBMRV9PTkRFTUFORD1tCiMgQ09ORklHX0RFVkZSRVFfR09WX1BFUkZPUk1BTkNF
IGlzIG5vdCBzZXQKIyBDT05GSUdfREVWRlJFUV9HT1ZfUE9XRVJTQVZFIGlzIG5vdCBzZXQKIyBD
T05GSUdfREVWRlJFUV9HT1ZfVVNFUlNQQUNFIGlzIG5vdCBzZXQKIyBDT05GSUdfREVWRlJFUV9H
T1ZfUEFTU0lWRSBpcyBub3Qgc2V0CgojCiMgREVWRlJFUSBEcml2ZXJzCiMKIyBDT05GSUdfUE1f
REVWRlJFUV9FVkVOVCBpcyBub3Qgc2V0CkNPTkZJR19FWFRDT049eQoKIwojIEV4dGNvbiBEZXZp
Y2UgRHJpdmVycwojCiMgQ09ORklHX0VYVENPTl9HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfRVhU
Q09OX0lOVEVMX0lOVDM0OTYgaXMgbm90IHNldAojIENPTkZJR19FWFRDT05fTUFYMzM1NSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0VYVENPTl9QVE41MTUwIGlzIG5vdCBzZXQKIyBDT05GSUdfRVhUQ09O
X1JUODk3M0EgaXMgbm90IHNldAojIENPTkZJR19FWFRDT05fU001NTAyIGlzIG5vdCBzZXQKIyBD
T05GSUdfRVhUQ09OX1VTQl9HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVNT1JZIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSUlPIGlzIG5vdCBzZXQKQ09ORklHX05UQj1tCiMgQ09ORklHX05UQl9BTUQg
aXMgbm90IHNldAojIENPTkZJR19OVEJfSURUIGlzIG5vdCBzZXQKIyBDT05GSUdfTlRCX0lOVEVM
IGlzIG5vdCBzZXQKIyBDT05GSUdfTlRCX1NXSVRDSFRFQyBpcyBub3Qgc2V0CiMgQ09ORklHX05U
Ql9QSU5HUE9ORyBpcyBub3Qgc2V0CiMgQ09ORklHX05UQl9UT09MIGlzIG5vdCBzZXQKIyBDT05G
SUdfTlRCX1BFUkYgaXMgbm90IHNldAojIENPTkZJR19OVEJfVFJBTlNQT1JUIGlzIG5vdCBzZXQK
IyBDT05GSUdfVk1FX0JVUyBpcyBub3Qgc2V0CkNPTkZJR19QV009eQpDT05GSUdfUFdNX1NZU0ZT
PXkKQ09ORklHX1BXTV9MUFNTPW0KQ09ORklHX1BXTV9MUFNTX1BDST1tCkNPTkZJR19QV01fTFBT
U19QTEFURk9STT1tCiMgQ09ORklHX1BXTV9QQ0E5Njg1IGlzIG5vdCBzZXQKCiMKIyBJUlEgY2hp
cCBzdXBwb3J0CiMKQ09ORklHX0FSTV9HSUNfTUFYX05SPTEKIyBlbmQgb2YgSVJRIGNoaXAgc3Vw
cG9ydAoKIyBDT05GSUdfSVBBQ0tfQlVTIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVTRVRfQ09OVFJP
TExFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0ZNQyBpcyBub3Qgc2V0CgojCiMgUEhZIFN1YnN5c3Rl
bQojCkNPTkZJR19HRU5FUklDX1BIWT15CiMgQ09ORklHX0JDTV9LT05BX1VTQjJfUEhZIGlzIG5v
dCBzZXQKIyBDT05GSUdfUEhZX1BYQV8yOE5NX0hTSUMgaXMgbm90IHNldAojIENPTkZJR19QSFlf
UFhBXzI4Tk1fVVNCMiBpcyBub3Qgc2V0CiMgZW5kIG9mIFBIWSBTdWJzeXN0ZW0KCkNPTkZJR19Q
T1dFUkNBUD15CkNPTkZJR19JTlRFTF9SQVBMPW0KIyBDT05GSUdfSURMRV9JTkpFQ1QgaXMgbm90
IHNldAojIENPTkZJR19NQ0IgaXMgbm90IHNldAoKIwojIFBlcmZvcm1hbmNlIG1vbml0b3Igc3Vw
cG9ydAojCiMgZW5kIG9mIFBlcmZvcm1hbmNlIG1vbml0b3Igc3VwcG9ydAoKQ09ORklHX1JBUz15
CiMgQ09ORklHX1JBU19DRUMgaXMgbm90IHNldAojIENPTkZJR19USFVOREVSQk9MVCBpcyBub3Qg
c2V0CgojCiMgQW5kcm9pZAojCkNPTkZJR19BTkRST0lEPXkKIyBDT05GSUdfQU5EUk9JRF9CSU5E
RVJfSVBDIGlzIG5vdCBzZXQKIyBlbmQgb2YgQW5kcm9pZAoKQ09ORklHX0xJQk5WRElNTT1tCkNP
TkZJR19CTEtfREVWX1BNRU09bQpDT05GSUdfTkRfQkxLPW0KQ09ORklHX05EX0NMQUlNPXkKQ09O
RklHX05EX0JUVD1tCkNPTkZJR19CVFQ9eQpDT05GSUdfTkRfUEZOPW0KQ09ORklHX05WRElNTV9Q
Rk49eQpDT05GSUdfTlZESU1NX0RBWD15CkNPTkZJR19OVkRJTU1fS0VZUz15CkNPTkZJR19EQVhf
RFJJVkVSPXkKQ09ORklHX0RBWD15CkNPTkZJR19ERVZfREFYPW0KQ09ORklHX0RFVl9EQVhfUE1F
TT1tCkNPTkZJR19ERVZfREFYX0tNRU09bQpDT05GSUdfREVWX0RBWF9QTUVNX0NPTVBBVD1tCkNP
TkZJR19OVk1FTT15CkNPTkZJR19OVk1FTV9TWVNGUz15CgojCiMgSFcgdHJhY2luZyBzdXBwb3J0
CiMKQ09ORklHX1NUTT1tCiMgQ09ORklHX1NUTV9QUk9UT19CQVNJQyBpcyBub3Qgc2V0CiMgQ09O
RklHX1NUTV9QUk9UT19TWVNfVCBpcyBub3Qgc2V0CkNPTkZJR19TVE1fRFVNTVk9bQpDT05GSUdf
U1RNX1NPVVJDRV9DT05TT0xFPW0KQ09ORklHX1NUTV9TT1VSQ0VfSEVBUlRCRUFUPW0KQ09ORklH
X1NUTV9TT1VSQ0VfRlRSQUNFPW0KQ09ORklHX0lOVEVMX1RIPW0KQ09ORklHX0lOVEVMX1RIX1BD
ST1tCiMgQ09ORklHX0lOVEVMX1RIX0FDUEkgaXMgbm90IHNldApDT05GSUdfSU5URUxfVEhfR1RI
PW0KQ09ORklHX0lOVEVMX1RIX1NUSD1tCkNPTkZJR19JTlRFTF9USF9NU1U9bQpDT05GSUdfSU5U
RUxfVEhfUFRJPW0KIyBDT05GSUdfSU5URUxfVEhfREVCVUcgaXMgbm90IHNldAojIGVuZCBvZiBI
VyB0cmFjaW5nIHN1cHBvcnQKCiMgQ09ORklHX0ZQR0EgaXMgbm90IHNldApDT05GSUdfUE1fT1BQ
PXkKIyBDT05GSUdfVU5JU1lTX1ZJU09SQlVTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0lPWCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NMSU1CVVMgaXMgbm90IHNldAojIENPTkZJR19JTlRFUkNPTk5FQ1Qg
aXMgbm90IHNldAojIENPTkZJR19DT1VOVEVSIGlzIG5vdCBzZXQKIyBlbmQgb2YgRGV2aWNlIERy
aXZlcnMKCiMKIyBGaWxlIHN5c3RlbXMKIwpDT05GSUdfRENBQ0hFX1dPUkRfQUNDRVNTPXkKQ09O
RklHX1ZBTElEQVRFX0ZTX1BBUlNFUj15CkNPTkZJR19GU19JT01BUD15CiMgQ09ORklHX0VYVDJf
RlMgaXMgbm90IHNldAojIENPTkZJR19FWFQzX0ZTIGlzIG5vdCBzZXQKQ09ORklHX0VYVDRfRlM9
eQpDT05GSUdfRVhUNF9VU0VfRk9SX0VYVDI9eQpDT05GSUdfRVhUNF9GU19QT1NJWF9BQ0w9eQpD
T05GSUdfRVhUNF9GU19TRUNVUklUWT15CiMgQ09ORklHX0VYVDRfREVCVUcgaXMgbm90IHNldApD
T05GSUdfSkJEMj15CiMgQ09ORklHX0pCRDJfREVCVUcgaXMgbm90IHNldApDT05GSUdfRlNfTUJD
QUNIRT15CiMgQ09ORklHX1JFSVNFUkZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfSkZTX0ZTIGlz
IG5vdCBzZXQKQ09ORklHX1hGU19GUz1tCkNPTkZJR19YRlNfUVVPVEE9eQpDT05GSUdfWEZTX1BP
U0lYX0FDTD15CkNPTkZJR19YRlNfUlQ9eQpDT05GSUdfWEZTX09OTElORV9TQ1JVQj15CkNPTkZJ
R19YRlNfT05MSU5FX1JFUEFJUj15CkNPTkZJR19YRlNfREVCVUc9eQpDT05GSUdfWEZTX0FTU0VS
VF9GQVRBTD15CkNPTkZJR19HRlMyX0ZTPW0KQ09ORklHX0dGUzJfRlNfTE9DS0lOR19ETE09eQpD
T05GSUdfT0NGUzJfRlM9bQpDT05GSUdfT0NGUzJfRlNfTzJDQj1tCkNPTkZJR19PQ0ZTMl9GU19V
U0VSU1BBQ0VfQ0xVU1RFUj1tCkNPTkZJR19PQ0ZTMl9GU19TVEFUUz15CkNPTkZJR19PQ0ZTMl9E
RUJVR19NQVNLTE9HPXkKIyBDT05GSUdfT0NGUzJfREVCVUdfRlMgaXMgbm90IHNldApDT05GSUdf
QlRSRlNfRlM9bQpDT05GSUdfQlRSRlNfRlNfUE9TSVhfQUNMPXkKIyBDT05GSUdfQlRSRlNfRlNf
Q0hFQ0tfSU5URUdSSVRZIGlzIG5vdCBzZXQKIyBDT05GSUdfQlRSRlNfRlNfUlVOX1NBTklUWV9U
RVNUUyBpcyBub3Qgc2V0CiMgQ09ORklHX0JUUkZTX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdf
QlRSRlNfQVNTRVJUIGlzIG5vdCBzZXQKIyBDT05GSUdfQlRSRlNfRlNfUkVGX1ZFUklGWSBpcyBu
b3Qgc2V0CiMgQ09ORklHX05JTEZTMl9GUyBpcyBub3Qgc2V0CkNPTkZJR19GMkZTX0ZTPW0KQ09O
RklHX0YyRlNfU1RBVF9GUz15CkNPTkZJR19GMkZTX0ZTX1hBVFRSPXkKQ09ORklHX0YyRlNfRlNf
UE9TSVhfQUNMPXkKIyBDT05GSUdfRjJGU19GU19TRUNVUklUWSBpcyBub3Qgc2V0CiMgQ09ORklH
X0YyRlNfQ0hFQ0tfRlMgaXMgbm90IHNldAojIENPTkZJR19GMkZTX0lPX1RSQUNFIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRjJGU19GQVVMVF9JTkpFQ1RJT04gaXMgbm90IHNldApDT05GSUdfRlNfREFY
PXkKQ09ORklHX0ZTX0RBWF9QTUQ9eQpDT05GSUdfRlNfUE9TSVhfQUNMPXkKQ09ORklHX0VYUE9S
VEZTPXkKIyBDT05GSUdfRVhQT1JURlNfQkxPQ0tfT1BTIGlzIG5vdCBzZXQKQ09ORklHX0ZJTEVf
TE9DS0lORz15CkNPTkZJR19NQU5EQVRPUllfRklMRV9MT0NLSU5HPXkKQ09ORklHX0ZTX0VOQ1JZ
UFRJT049eQpDT05GSUdfRlNOT1RJRlk9eQpDT05GSUdfRE5PVElGWT15CkNPTkZJR19JTk9USUZZ
X1VTRVI9eQpDT05GSUdfRkFOT1RJRlk9eQpDT05GSUdfRkFOT1RJRllfQUNDRVNTX1BFUk1JU1NJ
T05TPXkKQ09ORklHX1FVT1RBPXkKQ09ORklHX1FVT1RBX05FVExJTktfSU5URVJGQUNFPXkKQ09O
RklHX1BSSU5UX1FVT1RBX1dBUk5JTkc9eQojIENPTkZJR19RVU9UQV9ERUJVRyBpcyBub3Qgc2V0
CkNPTkZJR19RVU9UQV9UUkVFPXkKIyBDT05GSUdfUUZNVF9WMSBpcyBub3Qgc2V0CkNPTkZJR19R
Rk1UX1YyPXkKQ09ORklHX1FVT1RBQ1RMPXkKQ09ORklHX1FVT1RBQ1RMX0NPTVBBVD15CkNPTkZJ
R19BVVRPRlM0X0ZTPXkKQ09ORklHX0FVVE9GU19GUz15CkNPTkZJR19GVVNFX0ZTPW0KQ09ORklH
X0NVU0U9bQpDT05GSUdfT1ZFUkxBWV9GUz1tCiMgQ09ORklHX09WRVJMQVlfRlNfUkVESVJFQ1Rf
RElSIGlzIG5vdCBzZXQKQ09ORklHX09WRVJMQVlfRlNfUkVESVJFQ1RfQUxXQVlTX0ZPTExPVz15
CiMgQ09ORklHX09WRVJMQVlfRlNfSU5ERVggaXMgbm90IHNldAojIENPTkZJR19PVkVSTEFZX0ZT
X1hJTk9fQVVUTyBpcyBub3Qgc2V0CiMgQ09ORklHX09WRVJMQVlfRlNfTUVUQUNPUFkgaXMgbm90
IHNldAoKIwojIENhY2hlcwojCkNPTkZJR19GU0NBQ0hFPW0KQ09ORklHX0ZTQ0FDSEVfU1RBVFM9
eQojIENPTkZJR19GU0NBQ0hFX0hJU1RPR1JBTSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZTQ0FDSEVf
REVCVUcgaXMgbm90IHNldAojIENPTkZJR19GU0NBQ0hFX09CSkVDVF9MSVNUIGlzIG5vdCBzZXQK
Q09ORklHX0NBQ0hFRklMRVM9bQojIENPTkZJR19DQUNIRUZJTEVTX0RFQlVHIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ0FDSEVGSUxFU19ISVNUT0dSQU0gaXMgbm90IHNldAojIGVuZCBvZiBDYWNoZXMK
CiMKIyBDRC1ST00vRFZEIEZpbGVzeXN0ZW1zCiMKQ09ORklHX0lTTzk2NjBfRlM9bQpDT05GSUdf
Sk9MSUVUPXkKQ09ORklHX1pJU09GUz15CkNPTkZJR19VREZfRlM9bQojIGVuZCBvZiBDRC1ST00v
RFZEIEZpbGVzeXN0ZW1zCgojCiMgRE9TL0ZBVC9OVCBGaWxlc3lzdGVtcwojCkNPTkZJR19GQVRf
RlM9bQpDT05GSUdfTVNET1NfRlM9bQpDT05GSUdfVkZBVF9GUz1tCkNPTkZJR19GQVRfREVGQVVM
VF9DT0RFUEFHRT00MzcKQ09ORklHX0ZBVF9ERUZBVUxUX0lPQ0hBUlNFVD0iYXNjaWkiCiMgQ09O
RklHX0ZBVF9ERUZBVUxUX1VURjggaXMgbm90IHNldAojIENPTkZJR19OVEZTX0ZTIGlzIG5vdCBz
ZXQKIyBlbmQgb2YgRE9TL0ZBVC9OVCBGaWxlc3lzdGVtcwoKIwojIFBzZXVkbyBmaWxlc3lzdGVt
cwojCkNPTkZJR19QUk9DX0ZTPXkKQ09ORklHX1BST0NfS0NPUkU9eQpDT05GSUdfUFJPQ19WTUNP
UkU9eQojIENPTkZJR19QUk9DX1ZNQ09SRV9ERVZJQ0VfRFVNUCBpcyBub3Qgc2V0CkNPTkZJR19Q
Uk9DX1NZU0NUTD15CkNPTkZJR19QUk9DX1BBR0VfTU9OSVRPUj15CkNPTkZJR19QUk9DX0NISUxE
UkVOPXkKQ09ORklHX0tFUk5GUz15CkNPTkZJR19TWVNGUz15CkNPTkZJR19UTVBGUz15CkNPTkZJ
R19UTVBGU19QT1NJWF9BQ0w9eQpDT05GSUdfVE1QRlNfWEFUVFI9eQpDT05GSUdfSFVHRVRMQkZT
PXkKQ09ORklHX0hVR0VUTEJfUEFHRT15CkNPTkZJR19NRU1GRF9DUkVBVEU9eQpDT05GSUdfQVJD
SF9IQVNfR0lHQU5USUNfUEFHRT15CkNPTkZJR19DT05GSUdGU19GUz15CkNPTkZJR19FRklWQVJf
RlM9eQojIGVuZCBvZiBQc2V1ZG8gZmlsZXN5c3RlbXMKCkNPTkZJR19NSVNDX0ZJTEVTWVNURU1T
PXkKIyBDT05GSUdfT1JBTkdFRlNfRlMgaXMgbm90IHNldAojIENPTkZJR19BREZTX0ZTIGlzIG5v
dCBzZXQKIyBDT05GSUdfQUZGU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX0VDUllQVF9GUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0hGU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hGU1BMVVNfRlMgaXMg
bm90IHNldAojIENPTkZJR19CRUZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfQkZTX0ZTIGlzIG5v
dCBzZXQKIyBDT05GSUdfRUZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfSkZGUzJfRlMgaXMgbm90
IHNldAojIENPTkZJR19VQklGU19GUyBpcyBub3Qgc2V0CkNPTkZJR19DUkFNRlM9bQpDT05GSUdf
Q1JBTUZTX0JMT0NLREVWPXkKIyBDT05GSUdfQ1JBTUZTX01URCBpcyBub3Qgc2V0CkNPTkZJR19T
UVVBU0hGUz1tCkNPTkZJR19TUVVBU0hGU19GSUxFX0NBQ0hFPXkKIyBDT05GSUdfU1FVQVNIRlNf
RklMRV9ESVJFQ1QgaXMgbm90IHNldApDT05GSUdfU1FVQVNIRlNfREVDT01QX1NJTkdMRT15CiMg
Q09ORklHX1NRVUFTSEZTX0RFQ09NUF9NVUxUSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NRVUFTSEZT
X0RFQ09NUF9NVUxUSV9QRVJDUFUgaXMgbm90IHNldApDT05GSUdfU1FVQVNIRlNfWEFUVFI9eQpD
T05GSUdfU1FVQVNIRlNfWkxJQj15CiMgQ09ORklHX1NRVUFTSEZTX0xaNCBpcyBub3Qgc2V0CkNP
TkZJR19TUVVBU0hGU19MWk89eQpDT05GSUdfU1FVQVNIRlNfWFo9eQojIENPTkZJR19TUVVBU0hG
U19aU1REIGlzIG5vdCBzZXQKIyBDT05GSUdfU1FVQVNIRlNfNEtfREVWQkxLX1NJWkUgaXMgbm90
IHNldAojIENPTkZJR19TUVVBU0hGU19FTUJFRERFRCBpcyBub3Qgc2V0CkNPTkZJR19TUVVBU0hG
U19GUkFHTUVOVF9DQUNIRV9TSVpFPTMKIyBDT05GSUdfVlhGU19GUyBpcyBub3Qgc2V0CkNPTkZJ
R19NSU5JWF9GUz1tCiMgQ09ORklHX09NRlNfRlMgaXMgbm90IHNldAojIENPTkZJR19IUEZTX0ZT
IGlzIG5vdCBzZXQKIyBDT05GSUdfUU5YNEZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfUU5YNkZT
X0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfUk9NRlNfRlMgaXMgbm90IHNldApDT05GSUdfUFNUT1JF
PXkKQ09ORklHX1BTVE9SRV9ERUZMQVRFX0NPTVBSRVNTPXkKIyBDT05GSUdfUFNUT1JFX0xaT19D
T01QUkVTUyBpcyBub3Qgc2V0CiMgQ09ORklHX1BTVE9SRV9MWjRfQ09NUFJFU1MgaXMgbm90IHNl
dAojIENPTkZJR19QU1RPUkVfTFo0SENfQ09NUFJFU1MgaXMgbm90IHNldAojIENPTkZJR19QU1RP
UkVfODQyX0NPTVBSRVNTIGlzIG5vdCBzZXQKIyBDT05GSUdfUFNUT1JFX1pTVERfQ09NUFJFU1Mg
aXMgbm90IHNldApDT05GSUdfUFNUT1JFX0NPTVBSRVNTPXkKQ09ORklHX1BTVE9SRV9ERUZMQVRF
X0NPTVBSRVNTX0RFRkFVTFQ9eQpDT05GSUdfUFNUT1JFX0NPTVBSRVNTX0RFRkFVTFQ9ImRlZmxh
dGUiCkNPTkZJR19QU1RPUkVfQ09OU09MRT15CkNPTkZJR19QU1RPUkVfUE1TRz15CiMgQ09ORklH
X1BTVE9SRV9GVFJBQ0UgaXMgbm90IHNldApDT05GSUdfUFNUT1JFX1JBTT1tCiMgQ09ORklHX1NZ
U1ZfRlMgaXMgbm90IHNldAojIENPTkZJR19VRlNfRlMgaXMgbm90IHNldApDT05GSUdfTkVUV09S
S19GSUxFU1lTVEVNUz15CkNPTkZJR19ORlNfRlM9eQojIENPTkZJR19ORlNfVjIgaXMgbm90IHNl
dApDT05GSUdfTkZTX1YzPXkKQ09ORklHX05GU19WM19BQ0w9eQpDT05GSUdfTkZTX1Y0PW0KIyBD
T05GSUdfTkZTX1NXQVAgaXMgbm90IHNldApDT05GSUdfTkZTX1Y0XzE9eQpDT05GSUdfTkZTX1Y0
XzI9eQpDT05GSUdfUE5GU19GSUxFX0xBWU9VVD1tCkNPTkZJR19QTkZTX0JMT0NLPW0KQ09ORklH
X1BORlNfRkxFWEZJTEVfTEFZT1VUPW0KQ09ORklHX05GU19WNF8xX0lNUExFTUVOVEFUSU9OX0lE
X0RPTUFJTj0ia2VybmVsLm9yZyIKIyBDT05GSUdfTkZTX1Y0XzFfTUlHUkFUSU9OIGlzIG5vdCBz
ZXQKQ09ORklHX05GU19WNF9TRUNVUklUWV9MQUJFTD15CkNPTkZJR19ST09UX05GUz15CiMgQ09O
RklHX05GU19VU0VfTEVHQUNZX0ROUyBpcyBub3Qgc2V0CkNPTkZJR19ORlNfVVNFX0tFUk5FTF9E
TlM9eQpDT05GSUdfTkZTX0RFQlVHPXkKQ09ORklHX05GU0Q9bQpDT05GSUdfTkZTRF9WMl9BQ0w9
eQpDT05GSUdfTkZTRF9WMz15CkNPTkZJR19ORlNEX1YzX0FDTD15CkNPTkZJR19ORlNEX1Y0PXkK
IyBDT05GSUdfTkZTRF9CTE9DS0xBWU9VVCBpcyBub3Qgc2V0CiMgQ09ORklHX05GU0RfU0NTSUxB
WU9VVCBpcyBub3Qgc2V0CiMgQ09ORklHX05GU0RfRkxFWEZJTEVMQVlPVVQgaXMgbm90IHNldApD
T05GSUdfTkZTRF9WNF9TRUNVUklUWV9MQUJFTD15CiMgQ09ORklHX05GU0RfRkFVTFRfSU5KRUNU
SU9OIGlzIG5vdCBzZXQKQ09ORklHX0dSQUNFX1BFUklPRD15CkNPTkZJR19MT0NLRD15CkNPTkZJ
R19MT0NLRF9WND15CkNPTkZJR19ORlNfQUNMX1NVUFBPUlQ9eQpDT05GSUdfTkZTX0NPTU1PTj15
CkNPTkZJR19TVU5SUEM9eQpDT05GSUdfU1VOUlBDX0dTUz1tCkNPTkZJR19TVU5SUENfQkFDS0NI
QU5ORUw9eQpDT05GSUdfUlBDU0VDX0dTU19LUkI1PW0KIyBDT05GSUdfQ09ORklHX1NVTlJQQ19E
SVNBQkxFX0lOU0VDVVJFX0VOQ1RZUEVTIGlzIG5vdCBzZXQKQ09ORklHX1NVTlJQQ19ERUJVRz15
CiMgQ09ORklHX0NFUEhfRlMgaXMgbm90IHNldApDT05GSUdfQ0lGUz1tCiMgQ09ORklHX0NJRlNf
U1RBVFMyIGlzIG5vdCBzZXQKQ09ORklHX0NJRlNfQUxMT1dfSU5TRUNVUkVfTEVHQUNZPXkKQ09O
RklHX0NJRlNfV0VBS19QV19IQVNIPXkKQ09ORklHX0NJRlNfVVBDQUxMPXkKQ09ORklHX0NJRlNf
WEFUVFI9eQpDT05GSUdfQ0lGU19QT1NJWD15CkNPTkZJR19DSUZTX0FDTD15CkNPTkZJR19DSUZT
X0RFQlVHPXkKIyBDT05GSUdfQ0lGU19ERUJVRzIgaXMgbm90IHNldAojIENPTkZJR19DSUZTX0RF
QlVHX0RVTVBfS0VZUyBpcyBub3Qgc2V0CkNPTkZJR19DSUZTX0RGU19VUENBTEw9eQojIENPTkZJ
R19DSUZTX0ZTQ0FDSEUgaXMgbm90IHNldAojIENPTkZJR19DT0RBX0ZTIGlzIG5vdCBzZXQKIyBD
T05GSUdfQUZTX0ZTIGlzIG5vdCBzZXQKQ09ORklHXzlQX0ZTPXkKQ09ORklHXzlQX0ZTX1BPU0lY
X0FDTD15CiMgQ09ORklHXzlQX0ZTX1NFQ1VSSVRZIGlzIG5vdCBzZXQKQ09ORklHX05MUz15CkNP
TkZJR19OTFNfREVGQVVMVD0idXRmOCIKQ09ORklHX05MU19DT0RFUEFHRV80Mzc9eQpDT05GSUdf
TkxTX0NPREVQQUdFXzczNz1tCkNPTkZJR19OTFNfQ09ERVBBR0VfNzc1PW0KQ09ORklHX05MU19D
T0RFUEFHRV84NTA9bQpDT05GSUdfTkxTX0NPREVQQUdFXzg1Mj1tCkNPTkZJR19OTFNfQ09ERVBB
R0VfODU1PW0KQ09ORklHX05MU19DT0RFUEFHRV84NTc9bQpDT05GSUdfTkxTX0NPREVQQUdFXzg2
MD1tCkNPTkZJR19OTFNfQ09ERVBBR0VfODYxPW0KQ09ORklHX05MU19DT0RFUEFHRV84NjI9bQpD
T05GSUdfTkxTX0NPREVQQUdFXzg2Mz1tCkNPTkZJR19OTFNfQ09ERVBBR0VfODY0PW0KQ09ORklH
X05MU19DT0RFUEFHRV84NjU9bQpDT05GSUdfTkxTX0NPREVQQUdFXzg2Nj1tCkNPTkZJR19OTFNf
Q09ERVBBR0VfODY5PW0KQ09ORklHX05MU19DT0RFUEFHRV85MzY9bQpDT05GSUdfTkxTX0NPREVQ
QUdFXzk1MD1tCkNPTkZJR19OTFNfQ09ERVBBR0VfOTMyPW0KQ09ORklHX05MU19DT0RFUEFHRV85
NDk9bQpDT05GSUdfTkxTX0NPREVQQUdFXzg3ND1tCkNPTkZJR19OTFNfSVNPODg1OV84PW0KQ09O
RklHX05MU19DT0RFUEFHRV8xMjUwPW0KQ09ORklHX05MU19DT0RFUEFHRV8xMjUxPW0KQ09ORklH
X05MU19BU0NJST15CkNPTkZJR19OTFNfSVNPODg1OV8xPW0KQ09ORklHX05MU19JU084ODU5XzI9
bQpDT05GSUdfTkxTX0lTTzg4NTlfMz1tCkNPTkZJR19OTFNfSVNPODg1OV80PW0KQ09ORklHX05M
U19JU084ODU5XzU9bQpDT05GSUdfTkxTX0lTTzg4NTlfNj1tCkNPTkZJR19OTFNfSVNPODg1OV83
PW0KQ09ORklHX05MU19JU084ODU5Xzk9bQpDT05GSUdfTkxTX0lTTzg4NTlfMTM9bQpDT05GSUdf
TkxTX0lTTzg4NTlfMTQ9bQpDT05GSUdfTkxTX0lTTzg4NTlfMTU9bQpDT05GSUdfTkxTX0tPSThf
Uj1tCkNPTkZJR19OTFNfS09JOF9VPW0KQ09ORklHX05MU19NQUNfUk9NQU49bQpDT05GSUdfTkxT
X01BQ19DRUxUSUM9bQpDT05GSUdfTkxTX01BQ19DRU5URVVSTz1tCkNPTkZJR19OTFNfTUFDX0NS
T0FUSUFOPW0KQ09ORklHX05MU19NQUNfQ1lSSUxMSUM9bQpDT05GSUdfTkxTX01BQ19HQUVMSUM9
bQpDT05GSUdfTkxTX01BQ19HUkVFSz1tCkNPTkZJR19OTFNfTUFDX0lDRUxBTkQ9bQpDT05GSUdf
TkxTX01BQ19JTlVJVD1tCkNPTkZJR19OTFNfTUFDX1JPTUFOSUFOPW0KQ09ORklHX05MU19NQUNf
VFVSS0lTSD1tCkNPTkZJR19OTFNfVVRGOD1tCkNPTkZJR19ETE09bQpDT05GSUdfRExNX0RFQlVH
PXkKIyBDT05GSUdfVU5JQ09ERSBpcyBub3Qgc2V0CiMgZW5kIG9mIEZpbGUgc3lzdGVtcwoKIwoj
IFNlY3VyaXR5IG9wdGlvbnMKIwpDT05GSUdfS0VZUz15CkNPTkZJR19LRVlTX0NPTVBBVD15CkNP
TkZJR19QRVJTSVNURU5UX0tFWVJJTkdTPXkKQ09ORklHX0JJR19LRVlTPXkKQ09ORklHX1RSVVNU
RURfS0VZUz15CkNPTkZJR19FTkNSWVBURURfS0VZUz15CiMgQ09ORklHX0tFWV9ESF9PUEVSQVRJ
T05TIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VDVVJJVFlfRE1FU0dfUkVTVFJJQ1QgaXMgbm90IHNl
dApDT05GSUdfU0VDVVJJVFk9eQpDT05GSUdfU0VDVVJJVFlfV1JJVEFCTEVfSE9PS1M9eQpDT05G
SUdfU0VDVVJJVFlGUz15CkNPTkZJR19TRUNVUklUWV9ORVRXT1JLPXkKQ09ORklHX1BBR0VfVEFC
TEVfSVNPTEFUSU9OPXkKQ09ORklHX1NFQ1VSSVRZX05FVFdPUktfWEZSTT15CkNPTkZJR19TRUNV
UklUWV9QQVRIPXkKQ09ORklHX0lOVEVMX1RYVD15CkNPTkZJR19MU01fTU1BUF9NSU5fQUREUj02
NTUzNQpDT05GSUdfSEFWRV9IQVJERU5FRF9VU0VSQ09QWV9BTExPQ0FUT1I9eQojIENPTkZJR19I
QVJERU5FRF9VU0VSQ09QWSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZPUlRJRllfU09VUkNFIGlzIG5v
dCBzZXQKIyBDT05GSUdfU1RBVElDX1VTRVJNT0RFSEVMUEVSIGlzIG5vdCBzZXQKQ09ORklHX1NF
Q1VSSVRZX1NFTElOVVg9eQpDT05GSUdfU0VDVVJJVFlfU0VMSU5VWF9CT09UUEFSQU09eQpDT05G
SUdfU0VDVVJJVFlfU0VMSU5VWF9ESVNBQkxFPXkKQ09ORklHX1NFQ1VSSVRZX1NFTElOVVhfREVW
RUxPUD15CkNPTkZJR19TRUNVUklUWV9TRUxJTlVYX0FWQ19TVEFUUz15CkNPTkZJR19TRUNVUklU
WV9TRUxJTlVYX0NIRUNLUkVRUFJPVF9WQUxVRT0xCiMgQ09ORklHX1NFQ1VSSVRZX1NNQUNLIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VDVVJJVFlfVE9NT1lPIGlzIG5vdCBzZXQKQ09ORklHX1NFQ1VS
SVRZX0FQUEFSTU9SPXkKQ09ORklHX1NFQ1VSSVRZX0FQUEFSTU9SX0hBU0g9eQpDT05GSUdfU0VD
VVJJVFlfQVBQQVJNT1JfSEFTSF9ERUZBVUxUPXkKIyBDT05GSUdfU0VDVVJJVFlfQVBQQVJNT1Jf
REVCVUcgaXMgbm90IHNldAojIENPTkZJR19TRUNVUklUWV9MT0FEUElOIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VDVVJJVFlfWUFNQSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFQ1VSSVRZX1NBRkVTRVRJ
RCBpcyBub3Qgc2V0CkNPTkZJR19JTlRFR1JJVFk9eQpDT05GSUdfSU5URUdSSVRZX1NJR05BVFVS
RT15CkNPTkZJR19JTlRFR1JJVFlfQVNZTU1FVFJJQ19LRVlTPXkKQ09ORklHX0lOVEVHUklUWV9U
UlVTVEVEX0tFWVJJTkc9eQpDT05GSUdfSU5URUdSSVRZX0FVRElUPXkKQ09ORklHX0lNQT15CkNP
TkZJR19JTUFfTUVBU1VSRV9QQ1JfSURYPTEwCkNPTkZJR19JTUFfTFNNX1JVTEVTPXkKIyBDT05G
SUdfSU1BX1RFTVBMQVRFIGlzIG5vdCBzZXQKQ09ORklHX0lNQV9OR19URU1QTEFURT15CiMgQ09O
RklHX0lNQV9TSUdfVEVNUExBVEUgaXMgbm90IHNldApDT05GSUdfSU1BX0RFRkFVTFRfVEVNUExB
VEU9ImltYS1uZyIKQ09ORklHX0lNQV9ERUZBVUxUX0hBU0hfU0hBMT15CiMgQ09ORklHX0lNQV9E
RUZBVUxUX0hBU0hfU0hBMjU2IGlzIG5vdCBzZXQKIyBDT05GSUdfSU1BX0RFRkFVTFRfSEFTSF9T
SEE1MTIgaXMgbm90IHNldApDT05GSUdfSU1BX0RFRkFVTFRfSEFTSD0ic2hhMSIKIyBDT05GSUdf
SU1BX1dSSVRFX1BPTElDWSBpcyBub3Qgc2V0CiMgQ09ORklHX0lNQV9SRUFEX1BPTElDWSBpcyBu
b3Qgc2V0CkNPTkZJR19JTUFfQVBQUkFJU0U9eQojIENPTkZJR19JTUFfQVJDSF9QT0xJQ1kgaXMg
bm90IHNldAojIENPTkZJR19JTUFfQVBQUkFJU0VfQlVJTERfUE9MSUNZIGlzIG5vdCBzZXQKQ09O
RklHX0lNQV9BUFBSQUlTRV9CT09UUEFSQU09eQpDT05GSUdfSU1BX1RSVVNURURfS0VZUklORz15
CiMgQ09ORklHX0lNQV9CTEFDS0xJU1RfS0VZUklORyBpcyBub3Qgc2V0CiMgQ09ORklHX0lNQV9M
T0FEX1g1MDkgaXMgbm90IHNldApDT05GSUdfRVZNPXkKQ09ORklHX0VWTV9BVFRSX0ZTVVVJRD15
CiMgQ09ORklHX0VWTV9BRERfWEFUVFJTIGlzIG5vdCBzZXQKIyBDT05GSUdfRVZNX0xPQURfWDUw
OSBpcyBub3Qgc2V0CkNPTkZJR19ERUZBVUxUX1NFQ1VSSVRZX1NFTElOVVg9eQojIENPTkZJR19E
RUZBVUxUX1NFQ1VSSVRZX0FQUEFSTU9SIGlzIG5vdCBzZXQKIyBDT05GSUdfREVGQVVMVF9TRUNV
UklUWV9EQUMgaXMgbm90IHNldApDT05GSUdfTFNNPSJ5YW1hLGxvYWRwaW4sc2FmZXNldGlkLGlu
dGVncml0eSxzZWxpbnV4LHNtYWNrLHRvbW95byxhcHBhcm1vciIKCiMKIyBLZXJuZWwgaGFyZGVu
aW5nIG9wdGlvbnMKIwoKIwojIE1lbW9yeSBpbml0aWFsaXphdGlvbgojCkNPTkZJR19JTklUX1NU
QUNLX05PTkU9eQojIENPTkZJR19HQ0NfUExVR0lOX1NUUlVDVExFQUtfVVNFUiBpcyBub3Qgc2V0
CiMgQ09ORklHX0dDQ19QTFVHSU5fU1RSVUNUTEVBS19CWVJFRiBpcyBub3Qgc2V0CiMgQ09ORklH
X0dDQ19QTFVHSU5fU1RSVUNUTEVBS19CWVJFRl9BTEwgaXMgbm90IHNldAojIENPTkZJR19HQ0Nf
UExVR0lOX1NUQUNLTEVBSyBpcyBub3Qgc2V0CiMgZW5kIG9mIE1lbW9yeSBpbml0aWFsaXphdGlv
bgojIGVuZCBvZiBLZXJuZWwgaGFyZGVuaW5nIG9wdGlvbnMKIyBlbmQgb2YgU2VjdXJpdHkgb3B0
aW9ucwoKQ09ORklHX1hPUl9CTE9DS1M9bQpDT05GSUdfQVNZTkNfQ09SRT1tCkNPTkZJR19BU1lO
Q19NRU1DUFk9bQpDT05GSUdfQVNZTkNfWE9SPW0KQ09ORklHX0FTWU5DX1BRPW0KQ09ORklHX0FT
WU5DX1JBSUQ2X1JFQ09WPW0KQ09ORklHX0NSWVBUTz15CgojCiMgQ3J5cHRvIGNvcmUgb3IgaGVs
cGVyCiMKQ09ORklHX0NSWVBUT19BTEdBUEk9eQpDT05GSUdfQ1JZUFRPX0FMR0FQSTI9eQpDT05G
SUdfQ1JZUFRPX0FFQUQ9eQpDT05GSUdfQ1JZUFRPX0FFQUQyPXkKQ09ORklHX0NSWVBUT19CTEtD
SVBIRVI9eQpDT05GSUdfQ1JZUFRPX0JMS0NJUEhFUjI9eQpDT05GSUdfQ1JZUFRPX0hBU0g9eQpD
T05GSUdfQ1JZUFRPX0hBU0gyPXkKQ09ORklHX0NSWVBUT19STkc9eQpDT05GSUdfQ1JZUFRPX1JO
RzI9eQpDT05GSUdfQ1JZUFRPX1JOR19ERUZBVUxUPXkKQ09ORklHX0NSWVBUT19BS0NJUEhFUjI9
eQpDT05GSUdfQ1JZUFRPX0FLQ0lQSEVSPXkKQ09ORklHX0NSWVBUT19LUFAyPXkKQ09ORklHX0NS
WVBUT19BQ09NUDI9eQpDT05GSUdfQ1JZUFRPX01BTkFHRVI9eQpDT05GSUdfQ1JZUFRPX01BTkFH
RVIyPXkKQ09ORklHX0NSWVBUT19VU0VSPW0KQ09ORklHX0NSWVBUT19NQU5BR0VSX0RJU0FCTEVf
VEVTVFM9eQpDT05GSUdfQ1JZUFRPX0dGMTI4TVVMPXkKQ09ORklHX0NSWVBUT19OVUxMPXkKQ09O
RklHX0NSWVBUT19OVUxMMj15CkNPTkZJR19DUllQVE9fUENSWVBUPW0KQ09ORklHX0NSWVBUT19X
T1JLUVVFVUU9eQpDT05GSUdfQ1JZUFRPX0NSWVBURD1tCkNPTkZJR19DUllQVE9fQVVUSEVOQz1t
CkNPTkZJR19DUllQVE9fVEVTVD1tCkNPTkZJR19DUllQVE9fU0lNRD1tCkNPTkZJR19DUllQVE9f
R0xVRV9IRUxQRVJfWDg2PW0KQ09ORklHX0NSWVBUT19FTkdJTkU9bQoKIwojIFB1YmxpYy1rZXkg
Y3J5cHRvZ3JhcGh5CiMKQ09ORklHX0NSWVBUT19SU0E9eQojIENPTkZJR19DUllQVE9fREggaXMg
bm90IHNldAojIENPTkZJR19DUllQVE9fRUNESCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19F
Q1JEU0EgaXMgbm90IHNldAoKIwojIEF1dGhlbnRpY2F0ZWQgRW5jcnlwdGlvbiB3aXRoIEFzc29j
aWF0ZWQgRGF0YQojCkNPTkZJR19DUllQVE9fQ0NNPW0KQ09ORklHX0NSWVBUT19HQ009eQojIENP
TkZJR19DUllQVE9fQ0hBQ0hBMjBQT0xZMTMwNSBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19B
RUdJUzEyOCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19BRUdJUzEyOEwgaXMgbm90IHNldAoj
IENPTkZJR19DUllQVE9fQUVHSVMyNTYgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fQUVHSVMx
MjhfQUVTTklfU1NFMiBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19BRUdJUzEyOExfQUVTTklf
U1NFMiBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19BRUdJUzI1Nl9BRVNOSV9TU0UyIGlzIG5v
dCBzZXQKIyBDT05GSUdfQ1JZUFRPX01PUlVTNjQwIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRP
X01PUlVTNjQwX1NTRTIgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fTU9SVVMxMjgwIGlzIG5v
dCBzZXQKIyBDT05GSUdfQ1JZUFRPX01PUlVTMTI4MF9TU0UyIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q1JZUFRPX01PUlVTMTI4MF9BVlgyIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19TRVFJVj15CkNP
TkZJR19DUllQVE9fRUNIQUlOSVY9bQoKIwojIEJsb2NrIG1vZGVzCiMKQ09ORklHX0NSWVBUT19D
QkM9eQojIENPTkZJR19DUllQVE9fQ0ZCIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19DVFI9eQpD
T05GSUdfQ1JZUFRPX0NUUz15CkNPTkZJR19DUllQVE9fRUNCPXkKQ09ORklHX0NSWVBUT19MUlc9
bQojIENPTkZJR19DUllQVE9fT0ZCIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19QQ0JDPW0KQ09O
RklHX0NSWVBUT19YVFM9eQojIENPTkZJR19DUllQVE9fS0VZV1JBUCBpcyBub3Qgc2V0CiMgQ09O
RklHX0NSWVBUT19OSFBPTFkxMzA1X1NTRTIgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fTkhQ
T0xZMTMwNV9BVlgyIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0FESUFOVFVNIGlzIG5vdCBz
ZXQKCiMKIyBIYXNoIG1vZGVzCiMKQ09ORklHX0NSWVBUT19DTUFDPW0KQ09ORklHX0NSWVBUT19I
TUFDPXkKQ09ORklHX0NSWVBUT19YQ0JDPW0KQ09ORklHX0NSWVBUT19WTUFDPW0KCiMKIyBEaWdl
c3QKIwpDT05GSUdfQ1JZUFRPX0NSQzMyQz15CkNPTkZJR19DUllQVE9fQ1JDMzJDX0lOVEVMPW0K
Q09ORklHX0NSWVBUT19DUkMzMj1tCkNPTkZJR19DUllQVE9fQ1JDMzJfUENMTVVMPW0KQ09ORklH
X0NSWVBUT19DUkNUMTBESUY9eQpDT05GSUdfQ1JZUFRPX0NSQ1QxMERJRl9QQ0xNVUw9bQpDT05G
SUdfQ1JZUFRPX0dIQVNIPXkKIyBDT05GSUdfQ1JZUFRPX1BPTFkxMzA1IGlzIG5vdCBzZXQKIyBD
T05GSUdfQ1JZUFRPX1BPTFkxMzA1X1g4Nl82NCBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fTUQ0
PW0KQ09ORklHX0NSWVBUT19NRDU9eQpDT05GSUdfQ1JZUFRPX01JQ0hBRUxfTUlDPW0KQ09ORklH
X0NSWVBUT19STUQxMjg9bQpDT05GSUdfQ1JZUFRPX1JNRDE2MD1tCkNPTkZJR19DUllQVE9fUk1E
MjU2PW0KQ09ORklHX0NSWVBUT19STUQzMjA9bQpDT05GSUdfQ1JZUFRPX1NIQTE9eQpDT05GSUdf
Q1JZUFRPX1NIQTFfU1NTRTM9bQpDT05GSUdfQ1JZUFRPX1NIQTI1Nl9TU1NFMz1tCkNPTkZJR19D
UllQVE9fU0hBNTEyX1NTU0UzPW0KQ09ORklHX0NSWVBUT19TSEEyNTY9eQpDT05GSUdfQ1JZUFRP
X1NIQTUxMj15CkNPTkZJR19DUllQVE9fU0hBMz1tCiMgQ09ORklHX0NSWVBUT19TTTMgaXMgbm90
IHNldAojIENPTkZJR19DUllQVE9fU1RSRUVCT0cgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX1RH
UjE5Mj1tCkNPTkZJR19DUllQVE9fV1A1MTI9bQpDT05GSUdfQ1JZUFRPX0dIQVNIX0NMTVVMX05J
X0lOVEVMPW0KCiMKIyBDaXBoZXJzCiMKQ09ORklHX0NSWVBUT19BRVM9eQojIENPTkZJR19DUllQ
VE9fQUVTX1RJIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19BRVNfWDg2XzY0PXkKQ09ORklHX0NS
WVBUT19BRVNfTklfSU5URUw9bQpDT05GSUdfQ1JZUFRPX0FOVUJJUz1tCkNPTkZJR19DUllQVE9f
QVJDND1tCkNPTkZJR19DUllQVE9fQkxPV0ZJU0g9bQpDT05GSUdfQ1JZUFRPX0JMT1dGSVNIX0NP
TU1PTj1tCkNPTkZJR19DUllQVE9fQkxPV0ZJU0hfWDg2XzY0PW0KQ09ORklHX0NSWVBUT19DQU1F
TExJQT1tCkNPTkZJR19DUllQVE9fQ0FNRUxMSUFfWDg2XzY0PW0KQ09ORklHX0NSWVBUT19DQU1F
TExJQV9BRVNOSV9BVlhfWDg2XzY0PW0KQ09ORklHX0NSWVBUT19DQU1FTExJQV9BRVNOSV9BVlgy
X1g4Nl82ND1tCkNPTkZJR19DUllQVE9fQ0FTVF9DT01NT049bQpDT05GSUdfQ1JZUFRPX0NBU1Q1
PW0KQ09ORklHX0NSWVBUT19DQVNUNV9BVlhfWDg2XzY0PW0KQ09ORklHX0NSWVBUT19DQVNUNj1t
CkNPTkZJR19DUllQVE9fQ0FTVDZfQVZYX1g4Nl82ND1tCkNPTkZJR19DUllQVE9fREVTPW0KIyBD
T05GSUdfQ1JZUFRPX0RFUzNfRURFX1g4Nl82NCBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fRkNS
WVBUPW0KQ09ORklHX0NSWVBUT19LSEFaQUQ9bQpDT05GSUdfQ1JZUFRPX1NBTFNBMjA9bQojIENP
TkZJR19DUllQVE9fQ0hBQ0hBMjAgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fQ0hBQ0hBMjBf
WDg2XzY0IGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19TRUVEPW0KQ09ORklHX0NSWVBUT19TRVJQ
RU5UPW0KQ09ORklHX0NSWVBUT19TRVJQRU5UX1NTRTJfWDg2XzY0PW0KQ09ORklHX0NSWVBUT19T
RVJQRU5UX0FWWF9YODZfNjQ9bQpDT05GSUdfQ1JZUFRPX1NFUlBFTlRfQVZYMl9YODZfNjQ9bQoj
IENPTkZJR19DUllQVE9fU000IGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19URUE9bQpDT05GSUdf
Q1JZUFRPX1RXT0ZJU0g9bQpDT05GSUdfQ1JZUFRPX1RXT0ZJU0hfQ09NTU9OPW0KQ09ORklHX0NS
WVBUT19UV09GSVNIX1g4Nl82ND1tCkNPTkZJR19DUllQVE9fVFdPRklTSF9YODZfNjRfM1dBWT1t
CkNPTkZJR19DUllQVE9fVFdPRklTSF9BVlhfWDg2XzY0PW0KCiMKIyBDb21wcmVzc2lvbgojCkNP
TkZJR19DUllQVE9fREVGTEFURT15CkNPTkZJR19DUllQVE9fTFpPPXkKIyBDT05GSUdfQ1JZUFRP
Xzg0MiBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19MWjQgaXMgbm90IHNldAojIENPTkZJR19D
UllQVE9fTFo0SEMgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fWlNURCBpcyBub3Qgc2V0Cgoj
CiMgUmFuZG9tIE51bWJlciBHZW5lcmF0aW9uCiMKQ09ORklHX0NSWVBUT19BTlNJX0NQUk5HPW0K
Q09ORklHX0NSWVBUT19EUkJHX01FTlU9eQpDT05GSUdfQ1JZUFRPX0RSQkdfSE1BQz15CiMgQ09O
RklHX0NSWVBUT19EUkJHX0hBU0ggaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fRFJCR19DVFIg
aXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0RSQkc9eQpDT05GSUdfQ1JZUFRPX0pJVFRFUkVOVFJP
UFk9eQpDT05GSUdfQ1JZUFRPX1VTRVJfQVBJPXkKQ09ORklHX0NSWVBUT19VU0VSX0FQSV9IQVNI
PXkKQ09ORklHX0NSWVBUT19VU0VSX0FQSV9TS0NJUEhFUj15CiMgQ09ORklHX0NSWVBUT19VU0VS
X0FQSV9STkcgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fVVNFUl9BUElfQUVBRCBpcyBub3Qg
c2V0CiMgQ09ORklHX0NSWVBUT19TVEFUUyBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fSEFTSF9J
TkZPPXkKQ09ORklHX0NSWVBUT19IVz15CkNPTkZJR19DUllQVE9fREVWX1BBRExPQ0s9bQpDT05G
SUdfQ1JZUFRPX0RFVl9QQURMT0NLX0FFUz1tCkNPTkZJR19DUllQVE9fREVWX1BBRExPQ0tfU0hB
PW0KIyBDT05GSUdfQ1JZUFRPX0RFVl9DQ1AgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fREVW
X1FBVF9ESDg5NXhDQyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfUUFUX0MzWFhYIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9RQVRfQzYyWCBpcyBub3Qgc2V0CiMgQ09ORklH
X0NSWVBUT19ERVZfUUFUX0RIODk1eENDVkYgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fREVW
X1FBVF9DM1hYWFZGIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9RQVRfQzYyWFZGIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9OSVRST1hfQ05ONTVYWCBpcyBub3Qgc2V0CiMg
Q09ORklHX0NSWVBUT19ERVZfQ0hFTFNJTyBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fREVWX1ZJ
UlRJTz1tCkNPTkZJR19BU1lNTUVUUklDX0tFWV9UWVBFPXkKQ09ORklHX0FTWU1NRVRSSUNfUFVC
TElDX0tFWV9TVUJUWVBFPXkKIyBDT05GSUdfQVNZTU1FVFJJQ19UUE1fS0VZX1NVQlRZUEUgaXMg
bm90IHNldApDT05GSUdfWDUwOV9DRVJUSUZJQ0FURV9QQVJTRVI9eQojIENPTkZJR19QS0NTOF9Q
UklWQVRFX0tFWV9QQVJTRVIgaXMgbm90IHNldApDT05GSUdfUEtDUzdfTUVTU0FHRV9QQVJTRVI9
eQojIENPTkZJR19QS0NTN19URVNUX0tFWSBpcyBub3Qgc2V0CiMgQ09ORklHX1NJR05FRF9QRV9G
SUxFX1ZFUklGSUNBVElPTiBpcyBub3Qgc2V0CgojCiMgQ2VydGlmaWNhdGVzIGZvciBzaWduYXR1
cmUgY2hlY2tpbmcKIwpDT05GSUdfU1lTVEVNX1RSVVNURURfS0VZUklORz15CkNPTkZJR19TWVNU
RU1fVFJVU1RFRF9LRVlTPSIiCiMgQ09ORklHX1NZU1RFTV9FWFRSQV9DRVJUSUZJQ0FURSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFQ09OREFSWV9UUlVTVEVEX0tFWVJJTkcgaXMgbm90IHNldAojIENP
TkZJR19TWVNURU1fQkxBQ0tMSVNUX0tFWVJJTkcgaXMgbm90IHNldAojIGVuZCBvZiBDZXJ0aWZp
Y2F0ZXMgZm9yIHNpZ25hdHVyZSBjaGVja2luZwoKQ09ORklHX0JJTkFSWV9QUklOVEY9eQoKIwoj
IExpYnJhcnkgcm91dGluZXMKIwpDT05GSUdfUkFJRDZfUFE9bQpDT05GSUdfUkFJRDZfUFFfQkVO
Q0hNQVJLPXkKIyBDT05GSUdfUEFDS0lORyBpcyBub3Qgc2V0CkNPTkZJR19CSVRSRVZFUlNFPXkK
Q09ORklHX0dFTkVSSUNfU1RSTkNQWV9GUk9NX1VTRVI9eQpDT05GSUdfR0VORVJJQ19TVFJOTEVO
X1VTRVI9eQpDT05GSUdfR0VORVJJQ19ORVRfVVRJTFM9eQpDT05GSUdfR0VORVJJQ19GSU5EX0ZJ
UlNUX0JJVD15CkNPTkZJR19DT1JESUM9bQpDT05GSUdfUFJJTUVfTlVNQkVSUz1tCkNPTkZJR19S
QVRJT05BTD15CkNPTkZJR19HRU5FUklDX1BDSV9JT01BUD15CkNPTkZJR19HRU5FUklDX0lPTUFQ
PXkKQ09ORklHX0FSQ0hfVVNFX0NNUFhDSEdfTE9DS1JFRj15CkNPTkZJR19BUkNIX0hBU19GQVNU
X01VTFRJUExJRVI9eQpDT05GSUdfQ1JDX0NDSVRUPXkKQ09ORklHX0NSQzE2PXkKQ09ORklHX0NS
Q19UMTBESUY9eQpDT05GSUdfQ1JDX0lUVV9UPW0KQ09ORklHX0NSQzMyPXkKIyBDT05GSUdfQ1JD
MzJfU0VMRlRFU1QgaXMgbm90IHNldApDT05GSUdfQ1JDMzJfU0xJQ0VCWTg9eQojIENPTkZJR19D
UkMzMl9TTElDRUJZNCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSQzMyX1NBUldBVEUgaXMgbm90IHNl
dAojIENPTkZJR19DUkMzMl9CSVQgaXMgbm90IHNldAojIENPTkZJR19DUkM2NCBpcyBub3Qgc2V0
CiMgQ09ORklHX0NSQzQgaXMgbm90IHNldAojIENPTkZJR19DUkM3IGlzIG5vdCBzZXQKQ09ORklH
X0xJQkNSQzMyQz15CkNPTkZJR19DUkM4PW0KQ09ORklHX1hYSEFTSD15CiMgQ09ORklHX1JBTkRP
TTMyX1NFTEZURVNUIGlzIG5vdCBzZXQKQ09ORklHX1pMSUJfSU5GTEFURT15CkNPTkZJR19aTElC
X0RFRkxBVEU9eQpDT05GSUdfTFpPX0NPTVBSRVNTPXkKQ09ORklHX0xaT19ERUNPTVBSRVNTPXkK
Q09ORklHX0xaNF9ERUNPTVBSRVNTPXkKQ09ORklHX1pTVERfQ09NUFJFU1M9bQpDT05GSUdfWlNU
RF9ERUNPTVBSRVNTPW0KQ09ORklHX1haX0RFQz15CkNPTkZJR19YWl9ERUNfWDg2PXkKQ09ORklH
X1haX0RFQ19QT1dFUlBDPXkKQ09ORklHX1haX0RFQ19JQTY0PXkKQ09ORklHX1haX0RFQ19BUk09
eQpDT05GSUdfWFpfREVDX0FSTVRIVU1CPXkKQ09ORklHX1haX0RFQ19TUEFSQz15CkNPTkZJR19Y
Wl9ERUNfQkNKPXkKIyBDT05GSUdfWFpfREVDX1RFU1QgaXMgbm90IHNldApDT05GSUdfREVDT01Q
UkVTU19HWklQPXkKQ09ORklHX0RFQ09NUFJFU1NfQlpJUDI9eQpDT05GSUdfREVDT01QUkVTU19M
Wk1BPXkKQ09ORklHX0RFQ09NUFJFU1NfWFo9eQpDT05GSUdfREVDT01QUkVTU19MWk89eQpDT05G
SUdfREVDT01QUkVTU19MWjQ9eQpDT05GSUdfR0VORVJJQ19BTExPQ0FUT1I9eQpDT05GSUdfUkVF
RF9TT0xPTU9OPW0KQ09ORklHX1JFRURfU09MT01PTl9FTkM4PXkKQ09ORklHX1JFRURfU09MT01P
Tl9ERUM4PXkKQ09ORklHX1RFWFRTRUFSQ0g9eQpDT05GSUdfVEVYVFNFQVJDSF9LTVA9bQpDT05G
SUdfVEVYVFNFQVJDSF9CTT1tCkNPTkZJR19URVhUU0VBUkNIX0ZTTT1tCkNPTkZJR19CVFJFRT15
CkNPTkZJR19JTlRFUlZBTF9UUkVFPXkKQ09ORklHX1hBUlJBWV9NVUxUST15CkNPTkZJR19BU1NP
Q0lBVElWRV9BUlJBWT15CkNPTkZJR19IQVNfSU9NRU09eQpDT05GSUdfSEFTX0lPUE9SVF9NQVA9
eQpDT05GSUdfSEFTX0RNQT15CkNPTkZJR19ORUVEX1NHX0RNQV9MRU5HVEg9eQpDT05GSUdfTkVF
RF9ETUFfTUFQX1NUQVRFPXkKQ09ORklHX0FSQ0hfRE1BX0FERFJfVF82NEJJVD15CkNPTkZJR19E
TUFfREVDTEFSRV9DT0hFUkVOVD15CkNPTkZJR19TV0lPVExCPXkKQ09ORklHX0RNQV9DTUE9eQoK
IwojIERlZmF1bHQgY29udGlndW91cyBtZW1vcnkgYXJlYSBzaXplOgojCkNPTkZJR19DTUFfU0la
RV9NQllURVM9MjAwCkNPTkZJR19DTUFfU0laRV9TRUxfTUJZVEVTPXkKIyBDT05GSUdfQ01BX1NJ
WkVfU0VMX1BFUkNFTlRBR0UgaXMgbm90IHNldAojIENPTkZJR19DTUFfU0laRV9TRUxfTUlOIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ01BX1NJWkVfU0VMX01BWCBpcyBub3Qgc2V0CkNPTkZJR19DTUFf
QUxJR05NRU5UPTgKIyBDT05GSUdfRE1BX0FQSV9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19TR0xf
QUxMT0M9eQpDT05GSUdfSU9NTVVfSEVMUEVSPXkKQ09ORklHX0NIRUNLX1NJR05BVFVSRT15CkNP
TkZJR19DUFVNQVNLX09GRlNUQUNLPXkKQ09ORklHX0NQVV9STUFQPXkKQ09ORklHX0RRTD15CkNP
TkZJR19HTE9CPXkKIyBDT05GSUdfR0xPQl9TRUxGVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19OTEFU
VFI9eQpDT05GSUdfQ0xaX1RBQj15CiMgQ09ORklHX0REUiBpcyBub3Qgc2V0CkNPTkZJR19JUlFf
UE9MTD15CkNPTkZJR19NUElMSUI9eQpDT05GSUdfU0lHTkFUVVJFPXkKQ09ORklHX09JRF9SRUdJ
U1RSWT15CkNPTkZJR19VQ1MyX1NUUklORz15CkNPTkZJR19GT05UX1NVUFBPUlQ9eQojIENPTkZJ
R19GT05UUyBpcyBub3Qgc2V0CkNPTkZJR19GT05UXzh4OD15CkNPTkZJR19GT05UXzh4MTY9eQpD
T05GSUdfU0dfUE9PTD15CkNPTkZJR19BUkNIX0hBU19QTUVNX0FQST15CkNPTkZJR19BUkNIX0hB
U19VQUNDRVNTX0ZMVVNIQ0FDSEU9eQpDT05GSUdfQVJDSF9IQVNfVUFDQ0VTU19NQ1NBRkU9eQpD
T05GSUdfQVJDSF9TVEFDS1dBTEs9eQpDT05GSUdfU0JJVE1BUD15CiMgQ09ORklHX1NUUklOR19T
RUxGVEVTVCBpcyBub3Qgc2V0CiMgZW5kIG9mIExpYnJhcnkgcm91dGluZXMKCiMKIyBLZXJuZWwg
aGFja2luZwojCgojCiMgcHJpbnRrIGFuZCBkbWVzZyBvcHRpb25zCiMKQ09ORklHX1BSSU5US19U
SU1FPXkKIyBDT05GSUdfUFJJTlRLX0NBTExFUiBpcyBub3Qgc2V0CkNPTkZJR19DT05TT0xFX0xP
R0xFVkVMX0RFRkFVTFQ9NwpDT05GSUdfQ09OU09MRV9MT0dMRVZFTF9RVUlFVD00CkNPTkZJR19N
RVNTQUdFX0xPR0xFVkVMX0RFRkFVTFQ9NApDT05GSUdfQk9PVF9QUklOVEtfREVMQVk9eQpDT05G
SUdfRFlOQU1JQ19ERUJVRz15CiMgZW5kIG9mIHByaW50ayBhbmQgZG1lc2cgb3B0aW9ucwoKIwoj
IENvbXBpbGUtdGltZSBjaGVja3MgYW5kIGNvbXBpbGVyIG9wdGlvbnMKIwpDT05GSUdfREVCVUdf
SU5GTz15CkNPTkZJR19ERUJVR19JTkZPX1JFRFVDRUQ9eQojIENPTkZJR19ERUJVR19JTkZPX1NQ
TElUIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfSU5GT19EV0FSRjQgaXMgbm90IHNldAojIENP
TkZJR19ERUJVR19JTkZPX0JURiBpcyBub3Qgc2V0CiMgQ09ORklHX0dEQl9TQ1JJUFRTIGlzIG5v
dCBzZXQKQ09ORklHX0VOQUJMRV9NVVNUX0NIRUNLPXkKQ09ORklHX0ZSQU1FX1dBUk49MjA0OApD
T05GSUdfU1RSSVBfQVNNX1NZTVM9eQojIENPTkZJR19SRUFEQUJMRV9BU00gaXMgbm90IHNldAoj
IENPTkZJR19VTlVTRURfU1lNQk9MUyBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19GUz15CkNPTkZJ
R19IRUFERVJTX0NIRUNLPXkKQ09ORklHX09QVElNSVpFX0lOTElOSU5HPXkKQ09ORklHX0RFQlVH
X1NFQ1RJT05fTUlTTUFUQ0g9eQpDT05GSUdfU0VDVElPTl9NSVNNQVRDSF9XQVJOX09OTFk9eQpD
T05GSUdfU1RBQ0tfVkFMSURBVElPTj15CiMgQ09ORklHX0RFQlVHX0ZPUkNFX1dFQUtfUEVSX0NQ
VSBpcyBub3Qgc2V0CiMgZW5kIG9mIENvbXBpbGUtdGltZSBjaGVja3MgYW5kIGNvbXBpbGVyIG9w
dGlvbnMKCkNPTkZJR19NQUdJQ19TWVNSUT15CkNPTkZJR19NQUdJQ19TWVNSUV9ERUZBVUxUX0VO
QUJMRT0weDEKQ09ORklHX01BR0lDX1NZU1JRX1NFUklBTD15CkNPTkZJR19ERUJVR19LRVJORUw9
eQpDT05GSUdfREVCVUdfTUlTQz15CgojCiMgTWVtb3J5IERlYnVnZ2luZwojCiMgQ09ORklHX1BB
R0VfRVhURU5TSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfUEFHRUFMTE9DIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUEFHRV9PV05FUiBpcyBub3Qgc2V0CiMgQ09ORklHX1BBR0VfUE9JU09OSU5H
IGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfUEFHRV9SRUYgaXMgbm90IHNldApDT05GSUdfREVC
VUdfUk9EQVRBX1RFU1Q9eQojIENPTkZJR19ERUJVR19PQkpFQ1RTIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0xVQl9ERUJVR19PTiBpcyBub3Qgc2V0CiMgQ09ORklHX1NMVUJfU1RBVFMgaXMgbm90IHNl
dApDT05GSUdfSEFWRV9ERUJVR19LTUVNTEVBSz15CiMgQ09ORklHX0RFQlVHX0tNRU1MRUFLIGlz
IG5vdCBzZXQKIyBDT05GSUdfREVCVUdfU1RBQ0tfVVNBR0UgaXMgbm90IHNldAojIENPTkZJR19E
RUJVR19WTSBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0hBU19ERUJVR19WSVJUVUFMPXkKIyBDT05G
SUdfREVCVUdfVklSVFVBTCBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19NRU1PUllfSU5JVD15CkNP
TkZJR19NRU1PUllfTk9USUZJRVJfRVJST1JfSU5KRUNUPW0KIyBDT05GSUdfREVCVUdfUEVSX0NQ
VV9NQVBTIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfQVJDSF9LQVNBTj15CkNPTkZJR19DQ19IQVNf
S0FTQU5fR0VORVJJQz15CiMgQ09ORklHX0tBU0FOIGlzIG5vdCBzZXQKQ09ORklHX0tBU0FOX1NU
QUNLPTEKIyBlbmQgb2YgTWVtb3J5IERlYnVnZ2luZwoKQ09ORklHX0FSQ0hfSEFTX0tDT1Y9eQpD
T05GSUdfQ0NfSEFTX1NBTkNPVl9UUkFDRV9QQz15CiMgQ09ORklHX0tDT1YgaXMgbm90IHNldApD
T05GSUdfREVCVUdfU0hJUlE9eQoKIwojIERlYnVnIExvY2t1cHMgYW5kIEhhbmdzCiMKQ09ORklH
X0xPQ0tVUF9ERVRFQ1RPUj15CkNPTkZJR19TT0ZUTE9DS1VQX0RFVEVDVE9SPXkKIyBDT05GSUdf
Qk9PVFBBUkFNX1NPRlRMT0NLVVBfUEFOSUMgaXMgbm90IHNldApDT05GSUdfQk9PVFBBUkFNX1NP
RlRMT0NLVVBfUEFOSUNfVkFMVUU9MApDT05GSUdfSEFSRExPQ0tVUF9ERVRFQ1RPUl9QRVJGPXkK
Q09ORklHX0hBUkRMT0NLVVBfQ0hFQ0tfVElNRVNUQU1QPXkKQ09ORklHX0hBUkRMT0NLVVBfREVU
RUNUT1I9eQpDT05GSUdfQk9PVFBBUkFNX0hBUkRMT0NLVVBfUEFOSUM9eQpDT05GSUdfQk9PVFBB
UkFNX0hBUkRMT0NLVVBfUEFOSUNfVkFMVUU9MQojIENPTkZJR19ERVRFQ1RfSFVOR19UQVNLIGlz
IG5vdCBzZXQKIyBDT05GSUdfV1FfV0FUQ0hET0cgaXMgbm90IHNldAojIGVuZCBvZiBEZWJ1ZyBM
b2NrdXBzIGFuZCBIYW5ncwoKQ09ORklHX1BBTklDX09OX09PUFM9eQpDT05GSUdfUEFOSUNfT05f
T09QU19WQUxVRT0xCkNPTkZJR19QQU5JQ19USU1FT1VUPTAKQ09ORklHX1NDSEVEX0RFQlVHPXkK
Q09ORklHX1NDSEVEX0lORk89eQpDT05GSUdfU0NIRURTVEFUUz15CiMgQ09ORklHX1NDSEVEX1NU
QUNLX0VORF9DSEVDSyBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1RJTUVLRUVQSU5HIGlzIG5v
dCBzZXQKCiMKIyBMb2NrIERlYnVnZ2luZyAoc3BpbmxvY2tzLCBtdXRleGVzLCBldGMuLi4pCiMK
Q09ORklHX0xPQ0tfREVCVUdHSU5HX1NVUFBPUlQ9eQojIENPTkZJR19QUk9WRV9MT0NLSU5HIGlz
IG5vdCBzZXQKIyBDT05GSUdfTE9DS19TVEFUIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfUlRf
TVVURVhFUyBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1NQSU5MT0NLIGlzIG5vdCBzZXQKIyBD
T05GSUdfREVCVUdfTVVURVhFUyBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1dXX01VVEVYX1NM
T1dQQVRIIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfUldTRU1TIGlzIG5vdCBzZXQKIyBDT05G
SUdfREVCVUdfTE9DS19BTExPQyBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19BVE9NSUNfU0xFRVA9
eQojIENPTkZJR19ERUJVR19MT0NLSU5HX0FQSV9TRUxGVEVTVFMgaXMgbm90IHNldApDT05GSUdf
TE9DS19UT1JUVVJFX1RFU1Q9bQpDT05GSUdfV1dfTVVURVhfU0VMRlRFU1Q9bQojIGVuZCBvZiBM
b2NrIERlYnVnZ2luZyAoc3BpbmxvY2tzLCBtdXRleGVzLCBldGMuLi4pCgpDT05GSUdfU1RBQ0tU
UkFDRT15CiMgQ09ORklHX1dBUk5fQUxMX1VOU0VFREVEX1JBTkRPTSBpcyBub3Qgc2V0CiMgQ09O
RklHX0RFQlVHX0tPQkpFQ1QgaXMgbm90IHNldApDT05GSUdfREVCVUdfQlVHVkVSQk9TRT15CkNP
TkZJR19ERUJVR19MSVNUPXkKIyBDT05GSUdfREVCVUdfUExJU1QgaXMgbm90IHNldAojIENPTkZJ
R19ERUJVR19TRyBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX05PVElGSUVSUyBpcyBub3Qgc2V0
CiMgQ09ORklHX0RFQlVHX0NSRURFTlRJQUxTIGlzIG5vdCBzZXQKCiMKIyBSQ1UgRGVidWdnaW5n
CiMKQ09ORklHX1RPUlRVUkVfVEVTVD1tCkNPTkZJR19SQ1VfUEVSRl9URVNUPW0KQ09ORklHX1JD
VV9UT1JUVVJFX1RFU1Q9bQpDT05GSUdfUkNVX0NQVV9TVEFMTF9USU1FT1VUPTYwCiMgQ09ORklH
X1JDVV9UUkFDRSBpcyBub3Qgc2V0CiMgQ09ORklHX1JDVV9FUVNfREVCVUcgaXMgbm90IHNldAoj
IGVuZCBvZiBSQ1UgRGVidWdnaW5nCgojIENPTkZJR19ERUJVR19XUV9GT1JDRV9SUl9DUFUgaXMg
bm90IHNldAojIENPTkZJR19ERUJVR19CTE9DS19FWFRfREVWVCBpcyBub3Qgc2V0CiMgQ09ORklH
X0NQVV9IT1RQTFVHX1NUQVRFX0NPTlRST0wgaXMgbm90IHNldApDT05GSUdfTk9USUZJRVJfRVJS
T1JfSU5KRUNUSU9OPW0KQ09ORklHX1BNX05PVElGSUVSX0VSUk9SX0lOSkVDVD1tCiMgQ09ORklH
X05FVERFVl9OT1RJRklFUl9FUlJPUl9JTkpFQ1QgaXMgbm90IHNldApDT05GSUdfRlVOQ1RJT05f
RVJST1JfSU5KRUNUSU9OPXkKQ09ORklHX0ZBVUxUX0lOSkVDVElPTj15CiMgQ09ORklHX0ZBSUxT
TEFCIGlzIG5vdCBzZXQKIyBDT05GSUdfRkFJTF9QQUdFX0FMTE9DIGlzIG5vdCBzZXQKQ09ORklH
X0ZBSUxfTUFLRV9SRVFVRVNUPXkKIyBDT05GSUdfRkFJTF9JT19USU1FT1VUIGlzIG5vdCBzZXQK
IyBDT05GSUdfRkFJTF9GVVRFWCBpcyBub3Qgc2V0CkNPTkZJR19GQVVMVF9JTkpFQ1RJT05fREVC
VUdfRlM9eQojIENPTkZJR19GQUlMX0ZVTkNUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfRkFJTF9N
TUNfUkVRVUVTVCBpcyBub3Qgc2V0CkNPTkZJR19MQVRFTkNZVE9QPXkKQ09ORklHX1VTRVJfU1RB
Q0tUUkFDRV9TVVBQT1JUPXkKQ09ORklHX05PUF9UUkFDRVI9eQpDT05GSUdfSEFWRV9GVU5DVElP
Tl9UUkFDRVI9eQpDT05GSUdfSEFWRV9GVU5DVElPTl9HUkFQSF9UUkFDRVI9eQpDT05GSUdfSEFW
RV9EWU5BTUlDX0ZUUkFDRT15CkNPTkZJR19IQVZFX0RZTkFNSUNfRlRSQUNFX1dJVEhfUkVHUz15
CkNPTkZJR19IQVZFX0ZUUkFDRV9NQ09VTlRfUkVDT1JEPXkKQ09ORklHX0hBVkVfU1lTQ0FMTF9U
UkFDRVBPSU5UUz15CkNPTkZJR19IQVZFX0ZFTlRSWT15CkNPTkZJR19IQVZFX0NfUkVDT1JETUNP
VU5UPXkKQ09ORklHX1RSQUNFUl9NQVhfVFJBQ0U9eQpDT05GSUdfVFJBQ0VfQ0xPQ0s9eQpDT05G
SUdfUklOR19CVUZGRVI9eQpDT05GSUdfRVZFTlRfVFJBQ0lORz15CkNPTkZJR19DT05URVhUX1NX
SVRDSF9UUkFDRVI9eQpDT05GSUdfUklOR19CVUZGRVJfQUxMT1dfU1dBUD15CkNPTkZJR19UUkFD
SU5HPXkKQ09ORklHX0dFTkVSSUNfVFJBQ0VSPXkKQ09ORklHX1RSQUNJTkdfU1VQUE9SVD15CkNP
TkZJR19GVFJBQ0U9eQpDT05GSUdfRlVOQ1RJT05fVFJBQ0VSPXkKQ09ORklHX0ZVTkNUSU9OX0dS
QVBIX1RSQUNFUj15CiMgQ09ORklHX1BSRUVNUFRJUlFfRVZFTlRTIGlzIG5vdCBzZXQKIyBDT05G
SUdfSVJRU09GRl9UUkFDRVIgaXMgbm90IHNldApDT05GSUdfU0NIRURfVFJBQ0VSPXkKIyBDT05G
SUdfSFdMQVRfVFJBQ0VSIGlzIG5vdCBzZXQKQ09ORklHX0ZUUkFDRV9TWVNDQUxMUz15CkNPTkZJ
R19UUkFDRVJfU05BUFNIT1Q9eQojIENPTkZJR19UUkFDRVJfU05BUFNIT1RfUEVSX0NQVV9TV0FQ
IGlzIG5vdCBzZXQKQ09ORklHX0JSQU5DSF9QUk9GSUxFX05PTkU9eQojIENPTkZJR19QUk9GSUxF
X0FOTk9UQVRFRF9CUkFOQ0hFUyBpcyBub3Qgc2V0CiMgQ09ORklHX1BST0ZJTEVfQUxMX0JSQU5D
SEVTIGlzIG5vdCBzZXQKQ09ORklHX1NUQUNLX1RSQUNFUj15CkNPTkZJR19CTEtfREVWX0lPX1RS
QUNFPXkKQ09ORklHX0tQUk9CRV9FVkVOVFM9eQojIENPTkZJR19LUFJPQkVfRVZFTlRTX09OX05P
VFJBQ0UgaXMgbm90IHNldApDT05GSUdfVVBST0JFX0VWRU5UUz15CkNPTkZJR19CUEZfRVZFTlRT
PXkKQ09ORklHX0RZTkFNSUNfRVZFTlRTPXkKQ09ORklHX1BST0JFX0VWRU5UUz15CkNPTkZJR19E
WU5BTUlDX0ZUUkFDRT15CkNPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX1JFR1M9eQpDT05GSUdf
RlVOQ1RJT05fUFJPRklMRVI9eQojIENPTkZJR19CUEZfS1BST0JFX09WRVJSSURFIGlzIG5vdCBz
ZXQKQ09ORklHX0ZUUkFDRV9NQ09VTlRfUkVDT1JEPXkKIyBDT05GSUdfRlRSQUNFX1NUQVJUVVBf
VEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX01NSU9UUkFDRSBpcyBub3Qgc2V0CkNPTkZJR19UUkFD
SU5HX01BUD15CkNPTkZJR19ISVNUX1RSSUdHRVJTPXkKIyBDT05GSUdfVFJBQ0VQT0lOVF9CRU5D
SE1BUksgaXMgbm90IHNldApDT05GSUdfUklOR19CVUZGRVJfQkVOQ0hNQVJLPW0KIyBDT05GSUdf
UklOR19CVUZGRVJfU1RBUlRVUF9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfUFJFRU1QVElSUV9E
RUxBWV9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfVFJBQ0VfRVZBTF9NQVBfRklMRSBpcyBub3Qg
c2V0CkNPTkZJR19QUk9WSURFX09IQ0kxMzk0X0RNQV9JTklUPXkKQ09ORklHX1JVTlRJTUVfVEVT
VElOR19NRU5VPXkKIyBDT05GSUdfTEtEVE0gaXMgbm90IHNldAojIENPTkZJR19URVNUX0xJU1Rf
U09SVCBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfU09SVCBpcyBub3Qgc2V0CiMgQ09ORklHX0tQ
Uk9CRVNfU0FOSVRZX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19CQUNLVFJBQ0VfU0VMRl9URVNU
IGlzIG5vdCBzZXQKIyBDT05GSUdfUkJUUkVFX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19JTlRF
UlZBTF9UUkVFX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19QRVJDUFVfVEVTVCBpcyBub3Qgc2V0
CkNPTkZJR19BVE9NSUM2NF9TRUxGVEVTVD15CiMgQ09ORklHX0FTWU5DX1JBSUQ2X1RFU1QgaXMg
bm90IHNldAojIENPTkZJR19URVNUX0hFWERVTVAgaXMgbm90IHNldAojIENPTkZJR19URVNUX1NU
UklOR19IRUxQRVJTIGlzIG5vdCBzZXQKQ09ORklHX1RFU1RfU1RSU0NQWT1tCiMgQ09ORklHX1RF
U1RfS1NUUlRPWCBpcyBub3Qgc2V0CkNPTkZJR19URVNUX1BSSU5URj1tCkNPTkZJR19URVNUX0JJ
VE1BUD1tCiMgQ09ORklHX1RFU1RfQklURklFTEQgaXMgbm90IHNldAojIENPTkZJR19URVNUX1VV
SUQgaXMgbm90IHNldAojIENPTkZJR19URVNUX1hBUlJBWSBpcyBub3Qgc2V0CiMgQ09ORklHX1RF
U1RfT1ZFUkZMT1cgaXMgbm90IHNldAojIENPTkZJR19URVNUX1JIQVNIVEFCTEUgaXMgbm90IHNl
dAojIENPTkZJR19URVNUX0hBU0ggaXMgbm90IHNldAojIENPTkZJR19URVNUX0lEQSBpcyBub3Qg
c2V0CkNPTkZJR19URVNUX0xLTT1tCkNPTkZJR19URVNUX1ZNQUxMT0M9bQpDT05GSUdfVEVTVF9V
U0VSX0NPUFk9bQpDT05GSUdfVEVTVF9CUEY9bQojIENPTkZJR19GSU5EX0JJVF9CRU5DSE1BUksg
aXMgbm90IHNldApDT05GSUdfVEVTVF9GSVJNV0FSRT1tCkNPTkZJR19URVNUX1NZU0NUTD1tCiMg
Q09ORklHX1RFU1RfVURFTEFZIGlzIG5vdCBzZXQKQ09ORklHX1RFU1RfU1RBVElDX0tFWVM9bQpD
T05GSUdfVEVTVF9LTU9EPW0KIyBDT05GSUdfVEVTVF9NRU1DQVRfUCBpcyBub3Qgc2V0CiMgQ09O
RklHX1RFU1RfU1RBQ0tJTklUIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVNVEVTVCBpcyBub3Qgc2V0
CiMgQ09ORklHX0JVR19PTl9EQVRBX0NPUlJVUFRJT04gaXMgbm90IHNldAojIENPTkZJR19TQU1Q
TEVTIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfQVJDSF9LR0RCPXkKIyBDT05GSUdfS0dEQiBpcyBu
b3Qgc2V0CkNPTkZJR19BUkNIX0hBU19VQlNBTl9TQU5JVElaRV9BTEw9eQojIENPTkZJR19VQlNB
TiBpcyBub3Qgc2V0CkNPTkZJR19VQlNBTl9BTElHTk1FTlQ9eQpDT05GSUdfQVJDSF9IQVNfREVW
TUVNX0lTX0FMTE9XRUQ9eQpDT05GSUdfU1RSSUNUX0RFVk1FTT15CiMgQ09ORklHX0lPX1NUUklD
VF9ERVZNRU0gaXMgbm90IHNldApDT05GSUdfVFJBQ0VfSVJRRkxBR1NfU1VQUE9SVD15CkNPTkZJ
R19FQVJMWV9QUklOVEtfVVNCPXkKQ09ORklHX1g4Nl9WRVJCT1NFX0JPT1RVUD15CkNPTkZJR19F
QVJMWV9QUklOVEs9eQpDT05GSUdfRUFSTFlfUFJJTlRLX0RCR1A9eQojIENPTkZJR19FQVJMWV9Q
UklOVEtfVVNCX1hEQkMgaXMgbm90IHNldAojIENPTkZJR19YODZfUFREVU1QIGlzIG5vdCBzZXQK
IyBDT05GSUdfRUZJX1BHVF9EVU1QIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfV1ggaXMgbm90
IHNldApDT05GSUdfRE9VQkxFRkFVTFQ9eQojIENPTkZJR19ERUJVR19UTEJGTFVTSCBpcyBub3Qg
c2V0CiMgQ09ORklHX0lPTU1VX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfTU1JT1RSQUNF
X1NVUFBPUlQ9eQpDT05GSUdfWDg2X0RFQ09ERVJfU0VMRlRFU1Q9eQpDT05GSUdfSU9fREVMQVlf
VFlQRV8wWDgwPTAKQ09ORklHX0lPX0RFTEFZX1RZUEVfMFhFRD0xCkNPTkZJR19JT19ERUxBWV9U
WVBFX1VERUxBWT0yCkNPTkZJR19JT19ERUxBWV9UWVBFX05PTkU9MwpDT05GSUdfSU9fREVMQVlf
MFg4MD15CiMgQ09ORklHX0lPX0RFTEFZXzBYRUQgaXMgbm90IHNldAojIENPTkZJR19JT19ERUxB
WV9VREVMQVkgaXMgbm90IHNldAojIENPTkZJR19JT19ERUxBWV9OT05FIGlzIG5vdCBzZXQKQ09O
RklHX0RFRkFVTFRfSU9fREVMQVlfVFlQRT0wCkNPTkZJR19ERUJVR19CT09UX1BBUkFNUz15CiMg
Q09ORklHX0NQQV9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0VOVFJZIGlzIG5vdCBz
ZXQKIyBDT05GSUdfREVCVUdfTk1JX1NFTEZURVNUIGlzIG5vdCBzZXQKQ09ORklHX1g4Nl9ERUJV
R19GUFU9eQojIENPTkZJR19QVU5JVF9BVE9NX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX1VOV0lO
REVSX09SQz15CiMgQ09ORklHX1VOV0lOREVSX0ZSQU1FX1BPSU5URVIgaXMgbm90IHNldAojIENP
TkZJR19VTldJTkRFUl9HVUVTUyBpcyBub3Qgc2V0CiMgZW5kIG9mIEtlcm5lbCBoYWNraW5nCg==

--===============4811761945175766285==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job-script.ksh"

IyEvYmluL3NoCgpleHBvcnRfdG9wX2VudigpCnsKCWV4cG9ydCBzdWl0ZT0nd2lsbC1pdC1zY2Fs
ZScKCWV4cG9ydCB0ZXN0Y2FzZT0nd2lsbC1pdC1zY2FsZScKCWV4cG9ydCBjYXRlZ29yeT0nYmVu
Y2htYXJrJwoJZXhwb3J0IG5yX3Rhc2s9NDgKCWV4cG9ydCBqb2Jfb3JpZ2luPScvbGtwL2xrcC8u
c3JjLTIwMTkwODI3LTE4NTUxNy9hbGxvdC9jeWNsaWM6Y2xlYXI6aW50ZXJuYWwtZXl3YTptYXN0
ZXIvbGtwLWNzbC0yc3A0L3dpbGwtaXQtc2NhbGUtNTAueWFtbCcKCWV4cG9ydCBxdWV1ZV9jbWRs
aW5lX2tleXM9J2JyYW5jaApjb21taXQKcXVldWVfYXRfbGVhc3Rfb25jZScKCWV4cG9ydCBxdWV1
ZT0ndmFsaWRhdGUnCglleHBvcnQgdGVzdGJveD0nbGtwLWNzbC0yc3A0JwoJZXhwb3J0IHRib3hf
Z3JvdXA9J2xrcC1jc2wtMnNwNCcKCWV4cG9ydCBzdWJtaXRfaWQ9JzVkNzA0NWE0ZGRiMzA3MjVk
MDhlYzUyOCcKCWV4cG9ydCBqb2JfZmlsZT0nL2xrcC9qb2JzL3NjaGVkdWxlZC9sa3AtY3NsLTJz
cDQvd2lsbC1pdC1zY2FsZS1wZXJmb3JtYW5jZS10aHJlYWQtNTAlLW1tYXAyLXVjb2RlPTB4NDAw
MDAxYy1jbGVhci0tMjAxOTA5MDUtOTY4MC0xdmRwcWZkLTMueWFtbCcKCWV4cG9ydCBpZD0nNDg1
NDcyYzM1MDM2YmI0YTQwMmVlYjk1N2UxOWE2NzFiNWFjNWZjMycKCWV4cG9ydCBxdWV1ZXJfdmVy
c2lvbj0nL2xrcC1zcmMnCglleHBvcnQgYXJjaD0neDg2XzY0JwoJZXhwb3J0IG1vZGVsPSdDYXNj
YWRlIExha2UnCglleHBvcnQgbnJfbm9kZT0yCglleHBvcnQgbnJfY3B1PTk2CglleHBvcnQgbWVt
b3J5PScxMjhHJwoJZXhwb3J0IG5yX2hkZF9wYXJ0aXRpb25zPTIKCWV4cG9ydCBoZGRfcGFydGl0
aW9ucz0nL2Rldi9kaXNrL2J5LWlkL2F0YS1TVDUwMExNMDIxLTFLSjE1Ml9XNjI1UlgwMy1wYXJ0
KicKCWV4cG9ydCBucl9zc2RfcGFydGl0aW9ucz00CglleHBvcnQgc3NkX3BhcnRpdGlvbnM9Jy9k
ZXYvZGlzay9ieS1pZC9hdGEtSU5URUxfU1NEU0MyQkcwMTJUNF9CVEhDNDI3NTAzMDAxUDJLR04t
cGFydConCglleHBvcnQgc3dhcF9wYXJ0aXRpb25zPQoJZXhwb3J0IHJvb3Rmc19wYXJ0aXRpb249
J0xBQkVMPUxLUC1ST09URlMnCglleHBvcnQgYnJhbmQ9J0ludGVsKFIpIFhlb24oUikgQ1BVIEAg
Mi4zMEdIeicKCWV4cG9ydCB1Y29kZT0nMHg0MDAwMDFjJwoJZXhwb3J0IGNvbW1pdD0nMDBmM2M1
YTNkZjJjMWUzZGFiMTRkMGRkMmI3MWY4NTJkNDZiZTk3ZicKCWV4cG9ydCByb290ZnM9J2NsZWFy
LW90YS0yNTU5MC14ODZfNjQtMjAxOC0xMC0xOC5jZ3onCglleHBvcnQga2NvbmZpZz0neDg2XzY0
LXJoZWwtNy4yLWNsZWFyJwoJZXhwb3J0IHJ1bl9vbl9sb2NhbF9kaXNrPXRydWUKCWV4cG9ydCBu
ZWVkX2tjb25maWdfaHc9J0NPTkZJR19JNDBFPXknCglleHBvcnQgY29tcGlsZXI9J2djYy03JwoJ
ZXhwb3J0IGVucXVldWVfdGltZT0nMjAxOS0wOS0wNSAwNzoxNjozNCArMDgwMCcKCWV4cG9ydCBf
aWQ9JzVkNzA0NWQyZGRiMzA3MjVkMDhlYzUyOScKCWV4cG9ydCBfcnQ9Jy9yZXN1bHQvd2lsbC1p
dC1zY2FsZS9wZXJmb3JtYW5jZS10aHJlYWQtNTAlLW1tYXAyLXVjb2RlPTB4NDAwMDAxYy9sa3At
Y3NsLTJzcDQvY2xlYXItb3RhLTI1NTkwLXg4Nl82NC0yMDE4LTEwLTE4LmNnei94ODZfNjQtcmhl
bC03LjItY2xlYXIvZ2NjLTcvMDBmM2M1YTNkZjJjMWUzZGFiMTRkMGRkMmI3MWY4NTJkNDZiZTk3
ZicKCWV4cG9ydCB1c2VyPSdsa3AnCglleHBvcnQgaGVhZF9jb21taXQ9J2MxNmJmNzgwNDY3YTEz
YjUwNGJhZTRlYzExYTA0MjE0MTdmZGE5OWEnCglleHBvcnQgYmFzZV9jb21taXQ9J2E1NWFhODlh
YWI5MGZhZTdjODE1YjA1NTFiMDdiZTM3ZGIzNTlkNzYnCglleHBvcnQgYnJhbmNoPSdpbnRlcm5h
bC1leXdhL21hc3RlcicKCWV4cG9ydCByZXN1bHRfcm9vdD0nL3Jlc3VsdC93aWxsLWl0LXNjYWxl
L3BlcmZvcm1hbmNlLXRocmVhZC01MCUtbW1hcDItdWNvZGU9MHg0MDAwMDFjL2xrcC1jc2wtMnNw
NC9jbGVhci1vdGEtMjU1OTAteDg2XzY0LTIwMTgtMTAtMTguY2d6L3g4Nl82NC1yaGVsLTcuMi1j
bGVhci9nY2MtNy8wMGYzYzVhM2RmMmMxZTNkYWIxNGQwZGQyYjcxZjg1MmQ0NmJlOTdmLzMnCgll
eHBvcnQgc2NoZWR1bGVyX3ZlcnNpb249Jy9sa3AvbGtwLy5zcmMtMjAxOTA5MDQtMTQyMDI5JwoJ
ZXhwb3J0IExLUF9TRVJWRVI9J2lubicKCWV4cG9ydCBtYXhfdXB0aW1lPTE1MDAKCWV4cG9ydCBp
bml0cmQ9Jy9vc2ltYWdlL2NsZWFyL2NsZWFyLW90YS0yNTU5MC14ODZfNjQtMjAxOC0xMC0xOC5j
Z3onCglleHBvcnQgYm9vdGxvYWRlcl9hcHBlbmQ9J3Jvb3Q9L2Rldi9yYW0wCnVzZXI9bGtwCmpv
Yj0vbGtwL2pvYnMvc2NoZWR1bGVkL2xrcC1jc2wtMnNwNC93aWxsLWl0LXNjYWxlLXBlcmZvcm1h
bmNlLXRocmVhZC01MCUtbW1hcDItdWNvZGU9MHg0MDAwMDFjLWNsZWFyLS0yMDE5MDkwNS05Njgw
LTF2ZHBxZmQtMy55YW1sCkFSQ0g9eDg2XzY0Cmtjb25maWc9eDg2XzY0LXJoZWwtNy4yLWNsZWFy
CmJyYW5jaD1pbnRlcm5hbC1leXdhL21hc3Rlcgpjb21taXQ9MDBmM2M1YTNkZjJjMWUzZGFiMTRk
MGRkMmI3MWY4NTJkNDZiZTk3ZgpCT09UX0lNQUdFPS9wa2cvbGludXgveDg2XzY0LXJoZWwtNy4y
LWNsZWFyL2djYy03LzAwZjNjNWEzZGYyYzFlM2RhYjE0ZDBkZDJiNzFmODUyZDQ2YmU5N2Yvdm1s
aW51ei01LjIuMC1yYzUtMDAwNjctZzAwZjNjNWEKbWF4X3VwdGltZT0xNTAwClJFU1VMVF9ST09U
PS9yZXN1bHQvd2lsbC1pdC1zY2FsZS9wZXJmb3JtYW5jZS10aHJlYWQtNTAlLW1tYXAyLXVjb2Rl
PTB4NDAwMDAxYy9sa3AtY3NsLTJzcDQvY2xlYXItb3RhLTI1NTkwLXg4Nl82NC0yMDE4LTEwLTE4
LmNnei94ODZfNjQtcmhlbC03LjItY2xlYXIvZ2NjLTcvMDBmM2M1YTNkZjJjMWUzZGFiMTRkMGRk
MmI3MWY4NTJkNDZiZTk3Zi8zCkxLUF9TRVJWRVI9aW5uCmRlYnVnCmFwaWM9ZGVidWcKc3lzcnFf
YWx3YXlzX2VuYWJsZWQKcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMApuZXQuaWZu
YW1lcz0wCnByaW50ay5kZXZrbXNnPW9uCnBhbmljPS0xCnNvZnRsb2NrdXBfcGFuaWM9MQpubWlf
d2F0Y2hkb2c9cGFuaWMKb29wcz1wYW5pYwpsb2FkX3JhbWRpc2s9Mgpwcm9tcHRfcmFtZGlzaz0w
CmRyYmQubWlub3JfY291bnQ9OApzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKaWdub3JlX2xvZ2xldmVs
CmNvbnNvbGU9dHR5MAplYXJseXByaW50az10dHlTMCwxMTUyMDAKY29uc29sZT10dHlTMCwxMTUy
MDAKdmdhPW5vcm1hbApydycKCWV4cG9ydCBtb2R1bGVzX2luaXRyZD0nL3BrZy9saW51eC94ODZf
NjQtcmhlbC03LjItY2xlYXIvZ2NjLTcvMDBmM2M1YTNkZjJjMWUzZGFiMTRkMGRkMmI3MWY4NTJk
NDZiZTk3Zi9tb2R1bGVzLmNneicKCWV4cG9ydCBibV9pbml0cmQ9Jy9vc2ltYWdlL2RlcHMvY2xl
YXItb3RhLTI1NTkwLXg4Nl82NC0yMDE4LTEwLTE4LmNnei9sa3BfMjAxOS0wNC0yNS5jZ3osL29z
aW1hZ2UvZGVwcy9jbGVhci1vdGEtMjU1OTAteDg2XzY0LTIwMTgtMTAtMTguY2d6L3dpbGwtaXQt
c2NhbGVfMjAxOS0wNi0xOS5jZ3osL29zaW1hZ2UvcGtnL2NsZWFyLW90YS0yNTU5MC14ODZfNjQt
MjAxOC0xMC0xOC5jZ3ovd2lsbC1pdC1zY2FsZS14ODZfNjQtMWVlZjg5ZV8yMDE5LTA4LTIyLmNn
eiwvb3NpbWFnZS9kZXBzL2NsZWFyLW90YS0yNTU5MC14ODZfNjQtMjAxOC0xMC0xOC5jZ3ovbXBz
dGF0XzIwMTktMDQtMzAuY2d6LC9vc2ltYWdlL3BrZy9jbGVhci1vdGEtMjU1OTAteDg2XzY0LTIw
MTgtMTAtMTguY2d6L3R1cmJvc3RhdC14ODZfNjQtZDUyNTZiMl8yMDE5LTA0LTMwLmNneiwvb3Np
bWFnZS9kZXBzL2NsZWFyLW90YS0yNTU5MC14ODZfNjQtMjAxOC0xMC0xOC5jZ3ovcGVyZl8yMDE5
LTA0LTMwLmNneiwvb3NpbWFnZS9wa2cvY2xlYXItb3RhLTI1NTkwLXg4Nl82NC0yMDE4LTEwLTE4
LmNnei9wZXJmLXg4Nl82NC1jYjZmODczOWZiZjlfMjAxOS0wNS0yMC5jZ3osL29zaW1hZ2UvcGtn
L2NsZWFyLW90YS0yNTU5MC14ODZfNjQtMjAxOC0xMC0xOC5jZ3ovbXBzdGF0LXg4Nl82NC1naXQt
MV8yMDE5LTA1LTA1LmNneicKCWV4cG9ydCBsa3BfaW5pdHJkPScvb3NpbWFnZS91c2VyL2xrcC9s
a3AteDg2XzY0LmNneicKCWV4cG9ydCBzaXRlPSdpbm4nCglleHBvcnQgTEtQX0NHSV9QT1JUPTgw
CglleHBvcnQgTEtQX0NJRlNfUE9SVD0xMzkKCWV4cG9ydCByZXBlYXRfdG89NAoJZXhwb3J0IGJh
ZF9zYW1wbGVzPSc1NDgxCjU1MTMKNTQ1MycKCWV4cG9ydCBzY2hlZHVsZV9ub3RpZnlfYWRkcmVz
cz0KCWV4cG9ydCBxdWV1ZV9hdF9sZWFzdF9vbmNlPTEKCWV4cG9ydCBrZXJuZWw9Jy9wa2cvbGlu
dXgveDg2XzY0LXJoZWwtNy4yLWNsZWFyL2djYy03LzAwZjNjNWEzZGYyYzFlM2RhYjE0ZDBkZDJi
NzFmODUyZDQ2YmU5N2Yvdm1saW51ei01LjIuMC1yYzUtMDAwNjctZzAwZjNjNWEnCglleHBvcnQg
ZGVxdWV1ZV90aW1lPScyMDE5LTA5LTA1IDA3OjI1OjIyICswODAwJwoJZXhwb3J0IGpvYl9pbml0
cmQ9Jy9sa3Avam9icy9zY2hlZHVsZWQvbGtwLWNzbC0yc3A0L3dpbGwtaXQtc2NhbGUtcGVyZm9y
bWFuY2UtdGhyZWFkLTUwJS1tbWFwMi11Y29kZT0weDQwMDAwMWMtY2xlYXItLTIwMTkwOTA1LTk2
ODAtMXZkcHFmZC0zLmNneicKCglbIC1uICIkTEtQX1NSQyIgXSB8fAoJZXhwb3J0IExLUF9TUkM9
L2xrcC8ke3VzZXI6LWxrcH0vc3JjCn0KCnJ1bl9qb2IoKQp7CgllY2hvICQkID4gJFRNUC9ydW4t
am9iLnBpZAoKCS4gJExLUF9TUkMvbGliL2h0dHAuc2gKCS4gJExLUF9TUkMvbGliL2pvYi5zaAoJ
LiAkTEtQX1NSQy9saWIvZW52LnNoCgoJZXhwb3J0X3RvcF9lbnYKCglydW5fc2V0dXAgJExLUF9T
UkMvc2V0dXAvY3B1ZnJlcV9nb3Zlcm5vciAncGVyZm9ybWFuY2UnCgoJcnVuX21vbml0b3IgJExL
UF9TUkMvbW9uaXRvcnMvd3JhcHBlciBrbXNnCglydW5fbW9uaXRvciAkTEtQX1NSQy9tb25pdG9y
cy9uby1zdGRvdXQvd3JhcHBlciBib290LXRpbWUKCXJ1bl9tb25pdG9yICRMS1BfU1JDL21vbml0
b3JzL3dyYXBwZXIgaW9zdGF0CglydW5fbW9uaXRvciAkTEtQX1NSQy9tb25pdG9ycy93cmFwcGVy
IGhlYXJ0YmVhdAoJcnVuX21vbml0b3IgJExLUF9TUkMvbW9uaXRvcnMvd3JhcHBlciB2bXN0YXQK
CXJ1bl9tb25pdG9yICRMS1BfU1JDL21vbml0b3JzL3dyYXBwZXIgbnVtYS1udW1hc3RhdAoJcnVu
X21vbml0b3IgJExLUF9TUkMvbW9uaXRvcnMvd3JhcHBlciBudW1hLXZtc3RhdAoJcnVuX21vbml0
b3IgJExLUF9TUkMvbW9uaXRvcnMvd3JhcHBlciBudW1hLW1lbWluZm8KCXJ1bl9tb25pdG9yICRM
S1BfU1JDL21vbml0b3JzL3dyYXBwZXIgcHJvYy12bXN0YXQKCXJ1bl9tb25pdG9yICRMS1BfU1JD
L21vbml0b3JzL3dyYXBwZXIgcHJvYy1zdGF0CglydW5fbW9uaXRvciAkTEtQX1NSQy9tb25pdG9y
cy93cmFwcGVyIG1lbWluZm8KCXJ1bl9tb25pdG9yICRMS1BfU1JDL21vbml0b3JzL3dyYXBwZXIg
c2xhYmluZm8KCXJ1bl9tb25pdG9yICRMS1BfU1JDL21vbml0b3JzL3dyYXBwZXIgaW50ZXJydXB0
cwoJcnVuX21vbml0b3IgJExLUF9TUkMvbW9uaXRvcnMvd3JhcHBlciBsb2NrX3N0YXQKCXJ1bl9t
b25pdG9yICRMS1BfU1JDL21vbml0b3JzL3dyYXBwZXIgbGF0ZW5jeV9zdGF0cwoJcnVuX21vbml0
b3IgJExLUF9TUkMvbW9uaXRvcnMvd3JhcHBlciBzb2Z0aXJxcwoJcnVuX21vbml0b3IgJExLUF9T
UkMvbW9uaXRvcnMvb25lLXNob3Qvd3JhcHBlciBiZGlfZGV2X21hcHBpbmcKCXJ1bl9tb25pdG9y
ICRMS1BfU1JDL21vbml0b3JzL3dyYXBwZXIgZGlza3N0YXRzCglydW5fbW9uaXRvciAkTEtQX1NS
Qy9tb25pdG9ycy93cmFwcGVyIG5mc3N0YXQKCXJ1bl9tb25pdG9yICRMS1BfU1JDL21vbml0b3Jz
L3dyYXBwZXIgY3B1aWRsZQoJcnVuX21vbml0b3IgJExLUF9TUkMvbW9uaXRvcnMvd3JhcHBlciBj
cHVmcmVxLXN0YXRzCglydW5fbW9uaXRvciAkTEtQX1NSQy9tb25pdG9ycy93cmFwcGVyIHR1cmJv
c3RhdAoJcnVuX21vbml0b3IgJExLUF9TUkMvbW9uaXRvcnMvd3JhcHBlciBzY2hlZF9kZWJ1ZwoJ
cnVuX21vbml0b3IgJExLUF9TUkMvbW9uaXRvcnMvd3JhcHBlciBwZXJmLXN0YXQKCXJ1bl9tb25p
dG9yICRMS1BfU1JDL21vbml0b3JzL3dyYXBwZXIgbXBzdGF0CglydW5fbW9uaXRvciAkTEtQX1NS
Qy9tb25pdG9ycy9uby1zdGRvdXQvd3JhcHBlciBwZXJmLXByb2ZpbGUKCXJ1bl9tb25pdG9yICRM
S1BfU1JDL21vbml0b3JzL3dyYXBwZXIgb29tLWtpbGxlcgoJcnVuX21vbml0b3IgJExLUF9TUkMv
bW9uaXRvcnMvcGxhaW4vd2F0Y2hkb2cKCglydW5fdGVzdCBtb2RlPSd0aHJlYWQnIHRlc3Q9J21t
YXAyJyAkTEtQX1NSQy90ZXN0cy93cmFwcGVyIHdpbGwtaXQtc2NhbGUKfQoKZXh0cmFjdF9zdGF0
cygpCnsKCWV4cG9ydCBzdGF0c19wYXJ0X2JlZ2luPQoJZXhwb3J0IHN0YXRzX3BhcnRfZW5kPQoK
CSRMS1BfU1JDL3N0YXRzL3dyYXBwZXIgd2lsbC1pdC1zY2FsZQoJJExLUF9TUkMvc3RhdHMvd3Jh
cHBlciBrbXNnCgkkTEtQX1NSQy9zdGF0cy93cmFwcGVyIGJvb3QtdGltZQoJJExLUF9TUkMvc3Rh
dHMvd3JhcHBlciBpb3N0YXQKCSRMS1BfU1JDL3N0YXRzL3dyYXBwZXIgdm1zdGF0CgkkTEtQX1NS
Qy9zdGF0cy93cmFwcGVyIG51bWEtbnVtYXN0YXQKCSRMS1BfU1JDL3N0YXRzL3dyYXBwZXIgbnVt
YS12bXN0YXQKCSRMS1BfU1JDL3N0YXRzL3dyYXBwZXIgbnVtYS1tZW1pbmZvCgkkTEtQX1NSQy9z
dGF0cy93cmFwcGVyIHByb2Mtdm1zdGF0CgkkTEtQX1NSQy9zdGF0cy93cmFwcGVyIG1lbWluZm8K
CSRMS1BfU1JDL3N0YXRzL3dyYXBwZXIgc2xhYmluZm8KCSRMS1BfU1JDL3N0YXRzL3dyYXBwZXIg
aW50ZXJydXB0cwoJJExLUF9TUkMvc3RhdHMvd3JhcHBlciBsb2NrX3N0YXQKCSRMS1BfU1JDL3N0
YXRzL3dyYXBwZXIgbGF0ZW5jeV9zdGF0cwoJJExLUF9TUkMvc3RhdHMvd3JhcHBlciBzb2Z0aXJx
cwoJJExLUF9TUkMvc3RhdHMvd3JhcHBlciBkaXNrc3RhdHMKCSRMS1BfU1JDL3N0YXRzL3dyYXBw
ZXIgbmZzc3RhdAoJJExLUF9TUkMvc3RhdHMvd3JhcHBlciBjcHVpZGxlCgkkTEtQX1NSQy9zdGF0
cy93cmFwcGVyIHR1cmJvc3RhdAoJJExLUF9TUkMvc3RhdHMvd3JhcHBlciBzY2hlZF9kZWJ1ZwoJ
JExLUF9TUkMvc3RhdHMvd3JhcHBlciBwZXJmLXN0YXQKCSRMS1BfU1JDL3N0YXRzL3dyYXBwZXIg
bXBzdGF0CgkkTEtQX1NSQy9zdGF0cy93cmFwcGVyIHBlcmYtcHJvZmlsZQoKCSRMS1BfU1JDL3N0
YXRzL3dyYXBwZXIgdGltZSB3aWxsLWl0LXNjYWxlLnRpbWUKCSRMS1BfU1JDL3N0YXRzL3dyYXBw
ZXIgZG1lc2cKCSRMS1BfU1JDL3N0YXRzL3dyYXBwZXIga21zZwoJJExLUF9TUkMvc3RhdHMvd3Jh
cHBlciBsYXN0X3N0YXRlCgkkTEtQX1NSQy9zdGF0cy93cmFwcGVyIHN0ZGVycgoJJExLUF9TUkMv
c3RhdHMvd3JhcHBlciB0aW1lCn0KCiIkQCIK

--===============4811761945175766285==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnN1aXRlOiB3aWxsLWl0LXNjYWxlCnRlc3RjYXNlOiB3aWxsLWl0LXNjYWxlCmNhdGVnb3J5
OiBiZW5jaG1hcmsKbnJfdGFzazogNTAlCndpbGwtaXQtc2NhbGU6CiAgbW9kZTogdGhyZWFkCiAg
dGVzdDogbW1hcDIKam9iX29yaWdpbjogIi9sa3AvbGtwLy5zcmMtMjAxOTA4MjctMTg1NTE3L2Fs
bG90L2N5Y2xpYzpjbGVhcjppbnRlcm5hbC1leXdhOm1hc3Rlci9sa3AtY3NsLTJzcDQvd2lsbC1p
dC1zY2FsZS01MC55YW1sIgpxdWV1ZV9jbWRsaW5lX2tleXM6Ci0gYnJhbmNoCi0gY29tbWl0Ci0g
cXVldWVfYXRfbGVhc3Rfb25jZQpxdWV1ZTogYmlzZWN0CnRlc3Rib3g6IGxrcC1jc2wtMnNwNAp0
Ym94X2dyb3VwOiBsa3AtY3NsLTJzcDQKc3VibWl0X2lkOiA1ZDcwMmE0OWRkYjMwNzIzNzFhOWEx
NjkKam9iX2ZpbGU6ICIvbGtwL2pvYnMvc2NoZWR1bGVkL2xrcC1jc2wtMnNwNC93aWxsLWl0LXNj
YWxlLXBlcmZvcm1hbmNlLXRocmVhZC01MCUtbW1hcDItdWNvZGU9MHg0MDAwMDFjLWNsZWFyLW90
LTIwMTkwOTA1LTkwNzMtMTZvcWUxMi0wLnlhbWwiCmlkOiA0OTFjYjk1MzVkMTc2NTg0NDdmM2Y2
ODEwZTBiMjkyMGNjZjY3YjM5CnF1ZXVlcl92ZXJzaW9uOiAiL2xrcC1zcmMiCmFyY2g6IHg4Nl82
NAptb2RlbDogQ2FzY2FkZSBMYWtlCm5yX25vZGU6IDIKbnJfY3B1OiA5NgptZW1vcnk6IDEyOEcK
bnJfaGRkX3BhcnRpdGlvbnM6IDIKaGRkX3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRh
LVNUNTAwTE0wMjEtMUtKMTUyX1c2MjVSWDAzLXBhcnQqIgpucl9zc2RfcGFydGl0aW9uczogNApz
c2RfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtSU5URUxfU1NEU0MyQkcwMTJUNF9C
VEhDNDI3NTAzMDAxUDJLR04tcGFydCoiCnN3YXBfcGFydGl0aW9uczogCnJvb3Rmc19wYXJ0aXRp
b246IExBQkVMPUxLUC1ST09URlMKYnJhbmQ6IEludGVsKFIpIFhlb24oUikgQ1BVIEAgMi4zMEdI
egp1Y29kZTogJzB4NDAwMDAxYycKa21zZzogCmJvb3QtdGltZTogCmlvc3RhdDogCmhlYXJ0YmVh
dDogCnZtc3RhdDogCm51bWEtbnVtYXN0YXQ6IApudW1hLXZtc3RhdDogCm51bWEtbWVtaW5mbzog
CnByb2Mtdm1zdGF0OiAKcHJvYy1zdGF0OiAKbWVtaW5mbzogCnNsYWJpbmZvOiAKaW50ZXJydXB0
czogCmxvY2tfc3RhdDogCmxhdGVuY3lfc3RhdHM6IApzb2Z0aXJxczogCmJkaV9kZXZfbWFwcGlu
ZzogCmRpc2tzdGF0czogCm5mc3N0YXQ6IApjcHVpZGxlOiAKY3B1ZnJlcS1zdGF0czogCnR1cmJv
c3RhdDogCnNjaGVkX2RlYnVnOiAKcGVyZi1zdGF0OiAKbXBzdGF0OiAKcGVyZi1wcm9maWxlOiAK
Y3B1ZnJlcV9nb3Zlcm5vcjogcGVyZm9ybWFuY2UKY29tbWl0OiAwMGYzYzVhM2RmMmMxZTNkYWIx
NGQwZGQyYjcxZjg1MmQ0NmJlOTdmCnJvb3RmczogY2xlYXItb3RhLTI1NTkwLXg4Nl82NC0yMDE4
LTEwLTE4LmNnegprY29uZmlnOiB4ODZfNjQtcmhlbC03LjItY2xlYXIKcnVuX29uX2xvY2FsX2Rp
c2s6IHRydWUKbmVlZF9rY29uZmlnX2h3OiBDT05GSUdfSTQwRT15CmNvbXBpbGVyOiBnY2MtNwpl
bnF1ZXVlX3RpbWU6IDIwMTktMDktMDUgMDU6MjA6MDUuMTQ5MDQxMDU1ICswODowMApfaWQ6IDVk
NzAyYTQ5ZGRiMzA3MjM3MWE5YTE2OQpfcnQ6ICIvcmVzdWx0L3dpbGwtaXQtc2NhbGUvcGVyZm9y
bWFuY2UtdGhyZWFkLTUwJS1tbWFwMi11Y29kZT0weDQwMDAwMWMvbGtwLWNzbC0yc3A0L2NsZWFy
LW90YS0yNTU5MC14ODZfNjQtMjAxOC0xMC0xOC5jZ3oveDg2XzY0LXJoZWwtNy4yLWNsZWFyL2dj
Yy03LzAwZjNjNWEzZGYyYzFlM2RhYjE0ZDBkZDJiNzFmODUyZDQ2YmU5N2YiCnVzZXI6IGxrcApo
ZWFkX2NvbW1pdDogYzE2YmY3ODA0NjdhMTNiNTA0YmFlNGVjMTFhMDQyMTQxN2ZkYTk5YQpiYXNl
X2NvbW1pdDogYTU1YWE4OWFhYjkwZmFlN2M4MTViMDU1MWIwN2JlMzdkYjM1OWQ3NgpicmFuY2g6
IGludGVybmFsLWV5d2EvbWFzdGVyCnJlc3VsdF9yb290OiAiL3Jlc3VsdC93aWxsLWl0LXNjYWxl
L3BlcmZvcm1hbmNlLXRocmVhZC01MCUtbW1hcDItdWNvZGU9MHg0MDAwMDFjL2xrcC1jc2wtMnNw
NC9jbGVhci1vdGEtMjU1OTAteDg2XzY0LTIwMTgtMTAtMTguY2d6L3g4Nl82NC1yaGVsLTcuMi1j
bGVhci9nY2MtNy8wMGYzYzVhM2RmMmMxZTNkYWIxNGQwZGQyYjcxZjg1MmQ0NmJlOTdmLzAiCnNj
aGVkdWxlcl92ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE5MDkwNC0xNDIwMjkiCkxLUF9TRVJW
RVI6IGlubgptYXhfdXB0aW1lOiAxNTAwCmluaXRyZDogIi9vc2ltYWdlL2NsZWFyL2NsZWFyLW90
YS0yNTU5MC14ODZfNjQtMjAxOC0xMC0xOC5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9
L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9qb2JzL3NjaGVkdWxlZC9sa3AtY3NsLTJz
cDQvd2lsbC1pdC1zY2FsZS1wZXJmb3JtYW5jZS10aHJlYWQtNTAlLW1tYXAyLXVjb2RlPTB4NDAw
MDAxYy1jbGVhci1vdC0yMDE5MDkwNS05MDczLTE2b3FlMTItMC55YW1sCi0gQVJDSD14ODZfNjQK
LSBrY29uZmlnPXg4Nl82NC1yaGVsLTcuMi1jbGVhcgotIGJyYW5jaD1pbnRlcm5hbC1leXdhL21h
c3RlcgotIGNvbW1pdD0wMGYzYzVhM2RmMmMxZTNkYWIxNGQwZGQyYjcxZjg1MmQ0NmJlOTdmCi0g
Qk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVsLTcuMi1jbGVhci9nY2MtNy8wMGYzYzVh
M2RmMmMxZTNkYWIxNGQwZGQyYjcxZjg1MmQ0NmJlOTdmL3ZtbGludXotNS4yLjAtcmM1LTAwMDY3
LWcwMGYzYzVhCi0gbWF4X3VwdGltZT0xNTAwCi0gUkVTVUxUX1JPT1Q9L3Jlc3VsdC93aWxsLWl0
LXNjYWxlL3BlcmZvcm1hbmNlLXRocmVhZC01MCUtbW1hcDItdWNvZGU9MHg0MDAwMDFjL2xrcC1j
c2wtMnNwNC9jbGVhci1vdGEtMjU1OTAteDg2XzY0LTIwMTgtMTAtMTguY2d6L3g4Nl82NC1yaGVs
LTcuMi1jbGVhci9nY2MtNy8wMGYzYzVhM2RmMmMxZTNkYWIxNGQwZGQyYjcxZjg1MmQ0NmJlOTdm
LzAKLSBMS1BfU0VSVkVSPWlubgotIGRlYnVnCi0gYXBpYz1kZWJ1ZwotIHN5c3JxX2Fsd2F5c19l
bmFibGVkCi0gcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAotIG5ldC5pZm5hbWVz
PTAKLSBwcmludGsuZGV2a21zZz1vbgotIHBhbmljPS0xCi0gc29mdGxvY2t1cF9wYW5pYz0xCi0g
bm1pX3dhdGNoZG9nPXBhbmljCi0gb29wcz1wYW5pYwotIGxvYWRfcmFtZGlzaz0yCi0gcHJvbXB0
X3JhbWRpc2s9MAotIGRyYmQubWlub3JfY291bnQ9OAotIHN5c3RlbWQubG9nX2xldmVsPWVycgot
IGlnbm9yZV9sb2dsZXZlbAotIGNvbnNvbGU9dHR5MAotIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIw
MAotIGNvbnNvbGU9dHR5UzAsMTE1MjAwCi0gdmdhPW5vcm1hbAotIHJ3Cm1vZHVsZXNfaW5pdHJk
OiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC03LjItY2xlYXIvZ2NjLTcvMDBmM2M1YTNkZjJjMWUz
ZGFiMTRkMGRkMmI3MWY4NTJkNDZiZTk3Zi9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAiL29zaW1h
Z2UvZGVwcy9jbGVhci1vdGEtMjU1OTAteDg2XzY0LTIwMTgtMTAtMTguY2d6L2xrcF8yMDE5LTA0
LTI1LmNneiwvb3NpbWFnZS9kZXBzL2NsZWFyLW90YS0yNTU5MC14ODZfNjQtMjAxOC0xMC0xOC5j
Z3ovd2lsbC1pdC1zY2FsZV8yMDE5LTA2LTE5LmNneiwvb3NpbWFnZS9wa2cvY2xlYXItb3RhLTI1
NTkwLXg4Nl82NC0yMDE4LTEwLTE4LmNnei93aWxsLWl0LXNjYWxlLXg4Nl82NC0xZWVmODllXzIw
MTktMDgtMjIuY2d6LC9vc2ltYWdlL2RlcHMvY2xlYXItb3RhLTI1NTkwLXg4Nl82NC0yMDE4LTEw
LTE4LmNnei9tcHN0YXRfMjAxOS0wNC0zMC5jZ3osL29zaW1hZ2UvcGtnL2NsZWFyLW90YS0yNTU5
MC14ODZfNjQtMjAxOC0xMC0xOC5jZ3ovdHVyYm9zdGF0LXg4Nl82NC1kNTI1NmIyXzIwMTktMDQt
MzAuY2d6LC9vc2ltYWdlL2RlcHMvY2xlYXItb3RhLTI1NTkwLXg4Nl82NC0yMDE4LTEwLTE4LmNn
ei9wZXJmXzIwMTktMDQtMzAuY2d6LC9vc2ltYWdlL3BrZy9jbGVhci1vdGEtMjU1OTAteDg2XzY0
LTIwMTgtMTAtMTguY2d6L3BlcmYteDg2XzY0LWNiNmY4NzM5ZmJmOV8yMDE5LTA1LTIwLmNneiwv
b3NpbWFnZS9wa2cvY2xlYXItb3RhLTI1NTkwLXg4Nl82NC0yMDE4LTEwLTE4LmNnei9tcHN0YXQt
eDg2XzY0LWdpdC0xXzIwMTktMDUtMDUuY2d6Igpsa3BfaW5pdHJkOiAiL29zaW1hZ2UvdXNlci9s
a3AvbGtwLXg4Nl82NC5jZ3oiCnNpdGU6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BP
UlQ6IDEzOQpvb20ta2lsbGVyOiAKd2F0Y2hkb2c6IApyZXBlYXRfdG86IDIKYmFkX3NhbXBsZXM6
Ci0gNTQ4MQotIDU1MTMKLSA1NDUzCgojISBxdWV1ZSBvcHRpb25zCnNjaGVkdWxlX25vdGlmeV9h
ZGRyZXNzOiAKCiMhIHVzZXIgb3ZlcnJpZGVzCnF1ZXVlX2F0X2xlYXN0X29uY2U6IDAKCiMhIHNj
aGVkdWxlIG9wdGlvbnMKa2VybmVsOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC03LjItY2xlYXIv
Z2NjLTcvMDBmM2M1YTNkZjJjMWUzZGFiMTRkMGRkMmI3MWY4NTJkNDZiZTk3Zi92bWxpbnV6LTUu
Mi4wLXJjNS0wMDA2Ny1nMDBmM2M1YSIKZGVxdWV1ZV90aW1lOiAyMDE5LTA5LTA1IDA2OjEzOjI4
LjkzNDI3ODQ3MyArMDg6MDAKCiMhIC9sa3AvbGtwLy5zcmMtMjAxOTA5MDQtMTQyMDI5L2luY2x1
ZGUvc2l0ZS9pbm4KCiMhIHJ1bnRpbWUgc3RhdHVzCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2
ZzogMjcuMzEgMjcuNDkgMTIuOTkgMS83MjcgMzI2NDYKc3RhcnRfdGltZTogJzE1Njc2MzUzNDcn
CmVuZF90aW1lOiAnMTU2NzYzNTY2NScKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxOTA5MDQt
MTQyMDUyIgo=

--===============4811761945175766285==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

CmZvciBjcHVfZGlyIGluIC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdVswLTldKgpkbwoJb25s
aW5lX2ZpbGU9IiRjcHVfZGlyIi9vbmxpbmUKCVsgLWYgIiRvbmxpbmVfZmlsZSIgXSAmJiBbICIk
KGNhdCAiJG9ubGluZV9maWxlIikiIC1lcSAwIF0gJiYgY29udGludWUKCglmaWxlPSIkY3B1X2Rp
ciIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCglbIC1mICIkZmlsZSIgXSAmJiBlY2hvICJwZXJm
b3JtYW5jZSIgPiAiJGZpbGUiCmRvbmUKCiAicHl0aG9uMiIgIi4vcnVudGVzdC5weSIgIm1tYXAy
IiAiMjk1IiAidGhyZWFkIiAiNDgiCg==

--===============4811761945175766285==--

