Content-Type: multipart/mixed; boundary="===============4348205780661068374=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [sched] 66b0f3b16cc: 21.7% ebizzy.throughput.per_thread.max
Date: Fri, 19 Jun 2015 15:09:31 +0800
Message-ID: <1434697771.21752.30.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4348205780661068374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://bee.sh.intel.com/git/ydu19/tip temp
commit 66b0f3b16ccfdef26d1ae20dca6ed73b2c6b4bcb ("sched: Rewrite runnable l=
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
  66b0f3b16ccfdef26d1ae20dca6ed73b2c6b4bcb

69aec05e924a239e 66b0f3b16ccfdef26d1ae20dca =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    117.70 =C2=B1  1%     +21.7%     143.20 =C2=B1  0%  ebizzy.throughput.p=
er_thread.max
      0.05 =C2=B1  9%    +118.4%       0.12 =C2=B1  1%  ebizzy.throughput.p=
er_thread.stddev_percent
   5205629 =C2=B1  0%      -8.8%    4747141 =C2=B1  0%  ebizzy.time.involun=
tary_context_switches
     44.86 =C2=B1  0%      -1.9%      44.02 =C2=B1  0%  ebizzy.time.user
      4501 =C2=B1  0%      -2.0%       4411 =C2=B1  0%  ebizzy.time.user_ti=
me
    214423 =C2=B1  8%     -26.8%     157027 =C2=B1  4%  cpuidle.C3-NHM.usage
    210.60 =C2=B1  7%     -27.1%     153.50 =C2=B1  4%  numa-vmstat.node1.n=
r_kernel_stack
      6368 =C2=B1  1%      -8.5%       5829 =C2=B1  0%  vmstat.system.cs
      5552 =C2=B1  2%     +13.7%       6311 =C2=B1  1%  numa-meminfo.node0.=
KernelStack
      3385 =C2=B1  7%     -27.3%       2461 =C2=B1  4%  numa-meminfo.node1.=
KernelStack
      2203 =C2=B1  5%     +19.3%       2629 =C2=B1  5%  numa-meminfo.node3.=
KernelStack
    808336 =C2=B1  3%     -22.5%     626837 =C2=B1  0%  proc-vmstat.numa_hi=
nt_faults_local
    146402 =C2=B1 19%    +106.9%     302878 =C2=B1  1%  proc-vmstat.numa_pa=
ges_migrated
    146402 =C2=B1 19%    +106.9%     302878 =C2=B1  1%  proc-vmstat.pgmigra=
te_success
      1138 =C2=B1 14%     +28.0%       1457 =C2=B1 10%  slabinfo.blkdev_ioc=
.active_objs
      1138 =C2=B1 14%     +28.0%       1457 =C2=B1 10%  slabinfo.blkdev_ioc=
.num_objs
      1254 =C2=B1 21%     +34.7%       1689 =C2=B1 12%  slabinfo.blkdev_req=
uests.active_objs
      1254 =C2=B1 21%     +34.7%       1689 =C2=B1 12%  slabinfo.blkdev_req=
uests.num_objs
      1429 =C2=B1 15%     +29.2%       1845 =C2=B1  9%  slabinfo.mnt_cache.=
active_objs
      1429 =C2=B1 15%     +29.2%       1845 =C2=B1  9%  slabinfo.mnt_cache.=
num_objs
    756.20 =C2=B1  7%     -41.8%     440.10 =C2=B1  3%  latency_stats.avg.c=
all_rwsem_down_read_failed.SyS_madvise.entry_SYSCALL_64_fastpath
      1361 =C2=B1  6%     -24.3%       1030 =C2=B1  1%  latency_stats.avg.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault
      3787 =C2=B1 17%     -42.1%       2191 =C2=B1  5%  latency_stats.avg.c=
all_rwsem_down_write_failed.SyS_mprotect.entry_SYSCALL_64_fastpath
      1924 =C2=B1  9%     -62.5%     722.00 =C2=B1  5%  latency_stats.avg.c=
all_rwsem_down_write_failed.vm_munmap.SyS_munmap.entry_SYSCALL_64_fastpath
    717.70 =C2=B1  3%     -18.2%     587.40 =C2=B1  1%  latency_stats.avg.d=
o_wait.SyS_wait4.entry_SYSCALL_64_fastpath
    952.10 =C2=B1 16%     +58.4%       1507 =C2=B1 13%  latency_stats.avg.e=
p_poll.SyS_epoll_wait.entry_SYSCALL_64_fastpath
    464.40 =C2=B1  4%     -16.5%     387.60 =C2=B1  1%  latency_stats.avg.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
      2990 =C2=B1  5%     -13.4%       2590 =C2=B1  5%  latency_stats.avg.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
      1496 =C2=B1  3%     +11.9%       1673 =C2=B1  4%  latency_stats.avg.w=
ait_on_page_bit.__migration_entry_wait.migration_entry_wait.handle_pte_faul=
t.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      2541 =C2=B1  2%     -12.4%       2226 =C2=B1  0%  latency_stats.avg.w=
ait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpa=
th
      3121 =C2=B1  4%     -25.7%       2320 =C2=B1  8%  latency_stats.hits.=
call_rwsem_down_read_failed.SyS_madvise.entry_SYSCALL_64_fastpath
      2319 =C2=B1  5%     -22.2%       1805 =C2=B1  4%  latency_stats.hits.=
call_rwsem_down_write_failed.SyS_mprotect.entry_SYSCALL_64_fastpath
     26304 =C2=B1  1%     -25.2%      19678 =C2=B1  1%  latency_stats.hits.=
pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
      4.60 =C2=B1 65%    +197.8%      13.70 =C2=B1 40%  latency_stats.hits.=
pipe_wait.pipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastp=
ath
     11014 =C2=B1 14%     -29.0%       7823 =C2=B1 12%  latency_stats.max.c=
all_rwsem_down_write_failed.vm_munmap.SyS_munmap.entry_SYSCALL_64_fastpath
   2359462 =C2=B1  7%     -56.7%    1020748 =C2=B1  6%  latency_stats.sum.c=
all_rwsem_down_read_failed.SyS_madvise.entry_SYSCALL_64_fastpath
 3.469e+08 =C2=B1 16%     -29.6%  2.443e+08 =C2=B1  2%  latency_stats.sum.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault
   8713241 =C2=B1 10%     -54.6%    3954210 =C2=B1  5%  latency_stats.sum.c=
all_rwsem_down_write_failed.SyS_mprotect.entry_SYSCALL_64_fastpath
  18472348 =C2=B1  4%     -18.2%   15112810 =C2=B1  5%  latency_stats.sum.c=
all_rwsem_down_write_failed.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.entry_SYS=
CALL_64_fastpath
  11300496 =C2=B1 10%     -66.6%    3771716 =C2=B1  7%  latency_stats.sum.c=
all_rwsem_down_write_failed.vm_munmap.SyS_munmap.entry_SYSCALL_64_fastpath
   5578435 =C2=B1  7%     -21.4%    4381874 =C2=B1  2%  latency_stats.sum.d=
o_wait.SyS_wait4.entry_SYSCALL_64_fastpath
  12235259 =C2=B1  5%     -37.6%    7637083 =C2=B1  2%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
     29907 =C2=B1  5%     -18.5%      24372 =C2=B1  9%  latency_stats.sum.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
  14649856 =C2=B1  5%     +19.6%   17525288 =C2=B1  4%  latency_stats.sum.w=
ait_on_page_bit.__migration_entry_wait.migration_entry_wait.handle_pte_faul=
t.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
   1513840 =C2=B1  2%     -13.2%    1314218 =C2=B1  1%  latency_stats.sum.w=
ait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpa=
th
  32834153 =C2=B1  0%     +17.8%   38669467 =C2=B1  1%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     69.10 =C2=B1 64%    +236.6%     232.60 =C2=B1 17%  sched_debug.cfs_rq[=
0]:/.nr_spread_over
     14.00 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.runnable_load_avg
      6244 =C2=B1 39%     -84.9%     940.80 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
     61.20 =C2=B1107%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
      1031 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.utilization_load_avg
     14.60 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
10]:/.runnable_load_avg
   1221910 =C2=B1 25%    -240.4%   -1716126 =C2=B1-49%  sched_debug.cfs_rq[=
10]:/.spread0
      5860 =C2=B1 43%     -83.9%     941.30 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
     77.10 =C2=B1109%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
