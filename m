Content-Type: multipart/mixed; boundary="===============1149226106415375523=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [sched] e459adb2ba8: 34.3% aim9.shell_rtns_1.ops_per_sec
Date: Tue, 23 Jun 2015 14:48:35 +0800
Message-ID: <1435042115.5606.4.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1149226106415375523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://bee.sh.intel.com/git/ydu19/tip for-lkp
commit e459adb2ba8ab652c433dca73c3acae40d169f9e ("sched: Rewrite runnable l=
oad and utilization average tracking")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/testtime/test:
  ivb43/aim9/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/3=
00s/shell_rtns_1

commit: =

  9bbe7cde215731e74810351f10e8b6b10fb0c6c4
  e459adb2ba8ab652c433dca73c3acae40d169f9e

9bbe7cde215731e7 e459adb2ba8ab652c433dca73c =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    385.19 =C2=B1  0%     +34.3%     517.12 =C2=B1  0%  aim9.shell_rtns_1.o=
ps_per_sec
    347090 =C2=B1  0%     -91.2%      30475 =C2=B1  0%  aim9.time.involunta=
ry_context_switches
  37920343 =C2=B1  0%     +34.4%   50948025 =C2=B1  0%  aim9.time.minor_pag=
e_faults
    923580 =C2=B1  0%     +32.6%    1224420 =C2=B1  0%  aim9.time.voluntary=
_context_switches
    202477 =C2=B1  7%     -23.1%     155733 =C2=B1  0%  softirqs.SCHED
     16092 =C2=B1  0%     -23.5%      12313 =C2=B1  0%  vmstat.system.cs
      1410 =C2=B1  0%      +4.6%       1475 =C2=B1  0%  vmstat.system.in
    467130 =C2=B1  0%     +33.8%     625217 =C2=B1  0%  latency_stats.hits.=
do_wait.SyS_wait4.entry_SYSCALL_64_fastpath
 8.271e+08 =C2=B1  0%      +1.9%  8.425e+08 =C2=B1  0%  latency_stats.sum.d=
o_wait.SyS_wait4.entry_SYSCALL_64_fastpath
   2940067 =C2=B1  0%     +13.7%    3344325 =C2=B1  2%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
     27393 =C2=B1  3%     +28.4%      35170 =C2=B1  3%  meminfo.Active(anon)
     23554 =C2=B1  5%     +28.2%      30199 =C2=B1  4%  meminfo.AnonPages
     60490 =C2=B1  0%     -26.4%      44523 =C2=B1  1%  meminfo.Committed_AS
    347090 =C2=B1  0%     -91.2%      30475 =C2=B1  0%  time.involuntary_co=
ntext_switches
  37920343 =C2=B1  0%     +34.4%   50948025 =C2=B1  0%  time.minor_page_fau=
lts
    923580 =C2=B1  0%     +32.6%    1224420 =C2=B1  0%  time.voluntary_cont=
ext_switches
  16090701 =C2=B1  0%     +42.8%   22973036 =C2=B1  0%  numa-numastat.node0=
.local_node
  16090706 =C2=B1  0%     +42.8%   22973046 =C2=B1  0%  numa-numastat.node0=
.numa_hit
  16090046 =C2=B1  0%     +26.3%   20327645 =C2=B1  1%  numa-numastat.node1=
.local_node
  16090054 =C2=B1  0%     +26.3%   20327653 =C2=B1  1%  numa-numastat.node1=
.numa_hit
     60054 =C2=B1  2%     +17.2%      70377 =C2=B1  4%  numa-meminfo.node0.=
Active
      8034 =C2=B1 13%    +127.3%      18260 =C2=B1 20%  numa-meminfo.node0.=
Active(anon)
      8802 =C2=B1 12%     +80.0%      15844 =C2=B1 11%  numa-meminfo.node0.=
AnonPages
     10802 =C2=B1  0%     -37.9%       6709 =C2=B1 35%  numa-meminfo.node1.=
Mapped
      1959 =C2=B1 11%     +33.5%       2616 =C2=B1  7%  numa-meminfo.node1.=
PageTables
      2.06 =C2=B1  0%      +4.4%       2.15 =C2=B1  0%  turbostat.%Busy
     67.00 =C2=B1  0%      +7.5%      72.00 =C2=B1  0%  turbostat.Avg_MHz
     10.38 =C2=B1  0%     -20.4%       8.26 =C2=B1  0%  turbostat.CPU%c1
     66.22 =C2=B1  0%     -14.7%      56.52 =C2=B1  0%  turbostat.CorWatt
     18.09 =C2=B1  1%    +104.0%      36.91 =C2=B1  0%  turbostat.Pkg%pc2
     97.35 =C2=B1  0%     -10.1%      87.54 =C2=B1  0%  turbostat.PkgWatt
      5.30 =C2=B1  0%     -18.2%       4.33 =C2=B1  0%  turbostat.RAMWatt
  10739645 =C2=B1 48%    +446.3%   58665823 =C2=B1  7%  cpuidle.C1-IVT.time
      5358 =C2=B1  9%     +70.7%       9146 =C2=B1  7%  cpuidle.C1-IVT.usage
     60911 =C2=B1  6%  +18367.0%   11248528 =C2=B1  9%  cpuidle.C1E-IVT.time
    488.50 =C2=B1  3%    +239.6%       1658 =C2=B1  5%  cpuidle.C1E-IVT.usa=
ge
    281692 =C2=B1 22%    +209.1%     870695 =C2=B1  3%  cpuidle.C3-IVT.time
    866.00 =C2=B1  4%    +202.2%       2616 =C2=B1  2%  cpuidle.C3-IVT.usage
   2242247 =C2=B1  0%     -27.8%    1618870 =C2=B1  0%  cpuidle.C6-IVT.usage
     62.00 =C2=B1 46%   +1007.3%     686.50 =C2=B1142%  cpuidle.POLL.time
      6847 =C2=B1  3%     +28.4%       8788 =C2=B1  3%  proc-vmstat.nr_acti=
ve_anon
      5887 =C2=B1  5%     +28.3%       7555 =C2=B1  4%  proc-vmstat.nr_anon=
_pages
  32158827 =C2=B1  0%     +34.6%   43300322 =C2=B1  0%  proc-vmstat.numa_hit
  32158813 =C2=B1  0%     +34.6%   43300304 =C2=B1  0%  proc-vmstat.numa_lo=
cal
      3035 =C2=B1  1%     +30.7%       3967 =C2=B1  0%  proc-vmstat.pgactiv=
ate
   2182798 =C2=B1  0%     +42.7%    3113844 =C2=B1  0%  proc-vmstat.pgalloc=
_dma32
  31396519 =C2=B1  0%     +34.6%   42270713 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
  38510560 =C2=B1  0%     +33.8%   51532080 =C2=B1  0%  proc-vmstat.pgfault
  33572871 =C2=B1  0%     +35.2%   45377125 =C2=B1  0%  proc-vmstat.pgfree
      2008 =C2=B1 13%    +127.7%       4571 =C2=B1 20%  numa-vmstat.node0.n=
r_active_anon
      2199 =C2=B1 12%     +80.5%       3971 =C2=B1 11%  numa-vmstat.node0.n=
r_anon_pages
   8164375 =C2=B1  0%     +42.6%   11641319 =C2=B1  1%  numa-vmstat.node0.n=
uma_hit
   8102185 =C2=B1  0%     +43.7%   11640477 =C2=B1  1%  numa-vmstat.node0.n=
uma_local
     62189 =C2=B1  1%     -98.6%     841.50 =C2=B1 47%  numa-vmstat.node0.n=
uma_other
      2700 =C2=B1  0%     -37.9%       1676 =C2=B1 35%  numa-vmstat.node1.n=
r_mapped
    484.50 =C2=B1 10%     +35.2%     655.00 =C2=B1  6%  numa-vmstat.node1.n=
r_page_table_pages
   8175543 =C2=B1  0%     +25.2%   10236346 =C2=B1  1%  numa-vmstat.node1.n=
uma_hit
   8160218 =C2=B1  0%     +24.5%   10159781 =C2=B1  1%  numa-vmstat.node1.n=
uma_local
     15324 =C2=B1  4%    +399.6%      76564 =C2=B1  0%  numa-vmstat.node1.n=
uma_other
      8137 =C2=B1  1%     +23.7%      10066 =C2=B1  3%  slabinfo.anon_vma.a=
ctive_objs
      8137 =C2=B1  1%     +23.7%      10066 =C2=B1  3%  slabinfo.anon_vma.n=
um_objs
    558.00 =C2=B1 18%     +47.5%     823.25 =C2=B1 10%  slabinfo.cifs_small=
_rq.active_objs
    558.00 =C2=B1 18%     +47.5%     823.25 =C2=B1 10%  slabinfo.cifs_small=
_rq.num_objs
    607.00 =C2=B1  8%     -18.1%     497.25 =C2=B1  3%  slabinfo.file_lock_=
cache.active_objs
    607.00 =C2=B1  8%     -18.1%     497.25 =C2=B1  3%  slabinfo.file_lock_=
cache.num_objs
     18182 =C2=B1  6%     +20.2%      21862 =C2=B1  0%  slabinfo.kmalloc-19=
2.active_objs
     18222 =C2=B1  6%     +20.7%      21990 =C2=B1  0%  slabinfo.kmalloc-19=
2.num_objs
     53766 =C2=B1  0%     +15.2%      61944 =C2=B1  1%  slabinfo.kmalloc-64=
.active_objs
    840.25 =C2=B1  0%     +15.4%     969.75 =C2=B1  1%  slabinfo.kmalloc-64=
.active_slabs
     53794 =C2=B1  0%     +15.4%      62091 =C2=B1  1%  slabinfo.kmalloc-64=
.num_objs
    840.25 =C2=B1  0%     +15.4%     969.75 =C2=B1  1%  slabinfo.kmalloc-64=
.num_slabs
     19805 =C2=B1  6%     +13.1%      22394 =C2=B1  0%  slabinfo.vm_area_st=
ruct.active_objs
     19847 =C2=B1  6%     +13.2%      22461 =C2=B1  0%  slabinfo.vm_area_st=
ruct.num_objs
    713.75 =C2=B1 29%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.blocked_load_avg
      7046 =C2=B1 13%     +30.0%       9162 =C2=B1  9%  sched_debug.cfs_rq[=
0]:/.exec_clock
     52172 =C2=B1  6%    +219.9%     166925 =C2=B1  7%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     75488 =C2=B1  2%     -99.7%     190.25 =C2=B1  3%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
    732.00 =C2=B1 28%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
    725.75 =C2=B1 32%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
10]:/.blocked_load_avg
      2892 =C2=B1  4%     +15.1%       3328 =C2=B1  4%  sched_debug.cfs_rq[=
10]:/.exec_clock
     45031 =C2=B1 10%    +244.3%     155055 =C2=B1  3%  sched_debug.cfs_rq[=
10]:/.min_vruntime
      0.50 =C2=B1100%   +1150.0%       6.25 =C2=B1 90%  sched_debug.cfs_rq[=
10]:/.nr_spread_over
     72519 =C2=B1  3%     -99.7%     189.25 =C2=B1  3%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
    734.50 =C2=B1 34%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
10]:/.tg_load_contrib
    791.00 =C2=B1 77%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.blocked_load_avg
      2868 =C2=B1  2%     +15.9%       3325 =C2=B1  1%  sched_debug.cfs_rq[=
11]:/.exec_clock
     45501 =C2=B1  6%    +236.6%     153155 =C2=B1  3%  sched_debug.cfs_rq[=
11]:/.min_vruntime
     72631 =C2=B1  3%     -99.7%     189.25 =C2=B1  3%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
    802.50 =C2=B1 77%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.tg_load_contrib
    603.00 =C2=B1 27%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.blocked_load_avg
     49409 =C2=B1  6%    +188.8%     142675 =C2=B1  5%  sched_debug.cfs_rq[=
12]:/.min_vruntime
     -2763 =C2=B1-187%    +777.4%     -24250 =C2=B1-31%  sched_debug.cfs_rq=
[12]:/.spread0
     72514 =C2=B1  3%     -99.7%     189.75 =C2=B1  3%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
    613.50 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.tg_load_contrib
    694.00 =C2=B1 46%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.blocked_load_avg
     48983 =C2=B1  3%    +206.2%     149979 =C2=B1  7%  sched_debug.cfs_rq[=
13]:/.min_vruntime
     -3189 =C2=B1-149%    +431.3%     -16945 =C2=B1-26%  sched_debug.cfs_rq=
[13]:/.spread0
     72029 =C2=B1  3%     -99.7%     189.00 =C2=B1  4%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
    692.75 =C2=B1 44%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.tg_load_contrib
    583.50 =C2=B1 23%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.blocked_load_avg
     24.50 =C2=B1 70%     -75.5%       6.00 =C2=B1-16%  sched_debug.cfs_rq[=
14]:/.load
     55844 =C2=B1 20%    +153.9%     141798 =C2=B1  4%  sched_debug.cfs_rq[=
14]:/.min_vruntime
     71162 =C2=B1  3%     -99.7%     189.25 =C2=B1  3%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
    605.25 =C2=B1 24%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.tg_load_contrib
    892.50 =C2=B1 56%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.blocked_load_avg
     47426 =C2=B1 12%    +222.3%     152845 =C2=B1  3%  sched_debug.cfs_rq[=
15]:/.min_vruntime
      1.33 =C2=B1141%    +200.0%       4.00 =C2=B1 68%  sched_debug.cfs_rq[=
15]:/.nr_spread_over
     71173 =C2=B1  3%     -99.7%     189.50 =C2=B1  3%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
    898.00 =C2=B1 56%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.tg_load_contrib
    827.75 =C2=B1 71%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.blocked_load_avg
     45912 =C2=B1  6%    +224.6%     149021 =C2=B1  6%  sched_debug.cfs_rq[=
16]:/.min_vruntime
     -6260 =C2=B1-99%    +186.0%     -17903 =C2=B1-47%  sched_debug.cfs_rq[=
16]:/.spread0
     70627 =C2=B1  2%     -99.7%     188.75 =C2=B1  4%  sched_debug.cfs_rq[=
16]:/.tg_load_avg
    831.00 =C2=B1 72%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.tg_load_contrib
    394.25 =C2=B1 56%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.blocked_load_avg
     48734 =C2=B1  9%    +210.1%     151127 =C2=B1  5%  sched_debug.cfs_rq[=
17]:/.min_vruntime
     70196 =C2=B1  2%     -99.7%     188.50 =C2=B1  4%  sched_debug.cfs_rq[=
17]:/.tg_load_avg
    396.50 =C2=B1 56%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.tg_load_contrib
    662.75 =C2=B1 27%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.blocked_load_avg
      2852 =C2=B1  7%     +22.8%       3504 =C2=B1 14%  sched_debug.cfs_rq[=
18]:/.exec_clock
     45026 =C2=B1 11%    +245.2%     155413 =C2=B1  6%  sched_debug.cfs_rq[=
18]:/.min_vruntime
     70035 =C2=B1  2%     -99.7%     188.25 =C2=B1  4%  sched_debug.cfs_rq[=
18]:/.tg_load_avg
    662.75 =C2=B1 27%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.tg_load_contrib
    577.00 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.blocked_load_avg
     51812 =C2=B1 10%    +184.0%     147144 =C2=B1  4%  sched_debug.cfs_rq[=
19]:/.min_vruntime
      4.25 =C2=B1 58%     -70.6%       1.25 =C2=B1 34%  sched_debug.cfs_rq[=
19]:/.nr_spread_over
   -361.56 =C2=B1-1880%   +5371.2%     -19782 =C2=B1-44%  sched_debug.cfs_r=
q[19]:/.spread0
     70097 =C2=B1  2%     -99.7%     189.00 =C2=B1  4%  sched_debug.cfs_rq[=
19]:/.tg_load_avg
    578.00 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.tg_load_contrib
      1062 =C2=B1 17%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.blocked_load_avg
      2999 =C2=B1  5%     +32.1%       3962 =C2=B1 16%  sched_debug.cfs_rq[=
1]:/.exec_clock
     46685 =C2=B1  9%    +229.5%     153835 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.min_vruntime
     75636 =C2=B1  2%     -99.7%     190.50 =C2=B1  3%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
      1076 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
      1020 =C2=B1 49%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.blocked_load_avg
     51824 =C2=B1 13%    +182.3%     146277 =C2=B1  3%  sched_debug.cfs_rq[=
20]:/.min_vruntime
   -349.54 =C2=B1-1261%   +5807.6%     -20649 =C2=B1-46%  sched_debug.cfs_r=
q[20]:/.spread0
     70105 =C2=B1  2%     -99.7%     188.50 =C2=B1  4%  sched_debug.cfs_rq[=
20]:/.tg_load_avg
      1024 =C2=B1 48%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.tg_load_contrib
      1042 =C2=B1 65%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.blocked_load_avg
      3295 =C2=B1  3%      -7.7%       3041 =C2=B1  4%  sched_debug.cfs_rq[=
21]:/.exec_clock
     50291 =C2=B1 13%    +176.5%     139036 =C2=B1  3%  sched_debug.cfs_rq[=
21]:/.min_vruntime
     -1885 =C2=B1-492%   +1379.7%     -27893 =C2=B1-40%  sched_debug.cfs_rq=
[21]:/.spread0
     69738 =C2=B1  3%     -99.7%     189.00 =C2=B1  4%  sched_debug.cfs_rq[=
21]:/.tg_load_avg
      1047 =C2=B1 64%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.tg_load_contrib
    857.25 =C2=B1 34%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.blocked_load_avg
     52691 =C2=B1  5%    +173.8%     144247 =C2=B1  8%  sched_debug.cfs_rq[=
22]:/.min_vruntime
    515.22 =C2=B1992%   -4502.3%     -22681 =C2=B1-45%  sched_debug.cfs_rq[=
22]:/.spread0
     69472 =C2=B1  2%     -99.7%     188.50 =C2=B1  4%  sched_debug.cfs_rq[=
22]:/.tg_load_avg
    864.50 =C2=B1 33%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.tg_load_contrib
      1082 =C2=B1 22%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
