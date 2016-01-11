Content-Type: multipart/mixed; boundary="===============3344115390503112254=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [f2fs] 957efb0c21: No primary result change, -15.1% fsmark.time.voluntary_context_switches
Date: Mon, 11 Jan 2016 10:10:36 +0800
Message-ID: <87egdo9883.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3344115390503112254==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs dev-test
commit 957efb0c2144cc5ff1795f43bf2d2ca430eaa227 ("Revert "f2fs: check the n=
ode block address of newly allocated nid"")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/filesize/fs/iterations/kconfig/nr_directorie=
s/nr_files_per_directory/nr_threads/rootfs/sync_method/tbox_group/test_size=
/testcase:
  gcc-4.9/performance/1HDD/9B/f2fs/1x/x86_64-rhel/16d/256fpd/32t/debian-x86=
_64-2015-02-07.cgz/fsyncBeforeClose/lkp-ne04/400M/fsmark

commit: =

  a51311938e14c17f5a94d30baac9d7bec71f5858
  957efb0c2144cc5ff1795f43bf2d2ca430eaa227

a51311938e14c17f 957efb0c2144cc5ff1795f43bf =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   5699822 =C2=B1  2%     -23.2%    4375176 =C2=B1  5%  fsmark.app_overhead
   1853986 =C2=B1  0%      +1.0%    1872422 =C2=B1  0%  fsmark.time.file_sy=
stem_outputs
     60.75 =C2=B1  0%     -21.4%      47.75 =C2=B1  0%  fsmark.time.percent=
_of_cpu_this_job_got
     47.56 =C2=B1  0%     -21.8%      37.18 =C2=B1  1%  fsmark.time.system_=
time
   1021602 =C2=B1  0%     -15.1%     867006 =C2=B1  0%  fsmark.time.volunta=
ry_context_switches
      5171 =C2=B1  0%     +17.5%       6076 =C2=B1  1%  proc-vmstat.numa_pt=
e_updates
     31334 =C2=B1  2%      -9.1%      28485 =C2=B1  3%  softirqs.RCU
     60.75 =C2=B1  0%     -21.4%      47.75 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
     47.56 =C2=B1  0%     -21.8%      37.18 =C2=B1  1%  time.system_time
   1021602 =C2=B1  0%     -15.1%     867006 =C2=B1  0%  time.voluntary_cont=
ext_switches
      6278 =C2=B1  0%      +1.8%       6390 =C2=B1  0%  vmstat.io.bo
     25379 =C2=B1  1%     -13.9%      21840 =C2=B1  0%  vmstat.system.cs
      1735 =C2=B1  0%      -3.6%       1672 =C2=B1  0%  vmstat.system.in
      2341 =C2=B1151%    +263.3%       8505 =C2=B1  0%  numa-meminfo.node0.=
Inactive(anon)
      6544 =C2=B1 25%     +43.9%       9414 =C2=B1  0%  numa-meminfo.node0.=
Mapped
      2516 =C2=B1141%    +246.0%       8705 =C2=B1  1%  numa-meminfo.node0.=
Shmem
     80851 =C2=B1  8%     -11.5%      71514 =C2=B1  1%  numa-meminfo.node0.=
Slab
    584.50 =C2=B1151%    +263.7%       2125 =C2=B1  0%  numa-vmstat.node0.n=
r_inactive_anon
      1635 =C2=B1 25%     +43.8%       2352 =C2=B1  0%  numa-vmstat.node0.n=
r_mapped
    628.25 =C2=B1141%    +246.3%       2175 =C2=B1  1%  numa-vmstat.node0.n=
r_shmem
      2080 =C2=B1 11%     -21.5%       1634 =C2=B1 21%  numa-vmstat.node0.n=
