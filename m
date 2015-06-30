Content-Type: multipart/mixed; boundary="===============3711802981257550927=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [sched] db19c885e8c: 20.6% ebizzy.throughput.per_thread.max
Date: Tue, 30 Jun 2015 14:09:02 +0800
Message-ID: <1435644542.5563.53.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3711802981257550927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://bee.sh.intel.com/git/ydu19/tip rewrite_v9
commit db19c885e8c55a61c2d78d9788504c49ec7886b0 ("sched: Rewrite runnable l=
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

  9bbe7cde215731e74810351f10e8b6b10fb0c6c4
  db19c885e8c55a61c2d78d9788504c49ec7886b0

9bbe7cde215731e7 db19c885e8c55a61c2d78d9788 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    121.10 =C2=B1  0%     +20.6%     146.10 =C2=B1  0%  ebizzy.throughput.p=
er_thread.max
     80.50 =C2=B1  0%      -7.3%      74.60 =C2=B1  0%  ebizzy.throughput.p=
er_thread.min
      0.06 =C2=B1  2%    +109.7%       0.12 =C2=B1  1%  ebizzy.throughput.p=
er_thread.stddev_percent
   5594368 =C2=B1  0%     -10.1%    5029280 =C2=B1  0%  ebizzy.time.involun=
tary_context_switches
     46.32 =C2=B1  0%      +2.9%      47.66 =C2=B1  0%  ebizzy.time.user
      4646 =C2=B1  0%      +2.7%       4772 =C2=B1  0%  ebizzy.time.user_ti=
me
    284348 =C2=B1  1%      -4.8%     270628 =C2=B1  2%  ebizzy.time.volunta=
ry_context_switches
   5408263 =C2=B1  1%     -28.3%    3878859 =C2=B1  1%  softirqs.RCU
   5594368 =C2=B1  0%     -10.1%    5029280 =C2=B1  0%  time.involuntary_co=
ntext_switches
      0.10 =C2=B1 18%    +179.4%       0.29 =C2=B1 19%  turbostat.CPU%c1
     12656 =C2=B1  1%     -16.7%      10544 =C2=B1  6%  vmstat.system.cs
      8.90 =C2=B1 24%    +128.1%      20.30 =C2=B1 37%  numa-numastat.node1=
.other_node
     10.40 =C2=B1 34%     +99.0%      20.70 =C2=B1 23%  numa-numastat.node2=
.other_node
    335.70 =C2=B1  1%     +17.6%     394.70 =C2=B1  4%  numa-vmstat.node0.n=
r_kernel_stack
      1720 =C2=B1 40%     -61.8%     657.00 =C2=B1  0%  numa-vmstat.node0.n=
r_mapped
      1577 =C2=B1 59%     -90.1%     156.90 =C2=B1 71%  numa-vmstat.node0.n=
r_shmem
      5018 =C2=B1  5%     +14.7%       5755 =C2=B1  8%  numa-vmstat.node3.n=
r_slab_unreclaimable
    815149 =C2=B1  0%     -22.9%     628788 =C2=B1  0%  proc-vmstat.numa_hi=
nt_faults_local
    140561 =C2=B1  2%    +113.3%     299875 =C2=B1  1%  proc-vmstat.numa_pa=
ges_migrated
    140561 =C2=B1  2%    +113.3%     299875 =C2=B1  1%  proc-vmstat.pgmigra=
te_success
      1728 =C2=B1  5%     -58.5%     717.50 =C2=B1  6%  proc-vmstat.thp_fau=
lt_alloc
      1130 =C2=B1  8%     +35.8%       1535 =C2=B1  6%  slabinfo.blkdev_ioc=
.active_objs
      1130 =C2=B1  8%     +35.8%       1535 =C2=B1  6%  slabinfo.blkdev_ioc=
.num_objs
      1228 =C2=B1 15%     +42.7%       1752 =C2=B1  8%  slabinfo.blkdev_req=
uests.active_objs
      1228 =C2=B1 15%     +42.7%       1752 =C2=B1  8%  slabinfo.blkdev_req=
uests.num_objs
      1488 =C2=B1 11%     +29.5%       1926 =C2=B1  5%  slabinfo.mnt_cache.=
active_objs
      1488 =C2=B1 11%     +29.5%       1926 =C2=B1  5%  slabinfo.mnt_cache.=
num_objs
      5378 =C2=B1  1%     +17.6%       6324 =C2=B1  4%  numa-meminfo.node0.=
KernelStack
      6883 =C2=B1 40%     -61.8%       2629 =C2=B1  0%  numa-meminfo.node0.=
Mapped
      6312 =C2=B1 59%     -90.0%     629.00 =C2=B1 71%  numa-meminfo.node0.=
Shmem
      3279 =C2=B1  4%     -24.4%       2479 =C2=B1  7%  numa-meminfo.node1.=
KernelStack
      2822 =C2=B1  4%     -16.3%       2362 =C2=B1  4%  numa-meminfo.node2.=
KernelStack
     20073 =C2=B1  5%     +14.7%      23024 =C2=B1  8%  numa-meminfo.node3.=
SUnreclaim
     31003 =C2=B1  5%     +13.0%      35044 =C2=B1  8%  numa-meminfo.node3.=
Slab
      3634 =C2=B1 88%    +447.1%      19885 =C2=B1 88%  latency_stats.avg.c=
all_rwsem_down_write_failed.unlink_anon_vmas.free_pgtables.unmap_region.do_=
munmap.SyS_brk.entry_SYSCALL_64_fastpath
      7900 =C2=B1 93%    +302.2%      31774 =C2=B1 78%  latency_stats.max.c=
all_rwsem_down_write_failed.unlink_anon_vmas.free_pgtables.unmap_region.do_=
munmap.SyS_brk.entry_SYSCALL_64_fastpath
      7448 =C2=B1 98%    +276.6%      28052 =C2=B1 80%  latency_stats.max.c=
all_rwsem_down_write_failed.vma_adjust.__split_vma.do_munmap.SyS_brk.entry_=
SYSCALL_64_fastpath
   2275580 =C2=B1  4%     -53.9%    1048471 =C2=B1  7%  latency_stats.sum.c=
all_rwsem_down_read_failed.SyS_madvise.entry_SYSCALL_64_fastpath
 3.229e+08 =C2=B1  2%     -24.1%   2.45e+08 =C2=B1  2%  latency_stats.sum.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault
   8353501 =C2=B1  4%     -46.2%    4498053 =C2=B1  5%  latency_stats.sum.c=
all_rwsem_down_write_failed.SyS_mprotect.entry_SYSCALL_64_fastpath
     16345 =C2=B1102%    +769.6%     142134 =C2=B1107%  latency_stats.sum.c=
all_rwsem_down_write_failed.unlink_anon_vmas.free_pgtables.unmap_region.do_=
munmap.SyS_brk.entry_SYSCALL_64_fastpath
  11055424 =C2=B1  6%     -62.8%    4115346 =C2=B1  6%  latency_stats.sum.c=
all_rwsem_down_write_failed.vm_munmap.SyS_munmap.entry_SYSCALL_64_fastpath
     20510 =C2=B1106%    +420.6%     106786 =C2=B1121%  latency_stats.sum.c=
all_rwsem_down_write_failed.vma_adjust.__split_vma.do_munmap.SyS_brk.entry_=
SYSCALL_64_fastpath
   1501918 =C2=B1  0%     -12.7%    1310968 =C2=B1  1%  latency_stats.sum.w=
ait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpa=
th
  33425969 =C2=B1  2%     +17.5%   39272176 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     15.00 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.runnable_load_avg
      5026 =C2=B1  7%     -81.9%     910.10 =C2=B1 17%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
    105.60 =C2=B1 72%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
      1049 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.utilization_load_avg
     80.30 =C2=B1 83%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
10]:/.blocked_load_avg
     15.70 =C2=B1 21%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
10]:/.runnable_load_avg
   1754135 =C2=B1 22%    -177.6%   -1361568 =C2=B1-62%  sched_debug.cfs_rq[=
10]:/.spread0
      4614 =C2=B1  6%     -80.4%     905.00 =C2=B1 16%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
     96.50 =C2=B1 69%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
10]:/.tg_load_contrib
      1052 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
10]:/.utilization_load_avg
     15.30 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.runnable_load_avg
   1561042 =C2=B1 28%    -183.8%   -1308062 =C2=B1-36%  sched_debug.cfs_rq[=
11]:/.spread0
      4614 =C2=B1  6%     -80.4%     904.40 =C2=B1 16%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
     74.00 =C2=B1 88%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.tg_load_contrib
      1067 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.utilization_load_avg
     87.70 =C2=B1 79%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.blocked_load_avg
     13.70 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.runnable_load_avg
   1390848 =C2=B1 30%    -217.1%   -1628854 =C2=B1-40%  sched_debug.cfs_rq[=
12]:/.spread0
      4597 =C2=B1  6%     -80.3%     904.30 =C2=B1 16%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
    102.10 =C2=B1 67%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.tg_load_contrib
      1026 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.utilization_load_avg
     56.90 =C2=B1 61%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.blocked_load_avg
     13.90 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.runnable_load_avg
   1610879 =C2=B1 13%    -172.3%   -1165142 =C2=B1-93%  sched_debug.cfs_rq[=
13]:/.spread0
      4575 =C2=B1  6%     -80.2%     904.40 =C2=B1 16%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
     71.20 =C2=B1 49%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.tg_load_contrib
      1041 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.utilization_load_avg
    123.60 =C2=B1152%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.blocked_load_avg
     14.20 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.runnable_load_avg
   1347370 =C2=B1 20%    -214.5%   -1542362 =C2=B1-40%  sched_debug.cfs_rq[=
14]:/.spread0
      4580 =C2=B1  6%     -80.2%     904.90 =C2=B1 16%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
    138.50 =C2=B1136%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.tg_load_contrib
      1039 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.utilization_load_avg
    137.10 =C2=B1110%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.blocked_load_avg
     13.70 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.runnable_load_avg
    977007 =C2=B1 34%    -279.4%   -1752583 =C2=B1-37%  sched_debug.cfs_rq[=
15]:/.spread0
      4589 =C2=B1  6%     -80.3%     904.70 =C2=B1 16%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
    151.00 =C2=B1100%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.tg_load_contrib
      1022 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.utilization_load_avg
  34312445 =C2=B1  1%     +12.1%   38464576 =C2=B1  5%  sched_debug.cfs_rq[=
16]:/.min_vruntime
     14.60 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.runnable_load_avg
    885215 =C2=B1 71%    -191.5%    -809807 =C2=B1-80%  sched_debug.cfs_rq[=
16]:/.spread0
      4586 =C2=B1  6%     -80.3%     904.30 =C2=B1 16%  sched_debug.cfs_rq[=
16]:/.tg_load_avg
     33.80 =C2=B1 73%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.tg_load_contrib
      1036 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.utilization_load_avg
     14.80 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.runnable_load_avg
      4607 =C2=B1  6%     -80.4%     905.00 =C2=B1 16%  sched_debug.cfs_rq[=
17]:/.tg_load_avg
    106.40 =C2=B1 99%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.tg_load_contrib
      1032 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.utilization_load_avg
     50.50 =C2=B1 60%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.blocked_load_avg
  34391145 =C2=B1  1%     +12.1%   38568181 =C2=B1  4%  sched_debug.cfs_rq[=
18]:/.min_vruntime
     14.40 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.runnable_load_avg
      4584 =C2=B1  6%     -80.3%     905.20 =C2=B1 16%  sched_debug.cfs_rq[=
18]:/.tg_load_avg
     65.50 =C2=B1 46%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.tg_load_contrib
      1038 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.utilization_load_avg
     13.90 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.runnable_load_avg
    791203 =C2=B1 88%    -222.6%    -969702 =C2=B1-93%  sched_debug.cfs_rq[=
19]:/.spread0
      4567 =C2=B1  6%     -80.2%     904.70 =C2=B1 16%  sched_debug.cfs_rq[=
19]:/.tg_load_avg
    132.30 =C2=B1 89%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.tg_load_contrib
      1035 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.utilization_load_avg
     14.20 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
    256629 =C2=B1174%    -833.1%   -1881287 =C2=B1-35%  sched_debug.cfs_rq[=
1]:/.spread0
      4869 =C2=B1  6%     -81.4%     904.40 =C2=B1 16%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
     37.20 =C2=B1 66%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
      1028 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.utilization_load_avg
     57.20 =C2=B1 98%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.blocked_load_avg
  34185076 =C2=B1  1%     +11.6%   38167234 =C2=B1  5%  sched_debug.cfs_rq[=
20]:/.min_vruntime
     14.00 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.runnable_load_avg
    757563 =C2=B1105%    -246.2%   -1107608 =C2=B1-76%  sched_debug.cfs_rq[=
20]:/.spread0
      4541 =C2=B1  6%     -80.1%     905.10 =C2=B1 16%  sched_debug.cfs_rq[=
20]:/.tg_load_avg
     71.80 =C2=B1 78%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.tg_load_contrib
      1036 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.utilization_load_avg
  34325828 =C2=B1  1%     +11.6%   38291059 =C2=B1  5%  sched_debug.cfs_rq[=
21]:/.min_vruntime
      1.20 =C2=B1116%   +4566.7%      56.00 =C2=B1168%  sched_debug.cfs_rq[=
21]:/.nr_spread_over
     14.10 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.runnable_load_avg
      4573 =C2=B1  6%     -80.2%     904.90 =C2=B1 16%  sched_debug.cfs_rq[=
21]:/.tg_load_avg
     60.50 =C2=B1 67%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.tg_load_contrib
      1037 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.utilization_load_avg
     14.10 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.runnable_load_avg
    890405 =C2=B1102%    -219.5%   -1064039 =C2=B1-77%  sched_debug.cfs_rq[=
22]:/.spread0
      4540 =C2=B1  6%     -80.1%     905.00 =C2=B1 16%  sched_debug.cfs_rq[=
22]:/.tg_load_avg
     44.70 =C2=B1 80%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.tg_load_contrib
      1041 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.utilization_load_avg
  33983102 =C2=B1  1%     +13.7%   38623648 =C2=B1  6%  sched_debug.cfs_rq[=
23]:/.min_vruntime
      5.40 =C2=B1150%   +1388.9%      80.40 =C2=B1 71%  sched_debug.cfs_rq[=
23]:/.nr_spread_over
     14.10 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
23]:/.runnable_load_avg
      4521 =C2=B1  6%     -80.0%     904.70 =C2=B1 16%  sched_debug.cfs_rq[=
23]:/.tg_load_avg
     51.30 =C2=B1 85%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
23]:/.tg_load_contrib
      1038 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
23]:/.utilization_load_avg
     36.10 =C2=B1 83%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.blocked_load_avg
  33615755 =C2=B1  2%     +15.6%   38863908 =C2=B1  5%  sched_debug.cfs_rq[=
24]:/.min_vruntime
     14.20 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.runnable_load_avg
      4448 =C2=B1  7%     -79.7%     905.10 =C2=B1 16%  sched_debug.cfs_rq[=
24]:/.tg_load_avg
     50.90 =C2=B1 59%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.tg_load_contrib
      1033 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.utilization_load_avg
  33637066 =C2=B1  2%     +14.7%   38574673 =C2=B1  4%  sched_debug.cfs_rq[=
25]:/.min_vruntime
     14.00 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.runnable_load_avg
      4412 =C2=B1  7%     -79.5%     905.30 =C2=B1 16%  sched_debug.cfs_rq[=
25]:/.tg_load_avg
     32.40 =C2=B1 70%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.tg_load_contrib
      1036 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.utilization_load_avg
  33615618 =C2=B1  2%     +14.3%   38419155 =C2=B1  5%  sched_debug.cfs_rq[=
26]:/.min_vruntime
     14.30 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.runnable_load_avg
    187619 =C2=B1387%    -556.4%    -856368 =C2=B1-89%  sched_debug.cfs_rq[=
26]:/.spread0
      4400 =C2=B1  7%     -79.4%     905.10 =C2=B1 16%  sched_debug.cfs_rq[=
26]:/.tg_load_avg
     47.00 =C2=B1 81%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.tg_load_contrib
      1032 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.utilization_load_avg
     25.60 =C2=B1 96%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.blocked_load_avg
  33801907 =C2=B1  2%     +13.7%   38416647 =C2=B1  4%  sched_debug.cfs_rq[=
27]:/.min_vruntime
     13.70 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.runnable_load_avg
      4378 =C2=B1  7%     -79.3%     905.40 =C2=B1 16%  sched_debug.cfs_rq[=
27]:/.tg_load_avg
     39.70 =C2=B1 60%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.tg_load_contrib
      1034 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.utilization_load_avg
  33714952 =C2=B1  2%     +14.8%   38701663 =C2=B1  5%  sched_debug.cfs_rq[=
28]:/.min_vruntime
     13.80 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.runnable_load_avg
      4340 =C2=B1  7%     -79.1%     905.20 =C2=B1 16%  sched_debug.cfs_rq[=
28]:/.tg_load_avg
     47.80 =C2=B1 71%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.tg_load_contrib
      1034 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.utilization_load_avg
  33726247 =C2=B1  2%     +14.0%   38439367 =C2=B1  4%  sched_debug.cfs_rq[=
29]:/.min_vruntime
     14.80 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
29]:/.runnable_load_avg
    297984 =C2=B1225%    -380.7%    -836454 =C2=B1-79%  sched_debug.cfs_rq[=
29]:/.spread0
      4323 =C2=B1  6%     -79.1%     905.60 =C2=B1 16%  sched_debug.cfs_rq[=
29]:/.tg_load_avg
     46.10 =C2=B1 70%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
29]:/.tg_load_contrib
      1038 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
29]:/.utilization_load_avg
     14.00 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
    170047 =C2=B1207%   -1301.5%   -2043116 =C2=B1-35%  sched_debug.cfs_rq[=
2]:/.spread0
      4844 =C2=B1  6%     -81.3%     904.90 =C2=B1 16%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
     58.50 =C2=B1 77%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
      1034 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.utilization_load_avg
  33845005 =C2=B1  2%     +14.0%   38580978 =C2=B1  5%  sched_debug.cfs_rq[=
30]:/.min_vruntime
     13.90 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
30]:/.runnable_load_avg
      4196 =C2=B1  9%     -78.4%     905.00 =C2=B1 16%  sched_debug.cfs_rq[=
30]:/.tg_load_avg
    120.00 =C2=B1 74%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
30]:/.tg_load_contrib
      1023 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
30]:/.utilization_load_avg
  33394491 =C2=B1  2%     +14.7%   38289311 =C2=B1  4%  sched_debug.cfs_rq[=
31]:/.min_vruntime
     13.90 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.runnable_load_avg
      4204 =C2=B1 10%     -78.5%     905.30 =C2=B1 16%  sched_debug.cfs_rq[=
31]:/.tg_load_avg
     52.90 =C2=B1 69%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.tg_load_contrib
      1018 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.utilization_load_avg
  33807365 =C2=B1  2%     +13.0%   38218472 =C2=B1  4%  sched_debug.cfs_rq[=
32]:/.min_vruntime
     14.30 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
32]:/.runnable_load_avg
    378830 =C2=B1 51%    -379.2%   -1057656 =C2=B1-44%  sched_debug.cfs_rq[=
32]:/.spread0
      4107 =C2=B1  9%     -78.0%     905.20 =C2=B1 16%  sched_debug.cfs_rq[=
32]:/.tg_load_avg
     40.40 =C2=B1 88%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
32]:/.tg_load_contrib
      1029 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
32]:/.utilization_load_avg
     14.00 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
33]:/.runnable_load_avg
    414908 =C2=B1112%    -522.7%   -1753704 =C2=B1-38%  sched_debug.cfs_rq[=
33]:/.spread0
      4089 =C2=B1  9%     -77.9%     905.30 =C2=B1 16%  sched_debug.cfs_rq[=
33]:/.tg_load_avg
     58.90 =C2=B1 83%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
33]:/.tg_load_contrib
      1029 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
33]:/.utilization_load_avg
     14.20 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
34]:/.runnable_load_avg
    333380 =C2=B1111%    -610.0%   -1700403 =C2=B1-61%  sched_debug.cfs_rq[=
34]:/.spread0
      4085 =C2=B1  9%     -77.8%     905.60 =C2=B1 16%  sched_debug.cfs_rq[=
34]:/.tg_load_avg
     57.80 =C2=B1 98%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
34]:/.tg_load_contrib
      1031 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
34]:/.utilization_load_avg
     14.50 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
35]:/.runnable_load_avg
    494429 =C2=B1 68%    -455.4%   -1757323 =C2=B1-43%  sched_debug.cfs_rq[=
35]:/.spread0
      4080 =C2=B1  9%     -77.8%     906.40 =C2=B1 16%  sched_debug.cfs_rq[=
35]:/.tg_load_avg
     40.30 =C2=B1130%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
35]:/.tg_load_contrib
      1055 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
35]:/.utilization_load_avg
  33831065 =C2=B1  2%     +10.8%   37487376 =C2=B1  5%  sched_debug.cfs_rq[=
36]:/.min_vruntime
     14.30 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
36]:/.runnable_load_avg
    402241 =C2=B1 72%    -544.8%   -1789132 =C2=B1-38%  sched_debug.cfs_rq[=
36]:/.spread0
      4086 =C2=B1  9%     -77.8%     906.80 =C2=B1 16%  sched_debug.cfs_rq[=
36]:/.tg_load_avg
     46.80 =C2=B1 82%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
36]:/.tg_load_contrib
      1048 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
36]:/.utilization_load_avg
     13.80 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
37]:/.runnable_load_avg
    436482 =C2=B1 96%    -522.7%   -1844903 =C2=B1-27%  sched_debug.cfs_rq[=
37]:/.spread0
      4077 =C2=B1  9%     -77.8%     907.00 =C2=B1 16%  sched_debug.cfs_rq[=
37]:/.tg_load_avg
     60.40 =C2=B1 93%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
37]:/.tg_load_contrib
      1038 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
37]:/.utilization_load_avg
  33668292 =C2=B1  2%     +11.4%   37523296 =C2=B1  4%  sched_debug.cfs_rq[=
38]:/.min_vruntime
     14.20 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
38]:/.runnable_load_avg
    239360 =C2=B1109%    -832.6%   -1753436 =C2=B1-31%  sched_debug.cfs_rq[=
38]:/.spread0
      4052 =C2=B1  9%     -77.6%     907.40 =C2=B1 16%  sched_debug.cfs_rq[=
38]:/.tg_load_avg
     53.20 =C2=B1 87%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
38]:/.tg_load_contrib
      1045 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
38]:/.utilization_load_avg
  33232231 =C2=B1  2%     +13.4%   37669125 =C2=B1  5%  sched_debug.cfs_rq[=
39]:/.min_vruntime
     14.70 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
39]:/.runnable_load_avg
   -196751 =C2=B1-121%    +717.1%   -1607745 =C2=B1-41%  sched_debug.cfs_rq=
[39]:/.spread0
      4015 =C2=B1  9%     -77.4%     908.10 =C2=B1 16%  sched_debug.cfs_rq[=
39]:/.tg_load_avg
     53.50 =C2=B1101%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
39]:/.tg_load_contrib
      1043 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
39]:/.utilization_load_avg
     13.90 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
    390889 =C2=B1110%    -581.6%   -1882612 =C2=B1-49%  sched_debug.cfs_rq[=
3]:/.spread0
      4821 =C2=B1  6%     -81.2%     904.90 =C2=B1 16%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
     53.30 =C2=B1159%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
      1026 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.utilization_load_avg
     13.70 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
40]:/.runnable_load_avg
   1576707 =C2=B1 35%    -178.0%   -1229332 =C2=B1-46%  sched_debug.cfs_rq[=
40]:/.spread0
      4020 =C2=B1  9%     -77.4%     908.30 =C2=B1 16%  sched_debug.cfs_rq[=
40]:/.tg_load_avg
     59.70 =C2=B1 85%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
40]:/.tg_load_contrib
      1026 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
40]:/.utilization_load_avg
     14.60 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
41]:/.runnable_load_avg
   1646736 =C2=B1 27%    -154.8%    -903091 =C2=B1-67%  sched_debug.cfs_rq[=
41]:/.spread0
      4029 =C2=B1  9%     -77.5%     908.30 =C2=B1 16%  sched_debug.cfs_rq[=
41]:/.tg_load_avg
     75.00 =C2=B1168%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
41]:/.tg_load_contrib
      1027 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
41]:/.utilization_load_avg
     14.40 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
42]:/.runnable_load_avg
   1649379 =C2=B1 27%    -166.4%   -1095107 =C2=B1-75%  sched_debug.cfs_rq[=
42]:/.spread0
      4007 =C2=B1  9%     -77.3%     908.70 =C2=B1 16%  sched_debug.cfs_rq[=
42]:/.tg_load_avg
     85.90 =C2=B1 85%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
42]:/.tg_load_contrib
      1042 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
42]:/.utilization_load_avg
      2.10 =C2=B1121%    +771.4%      18.30 =C2=B1 99%  sched_debug.cfs_rq[=
43]:/.nr_spread_over
     13.80 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
43]:/.runnable_load_avg
   1345625 =C2=B1 27%    -170.7%    -952010 =C2=B1-57%  sched_debug.cfs_rq[=
43]:/.spread0
      3968 =C2=B1 10%     -77.1%     908.70 =C2=B1 16%  sched_debug.cfs_rq[=
43]:/.tg_load_avg
     56.60 =C2=B1 69%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
43]:/.tg_load_contrib
      1046 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
43]:/.utilization_load_avg
     31.60 =C2=B1 84%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
