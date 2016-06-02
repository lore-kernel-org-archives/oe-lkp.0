Content-Type: multipart/mixed; boundary="===============0778686518525504624=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [dcache_{readdir, dir_lseek}() users] 4e82901cd6: reaim.jobs_per_min -49.1% regression
Date: Thu, 02 Jun 2016 14:28:36 +0800
Message-ID: <87h9dchzor.fsf@yhuang-dev.intel.com>
In-Reply-To: <87bn3laffo.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0778686518525504624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"Huang, Ying" <ying.huang@intel.com> writes:

> Al Viro <viro@ZenIV.linux.org.uk> writes:
>
>> On Tue, May 31, 2016 at 04:15:15PM +0800, kernel test robot wrote:
>>> =

>>> =

>>> FYI, we noticed reaim.jobs_per_min -49.1% regression due to commit:
>>> =

>>> commit 4e82901cd6d1af21ae232ae835c36d8230c809e8 ("dcache_{readdir,dir_l=
seek}() users: switch to ->iterate_shared")
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git mast=
er
>>> =

>>> in testcase: reaim
>>> on test machine: lkp-hsx04: 144 threads Brickland Haswell-EX with 512G =
memory
>>> with following parameters: cpufreq_governor=3Dperformance/iterations=3D=
4/nr_task=3D1600%/test=3Dfserver
>>
>> [snip]
>>
>> Is there any way to get the profiles?
>
> Sorry, our perf-profile support is broken after upgrading perf-profile
> recently.  We will restore it ASAP and send back to you the perf profile
> results.

Here is the comparison result with perf profile information.  You can
find it via searching 'perf-profile'.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/nr_task/iterat=
ions/test:
  lkp-hsx04/reaim/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performa=
nce/1600%/4/fserver

commit: =

  3125d2650cae97d8f313ab696cd0ed66916e767a
  4e82901cd6d1af21ae232ae835c36d8230c809e8

3125d2650cae97d8 4e82901cd6d1af21ae232ae835 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    479.79 =C2=B1  3%   +2515.6%      12549 =C2=B1  2%  reaim.child_systime
    379.45 =C2=B1  0%     +13.1%     429.26 =C2=B1  0%  reaim.child_utime
    176186 =C2=B1 10%     -44.8%      97342 =C2=B1  1%  reaim.jobs_per_min
     76.47 =C2=B1 10%     -44.8%      42.25 =C2=B1  1%  reaim.jobs_per_min_=
child
     71.15 =C2=B1  5%     +22.7%      87.33 =C2=B1  0%  reaim.jti
    178407 =C2=B1 10%     -44.1%      99667 =C2=B1  2%  reaim.max_jobs_per_=
min
     80.07 =C2=B1  9%     +79.3%     143.55 =C2=B1  1%  reaim.parent_time
     28.40 =C2=B1 14%     -57.1%      12.19 =C2=B1  6%  reaim.std_dev_perce=
nt
     17.87 =C2=B1  0%     -10.7%      15.95 =C2=B1  4%  reaim.std_dev_time
    352.92 =C2=B1  0%     +23.9%     437.31 =C2=B1  1%  reaim.time.elapsed_=
time
    352.92 =C2=B1  0%     +23.9%     437.31 =C2=B1  1%  reaim.time.elapsed_=
time.max
 1.895e+08 =C2=B1 10%     -30.0%  1.327e+08 =C2=B1  0%  reaim.time.minor_pa=
ge_faults
      1052 =C2=B1  7%    +746.1%       8903 =C2=B1  1%  reaim.time.percent_=
of_cpu_this_job_got
      2073 =C2=B1  7%   +1715.8%      37650 =C2=B1  2%  reaim.time.system_t=
ime
      1644 =C2=B1 10%     -21.7%       1287 =C2=B1  0%  reaim.time.user_time
   8298349 =C2=B1 13%     -48.2%    4296696 =C2=B1  5%  reaim.time.voluntar=
y_context_switches
    404.21 =C2=B1  1%     +20.7%     487.87 =C2=B1  2%  uptime.boot
     53381 =C2=B1  1%     -67.3%      17448 =C2=B1  7%  uptime.idle
   4916499 =C2=B1 10%     -30.7%    3408447 =C2=B1  0%  softirqs.NET_RX
    668035 =C2=B1 15%    +367.2%    3121347 =C2=B1  2%  softirqs.RCU
    629095 =C2=B1  3%     +29.8%     816830 =C2=B1  1%  softirqs.SCHED
   3444643 =C2=B1  3%    +542.4%   22127503 =C2=B1  2%  softirqs.TIMER
    941847 =C2=B1  0%     +30.3%    1227512 =C2=B1  0%  vmstat.memory.cache
      1.00 =C2=B1  0%  +36366.7%     364.67 =C2=B1 19%  vmstat.procs.b
     11.67 =C2=B1 17%   +1437.1%     179.33 =C2=B1  2%  vmstat.procs.r
     60855 =C2=B1 11%     -55.9%      26830 =C2=B1  4%  vmstat.system.cs
     12673 =C2=B1  7%    +739.8%     106430 =C2=B1  1%  vmstat.system.in
    352.92 =C2=B1  0%     +23.9%     437.31 =C2=B1  1%  time.elapsed_time
    352.92 =C2=B1  0%     +23.9%     437.31 =C2=B1  1%  time.elapsed_time.m=
ax
 1.895e+08 =C2=B1 10%     -30.0%  1.327e+08 =C2=B1  0%  time.minor_page_fau=
lts
      1052 =C2=B1  7%    +746.1%       8903 =C2=B1  1%  time.percent_of_cpu=
_this_job_got
      2073 =C2=B1  7%   +1715.8%      37650 =C2=B1  2%  time.system_time
      1644 =C2=B1 10%     -21.7%       1287 =C2=B1  0%  time.user_time
   8298349 =C2=B1 13%     -48.2%    4296696 =C2=B1  5%  time.voluntary_cont=
ext_switches
 5.486e+08 =C2=B1 17%     +80.6%   9.91e+08 =C2=B1 12%  cpuidle.C1-HSW.time
 2.765e+09 =C2=B1 22%     -67.7%  8.921e+08 =C2=B1 11%  cpuidle.C1E-HSW.time
   3551940 =C2=B1 13%     -86.8%     470084 =C2=B1 11%  cpuidle.C1E-HSW.usa=