uma_other
 1.173e+08 =C2=B1  4%     +22.9%  1.441e+08 =C2=B1  3%  cpuidle.C1-NHM.time
  36242421 =C2=B1  3%     +13.6%   41189247 =C2=B1  1%  cpuidle.C1E-NHM.time
 4.531e+08 =C2=B1  2%     -22.3%  3.522e+08 =C2=B1  2%  cpuidle.C3-NHM.time
    447937 =C2=B1  0%     -27.5%     324877 =C2=B1  1%  cpuidle.C3-NHM.usage
 6.434e+08 =C2=B1  1%     +12.2%  7.221e+08 =C2=B1  1%  cpuidle.C6-NHM.time
    139.75 =C2=B1  5%     -19.3%     112.75 =C2=B1  5%  cpuidle.POLL.usage
      3.96 =C2=B1  0%     -18.7%       3.21 =C2=B1  1%  turbostat.%Busy
     88.25 =C2=B1  1%     -13.6%      76.25 =C2=B1  1%  turbostat.Avg_MHz
     24.30 =C2=B1  2%      +9.5%      26.61 =C2=B1  2%  turbostat.CPU%c1
     39.26 =C2=B1  3%     -23.4%      30.08 =C2=B1  2%  turbostat.CPU%c3
     32.49 =C2=B1  2%     +23.4%      40.10 =C2=B1  1%  turbostat.CPU%c6
     12.66 =C2=B1  5%     -17.4%      10.46 =C2=B1  5%  turbostat.Pkg%pc3
     58968 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].alloc_nid.[f2fs].f2fs_new_=
inode.[f2fs].f2fs_create.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_=
open.SyS_open.entry_SYSCALL_64_fastpath
     78507 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  latency_stats.hits.=
call_rwsem_down_write_failed.get_node_info.[f2fs].alloc_nid.[f2fs].f2fs_new=
_inode.[f2fs].f2fs_create.[f2fs].vfs_create.path_openat.do_filp_open.do_sys=
_open.SyS_open.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      77032 =C2=B1  0%  latency_stats.hits.=
call_rwsem_down_write_failed.get_node_info.[f2fs].new_node_page.[f2fs].new_=
inode_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_cr=
eate.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
     62300 =C2=B1 37%     -85.0%       9341 =C2=B1 28%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_mkdir.[f2fs].vfs_mkdir.SyS_mkdir.entry_SYSC=
ALL_64_fastpath
  24001862 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].alloc_nid.[f2fs].f2fs_new_i=
node.[f2fs].f2fs_create.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_o=
pen.SyS_open.entry_SYSCALL_64_fastpath
     80814 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].alloc_nid.[f2fs].f2fs_new_i=
node.[f2fs].f2fs_mkdir.[f2fs].vfs_mkdir.SyS_mkdir.entry_SYSCALL_64_fastpath
    251.50 =C2=B1 87%   +5565.6%      14249 =C2=B1 34%  latency_stats.sum.c=
all_rwsem_down_write_failed.f2fs_init_extent_tree.[f2fs].f2fs_new_inode.[f2=
fs].f2fs_create.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_=
open.entry_SYSCALL_64_fastpath
  35549488 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_write_failed.get_node_info.[f2fs].alloc_nid.[f2fs].f2fs_new_=
inode.[f2fs].f2fs_create.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_=
open.SyS_open.entry_SYSCALL_64_fastpath
    116197 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_write_failed.get_node_info.[f2fs].alloc_nid.[f2fs].f2fs_new_=
inode.[f2fs].f2fs_mkdir.[f2fs].vfs_mkdir.SyS_mkdir.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%   25888690 =C2=B1  1%  latency_stats.sum.c=
all_rwsem_down_write_failed.get_node_info.[f2fs].new_node_page.[f2fs].new_i=
node_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_cre=
ate.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
      0.00 =C2=B1 -1%      +Inf%      93688 =C2=B1  8%  latency_stats.sum.c=
all_rwsem_down_write_failed.get_node_info.[f2fs].new_node_page.[f2fs].new_i=
node_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_mkd=
ir.[f2fs].vfs_mkdir.SyS_mkdir.entry_SYSCALL_64_fastpath
      4443 =C2=B1 20%     -39.4%       2691 =C2=B1  2%  sched_debug.cfs_rq:=
/.exec_clock.0
      1232 =C2=B1 12%     -24.1%     935.06 =C2=B1  5%  sched_debug.cfs_rq:=
