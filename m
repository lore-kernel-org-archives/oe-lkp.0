Content-Type: multipart/mixed; boundary="===============8263237157070261512=="
MIME-Version: 1.0
From: kernel test robot <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [sched] b4c544523de: +39.4% aim7.jobs-per-min
Date: Tue, 12 Aug 2014 11:25:53 +0800
Message-ID: <20140812032553.GB11210@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8263237157070261512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://bee.sh.intel.com/git/ydu19/linux rewrite-v5-on-3.16-rc7
commit b4c544523de83af5352494cd887ae817d402328f ("sched: Remove task and gr=
oup entity load_avg when they are dead")

40c5e72463e4265  b4c544523de83af5352494cd8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     %stddev        %change               %stddev
            \          |                 /
     25427 =C2=B1 1%     +39.4%      35437 =C2=B1 1%  brickland3/aim7/2000-=
fork_test
     25427 =C2=B1 1%     +39.4%      35437 =C2=B1 1%  TOTAL aim7.jobs-per-m=
in

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

    252931 =C2=B1 0%      -4.9%     240600 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
    252931 =C2=B1 0%      -4.9%     240600 =C2=B1 0%  TOTAL hackbench.throu=
ghput

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

       161 =C2=B1 0%      -3.7%        155 =C2=B1 1%  lkp-nex04/ebizzy/200%=
-100x-10s
       161 =C2=B1 0%      -3.7%        155 =C2=B1 1%  TOTAL ebizzy.throughp=
ut.per_thread.max

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

    140362 =C2=B1 0%      +2.7%     144164 =C2=B1 2%  lkp-sb03/nepim/300s-1=
00%-udp
    140362 =C2=B1 0%      +2.7%     144164 =C2=B1 2%  TOTAL nepim.udp.avg.k=
bps_in

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      4283 =C2=B1 0%      +2.7%       4399 =C2=B1 2%  lkp-sb03/nepim/300s-1=
00%-udp
      4283 =C2=B1 0%      +2.7%       4399 =C2=B1 2%  TOTAL nepim.udp.avg.r=
cv_s

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     39.79 =C2=B1 0%      -1.7%      39.10 =C2=B1 0%  lkp-nex04/ebizzy/200%=
-100x-10s
     39.79 =C2=B1 0%      -1.7%      39.10 =C2=B1 0%  TOTAL ebizzy.time.user

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

   1458047 =C2=B1 8%     -82.0%     262005 =C2=B1 7%  brickland3/aim7/2000-=
fork_test
   1458047 =C2=B1 8%     -82.0%     262005 =C2=B1 7%  TOTAL cpuidle.C3-IVT-=
4S.usage

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

 4.942e+08 =C2=B1 7%     -84.0%   78882584 =C2=B110%  brickland3/aim7/2000-=
fork_test
 4.942e+08 =C2=B1 7%     -84.0%   78882584 =C2=B110%  TOTAL cpuidle.C3-IVT-=
4S.time

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

    819952 =C2=B1 9%     -79.9%     164681 =C2=B1 7%  brickland3/aim7/2000-=
fork_test
    819952 =C2=B1 9%     -79.9%     164681 =C2=B1 7%  TOTAL cpuidle.C1E-IVT=
-4S.usage

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

         0           +Inf%          0 =C2=B1141%  brickland3/aim7/3000-disk=
_cp
         0           +Inf%          0 =C2=B1141%  TOTAL last_state.is_incom=
plete_run

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

 2.187e+08 =C2=B1 9%     -82.5%   38378762 =C2=B110%  brickland3/aim7/2000-=
fork_test
 2.187e+08 =C2=B1 9%     -82.5%   38378762 =C2=B110%  TOTAL cpuidle.C1E-IVT=
-4S.time

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      0.84 =C2=B1 6%     -78.2%       0.18 =C2=B110%  brickland3/aim7/2000-=
fork_test
      0.84 =C2=B1 6%     -78.2%       0.18 =C2=B110%  TOTAL turbostat.%c3

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

       310 =C2=B1 0%    +341.4%       1368 =C2=B1 1%  brickland3/aim7/2000-=
fork_test
       310 =C2=B1 0%    +341.4%       1368 =C2=B1 1%  TOTAL slabinfo.kmallo=
c-32.active_slabs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

       310 =C2=B1 0%    +341.4%       1368 =C2=B1 1%  brickland3/aim7/2000-=
fork_test
       310 =C2=B1 0%    +341.4%       1368 =C2=B1 1%  TOTAL slabinfo.kmallo=
c-32.num_slabs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     39735 =C2=B1 0%    +340.9%     175194 =C2=B1 1%  brickland3/aim7/2000-=
fork_test
     39735 =C2=B1 0%    +340.9%     175194 =C2=B1 1%  TOTAL slabinfo.kmallo=
c-32.num_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     39717 =C2=B1 0%    +338.9%     174305 =C2=B1 1%  brickland3/aim7/2000-=
fork_test
     39717 =C2=B1 0%    +338.9%     174305 =C2=B1 1%  TOTAL slabinfo.kmallo=
c-32.active_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      4954 =C2=B139%     -70.6%       1454 =C2=B134%  brickland3/aim7/2000-=
fork_test
      4954 =C2=B139%     -70.6%       1454 =C2=B134%  TOTAL cpuidle.POLL.ti=
me

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      1.38 =C2=B115%   +1385.6%      20.44 =C2=B1 5%  brickland3/aim7/2000-=
fork_test
      1.38 =C2=B115%   +1385.6%      20.44 =C2=B1 5%  TOTAL turbostat.%pc2

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

       423 =C2=B121%    +204.4%       1287 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
       423 =C2=B121%    +204.4%       1287 =C2=B1 0%  TOTAL slabinfo.kmallo=
c-128.num_slabs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

       423 =C2=B121%    +204.4%       1287 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
       423 =C2=B121%    +204.4%       1287 =C2=B1 0%  TOTAL slabinfo.kmallo=
c-128.active_slabs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

        58 =C2=B118%     -63.0%         21 =C2=B117%  brickland3/aim7/2000-=
fork_test
         2 =C2=B142%    +208.3%          7 =C2=B134%  lkp-nex04/ebizzy/200%=
-100x-10s
       319 =C2=B112%     -36.1%        203 =C2=B117%  lkp-snb01/hackbench/1=
600%-process-pipe
       379 =C2=B113%     -38.7%        232 =C2=B118%  TOTAL cpuidle.POLL.us=
age

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

         6 =C2=B144%    +120.6%         15 =C2=B128%  brickland3/aim7/2000-=
fork_test
         8 =C2=B115%    +150.0%         22 =C2=B113%  lkp-nex04/ebizzy/200%=
-100x-10s
         4 =C2=B126%     +78.6%          8 =C2=B120%  lkp-sb03/nepim/300s-1=
00%-tcp6
        20 =C2=B127%    +123.7%         45 =C2=B119%  TOTAL numa-numastat.n=
ode0.other_node

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

  51058131 =C2=B1 2%     -61.9%   19460820 =C2=B1 4%  brickland3/aim7/2000-=
fork_test
  51058131 =C2=B1 2%     -61.9%   19460820 =C2=B1 4%  TOTAL cpuidle.C6-IVT-=
4S.usage

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     47.76 =C2=B1 1%     -57.0%      20.53 =C2=B1 2%  brickland3/aim7/2000-=
fork_test
     47.76 =C2=B1 1%     -57.0%      20.53 =C2=B1 2%  TOTAL turbostat.%c1

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      4918 =C2=B120%     -42.8%       2813 =C2=B127%  brickland3/aim7/2000-=
fork_test
      4918 =C2=B120%     -42.8%       2813 =C2=B127%  TOTAL numa-vmstat.nod=
e2.nr_kernel_stack

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

         5 =C2=B118%    +196.4%         16 =C2=B122%  brickland3/aim7/2000-=
fork_test
        16 =C2=B122%     +70.7%         28 =C2=B130%  lkp-nex04/ebizzy/200%=
-100x-10s
        22 =C2=B121%    +102.7%         44 =C2=B127%  TOTAL numa-numastat.n=
ode2.other_node

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     27106 =C2=B121%    +204.2%      82458 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
      9357 =C2=B1 2%      +9.6%      10254 =C2=B1 2%  lkp-nex04/ebizzy/200%=
-100x-10s
     36463 =C2=B116%    +154.3%      92713 =C2=B1 0%  TOTAL slabinfo.kmallo=
c-128.num_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     27105 =C2=B121%    +202.5%      82004 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
      9341 =C2=B1 2%      +9.6%      10238 =C2=B1 2%  lkp-nex04/ebizzy/200%=
-100x-10s
     36446 =C2=B116%    +153.1%      92243 =C2=B1 0%  TOTAL slabinfo.kmallo=
c-128.active_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

         7 =C2=B123%    +114.3%         15 =C2=B119%  brickland3/aim7/2000-=
fork_test
         9 =C2=B113%    +149.0%         24 =C2=B115%  lkp-nex04/ebizzy/200%=
-100x-10s
        68 =C2=B111%     +20.9%         83 =C2=B117%  lkp-sb03/nepim/300s-1=
00%-tcp6
         3 =C2=B146%    +127.3%          8 =C2=B140%  lkp-sb03/nuttcp/300s
        89 =C2=B114%     +46.7%        130 =C2=B119%  TOTAL numa-numastat.n=
ode1.other_node

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

         9 =C2=B142%    +102.1%         19 =C2=B1 9%  brickland3/aim7/2000-=
fork_test
        18 =C2=B126%    +107.7%         37 =C2=B110%  lkp-nex04/ebizzy/200%=
-100x-10s
        27 =C2=B132%    +105.8%         56 =C2=B110%  TOTAL numa-numastat.n=
ode3.other_node

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

   1292453 =C2=B124%     +37.5%    1777049 =C2=B119%  lkp-snb01/hackbench/1=
600%-process-pipe
   1292453 =C2=B124%     +37.5%    1777049 =C2=B119%  TOTAL cpuidle.C3-SNB.=
time

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     30.67 =C2=B1 5%     +94.6%      59.69 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
     30.67 =C2=B1 5%     +94.6%      59.69 =C2=B1 0%  TOTAL turbostat.%c6

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

  48169832 =C2=B115%     +30.8%   63029476 =C2=B118%  lkp-sb03/nepim/300s-1=
00%-tcp
  27803449 =C2=B119%     -62.7%   10361010 =C2=B130%  lkp-sb03/nepim/300s-1=
00%-udp6
  75973282 =C2=B116%      -3.4%   73390487 =C2=B119%  TOTAL cpuidle.C1E-SNB=
.time

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

    150844 =C2=B1 8%     -47.2%      79651 =C2=B1 3%  brickland3/aim7/2000-=
fork_test
    150844 =C2=B1 8%     -47.2%      79651 =C2=B1 3%  TOTAL softirqs.HRTIMER

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

   4585248 =C2=B1 4%     +46.3%    6709518 =C2=B1 9%  brickland3/aim7/2000-=
fork_test
   1635063 =C2=B118%     +86.7%    3053250 =C2=B112%  lkp-sb03/nepim/300s-1=
00%-tcp6
   6220311 =C2=B1 8%     +56.9%    9762768 =C2=B110%  TOTAL proc-vmstat.pga=
lloc_dma32

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

       133 =C2=B114%     +61.2%        214 =C2=B116%  lkp-sb03/nuttcp/300s
       133 =C2=B114%     +61.2%        214 =C2=B116%  TOTAL numa-vmstat.nod=
e0.numa_other

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

   1569291 =C2=B110%     +88.4%    2955799 =C2=B120%  lkp-nex04/ebizzy/200%=
-100x-10s
   1569291 =C2=B110%     +88.4%    2955799 =C2=B120%  TOTAL cpuidle.C1E-NHM=
.time

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     79085 =C2=B120%     -42.7%      45280 =C2=B127%  brickland3/aim7/2000-=
fork_test
      1990 =C2=B1 6%     +14.2%       2273 =C2=B1 4%  lkp-nex04/ebizzy/200%=
-100x-10s
     81076 =C2=B119%     -41.3%      47553 =C2=B126%  TOTAL numa-meminfo.no=
de2.KernelStack

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

    101864 =C2=B121%     -22.8%      78601 =C2=B125%  brickland3/aim7/2000-=
fork_test
    101864 =C2=B121%     -22.8%      78601 =C2=B125%  TOTAL numa-meminfo.no=
de2.SUnreclaim

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      3010 =C2=B124%     +53.3%       4614 =C2=B111%  lkp-sb03/nepim/300s-1=
00%-tcp
      2503 =C2=B128%     +79.8%       4499 =C2=B112%  lkp-sb03/nepim/300s-1=
00%-udp
      5513 =C2=B126%     +65.3%       9113 =C2=B111%  TOTAL numa-vmstat.nod=
e1.nr_active_anon

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     12049 =C2=B124%     +53.2%      18459 =C2=B111%  lkp-sb03/nepim/300s-1=
00%-tcp
     10009 =C2=B128%     +79.8%      17999 =C2=B112%  lkp-sb03/nepim/300s-1=
00%-udp
     22059 =C2=B126%     +65.3%      36458 =C2=B111%  TOTAL numa-meminfo.no=
de1.Active(anon)

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     25434 =C2=B121%     -22.8%      19630 =C2=B125%  brickland3/aim7/2000-=
fork_test
     25434 =C2=B121%     -22.8%      19630 =C2=B125%  TOTAL numa-vmstat.nod=
e2.nr_slab_unreclaimable

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      3002 =C2=B125%     +53.4%       4604 =C2=B111%  lkp-sb03/nepim/300s-1=
00%-tcp
      2451 =C2=B128%     +80.5%       4426 =C2=B111%  lkp-sb03/nepim/300s-1=
00%-udp
      5453 =C2=B126%     +65.6%       9030 =C2=B111%  TOTAL numa-vmstat.nod=
e1.nr_anon_pages

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     12018 =C2=B125%     +53.3%      18420 =C2=B111%  lkp-sb03/nepim/300s-1=
00%-tcp
      9804 =C2=B128%     +80.6%      17704 =C2=B111%  lkp-sb03/nepim/300s-1=
00%-udp
     21822 =C2=B126%     +65.5%      36124 =C2=B111%  TOTAL numa-meminfo.no=
de1.AnonPages

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

   3521565 =C2=B1 1%     -39.4%    2135724 =C2=B1 1%  brickland3/aim7/2000-=
fork_test
   3521565 =C2=B1 1%     -39.4%    2135724 =C2=B1 1%  TOTAL softirqs.RCU

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

    115981 =C2=B118%     -20.8%      91822 =C2=B122%  brickland3/aim7/2000-=
fork_test
    115981 =C2=B118%     -20.8%      91822 =C2=B122%  TOTAL numa-meminfo.no=
de2.Slab

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

 1.445e+08 =C2=B1 5%     +29.6%  1.873e+08 =C2=B1 8%  brickland3/aim7/2000-=
fork_test
   2580604 =C2=B116%     +72.1%    4441636 =C2=B111%  lkp-sb03/nepim/300s-1=
00%-tcp6
 1.471e+08 =C2=B1 5%     +30.4%  1.917e+08 =C2=B1 8%  TOTAL numa-numastat.n=
ode0.numa_hit

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

 1.445e+08 =C2=B1 5%     +29.6%  1.873e+08 =C2=B1 8%  brickland3/aim7/2000-=
fork_test
   2580599 =C2=B116%     +72.1%    4441628 =C2=B111%  lkp-sb03/nepim/300s-1=
00%-tcp6
 1.471e+08 =C2=B1 5%     +30.4%  1.917e+08 =C2=B1 8%  TOTAL numa-numastat.n=
ode0.local_node

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      1.03 =C2=B1 7%     +63.8%       1.68 =C2=B117%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.03 =C2=B1 7%     +63.8%       1.68 =C2=B117%  TOTAL turbostat.%c7

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

       159 =C2=B1 7%     -32.1%        108 =C2=B113%  brickland3/aim7/2000-=
fork_test
       159 =C2=B1 7%     -32.1%        108 =C2=B113%  TOTAL vmstat.procs.r

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     16544 =C2=B118%     -39.3%      10040 =C2=B122%  lkp-sb03/nepim/300s-1=
00%-tcp
     18399 =C2=B115%     -42.0%      10670 =C2=B117%  lkp-sb03/nepim/300s-1=
00%-udp
     34943 =C2=B116%     -40.7%      20710 =C2=B119%  TOTAL numa-meminfo.no=
de0.AnonPages

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     16580 =C2=B119%     -37.6%      10346 =C2=B120%  lkp-sb03/nepim/300s-1=
00%-tcp
     18543 =C2=B115%     -42.1%      10735 =C2=B118%  lkp-sb03/nepim/300s-1=
00%-udp
     35123 =C2=B117%     -40.0%      21082 =C2=B119%  TOTAL numa-meminfo.no=
de0.Active(anon)

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      1345 =C2=B113%     +36.7%       1839 =C2=B114%  lkp-nex04/ebizzy/200%=
-100x-10s
      1345 =C2=B113%     +36.7%       1839 =C2=B114%  TOTAL cpuidle.C1E-NHM=
.usage

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      4139 =C2=B118%     -39.2%       2515 =C2=B122%  lkp-sb03/nepim/300s-1=
00%-tcp
      4601 =C2=B115%     -41.9%       2674 =C2=B117%  lkp-sb03/nepim/300s-1=
00%-udp
      8741 =C2=B116%     -40.6%       5189 =C2=B119%  TOTAL numa-vmstat.nod=
e0.nr_anon_pages

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      4146 =C2=B119%     -37.5%       2592 =C2=B120%  lkp-sb03/nepim/300s-1=
00%-tcp
      4635 =C2=B115%     -41.9%       2692 =C2=B118%  lkp-sb03/nepim/300s-1=
00%-udp
      8782 =C2=B117%     -39.8%       5284 =C2=B119%  TOTAL numa-vmstat.nod=
e0.nr_active_anon

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

  70855193 =C2=B1 5%     +28.9%   91346168 =C2=B1 8%  brickland3/aim7/2000-=
fork_test
   1319918 =C2=B112%     +69.5%    2236926 =C2=B118%  lkp-sb03/nepim/300s-1=
00%-tcp6
  72175111 =C2=B1 5%     +29.7%   93583095 =C2=B1 8%  TOTAL numa-vmstat.nod=
e0.numa_local

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

  70857192 =C2=B1 5%     +28.9%   91348028 =C2=B1 8%  brickland3/aim7/2000-=
fork_test
   1320126 =C2=B112%     +69.5%    2237098 =C2=B118%  lkp-sb03/nepim/300s-1=
00%-tcp6
  72177319 =C2=B1 5%     +29.7%   93585126 =C2=B1 8%  TOTAL numa-vmstat.nod=
e0.numa_hit

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

       236 =C2=B1 9%     -18.6%        192 =C2=B110%  lkp-sb03/nuttcp/300s
      1421 =C2=B111%     +68.5%       2395 =C2=B116%  lkp-snb01/hackbench/1=
600%-process-pipe
      1657 =C2=B111%     +56.1%       2587 =C2=B116%  TOTAL cpuidle.C3-SNB.=
usage

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

 4.224e+10 =C2=B1 2%     -28.8%  3.006e+10 =C2=B1 1%  brickland3/aim7/2000-=
fork_test
 4.224e+10 =C2=B1 2%     -28.8%  3.006e+10 =C2=B1 1%  TOTAL cpuidle.C6-IVT-=
4S.time

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      1.60 =C2=B1 6%     -28.4%       1.14 =C2=B123%  xps2/pigz/100%-512K
      1.60 =C2=B1 6%     -28.4%       1.14 =C2=B123%  TOTAL perf-profile.cp=
u-cycles.irq_entries_start

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     77675 =C2=B1 7%     -28.6%      55444 =C2=B1 3%  lkp-sb03/nepim/300s-1=
00%-tcp
     71437 =C2=B1 8%     -24.5%      53943 =C2=B114%  lkp-sb03/nepim/300s-1=
00%-tcp6
     73415 =C2=B1 9%     -18.9%      59530 =C2=B113%  lkp-sb03/nepim/300s-1=
00%-udp
     78582 =C2=B111%     -26.3%      57888 =C2=B110%  lkp-sb03/nepim/300s-1=
00%-udp6
     87871 =C2=B1 4%     -32.3%      59457 =C2=B111%  lkp-sb03/nuttcp/300s
    388981 =C2=B1 8%     -26.4%     286262 =C2=B110%  TOTAL meminfo.Committ=
ed_AS

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

    267915 =C2=B1 1%     -25.6%     199232 =C2=B1 3%  brickland3/aim7/2000-=
fork_test
    267915 =C2=B1 1%     -25.6%     199232 =C2=B1 3%  TOTAL meminfo.KernelS=
tack

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     16660 =C2=B1 1%     -24.1%      12637 =C2=B1 3%  brickland3/aim7/2000-=
fork_test
     16660 =C2=B1 1%     -24.1%      12637 =C2=B1 3%  TOTAL proc-vmstat.nr_=
kernel_stack

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

       532 =C2=B1 1%     -25.1%        399 =C2=B1 1%  brickland3/aim7/2000-=
fork_test
       532 =C2=B1 1%     -25.1%        399 =C2=B1 1%  TOTAL uptime.boot

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      7818 =C2=B1 7%     +35.1%      10564 =C2=B110%  lkp-sb03/nepim/300s-1=
00%-udp
   7081268 =C2=B1 9%     -22.3%    5501732 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
   7089086 =C2=B1 9%     -22.2%    5512297 =C2=B1 2%  TOTAL cpuidle.C1-SNB.=
usage

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     14167 =C2=B1 5%     -20.8%      11225 =C2=B110%  brickland3/aim7/2000-=
fork_test
     14167 =C2=B1 5%     -20.8%      11225 =C2=B110%  TOTAL numa-vmstat.nod=
e2.nr_anon_pages

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

       490 =C2=B1 6%     -21.7%        384 =C2=B113%  lkp-sb03/nepim/300s-1=
00%-tcp
       490 =C2=B1 6%     -21.7%        384 =C2=B113%  TOTAL slabinfo.kmem_c=
ache.active_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

       490 =C2=B1 6%     -21.7%        384 =C2=B113%  lkp-sb03/nepim/300s-1=
00%-tcp
       490 =C2=B1 6%     -21.7%        384 =C2=B113%  TOTAL slabinfo.kmem_c=
ache.num_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     56795 =C2=B1 5%     -20.8%      45000 =C2=B110%  brickland3/aim7/2000-=
fork_test
     56795 =C2=B1 5%     -20.8%      45000 =C2=B110%  TOTAL numa-meminfo.no=
de2.AnonPages

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     11625 =C2=B1 9%     -22.9%       8963 =C2=B113%  xps2/pigz/100%-512K
     11625 =C2=B1 9%     -22.9%       8963 =C2=B113%  TOTAL meminfo.AnonHug=
ePages

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      1375 =C2=B118%     +34.2%       1845 =C2=B123%  lkp-sb03/nepim/300s-1=
00%-udp
      3294 =C2=B110%     -37.9%       2045 =C2=B132%  lkp-sb03/nepim/300s-1=
00%-udp6
      1429 =C2=B110%     +31.4%       1877 =C2=B111%  lkp-sb03/nuttcp/300s
      6099 =C2=B112%      -5.4%       5769 =C2=B122%  TOTAL cpuidle.C1E-SNB=
.usage

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

   5561322 =C2=B1 2%     -22.0%    4338778 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
   5561322 =C2=B1 2%     -22.0%    4338778 =C2=B1 0%  TOTAL softirqs.TIMER

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

 4.263e+08 =C2=B1 4%     +31.0%  5.583e+08 =C2=B113%  lkp-snb01/hackbench/1=
600%-process-pipe
 4.263e+08 =C2=B1 4%     +31.0%  5.583e+08 =C2=B113%  TOTAL cpuidle.C7-SNB.=
time

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

   1324898 =C2=B1 9%      -9.7%    1195847 =C2=B1 9%  brickland3/aim7/2000-=
fork_test
   1324898 =C2=B1 9%      -9.7%    1195847 =C2=B1 9%  TOTAL numa-meminfo.no=
de2.MemUsed

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     39398 =C2=B1 1%     -20.4%      31375 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
     39398 =C2=B1 1%     -20.4%      31375 =C2=B1 0%  TOTAL slabinfo.files_=
cache.num_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

       772 =C2=B1 1%     -20.4%        614 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
       772 =C2=B1 1%     -20.4%        614 =C2=B1 0%  TOTAL slabinfo.files_=
cache.num_slabs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

       772 =C2=B1 1%     -20.4%        614 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
       772 =C2=B1 1%     -20.4%        614 =C2=B1 0%  TOTAL slabinfo.files_=
cache.active_slabs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     38955 =C2=B1 1%     -20.3%      31028 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
     38955 =C2=B1 1%     -20.3%      31028 =C2=B1 0%  TOTAL slabinfo.files_=
cache.active_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

       600 =C2=B1 5%     -17.8%        494 =C2=B110%  lkp-sb03/nepim/300s-1=
00%-tcp
       600 =C2=B1 5%     -17.8%        494 =C2=B110%  TOTAL slabinfo.kmem_c=
ache_node.active_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     54546 =C2=B1 2%     -25.5%      40635 =C2=B1 1%  brickland3/aim7/2000-=
fork_test
       193 =C2=B1 6%     +13.4%        219 =C2=B111%  xps2/pigz/100%-128K
     54740 =C2=B1 2%     -25.4%      40854 =C2=B1 1%  TOTAL uptime.idle

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

    161106 =C2=B1 2%     -18.8%     130865 =C2=B1 1%  lkp-nex04/ebizzy/200%=
-100x-10s
    161106 =C2=B1 2%     -18.8%     130865 =C2=B1 1%  TOTAL cpuidle.C3-NHM.=
usage

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

       618 =C2=B1 4%     -17.2%        512 =C2=B110%  lkp-sb03/nepim/300s-1=
00%-tcp
       618 =C2=B1 4%     -17.2%        512 =C2=B110%  TOTAL slabinfo.kmem_c=
ache_node.num_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      8904 =C2=B1 8%     +24.2%      11062 =C2=B1 9%  lkp-nex04/ebizzy/200%=
-100x-10s
      8904 =C2=B1 8%     +24.2%      11062 =C2=B1 9%  TOTAL cpuidle.C1-NHM.=
usage

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      1.51 =C2=B110%     +16.7%       1.77 =C2=B1 7%  xps2/pigz/100%-128K
      1.51 =C2=B110%     +16.7%       1.77 =C2=B1 7%  TOTAL perf-profile.cp=
u-cycles.task_tick_fair.scheduler_tick.update_process_times.tick_sched_hand=
le.tick_sched_timer

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      7336 =C2=B1 3%     +18.1%       8666 =C2=B1 9%  lkp-snb01/hackbench/1=
600%-process-pipe
      7336 =C2=B1 3%     +18.1%       8666 =C2=B1 9%  TOTAL slabinfo.proc_i=
node_cache.num_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

 2.264e+09 =C2=B1 6%     +16.7%  2.643e+09 =C2=B1 4%  brickland3/aim7/2000-=
fork_test
 2.264e+09 =C2=B1 6%     +16.7%  2.643e+09 =C2=B1 4%  TOTAL cpuidle.C1-IVT-=
4S.time

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      2613 =C2=B1 3%     +14.2%       2983 =C2=B1 5%  lkp-nex04/ebizzy/200%=
-100x-10s
      2613 =C2=B1 3%     +14.2%       2983 =C2=B1 5%  TOTAL numa-vmstat.nod=
e2.nr_slab_reclaimable

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     10454 =C2=B1 3%     +14.2%      11935 =C2=B1 5%  lkp-nex04/ebizzy/200%=
-100x-10s
     10454 =C2=B1 3%     +14.2%      11935 =C2=B1 5%  TOTAL numa-meminfo.no=
de2.SReclaimable

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

       750 =C2=B1 2%     -13.0%        652 =C2=B1 6%  lkp-sb03/nepim/300s-1=
00%-tcp
       750 =C2=B1 2%     -13.0%        652 =C2=B1 6%  TOTAL slabinfo.kmallo=
c-64.num_slabs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

       750 =C2=B1 2%     -13.0%        652 =C2=B1 6%  lkp-sb03/nepim/300s-1=
00%-tcp
       750 =C2=B1 2%     -13.0%        652 =C2=B1 6%  TOTAL slabinfo.kmallo=
c-64.active_slabs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

    211895 =C2=B1 1%     -14.9%     180253 =C2=B1 1%  brickland3/aim7/2000-=
fork_test
    211895 =C2=B1 1%     -14.9%     180253 =C2=B1 1%  TOTAL meminfo.AnonPag=
es

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     52880 =C2=B1 1%     -14.9%      45017 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
     52880 =C2=B1 1%     -14.9%      45017 =C2=B1 0%  TOTAL proc-vmstat.nr_=
anon_pages

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     48056 =C2=B1 2%     -14.2%      41229 =C2=B1 6%  lkp-sb03/nepim/300s-1=
00%-tcp
     48516 =C2=B1 3%     -12.4%      42491 =C2=B1 6%  lkp-sb03/nepim/300s-1=
00%-udp
     96572 =C2=B1 3%     -13.3%      83721 =C2=B1 6%  TOTAL slabinfo.kmallo=
c-64.active_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     13860 =C2=B1 0%     +16.4%      16135 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
     13860 =C2=B1 0%     +16.4%      16135 =C2=B1 0%  TOTAL slabinfo.signal=
_cache.num_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      1628 =C2=B1 0%     -15.4%       1378 =C2=B1 5%  lkp-sb03/nepim/300s-1=
00%-tcp
      1628 =C2=B1 0%     -15.4%       1378 =C2=B1 5%  TOTAL numa-meminfo.no=
de0.PageTables

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      1664 =C2=B1 5%     -14.6%       1420 =C2=B110%  xps2/pigz/100%-128K
      1664 =C2=B1 5%     -14.6%       1420 =C2=B110%  TOTAL cpuidle.C6-NHM.=
usage

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     48057 =C2=B1 2%     -13.1%      41781 =C2=B1 6%  lkp-sb03/nepim/300s-1=
00%-tcp
     48821 =C2=B1 4%     -12.4%      42746 =C2=B1 7%  lkp-sb03/nepim/300s-1=
00%-udp
     96878 =C2=B1 3%     -12.7%      84528 =C2=B1 6%  TOTAL slabinfo.kmallo=
c-64.num_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     26840 =C2=B1 6%     +11.4%      29907 =C2=B1 2%  lkp-sb03/nepim/300s-1=
00%-udp6
     26840 =C2=B1 6%     +11.4%      29907 =C2=B1 2%  TOTAL numa-meminfo.no=
de1.SUnreclaim

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      6710 =C2=B1 6%     +11.4%       7476 =C2=B1 2%  lkp-sb03/nepim/300s-1=
00%-udp6
      6710 =C2=B1 6%     +11.4%       7476 =C2=B1 2%  TOTAL numa-vmstat.nod=
e1.nr_slab_unreclaimable

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      1.21 =C2=B1 3%     +15.0%       1.39 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.21 =C2=B1 3%     +15.0%       1.39 =C2=B1 0%  TOTAL perf-profile.cp=
u-cycles.mutex_lock.pipe_write.new_sync_write.vfs_write.sys_write

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     13602 =C2=B1 0%     +15.6%      15725 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
     13602 =C2=B1 0%     +15.6%      15725 =C2=B1 0%  TOTAL slabinfo.signal=
_cache.active_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

       678 =C2=B1 0%     +15.4%        783 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
       678 =C2=B1 0%     +15.4%        783 =C2=B1 0%  TOTAL slabinfo.task_x=
state.num_slabs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

       678 =C2=B1 0%     +15.4%        783 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
       678 =C2=B1 0%     +15.4%        783 =C2=B1 0%  TOTAL slabinfo.task_x=
state.active_slabs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     26502 =C2=B1 0%     +15.4%      30575 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
     26502 =C2=B1 0%     +15.4%      30575 =C2=B1 0%  TOTAL slabinfo.task_x=
state.num_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     10233 =C2=B1 3%     +14.2%      11684 =C2=B1 4%  lkp-nex04/ebizzy/200%=
-100x-10s
     10233 =C2=B1 3%     +14.2%      11684 =C2=B1 4%  TOTAL slabinfo.kmallo=
c-256.active_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     42421 =C2=B1 0%     +13.7%      48230 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
      6728 =C2=B1 1%     +16.3%       7825 =C2=B1 1%  lkp-nex04/ebizzy/200%=
-100x-10s
     49149 =C2=B1 0%     +14.1%      56055 =C2=B1 0%  TOTAL slabinfo.task_d=
elay_info.num_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

       765 =C2=B1 5%     -15.6%        646 =C2=B1 9%  lkp-sb03/nepim/300s-1=
00%-udp
       765 =C2=B1 5%     -15.6%        646 =C2=B1 9%  TOTAL slabinfo.mnt_ca=
che.num_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

       765 =C2=B1 5%     -15.6%        646 =C2=B1 9%  lkp-sb03/nepim/300s-1=
00%-udp
       765 =C2=B1 5%     -15.6%        646 =C2=B1 9%  TOTAL slabinfo.mnt_ca=
che.active_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     42207 =C2=B1 0%     +13.5%      47911 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
      6716 =C2=B1 1%     +16.4%       7819 =C2=B1 1%  lkp-nex04/ebizzy/200%=
-100x-10s
     48923 =C2=B1 0%     +13.9%      55731 =C2=B1 0%  TOTAL slabinfo.task_d=
elay_info.active_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     26189 =C2=B1 0%     +15.1%      30136 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
     26189 =C2=B1 0%     +15.1%      30136 =C2=B1 0%  TOTAL slabinfo.task_x=
state.active_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      1.50 =C2=B1 7%      +8.4%       1.63 =C2=B1 4%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.50 =C2=B1 7%      +8.4%       1.63 =C2=B1 4%  TOTAL perf-profile.cp=
u-cycles.__fget_light.sys_write.system_call_fastpath.__write_nocancel

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

       407 =C2=B1 0%     -14.9%        346 =C2=B1 4%  lkp-sb03/nepim/300s-1=
00%-tcp
       407 =C2=B1 0%     -14.9%        346 =C2=B1 4%  TOTAL numa-vmstat.nod=
e0.nr_page_table_pages

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

   1365233 =C2=B1 3%     +20.6%    1646986 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
    119526 =C2=B1 1%     +12.2%     134051 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
   1484760 =C2=B1 3%     +20.0%    1781037 =C2=B1 0%  TOTAL softirqs.SCHED

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      8745 =C2=B1 1%     +13.5%       9929 =C2=B1 3%  lkp-nex04/ebizzy/200%=
-100x-10s
      8745 =C2=B1 1%     +13.5%       9929 =C2=B1 3%  TOTAL slabinfo.kmallo=
c-512.active_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      8805 =C2=B1 1%     +13.3%       9980 =C2=B1 3%  lkp-nex04/ebizzy/200%=
-100x-10s
      8805 =C2=B1 1%     +13.3%       9980 =C2=B1 3%  TOTAL slabinfo.kmallo=
c-512.num_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      1489 =C2=B1 4%     +11.5%       1660 =C2=B1 2%  lkp-sb03/nepim/300s-1=
00%-tcp
      1489 =C2=B1 4%     +11.5%       1660 =C2=B1 2%  TOTAL numa-meminfo.no=
de1.PageTables

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      1177 =C2=B1 0%     +13.7%       1339 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
      1177 =C2=B1 0%     +13.7%       1339 =C2=B1 0%  TOTAL slabinfo.task_d=
elay_info.num_slabs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      1177 =C2=B1 0%     +13.7%       1339 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
      1177 =C2=B1 0%     +13.7%       1339 =C2=B1 0%  TOTAL slabinfo.task_d=
elay_info.active_slabs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

       371 =C2=B1 5%     +11.7%        414 =C2=B1 2%  lkp-sb03/nepim/300s-1=
00%-tcp
       371 =C2=B1 5%     +11.7%        414 =C2=B1 2%  TOTAL numa-vmstat.nod=
e1.nr_page_table_pages

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      1597 =C2=B1 6%      -8.1%       1468 =C2=B1 6%  brickland3/aim7/2000-=
fork_test
       936 =C2=B1 3%     +15.4%       1080 =C2=B1 2%  lkp-sb03/nepim/300s-1=
00%-udp
      2533 =C2=B1 5%      +0.6%       2548 =C2=B1 4%  TOTAL slabinfo.RAW.nu=
m_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      1597 =C2=B1 6%      -8.1%       1468 =C2=B1 6%  brickland3/aim7/2000-=
fork_test
       936 =C2=B1 3%     +15.4%       1080 =C2=B1 2%  lkp-sb03/nepim/300s-1=
00%-udp
      2533 =C2=B1 5%      +0.6%       2548 =C2=B1 4%  TOTAL slabinfo.RAW.ac=
tive_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

    102018 =C2=B1 0%     -12.1%      89623 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
     10154 =C2=B1 1%     +14.2%      11597 =C2=B1 5%  lkp-sb03/nepim/300s-1=
00%-tcp6
      5110 =C2=B1 6%      -9.2%       4639 =C2=B1 4%  xps2/pigz/100%-128K
    117282 =C2=B1 0%      -9.7%     105859 =C2=B1 1%  TOTAL slabinfo.anon_v=
ma.active_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

    202981 =C2=B130%     -32.3%     137468 =C2=B1 7%  lkp-sb03/nepim/300s-1=
00%-udp
    202981 =C2=B130%     -32.3%     137468 =C2=B1 7%  TOTAL numa-numastat.n=
ode1.local_node

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

    202982 =C2=B130%     -32.3%     137471 =C2=B1 7%  lkp-sb03/nepim/300s-1=
00%-udp
    202982 =C2=B130%     -32.3%     137471 =C2=B1 7%  TOTAL numa-numastat.n=
ode1.numa_hit

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

    102489 =C2=B1 0%     -11.8%      90353 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
     10154 =C2=B1 1%     +14.2%      11597 =C2=B1 5%  lkp-sb03/nepim/300s-1=
00%-tcp6
      5110 =C2=B1 6%      -8.6%       4668 =C2=B1 3%  xps2/pigz/100%-128K
    117753 =C2=B1 0%      -9.5%     106618 =C2=B1 1%  TOTAL slabinfo.anon_v=
ma.num_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

    125378 =C2=B1 3%     -10.9%     111742 =C2=B1 3%  brickland3/aim7/2000-=
fork_test
     35261 =C2=B1 2%      -7.1%      32768 =C2=B1 5%  lkp-nex04/ebizzy/200%=
-100x-10s
     19416 =C2=B1 2%     -10.4%      17389 =C2=B1 6%  lkp-sb03/nepim/300s-1=
00%-udp6
     18932 =C2=B1 6%     -12.5%      16557 =C2=B112%  lkp-sb03/nuttcp/300s
    198988 =C2=B1 3%     -10.3%     178457 =C2=B1 4%  TOTAL slabinfo.vm_are=
a_struct.num_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      5.03 =C2=B1 9%     +18.2%       5.95 =C2=B1 9%  xps2/pigz/100%-512K
      5.03 =C2=B1 9%     +18.2%       5.95 =C2=B1 9%  TOTAL perf-profile.cp=
u-cycles.copy_user_generic_string.copy_page_from_iter.pipe_write.new_sync_w=
rite.vfs_write

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      1829 =C2=B1 0%     -11.8%       1613 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
      1829 =C2=B1 0%     -11.8%       1613 =C2=B1 0%  TOTAL slabinfo.anon_v=
ma.num_slabs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      1829 =C2=B1 0%     -11.8%       1613 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
      1829 =C2=B1 0%     -11.8%       1613 =C2=B1 0%  TOTAL slabinfo.anon_v=
ma.active_slabs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     10565 =C2=B1 2%     +12.4%      11875 =C2=B1 3%  lkp-nex04/ebizzy/200%=
-100x-10s
     10565 =C2=B1 2%     +12.4%      11875 =C2=B1 3%  TOTAL slabinfo.kmallo=
c-256.num_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      8185 =C2=B1 1%     +13.3%       9269 =C2=B1 1%  lkp-nex04/ebizzy/200%=
-100x-10s
      6391 =C2=B1 3%      +9.3%       6984 =C2=B1 1%  lkp-sb03/nepim/300s-1=
00%-tcp
      6313 =C2=B1 4%      +8.9%       6872 =C2=B1 2%  lkp-sb03/nuttcp/300s
      2783 =C2=B1 4%     +17.3%       3264 =C2=B1 6%  xps2/pigz/100%-128K
     23672 =C2=B1 3%     +11.5%      26390 =C2=B1 2%  TOTAL slabinfo.kmallo=
c-192.num_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      1.63 =C2=B1 3%     -11.5%       1.45 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.63 =C2=B1 3%     -11.5%       1.45 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles.new_sync_read.vfs_read.sys_read.system_call_fastpath.__read_nocanc=
el

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

    124777 =C2=B1 3%     -11.1%     110957 =C2=B1 3%  brickland3/aim7/2000-=
fork_test
     34905 =C2=B1 2%      -6.8%      32544 =C2=B1 5%  lkp-nex04/ebizzy/200%=
-100x-10s
     18699 =C2=B1 3%      -7.8%      17248 =C2=B1 4%  lkp-sb03/nepim/300s-1=
00%-tcp
     18997 =C2=B1 2%      -9.3%      17230 =C2=B1 7%  lkp-sb03/nepim/300s-1=
00%-udp6
     18751 =C2=B1 6%     -12.3%      16451 =C2=B112%  lkp-sb03/nuttcp/300s
    216131 =C2=B1 3%     -10.0%     194432 =C2=B1 4%  TOTAL slabinfo.vm_are=
a_struct.active_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      4278 =C2=B1 2%     +12.4%       4808 =C2=B1 5%  lkp-sb03/nepim/300s-1=
00%-tcp6
      4278 =C2=B1 2%     +12.4%       4808 =C2=B1 5%  TOTAL numa-vmstat.nod=
e1.nr_slab_reclaimable

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     17115 =C2=B1 2%     +12.4%      19233 =C2=B1 5%  lkp-sb03/nepim/300s-1=
00%-tcp6
     17115 =C2=B1 2%     +12.4%      19233 =C2=B1 5%  TOTAL numa-meminfo.no=
de1.SReclaimable

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      8185 =C2=B1 1%     +13.3%       9269 =C2=B1 1%  lkp-nex04/ebizzy/200%=
-100x-10s
      6391 =C2=B1 3%      +9.3%       6984 =C2=B1 1%  lkp-sb03/nepim/300s-1=
00%-tcp
      6313 =C2=B1 4%      +8.9%       6872 =C2=B1 2%  lkp-sb03/nuttcp/300s
     20889 =C2=B1 2%     +10.7%      23126 =C2=B1 1%  TOTAL slabinfo.kmallo=
c-192.active_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      9209 =C2=B1 0%     -11.1%       8186 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
      9209 =C2=B1 0%     -11.1%       8186 =C2=B1 0%  TOTAL slabinfo.mm_str=
uct.active_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      4936 =C2=B1 2%      -9.6%       4462 =C2=B1 6%  lkp-sb03/nepim/300s-1=
00%-tcp6
      4936 =C2=B1 2%      -9.6%       4462 =C2=B1 6%  TOTAL numa-vmstat.nod=
e0.nr_slab_reclaimable

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     19747 =C2=B1 2%      -9.6%      17850 =C2=B1 6%  lkp-sb03/nepim/300s-1=
00%-tcp6
     19747 =C2=B1 2%      -9.6%      17850 =C2=B1 6%  TOTAL numa-meminfo.no=
de0.SReclaimable

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     52598 =C2=B1 6%     +11.8%      58809 =C2=B1 2%  lkp-sb03/nepim/300s-1=
00%-tcp
     50458 =C2=B1 4%     +16.0%      58545 =C2=B1 4%  lkp-sb03/nepim/300s-1=
00%-udp
     49533 =C2=B1 1%     +11.3%      55134 =C2=B1 8%  lkp-sb03/nuttcp/300s
    152590 =C2=B1 3%     +13.0%     172489 =C2=B1 5%  TOTAL numa-meminfo.no=
de1.Active

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     87591 =C2=B1 3%      -8.1%      80480 =C2=B1 5%  brickland3/aim7/2000-=
fork_test
     87591 =C2=B1 3%      -8.1%      80480 =C2=B1 5%  TOTAL numa-meminfo.no=
de2.Active

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     57246 =C2=B1 6%     -10.5%      51260 =C2=B1 1%  lkp-sb03/nepim/300s-1=
00%-tcp
     58957 =C2=B1 4%     -12.4%      51634 =C2=B1 3%  lkp-sb03/nepim/300s-1=
00%-udp
    116204 =C2=B1 5%     -11.5%     102894 =C2=B1 2%  TOTAL numa-meminfo.no=
de0.Active

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      9350 =C2=B1 0%     -10.5%       8365 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
      9350 =C2=B1 0%     -10.5%       8365 =C2=B1 0%  TOTAL slabinfo.mm_str=
uct.num_objs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     67717 =C2=B1 2%     +11.5%      75502 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
     67717 =C2=B1 2%     +11.5%      75502 =C2=B1 2%  TOTAL cpuidle.C7-SNB.=
usage

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      2849 =C2=B1 3%     -10.9%       2538 =C2=B1 3%  brickland3/aim7/2000-=
fork_test
      2849 =C2=B1 3%     -10.9%       2538 =C2=B1 3%  TOTAL slabinfo.vm_are=
a_struct.active_slabs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      2849 =C2=B1 3%     -10.9%       2538 =C2=B1 3%  brickland3/aim7/2000-=
fork_test
      2849 =C2=B1 3%     -10.9%       2538 =C2=B1 3%  TOTAL slabinfo.vm_are=
a_struct.num_slabs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

 1.424e+08 =C2=B1 7%      -9.6%  1.288e+08 =C2=B1 5%  lkp-sb03/nepim/300s-1=
00%-tcp6
 1.424e+08 =C2=B1 7%      -9.6%  1.288e+08 =C2=B1 5%  TOTAL cpuidle.C1-SNB.=
time

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

    309718 =C2=B1 7%    +524.7%    1934689 =C2=B110%  brickland3/aim7/2000-=
fork_test
   4700591 =C2=B1 0%      -1.1%    4651134 =C2=B1 0%  lkp-nex04/ebizzy/200%=
-100x-10s
     14655 =C2=B1 0%      -5.1%      13903 =C2=B1 0%  lkp-sb03/nuttcp/300s
 5.603e+08 =C2=B1 2%     +17.8%  6.599e+08 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
   1498520 =C2=B1 0%      +2.4%    1534273 =C2=B1 0%  xps2/pigz/100%-128K
    395515 =C2=B1 0%      +5.2%     416086 =C2=B1 0%  xps2/pigz/100%-512K
 5.673e+08 =C2=B1 2%     +17.8%  6.685e+08 =C2=B1 1%  TOTAL time.involuntar=
y_context_switches

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

       472 =C2=B1 1%     -28.2%        338 =C2=B1 1%  brickland3/aim7/2000-=
fork_test
       472 =C2=B1 1%     -28.2%        338 =C2=B1 1%  TOTAL time.elapsed_ti=
me

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      9874 =C2=B1 2%     -27.9%       7117 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
      9874 =C2=B1 2%     -27.9%       7117 =C2=B1 0%  TOTAL time.system_time

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

       258 =C2=B1 1%     -25.0%        193 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
       258 =C2=B1 1%     -25.0%        193 =C2=B1 0%  TOTAL turbostat.Cor_W

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

       328 =C2=B1 1%     -20.2%        262 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
       328 =C2=B1 1%     -20.2%        262 =C2=B1 0%  TOTAL turbostat.Pkg_W

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

 1.027e+08 =C2=B1 4%     -26.7%   75311630 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
    284937 =C2=B1 3%      -9.5%     257857 =C2=B1 2%  lkp-nex04/ebizzy/200%=
-100x-10s
 1.104e+09 =C2=B1 2%     +13.2%   1.25e+09 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
 1.207e+09 =C2=B1 2%      +9.8%  1.326e+09 =C2=B1 1%  TOTAL time.voluntary_=
context_switches

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

     89.67 =C2=B1 1%     -14.1%      77.04 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
     89.67 =C2=B1 1%     -14.1%      77.04 =C2=B1 0%  TOTAL turbostat.RAM_W

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

       177 =C2=B1 2%     -17.7%        146 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
      3981 =C2=B1 0%      -1.7%       3913 =C2=B1 0%  lkp-nex04/ebizzy/200%=
-100x-10s
      1402 =C2=B1 0%      +1.5%       1424 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
      5562 =C2=B1 0%      -1.4%       5483 =C2=B1 0%  TOTAL time.user_time

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

    423911 =C2=B1 4%     -10.8%     378107 =C2=B1 0%  brickland3/aim7/2000-=
fork_test
      6132 =C2=B1 0%      -1.4%       6048 =C2=B1 0%  lkp-nex04/ebizzy/200%=
-100x-10s
     10065 =C2=B1 3%     +10.6%      11135 =C2=B1 3%  lkp-sb03/nepim/300s-1=
00%-tcp6
   2748065 =C2=B1 1%     +13.5%    3119430 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
     10882 =C2=B1 0%      +0.9%      10985 =C2=B1 0%  xps2/pigz/100%-128K
      3212 =C2=B1 0%      +1.7%       3268 =C2=B1 0%  xps2/pigz/100%-512K
   3202269 =C2=B1 2%     +10.2%    3528975 =C2=B1 1%  TOTAL vmstat.system.cs

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      6.27 =C2=B1 0%      +5.6%       6.62 =C2=B1 2%  lkp-sb03/nepim/300s-1=
00%-udp
      6.27 =C2=B1 0%      +5.6%       6.62 =C2=B1 2%  TOTAL turbostat.%c0

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

      8486 =C2=B1 0%      +3.8%       8804 =C2=B1 1%  xps2/pigz/100%-512K
      8486 =C2=B1 0%      +3.8%       8804 =C2=B1 1%  TOTAL vmstat.system.in

40c5e72463e4265  b4c544523de83af5352494cd8  =

---------------  -------------------------  =

  28239273 =C2=B1 1%      -4.1%   27073831 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
  28239273 =C2=B1 1%      -4.1%   27073831 =C2=B1 1%  TOTAL time.minor_page=
_faults




	[*] bisect-good sample
	[O] bisect-bad  sample


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.

Thanks,
Fengguang

_______________________________________________
LKP mailing list
LKP(a)linux.intel.com

--===============8263237157070261512==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDAvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUx
MDEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHUxMDIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDQv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHUxMDUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDcvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUxMDgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMS9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTExMC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExMi9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExMy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExNS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTExNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTExNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExOC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEx
OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTEyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNC9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdTE1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNy9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTE4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyL2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjAv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHUyMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjMvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHUyNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjYvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUyNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTI4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjkvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzL2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MzAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMyL2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1MzMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHUzNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MzYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHUzNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzkvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHU0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTQyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0NC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ1
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1NDYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NDkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTAvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU1MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1Ny9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTU4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
NjAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHU2MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTYyL2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjMvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHU2NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTY1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjYvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU2Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTY4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjkvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1NzAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcyL2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NzMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTc1L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1NzYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHU3Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTc4L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Nzkv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1ODAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4MS9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTgyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1ODMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4NC9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTg1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1ODYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4Ny9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTg4L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1ODkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU5MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTkyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTMvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5
NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTk1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5Ny9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdTk4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCg==

--===============8263237157070261512==--