23]:/.blocked_load_avg
     53353 =C2=B1  2%    +167.5%     142717 =C2=B1  5%  sched_debug.cfs_rq[=
23]:/.min_vruntime
      1177 =C2=B1344%   -2156.7%     -24214 =C2=B1-37%  sched_debug.cfs_rq[=
23]:/.spread0
     69023 =C2=B1  2%     -99.7%     189.00 =C2=B1  3%  sched_debug.cfs_rq[=
23]:/.tg_load_avg
      1083 =C2=B1 22%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
23]:/.tg_load_contrib
      2793 =C2=B1 35%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.blocked_load_avg
      5324 =C2=B1  5%     -10.5%       4765 =C2=B1  2%  sched_debug.cfs_rq[=
24]:/.exec_clock
    114657 =C2=B1  5%     +58.0%     181154 =C2=B1  2%  sched_debug.cfs_rq[=
24]:/.min_vruntime
     62481 =C2=B1 14%     -77.2%      14221 =C2=B1103%  sched_debug.cfs_rq[=
24]:/.spread0
     68958 =C2=B1  2%     -99.7%     188.25 =C2=B1  4%  sched_debug.cfs_rq[=
24]:/.tg_load_avg
      2790 =C2=B1 35%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.tg_load_contrib
      2030 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.blocked_load_avg
      5339 =C2=B1  3%     -12.7%       4658 =C2=B1  2%  sched_debug.cfs_rq[=
25]:/.exec_clock
    113807 =C2=B1  3%     +55.9%     177382 =C2=B1  2%  sched_debug.cfs_rq[=
25]:/.min_vruntime
     61630 =C2=B1 11%     -83.0%      10450 =C2=B1148%  sched_debug.cfs_rq[=
25]:/.spread0
     68911 =C2=B1  2%     -99.7%     188.25 =C2=B1  4%  sched_debug.cfs_rq[=
25]:/.tg_load_avg
      2038 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.tg_load_contrib
      2326 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.blocked_load_avg
    114984 =C2=B1  5%     +59.2%     183071 =C2=B1  4%  sched_debug.cfs_rq[=
26]:/.min_vruntime
      0.33 =C2=B1141%    +500.0%       2.00 =C2=B1 61%  sched_debug.cfs_rq[=
26]:/.nr_spread_over
     62807 =C2=B1 13%     -74.3%      16137 =C2=B1 91%  sched_debug.cfs_rq[=
26]:/.spread0
     68443 =C2=B1  3%     -99.7%     187.25 =C2=B1  3%  sched_debug.cfs_rq[=
26]:/.tg_load_avg
      2328 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.tg_load_contrib
      2054 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.blocked_load_avg
    110285 =C2=B1  4%     +66.1%     183130 =C2=B1  2%  sched_debug.cfs_rq[=
27]:/.min_vruntime
     58109 =C2=B1 13%     -72.1%      16196 =C2=B1101%  sched_debug.cfs_rq[=
27]:/.spread0
     68531 =C2=B1  3%     -99.7%     187.00 =C2=B1  3%  sched_debug.cfs_rq[=
27]:/.tg_load_avg
      2064 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.tg_load_contrib
      2080 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.blocked_load_avg
    106242 =C2=B1  3%     +72.6%     183361 =C2=B1  2%  sched_debug.cfs_rq[=
28]:/.min_vruntime
     54066 =C2=B1 11%     -69.6%      16426 =C2=B1 98%  sched_debug.cfs_rq[=
28]:/.spread0
     68539 =C2=B1  3%     -99.7%     186.75 =C2=B1  3%  sched_debug.cfs_rq[=
28]:/.tg_load_avg
      2095 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.tg_load_contrib
      1913 =C2=B1 22%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
29]:/.blocked_load_avg
    103117 =C2=B1  3%     +88.8%     194697 =C2=B1  3%  sched_debug.cfs_rq[=
29]:/.min_vruntime
     50940 =C2=B1  9%     -45.5%      27761 =C2=B1 62%  sched_debug.cfs_rq[=
29]:/.spread0
     68601 =C2=B1  2%     -99.7%     186.50 =C2=B1  3%  sched_debug.cfs_rq[=
29]:/.tg_load_avg
      1914 =C2=B1 21%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
29]:/.tg_load_contrib
    521.00 =C2=B1 36%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.blocked_load_avg
     47975 =C2=B1  7%    +242.3%     164219 =C2=B1  9%  sched_debug.cfs_rq[=
2]:/.min_vruntime
     75722 =C2=B1  1%     -99.8%     188.75 =C2=B1  3%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
    544.25 =C2=B1 34%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
      2191 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
30]:/.blocked_load_avg
    101907 =C2=B1  0%     +82.6%     186037 =C2=B1  2%  sched_debug.cfs_rq[=
30]:/.min_vruntime
     49731 =C2=B1  8%     -61.6%      19100 =C2=B1 64%  sched_debug.cfs_rq[=
30]:/.spread0
     68519 =C2=B1  3%     -99.7%     186.25 =C2=B1  4%  sched_debug.cfs_rq[=
30]:/.tg_load_avg
      2206 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
30]:/.tg_load_contrib
      1905 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.blocked_load_avg
    102334 =C2=B1  0%     +78.7%     182843 =C2=B1  2%  sched_debug.cfs_rq[=
31]:/.min_vruntime
     50158 =C2=B1  7%     -68.3%      15907 =C2=B1 95%  sched_debug.cfs_rq[=
31]:/.spread0
     68565 =C2=B1  3%     -99.7%     186.00 =C2=B1  4%  sched_debug.cfs_rq[=
31]:/.tg_load_avg
      1914 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.tg_load_contrib
      2163 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
32]:/.blocked_load_avg
    106311 =C2=B1  3%     +72.7%     183644 =C2=B1  2%  sched_debug.cfs_rq[=
32]:/.min_vruntime
     54134 =C2=B1  9%     -69.1%      16701 =C2=B1 96%  sched_debug.cfs_rq[=
32]:/.spread0
     68546 =C2=B1  2%     -99.7%     186.00 =C2=B1  4%  sched_debug.cfs_rq[=
32]:/.tg_load_avg
      2161 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
32]:/.tg_load_contrib
      2346 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
33]:/.blocked_load_avg
    104562 =C2=B1  3%     +73.2%     181103 =C2=B1  1%  sched_debug.cfs_rq[=
33]:/.min_vruntime
     52384 =C2=B1 11%     -73.0%      14161 =C2=B1103%  sched_debug.cfs_rq[=
33]:/.spread0
     68720 =C2=B1  2%     -99.7%     185.75 =C2=B1  4%  sched_debug.cfs_rq[=
33]:/.tg_load_avg
      2350 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
33]:/.tg_load_contrib
      1553 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
34]:/.blocked_load_avg
    107680 =C2=B1  2%     +67.7%     180563 =C2=B1  2%  sched_debug.cfs_rq[=
34]:/.min_vruntime
     55501 =C2=B1  9%     -75.5%      13619 =C2=B1 66%  sched_debug.cfs_rq[=
34]:/.spread0
     68704 =C2=B1  2%     -99.7%     185.75 =C2=B1  4%  sched_debug.cfs_rq[=
34]:/.tg_load_avg
      1559 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
34]:/.tg_load_contrib
      2186 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
35]:/.blocked_load_avg
      5168 =C2=B1  4%     -11.0%       4601 =C2=B1  5%  sched_debug.cfs_rq[=
35]:/.exec_clock
    111393 =C2=B1  4%     +56.6%     174437 =C2=B1  4%  sched_debug.cfs_rq[=
35]:/.min_vruntime
     59214 =C2=B1 13%     -87.3%       7493 =C2=B1265%  sched_debug.cfs_rq[=
35]:/.spread0
     68676 =C2=B1  2%     -99.7%     186.00 =C2=B1  4%  sched_debug.cfs_rq[=
35]:/.tg_load_avg
      2188 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
35]:/.tg_load_contrib
      2179 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
36]:/.blocked_load_avg
      5073 =C2=B1  2%     -15.0%       4310 =C2=B1  1%  sched_debug.cfs_rq[=
36]:/.exec_clock
    109519 =C2=B1  3%     +56.2%     171024 =C2=B1  1%  sched_debug.cfs_rq[=
36]:/.min_vruntime
     57340 =C2=B1  6%     -92.9%       4080 =C2=B1299%  sched_debug.cfs_rq[=
36]:/.spread0
     68731 =C2=B1  2%     -99.7%     186.00 =C2=B1  4%  sched_debug.cfs_rq[=
36]:/.tg_load_avg
      2184 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
36]:/.tg_load_contrib
      2226 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
37]:/.blocked_load_avg
    107431 =C2=B1  4%     +67.0%     179427 =C2=B1  2%  sched_debug.cfs_rq[=
37]:/.min_vruntime
     55252 =C2=B1  4%     -77.4%      12482 =C2=B1 63%  sched_debug.cfs_rq[=
37]:/.spread0
     68082 =C2=B1  2%     -99.7%     186.00 =C2=B1  4%  sched_debug.cfs_rq[=
37]:/.tg_load_avg
      2238 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
37]:/.tg_load_contrib
      1891 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
38]:/.blocked_load_avg
    108160 =C2=B1  8%     +63.4%     176728 =C2=B1  6%  sched_debug.cfs_rq[=
38]:/.min_vruntime
     55981 =C2=B1 16%     -82.5%       9782 =C2=B1 64%  sched_debug.cfs_rq[=
38]:/.spread0
     68205 =C2=B1  2%     -99.7%     185.75 =C2=B1  3%  sched_debug.cfs_rq[=
38]:/.tg_load_avg
      1894 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
38]:/.tg_load_contrib
      1681 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
39]:/.blocked_load_avg
      4813 =C2=B1  4%      -8.8%       4389 =C2=B1  2%  sched_debug.cfs_rq[=
39]:/.exec_clock
    102924 =C2=B1  4%     +69.2%     174194 =C2=B1  2%  sched_debug.cfs_rq[=
39]:/.min_vruntime
     50746 =C2=B1  5%     -85.7%       7247 =C2=B1166%  sched_debug.cfs_rq[=
39]:/.spread0
     68430 =C2=B1  2%     -99.7%     185.75 =C2=B1  3%  sched_debug.cfs_rq[=
39]:/.tg_load_avg
      1682 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
39]:/.tg_load_contrib
    864.25 =C2=B1 27%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
     45887 =C2=B1  9%    +237.8%     154991 =C2=B1  4%  sched_debug.cfs_rq[=
3]:/.min_vruntime
     75679 =C2=B1  1%     -99.7%     190.00 =C2=B1  3%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
    867.25 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
      1885 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
40]:/.blocked_load_avg
     98552 =C2=B1  3%     +84.5%     181873 =C2=B1  5%  sched_debug.cfs_rq[=
40]:/.min_vruntime
      1.00 =C2=B1-100%     +75.0%       1.75 =C2=B1 24%  sched_debug.cfs_rq=
[40]:/.nr_spread_over
     46373 =C2=B1 10%     -67.8%      14925 =C2=B1 55%  sched_debug.cfs_rq[=
40]:/.spread0
     68576 =C2=B1  2%     -99.7%     186.00 =C2=B1  3%  sched_debug.cfs_rq[=
40]:/.tg_load_avg
      1903 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
40]:/.tg_load_contrib
      1684 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
41]:/.blocked_load_avg
    100354 =C2=B1  4%     +82.0%     182624 =C2=B1  6%  sched_debug.cfs_rq[=
41]:/.min_vruntime
     48176 =C2=B1 10%     -67.5%      15671 =C2=B1 49%  sched_debug.cfs_rq[=
41]:/.spread0
     68681 =C2=B1  2%     -99.7%     186.00 =C2=B1  3%  sched_debug.cfs_rq[=
41]:/.tg_load_avg
      1684 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
41]:/.tg_load_contrib
      1999 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
42]:/.blocked_load_avg
    101411 =C2=B1  2%     +71.3%     173767 =C2=B1  2%  sched_debug.cfs_rq[=
42]:/.min_vruntime
     49232 =C2=B1 10%     -86.2%       6814 =C2=B1182%  sched_debug.cfs_rq[=
42]:/.spread0
     68687 =C2=B1  2%     -99.7%     185.50 =C2=B1  3%  sched_debug.cfs_rq[=
42]:/.tg_load_avg
      2010 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
42]:/.tg_load_contrib
      1707 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
43]:/.blocked_load_avg
     98230 =C2=B1  1%     +73.9%     170861 =C2=B1  3%  sched_debug.cfs_rq[=
43]:/.min_vruntime
     46051 =C2=B1  5%     -91.5%       3908 =C2=B1183%  sched_debug.cfs_rq[=
43]:/.spread0
     68742 =C2=B1  2%     -99.7%     184.50 =C2=B1  4%  sched_debug.cfs_rq[=
43]:/.tg_load_avg
      1709 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
43]:/.tg_load_contrib
      2334 =C2=B1 21%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
44]:/.blocked_load_avg
    107160 =C2=B1  8%     +62.5%     174154 =C2=B1  1%  sched_debug.cfs_rq[=
44]:/.min_vruntime
     54980 =C2=B1 11%     -86.9%       7201 =C2=B1173%  sched_debug.cfs_rq[=
44]:/.spread0
     68913 =C2=B1  2%     -99.7%     184.50 =C2=B1  4%  sched_debug.cfs_rq[=
44]:/.tg_load_avg
      2341 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
44]:/.tg_load_contrib
      2620 =C2=B1 28%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
45]:/.blocked_load_avg
    105848 =C2=B1  2%     +62.5%     171981 =C2=B1  3%  sched_debug.cfs_rq[=
45]:/.min_vruntime
     53668 =C2=B1  9%     -90.6%       5027 =C2=B1237%  sched_debug.cfs_rq[=
45]:/.spread0
     68969 =C2=B1  2%     -99.7%     184.75 =C2=B1  4%  sched_debug.cfs_rq[=
45]:/.tg_load_avg
      2620 =C2=B1 28%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
45]:/.tg_load_contrib
      2257 =C2=B1 27%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
46]:/.blocked_load_avg
    103353 =C2=B1  1%     +67.6%     173241 =C2=B1  4%  sched_debug.cfs_rq[=
46]:/.min_vruntime
     51173 =C2=B1  6%     -87.7%       6287 =C2=B1101%  sched_debug.cfs_rq[=
46]:/.spread0
     69280 =C2=B1  2%     -99.7%     184.75 =C2=B1  4%  sched_debug.cfs_rq[=
46]:/.tg_load_avg
      2263 =C2=B1 27%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
46]:/.tg_load_contrib
      1905 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
47]:/.blocked_load_avg
      6488 =C2=B1  8%     -31.5%       4443 =C2=B1  6%  sched_debug.cfs_rq[=
47]:/.exec_clock
    103199 =C2=B1  3%     +72.7%     178250 =C2=B1  7%  sched_debug.cfs_rq[=
47]:/.min_vruntime
     51018 =C2=B1  3%     -77.9%      11296 =C2=B1 69%  sched_debug.cfs_rq[=
47]:/.spread0
     69497 =C2=B1  2%     -99.7%     185.00 =C2=B1  4%  sched_debug.cfs_rq[=
47]:/.tg_load_avg
      1957 =C2=B1 25%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
47]:/.tg_load_contrib
    746.25 =C2=B1 44%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.blocked_load_avg
      2727 =C2=B1  5%     +90.3%       5190 =C2=B1 39%  sched_debug.cfs_rq[=
4]:/.exec_clock
     42660 =C2=B1 10%    +286.5%     164879 =C2=B1  4%  sched_debug.cfs_rq[=
4]:/.min_vruntime
     75658 =C2=B1  1%     -99.7%     190.00 =C2=B1  3%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
    759.50 =C2=B1 43%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
    504.00 =C2=B1 41%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.blocked_load_avg
      2707 =C2=B1  2%     +82.4%       4937 =C2=B1 20%  sched_debug.cfs_rq[=
5]:/.exec_clock
     43773 =C2=B1  7%    +260.0%     157603 =C2=B1  6%  sched_debug.cfs_rq[=
5]:/.min_vruntime
     75163 =C2=B1  1%     -99.7%     190.25 =C2=B1  3%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
    511.00 =C2=B1 40%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.tg_load_contrib
    761.25 =C2=B1105%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
      2768 =C2=B1  3%     +23.9%       3431 =C2=B1  2%  sched_debug.cfs_rq[=
6]:/.exec_clock
     42141 =C2=B1  5%    +255.6%     149867 =C2=B1  3%  sched_debug.cfs_rq[=
6]:/.min_vruntime
      1.33 =C2=B1 93%    +256.3%       4.75 =C2=B1 58%  sched_debug.cfs_rq[=
6]:/.nr_spread_over
     75091 =C2=B1  1%     -99.7%     190.50 =C2=B1  3%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
    765.75 =C2=B1104%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
    809.50 =C2=B1 46%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.blocked_load_avg
      2722 =C2=B1  4%     +33.1%       3622 =C2=B1 17%  sched_debug.cfs_rq[=
7]:/.exec_clock
     43126 =C2=B1 10%    +243.2%     147991 =C2=B1  2%  sched_debug.cfs_rq[=
7]:/.min_vruntime
     74321 =C2=B1  2%     -99.7%     190.25 =C2=B1  3%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
    820.75 =C2=B1 45%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.tg_load_contrib
    773.50 =C2=B1 52%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.blocked_load_avg
      2769 =C2=B1  1%     +16.3%       3219 =C2=B1  3%  sched_debug.cfs_rq[=
8]:/.exec_clock
     42829 =C2=B1  7%    +251.0%     150316 =C2=B1  8%  sched_debug.cfs_rq[=
8]:/.min_vruntime
     73482 =C2=B1  3%     -99.7%     190.25 =C2=B1  3%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
    779.00 =C2=B1 51%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.tg_load_contrib
      1261 =C2=B1 84%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.blocked_load_avg
      2794 =C2=B1  4%     +35.0%       3772 =C2=B1 15%  sched_debug.cfs_rq[=
9]:/.exec_clock
     44773 =C2=B1  5%    +241.3%     152812 =C2=B1  3%  sched_debug.cfs_rq[=
9]:/.min_vruntime
      0.50 =C2=B1100%    +450.0%       2.75 =C2=B1 47%  sched_debug.cfs_rq[=
9]:/.nr_spread_over
     72633 =C2=B1  3%     -99.7%     189.00 =C2=B1  3%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
      1278 =C2=B1 85%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.tg_load_contrib
      1.25 =C2=B1 34%    -100.0%       0.00 =C2=B1  0%  sched_debug.cpu#0.c=
