Content-Type: multipart/mixed; boundary="===============0060347372782528385=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [sched/fair] 3e386d56ba: 7.1% unixbench.score, -2.9% will-it-scale.per_process_ops
Date: Mon, 02 Nov 2015 16:22:46 +0800
Message-ID: <87wpu095ex.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0060347372782528385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  ivb42/unixbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performa=
nce/execl

commit: =

  fde7d22e01aa0d252fc5c95fa11f0dac35a4dd59
  3e386d56bafbb6d2540b49367444997fc671ea69

fde7d22e01aa0d25 3e386d56bafbb6d2540b493674 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    706.60 =C2=B1  0%      +7.1%     756.42 =C2=B1  0%  unixbench.score
    271496 =C2=B1  0%      +6.2%     288421 =C2=B1  0%  unixbench.time.invo=
luntary_context_switches
  12630377 =C2=B1  0%      +7.0%   13516262 =C2=B1  0%  unixbench.time.mino=
r_page_faults
     11.78 =C2=B1  2%     +18.5%      13.96 =C2=B1  0%  time.user_time
 2.932e+08 =C2=B1 14%     -87.8%   35868049 =C2=B1  5%  cpuidle.C3-IVT.time
     12344 =C2=B1  3%     -57.7%       5226 =C2=B1  9%  cpuidle.C3-IVT.usage
   5132879 =C2=B1  1%     +16.5%    5979941 =C2=B1  7%  numa-numastat.node1=
.local_node
   5132891 =C2=B1  1%     +16.5%    5979952 =C2=B1  7%  numa-numastat.node1=
.numa_hit
     16780 =C2=B1  4%     -15.0%      14258 =C2=B1  4%  slabinfo.kmalloc-25=
6.active_objs
     17113 =C2=B1  4%     -14.8%      14586 =C2=B1  4%  slabinfo.kmalloc-25=
6.num_objs
      1.86 =C2=B1  0%      -1.9%       1.83 =C2=B1  0%  turbostat.%Busy
     10.10 =C2=B1 12%     -86.8%       1.33 =C2=B1  4%  turbostat.CPU%c3
     79.45 =C2=B1  1%     +11.5%      88.61 =C2=B1  0%  turbostat.CPU%c6
     60.59 =C2=B1  0%     -11.0%      53.93 =C2=B1  1%  turbostat.CorWatt
      5.65 =C2=B1  4%    +264.6%      20.61 =C2=B1  3%  turbostat.Pkg%pc2
      0.77 =C2=B1 58%     -73.9%       0.20 =C2=B1100%  turbostat.Pkg%pc3
     88.20 =C2=B1  0%      -7.8%      81.34 =C2=B1  1%  turbostat.PkgWatt
      5.09 =C2=B1  0%      -2.8%       4.95 =C2=B1  1%  turbostat.RAMWatt
     38088 =C2=B1  6%     -52.1%      18242 =C2=B1 34%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     24954 =C2=B1  8%     -60.3%       9916 =C2=B1 39%  sched_debug.cfs_rq[=
10]:/.min_vruntime
     30849 =C2=B1 25%     -52.0%      14817 =C2=B1 39%  sched_debug.cfs_rq[=
11]:/.min_vruntime
     37.00 =C2=B1 82%     -74.3%       9.50 =C2=B1 81%  sched_debug.cfs_rq[=
11]:/.util_avg
     30585 =C2=B1  8%     -62.9%      11360 =C2=B1 21%  sched_debug.cfs_rq[=
12]:/.min_vruntime
     29033 =C2=B1 18%     -64.0%      10445 =C2=B1 28%  sched_debug.cfs_rq[=
13]:/.min_vruntime
     32558 =C2=B1 10%     -68.1%      10380 =C2=B1 25%  sched_debug.cfs_rq[=
14]:/.min_vruntime
      1059 =C2=B1  6%     +83.6%       1945 =C2=B1 67%  sched_debug.cfs_rq[=
15]:/.exec_clock
     27378 =C2=B1 12%     -58.3%      11429 =C2=B1 36%  sched_debug.cfs_rq[=
15]:/.min_vruntime
     25520 =C2=B1 15%     -58.1%      10691 =C2=B1 47%  sched_debug.cfs_rq[=
16]:/.min_vruntime
     30656 =C2=B1 18%     -67.6%       9934 =C2=B1 30%  sched_debug.cfs_rq[=
17]:/.min_vruntime
      3.00 =C2=B1 40%   +2483.3%      77.50 =C2=B1156%  sched_debug.cfs_rq[=
18]:/.load_avg
     27897 =C2=B1 21%     -63.6%      10160 =C2=B1 21%  sched_debug.cfs_rq[=
18]:/.min_vruntime
      3.00 =C2=B1 40%   +2475.0%      77.25 =C2=B1156%  sched_debug.cfs_rq[=
18]:/.tg_load_avg_contrib
     27784 =C2=B1 13%     -61.4%      10716 =C2=B1 28%  sched_debug.cfs_rq[=
19]:/.min_vruntime
      1.00 =C2=B1-100%     +75.0%       1.75 =C2=B1 47%  sched_debug.cfs_rq=
