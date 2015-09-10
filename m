Content-Type: multipart/mixed; boundary="===============2038100966333891927=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [sched/fair] 7ea241afbf: 2.9% ebizzy.throughput.per_thread.min, +218.0% unixbench.score
Date: Thu, 10 Sep 2015 10:08:37 +0800
Message-ID: <871te7c9ga.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2038100966333891927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 7ea241afbf4924c58d41078599f7a32ba49fb985 ("sched/fair: Clean up load=
 average references")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/nr_threads/ite=
rations/duration:
  ivb42/ebizzy/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance=
/200%/100x/10s

commit: =

  139622343ef31941effc6de6a5a9320371a00e62
  7ea241afbf4924c58d41078599f7a32ba49fb985

139622343ef31941 7ea241afbf4924c58d41078599 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    395.70 =C2=B1  0%      +2.9%     407.00 =C2=B1  0%  ebizzy.throughput.p=
er_thread.min
    139775 =C2=B1  2%     +47.2%     205700 =C2=B1  1%  ebizzy.time.volunta=
ry_context_switches
     15966 =C2=B1  7%     -12.5%      13971 =C2=B1  5%  slabinfo.kmalloc-25=
6.active_objs
    299932 =C2=B1  3%      +7.5%     322466 =C2=B1  3%  softirqs.SCHED
    139775 =C2=B1  2%     +47.2%     205700 =C2=B1  1%  time.voluntary_cont=
ext_switches
   1466879 =C2=B1 35%     +65.1%    2421889 =C2=B1 21%  cpuidle.C1E-IVT.time
      1718 =C2=B1 33%    +194.8%       5066 =C2=B1 26%  cpuidle.C1E-IVT.usa=
ge
   6115647 =C2=B1 20%    +106.2%   12609661 =C2=B1 22%  cpuidle.C3-IVT.time
      3897 =C2=B1 23%    +287.7%      15107 =C2=B1 15%  cpuidle.C3-IVT.usage
    120886 =C2=B1  2%     +50.3%     181748 =C2=B1  1%  latency_stats.hits.=
call_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault
  54997679 =C2=B1  3%     +48.2%   81517016 =C2=B1  1%  latency_stats.sum.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault
    547359 =C2=B1  8%     +87.7%    1027569 =C2=B1  5%  latency_stats.sum.c=
all_rwsem_down_write_failed.SyS_mprotect.entry_SYSCALL_64_fastpath
   1640004 =C2=B1  7%    +119.5%    3599195 =C2=B1  6%  latency_stats.sum.c=
all_rwsem_down_write_failed.vm_munmap.SyS_munmap.entry_SYSCALL_64_fastpath
    620798 =C2=B1  1%     +21.1%     751505 =C2=B1  1%  proc-vmstat.numa_hi=
nt_faults_local
    144389 =C2=B1  3%     -35.1%      93722 =C2=B1  2%  proc-vmstat.numa_pa=
ges_migrated
    144389 =C2=B1  3%     -35.1%      93722 =C2=B1  2%  proc-vmstat.pgmigra=
te_success
    923.20 =C2=B1  8%    +105.6%       1898 =C2=B1  4%  proc-vmstat.thp_fau=
lt_alloc
  -1403365 =C2=B1-26%     -88.5%    -161208 =C2=B1-137%  sched_debug.cfs_rq=
[10]:/.spread0
  -1250955 =C2=B1-37%     -92.4%     -94665 =C2=B1-354%  sched_debug.cfs_rq=
[11]:/.spread0
   -565945 =C2=B1-23%    -106.0%      33749 =C2=B1291%  sched_debug.cfs_rq[=
24]:/.spread0
   -788845 =C2=B1-32%     -85.8%    -111818 =C2=B1-297%  sched_debug.cfs_rq=
[25]:/.spread0
   -955073 =C2=B1-35%     -92.7%     -69316 =C2=B1-355%  sched_debug.cfs_rq=
[26]:/.spread0
  -1271910 =C2=B1-19%     -84.9%    -191443 =C2=B1-108%  sched_debug.cfs_rq=
[27]:/.spread0
   -994274 =C2=B1-44%     -98.6%     -13713 =C2=B1-2451%  sched_debug.cfs_r=
q[28]:/.spread0
  -1096179 =C2=B1-36%     -81.3%    -204573 =C2=B1-130%  sched_debug.cfs_rq=
[29]:/.spread0
  -1037623 =C2=B1-37%     -93.9%     -63744 =C2=B1-384%  sched_debug.cfs_rq=
[2]:/.spread0
  -1117584 =C2=B1-23%     -87.8%    -136548 =C2=B1-299%  sched_debug.cfs_rq=
[30]:/.spread0
  -1135662 =C2=B1-36%     -91.6%     -94995 =C2=B1-326%  sched_debug.cfs_rq=
[31]:/.spread0
  -1358698 =C2=B1-29%     -94.1%     -80724 =C2=B1-384%  sched_debug.cfs_rq=
[32]:/.spread0
  -1064343 =C2=B1-31%    -102.8%      30158 =C2=B11565%  sched_debug.cfs_rq=
[33]:/.spread0
  -1334859 =C2=B1-31%     -91.1%    -119317 =C2=B1-155%  sched_debug.cfs_rq=
[34]:/.spread0
  -1165532 =C2=B1-37%     -93.4%     -76739 =C2=B1-477%  sched_debug.cfs_rq=
[35]:/.spread0
  -1334812 =C2=B1-18%     -84.4%    -208008 =C2=B1-88%  sched_debug.cfs_rq[=
3]:/.spread0
  -1105021 =C2=B1-39%     -98.1%     -21519 =C2=B1-1720%  sched_debug.cfs_r=
q[4]:/.spread0
  -1213413 =C2=B1-30%     -79.8%    -245150 =C2=B1-102%  sched_debug.cfs_rq=
[5]:/.spread0
  -1209687 =C2=B1-26%     -84.5%    -187380 =C2=B1-223%  sched_debug.cfs_rq=
[6]:/.spread0
  -1217712 =C2=B1-33%     -90.0%    -121950 =C2=B1-268%  sched_debug.cfs_rq=
[7]:/.spread0
  -1404258 =C2=B1-27%     -90.9%    -127826 =C2=B1-243%  sched_debug.cfs_rq=
[8]:/.spread0
  -1237286 =C2=B1-23%     -96.2%     -47513 =C2=B1-969%  sched_debug.cfs_rq=
[9]:/.spread0
    805288 =C2=B1  3%     -50.8%     395956 =C2=B1 20%  sched_debug.cpu#0.a=
vg_idle
    816964 =C2=B1  4%     -51.3%     397868 =C2=B1 16%  sched_debug.cpu#1.a=
vg_idle
    -74.70 =C2=B1-54%    -140.6%      30.30 =C2=B1156%  sched_debug.cpu#1.n=
r_uninterruptible
    777519 =C2=B1  5%     -49.9%     389238 =C2=B1 13%  sched_debug.cpu#10.=
avg_idle
    783294 =C2=B1  5%     -49.9%     392698 =C2=B1 18%  sched_debug.cpu#11.=
avg_idle
    565267 =C2=B1  9%     -31.8%     385712 =C2=B1 13%  sched_debug.cpu#12.=
avg_idle
    551803 =C2=B1  8%     -33.2%     368517 =C2=B1 14%  sched_debug.cpu#13.=
avg_idle
    590148 =C2=B1  8%     -38.4%     363530 =C2=B1 12%  sched_debug.cpu#14.=
avg_idle
    573886 =C2=B1  6%     -30.2%     400308 =C2=B1 12%  sched_debug.cpu#15.=
avg_idle
    582337 =C2=B1  9%     -38.7%     356889 =C2=B1 14%  sched_debug.cpu#16.=
avg_idle
    604791 =C2=B1  9%     -38.9%     369404 =C2=B1 13%  sched_debug.cpu#17.=
avg_idle
    578703 =C2=B1  8%     -34.8%     377529 =C2=B1 11%  sched_debug.cpu#19.=
avg_idle
    774099 =C2=B1  6%     -53.3%     361276 =C2=B1 14%  sched_debug.cpu#2.a=
vg_idle
    608324 =C2=B1 10%     -38.4%     374662 =C2=B1 11%  sched_debug.cpu#20.=
avg_idle
    588479 =C2=B1  8%     -36.6%     373042 =C2=B1 11%  sched_debug.cpu#21.=
avg_idle
    564123 =C2=B1  9%     -36.4%     358931 =C2=B1 11%  sched_debug.cpu#22.=
avg_idle
    589404 =C2=B1 10%     -37.1%     370768 =C2=B1 16%  sched_debug.cpu#23.=
avg_idle
    878444 =C2=B1  3%     -52.0%     421579 =C2=B1 17%  sched_debug.cpu#24.=
avg_idle
    586.40 =C2=B1 56%    +493.9%       3482 =C2=B1130%  sched_debug.cpu#24.=
sched_goidle
    851203 =C2=B1  4%     -51.9%     409072 =C2=B1 18%  sched_debug.cpu#25.=
avg_idle
    677.60 =C2=B1 52%    +348.2%       3036 =C2=B1 97%  sched_debug.cpu#25.=
sched_goidle
    824295 =C2=B1  5%     -51.4%     400388 =C2=B1 13%  sched_debug.cpu#26.=
avg_idle
    527.70 =C2=B1 24%    +311.9%       2173 =C2=B1 59%  sched_debug.cpu#26.=
sched_goidle
    823033 =C2=B1  5%     -49.2%     417989 =C2=B1 13%  sched_debug.cpu#27.=
avg_idle
    735.70 =C2=B1 21%    +238.6%       2491 =C2=B1 77%  sched_debug.cpu#27.=
sched_goidle
    825555 =C2=B1  4%     -50.1%     411834 =C2=B1 13%  sched_debug.cpu#28.=
avg_idle
    513.50 =C2=B1 21%    +286.4%       1984 =C2=B1 24%  sched_debug.cpu#28.=
sched_goidle
    825524 =C2=B1  4%     -51.5%     400111 =C2=B1 12%  sched_debug.cpu#29.=
avg_idle
    769852 =C2=B1  6%     -49.7%     387088 =C2=B1 14%  sched_debug.cpu#3.a=
vg_idle
    822581 =C2=B1  5%     -52.2%     393485 =C2=B1 10%  sched_debug.cpu#30.=
avg_idle
    533.70 =C2=B1 28%    +202.8%       1616 =C2=B1  8%  sched_debug.cpu#30.=
sched_goidle
    819353 =C2=B1  5%     -50.0%     409589 =C2=B1  8%  sched_debug.cpu#31.=
avg_idle
    837948 =C2=B1  4%     -50.7%     412842 =C2=B1 19%  sched_debug.cpu#32.=
avg_idle
    826642 =C2=B1  4%     -51.9%     397593 =C2=B1 16%  sched_debug.cpu#33.=
avg_idle
    512.50 =C2=B1 25%    +338.5%       2247 =C2=B1 46%  sched_debug.cpu#33.=
sched_goidle
    833929 =C2=B1  4%     -51.4%     405238 =C2=B1 10%  sched_debug.cpu#34.=
avg_idle
    830692 =C2=B1  4%     -50.7%     409409 =C2=B1 17%  sched_debug.cpu#35.=
avg_idle
    711361 =C2=B1  6%     -41.8%     413699 =C2=B1 15%  sched_debug.cpu#36.=
avg_idle
    684821 =C2=B1  6%     -44.1%     382697 =C2=B1 13%  sched_debug.cpu#37.=
avg_idle
    216.60 =C2=B1 17%     -96.6%       7.40 =C2=B1330%  sched_debug.cpu#37.=
nr_uninterruptible
      1188 =C2=B1 14%     +48.6%       1766 =C2=B1 32%  sched_debug.cpu#37.=
sched_goidle
    696736 =C2=B1  7%     -45.5%     379597 =C2=B1 10%  sched_debug.cpu#38.=
avg_idle
    681896 =C2=B1  6%     -42.8%     389861 =C2=B1 12%  sched_debug.cpu#39.=
avg_idle
    768155 =C2=B1  6%     -47.6%     402778 =C2=B1 20%  sched_debug.cpu#4.a=
vg_idle
    696896 =C2=B1  5%     -44.0%     390348 =C2=B1  8%  sched_debug.cpu#40.=
avg_idle
    685253 =C2=B1  9%     -44.6%     379667 =C2=B1 13%  sched_debug.cpu#41.=
avg_idle
      1126 =C2=B1 16%     +56.4%       1760 =C2=B1 30%  sched_debug.cpu#41.=
sched_goidle
    706556 =C2=B1  6%     -41.7%     411902 =C2=B1 24%  sched_debug.cpu#42.=
avg_idle
    135.30 =C2=B1 53%     -98.6%       1.90 =C2=B11768%  sched_debug.cpu#42=
.nr_uninterruptible
    691559 =C2=B1  8%     -43.4%     391276 =C2=B1  8%  sched_debug.cpu#43.=
avg_idle
    686480 =C2=B1  7%     -44.0%     384641 =C2=B1 16%  sched_debug.cpu#44.=
avg_idle
    690032 =C2=B1  8%     -44.8%     380668 =C2=B1 11%  sched_debug.cpu#45.=
avg_idle
    151.20 =C2=B1 44%     -80.0%      30.30 =C2=B1113%  sched_debug.cpu#45.=
nr_uninterruptible
      1079 =C2=B1  9%     +71.6%       1853 =C2=B1 36%  sched_debug.cpu#45.=
sched_goidle
    678938 =C2=B1  8%     -41.6%     396431 =C2=B1 12%  sched_debug.cpu#46.=
avg_idle
      1103 =C2=B1 13%     +55.5%       1716 =C2=B1 21%  sched_debug.cpu#46.=
sched_goidle
    687628 =C2=B1  7%     -45.1%     377761 =C2=B1 11%  sched_debug.cpu#47.=
avg_idle
      1183 =C2=B1 16%     +37.6%       1629 =C2=B1  8%  sched_debug.cpu#47.=
sched_goidle
    756693 =C2=B1  7%     -50.0%     378296 =C2=B1 10%  sched_debug.cpu#5.a=
vg_idle
    765989 =C2=B1  3%     -52.3%     365247 =C2=B1 11%  sched_debug.cpu#6.a=
vg_idle
    773488 =C2=B1  5%     -49.7%     389404 =C2=B1 14%  sched_debug.cpu#7.a=
vg_idle
    777480 =C2=B1  6%     -49.7%     390881 =C2=B1 19%  sched_debug.cpu#8.a=
vg_idle
    765042 =C2=B1  5%     -47.2%     404008 =C2=B1 13%  sched_debug.cpu#9.a=
vg_idle

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/nr_=
threads/disk/fs/filesize/test_size/sync_method/nr_directories/nr_files_per_=
directory:
  lkp-ne04/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performa=
nce/1x/32t/1HDD/f2fs/8K/400M/fsyncBeforeClose/16d/256fpd

commit: =

  139622343ef31941effc6de6a5a9320371a00e62
  7ea241afbf4924c58d41078599f7a32ba49fb985

139622343ef31941 7ea241afbf4924c58d41078599 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     22.60 =C2=B1  2%     -29.6%      15.90 =C2=B1  5%  fsmark.time.percent=
_of_cpu_this_job_got
     24.04 =C2=B1  1%     -29.4%      16.96 =C2=B1  4%  fsmark.time.system_=
time
    498612 =C2=B1  0%      -9.6%     450525 =C2=B1  1%  fsmark.time.volunta=
ry_context_switches
      1226 =C2=B1  4%     +23.8%       1517 =C2=B1 22%  uptime.idle
     47483 =C2=B1  5%     +99.7%      94819 =C2=B1  4%  proc-vmstat.pgalloc=
_dma32
    353432 =C2=B1  0%     -14.1%     303531 =C2=B1  1%  proc-vmstat.pgalloc=
_normal
     19757 =C2=B1  0%     +18.4%      23392 =C2=B1  2%  softirqs.BLOCK
     31479 =C2=B1  0%     -21.8%      24612 =C2=B1  8%  softirqs.SCHED
     12898 =C2=B1  0%      -3.1%      12495 =C2=B1  1%  vmstat.system.cs
      1273 =C2=B1  0%      -7.6%       1177 =C2=B1  2%  vmstat.system.in
    116583 =C2=B1  8%    +105.5%     239619 =C2=B1  4%  numa-numastat.node0=
.local_node
    116584 =C2=B1  8%    +105.5%     239619 =C2=B1  4%  numa-numastat.node0=
.numa_hit
    262990 =C2=B1  3%     -47.7%     137594 =C2=B1  7%  numa-numastat.node1=
.local_node
    262992 =C2=B1  3%     -47.7%     137595 =C2=B1  7%  numa-numastat.node1=
.numa_hit
     20635 =C2=B1  4%     -12.6%      18028 =C2=B1  3%  slabinfo.free_nid.a=
ctive_objs
     20635 =C2=B1  4%     -12.3%      18095 =C2=B1  3%  slabinfo.free_nid.n=
um_objs
      5361 =C2=B1  4%     -14.0%       4609 =C2=B1  5%  slabinfo.kmalloc-19=
2.active_objs
      5408 =C2=B1  5%     -14.1%       4648 =C2=B1  5%  slabinfo.kmalloc-19=
2.num_objs
     22.60 =C2=B1  2%     -29.6%      15.90 =C2=B1  5%  time.percent_of_cpu=
_this_job_got
     24.04 =C2=B1  1%     -29.4%      16.96 =C2=B1  4%  time.system_time
      0.99 =C2=B1  4%     -26.6%       0.73 =C2=B1  6%  time.user_time
    498612 =C2=B1  0%      -9.6%     450525 =C2=B1  1%  time.voluntary_cont=
ext_switches
  59704529 =C2=B1  5%    +100.9%    1.2e+08 =C2=B1  3%  cpuidle.C1-NHM.time
    152224 =C2=B1  6%     +46.9%     223671 =C2=B1  5%  cpuidle.C1-NHM.usage
  16110901 =C2=B1  2%     +58.4%   25517916 =C2=B1  2%  cpuidle.C1E-NHM.time
     15507 =C2=B1  3%    +110.8%      32694 =C2=B1  8%  cpuidle.C1E-NHM.usa=
ge
 6.254e+08 =C2=B1  0%     -17.7%  5.149e+08 =C2=B1  1%  cpuidle.C3-NHM.time
    345895 =C2=B1  1%     -48.2%     179296 =C2=B1 15%  cpuidle.C6-NHM.usage
      1.81 =C2=B1  0%     -24.4%       1.36 =C2=B1  3%  turbostat.%Busy
     37.90 =C2=B1  1%      -8.4%      34.70 =C2=B1  1%  turbostat.Avg_MHz
      2102 =C2=B1  0%     +20.8%       2540 =C2=B1  2%  turbostat.Bzy_MHz
      9.99 =C2=B1  2%     +52.8%      15.26 =C2=B1  2%  turbostat.CPU%c1
     49.12 =C2=B1  1%     -32.4%      33.20 =C2=B1  3%  turbostat.CPU%c3
     39.09 =C2=B1  0%     +28.3%      50.17 =C2=B1  2%  turbostat.CPU%c6
     39.66 =C2=B1  1%     -25.1%      29.71 =C2=B1  3%  turbostat.Pkg%pc3
     39778 =C2=B1  2%     +29.1%      51342 =C2=B1  7%  numa-vmstat.node0.n=
r_active_file
    106178 =C2=B1  1%     +17.8%     125067 =C2=B1  4%  numa-vmstat.node0.n=
r_file_pages
     65547 =C2=B1  0%      +9.2%      71548 =C2=B1  2%  numa-vmstat.node0.n=
r_inactive_file
     10129 =C2=B1  2%     +23.9%      12554 =C2=B1  5%  numa-vmstat.node0.n=
r_slab_reclaimable
    183370 =C2=B1 11%     +37.9%     252900 =C2=B1  7%  numa-vmstat.node0.n=
uma_hit
    122668 =C2=B1 17%     +56.9%     192409 =C2=B1  9%  numa-vmstat.node0.n=
uma_local
     31077 =C2=B1  2%     -31.9%      21177 =C2=B1 16%  numa-vmstat.node1.n=
r_active_file
     92412 =C2=B1  2%     -21.0%      72993 =C2=B1  7%  numa-vmstat.node1.n=
r_file_pages
     59578 =C2=B1  1%     -14.1%      51194 =C2=B1  4%  numa-vmstat.node1.n=
r_inactive_file
      8812 =C2=B1  3%     -29.1%       6248 =C2=B1 11%  numa-vmstat.node1.n=
r_slab_reclaimable
    271760 =C2=B1  7%     -25.9%     201348 =C2=B1  9%  numa-vmstat.node1.n=
uma_hit
    268099 =C2=B1  7%     -26.4%     197434 =C2=B1  9%  numa-vmstat.node1.n=
uma_local
    169923 =C2=B1  3%     +31.0%     222560 =C2=B1  6%  numa-meminfo.node0.=
Active
    159034 =C2=B1  2%     +29.1%     205387 =C2=B1  7%  numa-meminfo.node0.=
Active(file)
    424572 =C2=B1  2%     +17.8%     500299 =C2=B1  4%  numa-meminfo.node0.=
FilePages
    264854 =C2=B1  2%     +10.7%     293083 =C2=B1  3%  numa-meminfo.node0.=
Inactive
    262135 =C2=B1  0%      +9.2%     286207 =C2=B1  2%  numa-meminfo.node0.=
Inactive(file)
    540928 =C2=B1  3%     +18.0%     638125 =C2=B1  4%  numa-meminfo.node0.=
MemUsed
     40502 =C2=B1  2%     +24.0%      50221 =C2=B1  5%  numa-meminfo.node0.=
SReclaimable
    142078 =C2=B1  3%     -32.3%      96195 =C2=B1 15%  numa-meminfo.node1.=
Active
    124264 =C2=B1  2%     -31.8%      84713 =C2=B1 16%  numa-meminfo.node1.=
Active(file)
    369559 =C2=B1  2%     -21.0%     291978 =C2=B1  7%  numa-meminfo.node1.=
FilePages
    244345 =C2=B1  2%     -15.4%     206692 =C2=B1  4%  numa-meminfo.node1.=
Inactive
    238277 =C2=B1  1%     -14.1%     204782 =C2=B1  4%  numa-meminfo.node1.=
Inactive(file)
    495916 =C2=B1  3%     -20.0%     396836 =C2=B1  7%  numa-meminfo.node1.=
MemUsed
     35242 =C2=B1  3%     -29.1%      24993 =C2=B1 11%  numa-meminfo.node1.=
SReclaimable
     14192 =C2=B1  2%     -37.4%       8877 =C2=B1  9%  latency_stats.hits.=
call_rwsem_down_read_failed.is_checkpointed_node.[f2fs].f2fs_sync_file.[f2f=
s].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
     17981 =C2=B1  2%     -41.0%      10612 =C2=B1  9%  latency_stats.hits.=
call_rwsem_down_read_failed.need_inode_block_update.[f2fs].f2fs_sync_file.[=
f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
     17623 =C2=B1  2%     -35.3%      11404 =C2=B1  7%  latency_stats.hits.=
call_rwsem_down_write_failed.set_node_addr.[f2fs].f2fs_write_node_page.[f2f=
s].sync_node_pages.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.Sy=
S_fsync.entry_SYSCALL_64_fastpath
   3983488 =C2=B1  3%     -53.3%    1861229 =C2=B1  4%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_=
page_writeback.[f2fs].wait_on_node_pages_writeback.[f2fs].f2fs_sync_file.[f=
2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
   2332611 =C2=B1  4%     -67.8%     751118 =C2=B1 24%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].f2fs_write_node_page.[f2fs]=
.sync_node_pages.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_=
fsync.entry_SYSCALL_64_fastpath
   5008528 =C2=B1  3%     -43.3%    2842165 =C2=B1  9%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].new_node_page.[f2fs].new_in=
ode_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_crea=
te.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
   4152411 =C2=B1  3%     -55.7%    1838163 =C2=B1 14%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].f2fs_convert_inline_inode.[f2fs].f2fs_write_begin.[f2fs].ge=
