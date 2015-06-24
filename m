Content-Type: multipart/mixed; boundary="===============0838449700403544809=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [sched] 46f3e2ca308: 2.7% ebizzy.throughput
Date: Wed, 24 Jun 2015 09:15:19 +0800
Message-ID: <1435108519.5606.19.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0838449700403544809==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://bee.sh.intel.com/git/ydu19/tip for-lkp
commit 46f3e2ca30845c541b49efe12b5d0eff673f5c4b ("sched: Rewrite runnable l=
oad and utilization average tracking")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/nr_threads/ite=
rations/duration:
  lkp-nex04/ebizzy/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/perform=
ance/200%/100x/10s

commit: =

  69aec05e924a239e9ccf969cf9f9ab842eccd8a6
  46f3e2ca30845c541b49efe12b5d0eff673f5c4b

69aec05e924a239e 46f3e2ca30845c541b49efe12b =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     12405 =C2=B1  2%      +2.7%      12746 =C2=B1  0%  ebizzy.throughput
    117.70 =C2=B1  1%     +24.6%     146.60 =C2=B1  1%  ebizzy.throughput.p=
er_thread.max
      0.05 =C2=B1  9%    +120.0%       0.12 =C2=B1  1%  ebizzy.throughput.p=
er_thread.stddev_percent
   5205629 =C2=B1  0%      -7.6%    4812402 =C2=B1  0%  ebizzy.time.involun=
tary_context_switches
 1.193e+09 =C2=B1  2%      +2.8%  1.225e+09 =C2=B1  0%  ebizzy.time.minor_p=
age_faults
    591.65 =C2=B1  0%      -1.1%     584.93 =C2=B1  0%  ebizzy.time.sys
     59193 =C2=B1  0%      -1.1%      58518 =C2=B1  0%  ebizzy.time.system_=
time
     44.86 =C2=B1  0%      +8.7%      48.78 =C2=B1  0%  ebizzy.time.user
      4501 =C2=B1  0%      +8.6%       4887 =C2=B1  0%  ebizzy.time.user_ti=
me
    289529 =C2=B1  8%     -10.1%     260393 =C2=B1  4%  ebizzy.time.volunta=
ry_context_switches
      9060 =C2=B1 23%     -59.0%       3714 =C2=B1 13%  softirqs.NET_RX
      6368 =C2=B1  1%      -8.5%       5826 =C2=B1  4%  vmstat.system.cs
      5447 =C2=B1 14%     -21.9%       4252 =C2=B1  9%  numa-vmstat.node1.n=
r_active_anon
      5402 =C2=B1 14%     -22.0%       4214 =C2=B1  9%  numa-vmstat.node1.n=
r_anon_pages
    808336 =C2=B1  3%     -22.6%     625595 =C2=B1  0%  proc-vmstat.numa_hi=
nt_faults_local
    146402 =C2=B1 19%    +108.1%     304597 =C2=B1  0%  proc-vmstat.numa_pa=
ges_migrated
    146402 =C2=B1 19%    +108.1%     304597 =C2=B1  0%  proc-vmstat.pgmigra=
te_success
      5552 =C2=B1  2%     +13.4%       6297 =C2=B1  2%  numa-meminfo.node0.=
KernelStack
     21825 =C2=B1 14%     -21.8%      17058 =C2=B1  9%  numa-meminfo.node1.=
Active(anon)
     21637 =C2=B1 14%     -21.9%      16900 =C2=B1  9%  numa-meminfo.node1.=
AnonPages
      3385 =C2=B1  7%     -26.1%       2502 =C2=B1  5%  numa-meminfo.node1.=
KernelStack
      2203 =C2=B1  5%     +13.0%       2491 =C2=B1  6%  numa-meminfo.node3.=
KernelStack
      1138 =C2=B1 14%     +24.2%       1413 =C2=B1  5%  slabinfo.blkdev_ioc=
.active_objs
      1138 =C2=B1 14%     +24.2%       1413 =C2=B1  5%  slabinfo.blkdev_ioc=
.num_objs
      1254 =C2=B1 21%     +30.3%       1634 =C2=B1  7%  slabinfo.blkdev_req=
uests.active_objs
      1254 =C2=B1 21%     +30.3%       1634 =C2=B1  7%  slabinfo.blkdev_req=
uests.num_objs
      1429 =C2=B1 15%     +25.1%       1788 =C2=B1  5%  slabinfo.mnt_cache.=
active_objs
      1429 =C2=B1 15%     +25.1%       1788 =C2=B1  5%  slabinfo.mnt_cache.=
num_objs
      6710 =C2=B1 91%    +362.3%      31019 =C2=B1 79%  latency_stats.avg.b=
trfs_scan_one_device.[btrfs].btrfs_control_ioctl.[btrfs].do_vfs_ioctl.SyS_i=
octl.entry_SYSCALL_64_fastpath
      3221 =C2=B1130%    +332.9%      13946 =C2=B1104%  latency_stats.avg.c=
all_rwsem_down_write_failed.anon_vma_clone.__split_vma.do_munmap.SyS_brk.en=
try_SYSCALL_64_fastpath
     31762 =C2=B1 38%    -100.0%       0.00 =C2=B1 -1%  latency_stats.hits.=
hrtimer_nanosleep.SyS_nanosleep.entry_SYSCALL_64_fastpath
     12018 =C2=B1 96%    +276.6%      45257 =C2=B1 83%  latency_stats.max.b=
trfs_scan_one_device.[btrfs].btrfs_control_ioctl.[btrfs].do_vfs_ioctl.SyS_i=
octl.entry_SYSCALL_64_fastpath
     23746 =C2=B1 93%    +309.8%      97306 =C2=B1104%  latency_stats.sum.b=
trfs_scan_one_device.[btrfs].btrfs_control_ioctl.[btrfs].do_vfs_ioctl.SyS_i=
octl.entry_SYSCALL_64_fastpath
   2359462 =C2=B1  7%     -57.8%     995203 =C2=B1  7%  latency_stats.sum.c=
all_rwsem_down_read_failed.SyS_madvise.entry_SYSCALL_64_fastpath
 3.469e+08 =C2=B1 16%     -29.1%  2.461e+08 =C2=B1  2%  latency_stats.sum.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault
   8713241 =C2=B1 10%     -50.1%    4345716 =C2=B1 13%  latency_stats.sum.c=
all_rwsem_down_write_failed.SyS_mprotect.entry_SYSCALL_64_fastpath
     20193 =C2=B1138%    +280.5%      76832 =C2=B1109%  latency_stats.sum.c=
all_rwsem_down_write_failed.anon_vma_clone.__split_vma.do_munmap.SyS_brk.en=
try_SYSCALL_64_fastpath
  11300496 =C2=B1 10%     -64.0%    4072934 =C2=B1 13%  latency_stats.sum.c=
all_rwsem_down_write_failed.vm_munmap.SyS_munmap.entry_SYSCALL_64_fastpath
   2068553 =C2=B1 36%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.h=
rtimer_nanosleep.SyS_nanosleep.entry_SYSCALL_64_fastpath
   1513840 =C2=B1  2%     -13.7%    1306818 =C2=B1  1%  latency_stats.sum.w=
ait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpa=
th
  32834153 =C2=B1  0%     +16.8%   38360659 =C2=B1  3%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     14.00 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.runnable_load_avg
      6244 =C2=B1 39%     -85.2%     927.20 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
     61.20 =C2=B1107%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
      1031 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.utilization_load_avg
     14.60 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
10]:/.runnable_load_avg
   1221910 =C2=B1 25%    -215.1%   -1405859 =C2=B1-90%  sched_debug.cfs_rq[=
10]:/.spread0
      5860 =C2=B1 43%     -84.2%     927.10 =C2=B1  4%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
     77.10 =C2=B1109%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
10]:/.tg_load_contrib
      1041 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
10]:/.utilization_load_avg
     13.80 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.runnable_load_avg
   1229568 =C2=B1 38%    -190.9%   -1117678 =C2=B1-115%  sched_debug.cfs_rq=
[11]:/.spread0
      5820 =C2=B1 43%     -84.1%     927.50 =C2=B1  4%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
     94.20 =C2=B1108%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.tg_load_contrib
      1022 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.utilization_load_avg
     84.80 =C2=B1133%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.blocked_load_avg
     13.70 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.runnable_load_avg
   1259738 =C2=B1 37%    -226.0%   -1587454 =C2=B1-84%  sched_debug.cfs_rq[=
12]:/.spread0
      5758 =C2=B1 42%     -83.9%     928.00 =C2=B1  4%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
     99.00 =C2=B1114%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.tg_load_contrib
      1028 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.utilization_load_avg
    107.20 =C2=B1 81%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.blocked_load_avg
     14.10 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.runnable_load_avg
   1101157 =C2=B1 37%    -207.2%   -1180823 =C2=B1-110%  sched_debug.cfs_rq=
[13]:/.spread0
      5676 =C2=B1 42%     -83.7%     927.60 =C2=B1  4%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
    121.90 =C2=B1 72%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.tg_load_contrib
      1042 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.utilization_load_avg
     98.20 =C2=B1 83%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.blocked_load_avg
     13.70 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.runnable_load_avg
   1185828 =C2=B1 31%    -220.9%   -1433991 =C2=B1-77%  sched_debug.cfs_rq[=
14]:/.spread0
      5668 =C2=B1 42%     -83.6%     927.60 =C2=B1  4%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
    112.50 =C2=B1 72%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.tg_load_contrib
      1026 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.utilization_load_avg
     13.90 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.runnable_load_avg
    786517 =C2=B1 52%    -273.5%   -1364964 =C2=B1-91%  sched_debug.cfs_rq[=
15]:/.spread0
      5656 =C2=B1 43%     -83.6%     928.30 =C2=B1  4%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
     96.30 =C2=B1 58%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.tg_load_contrib
      1037 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.utilization_load_avg
  33605942 =C2=B1  1%     +12.3%   37736177 =C2=B1  2%  sched_debug.cfs_rq[=
16]:/.min_vruntime
     14.50 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.runnable_load_avg
      5591 =C2=B1 43%     -83.4%     928.60 =C2=B1  4%  sched_debug.cfs_rq[=
16]:/.tg_load_avg
     79.30 =C2=B1 80%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.tg_load_contrib
      1051 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.utilization_load_avg
  33880249 =C2=B1  1%     +11.0%   37591735 =C2=B1  1%  sched_debug.cfs_rq[=
17]:/.min_vruntime
     13.90 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.runnable_load_avg
   1044771 =C2=B1 62%    -173.8%    -771206 =C2=B1-165%  sched_debug.cfs_rq=
[17]:/.spread0
      5564 =C2=B1 44%     -83.3%     929.00 =C2=B1  4%  sched_debug.cfs_rq[=
17]:/.tg_load_avg
     99.20 =C2=B1 78%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.tg_load_contrib
      1030 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.utilization_load_avg
     69.00 =C2=B1 74%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.blocked_load_avg
  33673604 =C2=B1  1%     +11.7%   37622995 =C2=B1  2%  sched_debug.cfs_rq[=
18]:/.min_vruntime
     13.70 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.runnable_load_avg
    838064 =C2=B1 62%    -188.3%    -740074 =C2=B1-143%  sched_debug.cfs_rq=
[18]:/.spread0
      5549 =C2=B1 44%     -83.3%     928.90 =C2=B1  4%  sched_debug.cfs_rq[=
18]:/.tg_load_avg
     82.90 =C2=B1 61%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.tg_load_contrib
      1018 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.utilization_load_avg
  33855011 =C2=B1  2%     +10.4%   37375757 =C2=B1  2%  sched_debug.cfs_rq[=
19]:/.min_vruntime
     14.60 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.runnable_load_avg
   1019383 =C2=B1 83%    -196.9%    -987422 =C2=B1-122%  sched_debug.cfs_rq=
[19]:/.spread0
      5506 =C2=B1 43%     -83.1%     928.50 =C2=B1  4%  sched_debug.cfs_rq[=
19]:/.tg_load_avg
     92.00 =C2=B1 73%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.tg_load_contrib
      1026 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.utilization_load_avg
  32922723 =C2=B1  0%     +12.3%   36975395 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.min_vruntime
     13.90 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
     88390 =C2=B1332%   -1667.4%   -1385397 =C2=B1-71%  sched_debug.cfs_rq[=
1]:/.spread0
      6229 =C2=B1 40%     -85.1%     926.60 =C2=B1  4%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
     42.50 =C2=B1108%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
      1030 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.utilization_load_avg
  33881670 =C2=B1  1%     +10.8%   37545581 =C2=B1  2%  sched_debug.cfs_rq[=
20]:/.min_vruntime
      1.70 =C2=B1126%   +2400.0%      42.50 =C2=B1 94%  sched_debug.cfs_rq[=
20]:/.nr_spread_over
     14.00 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.runnable_load_avg
   1046003 =C2=B1 53%    -178.2%    -817686 =C2=B1-174%  sched_debug.cfs_rq=
[20]:/.spread0
      5461 =C2=B1 43%     -82.9%     933.70 =C2=B1  5%  sched_debug.cfs_rq[=
20]:/.tg_load_avg
     67.90 =C2=B1 78%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.tg_load_contrib
      1033 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.utilization_load_avg
  33643963 =C2=B1  1%     +11.2%   37425030 =C2=B1  2%  sched_debug.cfs_rq[=
21]:/.min_vruntime
      1.70 =C2=B1 64%   +2611.8%      46.10 =C2=B1114%  sched_debug.cfs_rq[=
21]:/.nr_spread_over
     14.40 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.runnable_load_avg
    808221 =C2=B1 59%    -216.1%    -938325 =C2=B1-122%  sched_debug.cfs_rq=
[21]:/.spread0
      5440 =C2=B1 42%     -82.8%     933.50 =C2=B1  5%  sched_debug.cfs_rq[=
21]:/.tg_load_avg
     71.20 =C2=B1 82%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.tg_load_contrib
      1035 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.utilization_load_avg
  33662992 =C2=B1  1%     +10.6%   37231148 =C2=B1  2%  sched_debug.cfs_rq[=
22]:/.min_vruntime
     15.00 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.runnable_load_avg
    827143 =C2=B1 87%    -236.9%   -1132307 =C2=B1-76%  sched_debug.cfs_rq[=
22]:/.spread0
      5433 =C2=B1 42%     -82.8%     933.60 =C2=B1  5%  sched_debug.cfs_rq[=
22]:/.tg_load_avg
     76.00 =C2=B1 85%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.tg_load_contrib
      1048 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.utilization_load_avg
  33314446 =C2=B1  1%     +12.0%   37312889 =C2=B1  1%  sched_debug.cfs_rq[=
23]:/.min_vruntime
      2.20 =C2=B1121%   +1209.1%      28.80 =C2=B1134%  sched_debug.cfs_rq[=
23]:/.nr_spread_over
     13.90 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
23]:/.runnable_load_avg
      5441 =C2=B1 43%     -82.8%     933.70 =C2=B1  5%  sched_debug.cfs_rq[=
23]:/.tg_load_avg
     84.00 =C2=B1 56%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
23]:/.tg_load_contrib
      1021 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
23]:/.utilization_load_avg
  32890975 =C2=B1  1%     +14.5%   37674708 =C2=B1  2%  sched_debug.cfs_rq[=
24]:/.min_vruntime
     14.10 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.runnable_load_avg
      5360 =C2=B1 43%     -82.6%     933.40 =C2=B1  5%  sched_debug.cfs_rq[=
24]:/.tg_load_avg
     54.20 =C2=B1 67%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.tg_load_contrib
      1031 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.utilization_load_avg
  32996974 =C2=B1  1%     +14.2%   37681211 =C2=B1  2%  sched_debug.cfs_rq[=
25]:/.min_vruntime
     16.90 =C2=B1108%    +282.8%      64.70 =C2=B1 73%  sched_debug.cfs_rq[=
25]:/.nr_spread_over
     14.50 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.runnable_load_avg
      5326 =C2=B1 44%     -82.5%     933.70 =C2=B1  5%  sched_debug.cfs_rq[=
25]:/.tg_load_avg
     71.30 =C2=B1 91%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.tg_load_contrib
      1050 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.utilization_load_avg
     52.40 =C2=B1115%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.blocked_load_avg
  33127889 =C2=B1  1%     +13.2%   37484266 =C2=B1  2%  sched_debug.cfs_rq[=
26]:/.min_vruntime
     14.70 =C2=B1 17%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.runnable_load_avg
      5345 =C2=B1 44%     -82.5%     933.30 =C2=B1  5%  sched_debug.cfs_rq[=
26]:/.tg_load_avg
     67.40 =C2=B1 88%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.tg_load_contrib
      1033 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.utilization_load_avg
  33165596 =C2=B1  1%     +12.8%   37420990 =C2=B1  2%  sched_debug.cfs_rq[=
27]:/.min_vruntime
     14.50 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.runnable_load_avg
      5322 =C2=B1 44%     -82.5%     933.30 =C2=B1  5%  sched_debug.cfs_rq[=
27]:/.tg_load_avg
     96.10 =C2=B1 78%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.tg_load_contrib
      1051 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.utilization_load_avg
  33028387 =C2=B1  1%     +12.4%   37109244 =C2=B1  1%  sched_debug.cfs_rq[=
28]:/.min_vruntime
     13.60 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.runnable_load_avg
      5317 =C2=B1 44%     -82.5%     933.20 =C2=B1  5%  sched_debug.cfs_rq[=
28]:/.tg_load_avg
    110.80 =C2=B1 91%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.tg_load_contrib
      1013 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.utilization_load_avg
  33004132 =C2=B1  0%     +12.9%   37267784 =C2=B1  2%  sched_debug.cfs_rq[=
29]:/.min_vruntime
     14.80 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
29]:/.runnable_load_avg
      5297 =C2=B1 43%     -82.4%     933.80 =C2=B1  5%  sched_debug.cfs_rq[=
29]:/.tg_load_avg
    100.40 =C2=B1114%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
29]:/.tg_load_contrib
      1036 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
29]:/.utilization_load_avg
  33022220 =C2=B1  0%     +10.8%   36603529 =C2=B1  2%  sched_debug.cfs_rq[=
2]:/.min_vruntime
     13.80 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
    187870 =C2=B1177%   -1035.5%   -1757437 =C2=B1-54%  sched_debug.cfs_rq[=
2]:/.spread0
      6205 =C2=B1 40%     -85.1%     927.30 =C2=B1  4%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
    178.70 =C2=B1113%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
      1022 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.utilization_load_avg
  33026863 =C2=B1  1%     +12.0%   36995909 =C2=B1  2%  sched_debug.cfs_rq[=
30]:/.min_vruntime
     13.80 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
30]:/.runnable_load_avg
      5285 =C2=B1 43%     -82.3%     933.90 =C2=B1  5%  sched_debug.cfs_rq[=
30]:/.tg_load_avg
     91.50 =C2=B1 79%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
30]:/.tg_load_contrib
      1022 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
30]:/.utilization_load_avg
  32768904 =C2=B1  1%     +13.0%   37040605 =C2=B1  2%  sched_debug.cfs_rq[=
31]:/.min_vruntime
     13.70 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.runnable_load_avg
      5258 =C2=B1 43%     -82.2%     933.80 =C2=B1  5%  sched_debug.cfs_rq[=
31]:/.tg_load_avg
     84.00 =C2=B1113%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.tg_load_contrib
      1022 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.utilization_load_avg
  32957365 =C2=B1  0%     +13.0%   37240539 =C2=B1  2%  sched_debug.cfs_rq[=
32]:/.min_vruntime
     14.00 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
32]:/.runnable_load_avg
    120723 =C2=B1171%   -1031.2%   -1124157 =C2=B1-51%  sched_debug.cfs_rq[=
32]:/.spread0
      5219 =C2=B1 43%     -82.1%     933.10 =C2=B1  5%  sched_debug.cfs_rq[=
32]:/.tg_load_avg
     49.60 =C2=B1113%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
32]:/.tg_load_contrib
      1021 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
32]:/.utilization_load_avg
  33111907 =C2=B1  0%     +11.8%   37006861 =C2=B1  2%  sched_debug.cfs_rq[=
33]:/.min_vruntime
     13.70 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
33]:/.runnable_load_avg
    275159 =C2=B1129%    -593.5%   -1357911 =C2=B1-64%  sched_debug.cfs_rq[=
33]:/.spread0
      5160 =C2=B1 44%     -81.9%     933.20 =C2=B1  5%  sched_debug.cfs_rq[=
33]:/.tg_load_avg
     35.60 =C2=B1114%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
33]:/.tg_load_contrib
      1014 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
33]:/.utilization_load_avg
  33094533 =C2=B1  0%     +11.9%   37035777 =C2=B1  1%  sched_debug.cfs_rq[=
34]:/.min_vruntime
     15.60 =C2=B1 23%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
34]:/.runnable_load_avg
    257694 =C2=B1123%    -615.8%   -1329107 =C2=B1-74%  sched_debug.cfs_rq[=
34]:/.spread0
      5093 =C2=B1 45%     -81.7%     933.40 =C2=B1  5%  sched_debug.cfs_rq[=
34]:/.tg_load_avg
    106.90 =C2=B1112%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
34]:/.tg_load_contrib
      1044 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
34]:/.utilization_load_avg
  33134655 =C2=B1  1%     +12.1%   37143548 =C2=B1  2%  sched_debug.cfs_rq[=
35]:/.min_vruntime
     14.50 =C2=B1 22%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
35]:/.runnable_load_avg
    297753 =C2=B1156%    -510.2%   -1221388 =C2=B1-72%  sched_debug.cfs_rq[=
35]:/.spread0
      5018 =C2=B1 45%     -81.4%     933.70 =C2=B1  5%  sched_debug.cfs_rq[=
35]:/.tg_load_avg
     68.40 =C2=B1 99%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
35]:/.tg_load_contrib
      1021 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
35]:/.utilization_load_avg
  33052339 =C2=B1  1%     +10.9%   36668782 =C2=B1  2%  sched_debug.cfs_rq[=
36]:/.min_vruntime
     14.00 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
36]:/.runnable_load_avg
    215366 =C2=B1180%    -887.6%   -1696273 =C2=B1-68%  sched_debug.cfs_rq[=
36]:/.spread0
      4984 =C2=B1 46%     -81.3%     933.70 =C2=B1  5%  sched_debug.cfs_rq[=
36]:/.tg_load_avg
     77.10 =C2=B1 99%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
36]:/.tg_load_contrib
      1026 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
36]:/.utilization_load_avg
  32872426 =C2=B1  0%     +11.5%   36642982 =C2=B1  3%  sched_debug.cfs_rq[=
37]:/.min_vruntime
     14.00 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
37]:/.runnable_load_avg
     35376 =C2=B1889%   -4968.1%   -1722144 =C2=B1-64%  sched_debug.cfs_rq[=
37]:/.spread0
      4911 =C2=B1 43%     -81.1%     930.30 =C2=B1  5%  sched_debug.cfs_rq[=
37]:/.tg_load_avg
     67.10 =C2=B1104%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
37]:/.tg_load_contrib
      1026 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
37]:/.utilization_load_avg
  33020465 =C2=B1  1%     +11.3%   36743050 =C2=B1  3%  sched_debug.cfs_rq[=
38]:/.min_vruntime
     14.60 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
38]:/.runnable_load_avg
    183379 =C2=B1194%    -984.6%   -1622175 =C2=B1-47%  sched_debug.cfs_rq[=
38]:/.spread0
      4913 =C2=B1 43%     -81.1%     929.70 =C2=B1  5%  sched_debug.cfs_rq[=
38]:/.tg_load_avg
     28.30 =C2=B1100%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
38]:/.tg_load_contrib
      1024 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
38]:/.utilization_load_avg
  32649942 =C2=B1  0%     +12.2%   36627516 =C2=B1  2%  sched_debug.cfs_rq[=
39]:/.min_vruntime
     14.20 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
39]:/.runnable_load_avg
   -187194 =C2=B1-154%    +828.3%   -1737803 =C2=B1-52%  sched_debug.cfs_rq=
[39]:/.spread0
      4861 =C2=B1 44%     -80.9%     929.80 =C2=B1  5%  sched_debug.cfs_rq[=
39]:/.tg_load_avg
     83.70 =C2=B1108%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
39]:/.tg_load_contrib
      1025 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
39]:/.utilization_load_avg
  32997866 =C2=B1  1%     +11.2%   36700891 =C2=B1  2%  sched_debug.cfs_rq[=
3]:/.min_vruntime
     14.50 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
    163497 =C2=B1274%   -1115.4%   -1660155 =C2=B1-60%  sched_debug.cfs_rq[=
3]:/.spread0
      6180 =C2=B1 40%     -85.0%     927.00 =C2=B1  4%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
    135.40 =C2=B1100%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
      1034 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.utilization_load_avg
     13.90 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
40]:/.runnable_load_avg
   1234363 =C2=B1 39%    -180.2%    -989487 =C2=B1-145%  sched_debug.cfs_rq=
[40]:/.spread0
      4866 =C2=B1 43%     -80.9%     929.60 =C2=B1  5%  sched_debug.cfs_rq[=
40]:/.tg_load_avg
     75.70 =C2=B1 96%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
40]:/.tg_load_contrib
      1034 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
40]:/.utilization_load_avg
     13.80 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
41]:/.runnable_load_avg
   1242936 =C2=B1 32%    -195.4%   -1185398 =C2=B1-113%  sched_debug.cfs_rq=
[41]:/.spread0
      4847 =C2=B1 44%     -80.8%     930.00 =C2=B1  4%  sched_debug.cfs_rq[=
41]:/.tg_load_avg
     91.80 =C2=B1 80%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
41]:/.tg_load_contrib
      1025 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
41]:/.utilization_load_avg
     13.80 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
42]:/.runnable_load_avg
   1309960 =C2=B1 31%    -192.3%   -1208736 =C2=B1-109%  sched_debug.cfs_rq=
[42]:/.spread0
      4834 =C2=B1 44%     -80.8%     929.80 =C2=B1  5%  sched_debug.cfs_rq[=
42]:/.tg_load_avg
     69.20 =C2=B1 68%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
42]:/.tg_load_contrib
      1042 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
42]:/.utilization_load_avg
  34125817 =C2=B1  1%      +9.5%   37378869 =C2=B1  2%  sched_debug.cfs_rq[=
43]:/.min_vruntime
     13.50 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
43]:/.runnable_load_avg
   1288476 =C2=B1 36%    -176.6%    -986946 =C2=B1-123%  sched_debug.cfs_rq=
[43]:/.spread0
      4794 =C2=B1 45%     -80.6%     929.10 =C2=B1  5%  sched_debug.cfs_rq[=
43]:/.tg_load_avg
     32.70 =C2=B1 96%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
43]:/.tg_load_contrib
      1013 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
