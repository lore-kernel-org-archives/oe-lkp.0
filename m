Content-Type: multipart/mixed; boundary="===============0621806813355877558=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 53d3bc773e: hackbench.throughput -32.9% regression
Date: Tue, 31 May 2016 16:34:36 +0800
Message-ID: <87eg8id3s3.fsf@yhuang-dev.intel.com>
In-Reply-To: <87inxud4ex.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0621806813355877558==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Ingo,

Part of the regression has been recovered in v4.7-rc1 from -32.9% to
-9.8%.  But there is still some regression.  Is it possible for fully
restore it?

Details are as below.

Best Regards,
Huang, Ying


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
  v4.7-rc1

c5114626f33b62fa 53d3bc773eaa7ab1cf63585e76                   v4.7-rc1 =

---------------- -------------------------- -------------------------- =

         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \  =

    196590 =C2=B1  0%     -32.9%     131963 =C2=B1  2%      -9.8%     17723=
1 =C2=B1  0%  hackbench.throughput
    602.66 =C2=B1  0%      +2.8%     619.27 =C2=B1  2%      +0.3%     604.6=
6 =C2=B1  0%  hackbench.time.elapsed_time
    602.66 =C2=B1  0%      +2.8%     619.27 =C2=B1  2%      +0.3%     604.6=
6 =C2=B1  0%  hackbench.time.elapsed_time.max
  1.76e+08 =C2=B1  3%    +236.0%  5.914e+08 =C2=B1  2%     -49.6%   8878323=
2 =C2=B1  5%  hackbench.time.involuntary_context_switches
    208664 =C2=B1  2%     +26.0%     262929 =C2=B1  3%     +15.7%     24137=
7 =C2=B1  0%  hackbench.time.minor_page_faults
      4401 =C2=B1  0%      +5.7%       4650 =C2=B1  0%      -8.1%       404=
3 =C2=B1  0%  hackbench.time.percent_of_cpu_this_job_got
     25256 =C2=B1  0%     +10.2%      27842 =C2=B1  2%      -7.7%      2331=
1 =C2=B1  0%  hackbench.time.system_time
      1272 =C2=B1  0%     -24.5%     961.37 =C2=B1  2%     -10.4%       114=
0 =C2=B1  0%  hackbench.time.user_time
  7.64e+08 =C2=B1  1%    +131.8%  1.771e+09 =C2=B1  2%     -30.1%  5.339e+0=
8 =C2=B1  2%  hackbench.time.voluntary_context_switches
      4051 =C2=B1  0%     -39.9%       2434 =C2=B1  3%     +57.8%       639=
3 =C2=B1  0%  uptime.idle
   4337715 =C2=B1  1%      +7.3%    4654464 =C2=B1  2%     -23.3%    332534=
6 =C2=B1  5%  softirqs.RCU
   2462880 =C2=B1  0%     -35.6%    1585869 =C2=B1  5%     +58.1%    389398=
8 =C2=B1  0%  softirqs.SCHED
   1766752 =C2=B1  1%    +122.6%    3932589 =C2=B1  1%     -25.6%    131361=
9 =C2=B1  1%  vmstat.system.cs
    249718 =C2=B1  2%    +307.4%    1017398 =C2=B1  3%     -40.4%     14872=
3 =C2=B1  5%  vmstat.system.in
  1.76e+08 =C2=B1  3%    +236.0%  5.914e+08 =C2=B1  2%     -49.6%   8878323=
2 =C2=B1  5%  time.involuntary_context_switches
    208664 =C2=B1  2%     +26.0%     262929 =C2=B1  3%     +15.7%     24137=
7 =C2=B1  0%  time.minor_page_faults
      1272 =C2=B1  0%     -24.5%     961.37 =C2=B1  2%     -10.4%       114=
0 =C2=B1  0%  time.user_time
  7.64e+08 =C2=B1  1%    +131.8%  1.771e+09 =C2=B1  2%     -30.1%  5.339e+0=
8 =C2=B1  2%  time.voluntary_context_switches
    177383 =C2=B1  0%      +2.0%     180939 =C2=B1  0%     -51.3%      8639=
0 =C2=B1  1%  meminfo.Active
    102033 =C2=B1  0%      -0.1%     101893 =C2=B1  1%     -85.6%      1474=
0 =C2=B1  0%  meminfo.Active(file)
    392558 =C2=B1  0%      +0.0%     392612 =C2=B1  0%     +22.6%     48141=