pu_load[3]
     33710 =C2=B1  4%     -19.4%      27179 =C2=B1  2%  sched_debug.cpu#0.n=
r_load_updates
     67269 =C2=B1  4%     -11.1%      59834 =C2=B1  1%  sched_debug.cpu#0.n=
r_switches
     74216 =C2=B1  4%     -10.3%      66580 =C2=B1  2%  sched_debug.cpu#0.s=
ched_count
     30631 =C2=B1  4%     -10.7%      27358 =C2=B1  1%  sched_debug.cpu#0.s=
ched_goidle
      7807 =C2=B1  5%     -43.9%       4381 =C2=B1 11%  sched_debug.cpu#0.t=
twu_local
     34013 =C2=B1  5%     -21.0%      26884 =C2=B1  1%  sched_debug.cpu#1.n=
r_load_updates
     65575 =C2=B1  6%     -10.6%      58593 =C2=B1  1%  sched_debug.cpu#1.n=
r_switches
      0.00 =C2=B1  5%      -Inf%     -27.50 =C2=B1-51%  sched_debug.cpu#1.n=
r_uninterruptible
     66252 =C2=B1  6%     -10.7%      59159 =C2=B1  2%  sched_debug.cpu#1.s=
ched_count
      6563 =C2=B1  9%     -47.8%       3425 =C2=B1 11%  sched_debug.cpu#1.t=
twu_local
     32494 =C2=B1  4%     -20.2%      25930 =C2=B1  1%  sched_debug.cpu#10.=
nr_load_updates
      5432 =C2=B1  6%     -49.5%       2745 =C2=B1  9%  sched_debug.cpu#10.=
ttwu_local
     32683 =C2=B1  5%     -21.8%      25559 =C2=B1  1%  sched_debug.cpu#11.=
nr_load_updates
     61992 =C2=B1  4%     -11.0%      55175 =C2=B1  0%  sched_debug.cpu#11.=
nr_switches
     62418 =C2=B1  4%     -11.1%      55491 =C2=B1  0%  sched_debug.cpu#11.=
sched_count
      5627 =C2=B1  6%     -55.8%       2485 =C2=B1  3%  sched_debug.cpu#11.=
ttwu_local
     31445 =C2=B1  5%     -20.6%      24978 =C2=B1  1%  sched_debug.cpu#12.=
nr_load_updates
     61078 =C2=B1  3%     -11.3%      54156 =C2=B1  1%  sched_debug.cpu#12.=
nr_switches
     61527 =C2=B1  3%     -10.5%      55062 =C2=B1  2%  sched_debug.cpu#12.=
sched_count
     26101 =C2=B1 16%     -20.9%      20656 =C2=B1  4%  sched_debug.cpu#12.=
ttwu_count
      6447 =C2=B1  4%     -68.2%       2050 =C2=B1  4%  sched_debug.cpu#12.=
ttwu_local
     30615 =C2=B1  1%     -17.9%      25147 =C2=B1  2%  sched_debug.cpu#13.=
nr_load_updates
     60076 =C2=B1  4%      -9.3%      54507 =C2=B1  1%  sched_debug.cpu#13.=
nr_switches
      6423 =C2=B1  9%     -63.4%       2349 =C2=B1 12%  sched_debug.cpu#13.=
ttwu_local
      9476 =C2=B1 68%     -93.0%     664.00 =C2=B1  0%  sched_debug.cpu#14.=
curr->pid
     24.50 =C2=B1 70%     -75.5%       6.00 =C2=B1-16%  sched_debug.cpu#14.=
load
     32356 =C2=B1  8%     -22.4%      25105 =C2=B1  1%  sched_debug.cpu#14.=
nr_load_updates
      7083 =C2=B1 22%     -54.6%       3216 =C2=B1 47%  sched_debug.cpu#14.=
ttwu_local
     30549 =C2=B1  4%     -17.5%      25199 =C2=B1  2%  sched_debug.cpu#15.=
nr_load_updates
      6389 =C2=B1  7%     -65.5%       2205 =C2=B1  9%  sched_debug.cpu#15.=
ttwu_local
     29714 =C2=B1  4%     -16.2%      24908 =C2=B1  1%  sched_debug.cpu#16.=
nr_load_updates
      6127 =C2=B1 10%     -62.5%       2300 =C2=B1  4%  sched_debug.cpu#16.=
ttwu_local
     30422 =C2=B1  5%     -18.2%      24877 =C2=B1  0%  sched_debug.cpu#17.=
nr_load_updates
      6299 =C2=B1  9%     -61.4%       2428 =C2=B1  6%  sched_debug.cpu#17.=
ttwu_local
     30057 =C2=B1  4%     -16.9%      24979 =C2=B1  1%  sched_debug.cpu#18.=
nr_load_updates
      6158 =C2=B1  7%     -61.5%       2368 =C2=B1  5%  sched_debug.cpu#18.=
ttwu_local
     30081 =C2=B1  5%     -17.4%      24841 =C2=B1  1%  sched_debug.cpu#19.=
nr_load_updates
      5927 =C2=B1  9%     -60.1%       2367 =C2=B1  5%  sched_debug.cpu#19.=
ttwu_local
     33430 =C2=B1  1%     -21.6%      26195 =C2=B1  2%  sched_debug.cpu#2.n=
r_load_updates
     65248 =C2=B1  3%     -14.1%      56056 =C2=B1  0%  sched_debug.cpu#2.n=
r_switches
     65513 =C2=B1  3%     -14.1%      56259 =C2=B1  1%  sched_debug.cpu#2.s=
ched_count
     30415 =C2=B1  3%     -12.1%      26721 =C2=B1  1%  sched_debug.cpu#2.s=
ched_goidle
      6428 =C2=B1  3%     -60.7%       2523 =C2=B1  5%  sched_debug.cpu#2.t=
twu_local
     31249 =C2=B1  8%     -21.8%      24422 =C2=B1  0%  sched_debug.cpu#20.=
nr_load_updates
     59995 =C2=B1  9%     -12.3%      52591 =C2=B1  1%  sched_debug.cpu#20.=
nr_switches
     60627 =C2=B1 10%     -12.6%      52983 =C2=B1  1%  sched_debug.cpu#20.=
sched_count
      6358 =C2=B1 15%     -65.6%       2184 =C2=B1  4%  sched_debug.cpu#20.=
ttwu_local
     31125 =C2=B1  7%     -21.6%      24390 =C2=B1  1%  sched_debug.cpu#21.=
nr_load_updates
      4.25 =C2=B1 60%     -52.9%       2.00 =C2=B1-50%  sched_debug.cpu#22.=
cpu_load[2]
      4.75 =C2=B1 40%     -86.0%       0.67 =C2=B1141%  sched_debug.cpu#22.=
cpu_load[3]
      3.75 =C2=B1 39%     -93.3%       0.25 =C2=B1173%  sched_debug.cpu#22.=
cpu_load[4]
     30706 =C2=B1  4%     -20.2%      24489 =C2=B1  0%  sched_debug.cpu#22.=
nr_load_updates
     58329 =C2=B1  3%      -9.4%      52867 =C2=B1  1%  sched_debug.cpu#22.=
sched_count
      5785 =C2=B1  3%     -63.5%       2114 =C2=B1  6%  sched_debug.cpu#22.=
ttwu_local
     32040 =C2=B1  6%     -24.3%      24251 =C2=B1  0%  sched_debug.cpu#23.=
nr_load_updates
     60244 =C2=B1  4%     -12.8%      52514 =C2=B1  0%  sched_debug.cpu#23.=
nr_switches
     -2.00 =C2=B1-93%    -162.5%       1.25 =C2=B1 66%  sched_debug.cpu#23.=
nr_uninterruptible
     61723 =C2=B1  4%     -13.9%      53173 =C2=B1  1%  sched_debug.cpu#23.=
sched_count
     27573 =C2=B1  3%      -8.4%      25247 =C2=B1  0%  sched_debug.cpu#23.=
sched_goidle
     26694 =C2=B1 17%     -27.8%      19281 =C2=B1  3%  sched_debug.cpu#23.=
ttwu_count
      6367 =C2=B1 13%     -67.3%       2082 =C2=B1  6%  sched_debug.cpu#23.=
ttwu_local
    969684 =C2=B1  3%     -17.7%     797975 =C2=B1 10%  sched_debug.cpu#24.=
avg_idle
     28760 =C2=B1  5%     -58.2%      12012 =C2=B1  2%  sched_debug.cpu#24.=
nr_load_updates
     45237 =C2=B1  3%     -45.9%      24452 =C2=B1  2%  sched_debug.cpu#24.=
nr_switches
     45247 =C2=B1  3%     -45.9%      24459 =C2=B1  2%  sched_debug.cpu#24.=
sched_count
     20603 =C2=B1  3%     -60.7%       8106 =C2=B1  3%  sched_debug.cpu#24.=
sched_goidle
     12987 =C2=B1  5%     -40.9%       7676 =C2=B1  4%  sched_debug.cpu#24.=
ttwu_count
      4247 =C2=B1  2%     -79.9%     853.75 =C2=B1  8%  sched_debug.cpu#24.=
ttwu_local
    973262 =C2=B1  3%     -25.7%     723434 =C2=B1 17%  sched_debug.cpu#25.=
avg_idle
     28582 =C2=B1  6%     -58.3%      11926 =C2=B1  2%  sched_debug.cpu#25.=
nr_load_updates
     44540 =C2=B1  3%     -45.6%      24239 =C2=B1  1%  sched_debug.cpu#25.=
nr_switches
     45710 =C2=B1  6%     -47.0%      24247 =C2=B1  1%  sched_debug.cpu#25.=
sched_count
     20321 =C2=B1  3%     -60.0%       8121 =C2=B1  1%  sched_debug.cpu#25.=
sched_goidle
     12695 =C2=B1  3%     -42.1%       7344 =C2=B1  4%  sched_debug.cpu#25.=
ttwu_count
      4130 =C2=B1  1%     -81.0%     783.50 =C2=B1  5%  sched_debug.cpu#25.=
ttwu_local
    995974 =C2=B1  0%     -26.3%     734346 =C2=B1  9%  sched_debug.cpu#26.=
avg_idle
     28206 =C2=B1  5%     -57.2%      12059 =C2=B1  3%  sched_debug.cpu#26.=
nr_load_updates
     43989 =C2=B1  2%     -44.5%      24421 =C2=B1  1%  sched_debug.cpu#26.=
nr_switches
     43997 =C2=B1  2%     -44.5%      24430 =C2=B1  1%  sched_debug.cpu#26.=
sched_count
     20038 =C2=B1  2%     -59.5%       8115 =C2=B1  1%  sched_debug.cpu#26.=
sched_goidle
     12781 =C2=B1  2%     -38.7%       7830 =C2=B1 13%  sched_debug.cpu#26.=
ttwu_count
      4188 =C2=B1  3%     -80.8%     805.75 =C2=B1  7%  sched_debug.cpu#26.=
ttwu_local
    995751 =C2=B1  0%     -22.8%     768479 =C2=B1 17%  sched_debug.cpu#27.=
avg_idle
     26862 =C2=B1  5%     -54.1%      12317 =C2=B1  3%  sched_debug.cpu#27.=
nr_load_updates
     41061 =C2=B1  2%     -39.1%      24990 =C2=B1  2%  sched_debug.cpu#27.=
nr_switches
     41069 =C2=B1  2%     -39.1%      24999 =C2=B1  2%  sched_debug.cpu#27.=
sched_count
     18675 =C2=B1  2%     -56.3%       8162 =C2=B1  0%  sched_debug.cpu#27.=
sched_goidle
     12057 =C2=B1  5%     -34.8%       7859 =C2=B1  5%  sched_debug.cpu#27.=
ttwu_count
      3986 =C2=B1  1%     -74.7%       1010 =C2=B1 34%  sched_debug.cpu#27.=
ttwu_local
    969014 =C2=B1  4%     -24.9%     727518 =C2=B1 12%  sched_debug.cpu#28.=
avg_idle
     26246 =C2=B1  4%     -54.6%      11914 =C2=B1  0%  sched_debug.cpu#28.=
nr_load_updates
     40530 =C2=B1  1%     -40.6%      24080 =C2=B1  1%  sched_debug.cpu#28.=
nr_switches
     40541 =C2=B1  1%     -40.6%      24089 =C2=B1  1%  sched_debug.cpu#28.=
sched_count
     18333 =C2=B1  1%     -56.3%       8004 =C2=B1  2%  sched_debug.cpu#28.=
sched_goidle
     11526 =C2=B1  2%     -36.3%       7345 =C2=B1  2%  sched_debug.cpu#28.=
ttwu_count
      4090 =C2=B1  1%     -81.0%     777.50 =C2=B1  8%  sched_debug.cpu#28.=
ttwu_local
    998318 =C2=B1  0%     -22.1%     777824 =C2=B1 14%  sched_debug.cpu#29.=
avg_idle
     26148 =C2=B1  5%     -54.1%      12009 =C2=B1  3%  sched_debug.cpu#29.=
nr_load_updates
     40449 =C2=B1  2%     -34.5%      26502 =C2=B1 10%  sched_debug.cpu#29.=
nr_switches
     40459 =C2=B1  2%     -34.5%      26514 =C2=B1 10%  sched_debug.cpu#29.=
sched_count
     18411 =C2=B1  2%     -51.0%       9030 =C2=B1 15%  sched_debug.cpu#29.=
sched_goidle
     11653 =C2=B1  2%     -27.2%       8487 =C2=B1 19%  sched_debug.cpu#29.=
ttwu_count
     33313 =C2=B1  3%     -22.5%      25821 =C2=B1  2%  sched_debug.cpu#3.n=
r_load_updates
     63302 =C2=B1  3%     -11.8%      55816 =C2=B1  2%  sched_debug.cpu#3.n=
r_switches
     64602 =C2=B1  4%     -13.3%      56022 =C2=B1  2%  sched_debug.cpu#3.s=
ched_count
     29637 =C2=B1  3%     -10.5%      26520 =C2=B1  2%  sched_debug.cpu#3.s=
ched_goidle
      6458 =C2=B1  1%     -54.2%       2955 =C2=B1 15%  sched_debug.cpu#3.t=
twu_local
    988099 =C2=B1  1%     -19.4%     796880 =C2=B1  5%  sched_debug.cpu#30.=
avg_idle
     25915 =C2=B1  5%     -53.8%      11980 =C2=B1  1%  sched_debug.cpu#30.=
nr_load_updates
     40275 =C2=B1  3%     -38.8%      24667 =C2=B1  1%  sched_debug.cpu#30.=
nr_switches
     40284 =C2=B1  3%     -38.7%      24675 =C2=B1  1%  sched_debug.cpu#30.=
sched_count
     18269 =C2=B1  3%     -55.6%       8113 =C2=B1  1%  sched_debug.cpu#30.=
sched_goidle
     11582 =C2=B1  3%     -33.0%       7766 =C2=B1  2%  sched_debug.cpu#30.=
ttwu_count
      3860 =C2=B1  2%     -78.9%     815.75 =C2=B1  6%  sched_debug.cpu#30.=
ttwu_local
    977588 =C2=B1  2%     -22.5%     757174 =C2=B1 18%  sched_debug.cpu#31.=
avg_idle
     26359 =C2=B1  4%     -54.7%      11937 =C2=B1  2%  sched_debug.cpu#31.=
nr_load_updates
     41147 =C2=B1  2%     -40.9%      24327 =C2=B1  1%  sched_debug.cpu#31.=
nr_switches
     41158 =C2=B1  2%     -40.9%      24336 =C2=B1  1%  sched_debug.cpu#31.=
sched_count
     18767 =C2=B1  2%     -57.1%       8057 =C2=B1  2%  sched_debug.cpu#31.=
sched_goidle
     11588 =C2=B1  4%     -29.3%       8189 =C2=B1 12%  sched_debug.cpu#31.=
ttwu_count
      3824 =C2=B1  3%     -80.3%     752.00 =C2=B1  4%  sched_debug.cpu#31.=
ttwu_local
    991278 =C2=B1  1%     -19.8%     794943 =C2=B1 15%  sched_debug.cpu#32.=
avg_idle
     26571 =C2=B1  5%     -55.9%      11712 =C2=B1  2%  sched_debug.cpu#32.=
nr_load_updates
     41346 =C2=B1  2%     -41.4%      24212 =C2=B1  0%  sched_debug.cpu#32.=
nr_switches
      1.00 =C2=B1200%     -75.0%       0.25 =C2=B1435%  sched_debug.cpu#32.=
nr_uninterruptible
     41355 =C2=B1  2%     -41.4%      24220 =C2=B1  0%  sched_debug.cpu#32.=