/.exec_clock.11
      1114 =C2=B1  4%     -19.8%     894.19 =C2=B1  8%  sched_debug.cfs_rq:=
/.exec_clock.13
      2510 =C2=B1 15%     -20.5%       1996 =C2=B1 12%  sched_debug.cfs_rq:=
/.exec_clock.4
      2238 =C2=B1  0%     -10.9%       1994 =C2=B1  0%  sched_debug.cfs_rq:=
/.exec_clock.avg
      1043 =C2=B1  1%     -17.5%     861.26 =C2=B1  6%  sched_debug.cfs_rq:=
/.exec_clock.min
      8895 =C2=B1 13%     -30.2%       6209 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.0
      4162 =C2=B1  9%     -38.2%       2571 =C2=B1  6%  sched_debug.cfs_rq:=
/.min_vruntime.11
      3832 =C2=B1  4%     -28.4%       2742 =C2=B1 11%  sched_debug.cfs_rq:=
/.min_vruntime.13
      7383 =C2=B1  8%     -32.7%       4965 =C2=B1 25%  sched_debug.cfs_rq:=
/.min_vruntime.3
      8619 =C2=B1 36%     -40.6%       5122 =C2=B1  3%  sched_debug.cfs_rq:=
/.min_vruntime.4
     11149 =C2=B1 40%     -56.2%       4887 =C2=B1  8%  sched_debug.cfs_rq:=
/.min_vruntime.7
      4394 =C2=B1  6%     -30.0%       3074 =C2=B1  7%  sched_debug.cfs_rq:=
/.min_vruntime.8
      4383 =C2=B1 21%     -31.8%       2991 =C2=B1 13%  sched_debug.cfs_rq:=
/.min_vruntime.9
      6282 =C2=B1  1%     -21.0%       4963 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.avg
      3475 =C2=B1  1%     -30.5%       2416 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.min
     16.50 =C2=B1131%     -92.4%       1.25 =C2=B1173%  sched_debug.cfs_rq:=
/.runnable_load_avg.5
     -5301 =C2=B1-20%     -51.4%      -2577 =C2=B1-23%  sched_debug.cfs_rq:=
/.spread0.12
     -5063 =C2=B1-22%     -39.0%      -3089 =C2=B1-20%  sched_debug.cfs_rq:=
/.spread0.15
     -2654 =C2=B1-32%     -90.8%    -243.56 =C2=B1-336%  sched_debug.cfs_rq=
:/.spread0.6
     -4501 =C2=B1-22%     -30.4%      -3134 =C2=B1-10%  sched_debug.cfs_rq:=
/.spread0.8
     15693 =C2=B1  8%     -11.6%      13871 =C2=B1  9%  sched_debug.cpu.nr_=
load_updates.0
     10558 =C2=B1  3%     -13.3%       9151 =C2=B1  2%  sched_debug.cpu.nr_=
load_updates.10
     10664 =C2=B1  1%     -14.9%       9070 =C2=B1  2%  sched_debug.cpu.nr_=
load_updates.11
     10412 =C2=B1  1%     -12.2%       9140 =C2=B1  1%  sched_debug.cpu.nr_=
load_updates.12
     10568 =C2=B1  0%     -13.5%       9144 =C2=B1  1%  sched_debug.cpu.nr_=
load_updates.13
     10602 =C2=B1  0%     -14.5%       9068 =C2=B1  2%  sched_debug.cpu.nr_=
load_updates.15
     14807 =C2=B1  9%     -21.5%      11625 =C2=B1  9%  sched_debug.cpu.nr_=
load_updates.3
     14728 =C2=B1  9%     -16.2%      12336 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.4
     13550 =C2=B1  9%     -16.9%      11264 =C2=B1 10%  sched_debug.cpu.nr_=
load_updates.5
     10461 =C2=B1  1%     -11.5%       9259 =C2=B1  2%  sched_debug.cpu.nr_=
load_updates.8
     10854 =C2=B1  1%     -15.0%       9222 =C2=B1  1%  sched_debug.cpu.nr_=
load_updates.9
     12483 =C2=B1  0%     -11.9%      11002 =C2=B1  0%  sched_debug.cpu.nr_=
