Content-Type: multipart/mixed; boundary="===============2085401195342501366=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [sched/fair] 53d3bc773e: hackbench.throughput -32.9% regression
Date: Tue, 31 May 2016 16:20:54 +0800
Message-ID: <87inxud4ex.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2085401195342501366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed hackbench.throughput -32.9% regression due to commit:

commit 53d3bc773eaa7ab1cf63585e76af7ee869d5e709 ("Revert "sched/fair: Fix f=
airness issue on migration"")
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

in testcase: hackbench
on test machine: ivb42: 48 threads Ivytown Ivy Bridge-EP with 64G memory
with following parameters: cpufreq_governor=3Dperformance/ipc=3Dsocket/mode=
=3Dthreads/nr_threads=3D50%

In addition to that, the commit also has significant impact on the followin=
g tests:

unixbench:	unixbench.score 25.9% improvement	on test machine - ivb42: 48 th=
reads Ivytown Ivy Bridge-EP with 64G memory
with test parameters: cpufreq_governor=3Dperformance/nr_task=3D100%/test=3D=
context1

hackbench:	hackbench.throughput -15.6% regression	on test machine - lkp-hsw=
-ep4: 72 threads Haswell-EP with 128G memory
with test parameters: cpufreq_governor=3Dperformance/ipc=3Dpipe/iterations=
=3D12/mode=3Dprocess/nr_threads=3D50%


Details are as below:
---------------------------------------------------------------------------=
----------------------->


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/ipc/kconfig/mode/nr_threads/rootfs/tbox_group/tes=
tcase:
  gcc-4.9/performance/socket/x86_64-rhel/threads/50%/debian-x86_64-2015-02-=
07.cgz/ivb42/hackbench

commit: =

  c5114626f33b62fa7595e57d87f33d9d1f8298a2
  53d3bc773eaa7ab1cf63585e76af7ee869d5e709

c5114626f33b62fa 53d3bc773eaa7ab1cf63585e76 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    196590 =C2=B1  0%     -32.9%     131963 =C2=B1  2%  hackbench.throughput
    602.66 =C2=B1  0%      +2.8%     619.27 =C2=B1  2%  hackbench.time.elap=
sed_time
    602.66 =C2=B1  0%      +2.8%     619.27 =C2=B1  2%  hackbench.time.elap=
sed_time.max
  1.76e+08 =C2=B1  3%    +236.0%  5.914e+08 =C2=B1  2%  hackbench.time.invo=
luntary_context_switches
    208664 =C2=B1  2%     +26.0%     262929 =C2=B1  3%  hackbench.time.mino=
r_page_faults
      4401 =C2=B1  0%      +5.7%       4650 =C2=B1  0%  hackbench.time.perc=
ent_of_cpu_this_job_got
     25256 =C2=B1  0%     +10.2%      27842 =C2=B1  2%  hackbench.time.syst=
em_time
      1272 =C2=B1  0%     -24.5%     961.37 =C2=B1  2%  hackbench.time.user=
_time
  7.64e+08 =C2=B1  1%    +131.8%  1.771e+09 =C2=B1  2%  hackbench.time.volu=
ntary_context_switches
    143370 =C2=B1  0%     -12.0%     126124 =C2=B1  1%  meminfo.SUnreclaim
   2462880 =C2=B1  0%     -35.6%    1585869 =C2=B1  5%  softirqs.SCHED
      4051 =C2=B1  0%     -39.9%       2434 =C2=B1  3%  uptime.idle
   1766752 =C2=B1  1%    +122.6%    3932589 =C2=B1  1%  vmstat.system.cs
    249718 =C2=B1  2%    +307.4%    1017398 =C2=B1  3%  vmstat.system.in
  1.76e+08 =C2=B1  3%    +236.0%  5.914e+08 =C2=B1  2%  time.involuntary_co=
ntext_switches
    208664 =C2=B1  2%     +26.0%     262929 =C2=B1  3%  time.minor_page_fau=
lts
      1272 =C2=B1  0%     -24.5%     961.37 =C2=B1  2%  time.user_time
  7.64e+08 =C2=B1  1%    +131.8%  1.771e+09 =C2=B1  2%  time.voluntary_cont=
ext_switches
      2228 =C2=B1 92%    +137.1%       5285 =C2=B1 15%  numa-meminfo.node0.=
AnonHugePages
     73589 =C2=B1  4%     -12.5%      64393 =C2=B1  2%  numa-meminfo.node0.=
SUnreclaim
     27438 =C2=B1 83%    +102.6%      55585 =C2=B1  6%  numa-meminfo.node0.=
Shmem
    101051 =C2=B1  3%     -10.9%      90044 =C2=B1  2%  numa-meminfo.node0.=
Slab
     69844 =C2=B1  4%     -11.8%      61579 =C2=B1  3%  numa-meminfo.node1.=
SUnreclaim
   1136461 =C2=B1  3%     +16.6%    1324662 =C2=B1  5%  numa-numastat.node0=
.local_node
   1140216 =C2=B1  3%     +16.2%    1324689 =C2=B1  5%  numa-numastat.node0=
.numa_hit
      3755 =C2=B1 68%     -99.3%      27.25 =C2=B1 94%  numa-numastat.node0=
.other_node
   1098889 =C2=B1  4%     +20.1%    1320211 =C2=B1  6%  numa-numastat.node1=
.local_node
   1101996 =C2=B1  4%     +20.5%    1327590 =C2=B1  6%  numa-numastat.node1=
.numa_hit
      7.18 =C2=B1  0%     -50.2%       3.57 =C2=B1 43%  perf-profile.cycles=
-pp.call_cpuidle
      8.09 =C2=B1  0%     -44.7%       4.47 =C2=B1 38%  perf-profile.cycles=
-pp.cpu_startup_entry
      7.17 =C2=B1  0%     -50.3%       3.56 =C2=B1 43%  perf-profile.cycles=
-pp.cpuidle_enter
      7.14 =C2=B1  0%     -50.3%       3.55 =C2=B1 43%  perf-profile.cycles=
-pp.cpuidle_enter_state
      7.11 =C2=B1  0%     -50.6%       3.52 =C2=B1 43%  perf-profile.cycles=
-pp.intel_idle
      8.00 =C2=B1  0%     -44.5%       4.44 =C2=B1 38%  perf-profile.cycles=
-pp.start_secondary
     92.32 =C2=B1  0%      +5.4%      97.32 =C2=B1  0%  turbostat.%Busy
      2763 =C2=B1  0%      +5.4%       2912 =C2=B1  0%  turbostat.Avg_MHz
      7.48 =C2=B1  0%     -66.5%       2.50 =C2=B1  7%  turbostat.CPU%c1
      0.20 =C2=B1  2%      -6.4%       0.18 =C2=B1  2%  turbostat.CPU%c6
    180.03 =C2=B1  0%      -1.3%     177.62 =C2=B1  0%  turbostat.CorWatt
      5.83 =C2=B1  0%     +38.9%       8.10 =C2=B1  3%  turbostat.RAMWatt
      6857 =C2=B1 83%    +102.8%      13905 =C2=B1  6%  numa-vmstat.node0.n=
r_shmem
     18395 =C2=B1  4%     -12.4%      16121 =C2=B1  2%  numa-vmstat.node0.n=
r_slab_unreclaimable
    675569 =C2=B1  3%     +12.7%     761135 =C2=B1  4%  numa-vmstat.node0.n=
uma_local
     71537 =C2=B1  5%      -7.9%      65920 =C2=B1  2%  numa-vmstat.node0.n=
uma_other
     17456 =C2=B1  4%     -11.7%      15405 =C2=B1  3%  numa-vmstat.node1.n=
r_slab_unreclaimable
    695848 =C2=B1  3%     +14.9%     799683 =C2=B1  5%  numa-vmstat.node1.n=
uma_hit
    677405 =C2=B1  4%     +14.5%     775903 =C2=B1  6%  numa-vmstat.node1.n=
uma_local
     18442 =C2=B1 19%     +28.9%      23779 =C2=B1  5%  numa-vmstat.node1.n=
uma_other
 1.658e+09 =C2=B1  0%     -59.1%  6.784e+08 =C2=B1  7%  cpuidle.C1-IVT.time
 1.066e+08 =C2=B1  0%     -40.3%   63661563 =C2=B1  6%  cpuidle.C1-IVT.usage
  26348635 =C2=B1  0%     -86.8%    3471048 =C2=B1 15%  cpuidle.C1E-IVT.time
    291620 =C2=B1  0%     -85.1%      43352 =C2=B1 15%  cpuidle.C1E-IVT.usa=
ge
  54158643 =C2=B1  1%     -88.5%    6254009 =C2=B1 14%  cpuidle.C3-IVT.time
    482437 =C2=B1  1%     -87.0%      62620 =C2=B1 16%  cpuidle.C3-IVT.usage
 5.028e+08 =C2=B1  0%     -75.8%  1.219e+08 =C2=B1  8%  cpuidle.C6-IVT.time
   3805026 =C2=B1  0%     -85.5%     552326 =C2=B1 16%  cpuidle.C6-IVT.usage
      2766 =C2=B1  4%     -51.4%       1344 =C2=B1  6%  cpuidle.POLL.usage
     35841 =C2=B1  0%     -12.0%      31543 =C2=B1  0%  proc-vmstat.nr_slab=
_unreclaimable
    154090 =C2=B1  2%     +43.1%     220509 =C2=B1  3%  proc-vmstat.numa_hi=
nt_faults
    129240 =C2=B1  2%     +47.4%     190543 =C2=B1  3%  proc-vmstat.numa_hi=
nt_faults_local
   2238386 =C2=B1  1%     +18.4%    2649737 =C2=B1  2%  proc-vmstat.numa_hit
   2232163 =C2=B1  1%     +18.4%    2643105 =C2=B1  2%  proc-vmstat.numa_lo=
