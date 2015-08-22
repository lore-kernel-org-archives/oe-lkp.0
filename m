Content-Type: multipart/mixed; boundary="===============8756681080956190394=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [fsnotify] 8f2f3eb59d: -4.0% will-it-scale.per_thread_ops
Date: Sun, 23 Aug 2015 07:33:16 +0800
Message-ID: <87k2smkif7.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8756681080956190394==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 8f2f3eb59dff4ec538de55f2e0592fec85966aab ("fsnotify: fix oops in fsn=
otify_clear_marks_by_group_flags()")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  lkp-sbx04/will-it-scale/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/=
performance/read1

commit: =

  447f6a95a9c80da7faaec3e66e656eab8f262640
  8f2f3eb59dff4ec538de55f2e0592fec85966aab

447f6a95a9c80da7 8f2f3eb59dff4ec538de55f2e0 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   1844687 =C2=B1  0%      -4.0%    1770899 =C2=B1  0%  will-it-scale.per_t=
hread_ops
    283.69 =C2=B1  0%      +9.5%     310.64 =C2=B1  0%  will-it-scale.time.=
user_time
      4576 =C2=B1  3%      -7.3%       4242 =C2=B1  6%  will-it-scale.time.=
voluntary_context_switches
      7211 =C2=B1 10%     +54.0%      11101 =C2=B1 18%  cpuidle.C1E-SNB.usa=
ge
     10636 =C2=B1 36%     +69.3%      18003 =C2=B1 36%  numa-meminfo.node1.=
Shmem
      1.07 =C2=B1  4%     -13.1%       0.93 =C2=B1  9%  perf-profile.cpu-cy=
cles.selinux_file_permission.security_file_permission.rw_verify_area.vfs_re=
ad.sys_read
      4576 =C2=B1  3%      -7.3%       4242 =C2=B1  6%  time.voluntary_cont=
ext_switches
    526.75 =C2=B1104%     -94.2%      30.50 =C2=B1 98%  numa-numastat.node1=
.other_node
      1540 =C2=B1 35%     -74.2%     398.00 =C2=B1 90%  numa-numastat.node2=
.other_node
     32344 =C2=B1  5%      +7.4%      34722 =C2=B1  4%  numa-vmstat.node0.n=
uma_other
      2658 =C2=B1 36%     +69.3%       4500 =C2=B1 36%  numa-vmstat.node1.n=
r_shmem
    935792 =C2=B1136%   +4247.3%   40682138 =C2=B1141%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
    935792 =C2=B1136%   +4247.3%   40682138 =C2=B1141%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
    935792 =C2=B1136%   +4247.3%   40682138 =C2=B1141%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
     12893 =C2=B1  2%      -9.1%      11716 =C2=B1  1%  slabinfo.kmalloc-19=
2.active_objs
      1653 =C2=B1  9%     -10.3%       1483 =C2=B1  5%  slabinfo.mnt_cache.=
active_objs
      1653 =C2=B1  9%     -10.3%       1483 =C2=B1  5%  slabinfo.mnt_cache.=
num_objs
      1.75 =C2=B1 47%     -81.0%       0.33 =C2=B1141%  sched_debug.cfs_rq[=
10]:/.nr_spread_over
   -343206 =C2=B1-27%     -73.2%     -91995 =C2=B1-170%  sched_debug.cfs_rq=
[14]:/.spread0
    533.25 =C2=B1 82%     -81.5%      98.75 =C2=B1 42%  sched_debug.cfs_rq[=
18]:/.blocked_load_avg
    541.75 =C2=B1 82%     -81.3%     101.25 =C2=B1 41%  sched_debug.cfs_rq[=
18]:/.tg_load_contrib
  -1217705 =C2=B1 -5%     -30.2%    -850080 =C2=B1-15%  sched_debug.cfs_rq[=
26]:/.spread0
     89722 =C2=B1  9%      +9.8%      98495 =C2=B1 10%  sched_debug.cfs_rq[=
32]:/.exec_clock
    101180 =C2=B1132%    +180.8%     284154 =C2=B1 30%  sched_debug.cfs_rq[=
35]:/.spread0
     37332 =C2=B1473%    +725.2%     308082 =C2=B1 59%  sched_debug.cfs_rq[=
38]:/.spread0
     32054 =C2=B1502%    +981.6%     346689 =C2=B1 39%  sched_debug.cfs_rq[=
39]:/.spread0
      1.00 =C2=B1100%    +100.0%       2.00 =C2=B1 50%  sched_debug.cfs_rq[=
42]:/.nr_spread_over
   -125980 =C2=B1-218%    -307.1%     260875 =C2=B1 46%  sched_debug.cfs_rq=
[42]:/.spread0
   -111501 =C2=B1-102%    -288.7%     210354 =C2=B1 94%  sched_debug.cfs_rq=
[45]:/.spread0
   -173363 =C2=B1-34%    -221.0%     209775 =C2=B1 94%  sched_debug.cfs_rq[=
47]:/.spread0
   -302090 =C2=B1-43%    -121.8%      65953 =C2=B1322%  sched_debug.cfs_rq[=
4]:/.spread0
   -490175 =C2=B1-18%     -41.1%    -288722 =C2=B1-31%  sched_debug.cfs_rq[=
50]:/.spread0
   -594948 =C2=B1-10%     -59.7%    -239840 =C2=B1-33%  sched_debug.cfs_rq[=
51]:/.spread0
      1.00 =C2=B1100%   +6050.0%      61.50 =C2=B1141%  sched_debug.cfs_rq[=
53]:/.blocked_load_avg
     10.50 =C2=B1  8%    +614.3%      75.00 =C2=B1122%  sched_debug.cfs_rq[=
53]:/.tg_load_contrib
   -596043 =C2=B1-10%     -49.0%    -304277 =C2=B1-36%  sched_debug.cfs_rq[=
54]:/.spread0
     10.00 =C2=B1  0%   +2062.5%     216.25 =C2=B1 40%  sched_debug.cfs_rq[=
56]:/.tg_load_contrib
     17.75 =C2=B1173%   +1302.8%     249.00 =C2=B1 26%  sched_debug.cfs_rq[=
60]:/.blocked_load_avg
   -809633 =C2=B1 -9%     -36.2%    -516886 =C2=B1-23%  sched_debug.cfs_rq[=
60]:/.spread0
     28.00 =C2=B1109%    +828.6%     260.00 =C2=B1 25%  sched_debug.cfs_rq[=
60]:/.tg_load_contrib
    277.75 =C2=B1 95%     -86.3%      38.00 =C2=B1171%  sched_debug.cfs_rq[=
7]:/.blocked_load_avg
    293.25 =C2=B1 90%     -81.8%      53.50 =C2=B1121%  sched_debug.cfs_rq[=
7]:/.tg_load_contrib
     17.50 =C2=B1  2%     -28.6%      12.50 =C2=B1 34%  sched_debug.cpu#0.c=
pu_load[2]
     17.00 =C2=B1  4%     -25.0%      12.75 =C2=B1 35%  sched_debug.cpu#0.c=
pu_load[3]
      2907 =C2=B1 12%    +195.9%       8603 =C2=B1 63%  sched_debug.cpu#0.s=
ched_goidle
     16.50 =C2=B1  3%      -9.1%      15.00 =C2=B1  0%  sched_debug.cpu#1.c=
pu_load[2]
     16.50 =C2=B1  3%      -7.6%      15.25 =C2=B1  2%  sched_debug.cpu#1.c=
pu_load[3]
      5595 =C2=B1 26%     -36.4%       3557 =C2=B1 11%  sched_debug.cpu#11.=
nr_switches
      6885 =C2=B1 92%     -76.2%       1639 =C2=B1 40%  sched_debug.cpu#11.=
ttwu_count
      1350 =C2=B1 34%     -55.0%     608.00 =C2=B1 14%  sched_debug.cpu#11.=
ttwu_local
     17892 =C2=B1 74%     -78.3%       3877 =C2=B1 18%  sched_debug.cpu#12.=
nr_switches
      1288 =C2=B1 27%     -49.8%     647.50 =C2=B1 37%  sched_debug.cpu#12.=
ttwu_local
      1405 =C2=B1 22%     -52.7%     664.50 =C2=B1 23%  sched_debug.cpu#13.=
ttwu_local
      1.25 =C2=B1182%    -440.0%      -4.25 =C2=B1-50%  sched_debug.cpu#17.=
nr_uninterruptible
      1976 =C2=B1  5%     -10.0%       1779 =C2=B1  0%  sched_debug.cpu#18.=
curr->pid
    983.75 =C2=B1  8%    +101.6%       1983 =C2=B1 32%  sched_debug.cpu#18.=
ttwu_local
     -0.25 =C2=B1-911%   +2300.0%      -6.00 =C2=B1-28%  sched_debug.cpu#21=
.nr_uninterruptible
      2979 =C2=B1 49%    +159.6%       7734 =C2=B1 75%  sched_debug.cpu#22.=
ttwu_count
      1111 =C2=B1 21%    +127.6%       2528 =C2=B1 32%  sched_debug.cpu#22.=
ttwu_local
      1.00 =C2=B1141%    -275.0%      -1.75 =C2=B1-84%  sched_debug.cpu#25.=
nr_uninterruptible
     14419 =C2=B1 54%     -58.2%       6022 =C2=B1 84%  sched_debug.cpu#25.=
ttwu_count
     14395 =C2=B1 70%    +252.4%      50729 =C2=B1 39%  sched_debug.cpu#28.=
nr_switches
     -4.75 =C2=B1-17%    -115.8%       0.75 =C2=B1218%  sched_debug.cpu#30.=
nr_uninterruptible
      2335 =C2=B1115%     -76.6%     547.25 =C2=B1 18%  sched_debug.cpu#34.=
ttwu_count
      1258 =C2=B1 25%     -43.3%     713.75 =C2=B1 11%  sched_debug.cpu#35.=
nr_switches
      1409 =C2=B1 23%     -39.6%     851.75 =C2=B1  9%  sched_debug.cpu#35.=
sched_count
    969.50 =C2=B1 69%     -68.8%     302.00 =C2=B1 38%  sched_debug.cpu#35.=
ttwu_count
    382.00 =C2=B1 37%     -66.0%     130.00 =C2=B1 14%  sched_debug.cpu#35.=
ttwu_local
    808.75 =C2=B1 18%     +28.3%       1037 =C2=B1 15%  sched_debug.cpu#38.=
nr_switches
    948.50 =C2=B1 16%     +23.2%       1168 =C2=B1 13%  sched_debug.cpu#38.=
sched_count
     70695 =C2=B1  2%      +6.2%      75047 =C2=B1  4%  sched_debug.cpu#41.=
nr_load_updates
      1269 =C2=B1 13%     +55.3%       1970 =C2=B1 25%  sched_debug.cpu#46.=
nr_switches
      3.25 =C2=B1 93%     -76.9%       0.75 =C2=B1197%  sched_debug.cpu#46.=
nr_uninterruptible
      1375 =C2=B1 12%     +51.1%       2078 =C2=B1 23%  sched_debug.cpu#46.=
sched_count
      3958 =C2=B1 97%    +462.9%      22281 =C2=B1 25%  sched_debug.cpu#50.=
ttwu_count
    457.25 =C2=B1 26%     +64.3%     751.25 =C2=B1 28%  sched_debug.cpu#53.=
ttwu_local
    753041 =C2=B1  3%     -11.1%     669815 =C2=B1  5%  sched_debug.cpu#58.=
avg_idle
     -1.75 =C2=B1-142%    -257.1%       2.75 =C2=B1 64%  sched_debug.cpu#59=
.nr_uninterruptible
      2581 =C2=B1 27%   +1426.4%      39408 =C2=B1 57%  sched_debug.cpu#60.=
nr_switches
      2632 =C2=B1 27%   +1400.2%      39495 =C2=B1 57%  sched_debug.cpu#60.=
sched_count
     34156 =C2=B1 94%     -94.8%       1776 =C2=B1 15%  sched_debug.cpu#61.=
nr_switches
     34250 =C2=B1 94%     -94.7%       1825 =C2=B1 15%  sched_debug.cpu#61.=
sched_count
     16821 =C2=B1 96%     -95.4%     768.50 =C2=B1 11%  sched_debug.cpu#61.=
sched_goidle
      8128 =C2=B1146%     -91.7%     676.00 =C2=B1 10%  sched_debug.cpu#61.=
ttwu_count

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  ivb42/will-it-scale/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/perf=
ormance/readseek1

commit: =

  447f6a95a9c80da7faaec3e66e656eab8f262640
  8f2f3eb59dff4ec538de55f2e0592fec85966aab

447f6a95a9c80da7 8f2f3eb59dff4ec538de55f2e0 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   1915464 =C2=B1  0%      -2.4%    1869344 =C2=B1  0%  will-it-scale.per_t=
hread_ops
    473.17 =C2=B1  0%      +6.9%     505.66 =C2=B1  0%  will-it-scale.time.=
user_time
      0.20 =C2=B1  5%     -49.4%       0.10 =C2=B1 35%  turbostat.Pkg%pc6
      3.38 =C2=B1  0%     +34.0%       4.53 =C2=B1  1%  perf-profile.cpu-cy=
cles.find_get_entry.find_lock_entry.shmem_getpage_gfp.shmem_file_read_iter.=
__vfs_read
      7.42 =C2=B1  0%     +16.3%       8.62 =C2=B1  1%  perf-profile.cpu-cy=
cles.find_lock_entry.shmem_getpage_gfp.shmem_file_read_iter.__vfs_read.vfs_=
read
      0.57 =C2=B1  6%     +72.2%       0.99 =C2=B1  6%  perf-profile.cpu-cy=
cles.radix_tree_lookup_slot.find_get_entry.find_lock_entry.shmem_getpage_gf=
p.shmem_file_read_iter
     10.58 =C2=B1  0%     +11.4%      11.79 =C2=B1  1%  perf-profile.cpu-cy=
cles.shmem_getpage_gfp.shmem_file_read_iter.__vfs_read.vfs_read.sys_read
     30.50 =C2=B1150%   +1140.2%     378.25 =C2=B1 49%  sched_debug.cfs_rq[=
22]:/.blocked_load_avg
     44.75 =C2=B1103%    +788.3%     397.50 =C2=B1 46%  sched_debug.cfs_rq[=
22]:/.tg_load_contrib
     89.50 =C2=B1159%    +300.3%     358.25 =C2=B1 75%  sched_debug.cfs_rq[=
2]:/.blocked_load_avg
    115.75 =C2=B1123%    +231.7%     384.00 =C2=B1 70%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
      0.50 =C2=B1100%    +750.0%       4.25 =C2=B1 67%  sched_debug.cfs_rq[=
32]:/.nr_spread_over
    499.50 =C2=B1 44%     -98.2%       9.00 =C2=B1101%  sched_debug.cfs_rq[=
40]:/.blocked_load_avg
    505.50 =C2=B1 44%     -95.2%      24.50 =C2=B1 73%  sched_debug.cfs_rq[=
40]:/.tg_load_contrib
    421.00 =C2=B1 56%     -85.7%      60.25 =C2=B1109%  sched_debug.cfs_rq[=
42]:/.blocked_load_avg
    428.75 =C2=B1 56%     -80.4%      84.00 =C2=B1 86%  sched_debug.cfs_rq[=
42]:/.tg_load_contrib
      8053 =C2=B1  2%     +13.4%       9132 =C2=B1  5%  sched_debug.cfs_rq[=
47]:/.avg->runnable_avg_sum
    175.25 =C2=B1  2%     +12.7%     197.50 =C2=B1  5%  sched_debug.cfs_rq[=
47]:/.tg_runnable_contrib
      0.25 =C2=B1173%   +1500.0%       4.00 =C2=B1 77%  sched_debug.cfs_rq[=
8]:/.nr_spread_over
     90.75 =C2=B1 13%     -23.1%      69.75 =C2=B1 15%  sched_debug.cpu#0.c=
pu_load[2]
     97.00 =C2=B1 15%     -28.4%      69.50 =C2=B1 16%  sched_debug.cpu#0.c=
pu_load[3]
     99.50 =C2=B1 14%     -27.6%      72.00 =C2=B1 18%  sched_debug.cpu#0.c=
pu_load[4]
    -10.25 =C2=B1-14%     -73.2%      -2.75 =C2=B1-180%  sched_debug.cpu#1.=
nr_uninterruptible
      8173 =C2=B1106%     -78.9%       1722 =C2=B1 35%  sched_debug.cpu#10.=
nr_switches
      3896 =C2=B1112%     -81.3%     727.50 =C2=B1 36%  sched_debug.cpu#10.=
sched_goidle
    515.00 =C2=B1 40%     -47.2%     271.75 =C2=B1 49%  sched_debug.cpu#10.=
ttwu_local
      2.00 =C2=B1 81%    -325.0%      -4.50 =C2=B1-77%  sched_debug.cpu#11.=
nr_uninterruptible
      3818 =C2=B1 39%     -58.2%       1598 =C2=B1 68%  sched_debug.cpu#15.=
ttwu_local
      0.50 =C2=B1331%    -650.0%      -2.75 =C2=B1-74%  sched_debug.cpu#16.=
nr_uninterruptible
     12671 =C2=B1 30%     -58.4%       5270 =C2=B1 46%  sched_debug.cpu#20.=
ttwu_count
      2285 =C2=B1 70%     -57.0%     983.50 =C2=B1 25%  sched_debug.cpu#20.=
ttwu_local
      2722 =C2=B1 79%     -72.9%     738.75 =C2=B1 51%  sched_debug.cpu#21.=
ttwu_local
     -2.50 =C2=B1-72%    -200.0%       2.50 =C2=B1 82%  sched_debug.cpu#23.=
nr_uninterruptible
      1183 =C2=B1 31%    +188.4%       3413 =C2=B1 22%  sched_debug.cpu#24.=
nr_switches
      1384 =C2=B1 45%    +148.4%       3438 =C2=B1 22%  sched_debug.cpu#24.=
sched_count
    318.50 =C2=B1 54%    +347.5%       1425 =C2=B1 21%  sched_debug.cpu#24.=
ttwu_local
      5255 =C2=B1 46%     -60.2%       2090 =C2=B1 54%  sched_debug.cpu#25.=
nr_switches
      5276 =C2=B1 46%     -59.9%       2114 =C2=B1 54%  sched_debug.cpu#25.=
sched_count
      1893 =C2=B1 42%     -66.9%     627.00 =C2=B1 75%  sched_debug.cpu#25.=
ttwu_local
      1.25 =C2=B1142%    +240.0%       4.25 =C2=B1 45%  sched_debug.cpu#27.=
nr_uninterruptible
      0.75 =C2=B1272%    -322.2%      -1.67 =C2=B1-28%  sched_debug.cpu#31.=
nr_uninterruptible
      1977 =C2=B1140%     -86.5%     267.25 =C2=B1 10%  sched_debug.cpu#32.=
sched_goidle
      7.67 =C2=B1 78%    -122.8%      -1.75 =C2=B1-84%  sched_debug.cpu#34.=
nr_uninterruptible
      3642 =C2=B1 37%    +205.0%      11108 =C2=B1 53%  sched_debug.cpu#39.=
nr_switches
      1250 =C2=B1 51%    +292.0%       4902 =C2=B1 52%  sched_debug.cpu#39.=
sched_goidle
      3.00 =C2=B1  0%    +216.7%       9.50 =C2=B1 30%  sched_debug.cpu#45.=
cpu_load[0]
      3.50 =C2=B1 24%    +121.4%       7.75 =C2=B1 10%  sched_debug.cpu#45.=
cpu_load[1]
      3.25 =C2=B1 13%    +123.1%       7.25 =C2=B1 11%  sched_debug.cpu#45.=
cpu_load[2]
      3.25 =C2=B1 13%     +92.3%       6.25 =C2=B1 23%  sched_debug.cpu#45.=
cpu_load[3]
      3.00 =C2=B1  0%     +91.7%       5.75 =C2=B1 22%  sched_debug.cpu#45.=
cpu_load[4]
      1593 =C2=B1 19%     +63.6%       2605 =C2=B1 30%  sched_debug.cpu#47.=
curr->pid
    365.75 =C2=B1 39%    +254.6%       1297 =C2=B1 98%  sched_debug.cpu#6.t=
twu_local
      8717 =C2=B1 80%     -78.7%       1856 =C2=B1 45%  sched_debug.cpu#8.n=
r_switches
      3992 =C2=B1 85%     -80.5%     778.50 =C2=B1 51%  sched_debug.cpu#8.s=
ched_goidle
      6221 =C2=B1128%     -83.9%     998.75 =C2=B1 44%  sched_debug.cpu#8.t=
twu_count
    722.00 =C2=B1 71%     -69.5%     220.25 =C2=B1  5%  sched_debug.cpu#8.t=
twu_local
      0.25 =C2=B1173%    +321.4%       1.05 =C2=B1  5%  sched_debug.rt_rq[1=
2]:/.rt_time
      0.04 =C2=B1173%    +311.0%       0.17 =C2=B1  8%  sched_debug.rt_rq[1=
3]:/.rt_time


lkp-sbx04: Sandy Bridge-EX
Memory: 64G

ivb42: Ivytown Ivy Bridge-EP
Memory: 64G




                           will-it-scale.time.user_time

  325 ++-------------------------------------------------------------------=
-+
  320 ++      O       O          O                                         =
 |
      |   O              O   O       O   O   O   O   O                     =
 |
  315 O+          O                                             O          =
 |
  310 ++                                                 O  O           O  =
 O
      |                                                             O      =
 |
  305 ++                                                                   =
 |
  300 ++                                                                   =
 |
  295 ++                                                                   =
 |
      |                                      *..                           =
 |
  290 ++         .*..          ..*...*..   ..   .                          =
 |
  285 *+..*... ..    .  .*...*.         . .      *...*...*..*...*...  ..*..=
 |
      |       *       *.                 *                          *.     =
.|
  280 ++                                                                   =
 *
  275 ++-------------------------------------------------------------------=
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

--===============8756681080956190394==
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
ZGVidWc6CiAgICBpbnRlcnZhbDogNjAKY3B1ZnJlcV9nb3Zlcm5vcjogcGVyZm9ybWFuY2UKZGVm
YXVsdC13YXRjaGRvZ3M6CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IGRkMjM4
NGE3NWQxYzA0NmZhZjA2OGE2MzUyNzMyYTIwNDgxNGI4NmQKbW9kZWw6IFNhbmR5IEJyaWRnZS1F
WApucl9jcHU6IDY0Cm1lbW9yeTogNjRHCm5yX3NzZF9wYXJ0aXRpb25zOiA0CnNzZF9wYXJ0aXRp
b25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1JTlRFTF9TU0RTQzJDVzI0MEEzX0NWQ1YyMDQzMCot
cGFydDEiCnN3YXBfcGFydGl0aW9uczogCmNhdGVnb3J5OiBiZW5jaG1hcmsKcGVyZi1wcm9maWxl
OgogIGZyZXE6IDgwMAp3aWxsLWl0LXNjYWxlOgogIHRlc3Q6IHJlYWQxCnF1ZXVlOiBjeWNsaWMK
dGVzdGJveDogbGtwLXNieDA0CnRib3hfZ3JvdXA6IGxrcC1zYngwNAprY29uZmlnOiB4ODZfNjQt
cmhlbAplbnF1ZXVlX3RpbWU6IDIwMTUtMDgtMDggMDY6NTE6MDQuNDY3NjgyMzQ1ICswODowMApp
ZDogNzU0MzQ4NGYxZWVhODhjNjU0Mjk5MjIyZTgzYTg5ZmIzZjhmYmQ0NAp1c2VyOiBsa3AKY29t
cGlsZXI6IGdjYy00LjkKaGVhZF9jb21taXQ6IGRkMjM4NGE3NWQxYzA0NmZhZjA2OGE2MzUyNzMy
YTIwNDgxNGI4NmQKYmFzZV9jb21taXQ6IDczM2RiNTczYTY0NTE2ODFiNjBlNzM3MmQyODYyZGUw
OWQ2ZWIwNGUKYnJhbmNoOiBsaW51cy9tYXN0ZXIKa2VybmVsOiAiL3BrZy9saW51eC94ODZfNjQt
cmhlbC9nY2MtNC45L2RkMjM4NGE3NWQxYzA0NmZhZjA2OGE2MzUyNzMyYTIwNDgxNGI4NmQvdm1s
aW51ei00LjIuMC1yYzUtMDAxNTYtZ2RkMjM4NGEiCnJvb3RmczogZGViaWFuLXg4Nl82NC0yMDE1
LTAyLTA3LmNnegpyZXN1bHRfcm9vdDogIi9yZXN1bHQvd2lsbC1pdC1zY2FsZS9wZXJmb3JtYW5j
ZS1yZWFkMS9sa3Atc2J4MDQvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhl
bC9nY2MtNC45L2RkMjM4NGE3NWQxYzA0NmZhZjA2OGE2MzUyNzMyYTIwNDgxNGI4NmQvMCIKam9i
X2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9sa3Atc2J4MDQvY3ljbGljX3dpbGwtaXQtc2NhbGUtcGVy
Zm9ybWFuY2UtcmVhZDEteDg2XzY0LXJoZWwtQ1lDTElDX0hFQUQtZGQyMzg0YTc1ZDFjMDQ2ZmFm
MDY4YTYzNTI3MzJhMjA0ODE0Yjg2ZC0yMDE1MDgwOC05NzcxLTFtcGxvbGktMC55YW1sIgpkZXF1
ZXVlX3RpbWU6IDIwMTUtMDgtMDggMTg6MTg6MjIuOTM2MDAyNjQzICswODowMAptYXhfdXB0aW1l
OiAxNTAwCmluaXRyZDogIi9vc2ltYWdlL2RlYmlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcu
Y2d6Igpib290bG9hZGVyX2FwcGVuZDoKLSByb290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9i
PS9sa3Avc2NoZWR1bGVkL2xrcC1zYngwNC9jeWNsaWNfd2lsbC1pdC1zY2FsZS1wZXJmb3JtYW5j
ZS1yZWFkMS14ODZfNjQtcmhlbC1DWUNMSUNfSEVBRC1kZDIzODRhNzVkMWMwNDZmYWYwNjhhNjM1
MjczMmEyMDQ4MTRiODZkLTIwMTUwODA4LTk3NzEtMW1wbG9saS0wLnlhbWwKLSBBUkNIPXg4Nl82
NAotIGtjb25maWc9eDg2XzY0LXJoZWwKLSBicmFuY2g9bGludXMvbWFzdGVyCi0gY29tbWl0PWRk
MjM4NGE3NWQxYzA0NmZhZjA2OGE2MzUyNzMyYTIwNDgxNGI4NmQKLSBCT09UX0lNQUdFPS9wa2cv
bGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9kZDIzODRhNzVkMWMwNDZmYWYwNjhhNjM1MjczMmEy
MDQ4MTRiODZkL3ZtbGludXotNC4yLjAtcmM1LTAwMTU2LWdkZDIzODRhCi0gbWF4X3VwdGltZT0x
NTAwCi0gUkVTVUxUX1JPT1Q9L3Jlc3VsdC93aWxsLWl0LXNjYWxlL3BlcmZvcm1hbmNlLXJlYWQx
L2xrcC1zYngwNC9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00
LjkvZGQyMzg0YTc1ZDFjMDQ2ZmFmMDY4YTYzNTI3MzJhMjA0ODE0Yjg2ZC8wCi0gTEtQX1NFUlZF
Uj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZl
bD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJj
dV9jcHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1p
X3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9
MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3Cmxr
cF9pbml0cmQ6ICIvbGtwL2xrcC9sa3AteDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6ICIvcGtn
L2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvZGQyMzg0YTc1ZDFjMDQ2ZmFmMDY4YTYzNTI3MzJh
MjA0ODE0Yjg2ZC9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4t
eDg2XzY0LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNvbmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2
XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3R1cmJvc3Rh
dC5jZ3osL2xrcC9iZW5jaG1hcmtzL3dpbGwtaXQtc2NhbGUuY2d6Igpqb2Jfc3RhdGU6IGZpbmlz
aGVkCmxvYWRhdmc6IDQ3LjQ0IDIxLjQ1IDguMzcgMS82MjggMTEzOTMKc3RhcnRfdGltZTogJzE0
MzkwMjkxNTMnCmVuZF90aW1lOiAnMTQzOTAyOTQ2MicKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMt
MjAxNTA4MDctMTgzMTUyIgo=

--===============8756681080956190394==
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
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzMvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUzNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUz
Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NDAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQyL2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1NDMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHU0NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ1L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU0Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDkvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1MS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU4L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1NTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjAvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2
MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTYyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCi4vcnVu
dGVzdC5weSByZWFkMSAxNiBib3RoIDEgOCAxNiAyNCAzMiA0OCA2NAo=

--===============8756681080956190394==--

