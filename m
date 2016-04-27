Content-Type: multipart/mixed; boundary="===============3031362284528753283=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [mm, oom] faad2185f4: vm-scalability.throughput -11.8% regression
Date: Wed, 27 Apr 2016 11:15:56 +0800
Message-ID: <20160427031556.GD29014@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============3031362284528753283==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed vm-scalability.throughput -11.8% regression with the follow=
ing commit:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit faad2185f482578d50d363746006a1b95dde9d0a ("mm, oom: rework oom detec=
tion")

on test machine: lkp-hsw-ep2: 72 threads Brickland Haswell-EP with 128G mem=
ory


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/nr_pmem/nr_task/rootfs/tbox_group/test/te=
stcase/thp_defrag/thp_enabled:
  gcc-4.9/performance/x86_64-rhel-pmem/1/16/debian-x86_64-2015-02-07.cgz/lk=
p-hsw-ep2/swap-w-rand/vm-scalability/never/never

commit: =

  0da9597ac9c0adb8a521b9935fbe43d8b0e8cc64
  faad2185f482578d50d363746006a1b95dde9d0a

0da9597ac9c0adb8 faad2185f482578d50d3637460 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
         %stddev     %change         %stddev
             \          |                \  =

     43802 =C2=B1  0%     -11.8%      38653 =C2=B1  0%  vm-scalability.thro=
ughput
    310.35 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  vm-scalability.time=
.elapsed_time
    310.35 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  vm-scalability.time=
.elapsed_time.max
    234551 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  vm-scalability.time=
.involuntary_context_switches
  44654748 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  vm-scalability.time=
.major_page_faults
   2442686 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  vm-scalability.time=
.maximum_resident_set_size
  34477365 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  vm-scalability.time=
.minor_page_faults
      4096 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  vm-scalability.time=
.page_size
      1595 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  vm-scalability.time=
.percent_of_cpu_this_job_got
      4935 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  vm-scalability.time=
.system_time
     19.08 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  vm-scalability.time=
.user_time
    342.89 =C2=B1  0%     -71.7%      96.99 =C2=B1 -1%  uptime.boot
     18719 =C2=B1  1%     -70.3%       5555 =C2=B1  0%  uptime.idle
    227271 =C2=B1  3%     -68.0%      72623 =C2=B1  0%  softirqs.RCU
    208173 =C2=B1  7%     -69.7%      63118 =C2=B1  0%  softirqs.SCHED
   3204631 =C2=B1  1%     -73.0%     866292 =C2=B1  0%  softirqs.TIMER
    739.50 =C2=B1  0%      -1.6%     728.00 =C2=B1  0%  turbostat.Avg_MHz
     61.50 =C2=B1  3%     +20.3%      74.00 =C2=B1 -1%  turbostat.CoreTmp
      0.07 =C2=B1 57%   +1092.7%       0.82 =C2=B1-121%  turbostat.Pkg%pc2
     64.75 =C2=B1  2%     +14.3%      74.00 =C2=B1 -1%  turbostat.PkgTmp
     51.45 =C2=B1  0%      +1.8%      52.39 =C2=B1 -1%  turbostat.RAMWatt
    789322 =C2=B1  4%     +49.2%    1177649 =C2=B1  0%  vmstat.memory.free
  53141272 =C2=B1  1%     -45.8%   28781900 =C2=B1  0%  vmstat.memory.swpd
      0.00 =C2=B1  0%      +Inf%       1.00 =C2=B1-100%  vmstat.procs.b
    780938 =C2=B1  7%     +66.2%    1297589 =C2=B1  0%  vmstat.swap.so
      4217 =C2=B1  6%    +103.4%       8576 =C2=B1  0%  vmstat.system.cs
    204460 =C2=B1  6%     +62.0%     331270 =C2=B1  0%  vmstat.system.in
   9128034 =C2=B1 43%     -85.7%    1306182 =C2=B1  0%  cpuidle.C1E-HSW.time
      5009 =C2=B1 52%     -88.9%     557.00 =C2=B1  0%  cpuidle.C1E-HSW.usa=
ge
      9110 =C2=B1130%     -93.3%     611.00 =C2=B1  0%  cpuidle.C3-HSW.usage
 1.655e+10 =C2=B1  0%     -79.5%  3.397e+09 =C2=B1  0%  cpuidle.C6-HSW.time
    621881 =C2=B1  2%     -71.5%     177398 =C2=B1  0%  cpuidle.C6-HSW.usage
  53981965 =C2=B1 58%     -80.4%   10553789 =C2=B1  0%  cpuidle.POLL.time
     85773 =C2=B1  9%     -18.4%      69982 =C2=B1  0%  cpuidle.POLL.usage
   2925199 =C2=B1 94%     -75.8%     706866 =C2=B1  0%  numa-numastat.node0=
.local_node
   2931002 =C2=B1 93%     -75.6%     716120 =C2=B1  0%  numa-numastat.node0=
.numa_hit
  12041792 =C2=B1 24%     -67.4%    3919657 =C2=B1  0%  numa-numastat.node0=
.numa_miss
  12047595 =C2=B1 24%     -67.4%    3928911 =C2=B1  0%  numa-numastat.node0=
.other_node
  64592910 =C2=B1 10%     -66.5%   21635175 =C2=B1  0%  numa-numastat.node1=
.local_node
  12041716 =C2=B1 24%     -67.5%    3919210 =C2=B1  0%  numa-numastat.node1=
.numa_foreign
  64601023 =C2=B1 10%     -66.5%   21639833 =C2=B1  0%  numa-numastat.node1=
.numa_hit
      4730 =C2=B1 13%    +290.9%      18491 =C2=B1  0%  meminfo.Inactive(fi=
le)
     12978 =C2=B1  8%     +46.3%      18985 =C2=B1  0%  meminfo.Mapped
    703327 =C2=B1  9%     +72.4%    1212584 =C2=B1  0%  meminfo.MemAvailable
    732344 =C2=B1  8%     +65.0%    1208500 =C2=B1  0%  meminfo.MemFree
     99286 =C2=B1  4%     +30.3%     129348 =C2=B1  0%  meminfo.SReclaimable
      3920 =C2=B1 21%    +332.5%      16955 =C2=B1  0%  meminfo.Shmem
    206164 =C2=B1  2%     +14.7%     236528 =C2=B1  0%  meminfo.Slab
      1113 =C2=B1 10%     +23.6%       1377 =C2=B1  0%  meminfo.SwapCached
  47130509 =C2=B1  3%     +53.1%   72150055 =C2=B1  0%  meminfo.SwapFree
      1012 =C2=B1 12%     +60.9%       1628 =C2=B1  0%  slabinfo.blkdev_req=
uests.active_objs
      1012 =C2=B1 12%     +60.9%       1628 =C2=B1  0%  slabinfo.blkdev_req=
uests.num_objs
      1531 =C2=B1  5%     +12.5%       1722 =C2=B1  0%  slabinfo.mnt_cache.=
active_objs
      1531 =C2=B1  5%     +12.5%       1722 =C2=B1  0%  slabinfo.mnt_cache.=
num_objs
      9719 =C2=B1  9%     -16.8%       8087 =C2=B1  0%  slabinfo.proc_inode=
_cache.num_objs
     92960 =C2=B1  6%     +69.6%     157683 =C2=B1  0%  slabinfo.radix_tree=
_node.active_objs
      9336 =C2=B1  9%     +35.2%      12624 =C2=B1  0%  slabinfo.radix_tree=
_node.active_slabs
     95203 =C2=B1  6%     +66.0%     158075 =C2=B1  0%  slabinfo.radix_tree=
_node.num_objs
      9336 =C2=B1  9%     +35.2%      12624 =C2=B1  0%  slabinfo.radix_tree=
_node.num_slabs
    310.35 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  time.elapsed_time
    310.35 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  time.elapsed_time.m=
ax
    600.00 =C2=B1 27%    -100.0%       0.00 =C2=B1 -1%  time.file_system_in=
puts
    234551 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  time.involuntary_co=
ntext_switches
  44654748 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  time.major_page_fau=
lts
   2442686 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  time.maximum_reside=
nt_set_size
  34477365 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  time.minor_page_fau=
lts
      4096 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  time.page_size
      1595 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  time.percent_of_cpu=
_this_job_got
      4935 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  time.system_time
     19.08 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  time.user_time
    390.50 =C2=B1 34%    -100.0%       0.00 =C2=B1 -1%  time.voluntary_cont=
ext_switches
    914507 =C2=B1  7%     -13.3%     792912 =C2=B1  0%  numa-meminfo.node0.=
Active
    913915 =C2=B1  7%     -13.5%     790259 =C2=B1  0%  numa-meminfo.node0.=
Active(anon)
    592.00 =C2=B1 31%    +348.1%       2653 =C2=B1  0%  numa-meminfo.node0.=
Active(file)
   1217059 =C2=B1  7%     -13.7%    1049893 =C2=B1  0%  numa-meminfo.node0.=
AnonPages
    306384 =C2=B1  7%     -12.0%     269631 =C2=B1  0%  numa-meminfo.node0.=
Inactive
    304389 =C2=B1  7%     -14.4%     260426 =C2=B1  0%  numa-meminfo.node0.=
Inactive(anon)
      1995 =C2=B1  8%    +361.3%       9204 =C2=B1  0%  numa-meminfo.node0.=
Inactive(file)
      5801 =C2=B1  4%     +16.7%       6772 =C2=B1  0%  numa-meminfo.node0.=
Mapped
     32196 =C2=B1  7%     +36.4%      43932 =C2=B1  0%  numa-meminfo.node0.=
MemFree
     55651 =C2=B1  5%     +10.6%      61563 =C2=B1  0%  numa-meminfo.node0.=
SUnreclaim
      2966 =C2=B1 15%    +232.9%       9875 =C2=B1  0%  numa-meminfo.node1.=
Inactive(file)
      7446 =C2=B1 13%     +67.7%      12486 =C2=B1  0%  numa-meminfo.node1.=
Mapped
    679948 =C2=B1  6%     +76.7%    1201231 =C2=B1  0%  numa-meminfo.node1.=
MemFree
     66811 =C2=B1  7%     +48.5%      99246 =C2=B1  0%  numa-meminfo.node1.=
SReclaimable
     51227 =C2=B1  5%     -11.0%      45616 =C2=B1  0%  numa-meminfo.node1.=
SUnreclaim
      3090 =C2=B1 39%    +415.6%      15932 =C2=B1  0%  numa-meminfo.node1.=
Shmem
    118039 =C2=B1  3%     +22.7%     144863 =C2=B1  0%  numa-meminfo.node1.=
Slab
      0.00 =C2=B1 -1%      +Inf%       1.58 =C2=B1-63%  perf-profile.cycles=
-pp.__alloc_pages_slowpath.constprop.93.__alloc_pages_nodemask.alloc_kmem_p=
ages_node.copy_process._do_fork
      0.00 =C2=B1 -1%      +Inf%      26.40 =C2=B1 -3%  perf-profile.cycles=
-pp.__alloc_pages_slowpath.constprop.93.__alloc_pages_nodemask.alloc_pages_=
vma.__read_swap_cache_async.read_swap_cache_async
      0.00 =C2=B1 -1%      +Inf%      39.64 =C2=B1 -2%  perf-profile.cycles=
-pp.__alloc_pages_slowpath.constprop.93.__alloc_pages_nodemask.alloc_pages_=
vma.handle_mm_fault.__do_page_fault
      5.20 =C2=B1140%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.do_try_to_free_pages.try_to_free_pages.__alloc_pages_nodemask.alloc_kme=
m_pages_node.copy_process
     25.02 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.do_try_to_free_pages.try_to_free_pages.__alloc_pages_nodemask.alloc_pag=
es_vma.__read_swap_cache_async
     38.03 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.do_try_to_free_pages.try_to_free_pages.__alloc_pages_nodemask.alloc_pag=
es_vma.handle_mm_fault
      0.00 =C2=B1 -1%      +Inf%       1.59 =C2=B1-62%  perf-profile.cycles=
-pp.do_try_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_p=
ages_nodemask.alloc_kmem_pages_node
      0.00 =C2=B1 -1%      +Inf%      65.24 =C2=B1 -1%  perf-profile.cycles=
-pp.do_try_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_p=
ages_nodemask.alloc_pages_vma
      5.20 =C2=B1140%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.shrink_zone.do_try_to_free_pages.try_to_free_pages.__alloc_pages_nodema=
sk.alloc_kmem_pages_node
     63.09 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.shrink_zone.do_try_to_free_pages.try_to_free_pages.__alloc_pages_nodema=
sk.alloc_pages_vma
      0.00 =C2=B1 -1%      +Inf%      67.08 =C2=B1 -1%  perf-profile.cycles=
-pp.shrink_zone.do_try_to_free_pages.try_to_free_pages.__alloc_pages_slowpa=
th.__alloc_pages_nodemask
     69.00 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.shrink_zone_memcg.shrink_zone.do_try_to_free_pages.try_to_free_pages.__=
alloc_pages_nodemask
      0.00 =C2=B1 -1%      +Inf%      66.87 =C2=B1 -1%  perf-profile.cycles=
-pp.shrink_zone_memcg.shrink_zone.do_try_to_free_pages.try_to_free_pages.__=
alloc_pages_slowpath
      5.20 =C2=B1140%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.try_to_free_pages.__alloc_pages_nodemask.alloc_kmem_pages_node.copy_pro=
cess._do_fork
     25.05 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.try_to_free_pages.__alloc_pages_nodemask.alloc_pages_vma.__read_swap_ca=
che_async.read_swap_cache_async
     38.06 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.try_to_free_pages.__alloc_pages_nodemask.alloc_pages_vma.handle_mm_faul=
t.__do_page_fault
      0.00 =C2=B1 -1%      +Inf%       1.59 =C2=B1-62%  perf-profile.cycles=
-pp.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodemask.alloc_k=
mem_pages_node.copy_process
      0.00 =C2=B1 -1%      +Inf%      26.22 =C2=B1 -3%  perf-profile.cycles=
-pp.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodemask.alloc_p=
ages_vma.__read_swap_cache_async
      0.00 =C2=B1 -1%      +Inf%      39.01 =C2=B1 -2%  perf-profile.cycles=
-pp.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodemask.alloc_p=
ages_vma.handle_mm_fault
    228466 =C2=B1  7%     -13.4%     197776 =C2=B1  0%  numa-vmstat.node0.n=
r_active_anon
    147.50 =C2=B1 31%    +334.6%     641.00 =C2=B1  0%  numa-vmstat.node0.n=
r_active_file
    304255 =C2=B1  7%     -13.6%     262822 =C2=B1  0%  numa-vmstat.node0.n=
r_anon_pages
      8062 =C2=B1  8%     +34.3%      10829 =C2=B1  0%  numa-vmstat.node0.n=
r_free_pages
     76095 =C2=B1  7%     -14.3%      65250 =C2=B1  0%  numa-vmstat.node0.n=
r_inactive_anon
    498.00 =C2=B1  8%    +347.8%       2230 =C2=B1  0%  numa-vmstat.node0.n=
r_inactive_file
      1466 =C2=B1  5%     +15.0%       1686 =C2=B1  0%  numa-vmstat.node0.n=
r_mapped
     13912 =C2=B1  5%     +10.6%      15390 =C2=B1  0%  numa-vmstat.node0.n=
r_slab_unreclaimable
   7585474 =C2=B1  5%     -73.6%    2005989 =C2=B1  0%  numa-vmstat.node0.n=
r_vmscan_write
   7585495 =C2=B1  5%     -73.6%    2006038 =C2=B1  0%  numa-vmstat.node0.n=
r_written
   2042806 =C2=B1 73%     -60.3%     810553 =C2=B1  0%  numa-vmstat.node0.n=
uma_hit
   1973969 =C2=B1 76%     -62.6%     737625 =C2=B1  0%  numa-vmstat.node0.n=
uma_local
   6640606 =C2=B1 22%     -72.4%    1834872 =C2=B1  0%  numa-vmstat.node0.n=
uma_miss
   6709443 =C2=B1 22%     -71.6%    1907800 =C2=B1  0%  numa-vmstat.node0.n=
uma_other
    169806 =C2=B1  5%     +71.9%     291868 =C2=B1  0%  numa-vmstat.node1.n=
r_free_pages
    740.75 =C2=B1 15%    +223.1%       2393 =C2=B1  0%  numa-vmstat.node1.n=
r_inactive_file
      1860 =C2=B1 13%     +69.4%       3153 =C2=B1  0%  numa-vmstat.node1.n=
r_mapped
    767.88 =C2=B1 39%    +415.4%       3958 =C2=B1  0%  numa-vmstat.node1.n=
r_shmem
     16698 =C2=B1  7%     +46.9%      24534 =C2=B1  0%  numa-vmstat.node1.n=
r_slab_reclaimable
     12806 =C2=B1  5%     -10.9%      11405 =C2=B1  0%  numa-vmstat.node1.n=
r_slab_unreclaimable
  27889038 =C2=B1  6%     -68.4%    8818477 =C2=B1  0%  numa-vmstat.node1.n=
r_vmscan_write
  27889106 =C2=B1  6%     -68.4%    8818479 =C2=B1  0%  numa-vmstat.node1.n=
r_written
   6640458 =C2=B1 22%     -72.4%    1834609 =C2=B1  0%  numa-vmstat.node1.n=
uma_foreign
  38283180 =C2=B1  9%     -71.4%   10962630 =C2=B1  0%  numa-vmstat.node1.n=
uma_hit
  38265243 =C2=B1  9%     -71.4%   10948754 =C2=B1  0%  numa-vmstat.node1.n=
uma_local
    539498 =C2=B1  6%     -66.2%     182224 =C2=B1  0%  proc-vmstat.allocst=
all
    144.38 =C2=B1 22%     -96.5%       5.00 =C2=B1-20%  proc-vmstat.compact=
_fail
  15889726 =C2=B1 25%     -87.2%    2027142 =C2=B1  0%  proc-vmstat.compact=
_free_scanned
      7424 =C2=B1 21%     -95.5%     337.00 =C2=B1  0%  proc-vmstat.compact=
_isolated
     18421 =C2=B1120%     -98.3%     310.00 =C2=B1  0%  proc-vmstat.compact=
_migrate_scanned
    192.00 =C2=B1 21%     -96.4%       7.00 =C2=B1-14%  proc-vmstat.compact=
_stall
     49525 =C2=B1 43%    +154.6%     126090 =C2=B1  0%  proc-vmstat.kswapd_=
low_wmark_hit_quickly
     17344 =C2=B1  4%     +73.0%      30013 =C2=B1  0%  proc-vmstat.nr_dirt=
y_background_threshold
     34690 =C2=B1  4%     +73.0%      60026 =C2=B1  0%  proc-vmstat.nr_dirt=
y_threshold
    180484 =C2=B1  4%     +67.9%     303083 =C2=B1  0%  proc-vmstat.nr_free=
_pages
      1227 =C2=B1 10%    +276.8%       4623 =C2=B1  0%  proc-vmstat.nr_inac=
tive_file
      3303 =C2=B1  6%     +43.0%       4722 =C2=B1  0%  proc-vmstat.nr_mapp=
ed
      1012 =C2=B1 17%    +321.7%       4270 =C2=B1  0%  proc-vmstat.nr_shmem
     24900 =C2=B1  4%     +29.6%      32265 =C2=B1  0%  proc-vmstat.nr_slab=
_reclaimable
  35587470 =C2=B1  5%     -69.7%   10775004 =C2=B1  0%  proc-vmstat.nr_vmsc=
an_write
  61007414 =C2=B1  6%     -65.6%   21016129 =C2=B1  0%  proc-vmstat.nr_writ=
ten
  16970144 =C2=B1 12%     -37.0%   10686065 =C2=B1  0%  proc-vmstat.numa_fo=
reign
  10074000 =C2=B1  1%     -45.2%    5519749 =C2=B1  0%  proc-vmstat.numa_hi=
nt_faults
   9673661 =C2=B1  5%     -44.4%    5377833 =C2=B1  0%  proc-vmstat.numa_hi=
nt_faults_local
  67528367 =C2=B1  6%     -67.0%   22278204 =C2=B1  0%  proc-vmstat.numa_hit
  67514451 =C2=B1  6%     -67.0%   22264292 =C2=B1  0%  proc-vmstat.numa_lo=
cal
  16969897 =C2=B1 12%     -37.0%   10686272 =C2=B1  0%  proc-vmstat.numa_mi=
ss
  16983813 =C2=B1 12%     -37.0%   10700184 =C2=B1  0%  proc-vmstat.numa_ot=
her
  41943046 =C2=B1  1%     -43.9%   23535513 =C2=B1  0%  proc-vmstat.numa_pt=
e_updates
     49539 =C2=B1 43%    +154.5%     126102 =C2=B1  0%  proc-vmstat.pageout=
run
  45300466 =C2=B1  9%     -79.2%    9418945 =C2=B1  0%  proc-vmstat.pgactiv=
ate
    558557 =C2=B1 14%     -34.1%     367818 =C2=B1  0%  proc-vmstat.pgalloc=
_dma
  14967174 =C2=B1  3%     -69.1%    4626484 =C2=B1  0%  proc-vmstat.pgalloc=
_dma32
  71037855 =C2=B1  7%     -57.6%   30119030 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
  62292933 =C2=B1  6%     -65.2%   21706559 =C2=B1  0%  proc-vmstat.pgdeact=
ivate
  79824509 =C2=B1  5%     -56.2%   34976920 =C2=B1  0%  proc-vmstat.pgfault
  86163698 =C2=B1  6%     -68.5%   27162999 =C2=B1  0%  proc-vmstat.pgfree
  44685673 =C2=B1  9%     -79.4%    9192073 =C2=B1  0%  proc-vmstat.pgmajfa=
ult
  13765509 =C2=B1  7%     -69.7%    4168976 =C2=B1  0%  proc-vmstat.pgrefil=
l_dma32
  48547731 =C2=B1  6%     -63.8%   17561899 =C2=B1  0%  proc-vmstat.pgrefil=
l_normal
  12122138 =C2=B1  7%     -69.7%    3675632 =C2=B1  0%  proc-vmstat.pgscan_=
direct_dma32
  67953310 =C2=B1  7%     -66.4%   22842830 =C2=B1  0%  proc-vmstat.pgscan_=
direct_normal
  11915527 =C2=B1 10%     -79.3%    2460668 =C2=B1  0%  proc-vmstat.pgscan_=
kswapd_dma32
  15559179 =C2=B1  9%     -80.7%    2995996 =C2=B1  0%  proc-vmstat.pgscan_=
kswapd_normal
   8844259 =C2=B1  8%     -70.8%    2582588 =C2=B1  0%  proc-vmstat.pgsteal=
_direct_dma32
  43061102 =C2=B1  7%     -64.0%   15515081 =C2=B1  0%  proc-vmstat.pgsteal=
_direct_normal
   4732303 =C2=B1  6%     -69.0%    1469200 =C2=B1  0%  proc-vmstat.pgsteal=
_kswapd_dma32
   4380170 =C2=B1  7%     -66.6%    1462100 =C2=B1  0%  proc-vmstat.pgsteal=
_kswapd_normal
  44709819 =C2=B1  9%     -79.4%    9217280 =C2=B1  0%  proc-vmstat.pswpin
  61007674 =C2=B1  6%     -65.6%   21016726 =C2=B1  0%  proc-vmstat.pswpout
     37.61 =C2=B1  8%     -39.3%      22.83 =C2=B1 -4%  sched_debug.cfs_rq:=
/.load.avg
    884.52 =C2=B1  5%     -36.7%     559.50 =C2=B1  0%  sched_debug.cfs_rq:=
/.load.max
    146.88 =C2=B1  5%     -38.3%      90.64 =C2=B1 -1%  sched_debug.cfs_rq:=
/.load.stddev
     47.93 =C2=B1  5%     +28.5%      61.60 =C2=B1 -1%  sched_debug.cfs_rq:=
/.load_avg.avg
      1095 =C2=B1 10%     +52.2%       1667 =C2=B1  0%  sched_debug.cfs_rq:=
/.load_avg.max
    170.96 =C2=B1  7%     +39.6%     238.66 =C2=B1  0%  sched_debug.cfs_rq:=
/.load_avg.stddev
    578829 =C2=B1  2%     -80.5%     112739 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.avg
   2507544 =C2=B1  0%     -80.8%     482665 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.max
    998179 =C2=B1  1%     -82.2%     177613 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      0.24 =C2=B1  2%     -37.1%       0.15 =C2=B1-654%  sched_debug.cfs_rq=
:/.nr_running.avg
      0.41 =C2=B1  1%     -22.1%       0.32 =C2=B1-312%  sched_debug.cfs_rq=
:/.nr_running.stddev
     34.69 =C2=B1  0%     -38.3%      21.40 =C2=B1 -4%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
    849.33 =C2=B1  0%     -37.9%     527.50 =C2=B1  0%  sched_debug.cfs_rq:=
/.runnable_load_avg.max
    138.61 =C2=B1  0%     -38.4%      85.43 =C2=B1 -1%  sched_debug.cfs_rq:=
/.runnable_load_avg.stddev
    444145 =C2=B1 30%     -87.1%      57376 =C2=B1  0%  sched_debug.cfs_rq:=
/.spread0.avg
   2372869 =C2=B1  5%     -82.0%     427303 =C2=B1  0%  sched_debug.cfs_rq:=
/.spread0.max
    998183 =C2=B1  1%     -82.2%     177613 =C2=B1  0%  sched_debug.cfs_rq:=
/.spread0.stddev
    242.15 =C2=B1  1%     -28.8%     172.45 =C2=B1  0%  sched_debug.cfs_rq:=
/.util_avg.avg
    392.49 =C2=B1  0%     -21.4%     308.56 =C2=B1  0%  sched_debug.cfs_rq:=
/.util_avg.stddev
    184988 =C2=B1  1%     -64.1%      66460 =C2=B1  0%  sched_debug.cpu.clo=
ck.avg
    184996 =C2=B1  1%     -64.1%      66466 =C2=B1  0%  sched_debug.cpu.clo=
ck.max
    184978 =C2=B1  1%     -64.1%      66453 =C2=B1  0%  sched_debug.cpu.clo=
ck.min
      5.60 =C2=B1 18%     -30.8%       3.88 =C2=B1-25%  sched_debug.cpu.clo=
ck.stddev
    184988 =C2=B1  1%     -64.1%      66460 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.avg
    184996 =C2=B1  1%     -64.1%      66466 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.max
    184978 =C2=B1  1%     -64.1%      66453 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.min
      5.60 =C2=B1 18%     -30.8%       3.88 =C2=B1-25%  sched_debug.cpu.clo=
ck_task.stddev
     36.54 =C2=B1  4%     -42.2%      21.11 =C2=B1 -4%  sched_debug.cpu.cpu=
_load[0].avg
    950.98 =C2=B1  7%     -44.5%     527.50 =C2=B1  0%  sched_debug.cpu.cpu=
_load[0].max
    151.40 =C2=B1  6%     -43.7%      85.22 =C2=B1 -1%  sched_debug.cpu.cpu=
_load[0].stddev
     35.91 =C2=B1  2%     -41.2%      21.10 =C2=B1 -4%  sched_debug.cpu.cpu=
_load[1].avg
    899.77 =C2=B1  3%     -41.4%     527.50 =C2=B1  0%  sched_debug.cpu.cpu=
_load[1].max
    145.18 =C2=B1  3%     -41.3%      85.22 =C2=B1 -1%  sched_debug.cpu.cpu=
_load[1].stddev
     35.61 =C2=B1  2%     -40.7%      21.12 =C2=B1 -4%  sched_debug.cpu.cpu=
_load[2].avg
    877.87 =C2=B1  2%     -39.9%     527.50 =C2=B1  0%  sched_debug.cpu.cpu=
_load[2].max
    142.54 =C2=B1  2%     -40.2%      85.23 =C2=B1 -1%  sched_debug.cpu.cpu=
_load[2].stddev
     35.37 =C2=B1  2%     -40.1%      21.20 =C2=B1 -4%  sched_debug.cpu.cpu=
_load[3].avg
    867.60 =C2=B1  2%     -39.2%     527.50 =C2=B1  0%  sched_debug.cpu.cpu=
_load[3].max
    141.21 =C2=B1  2%     -39.6%      85.33 =C2=B1 -1%  sched_debug.cpu.cpu=
_load[3].stddev
     35.16 =C2=B1  1%     -39.6%      21.24 =C2=B1 -4%  sched_debug.cpu.cpu=
_load[4].avg
    858.88 =C2=B1  2%     -38.6%     527.50 =C2=B1  0%  sched_debug.cpu.cpu=
_load[4].max
    140.16 =C2=B1  2%     -39.0%      85.43 =C2=B1 -1%  sched_debug.cpu.cpu=
_load[4].stddev
    456.75 =C2=B1  2%     -41.9%     265.40 =C2=B1  0%  sched_debug.cpu.cur=
r->pid.avg
      5331 =C2=B1  1%     -53.3%       2491 =C2=B1  0%  sched_debug.cpu.cur=
r->pid.max
    912.17 =C2=B1  2%     -38.3%     562.54 =C2=B1  0%  sched_debug.cpu.cur=
r->pid.stddev
     37.90 =C2=B1  7%     -39.8%      22.83 =C2=B1 -4%  sched_debug.cpu.loa=
d.avg
    904.00 =C2=B1  7%     -38.1%     559.50 =C2=B1  0%  sched_debug.cpu.loa=
d.max
    149.42 =C2=B1  6%     -39.3%      90.64 =C2=B1 -1%  sched_debug.cpu.loa=
d.stddev
      0.00 =C2=B1  5%     -31.3%       0.00 =C2=B1-4394145%  sched_debug.cp=
u.next_balance.stddev
     72445 =C2=B1  0%     -75.8%      17509 =C2=B1  0%  sched_debug.cpu.nr_=
load_updates.avg
    155443 =C2=B1  0%     -77.5%      34902 =C2=B1  0%  sched_debug.cpu.nr_=
load_updates.max
     19501 =C2=B1 33%     -61.4%       7530 =C2=B1  0%  sched_debug.cpu.nr_=
load_updates.min
     46290 =C2=B1  1%     -80.6%       8995 =C2=B1  0%  sched_debug.cpu.nr_=
load_updates.stddev
      0.25 =C2=B1  3%     -34.8%       0.16 =C2=B1-626%  sched_debug.cpu.nr=
_running.avg
      1.12 =C2=B1  6%     +33.3%       1.50 =C2=B1-66%  sched_debug.cpu.nr_=
running.max
      0.42 =C2=B1  2%     -14.1%       0.36 =C2=B1-276%  sched_debug.cpu.nr=
_running.stddev
      9841 =C2=B1  4%     -54.7%       4459 =C2=B1  0%  sched_debug.cpu.nr_=
switches.avg
    323.71 =C2=B1 11%     -26.8%     237.00 =C2=B1  0%  sched_debug.cpu.nr_=
switches.min
     10606 =C2=B1  6%     -26.9%       7748 =C2=B1  0%  sched_debug.cpu.nr_=
switches.stddev
      0.00 =C2=B1 68%   +1100.0%       0.05 =C2=B1-2057%  sched_debug.cpu.n=
r_uninterruptible.avg
    184975 =C2=B1  1%     -64.1%      66455 =C2=B1  0%  sched_debug.cpu_clk
    181780 =C2=B1  1%     -65.3%      63027 =C2=B1  0%  sched_debug.ktime
      0.12 =C2=B1  5%    +205.5%       0.36 =C2=B1-275%  sched_debug.rt_rq:=
/.rt_time.avg
      4.33 =C2=B1  7%    +211.4%      13.48 =C2=B1 -7%  sched_debug.rt_rq:/=
.rt_time.max
      0.60 =C2=B1  6%    +208.6%       1.85 =C2=B1-54%  sched_debug.rt_rq:/=
.rt_time.stddev
    184975 =C2=B1  1%     -64.1%      66455 =C2=B1  0%  sched_debug.sched_c=
lk


lkp-hsw-ep2: 72 threads Brickland Haswell-EP with 128G memory


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
Xiaolong

--===============3031362284528753283==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogdm0tc2NhbGFiaWxpdHkKZGVmYXVsdC1tb25pdG9yczoKICB3YWl0OiBhY3RpdmF0
ZS1tb25pdG9yCiAga21zZzogCiAgdXB0aW1lOiAKICBpb3N0YXQ6IAogIGhlYXJ0YmVhdDogCiAg
dm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAKICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZv
OiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1zdGF0OgogICAgaW50ZXJ2YWw6IDEwCiAgbWVtaW5m
bzogCiAgc2xhYmluZm86IAogIGludGVycnVwdHM6IAogIGxvY2tfc3RhdDogCiAgbGF0ZW5jeV9z
dGF0czogCiAgc29mdGlycXM6IAogIGJkaV9kZXZfbWFwcGluZzogCiAgZGlza3N0YXRzOiAKICBu
ZnNzdGF0OiAKICBjcHVpZGxlOiAKICBjcHVmcmVxLXN0YXRzOiAKICB0dXJib3N0YXQ6IAogIHBt
ZXRlcjogCiAgc2NoZWRfZGVidWc6CiAgICBpbnRlcnZhbDogNjAKY3B1ZnJlcV9nb3Zlcm5vcjog
cGVyZm9ybWFuY2UKZGVmYXVsdC13YXRjaGRvZ3M6CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6
IApjb21taXQ6IGZhYWQyMTg1ZjQ4MjU3OGQ1MGQzNjM3NDYwMDZhMWI5NWRkZTlkMGEKbW9kZWw6
IEJyaWNrbGFuZCBIYXN3ZWxsLUVQCm5yX2NwdTogNzIKbWVtb3J5OiAxMjhHCmhkZF9wYXJ0aXRp
b25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1JTlRFTF9TU0RTQzJCQjQ4MEc2X0JUV0E1NDQ0MDY0
QzQ4MEZHTi1wYXJ0MiIKc3dhcF9wYXJ0aXRpb25zOiAKcm9vdGZzX3BhcnRpdGlvbjogIi9kZXYv
ZGlzay9ieS1pZC9hdGEtSU5URUxfU1NEU0MyQkI0ODBHNl9CVFdBNTQ0NDA2NEM0ODBGR04tcGFy
dDEiCmNhdGVnb3J5OiBiZW5jaG1hcmsKdHJhbnNwYXJlbnRfaHVnZXBhZ2U6CiAgdGhwX2VuYWJs
ZWQ6IG5ldmVyCiAgdGhwX2RlZnJhZzogbmV2ZXIKbnJfdGFzazogMTYKYm9vdF9wYXJhbXM6CiAg
YnBfbWVtbWFwOiA5NkchNEcKZGlzazoKICBucl9wbWVtOiAxCnN3YXA6IApwZXJmLXByb2ZpbGU6
CiAgZGVsYXk6IDIwCnZtLXNjYWxhYmlsaXR5OgogIHRlc3Q6IHN3YXAtdy1yYW5kCmtjb25maWc6
IHg4Nl82NC1yaGVsLXBtZW0KcXVldWU6IGJpc2VjdAp0ZXN0Ym94OiBsa3AtaHN3LWVwMgp0Ym94
X2dyb3VwOiBsa3AtaHN3LWVwMgplbnF1ZXVlX3RpbWU6IDIwMTYtMDQtMjIgMTY6NDA6MDIuMDU1
MzY1Mzg2ICswODowMApjb21waWxlcjogZ2NjLTQuOQpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAx
NS0wMi0wNy5jZ3oKaWQ6IDVmMDk4NzZlODk4MGE3ZmFhZTYwMzhhMDI5NzA0ZTBiNzQxZTg1ZWYK
dXNlcjogbGtwCmhlYWRfY29tbWl0OiA1ZTM0OTdjY2EyODE2MTZlNzkzMGI3NGEwMDc2YjczMjRk
Y2MyMDU3CmJhc2VfY29tbWl0OiBiNTYyZTQ0ZjUwN2U4NjNjNjc5Mjk0NmU0ZTFiMTQ0OWZiYmFj
ODVkCmJyYW5jaDogbGludXgtbmV4dC9tYXN0ZXIKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L3ZtLXNj
YWxhYmlsaXR5L3BlcmZvcm1hbmNlLW5ldmVyLW5ldmVyLTE2LTEtc3dhcC13LXJhbmQvbGtwLWhz
dy1lcDIvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC1wbWVtL2djYy00
LjkvZmFhZDIxODVmNDgyNTc4ZDUwZDM2Mzc0NjAwNmExYjk1ZGRlOWQwYS8wIgpqb2JfZmlsZTog
Ii9sa3Avc2NoZWR1bGVkL2xrcC1oc3ctZXAyL2Jpc2VjdF92bS1zY2FsYWJpbGl0eS1wZXJmb3Jt
YW5jZS1uZXZlci1uZXZlci0xNi0xLXN3YXAtdy1yYW5kLWRlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3oteDg2XzY0LXJoZWwtcG1lbS1mYWFkMjE4NWY0ODI1NzhkNTBkMzYzNzQ2MDA2YTFiOTVk
ZGU5ZDBhLTIwMTYwNDIyLTc5ODkzLWtnNHV2ei0wLnlhbWwiCm1heF91cHRpbWU6IDE1MDAKaW5p
dHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rs
b2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hl
ZHVsZWQvbGtwLWhzdy1lcDIvYmlzZWN0X3ZtLXNjYWxhYmlsaXR5LXBlcmZvcm1hbmNlLW5ldmVy
LW5ldmVyLTE2LTEtc3dhcC13LXJhbmQtZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei14ODZf
NjQtcmhlbC1wbWVtLWZhYWQyMTg1ZjQ4MjU3OGQ1MGQzNjM3NDYwMDZhMWI5NWRkZTlkMGEtMjAx
NjA0MjItNzk4OTMta2c0dXZ6LTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQt
cmhlbC1wbWVtCi0gYnJhbmNoPWxpbnV4LW5leHQvbWFzdGVyCi0gY29tbWl0PWZhYWQyMTg1ZjQ4
MjU3OGQ1MGQzNjM3NDYwMDZhMWI5NWRkZTlkMGEKLSBCT09UX0lNQUdFPS9wa2cvbGludXgveDg2
XzY0LXJoZWwtcG1lbS9nY2MtNC45L2ZhYWQyMTg1ZjQ4MjU3OGQ1MGQzNjM3NDYwMDZhMWI5NWRk
ZTlkMGEvdm1saW51ei00LjUuMC0wMjcyOC1nZmFhZDIxOAotIG1lbW1hcD05NkchNEcKLSBtYXhf
dXB0aW1lPTE1MDAKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L3ZtLXNjYWxhYmlsaXR5L3BlcmZvcm1h
bmNlLW5ldmVyLW5ldmVyLTE2LTEtc3dhcC13LXJhbmQvbGtwLWhzdy1lcDIvZGViaWFuLXg4Nl82
NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC1wbWVtL2djYy00LjkvZmFhZDIxODVmNDgyNTc4
ZDUwZDM2Mzc0NjAwNmExYjk1ZGRlOWQwYS8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVh
cmx5cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGlj
PWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91
dD0xMDAKICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9v
cHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAs
MTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xr
cC9sa3AteDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVs
LXBtZW0vZ2NjLTQuOS9mYWFkMjE4NWY0ODI1NzhkNTBkMzYzNzQ2MDA2YTFiOTVkZGU5ZDBhL21v
ZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5j
Z3ovcnVuLWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3ovdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvdHVyYm9zdGF0LmNneiwvbGtwL2Jl
bmNobWFya3Mvc3dhcC5jZ3osL2xrcC9iZW5jaG1hcmtzL3ZtLXNjYWxhYmlsaXR5LmNneiIKbGlu
dXhfaGVhZGVyc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsLXBtZW0vZ2NjLTQuOS9m
YWFkMjE4NWY0ODI1NzhkNTBkMzYzNzQ2MDA2YTFiOTVkZGU5ZDBhL2xpbnV4LWhlYWRlcnMuY2d6
IgprZXJuZWw6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsLXBtZW0vZ2NjLTQuOS9mYWFkMjE4NWY0
ODI1NzhkNTBkMzYzNzQ2MDA2YTFiOTVkZGU5ZDBhL3ZtbGludXotNC41LjAtMDI3MjgtZ2ZhYWQy
MTgiCmRlcXVldWVfdGltZTogMjAxNi0wNC0yMiAxNjo1OTo0NS4zOTg5NTA5NjYgKzA4OjAwCmpv
Yl9zdGF0ZTogT09NCmxvYWRhdmc6IDE2LjMzIDUuODYgMi4xMSAxOC84MjEgMzMyOApzdGFydF90
aW1lOiAnMTQ2MTMxNTYzNCcKZW5kX3RpbWU6ICcxNDYxMzE1NjkzJwp2ZXJzaW9uOiAiL2xrcC9s
a3AvLnNyYy0yMDE2MDQyMi0xNjUwMjciCg==

--===============3031362284528753283==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wNC0yMiAxNzowMDozMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0yMiAxNzowMDozMyBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wNC0yMiAxNzowMDozMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDQtMjIgMTc6MDA6MzMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIyIDE3OjAwOjMzIGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wNC0yMiAxNzowMDozMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQt
MjIgMTc6MDA6MzMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIyIDE3OjAwOjMzIGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wNC0yMiAxNzowMDozMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMjIg
MTc6MDA6MzMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIyIDE3OjAwOjMzIGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxOC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wNC0yMiAxNzowMDozMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMjIgMTc6
MDA6MzMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMjIgMTc6MDA6MzMgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTA0LTIyIDE3OjAwOjMzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUyMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0yMiAxNzowMDoz
MyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjIvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMjIgMTc6MDA6MzMgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTA0LTIyIDE3OjAwOjMzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHUyNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0yMiAxNzowMDozMyBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjUvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMjIgMTc6MDA6MzMgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTA0LTIyIDE3OjAwOjMzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUyNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0yMiAxNzowMDozMyBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjgvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDQtMjIgMTc6MDA6MzMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0
LTIyIDE3OjAwOjMzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIyIDE3OjAwOjMzIGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wNC0yMiAxNzowMDozMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MzEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMjIg
MTc6MDA6MzMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIyIDE3OjAwOjMzIGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMy9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wNC0yMiAxNzowMDozMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MzQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMjIgMTc6
MDA6MzMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIyIDE3OjAwOjMzIGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wNC0yMiAxNzowMDozMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MzcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMjIgMTc6MDA6
MzMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIyIDE3OjAwOjMzIGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wNC0yMiAxNzowMDozMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0yMiAxNzowMDozMyBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMjIgMTc6MDA6MzMgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTA0LTIyIDE3OjAwOjMzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU0Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0yMiAxNzowMDozMyBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDMvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDQtMjIgMTc6MDA6MzMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0
LTIyIDE3OjAwOjMzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU0NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0yMiAxNzowMDozMyBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDQtMjIgMTc6MDA6MzMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTQ3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIy
IDE3OjAwOjMzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0
OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0yMiAxNzowMDozMyBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDkvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDQtMjIgMTc6MDA6MzMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMjIgMTc6
MDA6MzMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUwL2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIyIDE3OjAwOjMzIGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wNC0yMiAxNzowMDozMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NTIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMjIgMTc6MDA6
MzMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUzL2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIyIDE3OjAwOjMzIGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wNC0yMiAxNzowMDozMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMjIgMTc6MDA6MzMg
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU2L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIyIDE3OjAwOjMzIGVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAx
Ni0wNC0yMiAxNzowMDozMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1NTgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMjIgMTc6MDA6MzMgZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU5L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIyIDE3OjAwOjMzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0
LTIyIDE3OjAwOjMzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU2MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0yMiAxNzowMDozMyBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjEvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDQtMjIgMTc6MDA6MzMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTYyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIy
IDE3OjAwOjMzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2
My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0yMiAxNzowMDozMyBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjQvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDQtMjIgMTc6MDA6MzMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTY1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIyIDE3
OjAwOjMzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2Ni9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0yMiAxNzowMDozMyBlY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCjIwMTYtMDQtMjIgMTc6MDA6MzMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTY4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIyIDE3OjAw
OjMzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2OS9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0yMiAxNzowMDozMyBlY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wNC0yMiAxNzowMDozMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NzAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMjIgMTc6MDA6MzMg
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcxL2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIyIDE3OjAwOjMzIGVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTA0LTIyIDE3OjAwOjMzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIyIDE3OjAwOjM0IG1vdW50
IC10IHRtcGZzIC1vIHNpemU9MTAwJSB2bS1zY2FsYWJpbGl0eS10bXAgL3RtcC92bS1zY2FsYWJp
bGl0eS10bXAKMjAxNi0wNC0yMiAxNzowMDozNCB0cnVuY2F0ZSAtcyAzMzYxNTM1MTgwOCAvdG1w
L3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eS5pbWcKMjAxNi0wNC0yMiAxNzowMDoz
NCBta2ZzLnhmcyAtcSAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eS5pbWcK
MjAxNi0wNC0yMiAxNzowMDozNCBtb3VudCAtbyBsb29wIC90bXAvdm0tc2NhbGFiaWxpdHktdG1w
L3ZtLXNjYWxhYmlsaXR5LmltZyAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0
eQoyMDE2LTA0LTIyIDE3OjAwOjM0IC4vY2FzZS1zd2FwLXctcmFuZAoyMDE2LTA0LTIyIDE3OjAw
OjM0IC4vdXNlbWVtIC0tcnVudGltZSAzMDAgLW4gMTYgLS1yYW5kb20gNjM2ODUzODYyNAo=

--===============3031362284528753283==--