44]:/.blocked_load_avg
     13.60 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
44]:/.runnable_load_avg
   1387385 =C2=B1 30%    -196.7%   -1341484 =C2=B1-54%  sched_debug.cfs_rq[=
44]:/.spread0
      3897 =C2=B1  8%     -76.7%     908.70 =C2=B1 16%  sched_debug.cfs_rq[=
44]:/.tg_load_avg
     45.90 =C2=B1 57%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
44]:/.tg_load_contrib
      1023 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
44]:/.utilization_load_avg
     13.80 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
45]:/.runnable_load_avg
   1647477 =C2=B1 18%    -158.1%    -956686 =C2=B1-84%  sched_debug.cfs_rq[=
45]:/.spread0
      3832 =C2=B1  9%     -76.3%     908.60 =C2=B1 16%  sched_debug.cfs_rq[=
45]:/.tg_load_avg
     54.90 =C2=B1105%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
45]:/.tg_load_contrib
      1024 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
45]:/.utilization_load_avg
     13.80 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
46]:/.runnable_load_avg
   1471503 =C2=B1 33%    -195.3%   -1402854 =C2=B1-34%  sched_debug.cfs_rq[=
46]:/.spread0
      3820 =C2=B1  8%     -76.2%     908.50 =C2=B1 16%  sched_debug.cfs_rq[=
46]:/.tg_load_avg
     84.90 =C2=B1139%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
46]:/.tg_load_contrib
      1047 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
46]:/.utilization_load_avg
  34447386 =C2=B1  1%     +10.3%   37993571 =C2=B1  4%  sched_debug.cfs_rq[=
47]:/.min_vruntime
     13.90 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
47]:/.runnable_load_avg
   1018020 =C2=B1 34%    -226.1%   -1284086 =C2=B1-54%  sched_debug.cfs_rq[=
47]:/.spread0
      3805 =C2=B1  8%     -76.1%     907.90 =C2=B1 16%  sched_debug.cfs_rq[=
47]:/.tg_load_avg
     63.50 =C2=B1 52%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
47]:/.tg_load_contrib
      1022 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
47]:/.utilization_load_avg
  34322022 =C2=B1  1%     +12.7%   38677172 =C2=B1  4%  sched_debug.cfs_rq[=
48]:/.min_vruntime
     14.10 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
48]:/.runnable_load_avg
    892559 =C2=B1 54%    -167.3%    -600595 =C2=B1-127%  sched_debug.cfs_rq=
[48]:/.spread0
      3795 =C2=B1  9%     -76.1%     908.30 =C2=B1 16%  sched_debug.cfs_rq[=
48]:/.tg_load_avg
     40.90 =C2=B1 90%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
48]:/.tg_load_contrib
      1026 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
48]:/.utilization_load_avg
     13.80 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
49]:/.runnable_load_avg
      3793 =C2=B1  9%     -76.1%     908.30 =C2=B1 16%  sched_debug.cfs_rq[=
49]:/.tg_load_avg
     39.80 =C2=B1 71%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
49]:/.tg_load_contrib
      1033 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
49]:/.utilization_load_avg
     14.50 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.runnable_load_avg
    220124 =C2=B1106%   -1077.1%   -2150862 =C2=B1-25%  sched_debug.cfs_rq[=
4]:/.spread0
      4760 =C2=B1  6%     -81.0%     904.60 =C2=B1 16%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
     69.70 =C2=B1 61%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
      1037 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.utilization_load_avg
  34453490 =C2=B1  1%     +12.1%   38636833 =C2=B1  4%  sched_debug.cfs_rq[=
50]:/.min_vruntime
     14.70 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
50]:/.runnable_load_avg
      3802 =C2=B1  8%     -76.1%     908.80 =C2=B1 16%  sched_debug.cfs_rq[=
50]:/.tg_load_avg
    104.50 =C2=B1123%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
50]:/.tg_load_contrib
      1043 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
50]:/.utilization_load_avg
  34255068 =C2=B1  1%     +12.5%   38542604 =C2=B1  6%  sched_debug.cfs_rq[=
51]:/.min_vruntime
     13.90 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
51]:/.runnable_load_avg
      3803 =C2=B1  8%     -76.1%     909.10 =C2=B1 16%  sched_debug.cfs_rq[=
51]:/.tg_load_avg
     26.60 =C2=B1 59%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
51]:/.tg_load_contrib
      1027 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
51]:/.utilization_load_avg
  34171387 =C2=B1  2%     +12.8%   38537368 =C2=B1  6%  sched_debug.cfs_rq[=
52]:/.min_vruntime
     14.50 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
52]:/.runnable_load_avg
      3808 =C2=B1  8%     -76.2%     908.10 =C2=B1 16%  sched_debug.cfs_rq[=
52]:/.tg_load_avg
     51.10 =C2=B1 74%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
52]:/.tg_load_contrib
      1043 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
52]:/.utilization_load_avg
     54.30 =C2=B1 74%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
53]:/.blocked_load_avg
  34329455 =C2=B1  1%     +12.0%   38448938 =C2=B1  4%  sched_debug.cfs_rq[=
53]:/.min_vruntime
     14.20 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
53]:/.runnable_load_avg
      3782 =C2=B1  8%     -76.0%     908.80 =C2=B1 16%  sched_debug.cfs_rq[=
53]:/.tg_load_avg
     68.80 =C2=B1 59%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
53]:/.tg_load_contrib
      1048 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
53]:/.utilization_load_avg
  34374836 =C2=B1  1%     +12.2%   38558635 =C2=B1  5%  sched_debug.cfs_rq[=
54]:/.min_vruntime
      1.90 =C2=B1149%   +4347.4%      84.50 =C2=B1136%  sched_debug.cfs_rq[=
54]:/.nr_spread_over
     14.00 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
54]:/.runnable_load_avg
      3737 =C2=B1  8%     -75.7%     909.00 =C2=B1 16%  sched_debug.cfs_rq[=
54]:/.tg_load_avg
     67.10 =C2=B1 92%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
54]:/.tg_load_contrib
      1042 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
54]:/.utilization_load_avg
  33988134 =C2=B1  1%     +13.4%   38544545 =C2=B1  5%  sched_debug.cfs_rq[=
55]:/.min_vruntime
      3.40 =C2=B1131%   +1155.9%      42.70 =C2=B1153%  sched_debug.cfs_rq[=
55]:/.nr_spread_over
     15.00 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
55]:/.runnable_load_avg
      3738 =C2=B1  8%     -75.7%     909.30 =C2=B1 16%  sched_debug.cfs_rq[=
55]:/.tg_load_avg
     73.90 =C2=B1 90%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
55]:/.tg_load_contrib
      1055 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
55]:/.utilization_load_avg
     37.60 =C2=B1 66%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
56]:/.blocked_load_avg
  33909785 =C2=B1  2%     +14.7%   38897356 =C2=B1  6%  sched_debug.cfs_rq[=
56]:/.min_vruntime
     14.40 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
56]:/.runnable_load_avg
      3727 =C2=B1  8%     -75.6%     909.30 =C2=B1 15%  sched_debug.cfs_rq[=
56]:/.tg_load_avg
     52.10 =C2=B1 46%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
56]:/.tg_load_contrib
      1032 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
56]:/.utilization_load_avg
  33726719 =C2=B1  2%     +15.2%   38857097 =C2=B1  5%  sched_debug.cfs_rq[=
57]:/.min_vruntime
     14.90 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
57]:/.runnable_load_avg
      3728 =C2=B1  8%     -75.6%     908.90 =C2=B1 15%  sched_debug.cfs_rq[=
57]:/.tg_load_avg
     93.50 =C2=B1 76%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
57]:/.tg_load_contrib
      1039 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
57]:/.utilization_load_avg
  33824155 =C2=B1  2%     +14.4%   38686749 =C2=B1  5%  sched_debug.cfs_rq[=
58]:/.min_vruntime
     14.50 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
58]:/.runnable_load_avg
      3727 =C2=B1  8%     -75.6%     909.90 =C2=B1 15%  sched_debug.cfs_rq[=
58]:/.tg_load_avg
     47.40 =C2=B1 83%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
58]:/.tg_load_contrib
      1034 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
58]:/.utilization_load_avg
  33962739 =C2=B1  2%     +13.6%   38584738 =C2=B1  4%  sched_debug.cfs_rq[=
59]:/.min_vruntime
     13.70 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
59]:/.runnable_load_avg
    532360 =C2=B1124%    -230.4%    -694080 =C2=B1-76%  sched_debug.cfs_rq[=
59]:/.spread0
      3718 =C2=B1  8%     -75.5%     910.00 =C2=B1 15%  sched_debug.cfs_rq[=
59]:/.tg_load_avg
     29.20 =C2=B1 72%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
59]:/.tg_load_contrib
      1026 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
59]:/.utilization_load_avg
  33813405 =C2=B1  2%     +11.0%   37535490 =C2=B1  6%  sched_debug.cfs_rq[=
5]:/.min_vruntime
     13.90 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.runnable_load_avg
    387055 =C2=B1101%    -548.9%   -1737455 =C2=B1-39%  sched_debug.cfs_rq[=
5]:/.spread0
      4737 =C2=B1  7%     -80.9%     902.60 =C2=B1 16%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
     61.00 =C2=B1 69%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.tg_load_contrib
      1031 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.utilization_load_avg
  33881927 =C2=B1  2%     +15.2%   39031049 =C2=B1  5%  sched_debug.cfs_rq[=
60]:/.min_vruntime
     13.70 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
60]:/.runnable_load_avg
      3657 =C2=B1 10%     -75.1%     910.00 =C2=B1 15%  sched_debug.cfs_rq[=
60]:/.tg_load_avg
     63.60 =C2=B1 92%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
60]:/.tg_load_contrib
      1013 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
60]:/.utilization_load_avg
  33820442 =C2=B1  2%     +14.5%   38725287 =C2=B1  4%  sched_debug.cfs_rq[=
61]:/.min_vruntime
     13.60 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
61]:/.runnable_load_avg
      3629 =C2=B1  8%     -74.9%     910.10 =C2=B1 15%  sched_debug.cfs_rq[=
61]:/.tg_load_avg
     51.80 =C2=B1 84%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
61]:/.tg_load_contrib
      1018 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
61]:/.utilization_load_avg
  33824363 =C2=B1  2%     +14.8%   38833134 =C2=B1  4%  sched_debug.cfs_rq[=
62]:/.min_vruntime
     14.20 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
62]:/.runnable_load_avg
      3605 =C2=B1  8%     -74.8%     909.80 =C2=B1 15%  sched_debug.cfs_rq[=
62]:/.tg_load_avg
     62.10 =C2=B1104%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
62]:/.tg_load_contrib
      1043 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
62]:/.utilization_load_avg
  33381453 =C2=B1  2%     +15.5%   38568017 =C2=B1  4%  sched_debug.cfs_rq[=
63]:/.min_vruntime
     14.10 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
63]:/.runnable_load_avg
      3618 =C2=B1  8%     -74.9%     909.30 =C2=B1 15%  sched_debug.cfs_rq[=
63]:/.tg_load_avg
     44.10 =C2=B1 46%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
63]:/.tg_load_contrib
      1040 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
63]:/.utilization_load_avg
     14.30 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.runnable_load_avg
    169996 =C2=B1183%   -1462.0%   -2315288 =C2=B1-19%  sched_debug.cfs_rq[=
6]:/.spread0
      4742 =C2=B1  7%     -81.0%     902.80 =C2=B1 16%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
     58.30 =C2=B1 73%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
      1043 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.utilization_load_avg
  33229074 =C2=B1  1%     +12.0%   37231884 =C2=B1  5%  sched_debug.cfs_rq[=
7]:/.min_vruntime
     14.00 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
   -197575 =C2=B1-177%    +933.1%   -2041247 =C2=B1-28%  sched_debug.cfs_rq=
[7]:/.spread0
      4673 =C2=B1  7%     -80.7%     903.60 =C2=B1 16%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
     68.40 =C2=B1 73%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.tg_load_contrib
      1027 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.utilization_load_avg
     86.40 =C2=B1 55%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.blocked_load_avg
     14.20 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.runnable_load_avg
   1573518 =C2=B1 29%    -186.4%   -1359147 =C2=B1-46%  sched_debug.cfs_rq[=
8]:/.spread0
      4661 =C2=B1  6%     -80.6%     903.60 =C2=B1 16%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
    100.80 =C2=B1 47%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.tg_load_contrib
      1045 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.utilization_load_avg
     13.80 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.runnable_load_avg
   1585079 =C2=B1 28%    -183.5%   -1324193 =C2=B1-36%  sched_debug.cfs_rq[=
9]:/.spread0
      4643 =C2=B1  6%     -80.5%     903.90 =C2=B1 16%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
     73.70 =C2=B1 87%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.tg_load_contrib
      1058 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.utilization_load_avg
    -52.90 =C2=B1-50%    +372.2%    -249.80 =C2=B1-34%  sched_debug.cpu#0.n=
r_uninterruptible
    545545 =C2=B1  5%     +35.1%     737190 =C2=B1  7%  sched_debug.cpu#14.=
avg_idle
    571861 =C2=B1  9%     +24.3%     710992 =C2=B1  8%  sched_debug.cpu#15.=
avg_idle
    541285 =C2=B1  3%     +34.9%     730262 =C2=B1  8%  sched_debug.cpu#16.=
avg_idle
    555469 =C2=B1  5%    +110.5%    1169125 =C2=B1 73%  sched_debug.cpu#17.=
avg_idle
    554839 =C2=B1  5%     +73.0%     959777 =C2=B1 69%  sched_debug.cpu#18.=
avg_idle
    538835 =C2=B1  4%    +117.4%    1171534 =C2=B1 80%  sched_debug.cpu#19.=
avg_idle
    539361 =C2=B1  4%     +28.0%     690336 =C2=B1 10%  sched_debug.cpu#2.a=
vg_idle
    562098 =C2=B1  3%     +28.2%     720367 =C2=B1  7%  sched_debug.cpu#20.=
avg_idle
    555944 =C2=B1  4%     +34.8%     749292 =C2=B1  9%  sched_debug.cpu#22.=
avg_idle
    543010 =C2=B1  3%    +101.9%    1096361 =C2=B1102%  sched_debug.cpu#25.=
avg_idle
    554463 =C2=B1  6%     +93.1%    1070872 =C2=B1 90%  sched_debug.cpu#26.=
avg_idle
    560540 =C2=B1  5%     +32.4%     742249 =C2=B1  8%  sched_debug.cpu#27.=
avg_idle
    547227 =C2=B1  5%    +130.1%    1259373 =C2=B1128%  sched_debug.cpu#28.=
avg_idle
    543962 =C2=B1  4%    +100.3%    1089527 =C2=B1 98%  sched_debug.cpu#29.=
avg_idle
    546547 =C2=B1  3%     +39.2%     760857 =C2=B1 20%  sched_debug.cpu#30.=
avg_idle
    545451 =C2=B1  2%     +63.3%     890691 =C2=B1 55%  sched_debug.cpu#31.=
avg_idle
    547635 =C2=B1  5%    +210.3%    1699238 =C2=B1170%  sched_debug.cpu#32.=
avg_idle
    558343 =C2=B1  4%     +29.2%     721195 =C2=B1  7%  sched_debug.cpu#33.=
avg_idle
    547043 =C2=B1  4%     +34.5%     735712 =C2=B1  9%  sched_debug.cpu#35.=
avg_idle
    553034 =C2=B1  4%     +30.1%     719755 =C2=B1  8%  sched_debug.cpu#36.=
avg_idle
    543521 =C2=B1  4%     +34.5%     731290 =C2=B1  8%  sched_debug.cpu#37.=
avg_idle
    550419 =C2=B1  5%     +32.3%     728473 =C2=B1  6%  sched_debug.cpu#38.=
avg_idle
    548564 =C2=B1  4%     +34.1%     735610 =C2=B1  8%  sched_debug.cpu#39.=
avg_idle
    560744 =C2=B1  6%     +37.0%     768345 =C2=B1  8%  sched_debug.cpu#41.=
avg_idle
    560301 =C2=B1  6%     +37.3%     769327 =C2=B1  6%  sched_debug.cpu#43.=
avg_idle
    562698 =C2=B1  6%     +80.3%    1014590 =C2=B1 74%  sched_debug.cpu#44.=
avg_idle
    555163 =C2=B1  4%     +39.6%     774893 =C2=B1 10%  sched_debug.cpu#45.=
avg_idle
    567038 =C2=B1  3%     +34.0%     760040 =C2=B1 11%  sched_debug.cpu#46.=
avg_idle
    577024 =C2=B1  4%     +90.2%    1097280 =C2=B1 89%  sched_debug.cpu#47.=
avg_idle
    562118 =C2=B1  4%     +92.7%    1083118 =C2=B1 82%  sched_debug.cpu#48.=
avg_idle
    557672 =C2=B1  4%     +96.4%    1095320 =C2=B1 90%  sched_debug.cpu#49.=
avg_idle
     30.30 =C2=B1 75%    +167.0%      80.90 =C2=B1 26%  sched_debug.cpu#49.=
nr_uninterruptible
    -23.80 =C2=B1-95%    +344.5%    -105.80 =C2=B1-42%  sched_debug.cpu#5.n=
r_uninterruptible
    552233 =C2=B1  5%    +107.7%    1146792 =C2=B1 97%  sched_debug.cpu#50.=
avg_idle
    555883 =C2=B1  4%     +36.7%     759867 =C2=B1  6%  sched_debug.cpu#51.=
avg_idle
    586282 =C2=B1  8%     +31.6%     771740 =C2=B1  6%  sched_debug.cpu#52.=
avg_idle
     23.90 =C2=B1105%    +252.3%      84.20 =C2=B1 50%  sched_debug.cpu#52.=
nr_uninterruptible
    555136 =C2=B1  5%     +39.2%     772692 =C2=B1  7%  sched_debug.cpu#53.=
avg_idle
     34.10 =C2=B1 51%    +159.5%      88.50 =C2=B1 40%  sched_debug.cpu#53.=
nr_uninterruptible
    565241 =C2=B1  2%     +74.9%     988859 =C2=B1 69%  sched_debug.cpu#54.=
avg_idle
    559277 =C2=B1  6%     +37.7%     769979 =C2=B1  6%  sched_debug.cpu#55.=
avg_idle
    547832 =C2=B1  4%     +40.0%     766752 =C2=B1  9%  sched_debug.cpu#57.=
avg_idle
    555245 =C2=B1 11%     +39.5%     774714 =C2=B1  8%  sched_debug.cpu#58.=
avg_idle
     24.50 =C2=B1 62%    +211.0%      76.20 =C2=B1 49%  sched_debug.cpu#58.=
nr_uninterruptible
    557227 =C2=B1  4%     +37.9%     768448 =C2=B1  7%  sched_debug.cpu#59.=
avg_idle
     24.80 =C2=B1 72%    +207.7%      76.30 =C2=B1 35%  sched_debug.cpu#59.=
nr_uninterruptible
    -17.60 =C2=B1-115%    +572.7%    -118.40 =C2=B1-62%  sched_debug.cpu#6.=
nr_uninterruptible
    546637 =C2=B1  5%     +40.9%     770196 =C2=B1  8%  sched_debug.cpu#60.=
avg_idle
    553891 =C2=B1  3%     +86.1%    1030731 =C2=B1 77%  sched_debug.cpu#61.=
avg_idle
    558168 =C2=B1  5%     +38.2%     771187 =C2=B1  7%  sched_debug.cpu#63.=
avg_idle
    558257 =C2=B1  7%     +22.8%     685497 =C2=B1 10%  sched_debug.cpu#7.a=
vg_idle
     -9.10 =C2=B1-158%    +902.2%     -91.20 =C2=B1-42%  sched_debug.cpu#7.=
nr_uninterruptible
    543141 =C2=B1  7%     +30.7%     709747 =C2=B1 10%  sched_debug.cpu#8.a=
vg_idle


lkp-nex04: Nehalem-EX
Memory: 256G






  3.4e+08 ++---------*-----------------------------------------------------=
-*
          |.*..   .*    *.*      *. .*.. .*. .*..*. .*..  *.          .*.. =
+|
  3.2e+08 *+   *.*         +   ..  *    *   *      *     +  *.  .*. .*    *=
 |
          |                 *.*                         *     *.   *       =
 |
          |                                                                =
 |
    3e+08 ++                                                               =
 |
          |                                                                =
 |
  2.8e+08 ++                                                               =
 |
          |                                                                =
 |
  2.6e+08 ++                O                                              =
 |
          |                                                                =
 |
          |    O O O O        O    O O  O                                  =
 |
  2.4e+08 O+O           O O      O        O                                =
 |
          |                                                                =
 |
  2.2e+08 ++---------------------------------------------------------------=
-+


                                 turbostat.CPU%c1

  0.45 ++-----------------------------O------------------------------------=
-+
       |                                                                   =
 |
   0.4 ++                                                                  =
 |
  0.35 ++                                                                  =
 |
       |                                                                   =
 |
   0.3 ++     O                                                            =
 |
       | O  O    O   O  O   O  O                                           =
 |
  0.25 O+          O      O      O  O   O                                  =
 |
       |                                                                   =
 |
   0.2 ++                                                                  =
 |
  0.15 ++                                                                  =
 |
       |                                                          *..      =
 |
   0.1 ++                                   .*.           .*..   +   *.*..*=
.*
       *.*..*.*..*.*.*..*.*.*..*.*..*.*.*..*   *..*.*..*.*    *.*          =
 |
  0.05 ++------------------------------------------------------------------=
-+


                         ebizzy.throughput.per_thread.max

  150 ++-------------------------------------------------------------------=
-+
      |         O           O O  O   O  O                                  =
 |
  145 O+O  O O    O O  O O         O                                       =
 |
      |                                                                    =
 |
  140 ++                                                                   =
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
      |               .*.*..*.         .*.                .*.. .*.*..      =
 |
  120 *+*..    .*.*.*.        *..*.*.*.   *..*     .*.*..*    *      *.*..*=
.*
      |    *.*.                               + .*.                        =
 |
  115 ++---------------------------------------*---------------------------=
-+


                    ebizzy.throughput.per_thread.stddev_percent

  0.13 ++------------------------------------------------------------------=
-+
       |                    O  O O  O   O                                  =
 |
  0.12 O+   O O  O O O  O O           O                                    =
 |
  0.11 ++O                                                                 =
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
       |                                                                   =
 |
  0.06 *+*..*.*..                      .*..           .*.*.*.. .*.*..*.*..*=
.*
  0.05 ++        *.*.*..*.*.*..*.*..*.*    *.*.  .*.*.        *            =
 |
       |                                       *.                          =
 |
  0.04 ++------------------------------------------------------------------=
-+


                       ebizzy.time.involuntary_context_switches

  5.7e+06 ++---------------------------------------------------------------=
-+
          |                                                   *..   .*.    =
 |
  5.6e+06 ++                                            *.*. +    .*   *..*=
.*
          |                                             :   *    *         =
 |
  5.5e+06 ++                                           :                   =
 |
  5.4e+06 ++                                           :                   =
 |
          |                                           :                    =
 |
  5.3e+06 ++                                          :                    =
 |
          |         .*..*. .*.*..*.*.  .*. .*.  .*.*.:                     =
 |
  5.2e+06 *+*..*.*.*      *          *.   *   *.     *                     =
 |
  5.1e+06 ++                                                               =
 |
          | O      O    O O        O O                                     =
 |
    5e+06 O+   O O   O      O O  O      O O                                =
 |
          |                                                                =
 |
  4.9e+06 ++---------------------------------------------------------------=
-+


                         proc-vmstat.numa_hint_faults_local

  850000 ++----------------------------------------------------------------=
-+
         |   .*.*.               .*..                                      =
 |
         *.*.     *..*.*.*.*..*.*    *.*.*..*.*.*..*.*.*..*.*.*.*..*.*.*..*=
.*
  800000 ++                                                                =
 |
         |                                                                 =
 |
         |                                                                 =
 |
  750000 ++                                                                =
 |
         |                                                                 =
 |
  700000 ++                                                                =
 |
         |                                                                 =
 |
         |                                                                 =
 |
  650000 ++                                                                =
 |
         |           O O O    O O O  O O O                                 =
 |
         O O  O O O        O                                               =
 |
  600000 ++----------------------------------------------------------------=
-+


                           proc-vmstat.numa_pages_migrated

  320000 O+---O-O-O--------------------------------------------------------=
-+
  300000 ++O           O   O  O O O  O                                     =
 |
         |           O   O             O O                                 =
 |
  280000 ++                                                                =
 |
  260000 ++                                                                =
 |
         |                                                                 =
 |
  240000 ++                                                                =
 |
  220000 ++                                                                =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  180000 ++                                                                =
 |
  160000 ++                                                                =
 |
         *.  .*. .*.. .*. .*.. .*.      .*..        .*.*.. .*. .*.. .*.*.. =
 |
  140000 ++*.   *    *   *    *   *..*.*    *.*.*..*      *   *    *      *=
.*
  120000 ++----------------------------------------------------------------=
-+


                            proc-vmstat.pgmigrate_success

  320000 O+---O-O-O--------------------------------------------------------=
-+
  300000 ++O           O   O  O O O  O                                     =
 |
         |           O   O             O O                                 =
 |
  280000 ++                                                                =
 |
  260000 ++                                                                =
 |
         |                                                                 =
 |
  240000 ++                                                                =
 |
  220000 ++                                                                =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  180000 ++                                                                =
 |
  160000 ++                                                                =
 |
         *.  .*. .*.. .*. .*.. .*.      .*..        .*.*.. .*. .*.. .*.*.. =
 |
  140000 ++*.   *    *   *    *   *..*.*    *.*.*..*      *   *    *      *=