[19]:/.nr_spread_over
      1949 =C2=B1 45%     -45.7%       1057 =C2=B1 20%  sched_debug.cfs_rq[=
1]:/.exec_clock
     32447 =C2=B1 16%     -69.0%      10058 =C2=B1 34%  sched_debug.cfs_rq[=
1]:/.min_vruntime
     28770 =C2=B1 19%     -59.8%      11565 =C2=B1 36%  sched_debug.cfs_rq[=
20]:/.min_vruntime
     30065 =C2=B1 13%     -61.1%      11706 =C2=B1 25%  sched_debug.cfs_rq[=
21]:/.min_vruntime
     28042 =C2=B1 16%     -67.6%       9090 =C2=B1 23%  sched_debug.cfs_rq[=
22]:/.min_vruntime
     27289 =C2=B1 18%     -58.2%      11419 =C2=B1 27%  sched_debug.cfs_rq[=
23]:/.min_vruntime
     23431 =C2=B1 21%     -67.0%       7737 =C2=B1 35%  sched_debug.cfs_rq[=
24]:/.min_vruntime
      0.00 =C2=B1  0%      +Inf%     116.25 =C2=B1170%  sched_debug.cfs_rq[=
25]:/.load_avg
     25502 =C2=B1  9%     -66.3%       8603 =C2=B1 29%  sched_debug.cfs_rq[=
25]:/.min_vruntime
      0.00 =C2=B1  0%      +Inf%     116.25 =C2=B1170%  sched_debug.cfs_rq[=
25]:/.tg_load_avg_contrib
     25720 =C2=B1 16%     -64.8%       9058 =C2=B1 48%  sched_debug.cfs_rq[=
26]:/.min_vruntime
     26035 =C2=B1 15%     -63.6%       9485 =C2=B1 39%  sched_debug.cfs_rq[=
27]:/.min_vruntime
     26648 =C2=B1  7%     -68.8%       8316 =C2=B1 26%  sched_debug.cfs_rq[=
28]:/.min_vruntime
     24833 =C2=B1 20%     -66.2%       8394 =C2=B1 41%  sched_debug.cfs_rq[=
29]:/.min_vruntime
     44.50 =C2=B1 50%     -83.1%       7.50 =C2=B1 64%  sched_debug.cfs_rq[=
29]:/.util_avg
     29817 =C2=B1  3%     -59.6%      12057 =C2=B1 21%  sched_debug.cfs_rq[=
2]:/.min_vruntime
     26058 =C2=B1 11%     -62.0%       9900 =C2=B1 34%  sched_debug.cfs_rq[=
30]:/.min_vruntime
     22433 =C2=B1 13%     -64.0%       8083 =C2=B1 45%  sched_debug.cfs_rq[=
31]:/.min_vruntime
     25121 =C2=B1 17%     -67.8%       8092 =C2=B1 39%  sched_debug.cfs_rq[=
32]:/.min_vruntime
     22525 =C2=B1 15%     -64.5%       7985 =C2=B1 47%  sched_debug.cfs_rq[=
33]:/.min_vruntime
     21583 =C2=B1  2%     -60.8%       8451 =C2=B1 35%  sched_debug.cfs_rq[=
34]:/.min_vruntime
     23653 =C2=B1 18%     -69.3%       7256 =C2=B1 29%  sched_debug.cfs_rq[=
35]:/.min_vruntime
     24629 =C2=B1 21%     -58.0%      10337 =C2=B1 24%  sched_debug.cfs_rq[=
36]:/.min_vruntime
      0.00 =C2=B1  0%      +Inf%       2.25 =C2=B1 48%  sched_debug.cfs_rq[=
37]:/.load_avg
     27117 =C2=B1 15%     -70.2%       8093 =C2=B1 32%  sched_debug.cfs_rq[=
37]:/.min_vruntime
      0.00 =C2=B1  0%      +Inf%       2.25 =C2=B1 48%  sched_debug.cfs_rq[=
37]:/.tg_load_avg_contrib
      0.50 =C2=B1100%    +450.0%       2.75 =C2=B1 30%  sched_debug.cfs_rq[=
38]:/.load_avg
     24524 =C2=B1 15%     -64.3%       8764 =C2=B1 28%  sched_debug.cfs_rq[=
38]:/.min_vruntime
      0.50 =C2=B1100%    +450.0%       2.75 =C2=B1 30%  sched_debug.cfs_rq[=
38]:/.tg_load_avg_contrib
     24164 =C2=B1 23%     -67.4%       7871 =C2=B1 45%  sched_debug.cfs_rq[=
39]:/.min_vruntime
      1100 =C2=B1 14%     +40.9%       1550 =C2=B1 28%  sched_debug.cfs_rq[=
3]:/.exec_clock
     27801 =C2=B1  8%     -53.8%      12833 =C2=B1 25%  sched_debug.cfs_rq[=
3]:/.min_vruntime
     25596 =C2=B1 24%     -77.2%       5828 =C2=B1 37%  sched_debug.cfs_rq[=
40]:/.min_vruntime
      0.00 =C2=B1  0%      +Inf%       1.75 =C2=B1 74%  sched_debug.cfs_rq[=
41]:/.load_avg
     25382 =C2=B1 16%     -71.5%       7225 =C2=B1 39%  sched_debug.cfs_rq[=
41]:/.min_vruntime
      0.00 =C2=B1  0%      +Inf%       1.75 =C2=B1 74%  sched_debug.cfs_rq[=
41]:/.tg_load_avg_contrib
      1.00 =C2=B1141%    +325.0%       4.25 =C2=B1 50%  sched_debug.cfs_rq[=
42]:/.load_avg
     22692 =C2=B1 13%     -61.6%       8702 =C2=B1 38%  sched_debug.cfs_rq[=
42]:/.min_vruntime
      1.00 =C2=B1141%    +325.0%       4.25 =C2=B1 50%  sched_debug.cfs_rq[=
42]:/.tg_load_avg_contrib
     25387 =C2=B1  7%     -70.2%       7574 =C2=B1 33%  sched_debug.cfs_rq[=
43]:/.min_vruntime
     23889 =C2=B1 14%     -60.1%       9530 =C2=B1 67%  sched_debug.cfs_rq[=
44]:/.min_vruntime
      0.25 =C2=B1173%   +1000.0%       2.75 =C2=B1 39%  sched_debug.cfs_rq[=
45]:/.load_avg
     21897 =C2=B1 15%     -54.6%       9943 =C2=B1 28%  sched_debug.cfs_rq[=
45]:/.min_vruntime
    -16192 =C2=B1 -7%     -48.7%      -8303 =C2=B1-51%  sched_debug.cfs_rq[=
45]:/.spread0
      0.25 =C2=B1173%   +1000.0%       2.75 =C2=B1 39%  sched_debug.cfs_rq[=
45]:/.tg_load_avg_contrib
     24639 =C2=B1 21%     -64.1%       8855 =C2=B1 39%  sched_debug.cfs_rq[=
46]:/.min_vruntime
     25239 =C2=B1  6%     -59.0%      10353 =C2=B1 37%  sched_debug.cfs_rq[=
47]:/.min_vruntime
      3.25 =C2=B1 90%   +1738.5%      59.75 =C2=B1148%  sched_debug.cfs_rq[=
4]:/.load_avg
     27745 =C2=B1  7%     -59.1%      11337 =C2=B1 21%  sched_debug.cfs_rq[=
4]:/.min_vruntime
      3.25 =C2=B1 90%   +1738.5%      59.75 =C2=B1148%  sched_debug.cfs_rq[=
4]:/.tg_load_avg_contrib
     26.00 =C2=B1 98%    +309.6%     106.50 =C2=B1 82%  sched_debug.cfs_rq[=
4]:/.util_avg
     25027 =C2=B1 11%     -52.7%      11834 =C2=B1 29%  sched_debug.cfs_rq[=
5]:/.min_vruntime
     26777 =C2=B1 13%     -60.3%      10631 =C2=B1 61%  sched_debug.cfs_rq[=
6]:/.min_vruntime
     25.00 =C2=B1 45%     -62.0%       9.50 =C2=B1 75%  sched_debug.cfs_rq[=
6]:/.util_avg
     25408 =C2=B1  9%     -49.0%      12966 =C2=B1 51%  sched_debug.cfs_rq[=
7]:/.min_vruntime
     25245 =C2=B1 12%     -58.6%      10460 =C2=B1 27%  sched_debug.cfs_rq[=
8]:/.min_vruntime
    850.74 =C2=B1  6%     +24.9%       1062 =C2=B1 12%  sched_debug.cfs_rq[=
9]:/.exec_clock
     21282 =C2=B1  6%     -47.5%      11170 =C2=B1 29%  sched_debug.cfs_rq[=
9]:/.min_vruntime
    -16808 =C2=B1-13%     -57.9%      -7076 =C2=B1-46%  sched_debug.cfs_rq[=
9]:/.spread0
     13055 =C2=B1  9%     -12.4%      11442 =C2=B1 12%  sched_debug.cpu#10.=
