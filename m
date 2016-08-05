Content-Type: multipart/mixed; boundary="===============6614234138143273442=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [shmem] 071904e8df: meminfo.AnonHugePages +553.5% increase
Date: Fri, 05 Aug 2016 11:17:26 +0800
Message-ID: <20160805031726.GG29977@yexl-desktop>
In-Reply-To: <20160804095411.GB12395@node.shutemov.name>
List-Id: <oe-lkp.lists.linux.dev>

--===============6614234138143273442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/04, Kirill A. Shutemov wrote:
>On Thu, Aug 04, 2016 at 04:54:09PM +0800, kernel test robot wrote:
>>
>> FYI, we noticed meminfo.AnonHugePages +553.5% increase due to commit:
>>
>> commit 071904e8dfed9525f9da86523caf78b6da5f9e7e ("shmem: get_unmapped_ar=
ea align huge page")
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git mast=
er
>>
>> in testcase: vm-scalability
>> on test machine: 128 threads 4 Sockets Haswell-EP with 512G memory
>> with following parameters:
>>
>> 	path_params: 300s-16G-shm-pread-rand-mt-performance
>> 	run:
>>
>>
>>
>> Disclaimer:
>> Results have been estimated based on internal Intel analysis and are pro=
vided
>> for informational purposes only. Any difference in system hardware or so=
ftware
>> design or configuration may affect actual performance.
>>
>> Details are as below:
>> ------------------------------------------------------------------------=
-------------------------->
>>
>>
>> To reproduce:
>>
>>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-=
tests.git
>>         cd lkp-tests
>>         bin/lkp install job.yaml  # job file is attached in this email
>>         bin/lkp run     job.yaml
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/te=
stcase:
>>   gcc-6/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/300s/16G/lk=
p-hsw-4ep1/shm-pread-rand-mt/vm-scalability
>>
>> commit:
>>   6a028aa3ca ("shmem: prepare huge=3D mount option and sysfs knob")
>>   071904e8df ("shmem: get_unmapped_area align huge page")
>>
>> 6a028aa3ca32379e 071904e8dfed9525f9da86523c
>> ---------------- --------------------------
>>          %stddev     %change         %stddev
>>              \          |                \
>>      20428 =C2=B1  9%    +553.5%     133500 =C2=B1  7%  meminfo.AnonHuge=
Pages
>>      42717 =C2=B1  4%    +261.3%     154340 =C2=B1  6%  meminfo.AnonPages
>
>Hm. That's strange. I didn't expect this commit change anything for anon
>memory.
>
>Do you see the same effect from the commit in Linus' tree?

Yes, here the comparison between the commit in Linus' tree (c01d5b3007)
and its parent (5a6e75f811 "shmem: prepare huge=3D mount option and sysfs
knob")

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/testc=
ase:
  gcc-6/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/300s/16G/lkp-h=
sw-4ep1/shm-pread-rand-mt/vm-scalability

commit:
  5a6e75f8110c97e2a5488894d4e922187e6cb343
  c01d5b300774d130a24d787825b01eb24e6e20cb

5a6e75f8110c97e2 c01d5b300774d130a24d787825
---------------- --------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
         %stddev     %change         %stddev
             \          |                \
    533.92 =C2=B1  5%      +7.8%     575.31 =C2=B1  4%  vm-scalability.time=
.elapsed_time
    533.92 =C2=B1  5%      +7.8%     575.31 =C2=B1  4%  vm-scalability.time=
.elapsed_time.max
 1.567e+09 =C2=B1  7%     +31.0%  2.053e+09 =C2=B1 11%  vm-scalability.time=
.maximum_resident_set_size
      7141 =C2=B1  5%      -7.0%       6638 =C2=B1  5%  vm-scalability.time=
.percent_of_cpu_this_job_got
   1708341 =C2=B1 29%     +48.3%    2534068 =C2=B1 21%  vm-scalability.time=
.voluntary_context_switches
   5379895 =C2=B1 12%     +94.3%   10454779 =C2=B1 13%  meminfo.Active
   5351287 =C2=B1 12%     +94.8%   10425228 =C2=B1 13%  meminfo.Active(anon)
     20673 =C2=B1  1%    +570.9%     138687 =C2=B1  4%  meminfo.AnonHugePag=
es    =

     42881 =C2=B1  2%    +276.2%     161340 =C2=B1  4%  meminfo.AnonPages
   9570950 =C2=B1  7%     +93.3%   18504763 =C2=B1 10%  meminfo.Cached
   9461500 =C2=B1  7%     +94.3%   18381777 =C2=B1 11%  meminfo.Committed_AS
   6363833 =C2=B1  7%     +11.3%    7083357 =C2=B1  0%  meminfo.DirectMap2M
   4233226 =C2=B1  1%     +94.0%    8210642 =C2=B1  7%  meminfo.Inactive
   3759914 =C2=B1  1%    +105.8%    7738210 =C2=B1  7%  meminfo.Inactive(an=
on)
   8500775 =C2=B1  8%     +72.3%   14648157 =C2=B1 12%  meminfo.Mapped
    546828 =C2=B1  2%     +11.2%     608309 =C2=B1  1%  meminfo.SReclaimable
   9069484 =C2=B1  7%     +98.5%   18003233 =C2=B1 11%  meminfo.Shmem
 1.567e+09 =C2=B1  7%     +31.0%  2.053e+09 =C2=B1 11%  time.maximum_reside=
nt_set_size
   1708341 =C2=B1 29%     +48.3%    2534068 =C2=B1 21%  time.voluntary_cont=
ext_switches
  10225359 =C2=B1  7%     +87.6%   19185983 =C2=B1 10%  vmstat.memory.cache
      9386 =C2=B1 14%     +24.7%      11702 =C2=B1 10%  vmstat.system.cs
   4395191 =C2=B1  1%     +64.1%    7210638 =C2=B1 16%  numa-numastat.node0=
.local_node
   4395191 =C2=B1  1%     +64.1%    7210639 =C2=B1 16%  numa-numastat.node0=
.numa_hit
      2.33 =C2=B1 20%     -85.7%       0.33 =C2=B1141%  numa-numastat.node3=
.other_node
    838804 =C2=B1  2%     +12.2%     941216 =C2=B1  1%  slabinfo.radix_tree=
_node.active_objs
     15101 =C2=B1  2%     +12.6%      16999 =C2=B1  1%  slabinfo.radix_tree=
_node.active_slabs
    845689 =C2=B1  2%     +12.6%     951997 =C2=B1  1%  slabinfo.radix_tree=
_node.num_objs
     15101 =C2=B1  2%     +12.6%      16999 =C2=B1  1%  slabinfo.radix_tree=
_node.num_slabs
     58.13 =C2=B1  5%      -6.4%      54.39 =C2=B1  4%  turbostat.%Busy
    697.67 =C2=B1  5%      -6.5%     652.33 =C2=B1  4%  turbostat.Avg_MHz
     28.10 =C2=B1  7%      +9.6%      30.81 =C2=B1  5%  turbostat.CPU%c6
     17.67 =C2=B1  8%     +12.4%      19.86 =C2=B1  6%  turbostat.Pkg%pc2
    124.17 =C2=B1  1%      -1.9%     121.83 =C2=B1  1%  turbostat.PkgWatt
  53777848 =C2=B1 31%     +41.2%   75939221 =C2=B1 19%  cpuidle.C1-HSW.time
    119888 =C2=B1 12%     +23.2%     147684 =C2=B1  7%  cpuidle.C1E-HSW.usa=
ge
  51609995 =C2=B1  2%     +11.1%   57338896 =C2=B1  5%  cpuidle.C3-HSW.time
 2.895e+10 =C2=B1 12%     +17.2%  3.392e+10 =C2=B1 10%  cpuidle.C6-HSW.time
  30211909 =C2=B1 12%     +17.1%   35368627 =C2=B1  9%  cpuidle.C6-HSW.usage
     20912 =C2=B1 33%     +44.4%      30196 =C2=B1 24%  cpuidle.POLL.usage
      4381 =C2=B1  6%    +804.5%      39633 =C2=B1 27%  latency_stats.max.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault
      1296 =C2=B1 14%   +1387.3%      19285 =C2=B1 13%  latency_stats.max.c=
all_rwsem_down_write_failed_killable.SyS_mprotect.entry_SYSCALL_64_fastpath
      1360 =C2=B1  1%   +2784.4%      39246 =C2=B1 28%  latency_stats.max.c=
all_rwsem_down_write_failed_killable.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.=
entry_SYSCALL_64_fastpath
     85887 =C2=B1  9%    +161.7%     224726 =C2=B1 26%  latency_stats.sum.c=
all_rwsem_down_write_failed_killable.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.=
entry_SYSCALL_64_fastpath
     16064 =C2=B1 47%    +729.7%     133283 =C2=B1116%  latency_stats.sum.d=
own.console_lock.console_device.tty_open.chrdev_open.do_dentry_open.vfs_ope=
n.path_openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
     96.33 =C2=B1107%  +28900.7%      27937 =C2=B1 17%  latency_stats.sum.s=
top_two_cpus.migrate_swap.task_numa_migrate.numa_migrate_preferred.task_num=
a_fault.do_huge_pmd_numa_page.handle_mm_fault.__do_page_fault.do_page_fault=
.page_fault
     48184 =C2=B1 21%     -87.5%       6011 =C2=B1 46%  latency_stats.sum.s=
top_two_cpus.migrate_swap.task_numa_migrate.numa_migrate_preferred.task_num=
a_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      1.89 =C2=B1  2%      +3.3%       1.96 =C2=B1  2%  perf-stat.branch-mi=
ss-rate
   5031519 =C2=B1 19%     +34.2%    6750057 =C2=B1 14%  perf-stat.context-s=
witches
 5.336e+09 =C2=B1  8%     +19.8%   6.39e+09 =C2=B1 11%  perf-stat.dTLB-load=
-misses
 2.922e+08 =C2=B1 26%     +41.0%  4.119e+08 =C2=B1 13%  perf-stat.dTLB-stor=
e-misses
  2.82e+11 =C2=B1  9%     +16.2%  3.275e+11 =C2=B1  9%  perf-stat.dTLB-stor=
es
 4.347e+08 =C2=B1  6%     +12.2%  4.878e+08 =C2=B1  8%  perf-stat.iTLB-load=
-misses
      3764 =C2=B1  1%      -4.2%       3605 =C2=B1  1%  perf-stat.instructi=
ons-per-iTLB-miss
      1.14 =C2=B1  7%     +10.0%       1.25 =C2=B1  3%  perf-profile.cycles=
-pp.alloc_set_pte.filemap_map_pages.handle_mm_fault.__do_page_fault.do_page=
_fault
      1.58 =C2=B1 13%     -23.5%       1.21 =C2=B1 11%  perf-profile.cycles=
-pp.call_cpuidle.cpu_startup_entry.start_secondary
      1.57 =C2=B1 13%     -23.3%       1.21 =C2=B1 11%  perf-profile.cycles=
-pp.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_secondary
      1.57 =C2=B1 13%     -23.4%       1.20 =C2=B1 11%  perf-profile.cycles=
-pp.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_=
secondary
      1.56 =C2=B1 13%     -23.5%       1.20 =C2=B1 11%  perf-profile.cycles=
-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_e=
ntry
      2.50 =C2=B1 35%     -39.7%       1.51 =C2=B1  5%  perf-profile.cycles=
-pp.radix_tree_next_chunk.filemap_map_pages.handle_mm_fault.__do_page_fault=
.do_page_fault
      1.38 =C2=B1  2%     +19.4%       1.64 =C2=B1  5%  perf-profile.cycles=
-pp.unlock_page.filemap_map_pages.handle_mm_fault.__do_page_fault.do_page_f=
ault
      4.52 =C2=B1  7%     +13.2%       5.12 =C2=B1  7%  perf-profile.func.c=
ycles-pp.__do_page_fault
      1.57 =C2=B1 13%     -22.5%       1.22 =C2=B1 11%  perf-profile.func.c=
ycles-pp.intel_idle
      2.51 =C2=B1 35%     -39.6%       1.51 =C2=B1  5%  perf-profile.func.c=
ycles-pp.radix_tree_next_chunk
      1.15 =C2=B1  2%     +17.1%       1.35 =C2=B1  2%  perf-profile.func.c=
ycles-pp.unlock_page
     10850 =C2=B1 14%   +8227.4%     903577 =C2=B1 38%  numa-vmstat.node0.n=
r_active_anon
      2176 =C2=B1 38%    +367.8%      10182 =C2=B1 14%  numa-vmstat.node0.n=
r_anon_pages
     66676 =C2=B1 42%   +2339.4%    1626473 =C2=B1 35%  numa-vmstat.node0.n=
r_file_pages
     26629 =C2=B1102%   +2535.0%     701677 =C2=B1 38%  numa-vmstat.node0.n=
r_inactive_anon
     11618 =C2=B1 48%  +11166.1%    1308898 =C2=B1 37%  numa-vmstat.node0.n=
r_mapped
     35359 =C2=B1 79%   +4411.2%    1595158 =C2=B1 36%  numa-vmstat.node0.n=
r_shmem
      6574 =C2=B1 13%    +717.9%      53768 =C2=B1 48%  numa-vmstat.node0.n=
r_slab_reclaimable
   4237359 =C2=B1  1%     +50.3%    6368198 =C2=B1 12%  numa-vmstat.node0.n=
uma_hit
   4237359 =C2=B1  1%     +50.3%    6368197 =C2=B1 12%  numa-vmstat.node0.n=
uma_local
      2535 =C2=B1 41%    +274.2%       9485 =C2=B1  3%  numa-vmstat.node1.n=
r_anon_pages
      2171 =C2=B1 37%    +379.1%      10404 =C2=B1 12%  numa-vmstat.node2.n=
r_anon_pages
      3820 =C2=B1 28%    +150.0%       9551 =C2=B1 13%  numa-vmstat.node3.n=
r_anon_pages
      1.33 =C2=B1 35%    -100.0%       0.00 =C2=B1  0%  numa-vmstat.node3.n=
uma_other
     11.41 =C2=B1 16%     +53.1%      17.47 =C2=B1 11%  sched_debug.cfs_rq:=
/.nr_spread_over.max
      1.07 =C2=B1 10%     +49.5%       1.60 =C2=B1  4%  sched_debug.cfs_rq:=
/.nr_spread_over.stddev
   -250444 =C2=B1-49%    -310.3%     526574 =C2=B1 32%  sched_debug.cfs_rq:=
/.spread0.avg
    540891 =C2=B1 15%    +149.0%    1346786 =C2=B1 13%  sched_debug.cfs_rq:=
/.spread0.max
  -2435794 =C2=B1-38%     -78.7%    -517627 =C2=B1-39%  sched_debug.cfs_rq:=
/.spread0.min
   2894052 =C2=B1 34%     -37.3%    1813439 =C2=B1 19%  sched_debug.cpu.avg=
_idle.max
      7480 =C2=B1 13%     +34.7%      10076 =C2=B1 11%  sched_debug.cpu.cur=
r->pid.max
    717.88 =C2=B1  9%     +31.8%     946.21 =C2=B1 10%  sched_debug.cpu.cur=
r->pid.stddev
      0.57 =C2=B1  4%      -6.8%       0.53 =C2=B1  7%  sched_debug.cpu.nr_=
running.avg
     26154 =C2=B1 20%     +37.1%      35853 =C2=B1 17%  sched_debug.cpu.nr_=
switches.avg
    114.34 =C2=B1 20%     +44.1%     164.81 =C2=B1 18%  sched_debug.cpu.nr_=
uninterruptible.max
     27422 =C2=B1 19%     +35.2%      37086 =C2=B1 16%  sched_debug.cpu.sch=
ed_count.avg
     10181 =C2=B1 26%     +45.8%      14845 =C2=B1 23%  sched_debug.cpu.sch=
ed_goidle.avg
     13214 =C2=B1 22%     +38.9%      18349 =C2=B1 17%  sched_debug.cpu.ttw=
u_count.avg
     50734 =C2=B1 16%     +20.0%      60878 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.max
     49950 =C2=B1 12%   +7032.4%    3562633 =C2=B1 38%  numa-meminfo.node0.=
Active
     42950 =C2=B1 14%   +8177.8%    3555332 =C2=B1 38%  numa-meminfo.node0.=
Active(anon)
      3891 =C2=B1 75%    +784.1%      34401 =C2=B1 19%  numa-meminfo.node0.=
AnonHugePages
      8729 =C2=B1 37%    +371.5%      41161 =C2=B1 14%  numa-meminfo.node0.=
AnonPages
    266549 =C2=B1 42%   +2327.8%    6471326 =C2=B1 35%  numa-meminfo.node0.=
FilePages
    225100 =C2=B1 48%   +1210.3%    2949477 =C2=B1 37%  numa-meminfo.node0.=
Inactive
    106834 =C2=B1102%   +2550.4%    2831519 =C2=B1 38%  numa-meminfo.node0.=
Inactive(anon)
     46397 =C2=B1 48%  +11142.4%    5216201 =C2=B1 37%  numa-meminfo.node0.=
Mapped
  16087217 =C2=B1  1%     +40.2%   22561797 =C2=B1 10%  numa-meminfo.node0.=
MemUsed
     26298 =C2=B1 13%    +716.8%     214805 =C2=B1 48%  numa-meminfo.node0.=
SReclaimable
    141283 =C2=B1 80%   +4391.7%    6346066 =C2=B1 36%  numa-meminfo.node0.=
Shmem
     70054 =C2=B1  7%    +272.7%     261076 =C2=B1 38%  numa-meminfo.node0.=
Slab
      5637 =C2=B1 68%    +491.8%      33364 =C2=B1  3%  numa-meminfo.node1.=
AnonHugePages
     10152 =C2=B1 41%    +278.0%      38372 =C2=B1  4%  numa-meminfo.node1.=
AnonPages
      2605 =C2=B1 62%   +1292.3%      36268 =C2=B1 13%  numa-meminfo.node2.=
AnonHugePages
      8703 =C2=B1 37%    +384.3%      42147 =C2=B1 12%  numa-meminfo.node2.=
AnonPages
      8520 =C2=B1 43%    +295.3%      33678 =C2=B1 17%  numa-meminfo.node3.=
AnonHugePages
     15289 =C2=B1 28%    +153.0%      38686 =C2=B1 13%  numa-meminfo.node3.=
AnonPages
   1350786 =C2=B1 12%     +94.8%    2630698 =C2=B1 13%  proc-vmstat.nr_acti=
ve_anon
     10719 =C2=B1  2%    +274.3%      40123 =C2=B1  4%  proc-vmstat.nr_anon=
_pages
   2398874 =C2=B1  7%     +93.6%    4643328 =C2=B1 10%  proc-vmstat.nr_file=
_pages
    933039 =C2=B1  1%    +106.5%    1927023 =C2=B1  7%  proc-vmstat.nr_inac=
tive_anon
   2130483 =C2=B1  8%     +72.3%    3671722 =C2=B1 12%  proc-vmstat.nr_mapp=
ed
   2273394 =C2=B1  7%     +98.7%    4517832 =C2=B1 11%  proc-vmstat.nr_shmem
    136866 =C2=B1  2%     +11.2%     152260 =C2=B1  1%  proc-vmstat.nr_slab=
_reclaimable
  22001919 =C2=B1  1%     +16.8%   25708975 =C2=B1  3%  proc-vmstat.numa_hit
    545.33 =C2=B1 69%  +10112.3%      55691 =C2=B1  0%  proc-vmstat.numa_hu=
ge_pte_updates
  22001915 =C2=B1  1%     +16.8%   25708971 =C2=B1  3%  proc-vmstat.numa_lo=
cal
      7627 =C2=B1 61%   +8440.7%     651455 =C2=B1 19%  proc-vmstat.numa_pa=
ges_migrated
    345336 =C2=B1 55%   +8160.0%   28524605 =C2=B1  0%  proc-vmstat.numa_pt=
e_updates
   3147854 =C2=B1  5%     +97.3%    6210234 =C2=B1  9%  proc-vmstat.pgactiv=
ate
    116038 =C2=B1  5%     +25.3%     145341 =C2=B1 11%  proc-vmstat.pgalloc=
_dma32
  22120200 =C2=B1  1%     +19.8%   26508050 =C2=B1  3%  proc-vmstat.pgalloc=
_normal
  21964870 =C2=B1  2%     +19.0%   26129865 =C2=B1  3%  proc-vmstat.pgfree
      7627 =C2=B1 61%   +8440.7%     651455 =C2=B1 19%  proc-vmstat.pgmigra=
te_success
     19.33 =C2=B1 51%   +7087.9%       1389 =C2=B1 17%  proc-vmstat.thp_def=
erred_split_page

Thanks,
Xiaolong

>
>--
> Kirill A. Shutemov

--===============6614234138143273442==--