.*
  120000 ++----------------------------------------------------------------=
-+


                            proc-vmstat.thp_fault_alloc

  2000 ++----------*-----------*-*-----------------------------------------=
-+
       |          +  *..*     :               .*..                     *.. =
 *
  1800 ++    .*..*       +    :     *.*.*..*.*    *.*.. .*            +    =
+|
       *.*..*             *. :                         *  +     *.*..*    *=
 |
  1600 ++                   *                              *.. +           =
 |
       |                                                      *            =
 |
  1400 ++                                                                  =
 |
       |                                                                   =
 |
  1200 ++                                                                  =
 |
       |                                                                   =
 |
  1000 ++                                                                  =
 |
       |    O                                                              =
 |
   800 O+O    O  O   O    O                                                =
 |
       |           O    O   O  O O  O O                                    =
 |
   600 ++-------------------------------O----------------------------------=
-+


                        sched_debug.cfs_rq[0]:/.tg_load_avg

  7000 ++------------------------------------------------------------------=
-+
       |                                       *                           =
 |
  6000 ++        *.*.                   *..   : +   *..       *            =
 |
       |   .*. ..    *..      .*.      +   *. :  + +   *    .. + .*..     *=
 |
  5000 *+*.   *            .*.   *..*.*      *    *     + .*    *    *. .. =
+|
       |                *.*                              *             *   =
 *
  4000 ++                                                                  =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[1]:/.tg_load_avg

  7000 ++------------------------------------------------------------------=
-+
       |                                       *                           =
 |
  6000 ++        *.*                    *..    :+   *..                    =
 |
       |   .*. ..   +         .*.      +   *  :  + +             .*..     *=
 |
  5000 *+*.   *      *..   .*.   *..*.*     + :   *    *.    .*.*       .. =
+|
       |                *.*                  *           *.*.        *.*   =
 *
  4000 ++                                                                  =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[2]:/.tg_load_avg

  7000 ++------------------------------------------------------------------=
-+
       |                                       *                           =
 |
  6000 ++        *.*                    *..    :+                          =
 |
       |   .*. ..   +         .*.      +   *  :  + .*..          .*..     *=
 |
  5000 *+*.   *      *..   .*.   *..*.*     + :   *    *.    .*.*       .. =
+|
       |                *.*                  *           *.*.        *.*   =
 *
  4000 ++                                                                  =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[3]:/.tg_load_avg

  7000 ++------------------------------------------------------------------=
-+
       |                                       *                           =
 |
  6000 ++        *.*                    *..    :+                          =
 |
       |   .*. ..   +         .*.      +   *  :  + .*..          .*..     *=
 |
  5000 *+*.   *      *..   .*.   *..*.*     + :   *    *.    .*.*       .. =
+|
       |                *.*                  *           *.*.        *.*   =
 *
  4000 ++                                                                  =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[4]:/.tg_load_avg

  7000 ++------------------------------------------------------------------=
-+
       |                                       *                           =
 |
  6000 ++        *.*                    *..    :+                          =
 |
       |   .*. ..   +          *.      +      :  + .*..           *..      =
 |
  5000 *+*.   *      *..     ..  *..*.*    *. :   *    *.    .*. +       .*=
.|
       |                *.*.*                *           *.*.   *    *.*.  =
 *
  4000 ++                                                                  =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[5]:/.tg_load_avg

  7000 ++------------------------------------------------------------------=
-+
       |                                       *                           =
 |
  6000 ++        *.*                           :+                          =
 |
       |   .*. ..   +          *.      .*..   :  + .*..                    =
 |
  5000 *+*.   *      *..     ..  *..*.*    *. :   *    *.    .*. .*..    .*=
.|
       |                *.*.*                *           *.*.   *    *.*.  =
 *
  4000 ++                                                                  =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[6]:/.tg_load_avg

  7000 ++------------------------------------------------------------------=
-+
       |                                       *                           =
 |
  6000 ++        *.*                           :+                          =
 |
       |   .*. ..   +          *       .*..   :  + .*..                    =
 |
  5000 *+*.   *      *..     .. +  .*.*    *. :   *    *.    .*. .*..    .*=
.|
       |                *.*.*    *.          *           *.*.   *    *.*.  =
 *
  4000 ++                                                                  =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[7]:/.tg_load_avg

  7000 ++------------------------------------------------------------------=
-+
       |                                       *                           =
 |
  6000 ++        *.*                           :+                          =
 |
       |       ..   +          *       .*..   :  + .*..                    =
 |
  5000 *+*.. .*      *..     .. +  .*.*    *. :   *    *.        .*..    .*=
.|
       |    *           *.*.*    *.          *           *.*..*.*    *.*.  =
 *
  4000 ++                                                                  =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[8]:/.tg_load_avg

  7000 ++------------------------------------------------------------------=
-+
       |                                       *..                         =
 |
  6000 ++        *.*                           :                           =
 |
       |       ..   +          *       .*..   :   *.*..                    =
 |
  5000 *+*.. .*      *..     .. +  .*.*    *. :        *.        .*..    .*=
.|
       |    *           *.*.*    *.          *           *.*..*.*    *.*.  =
 *
  4000 ++                                                                  =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[9]:/.tg_load_avg

  7000 ++------------------------------------------------------------------=
-+
       |                                       *..                         =
 |
  6000 ++        *.*                           :                           =
 |
       |       ..   +          *       .*..   :   *.*..                    =
 |
  5000 *+*.. .*      *..     .. +  .*.*    *. :        *.      .*.*..    .*=
.|
       |    *           *.*.*    *.          *           *.*..*      *.*.  =
 *
  4000 ++                                                                  =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[10]:/.tg_load_avg

  7000 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  6000 ++        *.*                           *..                         =
 |
       |        +   +          *       .*..   :   *.*..                    =
 |
  5000 *+      +     *..     .. +  .*.*    *. :        *.      .*.*..     *=
.|
       | *..*.*         *.*.*    *.          *           *.*..*      *. .. =
 *
  4000 ++                                                              *   =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[11]:/.tg_load_avg

  7000 ++------------------------------------------------------------------=
-+
       |                                       *..                         =
 |
  6000 ++        *.*                           :                           =
 |
       |        +   +          *       .*..   :   *.*..                    =
 |
  5000 *+      +     *..     .. +  .*.*    *. :        *.      .*.*..     *=
.|
       | *..*.*         *. .*    *.          *           *.*..*      *. .. =
 *
  4000 ++                 *                                            *   =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[12]:/.tg_load_avg

  7000 ++------------------------------------------------------------------=
-+
       |                                       *                           =
 |
  6000 ++         .*                           :+                          =
 |
       |         *  +          *       .*..   :  + .*..                    =
 |
  5000 *+      ..    *..     .. +  .*.*    *. :   *    *.      .*.*..     *=
.|
       | *..*.*         *. .*    *.          *           *.*..*      *. .. =
 *
  4000 ++                 *                                            *   =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[13]:/.tg_load_avg

  7000 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  6000 ++         .*           *                                           =
 |
       |         *  +         + :      .*..    *.. .*..                    =
 |
  5000 *+      ..    *..     +  :    .*    *. +   *    *.      .*.*..     *=
.|
       | *..*.*         *. .*    *..*        *           *.*..*         .. =
 *
  4000 ++                 *                                          *.*   =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[14]:/.tg_load_avg

  6000 ++----------*-------------------------------------------------------=
-+
       |         *  :          *                   .*..                    =
 |
  5000 *+       +   :        .. +      .*..   .*..*              .*..      =
 |
       | *..*. +     *..   .*    *..*.*    *.*         *. .*..*.*        .*=
.|
       |      *         *.*                              *           *.*.  =
 *
  4000 ++                                                                  =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
       |    O                                                              =
 |
  1000 O+O    O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[15]:/.tg_load_avg

  7000 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  6000 ++        *.*                                                       =
 |
       |        +   +          *       .*..    *.. .*..                    =
 |
  5000 *+      +     *..     .. +    .*    *. +   *    *       .*.*..     *=
.|
       | *..*.*         *. .*    *..*        *          + .*..*      *. .. =
 *
  4000 ++                 *                              *             *   =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[16]:/.tg_load_avg

  7000 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  6000 ++         .*                                                       =
 |
       |         *  +          *       .*..    *.. .*..                    =
 |
  5000 *+      ..    *..     .. +    .*    *. +   *    *       .*.*..     *=
.|
       | *..*.*         *. .*    *..*        *          + .*..*      *. .. =
 *
  4000 ++                 *                              *             *   =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[17]:/.tg_load_avg

  7000 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  6000 ++         .*                                                       =
 |
       |         *  +          *       .*..    *.. .*..                    =
 |
  5000 *+      ..    *..     .. +    .*    *. +   *    *       .*.*..     *=
.|
       | *..*.*         *. .*    *..*        *          + .*..*      *. .. =
 *
  4000 ++                 *                              *             *   =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[18]:/.tg_load_avg

  6000 ++----------*-------------------------------------------------------=
-+
       |          + :          *                    *..                    =
 |
  5000 *+        *  :         + :      .*..   .*.. +   *         .*..      =
 |
       | *..   ..    :       +  :  .*.*    *.*    *     + .*..*.*        .*=
.|
       |    *.*      *..*.*.*    *.                      *           *.*.  =
 *
  4000 ++                                                                  =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
       |    O                                                              =
 |
  1000 O+O    O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[19]:/.tg_load_avg

  6000 ++------------------------------------------------------------------=
-+
       |          .*           *                   .*..                    =
 |
  5000 *+        *  :         + :      .*..    *..*    *         .*..      =
 |
       | *..   ..   :        +  :  .*.*    *. +         +    .*.*        .*=
.|
       |    *.*      *..*.*.*    *.          *           *.*.        *.*.  =
 *
  4000 ++                                                                  =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
       |    O                                                              =
 |
  1000 O+O    O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[20]:/.tg_load_avg

  6000 ++------------------------------------------------------------------=
-+
       |                       *                   .*..                    =
 |
  5000 *+        *.*          + :      .*..    *..*    *                   =
 |
       |+      ..   +        +  :  .*.*    *. +         +    .*.*.*..     *=
.|
       | *..*.*      *..*.*.*    *.          *           *.*.        *. .. =
 *
  4000 ++                                                              *   =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
       |    O                                                              =
 |
  1000 O+O    O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[21]:/.tg_load_avg

  6000 ++------------------------------------------------------------------=
-+
       |                       *                   .*..                    =
 |
  5000 *+        *.*          + :      .*..    *..*    *                   =
 |
       | *..   ..   +        +  :  .*.*    *. +         + .*..*.*.*..    .*=
.|
       |    *.*      *..*. .*    *.          *           *           *.*.  =
 *
  4000 ++                 *                                                =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
       |    O                                                              =
 |
  1000 O+O    O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[22]:/.tg_load_avg

  6000 ++------------------------------------------------------------------=
-+
       |                       *                                           =
 |
  5000 ++        *.*          + :      .*..    *..*.*..*                   =
 |
       *.*..   ..   +        +  :  .*.*    *. +         +    .*.*.*..    .*=
.|
       |    *.*      *..*. .*    *.          *           *.*.        *.*.  =
 *
  4000 ++                 *                                                =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
       |    O                                                              =
 |
  1000 O+O    O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[23]:/.tg_load_avg

  6000 ++------------------------------------------------------------------=
-+
       |                       *                                           =
 |
  5000 ++        *.*          + :      .*..    *.. .*..*                   =
 |
       *.*..   ..   +        +  :  .*.*    *. +   *     + .*..*.*.*..     *=
.|
       |    *.*      *..*. .*    *.          *           *           *. .. =
 *
  4000 ++                 *                                            *   =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
       |    O                                                              =
 |
  1000 O+O    O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[24]:/.tg_load_avg

  6000 ++------------------------------------------------------------------=
-+
       |                       *                                           =
 |
  5000 ++        *.*          + :      .*..    *.. .*..                    =
 |
       *.*..   ..   :        +  :  .*.*    *. +   *    *. .*..*.*.*..     *=
.|
       |    *.*     :  .*. .*    *.          *           *           *. .. =
 *
  4000 ++            *.   *                                            *   =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
       |    O                                                              =
 |
  1000 O+O    O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[25]:/.tg_load_avg

  6000 ++------------------------------------------------------------------=
-+
       |                       *                                           =
 |
  5000 ++        *.*          + :      .*..    *.. .*..                    =
 |
       |.*..   ..   +        +  :  .*.*    *. +   *    *. .*..*.*.*..      =
 |
       *    *.*      *..*. .*    *.          *           *           *.  .*=
.*
  4000 ++                 *                                            *.  =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
       |    O                                                              =
 |
  1000 O+O    O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[26]:/.tg_load_avg

  6000 ++------------------------------------------------------------------=
-+
       |                       *                                           =
 |
  5000 ++        *.*          + :      .*..    *.. .*..                    =
 |
       |.*..   ..   +        +  :  .*.*    *. +   *    *. .*..*.*.*..      =
 |
       *    *.*      *..*. .*    *.          *           *           *.  .*=
.*
  4000 ++                 *                                            *.  =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
       |    O                                                              =
 |
  1000 O+O    O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[27]:/.tg_load_avg

  5500 ++----------------------*-------------------------------------------=
-+
  5000 ++         .*          + :      .*..    *.. .*..*                   =
 |
       |.*..    .*  :        +  :  .*.*    *. +   *     :    .*.*.*..      =
 |
  4500 *+    .*.    :  .*. .*    *.          *          : .*.            .*=
.*
  4000 ++   *        *.   *                              *           *.*.  =
 |
  3500 ++                                                                  =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2500 ++                                                                  =
 |
  2000 ++                                                                  =
 |
  1500 ++                                                                  =
 |
  1000 O+   O O                         O                                  =
 |
       | O       O O O  O O O  O O  O                                      =
 |
   500 ++                             O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[28]:/.tg_load_avg

  5500 ++----------------------*--------------------*----------------------=
-+
  5000 ++                     + :       *..    *.. +                       =
 |
       |        .*.*         +  :  .*. +   *. +   *    *       .*.*..      =
 |
  4500 *+*.. .*.    +  .*. .*    *.   *      *          + .*..*           *=
.*
  4000 ++   *        *.   *                              *           *. .. =
 |
  3500 ++                                                              *   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2500 ++                                                                  =
 |
  2000 ++                                                                  =
 |
  1500 ++                                                                  =
 |
  1000 O+   O O                         O                                  =
 |
       | O       O O O  O O O  O O  O                                      =
 |
   500 ++                             O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[29]:/.tg_load_avg

  6000 ++------------------------------------------------------------------=
-+
       |                       *                                           =
 |
  5000 ++                     + :       *..        .*..                    =
 |
       |        .*.*         +  :  .*. +   *. .*..*    *       .*.*..      =
 |
       *.  .*.*.    +  .*. .*    *.   *      *          + .*..*      *.  .*=
.*
  4000 ++*.          *.   *                              *             *.  =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
       |    O                                                              =
 |
  1000 O+O    O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[30]:/.tg_load_avg

  6000 ++------------------------------------------------------------------=
-+
       |                       *                                           =
 |
  5000 ++                     : :                  .*..                    =
 |
       |        .*.*          : :  .*. .*..*. .*..*    *       .*.         =
 |
       *.  .*.*.    +  .*.   :   *.   *      *          :  *..*   *..    .*=
.|
  4000 ++*.          *.   *.*                           : +          *.*.  =
 *
       |                                                 *                 =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
       |    O                                                              =
 |
  1000 O+O    O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[31]:/.tg_load_avg

  5500 ++----------------------*-------------------------------------------=
-+
  5000 ++                     : :       *..        .*..                    =
 |
       |        .*.*          : :  .*  :   *   *..*    *       .*.*..      =
 |
  4500 *+    .*.    +        :   *.  + :    + +         :  *..*          .*=
.|
  4000 ++*..*        *..  *.*         *      *          : :          *.*.  =
 *
  3500 ++                +                               ::                =
 |
  3000 ++               *                                *                 =
 |
       |                                                                   =
 |
  2500 ++                                                                  =
 |
  2000 ++                                                                  =
 |
  1500 ++                                                                  =
 |
  1000 O+   O O                         O                                  =
 |
       | O       O O O  O O O  O O  O                                      =
 |
   500 ++                             O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[32]:/.tg_load_avg

  5500 ++----------------------*-------------------------------------------=
-+
  5000 ++                     : :                  .*..                    =
 |
       |        .*.*          : :  .*   *..*   *..*    *          *..      =
 |
  4500 *+    .*.    +        :   *.  + +    + +         :  *..*. +         =
 |
  4000 ++*..*        *..  *.*         *      *          : :     *    *.*..*=
.*
  3500 ++                +                               ::                =
 |
  3000 ++               *                                *                 =
 |
       |                                                                   =
 |
  2500 ++                                                                  =
 |
  2000 ++                                                                  =
 |
  1500 ++                                                                  =
 |
  1000 O+   O O                         O                                  =
 |
       | O       O O O  O O O  O O  O                                      =
 |
   500 ++                             O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[33]:/.tg_load_avg

  5500 ++----------------------*-------------------------------------------=
-+
  5000 ++                     : :                  .*..                    =
 |
       |         *.*          : :  .*   *..*   *..*    *          *..      =
 |
  4500 *+      ..   +        :   *.  + +    + +         :  *..*. +        *=
.|
  4000 ++*..*.*      *..  *.*         *      *          : :     *    *. .. =
 *
  3500 ++                +                               ::            *   =
 |
  3000 ++               *                                *                 =
 |
       |                                                                   =
 |
  2500 ++                                                                  =
 |
  2000 ++                                                                  =
 |
  1500 ++                                                                  =
 |
  1000 O+   O O                         O                                  =
 |
       | O       O O O  O O O  O O  O                                      =
 |
   500 ++                             O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[34]:/.tg_load_avg

  5500 ++----------------------*-------------------------------------------=
-+
  5000 ++                     : :                  .*..                    =
 |
       |         *.*          : :  .*   *..*   *..*    *          *..      =
 |
  4500 *+      ..   +        :   *.  + +    + +         :  *..*. +         =
 |
  4000 ++*..*.*      *..  *.*         *      *          : :     *    *.*..*=
.*
  3500 ++                +                               ::                =
 |
  3000 ++               *                                *                 =
 |
       |                                                                   =
 |
  2500 ++                                                                  =
 |
  2000 ++                                                                  =
 |
  1500 ++                                                                  =
 |
  1000 O+   O O                         O                                  =
 |
       | O       O O O  O O O  O O  O                                      =
 |
   500 ++                             O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[35]:/.tg_load_avg

  5500 ++----------------------*-------------------------------------------=
-+
  5000 ++                     : :                  .*..                    =
 |
       |         *.*          : :  .*   *..*   *..*    *          *..      =
 |
  4500 *+      ..   +        :   *.  + +    + +         :  *..*. +         =
 |
  4000 ++*..*.*      *..  *.*         *      *          : :     *    *.  .*=
.*
  3500 ++                +                               ::            *.  =
 |
  3000 ++               *                                *                 =
 |
       |                                                                   =
 |
  2500 ++                                                                  =
 |
  2000 ++                                                                  =
 |
  1500 ++                                                                  =
 |
  1000 O+   O O                         O                                  =
 |
       | O       O O O  O O O  O O  O                                      =
 |
   500 ++                             O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[36]:/.tg_load_avg

  5500 ++----------------------*-------------------------------------------=
-+
  5000 ++                     : :                  .*..                    =
 |
       |         *.*          : :       *..*   *..*    *                   =
 |
  4500 *+      ..   +        :   *..*. +    + +         :  *..*. .*..      =
 |
  4000 ++*..*.*      *..  *.*         *      *          : :     *    *.  .*=
.*
  3500 ++                +                               ::            *.  =
 |
  3000 ++               *                                *                 =
 |
       |                                                                   =
 |
  2500 ++                                                                  =
 |
  2000 ++                                                                  =
 |
  1500 ++                                                                  =
 |
  1000 O+   O O                         O                                  =
 |
       | O       O O O  O O O  O O  O                                      =
 |
   500 ++                             O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[37]:/.tg_load_avg

  6000 ++------------------------------------------------------------------=
-+
       |                       *                                           =
 |
  5000 ++                     : :                                          =
 |
       |         *.*          : :         .*   *..*.*..*          *..      =
 |
       *.      ..   +        :   *..*. .*.  + +         :  *..*. +         =
 |
  4000 ++*..*.*      *..  *.*         *      *          : +     *    *.*..*=
.*
       |                 +                               *                 =
 |
  3000 ++               *                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
       |    O                                                              =
 |
  1000 O+O    O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[38]:/.tg_load_avg

  6000 ++------------------------------------------------------------------=
-+
       |                       *                                           =
 |
  5000 ++                     : :                                          =
 |
       |         *.*          : :          *   *..*.*..*                   =
 |
       *.      ..   +        :   *..*.   .. + +         :  *..*. .*..      =
 |
  4000 ++*..*.*      *..  *.*         *.*    *          : +     *    *.*..*=
.*
       |                 +                               *                 =
 |
  3000 ++               *                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
       |    O                                                              =
 |
  1000 O+O    O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[39]:/.tg_load_avg

  6000 ++------------------------------------------------------------------=
-+
       |                       *                                           =
 |
  5000 ++                     : :                                          =
 |
       |         *.*          : :          *      *.*..*                   =
 |
       *.      ..   +        :   *..*.   .. +    +      :  *..*. .*..    .*=
.|
  4000 ++*..*.*      *..  *.*         *.*    *. +       : +     *    *.*.  =
 *
       |                 +                     *         *                 =
 |
  3000 ++               *                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
       |    O                                                              =
 |
  1000 O+O    O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[40]:/.tg_load_avg

  6000 ++------------------------------------------------------------------=
-+
       |                       *                                           =
 |
  5000 ++                     : :                                          =
 |
       |         *.           : :          *      *.  .*                   =
 |
       *.      ..  *.        :   *..*.   .. +    +  *.  :  *..*. .*..      =
 |
  4000 ++*..*.*      *..  *.*         *.*    *. +       : +     *    *.*..*=
.*
       |                 +                     *         *                 =
 |
  3000 ++               *                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
       |    O                                                              =
 |
  1000 O+O    O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[41]:/.tg_load_avg

  6000 ++------------------------------------------------------------------=
-+
       |                       *                                           =
 |
  5000 ++                     : :                                          =
 |
       |         *.           : :          *      *.  .*                   =
 |
       *.      ..  *.        :   *..*.   .. +    +  *.  :  *..*. .*..      =
 |
  4000 ++*..*.*      *..  *.*         *.*    *. +       : +     *    *.*..*=
.*
       |                 +                     *         *                 =
 |
  3000 ++               *                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
       |    O                                                              =
 |
  1000 O+O    O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[42]:/.tg_load_avg

  5500 ++----------------------*-------------------------------------------=
-+
  5000 ++                     : :                                          =
 |
       |         *.           : :          *      *.  .*                   =
 |
  4500 *+      ..  *         :   : .*.    + +    +  *.  :  *..*. .*..      =
 |
  4000 ++*..*.*     +     *.*    *.   *. +   *. +       : :     *    *.  .*=
.*
  3500 ++            *.. +              *      *         ::            *.  =
 |
  3000 ++               *                                *                 =
 |
       |                                                                   =
 |
  2500 ++                                                                  =
 |
  2000 ++                                                                  =
 |
  1500 ++                                                                  =
 |
  1000 O+   O O                         O                                  =
 |
       | O       O O O  O O O  O O  O                                      =
 |
   500 ++                             O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[43]:/.tg_load_avg

  5500 ++----------------------*-------------------------------------------=
-+
  5000 ++                     : :                                          =
 |
       |         *.           : :          *      *.  .*                   =
 |
  4500 *+       :  *         :   : .*.   .. +    +  *.  :  *..*. .*..      =
 |
  4000 ++*..    :   +     *.*    *.   *.*    *. +       : :     *    *.  .*=
.*
  3500 ++   *. :     *.. +                     *         ::            *.  =
 |
  3000 ++     *         *                                *                 =
 |
       |                                                                   =
 |
  2500 ++                                                                  =
 |
  2000 ++                                                                  =
 |
  1500 ++                                                                  =
 |
  1000 O+   O O                         O                                  =
 |
       | O       O O O  O O O  O O  O                                      =
 |
   500 ++                             O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[44]:/.tg_load_avg

  5500 ++----------------------*-------------------------------------------=
-+
  5000 ++                     : :                                          =
 |
       |         *.           : :          *      *.                       =
 |
  4500 *+       :  *         :   : .*.    + +    +  *..    *..*. .*..      =
 |
  4000 ++*..    :   +     *.*    *.   *. +   *. +      *  :     *    *.  .*=
.*
  3500 ++   *. :     *.. +              *      *        + :            *.  =
 |
  3000 ++     *         *                                *                 =
 |
       |                                                                   =
 |
  2500 ++                                                                  =
 |
  2000 ++                                                                  =
 |
  1500 ++                                                                  =
 |
  1000 O+   O O                         O                                  =
 |
       | O       O O O  O O O  O O  O                                      =
 |
   500 ++                             O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[45]:/.tg_load_avg

  6000 ++------------------------------------------------------------------=
-+
       |                       *                                           =
 |
  5000 ++                     : :                                          =
 |
       |         *.           : :                 *.                       =
 |
       *.       +  *.        :   *..*.           +  *..    *..*. .*..      =
 |
  4000 ++*..   +     *..  *.*         *.*..*.*. +         :     *    *.  .*=