43]:/.utilization_load_avg
     13.50 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
44]:/.runnable_load_avg
   1444719 =C2=B1 35%    -196.4%   -1393006 =C2=B1-101%  sched_debug.cfs_rq=
[44]:/.spread0
      4793 =C2=B1 44%     -80.6%     929.90 =C2=B1  4%  sched_debug.cfs_rq[=
44]:/.tg_load_avg
     73.30 =C2=B1 53%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
44]:/.tg_load_contrib
      1040 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
44]:/.utilization_load_avg
     85.20 =C2=B1100%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
45]:/.blocked_load_avg
  33995676 =C2=B1  1%      +9.6%   37254438 =C2=B1  1%  sched_debug.cfs_rq[=
45]:/.min_vruntime
     15.20 =C2=B1 30%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
45]:/.runnable_load_avg
   1158251 =C2=B1 26%    -196.0%   -1111565 =C2=B1-106%  sched_debug.cfs_rq=
[45]:/.spread0
      4755 =C2=B1 44%     -80.5%     929.70 =C2=B1  4%  sched_debug.cfs_rq[=
45]:/.tg_load_avg
    100.70 =C2=B1 88%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
45]:/.tg_load_contrib
      1022 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
45]:/.utilization_load_avg
  34078137 =C2=B1  0%      +9.2%   37226845 =C2=B1  1%  sched_debug.cfs_rq[=
46]:/.min_vruntime
     13.80 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
46]:/.runnable_load_avg
   1240663 =C2=B1 27%    -191.8%   -1139248 =C2=B1-98%  sched_debug.cfs_rq[=
46]:/.spread0
      4734 =C2=B1 44%     -80.4%     929.70 =C2=B1  4%  sched_debug.cfs_rq[=
46]:/.tg_load_avg
     89.70 =C2=B1 94%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
46]:/.tg_load_contrib
      1027 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
46]:/.utilization_load_avg
  33683724 =C2=B1  1%     +10.5%   37224627 =C2=B1  2%  sched_debug.cfs_rq[=
47]:/.min_vruntime
     14.10 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
47]:/.runnable_load_avg
    846204 =C2=B1 51%    -234.9%   -1141577 =C2=B1-116%  sched_debug.cfs_rq=
[47]:/.spread0
      4671 =C2=B1 41%     -80.1%     929.30 =C2=B1  4%  sched_debug.cfs_rq[=
47]:/.tg_load_avg
     85.60 =C2=B1 44%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
47]:/.tg_load_contrib
      1029 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
47]:/.utilization_load_avg
  33744780 =C2=B1  1%     +11.4%   37602073 =C2=B1  1%  sched_debug.cfs_rq[=
48]:/.min_vruntime
     14.20 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
48]:/.runnable_load_avg
      4650 =C2=B1 41%     -80.0%     929.40 =C2=B1  4%  sched_debug.cfs_rq[=
48]:/.tg_load_avg
     66.10 =C2=B1 78%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
48]:/.tg_load_contrib
      1036 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
48]:/.utilization_load_avg
  33992243 =C2=B1  1%     +10.6%   37591079 =C2=B1  1%  sched_debug.cfs_rq[=
49]:/.min_vruntime
     13.90 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
49]:/.runnable_load_avg
   1154619 =C2=B1 50%    -167.1%    -775311 =C2=B1-170%  sched_debug.cfs_rq=
[49]:/.spread0
      4645 =C2=B1 41%     -80.0%     929.40 =C2=B1  4%  sched_debug.cfs_rq[=
49]:/.tg_load_avg
     52.30 =C2=B1 77%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
49]:/.tg_load_contrib
      1022 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
49]:/.utilization_load_avg
  32958620 =C2=B1  1%     +10.9%   36537325 =C2=B1  2%  sched_debug.cfs_rq[=
4]:/.min_vruntime
     14.40 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.runnable_load_avg
    124108 =C2=B1333%   -1569.6%   -1823853 =C2=B1-43%  sched_debug.cfs_rq[=
4]:/.spread0
      6105 =C2=B1 41%     -84.8%     927.00 =C2=B1  4%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
    107.60 =C2=B1131%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
      1044 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.utilization_load_avg
  33720413 =C2=B1  1%     +11.8%   37704967 =C2=B1  1%  sched_debug.cfs_rq[=
50]:/.min_vruntime
     14.30 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
50]:/.runnable_load_avg
    882727 =C2=B1 56%    -174.9%    -661555 =C2=B1-148%  sched_debug.cfs_rq=
[50]:/.spread0
      4592 =C2=B1 42%     -79.8%     929.30 =C2=B1  4%  sched_debug.cfs_rq[=
50]:/.tg_load_avg
     79.60 =C2=B1 58%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
50]:/.tg_load_contrib
      1023 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
50]:/.utilization_load_avg
  33982195 =C2=B1  2%     +10.0%   37384392 =C2=B1  1%  sched_debug.cfs_rq[=
51]:/.min_vruntime
     13.80 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
51]:/.runnable_load_avg
   1144447 =C2=B1 70%    -185.8%    -982230 =C2=B1-140%  sched_debug.cfs_rq=
[51]:/.spread0
      4580 =C2=B1 42%     -79.7%     929.40 =C2=B1  4%  sched_debug.cfs_rq[=
51]:/.tg_load_avg
     73.30 =C2=B1 89%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
51]:/.tg_load_contrib
      1034 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
51]:/.utilization_load_avg
  33882830 =C2=B1  1%     +11.5%   37772722 =C2=B1  2%  sched_debug.cfs_rq[=
52]:/.min_vruntime
      2.30 =C2=B1101%   +1417.4%      34.90 =C2=B1 89%  sched_debug.cfs_rq[=
52]:/.nr_spread_over
     13.90 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
52]:/.runnable_load_avg
   1045016 =C2=B1 59%    -156.8%    -593993 =C2=B1-251%  sched_debug.cfs_rq=
[52]:/.spread0
      4574 =C2=B1 43%     -79.7%     929.60 =C2=B1  4%  sched_debug.cfs_rq[=
52]:/.tg_load_avg
     81.00 =C2=B1 62%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
52]:/.tg_load_contrib
      1033 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
52]:/.utilization_load_avg
  33766641 =C2=B1  1%     +10.8%   37427395 =C2=B1  2%  sched_debug.cfs_rq[=
53]:/.min_vruntime
      0.50 =C2=B1161%   +7160.0%      36.30 =C2=B1129%  sched_debug.cfs_rq[=
53]:/.nr_spread_over
     13.40 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
53]:/.runnable_load_avg
    928785 =C2=B1 51%    -201.1%    -939453 =C2=B1-137%  sched_debug.cfs_rq=
[53]:/.spread0
      4572 =C2=B1 42%     -79.7%     929.00 =C2=B1  4%  sched_debug.cfs_rq[=
53]:/.tg_load_avg
     61.90 =C2=B1 82%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
53]:/.tg_load_contrib
      1031 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
53]:/.utilization_load_avg
     57.90 =C2=B1 90%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
54]:/.blocked_load_avg
     14.30 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
54]:/.runnable_load_avg
   1102161 =C2=B1 63%    -191.4%   -1007920 =C2=B1-103%  sched_debug.cfs_rq=
[54]:/.spread0
      4552 =C2=B1 41%     -79.6%     930.10 =C2=B1  4%  sched_debug.cfs_rq[=
54]:/.tg_load_avg
     72.30 =C2=B1 71%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
54]:/.tg_load_contrib
      1036 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
54]:/.utilization_load_avg
  33295741 =C2=B1  1%     +13.2%   37687730 =C2=B1  2%  sched_debug.cfs_rq[=
55]:/.min_vruntime
     13.90 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
55]:/.runnable_load_avg
      4535 =C2=B1 41%     -79.5%     930.70 =C2=B1  4%  sched_debug.cfs_rq[=
55]:/.tg_load_avg
     43.10 =C2=B1 41%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
55]:/.tg_load_contrib
      1022 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
55]:/.utilization_load_avg
  32932658 =C2=B1  1%     +13.7%   37456491 =C2=B1  2%  sched_debug.cfs_rq[=
56]:/.min_vruntime
     14.00 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
56]:/.runnable_load_avg
      4466 =C2=B1 42%     -79.1%     931.50 =C2=B1  4%  sched_debug.cfs_rq[=
56]:/.tg_load_avg
     56.20 =C2=B1 67%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
56]:/.tg_load_contrib
      1040 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
56]:/.utilization_load_avg
  33099246 =C2=B1  1%     +13.6%   37609179 =C2=B1  2%  sched_debug.cfs_rq[=
57]:/.min_vruntime
     14.30 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
57]:/.runnable_load_avg
      4463 =C2=B1 42%     -79.1%     932.10 =C2=B1  4%  sched_debug.cfs_rq[=
57]:/.tg_load_avg
     67.90 =C2=B1111%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
57]:/.tg_load_contrib
      1022 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
57]:/.utilization_load_avg
  33202874 =C2=B1  1%     +13.7%   37763015 =C2=B1  2%  sched_debug.cfs_rq[=
58]:/.min_vruntime
     14.10 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
58]:/.runnable_load_avg
      4442 =C2=B1 43%     -79.0%     931.50 =C2=B1  4%  sched_debug.cfs_rq[=
58]:/.tg_load_avg
     56.00 =C2=B1 87%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
58]:/.tg_load_contrib
      1018 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
58]:/.utilization_load_avg
  33227042 =C2=B1  1%     +12.9%   37500630 =C2=B1  1%  sched_debug.cfs_rq[=
59]:/.min_vruntime
     14.10 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
59]:/.runnable_load_avg
      4458 =C2=B1 42%     -79.1%     931.50 =C2=B1  4%  sched_debug.cfs_rq[=
59]:/.tg_load_avg
     87.20 =C2=B1 79%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
59]:/.tg_load_contrib
      1032 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
59]:/.utilization_load_avg
  32955689 =C2=B1  1%     +10.4%   36384387 =C2=B1  2%  sched_debug.cfs_rq[=
5]:/.min_vruntime
     14.20 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.runnable_load_avg
    121157 =C2=B1281%   -1731.8%   -1976986 =C2=B1-52%  sched_debug.cfs_rq[=
5]:/.spread0
      6121 =C2=B1 41%     -84.9%     926.40 =C2=B1  4%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
     73.20 =C2=B1109%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.tg_load_contrib
      1031 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.utilization_load_avg
  33066767 =C2=B1  1%     +13.1%   37410400 =C2=B1  1%  sched_debug.cfs_rq[=
60]:/.min_vruntime
     13.90 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
60]:/.runnable_load_avg
      4438 =C2=B1 42%     -79.0%     931.40 =C2=B1  4%  sched_debug.cfs_rq[=
60]:/.tg_load_avg
     70.00 =C2=B1 66%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
60]:/.tg_load_contrib
      1023 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
60]:/.utilization_load_avg
  32984063 =C2=B1  1%     +14.1%   37627080 =C2=B1  2%  sched_debug.cfs_rq[=
61]:/.min_vruntime
     14.00 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
61]:/.runnable_load_avg
      4450 =C2=B1 42%     -79.1%     931.50 =C2=B1  4%  sched_debug.cfs_rq[=
61]:/.tg_load_avg
     50.40 =C2=B1117%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
61]:/.tg_load_contrib
      1041 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
61]:/.utilization_load_avg
  33050254 =C2=B1  1%     +13.3%   37442465 =C2=B1  2%  sched_debug.cfs_rq[=
62]:/.min_vruntime
     14.60 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
62]:/.runnable_load_avg
      4413 =C2=B1 43%     -78.9%     931.50 =C2=B1  4%  sched_debug.cfs_rq[=
62]:/.tg_load_avg
     49.20 =C2=B1101%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
62]:/.tg_load_contrib
      1048 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
62]:/.utilization_load_avg
  32698928 =C2=B1  1%     +13.5%   37104402 =C2=B1  2%  sched_debug.cfs_rq[=
63]:/.min_vruntime
     14.20 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
63]:/.runnable_load_avg
      4414 =C2=B1 43%     -78.9%     931.20 =C2=B1  4%  sched_debug.cfs_rq[=
63]:/.tg_load_avg
     94.00 =C2=B1 80%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
63]:/.tg_load_contrib
      1034 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
63]:/.utilization_load_avg
     67.60 =C2=B1 98%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
  32990477 =C2=B1  0%     +12.0%   36962197 =C2=B1  2%  sched_debug.cfs_rq[=
6]:/.min_vruntime
     14.00 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.runnable_load_avg
    155891 =C2=B1223%    -997.6%   -1399246 =C2=B1-70%  sched_debug.cfs_rq[=
6]:/.spread0
      6092 =C2=B1 41%     -84.8%     927.50 =C2=B1  4%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
     82.00 =C2=B1 80%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
      1027 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.utilization_load_avg
  32605157 =C2=B1  0%     +11.9%   36475757 =C2=B1  2%  sched_debug.cfs_rq[=
7]:/.min_vruntime
     14.30 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
   -229652 =C2=B1-118%    +721.1%   -1885748 =C2=B1-54%  sched_debug.cfs_rq=
[7]:/.spread0
      6053 =C2=B1 41%     -84.7%     927.70 =C2=B1  4%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
    115.40 =C2=B1138%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.tg_load_contrib
      1025 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.utilization_load_avg
    146.20 =C2=B1 94%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.blocked_load_avg
     14.40 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.runnable_load_avg
   1153532 =C2=B1 36%    -205.9%   -1221706 =C2=B1-110%  sched_debug.cfs_rq=
[8]:/.spread0
      6070 =C2=B1 40%     -84.7%     928.00 =C2=B1  4%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
    161.50 =C2=B1 86%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.tg_load_contrib
      1047 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.utilization_load_avg
    101.50 =C2=B1107%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.blocked_load_avg
     13.80 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.runnable_load_avg
   1214974 =C2=B1 27%    -206.1%   -1289293 =C2=B1-105%  sched_debug.cfs_rq=
[9]:/.spread0
      6041 =C2=B1 40%     -84.6%     927.70 =C2=B1  4%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
    115.70 =C2=B1 93%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.tg_load_contrib
      1024 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.utilization_load_avg
     59488 =C2=B1  6%      -8.9%      54223 =C2=B1  3%  sched_debug.cpu#0.n=
r_switches
    -51.70 =C2=B1-49%    +332.5%    -223.60 =C2=B1-27%  sched_debug.cpu#0.n=
r_uninterruptible
     54454 =C2=B1 10%     -16.9%      45225 =C2=B1  2%  sched_debug.cpu#10.=
nr_switches
     55931 =C2=B1 10%     -14.5%      47828 =C2=B1  1%  sched_debug.cpu#10.=
sched_count
     11485 =C2=B1 28%     -31.8%       7829 =C2=B1 10%  sched_debug.cpu#10.=
ttwu_count
    599602 =C2=B1 15%    +221.6%    1928155 =C2=B1 95%  sched_debug.cpu#11.=
avg_idle
     54031 =C2=B1 13%     -15.8%      45469 =C2=B1  1%  sched_debug.cpu#12.=
nr_switches
     55586 =C2=B1 12%     -13.6%      48034 =C2=B1  1%  sched_debug.cpu#12.=
sched_count
     53031 =C2=B1 12%     -14.8%      45161 =C2=B1  1%  sched_debug.cpu#13.=
nr_switches
     54529 =C2=B1 11%     -12.6%      47664 =C2=B1  1%  sched_debug.cpu#13.=
sched_count
     56985 =C2=B1 10%     -20.6%      45227 =C2=B1  1%  sched_debug.cpu#15.=
nr_switches
     58397 =C2=B1 10%     -17.7%      48083 =C2=B1  1%  sched_debug.cpu#15.=
sched_count
     52553 =C2=B1  8%     -13.3%      45553 =C2=B1  3%  sched_debug.cpu#16.=
nr_switches
    -17.70 =C2=B1-146%    +696.0%    -140.90 =C2=B1-43%  sched_debug.cpu#2.=
nr_uninterruptible
    647427 =C2=B1 27%    +115.4%    1394336 =C2=B1 57%  sched_debug.cpu#21.=
avg_idle
     51000 =C2=B1  6%     -11.9%      44929 =C2=B1  2%  sched_debug.cpu#23.=
nr_switches
    572574 =C2=B1 12%    +135.6%    1348829 =C2=B1 99%  sched_debug.cpu#24.=
avg_idle
      2160 =C2=B1 48%    +108.9%       4514 =C2=B1 13%  sched_debug.cpu#25.=
ttwu_local
      2032 =C2=B1 39%    +108.3%       4234 =C2=B1 12%  sched_debug.cpu#29.=
ttwu_local
    -19.90 =C2=B1-100%    +177.4%     -55.20 =C2=B1-29%  sched_debug.cpu#30=
.nr_uninterruptible
      1564 =C2=B1  6%     -38.0%     969.90 =C2=B1 19%  sched_debug.cpu#32.=
sched_goidle
      1664 =C2=B1  8%     -30.1%       1164 =C2=B1 16%  sched_debug.cpu#34.=
sched_goidle
      1538 =C2=B1  5%     -28.9%       1092 =C2=B1 12%  sched_debug.cpu#35.=
sched_goidle
      1574 =C2=B1  7%     -34.4%       1032 =C2=B1 14%  sched_debug.cpu#38.=
sched_goidle
      1536 =C2=B1  6%     -34.2%       1010 =C2=B1 17%  sched_debug.cpu#39.=
sched_goidle
    -24.70 =C2=B1-96%    +463.6%    -139.20 =C2=B1-64%  sched_debug.cpu#4.n=
r_uninterruptible
     26.00 =C2=B1 61%    +223.8%      84.20 =C2=B1 52%  sched_debug.cpu#40.=
nr_uninterruptible
      1651 =C2=B1  6%     -36.6%       1047 =C2=B1 16%  sched_debug.cpu#40.=
sched_goidle
     32.20 =C2=B1 73%    +252.8%     113.60 =C2=B1 44%  sched_debug.cpu#41.=
nr_uninterruptible
     12.70 =C2=B1219%    +593.7%      88.10 =C2=B1 42%  sched_debug.cpu#42.=
nr_uninterruptible
      1798 =C2=B1 29%     -41.6%       1049 =C2=B1 14%  sched_debug.cpu#42.=
sched_goidle
     48640 =C2=B1  5%     -10.9%      43359 =C2=B1  3%  sched_debug.cpu#44.=
nr_switches
      1824 =C2=B1 28%     -44.0%       1021 =C2=B1 15%  sched_debug.cpu#44.=
sched_goidle
     20.90 =C2=B1127%    +413.4%     107.30 =C2=B1 50%  sched_debug.cpu#46.=
nr_uninterruptible
     50974 =C2=B1  6%     -14.7%      43456 =C2=B1  2%  sched_debug.cpu#47.=
nr_switches
     52332 =C2=B1  5%     -12.6%      45741 =C2=B1  2%  sched_debug.cpu#47.=
sched_count
      8480 =C2=B1 16%     -27.1%       6183 =C2=B1 14%  sched_debug.cpu#47.=
ttwu_count
      1752 =C2=B1 30%     -47.0%     929.20 =C2=B1 20%  sched_debug.cpu#48.=
sched_goidle
      1551 =C2=B1  5%     -40.1%     928.40 =C2=B1 15%  sched_debug.cpu#49.=
sched_goidle
     -8.80 =C2=B1-224%    +998.9%     -96.70 =C2=B1-31%  sched_debug.cpu#5.=
nr_uninterruptible
     47186 =C2=B1  8%     -10.5%      42238 =C2=B1  0%  sched_debug.cpu#52.=
nr_switches
      1597 =C2=B1  7%     -42.5%     918.00 =C2=B1 12%  sched_debug.cpu#52.=
sched_goidle
     48232 =C2=B1 14%     -11.5%      42688 =C2=B1  1%  sched_debug.cpu#54.=
nr_switches
      1737 =C2=B1 26%     -42.1%       1006 =C2=B1 17%  sched_debug.cpu#54.=
sched_goidle
      1535 =C2=B1  6%     -38.0%     952.20 =C2=B1 20%  sched_debug.cpu#57.=
sched_goidle
      4249 =C2=B1 16%     +39.0%       5908 =C2=B1 11%  sched_debug.cpu#57.=
ttwu_count
      1625 =C2=B1 34%    +147.4%       4021 =C2=B1 11%  sched_debug.cpu#57.=
ttwu_local
      1512 =C2=B1  8%     -37.1%     951.20 =C2=B1 15%  sched_debug.cpu#58.=
sched_goidle
    589918 =C2=B1 15%    +245.0%    2035501 =C2=B1 96%  sched_debug.cpu#59.=
avg_idle
      1556 =C2=B1  7%     -40.2%     931.20 =C2=B1 17%  sched_debug.cpu#59.=
sched_goidle
    -32.60 =C2=B1-68%    +234.0%    -108.90 =C2=B1-39%  sched_debug.cpu#6.n=
r_uninterruptible
    594465 =C2=B1 14%    +253.1%    2098981 =C2=B1 99%  sched_debug.cpu#60.=
avg_idle
      1705 =C2=B1 45%    +159.6%       4426 =C2=B1 44%  sched_debug.cpu#60.=
ttwu_local
      7.90 =C2=B1336%    +793.7%      70.60 =C2=B1 71%  sched_debug.cpu#62.=
nr_uninterruptible
      2970 =C2=B1 97%     -70.3%     881.90 =C2=B1 20%  sched_debug.cpu#62.=
sched_goidle
    602163 =C2=B1 13%    +171.4%    1634404 =C2=B1103%  sched_debug.cpu#63.=
avg_idle
      1546 =C2=B1  7%     -43.8%     869.80 =C2=B1 14%  sched_debug.cpu#63.=
sched_goidle
     54314 =C2=B1  6%     -17.3%      44902 =C2=B1  1%  sched_debug.cpu#8.n=
r_switches
     55818 =C2=B1  6%     -14.8%      47540 =C2=B1  1%  sched_debug.cpu#8.s=
ched_count
      3396 =C2=B1 32%     -45.3%       1858 =C2=B1 30%  sched_debug.cpu#8.s=
ched_goidle
     11177 =C2=B1 18%     -32.2%       7577 =C2=B1  9%  sched_debug.cpu#8.t=
twu_count


lkp-nex04: Nehalem-EX
Memory: 256G


                         ebizzy.throughput.per_thread.max

  150 ++----------------------O---------O----------------------------------=
-+
      |                          O O         O O O  O                      =
 |
  145 O+O              O O  O        O    O                                =
 |
  140 ++   O O  O O O                                                      =
 |
      |                                                                    =
 |
  135 ++                                                                   =
 |
      |                                                                    =
 |
  130 ++                                                                   =
 |
      |                                                                    =
 |
  125 ++                                                                   =
 |
  120 ++*..      .*.*..*.*..*.*..*.*.*..*.*..                          *.. =
 |
      *    *.*..*                            *. .*..*.*..*.*..*.*.*.. :    =
 |
  115 ++                                       *                      :   *=
.*
      |                                                              *     =
 |
  110 ++-------------------------------------------------------------------=
-+


                    ebizzy.throughput.per_thread.stddev_percent

  0.13 ++------------------------------------------------------------------=
-+
       |                       O    O   O    O O  O O                      =
 |
  0.12 O+     O             O    O    O    O                               =
 |
  0.11 ++O  O    O O O  O O                                                =
 |
       |                                                                   =
 |
   0.1 ++                                                                  =
 |
  0.09 ++                                                                  =
 |
       |                                                                   =
 |
  0.08 ++                                                                  =
 |
  0.07 ++                                                                  =
 |
       |                                                            .*.    =
 |
  0.06 *+*..*.*..                      .*..                      .*.   *.. =
 |
  0.05 ++        *.*.*..*.*.*..*.*..*.*    *.*.  .*.*..*.*.*..*.*          =
.*
       |                                       *.                         *=
 |
  0.04 ++------------------------------------------------------------------=
-+


                       ebizzy.time.involuntary_context_switches

  5.25e+06 ++-------------------------------------------------------------*=
-+
   5.2e+06 *+*.  .*.*.*.*.. .*.*.*..*.*.*.*..*.*.*.*..*.*.*.*..*.*.*    *  =
 *
           |   *.          *                                        :  +   =
 |
  5.15e+06 ++                                                       : +    =
 |
   5.1e+06 ++                                                        *     =
 |
  5.05e+06 ++                                                              =
 |
     5e+06 ++                                                              =
 |
           |                                                               =
 |
  4.95e+06 ++                                                              =
 |
   4.9e+06 ++                                                              =
 |
  4.85e+06 ++                           O O                                =
 |
   4.8e+06 ++O O               O O  O O        O   O                       =
 |
           |        O O O  O O               O   O    O                    =
 |
  4.75e+06 O+     O                                                        =
 |
   4.7e+06 ++--------------------------------------------------------------=
-+


                         sched_debug.cfs_rq[0]:/.tg_load_avg

  14000 ++-----------------------------------------------------------------=
-+
        |                                                                 *=
 |
  12000 ++                                                                :=
 |
        |                                                                : =
:|
  10000 ++                                                               : =
:|
        |                                                               :  =
:|
   8000 ++                                                              :  =
:|
        |                                       *                      :   =
 |
   6000 ++      .*..*.                  .*.*.. + +  .*   *..   .*..   .*   =
 *
        *.*..*.*      *.  .*.*.*..*.*.*.      *   *.  + +   *.*    *.*     =
 |
   4000 ++              *.                             *                   =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq[1]:/.tg_load_avg

  14000 ++----------------------------------------------------------------*=
-+
        |                                                                 :=
 |
  12000 ++                                                               : =
:|
        |                                                                : =
:|
  10000 ++                                                               : =
:|
        |                                                               :  =
:|
   8000 ++                                                              :  =
 |
        |                                                              :   =
 |
   6000 ++      .*..*.                  .*.    .*.  .*   *..   .*..   .*   =
 *
        *.*..*.*      *.  .*.*.*..*.*.*.   *..*   *.  + +   *.*    *.*     =
 |
   4000 ++              *.                             *                   =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq[2]:/.tg_load_avg

  14000 ++----------------------------------------------------------------*=
-+
        |                                                                 :=
 |
  12000 ++                                                               : =
:|
        |                                                                : =
:|
  10000 ++                                                               : =
:|
        |                                                               :  =
:|
   8000 ++                                                              :  =
 |
        |                                                              :   =
 |
   6000 ++      .*..*.                  .*.    .*.  .*   *..   .*..   .*   =
 *
        *.*..*.*      *.  .*.*.*..*.*.*.   *..*   *.  + +   *.*    *.*     =
 |
   4000 ++              *.                             *                   =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq[3]:/.tg_load_avg

  14000 ++----------------------------------------------------------------*=
-+
        |                                                                 :=
 |
  12000 ++                                                               : =
:|
        |                                                                : =