neric_perform_write.__generic_file_write_iter.generic_file_write_iter.f2fs_=
file_write_iter.[f2fs].__vfs_write.vfs_write
  15229256 =C2=B1  3%     -47.0%    8078403 =C2=B1  9%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic_fil=
e_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs].__vfs_writ=
e.vfs_write.SyS_write
   1295965 =C2=B1  1%     -46.8%     689847 =C2=B1  9%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].do_write_data_page.[f2fs].f2fs_wri=
te_data_page.[f2fs].__f2fs_writepage.[f2fs].write_cache_pages.f2fs_write_da=
ta_pages.[f2fs].do_writepages.__filemap_fdatawrite_range
   9001985 =C2=B1  3%     -50.4%    4463922 =C2=B1 10%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_wri=
te_begin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_fil=
e_write_iter.f2fs_file_write_iter.[f2fs].__vfs_write
   8696503 =C2=B1  2%     -33.5%    5782368 =C2=B1  6%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].get_new_=
data_page.[f2fs].__f2fs_add_link.[f2fs].f2fs_create.[f2fs].vfs_create.path_=
openat.do_filp_open
    267415 =C2=B1  6%     -42.5%     153787 =C2=B1  9%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].update_inode_page.[f2fs].__f2fs_add_link.[f2fs].f2fs_create=
.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
   7268225 =C2=B1  3%     -54.0%    3340379 =C2=B1 13%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].update_inode_page.[f2fs].f2fs_write_end.[f2fs].generic_perf=
orm_write.__generic_file_write_iter.generic_file_write_iter.f2fs_file_write=
_iter.[f2fs].__vfs_write.vfs_write
    864112 =C2=B1  2%     -48.8%     442013 =C2=B1 10%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].write_data_page.[f2fs].do_w=
rite_data_page.[f2fs].f2fs_write_data_page.[f2fs].__f2fs_writepage.[f2fs].w=
rite_cache_pages.f2fs_write_data_pages.[f2fs].do_writepages.__filemap_fdata=
write_range.filemap_write_and_wait_range.f2fs_sync_file.[f2fs]
   3467511 =C2=B1  2%     -59.4%    1409453 =C2=B1 19%  latency_stats.sum.c=
all_rwsem_down_read_failed.is_checkpointed_node.[f2fs].f2fs_sync_file.[f2fs=
].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
   3379634 =C2=B1  2%     -64.5%    1199808 =C2=B1 22%  latency_stats.sum.c=
all_rwsem_down_read_failed.need_dentry_mark.[f2fs].sync_node_pages.[f2fs].f=
2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fa=
stpath
   4512610 =C2=B1  3%     -69.2%    1387720 =C2=B1 24%  latency_stats.sum.c=