1 =C2=B1  0%  meminfo.Inactive
    382911 =C2=B1  0%      +0.0%     382923 =C2=B1  0%     +23.2%     47179=
2 =C2=B1  0%  meminfo.Inactive(file)
    143370 =C2=B1  0%     -12.0%     126124 =C2=B1  1%      -1.5%     14121=
0 =C2=B1  0%  meminfo.SUnreclaim
   1136461 =C2=B1  3%     +16.6%    1324662 =C2=B1  5%     +15.9%    131682=
9 =C2=B1  1%  numa-numastat.node0.local_node
   1140216 =C2=B1  3%     +16.2%    1324689 =C2=B1  5%     +15.5%    131683=
0 =C2=B1  1%  numa-numastat.node0.numa_hit
      3755 =C2=B1 68%     -99.3%      27.25 =C2=B1 94%    -100.0%       1.2=
5 =C2=B1 34%  numa-numastat.node0.other_node
   1098889 =C2=B1  4%     +20.1%    1320211 =C2=B1  6%     +16.4%    127878=
3 =C2=B1  1%  numa-numastat.node1.local_node
   1101996 =C2=B1  4%     +20.5%    1327590 =C2=B1  6%     +16.0%    127878=
3 =C2=B1  1%  numa-numastat.node1.numa_hit
      3106 =C2=B1 99%    +137.5%       7379 =C2=B1 17%    -100.0%       0.0=
0 =C2=B1 -1%  numa-numastat.node1.other_node
      7.18 =C2=B1  0%     -50.2%       3.57 =C2=B1 43%     +76.1%      12.6=
4 =C2=B1  1%  perf-profile.cycles-pp.call_cpuidle
      8.09 =C2=B1  0%     -44.7%       4.47 =C2=B1 38%     +72.4%      13.9=
5 =C2=B1  1%  perf-profile.cycles-pp.cpu_startup_entry
      7.17 =C2=B1  0%     -50.3%       3.56 =C2=B1 43%     +76.2%      12.6=
3 =C2=B1  1%  perf-profile.cycles-pp.cpuidle_enter
      7.14 =C2=B1  0%     -50.3%       3.55 =C2=B1 43%     +76.1%      12.5=
8 =C2=B1  1%  perf-profile.cycles-pp.cpuidle_enter_state
      7.11 =C2=B1  0%     -50.6%       3.52 =C2=B1 43%     +76.3%      12.5=
4 =C2=B1  1%  perf-profile.cycles-pp.intel_idle
      8.00 =C2=B1  0%     -44.5%       4.44 =C2=B1 38%     +72.1%      13.7=
7 =C2=B1  1%  perf-profile.cycles-pp.start_secondary
     92.32 =C2=B1  0%      +5.4%      97.32 =C2=B1  0%      -7.7%      85.2=
6 =C2=B1  0%  turbostat.%Busy
      2763 =C2=B1  0%      +5.4%       2912 =C2=B1  0%      -7.7%       255=
1 =C2=B1  0%  turbostat.Avg_MHz
      7.48 =C2=B1  0%     -66.5%       2.50 =C2=B1  7%     +94.5%      14.5=
4 =C2=B1  0%  turbostat.CPU%c1
      0.20 =C2=B1  2%      -6.4%       0.18 =C2=B1  2%      +2.6%       0.2=
0 =C2=B1  3%  turbostat.CPU%c6
    180.03 =C2=B1  0%      -1.3%     177.62 =C2=B1  0%      -2.4%     175.6=
3 =C2=B1  0%  turbostat.CorWatt
    209.86 =C2=B1  0%      -0.8%     208.08 =C2=B1  0%      -2.0%     205.6=
4 =C2=B1  0%  turbostat.PkgWatt
      5.83 =C2=B1  0%     +38.9%       8.10 =C2=B1  3%     +12.7%       6.5=
7 =C2=B1  1%  turbostat.RAMWatt
 1.658e+09 =C2=B1  0%     -59.1%  6.784e+08 =C2=B1  7%     +89.3%  3.138e+0=
9 =C2=B1  0%  cpuidle.C1-IVT.time
 1.066e+08 =C2=B1  0%     -40.3%   63661563 =C2=B1  6%     +44.3%  1.539e+0=
8 =C2=B1  0%  cpuidle.C1-IVT.usage
  26348635 =C2=B1  0%     -86.8%    3471048 =C2=B1 15%     +50.0%   3951352=
3 =C2=B1  0%  cpuidle.C1E-IVT.time
    291620 =C2=B1  0%     -85.1%      43352 =C2=B1 15%     +28.8%     37573=