cal
     22315 =C2=B1  1%     -21.0%      17625 =C2=B1  5%  proc-vmstat.numa_pa=
ges_migrated
    154533 =C2=B1  2%     +45.6%     225071 =C2=B1  3%  proc-vmstat.numa_pt=
e_updates
    382980 =C2=B1  2%     +33.2%     510157 =C2=B1  4%  proc-vmstat.pgalloc=
_dma32
   7311738 =C2=B1  2%     +37.2%   10029060 =C2=B1  2%  proc-vmstat.pgalloc=
_normal
   7672040 =C2=B1  2%     +37.1%   10519738 =C2=B1  2%  proc-vmstat.pgfree
     22315 =C2=B1  1%     -21.0%      17625 =C2=B1  5%  proc-vmstat.pgmigra=
te_success
      5487 =C2=B1  6%     -12.6%       4797 =C2=B1  4%  slabinfo.UNIX.activ=
e_objs
      5609 =C2=B1  5%     -12.2%       4926 =C2=B1  4%  slabinfo.UNIX.num_o=
bjs
      4362 =C2=B1  4%     +14.6%       4998 =C2=B1  2%  slabinfo.cred_jar.a=
ctive_objs
      4362 =C2=B1  4%     +14.6%       4998 =C2=B1  2%  slabinfo.cred_jar.n=
um_objs
     42525 =C2=B1  0%     -41.6%      24824 =C2=B1  3%  slabinfo.kmalloc-25=
6.active_objs
    845.50 =C2=B1  0%     -42.9%     482.50 =C2=B1  3%  slabinfo.kmalloc-25=
6.active_slabs
     54124 =C2=B1  0%     -42.9%      30920 =C2=B1  3%  slabinfo.kmalloc-25=
6.num_objs
    845.50 =C2=B1  0%     -42.9%     482.50 =C2=B1  3%  slabinfo.kmalloc-25=
6.num_slabs
     47204 =C2=B1  0%     -37.9%      29335 =C2=B1  2%  slabinfo.kmalloc-51=
2.active_objs
    915.25 =C2=B1  0%     -39.8%     551.00 =C2=B1  3%  slabinfo.kmalloc-51=
2.active_slabs
     58599 =C2=B1  0%     -39.8%      35300 =C2=B1  3%  slabinfo.kmalloc-51=
2.num_objs
    915.25 =C2=B1  0%     -39.8%     551.00 =C2=B1  3%  slabinfo.kmalloc-51=
2.num_slabs
     12443 =C2=B1  2%     -20.1%       9944 =C2=B1  3%  slabinfo.pid.active=
_objs
     12443 =C2=B1  2%     -20.1%       9944 =C2=B1  3%  slabinfo.pid.num_ob=
js
    440.00 =C2=B1  5%     -32.8%     295.75 =C2=B1  4%  slabinfo.taskstats.=
active_objs
    440.00 =C2=B1  5%     -32.8%     295.75 =C2=B1  4%  slabinfo.taskstats.=
num_objs
    312.45 =C2=B1157%     -94.8%      16.29 =C2=B1 33%  sched_debug.cfs_rq:=
/.load.stddev
      0.27 =C2=B1  5%     -56.3%       0.12 =C2=B1 30%  sched_debug.cfs_rq:=
/.nr_running.stddev
     16.51 =C2=B1  1%      +9.5%      18.08 =C2=B1  3%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
      0.05 =C2=B1100%   +7950.0%       3.66 =C2=B1 48%  sched_debug.cfs_rq:=
/.runnable_load_avg.min
   -740916 =C2=B1-28%    -158.5%     433310 =C2=B1120%  sched_debug.cfs_rq:=
/.spread0.avg
   1009940 =C2=B1 19%     +75.8%    1775442 =C2=B1 30%  sched_debug.cfs_rq:=
/.spread0.max
  -2384171 =C2=B1 -7%     -65.7%    -818684 =C2=B1-76%  sched_debug.cfs_rq:=
/.spread0.min
    749.14 =C2=B1  1%     +13.0%     846.34 =C2=B1  1%  sched_debug.cfs_rq:=
/.util_avg.min
     51.66 =C2=B1  4%     -36.3%      32.92 =C2=B1  5%  sched_debug.cfs_rq:=
/.util_avg.stddev
    161202 =C2=B1  7%     -41.7%      93997 =C2=B1  4%  sched_debug.cpu.avg=
_idle.avg
    595158 =C2=B1  6%     -51.2%     290491 =C2=B1 22%  sched_debug.cpu.avg=
_idle.max
    132760 =C2=B1  8%     -58.8%      54718 =C2=B1 19%  sched_debug.cpu.avg=
_idle.stddev
     11.40 =C2=B1 11%    +111.0%      24.05 =C2=B1 16%  sched_debug.cpu.clo=
ck.stddev
     11.40 =C2=B1 11%    +111.0%      24.05 =C2=B1 16%  sched_debug.cpu.clo=
ck_task.stddev
     32.34 =C2=B1  2%     +23.9%      40.07 =C2=B1 19%  sched_debug.cpu.cpu=
_load[0].max
      0.34 =C2=B1103%    +520.0%       2.11 =C2=B1 67%  sched_debug.cpu.cpu=
_load[0].min
     32.18 =C2=B1  2%     +22.7%      39.50 =C2=B1 17%  sched_debug.cpu.cpu=
_load[1].max
      3.32 =C2=B1  8%     +84.9%       6.14 =C2=B1 12%  sched_debug.cpu.cpu=
_load[1].min
      5.39 =C2=B1  7%     +36.3%       7.34 =C2=B1  4%  sched_debug.cpu.cpu=
_load[2].min
     33.18 =C2=B1  3%     +14.0%      37.82 =C2=B1  5%  sched_debug.cpu.cpu=
_load[4].max
      5.56 =C2=B1  6%     +16.2%       6.45 =C2=B1  6%  sched_debug.cpu.cpu=
_load[4].stddev
     16741 =C2=B1  0%     -15.4%      14166 =C2=B1  2%  sched_debug.cpu.cur=
r->pid.avg
     19196 =C2=B1  0%     -18.3%      15690 =C2=B1  1%  sched_debug.cpu.cur=
r->pid.max
      5174 =C2=B1  5%     -55.4%       2305 =C2=B1 14%  sched_debug.cpu.cur=
r->pid.stddev
      1410 =C2=B1  1%     -14.2%       1210 =C2=B1  6%  sched_debug.cpu.nr_=
load_updates.stddev
      9.95 =C2=B1  3%     -14.5%       8.51 =C2=B1  5%  sched_debug.cpu.nr_=
running.avg
     29.07 =C2=B1  2%     -15.0%      24.70 =C2=B1  4%  sched_debug.cpu.nr_=
running.max
      0.05 =C2=B1100%    +850.0%       0.43 =C2=B1 37%  sched_debug.cpu.nr_=
running.min
      7.64 =C2=B1  3%     -23.0%       5.88 =C2=B1  2%  sched_debug.cpu.nr_=
running.stddev
  10979930 =C2=B1  1%    +123.3%   24518490 =C2=B1  2%  sched_debug.cpu.nr_=
switches.avg
  12350130 =C2=B1  1%    +117.5%   26856375 =C2=B1  2%  sched_debug.cpu.nr_=
switches.max
   9594835 =C2=B1  2%    +132.6%   22314436 =C2=B1  2%  sched_debug.cpu.nr_=
switches.min
    769296 =C2=B1  1%     +56.8%    1206190 =C2=B1  3%  sched_debug.cpu.nr_=
switches.stddev
      8.30 =C2=B1 18%     +32.9%      11.02 =C2=B1 15%  sched_debug.cpu.nr_=
uninterruptible.max



                                 turbostat.Avg_MHz

  3000 O+---O-O-O--O-O-O-O--O-O-O--O-O-O--O-O-O-O--O-----------------------=
-+
       *.O..*.*.*    *.*.*..*.*.*..*.*.*..*.*.*.*..*.*.*..*.*.*..*.*.*.*..*=
.*
  2500 ++       :    :                                                     =
 |
       |        :    :                                                     =
 |
       |         :   :                                                     =
 |
  2000 ++        :  :                                                      =
 |
       |         :  :                                                      =
 |
  1500 ++        :  :                                                      =
 |
       |          : :                                                      =
 |
  1000 ++         : :                                                      =
 |
       |          : :                                                      =
 |
       |          ::                                                       =
 |
   500 ++          :                                                       =
 |
       |           :                                                       =
 |
     0 ++----------*-------------------------------------------------------=
-+


                                  turbostat._Busy

  100 O+O--O-O-O--O-O-O--O-O-O--O-O-O--O-O-O--O-O-O------------------------=
-+
   90 *+*..*.*.*    *.*..*.*.*..*.*.*..*.*.*..*.*.*..*.*.*..*.*.*..*.*.*..*=
.*
      |        :    :                                                      =
 |
   80 ++       :    :                                                      =
 |
   70 ++        :   :                                                      =
 |
      |         :  :                                                       =
 |
   60 ++        :  :                                                       =
 |
   50 ++        :  :                                                       =
 |
   40 ++         : :                                                       =
 |
      |          : :                                                       =
 |
   30 ++         : :                                                       =
 |
   20 ++         ::                                                        =
 |
      |           :                                                        =
 |
   10 ++          :                                                        =
 |
    0 ++----------*--------------------------------------------------------=
-+


                                turbostat.CPU_c1

  8 ++---------------*-----------------------------------------------------=
-+
    *.*..*.*..*   *.   *..*.*.*..*.*..*.*.*..*.*..*.*.*..*.*..*.*.*..*.*..*=