ge
  3.63e+08 =C2=B1  3%    +384.0%  1.757e+09 =C2=B1 12%  cpuidle.C3-HSW.time
    439297 =C2=B1  1%     +54.1%     677092 =C2=B1  8%  cpuidle.C3-HSW.usage
 4.368e+10 =C2=B1  1%     -58.1%   1.83e+10 =C2=B1  1%  cpuidle.C6-HSW.time
   5469354 =C2=B1  9%     -56.8%    2361450 =C2=B1  3%  cpuidle.C6-HSW.usage
 1.179e+08 =C2=B1 11%    +119.6%  2.589e+08 =C2=B1 14%  cpuidle.POLL.time
    988.00 =C2=B1 12%    +199.9%       2963 =C2=B1  8%  cpuidle.POLL.usage
  48184543 =C2=B1 17%     -41.6%   28158682 =C2=B1  9%  numa-numastat.node0=
.local_node
  48196904 =C2=B1 17%     -41.5%   28174412 =C2=B1  9%  numa-numastat.node0=
.numa_hit
     12361 =C2=B1 17%     +27.3%      15730 =C2=B1  4%  numa-numastat.node0=
.other_node
  43586002 =C2=B1 10%     -20.6%   34591781 =C2=B1  8%  numa-numastat.node1=
.local_node
  43592187 =C2=B1 10%     -20.6%   34599930 =C2=B1  8%  numa-numastat.node1=
.numa_hit
  46908094 =C2=B1  5%     -27.4%   34074424 =C2=B1  8%  numa-numastat.node2=
.local_node
  46917366 =C2=B1  5%     -27.3%   34087462 =C2=B1  8%  numa-numastat.node2=
.numa_hit
  44223596 =C2=B1 11%     -30.1%   30903064 =C2=B1  8%  numa-numastat.node3=
.local_node
  44237505 =C2=B1 11%     -30.1%   30916293 =C2=B1  8%  numa-numastat.node3=
.numa_hit
      7.67 =C2=B1  7%    +753.7%      65.45 =C2=B1  1%  turbostat.%Busy
    223.00 =C2=B1  7%    +749.2%       1893 =C2=B1  1%  turbostat.Avg_MHz
     21.89 =C2=B1  5%     +14.3%      25.02 =C2=B1  2%  turbostat.CPU%c1
      0.90 =C2=B1  6%     +94.8%       1.75 =C2=B1 12%  turbostat.CPU%c3
     69.55 =C2=B1  0%     -88.8%       7.79 =C2=B1  0%  turbostat.CPU%c6
     42.00 =C2=B1  1%     +30.2%      54.67 =C2=B1  3%  turbostat.CoreTmp
      5.33 =C2=B1 10%     -84.4%       0.83 =C2=B1  9%  turbostat.Pkg%pc2
      0.60 =C2=B1 31%     -75.7%       0.15 =C2=B1 58%  turbostat.Pkg%pc6
     46.67 =C2=B1  4%     +25.7%      58.67 =C2=B1  0%  turbostat.PkgTmp
    262.91 =C2=B1  0%     +83.7%     483.07 =C2=B1  0%  turbostat.PkgWatt
    233.44 =C2=B1  0%      +2.2%     238.47 =C2=B1  0%  turbostat.RAMWatt
    699933 =C2=B1  2%     +22.7%     859108 =C2=B1  1%  meminfo.Active
    596870 =C2=B1  2%     +26.9%     757230 =C2=B1  1%  meminfo.Active(anon)
    584065 =C2=B1  3%     +11.8%     652888 =C2=B1  1%  meminfo.AnonPages
    508898 =C2=B1  0%     +16.6%     593287 =C2=B1  0%  meminfo.Cached
   2321912 =C2=B1  2%     +18.4%    2749325 =C2=B1  4%  meminfo.Committed_AS
   5969346 =C2=B1  0%     +17.7%    7024098 =C2=B1  0%  meminfo.DirectMap2M
     10525 =C2=B1  0%     +13.7%      11967 =C2=B1  1%  meminfo.Inactive(an=
on)
     57595 =C2=B1  1%    +248.1%     200467 =C2=B1  2%  meminfo.KernelStack
     18442 =C2=B1  2%     +12.2%      20693 =C2=B1  0%  meminfo.Mapped
    112198 =C2=B1  1%     +23.7%     138840 =C2=B1  0%  meminfo.PageTables
     84558 =C2=B1  0%     +21.2%     102517 =C2=B1  1%  meminfo.SReclaimable
    348470 =C2=B1  0%     +53.1%     533390 =C2=B1  1%  meminfo.SUnreclaim
     24174 =C2=B1  9%    +348.7%     108462 =C2=B1  2%  meminfo.Shmem
    433028 =C2=B1  0%     +46.9%     635908 =C2=B1  1%  meminfo.Slab
    149068 =C2=B1  2%     +27.1%     189400 =C2=B1  1%  proc-vmstat.nr_acti=
ve_anon
    145815 =C2=B1  3%     +11.9%     163138 =C2=B1  1%  proc-vmstat.nr_anon=
_pages
    127230 =C2=B1  0%     +16.7%     148491 =C2=B1  0%  proc-vmstat.nr_file=
_pages
      2634 =C2=B1  0%     +14.1%       3006 =C2=B1  1%  proc-vmstat.nr_inac=
tive_anon
      0.00 =C2=B1  0%      +Inf%     462.33 =C2=B1 15%  proc-vmstat.nr_isol=
ated_anon
      3623 =C2=B1  1%    +244.2%      12473 =C2=B1  2%  proc-vmstat.nr_kern=
el_stack
      4620 =C2=B1  2%     +12.5%       5197 =C2=B1  1%  proc-vmstat.nr_mapp=
ed
     27939 =C2=B1  1%     +24.3%      34731 =C2=B1  0%  proc-vmstat.nr_page=
_table_pages
      6049 =C2=B1  9%    +351.0%      27285 =C2=B1  2%  proc-vmstat.nr_shmem
     21138 =C2=B1  0%     +21.4%      25663 =C2=B1  1%  proc-vmstat.nr_slab=
_reclaimable
     87101 =C2=B1  0%     +53.1%     133353 =C2=B1  1%  proc-vmstat.nr_slab=