0 =C2=B1  1%  cpuidle.C1E-IVT.usage
  54158643 =C2=B1  1%     -88.5%    6254009 =C2=B1 14%     +78.4%   9659648=
6 =C2=B1  1%  cpuidle.C3-IVT.time
    482437 =C2=B1  1%     -87.0%      62620 =C2=B1 16%     +45.6%     70225=
8 =C2=B1  1%  cpuidle.C3-IVT.usage
 5.028e+08 =C2=B1  0%     -75.8%  1.219e+08 =C2=B1  8%     +85.5%  9.327e+0=
8 =C2=B1  1%  cpuidle.C6-IVT.time
   3805026 =C2=B1  0%     -85.5%     552326 =C2=B1 16%     +49.4%    568418=
2 =C2=B1  1%  cpuidle.C6-IVT.usage
      2766 =C2=B1  4%     -51.4%       1344 =C2=B1  6%     +10.0%       304=
2 =C2=B1  7%  cpuidle.POLL.usage
     49725 =C2=B1  4%      +2.1%      50775 =C2=B1  3%     -85.2%       736=
0 =C2=B1  0%  numa-meminfo.node0.Active(file)
      2228 =C2=B1 92%    +137.1%       5285 =C2=B1 15%    +118.7%       487=
4 =C2=B1 19%  numa-meminfo.node0.AnonHugePages
    197699 =C2=B1  2%      +1.6%     200772 =C2=B1  0%     +23.9%     24504=
2 =C2=B1  0%  numa-meminfo.node0.Inactive
    192790 =C2=B1  1%      -0.6%     191611 =C2=B1  0%     +22.3%     23584=
9 =C2=B1  0%  numa-meminfo.node0.Inactive(file)
     73589 =C2=B1  4%     -12.5%      64393 =C2=B1  2%      -1.3%      7266=
4 =C2=B1  2%  numa-meminfo.node0.SUnreclaim
     27438 =C2=B1 83%    +102.6%      55585 =C2=B1  6%     +83.0%      5022=
3 =C2=B1  0%  numa-meminfo.node0.Shmem
    101051 =C2=B1  3%     -10.9%      90044 =C2=B1  2%      -1.2%      9986=
3 =C2=B1  2%  numa-meminfo.node0.Slab
     89204 =C2=B1 25%     -25.3%      66594 =C2=B1  4%     -77.6%      1995=
4 =C2=B1  4%  numa-meminfo.node1.Active
     52306 =C2=B1  3%      -2.3%      51117 =C2=B1  4%     -85.9%       738=
0 =C2=B1  0%  numa-meminfo.node1.Active(file)
    194864 =C2=B1  2%      -1.6%     191824 =C2=B1  1%     +21.3%     23637=
2 =C2=B1  0%  numa-meminfo.node1.Inactive
      4742 =C2=B1 86%     -89.2%     511.75 =C2=B1 41%     -90.9%     430.0=
0 =C2=B1 60%  numa-meminfo.node1.Inactive(anon)
    190121 =C2=B1  1%      +0.6%     191311 =C2=B1  1%     +24.1%     23594=
2 =C2=B1  0%  numa-meminfo.node1.Inactive(file)
     69844 =C2=B1  4%     -11.8%      61579 =C2=B1  3%      -1.9%      6852=
1 =C2=B1  3%  numa-meminfo.node1.SUnreclaim
     12430 =C2=B1  4%      +2.1%      12693 =C2=B1  3%     -85.2%       183=
9 =C2=B1  0%  numa-vmstat.node0.nr_active_file
     48197 =C2=B1  1%      -0.6%      47902 =C2=B1  0%     +22.3%      5896=
2 =C2=B1  0%  numa-vmstat.node0.nr_inactive_file
      6857 =C2=B1 83%    +102.8%      13905 =C2=B1  6%     +83.1%      1255=
9 =C2=B1  0%  numa-vmstat.node0.nr_shmem
     18395 =C2=B1  4%     -12.4%      16121 =C2=B1  2%      -1.1%      1818=
7 =C2=B1  2%  numa-vmstat.node0.nr_slab_unreclaimable
    675569 =C2=B1  3%     +12.7%     761135 =C2=B1  4%     +18.8%     80272=
6 =C2=B1  4%  numa-vmstat.node0.numa_local
     71537 =C2=B1  5%      -7.9%      65920 =C2=B1  2%    -100.0%       0.2=