.*
  7 ++        :   :                                                        =
 |
  6 ++        :   :                                                        =
 |
    |         :   :                                                        =
 |
  5 ++         : :                                                         =
 |
    |          : :                                                         =
 |
  4 ++         : :                                                         =
 |
    | O        : :                                                         =
 |
  3 O+   O    O: :                 O         O                             =
 |
  2 ++     O   :O:O    O  O O O  O    O O O    O  O                        =
 |
    |           :    O                                                     =
 |
  1 ++          :                                                          =
 |
    |           :                                                          =
 |
  0 ++----------*----------------------------------------------------------=
-+


                                 turbostat.PkgWatt

  250 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
      O.O..O.O.O  O O.O..O.O.O..O.O.O..O.O.O..O.O.O..*.*.*..*.*.*..*.*.*..*=
.*
  200 ++       :    :                                                      =
 |
      |         :   :                                                      =
 |
      |         :   :                                                      =
 |
  150 ++        :  :                                                       =
 |
      |         :  :                                                       =
 |
  100 ++         : :                                                       =
 |
      |          : :                                                       =
 |
      |          : :                                                       =
 |
   50 ++         : :                                                       =
 |
      |           :                                                        =
 |
      |           :                                                        =
 |
    0 ++----------*--------------------------------------------------------=
-+


                                 turbostat.CorWatt

  200 ++-------------------------------------------------------------------=
-+
  180 *+*..*.*.*    *.*..*.*.*..*.*.*..*.*.*..*.*.*..*.*.*..*.*.*..*.*.*..*=
.*
      O O  O O O  O O O  O O O  O O O  O O O  O O O                        =
 |
  160 ++       :    :                                                      =
 |
  140 ++        :   :                                                      =
 |
      |         :  :                                                       =
 |
  120 ++        :  :                                                       =
 |
  100 ++        :  :                                                       =
 |
   80 ++         : :                                                       =
 |
      |          : :                                                       =
 |
   60 ++         : :                                                       =
 |
   40 ++         ::                                                        =
 |
      |           :                                                        =
 |
   20 ++          :                                                        =
 |
    0 ++----------*--------------------------------------------------------=
-+


                                turbostat.RAMWatt

  9 ++---------------O-----------------------------------------------------=
-+
    |      O    O O    O  O O O       O O      O  O                        =
 |
  8 ++O  O    O                  O O      O  O                             =
 |
  7 O+                                                                     =
 |
    |                                                                      =
 |
  6 *+*..*.*..*   *..*.*..*.*.*..*.*..*.*.*..*.*..*.*.*..*.*..*.*.*..*.*..*=
.*
  5 ++        :   :                                                        =
 |
    |         :   :                                                        =
 |
  4 ++         : :                                                         =
 |
  3 ++         : :                                                         =
 |
    |          : :                                                         =
 |
  2 ++         : :                                                         =
 |
  1 ++          :                                                          =
 |
    |           :                                                          =
 |
  0 ++----------*----------------------------------------------------------=
-+


                                hackbench.throughput

  200000 *+*-*--*-*---*--*-*-*-*--*-*-*-*--*-*-*-*-*--*-*-*-*--*-*-*-*--*-*=
-*
  180000 ++       :   :                                                    =
 |
         |        :   :                                                    =
 |
  160000 ++       :   :                                                    =
 |
  140000 O+O       : :                O        O                           =
 |
         |   O  O O:O:O  O O O O  O O   O  O O   O O                       =
 |
  120000 ++        : :                                                     =
 |
  100000 ++        : :                                                     =
 |
   80000 ++        : :                                                     =
 |
         |         : :                                                     =
 |
   60000 ++        : :                                                     =
 |
   40000 ++         :                                                      =
 |
         |          :                                                      =
 |
   20000 ++         :                                                      =
 |
       0 ++---------*------------------------------------------------------=
-+


                                  time.user_time

  1400 ++------------*-----------------------------------------------------=
-+
       *.*..*.*.*    : *.*..*.*.*..*.*.*..*.*.*.*..*.*.*..*.*.*..*.*.*.*..*=
.*
  1200 ++       :    :                                                     =
 |
       |        :    :                                                     =
 |
  1000 O+O      O: O:O O O  O O O    O    O   O    O                       =
 |
       |    O O  :  :              O   O    O   O                          =
 |
   800 ++        :  :                                                      =
 |
       |         :  :                                                      =
 |
   600 ++         : :                                                      =
 |
       |          : :                                                      =
 |
   400 ++         : :                                                      =
 |
       |          ::                                                       =
 |
   200 ++          :                                                       =
 |
       |           :                                                       =
 |
     0 ++----------*-------------------------------------------------------=
-+


                               time.minor_page_faults

  300000 ++----------------------------------------------------------------=
-+
         |        O      O O   O  O     O  O     O O                       =
 |
  250000 O+O O  O   O O      O      O O      O O                           =
 |
         |                                                                 =
 |
         *.*.*..*.*   *..*.*.*.*..*.*.*.*..*.*.*.*.*..*. .*.*..*.*. .*..*.*=
.*
  200000 ++       :   :                                 *          *       =
 |
         |        :   :                                                    =
 |
  150000 ++        : :                                                     =
 |
         |         : :                                                     =
 |
  100000 ++        : :                                                     =
 |
         |         : :                                                     =
 |
         |         : :                                                     =
 |
   50000 ++         :                                                      =
 |
         |          :                                                      =
 |
       0 ++---------*------------------------------------------------------=
-+


                            time.voluntary_context_switches

    2e+09 ++---------------------------------------------------------------=
-+
  1.8e+09 ++     O       O      O O        O        O                      =
 |
          |   O    O O O    O O     O  O O   O O  O                        =
 |
  1.6e+09 O+O                                                              =
 |
  1.4e+09 ++                                                               =
 |
          |                                                                =
 |
  1.2e+09 ++                                                               =
 |
    1e+09 ++                                                               =
 |
    8e+08 ++                                                               =
.*
          *.*.*..*.*   *.*..*.*.*.*.*..*.*.*.*.*..*.*.*.*.*..*.*.*.*.*..*.*=
 |
    6e+08 ++       :   :                                                   =
 |
    4e+08 ++        : :                                                    =
 |
          |         : :                                                    =
 |
    2e+08 ++         :                                                     =
 |
        0 ++---------*-----------------------------------------------------=
-+


                          time.involuntary_context_switches

  7e+08 ++-----------------------------------------------------------------=
-+
        |               O      O O                                         =
 |
  6e+08 ++     O O O  O   O        O    O O O    O O                       =
 |
        O O  O              O        O         O                           =
 |
  5e+08 ++                                                                 =
 |
        |                                                                  =
 |
  4e+08 ++                                                                 =
 |
        |                                                                  =
 |
  3e+08 ++                                                                 =
 |
        |                                                                  =
 |
  2e+08 ++                 .*..                        .*.*.    .*.*.*.    =
.*
        *.*..*.*.*    *.*.*    *.*.*.*..*.*.*..*.*.*.*.     *.*.       *..*=
 |
  1e+08 ++        :  +                                                     =
 |
        |         : +                                                      =
 |
      0 ++---------*-------------------------------------------------------=
-+


                             hackbench.time.user_time

  1400 ++------------*-----------------------------------------------------=
-+
       *.*..*.*.*    : *.*..*.*.*..*.*.*..*.*.*.*..*.*.*..*.*.*..*.*.*.*..*=
.*
  1200 ++       :    :                                                     =
 |
       |        :    :                                                     =
 |
  1000 O+O      O: O:O O O  O O O    O    O   O    O                       =
 |
       |    O O  :  :              O   O    O   O                          =
 |
   800 ++        :  :                                                      =
 |
       |         :  :                                                      =
 |
   600 ++         : :                                                      =
 |
       |          : :                                                      =
 |
   400 ++         : :                                                      =
 |
       |          ::                                                       =
 |
   200 ++          :                                                       =
 |
       |           :                                                       =
 |
     0 ++----------*-------------------------------------------------------=
-+


                    hackbench.time.percent_of_cpu_this_job_got

  5000 ++------------------------------------------------------------------=
-+
  4500 O+O  O O O  O O O O  O O O  O O O  O O O O  O                       =
 |
       *.*..*.*.*    *.*.*..*.*.*..*.*.*..*.*.*.*..*.*.*..*.*.*..*.*.*.*..*=
.*
  4000 ++       :    :                                                     =
 |
  3500 ++        :   :                                                     =
 |
       |         :   :                                                     =
 |
  3000 ++        :  :                                                      =
 |
  2500 ++        :  :                                                      =
 |
  2000 ++         : :                                                      =
 |
       |          : :                                                      =
 |
  1500 ++         : :                                                      =
 |
  1000 ++         : :                                                      =
 |
       |           :                                                       =
 |
   500 ++          :                                                       =
 |
     0 ++----------*-------------------------------------------------------=
-+


                          hackbench.time.minor_page_faults

  300000 ++----------------------------------------------------------------=
-+
         |        O      O O   O  O     O  O     O O                       =
 |
  250000 O+O O  O   O O      O      O O      O O                           =
 |
         |                                                                 =
 |
         *.*.*..*.*   *..*.*.*.*..*.*.*.*..*.*.*.*.*..*. .*.*..*.*. .*..*.*=
.*
  200000 ++       :   :                                 *          *       =
 |
         |        :   :                                                    =
 |
  150000 ++        : :                                                     =
 |
         |         : :                                                     =
 |
  100000 ++        : :                                                     =
 |
         |         : :                                                     =
 |
         |         : :                                                     =
 |
   50000 ++         :                                                      =
 |
         |          :                                                      =
 |
       0 ++---------*------------------------------------------------------=
-+


                       hackbench.time.voluntary_context_switches

    2e+09 ++---------------------------------------------------------------=