10]:/.tg_load_contrib
      1041 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
10]:/.utilization_load_avg
     13.80 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.runnable_load_avg
   1229568 =C2=B1 38%    -233.0%   -1634940 =C2=B1-53%  sched_debug.cfs_rq[=
11]:/.spread0
      5820 =C2=B1 43%     -83.8%     941.20 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
     94.20 =C2=B1108%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.tg_load_contrib
      1022 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.utilization_load_avg
     84.80 =C2=B1133%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.blocked_load_avg
     13.70 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.runnable_load_avg
   1259738 =C2=B1 37%    -245.3%   -1830319 =C2=B1-32%  sched_debug.cfs_rq[=
12]:/.spread0
      5758 =C2=B1 42%     -83.7%     940.50 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
     99.00 =C2=B1114%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.tg_load_contrib
      1028 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.utilization_load_avg
    107.20 =C2=B1 81%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.blocked_load_avg
     14.10 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.runnable_load_avg
   1101157 =C2=B1 37%    -265.6%   -1823351 =C2=B1-49%  sched_debug.cfs_rq[=
13]:/.spread0
      5676 =C2=B1 42%     -83.4%     940.40 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
    121.90 =C2=B1 72%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.tg_load_contrib
      1042 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.utilization_load_avg
     98.20 =C2=B1 83%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.blocked_load_avg
     13.70 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.runnable_load_avg
   1185828 =C2=B1 31%    -248.2%   -1756859 =C2=B1-45%  sched_debug.cfs_rq[=
14]:/.spread0
      5668 =C2=B1 42%     -83.4%     940.50 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
    112.50 =C2=B1 72%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.tg_load_contrib
      1026 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.utilization_load_avg
      4.60 =C2=B1 53%    +678.3%      35.80 =C2=B1144%  sched_debug.cfs_rq[=
15]:/.nr_spread_over
     13.90 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.runnable_load_avg
    786517 =C2=B1 52%    -317.2%   -1708682 =C2=B1-38%  sched_debug.cfs_rq[=
15]:/.spread0
      5656 =C2=B1 43%     -83.4%     940.90 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
     96.30 =C2=B1 58%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.tg_load_contrib
      1037 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.utilization_load_avg
  33605942 =C2=B1  1%     +12.8%   37914951 =C2=B1  1%  sched_debug.cfs_rq[=
16]:/.min_vruntime
     14.50 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.runnable_load_avg
      5591 =C2=B1 43%     -83.2%     940.40 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.tg_load_avg
     79.30 =C2=B1 80%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.tg_load_contrib
      1051 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.utilization_load_avg
  33880249 =C2=B1  1%     +11.5%   37778734 =C2=B1  1%  sched_debug.cfs_rq[=
17]:/.min_vruntime
     13.90 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.runnable_load_avg
      5564 =C2=B1 44%     -83.1%     940.90 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.tg_load_avg
     99.20 =C2=B1 78%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.tg_load_contrib
      1030 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.utilization_load_avg
     69.00 =C2=B1 74%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.blocked_load_avg
  33673604 =C2=B1  1%     +11.7%   37615766 =C2=B1  1%  sched_debug.cfs_rq[=
18]:/.min_vruntime
     13.70 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.runnable_load_avg
      5549 =C2=B1 44%     -83.0%     940.80 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.tg_load_avg
     82.90 =C2=B1 61%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.tg_load_contrib
      1018 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.utilization_load_avg
  33855011 =C2=B1  2%     +10.6%   37458215 =C2=B1  1%  sched_debug.cfs_rq[=
19]:/.min_vruntime
     14.60 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.runnable_load_avg
      5506 =C2=B1 43%     -82.9%     940.80 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.tg_load_avg
     92.00 =C2=B1 73%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.tg_load_contrib
      1026 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.utilization_load_avg
  32922723 =C2=B1  0%     +11.8%   36820587 =C2=B1  1%  sched_debug.cfs_rq[=
1]:/.min_vruntime
     13.90 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
     88390 =C2=B1332%   -2191.8%   -1848984 =C2=B1-37%  sched_debug.cfs_rq[=
1]:/.spread0
      6229 =C2=B1 40%     -84.9%     940.40 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
     42.50 =C2=B1108%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
      1030 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.utilization_load_avg
  33881670 =C2=B1  1%     +11.9%   37898987 =C2=B1  1%  sched_debug.cfs_rq[=
20]:/.min_vruntime
      1.70 =C2=B1126%   +1641.2%      29.60 =C2=B1115%  sched_debug.cfs_rq[=
20]:/.nr_spread_over
     14.00 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.runnable_load_avg
   1046003 =C2=B1 53%    -173.9%    -773140 =C2=B1-91%  sched_debug.cfs_rq[=
20]:/.spread0
      5461 =C2=B1 43%     -82.8%     941.20 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.tg_load_avg
     67.90 =C2=B1 78%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.tg_load_contrib
      1033 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.utilization_load_avg
  33643963 =C2=B1  1%     +11.7%   37580155 =C2=B1  1%  sched_debug.cfs_rq[=
21]:/.min_vruntime
     14.40 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.runnable_load_avg
      5440 =C2=B1 42%     -82.7%     940.80 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.tg_load_avg
     71.20 =C2=B1 82%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.tg_load_contrib
      1035 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.utilization_load_avg
  33662992 =C2=B1  1%     +11.8%   37640608 =C2=B1  2%  sched_debug.cfs_rq[=
22]:/.min_vruntime
     15.00 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.runnable_load_avg
      5433 =C2=B1 42%     -82.7%     940.80 =C2=B1  0%  sched_debug.cfs_rq[=
22]:/.tg_load_avg
     76.00 =C2=B1 85%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.tg_load_contrib
      1048 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.utilization_load_avg
  33314446 =C2=B1  1%     +13.3%   37752799 =C2=B1  1%  sched_debug.cfs_rq[=
23]:/.min_vruntime
      2.20 =C2=B1121%   +3109.1%      70.60 =C2=B1 88%  sched_debug.cfs_rq[=
23]:/.nr_spread_over
     13.90 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