5 =C2=B1173%  numa-vmstat.node0.numa_other
     13076 =C2=B1  3%      -2.3%      12778 =C2=B1  4%     -85.9%       184=
4 =C2=B1  0%  numa-vmstat.node1.nr_active_file
      1187 =C2=B1 86%     -89.3%     127.50 =C2=B1 41%     -91.0%     107.2=
5 =C2=B1 60%  numa-vmstat.node1.nr_inactive_anon
     47530 =C2=B1  1%      +0.6%      47827 =C2=B1  1%     +24.1%      5898=
5 =C2=B1  0%  numa-vmstat.node1.nr_inactive_file
     17456 =C2=B1  4%     -11.7%      15405 =C2=B1  3%      -1.9%      1712=
7 =C2=B1  3%  numa-vmstat.node1.nr_slab_unreclaimable
    695848 =C2=B1  3%     +14.9%     799683 =C2=B1  5%      +4.7%     72836=
8 =C2=B1  3%  numa-vmstat.node1.numa_hit
    677405 =C2=B1  4%     +14.5%     775903 =C2=B1  6%      +7.5%     72836=
8 =C2=B1  3%  numa-vmstat.node1.numa_local
     18442 =C2=B1 19%     +28.9%      23779 =C2=B1  5%    -100.0%       0.0=
0 =C2=B1 -1%  numa-vmstat.node1.numa_other
     25508 =C2=B1  0%      -0.1%      25473 =C2=B1  1%     -85.6%       368=
4 =C2=B1  0%  proc-vmstat.nr_active_file
     95727 =C2=B1  0%      +0.0%      95730 =C2=B1  0%     +23.2%     11794=
7 =C2=B1  0%  proc-vmstat.nr_inactive_file
     35841 =C2=B1  0%     -12.0%      31543 =C2=B1  0%      -1.5%      3529=
8 =C2=B1  0%  proc-vmstat.nr_slab_unreclaimable
    154090 =C2=B1  2%     +43.1%     220509 =C2=B1  3%     +23.5%     19028=
4 =C2=B1  0%  proc-vmstat.numa_hint_faults
    129240 =C2=B1  2%     +47.4%     190543 =C2=B1  3%     +15.1%     14873=
3 =C2=B1  1%  proc-vmstat.numa_hint_faults_local
   2238386 =C2=B1  1%     +18.4%    2649737 =C2=B1  2%     +15.8%    259119=
7 =C2=B1  0%  proc-vmstat.numa_hit
   2232163 =C2=B1  1%     +18.4%    2643105 =C2=B1  2%     +16.1%    259119=
5 =C2=B1  0%  proc-vmstat.numa_local
      6223 =C2=B1  0%      +6.6%       6632 =C2=B1 10%    -100.0%       1.2=
5 =C2=B1 34%  proc-vmstat.numa_other
     22315 =C2=B1  1%     -21.0%      17625 =C2=B1  5%      -0.4%      2223=
4 =C2=B1  0%  proc-vmstat.numa_pages_migrated
    154533 =C2=B1  2%     +45.6%     225071 =C2=B1  3%     +25.7%     19423=
5 =C2=B1  0%  proc-vmstat.numa_pte_updates
     14224 =C2=B1  0%      +5.5%      15006 =C2=B1  3%     -17.8%      1168=
9 =C2=B1  0%  proc-vmstat.pgactivate
    382980 =C2=B1  2%     +33.2%     510157 =C2=B1  4%     +22.0%     46735=
8 =C2=B1  0%  proc-vmstat.pgalloc_dma32
   7311738 =C2=B1  2%     +37.2%   10029060 =C2=B1  2%     +28.2%    937474=
0 =C2=B1  0%  proc-vmstat.pgalloc_normal
   7672040 =C2=B1  2%     +37.1%   10519738 =C2=B1  2%     +28.0%    982302=
6 =C2=B1  0%  proc-vmstat.pgfree
     22315 =C2=B1  1%     -21.0%      17625 =C2=B1  5%      -0.4%      2223=
4 =C2=B1  0%  proc-vmstat.pgmigrate_success
    720.75 =C2=B1  3%     -11.3%     639.50 =C2=B1  1%     -29.2%     510.0=
0 =C2=B1  0%  slabinfo.RAW.active_objs
    720.75 =C2=B1  3%     -11.3%     639.50 =C2=B1  1%     -29.2%     510.0=
0 =C2=B1  0%  slabinfo.RAW.num_objs
      5487 =C2=B1  6%     -12.6%       4797 =C2=B1  4%    -100.0%       0.0=
