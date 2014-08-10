Content-Type: multipart/mixed; boundary="===============2573777920944538327=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [sched] 143e1e28cb4: +17.9% aim7.jobs-per-min, -9.7% hackbench.throughput
Date: Sun, 10 Aug 2014 12:41:27 +0800
Message-ID: <20140810044127.GB11810@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============2573777920944538327==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Vincent,

FYI, we noticed some performance ups/downs on

commit 143e1e28cb40bed836b0a06567208bd7347c9672 ("sched: Rework sched_domai=
n topology definition")

107437febd495a5  143e1e28cb40bed836b0a0656  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.09 =C2=B1 3%     +88.2%       0.17 =C2=B1 1%  nhm4/ebizzy/200%-100x=
-10s
      0.09 =C2=B1 3%     +88.2%       0.17 =C2=B1 1%  TOTAL ebizzy.throughp=
ut.per_thread.stddev_percent

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

    128529 =C2=B1 1%     +17.9%     151594 =C2=B1 0%  brickland1/aim7/6000-=
page_test
    128529 =C2=B1 1%     +17.9%     151594 =C2=B1 0%  TOTAL aim7.jobs-per-m=
in

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

    156539 =C2=B1 1%      -4.3%     149885 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
    116465 =C2=B1 1%     -17.1%      96542 =C2=B1 1%  wsm/hackbench/1600%-p=
rocess-pipe
    273004 =C2=B1 1%      -9.7%     246428 =C2=B1 0%  TOTAL hackbench.throu=
ghput

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

  12451869 =C2=B1 0%      -2.9%   12087560 =C2=B1 0%  brickland3/vm-scalabi=
lity/300s-lru-file-readonce
  12451869 =C2=B1 0%      -2.9%   12087560 =C2=B1 0%  TOTAL vm-scalability.=
throughput

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      1980 =C2=B1 0%      -2.4%       1933 =C2=B1 0%  nhm4/ebizzy/200%-100x=
-10s
      1980 =C2=B1 0%      -2.4%       1933 =C2=B1 0%  TOTAL ebizzy.throughp=
ut.per_thread.min

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

 4.446e+08 =C2=B1 0%      -1.9%  4.364e+08 =C2=B1 0%  lkp-nex04/pigz/100%-1=
28K
 4.446e+08 =C2=B1 0%      -1.9%  4.364e+08 =C2=B1 0%  TOTAL pigz.throughput

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

     27.18 =C2=B1 0%      -1.5%      26.78 =C2=B1 0%  nhm4/ebizzy/200%-100x=
-10s
     27.18 =C2=B1 0%      -1.5%      26.78 =C2=B1 0%  TOTAL ebizzy.time.user

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      2083 =C2=B1 0%      +1.3%       2110 =C2=B1 0%  nhm4/ebizzy/200%-100x=
-10s
      2083 =C2=B1 0%      +1.3%       2110 =C2=B1 0%  TOTAL ebizzy.throughp=
ut.per_thread.max

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

     32335 =C2=B1 0%      -1.0%      32012 =C2=B1 0%  nhm4/ebizzy/200%-100x=
-10s
     32335 =C2=B1 0%      -1.0%      32012 =C2=B1 0%  TOTAL ebizzy.throughp=
ut

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      6626 =C2=B1 5%     -88.7%        751 =C2=B136%  brickland3/vm-scalabi=
lity/300s-lru-file-readonce
      6626 =C2=B1 5%     -88.7%        751 =C2=B136%  TOTAL cpuidle.C3-IVT.=
usage

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

  14204402 =C2=B119%     -71.5%    4050186 =C2=B134%  brickland3/vm-scalabi=
lity/300s-lru-file-readonce
  14204402 =C2=B119%     -71.5%    4050186 =C2=B134%  TOTAL cpuidle.C3-IVT.=
time

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      0.38 =C2=B132%    +218.1%       1.20 =C2=B1 4%  wsm/hackbench/1600%-p=
rocess-pipe
      0.38 =C2=B132%    +218.1%       1.20 =C2=B1 4%  TOTAL perf-profile.cp=
u-cycles.__schedule.schedule.pipe_wait.pipe_read.do_sync_read

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

     76064 =C2=B1 3%     -32.2%      51572 =C2=B1 6%  brickland1/aim7/6000-=
page_test
    269053 =C2=B1 1%     -57.9%     113386 =C2=B1 1%  brickland3/vm-scalabi=
lity/300s-lru-file-readonce
    345117 =C2=B1 1%     -52.2%     164959 =C2=B1 2%  TOTAL cpuidle.C6-IVT.=
usage

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

  59366697 =C2=B1 3%     -46.1%   32017187 =C2=B1 7%  brickland1/aim7/6000-=
page_test
  59366697 =C2=B1 3%     -46.1%   32017187 =C2=B1 7%  TOTAL cpuidle.C1-IVT.=
time

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

  26666815 =C2=B1 2%     +83.3%   48893253 =C2=B1 2%  lkp-nex04/pigz/100%-1=
28K
  26666815 =C2=B1 2%     +83.3%   48893253 =C2=B1 2%  TOTAL cpuidle.C1E-NHM=
.time

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      2561 =C2=B1 7%     -42.9%       1463 =C2=B1 9%  brickland1/aim7/6000-=
page_test
      2561 =C2=B1 7%     -42.9%       1463 =C2=B1 9%  TOTAL numa-numastat.n=
ode2.other_node

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

    116864 =C2=B1 2%     +77.4%     207322 =C2=B1 2%  lkp-nex04/pigz/100%-1=
28K
    116864 =C2=B1 2%     +77.4%     207322 =C2=B1 2%  TOTAL cpuidle.C1E-NHM=
.usage

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      0.65 =C2=B122%     +55.4%       1.02 =C2=B1 5%  lkp-nex04/pigz/100%-1=
28K
      0.65 =C2=B122%     +55.4%       1.02 =C2=B1 5%  TOTAL perf-profile.cp=
u-cycles.intel_idle.cpuidle_enter_state.cpuidle_enter.cpu_startup_entry.sta=
rt_secondary

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      9926 =C2=B1 2%     -43.8%       5577 =C2=B1 4%  brickland1/aim7/6000-=
page_test
      9926 =C2=B1 2%     -43.8%       5577 =C2=B1 4%  TOTAL proc-vmstat.num=
a_other

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      2627 =C2=B112%     -49.1%       1337 =C2=B112%  brickland1/aim7/6000-=
page_test
      2627 =C2=B112%     -49.1%       1337 =C2=B112%  TOTAL numa-numastat.n=
ode1.other_node

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      0.88 =C2=B1 6%     +65.8%       1.46 =C2=B1 4%  lkp-nex04/pigz/100%-1=
28K
      0.88 =C2=B1 6%     +65.8%       1.46 =C2=B1 4%  TOTAL turbostat.%c3

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

     19542 =C2=B1 9%     -38.3%      12057 =C2=B1 4%  brickland1/aim7/6000-=
page_test
     19542 =C2=B1 9%     -38.3%      12057 =C2=B1 4%  TOTAL cpuidle.C1E-IVT=
.usage

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      1357 =C2=B1 8%     -39.0%        827 =C2=B116%  brickland3/vm-scalabi=
lity/300s-lru-file-readonce
      1357 =C2=B1 8%     -39.0%        827 =C2=B116%  TOTAL slabinfo.nfs_wr=
ite_data.num_objs

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      1357 =C2=B1 8%     -39.0%        827 =C2=B116%  brickland3/vm-scalabi=
lity/300s-lru-file-readonce
      1357 =C2=B1 8%     -39.0%        827 =C2=B116%  TOTAL slabinfo.nfs_wr=
ite_data.active_objs

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

    993654 =C2=B1 2%     -19.9%     795962 =C2=B1 3%  brickland1/aim7/6000-=
page_test
    343162 =C2=B1 6%     -59.1%     140462 =C2=B1 5%  brickland3/vm-scalabi=
lity/300s-lru-file-readonce
    315034 =C2=B1 3%     +34.5%     423784 =C2=B1 1%  wsm/hackbench/1600%-p=
rocess-pipe
   1651850 =C2=B1 3%     -17.7%    1360209 =C2=B1 2%  TOTAL softirqs.RCU

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      2455 =C2=B110%     -41.0%       1448 =C2=B1 9%  brickland1/aim7/6000-=
page_test
      2455 =C2=B110%     -41.0%       1448 =C2=B1 9%  TOTAL numa-numastat.n=
ode0.other_node

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

    582269 =C2=B114%     -55.6%     258617 =C2=B116%  brickland1/aim7/6000-=
page_test
    441740 =C2=B118%     -49.2%     224389 =C2=B1 0%  brickland3/vm-scalabi=
lity/300s-lru-file-readonce
    219830 =C2=B1 1%     -29.9%     154078 =C2=B1 0%  lkp-nex04/pigz/100%-1=
28K
    156140 =C2=B1 8%     -12.1%     137250 =C2=B1 5%  lkp-snb01/hackbench/1=
600%-process-pipe
     47877 =C2=B1 1%     -10.3%      42941 =C2=B1 1%  wsm/hackbench/1600%-p=
rocess-pipe
   1447857 =C2=B112%     -43.6%     817277 =C2=B1 6%  TOTAL softirqs.SCHED

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

    892836 =C2=B1 1%     +58.0%    1410897 =C2=B1 0%  lkp-nex04/pigz/100%-1=
28K
    892836 =C2=B1 1%     +58.0%    1410897 =C2=B1 0%  TOTAL cpuidle.C3-NHM.=
usage

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

    471304 =C2=B111%     -31.4%     323251 =C2=B1 8%  brickland1/aim7/6000-=
page_test
    471304 =C2=B111%     -31.4%     323251 =C2=B1 8%  TOTAL numa-vmstat.nod=
e1.nr_anon_pages

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

 4.875e+08 =C2=B1 2%     +57.7%  7.688e+08 =C2=B1 2%  lkp-nex04/pigz/100%-1=
28K
 4.875e+08 =C2=B1 2%     +57.7%  7.688e+08 =C2=B1 2%  TOTAL cpuidle.C3-NHM.=
time

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      2281 =C2=B112%     -41.8%       1327 =C2=B116%  brickland1/aim7/6000-=
page_test
      2281 =C2=B112%     -41.8%       1327 =C2=B116%  TOTAL numa-numastat.n=
ode3.other_node

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

   1903446 =C2=B111%     -30.7%    1318156 =C2=B1 7%  brickland1/aim7/6000-=
page_test
   1903446 =C2=B111%     -30.7%    1318156 =C2=B1 7%  TOTAL numa-meminfo.no=
de1.AnonPages

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      1.64 =C2=B1 3%     -44.8%       0.90 =C2=B1 4%  brickland3/vm-scalabi=
lity/300s-lru-file-readonce
      1.83 =C2=B1 1%     +54.8%       2.84 =C2=B1 0%  lkp-nex04/pigz/100%-1=
28K
      1.26 =C2=B1 2%     -21.9%       0.99 =C2=B1 6%  wsm/hackbench/1600%-p=
rocess-pipe
      4.73 =C2=B1 2%      -0.1%       4.73 =C2=B1 2%  TOTAL turbostat.%c1

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

    518274 =C2=B111%     -30.4%     360742 =C2=B1 8%  brickland1/aim7/6000-=
page_test
    518274 =C2=B111%     -30.4%     360742 =C2=B1 8%  TOTAL numa-vmstat.nod=
e1.nr_active_anon

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

   2097138 =C2=B110%     -30.0%    1469003 =C2=B1 8%  brickland1/aim7/6000-=
page_test
   2097138 =C2=B110%     -30.0%    1469003 =C2=B1 8%  TOTAL numa-meminfo.no=
de1.Active(anon)

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

  49527464 =C2=B1 6%     -32.4%   33488833 =C2=B1 4%  brickland1/aim7/6000-=
page_test
  49527464 =C2=B1 6%     -32.4%   33488833 =C2=B1 4%  TOTAL cpuidle.C1E-IVT=
.time

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      2084 =C2=B110%     +31.6%       2743 =C2=B1 6%  lkp-snb01/hackbench/1=
600%-process-pipe
       235 =C2=B1 8%     -35.7%        151 =C2=B1 8%  wsm/hackbench/1600%-p=
rocess-pipe
      2319 =C2=B110%     +24.8%       2894 =C2=B1 6%  TOTAL cpuidle.POLL.us=
age

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

     54543 =C2=B111%     -37.2%      34252 =C2=B116%  brickland1/aim7/6000-=
page_test
      4542 =C2=B1 4%     -14.3%       3891 =C2=B1 6%  brickland3/vm-scalabi=
lity/300s-lru-file-readonce
     59085 =C2=B110%     -35.4%      38143 =C2=B115%  TOTAL cpuidle.C1-IVT.=
usage

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

    188938 =C2=B133%     -41.3%     110966 =C2=B116%  brickland1/aim7/6000-=
page_test
    188938 =C2=B133%     -41.3%     110966 =C2=B116%  TOTAL numa-meminfo.no=
de2.PageTables

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

     47262 =C2=B135%     -42.3%      27273 =C2=B116%  brickland1/aim7/6000-=
page_test
     47262 =C2=B135%     -42.3%      27273 =C2=B116%  TOTAL numa-vmstat.nod=
e2.nr_page_table_pages

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

   1944687 =C2=B110%     -25.8%    1443923 =C2=B116%  brickland1/aim7/6000-=
page_test
   1944687 =C2=B110%     -25.8%    1443923 =C2=B116%  TOTAL numa-meminfo.no=
de3.Active(anon)

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

   1754763 =C2=B111%     -26.6%    1288713 =C2=B116%  brickland1/aim7/6000-=
page_test
   1754763 =C2=B111%     -26.6%    1288713 =C2=B116%  TOTAL numa-meminfo.no=
de3.AnonPages

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

   1964722 =C2=B110%     -25.5%    1464696 =C2=B116%  brickland1/aim7/6000-=
page_test
   1964722 =C2=B110%     -25.5%    1464696 =C2=B116%  TOTAL numa-meminfo.no=
de3.Active

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

  17100655 =C2=B1 7%     +44.6%   24731604 =C2=B1 2%  lkp-nex04/pigz/100%-1=
28K
  37335977 =C2=B1 6%     -28.6%   26654124 =C2=B1 7%  wsm/hackbench/1600%-p=
rocess-pipe
  54436632 =C2=B1 6%      -5.6%   51385728 =C2=B1 5%  TOTAL cpuidle.C1-NHM.=
time

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

    432109 =C2=B1 9%     -26.2%     318886 =C2=B114%  brickland1/aim7/6000-=
page_test
    432109 =C2=B1 9%     -26.2%     318886 =C2=B114%  TOTAL numa-vmstat.nod=
e3.nr_anon_pages

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

    479527 =C2=B1 9%     -25.3%     358029 =C2=B114%  brickland1/aim7/6000-=
page_test
    479527 =C2=B1 9%     -25.3%     358029 =C2=B114%  TOTAL numa-vmstat.nod=
e3.nr_active_anon

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

   3157742 =C2=B116%     -26.5%    2320253 =C2=B110%  brickland1/aim7/6000-=
page_test
   3157742 =C2=B116%     -26.5%    2320253 =C2=B110%  TOTAL numa-meminfo.no=
de1.MemUsed

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      2.00 =C2=B139%     -34.4%       1.31 =C2=B110%  lkp-nex04/pigz/100%-1=
28K
      2.00 =C2=B139%     -34.4%       1.31 =C2=B110%  TOTAL perf-profile.cp=
u-cycles.update_cfs_shares.task_tick_fair.scheduler_tick.update_process_tim=
es.tick_sched_handle

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      9869 =C2=B115%     +21.8%      12025 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      9869 =C2=B115%     +21.8%      12025 =C2=B1 1%  TOTAL numa-vmstat.nod=
e1.numa_other

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

     61500 =C2=B1 2%     +24.6%      76639 =C2=B1 2%  lkp-nex04/pigz/100%-1=
28K
   1206181 =C2=B1 3%     -30.5%     838619 =C2=B1 2%  wsm/hackbench/1600%-p=
rocess-pipe
   1267682 =C2=B1 3%     -27.8%     915259 =C2=B1 2%  TOTAL cpuidle.C1-NHM.=
usage

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

   2118206 =C2=B110%     -29.7%    1488874 =C2=B1 7%  brickland1/aim7/6000-=
page_test
    593077 =C2=B1 4%      -9.9%     534490 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
   2711283 =C2=B1 9%     -25.4%    2023365 =C2=B1 6%  TOTAL numa-meminfo.no=
de1.Active

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

    227935 =C2=B113%     -30.2%     159051 =C2=B116%  brickland3/vm-scalabi=
lity/300s-lru-file-readonce
    227935 =C2=B113%     -30.2%     159051 =C2=B116%  TOTAL numa-vmstat.nod=
e0.workingset_nodereclaim

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

   7303589 =C2=B1 2%     -24.8%    5495829 =C2=B1 3%  brickland1/aim7/6000-=
page_test
    202793 =C2=B1 3%     +20.0%     243307 =C2=B1 2%  wsm/hackbench/1600%-p=
rocess-pipe
   7506382 =C2=B1 2%     -23.5%    5739136 =C2=B1 3%  TOTAL meminfo.AnonPag=
es

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

   2064106 =C2=B1 7%     -23.3%    1582792 =C2=B1 8%  brickland1/aim7/6000-=
page_test
   2064106 =C2=B1 7%     -23.3%    1582792 =C2=B1 8%  TOTAL numa-meminfo.no=
de0.Active

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      8189 =C2=B1 9%     -18.6%       6669 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
      8189 =C2=B1 9%     -18.6%       6669 =C2=B1 3%  TOTAL slabinfo.proc_i=
node_cache.active_objs

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

   8064024 =C2=B1 2%     -24.0%    6132677 =C2=B1 3%  brickland1/aim7/6000-=
page_test
    203300 =C2=B1 3%     +19.6%     243236 =C2=B1 2%  wsm/hackbench/1600%-p=
rocess-pipe
   8267324 =C2=B1 2%     -22.9%    6375914 =C2=B1 3%  TOTAL meminfo.Active(=
anon)

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      2815 =C2=B1 3%      -8.3%       2581 =C2=B1 6%  brickland3/vm-scalabi=
lity/300s-lru-file-readonce
      1076 =C2=B115%     +19.6%       1287 =C2=B112%  nhm4/ebizzy/200%-100x=
-10s
      3892 =C2=B1 6%      -0.6%       3868 =C2=B1 8%  TOTAL slabinfo.buffer=
_head.num_objs

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

 6.567e+11 =C2=B1 3%     -21.4%   5.16e+11 =C2=B1 4%  brickland1/aim7/6000-=
page_test
   1872397 =C2=B1 3%     +22.2%    2288513 =C2=B1 2%  wsm/hackbench/1600%-p=
rocess-pipe
 6.567e+11 =C2=B1 3%     -21.4%   5.16e+11 =C2=B1 4%  TOTAL meminfo.Committ=
ed_AS

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

    235358 =C2=B1 5%     -19.8%     188793 =C2=B1 3%  brickland1/aim7/6000-=
page_test
    235358 =C2=B1 5%     -19.8%     188793 =C2=B1 3%  TOTAL proc-vmstat.pgm=
igrate_success

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

    235358 =C2=B1 5%     -19.8%     188793 =C2=B1 3%  brickland1/aim7/6000-=
page_test
    235358 =C2=B1 5%     -19.8%     188793 =C2=B1 3%  TOTAL proc-vmstat.num=
a_pages_migrated

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

    433235 =C2=B1 4%     -18.1%     354845 =C2=B1 5%  brickland1/aim7/6000-=
page_test
    433235 =C2=B1 4%     -18.1%     354845 =C2=B1 5%  TOTAL numa-vmstat.nod=
e2.nr_anon_pages

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

  90514624 =C2=B1 2%     -21.6%   70928192 =C2=B1 1%  wsm/hackbench/1600%-p=
rocess-pipe
  90514624 =C2=B1 2%     -21.6%   70928192 =C2=B1 1%  TOTAL proc-vmstat.pga=
lloc_dma32

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

    463719 =C2=B1 8%     -24.7%     349388 =C2=B1 7%  brickland1/aim7/6000-=
page_test
     71979 =C2=B1 2%     -11.7%      63550 =C2=B1 4%  lkp-snb01/hackbench/1=
600%-process-pipe
    535698 =C2=B1 7%     -22.9%     412938 =C2=B1 7%  TOTAL numa-vmstat.nod=
e0.nr_anon_pages

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

   1818612 =C2=B1 2%     -24.9%    1365670 =C2=B1 3%  brickland1/aim7/6000-=
page_test
     51594 =C2=B1 2%     +16.9%      60313 =C2=B1 1%  wsm/hackbench/1600%-p=
rocess-pipe
   1870207 =C2=B1 2%     -23.8%    1425983 =C2=B1 3%  TOTAL proc-vmstat.nr_=
anon_pages

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      3187 =C2=B1 5%     -18.5%       2599 =C2=B1 6%  brickland1/aim7/6000-=
page_test
      3187 =C2=B1 5%     -18.5%       2599 =C2=B1 6%  TOTAL numa-vmstat.nod=
e0.numa_other

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

   2007155 =C2=B1 2%     -24.3%    1518688 =C2=B1 3%  brickland1/aim7/6000-=
page_test
     51734 =C2=B1 2%     +16.6%      60298 =C2=B1 1%  wsm/hackbench/1600%-p=
rocess-pipe
   2058889 =C2=B1 2%     -23.3%    1578987 =C2=B1 3%  TOTAL proc-vmstat.nr_=
active_anon

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

   1395062 =C2=B1 6%     -19.0%    1130108 =C2=B1 3%  brickland1/aim7/6000-=
page_test
   1395062 =C2=B1 6%     -19.0%    1130108 =C2=B1 3%  TOTAL proc-vmstat.num=
a_hint_faults

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      2501 =C2=B1 9%     +25.0%       3126 =C2=B111%  brickland3/vm-scalabi=
lity/300s-lru-file-readonce
      2501 =C2=B1 9%     +25.0%       3126 =C2=B111%  TOTAL proc-vmstat.com=
pact_stall

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

    477037 =C2=B1 4%     -17.2%     394983 =C2=B1 5%  brickland1/aim7/6000-=
page_test
    477037 =C2=B1 4%     -17.2%     394983 =C2=B1 5%  TOTAL numa-vmstat.nod=
e2.nr_active_anon

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

    511455 =C2=B1 8%     -23.9%     389447 =C2=B1 7%  brickland1/aim7/6000-=
page_test
     71970 =C2=B1 2%     -11.7%      63552 =C2=B1 4%  lkp-snb01/hackbench/1=
600%-process-pipe
    583426 =C2=B1 7%     -22.4%     452999 =C2=B1 7%  TOTAL numa-vmstat.nod=
e0.nr_active_anon

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

    796281 =C2=B123%     -27.7%     575352 =C2=B1 3%  brickland1/aim7/6000-=
page_test
    157314 =C2=B1 2%     +22.7%     193026 =C2=B1 2%  wsm/hackbench/1600%-p=
rocess-pipe
    953596 =C2=B119%     -19.4%     768378 =C2=B1 3%  TOTAL meminfo.PageTab=
les

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      2829 =C2=B110%     +18.7%       3357 =C2=B1 3%  brickland1/aim7/6000-=
page_test
      2829 =C2=B110%     +18.7%       3357 =C2=B1 3%  TOTAL numa-vmstat.nod=
e2.nr_alloc_batch

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

   1850230 =C2=B1 8%     -24.1%    1405061 =C2=B1 8%  brickland1/aim7/6000-=
page_test
    289636 =C2=B1 2%     -12.3%     254041 =C2=B1 4%  lkp-snb01/hackbench/1=
600%-process-pipe
   2139866 =C2=B1 7%     -22.5%    1659103 =C2=B1 8%  TOTAL numa-meminfo.no=
de0.AnonPages

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

   8145316 =C2=B1 2%     -23.7%    6213832 =C2=B1 3%  brickland1/aim7/6000-=
page_test
    353534 =C2=B1 2%     +11.3%     393604 =C2=B1 1%  wsm/hackbench/1600%-p=
rocess-pipe
   8498851 =C2=B1 2%     -22.3%    6607437 =C2=B1 3%  TOTAL meminfo.Active

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      2706 =C2=B1 4%     +26.1%       3411 =C2=B1 5%  brickland1/aim7/6000-=
page_test
      2706 =C2=B1 4%     +26.1%       3411 =C2=B1 5%  TOTAL numa-vmstat.nod=
e1.nr_alloc_batch

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

 1.392e+08 =C2=B1 5%     -15.5%  1.176e+08 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
 1.392e+08 =C2=B1 5%     -15.5%  1.176e+08 =C2=B1 2%  TOTAL numa-numastat.n=
ode1.local_node

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

 1.392e+08 =C2=B1 5%     -15.5%  1.176e+08 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
 1.392e+08 =C2=B1 5%     -15.5%  1.176e+08 =C2=B1 2%  TOTAL numa-numastat.n=
ode1.numa_hit

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

   2044097 =C2=B1 7%     -23.5%    1562809 =C2=B1 8%  brickland1/aim7/6000-=
page_test
    289613 =C2=B1 2%     -12.3%     254058 =C2=B1 4%  lkp-snb01/hackbench/1=
600%-process-pipe
   2333711 =C2=B1 7%     -22.1%    1816867 =C2=B1 7%  TOTAL numa-meminfo.no=
de0.Active(anon)

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

    198747 =C2=B123%     -28.0%     143034 =C2=B1 3%  brickland1/aim7/6000-=
page_test
     40081 =C2=B1 2%     +19.1%      47725 =C2=B1 1%  wsm/hackbench/1600%-p=
rocess-pipe
    238828 =C2=B119%     -20.1%     190760 =C2=B1 2%  TOTAL proc-vmstat.nr_=
page_table_pages

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

  1.65e+08 =C2=B1 2%     -11.3%  1.463e+08 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
  82216748 =C2=B1 2%     -23.6%   62851371 =C2=B1 1%  wsm/hackbench/1600%-p=
rocess-pipe
 2.472e+08 =C2=B1 2%     -15.4%  2.092e+08 =C2=B1 2%  TOTAL proc-vmstat.pga=
lloc_normal

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

   2725835 =C2=B1 4%     -17.5%    2247537 =C2=B1 4%  brickland1/aim7/6000-=
page_test
   2725835 =C2=B1 4%     -17.5%    2247537 =C2=B1 4%  TOTAL numa-meminfo.no=
de2.MemUsed

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

    393637 =C2=B1 6%     -15.3%     333296 =C2=B1 2%  brickland1/aim7/6000-=
page_test
    393637 =C2=B1 6%     -15.3%     333296 =C2=B1 2%  TOTAL proc-vmstat.num=
a_hint_faults_local

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

 1.681e+08 =C2=B1 2%     -10.6%  1.504e+08 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
 1.709e+08 =C2=B1 2%     -22.6%  1.323e+08 =C2=B1 1%  wsm/hackbench/1600%-p=
rocess-pipe
 3.391e+08 =C2=B1 2%     -16.6%  2.827e+08 =C2=B1 2%  TOTAL proc-vmstat.num=
a_local

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

 1.681e+08 =C2=B1 2%     -10.6%  1.504e+08 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
 1.709e+08 =C2=B1 2%     -22.6%  1.323e+08 =C2=B1 1%  wsm/hackbench/1600%-p=
rocess-pipe
 3.391e+08 =C2=B1 2%     -16.6%  2.827e+08 =C2=B1 2%  TOTAL proc-vmstat.num=
a_hit

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

    109532 =C2=B1 1%     +20.5%     132015 =C2=B1 2%  wsm/hackbench/1600%-p=
rocess-pipe
    109532 =C2=B1 1%     +20.5%     132015 =C2=B1 2%  TOTAL slabinfo.vm_are=
a_struct.active_objs

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

 1.706e+08 =C2=B1 2%     -10.5%  1.527e+08 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
 1.727e+08 =C2=B1 2%     -22.6%  1.338e+08 =C2=B1 1%  wsm/hackbench/1600%-p=
rocess-pipe
 3.433e+08 =C2=B1 2%     -16.5%  2.865e+08 =C2=B1 2%  TOTAL proc-vmstat.pgf=
ree

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      2.82 =C2=B1 3%     +21.9%       3.43 =C2=B1 4%  brickland1/aim7/6000-=
page_test
      2.82 =C2=B1 3%     +21.9%       3.43 =C2=B1 4%  TOTAL turbostat.%pc2

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

   1045052 =C2=B1 1%     -15.9%     878536 =C2=B1 3%  brickland3/vm-scalabi=
lity/300s-lru-file-readonce
   1045052 =C2=B1 1%     -15.9%     878536 =C2=B1 3%  TOTAL proc-vmstat.wor=
kingset_nodereclaim

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

    148761 =C2=B1 1%     +19.9%     178354 =C2=B1 2%  wsm/hackbench/1600%-p=
rocess-pipe
    148761 =C2=B1 1%     +19.9%     178354 =C2=B1 2%  TOTAL slabinfo.kmallo=
c-64.active_objs

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

   3023001 =C2=B1 1%     -15.1%    2565273 =C2=B1 3%  brickland3/vm-scalabi=
lity/300s-lru-file-readonce
   3023001 =C2=B1 1%     -15.1%    2565273 =C2=B1 3%  TOTAL proc-vmstat.sla=
bs_scanned

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

     74702 =C2=B1 1%     +19.2%      89026 =C2=B1 2%  wsm/hackbench/1600%-p=
rocess-pipe
     74702 =C2=B1 1%     +19.2%      89026 =C2=B1 2%  TOTAL slabinfo.anon_v=
ma.active_objs

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

  14041931 =C2=B1 2%     -16.0%   11788641 =C2=B1 1%  wsm/hackbench/1600%-p=
rocess-pipe
  14041931 =C2=B1 2%     -16.0%   11788641 =C2=B1 1%  TOTAL proc-vmstat.pgf=
ault

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

   1742111 =C2=B1 4%     -16.9%    1447181 =C2=B1 5%  brickland1/aim7/6000-=
page_test
   1742111 =C2=B1 4%     -16.9%    1447181 =C2=B1 5%  TOTAL numa-meminfo.no=
de2.AnonPages

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

  15865125 =C2=B1 1%     -15.0%   13485882 =C2=B1 1%  brickland1/aim7/6000-=
page_test
  15865125 =C2=B1 1%     -15.0%   13485882 =C2=B1 1%  TOTAL softirqs.TIMER

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

   1923000 =C2=B1 4%     -16.4%    1608509 =C2=B1 5%  brickland1/aim7/6000-=
page_test
   1923000 =C2=B1 4%     -16.4%    1608509 =C2=B1 5%  TOTAL numa-meminfo.no=
de2.Active(anon)

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

   1943185 =C2=B1 4%     -16.2%    1629057 =C2=B1 5%  brickland1/aim7/6000-=
page_test
   1943185 =C2=B1 4%     -16.2%    1629057 =C2=B1 5%  TOTAL numa-meminfo.no=
de2.Active

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

 1.659e+08 =C2=B1 2%     -13.8%  1.429e+08 =C2=B1 1%  wsm/hackbench/1600%-p=
rocess-pipe
 1.659e+08 =C2=B1 2%     -13.8%  1.429e+08 =C2=B1 1%  TOTAL cpuidle.C6-NHM.=
time

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      2744 =C2=B1 1%     +16.7%       3202 =C2=B1 2%  wsm/hackbench/1600%-p=
rocess-pipe
      2744 =C2=B1 1%     +16.7%       3202 =C2=B1 2%  TOTAL slabinfo.vm_are=
a_struct.active_slabs

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      2744 =C2=B1 1%     +16.7%       3202 =C2=B1 2%  wsm/hackbench/1600%-p=
rocess-pipe
      2744 =C2=B1 1%     +16.7%       3202 =C2=B1 2%  TOTAL slabinfo.vm_are=
a_struct.num_slabs

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

    120778 =C2=B1 1%     +16.7%     140916 =C2=B1 2%  wsm/hackbench/1600%-p=
rocess-pipe
    120778 =C2=B1 1%     +16.7%     140916 =C2=B1 2%  TOTAL slabinfo.vm_are=
a_struct.num_objs

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      2107 =C2=B1 7%     +14.9%       2420 =C2=B1 8%  brickland3/vm-scalabi=
lity/300s-lru-file-readonce
      2107 =C2=B1 7%     +14.9%       2420 =C2=B1 8%  TOTAL proc-vmstat.com=
pact_success

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      2591 =C2=B1 1%     +16.0%       3007 =C2=B1 2%  wsm/hackbench/1600%-p=
rocess-pipe
      2591 =C2=B1 1%     +16.0%       3007 =C2=B1 2%  TOTAL slabinfo.kmallo=
c-64.active_slabs

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      2591 =C2=B1 1%     +16.0%       3007 =C2=B1 2%  wsm/hackbench/1600%-p=
rocess-pipe
      2591 =C2=B1 1%     +16.0%       3007 =C2=B1 2%  TOTAL slabinfo.kmallo=
c-64.num_slabs

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

    165897 =C2=B1 1%     +16.0%     192484 =C2=B1 2%  wsm/hackbench/1600%-p=
rocess-pipe
    165897 =C2=B1 1%     +16.0%     192484 =C2=B1 2%  TOTAL slabinfo.kmallo=
c-64.num_objs

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      4.40 =C2=B1 2%     +22.0%       5.37 =C2=B1 4%  brickland1/aim7/6000-=
page_test
      1.54 =C2=B1 2%     -12.0%       1.35 =C2=B1 3%  wsm/hackbench/1600%-p=
rocess-pipe
      5.94 =C2=B1 2%     +13.2%       6.73 =C2=B1 4%  TOTAL turbostat.%c6

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      1683 =C2=B1 5%     -11.0%       1497 =C2=B1 9%  brickland3/vm-scalabi=
lity/300s-lru-file-readonce
      1683 =C2=B1 5%     -11.0%       1497 =C2=B1 9%  TOTAL slabinfo.xfs_in=
ode.num_objs

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      1683 =C2=B1 5%     -11.0%       1497 =C2=B1 9%  brickland3/vm-scalabi=
lity/300s-lru-file-readonce
      1683 =C2=B1 5%     -11.0%       1497 =C2=B1 9%  TOTAL slabinfo.xfs_in=
ode.active_objs

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

       329 =C2=B1 1%     -13.3%        285 =C2=B1 0%  brickland1/aim7/6000-=
page_test
       329 =C2=B1 1%     -13.3%        285 =C2=B1 0%  TOTAL uptime.boot

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

     43214 =C2=B1 6%     -15.2%      36648 =C2=B1 4%  lkp-snb01/hackbench/1=
600%-process-pipe
     43214 =C2=B1 6%     -15.2%      36648 =C2=B1 4%  TOTAL numa-vmstat.nod=
e0.nr_page_table_pages

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

    175030 =C2=B1 7%     -16.1%     146779 =C2=B1 4%  lkp-snb01/hackbench/1=
600%-process-pipe
    175030 =C2=B1 7%     -16.1%     146779 =C2=B1 4%  TOTAL numa-meminfo.no=
de0.PageTables

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

     47374 =C2=B1 1%     -10.4%      42459 =C2=B1 4%  wsm/hackbench/1600%-p=
rocess-pipe
     47374 =C2=B1 1%     -10.4%      42459 =C2=B1 4%  TOTAL meminfo.DirectM=
ap4k

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

    205471 =C2=B1 7%     +18.5%     243577 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
    205471 =C2=B1 7%     +18.5%     243577 =C2=B1 3%  TOTAL cpuidle.C1E-SNB=
.usage

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

     86033 =C2=B1 1%     +14.0%      98061 =C2=B1 2%  wsm/hackbench/1600%-p=
rocess-pipe
     86033 =C2=B1 1%     +14.0%      98061 =C2=B1 2%  TOTAL slabinfo.anon_v=
ma.num_objs

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

     10692 =C2=B1 1%     -12.7%       9334 =C2=B1 3%  brickland3/vm-scalabi=
lity/300s-lru-file-readonce
     10692 =C2=B1 1%     -12.7%       9334 =C2=B1 3%  TOTAL proc-vmstat.pag=
eoutrun

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      1343 =C2=B1 1%     +14.0%       1531 =C2=B1 2%  wsm/hackbench/1600%-p=
rocess-pipe
      1343 =C2=B1 1%     +14.0%       1531 =C2=B1 2%  TOTAL slabinfo.anon_v=
ma.active_slabs

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      1343 =C2=B1 1%     +14.0%       1531 =C2=B1 2%  wsm/hackbench/1600%-p=
rocess-pipe
      1343 =C2=B1 1%     +14.0%       1531 =C2=B1 2%  TOTAL slabinfo.anon_v=
ma.num_slabs

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

     18554 =C2=B1 0%      -9.2%      16845 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
      4687 =C2=B1 1%     +19.1%       5582 =C2=B1 2%  wsm/hackbench/1600%-p=
rocess-pipe
     23241 =C2=B1 0%      -3.5%      22427 =C2=B1 1%  TOTAL slabinfo.mm_str=
uct.active_objs

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      8281 =C2=B1 0%     -14.7%       7062 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
      3737 =C2=B1 0%      -9.8%       3371 =C2=B1 1%  wsm/hackbench/1600%-p=
rocess-pipe
     12018 =C2=B1 0%     -13.2%      10433 =C2=B1 1%  TOTAL vmstat.procs.r

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

     26179 =C2=B1 0%     -10.1%      23527 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
      5556 =C2=B1 1%     +16.6%       6479 =C2=B1 2%  wsm/hackbench/1600%-p=
rocess-pipe
     31736 =C2=B1 0%      -5.4%      30006 =C2=B1 1%  TOTAL slabinfo.files_=
cache.active_objs

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      3077 =C2=B1 1%     +14.5%       3523 =C2=B1 0%  brickland1/aim7/6000-=
page_test
    181562 =C2=B1 3%     +13.5%     206096 =C2=B1 5%  brickland3/vm-scalabi=
lity/300s-lru-file-readonce
    184639 =C2=B1 3%     +13.5%     209619 =C2=B1 5%  TOTAL proc-vmstat.pga=
ctivate

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      6012 =C2=B1 1%     +13.1%       6797 =C2=B1 1%  wsm/hackbench/1600%-p=
rocess-pipe
      6012 =C2=B1 1%     +13.1%       6797 =C2=B1 1%  TOTAL slabinfo.mm_str=
uct.num_objs

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

     13158 =C2=B113%     -14.4%      11261 =C2=B1 4%  brickland1/aim7/6000-=
page_test
     13158 =C2=B113%     -14.4%      11261 =C2=B1 4%  TOTAL numa-meminfo.no=
de3.SReclaimable

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      3289 =C2=B113%     -14.4%       2815 =C2=B1 4%  brickland1/aim7/6000-=
page_test
      3289 =C2=B113%     -14.4%       2815 =C2=B1 4%  TOTAL numa-vmstat.nod=
e3.nr_slab_reclaimable

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      6722 =C2=B1 1%     +12.5%       7562 =C2=B1 2%  wsm/hackbench/1600%-p=
rocess-pipe
      6722 =C2=B1 1%     +12.5%       7562 =C2=B1 2%  TOTAL slabinfo.files_=
cache.num_objs

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      9663 =C2=B1 0%     -11.6%       8546 =C2=B1 2%  brickland3/vm-scalabi=
lity/300s-lru-file-readonce
      9663 =C2=B1 0%     -11.6%       8546 =C2=B1 2%  TOTAL proc-vmstat.ksw=
apd_low_wmark_hit_quickly

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

     60059 =C2=B1 5%     +12.2%      67416 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
     60059 =C2=B1 5%     +12.2%      67416 =C2=B1 3%  TOTAL cpuidle.C7-SNB.=
usage

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      2815 =C2=B1 3%      -8.3%       2581 =C2=B1 6%  brickland3/vm-scalabi=
lity/300s-lru-file-readonce
      2815 =C2=B1 3%      -8.3%       2581 =C2=B1 6%  TOTAL slabinfo.buffer=
_head.active_objs

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

   4529818 =C2=B1 1%      -8.8%    4129398 =C2=B1 1%  brickland1/aim7/6000-=
page_test
    237630 =C2=B1 0%     -13.1%     206405 =C2=B1 0%  brickland3/vm-scalabi=
lity/300s-lru-file-readonce
 8.785e+08 =C2=B1 1%     +51.3%  1.329e+09 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
  89463167 =C2=B1 9%    +250.9%   3.14e+08 =C2=B1 1%  wsm/hackbench/1600%-p=
rocess-pipe
 9.727e+08 =C2=B1 2%     +69.3%  1.647e+09 =C2=B1 1%  TOTAL time.involuntar=
y_context_switches

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

      2175 =C2=B1 1%      -8.8%       1984 =C2=B1 0%  brickland3/vm-scalabi=
lity/300s-lru-file-readonce
     23054 =C2=B1 1%     +12.2%      25876 =C2=B1 0%  lkp-nex04/pigz/100%-1=
28K
   4619649 =C2=B1 0%     +30.1%    6008008 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
    529899 =C2=B1 5%    +167.6%    1418080 =C2=B1 0%  wsm/hackbench/1600%-p=
rocess-pipe
   5174778 =C2=B1 1%     +44.0%    7453950 =C2=B1 2%  TOTAL vmstat.system.cs

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

   3150464 =C2=B1 2%     -24.2%    2387551 =C2=B1 3%  brickland1/aim7/6000-=
page_test
   3890218 =C2=B1 1%      +7.6%    4184429 =C2=B1 0%  lkp-nex04/pigz/100%-1=
28K
 1.926e+09 =C2=B1 1%     +21.0%  2.331e+09 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
 2.322e+08 =C2=B1 3%    +136.4%  5.489e+08 =C2=B1 0%  wsm/hackbench/1600%-p=
rocess-pipe
 2.166e+09 =C2=B1 1%     +33.3%  2.887e+09 =C2=B1 1%  TOTAL time.voluntary_=
context_switches

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

   1067968 =C2=B1 1%     -36.5%     677985 =C2=B1 4%  lkp-snb01/hackbench/1=
600%-process-pipe
    231933 =C2=B1 0%      -1.2%     229082 =C2=B1 0%  nhm4/ebizzy/200%-100x=
-10s
     16014 =C2=B1 1%     +59.3%      25511 =C2=B1 0%  wsm/hackbench/1600%-p=
rocess-pipe
   1315917 =C2=B1 0%     -29.1%     932579 =C2=B1 2%  TOTAL vmstat.system.in

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

       281 =C2=B1 1%     -15.1%        238 =C2=B1 0%  brickland1/aim7/6000-=
page_test
       281 =C2=B1 1%     -15.1%        238 =C2=B1 0%  TOTAL time.elapsed_ti=
me

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

     29294 =C2=B1 1%     -14.3%      25093 =C2=B1 0%  brickland1/aim7/6000-=
page_test
     33619 =C2=B1 0%      +1.2%      34032 =C2=B1 0%  brickland3/vm-scalabi=
lity/300s-lru-file-readonce
     62914 =C2=B1 0%      -6.0%      59125 =C2=B1 0%  TOTAL time.system_time

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

  18258004 =C2=B1 1%      -3.8%   17557683 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
 3.104e+09 =C2=B1 0%      -1.0%  3.073e+09 =C2=B1 0%  nhm4/ebizzy/200%-100x=
-10s
  13852545 =C2=B1 2%     -16.7%   11538015 =C2=B1 1%  wsm/hackbench/1600%-p=
rocess-pipe
 3.137e+09 =C2=B1 0%      -1.1%  3.103e+09 =C2=B1 0%  TOTAL time.minor_page=
_faults

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

     18531 =C2=B1 0%      -1.8%      18206 =C2=B1 0%  lkp-nex04/pigz/100%-1=
28K
      1388 =C2=B1 0%     +11.2%       1543 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
      2718 =C2=B1 0%      -1.5%       2678 =C2=B1 0%  nhm4/ebizzy/200%-100x=
-10s
     22638 =C2=B1 0%      -0.9%      22428 =C2=B1 0%  TOTAL time.user_time

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

           =C2=B1 1%      -3.4%            =C2=B1 0%  brickland1/aim7/6000-=
page_test
           =C2=B1 1%      -3.4%            =C2=B1 0%  TOTAL turbostat.RAM_W

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

           =C2=B1 0%      +1.8%            =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
           =C2=B1 0%      +1.8%            =C2=B1 0%  TOTAL turbostat.Cor_W

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

     10655 =C2=B1 0%      +1.4%      10802 =C2=B1 0%  brickland1/aim7/6000-=
page_test
      8224 =C2=B1 0%      +1.4%       8341 =C2=B1 0%  brickland3/vm-scalabi=
lity/300s-lru-file-readonce
      6230 =C2=B1 0%      -1.7%       6125 =C2=B1 0%  lkp-nex04/pigz/100%-1=
28K
     25110 =C2=B1 0%      +0.6%      25269 =C2=B1 0%  TOTAL time.percent_of=
_cpu_this_job_got

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

     72.35 =C2=B1 0%      +1.2%      73.20 =C2=B1 0%  brickland3/vm-scalabi=
lity/300s-lru-file-readonce
     97.29 =C2=B1 0%      -1.6%      95.71 =C2=B1 0%  lkp-nex04/pigz/100%-1=
28K
    169.63 =C2=B1 0%      -0.4%     168.91 =C2=B1 0%  TOTAL turbostat.%c0

107437febd495a5  143e1e28cb40bed836b0a0656  =

---------------  -------------------------  =

           =C2=B1 0%      +1.2%            =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
           =C2=B1 0%      +1.2%            =C2=B1 0%  TOTAL turbostat.Pkg_W


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.

Thanks,
Fengguang

--===============2573777920944538327==--

