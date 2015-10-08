Content-Type: multipart/mixed; boundary="===============1933309940142101919=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [mm] 72b252aed5: 97.3% vm-scalability.throughput
Date: Thu, 08 Oct 2015 11:23:53 +0800
Message-ID: <87y4fevy9i.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1933309940142101919==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 72b252aed506b8f1a03f7abd29caef4cdf6a043b ("mm: send one IPI per CPU =
to TLB flush all entries after unmapping pages")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/runtime/test:
  ivb43/vm-scalability/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/per=
formance/300s/mmap-pread-seq-mt

commit: =

  5b74283ab251b9db55cbbe31d19ca72482103290
  72b252aed506b8f1a03f7abd29caef4cdf6a043b

5b74283ab251b9db 72b252aed506b8f1a03f7abd29 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

  21438292 =C2=B1  0%     +97.3%   42301163 =C2=B1  3%  vm-scalability.thro=
ughput
    335.97 =C2=B1  0%      +3.1%     346.51 =C2=B1  0%  vm-scalability.time=
.elapsed_time
    335.97 =C2=B1  0%      +3.1%     346.51 =C2=B1  0%  vm-scalability.time=
.elapsed_time.max
    214026 =C2=B1  1%     +23.4%     264006 =C2=B1  2%  vm-scalability.time=
.involuntary_context_switches
  74132095 =C2=B1  6%    +135.5%  1.746e+08 =C2=B1  5%  vm-scalability.time=
.minor_page_faults
      3689 =C2=B1  0%      +3.3%       3810 =C2=B1  0%  vm-scalability.time=
.percent_of_cpu_this_job_got
     10657 =C2=B1  1%     -34.3%       7003 =C2=B1  6%  vm-scalability.time=
.system_time
      1738 =C2=B1 11%    +256.8%       6203 =C2=B1  6%  vm-scalability.time=
.user_time
    515603 =C2=B1  9%    +118.8%    1128038 =C2=B1  3%  softirqs.RCU
      3882 =C2=B1  0%     +11.8%       4341 =C2=B1  1%  uptime.idle
  55117755 =C2=B1  1%     -10.8%   49152184 =C2=B1  1%  vmstat.memory.cache
   7826855 =C2=B1  0%     -97.2%     215402 =C2=B1  4%  vmstat.system.in
    242816 =C2=B1  1%    +106.7%     501915 =C2=B1  4%  slabinfo.radix_tree=
_node.active_objs
      4337 =C2=B1  1%    +106.7%       8967 =C2=B1  4%  slabinfo.radix_tree=
_node.active_slabs
    242891 =C2=B1  1%    +106.7%     502019 =C2=B1  4%  slabinfo.radix_tree=
_node.num_objs
      4337 =C2=B1  1%    +106.7%       8967 =C2=B1  4%  slabinfo.radix_tree=
_node.num_slabs
    214026 =C2=B1  1%     +23.4%     264006 =C2=B1  2%  time.involuntary_co=
ntext_switches
  74132095 =C2=B1  6%    +135.5%  1.746e+08 =C2=B1  5%  time.minor_page_fau=
lts
     10657 =C2=B1  1%     -34.3%       7003 =C2=B1  6%  time.system_time
      1738 =C2=B1 11%    +256.8%       6203 =C2=B1  6%  time.user_time
     83.39 =C2=B1  0%      -2.1%      81.65 =C2=B1  0%  turbostat.%Busy
      2496 =C2=B1  0%      -2.1%       2444 =C2=B1  0%  turbostat.Avg_MHz
      7.16 =C2=B1  2%     -23.8%       5.45 =C2=B1  7%  turbostat.CPU%c1
      9.45 =C2=B1  0%     +36.4%      12.89 =C2=B1  1%  turbostat.CPU%c6
      3.85 =C2=B1  5%     +31.8%       5.07 =C2=B1  5%  turbostat.Pkg%pc2
    182.61 =C2=B1  0%      +0.9%     184.34 =C2=B1  0%  turbostat.PkgWatt
      8.57 =C2=B1  1%     +76.2%      15.10 =C2=B1  0%  turbostat.RAMWatt
 3.954e+08 =C2=B1  8%     -84.6%   60826303 =C2=B1 40%  cpuidle.C1-IVT.time
   1347482 =C2=B1112%    +579.6%    9157219 =C2=B1 20%  cpuidle.C1E-IVT.time
      1945 =C2=B1 16%   +1232.2%      25914 =C2=B1 11%  cpuidle.C1E-IVT.usa=
ge
    733075 =C2=B1 29%   +1848.5%   14283727 =C2=B1  8%  cpuidle.C3-IVT.time
      1375 =C2=B1  9%   +1710.0%      24901 =C2=B1 17%  cpuidle.C3-IVT.usage
 2.288e+09 =C2=B1  1%     +30.2%  2.979e+09 =C2=B1  1%  cpuidle.C6-IVT.time
    280924 =C2=B1  2%     +30.4%     366249 =C2=B1  7%  cpuidle.C6-IVT.usage
   1723234 =C2=B1105%     -99.9%       1010 =C2=B1 33%  cpuidle.POLL.time
    230.50 =C2=B1 26%     -54.3%     105.25 =C2=B1 21%  cpuidle.POLL.usage
   6662370 =C2=B1 35%    +177.7%   18500891 =C2=B1 18%  numa-numastat.node0=
.local_node
    842668 =C2=B1 11%    +655.5%    6366146 =C2=B1 32%  numa-numastat.node0=
.numa_foreign
   6662442 =C2=B1 35%    +177.7%   18501610 =C2=B1 18%  numa-numastat.node0=
.numa_hit
   3058406 =C2=B1 83%    +195.5%    9037060 =C2=B1 31%  numa-numastat.node0=
.numa_miss
   3058478 =C2=B1 83%    +195.5%    9037778 =C2=B1 31%  numa-numastat.node0=
.other_node
   9175084 =C2=B1  2%    +135.9%   21640389 =C2=B1 12%  numa-numastat.node1=
.local_node
   3058406 =C2=B1 83%    +195.5%    9037060 =C2=B1 31%  numa-numastat.node1=
.numa_foreign
   9175097 =C2=B1  2%    +135.9%   21640489 =C2=B1 12%  numa-numastat.node1=
.numa_hit
    842668 =C2=B1 11%    +655.5%    6366146 =C2=B1 32%  numa-numastat.node1=
.numa_miss
    842680 =C2=B1 11%    +655.5%    6366246 =C2=B1 32%  numa-numastat.node1=
.other_node
     32752 =C2=B1126%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.c=
all_rwsem_down_read_failed.task_numa_work.task_work_run.prepare_exit_to_use=
rmode.retint_user
     13481 =C2=B1128%     -93.7%     850.00 =C2=B1 75%  latency_stats.avg.c=
all_rwsem_down_write_failed.vm_munmap.SyS_munmap.entry_SYSCALL_64_fastpath
   4425916 =C2=B1 70%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.p=
ipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
    104546 =C2=B1116%     -93.9%       6354 =C2=B1 60%  latency_stats.max.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault
     47882 =C2=B1139%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.c=
all_rwsem_down_read_failed.task_numa_work.task_work_run.prepare_exit_to_use=
rmode.retint_user
    108276 =C2=B1112%     -93.3%       7261 =C2=B1 67%  latency_stats.max.c=
all_rwsem_down_write_failed.vm_munmap.SyS_munmap.entry_SYSCALL_64_fastpath
   1643482 =C2=B1172%     -93.8%     101381 =C2=B1 96%  latency_stats.max.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
   4425916 =C2=B1 70%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.p=
ipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
    636256 =C2=B1 96%     -68.7%     198992 =C2=B1 51%  latency_stats.sum.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault
     58099 =C2=B1145%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.task_numa_work.task_work_run.prepare_exit_to_use=
rmode.retint_user
    108350 =C2=B1112%     -93.2%       7357 =C2=B1 67%  latency_stats.sum.c=
all_rwsem_down_write_failed.vm_munmap.SyS_munmap.entry_SYSCALL_64_fastpath
   4425916 =C2=B1 70%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.p=
ipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
  25651111 =C2=B1  3%      -8.4%   23507894 =C2=B1  2%  meminfo.Active
    118424 =C2=B1 11%     +84.2%     218142 =C2=B1  2%  meminfo.Active(anon)
  25532686 =C2=B1  3%      -8.8%   23289751 =C2=B1  2%  meminfo.Active(file)
  53963165 =C2=B1  1%      -9.7%   48711030 =C2=B1  1%  meminfo.Cached
    576942 =C2=B1  3%     +12.1%     646791 =C2=B1  1%  meminfo.Committed_AS
  27939486 =C2=B1  0%     -11.2%   24818931 =C2=B1  1%  meminfo.Inactive
  27894895 =C2=B1  0%     -11.2%   24776371 =C2=B1  1%  meminfo.Inactive(fi=
le)
  52830555 =C2=B1  1%     -10.2%   47427044 =C2=B1  1%  meminfo.Mapped
  59418736 =C2=B1  0%     -10.4%   53234678 =C2=B1  1%  meminfo.MemAvailable
   5387627 =C2=B1  2%    +112.4%   11444675 =C2=B1  5%  meminfo.PageTables
    179300 =C2=B1  1%     +82.8%     327678 =C2=B1  4%  meminfo.SReclaimable
    140030 =C2=B1 10%     +69.7%     237642 =C2=B1  2%  meminfo.Shmem
    269507 =C2=B1  0%     +55.0%     417843 =C2=B1  3%  meminfo.Slab
  12544698 =C2=B1  4%      -8.2%   11511691 =C2=B1  4%  numa-meminfo.node0.=
Active
  12484499 =C2=B1  4%      -8.2%   11462366 =C2=B1  4%  numa-meminfo.node0.=
Active(file)
     24780 =C2=B1 48%     -65.3%       8601 =C2=B1148%  numa-meminfo.node0.=
Inactive(anon)
   3217075 =C2=B1 13%     +89.6%    6099612 =C2=B1  5%  numa-meminfo.node0.=
PageTables
     87620 =C2=B1  2%     +83.1%     160468 =C2=B1  5%  numa-meminfo.node0.=
SReclaimable
    129848 =C2=B1  1%     +59.4%     206939 =C2=B1  4%  numa-meminfo.node0.=
Slab
  13170817 =C2=B1  1%      -8.9%   11996391 =C2=B1  1%  numa-meminfo.node1.=
Active
     60214 =C2=B1 21%    +181.2%     169310 =C2=B1 16%  numa-meminfo.node1.=
Active(anon)
  13110603 =C2=B1  2%      -9.8%   11827080 =C2=B1  1%  numa-meminfo.node1.=
Active(file)
      2400 =C2=B1 69%    +104.0%       4896 =C2=B1 22%  numa-meminfo.node1.=
AnonHugePages
     10012 =C2=B1 19%     +43.9%      14405 =C2=B1 12%  numa-meminfo.node1.=
AnonPages
  28135804 =C2=B1  2%     -11.0%   25039750 =C2=B1  2%  numa-meminfo.node1.=
FilePages
  14776140 =C2=B1  5%     -13.0%   12854070 =C2=B1  4%  numa-meminfo.node1.=
Inactive
  14755523 =C2=B1  5%     -13.1%   12820185 =C2=B1  4%  numa-meminfo.node1.=
Inactive(file)
  27592346 =C2=B1  2%     -11.9%   24320149 =C2=B1  2%  numa-meminfo.node1.=
Mapped
   2199244 =C2=B1 22%    +142.9%    5342639 =C2=B1 11%  numa-meminfo.node1.=
PageTables
     92297 =C2=B1  1%     +81.3%     167302 =C2=B1  4%  numa-meminfo.node1.=
SReclaimable
     70797 =C2=B1 22%    +166.7%     188799 =C2=B1 14%  numa-meminfo.node1.=
Shmem
    140279 =C2=B1  0%     +50.4%     210997 =C2=B1  4%  numa-meminfo.node1.=
Slab
      6074 =C2=B1 52%     -64.6%       2149 =C2=B1148%  numa-vmstat.node0.n=
r_inactive_anon
    548.50 =C2=B1  7%     -30.8%     379.50 =C2=B1 10%  numa-vmstat.node0.n=
r_isolated_file
    802854 =C2=B1 12%     +89.9%    1524724 =C2=B1  5%  numa-vmstat.node0.n=
r_page_table_pages
    166.50 =C2=B1 19%   +2918.2%       5025 =C2=B1 73%  numa-vmstat.node0.n=
r_pages_scanned
     21892 =C2=B1  3%     +83.1%      40094 =C2=B1  4%  numa-vmstat.node0.n=
r_slab_reclaimable
    442937 =C2=B1 17%    +681.4%    3461158 =C2=B1 38%  numa-vmstat.node0.n=
uma_foreign
   5955428 =C2=B1 38%    +111.3%   12585324 =C2=B1 22%  numa-vmstat.node0.n=
uma_hit
   5950241 =C2=B1 38%    +111.2%   12565373 =C2=B1 21%  numa-vmstat.node0.n=
uma_local
     15179 =C2=B1 23%    +178.5%      42275 =C2=B1 15%  numa-vmstat.node1.n=
r_active_anon
   3272659 =C2=B1  2%      -9.6%    2959171 =C2=B1  1%  numa-vmstat.node1.n=
r_active_file
      2500 =C2=B1 19%     +44.0%       3600 =C2=B1 12%  numa-vmstat.node1.n=
r_anon_pages
   7035926 =C2=B1  2%     -11.0%    6264839 =C2=B1  1%  numa-vmstat.node1.n=
r_file_pages
   3695920 =C2=B1  5%     -13.2%    3207574 =C2=B1  4%  numa-vmstat.node1.n=
r_inactive_file
    597.50 =C2=B1  1%     -35.8%     383.50 =C2=B1  5%  numa-vmstat.node1.n=
r_isolated_file
   6899439 =C2=B1  2%     -11.8%    6085128 =C2=B1  2%  numa-vmstat.node1.n=
r_mapped
    550459 =C2=B1 22%    +142.6%    1335451 =C2=B1 11%  numa-vmstat.node1.n=
r_page_table_pages
     36.75 =C2=B1 26%   +4261.9%       1603 =C2=B1 25%  numa-vmstat.node1.n=
r_pages_scanned
     17753 =C2=B1 22%    +165.7%      47167 =C2=B1 13%  numa-vmstat.node1.n=
r_shmem
     23081 =C2=B1  1%     +81.1%      41801 =C2=B1  4%  numa-vmstat.node1.n=
r_slab_reclaimable
   8326219 =C2=B1  3%     +74.1%   14499407 =C2=B1 10%  numa-vmstat.node1.n=
uma_hit
   8247279 =C2=B1  3%     +75.0%   14435261 =C2=B1 10%  numa-vmstat.node1.n=
uma_local
    443012 =C2=B1 17%    +681.3%    3461226 =C2=B1 38%  numa-vmstat.node1.n=
uma_miss
    521951 =C2=B1 14%    +575.4%    3525373 =C2=B1 37%  numa-vmstat.node1.n=
uma_other
      1470 =C2=B1  3%   +2458.8%      37620 =C2=B1  7%  proc-vmstat.allocst=
all
      3.00 =C2=B1 62%  +15316.7%     462.50 =C2=B1 12%  proc-vmstat.kswapd_=
low_wmark_hit_quickly
     29914 =C2=B1 11%     +82.4%      54575 =C2=B1  2%  proc-vmstat.nr_acti=
ve_anon
   1479166 =C2=B1  0%     -10.7%    1320975 =C2=B1  1%  proc-vmstat.nr_dirt=
y_background_threshold
   2958332 =C2=B1  0%     -10.7%    2641952 =C2=B1  1%  proc-vmstat.nr_dirt=
y_threshold
  13512242 =C2=B1  1%      -9.9%   12173462 =C2=B1  1%  proc-vmstat.nr_file=
_pages
   6975807 =C2=B1  0%     -11.3%    6189755 =C2=B1  1%  proc-vmstat.nr_inac=
tive_file
      1148 =C2=B1  2%     -33.0%     769.25 =C2=B1  9%  proc-vmstat.nr_isol=
ated_file
  13232908 =C2=B1  1%     -10.4%   11852354 =C2=B1  1%  proc-vmstat.nr_mapp=
ed
   1350565 =C2=B1  1%    +112.0%    2863445 =C2=B1  4%  proc-vmstat.nr_page=
_table_pages
    204.00 =C2=B1 20%   +3142.4%       6614 =C2=B1 30%  proc-vmstat.nr_page=
s_scanned
     35504 =C2=B1 11%     +67.6%      59496 =C2=B1  2%  proc-vmstat.nr_shmem
     44916 =C2=B1  0%     +82.4%      81949 =C2=B1  4%  proc-vmstat.nr_slab=
_reclaimable
   3901074 =C2=B1 63%    +294.8%   15403207 =C2=B1  9%  proc-vmstat.numa_fo=
reign
     15670 =C2=B1 14%    +199.0%      46848 =C2=B1  5%  proc-vmstat.numa_hi=
nt_faults
     13690 =C2=B1 15%    +197.9%      40783 =C2=B1  4%  proc-vmstat.numa_hi=
nt_faults_local
  15833075 =C2=B1 13%    +153.5%   40137005 =C2=B1  6%  proc-vmstat.numa_hit
  15832991 =C2=B1 13%    +153.5%   40136210 =C2=B1  6%  proc-vmstat.numa_lo=
cal
   3901074 =C2=B1 63%    +294.8%   15403207 =C2=B1  9%  proc-vmstat.numa_mi=
ss
   3901158 =C2=B1 63%    +294.9%   15404001 =C2=B1  9%  proc-vmstat.numa_ot=
her
    224.75 =C2=B1  4%    +553.9%       1469 =C2=B1 14%  proc-vmstat.numa_pa=
ges_migrated
     15157 =C2=B1  9%    +209.5%      46917 =C2=B1  5%  proc-vmstat.numa_pt=
e_updates
     22.75 =C2=B1 31%   +8146.2%       1876 =C2=B1  8%  proc-vmstat.pageout=
run
  17163894 =C2=B1  0%    +189.4%   49670802 =C2=B1  4%  proc-vmstat.pgactiv=
ate
    840721 =C2=B1  1%    +166.0%    2236172 =C2=B1  9%  proc-vmstat.pgalloc=
_dma32
  18949849 =C2=B1  1%    +182.0%   53430217 =C2=B1  4%  proc-vmstat.pgalloc=
_normal
   7537536 =C2=B1  0%    +455.1%   41838374 =C2=B1  5%  proc-vmstat.pgdeact=
ivate
  76121176 =C2=B1  8%    +132.7%  1.771e+08 =C2=B1  5%  proc-vmstat.pgfault
  18490935 =C2=B1  4%    +191.3%   53861451 =C2=B1  4%  proc-vmstat.pgfree
    224.75 =C2=B1  4%    +553.9%       1469 =C2=B1 14%  proc-vmstat.pgmigra=
te_success
    301873 =C2=B1 10%    +429.4%    1598042 =C2=B1 14%  proc-vmstat.pgrefil=
l_dma32
   7259314 =C2=B1  0%    +454.7%   40264356 =C2=B1  5%  proc-vmstat.pgrefil=
l_normal
    653298 =C2=B1 11%    +352.5%    2956417 =C2=B1 14%  proc-vmstat.pgscan_=
direct_dma32
  16069728 =C2=B1  0%    +368.5%   75278864 =C2=B1  5%  proc-vmstat.pgscan_=
direct_normal
     48794 =C2=B1  8%    +530.3%     307572 =C2=B1 15%  proc-vmstat.pgscan_=
kswapd_dma32
    753055 =C2=B1  3%    +874.4%    7337747 =C2=B1  9%  proc-vmstat.pgscan_=
kswapd_normal
    101842 =C2=B1 14%   +1209.1%    1333212 =C2=B1 14%  proc-vmstat.pgsteal=
_direct_dma32
   2422523 =C2=B1  3%   +1287.9%   33621398 =C2=B1  5%  proc-vmstat.pgsteal=
_direct_normal
      5529 =C2=B1  2%   +2503.3%     143942 =C2=B1 21%  proc-vmstat.pgsteal=
_kswapd_dma32
    130403 =C2=B1  3%   +2347.9%    3192139 =C2=B1 15%  proc-vmstat.pgsteal=
_kswapd_normal
      2.08 =C2=B1 40%     -94.7%       0.11 =C2=B1-909%  perf-profile.cpu-c=
ycles.__alloc_pages_nodemask.alloc_kmem_pages_node.copy_process._do_fork.sy=
s_clone
      1.38 =C2=B1 17%    +106.7%       2.85 =C2=B1 27%  perf-profile.cpu-cy=
cles.__alloc_pages_nodemask.alloc_pages_current.__page_cache_alloc.__do_pag=
e_cache_readahead.filemap_fault
     25.87 =C2=B1 24%     -84.0%       4.13 =C2=B1 18%  perf-profile.cpu-cy=
cles.__alloc_pages_nodemask.alloc_pages_current.__page_cache_alloc.__do_pag=
e_cache_readahead.ondemand_readahead
     59.80 =C2=B1 11%     +31.8%      78.83 =C2=B1  3%  perf-profile.cpu-cy=
cles.__alloc_pages_nodemask.alloc_pages_current.pte_alloc_one.__pte_alloc.h=
andle_mm_fault
      1.39 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.__alloc_pages_nodemask.alloc_pages_vma.shmem_alloc_page.shmem_getpage_=
gfp.shmem_write_begin
      0.00 =C2=B1 -1%      +Inf%       0.54 =C2=B1 95%  perf-profile.cpu-cy=
cles.__bitmap_or.try_to_unmap_one.rmap_walk.try_to_unmap.shrink_page_list
     27.36 =C2=B1 23%     -67.1%       8.99 =C2=B1 15%  perf-profile.cpu-cy=
cles.__do_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      1.37 =C2=B1 17%    +111.3%       2.90 =C2=B1 24%  perf-profile.cpu-cy=
cles.__do_page_cache_readahead.filemap_fault.xfs_filemap_fault.__do_fault.h=
andle_mm_fault
     25.96 =C2=B1 24%     -76.6%       6.07 =C2=B1 11%  perf-profile.cpu-cy=
cles.__do_page_cache_readahead.ondemand_readahead.page_cache_async_readahea=
d.filemap_fault.xfs_filemap_fault
      1.42 =C2=B1  3%     -92.4%       0.11 =C2=B1 13%  perf-profile.cpu-cy=
cles.__generic_file_write_iter.generic_file_write_iter.__vfs_write.vfs_writ=
e.sys_write
      1.43 =C2=B1  3%     -90.9%       0.13 =C2=B1 14%  perf-profile.cpu-cy=
cles.__libc_start_main
      1.37 =C2=B1 17%    +111.1%       2.90 =C2=B1 25%  perf-profile.cpu-cy=
cles.__page_cache_alloc.__do_page_cache_readahead.filemap_fault.xfs_filemap=
_fault.__do_fault
     25.91 =C2=B1 24%     -83.7%       4.22 =C2=B1 18%  perf-profile.cpu-cy=
cles.__page_cache_alloc.__do_page_cache_readahead.ondemand_readahead.page_c=
ache_async_readahead.filemap_fault
      2.28 =C2=B1 21%    +195.3%       6.74 =C2=B1 10%  perf-profile.cpu-cy=
cles.__page_check_address.try_to_unmap_one.rmap_walk.try_to_unmap.shrink_pa=
ge_list
     59.80 =C2=B1 11%     +31.9%      78.90 =C2=B1  3%  perf-profile.cpu-cy=
cles.__pte_alloc.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      1.42 =C2=B1  3%     -92.3%       0.11 =C2=B1 11%  perf-profile.cpu-cy=
cles.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath.__write_noca=
ncel
      1.12 =C2=B1 24%     -92.0%       0.09 =C2=B1 17%  perf-profile.cpu-cy=
cles.__write_nocancel._start.main.__libc_start_main
      2.77 =C2=B1 48%     -96.0%       0.11 =C2=B1-909%  perf-profile.cpu-c=
ycles._do_fork.sys_clone.entry_SYSCALL_64_fastpath
      2.11 =C2=B1 25%    +154.4%       5.36 =C2=B1  9%  perf-profile.cpu-cy=
cles._raw_spin_lock.__page_check_address.try_to_unmap_one.rmap_walk.try_to_=
unmap
      1.43 =C2=B1  3%     -90.9%       0.13 =C2=B1 14%  perf-profile.cpu-cy=
cles._start.main.__libc_start_main
      2.08 =C2=B1 40%     -94.7%       0.11 =C2=B1-909%  perf-profile.cpu-c=
ycles.alloc_kmem_pages_node.copy_process._do_fork.sys_clone.entry_SYSCALL_6=
4_fastpath
      1.38 =C2=B1 17%    +106.9%       2.85 =C2=B1 26%  perf-profile.cpu-cy=
cles.alloc_pages_current.__page_cache_alloc.__do_page_cache_readahead.filem=
ap_fault.xfs_filemap_fault
     25.87 =C2=B1 24%     -84.0%       4.14 =C2=B1 18%  perf-profile.cpu-cy=
cles.alloc_pages_current.__page_cache_alloc.__do_page_cache_readahead.ondem=
and_readahead.page_cache_async_readahead
     59.80 =C2=B1 11%     +31.8%      78.84 =C2=B1  3%  perf-profile.cpu-cy=
cles.alloc_pages_current.pte_alloc_one.__pte_alloc.handle_mm_fault.__do_pag=
e_fault
      1.39 =C2=B1  3%     -99.8%       0.00 =C2=B1141%  perf-profile.cpu-cy=
cles.alloc_pages_vma.shmem_alloc_page.shmem_getpage_gfp.shmem_write_begin.g=
eneric_perform_write
      5.08 =C2=B1  9%     -98.6%       0.07 =C2=B1 39%  perf-profile.cpu-cy=
cles.call_function_interrupt._raw_spin_lock.__page_check_address.page_refer=
enced_one.rmap_walk
      2.37 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.call_function_interrupt.native_flush_tlb_others.flush_tlb_page.ptep_cl=
ear_flush.try_to_unmap_one
      4.45 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.call_function_interrupt.physflat_send_IPI_mask.native_send_call_func_i=
pi.smp_call_function_many.native_flush_tlb_others
      2.29 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.call_function_interrupt.smp_call_function_many.native_flush_tlb_others=
.flush_tlb_page.ptep_clear_flush
      2.77 =C2=B1 48%     -96.0%       0.11 =C2=B1-909%  perf-profile.cpu-c=
ycles.copy_process._do_fork.sys_clone.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%       0.77 =C2=B1 68%  perf-profile.cpu-cy=
cles.cpumask_any_but.try_to_unmap_one.rmap_walk.try_to_unmap.shrink_page_li=
st
     39.32 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.default_send_IPI_mask_sequence_phys.physflat_send_IPI_mask.native_send=
_call_func_ipi.smp_call_function_many.native_flush_tlb_others
      0.04 =C2=B1 42%   +4042.9%       1.45 =C2=B1  7%  perf-profile.cpu-cy=
cles.do_mpage_readpage.mpage_readpages.xfs_vm_readpages.__do_page_cache_rea=
dahead.ondemand_readahead
      2.08 =C2=B1 40%     -94.7%       0.11 =C2=B1-909%  perf-profile.cpu-c=
ycles.do_try_to_free_pages.try_to_free_pages.__alloc_pages_nodemask.alloc_k=
mem_pages_node.copy_process
     27.26 =C2=B1 23%     -75.0%       6.81 =C2=B1 22%  perf-profile.cpu-cy=
cles.do_try_to_free_pages.try_to_free_pages.__alloc_pages_nodemask.alloc_pa=
ges_current.__page_cache_alloc
     60.13 =C2=B1 10%     +30.9%      78.69 =C2=B1  3%  perf-profile.cpu-cy=
cles.do_try_to_free_pages.try_to_free_pages.__alloc_pages_nodemask.alloc_pa=
ges_current.pte_alloc_one
      1.39 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.do_try_to_free_pages.try_to_free_pages.__alloc_pages_nodemask.alloc_pa=
ges_vma.shmem_alloc_page
      2.98 =C2=B1 53%     -98.5%       0.05 =C2=B1 99%  perf-profile.cpu-cy=
cles.entry_SYSCALL_64_fastpath
      1.12 =C2=B1 24%     -91.7%       0.09 =C2=B1 14%  perf-profile.cpu-cy=
cles.entry_SYSCALL_64_fastpath.__write_nocancel._start.main.__libc_start_ma=
in
     27.36 =C2=B1 23%     -67.2%       8.98 =C2=B1 15%  perf-profile.cpu-cy=
cles.filemap_fault.xfs_filemap_fault.__do_fault.handle_mm_fault.__do_page_f=
ault
      0.15 =C2=B1 48%   +3077.6%       4.61 =C2=B1 32%  perf-profile.cpu-cy=
cles.filemap_map_pages.handle_mm_fault.__do_page_fault.do_page_fault.page_f=
ault
      2.72 =C2=B1  9%     -98.3%       0.05 =C2=B1 58%  perf-profile.cpu-cy=
cles.flush_smp_call_function_queue.generic_smp_call_function_single_interru=
pt.smp_call_function_interrupt.call_function_interrupt._raw_spin_lock
      1.05 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.flush_smp_call_function_queue.generic_smp_call_function_single_interru=
pt.smp_call_function_interrupt.call_function_interrupt.native_flush_tlb_oth=
ers
      3.04 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.flush_smp_call_function_queue.generic_smp_call_function_single_interru=
pt.smp_call_function_interrupt.call_function_interrupt.physflat_send_IPI_ma=
sk
      1.33 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.flush_smp_call_function_queue.generic_smp_call_function_single_interru=
pt.smp_call_function_interrupt.call_function_interrupt.smp_call_function_ma=
ny
      4.18 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.flush_tlb_func.flush_smp_call_function_queue.generic_smp_call_function=
_single_interrupt.smp_call_function_interrupt.call_function_interrupt
     68.63 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.flush_tlb_page.ptep_clear_flush.try_to_unmap_one.rmap_walk.try_to_unmap
      1.42 =C2=B1  3%     -92.3%       0.11 =C2=B1 11%  perf-profile.cpu-cy=
cles.generic_file_write_iter.__vfs_write.vfs_write.sys_write.entry_SYSCALL_=
64_fastpath
      1.42 =C2=B1  3%     -92.6%       0.10 =C2=B1 15%  perf-profile.cpu-cy=
cles.generic_perform_write.__generic_file_write_iter.generic_file_write_ite=
r.__vfs_write.vfs_write
      3.19 =C2=B1  9%     -98.4%       0.05 =C2=B1 52%  perf-profile.cpu-cy=
cles.generic_smp_call_function_single_interrupt.smp_call_function_interrupt=
.call_function_interrupt._raw_spin_lock.__page_check_address
      1.23 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.generic_smp_call_function_single_interrupt.smp_call_function_interrupt=
.call_function_interrupt.native_flush_tlb_others.flush_tlb_page
      3.35 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.generic_smp_call_function_single_interrupt.smp_call_function_interrupt=
.call_function_interrupt.physflat_send_IPI_mask.native_send_call_func_ipi
      1.62 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.generic_smp_call_function_single_interrupt.smp_call_function_interrupt=
.call_function_interrupt.smp_call_function_many.native_flush_tlb_others
      5.43 =C2=B1  2%     -28.1%       3.90 =C2=B1 10%  perf-profile.cpu-cy=
cles.kswapd.kthread.ret_from_fork
      5.46 =C2=B1  2%     -27.9%       3.94 =C2=B1 10%  perf-profile.cpu-cy=
cles.kthread.ret_from_fork
      5.45 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.llist_add_batch.smp_call_function_many.native_flush_tlb_others.flush_t=
lb_page.ptep_clear_flush
      2.63 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.llist_reverse_order.flush_smp_call_function_queue.generic_smp_call_fun=
ction_single_interrupt.smp_call_function_interrupt.call_function_interrupt
      1.43 =C2=B1  3%     -90.9%       0.13 =C2=B1 14%  perf-profile.cpu-cy=
cles.main.__libc_start_main
      0.00 =C2=B1 -1%      +Inf%       1.30 =C2=B1 42%  perf-profile.cpu-cy=
cles.mm_find_pmd.page_referenced_one.rmap_walk.page_referenced.shrink_page_=
list
      0.00 =C2=B1 -1%      +Inf%       1.61 =C2=B1 29%  perf-profile.cpu-cy=
cles.mm_find_pmd.try_to_unmap_one.rmap_walk.try_to_unmap.shrink_page_list
      0.06 =C2=B1 30%   +3154.5%       1.79 =C2=B1 10%  perf-profile.cpu-cy=
cles.mpage_readpages.xfs_vm_readpages.__do_page_cache_readahead.ondemand_re=
adahead.page_cache_async_readahead
     68.39 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.native_flush_tlb_others.flush_tlb_page.ptep_clear_flush.try_to_unmap_o=
ne.rmap_walk
      1.56 =C2=B1 28%    +137.3%       3.70 =C2=B1 12%  perf-profile.cpu-cy=
cles.native_queued_spin_lock_slowpath._raw_spin_lock.__page_check_address.t=
ry_to_unmap_one.rmap_walk
     44.17 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.native_send_call_func_ipi.smp_call_function_many.native_flush_tlb_othe=
rs.flush_tlb_page.ptep_clear_flush
     25.96 =C2=B1 24%     -76.6%       6.07 =C2=B1 11%  perf-profile.cpu-cy=
cles.ondemand_readahead.page_cache_async_readahead.filemap_fault.xfs_filema=
p_fault.__do_fault
     25.96 =C2=B1 24%     -76.6%       6.07 =C2=B1 11%  perf-profile.cpu-cy=
cles.page_cache_async_readahead.filemap_fault.xfs_filemap_fault.__do_fault.=
handle_mm_fault
      0.03 =C2=B1 23%   +5058.3%       1.55 =C2=B1  9%  perf-profile.cpu-cy=
cles.page_remove_rmap.try_to_unmap_one.rmap_walk.try_to_unmap.shrink_page_l=
ist
     44.02 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.physflat_send_IPI_mask.native_send_call_func_ipi.smp_call_function_man=
y.native_flush_tlb_others.flush_tlb_page
     59.80 =C2=B1 11%     +31.9%      78.86 =C2=B1  3%  perf-profile.cpu-cy=
cles.pte_alloc_one.__pte_alloc.handle_mm_fault.__do_page_fault.do_page_fault
     68.80 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.ptep_clear_flush.try_to_unmap_one.rmap_walk.try_to_unmap.shrink_page_l=
ist
      5.46 =C2=B1  2%     -27.3%       3.96 =C2=B1  8%  perf-profile.cpu-cy=
cles.ret_from_fork
     71.72 =C2=B1  4%     -17.1%      59.46 =C2=B1  8%  perf-profile.cpu-cy=
cles.rmap_walk.try_to_unmap.shrink_page_list.shrink_inactive_list.shrink_lr=
uvec
      1.39 =C2=B1  3%     -99.5%       0.01 =C2=B1 57%  perf-profile.cpu-cy=
cles.shmem_alloc_page.shmem_getpage_gfp.shmem_write_begin.generic_perform_w=
rite.__generic_file_write_iter
      1.40 =C2=B1  3%     -98.4%       0.02 =C2=B1 19%  perf-profile.cpu-cy=
cles.shmem_getpage_gfp.shmem_write_begin.generic_perform_write.__generic_fi=
le_write_iter.generic_file_write_iter
      1.40 =C2=B1  3%     -98.2%       0.03 =C2=B1 19%  perf-profile.cpu-cy=
cles.shmem_write_begin.generic_perform_write.__generic_file_write_iter.gene=
ric_file_write_iter.__vfs_write
      0.00 =C2=B1 -1%      +Inf%       0.59 =C2=B1 48%  perf-profile.cpu-cy=
cles.shrink_active_list.shrink_lruvec.shrink_zone.do_try_to_free_pages.try_=
to_free_pages
      5.43 =C2=B1  2%     -28.6%       3.88 =C2=B1 10%  perf-profile.cpu-cy=
cles.shrink_inactive_list.shrink_lruvec.shrink_zone.kswapd.kthread
      5.43 =C2=B1  2%     -28.2%       3.90 =C2=B1 10%  perf-profile.cpu-cy=
cles.shrink_lruvec.shrink_zone.kswapd.kthread.ret_from_fork
      5.43 =C2=B1  2%     -28.7%       3.87 =C2=B1 10%  perf-profile.cpu-cy=
cles.shrink_page_list.shrink_inactive_list.shrink_lruvec.shrink_zone.kswapd
      2.08 =C2=B1 40%     -94.7%       0.11 =C2=B1-909%  perf-profile.cpu-c=
ycles.shrink_zone.do_try_to_free_pages.try_to_free_pages.__alloc_pages_node=
mask.alloc_kmem_pages_node
      2.92 =C2=B1 67%     -96.2%       0.11 =C2=B1 89%  perf-profile.cpu-cy=
cles.shrink_zone.do_try_to_free_pages.try_to_free_pages.__alloc_pages_nodem=
ask.alloc_pages_vma
      5.43 =C2=B1  2%     -28.1%       3.90 =C2=B1 10%  perf-profile.cpu-cy=
cles.shrink_zone.kswapd.kthread.ret_from_fork
      3.40 =C2=B1  9%     -97.8%       0.08 =C2=B1 35%  perf-profile.cpu-cy=
cles.smp_call_function_interrupt.call_function_interrupt._raw_spin_lock.__p=
age_check_address.page_referenced_one
      1.47 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.smp_call_function_interrupt.call_function_interrupt.native_flush_tlb_o=
thers.flush_tlb_page.ptep_clear_flush
      3.46 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.smp_call_function_interrupt.call_function_interrupt.physflat_send_IPI_=
mask.native_send_call_func_ipi.smp_call_function_many
      1.76 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.smp_call_function_interrupt.call_function_interrupt.smp_call_function_=
many.native_flush_tlb_others.flush_tlb_page
     65.78 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.smp_call_function_many.native_flush_tlb_others.flush_tlb_page.ptep_cle=
ar_flush.try_to_unmap_one
      2.77 =C2=B1 48%     -96.0%       0.11 =C2=B1-909%  perf-profile.cpu-c=
ycles.sys_clone.entry_SYSCALL_64_fastpath
      1.12 =C2=B1 24%     -91.8%       0.09 =C2=B1 14%  perf-profile.cpu-cy=
cles.sys_write.entry_SYSCALL_64_fastpath.__write_nocancel._start.main
      2.08 =C2=B1 40%     -94.7%       0.11 =C2=B1-909%  perf-profile.cpu-c=
ycles.try_to_free_pages.__alloc_pages_nodemask.alloc_kmem_pages_node.copy_p=
rocess._do_fork
     27.26 =C2=B1 23%     -75.0%       6.81 =C2=B1 22%  perf-profile.cpu-cy=
cles.try_to_free_pages.__alloc_pages_nodemask.alloc_pages_current.__page_ca=
che_alloc.__do_page_cache_readahead
     60.13 =C2=B1 10%     +30.9%      78.69 =C2=B1  3%  perf-profile.cpu-cy=
cles.try_to_free_pages.__alloc_pages_nodemask.alloc_pages_current.pte_alloc=
_one.__pte_alloc
      1.39 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.try_to_free_pages.__alloc_pages_nodemask.alloc_pages_vma.shmem_alloc_p=
age.shmem_getpage_gfp
     71.75 =C2=B1  4%     -16.7%      59.77 =C2=B1  8%  perf-profile.cpu-cy=
cles.try_to_unmap.shrink_page_list.shrink_inactive_list.shrink_lruvec.shrin=
k_zone
     71.59 =C2=B1  4%     -18.4%      58.43 =C2=B1  8%  perf-profile.cpu-cy=
cles.try_to_unmap_one.rmap_walk.try_to_unmap.shrink_page_list.shrink_inacti=
ve_list
      0.02 =C2=B1102%   +5700.0%       1.02 =C2=B1 11%  perf-profile.cpu-cy=
cles.unlock_page.filemap_map_pages.handle_mm_fault.__do_page_fault.do_page_=
fault
      1.12 =C2=B1 24%     -92.0%       0.09 =C2=B1 13%  perf-profile.cpu-cy=
cles.vfs_write.sys_write.entry_SYSCALL_64_fastpath.__write_nocancel._start
     27.36 =C2=B1 23%     -67.1%       8.99 =C2=B1 15%  perf-profile.cpu-cy=
cles.xfs_filemap_fault.__do_fault.handle_mm_fault.__do_page_fault.do_page_f=
ault
      0.06 =C2=B1 30%   +3159.1%       1.79 =C2=B1 10%  perf-profile.cpu-cy=
cles.xfs_vm_readpages.__do_page_cache_readahead.ondemand_readahead.page_cac=
he_async_readahead.filemap_fault
    146.50 =C2=B1 35%     -92.7%      10.75 =C2=B1 42%  sched_debug.cfs_rq[=
0]:/.nr_spread_over
      2737 =C2=B1 11%     -21.2%       2157 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
     32.25 =C2=B1 46%     -49.6%      16.25 =C2=B1  6%  sched_debug.cfs_rq[=
10]:/.load
     38.00 =C2=B1 46%     -95.4%       1.75 =C2=B1 47%  sched_debug.cfs_rq[=
10]:/.nr_spread_over
      2733 =C2=B1 12%     -22.3%       2123 =C2=B1  7%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
     63.00 =C2=B1 60%     -95.2%       3.00 =C2=B1 47%  sched_debug.cfs_rq[=
11]:/.nr_spread_over
      2733 =C2=B1 12%     -22.3%       2123 =C2=B1  7%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
     90.00 =C2=B1 51%     -90.3%       8.75 =C2=B1 71%  sched_debug.cfs_rq[=
12]:/.nr_spread_over
      2730 =C2=B1 11%     -22.3%       2122 =C2=B1  7%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
    586.25 =C2=B1  7%     +31.6%     771.25 =C2=B1  8%  sched_debug.cfs_rq[=
12]:/.util_avg
     78.00 =C2=B1 14%     -89.7%       8.00 =C2=B1 68%  sched_debug.cfs_rq[=
13]:/.nr_spread_over
      2725 =C2=B1 12%     -22.2%       2121 =C2=B1  7%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
    117.75 =C2=B1 45%     -94.9%       6.00 =C2=B1 71%  sched_debug.cfs_rq[=
14]:/.nr_spread_over
      2725 =C2=B1 12%     -23.8%       2077 =C2=B1  4%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
    138.25 =C2=B1 65%     -95.8%       5.75 =C2=B1 79%  sched_debug.cfs_rq[=
15]:/.nr_spread_over
      2726 =C2=B1 12%     -24.0%       2070 =C2=B1  4%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
     67.50 =C2=B1 26%     -96.7%       2.25 =C2=B1 36%  sched_debug.cfs_rq[=
16]:/.nr_spread_over
      2727 =C2=B1 12%     -24.1%       2070 =C2=B1  4%  sched_debug.cfs_rq[=
16]:/.tg_load_avg
    106.00 =C2=B1 65%     -97.6%       2.50 =C2=B1 72%  sched_debug.cfs_rq[=
17]:/.nr_spread_over
      2729 =C2=B1 12%     -24.1%       2070 =C2=B1  4%  sched_debug.cfs_rq[=
17]:/.tg_load_avg
    587.00 =C2=B1 12%     +30.2%     764.00 =C2=B1  9%  sched_debug.cfs_rq[=
17]:/.util_avg
    132.50 =C2=B1 42%     -95.5%       6.00 =C2=B1 45%  sched_debug.cfs_rq[=
18]:/.nr_spread_over
      2727 =C2=B1 11%     -25.6%       2028 =C2=B1  6%  sched_debug.cfs_rq[=
18]:/.tg_load_avg
     10.50 =C2=B1 38%    +154.8%      26.75 =C2=B1 46%  sched_debug.cfs_rq[=
19]:/.load
    126.25 =C2=B1 33%     -97.2%       3.50 =C2=B1 58%  sched_debug.cfs_rq[=
19]:/.nr_spread_over
      9.25 =C2=B1 31%     +70.3%      15.75 =C2=B1 17%  sched_debug.cfs_rq[=
19]:/.runnable_load_avg
      2726 =C2=B1 11%     -25.7%       2027 =C2=B1  6%  sched_debug.cfs_rq[=
19]:/.tg_load_avg
    561.25 =C2=B1 22%     +30.9%     734.50 =C2=B1  7%  sched_debug.cfs_rq[=
19]:/.util_avg
     41.25 =C2=B1 20%     -90.9%       3.75 =C2=B1 89%  sched_debug.cfs_rq[=
1]:/.nr_spread_over
      2735 =C2=B1 11%     -21.2%       2155 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
      9.25 =C2=B1 44%    +105.4%      19.00 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.load
     79.50 =C2=B1 37%     -92.5%       6.00 =C2=B1 40%  sched_debug.cfs_rq[=
20]:/.nr_spread_over
      8.75 =C2=B1 40%     +80.0%      15.75 =C2=B1 12%  sched_debug.cfs_rq[=
20]:/.runnable_load_avg
      2726 =C2=B1 11%     -25.7%       2025 =C2=B1  6%  sched_debug.cfs_rq[=
20]:/.tg_load_avg
    101.75 =C2=B1 30%     -92.9%       7.25 =C2=B1 51%  sched_debug.cfs_rq[=
21]:/.nr_spread_over
      2726 =C2=B1 11%     -25.7%       2026 =C2=B1  6%  sched_debug.cfs_rq[=
21]:/.tg_load_avg
     80.00 =C2=B1 35%     -95.9%       3.25 =C2=B1 70%  sched_debug.cfs_rq[=
22]:/.nr_spread_over
      2726 =C2=B1 11%     -25.5%       2029 =C2=B1  6%  sched_debug.cfs_rq[=
22]:/.tg_load_avg
    181.75 =C2=B1 89%     -98.2%       3.25 =C2=B1107%  sched_debug.cfs_rq[=
23]:/.nr_spread_over
      2726 =C2=B1 11%     -25.7%       2025 =C2=B1  7%  sched_debug.cfs_rq[=
23]:/.tg_load_avg
    624.50 =C2=B1 17%     +21.1%     756.50 =C2=B1  7%  sched_debug.cfs_rq[=
23]:/.util_avg
     26.00 =C2=B1 26%     -91.3%       2.25 =C2=B1 36%  sched_debug.cfs_rq[=
24]:/.nr_spread_over
      2726 =C2=B1 12%     -25.7%       2025 =C2=B1  7%  sched_debug.cfs_rq[=
24]:/.tg_load_avg
     33.75 =C2=B1 33%     -94.1%       2.00 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.nr_spread_over
      2726 =C2=B1 12%     -25.7%       2024 =C2=B1  7%  sched_debug.cfs_rq[=
25]:/.tg_load_avg
     25.50 =C2=B1 21%     -97.1%       0.75 =C2=B1110%  sched_debug.cfs_rq[=
26]:/.nr_spread_over
      2725 =C2=B1 12%     -25.8%       2022 =C2=B1  7%  sched_debug.cfs_rq[=
26]:/.tg_load_avg
     59.75 =C2=B1105%     -91.2%       5.25 =C2=B1 98%  sched_debug.cfs_rq[=
27]:/.nr_spread_over
      2726 =C2=B1 12%     -25.9%       2021 =C2=B1  7%  sched_debug.cfs_rq[=
27]:/.tg_load_avg
     27.00 =C2=B1 30%     -91.7%       2.25 =C2=B1 48%  sched_debug.cfs_rq[=
28]:/.nr_spread_over
      2726 =C2=B1 12%     -26.1%       2015 =C2=B1  7%  sched_debug.cfs_rq[=
28]:/.tg_load_avg
     23.50 =C2=B1 21%     -89.4%       2.50 =C2=B1107%  sched_debug.cfs_rq[=
29]:/.nr_spread_over
      2725 =C2=B1 12%     -25.5%       2031 =C2=B1  8%  sched_debug.cfs_rq[=
29]:/.tg_load_avg
     32.00 =C2=B1 15%     -91.4%       2.75 =C2=B1 74%  sched_debug.cfs_rq[=
2]:/.nr_spread_over
      2732 =C2=B1 11%     -22.6%       2114 =C2=B1  2%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
     19.75 =C2=B1  9%     -26.6%      14.50 =C2=B1 14%  sched_debug.cfs_rq[=
30]:/.load
     57.50 =C2=B1 98%     -97.0%       1.75 =C2=B1 84%  sched_debug.cfs_rq[=
30]:/.nr_spread_over
      2726 =C2=B1 12%     -25.4%       2033 =C2=B1  8%  sched_debug.cfs_rq[=
30]:/.tg_load_avg
     28.00 =C2=B1 19%     -95.5%       1.25 =C2=B1 87%  sched_debug.cfs_rq[=
31]:/.nr_spread_over
      2726 =C2=B1 12%     -25.5%       2030 =C2=B1  8%  sched_debug.cfs_rq[=
31]:/.tg_load_avg
     27.00 =C2=B1 19%     -81.5%       5.00 =C2=B1 67%  sched_debug.cfs_rq[=
32]:/.nr_spread_over
      2727 =C2=B1 12%     -25.6%       2029 =C2=B1  8%  sched_debug.cfs_rq[=
32]:/.tg_load_avg
     57.25 =C2=B1 99%     -98.7%       0.75 =C2=B1110%  sched_debug.cfs_rq[=
33]:/.nr_spread_over
      2727 =C2=B1 12%     -25.5%       2032 =C2=B1  8%  sched_debug.cfs_rq[=
33]:/.tg_load_avg
     35.50 =C2=B1 56%     -95.3%       1.67 =C2=B1 28%  sched_debug.cfs_rq[=
34]:/.nr_spread_over
      2728 =C2=B1 12%     -25.5%       2032 =C2=B1  8%  sched_debug.cfs_rq[=
34]:/.tg_load_avg
     40.25 =C2=B1 56%     -96.7%       1.33 =C2=B1 35%  sched_debug.cfs_rq[=
35]:/.nr_spread_over
      2728 =C2=B1 12%     -25.5%       2032 =C2=B1  8%  sched_debug.cfs_rq[=
35]:/.tg_load_avg
     88.75 =C2=B1 26%     -97.5%       2.25 =C2=B1 48%  sched_debug.cfs_rq[=
36]:/.nr_spread_over
      2726 =C2=B1 12%     -25.6%       2027 =C2=B1  8%  sched_debug.cfs_rq[=
36]:/.tg_load_avg
     46.25 =C2=B1 25%     -94.6%       2.50 =C2=B1 66%  sched_debug.cfs_rq[=
37]:/.nr_spread_over
      2725 =C2=B1 12%     -25.6%       2028 =C2=B1  8%  sched_debug.cfs_rq[=
37]:/.tg_load_avg
    128.25 =C2=B1 33%     -99.0%       1.25 =C2=B1131%  sched_debug.cfs_rq[=
38]:/.nr_spread_over
      2723 =C2=B1 12%     -25.6%       2026 =C2=B1  9%  sched_debug.cfs_rq[=
38]:/.tg_load_avg
    128239 =C2=B1  3%      +8.6%     139228 =C2=B1  1%  sched_debug.cfs_rq[=
39]:/.exec_clock
     11.50 =C2=B1 17%     +73.9%      20.00 =C2=B1 58%  sched_debug.cfs_rq[=
39]:/.load_avg
    125.25 =C2=B1 37%     -98.4%       2.00 =C2=B1 79%  sched_debug.cfs_rq[=
39]:/.nr_spread_over
      9.25 =C2=B1 11%     +37.8%      12.75 =C2=B1 10%  sched_debug.cfs_rq[=
39]:/.runnable_load_avg
      2723 =C2=B1 12%     -25.6%       2025 =C2=B1  9%  sched_debug.cfs_rq[=
39]:/.tg_load_avg
     11.50 =C2=B1 17%     +73.9%      20.00 =C2=B1 58%  sched_debug.cfs_rq[=
39]:/.tg_load_avg_contrib
    565.25 =C2=B1 11%     +30.0%     734.75 =C2=B1  8%  sched_debug.cfs_rq[=
39]:/.util_avg
     52.75 =C2=B1 68%     -93.8%       3.25 =C2=B1 59%  sched_debug.cfs_rq[=
3]:/.nr_spread_over
      2733 =C2=B1 11%     -22.7%       2113 =C2=B1  3%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
     98.25 =C2=B1 23%     -98.7%       1.25 =C2=B1 34%  sched_debug.cfs_rq[=
40]:/.nr_spread_over
      2724 =C2=B1 12%     -24.1%       2067 =C2=B1 11%  sched_debug.cfs_rq[=
40]:/.tg_load_avg
    113.75 =C2=B1 53%     -97.1%       3.25 =C2=B1 54%  sched_debug.cfs_rq[=
41]:/.nr_spread_over
      2718 =C2=B1 12%     -23.2%       2088 =C2=B1 11%  sched_debug.cfs_rq[=
41]:/.tg_load_avg
      9.50 =C2=B1 24%    +571.1%      63.75 =C2=B1113%  sched_debug.cfs_rq[=
42]:/.load
    154.00 =C2=B1 12%     -98.4%       2.50 =C2=B1 82%  sched_debug.cfs_rq[=
42]:/.nr_spread_over
      8.00 =C2=B1 15%    +531.2%      50.50 =C2=B1118%  sched_debug.cfs_rq[=
42]:/.runnable_load_avg
      2718 =C2=B1 12%     -23.2%       2086 =C2=B1 11%  sched_debug.cfs_rq[=
42]:/.tg_load_avg
    482.00 =C2=B1 15%     +31.3%     633.00 =C2=B1  9%  sched_debug.cfs_rq[=
42]:/.util_avg
    141.75 =C2=B1 37%     -99.1%       1.25 =C2=B1 87%  sched_debug.cfs_rq[=
43]:/.nr_spread_over
      2717 =C2=B1 12%     -24.8%       2043 =C2=B1 12%  sched_debug.cfs_rq[=
43]:/.tg_load_avg
     98.00 =C2=B1 39%     -94.1%       5.75 =C2=B1 88%  sched_debug.cfs_rq[=
44]:/.nr_spread_over
      2718 =C2=B1 12%     -24.8%       2042 =C2=B1 12%  sched_debug.cfs_rq[=
44]:/.tg_load_avg
    664.00 =C2=B1  3%     +17.5%     780.25 =C2=B1  8%  sched_debug.cfs_rq[=
44]:/.util_avg
     13.25 =C2=B1 38%    +658.5%     100.50 =C2=B1 80%  sched_debug.cfs_rq[=
45]:/.load
    119.50 =C2=B1 15%     -95.3%       5.67 =C2=B1 92%  sched_debug.cfs_rq[=
45]:/.nr_spread_over
      2716 =C2=B1 12%     -24.8%       2042 =C2=B1 12%  sched_debug.cfs_rq[=
45]:/.tg_load_avg
    129025 =C2=B1  2%      +8.5%     140032 =C2=B1  2%  sched_debug.cfs_rq[=
46]:/.exec_clock
    105.50 =C2=B1 71%     -95.7%       4.50 =C2=B1 72%  sched_debug.cfs_rq[=
46]:/.nr_spread_over
      2716 =C2=B1 12%     -24.9%       2040 =C2=B1 12%  sched_debug.cfs_rq[=
46]:/.tg_load_avg
    530.25 =C2=B1 17%     +30.6%     692.50 =C2=B1  3%  sched_debug.cfs_rq[=
46]:/.util_avg
     13.50 =C2=B1 33%     +48.1%      20.00 =C2=B1 12%  sched_debug.cfs_rq[=
47]:/.load
    193.75 =C2=B1 93%     -98.6%       2.75 =C2=B1 64%  sched_debug.cfs_rq[=
47]:/.nr_spread_over
     11.25 =C2=B1 19%     +53.3%      17.25 =C2=B1  7%  sched_debug.cfs_rq[=
47]:/.runnable_load_avg
      2717 =C2=B1 12%     -25.1%       2036 =C2=B1 12%  sched_debug.cfs_rq[=
47]:/.tg_load_avg
     37.00 =C2=B1 37%     -88.5%       4.25 =C2=B1 67%  sched_debug.cfs_rq[=
4]:/.nr_spread_over
      2732 =C2=B1 11%     -22.8%       2110 =C2=B1  2%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
     27.00 =C2=B1  6%     -80.6%       5.25 =C2=B1 36%  sched_debug.cfs_rq[=
5]:/.nr_spread_over
    348.75 =C2=B1 93%     -95.6%      15.50 =C2=B1 14%  sched_debug.cfs_rq[=
5]:/.runnable_load_avg
      2733 =C2=B1 11%     -23.8%       2081 =C2=B1  4%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
    117.50 =C2=B1132%     -94.7%       6.25 =C2=B1 79%  sched_debug.cfs_rq[=
6]:/.nr_spread_over
      2732 =C2=B1 11%     -23.8%       2081 =C2=B1  4%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
     21.75 =C2=B1 18%     -89.7%       2.25 =C2=B1 57%  sched_debug.cfs_rq[=
7]:/.nr_spread_over
      2731 =C2=B1 11%     -23.7%       2083 =C2=B1  4%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
     33.00 =C2=B1 43%     -96.2%       1.25 =C2=B1 34%  sched_debug.cfs_rq[=
8]:/.nr_spread_over
      2734 =C2=B1 11%     -22.4%       2121 =C2=B1  7%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
     55.25 =C2=B1 83%     -92.3%       4.25 =C2=B1 97%  sched_debug.cfs_rq[=
9]:/.nr_spread_over
      2732 =C2=B1 12%     -22.4%       2121 =C2=B1  7%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
    884853 =C2=B1  8%      -6.8%     824464 =C2=B1  8%  sched_debug.cpu#0.a=
vg_idle
     32.25 =C2=B1 46%     -49.6%      16.25 =C2=B1  6%  sched_debug.cpu#10.=
load
    944295 =C2=B1  5%     -13.7%     814873 =C2=B1 14%  sched_debug.cpu#13.=
avg_idle
    822.00 =C2=B1 26%     +57.0%       1290 =C2=B1 31%  sched_debug.cpu#13.=
curr->pid
      2926 =C2=B1 45%    +365.2%      13610 =C2=B1 67%  sched_debug.cpu#13.=
ttwu_local
    984189 =C2=B1  0%     -13.7%     848936 =C2=B1  7%  sched_debug.cpu#16.=
avg_idle
    979503 =C2=B1  3%     -10.7%     874993 =C2=B1  5%  sched_debug.cpu#18.=
avg_idle
    995.75 =C2=B1 13%     +35.5%       1348 =C2=B1 15%  sched_debug.cpu#18.=
curr->pid
      9.25 =C2=B1 31%     +70.3%      15.75 =C2=B1 17%  sched_debug.cpu#19.=
cpu_load[0]
      9.00 =C2=B1 34%     +77.8%      16.00 =C2=B1 15%  sched_debug.cpu#19.=
cpu_load[1]
      9.25 =C2=B1 31%     +75.7%      16.25 =C2=B1 14%  sched_debug.cpu#19.=
cpu_load[2]
      9.25 =C2=B1 31%     +75.7%      16.25 =C2=B1 14%  sched_debug.cpu#19.=
cpu_load[3]
      9.75 =C2=B1 29%     +66.7%      16.25 =C2=B1 14%  sched_debug.cpu#19.=
cpu_load[4]
    883.25 =C2=B1 32%     +73.4%       1531 =C2=B1 34%  sched_debug.cpu#19.=
curr->pid
     10.50 =C2=B1 38%    +154.8%      26.75 =C2=B1 46%  sched_debug.cpu#19.=
load
      2117 =C2=B1 10%    +356.6%       9667 =C2=B1 48%  sched_debug.cpu#19.=
ttwu_local
    700.50 =C2=B1 31%    +136.0%       1653 =C2=B1 14%  sched_debug.cpu#2.t=
twu_local
      8.75 =C2=B1 40%     +85.7%      16.25 =C2=B1  6%  sched_debug.cpu#20.=
cpu_load[0]
      8.75 =C2=B1 40%     +85.7%      16.25 =C2=B1  6%  sched_debug.cpu#20.=
cpu_load[1]
      8.75 =C2=B1 40%     +85.7%      16.25 =C2=B1  6%  sched_debug.cpu#20.=
cpu_load[2]
      9.00 =C2=B1 37%     +80.6%      16.25 =C2=B1  6%  sched_debug.cpu#20.=
cpu_load[3]
      9.25 =C2=B1 33%     +75.7%      16.25 =C2=B1  6%  sched_debug.cpu#20.=
cpu_load[4]
    770.25 =C2=B1 41%     +51.8%       1169 =C2=B1  9%  sched_debug.cpu#20.=
curr->pid
      9.25 =C2=B1 44%    +105.4%      19.00 =C2=B1  0%  sched_debug.cpu#20.=
load
     10.75 =C2=B1 10%    +430.2%      57.00 =C2=B1127%  sched_debug.cpu#21.=
cpu_load[1]
     10.75 =C2=B1 10%    +490.7%      63.50 =C2=B1108%  sched_debug.cpu#21.=
cpu_load[2]
     11.00 =C2=B1 11%    +579.5%      74.75 =C2=B1 91%  sched_debug.cpu#21.=
cpu_load[3]
     11.25 =C2=B1 13%    +646.7%      84.00 =C2=B1 84%  sched_debug.cpu#21.=
cpu_load[4]
     10.50 =C2=B1 14%    +431.0%      55.75 =C2=B1131%  sched_debug.cpu#23.=
cpu_load[0]
     10.50 =C2=B1 14%    +433.3%      56.00 =C2=B1132%  sched_debug.cpu#23.=
cpu_load[1]
      2403 =C2=B1 15%    +120.0%       5288 =C2=B1 56%  sched_debug.cpu#23.=
ttwu_local
    562.50 =C2=B1 35%    +492.5%       3332 =C2=B1 72%  sched_debug.cpu#24.=
ttwu_local
      8080 =C2=B1 40%    +118.7%      17673 =C2=B1 59%  sched_debug.cpu#25.=
nr_switches
      9373 =C2=B1 35%     +96.7%      18439 =C2=B1 56%  sched_debug.cpu#25.=
sched_count
      2073 =C2=B1 78%    +215.0%       6531 =C2=B1 77%  sched_debug.cpu#25.=
sched_goidle
      3178 =C2=B1 61%    +114.1%       6803 =C2=B1 45%  sched_debug.cpu#25.=
ttwu_count
    472.75 =C2=B1 20%    +326.8%       2017 =C2=B1 20%  sched_debug.cpu#25.=
ttwu_local
    535.25 =C2=B1 32%    +215.8%       1690 =C2=B1 26%  sched_debug.cpu#26.=
ttwu_local
    930733 =C2=B1  7%     -28.9%     661366 =C2=B1 13%  sched_debug.cpu#27.=
avg_idle
    967080 =C2=B1  5%     -20.0%     773442 =C2=B1 18%  sched_debug.cpu#29.=
avg_idle
      2763 =C2=B1 74%    +165.8%       7343 =C2=B1 34%  sched_debug.cpu#29.=
ttwu_count
    483.00 =C2=B1 16%    +579.6%       3282 =C2=B1 86%  sched_debug.cpu#29.=
ttwu_local
      3825 =C2=B1 43%     +70.0%       6504 =C2=B1 16%  sched_debug.cpu#3.t=
twu_count
    847.00 =C2=B1 25%    +169.5%       2282 =C2=B1  2%  sched_debug.cpu#3.t=
twu_local
    917918 =C2=B1  8%     -14.5%     784711 =C2=B1  6%  sched_debug.cpu#30.=
avg_idle
     19.75 =C2=B1  9%     -26.6%      14.50 =C2=B1 14%  sched_debug.cpu#30.=
load
      1.00 =C2=B1  0%    -100.0%       0.00 =C2=B1  0%  sched_debug.cpu#30.=
nr_running
    480.25 =C2=B1 22%    +241.9%       1641 =C2=B1 15%  sched_debug.cpu#31.=
ttwu_local
    522.00 =C2=B1 13%    +245.2%       1802 =C2=B1 17%  sched_debug.cpu#32.=
ttwu_local
    569.00 =C2=B1 23%    +223.9%       1842 =C2=B1  3%  sched_debug.cpu#33.=
ttwu_local
    540.25 =C2=B1 20%    +172.5%       1472 =C2=B1  5%  sched_debug.cpu#34.=
ttwu_local
      3218 =C2=B1 34%    +125.6%       7260 =C2=B1 29%  sched_debug.cpu#36.=
ttwu_local
      9.50 =C2=B1 11%     +44.7%      13.75 =C2=B1 12%  sched_debug.cpu#39.=
cpu_load[0]
      9.50 =C2=B1 11%     +44.7%      13.75 =C2=B1 12%  sched_debug.cpu#39.=
cpu_load[1]
      9.50 =C2=B1 11%     +44.7%      13.75 =C2=B1 12%  sched_debug.cpu#39.=
cpu_load[2]
      9.50 =C2=B1 11%     +44.7%      13.75 =C2=B1 12%  sched_debug.cpu#39.=
cpu_load[3]
      9.50 =C2=B1 11%     +44.7%      13.75 =C2=B1 12%  sched_debug.cpu#39.=
cpu_load[4]
    990695 =C2=B1  1%     -17.0%     822031 =C2=B1  8%  sched_debug.cpu#4.a=
vg_idle
     11.00 =C2=B1 24%     +79.5%      19.75 =C2=B1 32%  sched_debug.cpu#40.=
cpu_load[0]
     11.00 =C2=B1 24%     +77.3%      19.50 =C2=B1 31%  sched_debug.cpu#40.=
cpu_load[1]
     11.25 =C2=B1 22%     +73.3%      19.50 =C2=B1 31%  sched_debug.cpu#40.=
cpu_load[2]
     11.50 =C2=B1 19%     +69.6%      19.50 =C2=B1 31%  sched_debug.cpu#40.=
cpu_load[3]
     11.50 =C2=B1 19%     +69.6%      19.50 =C2=B1 31%  sched_debug.cpu#40.=
cpu_load[4]
      8.00 =C2=B1 15%    +525.0%      50.00 =C2=B1120%  sched_debug.cpu#42.=
cpu_load[0]
      8.25 =C2=B1 17%    +506.1%      50.00 =C2=B1121%  sched_debug.cpu#42.=
cpu_load[1]
      8.25 =C2=B1 17%    +503.0%      49.75 =C2=B1122%  sched_debug.cpu#42.=
cpu_load[2]
      8.25 =C2=B1 17%    +500.0%      49.50 =C2=B1121%  sched_debug.cpu#42.=
cpu_load[3]
      8.25 =C2=B1 17%    +521.2%      51.25 =C2=B1122%  sched_debug.cpu#42.=
cpu_load[4]
    792.75 =C2=B1 25%    +182.2%       2236 =C2=B1 30%  sched_debug.cpu#42.=
curr->pid
      9.50 =C2=B1 24%    +571.1%      63.75 =C2=B1113%  sched_debug.cpu#42.=
load
      3297 =C2=B1 11%     -27.2%       2400 =C2=B1 14%  sched_debug.cpu#44.=
ttwu_local
     13.25 =C2=B1 38%    +658.5%     100.50 =C2=B1 80%  sched_debug.cpu#45.=
load
      8235 =C2=B1 60%     -61.4%       3183 =C2=B1 36%  sched_debug.cpu#45.=
ttwu_local
     11.75 =C2=B1 21%     +44.7%      17.00 =C2=B1  9%  sched_debug.cpu#47.=
cpu_load[0]
     11.50 =C2=B1 19%     +45.7%      16.75 =C2=B1 10%  sched_debug.cpu#47.=
cpu_load[1]
     11.50 =C2=B1 19%     +45.7%      16.75 =C2=B1 10%  sched_debug.cpu#47.=
cpu_load[2]
     11.25 =C2=B1 19%     +46.7%      16.50 =C2=B1 12%  sched_debug.cpu#47.=
cpu_load[3]
     11.25 =C2=B1 19%     +46.7%      16.50 =C2=B1 12%  sched_debug.cpu#47.=
cpu_load[4]
     13.50 =C2=B1 33%     +48.1%      20.00 =C2=B1 12%  sched_debug.cpu#47.=
load
    348.75 =C2=B1 93%     -95.6%      15.50 =C2=B1 14%  sched_debug.cpu#5.c=
pu_load[0]
    349.25 =C2=B1 93%     -95.6%      15.25 =C2=B1 15%  sched_debug.cpu#5.c=
pu_load[1]
    349.25 =C2=B1 93%     -95.6%      15.25 =C2=B1 15%  sched_debug.cpu#5.c=
pu_load[2]
    349.00 =C2=B1 93%     -95.6%      15.25 =C2=B1 15%  sched_debug.cpu#5.c=
pu_load[3]
    349.00 =C2=B1 93%     -95.6%      15.25 =C2=B1 15%  sched_debug.cpu#5.c=
pu_load[4]
    788.00 =C2=B1 41%    +132.6%       1833 =C2=B1 32%  sched_debug.cpu#5.c=
urr->pid
    990.75 =C2=B1 39%     +72.2%       1706 =C2=B1 15%  sched_debug.cpu#6.t=
twu_local
     -7.00 =C2=B1-92%    -178.6%       5.50 =C2=B1155%  sched_debug.cpu#7.n=
r_uninterruptible
      2511 =C2=B1 55%     +76.4%       4430 =C2=B1 28%  sched_debug.cpu#7.s=
ched_goidle
    683.50 =C2=B1 19%    +147.2%       1689 =C2=B1 22%  sched_debug.cpu#9.t=
twu_local
      1.70 =C2=B1 28%     -47.4%       0.89 =C2=B1 57%  sched_debug.rt_rq[0=
]:/.rt_time

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/runtime/test:
  ivb43/vm-scalability/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/per=
formance/300s/mmap-xread-rand-mt

commit: =

  5b74283ab251b9db55cbbe31d19ca72482103290
  72b252aed506b8f1a03f7abd29caef4cdf6a043b

5b74283ab251b9db 72b252aed506b8f1a03f7abd29 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      0.00 =C2=B1100%    -100.0%       0.00 =C2=B1 -1%  vm-scalability.stdd=
ev
    126269 =C2=B1  2%     -34.6%      82602 =C2=B1  0%  vm-scalability.time=
.involuntary_context_switches
  54531943 =C2=B1  0%     +14.8%   62613165 =C2=B1  0%  vm-scalability.time=
.major_page_faults
  61436008 =C2=B1  0%     +21.6%   74727557 =C2=B1  0%  vm-scalability.time=
.minor_page_faults
      4056 =C2=B1  0%      -5.6%       3829 =C2=B1  0%  vm-scalability.time=
.percent_of_cpu_this_job_got
     12654 =C2=B1  0%      -5.8%      11920 =C2=B1  0%  vm-scalability.time=
.system_time
     74.56 =C2=B1  0%     +19.5%      89.11 =C2=B1  0%  vm-scalability.time=
.user_time
  36350857 =C2=B1  0%     +24.5%   45240434 =C2=B1  0%  vm-scalability.time=
.voluntary_context_switches
   4403716 =C2=B1  0%     +14.8%    5056679 =C2=B1  0%  softirqs.SCHED
    243364 =C2=B1  1%     -12.7%     212578 =C2=B1  0%  meminfo.Active(anon)
    263911 =C2=B1  1%     -11.9%     232436 =C2=B1  0%  meminfo.Shmem
     14808 =C2=B1 78%    +158.3%      38252 =C2=B1  7%  numa-meminfo.node0.=
Inactive(anon)
     29051 =C2=B1 39%     -82.4%       5114 =C2=B1 52%  numa-meminfo.node1.=
Inactive(anon)
     39481 =C2=B1120%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.p=
ipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
     39481 =C2=B1120%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.p=
ipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
     39481 =C2=B1120%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.p=
ipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
      6.25 =C2=B1  6%     +44.0%       9.00 =C2=B1  0%  vmstat.procs.b
    230932 =C2=B1  0%     +23.0%     284130 =C2=B1  0%  vmstat.system.cs
   1554716 =C2=B1  0%     -85.8%     220448 =C2=B1  1%  vmstat.system.in
     85.52 =C2=B1  0%      -3.7%      82.40 =C2=B1  0%  turbostat.%Busy
      2559 =C2=B1  0%      -3.6%       2466 =C2=B1  0%  turbostat.Avg_MHz
     10.56 =C2=B1  1%     +29.9%      13.71 =C2=B1  1%  turbostat.CPU%c1
      7.91 =C2=B1  1%      -4.1%       7.58 =C2=B1  0%  turbostat.RAMWatt
    126269 =C2=B1  2%     -34.6%      82602 =C2=B1  0%  time.involuntary_co=
ntext_switches
  54531943 =C2=B1  0%     +14.8%   62613165 =C2=B1  0%  time.major_page_fau=
lts
  61436008 =C2=B1  0%     +21.6%   74727557 =C2=B1  0%  time.minor_page_fau=
lts
     74.56 =C2=B1  0%     +19.5%      89.11 =C2=B1  0%  time.user_time
  36350857 =C2=B1  0%     +24.5%   45240434 =C2=B1  0%  time.voluntary_cont=
ext_switches
  20018030 =C2=B1 15%     -31.3%   13752133 =C2=B1 19%  numa-numastat.node0=
.numa_foreign
  22812255 =C2=B1 14%     -26.2%   16838094 =C2=B1 22%  numa-numastat.node0=
.numa_miss
  22812919 =C2=B1 14%     -26.2%   16838306 =C2=B1 22%  numa-numastat.node0=
.other_node
  22812255 =C2=B1 14%     -26.2%   16838094 =C2=B1 22%  numa-numastat.node1=
.numa_foreign
  20018030 =C2=B1 15%     -31.3%   13752133 =C2=B1 19%  numa-numastat.node1=
.numa_miss
  20018852 =C2=B1 15%     -31.3%   13752234 =C2=B1 19%  numa-numastat.node1=
.other_node
 1.228e+09 =C2=B1  0%     +37.4%  1.688e+09 =C2=B1  1%  cpuidle.C1-IVT.time
  32340120 =C2=B1  0%     +57.8%   51035613 =C2=B1  0%  cpuidle.C1-IVT.usage
 2.121e+08 =C2=B1  1%     -40.8%  1.256e+08 =C2=B1  2%  cpuidle.C1E-IVT.time
   4533185 =C2=B1  1%     -30.5%    3149430 =C2=B1  2%  cpuidle.C1E-IVT.usa=
ge
  40110810 =C2=B1  5%     -23.7%   30624162 =C2=B1  2%  cpuidle.C3-IVT.time
    809767 =C2=B1  4%     -25.7%     601425 =C2=B1  2%  cpuidle.C3-IVT.usage
 7.123e+08 =C2=B1  1%     +15.3%  8.215e+08 =C2=B1  2%  cpuidle.C6-IVT.time
     42448 =C2=B1  3%     +31.4%      55772 =C2=B1  1%  cpuidle.C6-IVT.usage
    708.00 =C2=B1  7%     +50.5%       1065 =C2=B1  1%  cpuidle.POLL.usage
    634.50 =C2=B1  6%  +1.1e+08%  6.895e+08 =C2=B1173%  numa-vmstat.node0.n=
r_alloc_batch
      3666 =C2=B1 77%    +160.9%       9563 =C2=B1  7%  numa-vmstat.node0.n=
r_inactive_anon
    201.25 =C2=B1  3%     -92.0%      16.00 =C2=B1  4%  numa-vmstat.node0.n=
r_isolated_file
    175.50 =C2=B1  9%     -38.6%     107.75 =C2=B1 12%  numa-vmstat.node0.n=
r_pages_scanned
   7984325 =C2=B1 15%     -32.2%    5409698 =C2=B1 19%  numa-vmstat.node0.n=
uma_foreign
   9373650 =C2=B1 16%     -31.0%    6467646 =C2=B1 18%  numa-vmstat.node0.n=
uma_miss
   9407096 =C2=B1 16%     -30.9%    6503985 =C2=B1 18%  numa-vmstat.node0.n=
uma_other
      7259 =C2=B1 39%     -82.3%       1283 =C2=B1 52%  numa-vmstat.node1.n=
r_inactive_anon
    210.50 =C2=B1  4%     -92.8%      15.25 =C2=B1  8%  numa-vmstat.node1.n=
r_isolated_file
   9373769 =C2=B1 16%     -31.0%    6467702 =C2=B1 18%  numa-vmstat.node1.n=
uma_foreign
   7984344 =C2=B1 15%     -32.2%    5409734 =C2=B1 19%  numa-vmstat.node1.n=
uma_miss
   8035100 =C2=B1 15%     -32.1%    5457314 =C2=B1 19%  numa-vmstat.node1.n=
uma_other
   4550721 =C2=B1  2%      -9.2%    4133466 =C2=B1  3%  numa-vmstat.node1.w=
orkingset_refault
     17565 =C2=B1  1%     -93.7%       1100 =C2=B1 17%  proc-vmstat.allocst=
all
  26050728 =C2=B1 51%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.compact=
_free_scanned
     11858 =C2=B1 50%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.compact=
_isolated
      8749 =C2=B1 55%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.compact=
_migrate_scanned
    127.00 =C2=B1 27%     -94.9%       6.50 =C2=B1 13%  proc-vmstat.kswapd_=
high_wmark_hit_quickly
    819.75 =C2=B1  6%    +504.4%       4954 =C2=B1  2%  proc-vmstat.kswapd_=
low_wmark_hit_quickly
     60853 =C2=B1  1%     -12.7%      53103 =C2=B1  0%  proc-vmstat.nr_acti=
ve_anon
    392.00 =C2=B1 12%     -91.8%      32.00 =C2=B1  4%  proc-vmstat.nr_isol=
ated_file
     65986 =C2=B1  1%     -11.9%      58109 =C2=B1  0%  proc-vmstat.nr_shmem
  42830286 =C2=B1  3%     -28.6%   30590228 =C2=B1  4%  proc-vmstat.numa_fo=
reign
     23780 =C2=B1  2%     +10.3%      26221 =C2=B1  1%  proc-vmstat.numa_hi=
nt_faults
  42830286 =C2=B1  3%     -28.6%   30590228 =C2=B1  4%  proc-vmstat.numa_mi=
ss
  42831486 =C2=B1  3%     -28.6%   30590541 =C2=B1  4%  proc-vmstat.numa_ot=
her
      2691 =C2=B1  3%     -23.5%       2058 =C2=B1  4%  proc-vmstat.numa_pa=
ges_migrated
     23782 =C2=B1  2%     +10.4%      26252 =C2=B1  1%  proc-vmstat.numa_pt=
e_updates
      1837 =C2=B1  5%    +181.5%       5172 =C2=B1  2%  proc-vmstat.pageout=
run
   2908119 =C2=B1  0%     +23.8%    3599604 =C2=B1  0%  proc-vmstat.pgactiv=
ate
   4987674 =C2=B1  3%     +10.9%    5529373 =C2=B1  3%  proc-vmstat.pgdeact=
ivate
 1.626e+08 =C2=B1  0%     +19.0%  1.935e+08 =C2=B1  0%  proc-vmstat.pgfault
  54531943 =C2=B1  0%     +14.8%   62613165 =C2=B1  0%  proc-vmstat.pgmajfa=
ult
      7894 =C2=B1 34%     -73.9%       2058 =C2=B1  4%  proc-vmstat.pgmigra=
te_success
   4786175 =C2=B1  3%     +10.8%    5302705 =C2=B1  3%  proc-vmstat.pgrefil=
l_normal
   2040051 =C2=B1  2%     -91.0%     183121 =C2=B1 15%  proc-vmstat.pgscan_=
direct_dma32
  45762582 =C2=B1  2%     -91.1%    4067173 =C2=B1 15%  proc-vmstat.pgscan_=
direct_normal
    671597 =C2=B1  7%    +275.0%    2518325 =C2=B1  3%  proc-vmstat.pgscan_=
kswapd_dma32
  14881691 =C2=B1  4%    +276.0%   55960850 =C2=B1  1%  proc-vmstat.pgscan_=
kswapd_normal
   1220132 =C2=B1  0%     -98.6%      16599 =C2=B1 24%  proc-vmstat.pgsteal=
_direct_dma32
  27161268 =C2=B1  1%     -98.2%     501766 =C2=B1 21%  proc-vmstat.pgsteal=
_direct_normal
    135733 =C2=B1  5%    +853.3%    1293969 =C2=B1  4%  proc-vmstat.pgsteal=
_kswapd_dma32
   4269136 =C2=B1  2%    +592.9%   29581898 =C2=B1  1%  proc-vmstat.pgsteal=
_kswapd_normal
      1.00 =C2=B1  2%     +35.0%       1.35 =C2=B1  2%  perf-profile.cpu-cy=
cles.__account_scheduler_latency.enqueue_entity.enqueue_task_fair.enqueue_t=
ask.activate_task
      2.66 =C2=B1  4%     +42.5%       3.78 =C2=B1  1%  perf-profile.cpu-cy=
cles.__add_to_page_cache_locked.add_to_page_cache_lru.filemap_fault.xfs_fil=
emap_fault.__do_fault
     38.25 =C2=B1  3%     +25.5%      48.02 =C2=B1  0%  perf-profile.cpu-cy=
cles.__add_to_page_cache_locked.add_to_page_cache_lru.mpage_readpages.xfs_v=
m_readpages.__do_page_cache_readahead
      9.90 =C2=B1 22%     -91.3%       0.86 =C2=B1  8%  perf-profile.cpu-cy=
cles.__alloc_pages_nodemask.alloc_pages_current.__page_cache_alloc.__do_pag=
e_cache_readahead.filemap_fault
     13.14 =C2=B1 36%     -96.9%       0.41 =C2=B1 51%  perf-profile.cpu-cy=
cles.__alloc_pages_nodemask.alloc_pages_current.__page_cache_alloc.filemap_=
fault.xfs_filemap_fault
     69.25 =C2=B1  1%     -14.5%      59.24 =C2=B1  0%  perf-profile.cpu-cy=
cles.__do_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      1.54 =C2=B1  4%     +28.9%       1.99 =C2=B1  2%  perf-profile.cpu-cy=
cles.__lock_page_or_retry.filemap_fault.xfs_filemap_fault.__do_fault.handle=
_mm_fault
      9.99 =C2=B1 21%     -90.7%       0.93 =C2=B1 12%  perf-profile.cpu-cy=
cles.__page_cache_alloc.__do_page_cache_readahead.filemap_fault.xfs_filemap=
_fault.__do_fault
     13.16 =C2=B1 36%     -96.8%       0.42 =C2=B1 48%  perf-profile.cpu-cy=
cles.__page_cache_alloc.filemap_fault.xfs_filemap_fault.__do_fault.handle_m=
m_fault
      2.24 =C2=B1  8%     -97.7%       0.05 =C2=B1  8%  perf-profile.cpu-cy=
cles.__page_check_address.page_referenced_one.rmap_walk.page_referenced.shr=
ink_page_list
      0.83 =C2=B1  9%     +26.0%       1.05 =C2=B1  0%  perf-profile.cpu-cy=
cles.__radix_tree_lookup.__do_page_cache_readahead.filemap_fault.xfs_filema=
p_fault.__do_fault
      1.46 =C2=B1  1%     +32.2%       1.93 =C2=B1  0%  perf-profile.cpu-cy=
cles.__wait_on_bit.wait_on_page_bit_killable.__lock_page_or_retry.filemap_f=
ault.xfs_filemap_fault
      1.69 =C2=B1  2%     +27.3%       2.15 =C2=B1  0%  perf-profile.cpu-cy=
cles.__wake_up.__wake_up_bit.unlock_page.handle_mm_fault.__do_page_fault
      1.66 =C2=B1  0%     +28.1%       2.13 =C2=B1  0%  perf-profile.cpu-cy=
cles.__wake_up_bit.unlock_page.handle_mm_fault.__do_page_fault.do_page_fault
      0.87 =C2=B1  0%     +50.1%       1.30 =C2=B1  0%  perf-profile.cpu-cy=
cles.__wake_up_common.__wake_up.__wake_up_bit.unlock_page.handle_mm_fault
      2.19 =C2=B1  9%     -99.2%       0.02 =C2=B1 24%  perf-profile.cpu-cy=
cles._raw_spin_lock.__page_check_address.page_referenced_one.rmap_walk.page=
_referenced
     22.99 =C2=B1  4%     +30.6%      30.02 =C2=B1  0%  perf-profile.cpu-cy=
cles._raw_spin_lock.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      2.60 =C2=B1  5%     +42.3%       3.70 =C2=B1  1%  perf-profile.cpu-cy=
cles._raw_spin_lock_irq.__add_to_page_cache_locked.add_to_page_cache_lru.fi=
lemap_fault.xfs_filemap_fault
     37.36 =C2=B1  3%     +25.5%      46.89 =C2=B1  0%  perf-profile.cpu-cy=
cles._raw_spin_lock_irq.__add_to_page_cache_locked.add_to_page_cache_lru.mp=
age_readpages.xfs_vm_readpages
      2.70 =C2=B1  5%     +41.7%       3.83 =C2=B1  1%  perf-profile.cpu-cy=
cles.add_to_page_cache_lru.filemap_fault.xfs_filemap_fault.__do_fault.handl=
e_mm_fault
     38.85 =C2=B1  3%     +24.8%      48.48 =C2=B1  0%  perf-profile.cpu-cy=
cles.add_to_page_cache_lru.mpage_readpages.xfs_vm_readpages.__do_page_cache=
_readahead.filemap_fault
      9.96 =C2=B1 21%     -91.0%       0.90 =C2=B1  9%  perf-profile.cpu-cy=
cles.alloc_pages_current.__page_cache_alloc.__do_page_cache_readahead.filem=
ap_fault.xfs_filemap_fault
     13.16 =C2=B1 36%     -96.9%       0.40 =C2=B1 50%  perf-profile.cpu-cy=
cles.alloc_pages_current.__page_cache_alloc.filemap_fault.xfs_filemap_fault=
.__do_fault
      0.96 =C2=B1  0%     +49.0%       1.43 =C2=B1  0%  perf-profile.cpu-cy=
cles.autoremove_wake_function.wake_bit_function.__wake_up_common.__wake_up.=
__wake_up_bit
      1.06 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.call_function_interrupt.physflat_send_IPI_mask.native_send_call_func_i=
pi.smp_call_function_many.native_flush_tlb_others
      1.97 =C2=B1  3%     +33.4%       2.63 =C2=B1  1%  perf-profile.cpu-cy=
cles.cpu_startup_entry.start_secondary
      2.52 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.default_send_IPI_mask_allbutself_phys.physflat_send_IPI_allbutself.nat=
ive_send_call_func_ipi.smp_call_function_many.native_flush_tlb_others
      8.80 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.default_send_IPI_mask_sequence_phys.physflat_send_IPI_mask.native_send=
_call_func_ipi.smp_call_function_many.native_flush_tlb_others
      0.96 =C2=B1  0%     +46.9%       1.41 =C2=B1  1%  perf-profile.cpu-cy=
cles.default_wake_function.autoremove_wake_function.wake_bit_function.__wak=
e_up_common.__wake_up
     22.40 =C2=B1 13%     -98.0%       0.45 =C2=B1  2%  perf-profile.cpu-cy=
cles.do_try_to_free_pages.try_to_free_pages.__alloc_pages_nodemask.alloc_pa=
ges_current.__page_cache_alloc
      0.93 =C2=B1  2%     +17.5%       1.09 =C2=B1  1%  perf-profile.cpu-cy=
cles.dump_trace.save_stack_trace_tsk.__account_scheduler_latency.enqueue_en=
tity.enqueue_task_fair
      1.14 =C2=B1  2%     +57.0%       1.78 =C2=B1  1%  perf-profile.cpu-cy=
cles.enqueue_entity.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_ac=
tivate
     69.10 =C2=B1  1%     -14.6%      59.01 =C2=B1  0%  perf-profile.cpu-cy=
cles.filemap_fault.xfs_filemap_fault.__do_fault.handle_mm_fault.__do_page_f=
ault
      1.05 =C2=B1  4%     +37.8%       1.44 =C2=B1  0%  perf-profile.cpu-cy=
cles.filemap_map_pages.handle_mm_fault.__do_page_fault.do_page_fault.page_f=
ault
      1.01 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.flush_tlb_func.flush_smp_call_function_queue.generic_smp_call_function=
_single_interrupt.smp_call_function_interrupt.call_function_interrupt
     18.12 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.flush_tlb_page.ptep_clear_flush.try_to_unmap_one.rmap_walk.try_to_unmap
      1.49 =C2=B1  4%     +73.9%       2.60 =C2=B1  4%  perf-profile.cpu-cy=
cles.kswapd.kthread.ret_from_fork
      1.50 =C2=B1  4%     +73.2%       2.60 =C2=B1  4%  perf-profile.cpu-cy=
cles.kthread.ret_from_fork
      1.16 =C2=B1 17%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.llist_add_batch.smp_call_function_many.native_flush_tlb_others.flush_t=
lb_page.ptep_clear_flush
     39.67 =C2=B1  3%     +24.2%      49.29 =C2=B1  0%  perf-profile.cpu-cy=
cles.mpage_readpages.xfs_vm_readpages.__do_page_cache_readahead.filemap_fau=
lt.xfs_filemap_fault
     18.10 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.native_flush_tlb_others.flush_tlb_page.ptep_clear_flush.try_to_unmap_o=
ne.rmap_walk
      1.68 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.native_queued_spin_lock_slowpath._raw_spin_lock.__page_check_address.p=
age_referenced_one.rmap_walk
     22.57 =C2=B1  4%     +30.8%      29.52 =C2=B1  0%  perf-profile.cpu-cy=
cles.native_queued_spin_lock_slowpath._raw_spin_lock.handle_mm_fault.__do_p=
age_fault.do_page_fault
      2.56 =C2=B1  5%     +42.3%       3.65 =C2=B1  1%  perf-profile.cpu-cy=
cles.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__add_to_page_cach=
e_locked.add_to_page_cache_lru.filemap_fault
     36.95 =C2=B1  3%     +25.6%      46.42 =C2=B1  0%  perf-profile.cpu-cy=
cles.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__add_to_page_cach=
e_locked.add_to_page_cache_lru.mpage_readpages
      0.80 =C2=B1 29%     +92.5%       1.55 =C2=B1  3%  perf-profile.cpu-cy=
cles.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__remove_mappi=
ng.shrink_page_list.shrink_inactive_list
     12.80 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.native_send_call_func_ipi.smp_call_function_many.native_flush_tlb_othe=
rs.flush_tlb_page.ptep_clear_flush
      2.48 =C2=B1  9%     -89.9%       0.25 =C2=B1  2%  perf-profile.cpu-cy=
cles.page_referenced.shrink_page_list.shrink_inactive_list.shrink_lruvec.sh=
rink_zone
      2.29 =C2=B1 11%     -95.1%       0.11 =C2=B1  3%  perf-profile.cpu-cy=
cles.page_referenced_one.rmap_walk.page_referenced.shrink_page_list.shrink_=
inactive_list
      2.85 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.physflat_send_IPI_allbutself.native_send_call_func_ipi.smp_call_functi=
on_many.native_flush_tlb_others.flush_tlb_page
      9.91 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.physflat_send_IPI_mask.native_send_call_func_ipi.smp_call_function_man=
y.native_flush_tlb_others.flush_tlb_page
      0.90 =C2=B1  2%     +15.0%       1.04 =C2=B1  0%  perf-profile.cpu-cy=
cles.print_context_stack.dump_trace.save_stack_trace_tsk.__account_schedule=
r_latency.enqueue_entity
     18.14 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.ptep_clear_flush.try_to_unmap_one.rmap_walk.try_to_unmap.shrink_page_l=
ist
      1.50 =C2=B1  4%     +73.2%       2.60 =C2=B1  4%  perf-profile.cpu-cy=
cles.ret_from_fork
      2.46 =C2=B1  9%     -90.5%       0.23 =C2=B1  4%  perf-profile.cpu-cy=
cles.rmap_walk.page_referenced.shrink_page_list.shrink_inactive_list.shrink=
_lruvec
     18.72 =C2=B1 12%     -99.5%       0.09 =C2=B1 24%  perf-profile.cpu-cy=
cles.rmap_walk.try_to_unmap.shrink_page_list.shrink_inactive_list.shrink_lr=
uvec
      0.93 =C2=B1  2%     +17.7%       1.10 =C2=B1  0%  perf-profile.cpu-cy=
cles.save_stack_trace_tsk.__account_scheduler_latency.enqueue_entity.enqueu=
e_task_fair.enqueue_task
      0.75 =C2=B1  4%     +30.9%       0.99 =C2=B1  1%  perf-profile.cpu-cy=
cles.sched_ttwu_pending.cpu_startup_entry.start_secondary
     22.43 =C2=B1 13%     -98.0%       0.45 =C2=B1  2%  perf-profile.cpu-cy=
cles.shrink_inactive_list.shrink_lruvec.shrink_zone.do_try_to_free_pages.tr=
y_to_free_pages
      1.49 =C2=B1  4%     +73.5%       2.59 =C2=B1  4%  perf-profile.cpu-cy=
cles.shrink_inactive_list.shrink_lruvec.shrink_zone.kswapd.kthread
     22.44 =C2=B1 13%     -98.0%       0.45 =C2=B1  2%  perf-profile.cpu-cy=
cles.shrink_lruvec.shrink_zone.do_try_to_free_pages.try_to_free_pages.__all=
oc_pages_nodemask
      1.49 =C2=B1  4%     +73.5%       2.59 =C2=B1  4%  perf-profile.cpu-cy=
cles.shrink_lruvec.shrink_zone.kswapd.kthread.ret_from_fork
     22.36 =C2=B1 13%     -98.1%       0.43 =C2=B1  3%  perf-profile.cpu-cy=
cles.shrink_page_list.shrink_inactive_list.shrink_lruvec.shrink_zone.do_try=
_to_free_pages
      1.45 =C2=B1  4%     +72.9%       2.50 =C2=B1  4%  perf-profile.cpu-cy=
cles.shrink_page_list.shrink_inactive_list.shrink_lruvec.shrink_zone.kswapd
     22.40 =C2=B1 13%     -98.0%       0.45 =C2=B1  2%  perf-profile.cpu-cy=
cles.shrink_zone.do_try_to_free_pages.try_to_free_pages.__alloc_pages_nodem=
ask.alloc_pages_current
      1.49 =C2=B1  4%     +73.9%       2.60 =C2=B1  4%  perf-profile.cpu-cy=
cles.shrink_zone.kswapd.kthread.ret_from_fork
      0.83 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.smp_call_function_interrupt.call_function_interrupt.physflat_send_IPI_=
mask.native_send_call_func_ipi.smp_call_function_many
     17.35 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.smp_call_function_many.native_flush_tlb_others.flush_tlb_page.ptep_cle=
ar_flush.try_to_unmap_one
      1.99 =C2=B1  3%     +33.5%       2.66 =C2=B1  1%  perf-profile.cpu-cy=
cles.start_secondary
      9.29 =C2=B1 23%     -99.0%       0.09 =C2=B1 72%  perf-profile.cpu-cy=
cles.try_to_free_pages.__alloc_pages_nodemask.alloc_pages_current.__page_ca=
che_alloc.__do_page_cache_readahead
     13.11 =C2=B1 36%     -97.3%       0.35 =C2=B1 17%  perf-profile.cpu-cy=
cles.try_to_free_pages.__alloc_pages_nodemask.alloc_pages_current.__page_ca=
che_alloc.filemap_fault
     18.73 =C2=B1 13%     -99.5%       0.10 =C2=B1 23%  perf-profile.cpu-cy=
cles.try_to_unmap.shrink_page_list.shrink_inactive_list.shrink_lruvec.shrin=
k_zone
     18.62 =C2=B1 12%     -99.7%       0.06 =C2=B1 27%  perf-profile.cpu-cy=
cles.try_to_unmap_one.rmap_walk.try_to_unmap.shrink_page_list.shrink_inacti=
ve_list
      0.96 =C2=B1  0%     +42.7%       1.37 =C2=B1  2%  perf-profile.cpu-cy=
cles.try_to_wake_up.default_wake_function.autoremove_wake_function.wake_bit=
_function.__wake_up_common
      1.61 =C2=B1  1%     +40.8%       2.27 =C2=B1  2%  perf-profile.cpu-cy=
cles.unlock_page.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      1.47 =C2=B1  2%     +31.2%       1.93 =C2=B1  1%  perf-profile.cpu-cy=
cles.wait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.xfs_filem=
ap_fault.__do_fault
      0.93 =C2=B1  0%     +49.5%       1.39 =C2=B1  0%  perf-profile.cpu-cy=
cles.wake_bit_function.__wake_up_common.__wake_up.__wake_up_bit.unlock_page
     69.23 =C2=B1  1%     -14.5%      59.20 =C2=B1  0%  perf-profile.cpu-cy=
cles.xfs_filemap_fault.__do_fault.handle_mm_fault.__do_page_fault.do_page_f=
ault
     39.68 =C2=B1  3%     +24.3%      49.30 =C2=B1  0%  perf-profile.cpu-cy=
cles.xfs_vm_readpages.__do_page_cache_readahead.filemap_fault.xfs_filemap_f=
ault.__do_fault
      1308 =C2=B1 11%     +34.4%       1758 =C2=B1  8%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
      1303 =C2=B1  9%     +34.8%       1757 =C2=B1  8%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
      1306 =C2=B1  8%     +34.2%       1753 =C2=B1  8%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
      1305 =C2=B1  9%     +34.4%       1754 =C2=B1  8%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
     -1328 =C2=B1-2785%   +5030.9%     -68179 =C2=B1-40%  sched_debug.cfs_r=
q[13]:/.spread0
      1379 =C2=B1 17%     +27.2%       1754 =C2=B1  8%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
      1378 =C2=B1 17%     +27.2%       1753 =C2=B1  8%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
      1377 =C2=B1 17%     +27.3%       1753 =C2=B1  8%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
      1377 =C2=B1 17%     +27.3%       1753 =C2=B1  8%  sched_debug.cfs_rq[=
16]:/.tg_load_avg
      1377 =C2=B1 17%     +27.3%       1754 =C2=B1  8%  sched_debug.cfs_rq[=
17]:/.tg_load_avg
      1377 =C2=B1 17%     +27.1%       1751 =C2=B1  8%  sched_debug.cfs_rq[=
18]:/.tg_load_avg
      1374 =C2=B1 16%     +27.5%       1752 =C2=B1  8%  sched_debug.cfs_rq[=
19]:/.tg_load_avg
    767.25 =C2=B1  4%     -10.1%     689.50 =C2=B1  4%  sched_debug.cfs_rq[=
19]:/.util_avg
      1304 =C2=B1 10%     +34.8%       1758 =C2=B1  8%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
    763.00 =C2=B1  2%     -16.2%     639.75 =C2=B1  8%  sched_debug.cfs_rq[=
1]:/.util_avg
      1377 =C2=B1 16%     +27.3%       1753 =C2=B1  8%  sched_debug.cfs_rq[=
20]:/.tg_load_avg
     14.75 =C2=B1  2%     -22.0%      11.50 =C2=B1  4%  sched_debug.cfs_rq[=
21]:/.runnable_load_avg
     55270 =C2=B1101%    -175.9%     -41953 =C2=B1-122%  sched_debug.cfs_rq=
[21]:/.spread0
      1377 =C2=B1 16%     +27.3%       1753 =C2=B1  8%  sched_debug.cfs_rq[=
21]:/.tg_load_avg
     14.75 =C2=B1  2%     +22.0%      18.00 =C2=B1  7%  sched_debug.cfs_rq[=
22]:/.load
      1379 =C2=B1 16%     +27.1%       1752 =C2=B1  8%  sched_debug.cfs_rq[=
22]:/.tg_load_avg
     91.75 =C2=B1 80%     -78.5%      19.75 =C2=B1 47%  sched_debug.cfs_rq[=
23]:/.load_avg
     24530 =C2=B1117%    -293.5%     -47474 =C2=B1-37%  sched_debug.cfs_rq[=
23]:/.spread0
      1434 =C2=B1 14%     +22.1%       1751 =C2=B1  8%  sched_debug.cfs_rq[=
23]:/.tg_load_avg
     91.25 =C2=B1 79%     -78.4%      19.75 =C2=B1 47%  sched_debug.cfs_rq[=
23]:/.tg_load_avg_contrib
     73797 =C2=B1 52%    +146.9%     182221 =C2=B1 13%  sched_debug.cfs_rq[=
24]:/.spread0
      1435 =C2=B1 14%     +22.2%       1753 =C2=B1  8%  sched_debug.cfs_rq[=
24]:/.tg_load_avg
      1433 =C2=B1 14%     +22.4%       1755 =C2=B1  8%  sched_debug.cfs_rq[=
25]:/.tg_load_avg
      1433 =C2=B1 14%     +22.3%       1753 =C2=B1  8%  sched_debug.cfs_rq[=
26]:/.tg_load_avg
      1428 =C2=B1 14%     +22.6%       1752 =C2=B1  8%  sched_debug.cfs_rq[=
27]:/.tg_load_avg
     14.50 =C2=B1  3%     -13.8%      12.50 =C2=B1  6%  sched_debug.cfs_rq[=
28]:/.runnable_load_avg
      1429 =C2=B1 14%     +22.4%       1750 =C2=B1  8%  sched_debug.cfs_rq[=
28]:/.tg_load_avg
     21.50 =C2=B1 52%     -43.0%      12.25 =C2=B1 12%  sched_debug.cfs_rq[=
29]:/.load_avg
      1430 =C2=B1 14%     +22.4%       1750 =C2=B1  8%  sched_debug.cfs_rq[=
29]:/.tg_load_avg
     21.50 =C2=B1 52%     -43.0%      12.25 =C2=B1 12%  sched_debug.cfs_rq[=
29]:/.tg_load_avg_contrib
      1302 =C2=B1 10%     +35.0%       1757 =C2=B1  8%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
      1429 =C2=B1 14%     +22.4%       1748 =C2=B1  8%  sched_debug.cfs_rq[=
30]:/.tg_load_avg
      1427 =C2=B1 14%     +22.5%       1749 =C2=B1  8%  sched_debug.cfs_rq[=
31]:/.tg_load_avg
      1425 =C2=B1 13%     +22.8%       1750 =C2=B1  8%  sched_debug.cfs_rq[=
32]:/.tg_load_avg
      1428 =C2=B1 13%     +22.6%       1751 =C2=B1  8%  sched_debug.cfs_rq[=
33]:/.tg_load_avg
     14.00 =C2=B1  0%     -16.1%      11.75 =C2=B1  7%  sched_debug.cfs_rq[=
34]:/.runnable_load_avg
      1430 =C2=B1 13%     +22.4%       1750 =C2=B1  8%  sched_debug.cfs_rq[=
34]:/.tg_load_avg
      1429 =C2=B1 13%     +22.7%       1753 =C2=B1  8%  sched_debug.cfs_rq[=
35]:/.tg_load_avg
    765.25 =C2=B1  2%     -15.5%     646.75 =C2=B1  8%  sched_debug.cfs_rq[=
35]:/.util_avg
      1427 =C2=B1 13%     +22.5%       1748 =C2=B1  8%  sched_debug.cfs_rq[=
36]:/.tg_load_avg
     12.75 =C2=B1 11%     -19.6%      10.25 =C2=B1  4%  sched_debug.cfs_rq[=
37]:/.runnable_load_avg
      1426 =C2=B1 13%     +22.2%       1743 =C2=B1  8%  sched_debug.cfs_rq[=
37]:/.tg_load_avg
    772.25 =C2=B1  4%     -17.3%     639.00 =C2=B1  9%  sched_debug.cfs_rq[=
37]:/.util_avg
      1430 =C2=B1 13%     +23.7%       1769 =C2=B1  9%  sched_debug.cfs_rq[=
38]:/.tg_load_avg
      1429 =C2=B1 13%     +22.2%       1746 =C2=B1  8%  sched_debug.cfs_rq[=
39]:/.tg_load_avg
      1291 =C2=B1  9%     +36.0%       1756 =C2=B1  8%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
      1427 =C2=B1 13%     +22.3%       1746 =C2=B1  8%  sched_debug.cfs_rq[=
40]:/.tg_load_avg
      1428 =C2=B1 13%     +22.3%       1746 =C2=B1  8%  sched_debug.cfs_rq[=
41]:/.tg_load_avg
      1427 =C2=B1 13%     +22.4%       1746 =C2=B1  8%  sched_debug.cfs_rq[=
42]:/.tg_load_avg
      1426 =C2=B1 13%     +22.3%       1744 =C2=B1  8%  sched_debug.cfs_rq[=
43]:/.tg_load_avg
     16.25 =C2=B1  5%     -12.3%      14.25 =C2=B1  7%  sched_debug.cfs_rq[=
44]:/.load
      1426 =C2=B1 13%     +22.3%       1744 =C2=B1  8%  sched_debug.cfs_rq[=
44]:/.tg_load_avg
      1425 =C2=B1 13%     +22.5%       1745 =C2=B1  8%  sched_debug.cfs_rq[=
45]:/.tg_load_avg
      1423 =C2=B1 13%     +22.6%       1745 =C2=B1  8%  sched_debug.cfs_rq[=
46]:/.tg_load_avg
      1421 =C2=B1 13%     +22.8%       1746 =C2=B1  8%  sched_debug.cfs_rq[=
47]:/.tg_load_avg
      1292 =C2=B1  9%     +35.7%       1753 =C2=B1  8%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
      1294 =C2=B1  9%     +35.5%       1754 =C2=B1  8%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
     72.50 =C2=B1 77%     -80.3%      14.25 =C2=B1  7%  sched_debug.cfs_rq[=
6]:/.load_avg
      1301 =C2=B1  9%     +34.9%       1756 =C2=B1  8%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
     72.50 =C2=B1 77%     -80.3%      14.25 =C2=B1  7%  sched_debug.cfs_rq[=
6]:/.tg_load_avg_contrib
      1302 =C2=B1  9%     +34.8%       1756 =C2=B1  8%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
      1302 =C2=B1  9%     +34.9%       1757 =C2=B1  8%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
     43766 =C2=B1155%    -245.7%     -63758 =C2=B1-72%  sched_debug.cfs_rq[=
9]:/.spread0
      1301 =C2=B1  9%     +35.1%       1758 =C2=B1  8%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
      1658 =C2=B1 36%     -43.5%     936.25 =C2=B1 20%  sched_debug.cpu#0.c=
urr->pid
    896002 =C2=B1  1%     +15.8%    1037478 =C2=B1  0%  sched_debug.cpu#0.n=
r_switches
    440864 =C2=B1  1%     +15.1%     507620 =C2=B1  0%  sched_debug.cpu#0.s=
ched_goidle
    459656 =C2=B1  1%     +16.6%     535919 =C2=B1  0%  sched_debug.cpu#0.t=
twu_count
      8703 =C2=B1  5%     +47.1%      12805 =C2=B1  3%  sched_debug.cpu#0.t=
twu_local
    897720 =C2=B1  0%     +15.5%    1036771 =C2=B1  0%  sched_debug.cpu#1.n=
r_switches
    -25.50 =C2=B1-96%    -374.5%      70.00 =C2=B1 51%  sched_debug.cpu#1.n=
r_uninterruptible
    900003 =C2=B1  0%     +15.2%    1037064 =C2=B1  0%  sched_debug.cpu#1.s=
ched_count
    443437 =C2=B1  1%     +14.9%     509388 =C2=B1  0%  sched_debug.cpu#1.s=
ched_goidle
    452854 =C2=B1  1%     +15.6%     523693 =C2=B1  1%  sched_debug.cpu#1.t=
twu_count
      6367 =C2=B1  8%     +56.0%       9935 =C2=B1  5%  sched_debug.cpu#1.t=
twu_local
    897707 =C2=B1  1%     +16.5%    1046207 =C2=B1  0%  sched_debug.cpu#10.=
nr_switches
     99.00 =C2=B1 11%    +103.3%     201.25 =C2=B1 11%  sched_debug.cpu#10.=
nr_uninterruptible
    898395 =C2=B1  1%     +16.5%    1046524 =C2=B1  0%  sched_debug.cpu#10.=
sched_count
    443538 =C2=B1  1%     +15.9%     514008 =C2=B1  1%  sched_debug.cpu#10.=
sched_goidle
    450312 =C2=B1  2%     +16.1%     522673 =C2=B1  0%  sched_debug.cpu#10.=
ttwu_count
      5717 =C2=B1  4%     +61.9%       9254 =C2=B1  2%  sched_debug.cpu#10.=
ttwu_local
    901460 =C2=B1  1%     +16.8%    1052822 =C2=B1  2%  sched_debug.cpu#11.=
nr_switches
    121.00 =C2=B1  9%     +54.1%     186.50 =C2=B1 11%  sched_debug.cpu#11.=
nr_uninterruptible
    902132 =C2=B1  1%     +16.7%    1053133 =C2=B1  2%  sched_debug.cpu#11.=
sched_count
    445339 =C2=B1  1%     +16.1%     517214 =C2=B1  2%  sched_debug.cpu#11.=
sched_goidle
    449212 =C2=B1  2%     +15.9%     520483 =C2=B1  1%  sched_debug.cpu#11.=
ttwu_count
      5842 =C2=B1  3%     +59.7%       9329 =C2=B1  0%  sched_debug.cpu#11.=
ttwu_local
     12.50 =C2=B1  4%     -14.0%      10.75 =C2=B1  4%  sched_debug.cpu#12.=
cpu_load[1]
     12.50 =C2=B1  4%     -12.0%      11.00 =C2=B1  6%  sched_debug.cpu#12.=
cpu_load[2]
     13.50 =C2=B1  3%     -13.0%      11.75 =C2=B1  9%  sched_debug.cpu#12.=
cpu_load[3]
      1106 =C2=B1 10%     -22.5%     857.25 =C2=B1 13%  sched_debug.cpu#12.=
curr->pid
    902682 =C2=B1  1%     +14.3%    1031501 =C2=B1  1%  sched_debug.cpu#12.=
nr_switches
    903176 =C2=B1  1%     +14.3%    1032555 =C2=B1  1%  sched_debug.cpu#12.=
sched_count
    446012 =C2=B1  2%     +13.6%     506811 =C2=B1  1%  sched_debug.cpu#12.=
sched_goidle
    453684 =C2=B1  1%     +15.9%     525671 =C2=B1  1%  sched_debug.cpu#12.=
ttwu_count
      5855 =C2=B1  5%     +57.3%       9211 =C2=B1  0%  sched_debug.cpu#12.=
ttwu_local
     15.50 =C2=B1 14%     -29.0%      11.00 =C2=B1 20%  sched_debug.cpu#13.=
cpu_load[0]
    896176 =C2=B1  1%     +15.4%    1033945 =C2=B1  1%  sched_debug.cpu#13.=
nr_switches
    115.25 =C2=B1 32%     +73.1%     199.50 =C2=B1 10%  sched_debug.cpu#13.=
nr_uninterruptible
    896699 =C2=B1  1%     +15.4%    1035234 =C2=B1  1%  sched_debug.cpu#13.=
sched_count
    441543 =C2=B1  1%     +15.0%     507978 =C2=B1  1%  sched_debug.cpu#13.=
sched_goidle
    456371 =C2=B1  0%     +14.9%     524338 =C2=B1  1%  sched_debug.cpu#13.=
ttwu_count
    252427 =C2=B1 37%     -46.0%     136245 =C2=B1 36%  sched_debug.cpu#14.=
avg_idle
    896834 =C2=B1  0%     +15.7%    1037194 =C2=B1  0%  sched_debug.cpu#14.=
nr_switches
    104.00 =C2=B1 12%     +81.5%     188.75 =C2=B1 10%  sched_debug.cpu#14.=
nr_uninterruptible
    897346 =C2=B1  0%     +15.7%    1037947 =C2=B1  0%  sched_debug.cpu#14.=
sched_count
    443095 =C2=B1  0%     +14.9%     509200 =C2=B1  0%  sched_debug.cpu#14.=
sched_goidle
    453114 =C2=B1  1%     +15.7%     524253 =C2=B1  0%  sched_debug.cpu#14.=
ttwu_count
      5611 =C2=B1  1%     +71.5%       9622 =C2=B1  5%  sched_debug.cpu#14.=
ttwu_local
    899171 =C2=B1  0%     +15.5%    1038735 =C2=B1  1%  sched_debug.cpu#15.=
nr_switches
    900076 =C2=B1  0%     +15.5%    1039339 =C2=B1  1%  sched_debug.cpu#15.=
sched_count
    444054 =C2=B1  0%     +14.9%     510318 =C2=B1  1%  sched_debug.cpu#15.=
sched_goidle
    452549 =C2=B1  1%     +15.5%     522617 =C2=B1  0%  sched_debug.cpu#15.=
ttwu_count
      5878 =C2=B1  7%     +60.0%       9404 =C2=B1  1%  sched_debug.cpu#15.=
ttwu_local
    893492 =C2=B1  1%     +15.7%    1033514 =C2=B1  1%  sched_debug.cpu#16.=
nr_switches
     47.75 =C2=B1 44%    +100.5%      95.75 =C2=B1 26%  sched_debug.cpu#16.=
nr_uninterruptible
    894207 =C2=B1  1%     +15.7%    1034476 =C2=B1  1%  sched_debug.cpu#16.=
sched_count
    441394 =C2=B1  1%     +15.0%     507698 =C2=B1  1%  sched_debug.cpu#16.=
sched_goidle
    467181 =C2=B1  1%     +14.7%     535820 =C2=B1  0%  sched_debug.cpu#16.=
ttwu_count
      5722 =C2=B1  2%     +66.8%       9547 =C2=B1  2%  sched_debug.cpu#16.=
ttwu_local
    898201 =C2=B1  0%     +14.7%    1030399 =C2=B1  0%  sched_debug.cpu#17.=
nr_switches
    898802 =C2=B1  0%     +14.8%    1031781 =C2=B1  0%  sched_debug.cpu#17.=
sched_count
    443861 =C2=B1  0%     +14.1%     506294 =C2=B1  0%  sched_debug.cpu#17.=
sched_goidle
    456449 =C2=B1  0%     +16.3%     530855 =C2=B1  1%  sched_debug.cpu#17.=
ttwu_count
      5549 =C2=B1  3%     +66.2%       9225 =C2=B1  1%  sched_debug.cpu#17.=
ttwu_local
      1278 =C2=B1  9%     -24.3%     967.50 =C2=B1  6%  sched_debug.cpu#18.=
curr->pid
    892404 =C2=B1  1%     +17.3%    1047124 =C2=B1  2%  sched_debug.cpu#18.=
nr_switches
    892794 =C2=B1  1%     +17.6%    1049492 =C2=B1  2%  sched_debug.cpu#18.=
sched_count
    440565 =C2=B1  0%     +16.8%     514499 =C2=B1  2%  sched_debug.cpu#18.=
sched_goidle
    454247 =C2=B1  0%     +16.4%     528853 =C2=B1  1%  sched_debug.cpu#18.=
ttwu_count
      5963 =C2=B1  9%     +56.7%       9342 =C2=B1  2%  sched_debug.cpu#18.=
ttwu_local
    903323 =C2=B1  0%     +15.5%    1043627 =C2=B1  0%  sched_debug.cpu#19.=
nr_switches
     63.00 =C2=B1 12%    +104.8%     129.00 =C2=B1 29%  sched_debug.cpu#19.=
nr_uninterruptible
    904081 =C2=B1  0%     +15.6%    1045032 =C2=B1  0%  sched_debug.cpu#19.=
sched_count
    446361 =C2=B1  0%     +14.8%     512414 =C2=B1  0%  sched_debug.cpu#19.=
sched_goidle
    453675 =C2=B1  1%     +17.4%     532453 =C2=B1  2%  sched_debug.cpu#19.=
ttwu_count
      5665 =C2=B1  3%     +72.9%       9798 =C2=B1  9%  sched_debug.cpu#19.=
ttwu_local
    900237 =C2=B1  0%     +15.8%    1042314 =C2=B1  1%  sched_debug.cpu#2.n=
r_switches
     88.50 =C2=B1 34%    +120.9%     195.50 =C2=B1  5%  sched_debug.cpu#2.n=
r_uninterruptible
    902129 =C2=B1  0%     +15.6%    1042627 =C2=B1  1%  sched_debug.cpu#2.s=
ched_count
    444763 =C2=B1  0%     +15.1%     511973 =C2=B1  1%  sched_debug.cpu#2.s=
ched_goidle
    450545 =C2=B1  1%     +16.3%     523766 =C2=B1  0%  sched_debug.cpu#2.t=
twu_count
      5823 =C2=B1  4%     +60.8%       9363 =C2=B1  2%  sched_debug.cpu#2.t=
twu_local
      1598 =C2=B1 31%     -41.2%     939.75 =C2=B1 21%  sched_debug.cpu#20.=
curr->pid
    891426 =C2=B1  1%     +16.2%    1035799 =C2=B1  0%  sched_debug.cpu#20.=
nr_switches
    892585 =C2=B1  1%     +16.4%    1039111 =C2=B1  0%  sched_debug.cpu#20.=
sched_count
    440399 =C2=B1  1%     +15.5%     508854 =C2=B1  0%  sched_debug.cpu#20.=
sched_goidle
    458152 =C2=B1  1%     +17.2%     536906 =C2=B1  1%  sched_debug.cpu#20.=
ttwu_count
      5681 =C2=B1  2%     +64.5%       9347 =C2=B1  2%  sched_debug.cpu#20.=
ttwu_local
    891160 =C2=B1  1%     +15.9%    1033131 =C2=B1  0%  sched_debug.cpu#21.=
nr_switches
     27.25 =C2=B1 32%    +200.0%      81.75 =C2=B1 27%  sched_debug.cpu#21.=
nr_uninterruptible
    892387 =C2=B1  0%     +16.0%    1034911 =C2=B1  0%  sched_debug.cpu#21.=
sched_count
    440313 =C2=B1  1%     +15.3%     507477 =C2=B1  0%  sched_debug.cpu#21.=
sched_goidle
    453863 =C2=B1  0%     +16.8%     530152 =C2=B1  0%  sched_debug.cpu#21.=
ttwu_count
      5700 =C2=B1  4%     +64.4%       9373 =C2=B1  1%  sched_debug.cpu#21.=
ttwu_local
    905973 =C2=B1  0%     +14.9%    1040901 =C2=B1  0%  sched_debug.cpu#22.=
nr_switches
    906362 =C2=B1  0%     +15.0%    1042491 =C2=B1  0%  sched_debug.cpu#22.=
sched_count
    447669 =C2=B1  0%     +14.2%     511351 =C2=B1  0%  sched_debug.cpu#22.=
sched_goidle
    450413 =C2=B1  1%     +17.2%     527775 =C2=B1  0%  sched_debug.cpu#22.=
ttwu_count
      5641 =C2=B1  3%     +67.0%       9422 =C2=B1  1%  sched_debug.cpu#22.=
ttwu_local
     56.00 =C2=B1121%     -77.7%      12.50 =C2=B1  8%  sched_debug.cpu#23.=
cpu_load[1]
     63.50 =C2=B1103%     -80.3%      12.50 =C2=B1  4%  sched_debug.cpu#23.=
cpu_load[2]
     73.25 =C2=B1 89%     -82.6%      12.75 =C2=B1  8%  sched_debug.cpu#23.=
cpu_load[3]
    901596 =C2=B1  1%     +15.7%    1042772 =C2=B1  1%  sched_debug.cpu#23.=
nr_switches
    902456 =C2=B1  0%     +15.7%    1044536 =C2=B1  0%  sched_debug.cpu#23.=
sched_count
    445153 =C2=B1  1%     +15.1%     512287 =C2=B1  0%  sched_debug.cpu#23.=
sched_goidle
    452143 =C2=B1  1%     +16.0%     524487 =C2=B1  0%  sched_debug.cpu#23.=
ttwu_count
      5995 =C2=B1 10%     +59.4%       9553 =C2=B1  5%  sched_debug.cpu#23.=
ttwu_local
      1237 =C2=B1  0%     -24.1%     939.50 =C2=B1 20%  sched_debug.cpu#24.=
curr->pid
    881601 =C2=B1  1%     +16.0%    1022273 =C2=B1  0%  sched_debug.cpu#24.=
nr_switches
    -61.00 =C2=B1-30%    +133.6%    -142.50 =C2=B1-14%  sched_debug.cpu#24.=
nr_uninterruptible
    881952 =C2=B1  1%     +15.9%    1022551 =C2=B1  0%  sched_debug.cpu#24.=
sched_count
    436308 =C2=B1  1%     +15.3%     503274 =C2=B1  0%  sched_debug.cpu#24.=
sched_goidle
    442368 =C2=B1  1%     +17.7%     520845 =C2=B1  0%  sched_debug.cpu#24.=
ttwu_count
      5827 =C2=B1  1%     +84.6%      10756 =C2=B1 15%  sched_debug.cpu#24.=
ttwu_local
    885038 =C2=B1  1%     +15.3%    1020255 =C2=B1  0%  sched_debug.cpu#25.=
nr_switches
    -85.50 =C2=B1-18%     +70.5%    -145.75 =C2=B1-14%  sched_debug.cpu#25.=
nr_uninterruptible
    885379 =C2=B1  1%     +15.3%    1020534 =C2=B1  0%  sched_debug.cpu#25.=
sched_count
    437939 =C2=B1  1%     +14.7%     502334 =C2=B1  0%  sched_debug.cpu#25.=
sched_goidle
    446881 =C2=B1  1%     +15.2%     514905 =C2=B1  1%  sched_debug.cpu#25.=
ttwu_count
      6514 =C2=B1 19%     +55.9%      10156 =C2=B1  5%  sched_debug.cpu#25.=
ttwu_local
     13.75 =C2=B1  6%     -18.2%      11.25 =C2=B1 13%  sched_debug.cpu#26.=
cpu_load[4]
    888320 =C2=B1  1%     +15.8%    1028804 =C2=B1  1%  sched_debug.cpu#26.=
nr_switches
    -70.50 =C2=B1-24%     +78.7%    -126.00 =C2=B1-12%  sched_debug.cpu#26.=
nr_uninterruptible
    888678 =C2=B1  1%     +15.8%    1029087 =C2=B1  1%  sched_debug.cpu#26.=
sched_count
    439681 =C2=B1  1%     +15.2%     506581 =C2=B1  1%  sched_debug.cpu#26.=
sched_goidle
    442160 =C2=B1  0%     +16.8%     516595 =C2=B1  1%  sched_debug.cpu#26.=
ttwu_count
      5876 =C2=B1  4%     +77.1%      10408 =C2=B1  8%  sched_debug.cpu#26.=
ttwu_local
     52.00 =C2=B1129%     -79.8%      10.50 =C2=B1  4%  sched_debug.cpu#27.=
cpu_load[2]
     52.25 =C2=B1129%     -77.5%      11.75 =C2=B1  3%  sched_debug.cpu#27.=
cpu_load[3]
    894121 =C2=B1  0%     +14.5%    1023970 =C2=B1  0%  sched_debug.cpu#27.=
nr_switches
    -45.00 =C2=B1-55%    +163.9%    -118.75 =C2=B1-12%  sched_debug.cpu#27.=
nr_uninterruptible
    894480 =C2=B1  0%     +14.5%    1024254 =C2=B1  0%  sched_debug.cpu#27.=
sched_count
    442570 =C2=B1  0%     +13.9%     504155 =C2=B1  0%  sched_debug.cpu#27.=
sched_goidle
    442733 =C2=B1  0%     +15.7%     512165 =C2=B1  0%  sched_debug.cpu#27.=
ttwu_count
      5931 =C2=B1  4%     +66.5%       9874 =C2=B1  1%  sched_debug.cpu#27.=
ttwu_local
     13.75 =C2=B1  3%     -16.4%      11.50 =C2=B1  7%  sched_debug.cpu#28.=
cpu_load[3]
    873756 =C2=B1  0%     +15.3%    1007017 =C2=B1  1%  sched_debug.cpu#28.=
nr_switches
    -81.00 =C2=B1-27%     +58.6%    -128.50 =C2=B1-10%  sched_debug.cpu#28.=
nr_uninterruptible
    874095 =C2=B1  0%     +15.2%    1007316 =C2=B1  1%  sched_debug.cpu#28.=
sched_count
    431990 =C2=B1  0%     +14.7%     495668 =C2=B1  1%  sched_debug.cpu#28.=
sched_goidle
    453567 =C2=B1  1%     +15.3%     522888 =C2=B1  0%  sched_debug.cpu#28.=
ttwu_count
      6261 =C2=B1 10%     +59.4%       9983 =C2=B1  2%  sched_debug.cpu#28.=
ttwu_local
     14.25 =C2=B1  3%     -14.0%      12.25 =C2=B1  3%  sched_debug.cpu#29.=
cpu_load[4]
    982.50 =C2=B1  0%     +12.8%       1108 =C2=B1 10%  sched_debug.cpu#29.=
curr->pid
     13.25 =C2=B1  8%     +17.0%      15.50 =C2=B1 10%  sched_debug.cpu#29.=
load
    877674 =C2=B1  1%     +16.0%    1017722 =C2=B1  0%  sched_debug.cpu#29.=
nr_switches
    -68.75 =C2=B1 -9%     +85.5%    -127.50 =C2=B1-20%  sched_debug.cpu#29.=
nr_uninterruptible
    878022 =C2=B1  1%     +15.9%    1018014 =C2=B1  0%  sched_debug.cpu#29.=
sched_count
    434439 =C2=B1  1%     +15.3%     501056 =C2=B1  0%  sched_debug.cpu#29.=
sched_goidle
    453413 =C2=B1  0%     +15.4%     523377 =C2=B1  1%  sched_debug.cpu#29.=
ttwu_count
      6008 =C2=B1  4%     +64.9%       9905 =C2=B1  1%  sched_debug.cpu#29.=
ttwu_local
    899212 =C2=B1  0%     +15.6%    1039854 =C2=B1  0%  sched_debug.cpu#3.n=
r_switches
    123.25 =C2=B1 10%     +92.1%     236.75 =C2=B1 12%  sched_debug.cpu#3.n=
r_uninterruptible
    900303 =C2=B1  0%     +15.5%    1040158 =C2=B1  0%  sched_debug.cpu#3.s=
ched_count
    444106 =C2=B1  0%     +15.0%     510821 =C2=B1  0%  sched_debug.cpu#3.s=
ched_goidle
    451807 =C2=B1  0%     +15.5%     521786 =C2=B1  0%  sched_debug.cpu#3.t=
twu_count
      5918 =C2=B1  4%     +55.4%       9198 =C2=B1  2%  sched_debug.cpu#3.t=
twu_local
    874898 =C2=B1  1%     +17.8%    1030320 =C2=B1  0%  sched_debug.cpu#30.=
nr_switches
    -61.00 =C2=B1-36%    +136.9%    -144.50 =C2=B1 -8%  sched_debug.cpu#30.=
nr_uninterruptible
    875239 =C2=B1  1%     +17.8%    1030617 =C2=B1  0%  sched_debug.cpu#30.=
sched_count
    432963 =C2=B1  1%     +17.2%     507318 =C2=B1  0%  sched_debug.cpu#30.=
sched_goidle
    443692 =C2=B1  1%     +17.4%     521054 =C2=B1  1%  sched_debug.cpu#30.=
ttwu_count
      5817 =C2=B1  1%     +69.4%       9857 =C2=B1  1%  sched_debug.cpu#30.=
ttwu_local
    882049 =C2=B1  1%     +16.3%    1025458 =C2=B1  0%  sched_debug.cpu#31.=
nr_switches
    -60.25 =C2=B1-35%     +88.0%    -113.25 =C2=B1-10%  sched_debug.cpu#31.=
nr_uninterruptible
    882405 =C2=B1  1%     +16.2%    1025746 =C2=B1  0%  sched_debug.cpu#31.=
sched_count
    435566 =C2=B1  0%     +15.9%     504904 =C2=B1  0%  sched_debug.cpu#31.=
sched_goidle
    444268 =C2=B1  0%     +16.4%     516991 =C2=B1  0%  sched_debug.cpu#31.=
ttwu_count
      6865 =C2=B1 24%     +44.4%       9910 =C2=B1  2%  sched_debug.cpu#31.=
ttwu_local
    885388 =C2=B1  0%     +15.8%    1025078 =C2=B1  1%  sched_debug.cpu#32.=
nr_switches
    -83.50 =C2=B1-15%     +72.2%    -143.75 =C2=B1 -5%  sched_debug.cpu#32.=
nr_uninterruptible
    886476 =C2=B1  0%     +15.7%    1025357 =C2=B1  1%  sched_debug.cpu#32.=
sched_count
    436645 =C2=B1  0%     +15.6%     504666 =C2=B1  1%  sched_debug.cpu#32.=
sched_goidle
    454348 =C2=B1  2%     +16.0%     527058 =C2=B1  1%  sched_debug.cpu#32.=
ttwu_count
    879962 =C2=B1  0%     +16.4%    1023891 =C2=B1  2%  sched_debug.cpu#33.=
nr_switches
    -69.50 =C2=B1-21%    +127.0%    -157.75 =C2=B1 -5%  sched_debug.cpu#33.=
nr_uninterruptible
    880314 =C2=B1  0%     +16.3%    1024163 =C2=B1  2%  sched_debug.cpu#33.=
sched_count
    435608 =C2=B1  0%     +15.8%     504236 =C2=B1  2%  sched_debug.cpu#33.=
sched_goidle
    443392 =C2=B1  1%     +15.7%     513128 =C2=B1  0%  sched_debug.cpu#33.=
ttwu_count
      5749 =C2=B1  1%     +69.8%       9760 =C2=B1  1%  sched_debug.cpu#33.=
ttwu_local
      9.00 =C2=B1 13%     +38.9%      12.50 =C2=B1  8%  sched_debug.cpu#34.=
cpu_load[0]
    887153 =C2=B1  2%     +15.8%    1027141 =C2=B1  1%  sched_debug.cpu#34.=
nr_switches
    887500 =C2=B1  2%     +15.8%    1027427 =C2=B1  1%  sched_debug.cpu#34.=
sched_count
    438405 =C2=B1  2%     +15.4%     505761 =C2=B1  1%  sched_debug.cpu#34.=
sched_goidle
    444134 =C2=B1  1%     +16.2%     516095 =C2=B1  1%  sched_debug.cpu#34.=
ttwu_count
      6679 =C2=B1 12%     +48.1%       9894 =C2=B1  2%  sched_debug.cpu#34.=
ttwu_local
      1175 =C2=B1  8%     -25.5%     875.25 =C2=B1 31%  sched_debug.cpu#35.=
curr->pid
    895554 =C2=B1  2%     +15.6%    1035009 =C2=B1  1%  sched_debug.cpu#35.=
nr_switches
    895914 =C2=B1  2%     +15.6%    1035279 =C2=B1  1%  sched_debug.cpu#35.=
sched_count
    443216 =C2=B1  2%     +15.0%     509826 =C2=B1  1%  sched_debug.cpu#35.=
sched_goidle
    441262 =C2=B1  2%     +17.5%     518589 =C2=B1  2%  sched_debug.cpu#35.=
ttwu_count
      6038 =C2=B1  5%     +61.2%       9734 =C2=B1  0%  sched_debug.cpu#35.=
ttwu_local
    880949 =C2=B1  1%     +14.8%    1011547 =C2=B1  1%  sched_debug.cpu#36.=
nr_switches
    -83.25 =C2=B1-30%     +99.1%    -165.75 =C2=B1-13%  sched_debug.cpu#36.=
nr_uninterruptible
    881318 =C2=B1  1%     +14.8%    1011819 =C2=B1  1%  sched_debug.cpu#36.=
sched_count
    436103 =C2=B1  1%     +14.2%     498157 =C2=B1  1%  sched_debug.cpu#36.=
sched_goidle
    450423 =C2=B1  2%     +14.6%     516147 =C2=B1  0%  sched_debug.cpu#36.=
ttwu_count
      5686 =C2=B1  3%     +70.0%       9669 =C2=B1  0%  sched_debug.cpu#36.=
ttwu_local
     15.75 =C2=B1  9%     -33.3%      10.50 =C2=B1 28%  sched_debug.cpu#37.=
load
    885149 =C2=B1  1%     +15.0%    1017559 =C2=B1  0%  sched_debug.cpu#37.=
nr_switches
    -93.25 =C2=B1-14%     +70.5%    -159.00 =C2=B1-23%  sched_debug.cpu#37.=
nr_uninterruptible
    885523 =C2=B1  1%     +14.9%    1017835 =C2=B1  0%  sched_debug.cpu#37.=
sched_count
    438108 =C2=B1  0%     +14.4%     501128 =C2=B1  0%  sched_debug.cpu#37.=
sched_goidle
    440299 =C2=B1  1%     +16.9%     514925 =C2=B1  1%  sched_debug.cpu#37.=
ttwu_count
      5783 =C2=B1  3%     +69.9%       9828 =C2=B1  1%  sched_debug.cpu#37.=
ttwu_local
     50.75 =C2=B1126%     -76.8%      11.75 =C2=B1  3%  sched_debug.cpu#38.=
cpu_load[2]
    887174 =C2=B1  1%     +14.7%    1017507 =C2=B1  0%  sched_debug.cpu#38.=
nr_switches
    -88.00 =C2=B1 -7%     +79.0%    -157.50 =C2=B1 -5%  sched_debug.cpu#38.=
nr_uninterruptible
    888421 =C2=B1  1%     +14.6%    1017802 =C2=B1  0%  sched_debug.cpu#38.=
sched_count
    439029 =C2=B1  1%     +14.1%     501038 =C2=B1  0%  sched_debug.cpu#38.=
sched_goidle
    446197 =C2=B1  1%     +15.7%     516103 =C2=B1  0%  sched_debug.cpu#38.=
ttwu_count
    889672 =C2=B1  0%     +14.5%    1019050 =C2=B1  1%  sched_debug.cpu#39.=
nr_switches
    -84.75 =C2=B1-25%     +80.8%    -153.25 =C2=B1-16%  sched_debug.cpu#39.=
nr_uninterruptible
    890040 =C2=B1  0%     +14.5%    1019333 =C2=B1  1%  sched_debug.cpu#39.=
sched_count
    440427 =C2=B1  0%     +13.9%     501827 =C2=B1  1%  sched_debug.cpu#39.=
sched_goidle
    442139 =C2=B1  0%     +16.8%     516617 =C2=B1  1%  sched_debug.cpu#39.=
ttwu_count
      5767 =C2=B1  4%     +68.1%       9695 =C2=B1  1%  sched_debug.cpu#39.=
ttwu_local
    887646 =C2=B1  0%     +15.4%    1024594 =C2=B1  0%  sched_debug.cpu#4.n=
r_switches
    888454 =C2=B1  0%     +15.4%    1024910 =C2=B1  0%  sched_debug.cpu#4.s=
ched_count
    438424 =C2=B1  0%     +14.8%     503191 =C2=B1  0%  sched_debug.cpu#4.s=
ched_goidle
    458254 =C2=B1  1%     +15.8%     530576 =C2=B1  1%  sched_debug.cpu#4.t=
twu_count
      6693 =C2=B1 17%     +41.7%       9485 =C2=B1  2%  sched_debug.cpu#4.t=
twu_local
    201392 =C2=B1  2%     -30.6%     139701 =C2=B1 27%  sched_debug.cpu#40.=
avg_idle
    891601 =C2=B1  1%     +13.8%    1014637 =C2=B1  0%  sched_debug.cpu#40.=
nr_switches
   -115.25 =C2=B1-23%     +56.2%    -180.00 =C2=B1-14%  sched_debug.cpu#40.=
nr_uninterruptible
    891981 =C2=B1  1%     +13.8%    1014944 =C2=B1  0%  sched_debug.cpu#40.=
sched_count
    441305 =C2=B1  1%     +13.2%     499498 =C2=B1  0%  sched_debug.cpu#40.=
sched_goidle
    457002 =C2=B1  1%     +16.8%     533599 =C2=B1  1%  sched_debug.cpu#40.=
ttwu_count
      5864 =C2=B1  2%     +81.2%      10627 =C2=B1 10%  sched_debug.cpu#40.=
ttwu_local
    876743 =C2=B1  1%     +15.1%    1008823 =C2=B1  0%  sched_debug.cpu#41.=
nr_switches
   -100.75 =C2=B1 -8%     +74.2%    -175.50 =C2=B1-11%  sched_debug.cpu#41.=
nr_uninterruptible
    877104 =C2=B1  1%     +15.0%    1009097 =C2=B1  0%  sched_debug.cpu#41.=
sched_count
    433849 =C2=B1  1%     +14.5%     496667 =C2=B1  0%  sched_debug.cpu#41.=
sched_goidle
    457314 =C2=B1  1%     +14.4%     523177 =C2=B1  1%  sched_debug.cpu#41.=
ttwu_count
      5880 =C2=B1  3%     +71.0%      10056 =C2=B1  4%  sched_debug.cpu#41.=
ttwu_local
     13.75 =C2=B1 11%     -30.9%       9.50 =C2=B1 37%  sched_debug.cpu#42.=
cpu_load[0]
     13.00 =C2=B1  9%     -26.9%       9.50 =C2=B1 22%  sched_debug.cpu#42.=
cpu_load[1]
      1170 =C2=B1  8%     -26.4%     862.25 =C2=B1 24%  sched_debug.cpu#42.=
curr->pid
     16.00 =C2=B1 20%     -39.1%       9.75 =C2=B1 28%  sched_debug.cpu#42.=
load
    876976 =C2=B1  0%     +16.5%    1021334 =C2=B1  2%  sched_debug.cpu#42.=
nr_switches
    -77.50 =C2=B1-20%     +73.9%    -134.75 =C2=B1-19%  sched_debug.cpu#42.=
nr_uninterruptible
    877329 =C2=B1  0%     +16.4%    1021628 =C2=B1  2%  sched_debug.cpu#42.=
sched_count
    433997 =C2=B1  0%     +15.9%     502897 =C2=B1  2%  sched_debug.cpu#42.=
sched_goidle
    444646 =C2=B1  0%     +18.3%     526119 =C2=B1  2%  sched_debug.cpu#42.=
ttwu_count
      5857 =C2=B1  1%     +70.2%       9969 =C2=B1  2%  sched_debug.cpu#42.=
ttwu_local
    883831 =C2=B1  0%     +17.9%    1041998 =C2=B1  1%  sched_debug.cpu#43.=
nr_switches
    -80.25 =C2=B1-21%     +79.4%    -144.00 =C2=B1 -3%  sched_debug.cpu#43.=
nr_uninterruptible
    884189 =C2=B1  0%     +17.9%    1042291 =C2=B1  1%  sched_debug.cpu#43.=
sched_count
    437320 =C2=B1  0%     +17.4%     513263 =C2=B1  1%  sched_debug.cpu#43.=
sched_goidle
    444475 =C2=B1  1%     +17.5%     522229 =C2=B1  1%  sched_debug.cpu#43.=
ttwu_count
      5997 =C2=B1  4%     +64.8%       9882 =C2=B1  1%  sched_debug.cpu#43.=
ttwu_local
     89542 =C2=B1 53%    +108.2%     186442 =C2=B1 16%  sched_debug.cpu#44.=
avg_idle
     33.50 =C2=B1104%     -67.9%      10.75 =C2=B1 13%  sched_debug.cpu#44.=
cpu_load[1]
     23.25 =C2=B1 74%     -53.8%      10.75 =C2=B1  7%  sched_debug.cpu#44.=
cpu_load[2]
    883691 =C2=B1  1%     +15.7%    1022296 =C2=B1  1%  sched_debug.cpu#44.=
nr_switches
    -91.50 =C2=B1-14%     +79.0%    -163.75 =C2=B1 -6%  sched_debug.cpu#44.=
nr_uninterruptible
    884048 =C2=B1  1%     +15.7%    1022595 =C2=B1  1%  sched_debug.cpu#44.=
sched_count
    437328 =C2=B1  1%     +15.1%     503385 =C2=B1  1%  sched_debug.cpu#44.=
sched_goidle
    453428 =C2=B1  1%     +16.5%     528215 =C2=B1  1%  sched_debug.cpu#44.=
ttwu_count
      6394 =C2=B1 17%     +56.3%       9996 =C2=B1  1%  sched_debug.cpu#44.=
ttwu_local
    882165 =C2=B1  1%     +15.3%    1017267 =C2=B1  0%  sched_debug.cpu#45.=
nr_switches
   -101.75 =C2=B1 -7%     +59.5%    -162.25 =C2=B1-12%  sched_debug.cpu#45.=
nr_uninterruptible
    882554 =C2=B1  1%     +15.3%    1017568 =C2=B1  0%  sched_debug.cpu#45.=
sched_count
    436614 =C2=B1  1%     +14.7%     500995 =C2=B1  0%  sched_debug.cpu#45.=
sched_goidle
    443064 =C2=B1  0%     +17.1%     518680 =C2=B1  0%  sched_debug.cpu#45.=
ttwu_count
      5720 =C2=B1  2%     +71.2%       9791 =C2=B1  1%  sched_debug.cpu#45.=
ttwu_local
     16.25 =C2=B1  7%     -26.2%      12.00 =C2=B1 24%  sched_debug.cpu#46.=
load
    884600 =C2=B1  1%     +16.2%    1027855 =C2=B1  0%  sched_debug.cpu#46.=
nr_switches
    -80.00 =C2=B1 -6%     +54.1%    -123.25 =C2=B1 -9%  sched_debug.cpu#46.=
nr_uninterruptible
    884967 =C2=B1  1%     +16.2%    1028144 =C2=B1  0%  sched_debug.cpu#46.=
sched_count
    437779 =C2=B1  1%     +15.6%     506075 =C2=B1  0%  sched_debug.cpu#46.=
sched_goidle
    446119 =C2=B1  0%     +16.5%     519824 =C2=B1  0%  sched_debug.cpu#46.=
ttwu_count
      5862 =C2=B1  5%     +82.0%      10671 =C2=B1 13%  sched_debug.cpu#46.=
ttwu_local
    172065 =C2=B1 15%     +33.8%     230180 =C2=B1 19%  sched_debug.cpu#47.=
avg_idle
    899261 =C2=B1  1%     +13.7%    1022754 =C2=B1  0%  sched_debug.cpu#47.=
nr_switches
    -60.00 =C2=B1-18%    +126.2%    -135.75 =C2=B1 -8%  sched_debug.cpu#47.=
nr_uninterruptible
    899617 =C2=B1  1%     +13.7%    1023018 =C2=B1  0%  sched_debug.cpu#47.=
sched_count
    445180 =C2=B1  1%     +13.1%     503453 =C2=B1  1%  sched_debug.cpu#47.=
sched_goidle
    441506 =C2=B1  1%     +16.0%     512043 =C2=B1  1%  sched_debug.cpu#47.=
ttwu_count
      5824 =C2=B1  2%     +71.6%       9997 =C2=B1  0%  sched_debug.cpu#47.=
ttwu_local
    897894 =C2=B1  0%     +15.4%    1036494 =C2=B1  1%  sched_debug.cpu#5.n=
r_switches
    115.50 =C2=B1 19%     +76.4%     203.75 =C2=B1 18%  sched_debug.cpu#5.n=
r_uninterruptible
    898680 =C2=B1  0%     +15.4%    1036820 =C2=B1  1%  sched_debug.cpu#5.s=
ched_count
    443249 =C2=B1  0%     +14.9%     509114 =C2=B1  1%  sched_debug.cpu#5.s=
ched_goidle
    456414 =C2=B1  1%     +15.9%     529061 =C2=B1  1%  sched_debug.cpu#5.t=
twu_count
      6116 =C2=B1  7%     +53.1%       9364 =C2=B1  2%  sched_debug.cpu#5.t=
twu_local
     49.25 =C2=B1122%     -77.7%      11.00 =C2=B1 27%  sched_debug.cpu#6.c=
pu_load[1]
     45.25 =C2=B1117%     -72.9%      12.25 =C2=B1  3%  sched_debug.cpu#6.c=
pu_load[3]
     43.00 =C2=B1102%     -68.0%      13.75 =C2=B1  3%  sched_debug.cpu#6.c=
pu_load[4]
    892798 =C2=B1  0%     +16.8%    1042681 =C2=B1  1%  sched_debug.cpu#6.n=
r_switches
    114.25 =C2=B1 29%     +51.4%     173.00 =C2=B1  9%  sched_debug.cpu#6.n=
r_uninterruptible
    893464 =C2=B1  0%     +16.7%    1043011 =C2=B1  1%  sched_debug.cpu#6.s=
ched_count
    441051 =C2=B1  0%     +16.1%     512183 =C2=B1  1%  sched_debug.cpu#6.s=
ched_goidle
    453193 =C2=B1  0%     +17.5%     532424 =C2=B1  0%  sched_debug.cpu#6.t=
twu_count
      5825 =C2=B1  2%     +60.8%       9365 =C2=B1  1%  sched_debug.cpu#6.t=
twu_local
    895548 =C2=B1  0%     +16.5%    1042892 =C2=B1  0%  sched_debug.cpu#7.n=
r_switches
    115.25 =C2=B1  8%     +71.4%     197.50 =C2=B1 10%  sched_debug.cpu#7.n=
r_uninterruptible
    896963 =C2=B1  0%     +16.3%    1043187 =C2=B1  0%  sched_debug.cpu#7.s=
ched_count
    442489 =C2=B1  0%     +15.8%     512298 =C2=B1  0%  sched_debug.cpu#7.s=
ched_goidle
    447035 =C2=B1  1%     +17.6%     525521 =C2=B1  1%  sched_debug.cpu#7.t=
twu_count
      5671 =C2=B1  2%     +65.2%       9366 =C2=B1  1%  sched_debug.cpu#7.t=
twu_local
      1104 =C2=B1  8%     -21.1%     871.25 =C2=B1 12%  sched_debug.cpu#8.c=
urr->pid
    899203 =C2=B1  1%     +15.7%    1040156 =C2=B1  0%  sched_debug.cpu#8.n=
r_switches
     81.25 =C2=B1 20%    +138.5%     193.75 =C2=B1 17%  sched_debug.cpu#8.n=
r_uninterruptible
    899904 =C2=B1  1%     +15.6%    1040478 =C2=B1  0%  sched_debug.cpu#8.s=
ched_count
    444308 =C2=B1  1%     +15.0%     510913 =C2=B1  0%  sched_debug.cpu#8.s=
ched_goidle
    456891 =C2=B1  0%     +16.1%     530356 =C2=B1  1%  sched_debug.cpu#8.t=
twu_count
      5833 =C2=B1  3%     +64.1%       9571 =C2=B1  2%  sched_debug.cpu#8.t=
twu_local
    892211 =C2=B1  0%     +15.7%    1032362 =C2=B1  0%  sched_debug.cpu#9.n=
r_switches
    107.50 =C2=B1 30%     +44.7%     155.50 =C2=B1  9%  sched_debug.cpu#9.n=
r_uninterruptible
    893246 =C2=B1  0%     +15.6%    1032690 =C2=B1  0%  sched_debug.cpu#9.s=
ched_count
    440900 =C2=B1  0%     +15.0%     507011 =C2=B1  0%  sched_debug.cpu#9.s=
ched_goidle
    450459 =C2=B1  1%     +17.0%     527166 =C2=B1  1%  sched_debug.cpu#9.t=
twu_count
      5840 =C2=B1  3%     +58.7%       9270 =C2=B1  1%  sched_debug.cpu#9.t=
twu_local

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/runtime/test:
  ivb43/vm-scalability/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/per=
formance/300s/mmap-xread-seq-mt

commit: =

  5b74283ab251b9db55cbbe31d19ca72482103290
  72b252aed506b8f1a03f7abd29caef4cdf6a043b

5b74283ab251b9db 72b252aed506b8f1a03f7abd29 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      0.02 =C2=B1 35%   +2065.6%       0.36 =C2=B1 56%  vm-scalability.stdd=
ev
  51810077 =C2=B1  0%     +39.6%   72335450 =C2=B1  1%  vm-scalability.thro=
ughput
    216591 =C2=B1  1%     -19.4%     174563 =C2=B1  5%  vm-scalability.time=
.involuntary_context_switches
     44829 =C2=B1  9%   +1032.4%     507664 =C2=B1 36%  vm-scalability.time=
.major_page_faults
  16780385 =C2=B1  3%    +226.1%   54719850 =C2=B1  5%  vm-scalability.time=
.minor_page_faults
      6330 =C2=B1  1%     -80.7%       1222 =C2=B1  6%  vm-scalability.time=
.system_time
      7148 =C2=B1  0%     +73.0%      12369 =C2=B1  0%  vm-scalability.time=
.user_time
   1315986 =C2=B1 11%    +636.3%    9689609 =C2=B1  7%  vm-scalability.time=
.voluntary_context_switches
    859865 =C2=B1  2%     +83.1%    1574143 =C2=B1  2%  softirqs.RCU
    332209 =C2=B1  4%    +186.2%     950725 =C2=B1  6%  softirqs.SCHED
    569667 =C2=B1  0%     +40.1%     798305 =C2=B1  2%  slabinfo.radix_tree=
_node.active_objs
     10185 =C2=B1  0%     +40.5%      14309 =C2=B1  2%  slabinfo.radix_tree=
_node.active_slabs
    569841 =C2=B1  0%     +40.2%     799094 =C2=B1  2%  slabinfo.radix_tree=
_node.num_objs
     10185 =C2=B1  0%     +40.5%      14309 =C2=B1  2%  slabinfo.radix_tree=
_node.num_slabs
    604.00 =C2=B1  3%     -19.2%     487.75 =C2=B1  5%  vmstat.memory.buff
      0.00 =C2=B1  0%      +Inf%       1.00 =C2=B1  0%  vmstat.procs.b
     11821 =C2=B1  9%    +444.4%      64357 =C2=B1  7%  vmstat.system.cs
   6374523 =C2=B1  0%     -93.0%     443715 =C2=B1  1%  vmstat.system.in
     94.59 =C2=B1  0%      -1.5%      93.15 =C2=B1  0%  turbostat.%Busy
      2830 =C2=B1  0%      -1.5%       2788 =C2=B1  0%  turbostat.Avg_MHz
      2.77 =C2=B1  9%     +38.3%       3.83 =C2=B1  8%  turbostat.CPU%c1
      2.64 =C2=B1  4%     +14.1%       3.02 =C2=B1  3%  turbostat.CPU%c6
     16.91 =C2=B1  0%     +19.9%      20.26 =C2=B1  3%  turbostat.RAMWatt
  91194824 =C2=B1 10%    +164.1%  2.408e+08 =C2=B1  3%  cpuidle.C1-IVT.time
   1384157 =C2=B1 18%    +651.7%   10404112 =C2=B1  6%  cpuidle.C1-IVT.usage
     27499 =C2=B1 53%    +160.8%      71705 =C2=B1 28%  cpuidle.C1E-IVT.usa=
ge
    119744 =C2=B1  8%     -31.9%      81495 =C2=B1 11%  cpuidle.C6-IVT.usage
    732367 =C2=B1138%     -99.1%       6291 =C2=B1 29%  cpuidle.POLL.time
     69.50 =C2=B1 15%    +392.1%     342.00 =C2=B1  9%  cpuidle.POLL.usage
    216591 =C2=B1  1%     -19.4%     174563 =C2=B1  5%  time.involuntary_co=
ntext_switches
     44829 =C2=B1  9%   +1032.4%     507664 =C2=B1 36%  time.major_page_fau=
lts
  16780385 =C2=B1  3%    +226.1%   54719850 =C2=B1  5%  time.minor_page_fau=
lts
      6330 =C2=B1  1%     -80.7%       1222 =C2=B1  6%  time.system_time
      7148 =C2=B1  0%     +73.0%      12369 =C2=B1  0%  time.user_time
   1315986 =C2=B1 11%    +636.3%    9689609 =C2=B1  7%  time.voluntary_cont=
ext_switches
     17132 =C2=B1 74%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.d=
own.console_lock.do_con_write.con_write.n_tty_write.tty_write.redirected_tt=
y_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
    350960 =C2=B1 34%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.p=
ipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
   1311605 =C2=B1 11%    +635.4%    9645518 =C2=B1  7%  latency_stats.hits.=
wait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.xfs_filemap_fa=
ult.__do_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
     17132 =C2=B1 74%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.d=
own.console_lock.do_con_write.con_write.n_tty_write.tty_write.redirected_tt=
y_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
    403141 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.p=
ipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
    424643 =C2=B1 45%     -98.8%       4994 =C2=B1  0%  latency_stats.max.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
     17132 =C2=B1 74%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.d=
own.console_lock.do_con_write.con_write.n_tty_write.tty_write.redirected_tt=
y_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
    422038 =C2=B1 17%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.p=
ipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
    984.50 =C2=B1 46%    +864.2%       9493 =C2=B1 13%  latency_stats.sum.w=
ait_on_page_bit.__migration_entry_wait.migration_entry_wait.handle_mm_fault=
.__do_page_fault.do_page_fault.page_fault
    343712 =C2=B1  0%   +3891.1%   13717794 =C2=B1  6%  meminfo.Active
    246083 =C2=B1  0%     -50.5%     121767 =C2=B1  1%  meminfo.Active(anon)
     97628 =C2=B1  1%  +13826.3%   13596027 =C2=B1  6%  meminfo.Active(file)
    708505 =C2=B1  1%     -17.7%     582855 =C2=B1  0%  meminfo.Committed_AS
  58438358 =C2=B1  0%     -23.5%   44689642 =C2=B1  2%  meminfo.Inactive
  58394639 =C2=B1  0%     -23.5%   44648143 =C2=B1  2%  meminfo.Inactive(fi=
le)
    273439 =C2=B1  0%     +42.5%     389613 =C2=B1  3%  meminfo.PageTables
    363333 =C2=B1  0%     +36.3%     495127 =C2=B1  2%  meminfo.SReclaimable
    266234 =C2=B1  1%     -47.2%     140690 =C2=B1  1%  meminfo.Shmem
    453917 =C2=B1  0%     +29.2%     586387 =C2=B1  2%  meminfo.Slab
  23330228 =C2=B1  9%     -74.8%    5875582 =C2=B1 42%  numa-numastat.node0=
.local_node
  12290254 =C2=B1 21%     -95.2%     590932 =C2=B1 60%  numa-numastat.node0=
.numa_foreign
  23330480 =C2=B1  9%     -74.8%    5875562 =C2=B1 42%  numa-numastat.node0=
.numa_hit
   9753001 =C2=B1 22%    +270.9%   36177183 =C2=B1  7%  numa-numastat.node0=
.numa_miss
   9753252 =C2=B1 22%    +270.9%   36177163 =C2=B1  7%  numa-numastat.node0=
.other_node
  20501267 =C2=B1 14%    +212.0%   63967196 =C2=B1  4%  numa-numastat.node1=
.local_node
   9753001 =C2=B1 22%    +270.9%   36177183 =C2=B1  7%  numa-numastat.node1=
.numa_foreign
  20501309 =C2=B1 14%    +212.0%   63967206 =C2=B1  4%  numa-numastat.node1=
.numa_hit
  12290254 =C2=B1 21%     -95.2%     590932 =C2=B1 60%  numa-numastat.node1=
.numa_miss
  12290296 =C2=B1 21%     -95.2%     590942 =C2=B1 60%  numa-numastat.node1=
.other_node
    124544 =C2=B1 52%   +3464.6%    4439563 =C2=B1 16%  numa-meminfo.node0.=
Active
     48063 =C2=B1  3%   +9029.5%    4387938 =C2=B1 17%  numa-meminfo.node0.=
Active(file)
  28709365 =C2=B1  2%     -18.4%   23427355 =C2=B1  3%  numa-meminfo.node0.=
Inactive
  28683055 =C2=B1  2%     -18.4%   23399305 =C2=B1  3%  numa-meminfo.node0.=
Inactive(file)
   3351147 =C2=B1 23%     +26.4%    4234518 =C2=B1  3%  numa-meminfo.node0.=
MemFree
    136578 =C2=B1  1%     +12.6%     153788 =C2=B1  3%  numa-meminfo.node0.=
PageTables
    178236 =C2=B1  1%     +46.8%     261731 =C2=B1  4%  numa-meminfo.node0.=
SReclaimable
    224080 =C2=B1  1%     +37.6%     308313 =C2=B1  4%  numa-meminfo.node0.=
Slab
    219112 =C2=B1 30%   +4130.9%    9270475 =C2=B1  6%  numa-meminfo.node1.=
Active
     49561 =C2=B1  4%  +18463.2%    9200230 =C2=B1  6%  numa-meminfo.node1.=
Active(file)
  29707374 =C2=B1  2%     -28.5%   21238979 =C2=B1  3%  numa-meminfo.node1.=
Inactive
  29689862 =C2=B1  2%     -28.5%   21225606 =C2=B1  3%  numa-meminfo.node1.=
Inactive(file)
   2422652 =C2=B1 27%     -30.4%    1687202 =C2=B1  7%  numa-meminfo.node1.=
MemFree
    137095 =C2=B1  1%     +71.2%     234741 =C2=B1  2%  numa-meminfo.node1.=
PageTables
    185271 =C2=B1  2%     +25.8%     233000 =C2=B1  1%  numa-meminfo.node1.=
SReclaimable
    230011 =C2=B1  1%     +20.7%     277673 =C2=B1  1%  numa-meminfo.node1.=
Slab
    154233 =C2=B1  1%     +17.6%     181327 =C2=B1  0%  numa-meminfo.node1.=
Unevictable
     12015 =C2=B1  3%   +9027.4%    1096682 =C2=B1 17%  numa-vmstat.node0.n=
r_active_file
    502.75 =C2=B1  3%    +304.1%       2031 =C2=B1126%  numa-vmstat.node0.n=
r_alloc_batch
    832040 =C2=B1 22%     +28.3%    1067687 =C2=B1  2%  numa-vmstat.node0.n=
r_free_pages
   7176576 =C2=B1  2%     -18.6%    5841039 =C2=B1  3%  numa-vmstat.node0.n=
r_inactive_file
    341.00 =C2=B1  2%     -95.4%      15.75 =C2=B1 20%  numa-vmstat.node0.n=
r_isolated_file
     34121 =C2=B1  1%     +12.8%      38482 =C2=B1  3%  numa-vmstat.node0.n=
r_page_table_pages
     15820 =C2=B1 32%     -35.5%      10206 =C2=B1 12%  numa-vmstat.node0.n=
r_pages_scanned
     44517 =C2=B1  1%     +47.0%      65420 =C2=B1  4%  numa-vmstat.node0.n=
r_slab_reclaimable
   5960767 =C2=B1 39%     -94.7%     316990 =C2=B1 66%  numa-vmstat.node0.n=
uma_foreign
  12640038 =C2=B1 18%     -67.0%    4167191 =C2=B1 39%  numa-vmstat.node0.n=
uma_hit
  12618874 =C2=B1 18%     -67.0%    4161630 =C2=B1 39%  numa-vmstat.node0.n=
uma_local
   6063244 =C2=B1 31%    +199.0%   18130167 =C2=B1  6%  numa-vmstat.node0.n=
uma_miss
   6084407 =C2=B1 31%    +198.1%   18135728 =C2=B1  6%  numa-vmstat.node0.n=
uma_other
     12390 =C2=B1  4%  +18425.2%    2295268 =C2=B1  6%  numa-vmstat.node1.n=
r_active_file
    603790 =C2=B1 27%     -29.2%     427721 =C2=B1  8%  numa-vmstat.node1.n=
r_free_pages
   7424337 =C2=B1  2%     -28.5%    5305290 =C2=B1  3%  numa-vmstat.node1.n=
r_inactive_file
    391.00 =C2=B1  5%     -97.2%      11.00 =C2=B1 12%  numa-vmstat.node1.n=
r_isolated_file
     34243 =C2=B1  1%     +71.5%      58737 =C2=B1  2%  numa-vmstat.node1.n=
r_page_table_pages
     15106 =C2=B1 53%    +131.6%      34986 =C2=B1 17%  numa-vmstat.node1.n=
r_pages_scanned
     46262 =C2=B1  1%     +25.8%      58180 =C2=B1  0%  numa-vmstat.node1.n=
r_slab_reclaimable
     38646 =C2=B1  1%     +17.3%      45333 =C2=B1  0%  numa-vmstat.node1.n=
r_unevictable
   6063586 =C2=B1 31%    +199.0%   18130814 =C2=B1  6%  numa-vmstat.node1.n=
uma_foreign
  12659295 =C2=B1 21%    +166.9%   33791088 =C2=B1  3%  numa-vmstat.node1.n=
uma_hit
  12596302 =C2=B1 21%    +167.6%   33712655 =C2=B1  3%  numa-vmstat.node1.n=
uma_local
   5961206 =C2=B1 39%     -94.7%     316997 =C2=B1 66%  numa-vmstat.node1.n=
uma_miss
   6024199 =C2=B1 38%     -93.4%     395430 =C2=B1 53%  numa-vmstat.node1.n=
uma_other
     11950 =C2=B1  1%     -56.3%       5220 =C2=B1 44%  proc-vmstat.allocst=
all
    246.00 =C2=B1  7%   +7649.7%      19064 =C2=B1  6%  proc-vmstat.kswapd_=
low_wmark_hit_quickly
     61590 =C2=B1  1%     -50.5%      30457 =C2=B1  1%  proc-vmstat.nr_acti=
ve_anon
     24406 =C2=B1  1%  +13819.7%    3397283 =C2=B1  6%  proc-vmstat.nr_acti=
ve_file
  14609102 =C2=B1  0%     -23.7%   11149953 =C2=B1  2%  proc-vmstat.nr_inac=
tive_file
    747.50 =C2=B1  4%     -96.4%      27.00 =C2=B1 12%  proc-vmstat.nr_isol=
ated_file
     68766 =C2=B1  0%     +41.5%      97318 =C2=B1  2%  proc-vmstat.nr_page=
_table_pages
     31785 =C2=B1 22%     +84.5%      58657 =C2=B1 24%  proc-vmstat.nr_page=
s_scanned
     66588 =C2=B1  1%     -47.2%      35190 =C2=B1  1%  proc-vmstat.nr_shmem
     91166 =C2=B1  0%     +35.8%     123763 =C2=B1  2%  proc-vmstat.nr_slab=
_reclaimable
  22043255 =C2=B1  3%     +66.8%   36768116 =C2=B1  6%  proc-vmstat.numa_fo=
reign
     14363 =C2=B1  3%    +102.3%      29052 =C2=B1  0%  proc-vmstat.numa_hi=
nt_faults
     12946 =C2=B1  5%     +96.2%      25396 =C2=B1  1%  proc-vmstat.numa_hi=
nt_faults_local
  43827658 =C2=B1  2%     +59.3%   69838611 =C2=B1  6%  proc-vmstat.numa_hit
  43827364 =C2=B1  2%     +59.3%   69838621 =C2=B1  6%  proc-vmstat.numa_lo=
cal
  22043255 =C2=B1  3%     +66.8%   36768116 =C2=B1  6%  proc-vmstat.numa_mi=
ss
  22043548 =C2=B1  3%     +66.8%   36768106 =C2=B1  6%  proc-vmstat.numa_ot=
her
     14283 =C2=B1  2%    +103.5%      29064 =C2=B1  0%  proc-vmstat.numa_pt=
e_updates
    539.00 =C2=B1 11%   +3665.7%      20297 =C2=B1  5%  proc-vmstat.pageout=
run
     61303 =C2=B1  1%  +62220.2%   38204636 =C2=B1 17%  proc-vmstat.pgactiv=
ate
   2887589 =C2=B1  0%     +36.6%    3943048 =C2=B1  5%  proc-vmstat.pgalloc=
_dma32
  63135436 =C2=B1  0%     +62.9%  1.029e+08 =C2=B1  4%  proc-vmstat.pgalloc=
_normal
  19050516 =C2=B1  4%    +254.0%   67444692 =C2=B1  5%  proc-vmstat.pgfault
  64225693 =C2=B1  1%     +64.1%  1.054e+08 =C2=B1  4%  proc-vmstat.pgfree
     44829 =C2=B1  9%   +1032.4%     507664 =C2=B1 36%  proc-vmstat.pgmajfa=
ult
   2187306 =C2=B1 20%     +68.9%    3695007 =C2=B1  6%  proc-vmstat.pgscan_=
kswapd_dma32
  43313276 =C2=B1 17%    +272.5%  1.613e+08 =C2=B1  4%  proc-vmstat.pgscan_=
kswapd_normal
   1845787 =C2=B1  1%     -69.8%     558233 =C2=B1 37%  proc-vmstat.pgsteal=
_direct_dma32
  41399936 =C2=B1  1%     -89.3%    4410054 =C2=B1 34%  proc-vmstat.pgsteal=
_direct_normal
    272424 =C2=B1 10%    +653.2%    2051780 =C2=B1  5%  proc-vmstat.pgsteal=
_kswapd_dma32
   5097242 =C2=B1  4%   +1364.1%   74629699 =C2=B1  2%  proc-vmstat.pgsteal=
_kswapd_normal
     19498 =C2=B1  4%   +3034.7%     611222 =C2=B1 41%  proc-vmstat.slabs_s=
canned
     91902 =C2=B1  0%     +22.3%     112380 =C2=B1  4%  proc-vmstat.unevict=
able_pgs_culled
      0.01 =C2=B1 57%  +22133.3%       1.67 =C2=B1 42%  perf-profile.cpu-cy=
cles.__account_scheduler_latency.enqueue_entity.enqueue_task_fair.enqueue_t=
ask.activate_task
      0.20 =C2=B1 16%   +2161.7%       4.58 =C2=B1 24%  perf-profile.cpu-cy=
cles.__add_to_page_cache_locked.add_to_page_cache_lru.mpage_readpages.xfs_v=
m_readpages.__do_page_cache_readahead
     44.47 =C2=B1  8%     -94.9%       2.25 =C2=B1 73%  perf-profile.cpu-cy=
cles.__alloc_pages_nodemask.alloc_pages_current.__page_cache_alloc.__do_pag=
e_cache_readahead.filemap_fault
     35.23 =C2=B1  9%     -91.6%       2.97 =C2=B1 32%  perf-profile.cpu-cy=
cles.__alloc_pages_nodemask.alloc_pages_current.__page_cache_alloc.__do_pag=
e_cache_readahead.ondemand_readahead
      2.82 =C2=B1 46%     -95.0%       0.14 =C2=B1120%  perf-profile.cpu-cy=
cles.__alloc_pages_nodemask.alloc_pages_current.pte_alloc_one.__pte_alloc.h=
andle_mm_fault
      0.02 =C2=B1  0%   +5725.0%       1.16 =C2=B1 17%  perf-profile.cpu-cy=
cles.__delete_from_page_cache.__remove_mapping.shrink_page_list.shrink_inac=
tive_list.shrink_lruvec
     81.70 =C2=B1  1%     -51.0%      40.02 =C2=B1 11%  perf-profile.cpu-cy=
cles.__do_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
     44.49 =C2=B1  8%     -90.0%       4.44 =C2=B1 46%  perf-profile.cpu-cy=
cles.__do_page_cache_readahead.filemap_fault.xfs_filemap_fault.__do_fault.h=
andle_mm_fault
     85.03 =C2=B1  0%     -28.0%      61.24 =C2=B1  6%  perf-profile.cpu-cy=
cles.__do_page_fault.do_page_fault.page_fault
      0.49 =C2=B1  0%    +555.8%       3.23 =C2=B1 16%  perf-profile.cpu-cy=
cles.__hrtimer_run_queues.hrtimer_interrupt.local_apic_timer_interrupt.smp_=
apic_timer_interrupt.apic_timer_interrupt
      0.00 =C2=B1 -1%      +Inf%       0.77 =C2=B1 40%  perf-profile.cpu-cy=
cles.__kernel_text_address.print_context_stack.dump_trace.save_stack_trace_=
tsk.__account_scheduler_latency
      0.00 =C2=B1 -1%      +Inf%       1.80 =C2=B1 45%  perf-profile.cpu-cy=
cles.__lock_page_or_retry.filemap_fault.xfs_filemap_fault.__do_fault.handle=
_mm_fault
      0.00 =C2=B1 -1%      +Inf%       0.98 =C2=B1 22%  perf-profile.cpu-cy=
cles.__lru_cache_add.lru_cache_add.add_to_page_cache_lru.mpage_readpages.xf=
s_vm_readpages
     44.47 =C2=B1  8%     -94.9%       2.26 =C2=B1 73%  perf-profile.cpu-cy=
cles.__page_cache_alloc.__do_page_cache_readahead.filemap_fault.xfs_filemap=
_fault.__do_fault
     35.26 =C2=B1  9%     -90.9%       3.20 =C2=B1 32%  perf-profile.cpu-cy=
cles.__page_cache_alloc.__do_page_cache_readahead.ondemand_readahead.page_c=
ache_async_readahead.filemap_fault
     41.02 =C2=B1  1%     -98.0%       0.80 =C2=B1 32%  perf-profile.cpu-cy=
cles.__page_check_address.page_referenced_one.rmap_walk.page_referenced.shr=
ink_page_list
     31.96 =C2=B1  3%     -99.3%       0.21 =C2=B1 29%  perf-profile.cpu-cy=
cles.__page_check_address.try_to_unmap_one.rmap_walk.try_to_unmap.shrink_pa=
ge_list
      2.82 =C2=B1 46%     -91.0%       0.25 =C2=B1 55%  perf-profile.cpu-cy=
cles.__pte_alloc.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      0.66 =C2=B1 19%    +654.4%       4.96 =C2=B1 39%  perf-profile.cpu-cy=
cles.__remove_mapping.shrink_page_list.shrink_inactive_list.shrink_lruvec.s=
hrink_zone
      0.00 =C2=B1 -1%      +Inf%       0.68 =C2=B1 40%  perf-profile.cpu-cy=
cles.__schedule.schedule.schedule_timeout.io_schedule_timeout.bit_wait_io
      0.00 =C2=B1 -1%      +Inf%       1.69 =C2=B1 45%  perf-profile.cpu-cy=
cles.__wait_on_bit.wait_on_page_bit_killable.__lock_page_or_retry.filemap_f=
ault.xfs_filemap_fault
      0.00 =C2=B1 -1%      +Inf%       1.45 =C2=B1 41%  perf-profile.cpu-cy=
cles.__wake_up.__wake_up_bit.unlock_page.do_mpage_readpage.mpage_readpages
      0.00 =C2=B1 -1%      +Inf%       1.21 =C2=B1 45%  perf-profile.cpu-cy=
cles.__wake_up.__wake_up_bit.unlock_page.filemap_map_pages.handle_mm_fault
      0.00 =C2=B1 -1%      +Inf%       1.35 =C2=B1 48%  perf-profile.cpu-cy=
cles.__wake_up.__wake_up_bit.unlock_page.handle_mm_fault.__do_page_fault
      0.00 =C2=B1 -1%      +Inf%       1.66 =C2=B1 34%  perf-profile.cpu-cy=
cles.__wake_up_bit.unlock_page.do_mpage_readpage.mpage_readpages.xfs_vm_rea=
dpages
      0.00 =C2=B1 -1%      +Inf%       1.46 =C2=B1 34%  perf-profile.cpu-cy=
cles.__wake_up_bit.unlock_page.filemap_map_pages.handle_mm_fault.__do_page_=
fault
      0.00 =C2=B1 -1%      +Inf%       1.38 =C2=B1 47%  perf-profile.cpu-cy=
cles.__wake_up_bit.unlock_page.handle_mm_fault.__do_page_fault.do_page_fault
      0.00 =C2=B1 -1%      +Inf%       1.34 =C2=B1 42%  perf-profile.cpu-cy=
cles.__wake_up_common.__wake_up.__wake_up_bit.unlock_page.do_mpage_readpage
      0.00 =C2=B1 -1%      +Inf%       1.02 =C2=B1 49%  perf-profile.cpu-cy=
cles.__wake_up_common.__wake_up.__wake_up_bit.unlock_page.handle_mm_fault
      0.02 =C2=B1 35%   +6537.5%       1.33 =C2=B1 17%  perf-profile.cpu-cy=
cles.__xfs_get_blocks.xfs_get_blocks.do_mpage_readpage.mpage_readpages.xfs_=
vm_readpages
     40.95 =C2=B1  1%     -99.3%       0.27 =C2=B1 93%  perf-profile.cpu-cy=
cles._raw_spin_lock.__page_check_address.page_referenced_one.rmap_walk.page=
_referenced
     31.93 =C2=B1  3%     -99.8%       0.06 =C2=B1 36%  perf-profile.cpu-cy=
cles._raw_spin_lock.__page_check_address.try_to_unmap_one.rmap_walk.try_to_=
unmap
      0.00 =C2=B1 -1%      +Inf%      12.83 =C2=B1 51%  perf-profile.cpu-cy=
cles._raw_spin_lock.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      0.02 =C2=B1 65%  +10777.8%       2.45 =C2=B1 33%  perf-profile.cpu-cy=
cles._raw_spin_lock_irq.__add_to_page_cache_locked.add_to_page_cache_lru.mp=
age_readpages.xfs_vm_readpages
      0.49 =C2=B1  1%    +465.5%       2.79 =C2=B1 54%  perf-profile.cpu-cy=
cles._raw_spin_lock_irqsave.__remove_mapping.shrink_page_list.shrink_inacti=
ve_list.shrink_lruvec
      0.00 =C2=B1 -1%      +Inf%       0.97 =C2=B1 45%  perf-profile.cpu-cy=
cles._raw_spin_lock_irqsave.__wake_up.__wake_up_bit.unlock_page.filemap_map=
_pages
      0.01 =C2=B1  0%  +19950.0%       2.00 =C2=B1 41%  perf-profile.cpu-cy=
cles.activate_task.ttwu_do_activate.try_to_wake_up.default_wake_function.au=
toremove_wake_function
      0.00 =C2=B1 -1%      +Inf%       1.53 =C2=B1 44%  perf-profile.cpu-cy=
cles.add_to_page_cache_lru.mpage_readpages.xfs_vm_readpages.__do_page_cache=
_readahead.filemap_fault
      0.36 =C2=B1 14%   +1172.7%       4.55 =C2=B1 19%  perf-profile.cpu-cy=
cles.add_to_page_cache_lru.mpage_readpages.xfs_vm_readpages.__do_page_cache=
_readahead.ondemand_readahead
     44.48 =C2=B1  8%     -94.9%       2.26 =C2=B1 73%  perf-profile.cpu-cy=
cles.alloc_pages_current.__page_cache_alloc.__do_page_cache_readahead.filem=
ap_fault.xfs_filemap_fault
     35.25 =C2=B1  9%     -91.1%       3.14 =C2=B1 32%  perf-profile.cpu-cy=
cles.alloc_pages_current.__page_cache_alloc.__do_page_cache_readahead.ondem=
and_readahead.page_cache_async_readahead
      2.82 =C2=B1 46%     -95.1%       0.14 =C2=B1123%  perf-profile.cpu-cy=
cles.alloc_pages_current.pte_alloc_one.__pte_alloc.handle_mm_fault.__do_pag=
e_fault
      0.02 =C2=B1-5000%  +23587.5%       4.74 =C2=B1 17%  perf-profile.cpu-=
cycles.apic_timer_interrupt
      0.00 =C2=B1 -1%      +Inf%       2.54 =C2=B1 43%  perf-profile.cpu-cy=
cles.autoremove_wake_function.wake_bit_function.__wake_up_common.__wake_up.=
__wake_up_bit
      0.00 =C2=B1 -1%      +Inf%       0.84 =C2=B1 39%  perf-profile.cpu-cy=
cles.bit_wait_io.__wait_on_bit.wait_on_page_bit_killable.__lock_page_or_ret=
ry.filemap_fault
      0.01 =C2=B1 66%   +8580.0%       1.08 =C2=B1 36%  perf-profile.cpu-cy=
cles.call_cpuidle.cpu_startup_entry.start_secondary
      0.00 =C2=B1 -1%      +Inf%       8.07 =C2=B1 18%  perf-profile.cpu-cy=
cles.call_function_interrupt
      4.01 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.call_function_interrupt._raw_spin_lock.__page_check_address.page_refer=
enced_one.rmap_walk
      3.12 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.call_function_interrupt._raw_spin_lock.__page_check_address.try_to_unm=
ap_one.rmap_walk
      0.02 =C2=B1 44%  +11320.0%       2.85 =C2=B1 37%  perf-profile.cpu-cy=
cles.cpu_startup_entry.start_secondary
      0.01 =C2=B1 66%   +8500.0%       1.08 =C2=B1 36%  perf-profile.cpu-cy=
cles.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_secondary
      0.00 =C2=B1141%  +27200.0%       0.91 =C2=B1 41%  perf-profile.cpu-cy=
cles.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry.start=
_secondary
      0.00 =C2=B1 -1%      +Inf%       1.17 =C2=B1 37%  perf-profile.cpu-cy=
cles.default_send_IPI_mask_allbutself_phys.physflat_send_IPI_allbutself.nat=
ive_send_call_func_ipi.smp_call_function_many.try_to_unmap_flush
      6.54 =C2=B1  6%     -99.8%       0.01 =C2=B1-10000%  perf-profile.cpu=
-cycles.default_send_IPI_mask_sequence_phys.physflat_send_IPI_mask.native_s=
end_call_func_ipi.smp_call_function_many.native_flush_tlb_others
      0.00 =C2=B1 -1%      +Inf%       0.87 =C2=B1 14%  perf-profile.cpu-cy=
cles.default_send_IPI_mask_sequence_phys.physflat_send_IPI_mask.native_send=
_call_func_ipi.smp_call_function_many.try_to_unmap_flush
      0.00 =C2=B1 -1%      +Inf%       2.51 =C2=B1 43%  perf-profile.cpu-cy=
cles.default_wake_function.autoremove_wake_function.wake_bit_function.__wak=
e_up_common.__wake_up
      1.27 =C2=B1  5%   +1764.7%      23.63 =C2=B1 13%  perf-profile.cpu-cy=
cles.do_mpage_readpage.mpage_readpages.xfs_vm_readpages.__do_page_cache_rea=
dahead.ondemand_readahead
     85.04 =C2=B1  0%     -27.9%      61.29 =C2=B1  6%  perf-profile.cpu-cy=
cles.do_page_fault.page_fault
     79.44 =C2=B1  1%     -96.1%       3.06 =C2=B1 50%  perf-profile.cpu-cy=
cles.do_try_to_free_pages.try_to_free_pages.__alloc_pages_nodemask.alloc_pa=
ges_current.__page_cache_alloc
      2.82 =C2=B1 46%     -95.9%       0.12 =C2=B1141%  perf-profile.cpu-cy=
cles.do_try_to_free_pages.try_to_free_pages.__alloc_pages_nodemask.alloc_pa=
ges_current.pte_alloc_one
      0.01 =C2=B1 35%   +8862.5%       1.20 =C2=B1 37%  perf-profile.cpu-cy=
cles.down_read.rmap_walk.page_referenced.shrink_page_list.shrink_inactive_l=
ist
      0.01 =C2=B1 57%  +20200.0%       1.52 =C2=B1 42%  perf-profile.cpu-cy=
cles.dump_trace.save_stack_trace_tsk.__account_scheduler_latency.enqueue_en=
tity.enqueue_task_fair
      0.01 =C2=B1  0%  +19350.0%       1.94 =C2=B1 40%  perf-profile.cpu-cy=
cles.enqueue_entity.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_ac=
tivate
      0.01 =C2=B1 57%  +26600.0%       2.00 =C2=B1 42%  perf-profile.cpu-cy=
cles.enqueue_task.activate_task.ttwu_do_activate.try_to_wake_up.default_wak=
e_function
      0.01 =C2=B1 57%  +26133.3%       1.97 =C2=B1 40%  perf-profile.cpu-cy=
cles.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activate.try_to_w=
ake_up
     81.70 =C2=B1  1%     -51.3%      39.80 =C2=B1 11%  perf-profile.cpu-cy=
cles.filemap_fault.xfs_filemap_fault.__do_fault.handle_mm_fault.__do_page_f=
ault
      0.07 =C2=B1 31%   +6575.0%       4.67 =C2=B1 11%  perf-profile.cpu-cy=
cles.filemap_map_pages.handle_mm_fault.__do_page_fault.do_page_fault.page_f=
ault
      0.00 =C2=B1 -1%      +Inf%       2.64 =C2=B1 22%  perf-profile.cpu-cy=
cles.flush_smp_call_function_queue.generic_smp_call_function_single_interru=
pt.smp_call_function_interrupt.call_function_interrupt
      3.38 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.flush_smp_call_function_queue.generic_smp_call_function_single_interru=
pt.smp_call_function_interrupt.call_function_interrupt._raw_spin_lock
      3.16 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.flush_tlb_func.flush_smp_call_function_queue.generic_smp_call_function=
_single_interrupt.smp_call_function_interrupt.call_function_interrupt
     14.09 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.flush_tlb_page.ptep_clear_flush.try_to_unmap_one.rmap_walk.try_to_unmap
      0.01 =C2=B1 35%   +8093.7%       1.09 =C2=B1 25%  perf-profile.cpu-cy=
cles.free_hot_cold_page.free_hot_cold_page_list.shrink_page_list.shrink_ina=
ctive_list.shrink_lruvec
      0.02 =C2=B1 33%   +7666.7%       1.17 =C2=B1 25%  perf-profile.cpu-cy=
cles.free_hot_cold_page_list.shrink_page_list.shrink_inactive_list.shrink_l=
ruvec.shrink_zone
      0.00 =C2=B1 -1%      +Inf%       0.74 =C2=B1 31%  perf-profile.cpu-cy=
cles.free_pcppages_bulk.free_hot_cold_page.free_hot_cold_page_list.shrink_p=
age_list.shrink_inactive_list
      0.00 =C2=B1 -1%      +Inf%       2.69 =C2=B1 22%  perf-profile.cpu-cy=
cles.generic_smp_call_function_single_interrupt.smp_call_function_interrupt=
.call_function_interrupt
      3.90 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.generic_smp_call_function_single_interrupt.smp_call_function_interrupt=
.call_function_interrupt._raw_spin_lock.__page_check_address
      0.15 =C2=B1  2%   +1391.8%       2.27 =C2=B1 28%  perf-profile.cpu-cy=
cles.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_current.__pa=
ge_cache_alloc.__do_page_cache_readahead
     85.00 =C2=B1  0%     -29.4%      59.97 =C2=B1  6%  perf-profile.cpu-cy=
cles.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      0.01 =C2=B1100%  +70250.0%       3.52 =C2=B1 18%  perf-profile.cpu-cy=
cles.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_timer_interrupt.=
apic_timer_interrupt
      0.01 =C2=B1 70%  +12612.5%       0.85 =C2=B1 41%  perf-profile.cpu-cy=
cles.intel_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_=
entry
      0.00 =C2=B1 -1%      +Inf%       0.83 =C2=B1 39%  perf-profile.cpu-cy=
cles.io_schedule_timeout.bit_wait_io.__wait_on_bit.wait_on_page_bit_killabl=
e.__lock_page_or_retry
      0.00 =C2=B1 -1%      +Inf%       1.20 =C2=B1 31%  perf-profile.cpu-cy=
cles.isolate_lru_pages.isra.44.shrink_inactive_list.shrink_lruvec.shrink_zo=
ne.kswapd
      6.25 =C2=B1  1%    +222.2%      20.14 =C2=B1 15%  perf-profile.cpu-cy=
cles.kswapd.kthread.ret_from_fork
      6.28 =C2=B1  1%    +223.1%      20.29 =C2=B1 15%  perf-profile.cpu-cy=
cles.kthread.ret_from_fork
      3.41 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.llist_add_batch.smp_call_function_many.native_flush_tlb_others.flush_t=
lb_page.ptep_clear_flush
      0.00 =C2=B1 -1%      +Inf%       1.35 =C2=B1 24%  perf-profile.cpu-cy=
cles.llist_add_batch.smp_call_function_many.try_to_unmap_flush.shrink_page_=
list.shrink_inactive_list
      2.13 =C2=B1  4%     -56.9%       0.92 =C2=B1 20%  perf-profile.cpu-cy=
cles.llist_reverse_order.flush_smp_call_function_queue.generic_smp_call_fun=
ction_single_interrupt.smp_call_function_interrupt.call_function_interrupt
      0.01 =C2=B1  0%  +35500.0%       3.56 =C2=B1 19%  perf-profile.cpu-cy=
cles.local_apic_timer_interrupt.smp_apic_timer_interrupt.apic_timer_interru=
pt
      0.01 =C2=B1  0%   +9625.0%       0.97 =C2=B1 21%  perf-profile.cpu-cy=
cles.lru_cache_add.add_to_page_cache_lru.mpage_readpages.xfs_vm_readpages._=
_do_page_cache_readahead
      0.00 =C2=B1 -1%      +Inf%       1.61 =C2=B1 76%  perf-profile.cpu-cy=
cles.mpage_readpages.xfs_vm_readpages.__do_page_cache_readahead.filemap_fau=
lt.xfs_filemap_fault
      1.83 =C2=B1  7%   +1475.0%      28.78 =C2=B1 12%  perf-profile.cpu-cy=
cles.mpage_readpages.xfs_vm_readpages.__do_page_cache_readahead.ondemand_re=
adahead.page_cache_async_readahead
     13.97 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.native_flush_tlb_others.flush_tlb_page.ptep_clear_flush.try_to_unmap_o=
ne.rmap_walk
     36.63 =C2=B1  2%     -99.6%       0.14 =C2=B1141%  perf-profile.cpu-cy=
cles.native_queued_spin_lock_slowpath._raw_spin_lock.__page_check_address.p=
age_referenced_one.rmap_walk
     28.56 =C2=B1  3%    -100.0%       0.00 =C2=B1141%  perf-profile.cpu-cy=
cles.native_queued_spin_lock_slowpath._raw_spin_lock.__page_check_address.t=
ry_to_unmap_one.rmap_walk
      0.00 =C2=B1 -1%      +Inf%      12.46 =C2=B1 51%  perf-profile.cpu-cy=
cles.native_queued_spin_lock_slowpath._raw_spin_lock.handle_mm_fault.__do_p=
age_fault.do_page_fault
      0.00 =C2=B1 -1%      +Inf%       2.12 =C2=B1 37%  perf-profile.cpu-cy=
cles.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__add_to_page_cach=
e_locked.add_to_page_cache_lru.mpage_readpages
      0.00 =C2=B1 -1%      +Inf%       2.45 =C2=B1 56%  perf-profile.cpu-cy=
cles.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__remove_mappi=
ng.shrink_page_list.shrink_inactive_list
      0.00 =C2=B1 -1%      +Inf%       1.31 =C2=B1 44%  perf-profile.cpu-cy=
cles.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__wake_up.__wa=
ke_up_bit.unlock_page
      7.30 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.native_send_call_func_ipi.smp_call_function_many.native_flush_tlb_othe=
rs.flush_tlb_page.ptep_clear_flush
      0.00 =C2=B1 -1%      +Inf%       2.13 =C2=B1 22%  perf-profile.cpu-cy=
cles.native_send_call_func_ipi.smp_call_function_many.try_to_unmap_flush.sh=
rink_page_list.shrink_inactive_list
     85.05 =C2=B1  0%     -27.0%      62.09 =C2=B1  6%  perf-profile.cpu-cy=
cles.page_fault
     41.27 =C2=B1  1%     -90.2%       4.06 =C2=B1 31%  perf-profile.cpu-cy=
cles.page_referenced.shrink_page_list.shrink_inactive_list.shrink_lruvec.sh=
rink_zone
     41.05 =C2=B1  1%     -96.3%       1.52 =C2=B1 32%  perf-profile.cpu-cy=
cles.page_referenced_one.rmap_walk.page_referenced.shrink_page_list.shrink_=
inactive_list
      0.01 =C2=B1100%  +16450.0%       0.83 =C2=B1 20%  perf-profile.cpu-cy=
cles.pagevec_lru_move_fn.__lru_cache_add.lru_cache_add.add_to_page_cache_lr=
u.mpage_readpages
      0.00 =C2=B1 -1%      +Inf%       1.19 =C2=B1 36%  perf-profile.cpu-cy=
cles.physflat_send_IPI_allbutself.native_send_call_func_ipi.smp_call_functi=
on_many.try_to_unmap_flush.shrink_page_list
      7.20 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.physflat_send_IPI_mask.native_send_call_func_ipi.smp_call_function_man=
y.native_flush_tlb_others.flush_tlb_page
      0.00 =C2=B1 -1%      +Inf%       0.89 =C2=B1 14%  perf-profile.cpu-cy=
cles.physflat_send_IPI_mask.native_send_call_func_ipi.smp_call_function_man=
y.try_to_unmap_flush.shrink_page_list
      0.01 =C2=B1100%  +27400.0%       1.38 =C2=B1 42%  perf-profile.cpu-cy=
cles.print_context_stack.dump_trace.save_stack_trace_tsk.__account_schedule=
r_latency.enqueue_entity
      2.82 =C2=B1 46%     -91.6%       0.24 =C2=B1 59%  perf-profile.cpu-cy=
cles.pte_alloc_one.__pte_alloc.handle_mm_fault.__do_page_fault.do_page_fault
     14.16 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.ptep_clear_flush.try_to_unmap_one.rmap_walk.try_to_unmap.shrink_page_l=
ist
      6.28 =C2=B1  1%    +223.1%      20.29 =C2=B1 15%  perf-profile.cpu-cy=
cles.ret_from_fork
     41.25 =C2=B1  1%     -90.9%       3.77 =C2=B1 32%  perf-profile.cpu-cy=
cles.rmap_walk.page_referenced.shrink_page_list.shrink_inactive_list.shrink=
_lruvec
     46.73 =C2=B1  0%     -94.6%       2.54 =C2=B1 23%  perf-profile.cpu-cy=
cles.rmap_walk.try_to_unmap.shrink_page_list.shrink_inactive_list.shrink_lr=
uvec
      0.01 =C2=B1100%  +30500.0%       1.53 =C2=B1 42%  perf-profile.cpu-cy=
cles.save_stack_trace_tsk.__account_scheduler_latency.enqueue_entity.enqueu=
e_task_fair.enqueue_task
      0.00 =C2=B1 -1%      +Inf%       0.70 =C2=B1 39%  perf-profile.cpu-cy=
cles.schedule.schedule_timeout.io_schedule_timeout.bit_wait_io.__wait_on_bit
      0.00 =C2=B1 -1%      +Inf%       0.71 =C2=B1 40%  perf-profile.cpu-cy=
cles.schedule_timeout.io_schedule_timeout.bit_wait_io.__wait_on_bit.wait_on=
_page_bit_killable
      0.18 =C2=B1 16%   +1061.4%       2.03 =C2=B1 16%  perf-profile.cpu-cy=
cles.scheduler_tick.update_process_times.tick_sched_handle.tick_sched_timer=
.__hrtimer_run_queues
     82.99 =C2=B1  0%     -96.2%       3.19 =C2=B1 54%  perf-profile.cpu-cy=
cles.shrink_inactive_list.shrink_lruvec.shrink_zone.do_try_to_free_pages.tr=
y_to_free_pages
      6.25 =C2=B1  1%    +217.8%      19.86 =C2=B1 14%  perf-profile.cpu-cy=
cles.shrink_inactive_list.shrink_lruvec.shrink_zone.kswapd.kthread
     83.00 =C2=B1  0%     -96.2%       3.19 =C2=B1 54%  perf-profile.cpu-cy=
cles.shrink_lruvec.shrink_zone.do_try_to_free_pages.try_to_free_pages.__all=
oc_pages_nodemask
      6.25 =C2=B1  1%    +218.4%      19.90 =C2=B1 14%  perf-profile.cpu-cy=
cles.shrink_lruvec.shrink_zone.kswapd.kthread.ret_from_fork
     82.90 =C2=B1  0%     -96.4%       3.02 =C2=B1 52%  perf-profile.cpu-cy=
cles.shrink_page_list.shrink_inactive_list.shrink_lruvec.shrink_zone.do_try=
_to_free_pages
      6.24 =C2=B1  1%    +185.9%      17.85 =C2=B1 14%  perf-profile.cpu-cy=
cles.shrink_page_list.shrink_inactive_list.shrink_lruvec.shrink_zone.kswapd
     82.50 =C2=B1  1%     -96.1%       3.20 =C2=B1 54%  perf-profile.cpu-cy=
cles.shrink_zone.do_try_to_free_pages.try_to_free_pages.__alloc_pages_nodem=
ask.alloc_pages_current
      6.25 =C2=B1  1%    +221.2%      20.07 =C2=B1 15%  perf-profile.cpu-cy=
cles.shrink_zone.kswapd.kthread.ret_from_fork
      0.01 =C2=B1-10000%  +44325.0%       4.44 =C2=B1 18%  perf-profile.cpu=
-cycles.smp_apic_timer_interrupt.apic_timer_interrupt
      0.00 =C2=B1 -1%      +Inf%       3.51 =C2=B1 22%  perf-profile.cpu-cy=
cles.smp_call_function_interrupt.call_function_interrupt
      2.55 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.smp_call_function_interrupt.call_function_interrupt._raw_spin_lock.__p=
age_check_address.page_referenced_one
      2.02 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.smp_call_function_interrupt.call_function_interrupt._raw_spin_lock.__p=
age_check_address.try_to_unmap_one
     13.73 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.smp_call_function_many.native_flush_tlb_others.flush_tlb_page.ptep_cle=
ar_flush.try_to_unmap_one
      0.00 =C2=B1 -1%      +Inf%       4.84 =C2=B1 20%  perf-profile.cpu-cy=
cles.smp_call_function_many.try_to_unmap_flush.shrink_page_list.shrink_inac=
tive_list.shrink_lruvec
      0.02 =C2=B1 44%  +11540.0%       2.91 =C2=B1 37%  perf-profile.cpu-cy=
cles.start_secondary
      0.00 =C2=B1 -1%      +Inf%       1.08 =C2=B1 22%  perf-profile.cpu-cy=
cles.task_tick_fair.scheduler_tick.update_process_times.tick_sched_handle.t=
ick_sched_timer
      0.46 =C2=B1  3%    +513.7%       2.81 =C2=B1 16%  perf-profile.cpu-cy=
cles.tick_sched_handle.isra.17.tick_sched_timer.__hrtimer_run_queues.hrtime=
r_interrupt.local_apic_timer_interrupt
      0.48 =C2=B1  1%    +504.6%       2.93 =C2=B1 17%  perf-profile.cpu-cy=
cles.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.local_apic_tim=
er_interrupt.smp_apic_timer_interrupt
     79.44 =C2=B1  1%     -96.1%       3.06 =C2=B1 50%  perf-profile.cpu-cy=
cles.try_to_free_pages.__alloc_pages_nodemask.alloc_pages_current.__page_ca=
che_alloc.__do_page_cache_readahead
      2.82 =C2=B1 46%     -95.9%       0.12 =C2=B1141%  perf-profile.cpu-cy=
cles.try_to_free_pages.__alloc_pages_nodemask.alloc_pages_current.pte_alloc=
_one.__pte_alloc
     46.76 =C2=B1  0%     -94.2%       2.69 =C2=B1 23%  perf-profile.cpu-cy=
cles.try_to_unmap.shrink_page_list.shrink_inactive_list.shrink_lruvec.shrin=
k_zone
      0.00 =C2=B1 -1%      +Inf%       4.93 =C2=B1 20%  perf-profile.cpu-cy=
cles.try_to_unmap_flush.shrink_page_list.shrink_inactive_list.shrink_lruvec=
.shrink_zone
     46.37 =C2=B1  0%     -97.0%       1.39 =C2=B1 23%  perf-profile.cpu-cy=
cles.try_to_unmap_one.rmap_walk.try_to_unmap.shrink_page_list.shrink_inacti=
ve_list
      0.00 =C2=B1 -1%      +Inf%       2.50 =C2=B1 43%  perf-profile.cpu-cy=
cles.try_to_wake_up.default_wake_function.autoremove_wake_function.wake_bit=
_function.__wake_up_common
      0.00 =C2=B1 -1%      +Inf%       2.06 =C2=B1 44%  perf-profile.cpu-cy=
cles.ttwu_do_activate.constprop.84.try_to_wake_up.default_wake_function.aut=
oremove_wake_function.wake_bit_function
      0.00 =C2=B1 -1%      +Inf%       1.85 =C2=B1 30%  perf-profile.cpu-cy=
cles.unlock_page.do_mpage_readpage.mpage_readpages.xfs_vm_readpages.__do_pa=
ge_cache_readahead
      0.01 =C2=B1100%  +37950.0%       1.90 =C2=B1 25%  perf-profile.cpu-cy=
cles.unlock_page.filemap_map_pages.handle_mm_fault.__do_page_fault.do_page_=
fault
      0.00 =C2=B1 -1%      +Inf%       1.42 =C2=B1 46%  perf-profile.cpu-cy=
cles.unlock_page.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      0.15 =C2=B1 10%    +388.5%       0.74 =C2=B1 31%  perf-profile.cpu-cy=
cles.up_read.rmap_walk.page_referenced.shrink_page_list.shrink_inactive_list
      0.45 =C2=B1  4%    +516.8%       2.76 =C2=B1 16%  perf-profile.cpu-cy=
cles.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_=
queues.hrtimer_interrupt
      0.00 =C2=B1 -1%      +Inf%       1.74 =C2=B1 44%  perf-profile.cpu-cy=
cles.wait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.xfs_filem=
ap_fault.__do_fault
      0.00 =C2=B1 -1%      +Inf%       2.55 =C2=B1 43%  perf-profile.cpu-cy=
cles.wake_bit_function.__wake_up_common.__wake_up.__wake_up_bit.unlock_page
     81.70 =C2=B1  1%     -51.1%      39.99 =C2=B1 11%  perf-profile.cpu-cy=
cles.xfs_filemap_fault.__do_fault.handle_mm_fault.__do_page_fault.do_page_f=
ault
      0.03 =C2=B1 34%   +5730.0%       1.46 =C2=B1 15%  perf-profile.cpu-cy=
cles.xfs_get_blocks.do_mpage_readpage.mpage_readpages.xfs_vm_readpages.__do=
_page_cache_readahead
      0.00 =C2=B1 -1%      +Inf%       1.61 =C2=B1 76%  perf-profile.cpu-cy=
cles.xfs_vm_readpages.__do_page_cache_readahead.filemap_fault.xfs_filemap_f=
ault.__do_fault
      1.83 =C2=B1  6%   +1469.6%      28.80 =C2=B1 12%  perf-profile.cpu-cy=
cles.xfs_vm_readpages.__do_page_cache_readahead.ondemand_readahead.page_cac=
he_async_readahead.filemap_fault
      2494 =C2=B1  4%     -32.2%       1692 =C2=B1  3%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
      2469 =C2=B1  5%     -31.6%       1690 =C2=B1  4%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
      2466 =C2=B1  5%     -31.4%       1693 =C2=B1  4%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
     20.75 =C2=B1 17%     -24.1%      15.75 =C2=B1  2%  sched_debug.cfs_rq[=
12]:/.load_avg
      2464 =C2=B1  5%     -31.4%       1690 =C2=B1  4%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
     20.75 =C2=B1 17%     -24.1%      15.75 =C2=B1  2%  sched_debug.cfs_rq[=
12]:/.tg_load_avg_contrib
    100.50 =C2=B1 82%     -86.1%      14.00 =C2=B1 11%  sched_debug.cfs_rq[=
13]:/.load
    138.25 =C2=B1 47%     -87.3%      17.50 =C2=B1  4%  sched_debug.cfs_rq[=
13]:/.load_avg
     98.50 =C2=B1 83%     -85.0%      14.75 =C2=B1 12%  sched_debug.cfs_rq[=
13]:/.runnable_load_avg
      2468 =C2=B1  5%     -30.9%       1704 =C2=B1  5%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
    139.25 =C2=B1 47%     -87.4%      17.50 =C2=B1  4%  sched_debug.cfs_rq[=
13]:/.tg_load_avg_contrib
      2467 =C2=B1  5%     -30.9%       1703 =C2=B1  4%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
      2467 =C2=B1  5%     -31.5%       1691 =C2=B1  5%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
      2.50 =C2=B1 44%    +270.0%       9.25 =C2=B1 43%  sched_debug.cfs_rq[=
16]:/.nr_spread_over
    -19276 =C2=B1-1804%   +2126.3%    -429159 =C2=B1 -5%  sched_debug.cfs_r=
q[16]:/.spread0
      2467 =C2=B1  5%     -31.5%       1691 =C2=B1  5%  sched_debug.cfs_rq[=
16]:/.tg_load_avg
      4.75 =C2=B1 60%    +105.3%       9.75 =C2=B1 26%  sched_debug.cfs_rq[=
17]:/.nr_spread_over
      2473 =C2=B1  7%     -31.6%       1692 =C2=B1  5%  sched_debug.cfs_rq[=
17]:/.tg_load_avg
    -38059 =C2=B1-877%   +1084.4%    -450771 =C2=B1-25%  sched_debug.cfs_rq=
[18]:/.spread0
      2473 =C2=B1  7%     -30.8%       1710 =C2=B1  4%  sched_debug.cfs_rq[=
18]:/.tg_load_avg
      2473 =C2=B1  7%     -30.6%       1716 =C2=B1  4%  sched_debug.cfs_rq[=
19]:/.tg_load_avg
      2466 =C2=B1  5%     -31.4%       1691 =C2=B1  4%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
    -67725 =C2=B1-397%    +315.1%    -281110 =C2=B1-17%  sched_debug.cfs_rq=
[20]:/.spread0
      2473 =C2=B1  7%     -30.4%       1722 =C2=B1  4%  sched_debug.cfs_rq[=
20]:/.tg_load_avg
    100.00 =C2=B1 83%     -69.5%      30.50 =C2=B1 88%  sched_debug.cfs_rq[=
21]:/.runnable_load_avg
      2473 =C2=B1  7%     -30.9%       1708 =C2=B1  5%  sched_debug.cfs_rq[=
21]:/.tg_load_avg
      2473 =C2=B1  7%     -31.0%       1706 =C2=B1  5%  sched_debug.cfs_rq[=
22]:/.tg_load_avg
    732.50 =C2=B1  7%     +12.1%     821.25 =C2=B1  1%  sched_debug.cfs_rq[=
22]:/.util_avg
      2472 =C2=B1  7%     -31.1%       1704 =C2=B1  5%  sched_debug.cfs_rq[=
23]:/.tg_load_avg
     18.75 =C2=B1  5%     -14.7%      16.00 =C2=B1  4%  sched_debug.cfs_rq[=
24]:/.runnable_load_avg
      2472 =C2=B1  7%     -31.0%       1705 =C2=B1  5%  sched_debug.cfs_rq[=
24]:/.tg_load_avg
     23.50 =C2=B1 29%     -37.2%      14.75 =C2=B1 11%  sched_debug.cfs_rq[=
25]:/.load_avg
      2470 =C2=B1  7%     -31.1%       1702 =C2=B1  5%  sched_debug.cfs_rq[=
25]:/.tg_load_avg
     23.50 =C2=B1 29%     -37.2%      14.75 =C2=B1 11%  sched_debug.cfs_rq[=
25]:/.tg_load_avg_contrib
      2471 =C2=B1  8%     -31.1%       1702 =C2=B1  4%  sched_debug.cfs_rq[=
26]:/.tg_load_avg
      2471 =C2=B1  7%     -31.0%       1705 =C2=B1  5%  sched_debug.cfs_rq[=
27]:/.tg_load_avg
      2470 =C2=B1  7%     -31.0%       1705 =C2=B1  5%  sched_debug.cfs_rq[=
28]:/.tg_load_avg
     61.00 =C2=B1114%     -73.4%      16.25 =C2=B1  6%  sched_debug.cfs_rq[=
29]:/.load_avg
     59.75 =C2=B1118%     -73.6%      15.75 =C2=B1  2%  sched_debug.cfs_rq[=
29]:/.runnable_load_avg
      2471 =C2=B1  7%     -31.0%       1704 =C2=B1  5%  sched_debug.cfs_rq[=
29]:/.tg_load_avg
     60.75 =C2=B1114%     -73.3%      16.25 =C2=B1  6%  sched_debug.cfs_rq[=
29]:/.tg_load_avg_contrib
      2467 =C2=B1  5%     -31.5%       1689 =C2=B1  3%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
      2472 =C2=B1  7%     -30.9%       1707 =C2=B1  4%  sched_debug.cfs_rq[=
30]:/.tg_load_avg
      2468 =C2=B1  7%     -30.8%       1708 =C2=B1  5%  sched_debug.cfs_rq[=
31]:/.tg_load_avg
      2465 =C2=B1  7%     -30.7%       1708 =C2=B1  5%  sched_debug.cfs_rq[=
32]:/.tg_load_avg
      2463 =C2=B1  7%     -30.5%       1710 =C2=B1  5%  sched_debug.cfs_rq[=
33]:/.tg_load_avg
      2463 =C2=B1  7%     -30.4%       1714 =C2=B1  5%  sched_debug.cfs_rq[=
34]:/.tg_load_avg
      2462 =C2=B1  7%     -32.0%       1675 =C2=B1  7%  sched_debug.cfs_rq[=
35]:/.tg_load_avg
      2462 =C2=B1  7%     -31.9%       1678 =C2=B1  7%  sched_debug.cfs_rq[=
36]:/.tg_load_avg
     16.00 =C2=B1 18%    +403.1%      80.50 =C2=B1 72%  sched_debug.cfs_rq[=
37]:/.load_avg
     -1797 =C2=B1-23058%  +21806.9%    -393844 =C2=B1-35%  sched_debug.cfs_=
rq[37]:/.spread0
      2461 =C2=B1  7%     -31.9%       1676 =C2=B1  7%  sched_debug.cfs_rq[=
37]:/.tg_load_avg
     16.00 =C2=B1 18%    +403.1%      80.50 =C2=B1 72%  sched_debug.cfs_rq[=
37]:/.tg_load_avg_contrib
      2461 =C2=B1  7%     -32.1%       1670 =C2=B1  7%  sched_debug.cfs_rq[=
38]:/.tg_load_avg
    -11058 =C2=B1-3224%   +3760.7%    -426917 =C2=B1-24%  sched_debug.cfs_r=
q[39]:/.spread0
      2467 =C2=B1  7%     -32.2%       1672 =C2=B1  8%  sched_debug.cfs_rq[=
39]:/.tg_load_avg
      2467 =C2=B1  5%     -31.5%       1690 =C2=B1  3%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
     19026 =C2=B11892%   -2390.3%    -435768 =C2=B1-14%  sched_debug.cfs_rq=
[40]:/.spread0
      2466 =C2=B1  7%     -32.1%       1674 =C2=B1  8%  sched_debug.cfs_rq[=
40]:/.tg_load_avg
    103.00 =C2=B1 84%     -78.4%      22.25 =C2=B1 56%  sched_debug.cfs_rq[=
41]:/.load_avg
     59345 =C2=B1352%    -906.7%    -478762 =C2=B1-57%  sched_debug.cfs_rq[=
41]:/.spread0
      2469 =C2=B1  7%     -32.1%       1676 =C2=B1  8%  sched_debug.cfs_rq[=
41]:/.tg_load_avg
    103.00 =C2=B1 84%     -78.4%      22.25 =C2=B1 56%  sched_debug.cfs_rq[=
41]:/.tg_load_avg_contrib
      2472 =C2=B1  7%     -32.1%       1679 =C2=B1  8%  sched_debug.cfs_rq[=
42]:/.tg_load_avg
    -90463 =C2=B1-221%    +284.2%    -347573 =C2=B1-17%  sched_debug.cfs_rq=
[43]:/.spread0
      2470 =C2=B1  7%     -31.9%       1682 =C2=B1  8%  sched_debug.cfs_rq[=
43]:/.tg_load_avg
      2470 =C2=B1  7%     -31.8%       1684 =C2=B1  8%  sched_debug.cfs_rq[=
44]:/.tg_load_avg
      2471 =C2=B1  7%     -31.6%       1690 =C2=B1  8%  sched_debug.cfs_rq[=
45]:/.tg_load_avg
     85594 =C2=B1379%    -529.7%    -367773 =C2=B1-27%  sched_debug.cfs_rq[=
46]:/.spread0
      2472 =C2=B1  7%     -31.7%       1690 =C2=B1  8%  sched_debug.cfs_rq[=
46]:/.tg_load_avg
      2474 =C2=B1  7%     -32.1%       1680 =C2=B1  8%  sched_debug.cfs_rq[=
47]:/.tg_load_avg
      2467 =C2=B1  5%     -31.5%       1689 =C2=B1  4%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
      2466 =C2=B1  5%     -31.6%       1687 =C2=B1  4%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
      2467 =C2=B1  5%     -31.6%       1687 =C2=B1  4%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
      2467 =C2=B1  5%     -31.6%       1687 =C2=B1  4%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
      2468 =C2=B1  5%     -31.6%       1689 =C2=B1  4%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
      2468 =C2=B1  5%     -31.5%       1690 =C2=B1  4%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
    515797 =C2=B1 19%     +47.0%     758351 =C2=B1 12%  sched_debug.cpu#10.=
avg_idle
    772344 =C2=B1 19%     -46.2%     415620 =C2=B1 25%  sched_debug.cpu#12.=
avg_idle
     90073 =C2=B1 25%    +399.5%     449913 =C2=B1 13%  sched_debug.cpu#12.=
nr_switches
     91341 =C2=B1 25%    +395.1%     452202 =C2=B1 13%  sched_debug.cpu#12.=
sched_count
     31956 =C2=B1 53%    +580.7%     217530 =C2=B1 13%  sched_debug.cpu#12.=
sched_goidle
     45275 =C2=B1 26%    +396.9%     224988 =C2=B1 12%  sched_debug.cpu#12.=
ttwu_count
     98.50 =C2=B1 83%     -85.0%      14.75 =C2=B1  7%  sched_debug.cpu#13.=
cpu_load[0]
     98.75 =C2=B1 83%     -84.8%      15.00 =C2=B1  4%  sched_debug.cpu#13.=
cpu_load[1]
     77821 =C2=B1 26%    +408.3%     395597 =C2=B1 10%  sched_debug.cpu#13.=
nr_switches
    -30.50 =C2=B1-94%    -166.4%      20.25 =C2=B1 92%  sched_debug.cpu#13.=
nr_uninterruptible
     79198 =C2=B1 25%    +403.1%     398466 =C2=B1 10%  sched_debug.cpu#13.=
sched_count
     31182 =C2=B1 55%    +519.7%     193231 =C2=B1 10%  sched_debug.cpu#13.=
sched_goidle
     38722 =C2=B1 22%    +418.9%     200938 =C2=B1 14%  sched_debug.cpu#13.=
ttwu_count
     91017 =C2=B1 16%    +316.8%     379345 =C2=B1  8%  sched_debug.cpu#14.=
nr_switches
     93050 =C2=B1 15%    +310.0%     381510 =C2=B1  8%  sched_debug.cpu#14.=
sched_count
     33477 =C2=B1 56%    +454.1%     185513 =C2=B1  8%  sched_debug.cpu#14.=
sched_goidle
     44850 =C2=B1 16%    +334.0%     194645 =C2=B1 11%  sched_debug.cpu#14.=
ttwu_count
     73629 =C2=B1 33%    +345.7%     328161 =C2=B1 10%  sched_debug.cpu#15.=
nr_switches
     -1.25 =C2=B1-1266%   -2860.0%      34.50 =C2=B1 34%  sched_debug.cpu#1=
5.nr_uninterruptible
     75039 =C2=B1 32%    +339.9%     330093 =C2=B1 10%  sched_debug.cpu#15.=
sched_count
     31218 =C2=B1 54%    +412.6%     160034 =C2=B1 10%  sched_debug.cpu#15.=
sched_goidle
     35121 =C2=B1 32%    +368.9%     164701 =C2=B1 10%  sched_debug.cpu#15.=
ttwu_count
     71334 =C2=B1 34%    +405.7%     360746 =C2=B1 17%  sched_debug.cpu#16.=
nr_switches
     74176 =C2=B1 31%    +389.6%     363169 =C2=B1 17%  sched_debug.cpu#16.=
sched_count
     24687 =C2=B1 54%    +609.7%     175191 =C2=B1 17%  sched_debug.cpu#16.=
sched_goidle
     34412 =C2=B1 43%    +458.6%     192220 =C2=B1 16%  sched_debug.cpu#16.=
ttwu_count
    675440 =C2=B1 29%     -34.1%     444784 =C2=B1 29%  sched_debug.cpu#17.=
avg_idle
     68943 =C2=B1 48%    +395.3%     341448 =C2=B1  9%  sched_debug.cpu#17.=
nr_switches
     70306 =C2=B1 46%    +388.7%     343571 =C2=B1  9%  sched_debug.cpu#17.=
sched_count
     30244 =C2=B1 53%    +450.6%     166526 =C2=B1  9%  sched_debug.cpu#17.=
sched_goidle
     34874 =C2=B1 46%    +404.1%     175792 =C2=B1  8%  sched_debug.cpu#17.=
ttwu_count
     59643 =C2=B1 49%    +475.0%     342930 =C2=B1 13%  sched_debug.cpu#18.=
nr_switches
     61041 =C2=B1 47%    +467.2%     346247 =C2=B1 13%  sched_debug.cpu#18.=
sched_count
     25907 =C2=B1 54%    +546.6%     167516 =C2=B1 14%  sched_debug.cpu#18.=
sched_goidle
     30665 =C2=B1 49%    +465.2%     173314 =C2=B1 13%  sched_debug.cpu#18.=
ttwu_count
    715381 =C2=B1 11%     -25.0%     536826 =C2=B1 27%  sched_debug.cpu#19.=
avg_idle
     79154 =C2=B1 45%    +355.6%     360655 =C2=B1 23%  sched_debug.cpu#19.=
nr_switches
     80360 =C2=B1 44%    +351.7%     362968 =C2=B1 23%  sched_debug.cpu#19.=
sched_count
     33053 =C2=B1 52%    +428.7%     174766 =C2=B1 24%  sched_debug.cpu#19.=
sched_goidle
     39022 =C2=B1 46%    +375.3%     185469 =C2=B1 21%  sched_debug.cpu#19.=
ttwu_count
     56484 =C2=B1 47%    +514.8%     347258 =C2=B1  8%  sched_debug.cpu#20.=
nr_switches
     57707 =C2=B1 46%    +505.8%     349595 =C2=B1  7%  sched_debug.cpu#20.=
sched_count
     24050 =C2=B1 52%    +606.1%     169809 =C2=B1  8%  sched_debug.cpu#20.=
sched_goidle
     27285 =C2=B1 48%    +530.2%     171948 =C2=B1  9%  sched_debug.cpu#20.=
ttwu_count
    100.00 =C2=B1 83%     -85.0%      15.00 =C2=B1  8%  sched_debug.cpu#21.=
cpu_load[0]
    100.00 =C2=B1 83%     -85.0%      15.00 =C2=B1  8%  sched_debug.cpu#21.=
cpu_load[1]
     98.50 =C2=B1 82%     -84.5%      15.25 =C2=B1  8%  sched_debug.cpu#21.=
cpu_load[2]
     91.50 =C2=B1 82%     -80.6%      17.75 =C2=B1 27%  sched_debug.cpu#21.=
cpu_load[3]
     81.00 =C2=B1 86%     -74.1%      21.00 =C2=B1 49%  sched_debug.cpu#21.=
cpu_load[4]
     73798 =C2=B1 40%    +399.3%     368467 =C2=B1  9%  sched_debug.cpu#21.=
nr_switches
     -3.00 =C2=B1-143%   -1075.0%      29.25 =C2=B1 53%  sched_debug.cpu#21=
.nr_uninterruptible
     75091 =C2=B1 39%    +393.7%     370696 =C2=B1  8%  sched_debug.cpu#21.=
sched_count
     28391 =C2=B1 50%    +532.0%     179443 =C2=B1  9%  sched_debug.cpu#21.=
sched_goidle
     37067 =C2=B1 40%    +398.6%     184818 =C2=B1  8%  sched_debug.cpu#21.=
ttwu_count
     77996 =C2=B1 60%    +371.5%     367777 =C2=B1 14%  sched_debug.cpu#22.=
nr_switches
      7.00 =C2=B1 94%    +321.4%      29.50 =C2=B1 23%  sched_debug.cpu#22.=
nr_uninterruptible
     79686 =C2=B1 58%    +363.5%     369376 =C2=B1 14%  sched_debug.cpu#22.=
sched_count
     30204 =C2=B1 54%    +490.3%     178293 =C2=B1 14%  sched_debug.cpu#22.=
sched_goidle
     38043 =C2=B1 59%    +376.9%     181416 =C2=B1 14%  sched_debug.cpu#22.=
ttwu_count
     68658 =C2=B1 60%    +431.2%     364695 =C2=B1  6%  sched_debug.cpu#23.=
nr_switches
      5.50 =C2=B1138%    +481.8%      32.00 =C2=B1 65%  sched_debug.cpu#23.=
nr_uninterruptible
     69820 =C2=B1 59%    +425.5%     366933 =C2=B1  5%  sched_debug.cpu#23.=
sched_count
     27598 =C2=B1 67%    +534.7%     175164 =C2=B1  3%  sched_debug.cpu#23.=
sched_goidle
     35976 =C2=B1 61%    +383.5%     173947 =C2=B1  6%  sched_debug.cpu#23.=
ttwu_count
    539599 =C2=B1 31%     +68.4%     908760 =C2=B1 10%  sched_debug.cpu#24.=
avg_idle
     18.75 =C2=B1  5%     -14.7%      16.00 =C2=B1  4%  sched_debug.cpu#24.=
cpu_load[0]
     18.75 =C2=B1  5%     -14.7%      16.00 =C2=B1  4%  sched_debug.cpu#24.=
cpu_load[1]
      3276 =C2=B1 61%     -53.5%       1522 =C2=B1 15%  sched_debug.cpu#25.=
ttwu_local
    581290 =C2=B1 12%     +41.2%     820671 =C2=B1 15%  sched_debug.cpu#26.=
avg_idle
    541356 =C2=B1 22%     +31.6%     712630 =C2=B1  8%  sched_debug.cpu#27.=
avg_idle
     59.75 =C2=B1118%     -73.6%      15.75 =C2=B1  2%  sched_debug.cpu#29.=
cpu_load[0]
     59.75 =C2=B1118%     -73.6%      15.75 =C2=B1  2%  sched_debug.cpu#29.=
cpu_load[1]
     59.75 =C2=B1118%     -73.6%      15.75 =C2=B1  2%  sched_debug.cpu#29.=
cpu_load[2]
     60.00 =C2=B1117%     -73.8%      15.75 =C2=B1  2%  sched_debug.cpu#29.=
cpu_load[3]
     60.00 =C2=B1117%     -73.8%      15.75 =C2=B1  2%  sched_debug.cpu#29.=
cpu_load[4]
    523830 =C2=B1 40%     +54.7%     810484 =C2=B1  7%  sched_debug.cpu#3.a=
vg_idle
    516632 =C2=B1 17%     +54.2%     796756 =C2=B1  6%  sched_debug.cpu#31.=
avg_idle
    562160 =C2=B1  8%     +31.2%     737363 =C2=B1 10%  sched_debug.cpu#32.=
avg_idle
    502554 =C2=B1 14%     +55.7%     782527 =C2=B1  7%  sched_debug.cpu#33.=
avg_idle
    458849 =C2=B1 34%     +56.6%     718680 =C2=B1 16%  sched_debug.cpu#34.=
avg_idle
      9.75 =C2=B1104%    +171.8%      26.50 =C2=B1 19%  sched_debug.cpu#35.=
nr_uninterruptible
    579050 =C2=B1 19%     -29.2%     409775 =C2=B1 16%  sched_debug.cpu#36.=
avg_idle
     70123 =C2=B1 36%    +480.4%     406962 =C2=B1  9%  sched_debug.cpu#36.=
nr_switches
     71197 =C2=B1 35%    +473.4%     408215 =C2=B1  9%  sched_debug.cpu#36.=
sched_count
     30280 =C2=B1 52%    +555.9%     198595 =C2=B1  9%  sched_debug.cpu#36.=
sched_goidle
     35105 =C2=B1 34%    +478.5%     203089 =C2=B1  9%  sched_debug.cpu#36.=
ttwu_count
     15.00 =C2=B1 24%    +410.0%      76.50 =C2=B1 79%  sched_debug.cpu#37.=
cpu_load[0]
     15.50 =C2=B1 21%    +354.8%      70.50 =C2=B1 79%  sched_debug.cpu#37.=
cpu_load[4]
     67749 =C2=B1 55%    +485.8%     396904 =C2=B1  7%  sched_debug.cpu#37.=
nr_switches
      8.75 =C2=B1123%    -414.3%     -27.50 =C2=B1-15%  sched_debug.cpu#37.=
nr_uninterruptible
     68824 =C2=B1 54%    +479.6%     398914 =C2=B1  7%  sched_debug.cpu#37.=
sched_count
     28170 =C2=B1 54%    +590.0%     194374 =C2=B1  7%  sched_debug.cpu#37.=
sched_goidle
     34370 =C2=B1 56%    +501.0%     206566 =C2=B1  7%  sched_debug.cpu#37.=
ttwu_count
     74792 =C2=B1 52%    +406.2%     378573 =C2=B1 12%  sched_debug.cpu#38.=
nr_switches
     75882 =C2=B1 51%    +400.5%     379807 =C2=B1 12%  sched_debug.cpu#38.=
sched_count
     33835 =C2=B1 55%    +448.9%     185709 =C2=B1 12%  sched_debug.cpu#38.=
sched_goidle
     37917 =C2=B1 52%    +392.5%     186731 =C2=B1 11%  sched_debug.cpu#38.=
ttwu_count
     65741 =C2=B1 40%    +441.7%     356109 =C2=B1  7%  sched_debug.cpu#39.=
nr_switches
     66817 =C2=B1 39%    +434.7%     357271 =C2=B1  7%  sched_debug.cpu#39.=
sched_count
     28725 =C2=B1 56%    +504.8%     173731 =C2=B1  7%  sched_debug.cpu#39.=
sched_goidle
     32630 =C2=B1 38%    +463.7%     183933 =C2=B1  7%  sched_debug.cpu#39.=
ttwu_count
     79417 =C2=B1 40%    +358.0%     363715 =C2=B1 10%  sched_debug.cpu#40.=
nr_switches
     81161 =C2=B1 40%    +349.8%     365076 =C2=B1 10%  sched_debug.cpu#40.=
sched_count
     30793 =C2=B1 61%    +477.0%     177691 =C2=B1 10%  sched_debug.cpu#40.=
sched_goidle
     44088 =C2=B1 34%    +337.8%     193038 =C2=B1  9%  sched_debug.cpu#40.=
ttwu_count
    102.50 =C2=B1 78%     -83.9%      16.50 =C2=B1 12%  sched_debug.cpu#41.=
load
     65813 =C2=B1 43%    +476.1%     379163 =C2=B1 18%  sched_debug.cpu#41.=
nr_switches
     -6.25 =C2=B1-164%    +452.0%     -34.50 =C2=B1-65%  sched_debug.cpu#41=
.nr_uninterruptible
     66877 =C2=B1 42%    +468.9%     380468 =C2=B1 18%  sched_debug.cpu#41.=
sched_count
     27169 =C2=B1 53%    +581.9%     185252 =C2=B1 19%  sched_debug.cpu#41.=
sched_goidle
     33710 =C2=B1 43%    +484.1%     196906 =C2=B1 19%  sched_debug.cpu#41.=
ttwu_count
     69518 =C2=B1 34%    +456.3%     386698 =C2=B1 21%  sched_debug.cpu#42.=
nr_switches
     -4.00 =C2=B1-110%    +706.2%     -32.25 =C2=B1-55%  sched_debug.cpu#42=
.nr_uninterruptible
     70567 =C2=B1 33%    +449.8%     387999 =C2=B1 21%  sched_debug.cpu#42.=
sched_count
     23890 =C2=B1 53%    +688.3%     188322 =C2=B1 21%  sched_debug.cpu#42.=
sched_goidle
     35286 =C2=B1 36%    +470.2%     201203 =C2=B1 21%  sched_debug.cpu#42.=
ttwu_count
     63913 =C2=B1 49%    +527.4%     400989 =C2=B1 19%  sched_debug.cpu#43.=
nr_switches
     64949 =C2=B1 48%    +519.3%     402219 =C2=B1 19%  sched_debug.cpu#43.=
sched_count
     28106 =C2=B1 58%    +590.5%     194082 =C2=B1 20%  sched_debug.cpu#43.=
sched_goidle
     29520 =C2=B1 46%    +575.8%     199487 =C2=B1 16%  sched_debug.cpu#43.=
ttwu_count
      4160 =C2=B1 15%     +74.2%       7249 =C2=B1 48%  sched_debug.cpu#43.=
ttwu_local
     66494 =C2=B1 55%    +498.3%     397815 =C2=B1 17%  sched_debug.cpu#44.=
nr_switches
     67552 =C2=B1 54%    +490.9%     399165 =C2=B1 17%  sched_debug.cpu#44.=
sched_count
     29362 =C2=B1 60%    +551.2%     191195 =C2=B1 16%  sched_debug.cpu#44.=
sched_goidle
     34768 =C2=B1 54%    +507.8%     211318 =C2=B1 16%  sched_debug.cpu#44.=
ttwu_count
      3960 =C2=B1 45%    +118.0%       8632 =C2=B1 46%  sched_debug.cpu#44.=
ttwu_local
    628043 =C2=B1 13%     -37.0%     395598 =C2=B1 28%  sched_debug.cpu#45.=
avg_idle
     72176 =C2=B1 45%    +449.3%     396434 =C2=B1  7%  sched_debug.cpu#45.=
nr_switches
     -0.75 =C2=B1-648%   +2600.0%     -20.25 =C2=B1-74%  sched_debug.cpu#45=
.nr_uninterruptible
     73253 =C2=B1 44%    +442.9%     397719 =C2=B1  7%  sched_debug.cpu#45.=
sched_count
     30519 =C2=B1 56%    +535.4%     193909 =C2=B1  7%  sched_debug.cpu#45.=
sched_goidle
     36857 =C2=B1 44%    +437.7%     198166 =C2=B1  7%  sched_debug.cpu#45.=
ttwu_count
     60443 =C2=B1 35%    +593.8%     419351 =C2=B1 19%  sched_debug.cpu#46.=
nr_switches
     -7.00 =C2=B1-69%    +189.3%     -20.25 =C2=B1-19%  sched_debug.cpu#46.=
nr_uninterruptible
     61479 =C2=B1 34%    +584.3%     420684 =C2=B1 19%  sched_debug.cpu#46.=
sched_count
     25003 =C2=B1 54%    +713.4%     203377 =C2=B1 20%  sched_debug.cpu#46.=
sched_goidle
     29356 =C2=B1 34%    +610.5%     208576 =C2=B1 18%  sched_debug.cpu#46.=
ttwu_count
     67388 =C2=B1 68%    +462.2%     378880 =C2=B1  8%  sched_debug.cpu#47.=
nr_switches
     68470 =C2=B1 67%    +455.1%     380107 =C2=B1  8%  sched_debug.cpu#47.=
sched_count
     28477 =C2=B1 67%    +544.6%     183561 =C2=B1  8%  sched_debug.cpu#47.=
sched_goidle
     32408 =C2=B1 66%    +491.2%     191585 =C2=B1  8%  sched_debug.cpu#47.=
ttwu_count
    454855 =C2=B1 20%     +58.1%     719171 =C2=B1 14%  sched_debug.cpu#6.a=
vg_idle
    465638 =C2=B1 21%     +65.1%     768552 =C2=B1  3%  sched_debug.cpu#8.a=
vg_idle
     16.75 =C2=B1  4%     +14.9%      19.25 =C2=B1  4%  sched_debug.cpu#9.c=
pu_load[0]


ivb43: Ivytown Ivy Bridge-EP
Memory: 64G


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

--===============1933309940142101919==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogdm0tc2NhbGFiaWxpdHkKZGVmYXVsdC1tb25pdG9yczoKICB3YWl0OiBhY3RpdmF0
ZS1tb25pdG9yCiAga21zZzogCiAgdXB0aW1lOiAKICBpb3N0YXQ6IAogIHZtc3RhdDogCiAgbnVt
YS1udW1hc3RhdDogCiAgbnVtYS12bXN0YXQ6IAogIG51bWEtbWVtaW5mbzogCiAgcHJvYy12bXN0
YXQ6IAogIHByb2Mtc3RhdDoKICAgIGludGVydmFsOiAxMAogIG1lbWluZm86IAogIHNsYWJpbmZv
OiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAogIGxhdGVuY3lfc3RhdHM6IAogIHNvZnRp
cnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tzdGF0czogCiAgbmZzc3RhdDogCiAgY3B1
aWRsZTogCiAgY3B1ZnJlcS1zdGF0czogCiAgdHVyYm9zdGF0OiAKICBwbWV0ZXI6IAogIHNjaGVk
X2RlYnVnOgogICAgaW50ZXJ2YWw6IDYwCmNwdWZyZXFfZ292ZXJub3I6IHBlcmZvcm1hbmNlCmRl
ZmF1bHQtd2F0Y2hkb2dzOgogIG9vbS1raWxsZXI6IAogIHdhdGNoZG9nOiAKbW9kZWw6IEl2eXRv
d24gSXZ5IEJyaWRnZS1FUApucl9jcHU6IDQ4Cm1lbW9yeTogNjRHCm5yX2hkZF9wYXJ0aXRpb25z
OiAzCmhkZF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1TVDIwMDBOTTAwMTEqLXBh
cnQxIgpyb290ZnNfcGFydGl0aW9uOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1TVDIwMDBOTTAwMTFf
WjFQNjdFQkwtcGFydDMiCnN3YXBfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtU1Qy
MDAwTk0wMDExX1oxUDY3RUJMLXBhcnQyIgpjYXRlZ29yeTogYmVuY2htYXJrCnBlcmYtcHJvZmls
ZTogCnJ1bnRpbWU6IDMwMHMKc2l6ZTogCnZtLXNjYWxhYmlsaXR5OgogIHRlc3Q6IG1tYXAteHJl
YWQtc2VxLW10CmJyYW5jaDogcG0vbGludXgtbmV4dApjb21taXQ6IDlmZmVjYjEwMjgzNTA4MjYw
OTM2Yjk2MDIyZDRlZTQzYTc3OThiNGMKcXVldWU6IHVuaXQKcmVwZWF0X3RvOiAyCnRlc3Rib3g6
IGl2YjQzCnRib3hfZ3JvdXA6IGl2YjQzCmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGlt
ZTogMjAxNS0wOS0yNSAwOToyMTozMy40NjQxNDM0OTAgKzA4OjAwCmlkOiBjNWJjN2U0YmJkZTkx
YmE1YjU0NDA4YzM2MDcyNDg1MjhmNDE5ZTkyCnVzZXI6IGxrcApjb21waWxlcjogZ2NjLTQuOQpo
ZWFkX2NvbW1pdDogNWQ5NWFjOGIxNzYxNzIzMTZiMjU1MjNiZTVhZWM5OTUwMjZkMmU1YQpiYXNl
X2NvbW1pdDogOWZmZWNiMTAyODM1MDgyNjA5MzZiOTYwMjJkNGVlNDNhNzc5OGI0YwprZXJuZWw6
ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvOWZmZWNiMTAyODM1MDgyNjA5MzZiOTYw
MjJkNGVlNDNhNzc5OGI0Yy92bWxpbnV6LTQuMy4wLXJjMyIKcm9vdGZzOiBkZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC92bS1zY2FsYWJpbGl0eS9wZXJm
b3JtYW5jZS0zMDBzLW1tYXAteHJlYWQtc2VxLW10L2l2YjQzL2RlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS85ZmZlY2IxMDI4MzUwODI2MDkzNmI5NjAyMmQ0
ZWU0M2E3Nzk4YjRjLzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvaXZiNDMvdW5pdF92bS1z
Y2FsYWJpbGl0eS1wZXJmb3JtYW5jZS0zMDBzLW1tYXAteHJlYWQtc2VxLW10LXg4Nl82NC1yaGVs
LUJBU0UtOWZmZWNiMTAyODM1MDgyNjA5MzZiOTYwMjJkNGVlNDNhNzc5OGI0Yy0yMDE1MDkyNS0x
MTc1OTctMWM2Ym1jcC0wLnlhbWwiCmRlcXVldWVfdGltZTogMjAxNS0wOS0yOSAxNTowMjo1MC42
OTIzMjAzOTAgKzA4OjAwCm1heF91cHRpbWU6IDE1MDAKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFu
L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9
L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQvaXZiNDMvdW5pdF92bS1z
Y2FsYWJpbGl0eS1wZXJmb3JtYW5jZS0zMDBzLW1tYXAteHJlYWQtc2VxLW10LXg4Nl82NC1yaGVs
LUJBU0UtOWZmZWNiMTAyODM1MDgyNjA5MzZiOTYwMjJkNGVlNDNhNzc5OGI0Yy0yMDE1MDkyNS0x
MTc1OTctMWM2Ym1jcC0wLnlhbWwKLSBBUkNIPXg4Nl82NAotIGtjb25maWc9eDg2XzY0LXJoZWwK
LSBicmFuY2g9cG0vbGludXgtbmV4dAotIGNvbW1pdD05ZmZlY2IxMDI4MzUwODI2MDkzNmI5NjAy
MmQ0ZWU0M2E3Nzk4YjRjCi0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00
LjkvOWZmZWNiMTAyODM1MDgyNjA5MzZiOTYwMjJkNGVlNDNhNzc5OGI0Yy92bWxpbnV6LTQuMy4w
LXJjMwotIG1heF91cHRpbWU9MTUwMAotIFJFU1VMVF9ST09UPS9yZXN1bHQvdm0tc2NhbGFiaWxp
dHkvcGVyZm9ybWFuY2UtMzAwcy1tbWFwLXhyZWFkLXNlcS1tdC9pdmI0My9kZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvOWZmZWNiMTAyODM1MDgyNjA5MzZi
OTYwMjJkNGVlNDNhNzc5OGI0Yy8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJp
bnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVn
IHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAK
ICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFu
aWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAw
IGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3At
eDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00
LjkvOWZmZWNiMTAyODM1MDgyNjA5MzZiOTYwMjJkNGVlNDNhNzc5OGI0Yy9tb2R1bGVzLmNneiIK
Ym1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xr
cC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNv
bmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJv
c3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3Zt
LXNjYWxhYmlsaXR5LmNneiIKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiAxMi4yOSAyMy43
MiAxMi43MyAxLzUxNCAxMDg5NApzdGFydF90aW1lOiAnMTQ0MzUxMDIxNCcKZW5kX3RpbWU6ICcx
NDQzNTEwNjAyJwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE1MDkyOS0xNDU4MjEiCg==

--===============1933309940142101919==
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
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgptb3VudCAtdCB0bXBmcyAtbyBzaXplPTEwMCUgdm0tc2NhbGFiaWxpdHktdG1wIC90
bXAvdm0tc2NhbGFiaWxpdHktdG1wCnRydW5jYXRlIC1zIDY3NDQyMjgyNDk2IC90bXAvdm0tc2Nh
bGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5LmltZwpta2ZzLnhmcyAtcSAvdG1wL3ZtLXNjYWxh
YmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eS5pbWcKbW91bnQgLW8gbG9vcCAvdG1wL3ZtLXNjYWxh
YmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eS5pbWcgL3RtcC92bS1zY2FsYWJpbGl0eS10bXAvdm0t
c2NhbGFiaWxpdHkKLi9jYXNlLW1tYXAteHJlYWQtc2VxLW10CnRydW5jYXRlIC90bXAvdm0tc2Nh
bGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5L3NwYXJzZS1tbWFwLXhyZWFkLXNlcS1tdCAtcyA0
Mzk4MDQ2NTExMTA0Ci4vdXNlbWVtIC0tcnVudGltZSAzMDAgLXQgNDggLWYgL3RtcC92bS1zY2Fs
YWJpbGl0eS10bXAvdm0tc2NhbGFiaWxpdHkvc3BhcnNlLW1tYXAteHJlYWQtc2VxLW10IC0tcHJl
YWxsb2MgLS1yZWFkb25seSA1NDk3NTU4MTM4ODgKdW1vdW50IC90bXAvdm0tc2NhbGFiaWxpdHkt
dG1wL3ZtLXNjYWxhYmlsaXR5CnJtIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmls
aXR5LmltZwp1bW91bnQgL3RtcC92bS1zY2FsYWJpbGl0eS10bXAK

--===============1933309940142101919==--

