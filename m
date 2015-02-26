Content-Type: multipart/mixed; boundary="===============8515434786370994865=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [mm] 4d942466994: +4.8% will-it-scale.per_process_ops
Date: Thu, 26 Feb 2015 11:27:20 +0800
Message-ID: <1424921240.10337.14.camel@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8515434786370994865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 4d9424669946532be754a6e116618dcb58430cb4 ("mm: convert p[te|md]_mkno=
nnuma and remaining page table manipulations")


testbox/testcase/testparams: lkp-g5/will-it-scale/performance-readseek3

842915f56667f9ee  4d9424669946532be754a6e116  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

   1526912 =C2=B1  1%      +4.8%    1599490 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
     15364 =C2=B1  4%     +10.1%      16920 =C2=B1  5%  will-it-scale.time.=
involuntary_context_switches
    131290 =C2=B1  0%      +4.8%     137653 =C2=B1  0%  will-it-scale.time.=
minor_page_faults
       318 =C2=B1  1%      -1.6%        313 =C2=B1  0%  will-it-scale.time.=
elapsed_time.max
       318 =C2=B1  1%      -1.6%        313 =C2=B1  0%  will-it-scale.time.=
elapsed_time
        54 =C2=B1 25%     -83.8%          8 =C2=B1 48%  sched_debug.cfs_rq[=
53]:/.tg_load_contrib
        11 =C2=B1 39%    +316.9%         47 =C2=B1 22%  sched_debug.cfs_rq[=
18]:/.tg_load_contrib
         8 =C2=B1 24%     -79.0%          1 =C2=B1 47%  sched_debug.cfs_rq[=
11]:/.nr_spread_over
        46 =C2=B1  7%    +271.8%        172 =C2=B1 45%  numa-vmstat.node2.n=
r_inactive_anon
       186 =C2=B1  7%    +270.8%        691 =C2=B1 44%  numa-meminfo.node2.=
Inactive(anon)
       642 =C2=B1 15%    +116.3%       1388 =C2=B1 41%  sched_debug.cpu#2.t=
twu_count
        37 =C2=B1 17%    +170.3%        100 =C2=B1 15%  numa-vmstat.node6.n=
r_page_table_pages
        19 =C2=B1 41%     +98.7%         37 =C2=B1 38%  sched_debug.cfs_rq[=
62]:/.blocked_load_avg
       347 =C2=B1 19%    +103.9%        708 =C2=B1 49%  sched_debug.cpu#6.s=
ched_goidle
       215 =C2=B1  5%    +148.8%        535 =C2=B1 31%  sched_debug.cpu#101=
.sched_goidle
       519 =C2=B1  7%    +135.5%       1222 =C2=B1 30%  sched_debug.cpu#101=
.nr_switches
        23 =C2=B1 35%     +84.3%         43 =C2=B1 33%  sched_debug.cfs_rq[=
62]:/.tg_load_contrib
       833 =C2=B1 18%     +89.1%       1576 =C2=B1 47%  sched_debug.cpu#6.n=
r_switches
   1083043 =C2=B1  0%     -55.2%     485505 =C2=B1  1%  proc-vmstat.numa_pt=
e_updates
       250 =C2=B1 28%    +120.1%        551 =C2=B1 41%  sched_debug.cpu#74.=
ttwu_local
       865 =C2=B1 18%     +61.1%       1394 =C2=B1 29%  sched_debug.cpu#32.=
ttwu_local
       515 =C2=B1 18%     +81.0%        932 =C2=B1 41%  sched_debug.cpu#2.s=
ched_goidle
      1242 =C2=B1 22%     +76.4%       2191 =C2=B1 39%  sched_debug.cpu#2.n=
r_switches
        23 =C2=B1 17%     +63.9%         38 =C2=B1 19%  sched_debug.cfs_rq[=
96]:/.tg_load_contrib
       302 =C2=B1  0%     +88.9%        570 =C2=B1 31%  sched_debug.cpu#47.=
ttwu_local
      3126 =C2=B1  6%     +77.9%       5562 =C2=B1 36%  sched_debug.cpu#15.=
sched_count
      1717 =C2=B1 30%     +30.5%       2240 =C2=B1 21%  sched_debug.cpu#32.=
ttwu_count
       256 =C2=B1 14%     +87.1%        479 =C2=B1 22%  sched_debug.cpu#7.t=
twu_count
      4200 =C2=B1 30%     -55.3%       1878 =C2=B1 30%  sched_debug.cpu#67.=
ttwu_count
      1036 =C2=B1 10%     -50.7%        511 =C2=B1 35%  sched_debug.cpu#79.=
ttwu_count
       527 =C2=B1 18%     +72.5%        909 =C2=B1 34%  sched_debug.cpu#15.=
ttwu_local
       359 =C2=B1  7%     +64.1%        589 =C2=B1 17%  sched_debug.cpu#50.=
ttwu_count
      1692 =C2=B1 16%     +34.2%       2271 =C2=B1 21%  sched_debug.cpu#32.=
sched_goidle
       653 =C2=B1 14%     -51.7%        315 =C2=B1 37%  sched_debug.cpu#79.=
ttwu_local
       137 =C2=B1  3%     +99.1%        272 =C2=B1 38%  sched_debug.cpu#40.=
ttwu_local
      6398 =C2=B1 24%     +55.9%       9973 =C2=B1 16%  numa-meminfo.node3.=
SReclaimable
      1599 =C2=B1 24%     +55.9%       2493 =C2=B1 16%  numa-vmstat.node3.n=
r_slab_reclaimable
      3669 =C2=B1 18%     +33.6%       4900 =C2=B1 16%  sched_debug.cpu#32.=
nr_switches
      3681 =C2=B1 18%     +33.4%       4910 =C2=B1 16%  sched_debug.cpu#32.=
sched_count
       546 =C2=B1  9%     +73.0%        945 =C2=B1 24%  sched_debug.cpu#40.=
nr_switches
       965 =C2=B1 26%     -38.8%        590 =C2=B1  4%  sched_debug.cpu#64.=
sched_goidle
       569 =C2=B1  8%     +69.2%        963 =C2=B1 23%  sched_debug.cpu#40.=
sched_count
       225 =C2=B1  7%     +79.0%        402 =C2=B1 25%  sched_debug.cpu#40.=
sched_goidle
       199 =C2=B1  4%     +53.6%        306 =C2=B1 17%  sched_debug.cpu#103=
.sched_goidle
       112 =C2=B1  3%     +44.9%        162 =C2=B1 20%  sched_debug.cpu#102=
.ttwu_local
       198 =C2=B1 15%     +71.8%        340 =C2=B1 39%  sched_debug.cpu#40.=
ttwu_count
       475 =C2=B1  2%     +51.8%        721 =C2=B1 17%  sched_debug.cpu#103=
.nr_switches
       162 =C2=B1  9%     +86.6%        302 =C2=B1 25%  sched_debug.cpu#7.t=
twu_local
       203 =C2=B1  1%     +54.7%        314 =C2=B1 15%  sched_debug.cpu#102=
.sched_goidle
       499 =C2=B1  7%     +68.9%        843 =C2=B1 35%  sched_debug.cpu#47.=
ttwu_count
       478 =C2=B1  2%     +54.4%        739 =C2=B1 16%  sched_debug.cpu#102=
.nr_switches
       767 =C2=B1 16%     +66.6%       1278 =C2=B1 25%  sched_debug.cpu#7.n=
r_switches
      4369 =C2=B1 15%     -41.3%       2564 =C2=B1  4%  sched_debug.cpu#65.=
ttwu_count
       169 =C2=B1 14%     +32.2%        224 =C2=B1 21%  sched_debug.cpu#105=
.ttwu_local
       559 =C2=B1  6%     +40.3%        784 =C2=B1 17%  sched_debug.cpu#47.=
sched_goidle
       770 =C2=B1  7%     -28.2%        552 =C2=B1 21%  sched_debug.cpu#126=
.ttwu_local
      1195 =C2=B1 21%     +35.0%       1614 =C2=B1 16%  cpuidle.C1E-NHM.usa=
ge
      1450 =C2=B1 17%     +38.8%       2013 =C2=B1  8%  sched_debug.cpu#90.=
ttwu_local
       929 =C2=B1  7%     +41.3%       1312 =C2=B1  9%  sched_debug.cpu#97.=
ttwu_count
       506 =C2=B1  6%     +27.6%        646 =C2=B1 12%  sched_debug.cpu#48.=
sched_goidle
       914 =C2=B1  8%     +54.0%       1407 =C2=B1 26%  sched_debug.cpu#50.=
nr_switches
       401 =C2=B1  6%     +52.9%        613 =C2=B1 25%  sched_debug.cpu#50.=
sched_goidle
      1004 =C2=B1  9%     +18.8%       1193 =C2=B1 12%  slabinfo.xfs_buf.nu=
m_objs
      1004 =C2=B1  9%     +18.8%       1193 =C2=B1 12%  slabinfo.xfs_buf.ac=
tive_objs
      1891 =C2=B1  3%     +26.8%       2397 =C2=B1  9%  sched_debug.cpu#120=
.nr_switches
      1380 =C2=B1  6%     -26.6%       1012 =C2=B1 10%  sched_debug.cpu#126=
.ttwu_count
     15695 =C2=B1 13%     -21.4%      12338 =C2=B1  6%  sched_debug.cfs_rq[=
113]:/.exec_clock
      1310 =C2=B1  5%     +40.7%       1844 =C2=B1 19%  sched_debug.cpu#47.=
nr_switches
      1330 =C2=B1  5%     +40.0%       1863 =C2=B1 19%  sched_debug.cpu#47.=
sched_count
      1286 =C2=B1  8%     +44.7%       1861 =C2=B1 35%  sched_debug.cpu#15.=
ttwu_count
        21 =C2=B1 10%     +17.7%         25 =C2=B1 12%  sched_debug.cpu#96.=
cpu_load[3]
     23482 =C2=B1 12%     +29.4%      30397 =C2=B1  4%  numa-meminfo.node3.=
Slab
       566 =C2=B1 21%     -30.7%        392 =C2=B1  8%  sched_debug.cpu#115=
.sched_goidle
        22 =C2=B1 11%     +17.5%         26 =C2=B1 13%  sched_debug.cpu#96.=
cpu_load[2]
         9 =C2=B1  5%     +20.5%         11 =C2=B1 11%  sched_debug.cpu#8.c=
pu_load[1]
         9 =C2=B1  5%     +20.5%         11 =C2=B1 11%  sched_debug.cfs_rq[=
8]:/.load
         9 =C2=B1  5%     +20.5%         11 =C2=B1 11%  sched_debug.cpu#5.l=
oad
         9 =C2=B1  5%     +20.5%         11 =C2=B1 11%  sched_debug.cpu#8.l=
oad
      3581 =C2=B1  5%     +22.1%       4372 =C2=B1  6%  sched_debug.cpu#26.=
curr->pid
       215 =C2=B1  6%     +37.9%        297 =C2=B1 14%  sched_debug.cpu#50.=
ttwu_local
      1331 =C2=B1 20%     -31.6%        911 =C2=B1  9%  sched_debug.cpu#115=
.nr_switches
       824 =C2=B1  3%     +21.2%        999 =C2=B1 14%  sched_debug.cpu#120=
.sched_goidle
      1339 =C2=B1 20%     -31.3%        921 =C2=B1  9%  sched_debug.cpu#115=
.sched_count
        21 =C2=B1 10%     +17.9%         24 =C2=B1 12%  sched_debug.cpu#96.=
cpu_load[4]
     42610 =C2=B1 11%     -19.9%      34115 =C2=B1  4%  sched_debug.cfs_rq[=
17]:/.exec_clock
      2693 =C2=B1  7%     +27.2%       3425 =C2=B1 10%  sched_debug.cpu#95.=
curr->pid
      2899 =C2=B1 18%     +26.8%       3677 =C2=B1 11%  sched_debug.cpu#90.=
ttwu_count
         9 =C2=B1 17%     -35.3%          6 =C2=B1 13%  sched_debug.cpu#20.=
load
         8 =C2=B1  5%     -19.2%          7 =C2=B1 10%  sched_debug.cfs_rq[=
45]:/.load
         9 =C2=B1 17%     -35.3%          6 =C2=B1 13%  sched_debug.cfs_rq[=
20]:/.load
         8 =C2=B1  5%     -19.2%          7 =C2=B1 10%  sched_debug.cpu#45.=
load
      5131 =C2=B1 11%     -20.9%       4061 =C2=B1  7%  sched_debug.cpu#59.=
curr->pid
    999035 =C2=B1  0%     -21.4%     785703 =C2=B1  1%  sched_debug.cpu#103=
.avg_idle
      1000 =C2=B1 14%     -33.2%        668 =C2=B1 32%  numa-meminfo.node7.=
PageTables
      1146 =C2=B1 11%     -20.9%        907 =C2=B1 11%  sched_debug.cpu#117=
.nr_switches
      1157 =C2=B1 11%     -20.9%        916 =C2=B1 10%  sched_debug.cpu#117=
.sched_count
    102779 =C2=B1  4%     +24.6%     128062 =C2=B1  8%  numa-numastat.node0=
.numa_hit
       506 =C2=B1 11%     -20.4%        403 =C2=B1 11%  sched_debug.cpu#117=
.sched_goidle
      1819 =C2=B1 10%     +12.1%       2039 =C2=B1  9%  sched_debug.cpu#94.=
ttwu_local
       222 =C2=B1 21%     +35.5%        300 =C2=B1 30%  sched_debug.cpu#49.=
ttwu_local
   1000000 =C2=B1  0%     -20.2%     797734 =C2=B1  2%  sched_debug.cpu#102=
.avg_idle
       464 =C2=B1  5%     +22.0%        567 =C2=B1 19%  sched_debug.cpu#123=
.ttwu_local
       892 =C2=B1 17%     -24.9%        669 =C2=B1 14%  sched_debug.cpu#59.=
sched_goidle
       863 =C2=B1  2%     +16.5%       1005 =C2=B1  6%  sched_debug.cpu#125=
.ttwu_count
       855 =C2=B1  6%     +20.6%       1031 =C2=B1 15%  sched_debug.cpu#124=
.ttwu_count
       790 =C2=B1  8%     +20.5%        952 =C2=B1  6%  slabinfo.blkdev_ioc=
.active_objs
       790 =C2=B1  8%     +20.5%        952 =C2=B1  6%  slabinfo.blkdev_ioc=
.num_objs
   1000000 =C2=B1  0%     -20.5%     795037 =C2=B1  1%  sched_debug.cpu#101=
.avg_idle
       521 =C2=B1 25%     -32.9%        349 =C2=B1  6%  sched_debug.cpu#116=
.ttwu_count
   1000000 =C2=B1  0%     -18.9%     811355 =C2=B1  2%  sched_debug.cpu#37.=
avg_idle
     99927 =C2=B1  5%     +25.0%     124916 =C2=B1  7%  numa-numastat.node0=
.local_node
    998080 =C2=B1  1%     -18.7%     811378 =C2=B1  3%  sched_debug.cpu#40.=
avg_idle
         9 =C2=B1  5%     +15.2%         10 =C2=B1  7%  sched_debug.cpu#5.c=
pu_load[0]
         9 =C2=B1  5%     +15.2%         10 =C2=B1  7%  sched_debug.cpu#5.c=
pu_load[3]
    998768 =C2=B1  0%     -18.6%     813469 =C2=B1  2%  sched_debug.cpu#39.=
avg_idle
       513 =C2=B1  5%     -25.7%        381 =C2=B1 16%  sched_debug.cpu#115=
.ttwu_count
      4271 =C2=B1  8%     +19.5%       5105 =C2=B1  8%  numa-vmstat.node3.n=
r_slab_unreclaimable
     17083 =C2=B1  8%     +19.6%      20423 =C2=B1  8%  numa-meminfo.node3.=
SUnreclaim
    991551 =C2=B1  1%     -17.3%     819931 =C2=B1  3%  sched_debug.cpu#38.=
avg_idle
      4521 =C2=B1  7%     -18.5%       3684 =C2=B1 10%  sched_debug.cpu#106=
.curr->pid
    998706 =C2=B1  0%     -17.7%     821652 =C2=B1  3%  sched_debug.cpu#36.=
avg_idle
    996941 =C2=B1  0%     -16.8%     829747 =C2=B1  2%  sched_debug.cpu#33.=
avg_idle
       339 =C2=B1 10%     -22.4%        263 =C2=B1 13%  sched_debug.cpu#115=
.ttwu_local
    999527 =C2=B1  0%     -18.7%     812806 =C2=B1  4%  sched_debug.cpu#99.=
avg_idle
    996295 =C2=B1  0%     -16.5%     831915 =C2=B1  2%  sched_debug.cpu#35.=
avg_idle
    997889 =C2=B1  0%     -19.6%     802292 =C2=B1  3%  sched_debug.cpu#100=
.avg_idle
      3462 =C2=B1  2%     -20.4%       2757 =C2=B1 11%  sched_debug.cpu#127=
.curr->pid
      3207 =C2=B1 10%     +20.2%       3855 =C2=B1  4%  sched_debug.cpu#74.=
curr->pid
    470490 =C2=B1  4%     -10.6%     420446 =C2=B1  5%  numa-numastat.node7=
.local_node
     21800 =C2=B1 49%     -40.6%      12939 =C2=B1  3%  numa-meminfo.node4.=
Active
    474714 =C2=B1  4%     -10.6%     424629 =C2=B1  5%  numa-numastat.node7=
.numa_hit
    998931 =C2=B1  0%     -16.7%     832405 =C2=B1  2%  sched_debug.cpu#34.=
avg_idle
   1000000 =C2=B1  0%     -15.2%     848462 =C2=B1  0%  sched_debug.cpu#96.=
avg_idle
       177 =C2=B1  9%     +19.4%        211 =C2=B1  5%  sched_debug.cfs_rq[=
95]:/.tg_runnable_contrib
   1018480 =C2=B1  2%     -15.3%     862826 =C2=B1  1%  sched_debug.cpu#41.=
avg_idle
     10768 =C2=B1  5%     -20.5%       8559 =C2=B1  8%  sched_debug.cfs_rq[=
127]:/.avg->runnable_avg_sum
       234 =C2=B1  6%     -20.7%        185 =C2=B1  8%  sched_debug.cfs_rq[=
127]:/.tg_runnable_contrib
      8154 =C2=B1  9%     +18.9%       9698 =C2=B1  5%  sched_debug.cfs_rq[=
95]:/.avg->runnable_avg_sum
    999017 =C2=B1  0%     -13.5%     864522 =C2=B1  1%  sched_debug.cpu#45.=
avg_idle
    999665 =C2=B1  0%     -14.0%     859582 =C2=B1  1%  sched_debug.cpu#44.=
avg_idle
    996108 =C2=B1  0%     -15.6%     840514 =C2=B1  4%  sched_debug.cpu#98.=
avg_idle
    994758 =C2=B1  0%     -15.1%     844877 =C2=B1  3%  sched_debug.cpu#48.=
avg_idle
       467 =C2=B1  3%     -15.1%        397 =C2=B1  9%  sched_debug.cpu#116=
.sched_goidle
    997346 =C2=B1  0%     -13.7%     861125 =C2=B1  1%  sched_debug.cpu#42.=
avg_idle
   1000000 =C2=B1  0%     -14.2%     857602 =C2=B1  2%  sched_debug.cpu#47.=
avg_idle
   1000000 =C2=B1  0%     -13.8%     862083 =C2=B1  1%  sched_debug.cpu#46.=
avg_idle
   1000000 =C2=B1  0%     -13.5%     864694 =C2=B1  1%  sched_debug.cpu#43.=
avg_idle
      2923 =C2=B1  0%     +17.9%       3447 =C2=B1  4%  sched_debug.cpu#82.=
curr->pid
       839 =C2=B1  0%     +19.0%        998 =C2=B1 17%  sched_debug.cpu#124=
.sched_goidle
       169 =C2=B1  5%     +10.2%        186 =C2=B1  7%  sched_debug.cfs_rq[=
90]:/.tg_runnable_contrib
      3870 =C2=B1 14%     +17.3%       4538 =C2=B1  5%  sched_debug.cpu#27.=
curr->pid
      7791 =C2=B1  5%     +10.0%       8568 =C2=B1  7%  sched_debug.cfs_rq[=
90]:/.avg->runnable_avg_sum
       232 =C2=B1  5%     +14.1%        265 =C2=B1  4%  sched_debug.cfs_rq[=
74]:/.tg_runnable_contrib
      2530 =C2=B1  3%     +13.7%       2877 =C2=B1  6%  numa-vmstat.node5.n=
r_active_file
     10124 =C2=B1  3%     +13.7%      11510 =C2=B1  6%  numa-meminfo.node5.=
Active(file)
      3971 =C2=B1  5%     -17.6%       3271 =C2=B1 16%  sched_debug.cpu#114=
.curr->pid
     10699 =C2=B1  5%     +14.2%      12218 =C2=B1  4%  sched_debug.cfs_rq[=
74]:/.avg->runnable_avg_sum
    998715 =C2=B1  0%     -12.4%     874974 =C2=B1  1%  sched_debug.cpu#53.=
avg_idle
    998753 =C2=B1  0%     -12.5%     873481 =C2=B1  0%  sched_debug.cpu#55.=
avg_idle
    995163 =C2=B1  0%     -11.8%     878062 =C2=B1  1%  sched_debug.cpu#50.=
avg_idle
    997692 =C2=B1  0%     -12.6%     872339 =C2=B1  1%  sched_debug.cpu#56.=
avg_idle
      1072 =C2=B1  4%     -15.6%        904 =C2=B1 10%  sched_debug.cpu#116=
.nr_switches
    996316 =C2=B1  0%     -12.0%     876849 =C2=B1  1%  sched_debug.cpu#52.=
avg_idle
    997489 =C2=B1  0%     -11.9%     878444 =C2=B1  1%  sched_debug.cpu#54.=
avg_idle
         9 =C2=B1  5%     -14.3%          8 =C2=B1  0%  sched_debug.cpu#9.c=
pu_load[3]
         9 =C2=B1  5%     -14.3%          8 =C2=B1  0%  sched_debug.cpu#9.c=
pu_load[2]
    996313 =C2=B1  0%     -12.1%     875903 =C2=B1  2%  sched_debug.cpu#49.=
avg_idle
     15364 =C2=B1  4%     +10.1%      16920 =C2=B1  5%  time.involuntary_co=
ntext_switches
      4429 =C2=B1  7%     -16.8%       3685 =C2=B1 10%  sched_debug.cpu#107=
.curr->pid
    997203 =C2=B1  0%     -11.2%     885706 =C2=B1  1%  sched_debug.cpu#64.=
avg_idle
       737 =C2=B1  3%     +16.7%        860 =C2=B1  5%  time.voluntary_cont=
ext_switches
       283 =C2=B1  9%     +15.9%        328 =C2=B1  3%  sched_debug.cfs_rq[=
26]:/.tg_runnable_contrib
      2554 =C2=B1  1%      +7.6%       2748 =C2=B1  5%  numa-vmstat.node3.n=
r_active_file
     10220 =C2=B1  1%      +7.6%      10994 =C2=B1  5%  numa-meminfo.node3.=
Active(file)
     13013 =C2=B1  9%     +15.9%      15078 =C2=B1  3%  sched_debug.cfs_rq[=
26]:/.avg->runnable_avg_sum
      3896 =C2=B1  6%      +6.6%       4155 =C2=B1  4%  sched_debug.cpu#29.=
curr->pid
    999677 =C2=B1  0%     -10.9%     891066 =C2=B1  0%  sched_debug.cpu#57.=
avg_idle
      2054 =C2=B1  2%     +11.6%       2292 =C2=B1  7%  sched_debug.cpu#125=
.nr_switches
    160853 =C2=B1  4%     +14.8%     184682 =C2=B1  6%  numa-numastat.node1=
.local_node
    996830 =C2=B1  0%     -11.8%     878821 =C2=B1  2%  sched_debug.cpu#97.=
avg_idle
    999553 =C2=B1  0%     -10.4%     895133 =C2=B1  0%  sched_debug.cpu#61.=
avg_idle
    999693 =C2=B1  0%     -10.9%     890366 =C2=B1  1%  sched_debug.cpu#58.=
avg_idle
      4686 =C2=B1  6%     -12.8%       4085 =C2=B1  6%  sched_debug.cpu#58.=
curr->pid
    997785 =C2=B1  0%     -10.9%     889088 =C2=B1  1%  sched_debug.cpu#60.=
avg_idle
    999123 =C2=B1  0%     -10.5%     893883 =C2=B1  0%  sched_debug.cpu#62.=
avg_idle
    989119 =C2=B1  0%     -10.7%     883255 =C2=B1  1%  sched_debug.cpu#51.=
avg_idle
     12980 =C2=B1  8%      +7.5%      13948 =C2=B1  4%  sched_debug.cfs_rq[=
29]:/.avg->runnable_avg_sum
    165070 =C2=B1  4%     +14.4%     188856 =C2=B1  6%  numa-numastat.node1=
.numa_hit
    999487 =C2=B1  0%     -10.5%     894943 =C2=B1  0%  sched_debug.cpu#63.=
avg_idle
        10 =C2=B1  0%     -15.0%          8 =C2=B1  5%  sched_debug.cpu#9.c=
pu_load[1]
       270 =C2=B1  8%     -13.4%        234 =C2=B1  7%  sched_debug.cpu#117=
.ttwu_local
    999055 =C2=B1  0%      -9.4%     904983 =C2=B1  0%  sched_debug.cpu#109=
.avg_idle
   1000000 =C2=B1  0%      -9.2%     907540 =C2=B1  0%  sched_debug.cpu#104=
.avg_idle
   1000000 =C2=B1  0%      -9.8%     902218 =C2=B1  0%  sched_debug.cpu#111=
.avg_idle

lkp-g5: Westmere-EX
Memory: 2048G

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


_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============8515434786370994865==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB3aWxsLWl0LXNjYWxlCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogcHJl
LXRlc3QKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAK
ICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1z
dGF0OiAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0
OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBk
aXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1
cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1ZzoKICAgIGludGVydmFsOiAxMApkZWZh
dWx0X3dhdGNoZG9nczoKICB3YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5v
cjogcGVyZm9ybWFuY2UKY29tbWl0OiAzMDQwYjI0NTYxNjg0ZGE2ZDE3MjIzODllZTNhNjNjZTgx
N2U0NzFhCm1vZGVsOiBHNQpucl9jcHU6IDEyOAptZW1vcnk6IDIwNDhHCnJvb3Rmc19wYXJ0aXRp
b246IApwZXJmLXByb2ZpbGU6CiAgZnJlcTogODAwCndpbGwtaXQtc2NhbGU6CiAgdGVzdDogcmVh
ZHNlZWszCnRlc3Rib3g6IGxrcC1nNQp0Ym94X2dyb3VwOiBsa3AtZzUKa2NvbmZpZzogeDg2XzY0
LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE1LTAyLTE4IDE5OjQ2OjE1LjM0OTYyNDQ5MCArMDg6MDAK
aGVhZF9jb21taXQ6IDMwNDBiMjQ1NjE2ODRkYTZkMTcyMjM4OWVlM2E2M2NlODE3ZTQ3MWEKYmFz
ZV9jb21taXQ6IGJmYTc2ZDQ5NTc2NTk5YTRiOWY5YjdhNzFmMjNkNzNkNmRjZmY3MzUKYnJhbmNo
OiBuZXh0L21hc3RlcgprZXJuZWw6ICIva2VybmVsL3g4Nl82NC1yaGVsLzMwNDBiMjQ1NjE2ODRk
YTZkMTcyMjM4OWVlM2E2M2NlODE3ZTQ3MWEvdm1saW51ei0zLjE5LjAtbmV4dC0yMDE1MDIxOSIK
dXNlcjogbGtwCnF1ZXVlOiBjeWNsaWMKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcu
Y2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC9sa3AtZzUvd2lsbC1pdC1zY2FsZS9wZXJmb3JtYW5j
ZS1yZWFkc2VlazMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC8zMDQw
YjI0NTYxNjg0ZGE2ZDE3MjIzODllZTNhNjNjZTgxN2U0NzFhLzAiCmpvYl9maWxlOiAiL2xrcC9z
Y2hlZHVsZWQvbGtwLWc1L2N5Y2xpY193aWxsLWl0LXNjYWxlLXBlcmZvcm1hbmNlLXJlYWRzZWVr
My14ODZfNjQtcmhlbC1IRUFELTMwNDBiMjQ1NjE2ODRkYTZkMTcyMjM4OWVlM2E2M2NlODE3ZTQ3
MWEtMC0yMDE1MDIxOC0yMzYwMC0xZzZmMjRkLnlhbWwiCmRlcXVldWVfdGltZTogMjAxNS0wMi0y
MCAwNjo0MDo1MS40OTc0NzA3MjAgKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2Zzog
NjEuNzMgMzUuMzUgMTUuMjUgMS8xMDIyIDE3ODM2CnN0YXJ0X3RpbWU6ICcxNDI0Mzg2MDc3Jwpl
bmRfdGltZTogJzE0MjQzODYzOTInCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTUwMjE5LTE4
MjAxNiIK

--===============8515434786370994865==
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
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTIwL2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTIxL2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTIzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTI0L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MTI1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTI2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTI3L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE1L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHUxNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE4L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTkvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyMS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI1
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MjYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MjkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzAvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUzMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTMyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzNC9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTM1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzNy9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTM4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
NDAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHU0MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQyL2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDMvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHU0NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU0Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDkvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1NTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUyL2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU1L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1NTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHU1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU4L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTkv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2MS9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTYyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2NC9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTY1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NjYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2Ny9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTY4L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NjkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU3MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzMvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3
NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTc1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3Ny9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdTc4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1ODAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHU4MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgyL2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1ODMv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU4NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTg1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1ODYvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU4Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTg4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1ODkvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1OTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5MS9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTkyL2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1OTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTk1L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1OTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHU5Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTk4L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
OTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCi4vcnVudGVzdC5weSByZWFkc2VlazMgOCBib3Ro
IDEgOCAxNiAyNCAzMiA0MCA0OCA1NiA2NCA5NiAxMjgK

--===============8515434786370994865==--