load_updates.avg
     10206 =C2=B1  1%     -17.0%       8471 =C2=B1  2%  sched_debug.cpu.nr_=
load_updates.min
     70384 =C2=B1  1%     -10.9%      62687 =C2=B1  4%  sched_debug.cpu.nr_=
switches.0
     37725 =C2=B1  1%     -19.1%      30535 =C2=B1  2%  sched_debug.cpu.nr_=
switches.11
     40729 =C2=B1  4%      -9.3%      36933 =C2=B1  2%  sched_debug.cpu.nr_=
switches.12
     38235 =C2=B1  2%     -20.2%      30507 =C2=B1  1%  sched_debug.cpu.nr_=
switches.13
     38149 =C2=B1  0%     -21.6%      29911 =C2=B1  2%  sched_debug.cpu.nr_=
switches.15
     62122 =C2=B1  6%     -20.8%      49171 =C2=B1  5%  sched_debug.cpu.nr_=
switches.3
     67546 =C2=B1  5%     -15.2%      57293 =C2=B1  4%  sched_debug.cpu.nr_=
switches.4
     63223 =C2=B1  7%     -18.4%      51620 =C2=B1  4%  sched_debug.cpu.nr_=
switches.5
     39171 =C2=B1  3%     -23.5%      29966 =C2=B1  1%  sched_debug.cpu.nr_=
switches.9
     52157 =C2=B1  1%     -13.3%      45227 =C2=B1  1%  sched_debug.cpu.nr_=
switches.avg
     73302 =C2=B1  2%      -8.5%      67039 =C2=B1  1%  sched_debug.cpu.nr_=
switches.max
     37405 =C2=B1  1%     -20.7%      29653 =C2=B1  1%  sched_debug.cpu.nr_=
switches.min
    -11351 =C2=B1 -6%     -41.6%      -6624 =C2=B1 -5%  sched_debug.cpu.nr_=
uninterruptible.0
      2139 =C2=B1  7%     -25.9%       1584 =C2=B1  8%  sched_debug.cpu.nr_=
uninterruptible.10
      2171 =C2=B1  7%     -41.3%       1274 =C2=B1  9%  sched_debug.cpu.nr_=
uninterruptible.11
      2160 =C2=B1  9%     -14.2%       1854 =C2=B1  2%  sched_debug.cpu.nr_=
uninterruptible.12
      2336 =C2=B1  9%     -40.1%       1400 =C2=B1  5%  sched_debug.cpu.nr_=
uninterruptible.13
      2344 =C2=B1  9%     -19.5%       1886 =C2=B1  4%  sched_debug.cpu.nr_=
uninterruptible.14
      2254 =C2=B1  5%     -37.5%       1408 =C2=B1  5%  sched_debug.cpu.nr_=
uninterruptible.15
     -1447 =C2=B1 -5%     -18.8%      -1174 =C2=B1-13%  sched_debug.cpu.nr_=
uninterruptible.3
   -187.00 =C2=B1-92%    +111.1%    -394.75 =C2=B1-18%  sched_debug.cpu.nr_=
uninterruptible.4
     -1690 =C2=B1 -4%     -30.0%      -1182 =C2=B1-10%  sched_debug.cpu.nr_=
uninterruptible.5
     -1455 =C2=B1 -9%     -18.4%      -1187 =C2=B1 -7%  sched_debug.cpu.nr_=
uninterruptible.7
      1982 =C2=B1  2%     -33.2%       1323 =C2=B1 12%  sched_debug.cpu.nr_=
uninterruptible.8
      2342 =C2=B1  5%     -38.6%       1438 =C2=B1  2%  sched_debug.cpu.nr_=
uninterruptible.9
      2513 =C2=B1  8%     -23.1%       1934 =C2=B1  2%  sched_debug.cpu.nr_=
uninterruptible.max
    -11352 =C2=B1 -6%     -41.6%      -6625 =C2=B1 -5%  sched_debug.cpu.nr_=
uninterruptible.min
      3333 =C2=B1  5%     -37.8%       2074 =C2=B1  3%  sched_debug.cpu.nr_=
