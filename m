Content-Type: multipart/mixed; boundary="===============3663311351499539148=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [sched/fair] fde7d22e01: -25.1% unixbench.score
Date: Wed, 28 Oct 2015 13:43:41 +0800
Message-ID: <87fv0vpmya.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3663311351499539148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit fde7d22e01aa0d252fc5c95fa11f0dac35a4dd59 ("sched/fair: Fix overly sm=
all weight for interactive group entities")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/test:
  nhm-white2/unixbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/she=
ll1

commit: =

  9babcd7929bc8967ae3bb6093f603b93c2f9958f
  fde7d22e01aa0d252fc5c95fa11f0dac35a4dd59

9babcd7929bc8967 fde7d22e01aa0d252fc5c95fa1 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     10085 =C2=B1  0%      -4.4%       9639 =C2=B1  0%  unixbench.score
   2689102 =C2=B1  0%     -13.5%    2326547 =C2=B1  0%  unixbench.time.invo=
luntary_context_switches
      7382 =C2=B1  0%      +0.7%       7433 =C2=B1  0%  unixbench.time.maxi=
mum_resident_set_size
 1.428e+08 =C2=B1  0%      -3.9%  1.373e+08 =C2=B1  0%  unixbench.time.mino=
r_page_faults
    368.25 =C2=B1  0%      -9.2%     334.50 =C2=B1  5%  unixbench.time.perc=
ent_of_cpu_this_job_got
    898.97 =C2=B1  0%      -4.4%     859.05 =C2=B1  0%  unixbench.time.syst=
em_time
    496.35 =C2=B1  0%      -4.1%     475.79 =C2=B1  0%  unixbench.time.user=
_time
   4537090 =C2=B1  0%      -4.1%    4352615 =C2=B1  0%  unixbench.time.volu=
ntary_context_switches
   2689102 =C2=B1  0%     -13.5%    2326547 =C2=B1  0%  time.involuntary_co=
ntext_switches
      1795 =C2=B1  0%     +10.4%       1982 =C2=B1  6%  uptime.idle
      2570 =C2=B1  2%     +40.3%       3607 =C2=B1  3%  slabinfo.kmalloc-12=
8.active_objs
      2607 =C2=B1  2%     +41.6%       3692 =C2=B1  3%  slabinfo.kmalloc-12=
8.num_objs
     54942 =C2=B1  0%     -16.0%      46156 =C2=B1  6%  vmstat.system.cs
     16089 =C2=B1  0%     -19.9%      12893 =C2=B1  8%  vmstat.system.in
     47.77 =C2=B1  0%      -8.8%      43.56 =C2=B1  5%  turbostat.%Busy
      1371 =C2=B1  0%      -8.8%       1250 =C2=B1  5%  turbostat.Avg_MHz
      7.99 =C2=B1  0%     +69.4%      13.55 =C2=B1 32%  turbostat.CPU%c6
      0.00 =C2=B1 -1%      +Inf%   11920829 =C2=B1119%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
    761.75 =C2=B1 71%  +2.8e+05%    2145589 =C2=B1105%  latency_stats.avg.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_fdatawait.sync_inodes_sb.sy=
nc_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%   19732421 =C2=B1101%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      4823 =C2=B1107%  +4.2e+05%   20091553 =C2=B1101%  latency_stats.max.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_fdatawait.sync_inodes_sb.sy=
nc_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%   24618851 =C2=B1108%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      9025 =C2=B1 73%  +2.3e+05%   20945539 =C2=B1101%  latency_stats.sum.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_fdatawait.sync_inodes_sb.sy=
nc_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fastpath
  66400760 =C2=B1  0%     -11.6%   58707782 =C2=B1  1%  cpuidle.C1-NHM.time
   3829370 =C2=B1  0%     -20.1%    3060906 =C2=B1  6%  cpuidle.C1-NHM.usage
 1.065e+08 =C2=B1  0%     -22.5%   82521983 =C2=B1  0%  cpuidle.C1E-NHM.time
   1309487 =C2=B1  0%     -28.4%     937861 =C2=B1  0%  cpuidle.C1E-NHM.usa=
ge
 7.872e+08 =C2=B1  0%     +23.1%  9.694e+08 =C2=B1  0%  cpuidle.C3-NHM.time
    129395 =C2=B1  4%     +22.0%     157908 =C2=B1  5%  cpuidle.POLL.time
     18511 =C2=B1  2%     -20.0%      14807 =C2=B1  5%  cpuidle.POLL.usage
     67769 =C2=B1  0%     -19.4%      54588 =C2=B1 13%  sched_debug.cfs_rq[=
0]:/.exec_clock
     49.25 =C2=B1 26%     -82.7%       8.50 =C2=B1 39%  sched_debug.cfs_rq[=
0]:/.load
   1445770 =C2=B1  2%    +129.0%    3310199 =C2=B1 16%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     37.00 =C2=B1 25%     -85.1%       5.50 =C2=B1 15%  sched_debug.cfs_rq[=
0]:/.runnable_load_avg
     65.50 =C2=B1  6%     -87.0%       8.50 =C2=B1 54%  sched_debug.cfs_rq[=
1]:/.load
   1414810 =C2=B1  3%    +148.4%    3514441 =C2=B1 14%  sched_debug.cfs_rq[=
1]:/.min_vruntime
     43.25 =C2=B1 15%     -83.2%       7.25 =C2=B1 39%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
    -30963 =C2=B1-82%    -759.6%     204224 =C2=B1 47%  sched_debug.cfs_rq[=
1]:/.spread0
    142.50 =C2=B1 88%     -87.7%      17.50 =C2=B1 82%  sched_debug.cfs_rq[=
2]:/.load
   1404786 =C2=B1  3%    +146.5%    3462555 =C2=B1 14%  sched_debug.cfs_rq[=
2]:/.min_vruntime
    106.75 =C2=B1108%     -96.0%       4.25 =C2=B1 56%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
      3.50 =C2=B1 47%     -85.7%       0.50 =C2=B1100%  sched_debug.cfs_rq[=
2]:/.tg_load_avg_contrib
    100.75 =C2=B1 23%     -83.6%      16.50 =C2=B1 86%  sched_debug.cfs_rq[=
3]:/.load
   1463930 =C2=B1  1%    +140.4%    3519907 =C2=B1 14%  sched_debug.cfs_rq[=
3]:/.min_vruntime
     10.00 =C2=B1 18%     -50.0%       5.00 =C2=B1 44%  sched_debug.cfs_rq[=
3]:/.nr_spread_over
     51.50 =C2=B1 10%     -86.4%       7.00 =C2=B1 36%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
     18144 =C2=B1239%   +1055.5%     209666 =C2=B1 41%  sched_debug.cfs_rq[=
3]:/.spread0
    134.50 =C2=B1 91%     -90.1%      13.25 =C2=B1 11%  sched_debug.cfs_rq[=
4]:/.load
    675319 =C2=B1  0%    +388.5%    3299162 =C2=B1 14%  sched_debug.cfs_rq[=
4]:/.min_vruntime
     37.25 =C2=B1 33%     -84.6%       5.75 =C2=B1 25%  sched_debug.cfs_rq[=
4]:/.runnable_load_avg
   -770467 =C2=B1 -4%     -98.6%     -11087 =C2=B1-722%  sched_debug.cfs_rq=
[4]:/.spread0
    662789 =C2=B1  2%    +406.9%    3359566 =C2=B1 14%  sched_debug.cfs_rq[=
5]:/.min_vruntime
   -783000 =C2=B1 -3%    -106.3%      49307 =C2=B1234%  sched_debug.cfs_rq[=
5]:/.spread0
     42.50 =C2=B1 35%     -74.7%      10.75 =C2=B1 63%  sched_debug.cfs_rq[=
6]:/.load
    675333 =C2=B1  4%    +391.3%    3318169 =C2=B1 14%  sched_debug.cfs_rq[=
6]:/.min_vruntime
    176.75 =C2=B1 36%     -76.4%      41.67 =C2=B1141%  sched_debug.cfs_rq[=
6]:/.removed_load_avg
    175.25 =C2=B1 35%     -76.2%      41.67 =C2=B1141%  sched_debug.cfs_rq[=
6]:/.removed_util_avg
     35.75 =C2=B1 22%     -85.3%       5.25 =C2=B1 15%  sched_debug.cfs_rq[=
6]:/.runnable_load_avg
   -770458 =C2=B1 -7%    -101.0%       7903 =C2=B11955%  sched_debug.cfs_rq=
[6]:/.spread0
     77.50 =C2=B1 54%     -81.6%      14.25 =C2=B1 15%  sched_debug.cfs_rq[=
7]:/.load
    680645 =C2=B1  2%    +395.2%    3370439 =C2=B1 14%  sched_debug.cfs_rq[=
7]:/.min_vruntime
     33.00 =C2=B1 37%     -83.3%       5.50 =C2=B1 39%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
   -765169 =C2=B1 -2%    -107.9%      60166 =C2=B1155%  sched_debug.cfs_rq[=
7]:/.spread0
     40.25 =C2=B1 23%     -88.2%       4.75 =C2=B1 17%  sched_debug.cpu#0.c=
pu_load[0]
     37.00 =C2=B1 11%     -87.2%       4.75 =C2=B1 27%  sched_debug.cpu#0.c=
pu_load[1]
     35.00 =C2=B1 12%     -86.4%       4.75 =C2=B1 27%  sched_debug.cpu#0.c=
pu_load[2]
     34.00 =C2=B1 13%     -83.8%       5.50 =C2=B1 20%  sched_debug.cpu#0.c=
pu_load[3]
     35.50 =C2=B1 17%     -81.0%       6.75 =C2=B1 12%  sched_debug.cpu#0.c=
pu_load[4]
     50.25 =C2=B1 50%     -85.1%       7.50 =C2=B1 46%  sched_debug.cpu#0.l=
oad
    -21.00 =C2=B1-44%    +504.8%    -127.00 =C2=B1-32%  sched_debug.cpu#0.n=
r_uninterruptible
    344270 =C2=B1 14%     +40.3%     482926 =C2=B1  5%  sched_debug.cpu#1.a=
vg_idle
     31.25 =C2=B1 39%     -80.8%       6.00 =C2=B1 26%  sched_debug.cpu#1.c=
pu_load[0]
     30.50 =C2=B1 20%     -80.3%       6.00 =C2=B1 11%  sched_debug.cpu#1.c=
pu_load[1]
     31.50 =C2=B1 15%     -77.8%       7.00 =C2=B1 17%  sched_debug.cpu#1.c=
pu_load[2]
     33.00 =C2=B1 13%     -75.0%       8.25 =C2=B1 27%  sched_debug.cpu#1.c=
pu_load[3]
     34.50 =C2=B1  9%     -76.1%       8.25 =C2=B1 23%  sched_debug.cpu#1.c=
pu_load[4]
     61.75 =C2=B1  8%     -87.0%       8.00 =C2=B1 57%  sched_debug.cpu#1.l=
oad
   1826264 =C2=B1 61%     -65.5%     629410 =C2=B1  9%  sched_debug.cpu#1.n=
r_switches
    -29.25 =C2=B1-54%    +309.4%    -119.75 =C2=B1-23%  sched_debug.cpu#1.n=
r_uninterruptible
   1826525 =C2=B1 61%     -65.5%     629747 =C2=B1  9%  sched_debug.cpu#1.s=
ched_count
    763177 =C2=B1 64%     -68.1%     243350 =C2=B1  7%  sched_debug.cpu#1.s=
ched_goidle
    818609 =C2=B1 68%     -71.5%     233331 =C2=B1  9%  sched_debug.cpu#1.t=
twu_count
    665884 =C2=B1 85%     -87.5%      83067 =C2=B1 11%  sched_debug.cpu#1.t=
twu_local
     41.00 =C2=B1  9%     -90.2%       4.00 =C2=B1 30%  sched_debug.cpu#2.c=
pu_load[0]
     40.75 =C2=B1  7%     -90.2%       4.00 =C2=B1 17%  sched_debug.cpu#2.c=
pu_load[1]
     38.25 =C2=B1  7%     -86.9%       5.00 =C2=B1 14%  sched_debug.cpu#2.c=
pu_load[2]
     37.50 =C2=B1  7%     -84.0%       6.00 =C2=B1 26%  sched_debug.cpu#2.c=
pu_load[3]
     36.75 =C2=B1  7%     -80.3%       7.25 =C2=B1 32%  sched_debug.cpu#2.c=
pu_load[4]
    -24.00 =C2=B1-40%    +410.4%    -122.50 =C2=B1-28%  sched_debug.cpu#2.n=
r_uninterruptible
     39.50 =C2=B1 35%     -87.3%       5.00 =C2=B1 34%  sched_debug.cpu#3.c=
pu_load[0]
     38.25 =C2=B1 21%     -86.3%       5.25 =C2=B1 24%  sched_debug.cpu#3.c=
pu_load[1]
     38.75 =C2=B1 18%     -84.5%       6.00 =C2=B1 23%  sched_debug.cpu#3.c=
pu_load[2]
     39.50 =C2=B1 15%     -82.9%       6.75 =C2=B1 46%  sched_debug.cpu#3.c=
pu_load[3]
     40.00 =C2=B1 12%     -81.9%       7.25 =C2=B1 48%  sched_debug.cpu#3.c=
pu_load[4]
     89.75 =C2=B1 38%     -81.1%      17.00 =C2=B1 95%  sched_debug.cpu#3.l=
oad
    -42.25 =C2=B1-30%    +203.0%    -128.00 =C2=B1-18%  sched_debug.cpu#3.n=
r_uninterruptible
    259068 =C2=B1  1%     -12.3%     227166 =C2=B1  8%  sched_debug.cpu#3.t=
twu_count
     97491 =C2=B1  0%     -16.6%      81303 =C2=B1  9%  sched_debug.cpu#3.t=
twu_local
     39.00 =C2=B1 26%     -85.9%       5.50 =C2=B1 20%  sched_debug.cpu#4.c=
pu_load[0]
     39.50 =C2=B1 19%     -86.1%       5.50 =C2=B1 20%  sched_debug.cpu#4.c=
pu_load[1]
     40.00 =C2=B1 18%     -83.8%       6.50 =C2=B1 49%  sched_debug.cpu#4.c=
pu_load[2]
     40.00 =C2=B1 16%     -83.1%       6.75 =C2=B1 53%  sched_debug.cpu#4.c=
pu_load[3]
     39.25 =C2=B1 10%     -81.5%       7.25 =C2=B1 29%  sched_debug.cpu#4.c=
pu_load[4]
    211.00 =C2=B1123%     -93.4%      14.00 =C2=B1 13%  sched_debug.cpu#4.l=
oad
    103219 =C2=B1  0%     +16.8%     120564 =C2=B1  7%  sched_debug.cpu#4.n=
r_load_updates
     17.00 =C2=B1 71%    +648.5%     127.25 =C2=B1 18%  sched_debug.cpu#4.n=
r_uninterruptible
     53.00 =C2=B1 17%     -92.5%       4.00 =C2=B1 81%  sched_debug.cpu#5.c=
pu_load[0]
     54.50 =C2=B1 24%     -74.8%      13.75 =C2=B1103%  sched_debug.cpu#5.c=
pu_load[1]
     48.50 =C2=B1 21%     -70.6%      14.25 =C2=B1 76%  sched_debug.cpu#5.c=
pu_load[2]
     44.00 =C2=B1 13%     -68.2%      14.00 =C2=B1 58%  sched_debug.cpu#5.c=
pu_load[3]
     41.25 =C2=B1 12%     -69.1%      12.75 =C2=B1 47%  sched_debug.cpu#5.c=
pu_load[4]
    101.75 =C2=B1 32%     -86.2%      14.00 =C2=B1 64%  sched_debug.cpu#5.l=
oad
     34.00 =C2=B1 40%    +246.3%     117.75 =C2=B1 15%  sched_debug.cpu#5.n=
r_uninterruptible
   1117882 =C2=B1 92%     -93.2%      76324 =C2=B1 12%  sched_debug.cpu#5.t=
twu_local
     28.00 =C2=B1 46%     -87.5%       3.50 =C2=B1 31%  sched_debug.cpu#6.c=
pu_load[0]
     31.75 =C2=B1 18%     -85.8%       4.50 =C2=B1 19%  sched_debug.cpu#6.c=
pu_load[1]
     32.75 =C2=B1  5%     -84.7%       5.00 =C2=B1 14%  sched_debug.cpu#6.c=
pu_load[2]
     34.00 =C2=B1  8%     -78.7%       7.25 =C2=B1 20%  sched_debug.cpu#6.c=
pu_load[3]
     36.00 =C2=B1 11%     -76.4%       8.50 =C2=B1 24%  sched_debug.cpu#6.c=
pu_load[4]
     46.00 =C2=B1 37%     -80.4%       9.00 =C2=B1 84%  sched_debug.cpu#6.l=
oad
     30.25 =C2=B1 44%    +318.2%     126.50 =C2=B1 16%  sched_debug.cpu#6.n=
r_uninterruptible
   1182298 =C2=B1 92%     -71.7%     334147 =C2=B1135%  sched_debug.cpu#6.t=
twu_local
     42.00 =C2=B1 33%     -85.7%       6.00 =C2=B1 11%  sched_debug.cpu#7.c=
pu_load[0]
     40.50 =C2=B1 20%     -85.8%       5.75 =C2=B1 14%  sched_debug.cpu#7.c=
pu_load[1]
     39.75 =C2=B1 11%     -85.5%       5.75 =C2=B1  7%  sched_debug.cpu#7.c=
pu_load[2]
     40.25 =C2=B1  7%     -82.6%       7.00 =C2=B1 10%  sched_debug.cpu#7.c=
pu_load[3]
     39.50 =C2=B1  7%     -81.6%       7.25 =C2=B1 11%  sched_debug.cpu#7.c=
pu_load[4]
    103791 =C2=B1  0%     +17.2%     121689 =C2=B1  8%  sched_debug.cpu#7.n=
r_load_updates
     32.00 =C2=B1 35%    +281.2%     122.00 =C2=B1 26%  sched_debug.cpu#7.n=
r_uninterruptible

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/test:
  nhm-white2/unixbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/spa=
wn

commit: =

  9babcd7929bc8967ae3bb6093f603b93c2f9958f
  fde7d22e01aa0d252fc5c95fa11f0dac35a4dd59

9babcd7929bc8967 fde7d22e01aa0d252fc5c95fa1 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      4166 =C2=B1  0%     -25.1%       3121 =C2=B1  0%  unixbench.score
    341678 =C2=B1  2%     -44.4%     189815 =C2=B1 24%  unixbench.time.invo=
luntary_context_switches
 1.347e+08 =C2=B1  0%     -27.4%   97844330 =C2=B1  0%  unixbench.time.mino=
r_page_faults
    313.50 =C2=B1 10%     -13.2%     272.25 =C2=B1  0%  unixbench.time.perc=
ent_of_cpu_this_job_got
    720.99 =C2=B1  0%     -26.1%     532.63 =C2=B1  0%  unixbench.time.syst=
em_time
  11508855 =C2=B1  0%     -27.6%    8332095 =C2=B1  0%  unixbench.time.volu=
ntary_context_switches
    253.34 =C2=B1  9%     -15.1%     215.19 =C2=B1  0%  uptime.boot
      2925 =C2=B1  4%     +34.6%       3938 =C2=B1  1%  slabinfo.anon_vma.a=
ctive_objs
      2925 =C2=B1  4%     +36.3%       3988 =C2=B1  1%  slabinfo.anon_vma.n=
um_objs
    270278 =C2=B1  0%     -29.2%     191227 =C2=B1  0%  softirqs.RCU
    327794 =C2=B1  0%     -42.4%     188830 =C2=B1  0%  softirqs.SCHED
    398497 =C2=B1  0%     -27.0%     290848 =C2=B1  0%  softirqs.TIMER
     42.46 =C2=B1 10%     -12.4%      37.17 =C2=B1  0%  turbostat.%Busy
      1239 =C2=B1 10%     -14.7%       1056 =C2=B1  0%  turbostat.Avg_MHz
      2.17 =C2=B1  3%    +245.4%       7.49 =C2=B1  2%  turbostat.CPU%c3
 1.432e+08 =C2=B1  0%     -26.7%   1.05e+08 =C2=B1  0%  proc-vmstat.numa_hit
 1.432e+08 =C2=B1  0%     -26.7%   1.05e+08 =C2=B1  0%  proc-vmstat.numa_lo=
cal
 1.223e+08 =C2=B1  0%     -26.6%   89790760 =C2=B1  0%  proc-vmstat.pgalloc=
_dma32
  41596743 =C2=B1  0%     -26.4%   30615786 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
 1.342e+08 =C2=B1  0%     -27.3%   97507136 =C2=B1  0%  proc-vmstat.pgfault
 1.639e+08 =C2=B1  0%     -26.5%  1.204e+08 =C2=B1  0%  proc-vmstat.pgfree
    341678 =C2=B1  2%     -44.4%     189815 =C2=B1 24%  time.involuntary_co=
ntext_switches
 1.347e+08 =C2=B1  0%     -27.4%   97844330 =C2=B1  0%  time.minor_page_fau=
lts
    313.50 =C2=B1 10%     -13.2%     272.25 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
    720.99 =C2=B1  0%     -26.1%     532.63 =C2=B1  0%  time.system_time
     11.87 =C2=B1  1%     -30.3%       8.27 =C2=B1  1%  time.user_time
  11508855 =C2=B1  0%     -27.6%    8332095 =C2=B1  0%  time.voluntary_cont=
ext_switches
 2.624e+08 =C2=B1  1%     -57.0%  1.128e+08 =C2=B1  1%  cpuidle.C1-NHM.time
   6717622 =C2=B1  2%     -30.1%    4698658 =C2=B1 14%  cpuidle.C1-NHM.usage
 1.212e+08 =C2=B1  0%     +46.2%  1.772e+08 =C2=B1  1%  cpuidle.C1E-NHM.time
   1704312 =C2=B1  1%     +88.5%    3213346 =C2=B1  1%  cpuidle.C1E-NHM.usa=
ge
  83802866 =C2=B1  3%    +136.9%  1.985e+08 =C2=B1  2%  cpuidle.C3-NHM.time
    215374 =C2=B1  0%    +454.0%    1193095 =C2=B1  1%  cpuidle.C3-NHM.usage
    152900 =C2=B1 12%     +84.5%     282080 =C2=B1 37%  cpuidle.POLL.time
     42421 =C2=B1  3%     -37.0%      26731 =C2=B1 21%  cpuidle.POLL.usage
  44911227 =C2=B1 29%     -96.6%    1536687 =C2=B1100%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
   3072074 =C2=B1 62%    -100.0%     609.50 =C2=B1 60%  latency_stats.avg.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_fdatawait.sync_inodes_sb.sy=
nc_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fastpath
     44925 =C2=B1 11%     -79.7%       9129 =C2=B1  2%  latency_stats.hits.=
call_rwsem_down_write_failed.copy_process._do_fork.SyS_clone.entry_SYSCALL_=
64_fastpath
  49632519 =C2=B1 22%     -96.9%    1536687 =C2=B1100%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
  31980111 =C2=B1 70%    -100.0%       3453 =C2=B1 83%  latency_stats.max.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_fdatawait.sync_inodes_sb.sy=
nc_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fastpath
     92953 =C2=B1 11%     -80.7%      17962 =C2=B1  4%  latency_stats.sum.c=
all_rwsem_down_write_failed.copy_process._do_fork.SyS_clone.entry_SYSCALL_6=
4_fastpath
  56601104 =C2=B1 26%     -97.3%    1536687 =C2=B1100%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
  36953594 =C2=B1 62%    -100.0%       6067 =C2=B1 60%  latency_stats.sum.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_fdatawait.sync_inodes_sb.sy=
nc_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fastpath
     66.00 =C2=B1 38%     -98.9%       0.75 =C2=B1173%  sched_debug.cfs_rq[=
0]:/.load
   2149597 =C2=B1 20%    +342.4%    9510654 =C2=B1 16%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     37.25 =C2=B1 31%     -98.7%       0.50 =C2=B1173%  sched_debug.cfs_rq[=
0]:/.runnable_load_avg
     35.00 =C2=B1 24%     -87.1%       4.50 =C2=B1 57%  sched_debug.cfs_rq[=
1]:/.load
   2156450 =C2=B1  5%    +356.4%    9840991 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.min_vruntime
     31.75 =C2=B1 26%     -95.3%       1.50 =C2=B1 33%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
     70.50 =C2=B1 48%     -99.6%       0.25 =C2=B1173%  sched_debug.cfs_rq[=
2]:/.load
   1896064 =C2=B1  8%    +412.1%    9708867 =C2=B1  7%  sched_debug.cfs_rq[=
2]:/.min_vruntime
     10.75 =C2=B1 35%     -55.8%       4.75 =C2=B1 22%  sched_debug.cfs_rq[=
2]:/.nr_spread_over
     43.25 =C2=B1 30%     -98.3%       0.75 =C2=B1110%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
    131.00 =C2=B1 92%     -99.2%       1.00 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.load
   1980384 =C2=B1  8%    +400.7%    9915445 =C2=B1  8%  sched_debug.cfs_rq[=
3]:/.min_vruntime
    105.75 =C2=B1101%     -99.3%       0.75 =C2=B1 57%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
    558090 =C2=B1 29%   +1264.0%    7612282 =C2=B1  1%  sched_debug.cfs_rq[=
4]:/.min_vruntime
    338.25 =C2=B1 35%     -81.4%      62.75 =C2=B1172%  sched_debug.cfs_rq[=
4]:/.removed_load_avg
    338.25 =C2=B1 35%     -81.4%      62.75 =C2=B1172%  sched_debug.cfs_rq[=
4]:/.removed_util_avg
    154.75 =C2=B1133%     -98.1%       3.00 =C2=B1 94%  sched_debug.cfs_rq[=
5]:/.load
    437512 =C2=B1 35%   +1695.5%    7855731 =C2=B1  6%  sched_debug.cfs_rq[=
5]:/.min_vruntime
    149.50 =C2=B1136%     -99.3%       1.00 =C2=B1122%  sched_debug.cfs_rq[=
5]:/.runnable_load_avg
     63.75 =C2=B1 62%     -98.0%       1.25 =C2=B1173%  sched_debug.cfs_rq[=
6]:/.load
    499326 =C2=B1 13%   +1476.5%    7872108 =C2=B1  5%  sched_debug.cfs_rq[=
6]:/.min_vruntime
      8.75 =C2=B1 40%     -57.1%       3.75 =C2=B1 22%  sched_debug.cfs_rq[=
6]:/.nr_spread_over
     31.00 =C2=B1 21%     -95.2%       1.50 =C2=B1 74%  sched_debug.cfs_rq[=
6]:/.runnable_load_avg
     40.50 =C2=B1 53%     -96.3%       1.50 =C2=B1110%  sched_debug.cfs_rq[=
7]:/.load
    413625 =C2=B1 23%   +1860.3%    8108224 =C2=B1 10%  sched_debug.cfs_rq[=
7]:/.min_vruntime
     32.25 =C2=B1 46%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
    475552 =C2=B1 23%     -58.7%     196603 =C2=B1 40%  sched_debug.cpu#0.a=
vg_idle
    121618 =C2=B1 12%     -12.6%     106321 =C2=B1  0%  sched_debug.cpu#0.c=
lock
    121618 =C2=B1 12%     -12.6%     106321 =C2=B1  0%  sched_debug.cpu#0.c=
lock_task
     32.75 =C2=B1 65%     -98.5%       0.50 =C2=B1173%  sched_debug.cpu#0.c=
pu_load[0]
     46.75 =C2=B1 55%     -88.2%       5.50 =C2=B1118%  sched_debug.cpu#0.c=
pu_load[1]
     55.00 =C2=B1 48%     -79.1%      11.50 =C2=B1 91%  sched_debug.cpu#0.c=
pu_load[2]
     58.75 =C2=B1 40%     -74.5%      15.00 =C2=B1 32%  sched_debug.cpu#0.c=
pu_load[3]
     60.00 =C2=B1 34%     -73.8%      15.75 =C2=B1 14%  sched_debug.cpu#0.c=
pu_load[4]
    121618 =C2=B1 12%     -12.6%     106322 =C2=B1  0%  sched_debug.cpu#1.c=
lock
    121618 =C2=B1 12%     -12.6%     106322 =C2=B1  0%  sched_debug.cpu#1.c=
lock_task
     32.00 =C2=B1 61%     -97.7%       0.75 =C2=B1110%  sched_debug.cpu#1.c=
pu_load[0]
     49.25 =C2=B1 67%     -90.4%       4.75 =C2=B1 89%  sched_debug.cpu#1.c=
pu_load[1]
     60.00 =C2=B1 54%     -76.7%      14.00 =C2=B1 82%  sched_debug.cpu#1.c=
pu_load[2]
     65.00 =C2=B1 40%     -71.2%      18.75 =C2=B1 71%  sched_debug.cpu#1.c=
pu_load[3]
     64.25 =C2=B1 28%     -70.0%      19.25 =C2=B1 55%  sched_debug.cpu#1.c=
pu_load[4]
   1121772 =C2=B1 17%     -38.2%     693272 =C2=B1  6%  sched_debug.cpu#1.n=
r_switches
   1121837 =C2=B1 17%     -38.2%     693317 =C2=B1  6%  sched_debug.cpu#1.s=
ched_count
    465414 =C2=B1 24%     -33.7%     308355 =C2=B1  7%  sched_debug.cpu#1.s=
ched_goidle
    360318 =C2=B1 36%     -52.9%     169582 =C2=B1 12%  sched_debug.cpu#1.t=
twu_count
    209570 =C2=B1 74%     -86.5%      28358 =C2=B1  5%  sched_debug.cpu#1.t=
twu_local
    121618 =C2=B1 12%     -12.6%     106322 =C2=B1  0%  sched_debug.cpu#2.c=
lock
    121618 =C2=B1 12%     -12.6%     106322 =C2=B1  0%  sched_debug.cpu#2.c=
lock_task
     31.75 =C2=B1 48%     -98.4%       0.50 =C2=B1100%  sched_debug.cpu#2.c=
pu_load[0]
     53.25 =C2=B1 28%     -58.7%      22.00 =C2=B1 28%  sched_debug.cpu#2.c=
pu_load[3]
     53.50 =C2=B1 25%     -71.0%      15.50 =C2=B1 13%  sched_debug.cpu#2.c=
pu_load[4]
      1683 =C2=B1118%    +210.7%       5231 =C2=B1 29%  sched_debug.cpu#2.c=
urr->pid
     56.25 =C2=B1 62%     -98.7%       0.75 =C2=B1 57%  sched_debug.cpu#2.l=
oad
    121619 =C2=B1 12%     -12.6%     106322 =C2=B1  0%  sched_debug.cpu#3.c=
lock
    121619 =C2=B1 12%     -12.6%     106322 =C2=B1  0%  sched_debug.cpu#3.c=
lock_task
     27.50 =C2=B1  9%    -100.0%       0.00 =C2=B1  0%  sched_debug.cpu#3.c=
pu_load[0]
     33.75 =C2=B1 13%     -81.5%       6.25 =C2=B1 93%  sched_debug.cpu#3.c=
pu_load[1]
      8.75 =C2=B1131%    -351.4%     -22.00 =C2=B1-43%  sched_debug.cpu#3.n=
r_uninterruptible
    737612 =C2=B1 58%     -76.7%     172042 =C2=B1144%  sched_debug.cpu#3.t=
twu_local
    121617 =C2=B1 12%     -12.6%     106322 =C2=B1  0%  sched_debug.cpu#4.c=
lock
    121617 =C2=B1 12%     -12.6%     106322 =C2=B1  0%  sched_debug.cpu#4.c=
lock_task
     35.75 =C2=B1 28%     -98.6%       0.50 =C2=B1173%  sched_debug.cpu#4.c=
pu_load[0]
     33.50 =C2=B1 29%     -60.4%      13.25 =C2=B1 98%  sched_debug.cpu#4.c=
pu_load[1]
     51.00 =C2=B1 20%     -49.5%      25.75 =C2=B1 57%  sched_debug.cpu#4.c=
pu_load[4]
      4.25 =C2=B1126%    +282.4%      16.25 =C2=B1 45%  sched_debug.cpu#4.n=
r_uninterruptible
     99233 =C2=B1 29%     -70.2%      29599 =C2=B1  4%  sched_debug.cpu#4.t=
twu_local
    121611 =C2=B1 12%     -12.6%     106322 =C2=B1  0%  sched_debug.cpu#5.c=
lock
    121611 =C2=B1 12%     -12.6%     106322 =C2=B1  0%  sched_debug.cpu#5.c=
lock_task
     26.25 =C2=B1 93%     -97.1%       0.75 =C2=B1173%  sched_debug.cpu#5.c=
pu_load[0]
     27.25 =C2=B1 51%     -97.2%       0.75 =C2=B1110%  sched_debug.cpu#5.c=
pu_load[1]
     32.25 =C2=B1 30%     -88.4%       3.75 =C2=B1 78%  sched_debug.cpu#5.c=
pu_load[2]
     37.50 =C2=B1 28%     -76.7%       8.75 =C2=B1 50%  sched_debug.cpu#5.c=
pu_load[3]
     40.25 =C2=B1 30%     -70.8%      11.75 =C2=B1 25%  sched_debug.cpu#5.c=
pu_load[4]
   1884512 =C2=B1118%     -73.6%     497744 =C2=B1 10%  sched_debug.cpu#5.n=
r_switches
   1884576 =C2=B1118%     -73.6%     497787 =C2=B1 10%  sched_debug.cpu#5.s=
ched_count
    886706 =C2=B1128%     -78.7%     188449 =C2=B1 10%  sched_debug.cpu#5.t=
twu_count
    783005 =C2=B1147%     -96.4%      27830 =C2=B1  1%  sched_debug.cpu#5.t=
twu_local
    121618 =C2=B1 12%     -12.6%     106323 =C2=B1  0%  sched_debug.cpu#6.c=
lock
    121618 =C2=B1 12%     -12.6%     106323 =C2=B1  0%  sched_debug.cpu#6.c=
lock_task
     60.50 =C2=B1 38%     -64.5%      21.50 =C2=B1137%  sched_debug.cpu#6.c=
pu_load[2]
     55.00 =C2=B1 21%     -58.6%      22.75 =C2=B1 95%  sched_debug.cpu#6.c=
pu_load[3]
     52.75 =C2=B1 22%     -56.4%      23.00 =C2=B1 68%  sched_debug.cpu#6.c=
pu_load[4]
     35564 =C2=B1 18%     +43.9%      51159 =C2=B1 18%  sched_debug.cpu#6.n=
r_load_updates
      3.50 =C2=B1107%    +435.7%      18.75 =C2=B1 17%  sched_debug.cpu#6.n=
r_uninterruptible
    478682 =C2=B1 24%     -49.7%     240698 =C2=B1 33%  sched_debug.cpu#7.a=
vg_idle
    121618 =C2=B1 12%     -12.6%     106323 =C2=B1  0%  sched_debug.cpu#7.c=
lock
    121618 =C2=B1 12%     -12.6%     106323 =C2=B1  0%  sched_debug.cpu#7.c=
lock_task
     53.00 =C2=B1 60%     -67.5%      17.25 =C2=B1 54%  sched_debug.cpu#7.c=
pu_load[3]
     53.25 =C2=B1 49%     -77.9%      11.75 =C2=B1 29%  sched_debug.cpu#7.c=
pu_load[4]
     46.50 =C2=B1 41%     -95.0%       2.33 =C2=B1 80%  sched_debug.cpu#7.l=
oad
      3.25 =C2=B1 79%    +569.2%      21.75 =C2=B1 17%  sched_debug.cpu#7.n=
r_uninterruptible
    121618 =C2=B1 12%     -12.6%     106321 =C2=B1  0%  sched_debug.cpu_clk
    121450 =C2=B1 12%     -12.6%     106155 =C2=B1  0%  sched_debug.ktime
     15.36 =C2=B1127%     -92.3%       1.18 =C2=B1172%  sched_debug.rt_rq[3=
]:/.rt_time
      8.25 =C2=B1173%    -100.0%       0.00 =C2=B1107%  sched_debug.rt_rq[5=
]:/.rt_time
    121618 =C2=B1 12%     -12.6%     106321 =C2=B1  0%  sched_debug.sched_c=
lk

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/test:
  nhm-white/unixbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/spawn

commit: =

  9babcd7929bc8967ae3bb6093f603b93c2f9958f
  fde7d22e01aa0d252fc5c95fa11f0dac35a4dd59

9babcd7929bc8967 fde7d22e01aa0d252fc5c95fa1 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      4164 =C2=B1  0%     -25.1%       3117 =C2=B1  0%  unixbench.score
    320351 =C2=B1  5%     -24.0%     243618 =C2=B1 15%  unixbench.time.invo=
luntary_context_switches
 1.342e+08 =C2=B1  0%     -27.2%   97704510 =C2=B1  0%  unixbench.time.mino=
r_page_faults
    366.00 =C2=B1  0%     -27.7%     264.50 =C2=B1  5%  unixbench.time.perc=
ent_of_cpu_this_job_got
    719.84 =C2=B1  0%     -26.0%     532.61 =C2=B1  0%  unixbench.time.syst=
em_time
  11479915 =C2=B1  0%     -27.9%    8278678 =C2=B1  1%  unixbench.time.volu=
ntary_context_switches
    981.75 =C2=B1  1%     +23.9%       1216 =C2=B1  5%  uptime.idle
    121209 =C2=B1  4%     -13.3%     105117 =C2=B1  5%  vmstat.system.cs
      2926 =C2=B1  3%     +29.0%       3776 =C2=B1  0%  slabinfo.anon_vma.a=
ctive_objs
      2926 =C2=B1  3%     +31.2%       3839 =C2=B1  0%  slabinfo.anon_vma.n=
um_objs
      1677 =C2=B1  0%     +10.9%       1859 =C2=B1  3%  slabinfo.proc_inode=
_cache.num_objs
    268865 =C2=B1  0%     -28.5%     192157 =C2=B1  0%  softirqs.RCU
    325184 =C2=B1  0%     -41.9%     188773 =C2=B1  0%  softirqs.SCHED
    394097 =C2=B1  0%     -26.6%     289277 =C2=B1  0%  softirqs.TIMER
     49.49 =C2=B1  0%     -26.9%      36.18 =C2=B1  5%  turbostat.%Busy
      1446 =C2=B1  0%     -29.0%       1026 =C2=B1  5%  turbostat.Avg_MHz
     37.25 =C2=B1  0%     -19.0%      30.18 =C2=B1  4%  turbostat.CPU%c1
      2.35 =C2=B1  4%    +219.0%       7.50 =C2=B1  7%  turbostat.CPU%c3
     10.91 =C2=B1  4%    +139.5%      26.13 =C2=B1 12%  turbostat.CPU%c6
 1.439e+08 =C2=B1  0%     -27.2%  1.048e+08 =C2=B1  0%  proc-vmstat.numa_hit
 1.439e+08 =C2=B1  0%     -27.2%  1.048e+08 =C2=B1  0%  proc-vmstat.numa_lo=
cal
  83056815 =C2=B1  0%     -27.2%   60467213 =C2=B1  0%  proc-vmstat.pgalloc=
_dma32
  81595838 =C2=B1  0%     -26.9%   59667061 =C2=B1  1%  proc-vmstat.pgalloc=
_normal
 1.341e+08 =C2=B1  0%     -27.3%   97442961 =C2=B1  0%  proc-vmstat.pgfault
 1.646e+08 =C2=B1  0%     -27.0%  1.201e+08 =C2=B1  1%  proc-vmstat.pgfree
    320351 =C2=B1  5%     -24.0%     243618 =C2=B1 15%  time.involuntary_co=
ntext_switches
 1.342e+08 =C2=B1  0%     -27.2%   97704510 =C2=B1  0%  time.minor_page_fau=
lts
    366.00 =C2=B1  0%     -27.7%     264.50 =C2=B1  5%  time.percent_of_cpu=
_this_job_got
    719.84 =C2=B1  0%     -26.0%     532.61 =C2=B1  0%  time.system_time
     11.81 =C2=B1  0%     -29.9%       8.28 =C2=B1  1%  time.user_time
  11479915 =C2=B1  0%     -27.9%    8278678 =C2=B1  1%  time.voluntary_cont=
ext_switches
 2.548e+08 =C2=B1  0%     -56.5%  1.108e+08 =C2=B1  5%  cpuidle.C1-NHM.time
   6328394 =C2=B1  6%     -25.1%    4741683 =C2=B1 10%  cpuidle.C1-NHM.usage
 1.224e+08 =C2=B1  3%     +43.2%  1.754e+08 =C2=B1  1%  cpuidle.C1E-NHM.time
   1707009 =C2=B1  1%     +85.3%    3162580 =C2=B1  2%  cpuidle.C1E-NHM.usa=
ge
  83590493 =C2=B1  3%    +138.9%  1.997e+08 =C2=B1  4%  cpuidle.C3-NHM.time
    214120 =C2=B1  2%    +450.7%    1179146 =C2=B1  3%  cpuidle.C3-NHM.usage
 3.569e+08 =C2=B1  3%     +62.6%  5.805e+08 =C2=B1 15%  cpuidle.C6-NHM.time
    134404 =C2=B1  1%     +33.0%     178770 =C2=B1  3%  cpuidle.C6-NHM.usage
     96172 =C2=B1162%     -99.8%     226.50 =C2=B1 67%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_do_setattr.[nfsv4].nfs4_do_setattr.[nfsv4].nfs4_do_o=
pen.[nfsv4].nfs4_atomic_open.[nfsv4].nfs_atomic_open.path_openat.do_filp_op=
en
     34142 =C2=B1108%     -99.5%     162.75 =C2=B1 49%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_do_setattr.[nfsv4].nfs4_do_setattr.[nfsv4].nfs4_proc=
_setattr.[nfsv4].nfs_setattr.notify_change.chmod_common.SyS_fchmodat
     65931 =C2=B1146%     -99.7%     181.25 =C2=B1 52%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_do_setattr.[nfsv4].nfs4_do_setattr.[nfsv4].nfs4_proc=
_setattr.[nfsv4].nfs_setattr.notify_change.chown_common.SyS_fchownat
     83879 =C2=B1154%     -99.5%     425.75 =C2=B1 43%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[nfs=
v4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.=
[nfsv4].nfs_atomic_open.path_openat.do_filp_open.do_sys_open.SyS_open.entry=
_SYSCALL_64_fastpath
     41163 =C2=B1  7%     -77.9%       9110 =C2=B1  9%  latency_stats.hits.=
call_rwsem_down_write_failed.copy_process._do_fork.SyS_clone.entry_SYSCALL_=
64_fastpath
    244420 =C2=B1165%     -99.9%     302.75 =C2=B1 75%  latency_stats.max.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_do_setattr.[nfsv4].nfs4_do_setattr.[nfsv4].nfs4_do_o=
pen.[nfsv4].nfs4_atomic_open.[nfsv4].nfs_atomic_open.path_openat.do_filp_op=
en
     34142 =C2=B1108%     -99.5%     162.75 =C2=B1 49%  latency_stats.max.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_do_setattr.[nfsv4].nfs4_do_setattr.[nfsv4].nfs4_proc=
_setattr.[nfsv4].nfs_setattr.notify_change.chmod_common.SyS_fchmodat
     65931 =C2=B1146%     -99.7%     181.25 =C2=B1 52%  latency_stats.max.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_do_setattr.[nfsv4].nfs4_do_setattr.[nfsv4].nfs4_proc=
_setattr.[nfsv4].nfs_setattr.notify_change.chown_common.SyS_fchownat
    190909 =C2=B1146%     -99.5%     937.25 =C2=B1 84%  latency_stats.max.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[nfs=
v4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.=
[nfsv4].nfs_atomic_open.path_openat.do_filp_open.do_sys_open.SyS_open.entry=
_SYSCALL_64_fastpath
    486429 =C2=B1166%    +872.7%    4731410 =C2=B1173%  latency_stats.max.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_fdatawait.sync_inodes_sb.sy=
nc_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fastpath
     85615 =C2=B1  7%     -78.8%      18177 =C2=B1  6%  latency_stats.sum.c=
all_rwsem_down_write_failed.copy_process._do_fork.SyS_clone.entry_SYSCALL_6=
4_fastpath
    288518 =C2=B1162%     -99.8%     679.75 =C2=B1 67%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_do_setattr.[nfsv4].nfs4_do_setattr.[nfsv4].nfs4_do_o=
pen.[nfsv4].nfs4_atomic_open.[nfsv4].nfs_atomic_open.path_openat.do_filp_op=
en
     34142 =C2=B1108%     -99.5%     162.75 =C2=B1 49%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_do_setattr.[nfsv4].nfs4_do_setattr.[nfsv4].nfs4_proc=
_setattr.[nfsv4].nfs_setattr.notify_change.chmod_common.SyS_fchmodat
     65931 =C2=B1146%     -99.7%     181.25 =C2=B1 52%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_do_setattr.[nfsv4].nfs4_do_setattr.[nfsv4].nfs4_proc=
_setattr.[nfsv4].nfs_setattr.notify_change.chown_common.SyS_fchownat
    335516 =C2=B1154%     -99.5%       1703 =C2=B1 43%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[nfs=
v4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.=
[nfsv4].nfs_atomic_open.path_openat.do_filp_open.do_sys_open.SyS_open.entry=
_SYSCALL_64_fastpath
    729856 =C2=B1167%    +796.0%    6539353 =C2=B1173%  latency_stats.sum.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_fdatawait.sync_inodes_sb.sy=
nc_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fastpath
     32481 =C2=B1  7%     -19.1%      26264 =C2=B1  8%  sched_debug.cfs_rq[=
0]:/.exec_clock
    143.25 =C2=B1 79%     -99.7%       0.50 =C2=B1173%  sched_debug.cfs_rq[=
0]:/.load
      6.00 =C2=B1115%     -91.7%       0.50 =C2=B1100%  sched_debug.cfs_rq[=
0]:/.load_avg
   1721596 =C2=B1 34%    +454.0%    9537654 =C2=B1 10%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     55.25 =C2=B1 33%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.runnable_load_avg
      6.00 =C2=B1115%     -91.7%       0.50 =C2=B1100%  sched_debug.cfs_rq[=
0]:/.tg_load_avg_contrib
     32739 =C2=B1  1%     -28.6%      23382 =C2=B1  8%  sched_debug.cfs_rq[=
1]:/.exec_clock
     77.00 =C2=B1 22%     -99.4%       0.50 =C2=B1100%  sched_debug.cfs_rq[=
1]:/.load
   2158421 =C2=B1  4%    +308.7%    8820555 =C2=B1  8%  sched_debug.cfs_rq[=
1]:/.min_vruntime
     53.25 =C2=B1 18%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
     31653 =C2=B1  4%     -23.9%      24092 =C2=B1  7%  sched_debug.cfs_rq[=
2]:/.exec_clock
    133.50 =C2=B1 68%     -98.1%       2.50 =C2=B1103%  sched_debug.cfs_rq[=
2]:/.load
   2008812 =C2=B1  9%    +385.1%    9744763 =C2=B1  6%  sched_debug.cfs_rq[=
2]:/.min_vruntime
    103.00 =C2=B1100%     -98.1%       2.00 =C2=B1117%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
     30993 =C2=B1  2%     -23.6%      23673 =C2=B1  7%  sched_debug.cfs_rq[=
3]:/.exec_clock
     92.75 =C2=B1 42%     -98.1%       1.75 =C2=B1 74%  sched_debug.cfs_rq[=
3]:/.load
   1881985 =C2=B1  4%    +401.4%    9436172 =C2=B1  5%  sched_debug.cfs_rq[=
3]:/.min_vruntime
     55.50 =C2=B1 30%     -99.1%       0.50 =C2=B1100%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
     24562 =C2=B1  1%     -17.2%      20346 =C2=B1  4%  sched_debug.cfs_rq[=
4]:/.exec_clock
    112.25 =C2=B1 90%     -86.6%      15.00 =C2=B1169%  sched_debug.cfs_rq[=
4]:/.load
    518402 =C2=B1 13%   +1427.4%    7917987 =C2=B1  4%  sched_debug.cfs_rq[=
4]:/.min_vruntime
      7.50 =C2=B1 24%     -56.7%       3.25 =C2=B1 13%  sched_debug.cfs_rq[=
4]:/.nr_spread_over
    105.50 =C2=B1 95%     -99.5%       0.50 =C2=B1100%  sched_debug.cfs_rq[=
4]:/.runnable_load_avg
     24648 =C2=B1  1%     -26.5%      18104 =C2=B1  9%  sched_debug.cfs_rq[=
5]:/.exec_clock
     57.50 =C2=B1 23%     -97.4%       1.50 =C2=B1137%  sched_debug.cfs_rq[=
5]:/.load
    600129 =C2=B1 21%   +1067.3%    7005079 =C2=B1  8%  sched_debug.cfs_rq[=
5]:/.min_vruntime
      4.75 =C2=B1 31%     +89.5%       9.00 =C2=B1 24%  sched_debug.cfs_rq[=
5]:/.nr_spread_over
     49.50 =C2=B1 25%     -89.4%       5.25 =C2=B1162%  sched_debug.cfs_rq[=
5]:/.runnable_load_avg
     24460 =C2=B1  4%     -25.3%      18266 =C2=B1 10%  sched_debug.cfs_rq[=
6]:/.exec_clock
     93.25 =C2=B1 36%     -97.9%       2.00 =C2=B1117%  sched_debug.cfs_rq[=
6]:/.load
    517932 =C2=B1 29%   +1307.8%    7291246 =C2=B1 11%  sched_debug.cfs_rq[=
6]:/.min_vruntime
     65.00 =C2=B1 17%     -99.6%       0.25 =C2=B1173%  sched_debug.cfs_rq[=
6]:/.runnable_load_avg
     73.50 =C2=B1 24%     -94.1%       4.33 =C2=B1 57%  sched_debug.cfs_rq[=
7]:/.load
    499653 =C2=B1 37%   +1539.6%    8192385 =C2=B1  9%  sched_debug.cfs_rq[=
7]:/.min_vruntime
     51.25 =C2=B1 23%     -95.4%       2.33 =C2=B1 20%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
     83.00 =C2=B1 25%     -63.9%      30.00 =C2=B1 78%  sched_debug.cpu#0.c=
pu_load[2]
     90.25 =C2=B1 14%     -70.4%      26.75 =C2=B1 47%  sched_debug.cpu#0.c=
pu_load[3]
     87.25 =C2=B1  8%     -76.2%      20.75 =C2=B1 31%  sched_debug.cpu#0.c=
pu_load[4]
    206.75 =C2=B1106%     -99.6%       0.75 =C2=B1110%  sched_debug.cpu#0.l=
oad
    119.75 =C2=B1 93%    -100.0%       0.00 =C2=B1  0%  sched_debug.cpu#1.c=
pu_load[0]
     93.50 =C2=B1 62%     -82.1%      16.75 =C2=B1159%  sched_debug.cpu#1.c=
pu_load[1]
     90.00 =C2=B1 36%     -82.5%      15.75 =C2=B1120%  sched_debug.cpu#1.c=
pu_load[2]
     87.50 =C2=B1 18%     -86.3%      12.00 =C2=B1 91%  sched_debug.cpu#1.c=
pu_load[3]
     81.25 =C2=B1 12%     -88.9%       9.00 =C2=B1 49%  sched_debug.cpu#1.c=
pu_load[4]
    141.25 =C2=B1 90%     -99.5%       0.75 =C2=B1 57%  sched_debug.cpu#1.l=
oad
    119.75 =C2=B1 87%    -100.0%       0.00 =C2=B1  0%  sched_debug.cpu#2.c=
pu_load[0]
     79.25 =C2=B1 40%     -65.3%      27.50 =C2=B1102%  sched_debug.cpu#2.c=
pu_load[2]
     75.00 =C2=B1 30%     -73.7%      19.75 =C2=B1102%  sched_debug.cpu#2.c=
pu_load[3]
     74.25 =C2=B1 21%     -81.1%      14.00 =C2=B1 92%  sched_debug.cpu#2.c=
pu_load[4]
     12421 =C2=B1 20%     -63.2%       4575 =C2=B1 70%  sched_debug.cpu#2.c=
urr->pid
   1417299 =C2=B1 56%     -53.4%     659778 =C2=B1  6%  sched_debug.cpu#2.n=
r_switches
     -5.75 =C2=B1-39%    +230.4%     -19.00 =C2=B1-24%  sched_debug.cpu#2.n=
r_uninterruptible
   1417359 =C2=B1 56%     -53.4%     659820 =C2=B1  6%  sched_debug.cpu#2.s=
ched_count
    590769 =C2=B1 62%     -50.5%     292590 =C2=B1  6%  sched_debug.cpu#2.s=
ched_goidle
    518107 =C2=B1 81%     -70.6%     152295 =C2=B1  8%  sched_debug.cpu#2.t=
twu_count
    364621 =C2=B1117%     -92.4%      27717 =C2=B1  7%  sched_debug.cpu#2.t=
twu_local
     56.25 =C2=B1 26%     -99.6%       0.25 =C2=B1173%  sched_debug.cpu#3.c=
pu_load[0]
     64.50 =C2=B1 20%     -86.8%       8.50 =C2=B1159%  sched_debug.cpu#3.c=
pu_load[1]
     71.75 =C2=B1 19%     -83.3%      12.00 =C2=B1115%  sched_debug.cpu#3.c=
pu_load[2]
     73.00 =C2=B1 15%     -84.6%      11.25 =C2=B1 83%  sched_debug.cpu#3.c=
pu_load[3]
     72.50 =C2=B1 13%     -88.3%       8.50 =C2=B1 67%  sched_debug.cpu#3.c=
pu_load[4]
    100.75 =C2=B1 26%     -98.5%       1.50 =C2=B1100%  sched_debug.cpu#3.l=
oad
     62712 =C2=B1  8%      -9.6%      56704 =C2=B1  5%  sched_debug.cpu#3.n=
r_load_updates
   1768336 =C2=B1 47%     -62.9%     655383 =C2=B1  5%  sched_debug.cpu#3.n=
r_switches
   1768398 =C2=B1 47%     -62.9%     655427 =C2=B1  5%  sched_debug.cpu#3.s=
ched_count
    750094 =C2=B1 51%     -61.4%     289776 =C2=B1  6%  sched_debug.cpu#3.s=
ched_goidle
    710243 =C2=B1 62%     -76.8%     164891 =C2=B1  9%  sched_debug.cpu#3.t=
twu_count
    563179 =C2=B1 79%     -95.1%      27631 =C2=B1  6%  sched_debug.cpu#3.t=
twu_local
     48.75 =C2=B1 24%     -99.0%       0.50 =C2=B1100%  sched_debug.cpu#4.c=
pu_load[0]
     72.75 =C2=B1 17%     -62.9%      27.00 =C2=B1 72%  sched_debug.cpu#4.c=
pu_load[3]
     80.50 =C2=B1 18%     -70.2%      24.00 =C2=B1 69%  sched_debug.cpu#4.c=
pu_load[4]
      8619 =C2=B1 37%     -65.7%       2957 =C2=B1 56%  sched_debug.cpu#4.c=
urr->pid
    112.00 =C2=B1 74%     -87.1%      14.50 =C2=B1169%  sched_debug.cpu#4.l=
oad
     37154 =C2=B1  1%     +18.1%      43893 =C2=B1  1%  sched_debug.cpu#4.n=
r_load_updates
    185296 =C2=B1  2%     +18.8%     220143 =C2=B1  2%  sched_debug.cpu#4.s=
ched_goidle
    217547 =C2=B1  1%     -16.3%     181985 =C2=B1  7%  sched_debug.cpu#4.t=
twu_count
    111756 =C2=B1  3%     -76.3%      26520 =C2=B1 11%  sched_debug.cpu#4.t=
twu_local
    118.00 =C2=B1 75%    -100.0%       0.00 =C2=B1  0%  sched_debug.cpu#5.c=
pu_load[1]
    113.50 =C2=B1 51%     -99.3%       0.75 =C2=B1173%  sched_debug.cpu#5.c=
pu_load[2]
    105.75 =C2=B1 34%     -96.2%       4.00 =C2=B1 88%  sched_debug.cpu#5.c=
pu_load[3]
     96.00 =C2=B1 21%     -91.4%       8.25 =C2=B1 58%  sched_debug.cpu#5.c=
pu_load[4]
     65.25 =C2=B1  0%     -96.9%       2.00 =C2=B1 86%  sched_debug.cpu#5.l=
oad
     37623 =C2=B1  2%     +48.8%      55980 =C2=B1 17%  sched_debug.cpu#5.n=
r_load_updates
    361205 =C2=B1 25%     +48.7%     537025 =C2=B1  2%  sched_debug.cpu#6.a=
vg_idle
    133.50 =C2=B1 83%     -99.8%       0.25 =C2=B1173%  sched_debug.cpu#6.c=
pu_load[0]
     89.75 =C2=B1 63%     -98.6%       1.25 =C2=B1131%  sched_debug.cpu#6.c=
pu_load[1]
     75.50 =C2=B1 44%     -91.4%       6.50 =C2=B1 95%  sched_debug.cpu#6.c=
pu_load[2]
     72.25 =C2=B1 25%     -78.9%      15.25 =C2=B1 68%  sched_debug.cpu#6.c=
pu_load[3]
     73.50 =C2=B1 16%     -73.5%      19.50 =C2=B1 66%  sched_debug.cpu#6.c=
pu_load[4]
     93.00 =C2=B1 36%     -97.6%       2.25 =C2=B1101%  sched_debug.cpu#6.l=
oad
   1488721 =C2=B1103%     -69.5%     454376 =C2=B1 11%  sched_debug.cpu#6.n=
r_switches
   1488784 =C2=B1103%     -69.5%     454418 =C2=B1 11%  sched_debug.cpu#6.s=
ched_count
    676524 =C2=B1114%     -76.2%     161114 =C2=B1  9%  sched_debug.cpu#6.t=
twu_count
    567800 =C2=B1138%     -95.3%      26653 =C2=B1 10%  sched_debug.cpu#6.t=
twu_local
     63.00 =C2=B1 19%     -60.3%      25.00 =C2=B1 73%  sched_debug.cpu#7.c=
pu_load[4]
    136.00 =C2=B1 78%     -97.6%       3.25 =C2=B1 70%  sched_debug.cpu#7.l=
oad
   2557263 =C2=B1 76%     -78.9%     538671 =C2=B1 10%  sched_debug.cpu#7.n=
r_switches
   2557333 =C2=B1 76%     -78.9%     538711 =C2=B1 10%  sched_debug.cpu#7.s=
ched_count
   1214320 =C2=B1 81%     -85.5%     176506 =C2=B1  8%  sched_debug.cpu#7.t=
twu_count
   1111314 =C2=B1 90%     -97.6%      26445 =C2=B1 10%  sched_debug.cpu#7.t=
twu_local
      0.47 =C2=B1 94%   +6705.5%      32.01 =C2=B1 75%  sched_debug.rt_rq[1=
]:/.rt_time


nhm-white2: Nehalem
Memory: 4G

nhm-white: Nehalem
Memory: 6G


                                  unixbench.score

  4500 ++------------------------------------------------------------------=
-+
       *...*..*...*...*..*      *...*...*..*...*...*..*...*..*...*...*..*..=
.*
  4000 ++                :      :                                          =
 |
  3500 ++                 :     :                                          =
 |
       O   O  O   O   O  O:  O :O   O   O  O   O   O  O   O  O   O   O  O  =
 |
  3000 ++                 :    :                                           =
 |
  2500 ++                  :   :                                           =
 |
       |                   :   :                                           =
 |
  2000 ++                  :  :                                            =
 |
  1500 ++                  :  :                                            =
 |
       |                    : :                                            =
 |
  1000 ++                   : :                                            =
 |
   500 ++                   ::                                             =
 |
       |                     :                                             =
 |
     0 ++--------------------*---------------------------------------------=
-+


                            unixbench.time.system_time

  800 ++-------------------------------------------------------------------=
-+
      *...*..*...*...*..*       *..*...*...*...*..*...*...*..*...*...*..*..=
.*
  700 ++                :       :                                          =
 |
  600 ++                 :     :                                           =
 |
      |                  :     :                                           =
 |
  500 O+  O  O   O   O  O:  O  :O  O   O   O   O  O   O   O  O   O   O  O  =
 |
      |                   :   :                                            =
 |
  400 ++                  :   :                                            =
 |
      |                   :   :                                            =
 |
  300 ++                  :   :                                            =
 |
  200 ++                   : :                                             =
 |
      |                    : :                                             =
 |
  100 ++                   : :                                             =
 |
      |                     :                                              =
 |
    0 ++--------------------*----------------------------------------------=
-+


                           unixbench.time.minor_page_faults

  1.4e+08 ++-*----------*---------*------*-------------*---*-------------*-=
-+
          *.     *..*.     *      :   *.     *..*...*.        *...*..*.    =
 *
  1.2e+08 ++               :      :                                        =
 |
          |                 :    :                                         =
 |
    1e+08 O+ O   O  O   O  O:  O :O   O  O   O  O   O  O   O  O   O  O   O =
 |
          |                 :    :                                         =
 |
    8e+07 ++                 :   :                                         =
 |
          |                  :   :                                         =
 |
    6e+07 ++                 :  :                                          =
 |
          |                  :  :                                          =
 |
    4e+07 ++                  : :                                          =
 |
          |                   : :                                          =
 |
    2e+07 ++                  ::                                           =
 |
          |                    :                                           =
 |
        0 ++-------------------*-------------------------------------------=
-+


                       unixbench.time.voluntary_context_switches

  1.2e+07 ++-*------------------------*--*---------------------------------=
-*
          *.     *..*...*..*      *.         *..*...*..*...*..*...*..*...*.=
 |
    1e+07 ++               :      :                                        =
 |
          |                 :     :                                        =
 |
          O  O   O  O   O  O:  O :O   O  O   O  O   O  O   O  O   O      O =
 |
    8e+06 ++                :    :                                   O     =
 |
          |                  :   :                                         =
 |
    6e+06 ++                 :   :                                         =
 |
          |                  :  :                                          =
 |
    4e+06 ++                 :  :                                          =
 |
          |                   : :                                          =
 |
          |                   : :                                          =
 |
    2e+06 ++                  ::                                           =
 |
          |                    :                                           =
 |
        0 ++-------------------*-------------------------------------------=
-+


                                 time.user_time

  12 *+--*--*---*---*---*------*---*---*--*---*---*---*--*---*---*---*--*--=
-*
     |                  :      :                                           =
 |
  10 ++                 :     :                                            =
 |
     |                   :    :                                            =
 |
     O   O  O   O       O: O  :O   O      O       O   O  O   O   O   O  O  =
 |
   8 ++             O    :    :        O      O                            =
 |
     |                   :   :                                             =
 |
   6 ++                   :  :                                             =
 |
     |                    :  :                                             =
 |
   4 ++                   : :                                              =
 |
     |                    : :                                              =
 |
     |                    : :                                              =
 |
   2 ++                    ::                                              =
 |
     |                     :                                               =
 |
   0 ++--------------------*-----------------------------------------------=
-+


                                 time.system_time

  800 ++-------------------------------------------------------------------=
-+
      *...*..*...*...*..*       *..*...*...*...*..*...*...*..*...*...*..*..=
.*
  700 ++                :       :                                          =
 |
  600 ++                 :     :                                           =
 |
      |                  :     :                                           =
 |
  500 O+  O  O   O   O  O:  O  :O  O   O   O   O  O   O   O  O   O   O  O  =
 |
      |                   :   :                                            =
 |
  400 ++                  :   :                                            =
 |
      |                   :   :                                            =
 |
  300 ++                  :   :                                            =
 |
  200 ++                   : :                                             =
 |
      |                    : :                                             =
 |
  100 ++                   : :                                             =
 |
      |                     :                                              =
 |
    0 ++--------------------*----------------------------------------------=
-+


                                time.minor_page_faults

  1.4e+08 ++-*----------*---------*------*-------------*---*-------------*-=
-+
          *.     *..*.     *      :   *.     *..*...*.        *...*..*.    =
 *
  1.2e+08 ++               :      :                                        =
 |
          |                 :    :                                         =
 |
    1e+08 O+ O   O  O   O  O:  O :O   O  O   O  O   O  O   O  O   O  O   O =
 |
          |                 :    :                                         =
 |
    8e+07 ++                 :   :                                         =
 |
          |                  :   :                                         =
 |
    6e+07 ++                 :  :                                          =
 |
          |                  :  :                                          =
 |
    4e+07 ++                  : :                                          =
 |
          |                   : :                                          =
 |
    2e+07 ++                  ::                                           =
 |
          |                    :                                           =
 |
        0 ++-------------------*-------------------------------------------=
-+


                            time.voluntary_context_switches

  1.2e+07 ++-*------------------------*--*---------------------------------=
-*
          *.     *..*...*..*      *.         *..*...*..*...*..*...*..*...*.=
 |
    1e+07 ++               :      :                                        =
 |
          |                 :     :                                        =
 |
          O  O   O  O   O  O:  O :O   O  O   O  O   O  O   O  O   O      O =
 |
    8e+06 ++                :    :                                   O     =
 |
          |                  :   :                                         =
 |
    6e+06 ++                 :   :                                         =
 |
          |                  :  :                                          =
 |
    4e+06 ++                 :  :                                          =
 |
          |                   : :                                          =
 |
          |                   : :                                          =
 |
    2e+06 ++                  ::                                           =
 |
          |                    :                                           =
 |
        0 ++-------------------*-------------------------------------------=
-+


                                 proc-vmstat.numa_hit

  1.6e+08 ++---------------------------------------------------------------=
-+
          | .*...     ..*..*      *...*..*...*..*...*..  ..*..*...*..*...*.=
.*
  1.4e+08 *+     *..*.     :      :                    *.                  =
 |
  1.2e+08 ++                :     :                                        =
 |
          |                 :    :                                         =
 |
    1e+08 O+ O   O  O   O  O:  O :O   O  O   O  O   O  O   O  O   O  O   O =
 |
          |                  :   :                                         =
 |
    8e+07 ++                 :   :                                         =
 |
          |                  :  :                                          =
 |
    6e+07 ++                 :  :                                          =
 |
    4e+07 ++                  : :                                          =
 |
          |                   : :                                          =
 |
    2e+07 ++                  ::                                           =
 |
          |                    :                                           =
 |
        0 ++-------------------*-------------------------------------------=
-+


                                proc-vmstat.numa_local

  1.6e+08 ++---------------------------------------------------------------=
-+
          | .*...     ..*..*      *...*..*...*..*...*..  ..*..*...*..*...*.=
.*
  1.4e+08 *+     *..*.     :      :                    *.                  =
 |
  1.2e+08 ++                :     :                                        =
 |
          |                 :    :                                         =
 |
    1e+08 O+ O   O  O   O  O:  O :O   O  O   O  O   O  O   O  O   O  O   O =
 |
          |                  :   :                                         =
 |
    8e+07 ++                 :   :                                         =
 |
          |                  :  :                                          =
 |
    6e+07 ++                 :  :                                          =
 |
    4e+07 ++                  : :                                          =
 |
          |                   : :                                          =
 |
    2e+07 ++                  ::                                           =
 |
          |                    :                                           =
 |
        0 ++-------------------*-------------------------------------------=
-+


                              proc-vmstat.pgalloc_dma32

  9e+07 ++-----------------------------------------------------------------=
-+
        *...*..*...*..*...*      *...*..*...*..*...*...*..*...*..*...*..*..=
.*
  8e+07 ++                :      :                                         =
 |
  7e+07 ++                :     :                                          =
 |
        O      O           :    :O                                         =
 |
  6e+07 ++  O      O  O   O: O  :    O  O   O  O   O   O  O   O  O   O  O  =
 |
  5e+07 ++                 :   :                                           =
 |
        |                  :   :                                           =
 |
  4e+07 ++                  :  :                                           =
 |
  3e+07 ++                  :  :                                           =
 |
        |                   : :                                            =
 |
  2e+07 ++                  : :                                            =
 |
  1e+07 ++                   ::                                            =
 |
        |                    :                                             =
 |
      0 ++-------------------*---------------------------------------------=
-+


                             proc-vmstat.pgalloc_normal

  9e+07 ++-----------------------------------------------------------------=
-+
        *...*..  ..*..*...*      *...*..*...*..*...*...*..*...*..*...*..*..=
.*
  8e+07 ++     *.         :      :                                         =
 |
  7e+07 ++                :     :                                          =
 |
        |                  :    :                                          =
 |
  6e+07 O+  O  O   O  O   O: O  :O   O  O   O  O   O   O  O   O  O   O  O  =
 |
  5e+07 ++                 :   :                                           =
 |
        |                  :   :                                           =
 |
  4e+07 ++                  :  :                                           =
 |
  3e+07 ++                  :  :                                           =
 |
        |                   : :                                            =
 |
  2e+07 ++                  : :                                            =
 |
  1e+07 ++                   ::                                            =
 |
        |                    :                                             =
 |
      0 ++-------------------*---------------------------------------------=
-+


                                  proc-vmstat.pgfree

  1.8e+08 ++---------------------------------------------------------------=
-+
          *..*...*..*...*..*      *...*..*...*..*...*..*...*..*...*..*...*.=
.*
  1.6e+08 ++               :      :                                        =
 |
  1.4e+08 ++                :     :                                        =
 |
          |                 :    :                                         =
 |
  1.2e+08 O+ O   O  O   O  O:  O :O   O  O   O  O   O  O   O  O   O  O   O =
 |
    1e+08 ++                 :   :                                         =
 |
          |                  :   :                                         =
 |
    8e+07 ++                 :  :                                          =
 |
    6e+07 ++                 :  :                                          =
 |
          |                   : :                                          =
 |
    4e+07 ++                  : :                                          =
 |
    2e+07 ++                  ::                                           =
 |
          |                    :                                           =
 |
        0 ++-------------------*-------------------------------------------=
-+


                                  proc-vmstat.pgfault

  1.4e+08 ++-*---------------------------*-----------------*---------*-----=
-+
          *.     *..*...*..*      *...*.     *..*...*..*.     *...*.     *.=
.*
  1.2e+08 ++               :      :                                        =
 |
          |                 :     :                                        =
 |
    1e+08 O+ O   O  O   O  O:  O :O   O  O   O  O   O  O   O  O   O  O   O =
 |
          |                 :    :                                         =
 |
    8e+07 ++                 :   :                                         =
 |
          |                  :   :                                         =
 |
    6e+07 ++                 :  :                                          =
 |
          |                  :  :                                          =
 |
    4e+07 ++                  : :                                          =
 |
          |                   : :                                          =
 |
    2e+07 ++                  ::                                           =
 |
          |                    :                                           =
 |
        0 ++-------------------*-------------------------------------------=
-+


                            slabinfo.anon_vma.num_objs

  4500 ++------------------------------------------------------------------=
-+
       O      O                                                            =
 |
  4000 ++  O      O   O  O   O  O   O   O  O   O   O  O   O  O   O   O  O  =
 |
  3500 ++                                                                  =
 |
       *...                                   .*...  .*..    *...          =
 |
  3000 ++  *..*...*...*..*      *...*...    ..     *.    . ..    *...*..*..=
.*
  2500 ++                :      :       *..*              *                =
 |
       |                  :    :                                           =
 |
  2000 ++                 :    :                                           =
 |
  1500 ++                  :   :                                           =
 |
       |                   :  :                                            =
 |
  1000 ++                   : :                                            =
 |
   500 ++                   : :                                            =
 |
       |                     :                                             =
 |
     0 ++--------------------*---------------------------------------------=
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

--===============3663311351499539148==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogdW5peGJlbmNoCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9u
aXRvcgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVt
YXN0YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAK
ICBwcm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAg
aW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczog
CiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6
IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1
ZzoKICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiAKZGVmYXVsdC13YXRjaGRvZ3M6
CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IDAxODE1NTM2NWRjY2VjZDllYTlm
MjZlMWIyNmZiMGY5NjBjMWVlMzIKbW9kZWw6IE5laGFsZW0KbWVtb3J5OiA2RwpoZGRfcGFydGl0
aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtSGl0YWNoaV9IRFQ3MjEwNTBTTEEzNjBfU1RIM0Q3
TUUwWUVNNVktcGFydDUKICAvZGV2L2Rpc2svYnktaWQvYXRhLUhpdGFjaGlfSERUNzIxMDUwU0xB
MzYwX1NUSDNEN01FMFlFTTVZLXBhcnQ2IC9kZXYvZGlzay9ieS1pZC9hdGEtSGl0YWNoaV9IRFQ3
MjEwNTBTTEEzNjBfU1RIM0Q3TUUwWUVNNVktcGFydDcKICAvZGV2L2Rpc2svYnktaWQvYXRhLUhp
dGFjaGlfSERUNzIxMDUwU0xBMzYwX1NUSDNEN01FMFlFTTVZLXBhcnQ4Igpzd2FwX3BhcnRpdGlv
bnM6IApyb290ZnNfcGFydGl0aW9uOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1IaXRhY2hpX0hEVDcy
MTA1MFNMQTM2MF9TVEgzRDdNRTBZRU01WS1wYXJ0MiIKbmV0Y29uc29sZV9wb3J0OiA2NjQ3CmNh
dGVnb3J5OiBiZW5jaG1hcmsKdW5peGJlbmNoOgogIHRlc3Q6IHNwYXduCnF1ZXVlOiBjeWNsaWMK
dGVzdGJveDogbmhtLXdoaXRlCnRib3hfZ3JvdXA6IG5obS13aGl0ZQprY29uZmlnOiB4ODZfNjQt
cmhlbAplbnF1ZXVlX3RpbWU6IDIwMTUtMTAtMjQgMDk6NDg6MjcuNDM2Mzk1MTM3ICswODowMApp
ZDogYWRjZTJlMjcyMzQ2N2Y5YThiMmQyYTUzOTg3ZTJlYjdlY2JkMzM2Mgp1c2VyOiB3ZmcKY29t
cGlsZXI6IGdjYy00LjkKaGVhZF9jb21taXQ6IDAxODE1NTM2NWRjY2VjZDllYTlmMjZlMWIyNmZi
MGY5NjBjMWVlMzIKYmFzZV9jb21taXQ6IDllMDdmOThhYjc2ZmRlYWI1NjI5ZjJmNmM5NzdmODcw
YTQxNGYxZjkKYnJhbmNoOiBsaW51cy9tYXN0ZXIKa2VybmVsOiAiL3BrZy9saW51eC94ODZfNjQt
cmhlbC9nY2MtNC45LzAxODE1NTM2NWRjY2VjZDllYTlmMjZlMWIyNmZiMGY5NjBjMWVlMzIvdm1s
aW51ei00LjMuMC1yYzYtMDAyNzctZzAxODE1NTM2Igpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAx
NS0wMi0wNy5jZ3oKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L3VuaXhiZW5jaC9zcGF3bi9uaG0td2hp
dGUvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzAxODE1
NTM2NWRjY2VjZDllYTlmMjZlMWIyNmZiMGY5NjBjMWVlMzIvMCIKam9iX2ZpbGU6ICIvbGtwL3Nj
aGVkdWxlZC9uaG0td2hpdGUvY3ljbGljX3VuaXhiZW5jaC1zcGF3bi14ODZfNjQtcmhlbC1DWUNM
SUNfSEVBRC0wMTgxNTUzNjVkY2NlY2Q5ZWE5ZjI2ZTFiMjZmYjBmOTYwYzFlZTMyLTIwMTUxMDI0
LTYyMTk0LWZ2OXB6LTAueWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE1LTEwLTI0IDExOjQ2OjUyLjgw
NDYwMTcyNyArMDg6MDAKbnJfY3B1OiAiJChucHJvYykiCm1heF91cHRpbWU6IDE5MzcuNzYKaW5p
dHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rs
b2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj13ZmcKLSBqb2I9L2xrcC9zY2hl
ZHVsZWQvbmhtLXdoaXRlL2N5Y2xpY191bml4YmVuY2gtc3Bhd24teDg2XzY0LXJoZWwtQ1lDTElD
X0hFQUQtMDE4MTU1MzY1ZGNjZWNkOWVhOWYyNmUxYjI2ZmIwZjk2MGMxZWUzMi0yMDE1MTAyNC02
MjE5NC1mdjlwei0wLnlhbWwKLSBBUkNIPXg4Nl82NAotIGtjb25maWc9eDg2XzY0LXJoZWwKLSBi
cmFuY2g9bGludXMvbWFzdGVyCi0gY29tbWl0PTAxODE1NTM2NWRjY2VjZDllYTlmMjZlMWIyNmZi
MGY5NjBjMWVlMzIKLSBCT09UX0lNQUdFPS9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS8w
MTgxNTUzNjVkY2NlY2Q5ZWE5ZjI2ZTFiMjZmYjBmOTYwYzFlZTMyL3ZtbGludXotNC4zLjAtcmM2
LTAwMjc3LWcwMTgxNTUzNgotIG1heF91cHRpbWU9MTkzNwotIFJFU1VMVF9ST09UPS9yZXN1bHQv
dW5peGJlbmNoL3NwYXduL25obS13aGl0ZS9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4
Nl82NC1yaGVsL2djYy00LjkvMDE4MTU1MzY1ZGNjZWNkOWVhOWYyNmUxYjI2ZmIwZjk2MGMxZWUz
Mi8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMCBz
eXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFi
bGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5pYz0tMSBzb2Z0bG9j
a3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIg
cHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9
bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL3dmZy9sa3AteDg2XzY0LmNneiIKbW9kdWxl
c19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvMDE4MTU1MzY1ZGNjZWNk
OWVhOWYyNmUxYjI2ZmIwZjk2MGMxZWUzMi9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAiL29zaW1h
Z2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3osL29zaW1hZ2UvZGVw
cy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNvbmZpZy5jZ3osL29zaW1hZ2Uv
ZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5j
aG1hcmtzL3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3VuaXhiZW5jaC5jZ3oiCmpvYl9z
dGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogNS41NSAyLjE2IDAuNzkgMS8xNjggMTgxOTMKc3RhcnRf
dGltZTogJzE0NDU2NTg0MzQnCmVuZF90aW1lOiAnMTQ0NTY1ODYzMicKdmVyc2lvbjogIi9sa3Av
d2ZnLy5zcmMtMjAxNTEwMjItMTQxOTA3Igo=

--===============3663311351499539148==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

Li9SdW4gc3Bhd24K

--===============3663311351499539148==--