23]:/.runnable_load_avg
      5441 =C2=B1 43%     -82.7%     941.10 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.tg_load_avg
     84.00 =C2=B1 56%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
23]:/.tg_load_contrib
      1021 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
23]:/.utilization_load_avg
  32890975 =C2=B1  1%     +14.3%   37598483 =C2=B1  1%  sched_debug.cfs_rq[=
24]:/.min_vruntime
     14.10 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.runnable_load_avg
      5360 =C2=B1 43%     -82.4%     941.70 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.tg_load_avg
     54.20 =C2=B1 67%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.tg_load_contrib
      1031 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.utilization_load_avg
  32996974 =C2=B1  1%     +13.4%   37432055 =C2=B1  1%  sched_debug.cfs_rq[=
25]:/.min_vruntime
     14.50 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.runnable_load_avg
      5326 =C2=B1 44%     -82.3%     941.40 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.tg_load_avg
     71.30 =C2=B1 91%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.tg_load_contrib
      1050 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.utilization_load_avg
     52.40 =C2=B1115%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.blocked_load_avg
  33127889 =C2=B1  1%     +13.5%   37587535 =C2=B1  2%  sched_debug.cfs_rq[=
26]:/.min_vruntime
     14.70 =C2=B1 17%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.runnable_load_avg
      5345 =C2=B1 44%     -82.4%     941.50 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.tg_load_avg
     67.40 =C2=B1 88%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.tg_load_contrib
      1033 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.utilization_load_avg
  33165596 =C2=B1  1%     +13.9%   37767085 =C2=B1  1%  sched_debug.cfs_rq[=
27]:/.min_vruntime
     14.50 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.runnable_load_avg
      5322 =C2=B1 44%     -82.3%     941.60 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.tg_load_avg
     96.10 =C2=B1 78%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.tg_load_contrib
      1051 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.utilization_load_avg
  33028387 =C2=B1  1%     +14.2%   37725856 =C2=B1  2%  sched_debug.cfs_rq[=
28]:/.min_vruntime
     13.60 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.runnable_load_avg
      5317 =C2=B1 44%     -82.3%     941.60 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.tg_load_avg
    110.80 =C2=B1 91%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.tg_load_contrib
      1013 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.utilization_load_avg
  33004132 =C2=B1  0%     +14.2%   37695827 =C2=B1  2%  sched_debug.cfs_rq[=
29]:/.min_vruntime
     14.80 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
29]:/.runnable_load_avg
      5297 =C2=B1 43%     -82.2%     941.90 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.tg_load_avg
    100.40 =C2=B1114%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
29]:/.tg_load_contrib
      1036 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
29]:/.utilization_load_avg
  33022220 =C2=B1  0%     +11.7%   36870013 =C2=B1  2%  sched_debug.cfs_rq[=
2]:/.min_vruntime
     13.80 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
    187870 =C2=B1177%   -1058.0%   -1799762 =C2=B1-47%  sched_debug.cfs_rq[=
2]:/.spread0
      6205 =C2=B1 40%     -84.9%     940.10 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
    178.70 =C2=B1113%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
      1022 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.utilization_load_avg
  33026863 =C2=B1  1%     +12.9%   37301677 =C2=B1  1%  sched_debug.cfs_rq[=
30]:/.min_vruntime
     13.80 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
30]:/.runnable_load_avg
    190413 =C2=B1287%    -820.3%   -1371622 =C2=B1-61%  sched_debug.cfs_rq[=
30]:/.spread0
      5285 =C2=B1 43%     -82.2%     941.90 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.tg_load_avg
     91.50 =C2=B1 79%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
30]:/.tg_load_contrib
      1022 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
30]:/.utilization_load_avg
  32768904 =C2=B1  1%     +14.1%   37395464 =C2=B1  1%  sched_debug.cfs_rq[=
31]:/.min_vruntime
     13.70 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.runnable_load_avg
      5258 =C2=B1 43%     -82.1%     942.20 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.tg_load_avg
     84.00 =C2=B1113%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.tg_load_contrib
      1022 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.utilization_load_avg
  32957365 =C2=B1  0%     +12.9%   37213196 =C2=B1  1%  sched_debug.cfs_rq[=
32]:/.min_vruntime
     20.60 =C2=B1 88%    +307.8%      84.00 =C2=B1 50%  sched_debug.cfs_rq[=
32]:/.nr_spread_over
     14.00 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
32]:/.runnable_load_avg
    120723 =C2=B1171%   -1309.7%   -1460365 =C2=B1-24%  sched_debug.cfs_rq[=
32]:/.spread0
      5219 =C2=B1 43%     -82.0%     941.80 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.tg_load_avg
     49.60 =C2=B1113%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
32]:/.tg_load_contrib
      1021 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
32]:/.utilization_load_avg
  33111907 =C2=B1  0%     +11.6%   36939635 =C2=B1  1%  sched_debug.cfs_rq[=
33]:/.min_vruntime
     13.70 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
33]:/.runnable_load_avg
    275159 =C2=B1129%    -730.2%   -1734011 =C2=B1-43%  sched_debug.cfs_rq[=
33]:/.spread0
      5160 =C2=B1 44%     -81.7%     942.60 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.tg_load_avg
     35.60 =C2=B1114%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
33]:/.tg_load_contrib
      1014 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
33]:/.utilization_load_avg
  33094533 =C2=B1  0%     +11.7%   36967949 =C2=B1  2%  sched_debug.cfs_rq[=
34]:/.min_vruntime
     15.60 =C2=B1 23%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
34]:/.runnable_load_avg
    257694 =C2=B1123%    -762.0%   -1705844 =C2=B1-36%  sched_debug.cfs_rq[=
34]:/.spread0
      5093 =C2=B1 45%     -81.5%     942.70 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.tg_load_avg
    106.90 =C2=B1112%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