.*
       |    *.*          +                     *       *. :            *.  =
 |
  3000 ++               *                                *                 =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
       |    O                                                              =
 |
  1000 O+O    O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[46]:/.tg_load_avg

  6000 ++------------------------------------------------------------------=
-+
       |                       *                                           =
 |
  5000 ++                     : :                                          =
 |
       |         *.           : :  .*             *.                       =
 |
       *.       +  *.        :   *.  +           +  *..    *..   .*..      =
 |
  4000 ++*..   +     *.. .*.*         *.*..*.*. +         +   *.*    *.  .*=
.*
       |    *.*         *                      *       *.*             *.  =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
       |    O                                                              =
 |
  1000 O+O    O  O O O  O O O  O O  O   O                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[47]:/.tg_load_avg

  5500 ++----------------------*-------------------------------------------=
-+
  5000 ++                     : :                                          =
 |
       |                      : :  .*             *.                       =
 |
  4500 *+        *.*         :   *.  +           +  *..    *..   .*..      =
 |
  4000 ++*..    +   +     *. :        *.*..*.*. +         :   *.*    *.  .*=
.*
  3500 ++   *. +     *.. +  *                  *       *. :            *.  =
 |
  3000 ++     *         *                                *                 =
 |
       |                                                                   =
 |
  2500 ++                                                                  =
 |
  2000 ++                                                                  =
 |
  1500 ++                                                                  =
 |
  1000 O+   O O                         O                                  =
 |
       | O       O O O  O O O  O O  O                                      =
 |
   500 ++                             O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[48]:/.tg_load_avg

  5500 ++------------------------------------------------------------------=
-+
  5000 ++                      *                                           =
 |
       |                      : +                 *.                       =
 |
  4500 *+        *.*.         :  *..*.           +  *..    *..   .*..      =
 |
  4000 ++*..    +    *..  *. :        *.  .*.*. +         :   *.*    *.  .*=
.*
  3500 ++   *. +         +  *           *.     *       *. :            *.  =
 |
  3000 ++     *         *                                *                 =
 |
       |                                                                   =
 |
  2500 ++                                                                  =
 |
  2000 ++                                                                  =
 |
  1500 ++                                                                  =
 |
  1000 O+   O O                         O                                  =
 |
       | O       O O O  O O O  O O  O                                      =
 |
   500 ++                             O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[49]:/.tg_load_avg

  5500 ++------------------------------------------------------------------=
-+
  5000 ++                      *                                           =
 |
       |                      : :                 *.                       =
 |
  4500 *+        *.*.         : :  .*.           +  *..    *..   .*..      =
 |
  4000 ++*..    +    *..  *. :   *.   *.  .*.*. +         :   *.*    *    *=
.*
  3500 ++   *. +         +  *           *.     *       *. :           + .. =
 |
  3000 ++     *         *                                *             *   =
 |
       |                                                                   =
 |
  2500 ++                                                                  =
 |
  2000 ++                                                                  =
 |
  1500 ++                                                                  =
 |
  1000 O+   O O                         O                                  =
 |
       | O       O O O  O O O  O O  O                                      =
 |
   500 ++                             O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[50]:/.tg_load_avg

  5500 ++------------------------------------------------------------------=
-+
  5000 ++                      *                                           =
 |
       |                      + :                 *.                       =
 |
  4500 *+        *.*.        +  :                +  *..    *..   .*..      =
 |
  4000 ++*..    +    *..  *.*    *..*.*.  .*.*. +         :   *.*    *    *=
.|
  3500 ++   *. +         +              *.     *       *. :           + .. =
 *
  3000 ++     *         *                                *             *   =
 |
       |                                                                   =
 |
  2500 ++                                                                  =
 |
  2000 ++                                                                  =
 |
  1500 ++                                                                  =
 |
  1000 O+   O O                         O                                  =
 |
       | O       O O O  O O O  O O  O                                      =
 |
   500 ++                             O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[51]:/.tg_load_avg

  5500 ++------------------------------------------------------------------=
-+
  5000 ++                      *                                           =
 |
       |                      + :                 *.                       =
 |
  4500 *+        *.*.        +  :                +  *..    *..   .*..      =
 |
  4000 ++*..    +    *..  *.*    *..*.*.  .*.*. +         :   *.*    *.  .*=
.|
  3500 ++   *. +         +              *.     *       *. :            *.  =
 *
  3000 ++     *         *                                *                 =
 |
       |                                                                   =
 |
  2500 ++                                                                  =
 |
  2000 ++                                                                  =
 |
  1500 ++                                                                  =
 |
  1000 O+   O O                         O                                  =
 |
       | O       O O O  O O O  O O  O                                      =
 |
   500 ++                             O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[52]:/.tg_load_avg

  5500 ++------------------------------------------------------------------=
-+
  5000 ++                      *                                           =
 |
       |                      + :                 *.                       =
 |
  4500 *+        *.*.        +  :                +  *..    *..   .*..      =
 |
  4000 ++*..    +    *..  *.*    *..*.*.  .*.*. +         :   *.*    *    *=
.|
  3500 ++   *. +         +              *.     *       *. :           + .. =
 *
  3000 ++     *         *                                *             *   =
 |
       |                                                                   =
 |
  2500 ++                                                                  =
 |
  2000 ++                                                                  =
 |
  1500 ++                                                                  =
 |
  1000 O+   O O                         O                                  =
 |
       | O       O O O  O O O  O O  O                                      =
 |
   500 ++                             O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[53]:/.tg_load_avg

  5000 ++------------------------------------------------------------------=
-+
  4500 ++                      *.                 *.                       =
 |
       *.        *.*.        ..  *..             +  *..    *..   .*..      =
 |
  4000 ++*..    +    *.. .*.*       *.*.  .*.*. +         :   *.*    *    *=
.|
  3500 ++      +        *               *.     *       *. :           + .. =
 *
       |    *.*                                          *             *   =
 |
  3000 ++                                                                  =
 |
  2500 ++                                                                  =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1500 ++                                                                  =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
       |                                                                   =
 |
   500 ++                             O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[54]:/.tg_load_avg

  5000 ++------------------------------------------------------------------=
-+
  4500 ++         .*           *.                 *.                       =
 |
       *.        *  +         +  *..             +  *..    *..   .*..      =
 |
  4000 ++*..    +    *..  *. +      *.*.  .*.   +         :   *.*         *=
.|
  3500 ++      +         +  *           *.   *.*       *. :          *. .. =
 *
       |    *.*         *                                *             *   =
 |
  3000 ++                                                                  =
 |
  2500 ++                                                                  =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1500 ++                                                                  =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
       |                                                                   =
 |
   500 ++                             O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[55]:/.tg_load_avg

  5000 ++------------------------------------------------------------------=
-+
  4500 ++                      *.                 *.                       =
 |
       *.        *.          ..  *..             +  *..    *..   .*..      =
 |
  4000 ++*..    +  *.*..  *.*       *.*.  .*.   +         :   *.*         *=
.|
  3500 ++      +         +              *.   *.*       *. :          *. .. =
 *
       |    *.*         *                                *             *   =
 |
  3000 ++                                                                  =
 |
  2500 ++                                                                  =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1500 ++                                                                  =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
       |                                                                   =
 |
   500 ++                             O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[56]:/.tg_load_avg

  5000 ++------------------------------------------------------------------=
-+
  4500 ++                      *.                 *.                       =
 |
       *         *.           +  *..             +  *..    *..    *..      =
 |
  4000 ++       +  *.     *. +      *.*.        +         :   *. +        *=
.|
  3500 ++*..   +     *.. +  *           *..*.*.*       *. :     *    *. .. =
 *
       |    *.*         *                                *             *   =
 |
  3000 ++                                                                  =
 |
  2500 ++                                                                  =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1500 ++                                                                  =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
       |                                                                   =
 |
   500 ++                             O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[57]:/.tg_load_avg

  5000 ++------------------------------------------------------------------=
-+
  4500 ++                      *.                 *.                       =
 |
       *         *.           +  *..             +  *..    *..    *..      =
 |
  4000 ++       +  *.     *. +      *.*.        +         +   *. +        *=
.|
  3500 ++*..   +     *.. +  *           *..*.*.*       *.*      *    *. .. =
 *
       |    *.*         *                                              *   =
 |
  3000 ++                                                                  =
 |
  2500 ++                                                                  =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1500 ++                                                                  =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
       |                                                                   =
 |
   500 ++                             O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[58]:/.tg_load_avg

  4500 ++----------------------*------------------*------------------------=
-+
       *.        *.          ..  *..             +  *..    *..*   *..      =
 |
  4000 ++*..    +  *.     *.*       *.*.  .*.   +         :    + +        *=
.|
  3500 ++      +     *.. +              *.   *.*       *. :     *    *. .. =
 *
       |    *.*         *                                *             *   =
 |
  3000 ++                                                                  =
 |
  2500 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
  1500 ++                                                                  =
 |
       |                                                                   =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
   500 ++                                                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[59]:/.tg_load_avg

  4500 ++----------------------*------------------*------------------------=
-+
       *.        *.           +  *..             +  *..      .*   *..      =
 |
  4000 ++*..    +  *.     *. +      *.*.  .*.   +         .*.  + +        *=
.*
  3500 ++      +     *.. +  *           *.   *.*       *.*      *    *. .. =
 |
       |    *.*         *                                              *   =
 |
  3000 ++                                                                  =
 |
  2500 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
  1500 ++                                                                  =
 |
       |                                                                   =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
   500 ++                                                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[60]:/.tg_load_avg

  4500 ++----------------------*------------------*------------------------=
-+
       *.        *.           +  *..             +  *        .*   *..      =
 |
  4000 ++*..    +  *.     *. +      *.          +    :    .*.  + +        *=
.|
  3500 ++      +     *.. +  *         *.*..*.*.*      :  *      *    *. .. =
 *
       |    *.*         *                             : +              *   =
 |
  3000 ++                                              *                   =
 |
  2500 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
  1500 ++                                                                  =
 |
       |                                                                   =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
   500 ++                                                                  =
 |
       |                              O                                    =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[61]:/.tg_load_avg

  4500 ++----------------------*------------------*------------------------=
-+
       *.        *.           +  *..             +  *        .*            =
 |
  4000 ++*..    +  *.     *. +      *.          +    :    .*.  + .*..     *=
.|
  3500 ++      +     *.. +  *         *.*..*.*.*      :  *      *    *. .. =
 *
       |    *.*         *                             : +              *   =
 |
  3000 ++                                              *                   =
 |
  2500 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
  1500 ++                                                                  =
 |
       |                                                                   =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
   500 ++                             O                                    =
 |
       |                                                                   =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[62]:/.tg_load_avg

  4500 ++-----------------------------------------*------------------------=
-+
       *.        *.            *.*..             +  *                      =
 |
  4000 ++*..    +  *.     *. ..     *.          +    :    .*..*. .*..     *=
.|
  3500 ++      +     *.. +  *         *.*..*.*.*      :  *      *    *. .. =
 *
       |    *.*         *                             : +              *   =
 |
  3000 ++                                              *                   =
 |
  2500 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
  1500 ++                                                                  =
 |
       |                                                                   =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
   500 ++                             O                                    =
 |
       |                                                                   =
 |
     0 ++------------------------------------------------------------------=
-+


                       sched_debug.cfs_rq[63]:/.tg_load_avg

  4500 ++-----------------------------------------*------------------------=
-+
       *         *             *.*..             +  *                      =
 |
  4000 ++       + +       *. ..     *.          +    :    .*..*.*.*..     *=
.|
  3500 ++*..   +   *.*.. +  *         *.*..*.*.*      :  *           *. .. =
 *
       |    *.*         *                             : +              *   =
 |
  3000 ++                                              *                   =
 |
  2500 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
  1500 ++                                                                  =
 |
       |                                                                   =
 |
  1000 O+O  O O  O O O  O O O  O O  O   O                                  =
 |
   500 ++                             O                                    =
 |
       |                                                                   =
 |
     0 ++------------------------------------------------------------------=
-+


                             stderr.sh:echo:I/O_error

    1 ++-------------------------------------------------------------------=
-O
      |                                                                    =
 |
      |                                                                    =
 |
  0.8 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  0.6 ++                                                                   =
 |
      |                                                                    =
 |
  0.4 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  0.2 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
    0 O+---O-----O----O-----O----O----O-----O----O----O-----O----O-----O---=
-+


                    sched_debug.cfs_rq[0]:/.runnable_load_avg

  20 ++--------------------------------------------------------------*-----=
-+
     |                                                               :     =
 |
  19 ++                                                              :     =
 |
     |                                                              : :    =
 |
  18 ++                                                             : :    =
 |
     |                                                              : :    =
 |
  17 ++                                                             : :    =
 |
     |                                                             :  :    =
 |
  16 ++                                               *            :  :    =
 |
     |                                                :+           :   :   =
 |
  15 *+     *..*                *      *..*          :  *..        :   :  *=
 |
     |+    +    +             .. +    +    +         :            :    :.. =
+|
  14 ++*..*      *..  *..*   *    *..*      *..     *      *.*..*.*    *   =
 *
     |               +    + +                     ..                       =
 |
  13 ++-------------*------*-------------------*-*-------------------------=
-+


                   sched_debug.cfs_rq[0]:/.utilization_load_avg

  1100 *+------------------------------------------------------------------=
-+
       |                       *.                                          =
 |
  1080 ++                      : *                                        *=
.|
       |:          *          :  :                                  .*    :=
 *
       |:          :      *   :   :                    *          *. :   : =
 |
  1060 ++         ::      :   :   :                   : +         :   :  : =
 |
       | :    *.. : :    : :  :    :      .*.*        :  *.       :   : :  =
 |
  1040 ++:    :  :  :    : : :     :    *.    :      :     *..   :     ::  =
 |
       | *.. :   *  :    : : :      :  +      :     *         *  :     *   =
 |
  1020 ++    :      :   :  : :      *.*        :    :         :  :         =
 |
       |    *        :  *   :                  *   :           : :         =
 |
       |             :..    *                   +  :           ::          =
 |
  1000 ++            *                           +:             :          =
 |
       |                                          *             *          =
 |
   980 ++------------------------------------------------------------------=
-+


                      sched_debug.cfs_rq[0]:/.tg_load_contrib

  250 ++-------------------------------------------------------------------=
-+
      |                                                                   *=
 |
      |                                                                   :=
 |
  200 ++                                                   *             ::=
 |
      |                                          *        + :            : =
:|
      |                                          :       *   :           : =
:|
  150 ++                                        : :      :   :    *      : =
:|
      |                                         : :     :     *   :     :  =
:|
  100 ++*..                                    :  :     :      : : :    :  =
:|
      | :  *           *                       *   :    :      : : :    :  =
:|
      |:    :         : :                      :   :   :        *   :  :   =
 |
   50 ++    :         : :                     :    :   :            :  *   =
 |
      *      :       :   :                    :     : :              :+    =
 |
      |      *..*.*.*    *..*.*..*.*.*..*.*..*      *.*              *     =
 *
    0 ++-------------------------------------------------------------------=
-+


                     sched_debug.cfs_rq[1]:/.runnable_load_avg

    16 ++-----------------------------*------------------------------------=
-+
       |                              :                                    =
 |
  15.5 ++                             :                                    =
 |
       |                             ::                                    =
 |
       |                             : :                                   =
 |
    15 *+     *      *    *          : :     *      *..*.*        *        =
 *
       |:     ::     ::   ::         : :     ::     :     :       :        =
 |
  14.5 ++    :  :   :  : : :        :  :    : :    :      :      : :       =
 |
       | :   :  :   :  : :  :       :  :    :  :   :       :     : :       =
:|
    14 ++*..*    *.*    *   *..*.*..*  :   *   *..*        *..*.*  :   *   =
:|
       |                               :  :                         :  ::  =
:|
       |                                : :                         : : :  =
:|
  13.5 ++                               ::                          : :  ::=
 |
       |                                ::                           :   ::=
 |
    13 ++-------------------------------*----------------------------*----*=
-+


                   sched_debug.cfs_rq[1]:/.utilization_load_avg

  1140 ++------------------------------------------------------------------=
-+
  1120 ++                      *                                           =
 |
       | *                    +:                                           =
 |
  1100 ++::                  +  :                   *                      =
 *
  1080 ++ :   *..           *   :                   ::                     =
 |
       |:  :  :  *   *..   +    :                  : :                     =
:|
  1060 ++  : :   :   :  *.*     :          *.      :  :                    =
:|
  1040 *+   ::    : :            : .*.    +  *.   :   : .*      *.*       :=
 |
  1020 ++   *     : :            *.   *. +     *..*    *  +    +   :   *..*=
 |
       |           :                    *                  *..*    :   :   =
 |
  1000 ++          *                                                : :    =
 |
   980 ++                                                           : :    =
 |
       |                                                             :     =
 |
   960 ++                                                            *     =
 |
   940 ++------------------------------------------------------------------=
-+


                     sched_debug.cfs_rq[2]:/.runnable_load_avg

    16 ++------------------------------------*-----------------------------=
-+
       |                                     :                             =
 |
  15.5 ++                                    :                             =
 |
       |                                    : :                            =
 |
       |                                    : :                            =
 |
    15 ++*                       *    *.*   : :   *    *                  *=
.*
       | ::                      :    :  :  : :  : :  ::                 : =
 |
  14.5 ++  :                    : :   :   ::   : : :  ::                 : =
 |
       |:  :                    : :  :    ::   ::   ::  :               :  =
 |
    14 *+   *      *.*    *.*..*  :  :     *   *    *   :  *    *.*    *   =
 |
       |    :      :  :   :        : :                  :  ::   :  :   :   =
 |
       |     :    :   :  :         : :                  : : :  :   :  :    =
 |
  13.5 ++    :    :    : :         ::                    ::  : :    : :    =
 |
       |      :  :     ::           :                    :   ::     ::     =
 |
    13 ++-----*--*------*-----------*--------------------*----*------*-----=
-+


                   sched_debug.cfs_rq[2]:/.utilization_load_avg

  1100 ++------------------------------------------------------------------=
-+
       |                         *                *                        =
 |
  1080 ++                       + :              ::        *               =
 |
       |                       *   :             : :       ::              =
 |
  1060 ++  .*                 :    :         *  :  :      : :             *=
.|
       | *.  :           .*   :     *   *.. + + :  :      :  :    *     .. =
 *
  1040 ++    :          *  : :       :  :  *   *    :     :  :    ::   *   =
 |
       |:     :        :   : :       : :            *..*.:    :  : :   :   =
 |
  1020 *+     *        :    *         ::                 *    *  :  : :    =
 |
       |       :      :               *                        +:   : :    =
 |
  1000 ++      :   *. :                                         *    :     =
 |
       |        : :  *                                               *     =
 |
   980 ++       : :                                                        =
 |
       |         *                                                         =
 |
   960 ++------------------------------------------------------------------=
-+


                    sched_debug.cfs_rq[3]:/.runnable_load_avg

  17 ++--------*------------------------------------------------*----------=
-+
     |         :                                                :          =
 |
     |        ::                                               : :         =
 |
  16 ++       : :                                              : :         =
 |
     |        : :                                              : :         =
 |
     |       :  :                                             :  :         =
 |
  15 *+      :  :               *      *..     *              :   :        =
 |
     |+     :   :             ..:     +      .. +            :    :        =
 |
  14 ++*    *   :   *.*..*   *   :   *    *.*    *..*.*.*..*.*    *        =
 *
     |  +  :     : +      : :    :  +                              :       =
:|
     |   + :     :+       : :     :+                               :       =
:|
  13 ++   *      *         *      *                                 :  *..*=
 |
     |                                                              : :    =
 |
     |                                                               ::    =
 |
  12 ++--------------------------------------------------------------*-----=
-+


                   sched_debug.cfs_rq[3]:/.utilization_load_avg

  1100 ++---------------*--------------------------------------------------=
-+
       |                :                                                  =
 |
  1080 ++        *     : :                                                 =
 |
       *       ..:     : :                                      *          =
 |
  1060 ++     *  :     : :       *             *..              ::         =
 |
       |:     :   :   :  :      +:    *.      :                : :         =
 |
  1040 ++*   :    :   :   :    *  :   : *..*. :   *       .*.. :  :       *=
 |
       |  :  :    :   :   :  ..   :  :       *     +  .*.*    :   *     .. =
+|
  1020 ++ :  :    :  :    *.*      : :              *.        *   :    *   =
 *
       |   : :     : *             : :                             :   :   =
 |
  1000 ++  ::      :+               :                              :  :    =
 |
       |    *      *                *                               : :    =
 |
   980 ++                                                           : :    =
 |
       |                                                             :     =
 |
   960 ++------------------------------------------------------------*-----=
-+


                    sched_debug.cfs_rq[4]:/.runnable_load_avg

  19 ++-----------------------------------------------------------*--------=
-+
     |                                                            :        =
 |
  18 ++                                                           ::       =
 |
     |                                                            ::       =
 |
     |                                                           : :       =
 |
  17 ++                                                          : :       =
 |
     |                                                           :  :      =
 |
  16 ++          *                        *                      :  :      =
 |
     |           ::                      ::                      :  :      =
 |
  15 ++         : :             *        : :                     :  :      =
 *
     |          :  :           ::       :  :                    :    :     =
:|
     |         :   :           : :      :  :                    :    :     =
:|
  14 *+*..*.*..*    *.*..*.*  :  :   *.*   :   *.*..    *..*.*..*    *.*..*=
 |
     |                      + :   :..       :..        +                   =
 |
  13 ++----------------------*----*---------*-------*-*--------------------=
-+


                   sched_debug.cfs_rq[4]:/.utilization_load_avg

  1140 ++----------*-------------------------------------------------------=
-+
       |           :                                                       =
 |
  1120 ++          :                                                       =
 |
  1100 ++         : :                                             *        =
 |
       |      *   : :                                             :        =
 |
  1080 ++     ::  : :                                             ::   *   =
 |
       |     :  : : :       *..            *                     : :   ::  =
 |
  1060 ++    :  ::  :      :              ::                     : :  :  : =
 *
       |     :   *  :   *. :   *.*..      : :  *..       *       :  : :  : =
+|
  1040 *+*.. :       : :  *          .*. :  :  :  *      :+      :  : :   *=
 |
  1020 ++   :        : :            *   *   : :    +    :  *..*  :  : :    =
 |
       |    *        ::                      ::     *.. :      : :   :     =
 |
  1000 ++            *                       *         *       ::    *     =
 |
       |                                                        :          =
 |
   980 ++-------------------------------------------------------*----------=
-+


                     sched_debug.cfs_rq[5]:/.runnable_load_avg

    17 ++---------------*-----------*--------------------------------------=
-+
       |                :           :                                      =
 |
  16.5 ++              ::          : :                                     =
 |
    16 *+              : :         : :                                     =
 |
       |              :  :         : :                                     =
 |
  15.5 ++             :  :         : :                                     =
 |
       |:            :   :        :   :                                    =
 |
    15 ++        *.*.*   :        :   *.*           *           *          =
 |
       |:       +         :       :      +         : +         ::          =
 |
  14.5 ++      +          :      :        +        :  +        : :         =
 |
    14 ++   *.*           *.*..*.*         *.*.*..*    *.*.*..*  :     *..*=
.*
       |:  :                                                     :     :   =
 |
  13.5 ++: :                                                     :    :    =
 |
       | ::                                                       :   :    =
 |
    13 ++*--------------------------------------------------------*--*-----=
-+


                   sched_debug.cfs_rq[5]:/.utilization_load_avg

  1120 ++---------------------------*--------------------------------------=
-+
       |                            ::                                     =
 |
  1100 *+                          : :                                    *=
 |
  1080 ++     *..       *          :  :                                  +:=
 |
       |:     :       .. :         :  *.*                               +  =
:|
  1060 ++    :   *   *   :    .*  :      :   *         *               *   =
:|
  1040 ++    :    : :     *.*.  : :       : : +      .. + .*..         :   =
:|
       |:   *     : :           ::        : :  *..*.*    *    *.*      :   =
 |
  1020 ++:..       *             *         *                     :    :    =
 *
  1000 ++*                                                       :    :    =
 |
       |                                                          *   :    =
 |
   980 ++                                                          +  :    =
 |
   960 ++                                                           +:     =
 |
       |                                                             *     =
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
  17 ++                                         :  :         *             =
 |
     |                                          :  :         ::            =
 |
  16 ++                                         :  :         ::            =
 |
     |                                          :  :        :  :           =
 |
  15 ++   *    *                  *..*    *    :    :   *   :  :           =
 *
     |  .. + .. +                +    + .. +   :    :  + :  :   :          =
+|
  14 *+*    *    *..*.*..*.*.*..*      *    *..*    *.*   : :   *    *.*..*=
 |
     |                                                    ::     + ..      =
 |
  13 ++----------------------------------------------------*------*--------=
-+


                   sched_debug.cfs_rq[6]:/.utilization_load_avg

  1160 ++------------------------------------------------------------------=
-+
       |                                          *                        =
 |
  1140 ++                                         :                        =
 |
  1120 ++                                        : :                       =
 |
       |                                         : :                       =
 |
  1100 ++   *                  *    *            : :   *                   =
 *
  1080 ++  : :                ::    :+      .*  :  :  + :                  =
 |
       |   : :       *..      : :  :  *    *  : :   :+  :     *            =
 |
  1060 ++ :   *..   :        :  :  :   :  :   : :   *    :   : +           =
:|
  1040 ++ :      *. :   *   *   : :    :  :    :         *   :  *          =
:|
       *.*         *     + +     ::     ::     *          + :    +    .*   =
:|
  1020 ++                 *      *      *                  *      *..*  :  =
