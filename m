Content-Type: multipart/mixed; boundary="===============7609169472480977795=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [nfs] 048883e0b9: No primary result change, -70.4% fsmark.time.involuntary_context_switches
Date: Thu, 08 Oct 2015 11:25:07 +0800
Message-ID: <87vbaivy7g.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7609169472480977795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 048883e0b934d9a5103d40e209cb14b7f33d2933 ("nfs: fix pg_test page cou=
nt calculation")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/iterations/nr_threads/disk/fs/f=
s2/filesize/test_size/sync_method/nr_directories/nr_files_per_directory:
  lkp-ws02/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/1x/32t/1=
HDD/xfs/nfsv4/16MB/60G/fsyncBeforeClose/16d/256fpd

commit: =

  a41cbe86df3afbc82311a1640e20858c0cd7e065
  048883e0b934d9a5103d40e209cb14b7f33d2933

a41cbe86df3afbc8 048883e0b934d9a5103d40e209 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    261986 =C2=B1  0%     -70.4%      77543 =C2=B1  0%  fsmark.time.involun=
tary_context_switches
    272406 =C2=B1  0%     -17.9%     223687 =C2=B1  0%  fsmark.time.volunta=
ry_context_switches
      5443 =C2=B1  0%     -38.6%       3342 =C2=B1  0%  vmstat.system.cs
    475248 =C2=B1  0%     -50.9%     233285 =C2=B1  0%  softirqs.NET_RX
    157367 =C2=B1  1%      -9.0%     143212 =C2=B1  0%  softirqs.SCHED
    261986 =C2=B1  0%     -70.4%      77543 =C2=B1  0%  time.involuntary_co=
ntext_switches
    272406 =C2=B1  0%     -17.9%     223687 =C2=B1  0%  time.voluntary_cont=
ext_switches
    248624 =C2=B1  1%    +294.3%     980340 =C2=B1  0%  meminfo.Active
    223111 =C2=B1  2%    +328.0%     954877 =C2=B1  0%  meminfo.Active(file)
     65657 =C2=B1  0%     -13.1%      57050 =C2=B1  0%  meminfo.SUnreclaim
      1.34 =C2=B1  0%      -5.2%       1.27 =C2=B1  0%  turbostat.%Busy
      5.19 =C2=B1  1%     -28.5%       3.71 =C2=B1  3%  turbostat.CPU%c1
     12.41 =C2=B1  1%     -52.3%       5.91 =C2=B1  4%  turbostat.CPU%c3
     14.86 =C2=B1  1%     -23.3%      11.39 =C2=B1  3%  turbostat.Pkg%pc3
     16.35 =C2=B1  1%     +41.8%      23.19 =C2=B1  1%  turbostat.Pkg%pc6
 2.675e+08 =C2=B1  4%     -12.9%  2.329e+08 =C2=B1  7%  cpuidle.C1-NHM.time
    165684 =C2=B1  4%     +12.4%     186205 =C2=B1  2%  cpuidle.C1-NHM.usage
 1.446e+08 =C2=B1  7%     -75.9%   34785128 =C2=B1 12%  cpuidle.C1E-NHM.time
     79076 =C2=B1  1%     -87.7%       9744 =C2=B1  3%  cpuidle.C1E-NHM.usa=
ge
 1.618e+09 =C2=B1  1%     -55.5%  7.193e+08 =C2=B1  3%  cpuidle.C3-NHM.time
    510548 =C2=B1  0%     -73.4%     135726 =C2=B1  1%  cpuidle.C3-NHM.usage
   1532641 =C2=B1  0%      -9.8%    1382714 =C2=B1  1%  cpuidle.C6-NHM.usage
    119890 =C2=B1  2%    +322.8%     506915 =C2=B1  5%  numa-meminfo.node0.=
Active
    107993 =C2=B1  2%    +356.4%     492854 =C2=B1  5%  numa-meminfo.node0.=
Active(file)
     34025 =C2=B1  3%      -9.9%      30670 =C2=B1  1%  numa-meminfo.node0.=
SUnreclaim
    128802 =C2=B1  4%    +267.7%     473544 =C2=B1  6%  numa-meminfo.node1.=
Active
    115176 =C2=B1  4%    +301.2%     462134 =C2=B1  6%  numa-meminfo.node1.=
Active(file)
      1217 =C2=B1  4%     -20.5%     967.25 =C2=B1 22%  numa-meminfo.node1.=
Dirty
      9663 =C2=B1 24%     -29.4%       6824 =C2=B1 35%  numa-meminfo.node1.=
Mapped
     31637 =C2=B1  3%     -16.6%      26381 =C2=B1  1%  numa-meminfo.node1.=
SUnreclaim
  11631847 =C2=B1  2%     +19.8%   13937484 =C2=B1  4%  numa-numastat.node0=
.local_node
   3950957 =C2=B1  9%     +58.3%    6253584 =C2=B1 10%  numa-numastat.node0=
.numa_foreign
  11631855 =C2=B1  2%     +19.8%   13937495 =C2=B1  4%  numa-numastat.node0=
.numa_hit
   4660337 =C2=B1  3%     -27.1%    3398872 =C2=B1  7%  numa-numastat.node0=
.numa_miss
   4660345 =C2=B1  3%     -27.1%    3398883 =C2=B1  7%  numa-numastat.node0=
.other_node
  13541675 =C2=B1  3%     -24.6%   10208933 =C2=B1  9%  numa-numastat.node1=
.local_node
   4660333 =C2=B1  3%     -27.1%    3398872 =C2=B1  7%  numa-numastat.node1=
.numa_foreign
  13541683 =C2=B1  3%     -24.6%   10208939 =C2=B1  9%  numa-numastat.node1=
.numa_hit
   3950957 =C2=B1  9%     +58.3%    6253604 =C2=B1 10%  numa-numastat.node1=
.numa_miss
   3950964 =C2=B1  9%     +58.3%    6253611 =C2=B1 10%  numa-numastat.node1=
.other_node
     55777 =C2=B1  2%    +328.0%     238719 =C2=B1  0%  proc-vmstat.nr_acti=
ve_file
     16414 =C2=B1  0%     -13.1%      14262 =C2=B1  0%  proc-vmstat.nr_slab=
_unreclaimable
   8605572 =C2=B1  5%     +12.1%    9648367 =C2=B1  6%  proc-vmstat.numa_fo=
reign
   8605590 =C2=B1  5%     +12.1%    9648366 =C2=B1  6%  proc-vmstat.numa_mi=
ss
   8605606 =C2=B1  5%     +12.1%    9648384 =C2=B1  6%  proc-vmstat.numa_ot=
her
      1080 =C2=B1  8%     -14.5%     924.25 =C2=B1  5%  proc-vmstat.numa_pa=
ges_migrated
     68361 =C2=B1  5%    +620.8%     492764 =C2=B1  2%  proc-vmstat.pgactiv=
ate
      1080 =C2=B1  8%     -14.5%     924.25 =C2=B1  5%  proc-vmstat.pgmigra=
te_success
   4917430 =C2=B1  1%      +8.5%    5336634 =C2=B1  2%  proc-vmstat.pgscan_=
kswapd_dma32
   2245024 =C2=B1  0%     -70.9%     653056 =C2=B1  0%  proc-vmstat.slabs_s=
canned
     26997 =C2=B1  2%    +356.4%     123206 =C2=B1  5%  numa-vmstat.node0.n=
r_active_file
      8505 =C2=B1  3%      -9.9%       7667 =C2=B1  1%  numa-vmstat.node0.n=
r_slab_unreclaimable
   1556010 =C2=B1 11%     +72.7%    2687972 =C2=B1  9%  numa-vmstat.node0.n=
uma_foreign
   5466532 =C2=B1  2%     +17.2%    6404739 =C2=B1  5%  numa-vmstat.node0.n=
uma_hit
   5466271 =C2=B1  2%     +17.2%    6404584 =C2=B1  5%  numa-vmstat.node0.n=
uma_local
   2073926 =C2=B1  8%     -27.8%    1497829 =C2=B1 15%  numa-vmstat.node0.n=
uma_miss
   2074187 =C2=B1  8%     -27.8%    1497984 =C2=B1 15%  numa-vmstat.node0.n=
uma_other
     28794 =C2=B1  4%    +301.2%     115526 =C2=B1  6%  numa-vmstat.node1.n=
r_active_file
    300.50 =C2=B1  4%     -27.2%     218.75 =C2=B1 17%  numa-vmstat.node1.n=
r_dirty
      2415 =C2=B1 24%     -29.4%       1705 =C2=B1 35%  numa-vmstat.node1.n=
r_mapped
      7909 =C2=B1  3%     -16.6%       6595 =C2=B1  1%  numa-vmstat.node1.n=
r_slab_unreclaimable
   2073932 =C2=B1  8%     -27.8%    1497832 =C2=B1 15%  numa-vmstat.node1.n=
uma_foreign
   6395016 =C2=B1  3%     -23.4%    4896548 =C2=B1  6%  numa-vmstat.node1.n=
uma_hit
   6330567 =C2=B1  3%     -23.7%    4832140 =C2=B1  6%  numa-vmstat.node1.n=
uma_local
   1556010 =C2=B1 11%     +72.7%    2687974 =C2=B1  9%  numa-vmstat.node1.n=
uma_miss
   1620459 =C2=B1 10%     +69.9%    2752382 =C2=B1  8%  numa-vmstat.node1.n=
uma_other
      4543 =C2=B1  2%     -78.3%     986.25 =C2=B1  1%  slabinfo.RAW.active=
_objs
    129.25 =C2=B1  2%     -79.3%      26.75 =C2=B1  1%  slabinfo.RAW.active=
_slabs
      4672 =C2=B1  2%     -78.9%     986.25 =C2=B1  1%  slabinfo.RAW.num_ob=
js
    129.25 =C2=B1  2%     -79.3%      26.75 =C2=B1  1%  slabinfo.RAW.num_sl=
abs
     55723 =C2=B1  0%     -40.0%      33420 =C2=B1  0%  slabinfo.kmalloc-12=
8.active_objs
      1768 =C2=B1  0%     -39.6%       1067 =C2=B1  1%  slabinfo.kmalloc-12=
8.active_slabs
     56593 =C2=B1  0%     -39.6%      34163 =C2=B1  1%  slabinfo.kmalloc-12=
8.num_objs
      1768 =C2=B1  0%     -39.6%       1067 =C2=B1  1%  slabinfo.kmalloc-12=
8.num_slabs
     12134 =C2=B1  1%      -7.9%      11175 =C2=B1  3%  slabinfo.kmalloc-19=
2.active_objs
     12367 =C2=B1  1%      -9.0%      11257 =C2=B1  2%  slabinfo.kmalloc-19=
2.num_objs
     14574 =C2=B1  1%     -32.2%       9875 =C2=B1  3%  slabinfo.kmalloc-32=
.active_objs
     14574 =C2=B1  1%     -32.2%       9875 =C2=B1  3%  slabinfo.kmalloc-32=
.num_objs
     35364 =C2=B1  0%     -62.7%      13198 =C2=B1  2%  slabinfo.kmalloc-96=
.active_objs
    854.00 =C2=B1  0%     -62.5%     320.25 =C2=B1  1%  slabinfo.kmalloc-96=
.active_slabs
     35880 =C2=B1  0%     -62.5%      13469 =C2=B1  1%  slabinfo.kmalloc-96=
.num_objs
    854.00 =C2=B1  0%     -62.5%     320.25 =C2=B1  1%  slabinfo.kmalloc-96=
.num_slabs
      8.25 =C2=B1 69%    +524.2%      51.50 =C2=B1 42%  sched_debug.cfs_rq[=
0]:/.load
      9290 =C2=B1  2%     -28.3%       6664 =C2=B1  3%  sched_debug.cfs_rq[=
10]:/.exec_clock
    267277 =C2=B1  2%      -9.4%     242184 =C2=B1  4%  sched_debug.cfs_rq[=
10]:/.min_vruntime
     53.25 =C2=B1  6%     -24.4%      40.25 =C2=B1  2%  sched_debug.cfs_rq[=
10]:/.nr_spread_over
     -9975 =C2=B1-167%    +515.1%     -61355 =C2=B1-28%  sched_debug.cfs_rq=
[10]:/.spread0
      9375 =C2=B1  4%     -27.8%       6766 =C2=B1  4%  sched_debug.cfs_rq[=
11]:/.exec_clock
     54.00 =C2=B1  6%     -28.2%      38.75 =C2=B1  9%  sched_debug.cfs_rq[=
11]:/.nr_spread_over
    -26030 =C2=B1-80%    +151.9%     -65565 =C2=B1-33%  sched_debug.cfs_rq[=
11]:/.spread0
     47694 =C2=B1  8%     +25.3%      59751 =C2=B1  6%  sched_debug.cfs_rq[=
12]:/.min_vruntime
     18.50 =C2=B1 14%     +41.9%      26.25 =C2=B1 11%  sched_debug.cfs_rq[=
12]:/.nr_spread_over
      2556 =C2=B1  5%     +62.8%       4160 =C2=B1 15%  sched_debug.cfs_rq[=
13]:/.exec_clock
     43878 =C2=B1  8%     +51.8%      66592 =C2=B1 20%  sched_debug.cfs_rq[=
13]:/.min_vruntime
      2813 =C2=B1 11%     +27.2%       3579 =C2=B1  5%  sched_debug.cfs_rq[=
14]:/.exec_clock
      7.25 =C2=B1173%    +331.0%      31.25 =C2=B1 73%  sched_debug.cfs_rq[=
14]:/.load
     43638 =C2=B1 15%     +45.7%      63601 =C2=B1 18%  sched_debug.cfs_rq[=
14]:/.min_vruntime
      5.00 =C2=B1 37%    +135.0%      11.75 =C2=B1 32%  sched_debug.cfs_rq[=
14]:/.util_avg
      2665 =C2=B1  5%     +39.2%       3711 =C2=B1 11%  sched_debug.cfs_rq[=
15]:/.exec_clock
     40446 =C2=B1 14%     +34.6%      54455 =C2=B1 11%  sched_debug.cfs_rq[=
15]:/.min_vruntime
      2510 =C2=B1  3%     +50.5%       3778 =C2=B1  9%  sched_debug.cfs_rq[=
16]:/.exec_clock
     14.00 =C2=B1 15%     +69.6%      23.75 =C2=B1  9%  sched_debug.cfs_rq[=
16]:/.nr_spread_over
   -218464 =C2=B1 -6%     +10.4%    -241264 =C2=B1 -4%  sched_debug.cfs_rq[=
16]:/.spread0
      2750 =C2=B1  7%     +24.8%       3432 =C2=B1  2%  sched_debug.cfs_rq[=
17]:/.exec_clock
      3203 =C2=B1  5%     -28.9%       2278 =C2=B1  7%  sched_debug.cfs_rq[=
18]:/.exec_clock
     59639 =C2=B1  4%     -20.3%      47534 =C2=B1  6%  sched_debug.cfs_rq[=
18]:/.min_vruntime
   -217617 =C2=B1 -5%     +17.6%    -256020 =C2=B1 -5%  sched_debug.cfs_rq[=
18]:/.spread0
      2975 =C2=B1  5%     -22.7%       2301 =C2=B1 12%  sched_debug.cfs_rq[=
19]:/.exec_clock
   -223305 =C2=B1 -7%     +15.8%    -258545 =C2=B1 -6%  sched_debug.cfs_rq[=
19]:/.spread0
      8007 =C2=B1  3%     +14.1%       9134 =C2=B1  4%  sched_debug.cfs_rq[=
1]:/.exec_clock
      3094 =C2=B1  7%     -24.1%       2349 =C2=B1  2%  sched_debug.cfs_rq[=
20]:/.exec_clock
     54684 =C2=B1 15%     -25.7%      40653 =C2=B1 14%  sched_debug.cfs_rq[=
20]:/.min_vruntime
   -222572 =C2=B1 -7%     +18.1%    -262902 =C2=B1 -5%  sched_debug.cfs_rq[=
20]:/.spread0
      3057 =C2=B1  4%     -23.0%       2354 =C2=B1 10%  sched_debug.cfs_rq[=
21]:/.exec_clock
      2997 =C2=B1  4%     -23.3%       2298 =C2=B1  9%  sched_debug.cfs_rq[=
22]:/.exec_clock
     50613 =C2=B1  9%     -18.3%      41365 =C2=B1 16%  sched_debug.cfs_rq[=
22]:/.min_vruntime
     19.75 =C2=B1  6%     -21.5%      15.50 =C2=B1 17%  sched_debug.cfs_rq[=
22]:/.nr_spread_over
   -226643 =C2=B1 -4%     +15.7%    -262191 =C2=B1 -5%  sched_debug.cfs_rq[=
22]:/.spread0
     23.25 =C2=B1 47%     -72.0%       6.50 =C2=B1 65%  sched_debug.cfs_rq[=
22]:/.util_avg
   -220864 =C2=B1 -5%     +15.5%    -255074 =C2=B1 -6%  sched_debug.cfs_rq[=
23]:/.spread0
    -28540 =C2=B1-34%     +95.8%     -55873 =C2=B1-18%  sched_debug.cfs_rq[=
2]:/.spread0
     47.25 =C2=B1  6%     +24.3%      58.75 =C2=B1  6%  sched_debug.cfs_rq[=
5]:/.nr_spread_over
      9369 =C2=B1  1%     -23.3%       7187 =C2=B1  3%  sched_debug.cfs_rq[=
6]:/.exec_clock
     63.25 =C2=B1  9%     -18.6%      51.50 =C2=B1 13%  sched_debug.cfs_rq[=
6]:/.nr_spread_over
      9502 =C2=B1  2%     -26.7%       6965 =C2=B1  4%  sched_debug.cfs_rq[=
7]:/.exec_clock
     58.25 =C2=B1  8%     -20.6%      46.25 =C2=B1  4%  sched_debug.cfs_rq[=
7]:/.nr_spread_over
    -33020 =C2=B1-61%    +117.1%     -71698 =C2=B1-19%  sched_debug.cfs_rq[=
7]:/.spread0
      9332 =C2=B1  3%     -26.4%       6864 =C2=B1  3%  sched_debug.cfs_rq[=
8]:/.exec_clock
    254022 =C2=B1  2%      -9.0%     231037 =C2=B1  1%  sched_debug.cfs_rq[=
8]:/.min_vruntime
    -23229 =C2=B1-73%    +212.1%     -72492 =C2=B1-19%  sched_debug.cfs_rq[=
8]:/.spread0
      9519 =C2=B1  3%     -26.4%       7007 =C2=B1  3%  sched_debug.cfs_rq[=
9]:/.exec_clock
    -10930 =C2=B1-196%    +425.0%     -57389 =C2=B1-11%  sched_debug.cfs_rq=
[9]:/.spread0
    175146 =C2=B1  5%     -28.7%     124945 =C2=B1  5%  sched_debug.cpu#0.n=
r_switches
    138.75 =C2=B1 21%     -32.4%      93.75 =C2=B1 28%  sched_debug.cpu#0.n=
r_uninterruptible
     65351 =C2=B1  7%     -20.6%      51877 =C2=B1  7%  sched_debug.cpu#0.s=
ched_goidle
    454109 =C2=B1  3%     +30.2%     591454 =C2=B1  4%  sched_debug.cpu#0.t=
twu_count
     36456 =C2=B1  1%     -35.0%      23705 =C2=B1  5%  sched_debug.cpu#0.t=
twu_local
    159152 =C2=B1  5%     -26.4%     117194 =C2=B1  5%  sched_debug.cpu#1.n=
r_switches
     60806 =C2=B1  6%     -18.8%      49354 =C2=B1  5%  sched_debug.cpu#1.s=
ched_goidle
     31121 =C2=B1  5%     -35.6%      20032 =C2=B1 10%  sched_debug.cpu#1.t=
twu_local
     38223 =C2=B1  4%     -10.9%      34062 =C2=B1  5%  sched_debug.cpu#10.=
nr_load_updates
    165227 =C2=B1  3%     -43.8%      92896 =C2=B1  3%  sched_debug.cpu#10.=
nr_switches
    257578 =C2=B1  4%     -33.7%     170890 =C2=B1  6%  sched_debug.cpu#10.=
sched_count
     59662 =C2=B1  4%     -33.9%      39423 =C2=B1  4%  sched_debug.cpu#10.=
sched_goidle
    161422 =C2=B1  6%     -34.7%     105365 =C2=B1  5%  sched_debug.cpu#10.=
ttwu_count
     34048 =C2=B1  4%     -57.5%      14483 =C2=B1 11%  sched_debug.cpu#10.=
ttwu_local
     39424 =C2=B1  7%     -16.4%      32956 =C2=B1  4%  sched_debug.cpu#11.=
nr_load_updates
    172939 =C2=B1 10%     -47.9%      90094 =C2=B1  6%  sched_debug.cpu#11.=
nr_switches
    273257 =C2=B1  7%     -37.4%     171120 =C2=B1  6%  sched_debug.cpu#11.=
sched_count
     63637 =C2=B1 13%     -40.3%      38022 =C2=B1  8%  sched_debug.cpu#11.=
sched_goidle
    155856 =C2=B1  5%     -32.7%     104830 =C2=B1  5%  sched_debug.cpu#11.=
ttwu_count
     34928 =C2=B1  9%     -61.4%      13465 =C2=B1  5%  sched_debug.cpu#11.=
ttwu_local
      0.50 =C2=B1100%    +550.0%       3.25 =C2=B1 50%  sched_debug.cpu#12.=
cpu_load[0]
      0.33 =C2=B1141%   +2825.0%       9.75 =C2=B1 46%  sched_debug.cpu#12.=
cpu_load[1]
      0.00 =C2=B1  0%      +Inf%      10.75 =C2=B1 53%  sched_debug.cpu#12.=
cpu_load[2]
     34474 =C2=B1  6%     -20.2%      27520 =C2=B1  4%  sched_debug.cpu#12.=
nr_switches
     -6.25 =C2=B1-44%    +292.0%     -24.50 =C2=B1-19%  sched_debug.cpu#12.=
nr_uninterruptible
     60396 =C2=B1  5%     +29.7%      78305 =C2=B1  5%  sched_debug.cpu#12.=
sched_count
     10850 =C2=B1  3%     -16.2%       9096 =C2=B1  3%  sched_debug.cpu#12.=
sched_goidle
     31456 =C2=B1  7%     +35.7%      42670 =C2=B1 15%  sched_debug.cpu#12.=
ttwu_count
      8534 =C2=B1  9%     -24.4%       6448 =C2=B1  6%  sched_debug.cpu#12.=
ttwu_local
     34463 =C2=B1  9%     -24.4%      26054 =C2=B1  4%  sched_debug.cpu#13.=
nr_switches
     11721 =C2=B1 11%     -22.0%       9139 =C2=B1  4%  sched_debug.cpu#13.=
sched_goidle
     28660 =C2=B1 21%     +32.6%      38008 =C2=B1 11%  sched_debug.cpu#13.=
ttwu_count
      8099 =C2=B1 10%     -29.3%       5728 =C2=B1  4%  sched_debug.cpu#13.=
ttwu_local
      7.25 =C2=B1173%    +331.0%      31.25 =C2=B1 73%  sched_debug.cpu#14.=
load
      7767 =C2=B1 11%     -29.6%       5469 =C2=B1  3%  sched_debug.cpu#14.=
ttwu_local
     33863 =C2=B1  7%     -24.1%      25692 =C2=B1  5%  sched_debug.cpu#15.=
nr_switches
     53077 =C2=B1  8%     +17.8%      62540 =C2=B1  4%  sched_debug.cpu#15.=
sched_count
     11485 =C2=B1  8%     -20.6%       9120 =C2=B1  6%  sched_debug.cpu#15.=
sched_goidle
      7561 =C2=B1  8%     -28.0%       5445 =C2=B1  4%  sched_debug.cpu#15.=
ttwu_local
      0.50 =C2=B1781%   -1400.0%      -6.50 =C2=B1-58%  sched_debug.cpu#16.=
nr_uninterruptible
     50380 =C2=B1  6%     +32.3%      66650 =C2=B1  9%  sched_debug.cpu#16.=
sched_count
     32988 =C2=B1 13%     +30.3%      42982 =C2=B1 10%  sched_debug.cpu#16.=
ttwu_count
      7258 =C2=B1  3%     -24.6%       5474 =C2=B1  5%  sched_debug.cpu#16.=
ttwu_local
     32669 =C2=B1  7%     -21.0%      25796 =C2=B1  3%  sched_debug.cpu#17.=
nr_switches
     51010 =C2=B1  7%     +27.7%      65151 =C2=B1  7%  sched_debug.cpu#17.=
sched_count
     10905 =C2=B1  7%     -15.1%       9263 =C2=B1  4%  sched_debug.cpu#17.=
sched_goidle
      7554 =C2=B1  7%     -29.4%       5333 =C2=B1  2%  sched_debug.cpu#17.=
ttwu_local
     42588 =C2=B1  5%     -57.5%      18111 =C2=B1  5%  sched_debug.cpu#18.=
nr_switches
     48946 =C2=B1  5%     -45.6%      26618 =C2=B1  3%  sched_debug.cpu#18.=
sched_count
     14079 =C2=B1  6%     -52.5%       6685 =C2=B1  5%  sched_debug.cpu#18.=
sched_goidle
     59721 =C2=B1 14%     -34.8%      38956 =C2=B1 15%  sched_debug.cpu#18.=
ttwu_count
      9908 =C2=B1  4%     -60.9%       3871 =C2=B1  5%  sched_debug.cpu#18.=
ttwu_local
     42395 =C2=B1  9%     -55.6%      18832 =C2=B1  7%  sched_debug.cpu#19.=
nr_switches
     48669 =C2=B1  8%     -41.7%      28376 =C2=B1 10%  sched_debug.cpu#19.=
sched_count
     14408 =C2=B1 11%     -51.8%       6938 =C2=B1  4%  sched_debug.cpu#19.=
sched_goidle
     53917 =C2=B1  8%     -30.3%      37553 =C2=B1 22%  sched_debug.cpu#19.=
ttwu_count
      9427 =C2=B1  4%     -56.6%       4092 =C2=B1 11%  sched_debug.cpu#19.=
ttwu_local
    147731 =C2=B1  6%     -23.9%     112487 =C2=B1 13%  sched_debug.cpu#2.n=
r_switches
     29874 =C2=B1  7%     -38.2%      18457 =C2=B1  4%  sched_debug.cpu#2.t=
twu_local
     40196 =C2=B1  1%     -53.8%      18575 =C2=B1  7%  sched_debug.cpu#20.=
nr_switches
     46237 =C2=B1  2%     -42.8%      26424 =C2=B1  7%  sched_debug.cpu#20.=
sched_count
     13149 =C2=B1  1%     -48.0%       6832 =C2=B1  9%  sched_debug.cpu#20.=
sched_goidle
     58681 =C2=B1 17%     -32.2%      39806 =C2=B1  7%  sched_debug.cpu#20.=
ttwu_count
      9561 =C2=B1  3%     -58.7%       3948 =C2=B1  3%  sched_debug.cpu#20.=
ttwu_local
     44696 =C2=B1 12%     -56.2%      19577 =C2=B1  4%  sched_debug.cpu#21.=
nr_switches
     50784 =C2=B1 13%     -44.8%      28024 =C2=B1  9%  sched_debug.cpu#21.=
sched_count
     15527 =C2=B1 16%     -52.4%       7393 =C2=B1  8%  sched_debug.cpu#21.=
sched_goidle
     57233 =C2=B1  8%     -40.5%      34066 =C2=B1 11%  sched_debug.cpu#21.=
ttwu_count
      9417 =C2=B1  2%     -56.3%       4111 =C2=B1  8%  sched_debug.cpu#21.=
ttwu_local
     24.00 =C2=B1 74%     -99.0%       0.25 =C2=B1173%  sched_debug.cpu#22.=
cpu_load[1]
     19107 =C2=B1  0%      -9.1%      17364 =C2=B1  2%  sched_debug.cpu#22.=
nr_load_updates
     39083 =C2=B1  4%     -45.3%      21397 =C2=B1 18%  sched_debug.cpu#22.=
nr_switches
     45608 =C2=B1  4%     -36.6%      28906 =C2=B1 16%  sched_debug.cpu#22.=
sched_count
     12789 =C2=B1  4%     -35.0%       8314 =C2=B1 22%  sched_debug.cpu#22.=
sched_goidle
     55277 =C2=B1  8%     -26.6%      40574 =C2=B1 16%  sched_debug.cpu#22.=
ttwu_count
      9233 =C2=B1  5%     -57.4%       3931 =C2=B1  8%  sched_debug.cpu#22.=
ttwu_local
     10.25 =C2=B1 85%     -95.1%       0.50 =C2=B1173%  sched_debug.cpu#23.=
cpu_load[3]
      8.50 =C2=B1 71%     -91.2%       0.75 =C2=B1173%  sched_debug.cpu#23.=
cpu_load[4]
     40504 =C2=B1  5%     -50.9%      19893 =C2=B1 11%  sched_debug.cpu#23.=
nr_switches
     46592 =C2=B1  5%     -37.8%      28998 =C2=B1 12%  sched_debug.cpu#23.=
sched_count
     13555 =C2=B1  8%     -44.8%       7482 =C2=B1 12%  sched_debug.cpu#23.=
sched_goidle
      9260 =C2=B1  2%     -57.6%       3929 =C2=B1  5%  sched_debug.cpu#23.=
ttwu_local
    138922 =C2=B1  7%     -26.0%     102743 =C2=B1  6%  sched_debug.cpu#3.n=
r_switches
     50963 =C2=B1  9%     -16.1%      42759 =C2=B1  7%  sched_debug.cpu#3.s=
ched_goidle
     28726 =C2=B1  1%     -45.2%      15753 =C2=B1  5%  sched_debug.cpu#3.t=
twu_local
    144321 =C2=B1 11%     -33.2%      96457 =C2=B1  4%  sched_debug.cpu#4.n=
r_switches
     53378 =C2=B1 14%     -25.9%      39541 =C2=B1  5%  sched_debug.cpu#4.s=
ched_goidle
     28224 =C2=B1  3%     -40.6%      16760 =C2=B1  8%  sched_debug.cpu#4.t=
twu_local
    150005 =C2=B1  9%     -25.7%     111426 =C2=B1  8%  sched_debug.cpu#5.n=
r_switches
     56676 =C2=B1 10%     -17.4%      46823 =C2=B1 10%  sched_debug.cpu#5.s=
ched_goidle
     27292 =C2=B1  8%     -35.7%      17541 =C2=B1 13%  sched_debug.cpu#5.t=
twu_local
     38010 =C2=B1  2%     -10.1%      34177 =C2=B1  6%  sched_debug.cpu#6.n=
r_load_updates
    168056 =C2=B1  4%     -40.0%     100828 =C2=B1 15%  sched_debug.cpu#6.n=
r_switches
    262900 =C2=B1  3%     -31.4%     180287 =C2=B1 11%  sched_debug.cpu#6.s=
ched_count
     61232 =C2=B1  6%     -29.9%      42898 =C2=B1 18%  sched_debug.cpu#6.s=
ched_goidle
    154457 =C2=B1  3%     -25.4%     115273 =C2=B1  1%  sched_debug.cpu#6.t=
twu_count
     33443 =C2=B1  2%     -55.3%      14959 =C2=B1  9%  sched_debug.cpu#6.t=
twu_local
    170525 =C2=B1  5%     -42.4%      98162 =C2=B1  9%  sched_debug.cpu#7.n=
r_switches
    -46.50 =C2=B1-23%     -69.9%     -14.00 =C2=B1-67%  sched_debug.cpu#7.n=
r_uninterruptible
    265048 =C2=B1  4%     -30.2%     185134 =C2=B1  5%  sched_debug.cpu#7.s=
ched_count
     62399 =C2=B1  7%     -33.0%      41796 =C2=B1 10%  sched_debug.cpu#7.s=
ched_goidle
    154392 =C2=B1  1%     -30.4%     107510 =C2=B1  5%  sched_debug.cpu#7.t=
twu_count
     33054 =C2=B1  2%     -53.2%      15465 =C2=B1 15%  sched_debug.cpu#7.t=
twu_local
     37815 =C2=B1  2%     -11.0%      33641 =C2=B1  5%  sched_debug.cpu#8.n=
r_load_updates
    163043 =C2=B1  5%     -43.7%      91771 =C2=B1  8%  sched_debug.cpu#8.n=
r_switches
    -43.75 =C2=B1-27%     -81.1%      -8.25 =C2=B1-136%  sched_debug.cpu#8.=
nr_uninterruptible
    258882 =C2=B1  3%     -34.3%     170056 =C2=B1  4%  sched_debug.cpu#8.s=
ched_count
     58242 =C2=B1  6%     -33.4%      38773 =C2=B1 10%  sched_debug.cpu#8.s=
ched_goidle
    157201 =C2=B1  2%     -32.7%     105794 =C2=B1  8%  sched_debug.cpu#8.t=
twu_count
     33488 =C2=B1  3%     -58.9%      13772 =C2=B1  9%  sched_debug.cpu#8.t=
twu_local
     37709 =C2=B1  2%     -11.5%      33383 =C2=B1  3%  sched_debug.cpu#9.n=
r_load_updates
    172842 =C2=B1 10%     -45.0%      95016 =C2=B1  9%  sched_debug.cpu#9.n=
r_switches
    -38.75 =C2=B1-45%     -76.8%      -9.00 =C2=B1-82%  sched_debug.cpu#9.n=
r_uninterruptible
    270984 =C2=B1  6%     -35.9%     173630 =C2=B1  5%  sched_debug.cpu#9.s=
ched_count
     62874 =C2=B1 12%     -36.0%      40237 =C2=B1 11%  sched_debug.cpu#9.s=
ched_goidle
    156190 =C2=B1  5%     -33.3%     104228 =C2=B1  6%  sched_debug.cpu#9.t=
twu_count
     33673 =C2=B1  3%     -59.4%      13669 =C2=B1  5%  sched_debug.cpu#9.t=
twu_local


lkp-ws02: Westmere-EP
Memory: 16G


                      fsmark.time.involuntary_context_switches

  280000 ++----------------------------------------------------------------=
-+
  260000 *+..*..*...*...*...*..*...*...*...*..*...*...*..*...*...*...*     =
 |
         |                                                                 =
 |
  240000 ++                                                                =
 |
  220000 ++                                                                =
 |
  200000 ++                                                                =
 |
  180000 ++                                                                =
 |
         |                                                                 =
 |
  160000 ++                                                                =
 |
  140000 ++                                                                =
 |
  120000 ++                                                                =
 |
  100000 ++                                                                =
 |
         |                                                                 =
 |
   80000 O+  O  O   O   O   O  O   O   O   O  O   O   O  O   O   O   O  O  =
 O
   60000 ++----------------------------------------------------------------=
-+


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
Ying Huang

--===============7609169472480977795==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogZnNtYXJrCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9uaXRv
cgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0
YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBw
cm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50
ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAg
YmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6IAog
IGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1ZzoK
ICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiAKZGVmYXVsdC13YXRjaGRvZ3M6CiAg
b29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IDlmZmVjYjEwMjgzNTA4MjYwOTM2Yjk2
MDIyZDRlZTQzYTc3OThiNGMKbW9kZWw6IFdlc3RtZXJlLUVQCm1lbW9yeTogMTZHCm5yX2hkZF9w
YXJ0aXRpb25zOiAxMQpoZGRfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9zY3NpLTM1MDAw
YzUwMCotcGFydDEiCnN3YXBfcGFydGl0aW9uczogCnJvb3Rmc19wYXJ0aXRpb246ICIvZGV2L2Rp
c2svYnktaWQvYXRhLVdEQ19XRDEwMDJGQUVYLTAwWjNBMF9XRC1XQ0FUUjU0MDg1NjQtcGFydDMi
CmNhdGVnb3J5OiBiZW5jaG1hcmsKaXRlcmF0aW9uczogMXgKbnJfdGhyZWFkczogMzJ0CmRpc2s6
IDFIREQKZnM6IHhmcwpmczI6IG5mc3Y0CmZzbWFyazoKICBmaWxlc2l6ZTogMTZNQgogIHRlc3Rf
c2l6ZTogNjBHCiAgc3luY19tZXRob2Q6IGZzeW5jQmVmb3JlQ2xvc2UKICBucl9kaXJlY3Rvcmll
czogMTZkCiAgbnJfZmlsZXNfcGVyX2RpcmVjdG9yeTogMjU2ZnBkCnF1ZXVlOiBjeWNsaWMKdGVz
dGJveDogbGtwLXdzMDIKdGJveF9ncm91cDogbGtwLXdzMDIKa2NvbmZpZzogeDg2XzY0LXJoZWwK
ZW5xdWV1ZV90aW1lOiAyMDE1LTA5LTI5IDA5OjU3OjU1LjQ4OTk5MTQwMSArMDg6MDAKaWQ6IDM1
ZWE5YThkMDYzYmU0N2M0M2UzODU1OTBiZmQ3Y2ZiMDU4YzU3NmIKdXNlcjogbGtwCmNvbXBpbGVy
OiBnY2MtNC45CmhlYWRfY29tbWl0OiBjNWNmZDRiNmJlYWQ4MTBlNWFlYjQwYTNlMWE4NzkzYTkx
NTU0ZWJjCmJhc2VfY29tbWl0OiA5ZmZlY2IxMDI4MzUwODI2MDkzNmI5NjAyMmQ0ZWU0M2E3Nzk4
YjRjCmJyYW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUwOTI4MDkKa2VybmVsOiAi
L3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzlmZmVjYjEwMjgzNTA4MjYwOTM2Yjk2MDIy
ZDRlZTQzYTc3OThiNGMvdm1saW51ei00LjMuMC1yYzMiCnJvb3RmczogZGViaWFuLXg4Nl82NC0y
MDE1LTAyLTA3LmNnegpyZXN1bHRfcm9vdDogIi9yZXN1bHQvZnNtYXJrLzF4LTMydC0xSERELXhm
cy1uZnN2NC0xNk1CLTYwRy1mc3luY0JlZm9yZUNsb3NlLTE2ZC0yNTZmcGQvbGtwLXdzMDIvZGVi
aWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzlmZmVjYjEwMjgz
NTA4MjYwOTM2Yjk2MDIyZDRlZTQzYTc3OThiNGMvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxl
ZC9sa3Atd3MwMi9jeWNsaWNfZnNtYXJrLTF4LTMydC0xSERELXhmcy1uZnN2NC0xNk1CLTYwRy1m
c3luY0JlZm9yZUNsb3NlLTE2ZC0yNTZmcGQteDg2XzY0LXJoZWwtQ1lDTElDX0JBU0UtOWZmZWNi
MTAyODM1MDgyNjA5MzZiOTYwMjJkNGVlNDNhNzc5OGI0Yy0yMDE1MDkyOS01NzMzNS01ZmM0aXUt
MC55YW1sIgpkZXF1ZXVlX3RpbWU6IDIwMTUtMDktMjkgMTA6MTg6MTIuMjI1MjcxODUxICswODow
MApucl9jcHU6ICIkKG5wcm9jKSIKbWF4X3VwdGltZTogMjQ5Mi4zOTk5OTk5OTk5OTk2CmluaXRy
ZDogIi9vc2ltYWdlL2RlYmlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpib290bG9h
ZGVyX2FwcGVuZDoKLSByb290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Avc2NoZWR1
bGVkL2xrcC13czAyL2N5Y2xpY19mc21hcmstMXgtMzJ0LTFIREQteGZzLW5mc3Y0LTE2TUItNjBH
LWZzeW5jQmVmb3JlQ2xvc2UtMTZkLTI1NmZwZC14ODZfNjQtcmhlbC1DWUNMSUNfQkFTRS05ZmZl
Y2IxMDI4MzUwODI2MDkzNmI5NjAyMmQ0ZWU0M2E3Nzk4YjRjLTIwMTUwOTI5LTU3MzM1LTVmYzRp
dS0wLnlhbWwKLSBBUkNIPXg4Nl82NAotIGtjb25maWc9eDg2XzY0LXJoZWwKLSBicmFuY2g9bGlu
dXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUwOTI4MDkKLSBjb21taXQ9OWZmZWNiMTAyODM1MDgy
NjA5MzZiOTYwMjJkNGVlNDNhNzc5OGI0YwotIEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQt
cmhlbC9nY2MtNC45LzlmZmVjYjEwMjgzNTA4MjYwOTM2Yjk2MDIyZDRlZTQzYTc3OThiNGMvdm1s
aW51ei00LjMuMC1yYzMKLSBtYXhfdXB0aW1lPTI0OTIKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L2Zz
bWFyay8xeC0zMnQtMUhERC14ZnMtbmZzdjQtMTZNQi02MEctZnN5bmNCZWZvcmVDbG9zZS0xNmQt
MjU2ZnBkL2xrcC13czAyL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwv
Z2NjLTQuOS85ZmZlY2IxMDI4MzUwODI2MDkzNmI5NjAyMmQ0ZWU0M2E3Nzk4YjRjLzAKLSBMS1Bf
U0VSVkVSPWlubgotIHwtCiAgaXBtaV93YXRjaGRvZy5zdGFydF9ub3c9MQoKICBlYXJseXByaW50
az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCiAgZGVidWcgYXBpYz1kZWJ1ZyBz
eXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCiAg
cGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmlj
IGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNrPTAKICBjb25zb2xlPXR0eVMwLDExNTIwMCBj
b25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwpsa3BfaW5pdHJkOiAiL2xrcC9sa3AvbGtwLXg4
Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45
LzlmZmVjYjEwMjgzNTA4MjYwOTM2Yjk2MDIyZDRlZTQzYTc3OThiNGMvbW9kdWxlcy5jZ3oiCmJt
X2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9sa3Au
Y2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9ydW4taXBjb25m
aWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei90dXJib3N0
YXQuY2d6LC9sa3AvYmVuY2htYXJrcy90dXJib3N0YXQuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNnei9mcy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6L2ZzMi5jZ3osL2xrcC9iZW5jaG1hcmtzL2ZzbWFyay5jZ3oiCmpvYl9z
dGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogMzMuNTEgMzQuNjUgMjEuOTIgMS8zNTggMjEyMTcKc3Rh
cnRfdGltZTogJzE0NDM0OTM0MDknCmVuZF90aW1lOiAnMTQ0MzQ5NDIwOScKdmVyc2lvbjogIi9s
a3AvbGtwLy5zcmMtMjAxNTA5MjktMDkxMzQxIgo=

--===============7609169472480977795==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

bWtmcyAtdCB4ZnMgL2Rldi9zZGQxCm1vdW50IC10IHhmcyAtbyBub2JhcnJpZXIsaW5vZGU2NCAv
ZGV2L3NkZDEgL2ZzL3NkZDEKL2V0Yy9pbml0LmQvcnBjYmluZCBzdGFydAovZXRjL2luaXQuZC9u
ZnMtY29tbW9uIHN0YXJ0Ci9ldGMvaW5pdC5kL25mcy1rZXJuZWwtc2VydmVyIHN0YXJ0Cm1vdW50
IC10IG5mcyAtbyB2ZXJzPTQgbG9jYWxob3N0Oi9mcy9zZGQxIC9uZnMvc2RkMQouL2ZzX21hcmsg
LWQgL25mcy9zZGQxLzEgLWQgL25mcy9zZGQxLzIgLWQgL25mcy9zZGQxLzMgLWQgL25mcy9zZGQx
LzQgLWQgL25mcy9zZGQxLzUgLWQgL25mcy9zZGQxLzYgLWQgL25mcy9zZGQxLzcgLWQgL25mcy9z
ZGQxLzggLWQgL25mcy9zZGQxLzkgLWQgL25mcy9zZGQxLzEwIC1kIC9uZnMvc2RkMS8xMSAtZCAv
bmZzL3NkZDEvMTIgLWQgL25mcy9zZGQxLzEzIC1kIC9uZnMvc2RkMS8xNCAtZCAvbmZzL3NkZDEv
MTUgLWQgL25mcy9zZGQxLzE2IC1kIC9uZnMvc2RkMS8xNyAtZCAvbmZzL3NkZDEvMTggLWQgL25m
cy9zZGQxLzE5IC1kIC9uZnMvc2RkMS8yMCAtZCAvbmZzL3NkZDEvMjEgLWQgL25mcy9zZGQxLzIy
IC1kIC9uZnMvc2RkMS8yMyAtZCAvbmZzL3NkZDEvMjQgLWQgL25mcy9zZGQxLzI1IC1kIC9uZnMv
c2RkMS8yNiAtZCAvbmZzL3NkZDEvMjcgLWQgL25mcy9zZGQxLzI4IC1kIC9uZnMvc2RkMS8yOSAt
ZCAvbmZzL3NkZDEvMzAgLWQgL25mcy9zZGQxLzMxIC1kIC9uZnMvc2RkMS8zMiAtRCAxNiAtTiAy
NTYgLW4gMTIwIC1MIDEgLVMgMSAtcyAxNjc3NzIxNgo=

--===============7609169472480977795==--