-+
  1.8e+09 ++     O       O      O O        O        O                      =
 |
          |   O    O O O    O O     O  O O   O O  O                        =
 |
  1.6e+09 O+O                                                              =
 |
  1.4e+09 ++                                                               =
 |
          |                                                                =
 |
  1.2e+09 ++                                                               =
 |
    1e+09 ++                                                               =
 |
    8e+08 ++                                                               =
.*
          *.*.*..*.*   *.*..*.*.*.*.*..*.*.*.*.*..*.*.*.*.*..*.*.*.*.*..*.*=
 |
    6e+08 ++       :   :                                                   =
 |
    4e+08 ++        : :                                                    =
 |
          |         : :                                                    =
 |
    2e+08 ++         :                                                     =
 |
        0 ++---------*-----------------------------------------------------=
-+


                     hackbench.time.involuntary_context_switches

  7e+08 ++-----------------------------------------------------------------=
-+
        |               O      O O                                         =
 |
  6e+08 ++     O O O  O   O        O    O O O    O O                       =
 |
        O O  O              O        O         O                           =
 |
  5e+08 ++                                                                 =
 |
        |                                                                  =
 |
  4e+08 ++                                                                 =
 |
        |                                                                  =
 |
  3e+08 ++                                                                 =
 |
        |                                                                  =
 |
  2e+08 ++                 .*..                        .*.*.    .*.*.*.    =
.*
        *.*..*.*.*    *.*.*    *.*.*.*..*.*.*..*.*.*.*.     *.*.       *..*=
 |
  1e+08 ++        :  +                                                     =
 |
        |         : +                                                      =
 |
      0 ++---------*-------------------------------------------------------=
-+


                                    softirqs.SCHED

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  2.5e+06 *+*.*..*.*   *.*..*.*.*.*.*..*.*.*.*.*..*.*.*.*.*..   .*.    .*. =
 |
          |        :   :                                     *.*   *.*.   *=
.*
          |        :   :                                                   =
 |
    2e+06 ++        :  :                                                   =
 |
          O O      O: :                O   O   O    O                      =
 |
  1.5e+06 ++  O  O  :O:O O  O O O O O    O   O    O                        =
 |
          |         : :                                                    =
 |
    1e+06 ++        : :                                                    =
 |
          |         : :                                                    =
 |
          |          ::                                                    =
 |
   500000 ++         :                                                     =
 |
          |          :                                                     =
 |
        0 ++---------*-----------------------------------------------------=
-+


                                    uptime.idle

  4500 ++------------------------------------------------------------------=
-+
       *.*..*.*.*     .*.*..*.*.*..*.*.*..*.*.*.*..*.*.*..*.    .*. .*.*..*=
.*
  4000 ++       :    *                                      *.*.   *       =
 |
  3500 ++       :    :                                                     =
 |
       |         :   :                                                     =
 |
  3000 ++        :   :                                                     =
 |
  2500 O+O      O: O:       O      O O    O O O    O                       =
 |
       |      O  :  :O O O    O O      O        O                          =
 |
  2000 ++   O     : :                                                      =
 |
  1500 ++         : :                                                      =
 |
       |          : :                                                      =
 |
  1000 ++         : :                                                      =
 |
   500 ++          :                                                       =
 |
       |           :                                                       =
 |
     0 ++----------*-------------------------------------------------------=
-+


                                cpuidle.POLL.usage

  3500 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  3000 ++    .*.     *. .*.. .*.      .*..        .*. .*..                 =
.*
       *.*..*   *    : *    *   *..*.*    *.*.*.*.   *    *.*.*..*.*.*.*..*=
 |
  2500 ++       :    :                                                     =
 |
       |         :   :                                                     =
 |
  2000 ++        :  :                                                      =
 |
       O O       :  :                                                      =
 |
  1500 ++       O:  :                O        O                            =
 |
       |    O     :O:O   O  O   O  O   O  O O   O  O                       =
 |
  1000 ++     O   : :  O      O                                            =
 |
       |          : :                                                      =
 |
   500 ++         ::                                                       =
 |
       |           :                                                       =
 |
     0 ++----------*-------------------------------------------------------=
-+


                                  cpuidle.C1-IVT.time

  1.8e+09 *+*-*--*-*---*-*--*---*-*-*--*-*-*-*-*--*-*-*---*----------------=
-+
          |        :   :      *                         *    *.*.*.*.*..*.*=
.*
  1.6e+09 ++       :   :                                                   =
 |
  1.4e+09 ++       :   :                                                   =
 |
          |         : :                                                    =
 |
  1.2e+09 ++        : :                                                    =
 |
    1e+09 ++        : :                                                    =
 |
          |         : :                                                    =
 |
    8e+08 O+O      O: :                O   O   O    O                      =
 |
    6e+08 ++  O  O  :O:O    O O   O O    O   O    O                        =
 |
          |         : :  O      O                                          =
 |
    4e+08 ++         :                                                     =
 |
    2e+08 ++         :                                                     =
 |
          |          :                                                     =
 |
        0 ++---------*-----------------------------------------------------=
-+


                                 cpuidle.C1-IVT.usage

  1.2e+08 ++---------------------------------------------------------------=
-+
          *.*.*..*.*   *.*..*.*.*.*.*..*.*.*.*.*..*.*.*.*.*..   .*.        =
 |
    1e+08 ++       :   :                                     *.*   *.*..*.*=
.*
          |        :   :                                                   =
 |
          |        :   :                                                   =
 |
    8e+07 O+O       : :                                                    =
 |
          |        O: :                O   O   O    O                      =
 |
    6e+07 ++  O  O  :O:O    O O   O O    O   O    O                        =
 |
          |         : :  O      O                                          =
 |
    4e+07 ++        : :                                                    =
 |
          |         : :                                                    =
 |
          |          :                                                     =
 |
    2e+07 ++         :                                                     =
 |
          |          :                                                     =
 |
        0 ++---------*-----------------------------------------------------=
-+


                                 cpuidle.C1E-IVT.time

    3e+07 ++---------------------------------------------------------------=
-+
          *.*.*..*.*   *.*..*.*.*.*.*..*.*.*.*.*..*.*.*.*.*.. .*.*.*.      =
 |
  2.5e+07 ++       :   :                                     *       *..*.*=
.*
          |        :   :                                                   =
 |
          |        :   :                                                   =
 |
    2e+07 ++        : :                                                    =
 |
          |         : :                                                    =
 |
  1.5e+07 ++        : :                                                    =
 |
          |         : :                                                    =
 |
    1e+07 ++        : :                                                    =
 |
          |         : :                                                    =
 |
          O          :                                                     =
 |
    5e+06 ++O O    O O        O        O   O   O    O                      =
 |
          |      O   : O O  O   O O O    O   O    O                        =
 |
        0 ++---------*-----------------------------------------------------=
-+


                                cpuidle.C1E-IVT.usage

  350000 ++----------------------------------------------------------------=
-+
         |              .*.*.                                              =
 |
  300000 *+*.*..*.*   *.     *.*..*.*.*.*..*.*.*.*.*..*.*.*.*..*.*.*.*..*.*=
.*
         |        :   :                                                    =
 |
  250000 ++       :   :                                                    =
 |
         |         :  :                                                    =
 |
  200000 ++        : :                                                     =
 |
         |         : :                                                     =
 |
  150000 ++        : :                                                     =
 |
         |         : :                                                     =
 |
  100000 ++        : :                                                     =
 |
         | O        ::                                                     =
 |
   50000 O+  O    O O        O        O O  O   O O O                       =
 |
         |      O   : O  O O   O  O O        O                             =
 |
       0 ++---------*------------------------------------------------------=
-+


                                 cpuidle.C3-IVT.time

  6e+07 *+*--*-*-*------*--------*-*-*--*-*-*--*-*-*-*----*----------------=
-+
        |        :    *   *.*..*                        *   *.*..*.*.*.*..*=
.|
  5e+07 ++       :    :                                                    =
 *
        |        :    :                                                    =
 |
        |         :  :                                                     =
 |
  4e+07 ++        :  :                                                     =
 |
        |         :  :                                                     =
 |
  3e+07 ++        :  :                                                     =
 |
        |         : :                                                      =
 |
  2e+07 ++        : :                                                      =
 |
        |         : :                                                      =
 |
        |          ::                                                      =
 |
  1e+07 O+O  O   O :                 O    O    O   O                       =
 |
        |      O   O  O O O O  O O O    O   O    O                         =
 |
      0 ++---------*-------------------------------------------------------=
-+


                                cpuidle.C3-IVT.usage

  600000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  500000 *+*.*..*.*   *..*.*.*.*..*.*.*.*..*.*.*.*.*..*.*.*.    .*.        =
 |
         |        :   :                                     *..*   *.*..*.*=
.*
         |        :   :                                                    =
 |
  400000 ++        :  :                                                    =
 |
         |         : :                                                     =
 |
  300000 ++        : :                                                     =
 |
         |         : :                                                     =
 |
  200000 ++        : :                                                     =
 |
         |         : :                                                     =
 |
         |          ::                                                     =
 |
  100000 O+O O    O :        O        O    O   O   O                       =
 |
         |      O   O O  O O   O  O O   O    O   O                         =
 |
       0 ++---------*------------------------------------------------------=
-+


                                 cpuidle.C6-IVT.time

  6e+08 ++-----------------------------------------------------------------=
-+
        |.*..*.*.*                .*.*..*.*.  .*.*.*.*..                   =
 |
  5e+08 *+       :    *.*.*.*..*.*          *.          *.*.*.*..*.*.*.*..*=