_unreclaimable
      0.00 =C2=B1  0%      +Inf%     870680 =C2=B1  2%  proc-vmstat.numa_hi=
nt_faults
      0.00 =C2=B1  0%      +Inf%     406936 =C2=B1  3%  proc-vmstat.numa_hi=
nt_faults_local
 1.829e+08 =C2=B1 11%     -30.2%  1.278e+08 =C2=B1  0%  proc-vmstat.numa_hit
 1.829e+08 =C2=B1 11%     -30.2%  1.277e+08 =C2=B1  0%  proc-vmstat.numa_lo=
cal
     41727 =C2=B1  0%     +20.2%      50144 =C2=B1  0%  proc-vmstat.numa_ot=
her
      0.00 =C2=B1  0%      +Inf%     258503 =C2=B1  3%  proc-vmstat.numa_pa=
ges_migrated
      0.00 =C2=B1  0%      +Inf%    1389875 =C2=B1  2%  proc-vmstat.numa_pt=
e_updates
      6374 =C2=B1 13%    +254.1%      22575 =C2=B1  2%  proc-vmstat.pgactiv=
ate
    766567 =C2=B1 17%     -39.9%     460866 =C2=B1  9%  proc-vmstat.pgalloc=
_dma32
 1.862e+08 =C2=B1 11%     -29.1%   1.32e+08 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
 1.906e+08 =C2=B1 10%     -29.7%  1.339e+08 =C2=B1  0%  proc-vmstat.pgfault
 1.869e+08 =C2=B1 11%     -29.2%  1.323e+08 =C2=B1  0%  proc-vmstat.pgfree
      0.00 =C2=B1  0%      +Inf%       2076 =C2=B1  4%  proc-vmstat.pgmigra=
te_fail
      0.00 =C2=B1  0%      +Inf%     258503 =C2=B1  3%  proc-vmstat.pgmigra=
te_success
     26527 =C2=B1 23%    +104.1%      54152 =C2=B1 16%  numa-meminfo.node0.=
KernelStack
      3090 =C2=B1  3%     +80.5%       5578 =C2=B1 50%  numa-meminfo.node0.=
Mapped
    921890 =C2=B1  1%      +9.2%    1007082 =C2=B1  4%  numa-meminfo.node0.=
MemUsed
    108135 =C2=B1 14%     +22.1%     132019 =C2=B1 12%  numa-meminfo.node0.=
SUnreclaim
    692.67 =C2=B1 32%    +562.7%       4590 =C2=B1 86%  numa-meminfo.node0.=
Shmem
    185924 =C2=B1  7%     +41.3%     262685 =C2=B1 19%  numa-meminfo.node1.=
Active
    159207 =C2=B1  8%     +49.7%     238288 =C2=B1 21%  numa-meminfo.node1.=
Active(anon)
    151747 =C2=B1  6%     +15.6%     175383 =C2=B1 12%  numa-meminfo.node1.=
AnonPages
     10565 =C2=B1 74%    +348.1%      47347 =C2=B1  9%  numa-meminfo.node1.=
KernelStack
    801350 =C2=B1  7%     +17.1%     938412 =C2=B1  6%  numa-meminfo.node1.=
MemUsed
     22990 =C2=B1 15%     +34.3%      30874 =C2=B1  7%  numa-meminfo.node1.=
SReclaimable
     82401 =C2=B1 25%     +58.8%     130874 =C2=B1  5%  numa-meminfo.node1.=
SUnreclaim
    105391 =C2=B1 16%     +53.5%     161749 =C2=B1  4%  numa-meminfo.node1.=
Slab
     12599 =C2=B1 48%    +352.5%      57016 =C2=B1  2%  numa-meminfo.node2.=
KernelStack
    773326 =C2=B1  2%     +19.0%     920096 =C2=B1  1%  numa-meminfo.node2.=
MemUsed
     28753 =C2=B1 26%     +60.8%      46232 =C2=B1 17%  numa-meminfo.node2.=
PageTables
     85146 =C2=B1 14%     +75.2%     149181 =C2=B1  1%  numa-meminfo.node2.=
SUnreclaim
    108938 =C2=B1 14%     +62.1%     176621 =C2=B1  3%  numa-meminfo.node2.=
Slab
    159543 =C2=B1 16%     +44.1%     229926 =C2=B1 26%  numa-meminfo.node3.=
Active
    134722 =C2=B1 20%     +51.8%     204566 =C2=B1 29%  numa-meminfo.node3.=
Active(anon)
      7948 =C2=B1 42%    +427.7%      41941 =C2=B1 12%  numa-meminfo.node3.=
KernelStack
      5114 =C2=B1 56%     +50.8%       7714 =C2=B1 38%  numa-meminfo.node3.=
Mapped
    707514 =C2=B1  8%     +24.1%     878069 =C2=B1  7%  numa-meminfo.node3.=
MemUsed
     72837 =C2=B1 13%     +66.8%     121492 =C2=B1  9%  numa-meminfo.node3.=
SUnreclaim
      3674 =C2=B1 98%    +970.8%      39342 =C2=B1121%  numa-meminfo.node3.=
Shmem
     90421 =C2=B1  9%     +60.3%     144902 =C2=B1  6%  numa-meminfo.node3.=
Slab
      1658 =C2=B1 23%    +104.0%       3384 =C2=B1 16%  numa-vmstat.node0.n=
r_kernel_stack
    772.00 =C2=B1  3%     +81.2%       1399 =C2=B1 50%  numa-vmstat.node0.n=
r_mapped
    172.67 =C2=B1 32%    +565.3%       1148 =C2=B1 86%  numa-vmstat.node0.n=
r_shmem
     27026 =C2=B1 14%     +22.1%      32987 =C2=B1 12%  numa-vmstat.node0.n=
r_slab_unreclaimable
  22869693 =C2=B1 20%     -47.9%   11904640 =C2=B1 10%  numa-vmstat.node0.n=
uma_hit
  22823515 =C2=B1 20%     -48.1%   11856155 =C2=B1 10%  numa-vmstat.node0.n=
uma_local
     39771 =C2=B1  8%     +50.4%      59823 =C2=B1 20%  numa-vmstat.node1.n=
r_active_anon
     37907 =C2=B1  6%     +16.6%      44186 =C2=B1 12%  numa-vmstat.node1.n=
