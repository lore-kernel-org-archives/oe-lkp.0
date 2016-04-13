Content-Type: multipart/mixed; boundary="===============8876560530828818865=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [sched/fair] 9e7474b13a: hackbench.throughput -16.6% regression
Date: Wed, 13 Apr 2016 10:09:20 +0800
Message-ID: <20160413020920.GE659@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8876560530828818865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed that hackbench.throughput -16.6% regression on

git://bee.sh.intel.com/git/ydu19/tip flat_hierarchy_v1.6
commit 9e7474b13a96cdfcea6f8ea7f8810d05747fa254 ("sched/fair: Drop out inco=
mplete current period when sched averages accrue")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/ipc/kconfig/mode/nr_threads/rootfs/tbox_group/tes=
tcase:
  gcc-4.9/performance/socket/x86_64-rhel/process/1600%/debian-x86_64-2015-0=
2-07.cgz/lkp-ivb-d02/hackbench

commit: =

  782fb955d6cce91ffc2089fc5a70c751e1581eff
  9e7474b13a96cdfcea6f8ea7f8810d05747fa254

782fb955d6cce91f 9e7474b13a96cdfcea6f8ea7f8 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     21304 =C2=B1  0%     -16.6%      17766 =C2=B1  0%  hackbench.throughput
   1445902 =C2=B1  5%   +4671.1%   68985956 =C2=B1  2%  hackbench.time.invo=
luntary_context_switches
   2664583 =C2=B1  1%     -16.6%    2221049 =C2=B1  0%  hackbench.time.mino=
r_page_faults
    397.00 =C2=B1  0%      -1.9%     389.50 =C2=B1  0%  hackbench.time.perc=
ent_of_cpu_this_job_got
      2339 =C2=B1  1%      -3.6%       2254 =C2=B1  0%  hackbench.time.syst=
em_time
    104.41 =C2=B1  1%     +19.7%     124.97 =C2=B1  1%  hackbench.time.user=
_time
  23025389 =C2=B1  1%    +556.0%  1.511e+08 =C2=B1  3%  hackbench.time.volu=
ntary_context_switches
     63.91 =C2=B1  2%     +75.1%     111.89 =C2=B1  5%  uptime.idle
    104525 =C2=B1  2%    +146.5%     257698 =C2=B1  4%  softirqs.RCU
     20353 =C2=B1  0%    +238.1%      68818 =C2=B1  7%  softirqs.SCHED
     99.55 =C2=B1  0%      -1.5%      98.03 =C2=B1  0%  turbostat.%Busy
      3277 =C2=B1  0%      -1.5%       3227 =C2=B1  0%  turbostat.Avg_MHz
      0.32 =C2=B1  2%    +474.0%       1.82 =C2=B1 12%  turbostat.CPU%c1
    326.50 =C2=B1  3%     +13.5%     370.50 =C2=B1  4%  vmstat.procs.r
     41166 =C2=B1  0%    +796.8%     369158 =C2=B1  2%  vmstat.system.cs
      4526 =C2=B1  0%    +905.2%      45500 =C2=B1  5%  vmstat.system.in
   1445902 =C2=B1  5%   +4671.1%   68985956 =C2=B1  2%  time.involuntary_co=
ntext_switches
   2664583 =C2=B1  1%     -16.6%    2221049 =C2=B1  0%  time.minor_page_fau=
lts
    104.41 =C2=B1  1%     +19.7%     124.97 =C2=B1  1%  time.user_time
  23025389 =C2=B1  1%    +556.0%  1.511e+08 =C2=B1  3%  time.voluntary_cont=
ext_switches
   3173807 =C2=B1  2%    +865.0%   30626136 =C2=B1 13%  cpuidle.C1-IVB.time
    144740 =C2=B1  2%   +2444.9%    3683489 =C2=B1  7%  cpuidle.C1-IVB.usage
    598777 =C2=B1 15%   +1035.1%    6797017 =C2=B1 20%  cpuidle.C1E-IVB.time
      2920 =C2=B1 10%   +3484.9%     104697 =C2=B1 15%  cpuidle.C1E-IVB.usa=
ge
    266669 =C2=B1 31%   +1008.5%    2955953 =C2=B1  9%  cpuidle.C3-IVB.time
    464.50 =C2=B1 12%   +5824.3%      27518 =C2=B1 12%  cpuidle.C3-IVB.usage
   7113307 =C2=B1  1%      +8.2%    7697261 =C2=B1  4%  cpuidle.C6-IVB.time
      2109 =C2=B1  5%   +1144.2%      26240 =C2=B1 17%  cpuidle.C6-IVB.usage
     96.50 =C2=B1 19%   +5163.7%       5079 =C2=B1 14%  cpuidle.POLL.usage
    212531 =C2=B1  0%     -11.3%     188498 =C2=B1  0%  meminfo.Active
    115472 =C2=B1  0%     -20.8%      91406 =C2=B1  0%  meminfo.Active(anon)
      3998 =C2=B1  0%     +25.9%       5035 =C2=B1 19%  meminfo.AnonHugePag=
es
    110735 =C2=B1  0%     -21.8%      86579 =C2=B1  0%  meminfo.AnonPages
    909871 =C2=B1  0%     -25.0%     682060 =C2=B1  0%  meminfo.Committed_AS
     89268 =C2=B1  5%     -16.1%      74932 =C2=B1 10%  meminfo.DirectMap4k
     41189 =C2=B1  0%     -29.1%      29223 =C2=B1  1%  meminfo.KernelStack
     81962 =C2=B1  1%     -26.4%      60283 =C2=B1  1%  meminfo.PageTables
    118988 =C2=B1  0%     -11.3%     105536 =C2=B1  3%  meminfo.SUnreclaim
     28902 =C2=B1  0%     -20.9%      22867 =C2=B1  2%  proc-vmstat.nr_acti=
ve_anon
     27723 =C2=B1  0%     -21.8%      21674 =C2=B1  2%  proc-vmstat.nr_anon=
_pages
      2574 =C2=B1  0%     -29.4%       1818 =C2=B1  2%  proc-vmstat.nr_kern=
el_stack
     20539 =C2=B1  1%     -26.8%      15042 =C2=B1  2%  proc-vmstat.nr_page=
_table_pages
     29910 =C2=B1  0%     -12.0%      26327 =C2=B1  2%  proc-vmstat.nr_slab=
_unreclaimable
   4052339 =C2=B1  0%      +9.0%    4417446 =C2=B1  3%  proc-vmstat.numa_hit
   4052339 =C2=B1  0%      +9.0%    4417446 =C2=B1  3%  proc-vmstat.numa_lo=
cal
   2220692 =C2=B1  0%     +11.0%    2465866 =C2=B1  3%  proc-vmstat.pgalloc=
_dma32
   2946666 =C2=B1  0%     +11.7%    3292537 =C2=B1  4%  proc-vmstat.pgalloc=
_normal
   5127274 =C2=B1  0%     +12.0%    5744648 =C2=B1  3%  proc-vmstat.pgfree
      2595 =C2=B1  0%     -18.3%       2119 =C2=B1  2%  slabinfo.UNIX.activ=
e_objs
      2643 =C2=B1  0%     -15.1%       2244 =C2=B1  2%  slabinfo.UNIX.num_o=
bjs
     38429 =C2=B1  0%     -23.4%      29446 =C2=B1  1%  slabinfo.anon_vma.a=
ctive_objs
    770.75 =C2=B1  0%     -22.1%     600.25 =C2=B1  1%  slabinfo.anon_vma.a=
ctive_slabs
     39320 =C2=B1  0%     -22.1%      30646 =C2=B1  1%  slabinfo.anon_vma.n=
um_objs
    770.75 =C2=B1  0%     -22.1%     600.25 =C2=B1  1%  slabinfo.anon_vma.n=
um_slabs
     78807 =C2=B1  0%     -24.0%      59899 =C2=B1  1%  slabinfo.anon_vma_c=
hain.active_objs
      1410 =C2=B1  0%     -27.7%       1020 =C2=B1  1%  slabinfo.anon_vma_c=
hain.active_slabs
     90271 =C2=B1  0%     -27.7%      65306 =C2=B1  1%  slabinfo.anon_vma_c=
hain.num_objs
      1410 =C2=B1  0%     -27.7%       1020 =C2=B1  1%  slabinfo.anon_vma_c=
hain.num_slabs
      3511 =C2=B1  1%     -21.3%       2762 =C2=B1  5%  slabinfo.cred_jar.a=
ctive_objs
      3593 =C2=B1  1%     -13.9%       3095 =C2=B1  6%  slabinfo.cred_jar.n=
um_objs
      2632 =C2=B1  0%     -21.1%       2077 =C2=B1  2%  slabinfo.files_cach=
e.active_objs
      2743 =C2=B1  0%     -17.2%       2271 =C2=B1  2%  slabinfo.files_cach=
e.num_objs
     25849 =C2=B1  2%     +18.1%      30516 =C2=B1  9%  slabinfo.kmalloc-25=
6.active_objs
     12200 =C2=B1  2%     -13.0%      10609 =C2=B1  3%  slabinfo.kmalloc-32=
.active_objs
     12375 =C2=B1  2%     -10.8%      11042 =C2=B1  3%  slabinfo.kmalloc-32=
.num_objs
     23380 =C2=B1  2%     +22.0%      28534 =C2=B1 10%  slabinfo.kmalloc-51=
2.active_objs
      2339 =C2=B1  0%     -23.7%       1785 =C2=B1  1%  slabinfo.mm_struct.=
active_objs
      2457 =C2=B1  0%     -18.9%       1992 =C2=B1  1%  slabinfo.mm_struct.=
num_objs
      3822 =C2=B1  2%     -19.3%       3083 =C2=B1  4%  slabinfo.pid.active=
_objs
      3851 =C2=B1  2%     -15.7%       3246 =C2=B1  4%  slabinfo.pid.num_ob=
js
      2746 =C2=B1  0%     -27.5%       1992 =C2=B1  1%  slabinfo.sighand_ca=
che.active_objs
      2789 =C2=B1  0%     -22.2%       2171 =C2=B1  1%  slabinfo.sighand_ca=
che.num_objs
      2884 =C2=B1  1%     -25.8%       2140 =C2=B1  2%  slabinfo.signal_cac=
he.active_objs
      2957 =C2=B1  1%     -17.6%       2436 =C2=B1  2%  slabinfo.signal_cac=
he.num_objs
      2834 =C2=B1  1%     -18.3%       2315 =C2=B1  2%  slabinfo.sock_inode=
_cache.active_objs
      2898 =C2=B1  1%     -14.7%       2473 =C2=B1  2%  slabinfo.sock_inode=
_cache.num_objs
      2583 =C2=B1  0%     -29.3%       1827 =C2=B1  1%  slabinfo.task_struc=
t.active_objs
    871.75 =C2=B1  0%     -27.2%     634.75 =C2=B1  1%  slabinfo.task_struc=
t.active_slabs
      2616 =C2=B1  0%     -27.2%       1905 =C2=B1  1%  slabinfo.task_struc=
t.num_objs
    871.75 =C2=B1  0%     -27.2%     634.75 =C2=B1  1%  slabinfo.task_struc=
t.num_slabs
     58846 =C2=B1  0%     -24.6%      44372 =C2=B1  1%  slabinfo.vm_area_st=
ruct.active_objs
      2703 =C2=B1  0%     -23.8%       2059 =C2=B1  1%  slabinfo.vm_area_st=
ruct.active_slabs
     59480 =C2=B1  0%     -23.8%      45317 =C2=B1  1%  slabinfo.vm_area_st=
ruct.num_objs
      2703 =C2=B1  0%     -23.8%       2059 =C2=B1  1%  slabinfo.vm_area_st=
ruct.num_slabs
    219.62 =C2=B1  6%     -93.6%      14.05 =C2=B1 87%  sched_debug.cfs_rq:=
/.load.avg
    346.38 =C2=B1  5%     -85.3%      50.87 =C2=B1 96%  sched_debug.cfs_rq:=
/.load.max
     93.30 =C2=B1 13%     -98.4%       1.46 =C2=B1  5%  sched_debug.cfs_rq:=
/.load.min
     98.77 =C2=B1 10%     -78.3%      21.39 =C2=B1 98%  sched_debug.cfs_rq:=
/.load.stddev
    246.46 =C2=B1  1%  +2.4e+08%  5.814e+08 =C2=B1  9%  sched_debug.cfs_rq:=
/.load_avg.avg
    303.85 =C2=B1  1%  +3.6e+08%  1.085e+09 =C2=B1  6%  sched_debug.cfs_rq:=
/.load_avg.max
    196.45 =C2=B1  3%  +2.1e+07%   41566477 =C2=B1 53%  sched_debug.cfs_rq:=
/.load_avg.min
     42.48 =C2=B1  9%  +1.1e+09%  4.465e+08 =C2=B1  6%  sched_debug.cfs_rq:=
/.load_avg.stddev
   1583097 =C2=B1  0%   +9103.9%  1.457e+08 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.avg
   1713466 =C2=B1  1%   +8538.8%   1.48e+08 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.max
   1467468 =C2=B1  1%   +9678.3%  1.435e+08 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.min
     96088 =C2=B1  7%   +1771.4%    1798202 =C2=B1  8%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      0.90 =C2=B1  0%     -18.7%       0.73 =C2=B1  5%  sched_debug.cfs_rq:=
/.nr_running.min
      0.05 =C2=B1  6%    +185.2%       0.14 =C2=B1 10%  sched_debug.cfs_rq:=
/.nr_running.stddev
    232.55 =C2=B1  1%    +307.8%     948.36 =C2=B1  3%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
    284.23 =C2=B1  2%    +277.5%       1072 =C2=B1  4%  sched_debug.cfs_rq:=
/.runnable_load_avg.max
    185.32 =C2=B1  3%    +304.4%     749.38 =C2=B1  5%  sched_debug.cfs_rq:=
/.runnable_load_avg.min
     38.60 =C2=B1 14%    +265.7%     141.15 =C2=B1 10%  sched_debug.cfs_rq:=
/.runnable_load_avg.stddev
     92308 =C2=B1 63%   +2991.3%    2853566 =C2=B1 64%  sched_debug.cfs_rq:=
/.spread0.max
     95934 =C2=B1  8%   +1719.3%    1745323 =C2=B1  5%  sched_debug.cfs_rq:=
/.spread0.stddev
    976.67 =C2=B1  0%  +55897.0%     546905 =C2=B1  9%  sched_debug.cfs_rq:=
/.util_avg.avg
    996.95 =C2=B1  0%  +1.6e+05%    1639044 =C2=B1  8%  sched_debug.cfs_rq:=
/.util_avg.max
    962.65 =C2=B1  0%   +3676.2%      36352 =C2=B1 80%  sched_debug.cfs_rq:=
/.util_avg.min
     13.02 =C2=B1 20%    +5e+06%     652866 =C2=B1 13%  sched_debug.cfs_rq:=
/.util_avg.stddev
    678344 =C2=B1  4%     -55.6%     301114 =C2=B1 12%  sched_debug.cpu.avg=
_idle.avg
    867183 =C2=B1  3%     -30.0%     607019 =C2=B1 11%  sched_debug.cpu.avg=
_idle.max
    379599 =C2=B1 21%     -82.0%      68178 =C2=B1 30%  sched_debug.cpu.avg=
_idle.min
    608.49 =C2=B1 24%     -67.8%     195.73 =C2=B1 71%  sched_debug.cpu.clo=
ck.stddev
    608.49 =C2=B1 24%     -67.8%     195.73 =C2=B1 71%  sched_debug.cpu.clo=
ck_task.stddev
    233.04 =C2=B1  1%    +304.2%     941.96 =C2=B1  3%  sched_debug.cpu.cpu=
_load[0].avg
    284.62 =C2=B1  2%    +286.8%       1100 =C2=B1  4%  sched_debug.cpu.cpu=
_load[0].max
    186.27 =C2=B1  3%    +301.0%     747.05 =C2=B1 11%  sched_debug.cpu.cpu=
_load[0].min
     38.46 =C2=B1 13%    +320.5%     161.75 =C2=B1 35%  sched_debug.cpu.cpu=
_load[0].stddev
    233.17 =C2=B1  1%    +306.6%     948.11 =C2=B1  3%  sched_debug.cpu.cpu=
_load[1].avg
    284.43 =C2=B1  2%    +281.3%       1084 =C2=B1  2%  sched_debug.cpu.cpu=
_load[1].max
    186.80 =C2=B1  3%    +320.7%     785.93 =C2=B1 10%  sched_debug.cpu.cpu=
_load[1].min
     37.89 =C2=B1 14%    +217.5%     120.33 =C2=B1 28%  sched_debug.cpu.cpu=
_load[1].stddev
    233.45 =C2=B1  1%    +309.8%     956.68 =C2=B1  3%  sched_debug.cpu.cpu=
_load[2].avg
    284.12 =C2=B1  2%    +275.6%       1067 =C2=B1  1%  sched_debug.cpu.cpu=
_load[2].max
    187.70 =C2=B1  3%    +344.3%     833.88 =C2=B1  9%  sched_debug.cpu.cpu=
_load[2].min
     37.33 =C2=B1 13%    +142.6%      90.55 =C2=B1 27%  sched_debug.cpu.cpu=
_load[2].stddev
    233.83 =C2=B1  1%    +311.5%     962.18 =C2=B1  3%  sched_debug.cpu.cpu=
_load[3].avg
    283.65 =C2=B1  2%    +269.3%       1047 =C2=B1  0%  sched_debug.cpu.cpu=
_load[3].max
    188.57 =C2=B1  2%    +362.2%     871.56 =C2=B1  8%  sched_debug.cpu.cpu=
_load[3].min
     36.68 =C2=B1 12%     +85.5%      68.05 =C2=B1 35%  sched_debug.cpu.cpu=
_load[3].stddev
    234.28 =C2=B1  1%    +312.8%     967.05 =C2=B1  3%  sched_debug.cpu.cpu=
_load[4].avg
    283.02 =C2=B1  1%    +264.7%       1032 =C2=B1  0%  sched_debug.cpu.cpu=
_load[4].max
    189.33 =C2=B1  2%    +374.4%     898.18 =C2=B1  7%  sched_debug.cpu.cpu=
_load[4].min
     14599 =C2=B1  3%     -22.6%      11300 =C2=B1 12%  sched_debug.cpu.cur=
r->pid.min
    817.23 =C2=B1 24%    +234.2%       2731 =C2=B1 29%  sched_debug.cpu.cur=
r->pid.stddev
    225.26 =C2=B1  3%     -90.9%      20.47 =C2=B1103%  sched_debug.cpu.loa=
d.avg
    365.90 =C2=B1  7%     -86.1%      50.87 =C2=B1 96%  sched_debug.cpu.loa=
d.max
     89.80 =C2=B1 13%     -98.3%       1.56 =C2=B1  9%  sched_debug.cpu.loa=
d.min
    107.38 =C2=B1 10%     -78.5%      23.08 =C2=B1100%  sched_debug.cpu.loa=
d.stddev
      0.00 =C2=B1 24%     -64.3%       0.00 =C2=B1 63%  sched_debug.cpu.nex=
t_balance.stddev
     27.88 =C2=B1  4%    +163.8%      73.56 =C2=B1 22%  sched_debug.cpu.nr_=
running.avg
     48.08 =C2=B1  6%    +334.9%     209.07 =C2=B1 25%  sched_debug.cpu.nr_=
running.max
      9.85 =C2=B1 17%     -63.8%       3.56 =C2=B1 36%  sched_debug.cpu.nr_=
running.min
     14.81 =C2=B1  8%    +477.7%      85.58 =C2=B1 27%  sched_debug.cpu.nr_=
running.stddev
   3038641 =C2=B1  1%    +736.8%   25428093 =C2=B1  5%  sched_debug.cpu.nr_=
switches.avg
   3155768 =C2=B1  2%   +1235.2%   42136256 =C2=B1  3%  sched_debug.cpu.nr_=
switches.max
   2947248 =C2=B1  1%    +361.9%   13612831 =C2=B1 10%  sched_debug.cpu.nr_=
switches.min
     80631 =C2=B1 42%  +13445.3%   10921737 =C2=B1  3%  sched_debug.cpu.nr_=
switches.stddev
     10.62 =C2=B1 47%    +406.5%      53.82 =C2=B1 16%  sched_debug.cpu.nr_=
uninterruptible.max
    -10.10 =C2=B1-54%    +198.4%     -30.13 =C2=B1-20%  sched_debug.cpu.nr_=
uninterruptible.min
      7.57 =C2=B1 48%    +333.0%      32.78 =C2=B1 17%  sched_debug.cpu.nr_=
uninterruptible.stddev
      0.86 =C2=B1  8%     +52.8%       1.31 =C2=B1  7%  perf-profile.cycles=
-pp.___slab_alloc.__slab_alloc.__kmalloc_node_track_caller.__kmalloc_reserv=
e.__alloc_skb
      0.96 =C2=B1  7%     +43.5%       1.37 =C2=B1  6%  perf-profile.cycles=
-pp.___slab_alloc.__slab_alloc.kmem_cache_alloc_node.__alloc_skb.alloc_skb_=
with_frags
     12.27 =C2=B1  1%     -10.7%      10.96 =C2=B1  3%  perf-profile.cycles=
-pp.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendm=
sg.sock_sendmsg
      3.03 =C2=B1  6%     +15.2%       3.49 =C2=B1  5%  perf-profile.cycles=
-pp.__kmalloc_node_track_caller.__kmalloc_reserve.__alloc_skb.alloc_skb_wit=
h_frags.sock_alloc_send_pskb
      3.64 =C2=B1  4%     +10.6%       4.03 =C2=B1  3%  perf-profile.cycles=
-pp.__kmalloc_reserve.isra.34.__alloc_skb.alloc_skb_with_frags.sock_alloc_s=
end_pskb.unix_stream_sendmsg
      2.25 =C2=B1-44%   +1469.4%      35.31 =C2=B1 11%  perf-profile.cycles=
-pp.__read_nocancel
      0.02 =C2=B1 57%   +3322.2%       0.77 =C2=B1 24%  perf-profile.cycles=
-pp.__schedule.schedule.exit_to_usermode_loop.syscall_return_slowpath.entry=
_SYSCALL_64_fastpath
      0.18 =C2=B1 14%   +1800.0%       3.52 =C2=B1  4%  perf-profile.cycles=
-pp.__schedule.schedule.schedule_timeout.unix_stream_read_generic.unix_stre=
am_recvmsg
      0.99 =C2=B1  8%     +46.0%       1.44 =C2=B1  7%  perf-profile.cycles=
-pp.__slab_alloc.__kmalloc_node_track_caller.__kmalloc_reserve.__alloc_skb.=
alloc_skb_with_frags
      1.09 =C2=B1  6%     +36.1%       1.49 =C2=B1  6%  perf-profile.cycles=
-pp.__slab_alloc.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.soc=
k_alloc_send_pskb
      1.19 =C2=B1  3%     +16.6%       1.39 =C2=B1  4%  perf-profile.cycles=
-pp.__slab_free.kfree.skb_release_data.skb_release_all.consume_skb
      1.09 =C2=B1  7%     +18.0%       1.29 =C2=B1  6%  perf-profile.cycles=
-pp.__slab_free.kmem_cache_free.kfree_skbmem.consume_skb.unix_stream_read_g=
eneric
     41.23 =C2=B1  2%     -71.4%      11.78 =C2=B1 26%  perf-profile.cycles=
-pp.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
      1.81 =C2=B1-55%   +1400.4%      27.16 =C2=B1 11%  perf-profile.cycles=
-pp.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath.__read_nocancel
     34.92 =C2=B1  2%     -66.8%      11.59 =C2=B1 26%  perf-profile.cycles=
-pp.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      0.50 =C2=B1170%   +4538.1%      23.42 =C2=B1 13%  perf-profile.cycles=
-pp.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath.__write_nocan=
cel
      0.10 =C2=B1 44%   +4797.4%       4.65 =C2=B1  3%  perf-profile.cycles=
-pp.__wake_up_common.__wake_up_sync_key.sock_def_readable.unix_stream_sendm=
sg.sock_sendmsg
      0.10 =C2=B1 42%   +4980.0%       5.08 =C2=B1  4%  perf-profile.cycles=
-pp.__wake_up_sync_key.sock_def_readable.unix_stream_sendmsg.sock_sendmsg.s=
ock_write_iter
      2.58 =C2=B1-38%   +1125.8%      31.62 =C2=B1 14%  perf-profile.cycles=
-pp.__write_nocancel
      0.21 =C2=B1 10%    +859.3%       2.06 =C2=B1  5%  perf-profile.cycles=
-pp.activate_task.ttwu_do_activate.try_to_wake_up.default_wake_function.aut=
oremove_wake_function
     13.01 =C2=B1  0%     -11.0%      11.57 =C2=B1  3%  perf-profile.cycles=
-pp.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_send=
msg.sock_write_iter
      0.08 =C2=B1 43%   +5369.7%       4.51 =C2=B1  3%  perf-profile.cycles=
-pp.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.sock_def_r=
eadable.unix_stream_sendmsg
      0.23 =C2=B1-434%    +255.4%       0.82 =C2=B1 18%  perf-profile.cycle=
s-pp.call_cpuidle.cpu_startup_entry.start_secondary
     14.78 =C2=B1  1%     -14.8%      12.60 =C2=B1  1%  perf-profile.cycles=
-pp.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.s=
ock_read_iter
      0.65 =C2=B1  6%     +68.3%       1.09 =C2=B1  7%  perf-profile.cycles=
-pp.copy_from_iter.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_sen=
dmsg.sock_write_iter
      0.61 =C2=B1 12%     +71.4%       1.05 =C2=B1  7%  perf-profile.cycles=
-pp.copy_to_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_=
read_generic.unix_stream_recvmsg
      0.47 =C2=B1  7%     +94.1%       0.91 =C2=B1 10%  perf-profile.cycles=
-pp.copy_user_enhanced_fast_string.skb_copy_datagram_from_iter.unix_stream_=
sendmsg.sock_sendmsg.sock_write_iter
      5.52 =C2=B1  5%     -17.5%       4.56 =C2=B1  2%  perf-profile.cycles=
-pp.copy_user_enhanced_fast_string.skb_copy_datagram_iter.unix_stream_read_=
actor.unix_stream_read_generic.unix_stream_recvmsg
      0.25 =C2=B1-400%    +321.0%       1.05 =C2=B1 22%  perf-profile.cycle=
s-pp.cpu_startup_entry.start_secondary
      0.03 =C2=B1 33%   +4784.6%       1.59 =C2=B1  6%  perf-profile.cycles=
-pp.deactivate_task.__schedule.schedule.schedule_timeout.unix_stream_read_g=
eneric
      0.08 =C2=B1 43%   +5260.6%       4.42 =C2=B1  3%  perf-profile.cycles=
-pp.default_wake_function.autoremove_wake_function.__wake_up_common.__wake_=
up_sync_key.sock_def_readable
      0.03 =C2=B1 40%   +3083.3%       0.96 =C2=B1 10%  perf-profile.cycles=
-pp.dequeue_entity.dequeue_task_fair.deactivate_task.__schedule.schedule
      0.04 =C2=B1 40%   +2916.7%       1.36 =C2=B1  7%  perf-profile.cycles=
-pp.dequeue_task_fair.deactivate_task.__schedule.schedule.schedule_timeout
      0.09 =C2=B1 27%   +1265.7%       1.20 =C2=B1  4%  perf-profile.cycles=
-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_=
wake_up
      0.17 =C2=B1 16%    +980.3%       1.78 =C2=B1  3%  perf-profile.cycles=
-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.default=
_wake_function
     98.48 =C2=B1  2%     -70.1%      29.47 =C2=B1 27%  perf-profile.cycles=
-pp.entry_SYSCALL_64_fastpath
      2.19 =C2=B1-45%   +1446.3%      33.87 =C2=B1 11%  perf-profile.cycles=
-pp.entry_SYSCALL_64_fastpath.__read_nocancel
      2.48 =C2=B1-40%   +1121.0%      30.28 =C2=B1 13%  perf-profile.cycles=
-pp.entry_SYSCALL_64_fastpath.__write_nocancel
      0.79 =C2=B1 22%     +30.3%       1.02 =C2=B1  6%  perf-profile.cycles=
-pp.file_has_perm.selinux_file_permission.security_file_permission.rw_verif=
y_area.vfs_write
      0.23 =C2=B1-434%    +370.7%       1.08 =C2=B1 22%  perf-profile.cycle=
s-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_=
entry
      2.25 =C2=B1  4%     +37.9%       3.10 =C2=B1  3%  perf-profile.cycles=
-pp.kfree.skb_release_data.skb_release_all.consume_skb.unix_stream_read_gen=
eric
      2.52 =C2=B1  2%     +17.3%       2.95 =C2=B1  4%  perf-profile.cycles=
-pp.kfree_skbmem.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.s=
ock_recvmsg
      2.40 =C2=B1  3%     +19.4%       2.87 =C2=B1  4%  perf-profile.cycles=
-pp.kmem_cache_free.kfree_skbmem.consume_skb.unix_stream_read_generic.unix_=
stream_recvmsg
      5.33 =C2=B1  5%     -80.0%       1.07 =C2=B1 31%  perf-profile.cycles=
-pp.rw_verify_area.vfs_read.sys_read.entry_SYSCALL_64_fastpath
      0.20 =C2=B1-500%   +1673.7%       3.55 =C2=B1 11%  perf-profile.cycle=
s-pp.rw_verify_area.vfs_read.sys_read.entry_SYSCALL_64_fastpath.__read_noca=
ncel
      4.47 =C2=B1  7%     -78.5%       0.96 =C2=B1 29%  perf-profile.cycles=
-pp.rw_verify_area.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      0.23 =C2=B1-434%   +1180.4%       2.95 =C2=B1 12%  perf-profile.cycle=
s-pp.rw_verify_area.vfs_write.sys_write.entry_SYSCALL_64_fastpath.__write_n=
ocancel
      0.21 =C2=B1 13%   +1674.7%       3.68 =C2=B1  5%  perf-profile.cycles=
-pp.schedule.schedule_timeout.unix_stream_read_generic.unix_stream_recvmsg.=
sock_recvmsg
      0.22 =C2=B1 16%   +1648.3%       3.80 =C2=B1  6%  perf-profile.cycles=
-pp.schedule_timeout.unix_stream_read_generic.unix_stream_recvmsg.sock_recv=
msg.sock_read_iter
      4.89 =C2=B1  6%     -15.7%       4.12 =C2=B1  3%  perf-profile.cycles=
-pp.security_file_permission.rw_verify_area.vfs_read.sys_read.entry_SYSCALL=
_64_fastpath
      3.90 =C2=B1  7%     -11.7%       3.44 =C2=B1  2%  perf-profile.cycles=
-pp.security_file_permission.rw_verify_area.vfs_write.sys_write.entry_SYSCA=
LL_64_fastpath
      0.59 =C2=B1  7%     +51.9%       0.90 =C2=B1 10%  perf-profile.cycles=
-pp.security_socket_recvmsg.sock_recvmsg.sock_read_iter.__vfs_read.vfs_read
      0.74 =C2=B1 15%     +55.4%       1.15 =C2=B1  6%  perf-profile.cycles=
-pp.security_socket_sendmsg.sock_sendmsg.sock_write_iter.__vfs_write.vfs_wr=
ite
      7.99 =C2=B1  4%     -19.1%       6.47 =C2=B1  2%  perf-profile.cycles=
-pp.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.=
unix_stream_recvmsg.sock_recvmsg
      0.76 =C2=B1  3%     +52.8%       1.17 =C2=B1 10%  perf-profile.cycles=
-pp.skb_queue_tail.unix_stream_sendmsg.sock_sendmsg.sock_write_iter.__vfs_w=
rite
     10.53 =C2=B1  2%     -17.0%       8.74 =C2=B1  1%  perf-profile.cycles=
-pp.skb_release_all.consume_skb.unix_stream_read_generic.unix_stream_recvms=
g.sock_recvmsg
      6.75 =C2=B1  2%     -12.5%       5.90 =C2=B1  2%  perf-profile.cycles=
-pp.skb_release_data.skb_release_all.consume_skb.unix_stream_read_generic.u=
nix_stream_recvmsg
      0.87 =C2=B1  7%     +39.9%       1.22 =C2=B1  6%  perf-profile.cycles=
-pp.skb_unlink.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.so=
ck_read_iter
     17.95 =C2=B1  0%     -15.8%      15.11 =C2=B1  1%  perf-profile.cycles=
-pp.sock_alloc_send_pskb.unix_stream_sendmsg.sock_sendmsg.sock_write_iter._=
_vfs_write
      1.03 =C2=B1  8%    +521.1%       6.41 =C2=B1  3%  perf-profile.cycles=
-pp.sock_def_readable.unix_stream_sendmsg.sock_sendmsg.sock_write_iter.__vf=
s_write
      0.25 =C2=B1-400%    +322.0%       1.06 =C2=B1 22%  perf-profile.cycle=
s-pp.start_secondary
     50.85 =C2=B1  2%     -72.4%      14.01 =C2=B1 26%  perf-profile.cycles=
-pp.sys_read.entry_SYSCALL_64_fastpath
      2.14 =C2=B1-46%   +1435.9%      32.87 =C2=B1 11%  perf-profile.cycles=
-pp.sys_read.entry_SYSCALL_64_fastpath.__read_nocancel
     44.14 =C2=B1  3%     -68.8%      13.77 =C2=B1 27%  perf-profile.cycles=
-pp.sys_write.entry_SYSCALL_64_fastpath
      2.39 =C2=B1-41%   +1111.3%      28.95 =C2=B1 13%  perf-profile.cycles=
-pp.sys_write.entry_SYSCALL_64_fastpath.__write_nocancel
      0.45 =C2=B1  8%    +918.0%       4.53 =C2=B1  3%  perf-profile.cycles=
-pp.try_to_wake_up.default_wake_function.autoremove_wake_function.__wake_up=
_common.__wake_up_sync_key
      0.25 =C2=B1  9%    +937.4%       2.57 =C2=B1  4%  perf-profile.cycles=
-pp.ttwu_do_activate.constprop.91.try_to_wake_up.default_wake_function.auto=
remove_wake_function.__wake_up_common
      8.18 =C2=B1  4%     -19.6%       6.58 =C2=B1  1%  perf-profile.cycles=
-pp.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.soc=
k_recvmsg.sock_read_iter
     49.38 =C2=B1  2%     -72.5%      13.59 =C2=B1 26%  perf-profile.cycles=
-pp.vfs_read.sys_read.entry_SYSCALL_64_fastpath
      2.09 =C2=B1-47%   +1430.9%      32.00 =C2=B1 11%  perf-profile.cycles=
-pp.vfs_read.sys_read.entry_SYSCALL_64_fastpath.__read_nocancel
     42.36 =C2=B1  3%     -68.6%      13.32 =C2=B1 27%  perf-profile.cycles=
-pp.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      2.34 =C2=B1-42%   +1091.2%      27.88 =C2=B1 12%  perf-profile.cycles=
-pp.vfs_write.sys_write.entry_SYSCALL_64_fastpath.__write_nocancel

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/lkp-ivb-d0=
3/shell8/unixbench

commit: =

  782fb955d6cce91ffc2089fc5a70c751e1581eff
  9e7474b13a96cdfcea6f8ea7f8810d05747fa254

782fb955d6cce91f 9e7474b13a96cdfcea6f8ea7f8 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      5751 =C2=B1  0%      +2.8%       5914 =C2=B1  0%  unixbench.score
    759980 =C2=B1  0%     -29.9%     532832 =C2=B1  0%  unixbench.time.invo=
luntary_context_switches
  68713272 =C2=B1  0%      +2.8%   70660284 =C2=B1  0%  unixbench.time.mino=
r_page_faults
    316.25 =C2=B1  0%      +4.6%     330.75 =C2=B1  0%  unixbench.time.perc=
ent_of_cpu_this_job_got
    367.07 =C2=B1  0%      +4.1%     381.99 =C2=B1  0%  unixbench.time.syst=
em_time
    232.32 =C2=B1  0%      +5.3%     244.53 =C2=B1  0%  unixbench.time.user=
_time
   2076488 =C2=B1  0%      +3.2%    2142947 =C2=B1  0%  unixbench.time.volu=
ntary_context_switches
    129443 =C2=B1  0%     -15.4%     109553 =C2=B1  0%  softirqs.SCHED
    759980 =C2=B1  0%     -29.9%     532832 =C2=B1  0%  time.involuntary_co=
ntext_switches
    224.77 =C2=B1  0%     -13.8%     193.75 =C2=B1  0%  uptime.idle
     22610 =C2=B1  0%     -11.5%      20000 =C2=B1  0%  vmstat.system.cs
      1144 =C2=B1  1%      +8.3%       1239 =C2=B1  3%  slabinfo.kmalloc-96=
.active_objs
      1144 =C2=B1  1%      +8.3%       1239 =C2=B1  3%  slabinfo.kmalloc-96=
.num_objs
      9620 =C2=B1 47%     -82.1%       1721 =C2=B1 17%  latency_stats.sum.c=
all_rwsem_down_write_failed.copy_process._do_fork.SyS_clone.do_syscall_64.r=
eturn_from_SYSCALL_64
     32967 =C2=B1 27%     -84.5%       5100 =C2=B1 37%  latency_stats.sum.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.exit_mmap.mmput.f=
lush_old_exec.load_elf_binary.search_binary_handler.do_execveat_common.SyS_=
execve.do_syscall_64.return_from_SYSCALL_64
     28489 =C2=B1 13%     -74.4%       7288 =C2=B1 30%  latency_stats.sum.p=
ath_openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
     80.36 =C2=B1  0%      +4.4%      83.86 =C2=B1  0%  turbostat.%Busy
      2646 =C2=B1  0%      +4.4%       2761 =C2=B1  0%  turbostat.Avg_MHz
     14.24 =C2=B1  0%     -23.3%      10.92 =C2=B1  1%  turbostat.CPU%c1
      0.41 =C2=B1  3%     -32.5%       0.28 =C2=B1 12%  turbostat.CPU%c3
     14.15 =C2=B1  0%      +1.5%      14.37 =C2=B1  0%  turbostat.CorWatt
  64382115 =C2=B1  0%     -23.3%   49374392 =C2=B1  0%  cpuidle.C1E-IVB.time
    600295 =C2=B1  0%     -18.1%     491829 =C2=B1  0%  cpuidle.C1E-IVB.usa=
ge
  19272685 =C2=B1  2%     -36.3%   12283514 =C2=B1  3%  cpuidle.C3-IVB.time
    148792 =C2=B1  4%     -27.3%     108185 =C2=B1  2%  cpuidle.C3-IVB.usage
  52929080 =C2=B1  2%     -10.0%   47653009 =C2=B1  1%  cpuidle.C6-IVB.time
    113947 =C2=B1  7%     -22.7%      88076 =C2=B1  2%  cpuidle.C6-IVB.usage
    162.63 =C2=B1  5%     -67.1%      53.46 =C2=B1 48%  sched_debug.cfs_rq:=
/.exec_clock.stddev
    115.09 =C2=B1  6%     -98.5%       1.72 =C2=B1  3%  sched_debug.cfs_rq:=
/.load.avg
    198.56 =C2=B1 11%     -99.0%       2.00 =C2=B1  0%  sched_debug.cfs_rq:=
/.load.max
     41.81 =C2=B1 29%     -96.7%       1.38 =C2=B1 15%  sched_debug.cfs_rq:=
/.load.min
     61.10 =C2=B1 18%     -99.5%       0.30 =C2=B1 30%  sched_debug.cfs_rq:=
/.load.stddev
    147.98 =C2=B1 10%  +7.7e+07%   1.14e+08 =C2=B1  0%  sched_debug.cfs_rq:=
/.load_avg.avg
    203.56 =C2=B1 17%  +5.9e+07%  1.193e+08 =C2=B1  1%  sched_debug.cfs_rq:=
/.load_avg.max
    102.06 =C2=B1  3%  +1.1e+08%  1.089e+08 =C2=B1  0%  sched_debug.cfs_rq:=
/.load_avg.min
     39.75 =C2=B1 28%  +1.1e+07%    4329918 =C2=B1 24%  sched_debug.cfs_rq:=
/.load_avg.stddev
    683448 =C2=B1  0%   +5468.4%   38056825 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.avg
    685927 =C2=B1  0%   +5459.5%   38134331 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.max
    681176 =C2=B1  0%   +5477.1%   37990150 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.min
      1870 =C2=B1 30%   +2912.1%      56334 =C2=B1 22%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      0.19 =C2=B1-533%  +21841.7%      41.14 =C2=B1  9%  sched_debug.cfs_rq=
:/.nr_spread_over.avg
      0.75 =C2=B1-133%   +7858.3%      59.69 =C2=B1  9%  sched_debug.cfs_rq=
:/.nr_spread_over.max
      0.32 =C2=B1-307%   +4215.7%      14.02 =C2=B1 19%  sched_debug.cfs_rq=
:/.nr_spread_over.stddev
     86.86 =C2=B1  3%    +913.1%     880.00 =C2=B1  3%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
    104.94 =C2=B1  1%    +875.8%       1024 =C2=B1  0%  sched_debug.cfs_rq:=
/.runnable_load_avg.max
     54.25 =C2=B1 22%   +1197.7%     704.00 =C2=B1 15%  sched_debug.cfs_rq:=
/.runnable_load_avg.min
     20.91 =C2=B1 24%    +644.8%     155.71 =C2=B1 30%  sched_debug.cfs_rq:=
/.runnable_load_avg.stddev
     -2782 =C2=B1-29%   +4262.9%    -121377 =C2=B1-52%  sched_debug.cfs_rq:=
/.spread0.min
      1871 =C2=B1 30%   +2913.2%      56397 =C2=B1 22%  sched_debug.cfs_rq:=
/.spread0.stddev
    784.78 =C2=B1  0%  +73979.7%     581363 =C2=B1  1%  sched_debug.cfs_rq:=
/.util_avg.avg
    826.62 =C2=B1  1%    +2e+05%    1624636 =C2=B1 11%  sched_debug.cfs_rq:=
/.util_avg.max
    751.44 =C2=B1  2%   +3338.7%      25840 =C2=B1 90%  sched_debug.cfs_rq:=
/.util_avg.min
     29.04 =C2=B1 43%  +2.3e+06%     655306 =C2=B1  9%  sched_debug.cfs_rq:=
/.util_avg.stddev
      0.68 =C2=B1 11%     -24.4%       0.51 =C2=B1  8%  sched_debug.cpu.clo=
ck.stddev
      0.68 =C2=B1 11%     -24.4%       0.51 =C2=B1  8%  sched_debug.cpu.clo=
ck_task.stddev
     78.17 =C2=B1  6%    +943.9%     816.00 =C2=B1 10%  sched_debug.cpu.cpu=
_load[0].avg
    104.31 =C2=B1  2%    +881.7%       1024 =C2=B1 17%  sched_debug.cpu.cpu=
_load[0].max
     37.31 =C2=B1 33%   +1443.7%     576.00 =C2=B1 36%  sched_debug.cpu.cpu=
_load[0].min
     80.42 =C2=B1  8%    +887.3%     794.02 =C2=B1  2%  sched_debug.cpu.cpu=
_load[1].avg
     99.62 =C2=B1  3%    +862.7%     959.12 =C2=B1  8%  sched_debug.cpu.cpu=
_load[1].max
     53.44 =C2=B1 21%    +987.1%     580.94 =C2=B1 16%  sched_debug.cpu.cpu=
_load[1].min
     18.70 =C2=B1 28%    +707.9%     151.03 =C2=B1 42%  sched_debug.cpu.cpu=
_load[1].stddev
     81.47 =C2=B1  7%    +873.1%     792.77 =C2=B1  2%  sched_debug.cpu.cpu=
_load[2].avg
     96.19 =C2=B1  3%    +849.9%     913.69 =C2=B1  3%  sched_debug.cpu.cpu=
_load[2].max
     63.75 =C2=B1 12%    +905.5%     641.00 =C2=B1  9%  sched_debug.cpu.cpu=
_load[2].min
     12.57 =C2=B1 24%    +736.3%     105.14 =C2=B1 30%  sched_debug.cpu.cpu=
_load[2].stddev
     81.86 =C2=B1  4%    +882.3%     804.12 =C2=B1  2%  sched_debug.cpu.cpu=
_load[3].avg
     93.50 =C2=B1  3%    +855.7%     893.56 =C2=B1  0%  sched_debug.cpu.cpu=
_load[3].max
     70.12 =C2=B1  6%    +918.5%     714.25 =C2=B1  5%  sched_debug.cpu.cpu=
_load[3].min
      8.90 =C2=B1 17%    +688.3%      70.17 =C2=B1 21%  sched_debug.cpu.cpu=
_load[3].stddev
     83.83 =C2=B1  2%    +881.5%     822.77 =C2=B1  1%  sched_debug.cpu.cpu=
_load[4].avg
     93.12 =C2=B1  2%    +847.0%     881.94 =C2=B1  1%  sched_debug.cpu.cpu=
_load[4].max
     74.94 =C2=B1  4%    +929.9%     771.81 =C2=B1  3%  sched_debug.cpu.cpu=
_load[4].min
      6.96 =C2=B1 20%    +511.7%      42.55 =C2=B1 19%  sched_debug.cpu.cpu=
_load[4].stddev
      5911 =C2=B1 13%     +60.2%       9468 =C2=B1 16%  sched_debug.cpu.cur=
r->pid.avg
      9818 =C2=B1  7%     +36.7%      13418 =C2=B1 19%  sched_debug.cpu.cur=
r->pid.max
    107.91 =C2=B1  9%     -68.8%      33.72 =C2=B1 94%  sched_debug.cpu.loa=
d.avg
     33.56 =C2=B1 50%     -95.9%       1.38 =C2=B1 15%  sched_debug.cpu.loa=
d.min
    518047 =C2=B1  0%     -11.5%     458691 =C2=B1  0%  sched_debug.cpu.nr_=
switches.avg
    534319 =C2=B1  0%     -12.2%     468994 =C2=B1  0%  sched_debug.cpu.nr_=
switches.max
    503695 =C2=B1  0%     -10.8%     449233 =C2=B1  0%  sched_debug.cpu.nr_=
switches.min
     13436 =C2=B1  5%     -38.9%       8204 =C2=B1 19%  sched_debug.cpu.nr_=
switches.stddev
     36.06 =C2=B1 30%    +171.1%      97.75 =C2=B1 32%  sched_debug.cpu.nr_=
uninterruptible.max
    -28.19 =C2=B1-21%    +267.0%    -103.44 =C2=B1-15%  sched_debug.cpu.nr_=
uninterruptible.min
     25.73 =C2=B1 26%    +200.4%      77.31 =C2=B1 24%  sched_debug.cpu.nr_=
uninterruptible.stddev
    511556 =C2=B1  0%     -11.6%     452160 =C2=B1  0%  sched_debug.cpu.sch=
ed_count.avg
    523416 =C2=B1  0%     -12.4%     458580 =C2=B1  0%  sched_debug.cpu.sch=
ed_count.max
    499741 =C2=B1  0%     -10.9%     445373 =C2=B1  0%  sched_debug.cpu.sch=
ed_count.min
     10860 =C2=B1  3%     -50.4%       5386 =C2=B1 23%  sched_debug.cpu.sch=
ed_count.stddev
    108740 =C2=B1  0%     -17.6%      89574 =C2=B1  0%  sched_debug.cpu.sch=
ed_goidle.avg
    114592 =C2=B1  0%     -19.3%      92528 =C2=B1  1%  sched_debug.cpu.sch=
ed_goidle.max
    103040 =C2=B1  0%     -16.2%      86324 =C2=B1  1%  sched_debug.cpu.sch=
ed_goidle.min
      5317 =C2=B1  2%     -51.9%       2557 =C2=B1 27%  sched_debug.cpu.sch=
ed_goidle.stddev

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/nr_task/rootfs/tbox_group/test/testcase:
  gcc-4.9/x86_64-rhel/100%/debian-x86_64-2015-02-07.cgz/nhm-white2/spawn/un=
ixbench

commit: =

  782fb955d6cce91ffc2089fc5a70c751e1581eff
  9e7474b13a96cdfcea6f8ea7f8810d05747fa254

782fb955d6cce91f 9e7474b13a96cdfcea6f8ea7f8 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      3697 =C2=B1  0%      +3.4%       3824 =C2=B1  0%  unixbench.score
    696681 =C2=B1  0%    +115.8%    1503139 =C2=B1  0%  unixbench.time.invo=
luntary_context_switches
  98235337 =C2=B1  0%      +3.7%  1.019e+08 =C2=B1  0%  unixbench.time.mino=
r_page_faults
   8376821 =C2=B1  0%      +3.5%    8670506 =C2=B1  0%  unixbench.time.volu=
ntary_context_switches
    696681 =C2=B1  0%    +115.8%    1503139 =C2=B1  0%  time.involuntary_co=
ntext_switches
    138679 =C2=B1  0%      +8.2%     150042 =C2=B1  0%  vmstat.system.cs
     13752 =C2=B1  0%     +67.2%      22990 =C2=B1  0%  vmstat.system.in
  24641298 =C2=B1  0%      -9.8%   22222780 =C2=B1  0%  cpuidle.C1E-NHM.time
   2177636 =C2=B1  2%     -47.8%    1136290 =C2=B1  5%  cpuidle.C3-NHM.time
     45535 =C2=B1  2%     -71.3%      13077 =C2=B1  5%  cpuidle.C3-NHM.usage
     17154 =C2=B1  4%     -34.5%      11232 =C2=B1  4%  cpuidle.C6-NHM.usage
      2239 =C2=B1  5%      +8.6%       2431 =C2=B1  6%  slabinfo.kmalloc-25=
6.num_objs
      1404 =C2=B1  5%     -17.2%       1162 =C2=B1 11%  slabinfo.kmalloc-51=
2.active_objs
    304.00 =C2=B1 17%     -36.8%     192.00 =C2=B1 23%  slabinfo.kmem_cache=
_node.active_objs
    304.00 =C2=B1 17%     -36.8%     192.00 =C2=B1 23%  slabinfo.kmem_cache=
_node.num_objs
    582.04 =C2=B1 17%     -49.4%     294.70 =C2=B1  1%  sched_debug.cfs_rq:=
/.exec_clock.stddev
     52.30 =C2=B1 24%  +3.7e+08%  1.934e+08 =C2=B1  0%  sched_debug.cfs_rq:=
/.load_avg.avg
    187.88 =C2=B1 58%  +1.1e+08%  1.991e+08 =C2=B1  0%  sched_debug.cfs_rq:=
/.load_avg.max
     11.62 =C2=B1 17%  +1.6e+09%  1.888e+08 =C2=B1  0%  sched_debug.cfs_rq:=
/.load_avg.min
     59.12 =C2=B1 57%  +6.7e+06%    3948667 =C2=B1  3%  sched_debug.cfs_rq:=
/.load_avg.stddev
   1041947 =C2=B1  0%    +981.7%   11271059 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.avg
   1081772 =C2=B1  0%    +958.8%   11453444 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.max
   1006384 =C2=B1  0%   +1001.2%   11082074 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.min
     25413 =C2=B1 19%    +546.6%     164330 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      7.33 =C2=B1 11%   +8196.8%     608.00 =C2=B1  5%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
     16.38 =C2=B1 19%   +6935.1%       1152 =C2=B1 19%  sched_debug.cfs_rq:=
/.runnable_load_avg.max
      5.25 =C2=B1 20%   +5897.4%     314.94 =C2=B1 39%  sched_debug.cfs_rq:=
/.runnable_load_avg.stddev
     -8572 =C2=B1-84%   +1913.7%    -172629 =C2=B1-12%  sched_debug.cfs_rq:=
/.spread0.avg
    -44145 =C2=B1-19%    +719.5%    -361756 =C2=B1 -6%  sched_debug.cfs_rq:=
/.spread0.min
     25416 =C2=B1 19%    +547.0%     164452 =C2=B1  1%  sched_debug.cfs_rq:=
/.spread0.stddev
    574.16 =C2=B1  2%  +65254.1%     375234 =C2=B1  2%  sched_debug.cfs_rq:=
/.util_avg.avg
    708.38 =C2=B1  4%  +2.1e+05%    1507520 =C2=B1  9%  sched_debug.cfs_rq:=
/.util_avg.max
    437.25 =C2=B1  1%   +1109.5%       5288 =C2=B1 50%  sched_debug.cfs_rq:=
/.util_avg.min
     89.66 =C2=B1  6%  +6.2e+05%     554928 =C2=B1  5%  sched_debug.cfs_rq:=
/.util_avg.stddev
    122888 =C2=B1 26%     +40.6%     172812 =C2=B1 15%  sched_debug.cpu.avg=
_idle.min
      6.78 =C2=B1 11%   +8630.0%     592.00 =C2=B1  8%  sched_debug.cpu.cpu=
_load[0].avg
     16.88 =C2=B1 11%   +6726.7%       1152 =C2=B1 19%  sched_debug.cpu.cpu=
_load[0].max
      5.51 =C2=B1 10%   +5722.9%     321.12 =C2=B1 40%  sched_debug.cpu.cpu=
_load[0].stddev
      6.62 =C2=B1  8%   +8627.6%     578.20 =C2=B1  4%  sched_debug.cpu.cpu=
_load[1].avg
     15.25 =C2=B1 18%   +6354.9%     984.38 =C2=B1 11%  sched_debug.cpu.cpu=
_load[1].max
      2.38 =C2=B1 40%  +13505.3%     323.12 =C2=B1 35%  sched_debug.cpu.cpu=
_load[1].min
      4.24 =C2=B1 21%   +4922.7%     213.12 =C2=B1 28%  sched_debug.cpu.cpu=
_load[1].stddev
      7.20 =C2=B1 17%   +7728.0%     563.86 =C2=B1  3%  sched_debug.cpu.cpu=
_load[2].avg
     19.12 =C2=B1 35%   +4209.2%     824.12 =C2=B1  6%  sched_debug.cpu.cpu=
_load[2].max
      3.25 =C2=B1  7%  +11623.1%     381.00 =C2=B1 17%  sched_debug.cpu.cpu=
_load[2].min
      5.02 =C2=B1 43%   +2697.9%     140.34 =C2=B1 20%  sched_debug.cpu.cpu=
_load[2].stddev
      8.09 =C2=B1 24%   +6808.1%     559.12 =C2=B1  1%  sched_debug.cpu.cpu=
_load[3].avg
     23.00 =C2=B1 56%   +2986.4%     709.88 =C2=B1  3%  sched_debug.cpu.cpu=
_load[3].max
      3.88 =C2=B1 10%  +10787.1%     421.88 =C2=B1  9%  sched_debug.cpu.cpu=
_load[3].min
      6.13 =C2=B1 69%   +1400.0%      92.01 =C2=B1 13%  sched_debug.cpu.cpu=
_load[3].stddev
      8.20 =C2=B1 26%   +6841.3%     569.41 =C2=B1  1%  sched_debug.cpu.cpu=
_load[4].avg
     23.75 =C2=B1 58%   +2710.0%     667.38 =C2=B1  3%  sched_debug.cpu.cpu=
_load[4].max
      4.25 =C2=B1 10%  +10685.3%     458.38 =C2=B1  2%  sched_debug.cpu.cpu=
_load[4].min
      6.41 =C2=B1 70%    +939.9%      66.62 =C2=B1  6%  sched_debug.cpu.cpu=
_load[4].stddev
      5760 =C2=B1 19%     -35.8%       3700 =C2=B1 49%  sched_debug.cpu.cur=
r->pid.stddev
      0.77 =C2=B1  8%     -33.0%       0.51 =C2=B1 22%  sched_debug.cpu.nr_=
running.stddev
    472982 =C2=B1  1%     +16.2%     549406 =C2=B1  0%  sched_debug.cpu.nr_=
switches.min
     38497 =C2=B1 20%     -69.1%      11893 =C2=B1  1%  sched_debug.cpu.nr_=
switches.stddev
     87.12 =C2=B1 11%     -17.5%      71.88 =C2=B1  6%  sched_debug.cpu.nr_=
uninterruptible.max
    471433 =C2=B1  1%     +15.9%     546547 =C2=B1  0%  sched_debug.cpu.sch=
ed_count.min
     36045 =C2=B1 22%     -72.6%       9859 =C2=B1  3%  sched_debug.cpu.sch=
ed_count.stddev
     12488 =C2=B1 23%     -72.0%       3496 =C2=B1  1%  sched_debug.cpu.sch=
ed_goidle.stddev
    215968 =C2=B1  5%     -19.8%     173290 =C2=B1  0%  sched_debug.cpu.ttw=
u_count.max
     79635 =C2=B1 44%    +101.0%     160040 =C2=B1  0%  sched_debug.cpu.ttw=
u_count.min
     53558 =C2=B1 27%     -89.5%       5619 =C2=B1  1%  sched_debug.cpu.ttw=
u_count.stddev
     20904 =C2=B1  0%     -11.3%      18539 =C2=B1  0%  sched_debug.cpu.ttw=
u_local.avg
     23866 =C2=B1  2%     -18.3%      19497 =C2=B1  0%  sched_debug.cpu.ttw=
u_local.max
      2412 =C2=B1 17%     -73.4%     641.69 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.stddev

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/nr_task/rootfs/tbox_group/test/testcase:
  gcc-4.9/x86_64-rhel/100%/debian-x86_64-2015-02-07.cgz/nhm-white2/shell8/u=
nixbench

commit: =

  782fb955d6cce91ffc2089fc5a70c751e1581eff
  9e7474b13a96cdfcea6f8ea7f8810d05747fa254

782fb955d6cce91f 9e7474b13a96cdfcea6f8ea7f8 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     10405 =C2=B1  0%      +2.6%      10680 =C2=B1  0%  unixbench.score
   1842798 =C2=B1  0%     -58.0%     773428 =C2=B1  0%  unixbench.time.invo=
luntary_context_switches
 1.246e+08 =C2=B1  0%      +2.6%  1.279e+08 =C2=B1  0%  unixbench.time.mino=
r_page_faults
    654.75 =C2=B1 21%     +14.6%     750.50 =C2=B1  0%  unixbench.time.perc=
ent_of_cpu_this_job_got
    557.37 =C2=B1  0%      +3.6%     577.67 =C2=B1  0%  unixbench.time.user=
_time
      5173 =C2=B1  6%     +20.0%       6207 =C2=B1  1%  meminfo.KernelStack
    320.00 =C2=B1  6%     +21.2%     388.00 =C2=B1  1%  proc-vmstat.nr_kern=
el_stack
    138144 =C2=B1  1%     -38.8%      84496 =C2=B1  1%  softirqs.SCHED
   1842798 =C2=B1  0%     -58.0%     773428 =C2=B1  0%  time.involuntary_co=
ntext_switches
    536.05 =C2=B1 97%     -61.2%     207.84 =C2=B1  0%  uptime.idle
     83.09 =C2=B1 21%     +14.0%      94.72 =C2=B1  0%  turbostat.%Busy
      2429 =C2=B1 21%     +14.1%       2771 =C2=B1  0%  turbostat.Avg_MHz
      1.48 =C2=B1  1%     -88.7%       0.17 =C2=B1  2%  turbostat.CPU%c1
      0.10 =C2=B1 24%     -28.6%       0.08 =C2=B1  6%  turbostat.CPU%c3
      0.19 =C2=B1 22%     -35.5%       0.12 =C2=B1 17%  turbostat.Pkg%pc3
   5568104 =C2=B1  4%     -91.8%     454715 =C2=B1 10%  cpuidle.C1-NHM.time
     95013 =C2=B1  7%     -87.0%      12330 =C2=B1 34%  cpuidle.C1-NHM.usage
   9238028 =C2=B1  3%     -94.1%     547129 =C2=B1  8%  cpuidle.C1E-NHM.time
    139659 =C2=B1  2%     -94.4%       7836 =C2=B1  7%  cpuidle.C1E-NHM.usa=
ge
   7788431 =C2=B1 11%     -86.7%    1036028 =C2=B1  2%  cpuidle.C3-NHM.time
     93260 =C2=B1  4%     -95.5%       4218 =C2=B1  7%  cpuidle.C3-NHM.usage
     54514 =C2=B1103%     -82.2%       9722 =C2=B1  1%  cpuidle.C6-NHM.usage
      1632 =C2=B1 12%     -92.1%     129.00 =C2=B1 56%  cpuidle.POLL.time
     87.50 =C2=B1 13%     -89.1%       9.50 =C2=B1 52%  cpuidle.POLL.usage
     72.26 =C2=B1  6%     -75.0%      18.09 =C2=B1 16%  sched_debug.cfs_rq:=
/.exec_clock.stddev
     70.28 =C2=B1 14%     -97.8%       1.58 =C2=B1  1%  sched_debug.cfs_rq:=
/.load.avg
    220.29 =C2=B1 50%     -99.1%       2.00 =C2=B1  0%  sched_debug.cfs_rq:=
/.load.max
     15.19 =C2=B1 76%     -90.9%       1.38 =C2=B1 15%  sched_debug.cfs_rq:=
/.load.min
     67.27 =C2=B1 53%     -99.7%       0.23 =C2=B1 38%  sched_debug.cfs_rq:=
/.load.stddev
     81.68 =C2=B1 16%  +4.1e+07%   33204344 =C2=B1  1%  sched_debug.cfs_rq:=
/.load_avg.avg
    154.75 =C2=B1 21%  +2.6e+07%   40432320 =C2=B1  4%  sched_debug.cfs_rq:=
/.load_avg.max
     53.10 =C2=B1 15%  +4.8e+07%   25323904 =C2=B1  5%  sched_debug.cfs_rq:=
/.load_avg.min
     34.64 =C2=B1 25%  +1.4e+07%    4981171 =C2=B1 13%  sched_debug.cfs_rq:=
/.load_avg.stddev
   2154140 =C2=B1 15%   +1895.2%   42980390 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.avg
   2173234 =C2=B1 14%   +1884.2%   43121931 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.max
   2130729 =C2=B1 15%   +1909.8%   42824256 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.min
     12947 =C2=B1 16%    +639.6%      95751 =C2=B1 26%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      0.07 =C2=B1103%  +27296.0%      17.84 =C2=B1  4%  sched_debug.cfs_rq:=
/.nr_spread_over.avg
      0.40 =C2=B1100%  +10873.7%      43.44 =C2=B1 13%  sched_debug.cfs_rq:=
/.nr_spread_over.max
      0.14 =C2=B1100%   +9295.2%      13.50 =C2=B1 19%  sched_debug.cfs_rq:=
/.nr_spread_over.stddev
     53.85 =C2=B1 16%   +1400.6%     808.00 =C2=B1  1%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
     66.02 =C2=B1 15%   +1451.0%       1024 =C2=B1  0%  sched_debug.cfs_rq:=
/.runnable_load_avg.max
     37.40 =C2=B1 42%   +1782.6%     704.00 =C2=B1 15%  sched_debug.cfs_rq:=
/.runnable_load_avg.min
      8.80 =C2=B1 55%   +1251.5%     118.92 =C2=B1 38%  sched_debug.cfs_rq:=
/.runnable_load_avg.stddev
    -26313 =C2=B1-60%    +686.9%    -207064 =C2=B1-30%  sched_debug.cfs_rq:=
/.spread0.min
     12935 =C2=B1 16%    +641.6%      95928 =C2=B1 26%  sched_debug.cfs_rq:=
/.spread0.stddev
    749.07 =C2=B1 16%  +50878.0%     381861 =C2=B1  3%  sched_debug.cfs_rq:=
/.util_avg.avg
    807.19 =C2=B1 15%  +2.4e+05%    1965535 =C2=B1 21%  sched_debug.cfs_rq:=
/.util_avg.max
    688.31 =C2=B1 16%    +580.3%       4682 =C2=B1 41%  sched_debug.cfs_rq:=
/.util_avg.min
     38.77 =C2=B1 15%  +1.7e+06%     646951 =C2=B1 20%  sched_debug.cfs_rq:=
/.util_avg.stddev
    287652 =C2=B1 31%     +49.0%     428560 =C2=B1  6%  sched_debug.cpu.avg=
_idle.min
    162349 =C2=B1  7%     -35.4%     104877 =C2=B1 14%  sched_debug.cpu.avg=
_idle.stddev
     53.76 =C2=B1 16%   +1492.4%     856.00 =C2=B1  3%  sched_debug.cpu.cpu=
_load[0].avg
     67.17 =C2=B1 15%   +1615.1%       1152 =C2=B1 19%  sched_debug.cpu.cpu=
_load[0].max
     37.15 =C2=B1 43%   +1967.5%     768.00 =C2=B1  0%  sched_debug.cpu.cpu=
_load[0].min
      8.95 =C2=B1 52%   +1647.1%     156.45 =C2=B1 45%  sched_debug.cpu.cpu=
_load[0].stddev
     53.48 =C2=B1 17%   +1457.5%     832.96 =C2=B1  1%  sched_debug.cpu.cpu=
_load[1].avg
     65.46 =C2=B1 15%   +1457.8%       1019 =C2=B1  9%  sched_debug.cpu.cpu=
_load[1].max
     40.12 =C2=B1 28%   +1784.7%     756.25 =C2=B1  2%  sched_debug.cpu.cpu=
_load[1].min
      7.37 =C2=B1 37%   +1166.6%      93.34 =C2=B1 33%  sched_debug.cpu.cpu=
_load[1].stddev
     53.54 =C2=B1 16%   +1445.5%     827.41 =C2=B1  0%  sched_debug.cpu.cpu=
_load[2].avg
     64.02 =C2=B1 16%   +1365.6%     938.31 =C2=B1  4%  sched_debug.cpu.cpu=
_load[2].max
     43.81 =C2=B1 19%   +1632.4%     759.00 =C2=B1  3%  sched_debug.cpu.cpu=
_load[2].min
      5.93 =C2=B1 28%    +860.3%      56.94 =C2=B1 23%  sched_debug.cpu.cpu=
_load[2].stddev
     53.58 =C2=B1 16%   +1445.1%     827.92 =C2=B1  0%  sched_debug.cpu.cpu=
_load[3].avg
     62.00 =C2=B1 16%   +1349.9%     898.94 =C2=B1  2%  sched_debug.cpu.cpu=
_load[3].max
     46.56 =C2=B1 15%   +1562.6%     774.12 =C2=B1  2%  sched_debug.cpu.cpu=
_load[3].min
      4.62 =C2=B1 26%    +740.3%      38.79 =C2=B1 16%  sched_debug.cpu.cpu=
_load[3].stddev
     53.77 =C2=B1 16%   +1449.4%     833.12 =C2=B1  0%  sched_debug.cpu.cpu=
_load[4].avg
     61.08 =C2=B1 16%   +1361.1%     892.50 =C2=B1  1%  sched_debug.cpu.cpu=
_load[4].max
     48.38 =C2=B1 14%   +1532.6%     789.75 =C2=B1  1%  sched_debug.cpu.cpu=
_load[4].min
      3.99 =C2=B1 24%    +705.8%      32.13 =C2=B1 20%  sched_debug.cpu.cpu=
_load[4].stddev
     63.66 =C2=B1  7%     -85.0%       9.58 =C2=B1144%  sched_debug.cpu.loa=
d.avg
     15.75 =C2=B1 65%     -91.3%       1.38 =C2=B1 15%  sched_debug.cpu.loa=
d.min
    465366 =C2=B1 15%     -36.2%     296986 =C2=B1  0%  sched_debug.cpu.nr_=
switches.avg
    489166 =C2=B1 14%     -36.6%     310220 =C2=B1  0%  sched_debug.cpu.nr_=
switches.max
    452338 =C2=B1 15%     -37.6%     282296 =C2=B1  1%  sched_debug.cpu.nr_=
switches.min
     12631 =C2=B1  5%     -28.5%       9029 =C2=B1 18%  sched_debug.cpu.nr_=
switches.stddev
     91.48 =C2=B1  9%     +53.1%     140.06 =C2=B1 12%  sched_debug.cpu.nr_=
uninterruptible.max
    -83.04 =C2=B1-14%     +88.0%    -156.12 =C2=B1-28%  sched_debug.cpu.nr_=
uninterruptible.min
     54.46 =C2=B1  8%     +74.0%      94.74 =C2=B1 15%  sched_debug.cpu.nr_=
uninterruptible.stddev
    461439 =C2=B1 15%     -36.5%     292946 =C2=B1  0%  sched_debug.cpu.sch=
ed_count.avg
    482544 =C2=B1 14%     -36.9%     304578 =C2=B1  0%  sched_debug.cpu.sch=
ed_count.max
    448484 =C2=B1 15%     -37.7%     279598 =C2=B1  1%  sched_debug.cpu.sch=
ed_count.min
     11812 =C2=B1  4%     -31.9%       8047 =C2=B1 18%  sched_debug.cpu.sch=
ed_count.stddev
     22491 =C2=B1 19%     -91.8%       1851 =C2=B1 11%  sched_debug.cpu.sch=
ed_goidle.avg
     24845 =C2=B1 18%     -81.7%       4545 =C2=B1 25%  sched_debug.cpu.sch=
ed_goidle.max
     20564 =C2=B1 19%     -94.9%       1055 =C2=B1  8%  sched_debug.cpu.sch=
ed_goidle.min
    229661 =C2=B1 15%     -29.5%     161879 =C2=B1  0%  sched_debug.cpu.ttw=
u_count.avg
    245728 =C2=B1 14%     -30.3%     171334 =C2=B1  1%  sched_debug.cpu.ttw=
u_count.max
    217816 =C2=B1 14%     -29.3%     153946 =C2=B1  0%  sched_debug.cpu.ttw=
u_count.min
      9399 =C2=B1 10%     -37.1%       5914 =C2=B1 19%  sched_debug.cpu.ttw=
u_count.stddev
    172413 =C2=B1 15%     -26.7%     126368 =C2=B1  0%  sched_debug.cpu.ttw=
u_local.avg
    179174 =C2=B1 14%     -28.0%     128998 =C2=B1  0%  sched_debug.cpu.ttw=
u_local.max
    166227 =C2=B1 14%     -25.9%     123148 =C2=B1  0%  sched_debug.cpu.ttw=
u_local.min
      4190 =C2=B1  7%     -56.2%       1835 =C2=B1 26%  sched_debug.cpu.ttw=
u_local.stddev
      0.00 =C2=B1141%    +188.6%       0.00 =C2=B1 30%  sched_debug.rt_rq:/=
.rt_time.min



lkp-ivb-d02: Ivy Bridge
Memory: 8G

lkp-ivb-d03: Ivy Bridge
Memory: 4G

nhm-white2: Nehalem
Memory: 4G

vm-client-e5450-openwrt-ia32: qemu-system-x86_64 -enable-kvm
Memory: 192M



                                  unixbench.score

  5950 ++------------------------------------------------------------------=
-+
       |                              OO O                                 =
 |
  5900 ++                 O OOO OO OO     O                                =
 |
       |                                                                   =
 |
  5850 OO  O O     O  O  O                                                 =
 |
       |  O   O OO  O  O                                                   =
 |
  5800 ++                                                                  =
 |
       |                                                                 *.=
 |
  5750 ++   .*   *.*      *               *.  .**.      .*   *.*    .* .*  =
*|
       **.**  *.*   *     :+ *      *.**.*  **    **.***  *.*   *.**  *    =
 *
  5700 ++            +   :  * *.**.*                                       =
 |
       |              *  *                                                 =
 |
  5650 ++              :+                                                  =
 |
       |               *                                                   =
 |
  5600 ++------------------------------------------------------------------=
-+


                             unixbench.time.user_time

  246 ++-------------O---O--O--O--O----------------------------------------=
-+
      |O  O  O O  OO  O O  O  O  O  OO OO                                  =
 |
  244 O+ O  O   O                         O                                =
 |
  242 ++                                                                   =
 |
      |                                                                    =
 |
  240 ++                                                                   =
 |
      |                                                                    =
 |
  238 ++                                                                   =
 |
      |                                                                    =
 |
  236 ++                                                                   =
 |
  234 ++                 *.                                                =
 |
      | .**.* .**.**.    : **.**.     .**.* .**.**.  .**.* .**.**.* .**. *.=
 |
  232 **     *       * .*        **.**     *       **     *        *    *  =
*|
      |               *                                                    =
 *
  230 ++-------------------------------------------------------------------=
-+


                            unixbench.time.system_time

  384 O+-O--O---O----------------------------------------------------------=
-+
  382 +O  O  O O  OO OO O     O     O  O  O                                =
 |
      |                  O OO  O OO  O  O                                  =
 |
  380 ++                                                                   =
 |
  378 ++                                                                   =
 |
      |                                                                    =
 |
  376 ++                                                                   =
 |
  374 ++                                                                   =
 |
  372 ++                                                                   =
 |
      |                                                                    =
 |
  370 ++              *.*    .*                                            =
 |
  368 ++            .*   :.**  *.**.                                       =
 *
      **.**.**.**.**     *          **.**.**.**.**.**.**.**.**.**.**. *.* .=
*|
  366 ++                                                             *   * =
 |
  364 ++-------------------------------------------------------------------=
-+


                    unixbench.time.percent_of_cpu_this_job_got

  332 ++-------------------------------------------------------------------=
-+
      OO OO OO OO OO OO OO OO OO OO O  OO O                                =
 |
  330 ++                             O                                     =
 |
  328 ++                                                                   =
 |
      |                                                                    =
 |
  326 ++                                                                   =
 |
      |                                                                    =
 |
  324 ++                                                                   =
 |
      |                                                                    =
 |
  322 ++                                                                   =
 |
  320 ++                                                                   =
 |
      |                                                                    =
 |
  318 ++              *.* .**.*   *.                                       =
 |
      **.**.* .* .**.*   *     *.*  **.**.* .* .**.**.**.* .* .**.**.* .*  =
 |
  316 ++-----*--*--------------------------*--*-----------*--*--------*--*-=
**


                           unixbench.time.minor_page_faults

   7.1e+07 ++--------------------------------------------------------------=
-+
           |                            OO O                               =
 |
  7.05e+07 ++                OO OO OOO O    O                              =
 |
     7e+07 +O  O                                                           =
 |
           O  O  O    O  O  O                                              =
 |
  6.95e+07 ++     OO O O  O                                                =
 |
           |                                                               =
 |
   6.9e+07 ++                                                            *.=
 |
           |    .*  .*       *              *.  *.        *   *.     * .*  =
*|
  6.85e+07 **.**  **  *      ::.*     .***.*  **  * *.**.* *.*  * *.* *    =
 *
   6.8e+07 ++          *.   : *  *.***             *             *         =
 |
           |             *  *                                              =
 |
  6.75e+07 ++            : :                                               =
 |
           |              ::                                               =
 |
   6.7e+07 ++-------------*------------------------------------------------=
-+


                       unixbench.time.voluntary_context_switches

  2.16e+06 ++--------------------------------------------------------------=
-+
           |                            O  O                               =
 |
  2.14e+06 +O  O O       O   OO OO OOO O O                                 =
 |
           O  O   OO  O   O O               O                              =
 |
  2.12e+06 ++        O O                                                   =
 |
           |                                                               =
 |
   2.1e+06 ++                                                              =
 |
           |                                                               =
 |
  2.08e+06 ++   .*   *                      *   *.        *   *.     * .**.=
 |
           *   *  : + *                *  .* +  : * *.  .* :  : * *.* *    =
**
  2.06e+06 +*.*   **   *.    * .*     + **    **   *  **   *.*   *         =
 |
           |             *   :*  *.***                                     =
 |
  2.04e+06 ++            :  *                                              =
 |
           |              :+                                               =
 |
  2.02e+06 ++-------------*------------------------------------------------=
-+


                     unixbench.time.involuntary_context_switches

  800000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  750000 **.**.**.***.**.*           .***.**.***.**.**.***.**.**.***.**.**.=
**
         |                :.***. *. *                                      =
 |
         |                *     *  *                                       =
 |
  700000 ++                                                                =
 |
         |                                                                 =
 |
  650000 ++                                                                =
 |
         |                                                                 =
 |
  600000 ++                                                                =
 |
         |                                                                 =
 |
         |                                                                 =
 |
  550000 OO OO OO O O  O OO OOO OO OO OOO                                  =
 |
         |         O  O                   OO                               =
 |
  500000 ++----------------------------------------------------------------=
-+



                                hackbench.throughput

  23000 ++-----------------------------------------------------------------=
-+
        |                *.*                                               =
 |
  22000 ++            *.*   :.**.***.                                      =
 |
        * .*      *.* :     *        * .*      *.* *. *.     .** .**. *.**.=
 |
  21000 +*  *.**.*   *                *  *.**.*   *  *  **.**   *    *     =
**
        |                                                                  =
 |
  20000 ++                                                                 =
 |
        |                                                                  =
 |
  19000 ++                                                                 =
 |
        |        O       O                                                 =
 |
  18000 ++ OO  O  O OOO    O  O  O O  O    O                               =
 |
        OO    O         O               OO                                 =
 |
  17000 ++                     O     O                                     =
 |
        |                   O     O                                        =
 |
  16000 ++-----------------------------------------------------------------=
-+


                           hackbench.time.minor_page_faults

  2.9e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  2.8e+06 ++              .**  **  *                                       =
 |
          *          *.  *   + : + :+ *          *. *          *.  .*    * =
 |
  2.7e+06 ++ **.  *.*  **     *   *  *:  **.  .**  * : **.  .**  **  :*.* :=
 *
  2.6e+06 +++   **                     :+   **       : :  **         *    :=
 |
          |*                           *              *                    =
*|
  2.5e+06 ++                                                               =
 |
          |                                                                =
 |
  2.4e+06 ++                                                               =
 |
  2.3e+06 ++ O    O O   O  OO     O                                        =
 |
          |          O                    O                                =
 |
  2.2e+06 OO  O OO     O O     O     O O O  O                              =
 |
          |                                                                =
 |
  2.1e+06 ++------------------O-O--O--O------------------------------------=
-+


                       hackbench.time.voluntary_context_switches

  1.8e+08 ++---------------------------------------------------------------=
-+
          |              O    O O  O  O                                    =
 |
  1.6e+08 +O    OO  OO  O                OO                                =
 |
  1.4e+08 O+ OO        O   OO     O    O    O                              =
 |
          |       O            O     O                                     =
 |
  1.2e+08 ++                                                               =
 |
          |                                                                =
 |
    1e+08 ++                                                               =
 |
          |                                                                =
 |
    8e+07 ++                                                               =
 |
    6e+07 ++                                                               =
 |
          |                                                                =
 |
    4e+07 ++                                                               =
 |
          |                                                                =
 |
    2e+07 **-**-***-**-***-**-***-**-***-**-**-***-**-***-**-***-**-***-**-=
**


                     hackbench.time.involuntary_context_switches

  8e+07 ++-----------------------------------------------------------------=
-+
        |  O     OO         O  O  O  O   O                                 =
 |
  7e+07 ++    O     O O O  O  O  O O  O O  O                               =
 |
  6e+07 OO  O  O     O   O                                                 =
 |
        |                                                                  =
 |
  5e+07 ++                                                                 =
 |
        |                                                                  =
 |
  4e+07 ++                                                                 =
 |
        |                                                                  =
 |
  3e+07 ++                                                                 =
 |
  2e+07 ++                                                                 =
 |
        |                                                                  =
 |
  1e+07 ++                                                                 =
 |
        |                                                                  =
 |
      0 **-**-**-**-***-**-**-**-***-**-**-**-**-***-**-**-**-***-**-**-**-=
**



	[*] bisect-good sample
	[O] bisect-bad  sample

To reproduce:

        git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tes=
ts.git
        cd lkp-tests
        bin/lkp install job.yaml  # job file is attached in this email
        bin/lkp run     job.yaml


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Xiaolong Ye

--===============8876560530828818865==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogdW5peGJlbmNoCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9u
aXRvcgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICBoZWFydGJlYXQ6IAogIHZtc3Rh
dDogCiAgbnVtYS1udW1hc3RhdDogCiAgbnVtYS12bXN0YXQ6IAogIG51bWEtbWVtaW5mbzogCiAg
cHJvYy12bXN0YXQ6IAogIHByb2Mtc3RhdDoKICAgIGludGVydmFsOiAxMAogIG1lbWluZm86IAog
IHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAogIGxhdGVuY3lfc3RhdHM6
IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tzdGF0czogCiAgbmZzc3Rh
dDogCiAgY3B1aWRsZTogCiAgY3B1ZnJlcS1zdGF0czogCiAgdHVyYm9zdGF0OiAKICBwbWV0ZXI6
IAogIHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDYwCmNwdWZyZXFfZ292ZXJub3I6IApkZWZh
dWx0LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogOWU3NDc0
YjEzYTk2Y2RmY2VhNmY4ZWE3Zjg4MTBkMDU3NDdmYTI1NAptb2RlbDogTmVoYWxlbQptZW1vcnk6
IDRHCm5yX2NwdTogOApoZGRfcGFydGl0aW9uczogCnN3YXBfcGFydGl0aW9uczogCnJvb3Rmc19w
YXJ0aXRpb246IApuZXRjb25zb2xlX3BvcnQ6IDY2NzEKY2F0ZWdvcnk6IGJlbmNobWFyawpucl90
YXNrOiAxMDAlCnVuaXhiZW5jaDoKICB0ZXN0OiBzaGVsbDgKcXVldWU6IGJpc2VjdAp0ZXN0Ym94
OiBuaG0td2hpdGUyCnRib3hfZ3JvdXA6IG5obS13aGl0ZTIKa2NvbmZpZzogeDg2XzY0LXJoZWwK
ZW5xdWV1ZV90aW1lOiAyMDE2LTA0LTEwIDEzOjQ2OjQzLjY0MTU5OTQxMyArMDg6MDAKY29tcGls
ZXI6IGdjYy00LjkKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CmlkOiBkNGJj
OTE2YjM2M2FmMDliYzAyZWIxNTY3NTAxNjYyY2IyMjFlNzJlCnVzZXI6IGxrcApoZWFkX2NvbW1p
dDogNjEwMmY5OGYyZDNiMmRlNWFjMmIxZTMyMDYxZjBjZGQ5NjliZGI3OApiYXNlX2NvbW1pdDog
OTczNWEyMjc5OWI5MjE0ZDE3ZDNjMjMxZmUzNzdmYzg1MmYwNDJlOQpicmFuY2g6IGxpbnV4LWRl
dmVsL2RldmVsLWhvdXJseS0yMDE2MDQwOTE0CnJlc3VsdF9yb290OiAiL3Jlc3VsdC91bml4YmVu
Y2gvMTAwJS1zaGVsbDgvbmhtLXdoaXRlMi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4
Nl82NC1yaGVsL2djYy00LjkvOWU3NDc0YjEzYTk2Y2RmY2VhNmY4ZWE3Zjg4MTBkMDU3NDdmYTI1
NC8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL25obS13aGl0ZTIvYmlzZWN0X3VuaXhiZW5j
aC0xMDAlLXNoZWxsOC1kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82NC1yaGVsLTll
NzQ3NGIxM2E5NmNkZmNlYTZmOGVhN2Y4ODEwZDA1NzQ3ZmEyNTQtMjAxNjA0MTAtMzIzNTktMWRl
aTQxMi0wLnlhbWwiCm1heF91cHRpbWU6IDEwMTcuNDIKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFu
L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9
L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQvbmhtLXdoaXRlMi9iaXNl
Y3RfdW5peGJlbmNoLTEwMCUtc2hlbGw4LWRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2
XzY0LXJoZWwtOWU3NDc0YjEzYTk2Y2RmY2VhNmY4ZWE3Zjg4MTBkMDU3NDdmYTI1NC0yMDE2MDQx
MC0zMjM1OS0xZGVpNDEyLTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhl
bAotIGJyYW5jaD1saW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjA0MDkxNAotIGNvbW1pdD05
ZTc0NzRiMTNhOTZjZGZjZWE2ZjhlYTdmODgxMGQwNTc0N2ZhMjU0Ci0gQk9PVF9JTUFHRT0vcGtn
L2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvOWU3NDc0YjEzYTk2Y2RmY2VhNmY4ZWE3Zjg4MTBk
MDU3NDdmYTI1NC92bWxpbnV6LTQuNi4wLXJjMi0wMDA4Ni1nOWU3NDc0YgotIG1heF91cHRpbWU9
MTAxNwotIFJFU1VMVF9ST09UPS9yZXN1bHQvdW5peGJlbmNoLzEwMCUtc2hlbGw4L25obS13aGl0
ZTIvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzllNzQ3
NGIxM2E5NmNkZmNlYTZmOGVhN2Y4ODEwZDA1NzQ3ZmEyNTQvMAotIExLUF9TRVJWRVI9aW5uCi0g
fDItCgoKICBlYXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCiAg
ZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1X3N0
YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRjaGRv
Zz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNrPTAKICBjb25z
b2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwpsa3BfaW5pdHJk
OiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51eC94
ODZfNjQtcmhlbC9nY2MtNC45LzllNzQ3NGIxM2E5NmNkZmNlYTZmOGVhN2Y4ODEwZDA1NzQ3ZmEy
NTQvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0y
MDE1LTAyLTA3LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAy
LTA3LmNnei9ydW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1
LTAyLTA3LmNnei90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy90dXJib3N0YXQuY2d6LC9s
a3AvYmVuY2htYXJrcy91bml4YmVuY2guY2d6IgpsaW51eF9oZWFkZXJzX2luaXRyZDogIi9wa2cv
bGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS85ZTc0NzRiMTNhOTZjZGZjZWE2ZjhlYTdmODgxMGQw
NTc0N2ZhMjU0L2xpbnV4LWhlYWRlcnMuY2d6IgpyZXBlYXRfdG86IDIKa2VybmVsOiAiL3BrZy9s
aW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzllNzQ3NGIxM2E5NmNkZmNlYTZmOGVhN2Y4ODEwZDA1
NzQ3ZmEyNTQvdm1saW51ei00LjYuMC1yYzItMDAwODYtZzllNzQ3NGIiCmRlcXVldWVfdGltZTog
MjAxNi0wNC0xMCAxMzo1NDoxMi4yNjQ0NDg1NjAgKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNoZWQK
bG9hZGF2ZzogMzkuMzkgMTkuNDQgNy42NCAxLzE3OCAxODkwOApzdGFydF90aW1lOiAnMTQ2MDI2
NzY3NicKZW5kX3RpbWU6ICcxNDYwMjY3ODY1Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE2
MDQwOS0yMTE5MDYiCg==

--===============8876560530828818865==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wNC0xMCAxMzo1NDozNiAuL1J1biBzaGVsbDggLWMgOAo=

--===============8876560530828818865==--