.*
        |        :    :                                                    =
 |
        |        :    :                                                    =
 |
  4e+08 ++        :  :                                                     =
 |
        |         :  :                                                     =
 |
  3e+08 ++        :  :                                                     =
 |
        |         :  :                                                     =
 |
  2e+08 ++        : :                                                      =
 |
        | O       : :                                                      =
 |
        O    O O O O:     O O    O O O  O O O  O O O                       =
 |
  1e+08 ++         :: O O      O                                           =
 |
        |          :                                                       =
 |
      0 ++---------*-------------------------------------------------------=
-+


                                 cpuidle.C6-IVT.usage

  4.5e+06 ++---------------------------------------------------------------=
-+
          *.*.*..*.*    .*..*. .*.*.*..*.*.*.*.*..*.*.*.*.      .*.        =
 |
    4e+06 ++       :   *      *                           *..*.*   *.*..*.*=
.*
  3.5e+06 ++       :   :                                                   =
 |
          |        :   :                                                   =
 |
    3e+06 ++        :  :                                                   =
 |
  2.5e+06 ++        : :                                                    =
 |
          |         : :                                                    =
 |
    2e+06 ++        : :                                                    =
 |
  1.5e+06 ++        : :                                                    =
 |
          |         : :                                                    =
 |
    1e+06 ++O        ::                                                    =
 |
   500000 O+  O    O O      O O        O   O   O    O                      =
 |
          |      O   : O O      O O O    O   O    O                        =
 |
        0 ++---------*-----------------------------------------------------=
-+


                                    meminfo.Slab

  200000 *+*-*--*-*---*--*-*-*-*--*-*-*-*--*-*-*-*-*--*-*-*-*--*-*-*-*--*-*=
-*
  180000 ++O      O   :               O        O                           =
 |
         O   O  O : O O  O O O O  O O   O  O O   O O                       =
 |
  160000 ++       :   :                                                    =
 |
  140000 ++        : :                                                     =
 |
         |         : :                                                     =
 |
  120000 ++        : :                                                     =
 |
  100000 ++        : :                                                     =
 |
   80000 ++        : :                                                     =
 |
         |         : :                                                     =
 |
   60000 ++        : :                                                     =
 |
   40000 ++         :                                                      =
 |
         |          :                                                      =
 |
   20000 ++         :                                                      =
 |
       0 ++---------*------------------------------------------------------=
-+


                                 meminfo.SUnreclaim

  160000 ++----------------------------------------------------------------=
-+
         *. .*..*.*   *..*.*.    .*. .*.*..*.*. .*.*..*. .*.  .*.*.*.*..*. =
.*
  140000 ++*      :   :      *.*.   *          *        *   *.            *=
 |
  120000 O+O O  O O O O  O O O O  O O O O  O O O O O                       =
 |
         |        :   :                                                    =
 |
  100000 ++        : :                                                     =
 |
         |         : :                                                     =
 |
   80000 ++        : :                                                     =
 |
         |         : :                                                     =
 |
   60000 ++        : :                                                     =
 |
   40000 ++        : :                                                     =
 |
         |          :                                                      =
 |
   20000 ++         :                                                      =
 |
         |          :                                                      =
 |
       0 ++---------*------------------------------------------------------=
-+


                                   vmstat.system.in

  1.2e+06 ++---------------------------------------------------------------=
-+
          |              O      O O                                        =
 |
    1e+06 ++  O  O   O O    O O     O    O O O    O O                      =
 |
          |        O                   O       O                           =
 |
          O O                                                              =
 |
   800000 ++                                                               =
 |
          |                                                                =
 |
   600000 ++                                                               =
 |
          |                                                                =
 |
   400000 ++                                                               =
 |
          |                                                                =
 |
          *.*.*..*.*   *.*..*.*.*.*.*..*.*.*.*.*..*.*.*.*.*..*.*.*.*.*..*.*=
.*
   200000 ++        : :                                                    =
 |
          |         : :                                                    =
 |
        0 ++---------*-----------------------------------------------------=
-+


                                   vmstat.system.cs

  4.5e+06 ++---------------------------------------------------------------=
-+
          |            O O      O O                                        =
 |
    4e+06 O+  O  O O O      O O     O  O O O O O  O O                      =
 |
  3.5e+06 ++O                                                              =
 |
          |                                                                =
 |
    3e+06 ++                                                               =
 |
  2.5e+06 ++                                                               =
 |
          |                                                                =
 |
    2e+06 ++                                                      .*.      =
.*
  1.5e+06 *+*.*..*.*   *.*..*.*.*.*.*..*.*.*.*.*..*.*.*.*.*..*.*.*   *..*.*=
 |
          |        :   :                                                   =
 |
    1e+06 ++        : :                                                    =
 |
   500000 ++        : :                                                    =
 |
          |          :                                                     =
 |
        0 ++---------*-----------------------------------------------------=
-+

	[*] bisect-good sample
	[O] bisect-bad  sample

To reproduce:

        git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tes=
ts.git
        cd lkp-tests
        bin/lkp install job.yaml  # job file is attached in this email
        bin/lkp run     job.yaml


***************************************************************************=
************************
ivb42: 48 threads Ivytown Ivy Bridge-EP with 64G memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/100%/debian-x86_64-2015-02-07.cgz/ivb42/c=
ontext1/unixbench

commit: =

  c5114626f33b62fa7595e57d87f33d9d1f8298a2
  53d3bc773eaa7ab1cf63585e76af7ee869d5e709

c5114626f33b62fa 53d3bc773eaa7ab1cf63585e76 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     18006 =C2=B1  1%     +25.9%      22672 =C2=B1  0%  unixbench.score
     39774 =C2=B1 33%  +5.4e+05%  2.138e+08 =C2=B1  4%  unixbench.time.invo=
luntary_context_switches
      1717 =C2=B1  0%      +1.9%       1749 =C2=B1  0%  unixbench.time.perc=
ent_of_cpu_this_job_got
    152.51 =C2=B1  0%     +33.9%     204.18 =C2=B1  1%  unixbench.time.user=
_time
 7.052e+08 =C2=B1  1%      -3.9%   6.78e+08 =C2=B1  1%  unixbench.time.volu=
ntary_context_switches
 4.243e+08 =C2=B1  3%      -9.4%  3.845e+08 =C2=B1  7%  cpuidle.C1-IVT.time
 1.544e+08 =C2=B1  6%     -37.5%   96475672 =C2=B1  5%  cpuidle.C1-IVT.usage
    409626 =C2=B1  4%     +28.6%     526843 =C2=B1 15%  softirqs.RCU
    274815 =C2=B1  4%     -27.5%     199184 =C2=B1  9%  softirqs.SCHED
     39774 =C2=B1 33%  +5.4e+05%  2.138e+08 =C2=B1  4%  time.involuntary_co=
ntext_switches
    152.51 =C2=B1  0%     +33.9%     204.18 =C2=B1  1%  time.user_time
     45.25 =C2=B1  0%     +12.7%      51.00 =C2=B1  0%  vmstat.procs.r
  11774346 =C2=B1  0%     +20.2%   14152328 =C2=B1  0%  vmstat.system.cs
   1848728 =C2=B1  0%     +22.7%    2269123 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.avg
   2029277 =C2=B1  0%     +18.7%    2409509 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.max
   1561074 =C2=B1  5%     +29.9%    2027122 =C2=B1  3%  sched_debug.cfs_rq:=
/.min_vruntime.min
    103209 =C2=B1  9%     -17.8%      84792 =C2=B1 10%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
     11.68 =C2=B1  6%     -35.9%       7.49 =C2=B1  6%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
    103208 =C2=B1  9%     -17.8%      84795 =C2=B1 10%  sched_debug.cfs_rq:=
/.spread0.stddev
    946393 =C2=B1  5%     -24.5%     714499 =C2=B1 10%  sched_debug.cpu.avg=
_idle.max
    234059 =C2=B1  6%     -36.5%     148728 =C2=B1 37%  sched_debug.cpu.avg=
_idle.stddev
     11.57 =C2=B1  6%     -31.2%       7.96 =C2=B1 20%  sched_debug.cpu.cpu=
_load[1].avg
     11.61 =C2=B1  7%     -34.4%       7.61 =C2=B1 12%  sched_debug.cpu.cpu=
_load[2].avg
     11.70 =C2=B1  7%     -35.4%       7.56 =C2=B1  8%  sched_debug.cpu.cpu=
_load[3].avg
     11.86 =C2=B1  7%     -36.1%       7.58 =C2=B1  6%  sched_debug.cpu.cpu=
_load[4].avg
      0.48 =C2=B1  6%     +13.9%       0.54 =C2=B1  3%  sched_debug.cpu.nr_=
running.avg
      0.37 =C2=B1  5%     +10.5%       0.41 =C2=B1  4%  sched_debug.cpu.nr_=
running.stddev
  14556348 =C2=B1  0%     +20.1%   17474921 =C2=B1  0%  sched_debug.cpu.nr_=
switches.avg
  14764042 =C2=B1  0%     +24.5%   18380752 =C2=B1  0%  sched_debug.cpu.nr_=
switches.max
  14296508 =C2=B1  0%     +14.9%   16430231 =C2=B1  0%  sched_debug.cpu.nr_=
switches.min
    121577 =C2=B1 25%    +268.4%     447878 =C2=B1  8%  sched_debug.cpu.nr_=
switches.stddev
     -9.42 =C2=B1 -3%     +20.4%     -11.33 =C2=B1-12%  sched_debug.cpu.nr_=
uninterruptible.min



***************************************************************************=
************************
lkp-hsw-ep4: 72 threads Haswell-EP with 128G memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbo=
x_group/testcase:
  gcc-4.9/performance/pipe/12/x86_64-rhel/process/50%/debian-x86_64-2015-02=
-07.cgz/lkp-hsw-ep4/hackbench

commit: =

  c5114626f33b62fa7595e57d87f33d9d1f8298a2
  53d3bc773eaa7ab1cf63585e76af7ee869d5e709

