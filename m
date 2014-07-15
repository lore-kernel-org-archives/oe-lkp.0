Content-Type: multipart/mixed; boundary="===============3203236734271293422=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: [sched] 90b105011e9: +220.6% ebizzy.throughput.per_thread.stddev_percent
Date: Tue, 15 Jul 2014 16:09:40 +0800
Message-ID: <53C4E1C4.5060205@intel.com>
In-Reply-To: <53c4e144.ggeaA2HLECbFAHzx%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3203236734271293422==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://bee.sh.intel.com/git/ydu19/linux rewrite-v2-on-3.16-rc3
commit 90b105011e9f1bd43efa21f3c2dd45f0f0a94853 ("sched: Rewrite per entity=
 runnable load average tracking")

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      0.08 ~ 3%    +220.6%       0.25 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
      0.08 ~ 3%    +220.6%       0.25 ~ 2%  TOTAL ebizzy.throughput.per_thr=
ead.stddev_percent

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

        78 ~ 1%     -44.0%         43 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
        78 ~ 1%     -44.0%         43 ~ 2%  TOTAL ebizzy.throughput.per_thr=
ead.min

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

     94327 ~ 0%     -34.4%      61894 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
     94327 ~ 0%     -34.4%      61894 ~ 6%  TOTAL hackbench.throughput

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       125 ~ 1%     +34.9%        168 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
       125 ~ 1%     +34.9%        168 ~ 1%  TOTAL ebizzy.throughput.per_thr=
ead.max

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

     12765 ~ 0%      -3.5%      12320 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
     12765 ~ 0%      -3.5%      12320 ~ 0%  TOTAL ebizzy.throughput

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

     40.84 ~ 0%      -2.8%      39.68 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
     40.84 ~ 0%      -2.8%      39.68 ~ 0%  TOTAL ebizzy.time.user

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       596 ~ 0%      -1.2%        588 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
       596 ~ 0%      -1.2%        588 ~ 0%  TOTAL ebizzy.time.sys

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

        31 ~ 0%    +438.1%        166 ~14%  lkp-nex04/ebizzy/200%-100x-10s
        31 ~ 0%    +437.4%        166 ~14%  lkp-snb01/hackbench/50%-process=
-pipe
        62 ~ 0%    +437.7%        333 ~14%  TOTAL slabinfo.nfs_inode_cache.=
num_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      0.13 ~ 3%    +609.0%       0.95 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
      0.13 ~ 3%    +609.0%       0.95 ~ 6%  TOTAL perf-profile.cpu-cycles.e=
nqueue_task_fair.enqueue_task.activate_task.ttwu_do_activate.try_to_wake_up

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      0.06 ~16%   +1544.8%       0.95 ~27%  lkp-snb01/hackbench/50%-process=
-pipe
      0.06 ~16%   +1544.8%       0.95 ~27%  TOTAL perf-profile.cpu-cycles.e=
ffective_load.isra.39.select_task_rq_fair.try_to_wake_up.default_wake_funct=
ion.autoremove_wake_function

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      0.28 ~ 3%    +481.2%       1.60 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
      0.28 ~ 3%    +481.2%       1.60 ~ 4%  TOTAL perf-profile.cpu-cycles.d=
equeue_task_fair.dequeue_task.deactivate_task.__schedule.schedule

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

     33045 ~41%   +9192.0%    3070587 ~11%  xps2/pigz/100%-128K
     33045 ~41%   +9192.0%    3070587 ~11%  TOTAL cpuidle.C1-NHM.time

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      3477 ~ 2%     -87.4%        437 ~44%  lkp-nex04/ebizzy/200%-100x-10s
      3477 ~ 2%     -87.4%        437 ~44%  TOTAL proc-vmstat.thp_fault_all=
oc

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      0.38 ~ 2%    +940.4%       3.91 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
      0.38 ~ 2%    +940.4%       3.91 ~ 7%  TOTAL perf-profile.cpu-cycles.d=
equeue_entity.dequeue_task_fair.dequeue_task.deactivate_task.__schedule

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

        31 ~ 0%    +438.1%        166 ~14%  lkp-nex04/ebizzy/200%-100x-10s
        31 ~ 0%    +437.4%        166 ~14%  lkp-snb01/hackbench/50%-process=
-pipe
        62 ~ 0%    +437.7%        333 ~14%  TOTAL slabinfo.nfs_inode_cache.=
active_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      0.15 ~24%    -100.0%       0.00 ~ 0%  xps2/pigz/100%-128K
      0.15 ~24%    -100.0%       0.00 ~ 0%  TOTAL turbostat.%pc6

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

        10 ~31%    +309.4%         43 ~27%  lkp-nex04/ebizzy/200%-100x-10s
        10 ~31%    +309.4%         43 ~27%  TOTAL numa-numastat.node1.other=
_node

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      7700 ~11%    +256.8%      27474 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
        65 ~14%   +3090.5%       2086 ~ 1%  xps2/pigz/100%-128K
      7766 ~11%    +280.6%      29561 ~ 4%  TOTAL cpuidle.C1-NHM.usage

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      0.96 ~ 2%    +312.4%       3.98 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
      0.96 ~ 2%    +312.4%       3.98 ~ 7%  TOTAL perf-profile.cpu-cycles.e=
nqueue_entity.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activate

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       245 ~33%    +536.6%       1559 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
       245 ~21%    +189.7%        711 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
       490 ~27%    +362.9%       2271 ~ 5%  TOTAL slabinfo.nfs_read_data.ac=
tive_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       245 ~33%    +536.6%       1559 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
       245 ~21%    +189.7%        711 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
       490 ~27%    +362.9%       2271 ~ 5%  TOTAL slabinfo.nfs_read_data.nu=
m_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      0.54 ~ 5%    +266.7%       1.98 ~ 8%  lkp-snb01/hackbench/50%-process=
-pipe
      0.54 ~ 5%    +266.7%       1.98 ~ 8%  TOTAL perf-profile.cpu-cycles.u=
pdate_cfs_shares.dequeue_entity.dequeue_task_fair.dequeue_task.deactivate_t=
ask

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

  26050068 ~ 0%     -66.2%    8797918 ~11%  lkp-snb01/hackbench/50%-process=
-pipe
  26050068 ~ 0%     -66.2%    8797918 ~11%  TOTAL numa-numastat.node0.local=
_node

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

  26052612 ~ 0%     -66.2%    8799611 ~11%  lkp-snb01/hackbench/50%-process=
-pipe
  26052612 ~ 0%     -66.2%    8799611 ~11%  TOTAL numa-numastat.node0.numa_=
hit

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      0.66 ~ 2%    +208.2%       2.03 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
      0.66 ~ 2%    +208.2%       2.03 ~ 7%  TOTAL perf-profile.cpu-cycles.u=
pdate_cfs_shares.enqueue_entity.enqueue_task_fair.enqueue_task.activate_task

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

        18 ~11%    +223.7%         60 ~15%  lkp-nex04/ebizzy/200%-100x-10s
        18 ~11%    +223.7%         60 ~15%  TOTAL numa-numastat.node3.other=
_node

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

   5000094 ~ 0%     -66.1%    1693077 ~11%  lkp-snb01/hackbench/50%-process=
-pipe
   5000094 ~ 0%     -66.1%    1693077 ~11%  TOTAL proc-vmstat.pgalloc_dma32

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

  48530586 ~ 0%     -65.9%   16553111 ~ 8%  lkp-snb01/hackbench/50%-process=
-pipe
  48530586 ~ 0%     -65.9%   16553111 ~ 8%  TOTAL proc-vmstat.pgalloc_normal

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

  53411898 ~ 0%     -66.0%   18154935 ~ 8%  lkp-snb01/hackbench/50%-process=
-pipe
  53411898 ~ 0%     -66.0%   18154935 ~ 8%  TOTAL proc-vmstat.numa_local

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

  53416133 ~ 0%     -66.0%   18159158 ~ 8%  lkp-snb01/hackbench/50%-process=
-pipe
  53416133 ~ 0%     -66.0%   18159158 ~ 8%  TOTAL proc-vmstat.numa_hit

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

  53511788 ~ 0%     -65.9%   18229726 ~ 8%  lkp-snb01/hackbench/50%-process=
-pipe
  53511788 ~ 0%     -65.9%   18229726 ~ 8%  TOTAL proc-vmstat.pgfree

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

  27374593 ~ 0%     -65.8%    9362195 ~ 9%  lkp-snb01/hackbench/50%-process=
-pipe
  27374593 ~ 0%     -65.8%    9362195 ~ 9%  TOTAL numa-numastat.node1.local=
_node

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

  27376287 ~ 0%     -65.8%    9364726 ~ 9%  lkp-snb01/hackbench/50%-process=
-pipe
  27376287 ~ 0%     -65.8%    9364726 ~ 9%  TOTAL numa-numastat.node1.numa_=
hit

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      0.69 ~ 5%    +187.9%       1.99 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
      0.69 ~ 5%    +187.9%       1.99 ~ 7%  TOTAL perf-profile.cpu-cycles._=
raw_spin_lock_irq.__schedule.schedule.pipe_wait.pipe_read

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

  13314878 ~ 0%     -61.9%    5072798 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
  13314878 ~ 0%     -61.9%    5072798 ~ 7%  TOTAL numa-vmstat.node0.numa_lo=
cal

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

  13379562 ~ 0%     -61.9%    5099009 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
  13379562 ~ 0%     -61.9%    5099009 ~ 6%  TOTAL numa-vmstat.node0.numa_hit

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

  14038787 ~ 0%     -61.8%    5363607 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
  14038787 ~ 0%     -61.8%    5363607 ~ 4%  TOTAL numa-vmstat.node1.numa_lo=
cal

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

  14048697 ~ 0%     -61.5%    5412165 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
  14048697 ~ 0%     -61.5%    5412165 ~ 4%  TOTAL numa-vmstat.node1.numa_hit

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      0.18 ~ 4%    +125.0%       0.40 ~ 5%  xps2/pigz/100%-128K
      0.18 ~ 4%     +91.3%       0.35 ~ 7%  xps2/pigz/100%-512K
      0.36 ~ 4%    +107.8%       0.75 ~ 6%  TOTAL turbostat.%c1

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1031 ~ 6%    +170.6%       2789 ~15%  lkp-nex04/ebizzy/200%-100x-10s
      1031 ~ 6%    +170.6%       2789 ~15%  TOTAL cpuidle.C1E-NHM.usage

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       120 ~27%    +121.2%        265 ~32%  lkp-nex04/ebizzy/200%-100x-10s
       120 ~27%    +121.2%        265 ~32%  TOTAL slabinfo.UDPv6.active_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       120 ~27%    +121.2%        265 ~32%  lkp-nex04/ebizzy/200%-100x-10s
       120 ~27%    +121.2%        265 ~32%  TOTAL slabinfo.UDPv6.num_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

    179754 ~31%     -63.1%      66317 ~15%  lkp-nex04/ebizzy/200%-100x-10s
       578 ~10%     -56.4%        252 ~ 7%  xps2/pigz/100%-512K
    180332 ~31%     -63.1%      66570 ~15%  TOTAL cpuidle.C3-NHM.usage

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1.87 ~ 4%    +130.3%       4.31 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
      1.87 ~ 4%    +130.3%       4.31 ~ 6%  TOTAL perf-profile.cpu-cycles._=
raw_spin_lock.try_to_wake_up.default_wake_function.autoremove_wake_function=
.__wake_up_common

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1.26 ~ 6%     -53.8%       0.58 ~23%  lkp-snb01/hackbench/50%-process=
-pipe
      1.26 ~ 6%     -53.8%       0.58 ~23%  TOTAL perf-profile.cpu-cycles.o=
sq_lock.__mutex_lock_slowpath.mutex_lock.pipe_write.new_sync_write

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      5294 ~ 0%     -55.2%       2369 ~13%  lkp-snb01/hackbench/50%-process=
-pipe
      5294 ~ 0%     -55.2%       2369 ~13%  TOTAL cpuidle.C3-SNB.usage

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1.39 ~ 3%     -51.8%       0.67 ~13%  lkp-snb01/hackbench/50%-process=
-pipe
      1.39 ~ 3%     -51.8%       0.67 ~13%  TOTAL perf-profile.cpu-cycles._=
_mutex_lock_slowpath.mutex_lock.pipe_write.new_sync_write.vfs_write

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       408 ~ 0%    +120.0%        897 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
       346 ~11%     +97.1%        683 ~ 8%  lkp-snb01/hackbench/50%-process=
-pipe
       754 ~ 5%    +109.5%       1581 ~ 7%  TOTAL slabinfo.mnt_cache.active=
_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       408 ~ 0%    +120.0%        897 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
       346 ~11%     +97.1%        683 ~ 8%  lkp-snb01/hackbench/50%-process=
-pipe
       754 ~ 5%    +109.5%       1581 ~ 7%  TOTAL slabinfo.mnt_cache.num_ob=
js

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      0.21 ~ 6%     -46.6%       0.11 ~23%  xps2/pigz/100%-128K
      0.20 ~10%     -50.5%       0.10 ~27%  xps2/pigz/100%-512K
      0.40 ~ 8%     -48.5%       0.21 ~25%  TOTAL turbostat.%c6

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1907 ~ 3%    +105.5%       3919 ~ 9%  lkp-snb01/hackbench/50%-process=
-pipe
      1907 ~ 3%    +105.5%       3919 ~ 9%  TOTAL numa-vmstat.node0.nr_page=
_table_pages

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       230 ~ 4%     -44.3%        128 ~ 7%  lkp-nex04/ebizzy/200%-100x-10s
       746 ~ 0%     -53.7%        346 ~14%  lkp-snb01/hackbench/50%-process=
-pipe
       977 ~ 1%     -51.5%        474 ~12%  TOTAL numa-vmstat.node1.nr_kern=
el_stack

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      3697 ~ 4%     -44.3%       2059 ~ 7%  lkp-nex04/ebizzy/200%-100x-10s
     11940 ~ 0%     -53.6%       5543 ~13%  lkp-snb01/hackbench/50%-process=
-pipe
     15637 ~ 1%     -51.4%       7602 ~12%  TOTAL numa-meminfo.node1.Kernel=
Stack

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

        24 ~15%     +95.1%         48 ~13%  lkp-nex04/ebizzy/200%-100x-10s
        24 ~15%     +95.1%         48 ~13%  TOTAL numa-numastat.node2.other=
_node

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1.31 ~ 4%     -48.1%       0.68 ~17%  lkp-snb01/hackbench/50%-process=
-pipe
      1.31 ~ 4%     -48.1%       0.68 ~17%  TOTAL perf-profile.cpu-cycles.m=
utex_spin_on_owner.__mutex_lock_slowpath.mutex_lock.pipe_write.new_sync_wri=
te

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

        11 ~21%    +135.1%         26 ~29%  lkp-nex04/ebizzy/200%-100x-10s
        11 ~21%    +135.1%         26 ~29%  TOTAL numa-numastat.node0.other=
_node

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1.24 ~ 1%     -47.2%       0.66 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
      1.24 ~ 1%     -47.2%       0.66 ~ 6%  TOTAL perf-profile.cpu-cycles.v=
fs_write.sys_write.system_call_fastpath.__write_nocancel

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

     65905 ~ 1%     -43.2%      37404 ~15%  lkp-snb01/hackbench/50%-process=
-pipe
     65905 ~ 1%     -43.2%      37404 ~15%  TOTAL cpuidle.C7-SNB.usage

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

    713527 ~ 7%     -41.8%     415278 ~17%  lkp-snb01/hackbench/50%-process=
-pipe
    713527 ~ 7%     -41.8%     415278 ~17%  TOTAL cpuidle.C3-SNB.time

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1.70 ~ 1%     -42.5%       0.98 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
      1.70 ~ 1%     -42.5%       0.98 ~ 2%  TOTAL perf-profile.cpu-cycles._=
_fget_light.sys_write.system_call_fastpath.__write_nocancel

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       684 ~ 6%    +112.8%       1455 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
       756 ~ 8%     +42.9%       1080 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
      1440 ~ 7%     +76.1%       2535 ~ 5%  TOTAL slabinfo.RAW.num_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       684 ~ 6%    +112.8%       1455 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
       756 ~ 8%     +42.9%       1080 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
      1440 ~ 7%     +76.1%       2535 ~ 5%  TOTAL slabinfo.RAW.active_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       544 ~ 0%     +70.8%        930 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
       544 ~ 0%     +70.8%        930 ~ 5%  TOTAL numa-vmstat.node0.nr_kern=
el_stack

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      8245 ~ 2%     +63.6%      13492 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
      8245 ~ 2%     +63.6%      13492 ~ 5%  TOTAL numa-vmstat.node0.nr_slab=
_unreclaimable

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

     32982 ~ 2%     +63.6%      53973 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
     32982 ~ 2%     +63.6%      53973 ~ 5%  TOTAL numa-meminfo.node0.SUnrec=
laim

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       647 ~21%     +31.0%        847 ~14%  lkp-nex04/ebizzy/200%-100x-10s
      7622 ~ 3%    +105.8%      15686 ~ 8%  lkp-snb01/hackbench/50%-process=
-pipe
      8269 ~ 5%    +100.0%      16534 ~ 9%  TOTAL numa-meminfo.node0.PageTa=
bles

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

     17280 ~ 1%     -38.0%      10710 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
     17280 ~ 1%     -38.0%      10710 ~ 7%  TOTAL numa-vmstat.node1.nr_slab=
_unreclaimable

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

     69099 ~ 1%     -38.0%      42837 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
     69099 ~ 1%     -38.0%      42837 ~ 7%  TOTAL numa-meminfo.node1.SUnrec=
laim

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1.96 ~ 3%     -39.6%       1.18 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
      1.96 ~ 3%     -39.6%       1.18 ~ 3%  TOTAL perf-profile.cpu-cycles.p=
ipe_write.new_sync_write.vfs_write.sys_write.system_call_fastpath

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

    176373 ~ 4%     +79.0%     315783 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
     66273 ~ 0%     -33.6%      44026 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
    242647 ~ 3%     +48.3%     359809 ~ 4%  TOTAL proc-vmstat.pgmigrate_suc=
cess

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

    176373 ~ 4%     +79.0%     315783 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
     66273 ~ 0%     -33.6%      44026 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
    242647 ~ 3%     +48.3%     359809 ~ 4%  TOTAL proc-vmstat.numa_pages_mi=
grated

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      2.40 ~ 2%     -39.3%       1.46 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
      2.40 ~ 2%     -39.3%       1.46 ~ 6%  TOTAL perf-profile.cpu-cycles.m=
utex_lock.pipe_write.new_sync_write.vfs_write.sys_write

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      0.54 ~35%     +61.7%       0.87 ~25%  xps2/pigz/100%-128K
      0.79 ~15%     +46.3%       1.16 ~25%  xps2/pigz/100%-512K
      1.33 ~23%     +52.6%       2.03 ~25%  TOTAL perf-profile.cpu-cycles.t=
ask_tick_fair.scheduler_tick.update_process_times.tick_sched_handle.tick_sc=
hed_timer

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      4.24 ~ 2%     -38.0%       2.63 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
      4.24 ~ 2%     -38.0%       2.63 ~ 4%  TOTAL perf-profile.cpu-cycles.m=
utex_unlock.new_sync_write.vfs_write.sys_write.system_call_fastpath

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

    288905 ~ 5%     +99.5%     576507 ~37%  xps2/pigz/100%-128K
    288905 ~ 5%     +99.5%     576507 ~37%  TOTAL cpuidle.C3-NHM.time

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       431 ~ 2%     -36.5%        274 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
       431 ~ 2%     -36.5%        274 ~ 2%  TOTAL slabinfo.kmalloc-192.acti=
ve_slabs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       431 ~ 2%     -36.5%        274 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
       431 ~ 2%     -36.5%        274 ~ 2%  TOTAL slabinfo.kmalloc-192.num_=
slabs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       282 ~12%     -20.7%        223 ~11%  lkp-nex04/ebizzy/200%-100x-10s
      4880 ~ 0%     -45.5%       2658 ~13%  lkp-snb01/hackbench/50%-process=
-pipe
      5162 ~ 1%     -44.2%       2882 ~13%  TOTAL numa-vmstat.node1.nr_page=
_table_pages

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1131 ~12%     -20.8%        896 ~11%  lkp-nex04/ebizzy/200%-100x-10s
     19497 ~ 0%     -45.5%      10630 ~13%  lkp-snb01/hackbench/50%-process=
-pipe
     20629 ~ 1%     -44.1%      11526 ~13%  TOTAL numa-meminfo.node1.PageTa=
bles

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

     92848 ~ 2%     -31.5%      63575 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
     92848 ~ 2%     -31.5%      63575 ~ 6%  TOTAL numa-meminfo.node1.Slab

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

     52700 ~ 3%     +44.2%      75978 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
     52700 ~ 3%     +44.2%      75978 ~ 5%  TOTAL numa-meminfo.node0.Slab

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

    387862 ~ 0%     -29.0%     275268 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
    387862 ~ 0%     -29.0%     275268 ~ 2%  TOTAL proc-vmstat.numa_pte_upda=
tes

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      5083 ~ 1%     +14.8%       5837 ~ 3%  lkp-nex04/ebizzy/200%-100x-10s
      8726 ~ 1%     +70.7%      14900 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
     13810 ~ 1%     +50.2%      20738 ~ 4%  TOTAL numa-meminfo.node0.Kernel=
Stack

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      7854 ~ 1%     +40.2%      11011 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
      7854 ~ 1%     +40.2%      11011 ~ 1%  TOTAL slabinfo.Acpi-Namespace.a=
ctive_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      7854 ~ 1%     +40.2%      11011 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
      7854 ~ 1%     +40.2%      11011 ~ 1%  TOTAL slabinfo.Acpi-Namespace.n=
um_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1.24 ~ 1%     -28.6%       0.88 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
      1.24 ~ 1%     -28.6%       0.88 ~ 3%  TOTAL perf-profile.cpu-cycles.t=
ry_to_wake_up.default_wake_function.autoremove_wake_function.__wake_up_comm=
on.__wake_up_sync_key

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      9909 ~ 2%     -18.1%       8118 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
     18162 ~ 2%     -36.5%      11527 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
     28071 ~ 2%     -30.0%      19646 ~ 1%  TOTAL slabinfo.kmalloc-192.num_=
objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1672 ~ 3%     +54.7%       2587 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
      1417 ~ 7%     +20.1%       1703 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
      3090 ~ 5%     +38.8%       4290 ~ 3%  TOTAL slabinfo.sock_inode_cache=
.num_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1672 ~ 3%     +54.7%       2587 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
      1417 ~ 7%     +20.1%       1703 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
      3090 ~ 5%     +38.8%       4290 ~ 3%  TOTAL slabinfo.sock_inode_cache=
.active_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

    751758 ~ 3%     -32.9%     504399 ~ 3%  lkp-nex04/ebizzy/200%-100x-10s
    127894 ~ 0%     -21.4%     100534 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
    879652 ~ 2%     -31.2%     604934 ~ 4%  TOTAL proc-vmstat.numa_hint_fau=
lts_local

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

   5674268 ~ 3%     -22.7%    4387467 ~13%  xps2/pigz/100%-512K
   5674268 ~ 3%     -22.7%    4387467 ~13%  TOTAL cpuidle.C6-NHM.time

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

    226646 ~ 0%     -25.8%     168276 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
    226646 ~ 0%     -25.8%     168276 ~ 3%  TOTAL proc-vmstat.numa_hint_fau=
lts

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      6896 ~ 0%     -26.1%       5096 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
      6896 ~ 0%     -26.1%       5096 ~ 0%  TOTAL slabinfo.files_cache.num_=
objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      6896 ~ 0%     -26.1%       5096 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
      6896 ~ 0%     -26.1%       5096 ~ 0%  TOTAL slabinfo.files_cache.acti=
ve_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1.07 ~ 7%     -29.3%       0.76 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
      1.07 ~ 7%     -29.3%       0.76 ~ 3%  TOTAL perf-profile.cpu-cycles._=
_sb_start_write.pipe_write.new_sync_write.vfs_write.sys_write

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

  41318119 ~ 2%     -25.0%   30984280 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
  41318119 ~ 2%     -25.0%   30984280 ~ 3%  TOTAL cpuidle.C7-SNB.time

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       499 ~ 5%     -17.9%        409 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
       499 ~ 5%     -17.9%        409 ~ 7%  TOTAL slabinfo.kmem_cache.num_o=
bjs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       499 ~ 5%     -17.9%        409 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
       499 ~ 5%     -17.9%        409 ~ 7%  TOTAL slabinfo.kmem_cache.activ=
e_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1783 ~ 1%     +30.4%       2325 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
      1783 ~ 1%     +30.4%       2325 ~ 0%  TOTAL numa-meminfo.node3.Kernel=
Stack

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1680 ~ 6%     +27.3%       2139 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
      1680 ~ 6%     +27.3%       2139 ~ 2%  TOTAL numa-meminfo.node2.Kernel=
Stack

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      9909 ~ 2%     -18.1%       8118 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
     18124 ~ 2%     -36.4%      11527 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
      2659 ~ 7%     +13.1%       3009 ~ 2%  xps2/pigz/100%-512K
     30693 ~ 3%     -26.2%      22655 ~ 1%  TOTAL slabinfo.kmalloc-192.acti=
ve_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1154 ~ 7%     +35.9%       1569 ~ 5%  xps2/pigz/100%-128K
      1245 ~ 6%     -26.3%        917 ~10%  xps2/pigz/100%-512K
      2399 ~ 7%      +3.6%       2486 ~ 7%  TOTAL cpuidle.C6-NHM.usage

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      2.45 ~ 1%     -22.1%       1.91 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
      2.45 ~ 1%     -22.1%       1.91 ~ 2%  TOTAL perf-profile.cpu-cycles.c=
opy_user_generic_string.copy_page_to_iter.pipe_read.new_sync_read.vfs_read

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

     12302 ~ 8%     -18.8%       9995 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
     15880 ~ 2%     -24.9%      11921 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
     28183 ~ 4%     -22.2%      21917 ~ 4%  TOTAL slabinfo.kmalloc-256.acti=
ve_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

     12779 ~ 8%     -19.5%      10289 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
     16146 ~ 2%     -25.2%      12073 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
     28926 ~ 4%     -22.7%      22362 ~ 4%  TOTAL slabinfo.kmalloc-256.num_=
objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       975 ~12%     +24.8%       1216 ~10%  lkp-nex04/ebizzy/200%-100x-10s
       975 ~12%     +24.8%       1216 ~10%  TOTAL slabinfo.bdev_cache.activ=
e_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       975 ~12%     +24.8%       1216 ~10%  lkp-nex04/ebizzy/200%-100x-10s
       975 ~12%     +24.8%       1216 ~10%  TOTAL slabinfo.bdev_cache.num_o=
bjs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      2.96 ~ 1%     -21.0%       2.34 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
      2.96 ~ 1%     -21.0%       2.34 ~ 3%  TOTAL perf-profile.cpu-cycles.i=
dle_cpu.select_task_rq_fair.try_to_wake_up.default_wake_function.autoremove=
_wake_function

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

     11923 ~ 2%     -20.5%       9474 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
      9950 ~ 2%     -21.8%       7781 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
     21873 ~ 2%     -21.1%      17255 ~ 1%  TOTAL slabinfo.kmalloc-128.num_=
objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

     11912 ~ 2%     -20.5%       9466 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
      9927 ~ 2%     -21.6%       7781 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
     21839 ~ 2%     -21.0%      17247 ~ 1%  TOTAL slabinfo.kmalloc-128.acti=
ve_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1.21 ~ 2%     -20.5%       0.96 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
      4.32 ~ 7%     +35.9%       5.87 ~ 4%  xps2/pigz/100%-128K
      7.01 ~ 4%     +20.0%       8.42 ~ 6%  xps2/pigz/100%-512K
     12.55 ~ 5%     +21.6%      15.25 ~ 5%  TOTAL perf-profile.cpu-cycles.c=
opy_user_generic_string.copy_page_from_iter.pipe_write.new_sync_write.vfs_w=
rite

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       609 ~ 4%     -14.7%        519 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
       609 ~ 4%     -14.7%        519 ~ 6%  TOTAL slabinfo.kmem_cache_node.=
active_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       627 ~ 4%     -14.3%        537 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
       627 ~ 4%     -14.3%        537 ~ 5%  TOTAL slabinfo.kmem_cache_node.=
num_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      6515 ~ 6%     -19.2%       5261 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
      6515 ~ 6%     -19.2%       5261 ~ 1%  TOTAL slabinfo.task_xstate.acti=
ve_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      6542 ~ 6%     -19.1%       5290 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
      6542 ~ 6%     -19.1%       5290 ~ 1%  TOTAL slabinfo.task_xstate.num_=
objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

    126604 ~11%     -20.7%     100390 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
     71139 ~ 6%     +20.2%      85475 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
    197744 ~ 9%      -6.0%     185865 ~ 4%  TOTAL meminfo.DirectMap4k

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

     17133 ~ 3%     +23.7%      21185 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
      3668 ~10%     +22.9%       4507 ~ 5%  xps2/pigz/100%-128K
      3606 ~ 8%     +24.2%       4479 ~13%  xps2/pigz/100%-512K
     24407 ~ 5%     +23.6%      30171 ~ 6%  TOTAL slabinfo.anon_vma.num_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

     17133 ~ 3%     +23.7%      21185 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
      3668 ~10%     +22.9%       4507 ~ 5%  xps2/pigz/100%-128K
      3606 ~ 8%     +23.2%       4445 ~14%  xps2/pigz/100%-512K
     24407 ~ 5%     +23.5%      30137 ~ 6%  TOTAL slabinfo.anon_vma.active_=
objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1.33 ~ 1%     -17.1%       1.11 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
      1.33 ~ 1%     -17.1%       1.11 ~ 2%  TOTAL perf-profile.cpu-cycles.p=
ipe_read.new_sync_read.vfs_read.sys_read.system_call_fastpath

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

     29821 ~ 7%     +12.9%      33678 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
     29821 ~ 7%     +12.9%      33678 ~ 6%  TOTAL numa-meminfo.node3.Slab

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

   4595951 ~ 1%      +9.5%    5031138 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
   1473658 ~ 1%     -10.9%    1313231 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
    107028 ~ 2%     -27.5%      77542 ~ 6%  xps2/pigz/100%-128K
    104772 ~ 1%     -17.9%      85990 ~ 4%  xps2/pigz/100%-512K
   6281411 ~ 1%      +3.6%    6507902 ~ 3%  TOTAL softirqs.RCU

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      3619 ~ 4%     +17.4%       4247 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
      3619 ~ 4%     +17.4%       4247 ~ 2%  TOTAL slabinfo.shmem_inode_cach=
e.num_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      3619 ~ 4%     +17.4%       4247 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
      3619 ~ 4%     +17.4%       4247 ~ 2%  TOTAL slabinfo.shmem_inode_cach=
e.active_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1770 ~ 4%     +20.3%       2129 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
      1770 ~ 4%     +20.3%       2129 ~ 4%  TOTAL slabinfo.blkdev_ioc.activ=
e_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      0.12 ~ 3%     -18.6%       0.10 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
      0.12 ~ 3%     -18.6%       0.10 ~ 5%  TOTAL turbostat.%c7

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1770 ~ 4%     +20.3%       2129 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
      1770 ~ 4%     +20.3%       2129 ~ 4%  TOTAL slabinfo.blkdev_ioc.num_o=
bjs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

     10358 ~ 2%     -15.7%       8737 ~ 3%  lkp-nex04/ebizzy/200%-100x-10s
     10358 ~ 2%     -15.7%       8737 ~ 3%  TOTAL slabinfo.kmalloc-512.acti=
ve_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1266 ~ 7%     -11.5%       1120 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
      1266 ~ 7%     -11.5%       1120 ~ 7%  TOTAL numa-meminfo.node1.Unevic=
table

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       316 ~ 7%     -11.4%        280 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
       316 ~ 7%     -11.4%        280 ~ 7%  TOTAL numa-vmstat.node1.nr_unev=
ictable

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1253 ~ 7%     -11.7%       1107 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
      1253 ~ 7%     -11.7%       1107 ~ 7%  TOTAL numa-meminfo.node1.Mlocked

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       313 ~ 7%     -11.6%        276 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
       313 ~ 7%     -11.6%        276 ~ 7%  TOTAL numa-vmstat.node1.nr_mlock

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

     10436 ~ 2%     -15.2%       8850 ~ 3%  lkp-nex04/ebizzy/200%-100x-10s
     10436 ~ 2%     -15.2%       8850 ~ 3%  TOTAL slabinfo.kmalloc-512.num_=
objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      8.63 ~ 1%     -15.5%       7.29 ~ 8%  lkp-snb01/hackbench/50%-process=
-pipe
      8.63 ~ 1%     -15.5%       7.29 ~ 8%  TOTAL perf-profile.cpu-cycles._=
raw_spin_lock_irqsave.__wake_up_sync_key.pipe_write.new_sync_write.vfs_write

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

     10.72 ~ 6%     -17.2%       8.87 ~ 3%  xps2/pigz/100%-512K
     10.72 ~ 6%     -17.2%       8.87 ~ 3%  TOTAL perf-profile.cpu-cycles.d=
eflateSetDictionary

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1.33 ~10%     -17.6%       1.10 ~12%  lkp-snb01/hackbench/50%-process=
-pipe
      1.33 ~10%     -17.6%       1.10 ~12%  TOTAL perf-profile.cpu-cycles.a=
vc_has_perm.inode_has_perm.file_has_perm.selinux_file_permission.security_f=
ile_permission

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

    556666 ~ 3%     -12.6%     486635 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
    556666 ~ 3%     -12.6%     486635 ~ 3%  TOTAL numa-meminfo.node1.MemUsed

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       336 ~ 6%     +10.8%        372 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
       336 ~ 6%     +10.8%        372 ~ 5%  TOTAL numa-vmstat.node0.nr_unev=
ictable

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1345 ~ 6%     +10.8%       1491 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
      1345 ~ 6%     +10.8%       1491 ~ 5%  TOTAL numa-meminfo.node0.Unevic=
table

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      3319 ~ 4%     -12.4%       2906 ~ 5%  xps2/pigz/100%-512K
      3319 ~ 4%     -12.4%       2906 ~ 5%  TOTAL slabinfo.vm_area_struct.a=
ctive_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1578 ~ 3%     +12.2%       1770 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
      1578 ~ 3%     +12.2%       1770 ~ 3%  TOTAL slabinfo.kmalloc-2048.act=
ive_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1330 ~ 6%     +11.0%       1476 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
      1330 ~ 6%     +11.0%       1476 ~ 5%  TOTAL numa-meminfo.node0.Mlocked

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       332 ~ 6%     +11.0%        369 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
       332 ~ 6%     +11.0%        369 ~ 5%  TOTAL numa-vmstat.node0.nr_mlock

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      3359 ~ 3%     -12.0%       2955 ~ 4%  xps2/pigz/100%-512K
      3359 ~ 3%     -12.0%       2955 ~ 4%  TOTAL slabinfo.vm_area_struct.n=
um_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

     32706 ~ 6%     +14.1%      37325 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
     32706 ~ 6%     +14.1%      37325 ~ 5%  TOTAL numa-meminfo.node3.Active

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

    492581 ~ 3%     +12.6%     554760 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
    492581 ~ 3%     +12.6%     554760 ~ 3%  TOTAL numa-meminfo.node0.MemUsed

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

     17831 ~ 1%     -10.1%      16030 ~ 2%  xps2/pigz/100%-128K
     17380 ~ 2%     -14.2%      14918 ~ 3%  xps2/pigz/100%-512K
     35212 ~ 1%     -12.1%      30948 ~ 2%  TOTAL softirqs.SCHED

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      6163 ~ 0%     -12.3%       5403 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
      6163 ~ 0%     -12.3%       5403 ~ 1%  TOTAL slabinfo.kmalloc-1024.num=
_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      2746 ~ 2%     +15.3%       3167 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
      2746 ~ 2%     +15.3%       3167 ~ 4%  TOTAL slabinfo.kmalloc-96.activ=
e_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      2788 ~ 2%     +15.1%       3208 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
      2788 ~ 2%     +15.1%       3208 ~ 4%  TOTAL slabinfo.kmalloc-96.num_o=
bjs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

   2180282 ~ 0%     -12.6%    1905527 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
   2180282 ~ 0%     -12.6%    1905527 ~ 2%  TOTAL proc-vmstat.pgfault

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      6020 ~ 4%      +8.5%       6530 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
      1643 ~ 0%     -10.0%       1479 ~ 1%  xps2/pigz/100%-128K
      7663 ~ 3%      +4.5%       8009 ~ 5%  TOTAL slabinfo.proc_inode_cache=
.active_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      6091 ~ 1%     -11.7%       5378 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
      6091 ~ 1%     -11.7%       5378 ~ 1%  TOTAL slabinfo.kmalloc-1024.act=
ive_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      6225 ~ 4%      +9.2%       6800 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
      1643 ~ 0%      -9.6%       1486 ~ 1%  xps2/pigz/100%-128K
      7869 ~ 3%      +5.3%       8286 ~ 4%  TOTAL slabinfo.proc_inode_cache=
.num_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      1689 ~ 3%     +11.6%       1884 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
      1689 ~ 3%     +11.6%       1884 ~ 4%  TOTAL slabinfo.kmalloc-2048.num=
_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      2049 ~ 2%     +13.9%       2335 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
      2049 ~ 2%     +13.9%       2335 ~ 2%  TOTAL slabinfo.xfs_buf.active_o=
bjs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      2049 ~ 2%     +13.9%       2335 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
      2049 ~ 2%     +13.9%       2335 ~ 2%  TOTAL slabinfo.xfs_buf.num_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      2208 ~ 2%     +13.9%       2516 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
      2208 ~ 2%     +13.9%       2516 ~ 2%  TOTAL slabinfo.blkdev_requests.=
active_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      2208 ~ 2%     +13.9%       2516 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
      2208 ~ 2%     +13.9%       2516 ~ 2%  TOTAL slabinfo.blkdev_requests.=
num_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      2618 ~ 1%      +9.5%       2866 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
      2618 ~ 1%      +9.5%       2866 ~ 1%  TOTAL slabinfo.signal_cache.act=
ive_objs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

   4955169 ~ 0%     -20.2%    3954599 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
 4.846e+08 ~ 0%     +35.3%  6.554e+08 ~15%  lkp-snb01/hackbench/50%-process=
-pipe
    652246 ~ 0%    +103.5%    1327360 ~ 0%  xps2/pigz/100%-128K
    218987 ~ 1%     +89.5%     415071 ~ 0%  xps2/pigz/100%-512K
 4.904e+08 ~ 0%     +34.8%  6.611e+08 ~15%  TOTAL time.involuntary_context_=
switches

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

    166228 ~ 1%     -37.4%     103980 ~15%  lkp-nex04/ebizzy/200%-100x-10s
    966547 ~ 0%     +45.6%    1407110 ~ 0%  xps2/pigz/100%-128K
    257447 ~ 0%     +56.8%     403743 ~ 0%  xps2/pigz/100%-512K
   1390222 ~ 0%     +37.7%    1914835 ~ 1%  TOTAL time.voluntary_context_sw=
itches

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

   4037924 ~ 0%      +8.3%    4371093 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
      5750 ~ 0%     +65.1%       9492 ~ 0%  xps2/pigz/100%-128K
      1970 ~ 0%     +61.0%       3172 ~ 0%  xps2/pigz/100%-512K
   4045644 ~ 0%      +8.4%    4383759 ~ 1%  TOTAL vmstat.system.cs

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

 1.227e+09 ~ 0%      -3.5%  1.185e+09 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
    616315 ~ 0%     -32.2%     417574 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
 1.228e+09 ~ 0%      -3.5%  1.185e+09 ~ 0%  TOTAL time.minor_page_faults

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

  59644.43 ~ 0%      -1.2%   58921.96 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
     18.39 ~ 1%     +29.2%      23.76 ~ 0%  xps2/pigz/100%-128K
  59662.82 ~ 0%      -1.2%   58945.73 ~ 0%  TOTAL time.system_time

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

   1445520 ~ 0%     -24.6%    1090360 ~11%  lkp-snb01/hackbench/50%-process=
-pipe
      9896 ~ 0%      -2.2%       9683 ~ 0%  xps2/pigz/100%-128K
      8922 ~ 0%      -2.4%       8708 ~ 0%  xps2/pigz/100%-512K
   1464338 ~ 0%     -24.3%    1108751 ~11%  TOTAL vmstat.system.in

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

      4099 ~ 0%      -3.1%       3971 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
      4099 ~ 0%      -3.1%       3971 ~ 0%  TOTAL time.user_time

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       161 ~ 0%      -2.4%        157 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
       161 ~ 0%      -2.4%        157 ~ 0%  TOTAL turbostat.Cor_W

fd470ff9da8ec69  90b105011e9f1bd43efa21f3c  =

---------------  -------------------------  =

       189 ~ 0%      -2.3%        184 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
       189 ~ 0%      -2.3%        184 ~ 0%  TOTAL turbostat.Pkg_W


Legend:
	~XX%    - stddev percent
	[+-]XX% - change percent


                           time.voluntary_context_switches

  420000 ++----------------------------------------------------------------=
-+
         O    O        O    O                                              =
 |
  400000 ++        O                                                       =
 |
  380000 ++                                                                =
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
         |                                                                 =
 |
  280000 ++                                                                =
 |
  260000 ++                                                                =
 |
         *....*....*...*....*....*....*....*...*....*....*....*...*....*...=
.*
  240000 ++----------------------------------------------------------------=
-+


                          time.involuntary_context_switches

  450000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
         O    O    O   O    O                                              =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
         |                                                                 =
 |
  350000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++                                                                =
 |
         |                                                                 =
 |
         |                                                                 =
 |
  250000 ++                                                                =
 |
         |                                                                 =
 |
         *....*....*...        ..*....*....*...*....*....*....*...*....*...=
.*
  200000 ++------------*----*----------------------------------------------=
-+


                                 vmstat.system.in

  9500 ++------------------------------------------------------------------=
-+
       |                             *                                     =
 |
  9400 ++   *                      .. :                                    =
 |
  9300 ++  . :                   ..    :                                   =
 |
       | ..   :                 *       :                                  =
 |
  9200 ++      :              ..        :                                  =
 |
  9100 *+      :     .*.... ..           :                                 =
 |
       |        :  ..      *              *...                             =
 |
  9000 ++        *.                           *....*....                   =
 |
  8900 ++                                               *....*....*....*...=
.*
       |                                                                   =
 |
  8800 ++                                                                  =
 |
  8700 O+        O    O    O                                               =
 |
       |    O                                                              =
 |
  8600 ++------------------------------------------------------------------=
-+


                                 vmstat.system.cs

  3200 O+---O----O----O----O-----------------------------------------------=
-+
       |                                                                   =
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
       |                                                                   =
 |
  2200 ++                                                                  =
 |
       |                                                                   =
 |
  2000 *+...*....*....        ..*....*....*...        ..*....*....*....*...=
.*
       |              *....*..                *....*..                     =
 |
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

--===============3203236734271293422==
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

--===============3203236734271293422==--