r_anon_pages
      0.00 =C2=B1  0%      +Inf%     122.33 =C2=B1  8%  numa-vmstat.node1.n=
r_isolated_anon
    664.00 =C2=B1 75%    +340.8%       2927 =C2=B1  8%  numa-vmstat.node1.n=
r_kernel_stack
      5747 =C2=B1 15%     +33.9%       7698 =C2=B1  7%  numa-vmstat.node1.n=
r_slab_reclaimable
     20592 =C2=B1 25%     +58.6%      32652 =C2=B1  5%  numa-vmstat.node1.n=
r_slab_unreclaimable
  20571250 =C2=B1 12%     -26.6%   15099745 =C2=B1  9%  numa-vmstat.node1.n=
uma_hit
  20512586 =C2=B1 12%     -26.7%   15039547 =C2=B1  9%  numa-vmstat.node1.n=
uma_local
    787.00 =C2=B1 48%    +351.6%       3554 =C2=B1  2%  numa-vmstat.node2.n=
r_kernel_stack
      7141 =C2=B1 26%     +62.1%      11577 =C2=B1 15%  numa-vmstat.node2.n=
r_page_table_pages
     21277 =C2=B1 14%     +75.3%      37298 =C2=B1  1%  numa-vmstat.node2.n=
r_slab_unreclaimable
  21913451 =C2=B1  6%     -31.2%   15076742 =C2=B1 12%  numa-vmstat.node2.n=
uma_hit
  21818774 =C2=B1  6%     -31.3%   14979744 =C2=B1 12%  numa-vmstat.node2.n=
uma_local
     33642 =C2=B1 20%     +52.6%      51332 =C2=B1 29%  numa-vmstat.node3.n=
r_active_anon
      0.00 =C2=B1  0%      +Inf%     117.00 =C2=B1 18%  numa-vmstat.node3.n=
r_isolated_anon
    489.33 =C2=B1 43%    +431.1%       2599 =C2=B1 13%  numa-vmstat.node3.n=
r_kernel_stack
      1277 =C2=B1 56%     +50.7%       1925 =C2=B1 38%  numa-vmstat.node3.n=
r_mapped
    917.00 =C2=B1 98%    +969.0%       9803 =C2=B1121%  numa-vmstat.node3.n=
r_shmem
     18198 =C2=B1 13%     +66.8%      30362 =C2=B1  9%  numa-vmstat.node3.n=
r_slab_unreclaimable
  20763416 =C2=B1 12%     -36.4%   13211498 =C2=B1  9%  numa-vmstat.node3.n=
uma_hit
  20664485 =C2=B1 12%     -36.5%   13114307 =C2=B1  9%  numa-vmstat.node3.n=
uma_local
    112783 =C2=B1  5%      -9.2%     102353 =C2=B1  0%  slabinfo.anon_vma.a=
ctive_objs
     57839 =C2=B1  1%     +46.3%      84628 =C2=B1  3%  slabinfo.cred_jar.a=
ctive_objs
      1386 =C2=B1  1%     +53.5%       2127 =C2=B1  3%  slabinfo.cred_jar.a=
ctive_slabs
     58232 =C2=B1  1%     +53.5%      89381 =C2=B1  3%  slabinfo.cred_jar.n=
um_objs
      1386 =C2=B1  1%     +53.5%       2127 =C2=B1  3%  slabinfo.cred_jar.n=
um_slabs
    106001 =C2=B1  0%     +66.1%     176110 =C2=B1  2%  slabinfo.dentry.act=
ive_objs
      2615 =C2=B1  0%     +62.0%       4235 =C2=B1  2%  slabinfo.dentry.act=
ive_slabs
    109861 =C2=B1  0%     +62.0%     177924 =C2=B1  2%  slabinfo.dentry.num=
_objs
      2615 =C2=B1  0%     +62.0%       4235 =C2=B1  2%  slabinfo.dentry.num=
_slabs
     47974 =C2=B1  2%    +580.1%     326281 =C2=B1  5%  slabinfo.kmalloc-25=
6.active_objs
      1400 =C2=B1  0%    +282.7%       5358 =C2=B1  4%  slabinfo.kmalloc-25=
6.active_slabs
     89624 =C2=B1  0%    +282.6%     342936 =C2=B1  4%  slabinfo.kmalloc-25=
6.num_objs
      1400 =C2=B1  0%    +282.7%       5358 =C2=B1  4%  slabinfo.kmalloc-25=
6.num_slabs
     19286 =C2=B1  4%     +28.4%      24755 =C2=B1  4%  slabinfo.kmalloc-51=
2.active_objs
     19445 =C2=B1  4%     +27.9%      24875 =C2=B1  4%  slabinfo.kmalloc-51=
2.num_objs
      8541 =C2=B1  1%     +11.8%       9546 =C2=B1  1%  slabinfo.mm_struct.=
active_objs
     18599 =C2=B1  2%    +279.3%      70553 =C2=B1  2%  slabinfo.pid.active=
_objs
    290.00 =C2=B1  2%    +281.3%       1105 =C2=B1  2%  slabinfo.pid.active=
_slabs
     18599 =C2=B1  2%    +280.7%      70800 =C2=B1  2%  slabinfo.pid.num_ob=
js
    290.00 =C2=B1  2%    +281.3%       1105 =C2=B1  2%  slabinfo.pid.num_sl=
abs
     27990 =C2=B1  1%     -13.1%      24330 =C2=B1  1%  slabinfo.proc_inode=
_cache.active_objs
     28081 =C2=B1  0%     -13.4%      24330 =C2=B1  1%  slabinfo.proc_inode=
_cache.num_objs
     15869 =C2=B1  0%     +72.3%      27341 =C2=B1  3%  slabinfo.radix_tree=
_node.active_objs
    283.00 =C2=B1  0%     +72.6%     488.33 =C2=B1  3%  slabinfo.radix_tree=
_node.active_slabs
     15869 =C2=B1  0%     +72.6%      27391 =C2=B1  3%  slabinfo.radix_tree=
_node.num_objs
    283.00 =C2=B1  0%     +72.6%     488.33 =C2=B1  3%  slabinfo.radix_tree=
_node.num_slabs
     38727 =C2=B1  0%     +14.9%      44516 =C2=B1  3%  slabinfo.shmem_inod=