34]:/.tg_load_contrib
      1044 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
34]:/.utilization_load_avg
  33134655 =C2=B1  1%     +11.1%   36796304 =C2=B1  1%  sched_debug.cfs_rq[=
35]:/.min_vruntime
     14.50 =C2=B1 22%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
35]:/.runnable_load_avg
    297753 =C2=B1156%    -730.6%   -1877582 =C2=B1-44%  sched_debug.cfs_rq[=
35]:/.spread0
      5018 =C2=B1 45%     -81.2%     942.40 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.tg_load_avg
     68.40 =C2=B1 99%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
35]:/.tg_load_contrib
      1021 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
35]:/.utilization_load_avg
  33052339 =C2=B1  1%     +11.8%   36951950 =C2=B1  2%  sched_debug.cfs_rq[=
36]:/.min_vruntime
     14.00 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
36]:/.runnable_load_avg
    215366 =C2=B1180%    -899.6%   -1722067 =C2=B1-43%  sched_debug.cfs_rq[=
36]:/.spread0
      4984 =C2=B1 46%     -81.1%     942.20 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.tg_load_avg
     77.10 =C2=B1 99%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
36]:/.tg_load_contrib
      1026 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
36]:/.utilization_load_avg
  32872426 =C2=B1  0%     +12.4%   36939827 =C2=B1  1%  sched_debug.cfs_rq[=
37]:/.min_vruntime
      1.10 =C2=B1188%   +2372.7%      27.20 =C2=B1152%  sched_debug.cfs_rq[=
37]:/.nr_spread_over
     14.00 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
37]:/.runnable_load_avg
     35376 =C2=B1889%   -5002.4%   -1734270 =C2=B1-26%  sched_debug.cfs_rq[=
37]:/.spread0
      4911 =C2=B1 43%     -80.8%     942.00 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.tg_load_avg
     67.10 =C2=B1104%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
37]:/.tg_load_contrib
      1026 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
37]:/.utilization_load_avg
  33020465 =C2=B1  1%     +10.6%   36510590 =C2=B1  1%  sched_debug.cfs_rq[=
38]:/.min_vruntime
     14.60 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
38]:/.runnable_load_avg
    183379 =C2=B1194%   -1279.9%   -2163649 =C2=B1-33%  sched_debug.cfs_rq[=
38]:/.spread0
      4913 =C2=B1 43%     -80.8%     941.70 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.tg_load_avg
     28.30 =C2=B1100%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
38]:/.tg_load_contrib
      1024 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
38]:/.utilization_load_avg
  32649942 =C2=B1  0%     +12.1%   36601134 =C2=B1  2%  sched_debug.cfs_rq[=
39]:/.min_vruntime
     14.20 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
39]:/.runnable_load_avg
   -187194 =C2=B1-154%   +1007.5%   -2073152 =C2=B1-27%  sched_debug.cfs_rq=
[39]:/.spread0
      4861 =C2=B1 44%     -80.6%     941.50 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.tg_load_avg
     83.70 =C2=B1108%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
39]:/.tg_load_contrib
      1025 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
39]:/.utilization_load_avg
  32997866 =C2=B1  1%     +10.8%   36573411 =C2=B1  1%  sched_debug.cfs_rq[=
3]:/.min_vruntime
     14.50 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
      6180 =C2=B1 40%     -84.8%     940.50 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
    135.40 =C2=B1100%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
      1034 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.utilization_load_avg
     13.90 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
40]:/.runnable_load_avg
   1234363 =C2=B1 39%    -202.5%   -1265034 =C2=B1-89%  sched_debug.cfs_rq[=
40]:/.spread0
      4866 =C2=B1 43%     -80.6%     942.00 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.tg_load_avg
     75.70 =C2=B1 96%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
40]:/.tg_load_contrib
      1034 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
40]:/.utilization_load_avg
     13.80 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
41]:/.runnable_load_avg
   1242936 =C2=B1 32%    -198.9%   -1229220 =C2=B1-67%  sched_debug.cfs_rq[=
41]:/.spread0
      4847 =C2=B1 44%     -80.6%     942.20 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.tg_load_avg
     91.80 =C2=B1 80%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
41]:/.tg_load_contrib
      1025 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
41]:/.utilization_load_avg
     13.80 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
42]:/.runnable_load_avg
   1309960 =C2=B1 31%    -215.1%   -1507974 =C2=B1-60%  sched_debug.cfs_rq[=
42]:/.spread0
      4834 =C2=B1 44%     -80.5%     941.80 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.tg_load_avg
     69.20 =C2=B1 68%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
42]:/.tg_load_contrib
      1042 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
42]:/.utilization_load_avg
     13.50 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
43]:/.runnable_load_avg
   1288476 =C2=B1 36%    -201.0%   -1301608 =C2=B1-68%  sched_debug.cfs_rq[=
43]:/.spread0
      4794 =C2=B1 45%     -80.4%     942.00 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.tg_load_avg
     32.70 =C2=B1 96%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
43]:/.tg_load_contrib
      1013 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
43]:/.utilization_load_avg
     13.50 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
44]:/.runnable_load_avg
   1444719 =C2=B1 35%    -212.4%   -1624486 =C2=B1-47%  sched_debug.cfs_rq[=
44]:/.spread0
      4793 =C2=B1 44%     -80.4%     941.80 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.tg_load_avg
     73.30 =C2=B1 53%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
44]:/.tg_load_contrib
      1040 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
44]:/.utilization_load_avg
     85.20 =C2=B1100%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
45]:/.blocked_load_avg
  33995676 =C2=B1  1%      +9.6%   37245540 =C2=B1  1%  sched_debug.cfs_rq[=
45]:/.min_vruntime
     15.20 =C2=B1 30%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
45]:/.runnable_load_avg
   1158251 =C2=B1 26%    -223.4%   -1429563 =C2=B1-50%  sched_debug.cfs_rq[=
45]:/.spread0
      4755 =C2=B1 44%     -80.2%     942.20 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.tg_load_avg
    100.70 =C2=B1 88%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
45]:/.tg_load_contrib
      1022 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
45]:/.utilization_load_avg
  34078137 =C2=B1  0%     +10.3%   37573183 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.min_vruntime
     13.80 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
46]:/.runnable_load_avg
   1240663 =C2=B1 27%    -188.8%   -1102006 =C2=B1-74%  sched_debug.cfs_rq[=
46]:/.spread0
      4734 =C2=B1 44%     -80.1%     941.70 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.tg_load_avg
     89.70 =C2=B1 94%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
46]:/.tg_load_contrib
      1027 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