nr_switches
      5695 =C2=B1  9%     -16.9%       4734 =C2=B1 13%  sched_debug.cpu#10.=
sched_goidle
      7680 =C2=B1  7%     +19.8%       9198 =C2=B1 11%  sched_debug.cpu#15.=
nr_load_updates
     12164 =C2=B1  4%     +17.2%      14262 =C2=B1  7%  sched_debug.cpu#18.=
sched_count
      2403 =C2=B1 14%     +22.4%       2942 =C2=B1  5%  sched_debug.cpu#18.=
ttwu_local
      1.00 =C2=B1212%    -375.0%      -2.75 =C2=B1-53%  sched_debug.cpu#22.=
nr_uninterruptible
      2288 =C2=B1 15%     +24.2%       2841 =C2=B1  9%  sched_debug.cpu#23.=
ttwu_local
      2414 =C2=B1 23%     -31.2%       1660 =C2=B1 15%  sched_debug.cpu#24.=
ttwu_count
      2156 =C2=B1 15%     -28.2%       1549 =C2=B1 13%  sched_debug.cpu#24.=
ttwu_local
      2077 =C2=B1 15%     -24.8%       1562 =C2=B1 14%  sched_debug.cpu#29.=
ttwu_count
      1719 =C2=B1  6%     -14.5%       1470 =C2=B1 11%  sched_debug.cpu#34.=
ttwu_local
      2347 =C2=B1 25%     -23.3%       1799 =C2=B1 11%  sched_debug.cpu#47.=
ttwu_local
     -4.00 =C2=B1-39%    -137.5%       1.50 =C2=B1238%  sched_debug.cpu#9.n=
r_uninterruptible

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/test:
  nhm-white2/unixbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/she=
ll1

commit: =

  fde7d22e01aa0d252fc5c95fa11f0dac35a4dd59
  3e386d56bafbb6d2540b49367444997fc671ea69

fde7d22e01aa0d25 3e386d56bafbb6d2540b493674 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      7433 =C2=B1  0%      -0.8%       7376 =C2=B1  0%  unixbench.time.maxi=
mum_resident_set_size
      4602 =C2=B1 19%     +33.2%       6132 =C2=B1  0%  meminfo.AnonHugePag=
es
      0.31 =C2=B1 72%     -75.4%       0.08 =C2=B1  6%  turbostat.Pkg%pc3
      7552 =C2=B1  2%     -11.9%       6656 =C2=B1  0%  slabinfo.kmalloc-8.=
active_objs
      7552 =C2=B1  2%     -11.9%       6656 =C2=B1  0%  slabinfo.kmalloc-8.=
num_objs
     46156 =C2=B1  6%     +17.4%      54180 =C2=B1  0%  vmstat.system.cs
     12893 =C2=B1  8%     +27.1%      16386 =C2=B1  0%  vmstat.system.in
   3060906 =C2=B1  6%     +34.5%    4117057 =C2=B1  1%  cpuidle.C1-NHM.usage
 7.226e+08 =C2=B1 23%     -24.1%  5.487e+08 =C2=B1  0%  cpuidle.C6-NHM.time
    157908 =C2=B1  5%     -40.7%      93649 =C2=B1  5%  cpuidle.POLL.time
  11920829 =C2=B1119%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
   2145589 =C2=B1105%    -100.0%     404.50 =C2=B1  8%  latency_stats.avg.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_fdatawait.sync_inodes_sb.sy=
nc_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fastpath
  19732421 =C2=B1101%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
  20091553 =C2=B1101%    -100.0%       1856 =C2=B1  7%  latency_stats.max.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_fdatawait.sync_inodes_sb.sy=
nc_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fastpath
  24618851 =C2=B1108%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
  20945539 =C2=B1101%    -100.0%       4420 =C2=B1  1%  latency_stats.sum.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_fdatawait.sync_inodes_sb.sy=