:|
  10000 ++                                                               : =
:|
        |                                                               :  =
:|
   8000 ++                                                              :  =
 |
        |                                       *                      :   =
 |
   6000 ++      .*..*.                  .*.    + +  .*   *..   .*..   .*   =
 *
        *.*..*.*      *.    .*.*..*.*.*.   *..*   *.  + +   *.*    *.*     =
 |
   4000 ++              *..*                           *                   =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq[4]:/.tg_load_avg

  14000 ++----------------------------------------------------------------*=
-+
        |                                                                 :=
 |
  12000 ++                                                               : =
:|
        |                                                                : =
:|
  10000 ++                                                               : =
:|
        |                                                               :  =
:|
   8000 ++                                                              :  =
 |
        |                                       *                      :   =
 |
   6000 ++      .*..*.                  .*.    + +  .*   *..   .*..   .*   =
 *
        *.*..*.*      *.    .*.*..*.*.*.   *..*   *.  + +   *.*    *.*     =
 |
   4000 ++              *..*                           *                   =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq[5]:/.tg_load_avg

  14000 ++----------------------------------------------------------------*=
-+
        |                                                                 :=
 |
  12000 ++                                                               : =
:|
        |                                                                : =
:|
  10000 ++                                                               : =
:|
        |                                                               :  =
:|
   8000 ++                                                              :  =
 |
        |                                                              :   =
 |
   6000 ++      .*..*.                  .*.    .*.  .*   *..   .*..   .*   =
 *
        *.*..*.*      *.    .*.*..*.*.*.   *..*   *.  + +   *.*    *.*     =
 |
   4000 ++              *..*                           *                   =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq[6]:/.tg_load_avg

  14000 ++-----------------------------------------------------------------=
-+
        |                                                                 *=
 |
  12000 ++                                                                :=
 |
        |                                                                : =
:|
  10000 ++                                                               : =
:|
        |                                                               :  =
:|
   8000 ++                                                              :  =
:|
        |                                                              :   =
 |
   6000 ++      .*..*.                  .*.    .*.  .*   *..   .*..   .*   =
 *
        *.*..*.*      *.    .*.*..*.*.*.   *..*   *.  + +   *.*    *.*     =
 |
   4000 ++              *..*                           *                   =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq[7]:/.tg_load_avg

  14000 ++-----------------------------------------------------------------=
-+
        |                                                                 *=
 |
  12000 ++                                                                :=
 |
        |                                                                : =
:|
  10000 ++                                                               : =
:|
        |                                                               :  =
:|
   8000 ++                                                              :  =
:|
        |                                                              :   =
 |
   6000 ++      .*..*.                  .*.    .*.  .*   *..   .*..   .*   =
 *
        *.*..*.*      *.    .*.*..*.*.*.   *..*   *.  + +   *.*    *.*     =
 |
   4000 ++              *..*                           *                   =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq[8]:/.tg_load_avg

  14000 ++-----------------------------------------------------------------=
-+
        |                                                                 *=
 |
  12000 ++                                                                :=
 |
        |                                                                : =
:|
  10000 ++                                                               : =
:|
        |                                                               :  =
:|
   8000 ++                                                              :  =
:|
        |                                                              :   =
 |
   6000 ++      .*..*.                  .*.    .*.  .*   *..   .*..   .*   =
 *
        *.*..*.*      *.    .*.*..*.*.*.   *..*   *.  + +   *.*    *.*     =
 |
   4000 ++              *..*                           *                   =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq[9]:/.tg_load_avg

  14000 ++-----------------------------------------------------------------=
-+
        |                                                                 *=
 |
  12000 ++                                                                :=
 |
        |                                                                : =
:|
  10000 ++                                                               : =
:|
        |                                                               :  =
:|
   8000 ++                                                              :  =
:|
        |                                                              :   =
 |
   6000 ++      .*..*.        .*..             .*.  .*   *..   .*..   .*   =
 *
        *.*..*.*      *.    .*    *.*.*..*.*..*   *.  + +   *.*    *.*     =
 |
   4000 ++              *..*                           *                   =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[10]:/.tg_load_avg

  14000 ++-----------------------------------------------------------------=
-+
        |                                                                 *=
 |
  12000 ++                                                                :=
 |
        |                                                                : =
:|
  10000 ++                                                               : =
:|
        |                                                                : =
:|
   8000 ++                                                              :  =
:|
        |                                                               :  =
 |
   6000 ++       *..*.        .*..             .*.  .*   *..           :   =
 *
        *.*..*. +     *.    .*    *.*.*..*.*..*   *.  + +   *.*.*..*.*.*   =
 |
   4000 ++     *        *..*                           *                   =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[11]:/.tg_load_avg

  14000 ++-----------------------------------------------------------------=
-+
        |                                                                 *=
 |
  12000 ++                                                                :=
 |
        |                                                                : =
:|
  10000 ++                                                               : =
:|
        |                                                                : =
:|
   8000 ++                                                              :  =
:|
        |                                                               :  =
 |
   6000 ++       *..*.        .*..             .*.  .*                  :  =
 *
        *.*..*. +     *.    .*    *.*.*..*.*..*   *.  + .*..*. .*..*.*.:   =
 |
   4000 ++     *        *..*                           *      *        *   =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[12]:/.tg_load_avg

  14000 ++-----------------------------------------------------------------=
-+
        |                                                                 *=
 |
  12000 ++                                                                :=
 |
        |                                                                : =
:|
  10000 ++                                                               : =
:|
        |                                                                : =
:|
   8000 ++                                                              :  =
:|
        |                                                               :  =
 |
   6000 ++       *..*.        .*..             .*.  .*                  :  =
 *
        *.*..*. +     *.    .*    *.*.*..*.*..*   *.  + .*..*. .*..*.*.:   =
 |
   4000 ++     *        *..*                           *      *        *   =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[13]:/.tg_load_avg

  14000 ++-----------------------------------------------------------------=
-+
        |                                                                 *=
 |
  12000 ++                                                                :=
 |
        |                                                                : =
:|
  10000 ++                                                               : =
:|
        |                                                                : =
:|
   8000 ++                                                              :  =
:|
        |                                                               :  =
 |
   6000 ++       *..*.         *..                  .*                  :  =
 *
        *.*..*. +     *.      +   *.*.*..*.*..*.*.*.  + .*..   .*..*.*.:   =
 |
   4000 ++     *        *..*.*                         *    *.*        *   =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[14]:/.tg_load_avg

  14000 ++-----------------------------------------------------------------=
-+
        |                                                                 *=
 |
  12000 ++                                                                :=
 |
        |                                                                : =
:|
  10000 ++                                                               : =
:|
        |                                                                : =
:|
   8000 ++                                                              :  =
:|
        |                                                               :  =
 |
   6000 ++       *..*.        .*..                  .*                  :  =
 *
        *.*..*. +     *.    .*    *.*.*..*.*..*.*.*.  + .*..   .*..*.*.:   =
 |
   4000 ++     *        *..*                           *    *.*        *   =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[15]:/.tg_load_avg

  14000 ++-----------------------------------------------------------------=
-+
        |                                                                 *=
 |
  12000 ++                                                                :=
 |
        |                                                                : =
:|
  10000 ++                                                               : =
:|
        |                                                                : =
:|
   8000 ++                                                              :  =
:|
        |                                                               :  =
 |
   6000 ++       *..*.        .*..                  .*                  :  =
 *
        *.*..*. +     *.    .*     .*.*..*.*..*.*.*.  + .*..   .*..*.*.:   =
 |
   4000 ++     *        *..*      *                    *    *.*        *   =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[16]:/.tg_load_avg

  14000 ++-----------------------------------------------------------------=
-+
        |                                                                 *=
 |
  12000 ++                                                                :=
 |
        |                                                                : =
:|
  10000 ++                                                               : =
:|
        |                                                                : =
:|
   8000 ++                                                              :  =
:|
        |                                                               :  =
 |
   6000 ++       *..*.         *..                  .*                  :  =
 |
        *.*..*. +     *.      +    .*.*..*.*..*.*.*.  + .*..   .*..*.*.:   =
 *
   4000 ++     *        *..*.*    *                    *    *.*        *   =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[17]:/.tg_load_avg

  14000 ++-----------------------------------------------------------------=
-+
        |                                                                 *=
 |
  12000 ++                                                                :=
 |
        |                                                                : =
:|
  10000 ++                                                               : =
:|
        |                                                                : =
:|
   8000 ++                                                              :  =
:|
        |                                                               :  =
 |
   6000 ++         .*.         *..                  .*                  :  =
 |
        *.*..   .*.   *.      +      .*..*.*.. .*.*.  + .*..   .*.. .*.:   =
 *
   4000 ++   *.*        *..*.*    *.*         *        *    *.*    *   *   =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[18]:/.tg_load_avg

  14000 ++-----------------------------------------------------------------=
-+
        |                                                                 *=
 |
  12000 ++                                                                :=
 |
        |                                                                : =
:|
  10000 ++                                                               : =
:|
        |                                                                : =
:|
   8000 ++                                                              :  =
:|
        |                                                               :  =
 |
   6000 ++         .*          *..                                      :  =
 |
        *.*..   .*.  +        +    .*.*..*.*..*.*.*..*. .*..   .*.. .*.:   =
 *
   4000 ++   *.*      *.*..*.*    *                    *    *.*    *   *   =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[19]:/.tg_load_avg

  14000 ++-----------------------------------------------------------------=
-+
        |                                                                 *=
 |
  12000 ++                                                                :=
 |
        |                                                                : =
:|
  10000 ++                                                               : =
:|
        |                                                                : =
:|
   8000 ++                                                              :  =
:|
        |                                                               :  =
 |
   6000 ++         .*          *..                                      :  =
 |
        *.*..   .*.  +        +    .*.*..*.*.. .*.*..*. .*..   .*.. .*.:   =
 *
   4000 ++   *.*      *.*..*.*    *           *        *    *.*    *   *   =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[20]:/.tg_load_avg

  14000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  12000 ++                                                                *=
 |
        |                                                                 :=
 |
  10000 ++                                                               : =
:|
        |                                                                : =
:|
   8000 ++                                                               : =
:|
        |                                                               :  =
:|
   6000 ++                                                              :  =
 |
        *.      .*..*.        .*.. .*.*..*.*.. .*.*..*. .*..   .*.. .*.:   =
 *
   4000 ++*..*.*      *.*..*.*    *           *        *    *.*    *   *   =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[21]:/.tg_load_avg

  14000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  12000 ++                                                                *=
 |
        |                                                                 :=
 |
  10000 ++                                                               : =
:|
        |                                                                : =
:|
   8000 ++                                                              :  =
:|
        |                                                               :  =
:|
   6000 ++                     *..                                     :   =
 |
        *.*..   .*..*.        +    .*.*..*.*.. .*.*..*. .*..   .*.. .*.*   =
 *
   4000 ++   *.*      *.*..*.*    *           *        *    *.*    *       =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[22]:/.tg_load_avg

  14000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  12000 ++                                                                *=
 |
        |                                                                 :=
 |
  10000 ++                                                               : =
:|
        |                                                                : =
:|
   8000 ++                                                              :  =
:|
        |                                                               :  =
:|
   6000 ++                     *..                                     :   =
 |
        *.*..   .*..*.        +    .*.*..*.*.. .*.*..*. .*..   .*.. .*.*   =
 *
   4000 ++   *.*      *.*..*.*    *           *        *    *.*    *       =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[23]:/.tg_load_avg

  14000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  12000 ++                                                                *=
 |
        |                                                                 :=
 |
  10000 ++                                                               : =
:|
        |                                                                : =
:|
   8000 ++                                                              :  =
:|
        |                                                               :  =
:|
   6000 ++                     *..                                     :   =
 |
        *.*..   .*..*.        +    .*.*..*.*.. .*.*..*. .*..   .*.. .*.*   =
 *
   4000 ++   *.*      *.*..*.*    *           *        *    *.*    *       =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[24]:/.tg_load_avg

  14000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  12000 ++                                                                *=
 |
        |                                                                 :=
 |
  10000 ++                                                               : =
:|
        |                                                                : =
:|
   8000 ++                                                               : =
:|
        |                                                               :  =
:|
   6000 ++                     *..                                      :  =
 |
        *.*..   .*..*.        +    .*.*..*.*.. .*.*..*   *..   .*.. .*.:   =
 *
   4000 ++   *.*      *.*..*.*    *           *       + +   *.*    *   *   =
 |
        |                                              *                   =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[25]:/.tg_load_avg

  14000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  12000 ++                                                                *=
 |
        |                                                                 :=
 |
  10000 ++                                                               : =
:|
        |                                                                : =
:|
   8000 ++                                                               : =
:|
        |                                                               :  =
:|
   6000 ++                     *..                                      :  =
 |
        |.*..   .*..*.        +    .*.*..*.*.. .*.*..*   *..   .*.. .*.:   =
 *
   4000 *+   *.*      *.*..*.*    *           *       + +   *.*    *   *   =
 |
        |                                              *                   =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[26]:/.tg_load_avg

  14000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  12000 ++                                                                *=
 |
        |                                                                 :=
 |
  10000 ++                                                               : =
:|
        |                                                                : =
:|
   8000 ++                                                               : =
:|
        |                                                               :  =
:|
   6000 ++                                                              :  =
 |
        |.*..   .*..*.        .*.. .*.*..*.*.. .*.*..*   *..   .*.. .*.:   =
 *
   4000 *+   *.*      *.*..*.*    *           *       + +   *.*    *   *   =
 |
        |                                              *                   =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[27]:/.tg_load_avg

  14000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  12000 ++                                                                *=
 |
        |                                                                 :=
 |
  10000 ++                                                               : =
:|
        |                                                                : =
:|
   8000 ++                                                               : =
:|
        |                                                               :  =
:|
   6000 ++                                                              :  =
 |
        |.*..   .*..*.        .*.. .*.*..*.*.. .*.*..*   *..   .*.. .*.:   =
 *
   4000 *+   *.*      *.*..*.*    *           *       + +   *.*    *   *   =
 |
        |                                              *                   =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[28]:/.tg_load_avg

  14000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  12000 ++                                                                *=
 |
        |                                                                 :=
 |
  10000 ++                                                               : =
:|
        |                                                                : =
:|
   8000 ++                                                               : =
:|
        |                                                               :  =
:|
   6000 ++                                                              :  =
 |
        |.*..   .*..*.        .*.. .*.  .*.*.. .*.*..*. .*..   .*.. .*.:   =
 *
   4000 *+   *.*      *.*..*.*    *   *.      *        *    *.*    *   *   =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[29]:/.tg_load_avg

  14000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  12000 ++                                                                *=
 |
        |                                                                 :=
 |
  10000 ++                                                               : =
:|
        |                                                                : =
:|
   8000 ++                                                               : =
:|
        |                                                               :  =
:|
   6000 ++                                                              :  =
 |
        |       .*..*.        .*.. .*.  .*.*.. .*.*..*. .*..   .*.. .*.:   =
 *
   4000 *+*..*.*      *.*..*.*    *   *.      *        *    *.*    *   *   =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        O O  O O O  O O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[30]:/.tg_load_avg

  12000 ++----------------------------------------------------------------*=
-+
        |                                                                 :=
 |
  10000 ++                                                               : =
:|
        |                                                                : =
:|
        |                                                                : =
:|
   8000 ++                                                              :  =
:|
        |                                                               :  =
 |
   6000 ++                                                              :  =
 |
        |       .*..*.        .*..      .*.    .*.*..*   *..   .*.. .*.:   =
 *
   4000 *+*..*.*      *.*..*.*    *.*.*.   *..*       + +   *.*    *   *   =
 |
        |                                              *                   =
 |
        |                                                                  =
 |
   2000 ++          O                                                      =
 |
        O O  O O O    O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[31]:/.tg_load_avg

  12000 ++----------------------------------------------------------------*=
-+
        |                                                                 :=
 |
  10000 ++                                                               : =
:|
        |                                                                : =
:|
        |                                                                : =
:|
   8000 ++                                                              :  =
:|
        |                                                               :  =
 |
   6000 ++                                                              :  =
 |
        |       .*..*.        .*..      .*.    .*.*..*   *..   .*.. .*.:   =
 *
   4000 *+*..*.*      *.  .*.*    *.*.*.   *..*       + +   *.*    *   *   =
 |
        |               *.                             *                   =
 |
        |                                                                  =
 |
   2000 ++          O                                                      =
 |
        O O  O O O    O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[32]:/.tg_load_avg

  12000 ++----------------------------------------------------------------*=
-+
        |                                                                 :=
 |
  10000 ++                                                               : =
:|
        |                                                                : =
:|
        |                                                                : =
:|
   8000 ++                                                              :  =
:|
        |                                                               :  =
 |
   6000 ++                                                              :  =
 |
        |       .*..          .*..             .*.*..*   *..   .*.. .*.:   =
 *
   4000 *+*..*.*    *.*.  .*.*    *.*.*..*.*..*       + +   *.*    *   *   =
 |
        |               *.                             *                   =
 |
        |                                                                  =
 |
   2000 ++          O                                                      =
 |
        O O  O O O    O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[33]:/.tg_load_avg

  12000 ++----------------------------------------------------------------*=
-+
        |                                                                 :=
 |
  10000 ++                                                               ::=
 |
        |                                                                : =
:|
        |                                                                : =
:|
   8000 ++                                                              :  =
:|
        |                                                               :  =
:|
   6000 ++                                                              :  =
 |
        |                     .*..             .*.*..*   *..   .*.. .*.:   =
 |
   4000 *+*..*.*.*..*.*.  .*.*    *.*.*..*.*..*       + +   *.*    *   *   =
 *
        |               *.                             *                   =
 |
        |                                                                  =
 |
   2000 ++          O                                                      =
 |
        O O  O O O    O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[34]:/.tg_load_avg

  12000 ++----------------------------------------------------------------*=
-+
        |                                                                 :=
 |
  10000 ++                                                               ::=
 |
        |                                                                : =
:|
        |                                                                : =
:|
   8000 ++                                                              :  =
:|
        |                                                               :  =
:|
   6000 ++                                                              :  =
 |
        |                     .*..             .*.*..*   *..   .*..    :   =
 |
   4000 *+*..*.*.*..*.*.  .*.*    *.*.*..*.*..*       + +   *.*    *.*.*   =
 *
        |               *.                             *                   =
 |
        |                                                                  =
 |
   2000 ++          O                                                      =
 |
        O O  O O O    O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[35]:/.tg_load_avg

  12000 ++----------------------------------------------------------------*=
-+
        |                                                                 :=
 |
  10000 ++                                                               ::=
 |
        |                                                                : =
:|
        |                                                                : =
:|
   8000 ++                                                              :  =
:|
        |                                                               :  =
:|
   6000 ++                                                              :  =
 |
        |       .*..          .*..             .*.*..*   *..           :   =
 |
   4000 *+  .*.*    *.*.  .*.*    *.*.*..*.*..*       + +   *.*.*..*.*.*   =
 *
        | *.            *.                             *                   =
 |
        |                                                                  =
 |
   2000 ++          O                                                      =
 |
        O O  O O O    O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[36]:/.tg_load_avg

  12000 ++----------------------------------------------------------------*=
-+
        |                                                                 :=
 |
  10000 ++                                                               ::=
 |
        |                                                                : =
:|
        |                                                                : =
:|
   8000 ++                                                              :  =
:|
        |                                                               :  =
:|
   6000 ++                                                              :  =
 |
        |       .*..           *..             .*.  .*   *..           :   =
 |
   4000 *+  .*.*    *.    .*. +   *.*.*..*.*..*   *.  + +   *.*.*..*.*.*   =
 *
        | *.          *.*.   *                         *                   =
 |
        |                                                                  =
 |
   2000 ++          O                                                      =
 |
        O O  O O O    O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[37]:/.tg_load_avg

  12000 ++-----------------------------------------------------------------=
-+
        |                                                                 *=
 |
  10000 ++                                                                :=
 |
        |                                                                : =
:|
        |                                                                : =
:|
   8000 ++                                                               : =
:|
        |                                                               :  =
:|
   6000 ++                                                              :  =
 |
        |       .*..           *..             .*.  .*   *..           :   =
 |
   4000 *+  .*.*    *.    .*. +   *.*.*..*.*..*   *.  + +   *.*.*..*.*.*   =
 *
        | *.          *.*.   *                         *                   =
 |
        |                                                                  =
 |
   2000 ++          O                                                      =
 |
        O O  O O O    O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[38]:/.tg_load_avg

  12000 ++-----------------------------------------------------------------=
-+
        |                                                                 *=
 |
  10000 ++                                                                :=
 |
        |                                                                : =
:|
        |                                                                : =
:|
   8000 ++                                                               : =
:|
        |                                                               :  =
:|
   6000 ++                                                              :  =
 |
        |       .*..           *..                  .*   *..           :   =
 |
   4000 *+*..*.*    *.    .*. +   *.*.*.. .*..*.*.*.  + +   *.*.*..*.*.*   =
 *
        |             *.*.   *           *             *                   =
 |
        |                                                                  =
 |
   2000 ++          O                                                      =
 |
        O O  O O O    O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[39]:/.tg_load_avg

  12000 ++-----------------------------------------------------------------=
-+
        |                                                                 *=
 |
  10000 ++                                                                :=
 |
        |                                                                : =
:|
        |                                                                : =
:|
   8000 ++                                                               : =
:|
        |                                                               :  =
:|
   6000 ++                     *..                                      :  =
 |
        |                     :                          *..            :  =
 |
   4000 *+*..*.*.*..*.    .*. :   *.*.*.. .*..*. .*..*. +   *.*.*..*.*.:   =
 *
        |             *.*.   *           *      *      *               *   =
 |
        |                                                                  =
 |
   2000 ++          O                                                      =
 |
        O O  O O O    O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[40]:/.tg_load_avg

  12000 ++-----------------------------------------------------------------=
-+
        |                                                                 *=
 |
  10000 ++                                                                :=
 |
        |                                                                : =
:|
        |                                                                : =
:|
   8000 ++                                                               : =
:|
        |                                                               :  =
:|
   6000 ++                     *..                                      :  =
 |
        |       .*..          :                          *..            :  =
 |
   4000 *+*..*.*    *.    .*. :   *.*.*.. .*..*. .*..*. +   *.*.*..*.*.:   =
 *
        |             *.*.   *           *      *      *               *   =
 |
        |                                                                  =
 |
   2000 ++          O                                                      =
 |
        O O  O O O    O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[41]:/.tg_load_avg

  12000 ++-----------------------------------------------------------------=
-+
        |                                                                 *=
 |
  10000 ++                                                                :=
 |
        |                                                                : =
:|
        |                                                                : =
:|
   8000 ++                                                               : =
:|
        |                                                               :  =
:|
   6000 ++                     *..                                      :  =
 |
        |       .*..          :                          *..            :  =
 |
   4000 *+    .*    *.    .*. :   *.*.*.. .*..*. .*..*. +   *.*.*..*.*.:   =
 *
        | *..*        *.*.   *           *      *      *               *   =
 |
        |                                                                  =
 |
   2000 ++          O                                                      =
 |
        O O  O O O    O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[42]:/.tg_load_avg

  12000 ++-----------------------------------------------------------------=
-+
        |                                                                 *=
 |
  10000 ++                                                                :=
 |
        |                                                                : =
:|
        |                                                                : =
:|
   8000 ++                                                               : =
:|
        |                                                               :  =
:|
   6000 ++                                                              :  =
 |
        |                      *..                       *..            :  =
 |
   4000 *+    .*.*..*.    .*. +   *.*.*.. .*..*. .*..*. +   *.*.*..*.*.:   =
 *
        | *..*        *.*.   *           *      *      *               *   =
 |
        |                                                                  =
 |
   2000 ++          O                                                      =
 |
        O O  O O O    O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[43]:/.tg_load_avg

  12000 ++-----------------------------------------------------------------=
-+
        |                                                                 *=
 |
  10000 ++                                                                :=
 |
        |                                                                : =
:|
        |                                                                : =
:|
   8000 ++                                                               : =
:|
        |                                                               :  =
:|
   6000 ++                                                              :  =
 |
        |                      *..                                      :  =
 |
   4000 *+      .*..*.    .*. +   *.*.*.. .*..*. .*..*. .*..*.*.*..*.*.:   =
 *
        | *..*.*      *.*.   *           *      *      *               *   =
 |
        |                                                                  =
 |
   2000 ++          O                                                      =
 |
        O O  O O O    O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[44]:/.tg_load_avg

  12000 ++-----------------------------------------------------------------=
-+
        |                                                                 *=
 |
  10000 ++                                                                :=
 |
        |                                                                : =
:|
        |                                                                : =
:|
   8000 ++                                                               : =
:|
        |                                                               :  =
:|
   6000 ++                                                              :  =
 |
        |                      *..                                      :  =
 |
   4000 *+*..   .*..*.    .*. +   *.*.*.. .*..*. .*..*. .*..*.*.*..*.*.:   =
 *
        |    *.*      *.*.   *           *      *      *               *   =
 |
        |                                                                  =
 |
   2000 ++          O                                                      =
 |
        O O  O O O    O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[45]:/.tg_load_avg

  12000 ++-----------------------------------------------------------------=
-+
        |                                                                 *=
 |
  10000 ++                                                                :=
 |
        |                                                                : =
:|
        |                                                                : =
:|
   8000 ++                                                               : =
:|
        |                                                               :  =
:|
   6000 ++                                                              :  =
 |
        |                      *..                                      :  =
 |
   4000 *+*..   .*..*.    .*. +   *.*.*.. .*..   .*..*. .*..*.*.*..*.*.:   =
 *
        |    *.*      *.*.   *           *    *.*      *               *   =
 |
        |                                                                  =
 |
   2000 ++          O                                                      =
 |
        O O  O O O    O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[46]:/.tg_load_avg

  12000 ++-----------------------------------------------------------------=
-+
        |                                                                 *=
 |
  10000 ++                                                                :=
 |
        |                                                                : =
:|
        |                                                                : =
:|
   8000 ++                                                               : =
:|
        |                                                               :  =
:|
   6000 ++                                                              :  =
 |
        |                      *..                                      :  =
 |
   4000 *+      .*..*.    .*. +   *.*.*.. .*..   .*..*. .*..*.*.*..*.*.:   =
 *
        | *..*.*      *.*.   *           *    *.*      *               *   =
 |
        |                                                                  =
 |
   2000 ++          O                                                      =
 |
        O O  O O O    O O  O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[47]:/.tg_load_avg

  11000 ++-----------------------------------------------------------------=
-+
  10000 ++                                                                *=
 |
        |                                                                 :=
 |
   9000 ++                                                               : =
:|
   8000 ++                                                               : =
:|
   7000 ++                                                               : =
:|
   6000 ++                                                              :  =