0 =C2=B1 -1%  slabinfo.UNIX.active_objs
    164.50 =C2=B1  5%     -12.3%     144.25 =C2=B1  4%    -100.0%       0.0=
0 =C2=B1 -1%  slabinfo.UNIX.active_slabs
      5609 =C2=B1  5%     -12.2%       4926 =C2=B1  4%    -100.0%       0.0=
0 =C2=B1 -1%  slabinfo.UNIX.num_objs
    164.50 =C2=B1  5%     -12.3%     144.25 =C2=B1  4%    -100.0%       0.0=
0 =C2=B1 -1%  slabinfo.UNIX.num_slabs
      4362 =C2=B1  4%     +14.6%       4998 =C2=B1  2%      -3.2%       422=
3 =C2=B1  4%  slabinfo.cred_jar.active_objs
      4362 =C2=B1  4%     +14.6%       4998 =C2=B1  2%      -3.2%       422=
3 =C2=B1  4%  slabinfo.cred_jar.num_objs
      2904 =C2=B1  4%      -2.7%       2825 =C2=B1  1%     +56.5%       454=
5 =C2=B1  2%  slabinfo.kmalloc-1024.active_objs
      2935 =C2=B1  2%      -0.5%       2920 =C2=B1  1%     +57.8%       463=
3 =C2=B1  2%  slabinfo.kmalloc-1024.num_objs
     42525 =C2=B1  0%     -41.6%      24824 =C2=B1  3%      +7.3%      4562=
1 =C2=B1  0%  slabinfo.kmalloc-256.active_objs
    845.50 =C2=B1  0%     -42.9%     482.50 =C2=B1  3%      +3.0%     870.5=
0 =C2=B1  0%  slabinfo.kmalloc-256.active_slabs
     54124 =C2=B1  0%     -42.9%      30920 =C2=B1  3%      +3.0%      5575=
5 =C2=B1  0%  slabinfo.kmalloc-256.num_objs
    845.50 =C2=B1  0%     -42.9%     482.50 =C2=B1  3%      +3.0%     870.5=
0 =C2=B1  0%  slabinfo.kmalloc-256.num_slabs
     47204 =C2=B1  0%     -37.9%      29335 =C2=B1  2%      +6.6%      5033=
4 =C2=B1  0%  slabinfo.kmalloc-512.active_objs
    915.25 =C2=B1  0%     -39.8%     551.00 =C2=B1  3%      +2.8%     940.5=
0 =C2=B1  0%  slabinfo.kmalloc-512.active_slabs
     58599 =C2=B1  0%     -39.8%      35300 =C2=B1  3%      +2.8%      6022=
4 =C2=B1  0%  slabinfo.kmalloc-512.num_objs
    915.25 =C2=B1  0%     -39.8%     551.00 =C2=B1  3%      +2.8%     940.5=
0 =C2=B1  0%  slabinfo.kmalloc-512.num_slabs
     12443 =C2=B1  2%     -20.1%       9944 =C2=B1  3%      -6.5%      1163=
9 =C2=B1  1%  slabinfo.pid.active_objs
     12443 =C2=B1  2%     -20.1%       9944 =C2=B1  3%      -6.5%      1163=
9 =C2=B1  1%  slabinfo.pid.num_objs
    440.00 =C2=B1  5%     -32.8%     295.75 =C2=B1  4%     -11.7%     388.5=
0 =C2=B1  7%  slabinfo.taskstats.active_objs
    440.00 =C2=B1  5%     -32.8%     295.75 =C2=B1  4%     -11.7%     388.5=
0 =C2=B1  7%  slabinfo.taskstats.num_objs
    188235 =C2=B1 74%     +62.9%     306699 =C2=B1 27%     -98.6%       262=
7 =C2=B1 40%  sched_debug.cfs_rq:/.MIN_vruntime.avg
   7146629 =C2=B1 80%     +27.7%    9122933 =C2=B1 36%     -98.6%      9826=
1 =C2=B1 36%  sched_debug.cfs_rq:/.MIN_vruntime.max
   1117852 =C2=B1 77%     +44.7%    1617052 =C2=B1 31%     -98.6%      1554=
8 =C2=B1 37%  sched_debug.cfs_rq:/.MIN_vruntime.stddev
     61.52 =C2=B1116%     -70.6%      18.11 =C2=B1  6%  +1.2e+06%     71873=