nc_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fastpath
      0.00 =C2=B1  0%  +8.4e+13%     837002 =C2=B1 86%  sched_debug.cfs_rq[=
0]:/.MIN_vruntime
      0.00 =C2=B1  0%  +8.4e+13%     837002 =C2=B1 86%  sched_debug.cfs_rq[=
0]:/.max_vruntime
      8.50 =C2=B1 54%   +2647.1%     233.50 =C2=B1 93%  sched_debug.cfs_rq[=
1]:/.load
    204224 =C2=B1 47%     -87.2%      26105 =C2=B1 16%  sched_debug.cfs_rq[=
1]:/.spread0
     10.25 =C2=B1 19%     -51.2%       5.00 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.nr_spread_over
    173.00 =C2=B1 38%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.removed_load_avg
    170.00 =C2=B1 39%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.removed_util_avg
      5.00 =C2=B1 44%     +70.0%       8.50 =C2=B1  5%  sched_debug.cfs_rq[=
3]:/.nr_spread_over
      7.25 =C2=B1 64%    +127.6%      16.50 =C2=B1 21%  sched_debug.cfs_rq[=
3]:/.util_avg
     13.25 =C2=B1 11%     -66.0%       4.50 =C2=B1 77%  sched_debug.cfs_rq[=
4]:/.load
    -11087 =C2=B1-722%   +1314.6%    -156849 =C2=B1  0%  sched_debug.cfs_rq=
[4]:/.spread0
      0.25 =C2=B1173%  +3.3e+05%     829.50 =C2=B1 99%  sched_debug.cfs_rq[=
6]:/.load_avg
     41.67 =C2=B1141%    +243.2%     143.00 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.removed_load_avg
     41.67 =C2=B1141%    +243.2%     143.00 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.removed_util_avg
      5.25 =C2=B1 15%    +195.2%      15.50 =C2=B1 54%  sched_debug.cfs_rq[=
6]:/.runnable_load_avg
      7903 =C2=B11955%   -4052.1%    -312364 =C2=B1  0%  sched_debug.cfs_rq=
[6]:/.spread0
      0.25 =C2=B1173%  +3.3e+05%     829.50 =C2=B1 99%  sched_debug.cfs_rq[=
6]:/.tg_load_avg_contrib
      4.75 =C2=B1 17%     +36.8%       6.50 =C2=B1  7%  sched_debug.cpu#0.c=
pu_load[0]
      7.00 =C2=B1 17%     -35.7%       4.50 =C2=B1 11%  sched_debug.cpu#1.c=
pu_load[2]
      8.00 =C2=B1 57%     +93.8%      15.50 =C2=B1  9%  sched_debug.cpu#1.l=
oad
      4.00 =C2=B1 17%     +37.5%       5.50 =C2=B1  9%  sched_debug.cpu#2.c=
pu_load[1]
     14.00 =C2=B1 13%     -67.9%       4.50 =C2=B1 77%  sched_debug.cpu#4.l=
oad
    122580 =C2=B1 50%     -35.6%      78933 =C2=B1  0%  sched_debug.cpu#4.t=
twu_local
    537910 =C2=B1  8%     +15.5%     621138 =C2=B1  7%  sched_debug.cpu#5.a=
vg_idle
      4.00 =C2=B1 81%   +1875.0%      79.00 =C2=B1 88%  sched_debug.cpu#5.c=
pu_load[0]
    117.75 =C2=B1 15%     +22.3%     144.00 =C2=B1  0%  sched_debug.cpu#5.n=
r_uninterruptible
      3.50 =C2=B1 31%    +342.9%      15.50 =C2=B1 54%  sched_debug.cpu#6.c=
pu_load[0]
      4.50 =C2=B1 19%    +233.3%      15.00 =C2=B1 60%  sched_debug.cpu#6.c=
pu_load[1]
   1039435 =C2=B1 86%    +469.1%    5915058 =C2=B1  4%  sched_debug.cpu#6.n=
r_switches
   1039727 =C2=B1 86%    +468.9%    5915290 =C2=B1  4%  sched_debug.cpu#6.s=
ched_count
    430761 =C2=B1 96%    +528.8%    2708717 =C2=B1  4%  sched_debug.cpu#6.s=
ched_goidle
    458677 =C2=B1 97%    +533.5%    2905713 =C2=B1  4%  sched_debug.cpu#6.t=
twu_count
    334147 =C2=B1135%    +734.5%    2788322 =C2=B1  4%  sched_debug.cpu#6.t=
twu_local
    481139 =C2=B1 12%     +26.2%     607278 =C2=B1  5%  sched_debug.cpu#7.a=
vg_idle
     14.75 =C2=B1 24%     +66.1%      24.50 =C2=B1  2%  sched_debug.cpu#7.l=
oad
      2.65 =C2=B1133%     -99.7%       0.01 =C2=B1  5%  sched_debug.rt_rq[4=
]:/.rt_time
      0.44 =C2=B1171%   +1999.6%       9.32 =C2=B1 28%  sched_debug.rt_rq[6=
]:/.rt_time

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/test:
  nhm-white2/unixbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/spa=
wn

commit: =

  fde7d22e01aa0d252fc5c95fa11f0dac35a4dd59
  3e386d56bafbb6d2540b49367444997fc671ea69

fde7d22e01aa0d25 3e386d56bafbb6d2540b493674 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    352.00 =C2=B1  9%     -27.3%     256.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.active_objs
    352.00 =C2=B1  9%     -27.3%     256.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.num_objs
      1865 =C2=B1  4%     -12.9%       1625 =C2=B1  2%  slabinfo.proc_inode=
_cache.num_objs
     10.00 =C2=B1 15%     -35.0%       6.50 =C2=B1  7%  sched_debug.cfs_rq[=
1]:/.nr_spread_over
     18.75 =C2=B1136%    +121.3%      41.50 =C2=B1 80%  sched_debug.cfs_rq[=
1]:/.util_avg
      4.75 =C2=B1 22%    +173.7%      13.00 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.nr_spread_over
      7.50 =C2=B1 27%     -53.3%       3.50 =C2=B1 14%  sched_debug.cfs_rq[=
4]:/.nr_spread_over
     28.25 =C2=B1 69%     -69.9%       8.50 =C2=B1 17%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
     27.25 =C2=B1 61%     -74.3%       7.00 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
      3.75 =C2=B1 22%    +180.0%      10.50 =C2=B1 14%  sched_debug.cfs_rq[=
6]:/.nr_spread_over
     28.00 =C2=B1 60%     -75.0%       7.00 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
     28.00 =C2=B1 60%     -75.0%       7.00 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
    196603 =C2=B1 40%     +42.3%     279845 =C2=B1  2%  sched_debug.cpu#0.a=