:|
        |                      *..                                      :  =
 |
   5000 ++       *..*.        +    .*.            *..*   *..           :   =
 |
   4000 *+*..   +     *.  .*.*    *   *..*.*..*. +    + +   *.*.*..*.*.*   =
 *
   3000 ++   *.*        *.                      *      *                   =
 |
   2000 ++                                                                 =
 |
        |           O   O                                                  =
 |
   1000 O+O  O O O    O    O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[48]:/.tg_load_avg

  11000 ++-----------------------------------------------------------------=
-+
  10000 ++                                                                *=
 |
        |                                                                 :=
 |
   9000 ++                                                               : =
:|
   8000 ++                                                               : =
:|
   7000 ++                                                               : =
:|
   6000 ++                                                              :  =
:|
        |                      *..                                      :  =
 |
   5000 ++       *..*.        +    .*.            *..    *..           :   =
 |
   4000 *+*..   +     *.  .*.*    *   *..*.*..*. +   *. +   *.*.*..*.*.*   =
 *
   3000 ++   *.*        *.                      *      *                   =
 |
   2000 ++                                                                 =
 |
        |           O   O                                                  =
 |
   1000 O+O  O O O    O    O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[49]:/.tg_load_avg

  11000 ++-----------------------------------------------------------------=
-+
  10000 ++                                                                *=
 |
        |                                                                 :=
 |
   9000 ++                                                               : =
:|
   8000 ++                                                               : =
:|
   7000 ++                                                               : =
:|
   6000 ++                                                              :  =
:|
        |                      *..                                      :  =
 |
   5000 ++       *..*.        +    .*.            *..   .*..           :   =
 |
   4000 *+*..   +     *.  .*.*    *   *..*.*..*. +   *.*    *.*.*..*.*.*   =
 *
   3000 ++   *.*        *.                      *                          =
 |
   2000 ++                                                                 =
 |
        |           O   O                                                  =
 |
   1000 O+O  O O O    O    O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[50]:/.tg_load_avg

  11000 ++-----------------------------------------------------------------=
-+
  10000 ++                                                                *=
 |
        |                                                                 :=
 |
   9000 ++                                                               : =
:|
   8000 ++                                                               : =
:|
   7000 ++                                                               : =
:|
   6000 ++                                                              :  =
:|
        |                      *..                                      :  =
 |
   5000 ++       *..*.        +                   *..*. .*..            :  =
 |
   4000 *+*..   +     *.  .*.*    *.*.*..*.*..*. +     *    *.*.*..*.*.:   =
 *
   3000 ++   *.*        *.                      *                      *   =
 |
   2000 ++                                                                 =
 |
        |           O   O                                                  =
 |
   1000 O+O  O O O    O    O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[51]:/.tg_load_avg

  11000 ++-----------------------------------------------------------------=
-+
  10000 ++                                                                *=
 |
        |                                                                 :=
 |
   9000 ++                                                               : =
:|
   8000 ++                                                               : =
:|
   7000 ++                                                               : =
:|
   6000 ++                                                              :  =
:|
        |                      *..                                      :  =
 |
   5000 ++       *..*.        +                   *..   .*..           :   =
 |
   4000 *+*..   +     *.  .*.*    *.*.*..*.*..*. +   *.*    *. .*..*.*.*   =
 *
   3000 ++   *.*        *.                      *             *            =
 |
   2000 ++                                                                 =
 |
        |           O   O                                                  =
 |
   1000 O+O  O O O    O    O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[52]:/.tg_load_avg

  11000 ++-----------------------------------------------------------------=
-+
  10000 ++                                                                *=
 |
        |                                                                 :=
 |
   9000 ++                                                               : =
:|
   8000 ++                                                               : =
:|
   7000 ++                                                               : =
:|
   6000 ++                                                              :  =
:|
        |                      *..                                      :  =
 |
   5000 *+       *..*.        +                   *..   .*..           :   =
 |
   4000 ++*..   +     *.  .*.*    *.*.*..*.*..*. +   *.*    *. .*..*.*.*   =
 *
   3000 ++   *.*        *.                      *             *            =
 |
   2000 ++                                                                 =
 |
        |           O   O                                                  =
 |
   1000 O+O  O O O    O    O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[53]:/.tg_load_avg

  11000 ++-----------------------------------------------------------------=
-+
  10000 ++                                                                *=
 |
        |                                                                 :=
 |
   9000 ++                                                               : =
:|
   8000 ++                                                               : =
:|
   7000 ++                                                               : =
:|
   6000 ++                                                              :  =
:|
        |                                                               :  =
 |
   5000 *+       *..*.        .*..                *..    *..           :   =
 |
   4000 ++*..   +     *.  .*.*    *.*.*..*.*..*. +   *. +   *. .*..*.*.*   =
 *
   3000 ++   *.*        *.                      *      *      *            =
 |
   2000 ++                                                                 =
 |
        |           O   O                                                  =
 |
   1000 O+O  O O O    O    O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[54]:/.tg_load_avg

  11000 ++-----------------------------------------------------------------=
-+
  10000 ++                                                                *=
 |
        |                                                                 :=
 |
   9000 ++                                                               : =
:|
   8000 ++                                                               : =
:|
   7000 ++                                                               : =
:|
   6000 ++                                                              :  =
:|
        |                                                               :  =
 |
   5000 *+         .*.        .*..               .*..   .*..            :  =
 |
   4000 ++*..   .*.   *.  .*.*    *.*.*..*.*..*.*    *.*    *. .*..*.*.:   =
 *
   3000 ++   *.*        *.                                    *        *   =
 |
   2000 ++                                                                 =
 |
        |           O   O                                                  =
 |
   1000 O+O  O O O    O    O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[55]:/.tg_load_avg

  11000 ++-----------------------------------------------------------------=
-+
  10000 ++                                                                *=
 |
        |                                                                 :=
 |
   9000 ++                                                               : =
:|
   8000 ++                                                               : =
:|
   7000 ++                                                               : =
:|
   6000 ++                                                              :  =
:|
        |                                                               :  =
 |
   5000 ++                    .*..               .*..   .*..        .*  :  =
 |
   4000 *+*..   .*..*.*.  .*.*    *.*.*..*.*..*.*    *.*    *. .*..*  +:   =
 *
   3000 ++   *.*        *.                                    *        *   =
 |
   2000 ++                                                                 =
 |
        |           O   O                                                  =
 |
   1000 O+O  O O O    O    O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[56]:/.tg_load_avg

  11000 ++-----------------------------------------------------------------=
-+
  10000 ++                                                                *=
 |
        |                                                                 :=
 |
   9000 ++                                                               : =
:|
   8000 ++                                                               : =
:|
   7000 ++                                                               : =
:|
   6000 ++                                                              :  =
:|
        |                                                               :  =
 |
   5000 ++                    .*..               .*..    *..        .*  :  =
 |
   4000 *+*..   .*..*.*.  .*.*    *.*.*..*.*..*.*    *. +      .*..*  +:   =
 *
   3000 ++   *.*        *.                             *    *.*        *   =
 |
   2000 ++                                                                 =
 |
        |           O   O                                                  =
 |
   1000 O+O  O O O    O    O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[57]:/.tg_load_avg

  11000 ++-----------------------------------------------------------------=
-+
  10000 ++                                                                *=
 |
        |                                                                 :=
 |
   9000 ++                                                               : =
:|
   8000 ++                                                               : =
:|
   7000 ++                                                               : =
:|
   6000 ++                                                              :  =
:|
        |                                                               :  =
 |
   5000 ++                    .*..                *..    *..         *  :  =
 |
   4000 *+*..   .*..*.*.  .*.*    *.*.*..*.*..*. +   *. +      .*.. + +:   =
 *
   3000 ++   *.*        *.                      *      *    *.*    *   *   =
 |
   2000 ++                                                                 =
 |
        |           O   O                                                  =
 |
   1000 O+O  O O O    O    O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[58]:/.tg_load_avg

  11000 ++-----------------------------------------------------------------=
-+
  10000 ++                                                                *=
 |
        |                                                                 :=
 |
   9000 ++                                                               : =
:|
   8000 ++                                                               : =
:|
   7000 ++                                                               : =
:|
   6000 ++                                                              :  =
:|
        |                                                               :  =
 |
   5000 ++                    .*..               .*..    *..         *  :  =
 |
   4000 *+*..   .*..*.*.  .*.*    *.*.*..*.*..*.*    *. +      .*.. + +:   =
 *
   3000 ++   *.*        *.                             *    *.*    *   *   =
 |
   2000 ++                                                                 =
 |
        |           O   O                                                  =
 |
   1000 O+O  O O O    O    O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[59]:/.tg_load_avg

  11000 ++-----------------------------------------------------------------=
-+
  10000 ++                                                                *=
 |
        |                                                                 :=
 |
   9000 ++                                                               : =
:|
   8000 ++                                                               : =
:|
   7000 ++                                                               : =
:|
   6000 ++                                                              :  =
:|
        |                                                               :  =
 |
   5000 ++                    .*..               .*..   .*..         *  :  =
 |
   4000 *+*..   .*..*.*.  .*.*    *.*.*..*.*..*.*    *.*       .*.. + +:   =
 *
   3000 ++   *.*        *.                                  *.*    *   *   =
 |
   2000 ++                                                                 =
 |
        |           O   O                                                  =
 |
   1000 O+O  O O O    O    O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[60]:/.tg_load_avg

  11000 ++-----------------------------------------------------------------=
-+
  10000 ++                                                                *=
 |
        |                                                                 :=
 |
   9000 ++                                                               : =
:|
   8000 ++                                                               : =
:|
   7000 ++                                                               : =
:|
   6000 ++                                                              :  =
:|
        |                                                               :  =
 |
   5000 ++                    .*..               .*..   .*..         *  :  =
 |
   4000 *+*..   .*..*.*.  .*.*    *.*.*..*.*..*.*    *.*       .*.. + +:   =
 *
   3000 ++   *.*        *.                                  *.*    *   *   =
 |
   2000 ++                                                                 =
 |
        |           O   O                                                  =
 |
   1000 O+O  O O O    O    O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[61]:/.tg_load_avg

  10000 ++----------------------------------------------------------------*=
-+
   9000 ++                                                                :=
 |
        |                                                                : =
:|
   8000 ++                                                               : =
:|
   7000 ++                                                               : =
:|
        |                                                               :  =
:|
   6000 ++                                                              :  =
 |
   5000 ++                                               *..            :  =
 |
   4000 *+       *..          .*..*.             .*..*. +           .*.:   =
 *
        | *..   +   *.*.  .*.*      *.*..*.*..*.*      *    *.*.*..*   *   =
 |
   3000 ++   *.*        *.                                                 =
 |
   2000 ++                                                                 =
 |
        |    O O O  O   O                                                  =
 |
   1000 O+O           O    O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[62]:/.tg_load_avg

  10000 ++----------------------------------------------------------------*=
-+
   9000 ++                                                                :=
 |
        |                                                                : =
:|
   8000 ++                                                               : =
:|
   7000 ++                                                               : =
:|
        |                                                               :  =
:|
   6000 ++                                                              :  =
 |
   5000 ++                                              .*..            :  =
 |
   4000 *+       *..          .*..*.             .*..*.*            .*.:   =
 *
        | *..   +   *.*.  .*.*      *.*..*.*..*.*           *. .*..*   *   =
 |
   3000 ++   *.*        *.                                    *            =
 |
   2000 ++                                                                 =
 |
        |    O O O  O   O                                                  =
 |
   1000 O+O           O    O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[63]:/.tg_load_avg

  11000 ++-----------------------------------------------------------------=
-+
  10000 ++                                                                *=
 |
        |                                                                 :=
 |
   9000 ++                                                               : =
:|
   8000 ++                                                               : =
:|
   7000 ++                                                               : =
:|
   6000 ++                                                              :  =
:|
        |                                                               :  =
 |
   5000 ++                                       .*..   .*..            :  =
 |
   4000 *+*..   .*..*.*.  .*.*.*..*.*.  .*.*..*.*    *.*       .*.. .*.:   =
 *
   3000 ++   *.*        *.            *.                    *.*    *   *   =
 |
   2000 ++                                                                 =
 |
        |           O   O                                                  =
 |
   1000 O+O  O O O    O    O O O  O O O  O O  O O O  O                     =
 |
      0 ++-----------------------------------------------------------------=
-+


                     sched_debug.cfs_rq[0]:/.runnable_load_avg

    15 *+-----*--*---------------*------*--*-----------*-*-*---------------=
-+
       |      :  :               ::     :  :          :    :               =
 |
  14.5 ++    :    :             : :    :    :         :     :              =
 |
       |:    :    :             :  :   :    :        :      :              =
 |
       | :  :      :           :   :  :      :       :      :              =
 |
    14 ++*..*      *    *.*    *    *.*      *      *        :  *.*..*.*   =
 *
       |            :  :   :  :               :     :        :  :      :   =
 |
  13.5 ++           :  :   :  :               :    :         : :        :  =
 |
       |             ::     ::                 :   :          ::        :  =
:|
    13 ++            *      *                  *..*           *         :  =
:|
       |                                                                 : =
:|
       |                                                                 : =
:|
  12.5 ++                                                                ::=
 |
       |                                                                  :=
 |
    12 ++-----------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[0]:/.utilization_load_avg

  1100 *+------------------------------------------------------------------=
-+
       |                       *.                                          =
 |
  1080 ++          *           : *                                         =
 |
       |:          :          :   :                                        =
 |
  1060 ++         : :     *   :   :                                        =
 |
       |:     *.. : :     :   :    :      .*.*             *        .*.    =
 |
  1040 ++:    :  :  :    : : :     :    *.    :     *..   + :    .*.   *   =
 *
       | *.. :   *  :    : : :      *. +      :     :  *.*   :  *       :  =
 |
  1020 ++    :       :  :   :         *        *   :         : +        :  =
:|
       |    *        : .*   *                   +  :          *          : =
:|
  1000 ++            *.                          +:                      : =
:|
       |                                          *                       :=
 |
   980 ++                                                                 *=
 |
       |                                                                   =
 |
   960 ++------------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[0]:/.tg_load_contrib

  250 ++-------------------------------------------------------------------=
-+
      |                                                                   *=
 |
      |                                                                   :=
 |
  200 ++                                                                  :=
 |
      |                                          *                       : =
:|
      |                                          :                       : =
:|
  150 ++                                        : :                      : =
:|
      |                                         : :                      : =
:|
  100 ++*..                                    :  :   *                 :  =
:|
      | :  *           *                       *   :  ::             *  :  =
:|
      |:    :         : :                      :   : : :   *        : : :  =
 |
   50 ++    :         : :                     :    : :  : : +       : : :  =
 |
      *      :       :   :                    :     :   : :  +     :   :   =
 |
      |      *..*.*.*    *..*.*..*.*.*..*.*..*      *    *    *.*.*    *   =
 *
    0 ++-------------------------------------------------------------------=
-+


                     sched_debug.cfs_rq[1]:/.runnable_load_avg

    16 ++-----------------------------*------------------------------------=
-+
       |                              :                                    =
 |
  15.5 ++                            ::                                    =
 |
    15 *+     *      *    *          : :     *      *         *            =
 |
       |:     ::     ::   ::         : :     ::     ::       : :           =
 |
  14.5 ++    :  :   :  : : :         : :    : :    :  :      : :           =
 |
       | :   :  :   :  : :  :       :  :    :  :   :  :     :   :          =
 |
    14 ++*..*    *.*    *   *..*.*..*  :   *   *..*    *.*.*    *.*..*.*   =
 *
       |                                : +                            :   =
 |
  13.5 ++                               :+                              :  =
:|
    13 ++                               *                               :  =
:|
       |                                                                 : =
:|
  12.5 ++                                                                : =
:|
       |                                                                  :=
 |
    12 ++-----------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[1]:/.utilization_load_avg

  1150 ++------------------------------------------------------------------=
-+
       | *                     *                                           =
 |
  1100 ++::                  ..:                                           =
 |
       |: :   *..           *   :                   *          .*.*..      =
 |
       |:  : :   *   *..   +    :          *.      : +        *            =
 |
  1050 *+  : :    : :   *.*      : .*.    +  *.    :  +     ..       *     =
 |
       |    *     : :            *.   *. +     *..*    *.*.*          +    =
 *
  1000 ++          *                    *                              *   =
 |
       |                                                                :  =
:|
   950 ++                                                               :  =
:|
       |                                                                 : =
:|
       |                                                                 ::=
 |
   900 ++                                                                 *=
 |
       |                                                                   =
 |
   850 ++------------------------------------------------------------------=
-+


                     sched_debug.cfs_rq[2]:/.runnable_load_avg

    16 ++------------------------------------*-----------------------------=
-+
       |                                     :                             =
 |
  15.5 ++                                   : :                            =
 |
    15 ++*                       *    *.*   : :   *        *..*            =
 |
       | ::                      :    :  :  : :  : :       :  :            =
 |
  14.5 ++  :                    : :  :    : : :  : :      :    :           =
 |
       |:  :                    : :  :    ::   ::   :     :    :           =
 |
    14 *+   *      *.*    *.*..*   : :     *   *    *..*.*     :     *.*   =
 *
       |     :    :   +  :         : :                         :    +  :   =
 |
  13.5 ++    :    :    + :          :                           :  +    :  =
:|
    13 ++     *..*      *           *                           *.*     :  =
:|
       |                                                                 : =
:|
  12.5 ++                                                                : =
:|
       |                                                                  :=
 |
    12 ++-----------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[2]:/.utilization_load_avg

  1100 ++------------------------------------------------------------------=
-+
  1080 ++                       .*..              *        *               =
 |
       |                       *             *   + :      : +              =
 |
  1060 ++*..*                 +     *   *.. + + +  :      :  +             =
 *
  1040 ++    +          *.*. +       + +   *   *    :   .*    *.      .*   =
 |
  1020 *+     *        +    *         *             *..*        *.*..* :   =
 |
  1000 ++      :   *. +                                                 :  =
:|
       |        : :  *                                                  :  =
:|
   980 ++       : :                                                     :  =
:|
   960 ++        *                                                       : =
:|
   940 ++                                                                : =
:|
   920 ++                                                                ::=
 |
       |                                                                  :=
 |
   900 ++                                                                 *=
 |
   880 ++------------------------------------------------------------------=
-+


                    sched_debug.cfs_rq[3]:/.runnable_load_avg

  24 ++--------------------------------------------------------------------=
-+
     |                                                                 *   =
 |
  22 ++                                                                :   =
 |
     |                                                                 :   =
 |
     |                                                                : :  =
 |
  20 ++                                                               : :  =
 |
     |                                                                : :  =
 |
  18 ++                                                               : :  =
 |
     |         *                                                      :  : =
 |
  16 ++       ::                                                      :  : =
 |
     *        : :               *      *..     *                     :   : =
 |
     |+      :  :             .. :    +      .. +                    :   : =
 |
  14 ++*.. .*    : .*.*..*. .*   :  .*    *.*    *..*.*.*..*.  .*.  .*    :=
 *
     |    *      *.        *      *.                         *.   *.      :=
+|
  12 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[3]:/.utilization_load_avg

  1150 ++--------------------------------------------------------------*---=
-+
       |                                                               :   =
 |
       |                                                               ::  =
 |
  1100 ++               *                                             : :  =
 |
       *        .*     : :                                            : :  =
 |
       |+     *. :     : :      .*             *..               .*   : :  =
 |
  1050 ++*    :   :   :   :   .*  :   *.*..*. +   *.    .*     .*  +  :  : =
 |
       |  +  :    :   :   *.*.     : :       *      *..*  +  .*     +:   : =
 *
  1000 ++  + :     :.*             : :                     *.        *   : =
 |
       |    *      *                *                                    : =
:|
       |                                                                  :=
:|
   950 ++                                                                 :=
 |
       |                                                                  *=
 |
       |                                                                   =
 |
   900 ++------------------------------------------------------------------=
-+


                    sched_debug.cfs_rq[4]:/.runnable_load_avg

  18 ++-----------------------------------------------------------*--------=
-+
     |                                                            :        =
 |
  17 ++                                                           ::       =
 |
     |                                                           : :       =
 |
     |                                                           : :       =
 |
  16 ++          *                        *                      :  :      =
 |
     |           ::                      ::                      :  :      =
 |
  15 ++         :  :            *        : :            *..  *..:   :      =
 |
     |          :  :           ::       :  :           +    +   :    :     =
 |
  14 *+*..*.*..*    *.*..*.*   : :   *.*   :   *.*    *    *    *    *.*   =
 *
     |                      : :  :  +      :  +   +  :                  :  =
 |
     |                      : :   :+        :+     + :                  :  =
:|
  13 ++                      *    *         *       *                    : =
:|
     |                                                                   ::=
 |
  12 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[4]:/.utilization_load_avg

  1150 ++------------------------------------------------------------------=
-+
       |           *                                                       =
 |
       |           :                                              *..      =
 |
  1100 ++     *   : :                                             :  *     =
 |
       |      :+  : :       *..            *                     :    :    =
 *
       |     :  +:  :      :              + :  *..       *.*..   :    :    =
 |
  1050 ++    :   *  :   *. :   *.*.. .*. +  : :   *     +      .*      :   =
 |
       *.*..:        : +  *         *   *    ::    +  .*      *        *   =
:|
  1000 ++   *        :+                      *      *.                  :  =
:|
       |             *                                                  :  =
:|
       |                                                                 : =
:|
   950 ++                                                                ::=
 |
       |                                                                  :=
 |
       |                                                                  *=
 |
   900 ++------------------------------------------------------------------=
-+


                    sched_debug.cfs_rq[5]:/.runnable_load_avg

  17 ++---------------*-----------*----------------------------------------=
-+
     |                :           ::                                       =
 |
     |               : :          ::                                       =
 |
  16 *+              : :         :  :                      *               =
 |
     |               :  :        :  :                     +:               =
 |
     |:             :   :        :   :                   +  :              =
 |
  15 ++        *.*..*   :        :   *.*..          *   *   :              =
 *
     |:      ..          :      :                 .. + +     :             =
 |
  14 ++   *.*            *.*.*..*         *.*..*.*    *      *..*.*..*.*   =
 |
     | : +                                                              :  =
:|
     | :+                                                               :  =
:|
  13 ++*                                                                 : =
:|
     |                                                                   : =
:|
     |                                                                    :=
 |
  12 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[5]:/.utilization_load_avg

  1120 ++---------------------------*--------------------------------------=
-+
       |                            ::                     *               =
 |
  1100 *+                          : :                     :               =
 |
  1080 ++     *..       *          :  :                   : :              =
 |
       |:     :       .. :         :  *.*                 : :          *   =
 |
  1060 ++    :   *   *   :    .*  :      :   *           *  :    .*    :   =
 |
  1040 ++    :    : :     *.*.  : :       : : +         :    :  *  :  : :  =
 *
       |:   *     : :           ::        : :  *..*.*.. :    :  :  :  : :  =
 |
  1020 ++:..       *             *         *           *     : :    : : :  =
:|
  1000 ++*                                                   : :    ::   : =
:|
       |                                                      :      *   : =
:|
   980 ++                                                     *          : =
:|
   960 ++                                                                 :=
 |
       |                                                                  *=
 |
   940 ++------------------------------------------------------------------=
-+


                    sched_debug.cfs_rq[6]:/.runnable_load_avg

  20 ++------------------------------------------*-------------------------=
-+
     |                                           :                         =
 |
  19 ++                                          ::                        =
 |
     |                                           ::                        =
 |
  18 ++                                         : :                        =
 |
     |                                          : :                        =
 |
  17 ++                                         :  :                       =
 |
     |                                          :  :                       =
 |
  16 ++                                         :  :                       =
 |
     |                                          :  :                       =
 |
  15 ++   *    *                  *..*    *    :    :        *..           =
 *
     |  .. + .. +                +    + .. +   :    :        :             =
 |
  14 *+*    *    *..*.*..*.*.*..*      *    *..*    *.*.*.. :   *.*..*.*.. =
:|
     |                                                      :              =
:|
  13 ++----------------------------------------------------*--------------*=
-+


                   sched_debug.cfs_rq[6]:/.utilization_load_avg

  1160 ++------------------------------------------------------------------=
-+
  1140 ++                                         *                        =
 |
       |                                          :                        =
 |
  1120 ++                                        : :                       =
 |
  1100 ++   *                  *    *.           : :                       =
 |
  1080 ++  : +                +:   :  *     .*  :  :                       =
 |
  1060 ++  :  *..    *..     +  :  :   :   *  : :   :         *            =
 *
       |  :         :   *   *   : :    :  +   ::    *..*.    : :           =
 |
  1040 *+ :      *. :    + +     ::     :+     *         *   : : .*..*.*   =
 |
  1020 ++*         *      *      *      *                 + :   *       :  =
:|
  1000 ++                                                  *            :  =
:|
   980 ++                                                                : =
:|
       |                                                                 : =
:|
   960 ++                                                                 :=
 |
   940 ++-----------------------------------------------------------------*=
-+


                    sched_debug.cfs_rq[7]:/.runnable_load_avg

  18 ++-------------*------------------------------------------------------=
-+
     |              :                                                      =
 |
  17 ++            : :                                                     =
 |
     |             : :                                                     =
 |
  16 *+            : :                              *                      =
 |
     |:           :  :                            .. +                     =
 |
  15 ++           :   :  *.*.*..*    *    *      *    *.*..  *..  *..*.*   =
 |
     | :         :    :..        + .. + .. :    +           +    +     :   =
 |
  14 ++*..*.*..*.*    *           *    *   :   *           *    *       :  =
 *
     |                                      :..                         :  =
 |
  13 ++                                     *                            : =
:|
     |                                                                   : =
:|
  12 ++                                                                  : =
:|
     |                                                                    :=
 |
  11 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[7]:/.utilization_load_avg

  1150 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  1100 *+            *                                                     =
 |
       |:        *. + +   *                       *.                .*.    =
 |
  1050 ++   *. ..  *   + + +  .*.*..   .*..*    ..  *..*.*.*..   .*.   *   =
 |
       | :..  *         *   *.       .*     :  *              *.*      :   =
 *
  1000 ++*                          *       : +                         :  =
 |
       |                                     *                          :  =
 |
   950 ++                                                               :  =
:|
       |                                                                 : =
:|
   900 ++                                                                : =
:|
       |                                                                 : =
:|
   850 ++                                                                 :=
 |
       |                                                                  *=
 |
   800 ++------------------------------------------------------------------=
-+


                    sched_debug.cfs_rq[8]:/.runnable_load_avg

  18 ++----------------------------------------------------------------*---=