sched_count
     18849 =C2=B1  2%     -57.7%       7969 =C2=B1  1%  sched_debug.cpu#32.=
sched_goidle
     11766 =C2=B1  2%     -35.9%       7546 =C2=B1  1%  sched_debug.cpu#32.=
ttwu_count
      3845 =C2=B1  1%     -79.4%     790.25 =C2=B1  4%  sched_debug.cpu#32.=
ttwu_local
    994269 =C2=B1  0%     -28.6%     709947 =C2=B1 13%  sched_debug.cpu#33.=
avg_idle
     26830 =C2=B1  4%     -56.5%      11680 =C2=B1  1%  sched_debug.cpu#33.=
nr_load_updates
     41853 =C2=B1  1%     -42.2%      24201 =C2=B1  1%  sched_debug.cpu#33.=
nr_switches
     41864 =C2=B1  1%     -40.7%      24814 =C2=B1  4%  sched_debug.cpu#33.=
sched_count
     19058 =C2=B1  1%     -57.8%       8035 =C2=B1  2%  sched_debug.cpu#33.=
sched_goidle
     11878 =C2=B1  3%     -37.8%       7387 =C2=B1  2%  sched_debug.cpu#33.=
ttwu_count
      3955 =C2=B1  1%     -81.2%     745.50 =C2=B1  4%  sched_debug.cpu#33.=
ttwu_local
    994375 =C2=B1  0%     -27.9%     716725 =C2=B1 17%  sched_debug.cpu#34.=
avg_idle
     27308 =C2=B1  4%     -56.8%      11801 =C2=B1  1%  sched_debug.cpu#34.=
nr_load_updates
     42763 =C2=B1  1%     -42.9%      24426 =C2=B1  0%  sched_debug.cpu#34.=
nr_switches
     42771 =C2=B1  1%     -42.9%      24435 =C2=B1  0%  sched_debug.cpu#34.=
sched_count
     19507 =C2=B1  1%     -58.3%       8135 =C2=B1  1%  sched_debug.cpu#34.=
sched_goidle
     12070 =C2=B1  3%     -38.6%       7413 =C2=B1  1%  sched_debug.cpu#34.=
ttwu_count
      3968 =C2=B1  1%     -80.7%     764.50 =C2=B1  9%  sched_debug.cpu#34.=
ttwu_local
    965181 =C2=B1  4%     -30.1%     674484 =C2=B1 12%  sched_debug.cpu#35.=
avg_idle
     27847 =C2=B1  5%     -58.4%      11589 =C2=B1  2%  sched_debug.cpu#35.=
nr_load_updates
     43660 =C2=B1  2%     -45.0%      24021 =C2=B1  2%  sched_debug.cpu#35.=
nr_switches
     43670 =C2=B1  2%     -45.0%      24030 =C2=B1  2%  sched_debug.cpu#35.=
sched_count
     19924 =C2=B1  2%     -59.9%       7990 =C2=B1  1%  sched_debug.cpu#35.=
sched_goidle
     12734 =C2=B1  1%     -40.6%       7561 =C2=B1  7%  sched_debug.cpu#35.=
ttwu_count
      4108 =C2=B1  2%     -82.3%     728.25 =C2=B1  5%  sched_debug.cpu#35.=
ttwu_local
    981111 =C2=B1  3%     -20.3%     781873 =C2=B1 19%  sched_debug.cpu#36.=
avg_idle
     27056 =C2=B1  4%     -57.8%      11429 =C2=B1  2%  sched_debug.cpu#36.=
nr_load_updates
     42253 =C2=B1  2%     -45.2%      23174 =C2=B1  1%  sched_debug.cpu#36.=
nr_switches
     42263 =C2=B1  2%     -45.1%      23183 =C2=B1  1%  sched_debug.cpu#36.=
sched_count
     19196 =C2=B1  2%     -58.6%       7954 =C2=B1  2%  sched_debug.cpu#36.=
sched_goidle
     12701 =C2=B1  7%     -47.8%       6626 =C2=B1  2%  sched_debug.cpu#36.=
ttwu_count
      4149 =C2=B1  4%     -81.5%     765.75 =C2=B1 14%  sched_debug.cpu#36.=
ttwu_local
    975838 =C2=B1  3%     -22.5%     755818 =C2=B1 12%  sched_debug.cpu#37.=
avg_idle
     26267 =C2=B1  4%     -55.5%      11686 =C2=B1  3%  sched_debug.cpu#37.=
nr_load_updates
     42694 =C2=B1  7%     -44.3%      23775 =C2=B1  2%  sched_debug.cpu#37.=
nr_switches
     42706 =C2=B1  7%     -41.9%      24820 =C2=B1  6%  sched_debug.cpu#37.=
sched_count
     19481 =C2=B1  7%     -58.5%       8092 =C2=B1  3%  sched_debug.cpu#37.=
sched_goidle
     12858 =C2=B1 13%     -44.5%       7132 =C2=B1  4%  sched_debug.cpu#37.=
ttwu_count
      4962 =C2=B1 32%     -82.9%     848.00 =C2=B1 23%  sched_debug.cpu#37.=
ttwu_local
    988623 =C2=B1  0%     -24.5%     745948 =C2=B1 13%  sched_debug.cpu#38.=
avg_idle
     27329 =C2=B1  5%     -56.9%      11766 =C2=B1  3%  sched_debug.cpu#38.=
nr_load_updates
     44270 =C2=B1 13%     -46.4%      23744 =C2=B1  2%  sched_debug.cpu#38.=
nr_switches
     44281 =C2=B1 13%     -46.4%      23754 =C2=B1  2%  sched_debug.cpu#38.=
sched_count
     20034 =C2=B1 12%     -59.1%       8186 =C2=B1  3%  sched_debug.cpu#38.=
sched_goidle
     12924 =C2=B1 12%     -40.0%       7750 =C2=B1 14%  sched_debug.cpu#38.=
ttwu_count
      4495 =C2=B1 15%     -84.2%     709.75 =C2=B1  3%  sched_debug.cpu#38.=
ttwu_local
    994246 =C2=B1  0%     -24.4%     751865 =C2=B1 14%  sched_debug.cpu#39.=
avg_idle
     25182 =C2=B1  4%     -54.5%      11449 =C2=B1  0%  sched_debug.cpu#39.=
nr_load_updates
     38601 =C2=B1  2%     -40.1%      23133 =C2=B1  1%  sched_debug.cpu#39.=
nr_switches
      1.25 =C2=B1 87%    +300.0%       5.00 =C2=B1 84%  sched_debug.cpu#39.=
nr_uninterruptible
     38610 =C2=B1  2%     -40.1%      23143 =C2=B1  1%  sched_debug.cpu#39.=
sched_count
     17513 =C2=B1  2%     -54.9%       7894 =C2=B1  0%  sched_debug.cpu#39.=
sched_goidle
     11707 =C2=B1  9%     -42.0%       6791 =C2=B1  2%  sched_debug.cpu#39.=
ttwu_count
      3877 =C2=B1  2%     -79.6%     789.25 =C2=B1  9%  sched_debug.cpu#39.=
ttwu_local
     32468 =C2=B1  4%     -18.7%      26401 =C2=B1  4%  sched_debug.cpu#4.n=
r_load_updates
     61935 =C2=B1  4%      -9.8%      55865 =C2=B1  2%  sched_debug.cpu#4.n=
r_switches
     62632 =C2=B1  5%     -10.5%      56027 =C2=B1  2%  sched_debug.cpu#4.s=
ched_count
     29111 =C2=B1  5%     -10.2%      26144 =C2=B1  0%  sched_debug.cpu#4.s=
ched_goidle
      6381 =C2=B1  8%     -51.0%       3127 =C2=B1 21%  sched_debug.cpu#4.t=
twu_local
    980974 =C2=B1  1%     -26.2%     723614 =C2=B1 22%  sched_debug.cpu#40.=
avg_idle
     24657 =C2=B1  3%     -53.5%      11463 =C2=B1  1%  sched_debug.cpu#40.=
nr_load_updates
     38210 =C2=B1  3%     -39.4%      23158 =C2=B1  1%  sched_debug.cpu#40.=
nr_switches
     38219 =C2=B1  3%     -39.4%      23168 =C2=B1  1%  sched_debug.cpu#40.=
sched_count
     17243 =C2=B1  3%     -54.6%       7837 =C2=B1  0%  sched_debug.cpu#40.=
sched_goidle
     10983 =C2=B1  2%     -31.9%       7481 =C2=B1  9%  sched_debug.cpu#40.=
ttwu_count
      3963 =C2=B1  2%     -81.1%     748.50 =C2=B1  4%  sched_debug.cpu#40.=
ttwu_local
    987745 =C2=B1  0%     -16.5%     825097 =C2=B1 10%  sched_debug.cpu#41.=
avg_idle
     24862 =C2=B1  3%     -53.9%      11452 =C2=B1  2%  sched_debug.cpu#41.=
nr_load_updates
     38452 =C2=B1  3%     -39.8%      23132 =C2=B1  1%  sched_debug.cpu#41.=
nr_switches
     38461 =C2=B1  3%     -39.8%      23141 =C2=B1  1%  sched_debug.cpu#41.=
sched_count
     17430 =C2=B1  3%     -55.0%       7836 =C2=B1  1%  sched_debug.cpu#41.=
sched_goidle
     11065 =C2=B1  2%     -34.2%       7286 =C2=B1  9%  sched_debug.cpu#41.=
ttwu_count
      3863 =C2=B1  2%     -81.4%     720.00 =C2=B1 10%  sched_debug.cpu#41.=
ttwu_local
    972721 =C2=B1  2%     -25.4%     725721 =C2=B1 17%  sched_debug.cpu#42.=
avg_idle
     24914 =C2=B1  4%     -54.7%      11276 =C2=B1  2%  sched_debug.cpu#42.=
nr_load_updates
     38641 =C2=B1  3%     -40.9%      22835 =C2=B1  1%  sched_debug.cpu#42.=
nr_switches
     38651 =C2=B1  3%     -40.9%      22845 =C2=B1  1%  sched_debug.cpu#42.=
sched_count
     17508 =C2=B1  3%     -56.0%       7708 =C2=B1  3%  sched_debug.cpu#42.=
sched_goidle
     11314 =C2=B1  3%     -40.9%       6690 =C2=B1  2%  sched_debug.cpu#42.=
ttwu_count
      3878 =C2=B1  2%     -82.2%     689.25 =C2=B1  2%  sched_debug.cpu#42.=
ttwu_local
    990828 =C2=B1  1%     -28.6%     707683 =C2=B1 20%  sched_debug.cpu#43.=
avg_idle
     25150 =C2=B1  4%     -54.2%      11507 =C2=B1  2%  sched_debug.cpu#43.=
nr_load_updates
     40824 =C2=B1  6%     -38.4%      25145 =C2=B1 12%  sched_debug.cpu#43.=
nr_switches
      0.50 =C2=B1223%    +900.0%       5.00 =C2=B1 34%  sched_debug.cpu#43.=
nr_uninterruptible
     41523 =C2=B1  8%     -39.4%      25154 =C2=B1 12%  sched_debug.cpu#43.=
sched_count
     18581 =C2=B1  6%     -52.3%       8869 =C2=B1 14%  sched_debug.cpu#43.=
sched_goidle
     12445 =C2=B1 15%     -37.6%       7769 =C2=B1 22%  sched_debug.cpu#43.=
ttwu_count
    940665 =C2=B1  8%     -20.2%     750711 =C2=B1 10%  sched_debug.cpu#44.=
avg_idle
     26469 =C2=B1  9%     -56.4%      11539 =C2=B1  1%  sched_debug.cpu#44.=
nr_load_updates
     44425 =C2=B1  9%     -47.3%      23402 =C2=B1  1%  sched_debug.cpu#44.=
nr_switches
     44434 =C2=B1  9%     -47.3%      23410 =C2=B1  1%  sched_debug.cpu#44.=
sched_count
     20150 =C2=B1  9%     -60.0%       8069 =C2=B1  1%  sched_debug.cpu#44.=
sched_goidle
     13674 =C2=B1 17%     -50.8%       6732 =C2=B1  2%  sched_debug.cpu#44.=
ttwu_count
      5202 =C2=B1 28%     -85.6%     748.50 =C2=B1  5%  sched_debug.cpu#44.=
ttwu_local
    934288 =C2=B1  6%     -26.0%     691500 =C2=B1 17%  sched_debug.cpu#45.=
avg_idle
     26420 =C2=B1  6%     -56.7%      11438 =C2=B1  2%  sched_debug.cpu#45.=
nr_load_updates
     42159 =C2=B1  4%     -44.7%      23318 =C2=B1  2%  sched_debug.cpu#45.=
nr_switches
     -0.50 =C2=B1-223%   -1000.0%       4.50 =C2=B1 40%  sched_debug.cpu#45=
.nr_uninterruptible
     42964 =C2=B1  3%     -45.7%      23327 =C2=B1  2%  sched_debug.cpu#45.=
sched_count
     19107 =C2=B1  4%     -57.6%       8098 =C2=B1  4%  sched_debug.cpu#45.=
sched_goidle
     12876 =C2=B1  6%     -38.8%       7880 =C2=B1  5%  sched_debug.cpu#45.=
ttwu_count
      4160 =C2=B1  6%     -84.5%     644.50 =C2=B1  3%  sched_debug.cpu#45.=
ttwu_local
    964063 =C2=B1  4%     -17.6%     794497 =C2=B1 11%  sched_debug.cpu#46.=
avg_idle
     26798 =C2=B1  3%     -57.9%      11288 =C2=B1  3%  sched_debug.cpu#46.=
nr_load_updates
     42932 =C2=B1  2%     -46.7%      22862 =C2=B1  1%  sched_debug.cpu#46.=
nr_switches
      1.50 =C2=B1 57%    +266.7%       5.50 =C2=B1 37%  sched_debug.cpu#46.=
nr_uninterruptible
     42942 =C2=B1  2%     -46.7%      22870 =C2=B1  1%  sched_debug.cpu#46.=
sched_count
     19570 =C2=B1  2%     -60.2%       7795 =C2=B1  1%  sched_debug.cpu#46.=
sched_goidle
     13200 =C2=B1  2%     -41.3%       7743 =C2=B1  3%  sched_debug.cpu#46.=
ttwu_count
      4102 =C2=B1  0%     -83.5%     676.00 =C2=B1  2%  sched_debug.cpu#46.=
ttwu_local
    999051 =C2=B1  0%     -27.7%     721881 =C2=B1 13%  sched_debug.cpu#47.=
avg_idle
     27409 =C2=B1  4%     -58.8%      11295 =C2=B1  3%  sched_debug.cpu#47.=
nr_load_updates
     45046 =C2=B1  2%     -49.4%      22805 =C2=B1  2%  sched_debug.cpu#47.=
nr_switches
     -0.25 =C2=B1-768%   -1400.0%       3.25 =C2=B1 33%  sched_debug.cpu#47=
.nr_uninterruptible
     45056 =C2=B1  2%     -49.4%      22815 =C2=B1  2%  sched_debug.cpu#47.=
sched_count
     20581 =C2=B1  2%     -62.3%       7752 =C2=B1  1%  sched_debug.cpu#47.=
sched_goidle
     14957 =C2=B1  4%     -48.9%       7643 =C2=B1  3%  sched_debug.cpu#47.=
ttwu_count
      4273 =C2=B1  2%     -83.7%     696.50 =C2=B1 10%  sched_debug.cpu#47.=
ttwu_local
     32289 =C2=B1  4%     -22.1%      25140 =C2=B1  1%  sched_debug.cpu#5.n=
r_load_updates
     61462 =C2=B1  2%     -10.4%      55046 =C2=B1  2%  sched_debug.cpu#5.n=
r_switches
     -2.25 =C2=B1-119%    +244.4%      -7.75 =C2=B1-57%  sched_debug.cpu#5.=
nr_uninterruptible
     61679 =C2=B1  3%     -10.5%      55222 =C2=B1  2%  sched_debug.cpu#5.s=
ched_count
     28939 =C2=B1  3%      -9.8%      26113 =C2=B1  2%  sched_debug.cpu#5.s=
ched_goidle
      5975 =C2=B1  4%     -52.6%       2834 =C2=B1  3%  sched_debug.cpu#5.t=
twu_local
     31753 =C2=B1  4%     -20.4%      25285 =C2=B1  1%  sched_debug.cpu#6.n=
r_load_updates
     61596 =C2=B1  5%     -11.2%      54724 =C2=B1  1%  sched_debug.cpu#6.n=
r_switches
     -0.25 =C2=B1-655%   +1700.0%      -4.50 =C2=B1-33%  sched_debug.cpu#6.=
nr_uninterruptible
     62714 =C2=B1  7%     -12.5%      54864 =C2=B1  1%  sched_debug.cpu#6.s=
ched_count
     29044 =C2=B1  6%     -10.5%      26004 =C2=B1  1%  sched_debug.cpu#6.s=
ched_goidle
      6228 =C2=B1 22%     -56.6%       2700 =C2=B1  3%  sched_debug.cpu#6.t=
twu_local
     32358 =C2=B1  4%     -20.5%      25721 =C2=B1  0%  sched_debug.cpu#7.n=
r_load_updates
      5698 =C2=B1  5%     -49.4%       2881 =C2=B1  7%  sched_debug.cpu#7.t=
twu_local
     32344 =C2=B1  4%     -20.5%      25716 =C2=B1  1%  sched_debug.cpu#8.n=
r_load_updates
      5611 =C2=B1  4%     -49.4%       2841 =C2=B1 17%  sched_debug.cpu#8.t=
twu_local
     32294 =C2=B1  5%     -20.2%      25772 =C2=B1  1%  sched_debug.cpu#9.n=
r_load_updates
     64442 =C2=B1  7%     -13.0%      56068 =C2=B1  0%  sched_debug.cpu#9.s=