uninterruptible.stddev
     64594 =C2=B1  4%     -13.4%      55961 =C2=B1  9%  sched_debug.cpu.sch=
ed_count.1
     37747 =C2=B1  1%     -19.1%      30556 =C2=B1  2%  sched_debug.cpu.sch=
ed_count.11
     40752 =C2=B1  4%      -9.3%      36955 =C2=B1  2%  sched_debug.cpu.sch=
ed_count.12
     38258 =C2=B1  2%     -19.7%      30739 =C2=B1  0%  sched_debug.cpu.sch=
ed_count.13
     38303 =C2=B1  1%     -21.9%      29929 =C2=B1  2%  sched_debug.cpu.sch=
ed_count.15
     65140 =C2=B1  8%     -21.6%      51079 =C2=B1  6%  sched_debug.cpu.sch=
ed_count.3
     83422 =C2=B1 34%     -29.9%      58520 =C2=B1  3%  sched_debug.cpu.sch=
ed_count.4
     95088 =C2=B1 36%     -41.7%      55482 =C2=B1 13%  sched_debug.cpu.sch=
ed_count.7
     39933 =C2=B1  6%     -24.9%      29988 =C2=B1  1%  sched_debug.cpu.sch=
ed_count.9
     37427 =C2=B1  1%     -20.7%      29673 =C2=B1  1%  sched_debug.cpu.sch=
ed_count.min
     30342 =C2=B1  1%     -10.4%      27183 =C2=B1  4%  sched_debug.cpu.sch=
ed_goidle.0
     16587 =C2=B1 13%     -15.6%      14005 =C2=B1  4%  sched_debug.cpu.sch=
ed_goidle.10
     15173 =C2=B1  1%     -19.2%      12260 =C2=B1  2%  sched_debug.cpu.sch=
ed_goidle.11
     15803 =C2=B1  4%     -10.5%      14137 =C2=B1  1%  sched_debug.cpu.sch=
ed_goidle.12
     15371 =C2=B1  2%     -20.6%      12208 =C2=B1  1%  sched_debug.cpu.sch=
ed_goidle.13
     15353 =C2=B1  1%     -22.9%      11829 =C2=B1  2%  sched_debug.cpu.sch=
ed_goidle.15
     27813 =C2=B1  6%     -22.0%      21689 =C2=B1  5%  sched_debug.cpu.sch=
ed_goidle.3
     29571 =C2=B1  6%     -17.0%      24532 =C2=B1  4%  sched_debug.cpu.sch=
ed_goidle.4
     28495 =C2=B1  8%     -19.8%      22843 =C2=B1  5%  sched_debug.cpu.sch=
ed_goidle.5
     15828 =C2=B1  3%     -24.9%      11887 =C2=B1  2%  sched_debug.cpu.sch=
ed_goidle.9
     22047 =C2=B1  1%     -14.3%      18903 =C2=B1  0%  sched_debug.cpu.sch=
ed_goidle.avg
     32479 =C2=B1  3%      -8.7%      29652 =C2=B1  3%  sched_debug.cpu.sch=
ed_goidle.max
     14845 =C2=B1  1%     -20.9%      11738 =C2=B1  1%  sched_debug.cpu.sch=
ed_goidle.min
     34654 =C2=B1  7%     -21.2%      27307 =C2=B1  7%  sched_debug.cpu.ttw=
u_count.1
     18674 =C2=B1  8%     -18.4%      15244 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.10
     16391 =C2=B1  3%     -15.9%      13784 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.11
     18849 =C2=B1  6%     -15.1%      16000 =C2=B1  4%  sched_debug.cpu.ttw=
u_count.12
     19348 =C2=B1 18%     -25.2%      14469 =C2=B1 10%  sched_debug.cpu.ttw=
u_count.13
     34534 =C2=B1  4%     -24.5%      26061 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.3
     34388 =C2=B1  3%     -20.8%      27222 =C2=B1  8%  sched_debug.cpu.ttw=
u_count.5
     33995 =C2=B1  2%     -18.2%      27821 =C2=B1  6%  sched_debug.cpu.ttw=