:|
  1000 ++                                                                ::=
 |
       |                                                                 ::=
 |
   980 ++-----------------------------------------------------------------*=
-+


                    sched_debug.cfs_rq[7]:/.runnable_load_avg

  18 ++-------------*------------------------------------------------------=
-+
     |              :                                                      =
 |
     |             ::                                                      =
 |
  17 ++            : :                                                     =
 *
     |             : :                                                     =
 |
     |             : :                                                     =
 |
  16 *+           :  :                              *                      =
:|
     |            :  :                            ..:                      =
:|
  15 ++           :  :   *.*.*..*    *    *      *   :       *             =
:|
     |:           :   : +        :  + :  +:     :    :      : +            =
:|
     | :         :    :+         : +  : +  :    :     :     :  +           =
:|
  14 ++*..*.*..*.*    *           *    *   :   *      *    *    *      *   =
:|
     |                                     :  +        :  +      :    : + :=
 |
     |                                      :+         : +       :    :  +:=
 |
  13 ++-------------------------------------*-----------*---------*--*----*=
-+


                   sched_debug.cfs_rq[7]:/.utilization_load_avg

  1120 ++------------------------------------------------------------------=
-+
       *                                                                   =
 *
  1100 ++                                                                  =
 |
       |             *                                                     =
 |
  1080 ++           : :   *                                                =
:|
       |:           : :   :                       *.                       =
:|
  1060 ++        *.*   : : :               *     :  *..                    =
:|
       |:      ..      : : :    .*       ..:     :                         =
:|
  1040 ++   *.*         :  :   *  :    .*   :   :      *     .*            =
:|
       |:  :            *   :..   :   *     :   :       :  *. :           :=
 |
  1020 ++: :                *      : :      :  *        : +    :  *..     :=
 |
       | ::                        : :      : :          *     : :    .*..*=
 |
  1000 ++*                          *        ::                 ::   *     =
 |
       |                                     *                  *          =
 |
   980 ++------------------------------------------------------------------=
-+


                     sched_debug.cfs_rq[8]:/.runnable_load_avg

    16 ++---------------*-------------*----------------*-------------------=
-+
       |                :             :                :                   =
 |
  15.5 ++              ::            : :              : :                  =
 |
    15 ++        *     ::      *     : :              : :                 *=
 |
       |        : :   :  :    : :    : :              : :                : =
:|
  14.5 ++       : :   :  :    : :    : :              : :                : =
:|
       |       :   : :   :   :   :  :   :            :   :              :  =
 |
    14 ++   *.*    *.*   :  *    *..*   *         *  :   *.*..*.*.*    *   =
 *
       |   +             :  :            +       + : :             +  :    =
 |
  13.5 ++ +              : :              +     +  ::               + :    =
 |
    13 ++*               : :               *.*.*    *                *     =
 |
       | :                ::                                               =
 |
  12.5 ++                 ::                                               =
 |
       |:                 :                                                =
 |
    12 *+-----------------*------------------------------------------------=
-+


                   sched_debug.cfs_rq[8]:/.utilization_load_avg

  1180 ++------------------------------------------------------------------=
-+
  1160 ++               *                                                  =
 |
       |                :                                                  =
 |
  1140 ++              ::                                                  =
 |
  1120 ++              : :       *                                         =
 |
       |         *     : :       ::                                        =
 |
  1100 ++       +:    :  :      : :                                       *=
 |
  1080 ++      +  :   :  :      :  :                          *          : =
:|
  1060 ++    .*   :  :   :     *   :    *         *    *     + +         : =
:|
       |    *     :  *   :    +     *. + +      ..:    :+   +   *       :  =
 |
  1040 ++ ..       :+     :  +        *   +    *   :  :  *.*     :     *   =
 *
  1020 *+*         *      :.*              *. +    :  :          :    +    =
 |
       |                  *                  *     : :            *..*     =
 |
  1000 ++                                           ::                     =
 |
   980 ++-------------------------------------------*----------------------=
-+


                     sched_debug.cfs_rq[9]:/.runnable_load_avg

    16 ++*-----------------------------------------------------------------=
-+
       | :                                                                 =
 |
  15.5 ++:                                                                 =
 |
       |: :                                                                =
 |
       |: :                                                                =
 |
    15 ++ :                                       *           *            =
 |
       |: :                                      : :          ::           =
 |
  14.5 ++  :                                     : :         : :           =
 |
       |   :                                    :   :        :  :          =
 |
    14 *+  :  *..*   *..*.*    *    *   *..*.*.*    *..*.*   :  *.*    *..*=
 |
       |   :  :  :   :    :   ::   ::   :                :  :      :   :  :=
 |
       |   : :    : :      :  : :  : : :                  : :      :  :    =
:|
  13.5 ++   ::    : :      : :  : :  : :                  : :       : :    =
:|
       |    :      :        ::   ::   :                    :        ::     =
 |
    13 ++---*------*--------*----*----*--------------------*---------*-----=
-*


                   sched_debug.cfs_rq[9]:/.utilization_load_avg

  1140 ++------------------------------------------------------------------=
-+
  1120 ++                                                         *        =
 |
       | *                                                       ::       *=
 |
  1100 ++:                                                       ::      +:=
 |
  1080 ++ :                                              *    *.*  :    +  =
:|
       |: :                                             + :  :     :   *   =
:|
  1060 ++ :             *.     *.  .*.        .*..*.  .*  :  :     :   :   =
:|
  1040 ++  :  *..*     +  *   :  *.   *.*..*.*      *.     ::      :   :   =
:|
  1020 *+  :  :   :   +    :  :                            *        : :    =
 |
       |   : :    : .*     : :                                      : :    =
 |
  1000 ++   ::     *        ::                                      : :    =
 *
   980 ++   *               *                                       : :    =
 |
       |                                                             :     =
 |
   960 ++                                                            :     =
 |
   940 ++------------------------------------------------------------*-----=
-+


                   sched_debug.cfs_rq[10]:/.runnable_load_avg

  24 ++------------------------------------------------------*-------------=
-+
     |                                                       :             =
 |
  22 ++                                                      ::            =
 |
     |                                                       ::            =
 |
     |                                                      : :            =
 |
  20 ++                                                     : :      *     =
 |
     |                                                      :  :     :     =
 |
  18 ++                                                     :  :    : :    =
 |
     |                                 *                    :  :    : :    =
 |
  16 ++        *                       ::                   :  :   :   :   =
 |
     *        : :        *            :  :              *..:    :  :   *.. =
 |
     |+       : :      .. :           :  :             +   :    : :        =
 |
  14 ++*..*. :   *.. .*   : .*..*.*..:    *.*..*.*..*.*    *    *.*       *=
.|
     |      *       *      *         *                                     =
 *
  12 ++--------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[10]:/.utilization_load_avg

  1160 ++------------------------------------------------------------------=
-+
  1140 ++                                                     *            =
 |
       |         *                                            :            =
 |
  1120 ++        ::                                          : :           =
 |
  1100 ++       : :                                          : :           =
 |
       *        :  :                                     *   : :           =
 |
  1080 ++       :  *             *..*   *               +:  :   :          =
 |
  1060 ++      :    :           +    :  :+   *.*..    .*  : :   *      *..*=
.|
  1040 ++:     :    :         .*     : :  + +      .*.    : :    :     :   =
 *
       | *    :      *..   .*.        ::   *      *        :     :    :    =
 |
  1020 ++ +   *         *.*           *                    *      :   :    =
 |
  1000 ++  + +                                                    *.. :    =
 |
       |    *                                                        :     =
 |
   980 ++                                                            *     =
 |
   960 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[11]:/.runnable_load_avg

  24 ++--------------------------------------------------------------------=
-+
     |                                                  *                  =
 |
  22 ++                                                 ::                 =
 |
     |                                                  ::                 =
 |
     |                                                 :  :                =
 |
  20 ++                                                :  :                =
 |
     |                                                 :   :               =
 |
  18 ++                                                :   *               =
 |
     |                          *                      :   :               =
 |
  16 *+                    *   : :                     :    :              =
 |
     |:                    ::  : :                  * :     :     *       *=
 |
     |:                   : : :   :               .. +:      :   + +    .. =
:|
  14 ++*..    .*.*..*.*.. :  *    *..      .*..*.*    *      *..*   + .*   =
:|
     |    *.*.           *           *.*..*                          *     =
 *
  12 ++--------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[11]:/.utilization_load_avg

  1250 ++------------------------------------------------*-----------------=
-+
       |                                                 :                 =
 |
  1200 ++                                                ::                =
 |
       |                                                : :                =
 |
       |                                                : :                =
 |
  1150 ++                                         *.*   : :                =
 |
       |                                         +   :  :  :               =
 |
  1100 ++                                       +    :  :  *              *=
 |
       |                    *.. .*..          .*      : :   +           .. =
+|
  1050 *+         .*.  .*. +   *            .*        ::     +   .*    *   =
 *
       | *..    .*   *.   *         *      *           :      *.*  +  :    =
 |
       |     .*.                     +   ..            *            + :    =
 |
  1000 ++   *                         *.*                            *     =
 |
       |                                                                   =
 |
   950 ++------------------------------------------------------------------=
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
     *.*..*.*..*    *.*..*.*.*..*.*..*.*..*.*..*.*..*.*.*..*.*..*.*..*.*..*=
.|
  10 ++--------------------------------------------------------------------=
-*


                   sched_debug.cfs_rq[12]:/.utilization_load_avg

  1120 ++----------*-------------------------------------------------------=
-+
       |           ::                                           *          =
 |
  1100 ++          ::                   *                       :          =
 |
  1080 ++         :  *                  :                      : :         =
 |
       |          :   +   *            : :          *          : :         =
 |
  1060 ++*..      :    + + +  .*       : :         : +     *..:  :         =
 |
  1040 *+   *     :     *   *.  +  .*  :  :        :  +   +   *  :     *.. =
 |
       |     :   :               *.  : :  :  *.*..*    *.*        :    :   =
 |
  1020 ++    :   :                   ::    :+                     :   :   *=
 |
  1000 ++     : .*                    *    *                      *   :    =
+|
       |      *.                                                   :  :    =
 *
   980 ++                                                           : :    =
 |
   960 ++                                                           ::     =
 |
       |                                                             *     =
 |
   940 ++------------------------------------------------------------------=
-+


                    sched_debug.cfs_rq[13]:/.runnable_load_avg

    15 ++-------------------*-------*-*------------------------------------=
-+
       |                    :       : :                                    =
 |
       |                   : :     :   :                                   =
 |
  14.5 ++                  : :     :   :                                   =
 |
       |                   :  :   :    :                                   =
 |
       |                   :  :   :    :                                   =
 |
       |                  :    : :      :                                  =
 |
    14 ++   *.*..*      *.*    *.*      *    *.*..*.*..*.*.*..*.*.*    *..*=
.*
       |    :    :      :               :    :                    :    :   =
 |
       |   :      :    :                 :  :                      :  :    =
 |
  13.5 ++  :      :    :                 :  :                      :  :    =
 |
       |  :       :   :                   : :                       : :    =
 |
       |  :       :   :                   : :                       : :    =
 |
       | :         : :                     :                         :     =
 |
    13 *+*---------*-*---------------------*-------------------------*-----=
-+


                   sched_debug.cfs_rq[13]:/.utilization_load_avg

  1180 ++------------------------------------------------------------------=
-+
  1160 ++                           *                                      =
 |
       |                           ::                                      =
 |
  1140 ++                          ::                                      =
 |
  1120 ++                         :  :                                     =
 *
  1100 ++     *                  *   :                                     =
:|
  1080 ++     ::            *    :   :                                     =
:|
       |     :  :          : :  :    :            *                       *=
 |
  1060 ++    :  :          :  : :     :          + +       *..    *     .. =
 |
  1040 *+*..:    *   *.. .*   ::      :.*       +   *..   :   *. + +   *   =
 |
  1020 ++   *     :  :  *      *      *  :   *.*       *. :     *   + +    =
 |
  1000 ++         : :                     : :            *           *     =
 |
       |           ::                     : :                              =
 |
   980 ++          *                       *                               =
 |
   960 ++------------------------------------------------------------------=
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
  16 ++                :    :              : :               *..           =
 |
     |                 :    :              :  :             :   *.*    *.. =
 |
     |                :      :            :   :             :      +  :    =
 |
  14 ++*..*.*..*.*..*.*      *..*.*.. .*..*    :.*..*. .*..*        + :   *=
.|
     *                               *         *      *              *     =
 *
  12 ++--------------------------------------------------------------------=
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
  1100 ++                :  :             :  :      *         *.*.*        =
 |
       |                :   *..    .*     :   :    : :       +    :        =
 |
  1050 ++              .*      *.*.  :   :    :    :  :  *. +      :   *.. =
 |
       |.*..*.*.. .*.*.              : .*     :   *   : +  *       :   :  *=
.|
  1000 *+        *                    *        :..     *            : :    =
 *
       |                                       *                    : :    =
 |
       |                                                             :     =
 |
   950 ++                                                            *     =
 |
       |                                                                   =
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
    15 ++ :  :       *      *                       *         *            =
 |
       |  :  :       ::     ::                      ::        :            =
 |
  14.5 ++ :  :      :  :   :  :                    :  :      ::            =
 |
       | :   :      :  :   :  :                    :  :      : :           =
 |
    14 *+*   :     *    *.*    *.*..*.*.*..*   *..*    *     : :  *    *..*=
.*
       |     :     :                       :   :       :    :  :  ::   :   =
 |
       |      :   :                         : :         :   :  : : :  :    =
 |
  13.5 ++     :   :                         : :         :   :   ::  : :    =
 |
       |      :  :                           :           : :    :   ::     =
 |
    13 ++-----*--*---------------------------*-----------*-*----*----*-----=
-+


                   sched_debug.cfs_rq[15]:/.utilization_load_avg

  1100 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  1080 ++            *                                                     =
 |
       |             ::                                       *            =
 |
       | *          : :          *               .*.         ::            =
 |
  1060 ++ :         :  :    *    :+     *      *.   *        : :           =
 *
       *  :         :  :    ::  :  +    ::    +     :       :  :           =
 |
  1040 ++  :        :   :  :  : :   *  :  :  *       :      :  :           =
:|
       |   :       :    *  :  ::     : :  : +        :    .*   :  *        =
:|
  1020 ++   :     .*     : :   *     : :   *          :  *      :: :     .*=
 |
       |    *.*..*       : :          :               :  :      :: :   *.  =
 |
       |                  :           *               : :       *   :  :   =
 |
  1000 ++                 *                            ::           : :    =
 |
       |                                               *             ::    =
 |
   980 ++------------------------------------------------------------*-----=
-+


                   sched_debug.cfs_rq[16]:/.runnable_load_avg

  21 ++-----------------------------------------------------------*--------=
-+
     |                                                            :        =
 |
  20 ++                                                           :        =
 |
  19 ++                                                          : :       =
 |
     |                                                           : :       =
 |
  18 ++                                                          : :       =
 |
     |                                                           : :       =
 |
  17 ++                                                          :  :      =
 |
     |                                                          :   :      =
 |
  16 ++                                                         :   :      =
 |
  15 ++        *      *           *..                           *   :     *=
 |
     |       .. +    + :         +                            ..    :   .. =
+|
  14 *+*..  *    *..*   :  *.*..*    *.*..*.*..*.*..*.*      *       : *   =
 *
     |     +            : +                            +    +        :+    =
 |
  13 ++---*--------------*------------------------------*--*---------*-----=
-+


                   sched_debug.cfs_rq[16]:/.utilization_load_avg

  1140 ++------------------------------------------------------------------=
-+
       |                *                                         *        =
 |
  1120 ++               :                                         :        =
 |
  1100 ++              : :                                        ::       =
 |
       |               : :                                        ::       =
 |
  1080 ++              : :                                       : :       =
 |
       |         *    :   :         *.*      *                   :  :      =
 |
  1060 ++       : :   :   *    *   :   :    + :                  :  :     *=
 |
       |.*      : :  :     :  + :  :   :   *  :                  :  :    + =
:|
  1040 *+ +    :   *.*     : +  : :     :..    *.. .*..*      *  :   :  +  =
:|
  1020 ++  + .*             *    ::     *         *     +   .. : :   *.*   =
 *
       |    *                    *                       *.*   ::          =
 |
  1000 ++                                                       :          =
 |
       |                                                        *          =
 |
   980 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[17]:/.runnable_load_avg

  24 ++------------------------------------------*-------------------------=
-+
     |                                           :                     *   =
 |
  22 ++                                          :                     :   =
 |
     |                                           ::                    ::  =
 |
     |                                          : :                    ::  =
 |
  20 ++                                         : :                   : :  =
 |
     |                                          : :                   : :  =
 |
  18 ++                              *          :  :                  :  : =
 |
     |                               :          :  :                  :  : =
 |
  16 ++                             : :         :  :                  :  : =
 |
     |                   *          : :        :   :  *.*..           :  : =
 |
     |                  + +        :   :       :    ::               :    :=
 |
  14 ++*..    .*.*..   +   *.*..*. :   *..*.*..:    ::     *.*..*.*..:    *=
.|
     *     .*.      *.*           *            *    *                :     =
 *
  12 ++---*----------------------------------------------------------*-----=
-+


                   sched_debug.cfs_rq[17]:/.utilization_load_avg

  1250 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  1200 ++                                         *                        =
 |
       |                                          :                    *   =
 |
  1150 ++                                        : :                   ::  =
 |
       |                  *           *          : :                   ::  =
 |
  1100 ++                 :+          ::         : :                  :  : =
 |
       |                 :  *..      : :        :  :     *.           :  : =
 |
  1050 ++                :     *.*.. :  :       :   :   +  *..    *   :   :=
 |
       |.*..  *.. .*.   :           :   *..*.*.:    *..*      *  : :  :   *=
.*
  1000 *+    +   *   *..*           *          *               + : :  :    =
 |
       |    *                                                   *   ::     =
 |
   950 ++                                                           ::     =
 |
       |                                                             *     =
 |
   900 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[18]:/.runnable_load_avg

  21 ++--------------------------------------------------------------------=
-*
     |                                                                     =
 |
  20 ++                                                                    =
 |
  19 ++                                                                    =
 |
     |                                                                     =
:|
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
  15 ++          *    *..                      *                          :=
 |
     |          + :   :                      .. :                         :=
 |
  14 *+*..*.*..*   : :   *.*.*..*.*..*.*..  *   :   *.*    *.*..*      *..*=
 |
     |             : :                     +     :..   + ..      +    +    =
 |
  13 ++-------------*---------------------*------*------*---------*--*-----=
-+


                   sched_debug.cfs_rq[18]:/.utilization_load_avg

  1140 ++------------------------------------------------------------------=
-+
       |                                                                   =
 *
  1120 ++                                                                  =
 |
  1100 ++                                                                  =
:|
       |                                       *..                         =
:|
  1080 *+                     .*.*            +        *                   =
:|
  1060 ++*..    .*         .*.    :          *    *   ::     .*           :=
 |
       |    *.*.  :       *        :        :      :  : :  *.  :         .*=
 |
  1040 ++         :      :         : .*.*.. :      : :  :  :   :       *.  =
 |
  1020 ++          *.*.. :          *      *        ::  : :     :      :   =
 |
       |                *                           *   : :     *.*   :    =
 |
  1000 ++                                                :         +  :    =
 |
   980 ++                                                *          +:     =
 |
       |                                                             *     =
 |
   960 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[19]:/.runnable_load_avg

  17 ++----------------------*---------------------------------------------=
-+
     |                      ::                                             =
 |
     |                      : :                                            =
 |
  16 ++                    *  :                                            =
 |
     |                     :  :                                            =
 |
     |                    :   :                                            =
 |
  15 ++*..       *..      :    :                      *                   *=
 |
     |+         +        :     :                     + +                ..:=
 |
  14 *+   *.*..*    *.*..*     :  *..*    *.*..*    *   *..*.*..*.*    *   =
:|
     |                         : :    :  +      :  +               :   :   =
:|
     |                          ::    : +       : +                :  :    =
 |
  13 ++                         *      *         *                  : :    =
 *
     |                                                              : :    =
 |
     |                                                               :     =
 |
  12 ++--------------------------------------------------------------*-----=
-+


                   sched_debug.cfs_rq[19]:/.utilization_load_avg

  1100 ++------------------------------------------------------------------=
-+
       |                    *                                              =
 |
  1080 ++                  : :                                            *=
 |
       |    *       .*     : :        *                        .*        ::=
 |
  1060 *+  + +     *  :   *   :      +:                *.*    *  :       ::=
 |
       |+ +   *.. :   :   :   :     *  :              +   + ..   :      :  =
:|
  1040 ++*        :    : :     :    :  :   *.*.      +     *      :     :  =
:|
       |         *     : :     *   :   :  :    *    *             *    *   =
:|
  1020 ++               :      :   :   :  :     :   :              :   :   =
:|
       |                *       : :     ::      :  :               :  :    =
:|
  1000 ++                       : :     *        : :                : :    =
 |
       |                         :               ::                 : :    =
 |
   980 ++                        *                *                  :     =
 *
       |                                                             *     =
 |
   960 ++------------------------------------------------------------------=
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
  15 ++        *.*..*    *      :   :                   *..*      *    *   =
 *
     |        :      + .. +     :   :                  +    :     ::   ::  =
 |
  14 *+   *   :       *    *    *    : *..  *..  *..  *     :    : :  :  : =
:|
     |+ .. + :              + ..     :+    +    +    +       :   :  : :  : =
:|
  13 ++*    *                *       *    *    *    *        *..*   : :   *=
 |
     |                                                               :     =
 |
  12 ++--------------------------------------------------------------*-----=
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
  1100 ++          *.     :        : :                 *.              *   =
 |
       |          +  *.. : :      :  :                +  *        *    ::  =
 *
  1050 *+        *       : :      :   :    *.*    *. +    +      ::    : : =
:|
       | *..*. ..       *  :     :    *. ..   :  +  *      *..   : :  :  : =
:|
  1000 ++     *             :   .*      *     : +              .*  :  :   *=
 |
       |                    *..*               *              *     : :    =
 |
       |                                                            : :    =
 |
   950 ++                                                            :     =
 |
       |                                                             *     =
 |
   900 ++------------------------------------------------------------------=
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
     |                  : :                                                =
 |
  20 ++                 : :                                                =
 |
     |                 :  :                                                =
 |
  18 ++                :  :                                                =
 |
     |                 :  :                                                =
 |
  16 ++               :    :                     *..       *               =
 |
     |                *    :                    +    .*. .. +              =
 |
  14 *+*..*.*..*.*.. +     *.*.. .*..    .*.*..*    *   *    *..*.    .*..*=
.*
     |              *           *     .*.                         *..*     =
 |
  12 ++------------------------------*-------------------------------------=
-+


                   sched_debug.cfs_rq[21]:/.utilization_load_avg

  1120 ++-----------------*-----------------------*------------------------=
-+
       |                  :                       :        *               =
 |
  1100 *+                : :                     : :       :               =
 |
  1080 ++                : :                     : :      : :              =
 |
       |:                : :                     : :      : :          *   =
 |
  1060 ++               :   :    *              :   :    :   :         ::  =
 |
       |:     *.. .*    *   *    :+        *.*  :   *..*.*   :         ::  =
 |
  1040 ++:    :  *  :  +     :  :  +       :  +:              :  .*   :  : =
 |
       | *.. :      : +      :  :   *     :    *              *.*  :  :  : =
 |
  1020 ++    :       *        : :    :    :                        :  :   *=
 |
  1000 ++   *                 ::     :   :                          : :    =
+|
       |                       *      :  :                          ::     =
 *
   980 ++                             *.:                            :     =
 |
       |                                *                            *     =
 |
   960 ++------------------------------------------------------------------=
-+


                    sched_debug.cfs_rq[22]:/.runnable_load_avg

    17 ++-------------------*----------------------------------------------=
-+
       |                    :                                              =
 |
  16.5 ++                  : :                                             =
 |
    16 ++                  : :                           *                 =
 |
       |                   : :                           :                 =
 |
  15.5 ++                  :  :                         : :                =
 |
       |                  :   :                         : :                =
 |
    15 ++                 *   :                         : :       *        =
 |
       |                 :    :                         : :      : +       =
 |
  14.5 ++                :     :                       :   :     :  +      =
 |
    14 *+*..*.*..*.*.*..*      *.*         *.*.*..*.*..*   *    *    *    *=
.*
       |                          :       :                 :   :     :  : =
 |
  13.5 ++                          :      :                  : :      :  : =
 |
       |                           :     :                   : :       ::  =
 |
    13 ++---------------------------*-*-*---------------------*--------*---=
-+


                   sched_debug.cfs_rq[22]:/.utilization_load_avg

  1160 ++------------------------------------------------------------------=
-+
       |                                                 *                 =
 |
  1140 ++                                                :                 =
 |
  1120 ++                   *                            :                 =
 |
       |                    :                           : :                =
 |
  1100 ++                  : :                          : :       *        =
 |
  1080 ++                  : :                          : :      +:        =
 |
       |             *..  *   :       *      *          : :     *  :       =
 |
  1060 ++           +    +    :       :+     ::        :  :     :  :       =
 |
  1040 *+*..*      *    *      :     :  *   : :  .*.   :   :   :   :       =
 |
       |     :    :            *     :   +  :  *.   *..*   :   :    :  *..*=
.*
  1020 ++    :    :             :   *     +:               *.. :    :  :   =
 |
  1000 ++     *..*              : ..       *                  :     : :    =
 |
       |                         *                            *      ::    =
 |
   980 ++------------------------------------------------------------*-----=