6 =C2=B1  1%  sched_debug.cfs_rq:/.load.avg
      2144 =C2=B1161%     -96.3%      79.41 =C2=B1 48%  +49309.2%    105941=
1 =C2=B1  3%  sched_debug.cfs_rq:/.load.max
    312.45 =C2=B1157%     -94.8%      16.29 =C2=B1 33%  +1.1e+05%     33310=
6 =C2=B1  5%  sched_debug.cfs_rq:/.load.stddev
     20.46 =C2=B1  4%      +9.0%      22.31 =C2=B1  6%   +3004.0%     635.1=
5 =C2=B1  1%  sched_debug.cfs_rq:/.load_avg.avg
     81.57 =C2=B1 32%     +14.2%      93.18 =C2=B1 26%   +1035.5%     926.1=
8 =C2=B1  3%  sched_debug.cfs_rq:/.load_avg.max
      8.14 =C2=B1  5%      -2.8%       7.91 =C2=B1  3%   +2585.8%     218.5=
2 =C2=B1 13%  sched_debug.cfs_rq:/.load_avg.min
     13.90 =C2=B1 29%     +16.9%      16.25 =C2=B1 22%   +1089.3%     165.3=
4 =C2=B1  5%  sched_debug.cfs_rq:/.load_avg.stddev
    188235 =C2=B1 74%     +62.9%     306699 =C2=B1 27%     -98.6%       262=
7 =C2=B1 40%  sched_debug.cfs_rq:/.max_vruntime.avg
   7146629 =C2=B1 80%     +27.7%    9122933 =C2=B1 36%     -98.6%      9826=
1 =C2=B1 36%  sched_debug.cfs_rq:/.max_vruntime.max
   1117852 =C2=B1 77%     +44.7%    1617052 =C2=B1 31%     -98.6%      1554=
8 =C2=B1 37%  sched_debug.cfs_rq:/.max_vruntime.stddev
  29491781 =C2=B1  0%      -4.8%   28074842 =C2=B1  1%     -99.0%     29542=
6 =C2=B1  0%  sched_debug.cfs_rq:/.min_vruntime.avg
  31241540 =C2=B1  0%      -5.8%   29418054 =C2=B1  0%     -99.0%     32073=
4 =C2=B1  0%  sched_debug.cfs_rq:/.min_vruntime.max
  27849652 =C2=B1  0%      -3.7%   26821072 =C2=B1  2%     -99.0%     27555=
0 =C2=B1  0%  sched_debug.cfs_rq:/.min_vruntime.min
    861989 =C2=B1  3%     -20.2%     687639 =C2=B1 22%     -98.3%      1458=
6 =C2=B1  2%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.27 =C2=B1  5%     -56.3%       0.12 =C2=B1 30%     +27.5%       0.3=
4 =C2=B1  6%  sched_debug.cfs_rq:/.nr_running.stddev
     16.51 =C2=B1  1%      +9.5%      18.08 =C2=B1  3%   +3343.1%     568.6=
1 =C2=B1  2%  sched_debug.cfs_rq:/.runnable_load_avg.avg
     34.80 =C2=B1 13%     +15.0%      40.02 =C2=B1 19%   +2514.0%     909.5=
7 =C2=B1  0%  sched_debug.cfs_rq:/.runnable_load_avg.max
      0.05 =C2=B1100%   +7950.0%       3.66 =C2=B1 48%   +3250.0%       1.5=
2 =C2=B1 89%  sched_debug.cfs_rq:/.runnable_load_avg.min
      7.18 =C2=B1  9%      -0.1%       7.18 =C2=B1 13%   +3571.2%     263.6=
8 =C2=B1  4%  sched_debug.cfs_rq:/.runnable_load_avg.stddev
   -740916 =C2=B1-28%    -158.5%     433310 =C2=B1120%     -96.8%     -2357=
9 =C2=B1 -5%  sched_debug.cfs_rq:/.spread0.avg
   1009940 =C2=B1 19%     +75.8%    1775442 =C2=B1 30%     -99.8%       173=
6 =C2=B1164%  sched_debug.cfs_rq:/.spread0.max
  -2384171 =C2=B1 -7%     -65.7%    -818684 =C2=B1-76%     -98.2%     -4345=
6 =C2=B1 -4%  sched_debug.cfs_rq:/.spread0.min
    862765 =C2=B1  3%     -20.4%     686825 =C2=B1 22%     -98.3%      1459=
1 =C2=B1  2%  sched_debug.cfs_rq:/.spread0.stddev
    749.14 =C2=B1  1%     +13.0%     846.34 =C2=B1  1%     -41.1%     441.0=
