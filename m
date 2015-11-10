Content-Type: multipart/mixed; boundary="===============5719695183688776501=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [cpuidle, menu] 0c30c691fe: -9.9% fsmark.app_overhead, +76.7% turbostat.%Busy
Date: Tue, 10 Nov 2015 10:28:04 +0800
Message-ID: <87611ad1vv.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5719695183688776501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://github.com/0day-ci/linux riel-redhat-com/cpuidle-small-improvements=
-fixes-for-menu-governor-resend/20151104-063831
commit 0c30c691fe875fc1f8d6ac97c36d914830ff36bd ("cpuidle,menu: use interac=
tivity_req to disable polling")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/nr_=
threads/disk/fs/filesize/test_size/sync_method/nr_directories/nr_files_per_=
directory:
  lkp-ne04/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performa=
nce/1x/32t/1HDD/f2fs/5K/400M/fsyncBeforeClose/16d/256fpd

commit: =

  1de5243ef31e0f138ca13fe28524819da648fab3
  0c30c691fe875fc1f8d6ac97c36d914830ff36bd

1de5243ef31e0f13 0c30c691fe875fc1f8d6ac97c3 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   7509492 =C2=B1  6%      -9.9%    6763959 =C2=B1  5%  fsmark.app_overhead
      1539 =C2=B1  0%      -6.8%       1434 =C2=B1  0%  vmstat.system.in
      0.00 =C2=B1 -1%      +Inf%    6139416 =C2=B1106%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%    6139416 =C2=B1106%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%    6139416 =C2=B1106%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
  52047094 =C2=B1  5%     -72.4%   14389925 =C2=B1  6%  cpuidle.C1-NHM.time
    240980 =C2=B1  4%     -94.7%      12665 =C2=B1  4%  cpuidle.C1-NHM.usage
     49879 =C2=B1 38%  +84818.1%   42356292 =C2=B1  9%  cpuidle.POLL.time
      1948 =C2=B1 19%  +11824.2%     232344 =C2=B1  4%  cpuidle.POLL.usage
      1.95 =C2=B1  1%     +76.7%       3.45 =C2=B1  3%  turbostat.%Busy
     38.50 =C2=B1  1%    +127.3%      87.50 =C2=B1  5%  turbostat.Avg_MHz
      1969 =C2=B1  0%     +29.1%       2541 =C2=B1  1%  turbostat.Bzy_MHz
      7.40 =C2=B1  1%     -15.4%       6.26 =C2=B1  2%  turbostat.CPU%c1
      1750 =C2=B1 27%     -23.4%       1340 =C2=B1 35%  sched_debug.cfs_rq[=
11]:/.exec_clock
      1.50 =C2=B1 33%    +216.7%       4.75 =C2=B1 37%  sched_debug.cfs_rq[=
12]:/.nr_spread_over
      7.00 =C2=B1 14%     -50.0%       3.50 =C2=B1 65%  sched_debug.cfs_rq[=
13]:/.nr_spread_over
      2722 =C2=B1  6%     +30.4%       3550 =C2=B1 11%  sched_debug.cfs_rq[=
14]:/.min_vruntime
      1610 =C2=B1 17%     +27.9%       2058 =C2=B1  8%  sched_debug.cfs_rq[=
15]:/.exec_clock
      3225 =C2=B1 15%     +30.4%       4206 =C2=B1  9%  sched_debug.cfs_rq[=
15]:/.min_vruntime
      6755 =C2=B1  3%     -44.8%       3726 =C2=B1 42%  sched_debug.cfs_rq[=
3]:/.exec_clock
    111.00 =C2=B1 85%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.load
      9237 =C2=B1  1%     -40.1%       5534 =C2=B1 34%  sched_debug.cfs_rq[=
3]:/.min_vruntime
     41.50 =C2=B1 34%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
      3879 =C2=B1 15%    -110.0%    -388.37 =C2=B1-712%  sched_debug.cfs_rq=
[3]:/.spread0
    322.50 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.utilization_load_avg
      2596 =C2=B1 22%     +70.5%       4428 =C2=B1 33%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum
     55.50 =C2=B1 22%     +73.9%      96.50 =C2=B1 33%  sched_debug.cfs_rq[=
4]:/.tg_runnable_contrib
      6225 =C2=B1 25%     -34.9%       4051 =C2=B1 25%  sched_debug.cfs_rq[=
5]:/.min_vruntime
      8.00 =C2=B1 25%     -50.0%       4.00 =C2=B1 30%  sched_debug.cfs_rq[=
5]:/.nr_spread_over
    867.69 =C2=B1130%    -315.7%      -1871 =C2=B1-70%  sched_debug.cfs_rq[=
5]:/.spread0
      2468 =C2=B1  5%     +19.7%       2953 =C2=B1  7%  sched_debug.cfs_rq[=
6]:/.avg->runnable_avg_sum
      2007 =C2=B1  8%     -52.0%     962.75 =C2=B1 50%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
      2060 =C2=B1  7%     -53.2%     965.00 =C2=B1 49%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
     53.00 =C2=B1  5%     +20.8%      64.00 =C2=B1  6%  sched_debug.cfs_rq[=
6]:/.tg_runnable_contrib
      1523 =C2=B1  3%    +118.3%       3325 =C2=B1 32%  sched_debug.cfs_rq[=
7]:/.exec_clock
      4211 =C2=B1  1%     +21.2%       5103 =C2=B1 18%  sched_debug.cfs_rq[=
7]:/.min_vruntime
      1101 =C2=B1  6%     +41.7%       1560 =C2=B1 22%  sched_debug.cfs_rq[=
8]:/.exec_clock
      2031 =C2=B1 27%     -51.7%     981.25 =C2=B1 59%  sched_debug.cfs_rq[=
9]:/.blocked_load_avg
     -1233 =C2=B1-74%    +149.3%      -3075 =C2=B1-28%  sched_debug.cfs_rq[=
9]:/.spread0
    963152 =C2=B1  2%     -20.7%     763351 =C2=B1  9%  sched_debug.cpu#0.a=
vg_idle
     -1808 =C2=B1 -1%      +7.7%      -1947 =C2=B1 -3%  sched_debug.cpu#0.n=
r_uninterruptible
     18.00 =C2=B1  0%     -96.3%       0.67 =C2=B1141%  sched_debug.cpu#1.c=
pu_load[1]
     13.50 =C2=B1 11%     -90.1%       1.33 =C2=B1141%  sched_debug.cpu#1.c=
pu_load[2]
      9.50 =C2=B1 15%     -92.1%       0.75 =C2=B1173%  sched_debug.cpu#1.c=
pu_load[3]
      6.50 =C2=B1  7%     -74.4%       1.67 =C2=B1 74%  sched_debug.cpu#1.c=
pu_load[4]
     38209 =C2=B1  3%     +24.2%      47439 =C2=B1 15%  sched_debug.cpu#10.=
nr_switches
     38245 =C2=B1  3%     +26.3%      48291 =C2=B1 14%  sched_debug.cpu#10.=
sched_count
      0.00 =C2=B1  0%      +Inf%       4.50 =C2=B1 71%  sched_debug.cpu#12.=
cpu_load[3]
     73134 =C2=B1  5%     -47.1%      38683 =C2=B1  3%  sched_debug.cpu#12.=
nr_switches
     73179 =C2=B1  5%     -47.1%      38721 =C2=B1  3%  sched_debug.cpu#12.=
sched_count
     34479 =C2=B1  5%     -50.3%      17139 =C2=B1  3%  sched_debug.cpu#12.=
sched_goidle
      1920 =C2=B1  2%     -13.3%       1663 =C2=B1  6%  sched_debug.cpu#13.=
ttwu_local
     39693 =C2=B1  4%     +12.9%      44825 =C2=B1  6%  sched_debug.cpu#14.=
sched_count
    764.00 =C2=B1  4%     +23.7%     944.75 =C2=B1 10%  sched_debug.cpu#14.=
ttwu_local
    232.50 =C2=B1  9%     -13.7%     200.75 =C2=B1  9%  sched_debug.cpu#15.=
nr_uninterruptible
   1000000 =C2=B1  0%     -15.1%     849463 =C2=B1  8%  sched_debug.cpu#2.a=
vg_idle
    -56.50 =C2=B1-36%     +73.9%     -98.25 =C2=B1-24%  sched_debug.cpu#2.n=
r_uninterruptible
    590.50 =C2=B1 43%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#3.c=
urr->pid
    111.00 =C2=B1 85%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#3.l=
oad
     31005 =C2=B1 20%     -23.0%      23886 =C2=B1  7%  sched_debug.cpu#3.t=
twu_count
    900645 =C2=B1  0%     -14.3%     771998 =C2=B1  7%  sched_debug.cpu#4.a=
vg_idle
     33801 =C2=B1 21%     -26.1%      24967 =C2=B1 12%  sched_debug.cpu#4.t=
twu_count
    851849 =C2=B1  7%     -15.0%     724256 =C2=B1 15%  sched_debug.cpu#5.a=
vg_idle
      1905 =C2=B1  6%     +30.3%       2483 =C2=B1 13%  sched_debug.cpu#6.t=
twu_local
     12046 =C2=B1  1%      -8.7%      10997 =C2=B1  7%  sched_debug.cpu#9.n=
r_load_updates

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/nr_=
threads/disk/fs/fs2/filesize/test_size/sync_method/nr_directories/nr_files_=
per_directory:
  nhm4/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/=
1x/32t/1HDD/f2fs/nfsv4/16MB/60G/NoSync/16d/256fpd

commit: =

  1de5243ef31e0f138ca13fe28524819da648fab3
  0c30c691fe875fc1f8d6ac97c36d914830ff36bd

1de5243ef31e0f13 0c30c691fe875fc1f8d6ac97c3 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

 2.966e+08 =C2=B1  2%      +5.8%  3.137e+08 =C2=B1  1%  fsmark.app_overhead
   2681995 =C2=B1  0%      +5.1%    2817555 =C2=B1  0%  fsmark.time.volunta=
ry_context_switches
     31908 =C2=B1  0%      +1.9%      32517 =C2=B1  0%  vmstat.system.cs
      5.88 =C2=B1  1%    +179.6%      16.44 =C2=B1  3%  turbostat.%Busy
    194.50 =C2=B1  1%    +182.4%     549.25 =C2=B1  3%  turbostat.Avg_MHz
     25.23 =C2=B1  3%     -28.8%      17.96 =C2=B1  3%  turbostat.CPU%c1
 5.785e+08 =C2=B1  4%     -73.8%  1.517e+08 =C2=B1  4%  cpuidle.C1-NHM.time
   7183573 =C2=B1  0%     -33.4%    4785240 =C2=B1  0%  cpuidle.C1-NHM.usage
  24298203 =C2=B1 11%   +2162.0%  5.496e+08 =C2=B1  4%  cpuidle.POLL.time
     24755 =C2=B1  3%  +10280.9%    2569797 =C2=B1  1%  cpuidle.POLL.usage
      1074 =C2=B1 38%     +68.3%       1807 =C2=B1 40%  sched_debug.cfs_rq[=
1]:/.blocked_load_avg
     22.00 =C2=B1 96%    +176.1%      60.75 =C2=B1 27%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
      1105 =C2=B1 39%     +69.4%       1873 =C2=B1 38%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
      1811 =C2=B1 41%     -54.7%     821.25 =C2=B1 34%  sched_debug.cfs_rq[=
2]:/.blocked_load_avg
      1849 =C2=B1 40%     -53.9%     853.25 =C2=B1 35%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
      2245 =C2=B1 27%     -36.3%       1431 =C2=B1 25%  sched_debug.cfs_rq[=
4]:/.blocked_load_avg
      2242 =C2=B1156%     -95.8%      93.67 =C2=B1 72%  sched_debug.cfs_rq[=
4]:/.load
      2478 =C2=B1 24%     -40.8%       1467 =C2=B1 24%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
    201.50 =C2=B1 22%     -53.5%      93.67 =C2=B1 72%  sched_debug.cpu#4.l=
oad
     25.75 =C2=B1109%    +150.5%      64.50 =C2=B1 33%  sched_debug.cpu#5.c=
pu_load[1]
    117.50 =C2=B1 12%     +19.8%     140.75 =C2=B1 12%  sched_debug.cpu#6.n=
r_uninterruptible
    249339 =C2=B1  6%    +266.3%     913374 =C2=B1119%  sched_debug.cpu#7.t=
twu_count
     52587 =C2=B1  4%   +1208.6%     688188 =C2=B1159%  sched_debug.cpu#7.t=
twu_local

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/test:
  lkp-sb03/will-it-scale/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/b=
rk1

commit: =

  1de5243ef31e0f138ca13fe28524819da648fab3
  0c30c691fe875fc1f8d6ac97c36d914830ff36bd

1de5243ef31e0f13 0c30c691fe875fc1f8d6ac97c3 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    104.75 =C2=B1  2%      +6.2%     111.25 =C2=B1  1%  will-it-scale.time.=
percent_of_cpu_this_job_got
    330.49 =C2=B1  2%      +8.1%     357.41 =C2=B1  1%  will-it-scale.time.=
system_time
  35829732 =C2=B1  1%      -2.4%   34975224 =C2=B1  1%  will-it-scale.time.=
voluntary_context_switches
      5081 =C2=B1 19%     -20.0%       4067 =C2=B1  0%  numa-meminfo.node1.=
AnonHugePages
     10097 =C2=B1  5%     +16.5%      11766 =C2=B1  7%  slabinfo.kmalloc-25=
6.active_objs
     10979 =C2=B1  5%     +14.4%      12565 =C2=B1  7%  slabinfo.kmalloc-25=
6.num_objs
    226317 =C2=B1  1%      -3.6%     218100 =C2=B1  1%  vmstat.system.cs
     19905 =C2=B1  4%     -16.5%      16619 =C2=B1  4%  vmstat.system.in
      5449 =C2=B1 79%    +114.3%      11678 =C2=B1173%  latency_stats.avg.c=
all_rwsem_down_read_failed.task_numa_work.task_work_run.do_notify_resume.re=
tint_signal
      5533 =C2=B1 78%    +111.1%      11678 =C2=B1173%  latency_stats.max.c=
all_rwsem_down_read_failed.task_numa_work.task_work_run.do_notify_resume.re=
tint_signal
      6440 =C2=B1  5%    +489.7%      37980 =C2=B1 88%  latency_stats.max.c=
all_rwsem_down_write_failed.SyS_mprotect.entry_SYSCALL_64_fastpath
      7367 =C2=B1 70%     +58.5%      11678 =C2=B1173%  latency_stats.sum.c=
all_rwsem_down_read_failed.task_numa_work.task_work_run.do_notify_resume.re=
tint_signal
      9213 =C2=B1 23%    +327.4%      39378 =C2=B1 87%  latency_stats.sum.c=
all_rwsem_down_write_failed.SyS_mprotect.entry_SYSCALL_64_fastpath
     28.29 =C2=B1  0%     +68.1%      47.56 =C2=B1  0%  turbostat.%Busy
    875.25 =C2=B1  0%     +67.6%       1466 =C2=B1  0%  turbostat.Avg_MHz
     42.84 =C2=B1  0%     -43.4%      24.25 =C2=B1  0%  turbostat.CPU%c1
      0.04 =C2=B1 14%     -57.1%       0.01 =C2=B1 33%  turbostat.CPU%c3
     95.41 =C2=B1  0%     +22.0%     116.38 =C2=B1  0%  turbostat.CorWatt
     47.00 =C2=B1  1%     +14.4%      53.75 =C2=B1  0%  turbostat.CoreTmp
     47.50 =C2=B1  1%     +14.7%      54.50 =C2=B1  2%  turbostat.PkgTmp
    122.99 =C2=B1  0%     +17.1%     143.99 =C2=B1  0%  turbostat.PkgWatt
 2.127e+09 =C2=B1  1%     -89.7%  2.184e+08 =C2=B1  4%  cpuidle.C1-SNB.time
  26448928 =C2=B1  7%     -88.4%    3068569 =C2=B1 35%  cpuidle.C1-SNB.usage
   6961573 =C2=B1 37%     -49.3%    3531923 =C2=B1 13%  cpuidle.C1E-SNB.time
      3507 =C2=B1 22%     -42.9%       2002 =C2=B1  8%  cpuidle.C1E-SNB.usa=
ge
   2388876 =C2=B1 39%     -51.0%    1171617 =C2=B1 11%  cpuidle.C3-SNB.time
      2058 =C2=B1 21%     -54.7%     931.25 =C2=B1 12%  cpuidle.C3-SNB.usage
    287398 =C2=B1  2%     -11.2%     255069 =C2=B1  0%  cpuidle.C7-SNB.usage
    782931 =C2=B1171%  +2.6e+05%   2.02e+09 =C2=B1  0%  cpuidle.POLL.time
      2079 =C2=B1 12%  +1.2e+06%   25220612 =C2=B1  3%  cpuidle.POLL.usage
      2.75 =C2=B1 30%     +81.8%       5.00 =C2=B1 14%  sched_debug.cfs_rq[=
0]:/.nr_spread_over
    905.00 =C2=B1 31%    +136.6%       2141 =C2=B1 15%  sched_debug.cfs_rq[=
11]:/.avg->runnable_avg_sum
    102.50 =C2=B1 95%    +599.8%     717.25 =C2=B1114%  sched_debug.cfs_rq[=
11]:/.blocked_load_avg
      1.75 =C2=B1 62%    +257.1%       6.25 =C2=B1 47%  sched_debug.cfs_rq[=
11]:/.nr_spread_over
    103.50 =C2=B1 96%    +607.0%     731.75 =C2=B1114%  sched_debug.cfs_rq[=
11]:/.tg_load_contrib
     19.25 =C2=B1 33%    +139.0%      46.00 =C2=B1 15%  sched_debug.cfs_rq[=
11]:/.tg_runnable_contrib
      4000 =C2=B1 50%     +86.5%       7460 =C2=B1 51%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
     87.25 =C2=B1 52%     +85.7%     162.00 =C2=B1 51%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
    488.25 =C2=B1 61%     -81.4%      91.00 =C2=B1 87%  sched_debug.cfs_rq[=
20]:/.blocked_load_avg
    464.00 =C2=B1 15%     -43.9%     260.25 =C2=B1 54%  sched_debug.cfs_rq[=
22]:/.blocked_load_avg
    474.50 =C2=B1 15%     -42.1%     274.75 =C2=B1 46%  sched_debug.cfs_rq[=
22]:/.tg_load_contrib
     11201 =C2=B1 16%     -28.6%       8000 =C2=B1 10%  sched_debug.cfs_rq[=
26]:/.tg_load_avg
     11196 =C2=B1 16%     -33.2%       7476 =C2=B1 20%  sched_debug.cfs_rq[=
27]:/.tg_load_avg
     10602 =C2=B1 18%     -29.4%       7489 =C2=B1 20%  sched_debug.cfs_rq[=
28]:/.tg_load_avg
     10546 =C2=B1 19%     -29.0%       7489 =C2=B1 20%  sched_debug.cfs_rq[=
29]:/.tg_load_avg
     10552 =C2=B1 19%     -29.5%       7439 =C2=B1 20%  sched_debug.cfs_rq[=
30]:/.tg_load_avg
     10502 =C2=B1 20%     -29.6%       7398 =C2=B1 20%  sched_debug.cfs_rq[=
31]:/.tg_load_avg
    899.75 =C2=B1 63%     -75.9%     217.25 =C2=B1 75%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
     33.00 =C2=B1 -3%    +166.7%      88.00 =C2=B1 20%  sched_debug.cfs_rq[=
9]:/.load
     12.00 =C2=B1 -8%    +306.2%      48.75 =C2=B1 74%  sched_debug.cfs_rq[=
9]:/.runnable_load_avg
     55.00 =C2=B1 -1%    +431.8%     292.50 =C2=B1 26%  sched_debug.cfs_rq[=
9]:/.utilization_load_avg
      2.50 =C2=B1107%    +410.0%      12.75 =C2=B1 36%  sched_debug.cpu#1.c=
pu_load[2]
      2.00 =C2=B1 79%    +687.5%      15.75 =C2=B1 34%  sched_debug.cpu#1.c=
pu_load[3]
      2.50 =C2=B1 72%    +570.0%      16.75 =C2=B1 51%  sched_debug.cpu#1.c=
pu_load[4]
      2252 =C2=B1 22%     +44.8%       3260 =C2=B1 13%  sched_debug.cpu#1.t=
twu_local
      5.00 =C2=B1 61%    +100.0%      10.00 =C2=B1 27%  sched_debug.cpu#13.=
cpu_load[4]
     23.25 =C2=B1 54%     -81.4%       4.33 =C2=B1 96%  sched_debug.cpu#14.=
cpu_load[1]
     19.50 =C2=B1 61%     -76.1%       4.67 =C2=B1 82%  sched_debug.cpu#14.=
cpu_load[2]
     15.50 =C2=B1 86%     -78.5%       3.33 =C2=B1 78%  sched_debug.cpu#14.=
cpu_load[3]
     13.00 =C2=B1107%     -84.6%       2.00 =C2=B1 70%  sched_debug.cpu#14.=
cpu_load[4]
      9.50 =C2=B1 27%     -39.5%       5.75 =C2=B1 37%  sched_debug.cpu#16.=
cpu_load[2]
      7.50 =C2=B1 22%     -40.0%       4.50 =C2=B1 33%  sched_debug.cpu#16.=
cpu_load[3]
    676459 =C2=B1  8%     +18.9%     804468 =C2=B1 13%  sched_debug.cpu#2.a=
vg_idle
     -1.00 =C2=B1-70%    -425.0%       3.25 =C2=B1 54%  sched_debug.cpu#21.=
nr_uninterruptible
   1971003 =C2=B1  9%     -21.7%    1544151 =C2=B1 19%  sched_debug.cpu#23.=
nr_switches
   2043058 =C2=B1  9%     -21.2%    1610570 =C2=B1 18%  sched_debug.cpu#23.=
sched_count
    985071 =C2=B1  9%     -21.6%     771987 =C2=B1 19%  sched_debug.cpu#23.=
sched_goidle
   1244880 =C2=B1 32%     -38.7%     763279 =C2=B1 27%  sched_debug.cpu#23.=
ttwu_count
      8.25 =C2=B1 78%     -75.8%       2.00 =C2=B1108%  sched_debug.cpu#28.=
cpu_load[3]
      6.75 =C2=B1 54%     -81.5%       1.25 =C2=B1 34%  sched_debug.cpu#28.=
cpu_load[4]
    376.00 =C2=B1  2%     +18.2%     444.25 =C2=B1 11%  sched_debug.cpu#28.=
ttwu_local
     17.25 =C2=B1 54%     -72.5%       4.75 =C2=B1 73%  sched_debug.cpu#29.=
cpu_load[2]
     14.25 =C2=B1 45%     -73.7%       3.75 =C2=B1 68%  sched_debug.cpu#29.=
cpu_load[3]
     11.00 =C2=B1 49%     -72.7%       3.00 =C2=B1 62%  sched_debug.cpu#29.=
cpu_load[4]
    165177 =C2=B1 37%    +133.9%     386374 =C2=B1 29%  sched_debug.cpu#29.=
nr_switches
    177745 =C2=B1 38%    +129.4%     407813 =C2=B1 28%  sched_debug.cpu#29.=
sched_count
     82161 =C2=B1 37%    +134.9%     193016 =C2=B1 29%  sched_debug.cpu#29.=
sched_goidle
    689.75 =C2=B1 62%     -41.4%     404.00 =C2=B1  7%  sched_debug.cpu#29.=
ttwu_local
     -3.75 =C2=B1-80%    -180.0%       3.00 =C2=B1105%  sched_debug.cpu#5.n=
r_uninterruptible
    774864 =C2=B1 37%     -50.6%     382807 =C2=B1 31%  sched_debug.cpu#5.t=
twu_count
    897279 =C2=B1  7%     -13.7%     774608 =C2=B1  5%  sched_debug.cpu#8.a=
vg_idle
    778200 =C2=B1  8%     +22.0%     949175 =C2=B1  2%  sched_debug.cpu#9.a=
vg_idle
      1389 =C2=B1  0%      +4.0%       1444 =C2=B1 66%  sched_debug.cpu#9.c=
urr->pid
     33.00 =C2=B1 -3%    +166.7%      88.00 =C2=B1 20%  sched_debug.cpu#9.l=
oad
     -5.25 =C2=B1-88%    -138.1%       2.00 =C2=B1 79%  sched_debug.cpu#9.n=
r_uninterruptible
      1914 =C2=B1 24%     +81.7%       3479 =C2=B1 37%  sched_debug.cpu#9.t=
twu_local
      1.82 =C2=B1 19%     -47.9%       0.95 =C2=B1 26%  perf-profile.cycles=
.__account_scheduler_latency.enqueue_entity.enqueue_task_fair.enqueue_task.=
activate_task
      1.84 =C2=B1  6%     -58.4%       0.77 =C2=B1 10%  perf-profile.cycles=
.__remove_hrtimer.hrtimer_start_range_ns.tick_nohz_stop_sched_tick.__tick_n=
ohz_idle_enter.tick_nohz_idle_enter
      0.60 =C2=B1 45%     -62.7%       0.23 =C2=B1 28%  perf-profile.cycles=
.__remove_hrtimer.hrtimer_try_to_cancel.hrtimer_cancel.tick_nohz_restart.ti=
ck_nohz_idle_exit
     15.17 =C2=B1  6%     -66.2%       5.13 =C2=B1 11%  perf-profile.cycles=
.__rwsem_do_wake.rwsem_wake.call_rwsem_wake.sys_brk.entry_SYSCALL_64_fastpa=
th
      6.64 =C2=B1  3%     -64.2%       2.38 =C2=B1  5%  perf-profile.cycles=
.__schedule.schedule.rwsem_down_write_failed.call_rwsem_down_write_failed.s=
ys_brk
      4.99 =C2=B1  3%     -66.5%       1.67 =C2=B1  6%  perf-profile.cycles=
.__schedule.schedule.schedule_preempt_disabled.cpu_startup_entry.start_seco=
ndary
      4.76 =C2=B1  1%     -69.2%       1.47 =C2=B1 11%  perf-profile.cycles=
.__split_vma.isra.34.do_munmap.sys_brk.entry_SYSCALL_64_fastpath
      4.80 =C2=B1  2%     -59.7%       1.94 =C2=B1 10%  perf-profile.cycles=
.__tick_nohz_idle_enter.tick_nohz_idle_enter.cpu_startup_entry.start_second=
ary
      0.89 =C2=B1 17%     -65.5%       0.31 =C2=B1 19%  perf-profile.cycles=
._raw_spin_lock.try_to_wake_up.wake_up_process.__rwsem_do_wake.rwsem_wake
      2.41 =C2=B1 21%     -56.4%       1.05 =C2=B1 33%  perf-profile.cycles=
._raw_spin_lock_irqsave.rwsem_wake.call_rwsem_wake.sys_brk.entry_SYSCALL_64=
_fastpath
      6.50 =C2=B1  8%     -63.1%       2.40 =C2=B1 11%  perf-profile.cycles=
.activate_task.ttwu_do_activate.try_to_wake_up.wake_up_process.__rwsem_do_w=
ake
      1.81 =C2=B1 10%     -69.4%       0.55 =C2=B1 19%  perf-profile.cycles=
.anon_vma_clone.__split_vma.do_munmap.sys_brk.entry_SYSCALL_64_fastpath
      5.59 =C2=B1  8%   +1133.2%      68.97 =C2=B1  1%  perf-profile.cycles=
.call_cpuidle.cpu_startup_entry.start_secondary
     21.03 =C2=B1  6%     -69.6%       6.38 =C2=B1 17%  perf-profile.cycles=
.call_rwsem_down_write_failed.sys_brk.entry_SYSCALL_64_fastpath
     19.17 =C2=B1  7%     -64.8%       6.74 =C2=B1 13%  perf-profile.cycles=
.call_rwsem_wake.sys_brk.entry_SYSCALL_64_fastpath
      1.28 =C2=B1  4%     -69.6%       0.39 =C2=B1 13%  perf-profile.cycles=
.check_preempt_curr.ttwu_do_wakeup.ttwu_do_activate.try_to_wake_up.wake_up_=
process
      1.55 =C2=B1  6%     -60.6%       0.61 =C2=B1 14%  perf-profile.cycles=
.clockevents_program_event.tick_program_event.__remove_hrtimer.hrtimer_star=
t_range_ns.tick_nohz_stop_sched_tick
      1.59 =C2=B1  4%     -64.7%       0.56 =C2=B1 11%  perf-profile.cycles=
.clockevents_program_event.tick_program_event.hrtimer_start_range_ns.tick_n=
ohz_restart.tick_nohz_idle_exit
     24.94 =C2=B1  3%    +204.7%      76.00 =C2=B1  1%  perf-profile.cycles=
.cpu_startup_entry.start_secondary
      5.24 =C2=B1 10%   +1212.7%      68.82 =C2=B1  1%  perf-profile.cycles=
.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_secondary
      5.02 =C2=B1 11%   +1269.6%      68.79 =C2=B1  1%  perf-profile.cycles=
.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_sec=
ondary
      1.77 =C2=B1  2%     -66.4%       0.60 =C2=B1  3%  perf-profile.cycles=
.cpuidle_select.cpu_startup_entry.start_secondary
      3.48 =C2=B1  2%     -63.2%       1.28 =C2=B1  5%  perf-profile.cycles=
.deactivate_task.__schedule.schedule.rwsem_down_write_failed.call_rwsem_dow=
n_write_failed
      2.58 =C2=B1  3%     -63.3%       0.95 =C2=B1  5%  perf-profile.cycles=
.dequeue_entity.dequeue_task_fair.dequeue_task.deactivate_task.__schedule
      3.40 =C2=B1  2%     -63.1%       1.26 =C2=B1  5%  perf-profile.cycles=
.dequeue_task.deactivate_task.__schedule.schedule.rwsem_down_write_failed
      3.12 =C2=B1  3%     -63.1%       1.15 =C2=B1  4%  perf-profile.cycles=
.dequeue_task_fair.dequeue_task.deactivate_task.__schedule.schedule
     10.49 =C2=B1  1%     -70.5%       3.09 =C2=B1  7%  perf-profile.cycles=
.do_brk.sys_brk.entry_SYSCALL_64_fastpath
     11.80 =C2=B1  2%     -70.0%       3.54 =C2=B1 11%  perf-profile.cycles=
.do_munmap.sys_brk.entry_SYSCALL_64_fastpath
      1.85 =C2=B1  3%     -68.0%       0.59 =C2=B1  5%  perf-profile.cycles=
.down_write.sys_brk.entry_SYSCALL_64_fastpath
      1.60 =C2=B1 18%     -46.8%       0.85 =C2=B1 27%  perf-profile.cycles=
.dump_trace.save_stack_trace_tsk.__account_scheduler_latency.enqueue_entity=
.enqueue_task_fair
      5.17 =C2=B1 11%     -61.1%       2.01 =C2=B1 14%  perf-profile.cycles=
.enqueue_entity.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activa=
te
      6.49 =C2=B1  8%     -63.1%       2.39 =C2=B1 12%  perf-profile.cycles=
.enqueue_task.activate_task.ttwu_do_activate.try_to_wake_up.wake_up_process
      5.72 =C2=B1  9%     -61.9%       2.18 =C2=B1 13%  perf-profile.cycles=
.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activate.try_to_wake_=
up
     68.68 =C2=B1  0%     -68.5%      21.63 =C2=B1  4%  perf-profile.cycles=
.entry_SYSCALL_64_fastpath
      1.60 =C2=B1 11%     -73.2%       0.43 =C2=B1 28%  perf-profile.cycles=
.find_vma.do_munmap.sys_brk.entry_SYSCALL_64_fastpath
      1.39 =C2=B1  9%     -69.1%       0.43 =C2=B1 30%  perf-profile.cycles=
.find_vma.sys_brk.entry_SYSCALL_64_fastpath
      1.07 =C2=B1  5%     -67.4%       0.35 =C2=B1  7%  perf-profile.cycles=
.free_pgtables.unmap_region.do_munmap.sys_brk.entry_SYSCALL_64_fastpath
      1.06 =C2=B1 20%     -60.8%       0.42 =C2=B1 12%  perf-profile.cycles=
.hrtimer_cancel.tick_nohz_restart.tick_nohz_idle_exit.cpu_startup_entry.sta=
rt_secondary
      2.34 =C2=B1  7%     -63.9%       0.85 =C2=B1  9%  perf-profile.cycles=
.hrtimer_start_range_ns.tick_nohz_restart.tick_nohz_idle_exit.cpu_startup_e=
ntry.start_secondary
      3.25 =C2=B1  9%     -61.0%       1.27 =C2=B1 10%  perf-profile.cycles=
.hrtimer_start_range_ns.tick_nohz_stop_sched_tick.__tick_nohz_idle_enter.ti=
ck_nohz_idle_enter.cpu_startup_entry
      1.10 =C2=B1 27%     -64.5%       0.39 =C2=B1 12%  perf-profile.cycles=
.hrtimer_try_to_cancel.hrtimer_cancel.tick_nohz_restart.tick_nohz_idle_exit=
.cpu_startup_entry
      4.74 =C2=B1  8%     -98.1%       0.09 =C2=B1 20%  perf-profile.cycles=
.intel_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry
      1.19 =C2=B1  7%     -61.5%       0.46 =C2=B1 13%  perf-profile.cycles=
.lapic_next_deadline.clockevents_program_event.tick_program_event.__remove_=
hrtimer.hrtimer_start_range_ns
      1.23 =C2=B1  5%     -64.4%       0.44 =C2=B1 18%  perf-profile.cycles=
.lapic_next_deadline.clockevents_program_event.tick_program_event.hrtimer_s=
tart_range_ns.tick_nohz_restart
      1.52 =C2=B1  3%     -64.9%       0.54 =C2=B1  2%  perf-profile.cycles=
.menu_select.cpuidle_select.cpu_startup_entry.start_secondary
      2.06 =C2=B1 21%     -55.2%       0.92 =C2=B1 35%  perf-profile.cycles=
.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.rwsem_wake.call_rw=
sem_wake.sys_brk
      1.43 =C2=B1 16%     -61.5%       0.55 =C2=B1 13%  perf-profile.cycles=
.native_write_msr_safe.lapic_next_deadline.clockevents_program_event.tick_p=
rogram_event.__remove_hrtimer
      1.46 =C2=B1  9%     -64.3%       0.52 =C2=B1 19%  perf-profile.cycles=
.native_write_msr_safe.lapic_next_deadline.clockevents_program_event.tick_p=
rogram_event.hrtimer_start_range_ns
      3.45 =C2=B1  4%     -68.6%       1.08 =C2=B1  5%  perf-profile.cycles=
.perf_event_aux.perf_event_mmap.do_brk.sys_brk.entry_SYSCALL_64_fastpath
      1.05 =C2=B1  7%     -70.8%       0.31 =C2=B1 15%  perf-profile.cycles=
.perf_event_aux_ctx.perf_event_aux.perf_event_mmap.do_brk.sys_brk
      4.67 =C2=B1  5%     -68.7%       1.46 =C2=B1  3%  perf-profile.cycles=
.perf_event_mmap.do_brk.sys_brk.entry_SYSCALL_64_fastpath
      3.15 =C2=B1  7%     -67.0%       1.04 =C2=B1  4%  perf-profile.cycles=
.pick_next_task_fair.__schedule.schedule.schedule_preempt_disabled.cpu_star=
tup_entry
      0.00 =C2=B1 -1%      +Inf%      68.91 =C2=B1  1%  perf-profile.cycles=
.poll_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry
      1.44 =C2=B1 18%     -47.1%       0.77 =C2=B1 28%  perf-profile.cycles=
.print_context_stack.dump_trace.save_stack_trace_tsk.__account_scheduler_la=
tency.enqueue_entity
     20.94 =C2=B1  6%     -69.6%       6.36 =C2=B1 17%  perf-profile.cycles=
.rwsem_down_write_failed.call_rwsem_down_write_failed.sys_brk.entry_SYSCALL=
_64_fastpath
     10.71 =C2=B1 11%     -72.8%       2.92 =C2=B1 34%  perf-profile.cycles=
.rwsem_spin_on_owner.rwsem_down_write_failed.call_rwsem_down_write_failed.s=
ys_brk.entry_SYSCALL_64_fastpath
     19.07 =C2=B1  7%     -64.9%       6.70 =C2=B1 13%  perf-profile.cycles=
.rwsem_wake.call_rwsem_wake.sys_brk.entry_SYSCALL_64_fastpath
      1.63 =C2=B1 20%     -46.9%       0.87 =C2=B1 27%  perf-profile.cycles=
.save_stack_trace_tsk.__account_scheduler_latency.enqueue_entity.enqueue_ta=
sk_fair.enqueue_task
      6.92 =C2=B1  3%     -64.3%       2.47 =C2=B1  6%  perf-profile.cycles=
.schedule.rwsem_down_write_failed.call_rwsem_down_write_failed.sys_brk.entr=
y_SYSCALL_64_fastpath
      5.04 =C2=B1  3%     -66.2%       1.71 =C2=B1  7%  perf-profile.cycles=
.schedule.schedule_preempt_disabled.cpu_startup_entry.start_secondary
      5.22 =C2=B1  3%     -66.3%       1.76 =C2=B1  6%  perf-profile.cycles=
.schedule_preempt_disabled.cpu_startup_entry.start_secondary
      1.88 =C2=B1 10%     -67.6%       0.61 =C2=B1  5%  perf-profile.cycles=
.set_next_entity.pick_next_task_fair.__schedule.schedule.schedule_preempt_d=
isabled
     25.17 =C2=B1  3%    +202.2%      76.07 =C2=B1  1%  perf-profile.cycles=
.start_secondary
     68.28 =C2=B1  0%     -68.5%      21.51 =C2=B1  4%  perf-profile.cycles=
.sys_brk.entry_SYSCALL_64_fastpath
      5.05 =C2=B1  2%     -59.8%       2.03 =C2=B1  9%  perf-profile.cycles=
.tick_nohz_idle_enter.cpu_startup_entry.start_secondary
      4.66 =C2=B1  2%     -63.3%       1.71 =C2=B1  8%  perf-profile.cycles=
.tick_nohz_idle_exit.cpu_startup_entry.start_secondary
      3.53 =C2=B1  3%     -63.3%       1.30 =C2=B1 10%  perf-profile.cycles=
.tick_nohz_restart.tick_nohz_idle_exit.cpu_startup_entry.start_secondary
      4.19 =C2=B1  4%     -59.8%       1.68 =C2=B1  9%  perf-profile.cycles=
.tick_nohz_stop_sched_tick.__tick_nohz_idle_enter.tick_nohz_idle_enter.cpu_=
startup_entry.start_secondary
      1.61 =C2=B1  7%     -59.9%       0.65 =C2=B1 12%  perf-profile.cycles=
.tick_program_event.__remove_hrtimer.hrtimer_start_range_ns.tick_nohz_stop_=
sched_tick.__tick_nohz_idle_enter
      1.66 =C2=B1  3%     -64.1%       0.59 =C2=B1 12%  perf-profile.cycles=
.tick_program_event.hrtimer_start_range_ns.tick_nohz_restart.tick_nohz_idle=
_exit.cpu_startup_entry
     13.88 =C2=B1  6%     -66.6%       4.63 =C2=B1 11%  perf-profile.cycles=
.try_to_wake_up.wake_up_process.__rwsem_do_wake.rwsem_wake.call_rwsem_wake
      8.76 =C2=B1  6%     -64.6%       3.10 =C2=B1 11%  perf-profile.cycles=
.ttwu_do_activate.constprop.83.try_to_wake_up.wake_up_process.__rwsem_do_wa=
ke.rwsem_wake
      2.18 =C2=B1  0%     -69.2%       0.67 =C2=B1 10%  perf-profile.cycles=
.ttwu_do_wakeup.ttwu_do_activate.try_to_wake_up.wake_up_process.__rwsem_do_=
wake
      3.42 =C2=B1  4%     -68.8%       1.07 =C2=B1 11%  perf-profile.cycles=
.unmap_region.do_munmap.sys_brk.entry_SYSCALL_64_fastpath
      1.12 =C2=B1  3%     -66.7%       0.37 =C2=B1  8%  perf-profile.cycles=
.unmap_single_vma.unmap_vmas.unmap_region.do_munmap.sys_brk
      1.56 =C2=B1  6%     -66.9%       0.52 =C2=B1 11%  perf-profile.cycles=
.unmap_vmas.unmap_region.do_munmap.sys_brk.entry_SYSCALL_64_fastpath
      1.47 =C2=B1  2%     -71.0%       0.43 =C2=B1  4%  perf-profile.cycles=
.up_write.sys_brk.entry_SYSCALL_64_fastpath
      1.86 =C2=B1 17%     -75.7%       0.45 =C2=B1 40%  perf-profile.cycles=
.up_write.vma_adjust.vma_merge.do_brk.sys_brk
      1.17 =C2=B1  1%     -67.5%       0.38 =C2=B1 10%  perf-profile.cycles=
.update_cfs_shares.dequeue_entity.dequeue_task_fair.dequeue_task.deactivate=
_task
      1.16 =C2=B1  8%     -72.5%       0.32 =C2=B1 17%  perf-profile.cycles=
.update_cfs_shares.enqueue_entity.enqueue_task_fair.enqueue_task.activate_t=
ask
      1.98 =C2=B1  5%     -67.8%       0.64 =C2=B1  7%  perf-profile.cycles=
.vma_adjust.__split_vma.do_munmap.sys_brk.entry_SYSCALL_64_fastpath
      3.52 =C2=B1 11%     -74.1%       0.91 =C2=B1 21%  perf-profile.cycles=
.vma_adjust.vma_merge.do_brk.sys_brk.entry_SYSCALL_64_fastpath
      4.04 =C2=B1  8%     -74.7%       1.02 =C2=B1 21%  perf-profile.cycles=
.vma_merge.do_brk.sys_brk.entry_SYSCALL_64_fastpath
     14.71 =C2=B1  6%     -66.3%       4.96 =C2=B1 11%  perf-profile.cycles=
.wake_up_process.__rwsem_do_wake.rwsem_wake.call_rwsem_wake.sys_brk


lkp-ne04: Nehalem-EP
Memory: 12G

nhm4: Nehalem
Memory: 4G

lkp-sb03: Sandy Bridge-EP
Memory: 64G


                                   cpuidle.POLL.time

  2.5e+09 ++---------------------------------------------------------------=
-+
          O   O  O O                                                       =
 |
          | O        O O O  O O O O O  O O O O O  O O O O O                =
 |
    2e+09 ++                                                 O O O O       =
 |
          |                                                                =
 |
          |                                                                =
 |
  1.5e+09 ++                                                               =
 |
          |                                                                =
 |
    1e+09 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
    5e+08 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
        0 *+*-*--*-*-*-*-*--*-*-*-*-*--*-*-*-*-*--*-*-*-*-*--*-*-*-*-*--*-*=
-*


                                  cpuidle.POLL.usage

    3e+07 ++---------------------------------------------------------------=
-+
          |   O  O   O        O O O O  O       O        O                  =
 |
  2.5e+07 ++O      O                     O O O      O O      O O O         =
 |
          O            O    O                     O       O        O       =
 |
          |              O                                                 =
 |
    2e+07 ++                                                               =
 |
          |                                                                =
 |
  1.5e+07 ++                                                               =
 |
          |                                                                =
 |
    1e+07 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
    5e+06 ++                                                               =
 |
          |                                                                =
 |
        0 *+*-*--*-*-*-*-*--*-*-*-*-*--*-*-*-*-*--*-*-*-*-*--*-*-*-*-*--*-*=
-*


                                  cpuidle.C1-SNB.time

  2.5e+09 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
          *.*.*..*.*.*.*.*..*.*.*.*.*..*.*.*.*.*..*.*   *.*..*.*.*.*.*..*.*=
.*
    2e+09 ++                                        :   :                  =
 |
          |                                         :   :                  =
 |
          |                                          :  :                  =
 |
  1.5e+09 ++                                         : :                   =
 |
          |                                          : :                   =
 |
    1e+09 ++                                         : :                   =
 |
          |                                          : :                   =
 |
          |                                          : :                   =
 |
    5e+08 ++                                          ::                   =
 |
          |                                           :                    =
 |
          O O O  O O O        O O O O  O O O O O  O O O O O  O O O O       =
 |
        0 ++-----------O-O--O-------------------------*--------------------=
-+


                                 cpuidle.C1-SNB.usage

  3.5e+07 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    3e+07 *+ .*..*.*.*.*.*..*.*.            .*.*..                         =
 |
          | *                   *.*.*..*.*.*      *.     .*.. .*.*.*.  .*.*=
 |
  2.5e+07 ++                                        *   *    *       *.    =
+|
          |                                         :   :                  =
 *
    2e+07 ++                                        :   :                  =
 |
          |                                          : :                   =
 |
  1.5e+07 ++                                         : :                   =
 |
          |                                          : :                   =
 |
    1e+07 ++                                         : :                   =
 |
          |                                          : :                   =
 |
    5e+06 ++                                          :            O       =
 |
          |                   O O O O  O O O O O  O O O O O  O O O         =
 |
        0 O+O-O--O-O-O-O-O--O-------------------------*--------------------=
-+


                                 turbostat.Avg_MHz

  1600 ++------------------------------------------------------------------=
-+
       O O  O O O  O O O O  O O O  O O O  O O O O  O O O  O O O  O O       =
 |
  1400 ++                                                                  =
 |
  1200 ++                                                                  =
 |
       |                                                                   =
 |
  1000 ++                                                                  =
 |
       *.*..*.*.*..*.*.*.*..*.*.*..*.*.*..*.*.*.*..*   *..*.*.*..*.*.*.*..*=
.*
   800 ++                                          :   :                   =
 |
       |                                            :  :                   =
 |
   600 ++                                           : :                    =
 |
   400 ++                                           : :                    =
 |
       |                                            : :                    =
 |
   200 ++                                            ::                    =
 |
       |                                             :                     =
 |
     0 ++--------------------------------------------*---------------------=
-+


                                 turbostat._Busy

  50 O+---O-O-O--O-O--O-O-O--O-O-O--O-O--O-O------O-O----------------------=
-+
  45 ++O                                     O  O      O O O  O O  O       =
 |
     |                                                                     =
 |
  40 ++                                                                    =
 |
  35 ++                                                                    =
 |
     |                                                                     =
 |
  30 *+*..*.*.*..*.*..*.*.*..*.*.*..*.*..*.*.*..*.*    *.*.*..*.*..*.*.*..*=
.*
  25 ++                                           :    :                   =
 |
  20 ++                                            :  :                    =
 |
     |                                             :  :                    =
 |
  15 ++                                            :  :                    =
 |
  10 ++                                            : :                     =
 |
     |                                              ::                     =
 |
   5 ++                                             :                      =
 |
   0 ++---------------------------------------------*----------------------=
-+


                                turbostat.CPU_c1

  45 ++--------------------------------------------------------------------=
-+
     *.*..*.*.*..*.*..*.*.*..*.*.*..*.*..*.*.*..*.*    *.*.*..*.*..*.*.*..*=
.*
  40 ++                                           :    :                   =
 |
  35 ++                                           :    :                   =
 |
     |                                            :   :                    =
 |
  30 ++                                            :  :                    =
 |
  25 ++O                                     O     :  :O   O  O O  O       =
 |
     O    O O O  O O  O O O  O O O  O O  O O    O O:O :  O                 =
 |
  20 ++                                            : :                     =
 |
  15 ++                                            : :                     =
 |
     |                                             : :                     =
 |
  10 ++                                             ::                     =
 |
   5 ++                                             :                      =
 |
     |                                              :                      =
 |
   0 ++---------------------------------------------*----------------------=
-+


                                 turbostat.PkgWatt

  160 ++-------------------------------------------------------------------=
-+
      O O  O O O  O O O  O O O  O O O  O O O  O O O  O O O  O O O  O       =
 |
  140 ++                                                                   =
 |
  120 *+*..*.*.*..*.*.*..*.*.*..*.*.*..*.*.*..*.*.*    *.*..*.*.*..*.*.*..*=
.*
      |                                           :    :                   =
 |
  100 ++                                           :   :                   =
 |
      |                                            :  :                    =
 |
   80 ++                                           :  :                    =
 |
      |                                            :  :                    =
 |
   60 ++                                            : :                    =
 |
   40 ++                                            : :                    =
 |
      |                                             : :                    =
 |
   20 ++                                            ::                     =
 |
      |                                              :                     =
 |
    0 ++---------------------------------------------*---------------------=
-+


                                 turbostat.CorWatt

  120 O+O--O-O-O--O-O-O--O-O-O--O-O-O--O-O-O--O-O-O--O-O-O--O-O-O--O-------=
-+
      |                                                                    =
 |
  100 ++                                                                   =
 |
      *.*..*.*.*..*.*.*..*.*.*..*.*.*..*.*.*..*.*.*    *.*..*.*.*..*.*.*..*=
.*
      |                                           :    :                   =
 |
   80 ++                                           :   :                   =
 |
      |                                            :  :                    =
 |
   60 ++                                           :  :                    =
 |
      |                                            :  :                    =
 |
   40 ++                                            : :                    =
 |
      |                                             : :                    =
 |
      |                                             : :                    =
 |
   20 ++                                            ::                     =
 |
      |                                              :                     =
 |
    0 ++---------------------------------------------*---------------------=
-+




  80 ++--------------------------------------------------------------------=
-+
     |                                                                     =
 |
  70 O+ O O  O  O  O O  O  O  O O  O  O  O O  O  O O  O  O  O O  O  O  O O =
 O
  60 ++                                                                    =
 |
     |                                                                     =
 |
  50 ++                                                                    =
 |
     |                                                                     =
 |
  40 ++                                                                    =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     |                                                                     =
 |
   0 *+-*-*--*--*--*-*--*--*--*-*--*--*--*-*--*--*-*--*--*--*-*--*--*--*---=
-+


                       perf-profile.cycles.start_secondary

  80 ++-------O-----------O--------------------------------O---------------=
-+
     | O  O      O O  O O    O O O    O  O O O  O O O  O O    O O  O       =
 |
  70 O+     O                       O                                      =
 |
  60 ++                                                                    =
 |
     |                                                                     =
 |
  50 ++                                                                    =
 |
     |                                                                     =
 |
  40 ++                                                                    =
 |
     |                                                                     =
 |
  30 ++              .*. .*.. .*.  .*.    .*.  .*.     *. .*.. .*.. .*.*.. =
 |
  20 *+*..*.*.*..*.*.   *    *   *.   *..*   *.   *   :  *    *    *      *=
.*
     |                                             :  :                    =
 |
  10 ++                                            : :                     =
 |
     |                                              ::                     =
 |
   0 ++---------------------------------------------*----------------------=
-+


              perf-profile.cycles.cpu_startup_entry.start_secondary

  80 ++-------------------O--------------------------------O---------------=
-+
     | O  O   O  O O  O O    O O O    O  O O O  O O O  O O    O O  O       =
 |
  70 O+     O                       O                                      =
 |
  60 ++                                                                    =
 |
     |                                                                     =
 |
  50 ++                                                                    =
 |
     |                                                                     =
 |
  40 ++                                                                    =
 |
     |                                                                     =
 |
  30 ++              .*.           .*.    .*.  .*.     *. .*..      .*.    =
 |
  20 *+*..*.*.*..*.*.   *.*..*.*.*.   *..*   *.   *   :  *    *.*..*   *..*=
.*
     |                                             :  :                    =
 |
  10 ++                                            : :                     =
 |
     |                                              ::                     =
 |
   0 ++---------------------------------------------*----------------------=
-+


       perf-profile.cycles.call_cpuidle.cpu_startup_entry.start_secondary

  80 ++--------------------------------------------------------------------=
-+
     |                                                                     =
 |
  70 ++O  O   O  O O  O O O    O O    O  O   O  O O    O O O  O O  O       =
 |
  60 O+     O                O      O      O        O                      =
 |
     |                                                                     =
 |
  50 ++                                                                    =
 |
     |                                                                     =
 |
  40 ++                                                                    =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  10 ++              .*.                                                   =
 |
     *.*..*.*.*..*.*.   *.*..*.*.*..*.*..*.*.*..*.*.  .*.*.*..*.*..*.*.*..*=
.*
   0 ++---------------------------------------------*----------------------=
-+




  80 ++--------------------------------------------------------------------=
-+
     |                                                                     =
 |
  70 ++O  O   O  O O  O O O    O O    O  O   O  O O    O O O  O O  O       =
 |
  60 O+     O                O      O      O        O                      =
 |
     |                                                                     =
 |
  50 ++                                                                    =
 |
     |                                                                     =
 |
  40 ++                                                                    =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  10 ++              .*.                                                   =
 |
     *.*..*.*.*..*.*.   *.*..*.*.*..*.*..*.*.*..*.*.  .*.*.*..*.*..*.*.*..*=
.*
   0 ++---------------------------------------------*----------------------=
-+




  80 ++--------------------------------------------------------------------=
-+
     |                                                                     =
 |
  70 ++O  O   O  O O  O O O    O O    O  O   O  O O    O O O  O O  O       =
 |
  60 O+     O                O      O      O        O                      =
 |
     |                                                                     =
 |
  50 ++                                                                    =
 |
     |                                                                     =
 |
  40 ++                                                                    =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  10 ++              .*.                                                   =
 |
     *.*..*.*.*..*.*.   *.*..*.*.*..*.*..*.*.*..*.*.  .*.*.*..*.*..*.*.*..*=
.*
   0 ++---------------------------------------------*----------------------=
-+


                  perf-profile.cycles.entry_SYSCALL_64_fastpath

  80 ++--------------------------------------------------------------------=
-+
     |                                                                     =
 |
  70 *+*..*.*.*..*.*..*.*.*..*.*.*..*.*..*.*.*..*.*    *.*.*..*.*..*.*.*..*=
.*
  60 ++                                           :    :                   =
 |
     |                                            :    :                   =
 |
  50 ++                                            :  :                    =
 |
     |                                             :  :                    =
 |
  40 ++                                            :  :                    =
 |
     |                                             :  :                    =
 |
  30 ++                                            : :                     =
 |
  20 O+O  O O O  O O  O O O  O O O  O O  O O O  O O:O: O O O  O O  O       =
 |
     |                                              ::                     =
 |
  10 ++                                             ::                     =
 |
     |                                              :                      =
 |
   0 ++---------------------------------------------*----------------------=
-+


              perf-profile.cycles.sys_brk.entry_SYSCALL_64_fastpath

  80 ++--------------------------------------------------------------------=
-+
     |                                                                     =
 |
  70 *+*..*.*.*..*.*..*.*.*..*.*.*..*.*..*.*.*..*.*    *.*.*..*.*..*.*.*..*=
.*
  60 ++                                           :    :                   =
 |
     |                                            :    :                   =
 |
  50 ++                                            :  :                    =
 |
     |                                             :  :                    =
 |
  40 ++                                            :  :                    =
 |
     |                                             :  :                    =
 |
  30 ++                                            : :                     =
 |
  20 O+O  O O O  O O  O O O  O O O  O O  O O O  O O:O: O O O  O O  O       =
 |
     |                                              ::                     =
 |
  10 ++                                             ::                     =
 |
     |                                              :                      =
 |
   0 ++---------------------------------------------*----------------------=
-+


      perf-profile.cycles.call_rwsem_wake.sys_brk.entry_SYSCALL_64_fastpath

  25 ++*-------------------------------------------------------------------=
-+
     | ::                                              *           *       =
 |
     |: :                    *        *          .*    ::        .. +      =
 *
  20 ++  :      .*      *   + :      : +       .* :    ::    .*.*    *.    =
+|
     |   :   .*.  +    : + +  :      :  + .*.*.   :   :  :.*.          *..*=
 |
     *    *.*      *.. :  *    *.*..*    *         :  :  *                 =
 |
  15 ++               *                            :  :                    =
 |
     |                                             :  :                    =
 |
  10 ++                                            : :                     =
 |
     O                                             : :                     =
 |
     |      O O    O  O O O  O   O    O  O O    O O:O:   O O    O          =
 |
   5 ++O  O      O             O    O        O      :: O      O    O       =
 |
     |                                              :                      =
 |
     |                                              :                      =
 |
   0 ++---------------------------------------------*----------------------=
-+

	[*] bisect-good sample
	[O] bisect-bad  sample

To reproduce:

        git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tes=
ts.git
        cd lkp-tests
        bin/lkp install job.yaml  # job file is attached in this email
        bin/lkp run     job.yaml


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Ying Huang

--===============5719695183688776501==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogd2lsbC1pdC1zY2FsZQpkZWZhdWx0LW1vbml0b3JzOgogIHdhaXQ6IGFjdGl2YXRl
LW1vbml0b3IKICBrbXNnOiAKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1h
LW51bWFzdGF0OiAKICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3Rh
dDogCiAgcHJvYy1zdGF0OgogICAgaW50ZXJ2YWw6IDEwCiAgbWVtaW5mbzogCiAgc2xhYmluZm86
IAogIGludGVycnVwdHM6IAogIGxvY2tfc3RhdDogCiAgbGF0ZW5jeV9zdGF0czogCiAgc29mdGly
cXM6IAogIGJkaV9kZXZfbWFwcGluZzogCiAgZGlza3N0YXRzOiAKICBuZnNzdGF0OiAKICBjcHVp
ZGxlOiAKICBjcHVmcmVxLXN0YXRzOiAKICB0dXJib3N0YXQ6IAogIHBtZXRlcjogCiAgc2NoZWRf
ZGVidWc6CiAgICBpbnRlcnZhbDogNjAKY3B1ZnJlcV9nb3Zlcm5vcjogCmRlZmF1bHQtd2F0Y2hk
b2dzOgogIG9vbS1raWxsZXI6IAogIHdhdGNoZG9nOiAKY29tbWl0OiAxZTEyNDE1N2NiZjhmODJi
NTdmYjc3MGQ1OTEwYmQ5YzY0ZGJmNGY4Cm1vZGVsOiBTYW5keSBCcmlkZ2UtRVAKbWVtb3J5OiA2
NEcKaGRkX3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLVdEQ19XRDEwRUFSUy0wMFk1
QjFfV0QtV0NBVjVGMDU5NDk5LXBhcnQzIgpzd2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0
aW9uOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1XRENfV0QxMEVBUlMtMDBZNUIxX1dELVdDQVY1RjA1
OTQ5OS1wYXJ0NCIKY2F0ZWdvcnk6IGJlbmNobWFyawpwZXJmLXByb2ZpbGU6CiAgZnJlcTogODAw
CndpbGwtaXQtc2NhbGU6CiAgdGVzdDogYnJrMQpxdWV1ZTogY3ljbGljCnRlc3Rib3g6IGxrcC1z
YjAzCnRib3hfZ3JvdXA6IGxrcC1zYjAzCmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGlt
ZTogMjAxNS0xMS0wNiAwODoxMzowMC42MzIzMTQ0MDggKzA4OjAwCmlkOiBmMjk3Yjc3OTkyODE0
ZjRkYjA4OGJjZmIxODFiZTA5ZTQ0ZDA1NWI4CnVzZXI6IGxrcApjb21waWxlcjogZ2NjLTQuOQpo
ZWFkX2NvbW1pdDogMWUxMjQxNTdjYmY4ZjgyYjU3ZmI3NzBkNTkxMGJkOWM2NGRiZjRmOApiYXNl
X2NvbW1pdDogNmExM2ZlYjljODI4MDNlMmI4MTVlY2E3MmZhN2E5ZjU1NjFkNzg2MQpicmFuY2g6
IGxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE1MTEwNjEwCmtlcm5lbDogIi9wa2cvbGludXgv
eDg2XzY0LXJoZWwvZ2NjLTQuOS8xZTEyNDE1N2NiZjhmODJiNTdmYjc3MGQ1OTEwYmQ5YzY0ZGJm
NGY4L3ZtbGludXotNC4zLjAtYm9jaHMtdmlydGlvLWdwdS13bC1hdGgtMTE4NTMtZzFlMTI0MTUi
CnJvb3RmczogZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnegpyZXN1bHRfcm9vdDogIi9yZXN1
bHQvd2lsbC1pdC1zY2FsZS9icmsxL2xrcC1zYjAzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5j
Z3oveDg2XzY0LXJoZWwvZ2NjLTQuOS8xZTEyNDE1N2NiZjhmODJiNTdmYjc3MGQ1OTEwYmQ5YzY0
ZGJmNGY4LzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvbGtwLXNiMDMvY3ljbGljX3dpbGwt
aXQtc2NhbGUtYnJrMS14ODZfNjQtcmhlbC1DWUNMSUNfSEVBRC0xZTEyNDE1N2NiZjhmODJiNTdm
Yjc3MGQ1OTEwYmQ5YzY0ZGJmNGY4LTIwMTUxMTA2LTc2ODU5LTgxdmd1bC0wLnlhbWwiCmRlcXVl
dWVfdGltZTogMjAxNS0xMS0wNiAxNjowNjozMy40OTEzNTM0OTQgKzA4OjAwCm5yX2NwdTogIiQo
bnByb2MpIgptYXhfdXB0aW1lOiAxNTAwCmluaXRyZDogIi9vc2ltYWdlL2RlYmlhbi9kZWJpYW4t
eDg2XzY0LTIwMTUtMDItMDcuY2d6Igpib290bG9hZGVyX2FwcGVuZDoKLSByb290PS9kZXYvcmFt
MAotIHVzZXI9bGtwCi0gam9iPS9sa3Avc2NoZWR1bGVkL2xrcC1zYjAzL2N5Y2xpY193aWxsLWl0
LXNjYWxlLWJyazEteDg2XzY0LXJoZWwtQ1lDTElDX0hFQUQtMWUxMjQxNTdjYmY4ZjgyYjU3ZmI3
NzBkNTkxMGJkOWM2NGRiZjRmOC0yMDE1MTEwNi03Njg1OS04MXZndWwtMC55YW1sCi0gQVJDSD14
ODZfNjQKLSBrY29uZmlnPXg4Nl82NC1yaGVsCi0gYnJhbmNoPWxpbnV4LWRldmVsL2RldmVsLWhv
dXJseS0yMDE1MTEwNjEwCi0gY29tbWl0PTFlMTI0MTU3Y2JmOGY4MmI1N2ZiNzcwZDU5MTBiZDlj
NjRkYmY0ZjgKLSBCT09UX0lNQUdFPS9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS8xZTEy
NDE1N2NiZjhmODJiNTdmYjc3MGQ1OTEwYmQ5YzY0ZGJmNGY4L3ZtbGludXotNC4zLjAtYm9jaHMt
dmlydGlvLWdwdS13bC1hdGgtMTE4NTMtZzFlMTI0MTUKLSBtYXhfdXB0aW1lPTE1MDAKLSBSRVNV
TFRfUk9PVD0vcmVzdWx0L3dpbGwtaXQtc2NhbGUvYnJrMS9sa3Atc2IwMy9kZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvMWUxMjQxNTdjYmY4ZjgyYjU3ZmI3
NzBkNTkxMGJkOWM2NGRiZjRmOC8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJp
bnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVn
IHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAK
ICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFu
aWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAw
IGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3At
eDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00
LjkvMWUxMjQxNTdjYmY4ZjgyYjU3ZmI3NzBkNTkxMGJkOWM2NGRiZjRmOC9tb2R1bGVzLmNneiIK
Ym1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xr
cC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNv
bmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJv
c3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3dp
bGwtaXQtc2NhbGUuY2d6Igpqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDI1Ljg4IDEzLjIx
IDUuMzcgMS8zNTQgOTQ4MQpzdGFydF90aW1lOiAnMTQ0Njc5NzI0NScKZW5kX3RpbWU6ICcxNDQ2
Nzk3NTc2Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE1MTEwNi0xNDQyMTciCg==

--===============5719695183688776501==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

Li9ydW50ZXN0LnB5IGJyazEgMjUgYm90aCAxIDggMTYgMjQgMzIK

--===============5719695183688776501==--