46]:/.utilization_load_avg
  33683724 =C2=B1  1%     +10.9%   37351384 =C2=B1  1%  sched_debug.cfs_rq[=
47]:/.min_vruntime
     14.10 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
47]:/.runnable_load_avg
    846204 =C2=B1 51%    -256.5%   -1323945 =C2=B1-45%  sched_debug.cfs_rq[=
47]:/.spread0
      4671 =C2=B1 41%     -79.8%     941.90 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.tg_load_avg
     85.60 =C2=B1 44%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
47]:/.tg_load_contrib
      1029 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
47]:/.utilization_load_avg
  33744780 =C2=B1  1%     +13.2%   38210214 =C2=B1  1%  sched_debug.cfs_rq[=
48]:/.min_vruntime
     14.20 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
48]:/.runnable_load_avg
      4650 =C2=B1 41%     -79.7%     941.80 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.tg_load_avg
     66.10 =C2=B1 78%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
48]:/.tg_load_contrib
      1036 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
48]:/.utilization_load_avg
  33992243 =C2=B1  1%     +11.6%   37936853 =C2=B1  1%  sched_debug.cfs_rq[=
49]:/.min_vruntime
     13.90 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
49]:/.runnable_load_avg
   1154619 =C2=B1 50%    -164.0%    -738643 =C2=B1-109%  sched_debug.cfs_rq=
[49]:/.spread0
      4645 =C2=B1 41%     -79.7%     942.20 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.tg_load_avg
     52.30 =C2=B1 77%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
49]:/.tg_load_contrib
      1022 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
49]:/.utilization_load_avg
  32958620 =C2=B1  1%     +11.4%   36707057 =C2=B1  1%  sched_debug.cfs_rq[=
4]:/.min_vruntime
     14.40 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.runnable_load_avg
    124108 =C2=B1333%   -1681.5%   -1962817 =C2=B1-28%  sched_debug.cfs_rq[=
4]:/.spread0
      6105 =C2=B1 41%     -84.6%     940.30 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
    107.60 =C2=B1131%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
      1044 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.utilization_load_avg
  33720413 =C2=B1  1%     +11.8%   37684974 =C2=B1  0%  sched_debug.cfs_rq[=
50]:/.min_vruntime
     14.30 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
50]:/.runnable_load_avg
    882727 =C2=B1 56%    -212.2%    -990621 =C2=B1-82%  sched_debug.cfs_rq[=
50]:/.spread0
      4592 =C2=B1 42%     -79.5%     942.00 =C2=B1  0%  sched_debug.cfs_rq[=
50]:/.tg_load_avg
     79.60 =C2=B1 58%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
50]:/.tg_load_contrib
      1023 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
50]:/.utilization_load_avg
  33982195 =C2=B1  2%     +11.5%   37883919 =C2=B1  1%  sched_debug.cfs_rq[=
51]:/.min_vruntime
      2.20 =C2=B1255%   +2504.5%      57.30 =C2=B1106%  sched_debug.cfs_rq[=
51]:/.nr_spread_over
     13.80 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
51]:/.runnable_load_avg
      4580 =C2=B1 42%     -79.4%     942.20 =C2=B1  0%  sched_debug.cfs_rq[=
51]:/.tg_load_avg
     73.30 =C2=B1 89%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
51]:/.tg_load_contrib
      1034 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
51]:/.utilization_load_avg
  33882830 =C2=B1  1%     +11.2%   37692720 =C2=B1  1%  sched_debug.cfs_rq[=
52]:/.min_vruntime
     13.90 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
52]:/.runnable_load_avg
   1045016 =C2=B1 59%    -194.1%    -983095 =C2=B1-75%  sched_debug.cfs_rq[=
52]:/.spread0
      4574 =C2=B1 43%     -79.4%     942.70 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.tg_load_avg
     81.00 =C2=B1 62%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
52]:/.tg_load_contrib
      1033 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
52]:/.utilization_load_avg
  33766641 =C2=B1  1%     +11.5%   37634143 =C2=B1  1%  sched_debug.cfs_rq[=
53]:/.min_vruntime
      0.50 =C2=B1161%   +5340.0%      27.20 =C2=B1115%  sched_debug.cfs_rq[=
53]:/.nr_spread_over
     13.40 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
53]:/.runnable_load_avg
      4572 =C2=B1 42%     -79.4%     942.80 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.tg_load_avg
     61.90 =C2=B1 82%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
53]:/.tg_load_contrib
      1031 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
53]:/.utilization_load_avg
     57.90 =C2=B1 90%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
54]:/.blocked_load_avg
  33940155 =C2=B1  1%     +11.4%   37824474 =C2=B1  1%  sched_debug.cfs_rq[=
54]:/.min_vruntime
     14.30 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
54]:/.runnable_load_avg
   1102161 =C2=B1 63%    -177.3%    -851502 =C2=B1-73%  sched_debug.cfs_rq[=
54]:/.spread0
      4552 =C2=B1 41%     -79.3%     942.70 =C2=B1  0%  sched_debug.cfs_rq[=
54]:/.tg_load_avg
     72.30 =C2=B1 71%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
54]:/.tg_load_contrib
      1036 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
54]:/.utilization_load_avg
  33295741 =C2=B1  1%     +14.2%   38039482 =C2=B1  1%  sched_debug.cfs_rq[=
55]:/.min_vruntime
     13.90 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
55]:/.runnable_load_avg
      4535 =C2=B1 41%     -79.2%     942.20 =C2=B1  0%  sched_debug.cfs_rq[=
55]:/.tg_load_avg
     43.10 =C2=B1 41%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
55]:/.tg_load_contrib
      1022 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
55]:/.utilization_load_avg
  32932658 =C2=B1  1%     +14.2%   37596506 =C2=B1  1%  sched_debug.cfs_rq[=
56]:/.min_vruntime
     14.00 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
56]:/.runnable_load_avg
      4466 =C2=B1 42%     -78.9%     941.60 =C2=B1  0%  sched_debug.cfs_rq[=
56]:/.tg_load_avg
     56.20 =C2=B1 67%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
56]:/.tg_load_contrib
      1040 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
56]:/.utilization_load_avg
  33099246 =C2=B1  1%     +13.2%   37480903 =C2=B1  1%  sched_debug.cfs_rq[=
57]:/.min_vruntime
      1.70 =C2=B1 59%   +1000.0%      18.70 =C2=B1110%  sched_debug.cfs_rq[=
57]:/.nr_spread_over
     14.30 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
57]:/.runnable_load_avg
      4463 =C2=B1 42%     -78.9%     942.10 =C2=B1  0%  sched_debug.cfs_rq[=
57]:/.tg_load_avg
     67.90 =C2=B1111%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