-+
     |                                                                 :   =
 |
  17 ++                                                                ::  =
 |
     |                                                                : :  =
 |
     |                                                                : :  =
 |
  16 ++               *              *                                :  : =
 |
     |                :             : :                               :  : =
 |
  15 ++        *     : :     *..    : :                              :   : =
 |
     |       .. +    : :    +      :   :                             :    :=
 |
  14 ++   *.*    *..*  :   *    *.*    *         *    *.*..*.*..*.*..*    *=
.*
     |   +              :  :            +       : +  :                     =
 |
     |  +               : :              +      :  + :                     =
 |
  13 ++*                : :               *.*..*    *                      =
 |
     |+                  :                                                 =
 |
  12 *+------------------*-------------------------------------------------=
-+


                   sched_debug.cfs_rq[8]:/.utilization_load_avg

  1200 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
       |                *                                                  =
 |
  1150 ++               :                                              *   =
 |
       |               ::        *                                     :   =
 |
       |         *     : :      : :                                   : :  =
 |
  1100 ++       +:    :  :      :  :                     *            : :  =
 |
       |       +  :   :  :     *   :              *     : :    .*     : :  =
 |
  1050 ++   *.*   :  *   :    +     *. .*..     ..:     : :  .*  +    : :  =
 |
       |  ..       :+     :  +        *        *   :   *   *.     *..:   : =
 |
       *.*         *      :.*              *. +    :  +              *   : =
 *
  1000 ++                 *                  *      :+                   : =
 |
       |                                            *                    : =
:|
       |                                                                  :=
:|
   950 ++-----------------------------------------------------------------*=
-+


                     sched_debug.cfs_rq[9]:/.runnable_load_avg

    16 ++*-----------------------------------------------------------------=
-+
       | :                                                                 =
 |
  15.5 ++ :                                                                =
 |
    15 ++ :                                       *                  *.*   =
 |
       |: :                                      : :                 : :   =
 |
  14.5 ++  :                                     : :                :   :  =
 |
       |   :                                    :   :               :   :  =
 |
    14 *+  :  *..*   *..*.*    *    *   *..*.*.*    *..*.*.*    *  :    :  =
 *
       |   : :    : :      :  + :  + : :                    +  : : :    :  =
 |
  13.5 ++   ::    : :      : +  : +  : :                     + : ::      : =
:|
    13 ++   *      *        *    *    *                       *   *      : =
:|
       |                                                                 : =
:|
  12.5 ++                                                                : =
:|
       |                                                                  :=
 |
    12 ++-----------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[9]:/.utilization_load_avg

  1150 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  1100 ++*                                                                 =
 |
       | ::                                                            *   =
 |
       |: :             *.     *.  .*.                    .*..*       +:   =
 |
  1050 ++  :  *..*     +  *   :  *.   *.*..*.*.*..*.*.. .*     +     *  :  =
 |
       *   : :    +   +    :  :                        *        *. ..   :  =
 *
  1000 ++   ::     *.*     : :                                    *     :  =
 |
       |    *               *                                            : =
:|
   950 ++                                                                : =
:|
       |                                                                 : =
:|
       |                                                                 : =
:|
   900 ++                                                                 :=
 |
       |                                                                  *=
 |
   850 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[10]:/.runnable_load_avg

  18 ++-------------------------------------------------*------------*-----=
-+
     |                                                  :            :     =
 |
  17 ++                                *                ::          ::     =
 |
     |                                 :               : :          : :    =
 |
     |                                 ::              : :          : :    =
 |
  16 ++        *                      : :              :  :        :  :    =
 |
     |         ::                     :  :             :  :        :  :    =
 |
  15 *+       : :        *            :  :            :   :        :   :   =
 |
     |+       :  :     ..:            :   :           :    :      :    :   =
 |
  14 ++*..*  :   *    *   :  *..*.*   :   *.*..*.*..*.*    *.*..*.*    *   =
 *
     |     : :    +  :    : :      + :                                  :  =
 |
     |     ::      + :     ::       +:                                  :  =
:|
  13 ++     *       *      *         *                                   : =
:|
     |                                                                   ::=
 |
  12 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[10]:/.utilization_load_avg

  1150 ++----------------------------------------------*-------------------=
-+
       |         *                                     :                   =
 |
       |         ::                                   : :                  =
 |
  1100 *+       : :                                   : :                  =
 |
       |:       :  *             *..*   *            :  :            *.    =
 |
       |:      :    :           +    : : +   *.*..   :  :          ..  *   =
 |
  1050 ++*     :    :         .*     : :  + +     *.*    :.*..*.*.*    :   =
 |
       |  +   *      *.. .*.*.        *    *             *              :  =
 |
  1000 ++  + +          *                                               :  =
 *
       |    *                                                            : =
 |
       |                                                                 : =
:|
   950 ++                                                                : =
:|
       |                                                                  :=
 |
       |                                                                  *=
 |
   900 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[11]:/.runnable_load_avg

  17 ++-------------------------*------------------------------------------=
-+
     |                          :                                          =
 |
     |                         : :                                         =
 |
  16 *+                    *   : :                                         =
 |
     |                     :   : :                                         =
 |
     |:                    :: :  :                                         =
 |
  15 ++                   : : :   :                 *                *     =
 *
     | :                  :  :    :               .. +             .. +    =
 |
  14 ++*       *.*..*.*   :  *    *         *..*.*    *.*       *.*    *   =
 |
     |  +     +        +  :        +       :             +     +        :  =
:|
     |   +   +          +:          +      :              +   +         :  =
:|
  13 ++   *.*            *           *.*..*                *.*           : =
:|
     |                                                                   : =
:|
     |                                                                    :=
 |
  12 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[11]:/.utilization_load_avg

  1150 ++-------------------------------------------*----------------------=
-+
       |                                          *  :                     =
 |
  1100 ++                                        +    :                    =
 |
       |                         *..            +     :                    =
 |
       |                   .*.. +             .*       *             *.    =
 |
  1050 *+       .*.*.*..*.*    *    *      *.*          +      .*. ..  *   =
 *
       | *.. .*.                     :   ..              *.*..*   *    :   =
 |
  1000 ++   *                        : .*                               :  =
 |
       |                              *                                 :  =
:|
   950 ++                                                                : =
:|
       |                                                                 : =
:|
       |                                                                 : =
:|
   900 ++                                                                 :=
 |
       |                                                                  *=
 |
   850 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[12]:/.runnable_load_avg

  80 ++--------------------------------------------------------------------=
-+
     |           *                                                         =
 |
  70 ++          :                                                         =
 |
     |           ::                                                        =
 |
  60 ++          ::                                                        =
 |
     |          : :                                                        =
 |
  50 ++         : :                                                        =
 |
     |          :  :                                                       =
 |
  40 ++         :  :                                                       =
 |
     |          :  :                                                       =
 |
  30 ++         :  :                                                       =
 |
     |         :    :                                                      =
 |
  20 ++        :    :                                                      =
 |
     *.*..*.*..*    *.*..*.*.*..*.*..*.*..*.*..*.*..*.*.*..*.*..*.*..*.*.. =
.*
  10 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[12]:/.utilization_load_avg

  1120 ++----------*-------------------------------------------------------=
-+
       |           ::                                                      =
 |
  1100 ++          ::                   *                                  =
 |
  1080 ++         :  *                  :                                  =
 |
       |          :   +   *            : :          *..                    =
 |
  1060 ++*..      :    + + +  .*       : :         :   *   *..    *..      =
 |
  1040 *+   *     :     *   *.  +  .*  :  :        :    : :   *. +         =
 |
       |     :   :               *.  : :  :  *.*..*     : :     *    *.    =
 *
  1020 ++    :   :                   ::    :+            *             *   =
 |
  1000 ++     : .*                    *    *                            :  =
:|
       |      *.                                                        :  =
:|
   980 ++                                                                : =
:|
   960 ++                                                                ::=
 |
       |                                                                  *=
 |
   940 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[13]:/.runnable_load_avg

  20 ++--------------------------------------------------------------------=
-*
     |                                                                     =
 |
  19 ++                                                                    =
 |
     |                                                                     =
 |
  18 ++                                                                    =
:|
     |                                                                     =
:|
  17 ++                                                                    =
:|
     |                                                                     =
:|
  16 ++                                                                    =
:|
     |                                                                     =
:|
  15 ++                    *      *..*                  *                  =
:|
     |                    + +    +    +                 ::                :=
 |
  14 ++   *.*..*      *..*   *..*      *..  *..*.*..*  :  :  *..     *    :=
 |
     |  ..      +    +                     +         + :  : +      .. +   :=
 |
  13 *+*---------*--*---------------------*-----------*----*----*-*----*--*=
-+


                   sched_debug.cfs_rq[13]:/.utilization_load_avg

  1200 ++------------------------------------------------------------------=
-+
       |                            *                                      =
 |
  1150 ++                          ::                                      =
 |
       |                           : :                                     =
 |
       |                          :  :                                     =
 *
  1100 ++     *             *    *   :                                     =
 |
       |     : +           + +  :    :            *      *.  .*            =
 |
  1050 *+    :  +    *..  *   + :     :         .. +    +  *.  +     *.*   =
:|
       | *..*    *  :    +     *      *.*    *.*    *..*        *. ..   :  =
:|
  1000 ++         + :   *                +  :                     *     :  =
:|
       |           *                      + :                            : =
:|
       |                                   *                             ::=
 |
   950 ++                                                                 *=
 |
       |                                                                   =
 |
   900 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[14]:/.runnable_load_avg

  24 ++--------------------------------------------------------------------=
-+
     |                   *                                                 =
 |
  22 ++                  :                                                 =
 |
     |                  : :                                                =
 |
     |                  : :                                                =
 |
  20 ++                 : :                                                =
 |
     |                  : :                 *                              =
 |
  18 ++                :   :                :                              =
 |
     |                 :   *               : :                             =
 |
  16 ++                :    :              : :                             =
 |
     |                 :    :              :  :                 *          =
 |
     |                :      :            :   :               .. :         =
 |
  14 ++*..*.*..*.*..*.*      *..*.*.. .*..*    :.*..*. .*..*.*   :  .*.*.. =
 *
     *                               *         *      *           *.       =
+|
  12 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[14]:/.utilization_load_avg

  1200 ++-----------------*------------------------------------------------=
-+
       |                  :                                                =
 |
  1150 ++                : :                                               =
 |
       |                 : :                                               =
 |
       |                 : :               *.*                             =
 |
  1100 ++                :  :             :  :      *                *     =
 |
       |                :   *..    .*     :   :    : :              + :    =
 |
  1050 ++              .*      *.*.  :   :    :    :  :  *     .*. +  :    =
 |
       |.*..*.*.. .*.*.              : .*     :   *   : + +  .*   *    *   =
 *
  1000 *+        *                    *        :..     *   *.           :  =
 |
       |                                       *                        :  =
:|
       |                                                                 : =
:|
   950 ++                                                                ::=
 |
       |                                                                  *=
 |
   900 ++------------------------------------------------------------------=
-+


                    sched_debug.cfs_rq[15]:/.runnable_load_avg

    16 ++---*--------------------------------------------------------------=
-+
       |    :                                                              =
 |
  15.5 ++  ::                                                              =
 |
       |   ::                                                              =
 |
       |   : :                                                             =
 |
    15 ++ :  :       *      *                       *             *..*     =
 |
       |  :  :       ::     ::                      :             :   :    =
 |
  14.5 ++ :  :      :  :   :  :                    : :           :    :    =
 |
       | :   :      :  :   :  :                    : :           :     :   =
 |
    14 *+*   :     *    *.*    *.*..*.*.*..*   *..*  :   *    *.*      *   =
 *
       |     :     :                       :   :      :  :   :          :  =
 |
       |      :   :                         : :       : : :  :          :  =
:|
  13.5 ++     :   :                         : :       : : : :            : =
:|
       |      :  :                           :         :   ::            ::=
 |
    13 ++-----*--*---------------------------*---------*---*--------------*=
-+


                   sched_debug.cfs_rq[15]:/.utilization_load_avg

  1100 ++-------------------------------------------------------*-*--------=
-+
       |             *                                          :  :       =
 |
  1080 ++            ::                                        :    :      =
 |
  1060 ++*          : :          *..             .*.           :    :      =
 |
       |+ :         :  :    *    :      *     .*.   *..    *   :     *     =
 |
  1040 *+  :        :  :    :+  :   *   :+   *            + +  :      +    =
 |
       |   :       :    *  :  + :    : :  + +          *.*   +:        *   =
 *
  1020 ++   *.*.. .*     : :   *     : :   *                  *        :   =
 |
       |         *       ::           *                                 :  =
 |
  1000 ++                 *                                             :  =
:|
   980 ++                                                                : =
:|
       |                                                                 : =
:|
   960 ++                                                                : =
:|
       |                                                                  :=
 |
   940 ++-----------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[16]:/.runnable_load_avg

  22 ++---------------------------------------------------------*----------=
-+
     |                                                          :          =
 |
     |                                                         ::          =
 |
  20 ++                                                        ::          =
 |
     |                                                         : :         =
 |
     |                                                         : :         =
 |
  18 ++                                                       :  :         =
 |
     |                                                        :  :         =
 |
  16 ++                                                       :  :         =
 |
     |                                                        :  :         =
 |
     |        .*.    .*          .*..                        :    :  *.    =
 |
  14 *+*..  *.   *..*  +   *.*..*    *.*..*.*..*.*..*   *..*.*    : +  *   =
 *
     |     +            + +                          + +          :+    +  =
:|
     |    *              *                            *           *      + =
:|
  12 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[16]:/.utilization_load_avg

  1200 ++------------------------------------------------------------------=
-+
       |                                                        *          =
 |
       |                                                        :          =
 |
  1150 ++                                                      ::          =
 |
       |                *                                      : :         =
 |
       |               : :                                     : :         =
 |
  1100 ++              : :                                    :  :         =
 |
       |         *    :   :          .*     .*             *..*  :   *.    =
 |
  1050 ++       + +   :   *    *    *  :   *  +            :      : +  *   =
 |
       *.*..   +   *.*     + .. + ..   : ..    *.. .*..   :       :+    :  =
 *
       |     .*             *    *      *         *    *. :       *     :  =
 |
  1000 ++   *                                            *               : =
:|
       |                                                                 : =
:|
       |                                                                  *=
 |
   950 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[17]:/.runnable_load_avg

  24 ++------------------------------------------*-------------------------=
-+
     |                                           :                         =
 |
  22 ++                                          :                         =
 |
     |                                           ::                        =
 |
     |                                          : :                        =
 |
  20 ++                                         : :                        =
 |
     |                                          : :                        =
 |
  18 ++                              *          :  :                       =
 |
     |                               :          :  :                       =
 |
  16 ++                             : :         :  :                       =
 |
     |                   *          : :        :   :              *    *.. =
 |
     |                  + +        :   :       :    :            + +  :    =
 |
  14 ++*..    .*.*..   +   *.*..*. :   *..*.*..:    :.*.*.. .*..*   + :   *=
.|
     *     .*.      *.*           *            *    *      *         *     =
 *
  12 ++---*----------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[17]:/.utilization_load_avg

  1250 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  1200 ++                                         *                        =
 |
       |                                          :                        =
 |
  1150 ++                                        : :                       =
 |
       |                  *           *          : :                       =
 |
  1100 ++                 :+          ::         : :                       =
 |
       |                 :  *..      : :        :  :              *    *   =
 |
  1050 ++                :     *.*.. :  :       :   : .*.        + +  : :  =
 *
       |.*..  *.. .*.   :           :   *..*.*.:    *.   *.*..*.*   + : :  =
 |
  1000 *+    +   *   *..*           *          *                     *   : =
:|
       |    *                                                            : =
:|
   950 ++                                                                 *=
 |
       |                                                                   =
 |
   900 ++------------------------------------------------------------------=
-+


                    sched_debug.cfs_rq[18]:/.runnable_load_avg

    15 ++----------*----*----------------------*------------------*--------=
-+
       |           :    :                      :                  ::       =
 |
  14.5 ++         ::   : :                    : :                : :       =
 |
       |          : :  : :                    : :                :  :      =
 |
       |         :  :  :  :                  :  :               :   :      =
 |
    14 *+*..*.*..*  : :   *.*..*.*..*.*.*    *   :  *..*.*    *.*    *.*   =
 |
       |            : :                  :   :   :  :     :  :         :   =
 |
  13.5 ++            ::                   : :    : :      :  :          :  =
 |
       |             :                    : :     ::       ::           :  =
 |
    13 ++            *                     *      *        *            :  =
 *
       |                                                                 : =
 |
       |                                                                 : =
:|
  12.5 ++                                                                : =
:|
       |                                                                  :=
 |
    12 ++-----------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[18]:/.utilization_load_avg

  1100 ++------------------------------------------------------------------=
-+
       *.                       .*            .*..                         =
 |
       | *..    .*         .*..*  +          *    *      *                 =
 |
  1050 ++   *.*.  +       *        +   .*.. :      :    + :    .*.*..      =
 |
       |           *.    +          *.*     :      :  .*  :  .*      *.*   =
 *
       |             *..*                  *        *.     *.          :   =
 |
  1000 ++                                                               :  =
 |
       |                                                                :  =
:|
   950 ++                                                               :  =
:|
       |                                                                 : =
:|
       |                                                                 : =
:|
   900 ++                                                                ::=
 |
       |                                                                  :=
 |
       |                                                                  *=
 |
   850 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[19]:/.runnable_load_avg

  24 ++--------------------------------------------------------------------=
-+
     |                                                               *     =
 |
  22 ++                                                              :     =
 |
     |                                                              ::     =
 |
     |                                                              : :    =
 |
  20 ++                                                             : :    =
 |
     |                                                              : :    =
 |
  18 ++                                                            :  :    =
 |
     |                      .*                                     :   :   =
 |
  16 ++                    *  :                                    :   :   =
 |
     | *..       *..      :   :                                    :   *   =
 |
     |+         +         :    :                                  :     :  =
 |
  14 *+   *.*..*    *.*..*     : .*..*.  .*.*..*.  .*. .*..*.*.. .*      : =
 *
     |                          *      *.        *.   *         *        : =
+|
  12 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[19]:/.utilization_load_avg

  1200 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  1150 ++                                                            *     =
 |
       |                                                            ::     =
 |
  1100 ++                                                           : :    =
 |
       *    *.     *.*     .*..      .*                            :  :    =
 |
  1050 ++ ..  *.. +   +   *         *  :   *.*.              .*    :   :   =
 |
       | *       *     + +     *   +   : ..    *..  *..*.*.*.  + .*    *   =
 *
  1000 ++               *       + +     *          +            *       :  =
 |
       |                         *                *                     :  =
:|
   950 ++                                                                : =
:|
       |                                                                 ::=
 |
   900 ++                                                                 *=
 |
       |                                                                   =
 |
   850 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[20]:/.runnable_load_avg

  19 ++---------------------------*----------------------------------------=
-+
     |                            :                                        =
 |
  18 ++                           ::                                       =
 |
     |                           : :                                       =
 |
  17 ++                          : :                                       =
 |
     |                           : :                                       =
 |
  16 ++                          :  :                                      =
 |
     |                           :  :                                      =
 |
  15 ++        *.*..*    *      :   :                   *..  *..     *.*   =
 |
     |        :      + .. +     :   :                   :   +      ..   :  =
 |
  14 *+   *   :       *    *    *    : *..  *..  *..   :   *    *.*     :  =
 |
     |+ .. + :              + ..     :+    +    +      :                 : =
 |
  13 ++*    *                *       *    *    *    *.*                  : =
 *
     |                                                                    :=
+|
  12 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[20]:/.utilization_load_avg

  1200 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  1150 ++                           *                                      =
 |
       |                            :                                      =
 |
       |                  *        : :                                     =
 |
  1100 ++          *.     :        : :                                     =
 |
       |          +  *.. : :      :  :                          *.  .*.    =
 |
  1050 *+        *       : :      :   :    *.*    *.    .*.    +  *.   *   =
 |
       | *..*. ..       *  :     :    *. ..   :  +  *..*   *..*        :   =
 *
  1000 ++     *             :   .*      *     : +                       :  =
 |
       |                    *..*               *                        :  =
:|
       |                                                                 : =
:|
   950 ++                                                                : =
:|
       |                                                                  :=
 |
   900 ++-----------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[21]:/.runnable_load_avg

  26 ++--------------------------------------------------------------------=
-+
     |                   *                                                 =
 |
  24 ++                  :                                                 =
 |
     |                  ::                                                 =
 |
  22 ++                 : :                                                =
 |
     |                  : :                                *               =
 |
  20 ++                 : :                                :               =
 |
     |                 :  :                               : :              =
 |
  18 ++                :  :                               : :              =
 |
     |                 :  :                              :  :              =
 |
  16 ++               :    :                     *..     :   :             =
 |
     |                *    :                    +       :    *..           =
 |
  14 *+*..*.*..*.*.. +     *.*.. .*..    .*.*..*    *. .*       *.  .*.*.. =
 *
     |              *           *     .*.             *           *.       =
+|
  12 ++------------------------------*------------------------------------*=
-+


                   sched_debug.cfs_rq[21]:/.utilization_load_avg

  1200 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  1150 ++                                                  *..             =
 |
       |                                                   :               =
 |
       |                  *                       *       :   *            =
 |
  1100 *+                : :                     : :      :    :           =
 |
       |:                : :     *..             : :      :    :           =
 |
  1050 ++     *..*.*    *   *    :         *.*. :   *..  :      :          =
 |
       | *.. +      + ..     +  :   *     :    *        .*      *.*..*.    =
 *
  1000 ++   *        *        + :    +    :            *               *   =
 |
       |                       *      *. :                              +  =
:|
       |                                *                                + =
:|
   950 ++                                                                 *=
 |
       |                                                                   =
 |
   900 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[22]:/.runnable_load_avg

  22 ++-----------------------------------------------*--------------------=
-+
     |                                                :                    =
 |
     |                                                ::                   =
 |
  20 ++                                              : :                   =
 |
     |                                               : :                   =
 |
     |                                               :  :                  =
 |
  18 ++                                              :  *                  =
 |
     |                     *                         :   :                 =
 |
  16 ++                   : :                        :   :                 =
 |
     |                    : :                       :     :                =
 |
     |                  .*   :                      :     : .*..           =
 |
  14 *+*..*.*..*.*..*.*.     *..*         *.*..*.*..*      *    *.*..  *   =
 *
     |                           +      ..                            + +  =
:|
     |                            *..*.*                             *   + =
:|
  12 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[22]:/.utilization_load_avg

  1200 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  1150 ++                                              *                   =
 |
       |                    *                          ::                  =
 |
       |                   : :                        : :                  =
 |
  1100 ++                  : :                        :  *.*               =
 |
       |            .*.. .*   :       *      *       :      +          *   =
 |
  1050 *+  .*      *    *     :      + +    : +  .*. :       +   .*.. +:   =
 |
       | *.  +    +            *.  .*   *.. :  *.   *         *.*    *  :  =
 |
  1000 ++     *..*               *.        *                            :  =
 *
       |                                                                 : =
 |
       |                                                                 : =
:|
   950 ++                                                                 :=
:|
       |                                                                  *=
 |
   900 ++------------------------------------------------------------------=
-+


                    sched_debug.cfs_rq[23]:/.runnable_load_avg

    16 *+------------------------------------------------------------------=
-+
       |                                                                   =
 |
  15.5 ++                                                                  =
 |
       |:                                                                  =
 |
       |:                                                                  =
 |
    15 ++   *             *.*              *               *    *    *     =
 |
       |:  : :            : :             ::               ::   :    :     =
 |
  14.5 ++: : :           :   :            ::              :  : ::   ::     =
 |
       | ::   :          :   :           :  :             :  : : :  : :    =
 |
    14 ++*    *..*.*.*..*    :   *..*.*.*   :  *..*    *.*    *  :  : :    =
 |
       |                      :  :          :  :  :   :          : :  :    =
 |
       |                      : :           : :    :  :          : :  :    =
 |
  13.5 ++                     : :            ::    : :            ::   :   =
 |
       |                       :             :      ::            :    :   =
 |
    13 ++----------------------*-------------*------*-------------*----*--*=
-*


                   sched_debug.cfs_rq[23]:/.utilization_load_avg

  1100 ++-----------------*------------------------------------------------=
-+
  1080 *+     *           :+                                               =
 |
       |+    : :         :  *                                   *          =
 |
  1060 ++*.. :  :        :   :             *               *.. : +  .*     =
 |
  1040 ++   *   :       :    :   *..      + :    .*       +    :  *.  :    =
 |
       |         *.*.*..*     : :        +  :  *.  +  .*.*    *       :    =
 |
  1020 ++                     : :   *.*.*    :+     *.                 :   =
 |
  1000 ++                      *             *                         *   =
 *
   980 ++                                                              :   =
 |
       |                                                                :  =
:|
   960 ++                                                               :  =
:|
   940 ++                                                                : =
:|
       |                                                                 : =
:|
   920 ++                                                                 :=
 |
   900 ++-----------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[24]:/.runnable_load_avg

  20 ++-----*--------------------------------------------------------------=
-+
     |      :                                                              =
 |
  19 ++     ::                                                             =
 |
     |     : :                                                             =
 |
  18 ++    : :                                                             =
 |
     |     :  :                                                            =
 |
  17 ++    :  :                                                   *        =
 |
     |     :  :                                                   ::       =
 |
  16 ++   :   :                                                  : :       =
 |
     |    :    :                                                 :  :      =
 |
  15 ++   *    *    *.*..                                        :  :      =
 |
     |  ..      + ..                                            :    :     =
 |
  14 ++*         *       *.*.*..*.*..  *..  *..*.*..*.*.*..*    *    *.*.. =
 *
     |+                               +    +                + ..           =
+|
  13 *+------------------------------*----*------------------*------------*=
-+


                   sched_debug.cfs_rq[24]:/.utilization_load_avg

  1150 ++------------------------------------------------------------------=
-+
       |      *                                                            =
 |
       |      ::   *                                                       =
 |
  1100 ++    :  : : :            *             *                     *     =
 |
       |     :  : : :   *        ::           : :                  .. +    =
 |
       |    *    *   :.. + .*.. :  :          :  :         *..    *    *   =
 *
  1050 ++ ..         *    *     :  :         *   : .*..    :     +     :   =
 |
       | *                     *    *   *.. +     *       :   *.*       :  =
:|
  1000 ++                            + +   *           *. :             :  =
:|
       *                              *                  *               : =
:|
       |                                                                 : =
:|
   950 ++                                                                 :=
 |
       |                                                                  *=
 |
       |                                                                   =
 |
   900 ++------------------------------------------------------------------=
-+


                    sched_debug.cfs_rq[25]:/.runnable_load_avg

    17 ++--------------------------------------------------------------*---=
