Content-Type: multipart/mixed; boundary="===============8096290766990995793=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [locking/mutex] 07d2413a61d: -3.6% unixbench.score +60.8% unixbench.time.system_time
Date: Tue, 17 Mar 2015 13:50:27 +0800
Message-ID: <1426571427.5570.8.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8096290766990995793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit 07d2413a61db6500f58e614e873eed79d7f2ed72 ("locking/mutex: In mutex_s=
pin_on_owner(), return true when owner changes")


testbox/testcase/testparams: lituya/unixbench/performance-fsdisk

d6abfdb2022368d8  07d2413a61db6500f58e614e87  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

     10131 =C2=B1  1%      -3.6%       9770 =C2=B1  0%  unixbench.score
      1049 =C2=B1 18%     +60.8%       1687 =C2=B1  0%  unixbench.time.syst=
em_time
      7144 =C2=B1 30%    +203.6%      21686 =C2=B1  3%  unixbench.time.invo=
luntary_context_switches
  24573900 =C2=B1 19%     -93.9%    1497516 =C2=B1  8%  unixbench.time.volu=
ntary_context_switches
       369 =C2=B1 18%     +59.5%        589 =C2=B1  0%  unixbench.time.perc=
ent_of_cpu_this_job_got
      3849 =C2=B1  5%     -17.9%       3159 =C2=B1  0%  uptime.idle
      4060 =C2=B1  0%     +25.3%       5087 =C2=B1 20%  meminfo.AnonHugePag=
es
         3 =C2=B1 23%     +66.7%          5 =C2=B1  0%  vmstat.procs.r
    174876 =C2=B1 18%     -90.7%      16282 =C2=B1  5%  vmstat.system.cs
     87032 =C2=B1  9%     -48.9%      44484 =C2=B1  2%  softirqs.RCU
    213221 =C2=B1  5%     -79.7%      43210 =C2=B1  0%  softirqs.SCHED
    551372 =C2=B1 17%     +60.8%     886553 =C2=B1  0%  softirqs.TIMER
      7144 =C2=B1 30%    +203.6%      21686 =C2=B1  3%  time.involuntary_co=
ntext_switches
       369 =C2=B1 18%     +59.5%        589 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
      1049 =C2=B1 18%     +60.8%       1687 =C2=B1  0%  time.system_time
  24573900 =C2=B1 19%     -93.9%    1497516 =C2=B1  8%  time.voluntary_cont=
ext_switches
     23.55 =C2=B1 17%     +57.3%      37.05 =C2=B1  0%  turbostat.%Busy
       779 =C2=B1 17%     +57.1%       1223 =C2=B1  0%  turbostat.Avg_MHz
     22.32 =C2=B1 18%     -61.6%       8.56 =C2=B1  4%  turbostat.CPU%c1
     42.53 =C2=B1  2%      +5.6%      44.92 =C2=B1  0%  turbostat.PkgWatt
      0.57 =C2=B1  7%      +7.5%       0.61 =C2=B1  1%  turbostat.RAMWatt
  21474227 =C2=B1 18%     -93.7%    1361886 =C2=B1  8%  cpuidle.C1-HSW.usage
 6.755e+08 =C2=B1 27%     -89.6%   70473442 =C2=B1 17%  cpuidle.C1-HSW.time
     26571 =C2=B1 25%     -92.8%       1917 =C2=B1  4%  cpuidle.C3-HSW.usage
    117581 =C2=B1 21%     -64.5%      41794 =C2=B1  1%  cpuidle.C6-HSW.usage
      1439 =C2=B1 28%     -88.0%        173 =C2=B1 43%  cpuidle.POLL.time
       524 =C2=B1 17%     -90.9%         47 =C2=B1 24%  cpuidle.POLL.usage
      4546 =C2=B1 15%     +46.3%       6651 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
       246 =C2=B1 25%     +55.4%        382 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
    157742 =C2=B1 23%    +129.0%     361183 =C2=B1  6%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     15438 =C2=B1 14%     +63.1%      25172 =C2=B1  9%  sched_debug.cfs_rq[=
0]:/.exec_clock
     11297 =C2=B1 25%     +54.9%      17499 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
      4559 =C2=B1 15%     +46.3%       6669 =C2=B1  2%  sched_debug.cfs_rq[=
10]:/.tg->runnable_avg
         9 =C2=B1 35%     +84.2%         17 =C2=B1 15%  sched_debug.cfs_rq[=
10]:/.runnable_load_avg
     11563 =C2=B1 18%     +57.7%      18232 =C2=B1 10%  sched_debug.cfs_rq[=
10]:/.avg->runnable_avg_sum
     12727 =C2=B1 13%     +73.8%      22116 =C2=B1  4%  sched_debug.cfs_rq[=
10]:/.exec_clock
       251 =C2=B1 18%     +58.1%        397 =C2=B1 10%  sched_debug.cfs_rq[=
10]:/.tg_runnable_contrib
    152419 =C2=B1 21%    +131.9%     353450 =C2=B1  4%  sched_debug.cfs_rq[=
10]:/.min_vruntime
      4559 =C2=B1 15%     +46.3%       6669 =C2=B1  2%  sched_debug.cfs_rq[=
11]:/.tg->runnable_avg
        66 =C2=B1 19%     -73.1%         17 =C2=B1 30%  sched_debug.cfs_rq[=
12]:/.runnable_load_avg
      4560 =C2=B1 15%     +46.3%       6672 =C2=B1  2%  sched_debug.cfs_rq[=
12]:/.tg->runnable_avg
        78 =C2=B1 22%     -75.1%         19 =C2=B1 31%  sched_debug.cfs_rq[=
12]:/.load
    151608 =C2=B1 21%    +158.0%     391137 =C2=B1 20%  sched_debug.cfs_rq[=
13]:/.min_vruntime
       272 =C2=B1 23%     +58.3%        431 =C2=B1 11%  sched_debug.cfs_rq[=
13]:/.tg_runnable_contrib
     12552 =C2=B1 13%    +119.5%      27556 =C2=B1 37%  sched_debug.cfs_rq[=
13]:/.exec_clock
      4557 =C2=B1 15%     +46.4%       6674 =C2=B1  2%  sched_debug.cfs_rq[=
13]:/.tg->runnable_avg
     12507 =C2=B1 23%     +58.0%      19763 =C2=B1 11%  sched_debug.cfs_rq[=
13]:/.avg->runnable_avg_sum
       314 =C2=B1  8%     +49.8%        471 =C2=B1 28%  sched_debug.cfs_rq[=
14]:/.tg_runnable_contrib
      4558 =C2=B1 15%     +46.4%       6675 =C2=B1  2%  sched_debug.cfs_rq[=
14]:/.tg->runnable_avg
    152171 =C2=B1 21%    +187.6%     437699 =C2=B1 32%  sched_debug.cfs_rq[=
14]:/.min_vruntime
     14442 =C2=B1  8%     +49.7%      21618 =C2=B1 28%  sched_debug.cfs_rq[=
14]:/.avg->runnable_avg_sum
     11538 =C2=B1 16%     +51.7%      17502 =C2=B1  1%  sched_debug.cfs_rq[=
15]:/.avg->runnable_avg_sum
       252 =C2=B1 16%     +51.6%        382 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg_runnable_contrib
    152080 =C2=B1 21%    +132.5%     353587 =C2=B1  4%  sched_debug.cfs_rq[=
15]:/.min_vruntime
      4560 =C2=B1 15%     +46.4%       6675 =C2=B1  2%  sched_debug.cfs_rq[=
15]:/.tg->runnable_avg
     13692 =C2=B1 10%     +71.8%      23520 =C2=B1  4%  sched_debug.cfs_rq[=
15]:/.exec_clock
     12631 =C2=B1 21%     +59.3%      20127 =C2=B1 17%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
        10 =C2=B1 27%    +166.7%         28 =C2=B1 33%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
       275 =C2=B1 21%     +59.2%        438 =C2=B1 17%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
      4548 =C2=B1 15%     +46.2%       6651 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
    166428 =C2=B1 20%    +136.5%     393659 =C2=B1 14%  sched_debug.cfs_rq[=
1]:/.min_vruntime
     14633 =C2=B1 11%    +100.7%      29361 =C2=B1 34%  sched_debug.cfs_rq[=
1]:/.exec_clock
      4547 =C2=B1 15%     +46.3%       6653 =C2=B1  2%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
    170439 =C2=B1 20%    +114.8%     366033 =C2=B1  3%  sched_debug.cfs_rq[=
2]:/.min_vruntime
     11846 =C2=B1 18%     +57.9%      18702 =C2=B1  6%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
     15344 =C2=B1 14%     +58.9%      24380 =C2=B1  2%  sched_debug.cfs_rq[=
2]:/.exec_clock
       258 =C2=B1 18%     +57.9%        408 =C2=B1  6%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
    168070 =C2=B1 16%    +114.7%     360822 =C2=B1  4%  sched_debug.cfs_rq[=
3]:/.min_vruntime
     11531 =C2=B1 18%     +51.7%      17496 =C2=B1  1%  sched_debug.cfs_rq[=
3]:/.avg->runnable_avg_sum
       251 =C2=B1 18%     +52.3%        383 =C2=B1  1%  sched_debug.cfs_rq[=
3]:/.tg_runnable_contrib
       388 =C2=B1 29%     -68.0%        124 =C2=B1 25%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
       365 =C2=B1 30%     -72.7%         99 =C2=B1 33%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
      4548 =C2=B1 15%     +46.3%       6655 =C2=B1  2%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
     14874 =C2=B1  7%     +57.8%      23470 =C2=B1  4%  sched_debug.cfs_rq[=
3]:/.exec_clock
       247 =C2=B1 12%     +55.3%        383 =C2=B1  3%  sched_debug.cfs_rq[=
4]:/.tg_runnable_contrib
     11274 =C2=B1 12%     +56.0%      17584 =C2=B1  3%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum
      4549 =C2=B1 15%     +46.3%       6657 =C2=B1  2%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
     14121 =C2=B1  9%     +65.6%      23381 =C2=B1  4%  sched_debug.cfs_rq[=
4]:/.exec_clock
    160686 =C2=B1 17%    +124.3%     360493 =C2=B1  4%  sched_debug.cfs_rq[=
4]:/.min_vruntime
     11730 =C2=B1 14%     +73.2%      20318 =C2=B1 17%  sched_debug.cfs_rq[=
5]:/.avg->runnable_avg_sum
      4550 =C2=B1 15%     +46.3%       6658 =C2=B1  2%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
    161214 =C2=B1 21%    +173.5%     440993 =C2=B1 37%  sched_debug.cfs_rq[=
5]:/.min_vruntime
       256 =C2=B1 14%     +73.0%        443 =C2=B1 17%  sched_debug.cfs_rq[=
5]:/.tg_runnable_contrib
      4550 =C2=B1 15%     +46.4%       6662 =C2=B1  2%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
     14431 =C2=B1 13%     +31.6%      18997 =C2=B1  9%  sched_debug.cfs_rq[=
6]:/.avg->runnable_avg_sum
    187106 =C2=B1 33%     +97.8%     370045 =C2=B1  5%  sched_debug.cfs_rq[=
6]:/.min_vruntime
       314 =C2=B1 13%     +32.0%        415 =C2=B1  9%  sched_debug.cfs_rq[=
6]:/.tg_runnable_contrib
        13 =C2=B1 35%    +132.1%         30 =C2=B1 40%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
    161563 =C2=B1 22%    +124.0%     361967 =C2=B1  3%  sched_debug.cfs_rq[=
7]:/.min_vruntime
      4552 =C2=B1 15%     +46.4%       6663 =C2=B1  2%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
       257 =C2=B1 16%     +48.4%        381 =C2=B1  2%  sched_debug.cfs_rq[=
7]:/.tg_runnable_contrib
         3 =C2=B1 13%     -53.8%          1 =C2=B1 33%  sched_debug.cfs_rq[=
7]:/.nr_spread_over
     14448 =C2=B1 18%     +63.8%      23661 =C2=B1  2%  sched_debug.cfs_rq[=
7]:/.exec_clock
     11755 =C2=B1 16%     +48.6%      17474 =C2=B1  2%  sched_debug.cfs_rq[=
7]:/.avg->runnable_avg_sum
      4554 =C2=B1 15%     +46.3%       6665 =C2=B1  2%  sched_debug.cfs_rq[=
8]:/.tg->runnable_avg
      4557 =C2=B1 15%     +46.3%       6667 =C2=B1  2%  sched_debug.cfs_rq[=
9]:/.tg->runnable_avg
    192062 =C2=B1 47%     +83.6%     352649 =C2=B1  4%  sched_debug.cfs_rq[=
9]:/.min_vruntime
        14 =C2=B1 36%     +58.9%         22 =C2=B1 10%  sched_debug.cpu#0.c=
pu_load[3]
        13 =C2=B1 37%     +66.7%         22 =C2=B1  7%  sched_debug.cpu#0.c=
pu_load[4]
        13 =C2=B1 35%     +61.1%         21 =C2=B1 11%  sched_debug.cpu#0.c=
pu_load[2]
    873975 =C2=B1 12%     -75.4%     215052 =C2=B1 24%  sched_debug.cpu#1.s=
ched_count
        16 =C2=B1  4%     +84.4%         29 =C2=B1 39%  sched_debug.cpu#1.c=
pu_load[1]
        15 =C2=B1 17%     +98.4%         30 =C2=B1 35%  sched_debug.cpu#1.c=
pu_load[4]
    873936 =C2=B1 12%     -75.4%     214989 =C2=B1 24%  sched_debug.cpu#1.n=
r_switches
    436585 =C2=B1 12%     -75.5%     106889 =C2=B1 24%  sched_debug.cpu#1.s=
ched_goidle
       564 =C2=B1 33%    +106.4%       1165 =C2=B1  7%  sched_debug.cpu#1.c=
urr->pid
        15 =C2=B1 14%     +95.2%         30 =C2=B1 35%  sched_debug.cpu#1.c=
pu_load[3]
    465895 =C2=B1  8%     -77.2%     106210 =C2=B1 24%  sched_debug.cpu#1.t=
twu_count
        15 =C2=B1  7%     +91.9%         29 =C2=B1 37%  sched_debug.cpu#1.c=
pu_load[2]
        15 =C2=B1 29%     +50.8%         23 =C2=B1  9%  sched_debug.cpu#10.=
cpu_load[3]
    315517 =C2=B1 11%     -94.0%      18947 =C2=B1 11%  sched_debug.cpu#10.=
sched_goidle
    336250 =C2=B1 12%     -94.0%      20238 =C2=B1 12%  sched_debug.cpu#10.=
ttwu_count
    631593 =C2=B1 11%     -93.9%      38620 =C2=B1 11%  sched_debug.cpu#10.=
sched_count
    631561 =C2=B1 11%     -93.9%      38572 =C2=B1 11%  sched_debug.cpu#10.=
nr_switches
       556 =C2=B1 20%     +93.0%       1074 =C2=B1 17%  sched_debug.cpu#10.=
curr->pid
        14 =C2=B1 28%     +57.6%         23 =C2=B1  8%  sched_debug.cpu#10.=
cpu_load[4]
    341057 =C2=B1 11%     -94.1%      20223 =C2=B1  8%  sched_debug.cpu#11.=
ttwu_count
    623922 =C2=B1  9%     -93.7%      39166 =C2=B1  9%  sched_debug.cpu#11.=
sched_count
    311611 =C2=B1  9%     -93.9%      19080 =C2=B1  9%  sched_debug.cpu#11.=
sched_goidle
    623869 =C2=B1  9%     -93.7%      39116 =C2=B1  9%  sched_debug.cpu#11.=
nr_switches
    338493 =C2=B1 10%     -94.2%      19504 =C2=B1  7%  sched_debug.cpu#12.=
sched_goidle
        55 =C2=B1 30%     -53.4%         26 =C2=B1 16%  sched_debug.cpu#12.=
cpu_load[1]
        71 =C2=B1 17%     -59.4%         29 =C2=B1 28%  sched_debug.cpu#12.=
cpu_load[0]
        79 =C2=B1 23%     -75.5%         19 =C2=B1 31%  sched_debug.cpu#12.=
load
    677539 =C2=B1 10%     -94.1%      40155 =C2=B1  7%  sched_debug.cpu#12.=
nr_switches
    280203 =C2=B1 33%     -92.6%      20836 =C2=B1  9%  sched_debug.cpu#12.=
ttwu_count
    677589 =C2=B1 10%     -94.1%      40202 =C2=B1  7%  sched_debug.cpu#12.=
sched_count
       509 =C2=B1 22%     +55.6%        793 =C2=B1 15%  sched_debug.cpu#12.=
ttwu_local
        19 =C2=B1 14%    +163.6%         50 =C2=B1 32%  sched_debug.cpu#13.=
cpu_load[1]
        24 =C2=B1 16%    +176.3%         67 =C2=B1 36%  sched_debug.cpu#13.=
cpu_load[0]
        17 =C2=B1 18%    +138.2%         40 =C2=B1 24%  sched_debug.cpu#13.=
cpu_load[2]
    646767 =C2=B1 13%     -94.2%      37618 =C2=B1 11%  sched_debug.cpu#13.=
sched_count
       709 =C2=B1 37%    +125.3%       1598 =C2=B1 23%  sched_debug.cpu#13.=
curr->pid
    646735 =C2=B1 13%     -94.2%      37563 =C2=B1 11%  sched_debug.cpu#13.=
nr_switches
        15 =C2=B1 19%    +104.8%         31 =C2=B1 23%  sched_debug.cpu#13.=
cpu_load[4]
        16 =C2=B1 19%    +117.2%         34 =C2=B1 21%  sched_debug.cpu#13.=
cpu_load[3]
    327419 =C2=B1 14%     -93.9%      20012 =C2=B1  9%  sched_debug.cpu#13.=
ttwu_count
    323068 =C2=B1 13%     -94.3%      18422 =C2=B1 11%  sched_debug.cpu#13.=
sched_goidle
    674567 =C2=B1 13%     -93.6%      43222 =C2=B1 11%  sched_debug.cpu#14.=
sched_count
       750 =C2=B1 30%     +90.8%       1432 =C2=B1 15%  sched_debug.cpu#14.=
curr->pid
       478 =C2=B1 22%     +33.9%        640 =C2=B1 21%  sched_debug.cpu#14.=
ttwu_local
    339046 =C2=B1 13%     -93.9%      20669 =C2=B1  7%  sched_debug.cpu#14.=
ttwu_count
    336995 =C2=B1 13%     -93.7%      21107 =C2=B1 11%  sched_debug.cpu#14.=
sched_goidle
    674534 =C2=B1 13%     -93.6%      43164 =C2=B1 11%  sched_debug.cpu#14.=
nr_switches
        19 =C2=B1 12%     +45.6%         28 =C2=B1 18%  sched_debug.cpu#15.=
cpu_load[1]
    299069 =C2=B1 13%     -93.4%      19783 =C2=B1  5%  sched_debug.cpu#15.=
sched_goidle
       813 =C2=B1 42%     +65.5%       1346 =C2=B1  6%  sched_debug.cpu#15.=
curr->pid
    580735 =C2=B1  3%     +11.3%     646611 =C2=B1  4%  sched_debug.cpu#15.=
avg_idle
    331682 =C2=B1 14%     -93.7%      20957 =C2=B1  7%  sched_debug.cpu#15.=
ttwu_count
    599051 =C2=B1 13%     -93.2%      41010 =C2=B1  5%  sched_debug.cpu#15.=
sched_count
        14 =C2=B1 15%     +69.5%         25 =C2=B1  5%  sched_debug.cpu#15.=
cpu_load[4]
        15 =C2=B1 12%     +71.7%         25 =C2=B1  7%  sched_debug.cpu#15.=
cpu_load[3]
        16 =C2=B1 10%     +62.1%         26 =C2=B1 11%  sched_debug.cpu#15.=
cpu_load[2]
       817 =C2=B1 11%     +61.3%       1318 =C2=B1 17%  sched_debug.cpu#15.=
ttwu_local
    599015 =C2=B1 13%     -93.2%      40958 =C2=B1  5%  sched_debug.cpu#15.=
nr_switches
   1009949 =C2=B1 27%     -63.0%     373861 =C2=B1 42%  sched_debug.cpu#2.s=
ched_count
        15 =C2=B1 16%     +54.0%         24 =C2=B1 14%  sched_debug.cpu#2.c=
pu_load[1]
   1009909 =C2=B1 27%     -63.0%     373802 =C2=B1 42%  sched_debug.cpu#2.n=
r_switches
        14 =C2=B1 18%     +61.0%         23 =C2=B1 10%  sched_debug.cpu#2.c=
pu_load[2]
    504627 =C2=B1 27%     -63.1%     186448 =C2=B1 42%  sched_debug.cpu#2.s=
ched_goidle
        14 =C2=B1 20%     +63.8%         23 =C2=B1  8%  sched_debug.cpu#2.c=
pu_load[3]
    534870 =C2=B1 25%     -64.9%     187727 =C2=B1 42%  sched_debug.cpu#2.t=
twu_count
        14 =C2=B1 23%     +66.7%         23 =C2=B1  6%  sched_debug.cpu#2.c=
pu_load[4]
        16 =C2=B1 24%     +62.5%         26 =C2=B1 19%  sched_debug.cpu#2.c=
pu_load[0]
    462676 =C2=B1 24%     -76.7%     107823 =C2=B1 47%  sched_debug.cpu#3.s=
ched_goidle
    926031 =C2=B1 24%     -76.6%     217084 =C2=B1 47%  sched_debug.cpu#3.s=
ched_count
    494298 =C2=B1 23%     -78.2%     107584 =C2=B1 46%  sched_debug.cpu#3.t=
twu_count
        18 =C2=B1  6%     +18.9%         22 =C2=B1  5%  sched_debug.cpu#3.c=
pu_load[2]
    925992 =C2=B1 24%     -76.6%     217032 =C2=B1 47%  sched_debug.cpu#3.n=
r_switches
        16 =C2=B1 13%     +37.9%         22 =C2=B1  3%  sched_debug.cpu#3.c=
pu_load[3]
        15 =C2=B1 21%     +52.5%         23 =C2=B1  3%  sched_debug.cpu#3.c=
pu_load[4]
        33 =C2=B1 20%     -36.8%         21 =C2=B1 17%  sched_debug.cpu#3.c=
pu_load[0]
        14 =C2=B1 18%     +56.9%         22 =C2=B1  3%  sched_debug.cpu#4.c=
pu_load[4]
        15 =C2=B1 23%     +41.3%         22 =C2=B1  4%  sched_debug.cpu#4.c=
pu_load[3]
       948 =C2=B1 27%     +36.5%       1295 =C2=B1 11%  sched_debug.cpu#4.c=
urr->pid
       855 =C2=B1 43%     +67.1%       1429 =C2=B1 16%  sched_debug.cpu#5.c=
urr->pid
        22 =C2=B1  9%     +87.8%         42 =C2=B1 29%  sched_debug.cpu#5.c=
pu_load[0]
        15 =C2=B1 13%    +114.5%         33 =C2=B1 43%  sched_debug.cpu#5.c=
pu_load[3]
        15 =C2=B1 15%    +119.7%         33 =C2=B1 47%  sched_debug.cpu#5.c=
pu_load[4]
        18 =C2=B1  8%    +100.0%         37 =C2=B1 32%  sched_debug.cpu#5.c=
pu_load[1]
        16 =C2=B1 10%    +110.8%         34 =C2=B1 38%  sched_debug.cpu#5.c=
pu_load[2]
    415247 =C2=B1 12%     -80.9%      79279 =C2=B1 20%  sched_debug.cpu#6.s=
ched_goidle
    831074 =C2=B1 12%     -80.8%     159814 =C2=B1 20%  sched_debug.cpu#6.n=
r_switches
    831113 =C2=B1 12%     -80.8%     159869 =C2=B1 20%  sched_debug.cpu#6.s=
ched_count
       811 =C2=B1 36%     +50.0%       1216 =C2=B1 15%  sched_debug.cpu#6.c=
urr->pid
    430138 =C2=B1 18%     -82.1%      76868 =C2=B1 22%  sched_debug.cpu#6.t=
twu_count
    860988 =C2=B1 14%     -70.9%     250529 =C2=B1 33%  sched_debug.cpu#7.n=
r_switches
    430158 =C2=B1 14%     -71.0%     124543 =C2=B1 34%  sched_debug.cpu#7.s=
ched_goidle
    861025 =C2=B1 14%     -70.9%     250578 =C2=B1 33%  sched_debug.cpu#7.s=
ched_count
       658 =C2=B1 21%    +123.8%       1473 =C2=B1 27%  sched_debug.cpu#7.c=
urr->pid
        15 =C2=B1 19%     +60.0%         24 =C2=B1  7%  sched_debug.cpu#7.c=
pu_load[4]
        15 =C2=B1 14%     +62.9%         25 =C2=B1 13%  sched_debug.cpu#7.c=
pu_load[2]
    440642 =C2=B1 11%     -71.9%     123684 =C2=B1 34%  sched_debug.cpu#7.t=
twu_count
        16 =C2=B1  7%     +58.2%         26 =C2=B1 27%  sched_debug.cpu#7.c=
pu_load[1]
        15 =C2=B1 16%     +65.0%         24 =C2=B1  9%  sched_debug.cpu#7.c=
pu_load[3]
       823 =C2=B1 25%     +61.0%       1325 =C2=B1 31%  sched_debug.cpu#8.c=
urr->pid
    638635 =C2=B1 13%     -93.8%      39544 =C2=B1  7%  sched_debug.cpu#9.s=
ched_count
    638594 =C2=B1 13%     -93.8%      39497 =C2=B1  7%  sched_debug.cpu#9.n=
r_switches
    319018 =C2=B1 13%     -93.9%      19378 =C2=B1  7%  sched_debug.cpu#9.s=
ched_goidle
    328979 =C2=B1 10%     -93.9%      19948 =C2=B1  6%  sched_debug.cpu#9.t=
twu_count

lituya: Grantley Haswell
Memory: 16G




                                   softirqs.SCHED

  300000 ++----------------------------------------------------------------=
-+
         |     *                                                           =
 |
  250000 ++    :                 *                                         =
 |
         |    : :.*    .*. .*   : +     .*                                 =
 |
         *.*. : *  + .*   * :   :  *.*.*  +                                =
 |
  200000 ++  *      *        : *           *                               =
 |
         |                   :+                                            =
 |
  150000 ++                  *                                             =
 |
         |                                                                 =
 |
  100000 ++                                                                =
 |
         |                                                                 =
 |
         |                                                                 =
 |
   50000 O+O O OO O O O O O OO O O O O O O OO O O O O O OO O O O O O OO O O=
 O
         |                                                                 =
 |
       0 ++----------------------------------------------------------------=
-+


                                 cpuidle.C1-HSW.usage

    3e+07 ++---------------------------------------------------------------=
-+
          |                            *                                   =
 |
  2.5e+07 ++*              *       .*  :+                                  =
 |
          | :              ::     *  : : *                                 =
 |
          |: :   *        : *    +   ::   :                                =
 |
    2e+07 ++ :  * :       :  :  *     *   :                                =
 |
          |:  :+  :      :   : :           *                               =
 |
  1.5e+07 ++  *    *.*.*.*    ::                                           =
 |
          *                   *                                            =
 |
    1e+07 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
    5e+06 ++                                                               =
 |
          O O O OO O O     OO   O   O        O O OO O O O O        O O OO O=
 O
        0 ++-----------O-O----O---O---OO-O-O----------------OO-O-O---------=
-+


                       unixbench.time.voluntary_context_switches

  3.5e+07 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    3e+07 ++*              *       .*  *.                                  =
 |
          | :              :*     *  : : *                                 =
 |
  2.5e+07 ++ :   *        : :    +   : :  :                                =
 |
          |: :  * :       :  :  *     :   :                                =
 |
    2e+07 ++  :+  :      :   : :      *    *                               =
 |
          |   *    *.*.*.*    ::                                           =
 |
  1.5e+07 *+                  *                                            =
 |
          |                                                                =
 |
    1e+07 ++                                                               =
 |
          |                                                                =
 |
    5e+06 ++                                                               =
 |
          O O O OO O O     OO       O        O O OO O O O O        O O OO O=
 O
        0 ++-----------O-O----O-O-O---OO-O-O----------------OO-O-O---------=
-+


                     unixbench.time.involuntary_context_switches

  30000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  25000 ++O                                 O                              =
 |
        |   O    O         O   O              O                    O       =
 |
        O       O  O O   O   O    O O   O       O OO O O O O   O        O O=
 O
  20000 ++    O        O         O    O   O                  O   O  O O    =
 |
        |                                                                  =
 |
  15000 ++                                                                 =
 |
        |                                                                  =
 |
  10000 *+  *.*  *.*.*.*     *.                                            =
 |
        |: :   + :      :   +  *.   *    .*                                =
 |
        |: :    *       : .*     * + + .*                                  =
 |
   5000 ++*              *        *   *                                    =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                            time.voluntary_context_switches

  3.5e+07 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    3e+07 ++*              *       .*  *.                                  =
 |
          | :              :*     *  : : *                                 =
 |
  2.5e+07 ++ :   *        : :    +   : :  :                                =
 |
          |: :  * :       :  :  *     :   :                                =
 |
    2e+07 ++  :+  :      :   : :      *    *                               =
 |
          |   *    *.*.*.*    ::                                           =
 |
  1.5e+07 *+                  *                                            =
 |
          |                                                                =
 |
    1e+07 ++                                                               =
 |
          |                                                                =
 |
    5e+06 ++                                                               =
 |
          O O O OO O O     OO       O        O O OO O O O O        O O OO O=
 O
        0 ++-----------O-O----O-O-O---OO-O-O----------------OO-O-O---------=
-+


                          time.involuntary_context_switches

  30000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  25000 ++O                                 O                              =
 |
        |   O    O         O   O              O                    O       =
 |
        O       O  O O   O   O    O O   O       O OO O O O O   O        O O=
 O
  20000 ++    O        O         O    O   O                  O   O  O O    =
 |
        |                                                                  =
 |
  15000 ++                                                                 =
 |
        |                                                                  =
 |
  10000 *+  *.*  *.*.*.*     *.                                            =
 |
        |: :   + :      :   +  *.   *    .*                                =
 |
        |: :    *       : .*     * + + .*                                  =
 |
   5000 ++*              *        *   *                                    =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                                  vmstat.system.cs

  250000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
         | *              *.      .*   *.                                  =
 |
  200000 ++:              : *    *  :  : *                                 =
 |
         |: :   *        :  :   +   : :   :                                =
 |
         |: :  * :       :  :  *     ::   :                                =
 |
  150000 ++  :+  :      :    ::      *     *                               =
 |
         |   *    *.*.*.*    ::                                            =
 |
  100000 *+                  *                                             =
 |
         |                                                                 =
 |
         |                                                                 =
 |
   50000 ++                                                                =
 |
         |                                                                 =
 |
         O O O OO O O O O O OO O O O O O O OO O O O O O OO O O O O O OO O O=
 O
       0 ++----------------------------------------------------------------=
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


--===============8096290766990995793==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB1bml4YmVuY2gKZGVmYXVsdC1tb25pdG9yczoKICB3YWl0OiBwcmUtdGVz
dAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0YXQ6IAogIG51
bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBwcm9jLXN0YXQ6
IAogIG1lbWluZm86IAogIHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAog
IGxhdGVuY3lfc3RhdHM6IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tz
dGF0czogCiAgbmZzc3RhdDogCiAgY3B1aWRsZTogCiAgY3B1ZnJlcS1zdGF0czogCiAgdHVyYm9z
dGF0OiAKICBwbWV0ZXI6IAogIHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDEwCmRlZmF1bHRf
d2F0Y2hkb2dzOgogIHdhdGNoLW9vbTogCiAgd2F0Y2hkb2c6IApjcHVmcmVxX2dvdmVybm9yOiBw
ZXJmb3JtYW5jZQpjb21taXQ6IDE1OWU3NzYzZDUxNzgwNGM2MWE2NzM3MzY2NjBhNWEzNWYyZWE1
ZjgKbW9kZWw6IEdyYW50bGV5IEhhc3dlbGwKbnJfY3B1OiAxNgptZW1vcnk6IDE2RwpoZGRfcGFy
dGl0aW9uczogCnN3YXBfcGFydGl0aW9uczogCnJvb3Rmc19wYXJ0aXRpb246IAp1bml4YmVuY2g6
CiAgdGVzdDogZnNkaXNrCnRlc3Rib3g6IGxpdHV5YQp0Ym94X2dyb3VwOiBsaXR1eWEKa2NvbmZp
ZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE1LTAzLTEzIDE3OjE4OjIwLjgwNzk2MDY5
NCArMDg6MDAKaGVhZF9jb21taXQ6IDE1OWU3NzYzZDUxNzgwNGM2MWE2NzM3MzY2NjBhNWEzNWYy
ZWE1ZjgKYmFzZV9jb21taXQ6IDllY2NjYTA4NDMyMDVmODdjMDA0MDRiNjYzMTg4Yjg4ZWIyNDgw
NTEKYnJhbmNoOiBuZXh0L21hc3RlcgprZXJuZWw6ICIva2VybmVsL3g4Nl82NC1yaGVsLzE1OWU3
NzYzZDUxNzgwNGM2MWE2NzM3MzY2NjBhNWEzNWYyZWE1Zjgvdm1saW51ei00LjAuMC1yYzMtbmV4
dC0yMDE1MDMxNiIKdXNlcjogbGtwCnF1ZXVlOiBjeWNsaWMKcm9vdGZzOiBkZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC9saXR1eWEvdW5peGJlbmNoL3Bl
cmZvcm1hbmNlLWZzZGlzay9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVs
LzE1OWU3NzYzZDUxNzgwNGM2MWE2NzM3MzY2NjBhNWEzNWYyZWE1ZjgvMCIKam9iX2ZpbGU6ICIv
bGtwL3NjaGVkdWxlZC9saXR1eWEvY3ljbGljX3VuaXhiZW5jaC1wZXJmb3JtYW5jZS1mc2Rpc2st
eDg2XzY0LXJoZWwtSEVBRC0xNTllNzc2M2Q1MTc4MDRjNjFhNjczNzM2NjYwYTVhMzVmMmVhNWY4
LTAtMjAxNTAzMTMtMjIxNjMtMXBrbm8waC55YW1sIgpkZXF1ZXVlX3RpbWU6IDIwMTUtMDMtMTYg
MTc6Mzc6MzkuMjEwNzU3ODExICswODowMAptYXhfdXB0aW1lOiAxMjExLjUwMDAwMDAwMDAwMDIK
bW9kdWxlc19pbml0cmQ6ICIva2VybmVsL3g4Nl82NC1yaGVsLzE1OWU3NzYzZDUxNzgwNGM2MWE2
NzM3MzY2NjBhNWEzNWYyZWE1ZjgvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDogIi9sa3AvYmVuY2ht
YXJrcy90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy91bml4YmVuY2gtZGViaWFuLmNneiwv
bGtwL2JlbmNobWFya3MvdW5peGJlbmNoLmNneiIKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZn
OiA4LjI4IDQuODMgMS45NiAxLzIxMSA1NzM2CnN0YXJ0X3RpbWU6ICcxNDI2NDk4Njg0JwplbmRf
dGltZTogJzE0MjY0OTg5ODInCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTUwMzE2LTE1MjEz
MyIK

--===============8096290766990995793==
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
bS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OC9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCi4vUnVuIGZzZGlzawo=

--===============8096290766990995793==--