u_count.7
     17553 =C2=B1  7%      -9.8%      15835 =C2=B1  1%  sched_debug.cpu.ttw=
u_count.8
     17278 =C2=B1  3%     -15.5%      14604 =C2=B1  7%  sched_debug.cpu.ttw=
u_count.9
     29489 =C2=B1  1%     -12.9%      25686 =C2=B1  1%  sched_debug.cpu.ttw=
u_count.avg
     16005 =C2=B1  1%     -18.1%      13115 =C2=B1  1%  sched_debug.cpu.ttw=
u_count.min
     28738 =C2=B1  1%     -21.6%      22523 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.0
      4013 =C2=B1  2%      -9.8%       3620 =C2=B1  1%  sched_debug.cpu.ttw=
u_local.13
      4091 =C2=B1  0%     -10.2%       3674 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.15
      8228 =C2=B1 16%     -26.4%       6054 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.3
      4115 =C2=B1  5%     -13.8%       3547 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.9
      7392 =C2=B1  1%     -10.8%       6593 =C2=B1  1%  sched_debug.cpu.ttw=
u_local.avg
     29446 =C2=B1  2%     -19.4%      23729 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.max
      3903 =C2=B1  0%     -13.4%       3382 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.min
      6008 =C2=B1  2%     -21.6%       4709 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.stddev

lkp-ne04: Nehalem-EP
Memory: 12G

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