-+


                    sched_debug.cfs_rq[23]:/.runnable_load_avg

    17 ++--------------------------------------------------------------*---=
-+
       |                                                               :   =
 |
  16.5 ++                                                              ::  =
 |
    16 *+                                                              ::  =
 |
       |                                                              :  : =
 |
  15.5 ++                                                             :  : =
 |
       |:                                                             :   :=
 |
    15 ++   *             *.*              *                          :   *=
 |
       |:  + :           :  :             +:                          :    =
:|
  14.5 ++:+  :           :   :           +  :                         :    =
:|
    14 ++*    *..*.*.*..*    :   *..*.*.*   :  *..*    *.*    *   *   :    =
 *
       |                      :  :          :  :   :  :   :  : :  :: :     =
 |
  13.5 ++                     : :           : :    :  :   :  : : :  ::     =
 |
       |                       ::            ::     ::     ::   ::  ::     =
 |
    13 ++----------------------*-------------*------*------*----*----*-----=
-+


                   sched_debug.cfs_rq[23]:/.utilization_load_avg

  1100 ++------------------------------------------------------------------=
-+
  1090 ++     *           *                                                =
 |
       *      :           ::                                               =
 |
  1080 ++    : :          ::                                               =
 |
  1070 ++    : :         :  *                                              =
 |
  1060 ++*.. :  :        :  :              *                          .*..*=
 |
  1050 ++   :   :        :   :            ::           *      *      *     =
:|
       |    *   :        :   :   *        : :    .*   ::     +:    ..      =
:|
  1040 ++        :.*.   :     :  ::      :  :  *.  :  : :   +  :  *        =
 *
  1030 ++        *   *..*     : :  :     :  :  :   : :  :  *   :  :        =
 |
  1020 ++                     : :  : .*.*   : :     *   :  :   : :         =
 |
  1010 ++                      :    *        ::         : :     ::         =
 |
       |                       *             :           ::     *          =
 |
  1000 ++                                    *           *                 =
 |
   990 ++------------------------------------------------------------------=
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
  17 ++    :  :                                                 *          =
 |
     |     :  :                                                 :          =
 |
  16 ++   :   :                                                : :         =
 |
     |    :    :                                               : :         =
 |
  15 ++   *    *    *.*..                               *..   :  :         =
 |
     |  ..      + ..                                    :     :   :        =
 |
  14 ++*         *       *.*.*..*.*..  *..  *..*.*..*  :   *.*    *..  *..*=
.*
     |+                               +    +         + :              +    =
 |
  13 *+------------------------------*----*-----------*--------------*-----=
-+


                   sched_debug.cfs_rq[24]:/.utilization_load_avg

  1140 ++-----*------------------------------------------------------------=
-+
       |      ::                                                           =
 |
  1120 ++    : :   *                                                       =
 |
  1100 ++    :  :  :             *             *                           =
 |
       |     :  : : :            :             :         *      *          =
 |
  1080 ++   :    :: :            ::           : :        ::     :          =
 |
       |    *    *  :   *       : :           : :        ::    : :         =
 |
  1060 ++  :        :  + + .*   :  :         :   :      :  :   : :         =
 |
       |   :         :+   *  :  :  :         *   :      :  *..:  :         =
 |
  1040 ++ :          *        : :   :       :     :.*   :     *  :        *=
.*
  1020 ++ :                   ::    *   *.. :     *  :  :         :     .. =
 |
       | *                     *     : :   *         :  :         *    *   =
 |
  1000 ++                            : :              ::           +  :    =
 |
       *                              *               ::            + :    =
 |
   980 ++----------------------------------------------*-------------*-----=
-+


                    sched_debug.cfs_rq[25]:/.runnable_load_avg

    15 ++---------------------------*------*-*------*------------------*---=
-*
       |                            :      : :      :                  :   =
 |
       |                           ::     :  :     : :                 ::  =
:|
  14.5 ++                          ::     :  :     : :                 ::  =
:|
       |                          :  :   :    :    :  :               :  : =
:|
       |                          :  :   :    :    :  :               :  : =
:|
       |                         :   :  :     :   :    :              :   :=
 |
    14 *+*..*.*..*.*.*..*   *..*.*   :  *     :   *    *.*    *.*.*   :   *=
 |
       |                :   :        :  :     :   :      :    :   :   :    =
 |
       |                 : :         : :      :  :        :  :     :  :    =
 |
  13.5 ++                : :         : :      :  :        :  :     :  :    =
 |
       |                 : :          ::       ::         : :       ::     =
 |
       |                 : :          ::       ::         : :       ::     =
 |
       |                  :           :        :           :         :     =
 |
    13 ++-----------------*-----------*--------*-----------*---------*-----=
-+


                   sched_debug.cfs_rq[25]:/.utilization_load_avg

  1100 ++------------------------------------------------------------------=
-+
       |                       *                                           =
 |
  1080 ++                     ::                                           =
 |
       |                      : :          *                             .*=
 |
       |                     :  :         : :      .*             *    *. :=
 |
  1060 ++        *      *    :   :        : :     *  +           ::    :   =
:|
       | *      +:     ::   *    *       :   *   :    +          : :   :   =
:|
  1040 ++ +    +  :    : :  :     +     *     :  :     *.     *.*  :  :    =
:|
       *   + .*   :   :  : :       +    :     : :        *   :     :  :    =
:|
  1020 ++   *      :  :   ::        *  :       ::         :  :      : :    =
 |
       |           *.*    *          : :       *          : :       : :    =
 *
       |                             ::                    *        : :    =
 |
  1000 ++                             *                             ::     =
 |
       |                                                             :     =
 |
   980 ++------------------------------------------------------------*-----=
-+


                   sched_debug.cfs_rq[26]:/.runnable_load_avg

  19 ++-------------------------*------------------------------------------=
-+
     |                          :                                          =
 |
  18 ++                        ::                       *                  =
 |
     |                         ::                       :                  =
 |
     |                         : :                      ::                 =
 |
  17 ++                       :  :                     : :                 =
 |
     |                        :  :                     :  :                =
 |
  16 ++                       :  :   *                 :  :                =
 |
     |                       :   :   :                 :   :               =
 |
  15 ++   *      *..*        *   :  : :   *         *  :   *      *        =
 |
     |   + :    :    :      :    :  : :  + :       + ::    :      ::       =
 |
     |  +  :    :    :      :     ::   :+  :      +  ::     :    : :       =
 |
  14 *+*    *..*      *..*.*      ::   *    *..*.*    *     :    :  :  *..*=
.*
     |                            :                          :  :   : +    =
 |
  13 ++---------------------------*--------------------------*--*----*-----=
-+


                   sched_debug.cfs_rq[26]:/.utilization_load_avg

  1140 ++------------------------*----*------------------------------------=
-+
       |                         :    :                                    =
 |
  1120 ++                        ::   ::            *                      =
 |
  1100 ++                       : :  : :            ::                     =
 |
       |                        : :  : :            ::                     =
 |
  1080 ++                       :  : : :           :  :  *                 =
 |
  1060 ++                       :  : :  :          :  : + :                =
 |
       |        .*.*.*..       :   : :  : .*       :   *  :               *=
.*
  1040 *+   *.*.         .*    *   ::   *.  :  *.. :       *..    *     .. =
 |
  1020 ++  +            *  + ..     :       : +   :              + :   *   =
 |
       |: +                 *       *        *    *           *.*  :   :   =
 |
  1000 ++*                                                          : :    =
 |
   980 ++                                                           : :    =
 |
       |                                                             :     =
 |
   960 ++------------------------------------------------------------*-----=
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
     *                                : :                                  =
 |
  18 ++                  *            :  :                                 =
 |
     |:                 : :           :  :                                 =
 |
  16 ++:                : :           :  :         .*                      =
 |
     | *..     *       :   *      *   :  :       *.  :                     =
 |
     |       .. :      :    +    + + :    :     :    :                     =
 |
  14 ++   *.*   :  .*.*      *..*   +:    *.*.. :     *.*..*.*.. .*..  *..*=
.*
     |           *.                  *         *                *     +    =
 |
  12 ++--------------------------------------------------------------*-----=
-+


                   sched_debug.cfs_rq[27]:/.utilization_load_avg

  1140 ++------------------------------------------------------------------=
-+
  1120 ++                               *                                  =
 |
       *                         *      ::                                 =
 |
  1100 ++                        :+    :  :                                =
 |
  1080 ++        *        *     :  +   :  :        .*                  *.. =
 |
       | :       :       : +    :   *  :   *      *  +     *..         :   =
 |
  1060 ++*..    : :      :  *.. :    +:     :    :    +   +            :  *=
.|
  1040 ++       : :  *..*      :      *     :    :     *.*    *   *   :    =
 *
  1020 ++   *  :  : :          *             *  :              + +:   :    =
 |
       |     + :   ::                         + :               *  :  :    =
 |
  1000 ++     *    *                           *                   :  :    =
 |
   980 ++                                                           : :    =
 |
       |                                                            ::     =
 |
   960 ++                                                            :     =
 |
   940 ++------------------------------------------------------------*-----=
-+


                     sched_debug.cfs_rq[27]:/.tg_load_contrib

  180 ++------------*------------------------------------------------------=
-+
      |             :                               *                      =
 |
  160 ++            ::                              :                      =
 |
  140 ++           : :                             ::                      =
 |
      |            : :                             : :                     =
 |
  120 ++           : :                             : :                     =
 |
  100 ++           :  :                            : :                     =
 |
      |            :  :                      *    :  :   *                 =
 |
   80 ++          :   :     *                :    :  :  ::                 =
 |
   60 *+          :   :    ::               : :   :  :  : :     *          =
 |
      |:          *    :   : :    .*        : :   :   ::  :    : :   *.*.. =
 |
   40 ++   *     :     :  :  :   *  +      :   : :    ::  :    : : ..      =
 |
   20 ++:.. +    :     *. :   :..    *..*. :   *.*    *    : .*   *       *=
.|
      | *    *..*        *    *           *                *.              =
 *
    0 ++-------------------------------------------------------------------=
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
  14 *+*..*.*..*.*..*    *.*    *         *.*..*    *.*.*.. .*..*.  .*.*..*=
.*
     |                                                     *      *.       =
 |
  12 ++--------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[28]:/.utilization_load_avg

  1180 ++---------------*--------------------------------------------------=
-+
  1160 ++               :                                                  =
 |
       |                :                                                  =
 |
  1140 ++              : :                                                 =
 |
  1120 ++              : :                                                 =
 |
       |               : :                                                 =
 |
  1100 ++              : :                                                 =
 |
  1080 ++     *       :   :      *..  *.                                   =
 |
  1060 ++    : :   *  :   :.*.. :    +  *        .*                        =
 |
       *     :  : ::  :   *     :   *    +     *.  :   *.      .*         *=
 |
  1040 ++   *   : : : :        *          +   +    :  +  *    *  +      .. =
+|
  1020 ++ ..     *  ::                     *.*      :+    + ..    *..*.*   =
 *
       | *           :                              *      *               =
 |
  1000 ++            *                                                     =
 |
   980 ++------------------------------------------------------------------=
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
  20 ++::                        : :     : :                              *=
 |
     |: :                        : :     : :                            ..:=
 |
  18 ++ :                        :  :    : :                           *   =
:|
     |:  :                       :  :   :  :                           :   =
:|
  16 ++  :                       :  :   :  :                          :    =
:|
     |   :                   *  :   :   :   :                         :    =
:|
     |    :                 + + :    : :    :                         :    =
 |
  14 *+   *.  .*.*..*.*..*.*   +:    :.*    *..*.*..*. .*..*.*..*.*..:     =
 *
     |      *.                  *    *                *              *     =
 |
  12 ++--------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[29]:/.utilization_load_avg

  1200 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
       | *                                                                 =
 |
  1150 ++:                                 *                               =
 |
       |: :                         *      ::                             *=
 |
       |: :                         :     : :                            ::=
 |
  1100 ++  :                       : :    :  :                           : =
:|
       |   :                       : :   :   *                    *     :  =
:|
  1050 *+  :     *. .*..       *   : :   :    :   *.              ::   *   =
:|
       |    :  ..  *     .*. ..:   : :  :     :  +  *..*.*.*..*  : :   :   =
 |
       |    *.*         *   *   : :   :.*      :+              : :  : :    =
 *
  1000 ++                       : :   *        *               ::   : :    =
 |
       |                        : :                             *    *     =
 |
       |                         :                                         =
 |
   950 ++------------------------*-----------------------------------------=
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
  18 ++       : :                                                          =
 |
     |       :  :                                                          =
 |
  17 ++      :  :                                   *                      =
 |
     |       :   :                                 ::                      =
 |
  16 ++     :    :                             *   : :                     =
 |
  15 ++     *    *..*           *             + : :  :                    *=
 |
     |     +         +        .. +           +  : :   :                 .. =
+|
  14 *+   *           *..*.*.*    *..*.*..*.*    *    *.*..*.*..  *..  *   =
 *
     |+ ..                                                       +    +    =
 |
  13 ++*--------------------------------------------------------*----*-----=
-+


                   sched_debug.cfs_rq[30]:/.utilization_load_avg

  1160 ++--------*---------------------------------------------------------=
-+
  1140 ++       +:                                                         =
 |
       |       +  :                                                        =
 |
  1120 ++     *   :                                                        =
 |
  1100 ++     :   :                                                        =
 |
       |     :     :             *                                         =
 |
  1080 ++    :     *             :+            *..*.                       =
 |
  1060 ++   :       +           :  +          +     *..                    =
 |
  1040 ++   *        *.. .*.*   :   *        *         *.*        *      .*=
 |
       |   :            *    +  :   :       +             :   *  : :   *.  =
+|
  1020 *+  :                  +:     :  *..*              : .. + : :   :   =
 *
  1000 ++ :                    *     : :                   *    *   : :    =
 |
       | *                            ::                            : :    =
 |
   980 ++                             *                              *     =
 |
   960 ++------------------------------------------------------------------=
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
  16 ++       .*   :                         :   :                         =
 |
     |     .*.      *.     *.  .*.  .*.*..   :   :     .*..                =
 |
  14 *+*..*           *.. +  *.   *.      *.:    *..*.*    *.*..*.*..*.    =
.*
     |                   *                  *                          *..*=
 |
  12 ++--------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[31]:/.utilization_load_avg

  1160 ++------------------------------------------------------------------=
-+
  1140 ++          *                                                       =
 |
       |           ::                          *                           =
 |
  1120 ++         : :                          ::                          =
 |
  1100 ++         :  *..                       ::                          =
 |
  1080 ++        *          *    *            :  :                         =
 |
  1060 ++       :       *   ::   ::           :  :                         =
 |
       | *      :        : :  : : :   *.*     :   *             *          =
 |
  1040 ++ +    :         : :  : :  : :   +    :   :    *.*.*.. : +         =
 |
  1020 *+  + .*           *    *   : :    +  :     :  :        :  *..*.    =
 |
  1000 ++   *                       *      *.:     :  :       *        *.. =
.*
   980 ++                                    *     : :                    *=
 |
       |                                            ::                     =
 |
   960 ++                                           *                      =
 |
   940 ++------------------------------------------------------------------=
-+


                    sched_debug.cfs_rq[32]:/.runnable_load_avg

    17 ++------------------------------------------------------------*-----=
-+
       |                                                             :     =
 |
  16.5 ++                                                           ::     =
 |
    16 ++                                                           : :    =
 |
       |                                                            : :    =
 |
  15.5 ++                                                           : :    =
 |
       |                                                           :  :    =
 |
    15 ++     *    *.*           *      *..*                    *  :  :    =
 |
       |     : +  :  :          : +    :    :                   :: :   :   =
 |
  14.5 ++    :  + :   :         :  +   :    :                  : ::    :   =
 |
    14 ++*..*    *    :   *.*..*    *.*      *.*..*.*..*.*.*   :  *    *..*=
.*
       | :             :  :                                 :  :           =
 |
  13.5 ++              : :                                   : :           =
 |
       |:               ::                                   ::            =
 |
    13 *+---------------*-------------------------------------*------------=
-+


                   sched_debug.cfs_rq[32]:/.utilization_load_avg

  1120 ++------------------------------------------------------------------=
-+
       |      *    *                                                       =
 |
  1100 ++     :    :                                                       =
 |
       |     : :  : :                                                      =
 |
  1080 ++    : :  : :                                                      =
 |
       |     :  : : :                                           *          =
 |
  1060 ++   :   : : :                      *                    ::     *.. =
 |
       | *..*    :   :     .*..     *.   ..:        *          : :    :    =
 |
  1040 ++:       *   :   .*    *. ..  *.*   :      + :     *.. :  :   :   *=
 |
       |:            *..*        *          :    .*  :    +   :   *..*     =
:|
  1020 ++                                    :.*.     :  *    *            =
:|
       |:                                    *        : :                  =
 |
  1000 ++                                              ::                  =
 *
       |                                               *                   =
 |
   980 *+------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[33]:/.runnable_load_avg

  20 ++*-------------------------------------------------------------------=
-+
     | :                                                                   =
 |
  19 ++::                                                                  =
 |
     | ::                                                                  =
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
     |:  :                          ::                                     =
 |
  15 ++   : *..  *..                : :             *   *..                =
 *
     |    :+    +                  :  :           .. + +                   =
 |
  14 *+   *    *    *.*..*.*.*..  *   :   *.*..*.*    *    *.*..*.*..  *.. =
:|
     |                           +     :..                            +    =
:|
  13 ++-------------------------*------*-----------------------------*----*=
-+


                   sched_debug.cfs_rq[33]:/.utilization_load_avg

  1100 ++------------------------------------------------------------------=
-+
       |           *                                                       =
 |
  1080 ++     *    :+                                                      =
 |
       | *    ::  :  *                              *    *                 =
 |
  1060 ++::  :  : :   +                             :+  ::      *          =
 |
       |:  : :  ::     +                           :  + : :    ::          =
 |
  1040 ++  ::    *      *.*.        *.     *.*.*.. :   *  :    : :     *.. =
 *
       *    *               *..    +  *    :      :        : .*  :     :   =
+|
  1020 ++                      *. +   :   :       *        *.     :   :   *=
 |
       |                         *     :  :                       *.. :    =
 |
  1000 ++                              : :                           :     =
 |
       |                               : :                           *     =
 |
   980 ++                               :                                  =
 |
       |                                *                                  =
 |
   960 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[34]:/.runnable_load_avg

  22 ++----------*---------------------------------------------------------=
-+
     |           :                                                         =
 |
  21 ++          ::                                                        =
 |
  20 ++          ::                                                        =
 |
     |          : :                                                        =
 |
  19 ++         : :                                                        =
 |
  18 ++         :  :                                                       =
 |
     |          :  :                                                       =
 |
  17 ++         :  :                                                       =
 |
  16 ++         :  :            *                                          =
 |
     |         :    :          + :                                         =
 |
  15 ++*..     :    :         +  :                   .*.*..*.              =
.*
  14 *+   *.*..*    *.*..*.*.*    *..*.*..*.*..*.*..*        *..*      *..*=
 |
     |                                                           +    +    =
 |
  13 ++-----------------------------------------------------------*--*-----=
-+


                   sched_debug.cfs_rq[34]:/.utilization_load_avg

  1200 ++------------------------------------------------------------------=
-+
       |           *                                                       =
 |
       |           :                                                       =
 |
  1150 ++         ::                                                       =
 |
       |          : :                                                      =
 |
       |          : :                                                      =
 |
  1100 ++*        : :           .*..                                       =
 |
       | :+      :  :          *                                           =
 |
  1050 ++  + .*..*   :       ..     *.             .*..*.*.*..*.           =
 |
       |:   *        : .*.*.*         *.  .*.     *             *      *.. =
.*
       *             *.                 *.   *   +               +     :  *=
 |
  1000 ++                                     + +                 *   :    =
 |
       |                                       *                   +  :    =
 |
       |                                                            +:     =
 |
   950 ++------------------------------------------------------------*-----=
-+


                   sched_debug.cfs_rq[35]:/.runnable_load_avg

  22 ++-------------------------------------*------------------------------=
-+
     |                               *      :                             *=
 |
     |                               :      ::                            :=
 |
  20 ++                             ::     : :                           ::=
 |
     |                              : :    : :                           : =
:|
     |                              : :    : :                           : =
:|
  18 ++                             : :    :  :                          : =
:|
     |                             :  :    :  :                         :  =
:|
  16 ++                            :   :   :  :                         :  =
:|
     |                             :   :  :   :                         :  =
 |
     |                         .*.:    *..:    :            .*..       :   =
 |
  14 *+*..  *..*.*..*    *.*.*.   *       *    *.*..*   *..*    *      *   =
 *
     |     +         :  +                            + +         +    +    =
 |
     |    *          : +                              *           *..*     =
 |
  12 ++---------------*----------------------------------------------------=
-+


                   sched_debug.cfs_rq[35]:/.utilization_load_avg

  1180 ++------------------------------------------------------------------=
-+
  1160 ++                                    *                             =
 |
       |                                     :                             =
 |
  1140 ++                             *      ::                            =
 |
  1120 ++                             :     : :                            =
 |
       |                             : :    : :            *           *.. =
 |
  1100 ++                            : :    : :            ::          :  *=
 |
  1080 ++                            : :    :  :          :  :         :   =
+|
  1060 ++     *..  *.     *         :   :  :   :          :  :        :    =
 *
       |     :    +  *    :+    .*..*   *..:   *..       *    *.*     :    =
 |
  1040 ++    :   *    :  :  *..*           *      *.    +        +    :    =
 |
  1020 *+*..*          : :                          *..*          *.. :    =
 |
       |               ::                                            :     =
 |
  1000 ++               *                                            *     =
 |
   980 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[36]:/.runnable_load_avg

  21 ++----------*---------------------------------------------------------=
-+
     |           :                                                         =
 |
  20 ++          ::                                                        =
 |
  19 ++          ::                                                        =
 |
     |          : :                                                        =
 |
  18 ++         :  :                                                       =
 |
     |          :  :                                                       =
 |
  17 ++         :  :                                                       =
 |
     |          :  :                                                       =
 |
  16 ++         :   :                                           *.*        =
 |
  15 ++*       :    *                                          +   :   *.. =
 |
     |+ :      :     :                                        +    :   :   =
 |
  14 *+  :  *..*     :   *.*.*..*.*..  *..*.*..  *..  *    *.*      : :   *=
.*
     |   : +          :..             +         +    + + ..         : :    =
 |
  13 ++---*-----------*--------------*---------*----*---*------------*-----=
-+


                   sched_debug.cfs_rq[36]:/.utilization_load_avg

  1140 ++--------------------------------------------------------------*---=
-+
       |           *                                                   :   =
 |
  1120 ++          ::                                                  ::  =
 |
  1100 *+         : :                                                  ::  =
 |
       |+         :  :                                                :  : =
 |
  1080 ++*       :   *                                           .*   :  : =
 |
  1060 ++:      .*    :                                      .*.* :   :  : =
 |
       |  :   *.      :     *..*            .*.*..*        *.      :  :   :=
 |
  1040 ++ :   :        :   +    +  .*     .*       :      +        :  :   *=
.*
  1020 ++  : :         :  *      *.  :  *.         :   *.*          : :    =
 |
       |   : :          :+           : +            :..             ::     =
 |
  1000 ++  : :          *             *             *               ::     =
 |
   980 ++   :                                                        :     =
 |
       |    *                                                        *     =
 |
   960 ++------------------------------------------------------------------=
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
     |           *..     :   :       *.*..              *              *   =
 |
     |          +        :   :     ..                  + +            : +  =
 |
  14 *+*..*.*..*    *.*..*   *..*.*       *.*..*.*..*.*   + .*..*.    :  + =
.*
     |                                                     *      *..*    *=
 |
  12 ++--------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[37]:/.utilization_load_avg

  1200 ++------------------------------------------------------------------=
-+
  1180 ++                   *                                              =
 |
       |                    :                                              =
 |
  1160 ++                   ::                                             =
 |
  1140 ++                  : :                                             =
 |
  1120 ++                  : :                           *                 =
 |
  1100 ++                  :  :                          :             *   =
 |
       |                   :  :                         : :            :   =
 |
  1080 ++                  :  :                         : :           : :  =
 |
  1060 ++          *      :    :        *      *..      : :           : :  =
 |
  1040 ++*..      + +  .*.:    *.*..   + +    +   *    :   :   .*     :  : =
 *
  1020 ++        *   *.   *         *.*   + .*     +  .*   *..*  :   :   : =
:|
       |:   *. ..                          *        *.           :  .*    :=
:|
  1000 *+     *                                                   *.      *=
 |
   980 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[38]:/.runnable_load_avg

  19 ++--------------------*-----------------------------------------------=
-+
     |                     :                                               =
 |
  18 ++                    :                                               =
 |
     |                     ::                                              =
 |
     |                    : :                                              =
 |
  17 ++                   : :                                              =
 |
     |                    : :                                              =
 |
  16 ++                   : :                                              =
 |
     |                    : :                                              =
 |
  15 ++        *          :  :       *.*..*         *.*              *     =
 *
     |        + :        :   :      +     :        +   :            : :    =
:|
     |       +  :        :   :     +       :      +    :            : :    =
:|
  14 ++*..*.*    *..*.*..*   *..*.*        :   *.*      *..*.*..*  :   *..*=
 |
     |+                                     :..                  + :       =
 |
  13 *+-------------------------------------*---------------------*--------=
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
  1080 ++                  :  :                                            =
 *
       |                  :    :        *..*       .*..*      *            =
 |
  1060 ++*..              *    *       :    +     *     :   .. +           =
:|
       *    *            :      +      :     *   +      : .*    *          =