e_cache.active_objs
    799.67 =C2=B1  0%     +15.0%     919.67 =C2=B1  3%  slabinfo.shmem_inod=
e_cache.active_slabs
     39214 =C2=B1  0%     +15.0%      45090 =C2=B1  3%  slabinfo.shmem_inod=
e_cache.num_objs
    799.67 =C2=B1  0%     +15.0%     919.67 =C2=B1  3%  slabinfo.shmem_inod=
e_cache.num_slabs
      8815 =C2=B1  2%     +20.7%      10642 =C2=B1  1%  slabinfo.sighand_ca=
che.active_objs
    610.67 =C2=B1  2%     +17.6%     718.33 =C2=B1  1%  slabinfo.sighand_ca=
che.active_slabs
      9167 =C2=B1  2%     +17.6%      10778 =C2=B1  1%  slabinfo.sighand_ca=
che.num_objs
    610.67 =C2=B1  2%     +17.6%     718.33 =C2=B1  1%  slabinfo.sighand_ca=
che.num_slabs
     16257 =C2=B1  1%     +16.1%      18868 =C2=B1  2%  slabinfo.signal_cac=
he.active_objs
     16613 =C2=B1  1%     +17.4%      19512 =C2=B1  2%  slabinfo.signal_cac=
he.num_objs
      4120 =C2=B1  1%    +209.5%      12750 =C2=B1  2%  slabinfo.task_struc=
t.active_objs
      1428 =C2=B1  0%    +201.3%       4304 =C2=B1  2%  slabinfo.task_struc=
t.active_slabs
      4287 =C2=B1  0%    +201.2%      12913 =C2=B1  2%  slabinfo.task_struc=
t.num_objs
      1428 =C2=B1  0%    +201.3%       4304 =C2=B1  2%  slabinfo.task_struc=
t.num_slabs
      9460 =C2=B1  5%     -13.0%       8228 =C2=B1  0%  slabinfo.tw_sock_TC=
P.active_objs
      9460 =C2=B1  5%     -13.0%       8228 =C2=B1  0%  slabinfo.tw_sock_TC=
P.num_objs
      0.00 =C2=B1 -1%      +Inf%      40.39 =C2=B1  9%  perf-profile.____fp=
ut.task_work_run.exit_to_usermode_loop.syscall_return_slowpath.entry_SYSCAL=
L_64_fastpath
      3.16 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  perf-profile.__do_p=
age_fault.do_page_fault.page_fault
      1.15 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  perf-profile.__do_s=
oftirq.irq_exit.scheduler_ipi.smp_reschedule_interrupt.reschedule_interrupt
      0.00 =C2=B1 -1%      +Inf%      40.39 =C2=B1  9%  perf-profile.__fput=
.____fput.task_work_run.exit_to_usermode_loop.syscall_return_slowpath
      0.95 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  perf-profile.__libc=
_fork
      1.57 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  perf-profile._do_fo=
rk.sys_clone.do_syscall_64.return_from_SYSCALL_64
      0.00 =C2=B1 -1%      +Inf%       3.69 =C2=B1  8%  perf-profile._raw_s=
pin_lock.dcache_dir_close.__fput.____fput.task_work_run
      0.00 =C2=B1 -1%      +Inf%      47.51 =C2=B1 16%  perf-profile._raw_s=
pin_lock.dcache_readdir.iterate_dir.sys_getdents.entry_SYSCALL_64_fastpath
     18.57 =C2=B1 13%     -95.4%       0.86 =C2=B1  8%  perf-profile._raw_s=
pin_lock.iterate_dir.sys_getdents.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      26.77 =C2=B1 10%  perf-profile._raw_s=
pin_trylock.dput.dcache_dir_close.__fput.____fput
      1.50 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  perf-profile.call_c=
puidle.cpu_startup_entry.rest_init.start_kernel.x86_64_start_reservations
     23.62 =C2=B1  0%     -88.3%       2.77 =C2=B1  5%  perf-profile.call_c=
puidle.cpu_startup_entry.start_secondary
      9.82 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.call_r=
wsem_down_write_failed.down_write.dcache_dir_lseek.sys_lseek.entry_SYSCALL_=
64_fastpath
     20.75 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  perf-profile.call_r=
wsem_down_write_failed.down_write.iterate_dir.sys_getdents.entry_SYSCALL_64=
_fastpath
      0.77 =C2=B1 36%    -100.0%       0.00 =C2=B1 -1%  perf-profile.copy_p=
rocess.part.30._do_fork.sys_clone.do_syscall_64.return_from_SYSCALL_64
      1.51 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu_st=
artup_entry.rest_init.start_kernel.x86_64_start_reservations.x86_64_start_k=
ernel
     24.62 =C2=B1  1%     -88.6%       2.81 =C2=B1  4%  perf-profile.cpu_st=
artup_entry.start_secondary
      0.00 =C2=B1 -1%      +Inf%       5.70 =C2=B1 70%  perf-profile.cpu_st=
opper_thread.smpboot_thread_fn.kthread.ret_from_fork
      1.49 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpuidl=
e_enter.call_cpuidle.cpu_startup_entry.rest_init.start_kernel
     23.61 =C2=B1  0%     -88.3%       2.77 =C2=B1  5%  perf-profile.cpuidl=
e_enter.call_cpuidle.cpu_startup_entry.start_secondary
     23.40 =C2=B1  0%     -88.2%       2.76 =C2=B1  4%  perf-profile.cpuidl=
e_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_secondary
      0.00 =C2=B1 -1%      +Inf%      40.38 =C2=B1  9%  perf-profile.dcache=
_dir_close.__fput.____fput.task_work_run.exit_to_usermode_loop
      9.91 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.dcache=
_dir_lseek.sys_lseek.entry_SYSCALL_64_fastpath
      1.27 =C2=B1  6%   +3652.1%      47.78 =C2=B1 15%  perf-profile.dcache=
_readdir.iterate_dir.sys_getdents.entry_SYSCALL_64_fastpath
      2.84 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  perf-profile.do_exe=
cveat_common.isra.38.sys_execve.do_syscall_64.return_from_SYSCALL_64
      1.67 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  perf-profile.do_exe=
cveat_common.isra.38.sys_execve.do_syscall_64.return_from_SYSCALL_64.execve
      1.50 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  perf-profile.do_exi=