57]:/.tg_load_contrib
      1022 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
57]:/.utilization_load_avg
  33202874 =C2=B1  1%     +13.9%   37829170 =C2=B1  1%  sched_debug.cfs_rq[=
58]:/.min_vruntime
     14.10 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
58]:/.runnable_load_avg
      4442 =C2=B1 43%     -78.8%     942.10 =C2=B1  0%  sched_debug.cfs_rq[=
58]:/.tg_load_avg
     56.00 =C2=B1 87%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
58]:/.tg_load_contrib
      1018 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
58]:/.utilization_load_avg
  33227042 =C2=B1  1%     +13.7%   37794431 =C2=B1  2%  sched_debug.cfs_rq[=
59]:/.min_vruntime
      7.25 =C2=B1218%    +749.7%      61.60 =C2=B1107%  sched_debug.cfs_rq[=
59]:/.nr_spread_over
     14.10 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
59]:/.runnable_load_avg
    388582 =C2=B1 93%    -327.0%    -882076 =C2=B1-106%  sched_debug.cfs_rq=
[59]:/.spread0
      4458 =C2=B1 42%     -78.9%     941.30 =C2=B1  0%  sched_debug.cfs_rq[=
59]:/.tg_load_avg
     87.20 =C2=B1 79%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
59]:/.tg_load_contrib
      1032 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
59]:/.utilization_load_avg
  32955689 =C2=B1  1%     +10.4%   36375995 =C2=B1  1%  sched_debug.cfs_rq[=
5]:/.min_vruntime
     14.20 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.runnable_load_avg
    121157 =C2=B1281%   -1993.6%   -2294247 =C2=B1-22%  sched_debug.cfs_rq[=
5]:/.spread0
      6121 =C2=B1 41%     -84.6%     940.20 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
     73.20 =C2=B1109%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.tg_load_contrib
      1031 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.utilization_load_avg
  33066767 =C2=B1  1%     +14.1%   37743137 =C2=B1  1%  sched_debug.cfs_rq[=
60]:/.min_vruntime
     13.90 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
60]:/.runnable_load_avg
      4438 =C2=B1 42%     -78.8%     941.90 =C2=B1  0%  sched_debug.cfs_rq[=
60]:/.tg_load_avg
     70.00 =C2=B1 66%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
60]:/.tg_load_contrib
      1023 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
60]:/.utilization_load_avg
  32984063 =C2=B1  1%     +14.9%   37910135 =C2=B1  2%  sched_debug.cfs_rq[=
61]:/.min_vruntime
     14.00 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
61]:/.runnable_load_avg
      4450 =C2=B1 42%     -78.8%     942.50 =C2=B1  0%  sched_debug.cfs_rq[=
61]:/.tg_load_avg
     50.40 =C2=B1117%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
61]:/.tg_load_contrib
      1041 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
61]:/.utilization_load_avg
  33050254 =C2=B1  1%     +15.0%   38012765 =C2=B1  1%  sched_debug.cfs_rq[=
62]:/.min_vruntime
     14.60 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
62]:/.runnable_load_avg
      4413 =C2=B1 43%     -78.6%     942.80 =C2=B1  0%  sched_debug.cfs_rq[=
62]:/.tg_load_avg
     49.20 =C2=B1101%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
62]:/.tg_load_contrib
      1048 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
62]:/.utilization_load_avg
  32698928 =C2=B1  1%     +15.6%   37815109 =C2=B1  2%  sched_debug.cfs_rq[=
63]:/.min_vruntime
     14.20 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
63]:/.runnable_load_avg
      4414 =C2=B1 43%     -78.6%     942.70 =C2=B1  0%  sched_debug.cfs_rq[=
63]:/.tg_load_avg
     94.00 =C2=B1 80%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
63]:/.tg_load_contrib
      1034 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
63]:/.utilization_load_avg
     67.60 =C2=B1 98%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
  32990477 =C2=B1  0%      +9.9%   36250445 =C2=B1  1%  sched_debug.cfs_rq[=
6]:/.min_vruntime
     14.00 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.runnable_load_avg
    155891 =C2=B1223%   -1652.3%   -2419900 =C2=B1-30%  sched_debug.cfs_rq[=
6]:/.spread0
      6092 =C2=B1 41%     -84.6%     940.30 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
     82.00 =C2=B1 80%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
      1027 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.utilization_load_avg
  32605157 =C2=B1  0%     +11.6%   36393126 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.min_vruntime
     14.30 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
   -229652 =C2=B1-118%    +891.6%   -2277287 =C2=B1-13%  sched_debug.cfs_rq=
[7]:/.spread0
      6053 =C2=B1 41%     -84.5%     941.30 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
    115.40 =C2=B1138%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.tg_load_contrib
      1025 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.utilization_load_avg
    146.20 =C2=B1 94%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.blocked_load_avg
     14.40 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.runnable_load_avg
   1153532 =C2=B1 36%    -243.9%   -1660087 =C2=B1-54%  sched_debug.cfs_rq[=
8]:/.spread0
      6070 =C2=B1 40%     -84.5%     941.20 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
    161.50 =C2=B1 86%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.tg_load_contrib
      1047 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.utilization_load_avg
    101.50 =C2=B1107%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.blocked_load_avg
     13.80 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.runnable_load_avg
   1214974 =C2=B1 27%    -218.0%   -1433345 =C2=B1-62%  sched_debug.cfs_rq[=
9]:/.spread0
      6041 =C2=B1 40%     -84.4%     941.30 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
    115.70 =C2=B1 93%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.tg_load_contrib
      1024 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.utilization_load_avg
    -51.70 =C2=B1-49%    +408.5%    -262.90 =C2=B1-19%  sched_debug.cpu#0.n=
r_uninterruptible
     54454 =C2=B1 10%     -16.7%      45367 =C2=B1  2%  sched_debug.cpu#10.=
nr_switches
     55931 =C2=B1 10%     -13.8%      48233 =C2=B1  3%  sched_debug.cpu#10.=
sched_count
     11485 =C2=B1 28%     -35.2%       7442 =C2=B1  8%  sched_debug.cpu#10.=
ttwu_count
     54543 =C2=B1  5%     -15.7%      45994 =C2=B1  5%  sched_debug.cpu#11.=
nr_switches
     56038 =C2=B1  5%     -13.4%      48556 =C2=B1  5%  sched_debug.cpu#11.=
sched_count
     11221 =C2=B1 19%     -30.6%       7789 =C2=B1 15%  sched_debug.cpu#11.=
ttwu_count
     54031 =C2=B1 13%     -16.8%      44931 =C2=B1  2%  sched_debug.cpu#12.=
nr_switches
     55586 =C2=B1 12%     -14.6%      47478 =C2=B1  2%  sched_debug.cpu#12.=