vg_idle
     56905 =C2=B1  7%     +12.2%      63846 =C2=B1  2%  sched_debug.cpu#1.n=
r_load_updates
    693272 =C2=B1  6%    +119.9%    1524462 =C2=B1 53%  sched_debug.cpu#1.n=
r_switches
    693317 =C2=B1  6%    +119.9%    1524508 =C2=B1 53%  sched_debug.cpu#1.s=
ched_count
    308355 =C2=B1  7%    +126.2%     697610 =C2=B1 54%  sched_debug.cpu#1.s=
ched_goidle
     33.25 =C2=B1 89%     -98.5%       0.50 =C2=B1100%  sched_debug.cpu#2.c=
pu_load[1]
      5231 =C2=B1 29%     -98.2%      94.00 =C2=B1100%  sched_debug.cpu#2.c=
urr->pid
     26.25 =C2=B1 76%     -96.2%       1.00 =C2=B1100%  sched_debug.cpu#4.c=
pu_load[2]
     28.50 =C2=B1 68%     -82.5%       5.00 =C2=B1 20%  sched_debug.cpu#4.c=
pu_load[3]
     25.75 =C2=B1 57%     -74.8%       6.50 =C2=B1 23%  sched_debug.cpu#4.c=
pu_load[4]
     42205 =C2=B1  2%      +8.4%      45742 =C2=B1  2%  sched_debug.cpu#4.n=
r_load_updates
      0.75 =C2=B1110%   +7300.0%      55.50 =C2=B1 72%  sched_debug.cpu#5.c=
pu_load[1]
      3.75 =C2=B1 78%   +1806.7%      71.50 =C2=B1 31%  sched_debug.cpu#5.c=
pu_load[2]
      8.75 =C2=B1 50%    +580.0%      59.50 =C2=B1 12%  sched_debug.cpu#5.c=
pu_load[3]
     11.75 =C2=B1 25%    +257.4%      42.00 =C2=B1  7%  sched_debug.cpu#5.c=
pu_load[4]
      2713 =C2=B1 98%    +111.7%       5745 =C2=B1 23%  sched_debug.cpu#6.c=
urr->pid
     21.75 =C2=B1 17%     -33.3%      14.50 =C2=B1  3%  sched_debug.cpu#7.n=
r_uninterruptible
      0.00 =C2=B1107%  +1.3e+06%      30.31 =C2=B1 99%  sched_debug.rt_rq[5=
]:/.rt_time

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/test:
  nhm-white/unixbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/spawn

commit: =

  fde7d22e01aa0d252fc5c95fa11f0dac35a4dd59
  3e386d56bafbb6d2540b49367444997fc671ea69

fde7d22e01aa0d25 3e386d56bafbb6d2540b493674 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     57856 =C2=B1  3%     -10.6%      51712 =C2=B1  1%  meminfo.DirectMap4k
    545000 =C2=B1173%     -98.4%       8731 =C2=B1 95%  latency_stats.avg.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_fdatawait.sync_inodes_sb.sy=
nc_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fastpath
   4731410 =C2=B1173%     -98.4%      75096 =C2=B1 97%  latency_stats.max.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_fdatawait.sync_inodes_sb.sy=
nc_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fastpath
   6539353 =C2=B1173%     -98.8%      78590 =C2=B1 95%  latency_stats.sum.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_fdatawait.sync_inodes_sb.sy=
nc_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fastpath
      5.00 =C2=B1 50%    +670.0%      38.50 =C2=B1 55%  sched_debug.cfs_rq[=
0]:/.util_avg
      0.50 =C2=B1100%    +600.0%       3.50 =C2=B1 42%  sched_debug.cfs_rq[=
1]:/.load
      6.75 =C2=B1 21%     -55.6%       3.00 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.nr_spread_over
      1.50 =C2=B1137%    +333.3%       6.50 =C2=B1 23%  sched_debug.cfs_rq[=
5]:/.load
      2.50 =C2=B1103%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.load_avg
      2.50 =C2=B1103%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.tg_load_avg_contrib
      6.00 =C2=B1 35%     +91.7%      11.50 =C2=B1 13%  sched_debug.cfs_rq[=
7]:/.nr_spread_over
     30.00 =C2=B1 78%     -98.3%       0.50 =C2=B1100%  sched_debug.cpu#0.c=
pu_load[2]
     26.75 =C2=B1 47%     -86.9%       3.50 =C2=B1100%  sched_debug.cpu#0.c=
pu_load[3]
     20.75 =C2=B1 31%     -71.1%       6.00 =C2=B1100%  sched_debug.cpu#0.c=
pu_load[4]
     -9.50 =C2=B1-15%    +126.3%     -21.50 =C2=B1-11%  sched_debug.cpu#0.n=
r_uninterruptible
      0.00 =C2=B1  0%      +Inf%       1.50 =C2=B1 33%  sched_debug.cpu#1.c=
pu_load[0]
      0.75 =C2=B1 57%    +366.7%       3.50 =C2=B1 42%  sched_debug.cpu#1.l=
oad
     56707 =C2=B1  5%      +9.7%      62228 =C2=B1  3%  sched_debug.cpu#2.n=
r_load_updates
      0.00 =C2=B1  0%      +Inf%       1.50 =C2=B1 33%  sched_debug.cpu#2.n=
r_running
    659778 =C2=B1  6%    +154.5%    1679293 =C2=B1 55%  sched_debug.cpu#2.n=
r_switches
    659820 =C2=B1  6%    +154.5%    1679335 =C2=B1 55%  sched_debug.cpu#2.s=
ched_count
    292590 =C2=B1  6%    +161.8%     765983 =C2=B1 56%  sched_debug.cpu#2.s=
ched_goidle
    467991 =C2=B1 10%     -26.0%     346378 =C2=B1  3%  sched_debug.cpu#5.a=
vg_idle
      0.00 =C2=B1  0%      +Inf%       1.00 =C2=B1  0%  sched_debug.cpu#5.c=
pu_load[1]
      6696 =C2=B1 55%     -91.5%     570.00 =C2=B1  0%  sched_debug.cpu#5.c=
urr->pid
      2.00 =C2=B1 86%    +225.0%       6.50 =C2=B1 23%  sched_debug.cpu#5.l=