t.do_group_exit.sys_exit_group.entry_SYSCALL_64_fastpath
      1.22 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  perf-profile.do_fil=
p_open.do_sys_open.sys_creat.entry_SYSCALL_64_fastpath
      1.50 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  perf-profile.do_gro=
up_exit.sys_exit_group.entry_SYSCALL_64_fastpath
      1.20 =C2=B1 29%    -100.0%       0.00 =C2=B1 -1%  perf-profile.do_mun=
map.sys_brk.entry_SYSCALL_64_fastpath
      3.19 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  perf-profile.do_pag=
e_fault.page_fault
      1.33 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  perf-profile.do_sys=
_open.sys_creat.entry_SYSCALL_64_fastpath
      4.59 =C2=B1  7%     -96.1%       0.18 =C2=B1141%  perf-profile.do_sys=
call_64.return_from_SYSCALL_64
      1.68 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  perf-profile.do_sys=
call_64.return_from_SYSCALL_64.execve
      9.83 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.down_w=
rite.dcache_dir_lseek.sys_lseek.entry_SYSCALL_64_fastpath
     20.77 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  perf-profile.down_w=
rite.iterate_dir.sys_getdents.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      36.20 =C2=B1  9%  perf-profile.dput.d=
cache_dir_close.__fput.____fput.task_work_run
     58.93 =C2=B1  2%     +52.4%      89.80 =C2=B1  4%  perf-profile.entry_=
SYSCALL_64_fastpath
      1.69 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  perf-profile.execve
      1.12 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  perf-profile.exit_m=
map.mmput.do_exit.do_group_exit.sys_exit_group
      0.00 =C2=B1 -1%      +Inf%      40.41 =C2=B1  9%  perf-profile.exit_t=
o_usermode_loop.syscall_return_slowpath.entry_SYSCALL_64_fastpath
      0.90 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  perf-profile.filema=
p_map_pages.handle_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault
      2.82 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  perf-profile.handle=
_mm_fault.__do_page_fault.do_page_fault.page_fault
      2.45 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  perf-profile.handle=
_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
     21.93 =C2=B1  5%     -88.0%       2.64 =C2=B1  3%  perf-profile.intel_=
idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry
      1.18 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  perf-profile.irq_ex=
it.scheduler_ipi.smp_reschedule_interrupt.reschedule_interrupt.cpuidle_enter
      1.17 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  perf-profile.load_e=
lf_binary.search_binary_handler.do_execveat_common.isra.38.sys_execve.do_sy=
scall_64
      0.00 =C2=B1 -1%      +Inf%       3.88 =C2=B1  8%  perf-profile.lockre=
f_put_return.dput.dcache_dir_close.__fput.____fput
      1.12 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  perf-profile.mmput.=
do_exit.do_group_exit.sys_exit_group.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%       5.69 =C2=B1 70%  perf-profile.multi_=
cpu_stop.cpu_stopper_thread.smpboot_thread_fn.kthread.ret_from_fork
      0.00 =C2=B1 -1%      +Inf%      47.42 =C2=B1 16%  perf-profile.native=
_queued_spin_lock_slowpath._raw_spin_lock.dcache_readdir.iterate_dir.sys_ge=
tdents
      3.94 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  perf-profile.osq_lo=
ck.rwsem_down_write_failed.call_rwsem_down_write_failed.down_write.dcache_d=
ir_lseek
      6.91 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  perf-profile.osq_lo=
ck.rwsem_down_write_failed.call_rwsem_down_write_failed.down_write.iterate_=
dir
      3.21 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  perf-profile.page_f=
ault
      1.20 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  perf-profile.path_o=
penat.do_filp_open.do_sys_open.sys_creat.entry_SYSCALL_64_fastpath
      1.18 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  perf-profile.resche=
dule_interrupt.cpuidle_enter.call_cpuidle.cpu_startup_entry.rest_init
      1.51 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  perf-profile.rest_i=
nit.start_kernel.x86_64_start_reservations.x86_64_start_kernel
      4.60 =C2=B1  7%     -96.1%       0.18 =C2=B1141%  perf-profile.return=
_from_SYSCALL_64
      1.68 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  perf-profile.return=
_from_SYSCALL_64.execve
      1.14 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  perf-profile.run_re=
balance_domains.__do_softirq.irq_exit.scheduler_ipi.smp_reschedule_interrupt
      9.82 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.rwsem_=
down_write_failed.call_rwsem_down_write_failed.down_write.dcache_dir_lseek.=
sys_lseek
     20.75 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  perf-profile.rwsem_=
down_write_failed.call_rwsem_down_write_failed.down_write.iterate_dir.sys_g=
etdents
      5.79 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  perf-profile.rwsem_=
spin_on_owner.rwsem_down_write_failed.call_rwsem_down_write_failed.down_wri=
te.dcache_dir_lseek
     13.64 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  perf-profile.rwsem_=
spin_on_owner.rwsem_down_write_failed.call_rwsem_down_write_failed.down_wri=
te.iterate_dir
      1.18 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  perf-profile.schedu=
ler_ipi.smp_reschedule_interrupt.reschedule_interrupt.cpuidle_enter.call_cp=
uidle
      1.17 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  perf-profile.search=
_binary_handler.do_execveat_common.isra.38.sys_execve.do_syscall_64.return_=
from_SYSCALL_64
      1.18 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  perf-profile.smp_re=
schedule_interrupt.reschedule_interrupt.cpuidle_enter.call_cpuidle.cpu_star=
tup_entry
      0.17 =C2=B1141%   +3328.0%       5.71 =C2=B1 70%  perf-profile.smpboo=
t_thread_fn.kthread.ret_from_fork
      1.51 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  perf-profile.start_=
kernel.x86_64_start_reservations.x86_64_start_kernel
     24.70 =C2=B1  1%     -88.6%       2.81 =C2=B1  4%  perf-profile.start_=
secondary
      1.43 =C2=B1 29%    -100.0%       0.00 =C2=B1 -1%  perf-profile.sys_br=
k.entry_SYSCALL_64_fastpath
      1.60 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  perf-profile.sys_cl=
one.do_syscall_64.return_from_SYSCALL_64
      1.35 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  perf-profile.sys_cr=
eat.entry_SYSCALL_64_fastpath
      2.88 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  perf-profile.sys_ex=