sched_count
      2675 =C2=B1 37%     -36.8%       1692 =C2=B1 16%  sched_debug.cpu#12.=
sched_goidle
     52358 =C2=B1  7%     -14.2%      44916 =C2=B1  2%  sched_debug.cpu#14.=
nr_switches
      2648 =C2=B1 26%     -34.1%       1746 =C2=B1 15%  sched_debug.cpu#14.=
sched_goidle
     52553 =C2=B1  8%     -15.0%      44686 =C2=B1  2%  sched_debug.cpu#16.=
nr_switches
      2322 =C2=B1 24%     -30.6%       1611 =C2=B1 16%  sched_debug.cpu#16.=
sched_goidle
      1963 =C2=B1  6%     -14.7%       1674 =C2=B1  8%  sched_debug.cpu#18.=
sched_goidle
     50172 =C2=B1  7%     -10.7%      44805 =C2=B1  3%  sched_debug.cpu#19.=
nr_switches
    -17.70 =C2=B1-146%    +693.2%    -140.40 =C2=B1-35%  sched_debug.cpu#2.=
nr_uninterruptible
     49164 =C2=B1  4%      -8.5%      44971 =C2=B1  3%  sched_debug.cpu#21.=
nr_switches
      5769 =C2=B1 17%     +30.6%       7535 =C2=B1  9%  sched_debug.cpu#29.=
ttwu_count
      2032 =C2=B1 39%    +114.6%       4361 =C2=B1 15%  sched_debug.cpu#29.=
ttwu_local
    -12.60 =C2=B1-214%    +833.3%    -117.60 =C2=B1-46%  sched_debug.cpu#3.=
nr_uninterruptible
      1564 =C2=B1  6%     -34.2%       1029 =C2=B1 17%  sched_debug.cpu#32.=
sched_goidle
      1666 =C2=B1 13%     -32.8%       1120 =C2=B1 11%  sched_debug.cpu#33.=
sched_goidle
      1874 =C2=B1 37%     -43.1%       1067 =C2=B1 11%  sched_debug.cpu#36.=
sched_goidle
      1528 =C2=B1  6%     -26.0%       1130 =C2=B1 12%  sched_debug.cpu#37.=
sched_goidle
      1574 =C2=B1  7%     -29.6%       1109 =C2=B1 11%  sched_debug.cpu#38.=
sched_goidle
      1651 =C2=B1  6%     -41.7%     962.30 =C2=B1 10%  sched_debug.cpu#40.=
sched_goidle
      1697 =C2=B1 12%     -42.2%     981.50 =C2=B1 14%  sched_debug.cpu#41.=
sched_goidle
     12.70 =C2=B1219%    +629.1%      92.60 =C2=B1 59%  sched_debug.cpu#42.=
nr_uninterruptible
      1798 =C2=B1 29%     -46.4%     964.20 =C2=B1  9%  sched_debug.cpu#42.=
sched_goidle
     22.40 =C2=B1165%    +314.7%      92.90 =C2=B1 61%  sched_debug.cpu#43.=
nr_uninterruptible
     48640 =C2=B1  5%     -11.4%      43112 =C2=B1  1%  sched_debug.cpu#44.=
nr_switches
     10.30 =C2=B1370%    +777.7%      90.40 =C2=B1 39%  sched_debug.cpu#44.=
nr_uninterruptible
      1824 =C2=B1 28%     -48.7%     936.00 =C2=B1  7%  sched_debug.cpu#44.=
sched_goidle
     49362 =C2=B1  7%     -11.3%      43765 =C2=B1  4%  sched_debug.cpu#45.=
nr_switches
      1790 =C2=B1 10%     -47.7%     937.20 =C2=B1  8%  sched_debug.cpu#46.=
sched_goidle
      1752 =C2=B1 30%     -39.9%       1054 =C2=B1 16%  sched_debug.cpu#48.=
sched_goidle
     11.70 =C2=B1260%    +547.9%      75.80 =C2=B1 60%  sched_debug.cpu#51.=
nr_uninterruptible
     47186 =C2=B1  8%      -9.9%      42506 =C2=B1  1%  sched_debug.cpu#52.=
nr_switches
      1597 =C2=B1  7%     -43.4%     903.50 =C2=B1 13%  sched_debug.cpu#52.=
sched_goidle
      1658 =C2=B1 16%     -44.5%     921.00 =C2=B1  9%  sched_debug.cpu#53.=
sched_goidle
     48232 =C2=B1 14%     -11.4%      42742 =C2=B1  1%  sched_debug.cpu#54.=
nr_switches
     15.80 =C2=B1209%    +391.8%      77.70 =C2=B1 26%  sched_debug.cpu#54.=
nr_uninterruptible
      1737 =C2=B1 26%     -44.2%     969.00 =C2=B1 12%  sched_debug.cpu#54.=
sched_goidle
      1635 =C2=B1 23%     -44.5%     907.20 =C2=B1 22%  sched_debug.cpu#56.=
sched_goidle
      1535 =C2=B1  6%     -44.8%     847.20 =C2=B1 14%  sched_debug.cpu#57.=
sched_goidle
      4249 =C2=B1 16%     +30.3%       5534 =C2=B1  5%  sched_debug.cpu#57.=
ttwu_count
      1625 =C2=B1 34%    +128.7%       3718 =C2=B1  7%  sched_debug.cpu#57.=
ttwu_local
      1556 =C2=B1  7%     -47.3%     820.60 =C2=B1 15%  sched_debug.cpu#59.=
sched_goidle
      8.60 =C2=B1429%   +1058.1%      99.60 =C2=B1 44%  sched_debug.cpu#60.=
nr_uninterruptible
      1606 =C2=B1 12%     -43.9%     901.50 =C2=B1 15%  sched_debug.cpu#60.=
sched_goidle
      1705 =C2=B1 45%    +147.1%       4213 =C2=B1 10%  sched_debug.cpu#60.=
ttwu_local
     18.00 =C2=B1200%    +351.1%      81.20 =C2=B1 39%  sched_debug.cpu#61.=
nr_uninterruptible
      2970 =C2=B1 97%     -69.9%     894.20 =C2=B1 15%  sched_debug.cpu#62.=
sched_goidle
    -13.40 =C2=B1-88%    +760.4%    -115.30 =C2=B1-36%  sched_debug.cpu#7.n=
r_uninterruptible
      3396 =C2=B1 32%     -40.1%       2034 =C2=B1 30%  sched_debug.cpu#8.s=
ched_goidle
     54316 =C2=B1  8%     -14.0%      46734 =C2=B1  5%  sched_debug.cpu#9.n=
r_switches
     55815 =C2=B1  8%     -11.8%      49252 =C2=B1  5%  sched_debug.cpu#9.s=