c5114626f33b62fa 53d3bc773eaa7ab1cf63585e76 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    207412 =C2=B1  0%     -15.6%     175076 =C2=B1  1%  hackbench.throughput
    489.41 =C2=B1  0%     +18.4%     579.66 =C2=B1  1%  hackbench.time.elap=
sed_time
    489.41 =C2=B1  0%     +18.4%     579.66 =C2=B1  1%  hackbench.time.elap=
sed_time.max
 1.005e+09 =C2=B1  0%    +113.2%  2.142e+09 =C2=B1  4%  hackbench.time.invo=
luntary_context_switches
      6966 =C2=B1  0%      +2.2%       7118 =C2=B1  0%  hackbench.time.perc=
ent_of_cpu_this_job_got
     32394 =C2=B1  0%     +19.3%      38635 =C2=B1  1%  hackbench.time.syst=
em_time
      1700 =C2=B1  0%     +54.6%       2627 =C2=B1  3%  hackbench.time.user=
_time
 3.164e+09 =C2=B1  0%     +64.2%  5.195e+09 =C2=B1  3%  hackbench.time.volu=
ntary_context_switches
    536.44 =C2=B1  0%     +17.1%     627.97 =C2=B1  1%  uptime.boot
      4496 =C2=B1  1%     -16.4%       3757 =C2=B1  4%  uptime.idle
    720.75 =C2=B1  0%     +14.7%     826.75 =C2=B1  0%  vmstat.procs.r
   8795090 =C2=B1  0%     +44.3%   12689850 =C2=B1  2%  vmstat.system.cs
   2115904 =C2=B1  1%      -7.1%    1965559 =C2=B1  3%  vmstat.system.in
  49651750 =C2=B1  0%     -34.1%   32710138 =C2=B1  3%  numa-numastat.node0=
.local_node
  49657590 =C2=B1  0%     -34.1%   32719401 =C2=B1  3%  numa-numastat.node0=
.numa_hit
  51230886 =C2=B1  1%     -37.1%   32238968 =C2=B1  4%  numa-numastat.node1=
.local_node
  51235497 =C2=B1  1%     -37.1%   32241201 =C2=B1  4%  numa-numastat.node1=
.numa_hit
     16114 =C2=B1  3%     +15.3%      18577 =C2=B1  2%  softirqs.NET_RX
   3907664 =C2=B1  1%     +44.4%    5643157 =C2=B1  1%  softirqs.RCU
   2029740 =C2=B1  1%     -67.7%     655775 =C2=B1 16%  softirqs.SCHED
  17332687 =C2=B1  0%     +21.1%   20995794 =C2=B1  1%  softirqs.TIMER
     97.19 =C2=B1  0%      +1.5%      98.70 =C2=B1  0%  turbostat.%Busy
      2694 =C2=B1  0%      +1.2%       2726 =C2=B1  0%  turbostat.Avg_MHz
      2.58 =C2=B1  2%     -56.9%       1.11 =C2=B1  7%  turbostat.CPU%c1
      0.22 =C2=B1  3%     -14.8%       0.19 =C2=B1  2%  turbostat.CPU%c6
    894518 =C2=B1  5%     -16.2%     749856 =C2=B1  5%  numa-meminfo.node0.=
MemUsed
     31304 =C2=B1 18%     -19.8%      25116 =C2=B1 13%  numa-meminfo.node0.=
PageTables
    137230 =C2=B1 14%     -13.2%     119062 =C2=B1  7%  numa-meminfo.node0.=
Slab
     77654 =C2=B1 43%     +53.9%     119507 =C2=B1  2%  numa-meminfo.node1.=
Active(anon)
    676863 =C2=B1  6%     +18.9%     804493 =C2=B1  5%  numa-meminfo.node1.=
MemUsed
     40040 =C2=B1 87%    +102.8%      81204 =C2=B1  3%  numa-meminfo.node1.=
Shmem
      2.29 =C2=B1  8%     -82.5%       0.40 =C2=B1112%  perf-profile.cycles=
-pp.call_cpuidle
      3.41 =C2=B1  8%     -84.8%       0.52 =C2=B1113%  perf-profile.cycles=
-pp.cpu_startup_entry
      2.29 =C2=B1  8%     -82.4%       0.40 =C2=B1112%  perf-profile.cycles=
-pp.cpuidle_enter
      2.26 =C2=B1  9%     -82.4%       0.40 =C2=B1112%  perf-profile.cycles=
-pp.cpuidle_enter_state
      2.24 =C2=B1  9%     -82.4%       0.40 =C2=B1112%  perf-profile.cycles=
-pp.intel_idle
      3.42 =C2=B1  7%     -84.9%       0.52 =C2=B1113%  perf-profile.cycles=
-pp.start_secondary
     86451 =C2=B1  1%      +9.1%      94357 =C2=B1  3%  proc-vmstat.numa_hi=
nt_faults_local
 1.009e+08 =C2=B1  0%     -35.6%   64951081 =C2=B1  3%  proc-vmstat.numa_hit
 1.009e+08 =C2=B1  0%     -35.6%   64941826 =C2=B1  3%  proc-vmstat.numa_lo=
cal
   1744958 =C2=B1  0%     -36.7%    1105128 =C2=B1  3%  proc-vmstat.pgalloc=
_dma32
  99309681 =C2=B1  0%     -35.5%   64014721 =C2=B1  3%  proc-vmstat.pgalloc=
_normal
  1.01e+08 =C2=B1  0%     -35.6%   65068018 =C2=B1  3%  proc-vmstat.pgfree
    489.41 =C2=B1  0%     +18.4%     579.66 =C2=B1  1%  time.elapsed_time
    489.41 =C2=B1  0%     +18.4%     579.66 =C2=B1  1%  time.elapsed_time.m=
ax
 1.005e+09 =C2=B1  0%    +113.2%  2.142e+09 =C2=B1  4%  time.involuntary_co=
ntext_switches
     32394 =C2=B1  0%     +19.3%      38635 =C2=B1  1%  time.system_time
      1700 =C2=B1  0%     +54.6%       2627 =C2=B1  3%  time.user_time
 3.164e+09 =C2=B1  0%     +64.2%  5.195e+09 =C2=B1  3%  time.voluntary_cont=
ext_switches
      7826 =C2=B1 18%     -19.7%       6283 =C2=B1 13%  numa-vmstat.node0.n=
r_page_table_pages
  24938156 =C2=B1  0%     -34.5%   16344223 =C2=B1  2%  numa-vmstat.node0.n=
uma_hit
  24865727 =C2=B1  0%     -34.6%   16268676 =C2=B1  2%  numa-vmstat.node0.n=
uma_local
     19415 =C2=B1 43%     +53.9%      29872 =C2=B1  2%  numa-vmstat.node1.n=
r_active_anon
     10012 =C2=B1 87%    +102.5%      20273 =C2=B1  3%  numa-vmstat.node1.n=
r_shmem
  25578109 =C2=B1  2%     -35.3%   16544997 =C2=B1  3%  numa-vmstat.node1.n=
uma_hit
  25542618 =C2=B1  2%     -35.4%   16513089 =C2=B1  3%  numa-vmstat.node1.n=
uma_local
  7.39e+08 =C2=B1  1%     -63.6%  2.693e+08 =C2=B1 12%  cpuidle.C1-HSW.time
 1.279e+08 =C2=B1  2%     -75.4%   31468140 =C2=B1 20%  cpuidle.C1-HSW.usage
  97966635 =C2=B1  3%     -38.4%   60323848 =C2=B1  6%  cpuidle.C1E-HSW.time
   2424496 =C2=B1  2%     -54.3%    1108542 =C2=B1 10%  cpuidle.C1E-HSW.usa=
ge
   2168324 =C2=B1  5%     -38.4%    1335858 =C2=B1  6%  cpuidle.C3-HSW.time
     23824 =C2=B1  2%     -51.7%      11496 =C2=B1 10%  cpuidle.C3-HSW.usage
    133416 =C2=B1  1%     -41.7%      77729 =C2=B1 10%  cpuidle.C6-HSW.usage
     72278 =C2=B1 96%     -85.4%      10574 =C2=B1 13%  cpuidle.POLL.time
      7564 =C2=B1  0%     -64.3%       2699 =C2=B1 13%  cpuidle.POLL.usage
    447972 =C2=B1 12%     -77.1%     102749 =C2=B1 39%  sched_debug.cfs_rq:=
/.MIN_vruntime.avg
  23408331 =C2=B1  2%     -74.0%    6077779 =C2=B1 38%  sched_debug.cfs_rq:=
/.MIN_vruntime.max
   3133258 =C2=B1  5%     -75.3%     773710 =C2=B1 35%  sched_debug.cfs_rq:=
/.MIN_vruntime.stddev
      0.17 =C2=B1173%   +1025.0%       1.88 =C2=B1 15%  sched_debug.cfs_rq:=
/.load.min
      4.72 =C2=B1  5%     +21.2%       5.72 =C2=B1  4%  sched_debug.cfs_rq:=
/.load_avg.min
    447972 =C2=B1 12%     -77.1%     102749 =C2=B1 39%  sched_debug.cfs_rq:=
/.max_vruntime.avg
  23408331 =C2=B1  2%     -74.0%    6077779 =C2=B1 38%  sched_debug.cfs_rq:=
/.max_vruntime.max
   3133258 =C2=B1  5%     -75.3%     773710 =C2=B1 35%  sched_debug.cfs_rq:=
/.max_vruntime.stddev
  34877232 =C2=B1  0%     -16.9%   28973299 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.avg
  36136568 =C2=B1  0%     -16.9%   30030834 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.max
  33553337 =C2=B1  0%     -16.4%   28050567 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.min
    580186 =C2=B1  2%     -26.0%     429600 =C2=B1 11%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      0.08 =C2=B1110%    +710.0%       0.67 =C2=B1 21%  sched_debug.cfs_rq:=
