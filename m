Content-Type: multipart/mixed; boundary="===============1017087570469703059=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: [sched] 2cade6c4d97: +902.4% dbench.max_latency
Date: Thu, 10 Jul 2014 10:57:22 +0800
Message-ID: <53BE0112.7040306@intel.com>
In-Reply-To: <53bdff6e.cIz0Hkc0XyW3AcfW%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1017087570469703059==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://bee.sh.intel.com/git/ydu19/linux rewrite-v1.1-on-3.16-rc3
commit 2cade6c4d979ab646572c775104195a19c163e7d ("sched: Rewrite per entity=
 runnable load average tracking")

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     28.17 ~12%    +902.4%     282.38 ~11%  ivb44/dbench/100%
     28.17 ~12%    +902.4%     282.38 ~11%  TOTAL dbench.max_latency

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

        77 ~ 1%     -76.0%         18 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
        77 ~ 1%     -76.0%         18 ~ 4%  TOTAL ebizzy.throughput.per_thr=
ead.min

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      0.08 ~ 5%    +310.6%       0.33 ~ 3%  lkp-nex04/ebizzy/200%-100x-10s
      0.08 ~ 5%    +310.6%       0.33 ~ 3%  TOTAL ebizzy.throughput.per_thr=
ead.stddev_percent

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       124 ~ 0%     +56.1%        194 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
       124 ~ 0%     +56.1%        194 ~ 1%  TOTAL ebizzy.throughput.per_thr=
ead.max

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     94329 ~ 0%     -28.6%      67365 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
     94329 ~ 0%     -28.6%      67365 ~ 1%  TOTAL hackbench.throughput

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     26189 ~ 0%      -9.1%      23799 ~ 0%  ivb44/dbench/100%
     26189 ~ 0%      -9.1%      23799 ~ 0%  TOTAL dbench.throughput-MB/sec

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     40.84 ~ 0%      -7.7%      37.68 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
     40.84 ~ 0%      -7.7%      37.68 ~ 0%  TOTAL ebizzy.time.user

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     12714 ~ 0%      -3.4%      12286 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
     12714 ~ 0%      -3.4%      12286 ~ 0%  TOTAL ebizzy.throughput

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       595 ~ 0%      -3.4%        575 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
       595 ~ 0%      -3.4%        575 ~ 0%  TOTAL ebizzy.time.sys

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

  63947445 ~ 2%   +8400.9%  5.436e+09 ~ 1%  ivb44/dbench/100%
  63947445 ~ 2%   +8400.9%  5.436e+09 ~ 1%  TOTAL cpuidle.C6-IVT.time

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

    482918 ~47%   +2198.0%   11097606 ~ 4%  ivb44/dbench/100%
    482918 ~47%   +2198.0%   11097606 ~ 4%  TOTAL cpuidle.C3-IVT.time

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

   3259902 ~18%   +1548.0%   53722521 ~ 9%  ivb44/dbench/100%
   3259902 ~18%   +1548.0%   53722521 ~ 9%  TOTAL cpuidle.C1E-IVT.time

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      0.38 ~ 3%    +987.0%       4.17 ~ 9%  lkp-snb01/hackbench/50%-process=
-pipe
      0.38 ~ 3%    +987.0%       4.17 ~ 9%  TOTAL perf-profile.cpu-cycles.d=
equeue_entity.dequeue_task_fair.dequeue_task.deactivate_task.__schedule

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       936 ~ 4%     -90.9%         84 ~16%  lkp-nex04/ebizzy/200%-100x-10s
       936 ~ 4%     -90.9%         84 ~16%  TOTAL proc-vmstat.thp_split

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      3432 ~ 4%     -95.3%        159 ~23%  lkp-nex04/ebizzy/200%-100x-10s
      3432 ~ 4%     -95.3%        159 ~23%  TOTAL proc-vmstat.thp_fault_all=
oc

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      7451 ~11%    +714.9%      60723 ~ 8%  lkp-nex04/ebizzy/200%-100x-10s
        57 ~46%   +5203.5%       3044 ~ 7%  xps2/pigz/100%-128K
      7509 ~11%    +749.2%      63768 ~ 8%  TOTAL cpuidle.C1-NHM.usage

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     47158 ~ 6%   +2405.3%    1181486 ~ 3%  ivb44/dbench/100%
     47158 ~ 6%   +2405.3%    1181486 ~ 3%  TOTAL cpuidle.C6-IVT.usage

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      0.00           +Inf%       1.22 ~24%  lkp-snb01/hackbench/50%-process=
-pipe
      0.00           +Inf%       1.22 ~24%  TOTAL perf-profile.cpu-cycles.e=
ffective_load.isra.40.select_task_rq_fair.try_to_wake_up.default_wake_funct=
ion.autoremove_wake_function

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

        16 ~ 8%   +1249.4%        218 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
        16 ~ 8%   +1249.4%        218 ~ 5%  TOTAL numa-numastat.node0.other=
_node

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

        18 ~29%   +1116.5%        221 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
        18 ~29%   +1116.5%        221 ~ 6%  TOTAL numa-numastat.node1.other=
_node

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

  10600442 ~12%   +9400.0%  1.007e+09 ~ 1%  ivb44/dbench/100%
  10600442 ~12%   +9400.0%  1.007e+09 ~ 1%  TOTAL cpuidle.C1-IVT.time

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

        34 ~ 9%    +657.6%        257 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
        34 ~ 9%    +657.6%        257 ~ 6%  TOTAL numa-numastat.node3.other=
_node

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      0.17 ~45%    -100.0%       0.00 ~ 0%  xps2/pigz/100%-128K
      0.22 ~11%    -100.0%       0.00 ~ 0%  xps2/pigz/100%-512K
      0.39 ~26%    -100.0%       0.00 ~ 0%  TOTAL turbostat.%pc6

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

        29 ~14%    +734.5%        242 ~11%  lkp-nex04/ebizzy/200%-100x-10s
        29 ~14%    +734.5%        242 ~11%  TOTAL numa-numastat.node2.other=
_node

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

        31 ~ 0%    +377.4%        148 ~ 8%  ivb44/dbench/100%
        31 ~ 0%    +377.4%        148 ~ 8%  TOTAL slabinfo.nfs_inode_cache.=
num_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

        31 ~ 0%    +377.4%        148 ~ 8%  ivb44/dbench/100%
        31 ~ 0%    +377.4%        148 ~ 8%  TOTAL slabinfo.nfs_inode_cache.=
active_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     21869 ~48%  +22767.4%    5001003 ~ 8%  xps2/pigz/100%-128K
     21869 ~48%  +22767.4%    5001003 ~ 8%  TOTAL cpuidle.C1-NHM.time

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      0.28 ~ 2%    +340.4%       1.24 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
      0.28 ~ 2%    +340.4%       1.24 ~ 6%  TOTAL perf-profile.cpu-cycles.d=
equeue_task_fair.dequeue_task.deactivate_task.__schedule.schedule

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       161 ~19%    +616.3%       1154 ~ 3%  ivb44/dbench/100%
       317 ~23%    +356.9%       1451 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
       230 ~14%    +214.1%        723 ~ 8%  lkp-snb01/hackbench/50%-process=
-pipe
       709 ~19%    +369.5%       3329 ~ 6%  TOTAL slabinfo.nfs_read_data.ac=
tive_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       161 ~19%    +616.3%       1154 ~ 3%  ivb44/dbench/100%
       317 ~23%    +356.9%       1451 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
       230 ~14%    +214.1%        723 ~ 8%  lkp-snb01/hackbench/50%-process=
-pipe
       709 ~19%    +369.5%       3329 ~ 6%  TOTAL slabinfo.nfs_read_data.nu=
m_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     87441 ~ 8%    +321.7%     368774 ~ 3%  ivb44/dbench/100%
     87441 ~ 8%    +321.7%     368774 ~ 3%  TOTAL cpuidle.C1-IVT.usage

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

         4 ~36%    +272.7%         16 ~10%  ivb44/dbench/100%
       913 ~ 6%    +343.6%       4051 ~ 8%  lkp-snb01/hackbench/50%-process=
-pipe
       917 ~ 6%    +343.2%       4067 ~ 8%  TOTAL cpuidle.POLL.usage

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      0.11 ~ 3%   +8216.7%       8.98 ~ 1%  ivb44/dbench/100%
      0.25 ~ 7%     -64.6%       0.09 ~39%  xps2/pigz/100%-128K
      0.36 ~ 6%   +2406.1%       9.07 ~ 2%  TOTAL turbostat.%c6

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      0.94 ~ 1%    +266.7%       3.46 ~ 9%  lkp-snb01/hackbench/50%-process=
-pipe
      0.94 ~ 1%    +266.7%       3.46 ~ 9%  TOTAL perf-profile.cpu-cycles.e=
nqueue_entity.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activate

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1076 ~ 4%    +342.1%       4760 ~ 9%  lkp-nex04/ebizzy/200%-100x-10s
      1076 ~ 4%    +342.1%       4760 ~ 9%  TOTAL cpuidle.C1E-NHM.usage

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      0.12 ~ 8%   +8348.3%       9.80 ~ 2%  ivb44/dbench/100%
      3.04 ~ 1%    +163.4%       8.01 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
      0.19 ~ 6%    +190.4%       0.55 ~ 5%  xps2/pigz/100%-128K
      0.18 ~ 2%    +136.3%       0.43 ~15%  xps2/pigz/100%-512K
      3.53 ~ 2%    +432.7%      18.78 ~ 2%  TOTAL turbostat.%c1

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      0.55 ~ 8%    +262.2%       1.99 ~ 8%  lkp-snb01/hackbench/50%-process=
-pipe
      0.55 ~ 8%    +262.2%       1.99 ~ 8%  TOTAL perf-profile.cpu-cycles.u=
pdate_cfs_shares.dequeue_entity.dequeue_task_fair.dequeue_task.deactivate_t=
ask

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1156 ~10%    +594.8%       8031 ~ 2%  ivb44/dbench/100%
      1914 ~ 1%     +93.6%       3705 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
      3070 ~ 5%    +282.3%      11737 ~ 1%  TOTAL uptime.idle

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      0.41 ~ 4%    +213.3%       1.27 ~10%  lkp-snb01/hackbench/50%-process=
-pipe
      0.41 ~ 4%    +213.3%       1.27 ~10%  TOTAL perf-profile.cpu-cycles.i=
ntel_idle.cpuidle_enter_state.cpuidle_enter.cpu_idle_loop.cpu_startup_entry

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

    299633 ~10%    +186.1%     857302 ~16%  xps2/pigz/100%-128K
    299633 ~10%    +186.1%     857302 ~16%  TOTAL cpuidle.C3-NHM.time

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

  90209982 ~ 2%    +184.8%  2.569e+08 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
  90209982 ~ 2%    +184.8%  2.569e+08 ~ 1%  TOTAL cpuidle.C1-SNB.usage

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      0.68 ~ 4%    +184.4%       1.93 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
      0.68 ~ 4%    +184.4%       1.93 ~ 7%  TOTAL perf-profile.cpu-cycles.u=
pdate_cfs_shares.enqueue_entity.enqueue_task_fair.enqueue_task.activate_task

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     19570 ~ 2%    +167.6%      52365 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
     19570 ~ 2%    +167.6%      52365 ~ 1%  TOTAL softirqs.HRTIMER

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

 5.247e+08 ~ 1%    +165.8%  1.395e+09 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
 5.247e+08 ~ 1%    +165.8%  1.395e+09 ~ 1%  TOTAL cpuidle.C1-SNB.time

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1810 ~21%    +170.7%       4902 ~13%  ivb44/dbench/100%
      1810 ~21%    +170.7%       4902 ~13%  TOTAL cpuidle.C3-IVT.usage

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

  27084057 ~ 2%     -59.0%   11105608 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
  27084057 ~ 2%     -59.0%   11105608 ~ 0%  TOTAL numa-numastat.node1.local=
_node

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

  27086597 ~ 2%     -59.0%   11108985 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
  27086597 ~ 2%     -59.0%   11108985 ~ 0%  TOTAL numa-numastat.node1.numa_=
hit

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

  52758035 ~ 2%     -58.5%   21900167 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
  52758035 ~ 2%     -58.5%   21900167 ~ 1%  TOTAL proc-vmstat.numa_local

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

  52762270 ~ 2%     -58.5%   21904408 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
  52762270 ~ 2%     -58.5%   21904408 ~ 1%  TOTAL proc-vmstat.numa_hit

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

  52853861 ~ 2%     -58.4%   21977151 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
  52853861 ~ 2%     -58.4%   21977151 ~ 1%  TOTAL proc-vmstat.pgfree

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

  25693713 ~ 2%     -58.0%   10788039 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
  25693713 ~ 2%     -58.0%   10788039 ~ 3%  TOTAL numa-numastat.node0.local=
_node

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

  25695410 ~ 2%     -58.0%   10788903 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
  25695410 ~ 2%     -58.0%   10788903 ~ 2%  TOTAL numa-numastat.node0.numa_=
hit

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

  47941231 ~ 2%     -58.5%   19912328 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
  47941231 ~ 2%     -58.5%   19912328 ~ 1%  TOTAL proc-vmstat.pgalloc_normal

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

   4933073 ~ 2%     -57.8%    2082260 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
   4933073 ~ 2%     -57.8%    2082260 ~ 2%  TOTAL proc-vmstat.pgalloc_dma32

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

  13835682 ~ 2%     -57.9%    5820121 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
  13835682 ~ 2%     -57.9%    5820121 ~ 1%  TOTAL numa-vmstat.node1.numa_lo=
cal

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

  13057036 ~ 2%     -56.7%    5659633 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
  13057036 ~ 2%     -56.7%    5659633 ~ 2%  TOTAL numa-vmstat.node0.numa_lo=
cal

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

  13846426 ~ 2%     -57.6%    5866691 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
  13846426 ~ 2%     -57.6%    5866691 ~ 1%  TOTAL numa-vmstat.node1.numa_hit

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

  13118584 ~ 2%     -56.7%    5685314 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
  13118584 ~ 2%     -56.7%    5685314 ~ 2%  TOTAL numa-vmstat.node0.numa_hit

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       346 ~11%    +152.9%        877 ~15%  ivb44/dbench/100%
       397 ~ 5%    +148.7%        989 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
       336 ~ 7%    +118.2%        734 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
      1081 ~ 7%    +140.6%       2601 ~ 8%  TOTAL slabinfo.mnt_cache.num_ob=
js

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       346 ~11%    +152.9%        877 ~15%  ivb44/dbench/100%
       397 ~ 5%    +148.7%        989 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
       336 ~ 7%    +118.2%        734 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
      1081 ~ 7%    +140.6%       2601 ~ 8%  TOTAL slabinfo.mnt_cache.active=
_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       114 ~21%     -40.8%         68 ~36%  lkp-snb01/hackbench/50%-process=
-pipe
       114 ~21%     -40.8%         68 ~36%  TOTAL proc-vmstat.nr_written

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

   2053894 ~ 1%    +124.3%    4605902 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
   2053894 ~ 1%    +124.3%    4605902 ~ 2%  TOTAL cpuidle.C1E-SNB.usage

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

  75033900 ~ 2%    +121.5%  1.662e+08 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
  75033900 ~ 2%    +121.5%  1.662e+08 ~ 2%  TOTAL cpuidle.C1E-SNB.time

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       225 ~ 5%     -43.1%        128 ~ 7%  lkp-nex04/ebizzy/200%-100x-10s
       745 ~ 1%     -56.5%        324 ~18%  lkp-snb01/hackbench/50%-process=
-pipe
       971 ~ 2%     -53.4%        452 ~15%  TOTAL numa-vmstat.node1.nr_kern=
el_stack

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      3625 ~ 5%     -43.2%       2060 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
     11936 ~ 1%     -56.7%       5172 ~18%  lkp-snb01/hackbench/50%-process=
-pipe
     15561 ~ 2%     -53.5%       7232 ~15%  TOTAL numa-meminfo.node1.Kernel=
Stack

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      5116 ~ 3%     +94.3%       9942 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
      5116 ~ 3%     +94.3%       9942 ~ 6%  TOTAL cpuidle.C3-SNB.usage

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1.68 ~ 2%     -47.4%       0.88 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
      1.68 ~ 2%     -47.4%       0.88 ~ 4%  TOTAL perf-profile.cpu-cycles._=
_fget_light.sys_write.system_call_fastpath.__write_nocancel

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1.26 ~ 2%     -47.2%       0.66 ~ 8%  lkp-snb01/hackbench/50%-process=
-pipe
      1.26 ~ 2%     -47.2%       0.66 ~ 8%  TOTAL perf-profile.cpu-cycles.v=
fs_write.sys_write.system_call_fastpath.__write_nocancel

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1.35 ~ 2%     -47.1%       0.72 ~13%  lkp-snb01/hackbench/50%-process=
-pipe
      1.35 ~ 2%     -47.1%       0.72 ~13%  TOTAL perf-profile.cpu-cycles._=
_mutex_lock_slowpath.mutex_lock.pipe_write.new_sync_write.vfs_write

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      4515 ~16%    +111.3%       9541 ~12%  ivb44/dbench/100%
    183722 ~ 3%     +93.3%     355067 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
     65376 ~ 2%     -27.4%      47481 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
    253613 ~ 3%     +62.5%     412090 ~ 0%  TOTAL proc-vmstat.numa_pages_mi=
grated

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      4515 ~16%    +111.3%       9541 ~12%  ivb44/dbench/100%
    183722 ~ 3%     +93.3%     355067 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
     65376 ~ 2%     -27.4%      47481 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
    253613 ~ 3%     +62.5%     412090 ~ 0%  TOTAL proc-vmstat.pgmigrate_suc=
cess

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      0.73 ~ 4%     +86.5%       1.35 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
      0.73 ~ 4%     +86.5%       1.35 ~ 5%  TOTAL perf-profile.cpu-cycles._=
raw_spin_lock_irq.__schedule.schedule.pipe_wait.pipe_read

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1.29 ~ 2%     -45.4%       0.71 ~14%  lkp-snb01/hackbench/50%-process=
-pipe
      1.29 ~ 2%     -45.4%       0.71 ~14%  TOTAL perf-profile.cpu-cycles.o=
sq_lock.__mutex_lock_slowpath.mutex_lock.pipe_write.new_sync_write

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1.31 ~ 3%     -44.0%       0.73 ~17%  lkp-snb01/hackbench/50%-process=
-pipe
      1.31 ~ 3%     -44.0%       0.73 ~17%  TOTAL perf-profile.cpu-cycles.m=
utex_spin_on_owner.__mutex_lock_slowpath.mutex_lock.pipe_write.new_sync_wri=
te

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     32219 ~ 1%     +76.9%      57009 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
     32219 ~ 1%     +76.9%      57009 ~ 5%  TOTAL numa-meminfo.node0.SUnrec=
laim

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      2.00 ~ 2%     -43.1%       1.14 ~ 8%  lkp-snb01/hackbench/50%-process=
-pipe
      2.00 ~ 2%     -43.1%       1.14 ~ 8%  TOTAL perf-profile.cpu-cycles.p=
ipe_write.new_sync_write.vfs_write.sys_write.system_call_fastpath

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      8054 ~ 1%     +76.9%      14244 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
      8054 ~ 1%     +76.9%      14244 ~ 5%  TOTAL numa-vmstat.node0.nr_slab=
_unreclaimable

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     42060 ~ 6%    +117.1%      91312 ~ 9%  ivb44/dbench/100%
    381740 ~ 2%     -24.4%     288688 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
    423800 ~ 3%     -10.3%     380001 ~ 2%  TOTAL proc-vmstat.numa_pte_upda=
tes

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       512 ~17%     +60.0%        819 ~ 7%  ivb44/dbench/100%
       224 ~ 0%    +108.6%        467 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
       473 ~ 6%     +37.8%        652 ~14%  lkp-snb01/hackbench/50%-process=
-pipe
      1209 ~10%     +60.3%       1939 ~ 9%  TOTAL slabinfo.kmem_cache.num_o=
bjs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       512 ~17%     +60.0%        819 ~ 7%  ivb44/dbench/100%
       224 ~ 0%    +108.6%        467 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
       473 ~ 6%     +37.8%        652 ~14%  lkp-snb01/hackbench/50%-process=
-pipe
      1209 ~10%     +60.3%       1939 ~ 9%  TOTAL slabinfo.kmem_cache.activ=
e_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

    684760 ~ 6%    +111.4%    1447683 ~39%  lkp-snb01/hackbench/50%-process=
-pipe
    684760 ~ 6%    +111.4%    1447683 ~39%  TOTAL cpuidle.C3-SNB.time

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       544 ~ 1%     +74.3%        949 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
       544 ~ 1%     +74.3%        949 ~ 6%  TOTAL numa-vmstat.node0.nr_kern=
el_stack

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     43811 ~ 8%    +108.4%      91288 ~ 9%  ivb44/dbench/100%
    223656 ~ 2%     -24.3%     169382 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
    267468 ~ 3%      -2.5%     260670 ~ 4%  TOTAL proc-vmstat.numa_hint_fau=
lts

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      2.33 ~ 1%     -39.5%       1.41 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
      2.33 ~ 1%     -39.5%       1.41 ~ 4%  TOTAL perf-profile.cpu-cycles.m=
utex_lock.pipe_write.new_sync_write.vfs_write.sys_write

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     30601 ~ 8%     +83.4%      56109 ~10%  ivb44/dbench/100%
    752652 ~ 0%     -43.8%     423309 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
    126020 ~ 3%     -26.9%      92106 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
    909274 ~ 1%     -37.1%     571526 ~ 2%  TOTAL proc-vmstat.numa_hint_fau=
lts_local

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1294 ~10%     +81.6%       2351 ~15%  xps2/pigz/100%-128K
      1354 ~ 2%     -26.1%       1001 ~ 9%  xps2/pigz/100%-512K
      2649 ~ 6%     +26.5%       3352 ~13%  TOTAL cpuidle.C6-NHM.usage

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      4.15 ~ 2%     -38.8%       2.54 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
      4.15 ~ 2%     -38.8%       2.54 ~ 3%  TOTAL perf-profile.cpu-cycles.m=
utex_unlock.new_sync_write.vfs_write.sys_write.system_call_fastpath

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     27561 ~ 7%     -28.3%      19749 ~12%  lkp-nex04/ebizzy/200%-100x-10s
     70015 ~ 1%     -41.6%      40908 ~ 9%  lkp-snb01/hackbench/50%-process=
-pipe
     97576 ~ 3%     -37.8%      60658 ~10%  TOTAL numa-meminfo.node1.SUnrec=
laim

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      6890 ~ 7%     -28.3%       4937 ~12%  lkp-nex04/ebizzy/200%-100x-10s
     17505 ~ 1%     -41.5%      10241 ~ 9%  lkp-snb01/hackbench/50%-process=
-pipe
     24395 ~ 3%     -37.8%      15178 ~10%  TOTAL numa-vmstat.node1.nr_slab=
_unreclaimable

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       184 ~13%     +38.9%        255 ~ 9%  lkp-nex04/ebizzy/200%-100x-10s
      1879 ~ 4%    +107.4%       3896 ~12%  lkp-snb01/hackbench/50%-process=
-pipe
      2063 ~ 5%    +101.3%       4152 ~12%  TOTAL numa-vmstat.node0.nr_page=
_table_pages

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       558 ~15%     +55.2%        867 ~ 7%  xps2/pigz/100%-128K
       503 ~25%     -50.6%        248 ~20%  xps2/pigz/100%-512K
      1062 ~20%      +5.1%       1116 ~10%  TOTAL cpuidle.C3-NHM.usage

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       737 ~13%     +38.9%       1024 ~ 9%  lkp-nex04/ebizzy/200%-100x-10s
      7514 ~ 5%    +107.9%      15624 ~12%  lkp-snb01/hackbench/50%-process=
-pipe
      8251 ~ 5%    +101.8%      16648 ~12%  TOTAL numa-meminfo.node0.PageTa=
bles

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1.94 ~ 6%     +63.1%       3.16 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
      1.94 ~ 6%     +63.1%       3.16 ~ 4%  TOTAL perf-profile.cpu-cycles._=
raw_spin_lock.try_to_wake_up.default_wake_function.autoremove_wake_function=
.__wake_up_common

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       304 ~16%     -28.3%        218 ~14%  lkp-nex04/ebizzy/200%-100x-10s
      4840 ~ 1%     -45.1%       2658 ~16%  lkp-snb01/hackbench/50%-process=
-pipe
      5145 ~ 2%     -44.1%       2877 ~16%  TOTAL numa-vmstat.node1.nr_page=
_table_pages

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      0.44 ~25%     +78.8%       0.79 ~27%  xps2/pigz/100%-128K
      0.72 ~15%     +37.2%       0.98 ~ 9%  xps2/pigz/100%-512K
      1.16 ~19%     +53.1%       1.78 ~17%  TOTAL perf-profile.cpu-cycles.t=
ask_tick_fair.scheduler_tick.update_process_times.tick_sched_handle.tick_sc=
hed_timer

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     65816 ~ 2%     +60.3%     105534 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
     65816 ~ 2%     +60.3%     105534 ~ 3%  TOTAL cpuidle.C7-SNB.usage

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1223 ~15%     -28.3%        877 ~14%  lkp-nex04/ebizzy/200%-100x-10s
     19355 ~ 1%     -45.2%      10613 ~16%  lkp-snb01/hackbench/50%-process=
-pipe
     20579 ~ 2%     -44.2%      11490 ~16%  TOTAL numa-meminfo.node1.PageTa=
bles

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       849 ~ 2%     +48.3%       1260 ~ 2%  ivb44/dbench/100%
       822 ~ 2%     +90.2%       1564 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
       756 ~ 6%     +41.9%       1072 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
      2428 ~ 3%     +60.5%       3897 ~ 4%  TOTAL slabinfo.RAW.num_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       849 ~ 2%     +48.3%       1260 ~ 2%  ivb44/dbench/100%
       822 ~ 2%     +90.2%       1564 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
       756 ~ 6%     +41.9%       1072 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
      2428 ~ 3%     +60.5%       3897 ~ 4%  TOTAL slabinfo.RAW.active_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       622 ~14%     +49.4%        929 ~ 6%  ivb44/dbench/100%
       711 ~ 0%     +68.4%       1197 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
       583 ~ 5%     +30.7%        762 ~12%  lkp-snb01/hackbench/50%-process=
-pipe
      1916 ~ 6%     +50.8%       2889 ~ 7%  TOTAL slabinfo.kmem_cache_node.=
active_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       313 ~ 5%     -37.2%        197 ~ 1%  ivb44/dbench/100%
       428 ~ 2%     -32.7%        288 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
       741 ~ 3%     -34.6%        485 ~ 3%  TOTAL slabinfo.kmalloc-192.num_=
slabs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       313 ~ 5%     -37.2%        197 ~ 1%  ivb44/dbench/100%
       428 ~ 2%     -32.7%        288 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
       741 ~ 3%     -34.6%        485 ~ 3%  TOTAL slabinfo.kmalloc-192.acti=
ve_slabs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      8655 ~11%     +37.8%      11928 ~11%  xps2/pigz/100%-512K
      8655 ~11%     +37.8%      11928 ~11%  TOTAL meminfo.AnonHugePages

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       640 ~14%     +48.0%        947 ~ 6%  ivb44/dbench/100%
       768 ~ 0%     +63.3%       1254 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
       601 ~ 5%     +29.8%        780 ~12%  lkp-snb01/hackbench/50%-process=
-pipe
      2009 ~ 6%     +48.4%       2982 ~ 6%  TOTAL slabinfo.kmem_cache_node.=
num_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1.40 ~10%     -33.0%       0.94 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
      1.40 ~10%     -33.0%       0.94 ~ 7%  TOTAL perf-profile.cpu-cycles.a=
vc_has_perm.inode_has_perm.file_has_perm.selinux_file_permission.security_f=
ile_permission

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      3786 ~10%     +43.6%       5437 ~13%  lkp-nex04/ebizzy/200%-100x-10s
      3786 ~10%     +43.6%       5437 ~13%  TOTAL numa-vmstat.node0.nr_anon=
_pages

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     15161 ~11%     +43.4%      21735 ~13%  lkp-nex04/ebizzy/200%-100x-10s
     15161 ~11%     +43.4%      21735 ~13%  TOTAL numa-meminfo.node0.AnonPa=
ges

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     52957 ~ 5%     +49.8%      79346 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
     52957 ~ 5%     +49.8%      79346 ~ 4%  TOTAL numa-meminfo.node0.Slab

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      3834 ~10%     +41.9%       5438 ~13%  lkp-nex04/ebizzy/200%-100x-10s
      3834 ~10%     +41.9%       5438 ~13%  TOTAL numa-vmstat.node0.nr_acti=
ve_anon

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1.24 ~ 1%     -28.8%       0.89 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
      1.24 ~ 1%     -28.8%       0.89 ~ 7%  TOTAL perf-profile.cpu-cycles.c=
opy_user_generic_string.copy_page_from_iter.pipe_write.new_sync_write.vfs_w=
rite

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     15359 ~10%     +41.5%      21736 ~13%  lkp-nex04/ebizzy/200%-100x-10s
     15359 ~10%     +41.5%      21736 ~13%  TOTAL numa-meminfo.node0.Active=
(anon)

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     38710 ~ 6%     -20.2%      30891 ~ 7%  lkp-nex04/ebizzy/200%-100x-10s
     91495 ~ 4%     -34.1%      60264 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
    130205 ~ 4%     -30.0%      91155 ~ 6%  TOTAL numa-meminfo.node1.Slab

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      5092 ~ 0%     +14.1%       5810 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
      8721 ~ 1%     +74.5%      15220 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
     13813 ~ 1%     +52.2%      21030 ~ 5%  TOTAL numa-meminfo.node0.Kernel=
Stack

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       200 ~ 8%     +47.9%        296 ~ 3%  ivb44/dbench/100%
       330 ~ 1%     +29.9%        428 ~ 3%  lkp-nex04/ebizzy/200%-100x-10s
       530 ~ 4%     +36.7%        725 ~ 3%  TOTAL slabinfo.anon_vma.active_=
slabs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       200 ~ 8%     +47.9%        296 ~ 3%  ivb44/dbench/100%
       330 ~ 1%     +29.9%        428 ~ 3%  lkp-nex04/ebizzy/200%-100x-10s
       530 ~ 4%     +36.7%        725 ~ 3%  TOTAL slabinfo.anon_vma.num_sla=
bs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     13203 ~ 5%     -37.0%       8312 ~ 1%  ivb44/dbench/100%
     10064 ~ 0%     -17.5%       8307 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
     17990 ~ 2%     -32.6%      12123 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
     41257 ~ 3%     -30.3%      28742 ~ 3%  TOTAL slabinfo.kmalloc-192.num_=
objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1662 ~ 7%     +35.6%       2254 ~ 2%  ivb44/dbench/100%
      1749 ~ 5%     +60.9%       2813 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
      1448 ~ 9%     +25.4%       1815 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
      4860 ~ 7%     +41.6%       6883 ~ 4%  TOTAL slabinfo.sock_inode_cache=
.active_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1662 ~ 7%     +35.6%       2254 ~ 2%  ivb44/dbench/100%
      1749 ~ 5%     +60.9%       2813 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
      1448 ~ 9%     +25.4%       1815 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
      4860 ~ 7%     +41.6%       6883 ~ 4%  TOTAL slabinfo.sock_inode_cache=
.num_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

   8923050 ~ 0%     -20.9%    7058535 ~ 0%  ivb44/dbench/100%
    102854 ~ 3%     -28.4%      73657 ~ 3%  xps2/pigz/100%-128K
     99998 ~ 2%     -35.0%      65035 ~11%  xps2/pigz/100%-512K
   9125903 ~ 0%     -21.1%    7197228 ~ 0%  TOTAL softirqs.RCU

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     10267 ~ 8%     +47.6%      15156 ~ 3%  ivb44/dbench/100%
     16854 ~ 1%     +29.9%      21888 ~ 3%  lkp-nex04/ebizzy/200%-100x-10s
      3688 ~ 6%     +19.3%       4401 ~ 4%  xps2/pigz/100%-128K
      3507 ~ 7%     +37.1%       4807 ~ 8%  xps2/pigz/100%-512K
     34317 ~ 4%     +34.8%      46254 ~ 3%  TOTAL slabinfo.anon_vma.active_=
objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     10267 ~ 8%     +47.6%      15156 ~ 3%  ivb44/dbench/100%
     16854 ~ 1%     +29.9%      21888 ~ 3%  lkp-nex04/ebizzy/200%-100x-10s
      3688 ~ 6%     +19.3%       4401 ~ 4%  xps2/pigz/100%-128K
      3507 ~ 7%     +37.1%       4807 ~ 8%  xps2/pigz/100%-512K
     34317 ~ 4%     +34.8%      46254 ~ 3%  TOTAL slabinfo.anon_vma.num_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      8853 ~ 3%     -29.4%       6252 ~ 1%  ivb44/dbench/100%
     10368 ~ 4%     -25.6%       7711 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
      5593 ~ 5%     -24.2%       4239 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
     24816 ~ 4%     -26.6%      18202 ~ 3%  TOTAL slabinfo.kmalloc-512.acti=
ve_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

    206225 ~ 0%     +64.6%     339359 ~ 0%  ivb44/dbench/100%
    450969 ~ 0%     -20.2%     359966 ~ 7%  lkp-nex04/ebizzy/200%-100x-10s
   1840493 ~ 1%     +55.5%    2862132 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
     17620 ~ 1%     -10.8%      15721 ~ 3%  xps2/pigz/100%-128K
     17268 ~ 1%     -19.0%      13991 ~ 5%  xps2/pigz/100%-512K
   2532576 ~ 1%     +41.8%    3591171 ~ 1%  TOTAL softirqs.SCHED

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1.06 ~ 3%     -28.6%       0.76 ~ 8%  lkp-snb01/hackbench/50%-process=
-pipe
      1.06 ~ 3%     -28.6%       0.76 ~ 8%  TOTAL perf-profile.cpu-cycles._=
_sb_start_write.pipe_write.new_sync_write.vfs_write.sys_write

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      8869 ~ 3%     -29.1%       6284 ~ 1%  ivb44/dbench/100%
     10505 ~ 4%     -25.2%       7859 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
      5593 ~ 5%     -23.6%       4275 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
     24969 ~ 4%     -26.2%      18419 ~ 4%  TOTAL slabinfo.kmalloc-512.num_=
objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      2.46 ~ 2%     -25.5%       1.84 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
      2.46 ~ 2%     -25.5%       1.84 ~ 3%  TOTAL perf-profile.cpu-cycles.c=
opy_user_generic_string.copy_page_to_iter.pipe_read.new_sync_read.vfs_read

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     13195 ~ 5%     -37.1%       8306 ~ 1%  ivb44/dbench/100%
     10064 ~ 0%     -17.5%       8307 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
     17975 ~ 2%     -32.6%      12123 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
      2716 ~ 8%     +14.1%       3099 ~ 7%  xps2/pigz/100%-512K
     43950 ~ 3%     -27.6%      31836 ~ 3%  TOTAL slabinfo.kmalloc-192.acti=
ve_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      7687 ~ 2%     +35.1%      10388 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
      7687 ~ 2%     +35.1%      10388 ~ 1%  TOTAL slabinfo.Acpi-Namespace.n=
um_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      7687 ~ 2%     +35.1%      10388 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
      7687 ~ 2%     +35.1%      10388 ~ 1%  TOTAL slabinfo.Acpi-Namespace.a=
ctive_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     90503 ~ 3%     -23.8%      68962 ~ 3%  ivb44/dbench/100%
     90503 ~ 3%     -23.8%      68962 ~ 3%  TOTAL meminfo.Committed_AS

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      6798 ~ 1%     -24.0%       5168 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
      6798 ~ 1%     -24.0%       5168 ~ 1%  TOTAL slabinfo.files_cache.acti=
ve_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      6798 ~ 1%     -24.0%       5168 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
      6798 ~ 1%     -24.0%       5168 ~ 1%  TOTAL slabinfo.files_cache.num_=
objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

   6945666 ~ 3%     -13.3%    6025119 ~11%  xps2/pigz/100%-128K
   7435469 ~ 1%     -33.0%    4982388 ~16%  xps2/pigz/100%-512K
  14381136 ~ 2%     -23.5%   11007507 ~13%  TOTAL cpuidle.C6-NHM.time

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      0.14 ~ 6%     -27.1%       0.10 ~ 9%  lkp-snb01/hackbench/50%-process=
-pipe
      0.14 ~ 6%     -27.1%       0.10 ~ 9%  TOTAL turbostat.%c7

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1014 ~ 2%     +30.0%       1318 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
      1014 ~ 2%     +30.0%       1318 ~ 6%  TOTAL slabinfo.bdev_cache.num_o=
bjs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1014 ~ 2%     +30.0%       1318 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
      1014 ~ 2%     +30.0%       1318 ~ 6%  TOTAL slabinfo.bdev_cache.activ=
e_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1678 ~ 7%     +25.4%       2104 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
      1678 ~ 7%     +25.4%       2104 ~ 6%  TOTAL numa-meminfo.node2.Kernel=
Stack

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       447 ~ 5%     +28.8%        576 ~ 6%  xps2/pigz/100%-512K
       447 ~ 5%     +28.8%        576 ~ 6%  TOTAL slabinfo.signal_cache.num=
_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     12020 ~ 4%     -20.1%       9602 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
     15653 ~ 5%     -16.8%      13030 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
     27674 ~ 5%     -18.2%      22632 ~ 3%  TOTAL slabinfo.kmalloc-256.acti=
ve_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1855 ~ 2%     +28.3%       2380 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
      1855 ~ 2%     +28.3%       2380 ~ 5%  TOTAL numa-meminfo.node3.Kernel=
Stack

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     12511 ~ 3%     -20.2%       9986 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
     15932 ~ 5%     -16.9%      13235 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
     28444 ~ 4%     -18.4%      23221 ~ 3%  TOTAL slabinfo.kmalloc-256.num_=
objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     11987 ~ 1%     -21.4%       9417 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
      9936 ~ 2%     -19.1%       8033 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
     21923 ~ 1%     -20.4%      17451 ~ 4%  TOTAL slabinfo.kmalloc-128.acti=
ve_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     11988 ~ 1%     -21.1%       9463 ~ 3%  lkp-nex04/ebizzy/200%-100x-10s
      9938 ~ 2%     -19.1%       8036 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
     21926 ~ 1%     -20.2%      17500 ~ 4%  TOTAL slabinfo.kmalloc-128.num_=
objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1308 ~ 9%     -10.8%       1167 ~ 7%  ivb44/dbench/100%
      1308 ~ 9%     -10.8%       1167 ~ 7%  TOTAL numa-meminfo.node1.Unevic=
table

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       327 ~ 9%     -10.8%        291 ~ 7%  ivb44/dbench/100%
       327 ~ 9%     -10.8%        291 ~ 7%  TOTAL numa-vmstat.node1.nr_unev=
ictable

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     71548 ~12%     +18.9%      85065 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
     71548 ~12%     +18.9%      85065 ~ 6%  TOTAL meminfo.DirectMap4k

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       649 ~ 2%     +28.0%        830 ~ 1%  ivb44/dbench/100%
       828 ~ 0%     +12.2%        929 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
      1477 ~ 1%     +19.2%       1760 ~ 2%  TOTAL slabinfo.kmalloc-4096.act=
ive_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      6363 ~ 0%     +20.2%       7645 ~ 1%  ivb44/dbench/100%
      6363 ~ 0%     +20.2%       7645 ~ 1%  TOTAL proc-vmstat.numa_other

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      2618 ~ 1%     +11.8%       2928 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
       447 ~ 5%     +28.8%        576 ~ 6%  xps2/pigz/100%-512K
      3066 ~ 2%     +14.3%       3504 ~ 3%  TOTAL slabinfo.signal_cache.act=
ive_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     35069 ~ 7%     +14.9%      40289 ~ 8%  lkp-nex04/ebizzy/200%-100x-10s
     35069 ~ 7%     +14.9%      40289 ~ 8%  TOTAL numa-meminfo.node0.Active

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

  17463047 ~ 0%     -19.6%   14039072 ~ 0%  ivb44/dbench/100%
   9747805 ~ 2%      -9.4%    8833694 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
  27210852 ~ 0%     -15.9%   22872766 ~ 0%  TOTAL softirqs.TIMER

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      2.20 ~ 2%     -16.8%       1.83 ~ 5%  ivb44/dbench/100%
      2.20 ~ 2%     -16.8%       1.83 ~ 5%  TOTAL perf-profile.cpu-cycles.r=
cu_nocb_kthread.kthread.ret_from_fork

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1.24 ~ 2%     -16.3%       1.04 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
      1.24 ~ 2%     -16.3%       1.04 ~ 4%  TOTAL perf-profile.cpu-cycles.t=
ry_to_wake_up.default_wake_function.autoremove_wake_function.__wake_up_comm=
on.__wake_up_sync_key

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1296 ~10%     +10.9%       1436 ~ 6%  ivb44/dbench/100%
      1296 ~10%     +10.9%       1436 ~ 6%  TOTAL numa-meminfo.node0.Unevic=
table

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       324 ~10%     +10.9%        359 ~ 6%  ivb44/dbench/100%
       324 ~10%     +10.9%        359 ~ 6%  TOTAL numa-vmstat.node0.nr_unev=
ictable

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      3948 ~ 3%     +21.5%       4796 ~ 2%  ivb44/dbench/100%
      2840 ~ 2%      +9.2%       3101 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
      6788 ~ 3%     +16.3%       7897 ~ 3%  TOTAL slabinfo.kmalloc-96.activ=
e_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      3998 ~ 3%     +21.0%       4838 ~ 2%  ivb44/dbench/100%
      2881 ~ 2%      +9.6%       3158 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
      6879 ~ 3%     +16.2%       7996 ~ 2%  TOTAL slabinfo.kmalloc-96.num_o=
bjs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1.03 ~ 1%     +16.5%       1.20 ~ 4%  ivb44/dbench/100%
      1.03 ~ 1%     +16.5%       1.20 ~ 4%  TOTAL perf-profile.cpu-cycles.s=
elinux_inode_permission.security_inode_permission.__inode_permission.inode_=
permission.link_path_walk

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       750 ~ 3%     +18.2%        887 ~ 1%  ivb44/dbench/100%
       942 ~ 0%     +11.0%       1046 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
      1693 ~ 1%     +14.2%       1933 ~ 2%  TOTAL slabinfo.kmalloc-4096.num=
_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1.30 ~ 2%     -11.5%       1.15 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
      1.30 ~ 2%     -11.5%       1.15 ~ 2%  TOTAL perf-profile.cpu-cycles.p=
ipe_read.new_sync_read.vfs_read.sys_read.system_call_fastpath

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      6061 ~ 2%     -11.2%       5382 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
      6061 ~ 2%     -11.2%       5382 ~ 1%  TOTAL slabinfo.kmalloc-1024.num=
_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

    533817 ~ 3%     -12.7%     466234 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
    533817 ~ 3%     -12.7%     466234 ~ 2%  TOTAL numa-meminfo.node1.MemUsed

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      2326 ~ 2%     +14.3%       2659 ~ 6%  ivb44/dbench/100%
      1791 ~ 2%     +17.7%       2108 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
      4118 ~ 2%     +15.8%       4767 ~ 6%  TOTAL slabinfo.kmalloc-2048.num=
_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1809 ~ 5%     +14.2%       2067 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
      1809 ~ 5%     +14.2%       2067 ~ 4%  TOTAL slabinfo.blkdev_ioc.num_o=
bjs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1809 ~ 5%     +14.2%       2067 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
      1809 ~ 5%     +14.2%       2067 ~ 4%  TOTAL slabinfo.blkdev_ioc.activ=
e_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      2408 ~ 2%     +13.1%       2724 ~ 2%  ivb44/dbench/100%
      3734 ~ 3%     +12.9%       4217 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
      6142 ~ 3%     +13.0%       6941 ~ 2%  TOTAL slabinfo.shmem_inode_cach=
e.active_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      2408 ~ 2%     +13.1%       2724 ~ 2%  ivb44/dbench/100%
      3734 ~ 3%     +12.9%       4217 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
      6142 ~ 3%     +13.0%       6941 ~ 2%  TOTAL slabinfo.shmem_inode_cach=
e.num_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1216 ~10%     -12.0%       1070 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
      1216 ~10%     -12.0%       1070 ~ 0%  TOTAL uptime.boot

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      2024 ~ 3%     +14.9%       2326 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
      2024 ~ 3%     +14.9%       2326 ~ 2%  TOTAL slabinfo.xfs_buf.active_o=
bjs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      2024 ~ 3%     +14.9%       2326 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
      2024 ~ 3%     +14.9%       2326 ~ 2%  TOTAL slabinfo.xfs_buf.num_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

   2117098 ~ 1%     -10.7%    1889732 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
   2117098 ~ 1%     -10.7%    1889732 ~ 0%  TOTAL proc-vmstat.pgfault

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

  22401334 ~ 0%      -9.4%   20304218 ~ 0%  ivb44/dbench/100%
      9946 ~ 0%     -11.7%       8784 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
  22411280 ~ 0%      -9.4%   20313002 ~ 0%  TOTAL proc-vmstat.pgactivate

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      5975 ~ 1%     -10.3%       5361 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
      5975 ~ 1%     -10.3%       5361 ~ 2%  TOTAL slabinfo.kmalloc-1024.act=
ive_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1.25 ~ 0%      -9.0%       1.13 ~ 1%  ivb44/dbench/100%
      1.25 ~ 0%      -9.0%       1.13 ~ 1%  TOTAL perf-profile.cpu-cycles.g=
et_empty_filp.path_openat.do_filp_open.do_sys_open.sys_openat

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      2183 ~ 2%     +14.2%       2494 ~ 7%  ivb44/dbench/100%
      1717 ~ 3%     +16.7%       2005 ~ 8%  lkp-snb01/hackbench/50%-process=
-pipe
      3900 ~ 2%     +15.3%       4499 ~ 7%  TOTAL slabinfo.kmalloc-2048.act=
ive_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       112 ~10%     +13.2%        127 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
       299 ~ 0%      -9.6%        270 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
       411 ~ 3%      -3.4%        397 ~ 0%  TOTAL vmstat.procs.r

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     18643 ~ 2%      -9.5%      16872 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
     18643 ~ 2%      -9.5%      16872 ~ 0%  TOTAL slabinfo.kmalloc-16.num_o=
bjs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     18643 ~ 2%      -9.7%      16841 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
     18643 ~ 2%      -9.7%      16841 ~ 0%  TOTAL slabinfo.kmalloc-16.activ=
e_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1207 ~ 0%      -8.8%       1101 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
      1218 ~ 1%      -8.9%       1109 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
      2425 ~ 0%      -8.9%       2210 ~ 1%  TOTAL slabinfo.dentry.num_slabs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1207 ~ 0%      -8.8%       1101 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
      1218 ~ 1%      -8.9%       1109 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
      2425 ~ 0%      -8.9%       2210 ~ 1%  TOTAL slabinfo.dentry.active_sl=
abs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     50740 ~ 0%      -8.8%      46273 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
     51176 ~ 1%      -8.9%      46605 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
    101916 ~ 0%      -8.9%      92879 ~ 1%  TOTAL slabinfo.dentry.num_objs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     50656 ~ 0%      -8.7%      46255 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
     50970 ~ 1%      -8.7%      46552 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
    101626 ~ 0%      -8.7%      92808 ~ 1%  TOTAL slabinfo.dentry.active_ob=
js

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

    491760 ~ 3%     +12.3%     552159 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
    491760 ~ 3%     +12.3%     552159 ~ 2%  TOTAL numa-meminfo.node0.MemUsed

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1.05 ~ 3%     -11.3%       0.93 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
      1.05 ~ 3%     -11.3%       0.93 ~ 2%  TOTAL perf-profile.cpu-cycles.c=
opy_page_to_iter_iovec.copy_page_to_iter.pipe_read.new_sync_read.vfs_read

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      0.97 ~ 1%      +9.7%       1.07 ~ 2%  ivb44/dbench/100%
      0.97 ~ 1%      +9.7%       1.07 ~ 2%  TOTAL perf-profile.cpu-cycles.l=
ink_path_walk.path_lookupat.filename_lookup.user_path_at_empty.user_path_at

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

   3103430 ~ 0%     -57.9%    1305672 ~ 0%  ivb44/dbench/100%
   4952161 ~ 0%     -56.1%    2172644 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
 4.775e+08 ~ 2%      +8.2%  5.165e+08 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
    642569 ~ 3%     +94.9%    1252458 ~ 1%  xps2/pigz/100%-128K
    216579 ~ 2%     +77.7%     384853 ~ 0%  xps2/pigz/100%-512K
 4.864e+08 ~ 2%      +7.2%  5.216e+08 ~ 5%  TOTAL time.involuntary_context_=
switches

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

    138058 ~ 9%     +73.8%     239934 ~10%  ivb44/dbench/100%
    167586 ~ 1%     -53.0%      78711 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
    964376 ~ 0%     +54.8%    1492908 ~ 0%  xps2/pigz/100%-128K
    256555 ~ 0%     +69.3%     434263 ~ 0%  xps2/pigz/100%-512K
   1526576 ~ 1%     +47.1%    2245817 ~ 1%  TOTAL time.voluntary_context_sw=
itches

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     10572 ~ 0%     -16.1%       8866 ~ 1%  ivb44/dbench/100%
      5543 ~ 8%     -37.9%       3441 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
   4027219 ~ 0%     +11.5%    4489367 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
      5699 ~ 1%     +68.0%       9574 ~ 0%  xps2/pigz/100%-128K
      1953 ~ 1%     +63.8%       3199 ~ 0%  xps2/pigz/100%-512K
   4050987 ~ 0%     +11.4%    4514449 ~ 0%  TOTAL vmstat.system.cs

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     57947 ~ 0%     -22.4%      44941 ~ 0%  ivb44/dbench/100%
   1448800 ~ 0%     -33.6%     962489 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
      9833 ~ 0%      -7.6%       9081 ~ 0%  xps2/pigz/100%-128K
      8884 ~ 0%      -5.0%       8443 ~ 0%  xps2/pigz/100%-512K
   1525465 ~ 0%     -32.8%    1024956 ~ 1%  TOTAL vmstat.system.in

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

    172542 ~ 8%     +67.6%     289206 ~ 9%  ivb44/dbench/100%
 1.222e+09 ~ 0%      -3.3%  1.181e+09 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
    607327 ~ 2%     -28.1%     436757 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
     12860 ~ 0%      +4.0%      13375 ~ 0%  xps2/pigz/100%-128K
     26392 ~ 0%      +4.5%      27580 ~ 1%  xps2/pigz/100%-512K
 1.223e+09 ~ 0%      -3.3%  1.182e+09 ~ 0%  TOTAL time.minor_page_faults

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      4606 ~ 0%     -18.6%       3748 ~ 0%  ivb44/dbench/100%
      3057 ~ 0%      -8.2%       2808 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
      7663 ~ 0%     -14.4%       6556 ~ 0%  TOTAL time.percent_of_cpu_this_=
job_got

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     99.77 ~ 0%     -18.6%      81.20 ~ 0%  ivb44/dbench/100%
     96.82 ~ 0%      -5.1%      91.88 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
    196.59 ~ 0%     -12.0%     173.08 ~ 0%  TOTAL turbostat.%c0

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     23642 ~ 0%     -19.9%      18934 ~ 0%  ivb44/dbench/100%
     59622 ~ 0%      -3.4%      57581 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
     18300 ~ 2%     -10.6%      16368 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
    101564 ~ 0%      -8.5%      92884 ~ 0%  TOTAL time.system_time

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      1146 ~10%     -12.5%       1002 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
      1146 ~10%     -12.5%       1002 ~ 0%  TOTAL time.elapsed_time

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

      9537 ~ 0%     -15.3%       8073 ~ 1%  ivb44/dbench/100%
      4098 ~ 0%      -8.0%       3770 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
       923 ~ 2%      -8.5%        844 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
     14559 ~ 0%     -12.8%      12688 ~ 0%  TOTAL time.user_time

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

     18.22 ~ 0%      -5.9%      17.14 ~ 0%  ivb44/dbench/100%
     18.22 ~ 0%      -5.9%      17.14 ~ 0%  TOTAL turbostat.RAM_W

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       178 ~ 0%      -8.2%        164 ~ 0%  ivb44/dbench/100%
       160 ~ 0%      -2.5%        156 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
       339 ~ 0%      -5.5%        321 ~ 0%  TOTAL turbostat.Cor_W

69b181fe34a030a  2cade6c4d979ab646572c7751  =

---------------  -------------------------  =

       214 ~ 0%      -7.1%        199 ~ 0%  ivb44/dbench/100%
       188 ~ 0%      -2.3%        184 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
       403 ~ 0%      -4.8%        384 ~ 0%  TOTAL turbostat.Pkg_W


Legend:
	~XX%    - stddev percent
	[+-]XX% - change percent


                           time.voluntary_context_switches

  440000 O+---O----O--------O----------------------------------------------=
-+
  420000 ++            O                                                   =
 |
         |                                                                 =
 |
  400000 ++                                                                =
 |
  380000 ++                                                                =
 |
         |                                                                 =
 |
  360000 ++                                                                =
 |
  340000 ++                                                                =
 |
  320000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++                                                                =
 |
  280000 ++                                                                =
 |
         |                                                                 =
 |
  260000 *+...*....*...*....*....*....*....*...*....*....*....*...*....*...=
.*
  240000 ++----------------------------------------------------------------=
-+


                          time.involuntary_context_switches

  400000 ++----------------------------------------------------------------=
-+
  380000 O+   O    O   O    O                                              =
 |
         |                                                                 =
 |
  360000 ++                                                                =
 |
  340000 ++                                                                =
 |
         |                                                                 =
 |
  320000 ++                                                                =
 |
  300000 ++                                                                =
 |
  280000 ++                                                                =
 |
         |                                                                 =
 |
  260000 ++                                                                =
 |
  240000 ++                                                                =
 |
         |                                             ..*....*...         =
 |
  220000 *+...*....*...   ..*....*....*....*...*....*..           *....*...=
.|
  200000 ++------------*---------------------------------------------------=
-*


                                 vmstat.system.in

  9600 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  9400 ++   *                       .*.                                    =
 |
       |  .. +                    ..   ..                                  =
 |
       |..    +                .*.       .                                 =
 |
  9200 *+      +             ..                                            =
 |
       |        +   ..*....*.             *...                             =
 |
  9000 ++        *..                          *....*....                   =
 |
       |                                                *....*....*....*...=
.|
  8800 ++                                                                  =
 *
       |                                                                   =
 |
       |                                                                   =
 |
  8600 ++                                                                  =
 |
       |         O                                                         =
 |
  8400 O+---O---------O----O-----------------------------------------------=
-+


                                 vmstat.system.cs

  3400 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  3200 O+   O    O    O    O                                               =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2800 ++                                                                  =
 |
       |                                                                   =
 |
  2600 ++                                                                  =
 |
       |                                                                   =
 |
  2400 ++                                                                  =
 |
  2200 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                             ..*....              =
 |
       *....*....*....*....*....*....*....*...*....*..       *....*....*...=
.*
  1800 ++------------------------------------------------------------------=
-+


	[*] bisect-good sample
	[O] bisect-bad  sample


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.

Thanks,
Aaron

--===============1017087570469703059==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoK

--===============1017087570469703059==--