oad
      0.75 =C2=B11503%   +3033.3%      23.50 =C2=B1  2%  sched_debug.cpu#5.=
nr_uninterruptible
    537025 =C2=B1  2%     -38.0%     333103 =C2=B1 11%  sched_debug.cpu#6.a=
vg_idle
      5586 =C2=B1 59%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#6.c=
urr->pid
     11.50 =C2=B1 51%    -234.8%     -15.50 =C2=B1-22%  sched_debug.cpu#6.n=
r_uninterruptible
     50.50 =C2=B1132%    -100.0%       0.00 =C2=B1  0%  sched_debug.cpu#7.c=
pu_load[1]
     15.75 =C2=B1 47%     +61.9%      25.50 =C2=B1 17%  sched_debug.cpu#7.n=
r_uninterruptible
      0.21 =C2=B1  9%    +925.9%       2.15 =C2=B1 88%  sched_debug.rt_rq[2=
]:/.rt_time
      0.01 =C2=B1 12%  +2.8e+05%      17.68 =C2=B1 99%  sched_debug.rt_rq[6=
]:/.rt_time

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  lkp-sbx04/will-it-scale/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/=
performance/sched_yield

commit: =

  fde7d22e01aa0d252fc5c95fa11f0dac35a4dd59
  3e386d56bafbb6d2540b49367444997fc671ea69

fde7d22e01aa0d25 3e386d56bafbb6d2540b493674 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   6076732 =C2=B1  0%      -2.9%    5899888 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
   6076808 =C2=B1  0%      -2.9%    5900615 =C2=B1  0%  will-it-scale.per_t=
hread_ops
      0.53 =C2=B1  0%      +2.7%       0.54 =C2=B1  0%  will-it-scale.scala=
bility
    436.80 =C2=B1  0%      -3.3%     422.49 =C2=B1  0%  will-it-scale.time.=
user_time
     46.75 =C2=B1 82%    +166.3%     124.50 =C2=B1 10%  cpuidle.POLL.usage
      0.04 =C2=B1 10%     +88.2%       0.08 =C2=B1 23%  turbostat.CPU%c3
      2.22 =C2=B1  5%     -23.4%       1.70 =C2=B1  1%  perf-profile.cycles=
.__calc_delta.pick_next_task_fair.__schedule.schedule.sys_sched_yield
      1.03 =C2=B1  2%     +22.1%       1.26 =C2=B1  3%  perf-profile.cycles=
.clear_buddies.pick_next_entity.pick_next_task_fair.__schedule.schedule
      1.16 =C2=B1  3%     -40.2%       0.70 =C2=B1  1%  perf-profile.cycles=
.pick_next_entity.__schedule.schedule.sys_sched_yield.entry_SYSCALL_64_fast=
path
      5.07 =C2=B1  2%     +18.8%       6.03 =C2=B1  2%  perf-profile.cycles=
.pick_next_entity.pick_next_task_fair.__schedule.schedule.sys_sched_yield
     12421 =C2=B1  2%     -14.2%      10663 =C2=B1  3%  slabinfo.kmalloc-19=
2.active_objs
     12422 =C2=B1  2%     -12.7%      10847 =C2=B1  3%  slabinfo.kmalloc-19=
2.num_objs
     13355 =C2=B1  4%     -12.9%      11626 =C2=B1  3%  slabinfo.kmalloc-51=
2.active_objs
     13462 =C2=B1  3%     -12.2%      11817 =C2=B1  4%  slabinfo.kmalloc-51=
2.num_objs
  10738466 =C2=B1 72%    +144.2%   26226029 =C2=B1152%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
  13687263 =C2=B1 73%     +91.6%   26226029 =C2=B1152%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
    268.25 =C2=B1 22%    +3e+06%    8101959 =C2=B1173%  latency_stats.max.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.link_path_walk
  14282625 =C2=B1 75%     +83.6%   26226029 =C2=B1152%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      1758 =C2=B1 29%  +4.6e+05%    8103711 =C2=B1173%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.link_path_walk
      3871 =C2=B1  4%     -15.4%       3276 =C2=B1  6%  numa-vmstat.node0.n=
r_slab_reclaimable
    149717 =C2=B1  3%      -9.0%     136293 =C2=B1  2%  numa-vmstat.node2.n=
uma_local
      2065 =C2=B1 28%     +63.8%       3382 =C2=B1 28%  numa-vmstat.node3.n=
r_active_anon
    650.00 =C2=B1127%    +240.7%       2214 =C2=B1  1%  numa-vmstat.node3.n=
r_inactive_anon
      1252 =C2=B1 50%     +89.1%       2367 =C2=B1  0%  numa-vmstat.node3.n=
r_mapped
    672.75 =C2=B1123%    +323.9%       2852 =C2=B1 37%  numa-vmstat.node3.n=
r_shmem
     35218 =C2=B1 14%     -14.9%      29979 =C2=B1  3%  numa-meminfo.node0.=
Active
      1017 =C2=B1 11%     -21.8%     795.50 =C2=B1  9%  numa-meminfo.node0.=
PageTables
     15486 =C2=B1  4%     -15.4%      13105 =C2=B1  6%  numa-meminfo.node0.=
SReclaimable
      2069 =C2=B1  5%     +12.4%       2325 =C2=B1  8%  numa-meminfo.node2.=
KernelStack
      8262 =C2=B1 28%     +63.8%      13530 =C2=B1 28%  numa-meminfo.node3.=
Active(anon)
      2601 =C2=B1127%    +240.5%       8858 =C2=B1  1%  numa-meminfo.node3.=
Inactive(anon)
      5011 =C2=B1 50%     +89.0%       9472 =C2=B1  0%  numa-meminfo.node3.=
Mapped
      2692 =C2=B1122%    +323.8%      11410 =C2=B1 37%  numa-meminfo.node3.=
