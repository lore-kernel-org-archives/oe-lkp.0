Content-Type: multipart/mixed; boundary="===============1502768097908113484=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [futex] 1d0dcb3ad9d: No primary result change, +9.6% will-it-scale.time.involuntary_context_switches, +32.2% will-it-scale.time.user_time, -4.8% will-it-scale.time.system_time
Date: Wed, 20 May 2015 11:26:00 +0800
Message-ID: <1432092360.16919.25.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1502768097908113484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
commit 1d0dcb3ad9d336e6d6ee020a750a7f8d907e28de ("futex: Implement lockless=
 wakeups")


testcase/path_params/tbox_group: will-it-scale/powersave-pthread_mutex1/lit=
uya

7675104990ed255b  1d0dcb3ad9d336e6d6ee020a75  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

      5989 =C2=B1  2%      +9.6%       6566 =C2=B1  2%  will-it-scale.time.=
involuntary_context_switches
       136 =C2=B1  0%     +32.2%        180 =C2=B1  0%  will-it-scale.time.=
user_time
  31929544 =C2=B1  0%     +64.7%   52574500 =C2=B1  0%  will-it-scale.time.=
voluntary_context_switches
      1241 =C2=B1  0%      -4.8%       1182 =C2=B1  0%  will-it-scale.time.=
system_time
       453 =C2=B1  0%      -1.3%        447 =C2=B1  0%  will-it-scale.time.=
percent_of_cpu_this_job_got
    213800 =C2=B1  0%     +62.8%     348085 =C2=B1  0%  vmstat.system.cs
     20662 =C2=B1  2%     +10.3%      22800 =C2=B1  1%  vmstat.system.in
       136 =C2=B1  0%     +32.2%        180 =C2=B1  0%  time.user_time
  31929544 =C2=B1  0%     +64.7%   52574500 =C2=B1  0%  time.voluntary_cont=
ext_switches
  25497500 =C2=B1  1%     +79.8%   45847592 =C2=B1  0%  cpuidle.C1-HSW.usage
  25909310 =C2=B1  9%     +40.4%   36385075 =C2=B1 10%  cpuidle.C1-HSW.time
       385 =C2=B1  1%      -3.9%        370 =C2=B1  1%  latency_stats.avg.d=
o_wait.SyS_wait4.system_call_fastpath
        45 =C2=B1 19%     +46.4%         66 =C2=B1 12%  latency_stats.avg.u=
nix_wait_for_peer.unix_dgram_sendmsg.sock_sendmsg.___sys_sendmsg.__sys_send=
msg.SyS_sendmsg.system_call_fastpath
   3199870 =C2=B1  2%    +107.9%    6653184 =C2=B1  3%  latency_stats.hits.=
futex_wait_queue_me.futex_wait.do_futex.SyS_futex.system_call_fastpath
      4291 =C2=B1  5%     -26.1%       3172 =C2=B1  4%  latency_stats.max.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
    942123 =C2=B1  1%      -3.8%     906698 =C2=B1  1%  latency_stats.sum.d=
o_wait.SyS_wait4.system_call_fastpath
     14068 =C2=B1 10%     -10.3%      12621 =C2=B1  3%  latency_stats.sum.e=
p_poll.SyS_epoll_wait.system_call_fastpath
   1442334 =C2=B1  0%      -7.1%    1339318 =C2=B1  1%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
   4763770 =C2=B1  1%     +41.4%    6733885 =C2=B1  3%  latency_stats.sum.f=
utex_wait_queue_me.futex_wait.do_futex.SyS_futex.system_call_fastpath
        49 =C2=B1  1%     -24.7%         37 =C2=B1 18%  sched_debug.cfs_rq[=
13]:/.load
        52 =C2=B1  4%     -18.1%         43 =C2=B1 20%  sched_debug.cfs_rq[=
13]:/.runnable_load_avg
       672 =C2=B1 29%     -43.0%        383 =C2=B1 19%  sched_debug.cfs_rq[=
14]:/.utilization_load_avg
       596 =C2=B1 12%     +16.9%        697 =C2=B1  1%  sched_debug.cfs_rq[=
15]:/.tg_runnable_contrib
        51 =C2=B1 20%     -35.9%         33 =C2=B1 14%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
        68 =C2=B1 27%     -35.0%         44 =C2=B1 48%  sched_debug.cfs_rq[=
3]:/.load
    433123 =C2=B1 13%     -21.0%     342236 =C2=B1  7%  sched_debug.cfs_rq[=
7]:/.min_vruntime
     21198 =C2=B1 15%     -21.0%      16755 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.avg->runnable_avg_sum
     35997 =C2=B1 20%     -29.4%      25419 =C2=B1  9%  sched_debug.cfs_rq[=
7]:/.exec_clock
    906034 =C2=B1 16%     +21.5%    1101140 =C2=B1  8%  sched_debug.cpu#1.s=
ched_goidle
   1813964 =C2=B1 16%     +21.5%    2203255 =C2=B1  8%  sched_debug.cpu#1.n=
r_switches
    911649 =C2=B1 16%     +25.8%    1146513 =C2=B1  8%  sched_debug.cpu#1.t=
twu_count
   1814079 =C2=B1 16%     +21.5%    2203379 =C2=B1  8%  sched_debug.cpu#1.s=
ched_count
   1616994 =C2=B1 19%    +114.4%    3466653 =C2=B1  7%  sched_debug.cpu#10.=
nr_switches
         7 =C2=B1 17%     -53.6%          3 =C2=B1 25%  sched_debug.cpu#10.=
nr_uninterruptible
       427 =C2=B1  5%     +29.6%        553 =C2=B1  9%  sched_debug.cpu#10.=
ttwu_local
    822628 =C2=B1 20%    +115.5%    1772801 =C2=B1  7%  sched_debug.cpu#10.=
ttwu_count
   1617109 =C2=B1 19%    +114.4%    3466772 =C2=B1  7%  sched_debug.cpu#10.=
sched_count
    808217 =C2=B1 19%    +114.4%    1732959 =C2=B1  7%  sched_debug.cpu#10.=
sched_goidle
   1818260 =C2=B1 10%     +56.9%    2851959 =C2=B1 16%  sched_debug.cpu#11.=
sched_count
    908654 =C2=B1 10%     +56.9%    1425514 =C2=B1 16%  sched_debug.cpu#11.=
sched_goidle
   1818138 =C2=B1 10%     +56.9%    2851840 =C2=B1 16%  sched_debug.cpu#11.=
nr_switches
    896624 =C2=B1  8%     +52.5%    1367494 =C2=B1 15%  sched_debug.cpu#11.=
ttwu_count
      1857 =C2=B1 11%     +18.6%       2202 =C2=B1  8%  sched_debug.cpu#12.=
curr->pid
        58 =C2=B1 10%     -19.8%         46 =C2=B1 20%  sched_debug.cpu#13.=
cpu_load[2]
   1885115 =C2=B1 10%     +64.6%    3102536 =C2=B1 11%  sched_debug.cpu#13.=
nr_switches
   1885155 =C2=B1 10%     +64.6%    3102576 =C2=B1 11%  sched_debug.cpu#13.=
sched_count
    942063 =C2=B1 10%     +64.6%    1550798 =C2=B1 11%  sched_debug.cpu#13.=
sched_goidle
    920620 =C2=B1  9%     +62.2%    1493320 =C2=B1  9%  sched_debug.cpu#13.=
ttwu_count
        56 =C2=B1  5%     -23.7%         42 =C2=B1 15%  sched_debug.cpu#13.=
cpu_load[4]
        57 =C2=B1  7%     -23.1%         44 =C2=B1 14%  sched_debug.cpu#13.=
cpu_load[3]
        49 =C2=B1  1%     -24.7%         37 =C2=B1 18%  sched_debug.cpu#13.=
load
    745920 =C2=B1 12%     +91.8%    1430771 =C2=B1  4%  sched_debug.cpu#14.=
sched_goidle
   1492512 =C2=B1 12%     +91.8%    2862256 =C2=B1  4%  sched_debug.cpu#14.=
nr_switches
    746237 =C2=B1 12%     +88.0%    1403001 =C2=B1  4%  sched_debug.cpu#14.=
ttwu_count
   1492551 =C2=B1 12%     +91.8%    2862299 =C2=B1  4%  sched_debug.cpu#14.=
sched_count
    577321 =C2=B1 30%    +161.5%    1509820 =C2=B1  7%  sched_debug.cpu#15.=
sched_goidle
    574967 =C2=B1 31%    +165.3%    1525263 =C2=B1  2%  sched_debug.cpu#15.=
ttwu_count
   1155549 =C2=B1 30%    +161.4%    3020803 =C2=B1  7%  sched_debug.cpu#15.=
nr_switches
   1155589 =C2=B1 30%    +161.4%    3020846 =C2=B1  7%  sched_debug.cpu#15.=
sched_count
   1446483 =C2=B1  7%     +75.4%    2537378 =C2=B1 15%  sched_debug.cpu#3.n=
r_switches
    720522 =C2=B1  9%     +71.2%    1233795 =C2=B1 18%  sched_debug.cpu#3.t=
twu_count
    722651 =C2=B1  7%     +75.5%    1268100 =C2=B1 15%  sched_debug.cpu#3.s=
ched_goidle
   1446610 =C2=B1  7%     +75.4%    2537497 =C2=B1 15%  sched_debug.cpu#3.s=
ched_count
    823639 =C2=B1 17%     +80.6%    1487383 =C2=B1 14%  sched_debug.cpu#5.n=
r_switches
     27549 =C2=B1  6%     +22.7%      33806 =C2=B1 16%  sched_debug.cpu#5.n=
r_load_updates
    670845 =C2=B1  9%     -11.3%     595156 =C2=B1  5%  sched_debug.cpu#5.a=
vg_idle
    410777 =C2=B1 17%     +80.8%     742641 =C2=B1 14%  sched_debug.cpu#5.s=
ched_goidle
    407183 =C2=B1 17%     +78.5%     726745 =C2=B1 15%  sched_debug.cpu#5.t=
twu_count
    823685 =C2=B1 17%     +80.6%    1487428 =C2=B1 14%  sched_debug.cpu#5.s=
ched_count
   1291878 =C2=B1 19%     +26.7%    1636521 =C2=B1 11%  sched_debug.cpu#6.n=
r_switches
         2 =C2=B1 35%    +150.0%          5 =C2=B1 24%  sched_debug.cpu#6.n=
r_uninterruptible
   1291922 =C2=B1 19%     +26.7%    1636561 =C2=B1 11%  sched_debug.cpu#6.s=
ched_count
    644667 =C2=B1 19%     +26.7%     816931 =C2=B1 11%  sched_debug.cpu#6.s=
ched_goidle
    999303 =C2=B1  8%     +80.0%    1799127 =C2=B1  9%  sched_debug.cpu#8.s=
ched_goidle
   1999260 =C2=B1  8%     +80.0%    3599253 =C2=B1  9%  sched_debug.cpu#8.n=
r_switches
   1019255 =C2=B1  4%     +77.5%    1809326 =C2=B1  8%  sched_debug.cpu#8.t=
twu_count
   1999377 =C2=B1  8%     +80.0%    3599372 =C2=B1  9%  sched_debug.cpu#8.s=
ched_count
    737902 =C2=B1  8%     -21.6%     578475 =C2=B1 15%  sched_debug.cpu#9.a=
vg_idle
   1696089 =C2=B1 13%    +100.9%    3406654 =C2=B1  2%  sched_debug.cpu#9.s=
ched_count
   1695966 =C2=B1 13%    +100.9%    3406521 =C2=B1  2%  sched_debug.cpu#9.n=
r_switches
    847698 =C2=B1 13%    +100.9%    1702912 =C2=B1  2%  sched_debug.cpu#9.s=
ched_goidle
    848268 =C2=B1 11%    +113.4%    1810338 =C2=B1  5%  sched_debug.cpu#9.t=
twu_count

testcase/path_params/tbox_group: will-it-scale/performance-pthread_mutex1/l=
ituya

7675104990ed255b  1d0dcb3ad9d336e6d6ee020a75  =

----------------  --------------------------  =

       135 =C2=B1  0%     +32.6%        179 =C2=B1  0%  will-it-scale.time.=
user_time
  31795775 =C2=B1  0%     +65.2%   52519962 =C2=B1  0%  will-it-scale.time.=
voluntary_context_switches
      1242 =C2=B1  0%      -4.8%       1182 =C2=B1  0%  will-it-scale.time.=
system_time
       452 =C2=B1  0%      -1.1%        447 =C2=B1  0%  will-it-scale.time.=
percent_of_cpu_this_job_got
         9 =C2=B1  0%     -11.1%          8 =C2=B1  0%  vmstat.procs.r
    213068 =C2=B1  0%     +63.4%     348183 =C2=B1  0%  vmstat.system.cs
     20072 =C2=B1  1%     +15.4%      23157 =C2=B1  1%  vmstat.system.in
       135 =C2=B1  0%     +32.6%        179 =C2=B1  0%  time.user_time
  31795775 =C2=B1  0%     +65.2%   52519962 =C2=B1  0%  time.voluntary_cont=
ext_switches
  25884654 =C2=B1  0%     +77.0%   45817600 =C2=B1  0%  cpuidle.C1-HSW.usage
  27193585 =C2=B1  9%     +50.5%   40917267 =C2=B1  9%  cpuidle.C1-HSW.time
       405 =C2=B1 15%     +90.6%        772 =C2=B1 18%  cpuidle.POLL.usage
       302 =C2=B1  2%      -7.3%        280 =C2=B1  2%  latency_stats.avg.d=
o_wait.SyS_wait4.system_call_fastpath
       637 =C2=B1 34%     +81.5%       1156 =C2=B1 36%  latency_stats.avg.e=
p_poll.SyS_epoll_wait.system_call_fastpath
       221 =C2=B1  1%      -8.5%        202 =C2=B1  0%  latency_stats.avg.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
   3365738 =C2=B1  2%     +99.0%    6698670 =C2=B1  3%  latency_stats.hits.=
futex_wait_queue_me.futex_wait.do_futex.SyS_futex.system_call_fastpath
       224 =C2=B1 25%     +94.2%        435 =C2=B1 39%  latency_stats.max.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.may_open
    741091 =C2=B1  3%      -7.2%     687939 =C2=B1  2%  latency_stats.sum.d=
o_wait.SyS_wait4.system_call_fastpath
   1150919 =C2=B1  1%     -10.0%    1035254 =C2=B1  1%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
   4920864 =C2=B1  2%     +37.8%    6781129 =C2=B1  3%  latency_stats.sum.f=
utex_wait_queue_me.futex_wait.do_futex.SyS_futex.system_call_fastpath
      5.32 =C2=B1  6%     -36.1%       3.40 =C2=B1 41%  perf-profile.cpu-cy=
cles.search_binary_handler.do_execveat_common.sys_execve.return_from_execve
      5.42 =C2=B1  4%     -37.2%       3.40 =C2=B1 41%  perf-profile.cpu-cy=
cles.load_elf_binary.search_binary_handler.do_execveat_common.sys_execve.re=
turn_from_execve
      7.46 =C2=B1 20%     -43.7%       4.20 =C2=B1 41%  perf-profile.cpu-cy=
cles.return_from_execve
      7.46 =C2=B1 20%     -43.7%       4.20 =C2=B1 41%  perf-profile.cpu-cy=
cles.do_execveat_common.isra.29.sys_execve.return_from_execve
      7.46 =C2=B1 20%     -43.7%       4.20 =C2=B1 41%  perf-profile.cpu-cy=
cles.sys_execve.return_from_execve
        13 =C2=B1 19%     -50.9%          6 =C2=B1 35%  sched_debug.cfs_rq[=
11]:/.nr_spread_over
        23 =C2=B1 34%     +48.4%         34 =C2=B1 19%  sched_debug.cfs_rq[=
4]:/.runnable_load_avg
        54 =C2=B1 22%     -43.8%         30 =C2=B1 26%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
        39 =C2=B1 26%     +47.8%         58 =C2=B1 24%  sched_debug.cfs_rq[=
8]:/.runnable_load_avg
        31 =C2=B1  1%     +56.8%         49 =C2=B1  2%  sched_debug.cfs_rq[=
9]:/.runnable_load_avg
       567 =C2=B1 13%     +23.2%        699 =C2=B1  1%  sched_debug.cfs_rq[=
9]:/.tg_runnable_contrib
        31 =C2=B1  1%     +21.6%         38 =C2=B1 17%  sched_debug.cfs_rq[=
9]:/.load
     26043 =C2=B1 12%     +23.3%      32103 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.avg->runnable_avg_sum
    522365 =C2=B1 32%     +75.0%     914370 =C2=B1 16%  sched_debug.cpu#0.t=
twu_count
   1020121 =C2=B1 32%     +76.7%    1802488 =C2=B1 17%  sched_debug.cpu#0.s=
ched_count
    507393 =C2=B1 33%     +77.1%     898471 =C2=B1 18%  sched_debug.cpu#0.s=
ched_goidle
   1019797 =C2=B1 32%     +76.7%    1802170 =C2=B1 17%  sched_debug.cpu#0.n=
r_switches
        49 =C2=B1  7%     -31.0%         34 =C2=B1  2%  sched_debug.cpu#1.c=
pu_load[1]
        51 =C2=B1  8%     -33.7%         34 =C2=B1 10%  sched_debug.cpu#1.c=
pu_load[0]
        48 =C2=B1 11%     -28.6%         34 =C2=B1  3%  sched_debug.cpu#1.c=
pu_load[4]
    477826 =C2=B1 16%     +42.3%     680096 =C2=B1  4%  sched_debug.cpu#1.a=
vg_idle
        48 =C2=B1 10%     -29.0%         34 =C2=B1  3%  sched_debug.cpu#1.c=
pu_load[3]
        48 =C2=B1  9%     -30.9%         33 =C2=B1  1%  sched_debug.cpu#1.c=
pu_load[2]
   1499187 =C2=B1 31%     +87.2%    2806508 =C2=B1 21%  sched_debug.cpu#10.=
nr_switches
    754505 =C2=B1 34%     +88.6%    1423293 =C2=B1 19%  sched_debug.cpu#10.=
ttwu_count
   1499311 =C2=B1 31%     +87.2%    2806624 =C2=B1 21%  sched_debug.cpu#10.=
sched_count
    749245 =C2=B1 31%     +87.2%    1402814 =C2=B1 21%  sched_debug.cpu#10.=
sched_goidle
        49 =C2=B1 10%     -19.1%         40 =C2=B1  4%  sched_debug.cpu#11.=
cpu_load[1]
        52 =C2=B1 17%     -33.8%         34 =C2=B1 13%  sched_debug.cpu#11.=
cpu_load[0]
        50 =C2=B1  7%     -23.0%         38 =C2=B1 15%  sched_debug.cpu#12.=
cpu_load[3]
        53 =C2=B1 10%     -26.8%         39 =C2=B1 15%  sched_debug.cpu#12.=
cpu_load[2]
    646988 =C2=B1 35%    +123.8%    1448084 =C2=B1 19%  sched_debug.cpu#12.=
ttwu_count
        47 =C2=B1 10%     -20.5%         37 =C2=B1 18%  sched_debug.cpu#12.=
cpu_load[4]
    651640 =C2=B1 36%    +132.8%    1517162 =C2=B1 19%  sched_debug.cpu#12.=
sched_goidle
   1303921 =C2=B1 36%    +132.8%    3035620 =C2=B1 19%  sched_debug.cpu#12.=
nr_switches
        64 =C2=B1 21%     -35.0%         41 =C2=B1 33%  sched_debug.cpu#12.=
cpu_load[0]
        58 =C2=B1 16%     -30.5%         40 =C2=B1 20%  sched_debug.cpu#12.=
cpu_load[1]
   1303958 =C2=B1 36%    +132.8%    3035660 =C2=B1 19%  sched_debug.cpu#12.=
sched_count
   1642807 =C2=B1 22%     +78.5%    2932208 =C2=B1  9%  sched_debug.cpu#13.=
nr_switches
   1642856 =C2=B1 22%     +78.5%    2932247 =C2=B1  9%  sched_debug.cpu#13.=
sched_count
    821009 =C2=B1 22%     +78.5%    1465663 =C2=B1  9%  sched_debug.cpu#13.=
sched_goidle
    788799 =C2=B1 19%     +81.5%    1431516 =C2=B1  8%  sched_debug.cpu#13.=
ttwu_count
    870563 =C2=B1 20%     +44.4%    1257081 =C2=B1 15%  sched_debug.cpu#14.=
sched_goidle
   1741973 =C2=B1 20%     +44.4%    2515088 =C2=B1 15%  sched_debug.cpu#14.=
nr_switches
    866217 =C2=B1 19%     +43.8%    1245955 =C2=B1 12%  sched_debug.cpu#14.=
ttwu_count
   1742015 =C2=B1 20%     +44.4%    2515126 =C2=B1 15%  sched_debug.cpu#14.=
sched_count
    737410 =C2=B1 10%     -16.4%     616336 =C2=B1  7%  sched_debug.cpu#15.=
avg_idle
    700131 =C2=B1 34%     +86.8%    1307981 =C2=B1 17%  sched_debug.cpu#15.=
sched_goidle
    699153 =C2=B1 35%     +83.6%    1283986 =C2=B1 18%  sched_debug.cpu#15.=
ttwu_count
   1401279 =C2=B1 34%     +86.8%    2617150 =C2=B1 17%  sched_debug.cpu#15.=
nr_switches
   1401320 =C2=B1 34%     +86.8%    2617190 =C2=B1 17%  sched_debug.cpu#15.=
sched_count
   1192893 =C2=B1 20%    +100.2%    2387841 =C2=B1 32%  sched_debug.cpu#3.n=
r_switches
    601136 =C2=B1 20%     +97.4%    1186749 =C2=B1 29%  sched_debug.cpu#3.t=
twu_count
    595525 =C2=B1 20%    +100.4%    1193216 =C2=B1 32%  sched_debug.cpu#3.s=
ched_goidle
   1193047 =C2=B1 20%    +100.2%    2387951 =C2=B1 32%  sched_debug.cpu#3.s=
ched_count
        26 =C2=B1 30%     +61.0%         42 =C2=B1 20%  sched_debug.cpu#4.l=
oad
        25 =C2=B1 30%     +47.1%         37 =C2=B1 18%  sched_debug.cpu#4.c=
pu_load[4]
    973362 =C2=B1 30%     +99.1%    1937649 =C2=B1 17%  sched_debug.cpu#6.n=
r_switches
    973400 =C2=B1 30%     +99.1%    1937691 =C2=B1 17%  sched_debug.cpu#6.s=
ched_count
    485548 =C2=B1 30%     +99.4%     967982 =C2=B1 17%  sched_debug.cpu#6.s=
ched_goidle
    489774 =C2=B1 31%    +101.8%     988405 =C2=B1 21%  sched_debug.cpu#6.t=
twu_count
   1037194 =C2=B1 16%     +62.4%    1684672 =C2=B1 10%  sched_debug.cpu#8.s=
ched_goidle
   2074962 =C2=B1 16%     +62.4%    3370325 =C2=B1 10%  sched_debug.cpu#8.n=
r_switches
   1063289 =C2=B1 16%     +59.3%    1693545 =C2=B1  9%  sched_debug.cpu#8.t=
twu_count
   2075084 =C2=B1 16%     +62.4%    3370436 =C2=B1 10%  sched_debug.cpu#8.s=
ched_count
        35 =C2=B1 18%     +45.0%         50 =C2=B1  3%  sched_debug.cpu#9.c=
pu_load[2]
   1715208 =C2=B1 22%    +104.6%    3508980 =C2=B1 11%  sched_debug.cpu#9.s=
ched_count
        35 =C2=B1 18%     +42.0%         50 =C2=B1  3%  sched_debug.cpu#9.c=
pu_load[3]
      1901 =C2=B1  8%     +15.2%       2191 =C2=B1  0%  sched_debug.cpu#9.c=
urr->pid
   1715087 =C2=B1 22%    +104.6%    3508864 =C2=B1 11%  sched_debug.cpu#9.n=
r_switches
        35 =C2=B1 18%     +40.7%         49 =C2=B1  3%  sched_debug.cpu#9.c=
pu_load[0]
        35 =C2=B1 18%     +42.0%         50 =C2=B1  3%  sched_debug.cpu#9.c=
pu_load[4]
        35 =C2=B1 18%     +40.7%         49 =C2=B1  1%  sched_debug.cpu#9.l=
oad
        34 =C2=B1 15%     +47.8%         50 =C2=B1  3%  sched_debug.cpu#9.c=
pu_load[1]
    857164 =C2=B1 22%    +104.6%    1754026 =C2=B1 11%  sched_debug.cpu#9.s=
ched_goidle
    868187 =C2=B1 22%    +112.2%    1842383 =C2=B1 14%  sched_debug.cpu#9.t=
twu_count
       478 =C2=B1 12%     +49.7%        716 =C2=B1 21%  sched_debug.cpu#9.t=
twu_local

testcase/path_params/tbox_group: will-it-scale/pthread_mutex1/lkp-sb03

7675104990ed255b  1d0dcb3ad9d336e6d6ee020a75  =

----------------  --------------------------  =

       142 =C2=B1  0%     +26.7%        180 =C2=B1  0%  will-it-scale.time.=
user_time
  21289130 =C2=B1  1%     +60.5%   34178388 =C2=B1  1%  will-it-scale.time.=
voluntary_context_switches
      2337 =C2=B1  0%      -2.2%       2285 =C2=B1  0%  will-it-scale.time.=
system_time
    136738 =C2=B1  1%     +60.2%     219104 =C2=B1  1%  vmstat.system.cs
     24114 =C2=B1  2%     +19.0%      28694 =C2=B1  5%  vmstat.system.in
       142 =C2=B1  0%     +26.7%        180 =C2=B1  0%  time.user_time
  21289130 =C2=B1  1%     +60.5%   34178388 =C2=B1  1%  time.voluntary_cont=
ext_switches
      1025 =C2=B1 10%     +20.3%       1233 =C2=B1  8%  numa-meminfo.node0.=
Unevictable
      1025 =C2=B1 10%     +20.3%       1233 =C2=B1  8%  numa-meminfo.node0.=
Mlocked
      1210 =C2=B1  8%     -17.2%       1002 =C2=B1 10%  numa-meminfo.node1.=
Mlocked
      1210 =C2=B1  8%     -17.2%       1002 =C2=B1 10%  numa-meminfo.node1.=
Unevictable
       256 =C2=B1 10%     +20.2%        307 =C2=B1  8%  numa-vmstat.node0.n=
r_mlock
       256 =C2=B1 10%     +20.2%        307 =C2=B1  8%  numa-vmstat.node0.n=
r_unevictable
       302 =C2=B1  8%     -17.1%        250 =C2=B1 10%  numa-vmstat.node1.n=
r_mlock
       302 =C2=B1  8%     -17.1%        250 =C2=B1 10%  numa-vmstat.node1.n=
r_unevictable
  11992500 =C2=B1  1%     +64.4%   19712016 =C2=B1  2%  cpuidle.C1-SNB.usage
         9 =C2=B1 33%     -50.0%          4 =C2=B1 27%  latency_stats.avg.w=
ait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.hand=
le_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
   8981882 =C2=B1  2%     +31.8%   11837616 =C2=B1  2%  latency_stats.hits.=
futex_wait_queue_me.futex_wait.do_futex.SyS_futex.system_call_fastpath
   3056125 =C2=B1  0%      +1.0%    3085848 =C2=B1  0%  latency_stats.sum.d=
o_wait.SyS_wait4.system_call_fastpath
   4855509 =C2=B1  0%      +1.4%    4923890 =C2=B1  0%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
  16544499 =C2=B1  2%     +31.4%   21738877 =C2=B1  3%  latency_stats.sum.f=
utex_wait_queue_me.futex_wait.do_futex.SyS_futex.system_call_fastpath
      0.86 =C2=B1  1%     +29.4%       1.11 =C2=B1  2%  perf-profile.cpu-cy=
cles.print_context_stack.dump_trace.save_stack_trace_tsk.__account_schedule=
r_latency.enqueue_entity
      0.00 =C2=B1  0%      +Inf%       1.44 =C2=B1  6%  perf-profile.cpu-cy=
cles.ttwu_do_wakeup.ttwu_do_activate.try_to_wake_up.wake_up_process.wake_up=
_q
      0.00 =C2=B1  0%      +Inf%      10.52 =C2=B1  2%  perf-profile.cpu-cy=
cles.wake_up_q.futex_wake.do_futex.sys_futex.system_call_fastpath
      0.00 =C2=B1  0%      +Inf%       1.49 =C2=B1  3%  perf-profile.cpu-cy=
cles.mark_wake_futex.futex_wake.do_futex.sys_futex.system_call_fastpath
      0.00 =C2=B1  0%      +Inf%      10.04 =C2=B1  2%  perf-profile.cpu-cy=
cles.wake_up_process.wake_up_q.futex_wake.do_futex.sys_futex
      5.57 =C2=B1  1%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.wake_up_state.wake_futex.futex_wake.do_futex.sys_futex
      6.44 =C2=B1  1%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.wake_futex.futex_wake.do_futex.sys_futex.system_call_fastpath
     52.44 =C2=B1  0%     -17.7%      43.16 =C2=B1  0%  perf-profile.cpu-cy=
cles.futex_wake.do_futex.sys_futex.system_call_fastpath
      0.56 =C2=B1  2%     +93.7%       1.07 =C2=B1  4%  perf-profile.cpu-cy=
cles.tick_program_event.__hrtimer_start_range_ns.hrtimer_start_range_ns.tic=
k_nohz_restart.tick_nohz_idle_exit
      2.67 =C2=B1  2%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.enqueue_task.activate_task.ttwu_do_activate.try_to_wake_up.wake_up_sta=
te
      1.60 =C2=B1  1%     +85.3%       2.96 =C2=B1  5%  perf-profile.cpu-cy=
cles.__schedule.schedule.schedule_preempt_disabled.cpu_startup_entry.start_=
secondary
      1.55 =C2=B1  3%     +89.8%       2.94 =C2=B1  5%  perf-profile.cpu-cy=
cles.tick_nohz_idle_exit.cpu_startup_entry.start_secondary
      2.12 =C2=B1  1%     +59.8%       3.40 =C2=B1  1%  perf-profile.cpu-cy=
cles.enqueue_entity.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_ac=
tivate
      0.53 =C2=B1  6%     +79.9%       0.96 =C2=B1  3%  perf-profile.cpu-cy=
cles.menu_select.cpuidle_select.cpu_startup_entry.start_secondary
      1.04 =C2=B1  4%     +83.8%       1.90 =C2=B1  4%  perf-profile.cpu-cy=
cles.get_futex_value_locked.futex_wait_setup.futex_wait.do_futex.sys_futex
      0.60 =C2=B1  5%     +82.6%       1.10 =C2=B1  2%  perf-profile.cpu-cy=
cles.cpuidle_select.cpu_startup_entry.start_secondary
      1.12 =C2=B1  1%    +105.8%       2.30 =C2=B1  4%  perf-profile.cpu-cy=
cles.hrtimer_start.tick_nohz_stop_sched_tick.__tick_nohz_idle_enter.tick_no=
hz_idle_enter.cpu_startup_entry
      1.08 =C2=B1  1%    +105.5%       2.22 =C2=B1  4%  perf-profile.cpu-cy=
cles.__hrtimer_start_range_ns.hrtimer_start.tick_nohz_stop_sched_tick.__tic=
k_nohz_idle_enter.tick_nohz_idle_enter
      0.00 =C2=B1  0%      +Inf%       6.03 =C2=B1  1%  perf-profile.cpu-cy=
cles.ttwu_do_activate.constprop.87.try_to_wake_up.wake_up_process.wake_up_q=
.futex_wake
      0.00 =C2=B1  0%      +Inf%       4.55 =C2=B1  1%  perf-profile.cpu-cy=
cles.activate_task.ttwu_do_activate.try_to_wake_up.wake_up_process.wake_up_q
     89.43 =C2=B1  0%     -11.2%      79.44 =C2=B1  0%  perf-profile.cpu-cy=
cles.system_call_fastpath
      5.54 =C2=B1  1%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.try_to_wake_up.wake_up_state.wake_futex.futex_wake.do_futex
      2.41 =C2=B1  2%     +66.9%       4.02 =C2=B1  1%  perf-profile.cpu-cy=
cles.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activate.try_to_w=
ake_up
      1.31 =C2=B1  4%    +107.0%       2.72 =C2=B1  3%  perf-profile.cpu-cy=
cles.dequeue_task.deactivate_task.__schedule.schedule.futex_wait_queue_me
      1.32 =C2=B1  4%    +105.9%       2.72 =C2=B1  3%  perf-profile.cpu-cy=
cles.deactivate_task.__schedule.schedule.futex_wait_queue_me.futex_wait
      1.01 =C2=B1  2%     +29.6%       1.31 =C2=B1  3%  perf-profile.cpu-cy=
cles.__account_scheduler_latency.enqueue_entity.enqueue_task_fair.enqueue_t=
ask.activate_task
     89.24 =C2=B1  0%     -11.3%      79.12 =C2=B1  0%  perf-profile.cpu-cy=
cles.sys_futex.system_call_fastpath
     89.03 =C2=B1  0%     -11.6%      78.72 =C2=B1  0%  perf-profile.cpu-cy=
cles.do_futex.sys_futex.system_call_fastpath
     27.10 =C2=B1  0%     -34.4%      17.78 =C2=B1  1%  perf-profile.cpu-cy=
cles._raw_spin_lock.futex_wait_setup.futex_wait.do_futex.sys_futex
      0.66 =C2=B1  4%    +108.3%       1.38 =C2=B1  0%  perf-profile.cpu-cy=
cles.__remove_hrtimer.__hrtimer_start_range_ns.hrtimer_start.tick_nohz_stop=
_sched_tick.__tick_nohz_idle_enter
      0.87 =C2=B1  6%     +96.3%       1.71 =C2=B1  5%  perf-profile.cpu-cy=
cles.intel_idle.cpuidle_enter_state.cpuidle_enter.cpu_startup_entry.start_s=
econdary
      1.09 =C2=B1  5%     +92.6%       2.09 =C2=B1  4%  perf-profile.cpu-cy=
cles.tick_nohz_restart.tick_nohz_idle_exit.cpu_startup_entry.start_secondary
      1.23 =C2=B1  5%    +105.3%       2.52 =C2=B1  2%  perf-profile.cpu-cy=
cles.dequeue_task_fair.dequeue_task.deactivate_task.__schedule.schedule
      2.76 =C2=B1  1%    +102.0%       5.57 =C2=B1  1%  perf-profile.cpu-cy=
cles.__schedule.schedule.futex_wait_queue_me.futex_wait.do_futex
      0.93 =C2=B1  2%     +29.0%       1.20 =C2=B1  2%  perf-profile.cpu-cy=
cles.dump_trace.save_stack_trace_tsk.__account_scheduler_latency.enqueue_en=
tity.enqueue_task_fair
     31.56 =C2=B1  0%     -18.7%      25.64 =C2=B1  0%  perf-profile.cpu-cy=
cles.futex_wait_setup.futex_wait.do_futex.sys_futex.system_call_fastpath
      0.83 =C2=B1  3%     +87.6%       1.55 =C2=B1  5%  perf-profile.cpu-cy=
cles.hrtimer_start_range_ns.tick_nohz_restart.tick_nohz_idle_exit.cpu_start=
up_entry.start_secondary
      0.95 =C2=B1  2%     +28.6%       1.22 =C2=B1  2%  perf-profile.cpu-cy=
cles.save_stack_trace_tsk.__account_scheduler_latency.enqueue_entity.enqueu=
e_task_fair.enqueue_task
      0.53 =C2=B1  1%     +96.2%       1.04 =C2=B1  3%  perf-profile.cpu-cy=
cles.clockevents_program_event.tick_program_event.__remove_hrtimer.__hrtime=
r_start_range_ns.hrtimer_start
      1.60 =C2=B1  2%     +94.8%       3.12 =C2=B1  5%  perf-profile.cpu-cy=
cles.tick_nohz_stop_sched_tick.__tick_nohz_idle_enter.tick_nohz_idle_enter.=
cpu_startup_entry.start_secondary
     42.33 =C2=B1  0%     -40.8%      25.08 =C2=B1  1%  perf-profile.cpu-cy=
cles._raw_spin_lock.futex_wake.do_futex.sys_futex.system_call_fastpath
      2.86 =C2=B1  1%    +100.1%       5.72 =C2=B1  1%  perf-profile.cpu-cy=
cles.schedule.futex_wait_queue_me.futex_wait.do_futex.sys_futex
      0.54 =C2=B1  0%     +97.7%       1.06 =C2=B1  2%  perf-profile.cpu-cy=
cles.tick_program_event.__remove_hrtimer.__hrtimer_start_range_ns.hrtimer_s=
tart.tick_nohz_stop_sched_tick
      1.01 =C2=B1  7%    +103.5%       2.05 =C2=B1  3%  perf-profile.cpu-cy=
cles.dequeue_entity.dequeue_task_fair.dequeue_task.deactivate_task.__schedu=
le
      1.66 =C2=B1  0%     +86.1%       3.08 =C2=B1  5%  perf-profile.cpu-cy=
cles.schedule_preempt_disabled.cpu_startup_entry.start_secondary
      2.68 =C2=B1  2%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.activate_task.ttwu_do_activate.try_to_wake_up.wake_up_state.wake_futex
      1.80 =C2=B1  2%     +96.0%       3.53 =C2=B1  6%  perf-profile.cpu-cy=
cles.__tick_nohz_idle_enter.tick_nohz_idle_enter.cpu_startup_entry.start_se=
condary
      0.81 =C2=B1  3%     +96.6%       1.59 =C2=B1  2%  perf-profile.cpu-cy=
cles.__hrtimer_start_range_ns.hrtimer_start_range_ns.tick_nohz_restart.tick=
_nohz_idle_exit.cpu_startup_entry
      1.89 =C2=B1  2%     +95.5%       3.70 =C2=B1  5%  perf-profile.cpu-cy=
cles.tick_nohz_idle_enter.cpu_startup_entry.start_secondary
      3.42 =C2=B1  1%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.ttwu_do_activate.constprop.87.try_to_wake_up.wake_up_state.wake_futex.=
futex_wake
      1.05 =C2=B1  6%     +98.1%       2.08 =C2=B1  6%  perf-profile.cpu-cy=
cles.cpuidle_enter_state.cpuidle_enter.cpu_startup_entry.start_secondary
      0.62 =C2=B1  2%     +96.8%       1.23 =C2=B1  1%  perf-profile.cpu-cy=
cles.set_next_entity.pick_next_task_fair.__schedule.schedule.schedule_preem=
pt_disabled
      3.46 =C2=B1  1%     +97.6%       6.83 =C2=B1  1%  perf-profile.cpu-cy=
cles.futex_wait_queue_me.futex_wait.do_futex.sys_futex.system_call_fastpath
      0.00 =C2=B1  0%      +Inf%       4.54 =C2=B1  1%  perf-profile.cpu-cy=
cles.enqueue_task.activate_task.ttwu_do_activate.try_to_wake_up.wake_up_pro=
cess
      8.27 =C2=B1  1%     +91.7%      15.86 =C2=B1  4%  perf-profile.cpu-cy=
cles.start_secondary
      1.03 =C2=B1  2%     +96.4%       2.03 =C2=B1  1%  perf-profile.cpu-cy=
cles.pick_next_task_fair.__schedule.schedule.schedule_preempt_disabled.cpu_=
startup_entry
      8.12 =C2=B1  1%     +91.6%      15.56 =C2=B1  4%  perf-profile.cpu-cy=
cles.cpu_startup_entry.start_secondary
      1.10 =C2=B1  6%    +100.2%       2.21 =C2=B1  5%  perf-profile.cpu-cy=
cles.cpuidle_enter.cpu_startup_entry.start_secondary
      0.54 =C2=B1  2%     +94.4%       1.05 =C2=B1  3%  perf-profile.cpu-cy=
cles.clockevents_program_event.tick_program_event.__hrtimer_start_range_ns.=
hrtimer_start_range_ns.tick_nohz_restart
      1.61 =C2=B1  1%     +86.8%       3.01 =C2=B1  5%  perf-profile.cpu-cy=
cles.schedule.schedule_preempt_disabled.cpu_startup_entry.start_secondary
      0.00 =C2=B1  0%      +Inf%       9.90 =C2=B1  2%  perf-profile.cpu-cy=
cles.try_to_wake_up.wake_up_process.wake_up_q.futex_wake.do_futex
    510107 =C2=B1  6%     -24.1%     387141 =C2=B1 14%  sched_debug.cfs_rq[=
12]:/.min_vruntime
     19054 =C2=B1  8%     -26.6%      13995 =C2=B1 16%  sched_debug.cfs_rq[=
12]:/.exec_clock
       350 =C2=B1 31%     -36.2%        223 =C2=B1 30%  sched_debug.cfs_rq[=
13]:/.tg_runnable_contrib
     16072 =C2=B1 31%     -35.9%      10302 =C2=B1 29%  sched_debug.cfs_rq[=
13]:/.avg->runnable_avg_sum
     16913 =C2=B1 33%     -48.9%       8648 =C2=B1  3%  sched_debug.cfs_rq[=
14]:/.avg->runnable_avg_sum
        20 =C2=B1 49%     -48.8%         10 =C2=B1 31%  sched_debug.cfs_rq[=
14]:/.runnable_load_avg
       369 =C2=B1 33%     -48.8%        188 =C2=B1  3%  sched_debug.cfs_rq[=
14]:/.tg_runnable_contrib
       210 =C2=B1 17%     +70.7%        359 =C2=B1  2%  sched_debug.cfs_rq[=
15]:/.tg_runnable_contrib
     15752 =C2=B1 22%     +58.6%      24978 =C2=B1 21%  sched_debug.cfs_rq[=
15]:/.exec_clock
      9620 =C2=B1 17%     +70.9%      16437 =C2=B1  2%  sched_debug.cfs_rq[=
15]:/.avg->runnable_avg_sum
      8529 =C2=B1  5%     -10.4%       7639 =C2=B1  7%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
         2 =C2=B1 47%    +136.4%          6 =C2=B1 31%  sched_debug.cfs_rq[=
24]:/.nr_spread_over
     47788 =C2=B1  3%     +11.0%      53030 =C2=B1  4%  sched_debug.cfs_rq[=
28]:/.exec_clock
      8514 =C2=B1  5%     -10.3%       7634 =C2=B1  7%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
     17945 =C2=B1 18%     +14.3%      20504 =C2=B1 20%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
       391 =C2=B1 18%     +14.6%        448 =C2=B1 19%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
       360 =C2=B1 27%     +43.3%        516 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.tg_runnable_contrib
     22649 =C2=B1  7%     -27.4%      16434 =C2=B1  2%  sched_debug.cfs_rq[=
31]:/.avg->runnable_avg_sum
       493 =C2=B1  7%     -27.6%        357 =C2=B1  2%  sched_debug.cfs_rq[=
31]:/.tg_runnable_contrib
      8510 =C2=B1  5%     -10.3%       7634 =C2=B1  7%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
      8511 =C2=B1  5%     -12.3%       7461 =C2=B1 10%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
      8503 =C2=B1  5%     -12.3%       7460 =C2=B1 10%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
      8197 =C2=B1  6%      -9.2%       7446 =C2=B1 10%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
      2994 =C2=B1 18%     -40.2%       1792 =C2=B1 11%  sched_debug.cpu#10.=
ttwu_local
    620311 =C2=B1 16%     +19.5%     741285 =C2=B1  9%  sched_debug.cpu#11.=
avg_idle
      1291 =C2=B1 11%     +71.4%       2214 =C2=B1 17%  sched_debug.cpu#12.=
ttwu_local
     44903 =C2=B1  2%     -10.9%      40028 =C2=B1  6%  sched_debug.cpu#12.=
nr_load_updates
        18 =C2=B1 43%     -56.2%          8 =C2=B1 29%  sched_debug.cpu#14.=
cpu_load[1]
        16 =C2=B1 40%     -64.1%          5 =C2=B1 14%  sched_debug.cpu#14.=
cpu_load[4]
        16 =C2=B1 39%     -64.2%          6 =C2=B1 11%  sched_debug.cpu#14.=
cpu_load[3]
        20 =C2=B1 49%     -48.8%         10 =C2=B1 31%  sched_debug.cpu#14.=
cpu_load[0]
    651720 =C2=B1 19%     +24.1%     808588 =C2=B1  3%  sched_debug.cpu#14.=
avg_idle
        17 =C2=B1 42%     -61.4%          6 =C2=B1 16%  sched_debug.cpu#14.=
cpu_load[2]
    778639 =C2=B1  3%     -17.1%     645179 =C2=B1  3%  sched_debug.cpu#15.=
avg_idle
     54145 =C2=B1 40%     +98.6%     107550 =C2=B1 26%  sched_debug.cpu#15.=
sched_goidle
     48079 =C2=B1 36%    +114.8%     103279 =C2=B1 25%  sched_debug.cpu#15.=
ttwu_count
    109390 =C2=B1 40%     +99.3%     218008 =C2=B1 26%  sched_debug.cpu#15.=
nr_switches
      1187 =C2=B1 42%    +133.4%       2771 =C2=B1  9%  sched_debug.cpu#15.=
curr->pid
       349 =C2=B1 17%     +48.8%        520 =C2=B1  8%  sched_debug.cpu#16.=
ttwu_local
    904055 =C2=B1 18%     +61.1%    1456350 =C2=B1 22%  sched_debug.cpu#18.=
sched_goidle
   1810323 =C2=B1 18%     +61.1%    2915683 =C2=B1 22%  sched_debug.cpu#18.=
sched_count
   1809190 =C2=B1 18%     +61.0%    2913153 =C2=B1 22%  sched_debug.cpu#18.=
nr_switches
       289 =C2=B1 25%     +88.0%        543 =C2=B1 10%  sched_debug.cpu#20.=
ttwu_local
      3334 =C2=B1  8%     -26.2%       2460 =C2=B1 19%  sched_debug.cpu#21.=
curr->pid
     85059 =C2=B1 35%     +58.4%     134729 =C2=B1  4%  sched_debug.cpu#24.=
ttwu_count
    103842 =C2=B1  6%     +46.8%     152488 =C2=B1 13%  sched_debug.cpu#28.=
sched_goidle
    221524 =C2=B1  8%     +40.9%     312183 =C2=B1 13%  sched_debug.cpu#28.=
sched_count
    208190 =C2=B1  6%     +46.8%     305531 =C2=B1 13%  sched_debug.cpu#28.=
nr_switches
     86918 =C2=B1  5%     +68.6%     146587 =C2=B1 11%  sched_debug.cpu#28.=
ttwu_count
    207717 =C2=B1 16%     +31.4%     272890 =C2=B1  6%  sched_debug.cpu#29.=
nr_switches
    103534 =C2=B1 16%     +31.5%     136195 =C2=B1  6%  sched_debug.cpu#29.=
sched_goidle
     88859 =C2=B1 17%     +50.8%     134010 =C2=B1  8%  sched_debug.cpu#29.=
ttwu_count
    207734 =C2=B1 16%     +31.6%     273286 =C2=B1  6%  sched_debug.cpu#29.=
sched_count
       954 =C2=B1 22%     +56.1%       1489 =C2=B1 24%  sched_debug.cpu#3.t=
twu_local
     81526 =C2=B1 39%     +68.8%     137618 =C2=B1 16%  sched_debug.cpu#30.=
sched_goidle
    163546 =C2=B1 39%     +68.6%     275753 =C2=B1 16%  sched_debug.cpu#30.=
nr_switches
    163564 =C2=B1 39%     +72.4%     281962 =C2=B1 13%  sched_debug.cpu#30.=
sched_count
     70152 =C2=B1 37%     +89.1%     132670 =C2=B1 19%  sched_debug.cpu#30.=
ttwu_count
    497038 =C2=B1  1%     +32.8%     660184 =C2=B1  1%  sched_debug.cpu#31.=
avg_idle
       695 =C2=B1 25%     +49.6%       1040 =C2=B1 19%  sched_debug.cpu#4.t=
twu_local
       641 =C2=B1 12%     +58.6%       1017 =C2=B1 20%  sched_debug.cpu#6.t=
twu_local

testcase/path_params/tbox_group: tlbflush/performance-200%-32x-512/lituya

7675104990ed255b  1d0dcb3ad9d336e6d6ee020a75  =

----------------  --------------------------  =


lituya: Grantley Haswell
Memory: 16G

lkp-sb03: Sandy Bridge-EP
Memory: 64G






  7.5e+06 ++---------------------------------------------------------------=
-+
    7e+06 ++                                      O                        =
 |
          |                            O    O          O                   =
 |
  6.5e+06 O+   O                    O     O    O    O     O                =
 |
    6e+06 ++ O    O  O O  O O  O  O                                        =
 |
          |                                                                =
 |
  5.5e+06 ++                                                               =
 |
    5e+06 ++                                                               =
 |
  4.5e+06 ++                                                               =
 |
          |                                                                =
 |
    4e+06 ++                                                               =
 |
  3.5e+06 ++                                                               =
 |
          *..*.*..*..*.  .*.  .*..*.*..       .*.. .*..  .*.  .*.*..*..*.*.=
.*
    3e+06 ++           *.   *.         *..*.*.    *    *.   *.             =
 |
  2.5e+06 ++---------------------------------------------------------------=
-+




  7.5e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    7e+06 ++                           O    O     O                        =
 |
          |                                            O                   =
 |
  6.5e+06 O+   O                    O     O    O    O     O                =
 |
          |  O    O  O O  O O     O                                        =
 |
    6e+06 ++                   O                                           =
 |
          |                                                                =
 |
  5.5e+06 ++                                                               =
 |
          |                                                                =
 |
    5e+06 ++        .*                                                     =
 |
          |   .*..*.  :                        *.. .*..  .*.       .*..*.*.=
.*
  4.5e+06 *+.*        :  .*.*..*..*.*..  .*. ..   *    *.   *..*.*.        =
 |
          |            *.              *.   *                              =
 |
    4e+06 ++---------------------------------------------------------------=
-+


                                 cpuidle.C1-HSW.usage

    5e+07 ++---------------------------------------------------------------=
-+
          O                                                                =
 |
  4.5e+07 ++ O O  O  O O  O O  O  O O  O  O O  O  O O  O  O                =
 |
          |                                                                =
 |
          |                                                                =
 |
    4e+07 ++                                                               =
 |
          |                                                                =
 |
  3.5e+07 ++                                                               =
 |
          |                                                                =
 |
    3e+07 ++                                                               =
 |
          |                                                                =
 |
          *..*.*..*..*.*..*.*..*..*.*..*..*.*..*..*.     .*.  .*.  .*.. .*.=
.*
  2.5e+07 ++                                        *..*.   *.   *.    *   =
 |
          |                                                                =
 |
    2e+07 ++---------------------------------------------------------------=
-+


                           will-it-scale.time.user_time

  185 ++-------------------------------------------------------------------=
-+
  180 O+ O  O O  O  O  O          O  O  O O  O  O     O O                  =
 |
      |                   O O  O                   O                       =
 |
  175 ++                                                                   =
 |
  170 ++                                                                   =
 |
      |                                                                    =
 |
  165 ++                                                                   =
 |
  160 ++                                                                   =
 |
  155 ++                                                                   =
 |
      |                                                                    =
 |
  150 ++                                                                   =
 |
  145 ++                                                                   =
 |
      |                                                                    =
 |
  140 *+.*..    .*..*..*..*.*..*..*..*..*.*..  .*..  .*.     .*..  .*.     =
 |
  135 ++----*-*------------------------------*-----*----*--*-----*----*--*-=
-*


                          will-it-scale.time.system_time

  1250 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  1240 *+.*..*.*..*..*..*.*..*..*..*.*..*..*..*.*..*..*..*.*..*..*..*.*..*.=
.*
       |                                                                   =
 |
  1230 ++                                                                  =
 |
       |                                                                   =
 |
  1220 ++                                                                  =
 |
       |                                                                   =
 |
  1210 ++                                                                  =
 |
       |                                                                   =
 |
  1200 ++                                                                  =
 |
       |                                                                   =
 |
  1190 ++                                                                  =
 |
       |       O     O  O O  O  O  O               O                       =
 |
  1180 O+-O--O----O------------------O--O--O--O-O-----O--O-----------------=
-+


                  will-it-scale.time.percent_of_cpu_this_job_got

  453 *+-*--*-*--*--*--*--*-*--*--*--*--*-*--*--*--*--*-*--*--*--*--*-*--*-=
-*
      |                                                                    =
 |
  452 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  451 ++                                                                   =
 |
      |                                                                    =
 |
  450 ++                                                                   =
 |
      |                                                                    =
 |
  449 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  448 ++ O    O  O  O     O O  O  O                O                       =
 |
      |                                                                    =
 |
  447 O+----O----------O-------------O--O-O--O--O-----O-O------------------=
-+


                     will-it-scale.time.voluntary_context_switches

  5.5e+07 ++---------------------------------------------------------------=
-+
          O  O O     O    O    O  O    O  O O  O  O O  O  O                =
 |
          |       O    O    O       O                                      =
 |
    5e+07 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
  4.5e+07 ++                                                               =
 |
          |                                                                =
 |
    4e+07 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
  3.5e+07 ++                                                               =
 |
          |                                                                =
 |
          *..*.*..*..*.*..*.*..*..*.*..*..*.*..*..*.*..*..*.*..*.*..*..*.*.=
.*
    3e+07 ++---------------------------------------------------------------=
-+


                                  time.user_time

  185 ++-------------------------------------------------------------------=
-+
  180 O+ O  O O  O  O  O          O  O  O O  O  O     O O                  =
 |
      |                   O O  O                   O                       =
 |
  175 ++                                                                   =
 |
  170 ++                                                                   =
 |
      |                                                                    =
 |
  165 ++                                                                   =
 |
  160 ++                                                                   =
 |
  155 ++                                                                   =
 |
      |                                                                    =
 |
  150 ++                                                                   =
 |
  145 ++                                                                   =
 |
      |                                                                    =
 |
  140 *+.*..    .*..*..*..*.*..*..*..*..*.*..  .*..  .*.     .*..  .*.     =
 |
  135 ++----*-*------------------------------*-----*----*--*-----*----*--*-=
-*


                            time.voluntary_context_switches

  5.5e+07 ++---------------------------------------------------------------=
-+
          O  O O     O    O    O  O    O  O O  O  O O  O  O                =
 |
          |       O    O    O       O                                      =
 |
    5e+07 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
  4.5e+07 ++                                                               =
 |
          |                                                                =
 |
    4e+07 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
  3.5e+07 ++                                                               =
 |
          |                                                                =
 |
          *..*.*..*..*.*..*.*..*..*.*..*..*.*..*..*.*..*..*.*..*.*..*..*.*.=
.*
    3e+07 ++---------------------------------------------------------------=
-+


                                  vmstat.system.cs

  360000 ++----------------------------------------------------------------=
-+
         O  O O  O  O O  O  O O  O  O O  O  O  O O  O  O O                 =
 |
  340000 ++                                                                =
 |
  320000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++                                                                =
 |
         |                                                                 =
 |
  280000 ++                                                                =
 |
         |                                                                 =
 |
  260000 ++                                                                =
 |
  240000 ++                                                                =
 |
         |                                                                 =
 |
  220000 ++                                                                =
 |
         *..*.*..*..*.*..*..*.*..*..*.*..*..*..*.*..*..*.*..*..*.*..*..*.*.=
.*
  200000 ++----------------------------------------------------------------=
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


--===============1502768097908113484==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB3aWxsLWl0LXNjYWxlCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogcHJl
LXRlc3QKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAK
ICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1z
dGF0OgogICAgaW50ZXJ2YWw6IDEwCiAgbWVtaW5mbzogCiAgc2xhYmluZm86IAogIGludGVycnVw
dHM6IAogIGxvY2tfc3RhdDogCiAgbGF0ZW5jeV9zdGF0czogCiAgc29mdGlycXM6IAogIGJkaV9k
ZXZfbWFwcGluZzogCiAgZGlza3N0YXRzOiAKICBuZnNzdGF0OiAKICBjcHVpZGxlOiAKICBjcHVm
cmVxLXN0YXRzOiAKICB0dXJib3N0YXQ6IAogIHBtZXRlcjogCiAgc2NoZWRfZGVidWc6CiAgICBp
bnRlcnZhbDogNjAKZGVmYXVsdC13YXRjaGRvZ3M6CiAgd2F0Y2gtb29tOiAKICB3YXRjaGRvZzog
CmNwdWZyZXFfZ292ZXJub3I6IHBvd2Vyc2F2ZQpjb21taXQ6IDNlNmRmMTc5NzYzMGQzYTg1NTRi
NDU1MGVlYzcyNzI3NzA5MWIzNmYKbW9kZWw6IEdyYW50bGV5IEhhc3dlbGwKbnJfY3B1OiAxNgpt
ZW1vcnk6IDE2RwpoZGRfcGFydGl0aW9uczogCnN3YXBfcGFydGl0aW9uczogCnJvb3Rmc19wYXJ0
aXRpb246IApwZXJmLXByb2ZpbGU6CiAgZnJlcTogODAwCndpbGwtaXQtc2NhbGU6CiAgdGVzdDog
cHRocmVhZF9tdXRleDEKdGVzdGJveDogbGl0dXlhCnRib3hfZ3JvdXA6IGxpdHV5YQprY29uZmln
OiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTUtMDUtMDkgMDQ6NDg6MzUuODU3OTU3Mzg5
ICswODowMAp1c2VyOiBsa3AKcXVldWU6IGN5Y2xpYwpjb21waWxlcjogZ2NjLTQuOQpoZWFkX2Nv
bW1pdDogM2U2ZGYxNzk3NjMwZDNhODU1NGI0NTUwZWVjNzI3Mjc3MDkxYjM2ZgpiYXNlX2NvbW1p
dDogNWViZTZhZmFmMDA1N2FjM2VhZWI5OGRlZmQ1NDU2ODk0YjQ0NmQyMgpicmFuY2g6IGxpbnV4
LWRldmVsL2RldmVsLWhvdXJseS0yMDE1MDUwOTE4Cmtlcm5lbDogIi9wa2cvbGludXgveDg2XzY0
LXJoZWwvZ2NjLTQuOS8zZTZkZjE3OTc2MzBkM2E4NTU0YjQ1NTBlZWM3MjcyNzcwOTFiMzZmL3Zt
bGludXotNC4xLjAtcmMyLXdsLTAxNDEyLWczZTZkZjE3Igpyb290ZnM6IGRlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3oKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L3dpbGwtaXQtc2NhbGUvcG93ZXJz
YXZlLXB0aHJlYWRfbXV0ZXgxL2xpdHV5YS9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4
Nl82NC1yaGVsL2djYy00LjkvM2U2ZGYxNzk3NjMwZDNhODU1NGI0NTUwZWVjNzI3Mjc3MDkxYjM2
Zi8wIgpMS1BfU0VSVkVSOiBpbm4Kam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9saXR1eWEvY3lj
bGljX3dpbGwtaXQtc2NhbGUtcG93ZXJzYXZlLXB0aHJlYWRfbXV0ZXgxLXg4Nl82NC1yaGVsLUNZ
Q0xJQ19IRUFELTNlNmRmMTc5NzYzMGQzYTg1NTRiNDU1MGVlYzcyNzI3NzA5MWIzNmYtMC0yMDE1
MDUwOS0zNjkxNS1xaWFjZ3UueWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE1LTA1LTA5IDIyOjIyOjA1
LjUyNTY0MjA0NyArMDg6MDAKbWF4X3VwdGltZTogMTUwMAppbml0cmQ6ICIvb3NpbWFnZS9kZWJp
YW4vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9v
dD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpvYj0vbGtwL3NjaGVkdWxlZC9saXR1eWEvY3ljbGlj
X3dpbGwtaXQtc2NhbGUtcG93ZXJzYXZlLXB0aHJlYWRfbXV0ZXgxLXg4Nl82NC1yaGVsLUNZQ0xJ
Q19IRUFELTNlNmRmMTc5NzYzMGQzYTg1NTRiNDU1MGVlYzcyNzI3NzA5MWIzNmYtMC0yMDE1MDUw
OS0zNjkxNS1xaWFjZ3UueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAot
IGJyYW5jaD1saW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNTA1MDkxOAotIGNvbW1pdD0zZTZk
ZjE3OTc2MzBkM2E4NTU0YjQ1NTBlZWM3MjcyNzcwOTFiMzZmCi0gQk9PVF9JTUFHRT0vcGtnL2xp
bnV4L3g4Nl82NC1yaGVsL2djYy00LjkvM2U2ZGYxNzk3NjMwZDNhODU1NGI0NTUwZWVjNzI3Mjc3
MDkxYjM2Zi92bWxpbnV6LTQuMS4wLXJjMi13bC0wMTQxMi1nM2U2ZGYxNwotIG1heF91cHRpbWU9
MTUwMAotIFJFU1VMVF9ST09UPS9yZXN1bHQvd2lsbC1pdC1zY2FsZS9wb3dlcnNhdmUtcHRocmVh
ZF9tdXRleDEvbGl0dXlhL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwv
Z2NjLTQuOS8zZTZkZjE3OTc2MzBkM2E4NTU0YjQ1NTBlZWM3MjcyNzcwOTFiMzZmLzAKLSBMS1Bf
U0VSVkVSPWlubgotIHwyLQoKCiAgZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIHN5c3RlbWQubG9n
X2xldmVsPWVycgogIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRh
dGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9
MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFt
ZGlzaz0wCiAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwKCiAg
cncKbGtwX2luaXRyZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2luaXRyZDog
Ii9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS8zZTZkZjE3OTc2MzBkM2E4NTU0YjQ1NTBl
ZWM3MjcyNzcwOTFiMzZmL21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2Rl
Ymlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14
ODZfNjQtMjAxNS0wMi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlh
bi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvdHVy
Ym9zdGF0LmNneiwvbGtwL2JlbmNobWFya3Mvd2lsbC1pdC1zY2FsZS5jZ3oiCmpvYl9zdGF0ZTog
ZmluaXNoZWQKbG9hZGF2ZzogOS41OCA1Ljg1IDIuNDEgMS8yMTMgNDgwNwpzdGFydF90aW1lOiAn
MTQzMTE4MTM2MScKZW5kX3RpbWU6ICcxNDMxMTgxNjY1Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNy
Yy0yMDE1MDUwOS0yMDE3MzYiCg==

--===============1502768097908113484==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUwL2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTIvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJz
YXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJz
YXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNh
dmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgouL3J1bnRlc3QucHkgcHRocmVhZF9tdXRleDEgMzIgYm90aCAxIDggMTIgMTYK

--===============1502768097908113484==--