-+
       |                                                               :   =
 |
  16.5 ++                                                              ::  =
 |
    16 ++                                                             : :  =
 |
       |                                                              : :  =
 |
  15.5 ++                                                             :  : =
 |
       |                                                              :  : =
 |
    15 ++                           *      *.*      *    *        *   :  : =
 |
       |                           +:     +  :     : +  : :      : + :   : =
 |
  14.5 ++                         +  :   +    :    :  + : :      :  +:    :=
 |
    14 *+*..*.*..*.*.*..*   *..*.*   :  *     :   *    *   *..*.*    *    *=
.*
       |                 :  :        :  :     :  :                         =
 |
  13.5 ++                : :         : :      :  :                         =
 |
       |                  ::          ::       ::                          =
 |
    13 ++-----------------*-----------*--------*---------------------------=
-+


                   sched_debug.cfs_rq[25]:/.utilization_load_avg

  1140 ++------------------------------------------------------------------=
-+
       |                                                 *                 =
 |
  1120 ++                                                :                 =
 |
  1100 ++                                                :                 =
 |
       |                       *                        : :                =
 |
  1080 ++                     : :          *            : :     *      *   =
 |
       |                      : :         : :      .*   : :     ::    +:   =
 |
  1060 ++        *      *    :   :        : :     *  :  : :    : :   *  :  =
 |
       |.*..   .. :    : :  *    *..     :   *   :   :  : :    :  :..   :  =
 *
  1040 *+    .*   :    : : :            *     :  :    : :  :  :   *      : =
 |
  1020 ++   *      :  :   ::        *   :     : :     ::   : .*          : =
:|
       |           *.*    *          : :       *       :   *.             :=
:|
  1000 ++                            : :               *                  *=
 |
       |                              *                                    =
 |
   980 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[26]:/.runnable_load_avg

  22 ++------------------------------------------------------*-------------=
-+
     |                                                       :             =
 |
     |                                                       ::            =
 |
  20 ++                                                     : :            =
 |
     |                          *                           : :            =
 |
     |                          :                           : :            =
 |
  18 ++                        ::                           :  :           =
 |
     |                         : :                          :  :           =
 |
  16 ++                       :  :   *                      :  :           =
 |
     |                        :  :  : :                    :   :           =
 |
     |   .*.    .*..*.      .*   :  : :  .*.       .*. .*..:    :     .*   =
 |
  14 *+*.   *..*      *..*.*      ::   *.   *..*.*.   *    *    *.*..*  :  =
 |
     |                            ::                                     : =
 |
     |                            *                                      : =
.*
  12 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[26]:/.utilization_load_avg

  1200 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  1150 ++                                                     *            =
 |
       |                         *    *                       :            =
 |
       |                         ::   :             *        : :           =
 |
  1100 ++                       : :  : :            :+       : :           =
 |
       |                        :  : : :           :  +     :  :           =
 |
  1050 ++    .*..*.*.*..       :   : :  : .*       :   *    :   :   .*.    =
 |
       *.  .*           *.*.  .*    :   *.  + .*..:     + .*    *.*.   *   =
 *
  1000 ++*.                 *.      *        *    *      *              :  =
 |
       |                                                                :  =
:|
       |                                                                 : =
:|
   950 ++                                                                ::=
 |
       |                                                                  *=
 |
   900 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[27]:/.runnable_load_avg

  24 ++--------------------------------------------------------------------=
-+
     |                                 *                                   =
 |
  22 ++                                :                                   =
 |
     |                                 ::                                  =
 |
     |                                 ::                                  =
 |
  20 ++                               : :                                  =
 |
     *                                : :                       *          =
 |
  18 ++                  *            :  :                      ::         =
 |
     |:                 : :           :  :                     : :         =
 |
  16 ++:                : :           :  :         .*          :  :        =
 |
     | *..     *       :   *      *   :  :       *.  :        :   *..      =
 |
     |       .. :      :    +    + + :    :     :    :        :            =
 |
  14 ++   *.*   :  .*.*      *..*   +:    *.*.. :     *.*..*.*       *.*.. =
.*
     |           *.                  *         *                          *=
 |
  12 ++--------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[27]:/.utilization_load_avg

  1200 ++------------------------------------------------------------------=
-+
       |                                                        *          =
 |
       |                                                        :+         =
 |
  1150 ++                                                       : *        =
 |
       |                                *                      :  :        =
 |
       *                         *..    ::                     :   :       =
 |
  1100 ++                 *      :     :  :                    :   :       =
 |
       |:        *       : +    :   *  :  :       *.*..    *.. :    :      =
 |
  1050 ++*..    : :      :  *.. :    +:    *.    :        :   :     :      =
 *
       |        : :  *..*      :      *      *   :     *. :   *     :      =
 |
       |    *  :   :+          *              + :        *           :     =
:|
  1000 ++    + :   *                           *                     *.*   =
:|
       |      *                                                         +  =
:|
       |                                                                 +:=
 |
   950 ++-----------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[28]:/.runnable_load_avg

  24 ++---------------*----------------------------------------------------=
-+
     |                :                                                    =
 |
  22 ++               ::                                                   =
 |
     |                ::                                                   =
 |
     |               : :                                                   =
 |
  20 ++              : :                                                   =
 |
     |               :  :                                                  =
 |
  18 ++              :  :                                                  =
 |
     |               :  :                                                  =
 |
  16 ++              :  :    *                                             =
 |
     |              :    :  : +   *..*.*..       *..                       =
 |
     |              :    :  :  + +              +                          =
 |
  14 *+*..*.*..*.*..*    *.*    *         *.*..*    *.*.*..*.*.. .*..*.*.. =
 |
     |                                                          *          =
.*
  12 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[28]:/.utilization_load_avg

  1200 ++------------------------------------------------------------------=
-+
       |                *                                                  =
 |
  1150 ++               :                                                  =
 |
       |               : :                                                 =
 |
       |               : :                                                 =
 |
  1100 ++     *        : :                                                 =
 |
       |     : +   *  :   :.*..  *.. .*.*..                                =
 |
  1050 *+    :  + + : :   *     +   *         .*..*              .*.. .*   =
 |
       |+  .*    *  : :        *           *.*     +  .*.*.    .*    *  :  =
 |
  1000 ++*.          :                              *.     *..*         :  =
 *
       |             *                                                   : =
 |
       |                                                                 : =
:|
   950 ++                                                                 :=
:|
       |                                                                  *=
 |
   900 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[29]:/.runnable_load_avg

  24 ++---------------------------*----------------------------------------=
-+
     |                            :                                        =
 |
  22 ++                           :       *                                =
 |
     | *                          ::      :                                =
 |
     | :                         : :     ::                                =
 |
  20 ++::                        : :     : :                 *             =
 |
     |: :                        : :     : :                 :             =
 |
  18 ++ :                        :  :    : :                : :            =
 *
     |:  :                       :  :   :  :                : :            =
 |
  16 ++  :                       :  :   :  :                :  :           =
:|
     |   :                   *  :   :   :   :               :  :           =
:|
     |    :                 + + :    : :    :              :    :          =
:|
  14 *+   *.  .*.*..*.*..*.*   +:    :.*    *..*.*..*.*.*..*    *.*..*.*.. =
:|
     |      *.                  *    *                                    :=
 |
  12 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[29]:/.utilization_load_avg

  1200 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  1150 ++*                                                                 =
 |
       | ::                                *                               =
 |
       |: :                         *     : :                 *            =
 |
  1100 ++  :                        :     : :            *   +:            =
 *
       |   :                   *   : :   :   *          : + +  :           =
 |
  1050 *+   :   .*. .*.. .*. ..:   : :   :    :   *.*.. :  *   :       *   =
 |
       |    *.*.   *    *   *   : :  :  *     : ..     *        :.*.. +:   =
:|
  1000 ++                       : :   :+       *                *    *  :  =
:|
       |                         :    *                                 :  =
:|
       |                         *                                       : =
:|
   950 ++                                                                ::=
 |
       |                                                                  :=
 |
   900 ++-----------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[30]:/.runnable_load_avg

  21 ++--------*-----------------------------------------------------------=
-+
     |         :                                                           =
 |
  20 ++       ::                                                           =
 |
  19 ++       : :                                                          =
 |
     |        : :                                                          =
 |
  18 ++      :  :                                                          =
 |
  17 ++      :  :                                   *                      =
 |
     |       :   :                                 ::                      =
 |
  16 ++     :    :                             *   : :                     =
 |
  15 ++     *    *..*           *             + : :  :     *      *        =
 *
     |     +         +        .. +           +  : :  :   .. +    + +       =
 |
  14 *+  .*           *..*.*.*    *..*.*..*.*    *    :.*    *..*   +      =
:|
  13 ++*.                                             *              *.*.. =
:|
     |                                                                    :=
 |
  12 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[30]:/.utilization_load_avg

  1200 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  1150 ++        *                                                         =
 |
       |       .. :                                                        =
 |
       |      *   :                                                        =
 |
  1100 ++     :    :             *..                                       =
 |
       |     :     *.            :            .*..*.*                      =
 *
  1050 ++    :       *.. .*.*.. :   *       .*       +    .*..*   *..      =
 |
       |    *           *       :    :  *..*          + .*     + +         =
:|
  1000 *+ ..                   *     : +               *        *    *.*   =
:|
       | *                            *                                 :  =
:|
       |                                                                 : =
:|
   950 ++                                                                ::=
 |
       |                                                                  *=
 |
   900 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[31]:/.runnable_load_avg

  28 ++--------------------------------------------------------------------=
-+
     |                                         *                           =
 |
  26 ++                                        :                           =
 |
  24 ++                                        :                           =
 |
     |                                        : :                          =
 |
  22 ++                                       : :                          =
 |
     |                                        : :                          =
 |
  20 ++          *                            : :                          =
 |
     |          : :                          :  :                          =
 |
  18 ++         :  :                         :  :                          =
 |
  16 ++       .*   :                         :   :              *          =
 |
     |     .*.      *.     *.  .*.  .*.*..   :   :             + +  .*     =
 |
  14 *+*..*           *.. +  *.   *.      *.:    *..*.*    *. +   *.  +    =
 *
     |                   *                  *          + ..  *         *.. =
+|
  12 ++-------------------------------------------------*-----------------*=
-+


                   sched_debug.cfs_rq[31]:/.utilization_load_avg

  1150 ++----------*-------------------------------------------------------=
-+
       |           ::                          *                           =
 |
       |          : :                          ::                          =
 |
  1100 ++         :  *..                       : :              *.         =
 |
       |         *          *    *            :  :              : *..      =
 |
       | *      +       *  : +  : :   *.*     :   *            :           =
 |
  1050 ++ +    +         + :  + :  : :   +    :   :        *.. :     *     =
 |
       *   + .*           *    *   : :    +   :    :   *  :   :       :    =
 *
  1000 ++   *                       *      *.:     :  : + :   *       :    =
 |
       |                                     *     :  :  *             *   =
:|
       |                                            ::                  :  =
:|
   950 ++                                           *                    : =
:|
       |                                                                 ::=
 |
       |                                                                  *=
 |
   900 ++------------------------------------------------------------------=
-+


                    sched_debug.cfs_rq[32]:/.runnable_load_avg

    15 ++-----*----*-*-----------*------*--*-------------*-*---------------=
-+
       |      ::   : :           ::     :  :             :  :              =
 |
  14.5 ++    : :  :   :         : :    :    :           :   :              =
 |
       |     :  : :   :         :  :   :    :           :    :             =
 |
       |    :   ::    :        :   :  :      :         :     :             =
 |
    14 ++*..*    *     :  *.*..*    *.*      *.*..*.*..*      *.*.*..*.*   =
 *
       | :             :  :                                            :   =
 |
  13.5 ++              : :                                              :  =
 |
       |:               ::                                              :  =
:|
    13 *+               *                                               :  =
:|
       |                                                                 : =
:|
       |                                                                 : =
:|
  12.5 ++                                                                ::=
 |
       |                                                                  :=
 |
    12 ++-----------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[32]:/.utilization_load_avg

  1150 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  1100 ++     *    *                                                       =
 |
       |     : +  : :                                      *               =
 |
       | *.. :  + : :                     .*              + +              =
 *
  1050 ++:  *    *   : .*.*.*..*.*..*.*.*.  :      .*..  *   + .*.*..      =
 |
       |:            *.                     : .*..*     +     *      *.*   =
 |
  1000 ++                                    *         *                :  =
:|
       *                                                                :  =
:|
   950 ++                                                                : =
:|
       |                                                                 : =
:|
       |                                                                  :=
 |
   900 ++                                                                 *=
 |
       |                                                                   =
 |
   850 ++------------------------------------------------------------------=
-+


                     sched_debug.cfs_rq[32]:/.tg_load_contrib

  180 ++-------------------------------------------------------------------=
-+
      |                                                                   *=
 |
  160 ++                                                                  :=
 |
  140 ++*                                             *                   :=
 |
      | :                                             ::                 : =
:|
  120 ++::             *                             : :                 : =
:|
  100 ++ :             :                             :  :                : =
:|
      |:  :           : :                    *      *   :                : =
:|
   80 ++  :           : :            *       ::     :    :              :  =
:|
   60 ++   :          : :            ::     : :    :     *              :  =
:|
      |:   *.        :  :   *    *  : :     :  *   :      :             :  =
 |
   40 ++     *..     :   : + :  + : :  :   :    : :       :             :  =
 |
   20 ++        *.  :    :+  : +  ::   :   :    : :        :   .*.     :   =
 |
      *           *.*    *    *    *    *.*      *         *..*   *..*.*   =
 *
    0 ++-------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[33]:/.runnable_load_avg

  20 ++*-------------------------------------------------------------------=
-+
     | :                                                                   =
 |
  19 ++::                                                                  =
 |
  18 ++ :                                                                  =
 |
     |: :                                                                  =
 |
  17 ++  :                                                                 =
 |
     |:  :                                                                 =
 |
  16 ++  :                           *                                     =
 |
     |   :                          +:                                     =
 |
  15 ++   :.*.. .*..               +  :            .*.           .*..      =
 |
  14 *+   *    *    *.*..*.*.*..  *   :   *.*..*.*.   *.*..     *    *.*   =
 *
     |                           +     :..                    ..        :  =
 |
  13 ++                         *      *                   *.*           : =
:|
     |                                                                   : =
:|
  12 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[33]:/.utilization_load_avg

  1100 ++------------------------------------------------------------------=
-+
  1080 ++     *    *.                                                      =
 |
       | *    :+  :  *..                            *..                    =
 |
  1060 ++ +  :  + :                                 :  *                   =
 |
  1040 ++  + :   *      *.*.        *.     *.*.*.. :    +                  =
 *
       *    *               *..    +  *   :        :     *     .*.*..*.*   =
 |
  1020 ++                      *. +    :  :       *       :   *        :   =
 |
  1000 ++                        *     : :                : ..          :  =
:|
   980 ++                               ::                 *            :  =
:|
       |                                *                                : =
:|
   960 ++                                                                : =
:|
   940 ++                                                                ::=
 |
       |                                                                  :=
 |
   920 ++                                                                 *=
 |
   900 ++------------------------------------------------------------------=
-+


                     sched_debug.cfs_rq[33]:/.tg_load_contrib

  160 ++-------------------------------------------------------------------=
-+
      |                                                                   *=
 |
  140 ++                                                                  :=
 |
  120 ++                                                                  :=
 |
      |                                        *    *                    : =
:|
  100 ++    .*                       *         ::  ::                    : =
:|
      |    * :                       ::        ::  ::                    : =
:|
   80 ++  +   :                      ::       :  ::  :                   : =
:|
      |  +    :                     :  :      :  *   :               *  :  =
:|
   60 ++*      :                    :  :      :      :              ::  :  =
:|
   40 *+       :  *                 :   :     :      :              : : :  =
 |
      |         :+ :         .*..   :   *    :        :            :  : :  =
 |
   20 ++        *  :       .*    *.:     +   :        : .*.*.. .*.*    :   =
 |
      |             *..*.*.        *      *..*        *.      *        *   =
 *
    0 ++-------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[34]:/.runnable_load_avg

  26 ++--------------------------------------------------------------------=
-+
     |                                                  *                  =
 |
  24 ++                                                 :                  =
 |
     |                                                 : :                 =
 |
  22 ++          *                                     : :                 =
 |
     |           :                                    :  :                 =
 |
  20 ++          ::                                   *  :                 =
 |
     |          : :                                   :   :                =
 |
  18 ++         :  :                                 :    :                =
 |
     |          :  :                                 :    :                =
 |
  16 ++         :  :            *                    :    :                =
 |
     |.*..     :    :         .. +                  :      :   .*.         =
 |
  14 *+   *.*..*    *.*..*.*.*    *..*.*..*.*..*.*..*      *.*.   *..*.*.. =
 *
     |                                                                     =
+|
  12 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[34]:/.utilization_load_avg

  1200 ++------------------------------------------------*-----------------=
-+
       |           *                                     :                 =
 |
  1150 ++          :                                    : :                =
 |
       |          : :                                   : :                =
 |
       |          : :                                   : :                =
 |
  1100 ++*       :  :           .*..                   :  :                =
 |
       |: +     .*  :          *                      .*   :               =
 |
  1050 ++  + .*.     : .*.   ..     *.*.          *.*.     *..*.*.*..      =
 |
       *    *        *.   *.*           *..*.*   +                   *.    =
 *
  1000 ++                                     + +                      *   =
 |
       |                                       *                        :  =
:|
       |                                                                 : =
:|
   950 ++                                                                ::=
 |
       |                                                                  *=
 |
   900 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[35]:/.runnable_load_avg

  24 ++--------------------------------------------------------------------=
-*
     |                                                                     =
 |
  22 ++                                     *                              =
 |
     |                               *      :                              =
 |
     |                               :      ::                             =
:|
  20 ++                             : :    : :                             =
:|
     |                              : :    : :                             =
:|
  18 ++                             : :    :  :                            =
:|
     |                             :  :    :  :                            =
:|
  16 ++                            :   :   :  :                            =
:|
     |                          *  :   *..:   :                            =
:|
     |                        .. +:       :    :                          :=
 |
  14 *+*.. .*..*.*..*    *.*.*    *       *    *.*..*. .*..*.  .*.  .*.*..:=
 |
     |    *          + ..                             *      *.   *.      :=
 |
  12 ++---------------*---------------------------------------------------*=
-+


                   sched_debug.cfs_rq[35]:/.utilization_load_avg

  1200 ++------------------------------------------------------------------=
-+
       |                                     *                             =
 |
  1150 ++                             *      :                             =
 *
       |                              ::    : :                            =
 |
  1100 ++                            : :    : :                            =
 |
       |      *..  *.     *.         :  :  :   :                           =
:|
  1050 ++    +    +  *.. :  *..*.*..*   *..*   *..*.     *.     *.  .*.    =
:|
       *.*..*    *       :                          *.. +  *.. :  *.   *   =
:|
  1000 ++               *                              *       :        :  =
:|
       |                                                      *         :  =
:|
   950 ++                                                                ::=
 |
       |                                                                 ::=
 |
   900 ++                                                                 *=
 |
       |                                                                   =
 |
   850 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[36]:/.runnable_load_avg

  21 ++----------*---------------------------------------------------------=
-+
     |           :                                                         =
 |
  20 ++          ::                                                        =
 |
  19 ++         : :                                                        =
 |
     |          : :                                                        =
 |
  18 ++         :  :                                                       =
 |
  17 ++         :  :                                                       =
 |
     |          :  :                                                       =
 |
  16 ++         :   :                                        *             =
 |
  15 ++*       :    *                                       : +            =
 |
     |+ +      :     :                                      :  +           =
 |
  14 *+  + .*..*     :  .*.*.*..*.*.. .*..*.*.. .*.. .*.*..*    *.*..*.*   =
 *
  13 ++   *           *.             *         *    *                   +  =
:|
     |                                                                   + =
:|
  12 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[36]:/.utilization_load_avg

  1150 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
       |           *                                                       =
 |
  1100 *+         : +                                                      =
 |
       | *        :  *                                        *            =
 |
       |  :   *..*    :                     .*.*..          .. +           =
 |
  1050 ++ :   :       :    .*..*.  .*     .*      *       .*    *.*..*     =
 |
       |   : :         :  *      *.  + .*.         +  .*.*            +    =
 *
  1000 ++  : :         : +            *             *.                 *   =
 |
       |    :           *                                               :  =
:|
       |    *                                                           :  =
:|
   950 ++                                                                : =
:|
       |                                                                 ::=
 |
       |                                                                  *=
 |
   900 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[37]:/.runnable_load_avg

  24 ++--------------------------------------------------------------------=
-+
     |                     *                                               =
 |
  22 ++                    :                                               =
 |
     |                     :                                               =
 |
     |                    : :                                              =
 |
  20 ++                   : :                                              =
 |
     |                    : :                                              =
 |
  18 ++                   : :                                              =
 |
     |                    : :                                              =
 |
  16 ++                   : :                                              =
 |
     |           *..     :   :       *.*..              *..*      *        =
 |
     |          +        :   :     ..                  +    +    + +       =
 |
  14 *+*..*.*..*    *.*..*   *..*.*       *.*..*.*..*.*      *..*   + .*.. =
 *
     |                                                               *     =
+|
  12 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[37]:/.utilization_load_avg

  1200 ++------------------------------------------------------------------=
-+
       |                    *                                              =
 |
  1150 ++                   ::                                             =
 |
       |                   : :                                             =
 |
       |                   :  :                                            =
 |
  1100 ++                  :  :                                            =
 |
       |           *       :   :                         *.            *   =
 |
  1050 ++*..      + +  .*.:    *.      .*..   .*..      +  *..   .*.. ::   =
 |
       |:        *   *.   *      *..*.*     .*    *.  .*       .*     : :  =
 *
  1000 ++   *. ..                          *        *.        *      *  :  =
 |
       *      *                                                          : =
:|
       |                                                                 : =
:|
   950 ++                                                                 :=
 |
       |                                                                  *=
 |
   900 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[38]:/.runnable_load_avg

  20 ++-------------------------------------------------------------------*=
-+
     |                                                                    :=
 |
  19 ++                    *                                              :=
 |
     |                     :                                             : =
:|
  18 ++                    :                                             : =
:|
     |                    : :                                            : =
:|
  17 ++                   : :                                            : =
:|
     |                    : :                                           :  =
:|
  16 ++                   : :                                           :  =
:|
     |                    : :                                           :  =
 |
  15 ++        *         :   :       *.*..*         *             *..   :  =
 |
     |       .. +        :   :     ..      :      .. +           +     :   =
 |
  14 ++*..*.*    *..*.*..*   *..*.*        :   *.*    *    *.*..*    *.*   =
 *
     |+                                     :..        + ..                =
 |
  13 *+-------------------------------------*-----------*------------------=
-+


                   sched_debug.cfs_rq[38]:/.utilization_load_avg

  1140 ++------------------------------------------------------------------=
-+
       |                    *                                              =
 |
  1120 ++                   ::                                             =
 |
  1100 ++                  : :                                             =
 |
       |                   :  :                                            =
 |
  1080 ++                  :  :                       .*                   =
 |
       |                  :    :        *..*       .*. :                   =
 |
  1060 ++*..              *    *       :    +     *     :                  =
 |
       *    *            :      +      :     *   +      :                  =
 *
  1040 ++    :   *. .*.. :       *.. .*       + +       :  *          .*   =
 |
  1020 ++    :  +  *    *           *          *        :  ::     *..*  +  =
:|
       |      :+                                         ::  :   +       + =
:|
  1000 ++     *                                          ::  : .*         *=
 |
       |                                                 *    *            =
 |
   980 ++------------------------------------------------------------------=
-+


                     sched_debug.cfs_rq[38]:/.tg_load_contrib

  400 ++-------------------------------------------------------------------=
-+
      |                                          *                         =
 |
  350 ++                                         :                         =
 |
  300 ++                                         ::                        =
 |
      |                                         : :                        =
 |
  250 ++                                        : :                        =
 |
      |                                         :  :                       =
 |
  200 ++                                        :  :                       =
 |
      |                                         :  :                       =
 |
  150 ++                                       :    :                      =
 |
  100 ++                                       :    *                     *=
 |
      | *                                     .*     :                   : =
:|
   50 ++ +       .*          .*..      .*.*..*       :                   : =
:|
      *   +    .*  +  .*.*..*    *. .*.               *..*.  .*.*.*..   :  =
 *
    0 ++---*-*------*--------------*-----------------------*---------*-*---=
-+


                    sched_debug.cfs_rq[39]:/.runnable_load_avg

    16 ++-----------------*------------------------------------------------=
-+
       |                  :                                                =
 |
  15.5 ++                 ::                                               =
 |
       |                 : :                                               =
 |
       |                 :  :                                              =
 |
    15 ++                :  *    *..*.*      *.*    *    *    *        *   =
 |
       |                 :   :   :     :     :  :   ::   ::  : :       :   =
 |
  14.5 ++               :     : :      :    :    : :  : : :  : :      : :  =
 |
       |                :     : :       :   :    : :  : :  ::   :     : :  =
 |
    14 *+*..*.*    *.*..*      *        *..*      *    *   *    *.*..*  :  =
 *
       |       :   :                                                     : =
 |
       |       :  :                                                      : =
:|
  13.5 ++       : :                                                      : =
:|
       |        ::                                                        :=
 |
    13 ++--------*--------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[39]:/.utilization_load_avg

  1100 ++------------------------------------------------------------------=
-+
       |                            *                                      =
 |
  1080 ++                          : :                                     =
 |
  1060 ++     *          .*        : :            *      *.                =
 |
       |     : +        *  :   *  :   :         .. +    :  *..         *   =
 |
  1040 *+    :  + .*   +   :  + + :   *.*.. .*.*    *.. :     *.*     +:   =
 *
  1020 ++  .*    *  + +     :+   *         *           *         +  .*  :  =
 |
       | *.          *      *                                     *.    :  =
 |
  1000 ++                                                               :  =
:|
   980 ++                                                                : =
:|
       |                                                                 : =
:|
   960 ++                                                                : =
:|
   940 ++                                                                 :=
 |
       |                                                                  *=
 |
   920 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[40]:/.runnable_load_avg

  22 ++-----*--------------------------------------------------------------=
-+
     |      :                                                              =
 |
     |      ::                                                             =
 |
  20 ++     ::                                                             =
 |
     |     : :                                                             =
 |
     |     : :                                                             =
 |
  18 ++    :  :                                                            =
 |
     |     :  :                                                            =
 |
  16 ++    :  :                                                            =
 |
     |     :  :                                                            =
 |
     |     :   :                                                     *.*   =
 *
  14 ++   :    *      *..    *..  *..*    *         *.*.*..*    *   +   :  =
 |
     |    :     +    :      +    +    + .. +      ..        + .. + +     : =
:|
     |.*..:      *.. :   *.*    *      *    *..*.*           *    *      : =