ched_count


lkp-nex04: Nehalem-EX
Memory: 256G

                         ebizzy.throughput.per_thread.max

  145 ++--------------------------------O----O-O-O-------------------------=
-+
      |                       O  O O O    O         O                      =
 |
  140 O+O  O O  O O    O O  O                                              =
 |
      |             O                                                      =
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
      |               .*.*..*.         .*.                                 =
 |
  120 *+*..    .*.*.*.        *..*.*.*.   *..*     .*.  .*.*..   .*..  *.. =
 |
      |    *.*.                               + .*.   *.      *.*     +    =
.*
  115 ++                                       *                     *    *=
 |
      |                                                                    =
 |
  110 ++-------------------------------------------------------------------=
-+


                    ebizzy.throughput.per_thread.stddev_percent

  0.13 ++------------------------------------------------------------------=
-+
       |                                O    O O    O                      =
 |
  0.12 O+   O O           O O  O O  O O    O      O                        =
 |
  0.11 ++O       O O O  O                                                  =
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

  5.3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  5.2e+06 *+*.. .*.*.*..*. .*.*..*.*.*..*.*.*.*..*.*.*..*.*.*.*..*.*   *..*=
.*
          |    *          *                                         + +    =
 |
          |                                                          *     =
 |
  5.1e+06 ++                                                               =
 |
          |                                                                =
 |
    5e+06 ++                                                               =
 |
          |                                                                =
 |
  4.9e+06 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
  4.8e+06 ++                                                               =
 |
          O O  O O O O  O O   O  O O O  O O O O  O O O                     =
 |
  4.7e+06 ++----------------O----------------------------------------------=
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
-------------------------------------
lkp(a)eclists.intel.com
https://eclists.intel.com/sympa/info/lkp
Unsubscribe by sending email to sympa(a)eclists.intel.com with subject "Uns=
ubscribe lkp"


--===============4348205780661068374==
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
ci1sa3AKY29tbWl0OiAxMWEzY2U4MzIxMzhiMTMxOTY1ZWVhMDZlN2JlN2U4ZGYyNTY0MGVmCnF1
ZXVlOiB1bml0CnJlcGVhdF90bzogMgp0ZXN0Ym94OiBsa3AtbmV4MDQKdGJveF9ncm91cDogbGtw
LW5leDA0Cmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNS0wNi0xOCAwODo0
OTowOS41NDYzODA3NzkgKzA4OjAwCnVzZXI6IGxrcApjb21waWxlcjogZ2NjLTQuOQpoZWFkX2Nv
bW1pdDogMTFhM2NlODMyMTM4YjEzMTk2NWVlYTA2ZTdiZTdlOGRmMjU2NDBlZgpiYXNlX2NvbW1p
dDogZmExNmMxYmYzYzQ3MTdmODJiOWNjY2E2MTE1NjY1NjA2OGUwYjE0YwprZXJuZWw6ICIvcGtn
L2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvMTFhM2NlODMyMTM4YjEzMTk2NWVlYTA2ZTdiZTdl
OGRmMjU2NDBlZi92bWxpbnV6LTQuMS4wLXJjOC0wMjY0Mi1nMTFhM2NlOCIKcm9vdGZzOiBkZWJp
YW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC9lYml6enkvcGVy
Zm9ybWFuY2UtMjAwJS0xMDB4LTEwcy9sa3AtbmV4MDQvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3
LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzExYTNjZTgzMjEzOGIxMzE5NjVlZWEwNmU3YmU3ZThk
ZjI1NjQwZWYvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9sa3AtbmV4MDQvdW5pdF9lYml6
enktcGVyZm9ybWFuY2UtMjAwJS0xMDB4LTEwcy14ODZfNjQtcmhlbC1IRUFELTExYTNjZTgzMjEz
OGIxMzE5NjVlZWEwNmU3YmU3ZThkZjI1NjQwZWYtMS0yMDE1MDYxOC00Mjg3MS0xaTEyMzg3Lnlh
bWwiCmRlcXVldWVfdGltZTogMjAxNS0wNi0xOCAwOTozMDoyNC44NTUyNjQ1NjYgKzA4OjAwCm5y
X2NwdTogIiQobnByb2MpIgptYXhfdXB0aW1lOiAzNjAwCmluaXRyZDogIi9vc2ltYWdlL2RlYmlh
bi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpib290bG9hZGVyX2FwcGVuZDoKLSByb290
PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Avc2NoZWR1bGVkL2xrcC1uZXgwNC91bml0
X2ViaXp6eS1wZXJmb3JtYW5jZS0yMDAlLTEwMHgtMTBzLXg4Nl82NC1yaGVsLUhFQUQtMTFhM2Nl
ODMyMTM4YjEzMTk2NWVlYTA2ZTdiZTdlOGRmMjU2NDBlZi0xLTIwMTUwNjE4LTQyODcxLTFpMTIz
ODcueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD15dXlh
bmctdGlwL2Zvci1sa3AKLSBjb21taXQ9MTFhM2NlODMyMTM4YjEzMTk2NWVlYTA2ZTdiZTdlOGRm
MjU2NDBlZgotIEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzExYTNj
ZTgzMjEzOGIxMzE5NjVlZWEwNmU3YmU3ZThkZjI1NjQwZWYvdm1saW51ei00LjEuMC1yYzgtMDI2
NDItZzExYTNjZTgKLSBtYXhfdXB0aW1lPTM2MDAKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L2ViaXp6
eS9wZXJmb3JtYW5jZS0yMDAlLTEwMHgtMTBzL2xrcC1uZXgwNC9kZWJpYW4teDg2XzY0LTIwMTUt
MDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvMTFhM2NlODMyMTM4YjEzMTk2NWVlYTA2ZTdi
ZTdlOGRmMjU2NDBlZi8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJpbnRrPXR0
eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3Jx
X2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5p
Yz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9h
ZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNv
bGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3AteDg2XzY0
LmNneiIKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvMTFh
M2NlODMyMTM4YjEzMTk2NWVlYTA2ZTdiZTdlOGRmMjU2NDBlZi9tb2R1bGVzLmNneiIKYm1faW5p
dHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3os
L29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNvbmZpZy5j
Z3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJvc3RhdC5j
Z3osL2xrcC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL2ViaXp6eS14
ODZfNjQuY2d6Igpqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDk5LjcyIDExNi40MSA4Mi45
NSAxLzYwMCA0MzI4MApzdGFydF90aW1lOiAnMTQzNDU5MTA4NycKZW5kX3RpbWU6ICcxNDM0NTky
MDk3Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE1MDYxNy0yMTQzMDkiCg==

--===============4348205780661068374==
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

--===============4348205780661068374==--