Shmem
      3.75 =C2=B1 47%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.nr_spread_over
    197.50 =C2=B1 10%     -13.9%     170.00 =C2=B1  1%  sched_debug.cfs_rq[=
20]:/.util_avg
      2.00 =C2=B1 35%     -83.3%       0.33 =C2=B1141%  sched_debug.cfs_rq[=
47]:/.nr_spread_over
      8.50 =C2=B1 17%     +23.5%      10.50 =C2=B1  4%  sched_debug.cfs_rq[=
59]:/.load_avg
      8.50 =C2=B1 17%     +23.5%      10.50 =C2=B1  4%  sched_debug.cfs_rq[=
59]:/.tg_load_avg_contrib
    423.25 =C2=B1 17%     +25.4%     530.75 =C2=B1  8%  sched_debug.cfs_rq[=
59]:/.util_avg
      1.00 =C2=B1-100%    +150.0%       2.50 =C2=B1 44%  sched_debug.cfs_rq=
[8]:/.nr_spread_over
      2556 =C2=B1 13%     -22.6%       1979 =C2=B1 13%  sched_debug.cpu#0.s=
ched_goidle
      1581 =C2=B1 27%     +93.8%       3064 =C2=B1 24%  sched_debug.cpu#12.=
sched_goidle
     -2.67 =C2=B1-98%    +143.8%      -6.50 =C2=B1-44%  sched_debug.cpu#2.n=
r_uninterruptible
    576.25 =C2=B1 26%    +397.3%       2865 =C2=B1 75%  sched_debug.cpu#22.=
ttwu_local
      4410 =C2=B1  9%     +68.0%       7411 =C2=B1 23%  sched_debug.cpu#26.=
sched_goidle
      3509 =C2=B1 32%     -52.4%       1670 =C2=B1 12%  sched_debug.cpu#27.=
curr->pid
     -2.00 =C2=B1-106%    -175.0%       1.50 =C2=B1100%  sched_debug.cpu#27=
.nr_uninterruptible
      4794 =C2=B1 35%     -36.9%       3024 =C2=B1  8%  sched_debug.cpu#28.=
ttwu_count
      0.25 =C2=B11307%   -2400.0%      -5.75 =C2=B1-60%  sched_debug.cpu#31=
.nr_uninterruptible
      6465 =C2=B1 20%     -41.9%       3755 =C2=B1 27%  sched_debug.cpu#31.=
sched_goidle
     64512 =C2=B1 24%     -70.5%      19049 =C2=B1165%  sched_debug.cpu#32.=
nr_switches
     65052 =C2=B1 21%     -98.8%     804.50 =C2=B1 21%  sched_debug.cpu#34.=
nr_switches
      1403 =C2=B1 30%     -75.8%     339.25 =C2=B1 33%  sched_debug.cpu#35.=
ttwu_count
    608.25 =C2=B1 88%     -69.5%     185.25 =C2=B1 48%  sched_debug.cpu#35.=
ttwu_local
      1034 =C2=B1 58%     -68.8%     322.50 =C2=B1 25%  sched_debug.cpu#39.=
ttwu_count
    130116 =C2=B1 14%     -36.5%      82684 =C2=B1 33%  sched_debug.cpu#4.n=
r_switches
     46901 =C2=B1 62%     -89.3%       5030 =C2=B1124%  sched_debug.cpu#40.=
nr_switches
     37807 =C2=B1 91%     -96.8%       1206 =C2=B1  9%  sched_debug.cpu#41.=
nr_switches
    893.00 =C2=B1 53%     -46.3%     479.50 =C2=B1 11%  sched_debug.cpu#41.=
sched_goidle
     74766 =C2=B1 56%     -74.7%      18921 =C2=B1161%  sched_debug.cpu#42.=
nr_switches
     92018 =C2=B1 22%     -98.4%       1462 =C2=B1 18%  sched_debug.cpu#43.=
nr_switches
    452.50 =C2=B1 28%     -34.6%     295.75 =C2=B1 18%  sched_debug.cpu#43.=
ttwu_local
     74394 =C2=B1 37%     -96.7%       2453 =C2=B1 76%  sched_debug.cpu#45.=
nr_switches
     75791 =C2=B1  4%     -97.5%       1887 =C2=B1 56%  sched_debug.cpu#46.=
nr_switches
     75463 =C2=B1  3%     -97.5%       1882 =C2=B1 62%  sched_debug.cpu#47.=
nr_switches
     42098 =C2=B1 12%     -67.9%      13516 =C2=B1119%  sched_debug.cpu#49.=
nr_switches
    468.50 =C2=B1  9%     +44.0%     674.50 =C2=B1 27%  sched_debug.cpu#54.=
sched_goidle
      3.75 =C2=B1 68%    -106.7%      -0.25 =C2=B1-591%  sched_debug.cpu#56=
.nr_uninterruptible


brickland1: Brickland Ivy Bridge-EX
Memory: 128G

vm-intel12-yocto-x86_64: qemu-system-x86_64 -enable-kvm -cpu Nehalem
Memory: 320M

vm-vp-quantal-x86_64: qemu-system-x86_64 -enable-kvm
Memory: 360M

nhm4: Nehalem
Memory: 4G

ivb42: Ivytown Ivy Bridge-EP
Memory: 64G

nhm-white2: Nehalem
Memory: 4G

nhm-white: Nehalem
Memory: 6G

ivb43: Ivytown Ivy Bridge-EP
Memory: 64G

lkp-sbx04: Sandy Bridge-EX
Memory: 64G




                             will-it-scale.per_thread_ops

   6.1e+06 ++------------------------------------------------*-------------=
-+
           |                                                :   *..*..*..*.=
.*
  6.05e+06 ++                                              :               =
 |
           |                                               :               =
 |
           |                                              :                =
 |
     6e+06 ++                                   O  O  *..*                 =
 |
           *..*..  .*..  .*...     .*..*..*..       ..                     =
 |
  5.95e+06 ++    *.    *.     *..*.          *..*..*                       =
 |
           |                        O  O                                   =
 |
   5.9e+06 ++                             O  O        O  O   O  O          =
 |
           O  O  O  O  O  O                                                =
 |
           |                                                               =
 |
  5.85e+06 ++                 O  O                                         =
 |
           |                                                               =
 |
   5.8e+06 ++--------------------------------------------------------------=
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

