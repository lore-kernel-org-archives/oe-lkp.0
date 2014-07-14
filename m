Content-Type: multipart/mixed; boundary="===============0153281514546919092=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: [sched] dc09d70da67: dmesg.page_allocation_failure:order:, mode
Date: Mon, 14 Jul 2014 13:14:04 +0800
Message-ID: <53C3671C.5030706@intel.com>
In-Reply-To: <53c34d10.22EOXYRyoFcQLgBg%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0153281514546919092==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://bee.sh.intel.com/git/ydu19/linux rewrite-v1.2-on-3.16-rc3
commit dc09d70da67f3c92f34ed31bdb01137d8068f330 ("sched: Rewrite per entity=
 runnable load average tracking")

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

         0           +Inf%          0 ~100%  vm-kbuild-yocto-ia32/boot/1
         0           +Inf%          0 ~100%  TOTAL dmesg.page_allocation_fa=
ilure:order:,mode

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      0.08 ~ 3%    +236.5%       0.26 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
      0.08 ~ 3%    +236.5%       0.26 ~ 2%  TOTAL ebizzy.throughput.per_thr=
ead.stddev_percent

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

        78 ~ 0%     -45.0%         43 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
        78 ~ 0%     -45.0%         43 ~ 2%  TOTAL ebizzy.throughput.per_thr=
ead.min

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       124 ~ 0%     +36.0%        169 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
       124 ~ 0%     +36.0%        169 ~ 1%  TOTAL ebizzy.throughput.per_thr=
ead.max

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

    155810 ~ 3%      -7.9%     143426 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    146931 ~ 1%      +3.2%     151568 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    172780 ~ 1%     -20.9%     136589 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    152966 ~ 0%      +2.1%     156241 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     95943 ~ 0%     -29.8%      67348 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
     86759 ~ 0%     -24.9%      65177 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
     90232 ~ 0%     -31.5%      61817 ~ 8%  lkp-snb01/hackbench/50%-threads=
-pipe
     79416 ~ 0%     -21.8%      62070 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
    980841 ~ 1%     -13.9%     844239 ~ 1%  TOTAL hackbench.throughput

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     41.46 ~ 0%      -4.3%      39.66 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
     41.46 ~ 0%      -4.3%      39.66 ~ 0%  TOTAL ebizzy.time.user

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     12773 ~ 0%      -3.4%      12334 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
     12773 ~ 0%      -3.4%      12334 ~ 0%  TOTAL ebizzy.throughput

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       595 ~ 0%      -1.0%        589 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
       595 ~ 0%      -1.0%        589 ~ 0%  TOTAL ebizzy.time.sys

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      0.18 ~28%    -100.0%       0.00 ~ 0%  xps2/pigz/100%-128K
      0.19 ~26%    -100.0%       0.00 ~ 0%  xps2/pigz/100%-512K
      0.37 ~27%    -100.0%       0.00 ~ 0%  TOTAL turbostat.%pc6

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     26596 ~32%  +10066.9%    2704033 ~21%  xps2/pigz/100%-128K
     26596 ~32%  +10066.9%    2704033 ~21%  TOTAL cpuidle.C1-NHM.time

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      0.07 ~11%   +1525.6%       1.06 ~15%  lkp-snb01/hackbench/50%-threads=
-pipe
      0.07 ~11%   +1525.6%       1.06 ~15%  TOTAL perf-profile.cpu-cycles.e=
ffective_load.isra.39.select_task_rq_fair.try_to_wake_up.default_wake_funct=
ion.autoremove_wake_function

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      3293 ~ 3%     -89.8%        336 ~12%  lkp-nex04/ebizzy/200%-100x-10s
      3293 ~ 3%     -89.8%        336 ~12%  TOTAL proc-vmstat.thp_fault_all=
oc

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

        37 ~33%    +314.5%        154 ~12%  lkp-nex04/ebizzy/200%-100x-10s
        36 ~31%    +325.8%        154 ~16%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
        36 ~31%    +411.5%        185 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
        31 ~ 0%    +364.5%        144 ~26%  lkp-snb01/hackbench/1600%-threa=
ds-socket
        36 ~31%    +276.6%        136 ~18%  lkp-snb01/hackbench/50%-process=
-pipe
        31 ~ 0%    +397.8%        154 ~16%  lkp-snb01/hackbench/50%-process=
-socket
        31 ~ 0%    +463.4%        174 ~ 8%  lkp-snb01/hackbench/50%-threads=
-pipe
        36 ~31%    +327.6%        154 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
       274 ~21%    +357.3%       1257 ~11%  TOTAL slabinfo.nfs_inode_cache.=
num_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

        37 ~33%    +314.5%        154 ~12%  lkp-nex04/ebizzy/200%-100x-10s
        36 ~31%    +325.8%        154 ~16%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
        36 ~31%    +411.5%        185 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
        31 ~ 0%    +364.5%        144 ~26%  lkp-snb01/hackbench/1600%-threa=
ds-socket
        36 ~31%    +276.6%        136 ~18%  lkp-snb01/hackbench/50%-process=
-pipe
        31 ~ 0%    +397.8%        154 ~16%  lkp-snb01/hackbench/50%-process=
-socket
        31 ~ 0%    +463.4%        174 ~ 8%  lkp-snb01/hackbench/50%-threads=
-pipe
        36 ~31%    +327.6%        154 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
       274 ~21%    +357.3%       1257 ~11%  TOTAL slabinfo.nfs_inode_cache.=
active_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      0.30 ~10%    +364.8%       1.41 ~18%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      0.35 ~ 3%    +954.3%       3.69 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
      0.28 ~ 6%    +526.7%       1.72 ~ 4%  lkp-snb01/hackbench/50%-process=
-socket
      0.38 ~ 2%   +1000.9%       4.18 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
      0.29 ~ 6%    +504.6%       1.75 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
      1.60 ~ 5%    +698.3%      12.76 ~ 5%  TOTAL perf-profile.cpu-cycles.d=
equeue_entity.dequeue_task_fair.dequeue_task.deactivate_task.__schedule

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      7406 ~11%    +261.1%      26745 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
      7406 ~11%    +261.1%      26745 ~ 1%  TOTAL cpuidle.C1-NHM.usage

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

   1221786 ~45%     -45.0%     672015 ~34%  lkp-snb01/hackbench/1600%-threa=
ds-socket
   1221786 ~45%     -45.0%     672015 ~34%  TOTAL cpuidle.POLL.time

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      0.52 ~13%    +231.4%       1.72 ~16%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      0.81 ~ 3%    +365.6%       3.75 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
      0.57 ~ 2%    +283.5%       2.17 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
      0.83 ~ 1%    +404.6%       4.20 ~ 4%  lkp-snb01/hackbench/50%-threads=
-pipe
      0.60 ~ 2%    +260.4%       2.16 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
      3.32 ~ 4%    +321.4%      13.99 ~ 4%  TOTAL perf-profile.cpu-cycles.e=
nqueue_entity.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activate

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

        14 ~16%    +235.7%         47 ~12%  lkp-nex04/ebizzy/200%-100x-10s
        14 ~16%    +235.7%         47 ~12%  TOTAL numa-numastat.node1.other=
_node

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      0.53 ~ 4%    +255.1%       1.87 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
      0.49 ~ 3%    +338.5%       2.13 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
      1.01 ~ 3%    +295.1%       4.00 ~ 3%  TOTAL perf-profile.cpu-cycles.u=
pdate_cfs_shares.dequeue_entity.dequeue_task_fair.dequeue_task.deactivate_t=
ask

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      9724 ~16%    +651.6%      73087 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
      9724 ~16%    +651.6%      73087 ~ 2%  TOTAL numa-vmstat.node1.numa_ot=
her

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       206 ~29%    +618.2%       1479 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
       203 ~12%    +228.3%        667 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
       221 ~ 3%    +228.7%        726 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-socket
       178 ~ 7%    +309.5%        731 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
       185 ~18%    +268.5%        682 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-socket
       249 ~12%    +201.8%        752 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
       240 ~13%    +232.1%        799 ~ 8%  lkp-snb01/hackbench/50%-process=
-socket
       219 ~11%    +223.5%        710 ~ 4%  lkp-snb01/hackbench/50%-threads=
-pipe
       241 ~12%    +204.7%        734 ~ 8%  lkp-snb01/hackbench/50%-threads=
-socket
      1944 ~13%    +274.5%       7282 ~ 5%  TOTAL slabinfo.nfs_read_data.nu=
m_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       206 ~29%    +618.2%       1479 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
       203 ~12%    +228.3%        667 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
       221 ~ 3%    +228.7%        726 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-socket
       178 ~ 7%    +309.5%        731 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
       185 ~18%    +268.5%        682 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-socket
       249 ~12%    +201.8%        752 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
       240 ~13%    +232.1%        799 ~ 8%  lkp-snb01/hackbench/50%-process=
-socket
       219 ~11%    +223.5%        710 ~ 4%  lkp-snb01/hackbench/50%-threads=
-pipe
       241 ~12%    +204.7%        734 ~ 8%  lkp-snb01/hackbench/50%-threads=
-socket
      1944 ~13%    +274.5%       7282 ~ 5%  TOTAL slabinfo.nfs_read_data.ac=
tive_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      0.65 ~ 5%    +193.3%       1.92 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
      0.67 ~ 3%    +224.3%       2.16 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
      1.32 ~ 4%    +208.9%       4.07 ~ 3%  TOTAL perf-profile.cpu-cycles.u=
pdate_cfs_shares.enqueue_entity.enqueue_task_fair.enqueue_task.activate_task

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      5047 ~ 1%     +16.9%       5901 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
     37650 ~49%    +417.8%     194953 ~12%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     11147 ~35%   +1304.7%     156586 ~22%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      9594 ~19%   +1388.8%     142851 ~ 8%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      8765 ~ 3%     +60.8%      14096 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
      8624 ~ 0%     +48.8%      12834 ~12%  lkp-snb01/hackbench/50%-process=
-socket
      8675 ~ 1%     +57.4%      13653 ~13%  lkp-snb01/hackbench/50%-threads=
-pipe
      8699 ~ 0%     +48.1%      12886 ~10%  lkp-snb01/hackbench/50%-threads=
-socket
     98204 ~25%    +463.9%     553764 ~14%  TOTAL numa-meminfo.node0.Kernel=
Stack

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       314 ~ 1%     +17.1%        368 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
       693 ~35%   +1315.3%       9810 ~22%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
       598 ~19%   +1408.6%       9026 ~ 9%  lkp-snb01/hackbench/1600%-threa=
ds-socket
       547 ~ 3%     +61.0%        881 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
       538 ~ 0%     +48.7%        801 ~12%  lkp-snb01/hackbench/50%-process=
-socket
       541 ~ 1%     +57.3%        852 ~13%  lkp-snb01/hackbench/50%-threads=
-pipe
       543 ~ 0%     +48.2%        805 ~10%  lkp-snb01/hackbench/50%-threads=
-socket
      3777 ~10%    +496.8%      22545 ~15%  TOTAL numa-vmstat.node0.nr_kern=
el_stack

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1.87 ~ 4%    +117.3%       4.07 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
      1.84 ~ 5%    +104.0%       3.75 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
      3.71 ~ 5%    +110.7%       7.82 ~ 3%  TOTAL perf-profile.cpu-cycles._=
raw_spin_lock.try_to_wake_up.default_wake_function.autoremove_wake_function=
.__wake_up_common

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      3573 ~ 4%     +34.8%       4816 ~14%  lkp-nex04/ebizzy/200%-100x-10s
     66302 ~ 8%     +30.9%      86813 ~11%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     67617 ~ 8%     +48.6%     100510 ~ 9%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      4135 ~11%    +641.8%      30680 ~20%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      3565 ~ 8%    +661.9%      27161 ~12%  lkp-snb01/hackbench/1600%-threa=
ds-socket
    145194 ~ 8%     +72.2%     249982 ~11%  TOTAL numa-vmstat.node0.nr_anon=
_pages

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      3623 ~ 4%     +32.4%       4796 ~14%  lkp-nex04/ebizzy/200%-100x-10s
     66305 ~ 8%     +30.9%      86790 ~11%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     67594 ~ 8%     +48.6%     100438 ~ 9%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      4107 ~11%    +641.8%      30471 ~20%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      3542 ~ 8%    +660.4%      26938 ~12%  lkp-snb01/hackbench/1600%-threa=
ds-socket
    145172 ~ 8%     +71.8%     249434 ~11%  TOTAL numa-vmstat.node0.nr_acti=
ve_anon

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     14300 ~ 4%     +34.8%      19273 ~14%  lkp-nex04/ebizzy/200%-100x-10s
    264758 ~ 8%     +28.8%     341089 ~ 9%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    269757 ~ 9%     +47.9%     399027 ~10%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     16551 ~11%    +636.1%     121833 ~20%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     14274 ~ 9%    +656.6%     108005 ~12%  lkp-snb01/hackbench/1600%-threa=
ds-socket
    579642 ~ 8%     +70.7%     989229 ~11%  TOTAL numa-meminfo.node0.AnonPa=
ges

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     14508 ~ 4%     +32.2%      19185 ~14%  lkp-nex04/ebizzy/200%-100x-10s
    264763 ~ 8%     +28.8%     340979 ~ 9%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    269656 ~ 9%     +47.9%     398723 ~10%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     16439 ~11%    +636.1%     121005 ~20%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     14182 ~ 9%    +655.0%     107073 ~12%  lkp-snb01/hackbench/1600%-threa=
ds-socket
    579550 ~ 8%     +70.3%     986966 ~11%  TOTAL numa-meminfo.node0.Active=
(anon)

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

        19 ~23%    +190.5%         55 ~ 7%  lkp-nex04/ebizzy/200%-100x-10s
        19 ~23%    +190.5%         55 ~ 7%  TOTAL numa-numastat.node2.other=
_node

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1049 ~ 9%    +163.8%       2768 ~ 7%  lkp-nex04/ebizzy/200%-100x-10s
      1049 ~ 9%    +163.8%       2768 ~ 7%  TOTAL cpuidle.C1E-NHM.usage

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     47891 ~19%    +436.3%     256836 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    156322 ~11%    +112.5%     332223 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     38292 ~11%     +56.2%      59824 ~ 6%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     65991 ~ 1%     -28.2%      47353 ~10%  lkp-snb01/hackbench/50%-process=
-pipe
    321534 ~ 2%     -69.8%      97256 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
     65839 ~ 2%     -38.1%      40775 ~18%  lkp-snb01/hackbench/50%-threads=
-pipe
    286571 ~ 1%     -70.2%      85471 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
    982443 ~ 4%      -6.4%     919740 ~ 4%  TOTAL cpuidle.C7-SNB.usage

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      0.70 ~ 6%    +169.4%       1.89 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
      0.76 ~ 7%    +147.0%       1.87 ~ 4%  lkp-snb01/hackbench/50%-threads=
-pipe
      1.46 ~ 6%    +157.8%       3.76 ~ 3%  TOTAL perf-profile.cpu-cycles._=
raw_spin_lock_irq.__schedule.schedule.pipe_wait.pipe_read

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      0.26 ~ 5%     -49.8%       0.13 ~17%  xps2/pigz/100%-128K
      0.27 ~ 5%     -62.1%       0.10 ~31%  xps2/pigz/100%-512K
      0.52 ~ 5%     -56.1%       0.23 ~23%  TOTAL turbostat.%c6

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      0.57 ~ 2%    +164.6%       1.50 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
      0.44 ~ 4%    +122.6%       0.99 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
      0.60 ~ 2%    +165.4%       1.58 ~ 4%  lkp-snb01/hackbench/50%-threads=
-pipe
      0.48 ~ 3%    +118.0%       1.05 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
      2.09 ~ 3%    +145.2%       5.12 ~ 1%  TOTAL perf-profile.cpu-cycles.d=
equeue_task_fair.dequeue_task.deactivate_task.__schedule.schedule

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     16252 ~36%    +338.8%      71309 ~16%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     67143 ~ 9%     +77.3%     119033 ~ 9%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      8636 ~11%    +335.7%      37627 ~19%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     52629 ~10%     +64.2%      86402 ~10%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      8193 ~ 7%     +63.7%      13414 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
      9468 ~ 4%     +43.5%      13591 ~18%  lkp-snb01/hackbench/50%-process=
-socket
      8509 ~ 6%     +19.5%      10169 ~ 6%  lkp-snb01/hackbench/50%-threads=
-pipe
    170832 ~11%    +105.8%     351548 ~12%  TOTAL numa-vmstat.node0.nr_slab=
_unreclaimable

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     64491 ~36%    +330.6%     277720 ~15%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    264205 ~ 9%     +80.9%     478015 ~ 8%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     34580 ~11%    +334.1%     150114 ~19%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    207414 ~ 9%     +67.0%     346399 ~10%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     32777 ~ 7%     +63.7%      53650 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
     37862 ~ 4%     +43.7%      54391 ~18%  lkp-snb01/hackbench/50%-process=
-socket
     34038 ~ 6%     +19.5%      40687 ~ 6%  lkp-snb01/hackbench/50%-threads=
-pipe
    675368 ~11%    +107.4%    1400977 ~11%  TOTAL numa-meminfo.node0.SUnrec=
laim

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1.19 ~ 3%     -23.0%       0.92 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
      1.19 ~ 2%     -15.3%       1.00 ~ 0%  lkp-snb01/hackbench/50%-threads=
-pipe
      2.38 ~ 3%     -19.2%       1.92 ~ 1%  TOTAL perf-profile.cpu-cycles.t=
ry_to_wake_up.default_wake_function.autoremove_wake_function.__wake_up_comm=
on.__wake_up_sync_key

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     11980 ~28%     -40.3%       7149 ~11%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      2494 ~11%     +56.5%       3904 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      5110 ~ 7%     -38.5%       3144 ~10%  lkp-snb01/hackbench/50%-process=
-pipe
     24402 ~ 4%     -69.7%       7400 ~ 4%  lkp-snb01/hackbench/50%-process=
-socket
      4984 ~ 7%     -43.8%       2801 ~17%  lkp-snb01/hackbench/50%-threads=
-pipe
     21747 ~ 4%     -70.4%       6441 ~ 6%  lkp-snb01/hackbench/50%-threads=
-socket
     70719 ~ 9%     -56.4%      30840 ~ 8%  TOTAL cpuidle.C3-SNB.usage

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       235 ~ 5%     -42.3%        135 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
     16903 ~ 6%     -56.7%       7313 ~24%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     16302 ~ 6%     -61.0%       6359 ~23%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     14166 ~ 1%     -63.6%       5160 ~45%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     15462 ~ 1%     -60.2%       6146 ~13%  lkp-snb01/hackbench/1600%-threa=
ds-socket
       741 ~ 2%     -46.2%        398 ~14%  lkp-snb01/hackbench/50%-process=
-pipe
       745 ~ 0%     -36.4%        474 ~21%  lkp-snb01/hackbench/50%-process=
-socket
       749 ~ 0%     -42.9%        427 ~26%  lkp-snb01/hackbench/50%-threads=
-pipe
       738 ~ 0%     -36.2%        471 ~17%  lkp-snb01/hackbench/50%-threads=
-socket
     66043 ~ 3%     -59.3%      26886 ~25%  TOTAL numa-vmstat.node1.nr_kern=
el_stack

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      3764 ~ 5%     -42.1%       2177 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
    270688 ~ 6%     -54.9%     122158 ~21%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    259612 ~ 6%     -60.2%     103289 ~24%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    226515 ~ 1%     -63.2%      83403 ~45%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    246230 ~ 0%     -58.9%     101236 ~11%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     11910 ~ 2%     -46.4%       6387 ~14%  lkp-snb01/hackbench/50%-process=
-pipe
     11936 ~ 0%     -36.4%       7597 ~21%  lkp-snb01/hackbench/50%-process=
-socket
     11995 ~ 0%     -42.9%       6853 ~26%  lkp-snb01/hackbench/50%-threads=
-pipe
     11846 ~ 0%     -36.2%       7562 ~17%  lkp-snb01/hackbench/50%-threads=
-socket
   1054499 ~ 3%     -58.2%     440664 ~24%  TOTAL numa-meminfo.node1.Kernel=
Stack

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

    164124 ~42%     -62.1%      62257 ~ 7%  lkp-nex04/ebizzy/200%-100x-10s
       638 ~37%     -57.8%        269 ~15%  xps2/pigz/100%-512K
    164763 ~42%     -62.1%      62527 ~ 7%  TOTAL cpuidle.C3-NHM.usage

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

    102376 ~ 5%     -31.4%      70193 ~11%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    101988 ~ 4%     -36.6%      64626 ~13%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     43006 ~ 1%     -58.9%      17675 ~34%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     42650 ~ 0%     -51.9%      20505 ~17%  lkp-snb01/hackbench/1600%-threa=
ds-socket
    290021 ~ 3%     -40.3%     173000 ~15%  TOTAL numa-vmstat.node1.nr_acti=
ve_anon

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

    102419 ~ 5%     -31.4%      70210 ~11%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    102055 ~ 4%     -36.6%      64670 ~13%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     43273 ~ 1%     -58.7%      17872 ~34%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     42956 ~ 0%     -51.7%      20748 ~17%  lkp-snb01/hackbench/1600%-threa=
ds-socket
    290704 ~ 3%     -40.3%     173501 ~15%  TOTAL numa-vmstat.node1.nr_anon=
_pages

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1.09 ~ 3%     -47.5%       0.57 ~10%  lkp-snb01/hackbench/50%-process=
-socket
      1.09 ~ 3%     -47.5%       0.57 ~10%  TOTAL perf-profile.cpu-cycles.k=
mem_cache_alloc_node.__alloc_skb.sock_alloc_send_pskb.unix_stream_sendmsg.s=
ock_aio_write

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1.28 ~ 4%     -43.9%       0.72 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
      1.01 ~ 5%     -51.4%       0.49 ~11%  lkp-snb01/hackbench/50%-threads=
-pipe
      2.29 ~ 5%     -47.2%       1.21 ~ 7%  TOTAL perf-profile.cpu-cycles.o=
sq_lock.__mutex_lock_slowpath.mutex_lock.pipe_write.new_sync_write

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       387 ~ 6%    +126.3%        877 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
       340 ~14%     +80.0%        612 ~13%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
       365 ~14%    +100.0%        731 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-socket
       323 ~11%    +121.1%        714 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
       365 ~12%     +86.0%        680 ~ 7%  lkp-snb01/hackbench/1600%-threa=
ds-socket
       348 ~10%    +113.7%        744 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
       314 ~14%    +116.2%        680 ~ 9%  lkp-snb01/hackbench/50%-process=
-socket
       348 ~ 5%    +124.4%        782 ~ 8%  lkp-snb01/hackbench/50%-threads=
-pipe
       365 ~ 9%     +81.4%        663 ~ 6%  lkp-snb01/hackbench/50%-threads=
-socket
      3158 ~10%    +105.3%       6483 ~ 6%  TOTAL slabinfo.mnt_cache.active=
_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       387 ~ 6%    +126.3%        877 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
       340 ~14%     +80.0%        612 ~13%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
       365 ~14%    +100.0%        731 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-socket
       323 ~11%    +121.1%        714 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
       365 ~12%     +86.0%        680 ~ 7%  lkp-snb01/hackbench/1600%-threa=
ds-socket
       348 ~10%    +113.7%        744 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
       314 ~14%    +116.2%        680 ~ 9%  lkp-snb01/hackbench/50%-process=
-socket
       348 ~ 5%    +124.4%        782 ~ 8%  lkp-snb01/hackbench/50%-threads=
-pipe
       365 ~ 9%     +81.4%        663 ~ 6%  lkp-snb01/hackbench/50%-threads=
-socket
      3158 ~10%    +105.3%       6483 ~ 6%  TOTAL slabinfo.mnt_cache.num_ob=
js

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

    409503 ~ 5%     -29.7%     287973 ~11%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    405592 ~ 4%     -35.1%     263197 ~14%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    171975 ~ 1%     -58.3%      71651 ~35%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    170756 ~ 1%     -51.5%      82857 ~15%  lkp-snb01/hackbench/1600%-threa=
ds-socket
   1157827 ~ 4%     -39.1%     705680 ~15%  TOTAL numa-meminfo.node1.Active=
(anon)

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

    409680 ~ 5%     -29.7%     288049 ~11%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    405857 ~ 4%     -35.1%     263480 ~14%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    173041 ~ 1%     -58.1%      72440 ~34%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    171978 ~ 1%     -51.3%      83799 ~15%  lkp-snb01/hackbench/1600%-threa=
ds-socket
   1160558 ~ 4%     -39.0%     707769 ~15%  TOTAL numa-meminfo.node1.AnonPa=
ges

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     83878 ~29%    +265.5%     306585 ~14%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    285825 ~ 8%     +79.1%     512042 ~ 8%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     57870 ~14%    +206.5%     177399 ~18%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    228434 ~10%     +67.4%     382366 ~10%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     54498 ~ 6%     +40.3%      76488 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
     57939 ~ 4%     +33.2%      77186 ~12%  lkp-snb01/hackbench/50%-process=
-socket
     53138 ~ 4%     +16.1%      61702 ~ 4%  lkp-snb01/hackbench/50%-threads=
-pipe
    821584 ~10%     +94.0%    1593770 ~11%  TOTAL numa-meminfo.node0.Slab

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       129 ~13%     -55.9%         57 ~47%  lkp-nex04/ebizzy/200%-100x-10s
       129 ~13%     -55.9%         57 ~47%  TOTAL numa-vmstat.node0.nr_dirt=
ied

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       129 ~13%     -56.0%         56 ~47%  lkp-nex04/ebizzy/200%-100x-10s
       129 ~13%     -56.0%         56 ~47%  TOTAL numa-vmstat.node0.nr_writ=
ten

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       103 ~24%    +103.5%        211 ~ 6%  lkp-snb01/hackbench/1600%-proce=
ss-socket
        92 ~14%    +132.9%        214 ~10%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      1070 ~ 8%     -27.2%        779 ~ 6%  lkp-snb01/hackbench/50%-process=
-socket
      1041 ~24%     -35.3%        673 ~ 6%  lkp-snb01/hackbench/50%-threads=
-socket
      2307 ~17%     -18.6%       1878 ~ 6%  TOTAL cpuidle.POLL.usage

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     11873 ~34%     +32.1%      15679 ~26%  lkp-snb01/hackbench/50%-process=
-socket
     11873 ~34%     +32.1%      15679 ~26%  TOTAL numa-vmstat.node0.nr_acti=
ve_file

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     47493 ~34%     +32.1%      62719 ~25%  lkp-snb01/hackbench/50%-process=
-socket
     47493 ~34%     +32.1%      62719 ~25%  TOTAL numa-meminfo.node0.Active=
(file)

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

   1370693 ~18%    +248.4%    4775843 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
   3306148 ~20%    +107.0%    6842535 ~10%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    948044 ~15%     +73.6%    1645429 ~15%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
   2098905 ~16%     +43.1%    3003034 ~ 8%  lkp-snb01/hackbench/1600%-threa=
ds-socket
    649589 ~ 5%     -24.5%     490545 ~23%  lkp-snb01/hackbench/50%-process=
-pipe
   2037721 ~ 7%     -33.6%    1353826 ~11%  lkp-snb01/hackbench/50%-process=
-socket
   1929715 ~ 4%     -43.7%    1087132 ~ 5%  lkp-snb01/hackbench/50%-threads=
-socket
  12340818 ~13%     +55.6%   19198346 ~ 8%  TOTAL cpuidle.C3-SNB.time

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1.36 ~ 2%     -44.7%       0.75 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
      1.10 ~ 3%     -48.6%       0.56 ~ 9%  lkp-snb01/hackbench/50%-threads=
-pipe
      2.46 ~ 2%     -46.4%       1.32 ~ 5%  TOTAL perf-profile.cpu-cycles._=
_mutex_lock_slowpath.mutex_lock.pipe_write.new_sync_write.vfs_write

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      2.85 ~ 1%     +14.7%       3.27 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
      2.85 ~ 1%     +14.7%       3.27 ~ 1%  TOTAL perf-profile.cpu-cycles._=
_schedule.schedule.pipe_wait.pipe_read.new_sync_read

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

 1.024e+08 ~10%     -24.7%   77061491 ~ 6%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
  12859162 ~ 6%     -40.2%    7686875 ~14%  lkp-snb01/hackbench/1600%-proce=
ss-socket
 1.082e+08 ~ 4%     -33.3%   72199839 ~ 7%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
   2661585 ~ 1%     -31.5%    1822628 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-socket
  27980307 ~ 0%     -60.4%   11087894 ~ 8%  lkp-snb01/hackbench/50%-process=
-pipe
  24178871 ~ 0%     -63.6%    8806666 ~15%  lkp-snb01/hackbench/50%-threads=
-pipe
 2.782e+08 ~ 5%     -35.8%  1.787e+08 ~ 7%  TOTAL numa-numastat.node1.numa_=
hit

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      2.81 ~ 2%     -15.2%       2.38 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
      1.37 ~ 7%     +31.8%       1.80 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
      2.84 ~ 1%     -12.0%       2.50 ~ 1%  lkp-snb01/hackbench/50%-threads=
-pipe
      1.56 ~ 3%     +15.0%       1.80 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
      8.58 ~ 3%      -1.1%       8.49 ~ 1%  TOTAL perf-profile.cpu-cycles.i=
dle_cpu.select_task_rq_fair.try_to_wake_up.default_wake_function.autoremove=
_wake_function

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      2.70 ~ 5%     -15.1%       2.29 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      3.01 ~ 4%     +17.3%       3.53 ~ 4%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      1.49 ~ 4%     -17.1%       1.24 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      4.38 ~ 1%     -17.3%       3.62 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
      4.10 ~ 0%     -13.0%       3.57 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
      0.19 ~ 4%     +97.9%       0.37 ~10%  xps2/pigz/100%-128K
      0.19 ~ 2%     +77.3%       0.34 ~14%  xps2/pigz/100%-512K
     16.07 ~ 2%      -6.9%      14.97 ~ 3%  TOTAL turbostat.%c1

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

  20352345 ~14%     -62.9%    7552807 ~11%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
  18390752 ~ 6%     -49.0%    9374991 ~21%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
 1.036e+08 ~ 0%     -15.7%   87346682 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
  94620137 ~ 0%     -12.4%   82856049 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
 2.369e+08 ~ 2%     -21.0%  1.871e+08 ~ 3%  TOTAL cpuidle.C1-SNB.usage

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1.27 ~ 2%     -41.9%       0.74 ~ 9%  lkp-snb01/hackbench/50%-threads=
-pipe
      1.27 ~ 2%     -41.9%       0.74 ~ 9%  TOTAL perf-profile.cpu-cycles.v=
fs_write.sys_write.system_call_fastpath

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

 1.815e+08 ~ 2%     -20.5%  1.442e+08 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
  54831312 ~ 0%     -60.3%   21783750 ~ 9%  lkp-snb01/hackbench/50%-process=
-pipe
   2388562 ~ 0%     +14.9%    2744634 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
  47712481 ~ 0%     -63.5%   17401600 ~15%  lkp-snb01/hackbench/50%-threads=
-pipe
 2.864e+08 ~ 1%     -35.0%  1.862e+08 ~ 5%  TOTAL proc-vmstat.numa_local

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

 1.815e+08 ~ 2%     -20.5%  1.442e+08 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
  54835538 ~ 0%     -60.3%   21787991 ~ 9%  lkp-snb01/hackbench/50%-process=
-pipe
   2392806 ~ 0%     +14.9%    2748870 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
  47716680 ~ 0%     -63.5%   17405798 ~15%  lkp-snb01/hackbench/50%-threads=
-pipe
 2.864e+08 ~ 1%     -35.0%  1.862e+08 ~ 5%  TOTAL proc-vmstat.numa_hit

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

  63433025 ~14%     +34.5%   85303646 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
   5632615 ~12%    +105.8%   11592082 ~ 9%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    954545 ~ 5%    +104.3%    1949932 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-socket
  26855550 ~ 0%     -60.1%   10706694 ~11%  lkp-snb01/hackbench/50%-process=
-pipe
   1105824 ~ 1%     +24.3%    1374022 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
  23535705 ~ 0%     -63.4%    8602912 ~16%  lkp-snb01/hackbench/50%-threads=
-pipe
    962221 ~ 1%     +15.0%    1106762 ~ 6%  lkp-snb01/hackbench/50%-threads=
-socket
 122479486 ~ 8%      -1.5%  120636052 ~ 3%  TOTAL numa-numastat.node0.local=
_node

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

  63436530 ~14%     +34.5%   85305062 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
   5636814 ~12%    +105.7%   11596294 ~ 9%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    956644 ~ 5%    +104.0%    1951334 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-socket
  26857664 ~ 0%     -60.1%   10707557 ~11%  lkp-snb01/hackbench/50%-process=
-pipe
   1108643 ~ 1%     +24.1%    1375436 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
  23539901 ~ 0%     -63.4%    8607108 ~16%  lkp-snb01/hackbench/50%-threads=
-pipe
    963622 ~ 1%     +15.1%    1109564 ~ 6%  lkp-snb01/hackbench/50%-threads=
-socket
 122499819 ~ 8%      -1.5%  120652358 ~ 3%  TOTAL numa-numastat.node0.numa_=
hit

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      0.72 ~ 5%     -59.3%       0.29 ~11%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      0.87 ~ 6%     -58.0%       0.37 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      0.14 ~ 5%     -33.0%       0.10 ~ 8%  lkp-snb01/hackbench/50%-process=
-pipe
      0.15 ~ 4%     -37.0%       0.10 ~ 4%  lkp-snb01/hackbench/50%-process=
-socket
      0.14 ~22%     -45.2%       0.08 ~ 6%  lkp-snb01/hackbench/50%-threads=
-pipe
      0.13 ~ 5%     -34.2%       0.09 ~ 5%  lkp-snb01/hackbench/50%-threads=
-socket
      2.16 ~ 6%     -53.0%       1.02 ~ 7%  TOTAL turbostat.%c7

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      2.04 ~ 2%     -41.5%       1.19 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
      2.57 ~ 1%     -45.4%       1.40 ~ 5%  lkp-snb01/hackbench/50%-threads=
-pipe
      4.61 ~ 1%     -43.7%       2.60 ~ 3%  TOTAL perf-profile.cpu-cycles.p=
ipe_write.new_sync_write.vfs_write.sys_write.system_call_fastpath

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

 1.024e+08 ~10%     -24.7%   77058672 ~ 6%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
  12859160 ~ 6%     -40.2%    7686848 ~14%  lkp-snb01/hackbench/1600%-proce=
ss-socket
 1.082e+08 ~ 4%     -33.3%   72198428 ~ 7%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
   2659485 ~ 1%     -31.6%    1819827 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-socket
  27978196 ~ 0%     -60.4%   11084515 ~ 8%  lkp-snb01/hackbench/50%-process=
-pipe
  24178869 ~ 0%     -63.6%    8806664 ~15%  lkp-snb01/hackbench/50%-threads=
-pipe
   1017939 ~ 1%     +12.8%    1147888 ~ 4%  lkp-snb01/hackbench/50%-threads=
-socket
 2.792e+08 ~ 5%     -35.6%  1.798e+08 ~ 7%  TOTAL numa-numastat.node1.local=
_node

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

 1.703e+08 ~ 2%     -22.3%  1.324e+08 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
  49796886 ~ 0%     -60.2%   19821415 ~ 9%  lkp-snb01/hackbench/50%-process=
-pipe
   7374646 ~ 0%     +29.7%    9565386 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
  43290967 ~ 0%     -63.4%   15828974 ~15%  lkp-snb01/hackbench/50%-threads=
-pipe
   6644113 ~ 0%     +25.7%    8352074 ~ 6%  lkp-snb01/hackbench/50%-threads=
-socket
 2.774e+08 ~ 1%     -33.0%   1.86e+08 ~ 5%  TOTAL proc-vmstat.pgalloc_normal

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

 1.845e+08 ~ 2%     -20.5%  1.467e+08 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
  54928542 ~ 0%     -60.2%   21867209 ~ 9%  lkp-snb01/hackbench/50%-process=
-pipe
   8093905 ~ 0%     +30.2%   10541513 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
  47795791 ~ 0%     -63.4%   17473359 ~15%  lkp-snb01/hackbench/50%-threads=
-pipe
   7312511 ~ 0%     +25.7%    9193663 ~ 6%  lkp-snb01/hackbench/50%-threads=
-socket
 3.026e+08 ~ 1%     -32.0%  2.057e+08 ~ 5%  TOTAL proc-vmstat.pgfree

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

        36 ~20%     +92.2%         69 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
        36 ~20%     +92.2%         69 ~ 4%  TOTAL numa-numastat.node3.other=
_node

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

  34656477 ~10%     +25.7%   43546628 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
   3058823 ~16%    +102.9%    6206431 ~ 9%  lkp-snb01/hackbench/1600%-proce=
ss-socket
  39482397 ~ 4%     -11.0%   35152252 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    655634 ~ 6%     +84.6%    1210594 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-socket
  13735924 ~ 0%     -58.1%    5755211 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
    759810 ~ 1%     +17.4%     892190 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
  12051766 ~ 0%     -59.1%    4934583 ~ 9%  lkp-snb01/hackbench/50%-threads=
-pipe
 104400833 ~ 5%      -6.4%   97697891 ~ 4%  TOTAL numa-vmstat.node0.numa_hit

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

  48569101 ~13%     -19.5%   39121062 ~ 5%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
   6604857 ~ 5%     -34.8%    4304402 ~12%  lkp-snb01/hackbench/1600%-proce=
ss-socket
  51364808 ~ 8%     -33.5%   34165800 ~ 7%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
   1505320 ~ 3%     -25.8%    1117272 ~11%  lkp-snb01/hackbench/1600%-threa=
ds-socket
  14280297 ~ 0%     -58.5%    5930773 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
  12388167 ~ 0%     -59.3%    5042776 ~ 7%  lkp-snb01/hackbench/50%-threads=
-pipe
 134712551 ~ 8%     -33.4%   89682086 ~ 6%  TOTAL numa-vmstat.node1.numa_lo=
cal

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

  12319135 ~14%     +37.5%   16937354 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
   1776555 ~13%     +86.8%    3318498 ~ 7%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    904250 ~ 3%     +43.0%    1292753 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
   5152174 ~ 0%     -60.0%    2062325 ~11%  lkp-snb01/hackbench/50%-process=
-pipe
    742091 ~ 0%     +34.2%     995539 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
   4518778 ~ 0%     -63.4%    1655157 ~16%  lkp-snb01/hackbench/50%-threads=
-pipe
    683361 ~ 1%     +25.0%     854163 ~ 8%  lkp-snb01/hackbench/50%-threads=
-socket
  26096347 ~ 7%      +3.9%   27115790 ~ 3%  TOTAL proc-vmstat.pgalloc_dma32

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1.30 ~ 5%     -40.8%       0.77 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
      1.12 ~ 5%     -42.9%       0.64 ~ 9%  lkp-snb01/hackbench/50%-threads=
-pipe
      2.42 ~ 5%     -41.7%       1.41 ~ 6%  TOTAL perf-profile.cpu-cycles.m=
utex_spin_on_owner.__mutex_lock_slowpath.mutex_lock.pipe_write.new_sync_wri=
te

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

  34593478 ~10%     +25.8%   43504525 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
   2995057 ~16%    +106.4%    6182184 ~ 9%  lkp-snb01/hackbench/1600%-proce=
ss-socket
  39421052 ~ 4%     -10.9%   35129230 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    593909 ~ 7%    +100.1%    1188666 ~ 7%  lkp-snb01/hackbench/1600%-threa=
ds-socket
  13673901 ~ 0%     -58.3%    5705150 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
    697248 ~ 1%     +27.7%     890711 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
  11988099 ~ 0%     -59.0%    4910211 ~ 9%  lkp-snb01/hackbench/50%-threads=
-pipe
    614906 ~ 1%     +14.9%     706432 ~ 3%  lkp-snb01/hackbench/50%-threads=
-socket
 104577651 ~ 5%      -6.1%   98217112 ~ 4%  TOTAL numa-vmstat.node0.numa_lo=
cal

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

 2.309e+08 ~ 3%     -50.8%  1.136e+08 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
 3.769e+08 ~ 3%     -59.0%  1.544e+08 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-socket
  45333785 ~ 3%     -26.0%   33557547 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
  65047005 ~ 2%     -32.9%   43648262 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
  41109327 ~22%     -36.4%   26140051 ~ 6%  lkp-snb01/hackbench/50%-threads=
-pipe
  57486971 ~ 3%     -32.6%   38732514 ~ 5%  lkp-snb01/hackbench/50%-threads=
-socket
 8.167e+08 ~ 4%     -49.8%  4.101e+08 ~ 3%  TOTAL cpuidle.C7-SNB.time

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       164 ~21%     +50.5%        248 ~ 7%  lkp-nex04/ebizzy/200%-100x-10s
     40520 ~10%     +79.2%      72631 ~13%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     41793 ~12%    +101.4%      84157 ~ 9%  lkp-snb01/hackbench/1600%-proce=
ss-socket
       357 ~ 9%     +36.9%        489 ~ 6%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      1903 ~ 5%     +92.6%       3666 ~10%  lkp-snb01/hackbench/50%-process=
-pipe
      1835 ~ 3%     +57.5%       2889 ~27%  lkp-snb01/hackbench/50%-process=
-socket
     86574 ~11%     +89.5%     164081 ~11%  TOTAL numa-vmstat.node0.nr_page=
_table_pages

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       662 ~21%     +49.8%        991 ~ 7%  lkp-nex04/ebizzy/200%-100x-10s
    161476 ~11%     +75.8%     283857 ~11%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    167562 ~13%     +99.9%     334952 ~10%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      1432 ~ 9%     +36.4%       1953 ~ 6%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      7640 ~ 5%     +91.6%      14640 ~10%  lkp-snb01/hackbench/50%-process=
-pipe
      7343 ~ 3%     +57.9%      11593 ~26%  lkp-snb01/hackbench/50%-process=
-socket
    346116 ~11%     +87.2%     647988 ~11%  TOTAL numa-meminfo.node0.PageTa=
bles

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

    307642 ~10%     +26.8%     390105 ~ 9%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    306452 ~ 8%     +42.4%     436522 ~ 9%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     77044 ~14%    +119.8%     169310 ~19%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     63841 ~21%    +127.9%     145484 ~11%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     70304 ~23%     +28.1%      90058 ~11%  lkp-snb01/hackbench/50%-process=
-socket
    825285 ~12%     +49.2%    1231480 ~11%  TOTAL numa-meminfo.node0.Active

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1.36 ~10%     -25.8%       1.01 ~ 4%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      1.22 ~10%     -45.9%       0.66 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      2.58 ~10%     -35.3%       1.67 ~ 3%  TOTAL perf-profile.cpu-cycles.s=
kb_release_data.skb_release_all.consume_skb.unix_stream_recvmsg.sock_aio_re=
ad

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

    229011 ~16%     -45.8%     124181 ~ 4%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    340330 ~17%     -51.4%     165533 ~ 4%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    152579 ~ 8%     -36.8%      96419 ~ 9%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
   2830548 ~ 3%      -9.6%    2557602 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
   3552469 ~ 6%     -17.1%    2943736 ~ 2%  TOTAL cpuidle.C1E-SNB.usage

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      0.82 ~22%     +52.7%       1.25 ~ 9%  xps2/pigz/100%-512K
      0.82 ~22%     +52.7%       1.25 ~ 9%  TOTAL perf-profile.cpu-cycles.t=
ask_tick_fair.scheduler_tick.update_process_times.tick_sched_handle.tick_sc=
hed_timer

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

  48578202 ~13%     -19.4%   39153604 ~ 5%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
   6613109 ~ 5%     -34.1%    4354910 ~12%  lkp-snb01/hackbench/1600%-proce=
ss-socket
  51375613 ~ 8%     -33.4%   34217555 ~ 7%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
   1515531 ~ 3%     -22.8%    1170101 ~ 8%  lkp-snb01/hackbench/1600%-threa=
ds-socket
  14290484 ~ 0%     -58.3%    5955515 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
  12396737 ~ 0%     -58.9%    5093406 ~ 7%  lkp-snb01/hackbench/50%-threads=
-pipe
    710798 ~ 1%     +12.3%     798061 ~ 3%  lkp-snb01/hackbench/50%-threads=
-socket
 135480477 ~ 8%     -33.0%   90743154 ~ 6%  TOTAL numa-vmstat.node1.numa_hit

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

    111020 ~ 5%     -53.3%      51891 ~21%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    135126 ~ 3%     -39.9%      81188 ~ 9%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     52290 ~ 1%     -53.6%      24249 ~32%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     86166 ~ 2%     -17.0%      71476 ~13%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     17269 ~ 3%     -35.8%      11078 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
     18884 ~ 2%     -28.3%      13539 ~16%  lkp-snb01/hackbench/50%-process=
-socket
     10783 ~ 5%     -17.4%       8902 ~ 8%  lkp-snb01/hackbench/50%-threads=
-pipe
     11796 ~ 2%     -11.0%      10493 ~ 3%  lkp-snb01/hackbench/50%-threads=
-socket
    443335 ~ 3%     -38.5%     272817 ~14%  TOTAL numa-vmstat.node1.nr_slab=
_unreclaimable

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      0.88 ~ 2%     +13.0%       1.00 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
      0.88 ~ 2%     +14.9%       1.02 ~ 2%  lkp-snb01/hackbench/50%-threads=
-pipe
      1.77 ~ 2%     +13.9%       2.01 ~ 2%  TOTAL perf-profile.cpu-cycles.s=
elect_task_rq_fair.try_to_wake_up.default_wake_function.autoremove_wake_fun=
ction.__wake_up_common

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      4848 ~ 6%     +49.5%       7250 ~ 6%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      5395 ~ 8%     +58.0%       8527 ~ 6%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      5253 ~17%     +71.3%       9000 ~12%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     15498 ~10%     +59.9%      24778 ~ 8%  TOTAL numa-vmstat.node0.nr_slab=
_reclaimable

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     19387 ~ 6%     +48.9%      28865 ~ 5%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     21619 ~ 8%     +57.4%      34027 ~ 7%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     21019 ~17%     +71.1%      35967 ~12%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     62026 ~10%     +59.4%      98859 ~ 8%  TOTAL numa-meminfo.node0.SRecla=
imable

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

    444329 ~ 5%     -51.6%     215088 ~19%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    531750 ~ 3%     -37.4%     333090 ~11%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    209050 ~ 1%     -53.3%      97708 ~32%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    341044 ~ 2%     -15.7%     287647 ~12%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     69122 ~ 3%     -35.9%      44325 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
     75565 ~ 2%     -28.2%      54236 ~16%  lkp-snb01/hackbench/50%-process=
-socket
     43135 ~ 5%     -17.4%      35610 ~ 8%  lkp-snb01/hackbench/50%-threads=
-pipe
     47204 ~ 2%     -11.1%      41966 ~ 3%  lkp-snb01/hackbench/50%-threads=
-socket
   1761201 ~ 3%     -37.0%    1109673 ~14%  TOTAL numa-meminfo.node1.SUnrec=
laim

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

    345372 ~ 5%     -53.0%     162197 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    315281 ~14%     -35.8%     202454 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    311553 ~ 4%     -40.4%     185718 ~ 6%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    308620 ~ 6%     -35.1%     200372 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     17693 ~ 1%      -9.7%      15979 ~ 1%  xps2/pigz/100%-128K
     17289 ~ 2%     -10.9%      15406 ~ 4%  xps2/pigz/100%-512K
   1315811 ~ 7%     -40.6%     782128 ~ 3%  TOTAL softirqs.SCHED

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      9350 ~ 6%     -32.1%       6350 ~ 6%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     10517 ~ 4%     -26.0%       7784 ~ 5%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     10261 ~ 8%     -30.4%       7143 ~17%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     30128 ~ 6%     -29.4%      21278 ~10%  TOTAL numa-vmstat.node1.nr_slab=
_reclaimable

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1.09 ~ 2%     +11.2%       1.21 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
      1.09 ~ 2%     +11.2%       1.21 ~ 2%  TOTAL perf-profile.cpu-cycles._=
_switch_to.__read_nocancel

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     37386 ~ 6%     -31.7%      25523 ~ 6%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     42001 ~ 4%     -25.8%      31173 ~ 5%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     41074 ~ 8%     -30.1%      28696 ~17%  lkp-snb01/hackbench/1600%-threa=
ds-socket
    120462 ~ 6%     -29.1%      85392 ~ 9%  TOTAL numa-meminfo.node1.SRecla=
imable

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

    481715 ~ 5%     -50.1%     240612 ~17%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    573752 ~ 3%     -36.5%     364264 ~11%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    239711 ~ 3%     -47.5%     125832 ~28%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    382119 ~ 2%     -17.2%     316344 ~11%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     89805 ~ 3%     -28.7%      64047 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
     99454 ~ 2%     -23.8%      75760 ~11%  lkp-snb01/hackbench/50%-process=
-socket
     65716 ~ 3%     -13.7%      56692 ~ 6%  lkp-snb01/hackbench/50%-threads=
-pipe
   1932274 ~ 3%     -35.6%    1243552 ~13%  TOTAL numa-meminfo.node1.Slab

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      2.36 ~ 2%     -35.2%       1.53 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
      2.25 ~ 3%     -33.0%       1.51 ~ 2%  lkp-snb01/hackbench/50%-threads=
-pipe
      4.61 ~ 3%     -34.1%       3.04 ~ 2%  TOTAL perf-profile.cpu-cycles.m=
utex_lock.pipe_write.new_sync_write.vfs_write.sys_write

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

    473474 ~ 5%     -27.7%     342487 ~11%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    473299 ~ 3%     -29.3%     334547 ~11%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    212863 ~ 4%     -39.5%     128719 ~26%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    221394 ~ 6%     -31.2%     152247 ~10%  lkp-snb01/hackbench/1600%-threa=
ds-socket
   1381031 ~ 5%     -30.6%     958000 ~13%  TOTAL numa-meminfo.node1.Active

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

   6904073 ~ 2%     -22.7%    5339330 ~ 5%  xps2/pigz/100%-128K
   7340753 ~ 2%     -41.0%    4327852 ~11%  xps2/pigz/100%-512K
  14244827 ~ 2%     -32.1%    9667182 ~ 8%  TOTAL cpuidle.C6-NHM.time

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

    976199 ~10%     +76.8%    1725590 ~10%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
   1170266 ~ 7%     +75.2%    2049838 ~ 8%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    511084 ~ 3%     +74.8%     893485 ~11%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    625443 ~ 6%     +60.3%    1002505 ~ 6%  lkp-snb01/hackbench/1600%-threa=
ds-socket
    490500 ~ 4%     +13.3%     555825 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
    479041 ~ 4%     +14.2%     546912 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
   4252535 ~ 7%     +59.3%    6774157 ~ 7%  TOTAL numa-meminfo.node0.MemUsed

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       310 ~ 9%     -20.1%        248 ~10%  lkp-nex04/ebizzy/200%-100x-10s
     97813 ~ 7%     -41.9%      56805 ~17%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     97586 ~ 5%     -46.6%      52080 ~15%  lkp-snb01/hackbench/1600%-proce=
ss-socket
       493 ~ 6%     -24.7%        371 ~ 7%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      4770 ~ 2%     -37.2%       2994 ~13%  lkp-snb01/hackbench/50%-process=
-pipe
      4878 ~ 1%     -24.3%       3692 ~23%  lkp-snb01/hackbench/50%-process=
-socket
    205853 ~ 6%     -43.6%     116191 ~16%  TOTAL numa-vmstat.node1.nr_page=
_table_pages

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      2.98 ~ 1%     -43.4%       1.69 ~ 2%  lkp-snb01/hackbench/50%-threads=
-pipe
      2.29 ~ 4%     -19.3%       1.84 ~ 4%  lkp-snb01/hackbench/50%-threads=
-socket
      5.27 ~ 2%     -33.0%       3.53 ~ 3%  TOTAL perf-profile.cpu-cycles._=
_fget.__fget_light.__fdget_pos.sys_write.system_call_fastpath

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1374 ~10%     -36.7%        870 ~ 4%  xps2/pigz/100%-512K
      1374 ~10%     -36.7%        870 ~ 4%  TOTAL cpuidle.C6-NHM.usage

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1242 ~ 8%     -20.1%        993 ~10%  lkp-nex04/ebizzy/200%-100x-10s
    391427 ~ 7%     -39.7%     235897 ~15%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    387846 ~ 5%     -45.1%     212957 ~15%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      1974 ~ 6%     -24.4%       1493 ~ 7%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     19153 ~ 2%     -37.4%      11990 ~13%  lkp-snb01/hackbench/50%-process=
-pipe
     19524 ~ 1%     -24.3%      14783 ~23%  lkp-snb01/hackbench/50%-process=
-socket
    821167 ~ 6%     -41.8%     478114 ~15%  TOTAL numa-meminfo.node1.PageTa=
bles

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1.21 ~ 2%     -33.9%       0.80 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
      1.11 ~ 3%     -31.0%       0.76 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
      2.32 ~ 2%     -32.5%       1.56 ~ 1%  TOTAL perf-profile.cpu-cycles.c=
opy_user_generic_string.skb_copy_datagram_from_iovec.unix_stream_sendmsg.so=
ck_aio_write.do_sync_write

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      4.17 ~ 3%     -34.1%       2.75 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
      4.03 ~ 3%     -34.0%       2.66 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
      8.21 ~ 3%     -34.1%       5.41 ~ 3%  TOTAL perf-profile.cpu-cycles.m=
utex_unlock.new_sync_write.vfs_write.sys_write.system_call_fastpath

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1.18 ~ 2%     -38.9%       0.72 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
      1.12 ~ 4%     -23.1%       0.86 ~ 3%  lkp-snb01/hackbench/50%-process=
-socket
      2.30 ~ 3%     -31.2%       1.58 ~ 4%  TOTAL perf-profile.cpu-cycles.v=
fs_write.sys_write.system_call_fastpath.__write_nocancel

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       817 ~ 7%     +92.3%       1570 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
       738 ~ 7%     +43.1%       1056 ~ 7%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
       702 ~ 7%     +53.8%       1080 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
       696 ~ 7%     +46.9%       1022 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
      5173 ~ 2%     -14.9%       4404 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
       708 ~10%     +45.8%       1032 ~ 4%  lkp-snb01/hackbench/50%-threads=
-pipe
      1916 ~ 4%     +19.8%       2295 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
     10750 ~ 4%     +15.9%      12461 ~ 2%  TOTAL slabinfo.RAW.num_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      7556 ~ 1%     +44.4%      10908 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
      7556 ~ 1%     +44.4%      10908 ~ 1%  TOTAL slabinfo.Acpi-Namespace.n=
um_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      7556 ~ 1%     +44.4%      10908 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
      7556 ~ 1%     +44.4%      10908 ~ 1%  TOTAL slabinfo.Acpi-Namespace.a=
ctive_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1.65 ~ 2%     -40.2%       0.99 ~ 4%  lkp-snb01/hackbench/50%-threads=
-pipe
      1.16 ~ 2%     -12.1%       1.02 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
      2.81 ~ 2%     -28.6%       2.00 ~ 3%  TOTAL perf-profile.cpu-cycles.f=
put.sys_write.system_call_fastpath

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       587 ~ 4%     -19.2%        474 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
       422 ~ 1%     -32.5%        285 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
       357 ~ 1%     -31.8%        243 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
       308 ~ 3%     -34.9%        200 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
      1675 ~ 3%     -28.1%       1204 ~ 2%  TOTAL slabinfo.kmalloc-192.acti=
ve_slabs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       587 ~ 4%     -19.2%        474 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
       422 ~ 1%     -32.5%        285 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
       357 ~ 1%     -31.8%        243 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
       308 ~ 3%     -34.9%        200 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
      1675 ~ 3%     -28.1%       1204 ~ 2%  TOTAL slabinfo.kmalloc-192.num_=
slabs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       817 ~ 7%     +92.3%       1570 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
       738 ~ 7%     +43.1%       1056 ~ 7%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
       702 ~ 7%     +53.8%       1080 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
       696 ~ 7%     +46.9%       1022 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
      5173 ~ 2%     -14.9%       4404 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
       708 ~10%     +45.8%       1032 ~ 4%  lkp-snb01/hackbench/50%-threads=
-pipe
      1915 ~ 4%     +12.3%       2151 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
     10749 ~ 4%     +14.6%      12316 ~ 2%  TOTAL slabinfo.RAW.active_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     10174 ~ 2%     -18.9%       8253 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
     24674 ~ 4%     -19.1%      19957 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     10595 ~ 3%     -36.1%       6769 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     17783 ~ 1%     -32.5%      12007 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
     15013 ~ 1%     -31.8%      10240 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
     12968 ~ 3%     -34.9%       8445 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
     10495 ~ 1%     -31.9%       7142 ~ 3%  lkp-snb01/hackbench/50%-threads=
-socket
    101704 ~ 2%     -28.4%      72814 ~ 2%  TOTAL slabinfo.kmalloc-192.num_=
objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     10174 ~ 2%     -18.9%       8253 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
     24534 ~ 4%     -19.2%      19814 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     10590 ~ 3%     -36.2%       6760 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     17761 ~ 1%     -32.4%      12004 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
     15007 ~ 1%     -31.8%      10237 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
     12937 ~ 4%     -34.7%       8444 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
     10495 ~ 1%     -31.9%       7142 ~ 3%  lkp-snb01/hackbench/50%-threads=
-socket
    101500 ~ 2%     -28.4%      72656 ~ 2%  TOTAL slabinfo.kmalloc-192.acti=
ve_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

   2306494 ~ 5%     -37.0%    1452176 ~11%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
   2346200 ~ 3%     -37.7%    1462647 ~11%  lkp-snb01/hackbench/1600%-proce=
ss-socket
   1031930 ~ 1%     -31.3%     708889 ~15%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
   1158976 ~ 2%     -23.3%     888516 ~ 6%  lkp-snb01/hackbench/1600%-threa=
ds-socket
    535581 ~ 4%      -8.7%     489016 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
    556477 ~ 3%      -8.7%     508195 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
   7935660 ~ 3%     -30.6%    5509441 ~ 9%  TOTAL numa-meminfo.node1.MemUsed

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      2931 ~ 9%     +27.5%       3736 ~ 7%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    384860 ~ 0%     -21.9%     300454 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
    351463 ~ 0%     -17.6%     289476 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
     99168 ~ 0%     -17.4%      81933 ~ 4%  lkp-snb01/hackbench/50%-threads=
-pipe
     93414 ~ 1%     -10.4%      83686 ~ 8%  lkp-snb01/hackbench/50%-threads=
-socket
    931837 ~ 0%     -18.5%     759287 ~ 4%  TOTAL proc-vmstat.numa_pte_upda=
tes

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      0.86 ~10%     +21.4%       1.04 ~ 6%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      1.71 ~ 2%     -41.8%       0.99 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
      1.29 ~ 3%     -21.2%       1.02 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
      3.86 ~ 4%     -20.8%       3.05 ~ 3%  TOTAL perf-profile.cpu-cycles._=
_fget_light.sys_write.system_call_fastpath.__write_nocancel

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

  80994897 ~15%     -37.1%   50943274 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
  24056904 ~ 8%     -21.8%   18812603 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
  95483555 ~ 5%     +17.5%  1.122e+08 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
 2.005e+08 ~10%      -9.3%   1.82e+08 ~ 1%  TOTAL cpuidle.C1E-SNB.time

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      3.00 ~10%      -9.7%       2.71 ~ 8%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      1.34 ~12%     -22.5%       1.04 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
      1.01 ~21%     -32.1%       0.68 ~ 3%  lkp-snb01/hackbench/50%-process=
-socket
      1.11 ~13%     -28.6%       0.79 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
      6.46 ~12%     -19.1%       5.22 ~ 6%  TOTAL perf-profile.cpu-cycles.a=
vc_has_perm.inode_has_perm.file_has_perm.selinux_file_permission.security_f=
ile_permission

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     16753 ~ 2%     +28.1%      21461 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
      9327 ~ 6%     +25.5%      11709 ~ 6%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      9358 ~14%     +34.1%      12552 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      8713 ~ 8%     +39.6%      12168 ~ 5%  lkp-snb01/hackbench/50%-threads=
-pipe
      8625 ~12%     +33.7%      11529 ~ 9%  lkp-snb01/hackbench/50%-threads=
-socket
     52777 ~ 7%     +31.5%      69420 ~ 6%  TOTAL slabinfo.anon_vma.active_=
objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

    184610 ~ 2%     +60.3%     295848 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
     65635 ~ 1%     -24.4%      49633 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
     51399 ~ 1%     -13.8%      44300 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
     18724 ~ 1%     -27.9%      13505 ~10%  lkp-snb01/hackbench/50%-threads=
-pipe
    320369 ~ 1%     +25.9%     403288 ~ 5%  TOTAL proc-vmstat.numa_pages_mi=
grated

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

    184610 ~ 2%     +60.3%     295848 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
     65635 ~ 1%     -24.4%      49633 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
     51399 ~ 1%     -13.8%      44300 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
     18724 ~ 1%     -27.9%      13505 ~10%  lkp-snb01/hackbench/50%-threads=
-pipe
    320369 ~ 1%     +25.9%     403288 ~ 5%  TOTAL proc-vmstat.pgmigrate_suc=
cess

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

 2.213e+08 ~ 5%     -13.7%  1.911e+08 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
 1.985e+08 ~15%     +61.3%  3.201e+08 ~ 4%  lkp-snb01/hackbench/1600%-proce=
ss-socket
 1.617e+08 ~ 6%     +63.7%  2.647e+08 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-socket
 7.227e+08 ~ 0%     -16.5%  6.033e+08 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
 6.715e+08 ~ 0%     -13.7%  5.796e+08 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
 1.976e+09 ~ 3%      -0.9%  1.959e+09 ~ 2%  TOTAL cpuidle.C1-SNB.time

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1.79 ~ 8%     +11.7%       2.00 ~ 5%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      1.07 ~ 3%     -30.5%       0.75 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
      1.00 ~ 2%     -30.7%       0.69 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
      3.87 ~ 5%     -11.0%       3.44 ~ 3%  TOTAL perf-profile.cpu-cycles._=
_alloc_skb.sock_alloc_send_pskb.unix_stream_sendmsg.sock_aio_write.do_sync_=
write

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1.24 ~ 1%     -21.1%       0.97 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
      1.16 ~ 2%     -26.5%       0.85 ~ 0%  lkp-snb01/hackbench/50%-threads=
-pipe
      4.56 ~ 4%     +29.1%       5.88 ~ 6%  xps2/pigz/100%-128K
      6.82 ~ 7%     +31.5%       8.97 ~11%  xps2/pigz/100%-512K
     13.77 ~ 5%     +21.1%      16.68 ~ 8%  TOTAL perf-profile.cpu-cycles.c=
opy_user_generic_string.copy_page_from_iter.pipe_write.new_sync_write.vfs_w=
rite

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1.08 ~ 5%     -24.3%       0.82 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
      1.08 ~ 5%     -24.3%       0.82 ~ 4%  TOTAL perf-profile.cpu-cycles._=
_sb_start_write.pipe_write.new_sync_write.vfs_write.sys_write

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     16753 ~ 2%     +28.1%      21461 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
      9327 ~ 6%     +25.5%      11709 ~ 6%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      9358 ~14%     +34.5%      12587 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      8713 ~ 8%     +39.9%      12186 ~ 5%  lkp-snb01/hackbench/50%-threads=
-pipe
      8625 ~12%     +33.7%      11529 ~ 9%  lkp-snb01/hackbench/50%-threads=
-socket
      3687 ~ 5%     +20.8%       4453 ~13%  xps2/pigz/100%-512K
     56464 ~ 7%     +30.9%      73927 ~ 6%  TOTAL slabinfo.anon_vma.num_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1.62 ~ 8%     +24.1%       2.01 ~ 8%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      1.77 ~ 6%     +44.7%       2.56 ~ 6%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      3.38 ~ 7%     +34.9%       4.56 ~ 7%  TOTAL perf-profile.cpu-cycles.k=
free.skb_free_head.skb_release_data.skb_release_all.consume_skb

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

    741119 ~ 1%     -29.7%     521235 ~ 3%  lkp-nex04/ebizzy/200%-100x-10s
    127456 ~ 1%     -19.6%     102468 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
    144462 ~ 1%     -25.9%     107016 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
     59554 ~ 1%     -13.4%      51576 ~ 5%  lkp-snb01/hackbench/50%-threads=
-pipe
     67082 ~ 2%     -17.4%      55438 ~10%  lkp-snb01/hackbench/50%-threads=
-socket
   1139675 ~ 1%     -26.5%     837735 ~ 3%  TOTAL proc-vmstat.numa_hint_fau=
lts_local

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

   1927945 ~ 5%     +56.0%    3007137 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-socket
   1430212 ~ 1%      -8.5%    1308777 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
   1338323 ~ 1%     -15.3%    1132991 ~ 4%  lkp-snb01/hackbench/50%-threads=
-socket
    101861 ~ 3%     -25.1%      76268 ~11%  xps2/pigz/100%-128K
   4798342 ~ 3%     +15.1%    5525174 ~ 2%  TOTAL softirqs.RCU

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1.05 ~ 4%     +32.4%       1.39 ~ 3%  lkp-snb01/hackbench/50%-process=
-socket
      1.08 ~ 4%     +26.8%       1.37 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
      2.13 ~ 4%     +29.5%       2.76 ~ 2%  TOTAL perf-profile.cpu-cycles._=
raw_spin_lock.unix_stream_recvmsg.sock_aio_read.sock_aio_read.do_sync_read

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1716 ~ 8%     +25.9%       2160 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
      1716 ~ 8%     +25.9%       2160 ~ 6%  TOTAL slabinfo.blkdev_ioc.num_o=
bjs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1716 ~ 8%     +25.9%       2160 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
      1716 ~ 8%     +25.9%       2160 ~ 6%  TOTAL slabinfo.blkdev_ioc.activ=
e_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      2.46 ~ 1%     -20.9%       1.95 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
      2.59 ~ 1%     -19.8%       2.08 ~ 1%  lkp-snb01/hackbench/50%-threads=
-pipe
      5.05 ~ 1%     -20.3%       4.03 ~ 0%  TOTAL perf-profile.cpu-cycles.c=
opy_user_generic_string.copy_page_to_iter.pipe_read.new_sync_read.vfs_read

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      0.90 ~ 7%     +19.3%       1.07 ~ 7%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      0.90 ~ 7%     +19.3%       1.07 ~ 7%  TOTAL perf-profile.cpu-cycles.k=
size.__alloc_skb.sock_alloc_send_pskb.unix_stream_sendmsg.sock_aio_write

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       430 ~ 6%     -24.4%        325 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
      6839 ~ 4%     +22.2%       8357 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      7269 ~ 4%     +19.4%       8682 ~ 0%  TOTAL slabinfo.kmalloc-256.num_=
slabs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       430 ~ 6%     -24.4%        325 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
      6839 ~ 4%     +22.2%       8357 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      7269 ~ 4%     +19.4%       8682 ~ 0%  TOTAL slabinfo.kmalloc-256.acti=
ve_slabs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     13779 ~ 6%     -24.4%      10420 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
    437731 ~ 4%     +22.2%     534916 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     19860 ~ 0%     -24.6%      14980 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
     14762 ~ 6%     -11.2%      13113 ~ 4%  lkp-snb01/hackbench/50%-threads=
-pipe
     18829 ~ 0%     -21.6%      14762 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
    504963 ~ 4%     +16.5%     588193 ~ 0%  TOTAL slabinfo.kmalloc-256.num_=
objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      6851 ~ 0%     -22.7%       5294 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
      6247 ~ 1%     -17.9%       5128 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
     13098 ~ 0%     -20.4%      10422 ~ 2%  TOTAL slabinfo.files_cache.acti=
ve_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      6852 ~ 0%     -22.7%       5294 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
      6247 ~ 1%     -17.9%       5128 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
     13100 ~ 0%     -20.4%      10422 ~ 2%  TOTAL slabinfo.files_cache.num_=
objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1.76 ~ 2%     +33.3%       2.35 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
      1.08 ~ 1%     +14.2%       1.23 ~ 3%  lkp-snb01/hackbench/50%-threads=
-socket
      2.84 ~ 2%     +26.1%       3.58 ~ 1%  TOTAL perf-profile.cpu-cycles._=
_schedule.schedule.schedule_timeout.unix_stream_recvmsg.sock_aio_read

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1.35 ~ 2%     -17.7%       1.11 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
      1.43 ~ 2%     -18.8%       1.16 ~ 2%  lkp-snb01/hackbench/50%-threads=
-pipe
      2.79 ~ 2%     -18.3%       2.28 ~ 2%  TOTAL perf-profile.cpu-cycles.p=
ipe_read.new_sync_read.vfs_read.sys_read.system_call_fastpath

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     10435 ~ 4%     -15.5%       8821 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
    419028 ~ 4%     +23.3%     516549 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     20457 ~ 0%     -23.0%      15754 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
     19250 ~ 0%     -20.8%      15240 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
    469170 ~ 4%     +18.6%     556365 ~ 0%  TOTAL slabinfo.kmalloc-512.num_=
objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1974 ~ 8%     +20.4%       2377 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
      1974 ~ 8%     +20.4%       2377 ~ 6%  TOTAL slabinfo.xfs_buf.active_o=
bjs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1974 ~ 8%     +20.4%       2377 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
      1974 ~ 8%     +20.4%       2377 ~ 6%  TOTAL slabinfo.xfs_buf.num_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      3.26 ~ 4%     +25.0%       4.08 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
      3.28 ~ 3%     +18.6%       3.89 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
      6.54 ~ 3%     +21.8%       7.97 ~ 1%  TOTAL perf-profile.cpu-cycles.u=
nix_stream_recvmsg.sock_aio_read.sock_aio_read.do_sync_read.vfs_read

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     40398 ~ 8%     -13.4%      34969 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
     40398 ~ 8%     -13.4%      34969 ~ 5%  TOTAL numa-meminfo.node2.Active

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1300 ~ 1%     -13.6%       1124 ~ 9%  lkp-snb01/hackbench/50%-process=
-socket
      1292 ~ 2%     -17.6%       1065 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
      2593 ~ 1%     -15.6%       2189 ~ 5%  TOTAL numa-meminfo.node1.Mlocked

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       325 ~ 1%     -13.6%        281 ~ 9%  lkp-snb01/hackbench/50%-process=
-socket
       323 ~ 2%     -17.6%        266 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
       648 ~ 1%     -15.6%        547 ~ 5%  TOTAL numa-vmstat.node1.nr_mlock

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1715 ~ 6%     +54.0%       2641 ~ 3%  lkp-nex04/ebizzy/200%-100x-10s
      1462 ~ 3%     +15.1%       1683 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1402 ~10%     +21.2%       1700 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      1445 ~ 7%     +16.5%       1683 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
      5753 ~ 2%     -11.6%       5084 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
      1411 ~ 7%     +19.3%       1683 ~ 6%  lkp-snb01/hackbench/50%-threads=
-pipe
     13189 ~ 5%      +9.7%      14475 ~ 3%  TOTAL slabinfo.sock_inode_cache=
.active_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1715 ~ 6%     +54.0%       2641 ~ 3%  lkp-nex04/ebizzy/200%-100x-10s
      1462 ~ 3%     +15.1%       1683 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1402 ~10%     +21.2%       1700 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      1445 ~ 7%     +16.5%       1683 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
      5753 ~ 2%     -11.6%       5084 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
      1411 ~ 7%     +19.3%       1683 ~ 6%  lkp-snb01/hackbench/50%-threads=
-pipe
     13189 ~ 5%      +9.7%      14475 ~ 3%  TOTAL slabinfo.sock_inode_cache=
.num_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       328 ~ 1%     -13.3%        285 ~ 9%  lkp-snb01/hackbench/50%-process=
-socket
       327 ~ 2%     -17.6%        269 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
       655 ~ 1%     -15.5%        554 ~ 5%  TOTAL numa-vmstat.node1.nr_unev=
ictable

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1314 ~ 1%     -13.3%       1140 ~ 9%  lkp-snb01/hackbench/50%-process=
-socket
      1308 ~ 2%     -17.6%       1077 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
      2622 ~ 1%     -15.5%       2217 ~ 5%  TOTAL numa-meminfo.node1.Unevic=
table

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     13239 ~ 7%     -24.1%      10043 ~ 3%  lkp-nex04/ebizzy/200%-100x-10s
    172552 ~ 7%     +32.6%     228756 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     15089 ~ 0%     -15.7%      12723 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
     14393 ~ 7%     -11.3%      12762 ~ 4%  lkp-snb01/hackbench/50%-threads=
-pipe
     14484 ~ 0%     -14.0%      12449 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
    229758 ~ 6%     +20.4%     276735 ~ 4%  TOTAL slabinfo.kmalloc-256.acti=
ve_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      2156 ~ 7%     +19.2%       2569 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
      2156 ~ 7%     +19.2%       2569 ~ 6%  TOTAL slabinfo.blkdev_requests.=
active_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      2156 ~ 7%     +19.2%       2569 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
      2156 ~ 7%     +19.2%       2569 ~ 6%  TOTAL slabinfo.blkdev_requests.=
num_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     11803 ~ 3%     -20.7%       9356 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
      9919 ~ 2%     -17.2%       8208 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
      9682 ~ 1%     -17.2%       8018 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
      9999 ~ 1%     -18.6%       8138 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
      9396 ~ 0%     -15.5%       7937 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
     50800 ~ 2%     -18.0%      41658 ~ 2%  TOTAL slabinfo.kmalloc-128.num_=
objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1.78 ~ 2%     +31.6%       2.34 ~ 0%  lkp-snb01/hackbench/50%-threads=
-pipe
      1.44 ~ 4%     +17.4%       1.69 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
      3.21 ~ 3%     +25.2%       4.03 ~ 0%  TOTAL perf-profile.cpu-cycles._=
_switch_to

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     11797 ~ 3%     -20.8%       9347 ~ 3%  lkp-nex04/ebizzy/200%-100x-10s
      9863 ~ 2%     -16.8%       8207 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
      9673 ~ 1%     -17.1%       8017 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
      9970 ~ 1%     -18.4%       8132 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
      9386 ~ 0%     -15.5%       7931 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
     50691 ~ 2%     -17.9%      41635 ~ 2%  TOTAL slabinfo.kmalloc-128.acti=
ve_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      6498 ~ 3%     -14.9%       5532 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
      6498 ~ 2%     -17.1%       5384 ~ 3%  lkp-snb01/hackbench/50%-process=
-socket
      6909 ~ 1%     -22.9%       5325 ~ 4%  lkp-snb01/hackbench/50%-threads=
-pipe
      6250 ~ 1%     -15.0%       5310 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
     26156 ~ 2%     -17.6%      21552 ~ 3%  TOTAL slabinfo.task_xstate.acti=
ve_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      6504 ~ 3%     -14.7%       5548 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
      6498 ~ 2%     -17.0%       5391 ~ 3%  lkp-snb01/hackbench/50%-process=
-socket
      6912 ~ 1%     -22.8%       5336 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
      6253 ~ 1%     -15.1%       5310 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
     26169 ~ 2%     -17.5%      21587 ~ 3%  TOTAL slabinfo.task_xstate.num_=
objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1791 ~ 3%     +22.9%       2201 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
      1791 ~ 3%     +22.9%       2201 ~ 4%  TOTAL numa-meminfo.node3.Kernel=
Stack

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       620 ~ 4%     -17.3%        512 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
       620 ~ 4%     -17.3%        512 ~ 0%  TOTAL slabinfo.taskstats.num_ob=
js

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       620 ~ 4%     -17.3%        512 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
       620 ~ 4%     -17.3%        512 ~ 0%  TOTAL slabinfo.taskstats.active=
_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1243 ~ 6%     -23.5%        951 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
      2369 ~ 1%     -15.4%       2004 ~ 0%  xps2/pigz/100%-128K
      2362 ~ 0%     -13.8%       2036 ~ 1%  xps2/pigz/100%-512K
      5975 ~ 2%     -16.5%       4991 ~ 1%  TOTAL proc-vmstat.pgactivate

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

    224586 ~ 0%     -19.9%     179855 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
    212208 ~ 0%     -17.5%     175158 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
     99056 ~ 0%     -17.8%      81464 ~ 5%  lkp-snb01/hackbench/50%-threads=
-pipe
     93069 ~ 1%     -10.4%      83407 ~ 8%  lkp-snb01/hackbench/50%-threads=
-socket
    628921 ~ 0%     -17.3%     519885 ~ 4%  TOTAL proc-vmstat.numa_hint_fau=
lts

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      2614 ~ 3%     +25.9%       3290 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      2646 ~ 4%     +22.8%       3248 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      2669 ~ 2%     +18.3%       3157 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      2639 ~ 4%     +17.8%       3108 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      2633 ~ 3%     +24.8%       3287 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
      2687 ~ 2%     +13.2%       3042 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
      2667 ~ 3%     +19.7%       3193 ~ 1%  lkp-snb01/hackbench/50%-threads=
-pipe
      2646 ~ 2%     +23.3%       3262 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
       970 ~ 3%     +18.6%       1150 ~ 2%  xps2/pigz/100%-128K
       961 ~ 3%     +16.2%       1117 ~ 3%  xps2/pigz/100%-512K
     23135 ~ 3%     +20.4%      27856 ~ 2%  TOTAL slabinfo.kmalloc-96.activ=
e_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     46859 ~ 5%     -12.7%      40921 ~ 5%  lkp-snb01/hackbench/50%-threads=
-socket
     46859 ~ 5%     -12.7%      40921 ~ 5%  TOTAL slabinfo.kmalloc-64.activ=
e_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      6366 ~ 4%      +9.5%       6970 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
     10751 ~19%     -28.1%       7733 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     12328 ~ 7%     +12.7%      13888 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     29445 ~11%      -2.9%      28591 ~ 1%  TOTAL slabinfo.proc_inode_cache=
.num_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1681 ~ 5%     +22.9%       2065 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
      1681 ~ 5%     +22.9%       2065 ~ 6%  TOTAL numa-meminfo.node2.Kernel=
Stack

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     11939 ~ 7%     -14.3%      10226 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
     11939 ~ 7%     -14.3%      10226 ~ 6%  TOTAL numa-meminfo.node2.SRecla=
imable

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      2674 ~ 3%     +24.6%       3332 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      2688 ~ 4%     +22.4%       3290 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      2716 ~ 2%     +18.6%       3220 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      2681 ~ 4%     +17.5%       3150 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      2674 ~ 2%     +24.4%       3326 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
      2723 ~ 2%     +13.1%       3080 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
      2709 ~ 3%     +19.4%       3234 ~ 1%  lkp-snb01/hackbench/50%-threads=
-pipe
      2688 ~ 2%     +22.9%       3304 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
       970 ~ 3%     +18.6%       1150 ~ 2%  xps2/pigz/100%-128K
       961 ~ 3%     +16.2%       1117 ~ 3%  xps2/pigz/100%-512K
     23485 ~ 3%     +20.1%      28204 ~ 2%  TOTAL slabinfo.kmalloc-96.num_o=
bjs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      2984 ~ 7%     -14.4%       2556 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
      2984 ~ 7%     -14.4%       2556 ~ 6%  TOTAL numa-vmstat.node2.nr_slab=
_reclaimable

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1.10 ~ 2%     -14.7%       0.94 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
      1.10 ~ 2%     -14.7%       0.94 ~ 2%  TOTAL perf-profile.cpu-cycles.c=
opy_page_to_iter_iovec.copy_page_to_iter.pipe_read.new_sync_read.vfs_read

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1612 ~ 4%     +26.1%       2033 ~ 7%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1650 ~ 3%     +16.6%       1924 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      1697 ~ 7%     +10.2%       1871 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      1650 ~ 5%     +23.0%       2030 ~ 7%  lkp-snb01/hackbench/50%-threads=
-pipe
      1683 ~ 6%     +22.4%       2060 ~ 6%  lkp-snb01/hackbench/50%-threads=
-socket
      8295 ~ 5%     +19.6%       9920 ~ 6%  TOTAL slabinfo.kmalloc-2048.act=
ive_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     10315 ~ 4%     -15.9%       8677 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
    156268 ~ 8%     +35.9%     212363 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     15887 ~ 0%     -13.7%      13711 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
     15235 ~ 0%     -12.8%      13288 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
    197705 ~ 6%     +25.5%     248040 ~ 4%  TOTAL slabinfo.kmalloc-512.acti=
ve_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     47147 ~ 5%     -12.4%      41300 ~ 5%  lkp-snb01/hackbench/50%-threads=
-socket
     47147 ~ 5%     -12.4%      41300 ~ 5%  TOTAL slabinfo.kmalloc-64.num_o=
bjs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       736 ~ 5%     -12.4%        645 ~ 5%  lkp-snb01/hackbench/50%-threads=
-socket
       736 ~ 5%     -12.4%        645 ~ 5%  TOTAL slabinfo.kmalloc-64.num_s=
labs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       736 ~ 5%     -12.4%        645 ~ 5%  lkp-snb01/hackbench/50%-threads=
-socket
       736 ~ 5%     -12.4%        645 ~ 5%  TOTAL slabinfo.kmalloc-64.activ=
e_slabs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      2047 ~ 3%     -13.3%       1774 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1324 ~ 4%     -20.5%       1052 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      1414 ~ 4%     -14.8%       1205 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      2068 ~ 3%      -7.2%       1919 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
      6855 ~ 3%     -13.2%       5952 ~ 1%  TOTAL uptime.idle

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

    245637 ~ 7%      +8.9%     267451 ~ 5%  lkp-snb01/hackbench/50%-process=
-socket
    245637 ~ 7%      +8.9%     267451 ~ 5%  TOTAL numa-meminfo.node0.FilePa=
ges

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     61410 ~ 7%      +8.9%      66862 ~ 5%  lkp-snb01/hackbench/50%-process=
-socket
     61410 ~ 7%      +8.9%      66862 ~ 5%  TOTAL numa-vmstat.node0.nr_file=
_pages

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      6546 ~ 4%     +23.3%       8070 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      6546 ~ 4%     +23.3%       8070 ~ 0%  TOTAL slabinfo.kmalloc-512.acti=
ve_slabs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      6546 ~ 4%     +23.3%       8070 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      6546 ~ 4%     +23.3%       8070 ~ 0%  TOTAL slabinfo.kmalloc-512.num_=
slabs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1.36 ~ 7%     +17.3%       1.59 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      1.36 ~ 7%     +17.3%       1.59 ~ 1%  TOTAL perf-profile.cpu-cycles.k=
mem_cache_free.kfree_skbmem.consume_skb.unix_stream_recvmsg.sock_aio_read

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1709 ~ 3%     +24.5%       2127 ~ 7%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1738 ~ 2%     +14.8%       1995 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      1772 ~ 6%     +11.6%       1978 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      1738 ~ 4%     +20.8%       2100 ~ 8%  lkp-snb01/hackbench/50%-threads=
-pipe
      1768 ~ 4%     +18.4%       2092 ~ 6%  lkp-snb01/hackbench/50%-threads=
-socket
      8726 ~ 4%     +18.0%      10294 ~ 6%  TOTAL slabinfo.kmalloc-2048.num=
_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     10420 ~ 2%     +16.0%      12086 ~ 0%  xps2/pigz/100%-128K
     10420 ~ 2%     +16.0%      12086 ~ 0%  TOTAL time.maximum_resident_set=
_size

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     59534 ~ 4%     +10.9%      66045 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     61226 ~ 6%      +9.0%      66711 ~ 6%  lkp-snb01/hackbench/50%-threads=
-socket
    120760 ~ 5%      +9.9%     132757 ~ 6%  TOTAL numa-vmstat.node1.nr_file=
_pages

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

    238111 ~ 4%     +11.0%     264270 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    244908 ~ 6%      +9.0%     266847 ~ 6%  lkp-snb01/hackbench/50%-threads=
-socket
    483019 ~ 5%     +10.0%     531117 ~ 6%  TOTAL numa-meminfo.node1.FilePa=
ges

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       318 ~ 1%     +14.5%        365 ~ 7%  lkp-snb01/hackbench/50%-process=
-socket
       320 ~ 2%     +18.3%        379 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
       639 ~ 1%     +16.4%        744 ~ 4%  TOTAL numa-vmstat.node0.nr_mlock

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1275 ~ 1%     +14.5%       1460 ~ 7%  lkp-snb01/hackbench/50%-process=
-socket
      1283 ~ 2%     +18.3%       1518 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
      2558 ~ 1%     +16.4%       2978 ~ 4%  TOTAL numa-meminfo.node0.Mlocked

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1.16 ~ 6%     +16.5%       1.36 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      1.16 ~ 6%     +16.5%       1.36 ~ 3%  TOTAL perf-profile.cpu-cycles.s=
ock_def_readable.unix_stream_sendmsg.sock_aio_write.do_sync_write.vfs_write

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       322 ~ 1%     +14.2%        368 ~ 7%  lkp-snb01/hackbench/50%-process=
-socket
       324 ~ 2%     +18.4%        383 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
       646 ~ 1%     +16.3%        751 ~ 4%  TOTAL numa-vmstat.node0.nr_unev=
ictable

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      1289 ~ 1%     +14.2%       1472 ~ 7%  lkp-snb01/hackbench/50%-process=
-socket
      1296 ~ 2%     +18.4%       1534 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
      2585 ~ 1%     +16.3%       3006 ~ 4%  TOTAL numa-meminfo.node0.Unevic=
table

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      6833 ~ 1%     +14.3%       7814 ~ 0%  lkp-snb01/hackbench/50%-threads=
-pipe
      6874 ~ 0%     +14.2%       7852 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
      7762 ~ 0%     +21.0%       9391 ~ 1%  xps2/pigz/100%-128K
     10780 ~ 1%     +17.2%      12635 ~ 0%  xps2/pigz/100%-512K
     32250 ~ 1%     +16.9%      37693 ~ 0%  TOTAL proc-vmstat.nr_active_anon

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      0.98 ~ 3%     +18.8%       1.16 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
      1.01 ~ 4%     +14.1%       1.16 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
      1.99 ~ 3%     +16.4%       2.32 ~ 2%  TOTAL perf-profile.cpu-cycles.s=
ock_wfree.unix_destruct_scm.skb_release_head_state.skb_release_all.consume_=
skb

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     27336 ~ 1%     +14.3%      31255 ~ 0%  lkp-snb01/hackbench/50%-threads=
-pipe
     27500 ~ 0%     +14.2%      31415 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
     31071 ~ 0%     +20.9%      37558 ~ 1%  xps2/pigz/100%-128K
     43137 ~ 1%     +17.2%      50564 ~ 0%  xps2/pigz/100%-512K
    129045 ~ 1%     +16.9%     150794 ~ 0%  TOTAL meminfo.Active(anon)

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

    122099 ~ 2%     -15.4%     103257 ~ 7%  lkp-nex04/ebizzy/200%-100x-10s
     75440 ~ 7%     +14.9%      86704 ~ 8%  lkp-snb01/hackbench/50%-process=
-socket
    197539 ~ 3%      -3.8%     189961 ~ 8%  TOTAL meminfo.DirectMap4k

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      6946 ~ 1%     +14.2%       7931 ~ 0%  lkp-snb01/hackbench/50%-threads=
-pipe
      6984 ~ 0%     +14.1%       7967 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
      7847 ~ 0%     +20.6%       9467 ~ 1%  xps2/pigz/100%-128K
     10934 ~ 1%     +16.5%      12740 ~ 0%  xps2/pigz/100%-512K
     32712 ~ 1%     +16.5%      38106 ~ 0%  TOTAL proc-vmstat.nr_anon_pages

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     27785 ~ 1%     +14.2%      31721 ~ 0%  lkp-snb01/hackbench/50%-threads=
-pipe
     27940 ~ 0%     +14.1%      31874 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
     31404 ~ 0%     +20.6%      37861 ~ 1%  xps2/pigz/100%-128K
     43744 ~ 1%     +16.5%      50963 ~ 0%  xps2/pigz/100%-512K
    130875 ~ 1%     +16.5%     152421 ~ 0%  TOTAL meminfo.AnonPages

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      3.76 ~ 7%     +18.1%       4.44 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
      3.76 ~ 7%     +18.1%       4.44 ~ 2%  TOTAL perf-profile.cpu-cycles.s=
ock_alloc_send_pskb.unix_stream_sendmsg.sock_aio_write.do_sync_write.vfs_wr=
ite

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      6183 ~ 1%     -12.8%       5393 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
      6183 ~ 1%     -12.8%       5393 ~ 1%  TOTAL slabinfo.kmalloc-1024.num=
_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

    144025 ~ 3%     +12.7%     162324 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
    144025 ~ 3%     +12.7%     162324 ~ 0%  TOTAL proc-vmstat.nr_slab_unrec=
laimable

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

  19588996 ~ 4%      -8.8%   17873043 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
   2289777 ~ 0%     -11.4%    2029791 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
   1634939 ~ 2%     +20.6%    1971939 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-socket
  23513712 ~ 3%      -7.0%   21874773 ~ 1%  TOTAL proc-vmstat.pgfault

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      0.94 ~10%     +17.2%       1.10 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      0.94 ~10%     +17.2%       1.10 ~ 1%  TOTAL perf-profile.cpu-cycles._=
_slab_free.kmem_cache_free.kfree_skbmem.consume_skb.unix_stream_recvmsg

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      2.76 ~ 8%     +20.3%       3.32 ~ 4%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      2.90 ~ 5%     +18.3%       3.43 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      2.65 ~ 6%     +11.4%       2.96 ~ 3%  lkp-snb01/hackbench/50%-process=
-socket
      8.31 ~ 7%     +16.8%       9.71 ~ 4%  TOTAL perf-profile.cpu-cycles._=
raw_spin_lock.unix_stream_sendmsg.sock_aio_write.do_sync_write.vfs_write

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      6134 ~ 5%     +11.2%       6820 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
     12086 ~ 7%     +11.5%      13475 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     18221 ~ 6%     +11.4%      20295 ~ 1%  TOTAL slabinfo.proc_inode_cache=
.active_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     15582 ~ 2%      -8.3%      14292 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      6145 ~ 1%     -12.7%       5367 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
     21727 ~ 2%      -9.5%      19659 ~ 0%  TOTAL slabinfo.kmalloc-1024.act=
ive_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     18683 ~ 4%     -11.4%      16555 ~ 3%  lkp-snb01/hackbench/50%-threads=
-socket
      3263 ~ 3%      -8.8%       2977 ~ 4%  xps2/pigz/100%-512K
     21946 ~ 4%     -11.0%      19533 ~ 3%  TOTAL slabinfo.vm_area_struct.n=
um_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      0.94 ~ 8%     +15.6%       1.09 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      0.94 ~ 8%     +15.6%       1.09 ~ 1%  TOTAL perf-profile.cpu-cycles._=
_kmalloc_node_track_caller.__kmalloc_reserve.__alloc_skb.sock_alloc_send_ps=
kb.unix_stream_sendmsg

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     31.46 ~ 2%      -8.7%      28.73 ~ 1%  xps2/pigz/100%-128K
     10.39 ~ 5%     -12.8%       9.07 ~ 4%  xps2/pigz/100%-512K
     41.85 ~ 3%      -9.7%      37.80 ~ 2%  TOTAL perf-profile.cpu-cycles.d=
eflateSetDictionary

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     18562 ~ 4%     -11.5%      16425 ~ 3%  lkp-snb01/hackbench/50%-threads=
-socket
     18562 ~ 4%     -11.5%      16425 ~ 3%  TOTAL slabinfo.vm_area_struct.a=
ctive_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      3638 ~ 3%     +14.5%       4167 ~ 3%  lkp-nex04/ebizzy/200%-100x-10s
      1942 ~ 6%      +9.6%       2128 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      5580 ~ 4%     +12.8%       6295 ~ 2%  TOTAL slabinfo.shmem_inode_cach=
e.num_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      3638 ~ 3%     +14.5%       4167 ~ 3%  lkp-nex04/ebizzy/200%-100x-10s
      1942 ~ 6%      +9.6%       2128 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      5580 ~ 4%     +12.8%       6295 ~ 2%  TOTAL slabinfo.shmem_inode_cach=
e.active_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      2.22 ~ 1%     -10.4%       1.99 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
      2.15 ~ 2%     -11.0%       1.91 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
      4.36 ~ 2%     -10.7%       3.90 ~ 1%  TOTAL perf-profile.cpu-cycles.u=
nix_stream_sendmsg.sock_aio_write.do_sync_write.vfs_write.sys_write

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     50637 ~27%     +37.0%      69389 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     50637 ~27%     +37.0%      69389 ~ 5%  TOTAL numa-meminfo.node1.Active=
(file)

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

    135247 ~ 3%      -9.2%     122745 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    135247 ~ 3%      -9.2%     122745 ~ 2%  TOTAL slabinfo.kmalloc-16.activ=
e_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     12672 ~27%     +36.9%      17348 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     12672 ~27%     +36.9%      17348 ~ 5%  TOTAL numa-vmstat.node1.nr_acti=
ve_file

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      6590 ~ 2%      -8.5%       6029 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      2337 ~ 3%      -7.8%       2154 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      8927 ~ 2%      -8.3%       8183 ~ 0%  TOTAL vmstat.procs.r

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

    577019 ~ 3%     +12.0%     646420 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
    577019 ~ 3%     +12.0%     646420 ~ 0%  TOTAL meminfo.SUnreclaim

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     28323 ~ 1%      -8.1%      26024 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
     28323 ~ 1%      -8.1%      26024 ~ 1%  TOTAL slabinfo.kmalloc-32.num_o=
bjs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     28272 ~ 1%      -8.0%      26024 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
     28272 ~ 1%      -8.0%      26024 ~ 1%  TOTAL slabinfo.kmalloc-32.activ=
e_objs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     21290 ~ 0%      -9.1%      19351 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
     21290 ~ 0%      -9.1%      19351 ~ 0%  TOTAL softirqs.HRTIMER

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      6.43 ~ 2%      +9.7%       7.06 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
      6.43 ~ 2%      +9.7%       7.06 ~ 1%  TOTAL perf-profile.cpu-cycles._=
raw_spin_lock_irqsave.__wake_up_sync_key.sock_def_readable.unix_stream_send=
msg.sock_aio_write

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

   4963887 ~ 0%     -21.0%    3922849 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
 1.082e+09 ~ 1%     +16.2%  1.257e+09 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
  29827640 ~16%    +107.1%   61772834 ~19%  lkp-snb01/hackbench/1600%-threa=
ds-socket
 4.614e+08 ~ 0%     +21.4%  5.601e+08 ~ 8%  lkp-snb01/hackbench/50%-process=
-pipe
 3.262e+08 ~ 0%      -6.2%  3.058e+08 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
 3.606e+08 ~ 0%     -16.2%  3.022e+08 ~ 4%  lkp-snb01/hackbench/50%-threads=
-socket
    636012 ~ 4%    +108.7%    1327552 ~ 1%  xps2/pigz/100%-128K
    213182 ~ 2%     +95.3%     416249 ~ 0%  xps2/pigz/100%-512K
 2.266e+09 ~ 1%     +10.0%  2.493e+09 ~ 3%  TOTAL time.involuntary_context_=
switches

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

    182314 ~ 2%     -47.9%      94988 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
 2.205e+09 ~ 1%     -20.8%  1.747e+09 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
 2.174e+09 ~ 1%     -13.3%  1.884e+09 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
 1.323e+09 ~ 0%     +11.9%  1.481e+09 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
 1.372e+09 ~ 0%      +5.6%  1.449e+09 ~ 4%  lkp-snb01/hackbench/50%-threads=
-socket
    961734 ~ 0%     +46.2%    1406099 ~ 1%  xps2/pigz/100%-128K
    256616 ~ 0%     +57.3%     403617 ~ 0%  xps2/pigz/100%-512K
 7.076e+09 ~ 0%      -7.2%  6.563e+09 ~ 1%  TOTAL time.voluntary_context_sw=
itches

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

    787704 ~ 6%     -45.8%     426544 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    841343 ~ 2%     -43.2%     478265 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
   1408782 ~ 0%      -9.6%    1274109 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
    754031 ~ 0%     +32.4%     998458 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
   1491671 ~ 0%     -21.9%    1165300 ~14%  lkp-snb01/hackbench/50%-threads=
-pipe
    868624 ~ 1%     +18.6%    1030549 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
     10046 ~ 1%      -3.3%       9712 ~ 0%  xps2/pigz/100%-128K
      9136 ~ 1%      -4.7%       8705 ~ 0%  xps2/pigz/100%-512K
   6171339 ~ 1%     -12.6%    5391646 ~ 6%  TOTAL vmstat.system.in

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

   5468882 ~ 1%     -14.3%    4685706 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
   5411698 ~ 1%      -6.2%    5077434 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    429763 ~ 6%     +20.4%     517410 ~ 8%  lkp-snb01/hackbench/1600%-threa=
ds-socket
   3992309 ~ 0%      +7.2%    4279709 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
   2934763 ~ 0%      +2.6%    3012021 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
   4082154 ~ 0%      +5.0%    4285056 ~ 1%  lkp-snb01/hackbench/50%-threads=
-pipe
      5673 ~ 1%     +67.2%       9487 ~ 1%  xps2/pigz/100%-128K
      1948 ~ 0%     +63.1%       3177 ~ 0%  xps2/pigz/100%-512K
  22327193 ~ 1%      -2.0%   21870003 ~ 1%  TOTAL vmstat.system.cs

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

 1.228e+09 ~ 0%      -3.4%  1.186e+09 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
  18324154 ~ 4%      -7.6%   16934952 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
  17000658 ~ 1%      +4.5%   17758218 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-socket
   1204306 ~ 1%     -19.3%     971559 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
   1001537 ~ 0%      +8.9%    1090745 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
    614124 ~ 0%     -24.8%     461973 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
    554242 ~ 0%     -20.0%     443398 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
    134001 ~ 0%     -21.1%     105688 ~ 5%  lkp-snb01/hackbench/50%-threads=
-pipe
    123169 ~ 1%     -12.4%     107852 ~ 7%  lkp-snb01/hackbench/50%-threads=
-socket
     12905 ~ 0%     +15.3%      14885 ~ 0%  xps2/pigz/100%-128K
     26476 ~ 0%      +7.1%      28357 ~ 0%  xps2/pigz/100%-512K
 1.267e+09 ~ 0%      -3.4%  1.224e+09 ~ 0%  TOTAL time.minor_page_faults

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

      4160 ~ 0%      -4.6%       3968 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
      1494 ~ 1%      -7.3%       1385 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1213 ~ 1%      -4.9%       1153 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
       978 ~ 0%      +4.5%       1023 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
       919 ~ 0%      -4.1%        881 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
       724 ~ 0%      -5.1%        687 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
       677 ~ 0%     -12.1%        595 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
       602 ~ 0%     -14.3%        516 ~ 4%  lkp-snb01/hackbench/50%-threads=
-socket
     10772 ~ 0%      -5.2%      10212 ~ 1%  TOTAL time.user_time

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       605 ~ 0%      +4.6%        633 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
       605 ~ 0%      +4.6%        633 ~ 0%  TOTAL time.elapsed_time

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

     59558 ~ 0%      -1.1%      58931 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
     17803 ~ 0%      +3.1%      18349 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     17801 ~ 0%      +1.8%      18115 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     17578 ~ 0%      +5.6%      18556 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
    112742 ~ 0%      +1.1%     113954 ~ 0%  TOTAL time.system_time

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       164 ~ 0%      -2.4%        160 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
       171 ~ 0%      -3.7%        165 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
       168 ~ 0%      +1.5%        170 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
       161 ~ 0%      -2.1%        157 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
       165 ~ 0%      -2.9%        160 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
       161 ~ 0%      -2.4%        157 ~ 0%  lkp-snb01/hackbench/50%-threads=
-pipe
       164 ~ 0%      -2.7%        159 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
      1156 ~ 0%      -2.1%       1132 ~ 0%  TOTAL turbostat.Cor_W

      v3.16-rc3  dc09d70da67f3c92f34ed31bd  =

---------------  -------------------------  =

       192 ~ 0%      -2.2%        187 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
       199 ~ 0%      -3.3%        192 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
       198 ~ 0%      +1.3%        201 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
       189 ~ 0%      -1.9%        185 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
       192 ~ 0%      -2.2%        188 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
       189 ~ 0%      -2.3%        185 ~ 0%  lkp-snb01/hackbench/50%-threads=
-pipe
       192 ~ 0%      -2.1%        188 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
      1353 ~ 0%      -1.8%       1329 ~ 0%  TOTAL turbostat.Pkg_W


Legend:
	~XX%    - stddev percent
	[+-]XX% - change percent


                               time.minor_page_faults

  650000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
         *............*.............*............*.............*...........=
.*
  600000 ++                                                                =
 |
         |                                                                 =
 |
         |                                                                 =
 |
  550000 ++                                                                =
 |
         |                                                                 =
 |
  500000 ++                                                                =
 |
         |            O                                                    =
 |
         O                          O            O                         =
 |
  450000 ++                                                                =
 |
         |                                                                 =
 |
         |                                                                 =
 |
  400000 ++----------------------------------------------------O-----------=
-+


                           time.involuntary_context_switches

  6.4e+08 ++---------------------------------------------------O-----------=
-+
  6.2e+08 ++                                                               =
 |
          |                                                                =
 |
    6e+08 ++           O                                                   =
 |
  5.8e+08 ++                                                               =
 |
          |                                                                =
 |
  5.6e+08 ++                                                               =
 |
  5.4e+08 ++                                                               =
 |
  5.2e+08 O+                        O                                      =
 |
          |                                       O                        =
 |
    5e+08 ++                                                               =
 |
  4.8e+08 ++                                                               =
 |
          |                   ......*.............*............*...........=
.|
  4.6e+08 *+...........*......                                             =
 *
  4.4e+08 ++---------------------------------------------------------------=
-+


                                hackbench.throughput

  100000 ++----------------------------------------------------------------=
-+
         *............*.............                    .......*...........=
.|
   95000 ++                         *............*......                   =
 *
   90000 ++                                                                =
 |
         |                                                                 =
 |
   85000 ++                                                                =
 |
         |                                                                 =
 |
   80000 ++                                                                =
 |
         |                                                                 =
 |
   75000 ++                                                                =
 |
   70000 ++                                                                =
 |
         O                          O            O                         =
 |
   65000 ++           O                                                    =
 |
         |                                                     O           =
 |
   60000 ++----------------------------------------------------------------=
-+


                                  turbostat.Pkg_W

  190 ++-------------------------------------------------------------------=
-+
      |      .......*.............*.............                           =
 |
  189 *+.....                                   *.............*............=
.*
      |                                                                    =
 |
      |                                                                    =
 |
  188 ++                                                                   =
 |
      |                                                                    =
 |
  187 ++                                                                   =
 |
      |                                                                    =
 |
  186 O+                          O             O                          =
 |
      |             O                                                      =
 |
      |                                                                    =
 |
  185 ++                                                                   =
 |
      |                                                       O            =
 |
  184 ++-------------------------------------------------------------------=
-+


                                   turbostat.Cor_W

  161.5 ++------------*------------*---------------------------------------=
-+
    161 *+.....                                  *............*............=
.*
        |                                                                  =
 |
  160.5 ++                                                                 =
 |
    160 ++                                                                 =
 |
        |                                                                  =
 |
  159.5 ++                                                                 =
 |
    159 ++                                                                 =
 |
  158.5 ++                                                                 =
 |
        O                          O             O                         =
 |
    158 ++            O                                                    =
 |
  157.5 ++                                                                 =
 |
        |                                                                  =
 |
    157 ++                                                    O            =
 |
  156.5 ++-----------------------------------------------------------------=
-+


                                   vmstat.system.in

  1.45e+06 ++--------------------------------------------------------------=
-+
           |                   ......*............*............            =
 |
   1.4e+06 *+...........*......                                *...........=
.*
           |                                                               =
 |
  1.35e+06 O+                        O            O                        =
 |
   1.3e+06 ++                                                              =
 |
           |            O                                                  =
 |
  1.25e+06 ++                                                              =
 |
           |                                                               =
 |
   1.2e+06 ++                                                              =
 |
  1.15e+06 ++                                                              =
 |
           |                                                               =
 |
   1.1e+06 ++                                                              =
 |
           |                                                   O           =
 |
  1.05e+06 ++--------------------------------------------------------------=
-+


                                   vmstat.system.cs

  4.35e+06 ++--------------------------------------------------O-----------=
-+
           |                                                               =
 |
   4.3e+06 ++           O                                                  =
 |
           O                                                               =
 |
  4.25e+06 ++                        O            O                        =
 |
   4.2e+06 ++                                                              =
 |
           |                                                               =
 |
  4.15e+06 ++                                                              =
 |
           |                                                               =
 |
   4.1e+06 ++                                                              =
 |
  4.05e+06 ++                                                              =
 |
           |                                                               =
 |
     4e+06 ++     ......*............*............       ......*...........=
.|
           *......                                *......                  =
 *
  3.95e+06 ++--------------------------------------------------------------=
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

--===============0153281514546919092==
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
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1Ni9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OS9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tcHJvY2VzcyAt
LXBpcGUgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tcHJvY2VzcyAtLXBpcGUg
LWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tcHJvY2VzcyAtLXBpcGUgLWwgNjAw
MDAKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tcHJvY2VzcyAtLXBpcGUgLWwgNjAwMDAKL3Vz
ci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tcHJvY2VzcyAtLXBpcGUgLWwgNjAwMDAKL3Vzci9iaW4v
aGFja2JlbmNoIC1nIDE2IC0tcHJvY2VzcyAtLXBpcGUgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2Jl
bmNoIC1nIDE2IC0tcHJvY2VzcyAtLXBpcGUgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNoIC1n
IDE2IC0tcHJvY2VzcyAtLXBpcGUgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0t
cHJvY2VzcyAtLXBpcGUgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tcHJvY2Vz
cyAtLXBpcGUgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tcHJvY2VzcyAtLXBp
cGUgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tcHJvY2VzcyAtLXBpcGUgLWwg
NjAwMDAKCg==

--===============0153281514546919092==--