ched_count
      5701 =C2=B1 11%     -52.1%       2729 =C2=B1  9%  sched_debug.cpu#9.t=
twu_local

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/testtime/test:
  ivb43/aim9/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/3=
00s/shell_rtns_3

commit: =

  9bbe7cde215731e74810351f10e8b6b10fb0c6c4
  e459adb2ba8ab652c433dca73c3acae40d169f9e

9bbe7cde215731e7 e459adb2ba8ab652c433dca73c =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    385.45 =C2=B1  0%     +34.1%     516.95 =C2=B1  0%  aim9.shell_rtns_3.o=
ps_per_sec
    347384 =C2=B1  0%     -91.1%      30826 =C2=B1  1%  aim9.time.involunta=
ry_context_switches
  37801133 =C2=B1  0%     +34.5%   50853221 =C2=B1  0%  aim9.time.minor_pag=
e_faults
    924176 =C2=B1  0%     +32.4%    1224050 =C2=B1  0%  aim9.time.voluntary=
_context_switches
    187240 =C2=B1  0%     -12.9%     163018 =C2=B1  8%  softirqs.SCHED
     16078 =C2=B1  0%     -23.5%      12304 =C2=B1  0%  vmstat.system.cs
      1414 =C2=B1  0%      +4.3%       1475 =C2=B1  0%  vmstat.system.in
    467412 =C2=B1  0%     +33.7%     625016 =C2=B1  0%  latency_stats.hits.=
do_wait.SyS_wait4.entry_SYSCALL_64_fastpath
 8.276e+08 =C2=B1  0%      +1.9%  8.429e+08 =C2=B1  0%  latency_stats.sum.d=
o_wait.SyS_wait4.entry_SYSCALL_64_fastpath
   2950797 =C2=B1  1%     +12.6%    3323409 =C2=B1  2%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
    347384 =C2=B1  0%     -91.1%      30826 =C2=B1  1%  time.involuntary_co=
ntext_switches
  37801133 =C2=B1  0%     +34.5%   50853221 =C2=B1  0%  time.minor_page_fau=
lts
    924176 =C2=B1  0%     +32.4%    1224050 =C2=B1  0%  time.voluntary_cont=
ext_switches
     27387 =C2=B1  3%     +27.6%      34945 =C2=B1  4%  meminfo.Active(anon)
     24104 =C2=B1  2%     +24.5%      30017 =C2=B1  5%  meminfo.AnonPages
     61381 =C2=B1  0%     -26.2%      45308 =C2=B1  2%  meminfo.Committed_AS
      3457 =C2=B1  8%     +29.2%       4467 =C2=B1 18%  meminfo.PageTables
  16079154 =C2=B1  0%     +40.2%   22547895 =C2=B1  1%  numa-numastat.node0=
.local_node
  16079161 =C2=B1  0%     +40.2%   22547904 =C2=B1  1%  numa-numastat.node0=
.numa_hit
  16094977 =C2=B1  0%     +28.6%   20695373 =C2=B1  2%  numa-numastat.node1=
.local_node
  16094984 =C2=B1  0%     +28.6%   20695383 =C2=B1  2%  numa-numastat.node1=
.numa_hit
      8144 =C2=B1 33%     -17.4%       6723 =C2=B1 35%  numa-meminfo.node0.=
Mapped
     63858 =C2=B1  5%     +16.3%      74260 =C2=B1  3%  numa-meminfo.node1.=
Active
     11731 =C2=B1 27%     +70.2%      19970 =C2=B1  7%  numa-meminfo.node1.=
Active(anon)
     11532 =C2=B1 32%     +40.8%      16243 =C2=B1  8%  numa-meminfo.node1.=
AnonPages
      1832 =C2=B1  6%     +32.3%       2424 =C2=B1  1%  numa-meminfo.node1.=
PageTables
      2.06 =C2=B1  0%      +4.4%       2.15 =C2=B1  0%  turbostat.%Busy
     67.00 =C2=B1  0%      +7.5%      72.00 =C2=B1  0%  turbostat.Avg_MHz
     10.42 =C2=B1  0%     -20.0%       8.33 =C2=B1  0%  turbostat.CPU%c1
     65.55 =C2=B1  1%     -13.6%      56.63 =C2=B1  0%  turbostat.CorWatt
     18.01 =C2=B1  0%    +103.8%      36.70 =C2=B1  0%  turbostat.Pkg%pc2
     96.37 =C2=B1  0%      -9.1%      87.64 =C2=B1  0%  turbostat.PkgWatt
      5.30 =C2=B1  0%     -17.7%       4.36 =C2=B1  0%  turbostat.RAMWatt
  14385266 =C2=B1 25%    +349.4%   64645807 =C2=B1  4%  cpuidle.C1-IVT.time
      5318 =C2=B1 14%     +84.4%       9808 =C2=B1  4%  cpuidle.C1-IVT.usage
     63930 =C2=B1  3%  +17904.3%   11510216 =C2=B1  8%  cpuidle.C1E-IVT.time
    526.00 =C2=B1  2%    +214.3%       1653 =C2=B1  3%  cpuidle.C1E-IVT.usa=
ge
    286517 =C2=B1  8%    +199.6%     858308 =C2=B1  2%  cpuidle.C3-IVT.time
    965.25 =C2=B1  3%    +178.8%       2691 =C2=B1  2%  cpuidle.C3-IVT.usage
   2240054 =C2=B1  0%     -27.8%    1616549 =C2=B1  0%  cpuidle.C6-IVT.usage
     24.00 =C2=B1 16%    +102.1%      48.50 =C2=B1 42%  cpuidle.POLL.usage
      8327 =C2=B1  2%     +22.5%      10197 =C2=B1  5%  slabinfo.anon_vma.a=
ctive_objs
      8327 =C2=B1  2%     +22.5%      10197 =C2=B1  5%  slabinfo.anon_vma.n=
um_objs
     17993 =C2=B1  2%     +21.2%      21801 =C2=B1  0%  slabinfo.kmalloc-19=
2.active_objs
     18066 =C2=B1  3%     +21.3%      21922 =C2=B1  0%  slabinfo.kmalloc-19=
2.num_objs
     54692 =C2=B1  0%     +10.9%      60643 =C2=B1  1%  slabinfo.kmalloc-64=
.active_objs
     54759 =C2=B1  0%     +11.0%      60808 =C2=B1  1%  slabinfo.kmalloc-64=
.num_objs
     20596 =C2=B1  2%     +12.5%      23160 =C2=B1  2%  slabinfo.vm_area_st=
ruct.active_objs
     20629 =C2=B1  2%     +12.6%      23237 =C2=B1  2%  slabinfo.vm_area_st=
ruct.num_objs
      2035 =C2=B1 33%     -17.5%       1680 =C2=B1 35%  numa-vmstat.node0.n=
r_mapped
   8170935 =C2=B1  0%     +39.8%   11423963 =C2=B1  1%  numa-vmstat.node0.n=
uma_hit
   8109225 =C2=B1  0%     +40.9%   11422836 =C2=B1  1%  numa-vmstat.node0.n=
uma_local
     61709 =C2=B1  0%     -98.2%       1126 =C2=B1 99%  numa-vmstat.node0.n=
uma_other
      2932 =C2=B1 27%     +70.2%       4990 =C2=B1  7%  numa-vmstat.node1.n=
r_active_anon
    456.25 =C2=B1  4%     +30.1%     593.50 =C2=B1  1%  numa-vmstat.node1.n=
r_page_table_pages
   8172123 =C2=B1  0%     +27.6%   10425170 =C2=B1  1%  numa-vmstat.node1.n=
uma_hit
   8156456 =C2=B1  0%     +26.9%   10349093 =C2=B1  1%  numa-vmstat.node1.n=
uma_local
     15665 =C2=B1  2%    +385.6%      76076 =C2=B1  1%  numa-vmstat.node1.n=
uma_other
      6846 =C2=B1  3%     +27.7%       8744 =C2=B1  4%  proc-vmstat.nr_acti=
ve_anon
      6021 =C2=B1  3%     +24.7%       7511 =C2=B1  5%  proc-vmstat.nr_anon=
_pages
    853.75 =C2=B1  8%     +31.4%       1122 =C2=B1 18%  proc-vmstat.nr_page=
_table_pages
  32152171 =C2=B1  0%     +34.4%   43208750 =C2=B1  0%  proc-vmstat.numa_hit
  32152156 =C2=B1  0%     +34.4%   43208731 =C2=B1  0%  proc-vmstat.numa_lo=
cal
      3035 =C2=B1  1%     +32.1%       4010 =C2=B1  0%  proc-vmstat.pgactiv=
ate
   2184058 =C2=B1  0%     +39.8%    3053792 =C2=B1  1%  proc-vmstat.pgalloc=
_dma32
  31390460 =C2=B1  0%     +34.6%   42238736 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
  38390323 =C2=B1  0%     +34.0%   51439296 =C2=B1  0%  proc-vmstat.pgfault
  33568423 =C2=B1  0%     +34.9%   45285676 =C2=B1  0%  proc-vmstat.pgfree
    870.50 =C2=B1 52%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.blocked_load_avg
     57118 =C2=B1 19%    +164.2%     150914 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     75786 =C2=B1  5%     -99.8%     182.50 =C2=B1  3%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
    899.00 =C2=B1 54%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
    400.25 =C2=B1 38%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
10]:/.blocked_load_avg
      2866 =C2=B1  8%     +13.0%       3240 =C2=B1  2%  sched_debug.cfs_rq[=
10]:/.exec_clock
     43563 =C2=B1 13%    +252.0%     153354 =C2=B1  3%  sched_debug.cfs_rq[=
10]:/.min_vruntime
    -13554 =C2=B1-54%    -118.0%       2439 =C2=B1230%  sched_debug.cfs_rq[=
10]:/.spread0
     73028 =C2=B1  4%     -99.7%     183.25 =C2=B1  3%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
    403.75 =C2=B1 38%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
10]:/.tg_load_contrib
    889.00 =C2=B1 72%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.blocked_load_avg
      2952 =C2=B1  5%     +11.9%       3302 =C2=B1  2%  sched_debug.cfs_rq[=
11]:/.exec_clock
     44570 =C2=B1 10%    +253.0%     157339 =C2=B1  4%  sched_debug.cfs_rq[=
11]:/.min_vruntime
    -12547 =C2=B1-56%    -151.2%       6424 =C2=B1116%  sched_debug.cfs_rq[=
11]:/.spread0
     71603 =C2=B1  4%     -99.7%     183.00 =C2=B1  4%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
    889.00 =C2=B1 72%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.tg_load_contrib
    977.50 =C2=B1 70%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.blocked_load_avg
     50596 =C2=B1  7%    +202.9%     153241 =C2=B1  4%  sched_debug.cfs_rq[=
12]:/.min_vruntime
      6.25 =C2=B1 30%     -72.0%       1.75 =C2=B1 84%  sched_debug.cfs_rq[=
12]:/.nr_spread_over
     71298 =C2=B1  4%     -99.7%     183.00 =C2=B1  4%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
    984.50 =C2=B1 69%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.tg_load_contrib
      1075 =C2=B1 70%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.blocked_load_avg
     51147 =C2=B1  0%    +188.6%     147629 =C2=B1  3%  sched_debug.cfs_rq[=
13]:/.min_vruntime
     71242 =C2=B1  4%     -99.7%     184.00 =C2=B1  4%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
      1078 =C2=B1 70%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.tg_load_contrib
    706.75 =C2=B1 81%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.blocked_load_avg
      2835 =C2=B1  5%     +10.1%       3122 =C2=B1  6%  sched_debug.cfs_rq[=
14]:/.exec_clock
     47070 =C2=B1  6%    +219.5%     150387 =C2=B1  4%  sched_debug.cfs_rq[=
14]:/.min_vruntime
     71202 =C2=B1  4%     -99.7%     184.50 =C2=B1  5%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
    707.75 =C2=B1 81%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.tg_load_contrib
    715.75 =C2=B1 42%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.blocked_load_avg
     47975 =C2=B1 10%    +228.4%     157568 =C2=B1  4%  sched_debug.cfs_rq[=
15]:/.min_vruntime
     -9142 =C2=B1-148%    -172.8%       6652 =C2=B1 90%  sched_debug.cfs_rq=
[15]:/.spread0
     70840 =C2=B1  4%     -99.7%     183.75 =C2=B1  5%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
    711.50 =C2=B1 42%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.tg_load_contrib
      1308 =C2=B1 32%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.blocked_load_avg
      2662 =C2=B1  3%     +22.3%       3256 =C2=B1  2%  sched_debug.cfs_rq[=
16]:/.exec_clock
     46317 =C2=B1  9%    +231.8%     153677 =C2=B1  5%  sched_debug.cfs_rq[=
16]:/.min_vruntime
     70470 =C2=B1  4%     -99.7%     184.00 =C2=B1  5%  sched_debug.cfs_rq[=
16]:/.tg_load_avg
      1314 =C2=B1 32%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.tg_load_contrib
    971.25 =C2=B1 59%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.blocked_load_avg
     46287 =C2=B1  9%    +235.7%     155379 =C2=B1  1%  sched_debug.cfs_rq[=
17]:/.min_vruntime
    -10831 =C2=B1-140%    -141.2%       4462 =C2=B1 65%  sched_debug.cfs_rq=
[17]:/.spread0
     70418 =C2=B1  4%     -99.7%     183.50 =C2=B1  5%  sched_debug.cfs_rq[=
17]:/.tg_load_avg
    983.25 =C2=B1 58%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.tg_load_contrib
    627.25 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.blocked_load_avg
      2733 =C2=B1  1%     +15.5%       3157 =C2=B1  6%  sched_debug.cfs_rq[=
18]:/.exec_clock
     47873 =C2=B1  8%    +222.0%     154139 =C2=B1 11%  sched_debug.cfs_rq[=
18]:/.min_vruntime
     70387 =C2=B1  4%     -99.7%     184.00 =C2=B1  5%  sched_debug.cfs_rq[=
18]:/.tg_load_avg
    634.00 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.tg_load_contrib
    792.25 =C2=B1 62%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.blocked_load_avg
      2700 =C2=B1  5%     +16.5%       3145 =C2=B1  7%  sched_debug.cfs_rq[=
19]:/.exec_clock
     46185 =C2=B1  8%    +227.4%     151229 =C2=B1  2%  sched_debug.cfs_rq[=
19]:/.min_vruntime
     70241 =C2=B1  4%     -99.7%     183.25 =C2=B1  5%  sched_debug.cfs_rq[=
19]:/.tg_load_avg
    808.25 =C2=B1 62%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.tg_load_contrib
    693.00 =C2=B1 99%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.blocked_load_avg
     51591 =C2=B1 18%    +193.3%     151302 =C2=B1  3%  sched_debug.cfs_rq[=
1]:/.min_vruntime
     75048 =C2=B1  5%     -99.8%     182.75 =C2=B1  3%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
    702.50 =C2=B1100%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
    700.50 =C2=B1 48%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.blocked_load_avg
     47638 =C2=B1  4%    +214.8%     149986 =C2=B1  3%  sched_debug.cfs_rq[=
20]:/.min_vruntime
     69892 =C2=B1  4%     -99.7%     184.75 =C2=B1  5%  sched_debug.cfs_rq[=
20]:/.tg_load_avg
    703.75 =C2=B1 48%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.tg_load_contrib
    701.00 =C2=B1 36%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.blocked_load_avg
     49504 =C2=B1  8%    +212.0%     154473 =C2=B1  5%  sched_debug.cfs_rq[=
21]:/.min_vruntime
     69739 =C2=B1  4%     -99.7%     184.25 =C2=B1  5%  sched_debug.cfs_rq[=
21]:/.tg_load_avg
    701.00 =C2=B1 36%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.tg_load_contrib
    897.50 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.blocked_load_avg
     49290 =C2=B1  5%    +192.5%     144183 =C2=B1  2%  sched_debug.cfs_rq[=
22]:/.min_vruntime
     69982 =C2=B1  5%     -99.7%     184.00 =C2=B1  5%  sched_debug.cfs_rq[=
22]:/.tg_load_avg
    893.50 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.tg_load_contrib
    777.00 =C2=B1 30%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
23]:/.blocked_load_avg
     54511 =C2=B1  9%    +167.7%     145910 =C2=B1  4%  sched_debug.cfs_rq[=
23]:/.min_vruntime
     70075 =C2=B1  4%     -99.7%     183.50 =C2=B1  5%  sched_debug.cfs_rq[=
23]:/.tg_load_avg
    776.75 =C2=B1 30%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