--===============3344115390503112254==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogZnNtYXJrCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9uaXRv
cgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0
YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBw
cm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50
ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAg
YmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6IAog
IGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1ZzoK
ICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiBwZXJmb3JtYW5jZQpkZWZhdWx0LXdh
dGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogOTU3ZWZiMGMyMTQ0
Y2M1ZmYxNzk1ZjQzYmYyZDJjYTQzMGVhYTIyNwptb2RlbDogTmVoYWxlbS1FUAptZW1vcnk6IDEy
RwpoZGRfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtU1QzNTAwNTE0TlNfOVdKMDNF
QkEtcGFydDMiCnN3YXBfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtU1QzMTIwMDI2
QVNfNU1TMDdIQTItcGFydDIiCnJvb3Rmc19wYXJ0aXRpb246ICIvZGV2L2Rpc2svYnktaWQvYXRh
LVNUMzUwMDUxNE5TXzlXSjAzRUJBLXBhcnQxIgpjYXRlZ29yeTogYmVuY2htYXJrCml0ZXJhdGlv
bnM6IDF4Cm5yX3RocmVhZHM6IDMydApkaXNrOiAxSERECmZzOiBmMmZzCmZzMjogCmZzbWFyazoK
ICBmaWxlc2l6ZTogOUIKICB0ZXN0X3NpemU6IDQwME0KICBzeW5jX21ldGhvZDogZnN5bmNCZWZv
cmVDbG9zZQogIG5yX2RpcmVjdG9yaWVzOiAxNmQKICBucl9maWxlc19wZXJfZGlyZWN0b3J5OiAy
NTZmcGQKcXVldWU6IGJpc2VjdAp0ZXN0Ym94OiBsa3AtbmUwNAp0Ym94X2dyb3VwOiBsa3AtbmUw
NAprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTYtMDEtMTAgMjA6NTM6MzYu
ODA3MjAzNTkzICswODowMAppZDogYzA0OGYwODdjZDY5ZWJlMmRmODg3NmVmZmYzMmZhZmVhZjJi
NzVmOQp1c2VyOiBsa3AKY29tcGlsZXI6IGdjYy00LjkKaGVhZF9jb21taXQ6IDg5ZTRlNzEzNGQ3
ZTUyYzljZGIxZTJmODI0YjgxMWVlODVmOTBhNjkKYmFzZV9jb21taXQ6IDE2ODMwOTg1NWE3ZDFl
MTZkYjc1MWU5YzY0NzExOWZlMmQyZGM4NzgKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3Vy
bHktMjAxNjAxMTAwMApyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oKcmVzdWx0
X3Jvb3Q6ICIvcmVzdWx0L2ZzbWFyay9wZXJmb3JtYW5jZS0xeC0zMnQtMUhERC1mMmZzLTlCLTQw
ME0tZnN5bmNCZWZvcmVDbG9zZS0xNmQtMjU2ZnBkL2xrcC1uZTA0L2RlYmlhbi14ODZfNjQtMjAx
NS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS85NTdlZmIwYzIxNDRjYzVmZjE3OTVmNDNi
ZjJkMmNhNDMwZWFhMjI3LzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvbGtwLW5lMDQvYmlz
ZWN0X2ZzbWFyay1wZXJmb3JtYW5jZS0xeC0zMnQtMUhERC1mMmZzLTlCLTQwME0tZnN5bmNCZWZv
cmVDbG9zZS0xNmQtMjU2ZnBkLWRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJo
ZWwtOTU3ZWZiMGMyMTQ0Y2M1ZmYxNzk1ZjQzYmYyZDJjYTQzMGVhYTIyNy0yMDE2MDExMC02OTgx
NS1hdXNiZDItMC55YW1sIgpucl9jcHU6ICIkKG5wcm9jKSIKbWF4X3VwdGltZTogODg1LjgxOTk5
OTk5OTk5OTkKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBq
b2I9L2xrcC9zY2hlZHVsZWQvbGtwLW5lMDQvYmlzZWN0X2ZzbWFyay1wZXJmb3JtYW5jZS0xeC0z
MnQtMUhERC1mMmZzLTlCLTQwME0tZnN5bmNCZWZvcmVDbG9zZS0xNmQtMjU2ZnBkLWRlYmlhbi14
ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtOTU3ZWZiMGMyMTQ0Y2M1ZmYxNzk1ZjQz
YmYyZDJjYTQzMGVhYTIyNy0yMDE2MDExMC02OTgxNS1hdXNiZDItMC55YW1sCi0gQVJDSD14ODZf
NjQKLSBrY29uZmlnPXg4Nl82NC1yaGVsCi0gYnJhbmNoPWxpbnV4LWRldmVsL2RldmVsLWhvdXJs
eS0yMDE2MDExMDAwCi0gY29tbWl0PTk1N2VmYjBjMjE0NGNjNWZmMTc5NWY0M2JmMmQyY2E0MzBl
YWEyMjcKLSBCT09UX0lNQUdFPS9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS85NTdlZmIw
YzIxNDRjYzVmZjE3OTVmNDNiZjJkMmNhNDMwZWFhMjI3L3ZtbGludXotNC40LjAtcmMzLTAwMzEx
LWc5NTdlZmIwCi0gbWF4X3VwdGltZT04ODUKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L2ZzbWFyay9w
ZXJmb3JtYW5jZS0xeC0zMnQtMUhERC1mMmZzLTlCLTQwME0tZnN5bmNCZWZvcmVDbG9zZS0xNmQt
MjU2ZnBkL2xrcC1uZTA0L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwv
Z2NjLTQuOS85NTdlZmIwYzIxNDRjYzVmZjE3OTVmNDNiZjJkMmNhNDMwZWFhMjI3LzAKLSBMS1Bf
U0VSVkVSPWlubgotIHwyLQoKCiAgZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIHN5c3RlbWQubG9n
X2xldmVsPWVycgogIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRh
dGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9
MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFt
ZGlzaz0wCiAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwKCiAg
cncKbGtwX2luaXRyZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2luaXRyZDog
Ii9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS85NTdlZmIwYzIxNDRjYzVmZjE3OTVmNDNi
ZjJkMmNhNDMwZWFhMjI3L21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2Rl
Ymlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14
ODZfNjQtMjAxNS0wMi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlh
bi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvdHVy
Ym9zdGF0LmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovZnMu
Y2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9mczIuY2d6LC9s
a3AvYmVuY2htYXJrcy9mc21hcmsuY2d6IgpsaW51eF9oZWFkZXJzX2luaXRyZDogIi9wa2cvbGlu
dXgveDg2XzY0LXJoZWwvZ2NjLTQuOS85NTdlZmIwYzIxNDRjYzVmZjE3OTVmNDNiZjJkMmNhNDMw
ZWFhMjI3L2xpbnV4LWhlYWRlcnMuY2d6IgpyZXBlYXRfdG86IDIKa2VybmVsOiAiL3BrZy9saW51
eC94ODZfNjQtcmhlbC9nY2MtNC45Lzk1N2VmYjBjMjE0NGNjNWZmMTc5NWY0M2JmMmQyY2E0MzBl
YWEyMjcvdm1saW51ei00LjQuMC1yYzMtMDAzMTEtZzk1N2VmYjAiCmRlcXVldWVfdGltZTogMjAx
Ni0wMS0xMCAyMTowMzoyNS4zMjc0NzMzMjAgKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9h
ZGF2ZzogMTguOTEgNy4zMiAyLjY2IDIvMjU0IDMxMTIKc3RhcnRfdGltZTogJzE0NTI0MzEwNDQn
CmVuZF90aW1lOiAnMTQ1MjQzMTEyNCcKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNjAxMDgt
MTcxNjU2Igo=