:|
  1040 ++    :   *. .*.. :       *.. .*       + +        *      :    *.*..*=
 |
  1020 ++    :  +  *    *           *          *                 :  :      =
 |
       |      :+                                                 :  :      =
 |
  1000 ++     *                                                   ::       =
 |
       |                                                          *        =
 |
   980 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[39]:/.runnable_load_avg

  24 ++--------------------------------------------------------------------=
-+
     |                                                     *               =
 |
  22 ++                                                    :               =
 |
     |                                                    ::               =
 |
     |                                                    : :              =
 |
  20 ++                                                   : :              =
 |
     |                                                    : :              =
 |
  18 ++                                                  :  :              =
 |
     |                                                   :  :              =
 |
  16 ++                  *.                              :  :              =
 |
     |                  +  *    *.*..*      *..*    *.*  :   :         *.. =
 |
     |                 +    + ..      +    +    + ..   +:    :         :   =
 |
  14 *+*..*.*.. .*..*.*      *         *..*      *      *    *..      :   *=
.*
     |         *                                                *.*.. :    =
 |
  12 ++--------------------------------------------------------------*-----=
-+


                   sched_debug.cfs_rq[39]:/.utilization_load_avg

  1200 ++--------------------------------------------------*---------------=
-+
       |                                                   :               =
 |
  1150 ++                                                  ::              =
 |
       |                                                  : :              =
 |
       |                                                  :  :             =
 |
  1100 ++                           *                  *  :  :             =
 |
       |                           + :           .*   + : :  :             =
 |
  1050 *+    .*.. .*    *.*    *. +  :        .*.  + +  ::    :        *.. =
.*
       |+  .*    *  + ..   + ..  *    *.*..*.*      *    *    *.       :  *=
 |
  1000 ++*.          *      *                                   *.*   :    =
 |
       |                                                           +  :    =
 |
       |                                                            +:     =
 |
   950 ++                                                            *     =
 |
       |                                                                   =
 |
   900 ++------------------------------------------------------------------=
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
     |     :   :                                                 .*        =
 |
  14 ++   :    *      *..    *..  *..*    *         *.*.*..*.*..*  :   *   =
 *
     |    :     +    :      +    +    + .. +      ..                : : +  =
:|
     |.*..:      *.. :   *.*    *      *    *..*.*                  : :  + =
:|
  12 *+---*---------*------------------------------------------------*----*=
-+


                   sched_debug.cfs_rq[40]:/.utilization_load_avg

  1100 ++------------------------------------------------------------------=
-+
       |                                     *           *                 =
 |
  1080 ++                                    :          +:        *        =
 |
  1060 ++               *                   : :        *  :      : :       =
 |
       |      *..       ::              *.. : :       :   :      : :       =
 |
  1040 ++     :   .*   : :     *    *. +   :  :       :   :    .*   :      =
 |
  1020 ++*   :   *  :  :  :  .. + ..  *    *   :     :     : .*     :  *   =
 *
       |: +  :      : :   *.*    *             *.. .*      *.        :+:   =
 |
  1000 ++  +:        ::                           *                  *  :  =
:|
   980 *+   *        *                                                  :  =
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


                   sched_debug.cfs_rq[41]:/.runnable_load_avg

  24 ++--------------------------------------------------------------------=
-+
     |                                                                    *=
 |
  22 ++                                                                   :=
 |
     |                                                                   ::=
 |
     |                                                                   : =
:|
  20 ++                                                                  : =
:|
     |                       *                                           : =
:|
  18 ++                      :                                          :  =
:|
     |                      : :                                         :  =
:|
  16 ++                     : :                                         :  =
:|
     |                      :  :                                        :  =
 |
     |                     :   :                                       :   =
 |
  14 *+              .*..*.*    :.*..    .*.*..*.*..*.*.*.. .*..*.  .*.*   =
 |
     | *..*.*..*.*..*           *    *.*.                  *      *.       =
 *
  12 ++--------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[41]:/.utilization_load_avg

  1140 ++----------------------*-------------------------------------------=
-+
       |                       :             *                             =
 |
  1120 ++                     ::             :                             =
 |
  1100 ++                     : :            ::                           *=
 |
       |                      : :           : :                           :=
 |
  1080 ++                    :  :           : :                          ::=
 |
       |                     :  :           : :        *                 : =
:|
  1060 ++            *..  *  :  :    .*.*.. :  :      + :               :  =
:|
       |            :    + +:    :  *      :   :     +  :               :  =
:|
  1040 *+           :   *   *    :..       *   *    *    :    *.*      *   =
:|
  1020 ++   *     .*             *              +  :     *   +   :     :   =
:|
       |:  + :   *                               + :      + +    :    :    =
 |
  1000 ++:+  : ..                                 *        *      :   :    =
 |
       | *    *                                                   *..:     =
 *
   980 ++------------------------------------------------------------*-----=
-+


                   sched_debug.cfs_rq[42]:/.runnable_load_avg

  19 ++---------------------------------------------*----------------------=
-+
     |                                              :                      =
 |
  18 *+                                            ::                      =
 *
     |                                             : :                     =
 |
     |:                                            : :                     =
 |
  17 ++                                           :  :                     =
:|
     |:                                           :  :                     =
:|
  16 ++                                           :  :                     =
:|
     | :                                         :   :                     =
:|
  15 ++*                                         *    :           *        =
:|
     |  :                                       :     :          : :      :=
 |
     |  :                                       :     :          : :      :=
 |
  14 ++  :  *..*.*..     *   *..*.*..  *..  *..*      *.*..*.*..*   :  *..*=
 |
     |   : +           .. + +         +    +                        : +    =
 |
  13 ++---*---------*-*----*---------*----*--------------------------*-----=
-+


                   sched_debug.cfs_rq[42]:/.utilization_load_avg

  1100 ++------------------------------------------------------------------=
-+
       *                         *                                         =
 |
  1080 ++                        ::                               *        =
 |
       |:                       :  :              *               :        =
 *
       | *                      :  :              ::             : :       =
+|
  1060 ++ :                     :   *        *   : :             : :      *=
 |
       |   :                    :    :       ::  :  *..          :  :   .. =
 |
  1040 ++  :      .*.          :     :       :: :       .*.*..   :  :  *   =
 |
       |    *    *   *..       *      *.*   :  ::      *        :   : :    =
 |
  1020 ++   :   :       *.*   +          :  :  *              *.*    ::    =
 |
       |     :  :          + +           :  :                        *     =
 |
       |     : :            *             : :                              =
 |
  1000 ++     ::                          ::                               =
 |
       |      *                            *                               =
 |
   980 ++------------------------------------------------------------------=
-+


                    sched_debug.cfs_rq[43]:/.runnable_load_avg

    15 ++----------------------------------*---------------*---------------=
-+
       |                                   :               :               =
 |
       |                                   ::             : :              =
 |
  14.5 ++                                 : :             : :              =
 |
       |                                  : :             :  :             =
 |
       |                                  : :             :  :             =
 |
       |                                  :  :           :    :            =
 |
    14 ++*    *    *.*..*.*    *.*..*     :  *.*    *..*.*    *   *    *..*=
 |
       | :    :    :      :    :    :    :     :    :         :   :    :  :=
 |
       |: :  : :  :        :  :      :   :      :  :           : : :  :    =
:|
  13.5 ++ :  : :  :        :  :      :   :      :  :           : : :  :    =
:|
       |:  : :  : :        : :       :   :       : :           : :  : :    =
:|
       |:  : :  : :        : :       :  :        : :           : :  : :    =
:|
       |    :    :          :         : :         :             :    :     =
 |
    13 *+---*----*----------*---------*-*---------*-------------*----*-----=
-*


                   sched_debug.cfs_rq[43]:/.utilization_load_avg

  1100 ++------------------------------------------------------------------=
-+
       |                            *               *..                    =
 |
  1080 ++                 *         :               :  *      *            =
 |
       |                 +:        ::               :   +    +:            =
 |
       |                *  :       : :             :     *. +  :           =
 |
  1060 ++          *   :   :      :  :         *   :       *   :       *.. =
 |
       |           ::  :   :      :  :         ::  :           :       :   =
 |
  1040 ++         : : :    :     :   :     *  : :  :            :      :  *=
.|
       | *    *.. :  *      :  *.*   :    : : :  ::             *.*   :    =
 *
  1020 ++:+  :   *          :..      :    : ::   ::                :  :    =
 |
       |:  + :              *         :  :   *    *                :  :    =
 |
       |:   *                         :.*                           : :    =
 |
  1000 ++                             *                             ::     =
 |
       *                                                             *     =
 |
   980 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[44]:/.runnable_load_avg

  18 ++----------------------*---------------------------------------------=
-+
     |                       :                                             =
 |
     |                       ::                                            =
 |
  17 ++                      ::                                            =
 |
     |                      : :                                            =
 |
     |                      : :                                            =
 |
  16 ++                     :  :                                           =
 |
     |                      :  :                                           =
 |
  15 ++                     :  :                                          *=
 |
     |                      :  :                                         +:=
 |
     |                      :   :                                       +  =
:|
  14 *+*    *..*.*..*.*..* :    *.*..*    *.*..*.*..*      *.*    *    *   =
:|
     |  +  :              ::          :  +           :    +   +  : +  :    =
:|
     |   + :              ::          : +            :   +     + :  + :    =
 |
  13 ++---*----------------*-----------*--------------*-*-------*----*-----=
-*


                   sched_debug.cfs_rq[44]:/.utilization_load_avg

  1120 ++------------------------------------------------------------------=
-+
       *                                                                   =
 |
  1100 ++                      *                                           =
 |
  1080 ++                     ::                                           =
 |
       |:                     : :                                          =
 |
  1060 ++:                   :  :          *               *..*            =
 |
       | *          .*.. .*. :   :        : :              :   :       *..*=
 |
  1040 ++ :   *.. .*    *   *    *..*.    : :      .*     :    :       :   =
:|
       |   : :   *                    *  :   *.*..*  +    :     *.*    :   =
:|
  1020 ++  : :                         + :            +   :        :  :    =
 |
  1000 ++   *                           *              *.:         :  :    =
 *
       |                                                 *          : :    =
 |
   980 ++                                                           : :    =
 |
       |                                                             :     =
 |
   960 ++------------------------------------------------------------*-----=
-+


                    sched_debug.cfs_rq[45]:/.runnable_load_avg

    15 ++----------------------------------*-------------------------------=
-+
       |                                   :                               =
 |
       |                                  : :                              =
 |
  14.5 ++                                 : :                              =
 |
       |                                 :  :                              =
 |
       |                                 :  :                              =
 |
       |                                :    :                             =
 |
    14 ++   *    *      *.*    *    *   *    *.*..*.*..*.*.*..*.*      *..*=
.*
       |    :    :      : :    :    :   :                       :      :   =
 |
       |   : :  : :    :   :  : :  : : :                         :    :    =
 |
  13.5 ++  : :  : :    :   :  : :  : : :                         :    :    =
 |
       |  :  : :  :   :    : :  : :  : :                         :    :    =
 |
       |  :  : :  :   :    : :  : :  : :                         :    :    =
 |
       | :    :    : :      :    :    :                           :  :     =
 |
    13 *+*----*----*-*------*----*----*---------------------------*--*-----=
-+


                   sched_debug.cfs_rq[45]:/.utilization_load_avg

  1100 ++---------------------------*--------------------------------------=
-+
       |                            :                                      =
 |
  1080 ++                          ::                                      =
 |
       |                           : :                                     =
 |
  1060 ++        *                 : :                                   .*=
 |
       |    *   ::                :  :  *..*.    .*        *           *.  =
+|
  1040 ++   ::  : :            *  :  :  :    *.*.  :      + :   *      :   =
 *
       |   : : :  :            :: :  : :           :   *.*  :   :      :   =
 |
  1020 ++  :  *   :    .*.    : ::    ::            :..      : : :    :    =
 |
       *  :        :.*.   *   :  *    :             *        : : :    :    =
 |
  1000 ++ :        *       : :        *                       *  :    :    =
 |
       |::                 : :                                    :   :    =
 |
   980 ++*                  *                                     *..:     =
 |
       |                                                             *     =
 |
   960 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[46]:/.runnable_load_avg

  19 ++---*----------------------------------------------------------------=
-+
     |    :                                                                =
 |
  18 ++   :                                                                =
 |
     |   ::                                                                =
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
  15 ++ :  :   *                                                *          =
 *
     |  :  :  : :                                              +:          =
 |
     | :    : : :                                             +  :         =
:|
  14 ++*    ::   *..  *..*.*    *    *.*..*    *.*..*.*.*..  *   :     *.. =
:|
     |+     ::       +      + .. + ..      + ..             +     :   +   :=
 |
  13 *+-----*-------*--------*----*---------*--------------*------*--*----*=
-+


                   sched_debug.cfs_rq[46]:/.utilization_load_avg

  1120 ++------------------------------------------------------------------=
-+
       |                                                                   =
 *
  1100 ++               *               *                       *          =
:|
  1080 ++               :+              ::                      ::         =
:|
       |    *          :  *             ::                     : :       .*=
 |
  1060 ++ .. +  .*     :   :           :  :            *.*     :  :    *.  =
 |
  1040 ++*    *.  :   :    :           :  :      .*. ..  :    *   *    :   =
 |
       |+         :   :     *..*.  .*  :   *. .*.   *     :  :    :    :   =
 |
  1020 *+          *.:           *.  : :     *            :  :     :  :    =
 |
  1000 ++            *               ::                    ::      :  :    =
 |
       |                              :                    *        : :    =
 |
   980 ++                             *                             : :    =
 |
   960 ++                                                            :     =
 |
       |                                                             *     =
 |
   940 ++------------------------------------------------------------------=
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
     |               : :                                                   =
 |
  17 ++              : :                                                   =
 |
     |               :  :                                                  =
 |
  16 ++             :   :            *                                     =
 |
     |              :   :           ::                                     =
 |
  15 ++   *      *..*   :       *   : :          *              *.*        =
 |
     |   +:     :        :     : : :  :         : +            +   :       =
 |
     |  +  :    :        :     : : :  :         :  +          +    :       =
 |
  14 *+*   :   *         *    :   *   :   *    *    *.*      *      :  *..*=
.*
     |      :..           +   :        :.. + ..        +    +       : +    =
 |
  13 ++-----*--------------*-*---------*----*-----------*--*---------*-----=
-+


                   sched_debug.cfs_rq[47]:/.utilization_load_avg

  1120 ++---------------*--------*-----------------------------------------=
-+
       |    *          +:        :                                         =
 |
  1100 ++   :      *. + :        ::   *           *                        =
 |
  1080 ++  : :     : *   :      : :   :+         ::                        =
 |
       |   : :    :      :      :  : :  *        : :                       =
 |
  1060 ++ :  :    :      :      :  : :   +      :  :             .*    *.. =
 |
  1040 ++ :  :   :       :      :   :     +     :   :          .*  :   :  *=
.|
       | *    : .*        : *   :   *      *   *    *..  *    *    :  :    =
 *
  1020 ++     *.          :+ + :            + +         +:    :     : :    =
 |
  1000 *+                 *   +:             *         *  :  :      : :    =
 |
       |                       *                          :  :       :     =
 |
   980 ++                                                 : :        *     =
 |
   960 ++                                                  ::              =
 |
       |                                                   *               =
 |
   940 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[48]:/.runnable_load_avg

  18 ++-----------------------------------------------------------*--------=
-+
     |                                                            :        =
 |
     |                                                            :        =
 |
  17 ++                                                          : :       =
 |
     |                                                           : :       =
 |
     |                                                           : :       =
 |
  16 ++                                                          : :       =
 |
     |                                                           :  :      =
 |
  15 ++     *       *        *                                   :  :      =
 |
     |     : :     +:       : +                                 :   :      =
 |
     |     : :    +  :      :  +                                :   :      =
 |
  14 *+   *   :  *   :     *    *.*    *..*    *    *.*    *.*..*   :     *=
.*
     |:  +    : :    :    :        +  :    :  + :  +   :  +          :   + =
 |
     |: +      ::     :   :         + :    : +  : +    : +           :  +  =
 |
  13 ++*-------*------*--*-----------*------*----*------*------------*-*---=
-+


                   sched_debug.cfs_rq[48]:/.utilization_load_avg

  1120 ++------------------------------------------------------------------=
-+
       |                                                          *        =
 |
  1100 ++                                                         :        =
 |
  1080 ++     *               .*                                  ::       =
 |
       |     : :     *      *.  :   *                            : :      *=
 |
  1060 *+    :  :   : +     :   :  + :                 *         : :      :=
:|
  1040 ++   *   :   :  +    :    :+  :     *          + :        : :     : =
:|
       |:  :     *.*    *  :     *    *   : :        +  :    .*  :  :    : =
 |
  1020 ++  :            :  :           :  : : .*..  *    *.*.  +:   :   :  =
 *
  1000 ++::              : :           : :   *     +            *   :   :  =
 |
       | *               : :            *         *                 :  *   =
 |
   980 ++                ::                                          :+    =
 |
   960 ++                 :                                          *     =
 |
       |                  *                                                =
 |
   940 ++------------------------------------------------------------------=
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
  16 ++      :   :                                              *          =
 |
     |      :    : .*.                                        .. +         =
 |
  14 *+*..*.*    *.   *..*. .*..*.*..*.*..*.*..*.  .*   *..*.*    *.. .*..*=
.|
     |                     *                     *.  + +             *     =
 *
  12 ++-----------------------------------------------*--------------------=
-+


                   sched_debug.cfs_rq[49]:/.utilization_load_avg

  1100 ++------------------------------------------------------------------=
-+
       |                                                          *        =
 |
  1080 ++            *         *                                 ::        =
 |
  1060 ++*       *   ::       : +                   *        .*. ::      .*=
 |
       | ::    ..:  :  :      :  *..               ::      *.   *  :   *.  =
:|
  1040 ++  :  *   : :  : .*. :      *.*.  .*       : :     :       :   :   =
:|
       |:  : +    : :   *   *           *.  :    .*  :    :        :   :   =
 |
  1020 *+   *      :                        : .*.     :   :        :  :    =
 *
       |           *                         *        :  *          : :    =
 |
  1000 ++                                             : :           : :    =
 |
   980 ++                                              ::           : :    =
 |
       |                                               *            : :    =
 |
   960 ++                                                            :     =
 |
       |                                                             :     =
 |
   940 ++------------------------------------------------------------*-----=
-+


                   sched_debug.cfs_rq[50]:/.runnable_load_avg

  21 ++------------------------------------------------------*-------------=
-+
     |                                                       :             =
 |
  20 ++                                                     : :            =
 |
  19 ++                                *                    : :            =
 |
     |                                 :                    : :            =
 |
  18 ++                                ::                  :  :            =
 |
  17 ++                      *        : :                  *   :           =
 |
     |                       ::       : :                 +    :           =
 |
  16 ++                     : :       :  :               +     :           =
 |
  15 ++        *      *     :  :      :  :              *      :           =
 |
     |       .. +    : +   :   :     :   :             :        :          =
 |
  14 *+*..*.*    *.. :  + .*    *.*..*    :   .*.*..*. :        *     .*..*=
.*
  13 ++             *    *                *.*.        *          :   *     =
 |
     |                                                           : ..      =
 |
  12 ++-----------------------------------------------------------*--------=
-+


                   sched_debug.cfs_rq[50]:/.utilization_load_avg

  1120 ++--------------------------------------------------*---------------=
-+
       |                                                   :  *            =
 *
  1100 ++                      *                          :   :            =
 |
  1080 ++                      :                          :    :           =
:|
       |                      : :      .*                *     :           =
:|
  1060 ++     *..  *          : :    .* :      *..       :      :          =
:|
  1040 *+    +    + +        :   : .*    :     :   .*.. :       *      *..:=
 |
       |:   *    *   *..*.*  :   *.      :    :   *     :       :      :  *=
 |
  1020 ++ ..               +:            :    :        *         :     :   =
 |
  1000 ++*                  *             :  :                   :    :    =
 |
       |                                  :  *                   :    :    =
 |
   980 ++                                 :  :                   :    :    =
 |
   960 ++                                 : :                     :   :    =
 |
       |                                   ::                     *..:     =
 |
   940 ++----------------------------------*-------------------------*-----=
-+


                    sched_debug.cfs_rq[51]:/.runnable_load_avg

    15 ++--------*-*--------*-------------------------------------*-------*=
-+
       |        :  :        ::                                    :      ::=
 |
  14.5 ++       :   :      : :                                   : :     ::=
 |
       |       :    :      :  :                                  : :    :  =
:|
       |       :     :    :   :                                 :  :    :  =
:|
    14 *+*..*.*      *..*.*    *    *   *      *    *..*.*.*    *   :  *   =
:|
       |                        :  ::   ::     ::   :       :   :   :  :   =
:|
  13.5 ++                       :  ::   : :   :  : :         : :    : :    =
 |
       |                         ::  : :  :   :  : :         : :     ::    =
 |
    13 ++                        *   : :   *.*    *           *      *     =
 *
       |                             : :                                   =
 |
       |                             : :                                   =
 |
  12.5 ++                             :                                    =
 |
       |                              :                                    =
 |
    12 ++-----------------------------*------------------------------------=
-+


                   sched_debug.cfs_rq[51]:/.utilization_load_avg

  1080 ++----------*-*-----------------------------------------------------=
-+
  1070 ++          :  :                                                    =
 |
       |          :    :    *..                                            =
 |
  1060 ++         :    :    :  *                                          *=
 |
  1050 ++        :      *  :    +                                         :=
 |
       | *..    .*       + :     *                     *                 : =
:|
  1040 ++   *.*.          *       :     *.. .*        : +        .*      : =
:|
  1030 ++                          :    :  *  :       :  *.*.. .*  :    :  =
:|
  1020 *+                          :   :      :      :        *    :    :  =
:|
       |                            *  :       *.. .*               :  :   =
 |
  1010 ++                            : :          *                 :  *   =
 *
  1000 ++                            : :                             :+    =
 |
       |                              :                              *     =
 |
   990 ++                             *                                    =
 |
   980 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[52]:/.runnable_load_avg

  18 ++-----------------------------------*--------------------------------=
-+
     |                                    :                                =
 |
     |                                   ::                                =
 |
  17 ++                                  ::                                =
 |
     |                                   : :                               =
 |
     |                                   : :                               =
 |
  16 ++                                 :  :            *..                =
 |
     |                                  :  :           +                   =
 |
  15 ++   *    *           *            :  :          *    *      *    *   =
 *
     |   + :  + :         : :           :  :          :     :    : :   ::  =
 |
     |  +  : +  :         : :          :   :         :      :    : :  : :  =
:|
  14 *+*    *    *..*.*..*   *..*    *.*    :  *     :       *..*   : :  : =
:|
     |                           :  +       : + :    :              : :  : =
:|
     |                           : +        :+  :   :                :    :=
 |
  13 ++---------------------------*---------*----*--*----------------*----*=
-+


                   sched_debug.cfs_rq[52]:/.utilization_load_avg

  1140 ++------------------------------------------------------------------=
-+
  1120 ++                                  *                               =
 |
       |                                   :               *               =
 |
  1100 *+                                 : :             + :              =
 |
  1080 ++  .*    *                        : :           .*  :          *   =
 *
  1060 ++*.  :  : :  *..    *..           : :          *     :         :+  =
:|
  1040 ++    :  : : :      :   *.     *  :  :  *..    :      :    *    : + =
:|
       |      ::   ::   *. :     *.. + : :   ::       :       *. +:   :   *=
 |
  1020 ++     *    *      *         *  ::    ::   *. :          *  :  :    =
 |
  1000 ++                               *    *      *              :  :    =
 |
   980 ++                                                           : :    =
 |
   960 ++                                                           ::     =
 |
       |                                                             :     =
 |
   940 ++                                                            *     =
 |
   920 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[53]:/.runnable_load_avg

  18 ++-------------------------------------*------------------------------=
-+
     |                                      :                              =
 |
     |                                      :                              =
 |
  17 ++                                    : :                             =
 |
     |                                     : :                             =
 |
     |                                     : :                             =
 |
  16 ++                      *             : :                             =
 *
     |                       :             :  :                            =
+|
  15 ++*              *      ::            :  :  *                *       *=
 |
     |: +            : +    : :           :   :  :+              : +     + =
 |
     |:  +           :  +   :  :          :   : :  +             :  +   +  =
 |
  14 *+   *.*       *    *  :  :  *    *..*   : :   *   *    *..*    *.*   =
 |
     |       +     +      : :  : : +  :        ::    : : +  :              =
 |
     |        +   +       ::    ::  + :        :     : :  + :              =
 |
  13 ++--------*-*---------*----*----*---------*------*----*---------------=
-+


                   sched_debug.cfs_rq[53]:/.utilization_load_avg

  1200 ++------------------------------------------------------------------=
-+
       |                       *                                           =
 |
       |                       :                                           =
 |
  1150 ++                     ::                                           =
 |
       |                      : :                                          =
 *
       |                  *   : :            *                         *   =
 |
  1100 ++                ::  :  :            ::                        ::  =
:|
       |                 : : :  :           : :                       :  : =
:|
  1050 *+*..       *    *  : :   :  *   *.. :  :                  *.. :  ::=
 |
       |    *     : + ..    :    :.. + +   :   *..*.*.. .*       +   *    *=
 |
       |     :    :  *      *    *    *    *           *  :   *.*          =
 |
  1000 ++    :   *                                        : ..             =
 |
       |      :..                                          *               =
 |
       |      *                                                            =
 |
   950 ++------------------------------------------------------------------=
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
     |: :                                                                  =
 |
  18 ++  :                                                                 =
 |
     |:  :                                                                 =
 |
  16 ++  :                                                                 =
 |
     |   :                        *                                       *=