23]:/.tg_load_contrib
      2176 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.blocked_load_avg
      5403 =C2=B1  5%     -14.9%       4597 =C2=B1  1%  sched_debug.cfs_rq[=
24]:/.exec_clock
    113969 =C2=B1  2%     +52.6%     173941 =C2=B1  1%  sched_debug.cfs_rq[=
24]:/.min_vruntime
     56850 =C2=B1 16%     -59.5%      23022 =C2=B1  8%  sched_debug.cfs_rq[=
24]:/.spread0
     70082 =C2=B1  4%     -99.7%     183.50 =C2=B1  5%  sched_debug.cfs_rq[=
24]:/.tg_load_avg
      2176 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.tg_load_contrib
      2716 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.blocked_load_avg
      5567 =C2=B1  7%     -15.0%       4731 =C2=B1  3%  sched_debug.cfs_rq[=
25]:/.exec_clock
    117282 =C2=B1  6%     +52.0%     178236 =C2=B1  2%  sched_debug.cfs_rq[=
25]:/.min_vruntime
     60164 =C2=B1 30%     -54.6%      27316 =C2=B1 18%  sched_debug.cfs_rq[=
25]:/.spread0
     69733 =C2=B1  4%     -99.7%     183.25 =C2=B1  5%  sched_debug.cfs_rq[=
25]:/.tg_load_avg
      2712 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.tg_load_contrib
      2290 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.blocked_load_avg
      5161 =C2=B1  4%     -10.4%       4624 =C2=B1  2%  sched_debug.cfs_rq[=
26]:/.exec_clock
    109898 =C2=B1  4%     +61.9%     177897 =C2=B1  2%  sched_debug.cfs_rq[=
26]:/.min_vruntime
     69823 =C2=B1  4%     -99.7%     183.25 =C2=B1  5%  sched_debug.cfs_rq[=
26]:/.tg_load_avg
      2290 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.tg_load_contrib
      2057 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.blocked_load_avg
    106017 =C2=B1  4%     +78.1%     188803 =C2=B1  3%  sched_debug.cfs_rq[=
27]:/.min_vruntime
     69763 =C2=B1  4%     -99.7%     184.00 =C2=B1  6%  sched_debug.cfs_rq[=
27]:/.tg_load_avg
      2056 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.tg_load_contrib
      2076 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.blocked_load_avg
     99026 =C2=B1  3%     +88.1%     186284 =C2=B1  3%  sched_debug.cfs_rq[=
28]:/.min_vruntime
     69576 =C2=B1  4%     -99.7%     184.50 =C2=B1  6%  sched_debug.cfs_rq[=
28]:/.tg_load_avg
      2078 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.tg_load_contrib
      2588 =C2=B1 38%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
29]:/.blocked_load_avg
     97680 =C2=B1  1%     +88.5%     184108 =C2=B1  1%  sched_debug.cfs_rq[=
29]:/.min_vruntime
     69796 =C2=B1  5%     -99.7%     184.50 =C2=B1  6%  sched_debug.cfs_rq[=
29]:/.tg_load_avg
      2587 =C2=B1 38%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
29]:/.tg_load_contrib
    565.75 =C2=B1 72%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.blocked_load_avg
     48097 =C2=B1 10%    +219.7%     153776 =C2=B1  9%  sched_debug.cfs_rq[=
2]:/.min_vruntime
     75023 =C2=B1  5%     -99.8%     182.75 =C2=B1  3%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
    577.25 =C2=B1 74%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
      1820 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
30]:/.blocked_load_avg
     99488 =C2=B1  5%     +85.8%     184882 =C2=B1  2%  sched_debug.cfs_rq[=
30]:/.min_vruntime
     69775 =C2=B1  5%     -99.7%     184.25 =C2=B1  6%  sched_debug.cfs_rq[=
30]:/.tg_load_avg
      1822 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
30]:/.tg_load_contrib
      2415 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.blocked_load_avg
    103409 =C2=B1  3%     +72.9%     178843 =C2=B1  4%  sched_debug.cfs_rq[=
31]:/.min_vruntime
     69330 =C2=B1  5%     -99.7%     184.75 =C2=B1  6%  sched_debug.cfs_rq[=
31]:/.tg_load_avg
      2422 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.tg_load_contrib
      1645 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
32]:/.blocked_load_avg
    101910 =C2=B1  2%     +78.6%     182004 =C2=B1  1%  sched_debug.cfs_rq[=
32]:/.min_vruntime
     69358 =C2=B1  6%     -99.7%     185.25 =C2=B1  6%  sched_debug.cfs_rq[=
32]:/.tg_load_avg
      1649 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
32]:/.tg_load_contrib
      1596 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
33]:/.blocked_load_avg
    102365 =C2=B1  1%     +75.0%     179171 =C2=B1  2%  sched_debug.cfs_rq[=
33]:/.min_vruntime
     69324 =C2=B1  6%     -99.7%     185.25 =C2=B1  6%  sched_debug.cfs_rq[=
33]:/.tg_load_avg
      1604 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
33]:/.tg_load_contrib
      2091 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
34]:/.blocked_load_avg
    103992 =C2=B1  3%     +67.5%     174199 =C2=B1  3%  sched_debug.cfs_rq[=
34]:/.min_vruntime
     69525 =C2=B1  6%     -99.7%     186.25 =C2=B1  6%  sched_debug.cfs_rq[=
34]:/.tg_load_avg
      2109 =C2=B1 21%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
34]:/.tg_load_contrib
      1837 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
35]:/.blocked_load_avg
      4942 =C2=B1  3%      -7.9%       4553 =C2=B1  1%  sched_debug.cfs_rq[=
35]:/.exec_clock
    105298 =C2=B1  2%     +66.9%     175778 =C2=B1  1%  sched_debug.cfs_rq[=
35]:/.min_vruntime
     69537 =C2=B1  6%     -99.7%     186.50 =C2=B1  7%  sched_debug.cfs_rq[=
35]:/.tg_load_avg
      1830 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
35]:/.tg_load_contrib
      2492 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
36]:/.blocked_load_avg
    106240 =C2=B1  3%     +63.1%     173269 =C2=B1  4%  sched_debug.cfs_rq[=
36]:/.min_vruntime
     49121 =C2=B1 17%     -54.5%      22346 =C2=B1 37%  sched_debug.cfs_rq[=
36]:/.spread0
     69338 =C2=B1  5%     -99.7%     186.50 =C2=B1  7%  sched_debug.cfs_rq[=
36]:/.tg_load_avg
      2506 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
36]:/.tg_load_contrib
      2146 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
37]:/.blocked_load_avg
    108406 =C2=B1  8%     +61.6%     175145 =C2=B1  3%  sched_debug.cfs_rq[=
37]:/.min_vruntime
     51287 =C2=B1 11%     -52.8%      24221 =C2=B1 27%  sched_debug.cfs_rq[=
37]:/.spread0
     69558 =C2=B1  5%     -99.7%     186.75 =C2=B1  7%  sched_debug.cfs_rq[=
37]:/.tg_load_avg
      2148 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
37]:/.tg_load_contrib
      2412 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
38]:/.blocked_load_avg
    102617 =C2=B1  2%     +71.7%     176214 =C2=B1  2%  sched_debug.cfs_rq[=
38]:/.min_vruntime
     45498 =C2=B1 22%     -44.4%      25291 =C2=B1 18%  sched_debug.cfs_rq[=
38]:/.spread0
     69427 =C2=B1  5%     -99.7%     186.25 =C2=B1  7%  sched_debug.cfs_rq[=
38]:/.tg_load_avg
      2419 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
38]:/.tg_load_contrib
      2445 =C2=B1 23%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
39]:/.blocked_load_avg
    100155 =C2=B1  2%     +79.6%     179926 =C2=B1  3%  sched_debug.cfs_rq[=
39]:/.min_vruntime
     69460 =C2=B1  5%     -99.7%     186.50 =C2=B1  7%  sched_debug.cfs_rq[=
39]:/.tg_load_avg
      2442 =C2=B1 22%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
39]:/.tg_load_contrib
    786.25 =C2=B1 47%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
      2909 =C2=B1  8%     +15.7%       3366 =C2=B1  4%  sched_debug.cfs_rq[=
3]:/.exec_clock
     43496 =C2=B1 10%    +266.3%     159324 =C2=B1  2%  sched_debug.cfs_rq[=
3]:/.min_vruntime
    -13621 =C2=B1-73%    -161.7%       8409 =C2=B1 40%  sched_debug.cfs_rq[=
3]:/.spread0
     75051 =C2=B1  5%     -99.8%     183.25 =C2=B1  3%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
    793.75 =C2=B1 46%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
      1662 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
40]:/.blocked_load_avg
     97952 =C2=B1  2%     +85.1%     181300 =C2=B1  7%  sched_debug.cfs_rq[=
40]:/.min_vruntime
     68878 =C2=B1  6%     -99.7%     186.75 =C2=B1  7%  sched_debug.cfs_rq[=
40]:/.tg_load_avg
      1662 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
40]:/.tg_load_contrib
      2130 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
41]:/.blocked_load_avg
     96738 =C2=B1  3%     +83.3%     177290 =C2=B1  2%  sched_debug.cfs_rq[=
41]:/.min_vruntime
     68849 =C2=B1  6%     -99.7%     186.75 =C2=B1  7%  sched_debug.cfs_rq[=
41]:/.tg_load_avg
      2139 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
41]:/.tg_load_contrib
      1759 =C2=B1 17%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
42]:/.blocked_load_avg
     96945 =C2=B1  3%     +80.6%     175050 =C2=B1  6%  sched_debug.cfs_rq[=
42]:/.min_vruntime
     68929 =C2=B1  6%     -99.7%     188.50 =C2=B1  7%  sched_debug.cfs_rq[=
42]:/.tg_load_avg
      1759 =C2=B1 17%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
42]:/.tg_load_contrib
      1744 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
43]:/.blocked_load_avg
     99048 =C2=B1  1%     +77.2%     175482 =C2=B1  3%  sched_debug.cfs_rq[=
43]:/.min_vruntime
     68840 =C2=B1  6%     -99.7%     188.50 =C2=B1  7%  sched_debug.cfs_rq[=
43]:/.tg_load_avg
      1743 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
43]:/.tg_load_contrib
      1954 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
44]:/.blocked_load_avg
      4816 =C2=B1  3%      -9.5%       4357 =C2=B1  4%  sched_debug.cfs_rq[=
44]:/.exec_clock
    102244 =C2=B1  3%     +67.3%     171060 =C2=B1  3%  sched_debug.cfs_rq[=
44]:/.min_vruntime
      0.25 =C2=B1173%   +1200.0%       3.25 =C2=B1 39%  sched_debug.cfs_rq[=
44]:/.nr_spread_over
     45125 =C2=B1 19%     -55.4%      20135 =C2=B1 29%  sched_debug.cfs_rq[=
44]:/.spread0
     68806 =C2=B1  6%     -99.7%     188.25 =C2=B1  7%  sched_debug.cfs_rq[=
44]:/.tg_load_avg
      1963 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
44]:/.tg_load_contrib
      2104 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
45]:/.blocked_load_avg
    100716 =C2=B1  3%     +71.8%     173019 =C2=B1  2%  sched_debug.cfs_rq[=
45]:/.min_vruntime
      0.50 =C2=B1100%    +350.0%       2.25 =C2=B1 19%  sched_debug.cfs_rq[=
45]:/.nr_spread_over
     43597 =C2=B1 25%     -49.3%      22094 =C2=B1 17%  sched_debug.cfs_rq[=
45]:/.spread0
     68837 =C2=B1  6%     -99.7%     188.25 =C2=B1  7%  sched_debug.cfs_rq[=
45]:/.tg_load_avg
      2134 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
45]:/.tg_load_contrib
      2052 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
46]:/.blocked_load_avg
    100114 =C2=B1  2%     +76.7%     176907 =C2=B1  2%  sched_debug.cfs_rq[=
46]:/.min_vruntime
     42995 =C2=B1 20%     -39.6%      25981 =C2=B1 17%  sched_debug.cfs_rq[=
46]:/.spread0
     68841 =C2=B1  6%     -99.7%     188.25 =C2=B1  7%  sched_debug.cfs_rq[=
46]:/.tg_load_avg
      2058 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
46]:/.tg_load_contrib
      2171 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
47]:/.blocked_load_avg
      7022 =C2=B1  7%     -34.0%       4632 =C2=B1 13%  sched_debug.cfs_rq[=
47]:/.exec_clock
    100138 =C2=B1  2%     +72.6%     172795 =C2=B1  2%  sched_debug.cfs_rq[=
47]:/.min_vruntime
     43019 =C2=B1 19%     -49.2%      21869 =C2=B1 19%  sched_debug.cfs_rq[=
47]:/.spread0
     69006 =C2=B1  5%     -99.7%     188.25 =C2=B1  7%  sched_debug.cfs_rq[=
47]:/.tg_load_avg
      2182 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
47]:/.tg_load_contrib
    689.00 =C2=B1 33%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.blocked_load_avg
      2785 =C2=B1  8%     +94.9%       5429 =C2=B1 23%  sched_debug.cfs_rq[=
4]:/.exec_clock
     41087 =C2=B1 12%    +267.6%     151054 =C2=B1  2%  sched_debug.cfs_rq[=
4]:/.min_vruntime
    -16031 =C2=B1-58%    -100.9%     139.56 =C2=B12626%  sched_debug.cfs_rq=
[4]:/.spread0
     75084 =C2=B1  5%     -99.8%     183.50 =C2=B1  3%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
    692.50 =C2=B1 33%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
    810.75 =C2=B1 94%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.blocked_load_avg
      2867 =C2=B1  5%     +50.5%       4316 =C2=B1 26%  sched_debug.cfs_rq[=
5]:/.exec_clock
     41898 =C2=B1 14%    +259.4%     150604 =C2=B1  2%  sched_debug.cfs_rq[=
5]:/.min_vruntime
    -15219 =C2=B1-50%     -98.0%    -310.14 =C2=B1-1301%  sched_debug.cfs_r=
q[5]:/.spread0
     74686 =C2=B1  5%     -99.8%     184.25 =C2=B1  4%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
    815.75 =C2=B1 93%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.tg_load_contrib
    892.50 =C2=B1 32%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
     43443 =C2=B1 11%    +258.6%     155805 =C2=B1  4%  sched_debug.cfs_rq[=
6]:/.min_vruntime
    -13674 =C2=B1-51%    -135.8%       4891 =C2=B1129%  sched_debug.cfs_rq[=
6]:/.spread0
     74651 =C2=B1  5%     -99.8%     184.00 =C2=B1  3%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
    896.75 =C2=B1 32%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
    477.75 =C2=B1 55%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.blocked_load_avg
     46006 =C2=B1 13%    +229.7%     151677 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.min_vruntime
     74458 =C2=B1  5%     -99.8%     183.25 =C2=B1  3%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
    485.50 =C2=B1 53%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.tg_load_contrib
    910.00 =C2=B1 46%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.blocked_load_avg
      2872 =C2=B1  5%     +16.7%       3351 =C2=B1  2%  sched_debug.cfs_rq[=
8]:/.exec_clock
     42737 =C2=B1 13%    +267.2%     156916 =C2=B1  4%  sched_debug.cfs_rq[=
8]:/.min_vruntime
    -14380 =C2=B1-46%    -141.7%       6002 =C2=B1118%  sched_debug.cfs_rq[=
8]:/.spread0
     73792 =C2=B1  5%     -99.8%     183.25 =C2=B1  3%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
    916.50 =C2=B1 46%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.tg_load_contrib
    490.00 =C2=B1 35%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.blocked_load_avg
      2836 =C2=B1  5%     +15.0%       3263 =C2=B1  2%  sched_debug.cfs_rq[=
9]:/.exec_clock
     43105 =C2=B1 16%    +252.1%     151790 =C2=B1  1%  sched_debug.cfs_rq[=
9]:/.min_vruntime
    -14012 =C2=B1-46%    -106.2%     875.33 =C2=B1390%  sched_debug.cfs_rq[=
9]:/.spread0
     73581 =C2=B1  5%     -99.8%     183.25 =C2=B1  3%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
    493.75 =C2=B1 35%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.tg_load_contrib
     32797 =C2=B1  2%     -15.5%      27715 =C2=B1  2%  sched_debug.cpu#0.n=
r_load_updates
     67894 =C2=B1  3%     -12.0%      59778 =C2=B1  1%  sched_debug.cpu#0.n=
r_switches
     74748 =C2=B1  4%     -11.9%      65841 =C2=B1  1%  sched_debug.cpu#0.s=
ched_count
     30783 =C2=B1  3%     -11.1%      27357 =C2=B1  0%  sched_debug.cpu#0.s=
ched_goidle
      8223 =C2=B1  6%     -41.4%       4818 =C2=B1 12%  sched_debug.cpu#0.t=
twu_local
     33039 =C2=B1  7%     -18.8%      26812 =C2=B1  4%  sched_debug.cpu#1.n=
r_load_updates
      3.00 =C2=B1192%   -1066.7%     -29.00 =C2=B1-40%  sched_debug.cpu#1.n=
r_uninterruptible
     34259 =C2=B1  8%     -34.7%      22382 =C2=B1  1%  sched_debug.cpu#1.t=
twu_count
      6868 =C2=B1 15%     -55.9%       3027 =C2=B1  5%  sched_debug.cpu#1.t=
twu_local
     30947 =C2=B1  7%     -14.6%      26430 =C2=B1  4%  sched_debug.cpu#10.=
nr_load_updates
      6399 =C2=B1 16%     -58.6%       2651 =C2=B1  7%  sched_debug.cpu#10.=
ttwu_local
     31355 =C2=B1  6%     -16.8%      26100 =C2=B1  4%  sched_debug.cpu#11.=
nr_load_updates
      6408 =C2=B1 10%     -60.7%       2518 =C2=B1  6%  sched_debug.cpu#11.=
ttwu_local
     30751 =C2=B1  4%     -16.5%      25677 =C2=B1  4%  sched_debug.cpu#12.=
nr_load_updates
     30575 =C2=B1  7%     -18.0%      25069 =C2=B1  1%  sched_debug.cpu#13.=
nr_load_updates
     62811 =C2=B1 10%     -12.6%      54878 =C2=B1  1%  sched_debug.cpu#13.=
sched_count
      5941 =C2=B1  7%     -62.1%       2252 =C2=B1  5%  sched_debug.cpu#13.=
ttwu_local
     30203 =C2=B1  5%     -14.8%      25732 =C2=B1  4%  sched_debug.cpu#14.=
nr_load_updates
     61024 =C2=B1  7%      -9.6%      55146 =C2=B1  1%  sched_debug.cpu#14.=
sched_count
      6147 =C2=B1  9%     -62.8%       2289 =C2=B1  4%  sched_debug.cpu#14.=
ttwu_local
     30205 =C2=B1  3%     -15.5%      25519 =C2=B1  4%  sched_debug.cpu#15.=
nr_load_updates
      6113 =C2=B1  6%     -62.6%       2286 =C2=B1  4%  sched_debug.cpu#15.=