5 =C2=B1  5%  sched_debug.cfs_rq:/.util_avg.min
     51.66 =C2=B1  4%     -36.3%      32.92 =C2=B1  5%    +150.6%     129.4=
6 =C2=B1  6%  sched_debug.cfs_rq:/.util_avg.stddev
    161202 =C2=B1  7%     -41.7%      93997 =C2=B1  4%    +147.7%     39934=
2 =C2=B1  1%  sched_debug.cpu.avg_idle.avg
    595158 =C2=B1  6%     -51.2%     290491 =C2=B1 22%     +37.8%     82012=
0 =C2=B1  0%  sched_debug.cpu.avg_idle.max
      7658 =C2=B1 51%      +9.2%       8366 =C2=B1 26%    +114.4%      1642=
3 =C2=B1 31%  sched_debug.cpu.avg_idle.min
    132760 =C2=B1  8%     -58.8%      54718 =C2=B1 19%     +97.8%     26260=
8 =C2=B1  0%  sched_debug.cpu.avg_idle.stddev
     11.40 =C2=B1 11%    +111.0%      24.05 =C2=B1 16%     -58.1%       4.7=
8 =C2=B1  3%  sched_debug.cpu.clock.stddev
     11.40 =C2=B1 11%    +111.0%      24.05 =C2=B1 16%     -58.1%       4.7=
8 =C2=B1  3%  sched_debug.cpu.clock_task.stddev
     16.59 =C2=B1  1%      +7.7%      17.86 =C2=B1  2%   +3099.8%     530.7=
3 =C2=B1  2%  sched_debug.cpu.cpu_load[0].avg
     32.34 =C2=B1  2%     +23.9%      40.07 =C2=B1 19%   +2715.0%     910.4=
1 =C2=B1  0%  sched_debug.cpu.cpu_load[0].max
      0.34 =C2=B1103%    +520.0%       2.11 =C2=B1 67%    +140.0%       0.8=
2 =C2=B1110%  sched_debug.cpu.cpu_load[0].min
      6.87 =C2=B1  3%      +8.0%       7.42 =C2=B1 13%   +4228.9%     297.5=
0 =C2=B1  3%  sched_debug.cpu.cpu_load[0].stddev
     16.56 =C2=B1  0%      +8.1%      17.91 =C2=B1  2%   +3703.9%     630.0=
4 =C2=B1  1%  sched_debug.cpu.cpu_load[1].avg
     32.18 =C2=B1  2%     +22.7%      39.50 =C2=B1 17%   +2728.5%     910.2=
5 =C2=B1  0%  sched_debug.cpu.cpu_load[1].max
      3.32 =C2=B1  8%     +84.9%       6.14 =C2=B1 12%   +5364.4%     181.3=
2 =C2=B1  9%  sched_debug.cpu.cpu_load[1].min
      6.14 =C2=B1  5%     +12.5%       6.91 =C2=B1 13%   +2708.6%     172.5=
6 =C2=B1  5%  sched_debug.cpu.cpu_load[1].stddev
     16.75 =C2=B1  1%      +7.6%      18.02 =C2=B1  2%   +3646.9%     627.6=
9 =C2=B1  1%  sched_debug.cpu.cpu_load[2].avg
     33.25 =C2=B1  7%     +16.5%      38.75 =C2=B1 14%   +2634.1%     909.0=
9 =C2=B1  0%  sched_debug.cpu.cpu_load[2].max
      5.39 =C2=B1  7%     +36.3%       7.34 =C2=B1  4%   +3547.3%     196.4=
5 =C2=B1 11%  sched_debug.cpu.cpu_load[2].min
      5.95 =C2=B1  9%     +11.8%       6.65 =C2=B1 11%   +2752.1%     169.7=
3 =C2=B1  5%  sched_debug.cpu.cpu_load[2].stddev
     17.17 =C2=B1  1%      +6.1%      18.22 =C2=B1  2%   +3552.1%     626.9=
6 =C2=B1  1%  sched_debug.cpu.cpu_load[3].avg
     33.20 =C2=B1  7%     +14.6%      38.05 =C2=B1  9%   +2631.3%     906.9=
3 =C2=B1  0%  sched_debug.cpu.cpu_load[3].max
      6.93 =C2=B1  7%     +10.5%       7.66 =C2=B1  1%   +2766.9%     198.7=