ecve.do_syscall_64.return_from_SYSCALL_64
      1.68 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  perf-profile.sys_ex=
ecve.do_syscall_64.return_from_SYSCALL_64.execve
      1.50 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  perf-profile.sys_ex=
it_group.entry_SYSCALL_64_fastpath
      9.92 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.sys_ls=
eek.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      40.41 =C2=B1  9%  perf-profile.syscal=
l_return_slowpath.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      40.39 =C2=B1  9%  perf-profile.task_w=
ork_run.exit_to_usermode_loop.syscall_return_slowpath.entry_SYSCALL_64_fast=
path
      0.83 =C2=B1 28%    -100.0%       0.00 =C2=B1 -1%  perf-profile.unmap_=
region.do_munmap.sys_brk.entry_SYSCALL_64_fastpath
      1.51 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  perf-profile.x86_64=
_start_kernel
      1.51 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  perf-profile.x86_64=
_start_reservations.x86_64_start_kernel
    829.37 =C2=B1 93%  +4.5e+05%    3712300 =C2=B1 15%  sched_debug.cfs_rq:=
/.MIN_vruntime.avg
    119429 =C2=B1 93%  +19512.3%   23422909 =C2=B1  9%  sched_debug.cfs_rq:=
/.MIN_vruntime.max
      9917 =C2=B1 93%  +71917.5%    7142609 =C2=B1  8%  sched_debug.cfs_rq:=
/.MIN_vruntime.stddev
      3.21 =C2=B1  4%   +6575.4%     214.12 =C2=B1 40%  sched_debug.cfs_rq:=
/.load.avg
    109.00 =C2=B1 15%   +7665.8%       8464 =C2=B1122%  sched_debug.cfs_rq:=
/.load.max
     16.09 =C2=B1 11%   +5426.3%     889.45 =C2=B1 93%  sched_debug.cfs_rq:=
/.load.stddev
     15.28 =C2=B1 40%   +1359.4%     223.01 =C2=B1 38%  sched_debug.cfs_rq:=
/.load_avg.avg
    219.94 =C2=B1 11%   +3713.8%       8388 =C2=B1124%  sched_debug.cfs_rq:=
/.load_avg.max
     39.68 =C2=B1 28%   +2129.6%     884.70 =C2=B1 93%  sched_debug.cfs_rq:=
/.load_avg.stddev
    829.37 =C2=B1 93%  +4.5e+05%    3712300 =C2=B1 15%  sched_debug.cfs_rq:=
/.max_vruntime.avg
    119429 =C2=B1 93%  +19512.3%   23422909 =C2=B1  9%  sched_debug.cfs_rq:=
/.max_vruntime.max
      9917 =C2=B1 93%  +71917.5%    7142609 =C2=B1  8%  sched_debug.cfs_rq:=
/.max_vruntime.stddev
    814966 =C2=B1 17%   +2450.9%   20789003 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.avg
   1390384 =C2=B1 22%   +1767.6%   25967271 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.max
    347827 =C2=B1  5%   +4440.8%   15793966 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.min
    388051 =C2=B1 31%    +499.6%    2326901 =C2=B1  6%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      0.06 =C2=B1 38%    +936.7%       0.65 =C2=B1 15%  sched_debug.cfs_rq:=
/.nr_running.avg
      1.00 =C2=B1  0%    +100.0%       2.00 =C2=B1 10%  sched_debug.cfs_rq:=
/.nr_running.max
      0.21 =C2=B1  4%    +174.3%       0.58 =C2=B1  9%  sched_debug.cfs_rq:=
/.nr_running.stddev
      1.56 =C2=B1  9%  +12856.6%     202.00 =C2=B1 42%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
     66.06 =C2=B1 16%  +12219.4%       8137 =C2=B1125%  sched_debug.cfs_rq:=
/.runnable_load_avg.max
      8.02 =C2=B1 11%  +10565.5%     855.17 =C2=B1 95%  sched_debug.cfs_rq:=
/.runnable_load_avg.stddev
   -505397 =C2=B1-39%    +598.7%   -3531421 =C2=B1 -4%  sched_debug.cfs_rq:=
/.spread0.avg
     70987 =C2=B1 50%   +2221.6%    1648031 =C2=B1 24%  sched_debug.cfs_rq:=
/.spread0.max
   -973130 =C2=B1-32%    +776.3%   -8527672 =C2=B1 -5%  sched_debug.cfs_rq:=
/.spread0.min
    388593 =C2=B1 31%    +499.0%    2327750 =C2=B1  6%  sched_debug.cfs_rq:=
/.spread0.stddev
     82.02 =C2=B1 47%    +514.1%     503.68 =C2=B1 13%  sched_debug.cfs_rq:=
/.util_avg.avg
    825.72 =C2=B1  2%     +23.0%       1015 =C2=B1  0%  sched_debug.cfs_rq:=
/.util_avg.max
    148.13 =C2=B1  6%    +157.7%     381.70 =C2=B1  5%  sched_debug.cfs_rq:=
/.util_avg.stddev
   1000000 =C2=B1  0%     +42.9%    1428578 =C2=B1  2%  sched_debug.cpu.avg=
_idle.max
     45692 =C2=B1  5%    +171.0%     123825 =C2=B1 29%  sched_debug.cpu.avg=
_idle.min
    200593 =C2=B1  1%     +29.5%     259832 =C2=B1  1%  sched_debug.cpu.clo=
ck.avg
    200617 =C2=B1  1%     +29.5%     259876 =C2=B1  1%  sched_debug.cpu.clo=
ck.max
    200562 =C2=B1  1%     +29.5%     259755 =C2=B1  1%  sched_debug.cpu.clo=
ck.min
     14.70 =C2=B1 14%    +120.1%      32.35 =C2=B1 37%  sched_debug.cpu.clo=
ck.stddev
    200593 =C2=B1  1%     +29.5%     259832 =C2=B1  1%  sched_debug.cpu.clo=
ck_task.avg
    200617 =C2=B1  1%     +29.5%     259876 =C2=B1  1%  sched_debug.cpu.clo=
ck_task.max
    200562 =C2=B1  1%     +29.5%     259755 =C2=B1  1%  sched_debug.cpu.clo=
ck_task.min
     14.70 =C2=B1 14%    +120.1%      32.35 =C2=B1 37%  sched_debug.cpu.clo=
