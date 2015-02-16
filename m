Content-Type: multipart/mixed; boundary="===============1490445703859338321=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [SUNRPC] 127b21b89f9: nfs loopback setup: +129.7% fsmark.app_overhead, +14.2% fsmark.time.involuntary_context_switches
Date: Mon, 16 Feb 2015 15:25:14 +0800
Message-ID: <1424071514.11276.5.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1490445703859338321==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 127b21b89f9d8ba0dc23e47b8c35d8a0bac9d6fc ("SUNRPC: Adjust rpciod wor=
kqueue parameters")


testbox/testcase/testparams: nhm4/fsmark/performance-1x-32t-1HDD-xfs-nfsv4-=
5K-400M-fsyncBeforeClose-16d-256fpd

40dd4b7aee1a8c3b  127b21b89f9d8ba0dc23e47b8c  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

   8133446 =C2=B1  0%      -1.3%    8023711 =C2=B1  0%  fsmark.app_overhead
     52620 =C2=B1  0%     +60.6%      84523 =C2=B1  0%  fsmark.time.involun=
tary_context_switches
         5 =C2=B1 37%    +708.7%         46 =C2=B1 16%  sched_debug.cpu#1.c=
pu_load[4]
         7 =C2=B1 47%    +906.9%         73 =C2=B1 46%  sched_debug.cpu#3.c=
pu_load[3]
         7 =C2=B1 33%    +528.6%         44 =C2=B1 21%  sched_debug.cpu#1.c=
pu_load[2]
         6 =C2=B1 32%    +577.8%         45 =C2=B1 19%  sched_debug.cpu#1.c=
pu_load[3]
         7 =C2=B1 39%    +753.6%         59 =C2=B1 27%  sched_debug.cpu#3.c=
pu_load[4]
         8 =C2=B1 39%    +434.4%         42 =C2=B1 41%  sched_debug.cpu#2.c=
pu_load[4]
         7 =C2=B1 29%     -67.7%          2 =C2=B1 34%  sched_debug.cfs_rq[=
1]:/.nr_spread_over
       475 =C2=B1 42%    +264.9%       1733 =C2=B1 17%  sched_debug.cfs_rq[=
2]:/.blocked_load_avg
         9 =C2=B1 46%    +254.1%         32 =C2=B1 42%  sched_debug.cpu#5.c=
pu_load[4]
       495 =C2=B1 41%    +260.8%       1787 =C2=B1 17%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
       450 =C2=B1 26%    +193.5%       1321 =C2=B1 14%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
       440 =C2=B1 29%    +194.7%       1296 =C2=B1 14%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
       586 =C2=B1 30%    +129.7%       1345 =C2=B1 17%  sched_debug.cfs_rq[=
1]:/.blocked_load_avg
       617 =C2=B1 27%    +144.2%       1506 =C2=B1 15%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
       936 =C2=B1 28%     +91.6%       1793 =C2=B1 16%  sched_debug.cfs_rq[=
5]:/.tg_load_contrib
       922 =C2=B1 29%     +92.0%       1771 =C2=B1 16%  sched_debug.cfs_rq[=
5]:/.blocked_load_avg
    144242 =C2=B1 26%     +70.3%     245615 =C2=B1 14%  sched_debug.cpu#3.t=
twu_local
    159375 =C2=B1 23%     +61.9%     257969 =C2=B1 13%  sched_debug.cpu#3.s=
ched_goidle
      1754 =C2=B1 29%     +61.0%       2824 =C2=B1 24%  sched_debug.cfs_rq[=
0]:/.blocked_load_avg
    171393 =C2=B1 22%     +59.6%     273569 =C2=B1 13%  sched_debug.cpu#3.t=
twu_count
    346764 =C2=B1 22%     +58.3%     548977 =C2=B1 13%  sched_debug.cpu#3.n=
r_switches
    346840 =C2=B1 22%     +58.3%     549053 =C2=B1 13%  sched_debug.cpu#3.s=
ched_count
      1975 =C2=B1 19%     +50.7%       2976 =C2=B1 19%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
     17240 =C2=B1 12%     +37.6%      23728 =C2=B1  8%  sched_debug.cpu#3.n=
r_load_updates
     52620 =C2=B1  0%     +60.6%      84523 =C2=B1  0%  time.involuntary_co=
ntext_switches
      9440 =C2=B1  6%     +61.6%      15259 =C2=B1  5%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
      5200 =C2=B1 16%     +49.2%       7759 =C2=B1 18%  sched_debug.cfs_rq[=
3]:/.min_vruntime
      9394 =C2=B1  6%     +60.8%      15110 =C2=B1  6%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
      9408 =C2=B1  6%     +62.2%      15260 =C2=B1  5%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
      9387 =C2=B1  6%     +59.8%      14999 =C2=B1  7%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
      9370 =C2=B1  6%     +59.7%      14961 =C2=B1  6%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
      9371 =C2=B1  6%     +58.3%      14832 =C2=B1  7%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
      9389 =C2=B1  6%     +59.0%      14924 =C2=B1  6%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
      9391 =C2=B1  6%     +59.1%      14937 =C2=B1  6%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
      2492 =C2=B1 10%     +22.8%       3059 =C2=B1  8%  sched_debug.cfs_rq[=
3]:/.exec_clock
    654180 =C2=B1 10%     -17.6%     539086 =C2=B1 10%  sched_debug.cpu#3.a=
vg_idle
        67 =C2=B1 22%     +29.9%         88 =C2=B1  4%  sched_debug.cfs_rq[=
3]:/.tg_runnable_contrib
    610001 =C2=B1  7%     -18.3%     498400 =C2=B1  8%  sched_debug.cpu#0.a=
vg_idle
    132930 =C2=B1 23%     +39.8%     185843 =C2=B1  4%  sched_debug.cpu#2.t=
twu_local
      4543 =C2=B1 14%     +34.5%       6112 =C2=B1  4%  sched_debug.cfs_rq[=
2]:/.min_vruntime
    161157 =C2=B1 19%     +33.0%     214350 =C2=B1  3%  sched_debug.cpu#2.t=
twu_count
    148740 =C2=B1 20%     +33.5%     198618 =C2=B1  3%  sched_debug.cpu#2.s=
ched_goidle
    325967 =C2=B1 19%     +32.1%     430669 =C2=B1  3%  sched_debug.cpu#2.n=
r_switches
    326041 =C2=B1 19%     +32.1%     430744 =C2=B1  3%  sched_debug.cpu#2.s=
ched_count
     17437 =C2=B1 14%     +21.7%      21219 =C2=B1  8%  sched_debug.cpu#2.n=
r_load_updates
      3598 =C2=B1  7%     +14.9%       4134 =C2=B1  5%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
      3338 =C2=B1  8%     +18.6%       3959 =C2=B1  9%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
      1018 =C2=B1 31%     -23.9%        775 =C2=B1  2%  sched_debug.cfs_rq[=
4]:/.exec_clock
        72 =C2=B1  8%     +18.3%         85 =C2=B1  9%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
      8293 =C2=B1 45%     -30.4%       5770 =C2=B1  4%  sched_debug.cpu#4.n=
r_load_updates
      2420 =C2=B1  7%     +13.7%       2752 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.exec_clock
      9386 =C2=B1  1%      +2.3%       9598 =C2=B1  1%  vmstat.io.bo
     40903 =C2=B1  0%      +2.6%      41951 =C2=B1  0%  vmstat.system.cs

testbox/testcase/testparams: nhm4/fsmark/performance-1x-32t-1HDD-xfs-nfsv4-=
16MB-60G-NoSync-16d-256fpd

40dd4b7aee1a8c3b  127b21b89f9d8ba0dc23e47b8c  =

----------------  --------------------------  =

  50440392 =C2=B1  6%    +129.7%  1.158e+08 =C2=B1  8%  fsmark.app_overhead
    226074 =C2=B1  0%     +14.2%     258118 =C2=B1  0%  fsmark.time.involun=
tary_context_switches
         8 =C2=B1  5%     +21.2%         10 =C2=B1  0%  fsmark.time.percent=
_of_cpu_this_job_got
     60.69 =C2=B1  0%     +13.5%      68.86 =C2=B1  0%  fsmark.time.system_=
time
   2523773 =C2=B1  0%      +1.4%    2558878 =C2=B1  0%  fsmark.time.volunta=
ry_context_switches
         8 =C2=B1 39%    +188.2%         24 =C2=B1 24%  sched_debug.cpu#2.c=
pu_load[3]
         8 =C2=B1 31%    +197.1%         25 =C2=B1 13%  sched_debug.cpu#2.c=
pu_load[4]
    283664 =C2=B1 13%    +237.6%     957681 =C2=B1  7%  proc-vmstat.pgsteal=
_direct_dma32
     30933 =C2=B1 17%    +205.1%      94381 =C2=B1 30%  sched_debug.cpu#5.t=
twu_local
      2119 =C2=B1 14%    +231.0%       7014 =C2=B1  7%  proc-vmstat.allocst=
all
        16 =C2=B1 36%     +59.1%         26 =C2=B1  3%  sched_debug.cpu#0.c=
pu_load[4]
        18 =C2=B1 30%     +85.3%         34 =C2=B1 26%  sched_debug.cpu#5.c=
pu_load[4]
    213724 =C2=B1  4%     +22.0%     260658 =C2=B1 17%  sched_debug.cpu#6.t=
twu_count
    330125 =C2=B1 12%    +195.4%     975107 =C2=B1  8%  proc-vmstat.pgscan_=
direct_dma32
       471 =C2=B1 49%    +156.7%       1210 =C2=B1 34%  sched_debug.cpu#1.c=
urr->pid
      1717 =C2=B1 11%    +131.8%       3981 =C2=B1  2%  proc-vmstat.nr_dirty
       217 =C2=B1  9%    +136.3%        514 =C2=B1 13%  sched_debug.cfs_rq[=
1]:/.blocked_load_avg
       229 =C2=B1 10%    +138.3%        546 =C2=B1 18%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
      7162 =C2=B1 13%    +121.3%      15849 =C2=B1  1%  meminfo.Dirty
       521 =C2=B1 11%     +81.3%        945 =C2=B1 19%  sched_debug.cfs_rq[=
5]:/.tg_load_contrib
       506 =C2=B1 12%     +84.3%        932 =C2=B1 19%  sched_debug.cfs_rq[=
5]:/.blocked_load_avg
         3 =C2=B1  0%     +66.7%          5 =C2=B1  0%  vmstat.procs.b
       537 =C2=B1 20%     +37.6%        739 =C2=B1 10%  sched_debug.cfs_rq[=
0]:/.blocked_load_avg
       574 =C2=B1 19%     +41.1%        810 =C2=B1 12%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
       195 =C2=B1  6%     -33.7%        129 =C2=B1 11%  sched_debug.cpu#0.n=
r_uninterruptible
    226074 =C2=B1  0%     +14.2%     258118 =C2=B1  0%  time.involuntary_co=
ntext_switches
  29991075 =C2=B1 14%     -22.0%   23379253 =C2=B1 19%  cpuidle.POLL.time
     54075 =C2=B1  2%     +42.5%      77063 =C2=B1  1%  meminfo.Writeback
      3770 =C2=B1  6%     +51.9%       5725 =C2=B1  8%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
      3762 =C2=B1  6%     +50.0%       5645 =C2=B1  7%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
      3768 =C2=B1  6%     +50.9%       5687 =C2=B1  7%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
      3767 =C2=B1  6%     +49.3%       5624 =C2=B1  7%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
      3756 =C2=B1  6%     +48.7%       5585 =C2=B1  8%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
      3762 =C2=B1  6%     +48.9%       5602 =C2=B1  8%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
      3762 =C2=B1  6%     +48.6%       5591 =C2=B1  8%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
      3761 =C2=B1  6%     +50.1%       5647 =C2=B1  7%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
     13632 =C2=B1  3%     +40.9%      19210 =C2=B1  1%  proc-vmstat.nr_writ=
eback
     10367 =C2=B1  3%     +29.3%      13406 =C2=B1  9%  sched_debug.cfs_rq[=
6]:/.min_vruntime
     89961 =C2=B1  1%     +35.0%     121410 =C2=B1  1%  meminfo.NFS_Unstable
     22527 =C2=B1  1%     +35.6%      30545 =C2=B1  1%  proc-vmstat.nr_unst=
able
    207975 =C2=B1  0%     +34.6%     280001 =C2=B1  8%  sched_debug.cpu#5.t=
twu_count
     10227 =C2=B1  4%     +30.6%      13360 =C2=B1  2%  sched_debug.cfs_rq[=
5]:/.min_vruntime
    143095 =C2=B1  4%     -25.8%     106195 =C2=B1  4%  proc-vmstat.pgactiv=
ate
    759903 =C2=B1 15%     +19.2%     905820 =C2=B1 13%  sched_debug.cpu#0.n=
r_switches
    760233 =C2=B1 15%     +19.2%     906200 =C2=B1 13%  sched_debug.cpu#0.s=
ched_count
       589 =C2=B1  7%     +27.7%        753 =C2=B1  8%  sched_debug.cfs_rq[=
4]:/.blocked_load_avg
         8 =C2=B1  5%     +21.2%         10 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
      3703 =C2=B1  5%     +41.5%       5241 =C2=B1 31%  proc-vmstat.pgsteal=
_kswapd_dma
       613 =C2=B1  6%     +27.1%        779 =C2=B1  9%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
     18002 =C2=B1  9%     +24.5%      22412 =C2=B1 10%  sched_debug.cfs_rq[=
0]:/.min_vruntime
      4051 =C2=B1  4%     +38.7%       5619 =C2=B1 29%  proc-vmstat.pgscan_=
kswapd_dma
       570 =C2=B1 16%     +30.2%        742 =C2=B1 19%  sched_debug.cfs_rq[=
7]:/.tg_load_contrib
     67791 =C2=B1  3%     -20.1%      54186 =C2=B1  9%  proc-vmstat.kswapd_=
inodesteal
      2168 =C2=B1  1%     +22.0%       2645 =C2=B1  0%  slabinfo.kmalloc-12=
8.active_slabs
      2168 =C2=B1  1%     +22.0%       2645 =C2=B1  0%  slabinfo.kmalloc-12=
8.num_slabs
     69411 =C2=B1  1%     +22.0%      84660 =C2=B1  0%  slabinfo.kmalloc-12=
8.num_objs
        13 =C2=B1 23%     -44.4%          7 =C2=B1 34%  sched_debug.cfs_rq[=
0]:/.nr_spread_over
     66478 =C2=B1  1%     +18.6%      78816 =C2=B1  0%  slabinfo.kmalloc-12=
8.active_objs
      0.50 =C2=B1  3%     +14.0%       0.57 =C2=B1  5%  time.user_time
      4983 =C2=B1  4%     +31.3%       6541 =C2=B1 26%  proc-vmstat.pgalloc=
_dma
     60407 =C2=B1  3%     -15.5%      51037 =C2=B1  3%  proc-vmstat.nr_acti=
ve_file
    241585 =C2=B1  3%     -15.5%     204154 =C2=B1  3%  meminfo.Active(file)
       536 =C2=B1  3%     -13.1%        466 =C2=B1  2%  proc-vmstat.kswapd_=
high_wmark_hit_quickly
      3892 =C2=B1 18%     -22.4%       3018 =C2=B1  0%  uptime.idle
    264741 =C2=B1  3%     -13.8%     228127 =C2=B1  3%  meminfo.Active
     60.69 =C2=B1  0%     +13.5%      68.86 =C2=B1  0%  time.system_time
     11151 =C2=B1  6%     +19.0%      13267 =C2=B1  1%  sched_debug.cfs_rq[=
4]:/.min_vruntime
    500911 =C2=B1  1%     -10.7%     447478 =C2=B1  0%  cpuidle.C6-NHM.usage
 4.834e+08 =C2=B1  3%     +11.3%   5.38e+08 =C2=B1  2%  cpuidle.C3-NHM.time
     19446 =C2=B1  0%      +0.9%      19618 =C2=B1  0%  vmstat.system.cs

testbox/testcase/testparams: nhm4/fsmark/performance-1x-32t-1HDD-xfs-nfsv4-=
8K-400M-fsyncBeforeClose-16d-256fpd

40dd4b7aee1a8c3b  127b21b89f9d8ba0dc23e47b8c  =

----------------  --------------------------  =

     33823 =C2=B1  0%     +56.8%      53052 =C2=B1  0%  fsmark.time.involun=
tary_context_switches
     49306 =C2=B1 44%     -75.7%      11963 =C2=B1 24%  sched_debug.cpu#6.s=
ched_goidle
         1 =C2=B1 34%    +440.0%          6 =C2=B1 46%  sched_debug.cfs_rq[=
4]:/.nr_spread_over
    105610 =C2=B1 41%     -69.9%      31780 =C2=B1 17%  sched_debug.cpu#6.n=
r_switches
    105651 =C2=B1 41%     -69.9%      31817 =C2=B1 17%  sched_debug.cpu#6.s=
ched_count
        11 =C2=B1 20%     -47.7%          5 =C2=B1 33%  sched_debug.cfs_rq[=
1]:/.nr_spread_over
     44125 =C2=B1 49%     -82.9%       7541 =C2=B1 41%  sched_debug.cpu#6.t=
twu_local
     51122 =C2=B1 42%     -71.1%      14769 =C2=B1 19%  sched_debug.cpu#6.t=
twu_count
      5455 =C2=B1 26%     -45.5%       2974 =C2=B1  5%  sched_debug.cpu#6.n=
r_load_updates
       800 =C2=B1 34%    +148.9%       1991 =C2=B1 37%  sched_debug.cfs_rq[=
0]:/.blocked_load_avg
      1031 =C2=B1 26%    +114.1%       2209 =C2=B1 34%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
         8 =C2=B1 32%     +45.7%         12 =C2=B1 18%  sched_debug.cfs_rq[=
2]:/.nr_spread_over
     33823 =C2=B1  0%     +56.8%      53052 =C2=B1  0%  time.involuntary_co=
ntext_switches
     10789 =C2=B1  9%     +25.4%      13532 =C2=B1  5%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
     10783 =C2=B1  9%     +25.2%      13497 =C2=B1  5%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
     10777 =C2=B1  9%     +25.2%      13494 =C2=B1  5%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
     10799 =C2=B1  9%     +24.9%      13490 =C2=B1  5%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
     10734 =C2=B1  9%     +25.4%      13456 =C2=B1  5%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
     10743 =C2=B1  9%     +25.6%      13495 =C2=B1  5%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
     10743 =C2=B1  9%     +25.7%      13502 =C2=B1  5%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
     10798 =C2=B1  9%     +24.8%      13481 =C2=B1  5%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
       796 =C2=B1 14%     -21.0%        629 =C2=B1  5%  sched_debug.cfs_rq[=
6]:/.exec_clock
      2161 =C2=B1 17%     -25.4%       1612 =C2=B1  5%  sched_debug.cfs_rq[=
6]:/.min_vruntime
    297542 =C2=B1  9%     -22.0%     232177 =C2=B1 17%  sched_debug.cpu#0.n=
r_switches
    297589 =C2=B1  9%     -22.0%     232227 =C2=B1 17%  sched_debug.cpu#0.s=
ched_count
      1901 =C2=B1  8%     +23.2%       2342 =C2=B1 10%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
      7060 =C2=B1 10%     -13.3%       6122 =C2=B1  7%  sched_debug.cfs_rq[=
0]:/.min_vruntime
    748854 =C2=B1  5%     -20.0%     599063 =C2=B1  6%  sched_debug.cpu#0.a=
vg_idle
      1851 =C2=B1  6%     +24.1%       2298 =C2=B1 10%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
    140093 =C2=B1  9%     -23.4%     107299 =C2=B1 19%  sched_debug.cpu#0.t=
twu_local
    141664 =C2=B1  9%     -23.0%     109136 =C2=B1 18%  sched_debug.cpu#0.s=
ched_goidle
        52 =C2=B1 13%     +29.7%         67 =C2=B1  2%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
      2440 =C2=B1 13%     +28.1%       3126 =C2=B1  2%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
    165266 =C2=B1  8%     -19.5%     133017 =C2=B1 15%  sched_debug.cpu#0.t=
twu_count
     17128 =C2=B1  5%     -14.3%      14673 =C2=B1  8%  sched_debug.cpu#0.n=
r_load_updates
     34290 =C2=B1  0%      +2.0%      34989 =C2=B1  0%  vmstat.system.cs

nhm4: Nehalem
Memory: 4G

                          time.involuntary_context_switches

  60000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  55000 O+OO O O OO O OO O OO O O OO O OO O OO O O OO O OO O OO O O OO     =
 |
        |                                                              O OO=
 O
        |                                                                  =
 |
  50000 ++                                                                 =
 |
        |                                                                  =
 |
  45000 ++                                                                 =
 |
        |                                                                  =
 |
  40000 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  35000 ++*   .*.**.*.* .*.**.   .**.*.  .*.* .*.*.      *. .**.*.*.*      =
 |
        *  *.*         *      *.*      **    *     **.*.*  *               =
 |
  30000 ++-----------------------------------------------------------------=
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


_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============1490445703859338321==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBmc21hcmsKZGVmYXVsdC1tb25pdG9yczoKICB3YWl0OiBwcmUtdGVzdAog
IHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0YXQ6IAogIG51bWEt
dm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBwcm9jLXN0YXQ6IAog
IG1lbWluZm86IAogIHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAogIGxh
dGVuY3lfc3RhdHM6IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tzdGF0
czogCiAgbmZzc3RhdDogCiAgY3B1aWRsZTogCiAgY3B1ZnJlcS1zdGF0czogCiAgdHVyYm9zdGF0
OiAKICBwbWV0ZXI6IAogIHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDEwCmRlZmF1bHRfd2F0
Y2hkb2dzOgogIHdhdGNoLW9vbTogCiAgd2F0Y2hkb2c6IApjcHVmcmVxX2dvdmVybm9yOiBwZXJm
b3JtYW5jZQpjb21taXQ6IGVhMmJiZTNiOWJmOTMwNDA4ZGIyMDUzNDRmZTEwYzhmNzE5YmE3MzgK
bW9kZWw6IE5laGFsZW0KbnJfY3B1OiA4Cm1lbW9yeTogNEcKaGRkX3BhcnRpdGlvbnM6ICIvZGV2
L2Rpc2svYnktaWQvYXRhLVdEQ19XRDEwMDNGQllaLTAxMEZCMF9XRC1XQ0FXMzY4MTIwNDEtcGFy
dDEiCnN3YXBfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtV0RDX1dEMTAwM0ZCWVot
MDEwRkIwX1dELVdDQVczNjgxMjA0MS1wYXJ0MiIKcm9vdGZzX3BhcnRpdGlvbjogIi9kZXYvZGlz
ay9ieS1pZC9hdGEtV0RDX1dEMTAwM0ZCWVotMDEwRkIwX1dELVdDQVczNjgxMjA0MS1wYXJ0MyIK
bmV0Y29uc29sZV9wb3J0OiA2NjQ5Cml0ZXJhdGlvbnM6IDF4Cm5yX3RocmVhZHM6IDMydApkaXNr
OiAxSERECmZzOiB4ZnMKZnMyOiBuZnN2NApmc21hcms6CiAgZmlsZXNpemU6IDhLCiAgdGVzdF9z
aXplOiA0MDBNCiAgc3luY19tZXRob2Q6IGZzeW5jQmVmb3JlQ2xvc2UKICBucl9kaXJlY3Rvcmll
czogMTZkCiAgbnJfZmlsZXNfcGVyX2RpcmVjdG9yeTogMjU2ZnBkCnRlc3Rib3g6IG5obTQKdGJv
eF9ncm91cDogbmhtNAprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTUtMDIt
MTIgMDY6MTg6MzIuNzIyMjgyMzY1ICswODowMApoZWFkX2NvbW1pdDogZWEyYmJlM2I5YmY5MzA0
MDhkYjIwNTM0NGZlMTBjOGY3MTliYTczOApiYXNlX2NvbW1pdDogYmZhNzZkNDk1NzY1OTlhNGI5
ZjliN2E3MWYyM2Q3M2Q2ZGNmZjczNQpicmFuY2g6IGxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0y
MDE1MDIxNDIzCmtlcm5lbDogIi9rZXJuZWwveDg2XzY0LXJoZWwvZWEyYmJlM2I5YmY5MzA0MDhk
YjIwNTM0NGZlMTBjOGY3MTliYTczOC92bWxpbnV6LTMuMTkuMC1nZWEyYmJlMyIKdXNlcjogbGtw
CnF1ZXVlOiBjeWNsaWMKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CnJlc3Vs
dF9yb290OiAiL3Jlc3VsdC9uaG00L2ZzbWFyay9wZXJmb3JtYW5jZS0xeC0zMnQtMUhERC14ZnMt
bmZzdjQtOEstNDAwTS1mc3luY0JlZm9yZUNsb3NlLTE2ZC0yNTZmcGQvZGViaWFuLXg4Nl82NC0y
MDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9lYTJiYmUzYjliZjkzMDQwOGRiMjA1MzQ0ZmUxMGM4
ZjcxOWJhNzM4LzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvbmhtNC9jeWNsaWNfZnNtYXJr
LXBlcmZvcm1hbmNlLTF4LTMydC0xSERELXhmcy1uZnN2NC04Sy00MDBNLWZzeW5jQmVmb3JlQ2xv
c2UtMTZkLTI1NmZwZC14ODZfNjQtcmhlbC1IRUFELWVhMmJiZTNiOWJmOTMwNDA4ZGIyMDUzNDRm
ZTEwYzhmNzE5YmE3MzgtMC0yMDE1MDIxMi05MTM2Ni0xeDBxbmMxLnlhbWwiCmRlcXVldWVfdGlt
ZTogMjAxNS0wMi0xNSAwNDowMDowOS43MTM0Mzc5OTEgKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNo
ZWQKbG9hZGF2ZzogMjIuNDIgMTAuNjAgNC4wMyAxLzE3NSAyOTc5CnN0YXJ0X3RpbWU6ICcxNDIz
OTQ0MDM3JwplbmRfdGltZTogJzE0MjM5NDQxNjUnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIw
MTUwMjEzLTA5NDg0NiIK

--===============1490445703859338321==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

bWtmcyAtdCB4ZnMgL2Rldi9zZGExCm1vdW50IC10IHhmcyAtbyBub2JhcnJpZXIsaW5vZGU2NCAv
ZGV2L3NkYTEgL2ZzL3NkYTEKL2V0Yy9pbml0LmQvcnBjYmluZCBzdGFydAovZXRjL2luaXQuZC9u
ZnMtY29tbW9uIHN0YXJ0Ci9ldGMvaW5pdC5kL25mcy1rZXJuZWwtc2VydmVyIHN0YXJ0Cm1vdW50
IC10IG5mcyAtbyB2ZXJzPTQgbG9jYWxob3N0Oi9mcy9zZGExIC9uZnMvc2RhMQouL2ZzX21hcmsg
LWQgL25mcy9zZGExLzEgLWQgL25mcy9zZGExLzIgLWQgL25mcy9zZGExLzMgLWQgL25mcy9zZGEx
LzQgLWQgL25mcy9zZGExLzUgLWQgL25mcy9zZGExLzYgLWQgL25mcy9zZGExLzcgLWQgL25mcy9z
ZGExLzggLWQgL25mcy9zZGExLzkgLWQgL25mcy9zZGExLzEwIC1kIC9uZnMvc2RhMS8xMSAtZCAv
bmZzL3NkYTEvMTIgLWQgL25mcy9zZGExLzEzIC1kIC9uZnMvc2RhMS8xNCAtZCAvbmZzL3NkYTEv
MTUgLWQgL25mcy9zZGExLzE2IC1kIC9uZnMvc2RhMS8xNyAtZCAvbmZzL3NkYTEvMTggLWQgL25m
cy9zZGExLzE5IC1kIC9uZnMvc2RhMS8yMCAtZCAvbmZzL3NkYTEvMjEgLWQgL25mcy9zZGExLzIy
IC1kIC9uZnMvc2RhMS8yMyAtZCAvbmZzL3NkYTEvMjQgLWQgL25mcy9zZGExLzI1IC1kIC9uZnMv
c2RhMS8yNiAtZCAvbmZzL3NkYTEvMjcgLWQgL25mcy9zZGExLzI4IC1kIC9uZnMvc2RhMS8yOSAt
ZCAvbmZzL3NkYTEvMzAgLWQgL25mcy9zZGExLzMxIC1kIC9uZnMvc2RhMS8zMiAtRCAxNiAtTiAy
NTYgLW4gMTYwMCAtTCAxIC1TIDEgLXMgODE5Mgo=

--===============1490445703859338321==--

