Content-Type: multipart/mixed; boundary="===============1143470082025660554=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [sched] d4573c3e1c: -5.9% unixbench.score
Date: Sat, 22 Aug 2015 07:29:43 +0800
Message-ID: <874mjskyoo.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1143470082025660554==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit d4573c3e1c992668f5dcd57d1c2ced56ae9650b9 ("sched: Improve load balan=
cing in the presence of idle CPUs")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/test:
  nhm-white/unixbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/execl

commit: =

  dfbca41f347997e57048a53755611c8e2d792924
  d4573c3e1c992668f5dcd57d1c2ced56ae9650b9

dfbca41f347997e5 d4573c3e1c992668f5dcd57d1c =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      4725 =C2=B1  0%      -2.7%       4599 =C2=B1  0%  unixbench.score
   2123335 =C2=B1  0%      -1.7%    2087061 =C2=B1  0%  unixbench.time.invo=
luntary_context_switches
  99575417 =C2=B1  0%      -2.3%   97252046 =C2=B1  0%  unixbench.time.mino=
r_page_faults
    317.00 =C2=B1  0%      -2.2%     310.00 =C2=B1  0%  unixbench.time.perc=
ent_of_cpu_this_job_got
    515.93 =C2=B1  0%      -2.3%     504.21 =C2=B1  0%  unixbench.time.syst=
em_time
    450501 =C2=B1  0%      -4.9%     428319 =C2=B1  0%  unixbench.time.volu=
ntary_context_switches
    301368 =C2=B1  0%     -11.4%     267086 =C2=B1  0%  softirqs.SCHED
  49172197 =C2=B1  0%     -10.0%   44274425 =C2=B1  0%  cpuidle.C1E-NHM.time
    613281 =C2=B1  0%     -17.6%     505485 =C2=B1  0%  cpuidle.C1E-NHM.usa=
ge
    232695 =C2=B1  5%     -12.9%     202734 =C2=B1  1%  latency_stats.sum.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do_m=
unmap.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.syste=
m_call_fastpath
    470921 =C2=B1  2%     -10.7%     420710 =C2=B1  1%  latency_stats.sum.c=
all_rwsem_down_write_failed.vma_adjust.__split_vma.split_vma.mprotect_fixup=
.SyS_mprotect.system_call_fastpath
     42.74 =C2=B1  0%      -2.2%      41.81 =C2=B1  0%  turbostat.%Busy
      1232 =C2=B1  0%      -2.2%       1205 =C2=B1  0%  turbostat.Avg_MHz
     45.75 =C2=B1 33%    +100.0%      91.50 =C2=B1 17%  sched_debug.cfs_rq[=
1]:/.load
      1788 =C2=B1 22%     -64.0%     644.25 =C2=B1 61%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
      1950 =C2=B1 22%     -62.9%     724.00 =C2=B1 55%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
   -315.00 =C2=B1 -5%     +13.1%    -356.25 =C2=B1 -5%  sched_debug.cpu#0.n=
r_uninterruptible
     69.00 =C2=B1  6%     +12.3%      77.50 =C2=B1  4%  sched_debug.cpu#1.c=
pu_load[3]
     45.75 =C2=B1 33%    +100.0%      91.50 =C2=B1 17%  sched_debug.cpu#1.l=
oad
    449022 =C2=B1  6%     +15.4%     518171 =C2=B1  4%  sched_debug.cpu#2.a=
vg_idle
    624.00 =C2=B1 62%    +115.9%       1347 =C2=B1 26%  sched_debug.cpu#2.c=
urr->pid
   -403.75 =C2=B1 -4%     +26.9%    -512.25 =C2=B1 -9%  sched_debug.cpu#2.n=
r_uninterruptible
   -433.00 =C2=B1 -4%     +18.0%    -511.00 =C2=B1-11%  sched_debug.cpu#3.n=
r_uninterruptible
    315.50 =C2=B1  6%     +31.5%     415.00 =C2=B1  9%  sched_debug.cpu#4.n=
r_uninterruptible
    399.00 =C2=B1  4%     +18.2%     471.75 =C2=B1  7%  sched_debug.cpu#5.n=
r_uninterruptible
    407.50 =C2=B1  0%     +18.6%     483.25 =C2=B1  4%  sched_debug.cpu#6.n=
r_uninterruptible
    402.00 =C2=B1  8%     +20.8%     485.50 =C2=B1  2%  sched_debug.cpu#7.n=
r_uninterruptible

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  lituya/unixbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/perform=
ance/execl

commit: =

  dfbca41f347997e57048a53755611c8e2d792924
  d4573c3e1c992668f5dcd57d1c2ced56ae9650b9

dfbca41f347997e5 d4573c3e1c992668f5dcd57d1c =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     10886 =C2=B1  0%      -5.9%      10249 =C2=B1  0%  unixbench.score
   4700905 =C2=B1  0%      -4.9%    4468392 =C2=B1  0%  unixbench.time.invo=
luntary_context_switches
  2.16e+08 =C2=B1  0%      -5.4%  2.044e+08 =C2=B1  0%  unixbench.time.mino=
r_page_faults
    554.50 =C2=B1  0%      -9.9%     499.50 =C2=B1  2%  unixbench.time.perc=
ent_of_cpu_this_job_got
    902.06 =C2=B1  0%      -8.1%     828.84 =C2=B1  0%  unixbench.time.syst=
em_time
    192.66 =C2=B1  0%      -7.6%     177.94 =C2=B1  0%  unixbench.time.user=
_time
   2695111 =C2=B1  0%     -10.9%    2400967 =C2=B1  3%  unixbench.time.volu=
ntary_context_switches
    525929 =C2=B1  0%     -25.9%     389861 =C2=B1  1%  softirqs.SCHED
   2695111 =C2=B1  0%     -10.9%    2400967 =C2=B1  3%  time.voluntary_cont=
ext_switches
    121703 =C2=B1  0%      -6.6%     113648 =C2=B1  2%  vmstat.system.cs
     26498 =C2=B1  0%      -6.2%      24852 =C2=B1  2%  vmstat.system.in
   6429895 =C2=B1  0%      -9.8%    5800792 =C2=B1  0%  cpuidle.C1-HSW.usage
   1927178 =C2=B1  0%     -20.6%    1529231 =C2=B1  1%  cpuidle.C1E-HSW.usa=
ge
  50019600 =C2=B1  3%     +92.3%   96177564 =C2=B1  4%  cpuidle.C3-HSW.time
    721114 =C2=B1  2%     +40.6%    1013620 =C2=B1  4%  cpuidle.C3-HSW.usage
    928033 =C2=B1  2%     +13.8%    1056036 =C2=B1  2%  cpuidle.C6-HSW.usage
     36.80 =C2=B1  0%      -9.6%      33.28 =C2=B1  2%  turbostat.%Busy
      1214 =C2=B1  0%      -9.5%       1098 =C2=B1  2%  turbostat.Avg_MHz
      0.07 =C2=B1 14%     +85.7%       0.13 =C2=B1 35%  turbostat.Pkg%pc2
      3.68 =C2=B1 10%     +85.5%       6.83 =C2=B1 35%  turbostat.Pkg%pc6
     53.85 =C2=B1  0%      -4.2%      51.61 =C2=B1  2%  turbostat.PkgWatt
      0.00 =C2=B1 -1%      +Inf%    4318915 =C2=B1150%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.new_sync_write.=
vfs_write.SyS_write.system_call_fastpath
     11715 =C2=B1101%   +3928.9%     471985 =C2=B1157%  latency_stats.avg.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_fdatawait.sync_inodes_sb.sy=
nc_inodes_one_sb.iterate_supers.sys_sync.system_call_fastpath
      0.00 =C2=B1 -1%      +Inf%    4717643 =C2=B1134%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.new_sync_write.=
vfs_write.SyS_write.system_call_fastpath
     91245 =C2=B1109%   +4137.1%    3866124 =C2=B1152%  latency_stats.max.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_fdatawait.sync_inodes_sb.sy=
nc_inodes_one_sb.iterate_supers.sys_sync.system_call_fastpath
      0.00 =C2=B1 -1%      +Inf%    4757271 =C2=B1133%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.new_sync_write.=
vfs_write.SyS_write.system_call_fastpath
     19114 =C2=B1158%     -71.4%       5475 =C2=B1 67%  latency_stats.sum.s=
ync_inodes_sb.sync_inodes_one_sb.iterate_supers.sys_sync.system_call_fastpa=
th
    109615 =C2=B1 98%   +3435.2%    3875132 =C2=B1152%  latency_stats.sum.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_fdatawait.sync_inodes_sb.sy=
nc_inodes_one_sb.iterate_supers.sys_sync.system_call_fastpath
     22954 =C2=B1  4%     -10.8%      20484 =C2=B1  9%  sched_debug.cfs_rq[=
0]:/.exec_clock
    306157 =C2=B1  0%     -13.1%     266065 =C2=B1  5%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     20641 =C2=B1 11%     -27.2%      15036 =C2=B1 20%  sched_debug.cfs_rq[=
10]:/.avg->runnable_avg_sum
     19987 =C2=B1  4%     -11.2%      17751 =C2=B1  6%  sched_debug.cfs_rq[=
10]:/.exec_clock
    300899 =C2=B1  0%     -12.5%     263419 =C2=B1  5%  sched_debug.cfs_rq[=
10]:/.min_vruntime
    452.50 =C2=B1 11%     -27.6%     327.75 =C2=B1 20%  sched_debug.cfs_rq[=
10]:/.tg_runnable_contrib
    300940 =C2=B1  0%     -11.9%     265047 =C2=B1  5%  sched_debug.cfs_rq[=
11]:/.min_vruntime
     -5222 =C2=B1-16%     -80.4%      -1022 =C2=B1-175%  sched_debug.cfs_rq=
[11]:/.spread0
     19789 =C2=B1 11%     -21.2%      15590 =C2=B1 16%  sched_debug.cfs_rq[=
12]:/.avg->runnable_avg_sum
     20790 =C2=B1  3%     -14.4%      17801 =C2=B1  6%  sched_debug.cfs_rq[=
12]:/.exec_clock
    302961 =C2=B1  0%     -13.0%     263467 =C2=B1  5%  sched_debug.cfs_rq[=
12]:/.min_vruntime
    432.75 =C2=B1 11%     -21.3%     340.75 =C2=B1 17%  sched_debug.cfs_rq[=
12]:/.tg_runnable_contrib
     20451 =C2=B1  5%     -12.8%      17830 =C2=B1  6%  sched_debug.cfs_rq[=
13]:/.exec_clock
    302744 =C2=B1  1%     -12.7%     264381 =C2=B1  5%  sched_debug.cfs_rq[=
13]:/.min_vruntime
      1.75 =C2=B1 47%    +171.4%       4.75 =C2=B1 40%  sched_debug.cfs_rq[=
13]:/.nr_spread_over
     19559 =C2=B1  0%     -11.0%      17407 =C2=B1  4%  sched_debug.cfs_rq[=
14]:/.exec_clock
    300081 =C2=B1  0%     -12.3%     263170 =C2=B1  4%  sched_debug.cfs_rq[=
14]:/.min_vruntime
     -6082 =C2=B1-15%     -52.3%      -2900 =C2=B1-60%  sched_debug.cfs_rq[=
14]:/.spread0
    300413 =C2=B1  0%     -11.7%     265326 =C2=B1  4%  sched_debug.cfs_rq[=
15]:/.min_vruntime
     -5751 =C2=B1-18%     -87.0%    -745.73 =C2=B1-366%  sched_debug.cfs_rq=
[15]:/.spread0
    303798 =C2=B1  0%     -13.1%     264112 =C2=B1  4%  sched_debug.cfs_rq[=
1]:/.min_vruntime
     84.00 =C2=B1100%    +229.5%     276.75 =C2=B1 63%  sched_debug.cfs_rq[=
1]:/.utilization_load_avg
    302656 =C2=B1  0%     -12.1%     266065 =C2=B1  5%  sched_debug.cfs_rq[=
2]:/.min_vruntime
     -3502 =C2=B1-17%    -100.0%      -1.05 =C2=B1-196837%  sched_debug.cfs=
_rq[2]:/.spread0
     19933 =C2=B1  3%     -13.5%      17238 =C2=B1  3%  sched_debug.cfs_rq[=
3]:/.exec_clock
    305206 =C2=B1  0%     -12.8%     265991 =C2=B1  4%  sched_debug.cfs_rq[=
3]:/.min_vruntime
     20973 =C2=B1  6%     -24.6%      15805 =C2=B1 18%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum
     20068 =C2=B1  5%     -11.5%      17767 =C2=B1  5%  sched_debug.cfs_rq[=
4]:/.exec_clock
    305752 =C2=B1  0%     -12.9%     266399 =C2=B1  5%  sched_debug.cfs_rq[=
4]:/.min_vruntime
    461.50 =C2=B1  6%     -25.0%     346.25 =C2=B1 18%  sched_debug.cfs_rq[=
4]:/.tg_runnable_contrib
    303317 =C2=B1  0%     -12.6%     264993 =C2=B1  5%  sched_debug.cfs_rq[=
5]:/.min_vruntime
     -2842 =C2=B1-35%     -62.2%      -1073 =C2=B1-105%  sched_debug.cfs_rq=
[5]:/.spread0
     20814 =C2=B1  9%     -21.2%      16410 =C2=B1 26%  sched_debug.cfs_rq[=
6]:/.avg->runnable_avg_sum
     19473 =C2=B1  0%     -10.9%      17351 =C2=B1  4%  sched_debug.cfs_rq[=
6]:/.exec_clock
    304159 =C2=B1  0%     -12.7%     265678 =C2=B1  5%  sched_debug.cfs_rq[=
6]:/.min_vruntime
    455.75 =C2=B1  9%     -21.0%     360.00 =C2=B1 26%  sched_debug.cfs_rq[=
6]:/.tg_runnable_contrib
    304471 =C2=B1  0%     -11.9%     268359 =C2=B1  4%  sched_debug.cfs_rq[=
7]:/.min_vruntime
    298485 =C2=B1  0%     -13.3%     258901 =C2=B1  3%  sched_debug.cfs_rq[=
8]:/.min_vruntime
     18.00 =C2=B1 29%    +356.9%      82.25 =C2=B1 51%  sched_debug.cfs_rq[=
8]:/.runnable_load_avg
    231.00 =C2=B1 30%    +116.6%     500.25 =C2=B1 20%  sched_debug.cfs_rq[=
8]:/.utilization_load_avg
     19913 =C2=B1  3%     -13.2%      17285 =C2=B1  4%  sched_debug.cfs_rq[=
9]:/.exec_clock
     14.00 =C2=B1 35%    +250.0%      49.00 =C2=B1 39%  sched_debug.cfs_rq[=
9]:/.load
    300167 =C2=B1  0%     -13.1%     260832 =C2=B1  4%  sched_debug.cfs_rq[=
9]:/.min_vruntime
     -1710 =C2=B1 -2%     -23.6%      -1306 =C2=B1-13%  sched_debug.cpu#0.n=
r_uninterruptible
    158575 =C2=B1  6%     -11.5%     140360 =C2=B1  1%  sched_debug.cpu#1.t=
twu_count
    553112 =C2=B1 72%     -45.1%     303486 =C2=B1  5%  sched_debug.cpu#10.=
nr_switches
    554861 =C2=B1 72%     -45.1%     304840 =C2=B1  5%  sched_debug.cpu#10.=
sched_count
     27.00 =C2=B1 10%     -20.4%      21.50 =C2=B1 13%  sched_debug.cpu#12.=
cpu_load[4]
    186234 =C2=B1 90%     -58.3%      77602 =C2=B1  7%  sched_debug.cpu#12.=
ttwu_local
     20.50 =C2=B1 21%     +48.8%      30.50 =C2=B1 18%  sched_debug.cpu#14.=
cpu_load[1]
     21.50 =C2=B1 21%     +58.1%      34.00 =C2=B1 19%  sched_debug.cpu#14.=
cpu_load[2]
     22.75 =C2=B1 14%     +44.0%      32.75 =C2=B1 17%  sched_debug.cpu#14.=
cpu_load[3]
    109416 =C2=B1  5%     -13.7%      94393 =C2=B1  4%  sched_debug.cpu#14.=
sched_goidle
    130439 =C2=B1  2%     -12.4%     114236 =C2=B1  4%  sched_debug.cpu#14.=
ttwu_count
     30.50 =C2=B1101%    +301.6%     122.50 =C2=B1 25%  sched_debug.cpu#2.c=
pu_load[0]
     27.25 =C2=B1 47%    +209.2%      84.25 =C2=B1 34%  sched_debug.cpu#2.c=
pu_load[1]
     37.50 =C2=B1 27%     -32.7%      25.25 =C2=B1 21%  sched_debug.cpu#4.c=
pu_load[4]
     17.25 =C2=B1 43%    +362.3%      79.75 =C2=B1 56%  sched_debug.cpu#4.l=
oad
     57816 =C2=B1 15%     -15.3%      48950 =C2=B1  2%  sched_debug.cpu#4.n=
r_load_updates
   1220774 =C2=B1121%     -73.1%     328817 =C2=B1  6%  sched_debug.cpu#4.n=
r_switches
   1222807 =C2=B1121%     -73.0%     330486 =C2=B1  6%  sched_debug.cpu#4.s=
ched_count
    542794 =C2=B1133%     -78.8%     115250 =C2=B1  5%  sched_debug.cpu#4.s=
ched_goidle
    588622 =C2=B1125%     -76.2%     140136 =C2=B1  7%  sched_debug.cpu#4.t=
twu_count
    522443 =C2=B1142%     -84.6%      80605 =C2=B1  6%  sched_debug.cpu#4.t=
twu_local
    345322 =C2=B1  1%      -7.4%     319747 =C2=B1  4%  sched_debug.cpu#7.n=
r_switches
    347310 =C2=B1  1%      -7.5%     321411 =C2=B1  4%  sched_debug.cpu#7.s=
ched_count
    120552 =C2=B1  2%      -9.4%     109240 =C2=B1  4%  sched_debug.cpu#7.s=
ched_goidle
     14.00 =C2=B1 35%    +233.9%      46.75 =C2=B1 36%  sched_debug.cpu#9.l=
oad
    136971 =C2=B1 10%     -15.1%     116346 =C2=B1  1%  sched_debug.cpu#9.t=
twu_count
      0.14 =C2=B1 57%    +411.4%       0.72 =C2=B1 73%  sched_debug.rt_rq[1=
]:/.rt_time

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  lituya/unixbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/powersa=
ve/execl

commit: =

  dfbca41f347997e57048a53755611c8e2d792924
  d4573c3e1c992668f5dcd57d1c2ced56ae9650b9

dfbca41f347997e5 d4573c3e1c992668f5dcd57d1c =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     10563 =C2=B1  1%      -5.8%       9952 =C2=B1  0%  unixbench.score
   4414071 =C2=B1  1%      -5.2%    4184851 =C2=B1  0%  unixbench.time.invo=
luntary_context_switches
 2.028e+08 =C2=B1  1%      -5.5%  1.917e+08 =C2=B1  0%  unixbench.time.mino=
r_page_faults
    540.75 =C2=B1  1%      -7.2%     502.00 =C2=B1  0%  unixbench.time.perc=
ent_of_cpu_this_job_got
    882.57 =C2=B1  1%      -7.4%     816.95 =C2=B1  0%  unixbench.time.syst=
em_time
    188.00 =C2=B1  1%      -7.0%     174.82 =C2=B1  0%  unixbench.time.user=
_time
   2858074 =C2=B1  3%      -8.8%    2605521 =C2=B1  0%  unixbench.time.volu=
ntary_context_switches
    511610 =C2=B1  1%     -25.5%     381032 =C2=B1  0%  softirqs.SCHED
   2858074 =C2=B1  3%      -8.8%    2605521 =C2=B1  0%  time.voluntary_cont=
ext_switches
    118783 =C2=B1  0%      -4.6%     113276 =C2=B1  0%  vmstat.system.cs
     25883 =C2=B1  0%      -4.3%      24765 =C2=B1  0%  vmstat.system.in
    683238 =C2=B1  2%      -9.4%     619110 =C2=B1  0%  latency_stats.hits.=
call_rwsem_down_write_failed.vma_adjust.__split_vma.split_vma.mprotect_fixu=
p.SyS_mprotect.system_call_fastpath
     96234 =C2=B1  5%     -11.9%      84756 =C2=B1  1%  latency_stats.hits.=
wait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.han=
dle_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
    191410 =C2=B1  5%     -13.4%     165713 =C2=B1  1%  latency_stats.hits.=
wait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.han=
dle_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault.clea=
r_user.padzero.load_elf_binary
     36.16 =C2=B1  1%      -6.9%      33.68 =C2=B1  0%  turbostat.%Busy
      1148 =C2=B1  1%      -7.1%       1066 =C2=B1  0%  turbostat.Avg_MHz
     50.93 =C2=B1  0%      -1.4%      50.21 =C2=B1  0%  turbostat.PkgWatt
   1928029 =C2=B1  0%     -20.0%    1543361 =C2=B1  0%  cpuidle.C1E-HSW.usa=
ge
  55003420 =C2=B1  8%     +78.9%   98419263 =C2=B1  1%  cpuidle.C3-HSW.time
    799437 =C2=B1  7%     +33.2%    1064466 =C2=B1  1%  cpuidle.C3-HSW.usage
    873657 =C2=B1  3%     +11.9%     977668 =C2=B1  1%  cpuidle.C6-HSW.usage
     19945 =C2=B1  2%      -7.9%      18369 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.exec_clock
     21825 =C2=B1 10%     -18.4%      17818 =C2=B1  1%  sched_debug.cfs_rq[=
14]:/.avg->runnable_avg_sum
    478.50 =C2=B1 10%     -18.6%     389.50 =C2=B1  1%  sched_debug.cfs_rq[=
14]:/.tg_runnable_contrib
    942.75 =C2=B1 31%     -70.3%     280.00 =C2=B1 62%  sched_debug.cfs_rq[=
15]:/.blocked_load_avg
    958.25 =C2=B1 31%     -68.3%     303.75 =C2=B1 62%  sched_debug.cfs_rq[=
15]:/.tg_load_contrib
     20260 =C2=B1  7%      -9.5%      18339 =C2=B1  1%  sched_debug.cfs_rq[=
2]:/.exec_clock
    240.25 =C2=B1 43%    +185.7%     686.50 =C2=B1 49%  sched_debug.cfs_rq[=
2]:/.utilization_load_avg
     18628 =C2=B1  2%      -9.2%      16914 =C2=B1  5%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum
    405.75 =C2=B1  1%      -8.7%     370.50 =C2=B1  5%  sched_debug.cfs_rq[=
4]:/.tg_runnable_contrib
     19914 =C2=B1  4%     -12.0%      17521 =C2=B1  2%  sched_debug.cfs_rq[=
5]:/.exec_clock
     -2928 =C2=B1-101%    -146.4%       1357 =C2=B1 75%  sched_debug.cfs_rq=
[6]:/.spread0
     20113 =C2=B1  2%      -8.2%      18458 =C2=B1  3%  sched_debug.cfs_rq[=
7]:/.exec_clock
     -2088 =C2=B1-11%     -19.0%      -1691 =C2=B1 -3%  sched_debug.cpu#0.n=
r_uninterruptible
     14.25 =C2=B1 90%    +452.6%      78.75 =C2=B1 66%  sched_debug.cpu#1.c=
pu_load[0]
   1057371 =C2=B1117%     -70.1%     316240 =C2=B1  2%  sched_debug.cpu#1.n=
r_switches
   1059402 =C2=B1116%     -70.0%     317990 =C2=B1  2%  sched_debug.cpu#1.s=
ched_count
    472923 =C2=B1128%     -76.4%     111412 =C2=B1  3%  sched_debug.cpu#1.s=
ched_goidle
    507097 =C2=B1122%     -72.5%     139349 =C2=B1  3%  sched_debug.cpu#1.t=
twu_count
     27.50 =C2=B1 12%     +53.6%      42.25 =C2=B1 23%  sched_debug.cpu#11.=
cpu_load[3]
     28.00 =C2=B1 11%     +29.5%      36.25 =C2=B1 12%  sched_debug.cpu#11.=
cpu_load[4]
    603068 =C2=B1  3%     -23.4%     462150 =C2=B1 20%  sched_debug.cpu#13.=
avg_idle
    436039 =C2=B1 23%     +29.1%     563133 =C2=B1  2%  sched_debug.cpu#14.=
avg_idle
    402209 =C2=B1116%     -81.9%      72660 =C2=B1  3%  sched_debug.cpu#14.=
ttwu_local
     -2215 =C2=B1-11%     +13.7%      -2519 =C2=B1 -3%  sched_debug.cpu#2.n=
r_uninterruptible
     41.25 =C2=B1 26%     -35.2%      26.75 =C2=B1 10%  sched_debug.cpu#3.c=
pu_load[2]
     34.00 =C2=B1117%    +242.6%     116.50 =C2=B1 79%  sched_debug.cpu#4.l=
oad
     -2266 =C2=B1-13%     +16.9%      -2648 =C2=B1 -2%  sched_debug.cpu#4.n=
r_uninterruptible
    884.50 =C2=B1 33%     +44.8%       1280 =C2=B1 14%  sched_debug.cpu#5.c=
urr->pid
     -2219 =C2=B1 -7%     +11.4%      -2472 =C2=B1 -3%  sched_debug.cpu#5.n=
r_uninterruptible
     55415 =C2=B1 20%     -19.8%      44460 =C2=B1  0%  sched_debug.cpu#6.n=
r_load_updates
     -2350 =C2=B1 -8%     +14.2%      -2684 =C2=B1 -2%  sched_debug.cpu#6.n=
r_uninterruptible
    847343 =C2=B1 91%     -84.0%     135604 =C2=B1  2%  sched_debug.cpu#6.t=
twu_count
    784793 =C2=B1 99%     -90.3%      75880 =C2=B1  3%  sched_debug.cpu#6.t=
twu_local
     39.00 =C2=B1 14%     -30.1%      27.25 =C2=B1 23%  sched_debug.cpu#7.c=
pu_load[3]
     35.00 =C2=B1 11%     -22.1%      27.25 =C2=B1 12%  sched_debug.cpu#7.c=
pu_load[4]
    128907 =C2=B1  8%     -10.8%     114951 =C2=B1  2%  sched_debug.cpu#8.t=
twu_count
    624669 =C2=B1 88%     -56.2%     273343 =C2=B1  0%  sched_debug.cpu#9.n=
r_switches
    626375 =C2=B1 88%     -56.1%     274746 =C2=B1  0%  sched_debug.cpu#9.s=
ched_count
    262109 =C2=B1102%     -64.9%      92004 =C2=B1  1%  sched_debug.cpu#9.s=
ched_goidle
      2.11 =C2=B1  4%     +18.9%       2.50 =C2=B1  5%  sched_debug.rt_rq[0=
]:/.rt_time

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  lituya/unixbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/powersa=
ve/shell1

commit: =

  dfbca41f347997e57048a53755611c8e2d792924
  d4573c3e1c992668f5dcd57d1c2ced56ae9650b9

dfbca41f347997e5 d4573c3e1c992668f5dcd57d1c =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   5132876 =C2=B1  0%      +2.0%    5236374 =C2=B1  0%  unixbench.time.invo=
luntary_context_switches
      1571 =C2=B1  0%      +1.2%       1591 =C2=B1  0%  unixbench.time.syst=
em_time
    795.19 =C2=B1  0%      +1.3%     805.33 =C2=B1  0%  unixbench.time.user=
_time
    932469 =C2=B1  0%     -12.7%     813874 =C2=B1  0%  softirqs.SCHED
     18660 =C2=B1  0%      +1.7%      18975 =C2=B1  0%  vmstat.system.in
  15466776 =C2=B1  1%      -5.1%   14675901 =C2=B1  0%  latency_stats.sum.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.exit_mmap.mmput.f=
lush_old_exec.load_elf_binary.search_binary_handler.do_execveat_common.SyS_=
execve.stub_execve
   5322533 =C2=B1  1%      -8.5%    4868555 =C2=B1  1%  latency_stats.sum.c=
all_rwsem_down_write_failed.vma_adjust.__split_vma.do_munmap.mmap_region.do=
_mmap_pgoff.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.system_call_fastpath
  21589512 =C2=B1  1%      -7.4%   19993473 =C2=B1  1%  latency_stats.sum.c=
all_rwsem_down_write_failed.vma_adjust.__split_vma.split_vma.mprotect_fixup=
.SyS_mprotect.system_call_fastpath
   9791019 =C2=B1  1%      -8.2%    8988996 =C2=B1  1%  latency_stats.sum.c=
all_rwsem_down_write_failed.vma_link.mmap_region.do_mmap_pgoff.vm_mmap_pgof=
f.SyS_mmap_pgoff.SyS_mmap.system_call_fastpath
 4.135e+08 =C2=B1  0%      -3.0%  4.012e+08 =C2=B1  0%  latency_stats.sum.s=
igsuspend.SyS_rt_sigsuspend.system_call_fastpath
     24904 =C2=B1  4%     -25.2%      18617 =C2=B1 11%  sched_debug.cfs_rq[=
0]:/.blocked_load_avg
      8.75 =C2=B1 58%    +508.6%      53.25 =C2=B1106%  sched_debug.cfs_rq[=
0]:/.load
    391160 =C2=B1  1%     -11.4%     346400 =C2=B1  1%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
     25100 =C2=B1  4%     -25.2%      18770 =C2=B1 11%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
    390600 =C2=B1  1%     -11.1%     347123 =C2=B1  2%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
    391242 =C2=B1  1%     -11.7%     345453 =C2=B1  1%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
    390931 =C2=B1  1%     -11.5%     345958 =C2=B1  1%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
     23834 =C2=B1  5%     -17.3%      19701 =C2=B1 11%  sched_debug.cfs_rq[=
13]:/.blocked_load_avg
    390601 =C2=B1  1%     -11.7%     345060 =C2=B1  2%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
     24080 =C2=B1  5%     -17.7%      19823 =C2=B1 11%  sched_debug.cfs_rq[=
13]:/.tg_load_contrib
    390376 =C2=B1  1%     -11.5%     345360 =C2=B1  2%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
     23210 =C2=B1  5%     -12.3%      20347 =C2=B1  4%  sched_debug.cfs_rq[=
15]:/.blocked_load_avg
    390137 =C2=B1  0%     -11.4%     345480 =C2=B1  2%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
     23345 =C2=B1  5%     -12.4%      20458 =C2=B1  4%  sched_debug.cfs_rq[=
15]:/.tg_load_contrib
    390654 =C2=B1  1%     -11.4%     345993 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
     24857 =C2=B1  5%     -16.0%      20876 =C2=B1 19%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
    391340 =C2=B1  1%     -11.6%     346023 =C2=B1  2%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
     26275 =C2=B1  5%     -15.6%      22180 =C2=B1 19%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
    391666 =C2=B1  1%     -11.7%     345867 =C2=B1  2%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
     26369 =C2=B1  5%     -15.5%      22271 =C2=B1 19%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
    391430 =C2=B1  1%     -11.5%     346427 =C2=B1  2%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
    391321 =C2=B1  1%     -11.5%     346235 =C2=B1  2%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
     25744 =C2=B1  3%     -17.8%      21156 =C2=B1 14%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
      1.00 =C2=B1 70%    +225.0%       3.25 =C2=B1 25%  sched_debug.cfs_rq[=
6]:/.nr_spread_over
    389932 =C2=B1  1%     -11.1%     346764 =C2=B1  2%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
     25873 =C2=B1  3%     -17.6%      21329 =C2=B1 14%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
    389907 =C2=B1  1%     -11.0%     346962 =C2=B1  2%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
     23576 =C2=B1  4%     -20.0%      18853 =C2=B1 10%  sched_debug.cfs_rq[=
8]:/.blocked_load_avg
    390564 =C2=B1  1%     -11.1%     347109 =C2=B1  2%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
     23775 =C2=B1  3%     -20.3%      18937 =C2=B1 10%  sched_debug.cfs_rq[=
8]:/.tg_load_contrib
    391152 =C2=B1  1%     -11.2%     347502 =C2=B1  2%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
    450623 =C2=B1 16%     +28.9%     580722 =C2=B1  4%  sched_debug.cpu#0.a=
vg_idle
     29.75 =C2=B1 66%     -74.8%       7.50 =C2=B1 56%  sched_debug.cpu#12.=
load
    540.50 =C2=B1  6%     -15.5%     456.75 =C2=B1  3%  sched_debug.cpu#14.=
nr_uninterruptible
     88.25 =C2=B1 72%     -83.9%      14.25 =C2=B1 27%  sched_debug.cpu#2.c=
pu_load[0]
     61.00 =C2=B1 50%     -69.3%      18.75 =C2=B1 24%  sched_debug.cpu#2.c=
pu_load[1]
     46.00 =C2=B1 26%     -37.5%      28.75 =C2=B1 18%  sched_debug.cpu#3.c=
pu_load[2]
     30.00 =C2=B1 21%     +43.3%      43.00 =C2=B1 31%  sched_debug.cpu#6.c=
pu_load[2]
     21361 =C2=B1 16%     +72.5%      36844 =C2=B1 39%  sched_debug.cpu#8.c=
urr->pid


nhm-white: Nehalem
Memory: 6G

lituya: Grantley Haswell
Memory: 16G


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

--===============1143470082025660554==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogdW5peGJlbmNoCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogcHJlLXRlc3QKICB1
cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAKICBudW1hLXZt
c3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1zdGF0OgogICAg
aW50ZXJ2YWw6IDEwCiAgbWVtaW5mbzogCiAgc2xhYmluZm86IAogIGludGVycnVwdHM6IAogIGxv
Y2tfc3RhdDogCiAgbGF0ZW5jeV9zdGF0czogCiAgc29mdGlycXM6IAogIGJkaV9kZXZfbWFwcGlu
ZzogCiAgZGlza3N0YXRzOiAKICBuZnNzdGF0OiAKICBjcHVpZGxlOiAKICBjcHVmcmVxLXN0YXRz
OiAKICB0dXJib3N0YXQ6IAogIHBtZXRlcjogCiAgc2NoZWRfZGVidWc6CiAgICBpbnRlcnZhbDog
NjAKZGVmYXVsdC13YXRjaGRvZ3M6CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjcHVmcmVx
X2dvdmVybm9yOiBwZXJmb3JtYW5jZQpjb21taXQ6IGI5NTNjMGQyMzRiYzcyZTg0ODlkM2JmNTFh
Mjc2YzVjNGVjODUzNDUKbW9kZWw6IEdyYW50bGV5IEhhc3dlbGwKbnJfY3B1OiAxNgptZW1vcnk6
IDE2RwpoZGRfcGFydGl0aW9uczogCnN3YXBfcGFydGl0aW9uczogCnJvb3Rmc19wYXJ0aXRpb246
IAp1bml4YmVuY2g6CiAgdGVzdDogZXhlY2wKcXVldWU6IGN5Y2xpYwp0ZXN0Ym94OiBsaXR1eWEK
dGJveF9ncm91cDogbGl0dXlhCmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAx
NS0wNi0yMiAxMzo1NTo0OS44MDQ0NjYxMjggKzA4OjAwCnVzZXI6IGxrcApjb21waWxlcjogZ2Nj
LTQuOQpoZWFkX2NvbW1pdDogYWY4NDcyNmE0NTNiN2U5ZWQ4MThmZDI0MDg2ZGIyYmZmNzI3NjBj
NgpiYXNlX2NvbW1pdDogYjk1M2MwZDIzNGJjNzJlODQ4OWQzYmY1MWEyNzZjNWM0ZWM4NTM0NQpi
cmFuY2g6IG5leHQvbWFzdGVyCmtlcm5lbDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQu
OS9iOTUzYzBkMjM0YmM3MmU4NDg5ZDNiZjUxYTI3NmM1YzRlYzg1MzQ1L3ZtbGludXotNC4xLjAi
CnJvb3RmczogZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnegpyZXN1bHRfcm9vdDogIi9yZXN1
bHQvdW5peGJlbmNoL3BlcmZvcm1hbmNlLWV4ZWNsL2xpdHV5YS9kZWJpYW4teDg2XzY0LTIwMTUt
MDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvYjk1M2MwZDIzNGJjNzJlODQ4OWQzYmY1MWEy
NzZjNWM0ZWM4NTM0NS8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL2xpdHV5YS9jeWNsaWNf
dW5peGJlbmNoLXBlcmZvcm1hbmNlLWV4ZWNsLXg4Nl82NC1yaGVsLUNZQ0xJQ19CQVNFLWI5NTNj
MGQyMzRiYzcyZTg0ODlkM2JmNTFhMjc2YzVjNGVjODUzNDUtMC0yMDE1MDYyMi0xMDc2ODEtMWUx
ZDc3LnlhbWwiCmRlcXVldWVfdGltZTogMjAxNS0wNi0yMyAyMjoyMzo1MC43NTk4NzcwMDIgKzA4
OjAwCm1heF91cHRpbWU6IDE4OTEuMDgwMDAwMDAwMDAwMgppbml0cmQ6ICIvb3NpbWFnZS9kZWJp
YW4vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9v
dD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpvYj0vbGtwL3NjaGVkdWxlZC9saXR1eWEvY3ljbGlj
X3VuaXhiZW5jaC1wZXJmb3JtYW5jZS1leGVjbC14ODZfNjQtcmhlbC1DWUNMSUNfQkFTRS1iOTUz
YzBkMjM0YmM3MmU4NDg5ZDNiZjUxYTI3NmM1YzRlYzg1MzQ1LTAtMjAxNTA2MjItMTA3NjgxLTFl
MWQ3Ny55YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmlnPXg4Nl82NC1yaGVsCi0gYnJhbmNoPW5l
eHQvbWFzdGVyCi0gY29tbWl0PWI5NTNjMGQyMzRiYzcyZTg0ODlkM2JmNTFhMjc2YzVjNGVjODUz
NDUKLSBCT09UX0lNQUdFPS9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9iOTUzYzBkMjM0
YmM3MmU4NDg5ZDNiZjUxYTI3NmM1YzRlYzg1MzQ1L3ZtbGludXotNC4xLjAKLSBtYXhfdXB0aW1l
PTE4OTEKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L3VuaXhiZW5jaC9wZXJmb3JtYW5jZS1leGVjbC9s
aXR1eWEvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45L2I5
NTNjMGQyMzRiYzcyZTg0ODlkM2JmNTFhMjc2YzVjNGVjODUzNDUvMAotIExLUF9TRVJWRVI9aW5u
Ci0gfDItCgoKICBlYXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJy
CiAgZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1
X3N0YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRj
aGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNrPTAKICBj
b25zb2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwpsa3BfaW5p
dHJkOiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51
eC94ODZfNjQtcmhlbC9nY2MtNC45L2I5NTNjMGQyMzRiYzcyZTg0ODlkM2JmNTFhMjc2YzVjNGVj
ODUzNDUvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82
NC0yMDE1LTAyLTA3LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1
LTAyLTA3LmNnei9ydW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0y
MDE1LTAyLTA3LmNnei90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy90dXJib3N0YXQuY2d6
LC9sa3AvYmVuY2htYXJrcy91bml4YmVuY2guY2d6Igpqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRh
dmc6IDExLjIwIDQuMjQgMS41NiAxLzIxNyAzNjczCnN0YXJ0X3RpbWU6ICcxNDM1MDY5NDU3Jwpl
bmRfdGltZTogJzE0MzUwNjk2NTUnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTUwNjIzLTIx
MjQxMyIK

--===============1143470082025660554==
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
Y3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCi4vUnVuIGV4ZWNsCg==

--===============1143470082025660554==--