--===============0060347372782528385==
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
YXVsdC13YXRjaGRvZ3M6CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IDMyYjg4
MTk0ZjcxZDZhZTc3NjhhMjlmODdmYmJhNDU0NzI4MjczZWUKbW9kZWw6IFNhbmR5IEJyaWRnZS1F
WApucl9jcHU6IDY0Cm1lbW9yeTogNjRHCm5yX3NzZF9wYXJ0aXRpb25zOiA0CnNzZF9wYXJ0aXRp
b25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1JTlRFTF9TU0RTQzJDVzI0MEEzX0NWQ1YyMDQzMCot
cGFydDEiCnN3YXBfcGFydGl0aW9uczogCmNhdGVnb3J5OiBiZW5jaG1hcmsKcGVyZi1wcm9maWxl
OgogIGZyZXE6IDgwMAp3aWxsLWl0LXNjYWxlOgogIHRlc3Q6IHNjaGVkX3lpZWxkCnF1ZXVlOiBj
eWNsaWMKdGVzdGJveDogbGtwLXNieDA0CnRib3hfZ3JvdXA6IGxrcC1zYngwNAprY29uZmlnOiB4
ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTUtMTAtMjYgMjE6MTc6MjUuODQ5MDc4MzYyICsw
ODowMAppZDogODY1NTQ2ZTY4Zjg2N2Y0NzM4MzEyNmRhOTMxOGMxMDVhNWExOGE2Zgp1c2VyOiBs
a3AKY29tcGlsZXI6IGdjYy00LjkKaGVhZF9jb21taXQ6IDM3ZDliYzlkMDIyN2UwOTdiZDI4OGFh
MjU0M2E0Y2UzZTA4MzMwMjUKYmFzZV9jb21taXQ6IDMyYjg4MTk0ZjcxZDZhZTc3NjhhMjlmODdm
YmJhNDU0NzI4MjczZWUKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNTEwMjYx
MgprZXJuZWw6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvMzJiODgxOTRmNzFkNmFl
Nzc2OGEyOWY4N2ZiYmE0NTQ3MjgyNzNlZS92bWxpbnV6LTQuMy4wLXJjNy0wMDI3OC1nMzJiODgx
OSIKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9yb290OiAiL3Jl
c3VsdC93aWxsLWl0LXNjYWxlL3BlcmZvcm1hbmNlLXNjaGVkX3lpZWxkL2xrcC1zYngwNC9kZWJp
YW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvMzJiODgxOTRmNzFk
NmFlNzc2OGEyOWY4N2ZiYmE0NTQ3MjgyNzNlZS8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVk
L2xrcC1zYngwNC9jeWNsaWNfd2lsbC1pdC1zY2FsZS1wZXJmb3JtYW5jZS1zY2hlZF95aWVsZC14
ODZfNjQtcmhlbC1DWUNMSUNfQkFTRS0zMmI4ODE5NGY3MWQ2YWU3NzY4YTI5Zjg3ZmJiYTQ1NDcy
ODI3M2VlLTIwMTUxMDI2LTEzMDM1OS0xanRsbGZoLTAueWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE1
LTEwLTI3IDAxOjQ3OjA2LjYyNDA5NTY0NSArMDg6MDAKbWF4X3VwdGltZTogMTUwMAppbml0cmQ6
ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNneiIKYm9vdGxvYWRl
cl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpvYj0vbGtwL3NjaGVkdWxl
ZC9sa3Atc2J4MDQvY3ljbGljX3dpbGwtaXQtc2NhbGUtcGVyZm9ybWFuY2Utc2NoZWRfeWllbGQt
eDg2XzY0LXJoZWwtQ1lDTElDX0JBU0UtMzJiODgxOTRmNzFkNmFlNzc2OGEyOWY4N2ZiYmE0NTQ3
MjgyNzNlZS0yMDE1MTAyNi0xMzAzNTktMWp0bGxmaC0wLnlhbWwKLSBBUkNIPXg4Nl82NAotIGtj
b25maWc9eDg2XzY0LXJoZWwKLSBicmFuY2g9bGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUx
MDI2MTIKLSBjb21taXQ9MzJiODgxOTRmNzFkNmFlNzc2OGEyOWY4N2ZiYmE0NTQ3MjgyNzNlZQot
IEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzMyYjg4MTk0ZjcxZDZh
ZTc3NjhhMjlmODdmYmJhNDU0NzI4MjczZWUvdm1saW51ei00LjMuMC1yYzctMDAyNzgtZzMyYjg4
MTkKLSBtYXhfdXB0aW1lPTE1MDAKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L3dpbGwtaXQtc2NhbGUv
cGVyZm9ybWFuY2Utc2NoZWRfeWllbGQvbGtwLXNieDA0L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS8zMmI4ODE5NGY3MWQ2YWU3NzY4YTI5Zjg3ZmJiYTQ1
NDcyODI3M2VlLzAKLSBMS1BfU0VSVkVSPWlubgotIHwyLQoKCiAgZWFybHlwcmludGs9dHR5UzAs
MTE1MjAwIHN5c3RlbWQubG9nX2xldmVsPWVycgogIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3
YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAogIHBhbmljPS0x
IHNvZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBsb2FkX3Jh
bWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10
dHkwIHZnYT1ub3JtYWwKCiAgcncKbGtwX2luaXRyZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6
Igptb2R1bGVzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS8zMmI4ODE5
NGY3MWQ2YWU3NzY4YTI5Zjg3ZmJiYTQ1NDcyODI3M2VlL21vZHVsZXMuY2d6IgpibV9pbml0cmQ6
ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3Np
bWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNneiwv
b3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovdHVyYm9zdGF0LmNneiwv
bGtwL2JlbmNobWFya3MvdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3Mvd2lsbC1pdC1zY2Fs
ZS5jZ3oiCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogNDUuMTEgMjAuMDggNy44MiAxLzY1
MSAxMTQ2MwpzdGFydF90aW1lOiAnMTQ0NTg4MTY3NicKZW5kX3RpbWU6ICcxNDQ1ODgxOTg0Jwp2
ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE1MTAyNi0xOTUwNTMiCg==

--===============0060347372782528385==
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
dGVzdC5weSBzY2hlZF95aWVsZCAxNiBib3RoIDEgOCAxNiAyNCAzMiA0OCA2NAo=

--===============0060347372782528385==--