.*
     |    :                      : +                                    .. =
 |
  14 *+   :.*..*.*..*.  .*. .*.. :  +    .*.*..    .*.*.  .*.*..*.  .*.*   =
 |
     |    *           *.   *    *    *.*.      *.*.     *.        *.       =
 |
  12 ++--------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[54]:/.utilization_load_avg

  1100 ++*-----------------------------------------------------------------=
-+
       | :                                                                 =
 |
  1080 ++ :                                                     *          =
 |
       |: :                                                     :          =
 *
  1060 ++  :         *                     *               *   : :         =
+|
       *   :     *. + :   *         *    .. +         .*   :+  : :        *=
 |
  1040 ++   :   :  *  :   :+        :+ .*    *      *.  : :  +:   :     .. =
 |
       |    *   :      : :  *..*   :  *       +    :    : :   *   *..  *   =
 |
  1020 ++    + :       : :     :   :           *.. :     :            +    =
 |
       |      *         *       : :               *      *           *     =
 |
  1000 ++                       : :                                        =
 |
       |                         :                                         =
 |
   980 ++                        *                                         =
 |
       |                                                                   =
 |
   960 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[55]:/.runnable_load_avg

  18 ++-----*-------------------------------------------*------------*-----=
-+
     |      :                                           :            :     =
 |
  17 ++    : :                                         : :           :     =
 |
     |     : :                                         : :          : :    =
 |
     |     : :                                         : :          : :    =
 |
  16 ++    :  :                                        :  :         : :    =
 |
     |    :   :                                       :   :         : :    =
 |
  15 ++   *   :     *             *..*      *..       *   :        :   :  *=
.*
     |  ..     :  .. +            :   +    +          :    :       :   :.. =
 |
  14 ++*       *.*    *..*.*.*   :     *..*    *.*   :     *.*..*  :   *   =
 |
     |:                       :  :                +  :           : :       =
 |
     |:                       :  :                 +:            ::        =
 |
  13 *+                        : :                  *             *        =
 |
     |                         ::                                          =
 |
  12 ++-------------------------*------------------------------------------=
-+


                   sched_debug.cfs_rq[55]:/.utilization_load_avg

  1120 ++------------*-----------------------------------------------------=
-+
       |             :                                   *                 =
 |
  1100 ++     *      ::                                  :                 =
 |
  1080 ++    + :    : :                                 : :          *    *=
 |
       |    *  :    :  :       *                        : :          ::  + =
+|
  1060 ++  :    :   :  :     ..:    *.*.     *         *  :     *   : : +  =
 *
  1040 ++  :    :   :   :   *  :    :   *.. + :   *   :    :   +:   :  *   =
 |
       *. :      : :    *  :    :  :       *  : .. :  :    *..*  : :       =
 |
  1020 ++*       *.*     + :    :  :           *   : :           : :       =
 |
  1000 ++                 *     :  :                *             :        =
 |
       |                        : :                               *        =
 |
   980 ++                        ::                                        =
 |
   960 ++                        :                                         =
 |
       |                         *                                         =
 |
   940 ++------------------------------------------------------------------=
-+


                    sched_debug.cfs_rq[56]:/.runnable_load_avg

    15 ++---*--------*------------------*----*---------*---*------*-------*=
-*
       |    :        :                  :    :         :   :      :       :=
 |
       |   : :       :                 : :  : :       : : : :    : :      :=
 |
  14.5 ++  : :       ::                : :  : :       : : : :    : :     : =
 |
       |  :  :      : :                :  : : :      :  : :  :   :  :    : =
 |
       |  :  :      : :                :  : : :      :  : :  :   :  :    : =
 |
       | :    :     : :               :    :   :    :    :    : :    :   : =
 |
    14 *+*    *..*  :  :       *    *.*    *   *    *    *    *.*    *   : =
 |
       |         :  :  :       :    :          :    :                :  :  =
 |
       |          : :  :      : :  :            :  :                  : :  =
 |
  13.5 ++         : :  :      : :  :            :  :                  : :  =
 |
       |          ::   :     :  : :              : :                  : :  =
 |
       |          ::    :    :  : :              : :                  ::   =
 |
       |           :    :   :    :                :                    :   =
 |
    13 ++----------*----*-*-*----*----------------*--------------------*---=
-+


                   sched_debug.cfs_rq[56]:/.utilization_load_avg

  1080 ++------------------------------------------------------------------=
-+
  1070 ++                               *                                  =
 |
       |         *   *                  :                         *        =
 |
  1060 ++       ::   ::                 ::                 *      :       *=
.*
  1050 ++       : :  ::                : :             *   :+    : :      :=
 |
  1040 ++*..   :  : :  :               :  :          .. : :  +   : :     : =
 |
  1030 ++   *. :  : :  :       *       :  :   .*    *   : :   *.*  :     : =
 |
       *      *   : :   *    .. +  .*  :   :.*  +  :     *         :     : =
 |
  1020 ++          ::    :  *    *. :  :   *     + :                :    : =
 |
  1010 ++          :     : :         : :          *                 :   :  =
 |
  1000 ++          *      ::         ::                             :   :  =
 |
   990 ++                 *           :                             :   :  =
 |
       |                              *                              : :   =
 |
   980 ++                                                            *.*   =
 |
   970 ++------------------------------------------------------------------=
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
  20 ++                    :    :                                    *     =
 |
     |                     :    :                                  .. +    =
 |
  15 *+*..*.*..*.*..*.*..*.*    *.*..*.*..*.*..*.*..*.*.*..*.*..*.*    *..*=
.*
  10 ++--------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[57]:/.utilization_load_avg

  1160 ++------------------------------------------------------------------=
-+
  1140 ++                                                                  =
 *
       |                                                                   =
 |
  1120 ++                             *                                    =
 |
  1100 ++                             :                                    =
:|
       |                             : :                               *   =
:|
  1080 ++                            : :                               ::  =
:|
  1060 ++*..*    *.*.*..*.         .*   :                     *       :  : =
:|
  1040 ++:   :  +         *     .*.     *                    + :  *   :  ::=
 |
       |:    : +           +  .*         :    .*..  *    *. +  : + :  :   *=
 |
  1020 ++     *             *.            :  *     + :   : *    *   : :    =
 |
  1000 *+                                 : +     *   : :           ::     =
 |
       |                                   *          : :            *     =
 |
   980 ++                                              *                   =
 |
   960 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[58]:/.runnable_load_avg

  18 ++-----------------------------------------------*--------------------=
-+
     |                                                :                    =
 |
     |                                                ::                   =
 |
  17 ++                                              : :                   =
 |
     |                                               : :                   =
 |
     |                                               : :                   =
 |
  16 ++                                              :  :                  =
 |
     |                                               :  :                  =
 |
  15 ++*            *      *.*              *        :  *..*               =
 |
     |: +          + :    :   :            : +      :       :              =
 |
     |:  +        +  :    :   :            :  +     :       :              =
 |
  14 *+   *.*    *    *..*     :  *..*.*..*    *.*..*        *..*.*..*    *=
.*
     |       +  :              : :                                    :  + =
 |
     |        + :               ::                                    : +  =
 |
  13 ++--------*----------------*--------------------------------------*---=
-+


                   sched_debug.cfs_rq[58]:/.utilization_load_avg

  1100 ++------------------------------------------------------------------=
-+
       |             *                                                     =
 |
  1090 ++            :                                                     =
 |
  1080 ++            ::                                *.*                 =
 |
       |            : :                                : :                 =
 |
  1070 ++           : :                               :   :                =
 |
  1060 ++     *     : :     *..              *        :   :                =
 |
       |     : :    :  :    :         *.*.. : :       :   :                =
 |
  1050 ++    :  :   :  :   :   *      :     : :       :    :               =
 |
  1040 ++*..*   :   :  :   :   :     :     *   *..   :     *..             =
 |
       |+        * :   :  *     :    :            *  :                     =
 |
  1030 *+         +:    ::      :   :              : :        *.*          =
 |
  1020 ++          *    ::      :   *              ::            :       .*=
.*
       |                *        :..                *            :  .*.*.  =
 |
  1010 ++------------------------*--------------------------------*--------=
-+


                     sched_debug.cfs_rq[58]:/.tg_load_contrib

  180 ++-------------------------------------------------------------------=
-+
      |             *                                                      =
 |
  160 ++            :                                                      =
 |
  140 ++            ::                                                     =
 |
      |            : :                                                     =
 |
  120 ++        *  : :   *                               *           *     =
 |
  100 ++        :  : :   :                              ::           :     =
 |
      |        : : :  :  ::                             : :         : :    =
 |
   80 ++       : : :  : : :               *            :  :         : :    =
 |
   60 ++       : : :  : :  :              ::     *    *   :         : :    =
 *
      |       :  ::   : :  :         *   : :    : :   :    :       :  :    =
 |
   40 ++      :   :    ::  :  *..   : +  :  :   :  : :     *..     :   :   =
:|
   20 ++*..  :    *    :    :+      :  +:   : .*   : :            :    :   =
:|
      *    *.*         *    *    *.*    *    *      *         *.*.*    *..*=
 |
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
  16 ++            : :                                                     =
 |
     |             : :                                                     =
 |
  15 ++           :   :    *    *           *..       *                    =
 |
     |            :   :   + + .. +          :         :+                   =
 |
  14 *+   *.*..*  :   *..*   *    *..*.*   :   *.*   :  *..*.*..*          =
 *
     |:  +      : :                     +  :      :  :           :         =
:|
     |: +       ::                       +:       :  :           :         =
:|
  13 ++*         *                        *        : :            *..*.*..*=
 |
     |                                             ::                      =
 |
  12 ++---------------------------------------------*----------------------=
-+


                   sched_debug.cfs_rq[59]:/.utilization_load_avg

  1100 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  1080 ++            *                                                     =
 |
       |             :                                                     =
 |
       |             ::        *                                           =
 |
  1060 ++     *      ::      .. +            *         *                   =
 *
       *     + :    : :     *    *..*   *    :+        ::  *..             =
 |
  1040 ++   *   :   :  :   +         :  ::  :  *      : : :                =
:|
       |:  :    :   :  :  *          : :  : :   :     :  ::   *.           =
:|
  1020 ++  :     *  :  :  :           ::  ::     :    :  *      *          =
:|
       | ::      :  :  : :            *    *     :   :           :     *..:=
 |
       | *        : :   ::                        *  :           :    +   *=
 |
  1000 ++         ::    *                          +:             *..*     =
 |
       |           :                                *                      =
 |
   980 ++----------*-------------------------------------------------------=
-+


                     sched_debug.cfs_rq[59]:/.tg_load_contrib

  300 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  250 ++                                         *                         =
 |
      |                                          ::                        =
 |
      |                                          ::                        =
 |
  200 ++                                        :  :                       =
 |
      |                                         :  :                       =
 |
  150 ++                                        :   :                      =
 |
      |                 .*                      :   *                      =
 |
  100 ++               *  :                    :    :                      =
 |
      |         *     :   :             *.*    :     :               *     =
 |
      |       .. :    :    :  *..     ..   +   *     :       .*     + :    =
 |
   50 ++    .*   :   :     : +      .*      + +       :   .*.  +   +  :    =
 |
      *.*..*      *.*       *    *.*         *        *..*      *.*    *..*=
.*
    0 ++-------------------------------------------------------------------=
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
  15 ++                          .*    *    :                        *.    =
 |
  14 *+*..*.*..*.*..*.*..*   *..*  +  :     *..     *.*.*..     *   +  *..*=
 |
     |                    + +       + :           ..          .. + +       =
+|
  13 ++--------------------*---------*---------*-*---------*-*----*--------=
-*


                   sched_debug.cfs_rq[60]:/.utilization_load_avg

  1140 ++------------------------------------------------------------------=
-+
       |                                   *                               =
 |
  1120 ++                                 ::                               =
 |
  1100 ++                           *     : :                              =
 |
       |                            :    :  :                              =
 |
  1080 ++        *             *   : :   :  :                              =
 |
  1060 ++       + :           ::   : :  *   :                              =
 |
       |       +  :           : :  : :  :    :      *..                    =
 |
  1040 ++*.. .*    :    *.*. :  : :  : :     *     :   *.       *         *=
 |
  1020 ++   *      *. ..    *   : :   ::     :     :     *     + +  .*   : =
:|
       *             *          : :   *       :   *       :   *   *.  :  : =
:|
  1000 ++                        :            :  +        :  +        : :  =
 |
   980 ++                        *             :+          :+          ::  =
 *
       |                                       *           *           *   =
 |
   960 ++------------------------------------------------------------------=
-+


                    sched_debug.cfs_rq[61]:/.runnable_load_avg

    15 ++-----*---------*--------------------*-*-----------*---------------=
-+
       |      :        ::                    : :           ::              =
 |
  14.5 ++    : :       : :                   :  :         : :              =
 |
       |     : :      :  :                  :   :         :  :             =
 |
       |    :  :      :   :                 :   :        :   :             =
 |
    14 *+   *   :  *.*    *.*..*    *   *   :    :  *    *    *.*.*        =
 |
       |:  :    :  :           :    :   ::  :    :  ::   :         :       =
 |
  13.5 ++  :    : :            :   ::   : ::     : :  : :           :      =
 |
       | ::      ::             :  : : :  ::      ::  : :           :      =
 |
    13 ++*       *              :  : : :   *      *    *             *.*..*=
.*
       |                        : :  : :                                   =
 |
       |                        : :  : :                                   =
 |
  12.5 ++                        ::   :                                    =
 |
       |                         :    :                                    =
 |
    12 ++------------------------*----*------------------------------------=
-+


                   sched_debug.cfs_rq[61]:/.utilization_load_avg

  1120 ++---------------------------*--------------------------------------=
-+
       |                            :                                      =
 |
  1100 ++                          : :                                     =
 |
  1080 ++               *          : :       *                             =
 |
       |              .. :         : :       :+                            =
 |
  1060 ++            *   :         : :      :  *    *..  *                 =
 |
  1040 ++   *.      :     :       :   :     :   +  :    + :   *            =
 |
       *   +  *..   :     *.  .*  :   *.*.. :    + :   *  : .. + .*        =
 |
  1020 ++ +      *.*        *.  : :        :      *        *    *  :   *..*=
.|
  1000 ++*                      : :        *                       :   :   =
 *
       |                         :                                  : :    =
 |
   980 ++                        *                                  : :    =
 |
   960 ++                                                            :     =
 |
       |                                                             *     =
 |
   940 ++------------------------------------------------------------------=
-+


                    sched_debug.cfs_rq[62]:/.runnable_load_avg

    16 ++-----------------------------*------------------------------------=
-+
       |                              :                                    =
 |
  15.5 ++                             :                                    =
 |
       |                              ::                                   =
 |
       |                             : :                                   =
 |
    15 ++   *.*                      : :       *         *                *=
 |
       |    :  :                     : :       ::        ::              : =
:|
  14.5 ++  :    :                    :  :      : :      : :              : =
:|
       |   :    :                    :  :     :  :      :  :            :  =
 |
    14 *+  :     *.*.*..*.*.*..*     :  *..*  :   *.*..*   *..*.*.*..*.*   =
 *
       |  :                    :     :     :  :                            =
 |
       |: :                     :   :       : :                            =
 |
  13.5 ++ :                     :   :       ::                             =
 |
       | :                       :  :        :                             =
 |
    13 ++*-----------------------*--*--------*-----------------------------=
-+


                   sched_debug.cfs_rq[62]:/.utilization_load_avg

  1140 ++-----------------------------*------------------------------------=
-+
       |                              :                                    =
 |
  1120 ++                             :                                    =
 |
  1100 ++                            : :                                   =
 |
       |                             : :   *                               =
 |
  1080 ++     *      *               : :  ::                    *         *=
.*
  1060 ++    : +    : :              : :  : :  *..       *     : :       : =
 |
       |     :  +   :  :             :  ::  :  :         ::    : :       : =
 |
  1040 ++   *    *.*   : .*         :   ::  : :   *.*.. : :  .*   :     :  =
 |
  1020 *+  :            *  +  .*.   :   *   : :         :  *.     *..*.*   =
 |
       |:  :                *.   *..*        :         *                   =
 |
  1000 ++ :                                  *                             =
 |
   980 ++::                                                                =
 |
       | *                                                                 =
 |
   960 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[63]:/.runnable_load_avg

  19 ++----------------------------------------*---------------------------=
-+
     |                                         :                           =
 |
  18 ++                                        :                           =
 |
     |                                        : :                          =
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
  15 *+*..*.*..*               :  *   :      :   :  *   *    *             =
 *
     |          :             :       :      :   : + : : +  : +            =
 |
     |          :             :        :    :    :+  : :  + :  +           =
:|
  14 ++          *..*.*..*.*.*         *..*.*    *    *    *    *.*..  *.. =
:|
     |                                                                +   :=
 |
  13 ++--------------------------------------------------------------*----*=
-+


                   sched_debug.cfs_rq[63]:/.utilization_load_avg

  1140 ++-----------------------------*------------------------------------=
-+
       |                              :                                    =
 |
  1120 ++                             :                                    =
 |
  1100 ++*                           : :                                   =
 |
       | ::                          : :                                   =
 |
  1080 ++  :                         : :                               *   =
 |
       |:  :                   *.*   : :                               :   =
 |
  1060 *+   *                 +   + :   :                *.*..*   *    ::  =
 |
       |     :            *. +     +:   :               +      : : :  : :  =
 |
  1040 ++    :     *.*.. +  *       *   *..*.*        .*       : : :  :  : =
 |
  1020 ++     *    :    *                     :     *.          *   : :  : =
 *
       |       +  :                           :     :               : :  : =
:|
  1000 ++       + :                            *.. :                 :    :=
:|
       |         *                                 :                 *    *=
 |
   980 ++-----------------------------------------*------------------------=
-+


    latency_stats.hits.hrtimer_nanosleep.SyS_nanosleep.entry_SYSCALL_64_fas=
tpath

  50000 ++-----------------------------------------------------------------=
-+
  45000 ++                   *          *                                  =
 |
        |                   +:        .. +                                 =
 |
  40000 ++                 +  :      *    +    *...                        =
 |
  35000 ++                *   :      :     + ..    *..                     =
 |
        |                 :   :     :       *         .                    =
 |
  30000 ++               :     :    :                  *..  ..*..          =
 |
  25000 ++               :     :   :                      *.     *...      =
 |
  20000 ++              :       :  :                                 *..  .=
.*
        |               :       : :                                     *. =
 |
  15000 ++              :       : :                                        =
 |
  10000 ++             :         :                                         =
 |
        |              :         *                                         =
 |
   5000 ++            :                                                    =
 |
      0 *+--*--*---*--*----------------------------------------------------=
-+


     latency_stats.sum.hrtimer_nanosleep.SyS_nanosleep.entry_SYSCALL_64_fas=
tpath

  3.5e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    3e+06 ++                   *         *                                 =
 |
          |                  ..:       .. +                                =
 |
  2.5e+06 ++                .   :     *    +    *...                       =
 |
          |                *    :     :     + ..    *..                    =
 |
    2e+06 ++               :    :    :       *                             =
 |
          |               :      :   :                 *...*..*...         =
 |
  1.5e+06 ++              :      :  :                             *..      =
 |
          |               :      :  :                                *...*.=
.*
    1e+06 ++             :       : :                                       =
 |
          |              :        ::                                       =
 |
   500000 ++             :        *                                        =
 |
          |             :                                                  =
 |
        0 *+-*---*--*---*--------------------------------------------------=
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
-------------------------------------
lkp(a)eclists.intel.com
https://eclists.intel.com/sympa/info/lkp
Unsubscribe by sending email to sympa(a)eclists.intel.com with subject "Uns=
ubscribe lkp"

--===============3711802981257550927==
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
ZGVmYXVsdC13YXRjaGRvZ3M6CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjcHVmcmVxX2dv
dmVybm9yOiBwZXJmb3JtYW5jZQptb2RlbDogTmVoYWxlbS1FWAptZW1vcnk6IDI1NkcKbnJfc3Nk
X3BhcnRpdGlvbnM6IDYKc3NkX3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLUlOVEVM
X1NTRCpwYXJ0MSIKc3dhcF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1XRENfV0Qx
MEVBUlMtMDBZNUIxX1dELVdDQVY1RjA1OTA3NC1wYXJ0MiIKbnJfdGhyZWFkczogMjAwJQppdGVy
YXRpb25zOiAxMDB4CmViaXp6eToKICBkdXJhdGlvbjogMTBzCmJyYW5jaDogeXV5YW5nLXRpcC9m
b3ItbGtwCmNvbW1pdDogNzY0OTc5ZWE1YTM4YWMzMTAzZjJmNGU5MzQ3ZWMxZjc1YzU2NzJiZApx
dWV1ZTogdW5pdApyZXBlYXRfdG86IDIKdGVzdGJveDogbGtwLW5leDA0CnRib3hfZ3JvdXA6IGxr
cC1uZXgwNAprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTUtMDYtMTkgMTc6
NTA6NDIuOTc0Mjc5ODY5ICswODowMAp1c2VyOiBsa3AKY29tcGlsZXI6IGdjYy00LjkKaGVhZF9j
b21taXQ6IDc2NDk3OWVhNWEzOGFjMzEwM2YyZjRlOTM0N2VjMWY3NWM1NjcyYmQKYmFzZV9jb21t
aXQ6IGZhMTZjMWJmM2M0NzE3ZjgyYjljY2NhNjExNTY2NTYwNjhlMGIxNGMKa2VybmVsOiAiL3Br
Zy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45Lzc2NDk3OWVhNWEzOGFjMzEwM2YyZjRlOTM0N2Vj
MWY3NWM1NjcyYmQvdm1saW51ei00LjEuMC1yYzgtMDI2NDItZzc2NDk3OWUiCnJvb3RmczogZGVi
aWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnegpyZXN1bHRfcm9vdDogIi9yZXN1bHQvZWJpenp5L3Bl
cmZvcm1hbmNlLTIwMCUtMTAweC0xMHMvbGtwLW5leDA0L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS83NjQ5NzllYTVhMzhhYzMxMDNmMmY0ZTkzNDdlYzFm
NzVjNTY3MmJkLzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvbGtwLW5leDA0L3VuaXRfZWJp
enp5LXBlcmZvcm1hbmNlLTIwMCUtMTAweC0xMHMteDg2XzY0LXJoZWwtSEVBRC03NjQ5NzllYTVh
MzhhYzMxMDNmMmY0ZTkzNDdlYzFmNzVjNTY3MmJkLTAtMjAxNTA2MTktMTc3NDEtMXV2dzhtcC55
YW1sIgpkZXF1ZXVlX3RpbWU6IDIwMTUtMDYtMjAgMDc6MTI6MTIuMTcxOTI5OTc4ICswODowMApu
cl9jcHU6ICIkKG5wcm9jKSIKbWF4X3VwdGltZTogMjc2OS42MDAwMDAwMDAwMDA0CmluaXRyZDog
Ii9vc2ltYWdlL2RlYmlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpib290bG9hZGVy
X2FwcGVuZDoKLSByb290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Avc2NoZWR1bGVk
L2xrcC1uZXgwNC91bml0X2ViaXp6eS1wZXJmb3JtYW5jZS0yMDAlLTEwMHgtMTBzLXg4Nl82NC1y
aGVsLUhFQUQtNzY0OTc5ZWE1YTM4YWMzMTAzZjJmNGU5MzQ3ZWMxZjc1YzU2NzJiZC0wLTIwMTUw
NjE5LTE3NzQxLTF1dnc4bXAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhl
bAotIGJyYW5jaD15dXlhbmctdGlwL2Zvci1sa3AKLSBjb21taXQ9NzY0OTc5ZWE1YTM4YWMzMTAz
ZjJmNGU5MzQ3ZWMxZjc1YzU2NzJiZAotIEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQtcmhl
bC9nY2MtNC45Lzc2NDk3OWVhNWEzOGFjMzEwM2YyZjRlOTM0N2VjMWY3NWM1NjcyYmQvdm1saW51
ei00LjEuMC1yYzgtMDI2NDItZzc2NDk3OWUKLSBtYXhfdXB0aW1lPTI3NjkKLSBSRVNVTFRfUk9P
VD0vcmVzdWx0L2ViaXp6eS9wZXJmb3JtYW5jZS0yMDAlLTEwMHgtMTBzL2xrcC1uZXgwNC9kZWJp
YW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvNzY0OTc5ZWE1YTM4
YWMzMTAzZjJmNGU5MzQ3ZWMxZjc1YzU2NzJiZC8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgog
IGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBh
cGljPWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGlt
ZW91dD0xMDAKICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmlj
IG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5
UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtw
L2xrcC9sa3AteDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1y
aGVsL2djYy00LjkvNzY0OTc5ZWE1YTM4YWMzMTAzZjJmNGU5MzQ3ZWMxZjc1YzU2NzJiZC9tb2R1
bGVzLmNneiIKYm1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDIt
MDcuY2d6L2xrcC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6
L3J1bi1pcGNvbmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcu
Y2d6L3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5j
aG1hcmtzL2ViaXp6eS14ODZfNjQuY2d6Igpqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDEx
NC4xMyAxMjEuMTQgODQuMjQgMS82MDIgNDMwNTYKc3RhcnRfdGltZTogJzE0MzQ3NTU1OTUnCmVu
ZF90aW1lOiAnMTQzNDc1NjU5NycKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNTA2MjAtMDAw
MzUxIgo=

--===============3711802981257550927==
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

--===============3711802981257550927==--