:|
  12 *+---*---------*-----------------------------------------------------*=
-+


                   sched_debug.cfs_rq[40]:/.utilization_load_avg

  1100 ++------------------------------------------------------------------=
-+
  1080 ++                                    *                  *          =
 |
       |                                     :         *.       :+         =
 *
  1060 ++               *               *.. : :       :  *      : *.. .*   =
 |
  1040 ++     *..      : :     *    *  :    : :       :   +    :     * :   =
 |
       |      :  *.*   : :    + + .. + :   *  :      :     *   :        :  =
:|
  1020 ++*.. :      : :   *. +   *    *        :     :      :  :        :  =
:|
  1000 ++    :      : :     *                  *..*.*        : :        :  =
:|
   980 *+   *        *                                       ::          : =
:|
       |                                                      *          : =
:|
   960 ++                                                                : =
:|
   940 ++                                                                ::=
 |
       |                                                                  :=
 |
   920 ++                                                                 *=
 |
   900 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[41]:/.runnable_load_avg

  19 ++----------------------*---------------------------------------------=
-+
     |                       :                                             =
 |
  18 ++                      ::                                            =
 |
     |                      : :                                            =
 |
  17 ++                     : :                                            =
 |
     |                      : :                                            =
 |
  16 ++                     :  :                                          *=
 |
     |                      :  :                                         : =
:|
  15 ++                    :   :                                         : =
:|
     |                     :   :                                        :  =
 |
  14 *+               *..*.*    : *..     *.*..*.*..*.*.*..     *    *.*   =
 *
     |+              +          :+      ..                     : + ..      =
 |
  13 ++*..*.*..*.*..*           *    *.*                   *   :  *        =
 |
     |                                                      + :            =
 |
  12 ++------------------------------------------------------*-------------=
-+


                   sched_debug.cfs_rq[41]:/.utilization_load_avg

  1140 ++----------------------*-------------------------------------------=
-+
       |                       :             *                             =
 *
  1120 ++                     ::             :                             =
 |
  1100 ++                     : :           : :                            =
 |
       |                      : :           : :                            =
:|
  1080 ++                    :  :           : :                            =
:|
  1060 ++            *..     :  :    .*.*.. : :                            =
:|
       |            :    .*.:    :  *      :   :                       *   =
:|
  1040 *+           :   *   *    :..       *   *..  *..*.*.           : :  =
:|
  1020 ++   *    *.*             *                 +       *    *     :  ::=
 |
       |: .. :  +                                 *         :   :+  .*   ::=
 |
  1000 ++*   : +                                            :  :  *.      *=
 |
   980 ++     *                                              : :           =
 |
       |                                                     ::            =
 |
   960 ++-----------------------------------------------------*------------=
-+


                   sched_debug.cfs_rq[42]:/.runnable_load_avg

  19 ++---------------------------------------------*----------------------=
-+
     |                                              :                      =
 |
  18 *+                                            ::                      =
 |
     |                                             : :                     =
 |
     |:                                            : :                     =
 |
  17 ++                                           :  :                     =
 |
     |:                                           :  :                     =
 |
  16 ++                                           :  :                     =
 |
     | :                                         :   :                     =
 |
  15 ++*                                         *    :                    =
 *
     |  :                                       :     :                    =
 |
     |  :                                       :     :                    =
:|
  14 ++  :  *..*.*..     *   *..*.*..  *..  *..*      *.*..*    *.*..  *.. =
:|
     |   : +           .. + +         +    +                + ..      +   :=
 |
  13 ++---*---------*-*----*---------*----*------------------*-------*----*=
-+


                   sched_debug.cfs_rq[42]:/.utilization_load_avg

  1200 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  1150 ++                                                *                 =
 |
       |                                                 :                 =
 |
       |                                                : :                =
 |
  1100 *+                        *..                    : :                =
 |
       | *..                    :                 *.   :  :                =
 |
  1050 ++                       :   *.       *. ..  *..*   :   .*.*.. .*   =
 *
       |    *    *.*.*..*.*.  .*      *.*.. :  *           *..*      *  :  =
 |
  1000 ++    + ..           *.              :                           :  =
:|
       |      *                            *                             : =
:|
       |                                                                 ::=
 |
   950 ++                                                                 *=
 |
       |                                                                   =
 |
   900 ++------------------------------------------------------------------=
-+


                    sched_debug.cfs_rq[43]:/.runnable_load_avg

    15 ++----------------------------------*-------------------------------=
-+
       |                                   :                               =
 |
       |                                   ::                              =
 |
  14.5 ++                                 : :                              =
 |
       |                                  : :                              =
 |
       |                                  : :                              =
 |
       |                                  :  :                             =
 |
    14 ++*    *    *.*..*.*    *.*..*     :  *.*    *    *    *      *.*   =
 *
       | :    :    :      :    :    :    :     :    :    :    :      : :   =
 |
       |: :  : :  :        :  :      :   :      :  : :  : :  : :    :   :  =
:|
  13.5 ++ :  : :  :        :  :      :   :      :  : :  : :  : :    :   :  =
:|
       |:  : :  : :        : :       :   :       : :  : : : :  :   :     : =
:|
       |:  : :  : :        : :       :  :        : :  : : : :  :   :     : =
:|
       |    :    :          :         : :         :    :   :    : :       :=
 |
    13 *+---*----*----------*---------*-*---------*----*---*----*-*-------*=
-+


                   sched_debug.cfs_rq[43]:/.utilization_load_avg

  1100 ++------------------------------------------------------------------=
-+
       |                            *               *                      =
 |
  1080 ++               *.*        ::               :                      =
 |
  1060 ++              +  :        : :         *   : :                     =
 |
       |           *. +    :      :  :        : :  : :               *     =
 *
  1040 ++*..  *.. +  *     :   *.*   :     *. :  : :  :  *.  .*     + +    =
 |
  1020 ++:   +   *          :..      :   ..  *   ::   : :  *. :    +   *   =
 |
       |:   *               *         :.*         *    ::      :  *    :   =
:|
  1000 ++                             *                *       : :      :  =
:|
   980 *+                                                       ::      :  =
:|
       |                                                        *        : =
:|
   960 ++                                                                ::=
 |
   940 ++                                                                 :=
 |
       |                                                                  *=
 |
   920 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[44]:/.runnable_load_avg

  18 ++----------------------*---------------------------------------------=
-+
     |                       :                                             =
 |
  17 ++                      ::                                            =
 |
     |                      : :                                            =
 |
  16 ++                     :  :                                           =
 |
     |                      :  :                                           =
 |
  15 ++                     :  :                                           =
 |
     |                      :   :                                          =
 |
  14 *+*..  *..*.*..*.*..* :    *.*..*    *.*..*.*..*   *..*.*..*    *.*   =
 *
     |     +              +:          + ..           + +         + ..   :  =
 |
  13 ++   *                *           *              *           *     :  =
:|
     |                                                                   : =
:|
  12 ++                                                                  : =
:|
     |                                                                    :=
 |
  11 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[44]:/.utilization_load_avg

  1150 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  1100 *+                                                                  =
 |
       |:                      *                       *.*.*..*      *     =
 |
       |:                    .. +          *         ..        +    + :    =
 |
  1050 ++*.. .*.. .*.*..*.*.*    *..*.    + +      .*           *. +  :    =
 |
       |    *    *                    *. +   *.*..*               *    *   =
 *
  1000 ++                               *                              :   =
 |
       |                                                                :  =
:|
   950 ++                                                               :  =
:|
       |                                                                 : =
:|
       |                                                                 : =
:|
   900 ++                                                                 :=
 |
       |                                                                  *=
 |
   850 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[45]:/.runnable_load_avg

  30 ++--------------------------------------------------------------------=
-+
     |                                                                    *=
 |
  28 ++                                                                   :=
 |
  26 ++                                                                  ::=
 |
     |                                                                   : =
:|
  24 ++                                                                  : =
:|
  22 ++                                                                  : =
:|
     |                                                                  :  =
:|
  20 ++                                                                 :  =
:|
  18 ++                                                                 :  =
:|
     |                                                                  :  =
 |
  16 ++                                                                :   =
 |
  14 ++  .*.  .*.    .*..*. .*.. .*.. .*..*.*..*.*..*.*.*..*.  .*.    .*   =
 *
     *.*.   *.   *..*      *    *    *                       *.   *..*     =
 |
  12 ++--------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[45]:/.utilization_load_avg

  1100 ++---------------------------*--------------------------------------=
-+
       |                            :                                  *   =
 |
  1080 ++                          : :                                +:   =
 |
  1060 ++        *                 : :                    .*         * :   =
 |
       |    *   +:                :  :  *..*.    .*      *  +        :  :  =
 |
  1040 ++  : + +  :            *  :  :  :    *.*.  :    :    + .*   :   :  =
 |
  1020 ++  :  *   :    .*.    : +:    ::           :    :     * :   :   :  =
 |
       *  :        :.*.   *   :  *    ::            *..*         :  :   :  =
 *
  1000 ++ :        *       : :        *                          : :     : =
 |
   980 ++*                 : :                                   : :     : =
:|
       |                    *                                     :      : =
:|
   960 ++                                                         *      : =
:|
   940 ++                                                                 :=
:|
       |                                                                  :=
 |
   920 ++-----------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[46]:/.runnable_load_avg

  19 ++---*----------------------------------------------------------------=
-+
     |    :                                                                =
 |
  18 ++  ::                                                                =
 |
     |   : :                                                               =
 |
  17 ++  : :                                                               =
 |
     |   : :                                                               =
 |
  16 ++ :  :                                                               =
 |
     |  :  :                                                               =
 |
  15 ++ :  :   *                                      *                    =
 *
     | :    : : +                                    + +                   =
 |
  14 ++*    : :  *..  *..*.*    *    *.*..*    *.*..*   *..  *..*    *.*   =
:|
     |+     ::       +      + .. + ..      + ..             +    + ..   :  =
:|
  13 *+     *       *        *    *         *              *      *      : =
:|
     |                                                                   ::=
 |
  12 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[46]:/.utilization_load_avg

  1100 ++---------------*--------------------------------------------------=
-+
       |               : +              *                                  =
 |
       |   .*.         :  *             :+             *.*.  .*            =
 *
  1050 ++*.   *..*.   :    +           :  +      .*. ..    *.  +           =
 |
       |+          *. :     *..*.  .*  :   *.*.*.   *           *.    .*   =
 |
       *             *           *.  : :                          *..* :   =
:|
  1000 ++                            ::                                 :  =
:|
       |                              *                                 :  =
:|
   950 ++                                                               :  =
:|
       |                                                                 : =
:|
       |                                                                 : =
:|
   900 ++                                                                ::=
 |
       |                                                                  :=
 |
       |                                                                  *=
 |
   850 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[47]:/.runnable_load_avg

  19 ++---------------*----------------------------------------------------=
-+
     |                :                                                    =
 |
  18 ++               ::                                                   =
 |
     |               : :                                                   =
 |
  17 ++              : :                                                   =
 |
     |               :  :                                                  =
 |
  16 ++              :  :            *                     *               =
 |
     |              :   :           ::                    : :              =
 |
  15 ++   *      *..*   :       *   : :          *..  *   : :              =
 |
     |  .. :    +        :     : + :  :         +    + + :   :             =
 |
  14 *+*   :   *         *     :  *   :   *    *    *   *    *..*.*..*.*   =
 *
     |      :..           +   :        :.. + ..                         :  =
 |
  13 ++     *              *.*         *    *                            : =
:|
     |                                                                   : =
:|
  12 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[47]:/.utilization_load_avg

  1120 ++---------------*--------*-----------------------------------------=
-+
  1100 ++   *          +:        ::   *                                    =
 |
       |   ::      *. +  :       ::   :+          *                        =
 |
  1080 ++  : :     : *   :      :  : :  *        : :   *                   =
 |
  1060 ++ :  :    :      :      :  : :   :       : :  + :     *            =
 |
       |  :  :    :      :      :   :     :     :   :+  :    : :      .*   =
 *
  1040 ++*   :   *        :     :   *     :    *    *    *   : : .*..* :   =
 |
  1020 ++     :..         :.*..:           *. +           + :   *       :  =
 |
  1000 *+     *           *    :             *             *            :  =
:|
       |                       *                                        :  =
:|
   980 ++                                                                : =
:|
   960 ++                                                                : =
:|
       |                                                                 ::=
 |
   940 ++                                                                 :=
 |
   920 ++-----------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[48]:/.runnable_load_avg

  19 ++-----------------------------------------------------------*--------=
-+
     |                                                            :        =
 |
  18 ++                                                           ::       =
 |
     |                                                           : :       =
 |
  17 ++                                                          :  :      =
 |
     |                                                           :  :      =
 |
  16 ++                                                          :  :      =
 |
     |                                                           :   :     =
 |
  15 ++     *       *        *..                                :    *     =
 |
     |     + :    .. :      +                                   :     +    =
 |
  14 *+   *   :  *   :     *    *.*..  *..*    *    *.*.*..     *      *   =
 *
     |+ ..    : +     :   +           +    + .. + ..          ..        :  =
 |
  13 ++*       *      *..*           *      *    *         *.*           : =
:|
     |                                                                   : =
:|
  12 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[48]:/.utilization_load_avg

  1100 ++---------------------------------------------------------*--------=
-+
       |      *               .*                         *       : +   *   =
 |
       *     : +     *..    *.  :   *                   : :      :  + +:   =
 |
  1050 ++    :  +   +       :   : .. +     *            : :    .*    *  :  =
 *
       |:   *    *.*    *  :     *    *   + + .*..    .*   *..*         :  =
 |
       | :..             : :           + +   *     .*.                  :  =
 |
  1000 ++*               : :            *         *                     :  =
:|
       |                  :                                              : =
:|
   950 ++                 *                                              : =
:|
       |                                                                 : =
:|
       |                                                                 ::=
 |
   900 ++                                                                 :=
 |
       |                                                                  *=
 |
       |                                                                   =
 |
   850 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[49]:/.runnable_load_avg

  26 ++--------*-----------------------------------------------------------=
-+
     |         :                                                           =
 |
  24 ++        :                                                           =
 |
     |        : :                                                          =
 |
  22 ++       : :                                                          =
 |
     |        : :                                                          =
 |
  20 ++       : :                                                          =
 |
     |       :  :                                                          =
 |
  18 ++      :  :                                                          =
 |
     |       :   :                                                         =
 |
  16 ++      :   :                                                         =
 |
     |      :    : .*.                                                     =
 |
  14 *+*..*.*    *.   *..*. .*..*.*..*.*..*.*..*.  .*.*.*..*.*..*.*..*.*..*=
.|
     |                     *                     *.                        =
 *
  12 ++--------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[49]:/.utilization_load_avg

  1080 ++------------*---------*-------------------------------------------=
-+
       |             ::       : :                                          =
 |
  1060 ++*       *  : :       : :                   *..*                   =
 |
       | ::    ..:  :  :  *  :   *..*.             +    :     *.*      *   =
 |
  1040 ++  :  *   : :  : + + :        *.  .*      *     :    :   :    +:   =
 |
       |:  : +    : :   *   *           *.  :   ..       *   :   :   *  :  =
 |
  1020 *+   *      :                        :  *          : :     :..   :  =
 |
       |           *                         :+           : :     *     :  =
 *
  1000 ++                                    *             *             : =
 |
       |                                                                 : =
:|
   980 ++                                                                : =
:|
       |                                                                 : =
:|
   960 ++                                                                 :=
 |
       |                                                                  *=
 |
   940 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[50]:/.runnable_load_avg

  20 ++-----------------------------------------------------------*--------=
-+
     |                                                            :        =
 |
  19 ++                                *                          ::       =
 |
  18 ++                                :                         : :       =
 |
     |                                 ::                        : :       =
 |
  17 ++                      *        : :                        :  :      =
 |
     |                       ::       : :                        :  :      =
 |
  16 ++                     : :       :  :                       :  :      =
 |
     |                      :  :      :  :                      :   :      =
 |
  15 ++       .*.     *    :   :     :   :                      :    :     =
 |
  14 *+*..*.*.   *.. : +   *    *.*..*   :     *.*..*.*.*..*.*..*    *     =
 *
     |               :  + +               :  ..                       +    =
 |
  13 ++             *    *                *.*                          *.. =
:|
     |                                                                     =
:|
  12 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[50]:/.utilization_load_avg

  1100 ++------------------------------------------------------------------=
-+
  1080 ++                      *                                           =
 |
       |                      : :      .*                         *..      =
 |
  1060 ++    .*.. .*          : :    .* :      *..    .*.        +   *     =
 |
  1040 *+   *    *  +  .*.*  :   : .*    :     :  *.*.   *.*..*.*     :    =
 |
  1020 ++ ..         *.    + :   *.      :    :                       :    =
 *
  1000 ++*                  *             :   :                        *   =
 |
       |                                  :  *                         :   =
 |
   980 ++                                 : :                           :  =
:|
   960 ++                                  ::                           :  =
:|
   940 ++                                  *                             : =
:|
   920 ++                                                                : =
:|
       |                                                                  :=
 |
   900 ++                                                                 *=
 |
   880 ++------------------------------------------------------------------=
-+


                    sched_debug.cfs_rq[51]:/.runnable_load_avg

    15 ++--------*-*--------*----------------------------------------------=
-+
       |        :  :        ::                                             =
 |
  14.5 ++       :   :      : :                                             =
 |
       |       :    :      :  :                                            =
 |
       |       :     :    :   :                                            =
 |
    14 *+*..*.*      *..*.*    *    *   *      *    *..*.*.*..*.*.*..*.*   =
 *
       |                        :  ::   ::     ::   :                  :   =
 |
  13.5 ++                       :  ::   : :   :  : :                    :  =
 |
       |                         ::  : :  :   :  : :                    :  =
:|
    13 ++                        *   : :   *.*    *                     :  =
:|
       |                             : :                                 : =
:|
       |                             : :                                 : =
:|
  12.5 ++                             :                                  ::=
 |
       |                              :                                   :=
 |
    12 ++-----------------------------*-----------------------------------*=
-+


                   sched_debug.cfs_rq[51]:/.utilization_load_avg

  1150 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
       |                                                        *          =
 |
  1100 ++                                                       ::         =
 |
       |           *.*..                                       : :         =
 |
       |          +        .*..*.                              :  :   .*   =
 |
  1050 ++*..*.*..*      *.*      *..    *.. .*         *.*.*.. :  *..* :   =
 *
       *                               :   *  +      ..       :         :  =
 |
  1000 ++                           *. :       *..*.*         *         :  =
 |
       |                              *                                 :  =
:|
       |                                                                 : =
:|
   950 ++                                                                : =
:|
       |                                                                 : =
:|
       |                                                                  :=
 |
   900 ++-----------------------------------------------------------------*=
-+


                     sched_debug.cfs_rq[51]:/.tg_load_contrib

  200 ++-------------------------------------*-----------------------------=
-+
  180 ++                                     :                            *=
.*
      |                                     ::                            :=
 |
  160 ++                                    : :                           :=
 |
  140 ++                                    : :                          : =
 |
      |                                    :  :                          : =
 |
  120 ++                                   :  :            *         *   : =
 |
  100 ++                    *              :  :            :        ::   : =
 |
   80 ++     *             ::             :    :          : :       : : :  =
 |
      |      ::            : :          *.*    :          : :      :  : :  =
 |
   60 ++    : :           :  :         :       *          :  :    *   : :  =
 |
   40 *+    :  :  *.      :  :         :        :         :  :   +    : :  =
 |
      |+  .*   : +  *.. .*    :       :         :        :    :.*      :   =
 |
   20 ++*.      *      *      *..*.*.*           *..*.*..*    *        *   =
 |
    0 ++-------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[52]:/.runnable_load_avg

  18 ++-----------------------------------*--------------------------------=
-+
     |                                    :                                =
 |
  17 ++                                  ::                                =
 |
     |                                   : :                               =
 |
     |                                   : :                               =
 |
  16 ++                                 :  :                               =
 |
     |                                  :  :                               =
 |
  15 ++   *    *           *            :  :            *..          *     =
 |
     |  .. + .. +         + +          :   :           +            : +    =
 |
  14 *+*    *    *..*.*..*   *..*    *.*    :  *      *    *.*..*   :  *   =
 *
     |                           :  +       : + :    :           : :    :  =
 |
     |                           : +        :+  :    :           : :    :  =
:|
  13 ++                           *         *    *..*             *      : =
:|
     |                                                                   ::=
 |
  12 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[52]:/.utilization_load_avg

  1140 ++------------------------------------------------------------------=
-+
  1120 ++                                  *                               =
 |
       |                                   :                               =
 |
  1100 *+                                 : :                              =
 *
  1080 ++  .*    *                        : :                              =
 |
  1060 ++*.  :  : :  *..    *..           : :          *.                  =
 |
  1040 ++    :  : : :      :   *.     *  :  :  *..    :  *    *.*.  .*.    =
:|
       |      ::   ::   *. :     *.. + : :   ::       :   + ..    *.   *   =
:|
  1020 ++     *    *      *         *  ::    ::   *. :     *            :  =
:|
  1000 ++                               *    *      *                   :  =
:|
   980 ++                                                                : =
:|
   960 ++                                                                ::=
 |
       |                                                                  :=
 |
   940 ++                                                                 *=
 |
   920 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[53]:/.runnable_load_avg

  18 ++-------------------------------------*------------------------------=
-+
     |                                      :                              =
 |
  17 ++                                     ::                             =
 |
     |                                     : :                             =
 |
  16 ++                      *             : :                             =
 |
     |                       ::            :  :                            =
 |
  15 ++*..            *..   : :            :  :  *..                       =
 |
     |+              +      :  :          :   :  :                         =
 |
  14 *+   *.*..     *    *  :  :  *..  *..*   : :   *.*      *..*    *.*   =
 *
     |            ..      +:    :+    +        ::      +    +    + ..   :  =
 |
  13 ++        *.*         *    *    *         *        *..*      *     :  =
:|
     |                                                                   : =
:|
  12 ++                                                                  : =
:|
     |                                                                    :=
 |
  11 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[53]:/.utilization_load_avg

  1200 ++------------------------------------------------------------------=
-+
       |                       *                                           =
 |
  1150 ++                      :                                           =
 |
       |                      : :                                    *     =
 |
  1100 ++                 *   : :            *         *            : :    =
 |
       |                 + : :  :           : :       + +           : :    =
 |
  1050 *+*..*      *.  .*  : :   : .*. .*.. : :      +   *.    .*  :   *   =
 |
       |     :    +  *.     *    *.   *    *   *..*.*      *..*  + :   :   =
 |
  1000 ++    :  .*                                                *     :  =
 *
       |      *.                                                        :  =
 |
   950 ++                                                                : =
:|
       |                                                                 : =
:|
   900 ++                                                                 :=
 |
       |                                                                  *=
 |
   850 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[54]:/.runnable_load_avg

  24 ++*-------------------------------------------------------------------=
-+
     | :                                                                   =
 |
  22 ++:                                                                   =
 |
     | ::                                                                  =
 |
     |: :                                                                  =
 |
  20 ++ :                                                                  =
 |
     |: :                                             *                    =
 |
  18 ++  :                                            :                    =
 |
     |:  :                                           : :                   =
 |
  16 ++  :                                           : :                   =
 |
     |   :                        *                  : :     *..           =
 |
     |    :                      : +                :   :   :              =
 |
  14 *+   :.*..*.*..*.  .*. .*.. :  +    .*.*..    .*   *.. :   *.*..*.*.. =
 *
     |    *           *.   *    *    *.*.      *.*.        *               =
+|
  12 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[54]:/.utilization_load_avg

  1150 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  1100 ++*                                             *.                  =
 |
       |: :                                           +  *        *..*     =
 |
       |:  :        .*..                  .*.        +    :       :   :    =
 |
  1050 *+  :     *.*     .*.        *. .*.   *.    .*     :   *  :    :    =
 *
       |    *. ..       *   *..*   +  *        *..*        :.. + :     *   =
 |
  1000 ++     *                 + +                        *    *      :   =
 |
       |                         *                                      :  =
:|
   950 ++                                                               :  =
:|
       |                                                                 : =
:|
       |                                                                 : =
:|
   900 ++                                                                 :=
 |
       |                                                                  *=
 |
   850 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[55]:/.runnable_load_avg

  18 ++-----*--------------------------------------------------------------=
-+
     |      :                                                              =
 |
  17 ++    : :                                                             =
 |
     |     : :                                                             =
 |
     |     : :                                                             =
 |
  16 ++    :  :                                                            =
 |
     |    :   :                                                            =
 |
  15 ++   *   :     *             *..*      *..                        *   =
 |
     |  ..     :  .. +            :   +    +                          + :  =
 |
  14 ++*       *.*    *..*.*.*   :     *..*    *.*    *.*..*.*..*    *  :  =
 *
     |:                       :  :                +  :           :  +    : =
:|
     |:                       :  :                 + :           : +     : =
:|
  13 *+                        : :                  *             *       *=
 |
     |                         ::                                          =
 |
  12 ++-------------------------*------------------------------------------=
-+


                   sched_debug.cfs_rq[55]:/.utilization_load_avg

  1150 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
       |             *                                                     =
 |
  1100 ++    .*      ::                                                *   =
 |
       |    *  :    : :        *                                      ::   =
 |
       |   +    :   :  :     ..:    *.*.     *         *              : :  =
 |
  1050 ++ +     :   :  :    *   :   :   *.. + +  .*   + + .*     .*..*  :  =
 |
       *.*       *.:    *. +    :  :       *   *.  + +   *  +   *       :  =
 |
  1000 ++          *      *     :  :                *        + +         : =
 *
       |                        : :                           *          : =
 |
       |                         ::                                      : =
:|
   950 ++                        *                                       : =
:|
       |                                                                  :=
 |
       |                                                                  *=
 |
   900 ++------------------------------------------------------------------=
-+


                    sched_debug.cfs_rq[56]:/.runnable_load_avg

    16 ++---------------------------------------------------------*--------=
-+
       |                                                          :        =
 |
  15.5 ++                                                        : :       =
 |
    15 ++   *        *                  *    *         *         : :       =
 |
       |   : :       :                  ::   ::       : :        :  :      =
 |
  14.5 ++  : :      : :                :  : : :       : :        :  :      =
 |
       |  :   :     : :                :  : :  :     :   :      :    :     =
 |
    14 *+*    *..*  :  :       *    *.*    *   *    *    *.*    *    *.*   =
 *
       |          : :  :      + :  +            +  :        +  :       :   =
 |
  13.5 ++         ::    :    +  : +              + :         + :        :  =
:|
    13 ++          *    *.*.*    *                *           *         :  =
:|
       |                                                                 : =
:|
  12.5 ++                                                                : =
