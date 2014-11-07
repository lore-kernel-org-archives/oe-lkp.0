Content-Type: multipart/mixed; boundary="===============6639394651078530999=="
MIME-Version: 1.0
From: LKP <lkp@01.org>
To: lkp@lists.01.org
Subject: [sched] e8fd90f3cb7: -18.3% unixbench.score
Date: Fri, 07 Nov 2014 14:03:46 +0800
Message-ID: <20141107060346.GE30507@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6639394651078530999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://bee.sh.intel.com/git/ydu19/linux for-lkp
commit e8fd90f3cb75c067a77bf9c1f222a0e06529fbc8 ("sched: Rewrite per entity=
 runnable load average tracking")


8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  testbox/testcase/testparams
----------------  --------------------------  ---------------------------
         %stddev     %change         %stddev
             \          |                \  =

     10296 =C2=B1  0%     -18.3%       8407 =C2=B1  6%  nhm-white/unixbench=
/shell8
     10296           -18.3%       8407        GEO-MEAN unixbench.score

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

     34111 =C2=B1  0%    -100.0%          0 =C2=B1  0%  nhm-white/unixbench=
/shell8
     34111          -100.0%          0        GEO-MEAN sched_debug.cfs_rq[3=
]:/.blocked_load_avg

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       102 =C2=B1 17%    -100.0%          0 =C2=B1  0%  nhm-white/unixbench=
/shell8
       102          -100.0%          0        GEO-MEAN sched_debug.cfs_rq[7=
]:/.runnable_load_avg

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

     34321 =C2=B1  2%    -100.0%          0 =C2=B1  0%  nhm-white/unixbench=
/shell8
     34321          -100.0%          0        GEO-MEAN sched_debug.cfs_rq[6=
]:/.tg_load_contrib

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

     34100 =C2=B1  2%    -100.0%          0 =C2=B1  0%  nhm-white/unixbench=
/shell8
     34100          -100.0%          0        GEO-MEAN sched_debug.cfs_rq[6=
]:/.blocked_load_avg

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       106 =C2=B1 27%    -100.0%          0 =C2=B1  0%  nhm-white/unixbench=
/shell8
       106          -100.0%          0        GEO-MEAN sched_debug.cfs_rq[6=
]:/.runnable_load_avg

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

     34200 =C2=B1  1%    -100.0%          0 =C2=B1  0%  nhm-white/unixbench=
/shell8
     34200          -100.0%          0        GEO-MEAN sched_debug.cfs_rq[5=
]:/.tg_load_contrib

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    273310 =C2=B1  0%     -99.8%        647 =C2=B1 13%  nhm-white/unixbench=
/shell8
    273310           -99.8%        647        GEO-MEAN sched_debug.cfs_rq[1=
]:/.tg_load_avg

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

     33983 =C2=B1  2%    -100.0%          0 =C2=B1  0%  nhm-white/unixbench=
/shell8
     33983          -100.0%          0        GEO-MEAN sched_debug.cfs_rq[5=
]:/.blocked_load_avg

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       104 =C2=B1 17%    -100.0%          0 =C2=B1  0%  nhm-white/unixbench=
/shell8
       104          -100.0%          0        GEO-MEAN sched_debug.cfs_rq[5=
]:/.runnable_load_avg

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

     34038 =C2=B1  2%    -100.0%          0 =C2=B1  0%  nhm-white/unixbench=
/shell8
     34038          -100.0%          0        GEO-MEAN sched_debug.cfs_rq[7=
]:/.tg_load_contrib

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

     33442 =C2=B1  1%    -100.0%          0 =C2=B1  0%  nhm-white/unixbench=
/shell8
     33442          -100.0%          0        GEO-MEAN sched_debug.cfs_rq[4=
]:/.tg_load_contrib

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

  68291392 =C2=B1  0%     -80.5%   13291992 =C2=B1 26%  nhm-white/unixbench=
/shell8
  68291391           -80.5%   13291992        GEO-MEAN cpuidle.C1E-NHM.time

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    395964 =C2=B1  0%     -82.7%      68531 =C2=B1 34%  nhm-white/unixbench=
/shell8
    395964           -82.7%      68531        GEO-MEAN cpuidle.C1E-NHM.usage

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

     33230 =C2=B1  1%    -100.0%          0 =C2=B1  0%  nhm-white/unixbench=
/shell8
     33230          -100.0%          0        GEO-MEAN sched_debug.cfs_rq[4=
]:/.blocked_load_avg

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       112 =C2=B1 20%    -100.0%          0 =C2=B1  0%  nhm-white/unixbench=
/shell8
       112          -100.0%          0        GEO-MEAN sched_debug.cfs_rq[4=
]:/.runnable_load_avg

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

     34428 =C2=B1  1%    -100.0%          0 =C2=B1  0%  nhm-white/unixbench=
/shell8
     34428          -100.0%          0        GEO-MEAN sched_debug.cfs_rq[3=
]:/.tg_load_contrib

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

     33826 =C2=B1  2%    -100.0%          0 =C2=B1  0%  nhm-white/unixbench=
/shell8
     33826          -100.0%          0        GEO-MEAN sched_debug.cfs_rq[7=
]:/.blocked_load_avg

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    272919 =C2=B1  0%     -99.8%        648 =C2=B1 13%  nhm-white/unixbench=
/shell8
    272919           -99.8%        648        GEO-MEAN sched_debug.cfs_rq[5=
]:/.tg_load_avg

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       120 =C2=B1  4%    -100.0%          0 =C2=B1  0%  nhm-white/unixbench=
/shell8
       119          -100.0%          0        GEO-MEAN sched_debug.cfs_rq[3=
]:/.runnable_load_avg

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

     34453 =C2=B1  1%    -100.0%          0 =C2=B1  0%  nhm-white/unixbench=
/shell8
     34453          -100.0%          0        GEO-MEAN sched_debug.cfs_rq[2=
]:/.tg_load_contrib

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

     34203 =C2=B1  1%    -100.0%          0 =C2=B1  0%  nhm-white/unixbench=
/shell8
     34202          -100.0%          0        GEO-MEAN sched_debug.cfs_rq[2=
]:/.blocked_load_avg

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       118 =C2=B1 17%    -100.0%          0 =C2=B1  0%  nhm-white/unixbench=
/shell8
       118          -100.0%          0        GEO-MEAN sched_debug.cfs_rq[2=
]:/.runnable_load_avg

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

     34030 =C2=B1  2%    -100.0%          0 =C2=B1  0%  nhm-white/unixbench=
/shell8
     34030          -100.0%          0        GEO-MEAN sched_debug.cfs_rq[1=
]:/.tg_load_contrib

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

     33757 =C2=B1  3%    -100.0%          0 =C2=B1  0%  nhm-white/unixbench=
/shell8
     33757          -100.0%          0        GEO-MEAN sched_debug.cfs_rq[1=
]:/.blocked_load_avg

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

        90 =C2=B1 14%    -100.0%          0 =C2=B1  0%  nhm-white/unixbench=
/shell8
        90          -100.0%          0        GEO-MEAN sched_debug.cfs_rq[1=
]:/.runnable_load_avg

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

     34085 =C2=B1  2%    -100.0%          0 =C2=B1  0%  nhm-white/unixbench=
/shell8
     34085          -100.0%          0        GEO-MEAN sched_debug.cfs_rq[0=
]:/.tg_load_contrib

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

     33914 =C2=B1  2%    -100.0%          0 =C2=B1  0%  nhm-white/unixbench=
/shell8
     33914          -100.0%          0        GEO-MEAN sched_debug.cfs_rq[0=
]:/.blocked_load_avg

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

        98 =C2=B1  8%    -100.0%          0 =C2=B1  0%  nhm-white/unixbench=
/shell8
        98          -100.0%          0        GEO-MEAN sched_debug.cfs_rq[0=
]:/.runnable_load_avg

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    272305 =C2=B1  0%     -99.8%        649 =C2=B1 13%  nhm-white/unixbench=
/shell8
    272305           -99.8%        649        GEO-MEAN sched_debug.cfs_rq[7=
]:/.tg_load_avg

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    272886 =C2=B1  0%     -99.8%        647 =C2=B1 13%  nhm-white/unixbench=
/shell8
    272886           -99.8%        647        GEO-MEAN sched_debug.cfs_rq[4=
]:/.tg_load_avg

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    273102 =C2=B1  0%     -99.8%        648 =C2=B1 13%  nhm-white/unixbench=
/shell8
    273102           -99.8%        647        GEO-MEAN sched_debug.cfs_rq[2=
]:/.tg_load_avg

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    273216 =C2=B1  0%     -99.8%        647 =C2=B1 13%  nhm-white/unixbench=
/shell8
    273216           -99.8%        647        GEO-MEAN sched_debug.cfs_rq[3=
]:/.tg_load_avg

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    272399 =C2=B1  0%     -99.8%        648 =C2=B1 13%  nhm-white/unixbench=
/shell8
    272399           -99.8%        648        GEO-MEAN sched_debug.cfs_rq[6=
]:/.tg_load_avg

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    273338 =C2=B1  0%     -99.8%        646 =C2=B1 13%  nhm-white/unixbench=
/shell8
    273338           -99.8%        646        GEO-MEAN sched_debug.cfs_rq[0=
]:/.tg_load_avg

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    192468 =C2=B1  0%     -71.5%      54783 =C2=B1 11%  nhm-white/unixbench=
/shell8
    192468           -71.5%      54783        GEO-MEAN sched_debug.cpu#4.tt=
wu_local

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    190003 =C2=B1  0%     -71.1%      54827 =C2=B1 12%  nhm-white/unixbench=
/shell8
    190003           -71.1%      54827        GEO-MEAN sched_debug.cpu#6.tt=
wu_local

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    187822 =C2=B1  1%     -61.8%      71707 =C2=B1 37%  nhm-white/unixbench=
/shell8
    187821           -61.8%      71707        GEO-MEAN sched_debug.cpu#7.tt=
wu_local

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    187984 =C2=B1  0%     -71.0%      54584 =C2=B1 12%  nhm-white/unixbench=
/shell8
    187984           -71.0%      54584        GEO-MEAN sched_debug.cpu#5.tt=
wu_local

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    487696 =C2=B1  0%     -65.7%     167112 =C2=B1 12%  nhm-white/unixbench=
/shell8
    487696           -65.7%     167112        GEO-MEAN softirqs.SCHED

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

      6.49 =C2=B1  0%    +232.0%      21.56 =C2=B1 15%  nhm-white/unixbench=
/shell8
      6.49          +232.0%      21.56        GEO-MEAN turbostat.%c3

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

 2.615e+08 =C2=B1  1%    +207.9%  8.052e+08 =C2=B1  2%  nhm-white/unixbench=
/shell8
 2.615e+08          +207.9%  8.052e+08        GEO-MEAN cpuidle.C6-NHM.time

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

         1 =C2=B1 34%    +108.0%          2 =C2=B1 18%  nhm-white/unixbench=
/shell8
         1          +108.0%          2        GEO-MEAN sched_debug.cfs_rq[5=
]:/.nr_spread_over

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

   1508887 =C2=B1  0%     -66.9%     499872 =C2=B1  7%  nhm-white/unixbench=
/shell8
   1508887           -66.9%     499872        GEO-MEAN sched_debug.cfs_rq[5=
]:/.min_vruntime

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

   1517135 =C2=B1  0%     -66.7%     505553 =C2=B1  5%  nhm-white/unixbench=
/shell8
   1517135           -66.7%     505553        GEO-MEAN sched_debug.cfs_rq[6=
]:/.min_vruntime

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

   1509639 =C2=B1  0%     -66.2%     509772 =C2=B1  6%  nhm-white/unixbench=
/shell8
   1509639           -66.2%     509772        GEO-MEAN sched_debug.cfs_rq[4=
]:/.min_vruntime

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    179613 =C2=B1  0%     -66.1%      60863 =C2=B1 12%  nhm-white/unixbench=
/shell8
    179612           -66.1%      60863        GEO-MEAN sched_debug.cpu#3.tt=
wu_local

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    180338 =C2=B1  1%     -66.2%      60896 =C2=B1 13%  nhm-white/unixbench=
/shell8
    180338           -66.2%      60896        GEO-MEAN sched_debug.cpu#1.tt=
wu_local

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    179286 =C2=B1  0%     -65.9%      61065 =C2=B1 13%  nhm-white/unixbench=
/shell8
    179286           -65.9%      61064        GEO-MEAN sched_debug.cpu#2.tt=
wu_local

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       125 =C2=B1 15%     -62.9%         46 =C2=B1 40%  nhm-white/unixbench=
/shell8
       125           -62.9%         46        GEO-MEAN sched_debug.cpu#3.cp=
u_load[0]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    178400 =C2=B1  0%     -64.6%      63074 =C2=B1 12%  nhm-white/unixbench=
/shell8
    178400           -64.6%      63074        GEO-MEAN sched_debug.cpu#0.tt=
wu_local

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    967748 =C2=B1  0%     -64.0%     348094 =C2=B1 10%  nhm-white/unixbench=
/shell8
    967748           -64.0%     348094        GEO-MEAN sched_debug.cpu#4.sc=
hed_count

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    966974 =C2=B1  0%     -64.0%     347881 =C2=B1 10%  nhm-white/unixbench=
/shell8
    966974           -64.0%     347881        GEO-MEAN sched_debug.cpu#4.nr=
_switches

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       107 =C2=B1 10%     -54.4%         48 =C2=B1 13%  nhm-white/unixbench=
/shell8
       106           -54.4%         48        GEO-MEAN sched_debug.cpu#4.cp=
u_load[2]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    951681 =C2=B1  0%     -63.2%     350214 =C2=B1 10%  nhm-white/unixbench=
/shell8
    951681           -63.2%     350214        GEO-MEAN sched_debug.cpu#5.sc=
hed_count

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    950933 =C2=B1  0%     -63.2%     349999 =C2=B1 10%  nhm-white/unixbench=
/shell8
    950932           -63.2%     349999        GEO-MEAN sched_debug.cpu#5.nr=
_switches

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    957692 =C2=B1  0%     -63.3%     351224 =C2=B1 10%  nhm-white/unixbench=
/shell8
    957692           -63.3%     351224        GEO-MEAN sched_debug.cpu#6.sc=
hed_count

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    956945 =C2=B1  0%     -63.3%     351024 =C2=B1 10%  nhm-white/unixbench=
/shell8
    956945           -63.3%     351024        GEO-MEAN sched_debug.cpu#6.nr=
_switches

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    948204 =C2=B1  0%     -55.9%     418133 =C2=B1 23%  nhm-white/unixbench=
/shell8
    948204           -55.9%     418133        GEO-MEAN sched_debug.cpu#7.sc=
hed_count

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    947425 =C2=B1  0%     -55.9%     417965 =C2=B1 23%  nhm-white/unixbench=
/shell8
    947425           -55.9%     417965        GEO-MEAN sched_debug.cpu#7.nr=
_switches

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       113 =C2=B1 14%     -54.6%         51 =C2=B1 13%  nhm-white/unixbench=
/shell8
       113           -54.6%         51        GEO-MEAN sched_debug.cpu#4.cp=
u_load[1]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    249126 =C2=B1  0%     -64.4%      88710 =C2=B1 19%  nhm-white/unixbench=
/shell8
    249126           -64.4%      88710        GEO-MEAN sched_debug.cpu#4.sc=
hed_goidle

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       104 =C2=B1  6%     -54.4%         47 =C2=B1 12%  nhm-white/unixbench=
/shell8
       103           -54.4%         47        GEO-MEAN sched_debug.cpu#4.cp=
u_load[3]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

        60 =C2=B1 20%    +210.8%        188 =C2=B1 47%  nhm-white/unixbench=
/shell8
        60          +210.8%        188        GEO-MEAN sched_debug.cpu#6.nr=
_uninterruptible

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    243578 =C2=B1  0%     -63.0%      90032 =C2=B1 18%  nhm-white/unixbench=
/shell8
    243577           -63.0%      90032        GEO-MEAN sched_debug.cpu#6.sc=
hed_goidle

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    240253 =C2=B1  1%     -62.7%      89626 =C2=B1 18%  nhm-white/unixbench=
/shell8
    240253           -62.7%      89626        GEO-MEAN sched_debug.cpu#5.sc=
hed_goidle

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       102 =C2=B1  3%     -54.6%         46 =C2=B1 11%  nhm-white/unixbench=
/shell8
       102           -54.6%         46        GEO-MEAN sched_debug.cpu#4.cp=
u_load[4]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       124 =C2=B1 16%     -55.0%         55 =C2=B1 17%  nhm-white/unixbench=
/shell8
       124           -55.0%         55        GEO-MEAN sched_debug.cpu#4.cp=
u_load[0]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    390759 =C2=B1  0%     -56.3%     170669 =C2=B1  0%  nhm-white/unixbench=
/shell8
    390759           -56.3%     170669        GEO-MEAN sched_debug.cpu#4.tt=
wu_count

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    388660 =C2=B1  0%     -56.1%     170732 =C2=B1  0%  nhm-white/unixbench=
/shell8
    388660           -56.1%     170732        GEO-MEAN sched_debug.cpu#6.tt=
wu_count

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    385167 =C2=B1  1%     -54.5%     175140 =C2=B1  3%  nhm-white/unixbench=
/shell8
    385167           -54.5%     175140        GEO-MEAN sched_debug.cpu#7.tt=
wu_count

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       105 =C2=B1  9%     -50.8%         51 =C2=B1 10%  nhm-white/unixbench=
/shell8
       105           -50.8%         51        GEO-MEAN sched_debug.cpu#0.cp=
u_load[1]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    385612 =C2=B1  0%     -55.8%     170349 =C2=B1  1%  nhm-white/unixbench=
/shell8
    385612           -55.8%     170349        GEO-MEAN sched_debug.cpu#5.tt=
wu_count

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       112 =C2=B1  8%     -59.4%         45 =C2=B1 39%  nhm-white/unixbench=
/shell8
       112           -59.4%         45        GEO-MEAN sched_debug.cpu#3.cp=
u_load[1]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

        99 =C2=B1  3%     -51.7%         47 =C2=B1 11%  nhm-white/unixbench=
/shell8
        98           -51.7%         47        GEO-MEAN sched_debug.cpu#6.cp=
u_load[4]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       100 =C2=B1  3%     -54.1%         46 =C2=B1 13%  nhm-white/unixbench=
/shell8
       100           -54.1%         46        GEO-MEAN sched_debug.cpu#5.cp=
u_load[4]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       100 =C2=B1  3%     -50.8%         49 =C2=B1 13%  nhm-white/unixbench=
/shell8
       100           -50.8%         49        GEO-MEAN sched_debug.cpu#6.cp=
u_load[3]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       102 =C2=B1  2%     -58.9%         42 =C2=B1 39%  nhm-white/unixbench=
/shell8
       102           -58.9%         42        GEO-MEAN sched_debug.cpu#3.cp=
u_load[3]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       106 =C2=B1  5%     -59.1%         43 =C2=B1 38%  nhm-white/unixbench=
/shell8
       106           -59.1%         43        GEO-MEAN sched_debug.cpu#3.cp=
u_load[2]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       102 =C2=B1  6%     -53.4%         47 =C2=B1 15%  nhm-white/unixbench=
/shell8
       102           -53.4%         47        GEO-MEAN sched_debug.cpu#5.cp=
u_load[3]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       106 =C2=B1 11%     -52.6%         50 =C2=B1 17%  nhm-white/unixbench=
/shell8
       106           -52.6%         50        GEO-MEAN sched_debug.cpu#5.cp=
u_load[2]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       100 =C2=B1  1%     -58.9%         41 =C2=B1 39%  nhm-white/unixbench=
/shell8
       100           -58.9%         41        GEO-MEAN sched_debug.cpu#3.cp=
u_load[4]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       101 =C2=B1  4%     -51.1%         49 =C2=B1  7%  nhm-white/unixbench=
/shell8
       101           -51.1%         49        GEO-MEAN sched_debug.cpu#0.cp=
u_load[2]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       106 =C2=B1 15%     -48.0%         55 =C2=B1 11%  nhm-white/unixbench=
/shell8
       106           -48.0%         55        GEO-MEAN sched_debug.cpu#0.cp=
u_load[0]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

        98 =C2=B1  6%     -49.4%         50 =C2=B1  7%  nhm-white/unixbench=
/shell8
        98           -49.4%         49        GEO-MEAN sched_debug.cpu#1.cp=
u_load[3]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       113 =C2=B1 17%     -52.4%         54 =C2=B1 16%  nhm-white/unixbench=
/shell8
       113           -52.4%         54        GEO-MEAN sched_debug.cpu#5.cp=
u_load[1]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       100 =C2=B1  3%     -51.0%         49 =C2=B1  6%  nhm-white/unixbench=
/shell8
       100           -51.0%         48        GEO-MEAN sched_debug.cpu#0.cp=
u_load[3]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

        99 =C2=B1  4%     -49.5%         50 =C2=B1  7%  nhm-white/unixbench=
/shell8
        99           -49.5%         50        GEO-MEAN sched_debug.cpu#1.cp=
u_load[4]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       123 =C2=B1 18%     -53.4%         57 =C2=B1  8%  nhm-white/unixbench=
/shell8
       123           -53.4%         57        GEO-MEAN sched_debug.cpu#2.cp=
u_load[0]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       104 =C2=B1  4%     -49.2%         52 =C2=B1 15%  nhm-white/unixbench=
/shell8
       103           -49.2%         52        GEO-MEAN sched_debug.cpu#6.cp=
u_load[2]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

        99 =C2=B1  3%     -50.1%         49 =C2=B1  6%  nhm-white/unixbench=
/shell8
        98           -50.1%         49        GEO-MEAN sched_debug.cpu#0.cp=
u_load[4]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       124 =C2=B1 23%     -52.4%         59 =C2=B1 15%  nhm-white/unixbench=
/shell8
       124           -52.4%         59        GEO-MEAN sched_debug.cpu#5.cp=
u_load[0]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

         2 =C2=B1 19%     +77.8%          4 =C2=B1 22%  nhm-white/unixbench=
/shell8
         2           +77.8%          4        GEO-MEAN sched_debug.cpu#1.nr=
_running

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

         4 =C2=B1 17%    +131.6%         11 =C2=B1 14%  nhm-white/unixbench=
/shell8
         4          +131.6%         11        GEO-MEAN sched_debug.cfs_rq[0=
]:/.nr_spread_over

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       114 =C2=B1 12%     -45.3%         62 =C2=B1 19%  nhm-white/unixbench=
/shell8
       114           -45.3%         62        GEO-MEAN sched_debug.cpu#6.cp=
u_load[0]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       110 =C2=B1 11%     -49.6%         55 =C2=B1 10%  nhm-white/unixbench=
/shell8
       110           -49.6%         55        GEO-MEAN sched_debug.cpu#2.cp=
u_load[1]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       108 =C2=B1  6%     -47.0%         57 =C2=B1 18%  nhm-white/unixbench=
/shell8
       108           -47.0%         57        GEO-MEAN sched_debug.cpu#6.cp=
u_load[1]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

        96 =C2=B1  7%     -47.2%         51 =C2=B1  7%  nhm-white/unixbench=
/shell8
        96           -47.2%         51        GEO-MEAN sched_debug.cpu#1.cp=
u_load[2]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       100 =C2=B1  4%     -48.0%         52 =C2=B1 11%  nhm-white/unixbench=
/shell8
       100           -48.0%         52        GEO-MEAN sched_debug.cpu#2.cp=
u_load[4]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       101 =C2=B1  6%     -47.7%         53 =C2=B1 11%  nhm-white/unixbench=
/shell8
       101           -47.7%         53        GEO-MEAN sched_debug.cpu#2.cp=
u_load[3]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       103 =C2=B1  8%     -47.6%         54 =C2=B1 11%  nhm-white/unixbench=
/shell8
       103           -47.6%         54        GEO-MEAN sched_debug.cpu#2.cp=
u_load[2]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

      5.00 =C2=B1  0%     +77.7%       8.89 =C2=B1  8%  nhm-white/unixbench=
/shell8
      5.00           +77.7%       8.89        GEO-MEAN turbostat.%c6

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    119445 =C2=B1  0%     -43.6%      67340 =C2=B1  4%  nhm-white/unixbench=
/shell8
    119445           -43.6%      67340        GEO-MEAN sched_debug.cfs_rq[4=
]:/.exec_clock

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

        90 =C2=B1  9%     -41.7%         52 =C2=B1  9%  nhm-white/unixbench=
/shell8
        90           -41.7%         52        GEO-MEAN sched_debug.cpu#1.cp=
u_load[1]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    118113 =C2=B1  0%     -53.2%      55272 =C2=B1 37%  nhm-white/unixbench=
/shell8
    118113           -53.2%      55272        GEO-MEAN sched_debug.cfs_rq[7=
]:/.exec_clock

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    118148 =C2=B1  0%     -43.1%      67258 =C2=B1  4%  nhm-white/unixbench=
/shell8
    118148           -43.1%      67258        GEO-MEAN sched_debug.cfs_rq[5=
]:/.exec_clock

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    118604 =C2=B1  0%     -43.3%      67280 =C2=B1  4%  nhm-white/unixbench=
/shell8
    118604           -43.3%      67280        GEO-MEAN sched_debug.cfs_rq[6=
]:/.exec_clock

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       941 =C2=B1  0%     +91.4%       1802 =C2=B1 12%  nhm-white/unixbench=
/shell8
       941           +91.4%       1802        GEO-MEAN uptime.idle

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

   1026977 =C2=B1  1%     -46.3%     551085 =C2=B1 10%  nhm-white/unixbench=
/shell8
   1026977           -46.3%     551085        GEO-MEAN sched_debug.cpu#1.sc=
hed_count

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

   1026190 =C2=B1  1%     -46.3%     550829 =C2=B1 10%  nhm-white/unixbench=
/shell8
   1026190           -46.3%     550829        GEO-MEAN sched_debug.cpu#1.nr=
_switches

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

   1026217 =C2=B1  0%     -38.1%     635710 =C2=B1 17%  nhm-white/unixbench=
/shell8
   1026217           -38.1%     635710        GEO-MEAN sched_debug.cpu#3.sc=
hed_count

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

   1025416 =C2=B1  0%     -38.0%     635466 =C2=B1 17%  nhm-white/unixbench=
/shell8
   1025416           -38.0%     635466        GEO-MEAN sched_debug.cpu#3.nr=
_switches

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

   1020645 =C2=B1  0%     -45.6%     555289 =C2=B1  9%  nhm-white/unixbench=
/shell8
   1020645           -45.6%     555289        GEO-MEAN sched_debug.cpu#2.sc=
hed_count

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

   1019855 =C2=B1  0%     -45.6%     555037 =C2=B1  9%  nhm-white/unixbench=
/shell8
   1019855           -45.6%     555037        GEO-MEAN sched_debug.cpu#2.nr=
_switches

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

   1009946 =C2=B1  0%     -45.6%     549668 =C2=B1 13%  nhm-white/unixbench=
/shell8
   1009946           -45.6%     549668        GEO-MEAN sched_debug.cpu#0.sc=
hed_count

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

   1009107 =C2=B1  0%     -45.6%     549376 =C2=B1 13%  nhm-white/unixbench=
/shell8
   1009107           -45.6%     549376        GEO-MEAN sched_debug.cpu#0.nr=
_switches

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    393502 =C2=B1  1%     -41.9%     228638 =C2=B1  2%  nhm-white/unixbench=
/shell8
    393502           -41.9%     228638        GEO-MEAN sched_debug.cpu#1.tt=
wu_count

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

 4.308e+08 =C2=B1  0%     +77.1%   7.63e+08 =C2=B1  8%  nhm-white/unixbench=
/shell8
 4.308e+08           +77.1%   7.63e+08        GEO-MEAN cpuidle.C3-NHM.time

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    391521 =C2=B1  0%     -44.8%     216253 =C2=B1 13%  nhm-white/unixbench=
/shell8
    391521           -44.8%     216253        GEO-MEAN sched_debug.cpu#3.tt=
wu_count

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       106 =C2=B1 20%     -39.0%         64 =C2=B1 49%  nhm-white/unixbench=
/shell8
       106           -39.0%         64        GEO-MEAN sched_debug.cpu#7.lo=
ad

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    390864 =C2=B1  0%     -41.0%     230683 =C2=B1  1%  nhm-white/unixbench=
/shell8
    390864           -41.0%     230683        GEO-MEAN sched_debug.cpu#2.tt=
wu_count

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    389212 =C2=B1  0%     -41.6%     227116 =C2=B1  5%  nhm-white/unixbench=
/shell8
    389212           -41.6%     227116        GEO-MEAN sched_debug.cpu#0.tt=
wu_count

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       102 =C2=B1 14%     -26.6%         75 =C2=B1 21%  nhm-white/unixbench=
/shell8
       102           -26.6%         75        GEO-MEAN sched_debug.cpu#0.lo=
ad

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

     12516 =C2=B1  9%     -24.2%       9487 =C2=B1 19%  nhm-white/unixbench=
/shell8
     12516           -24.2%       9487        GEO-MEAN sched_debug.cpu#4.cu=
rr->pid

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    170375 =C2=B1  0%     -36.8%     107654 =C2=B1  2%  nhm-white/unixbench=
/shell8
    170375           -36.8%     107654        GEO-MEAN sched_debug.cpu#4.nr=
_load_updates

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    169419 =C2=B1  0%     -36.0%     108482 =C2=B1  1%  nhm-white/unixbench=
/shell8
    169419           -36.0%     108482        GEO-MEAN sched_debug.cpu#6.nr=
_load_updates

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    169661 =C2=B1  0%     -36.0%     108613 =C2=B1  2%  nhm-white/unixbench=
/shell8
    169661           -36.0%     108613        GEO-MEAN sched_debug.cpu#5.nr=
_load_updates

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       112 =C2=B1  6%     -45.5%         61 =C2=B1 45%  nhm-white/unixbench=
/shell8
       112           -45.5%         61        GEO-MEAN sched_debug.cpu#3.lo=
ad

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

     13.95 =C2=B1  0%     +52.3%      21.24 =C2=B1  0%  nhm-white/unixbench=
/shell8
     13.94           +52.3%      21.24        GEO-MEAN turbostat.%c1

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

        80 =C2=B1 12%     -31.2%         55 =C2=B1 10%  nhm-white/unixbench=
/shell8
        80           -31.2%         55        GEO-MEAN sched_debug.cpu#1.cp=
u_load[0]

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    282791 =C2=B1  2%     -36.9%     178328 =C2=B1 13%  nhm-white/unixbench=
/shell8
    282791           -36.9%     178328        GEO-MEAN sched_debug.cpu#1.sc=
hed_goidle

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    462686 =C2=B1  5%     +59.9%     739766 =C2=B1  9%  nhm-white/unixbench=
/shell8
    462686           +59.9%     739766        GEO-MEAN sched_debug.cpu#6.av=
g_idle

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    664637 =C2=B1  0%     -33.5%     442292 =C2=B1  0%  nhm-white/unixbench=
/shell8
    664637           -33.5%     442291        GEO-MEAN softirqs.RCU

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    462699 =C2=B1  4%     +41.1%     653020 =C2=B1 14%  nhm-white/unixbench=
/shell8
    462699           +41.1%     653020        GEO-MEAN sched_debug.cpu#7.av=
g_idle

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    458554 =C2=B1  2%     +58.5%     726779 =C2=B1 10%  nhm-white/unixbench=
/shell8
    458554           +58.5%     726779        GEO-MEAN sched_debug.cpu#5.av=
g_idle

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    119722 =C2=B1  0%     -32.4%      80958 =C2=B1  0%  nhm-white/unixbench=
/shell8
    119722           -32.4%      80958        GEO-MEAN sched_debug.cfs_rq[1=
]:/.exec_clock

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    119548 =C2=B1  0%     -39.1%      72829 =C2=B1 22%  nhm-white/unixbench=
/shell8
    119548           -39.1%      72829        GEO-MEAN sched_debug.cfs_rq[3=
]:/.exec_clock

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    279808 =C2=B1  0%     -35.6%     180276 =C2=B1 11%  nhm-white/unixbench=
/shell8
    279808           -35.6%     180276        GEO-MEAN sched_debug.cpu#2.sc=
hed_goidle

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    118839 =C2=B1  0%     -31.0%      81942 =C2=B1  2%  nhm-white/unixbench=
/shell8
    118839           -31.0%      81942        GEO-MEAN sched_debug.cfs_rq[2=
]:/.exec_clock

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

   1132186 =C2=B1  0%     -31.4%     776541 =C2=B1  0%  nhm-white/unixbench=
/shell8
   1132186           -31.4%     776541        GEO-MEAN softirqs.TIMER

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    120897 =C2=B1  0%     -31.5%      82798 =C2=B1  1%  nhm-white/unixbench=
/shell8
    120897           -31.5%      82798        GEO-MEAN sched_debug.cfs_rq[0=
]:/.exec_clock

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    272557 =C2=B1  1%     -35.3%     176450 =C2=B1 16%  nhm-white/unixbench=
/shell8
    272557           -35.3%     176449        GEO-MEAN sched_debug.cpu#0.sc=
hed_goidle

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    489016 =C2=B1  2%     +50.9%     738092 =C2=B1 14%  nhm-white/unixbench=
/shell8
    489016           +50.9%     738091        GEO-MEAN sched_debug.cpu#4.av=
g_idle

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

     11928 =C2=B1  8%     -31.3%       8190 =C2=B1 43%  nhm-white/unixbench=
/shell8
     11928           -31.3%       8190        GEO-MEAN sched_debug.cpu#7.cu=
rr->pid

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

     12216 =C2=B1 11%     -24.4%       9238 =C2=B1  9%  nhm-white/unixbench=
/shell8
     12216           -24.4%       9238        GEO-MEAN sched_debug.cpu#5.cu=
rr->pid

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       114 =C2=B1 21%     -25.4%         85 =C2=B1  6%  nhm-white/unixbench=
/shell8
       114           -25.4%         85        GEO-MEAN sched_debug.cfs_rq[4=
]:/.load

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

  91391004 =C2=B1  0%     -26.6%   67036163 =C2=B1  5%  nhm-white/unixbench=
/shell8
  91391004           -26.6%   67036163        GEO-MEAN proc-vmstat.pgalloc_=
dma32

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

      8324 =C2=B1  1%     -25.8%       6178 =C2=B1  5%  nhm-white/unixbench=
/shell8
      8324           -25.8%       6178        GEO-MEAN proc-vmstat.thp_faul=
t_alloc

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

 2.126e+08 =C2=B1  0%     -26.5%  1.562e+08 =C2=B1  5%  nhm-white/unixbench=
/shell8
 2.126e+08           -26.5%  1.562e+08        GEO-MEAN proc-vmstat.pgfault

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    760899 =C2=B1  0%     -26.5%     559460 =C2=B1  5%  nhm-white/unixbench=
/shell8
    760899           -26.5%     559460        GEO-MEAN proc-vmstat.pgactiva=
te

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

 1.819e+08 =C2=B1  0%     -26.3%  1.341e+08 =C2=B1  5%  nhm-white/unixbench=
/shell8
 1.819e+08           -26.3%  1.341e+08        GEO-MEAN proc-vmstat.pgfree

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

 1.702e+08 =C2=B1  0%     -26.3%  1.254e+08 =C2=B1  5%  nhm-white/unixbench=
/shell8
 1.702e+08           -26.3%  1.254e+08        GEO-MEAN proc-vmstat.numa_hit

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

 1.702e+08 =C2=B1  0%     -26.3%  1.254e+08 =C2=B1  5%  nhm-white/unixbench=
/shell8
 1.702e+08           -26.3%  1.254e+08        GEO-MEAN proc-vmstat.numa_loc=
al

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

   1515333 =C2=B1  0%     -30.4%    1054993 =C2=B1 22%  nhm-white/unixbench=
/shell8
   1515333           -30.4%    1054993        GEO-MEAN sched_debug.cfs_rq[1=
]:/.min_vruntime

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

   1510534 =C2=B1  0%     -30.1%    1056082 =C2=B1 18%  nhm-white/unixbench=
/shell8
   1510534           -30.1%    1056082        GEO-MEAN sched_debug.cfs_rq[2=
]:/.min_vruntime

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

  90530917 =C2=B1  0%     -25.9%   67071067 =C2=B1  5%  nhm-white/unixbench=
/shell8
  90530917           -25.9%   67071067        GEO-MEAN proc-vmstat.pgalloc_=
normal

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

   1495949 =C2=B1  0%     -30.8%    1034539 =C2=B1 25%  nhm-white/unixbench=
/shell8
   1495949           -30.8%    1034539        GEO-MEAN sched_debug.cfs_rq[0=
]:/.min_vruntime

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    611688 =C2=B1  2%     +24.9%     764015 =C2=B1  5%  nhm-white/unixbench=
/shell8
    611688           +24.9%     764015        GEO-MEAN cpuidle.C6-NHM.usage

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

     11521 =C2=B1  6%     -13.4%       9982 =C2=B1  9%  nhm-white/unixbench=
/shell8
     11521           -13.4%       9982        GEO-MEAN sched_debug.cpu#2.cu=
rr->pid

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    171735 =C2=B1  0%     -14.7%     146526 =C2=B1  2%  nhm-white/unixbench=
/shell8
    171735           -14.7%     146526        GEO-MEAN sched_debug.cpu#1.nr=
_load_updates

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    171042 =C2=B1  0%     -12.6%     149465 =C2=B1  2%  nhm-white/unixbench=
/shell8
    171042           -12.6%     149465        GEO-MEAN sched_debug.cpu#3.nr=
_load_updates

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    170927 =C2=B1  0%     -13.5%     147851 =C2=B1  1%  nhm-white/unixbench=
/shell8
    170927           -13.5%     147851        GEO-MEAN sched_debug.cpu#2.nr=
_load_updates

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

     11701 =C2=B1  7%     -12.2%      10271 =C2=B1  6%  nhm-white/unixbench=
/shell8
     11701           -12.2%      10271        GEO-MEAN sched_debug.cpu#0.cu=
rr->pid

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    171793 =C2=B1  0%     -14.3%     147172 =C2=B1  4%  nhm-white/unixbench=
/shell8
    171793           -14.3%     147172        GEO-MEAN sched_debug.cpu#0.nr=
_load_updates

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    411252 =C2=B1  1%     +24.9%     513466 =C2=B1 22%  nhm-white/unixbench=
/shell8
    411252           +24.9%     513466        GEO-MEAN sched_debug.cpu#1.av=
g_idle

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

    427570 =C2=B1  5%     +17.2%     501275 =C2=B1 10%  nhm-white/unixbench=
/shell8
    427570           +17.2%     501275        GEO-MEAN sched_debug.cpu#2.av=
g_idle

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

      4645 =C2=B1  1%      -8.0%       4273 =C2=B1  3%  nhm-white/unixbench=
/shell8
      4644            -8.0%       4273        GEO-MEAN meminfo.KernelStack

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

   4262809 =C2=B1  0%     -77.9%     940165 =C2=B1 13%  nhm-white/unixbench=
/shell8
   4262809           -77.9%     940165        GEO-MEAN time.involuntary_con=
text_switches

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

     10031 =C2=B1  0%     -51.6%       4853 =C2=B1  0%  nhm-white/unixbench=
/shell8
     10031           -51.6%       4853        GEO-MEAN vmstat.system.in

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

     43248 =C2=B1  0%     -46.2%      23276 =C2=B1  3%  nhm-white/unixbench=
/shell8
     43248           -46.2%      23276        GEO-MEAN vmstat.system.cs

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       853 =C2=B1  0%     -37.1%        537 =C2=B1  5%  nhm-white/unixbench=
/shell8
       853           -37.1%        537        GEO-MEAN time.user_time

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

     74.57 =C2=B1  0%     -35.2%      48.31 =C2=B1  5%  nhm-white/unixbench=
/shell8
     74.57           -35.2%      48.31        GEO-MEAN turbostat.%c0

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

       584 =C2=B1  0%     -35.1%        379 =C2=B1  5%  nhm-white/unixbench=
/shell8
       584           -35.1%        379        GEO-MEAN time.percent_of_cpu_=
this_job_got

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

      1358 =C2=B1  0%     -33.8%        899 =C2=B1  5%  nhm-white/unixbench=
/shell8
      1358           -33.8%        899        GEO-MEAN time.system_time

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

   6466723 =C2=B1  0%     -29.8%    4542766 =C2=B1  7%  nhm-white/unixbench=
/shell8
   6466723           -29.8%    4542766        GEO-MEAN time.voluntary_conte=
xt_switches

8b8d967635270c5a  e8fd90f3cb75c067a77bf9c1f2  =

----------------  --------------------------  =

 2.118e+08 =C2=B1  0%     -26.6%  1.555e+08 =C2=B1  5%  nhm-white/unixbench=
/shell8
 2.118e+08           -26.6%  1.555e+08        GEO-MEAN time.minor_page_faul=
ts


nhm-white: Nehalem
Memory: 6G


To reproduce:

	apt-get install ruby ruby-oj
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

_______________________________________________
LKP mailing list
LKP(a)linux.intel.com

--===============6639394651078530999==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB1bml4YmVuY2gKZGVmYXVsdF9tb25pdG9yczoKICB3YWl0OiBwcmUtdGVz
dAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0YXQ6IAogIG51
bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBwcm9jLXN0YXQ6
IAogIG1lbWluZm86IAogIHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAog
IGxhdGVuY3lfc3RhdHM6IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tz
dGF0czogCiAgY3B1aWRsZTogCiAgY3B1ZnJlcTogCiAgdHVyYm9zdGF0OiAKICBzY2hlZF9kZWJ1
ZzoKICAgIGludGVydmFsOiAxMApkZWZhdWx0X3dhdGNoZG9nczoKICB3YXRjaC1vb206IAogIHdh
dGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjogCmNvbW1pdDogZjZmOGNlZDdjYzcyOTJmYWZjODIx
NTBjZWM1N2I5NTgyZTk5OGRmMwptb2RlbDogTmVoYWxlbQptZW1vcnk6IDZHCmhkZF9wYXJ0aXRp
b25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1IaXRhY2hpX0hEVDcyMTA1MFNMQTM2MF9TVEgzRDdN
RTBZRU01WS1wYXJ0NQogIC9kZXYvZGlzay9ieS1pZC9hdGEtSGl0YWNoaV9IRFQ3MjEwNTBTTEEz
NjBfU1RIM0Q3TUUwWUVNNVktcGFydDYgL2Rldi9kaXNrL2J5LWlkL2F0YS1IaXRhY2hpX0hEVDcy
MTA1MFNMQTM2MF9TVEgzRDdNRTBZRU01WS1wYXJ0NwogIC9kZXYvZGlzay9ieS1pZC9hdGEtSGl0
YWNoaV9IRFQ3MjEwNTBTTEEzNjBfU1RIM0Q3TUUwWUVNNVktcGFydDgiCnN3YXBfcGFydGl0aW9u
czogCnJvb3Rmc19wYXJ0aXRpb246ICIvZGV2L2Rpc2svYnktaWQvYXRhLUhpdGFjaGlfSERUNzIx
MDUwU0xBMzYwX1NUSDNEN01FMFlFTTVZLXBhcnQyIgp1bml4YmVuY2g6CiAgdGVzdDoKICAtIHNo
ZWxsOAplbnF1ZXVlX3RpbWU6IDIwMTQtMTEtMDUgMjE6MTI6NDYuNDE3NzU3NTE4ICswODowMAp0
ZXN0Ym94OiBuaG0td2hpdGUKdGJveF9ncm91cDogbmhtLXdoaXRlCmtjb25maWc6IHg4Nl82NC1y
aGVsCmhlYWRfY29tbWl0OiBmNmY4Y2VkN2NjNzI5MmZhZmM4MjE1MGNlYzU3Yjk1ODJlOTk4ZGYz
CmJhc2VfY29tbWl0OiAwZGYxZjI0ODdkMmYwZDA0NzAzZjE0MjgxM2Q1MzYxNWQ2MmExZGE0CmJy
YW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTQxMTA1MTYKa2VybmVsOiAiL2tlcm5l
bC94ODZfNjQtcmhlbC9mNmY4Y2VkN2NjNzI5MmZhZmM4MjE1MGNlYzU3Yjk1ODJlOTk4ZGYzL3Zt
bGludXotMy4xOC4wLXJjMy13bC1hdGgtZ2Y2ZjhjZWQiCnVzZXI6IHdmZwpxdWV1ZTogY3ljbGlj
CnJvb3RmczogZGViaWFuLXg4Nl82NC5jZ3oKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L25obS13aGl0
ZS91bml4YmVuY2gvc2hlbGw4L2RlYmlhbi14ODZfNjQuY2d6L3g4Nl82NC1yaGVsL2Y2ZjhjZWQ3
Y2M3MjkyZmFmYzgyMTUwY2VjNTdiOTU4MmU5OThkZjMvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVk
dWxlZC9uaG0td2hpdGUvY3ljbGljX3VuaXhiZW5jaC1zaGVsbDgteDg2XzY0LXJoZWwtSEVBRC1m
NmY4Y2VkN2NjNzI5MmZhZmM4MjE1MGNlYzU3Yjk1ODJlOTk4ZGYzLTAueWFtbCIKZGVxdWV1ZV90
aW1lOiAyMDE0LTExLTA1IDIyOjM4OjE5LjMxMDA0ODA5MCArMDg6MDAKam9iX3N0YXRlOiBmaW5p
c2hlZApsb2FkYXZnOiAzMy45NyAxOS4yNSA4LjAwIDEvMTMwIDI4NTYwCnN0YXJ0X3RpbWU6ICcx
NDE1MTk4MzI1JwplbmRfdGltZTogJzE0MTUxOTg3MDMnCnZlcnNpb246ICIvbGtwL3dmZy8uc3Jj
LTIwMTQxMTA1LTIyMTk1MSIK

--===============6639394651078530999==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

Li9SdW4gc2hlbGw4Cg==

--===============6639394651078530999==--