ttwu_local
     29236 =C2=B1  5%     -12.4%      25599 =C2=B1  4%  sched_debug.cpu#16.=
nr_load_updates
      5498 =C2=B1  7%     -58.3%       2292 =C2=B1  2%  sched_debug.cpu#16.=
ttwu_local
      3.00 =C2=B1 97%    -100.0%       0.00 =C2=B1  0%  sched_debug.cpu#17.=
cpu_load[2]
      2.00 =C2=B1 61%    -100.0%       0.00 =C2=B1  0%  sched_debug.cpu#17.=
cpu_load[3]
     29525 =C2=B1  4%     -13.2%      25621 =C2=B1  4%  sched_debug.cpu#17.=
nr_load_updates
      6140 =C2=B1  7%     -44.0%       3437 =C2=B1 48%  sched_debug.cpu#17.=
ttwu_local
     29352 =C2=B1  5%     -14.3%      25142 =C2=B1  4%  sched_debug.cpu#18.=
nr_load_updates
      5409 =C2=B1  6%     -59.6%       2183 =C2=B1  4%  sched_debug.cpu#18.=
ttwu_local
     29476 =C2=B1  5%     -14.2%      25278 =C2=B1  3%  sched_debug.cpu#19.=
nr_load_updates
      5963 =C2=B1 11%     -60.8%       2338 =C2=B1  7%  sched_debug.cpu#19.=
ttwu_local
     32027 =C2=B1  5%     -17.0%      26577 =C2=B1  3%  sched_debug.cpu#2.n=
r_load_updates
     30857 =C2=B1 11%     -24.0%      23463 =C2=B1  2%  sched_debug.cpu#2.t=
twu_count
      6379 =C2=B1  6%     -55.4%       2843 =C2=B1  2%  sched_debug.cpu#2.t=
twu_local
     30117 =C2=B1  7%     -17.0%      25010 =C2=B1  3%  sched_debug.cpu#20.=
nr_load_updates
      5719 =C2=B1 11%     -59.6%       2309 =C2=B1  3%  sched_debug.cpu#20.=
ttwu_local
     30016 =C2=B1  5%     -17.2%      24848 =C2=B1  4%  sched_debug.cpu#21.=
nr_load_updates
     58415 =C2=B1  6%     -10.2%      52439 =C2=B1  1%  sched_debug.cpu#21.=
nr_switches
     -3.00 =C2=B1-40%    -166.7%       2.00 =C2=B1 93%  sched_debug.cpu#21.=
nr_uninterruptible
      5801 =C2=B1  6%     -62.1%       2200 =C2=B1  7%  sched_debug.cpu#21.=
ttwu_local
     29769 =C2=B1  4%     -15.2%      25237 =C2=B1  7%  sched_debug.cpu#22.=
nr_load_updates
      5268 =C2=B1  4%     -49.8%       2642 =C2=B1 31%  sched_debug.cpu#22.=
ttwu_local
     30978 =C2=B1  4%     -18.1%      25374 =C2=B1  4%  sched_debug.cpu#23.=
nr_load_updates
    999579 =C2=B1  0%     -33.3%     667209 =C2=B1 20%  sched_debug.cpu#24.=
avg_idle
     27629 =C2=B1  4%     -55.9%      12181 =C2=B1  6%  sched_debug.cpu#24.=
nr_load_updates
     47807 =C2=B1  6%     -50.3%      23770 =C2=B1  1%  sched_debug.cpu#24.=
nr_switches
     47817 =C2=B1  6%     -50.3%      23780 =C2=B1  1%  sched_debug.cpu#24.=
sched_count
     21698 =C2=B1  6%     -63.6%       7889 =C2=B1  2%  sched_debug.cpu#24.=
sched_goidle
     14629 =C2=B1  9%     -51.4%       7110 =C2=B1  1%  sched_debug.cpu#24.=
ttwu_count
      5509 =C2=B1 24%     -86.0%     769.50 =C2=B1  7%  sched_debug.cpu#24.=
ttwu_local
    983279 =C2=B1  1%     -17.7%     809680 =C2=B1 14%  sched_debug.cpu#25.=
avg_idle
     27360 =C2=B1  7%     -55.5%      12165 =C2=B1  8%  sched_debug.cpu#25.=
nr_load_updates
     45250 =C2=B1 10%     -43.2%      25679 =C2=B1 15%  sched_debug.cpu#25.=
nr_switches
      7.50 =C2=B1 39%     -93.3%       0.50 =C2=B1435%  sched_debug.cpu#25.=
nr_uninterruptible
     45261 =C2=B1 10%     -43.2%      25688 =C2=B1 15%  sched_debug.cpu#25.=
sched_count
     20558 =C2=B1 10%     -57.3%       8781 =C2=B1 20%  sched_debug.cpu#25.=
sched_goidle
     13437 =C2=B1 11%     -34.1%       8854 =C2=B1 22%  sched_debug.cpu#25.=
ttwu_count
    992711 =C2=B1  0%     -16.0%     833506 =C2=B1  8%  sched_debug.cpu#26.=
avg_idle
     25756 =C2=B1  3%     -51.8%      12412 =C2=B1  7%  sched_debug.cpu#26.=
nr_load_updates
     41819 =C2=B1  3%     -41.9%      24277 =C2=B1  2%  sched_debug.cpu#26.=
nr_switches
     41829 =C2=B1  3%     -41.9%      24285 =C2=B1  2%  sched_debug.cpu#26.=
sched_count
     18963 =C2=B1  3%     -57.1%       8142 =C2=B1  3%  sched_debug.cpu#26.=
sched_goidle
     12382 =C2=B1  5%     -40.6%       7360 =C2=B1  3%  sched_debug.cpu#26.=
ttwu_count
      4152 =C2=B1  2%     -77.9%     918.50 =C2=B1 14%  sched_debug.cpu#26.=
ttwu_local
    997714 =C2=B1  0%     -18.3%     814721 =C2=B1 11%  sched_debug.cpu#27.=
avg_idle
     24822 =C2=B1  3%     -48.0%      12901 =C2=B1  8%  sched_debug.cpu#27.=
nr_load_updates
     41114 =C2=B1  8%     -39.5%      24887 =C2=B1  5%  sched_debug.cpu#27.=
nr_switches
     41125 =C2=B1  8%     -39.5%      24898 =C2=B1  5%  sched_debug.cpu#27.=
sched_count
     18696 =C2=B1  9%     -56.7%       8089 =C2=B1  2%  sched_debug.cpu#27.=
sched_goidle
     13024 =C2=B1 14%     -38.4%       8026 =C2=B1 14%  sched_debug.cpu#27.=
ttwu_count
      5069 =C2=B1 32%     -79.1%       1058 =C2=B1 42%  sched_debug.cpu#27.=
ttwu_local
    998224 =C2=B1  0%     -28.6%     712537 =C2=B1 16%  sched_debug.cpu#28.=
avg_idle
     24024 =C2=B1  4%     -48.8%      12290 =C2=B1  8%  sched_debug.cpu#28.=
nr_load_updates
     38873 =C2=B1  6%     -38.1%      24074 =C2=B1  2%  sched_debug.cpu#28.=
nr_switches
     38883 =C2=B1  6%     -38.1%      24085 =C2=B1  2%  sched_debug.cpu#28.=
sched_count
     17502 =C2=B1  6%     -54.5%       7969 =C2=B1  2%  sched_debug.cpu#28.=
sched_goidle
     11512 =C2=B1  6%     -34.3%       7558 =C2=B1  2%  sched_debug.cpu#28.=
ttwu_count
      4132 =C2=B1  7%     -79.4%     853.00 =C2=B1  5%  sched_debug.cpu#28.=
ttwu_local
    963551 =C2=B1  6%     -22.3%     748801 =C2=B1 15%  sched_debug.cpu#29.=
avg_idle
     23808 =C2=B1  2%     -49.2%      12093 =C2=B1 10%  sched_debug.cpu#29.=
nr_load_updates
     38201 =C2=B1  3%     -37.8%      23758 =C2=B1  3%  sched_debug.cpu#29.=
nr_switches
     38210 =C2=B1  3%     -37.8%      23768 =C2=B1  3%  sched_debug.cpu#29.=
sched_count
     17299 =C2=B1  4%     -54.5%       7878 =C2=B1  3%  sched_debug.cpu#29.=
sched_goidle
     11037 =C2=B1  3%     -34.8%       7198 =C2=B1  4%  sched_debug.cpu#29.=
ttwu_count
      3869 =C2=B1  4%     -80.0%     775.00 =C2=B1  4%  sched_debug.cpu#29.=
ttwu_local
     31247 =C2=B1  5%     -16.5%      26079 =C2=B1  2%  sched_debug.cpu#3.n=
r_load_updates
     32544 =C2=B1 12%     -31.6%      22260 =C2=B1  7%  sched_debug.cpu#3.t=
twu_count
      6842 =C2=B1  4%     -59.4%       2779 =C2=B1  7%  sched_debug.cpu#3.t=
twu_local
    997901 =C2=B1  0%     -19.0%     808148 =C2=B1  6%  sched_debug.cpu#30.=
avg_idle
     23689 =C2=B1  1%     -47.3%      12475 =C2=B1  8%  sched_debug.cpu#30.=
nr_load_updates
     39482 =C2=B1  6%     -38.0%      24468 =C2=B1  2%  sched_debug.cpu#30.=
nr_switches
     39492 =C2=B1  6%     -38.0%      24478 =C2=B1  2%  sched_debug.cpu#30.=
sched_count
     17977 =C2=B1  7%     -54.4%       8193 =C2=B1  2%  sched_debug.cpu#30.=
sched_goidle
     12046 =C2=B1 14%     -36.7%       7630 =C2=B1  7%  sched_debug.cpu#30.=
ttwu_count
      4650 =C2=B1 34%     -82.9%     796.75 =C2=B1  5%  sched_debug.cpu#30.=
ttwu_local
    986521 =C2=B1  1%     -27.7%     713614 =C2=B1 14%  sched_debug.cpu#31.=
avg_idle
      5.75 =C2=B1 54%     -95.7%       0.25 =C2=B1173%  sched_debug.cpu#31.=
cpu_load[2]
      3.25 =C2=B1 45%     -92.3%       0.25 =C2=B1173%  sched_debug.cpu#31.=
cpu_load[3]
     25013 =C2=B1  6%     -50.8%      12311 =C2=B1  7%  sched_debug.cpu#31.=
nr_load_updates
     41464 =C2=B1 11%     -41.7%      24190 =C2=B1  1%  sched_debug.cpu#31.=
nr_switches
     41475 =C2=B1 11%     -41.7%      24200 =C2=B1  1%  sched_debug.cpu#31.=
sched_count
     18797 =C2=B1 11%     -56.5%       8183 =C2=B1  2%  sched_debug.cpu#31.=
sched_goidle
     12238 =C2=B1 13%     -38.2%       7557 =C2=B1  5%  sched_debug.cpu#31.=
ttwu_count
      4078 =C2=B1 15%     -80.5%     793.75 =C2=B1  5%  sched_debug.cpu#31.=
ttwu_local
    998038 =C2=B1  0%     -30.4%     695128 =C2=B1 21%  sched_debug.cpu#32.=
avg_idle
     24493 =C2=B1  1%     -50.2%      12195 =C2=B1  9%  sched_debug.cpu#32.=
nr_load_updates
     39378 =C2=B1  2%     -38.7%      24158 =C2=B1  1%  sched_debug.cpu#32.=
nr_switches
      0.50 =C2=B1300%    +400.0%       2.50 =C2=B1140%  sched_debug.cpu#32.=
nr_uninterruptible
     39387 =C2=B1  2%     -38.6%      24170 =C2=B1  1%  sched_debug.cpu#32.=
sched_count
     17899 =C2=B1  2%     -55.1%       8038 =C2=B1  3%  sched_debug.cpu#32.=
sched_goidle
     11656 =C2=B1  4%     -37.1%       7336 =C2=B1  2%  sched_debug.cpu#32.=
ttwu_count
      3853 =C2=B1  2%     -79.8%     778.50 =C2=B1  4%  sched_debug.cpu#32.=
ttwu_local
    993119 =C2=B1  1%     -35.8%     637846 =C2=B1 21%  sched_debug.cpu#33.=
avg_idle
     24690 =C2=B1  1%     -51.0%      12098 =C2=B1  8%  sched_debug.cpu#33.=
nr_load_updates
     39897 =C2=B1  2%     -40.1%      23887 =C2=B1  0%  sched_debug.cpu#33.=
nr_switches
     39909 =C2=B1  2%     -40.1%      23896 =C2=B1  0%  sched_debug.cpu#33.=
sched_count
     18105 =C2=B1  2%     -56.3%       7910 =C2=B1  1%  sched_debug.cpu#33.=
sched_goidle
     12043 =C2=B1  6%     -37.6%       7515 =C2=B1  4%  sched_debug.cpu#33.=
ttwu_count
      3952 =C2=B1  1%     -80.8%     758.00 =C2=B1  2%  sched_debug.cpu#33.=
ttwu_local
    986570 =C2=B1  1%     -15.5%     833950 =C2=B1  4%  sched_debug.cpu#34.=
avg_idle
     25224 =C2=B1  2%     -52.7%      11937 =C2=B1  9%  sched_debug.cpu#34.=
nr_load_updates
     41055 =C2=B1  2%     -43.0%      23419 =C2=B1  1%  sched_debug.cpu#34.=
nr_switches
     41067 =C2=B1  2%     -42.9%      23429 =C2=B1  1%  sched_debug.cpu#34.=
sched_count
     18611 =C2=B1  3%     -58.3%       7761 =C2=B1  1%  sched_debug.cpu#34.=
sched_goidle
     12530 =C2=B1  5%     -41.8%       7297 =C2=B1  3%  sched_debug.cpu#34.=
ttwu_count
      4074 =C2=B1  4%     -82.4%     718.25 =C2=B1  0%  sched_debug.cpu#34.=
ttwu_local
    994096 =C2=B1  0%     -26.4%     731674 =C2=B1 12%  sched_debug.cpu#35.=
avg_idle
     25694 =C2=B1  3%     -53.4%      11970 =C2=B1  8%  sched_debug.cpu#35.=
nr_load_updates
     43353 =C2=B1  4%     -45.5%      23627 =C2=B1  1%  sched_debug.cpu#35.=
nr_switches
     43363 =C2=B1  4%     -45.5%      23636 =C2=B1  1%  sched_debug.cpu#35.=
sched_count
     19779 =C2=B1  4%     -60.4%       7824 =C2=B1  2%  sched_debug.cpu#35.=
sched_goidle
     13291 =C2=B1  9%     -45.2%       7279 =C2=B1  2%  sched_debug.cpu#35.=
ttwu_count
      4927 =C2=B1 27%     -84.9%     744.75 =C2=B1  1%  sched_debug.cpu#35.=
ttwu_local
    967284 =C2=B1  5%     -16.7%     805940 =C2=B1 10%  sched_debug.cpu#36.=
avg_idle
     26869 =C2=B1  1%     -55.5%      11967 =C2=B1  9%  sched_debug.cpu#36.=
nr_load_updates
     44378 =C2=B1  1%     -46.9%      23575 =C2=B1  2%  sched_debug.cpu#36.=
nr_switches
     44388 =C2=B1  1%     -46.9%      23586 =C2=B1  2%  sched_debug.cpu#36.=
sched_count
     20238 =C2=B1  1%     -60.8%       7924 =C2=B1  1%  sched_debug.cpu#36.=
sched_goidle
     12284 =C2=B1  4%     -42.8%       7028 =C2=B1  6%  sched_debug.cpu#36.=
ttwu_count
      4082 =C2=B1  1%     -82.0%     736.75 =C2=B1  5%  sched_debug.cpu#36.=
ttwu_local
     26942 =C2=B1  4%     -55.2%      12058 =C2=B1  8%  sched_debug.cpu#37.=
nr_load_updates
     44703 =C2=B1  6%     -47.4%      23502 =C2=B1  1%  sched_debug.cpu#37.=
nr_switches
     45489 =C2=B1  9%     -48.3%      23512 =C2=B1  1%  sched_debug.cpu#37.=
sched_count
     20362 =C2=B1  6%     -60.5%       8042 =C2=B1  2%  sched_debug.cpu#37.=
sched_goidle
     12442 =C2=B1  7%     -44.4%       6917 =C2=B1  3%  sched_debug.cpu#37.=
ttwu_count
      4195 =C2=B1  6%     -83.0%     714.00 =C2=B1  9%  sched_debug.cpu#37.=
ttwu_local
    986766 =C2=B1  0%     -26.2%     727890 =C2=B1 15%  sched_debug.cpu#38.=
avg_idle
     25746 =C2=B1  0%     -53.4%      11995 =C2=B1  7%  sched_debug.cpu#38.=
nr_load_updates
     42280 =C2=B1  1%     -44.4%      23491 =C2=B1  2%  sched_debug.cpu#38.=
nr_switches
     42289 =C2=B1  1%     -44.4%      23501 =C2=B1  2%  sched_debug.cpu#38.=
sched_count
     19273 =C2=B1  1%     -58.3%       8033 =C2=B1  3%  sched_debug.cpu#38.=
sched_goidle
     11731 =C2=B1  1%     -41.1%       6914 =C2=B1  4%  sched_debug.cpu#38.=
ttwu_count
      3990 =C2=B1  0%     -81.5%     736.75 =C2=B1 12%  sched_debug.cpu#38.=
ttwu_local
    997192 =C2=B1  0%     -15.2%     845920 =C2=B1  8%  sched_debug.cpu#39.=
avg_idle
     25309 =C2=B1  0%     -52.4%      12042 =C2=B1  7%  sched_debug.cpu#39.=