/.nr_running.min
      0.17 =C2=B1 12%     -59.6%       0.07 =C2=B1 31%  sched_debug.cfs_rq:=
/.nr_running.stddev
     25.39 =C2=B1  2%     -17.8%      20.88 =C2=B1  3%  sched_debug.cfs_rq:=
/.runnable_load_avg.max
      0.44 =C2=B1173%   +1002.5%       4.90 =C2=B1 13%  sched_debug.cfs_rq:=
/.runnable_load_avg.min
      4.84 =C2=B1  2%     -39.4%       2.93 =C2=B1  8%  sched_debug.cfs_rq:=
/.runnable_load_avg.stddev
    952653 =C2=B1 15%     -51.5%     462372 =C2=B1 50%  sched_debug.cfs_rq:=
/.spread0.avg
   2206041 =C2=B1 10%     -31.4%    1514231 =C2=B1  8%  sched_debug.cfs_rq:=
/.spread0.max
    577122 =C2=B1  2%     -25.8%     428166 =C2=B1 11%  sched_debug.cfs_rq:=
/.spread0.stddev
     46.85 =C2=B1  3%     -34.0%      30.93 =C2=B1 24%  sched_debug.cfs_rq:=
/.util_avg.stddev
    115635 =C2=B1  1%    +107.7%     240214 =C2=B1  8%  sched_debug.cpu.avg=
_idle.avg
    506560 =C2=B1 15%     +83.7%     930497 =C2=B1  4%  sched_debug.cpu.avg=
_idle.max
      6833 =C2=B1131%    +168.7%      18362 =C2=B1 34%  sched_debug.cpu.avg=
_idle.min
     78999 =C2=B1  9%    +214.9%     248764 =C2=B1  8%  sched_debug.cpu.avg=
_idle.stddev
    290289 =C2=B1  0%     +10.7%     321362 =C2=B1  0%  sched_debug.cpu.clo=
ck.avg
    290345 =C2=B1  0%     +10.7%     321461 =C2=B1  0%  sched_debug.cpu.clo=
ck.max
    290230 =C2=B1  0%     +10.7%     321263 =C2=B1  0%  sched_debug.cpu.clo=
ck.min
     34.48 =C2=B1 26%     +74.7%      60.23 =C2=B1  5%  sched_debug.cpu.clo=
ck.stddev
    290289 =C2=B1  0%     +10.7%     321362 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.avg
    290345 =C2=B1  0%     +10.7%     321461 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.max
    290230 =C2=B1  0%     +10.7%     321263 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.min
     34.48 =C2=B1 26%     +74.7%      60.23 =C2=B1  5%  sched_debug.cpu.clo=
ck_task.stddev
      0.50 =C2=B1 80%    +865.0%       4.82 =C2=B1  7%  sched_debug.cpu.cpu=
_load[0].min
      2.00 =C2=B1 33%    +155.0%       5.10 =C2=B1  6%  sched_debug.cpu.cpu=
_load[1].min
      3.31 =C2=B1 17%     +59.6%       5.28 =C2=B1  6%  sched_debug.cpu.cpu=
_load[2].min
      4.28 =C2=B1  5%     +28.0%       5.47 =C2=B1  4%  sched_debug.cpu.cpu=
_load[3].min
     29.69 =C2=B1 10%     -21.4%      23.35 =C2=B1  4%  sched_debug.cpu.cpu=
_load[4].max
      4.39 =C2=B1  5%     +24.7%       5.47 =C2=B1  4%  sched_debug.cpu.cpu=
_load[4].min
      4.99 =C2=B1  9%     -30.3%       3.47 =C2=B1  5%  sched_debug.cpu.cpu=
_load[4].stddev
      1275 =C2=B1 74%    +660.4%       9696 =C2=B1 35%  sched_debug.cpu.cur=
r->pid.min
      2960 =C2=B1 11%     -54.8%       1338 =C2=B1 39%  sched_debug.cpu.cur=
r->pid.stddev
      0.22 =C2=B1 70%    +935.0%       2.30 =C2=B1 30%  sched_debug.cpu.loa=
d.min
      0.00 =C2=B1 11%     +39.0%       0.00 =C2=B1  4%  sched_debug.cpu.nex=
t_balance.stddev
    245043 =C2=B1  0%     +12.4%     275488 =C2=B1  0%  sched_debug.cpu.nr_=
load_updates.avg
    253700 =C2=B1  0%     +11.3%     282470 =C2=B1  0%  sched_debug.cpu.nr_=
load_updates.max
    242515 =C2=B1  0%     +12.5%     272755 =C2=B1  0%  sched_debug.cpu.nr_=
load_updates.min
      8.93 =C2=B1  5%     +12.5%      10.05 =C2=B1  2%  sched_debug.cpu.nr_=
running.avg
     29.08 =C2=B1  4%     -23.2%      22.35 =C2=B1  2%  sched_debug.cpu.nr_=
running.max
      0.11 =C2=B1 70%   +1970.0%       2.30 =C2=B1 26%  sched_debug.cpu.nr_=
running.min
      6.52 =C2=B1  3%     -40.5%       3.88 =C2=B1  8%  sched_debug.cpu.nr_=
running.stddev
  29380032 =C2=B1  0%     +62.7%   47789650 =C2=B1  1%  sched_debug.cpu.nr_=
switches.avg
  32480191 =C2=B1  0%     +63.0%   52947357 =C2=B1  1%  sched_debug.cpu.nr_=
switches.max
  26568245 =C2=B1  0%     +64.3%   43639487 =C2=B1  2%  sched_debug.cpu.nr_=
switches.min
   1724177 =C2=B1  1%     +28.9%    2223172 =C2=B1  5%  sched_debug.cpu.nr_=
switches.stddev
    307.39 =C2=B1  7%     -42.6%     176.42 =C2=B1 14%  sched_debug.cpu.nr_=
uninterruptible.max
   -278.64 =C2=B1-10%     -41.9%    -162.00 =C2=B1 -5%  sched_debug.cpu.nr_=
uninterruptible.min
    131.21 =C2=B1  6%     -45.4%      71.66 =C2=B1  3%  sched_debug.cpu.nr_=
uninterruptible.stddev
    290228 =C2=B1  0%     +10.7%     321261 =C2=B1  0%  sched_debug.cpu_clk
    286726 =C2=B1  0%     +11.2%     318853 =C2=B1  0%  sched_debug.ktime
    290228 =C2=B1  0%     +10.7%     321261 =C2=B1  0%  sched_debug.sched_c=
lk


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Ying Huang