3 =C2=B1 11%  sched_debug.cpu.cpu_load[3].min
      5.70 =C2=B1  9%     +13.9%       6.49 =C2=B1  8%   +2825.6%     166.7=
3 =C2=B1  5%  sched_debug.cpu.cpu_load[3].stddev
     17.49 =C2=B1  0%      +4.9%      18.36 =C2=B1  2%   +3482.1%     626.6=
4 =C2=B1  1%  sched_debug.cpu.cpu_load[4].avg
     33.18 =C2=B1  3%     +14.0%      37.82 =C2=B1  5%   +2615.8%     901.1=
6 =C2=B1  0%  sched_debug.cpu.cpu_load[4].max
      7.66 =C2=B1  8%      +0.9%       7.73 =C2=B1  1%   +2568.8%     204.4=
1 =C2=B1 11%  sched_debug.cpu.cpu_load[4].min
      5.56 =C2=B1  6%     +16.2%       6.45 =C2=B1  6%   +2814.9%     161.9=
6 =C2=B1  6%  sched_debug.cpu.cpu_load[4].stddev
     16741 =C2=B1  0%     -15.4%      14166 =C2=B1  2%     -13.0%      1456=
4 =C2=B1  2%  sched_debug.cpu.curr->pid.avg
     19196 =C2=B1  0%     -18.3%      15690 =C2=B1  1%      -4.9%      1825=
5 =C2=B1  0%  sched_debug.cpu.curr->pid.max
      5174 =C2=B1  5%     -55.4%       2305 =C2=B1 14%     +19.3%       617=
3 =C2=B1  6%  sched_debug.cpu.curr->pid.stddev
     18.60 =C2=B1  5%      -2.7%      18.10 =C2=B1  6%  +3.9e+06%     71764=
6 =C2=B1  2%  sched_debug.cpu.load.avg
     81.23 =C2=B1 48%      -2.4%      79.30 =C2=B1 47%  +1.3e+06%    105934=
0 =C2=B1  3%  sched_debug.cpu.load.max
     18.01 =C2=B1 28%      -9.4%      16.32 =C2=B1 33%  +1.9e+06%     33343=
6 =C2=B1  5%  sched_debug.cpu.load.stddev
      0.00 =C2=B1  2%     +29.8%       0.00 =C2=B1 33%     +39.0%       0.0=
0 =C2=B1 15%  sched_debug.cpu.next_balance.stddev
      1410 =C2=B1  1%     -14.2%       1210 =C2=B1  6%     +34.5%       189=
6 =C2=B1  1%  sched_debug.cpu.nr_load_updates.stddev
      9.95 =C2=B1  3%     -14.5%       8.51 =C2=B1  5%      -1.2%       9.8=
3 =C2=B1  2%  sched_debug.cpu.nr_running.avg
     29.07 =C2=B1  2%     -15.0%      24.70 =C2=B1  4%     +37.5%      39.9=
8 =C2=B1  1%  sched_debug.cpu.nr_running.max
      0.05 =C2=B1100%    +850.0%       0.43 =C2=B1 37%    -100.0%       0.0=
0 =C2=B1 -1%  sched_debug.cpu.nr_running.min
      7.64 =C2=B1  3%     -23.0%       5.88 =C2=B1  2%     +48.6%      11.3=
6 =C2=B1  2%  sched_debug.cpu.nr_running.stddev
  10979930 =C2=B1  1%    +123.3%   24518490 =C2=B1  2%     -26.3%    809166=
9 =C2=B1  1%  sched_debug.cpu.nr_switches.avg
  12350130 =C2=B1  1%    +117.5%   26856375 =C2=B1  2%     -17.0%   1024908=
1 =C2=B1  2%  sched_debug.cpu.nr_switches.max
   9594835 =C2=B1  2%    +132.6%   22314436 =C2=B1  2%     -31.0%    662097=
5 =C2=B1  2%  sched_debug.cpu.nr_switches.min
    769296 =C2=B1  1%     +56.8%    1206190 =C2=B1  3%     +54.6%    118917=
2 =C2=B1  1%  sched_debug.cpu.nr_switches.stddev
      8.30 =C2=B1 18%     +32.9%      11.02 =C2=B1 15%    +113.7%      17.7=
3 =C2=B1 26%  sched_debug.cpu.nr_uninterruptible.max
      4.87 =C2=B1 15%     +14.3%       5.57 =C2=B1  6%     +97.2%       9.6=
1 =C2=B1 29%  sched_debug.cpu.nr_uninterruptible.stddev

--===============0621806813355877558==--