:|
       |                                                                  :=
 |
    12 ++-----------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[56]:/.utilization_load_avg

  1150 ++------------------------------------------------------------------=
-+
       |                                                             *     =
 |
  1100 ++                                                           : :    =
 |
       |                                *                           : :    =
 |
       |         *   *..                :+             *.*     .*. :   :   =
 |
  1050 ++*..   .. : :                  :  +   .*..   ..   +  .*   *    *   =
 |
       *    *.*   : :   *. .*..*.*..*  :   *.*     .*      *.          :   =
 *
  1000 ++          *      *          +:           *                     :  =
 |
       |                              *                                 :  =
:|
   950 ++                                                                : =
:|
       |                                                                 : =
:|
       |                                                                  :=
 |
   900 ++                                                                 *=
 |
       |                                                                   =
 |
   850 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[57]:/.runnable_load_avg

  65 ++--------------------------------------------------------------------=
-+
  60 ++                      *                                             =
 |
     |                       :                                             =
 |
  55 ++                      ::                                            =
 |
  50 ++                      ::                                            =
 |
  45 ++                     : :                                            =
 |
  40 ++                     : :                                            =
 |
     |                      :  :                                           =
 |
  35 ++                     :  :                                           =
 |
  30 ++                     :  :                                           =
 |
  25 ++                     :  :                                           =
 |
  20 ++                    :    :                                          =
 |
     |                     :    :                                        .*=
.|
  15 *+*..*.*..*.*..*.*..*.*    *.*..*.*..*.*..*.*..*.*.*..*.*..*.*..*.*.  =
 *
  10 ++--------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[57]:/.utilization_load_avg

  1120 ++------------------------------------------------------------------=
-+
       |                              *                                    =
 |
  1100 ++                             :                                    =
 |
  1080 ++                            : :                                   =
 |
       |                             : :                                   =
 |
  1060 ++         .*.*..            :  :                                   =
 |
       | *..*    *      *.*        .*   :                     *            =
 |
  1040 ++:   + ..          :   *.*.     *           *..*.   .. :    .*.    =
 |
       |:     *            : ..          :    .*.. :     *.*   : .*.   *   =
 |
  1020 ++                   *             :  *     :            *       :  =
 |
  1000 *+                                 : +     *                     :  =
 *
       |                                   *                             : =
 |
   980 ++                                                                : =
:|
       |                                                                  :=
:|
   960 ++-----------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[58]:/.runnable_load_avg

  19 ++---------------------------------------------------------*----------=
-+
     |                                                          :          =
 |
  18 ++                                                        ::          =
 |
     |                                                         : :         =
 |
  17 ++                                                        : :         =
 |
     |                                                         : :         =
 |
  16 ++                                                       :  :         =
 |
     |                                                        :  :         =
 |
  15 ++*..          *      *.*              *..               :  :         =
 |
     |+           .. +    +   :            +                 :    :        =
 |
  14 *+   *.*..  *    *..*     :  *..*.*..*    *.*..*.*.*..*.*    :    *   =
 *
     |          +              : +                                :   + :  =
 |
  13 ++        *                *                                 *..*   : =
:|
     |                                                                   : =
:|
  12 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[58]:/.utilization_load_avg

  1120 ++------------------------------------------------------------------=
-+
  1100 ++                                                       *          =
 |
       |             *                                          :          =
 |
  1080 ++            ::                                        ::          =
 |
  1060 ++     *..   : :     *..              *                 : :         =
 *
       |.*.. +      :  :   +   *      *.*.. + +            *.. : :     *   =
 |
  1040 *+   *    *.:   : .*     +    +     *   *..*.       :  :  :     :   =
 |
  1020 ++          *    *        *..*               *..*  :   *  :    : :  =
:|
  1000 ++                                               + :       :   : :  =
:|
       |                                                 *        : .*   : =
:|
   980 ++                                                         *.     : =
:|
   960 ++                                                                ::=
 |
       |                                                                  :=
 |
   940 ++                                                                 *=
 |
   920 ++------------------------------------------------------------------=
-+


                     sched_debug.cfs_rq[58]:/.tg_load_contrib

  180 ++-------------------------------------------------------------------=
-+
      |             *                                             *        =
 |
  160 ++            :                                             :        =
 |
  140 ++            ::                                            ::       =
 |
      |            : :                                           : :       =
 |
  120 ++        *  : :   *                                       :  :      =
 |
  100 ++        :  : :   :                                       :  :      =
 |
      |        : : :  :  ::                                *     :   :     =
 |
   80 ++       : : :  : : :               *                ::   :    *    *=
 |
   60 ++       : : :  : :  :              ::     *        : :   *    :   ::=
 |
      |       :  ::   : :  :         *   : :    : :       :  :  :     :  : =
:|
   40 ++      :   :    ::  :  *..   : +  :  :   :  :      :  : :      : :  =
:|
   20 ++*..  :    *    :    :+      :  +:   : .*   :     :    ::       ::  =
 |
      *    *.*         *    *    *.*    *    *      *.*..*    *        *   =
 *
    0 ++-------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[59]:/.runnable_load_avg

  18 ++-------------*------------------------------------------------------=
-+
     |              :                                                      =
 |
  17 ++             :                                                      =
 |
     |             : :                                                     =
 |
     |             : :                                                     =
 |
  16 ++            : :                                            *..*     =
 |
     |             : :                                            :   :    =
 |
  15 ++           :   :    *    *           *..                  :    :    =
 |
     |            :   :   + + .. +          :                    :     :   =
 |
  14 *+   *.*..*  :   *..*   *    *..*.*   :   *.*    *.*..*.*   :     *   =
 *
     |:  +      : :                     +  :      :   :       +  :      :  =
 |
     |: +       ::                       +:       :  :         +:       :  =
:|
  13 ++*         *                        *        : :          *        : =
:|
     |                                             ::                    ::=
 |
  12 ++---------------------------------------------*---------------------*=
-+


                   sched_debug.cfs_rq[59]:/.utilization_load_avg

  1150 ++------------------------------------------------------------*-----=
-+
       |                                                            +:     =
 |
  1100 ++                                                          +  :    =
 |
       |             *                                            *   :    =
 |
       |     .*..    ::       .*.            *.         .*       :     :   =
 |
  1050 *+   *       :  :  *.*.   *..*. .*.. +  *..     *  +      :     *   =
 |
       |+ ..     *  :  : +            *    *         ..    *..*.*      :   =
 |
  1000 ++*        +:    *                         *.*                   :  =
 *
       |           *                                                    :  =
 |
   950 ++                                                                : =
:|
       |                                                                 : =
:|
       |                                                                  :=
 |
   900 ++                                                                 *=
 |
       |                                                                   =
 |
   850 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[60]:/.runnable_load_avg

  22 ++-----------------------------------*--------------------------------=
-+
     |                                    :                                =
 |
  21 ++                                  ::                                =
 |
  20 ++                                  : :                               =
 |
     |                                   : :                               =
 |
  19 ++                                  : :                               =
 |
  18 ++                                 :  :                               =
 |
     |                                  :  :                               =
 |
  17 ++                                 :  :                               =
 |
  16 ++                                 :   :                              =
 |
     |                                 :    :                              =
 |
  15 ++                          .*    *    :             .*.              =
 |
  14 *+*..*.*..*.*..*.*..*   *..*  +  :     *..     *.*.*.   *..*    *.*.. =
 *
     |                    + +       + :           ..             + ..      =
+|
  13 ++--------------------*---------*---------*-*----------------*-------*=
-+


                   sched_debug.cfs_rq[60]:/.utilization_load_avg

  1150 ++------------------------------------------------------------------=
-+
       |                                   *                               =
 |
       |                                  ::                               =
 |
  1100 ++                           *     : :                              =
 |
       |         *             *    :    :  :                              =
 |
       |       .. :           +:   : :  *    :          .*                 =
 |
  1050 ++*.. .*   :     *.*. +  :  : : :     *      *..*  +  .*.           =
 |
       |+   *      *. ..    *   : :   ::      :    +       *.   *.*..*.    =
 *
  1000 *+            *           ::   *       :   *                    *   =
 |
       |                         *             :..                      :  =
:|
       |                                       *                         : =
:|
   950 ++                                                                ::=
 |
       |                                                                  *=
 |
       |                                                                   =
 |
   900 ++------------------------------------------------------------------=
-+


                    sched_debug.cfs_rq[61]:/.runnable_load_avg

    15 ++-----*---------*--------------------*-*---------*-----------*-*---=
-+
       |      :        ::                    : :         :           : :   =
 |
  14.5 ++    : :       : :                   :  :       : :         :  :   =
 |
       |     : :      :  :                  :   :       : :         :   :  =
 |
       |    :  :      :   :                 :   :      :   :        :   :  =
 |
    14 *+   *   :  *.*    *.*..*    *   *   :    :  *..*   *..*.*  :    :  =
 *
       |:  :    :  :           :    :   ::  :    :  :            : :    :  =
 |
  13.5 ++  :    : :            :   ::   : ::     : :             : :     : =
 |
       | ::      ::             :  : : :  ::      ::              :      : =
:|
    13 ++*       *              :  : : :   *      *               *      : =
:|
       |                        : :  : :                                 : =
:|
       |                        : :  : :                                 : =
:|
  12.5 ++                        ::   :                                   :=
 |
       |                         :    :                                   :=
 |
    12 ++------------------------*----*-----------------------------------*=
-+


                   sched_debug.cfs_rq[61]:/.utilization_load_avg

  1120 ++---------------------------*--------------------------------------=
-+
  1100 ++                           :                                      =
 |
       |                           : :                     *               =
 |
  1080 ++               *          : :       *.           : +              =
 *
  1060 ++             .. :         : :       : *    *     :  +       *.*   =
 |
       |    *.       *   :         :  :     :   +  : +   *    *.    +  :   =
 |
  1040 *+  +  *..   +     *.  .*  :   *.*.. :    + :  + +       *. +    :  =
:|
  1020 ++ +      *.*        *.  : :        :      *    *          *     :  =
:|
  1000 ++*                      : :        *                            :  =
:|
       |                         :                                       : =
:|
   980 ++                        *                                       : =
:|
   960 ++                                                                ::=
 |
       |                                                                  :=
 |
   940 ++                                                                 *=
 |
   920 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[62]:/.runnable_load_avg

  20 ++-----------------------------------------------*--------------------=
-+
     |                                                :                    =
 |
  19 ++                                               :                    =
 |
  18 ++                                              : :                   =
 |
     |                                               : :                   =
 |
  17 ++                                              : :                   =
 |
     |                                               : :                   =
 |
  16 ++                              *               :  :                  =
 |
     |                              : :             :   :                  =
 |
  15 ++   *.*..                     : :        *.   :   *..    .*.*..      =
 |
  14 *+  +     *.*..*.*..*.*.*..   :   *..*   +  *..*      *.*.      *     =
 *
     |+ +                          :       + +                        +    =
 |
  13 ++*                        *.*         *                          *.. =
:|
     |                                                                     =
:|
  12 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[62]:/.utilization_load_avg

  1200 ++------------------------------------------------------------------=
-+
       |                                               *                   =
 |
  1150 ++                                              :          *        =
 |
       |                              *               : :         :        =
 |
       |                              :               : :        : :       =
 |
  1100 ++                            : :   *         :  :        : :       =
 |
       |      *..    *..             : :  + :  *..   :   :      *   :      =
 |
  1050 ++    +      +                :  :+  : :     :    *     +    :      =
 |
       *    *    *.*    *.*.  .*.   :   *    ::   *.*     +  .*      :     =
 *
  1000 ++  +                *.   *..*        *             *.        *.*   =
 |
       |: +                                                             :  =
:|
       | *                                                               : =
:|
   950 ++                                                                ::=
 |
       |                                                                  *=
 |
   900 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[63]:/.runnable_load_avg

  19 ++----------------------------------------*---------------------------=
-+
     |                                         :                           =
 |
  18 ++                                       ::                           =
 |
     |                                        : :                          =
 |
  17 ++                              *        : :                          =
 |
     |                              ::        : :                          =
 |
  16 ++                         *   : :      :  :                          =
 |
     |                         : + :  :      :  :                          =
 |
  15 *+*..*.*..*               :  *   :      :   :  *.*    *    *    *     =
 |
     |          +             :        :    :    :..   + .. + .. + .. +    =
 |
  14 ++          *..*.*..*.*.*         *..*.*    *      *    *    *    *   =
 *
     |                                                                  :  =
 |
  13 ++                                                                  : =
:|
     |                                                                   : =
:|
  12 ++-------------------------------------------------------------------*=
-+


                   sched_debug.cfs_rq[63]:/.utilization_load_avg

  1150 ++------------------------------------------------------------------=
-+
       |                              *                                    =
 |
  1100 ++*..                          ::                             *     =
 |
       |+                            : :                            + :    =
 |
       *    *                 .*.*.. :  :              *.*.        +  :    =
 |
  1050 ++    +     *.*.. .*.*.      :   *..*.*       ..    *..*.*.*    *   =
 |
       |      *.. +     *           *         +     *                  :   =
 *
  1000 ++        *                             *.. +                    :  =
 |
       |                                          *                     :  =
:|
   950 ++                                                                : =
:|
       |                                                                 : =
:|
       |                                                                  :=
 |
   900 ++                                                                 *=
 |
       |                                                                   =
 |
   850 ++------------------------------------------------------------------=
-+

	[*] bisect-good sample
	[O] bisect-bad  sample

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

--===============0838449700403544809==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogZWJpenp5CmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogcHJlLXRlc3QKICB1cHRp
bWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAKICBudW1hLXZtc3Rh
dDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1zdGF0OgogICAgaW50
ZXJ2YWw6IDEwCiAgbWVtaW5mbzogCiAgc2xhYmluZm86IAogIGludGVycnVwdHM6IAogIGxvY2tf
c3RhdDogCiAgbGF0ZW5jeV9zdGF0czogCiAgc29mdGlycXM6IAogIGJkaV9kZXZfbWFwcGluZzog
CiAgZGlza3N0YXRzOiAKICBuZnNzdGF0OiAKICBjcHVpZGxlOiAKICBjcHVmcmVxLXN0YXRzOiAK
ICB0dXJib3N0YXQ6IAogIHBtZXRlcjogCiAgc2NoZWRfZGVidWc6CiAgICBpbnRlcnZhbDogNjAK
ZGVmYXVsdC13YXRjaGRvZ3M6CiAgd2F0Y2gtb29tOiAKICB3YXRjaGRvZzogCmNwdWZyZXFfZ292
ZXJub3I6IHBlcmZvcm1hbmNlCm1vZGVsOiBOZWhhbGVtLUVYCm1lbW9yeTogMjU2Rwpucl9zc2Rf
cGFydGl0aW9uczogNgpzc2RfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtSU5URUxf
U1NEKnBhcnQxIgpzd2FwX3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLVdEQ19XRDEw
RUFSUy0wMFk1QjFfV0QtV0NBVjVGMDU5MDc0LXBhcnQyIgpucl90aHJlYWRzOiAyMDAlCml0ZXJh
dGlvbnM6IDEwMHgKZWJpenp5OgogIGR1cmF0aW9uOiAxMHMKYnJhbmNoOiB5dXlhbmctdGlwL2Zv
ci1sa3AKY29tbWl0OiAyZmI2OGVkMjEzMDJlNWIxNWU5Njc2OTU0Yzg4M2Q1OGMwZThmZmY5CnF1
ZXVlOiB1bml0CnJlcGVhdF90bzogMgp0ZXN0Ym94OiBsa3AtbmV4MDQKdGJveF9ncm91cDogbGtw
LW5leDA0Cmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNS0wNi0xOSAxMToy
Nzo1NC40NzkyNzIwOTMgKzA4OjAwCnVzZXI6IGxrcApjb21waWxlcjogZ2NjLTQuOQpoZWFkX2Nv
bW1pdDogMmZiNjhlZDIxMzAyZTViMTVlOTY3Njk1NGM4ODNkNThjMGU4ZmZmOQpiYXNlX2NvbW1p
dDogZmExNmMxYmYzYzQ3MTdmODJiOWNjY2E2MTE1NjY1NjA2OGUwYjE0YwprZXJuZWw6ICIvcGtn
L2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvMmZiNjhlZDIxMzAyZTViMTVlOTY3Njk1NGM4ODNk
NThjMGU4ZmZmOS92bWxpbnV6LTQuMS4wLXJjOC0wMjY0Mi1nMmZiNjhlZCIKcm9vdGZzOiBkZWJp
YW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC9lYml6enkvcGVy
Zm9ybWFuY2UtMjAwJS0xMDB4LTEwcy9sa3AtbmV4MDQvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3
LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzJmYjY4ZWQyMTMwMmU1YjE1ZTk2NzY5NTRjODgzZDU4
YzBlOGZmZjkvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9sa3AtbmV4MDQvdW5pdF9lYml6
enktcGVyZm9ybWFuY2UtMjAwJS0xMDB4LTEwcy14ODZfNjQtcmhlbC1IRUFELTJmYjY4ZWQyMTMw
MmU1YjE1ZTk2NzY5NTRjODgzZDU4YzBlOGZmZjktMS0yMDE1MDYxOS04MDEyMi1hcmRubmUueWFt
bCIKZGVxdWV1ZV90aW1lOiAyMDE1LTA2LTE5IDEyOjIwOjE3Ljc5NDgzNzQ4OSArMDg6MDAKbnJf
Y3B1OiAiJChucHJvYykiCm1heF91cHRpbWU6IDI3NjkuNjAwMDAwMDAwMDAwNAppbml0cmQ6ICIv
b3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNneiIKYm9vdGxvYWRlcl9h
cHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpvYj0vbGtwL3NjaGVkdWxlZC9s
a3AtbmV4MDQvdW5pdF9lYml6enktcGVyZm9ybWFuY2UtMjAwJS0xMDB4LTEwcy14ODZfNjQtcmhl
bC1IRUFELTJmYjY4ZWQyMTMwMmU1YjE1ZTk2NzY5NTRjODgzZDU4YzBlOGZmZjktMS0yMDE1MDYx
OS04MDEyMi1hcmRubmUueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAot
IGJyYW5jaD15dXlhbmctdGlwL2Zvci1sa3AKLSBjb21taXQ9MmZiNjhlZDIxMzAyZTViMTVlOTY3
Njk1NGM4ODNkNThjMGU4ZmZmOQotIEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQtcmhlbC9n
Y2MtNC45LzJmYjY4ZWQyMTMwMmU1YjE1ZTk2NzY5NTRjODgzZDU4YzBlOGZmZjkvdm1saW51ei00
LjEuMC1yYzgtMDI2NDItZzJmYjY4ZWQKLSBtYXhfdXB0aW1lPTI3NjkKLSBSRVNVTFRfUk9PVD0v
cmVzdWx0L2ViaXp6eS9wZXJmb3JtYW5jZS0yMDAlLTEwMHgtMTBzL2xrcC1uZXgwNC9kZWJpYW4t
eDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvMmZiNjhlZDIxMzAyZTVi
MTVlOTY3Njk1NGM4ODNkNThjMGU4ZmZmOS8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVh
cmx5cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGlj
PWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91
dD0xMDAKICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9v
cHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAs
MTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xr
cC9sa3AteDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVs
L2djYy00LjkvMmZiNjhlZDIxMzAyZTViMTVlOTY3Njk1NGM4ODNkNThjMGU4ZmZmOS9tb2R1bGVz
LmNneiIKYm1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcu
Y2d6L2xrcC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1
bi1pcGNvbmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6
L3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1h
cmtzL2ViaXp6eS14ODZfNjQuY2d6Igpqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDExOC41
MSAxMjEuOTQgODQuMzMgMS82MDMgNDMxMDkKc3RhcnRfdGltZTogJzE0MzQ2ODc2ODEnCmVuZF90
aW1lOiAnMTQzNDY4ODY4NicKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNTA2MTktMTIxNjQ3
Igo=

--===============0838449700403544809==
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
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDkvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1MS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU4L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1NTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjAvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2
MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTYyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCi4vZWJp
enp5IC10IDEyOCAtUyAxMAouL2ViaXp6eSAtdCAxMjggLVMgMTAKLi9lYml6enkgLXQgMTI4IC1T
IDEwCi4vZWJpenp5IC10IDEyOCAtUyAxMAouL2ViaXp6eSAtdCAxMjggLVMgMTAKLi9lYml6enkg
LXQgMTI4IC1TIDEwCi4vZWJpenp5IC10IDEyOCAtUyAxMAouL2ViaXp6eSAtdCAxMjggLVMgMTAK
Li9lYml6enkgLXQgMTI4IC1TIDEwCi4vZWJpenp5IC10IDEyOCAtUyAxMAouL2ViaXp6eSAtdCAx
MjggLVMgMTAKLi9lYml6enkgLXQgMTI4IC1TIDEwCi4vZWJpenp5IC10IDEyOCAtUyAxMAouL2Vi
aXp6eSAtdCAxMjggLVMgMTAKLi9lYml6enkgLXQgMTI4IC1TIDEwCi4vZWJpenp5IC10IDEyOCAt
UyAxMAouL2ViaXp6eSAtdCAxMjggLVMgMTAKLi9lYml6enkgLXQgMTI4IC1TIDEwCi4vZWJpenp5
IC10IDEyOCAtUyAxMAouL2ViaXp6eSAtdCAxMjggLVMgMTAKLi9lYml6enkgLXQgMTI4IC1TIDEw
Ci4vZWJpenp5IC10IDEyOCAtUyAxMAouL2ViaXp6eSAtdCAxMjggLVMgMTAKLi9lYml6enkgLXQg
MTI4IC1TIDEwCi4vZWJpenp5IC10IDEyOCAtUyAxMAouL2ViaXp6eSAtdCAxMjggLVMgMTAKLi9l
Yml6enkgLXQgMTI4IC1TIDEwCi4vZWJpenp5IC10IDEyOCAtUyAxMAouL2ViaXp6eSAtdCAxMjgg
LVMgMTAKLi9lYml6enkgLXQgMTI4IC1TIDEwCi4vZWJpenp5IC10IDEyOCAtUyAxMAouL2ViaXp6
eSAtdCAxMjggLVMgMTAKLi9lYml6enkgLXQgMTI4IC1TIDEwCi4vZWJpenp5IC10IDEyOCAtUyAx
MAouL2ViaXp6eSAtdCAxMjggLVMgMTAKLi9lYml6enkgLXQgMTI4IC1TIDEwCi4vZWJpenp5IC10
IDEyOCAtUyAxMAouL2ViaXp6eSAtdCAxMjggLVMgMTAKLi9lYml6enkgLXQgMTI4IC1TIDEwCi4v
ZWJpenp5IC10IDEyOCAtUyAxMAouL2ViaXp6eSAtdCAxMjggLVMgMTAKLi9lYml6enkgLXQgMTI4
IC1TIDEwCi4vZWJpenp5IC10IDEyOCAtUyAxMAouL2ViaXp6eSAtdCAxMjggLVMgMTAKLi9lYml6
enkgLXQgMTI4IC1TIDEwCi4vZWJpenp5IC10IDEyOCAtUyAxMAouL2ViaXp6eSAtdCAxMjggLVMg
MTAKLi9lYml6enkgLXQgMTI4IC1TIDEwCi4vZWJpenp5IC10IDEyOCAtUyAxMAouL2ViaXp6eSAt
dCAxMjggLVMgMTAKLi9lYml6enkgLXQgMTI4IC1TIDEwCi4vZWJpenp5IC10IDEyOCAtUyAxMAou
L2ViaXp6eSAtdCAxMjggLVMgMTAKLi9lYml6enkgLXQgMTI4IC1TIDEwCi4vZWJpenp5IC10IDEy
OCAtUyAxMAouL2ViaXp6eSAtdCAxMjggLVMgMTAKLi9lYml6enkgLXQgMTI4IC1TIDEwCi4vZWJp
enp5IC10IDEyOCAtUyAxMAouL2ViaXp6eSAtdCAxMjggLVMgMTAKLi9lYml6enkgLXQgMTI4IC1T
IDEwCi4vZWJpenp5IC10IDEyOCAtUyAxMAouL2ViaXp6eSAtdCAxMjggLVMgMTAKLi9lYml6enkg
LXQgMTI4IC1TIDEwCi4vZWJpenp5IC10IDEyOCAtUyAxMAouL2ViaXp6eSAtdCAxMjggLVMgMTAK
Li9lYml6enkgLXQgMTI4IC1TIDEwCi4vZWJpenp5IC10IDEyOCAtUyAxMAouL2ViaXp6eSAtdCAx
MjggLVMgMTAKLi9lYml6enkgLXQgMTI4IC1TIDEwCi4vZWJpenp5IC10IDEyOCAtUyAxMAouL2Vi
aXp6eSAtdCAxMjggLVMgMTAKLi9lYml6enkgLXQgMTI4IC1TIDEwCi4vZWJpenp5IC10IDEyOCAt
UyAxMAouL2ViaXp6eSAtdCAxMjggLVMgMTAKLi9lYml6enkgLXQgMTI4IC1TIDEwCi4vZWJpenp5
IC10IDEyOCAtUyAxMAouL2ViaXp6eSAtdCAxMjggLVMgMTAKLi9lYml6enkgLXQgMTI4IC1TIDEw
Ci4vZWJpenp5IC10IDEyOCAtUyAxMAouL2ViaXp6eSAtdCAxMjggLVMgMTAKLi9lYml6enkgLXQg
MTI4IC1TIDEwCi4vZWJpenp5IC10IDEyOCAtUyAxMAouL2ViaXp6eSAtdCAxMjggLVMgMTAKLi9l
Yml6enkgLXQgMTI4IC1TIDEwCi4vZWJpenp5IC10IDEyOCAtUyAxMAouL2ViaXp6eSAtdCAxMjgg
LVMgMTAKLi9lYml6enkgLXQgMTI4IC1TIDEwCi4vZWJpenp5IC10IDEyOCAtUyAxMAouL2ViaXp6
eSAtdCAxMjggLVMgMTAKLi9lYml6enkgLXQgMTI4IC1TIDEwCi4vZWJpenp5IC10IDEyOCAtUyAx
MAouL2ViaXp6eSAtdCAxMjggLVMgMTAKLi9lYml6enkgLXQgMTI4IC1TIDEwCi4vZWJpenp5IC10
IDEyOCAtUyAxMAouL2ViaXp6eSAtdCAxMjggLVMgMTAKLi9lYml6enkgLXQgMTI4IC1TIDEwCi4v
ZWJpenp5IC10IDEyOCAtUyAxMAouL2ViaXp6eSAtdCAxMjggLVMgMTAKLi9lYml6enkgLXQgMTI4
IC1TIDEwCi4vZWJpenp5IC10IDEyOCAtUyAxMAo=

--===============0838449700403544809==--