--===============2085401195342501366==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogaGFja2JlbmNoCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9u
aXRvcgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICBoZWFydGJlYXQ6IAogIHZtc3Rh
dDogCiAgbnVtYS1udW1hc3RhdDogCiAgbnVtYS12bXN0YXQ6IAogIG51bWEtbWVtaW5mbzogCiAg
cHJvYy12bXN0YXQ6IAogIHByb2Mtc3RhdDoKICAgIGludGVydmFsOiAxMAogIG1lbWluZm86IAog
IHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAogIHNvZnRpcnFzOiAKICBi
ZGlfZGV2X21hcHBpbmc6IAogIGRpc2tzdGF0czogCiAgbmZzc3RhdDogCiAgY3B1aWRsZTogCiAg
Y3B1ZnJlcS1zdGF0czogCiAgdHVyYm9zdGF0OiAKICBwbWV0ZXI6IAogIHNjaGVkX2RlYnVnOgog
ICAgaW50ZXJ2YWw6IDYwCmNwdWZyZXFfZ292ZXJub3I6IHBlcmZvcm1hbmNlCk5GU19IQU5HX0RG
X1RJTUVPVVQ6IDIwMApORlNfSEFOR19DSEVDS19JTlRFUlZBTDogOTAwCmRlZmF1bHQtd2F0Y2hk
b2dzOgogIG9vbS1raWxsZXI6IAogIHdhdGNoZG9nOiAKICBuZnMtaGFuZzogCmNvbW1pdDogNTNk
M2JjNzczZWFhN2FiMWNmNjM1ODVlNzZhZjdlZTg2OWQ1ZTcwOQptb2RlbDogSXZ5dG93biBJdnkg
QnJpZGdlLUVQCm5yX2NwdTogNDgKbWVtb3J5OiA2NEcKbnJfc3NkX3BhcnRpdGlvbnM6IDEKc3Nk
X3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLUlOVEVMX1NTRFNDMkJCNDgwRzZfQlRX
QTU0NDQwNjRDNDgwRkdOLXBhcnQxIgpzd2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9u
OiAKY2F0ZWdvcnk6IGJlbmNobWFyawpucl90aHJlYWRzOiA1MCUKcGVyZi1wcm9maWxlOgogIGZy
ZXE6IDgwMApoYWNrYmVuY2g6CiAgbW9kZTogdGhyZWFkcwogIGlwYzogc29ja2V0CnF1ZXVlOiBi
aXNlY3QKdGVzdGJveDogaXZiNDIKdGJveF9ncm91cDogaXZiNDIKa2NvbmZpZzogeDg2XzY0LXJo
ZWwKZW5xdWV1ZV90aW1lOiAyMDE2LTA1LTE1IDA4OjU0OjU2LjQ4OTI2NzU2OCArMDg6MDAKY29t
cGlsZXI6IGdjYy00LjkKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CmlkOiA3
ZGE5NzJkNzFkZjk3YjI5ZmMzZjgxMGMwNDMzYzNiMGI2YzcwOTkyCnVzZXI6IGxrcApoZWFkX2Nv
bW1pdDogNjU2NDNlM2FiZTcxZTk3MGJlZjY1NmVhMGIxMjVkYWNlN2M3YTFiMwpiYXNlX2NvbW1p
dDogNjEwNjAzYTUyMGJkZWIzNWJkODM4ODM1ZjM2Y2ZkNmI0YTU2Mzk5NQpicmFuY2g6IGxpbnVz
L21hc3RlcgpyZXN1bHRfcm9vdDogIi9yZXN1bHQvaGFja2JlbmNoL3BlcmZvcm1hbmNlLTUwJS10
aHJlYWRzLXNvY2tldC9pdmI0Mi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1y
aGVsL2djYy00LjkvNTNkM2JjNzczZWFhN2FiMWNmNjM1ODVlNzZhZjdlZTg2OWQ1ZTcwOS8wIgpq
b2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL2l2YjQyL2Jpc2VjdF9oYWNrYmVuY2gtcGVyZm9ybWFu
Y2UtNTAlLXRocmVhZHMtc29ja2V0LWRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0
LXJoZWwtNTNkM2JjNzczZWFhN2FiMWNmNjM1ODVlNzZhZjdlZTg2OWQ1ZTcwOS0yMDE2MDUxNS02
MTE1My1qdzh5NnctMC55YW1sIgptYXhfdXB0aW1lOiAyNDAwCmluaXRyZDogIi9vc2ltYWdlL2Rl
Ymlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpib290bG9hZGVyX2FwcGVuZDoKLSBy
b290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Avc2NoZWR1bGVkL2l2YjQyL2Jpc2Vj
dF9oYWNrYmVuY2gtcGVyZm9ybWFuY2UtNTAlLXRocmVhZHMtc29ja2V0LWRlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtNTNkM2JjNzczZWFhN2FiMWNmNjM1ODVlNzZhZjdl
ZTg2OWQ1ZTcwOS0yMDE2MDUxNS02MTE1My1qdzh5NnctMC55YW1sCi0gQVJDSD14ODZfNjQKLSBr
Y29uZmlnPXg4Nl82NC1yaGVsCi0gYnJhbmNoPWxpbnVzL21hc3RlcgotIGNvbW1pdD01M2QzYmM3
NzNlYWE3YWIxY2Y2MzU4NWU3NmFmN2VlODY5ZDVlNzA5Ci0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4
L3g4Nl82NC1yaGVsL2djYy00LjkvNTNkM2JjNzczZWFhN2FiMWNmNjM1ODVlNzZhZjdlZTg2OWQ1
ZTcwOS92bWxpbnV6LTQuNi4wLXJjNy0wMDA1Ni1nNTNkM2JjNwotIG1heF91cHRpbWU9MjQwMAot
IFJFU1VMVF9ST09UPS9yZXN1bHQvaGFja2JlbmNoL3BlcmZvcm1hbmNlLTUwJS10aHJlYWRzLXNv
Y2tldC9pdmI0Mi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00
LjkvNTNkM2JjNzczZWFhN2FiMWNmNjM1ODVlNzZhZjdlZTg2OWQ1ZTcwOS8wCi0gTEtQX1NFUlZF
Uj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZl
bD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJj
dV9jcHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1p
X3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9
MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3Cmxr
cF9pbml0cmQ6ICIvbGtwL2xrcC9sa3AteDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6ICIvcGtn
L2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvNTNkM2JjNzczZWFhN2FiMWNmNjM1ODVlNzZhZjdl
ZTg2OWQ1ZTcwOS9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4t
eDg2XzY0LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNvbmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2
XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3R1cmJvc3Rh
dC5jZ3osL2xrcC9iZW5jaG1hcmtzL3BlcmYtcHJvZmlsZS14ODZfNjQuY2d6IgpsaW51eF9oZWFk
ZXJzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS81M2QzYmM3NzNlYWE3
YWIxY2Y2MzU4NWU3NmFmN2VlODY5ZDVlNzA5L2xpbnV4LWhlYWRlcnMuY2d6IgpyZXBlYXRfdG86
IDIKa2VybmVsOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzUzZDNiYzc3M2VhYTdh
YjFjZjYzNTg1ZTc2YWY3ZWU4NjlkNWU3MDkvdm1saW51ei00LjYuMC1yYzctMDAwNTYtZzUzZDNi
YzciCmRlcXVldWVfdGltZTogMjAxNi0wNS0xNSAwODo1NjoxNi44OTU1NDY2MDggKzA4OjAwCmpv
Yl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogMzQyLjk2IDM4OS45NiAyMjUuMDEgMS81NDAgMjg5
NjYKc3RhcnRfdGltZTogJzE0NjMyNzM4MjMnCmVuZF90aW1lOiAnMTQ2MzI3NDQyNicKdmVyc2lv
bjogIi9sa3AvbGtwLy5zcmMtMjAxNjA1MTMtMjMyMzQzIgo=

--===============2085401195342501366==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wNS0xNSAwODo1NzowMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNSAwODo1NzowMiBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNSAwODo1NzowMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDUtMTUgMDg6NTc6MDIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE1IDA4OjU3OjAyIGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wNS0xNSAwODo1NzowMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUt
MTUgMDg6NTc6MDIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE1IDA4OjU3OjAyIGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wNS0xNSAwODo1NzowMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTUg
MDg6NTc6MDIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE1IDA4OjU3OjAyIGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxOC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wNS0xNSAwODo1NzowMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTUgMDg6
NTc6MDIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTUgMDg6NTc6MDIgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTA1LTE1IDA4OjU3OjAyIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUyMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNSAwODo1Nzow
MiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjIvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTUgMDg6NTc6MDIgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTA1LTE1IDA4OjU3OjAyIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHUyNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNSAwODo1NzowMiBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjUvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTUgMDg6NTc6MDIgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTA1LTE1IDA4OjU3OjAyIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUyNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNSAwODo1NzowMiBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjgvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDUtMTUgMDg6NTc6MDIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1
LTE1IDA4OjU3OjAyIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE1IDA4OjU3OjAyIGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wNS0xNSAwODo1NzowMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MzEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTUg
MDg6NTc6MDIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE1IDA4OjU3OjAyIGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMy9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wNS0xNSAwODo1NzowMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MzQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTUgMDg6
NTc6MDIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE1IDA4OjU3OjAyIGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wNS0xNSAwODo1NzowMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MzcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTUgMDg6NTc6
MDIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE1IDA4OjU3OjAyIGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wNS0xNSAwODo1NzowMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNSAwODo1NzowMiBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTUgMDg6NTc6MDIgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTA1LTE1IDA4OjU3OjAyIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU0Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNSAwODo1NzowMiBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDMvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDUtMTUgMDg6NTc6MDIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1
LTE1IDA4OjU3OjAyIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU0NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNSAwODo1NzowMiBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDUtMTUgMDg6NTc6MDIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTQ3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE1
IDA4OjU3OjAyIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE1IDA4OjU3OjAyIGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgoyMDE2LTA1LTE1IDA4OjU3OjAyIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE1IDA4OjU3
OjAyIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE1IDA4OjU3OjAyIGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTA1LTE1IDA4OjU3OjAzIC91c3IvYmluL2hhY2tiZW5jaCAtZyAyNCAtLXRocmVhZHMgLWwg
NjAwMDAKMjAxNi0wNS0xNSAwODo1Nzo1MCAvdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMjQgLS10aHJl
YWRzIC1sIDYwMDAwCjIwMTYtMDUtMTUgMDg6NTg6MzMgL3Vzci9iaW4vaGFja2JlbmNoIC1nIDI0
IC0tdGhyZWFkcyAtbCA2MDAwMAoyMDE2LTA1LTE1IDA4OjU5OjE1IC91c3IvYmluL2hhY2tiZW5j
aCAtZyAyNCAtLXRocmVhZHMgLWwgNjAwMDAKMjAxNi0wNS0xNSAwODo1OTo1OCAvdXNyL2Jpbi9o
YWNrYmVuY2ggLWcgMjQgLS10aHJlYWRzIC1sIDYwMDAwCjIwMTYtMDUtMTUgMDk6MDA6NDMgL3Vz
ci9iaW4vaGFja2JlbmNoIC1nIDI0IC0tdGhyZWFkcyAtbCA2MDAwMAoyMDE2LTA1LTE1IDA5OjAx
OjIyIC91c3IvYmluL2hhY2tiZW5jaCAtZyAyNCAtLXRocmVhZHMgLWwgNjAwMDAKMjAxNi0wNS0x
NSAwOTowMTo1NyAvdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMjQgLS10aHJlYWRzIC1sIDYwMDAwCjIw
MTYtMDUtMTUgMDk6MDI6MzkgL3Vzci9iaW4vaGFja2JlbmNoIC1nIDI0IC0tdGhyZWFkcyAtbCA2
MDAwMAoyMDE2LTA1LTE1IDA5OjAzOjIyIC91c3IvYmluL2hhY2tiZW5jaCAtZyAyNCAtLXRocmVh
ZHMgLWwgNjAwMDAKMjAxNi0wNS0xNSAwOTowNDoxMCAvdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMjQg
LS10aHJlYWRzIC1sIDYwMDAwCjIwMTYtMDUtMTUgMDk6MDQ6NTMgL3Vzci9iaW4vaGFja2JlbmNo
IC1nIDI0IC0tdGhyZWFkcyAtbCA2MDAwMAoyMDE2LTA1LTE1IDA5OjA1OjM5IC91c3IvYmluL2hh
Y2tiZW5jaCAtZyAyNCAtLXRocmVhZHMgLWwgNjAwMDAKMjAxNi0wNS0xNSAwOTowNjoyNCAvdXNy
L2Jpbi9oYWNrYmVuY2ggLWcgMjQgLS10aHJlYWRzIC1sIDYwMDAwCg==

--===============2085401195342501366==--