ck_task.stddev
      4.43 =C2=B1  4%   +4542.0%     205.65 =C2=B1 41%  sched_debug.cpu.cpu=
_load[0].avg
    232.83 =C2=B1  3%   +3447.2%       8259 =C2=B1123%  sched_debug.cpu.cpu=
_load[0].max
     27.55 =C2=B1  0%   +3070.6%     873.34 =C2=B1 93%  sched_debug.cpu.cpu=
_load[0].stddev
      3.30 =C2=B1 10%   +6122.5%     205.26 =C2=B1 41%  sched_debug.cpu.cpu=
_load[1].avg
    174.61 =C2=B1 16%   +4605.4%       8216 =C2=B1124%  sched_debug.cpu.cpu=
_load[1].max
     19.61 =C2=B1 12%   +4317.9%     866.29 =C2=B1 94%  sched_debug.cpu.cpu=
_load[1].stddev
      2.61 =C2=B1 15%   +7760.5%     204.97 =C2=B1 41%  sched_debug.cpu.cpu=
_load[2].avg
    132.22 =C2=B1 22%   +6105.3%       8204 =C2=B1124%  sched_debug.cpu.cpu=
_load[2].max
     14.56 =C2=B1 17%   +5826.3%     863.13 =C2=B1 94%  sched_debug.cpu.cpu=
_load[2].stddev
      2.20 =C2=B1 16%   +9215.8%     204.90 =C2=B1 41%  sched_debug.cpu.cpu=
_load[3].avg
     99.11 =C2=B1 21%   +8168.8%       8195 =C2=B1124%  sched_debug.cpu.cpu=
_load[3].max
     11.30 =C2=B1 17%   +7522.6%     861.37 =C2=B1 94%  sched_debug.cpu.cpu=
_load[3].stddev
      2.05 =C2=B1 16%   +9928.6%     205.14 =C2=B1 41%  sched_debug.cpu.cpu=
_load[4].avg
     77.39 =C2=B1 15%  +10472.4%       8181 =C2=B1124%  sched_debug.cpu.cpu=
_load[4].max
      9.48 =C2=B1 14%   +8964.4%     859.30 =C2=B1 95%  sched_debug.cpu.cpu=
_load[4].stddev
      4243 =C2=B1 62%    +725.9%      35049 =C2=B1 11%  sched_debug.cpu.cur=
r->pid.avg
     13719 =C2=B1 17%    +114.2%      29382 =C2=B1 10%  sched_debug.cpu.cur=
r->pid.stddev
      3.31 =C2=B1  6%   +6370.5%     214.11 =C2=B1 40%  sched_debug.cpu.loa=
d.avg
    106.78 =C2=B1 13%   +7827.4%       8464 =C2=B1122%  sched_debug.cpu.loa=
d.max
     16.22 =C2=B1 11%   +5384.4%     889.45 =C2=B1 93%  sched_debug.cpu.loa=
d.stddev
    500000 =C2=B1  0%     +53.0%     764948 =C2=B1  1%  sched_debug.cpu.max=
_idle_balance_cost.max
      0.00 =C2=B1  0%      +Inf%      36894 =C2=B1 17%  sched_debug.cpu.max=
_idle_balance_cost.stddev
      0.00 =C2=B1  8%    +339.0%       0.00 =C2=B1 37%  sched_debug.cpu.nex=
t_balance.stddev
     60875 =C2=B1  2%    +180.1%     170518 =C2=B1  0%  sched_debug.cpu.nr_=
load_updates.avg
     78714 =C2=B1  5%    +145.4%     193190 =C2=B1  0%  sched_debug.cpu.nr_=
load_updates.max
     44765 =C2=B1  3%    +231.7%     148501 =C2=B1  0%  sched_debug.cpu.nr_=
load_updates.min
     10794 =C2=B1  7%     +15.2%      12434 =C2=B1  2%  sched_debug.cpu.nr_=
load_updates.stddev
      0.08 =C2=B1 62%   +1154.1%       1.06 =C2=B1 18%  sched_debug.cpu.nr_=
running.avg
      1.83 =C2=B1 64%    +254.5%       6.50 =C2=B1  5%  sched_debug.cpu.nr_=
running.max
      0.29 =C2=B1 42%    +294.9%       1.16 =C2=B1  9%  sched_debug.cpu.nr_=
running.stddev
     62835 =C2=B1 12%     -44.3%      35017 =C2=B1  4%  sched_debug.cpu.nr_=
switches.avg
    127178 =C2=B1 11%     -39.9%      76437 =C2=B1  8%  sched_debug.cpu.nr_=
switches.max
     22006 =C2=B1 13%     -24.2%      16683 =C2=B1 12%  sched_debug.cpu.nr_=
switches.min
     33982 =C2=B1 12%     -63.7%      12339 =C2=B1  4%  sched_debug.cpu.nr_=
switches.stddev
     10.66 =C2=B1 10%     +12.4%      11.98 =C2=B1  4%  sched_debug.cpu.nr_=
uninterruptible.avg
    399.50 =C2=B1 52%    +237.2%       1346 =C2=B1  1%  sched_debug.cpu.nr_=
uninterruptible.max
   -386.89 =C2=B1-56%    +266.6%      -1418 =C2=B1-14%  sched_debug.cpu.nr_=
uninterruptible.min
    270.10 =C2=B1 64%    +153.9%     685.84 =C2=B1  4%  sched_debug.cpu.nr_=
uninterruptible.stddev
    200566 =C2=B1  1%     +29.5%     259792 =C2=B1  1%  sched_debug.cpu_clk
    198070 =C2=B1  1%     +30.0%     257505 =C2=B1  1%  sched_debug.ktime
      0.00 =C2=B1 27%   +2092.7%       0.02 =C2=B1 26%  sched_debug.rt_rq:/=
.rt_time.avg
      0.02 =C2=B1 19%   +3170.6%       0.65 =C2=B1 15%  sched_debug.rt_rq:/=
.rt_time.max
      0.00 =C2=B1 18%   +3180.2%       0.09 =C2=B1 17%  sched_debug.rt_rq:/=
.rt_time.stddev
    200566 =C2=B1  1%     +29.5%     259792 =C2=B1  1%  sched_debug.sched_c=
lk

Best Regards,
Huang, Ying

--===============0778686518525504624==--