nr_load_updates
     41476 =C2=B1  1%     -43.2%      23539 =C2=B1  2%  sched_debug.cpu#39.=
nr_switches
     41485 =C2=B1  1%     -43.2%      23549 =C2=B1  2%  sched_debug.cpu#39.=
sched_count
     18892 =C2=B1  1%     -57.7%       7991 =C2=B1  2%  sched_debug.cpu#39.=
sched_goidle
     11277 =C2=B1  2%     -36.3%       7182 =C2=B1  6%  sched_debug.cpu#39.=
ttwu_count
      3917 =C2=B1  1%     -79.0%     823.00 =C2=B1 17%  sched_debug.cpu#39.=
ttwu_local
     30967 =C2=B1  5%     -14.9%      26358 =C2=B1  7%  sched_debug.cpu#4.n=
r_load_updates
     -1.75 =C2=B1-199%    +428.6%      -9.25 =C2=B1-36%  sched_debug.cpu#4.=
nr_uninterruptible
     32118 =C2=B1 10%     -26.8%      23504 =C2=B1  1%  sched_debug.cpu#4.t=
twu_count
      6748 =C2=B1  5%     -54.5%       3068 =C2=B1 17%  sched_debug.cpu#4.t=
twu_local
     24725 =C2=B1  0%     -51.0%      12103 =C2=B1  9%  sched_debug.cpu#40.=
nr_load_updates
     40531 =C2=B1  0%     -42.4%      23352 =C2=B1  1%  sched_debug.cpu#40.=
nr_switches
     41261 =C2=B1  2%     -43.4%      23362 =C2=B1  1%  sched_debug.cpu#40.=
sched_count
     18390 =C2=B1  1%     -56.6%       7985 =C2=B1  1%  sched_debug.cpu#40.=
sched_goidle
      3963 =C2=B1  0%     -81.7%     723.75 =C2=B1 10%  sched_debug.cpu#40.=
ttwu_local
    991575 =C2=B1  1%     -12.4%     868916 =C2=B1  5%  sched_debug.cpu#41.=
avg_idle
     24983 =C2=B1  1%     -52.4%      11898 =C2=B1  8%  sched_debug.cpu#41.=
nr_load_updates
     41234 =C2=B1  2%     -43.5%      23280 =C2=B1  1%  sched_debug.cpu#41.=
nr_switches
     41244 =C2=B1  2%     -43.5%      23290 =C2=B1  1%  sched_debug.cpu#41.=
sched_count
     18815 =C2=B1  3%     -57.8%       7935 =C2=B1  2%  sched_debug.cpu#41.=
sched_goidle
     11454 =C2=B1  4%     -41.0%       6756 =C2=B1  2%  sched_debug.cpu#41.=
ttwu_count
      3984 =C2=B1  8%     -82.4%     699.50 =C2=B1  5%  sched_debug.cpu#41.=
ttwu_local
     24934 =C2=B1  0%     -52.5%      11850 =C2=B1  8%  sched_debug.cpu#42.=
nr_load_updates
     41126 =C2=B1  0%     -43.7%      23152 =C2=B1  1%  sched_debug.cpu#42.=
nr_switches
     41136 =C2=B1  0%     -43.7%      23162 =C2=B1  1%  sched_debug.cpu#42.=
sched_count
     18720 =C2=B1  0%     -58.0%       7869 =C2=B1  1%  sched_debug.cpu#42.=
sched_goidle
     11238 =C2=B1  1%     -33.9%       7428 =C2=B1 16%  sched_debug.cpu#42.=
ttwu_count
      3939 =C2=B1  1%     -82.3%     699.00 =C2=B1  8%  sched_debug.cpu#42.=
ttwu_local
    997165 =C2=B1  0%     -19.8%     799848 =C2=B1 10%  sched_debug.cpu#43.=
avg_idle
     24972 =C2=B1  1%     -52.5%      11863 =C2=B1  8%  sched_debug.cpu#43.=
nr_load_updates
     41290 =C2=B1  1%     -43.7%      23253 =C2=B1  1%  sched_debug.cpu#43.=
nr_switches
     41300 =C2=B1  1%     -43.7%      23262 =C2=B1  1%  sched_debug.cpu#43.=
sched_count
     18807 =C2=B1  1%     -58.2%       7867 =C2=B1  2%  sched_debug.cpu#43.=
sched_goidle
     11681 =C2=B1  4%     -39.8%       7031 =C2=B1  4%  sched_debug.cpu#43.=
ttwu_count
      3920 =C2=B1  1%     -82.1%     700.75 =C2=B1  4%  sched_debug.cpu#43.=
ttwu_local
      2.75 =C2=B1 90%     -90.9%       0.25 =C2=B1173%  sched_debug.cpu#44.=
cpu_load[2]
     25545 =C2=B1  1%     -53.5%      11888 =C2=B1  8%  sched_debug.cpu#44.=
nr_load_updates
     42303 =C2=B1  2%     -45.4%      23106 =C2=B1  0%  sched_debug.cpu#44.=
nr_switches
     42312 =C2=B1  2%     -45.4%      23114 =C2=B1  0%  sched_debug.cpu#44.=
sched_count
     19295 =C2=B1  2%     -58.8%       7945 =C2=B1  0%  sched_debug.cpu#44.=
sched_goidle
     11771 =C2=B1  2%     -40.5%       7000 =C2=B1  7%  sched_debug.cpu#44.=
ttwu_count
      3977 =C2=B1  1%     -83.5%     654.75 =C2=B1  2%  sched_debug.cpu#44.=
ttwu_local
     25661 =C2=B1  1%     -53.4%      11950 =C2=B1  8%  sched_debug.cpu#45.=
nr_load_updates
     42649 =C2=B1  1%     -45.0%      23466 =C2=B1  1%  sched_debug.cpu#45.=
nr_switches
     42658 =C2=B1  1%     -45.0%      23477 =C2=B1  1%  sched_debug.cpu#45.=
sched_count
     19427 =C2=B1  1%     -58.5%       8056 =C2=B1  1%  sched_debug.cpu#45.=
sched_goidle
     12207 =C2=B1  3%     -35.8%       7839 =C2=B1  2%  sched_debug.cpu#45.=
ttwu_count
      4008 =C2=B1  1%     -82.5%     701.50 =C2=B1  5%  sched_debug.cpu#45.=
ttwu_local
    981755 =C2=B1  3%     -19.3%     792036 =C2=B1 14%  sched_debug.cpu#46.=
avg_idle
     26368 =C2=B1  1%     -54.7%      11935 =C2=B1  8%  sched_debug.cpu#46.=
nr_load_updates
     44425 =C2=B1  1%     -47.2%      23447 =C2=B1  1%  sched_debug.cpu#46.=
nr_switches
     44435 =C2=B1  1%     -47.2%      23455 =C2=B1  1%  sched_debug.cpu#46.=
sched_count
     20311 =C2=B1  1%     -60.4%       8051 =C2=B1  2%  sched_debug.cpu#46.=
sched_goidle
     13393 =C2=B1  4%     -39.3%       8130 =C2=B1 10%  sched_debug.cpu#46.=
ttwu_count
      4117 =C2=B1  4%     -83.6%     675.00 =C2=B1  7%  sched_debug.cpu#46.=
ttwu_local
    970969 =C2=B1  2%     -13.2%     842740 =C2=B1  8%  sched_debug.cpu#47.=
avg_idle
      6.00 =C2=B1 95%    -100.0%       0.00 =C2=B1  0%  sched_debug.cpu#47.=
cpu_load[1]
      4.00 =C2=B1 91%    -100.0%       0.00 =C2=B1  0%  sched_debug.cpu#47.=
cpu_load[2]
     27214 =C2=B1  1%     -56.8%      11751 =C2=B1  7%  sched_debug.cpu#47.=
nr_load_updates
     46862 =C2=B1  1%     -50.1%      23378 =C2=B1  2%  sched_debug.cpu#47.=
nr_switches
     46870 =C2=B1  1%     -50.1%      23387 =C2=B1  2%  sched_debug.cpu#47.=
sched_count
     21463 =C2=B1  2%     -62.3%       8082 =C2=B1  2%  sched_debug.cpu#47.=
sched_goidle
     14851 =C2=B1  4%     -47.3%       7827 =C2=B1  2%  sched_debug.cpu#47.=
ttwu_count
      4350 =C2=B1  2%     -83.0%     738.50 =C2=B1 10%  sched_debug.cpu#47.=
ttwu_local
     30657 =C2=B1  5%     -14.5%      26203 =C2=B1  2%  sched_debug.cpu#5.n=
r_load_updates
     32684 =C2=B1 18%     -28.9%      23232 =C2=B1  7%  sched_debug.cpu#5.t=
twu_count
      6212 =C2=B1  7%     -50.0%       3107 =C2=B1 14%  sched_debug.cpu#5.t=
twu_local
     29856 =C2=B1  4%     -14.3%      25584 =C2=B1  3%  sched_debug.cpu#6.n=
r_load_updates
     28941 =C2=B1  9%     -22.3%      22499 =C2=B1  2%  sched_debug.cpu#6.t=
twu_count
      5257 =C2=B1  4%     -47.4%       2763 =C2=B1  4%  sched_debug.cpu#6.t=
twu_local
     31566 =C2=B1  6%     -17.8%      25949 =C2=B1  3%  sched_debug.cpu#7.n=
r_load_updates
     62852 =C2=B1  9%     -12.9%      54731 =C2=B1  1%  sched_debug.cpu#7.n=
r_switches
     63428 =C2=B1  9%     -13.6%      54770 =C2=B1  1%  sched_debug.cpu#7.s=
ched_count
      6749 =C2=B1  9%     -62.7%       2514 =C2=B1  5%  sched_debug.cpu#7.t=
twu_local
     30612 =C2=B1  4%     -14.0%      26329 =C2=B1  3%  sched_debug.cpu#8.n=
r_load_updates
      5723 =C2=B1  9%     -54.5%       2602 =C2=B1 10%  sched_debug.cpu#8.t=
twu_local
     30743 =C2=B1  5%     -14.9%      26156 =C2=B1  3%  sched_debug.cpu#9.n=
r_load_updates
      6386 =C2=B1 16%     -57.4%       2718 =C2=B1  4%  sched_debug.cpu#9.t=
twu_local


ivb43: Ivytown Ivy Bridge-EP
Memory: 64G



To reproduce:

	apt-get install ruby
	git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
	cd lkp-tests
	bin/setup-local job.yaml # the job file attached in this email
	bin/run-local   job.yaml


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Ying Huang

--===============1149226106415375523==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogYWltOQpkZWZhdWx0LW1vbml0b3JzOgogIHdhaXQ6IHByZS10ZXN0CiAgdXB0aW1l
OiAKICBpb3N0YXQ6IAogIHZtc3RhdDogCiAgbnVtYS1udW1hc3RhdDogCiAgbnVtYS12bXN0YXQ6
IAogIG51bWEtbWVtaW5mbzogCiAgcHJvYy12bXN0YXQ6IAogIHByb2Mtc3RhdDoKICAgIGludGVy
dmFsOiAxMAogIG1lbWluZm86IAogIHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0
YXQ6IAogIGxhdGVuY3lfc3RhdHM6IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAog
IGRpc2tzdGF0czogCiAgbmZzc3RhdDogCiAgY3B1aWRsZTogCiAgY3B1ZnJlcS1zdGF0czogCiAg
dHVyYm9zdGF0OiAKICBwbWV0ZXI6IAogIHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDYwCmRl
ZmF1bHQtd2F0Y2hkb2dzOgogIHdhdGNoLW9vbTogCiAgd2F0Y2hkb2c6IApjcHVmcmVxX2dvdmVy
bm9yOiBwZXJmb3JtYW5jZQptb2RlbDogSXZ5dG93biBJdnkgQnJpZGdlLUVQCm5yX2NwdTogNDgK
bWVtb3J5OiA2NEcKbnJfaGRkX3BhcnRpdGlvbnM6IDMKaGRkX3BhcnRpdGlvbnM6ICIvZGV2L2Rp
c2svYnktaWQvYXRhLVNUMjAwME5NMDAxMSotcGFydDEiCnJvb3Rmc19wYXJ0aXRpb246ICIvZGV2
L2Rpc2svYnktaWQvYXRhLVNUMjAwME5NMDAxMV9aMVA2N0VCTC1wYXJ0MyIKc3dhcF9wYXJ0aXRp
b25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1TVDIwMDBOTTAwMTFfWjFQNjdFQkwtcGFydDIiCmFp
bTk6CiAgdGVzdHRpbWU6IDMwMHMKICB0ZXN0OiBzaGVsbF9ydG5zXzEKYnJhbmNoOiB5dXlhbmct
dGlwL2Zvci1sa3AKY29tbWl0OiAxYTNhZmE3Zjc1MDUyYTI4MDZhODkwZTZhZThjOTY5OWEzZDgx
NGY5CnJlcGVhdF90bzogMgp0ZXN0Ym94OiBpdmI0Mwp0Ym94X2dyb3VwOiBpdmI0MwprY29uZmln
OiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTUtMDYtMTYgMTA6MjM6MDYuMDQ2MzQzNTg3
ICswODowMAp1c2VyOiBsa3AKcXVldWU6IHVuaXQKY29tcGlsZXI6IGdjYy00LjkKaGVhZF9jb21t
aXQ6IDFhM2FmYTdmNzUwNTJhMjgwNmE4OTBlNmFlOGM5Njk5YTNkODE0ZjkKYmFzZV9jb21taXQ6
IGZhMTZjMWJmM2M0NzE3ZjgyYjljY2NhNjExNTY2NTYwNjhlMGIxNGMKa2VybmVsOiAiL3BrZy9s
aW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzFhM2FmYTdmNzUwNTJhMjgwNmE4OTBlNmFlOGM5Njk5
YTNkODE0Zjkvdm1saW51ei00LjEuMC1yYzgtMDI2NDItZzFhM2FmYTciCnJvb3RmczogZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNnegpyZXN1bHRfcm9vdDogIi9yZXN1bHQvYWltOS9wZXJmb3Jt
YW5jZS0zMDBzLXNoZWxsX3J0bnNfMS9pdmI0My9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6
L3g4Nl82NC1yaGVsL2djYy00LjkvMWEzYWZhN2Y3NTA1MmEyODA2YTg5MGU2YWU4Yzk2OTlhM2Q4
MTRmOS8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL2l2YjQzL3VuaXRfYWltOS1wZXJmb3Jt
YW5jZS0zMDBzLXNoZWxsX3J0bnNfMS14ODZfNjQtcmhlbC1IRUFELTFhM2FmYTdmNzUwNTJhMjgw
NmE4OTBlNmFlOGM5Njk5YTNkODE0ZjktMS0yMDE1MDYxNi0xMjQzODktcXJ1cHRwLnlhbWwiCmRl
cXVldWVfdGltZTogMjAxNS0wNi0yMyAwNjo1ODo0NC4yNjA3NzQzODAgKzA4OjAwCm1heF91cHRp
bWU6IDEyODQuMjgKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AK
LSBqb2I9L2xrcC9zY2hlZHVsZWQvaXZiNDMvdW5pdF9haW05LXBlcmZvcm1hbmNlLTMwMHMtc2hl
bGxfcnRuc18xLXg4Nl82NC1yaGVsLUhFQUQtMWEzYWZhN2Y3NTA1MmEyODA2YTg5MGU2YWU4Yzk2
OTlhM2Q4MTRmOS0xLTIwMTUwNjE2LTEyNDM4OS1xcnVwdHAueWFtbAotIEFSQ0g9eDg2XzY0Ci0g
a2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD15dXlhbmctdGlwL2Zvci1sa3AKLSBjb21taXQ9
MWEzYWZhN2Y3NTA1MmEyODA2YTg5MGU2YWU4Yzk2OTlhM2Q4MTRmOQotIEJPT1RfSU1BR0U9L3Br
Zy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzFhM2FmYTdmNzUwNTJhMjgwNmE4OTBlNmFlOGM5
Njk5YTNkODE0Zjkvdm1saW51ei00LjEuMC1yYzgtMDI2NDItZzFhM2FmYTcKLSBtYXhfdXB0aW1l
PTEyODQKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L2FpbTkvcGVyZm9ybWFuY2UtMzAwcy1zaGVsbF9y
dG5zXzEvaXZiNDMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2Mt
NC45LzFhM2FmYTdmNzUwNTJhMjgwNmE4OTBlNmFlOGM5Njk5YTNkODE0ZjkvMAotIExLUF9TRVJW
RVI9aW5uCi0gfDItCgoKICBlYXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2
ZWw9ZXJyCiAgZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5y
Y3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5t
aV93YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNr
PTAKICBjb25zb2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwps
a3BfaW5pdHJkOiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3Br
Zy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzFhM2FmYTdmNzUwNTJhMjgwNmE4OTBlNmFlOGM5
Njk5YTNkODE0ZjkvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82
NC0yMDE1LTAyLTA3LmNnei9ydW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4
Nl82NC0yMDE1LTAyLTA3LmNnei90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy90dXJib3N0
YXQuY2d6LC9sa3AvYmVuY2htYXJrcy9haW05LXg4Nl82NC5jZ3oiCmpvYl9zdGF0ZTogZmluaXNo
ZWQKbG9hZGF2ZzogMC42MCAwLjUzIDAuMjYgMS80NjcgNDgyNTMKc3RhcnRfdGltZTogJzE0MzUw
MTM5NzInCmVuZF90aW1lOiAnMTQzNTAxNDI3MicKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAx
NTA2MjItMTAxMDUyIgo=

--===============1149226106415375523==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE1L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE4L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjAvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyMS9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNC9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTI1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNy9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTI4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MjkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzAvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUzMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzMvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUzNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUz
Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NDAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQyL2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1NDMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHU0NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ1L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU0Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgo=

--===============1149226106415375523==--