all_rwsem_down_read_failed.need_inode_block_update.[f2fs].f2fs_sync_file.[f=
2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
    857550 =C2=B1  4%     -59.6%     346763 =C2=B1  6%  latency_stats.sum.c=
all_rwsem_down_write_failed.f2fs_submit_merged_bio.[f2fs].sync_node_pages.[=
f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCAL=
L_64_fastpath
   1765616 =C2=B1 11%     -52.1%     846079 =C2=B1 11%  latency_stats.sum.c=
all_rwsem_down_write_failed.f2fs_submit_page_mbio.[f2fs].do_write_page.[f2f=
s].write_node_page.[f2fs].f2fs_write_node_page.[f2fs].sync_node_pages.[f2fs=
].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64=
_fastpath
   7571006 =C2=B1  3%     -48.6%    3890987 =C2=B1 10%  latency_stats.sum.c=
all_rwsem_down_write_failed.get_node_info.[f2fs].new_node_page.[f2fs].new_i=
node_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_cre=
ate.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
   3009442 =C2=B1  3%     -69.0%     934243 =C2=B1 24%  latency_stats.sum.c=
all_rwsem_down_write_failed.set_node_addr.[f2fs].f2fs_write_node_page.[f2fs=
].sync_node_pages.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS=
_fsync.entry_SYSCALL_64_fastpath
   4321993 =C2=B1  3%     -50.6%    2133341 =C2=B1 11%  latency_stats.sum.c=
all_rwsem_down_write_failed.set_node_addr.[f2fs].new_node_page.[f2fs].new_i=
node_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_cre=
ate.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
 1.339e+09 =C2=B1  0%      +8.0%  1.446e+09 =C2=B1  0%  latency_stats.sum.s=
ubmit_bio_wait.blkdev_issue_flush.f2fs_issue_flush.[f2fs].f2fs_sync_file.[f=
2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
      2056 =C2=B1 18%     +83.8%       3781 =C2=B1 26%  sched_debug.cfs_rq[=
0]:/.exec_clock
     42614 =C2=B1  8%     -19.8%      34187 =C2=B1 12%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     41315 =C2=B1 10%     -52.7%      19523 =C2=B1 27%  sched_debug.cfs_rq[=
10]:/.min_vruntime
     20336 =C2=B1 16%     -50.9%       9988 =C2=B1 21%  sched_debug.cfs_rq[=
11]:/.min_vruntime
     40435 =C2=B1  4%     -50.2%      20125 =C2=B1 18%  sched_debug.cfs_rq[=
12]:/.min_vruntime
     -2178 =C2=B1-177%    +548.3%     -14124 =C2=B1-24%  sched_debug.cfs_rq=
[12]:/.spread0
    835.50 =C2=B1 54%     -59.8%     335.85 =C2=B1 34%  sched_debug.cfs_rq[=
13]:/.exec_clock
     40939 =C2=B1  5%     -48.4%      21125 =C2=B1 16%  sched_debug.cfs_rq[=
14]:/.min_vruntime
     -1675 =C2=B1-307%    +683.5%     -13125 =C2=B1-19%  sched_debug.cfs_rq=
[14]:/.spread0
     21833 =C2=B1 23%     -47.2%      11520 =C2=B1 34%  sched_debug.cfs_rq[=
15]:/.min_vruntime
     39175 =C2=B1 15%     -34.0%      25844 =C2=B1 20%  sched_debug.cfs_rq[=
1]:/.min_vruntime
     39915 =C2=B1 10%     -33.4%      26583 =C2=B1 24%  sched_debug.cfs_rq[=
3]:/.min_vruntime
     47827 =C2=B1 11%     -30.8%      33108 =C2=B1 17%  sched_debug.cfs_rq[=
4]:/.min_vruntime
     37583 =C2=B1  6%     -38.2%      23211 =C2=B1 21%  sched_debug.cfs_rq[=
5]:/.min_vruntime
     46823 =C2=B1 10%     -27.8%      33813 =C2=B1 12%  sched_debug.cfs_rq[=
6]:/.min_vruntime
     37934 =C2=B1 14%     -34.6%      24796 =C2=B1 20%  sched_debug.cfs_rq[=
7]:/.min_vruntime
     40049 =C2=B1  7%     -44.9%      22064 =C2=B1 17%  sched_debug.cfs_rq[=
8]:/.min_vruntime
     -2565 =C2=B1-201%    +373.9%     -12157 =C2=B1-37%  sched_debug.cfs_rq=
[8]:/.spread0
     19575 =C2=B1 11%     -48.3%      10114 =C2=B1 36%  sched_debug.cfs_rq[=
9]:/.min_vruntime
     34529 =C2=B1  2%     +48.0%      51087 =C2=B1 18%  sched_debug.cpu#0.n=
r_switches
   -618.00 =C2=B1 -5%     +71.8%      -1061 =C2=B1 -3%  sched_debug.cpu#0.n=
r_uninterruptible
     38396 =C2=B1  6%     +40.9%      54089 =C2=B1 17%  sched_debug.cpu#0.s=
ched_count
     16001 =C2=B1  3%     +41.9%      22701 =C2=B1 21%  sched_debug.cpu#0.s=
ched_goidle
     49940 =C2=B1  1%     +23.4%      61622 =C2=B1  6%  sched_debug.cpu#0.t=
twu_count
      9244 =C2=B1  3%     +67.3%      15466 =C2=B1  6%  sched_debug.cpu#0.t=
twu_local
      9541 =C2=B1 10%     -19.9%       7641 =C2=B1 13%  sched_debug.cpu#1.n=
r_load_updates
   -178.90 =C2=B1-16%     -91.3%     -15.60 =C2=B1-85%  sched_debug.cpu#1.n=
r_uninterruptible
    326.00 =C2=B1  9%     -26.0%     241.30 =C2=B1  9%  sched_debug.cpu#10.=
nr_uninterruptible
      5750 =C2=B1  3%     -24.0%       4372 =C2=B1  6%  sched_debug.cpu#11.=
nr_load_updates
    260.70 =C2=B1 13%     -87.2%      33.40 =C2=B1 34%  sched_debug.cpu#11.=
nr_uninterruptible
      5654 =C2=B1  3%     -23.0%       4355 =C2=B1  8%  sched_debug.cpu#13.=
nr_load_updates
    242.50 =C2=B1 11%     -88.3%      28.40 =C2=B1 60%  sched_debug.cpu#13.=
nr_uninterruptible
    329.00 =C2=B1  9%     -26.1%     243.20 =C2=B1 11%  sched_debug.cpu#14.=
nr_uninterruptible
     26609 =C2=B1 31%     -55.9%      11748 =C2=B1 62%  sched_debug.cpu#15.=
nr_switches
    254.50 =C2=B1 13%     -84.2%      40.10 =C2=B1 45%  sched_debug.cpu#15.=
nr_uninterruptible
     27018 =C2=B1 29%     -56.0%      11875 =C2=B1 63%  sched_debug.cpu#15.=
sched_count
     11885 =C2=B1 34%     -57.5%       5048 =C2=B1 71%  sched_debug.cpu#15.=
sched_goidle
   -189.30 =C2=B1-17%     -77.4%     -42.70 =C2=B1-53%  sched_debug.cpu#2.n=
r_uninterruptible
      2058 =C2=B1  9%     +63.9%       3374 =C2=B1 27%  sched_debug.cpu#2.t=
twu_local
   -183.20 =C2=B1-13%     -88.3%     -21.50 =C2=B1-79%  sched_debug.cpu#3.n=
r_uninterruptible
     13728 =C2=B1 15%     -41.8%       7995 =C2=B1 36%  sched_debug.cpu#3.t=
twu_count
   -262.40 =C2=B1-17%     -82.5%     -45.90 =C2=B1-60%  sched_debug.cpu#4.n=
r_uninterruptible
      8009 =C2=B1  2%     -25.3%       5986 =C2=B1 15%  sched_debug.cpu#5.n=
r_load_updates
   -190.70 =C2=B1-17%     -89.6%     -19.80 =C2=B1-49%  sched_debug.cpu#5.n=
r_uninterruptible
     16503 =C2=B1 29%     -48.6%       8486 =C2=B1 59%  sched_debug.cpu#5.t=
twu_count
   -275.30 =C2=B1-14%     -97.9%      -5.80 =C2=B1-600%  sched_debug.cpu#6.=
nr_uninterruptible
      8320 =C2=B1 13%     -27.0%       6076 =C2=B1 11%  sched_debug.cpu#7.n=
r_load_updates
   -177.30 =C2=B1-20%     -88.3%     -20.70 =C2=B1-71%  sched_debug.cpu#7.n=
r_uninterruptible
      2934 =C2=B1 23%     -39.1%       1786 =C2=B1 31%  sched_debug.cpu#7.t=
twu_local
      6143 =C2=B1  3%     +12.7%       6926 =C2=B1  4%  sched_debug.cpu#8.n=
r_load_updates
     17122 =C2=B1  4%     +59.3%      27268 =C2=B1 11%  sched_debug.cpu#8.n=
r_switches
     89.30 =C2=B1 27%    +328.8%     382.90 =C2=B1  6%  sched_debug.cpu#8.n=
r_uninterruptible
     17144 =C2=B1  4%     +59.5%      27340 =C2=B1 12%  sched_debug.cpu#8.s=
ched_count
      7177 =C2=B1  5%     +55.7%      11172 =C2=B1 13%  sched_debug.cpu#8.s=
ched_goidle
      6429 =C2=B1  7%     +77.3%      11396 =C2=B1 37%  sched_debug.cpu#8.t=
twu_count
      1495 =C2=B1 14%     +75.2%       2619 =C2=B1 40%  sched_debug.cpu#8.t=
twu_local
    268.50 =C2=B1 15%     -88.8%      30.10 =C2=B1 51%  sched_debug.cpu#9.n=
r_uninterruptible

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/test:
  nhm-white/unixbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/execl

commit: =

  139622343ef31941effc6de6a5a9320371a00e62
  7ea241afbf4924c58d41078599f7a32ba49fb985

139622343ef31941 7ea241afbf4924c58d41078599 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      2777 =C2=B1  0%     +84.8%       5133 =C2=B1  0%  unixbench.score
    597160 =C2=B1  3%    +250.0%    2090062 =C2=B1  1%  unixbench.time.invo=
luntary_context_switches
  68574556 =C2=B1  0%     +56.5%  1.073e+08 =C2=B1  0%  unixbench.time.mino=
r_page_faults
    177.50 =C2=B1  0%     +98.5%     352.25 =C2=B1  0%  unixbench.time.perc=
ent_of_cpu_this_job_got
    279.21 =C2=B1  0%    +104.8%     571.76 =C2=B1  0%  unixbench.time.syst=
em_time
     71.68 =C2=B1  0%     +74.9%     125.39 =C2=B1  0%  unixbench.time.user=
_time
     78783 =C2=B1  1%    +563.9%     523002 =C2=B1  0%  unixbench.time.volu=
ntary_context_switches
      1365 =C2=B1  4%     -26.9%     998.34 =C2=B1  2%  uptime.idle
      3526 =C2=B1  3%     -22.2%       2744 =C2=B1  4%  slabinfo.anon_vma.a=
ctive_objs
      3556 =C2=B1  3%     -22.8%       2744 =C2=B1  4%  slabinfo.anon_vma.n=
um_objs
     44543 =C2=B1  4%     +61.8%      72077 =C2=B1  2%  vmstat.system.cs
     21416 =C2=B1  4%     +17.5%      25174 =C2=B1  4%  vmstat.system.in
    107439 =C2=B1  1%    +134.1%     251539 =C2=B1  0%  softirqs.RCU
     92680 =C2=B1  2%    +234.7%     310164 =C2=B1  0%  softirqs.SCHED
    211188 =C2=B1  3%     +78.9%     377818 =C2=B1  0%  softirqs.TIMER
  54857623 =C2=B1  0%     +55.9%   85530499 =C2=B1  0%  proc-vmstat.numa_hit
  54857623 =C2=B1  0%     +55.9%   85530499 =C2=B1  0%  proc-vmstat.numa_lo=
cal
  27623940 =C2=B1  0%     +56.0%   43094142 =C2=B1  0%  proc-vmstat.pgalloc=
_dma32
  27250105 =C2=B1  0%     +55.8%   42446449 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
  68704226 =C2=B1  0%     +56.5%  1.075e+08 =C2=B1  0%  proc-vmstat.pgfault
  54870202 =C2=B1  0%     +55.9%   85536588 =C2=B1  0%  proc-vmstat.pgfree
    597160 =C2=B1  3%    +250.0%    2090062 =C2=B1  1%  time.involuntary_co=
ntext_switches
  68574556 =C2=B1  0%     +56.5%  1.073e+08 =C2=B1  0%  time.minor_page_fau=
lts
    177.50 =C2=B1  0%     +98.5%     352.25 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
    279.21 =C2=B1  0%    +104.8%     571.76 =C2=B1  0%  time.system_time
     71.68 =C2=B1  0%     +74.9%     125.39 =C2=B1  0%  time.user_time
     78783 =C2=B1  1%    +563.9%     523002 =C2=B1  0%  time.voluntary_cont=
ext_switches
     24.72 =C2=B1  0%     +90.6%      47.10 =C2=B1  0%  turbostat.%Busy
    720.50 =C2=B1  0%     +88.8%       1360 =C2=B1  0%  turbostat.Avg_MHz
     22.51 =C2=B1  0%     -21.7%      17.62 =C2=B1  0%  turbostat.CPU%c1
      5.08 =C2=B1  1%    +186.1%      14.52 =C2=B1  2%  turbostat.CPU%c3
     47.70 =C2=B1  0%     -56.5%      20.76 =C2=B1  1%  turbostat.CPU%c6
     53.50 =C2=B1  3%     +17.3%      62.75 =C2=B1  1%  turbostat.CoreTmp
      0.06 =C2=B1 20%    +150.0%       0.15 =C2=B1 12%  turbostat.Pkg%pc3
  43137087 =C2=B1  2%     +66.6%   71866807 =C2=B1  1%  cpuidle.C1-NHM.time
   3516387 =C2=B1  5%     +31.2%    4612342 =C2=B1  4%  cpuidle.C1-NHM.usage
    809442 =C2=B1  2%   +4382.4%   36282417 =C2=B1  1%  cpuidle.C1E-NHM.time
      6910 =C2=B1  2%  +10307.4%     719174 =C2=B1  0%  cpuidle.C1E-NHM.usa=
ge
  68030588 =C2=B1  0%    +195.6%  2.011e+08 =C2=B1  1%  cpuidle.C3-NHM.time
     76199 =C2=B1  1%    +454.8%     422740 =C2=B1  0%  cpuidle.C3-NHM.usage
 1.091e+09 =C2=B1  0%     -50.5%  5.397e+08 =C2=B1  0%  cpuidle.C6-NHM.time
    496983 =C2=B1  0%     -32.1%     337347 =C2=B1  0%  cpuidle.C6-NHM.usage
     26119 =C2=B1  8%    +428.6%     138058 =C2=B1  5%  cpuidle.POLL.time
      3461 =C2=B1  5%    +708.4%      27983 =C2=B1  7%  cpuidle.POLL.usage
    224827 =C2=B1 49%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      3975 =C2=B1  2%    +882.0%      39033 =C2=B1  0%  latency_stats.hits.=
call_rwsem_down_write_failed.unlink_file_vma.free_pgtables.exit_mmap.mmput.=
flush_old_exec.load_elf_binary.search_binary_handler.do_execveat_common.SyS=
_execve.return_from_execve
      1503 =C2=B1  4%   +1188.0%      19365 =C2=B1  1%  latency_stats.hits.=
call_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do_=
munmap.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.entr=
y_SYSCALL_64_fastpath
    816.00 =C2=B1  5%   +1217.0%      10746 =C2=B1  1%  latency_stats.hits.=
call_rwsem_down_write_failed.vma_adjust.__split_vma.do_munmap.mmap_region.d=
o_mmap_pgoff.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.entry_SYSCALL_64_fastpath
      3912 =C2=B1  1%    +889.7%      38717 =C2=B1  1%  latency_stats.hits.=
call_rwsem_down_write_failed.vma_adjust.__split_vma.split_vma.mprotect_fixu=
p.SyS_mprotect.entry_SYSCALL_64_fastpath
      1634 =C2=B1  2%   +1222.3%      21609 =C2=B1  0%  latency_stats.hits.=
call_rwsem_down_write_failed.vma_link.mmap_region.do_mmap_pgoff.vm_mmap_pgo=
ff.SyS_mmap_pgoff.SyS_mmap.entry_SYSCALL_64_fastpath
    814.25 =C2=B1  1%   +1516.2%      13160 =C2=B1  0%  latency_stats.hits.=
call_rwsem_down_write_failed.vma_link.mmap_region.do_mmap_pgoff.vm_mmap_pgo=
ff.vm_mmap.elf_map.load_elf_binary.search_binary_handler.do_execveat_common=
.SyS_execve.return_from_execve
     23567 =C2=B1  2%    +574.2%     158894 =C2=B1  0%  latency_stats.hits.=
wait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.han=
dle_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
     40825 =C2=B1  1%    +388.1%     199274 =C2=B1  0%  latency_stats.hits.=
wait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.han=
dle_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault.clea=
r_user.padzero.load_elf_binary
      6132 =C2=B1 41%     -92.1%     484.00 =C2=B1 20%  latency_stats.max.c=
all_rwsem_down_write_failed.vma_link.mmap_region.do_mmap_pgoff.vm_mmap_pgof=
f.SyS_mmap_pgoff.SyS_mmap.entry_SYSCALL_64_fastpath
    224827 =C2=B1 49%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      4308 =C2=B1 43%    +273.2%      16079 =C2=B1  3%  latency_stats.sum.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do_m=
unmap.vm_munmap.elf_map.load_elf_binary.search_binary_handler.do_execveat_c=
ommon.SyS_execve.return_from_execve
    102172 =C2=B1 10%     +41.9%     144985 =C2=B1  1%  latency_stats.sum.c=
all_rwsem_down_write_failed.vma_adjust.__split_vma.split_vma.mprotect_fixup=
.SyS_mprotect.entry_SYSCALL_64_fastpath
      8447 =C2=B1 28%    +341.5%      37291 =C2=B1  2%  latency_stats.sum.c=
all_rwsem_down_write_failed.vma_link.mmap_region.do_mmap_pgoff.vm_mmap_pgof=
f.vm_mmap.elf_map.load_elf_binary.search_binary_handler.do_execveat_common.=
SyS_execve.return_from_execve
    987847 =C2=B1  2%     -31.9%     672427 =C2=B1  1%  latency_stats.sum.d=
o_wait.SyS_wait4.entry_SYSCALL_64_fastpath
    224827 =C2=B1 49%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
   2012933 =C2=B1  1%     -45.2%    1102741 =C2=B1  2%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
     89887 =C2=B1  2%    +282.0%     343413 =C2=B1  0%  latency_stats.sum.w=
ait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.hand=
le_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
    160304 =C2=B1  1%    +177.6%     444992 =C2=B1  0%  latency_stats.sum.w=
ait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.hand=
le_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault.clear=
_user.padzero.load_elf_binary
     53720 =C2=B1 19%     -73.0%      14481 =C2=B1 13%  latency_stats.sum.w=
alk_component.path_lookupat.filename_lookup.user_path_at_empty.SyS_access.e=
ntry_SYSCALL_64_fastpath
     19815 =C2=B1  0%     +59.6%      31628 =C2=B1  1%  sched_debug.cfs_rq[=
0]:/.exec_clock
    135827 =C2=B1  1%     +77.9%     241641 =C2=B1  1%  sched_debug.cfs_rq[=
0]:/.min_vruntime
    373.50 =C2=B1  4%     +20.6%     450.50 =C2=B1  5%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
     16457 =C2=B1  5%     +75.2%      28829 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.exec_clock
    126071 =C2=B1  6%     +89.2%     238558 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.min_vruntime
    372.50 =C2=B1  3%     +20.8%     450.00 =C2=B1  5%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
     43.50 =C2=B1 14%     +28.7%      56.00 =C2=B1  3%  sched_debug.cfs_rq[=
1]:/.tg_load_avg_contrib
    105.00 =C2=B1 29%    +251.9%     369.50 =C2=B1 22%  sched_debug.cfs_rq[=
1]:/.util_avg
     16547 =C2=B1  4%     +72.2%      28490 =C2=B1  4%  sched_debug.cfs_rq[=
2]:/.exec_clock
     43.50 =C2=B1  4%     +54.6%      67.25 =C2=B1 10%  sched_debug.cfs_rq[=
2]:/.load_avg
    132026 =C2=B1  5%     +78.0%     234955 =C2=B1  3%  sched_debug.cfs_rq[=
2]:/.min_vruntime
     30.00 =C2=B1 30%    +125.8%      67.75 =C2=B1 26%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
    368.75 =C2=B1  2%     +22.6%     452.00 =C2=B1  5%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
     44.25 =C2=B1  7%     +57.6%      69.75 =C2=B1  6%  sched_debug.cfs_rq[=
2]:/.tg_load_avg_contrib
    174.00 =C2=B1 28%    +157.0%     447.25 =C2=B1 13%  sched_debug.cfs_rq[=
2]:/.util_avg
     15909 =C2=B1  6%     +73.0%      27517 =C2=B1  4%  sched_debug.cfs_rq[=
3]:/.exec_clock
    122010 =C2=B1  5%     +88.7%     230244 =C2=B1  4%  sched_debug.cfs_rq[=
3]:/.min_vruntime
     13.00 =C2=B1 18%     -44.2%       7.25 =C2=B1 26%  sched_debug.cfs_rq[=
3]:/.nr_spread_over
     41.75 =C2=B1 20%     +43.7%      60.00 =C2=B1 17%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
    366.00 =C2=B1  2%     +24.0%     453.75 =C2=B1  5%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
    132.00 =C2=B1 14%    +148.7%     328.25 =C2=B1 24%  sched_debug.cfs_rq[=
3]:/.util_avg
     16257 =C2=B1  0%     +57.0%      25519 =C2=B1  1%  sched_debug.cfs_rq[=
4]:/.exec_clock
    103545 =C2=B1  3%    +106.0%     213258 =C2=B1  1%  sched_debug.cfs_rq[=
4]:/.min_vruntime
    366.75 =C2=B1  3%     +23.3%     452.25 =C2=B1  5%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
    140.25 =C2=B1 17%    +168.1%     376.00 =C2=B1 24%  sched_debug.cfs_rq[=
4]:/.util_avg
     15851 =C2=B1  2%     +58.2%      25080 =C2=B1  4%  sched_debug.cfs_rq[=
5]:/.exec_clock
     98491 =C2=B1  1%    +115.4%     212187 =C2=B1  6%  sched_debug.cfs_rq[=
5]:/.min_vruntime
     14.75 =C2=B1143%    +286.4%      57.00 =C2=B1  5%  sched_debug.cfs_rq[=
5]:/.runnable_load_avg
    370.50 =C2=B1  3%     +20.6%     446.75 =C2=B1  4%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
    125.00 =C2=B1 26%    +228.0%     410.00 =C2=B1 15%  sched_debug.cfs_rq[=
5]:/.util_avg
     15689 =C2=B1  4%     +60.7%      25219 =C2=B1  3%  sched_debug.cfs_rq[=
6]:/.exec_clock
     50.75 =C2=B1 11%     +33.5%      67.75 =C2=B1 14%  sched_debug.cfs_rq[=
6]:/.load_avg
     98238 =C2=B1  4%    +116.3%     212530 =C2=B1  4%  sched_debug.cfs_rq[=
6]:/.min_vruntime
     16.75 =C2=B1 78%    +258.2%      60.00 =C2=B1 12%  sched_debug.cfs_rq[=
6]:/.runnable_load_avg
    369.75 =C2=B1  2%     +21.1%     447.75 =C2=B1  3%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
     50.75 =C2=B1 11%     +33.0%      67.50 =C2=B1 14%  sched_debug.cfs_rq[=
6]:/.tg_load_avg_contrib
    158.75 =C2=B1 10%    +201.3%     478.25 =C2=B1  5%  sched_debug.cfs_rq[=
6]:/.util_avg
     15371 =C2=B1  4%     +60.3%      24635 =C2=B1  2%  sched_debug.cfs_rq[=
7]:/.exec_clock
     97547 =C2=B1  4%    +111.0%     205787 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.min_vruntime
      7.00 =C2=B1102%    +685.7%      55.00 =C2=B1 15%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
    370.75 =C2=B1  2%     +21.0%     448.75 =C2=B1  4%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
    875331 =C2=B1  5%     -40.8%     518188 =C2=B1  5%  sched_debug.cpu#0.a=
vg_idle
     21.25 =C2=B1 13%    +158.8%      55.00 =C2=B1 34%  sched_debug.cpu#0.c=
pu_load[0]
     21.50 =C2=B1  9%    +157.0%      55.25 =C2=B1 15%  sched_debug.cpu#0.c=
pu_load[1]
     18.75 =C2=B1 15%    +190.7%      54.50 =C2=B1  6%  sched_debug.cpu#0.c=
pu_load[2]
     14.75 =C2=B1 21%    +272.9%      55.00 =C2=B1  3%  sched_debug.cpu#0.c=
pu_load[3]
     11.25 =C2=B1 25%    +397.8%      56.00 =C2=B1  5%  sched_debug.cpu#0.c=
pu_load[4]
     38804 =C2=B1  5%     +52.5%      59171 =C2=B1  1%  sched_debug.cpu#0.n=
r_load_updates
    100572 =C2=B1 24%    +218.9%     320711 =C2=B1  1%  sched_debug.cpu#0.n=
r_switches
   -666.50 =C2=B1 -5%     -69.5%    -203.50 =C2=B1-17%  sched_debug.cpu#0.n=
r_uninterruptible
    100682 =C2=B1 24%    +218.8%     321019 =C2=B1  1%  sched_debug.cpu#0.s=
ched_count
     39169 =C2=B1 30%    +176.8%     108420 =C2=B1  0%  sched_debug.cpu#0.s=
ched_goidle
     42885 =C2=B1  3%    +213.6%     134495 =C2=B1  6%  sched_debug.cpu#0.t=
twu_count
     20783 =C2=B1 10%    +341.5%      91760 =C2=B1  4%  sched_debug.cpu#0.t=
twu_local
    828164 =C2=B1 12%     -51.7%     400105 =C2=B1  8%  sched_debug.cpu#1.a=
vg_idle
     11.75 =C2=B1 99%    +406.4%      59.50 =C2=B1 20%  sched_debug.cpu#1.c=
pu_load[0]
     13.75 =C2=B1 47%    +280.0%      52.25 =C2=B1 16%  sched_debug.cpu#1.c=
pu_load[1]
     13.50 =C2=B1 40%    +268.5%      49.75 =C2=B1 13%  sched_debug.cpu#1.c=
pu_load[2]
     13.00 =C2=B1 35%    +276.9%      49.00 =C2=B1 13%  sched_debug.cpu#1.c=
pu_load[3]
     12.25 =C2=B1 25%    +312.2%      50.50 =C2=B1 13%  sched_debug.cpu#1.c=
pu_load[4]
     41410 =C2=B1 18%     +42.2%      58885 =C2=B1  5%  sched_debug.cpu#1.n=
r_load_updates
   -713.25 =C2=B1 -2%     -71.7%    -201.75 =C2=B1-13%  sched_debug.cpu#1.n=
r_uninterruptible
    862241 =C2=B1  1%     -50.4%     427474 =C2=B1  7%  sched_debug.cpu#2.a=
vg_idle
     25.25 =C2=B1 47%    +167.3%      67.50 =C2=B1 27%  sched_debug.cpu#2.c=
pu_load[0]
     25.00 =C2=B1 24%    +135.0%      58.75 =C2=B1 24%  sched_debug.cpu#2.c=
pu_load[1]
     21.00 =C2=B1  8%    +165.5%      55.75 =C2=B1 23%  sched_debug.cpu#2.c=
pu_load[2]
     17.75 =C2=B1  8%    +205.6%      54.25 =C2=B1 21%  sched_debug.cpu#2.c=
pu_load[3]
     16.50 =C2=B1 19%    +221.2%      53.00 =C2=B1 17%  sched_debug.cpu#2.c=
pu_load[4]
    765.75 =C2=B1 55%     +91.4%       1465 =C2=B1 21%  sched_debug.cpu#2.c=
urr->pid
     38186 =C2=B1  9%     +54.0%      58807 =C2=B1  8%  sched_debug.cpu#2.n=
r_load_updates
   -718.75 =C2=B1 -3%     -69.4%    -220.00 =C2=B1-24%  sched_debug.cpu#2.n=
r_uninterruptible
    844650 =C2=B1  7%     -50.8%     415306 =C2=B1 14%  sched_debug.cpu#3.a=
vg_idle
     29.75 =C2=B1 30%     +59.7%      47.50 =C2=B1 11%  sched_debug.cpu#3.c=
pu_load[1]
     22.25 =C2=B1 31%    +136.0%      52.50 =C2=B1 12%  sched_debug.cpu#3.c=
pu_load[2]
     18.00 =C2=B1 30%    +194.4%      53.00 =C2=B1 16%  sched_debug.cpu#3.c=
pu_load[3]
     14.50 =C2=B1 25%    +269.0%      53.50 =C2=B1 13%  sched_debug.cpu#3.c=
pu_load[4]
     40826 =C2=B1 15%     +54.2%      62962 =C2=B1  8%  sched_debug.cpu#3.n=
r_load_updates
   -718.50 =C2=B1 -2%     -68.1%    -229.50 =C2=B1 -6%  sched_debug.cpu#3.n=
r_uninterruptible
    960718 =C2=B1  3%     -39.1%     584950 =C2=B1  2%  sched_debug.cpu#4.a=
vg_idle
     29.50 =C2=B1 50%     +89.8%      56.00 =C2=B1  5%  sched_debug.cpu#4.c=
pu_load[0]
     21.00 =C2=B1 34%    +156.0%      53.75 =C2=B1  1%  sched_debug.cpu#4.c=
pu_load[1]
     13.50 =C2=B1 28%    +290.7%      52.75 =C2=B1  1%  sched_debug.cpu#4.c=
pu_load[2]
      9.50 =C2=B1 15%    +439.5%      51.25 =C2=B1  3%  sched_debug.cpu#4.c=
pu_load[3]
      8.75 =C2=B1  9%    +477.1%      50.50 =C2=B1  4%  sched_debug.cpu#4.c=
pu_load[4]
     24965 =C2=B1  2%     +69.1%      42227 =C2=B1  1%  sched_debug.cpu#4.n=
r_load_updates
     47274 =C2=B1 12%    +423.0%     247264 =C2=B1  3%  sched_debug.cpu#4.n=
r_switches
    722.75 =C2=B1  3%     -80.7%     139.25 =C2=B1 27%  sched_debug.cpu#4.n=
r_uninterruptible
     47352 =C2=B1 12%    +422.7%     247523 =C2=B1  3%  sched_debug.cpu#4.s=
ched_count
     15295 =C2=B1 19%    +415.4%      78829 =C2=B1  4%  sched_debug.cpu#4.s=
ched_goidle
     25360 =C2=B1 14%    +313.0%     104737 =C2=B1  5%  sched_debug.cpu#4.t=
twu_count
     11144 =C2=B1  7%    +558.5%      73386 =C2=B1  3%  sched_debug.cpu#4.t=
twu_local
    952020 =C2=B1  7%     -41.9%     553128 =C2=B1 15%  sched_debug.cpu#5.a=
vg_idle
     24.75 =C2=B1 58%    +102.0%      50.00 =C2=B1 28%  sched_debug.cpu#5.c=
pu_load[0]
     22.50 =C2=B1 58%    +122.2%      50.00 =C2=B1 17%  sched_debug.cpu#5.c=
pu_load[1]
     18.75 =C2=B1 53%    +154.7%      47.75 =C2=B1 16%  sched_debug.cpu#5.c=
pu_load[2]
     15.00 =C2=B1 43%    +221.7%      48.25 =C2=B1 13%  sched_debug.cpu#5.c=
pu_load[3]
     12.75 =C2=B1 32%    +302.0%      51.25 =C2=B1 13%  sched_debug.cpu#5.c=
pu_load[4]
    396.33 =C2=B1 81%    +167.8%       1061 =C2=B1 34%  sched_debug.cpu#5.c=
urr->pid
     28469 =C2=B1 21%     +68.0%      47826 =C2=B1 20%  sched_debug.cpu#5.n=
r_load_updates
    700.50 =C2=B1  1%     -66.1%     237.50 =C2=B1 12%  sched_debug.cpu#5.n=
r_uninterruptible
    875687 =C2=B1 11%     -31.1%     603325 =C2=B1  6%  sched_debug.cpu#6.a=
vg_idle
     24.75 =C2=B1 42%    +105.1%      50.75 =C2=B1 11%  sched_debug.cpu#6.c=
pu_load[1]
     18.75 =C2=B1 34%    +166.7%      50.00 =C2=B1  3%  sched_debug.cpu#6.c=
pu_load[2]
     14.75 =C2=B1 23%    +237.3%      49.75 =C2=B1  4%  sched_debug.cpu#6.c=
pu_load[3]
     12.25 =C2=B1 18%    +312.2%      50.50 =C2=B1  5%  sched_debug.cpu#6.c=
pu_load[4]
    690.75 =C2=B1  2%     -66.4%     232.25 =C2=B1 16%  sched_debug.cpu#6.n=
r_uninterruptible
    937693 =C2=B1 11%     -41.7%     547028 =C2=B1 15%  sched_debug.cpu#7.a=
vg_idle
     16.00 =C2=B1 24%    +246.9%      55.50 =C2=B1 14%  sched_debug.cpu#7.c=
pu_load[0]
     16.50 =C2=B1 26%    +231.8%      54.75 =C2=B1 11%  sched_debug.cpu#7.c=
pu_load[1]
     15.00 =C2=B1 24%    +261.7%      54.25 =C2=B1  9%  sched_debug.cpu#7.c=
pu_load[2]
     12.75 =C2=B1 19%    +321.6%      53.75 =C2=B1  8%  sched_debug.cpu#7.c=
pu_load[3]
     10.75 =C2=B1 10%    +400.0%      53.75 =C2=B1  6%  sched_debug.cpu#7.c=
pu_load[4]
    268.25 =C2=B1115%    +424.8%       1407 =C2=B1 11%  sched_debug.cpu#7.c=
urr->pid
    699.50 =C2=B1  4%     -65.3%     242.75 =C2=B1  6%  sched_debug.cpu#7.n=
r_uninterruptible

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  lituya/unixbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/perform=
ance/spawn

commit: =

  139622343ef31941effc6de6a5a9320371a00e62
  7ea241afbf4924c58d41078599f7a32ba49fb985

139622343ef31941 7ea241afbf4924c58d41078599 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      2860 =C2=B1  1%    +218.0%       9098 =C2=B1  0%  unixbench.score
     61296 =C2=B1 35%    +669.0%     471374 =C2=B1  0%  unixbench.time.invo=
luntary_context_switches
 1.069e+08 =C2=B1  0%    +155.7%  2.734e+08 =C2=B1  0%  unixbench.time.mino=
r_page_faults
    178.75 =C2=B1  2%    +270.8%     662.75 =C2=B1  0%  unixbench.time.perc=
ent_of_cpu_this_job_got
    353.52 =C2=B1  1%    +266.3%       1294 =C2=B1  0%  unixbench.time.syst=
em_time
      5.79 =C2=B1  1%    +226.7%      18.93 =C2=B1  0%  unixbench.time.user=
_time
   9029197 =C2=B1  1%    +163.5%   23788571 =C2=B1  0%  unixbench.time.volu=
ntary_context_switches
      3121 =C2=B1  3%     -30.1%       2181 =C2=B1  2%  uptime.idle
     12143 =C2=B1  1%     +66.6%      20232 =C2=B1  1%  meminfo.KernelStack
      3935 =C2=B1  0%     +20.0%       4721 =C2=B1  1%  meminfo.PageTables
     61609 =C2=B1  0%     +11.5%      68720 =C2=B1  0%  meminfo.SUnreclaim
    153064 =C2=B1  0%    +167.8%     409918 =C2=B1  0%  softirqs.RCU
    136085 =C2=B1  1%    +346.1%     607054 =C2=B1  0%  softirqs.SCHED
    239770 =C2=B1  0%    +198.7%     716185 =C2=B1  0%  softirqs.TIMER
      7.00 =C2=B1  0%     +14.3%       8.00 =C2=B1  0%  vmstat.procs.r
    106697 =C2=B1  2%    +108.5%     222434 =C2=B1  0%  vmstat.system.cs
     16835 =C2=B1  1%     +45.7%      24531 =C2=B1  0%  vmstat.system.in
    543.50 =C2=B1  5%  +45718.6%     249024 =C2=B1  3%  latency_stats.hits.=
call_rwsem_down_write_failed.copy_process._do_fork.SyS_clone.entry_SYSCALL_=
64_fastpath
   4541178 =C2=B1  1%    +156.9%   11665972 =C2=B1  0%  latency_stats.hits.=
do_wait.SyS_wait4.entry_SYSCALL_64_fastpath
    691.00 =C2=B1  6%  +1.1e+05%     751793 =C2=B1  5%  latency_stats.sum.c=
all_rwsem_down_write_failed.copy_process._do_fork.SyS_clone.entry_SYSCALL_6=
4_fastpath
 1.362e+09 =C2=B1  0%     -28.8%  9.696e+08 =C2=B1  0%  latency_stats.sum.d=
o_wait.SyS_wait4.entry_SYSCALL_64_fastpath
   1097010 =C2=B1  5%     -26.6%     804970 =C2=B1  1%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
     61296 =C2=B1 35%    +669.0%     471374 =C2=B1  0%  time.involuntary_co=
ntext_switches
 1.069e+08 =C2=B1  0%    +155.7%  2.734e+08 =C2=B1  0%  time.minor_page_fau=
lts
    178.75 =C2=B1  2%    +270.8%     662.75 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
    353.52 =C2=B1  1%    +266.3%       1294 =C2=B1  0%  time.system_time
      5.79 =C2=B1  1%    +226.7%      18.93 =C2=B1  0%  time.user_time
   9029197 =C2=B1  1%    +163.5%   23788571 =C2=B1  0%  time.voluntary_cont=
ext_switches
 2.625e+08 =C2=B1  5%    +251.6%  9.229e+08 =C2=B1  1%  cpuidle.C1-HSW.time
   4126487 =C2=B1  1%    +229.4%   13591854 =C2=B1  0%  cpuidle.C1-HSW.usage
 3.189e+08 =C2=B1  0%     -39.3%  1.934e+08 =C2=B1  6%  cpuidle.C1E-HSW.time
   3960503 =C2=B1  2%     -26.1%    2925407 =C2=B1  1%  cpuidle.C1E-HSW.usa=
ge
 2.278e+08 =C2=B1  4%     -74.7%   57534896 =C2=B1  6%  cpuidle.C3-HSW.time
   1418950 =C2=B1  4%     -87.7%     174589 =C2=B1  7%  cpuidle.C3-HSW.usage
  2.01e+09 =C2=B1  3%     -69.2%  6.181e+08 =C2=B1  2%  cpuidle.C6-HSW.time
   1172252 =C2=B1  3%     -74.3%     301380 =C2=B1  6%  cpuidle.C6-HSW.usage
      6773 =C2=B1  3%     -22.3%       5260 =C2=B1  3%  slabinfo.anon_vma.a=
ctive_objs
      6807 =C2=B1  3%     -22.7%       5260 =C2=B1  3%  slabinfo.anon_vma.n=
um_objs
      2238 =C2=B1  2%     +12.8%       2524 =C2=B1  2%  slabinfo.signal_cac=
he.active_objs
      2319 =C2=B1  2%     +19.4%       2770 =C2=B1  2%  slabinfo.signal_cac=
he.num_objs
    817.25 =C2=B1  0%     +77.5%       1450 =C2=B1  2%  slabinfo.task_struc=
t.active_objs
    279.50 =C2=B1  0%     +88.5%     526.75 =C2=B1  0%  slabinfo.task_struc=
t.active_slabs
    839.50 =C2=B1  0%     +88.4%       1581 =C2=B1  0%  slabinfo.task_struc=
t.num_objs
    279.50 =C2=B1  0%     +88.5%     526.75 =C2=B1  0%  slabinfo.task_struc=
t.num_slabs
    755.75 =C2=B1  0%     +67.1%       1263 =C2=B1  2%  proc-vmstat.nr_kern=
el_stack
    979.25 =C2=B1  0%     +21.0%       1185 =C2=B1  1%  proc-vmstat.nr_page=
_table_pages
     15396 =C2=B1  0%     +11.6%      17180 =C2=B1  0%  proc-vmstat.nr_slab=
_unreclaimable
 1.154e+08 =C2=B1  0%    +153.7%  2.926e+08 =C2=B1  0%  proc-vmstat.numa_hit
 1.154e+08 =C2=B1  0%    +153.7%  2.926e+08 =C2=B1  0%  proc-vmstat.numa_lo=
cal
  18684015 =C2=B1  0%    +152.4%   47155989 =C2=B1  0%  proc-vmstat.pgalloc=
_dma32
 1.171e+08 =C2=B1  0%    +145.1%  2.871e+08 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
 1.066e+08 =C2=B1  0%    +154.9%  2.717e+08 =C2=B1  0%  proc-vmstat.pgfault
 1.358e+08 =C2=B1  0%    +146.1%  3.342e+08 =C2=B1  0%  proc-vmstat.pgfree
     12.64 =C2=B1  2%    +246.0%      43.74 =C2=B1  0%  turbostat.%Busy
    416.50 =C2=B1  2%    +245.9%       1440 =C2=B1  0%  turbostat.Avg_MHz
      2.61 =C2=B1  2%     -80.9%       0.50 =C2=B1  3%  turbostat.CPU%c3
     36.78 =C2=B1  3%     -71.5%      10.48 =C2=B1  1%  turbostat.CPU%c6
     36.75 =C2=B1  3%     +25.9%      46.25 =C2=B1  1%  turbostat.CoreTmp
      0.08 =C2=B1 23%     -66.7%       0.03 =C2=B1 69%  turbostat.Pkg%pc2
      5.77 =C2=B1 35%     -50.0%       2.88 =C2=B1 27%  turbostat.Pkg%pc6
     42.00 =C2=B1  1%     +16.7%      49.00 =C2=B1  0%  turbostat.PkgTmp
     43.04 =C2=B1  1%     +46.5%      63.07 =C2=B1  0%  turbostat.PkgWatt
      0.88 =C2=B1  1%     +84.1%       1.62 =C2=B1  0%  turbostat.RAMWatt
     10808 =C2=B1 15%    +176.5%      29888 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.exec_clock
     23.75 =C2=B1 87%     -91.6%       2.00 =C2=B1117%  sched_debug.cfs_rq[=
0]:/.load_avg
   2906711 =C2=B1 21%     -35.2%    1884311 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.min_vruntime
      0.25 =C2=B1173%  +31000.0%      77.75 =C2=B1133%  sched_debug.cfs_rq[=
0]:/.runnable_load_avg
     23.75 =C2=B1 87%     -91.6%       2.00 =C2=B1117%  sched_debug.cfs_rq[=
0]:/.tg_load_avg_contrib
     71.75 =C2=B1 51%     -69.0%      22.25 =C2=B1140%  sched_debug.cfs_rq[=
0]:/.util_avg
      8159 =C2=B1 12%    +146.5%      20109 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.exec_clock
      5.00 =C2=B1104%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.load_avg
     72414 =C2=B1 23%    +334.4%     314569 =C2=B1 18%  sched_debug.cfs_rq[=
10]:/.min_vruntime
  -2834315 =C2=B1-21%     -44.6%   -1569770 =C2=B1 -7%  sched_debug.cfs_rq[=
10]:/.spread0
      5.00 =C2=B1104%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg_load_avg_contrib
      6.00 =C2=B1 86%     -87.5%       0.75 =C2=B1 57%  sched_debug.cfs_rq[=
10]:/.util_avg
      7813 =C2=B1 29%    +160.2%      20328 =C2=B1  2%  sched_debug.cfs_rq[=
11]:/.exec_clock
    144056 =C2=B1 46%    +204.9%     439226 =C2=B1 60%  sched_debug.cfs_rq[=
11]:/.min_vruntime
  -2762678 =C2=B1-20%     -47.7%   -1445117 =C2=B1-14%  sched_debug.cfs_rq[=
11]:/.spread0
      7289 =C2=B1 26%    +177.3%      20210 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.exec_clock
  -2514451 =C2=B1-14%     -35.8%   -1613921 =C2=B1 -5%  sched_debug.cfs_rq[=
12]:/.spread0
      8403 =C2=B1 28%    +138.5%      20045 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.exec_clock
     68206 =C2=B1 31%    +301.1%     273582 =C2=B1  4%  sched_debug.cfs_rq[=
13]:/.min_vruntime
  -2838530 =C2=B1-22%     -43.3%   -1610764 =C2=B1 -4%  sched_debug.cfs_rq[=
13]:/.spread0
      8619 =C2=B1 30%    +132.4%      20029 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.exec_clock
     11.50 =C2=B1 77%     -87.0%       1.50 =C2=B1137%  sched_debug.cfs_rq[=
14]:/.load_avg
     83933 =C2=B1 49%    +260.3%     302385 =C2=B1 12%  sched_debug.cfs_rq[=
14]:/.min_vruntime
  -2822808 =C2=B1-22%     -44.0%   -1581964 =C2=B1 -6%  sched_debug.cfs_rq[=
14]:/.spread0
     11.50 =C2=B1 77%     -87.0%       1.50 =C2=B1137%  sched_debug.cfs_rq[=
14]:/.tg_load_avg_contrib
     11.50 =C2=B1 70%     -95.7%       0.50 =C2=B1173%  sched_debug.cfs_rq[=
14]:/.util_avg
      8121 =C2=B1 17%    +153.7%      20606 =C2=B1  4%  sched_debug.cfs_rq[=
15]:/.exec_clock
      3.00 =C2=B1 62%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.load_avg
    107660 =C2=B1 73%    +195.1%     317706 =C2=B1 25%  sched_debug.cfs_rq[=
15]:/.min_vruntime
     83.33 =C2=B1141%    +576.5%     563.75 =C2=B1 19%  sched_debug.cfs_rq[=
15]:/.removed_load_avg
     83.33 =C2=B1141%    +576.5%     563.75 =C2=B1 19%  sched_debug.cfs_rq[=
15]:/.removed_util_avg
      0.33 =C2=B1141%   +9800.0%      33.00 =C2=B1 31%  sched_debug.cfs_rq[=
15]:/.runnable_load_avg
  -2799081 =C2=B1-24%     -44.0%   -1566646 =C2=B1 -9%  sched_debug.cfs_rq[=
15]:/.spread0
      3.00 =C2=B1 62%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg_load_avg_contrib
      4.50 =C2=B1 48%     -72.2%       1.25 =C2=B1 87%  sched_debug.cfs_rq[=
15]:/.util_avg
      8774 =C2=B1  9%    +194.9%      25872 =C2=B1  7%  sched_debug.cfs_rq[=
1]:/.exec_clock
     12.00 =C2=B1 -8%    +718.8%      98.25 =C2=B1136%  sched_debug.cfs_rq[=
1]:/.load
      1.00 =C2=B1  0%   +8300.0%      84.00 =C2=B1136%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
      8333 =C2=B1  6%    +205.6%      25464 =C2=B1  7%  sched_debug.cfs_rq[=
2]:/.exec_clock
     10.00 =C2=B1167%    +347.5%      44.75 =C2=B1 60%  sched_debug.cfs_rq[=
2]:/.load
   2512896 =C2=B1  4%     -40.1%    1505666 =C2=B1 20%  sched_debug.cfs_rq[=
2]:/.min_vruntime
      9.50 =C2=B1 18%     -73.7%       2.50 =C2=B1 60%  sched_debug.cfs_rq[=
2]:/.nr_spread_over
      3.00 =C2=B1141%    +791.7%      26.75 =C2=B1 41%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
      8669 =C2=B1 16%    +208.8%      26767 =C2=B1  1%  sched_debug.cfs_rq[=
3]:/.exec_clock
   2870913 =C2=B1 19%     -40.0%    1721928 =C2=B1 11%  sched_debug.cfs_rq[=
3]:/.min_vruntime
     73.50 =C2=B1 69%     -97.6%       1.75 =C2=B1142%  sched_debug.cfs_rq[=
3]:/.util_avg
      8368 =C2=B1 20%    +219.9%      26769 =C2=B1  1%  sched_debug.cfs_rq[=
4]:/.exec_clock
   2765749 =C2=B1 27%     -38.7%    1695670 =C2=B1  9%  sched_debug.cfs_rq[=
4]:/.min_vruntime
    105.00 =C2=B1 79%     -97.9%       2.25 =C2=B1 96%  sched_debug.cfs_rq[=
4]:/.util_avg
      8653 =C2=B1 23%    +196.3%      25644 =C2=B1  9%  sched_debug.cfs_rq[=
5]:/.exec_clock
   2933961 =C2=B1 34%     -52.4%    1396567 =C2=B1 19%  sched_debug.cfs_rq[=
5]:/.min_vruntime
     58.00 =C2=B1 68%     -79.3%      12.00 =C2=B1121%  sched_debug.cfs_rq[=
5]:/.util_avg
      9321 =C2=B1 11%    +172.5%      25398 =C2=B1  6%  sched_debug.cfs_rq[=
6]:/.exec_clock
     15.25 =C2=B1158%    +568.9%     102.00 =C2=B1 98%  sched_debug.cfs_rq[=
6]:/.load
   2973173 =C2=B1 24%     -51.4%    1446280 =C2=B1 14%  sched_debug.cfs_rq[=
6]:/.min_vruntime
      1.50 =C2=B1173%   +5416.7%      82.75 =C2=B1125%  sched_debug.cfs_rq[=
6]:/.runnable_load_avg
      9269 =C2=B1  7%    +189.3%      26813 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.exec_clock
      5.00 =C2=B1 80%    +265.0%      18.25 =C2=B1 18%  sched_debug.cfs_rq[=
7]:/.load
   2658153 =C2=B1  6%     -29.1%    1884549 =C2=B1  7%  sched_debug.cfs_rq[=
7]:/.min_vruntime
      2.50 =C2=B1103%    +500.0%      15.00 =C2=B1 16%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
     82.00 =C2=B1 66%     -86.9%      10.75 =C2=B1119%  sched_debug.cfs_rq[=
7]:/.util_avg
      7970 =C2=B1 11%    +153.1%      20169 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.exec_clock
     57884 =C2=B1 15%    +440.6%     312939 =C2=B1 16%  sched_debug.cfs_rq[=
8]:/.min_vruntime
  -2848841 =C2=B1-22%     -44.8%   -1571391 =C2=B1 -5%  sched_debug.cfs_rq[=
8]:/.spread0
      6321 =C2=B1 29%    +215.4%      19935 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.exec_clock
      4.25 =C2=B1 45%     -92.2%       0.33 =C2=B1141%  sched_debug.cfs_rq[=
9]:/.load_avg
    105874 =C2=B1 70%    +159.0%     274232 =C2=B1  2%  sched_debug.cfs_rq[=
9]:/.min_vruntime
  -2800853 =C2=B1-20%     -42.5%   -1610100 =C2=B1 -5%  sched_debug.cfs_rq[=
9]:/.spread0
      4.25 =C2=B1 45%     -92.2%       0.33 =C2=B1141%  sched_debug.cfs_rq[=
9]:/.tg_load_avg_contrib
    684762 =C2=B1 30%     -47.5%     359545 =C2=B1 25%  sched_debug.cpu#0.a=
vg_idle
      0.50 =C2=B1100%  +16200.0%      81.50 =C2=B1137%  sched_debug.cpu#0.c=
pu_load[0]
      1.25 =C2=B1131%   +4200.0%      53.75 =C2=B1101%  sched_debug.cpu#0.c=
pu_load[1]
      2.25 =C2=B1101%   +1822.2%      43.25 =C2=B1 70%  sched_debug.cpu#0.c=
pu_load[2]
      4.00 =C2=B1106%    +956.2%      42.25 =C2=B1 54%  sched_debug.cpu#0.c=
pu_load[3]
      5.50 =C2=B1100%    +695.5%      43.75 =C2=B1 42%  sched_debug.cpu#0.c=
pu_load[4]
    -22.25 =C2=B1-43%   +1870.8%    -438.50 =C2=B1 -8%  sched_debug.cpu#0.n=
r_uninterruptible
    688905 =C2=B1 18%     -61.7%     263718 =C2=B1 26%  sched_debug.cpu#1.a=
vg_idle
      0.75 =C2=B1173%   +2733.3%      21.25 =C2=B1  3%  sched_debug.cpu#1.c=
pu_load[0]
      0.75 =C2=B1173%   +3266.7%      25.25 =C2=B1 43%  sched_debug.cpu#1.c=
pu_load[1]
      0.75 =C2=B1173%   +3766.7%      29.00 =C2=B1 54%  sched_debug.cpu#1.c=
pu_load[2]
      0.50 =C2=B1173%   +6450.0%      32.75 =C2=B1 39%  sched_debug.cpu#1.c=
pu_load[3]
      0.25 =C2=B1173%  +15200.0%      38.25 =C2=B1 29%  sched_debug.cpu#1.c=
pu_load[4]
    897.00 =C2=B1  0%   +2095.2%      19690 =C2=B1 22%  sched_debug.cpu#1.c=
urr->pid
     12.00 =C2=B1 -8%   +1764.6%     223.75 =C2=B1 55%  sched_debug.cpu#1.l=
oad
     37685 =C2=B1  3%     +52.3%      57377 =C2=B1 17%  sched_debug.cpu#1.n=
r_load_updates
    527300 =C2=B1  9%    +266.7%    1933691 =C2=B1 82%  sched_debug.cpu#1.n=
r_switches
    -23.25 =C2=B1-82%   +1451.6%    -360.75 =C2=B1-10%  sched_debug.cpu#1.n=
r_uninterruptible
    527317 =C2=B1  9%    +266.8%    1933971 =C2=B1 82%  sched_debug.cpu#1.s=
ched_count
    255612 =C2=B1 10%    +240.9%     871328 =C2=B1 91%  sched_debug.cpu#1.s=
ched_goidle
     81533 =C2=B1 19%    +819.0%     749326 =C2=B1111%  sched_debug.cpu#1.t=
twu_count
      4112 =C2=B1 33%  +14469.8%     599218 =C2=B1144%  sched_debug.cpu#1.t=
twu_local
    982806 =C2=B1  1%     -57.9%     413490 =C2=B1 18%  sched_debug.cpu#10.=
avg_idle
      0.25 =C2=B1173%  +17000.0%      42.75 =C2=B1 36%  sched_debug.cpu#10.=
cpu_load[1]
      0.00 =C2=B1  0%      +Inf%      52.00 =C2=B1 30%  sched_debug.cpu#10.=
cpu_load[2]
      0.00 =C2=B1  0%      +Inf%      55.25 =C2=B1 18%  sched_debug.cpu#10.=
cpu_load[3]
      0.00 =C2=B1  0%      +Inf%      56.25 =C2=B1 11%  sched_debug.cpu#10.=
cpu_load[4]
      5741 =C2=B1133%    +405.2%      29004 =C2=B1 24%  sched_debug.cpu#10.=
curr->pid
     17466 =C2=B1  3%     +50.9%      26360 =C2=B1  4%  sched_debug.cpu#10.=
nr_load_updates
    232630 =C2=B1  7%    +169.9%     627781 =C2=B1 20%  sched_debug.cpu#10.=
nr_switches
     15.25 =C2=B1 18%   +2372.1%     377.00 =C2=B1  9%  sched_debug.cpu#10.=
nr_uninterruptible
    232647 =C2=B1  7%    +169.9%     628029 =C2=B1 20%  sched_debug.cpu#10.=
sched_count
     67648 =C2=B1 12%    +261.1%     244266 =C2=B1 26%  sched_debug.cpu#10.=
sched_goidle
    169385 =C2=B1 10%     +45.3%     246194 =C2=B1 26%  sched_debug.cpu#10.=
ttwu_count
      1023 =C2=B1 53%  +13289.1%     137037 =C2=B1 48%  sched_debug.cpu#10.=
ttwu_local
    910969 =C2=B1  7%     -46.0%     492369 =C2=B1 10%  sched_debug.cpu#11.=
avg_idle
      1.50 =C2=B1100%   +6033.3%      92.00 =C2=B1111%  sched_debug.cpu#11.=
cpu_load[0]
      1.00 =C2=B1100%   +7325.0%      74.25 =C2=B1 65%  sched_debug.cpu#11.=
cpu_load[1]
      0.50 =C2=B1100%  +13550.0%      68.25 =C2=B1 39%  sched_debug.cpu#11.=
cpu_load[2]
      0.00 =C2=B1  0%      +Inf%      67.75 =C2=B1 27%  sched_debug.cpu#11.=
cpu_load[3]
      0.00 =C2=B1  0%      +Inf%      68.00 =C2=B1 16%  sched_debug.cpu#11.=
cpu_load[4]
      9930 =C2=B1 60%    +198.8%      29669 =C2=B1 34%  sched_debug.cpu#11.=
curr->pid
     16703 =C2=B1 21%     +58.0%      26386 =C2=B1  5%  sched_debug.cpu#11.=
nr_load_updates
    230368 =C2=B1 27%    +147.5%     570050 =C2=B1  7%  sched_debug.cpu#11.=
nr_switches
     18.50 =C2=B1 28%   +1802.7%     352.00 =C2=B1  7%  sched_debug.cpu#11.=
nr_uninterruptible
    230383 =C2=B1 27%    +147.5%     570304 =C2=B1  7%  sched_debug.cpu#11.=
sched_count
     72828 =C2=B1 23%    +196.9%     216221 =C2=B1 10%  sched_debug.cpu#11.=
sched_goidle
    602.00 =C2=B1 58%  +16215.9%      98222 =C2=B1  0%  sched_debug.cpu#11.=
ttwu_local
    987614 =C2=B1  1%     -51.1%     482482 =C2=B1 18%  sched_debug.cpu#12.=
avg_idle
      2.50 =C2=B1131%    +920.0%      25.50 =C2=B1 29%  sched_debug.cpu#12.=
cpu_load[0]
      2.25 =C2=B1148%   +1077.8%      26.50 =C2=B1 13%  sched_debug.cpu#12.=
cpu_load[1]
      2.00 =C2=B1173%   +1637.5%      34.75 =C2=B1 28%  sched_debug.cpu#12.=
cpu_load[2]
      2.00 =C2=B1173%   +2037.5%      42.75 =C2=B1 29%  sched_debug.cpu#12.=
cpu_load[3]
      2.00 =C2=B1173%   +2312.5%      48.25 =C2=B1 25%  sched_debug.cpu#12.=
cpu_load[4]
      5424 =C2=B1 75%    +524.4%      33866 =C2=B1 21%  sched_debug.cpu#12.=
curr->pid
     16.50 =C2=B1 32%   +2397.0%     412.00 =C2=B1  8%  sched_debug.cpu#12.=
nr_uninterruptible
    932518 =C2=B1 11%     -53.8%     430756 =C2=B1 25%  sched_debug.cpu#13.=
avg_idle
      5.00 =C2=B1-20%    +430.0%      26.50 =C2=B1 32%  sched_debug.cpu#13.=
cpu_load[0]
      3.00 =C2=B1-33%   +1083.3%      35.50 =C2=B1 50%  sched_debug.cpu#13.=
cpu_load[1]
      1.00 =C2=B1-100%   +4450.0%      45.50 =C2=B1 40%  sched_debug.cpu#13=
.cpu_load[2]
      1.00 =C2=B1-100%   +5000.0%      51.00 =C2=B1 26%  sched_debug.cpu#13=
.cpu_load[3]
      0.33 =C2=B1141%  +15425.0%      51.75 =C2=B1 24%  sched_debug.cpu#13.=
cpu_load[4]
      7281 =C2=B1 99%    +488.7%      42863 =C2=B1 19%  sched_debug.cpu#13.=
curr->pid
     17767 =C2=B1 15%     +47.3%      26178 =C2=B1  2%  sched_debug.cpu#13.=
nr_load_updates
    239785 =C2=B1 26%    +151.6%     603223 =C2=B1 16%  sched_debug.cpu#13.=
nr_switches
     17.00 =C2=B1 28%   +2333.8%     413.75 =C2=B1 16%  sched_debug.cpu#13.=
nr_uninterruptible
    239799 =C2=B1 26%    +151.7%     603464 =C2=B1 16%  sched_debug.cpu#13.=
sched_count
     74352 =C2=B1 25%    +213.5%     233129 =C2=B1 21%  sched_debug.cpu#13.=
sched_goidle
      7980 =C2=B1 96%   +1514.8%     128867 =C2=B1 41%  sched_debug.cpu#13.=
ttwu_local
    905514 =C2=B1 16%     -49.9%     453914 =C2=B1 20%  sched_debug.cpu#14.=
avg_idle
      0.00 =C2=B1 -1%      +Inf%      71.25 =C2=B1109%  sched_debug.cpu#14.=
cpu_load[1]
      2289 =C2=B1100%    +605.4%      16150 =C2=B1 60%  sched_debug.cpu#14.=
curr->pid
     18237 =C2=B1 15%     +55.8%      28421 =C2=B1 15%  sched_debug.cpu#14.=
nr_load_updates
    266131 =C2=B1 27%    +209.2%     822794 =C2=B1 57%  sched_debug.cpu#14.=
nr_switches
     19.50 =C2=B1 66%   +1769.2%     364.50 =C2=B1  6%  sched_debug.cpu#14.=
nr_uninterruptible
    266148 =C2=B1 27%    +209.2%     823029 =C2=B1 57%  sched_debug.cpu#14.=
sched_count
     90503 =C2=B1 26%    +276.7%     340951 =C2=B1 68%  sched_debug.cpu#14.=
sched_goidle
    760.25 =C2=B1 28%  +31235.3%     238226 =C2=B1101%  sched_debug.cpu#14.=
ttwu_local
    985776 =C2=B1  1%     -46.1%     530905 =C2=B1  1%  sched_debug.cpu#15.=
avg_idle
     18500 =C2=B1 11%     +41.1%      26107 =C2=B1  3%  sched_debug.cpu#15.=
nr_load_updates
    231923 =C2=B1 19%    +139.4%     555216 =C2=B1  3%  sched_debug.cpu#15.=
nr_switches
     13.00 =C2=B1 49%   +3103.8%     416.50 =C2=B1  4%  sched_debug.cpu#15.=
nr_uninterruptible
    231938 =C2=B1 19%    +139.5%     555458 =C2=B1  3%  sched_debug.cpu#15.=
sched_count
     81257 =C2=B1 19%    +158.3%     209886 =C2=B1  4%  sched_debug.cpu#15.=
sched_goidle
    145943 =C2=B1 21%     +42.4%     207858 =C2=B1  2%  sched_debug.cpu#15.=
ttwu_count
      1637 =C2=B1 73%   +5884.5%      97981 =C2=B1  0%  sched_debug.cpu#15.=
ttwu_local
    556737 =C2=B1 15%     -48.3%     287729 =C2=B1 34%  sched_debug.cpu#2.a=
vg_idle
      0.25 =C2=B1173%  +35900.0%      90.00 =C2=B1113%  sched_debug.cpu#2.c=
pu_load[0]
      0.25 =C2=B1173%  +27100.0%      68.00 =C2=B1 70%  sched_debug.cpu#2.c=
pu_load[1]
      0.25 =C2=B1173%  +18600.0%      46.75 =C2=B1 57%  sched_debug.cpu#2.c=
pu_load[2]
      0.25 =C2=B1173%  +15400.0%      38.75 =C2=B1 36%  sched_debug.cpu#2.c=
pu_load[3]
      0.25 =C2=B1173%  +16000.0%      40.25 =C2=B1 26%  sched_debug.cpu#2.c=
pu_load[4]
      7241 =C2=B1108%    +255.2%      25722 =C2=B1 41%  sched_debug.cpu#2.c=
urr->pid
     10.00 =C2=B1167%    +387.5%      48.75 =C2=B1 49%  sched_debug.cpu#2.l=
oad
     36328 =C2=B1  1%     +46.4%      53193 =C2=B1 22%  sched_debug.cpu#2.n=
r_load_updates
    491179 =C2=B1  2%    +284.9%    1890762 =C2=B1 85%  sched_debug.cpu#2.n=
r_switches
    -18.25 =C2=B1-35%   +1646.6%    -318.75 =C2=B1-18%  sched_debug.cpu#2.n=
r_uninterruptible
    491195 =C2=B1  2%    +285.0%    1891050 =C2=B1 85%  sched_debug.cpu#2.s=
ched_count
    238992 =C2=B1  2%    +255.6%     849917 =C2=B1 94%  sched_debug.cpu#2.s=
ched_goidle
     70908 =C2=B1  5%    +967.6%     757003 =C2=B1110%  sched_debug.cpu#2.t=
twu_count
      3960 =C2=B1 11%  +14961.7%     596555 =C2=B1145%  sched_debug.cpu#2.t=
twu_local
    514303 =C2=B1 17%     -28.7%     366548 =C2=B1  6%  sched_debug.cpu#3.a=
vg_idle
      0.50 =C2=B1100%   +1900.0%      10.00 =C2=B1 52%  sched_debug.cpu#3.c=
pu_load[0]
      0.25 =C2=B1173%  +13700.0%      34.50 =C2=B1 56%  sched_debug.cpu#3.c=
pu_load[1]
      0.25 =C2=B1173%  +21000.0%      52.75 =C2=B1 61%  sched_debug.cpu#3.c=
pu_load[2]
      0.25 =C2=B1173%  +21700.0%      54.50 =C2=B1 48%  sched_debug.cpu#3.c=
pu_load[3]
      0.25 =C2=B1173%  +19400.0%      48.75 =C2=B1 32%  sched_debug.cpu#3.c=
pu_load[4]
     39036 =C2=B1  9%     +22.6%      47867 =C2=B1  3%  sched_debug.cpu#3.n=
r_load_updates
    540531 =C2=B1 18%     +80.4%     975275 =C2=B1  2%  sched_debug.cpu#3.n=
r_switches
    -17.00 =C2=B1-42%   +1761.8%    -316.50 =C2=B1-19%  sched_debug.cpu#3.n=
r_uninterruptible
    540549 =C2=B1 18%     +80.5%     975568 =C2=B1  2%  sched_debug.cpu#3.s=
ched_count
    264596 =C2=B1 18%     +49.5%     395608 =C2=B1  3%  sched_debug.cpu#3.s=
ched_goidle
     73196 =C2=B1 18%    +265.1%     267276 =C2=B1  3%  sched_debug.cpu#3.t=
twu_count
      4329 =C2=B1 33%   +2142.7%      97090 =C2=B1  1%  sched_debug.cpu#3.t=
twu_local
      0.50 =C2=B1100%   +3850.0%      19.75 =C2=B1 10%  sched_debug.cpu#4.c=
pu_load[0]
      0.00 =C2=B1  0%      +Inf%      42.25 =C2=B1 57%  sched_debug.cpu#4.c=
pu_load[1]
      0.25 =C2=B1173%  +19400.0%      48.75 =C2=B1 29%  sched_debug.cpu#4.c=
pu_load[2]
      0.25 =C2=B1173%  +20100.0%      50.50 =C2=B1 13%  sched_debug.cpu#4.c=
pu_load[3]
      0.25 =C2=B1173%  +19300.0%      48.50 =C2=B1 14%  sched_debug.cpu#4.c=
pu_load[4]
     96.25 =C2=B1102%  +46885.2%      45223 =C2=B1 20%  sched_debug.cpu#4.c=
urr->pid
    -19.50 =C2=B1-19%   +2055.1%    -420.25 =C2=B1-12%  sched_debug.cpu#4.n=
r_uninterruptible
      0.00 =C2=B1  0%      +Inf%      24.50 =C2=B1 26%  sched_debug.cpu#5.c=
pu_load[0]
      0.00 =C2=B1  0%      +Inf%      31.25 =C2=B1 42%  sched_debug.cpu#5.c=
pu_load[1]
      0.00 =C2=B1  0%      +Inf%      45.25 =C2=B1 52%  sched_debug.cpu#5.c=
pu_load[2]
      0.00 =C2=B1  0%      +Inf%      48.75 =C2=B1 52%  sched_debug.cpu#5.c=
pu_load[3]
      0.00 =C2=B1  0%      +Inf%      47.00 =C2=B1 49%  sched_debug.cpu#5.c=
pu_load[4]
    -13.00 =C2=B1-62%   +3198.1%    -428.75 =C2=B1-26%  sched_debug.cpu#5.n=
r_uninterruptible
    625680 =C2=B1 17%     -50.0%     312954 =C2=B1 29%  sched_debug.cpu#6.a=
vg_idle
      0.75 =C2=B1173%   +2700.0%      21.00 =C2=B1 43%  sched_debug.cpu#6.c=
pu_load[0]
      0.50 =C2=B1173%   +5150.0%      26.25 =C2=B1 53%  sched_debug.cpu#6.c=
pu_load[1]
      0.25 =C2=B1173%  +12400.0%      31.25 =C2=B1 62%  sched_debug.cpu#6.c=
pu_load[2]
      0.25 =C2=B1173%  +14500.0%      36.50 =C2=B1 53%  sched_debug.cpu#6.c=
pu_load[3]
      0.25 =C2=B1173%  +16200.0%      40.75 =C2=B1 37%  sched_debug.cpu#6.c=
pu_load[4]
      5233 =C2=B1118%    +627.5%      38070 =C2=B1 18%  sched_debug.cpu#6.c=
urr->pid
     40072 =C2=B1  5%     +29.4%      51833 =C2=B1 16%  sched_debug.cpu#6.n=
r_load_updates
    598048 =C2=B1 16%    +180.1%    1674979 =C2=B1 76%  sched_debug.cpu#6.n=
r_switches
    -15.00 =C2=B1-14%   +2550.0%    -397.50 =C2=B1-11%  sched_debug.cpu#6.n=
r_uninterruptible
    598064 =C2=B1 16%    +180.1%    1675255 =C2=B1 76%  sched_debug.cpu#6.s=
ched_count
    293293 =C2=B1 16%    +153.2%     742697 =C2=B1 86%  sched_debug.cpu#6.s=
ched_goidle
     78730 =C2=B1 24%    +733.7%     656394 =C2=B1 99%  sched_debug.cpu#6.t=
twu_count
      4408 =C2=B1 27%  +11122.5%     494717 =C2=B1139%  sched_debug.cpu#6.t=
twu_local
      1.00 =C2=B1100%   +7650.0%      77.50 =C2=B1138%  sched_debug.cpu#7.c=
pu_load[0]
      0.25 =C2=B1173%  +20000.0%      50.25 =C2=B1100%  sched_debug.cpu#7.c=
pu_load[1]
      0.50 =C2=B1100%   +8150.0%      41.25 =C2=B1 55%  sched_debug.cpu#7.c=
pu_load[2]
      1.00 =C2=B1100%   +3550.0%      36.50 =C2=B1 36%  sched_debug.cpu#7.c=
pu_load[3]
      1.00 =C2=B1100%   +3175.0%      32.75 =C2=B1 29%  sched_debug.cpu#7.c=
pu_load[4]
      4726 =C2=B1 95%    +458.6%      26402 =C2=B1 62%  sched_debug.cpu#7.c=
urr->pid
      4.50 =C2=B1 77%   +1661.1%      79.25 =C2=B1135%  sched_debug.cpu#7.l=
oad
     37643 =C2=B1  7%     +25.9%      47381 =C2=B1  1%  sched_debug.cpu#7.n=
r_load_updates
    528594 =C2=B1  7%     +86.1%     983699 =C2=B1  2%  sched_debug.cpu#7.n=
r_switches
    -18.50 =C2=B1-71%   +2395.9%    -461.75 =C2=B1-13%  sched_debug.cpu#7.n=
r_uninterruptible
    528611 =C2=B1  7%     +86.1%     983990 =C2=B1  2%  sched_debug.cpu#7.s=
ched_count
    258262 =C2=B1  7%     +54.1%     398087 =C2=B1  3%  sched_debug.cpu#7.s=
ched_goidle
     85314 =C2=B1 17%    +215.4%     269067 =C2=B1  2%  sched_debug.cpu#7.t=
twu_count
      3050 =C2=B1 11%   +3010.7%      94892 =C2=B1  0%  sched_debug.cpu#7.t=
twu_local
    839878 =C2=B1 12%     -36.1%     536832 =C2=B1  0%  sched_debug.cpu#8.a=
vg_idle
      1.00 =C2=B1141%   +3100.0%      32.00 =C2=B1 11%  sched_debug.cpu#8.c=
pu_load[0]
      0.67 =C2=B1141%   +5487.5%      37.25 =C2=B1 24%  sched_debug.cpu#8.c=
pu_load[1]
      0.33 =C2=B1141%  +15200.0%      51.00 =C2=B1 30%  sched_debug.cpu#8.c=
pu_load[2]
      0.33 =C2=B1141%  +16925.0%      56.75 =C2=B1 18%  sched_debug.cpu#8.c=
pu_load[3]
      0.00 =C2=B1  0%      +Inf%      54.75 =C2=B1  9%  sched_debug.cpu#8.c=
pu_load[4]
      6752 =C2=B1107%    +445.4%      36830 =C2=B1 59%  sched_debug.cpu#8.c=
urr->pid
     18369 =C2=B1 13%     +46.4%      26887 =C2=B1  6%  sched_debug.cpu#8.n=
r_load_updates
     25.25 =C2=B1 35%   +1522.8%     409.75 =C2=B1  4%  sched_debug.cpu#8.n=
r_uninterruptible
    925902 =C2=B1  7%     -55.3%     413447 =C2=B1 30%  sched_debug.cpu#9.a=
vg_idle
      9830 =C2=B1106%    +291.6%      38498 =C2=B1 34%  sched_debug.cpu#9.c=
urr->pid
     16022 =C2=B1 19%     +63.2%      26154 =C2=B1  3%  sched_debug.cpu#9.n=
r_load_updates
    200156 =C2=B1 29%    +208.0%     616466 =C2=B1 19%  sched_debug.cpu#9.n=
r_switches
     15.75 =C2=B1 57%   +2385.7%     391.50 =C2=B1  3%  sched_debug.cpu#9.n=
r_uninterruptible
    200172 =C2=B1 29%    +208.1%     616723 =C2=B1 19%  sched_debug.cpu#9.s=
ched_count
     71186 =C2=B1 27%    +236.3%     239419 =C2=B1 24%  sched_debug.cpu#9.s=
ched_goidle
    126454 =C2=B1 32%     +89.4%     239544 =C2=B1 25%  sched_debug.cpu#9.t=
twu_count
    658.25 =C2=B1 25%  +20542.2%     135877 =C2=B1 48%  sched_debug.cpu#9.t=
twu_local
      0.05 =C2=B1157%   +1202.7%       0.64 =C2=B1151%  sched_debug.rt_rq[2=
]:/.rt_time

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/test:
  nhm-white/unixbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/spawn

commit: =

  139622343ef31941effc6de6a5a9320371a00e62
  7ea241afbf4924c58d41078599f7a32ba49fb985

139622343ef31941 7ea241afbf4924c58d41078599 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      1374 =C2=B1  0%    +200.3%       4128 =C2=B1  0%  unixbench.score
    271201 =C2=B1  6%     +20.2%     326006 =C2=B1  6%  unixbench.time.invo=
luntary_context_switches
  58873699 =C2=B1  0%    +126.9%  1.336e+08 =C2=B1  0%  unixbench.time.mino=
r_page_faults
    141.25 =C2=B1  0%    +131.9%     327.50 =C2=B1 15%  unixbench.time.perc=
ent_of_cpu_this_job_got
    276.64 =C2=B1  0%    +160.2%     719.79 =C2=B1  0%  unixbench.time.syst=
em_time
      4.53 =C2=B1  1%    +147.8%      11.23 =C2=B1  1%  unixbench.time.user=
_time
   5029357 =C2=B1  0%    +127.4%   11436751 =C2=B1  0%  unixbench.time.volu=
ntary_context_switches
      6408 =C2=B1  0%     +18.9%       7621 =C2=B1  9%  meminfo.KernelStack
    109692 =C2=B1  1%    +145.6%     269408 =C2=B1  0%  softirqs.RCU
    100013 =C2=B1  1%    +229.6%     329644 =C2=B1  0%  softirqs.SCHED
    164001 =C2=B1  1%    +142.1%     397035 =C2=B1  1%  softirqs.TIMER
     19.79 =C2=B1  0%    +124.9%      44.51 =C2=B1 15%  turbostat.%Busy
    574.00 =C2=B1  0%    +126.4%       1299 =C2=B1 15%  turbostat.Avg_MHz
     17.39 =C2=B1  0%     -86.7%       2.31 =C2=B1  3%  turbostat.CPU%c3
     52.50 =C2=B1  5%     +23.3%      64.75 =C2=B1  5%  turbostat.CoreTmp
      0.13 =C2=B1  5%    +411.5%       0.67 =C2=B1 98%  turbostat.Pkg%pc3
  72858341 =C2=B1  2%    +256.6%  2.598e+08 =C2=B1  1%  cpuidle.C1-NHM.time
   4164450 =C2=B1  3%     +52.0%    6329592 =C2=B1  6%  cpuidle.C1-NHM.usage
 1.037e+08 =C2=B1  1%     +16.0%  1.203e+08 =C2=B1  1%  cpuidle.C1E-NHM.time
 2.502e+08 =C2=B1  0%     -64.6%   88526888 =C2=B1  4%  cpuidle.C3-NHM.time
   1222733 =C2=B1  1%     -81.5%     226236 =C2=B1  1%  cpuidle.C3-NHM.usage
    305573 =C2=B1  1%     -46.6%     163112 =C2=B1 21%  cpuidle.C6-NHM.usage
      3632 =C2=B1  1%     -22.6%       2811 =C2=B1  4%  slabinfo.anon_vma.a=
ctive_objs
      3678 =C2=B1  1%     -23.5%       2812 =C2=B1  4%  slabinfo.anon_vma.n=
um_objs
    256.00 =C2=B1  0%     +56.2%     400.00 =C2=B1 13%  slabinfo.kmem_cache=
_node.active_objs
    256.00 =C2=B1  0%     +56.2%     400.00 =C2=B1 13%  slabinfo.kmem_cache=
_node.num_objs
    429.00 =C2=B1  0%     +21.0%     519.00 =C2=B1  8%  slabinfo.task_struc=
t.active_objs
    448.50 =C2=B1  0%     +26.3%     566.50 =C2=B1  8%  slabinfo.task_struc=
t.num_objs
    271201 =C2=B1  6%     +20.2%     326006 =C2=B1  6%  time.involuntary_co=
ntext_switches
  58873699 =C2=B1  0%    +126.9%  1.336e+08 =C2=B1  0%  time.minor_page_fau=
lts
    141.25 =C2=B1  0%    +131.9%     327.50 =C2=B1 15%  time.percent_of_cpu=
_this_job_got
    276.64 =C2=B1  0%    +160.2%     719.79 =C2=B1  0%  time.system_time
      4.53 =C2=B1  1%    +147.8%      11.23 =C2=B1  1%  time.user_time
   5029357 =C2=B1  0%    +127.4%   11436751 =C2=B1  0%  time.voluntary_cont=
ext_switches
    404.25 =C2=B1  1%     +18.6%     479.50 =C2=B1  9%  proc-vmstat.nr_kern=
el_stack
  64399670 =C2=B1  0%    +121.1%  1.424e+08 =C2=B1  0%  proc-vmstat.numa_hit
  64399670 =C2=B1  0%    +121.1%  1.424e+08 =C2=B1  0%  proc-vmstat.numa_lo=
cal
  37850172 =C2=B1  0%    +116.8%   82071299 =C2=B1  0%  proc-vmstat.pgalloc=
_dma32
  37071781 =C2=B1  0%    +118.0%   80813788 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
  58883203 =C2=B1  0%    +126.1%  1.331e+08 =C2=B1  0%  proc-vmstat.pgfault
  74915678 =C2=B1  0%    +117.4%  1.629e+08 =C2=B1  0%  proc-vmstat.pgfree
    472.00 =C2=B1173%  +3.5e+06%   16433923 =C2=B1100%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
    397.00 =C2=B1 43%  +5.8e+05%    2304097 =C2=B1127%  latency_stats.avg.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_fdatawait.sync_inodes_sb.sy=
nc_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fastpath
    309.75 =C2=B1  8%  +21620.2%      67278 =C2=B1  5%  latency_stats.hits.=
call_rwsem_down_write_failed.copy_process._do_fork.SyS_clone.entry_SYSCALL_=
64_fastpath
   2519095 =C2=B1  0%    +125.0%    5668481 =C2=B1  0%  latency_stats.hits.=
do_wait.SyS_wait4.entry_SYSCALL_64_fastpath
    472.00 =C2=B1173%  +4.2e+06%   19909910 =C2=B1103%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      1592 =C2=B1 77%  +1.1e+06%   17409287 =C2=B1112%  latency_stats.max.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_fdatawait.sync_inodes_sb.sy=
nc_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fastpath
    911.75 =C2=B1 13%  +15961.7%     146442 =C2=B1  6%  latency_stats.sum.c=
all_rwsem_down_write_failed.copy_process._do_fork.SyS_clone.entry_SYSCALL_6=
4_fastpath
 6.662e+08 =C2=B1  0%     -25.2%  4.982e+08 =C2=B1  0%  latency_stats.sum.d=
o_wait.SyS_wait4.entry_SYSCALL_64_fastpath
    472.00 =C2=B1173%    +7e+06%   32926268 =C2=B1122%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      3552 =C2=B1 47%  +8.7e+05%   30738303 =C2=B1134%  latency_stats.sum.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_fdatawait.sync_inodes_sb.sy=
nc_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fastpath
     19504 =C2=B1  5%     +67.1%      32588 =C2=B1 16%  sched_debug.cfs_rq[=
0]:/.exec_clock
   5908647 =C2=B1  6%     -70.0%    1774297 =C2=B1 33%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     10.50 =C2=B1 30%     +54.8%      16.25 =C2=B1  7%  sched_debug.cfs_rq[=
0]:/.nr_spread_over
     73.50 =C2=B1 29%     -66.0%      25.00 =C2=B1 47%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
    137.25 =C2=B1 28%     -95.3%       6.50 =C2=B1 31%  sched_debug.cfs_rq[=
0]:/.util_avg
     13686 =C2=B1  4%    +121.4%      30299 =C2=B1 13%  sched_debug.cfs_rq[=
1]:/.exec_clock
      6.50 =C2=B1 53%     -96.2%       0.25 =C2=B1173%  sched_debug.cfs_rq[=
1]:/.load_avg
   3806197 =C2=B1 12%     -48.7%    1952484 =C2=B1 11%  sched_debug.cfs_rq[=
1]:/.min_vruntime
  -2102463 =C2=B1-15%    -108.5%     178185 =C2=B1457%  sched_debug.cfs_rq[=
1]:/.spread0
     74.75 =C2=B1 30%     -69.9%      22.50 =C2=B1 56%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
      6.75 =C2=B1 48%     -96.3%       0.25 =C2=B1173%  sched_debug.cfs_rq[=
1]:/.tg_load_avg_contrib
     79.75 =C2=B1 83%     -84.3%      12.50 =C2=B1133%  sched_debug.cfs_rq[=
1]:/.util_avg
     15033 =C2=B1  7%    +109.0%      31425 =C2=B1 15%  sched_debug.cfs_rq[=
2]:/.exec_clock
     24.00 =C2=B1110%    +226.0%      78.25 =C2=B1 68%  sched_debug.cfs_rq[=
2]:/.load
   5365005 =C2=B1  8%     -60.5%    2117425 =C2=B1 10%  sched_debug.cfs_rq[=
2]:/.min_vruntime
     18.00 =C2=B1 16%     -37.5%      11.25 =C2=B1 29%  sched_debug.cfs_rq[=
2]:/.nr_spread_over
      5.50 =C2=B1126%    +800.0%      49.50 =C2=B1 32%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
     76.75 =C2=B1 29%     -70.7%      22.50 =C2=B1 60%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
    151.25 =C2=B1 29%     -84.1%      24.00 =C2=B1 97%  sched_debug.cfs_rq[=
2]:/.util_avg
     17138 =C2=B1  6%     +81.5%      31112 =C2=B1 18%  sched_debug.cfs_rq[=
3]:/.exec_clock
     13.75 =C2=B1 44%     -87.3%       1.75 =C2=B1102%  sched_debug.cfs_rq[=
3]:/.load_avg
   5700138 =C2=B1 13%     -63.6%    2073243 =C2=B1  9%  sched_debug.cfs_rq[=
3]:/.min_vruntime
     13.50 =C2=B1152%    +235.2%      45.25 =C2=B1 29%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
     77.50 =C2=B1 28%     -70.3%      23.00 =C2=B1 58%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
     13.75 =C2=B1 44%     -87.3%       1.75 =C2=B1102%  sched_debug.cfs_rq[=
3]:/.tg_load_avg_contrib
    159.50 =C2=B1 22%     -96.1%       6.25 =C2=B1101%  sched_debug.cfs_rq[=
3]:/.util_avg
     10797 =C2=B1 11%    +122.4%      24009 =C2=B1 19%  sched_debug.cfs_rq[=
4]:/.exec_clock
     62.00 =C2=B1173%    +222.2%     199.75 =C2=B1 52%  sched_debug.cfs_rq[=
4]:/.load
     59.00 =C2=B1168%    +190.7%     171.50 =C2=B1 70%  sched_debug.cfs_rq[=
4]:/.runnable_load_avg
  -5360985 =C2=B1 -8%     -76.8%   -1242465 =C2=B1-44%  sched_debug.cfs_rq[=
4]:/.spread0
     80.50 =C2=B1 25%     -71.1%      23.25 =C2=B1 57%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
     13968 =C2=B1 12%     +69.4%      23667 =C2=B1 17%  sched_debug.cfs_rq[=
5]:/.exec_clock
    319.25 =C2=B1 34%     -79.0%      67.00 =C2=B1 31%  sched_debug.cfs_rq[=
5]:/.load
    176169 =C2=B1 36%    +269.1%     650208 =C2=B1 16%  sched_debug.cfs_rq[=
5]:/.min_vruntime
  -5732646 =C2=B1 -6%     -80.4%   -1124095 =C2=B1-57%  sched_debug.cfs_rq[=
5]:/.spread0
     81.00 =C2=B1 25%     -69.1%      25.00 =C2=B1 49%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
     15472 =C2=B1 14%     +57.9%      24436 =C2=B1 18%  sched_debug.cfs_rq[=
6]:/.exec_clock
     20.25 =C2=B1 56%     -88.9%       2.25 =C2=B1 79%  sched_debug.cfs_rq[=
6]:/.load_avg
  -5381953 =C2=B1 -7%     -78.9%   -1136651 =C2=B1-57%  sched_debug.cfs_rq[=
6]:/.spread0
     82.75 =C2=B1 26%     -62.8%      30.75 =C2=B1 66%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
     20.25 =C2=B1 56%     -88.9%       2.25 =C2=B1 79%  sched_debug.cfs_rq[=
6]:/.tg_load_avg_contrib
     11259 =C2=B1 20%    +113.0%      23985 =C2=B1 20%  sched_debug.cfs_rq[=
7]:/.exec_clock
      7.50 =C2=B1 30%     -66.7%       2.50 =C2=B1 72%  sched_debug.cfs_rq[=
7]:/.load_avg
    357472 =C2=B1 18%     +76.1%     629483 =C2=B1 22%  sched_debug.cfs_rq[=
7]:/.min_vruntime
  -5551422 =C2=B1 -6%     -79.4%   -1144823 =C2=B1-56%  sched_debug.cfs_rq[=
7]:/.spread0
     83.75 =C2=B1 26%     -63.0%      31.00 =C2=B1 59%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
      7.50 =C2=B1 30%     -63.3%       2.75 =C2=B1 69%  sched_debug.cfs_rq[=
7]:/.tg_load_avg_contrib
      1.75 =C2=B1 47%   +2085.7%      38.25 =C2=B1 39%  sched_debug.cpu#0.c=
pu_load[1]
      1.50 =C2=B1 33%   +2900.0%      45.00 =C2=B1 37%  sched_debug.cpu#0.c=
pu_load[2]
      1.50 =C2=B1 33%   +3516.7%      54.25 =C2=B1 37%  sched_debug.cpu#0.c=
pu_load[3]
      0.75 =C2=B1110%   +7800.0%      59.25 =C2=B1 39%  sched_debug.cpu#0.c=
pu_load[4]
    694790 =C2=B1  8%    +171.5%    1886697 =C2=B1 85%  sched_debug.cpu#0.n=
r_switches
    -17.00 =C2=B1-24%     -88.2%      -2.00 =C2=B1-348%  sched_debug.cpu#0.=
nr_uninterruptible
    694858 =C2=B1  8%    +171.5%    1886801 =C2=B1 85%  sched_debug.cpu#0.s=
ched_count
     81331 =C2=B1 11%    +842.8%     766757 =C2=B1111%  sched_debug.cpu#0.t=
twu_count
      6127 =C2=B1  2%   +9956.2%     616216 =C2=B1142%  sched_debug.cpu#0.t=
twu_local
      1.25 =C2=B1173%   +3700.0%      47.50 =C2=B1 31%  sched_debug.cpu#1.c=
pu_load[0]
      1.00 =C2=B1173%   +5825.0%      59.25 =C2=B1 37%  sched_debug.cpu#1.c=
pu_load[1]
      0.50 =C2=B1173%  +15550.0%      78.25 =C2=B1 50%  sched_debug.cpu#1.c=
pu_load[2]
      0.25 =C2=B1173%  +31600.0%      79.25 =C2=B1 47%  sched_debug.cpu#1.c=
pu_load[3]
      0.00 =C2=B1  0%      +Inf%      72.25 =C2=B1 37%  sched_debug.cpu#1.c=
pu_load[4]
      1.00 =C2=B1 81%   +4725.0%      48.25 =C2=B1 48%  sched_debug.cpu#2.c=
pu_load[0]
      1.00 =C2=B1122%   +7075.0%      71.75 =C2=B1 66%  sched_debug.cpu#2.c=
pu_load[1]
      1.00 =C2=B1122%   +7200.0%      73.00 =C2=B1 64%  sched_debug.cpu#2.c=
pu_load[2]
      1.00 =C2=B1122%   +6700.0%      68.00 =C2=B1 55%  sched_debug.cpu#2.c=
pu_load[3]
      0.75 =C2=B1110%   +8333.3%      63.25 =C2=B1 44%  sched_debug.cpu#2.c=
pu_load[4]
    639284 =C2=B1  7%     +47.2%     940710 =C2=B1 11%  sched_debug.cpu#2.n=
r_switches
    -17.00 =C2=B1-55%    -142.6%       7.25 =C2=B1 82%  sched_debug.cpu#2.n=
r_uninterruptible
    639320 =C2=B1  7%     +47.2%     940777 =C2=B1 11%  sched_debug.cpu#2.s=
ched_count
    316312 =C2=B1  7%     +18.9%     376081 =C2=B1  9%  sched_debug.cpu#2.s=
ched_goidle
     67699 =C2=B1  8%    +294.1%     266835 =C2=B1 12%  sched_debug.cpu#2.t=
twu_count
      5145 =C2=B1 13%   +2007.3%     108427 =C2=B1 21%  sched_debug.cpu#2.t=
twu_local
      1.50 =C2=B1 74%   +2666.7%      41.50 =C2=B1 72%  sched_debug.cpu#3.c=
pu_load[1]
      1.25 =C2=B1 87%   +3720.0%      47.75 =C2=B1 61%  sched_debug.cpu#3.c=
pu_load[2]
      1.00 =C2=B1 70%   +4800.0%      49.00 =C2=B1 49%  sched_debug.cpu#3.c=
pu_load[3]
      1.00 =C2=B1 70%   +4825.0%      49.25 =C2=B1 40%  sched_debug.cpu#3.c=
pu_load[4]
     49730 =C2=B1  4%     +23.9%      61601 =C2=B1  7%  sched_debug.cpu#3.n=
r_load_updates
    690552 =C2=B1  8%    +103.1%    1402384 =C2=B1 48%  sched_debug.cpu#3.n=
r_switches
    -14.25 =C2=B1-22%    -100.0%       0.00 =C2=B1 10%  sched_debug.cpu#3.n=
r_uninterruptible
    690583 =C2=B1  8%    +103.1%    1402456 =C2=B1 48%  sched_debug.cpu#3.s=
ched_count
    342296 =C2=B1  8%     +72.4%     590017 =C2=B1 56%  sched_debug.cpu#3.s=
ched_goidle
     92922 =C2=B1  8%    +452.5%     513410 =C2=B1 74%  sched_debug.cpu#3.t=
twu_count
      4391 =C2=B1  8%   +7913.1%     351853 =C2=B1112%  sched_debug.cpu#3.t=
twu_local
    936024 =C2=B1  5%     -44.0%     524020 =C2=B1 41%  sched_debug.cpu#4.a=
vg_idle
      0.50 =C2=B1100%  +21500.0%     108.00 =C2=B1108%  sched_debug.cpu#4.c=
pu_load[0]
      0.50 =C2=B1100%  +16450.0%      82.75 =C2=B1 90%  sched_debug.cpu#4.c=
pu_load[1]
      1.00 =C2=B1 70%   +7175.0%      72.75 =C2=B1 66%  sched_debug.cpu#4.c=
pu_load[2]
      1.25 =C2=B1 87%   +5420.0%      69.00 =C2=B1 47%  sched_debug.cpu#4.c=
pu_load[3]
      1.25 =C2=B1 87%   +5220.0%      66.50 =C2=B1 34%  sched_debug.cpu#4.c=
pu_load[4]
      1064 =C2=B1173%    +528.6%       6693 =C2=B1 76%  sched_debug.cpu#4.c=
urr->pid
    330965 =C2=B1  7%     +87.0%     618850 =C2=B1 22%  sched_debug.cpu#4.n=
r_switches
    330992 =C2=B1  7%     +87.0%     618907 =C2=B1 22%  sched_debug.cpu#4.s=
ched_count
      6158 =C2=B1 11%   +2116.7%     136520 =C2=B1 45%  sched_debug.cpu#4.t=
twu_local
      2.25 =C2=B1 65%   +1533.3%      36.75 =C2=B1 61%  sched_debug.cpu#5.c=
pu_load[1]
      1.00 =C2=B1 70%   +4400.0%      45.00 =C2=B1 44%  sched_debug.cpu#5.c=
pu_load[2]
      0.75 =C2=B1 57%   +6833.3%      52.00 =C2=B1 36%  sched_debug.cpu#5.c=
pu_load[3]
      1.25 =C2=B1 34%   +4420.0%      56.50 =C2=B1 34%  sched_debug.cpu#5.c=
pu_load[4]
    319.25 =C2=B1 34%     -79.0%      67.00 =C2=B1 31%  sched_debug.cpu#5.l=
oad
     15.75 =C2=B1 36%     -61.9%       6.00 =C2=B1 88%  sched_debug.cpu#5.n=
r_uninterruptible
    972753 =C2=B1  4%     -43.0%     554163 =C2=B1 20%  sched_debug.cpu#6.a=
vg_idle
      8.00 =C2=B1 25%    +387.5%      39.00 =C2=B1 28%  sched_debug.cpu#6.c=
pu_load[0]
      4.00 =C2=B1 25%   +1350.0%      58.00 =C2=B1 43%  sched_debug.cpu#6.c=
pu_load[1]
      2.50 =C2=B1 20%   +2590.0%      67.25 =C2=B1 42%  sched_debug.cpu#6.c=
pu_load[2]
      1.00 =C2=B1  0%   +6550.0%      66.50 =C2=B1 39%  sched_debug.cpu#6.c=
pu_load[3]
      0.50 =C2=B1100%  +12550.0%      63.25 =C2=B1 35%  sched_debug.cpu#6.c=
pu_load[4]
    401930 =C2=B1 13%     +48.7%     597781 =C2=B1 16%  sched_debug.cpu#6.n=
r_switches
     28.75 =C2=B1 13%     -89.6%       3.00 =C2=B1418%  sched_debug.cpu#6.n=
r_uninterruptible
    401955 =C2=B1 13%     +48.7%     597858 =C2=B1 16%  sched_debug.cpu#6.s=
ched_count
    130918 =C2=B1 18%     +59.3%     208552 =C2=B1 14%  sched_debug.cpu#6.s=
ched_goidle
      3553 =C2=B1 20%   +2897.2%     106490 =C2=B1 22%  sched_debug.cpu#6.t=
twu_local
    860564 =C2=B1 10%     -40.1%     515607 =C2=B1 21%  sched_debug.cpu#7.a=
vg_idle
      0.25 =C2=B1173%  +15100.0%      38.00 =C2=B1 54%  sched_debug.cpu#7.c=
pu_load[0]
      0.25 =C2=B1173%  +16400.0%      41.25 =C2=B1 54%  sched_debug.cpu#7.c=
pu_load[1]
      0.25 =C2=B1173%  +18600.0%      46.75 =C2=B1 55%  sched_debug.cpu#7.c=
pu_load[2]
      0.25 =C2=B1173%  +20100.0%      50.50 =C2=B1 52%  sched_debug.cpu#7.c=
pu_load[3]
      0.25 =C2=B1173%  +21000.0%      52.75 =C2=B1 42%  sched_debug.cpu#7.c=
pu_load[4]
    606.50 =C2=B1173%    +641.6%       4498 =C2=B1 92%  sched_debug.cpu#7.c=
urr->pid
     62.25 =C2=B1173%    +290.8%     243.25 =C2=B1 88%  sched_debug.cpu#7.l=
oad
     26365 =C2=B1  7%     +60.8%      42384 =C2=B1  8%  sched_debug.cpu#7.n=
r_load_updates
    328555 =C2=B1 16%    +356.1%    1498555 =C2=B1 97%  sched_debug.cpu#7.n=
r_switches
    328584 =C2=B1 16%    +356.1%    1498636 =C2=B1 97%  sched_debug.cpu#7.s=
ched_count
    135194 =C2=B1  9%    +364.7%     628213 =C2=B1111%  sched_debug.cpu#7.s=
ched_goidle
    181468 =C2=B1 23%    +272.0%     675037 =C2=B1111%  sched_debug.cpu#7.t=
twu_count
      3906 =C2=B1 23%  +14334.8%     563894 =C2=B1136%  sched_debug.cpu#7.t=
twu_local
     30.01 =C2=B1 46%     -91.6%       2.51 =C2=B1121%  sched_debug.rt_rq[5=
]:/.rt_time


ivb42: Ivytown Ivy Bridge-EP
Memory: 64G

lkp-ne04: Nehalem-EP
Memory: 12G

nhm-white: Nehalem
Memory: 6G

lituya: Grantley Haswell
Memory: 16G






    4e+06 ++-----*---------*-----------------------------------------------=
-+
          *** *.* * * * .* :*** *   * *                                    =
 |
  3.5e+06 ++: :    * * *  *    ::*.* * :***                                =
 |
    3e+06 ++: :                *       *   + ***  * .* * * *               =
 |
          | : :                             *   ** *  * * *                =
 |
  2.5e+06 ++: :                                                            =
 |
          | : :                                                            =
 |
    2e+06 ++: :                                                            =
 |
          |OOO   O                                                         =
 |
  1.5e+06 O+ :O   O O                  OO                O      OO       O =
 |
    1e+06 ++ :  O  O  O  OO OO               OO   OO           O      O    =
 O
          |  :         O       O O O  O     O  O O   O  O  OOO    OOOO  O O=
 |
   500000 ++ :       O     O  O O   OO   OO     O     OO  O                =
O|
          |  :                                                             =
 |
        0 ++-*-------------------------------------------------------------=
-+


                                last_state.booting

    1 ++-------------------------------------------------------------------=
-*
      |                                                                   .=
.|
      |                                                                 .. =
 |
  0.8 ++                                                               .   =
 |
      |                                                              ..    =
 |
      |                                                            ..      =
 |
  0.6 ++                                                          .        =
 |
      |                                                         ..         =
 |
  0.4 ++                                                       .           =
 |
      |                                                      ..            =
 |
      |                                                    ..              =
 |
  0.2 ++                                                  .                =
 |
      |                                                 ..                 =
 |
      |                                               ..                   =
 |
    0 *+---------------------*-----------------------*---------------------=
-+


                           last_state.is_incomplete_run

    1 ++-------------------------------------------------------------------=
-*
      |                                                                   .=
.|
      |                                                                 .. =
 |
  0.8 ++                                                               .   =
 |
      |                                                              ..    =
 |
      |                                                            ..      =
 |
  0.6 ++                                                          .        =
 |
      |                                                         ..         =
 |
  0.4 ++                                                       .           =
 |
      |                                                      ..            =
 |
      |                                                    ..              =
 |
  0.2 ++                                                  .                =
 |
      |                                                 ..                 =
 |
      |                                               ..                   =
 |
    0 *+---------------------*-----------------------*---------------------=
-+




  1.8e+07 ++---------------------------------------------------------------=
-+
          * * *. *   **    *     *.**                                      =
 |
  1.6e+07 +*: : * ***  *.** *****    ******.**** ** .* *** *               =
 |
  1.4e+07 ++: :                                 *  *  *   *                =
 |
          | : :                                                            =
 |
  1.2e+07 ++: :                                                            =
 |
    1e+07 ++: :                        OO                O     O O         =
 |
          OOOOO  OO O O  OO OO               OO   OO            O   O O  O =
 O
    8e+06 ++ :  O  O O O      OO O OOOO  OO O  OOO   OOOO OOOO    OO O  O O=
O|
    6e+06 ++ :             O    O                                          =
 |
          |  :                                                             =
 |
    4e+06 ++ :                                                             =
 |
    2e+06 ++ :                                                             =
 |
          |  :                                                             =
 |
        0 ++-*-------------------------------------------------------------=
-+




  9e+06 ++-----------------------------------------------------------------=
-+
        ***  ****  .***  **.**  **.* *  *                                  =
 |
  8e+06 ++:  :   **    **     **    * ** *. ***  *. * * *.                 =
 |
  7e+06 ++:  :                             *   **  * * *  **               =
 |
        | :  :                                                             =
 |
  6e+06 ++: :                                                              =
 |
  5e+06 ++: :                                                              =
 |
        | : :               O         OO                O       O          =
 |
  4e+06 ++ ::        O OO O                 OO   O O          OO      O  O =
 O
  3e+06 OOOO:O OO O O O      OO OO OOO  O  O  O O   O OO  OOOO    OOOO    O=
 |
        |  :: O  O       O     O         O     O     O                 O   =
O|
  2e+06 ++ :                                                               =
 |
  1e+06 ++ :                                                               =
 |
        |  :                                                               =
 |
      0 ++-*---------------------------------------------------------------=
-+




  6e+06 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  5e+06 ++     *         *                                                 =
 |
        ***  ** ***.***** *.** ***.*** ***   *                             =
 |
        | :  :                *       *   + * *  *. * ***. *               =
 |
  4e+06 ++:  :                             *   **  * *    *                =
 |
        | : :                                                              =
 |
  3e+06 ++: :                                                              =
 |
        | : :               O         OO                O       O          =
 |
  2e+06 ++ ::        O OO O                 OO   O O          OO    O O  O =
 O
        OOOO:  OO O O O  O   OOOOO OOO  OO O  OOO   OOOO  OOOO    OO O O  O=
O|
        |  ::OO  O                                                         =
 |
  1e+06 ++ :                                                               =
 |
        |  :                                                               =
 |
      0 ++-*---------------------------------------------------------------=
-+




  6e+06 ++-----------------------------------------------------------------=
-+
        |           *                                                      =
 |
  5e+06 *+*  *     + : **  .*   **.**                                      =
 |
        |*:  :*****  **  **  ***     *****                                 =
 |
        | :  :                            +  **     *  **.                 =
 |
  4e+06 ++:  :                             **  :**.* **   **               =
 |
        | : :                                  *                           =
 |
  3e+06 ++: :                                                              =
 |
        O O::O          O                                       O          =
 |
  2e+06 +O O: OOOOO  OOO  O O O       OO                O O   OO     O     =
 O
        |  ::       O    O   O OOO OOO  OO OOOOOOO OOOOO   OOO    OOO OO OO=
O|
        |  ::                                                              =
 |
  1e+06 ++ :                                                               =
 |
        |  :                                                               =
 |
      0 ++-*---------------------------------------------------------------=
-+




  3.5e+06 ++---------------------------------------------------------------=
-+
          |                *                                               =
 |
    3e+06 *** *.******* .* :*** **.***   *                                 =
 |
          | : :        *  *    *      *** *                                =
 |
  2.5e+06 ++: :                            + ***    .*   *                 =
 |
          | : :                             *   ****  *** **               =
 |
    2e+06 ++: :                                                            =
 |
          | : :                                                            =
 |
  1.5e+06 ++ ::                                                            =
 |
          OOOO   OO O                  O                 O                 =
 |
    1e+06 ++ :O O  O  O  OO OO          O    OO   OO           OOO    O  O =
 O
          |  :         O       O O O  O     O  O O   O  O  OOO     OOO     =
 |
   500000 ++ :       O     O  O O   OO   OO     O     OO  O       O     O O=
O|
          |  :                                                             =
 |
        0 ++-*-------------------------------------------------------------=
-+




  1.2e+06 ++--*------*-----------------------------------------------------=
-+
          * * :+ *   ::*.*****  **.* **  *                                 =
 |
    1e+06 +*: : * *** *       * :   *  ** *.                               =
 |
          | : :                *            ***           *                =
 |
          | : :                                * *  .***** *               =
 |
   800000 ++: :                                 * **                       =
 |
          | : :                                                            =
 |
   600000 ++: :                                                            =
 |
          | O:O  O                                               O         =
 |
   400000 OO O  O OOO O  OO  O O       OO                OO    OO          =
 |
          |  :       O O   OO O OO OOOO  OO OOOOOOOO OOOO  OOO    OOOOO OOO=
OO
          |  :                                                             =
 |
   200000 ++ :                                                             =
 |
          |  :                                                             =
 |
        0 ++-*-------------------------------------------------------------=
-+


                                  cpuidle.C1-NHM.time

  1.8e+08 ++---------------------------------------------------------------=
-+
          |        O                                                       =
 |
  1.6e+08 OOOOO OOO O                                                      =
 |
  1.4e+08 ++                                                               =
 |
          |          O    OOO OOOO OOOO   O OO  OOO   OOO   OO          O O=
O|
  1.2e+08 ++          OO O   O         OOO    OO   O O   OOO   OOOOOOOO  O =
 O
    1e+08 ++                                                               =
 |
          |                                                                =
 |
    8e+07 ++                                                               =
 |
    6e+07 ++                                *   ****.***  **               =
 |
          |                                + ***        **                 =
 |
    4e+07 +*       **     *   **       * **                                =
 |
    2e+07 *+* *.***  ***.* ***  **.**** *                                  =
 |
          |  ::                                                            =
 |
        0 ++-*-------------------------------------------------------------=
-+


                                 cpuidle.C1E-NHM.time

  3.5e+07 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    3e+07 OO  O OO OO                                                      =
 |
          | OO    O  O   O           O                  OO     O           =
 O
  2.5e+07 ++          OO  OOOOOOOO OO OOOO  OOOOOOOO OOO  OOOO  OOOOOOO OOO=
O|
          |                               O                                =
 |
    2e+07 ++                                                               =
 |
          |                                  *     *.  ** *                =
 |
  1.5e+07 ++                   *       *   .* *****  **  * *               =
 |
          |** *.********.** *** **.* ** ***                                =
 |
    1e+07 *+: :            *        *                                      =
 |
          | : :                                                            =
 |
    5e+06 ++ :                                                             =
 |
          |  :                                                             =
 |
        0 ++-*-------------------------------------------------------------=
-+


                                cpuidle.C1E-NHM.usage

  45000 ++-----------------------------------------------------------------=
-+
        |     O  O                                                         =
 |
  40000 ++                                                                 =
 |
  35000 OOOO O OO O O        OOO    OO  OO            O    OO      O   O  O=
O|
        |             O  O      OO O       O  OOO   OO O  O  O    O OO     =
 |
  30000 ++           O OO O O         OO    OO   O O    O     OOO     O  O =
 O
  25000 ++                                                                 =
 |
        |                                                                  =
 |
  20000 ++                                                                 =
 |
  15000 ++                    *           .*******.***** .**               =
 |
        |**  ** ***. **** *.** ** .*******              *                  =
 |
  10000 *+:  : *    *    *       *                                         =
 |
   5000 ++ ::                                                              =
 |
        |  ::                                                              =
 |
      0 ++-*---------------------------------------------------------------=
-+


                                 cpuidle.C3-NHM.time

  7e+08 ++---*-*----*----*-------------------------------------------------=
-+
        ***  :* ***  **** *.******.*******. *** **. * ***. *               =
 |
  6e+08 ++:  :                             *   *   * *    *                =
 |
        | :  :                                          O      O      O    =
 |
  5e+08 OOOO:OOOOOO OOOOOOO OOOOOO OOOOOOO OOOOOOO OOOOO  OOOOO O OOOO O OO=
OO
        | : :                                                              =
 |
  4e+08 ++: :                                                              =
 |
        | : :                                                              =
 |
  3e+08 ++ ::                                                              =
 |
        |  ::                                                              =
 |
  2e+08 ++ ::                                                              =
 |
        |  :                                                               =
 |
  1e+08 ++ :                                                               =
 |
        |  :                                                               =
 |
      0 ++-*---------------------------------------------------------------=
-+


                                cpuidle.C6-NHM.usage

  400000 ++----------------------------------------------------------------=
-+
         ***  ********.*******. ******. **   *           *                 =
 |
  350000 ++:  :                *       *  *** *.*******.* **               =
 |
         | :  :                                                            =
 |
  300000 ++:  :                                                            =
 |
  250000 ++: :                                                             =
 |
         OOOO:O OO O    OO OO          OO                O    O OO       O =
 |
  200000 ++: : O     O                      OO    OO    O             O    =
 O
         |  ::    O    O     O O OOOOO     O  O OO  OO    OOOO    OOOO     =
 |
  150000 ++ ::      O     O     O        OO           O                O  O=
O|
  100000 ++ ::                                                             =
 |
         |  :                                                              =
 |
   50000 ++ :                                                              =
 |
         |  :                                                              =
 |
       0 ++-*--------------------------------------------------------------=
-+


                                 turbostat.Bzy_MHz

  3000 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  2500 OOO OOOOOO OO O O O  OOO OOOOO   OOOOO OOOOOO OOO OO OOO  O OOOOO  O=
OO
       |            O O   OO         O O                O      OO       O  =
 |
       |                                  ***.******.******                =
 |
  2000 ***  *****.******.******.******.***                                 =
 |
       | :  :                                                              =
 |
  1500 ++:  :                                                              =
 |
       |  : :                                                              =
 |
  1000 ++ : :                                                              =
 |
       |  ::                                                               =
 |
       |  ::                                                               =
 |
   500 ++  :                                                               =
 |
       |   :                                                               =
 |
     0 ++--*---------------------------------------------------------------=
-+


                                turbostat.CPU%c1

  20 ++--------------------------------------------------------------------=
-+
  18 OO  OOOOO OO                                                          =
 |
     | O                                                                   =
 |
  16 ++          OO  OOOOO OOOOO OOOOO OOOO OOOOO OOOOO O OOO OOOO  OO OO O=
OO
  14 ++            O                                     O        O   O    =
 |
     |                                                                     =
 |
  12 ++                                                                    =
 |
  10 ++                                  **.*****.*****.***                =
 |
   8 ++                     *       *    :                                 =
 |
     ***  ****.*****.*****.* ***.*** *.**                                  =
 |
   6 ++:  :                                                                =
 |
   4 ++ : :                                                                =
 |
     |  ::                                                                 =
 |
   2 ++  :                                                                 =
 |
   0 ++--*-----------------------------------------------------------------=
-+


                                turbostat.CPU%c3

  60 ++--------------------------------------------------------------------=
-+
     * *  ***   *** .* ***.* * *. ** *.*                                   =
 |
  50 +*:  :  *.*   *  *     * *  *  *   *  .**     *  *.*                  =
 |
     | :  :                              **   ***.* **   **                =
 |
     | :  :                                                                =
 |
  40 ++ : :                                                                =
 |
     OOO:O: OO  O OO OO OO  O  O   OOO    O OO  O OO  O O OO  OOOOO OOOOO  =
 O
  30 ++ : OO   O O     O   O OO  OO    OOO    OO    OO   O  O             O=
O|
     |  ::                                                                 =
 |
  20 ++ ::                                                                 =
 |
     |  ::                                                                 =
 |
     |   :                                                                 =
 |
  10 ++  :                                                                 =
 |
     |   :                                                                 =
 |
   0 ++--*-----------------------------------------------------------------=
-+


                                turbostat.CPU%c6

  60 ++--------------------------------------------------------------------=
-+
     |                                                                     =
 |
  50 ++    O   O O O   O   OOOOO OOO   OOOO  OOOO  OOOO  OOOO    OO OO O  O=
O|
     OOO OO OO  O O  OO OO          OO      O     O     O     OOO     O O  =
 O
     |                                        *                            =
 |
  40 ***  ****.*****.*****.*****.** **.****.** **.*****.***                =
 |
     | :  :                        *                                       =
 |
  30 ++:  :                                                                =
 |
     |  : :                                                                =
 |
  20 ++ : :                                                                =
 |
     |  ::                                                                 =
 |
     |  ::                                                                 =
 |
  10 ++  :                                                                 =
 |
     |   :                                                                 =
 |
   0 ++--*-----------------------------------------------------------------=
-+


                                turbostat.Pkg%pc3

  60 ++--------------------------------------------------------------------=
-+
     |                                                                     =
 |
  50 ++   *         .*                                                     =
 |
     ***  :***. ****  :***.  ***.** **.                                    =
 |
     | :  :    *      *    **      *   **              .*                  =
 |
  40 ++:  :                              **.*****.*****  **                =
 |
     |  : :                                                                =
 |
  30 ++ : :      OOO O OOO OOOOO OOOOO OOOO OOOOO OOOOO OOOOO  OOOO OOOOO O=
OO
     | O:OOOO         O                                       O            =
 |
  20 OO ::   O OO                                                          =
 |
     |  ::                                                                 =
 |
     |  ::                                                                 =
 |
  10 ++  :                                                                 =
 |
     |   :                                                                 =
 |
   0 ++--*-----------------------------------------------------------------=
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

--===============2038100966333891927==
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
ICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiBwZXJmb3JtYW5jZQpkZWZhdWx0LXdh
dGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogOWNmY2M2NThkYTk2
OTNmNjVlNzIyNGU4MzI5ZTQwYWRhMmYzYzY5OQptb2RlbDogTmVoYWxlbS1FUAptZW1vcnk6IDEy
RwpoZGRfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtU1QzNTAwNTE0TlNfOVdKMDNF
QkEtcGFydDMiCnN3YXBfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtU1QzMTIwMDI2
QVNfNU1TMDdIQTItcGFydDIiCnJvb3Rmc19wYXJ0aXRpb246ICIvZGV2L2Rpc2svYnktaWQvYXRh
LVNUMzUwMDUxNE5TXzlXSjAzRUJBLXBhcnQxIgpjYXRlZ29yeTogYmVuY2htYXJrCml0ZXJhdGlv
bnM6IDF4Cm5yX3RocmVhZHM6IDMydApkaXNrOiAxSERECmZzOiBmMmZzCmZzMjogCmZzbWFyazoK
ICBmaWxlc2l6ZTogOEsKICB0ZXN0X3NpemU6IDQwME0KICBzeW5jX21ldGhvZDogZnN5bmNCZWZv
cmVDbG9zZQogIG5yX2RpcmVjdG9yaWVzOiAxNmQKICBucl9maWxlc19wZXJfZGlyZWN0b3J5OiAy
NTZmcGQKcXVldWU6IGN5Y2xpYwp0ZXN0Ym94OiBsa3AtbmUwNAp0Ym94X2dyb3VwOiBsa3AtbmUw
NAprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTUtMDktMDYgMTY6MTg6NTYu
MDM2OTg0OTQxICswODowMAppZDogMTBhZDM5YTg1MTFjZjU2ZTc1NDU3YTZlN2ZiZmU2NzFlNGJi
NDVlZQp1c2VyOiBsa3AKY29tcGlsZXI6IGdjYy00LjkKaGVhZF9jb21taXQ6IDljZmNjNjU4ZGE5
NjkzZjY1ZTcyMjRlODMyOWU0MGFkYTJmM2M2OTkKYmFzZV9jb21taXQ6IGJmNTllNjYyM2EzYTky
YTJiZjQyOGYyZDY1OTJjODFhYWU2MzE3ZTEKYnJhbmNoOiBsaW51cy9tYXN0ZXIKa2VybmVsOiAi
L3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzljZmNjNjU4ZGE5NjkzZjY1ZTcyMjRlODMy
OWU0MGFkYTJmM2M2OTkvdm1saW51ei00LjIuMC0wOTYyOC1nOWNmY2M2NSIKcm9vdGZzOiBkZWJp
YW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC9mc21hcmsvcGVy
Zm9ybWFuY2UtMXgtMzJ0LTFIREQtZjJmcy04Sy00MDBNLWZzeW5jQmVmb3JlQ2xvc2UtMTZkLTI1
NmZwZC9sa3AtbmUwNC9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2dj
Yy00LjkvOWNmY2M2NThkYTk2OTNmNjVlNzIyNGU4MzI5ZTQwYWRhMmYzYzY5OS8wIgpqb2JfZmls
ZTogIi9sa3Avc2NoZWR1bGVkL2xrcC1uZTA0L2N5Y2xpY19mc21hcmstcGVyZm9ybWFuY2UtMXgt
MzJ0LTFIREQtZjJmcy04Sy00MDBNLWZzeW5jQmVmb3JlQ2xvc2UtMTZkLTI1NmZwZC14ODZfNjQt
cmhlbC1DWUNMSUNfSEVBRC05Y2ZjYzY1OGRhOTY5M2Y2NWU3MjI0ZTgzMjllNDBhZGEyZjNjNjk5
LTIwMTUwOTA2LTExNzA3MS15aDJzYWwtMC55YW1sIgpkZXF1ZXVlX3RpbWU6IDIwMTUtMDktMDYg
MTk6MzQ6MTQuMjEwNTU5MTUxICswODowMApucl9jcHU6ICIkKG5wcm9jKSIKbWF4X3VwdGltZTog
MTQ1My4yCmluaXRyZDogIi9vc2ltYWdlL2RlYmlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcu
Y2d6Igpib290bG9hZGVyX2FwcGVuZDoKLSByb290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9i
PS9sa3Avc2NoZWR1bGVkL2xrcC1uZTA0L2N5Y2xpY19mc21hcmstcGVyZm9ybWFuY2UtMXgtMzJ0
LTFIREQtZjJmcy04Sy00MDBNLWZzeW5jQmVmb3JlQ2xvc2UtMTZkLTI1NmZwZC14ODZfNjQtcmhl
bC1DWUNMSUNfSEVBRC05Y2ZjYzY1OGRhOTY5M2Y2NWU3MjI0ZTgzMjllNDBhZGEyZjNjNjk5LTIw
MTUwOTA2LTExNzA3MS15aDJzYWwtMC55YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmlnPXg4Nl82
NC1yaGVsCi0gYnJhbmNoPWxpbnVzL21hc3RlcgotIGNvbW1pdD05Y2ZjYzY1OGRhOTY5M2Y2NWU3
MjI0ZTgzMjllNDBhZGEyZjNjNjk5Ci0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVs
L2djYy00LjkvOWNmY2M2NThkYTk2OTNmNjVlNzIyNGU4MzI5ZTQwYWRhMmYzYzY5OS92bWxpbnV6
LTQuMi4wLTA5NjI4LWc5Y2ZjYzY1Ci0gbWF4X3VwdGltZT0xNDUzCi0gUkVTVUxUX1JPT1Q9L3Jl
c3VsdC9mc21hcmsvcGVyZm9ybWFuY2UtMXgtMzJ0LTFIREQtZjJmcy04Sy00MDBNLWZzeW5jQmVm
b3JlQ2xvc2UtMTZkLTI1NmZwZC9sa3AtbmUwNC9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6
L3g4Nl82NC1yaGVsL2djYy00LjkvOWNmY2M2NThkYTk2OTNmNjVlNzIyNGU4MzI5ZTQwYWRhMmYz
YzY5OS8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIw
MCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5c19l
bmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5pYz0tMSBzb2Z0
bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNr
PTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2
Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3AteDg2XzY0LmNneiIKbW9k
dWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvOWNmY2M2NThkYTk2
OTNmNjVlNzIyNGU4MzI5ZTQwYWRhMmYzYzY5OS9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAiL29z
aW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3osL29zaW1hZ2Uv
ZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNvbmZpZy5jZ3osL29zaW1h
Z2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJvc3RhdC5jZ3osL2xrcC9i
ZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUt
MDItMDcuY2d6L2ZzLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5j
Z3ovZnMyLmNneiwvbGtwL2JlbmNobWFya3MvZnNtYXJrLmNneiIKam9iX3N0YXRlOiBmaW5pc2hl
ZApsb2FkYXZnOiAyNS4zMiA5Ljc0IDMuNTcgMS8yNTMgMzg2OApzdGFydF90aW1lOiAnMTQ0MTUz
OTMxOScKZW5kX3RpbWU6ICcxNDQxNTM5NDMwJwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE1
MDkwNi0xODExMDkiCg==

--===============2038100966333891927==
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
bS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OC9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCm1rZnMgLXQgZjJmcyAvZGV2L3NkYTMK
bW91bnQgLXQgZjJmcyAvZGV2L3NkYTMgL2ZzL3NkYTMKLi9mc19tYXJrIC1kIC9mcy9zZGEzLzEg
LWQgL2ZzL3NkYTMvMiAtZCAvZnMvc2RhMy8zIC1kIC9mcy9zZGEzLzQgLWQgL2ZzL3NkYTMvNSAt
ZCAvZnMvc2RhMy82IC1kIC9mcy9zZGEzLzcgLWQgL2ZzL3NkYTMvOCAtZCAvZnMvc2RhMy85IC1k
IC9mcy9zZGEzLzEwIC1kIC9mcy9zZGEzLzExIC1kIC9mcy9zZGEzLzEyIC1kIC9mcy9zZGEzLzEz
IC1kIC9mcy9zZGEzLzE0IC1kIC9mcy9zZGEzLzE1IC1kIC9mcy9zZGEzLzE2IC1kIC9mcy9zZGEz
LzE3IC1kIC9mcy9zZGEzLzE4IC1kIC9mcy9zZGEzLzE5IC1kIC9mcy9zZGEzLzIwIC1kIC9mcy9z
ZGEzLzIxIC1kIC9mcy9zZGEzLzIyIC1kIC9mcy9zZGEzLzIzIC1kIC9mcy9zZGEzLzI0IC1kIC9m
cy9zZGEzLzI1IC1kIC9mcy9zZGEzLzI2IC1kIC9mcy9zZGEzLzI3IC1kIC9mcy9zZGEzLzI4IC1k
IC9mcy9zZGEzLzI5IC1kIC9mcy9zZGEzLzMwIC1kIC9mcy9zZGEzLzMxIC1kIC9mcy9zZGEzLzMy
IC1EIDE2IC1OIDI1NiAtbiAxNjAwIC1MIDEgLVMgMSAtcyA4MTkyCg==

--===============2038100966333891927==--