--===============3344115390503112254==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNi0wMS0xMCAyMTowNDowMSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0xMCAyMTowNDowMSBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMS0xMCAyMTowNDowMSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDEtMTAgMjE6MDQ6MDEgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTEwIDIxOjA0OjAxIGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMS0xMCAyMTowNDowMSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEt
MTAgMjE6MDQ6MDEgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTEwIDIxOjA0OjAxIGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMS0xMCAyMTowNDowMSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0xMCAy
MTowNDowMSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1My9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0xMCAyMTowNDowMSBlY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMS0xMCAyMTowNDowMSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0xMCAyMTowNDow
MSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ni9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0xMCAyMTowNDowMSBlY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAx
Ni0wMS0xMCAyMTowNDowMSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0xMCAyMTowNDowMSBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMS0xMCAyMTowNDowMSBta2ZzIC10IGYyZnMgL2Rldi9zZGEzCjIw
MTYtMDEtMTAgMjE6MDQ6MDMgbW91bnQgLXQgZjJmcyAvZGV2L3NkYTMgL2ZzL3NkYTMKMjAxNi0w
MS0xMCAyMTowNDowNCAuL2ZzX21hcmsgLWQgL2ZzL3NkYTMvMSAtZCAvZnMvc2RhMy8yIC1kIC9m
cy9zZGEzLzMgLWQgL2ZzL3NkYTMvNCAtZCAvZnMvc2RhMy81IC1kIC9mcy9zZGEzLzYgLWQgL2Zz
L3NkYTMvNyAtZCAvZnMvc2RhMy84IC1kIC9mcy9zZGEzLzkgLWQgL2ZzL3NkYTMvMTAgLWQgL2Zz
L3NkYTMvMTEgLWQgL2ZzL3NkYTMvMTIgLWQgL2ZzL3NkYTMvMTMgLWQgL2ZzL3NkYTMvMTQgLWQg
L2ZzL3NkYTMvMTUgLWQgL2ZzL3NkYTMvMTYgLWQgL2ZzL3NkYTMvMTcgLWQgL2ZzL3NkYTMvMTgg
LWQgL2ZzL3NkYTMvMTkgLWQgL2ZzL3NkYTMvMjAgLWQgL2ZzL3NkYTMvMjEgLWQgL2ZzL3NkYTMv
MjIgLWQgL2ZzL3NkYTMvMjMgLWQgL2ZzL3NkYTMvMjQgLWQgL2ZzL3NkYTMvMjUgLWQgL2ZzL3Nk
YTMvMjYgLWQgL2ZzL3NkYTMvMjcgLWQgL2ZzL3NkYTMvMjggLWQgL2ZzL3NkYTMvMjkgLWQgL2Zz
L3NkYTMvMzAgLWQgL2ZzL3NkYTMvMzEgLWQgL2ZzL3NkYTMvMzIgLUQgMTYgLU4gMjU2IC1uIDMy
MDAgLUwgMSAtUyAxIC1zIDkK

--===============3344115390503112254==--

