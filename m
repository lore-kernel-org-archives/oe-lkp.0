Content-Type: multipart/mixed; boundary="===============8566580164836255588=="
MIME-Version: 1.0
From: kernel test robot <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: [rcu] 7e28c5af4e: will-it-scale.per_process_ops 84.7% improvement
Date: Thu, 28 Feb 2019 12:50:15 +0800
Message-ID: <20190228045015.GB10770@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============8566580164836255588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Greeting,

FYI, we noticed a 84.7% improvement of will-it-scale.per_process_ops due to=
 commit:


commit: 7e28c5af4ef6b539334aa5de40feca0c041c94df ("rcu: Eliminate ->rcu_qs_=
ctr from the rcu_dynticks structure")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

in testcase: will-it-scale
on test machine: 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz with =
80G memory
with following parameters:

	nr_task: 100%
	mode: process
	test: brk1
	cpufreq_governor: performance

test-description: Will It Scale takes a testcase and runs it from 1 through=
 to n parallel copies to see if the testcase will scale. It builds both a p=
rocess and threads based test in order to see any differences between the t=
wo.
test-url: https://github.com/antonblanchard/will-it-scale



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
ase:
  gcc-7/performance/x86_64-rhel-7.2/process/100%/debian-x86_64-2018-04-03.c=
gz/lkp-knm01/brk1/will-it-scale

commit: =

  c5bacd9417 ("rcu: Motivate Tiny RCU forward progress")
  7e28c5af4e ("rcu: Eliminate ->rcu_qs_ctr from the rcu_dynticks structure")

c5bacd94173ec49d 7e28c5af4ef6b539334aa5de40 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     48605           +84.7%      89756 =C2=B1  4%  will-it-scale.per_proces=
s_ops
  13998509           +84.7%   25850040 =C2=B1  4%  will-it-scale.workload
      0.01 =C2=B1 63%      -0.0        0.00 =C2=B1131%  mpstat.cpu.soft%
     11.86 =C2=B1  3%      -1.2       10.65 =C2=B1  4%  mpstat.cpu.usr%
    662910           +15.8%     767829 =C2=B1  3%  numa-numastat.node0.loca=
l_node
    662889           +15.8%     767801 =C2=B1  3%  numa-numastat.node0.numa=
_hit
      2149 =C2=B1  4%     -16.9%       1785 =C2=B1  2%  vmstat.system.cs
    727237 =C2=B1  3%     -14.9%     618668        vmstat.system.in
    284156 =C2=B1  4%     +32.5%     376625        numa-meminfo.node0.Active
    283908 =C2=B1  4%     +32.6%     376374        numa-meminfo.node0.Activ=
e(anon)
    110629 =C2=B1 15%     -77.7%      24625 =C2=B1 18%  numa-meminfo.node0.=
Inactive
    110393 =C2=B1 15%     -77.9%      24400 =C2=B1 19%  numa-meminfo.node0.=
Inactive(anon)
    284255 =C2=B1  4%     +32.5%     376666        meminfo.Active
    284007 =C2=B1  4%     +32.5%     376415        meminfo.Active(anon)
    110855 =C2=B1 15%     -77.8%      24620 =C2=B1 18%  meminfo.Inactive
    110619 =C2=B1 15%     -77.9%      24395 =C2=B1 19%  meminfo.Inactive(an=
on)
      8.00 =C2=B1173%  +11303.1%     912.25 =C2=B1 87%  meminfo.Mlocked
     11072           -15.7%       9338 =C2=B1  3%  meminfo.max_used_kB
     71004 =C2=B1  4%     +32.6%      94124        numa-vmstat.node0.nr_act=
ive_anon
     27812 =C2=B1 15%     -78.1%       6100 =C2=B1 19%  numa-vmstat.node0.n=
r_inactive_anon
      1.00 =C2=B1173%  +13100.0%     132.00 =C2=B1 87%  numa-vmstat.node0.n=
r_mlock
     71002 =C2=B1  4%     +32.6%      94122        numa-vmstat.node0.nr_zon=
e_active_anon
     27811 =C2=B1 15%     -78.1%       6100 =C2=B1 19%  numa-vmstat.node0.n=
r_zone_inactive_anon
      1.00 =C2=B1173%   +9450.0%      95.50 =C2=B1 87%  numa-vmstat.node1.n=
r_mlock
     70939 =C2=B1  4%     +32.8%      94186        proc-vmstat.nr_active_an=
on
     27523 =C2=B1 15%     -77.8%       6101 =C2=B1 19%  proc-vmstat.nr_inac=
tive_anon
      2.25 =C2=B1173%  +10044.4%     228.25 =C2=B1 86%  proc-vmstat.nr_mlock
     70939 =C2=B1  4%     +32.8%      94186        proc-vmstat.nr_zone_acti=
ve_anon
     27523 =C2=B1 15%     -77.8%       6101 =C2=B1 19%  proc-vmstat.nr_zone=
_inactive_anon
    680060           +15.8%     787707 =C2=B1  2%  proc-vmstat.numa_hit
    680060           +15.8%     787707 =C2=B1  2%  proc-vmstat.numa_local
    140509 =C2=B1 10%     -45.3%      76820 =C2=B1 24%  proc-vmstat.numa_pt=
e_updates
    895.50 =C2=B1 30%    +480.0%       5193 =C2=B1 36%  proc-vmstat.pgactiv=
ate
    774283           +13.9%     882060 =C2=B1  3%  proc-vmstat.pgalloc_norm=
al
    653457           +21.9%     796258 =C2=B1  3%  proc-vmstat.pgfault
    610954 =C2=B1  2%     +32.4%     808662 =C2=B1  3%  proc-vmstat.pgfree
      5299 =C2=B1  6%    +106.4%      10939 =C2=B1 36%  softirqs.CPU10.RCU
    106293 =C2=B1  5%     +28.2%     136274 =C2=B1 15%  softirqs.CPU126.TIM=
ER
    108234 =C2=B1  6%     +26.3%     136696 =C2=B1 15%  softirqs.CPU127.TIM=
ER
    109747 =C2=B1  7%     +26.4%     138696 =C2=B1 11%  softirqs.CPU135.TIM=
ER
    111732 =C2=B1  8%     +24.4%     138967 =C2=B1 11%  softirqs.CPU138.TIM=
ER
    107031 =C2=B1  8%     +26.7%     135558 =C2=B1 14%  softirqs.CPU148.TIM=
ER
    100841           +23.1%     124155 =C2=B1 15%  softirqs.CPU15.TIMER
    104640 =C2=B1  4%     +27.8%     133719 =C2=B1 16%  softirqs.CPU172.TIM=
ER
    103142 =C2=B1  3%     +30.9%     135023 =C2=B1 13%  softirqs.CPU190.TIM=
ER
    106698 =C2=B1 10%     +27.5%     136023 =C2=B1 13%  softirqs.CPU197.TIM=
ER
    110268 =C2=B1  2%     +22.5%     135052 =C2=B1 12%  softirqs.CPU205.TIM=
ER
    106111 =C2=B1  8%     +23.9%     131436 =C2=B1 14%  softirqs.CPU206.TIM=
ER
    106894 =C2=B1  6%     +28.7%     137574 =C2=B1 14%  softirqs.CPU213.TIM=
ER
    108418 =C2=B1  8%     +28.3%     139100 =C2=B1 12%  softirqs.CPU214.TIM=
ER
    100170 =C2=B1 10%     +32.8%     132978 =C2=B1 15%  softirqs.CPU215.TIM=
ER
    100836 =C2=B1  2%     +30.3%     131406 =C2=B1 17%  softirqs.CPU217.TIM=
ER
    112497 =C2=B1  8%     +22.9%     138291 =C2=B1 13%  softirqs.CPU219.TIM=
ER
    108669 =C2=B1 10%     +22.1%     132720 =C2=B1 15%  softirqs.CPU220.TIM=
ER
    108584 =C2=B1  8%     +25.5%     136230 =C2=B1 13%  softirqs.CPU227.TIM=
ER
    106251 =C2=B1  6%     +28.6%     136686 =C2=B1 11%  softirqs.CPU236.TIM=
ER
    105296 =C2=B1  7%     +31.3%     138251 =C2=B1 12%  softirqs.CPU238.TIM=
ER
      3915 =C2=B1  8%     +77.4%       6945 =C2=B1 30%  softirqs.CPU249.RCU
    101465 =C2=B1  2%     +26.5%     128388 =C2=B1 19%  softirqs.CPU271.TIM=
ER
    104242 =C2=B1  8%     +23.7%     128907 =C2=B1 17%  softirqs.CPU70.TIMER
    107020 =C2=B1  7%     +26.9%     135845 =C2=B1 13%  softirqs.CPU92.TIMER
 9.659e+09 =C2=B1 10%     +16.3%  1.124e+10 =C2=B1  3%  perf-stat.i.branch-=
instructions
      6.69            +1.0        7.69 =C2=B1  2%  perf-stat.i.branch-miss-=
rate%
 6.443e+08 =C2=B1 10%     +33.3%   8.59e+08 =C2=B1  2%  perf-stat.i.branch-=
misses
      4.10 =C2=B1  6%      +0.9        5.04 =C2=B1 10%  perf-stat.i.cache-m=
iss-rate%
  67464898 =C2=B1 10%     +25.2%   84491315 =C2=B1  4%  perf-stat.i.cache-m=
isses
      2820 =C2=B1 13%     -32.4%       1906 =C2=B1  3%  perf-stat.i.context=
-switches
     15.34           -37.0%       9.67 =C2=B1  3%  perf-stat.i.cpi
 7.067e+11 =C2=B1 11%     -30.2%  4.932e+11 =C2=B1  4%  perf-stat.i.cpu-cyc=
les
     71.93 =C2=B1 10%     -41.9%      41.79 =C2=B1  9%  perf-stat.i.cpu-mig=
rations
      2.36            -0.0        2.33        perf-stat.i.iTLB-load-miss-ra=
te%
 1.106e+09 =C2=B1 10%     +15.1%  1.273e+09 =C2=B1  2%  perf-stat.i.iTLB-lo=
ad-misses
 4.569e+10 =C2=B1 10%     +17.0%  5.345e+10 =C2=B1  3%  perf-stat.i.iTLB-lo=
ads
 4.621e+10 =C2=B1 10%     +16.1%  5.364e+10 =C2=B1  3%  perf-stat.i.instruc=
tions
      0.07           +64.1%       0.11 =C2=B1  3%  perf-stat.i.ipc
      3524 =C2=B1 11%     -18.3%       2878        perf-stat.i.minor-faults
    993359 =C2=B1 11%     -32.0%     675215 =C2=B1  2%  perf-stat.i.msec
      3529 =C2=B1 11%     -18.5%       2878        perf-stat.i.page-faults
      6.67            +1.0        7.65        perf-stat.overall.branch-miss=
-rate%
      3.91            +0.6        4.54 =C2=B1  3%  perf-stat.overall.cache-=
miss-rate%
     15.28           -39.8%       9.20 =C2=B1  3%  perf-stat.overall.cpi
      2.36            -0.0        2.33        perf-stat.overall.iTLB-load-m=
iss-rate%
     41.78            +0.9%      42.13        perf-stat.overall.instruction=
s-per-iTLB-miss
      0.07           +66.4%       0.11 =C2=B1  3%  perf-stat.overall.ipc
    580565            -5.5%     548645        perf-stat.overall.path-length
 1.699e+12           +74.9%  2.971e+12 =C2=B1  4%  perf-stat.total.branch-i=
nstructions
 1.133e+11          +100.6%  2.272e+11 =C2=B1  5%  perf-stat.total.branch-m=
isses
 1.186e+10           +88.0%   2.23e+10        perf-stat.total.cache-misses
 3.032e+11           +62.2%  4.918e+11 =C2=B1  2%  perf-stat.total.cache-re=
ferences
 1.242e+14            +4.8%  1.302e+14        perf-stat.total.cpu-cycles
     12654           -13.0%      11014 =C2=B1  5%  perf-stat.total.cpu-migr=
ations
 1.945e+11           +73.0%  3.365e+11 =C2=B1  3%  perf-stat.total.iTLB-loa=
d-misses
 8.038e+12           +75.8%  1.413e+13 =C2=B1  4%  perf-stat.total.iTLB-loa=
ds
 8.127e+12           +74.5%  1.418e+13 =C2=B1  4%  perf-stat.total.instruct=
ions
    619183           +22.9%     760791 =C2=B1  3%  perf-stat.total.minor-fa=
ults
    620031           +22.7%     760750 =C2=B1  3%  perf-stat.total.page-fau=
lts
  23472574 =C2=B1 28%     -50.0%   11736977 =C2=B1 60%  sched_debug.cfs_rq:=
/.MIN_vruntime.max
   1380731 =C2=B1 28%     -46.9%     733243 =C2=B1 66%  sched_debug.cfs_rq:=
/.MIN_vruntime.stddev
    109109           +17.1%     127734        sched_debug.cfs_rq:/.exec_clo=
ck.avg
    115740           +12.4%     130080        sched_debug.cfs_rq:/.exec_clo=
ck.max
      4252 =C2=B1  4%     -50.4%       2110 =C2=B1 36%  sched_debug.cfs_rq:=
/.exec_clock.stddev
      6243 =C2=B1 12%     -14.0%       5369 =C2=B1 15%  sched_debug.cfs_rq:=
/.load.avg
    887713 =C2=B1 24%     -30.6%     616115 =C2=B1 43%  sched_debug.cfs_rq:=
/.load.max
     53788 =C2=B1 23%     -30.4%      37427 =C2=B1 40%  sched_debug.cfs_rq:=
/.load.stddev
  23472574 =C2=B1 28%     -50.0%   11736977 =C2=B1 60%  sched_debug.cfs_rq:=
/.max_vruntime.max
   1380731 =C2=B1 28%     -46.9%     733243 =C2=B1 66%  sched_debug.cfs_rq:=
/.max_vruntime.stddev
  36862110           +17.8%   43411425        sched_debug.cfs_rq:/.min_vrun=
time.avg
  39448691           +12.5%   44387703        sched_debug.cfs_rq:/.min_vrun=
time.max
   1668979 =C2=B1  3%     -45.0%     917652 =C2=B1 30%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      1.38 =C2=B1  9%      -9.1%       1.25 =C2=B1  6%  sched_debug.cfs_rq:=
/.nr_running.max
      0.56 =C2=B1 19%     +42.2%       0.80        sched_debug.cfs_rq:/.nr_=
running.min
      0.07 =C2=B1 13%     -32.7%       0.05 =C2=B1 15%  sched_debug.cfs_rq:=
/.nr_running.stddev
      2.25 =C2=B1  3%     -51.5%       1.09 =C2=B1  2%  sched_debug.cfs_rq:=
/.nr_spread_over.avg
      6235 =C2=B1 12%     -14.0%       5361 =C2=B1 16%  sched_debug.cfs_rq:=
/.runnable_weight.avg
    887713 =C2=B1 24%     -30.6%     616088 =C2=B1 43%  sched_debug.cfs_rq:=
/.runnable_weight.max
     53791 =C2=B1 23%     -30.4%      37423 =C2=B1 40%  sched_debug.cfs_rq:=
/.runnable_weight.stddev
    513480 =C2=B1 46%     -68.1%     163689 =C2=B1 16%  sched_debug.cfs_rq:=
/.spread0.avg
    992070 =C2=B1 25%     -55.6%     440313 =C2=B1  8%  sched_debug.cfs_rq:=
/.spread0.max
    271.31 =C2=B1 25%     +54.1%     418.15 =C2=B1 23%  sched_debug.cfs_rq:=
/.util_avg.min
     71.69 =C2=B1  6%     -14.9%      61.03 =C2=B1  7%  sched_debug.cfs_rq:=
/.util_avg.stddev
    638.86           +18.5%     756.85 =C2=B1  3%  sched_debug.cfs_rq:/.uti=
l_est_enqueued.avg
    131.07 =C2=B1  2%     -17.0%     108.78 =C2=B1  5%  sched_debug.cfs_rq:=
/.util_est_enqueued.stddev
   1617727 =C2=B1  4%     -24.5%    1222141 =C2=B1 11%  sched_debug.cpu.avg=
_idle.avg
    167800 =C2=B1  2%     +13.3%     190124 =C2=B1  4%  sched_debug.cpu.clo=
ck.avg
    174380           +10.3%     192313 =C2=B1  4%  sched_debug.cpu.clock.max
    161230 =C2=B1  2%     +16.5%     187888 =C2=B1  4%  sched_debug.cpu.clo=
ck.min
      3797 =C2=B1  4%     -66.4%       1276 =C2=B1  8%  sched_debug.cpu.clo=
ck.stddev
    167800 =C2=B1  2%     +13.3%     190124 =C2=B1  4%  sched_debug.cpu.clo=
ck_task.avg
    174380           +10.3%     192313 =C2=B1  4%  sched_debug.cpu.clock_ta=
sk.max
    161230 =C2=B1  2%     +16.5%     187888 =C2=B1  4%  sched_debug.cpu.clo=
ck_task.min
      3797 =C2=B1  4%     -66.4%       1276 =C2=B1  8%  sched_debug.cpu.clo=
ck_task.stddev
      5416 =C2=B1  2%     +15.6%       6262 =C2=B1  5%  sched_debug.cpu.cur=
r->pid.max
      2045 =C2=B1 18%     +20.6%       2466 =C2=B1  3%  sched_debug.cpu.cur=
r->pid.min
    892728 =C2=B1  7%     -37.5%     557989 =C2=B1  5%  sched_debug.cpu.max=
_idle_balance_cost.avg
   4113479 =C2=B1 18%     -51.6%    1989769 =C2=B1 36%  sched_debug.cpu.max=
_idle_balance_cost.max
    461057 =C2=B1 17%     -67.6%     149491 =C2=B1 36%  sched_debug.cpu.max=
_idle_balance_cost.stddev
      0.00 =C2=B1  4%     -65.8%       0.00 =C2=B1 23%  sched_debug.cpu.nex=
t_balance.stddev
    117031           +16.4%     136279        sched_debug.cpu.nr_load_updat=
es.avg
    139472 =C2=B1  3%     +16.0%     161763 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.max
    109218           +22.1%     133390        sched_debug.cpu.nr_load_updat=
es.min
      3910 =C2=B1  3%     -46.0%       2111 =C2=B1 19%  sched_debug.cpu.nr_=
load_updates.stddev
      0.16 =C2=B1  4%     -19.4%       0.13 =C2=B1  3%  sched_debug.cpu.nr_=
running.stddev
      1108           +12.5%       1247 =C2=B1  2%  sched_debug.cpu.nr_switc=
hes.avg
     26767 =C2=B1 16%     +60.1%      42860 =C2=B1 15%  sched_debug.cpu.nr_=
switches.max
      2342 =C2=B1  4%     +34.2%       3144 =C2=B1  7%  sched_debug.cpu.nr_=
switches.stddev
     29066 =C2=B1 11%     +83.5%      53341 =C2=B1 36%  sched_debug.cpu.sch=
ed_count.max
      2473 =C2=B1  2%     +61.3%       3988 =C2=B1 33%  sched_debug.cpu.sch=
ed_count.stddev
    275.25 =C2=B1  3%     +33.5%     367.54        sched_debug.cpu.ttwu_cou=
nt.avg
     10910 =C2=B1 17%     +67.3%      18254 =C2=B1 13%  sched_debug.cpu.ttw=
u_count.max
     50.31 =C2=B1  2%     +19.9%      60.30 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.min
    832.06 =C2=B1 10%     +46.1%       1215 =C2=B1  7%  sched_debug.cpu.ttw=
u_count.stddev
    176.33           +42.8%     251.81 =C2=B1  2%  sched_debug.cpu.ttwu_loc=
al.avg
     10535 =C2=B1 18%     +69.7%      17877 =C2=B1 14%  sched_debug.cpu.ttw=
u_local.max
     31.56           +15.2%      36.35        sched_debug.cpu.ttwu_local.min
    729.04 =C2=B1 13%     +57.2%       1146 =C2=B1  9%  sched_debug.cpu.ttw=
u_local.stddev
    161164 =C2=B1  2%     +16.6%     187864 =C2=B1  4%  sched_debug.cpu_clk
    160513 =C2=B1  2%     +16.6%     187213 =C2=B1  4%  sched_debug.ktime
      1.31 =C2=B1 24%     +39.1%       1.82        sched_debug.rt_rq:/.rt_r=
untime.stddev
    161891 =C2=B1  2%     +16.3%     188213 =C2=B1  4%  sched_debug.sched_c=
lk
    745.75 =C2=B1 61%     -87.9%      90.25 =C2=B1173%  interrupts.36:IR-PC=
I-MSI.2621442-edge.eth1-TxRx-1
    961.75 =C2=B1 48%     -75.5%     235.25 =C2=B1173%  interrupts.37:IR-PC=
I-MSI.2621443-edge.eth1-TxRx-2
      4649 =C2=B1 16%     -25.2%       3475 =C2=B1  3%  interrupts.CPU100.N=
MI:Non-maskable_interrupts
      4649 =C2=B1 16%     -25.2%       3475 =C2=B1  3%  interrupts.CPU100.P=
MI:Performance_monitoring_interrupts
     30.50 =C2=B1 17%    +277.9%     115.25 =C2=B1 49%  interrupts.CPU109.R=
ES:Rescheduling_interrupts
    552027 =C2=B1  5%     +12.2%     619466 =C2=B1  2%  interrupts.CPU110.L=
OC:Local_timer_interrupts
    274.50 =C2=B1 59%     -44.9%     151.25 =C2=B1 92%  interrupts.CPU116.R=
ES:Rescheduling_interrupts
     37.50 =C2=B1 47%    +323.3%     158.75 =C2=B1 43%  interrupts.CPU121.R=
ES:Rescheduling_interrupts
      7275 =C2=B1 12%     -45.9%       3937 =C2=B1 25%  interrupts.CPU125.N=
MI:Non-maskable_interrupts
      7275 =C2=B1 12%     -45.9%       3937 =C2=B1 25%  interrupts.CPU125.P=
MI:Performance_monitoring_interrupts
      5151 =C2=B1 34%     -32.6%       3470 =C2=B1  6%  interrupts.CPU140.N=
MI:Non-maskable_interrupts
      5151 =C2=B1 34%     -32.6%       3470 =C2=B1  6%  interrupts.CPU140.P=
MI:Performance_monitoring_interrupts
      5589 =C2=B1 28%     -26.0%       4134 =C2=B1 32%  interrupts.CPU153.N=
MI:Non-maskable_interrupts
      5589 =C2=B1 28%     -26.0%       4134 =C2=B1 32%  interrupts.CPU153.P=
MI:Performance_monitoring_interrupts
    745.75 =C2=B1 61%     -87.9%      90.25 =C2=B1173%  interrupts.CPU16.36=
:IR-PCI-MSI.2621442-edge.eth1-TxRx-1
    961.75 =C2=B1 48%     -75.5%     235.25 =C2=B1173%  interrupts.CPU17.37=
:IR-PCI-MSI.2621443-edge.eth1-TxRx-2
      6606 =C2=B1 25%     -38.6%       4057 =C2=B1 27%  interrupts.CPU171.N=
MI:Non-maskable_interrupts
      6606 =C2=B1 25%     -38.6%       4057 =C2=B1 27%  interrupts.CPU171.P=
MI:Performance_monitoring_interrupts
      5916 =C2=B1 21%     -28.9%       4205 =C2=B1 28%  interrupts.CPU172.N=
MI:Non-maskable_interrupts
      5916 =C2=B1 21%     -28.9%       4205 =C2=B1 28%  interrupts.CPU172.P=
MI:Performance_monitoring_interrupts
     85.50 =C2=B1 36%     -79.2%      17.75 =C2=B1 72%  interrupts.CPU176.R=
ES:Rescheduling_interrupts
     74.00 =C2=B1 79%     -79.1%      15.50 =C2=B1 27%  interrupts.CPU177.R=
ES:Rescheduling_interrupts
      6513 =C2=B1 21%     -36.4%       4139 =C2=B1 24%  interrupts.CPU180.N=
MI:Non-maskable_interrupts
      6513 =C2=B1 21%     -36.4%       4139 =C2=B1 24%  interrupts.CPU180.P=
MI:Performance_monitoring_interrupts
     17.50 =C2=B1 32%    +371.4%      82.50 =C2=B1101%  interrupts.CPU181.R=
ES:Rescheduling_interrupts
     41.00 =C2=B1101%    +232.9%     136.50 =C2=B1 79%  interrupts.CPU183.R=
ES:Rescheduling_interrupts
      5998 =C2=B1 31%     -29.3%       4238 =C2=B1 18%  interrupts.CPU192.N=
MI:Non-maskable_interrupts
      5998 =C2=B1 31%     -29.3%       4238 =C2=B1 18%  interrupts.CPU192.P=
MI:Performance_monitoring_interrupts
      5812 =C2=B1 21%     -40.6%       3450 =C2=B1  4%  interrupts.CPU198.N=
MI:Non-maskable_interrupts
      5812 =C2=B1 21%     -40.6%       3450 =C2=B1  4%  interrupts.CPU198.P=
MI:Performance_monitoring_interrupts
      5605 =C2=B1 22%     -27.0%       4093 =C2=B1 26%  interrupts.CPU200.N=
MI:Non-maskable_interrupts
      5605 =C2=B1 22%     -27.0%       4093 =C2=B1 26%  interrupts.CPU200.P=
MI:Performance_monitoring_interrupts
      5528 =C2=B1 27%     -38.1%       3423 =C2=B1  2%  interrupts.CPU212.N=
MI:Non-maskable_interrupts
      5528 =C2=B1 27%     -38.1%       3423 =C2=B1  2%  interrupts.CPU212.P=
MI:Performance_monitoring_interrupts
      6447 =C2=B1 27%     -31.2%       4433 =C2=B1 39%  interrupts.CPU216.N=
MI:Non-maskable_interrupts
      6447 =C2=B1 27%     -31.2%       4433 =C2=B1 39%  interrupts.CPU216.P=
MI:Performance_monitoring_interrupts
    561218 =C2=B1  5%     +10.4%     619618 =C2=B1  2%  interrupts.CPU220.L=
OC:Local_timer_interrupts
    201.00 =C2=B1134%     -85.0%      30.25 =C2=B1 53%  interrupts.CPU228.R=
ES:Rescheduling_interrupts
      5757 =C2=B1 22%     -35.4%       3719 =C2=B1  4%  interrupts.CPU229.N=
MI:Non-maskable_interrupts
      5757 =C2=B1 22%     -35.4%       3719 =C2=B1  4%  interrupts.CPU229.P=
MI:Performance_monitoring_interrupts
    165.75 =C2=B1 46%     -70.6%      48.75 =C2=B1103%  interrupts.CPU230.R=
ES:Rescheduling_interrupts
     23.75 =C2=B1 38%    +346.3%     106.00 =C2=B1 87%  interrupts.CPU236.R=
ES:Rescheduling_interrupts
      4576 =C2=B1 15%     -26.0%       3385 =C2=B1  3%  interrupts.CPU248.N=
MI:Non-maskable_interrupts
      4576 =C2=B1 15%     -26.0%       3385 =C2=B1  3%  interrupts.CPU248.P=
MI:Performance_monitoring_interrupts
    606.75 =C2=B1140%     -92.7%      44.00 =C2=B1 69%  interrupts.CPU252.R=
ES:Rescheduling_interrupts
     80.00 =C2=B1 62%     -67.5%      26.00 =C2=B1 30%  interrupts.CPU256.R=
ES:Rescheduling_interrupts
      5696 =C2=B1 30%     -26.9%       4164 =C2=B1 26%  interrupts.CPU259.N=
MI:Non-maskable_interrupts
      5696 =C2=B1 30%     -26.9%       4164 =C2=B1 26%  interrupts.CPU259.P=
MI:Performance_monitoring_interrupts
      1796 =C2=B1 99%     -76.2%     428.00 =C2=B1 45%  interrupts.CPU26.RE=
S:Rescheduling_interrupts
    109.50 =C2=B1 70%     -66.0%      37.25 =C2=B1 55%  interrupts.CPU266.R=
ES:Rescheduling_interrupts
    143.00 =C2=B1 38%     -69.1%      44.25 =C2=B1 90%  interrupts.CPU271.R=
ES:Rescheduling_interrupts
      5526 =C2=B1 29%     -34.5%       3619        interrupts.CPU278.NMI:No=
n-maskable_interrupts
      5526 =C2=B1 29%     -34.5%       3619        interrupts.CPU278.PMI:Pe=
rformance_monitoring_interrupts
     94.75 =C2=B1 42%     -55.1%      42.50 =C2=B1 64%  interrupts.CPU278.R=
ES:Rescheduling_interrupts
      6671 =C2=B1 19%     -31.4%       4579 =C2=B1 31%  interrupts.CPU281.N=
MI:Non-maskable_interrupts
      6671 =C2=B1 19%     -31.4%       4579 =C2=B1 31%  interrupts.CPU281.P=
MI:Performance_monitoring_interrupts
      7140 =C2=B1 25%     -45.1%       3917 =C2=B1  2%  interrupts.CPU37.NM=
I:Non-maskable_interrupts
      7140 =C2=B1 25%     -45.1%       3917 =C2=B1  2%  interrupts.CPU37.PM=
I:Performance_monitoring_interrupts
      6176 =C2=B1 29%     -37.9%       3834 =C2=B1  3%  interrupts.CPU38.NM=
I:Non-maskable_interrupts
      6176 =C2=B1 29%     -37.9%       3834 =C2=B1  3%  interrupts.CPU38.PM=
I:Performance_monitoring_interrupts
    968.50 =C2=B1109%     -75.0%     241.75 =C2=B1 42%  interrupts.CPU38.RE=
S:Rescheduling_interrupts
      6057 =C2=B1 24%     -28.2%       4352 =C2=B1 23%  interrupts.CPU41.NM=
I:Non-maskable_interrupts
      6057 =C2=B1 24%     -28.2%       4352 =C2=B1 23%  interrupts.CPU41.PM=
I:Performance_monitoring_interrupts
    120.00 =C2=B1 99%    +376.2%     571.50 =C2=B1 85%  interrupts.CPU47.RE=
S:Rescheduling_interrupts
    177.75 =C2=B1 31%    +247.4%     617.50 =C2=B1 88%  interrupts.CPU48.RE=
S:Rescheduling_interrupts
    110.00 =C2=B1 83%    +116.6%     238.25 =C2=B1 26%  interrupts.CPU49.RE=
S:Rescheduling_interrupts
      6925 =C2=B1 22%     -45.4%       3781 =C2=B1  3%  interrupts.CPU50.NM=
I:Non-maskable_interrupts
      6925 =C2=B1 22%     -45.4%       3781 =C2=B1  3%  interrupts.CPU50.PM=
I:Performance_monitoring_interrupts
    180.25 =C2=B1 97%    +685.2%       1415 =C2=B1115%  interrupts.CPU51.RE=
S:Rescheduling_interrupts
    182.50 =C2=B1 53%   +1719.2%       3320 =C2=B1 62%  interrupts.CPU52.RE=
S:Rescheduling_interrupts
      5043 =C2=B1 18%     -26.0%       3730 =C2=B1  5%  interrupts.CPU57.NM=
I:Non-maskable_interrupts
      5043 =C2=B1 18%     -26.0%       3730 =C2=B1  5%  interrupts.CPU57.PM=
I:Performance_monitoring_interrupts
      3655 =C2=B1  9%     +33.0%       4863 =C2=B1 21%  interrupts.CPU60.NM=
I:Non-maskable_interrupts
      3655 =C2=B1  9%     +33.0%       4863 =C2=B1 21%  interrupts.CPU60.PM=
I:Performance_monitoring_interrupts
      6130 =C2=B1 24%     -28.1%       4410 =C2=B1 21%  interrupts.CPU64.NM=
I:Non-maskable_interrupts
      6130 =C2=B1 24%     -28.1%       4410 =C2=B1 21%  interrupts.CPU64.PM=
I:Performance_monitoring_interrupts
      5811 =C2=B1 25%     -36.1%       3713        interrupts.CPU76.NMI:Non=
-maskable_interrupts
      5811 =C2=B1 25%     -36.1%       3713        interrupts.CPU76.PMI:Per=
formance_monitoring_interrupts
      6036 =C2=B1 28%     -39.4%       3660 =C2=B1  5%  interrupts.CPU80.NM=
I:Non-maskable_interrupts
      6036 =C2=B1 28%     -39.4%       3660 =C2=B1  5%  interrupts.CPU80.PM=
I:Performance_monitoring_interrupts
      6494 =C2=B1 25%     -43.9%       3640 =C2=B1  5%  interrupts.CPU82.NM=
I:Non-maskable_interrupts
      6494 =C2=B1 25%     -43.9%       3640 =C2=B1  5%  interrupts.CPU82.PM=
I:Performance_monitoring_interrupts
      6881 =C2=B1 13%     -48.8%       3522 =C2=B1  3%  interrupts.CPU84.NM=
I:Non-maskable_interrupts
      6881 =C2=B1 13%     -48.8%       3522 =C2=B1  3%  interrupts.CPU84.PM=
I:Performance_monitoring_interrupts
    110.75 =C2=B1 19%    +119.4%     243.00 =C2=B1 19%  interrupts.CPU9.RES=
:Rescheduling_interrupts


                                                                           =
     =

                            will-it-scale.per_process_ops                  =
     =

                                                                           =
     =

  95000 +-+-----------------------------------O----------------------------=
-+   =

  90000 +-+              O  O   O O               O                        =
 |   =

        |               O O  OO  O               O                         =
 |   =

  85000 +-+         OOO                  O O   O                           =
 |   =

  80000 +-+    OO O                       O  O                             =
 |   =

        |    O                       O O                                   =
 |   =

  75000 +-+O     O                                                         =
 |   =

  70000 OO+ O                      O  O                                    =
 |   =

  65000 +-+                                                                =
 |   =

        |                                                                  =
 |   =

  60000 +-+                                                                =
 |   =

  55000 +-+     +    +     .+  .+ ++.                                      =
 |   =

        | .+++.+ ++.+ :.+ +  ++  +   +++.+++.++  +   .+++.+     +. +       =
 |   =

  50000 +-+           +  +                     :+ +++      + .++  + ++.+++.=
+|   =

  45000 +-+----------------------------------------------------------------=
-+   =

                                                                           =
     =

                                                                           =
     =

[*] bisect-good sample
[O] bisect-bad  sample



Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Rong Chen

--===============8566580164836255588==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCgojISBqb2JzL3dpbGwtaXQtc2NhbGUtMTAwLnlhbWwKc3VpdGU6IHdpbGwtaXQtc2NhbGUK
dGVzdGNhc2U6IHdpbGwtaXQtc2NhbGUKY2F0ZWdvcnk6IGJlbmNobWFyawpucl90YXNrOiAxMDAl
CndpbGwtaXQtc2NhbGU6CiAgbW9kZTogcHJvY2VzcwogIHRlc3Q6IGJyazEKam9iX29yaWdpbjog
Ii9sa3AvbGtwLy5zcmMtMjAxODEyMjktMDkxODAxL2FsbG90L2N5Y2xpYzpwMTpsaW51eC1kZXZl
bDpkZXZlbC1ob3VybHkvbGtwLWtubTAxL3dpbGwtaXQtc2NhbGUtMTAwLnlhbWwiCgojISBxdWV1
ZSBvcHRpb25zCnF1ZXVlOiBiaXNlY3QKdGVzdGJveDogbGtwLWtubTAxCnRib3hfZ3JvdXA6IGxr
cC1rbm0wMQpzdWJtaXRfaWQ6IDVjMmI1MDlmMGI5YTkzNTg0OWQzZDFhNgpqb2JfZmlsZTogIi9s
a3Avam9icy9zY2hlZHVsZWQvbGtwLWtubTAxL3dpbGwtaXQtc2NhbGUtcGVyZm9ybWFuY2UtcHJv
Y2Vzcy0xMDAlLWJyazEtZGViaWFuLXg4Nl82NC0yMDE4LTA0LTAzLmNnei03ZTI4YzVhZjRlZjZi
NTM5MzM0YWE1ZGU0MGZlY2EwYzA0MWM5NGRmLTIwMTkwMTAxLTIyNjAxLTFuY3hiajktMC55YW1s
IgppZDogM2I2NTc4MGZjNWI4OTIwZjJlMjlhZDg2N2NkNDJhNzVlZWU3YmQ3NApxdWV1ZXJfdmVy
c2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxODEyMjktMTY0MDE0IgoKIyEgaG9zdHMvbGtwLWtubTAx
CgojISBpbmNsdWRlL2NhdGVnb3J5L2JlbmNobWFyawprbXNnOiAKYm9vdC10aW1lOiAKaW9zdGF0
OiAKaGVhcnRiZWF0OiAKdm1zdGF0OiAKbnVtYS1udW1hc3RhdDogCm51bWEtdm1zdGF0OiAKbnVt
YS1tZW1pbmZvOiAKcHJvYy12bXN0YXQ6IApwcm9jLXN0YXQ6IAptZW1pbmZvOiAKc2xhYmluZm86
IAppbnRlcnJ1cHRzOiAKbG9ja19zdGF0OiAKbGF0ZW5jeV9zdGF0czogCnNvZnRpcnFzOiAKYmRp
X2Rldl9tYXBwaW5nOiAKZGlza3N0YXRzOiAKbmZzc3RhdDogCmNwdWlkbGU6IApjcHVmcmVxLXN0
YXRzOiAKdHVyYm9zdGF0OiAKc2NoZWRfZGVidWc6IApwZXJmLXN0YXQ6IAptcHN0YXQ6IApwZXJm
LXByb2ZpbGU6IAoKIyEgaW5jbHVkZS9jYXRlZ29yeS9BTEwKY3B1ZnJlcV9nb3Zlcm5vcjogcGVy
Zm9ybWFuY2UKCiMhIGluY2x1ZGUvcXVldWUvY3ljbGljCmNvbW1pdDogN2UyOGM1YWY0ZWY2YjUz
OTMzNGFhNWRlNDBmZWNhMGMwNDFjOTRkZgoKIyEgZGVmYXVsdCBwYXJhbXMKa2NvbmZpZzogeDg2
XzY0LXJoZWwtNy4yCmNvbXBpbGVyOiBnY2MtNwpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAxOC0w
NC0wMy5jZ3oKZW5xdWV1ZV90aW1lOiAyMDE5LTAxLTAxIDE5OjM1OjU5Ljk2MTQ0MTAxMyArMDg6
MDAKX2lkOiA1YzJiNTA5ZjBiOWE5MzU4NDlkM2QxYTYKX3J0OiAiL3Jlc3VsdC93aWxsLWl0LXNj
YWxlL3BlcmZvcm1hbmNlLXByb2Nlc3MtMTAwJS1icmsxL2xrcC1rbm0wMS9kZWJpYW4teDg2XzY0
LTIwMTgtMDQtMDMuY2d6L3g4Nl82NC1yaGVsLTcuMi9nY2MtNy83ZTI4YzVhZjRlZjZiNTM5MzM0
YWE1ZGU0MGZlY2EwYzA0MWM5NGRmIgoKIyEgc2NoZWR1bGUgb3B0aW9ucwp1c2VyOiBsa3AKaGVh
ZF9jb21taXQ6IGFiNDc1NmZmOGVlOTE0NGNiNzA0NWVmZjkwNDNlZDJjNjUyMmUzYjEKYmFzZV9j
b21taXQ6IDhmZTI4Y2I1OGJjYjIzNTAzNGI2NGNiYmI3NTUwYThhNDNmZDg4YmUKYnJhbmNoOiBs
aW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxODEyMzExMgpyZXN1bHRfcm9vdDogIi9yZXN1bHQv
d2lsbC1pdC1zY2FsZS9wZXJmb3JtYW5jZS1wcm9jZXNzLTEwMCUtYnJrMS9sa3Ata25tMDEvZGVi
aWFuLXg4Nl82NC0yMDE4LTA0LTAzLmNnei94ODZfNjQtcmhlbC03LjIvZ2NjLTcvN2UyOGM1YWY0
ZWY2YjUzOTMzNGFhNWRlNDBmZWNhMGMwNDFjOTRkZi8wIgpzY2hlZHVsZXJfdmVyc2lvbjogIi9s
a3AvbGtwLy5zcmMtMjAxODEyMjktMTY0MDE0IgpMS1BfU0VSVkVSOiBpbm4KbWF4X3VwdGltZTog
MTUwMAppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE4LTA0LTAzLmNn
eiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpvYj0v
bGtwL2pvYnMvc2NoZWR1bGVkL2xrcC1rbm0wMS93aWxsLWl0LXNjYWxlLXBlcmZvcm1hbmNlLXBy
b2Nlc3MtMTAwJS1icmsxLWRlYmlhbi14ODZfNjQtMjAxOC0wNC0wMy5jZ3otN2UyOGM1YWY0ZWY2
YjUzOTMzNGFhNWRlNDBmZWNhMGMwNDFjOTRkZi0yMDE5MDEwMS0yMjYwMS0xbmN4Ymo5LTAueWFt
bAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhlbC03LjIKLSBicmFuY2g9bGludXgt
ZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTgxMjMxMTIKLSBjb21taXQ9N2UyOGM1YWY0ZWY2YjUzOTMz
NGFhNWRlNDBmZWNhMGMwNDFjOTRkZgotIEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQtcmhl
bC03LjIvZ2NjLTcvN2UyOGM1YWY0ZWY2YjUzOTMzNGFhNWRlNDBmZWNhMGMwNDFjOTRkZi92bWxp
bnV6LTQuMTkuMC1yYzEtMDAxMDAtZzdlMjhjNWEKLSBtYXhfdXB0aW1lPTE1MDAKLSBSRVNVTFRf
Uk9PVD0vcmVzdWx0L3dpbGwtaXQtc2NhbGUvcGVyZm9ybWFuY2UtcHJvY2Vzcy0xMDAlLWJyazEv
bGtwLWtubTAxL2RlYmlhbi14ODZfNjQtMjAxOC0wNC0wMy5jZ3oveDg2XzY0LXJoZWwtNy4yL2dj
Yy03LzdlMjhjNWFmNGVmNmI1MzkzMzRhYTVkZTQwZmVjYTBjMDQxYzk0ZGYvMAotIExLUF9TRVJW
RVI9aW5uCi0gZGVidWcKLSBhcGljPWRlYnVnCi0gc3lzcnFfYWx3YXlzX2VuYWJsZWQKLSByY3Vw
ZGF0ZS5yY3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCi0gbmV0LmlmbmFtZXM9MAotIHByaW50ay5k
ZXZrbXNnPW9uCi0gcGFuaWM9LTEKLSBzb2Z0bG9ja3VwX3BhbmljPTEKLSBubWlfd2F0Y2hkb2c9
cGFuaWMKLSBvb3BzPXBhbmljCi0gbG9hZF9yYW1kaXNrPTIKLSBwcm9tcHRfcmFtZGlzaz0wCi0g
ZHJiZC5taW5vcl9jb3VudD04Ci0gc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCi0gaWdub3JlX2xvZ2xl
dmVsCi0gY29uc29sZT10dHkwCi0gZWFybHlwcmludGs9dHR5UzAsMTE1MjAwCi0gY29uc29sZT10
dHlTMCwxMTUyMDAKLSB2Z2E9bm9ybWFsCi0gcncKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4
L3g4Nl82NC1yaGVsLTcuMi9nY2MtNy83ZTI4YzVhZjRlZjZiNTM5MzM0YWE1ZGU0MGZlY2EwYzA0
MWM5NGRmL21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZf
NjQtMjAxOC0wNC0wMy5jZ3ovcnVuLWlwY29uZmlnXzIwMTgtMDQtMDMuY2d6LC9vc2ltYWdlL2Rl
cHMvZGViaWFuLXg4Nl82NC0yMDE4LTA0LTAzLmNnei9sa3BfMjAxOC0wNC0wMy5jZ3osL29zaW1h
Z2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTgtMDQtMDMuY2d6L3JzeW5jLXJvb3Rmc18yMDE4LTA0
LTAzLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxOC0wNC0wMy5jZ3ovd2lsbC1p
dC1zY2FsZV8yMDE4LTA1LTE3LmNneiwvb3NpbWFnZS9wa2cvZGViaWFuLXg4Nl82NC0yMDE4LTA0
LTAzLmNnei93aWxsLWl0LXNjYWxlLXg4Nl82NC1kZWNhZDg1XzIwMTgtMDYtMDcuY2d6LC9vc2lt
YWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE4LTA0LTAzLmNnei9tcHN0YXRfMjAxOC0wNi0xOS5j
Z3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTgtMDQtMDMuY2d6L3R1cmJvc3RhdF8y
MDE4LTA1LTE3LmNneiwvb3NpbWFnZS9wa2cvZGViaWFuLXg4Nl82NC0yMDE4LTA0LTAzLmNnei90
dXJib3N0YXQteDg2XzY0LWQ1MjU2YjJfMjAxOC0wNS0xOC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJp
YW4teDg2XzY0LTIwMTgtMDQtMDMuY2d6L3BlcmZfMjAxOS0wMS0wMS5jZ3osL29zaW1hZ2UvcGtn
L2RlYmlhbi14ODZfNjQtMjAxOC0wNC0wMy5jZ3ovcGVyZi14ODZfNjQtZTFlZjAzNWQyNzJlXzIw
MTktMDEtMDEuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE4LTA0LTAzLmNnei9o
d18yMDE2LTExLTE1LmNneiIKbGtwX2luaXRyZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igpz
aXRlOiBpbm4KCiMhIC9sa3AvbGtwLy5zcmMtMjAxODEyMjktMTY0MDE0L2luY2x1ZGUvc2l0ZS9p
bm4KTEtQX0NHSV9QT1JUOiA4MApMS1BfQ0lGU19QT1JUOiAxMzkKb29tLWtpbGxlcjogCndhdGNo
ZG9nOiAKCiMhIHJ1bnRpbWUgc3RhdHVzCnJlcGVhdF90bzogMgptb2RlbDogS25pZ2h0cyBNaWxs
Cm5yX25vZGU6IDEKbnJfY3B1OiAyODgKbWVtb3J5OiA4MEcKaGRkX3BhcnRpdGlvbnM6IApzd2Fw
X3BhcnRpdGlvbnM6IExBQkVMPVNXQVAKcm9vdGZzX3BhcnRpdGlvbjogTEFCRUw9TEtQLVJPT1RG
UwoKIyEgdXNlciBvdmVycmlkZXMKa2VybmVsOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC03LjIv
Z2NjLTcvN2UyOGM1YWY0ZWY2YjUzOTMzNGFhNWRlNDBmZWNhMGMwNDFjOTRkZi92bWxpbnV6LTQu
MTkuMC1yYzEtMDAxMDAtZzdlMjhjNWEiCmRlcXVldWVfdGltZTogMjAxOS0wMS0wMSAyMDoxNjo0
MC42MDQ1ODM1NTEgKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogNjAuMTIgMTM0
LjMxIDcyLjU5IDEvMTg0NSAxMTE5NwpzdGFydF90aW1lOiAnMTU0NjM0NTEyNCcKZW5kX3RpbWU6
ICcxNTQ2MzQ1NDQ3Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE4MTIyOS0xNjQwMTQiCg==

--===============8566580164836255588==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

CmZvciBjcHVfZGlyIGluIC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdVswLTldKgpkbwoJb25s
aW5lX2ZpbGU9IiRjcHVfZGlyIi9vbmxpbmUKCVsgLWYgIiRvbmxpbmVfZmlsZSIgXSAmJiBbICIk
KGNhdCAiJG9ubGluZV9maWxlIikiIC1lcSAwIF0gJiYgY29udGludWUKCglmaWxlPSIkY3B1X2Rp
ciIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCglbIC1mICIkZmlsZSIgXSAmJiBlY2hvICJwZXJm
b3JtYW5jZSIgPiAiJGZpbGUiCmRvbmUKCiAicHl0aG9uMiIgIi4vcnVudGVzdC5weSIgImJyazEi
ICIyOTUiICJwcm9jZXNzIiAiMjg4Igo=

--===============8566580164836255588==--

