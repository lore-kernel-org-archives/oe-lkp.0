Content-Type: multipart/mixed; boundary="===============9180785455377231633=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [percpu] ace7e70901: aim9.sync_disk_rw.ops_per_sec -2.3% regression
Date: Fri, 07 May 2021 11:06:06 +0800
Message-ID: <20210507030606.GA27263@xsang-OptiPlex-9020>
In-Reply-To: <40632FBD-8874-4B6C-A945-F2EBC96CF12B@fb.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9180785455377231633==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi Roman,
 =

On Thu, May 06, 2021 at 12:54:59AM +0000, Roman Gushchin wrote:
> Ping

sorry for late.

the new patch makes the performance a little better but still has
1.9% regression comparing to
f183324133 ("percpu: implement partial chunk depopulation")

below is detail.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/testtime/=
ucode:
  gcc-9/performance/x86_64-rhel-8.3/debian-10.4-x86_64-20200603.cgz/lkp-knl=
-f1/sync_disk_rw/aim9/300s/0xffff0190

commit: =

  f183324133 ("percpu: implement partial chunk depopulation")
  ace7e70901 ("percpu: use reclaim threshold instead of running for every p=
age")
  0ed3240b17 ("percpu: optimize locking in pcpu_balance_workfn()")

f183324133ea535d ace7e7090137ee996757eb5eebc 0ed3240b17bd155d28f4b837f94 =

---------------- --------------------------- --------------------------- =

         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \  =

    103531            -2.3%     101102            -1.9%     101563        a=
im9.sync_disk_rw.ops_per_sec
    300.12            -0.0%     300.11            -0.0%     300.11        a=
im9.time.elapsed_time
    300.12            -0.0%     300.11            -0.0%     300.11        a=
im9.time.elapsed_time.max
    732.67            +0.4%     735.57            +0.1%     733.43        a=
im9.time.involuntary_context_switches
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    aim9.time.major_page_faults
      2836 =C2=B1  2%      -1.3%       2800 =C2=B1  2%      +0.3%       284=
6 =C2=B1  2%  aim9.time.maximum_resident_set_size
      1187            +0.1%       1187            -0.0%       1186        a=
im9.time.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096        a=
im9.time.page_size
     91.00            +0.2%      91.14            +0.5%      91.43        a=
im9.time.percent_of_cpu_this_job_got
    219.28            -0.5%     218.24            +0.2%     219.69        a=
im9.time.system_time
     55.21            +3.0%      56.87            +1.9%      56.27        a=
im9.time.user_time
     29.50 =C2=B1  6%      -5.6%      27.86 =C2=B1  6%      -2.7%      28.7=
1 =C2=B1  7%  aim9.time.voluntary_context_switches
    380.82            +0.2%     381.57            +0.5%     382.62        u=
ptime.boot
     91562            +0.2%      91788            +0.6%      92131        u=
ptime.idle
     76.55 =C2=B1  2%      +0.7%      77.10 =C2=B1  3%      +2.4%      78.3=
7 =C2=B1  4%  boot-time.boot
     27.14 =C2=B1  3%      +0.7%      27.34            -0.0%      27.14 =C2=
=B1  2%  boot-time.dhcp
     17296 =C2=B1  2%      +1.0%      17474 =C2=B1  3%      +2.6%      1774=
5 =C2=B1  4%  boot-time.idle
      1.96            +1.2%       1.98 =C2=B1  2%      +0.8%       1.97    =
    boot-time.smp_boot
 7.169e+10            -0.0%  7.167e+10            +0.3%  7.193e+10        c=
puidle.C1.time
 1.553e+08            -3.0%  1.506e+08 =C2=B1  7%      -7.1%  1.443e+08 =C2=
=B1 18%  cpuidle.C1.usage
     95169 =C2=B1  6%  +29067.3%   27758401 =C2=B1243%     +16.7%     11106=
8 =C2=B1 21%  cpuidle.POLL.time
      2206 =C2=B1 24%  +18692.6%     414689 =C2=B1243%     +38.7%       305=
9 =C2=B1 59%  cpuidle.POLL.usage
     94.91            +0.1       94.96            +0.2       95.09        m=
pstat.cpu.all.idle%
      4.42            -0.1        4.35            -0.2        4.24 =C2=B1  =
3%  mpstat.cpu.all.irq%
      0.17 =C2=B1  3%      +0.0        0.19 =C2=B1  2%      -0.0        0.1=
6 =C2=B1  6%  mpstat.cpu.all.soft%
      0.35            -0.0        0.35            +0.0        0.35        m=
pstat.cpu.all.sys%
      0.15            +0.0        0.16            +0.0        0.15        m=
pstat.cpu.all.usr%
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-numastat.node0.interleave_hit
   8862949            -2.0%    8683426            -1.7%    8716693        n=
uma-numastat.node0.local_node
   8862894            -2.0%    8683354            -1.7%    8716623        n=
uma-numastat.node0.numa_hit
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-numastat.node1.interleave_hit
      1.17 =C2=B1 76%    +193.9%       3.43 =C2=B1 60%    +255.1%       4.1=
4 =C2=B1 85%  numa-numastat.node1.numa_hit
      1.17 =C2=B1 76%    +193.9%       3.43 =C2=B1 60%    +255.1%       4.1=
4 =C2=B1 85%  numa-numastat.node1.other_node
     94.00            +0.0%      94.00            +0.0%      94.00        v=
mstat.cpu.id
      5.00            +0.0%       5.00            -5.7%       4.71 =C2=B1  =
9%  vmstat.cpu.sy
      0.00          -100.0%       0.00          -100.0%       0.00        v=
mstat.cpu.us
      0.00          -100.0%       0.00          -100.0%       0.00        v=
mstat.io.bi
    544.67 =C2=B1 10%      +4.8%     570.86 =C2=B1 19%      +3.4%     563.4=
3 =C2=B1 12%  vmstat.memory.buff
   1132342            -0.0%    1131884            -0.0%    1132148        v=
mstat.memory.cache
 1.041e+08            +0.0%  1.041e+08            -0.0%  1.041e+08        v=
mstat.memory.free
      1.00            +0.0%       1.00            +0.0%       1.00        v=
mstat.procs.r
      2580            -0.1%       2577            +0.4%       2591        v=
mstat.system.cs
    511107            -2.2%     499679 =C2=B1  5%      -7.1%     474682 =C2=
=B1 18%  vmstat.system.in
    300.12            -0.0%     300.11            -0.0%     300.11        t=
ime.elapsed_time
    300.12            -0.0%     300.11            -0.0%     300.11        t=
ime.elapsed_time.max
    732.67            +0.4%     735.57            +0.1%     733.43        t=
ime.involuntary_context_switches
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    time.major_page_faults
      2836 =C2=B1  2%      -1.3%       2800 =C2=B1  2%      +0.3%       284=
6 =C2=B1  2%  time.maximum_resident_set_size
      1187            +0.1%       1187            -0.0%       1186        t=
ime.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096        t=
ime.page_size
     91.00            +0.2%      91.14            +0.5%      91.43        t=
ime.percent_of_cpu_this_job_got
    219.28            -0.5%     218.24            +0.2%     219.69        t=
ime.system_time
     55.21            +3.0%      56.87            +1.9%      56.27        t=
ime.user_time
     29.50 =C2=B1  6%      -5.6%      27.86 =C2=B1  6%      -2.7%      28.7=
1 =C2=B1  7%  time.voluntary_context_switches
    120.33            -0.4%     119.86            -4.6%     114.86 =C2=B1  =
9%  turbostat.Avg_MHz
      8.61            -0.0        8.58            -0.4        8.21 =C2=B1  =
9%  turbostat.Busy%
      1400            +0.0%       1400            +0.0%       1400        t=
urbostat.Bzy_MHz
 1.552e+08            -3.0%  1.505e+08 =C2=B1  7%      -7.1%  1.442e+08 =C2=
=B1 18%  turbostat.C1
     92.77            -0.0       92.73            +0.3       93.09        t=
urbostat.C1%
     91.39            +0.0%      91.42            +0.4%      91.79        t=
urbostat.CPU%c1
     61.50            -0.8%      61.00            -1.3%      60.71        t=
urbostat.CoreTmp
 1.546e+08            -2.2%  1.512e+08 =C2=B1  5%      -7.1%  1.436e+08 =C2=
=B1 18%  turbostat.IRQ
     66.00            +0.4%      66.29            -0.4%      65.71        t=
urbostat.PkgTmp
    110.87            -0.0%     110.83            +0.0%     110.88        t=
urbostat.PkgWatt
      2.39 =C2=B1  5%      +2.7%       2.45 =C2=B1  7%     -15.9%       2.0=
1 =C2=B1 17%  turbostat.RAMWatt
      1297            +0.0%       1297            +0.0%       1297        t=
urbostat.TSC_MHz
     26815            -0.6%      26663            -1.5%      26426 =C2=B1  =
3%  meminfo.Active
     26267            -0.7%      26089            -1.6%      25859 =C2=B1  =
3%  meminfo.Active(anon)
    548.67 =C2=B1 10%      +4.8%     574.86 =C2=B1 19%      +3.4%     567.4=
3 =C2=B1 12%  meminfo.Active(file)
    191276            -1.0%     189282 =C2=B1  3%      +0.0%     191289    =
    meminfo.AnonHugePages
    251007            +0.1%     251224            +0.2%     251421        m=
eminfo.AnonPages
    544.67 =C2=B1 10%      +4.8%     570.86 =C2=B1 19%      +3.4%     563.4=
3 =C2=B1 12%  meminfo.Buffers
   1006852            -0.0%    1006628            -0.0%    1006418        m=
eminfo.Cached
    200520            +0.0%     200520            +0.0%     200520        m=
eminfo.CmaFree
    204800            +0.0%     204800            +0.0%     204800        m=
eminfo.CmaTotal
  53537336            +0.0%   53537340            +0.0%   53537336        m=
eminfo.CommitLimit
    368947            -0.0%     368817            -0.1%     368665        m=
eminfo.Committed_AS
 1.003e+08            +0.2%  1.005e+08            -0.4%   99914313        m=
eminfo.DirectMap1G
   9237504 =C2=B1  5%      -2.3%    9027876 =C2=B1  4%      +4.1%    961448=
2 =C2=B1  5%  meminfo.DirectMap2M
   1492529 =C2=B1  7%      +0.7%    1502428 =C2=B1  7%      +1.5%    151500=
8 =C2=B1  8%  meminfo.DirectMap4k
      0.00          -100.0%       0.00          -100.0%       0.00        m=
eminfo.Dirty
      2048            +0.0%       2048            +0.0%       2048        m=
eminfo.Hugepagesize
    264495            +0.1%     264854            +0.3%     265324        m=
eminfo.Inactive
    264495            +0.1%     264854            +0.3%     265324        m=
eminfo.Inactive(anon)
    125481            -0.3%     125131            +0.1%     125665        m=
eminfo.KReclaimable
     34771            -0.2%      34693            -0.1%      34729        m=
eminfo.KernelStack
     31799            -0.3%      31689            +0.1%      31836        m=
eminfo.Mapped
 1.035e+08            +0.0%  1.035e+08            -0.0%  1.035e+08        m=
eminfo.MemAvailable
 1.041e+08            +0.0%  1.041e+08            -0.0%  1.041e+08        m=
eminfo.MemFree
 1.071e+08            +0.0%  1.071e+08            +0.0%  1.071e+08        m=
eminfo.MemTotal
   2965112            -0.1%    2963540            +0.0%    2966167        m=
eminfo.Memused
    685.67 =C2=B1129%     +26.3%     865.86 =C2=B1107%     +26.5%     867.5=
7 =C2=B1107%  meminfo.Mlocked
      4233            +0.4%       4249            +0.7%       4265        m=
eminfo.PageTables
    123600            +0.7%     124526            +0.5%     124251        m=
eminfo.Percpu
    125481            -0.3%     125131            +0.1%     125665        m=
eminfo.SReclaimable
    303579            +0.3%     304346            +0.6%     305416        m=
eminfo.SUnreclaim
     40042            -0.6%      39816            -1.1%      39583 =C2=B1  =
2%  meminfo.Shmem
    429061            +0.1%     429478            +0.5%     431082        m=
eminfo.Slab
    966908            +0.0%     966935            +0.0%     966961        m=
eminfo.Unevictable
 3.436e+10            +0.0%  3.436e+10            +0.0%  3.436e+10        m=
eminfo.VmallocTotal
    230733            -0.0%     230658            +0.1%     231045        m=
eminfo.VmallocUsed
   3996086            -0.1%    3994006            -0.0%    3994530        m=
eminfo.max_used_kB
     26858            -0.6%      26689            -1.7%      26401 =C2=B1  =
3%  numa-meminfo.node0.Active
     26309            -0.7%      26114            -1.8%      25833 =C2=B1  =
3%  numa-meminfo.node0.Active(anon)
    548.67 =C2=B1 10%      +4.8%     574.86 =C2=B1 19%      +3.4%     567.4=
3 =C2=B1 12%  numa-meminfo.node0.Active(file)
    191320            -1.0%     189364 =C2=B1  3%      +0.0%     191355    =
    numa-meminfo.node0.AnonHugePages
    251001            +0.1%     251233            +0.2%     251424        n=
uma-meminfo.node0.AnonPages
    308912            +0.1%     309116            +0.3%     309956        n=
uma-meminfo.node0.AnonPages.max
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-meminfo.node0.Dirty
    544628            -0.0%     544465            -0.1%     544187        n=
uma-meminfo.node0.FilePages
    264479            +0.2%     264889            +0.3%     265337        n=
uma-meminfo.node0.Inactive
    264479            +0.2%     264889            +0.3%     265337        n=
uma-meminfo.node0.Inactive(anon)
    108211            +0.5%     108793            +0.9%     109226        n=
uma-meminfo.node0.KReclaimable
     34759            -0.2%      34686            -0.1%      34720        n=
uma-meminfo.node0.KernelStack
     19390            -0.3%      19328            +0.1%      19402        n=
uma-meminfo.node0.Mapped
  96447669            +0.0%   96448315            -0.0%   96445999        n=
uma-meminfo.node0.MemFree
  98862596            +0.0%   98862596            +0.0%   98862596        n=
uma-meminfo.node0.MemTotal
   2414925            -0.0%    2414279            +0.1%    2416596        n=
uma-meminfo.node0.MemUsed
    395.33 =C2=B1128%     +26.0%     498.14 =C2=B1106%     +26.0%     498.0=
0 =C2=B1106%  numa-meminfo.node0.Mlocked
      4233            +0.2%       4243            +0.7%       4261        n=
uma-meminfo.node0.PageTables
    108211            +0.5%     108793            +0.9%     109226        n=
uma-meminfo.node0.SReclaimable
    292030            +0.1%     292224            +0.6%     293732        n=
uma-meminfo.node0.SUnreclaim
     40066            -0.5%      39855            -1.2%      39574 =C2=B1  =
2%  numa-meminfo.node0.Shmem
    400242            +0.2%     401017            +0.7%     402959        n=
uma-meminfo.node0.Slab
    504116            +0.0%     504166            +0.0%     504176        n=
uma-meminfo.node0.Unevictable
    462792            -0.0%     462769            -0.0%     462785        n=
uma-meminfo.node1.FilePages
     17280 =C2=B1  6%      -5.4%      16346 =C2=B1  8%      -4.8%      1644=
8 =C2=B1  4%  numa-meminfo.node1.KReclaimable
     10.67 =C2=B1 70%     -57.1%       4.57 =C2=B1158%     -57.1%       4.5=
7 =C2=B1158%  numa-meminfo.node1.KernelStack
     12442            -0.2%      12421            +0.4%      12495        n=
uma-meminfo.node1.Mapped
   7662516            +0.0%    7662921            +0.0%    7663256        n=
uma-meminfo.node1.MemFree
   8212076            +0.0%    8212088            +0.0%    8212076        n=
uma-meminfo.node1.MemTotal
    549558            -0.1%     549165            -0.1%     548818        n=
uma-meminfo.node1.MemUsed
    294.67 =C2=B1129%     +25.8%     370.71 =C2=B1107%     +26.6%     373.0=
0 =C2=B1107%  numa-meminfo.node1.Mlocked
      4.00            +0.0%       4.00            +0.0%       4.00        n=
uma-meminfo.node1.PageTables
     17280 =C2=B1  6%      -5.4%      16346 =C2=B1  8%      -4.8%      1644=
8 =C2=B1  4%  numa-meminfo.node1.SReclaimable
     11552 =C2=B1  7%      +4.9%      12122 =C2=B1 10%      +1.1%      1168=
1 =C2=B1 14%  numa-meminfo.node1.SUnreclaim
     28832 =C2=B1  5%      -1.3%      28469 =C2=B1  7%      -2.4%      2812=
9 =C2=B1  7%  numa-meminfo.node1.Slab
    462792            -0.0%     462769            -0.0%     462785        n=
uma-meminfo.node1.Unevictable
      6580            -0.7%       6532            -1.7%       6468 =C2=B1  =
3%  numa-vmstat.node0.nr_active_anon
    137.17 =C2=B1 10%      +4.8%     143.71 =C2=B1 19%      +3.4%     141.8=
6 =C2=B1 12%  numa-vmstat.node0.nr_active_file
     62768            +0.1%      62817            +0.2%      62865        n=
uma-vmstat.node0.nr_anon_pages
     93.00            -1.1%      92.00 =C2=B1  4%      -0.2%      92.86    =
    numa-vmstat.node0.nr_anon_transparent_hugepages
     18.00 =C2=B1 18%     +11.9%      20.14 =C2=B1 25%      +3.2%      18.5=
7 =C2=B1 18%  numa-vmstat.node0.nr_dirtied
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-vmstat.node0.nr_dirty
    136167            -0.0%     136118            -0.1%     136056        n=
uma-vmstat.node0.nr_file_pages
     50130            +0.0%      50130            +0.0%      50130        n=
uma-vmstat.node0.nr_free_cma
  24111954            +0.0%   24112004            -0.0%   24111486        n=
uma-vmstat.node0.nr_free_pages
     66141            +0.1%      66223            +0.3%      66341        n=
uma-vmstat.node0.nr_inactive_anon
      0.00          -100.0%       0.00       +2.9e+101%       0.29 =C2=B115=
8%  numa-vmstat.node0.nr_isolated_anon
     34756            -0.2%      34686            -0.1%      34721        n=
uma-vmstat.node0.nr_kernel_stack
      4974            -0.5%       4948            -0.1%       4968        n=
uma-vmstat.node0.nr_mapped
     97.83 =C2=B1130%     +26.7%     124.00 =C2=B1107%     +26.7%     124.0=
0 =C2=B1107%  numa-vmstat.node0.nr_mlock
      1056            +0.3%       1059            +0.8%       1064        n=
uma-vmstat.node0.nr_page_table_pages
     10026            -0.6%       9965            -1.2%       9902 =C2=B1  =
2%  numa-vmstat.node0.nr_shmem
     27051            +0.5%      27196            +0.9%      27305        n=
uma-vmstat.node0.nr_slab_reclaimable
     73006            +0.1%      73056            +0.6%      73433        n=
uma-vmstat.node0.nr_slab_unreclaimable
    126028            +0.0%     126041            +0.0%     126043        n=
uma-vmstat.node0.nr_unevictable
     17.00 =C2=B1 19%     +12.6%      19.14 =C2=B1 27%      +3.4%      17.5=
7 =C2=B1 19%  numa-vmstat.node0.nr_written
      6581            -0.8%       6528            -1.7%       6468 =C2=B1  =
3%  numa-vmstat.node0.nr_zone_active_anon
    137.17 =C2=B1 10%      +4.8%     143.71 =C2=B1 19%      +3.4%     141.8=
6 =C2=B1 12%  numa-vmstat.node0.nr_zone_active_file
     66141            +0.1%      66223            +0.3%      66342        n=
uma-vmstat.node0.nr_zone_inactive_anon
    126028            +0.0%     126041            +0.0%     126043        n=
uma-vmstat.node0.nr_zone_unevictable
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-vmstat.node0.nr_zone_write_pending
   6428805            -1.4%    6337885            -1.0%    6366183        n=
uma-vmstat.node0.numa_hit
    132774            +0.1%     132843            +0.0%     132784        n=
uma-vmstat.node0.numa_interleave
   6428824            -1.4%    6337903            -1.0%    6366202        n=
uma-vmstat.node0.numa_local
    115698            -0.0%     115692            -0.0%     115696        n=
uma-vmstat.node1.nr_file_pages
   1915628            +0.0%    1915730            +0.0%    1915814        n=
uma-vmstat.node1.nr_free_pages
     10.67 =C2=B1 70%     -57.1%       4.57 =C2=B1158%     -57.1%       4.5=
7 =C2=B1158%  numa-vmstat.node1.nr_kernel_stack
      3108            -0.1%       3104            +0.5%       3122        n=
uma-vmstat.node1.nr_mapped
     73.00 =C2=B1130%     +26.2%      92.14 =C2=B1107%     +26.8%      92.5=
7 =C2=B1107%  numa-vmstat.node1.nr_mlock
      1.00            +0.0%       1.00            +0.0%       1.00        n=
uma-vmstat.node1.nr_page_table_pages
      4320 =C2=B1  6%      -5.4%       4086 =C2=B1  8%      -4.8%       411=
2 =C2=B1  4%  numa-vmstat.node1.nr_slab_reclaimable
      2887 =C2=B1  7%      +4.9%       3030 =C2=B1 10%      +1.1%       292=
0 =C2=B1 14%  numa-vmstat.node1.nr_slab_unreclaimable
    115698            -0.0%     115692            -0.0%     115696        n=
uma-vmstat.node1.nr_unevictable
    115698            -0.0%     115692            -0.0%     115696        n=
uma-vmstat.node1.nr_zone_unevictable
    132956            -0.0%     132916            +0.0%     132965        n=
uma-vmstat.node1.numa_hit
    132912            -0.0%     132869            +0.0%     132921        n=
uma-vmstat.node1.numa_interleave
    132956            -0.0%     132916            +0.0%     132965        n=
uma-vmstat.node1.numa_other
     37.99 =C2=B1  2%      -1.3%      37.50 =C2=B1  3%      -0.2%      37.9=
1 =C2=B1  7%  perf-stat.i.MPKI
   5.6e+08 =C2=B1  2%      +2.9%  5.763e+08 =C2=B1  2%      -1.0%  5.545e+0=
8 =C2=B1 10%  perf-stat.i.branch-instructions
      7.63 =C2=B1  2%      +0.4        7.99            +0.2        7.83 =C2=
=B1  4%  perf-stat.i.branch-miss-rate%
  42664479 =C2=B1  4%      +7.7%   45940583 =C2=B1  4%      +2.0%   4352706=
7 =C2=B1 14%  perf-stat.i.branch-misses
     16.71            -0.5       16.18            -0.7       16.02 =C2=B1  =
5%  perf-stat.i.cache-miss-rate%
  16470516            -1.4%   16231807            -5.6%   15551526 =C2=B1  =
9%  perf-stat.i.cache-misses
  98614944            +1.8%  1.004e+08            -1.8%   96876155 =C2=B1  =
4%  perf-stat.i.cache-references
      2519            -0.2%       2514            +0.4%       2530        p=
erf-stat.i.context-switches
      8.36            -3.0%       8.11            -5.8%       7.88 =C2=B1  =
5%  perf-stat.i.cpi
    255996            -0.0%     255993            -0.0%     255994        p=
erf-stat.i.cpu-clock
 2.171e+10            +0.0%  2.171e+10            -6.1%   2.04e+10 =C2=B1 1=
4%  perf-stat.i.cpu-cycles
    281.13            +0.1%     281.44            +0.2%     281.75        p=
erf-stat.i.cpu-migrations
      1319 =C2=B1  2%      +1.5%       1339            -1.1%       1305 =C2=
=B1  5%  perf-stat.i.cycles-between-cache-misses
      2.11 =C2=B1  2%      -0.0        2.06 =C2=B1  3%      -0.1        2.0=
3 =C2=B1  4%  perf-stat.i.iTLB-load-miss-rate%
  55721706            +0.8%   56151244 =C2=B1  3%      -4.3%   53299894 =C2=
=B1 13%  perf-stat.i.iTLB-load-misses
 2.654e+09 =C2=B1  2%      +3.0%  2.733e+09 =C2=B1  2%      -0.8%  2.632e+0=
9 =C2=B1 10%  perf-stat.i.iTLB-loads
 2.651e+09 =C2=B1  2%      +2.9%  2.728e+09 =C2=B1  2%      -0.8%  2.629e+0=
9 =C2=B1 10%  perf-stat.i.instructions
     47.53 =C2=B1  2%      +2.2%      48.59 =C2=B1  3%      +4.3%      49.5=
9 =C2=B1  5%  perf-stat.i.instructions-per-iTLB-miss
      0.12            +3.0%       0.13            +6.5%       0.13 =C2=B1  =
6%  perf-stat.i.ipc
      2.35 =C2=B1 34%     +25.4%       2.95 =C2=B1 44%     +65.8%       3.8=
9 =C2=B1 23%  perf-stat.i.major-faults
      0.08            +0.0%       0.08            -6.1%       0.08 =C2=B1 1=
4%  perf-stat.i.metric.GHz
      0.03            -0.1%       0.03            +0.1%       0.03        p=
erf-stat.i.metric.K/sec
     12.94 =C2=B1  2%      +2.9%      13.32 =C2=B1  2%      -0.9%      12.8=
2 =C2=B1 10%  perf-stat.i.metric.M/sec
      2793            -0.1%       2791            -0.1%       2790        p=
erf-stat.i.minor-faults
      2796            -0.1%       2794            -0.1%       2794        p=
erf-stat.i.page-faults
    255996            -0.0%     255993            -0.0%     255994        p=
erf-stat.i.task-clock
     37.18 =C2=B1  2%      -1.1%      36.77 =C2=B1  3%      -0.3%      37.0=
6 =C2=B1  6%  perf-stat.overall.MPKI
      7.61 =C2=B1  2%      +0.4        7.97            +0.2        7.81 =C2=
=B1  4%  perf-stat.overall.branch-miss-rate%
     16.70            -0.5       16.17            -0.7       16.01 =C2=B1  =
5%  perf-stat.overall.cache-miss-rate%
      8.18            -2.8%       7.95            -5.7%       7.72 =C2=B1  =
6%  perf-stat.overall.cpi
      1318 =C2=B1  2%      +1.5%       1337            -1.1%       1304 =C2=
=B1  5%  perf-stat.overall.cycles-between-cache-misses
      2.05 =C2=B1  2%      -0.0        2.01 =C2=B1  3%      -0.1        1.9=
8 =C2=B1  5%  perf-stat.overall.iTLB-load-miss-rate%
     47.66 =C2=B1  2%      +2.2%      48.71 =C2=B1  3%      +4.3%      49.7=
3 =C2=B1  5%  perf-stat.overall.instructions-per-iTLB-miss
      0.12            +2.9%       0.13            +6.5%       0.13 =C2=B1  =
6%  perf-stat.overall.ipc
 5.591e+08 =C2=B1  2%      +2.9%  5.753e+08 =C2=B1  2%      -1.0%  5.535e+0=
8 =C2=B1 10%  perf-stat.ps.branch-instructions
  42584908 =C2=B1  4%      +7.7%   45847160 =C2=B1  4%      +2.0%   4343916=
4 =C2=B1 14%  perf-stat.ps.branch-misses
  16419650            -1.5%   16180804            -5.6%   15503940 =C2=B1  =
9%  perf-stat.ps.cache-misses
  98323595            +1.8%  1.001e+08            -1.8%   96588692 =C2=B1  =
4%  perf-stat.ps.cache-references
      2511            -0.2%       2505            +0.4%       2521        p=
erf-stat.ps.context-switches
    255107            -0.0%     255102            -0.0%     255106        p=
erf-stat.ps.cpu-clock
 2.165e+10            -0.0%  2.165e+10            -6.1%  2.034e+10 =C2=B1 1=
4%  perf-stat.ps.cpu-cycles
    280.62            +0.1%     280.92            +0.2%     281.15        p=
erf-stat.ps.cpu-migrations
  55529179            +0.8%   55955044 =C2=B1  3%      -4.3%   53117006 =C2=
=B1 13%  perf-stat.ps.iTLB-load-misses
  2.65e+09 =C2=B1  2%      +3.0%  2.728e+09 =C2=B1  2%      -0.9%  2.627e+0=
9 =C2=B1 10%  perf-stat.ps.iTLB-loads
 2.646e+09 =C2=B1  2%      +2.9%  2.723e+09 =C2=B1  2%      -0.8%  2.624e+0=
9 =C2=B1 10%  perf-stat.ps.instructions
      2.35 =C2=B1 34%     +25.2%       2.94 =C2=B1 44%     +65.3%       3.8=
8 =C2=B1 23%  perf-stat.ps.major-faults
      2785            -0.1%       2783            -0.1%       2782        p=
erf-stat.ps.minor-faults
      2788            -0.1%       2786            -0.1%       2786        p=
erf-stat.ps.page-faults
    255107            -0.0%     255102            -0.0%     255106        p=
erf-stat.ps.task-clock
 7.954e+11 =C2=B1  2%      +2.9%  8.183e+11 =C2=B1  2%      -0.9%  7.885e+1=
1 =C2=B1 10%  perf-stat.total.instructions
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.compact_isolated
      6576            -0.9%       6520            -1.7%       6466 =C2=B1  =
3%  proc-vmstat.nr_active_anon
    137.17 =C2=B1 10%      +4.8%     143.71 =C2=B1 19%      +3.4%     141.8=
6 =C2=B1 12%  proc-vmstat.nr_active_file
     62747            +0.1%      62801            +0.2%      62846        p=
roc-vmstat.nr_anon_pages
     93.00            -0.9%      92.14 =C2=B1  4%      -0.2%      92.86    =
    proc-vmstat.nr_anon_transparent_hugepages
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.nr_dirtied
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.nr_dirty
   2581622            +0.0%    2581654            -0.0%    2581593        p=
roc-vmstat.nr_dirty_background_threshold
   5169558            +0.0%    5169622            -0.0%    5169499        p=
roc-vmstat.nr_dirty_threshold
    251857            -0.0%     251800            -0.0%     251748        p=
roc-vmstat.nr_file_pages
     50130            +0.0%      50130            +0.0%      50130        p=
roc-vmstat.nr_free_cma
  26027500            +0.0%   26027814            -0.0%   26027203        p=
roc-vmstat.nr_free_pages
     66118            +0.1%      66207            +0.3%      66321        p=
roc-vmstat.nr_inactive_anon
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    proc-vmstat.nr_isolated_anon
     34770            -0.2%      34693            -0.1%      34724        p=
roc-vmstat.nr_kernel_stack
      8077            -0.4%       8048            +0.1%       8086        p=
roc-vmstat.nr_mapped
    172.33 =C2=B1129%     +26.3%     217.57 =C2=B1106%     +25.9%     217.0=
0 =C2=B1107%  proc-vmstat.nr_mlock
      1059            +0.3%       1062            +0.5%       1064        p=
roc-vmstat.nr_page_table_pages
     10018            -0.6%       9955            -1.2%       9898 =C2=B1  =
2%  proc-vmstat.nr_shmem
     31371            -0.3%      31283            +0.1%      31417        p=
roc-vmstat.nr_slab_reclaimable
     75895            +0.3%      76087            +0.6%      76353        p=
roc-vmstat.nr_slab_unreclaimable
    241726            +0.0%     241734            +0.0%     241740        p=
roc-vmstat.nr_unevictable
      1.00            +0.0%       1.00            +0.0%       1.00        p=
roc-vmstat.nr_written
      6577            -0.9%       6520            -1.7%       6466 =C2=B1  =
3%  proc-vmstat.nr_zone_active_anon
    137.17 =C2=B1 10%      +4.8%     143.71 =C2=B1 19%      +3.4%     141.8=
6 =C2=B1 12%  proc-vmstat.nr_zone_active_file
     66118            +0.1%      66207            +0.3%      66321        p=
roc-vmstat.nr_zone_inactive_anon
    241726            +0.0%     241734            +0.0%     241740        p=
roc-vmstat.nr_zone_unevictable
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.nr_zone_write_pending
      3823            -0.6%       3800            +1.9%       3898        p=
roc-vmstat.numa_hint_faults
      3823            -0.6%       3800            +1.9%       3898        p=
roc-vmstat.numa_hint_faults_local
   8878045            -2.0%    8702700            -1.6%    8735667        p=
roc-vmstat.numa_hit
    112.00 =C2=B1 50%     -13.4%      97.00 =C2=B1 54%     +51.9%     170.1=
4 =C2=B1  2%  proc-vmstat.numa_huge_pte_updates
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.numa_interleave
   8878044            -2.0%    8702696            -1.6%    8735663        p=
roc-vmstat.numa_local
      1.50 =C2=B1 74%    +138.1%       3.57 =C2=B1 55%    +195.2%       4.4=
3 =C2=B1 87%  proc-vmstat.numa_other
     63282 =C2=B1 46%     -12.9%      55142 =C2=B1 49%     +46.9%      9298=
3 =C2=B1  2%  proc-vmstat.numa_pte_updates
    515593            -2.3%     503677            -1.9%     505820        p=
roc-vmstat.pgactivate
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.pgalloc_dma
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.pgalloc_dma32
   8967593            -2.0%    8788379            -1.6%    8821208        p=
roc-vmstat.pgalloc_normal
    878257            +0.2%     879837            +0.1%     878786        p=
roc-vmstat.pgfault
   8941947            -2.0%    8762451            -1.6%    8795417        p=
roc-vmstat.pgfree
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.pgpgin
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.pgpgout
     50552            -0.2%      50460            -0.1%      50502        p=
roc-vmstat.pgreuse
     73.00 =C2=B1  3%      +0.4%      73.29 =C2=B1  3%      -0.8%      72.4=
3        proc-vmstat.thp_collapse_alloc
      0.50 =C2=B1223%    +100.0%       1.00 =C2=B1130%    +128.6%       1.1=
4 =C2=B1108%  proc-vmstat.thp_deferred_split_page
     42.33            +0.6%      42.57            +0.9%      42.71        p=
roc-vmstat.thp_fault_alloc
      0.50 =C2=B1223%    +100.0%       1.00 =C2=B1130%    +128.6%       1.1=
4 =C2=B1108%  proc-vmstat.thp_split_pmd
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.thp_zero_page_alloc
    105.83            +0.3%     106.14           +10.3%     116.71 =C2=B1 2=
1%  proc-vmstat.unevictable_pgs_culled
    586.00            +0.0%     586.00            +0.0%     586.00        p=
roc-vmstat.unevictable_pgs_mlocked
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.unevictable_pgs_rescued
   2629888            +0.6%    2646966            +0.1%    2632045        p=
roc-vmstat.unevictable_pgs_scanned
      0.00        +2.5e+10%     249.87 =C2=B1244%      +0.0%       0.00    =
    sched_debug.cfs_rq:/.MIN_vruntime.avg
      0.00        +1.3e+12%      13242 =C2=B1244%      +0.0%       0.00    =
    sched_debug.cfs_rq:/.MIN_vruntime.max
      0.00            +0.0%       0.00            +0.0%       0.00        s=
ched_debug.cfs_rq:/.MIN_vruntime.min
      0.00       +1.8e+105%       1801 =C2=B1244%    -100.0%       0.00    =
    sched_debug.cfs_rq:/.MIN_vruntime.stddev
     18405 =C2=B1 12%      +0.7%      18529 =C2=B1  6%      +2.2%      1880=
9 =C2=B1 10%  sched_debug.cfs_rq:/.load.avg
    418300 =C2=B1 11%      +4.8%     438407 =C2=B1  9%     +15.9%     48497=
1 =C2=B1 18%  sched_debug.cfs_rq:/.load.max
     78910 =C2=B1  6%      +2.0%      80514 =C2=B1  6%      +5.3%      8310=
1 =C2=B1  8%  sched_debug.cfs_rq:/.load.stddev
     16.06 =C2=B1 13%      +4.1%      16.72 =C2=B1 10%      +4.7%      16.8=
1 =C2=B1  4%  sched_debug.cfs_rq:/.load_avg.avg
    421.91 =C2=B1  9%     +25.1%     527.64 =C2=B1 13%     +15.0%     485.1=
4 =C2=B1 12%  sched_debug.cfs_rq:/.load_avg.max
     72.62 =C2=B1  5%     +12.0%      81.32 =C2=B1  8%      +6.7%      77.4=
8 =C2=B1  5%  sched_debug.cfs_rq:/.load_avg.stddev
      0.00        +2.5e+10%     249.87 =C2=B1244%      +0.0%       0.00    =
    sched_debug.cfs_rq:/.max_vruntime.avg
      0.00        +1.3e+12%      13242 =C2=B1244%      +0.0%       0.00    =
    sched_debug.cfs_rq:/.max_vruntime.max
      0.00            +0.0%       0.00            +0.0%       0.00        s=
ched_debug.cfs_rq:/.max_vruntime.min
      0.00       +1.8e+105%       1801 =C2=B1244%    -100.0%       0.00    =
    sched_debug.cfs_rq:/.max_vruntime.stddev
    358250 =C2=B1 10%      +4.9%     375743 =C2=B1 11%      +9.3%     39164=
2 =C2=B1  8%  sched_debug.cfs_rq:/.min_vruntime.avg
    442576 =C2=B1  7%      +3.3%     457023 =C2=B1  9%      +6.5%     47120=
6 =C2=B1  6%  sched_debug.cfs_rq:/.min_vruntime.max
    117912 =C2=B1 34%     +12.8%     132991 =C2=B1 32%     +48.9%     17560=
3 =C2=B1 36%  sched_debug.cfs_rq:/.min_vruntime.min
     51761 =C2=B1 10%      +0.9%      52243 =C2=B1 18%      -3.5%      4995=
3 =C2=B1 17%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.05 =C2=B1  9%      -3.7%       0.05 =C2=B1  4%      +0.6%       0.0=
5 =C2=B1  8%  sched_debug.cfs_rq:/.nr_running.avg
      1.00            +0.0%       1.00            +0.0%       1.00        s=
ched_debug.cfs_rq:/.nr_running.max
      0.22 =C2=B1  4%      -1.6%       0.21 =C2=B1  3%      +0.8%       0.2=
2 =C2=B1  4%  sched_debug.cfs_rq:/.nr_running.stddev
      0.01 =C2=B1223%  +10517.9%       0.88 =C2=B1 98%   +3394.3%       0.2=
9 =C2=B1122%  sched_debug.cfs_rq:/.removed.load_avg.avg
      0.86 =C2=B1223%  +12924.1%     112.15 =C2=B1 87%   +7591.1%      66.2=
3 =C2=B1121%  sched_debug.cfs_rq:/.removed.load_avg.max
      0.08 =C2=B1223%  +11044.9%       9.37 =C2=B1 89%   +5097.5%       4.3=
7 =C2=B1121%  sched_debug.cfs_rq:/.removed.load_avg.stddev
      0.01 =C2=B1223%   +4750.0%       0.40 =C2=B1 93%   +1685.5%       0.1=
5 =C2=B1120%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
      0.86 =C2=B1223%   +6262.8%      54.79 =C2=B1 87%   +3831.8%      33.8=
6 =C2=B1119%  sched_debug.cfs_rq:/.removed.runnable_avg.max
      0.08 =C2=B1223%   +5098.9%       4.37 =C2=B1 87%   +2556.4%       2.2=
3 =C2=B1120%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
      0.01 =C2=B1223%   +4750.0%       0.40 =C2=B1 93%   +1685.5%       0.1=
5 =C2=B1120%  sched_debug.cfs_rq:/.removed.util_avg.avg
      0.86 =C2=B1223%   +6262.8%      54.79 =C2=B1 87%   +3831.8%      33.8=
6 =C2=B1119%  sched_debug.cfs_rq:/.removed.util_avg.max
      0.08 =C2=B1223%   +5098.9%       4.37 =C2=B1 87%   +2556.4%       2.2=
3 =C2=B1120%  sched_debug.cfs_rq:/.removed.util_avg.stddev
     45.86 =C2=B1  9%      -3.3%      44.37 =C2=B1  8%      +5.0%      48.1=
7 =C2=B1  5%  sched_debug.cfs_rq:/.runnable_avg.avg
      1024            -0.9%       1015            +0.2%       1027        s=
ched_debug.cfs_rq:/.runnable_avg.max
    191.09 =C2=B1  4%      -1.7%     187.93 =C2=B1  4%      +2.4%     195.6=
7 =C2=B1  2%  sched_debug.cfs_rq:/.runnable_avg.stddev
    127233 =C2=B1 58%     -26.8%      93172 =C2=B1 75%     -14.6%     10868=
4 =C2=B1 59%  sched_debug.cfs_rq:/.spread0.avg
    211559 =C2=B1 35%     -17.5%     174451 =C2=B1 41%     -11.0%     18824=
7 =C2=B1 35%  sched_debug.cfs_rq:/.spread0.max
   -113105           +32.2%    -149579            -5.1%    -107354        s=
ched_debug.cfs_rq:/.spread0.min
     51761 =C2=B1 10%      +0.9%      52243 =C2=B1 18%      -3.5%      4995=
3 =C2=B1 17%  sched_debug.cfs_rq:/.spread0.stddev
     45.79 =C2=B1  9%      -3.5%      44.20 =C2=B1  8%      +4.8%      48.0=
1 =C2=B1  5%  sched_debug.cfs_rq:/.util_avg.avg
      1023            -0.9%       1014            +0.1%       1024        s=
ched_debug.cfs_rq:/.util_avg.max
    190.96 =C2=B1  4%      -1.7%     187.78 =C2=B1  4%      +2.3%     195.3=
7 =C2=B1  2%  sched_debug.cfs_rq:/.util_avg.stddev
     13.16 =C2=B1 11%      -6.4%      12.31 =C2=B1  9%      +5.1%      13.8=
2 =C2=B1  3%  sched_debug.cfs_rq:/.util_est_enqueued.avg
    712.63            -5.9%     670.75 =C2=B1  8%      +0.5%     716.43    =
    sched_debug.cfs_rq:/.util_est_enqueued.max
     87.99 =C2=B1  5%      -5.5%      83.14 =C2=B1  7%      +5.0%      92.3=
9 =C2=B1  2%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
   1317111 =C2=B1  7%      +2.9%    1354705 =C2=B1  8%      +2.7%    135275=
9 =C2=B1  8%  sched_debug.cpu.avg_idle.avg
   4778622 =C2=B1 22%      -7.6%    4413375 =C2=B1 27%     +14.5%    547238=
7 =C2=B1 30%  sched_debug.cpu.avg_idle.max
    324439 =C2=B1 31%      +1.7%     329967 =C2=B1 36%      -3.7%     31247=
7 =C2=B1 23%  sched_debug.cpu.avg_idle.min
    494330 =C2=B1 24%      -9.5%     447434 =C2=B1 21%      +4.4%     51585=
9 =C2=B1 15%  sched_debug.cpu.avg_idle.stddev
    205657 =C2=B1  5%      +0.0%     205662 =C2=B1  5%      -1.6%     20242=
0        sched_debug.cpu.clock.avg
    205845 =C2=B1  5%      +0.0%     205852 =C2=B1  5%      -1.6%     20261=
0        sched_debug.cpu.clock.max
    205461 =C2=B1  5%      +0.0%     205464 =C2=B1  5%      -1.6%     20222=
4        sched_debug.cpu.clock.min
    109.05            +0.6%     109.73            +0.6%     109.74        s=
ched_debug.cpu.clock.stddev
    199388 =C2=B1  5%      +0.1%     199511 =C2=B1  5%      -1.4%     19663=
6        sched_debug.cpu.clock_task.avg
    201330 =C2=B1  5%      +0.0%     201407 =C2=B1  5%      -1.5%     19838=
3        sched_debug.cpu.clock_task.max
    194940 =C2=B1  6%      +0.0%     194974 =C2=B1  5%      -1.4%     19225=
7        sched_debug.cpu.clock_task.min
    848.45 =C2=B1  7%      -0.8%     841.26 =C2=B1  9%     -10.5%     759.2=
4 =C2=B1  8%  sched_debug.cpu.clock_task.stddev
     74.51 =C2=B1  8%     -10.0%      67.05 =C2=B1  8%      -1.8%      73.1=
6 =C2=B1  6%  sched_debug.cpu.curr->pid.avg
      7080 =C2=B1  3%      -0.4%       7055 =C2=B1  3%      -1.5%       697=
3        sched_debug.cpu.curr->pid.max
    621.74 =C2=B1  5%      -4.5%     593.46 =C2=B1  3%      -1.7%     611.2=
8 =C2=B1  3%  sched_debug.cpu.curr->pid.stddev
    687071 =C2=B1  7%      +3.1%     708055 =C2=B1  8%      +3.7%     71255=
1 =C2=B1  9%  sched_debug.cpu.max_idle_balance_cost.avg
   2651195 =C2=B1 20%     -13.0%    2306941 =C2=B1 25%     +13.1%    299799=
4 =C2=B1 26%  sched_debug.cpu.max_idle_balance_cost.max
    501057            +1.5%     508372 =C2=B1  2%      -0.1%     500361    =
    sched_debug.cpu.max_idle_balance_cost.min
    260536 =C2=B1 24%     -15.9%     219013 =C2=B1 25%      +2.5%     26700=
3 =C2=B1 15%  sched_debug.cpu.max_idle_balance_cost.stddev
      4294            +0.0%       4294            -0.0%       4294        s=
ched_debug.cpu.next_balance.avg
      4294            +0.0%       4294            -0.0%       4294        s=
ched_debug.cpu.next_balance.max
      4294            +0.0%       4294            -0.0%       4294        s=
ched_debug.cpu.next_balance.min
      0.00            +0.7%       0.00            +0.8%       0.00        s=
ched_debug.cpu.next_balance.stddev
      0.02 =C2=B1  9%      -9.6%       0.01 =C2=B1  9%      +0.0%       0.0=
2 =C2=B1  7%  sched_debug.cpu.nr_running.avg
      1.00            +0.0%       1.00            +2.9%       1.03 =C2=B1  =
6%  sched_debug.cpu.nr_running.max
      0.12 =C2=B1  3%      -3.7%       0.12 =C2=B1  4%      +0.4%       0.1=
2 =C2=B1  3%  sched_debug.cpu.nr_running.stddev
      3029 =C2=B1  3%      -0.1%       3026 =C2=B1  3%      -0.7%       300=
8        sched_debug.cpu.nr_switches.avg
     37445 =C2=B1 12%      -9.3%      33949 =C2=B1  9%      -5.3%      3545=
2 =C2=B1 21%  sched_debug.cpu.nr_switches.max
    925.22 =C2=B1 19%      +1.0%     934.19 =C2=B1 13%      -5.3%     875.9=
4 =C2=B1 16%  sched_debug.cpu.nr_switches.min
      3504 =C2=B1  7%      -3.8%       3370 =C2=B1  4%      -4.1%       336=
1 =C2=B1 10%  sched_debug.cpu.nr_switches.stddev
      0.00 =C2=B1 55%     +19.3%       0.00 =C2=B1 30%     +34.2%       0.0=
0 =C2=B1 26%  sched_debug.cpu.nr_uninterruptible.avg
    212.69            -0.7%     211.14 =C2=B1  3%      +0.3%     213.43 =C2=
=B1  2%  sched_debug.cpu.nr_uninterruptible.max
    -17.70           +10.9%     -19.63           +16.2%     -20.57        s=
ched_debug.cpu.nr_uninterruptible.min
     13.81            +0.2%      13.84 =C2=B1  2%      +1.0%      13.95 =C2=
=B1  2%  sched_debug.cpu.nr_uninterruptible.stddev
    205460 =C2=B1  5%      +0.0%     205463 =C2=B1  5%      -1.6%     20222=
3        sched_debug.cpu_clk
    996147            +0.0%     996147            +0.0%     996147        s=
ched_debug.dl_rq:.dl_bw->bw.avg
    996147            +0.0%     996147            +0.0%     996147        s=
ched_debug.dl_rq:.dl_bw->bw.max
    996147            +0.0%     996147            +0.0%     996147        s=
ched_debug.dl_rq:.dl_bw->bw.min
 4.295e+09            +0.0%  4.295e+09            -0.0%  4.295e+09        s=
ched_debug.jiffies
    204790 =C2=B1  5%      +0.0%     204795 =C2=B1  5%      -1.6%     20156=
5        sched_debug.ktime
    950.00            +0.0%     950.00            +0.0%     950.00        s=
ched_debug.rt_rq:/.rt_runtime.avg
    950.00            +0.0%     950.00            +0.0%     950.00        s=
ched_debug.rt_rq:/.rt_runtime.max
    950.00            +0.0%     950.00            +0.0%     950.00        s=
ched_debug.rt_rq:/.rt_runtime.min
    206248 =C2=B1  6%      -0.2%     205929 =C2=B1  5%      -1.6%     20295=
0        sched_debug.sched_clk
      1.00            +0.0%       1.00            +0.0%       1.00        s=
ched_debug.sched_clock_stable()
   4140603            +0.0%    4140603            +0.0%    4140603        s=
ched_debug.sysctl_sched.sysctl_sched_features
     24.00            +0.0%      24.00            +0.0%      24.00        s=
ched_debug.sysctl_sched.sysctl_sched_latency
      3.00            +0.0%       3.00            +0.0%       3.00        s=
ched_debug.sysctl_sched.sysctl_sched_min_granularity
      1.00            +0.0%       1.00            +0.0%       1.00        s=
ched_debug.sysctl_sched.sysctl_sched_tunable_scaling
      4.00            +0.0%       4.00            +0.0%       4.00        s=
ched_debug.sysctl_sched.sysctl_sched_wakeup_granularity
      0.04 =C2=B1  4%      +2.3%       0.04 =C2=B1 11%      +4.1%       0.0=
4 =C2=B1  5%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe.[unknown]
      0.00          -100.0%       0.00        +2.9e+99%       0.00 =C2=B124=
4%  perf-sched.sch_delay.avg.ms.d_alloc_parallel.__lookup_slow.walk_compone=
nt.link_path_walk.part
      0.00 =C2=B1223%     +58.2%       0.01 =C2=B1244%    +397.8%       0.0=
2 =C2=B1 13%  perf-sched.sch_delay.avg.ms.d_alloc_parallel.__lookup_slow.wa=
lk_component.path_lookupat.isra
      0.01 =C2=B1110%    +193.5%       0.02 =C2=B1 68%     +55.8%       0.0=
1 =C2=B1 63%  perf-sched.sch_delay.avg.ms.d_alloc_parallel.path_openat.do_f=
ilp_open.do_sys_openat2
      0.05 =C2=B1 14%     +39.5%       0.07 =C2=B1 20%     +64.3%       0.0=
8 =C2=B1 68%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.d=
o_syscall_64
      0.04 =C2=B1  4%      +3.8%       0.04 =C2=B1 20%      +5.3%       0.0=
4 =C2=B1  5%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.__=
x64_sys_nanosleep.do_syscall_64
      0.05 =C2=B1 14%     +21.9%       0.06 =C2=B1 22%     +43.0%       0.0=
8 =C2=B1 29%  perf-sched.sch_delay.avg.ms.do_syslog.part.0.kmsg_read.vfs_re=
ad
      0.03 =C2=B1  2%   +2234.4%       0.61 =C2=B1234%      +2.0%       0.0=
3 =C2=B1  6%  perf-sched.sch_delay.avg.ms.do_task_dead.do_exit.do_group_exi=
t.__x64_sys_exit_group.do_syscall_64
      0.04 =C2=B1  2%      -1.6%       0.04            +1.2%       0.04 =C2=
=B1  2%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do=
_syscall_64
      0.01 =C2=B1145%     -30.5%       0.01 =C2=B1158%    -100.0%       0.0=
0        perf-sched.sch_delay.avg.ms.exit_to_user_mode_prepare.irqentry_exi=
t_to_user_mode.asm_exc_page_fault.[unknown]
      0.01 =C2=B1 88%      -4.2%       0.01 =C2=B1 98%     +10.9%       0.0=
1 =C2=B1109%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.01 =C2=B1 27%     +22.0%       0.01 =C2=B1 18%     +30.8%       0.0=
1 =C2=B1 15%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_prepare.syscall=
_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.[unknown]
      0.08 =C2=B1 32%      -2.1%       0.07 =C2=B1 36%     -13.7%       0.0=
7 =C2=B1 59%  perf-sched.sch_delay.avg.ms.futex_wait_queue_me.futex_wait.do=
_futex.__x64_sys_futex
      0.00 =C2=B1223%     -21.1%       0.00 =C2=B1244%     +47.4%       0.0=
1 =C2=B1158%  perf-sched.sch_delay.avg.ms.io_schedule.__lock_page.__do_faul=
t.do_fault
      0.01 =C2=B1 85%     +97.3%       0.02 =C2=B1 72%    +106.8%       0.0=
2 =C2=B1 21%  perf-sched.sch_delay.avg.ms.io_schedule.__lock_page_killable.=
filemap_fault.__do_fault
      0.18 =C2=B1206%     -39.5%       0.11 =C2=B1138%     -66.3%       0.0=
6 =C2=B1191%  perf-sched.sch_delay.avg.ms.pipe_read.new_sync_read.vfs_read.=
ksys_read
      0.00          -100.0%       0.00        +3.9e+99%       0.00 =C2=B124=
4%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.__al=
loc_pages_nodemask.alloc_pages_vma.do_anonymous_page
      0.00          +3e+99%       0.00 =C2=B1244%    -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.__al=
loc_pages_nodemask.alloc_pages_vma.wp_page_copy
      0.01 =C2=B1223%    -100.0%       0.00           -23.8%       0.00 =C2=
=B1244%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.__flush_work.lru_add_drain_all.khugepaged
      0.00          -100.0%       0.00          +3e+99%       0.00 =C2=B124=
4%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.appa=
rmor_file_alloc_security.security_file_alloc.__alloc_file
      0.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.copy=
_page_from_iter.pipe_write.new_sync_write
      0.00        +3.6e+99%       0.00 =C2=B1244%    -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.copy=
_page_range.dup_mmap.dup_mm
      0.00        +5.9e+99%       0.01 =C2=B1244%    +9e+99%       0.01 =C2=
=B1161%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00 =C2=B1223%     -22.1%       0.00 =C2=B1244%    -100.0%       0.0=
0        perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.down_read.walk_component.link_path_walk
      0.00          -100.0%       0.00        +4.6e+99%       0.00 =C2=B124=
4%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.down=
_write.anon_vma_clone.anon_vma_fork
      0.00 =C2=B1223%     -10.0%       0.00 =C2=B1244%    -100.0%       0.0=
0        perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.down_write.unlink_file_vma.free_pgtables
      0.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.dput=
.__fput.task_work_run
      0.00          -100.0%       0.00          +3e+99%       0.00 =C2=B124=
4%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.dput=
.step_into.walk_component
      0.00        +3.6e+99%       0.00 =C2=B1244%    -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.dput=
.terminate_walk.path_openat
      0.00        +2.9e+99%       0.00 =C2=B1244%    -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.exit=
_mmap.mmput.do_exit
      0.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.exit=
_signals.do_exit.do_group_exit
      0.00          +6e+99%       0.01 =C2=B1159%  +4.1e+99%       0.00 =C2=
=B1244%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.filemap_read.__kernel_read.exec_binprm
      0.00          -100.0%       0.00        +3.1e+99%       0.00 =C2=B124=
4%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.file=
map_read.new_sync_read.vfs_read
      0.00 =C2=B1223%    -100.0%       0.00            -3.1%       0.00 =C2=
=B1244%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.force_qs_rnp.rcu_gp_kthread.kthread
      0.00          -100.0%       0.00        +2.9e+99%       0.00 =C2=B124=
4%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.__anon_vma_prepare.do_fault
      0.01 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.alloc_pid.copy_process
      0.00          -100.0%       0.00        +3.3e+99%       0.00 =C2=B124=
4%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.getname_flags.do_sys_openat2
      0.00          -100.0%       0.00        +2.9e+99%       0.00 =C2=B124=
4%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.vm_area_dup.__split_vma
      0.00       +9.8e+101%       0.98 =C2=B1244% +1.3e+103%      13.07 =C2=
=B1111%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.mutex_lock.drm_gem_shmem_vunmap.mgag200_handle_damage
      0.01 =C2=B1223%     -51.4%       0.00 =C2=B1244%     -51.4%       0.0=
0 =C2=B1244%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_re=
sched.mutex_lock.pipe_write.new_sync_write
      0.01 =C2=B1 71%     -36.7%       0.01 =C2=B1115%    -100.0%       0.0=
0        perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.remove_vma.exit_mmap.mmput
      0.01 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.shri=
nk_dentry_list.shrink_dcache_parent.d_invalidate
      0.02 =C2=B1 73%     -13.4%       0.01 =C2=B1 88%     +27.7%       0.0=
2 =C2=B1 99%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_re=
sched.stop_one_cpu.sched_exec.bprm_execve
      0.00        +3.6e+99%       0.00 =C2=B1244%    -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.task=
_work_run.do_exit.do_group_exit
      0.00          -100.0%       0.00        +3.1e+99%       0.00 =C2=B124=
4%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.task=
_work_run.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.00          -100.0%       0.00          +3e+99%       0.00 =C2=B124=
4%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.unma=
p_vmas.exit_mmap.mmput
      0.00          +3e+99%       0.00 =C2=B1244%    -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.unma=
p_vmas.unmap_region.__do_munmap
      0.01 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.vmst=
at_shepherd.process_one_work.worker_thread
      0.01 =C2=B1142%      -8.7%       0.01 =C2=B1160%     +13.7%       0.0=
1 =C2=B1115%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_re=
sched.zap_pte_range.unmap_page_range.unmap_vmas
      0.03 =C2=B1 16%      -1.6%       0.03 =C2=B1 17%      +1.4%       0.0=
3 =C2=B1 23%  perf-sched.sch_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_f=
ork
      0.04 =C2=B1  6%     +25.6%       0.05 =C2=B1 16%     +47.0%       0.0=
6 =C2=B1 35%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep=
_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.03 =C2=B1 13%      +3.5%       0.03 =C2=B1 18%      +1.0%       0.0=
3 =C2=B1 18%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.po=
ll_schedule_timeout.constprop.0.do_select
      0.03 =C2=B1 10%      -4.7%       0.03 =C2=B1  8%      -1.0%       0.0=
3 =C2=B1  4%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.po=
ll_schedule_timeout.constprop.0.do_sys_poll
      0.04 =C2=B1  3%      -0.1%       0.04 =C2=B1  5%      +1.8%       0.0=
4 =C2=B1  8%  perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthrea=
d.ret_from_fork
      0.00 =C2=B1223%    +267.9%       0.01 =C2=B1117%     +46.4%       0.0=
1 =C2=B1244%  perf-sched.sch_delay.avg.ms.schedule_timeout.khugepaged.kthre=
ad.ret_from_fork
      0.04 =C2=B1 39%      +2.3%       0.04 =C2=B1 24%      +7.4%       0.0=
4 =C2=B1 29%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_kthread.k=
thread.ret_from_fork
      0.02 =C2=B1101%     +61.4%       0.03 =C2=B1 66%     -49.8%       0.0=
1 =C2=B1160%  perf-sched.sch_delay.avg.ms.schedule_timeout.wait_for_complet=
ion.__flush_work.lru_add_drain_all
      0.03 =C2=B1 10%      +9.4%       0.04 =C2=B1 15%      -2.6%       0.0=
3 =C2=B1 15%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_fro=
m_fork
      0.02 =C2=B1  4%      -2.3%       0.02 =C2=B1  3%      +3.1%       0.0=
2 =C2=B1 11%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_den=
try_open.do_open.isra
      2.65 =C2=B1216%     -96.5%       0.09 =C2=B1 17%     -77.6%       0.5=
9 =C2=B1216%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fo=
rk
      0.06 =C2=B1 25%     +11.7%       0.07 =C2=B1 34%      +9.8%       0.0=
7 =C2=B1 14%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe.[unknown]
      0.00          -100.0%       0.00        +2.9e+99%       0.00 =C2=B124=
4%  perf-sched.sch_delay.max.ms.d_alloc_parallel.__lookup_slow.walk_compone=
nt.link_path_walk.part
      0.00 =C2=B1223%     +52.4%       0.01 =C2=B1244%    +449.2%       0.0=
2 =C2=B1 13%  perf-sched.sch_delay.max.ms.d_alloc_parallel.__lookup_slow.wa=
lk_component.path_lookupat.isra
      0.01 =C2=B1103%     +64.5%       0.02 =C2=B1 67%     +50.6%       0.0=
2 =C2=B1 67%  perf-sched.sch_delay.max.ms.d_alloc_parallel.path_openat.do_f=
ilp_open.do_sys_openat2
      0.08 =C2=B1 25%    +129.5%       0.18 =C2=B1 68%    +135.3%       0.1=
9 =C2=B1103%  perf-sched.sch_delay.max.ms.devkmsg_read.vfs_read.ksys_read.d=
o_syscall_64
      0.07 =C2=B1 42%     +19.8%       0.09 =C2=B1 73%     +25.0%       0.0=
9 =C2=B1 22%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.__=
x64_sys_nanosleep.do_syscall_64
      0.09 =C2=B1 16%     +59.8%       0.14 =C2=B1 41%    +195.5%       0.2=
6 =C2=B1 72%  perf-sched.sch_delay.max.ms.do_syslog.part.0.kmsg_read.vfs_re=
ad
      0.09 =C2=B1 27%  +1.6e+05%     143.22 =C2=B1244%    +155.0%       0.2=
2 =C2=B1 55%  perf-sched.sch_delay.max.ms.do_task_dead.do_exit.do_group_exi=
t.__x64_sys_exit_group.do_syscall_64
      0.12 =C2=B1 12%      +8.9%       0.14 =C2=B1 33%      -5.4%       0.1=
2 =C2=B1  8%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.__do_sys_wai=
t4.do_syscall_64
      0.01 =C2=B1145%     -28.8%       0.01 =C2=B1158%    -100.0%       0.0=
0        perf-sched.sch_delay.max.ms.exit_to_user_mode_prepare.irqentry_exi=
t_to_user_mode.asm_exc_page_fault.[unknown]
      0.02 =C2=B1 46%      +8.5%       0.02 =C2=B1102%      -0.6%       0.0=
2 =C2=B1 72%  perf-sched.sch_delay.max.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.05 =C2=B1 22%      -2.8%       0.05 =C2=B1 13%      +4.0%       0.0=
5 =C2=B1 23%  perf-sched.sch_delay.max.ms.exit_to_user_mode_prepare.syscall=
_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.[unknown]
      0.17 =C2=B1 53%     +30.5%       0.23 =C2=B1 50%     -17.3%       0.1=
4 =C2=B1 82%  perf-sched.sch_delay.max.ms.futex_wait_queue_me.futex_wait.do=
_futex.__x64_sys_futex
      0.00 =C2=B1223%     -21.1%       0.00 =C2=B1244%     +47.4%       0.0=
1 =C2=B1158%  perf-sched.sch_delay.max.ms.io_schedule.__lock_page.__do_faul=
t.do_fault
      0.02 =C2=B1 74%    +123.8%       0.04 =C2=B1 79%    +165.9%       0.0=
5 =C2=B1 26%  perf-sched.sch_delay.max.ms.io_schedule.__lock_page_killable.=
filemap_fault.__do_fault
    169.49 =C2=B1223%     +70.4%     288.75 =C2=B1158%     -13.8%     146.1=
2 =C2=B1244%  perf-sched.sch_delay.max.ms.pipe_read.new_sync_read.vfs_read.=
ksys_read
      0.00          -100.0%       0.00        +3.9e+99%       0.00 =C2=B124=
4%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.__al=
loc_pages_nodemask.alloc_pages_vma.do_anonymous_page
      0.00          +3e+99%       0.00 =C2=B1244%    -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.__al=
loc_pages_nodemask.alloc_pages_vma.wp_page_copy
      0.01 =C2=B1223%    -100.0%       0.00           -23.8%       0.00 =C2=
=B1244%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.__flush_work.lru_add_drain_all.khugepaged
      0.00          -100.0%       0.00          +3e+99%       0.00 =C2=B124=
4%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.appa=
rmor_file_alloc_security.security_file_alloc.__alloc_file
      0.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.copy=
_page_from_iter.pipe_write.new_sync_write
      0.00        +3.6e+99%       0.00 =C2=B1244%    -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.copy=
_page_range.dup_mmap.dup_mm
      0.00        +8.6e+99%       0.01 =C2=B1244%    +9e+99%       0.01 =C2=
=B1161%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00 =C2=B1223%     -22.1%       0.00 =C2=B1244%    -100.0%       0.0=
0        perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.down_read.walk_component.link_path_walk
      0.00          -100.0%       0.00        +4.6e+99%       0.00 =C2=B124=
4%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.down=
_write.anon_vma_clone.anon_vma_fork
      0.00 =C2=B1223%     -10.0%       0.00 =C2=B1244%    -100.0%       0.0=
0        perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.down_write.unlink_file_vma.free_pgtables
      0.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.dput=
.__fput.task_work_run
      0.00          -100.0%       0.00          +3e+99%       0.00 =C2=B124=
4%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.dput=
.step_into.walk_component
      0.00        +3.6e+99%       0.00 =C2=B1244%    -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.dput=
.terminate_walk.path_openat
      0.00        +2.9e+99%       0.00 =C2=B1244%    -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.exit=
_mmap.mmput.do_exit
      0.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.exit=
_signals.do_exit.do_group_exit
      0.00          +6e+99%       0.01 =C2=B1159%  +4.1e+99%       0.00 =C2=
=B1244%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.filemap_read.__kernel_read.exec_binprm
      0.00          -100.0%       0.00        +3.1e+99%       0.00 =C2=B124=
4%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.file=
map_read.new_sync_read.vfs_read
      0.00 =C2=B1223%    -100.0%       0.00            -3.1%       0.00 =C2=
=B1244%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.force_qs_rnp.rcu_gp_kthread.kthread
      0.00          -100.0%       0.00        +2.9e+99%       0.00 =C2=B124=
4%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.__anon_vma_prepare.do_fault
      0.01 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.alloc_pid.copy_process
      0.00          -100.0%       0.00        +3.3e+99%       0.00 =C2=B124=
4%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.getname_flags.do_sys_openat2
      0.00          -100.0%       0.00        +2.9e+99%       0.00 =C2=B124=
4%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.vm_area_dup.__split_vma
      0.00       +9.8e+101%       0.98 =C2=B1244% +1.3e+103%      13.07 =C2=
=B1111%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.mutex_lock.drm_gem_shmem_vunmap.mgag200_handle_damage
      0.01 =C2=B1223%     -51.4%       0.00 =C2=B1244%     -51.4%       0.0=
0 =C2=B1244%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_re=
sched.mutex_lock.pipe_write.new_sync_write
      0.02 =C2=B1 72%     -39.4%       0.01 =C2=B1115%    -100.0%       0.0=
0        perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.remove_vma.exit_mmap.mmput
      0.01 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.shri=
nk_dentry_list.shrink_dcache_parent.d_invalidate
      0.02 =C2=B1 87%     -34.0%       0.01 =C2=B1 88%    +199.7%       0.0=
7 =C2=B1139%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_re=
sched.stop_one_cpu.sched_exec.bprm_execve
      0.00        +3.6e+99%       0.00 =C2=B1244%    -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.task=
_work_run.do_exit.do_group_exit
      0.00          -100.0%       0.00        +3.1e+99%       0.00 =C2=B124=
4%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.task=
_work_run.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.00          -100.0%       0.00          +3e+99%       0.00 =C2=B124=
4%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.unma=
p_vmas.exit_mmap.mmput
      0.00          +3e+99%       0.00 =C2=B1244%    -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.unma=
p_vmas.unmap_region.__do_munmap
      0.01 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.vmst=
at_shepherd.process_one_work.worker_thread
      0.12 =C2=B1 12%      +0.7%       0.12 =C2=B1  9%      -0.4%       0.1=
2 =C2=B1  6%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_re=
sched.wait_for_completion.affine_move_task.__set_cpus_allowed_ptr
      0.01 =C2=B1143%     -14.3%       0.01 =C2=B1160%      +6.7%       0.0=
1 =C2=B1115%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_re=
sched.zap_pte_range.unmap_page_range.unmap_vmas
      0.05 =C2=B1 14%      +5.8%       0.06 =C2=B1 19%     +40.8%       0.0=
7 =C2=B1 61%  perf-sched.sch_delay.max.ms.rcu_gp_kthread.kthread.ret_from_f=
ork
      0.07 =C2=B1 17%    +173.9%       0.19 =C2=B1 50%    +212.3%       0.2=
1 =C2=B1 84%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.ep=
_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.05 =C2=B1 26%      +5.6%       0.05 =C2=B1 36%      +3.0%       0.0=
5 =C2=B1 35%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.po=
ll_schedule_timeout.constprop.0.do_select
      0.07 =C2=B1 32%     -20.9%       0.05 =C2=B1 15%     -19.9%       0.0=
6 =C2=B1 12%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.po=
ll_schedule_timeout.constprop.0.do_sys_poll
      0.05 =C2=B1  3%      +3.2%       0.05 =C2=B1 11%      +5.5%       0.0=
5 =C2=B1  9%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthrea=
d.ret_from_fork
      0.00 =C2=B1223%    +267.9%       0.01 =C2=B1117%     +46.4%       0.0=
1 =C2=B1244%  perf-sched.sch_delay.max.ms.schedule_timeout.khugepaged.kthre=
ad.ret_from_fork
     11.57 =C2=B1222%     +23.7%      14.31 =C2=B1119%     +30.2%      15.0=
6 =C2=B1 96%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_kthread.k=
thread.ret_from_fork
      0.02 =C2=B1101%     +61.4%       0.03 =C2=B1 66%     -49.8%       0.0=
1 =C2=B1160%  perf-sched.sch_delay.max.ms.schedule_timeout.wait_for_complet=
ion.__flush_work.lru_add_drain_all
     21.44 =C2=B1 21%      +8.6%      23.28 =C2=B1 20%      -0.3%      21.3=
7 =C2=B1 46%  perf-sched.sch_delay.max.ms.smpboot_thread_fn.kthread.ret_fro=
m_fork
      0.06 =C2=B1  8%      -2.1%       0.06 =C2=B1 26%    +156.2%       0.1=
6 =C2=B1 79%  perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_den=
try_open.do_open.isra
    323.67 =C2=B1202%     -90.0%      32.27 =C2=B1 16%     -52.4%     154.1=
8 =C2=B1208%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fo=
rk
      0.23 =C2=B1157%     -73.9%       0.06 =C2=B1 63%     -68.6%       0.0=
7 =C2=B1122%  perf-sched.total_sch_delay.average.ms
    488.61 =C2=B1140%      -8.0%     449.74 =C2=B1107%     -37.8%     303.9=
8 =C2=B1141%  perf-sched.total_sch_delay.max.ms
    258.44            -0.3%     257.79            -0.5%     257.06        p=
erf-sched.total_wait_and_delay.average.ms
     12954            -0.4%      12902            +0.4%      13011        p=
erf-sched.total_wait_and_delay.count.ms
      9556 =C2=B1  2%      +3.1%       9855            +0.4%       9593 =C2=
=B1  3%  perf-sched.total_wait_and_delay.max.ms
    258.21            -0.2%     257.73            -0.5%     256.99        p=
erf-sched.total_wait_time.average.ms
      9556 =C2=B1  2%      +3.1%       9855            +0.4%       9593 =C2=
=B1  3%  perf-sched.total_wait_time.max.ms
    895.86            +0.2%     897.67            +0.0%     896.10        p=
erf-sched.wait_and_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL=
_64_after_hwframe.[unknown]
    397.38 =C2=B1 10%     +17.1%     465.53 =C2=B1 26%     -10.3%     356.5=
8 =C2=B1 22%  perf-sched.wait_and_delay.avg.ms.devkmsg_read.vfs_read.ksys_r=
ead.do_syscall_64
    757.93 =C2=B1  8%      -3.5%     731.42 =C2=B1  8%      -1.2%     749.1=
2 =C2=B1  8%  perf-sched.wait_and_delay.avg.ms.do_nanosleep.hrtimer_nanosle=
ep.__x64_sys_nanosleep.do_syscall_64
    397.42 =C2=B1 10%     +17.2%     465.58 =C2=B1 26%     -20.4%     316.4=
0 =C2=B1 46%  perf-sched.wait_and_delay.avg.ms.do_syslog.part.0.kmsg_read.v=
fs_read
    276.84 =C2=B1  2%      +1.5%     281.04            +1.3%     280.37 =C2=
=B1  4%  perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exi=
t.__x64_sys_exit_group.do_syscall_64
      5.55            -1.0%       5.49            +0.2%       5.56        p=
erf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_sysc=
all_64
      0.00       +1.9e+104%     189.51 =C2=B1124%   +4e+103%      40.13 =C2=
=B1244%  perf-sched.wait_and_delay.avg.ms.futex_wait_queue_me.futex_wait.do=
_futex.__x64_sys_futex
     52.73            +1.2%      53.37 =C2=B1  2%      -2.1%      51.63    =
    perf-sched.wait_and_delay.avg.ms.pipe_read.new_sync_read.vfs_read.ksys_=
read
      0.00       +7.2e+103%      71.57 =C2=B1244%    -100.0%       0.00    =
    perf-sched.wait_and_delay.avg.ms.preempt_schedule_common.__cond_resched=
.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00          -100.0%       0.00       +1.4e+104%     143.16 =C2=B124=
4%  perf-sched.wait_and_delay.avg.ms.preempt_schedule_common.__cond_resched=
.down_write.anon_vma_clone.anon_vma_fork
      0.00          -100.0%       0.00       +3.3e+104%     332.63 =C2=B112=
1%  perf-sched.wait_and_delay.avg.ms.preempt_schedule_common.__cond_resched=
.mutex_lock.drm_gem_shmem_vunmap.mgag200_handle_damage
      4.17 =C2=B1 37%     +42.0%       5.92 =C2=B1 20%      +9.3%       4.5=
6 =C2=B1 35%  perf-sched.wait_and_delay.avg.ms.preempt_schedule_common.__co=
nd_resched.wait_for_completion.affine_move_task.__set_cpus_allowed_ptr
      4.46 =C2=B1  4%      +3.3%       4.61 =C2=B1  4%      +5.3%       4.7=
0 =C2=B1  6%  perf-sched.wait_and_delay.avg.ms.rcu_gp_kthread.kthread.ret_f=
rom_fork
    226.26 =C2=B1 70%      -4.7%     215.56 =C2=B1 86%     -14.3%     193.9=
2 =C2=B1 86%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clo=
ck.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
    813.83 =C2=B1 22%     -21.1%     642.34 =C2=B1 24%      -9.7%     734.9=
6 =C2=B1 15%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clo=
ck.poll_schedule_timeout.constprop.0.do_sys_poll
    478.80            -0.1%     478.34            -0.1%     478.44        p=
erf-sched.wait_and_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from=
_fork
      4.42 =C2=B1  2%      +2.5%       4.53            +0.7%       4.45 =C2=
=B1  4%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_kthread.k=
thread.ret_from_fork
    713.23            -0.4%     710.40            -0.5%     709.84        p=
erf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
      0.02 =C2=B1  3%      +7.1%       0.03 =C2=B1 20%     +23.4%       0.0=
3 =C2=B1 17%  perf-sched.wait_and_delay.avg.ms.wait_for_partner.fifo_open.d=
o_dentry_open.do_open.isra
    743.24 =C2=B1  3%      -3.0%     720.85 =C2=B1  3%      -0.5%     739.2=
2 =C2=B1  4%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_fr=
om_fork
      9.83 =C2=B1  3%      +1.7%      10.00            +0.2%       9.86 =C2=
=B1  3%  perf-sched.wait_and_delay.count.__x64_sys_pause.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe.[unknown]
      7.83 =C2=B1 13%     +22.2%       9.57 =C2=B1  9%     +11.2%       8.7=
1 =C2=B1 17%  perf-sched.wait_and_delay.count.devkmsg_read.vfs_read.ksys_re=
ad.do_syscall_64
     12.00 =C2=B1  9%      +3.6%      12.43 =C2=B1  8%      +1.2%      12.1=
4 =C2=B1  9%  perf-sched.wait_and_delay.count.do_nanosleep.hrtimer_nanoslee=
p.__x64_sys_nanosleep.do_syscall_64
      7.83 =C2=B1 13%     +22.2%       9.57 =C2=B1  9%      -7.0%       7.2=
9 =C2=B1 45%  perf-sched.wait_and_delay.count.do_syslog.part.0.kmsg_read.vf=
s_read
    243.50            +0.1%     243.86            -0.0%     243.43        p=
erf-sched.wait_and_delay.count.do_task_dead.do_exit.do_group_exit.__x64_sys=
_exit_group.do_syscall_64
    241.00            +0.6%     242.43            +0.2%     241.57        p=
erf-sched.wait_and_delay.count.do_wait.kernel_wait4.__do_sys_wait4.do_sysca=
ll_64
      0.00       +3.6e+102%       3.57 =C2=B1131% +1.4e+102%       1.43 =C2=
=B1244%  perf-sched.wait_and_delay.count.futex_wait_queue_me.futex_wait.do_=
futex.__x64_sys_futex
      2961            -0.3%       2952            +1.5%       3006        p=
erf-sched.wait_and_delay.count.pipe_read.new_sync_read.vfs_read.ksys_read
      0.00       +2.9e+101%       0.29 =C2=B1244%    -100.0%       0.00    =
    perf-sched.wait_and_delay.count.preempt_schedule_common.__cond_resched.=
do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  perf-sched.wait_and_delay.count.preempt_schedule_common.__cond_resched.=
down_write.anon_vma_clone.anon_vma_fork
      0.00          -100.0%       0.00       +4.3e+101%       0.43 =C2=B111=
5%  perf-sched.wait_and_delay.count.preempt_schedule_common.__cond_resched.=
mutex_lock.drm_gem_shmem_vunmap.mgag200_handle_damage
      2816            +0.0%       2816            +0.0%       2816        p=
erf-sched.wait_and_delay.count.preempt_schedule_common.__cond_resched.wait_=
for_completion.affine_move_task.__set_cpus_allowed_ptr
    352.50 =C2=B1  2%      -6.4%     329.86 =C2=B1  9%     -10.4%     315.8=
6 =C2=B1 13%  perf-sched.wait_and_delay.count.rcu_gp_kthread.kthread.ret_fr=
om_fork
     25.67 =C2=B1 71%      -9.3%      23.29 =C2=B1 86%     -17.6%      21.1=
4 =C2=B1 86%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_cloc=
k.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     33.17 =C2=B1  2%      -0.5%      33.00 =C2=B1  4%      -1.4%      32.7=
1        perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.pol=
l_schedule_timeout.constprop.0.do_sys_poll
     40.00            -1.8%      39.29            -1.4%      39.43        p=
erf-sched.wait_and_delay.count.schedule_timeout.kcompactd.kthread.ret_from_=
fork
      1875 =C2=B1  3%      -1.9%       1839            +0.4%       1883 =C2=
=B1  4%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_kthread.kt=
hread.ret_from_fork
      3336            -0.0%       3335            +0.1%       3340        p=
erf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork
     71.17            +0.2%      71.29            -0.0%      71.14        p=
erf-sched.wait_and_delay.count.wait_for_partner.fifo_open.do_dentry_open.do=
_open.isra
    863.17 =C2=B1  3%      +0.1%     864.00 =C2=B1  4%      +1.6%     876.8=
6 =C2=B1  3%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_fro=
m_fork
    997.53            +0.0%     997.56            +0.0%     997.54        p=
erf-sched.wait_and_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL=
_64_after_hwframe.[unknown]
      2685            +0.8%       2708            +0.2%       2690        p=
erf-sched.wait_and_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_=
64
      1000            +0.0%       1000            +0.0%       1000        p=
erf-sched.wait_and_delay.max.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_na=
nosleep.do_syscall_64
      2685            +0.8%       2708           -13.8%       2314 =C2=B1 4=
0%  perf-sched.wait_and_delay.max.ms.do_syslog.part.0.kmsg_read.vfs_read
      1904 =C2=B1 36%     +38.3%       2634 =C2=B1 42%     +22.9%       234=
0 =C2=B1 28%  perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.do_grou=
p_exit.__x64_sys_exit_group.do_syscall_64
    135.59            +2.6%     139.10 =C2=B1  6%      +0.5%     136.29    =
    perf-sched.wait_and_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do=
_syscall_64
      0.00         +1e+105%       1048 =C2=B1118% +3.8e+104%     376.32 =C2=
=B1244%  perf-sched.wait_and_delay.max.ms.futex_wait_queue_me.futex_wait.do=
_futex.__x64_sys_futex
      2690            +0.8%       2712            +0.2%       2695        p=
erf-sched.wait_and_delay.max.ms.pipe_read.new_sync_read.vfs_read.ksys_read
      0.00       +1.4e+104%     143.14 =C2=B1244%    -100.0%       0.00    =
    perf-sched.wait_and_delay.max.ms.preempt_schedule_common.__cond_resched=
.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00          -100.0%       0.00       +1.4e+104%     143.16 =C2=B124=
4%  perf-sched.wait_and_delay.max.ms.preempt_schedule_common.__cond_resched=
.down_write.anon_vma_clone.anon_vma_fork
      0.00          -100.0%       0.00       +3.3e+104%     332.63 =C2=B112=
1%  perf-sched.wait_and_delay.max.ms.preempt_schedule_common.__cond_resched=
.mutex_lock.drm_gem_shmem_vunmap.mgag200_handle_damage
      3970 =C2=B1105%    +117.6%       8637 =C2=B1 36%     +24.5%       494=
1 =C2=B1 87%  perf-sched.wait_and_delay.max.ms.preempt_schedule_common.__co=
nd_resched.wait_for_completion.affine_move_task.__set_cpus_allowed_ptr
      5.99            +0.1%       6.00            -0.2%       5.98        p=
erf-sched.wait_and_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork
      1547 =C2=B1 70%     -11.6%       1368 =C2=B1 87%     -15.1%       131=
3 =C2=B1 86%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clo=
ck.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      6587 =C2=B1 59%     -52.9%       3103 =C2=B1109%      -3.3%       637=
2 =C2=B1 55%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clo=
ck.poll_schedule_timeout.constprop.0.do_sys_poll
    505.02            +0.0%     505.02            +0.0%     505.02        p=
erf-sched.wait_and_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from=
_fork
     25.16 =C2=B1 97%     +28.8%      32.40 =C2=B1 47%     -23.7%      19.1=
9 =C2=B1 56%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_kthr=
ead.kthread.ret_from_fork
      1063            +2.3%       1088 =C2=B1  2%     +39.5%       1483 =C2=
=B1 64%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_fro=
m_fork
      0.06 =C2=B1  9%    +206.0%       0.20 =C2=B1164%    +209.5%       0.2=
0 =C2=B1 58%  perf-sched.wait_and_delay.max.ms.wait_for_partner.fifo_open.d=
o_dentry_open.do_open.isra
      8942 =C2=B1  5%      -1.5%       8812 =C2=B1  5%      -2.2%       874=
1 =C2=B1  5%  perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_fr=
om_fork
    895.82            +0.2%     897.63            +0.0%     896.06        p=
erf-sched.wait_time.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe.[unknown]
      0.00          -100.0%       0.00       +1.1e+100%       0.01 =C2=B124=
4%  perf-sched.wait_time.avg.ms.d_alloc_parallel.__lookup_slow.walk_compone=
nt.link_path_walk.part
      0.00          -100.0%       0.00        +2.6e+99%       0.00 =C2=B124=
4%  perf-sched.wait_time.avg.ms.d_alloc_parallel.__lookup_slow.walk_compone=
nt.path_lookupat.isra
      0.01 =C2=B1106%     -74.3%       0.00 =C2=B1158%    +113.2%       0.0=
3 =C2=B1 45%  perf-sched.wait_time.avg.ms.d_alloc_parallel.path_openat.do_f=
ilp_open.do_sys_openat2
    397.33 =C2=B1 10%     +17.1%     465.46 =C2=B1 26%     -10.3%     356.4=
9 =C2=B1 22%  perf-sched.wait_time.avg.ms.devkmsg_read.vfs_read.ksys_read.d=
o_syscall_64
    757.89 =C2=B1  8%      -3.5%     731.38 =C2=B1  8%      -1.2%     749.0=
8 =C2=B1  8%  perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.__=
x64_sys_nanosleep.do_syscall_64
    397.36 =C2=B1 10%     +17.2%     465.52 =C2=B1 26%     -19.8%     318.8=
8 =C2=B1 44%  perf-sched.wait_time.avg.ms.do_syslog.part.0.kmsg_read.vfs_re=
ad
    276.82 =C2=B1  2%      +1.3%     280.42            +1.3%     280.34 =C2=
=B1  4%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x=
64_sys_exit_group.do_syscall_64
      5.51            -1.0%       5.45            +0.2%       5.52        p=
erf-sched.wait_time.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.05 =C2=B1 77%    +349.6%       0.21 =C2=B1 75%    +103.5%       0.1=
0 =C2=B1 44%  perf-sched.wait_time.avg.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.00         +2e+100%       0.02 =C2=B1185% +1.5e+100%       0.02 =C2=
=B1193%  perf-sched.wait_time.avg.ms.exit_to_user_mode_prepare.irqentry_exi=
t_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.00       +2.9e+100%       0.03 =C2=B1244% +3.7e+100%       0.04 =C2=
=B1244%  perf-sched.wait_time.avg.ms.exit_to_user_mode_prepare.irqentry_exi=
t_to_user_mode.asm_sysvec_irq_work.[unknown]
      0.00       +1.1e+100%       0.01 =C2=B1244%    -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.exit_to_user_mode_prepare.irqentry_exit_to_=
user_mode.asm_sysvec_reschedule_ipi.[unknown]
      0.27 =C2=B1127%   +7590.1%      20.76 =C2=B1240%     -46.0%       0.1=
5 =C2=B1104%  perf-sched.wait_time.avg.ms.exit_to_user_mode_prepare.syscall=
_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.[unknown]
     70.02 =C2=B1 83%    +321.6%     295.23 =C2=B1 57%     +31.8%      92.2=
6 =C2=B1 91%  perf-sched.wait_time.avg.ms.futex_wait_queue_me.futex_wait.do=
_futex.__x64_sys_futex
      0.01 =C2=B1153%     -95.0%       0.00 =C2=B1244%     -25.6%       0.0=
1 =C2=B1 94%  perf-sched.wait_time.avg.ms.io_schedule.__lock_page_killable.=
filemap_fault.__do_fault
     52.55            +1.4%      53.26 =C2=B1  2%      -1.9%      51.57    =
    perf-sched.wait_time.avg.ms.pipe_read.new_sync_read.vfs_read.ksys_read
      0.08 =C2=B1 93%    +122.0%       0.19 =C2=B1154%     -39.7%       0.0=
5 =C2=B1177%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.__alloc_pages_nodemask.alloc_pages_vma.shmem_alloc_page
      0.04 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.appa=
rmor_file_alloc_security.security_file_alloc.__alloc_file
      0.00       +6.9e+100%       0.07 =C2=B1244%    -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.copy=
_page_range.dup_mmap.dup_mm
      0.00       +7.2e+103%      71.56 =C2=B1244%    -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.do_u=
ser_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00          -100.0%       0.00       +1.4e+104%     143.15 =C2=B124=
4%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.down=
_write.anon_vma_clone.anon_vma_fork
      0.10 =C2=B1 95%      +3.9%       0.10 =C2=B1115%     +28.3%       0.1=
3 =C2=B1 63%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.down_write.generic_file_write_iter.new_sync_write
      0.00          -100.0%       0.00        +7.4e+99%       0.01 =C2=B124=
4%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.dput=
.path_openat.do_filp_open
      0.00          -100.0%       0.00       +3.2e+100%       0.03 =C2=B124=
4%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.dput=
.terminate_walk.path_openat
      0.79 =C2=B1223%    -100.0%       0.00           -11.5%       0.70 =C2=
=B1244%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched=
.force_qs_rnp.rcu_gp_kthread.kthread
      0.30 =C2=B1 63%      +4.7%       0.32 =C2=B1 91%     -49.7%       0.1=
5 =C2=B1 40%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.generic_perform_write.__generic_file_write_iter.generic_file_write_it=
er
      0.06 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.alloc_pid.copy_process
      0.00          -100.0%       0.00       +3.9e+100%       0.04 =C2=B124=
4%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.mnt_=
want_write.path_openat.do_filp_open
      0.00       +5.3e+100%       0.05 =C2=B1244%    -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.mute=
x_lock.__perf_event_read_value.perf_read
      0.00          -100.0%       0.00       +3.2e+104%     319.97 =C2=B112=
1%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.mute=
x_lock.drm_gem_shmem_vunmap.mgag200_handle_damage
      0.18 =C2=B1 68%     +87.3%       0.33 =C2=B1115%      -9.7%       0.1=
6 =C2=B1 40%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.pagecache_get_page.shmem_getpage_gfp.shmem_write_begin
      0.10 =C2=B1 72%     +41.1%       0.15 =C2=B1177%     +13.0%       0.1=
2 =C2=B1 85%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.shmem_undo_range.shmem_truncate_range.shmem_evict_inode
      2.52 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.shri=
nk_dentry_list.shrink_dcache_parent.d_invalidate
      0.00          -100.0%       0.00        +4.3e+98%       0.00 =C2=B124=
4%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.stop=
_one_cpu.sched_exec.bprm_execve
      0.15 =C2=B1 30%    +200.5%       0.45 =C2=B1127%    +108.5%       0.3=
1 =C2=B1122%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.vfs_write.ksys_write.do_syscall_64
     34.69 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.vmst=
at_shepherd.process_one_work.worker_thread
      4.17 =C2=B1 37%     +42.1%       5.92 =C2=B1 20%      +9.4%       4.5=
6 =C2=B1 35%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.wait_for_completion.affine_move_task.__set_cpus_allowed_ptr
      4.43 =C2=B1  4%      +3.3%       4.58 =C2=B1  4%      +5.3%       4.6=
7 =C2=B1  6%  perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_f=
ork
    290.04 =C2=B1 24%      +3.7%     300.88 =C2=B1 30%      -7.7%     267.6=
8 =C2=B1 31%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.ep=
_poll.do_epoll_wait.__x64_sys_epoll_wait
    813.80 =C2=B1 22%     -21.1%     642.31 =C2=B1 24%      -9.7%     734.9=
3 =C2=B1 15%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.po=
ll_schedule_timeout.constprop.0.do_sys_poll
    478.77            -0.1%     478.31            -0.1%     478.41        p=
erf-sched.wait_time.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.03 =C2=B1 84%     -12.1%       0.03 =C2=B1 99%     -48.2%       0.0=
2 =C2=B1161%  perf-sched.wait_time.avg.ms.schedule_timeout.khugepaged.kthre=
ad.ret_from_fork
      4.39 =C2=B1  2%      +2.5%       4.50            +0.6%       4.41 =C2=
=B1  4%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_kthread.kthrea=
d.ret_from_fork
      0.62 =C2=B1198%     -76.3%       0.15 =C2=B1 50%     -82.3%       0.1=
1 =C2=B1 32%  perf-sched.wait_time.avg.ms.schedule_timeout.wait_for_complet=
ion.affine_move_task.__set_cpus_allowed_ptr
    713.19            -0.4%     710.36            -0.5%     709.81        p=
erf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
      0.00 =C2=B1 82%    +277.1%       0.00 =C2=B1146%    +602.9%       0.0=
1 =C2=B1 74%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_den=
try_open.do_open.isra
    740.59 =C2=B1  3%      -2.7%     720.76 =C2=B1  3%      -0.3%     738.6=
3 =C2=B1  4%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fo=
rk
    997.48            +0.0%     997.51            +0.0%     997.50        p=
erf-sched.wait_time.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe.[unknown]
      0.00          -100.0%       0.00       +1.1e+100%       0.01 =C2=B124=
4%  perf-sched.wait_time.max.ms.d_alloc_parallel.__lookup_slow.walk_compone=
nt.link_path_walk.part
      0.00          -100.0%       0.00        +7.6e+99%       0.01 =C2=B124=
4%  perf-sched.wait_time.max.ms.d_alloc_parallel.__lookup_slow.walk_compone=
nt.path_lookupat.isra
      0.03 =C2=B1107%     -39.6%       0.02 =C2=B1173%    +152.7%       0.0=
7 =C2=B1 92%  perf-sched.wait_time.max.ms.d_alloc_parallel.path_openat.do_f=
ilp_open.do_sys_openat2
      2685            +0.8%       2708            +0.2%       2690        p=
erf-sched.wait_time.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      1000            -0.0%       1000            +0.0%       1000        p=
erf-sched.wait_time.max.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosle=
ep.do_syscall_64
      2685            +0.8%       2708           -13.6%       2320 =C2=B1 3=
9%  perf-sched.wait_time.max.ms.do_syslog.part.0.kmsg_read.vfs_read
      1904 =C2=B1 36%     +38.3%       2634 =C2=B1 42%     +22.9%       234=
0 =C2=B1 28%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exi=
t.__x64_sys_exit_group.do_syscall_64
    135.55            +2.6%     139.06 =C2=B1  6%      +0.5%     136.25    =
    perf-sched.wait_time.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_sysc=
all_64
      0.11 =C2=B1 84%    +494.5%       0.68 =C2=B1130%     +98.7%       0.2=
3 =C2=B1 33%  perf-sched.wait_time.max.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.00         +2e+100%       0.02 =C2=B1185% +1.5e+100%       0.02 =C2=
=B1193%  perf-sched.wait_time.max.ms.exit_to_user_mode_prepare.irqentry_exi=
t_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.00       +2.9e+100%       0.03 =C2=B1244% +3.7e+100%       0.04 =C2=
=B1244%  perf-sched.wait_time.max.ms.exit_to_user_mode_prepare.irqentry_exi=
t_to_user_mode.asm_sysvec_irq_work.[unknown]
      0.00       +1.1e+100%       0.01 =C2=B1244%    -100.0%       0.00    =
    perf-sched.wait_time.max.ms.exit_to_user_mode_prepare.irqentry_exit_to_=
user_mode.asm_sysvec_reschedule_ipi.[unknown]
      2.84 =C2=B1188%   +4984.7%     144.46 =C2=B1242%     -71.1%       0.8=
2 =C2=B1140%  perf-sched.wait_time.max.ms.exit_to_user_mode_prepare.syscall=
_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.[unknown]
    279.94 =C2=B1122%    +452.6%       1546 =C2=B1 59%    +103.5%     569.6=
0 =C2=B1153%  perf-sched.wait_time.max.ms.futex_wait_queue_me.futex_wait.do=
_futex.__x64_sys_futex
      0.03 =C2=B1121%     -81.6%       0.00 =C2=B1244%     +51.9%       0.0=
4 =C2=B1 49%  perf-sched.wait_time.max.ms.io_schedule.__lock_page_killable.=
filemap_fault.__do_fault
      2690            +0.8%       2712            +0.2%       2695        p=
erf-sched.wait_time.max.ms.pipe_read.new_sync_read.vfs_read.ksys_read
      0.11 =C2=B1105%    +402.2%       0.58 =C2=B1204%     -53.3%       0.0=
5 =C2=B1178%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.__alloc_pages_nodemask.alloc_pages_vma.shmem_alloc_page
      0.04 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.appa=
rmor_file_alloc_security.security_file_alloc.__alloc_file
      0.00       +6.9e+100%       0.07 =C2=B1244%    -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.copy=
_page_range.dup_mmap.dup_mm
      0.00       +1.4e+104%     143.13 =C2=B1244%    -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.do_u=
ser_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00          -100.0%       0.00       +1.4e+104%     143.15 =C2=B124=
4%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.down=
_write.anon_vma_clone.anon_vma_fork
      0.10 =C2=B1 90%      +2.4%       0.11 =C2=B1115%     +58.0%       0.1=
6 =C2=B1 67%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.down_write.generic_file_write_iter.new_sync_write
      0.00          -100.0%       0.00        +7.4e+99%       0.01 =C2=B124=
4%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.dput=
.path_openat.do_filp_open
      0.00          -100.0%       0.00       +3.2e+100%       0.03 =C2=B124=
4%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.dput=
.terminate_walk.path_openat
      0.79 =C2=B1223%    -100.0%       0.00           -11.5%       0.70 =C2=
=B1244%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched=
.force_qs_rnp.rcu_gp_kthread.kthread
      1.17 =C2=B1144%     +39.1%       1.62 =C2=B1121%     -72.5%       0.3=
2 =C2=B1 67%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.generic_perform_write.__generic_file_write_iter.generic_file_write_it=
er
      0.06 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.alloc_pid.copy_process
      0.00          -100.0%       0.00       +3.9e+100%       0.04 =C2=B124=
4%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.mnt_=
want_write.path_openat.do_filp_open
      0.00       +5.3e+100%       0.05 =C2=B1244%    -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.mute=
x_lock.__perf_event_read_value.perf_read
      0.00          -100.0%       0.00       +3.2e+104%     319.97 =C2=B112=
1%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.mute=
x_lock.drm_gem_shmem_vunmap.mgag200_handle_damage
      0.38 =C2=B1103%    +151.3%       0.95 =C2=B1129%      -5.0%       0.3=
6 =C2=B1 77%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.pagecache_get_page.shmem_getpage_gfp.shmem_write_begin
      0.15 =C2=B1 79%     +54.7%       0.23 =C2=B1181%      -1.0%       0.1=
5 =C2=B1 82%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.shmem_undo_range.shmem_truncate_range.shmem_evict_inode
      2.52 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.shri=
nk_dentry_list.shrink_dcache_parent.d_invalidate
      0.00          -100.0%       0.00          +4e+99%       0.00 =C2=B124=
4%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.stop=
_one_cpu.sched_exec.bprm_execve
      0.24 =C2=B1  9%    +510.2%       1.47 =C2=B1145%    +346.6%       1.0=
8 =C2=B1162%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.vfs_write.ksys_write.do_syscall_64
     34.69 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.vmst=
at_shepherd.process_one_work.worker_thread
      3970 =C2=B1105%    +117.6%       8637 =C2=B1 36%     +24.5%       494=
1 =C2=B1 87%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.wait_for_completion.affine_move_task.__set_cpus_allowed_ptr
      5.96            +0.1%       5.97            -0.2%       5.95        p=
erf-sched.wait_time.max.ms.rcu_gp_kthread.kthread.ret_from_fork
      2293 =C2=B1  3%      +2.1%       2340 =C2=B1  7%      +1.0%       231=
6 =C2=B1  3%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.ep=
_poll.do_epoll_wait.__x64_sys_epoll_wait
      6587 =C2=B1 59%     -52.9%       3103 =C2=B1109%      -3.3%       637=
2 =C2=B1 55%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.po=
ll_schedule_timeout.constprop.0.do_sys_poll
    504.98            +0.0%     504.98            -0.0%     504.98        p=
erf-sched.wait_time.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.03 =C2=B1 84%     -12.1%       0.03 =C2=B1 99%     -48.2%       0.0=
2 =C2=B1161%  perf-sched.wait_time.max.ms.schedule_timeout.khugepaged.kthre=
ad.ret_from_fork
     22.11 =C2=B1 89%     +19.8%      26.49 =C2=B1 69%     -53.8%      10.2=
3 =C2=B1 33%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_kthread.k=
thread.ret_from_fork
      2.30 =C2=B1214%     -87.4%       0.29 =C2=B1 92%     -92.4%       0.1=
7 =C2=B1 55%  perf-sched.wait_time.max.ms.schedule_timeout.wait_for_complet=
ion.affine_move_task.__set_cpus_allowed_ptr
      1063            +2.3%       1088 =C2=B1  2%     +39.5%       1483 =C2=
=B1 64%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork
      0.04 =C2=B1 77%    +394.0%       0.18 =C2=B1187%    +375.0%       0.1=
7 =C2=B1 69%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_den=
try_open.do_open.isra
      8942 =C2=B1  5%      -1.5%       8812 =C2=B1  5%      -2.2%       874=
1 =C2=B1  5%  perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fo=
rk
     40521            +0.2%      40606            +0.6%      40756        s=
labinfo.Acpi-Operand.active_objs
    724.00            +0.3%     725.86            +0.6%     728.57        s=
labinfo.Acpi-Operand.active_slabs
     40575            +0.2%      40674            +0.6%      40828        s=
labinfo.Acpi-Operand.num_objs
    724.00            +0.3%     725.86            +0.6%     728.57        s=
labinfo.Acpi-Operand.num_slabs
      1301 =C2=B1  9%      +8.9%       1418 =C2=B1  9%     +12.1%       146=
0 =C2=B1  7%  slabinfo.Acpi-Parse.active_objs
     17.83 =C2=B1  9%      +8.9%      19.43 =C2=B1  9%     +12.1%      20.0=
0 =C2=B1  7%  slabinfo.Acpi-Parse.active_slabs
      1301 =C2=B1  9%      +8.9%       1418 =C2=B1  9%     +12.1%       146=
0 =C2=B1  7%  slabinfo.Acpi-Parse.num_objs
     17.83 =C2=B1  9%      +8.9%      19.43 =C2=B1  9%     +12.1%      20.0=
0 =C2=B1  7%  slabinfo.Acpi-Parse.num_slabs
     12959            -0.7%      12866            -0.7%      12863        s=
labinfo.Acpi-State.active_objs
    253.50            -0.7%     251.71            -0.8%     251.57        s=
labinfo.Acpi-State.active_slabs
     12959            -0.7%      12866            -0.7%      12863        s=
labinfo.Acpi-State.num_objs
    253.50            -0.7%     251.71            -0.8%     251.57        s=
labinfo.Acpi-State.num_slabs
      3351 =C2=B1  3%      +2.2%       3425 =C2=B1  4%      -2.0%       328=
3 =C2=B1  6%  slabinfo.PING.active_objs
    104.33 =C2=B1  3%      +2.0%     106.43 =C2=B1  4%      -2.4%     101.8=
6 =C2=B1  6%  slabinfo.PING.active_slabs
      3351 =C2=B1  3%      +2.2%       3425 =C2=B1  4%      -2.0%       328=
3 =C2=B1  6%  slabinfo.PING.num_objs
    104.33 =C2=B1  3%      +2.0%     106.43 =C2=B1  4%      -2.4%     101.8=
6 =C2=B1  6%  slabinfo.PING.num_slabs
    512.00            +0.0%     512.00            +0.0%     512.00        s=
labinfo.RAW.active_objs
     16.00            +0.0%      16.00            +0.0%      16.00        s=
labinfo.RAW.active_slabs
    512.00            +0.0%     512.00            +0.0%     512.00        s=
labinfo.RAW.num_objs
     16.00            +0.0%      16.00            +0.0%      16.00        s=
labinfo.RAW.num_slabs
    264.33 =C2=B1  3%      +4.0%     274.86 =C2=B1  4%      +5.4%     278.5=
7 =C2=B1  4%  slabinfo.RAWv6.active_objs
     10.17 =C2=B1  3%      +4.0%      10.57 =C2=B1  4%      +5.4%      10.7=
1 =C2=B1  4%  slabinfo.RAWv6.active_slabs
    264.33 =C2=B1  3%      +4.0%     274.86 =C2=B1  4%      +5.4%     278.5=
7 =C2=B1  4%  slabinfo.RAWv6.num_objs
     10.17 =C2=B1  3%      +4.0%      10.57 =C2=B1  4%      +5.4%      10.7=
1 =C2=B1  4%  slabinfo.RAWv6.num_slabs
     56.00            -7.1%      52.00 =C2=B1 12%      +0.0%      56.00    =
    slabinfo.TCP.active_objs
      4.00            -7.1%       3.71 =C2=B1 12%      +0.0%       4.00    =
    slabinfo.TCP.active_slabs
     56.00            -7.1%      52.00 =C2=B1 12%      +0.0%      56.00    =
    slabinfo.TCP.num_objs
      4.00            -7.1%       3.71 =C2=B1 12%      +0.0%       4.00    =
    slabinfo.TCP.num_slabs
     39.00            +0.0%      39.00            -4.8%      37.14 =C2=B1 1=
2%  slabinfo.TCPv6.active_objs
      3.00            +0.0%       3.00            -4.8%       2.86 =C2=B1 1=
2%  slabinfo.TCPv6.active_slabs
     39.00            +0.0%      39.00            -4.8%      37.14 =C2=B1 1=
2%  slabinfo.TCPv6.num_objs
      3.00            +0.0%       3.00            -4.8%       2.86 =C2=B1 1=
2%  slabinfo.TCPv6.num_slabs
    157.00            -2.3%     153.43 =C2=B1  5%      -2.5%     153.14 =C2=
=B1  4%  slabinfo.UDPv6.active_objs
      6.00            -2.4%       5.86 =C2=B1  5%      -2.4%       5.86 =C2=
=B1  5%  slabinfo.UDPv6.active_slabs
    157.00            -2.3%     153.43 =C2=B1  5%      -2.5%     153.14 =C2=
=B1  4%  slabinfo.UDPv6.num_objs
      6.00            -2.4%       5.86 =C2=B1  5%      -2.4%       5.86 =C2=
=B1  5%  slabinfo.UDPv6.num_slabs
     40958            -0.4%      40787 =C2=B1  2%      +1.1%      41426 =C2=
=B1  4%  slabinfo.anon_vma.active_objs
    889.83            -0.4%     886.14 =C2=B1  2%      +1.2%     900.14 =C2=
=B1  4%  slabinfo.anon_vma.active_slabs
     40958            -0.4%      40787 =C2=B1  2%      +1.1%      41426 =C2=
=B1  4%  slabinfo.anon_vma.num_objs
    889.83            -0.4%     886.14 =C2=B1  2%      +1.2%     900.14 =C2=
=B1  4%  slabinfo.anon_vma.num_slabs
     88795            -0.2%      88613            +1.5%      90113 =C2=B1  =
4%  slabinfo.anon_vma_chain.active_objs
      1387            -0.2%       1384            +1.5%       1407 =C2=B1  =
4%  slabinfo.anon_vma_chain.active_slabs
     88795            -0.2%      88613            +1.5%      90113 =C2=B1  =
4%  slabinfo.anon_vma_chain.num_objs
      1387            -0.2%       1384            +1.5%       1407 =C2=B1  =
4%  slabinfo.anon_vma_chain.num_slabs
    140.00 =C2=B1  8%     -12.2%     122.86 =C2=B1 10%      -2.0%     137.1=
4 =C2=B1  5%  slabinfo.bdev_cache.active_objs
      7.00 =C2=B1  8%     -12.2%       6.14 =C2=B1 10%      -2.0%       6.8=
6 =C2=B1  5%  slabinfo.bdev_cache.active_slabs
    140.00 =C2=B1  8%     -12.2%     122.86 =C2=B1 10%      -2.0%     137.1=
4 =C2=B1  5%  slabinfo.bdev_cache.num_objs
      7.00 =C2=B1  8%     -12.2%       6.14 =C2=B1 10%      -2.0%       6.8=
6 =C2=B1  5%  slabinfo.bdev_cache.num_slabs
    144.00 =C2=B1  6%     +11.1%     160.00 =C2=B1  9%     +23.8%     178.2=
9 =C2=B1 11%  slabinfo.biovec-128.active_objs
      9.00 =C2=B1  6%     +11.1%      10.00 =C2=B1  9%     +23.8%      11.1=
4 =C2=B1 11%  slabinfo.biovec-128.active_slabs
    144.00 =C2=B1  6%     +11.1%     160.00 =C2=B1  9%     +23.8%     178.2=
9 =C2=B1 11%  slabinfo.biovec-128.num_objs
      9.00 =C2=B1  6%     +11.1%      10.00 =C2=B1  9%     +23.8%      11.1=
4 =C2=B1 11%  slabinfo.biovec-128.num_slabs
    384.00 =C2=B1  4%      +6.0%     406.86 =C2=B1 10%     +11.9%     429.7=
1 =C2=B1  8%  slabinfo.biovec-64.active_objs
     12.00 =C2=B1  4%      +6.0%      12.71 =C2=B1 10%     +11.9%      13.4=
3 =C2=B1  8%  slabinfo.biovec-64.active_slabs
    384.00 =C2=B1  4%      +6.0%     406.86 =C2=B1 10%     +11.9%     429.7=
1 =C2=B1  8%  slabinfo.biovec-64.num_objs
     12.00 =C2=B1  4%      +6.0%      12.71 =C2=B1 10%     +11.9%      13.4=
3 =C2=B1  8%  slabinfo.biovec-64.num_slabs
     57.33 =C2=B1  5%      -0.3%      57.14 =C2=B1  4%      -0.3%      57.1=
4 =C2=B1  4%  slabinfo.biovec-max.active_objs
      7.17 =C2=B1  5%      -0.3%       7.14 =C2=B1  4%      -0.3%       7.1=
4 =C2=B1  4%  slabinfo.biovec-max.active_slabs
     57.33 =C2=B1  5%      -0.3%      57.14 =C2=B1  4%      -0.3%      57.1=
4 =C2=B1  4%  slabinfo.biovec-max.num_objs
      7.17 =C2=B1  5%      -0.3%       7.14 =C2=B1  4%      -0.3%       7.1=
4 =C2=B1  4%  slabinfo.biovec-max.num_slabs
    624.00 =C2=B1  7%      +1.8%     635.14 =C2=B1  7%     +17.9%     735.4=
3 =C2=B1  9%  slabinfo.buffer_head.active_objs
      8.00 =C2=B1  7%      +1.8%       8.14 =C2=B1  7%     +17.9%       9.4=
3 =C2=B1  9%  slabinfo.buffer_head.active_slabs
    624.00 =C2=B1  7%      +1.8%     635.14 =C2=B1  7%     +17.9%     735.4=
3 =C2=B1  9%  slabinfo.buffer_head.num_objs
      8.00 =C2=B1  7%      +1.8%       8.14 =C2=B1  7%     +17.9%       9.4=
3 =C2=B1  9%  slabinfo.buffer_head.num_slabs
     13228            -0.1%      13217            +0.3%      13264        s=
labinfo.cred_jar.active_objs
    314.17            -0.0%     314.14            +0.4%     315.57        s=
labinfo.cred_jar.active_slabs
     13228            -0.1%      13217            +0.3%      13264        s=
labinfo.cred_jar.num_objs
    314.17            -0.0%     314.14            +0.4%     315.57        s=
labinfo.cred_jar.num_slabs
     42.00            +0.0%      42.00            +0.0%      42.00        s=
labinfo.dax_cache.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dax_cache.active_slabs
     42.00            +0.0%      42.00            +0.0%      42.00        s=
labinfo.dax_cache.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dax_cache.num_slabs
    141406            -0.5%     140636            +0.3%     141861        s=
labinfo.dentry.active_objs
      3369            -0.6%       3349            +0.3%       3378        s=
labinfo.dentry.active_slabs
    141538            -0.6%     140695            +0.3%     141920        s=
labinfo.dentry.num_objs
      3369            -0.6%       3349            +0.3%       3378        s=
labinfo.dentry.num_slabs
     30.00            +0.0%      30.00            +0.0%      30.00        s=
labinfo.dmaengine-unmap-128.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dmaengine-unmap-128.active_slabs
     30.00            +0.0%      30.00            +0.0%      30.00        s=
labinfo.dmaengine-unmap-128.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dmaengine-unmap-128.num_slabs
      1600 =C2=B1 23%      +6.9%       1711 =C2=B1 20%      -0.9%       158=
6 =C2=B1 15%  slabinfo.dmaengine-unmap-16.active_objs
     37.67 =C2=B1 23%      +7.0%      40.29 =C2=B1 20%      -1.0%      37.2=
9 =C2=B1 16%  slabinfo.dmaengine-unmap-16.active_slabs
      1600 =C2=B1 23%      +6.9%       1711 =C2=B1 20%      -0.9%       158=
6 =C2=B1 15%  slabinfo.dmaengine-unmap-16.num_objs
     37.67 =C2=B1 23%      +7.0%      40.29 =C2=B1 20%      -1.0%      37.2=
9 =C2=B1 16%  slabinfo.dmaengine-unmap-16.num_slabs
     15.00            +0.0%      15.00            +0.0%      15.00        s=
labinfo.dmaengine-unmap-256.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dmaengine-unmap-256.active_slabs
     15.00            +0.0%      15.00            +0.0%      15.00        s=
labinfo.dmaengine-unmap-256.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dmaengine-unmap-256.num_slabs
     53326 =C2=B1  4%      -5.8%      50212 =C2=B1  4%      +0.7%      5369=
4 =C2=B1  3%  slabinfo.ep_head.active_objs
    208.17 =C2=B1  4%      -5.8%     196.14 =C2=B1  4%      +0.7%     209.5=
7 =C2=B1  3%  slabinfo.ep_head.active_slabs
     53326 =C2=B1  4%      -5.8%      50212 =C2=B1  4%      +0.7%      5369=
4 =C2=B1  3%  slabinfo.ep_head.num_objs
    208.17 =C2=B1  4%      -5.8%     196.14 =C2=B1  4%      +0.7%     209.5=
7 =C2=B1  3%  slabinfo.ep_head.num_slabs
    306.00            +0.0%     306.00            +0.0%     306.00        s=
labinfo.ext4_extent_status.active_objs
      3.00            +0.0%       3.00            +0.0%       3.00        s=
labinfo.ext4_extent_status.active_slabs
    306.00            +0.0%     306.00            +0.0%     306.00        s=
labinfo.ext4_extent_status.num_objs
      3.00            +0.0%       3.00            +0.0%       3.00        s=
labinfo.ext4_extent_status.num_slabs
    784.00            +0.0%     784.00            +0.0%     784.00        s=
labinfo.ext4_groupinfo_4k.active_objs
     14.00            +0.0%      14.00            +0.0%      14.00        s=
labinfo.ext4_groupinfo_4k.active_slabs
    784.00            +0.0%     784.00            +0.0%     784.00        s=
labinfo.ext4_groupinfo_4k.num_objs
     14.00            +0.0%      14.00            +0.0%      14.00        s=
labinfo.ext4_groupinfo_4k.num_slabs
     81.00            +0.0%      81.00            +0.0%      81.00        s=
labinfo.ext4_inode_cache.active_objs
      3.00            +0.0%       3.00            +0.0%       3.00        s=
labinfo.ext4_inode_cache.active_slabs
     81.00            +0.0%      81.00            +0.0%      81.00        s=
labinfo.ext4_inode_cache.num_objs
      3.00            +0.0%       3.00            +0.0%       3.00        s=
labinfo.ext4_inode_cache.num_slabs
    128.00            +0.0%     128.00            +0.0%     128.00        s=
labinfo.ext4_pending_reservation.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.ext4_pending_reservation.active_slabs
    128.00            +0.0%     128.00            +0.0%     128.00        s=
labinfo.ext4_pending_reservation.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.ext4_pending_reservation.num_slabs
    102.00            +0.0%     102.00            +0.0%     102.00        s=
labinfo.ext4_system_zone.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.ext4_system_zone.active_slabs
    102.00            +0.0%     102.00            +0.0%     102.00        s=
labinfo.ext4_system_zone.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.ext4_system_zone.num_slabs
      2778 =C2=B1 10%      +2.7%       2853 =C2=B1  5%      +6.9%       296=
9 =C2=B1  6%  slabinfo.file_lock_cache.active_objs
     36.67 =C2=B1  9%      +2.5%      37.57 =C2=B1  5%      +7.1%      39.2=
9 =C2=B1  6%  slabinfo.file_lock_cache.active_slabs
      2778 =C2=B1 10%      +2.7%       2853 =C2=B1  5%      +6.9%       296=
9 =C2=B1  6%  slabinfo.file_lock_cache.num_objs
     36.67 =C2=B1  9%      +2.5%      37.57 =C2=B1  5%      +7.1%      39.2=
9 =C2=B1  6%  slabinfo.file_lock_cache.num_slabs
     11920            -0.1%      11907            +0.8%      12019        s=
labinfo.files_cache.active_objs
    258.50            -0.1%     258.29            +0.9%     260.86        s=
labinfo.files_cache.active_slabs
     11920            -0.1%      11907            +0.8%      12019        s=
labinfo.files_cache.num_objs
    258.50            -0.1%     258.29            +0.9%     260.86        s=
labinfo.files_cache.num_slabs
     68085 =C2=B1  4%      +0.5%      68421 =C2=B1  2%      +2.5%      6978=
7 =C2=B1  2%  slabinfo.filp.active_objs
      1064 =C2=B1  4%      +0.6%       1070 =C2=B1  2%      +2.5%       109=
0 =C2=B1  2%  slabinfo.filp.active_slabs
     68120 =C2=B1  4%      +0.6%      68529 =C2=B1  2%      +2.5%      6982=
7 =C2=B1  2%  slabinfo.filp.num_objs
      1064 =C2=B1  4%      +0.6%       1070 =C2=B1  2%      +2.5%       109=
0 =C2=B1  2%  slabinfo.filp.num_slabs
      3555 =C2=B1  9%      -2.0%       3484 =C2=B1 12%      +3.7%       368=
8 =C2=B1 13%  slabinfo.fsnotify_mark_connector.active_objs
     27.50 =C2=B1  9%      -2.3%      26.86 =C2=B1 12%      +3.9%      28.5=
7 =C2=B1 13%  slabinfo.fsnotify_mark_connector.active_slabs
      3555 =C2=B1  9%      -2.0%       3484 =C2=B1 12%      +3.7%       368=
8 =C2=B1 13%  slabinfo.fsnotify_mark_connector.num_objs
     27.50 =C2=B1  9%      -2.3%      26.86 =C2=B1 12%      +3.9%      28.5=
7 =C2=B1 13%  slabinfo.fsnotify_mark_connector.num_slabs
     13812            +0.1%      13830            +1.0%      13952        s=
labinfo.ftrace_event_field.active_objs
    162.50            +0.1%     162.71            +1.0%     164.14        s=
labinfo.ftrace_event_field.active_slabs
     13812            +0.1%      13830            +1.0%      13952        s=
labinfo.ftrace_event_field.num_objs
    162.50            +0.1%     162.71            +1.0%     164.14        s=
labinfo.ftrace_event_field.num_slabs
    104.00            +0.0%     104.00            +0.0%     104.00        s=
labinfo.hugetlbfs_inode_cache.active_objs
      2.00            +0.0%       2.00            +0.0%       2.00        s=
labinfo.hugetlbfs_inode_cache.active_slabs
    104.00            +0.0%     104.00            +0.0%     104.00        s=
labinfo.hugetlbfs_inode_cache.num_objs
      2.00            +0.0%       2.00            +0.0%       2.00        s=
labinfo.hugetlbfs_inode_cache.num_slabs
     82023            -0.0%      82022            +0.6%      82503        s=
labinfo.inode_cache.active_objs
      1521            -0.0%       1521            +0.6%       1530        s=
labinfo.inode_cache.active_slabs
     82196            -0.0%      82191            +0.6%      82677        s=
labinfo.inode_cache.num_objs
      1521            -0.0%       1521            +0.6%       1530        s=
labinfo.inode_cache.num_slabs
    256.00            +0.0%     256.00            +0.0%     256.00        s=
labinfo.jbd2_revoke_table_s.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.jbd2_revoke_table_s.active_slabs
    256.00            +0.0%     256.00            +0.0%     256.00        s=
labinfo.jbd2_revoke_table_s.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.jbd2_revoke_table_s.num_slabs
    114193            -0.1%     114110            +0.2%     114435        s=
labinfo.kernfs_node_cache.active_objs
      1784            -0.1%       1782            +0.2%       1787        s=
labinfo.kernfs_node_cache.active_slabs
    114193            -0.1%     114110            +0.2%     114435        s=
labinfo.kernfs_node_cache.num_objs
      1784            -0.1%       1782            +0.2%       1787        s=
labinfo.kernfs_node_cache.num_slabs
      4706 =C2=B1  9%      +7.0%       5035 =C2=B1  5%      +5.0%       494=
1 =C2=B1  7%  slabinfo.khugepaged_mm_slot.active_objs
     63.67 =C2=B1  9%      +6.8%      68.00 =C2=B1  5%      +4.8%      66.7=
1 =C2=B1  7%  slabinfo.khugepaged_mm_slot.active_slabs
      4706 =C2=B1  9%      +7.0%       5035 =C2=B1  5%      +5.0%       494=
1 =C2=B1  7%  slabinfo.khugepaged_mm_slot.num_objs
     63.67 =C2=B1  9%      +6.8%      68.00 =C2=B1  5%      +4.8%      66.7=
1 =C2=B1  7%  slabinfo.khugepaged_mm_slot.num_slabs
     18844            +0.1%      18859            -0.2%      18809        s=
labinfo.kmalloc-128.active_objs
    295.83            +0.5%     297.43            +0.1%     296.00        s=
labinfo.kmalloc-128.active_slabs
     18935            +0.6%      19049            +0.1%      18952        s=
labinfo.kmalloc-128.num_objs
    295.83            +0.5%     297.43            +0.1%     296.00        s=
labinfo.kmalloc-128.num_slabs
     73896            -0.1%      73796            +0.4%      74172        s=
labinfo.kmalloc-16.active_objs
    288.67            -0.1%     288.29            +0.4%     289.86        s=
labinfo.kmalloc-16.active_slabs
     73898            -0.1%      73801            +0.4%      74203        s=
labinfo.kmalloc-16.num_objs
    288.67            -0.1%     288.29            +0.4%     289.86        s=
labinfo.kmalloc-16.num_slabs
     12240            -0.0%      12235            -0.2%      12209        s=
labinfo.kmalloc-192.active_objs
    295.00            -0.4%     293.86            -0.1%     294.57        s=
labinfo.kmalloc-192.active_slabs
     12390            -0.3%      12347            -0.1%      12372        s=
labinfo.kmalloc-192.num_objs
    295.00            -0.4%     293.86            -0.1%     294.57        s=
labinfo.kmalloc-192.num_slabs
     11273            +0.4%      11314            +0.3%      11311        s=
labinfo.kmalloc-1k.active_objs
    355.00            +0.0%     355.14            +0.3%     356.14        s=
labinfo.kmalloc-1k.active_slabs
     11370            +0.1%      11382            +0.3%      11408        s=
labinfo.kmalloc-1k.num_objs
    355.00            +0.0%     355.14            +0.3%     356.14        s=
labinfo.kmalloc-1k.num_slabs
     20671            -0.2%      20626            -0.3%      20614        s=
labinfo.kmalloc-256.active_objs
    328.17            -0.5%     326.57            -0.7%     326.00        s=
labinfo.kmalloc-256.active_slabs
     21017            -0.4%      20926            -0.7%      20875        s=
labinfo.kmalloc-256.num_objs
    328.17            -0.5%     326.57            -0.7%     326.00        s=
labinfo.kmalloc-256.num_slabs
     11373            +1.4%      11536            +1.9%      11585        s=
labinfo.kmalloc-2k.active_objs
    712.83            +1.4%     723.14            +1.8%     725.43        s=
labinfo.kmalloc-2k.active_slabs
     11410            +1.5%      11576            +1.8%      11615        s=
labinfo.kmalloc-2k.num_objs
    712.83            +1.4%     723.14            +1.8%     725.43        s=
labinfo.kmalloc-2k.num_slabs
     75291 =C2=B1  2%      -0.5%      74893            +0.2%      75420 =C2=
=B1  2%  slabinfo.kmalloc-32.active_objs
    588.67 =C2=B1  2%      -0.6%     585.14            +0.1%     589.29 =C2=
=B1  2%  slabinfo.kmalloc-32.active_slabs
     75376 =C2=B1  2%      -0.6%      74958            +0.1%      75487 =C2=
=B1  2%  slabinfo.kmalloc-32.num_objs
    588.67 =C2=B1  2%      -0.6%     585.14            +0.1%     589.29 =C2=
=B1  2%  slabinfo.kmalloc-32.num_slabs
      3326            -0.0%       3325            +0.4%       3339        s=
labinfo.kmalloc-4k.active_objs
    419.50            +0.3%     420.86            +0.6%     421.86        s=
labinfo.kmalloc-4k.active_slabs
      3358            +0.3%       3370            +0.6%       3377        s=
labinfo.kmalloc-4k.num_objs
    419.50            +0.3%     420.86            +0.6%     421.86        s=
labinfo.kmalloc-4k.num_slabs
     36407 =C2=B1  2%      -0.8%      36104 =C2=B1  2%      -1.5%      3584=
9 =C2=B1  3%  slabinfo.kmalloc-512.active_objs
    572.00 =C2=B1  2%      -0.6%     568.71 =C2=B1  2%      -1.4%     563.7=
1 =C2=B1  3%  slabinfo.kmalloc-512.active_slabs
     36644 =C2=B1  2%      -0.6%      36421 =C2=B1  2%      -1.5%      3609=
4 =C2=B1  3%  slabinfo.kmalloc-512.num_objs
    572.00 =C2=B1  2%      -0.6%     568.71 =C2=B1  2%      -1.4%     563.7=
1 =C2=B1  3%  slabinfo.kmalloc-512.num_slabs
     35497            +0.2%      35566            +0.4%      35643        s=
labinfo.kmalloc-64.active_objs
    557.67            +0.2%     558.57            +0.5%     560.29        s=
labinfo.kmalloc-64.active_slabs
     35700            +0.3%      35792            +0.5%      35865        s=
labinfo.kmalloc-64.num_objs
    557.67            +0.2%     558.57            +0.5%     560.29        s=
labinfo.kmalloc-64.num_slabs
    138700            -0.2%     138485            -0.1%     138566        s=
labinfo.kmalloc-8.active_objs
    271.33            +0.1%     271.71            -0.1%     271.00        s=
labinfo.kmalloc-8.active_slabs
    139005            +0.1%     139168            -0.1%     138824        s=
labinfo.kmalloc-8.num_objs
    271.33            +0.1%     271.71            -0.1%     271.00        s=
labinfo.kmalloc-8.num_slabs
      1445            -0.2%       1442            -0.2%       1443        s=
labinfo.kmalloc-8k.active_objs
    364.17            -0.2%     363.43            -0.2%     363.57        s=
labinfo.kmalloc-8k.active_slabs
      1459            -0.2%       1456            -0.2%       1457        s=
labinfo.kmalloc-8k.num_objs
    364.17            -0.2%     363.43            -0.2%     363.57        s=
labinfo.kmalloc-8k.num_slabs
     21358 =C2=B1  2%      +0.3%      21430 =C2=B1  3%      -1.0%      2113=
6 =C2=B1  3%  slabinfo.kmalloc-96.active_objs
    508.50 =C2=B1  2%      +0.4%     510.29 =C2=B1  3%      -0.9%     504.1=
4 =C2=B1  3%  slabinfo.kmalloc-96.active_slabs
     21383 =C2=B1  2%      +0.3%      21456 =C2=B1  3%      -0.9%      2119=
9 =C2=B1  3%  slabinfo.kmalloc-96.num_objs
    508.50 =C2=B1  2%      +0.4%     510.29 =C2=B1  3%      -0.9%     504.1=
4 =C2=B1  3%  slabinfo.kmalloc-96.num_slabs
    554.67 =C2=B1 14%      -1.1%     548.57 =C2=B1  5%      +2.2%     566.8=
6 =C2=B1 11%  slabinfo.kmalloc-rcl-128.active_objs
      8.67 =C2=B1 14%      -1.1%       8.57 =C2=B1  5%      +2.2%       8.8=
6 =C2=B1 11%  slabinfo.kmalloc-rcl-128.active_slabs
    554.67 =C2=B1 14%      -1.1%     548.57 =C2=B1  5%      +2.2%     566.8=
6 =C2=B1 11%  slabinfo.kmalloc-rcl-128.num_objs
      8.67 =C2=B1 14%      -1.1%       8.57 =C2=B1  5%      +2.2%       8.8=
6 =C2=B1 11%  slabinfo.kmalloc-rcl-128.num_slabs
    294.00 =C2=B1  8%     -12.2%     258.00 =C2=B1 10%      -6.1%     276.0=
0 =C2=B1 11%  slabinfo.kmalloc-rcl-192.active_objs
      7.00 =C2=B1  8%     -12.2%       6.14 =C2=B1 10%      -6.1%       6.5=
7 =C2=B1 11%  slabinfo.kmalloc-rcl-192.active_slabs
    294.00 =C2=B1  8%     -12.2%     258.00 =C2=B1 10%      -6.1%     276.0=
0 =C2=B1 11%  slabinfo.kmalloc-rcl-192.num_objs
      7.00 =C2=B1  8%     -12.2%       6.14 =C2=B1 10%      -6.1%       6.5=
7 =C2=B1 11%  slabinfo.kmalloc-rcl-192.num_slabs
    192.00            +0.0%     192.00            +0.0%     192.00        s=
labinfo.kmalloc-rcl-256.active_objs
      3.00            +0.0%       3.00            +0.0%       3.00        s=
labinfo.kmalloc-rcl-256.active_slabs
    192.00            +0.0%     192.00            +0.0%     192.00        s=
labinfo.kmalloc-rcl-256.num_objs
      3.00            +0.0%       3.00            +0.0%       3.00        s=
labinfo.kmalloc-rcl-256.num_slabs
     18025            -0.1%      18010            -0.1%      18000        s=
labinfo.kmalloc-rcl-512.active_objs
    281.17            +0.1%     281.57            +0.0%     281.29        s=
labinfo.kmalloc-rcl-512.active_slabs
     18025            +0.1%      18046            +0.1%      18035        s=
labinfo.kmalloc-rcl-512.num_objs
    281.17            +0.1%     281.57            +0.0%     281.29        s=
labinfo.kmalloc-rcl-512.num_slabs
      5600 =C2=B1  8%      -5.8%       5272 =C2=B1  4%      +0.2%       561=
1 =C2=B1  9%  slabinfo.kmalloc-rcl-64.active_objs
     87.00 =C2=B1  8%      -5.9%      81.86 =C2=B1  4%      +0.2%      87.1=
4 =C2=B1  9%  slabinfo.kmalloc-rcl-64.active_slabs
      5600 =C2=B1  8%      -5.8%       5272 =C2=B1  4%      +0.2%       561=
1 =C2=B1  9%  slabinfo.kmalloc-rcl-64.num_objs
     87.00 =C2=B1  8%      -5.9%      81.86 =C2=B1  4%      +0.2%      87.1=
4 =C2=B1  9%  slabinfo.kmalloc-rcl-64.num_slabs
      2132 =C2=B1 11%      -3.4%       2061 =C2=B1  6%      +0.3%       213=
8 =C2=B1  7%  slabinfo.kmalloc-rcl-96.active_objs
     50.50 =C2=B1 11%      -3.5%      48.71 =C2=B1  6%      +0.1%      50.5=
7 =C2=B1  7%  slabinfo.kmalloc-rcl-96.active_slabs
      2132 =C2=B1 11%      -3.4%       2061 =C2=B1  6%      +0.3%       213=
8 =C2=B1  7%  slabinfo.kmalloc-rcl-96.num_objs
     50.50 =C2=B1 11%      -3.5%      48.71 =C2=B1  6%      +0.1%      50.5=
7 =C2=B1  7%  slabinfo.kmalloc-rcl-96.num_slabs
    586.67 =C2=B1  9%     +27.8%     749.71 =C2=B1 12%     +16.9%     685.7=
1 =C2=B1  8%  slabinfo.kmem_cache.active_objs
      9.17 =C2=B1  9%     +27.8%      11.71 =C2=B1 12%     +16.9%      10.7=
1 =C2=B1  8%  slabinfo.kmem_cache.active_slabs
    586.67 =C2=B1  9%     +27.8%     749.71 =C2=B1 12%     +16.9%     685.7=
1 =C2=B1  8%  slabinfo.kmem_cache.num_objs
      9.17 =C2=B1  9%     +27.8%      11.71 =C2=B1 12%     +16.9%      10.7=
1 =C2=B1  8%  slabinfo.kmem_cache.num_slabs
    733.67 =C2=B1  7%     +22.2%     896.71 =C2=B1 10%     +13.5%     832.7=
1 =C2=B1  6%  slabinfo.kmem_cache_node.active_objs
     12.17 =C2=B1  7%     +20.9%      14.71 =C2=B1 10%     +12.7%      13.7=
1 =C2=B1  6%  slabinfo.kmem_cache_node.active_slabs
    778.67 =C2=B1  7%     +20.9%     941.71 =C2=B1 10%     +12.7%     877.7=
1 =C2=B1  6%  slabinfo.kmem_cache_node.num_objs
     12.17 =C2=B1  7%     +20.9%      14.71 =C2=B1 10%     +12.7%      13.7=
1 =C2=B1  6%  slabinfo.kmem_cache_node.num_slabs
     48159            -0.3%      47993            -0.1%      48121        s=
labinfo.lsm_file_cache.active_objs
    282.50            -0.3%     281.57            -0.1%     282.29        s=
labinfo.lsm_file_cache.active_slabs
     48159            -0.3%      47993            -0.1%      48121        s=
labinfo.lsm_file_cache.num_objs
    282.50            -0.3%     281.57            -0.1%     282.29        s=
labinfo.lsm_file_cache.num_slabs
      7934            +0.2%       7948            +1.3%       8035        s=
labinfo.mm_struct.active_objs
    263.83            +0.2%     264.43            +1.3%     267.14        s=
labinfo.mm_struct.active_slabs
      7934            +0.2%       7948            +1.3%       8035        s=
labinfo.mm_struct.num_objs
    263.83            +0.2%     264.43            +1.3%     267.14        s=
labinfo.mm_struct.num_slabs
    900.00 =C2=B1 10%      +1.9%     917.14 =C2=B1 11%      +2.7%     924.4=
3 =C2=B1 10%  slabinfo.mnt_cache.active_objs
     16.67 =C2=B1 10%      +2.9%      17.14 =C2=B1 11%      +3.7%      17.2=
9 =C2=B1 11%  slabinfo.mnt_cache.active_slabs
    900.00 =C2=B1 10%      +1.9%     917.14 =C2=B1 11%      +2.7%     924.4=
3 =C2=B1 10%  slabinfo.mnt_cache.num_objs
     16.67 =C2=B1 10%      +2.9%      17.14 =C2=B1 11%      +3.7%      17.2=
9 =C2=B1 11%  slabinfo.mnt_cache.num_slabs
     34.00            +0.0%      34.00            +0.0%      34.00        s=
labinfo.mqueue_inode_cache.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.mqueue_inode_cache.active_slabs
     34.00            +0.0%      34.00            +0.0%      34.00        s=
labinfo.mqueue_inode_cache.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.mqueue_inode_cache.num_slabs
      2048            +0.2%       2052            +0.2%       2051        s=
labinfo.names_cache.active_objs
    256.00            +0.2%     256.57            +0.2%     256.43        s=
labinfo.names_cache.active_slabs
      2048            +0.2%       2052            +0.2%       2051        s=
labinfo.names_cache.num_objs
    256.00            +0.2%     256.57            +0.2%     256.43        s=
labinfo.names_cache.num_slabs
     36.00            +0.0%      36.00            +0.0%      36.00        s=
labinfo.nfs_read_data.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.nfs_read_data.active_slabs
     36.00            +0.0%      36.00            +0.0%      36.00        s=
labinfo.nfs_read_data.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.nfs_read_data.num_slabs
    310.00            +0.0%     310.00            +0.0%     310.00        s=
labinfo.numa_policy.active_objs
      5.00            +0.0%       5.00            +0.0%       5.00        s=
labinfo.numa_policy.active_slabs
    310.00            +0.0%     310.00            +0.0%     310.00        s=
labinfo.numa_policy.num_objs
      5.00            +0.0%       5.00            +0.0%       5.00        s=
labinfo.numa_policy.num_slabs
     20515 =C2=B1  2%      -2.1%      20088 =C2=B1  2%      -0.5%      2041=
6 =C2=B1  2%  slabinfo.pde_opener.active_objs
    200.67 =C2=B1  2%      -2.1%     196.43 =C2=B1  2%      -0.5%     199.5=
7 =C2=B1  2%  slabinfo.pde_opener.active_slabs
     20515 =C2=B1  2%      -2.1%      20088 =C2=B1  2%      -0.5%      2041=
6 =C2=B1  2%  slabinfo.pde_opener.num_objs
    200.67 =C2=B1  2%      -2.1%     196.43 =C2=B1  2%      -0.5%     199.5=
7 =C2=B1  2%  slabinfo.pde_opener.num_slabs
     18362            -0.2%      18321            +0.6%      18476        s=
labinfo.pid.active_objs
    286.17            -0.2%     285.57            +0.7%     288.14        s=
labinfo.pid.active_slabs
     18362            -0.2%      18321            +0.6%      18476        s=
labinfo.pid.num_objs
    286.17            -0.2%     285.57            +0.7%     288.14        s=
labinfo.pid.num_slabs
      3360 =C2=B1  5%      +2.6%       3446 =C2=B1  3%      +0.4%       337=
3 =C2=B1  5%  slabinfo.pool_workqueue.active_objs
     52.50 =C2=B1  4%      +3.4%      54.29 =C2=B1  4%      +1.2%      53.1=
4 =C2=B1  5%  slabinfo.pool_workqueue.active_slabs
      3381 =C2=B1  4%      +3.5%       3500 =C2=B1  4%      +1.3%       342=
5 =C2=B1  5%  slabinfo.pool_workqueue.num_objs
     52.50 =C2=B1  4%      +3.4%      54.29 =C2=B1  4%      +1.2%      53.1=
4 =C2=B1  5%  slabinfo.pool_workqueue.num_slabs
      1022 =C2=B1  4%      +8.0%       1104 =C2=B1  5%      +7.4%       109=
8 =C2=B1  6%  slabinfo.proc_dir_entry.active_objs
     24.33 =C2=B1  4%      +8.0%      26.29 =C2=B1  5%      +7.4%      26.1=
4 =C2=B1  6%  slabinfo.proc_dir_entry.active_slabs
      1022 =C2=B1  4%      +8.0%       1104 =C2=B1  5%      +7.4%       109=
8 =C2=B1  6%  slabinfo.proc_dir_entry.num_objs
     24.33 =C2=B1  4%      +8.0%      26.29 =C2=B1  5%      +7.4%      26.1=
4 =C2=B1  6%  slabinfo.proc_dir_entry.num_slabs
     30217            -0.6%      30022            -0.1%      30199        s=
labinfo.proc_inode_cache.active_objs
    629.00            -0.6%     625.00            -0.1%     628.57        s=
labinfo.proc_inode_cache.active_slabs
     30221            -0.6%      30026            -0.1%      30201        s=
labinfo.proc_inode_cache.num_objs
    629.00            -0.6%     625.00            -0.1%     628.57        s=
labinfo.proc_inode_cache.num_slabs
     25478            -0.2%      25419            -0.5%      25362        s=
labinfo.radix_tree_node.active_objs
    454.67            -0.3%     453.43            -0.5%     452.43        s=
labinfo.radix_tree_node.active_slabs
     25478            -0.2%      25419            -0.5%      25362        s=
labinfo.radix_tree_node.num_objs
    454.67            -0.3%     453.43            -0.5%     452.43        s=
labinfo.radix_tree_node.num_slabs
     32.00            +0.0%      32.00            +0.0%      32.00        s=
labinfo.request_queue.active_objs
      2.00            +0.0%       2.00            +0.0%       2.00        s=
labinfo.request_queue.active_slabs
     32.00            +0.0%      32.00            +0.0%      32.00        s=
labinfo.request_queue.num_objs
      2.00            +0.0%       2.00            +0.0%       2.00        s=
labinfo.request_queue.num_slabs
     51.00            +0.0%      51.00            +0.0%      51.00        s=
labinfo.rpc_inode_cache.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.rpc_inode_cache.active_slabs
     51.00            +0.0%      51.00            +0.0%      51.00        s=
labinfo.rpc_inode_cache.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.rpc_inode_cache.num_slabs
    448.00            +0.0%     448.00            +0.0%     448.00        s=
labinfo.scsi_sense_cache.active_objs
      7.00            +0.0%       7.00            +0.0%       7.00        s=
labinfo.scsi_sense_cache.active_slabs
    448.00            +0.0%     448.00            +0.0%     448.00        s=
labinfo.scsi_sense_cache.num_objs
      7.00            +0.0%       7.00            +0.0%       7.00        s=
labinfo.scsi_sense_cache.num_slabs
     17408            +0.0%      17408            +0.0%      17408        s=
labinfo.seq_file.active_objs
    256.00            +0.0%     256.00            +0.0%     256.00        s=
labinfo.seq_file.active_slabs
     17408            +0.0%      17408            +0.0%      17408        s=
labinfo.seq_file.num_objs
    256.00            +0.0%     256.00            +0.0%     256.00        s=
labinfo.seq_file.num_slabs
     11297            +0.4%      11341 =C2=B1  3%      -1.0%      11189 =C2=
=B1  2%  slabinfo.shmem_inode_cache.active_objs
    245.00            +0.4%     246.00 =C2=B1  2%      -0.9%     242.71 =C2=
=B1  2%  slabinfo.shmem_inode_cache.active_slabs
     11297            +0.4%      11341 =C2=B1  3%      -1.0%      11189 =C2=
=B1  2%  slabinfo.shmem_inode_cache.num_objs
    245.00            +0.4%     246.00 =C2=B1  2%      -0.9%     242.71 =C2=
=B1  2%  slabinfo.shmem_inode_cache.num_slabs
      5827            +0.7%       5869            +0.6%       5861        s=
labinfo.sighand_cache.active_objs
    387.83            +0.7%     390.71            +0.6%     390.29        s=
labinfo.sighand_cache.active_slabs
      5827            +0.7%       5869            +0.6%       5861        s=
labinfo.sighand_cache.num_objs
    387.83            +0.7%     390.71            +0.6%     390.29        s=
labinfo.sighand_cache.num_slabs
      9236            +0.0%       9238            +1.2%       9344        s=
labinfo.signal_cache.active_objs
    329.17            +0.1%     329.43            +1.2%     333.14        s=
labinfo.signal_cache.active_slabs
      9236            +0.0%       9238            +1.2%       9344        s=
labinfo.signal_cache.num_objs
    329.17            +0.1%     329.43            +1.2%     333.14        s=
labinfo.signal_cache.num_slabs
    682.67 =C2=B1 12%      +8.5%     740.57 =C2=B1 11%     +13.8%     777.1=
4 =C2=B1  6%  slabinfo.skbuff_fclone_cache.active_objs
     10.67 =C2=B1 12%      +8.5%      11.57 =C2=B1 11%     +13.8%      12.1=
4 =C2=B1  6%  slabinfo.skbuff_fclone_cache.active_slabs
    682.67 =C2=B1 12%      +8.5%     740.57 =C2=B1 11%     +13.8%     777.1=
4 =C2=B1  6%  slabinfo.skbuff_fclone_cache.num_objs
     10.67 =C2=B1 12%      +8.5%      11.57 =C2=B1 11%     +13.8%      12.1=
4 =C2=B1  6%  slabinfo.skbuff_fclone_cache.num_slabs
     18066 =C2=B1  2%      +0.4%      18146            +1.1%      18258    =
    slabinfo.skbuff_head_cache.active_objs
    281.83 =C2=B1  2%      +0.6%     283.43            +1.2%     285.29    =
    slabinfo.skbuff_head_cache.active_slabs
     18066 =C2=B1  2%      +0.4%      18146            +1.1%      18258    =
    slabinfo.skbuff_head_cache.num_objs
    281.83 =C2=B1  2%      +0.6%     283.43            +1.2%     285.29    =
    slabinfo.skbuff_head_cache.num_slabs
      5847 =C2=B1  2%      +0.6%       5883 =C2=B1  4%      -2.2%       572=
0 =C2=B1  5%  slabinfo.sock_inode_cache.active_objs
    149.50 =C2=B1  3%      +0.5%     150.29 =C2=B1  4%      -2.2%     146.2=
9 =C2=B1  5%  slabinfo.sock_inode_cache.active_slabs
      5847 =C2=B1  2%      +0.6%       5883 =C2=B1  4%      -2.2%       572=
0 =C2=B1  5%  slabinfo.sock_inode_cache.num_objs
    149.50 =C2=B1  3%      +0.5%     150.29 =C2=B1  4%      -2.2%     146.2=
9 =C2=B1  5%  slabinfo.sock_inode_cache.num_slabs
     15147            -0.4%      15081            +0.6%      15245        s=
labinfo.task_delay_info.active_objs
    296.33            -0.4%     295.14            +0.7%     298.43        s=
labinfo.task_delay_info.active_slabs
     15147            -0.4%      15081            +0.6%      15245        s=
labinfo.task_delay_info.num_objs
    296.33            -0.4%     295.14            +0.7%     298.43        s=
labinfo.task_delay_info.num_slabs
      1540 =C2=B1  4%      -0.4%       1534 =C2=B1  8%      -3.2%       149=
0 =C2=B1  6%  slabinfo.task_group.active_objs
     33.17 =C2=B1  5%      -0.9%      32.86 =C2=B1  8%      -3.5%      32.0=
0 =C2=B1  6%  slabinfo.task_group.active_slabs
      1540 =C2=B1  4%      -0.4%       1534 =C2=B1  8%      -3.2%       149=
0 =C2=B1  6%  slabinfo.task_group.num_objs
     33.17 =C2=B1  5%      -0.9%      32.86 =C2=B1  8%      -3.5%      32.0=
0 =C2=B1  6%  slabinfo.task_group.num_slabs
      2845            +0.2%       2849            +0.3%       2854        s=
labinfo.task_struct.active_objs
      2846            +0.1%       2850            +0.3%       2855        s=
labinfo.task_struct.active_slabs
      2846            +0.1%       2850            +0.3%       2855        s=
labinfo.task_struct.num_objs
      2846            +0.1%       2850            +0.3%       2855        s=
labinfo.task_struct.num_slabs
    148.00            +0.0%     148.00            -2.8%     143.86 =C2=B1  =
7%  slabinfo.taskstats.active_objs
      3.00            +0.0%       3.00            -4.8%       2.86 =C2=B1 1=
2%  slabinfo.taskstats.active_slabs
    148.00            +0.0%     148.00            -2.8%     143.86 =C2=B1  =
7%  slabinfo.taskstats.num_objs
      3.00            +0.0%       3.00            -4.8%       2.86 =C2=B1 1=
2%  slabinfo.taskstats.num_slabs
     10240 =C2=B1  4%      +6.4%      10894 =C2=B1  4%      +5.8%      1083=
4 =C2=B1  3%  slabinfo.trace_event_file.active_objs
    222.17 =C2=B1  4%      +6.4%     236.43 =C2=B1  4%      +5.8%     235.0=
0 =C2=B1  3%  slabinfo.trace_event_file.active_slabs
     10240 =C2=B1  4%      +6.4%      10894 =C2=B1  4%      +5.8%      1083=
4 =C2=B1  3%  slabinfo.trace_event_file.num_objs
    222.17 =C2=B1  4%      +6.4%     236.43 =C2=B1  4%      +5.8%     235.0=
0 =C2=B1  3%  slabinfo.trace_event_file.num_slabs
     66.00            +0.0%      66.00            +0.0%      66.00        s=
labinfo.tw_sock_TCP.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.tw_sock_TCP.active_slabs
     66.00            +0.0%      66.00            +0.0%      66.00        s=
labinfo.tw_sock_TCP.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.tw_sock_TCP.num_slabs
     99306            -0.3%      99012 =C2=B1  2%      +1.3%     100613 =C2=
=B1  4%  slabinfo.vm_area_struct.active_objs
      2483            -0.3%       2475 =C2=B1  2%      +1.3%       2515 =C2=
=B1  4%  slabinfo.vm_area_struct.active_slabs
     99347            -0.3%      99039 =C2=B1  2%      +1.3%     100643 =C2=
=B1  4%  slabinfo.vm_area_struct.num_objs
      2483            -0.3%       2475 =C2=B1  2%      +1.3%       2515 =C2=
=B1  4%  slabinfo.vm_area_struct.num_slabs
     22454            -0.3%      22376            +0.0%      22456        s=
labinfo.vmap_area.active_objs
    355.50            -0.4%     354.00            -0.2%     354.86        s=
labinfo.vmap_area.active_slabs
     22765            -0.4%      22678            -0.2%      22730        s=
labinfo.vmap_area.num_objs
    355.50            -0.4%     354.00            -0.2%     354.86        s=
labinfo.vmap_area.num_slabs
     42.00            +0.0%      42.00            +0.0%      42.00        s=
labinfo.xfrm_state.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.xfrm_state.active_slabs
     42.00            +0.0%      42.00            +0.0%      42.00        s=
labinfo.xfrm_state.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.xfrm_state.num_slabs
     75.96 =C2=B1  2%      -1.3       74.69            -0.4       75.60    =
    perf-profile.calltrace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entr=
y.start_secondary.secondary_startup_64_no_verify
     74.77 =C2=B1  2%      -1.2       73.54            -0.5       74.29    =
    perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_i=
dle.cpu_startup_entry.start_secondary
      7.33 =C2=B1  7%      -0.8        6.51 =C2=B1 17%      -0.1        7.2=
7 =C2=B1 10%  perf-profile.calltrace.cycles-pp.rcu_eqs_exit.rcu_idle_exit.c=
puidle_enter_state.cpuidle_enter.do_idle
      7.60 =C2=B1  6%      -0.8        6.78 =C2=B1 16%      -0.1        7.5=
5 =C2=B1 10%  perf-profile.calltrace.cycles-pp.rcu_idle_exit.cpuidle_enter_=
state.cpuidle_enter.do_idle.cpu_startup_entry
     51.51 =C2=B1  2%      -0.7       50.83            -0.0       51.47 =C2=
=B1  3%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.c=
puidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry
     13.18 =C2=B1  2%      -0.5       12.70 =C2=B1  6%      -0.2       12.9=
4 =C2=B1  6%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_sta=
te.cpuidle_enter.do_idle.cpu_startup_entry
     47.26 =C2=B1  3%      -0.4       46.84 =C2=B1  2%      -0.2       47.1=
0 =C2=B1  4%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.=
asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.do_idle
      3.24 =C2=B1  8%      -0.3        2.93 =C2=B1 19%      -0.1        3.1=
3 =C2=B1 14%  perf-profile.calltrace.cycles-pp.rcu_nmi_enter.irqentry_enter=
.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_=
state
      3.41 =C2=B1  7%      -0.3        3.14 =C2=B1 18%      -0.1        3.3=
1 =C2=B1 13%  perf-profile.calltrace.cycles-pp.irqentry_enter.sysvec_apic_t=
imer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_=
enter
     31.50 =C2=B1  3%      -0.3       31.24 =C2=B1  4%      +0.4       31.9=
2 =C2=B1  7%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrup=
t.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter=
_state.cpuidle_enter
      3.43 =C2=B1  6%      -0.2        3.20 =C2=B1  7%      -0.3        3.1=
0 =C2=B1  7%  perf-profile.calltrace.cycles-pp.irq_enter_rcu.sysvec_apic_ti=
mer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_e=
nter
      3.11 =C2=B1  6%      -0.2        2.87 =C2=B1  8%      -0.3        2.8=
1 =C2=B1  8%  perf-profile.calltrace.cycles-pp.tick_irq_enter.irq_enter_rcu=
.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_=
state
      9.81 =C2=B1  6%      -0.2        9.61 =C2=B1  3%      -0.0        9.7=
9 =C2=B1  2%  perf-profile.calltrace.cycles-pp.update_process_times.tick_sc=
hed_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt
     10.32 =C2=B1  5%      -0.2       10.13 =C2=B1  2%      +0.0       10.3=
3 =C2=B1  2%  perf-profile.calltrace.cycles-pp.tick_sched_handle.tick_sched=
_timer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.19 =C2=B1141%      -0.2        0.00            -0.0        0.17 =C2=
=B1158%  perf-profile.calltrace.cycles-pp.timekeeping_max_deferment.tick_no=
hz_next_event.tick_nohz_get_sleep_length.menu_select.do_idle
      1.36 =C2=B1 14%      -0.2        1.18 =C2=B1  7%      -0.2        1.1=
4 =C2=B1 15%  perf-profile.calltrace.cycles-pp.ktime_get.tick_irq_enter.irq=
_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.18 =C2=B1141%      -0.2        0.00            -0.0        0.15 =C2=
=B1158%  perf-profile.calltrace.cycles-pp.rcu_eqs_enter.cpuidle_enter_state=
.cpuidle_enter.do_idle.cpu_startup_entry
      0.17 =C2=B1141%      -0.2        0.00            -0.1        0.07 =C2=
=B1244%  perf-profile.calltrace.cycles-pp.iov_iter_copy_from_user_atomic.ge=
neric_perform_write.__generic_file_write_iter.generic_file_write_iter.new_s=
ync_write
      1.16 =C2=B1 19%      -0.2        0.99 =C2=B1 11%      -0.2        0.9=
7 =C2=B1 20%  perf-profile.calltrace.cycles-pp.ktime_get_update_offsets_now=
.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrup=
t.asm_sysvec_apic_timer_interrupt
      0.17 =C2=B1141%      -0.2        0.00            +0.0        0.18 =C2=
=B1162%  perf-profile.calltrace.cycles-pp.irqtime_account_process_tick.upda=
te_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues
     30.02 =C2=B1  3%      -0.2       29.86 =C2=B1  4%      +0.5       30.4=
8 =C2=B1  7%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_a=
pic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_inter=
rupt.cpuidle_enter_state
     11.85 =C2=B1  7%      -0.2       11.70 =C2=B1  2%      -0.0       11.8=
4 =C2=B1  2%  perf-profile.calltrace.cycles-pp.tick_sched_timer.__hrtimer_r=
un_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer=
_interrupt
      0.60 =C2=B1  6%      -0.1        0.48 =C2=B1 41%      +0.0        0.6=
3 =C2=B1 14%  perf-profile.calltrace.cycles-pp.perf_event_task_tick.schedul=
er_tick.update_process_times.tick_sched_handle.tick_sched_timer
      3.06 =C2=B1  5%      -0.1        2.93 =C2=B1 18%      -0.1        2.9=
8 =C2=B1 20%  perf-profile.calltrace.cycles-pp.rcu_sched_clock_irq.update_p=
rocess_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues
      0.29 =C2=B1100%      -0.1        0.17 =C2=B1158%      -0.1        0.1=
8 =C2=B1159%  perf-profile.calltrace.cycles-pp.pagecache_get_page.shmem_get=
page_gfp.shmem_write_begin.generic_perform_write.__generic_file_write_iter
      0.76 =C2=B1 17%      -0.1        0.66 =C2=B1 42%      -0.1        0.7=
0 =C2=B1 44%  perf-profile.calltrace.cycles-pp.irqentry_exit.asm_sysvec_api=
c_timer_interrupt.cpuidle_enter_state.cpuidle_enter.do_idle
      0.56 =C2=B1  6%      -0.1        0.46 =C2=B1 40%      -0.1        0.4=
8 =C2=B1 41%  perf-profile.calltrace.cycles-pp.arch_cpu_idle_enter.do_idle.=
cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      0.59 =C2=B1  4%      -0.1        0.49 =C2=B1 41%      -0.0        0.5=
8 =C2=B1  7%  perf-profile.calltrace.cycles-pp.update_ts_time_stats.tick_ir=
q_enter.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_int=
errupt
      3.92 =C2=B1 29%      -0.1        3.83 =C2=B1 21%      -0.4        3.4=
8 =C2=B1 26%  perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_sysc=
all_64.entry_SYSCALL_64_after_hwframe.write
      4.17 =C2=B1 29%      -0.1        4.07 =C2=B1 21%      -0.5        3.7=
0 =C2=B1 26%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_=
64_after_hwframe.write
      5.19 =C2=B1 29%      -0.1        5.09 =C2=B1 22%      -0.6        4.6=
3 =C2=B1 26%  perf-profile.calltrace.cycles-pp.write
      4.41 =C2=B1  8%      -0.1        4.32 =C2=B1  4%      +0.1        4.4=
8 =C2=B1  7%  perf-profile.calltrace.cycles-pp.scheduler_tick.update_proces=
s_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues
      4.05 =C2=B1 29%      -0.1        3.96 =C2=B1 21%      -0.5        3.6=
0 =C2=B1 26%  perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe.write
      0.80 =C2=B1 26%      -0.1        0.71 =C2=B1 16%      -0.1        0.7=
1 =C2=B1 11%  perf-profile.calltrace.cycles-pp.ktime_get.tick_sched_timer._=
_hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      4.35 =C2=B1 29%      -0.1        4.28 =C2=B1 21%      -0.5        3.8=
8 =C2=B1 26%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwfra=
me.write
      1.47 =C2=B1  5%      -0.1        1.40 =C2=B1  8%      -0.1        1.4=
1 =C2=B1  6%  perf-profile.calltrace.cycles-pp.hrtimer_next_event_without.t=
ick_nohz_get_sleep_length.menu_select.do_idle.cpu_startup_entry
      0.89 =C2=B1  7%      -0.1        0.82 =C2=B1 12%      -0.0        0.8=
6 =C2=B1  8%  perf-profile.calltrace.cycles-pp.__hrtimer_next_event_base.hr=
timer_next_event_without.tick_nohz_get_sleep_length.menu_select.do_idle
      2.78 =C2=B1 29%      -0.1        2.71 =C2=B1 21%      -0.4        2.4=
1 =C2=B1 26%  perf-profile.calltrace.cycles-pp.__generic_file_write_iter.ge=
neric_file_write_iter.new_sync_write.vfs_write.ksys_write
      1.40 =C2=B1 29%      -0.1        1.34 =C2=B1 23%      -0.2        1.2=
4 =C2=B1 28%  perf-profile.calltrace.cycles-pp.shmem_getpage_gfp.shmem_writ=
e_begin.generic_perform_write.__generic_file_write_iter.generic_file_write_=
iter
      2.63 =C2=B1 15%      -0.1        2.57 =C2=B1  6%      -0.2        2.3=
9 =C2=B1 12%  perf-profile.calltrace.cycles-pp.clockevents_program_event.hr=
timer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.a=
sm_sysvec_apic_timer_interrupt
      3.23 =C2=B1 28%      -0.1        3.17 =C2=B1 20%      -0.4        2.8=
6 =C2=B1 26%  perf-profile.calltrace.cycles-pp.new_sync_write.vfs_write.ksy=
s_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.44 =C2=B1 29%      -0.1        1.39 =C2=B1 23%      -0.2        1.2=
9 =C2=B1 27%  perf-profile.calltrace.cycles-pp.shmem_write_begin.generic_pe=
rform_write.__generic_file_write_iter.generic_file_write_iter.new_sync_write
      0.36 =C2=B1 70%      -0.0        0.31 =C2=B1 86%      +0.0        0.3=
9 =C2=B1 63%  perf-profile.calltrace.cycles-pp.native_apic_msr_eoi_write.__=
sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_tim=
er_interrupt.cpuidle_enter_state
      0.95 =C2=B1  7%      -0.0        0.90 =C2=B1 16%      +0.0        0.9=
8 =C2=B1 17%  perf-profile.calltrace.cycles-pp.rcu_dynticks_eqs_exit.rcu_eq=
s_exit.rcu_idle_exit.cpuidle_enter_state.cpuidle_enter
      3.08 =C2=B1 29%      -0.0        3.04 =C2=B1 21%      -0.4        2.7=
2 =C2=B1 26%  perf-profile.calltrace.cycles-pp.generic_file_write_iter.new_=
sync_write.vfs_write.ksys_write.do_syscall_64
      2.52 =C2=B1 29%      -0.0        2.48 =C2=B1 21%      -0.3        2.2=
2 =C2=B1 26%  perf-profile.calltrace.cycles-pp.generic_perform_write.__gene=
ric_file_write_iter.generic_file_write_iter.new_sync_write.vfs_write
      0.21 =C2=B1141%      -0.0        0.18 =C2=B1158%      +0.1        0.2=
6 =C2=B1116%  perf-profile.calltrace.cycles-pp.process_simple.perf_session_=
_process_events.record__finish_output.cmd_record.cmd_sched
      0.80 =C2=B1  4%      -0.0        0.77 =C2=B1  7%      -0.0        0.7=
8 =C2=B1  7%  perf-profile.calltrace.cycles-pp.lapic_next_deadline.clockeve=
nts_program_event.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_ap=
ic_timer_interrupt
      0.59 =C2=B1 47%      -0.0        0.57 =C2=B1 42%      +0.0        0.6=
2 =C2=B1 45%  perf-profile.calltrace.cycles-pp.rcu_nmi_exit.irqentry_exit.a=
sm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      1.50 =C2=B1 27%      -0.0        1.48 =C2=B1 11%      -0.2        1.3=
2 =C2=B1 18%  perf-profile.calltrace.cycles-pp.ktime_get.clockevents_progra=
m_event.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_i=
nterrupt
      0.22 =C2=B1141%      -0.0        0.20 =C2=B1158%      +0.1        0.2=
8 =C2=B1116%  perf-profile.calltrace.cycles-pp.perf_session__process_events=
.record__finish_output.cmd_record.cmd_sched.run_builtin
      1.15 =C2=B1 12%      -0.0        1.13 =C2=B1  4%      -0.0        1.1=
1 =C2=B1 13%  perf-profile.calltrace.cycles-pp.irqtime_account_irq.sysvec_a=
pic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpu=
idle_enter
      0.22 =C2=B1141%      -0.0        0.20 =C2=B1158%      +0.1        0.2=
8 =C2=B1116%  perf-profile.calltrace.cycles-pp.record__finish_output.cmd_re=
cord.cmd_sched.run_builtin.main
      0.78            -0.0        0.78 =C2=B1  5%      +0.1        0.88 =C2=
=B1 17%  perf-profile.calltrace.cycles-pp.update_irq_load_avg.update_rq_clo=
ck.scheduler_tick.update_process_times.tick_sched_handle
      0.94 =C2=B1 75%      -0.0        0.94 =C2=B1 31%      +0.2        1.1=
6 =C2=B1 26%  perf-profile.calltrace.cycles-pp.x86_pmu_disable.perf_mux_hrt=
imer_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_int=
errupt
      0.84 =C2=B1 13%      -0.0        0.84 =C2=B1 10%      -0.1        0.7=
3 =C2=B1 42%  perf-profile.calltrace.cycles-pp._raw_spin_lock.get_next_time=
r_interrupt.tick_nohz_next_event.tick_nohz_get_sleep_length.menu_select
      0.00            +0.0        0.00            +0.1        0.08 =C2=B124=
4%  perf-profile.calltrace.cycles-pp.run_posix_cpu_timers.tick_sched_handle=
.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt
      0.00            +0.0        0.00            +0.1        0.09 =C2=B124=
4%  perf-profile.calltrace.cycles-pp.__intel_pmu_enable_all.perf_mux_hrtime=
r_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interr=
upt
      0.00            +0.0        0.00            +0.1        0.09 =C2=B124=
4%  perf-profile.calltrace.cycles-pp._raw_spin_lock.perf_mux_hrtimer_handle=
r.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +0.1        0.10 =C2=B124=
4%  perf-profile.calltrace.cycles-pp.rb_insert_color.timerqueue_add.enqueue=
_hrtimer.__hrtimer_run_queues.hrtimer_interrupt
      0.98 =C2=B1  4%      +0.0        0.98 =C2=B1  5%      -0.0        0.9=
6 =C2=B1  5%  perf-profile.calltrace.cycles-pp.hrtimer_update_next_event.hr=
timer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.a=
sm_sysvec_apic_timer_interrupt
      0.80 =C2=B1  5%      +0.0        0.80 =C2=B1 15%      -0.1        0.6=
7 =C2=B1 41%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.hrtim=
er_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_=
sysvec_apic_timer_interrupt
      1.27 =C2=B1  5%      +0.0        1.28 =C2=B1  5%      +0.1        1.3=
7 =C2=B1 18%  perf-profile.calltrace.cycles-pp.__remove_hrtimer.__hrtimer_r=
un_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer=
_interrupt
      0.72 =C2=B1 25%      +0.0        0.73 =C2=B1 30%      +0.0        0.7=
6 =C2=B1 27%  perf-profile.calltrace.cycles-pp.cmd_record.cmd_sched.run_bui=
ltin.main.__libc_start_main
      0.72 =C2=B1 25%      +0.0        0.73 =C2=B1 30%      +0.0        0.7=
6 =C2=B1 27%  perf-profile.calltrace.cycles-pp.cmd_sched.run_builtin.main._=
_libc_start_main
      0.91 =C2=B1  4%      +0.0        0.92 =C2=B1  6%      +0.1        0.9=
9 =C2=B1 22%  perf-profile.calltrace.cycles-pp.timerqueue_del.__remove_hrti=
mer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.71 =C2=B1 15%      +0.0        0.73 =C2=B1  7%      -0.1        0.6=
0 =C2=B1 44%  perf-profile.calltrace.cycles-pp.sched_clock_cpu.irqtime_acco=
unt_irq.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle=
_enter_state
      1.59 =C2=B1  6%      +0.0        1.61 =C2=B1  6%      +0.1        1.7=
3 =C2=B1 14%  perf-profile.calltrace.cycles-pp.update_rq_clock.scheduler_ti=
ck.update_process_times.tick_sched_handle.tick_sched_timer
      1.91 =C2=B1  7%      +0.0        1.93 =C2=B1  3%      -0.1        1.8=
3 =C2=B1 12%  perf-profile.calltrace.cycles-pp.get_next_timer_interrupt.tic=
k_nohz_next_event.tick_nohz_get_sleep_length.menu_select.do_idle
      0.95 =C2=B1 17%      +0.0        0.97 =C2=B1 24%      +0.1        1.0=
4 =C2=B1 22%  perf-profile.calltrace.cycles-pp.__libc_start_main
      0.95 =C2=B1 17%      +0.0        0.97 =C2=B1 24%      +0.1        1.0=
4 =C2=B1 22%  perf-profile.calltrace.cycles-pp.main.__libc_start_main
      0.95 =C2=B1 17%      +0.0        0.97 =C2=B1 24%      +0.1        1.0=
4 =C2=B1 22%  perf-profile.calltrace.cycles-pp.run_builtin.main.__libc_star=
t_main
      1.20 =C2=B1 10%      +0.0        1.22 =C2=B1  7%      -0.1        1.1=
4 =C2=B1 18%  perf-profile.calltrace.cycles-pp.irqtime_account_irq.irq_exit=
_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_en=
ter_state
      5.73 =C2=B1  4%      +0.0        5.76 =C2=B1  2%      -0.2        5.5=
4 =C2=B1  8%  perf-profile.calltrace.cycles-pp.tick_nohz_get_sleep_length.m=
enu_select.do_idle.cpu_startup_entry.start_secondary
      0.60 =C2=B1  5%      +0.0        0.64 =C2=B1 10%      +0.1        0.7=
0 =C2=B1 24%  perf-profile.calltrace.cycles-pp.update_blocked_averages.run_=
rebalance_domains.__softirqentry_text_start.irq_exit_rcu.sysvec_apic_timer_=
interrupt
      0.71 =C2=B1  5%      +0.0        0.75 =C2=B1 10%      +0.1        0.8=
2 =C2=B1 22%  perf-profile.calltrace.cycles-pp.run_rebalance_domains.__soft=
irqentry_text_start.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_api=
c_timer_interrupt
      0.59 =C2=B1 11%      +0.0        0.63 =C2=B1 10%      +0.1        0.6=
9 =C2=B1  9%  perf-profile.calltrace.cycles-pp.ret_from_fork
      0.59 =C2=B1 11%      +0.0        0.63 =C2=B1 10%      +0.1        0.6=
9 =C2=B1  9%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork
      0.34 =C2=B1100%      +0.0        0.38 =C2=B1 88%      -0.1        0.2=
3 =C2=B1158%  perf-profile.calltrace.cycles-pp.llseek
      0.88 =C2=B1  6%      +0.1        0.93 =C2=B1  7%      +0.1        0.9=
4 =C2=B1 22%  perf-profile.calltrace.cycles-pp.find_busiest_group.load_bala=
nce.rebalance_domains.__softirqentry_text_start.irq_exit_rcu
      0.80 =C2=B1  7%      +0.1        0.87 =C2=B1  7%      +0.1        0.8=
6 =C2=B1 21%  perf-profile.calltrace.cycles-pp.update_sd_lb_stats.find_busi=
est_group.load_balance.rebalance_domains.__softirqentry_text_start
      0.61 =C2=B1  7%      +0.1        0.68 =C2=B1  4%      +0.0        0.6=
3 =C2=B1  7%  perf-profile.calltrace.cycles-pp.hrtimer_get_next_event.get_n=
ext_timer_interrupt.tick_nohz_next_event.tick_nohz_get_sleep_length.menu_se=
lect
     22.38 =C2=B1  2%      +0.1       22.45 =C2=B1  4%      +1.1       23.4=
5 =C2=B1 12%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer=
_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sy=
svec_apic_timer_interrupt
      0.88 =C2=B1  7%      +0.1        0.95 =C2=B1  7%      +0.3        1.1=
5 =C2=B1 51%  perf-profile.calltrace.cycles-pp.timerqueue_add.enqueue_hrtim=
er.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.00            +0.1        0.07 =C2=B1244%      +0.0        0.00    =
    perf-profile.calltrace.cycles-pp.native_sched_clock.sched_clock.sched_c=
lock_cpu.update_rq_clock.scheduler_tick
      1.07 =C2=B1  6%      +0.1        1.15 =C2=B1  7%      +0.3        1.3=
6 =C2=B1 46%  perf-profile.calltrace.cycles-pp.enqueue_hrtimer.__hrtimer_ru=
n_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_=
interrupt
      0.00            +0.1        0.08 =C2=B1244%      +0.0        0.00    =
    perf-profile.calltrace.cycles-pp.__hrtimer_get_next_event.hrtimer_updat=
e_next_event.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_ti=
mer_interrupt
      4.71 =C2=B1  7%      +0.1        4.79 =C2=B1  7%      +0.7        5.4=
5 =C2=B1 24%  perf-profile.calltrace.cycles-pp.perf_mux_hrtimer_handler.__h=
rtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_ap=
ic_timer_interrupt
      0.00            +0.1        0.08 =C2=B1244%      +0.0        0.00    =
    perf-profile.calltrace.cycles-pp.sched_clock_cpu.update_rq_clock.schedu=
ler_tick.update_process_times.tick_sched_handle
      1.50 =C2=B1  5%      +0.1        1.58 =C2=B1  7%      +0.1        1.6=
1 =C2=B1 22%  perf-profile.calltrace.cycles-pp.rebalance_domains.__softirqe=
ntry_text_start.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_ti=
mer_interrupt
      1.22 =C2=B1  5%      +0.1        1.30 =C2=B1  7%      +0.1        1.2=
9 =C2=B1 22%  perf-profile.calltrace.cycles-pp.load_balance.rebalance_domai=
ns.__softirqentry_text_start.irq_exit_rcu.sysvec_apic_timer_interrupt
      1.04 =C2=B1 11%      +0.1        1.13 =C2=B1  7%      -0.1        0.9=
6 =C2=B1 10%  perf-profile.calltrace.cycles-pp.tick_nohz_irq_exit.sysvec_ap=
ic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpui=
dle_enter
     90.32 =C2=B1  2%      +0.1       90.41            +0.4       90.72    =
    perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
     90.07 =C2=B1  2%      +0.1       90.16            +0.3       90.41    =
    perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.seco=
ndary_startup_64_no_verify
     90.07 =C2=B1  2%      +0.1       90.16            +0.3       90.41    =
    perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_n=
o_verify
      0.51 =C2=B1 46%      +0.1        0.61 =C2=B1 15%      -0.2        0.2=
8 =C2=B1116%  perf-profile.calltrace.cycles-pp.sched_clock.sched_clock_cpu.=
irqtime_account_irq.irq_exit_rcu.sysvec_apic_timer_interrupt
      0.54 =C2=B1 46%      +0.1        0.64 =C2=B1  8%      -0.0        0.5=
2 =C2=B1 44%  perf-profile.calltrace.cycles-pp.native_sched_clock.sched_clo=
ck.sched_clock_cpu.irqtime_account_irq.sysvec_apic_timer_interrupt
      0.72 =C2=B1  8%      +0.1        0.82 =C2=B1  5%      +0.1        0.7=
7 =C2=B1  5%  perf-profile.calltrace.cycles-pp.cpuidle_governor_latency_req=
.menu_select.do_idle.cpu_startup_entry.start_secondary
      0.00            +0.1        0.11 =C2=B1244%      +0.2        0.19 =C2=
=B1244%  perf-profile.calltrace.cycles-pp.ktime_get.perf_mux_hrtimer_handle=
r.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.52 =C2=B1 46%      +0.1        0.62 =C2=B1  8%      -0.1        0.4=
3 =C2=B1 65%  perf-profile.calltrace.cycles-pp.sched_clock.sched_clock_cpu.=
irqtime_account_irq.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_inter=
rupt
      0.00            +0.1        0.11 =C2=B1244%      +0.0        0.00    =
    perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_=
interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.poll_=
idle
      0.53 =C2=B1 46%      +0.1        0.64 =C2=B1 14%      -0.1        0.4=
5 =C2=B1 65%  perf-profile.calltrace.cycles-pp.native_sched_clock.sched_clo=
ck.sched_clock_cpu.irqtime_account_irq.irq_exit_rcu
     89.91 =C2=B1  2%      +0.1       90.02            +0.4       90.26    =
    perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_second=
ary.secondary_startup_64_no_verify
      0.00            +0.1        0.11 =C2=B1244%      +0.0        0.00    =
    perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_a=
pic_timer_interrupt.asm_sysvec_apic_timer_interrupt.poll_idle.cpuidle_enter=
_state
      0.00            +0.1        0.11 =C2=B1244%      +0.0        0.00    =
    perf-profile.calltrace.cycles-pp._raw_spin_unlock_irqrestore.__hrtimer_=
run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_time=
r_interrupt
      0.81 =C2=B1 12%      +0.1        0.92 =C2=B1  9%      -0.0        0.7=
6 =C2=B1 12%  perf-profile.calltrace.cycles-pp.ktime_get.tick_nohz_irq_exit=
.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_=
state
      0.00            +0.1        0.11 =C2=B1244%      +0.0        0.00    =
    perf-profile.calltrace.cycles-pp._raw_spin_unlock_irqrestore.hrtimer_in=
terrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysve=
c_apic_timer_interrupt
      0.60 =C2=B1 45%      +0.1        0.74 =C2=B1 12%      -0.0        0.5=
8 =C2=B1 44%  perf-profile.calltrace.cycles-pp.sched_clock_cpu.irqtime_acco=
unt_irq.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_inte=
rrupt
      3.56 =C2=B1  4%      +0.1        3.70 =C2=B1  2%      -0.1        3.4=
8 =C2=B1 11%  perf-profile.calltrace.cycles-pp.tick_nohz_next_event.tick_no=
hz_get_sleep_length.menu_select.do_idle.cpu_startup_entry
      0.52 =C2=B1 45%      +0.2        0.67 =C2=B1 24%      +0.0        0.5=
2 =C2=B1 42%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.__hrtimer=
_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_tim=
er_interrupt
      1.55 =C2=B1 16%      +0.2        1.73 =C2=B1 18%      +0.1        1.6=
3 =C2=B1 16%  perf-profile.calltrace.cycles-pp.native_sched_clock.sched_clo=
ck.sched_clock_cpu.cpuidle_enter_state.cpuidle_enter
      1.46 =C2=B1 17%      +0.2        1.65 =C2=B1 19%      +0.1        1.5=
5 =C2=B1 17%  perf-profile.calltrace.cycles-pp.sched_clock.sched_clock_cpu.=
cpuidle_enter_state.cpuidle_enter.do_idle
      1.77 =C2=B1 15%      +0.2        1.96 =C2=B1 16%      +0.1        1.8=
5 =C2=B1 14%  perf-profile.calltrace.cycles-pp.sched_clock_cpu.cpuidle_ente=
r_state.cpuidle_enter.do_idle.cpu_startup_entry
      0.00            +0.2        0.19 =C2=B1244%      +0.0        0.00    =
    perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec=
_apic_timer_interrupt.poll_idle.cpuidle_enter_state.cpuidle_enter
      0.00            +0.2        0.19 =C2=B1244%      +0.0        0.00    =
    perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.poll_i=
dle.cpuidle_enter_state.cpuidle_enter.do_idle
      3.40 =C2=B1  5%      +0.2        3.63 =C2=B1  7%      +0.2        3.6=
2 =C2=B1 17%  perf-profile.calltrace.cycles-pp.__softirqentry_text_start.ir=
q_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpui=
dle_enter_state
      0.27 =C2=B1100%      +0.3        0.53 =C2=B1 40%      -0.1        0.1=
5 =C2=B1158%  perf-profile.calltrace.cycles-pp.rcu_core.__softirqentry_text=
_start.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_inter=
rupt
      5.83 =C2=B1  6%      +0.3        6.11 =C2=B1  5%      +0.0        5.8=
5 =C2=B1  7%  perf-profile.calltrace.cycles-pp.irq_exit_rcu.sysvec_apic_tim=
er_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_en=
ter
      0.09 =C2=B1223%      +0.5        0.59 =C2=B1  5%      +0.1        0.1=
5 =C2=B1158%  perf-profile.calltrace.cycles-pp.tick_check_broadcast_expired=
.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      0.00            +0.6        0.55 =C2=B1244%      +0.0        0.00    =
    perf-profile.calltrace.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_=
enter.do_idle.cpu_startup_entry
     10.31 =C2=B1  6%      +1.3       11.58 =C2=B1  6%      +0.7       11.0=
1 =C2=B1 13%  perf-profile.calltrace.cycles-pp.menu_select.do_idle.cpu_star=
tup_entry.start_secondary.secondary_startup_64_no_verify
     75.92 =C2=B1  2%      -1.3       74.62            -0.3       75.60 =C2=
=B1  2%  perf-profile.children.cycles-pp.cpuidle_enter_state
     76.17 =C2=B1  2%      -1.3       74.88            -0.3       75.87 =C2=
=B1  2%  perf-profile.children.cycles-pp.cpuidle_enter
      7.63 =C2=B1  6%      -0.8        6.81 =C2=B1 16%      -0.1        7.5=
8 =C2=B1 10%  perf-profile.children.cycles-pp.rcu_idle_exit
      7.37 =C2=B1  7%      -0.8        6.55 =C2=B1 17%      -0.1        7.3=
1 =C2=B1 10%  perf-profile.children.cycles-pp.rcu_eqs_exit
     13.26 =C2=B1  2%      -0.5       12.78 =C2=B1  6%      -0.2       13.0=
3 =C2=B1  6%  perf-profile.children.cycles-pp.intel_idle
     51.05 =C2=B1  2%      -0.3       50.72 =C2=B1  2%      -0.2       50.9=
0 =C2=B1  3%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interru=
pt
      3.25 =C2=B1  8%      -0.3        2.94 =C2=B1 19%      -0.1        3.1=
4 =C2=B1 14%  perf-profile.children.cycles-pp.rcu_nmi_enter
      3.45 =C2=B1  7%      -0.3        3.19 =C2=B1 18%      -0.1        3.3=
4 =C2=B1 13%  perf-profile.children.cycles-pp.irqentry_enter
      3.50 =C2=B1  5%      -0.2        3.28 =C2=B1  7%      -0.3        3.1=
8 =C2=B1  7%  perf-profile.children.cycles-pp.irq_enter_rcu
      3.17 =C2=B1  6%      -0.2        2.95 =C2=B1  7%      -0.3        2.8=
8 =C2=B1  8%  perf-profile.children.cycles-pp.tick_irq_enter
     48.27 =C2=B1  2%      -0.2       48.06 =C2=B1  2%      -0.2       48.0=
3 =C2=B1  4%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      1.20 =C2=B1 18%      -0.2        1.03 =C2=B1 12%      -0.2        1.0=
1 =C2=B1 19%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      1.09 =C2=B1 49%      -0.1        0.96 =C2=B1 30%      +0.1        1.1=
7 =C2=B1 26%  perf-profile.children.cycles-pp.x86_pmu_disable
     10.31 =C2=B1  5%      -0.1       10.18 =C2=B1  2%      -0.1       10.2=
6        perf-profile.children.cycles-pp.update_process_times
     10.81 =C2=B1  5%      -0.1       10.69 =C2=B1  2%      -0.0       10.7=
9 =C2=B1  2%  perf-profile.children.cycles-pp.tick_sched_handle
      5.32 =C2=B1 29%      -0.1        5.20 =C2=B1 22%      -0.6        4.7=
3 =C2=B1 26%  perf-profile.children.cycles-pp.write
     32.22 =C2=B1  2%      -0.1       32.11 =C2=B1  5%      +0.4       32.5=
9 =C2=B1  7%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      3.96 =C2=B1 29%      -0.1        3.86 =C2=B1 21%      -0.4        3.5=
2 =C2=B1 26%  perf-profile.children.cycles-pp.vfs_write
      3.11 =C2=B1  5%      -0.1        3.02 =C2=B1 16%      -0.1        3.0=
3 =C2=B1 19%  perf-profile.children.cycles-pp.rcu_sched_clock_irq
     12.40 =C2=B1  6%      -0.1       12.31 =C2=B1  2%      -0.1       12.3=
4 =C2=B1  2%  perf-profile.children.cycles-pp.tick_sched_timer
      4.09 =C2=B1 29%      -0.1        4.00 =C2=B1 21%      -0.5        3.6=
4 =C2=B1 26%  perf-profile.children.cycles-pp.ksys_write
      1.52 =C2=B1  5%      -0.1        1.44 =C2=B1  8%      -0.1        1.4=
6 =C2=B1  6%  perf-profile.children.cycles-pp.hrtimer_next_event_without
      4.85 =C2=B1  7%      -0.1        4.78 =C2=B1  5%      +0.0        4.9=
0 =C2=B1  8%  perf-profile.children.cycles-pp.scheduler_tick
      2.81 =C2=B1 29%      -0.1        2.74 =C2=B1 21%      -0.4        2.4=
5 =C2=B1 25%  perf-profile.children.cycles-pp.__generic_file_write_iter
      4.84 =C2=B1 12%      -0.1        4.77 =C2=B1  9%      -0.4        4.4=
7 =C2=B1  6%  perf-profile.children.cycles-pp.ktime_get
      5.75 =C2=B1 23%      -0.1        5.68 =C2=B1 13%      -0.3        5.4=
5 =C2=B1 21%  perf-profile.children.cycles-pp.do_syscall_64
      6.43 =C2=B1 23%      -0.1        6.36 =C2=B1 14%      -0.3        6.0=
9 =C2=B1 21%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.43 =C2=B1 29%      -0.1        1.37 =C2=B1 23%      -0.2        1.2=
8 =C2=B1 27%  perf-profile.children.cycles-pp.shmem_getpage_gfp
      1.42 =C2=B1  3%      -0.1        1.36 =C2=B1  5%      -0.0        1.3=
8 =C2=B1  5%  perf-profile.children.cycles-pp.__hrtimer_next_event_base
      1.33 =C2=B1  5%      -0.1        1.27 =C2=B1  4%      -0.1        1.2=
6 =C2=B1  3%  perf-profile.children.cycles-pp.read_tsc
      3.26 =C2=B1 28%      -0.1        3.21 =C2=B1 20%      -0.4        2.9=
0 =C2=B1 25%  perf-profile.children.cycles-pp.new_sync_write
      1.46 =C2=B1 29%      -0.1        1.41 =C2=B1 23%      -0.2        1.3=
0 =C2=B1 27%  perf-profile.children.cycles-pp.shmem_write_begin
      0.67 =C2=B1 19%      -0.1        0.62 =C2=B1 22%      -0.0        0.6=
7 =C2=B1 28%  perf-profile.children.cycles-pp.rcu_nmi_exit
      0.98 =C2=B1  7%      -0.1        0.92 =C2=B1 16%      +0.0        1.0=
0 =C2=B1 17%  perf-profile.children.cycles-pp.rcu_dynticks_eqs_exit
      0.61 =C2=B1  6%      -0.1        0.56 =C2=B1  7%      +0.0        0.6=
4 =C2=B1 14%  perf-profile.children.cycles-pp.perf_event_task_tick
      0.49 =C2=B1  9%      -0.0        0.44 =C2=B1  5%      -0.0        0.4=
8 =C2=B1 10%  perf-profile.children.cycles-pp.rcu_eqs_enter
      0.79 =C2=B1 17%      -0.0        0.75 =C2=B1 19%      -0.0        0.7=
9 =C2=B1 26%  perf-profile.children.cycles-pp.irqentry_exit
      0.56 =C2=B1  3%      -0.0        0.52 =C2=B1  9%      -0.0        0.5=
3 =C2=B1  8%  perf-profile.children.cycles-pp.nr_iowait_cpu
      0.44 =C2=B1 32%      -0.0        0.39 =C2=B1 36%      +0.0        0.4=
5 =C2=B1 34%  perf-profile.children.cycles-pp.process_simple
      2.70 =C2=B1 15%      -0.0        2.65 =C2=B1  6%      -0.3        2.4=
4 =C2=B1 12%  perf-profile.children.cycles-pp.clockevents_program_event
      0.74 =C2=B1  9%      -0.0        0.70 =C2=B1 10%      -0.1        0.6=
5 =C2=B1 14%  perf-profile.children.cycles-pp.rb_next
      2.56 =C2=B1 29%      -0.0        2.52 =C2=B1 20%      -0.3        2.2=
6 =C2=B1 26%  perf-profile.children.cycles-pp.generic_perform_write
      3.12 =C2=B1 29%      -0.0        3.08 =C2=B1 21%      -0.4        2.7=
6 =C2=B1 26%  perf-profile.children.cycles-pp.generic_file_write_iter
      0.58 =C2=B1  5%      -0.0        0.54 =C2=B1  9%      -0.0        0.5=
7 =C2=B1  5%  perf-profile.children.cycles-pp.arch_cpu_idle_enter
      0.05 =C2=B1 83%      -0.0        0.02 =C2=B1159%      -0.0        0.0=
1 =C2=B1244%  perf-profile.children.cycles-pp.find_lock_entries
      0.18 =C2=B1 40%      -0.0        0.14 =C2=B1 36%      -0.0        0.1=
8 =C2=B1 36%  perf-profile.children.cycles-pp.perf_session__process_user_ev=
ent
      0.33 =C2=B1  9%      -0.0        0.29 =C2=B1 17%      -0.0        0.3=
1 =C2=B1 23%  perf-profile.children.cycles-pp.rcu_needs_cpu
      0.52 =C2=B1  7%      -0.0        0.48 =C2=B1  4%      -0.0        0.4=
7 =C2=B1  6%  perf-profile.children.cycles-pp.idle_cpu
      0.46 =C2=B1  4%      -0.0        0.43 =C2=B1  9%      -0.0        0.4=
3 =C2=B1  6%  perf-profile.children.cycles-pp.tsc_verify_tsc_adjust
      0.31 =C2=B1 28%      -0.0        0.28 =C2=B1 21%      -0.0        0.2=
7 =C2=B1 25%  perf-profile.children.cycles-pp.shmem_add_to_page_cache
      0.67 =C2=B1  4%      -0.0        0.64 =C2=B1  3%      -0.0        0.6=
5 =C2=B1  5%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.25 =C2=B1 30%      -0.0        0.22 =C2=B1 20%      -0.0        0.2=
2 =C2=B1 23%  perf-profile.children.cycles-pp.copy_user_enhanced_fast_string
      0.25 =C2=B1  5%      -0.0        0.22 =C2=B1 13%      -0.0        0.2=
2 =C2=B1  9%  perf-profile.children.cycles-pp.irq_work_needs_cpu
      0.03 =C2=B1100%      -0.0        0.00            -0.0        0.01 =C2=
=B1158%  perf-profile.children.cycles-pp.rw_verify_area
      0.27 =C2=B1 28%      -0.0        0.24 =C2=B1 25%      -0.0        0.2=
4 =C2=B1 24%  perf-profile.children.cycles-pp.copyin
      0.18 =C2=B1 30%      -0.0        0.15 =C2=B1 28%      -0.0        0.1=
4 =C2=B1 31%  perf-profile.children.cycles-pp.common_file_perm
      0.31 =C2=B1 28%      -0.0        0.29 =C2=B1 22%      -0.1        0.2=
5 =C2=B1 31%  perf-profile.children.cycles-pp.sync_disk_rw
      0.06 =C2=B1 87%      -0.0        0.03 =C2=B1 87%      -0.0        0.0=
3 =C2=B1 89%  perf-profile.children.cycles-pp.aa_file_perm
      0.61 =C2=B1  4%      -0.0        0.58 =C2=B1  9%      -0.0        0.5=
9 =C2=B1  7%  perf-profile.children.cycles-pp.update_ts_time_stats
      0.91 =C2=B1  3%      -0.0        0.88 =C2=B1  3%      -0.0        0.8=
9 =C2=B1  4%  perf-profile.children.cycles-pp.__x86_retpoline_rax
      0.83 =C2=B1  4%      -0.0        0.81 =C2=B1  5%      -0.0        0.8=
1 =C2=B1  7%  perf-profile.children.cycles-pp.lapic_next_deadline
      0.35 =C2=B1 10%      -0.0        0.33 =C2=B1 10%      +0.1        0.4=
0 =C2=B1 26%  perf-profile.children.cycles-pp.__intel_pmu_enable_all
     30.79 =C2=B1  2%      -0.0       30.77 =C2=B1  5%      +0.4       31.2=
0 =C2=B1  7%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.48 =C2=B1 27%      -0.0        0.46 =C2=B1 26%      -0.0        0.4=
4 =C2=B1 32%  perf-profile.children.cycles-pp.pagecache_get_page
      0.07 =C2=B1  5%      -0.0        0.05 =C2=B1 41%      -0.0        0.0=
5 =C2=B1 41%  perf-profile.children.cycles-pp.timerqueue_iterate_next
      0.37 =C2=B1 28%      -0.0        0.35 =C2=B1 24%      -0.0        0.3=
3 =C2=B1 26%  perf-profile.children.cycles-pp.__entry_text_start
      0.58 =C2=B1  6%      -0.0        0.56 =C2=B1  9%      -0.0        0.5=
8 =C2=B1  7%  perf-profile.children.cycles-pp.native_apic_msr_eoi_write
      0.06 =C2=B1 35%      -0.0        0.04 =C2=B1 98%      -0.0        0.0=
5 =C2=B1 94%  perf-profile.children.cycles-pp.map__process_kallsym_symbol
      0.14 =C2=B1 22%      -0.0        0.12 =C2=B1 24%      -0.0        0.1=
3 =C2=B1 35%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.28 =C2=B1 11%      -0.0        0.25 =C2=B1 18%      -0.0        0.2=
6 =C2=B1 18%  perf-profile.children.cycles-pp.note_gp_changes
      0.02 =C2=B1141%      -0.0        0.00            -0.0        0.01 =C2=
=B1244%  perf-profile.children.cycles-pp.delay_tsc
      0.08 =C2=B1 31%      -0.0        0.06 =C2=B1 71%      -0.0        0.0=
6 =C2=B1 20%  perf-profile.children.cycles-pp.current_time
      0.33 =C2=B1 23%      -0.0        0.31 =C2=B1 27%      -0.0        0.2=
9 =C2=B1 23%  perf-profile.children.cycles-pp.dput
      0.30 =C2=B1 24%      -0.0        0.28 =C2=B1 29%      -0.0        0.2=
6 =C2=B1 24%  perf-profile.children.cycles-pp.shmem_undo_range
      0.40 =C2=B1 21%      -0.0        0.38 =C2=B1 23%      -0.0        0.3=
6 =C2=B1 22%  perf-profile.children.cycles-pp.__close
      0.21 =C2=B1 13%      -0.0        0.19 =C2=B1 12%      -0.0        0.2=
0 =C2=B1  6%  perf-profile.children.cycles-pp.sched_idle_set_state
      0.25 =C2=B1  8%      -0.0        0.23 =C2=B1  9%      -0.0        0.2=
3 =C2=B1 16%  perf-profile.children.cycles-pp.asm_exc_page_fault
      0.16 =C2=B1 31%      -0.0        0.14 =C2=B1 33%      -0.0        0.1=
3 =C2=B1 30%  perf-profile.children.cycles-pp.xas_load
      0.39 =C2=B1 19%      -0.0        0.37 =C2=B1 23%      -0.0        0.3=
5 =C2=B1 22%  perf-profile.children.cycles-pp.__fput
      0.02 =C2=B1141%      -0.0        0.00            +0.0        0.02 =C2=
=B1161%  perf-profile.children.cycles-pp.unmap_page_range
      0.02 =C2=B1141%      -0.0        0.00            +0.0        0.02 =C2=
=B1161%  perf-profile.children.cycles-pp.perf_read
      0.50 =C2=B1  5%      -0.0        0.48 =C2=B1  7%      +0.0        0.5=
1 =C2=B1 21%  perf-profile.children.cycles-pp.irqtime_account_process_tick
      0.17 =C2=B1 10%      -0.0        0.15 =C2=B1  6%      -0.0        0.1=
6 =C2=B1 13%  perf-profile.children.cycles-pp.handle_mm_fault
      0.46 =C2=B1 29%      -0.0        0.45 =C2=B1 36%      +0.0        0.4=
8 =C2=B1 32%  perf-profile.children.cycles-pp.perf_session__process_events
      0.15 =C2=B1 10%      -0.0        0.14 =C2=B1  9%      -0.0        0.1=
5 =C2=B1 12%  perf-profile.children.cycles-pp.__handle_mm_fault
      0.31 =C2=B1 24%      -0.0        0.29 =C2=B1 28%      -0.0        0.2=
6 =C2=B1 25%  perf-profile.children.cycles-pp.evict
      0.41 =C2=B1 18%      -0.0        0.39 =C2=B1 22%      -0.0        0.3=
7 =C2=B1 23%  perf-profile.children.cycles-pp.task_work_run
      0.12 =C2=B1 31%      -0.0        0.11 =C2=B1 25%      -0.0        0.1=
0 =C2=B1 21%  perf-profile.children.cycles-pp.file_update_time
      0.30 =C2=B1 24%      -0.0        0.29 =C2=B1 30%      -0.0        0.2=
6 =C2=B1 24%  perf-profile.children.cycles-pp.shmem_truncate_range
      0.30 =C2=B1 24%      -0.0        0.29 =C2=B1 30%      -0.0        0.2=
6 =C2=B1 25%  perf-profile.children.cycles-pp.shmem_evict_inode
      0.19 =C2=B1 31%      -0.0        0.18 =C2=B1 35%      +0.0        0.2=
0 =C2=B1 27%  perf-profile.children.cycles-pp.seq_read
      0.12 =C2=B1 15%      -0.0        0.11 =C2=B1  4%      -0.0        0.1=
2 =C2=B1 11%  perf-profile.children.cycles-pp.local_touch_nmi
      0.22 =C2=B1  7%      -0.0        0.20 =C2=B1  7%      -0.0        0.2=
1 =C2=B1 14%  perf-profile.children.cycles-pp.do_user_addr_fault
      0.31 =C2=B1 28%      -0.0        0.29 =C2=B1 36%      +0.0        0.3=
2 =C2=B1 32%  perf-profile.children.cycles-pp.perf_session__deliver_event
      0.04 =C2=B1 71%      -0.0        0.02 =C2=B1115%      +0.0        0.0=
4 =C2=B1 65%  perf-profile.children.cycles-pp.filemap_map_pages
      0.46 =C2=B1 29%      -0.0        0.45 =C2=B1 37%      +0.0        0.4=
8 =C2=B1 32%  perf-profile.children.cycles-pp.record__finish_output
      0.11 =C2=B1 22%      -0.0        0.10 =C2=B1 24%      -0.0        0.1=
1 =C2=B1 31%  perf-profile.children.cycles-pp.mem_cgroup_charge
      0.05 =C2=B1 46%      -0.0        0.04 =C2=B1 88%      -0.0        0.0=
4 =C2=B1 93%  perf-profile.children.cycles-pp.perf_callchain_user
      0.54 =C2=B1  9%      -0.0        0.53 =C2=B1 11%      +0.0        0.5=
8 =C2=B1 15%  perf-profile.children.cycles-pp.__schedule
      0.09 =C2=B1 54%      -0.0        0.08 =C2=B1 20%      -0.0        0.0=
8 =C2=B1 28%  perf-profile.children.cycles-pp.__fsnotify_parent
      0.02 =C2=B1144%      -0.0        0.01 =C2=B1244%      +0.0        0.0=
3 =C2=B1 94%  perf-profile.children.cycles-pp.__x86_indirect_thunk_rbx
      0.03 =C2=B1100%      -0.0        0.02 =C2=B1159%      -0.0        0.0=
1 =C2=B1244%  perf-profile.children.cycles-pp.proc_single_show
      0.03 =C2=B1100%      -0.0        0.02 =C2=B1159%      -0.0        0.0=
1 =C2=B1244%  perf-profile.children.cycles-pp.proc_pid_status
      0.23 =C2=B1  7%      -0.0        0.21 =C2=B1  7%      -0.0        0.2=
2 =C2=B1 16%  perf-profile.children.cycles-pp.exc_page_fault
      0.04 =C2=B1 71%      -0.0        0.02 =C2=B1116%      +0.0        0.0=
4 =C2=B1 65%  perf-profile.children.cycles-pp.copy_process
      0.32 =C2=B1 23%      -0.0        0.31 =C2=B1 26%      -0.0        0.2=
8 =C2=B1 23%  perf-profile.children.cycles-pp.__dentry_kill
      0.40 =C2=B1 27%      -0.0        0.39 =C2=B1 25%      -0.0        0.3=
7 =C2=B1 25%  perf-profile.children.cycles-pp.iov_iter_copy_from_user_atomic
      0.02 =C2=B1142%      -0.0        0.01 =C2=B1244%      -0.0        0.0=
0        perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.02 =C2=B1142%      -0.0        0.01 =C2=B1244%      -0.0        0.0=
2 =C2=B1161%  perf-profile.children.cycles-pp.__open64_nocancel
      0.07 =C2=B1 14%      -0.0        0.06 =C2=B1 18%      -0.0        0.0=
4 =C2=B1 67%  perf-profile.children.cycles-pp.setlocale
      0.13 =C2=B1  9%      -0.0        0.12 =C2=B1  9%      +0.0        0.1=
4 =C2=B1 10%  perf-profile.children.cycles-pp.restore_regs_and_return_to_ke=
rnel
      0.19 =C2=B1 10%      -0.0        0.18 =C2=B1 17%      -0.0        0.1=
9 =C2=B1 16%  perf-profile.children.cycles-pp.rcu_is_cpu_rrupt_from_idle
      0.08 =C2=B1 19%      -0.0        0.07 =C2=B1 13%      +0.0        0.0=
9 =C2=B1 37%  perf-profile.children.cycles-pp.__x86_retpoline_rbx
      0.01 =C2=B1223%      -0.0        0.00            -0.0        0.01 =C2=
=B1244%  perf-profile.children.cycles-pp.account_system_index_time
      0.10 =C2=B1 25%      -0.0        0.09 =C2=B1 30%      +0.0        0.1=
0 =C2=B1 25%  perf-profile.children.cycles-pp.path_lookupat
      0.02 =C2=B1141%      -0.0        0.01 =C2=B1244%      -0.0        0.0=
1 =C2=B1244%  perf-profile.children.cycles-pp.xas_create_range
      0.02 =C2=B1141%      -0.0        0.01 =C2=B1244%      +0.0        0.0=
2 =C2=B1158%  perf-profile.children.cycles-pp.unmap_vmas
      0.25 =C2=B1 30%      -0.0        0.24 =C2=B1 21%      -0.0        0.2=
0 =C2=B1 34%  perf-profile.children.cycles-pp.shmem_alloc_page
      0.28 =C2=B1 27%      -0.0        0.28 =C2=B1 35%      +0.0        0.3=
0 =C2=B1 32%  perf-profile.children.cycles-pp.machines__deliver_event
      0.53            -0.0        0.52 =C2=B1  6%      -0.0        0.52 =C2=
=B1  6%  perf-profile.children.cycles-pp.__x86_indirect_thunk_rax
      0.07 =C2=B1 16%      -0.0        0.06 =C2=B1 14%      -0.0        0.0=
7 =C2=B1 15%  perf-profile.children.cycles-pp.do_fault
      0.17 =C2=B1  7%      -0.0        0.16 =C2=B1 13%      +0.0        0.1=
8 =C2=B1 25%  perf-profile.children.cycles-pp._find_next_bit
      0.04 =C2=B1 72%      -0.0        0.03 =C2=B1 87%      +0.0        0.0=
5 =C2=B1 43%  perf-profile.children.cycles-pp.step_into
      0.31 =C2=B1 32%      -0.0        0.30 =C2=B1 25%      -0.0        0.2=
8 =C2=B1 27%  perf-profile.children.cycles-pp.security_file_permission
      0.01 =C2=B1223%      -0.0        0.00            -0.0        0.00    =
    perf-profile.children.cycles-pp.timekeeping_advance
      0.01 =C2=B1223%      -0.0        0.00            -0.0        0.00    =
    perf-profile.children.cycles-pp.lru_add_drain
      0.01 =C2=B1223%      -0.0        0.00            -0.0        0.00    =
    perf-profile.children.cycles-pp.lru_add_drain_cpu
      0.01 =C2=B1223%      -0.0        0.00            -0.0        0.00    =
    perf-profile.children.cycles-pp.__vm_enough_memory
      0.02 =C2=B1141%      -0.0        0.01 =C2=B1244%      -0.0        0.0=
0        perf-profile.children.cycles-pp.timestamp_truncate
      0.02 =C2=B1141%      -0.0        0.01 =C2=B1244%      -0.0        0.0=
1 =C2=B1244%  perf-profile.children.cycles-pp.generic_write_check_limits
      0.10 =C2=B1  9%      -0.0        0.09 =C2=B1 22%      -0.0        0.0=
9 =C2=B1 15%  perf-profile.children.cycles-pp.arch_cpu_idle_exit
      0.12 =C2=B1 22%      -0.0        0.12 =C2=B1 22%      +0.0        0.1=
4 =C2=B1 25%  perf-profile.children.cycles-pp.walk_component
      0.04 =C2=B1 71%      -0.0        0.03 =C2=B1116%      +0.0        0.0=
6 =C2=B1 20%  perf-profile.children.cycles-pp.perf_pmu_disable
      0.07 =C2=B1 14%      -0.0        0.06 =C2=B1 12%      +0.0        0.0=
8 =C2=B1 30%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.09 =C2=B1 14%      -0.0        0.09 =C2=B1 14%      -0.0        0.0=
9 =C2=B1 22%  perf-profile.children.cycles-pp.hrtimer_run_queues
      0.11 =C2=B1 15%      -0.0        0.11 =C2=B1 13%      +0.0        0.1=
2 =C2=B1 19%  perf-profile.children.cycles-pp.schedule_idle
      0.14 =C2=B1 12%      -0.0        0.13 =C2=B1 11%      +0.0        0.1=
6 =C2=B1 23%  perf-profile.children.cycles-pp.do_execveat_common
      0.14 =C2=B1 12%      -0.0        0.13 =C2=B1 11%      +0.0        0.1=
6 =C2=B1 21%  perf-profile.children.cycles-pp.__x64_sys_execve
      0.10 =C2=B1 25%      -0.0        0.09 =C2=B1 27%      +0.0        0.1=
0 =C2=B1 28%  perf-profile.children.cycles-pp.filename_lookup
      0.24 =C2=B1  7%      -0.0        0.23 =C2=B1 15%      +0.0        0.2=
5 =C2=B1 15%  perf-profile.children.cycles-pp.balance_fair
      0.20 =C2=B1  9%      -0.0        0.19 =C2=B1  9%      +0.0        0.2=
2 =C2=B1 13%  perf-profile.children.cycles-pp.rcu_segcblist_ready_cbs
      0.11 =C2=B1 10%      -0.0        0.10 =C2=B1 17%      +0.0        0.1=
1 =C2=B1 21%  perf-profile.children.cycles-pp.__note_gp_changes
      0.12 =C2=B1 24%      -0.0        0.11 =C2=B1 27%      +0.0        0.1=
2 =C2=B1 27%  perf-profile.children.cycles-pp.__do_sys_newstat
      0.23 =C2=B1 28%      -0.0        0.23 =C2=B1 19%      -0.0        0.2=
0 =C2=B1 28%  perf-profile.children.cycles-pp.alloc_pages_vma
      0.09 =C2=B1 26%      -0.0        0.08 =C2=B1 15%      +0.0        0.0=
9 =C2=B1 22%  perf-profile.children.cycles-pp.open64
      0.15 =C2=B1 32%      -0.0        0.15 =C2=B1 39%      +0.0        0.1=
6 =C2=B1 33%  perf-profile.children.cycles-pp.build_id__mark_dso_hit
      0.11 =C2=B1 25%      -0.0        0.11 =C2=B1 33%      +0.0        0.1=
2 =C2=B1 30%  perf-profile.children.cycles-pp.machine__process_fork_event
      0.20 =C2=B1  5%      -0.0        0.20 =C2=B1 11%      +0.0        0.2=
3 =C2=B1 24%  perf-profile.children.cycles-pp.read
      0.09 =C2=B1 21%      -0.0        0.09 =C2=B1 17%      -0.0        0.0=
8 =C2=B1 30%  perf-profile.children.cycles-pp.__pagevec_lru_add
      0.08 =C2=B1 10%      -0.0        0.08 =C2=B1 28%      +0.0        0.0=
9 =C2=B1 18%  perf-profile.children.cycles-pp.kmem_cache_alloc
      0.27 =C2=B1  6%      -0.0        0.26 =C2=B1 14%      +0.0        0.2=
8 =C2=B1 14%  perf-profile.children.cycles-pp.newidle_balance
      0.14 =C2=B1 12%      -0.0        0.13 =C2=B1 11%      +0.0        0.1=
6 =C2=B1 20%  perf-profile.children.cycles-pp.execve
      0.39 =C2=B1  8%      -0.0        0.38 =C2=B1 10%      +0.0        0.4=
2 =C2=B1 13%  perf-profile.children.cycles-pp.schedule
      0.12 =C2=B1 13%      -0.0        0.11 =C2=B1 11%      +0.0        0.1=
3 =C2=B1 19%  perf-profile.children.cycles-pp.bprm_execve
      0.04 =C2=B1101%      -0.0        0.03 =C2=B1 87%      -0.0        0.0=
3 =C2=B1117%  perf-profile.children.cycles-pp.xas_store
      0.33 =C2=B1  6%      -0.0        0.32 =C2=B1 12%      +0.0        0.3=
5 =C2=B1 13%  perf-profile.children.cycles-pp.smpboot_thread_fn
      0.11 =C2=B1 28%      -0.0        0.10 =C2=B1 35%      +0.0        0.1=
1 =C2=B1 33%  perf-profile.children.cycles-pp.thread__new
      0.07 =C2=B1 10%      -0.0        0.07 =C2=B1 13%      -0.0        0.0=
7 =C2=B1 46%  perf-profile.children.cycles-pp.__do_sys_clone
      0.07 =C2=B1 10%      -0.0        0.07 =C2=B1 13%      -0.0        0.0=
7 =C2=B1 46%  perf-profile.children.cycles-pp.kernel_clone
      0.11 =C2=B1 24%      -0.0        0.11 =C2=B1 32%      +0.0        0.1=
2 =C2=B1 28%  perf-profile.children.cycles-pp.__xstat64
      0.25 =C2=B1 29%      -0.0        0.25 =C2=B1 29%      +0.1        0.3=
1 =C2=B1 33%  perf-profile.children.cycles-pp.start_kernel
      0.22 =C2=B1 12%      -0.0        0.22 =C2=B1  7%      +0.0        0.2=
2 =C2=B1  7%  perf-profile.children.cycles-pp.can_stop_idle_tick
      0.06 =C2=B1 11%      -0.0        0.06 =C2=B1 46%      +0.0        0.0=
7 =C2=B1 41%  perf-profile.children.cycles-pp.evlist__close
      0.10 =C2=B1 27%      -0.0        0.10 =C2=B1 33%      +0.0        0.1=
1 =C2=B1 33%  perf-profile.children.cycles-pp.nsinfo__new
      0.19 =C2=B1 32%      -0.0        0.19 =C2=B1 37%      +0.0        0.2=
0 =C2=B1 32%  perf-profile.children.cycles-pp.__ordered_events__flush
      0.10 =C2=B1  7%      -0.0        0.10 =C2=B1 16%      -0.0        0.0=
9 =C2=B1 16%  perf-profile.children.cycles-pp.cpuidle_reflect
      0.01 =C2=B1223%      -0.0        0.01 =C2=B1244%      -0.0        0.0=
1 =C2=B1244%  perf-profile.children.cycles-pp.sys_imageblit
      0.01 =C2=B1223%      -0.0        0.01 =C2=B1244%      -0.0        0.0=
1 =C2=B1244%  perf-profile.children.cycles-pp.bit_putcs
      0.01 =C2=B1223%      -0.0        0.01 =C2=B1244%      -0.0        0.0=
1 =C2=B1244%  perf-profile.children.cycles-pp.vt_console_print
      0.01 =C2=B1223%      -0.0        0.01 =C2=B1244%      -0.0        0.0=
1 =C2=B1244%  perf-profile.children.cycles-pp.fbcon_putcs
      0.01 =C2=B1223%      -0.0        0.01 =C2=B1244%      -0.0        0.0=
1 =C2=B1244%  perf-profile.children.cycles-pp.drm_fb_helper_sys_imageblit
      0.07 =C2=B1  8%      -0.0        0.07 =C2=B1 11%      +0.0        0.0=
8 =C2=B1 32%  perf-profile.children.cycles-pp.__x64_sys_exit_group
      0.07 =C2=B1  8%      -0.0        0.07 =C2=B1 11%      +0.0        0.0=
8 =C2=B1 32%  perf-profile.children.cycles-pp.do_group_exit
      0.07 =C2=B1  8%      -0.0        0.07 =C2=B1 11%      +0.0        0.0=
8 =C2=B1 32%  perf-profile.children.cycles-pp.do_exit
      0.04 =C2=B1 72%      -0.0        0.04 =C2=B1 88%      -0.0        0.0=
3 =C2=B1 88%  perf-profile.children.cycles-pp.cpu_latency_qos_limit
      0.03 =C2=B1100%      -0.0        0.02 =C2=B1116%      -0.0        0.0=
2 =C2=B1118%  perf-profile.children.cycles-pp.up_write
      0.12 =C2=B1 27%      -0.0        0.11 =C2=B1 16%      -0.0        0.1=
0 =C2=B1 27%  perf-profile.children.cycles-pp.iov_iter_fault_in_readable
      0.09 =C2=B1 27%      -0.0        0.08 =C2=B1 22%      -0.0        0.0=
8 =C2=B1 25%  perf-profile.children.cycles-pp.__might_sleep
      0.09 =C2=B1 17%      -0.0        0.08 =C2=B1 26%      -0.0        0.0=
8 =C2=B1 29%  perf-profile.children.cycles-pp.lru_cache_add
      0.13 =C2=B1 16%      -0.0        0.12 =C2=B1  8%      +0.0        0.1=
3 =C2=B1 23%  perf-profile.children.cycles-pp.profile_tick
      0.11 =C2=B1 25%      -0.0        0.11 =C2=B1 28%      +0.0        0.1=
2 =C2=B1 27%  perf-profile.children.cycles-pp.vfs_statx
      0.14 =C2=B1 31%      -0.0        0.14 =C2=B1 38%      +0.0        0.1=
5 =C2=B1 34%  perf-profile.children.cycles-pp.thread__find_map
      0.12 =C2=B1 21%      -0.0        0.12 =C2=B1 19%      -0.0        0.1=
2 =C2=B1 18%  perf-profile.children.cycles-pp.__unwind_start
      0.07 =C2=B1 10%      -0.0        0.07 =C2=B1 13%      +0.0        0.0=
8 =C2=B1 25%  perf-profile.children.cycles-pp.mmput
      0.07 =C2=B1 14%      -0.0        0.07 =C2=B1  9%      -0.0        0.0=
7 =C2=B1 30%  perf-profile.children.cycles-pp.update_load_avg
      0.10 =C2=B1 20%      -0.0        0.10 =C2=B1 25%      +0.0        0.1=
1 =C2=B1 25%  perf-profile.children.cycles-pp.rcu_do_batch
      0.11 =C2=B1 35%      -0.0        0.11 =C2=B1 33%      +0.0        0.1=
2 =C2=B1 30%  perf-profile.children.cycles-pp.seq_printf
      0.09 =C2=B1 42%      -0.0        0.09 =C2=B1 37%      +0.0        0.1=
0 =C2=B1 35%  perf-profile.children.cycles-pp.s_show
      0.01 =C2=B1223%      -0.0        0.01 =C2=B1244%      -0.0        0.0=
1 =C2=B1244%  perf-profile.children.cycles-pp.symbol__is_idle
      0.07 =C2=B1 16%      -0.0        0.07 =C2=B1 19%      +0.0        0.0=
7 =C2=B1 23%  perf-profile.children.cycles-pp._raw_spin_trylock
      0.14 =C2=B1 31%      -0.0        0.14 =C2=B1 39%      +0.0        0.1=
4 =C2=B1 34%  perf-profile.children.cycles-pp.map__load
      0.09 =C2=B1 13%      -0.0        0.09 =C2=B1 13%      +0.0        0.1=
0 =C2=B1 25%  perf-profile.children.cycles-pp.__libc_fork
      0.06 =C2=B1 13%      -0.0        0.05 =C2=B1 41%      -0.0        0.0=
5 =C2=B1  9%  perf-profile.children.cycles-pp.cpuidle_select
      0.02 =C2=B1141%      -0.0        0.01 =C2=B1158%      +0.0        0.0=
3 =C2=B1120%  perf-profile.children.cycles-pp.perf_evsel__read
      0.04 =C2=B1 71%      -0.0        0.03 =C2=B1 87%      -0.0        0.0=
2 =C2=B1161%  perf-profile.children.cycles-pp.__get_user_nocheck_8
      0.26 =C2=B1  8%      -0.0        0.25 =C2=B1  5%      +0.0        0.2=
7 =C2=B1  9%  perf-profile.children.cycles-pp.rcu_nocb_flush_deferred_wakeup
      0.10 =C2=B1 30%      -0.0        0.09 =C2=B1 39%      +0.0        0.1=
0 =C2=B1 38%  perf-profile.children.cycles-pp.kallsyms__parse
      0.03 =C2=B1 99%      -0.0        0.02 =C2=B1116%      +0.0        0.0=
3 =C2=B1117%  perf-profile.children.cycles-pp.kmem_cache_free
      0.13 =C2=B1 31%      -0.0        0.13 =C2=B1 36%      +0.0        0.1=
4 =C2=B1 36%  perf-profile.children.cycles-pp.__dso__load_kallsyms
      0.08 =C2=B1  5%      -0.0        0.08 =C2=B1 12%      +0.0        0.1=
0 =C2=B1 19%  perf-profile.children.cycles-pp.load_elf_binary
      0.32 =C2=B1 31%      -0.0        0.32 =C2=B1 20%      -0.0        0.3=
0 =C2=B1 30%  perf-profile.children.cycles-pp.shmem_alloc_and_acct_page
      0.20 =C2=B1 25%      -0.0        0.20 =C2=B1 22%      -0.0        0.1=
7 =C2=B1 26%  perf-profile.children.cycles-pp.__alloc_pages_nodemask
      0.10 =C2=B1 18%      -0.0        0.10 =C2=B1 18%      +0.0        0.1=
2 =C2=B1 13%  perf-profile.children.cycles-pp.perf_trace_sched_switch
      0.07 =C2=B1  9%      -0.0        0.07 =C2=B1 13%      +0.0        0.0=
8 =C2=B1 25%  perf-profile.children.cycles-pp.exit_mmap
      0.26 =C2=B1 27%      -0.0        0.26 =C2=B1 31%      +0.0        0.2=
9 =C2=B1 28%  perf-profile.children.cycles-pp.seq_read_iter
      0.11 =C2=B1 30%      -0.0        0.11 =C2=B1 34%      +0.0        0.1=
2 =C2=B1 33%  perf-profile.children.cycles-pp.____machine__findnew_thread
      0.01 =C2=B1223%      -0.0        0.01 =C2=B1244%      +0.0        0.0=
1 =C2=B1244%  perf-profile.children.cycles-pp.__kernel_text_address
      0.01 =C2=B1223%      -0.0        0.01 =C2=B1244%      +0.0        0.0=
2 =C2=B1159%  perf-profile.children.cycles-pp.rcu_dynticks_task_enter
      0.01 =C2=B1223%      -0.0        0.01 =C2=B1244%      +0.0        0.0=
2 =C2=B1158%  perf-profile.children.cycles-pp.perf_output_sample
      0.34 =C2=B1 21%      -0.0        0.34 =C2=B1 19%      -0.0        0.3=
1 =C2=B1 25%  perf-profile.children.cycles-pp.task_tick_fair
      0.07 =C2=B1 23%      -0.0        0.07 =C2=B1 20%      -0.0        0.0=
6 =C2=B1 51%  perf-profile.children.cycles-pp.__list_del_entry_valid
      0.13 =C2=B1 37%      -0.0        0.13 =C2=B1 37%      +0.0        0.1=
5 =C2=B1 32%  perf-profile.children.cycles-pp.proc_reg_read
      0.14 =C2=B1 29%      -0.0        0.14 =C2=B1 39%      -0.0        0.1=
4 =C2=B1 34%  perf-profile.children.cycles-pp.ordered_events__queue
      0.25 =C2=B1  8%      -0.0        0.25 =C2=B1  7%      +0.0        0.2=
5 =C2=B1 12%  perf-profile.children.cycles-pp.tick_nohz_tick_stopped
      0.14 =C2=B1 33%      -0.0        0.14 =C2=B1 39%      +0.0        0.1=
4 =C2=B1 34%  perf-profile.children.cycles-pp.dso__load
      0.07 =C2=B1 20%      -0.0        0.07 =C2=B1 19%      +0.0        0.0=
8 =C2=B1 28%  perf-profile.children.cycles-pp.perf_trace_sched_wakeup_templ=
ate
      0.02 =C2=B1141%      -0.0        0.02 =C2=B1159%      -0.0        0.0=
0        perf-profile.children.cycles-pp.unlock_page
      0.35 =C2=B1 25%      -0.0        0.35 =C2=B1 21%      -0.0        0.3=
3 =C2=B1 26%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.20 =C2=B1  7%      -0.0        0.20 =C2=B1 12%      +0.0        0.2=
1 =C2=B1 12%  perf-profile.children.cycles-pp.sched_clock_idle_wakeup_event
      0.06 =C2=B1 24%      -0.0        0.06 =C2=B1 53%      -0.0        0.0=
5 =C2=B1 47%  perf-profile.children.cycles-pp.page_mapping
      0.10 =C2=B1 31%      -0.0        0.10 =C2=B1 30%      -0.0        0.0=
9 =C2=B1 31%  perf-profile.children.cycles-pp.mark_page_accessed
      0.48 =C2=B1 12%      -0.0        0.48 =C2=B1 10%      +0.0        0.5=
0 =C2=B1 21%  perf-profile.children.cycles-pp.perf_tp_event
      0.07 =C2=B1  9%      -0.0        0.07 =C2=B1 22%      +0.0        0.0=
9 =C2=B1 16%  perf-profile.children.cycles-pp.evlist__delete
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.children.cycles-pp.format_decode
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.children.cycles-pp.__evlist__disable
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.children.cycles-pp.get_mem_cgroup_from_mm
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.children.cycles-pp.enqueue_entity
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.children.cycles-pp.run_timer_softirq
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.children.cycles-pp.call_timer_fn
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.children.cycles-pp.shmem_pseudo_vma_init
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.children.cycles-pp.drm_gem_shmem_vmap
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.children.cycles-pp.rcu_advance_cbs
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.children.cycles-pp.getname_flags
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.children.cycles-pp.__perf_event_header__init_id
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.children.cycles-pp.finish_task_switch
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.children.cycles-pp.kernel_text_address
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.children.cycles-pp.dev_attr_show
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.children.cycles-pp.orc_find
      0.10 =C2=B1 11%      +0.0        0.10 =C2=B1 22%      +0.0        0.1=
1 =C2=B1 26%  perf-profile.children.cycles-pp.ksoftirqd_running
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.children.cycles-pp.noop_fsync
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.children.cycles-pp.zap_pte_range
      0.00            +0.0        0.00            +0.0        0.01 =C2=B115=
8%  perf-profile.children.cycles-pp.__lookup_slow
      0.00            +0.0        0.00            +0.0        0.01 =C2=B115=
8%  perf-profile.children.cycles-pp.apparmor_file_permission
      0.00            +0.0        0.00            +0.0        0.02 =C2=B115=
9%  perf-profile.children.cycles-pp.move_queued_task
      0.00            +0.0        0.00            +0.0        0.02 =C2=B115=
9%  perf-profile.children.cycles-pp.__msecs_to_jiffies
      0.00            +0.0        0.00            +0.0        0.02 =C2=B115=
9%  perf-profile.children.cycles-pp.begin_new_exec
      0.00            +0.0        0.00            +0.0        0.02 =C2=B115=
9%  perf-profile.children.cycles-pp.preempt_schedule_common
      0.06 =C2=B1 13%      +0.0        0.06 =C2=B1 47%      -0.0        0.0=
5 =C2=B1 48%  perf-profile.children.cycles-pp.__orc_find
      0.10 =C2=B1 11%      +0.0        0.10 =C2=B1 13%      +0.0        0.1=
0 =C2=B1 18%  perf-profile.children.cycles-pp.__cond_resched
      0.09 =C2=B1 25%      +0.0        0.09 =C2=B1 16%      -0.0        0.0=
8 =C2=B1 28%  perf-profile.children.cycles-pp.__get_user_nocheck_1
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1244%      -0.0        0.0=
1 =C2=B1244%  perf-profile.children.cycles-pp.unaccount_page_cache_page
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1244%      +0.0        0.0=
2 =C2=B1159%  perf-profile.children.cycles-pp.perf_release
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1244%      +0.0        0.0=
2 =C2=B1159%  perf-profile.children.cycles-pp.perf_event_release_kernel
      0.33 =C2=B1 18%      +0.0        0.33 =C2=B1 14%      -0.0        0.3=
2 =C2=B1 24%  perf-profile.children.cycles-pp.perf_trace_sched_stat_runtime
      0.06 =C2=B1 46%      +0.0        0.06 =C2=B1 12%      -0.0        0.0=
5 =C2=B1 48%  perf-profile.children.cycles-pp.arch_scale_freq_tick
      0.13 =C2=B1 30%      +0.0        0.13 =C2=B1 39%      +0.0        0.1=
3 =C2=B1 37%  perf-profile.children.cycles-pp.queue_event
      0.07 =C2=B1 23%      +0.0        0.07 =C2=B1 21%      +0.0        0.0=
7 =C2=B1 34%  perf-profile.children.cycles-pp.pipe_read
      0.09 =C2=B1  8%      +0.0        0.09 =C2=B1 15%      +0.0        0.1=
0 =C2=B1 20%  perf-profile.children.cycles-pp.exec_binprm
      0.12 =C2=B1 21%      +0.0        0.13 =C2=B1 17%      +0.0        0.1=
3 =C2=B1 29%  perf-profile.children.cycles-pp.link_path_walk
      0.09 =C2=B1 29%      +0.0        0.09 =C2=B1 18%      -0.0        0.0=
8 =C2=B1 31%  perf-profile.children.cycles-pp.rmqueue
      0.08 =C2=B1 26%      +0.0        0.08 =C2=B1 32%      +0.0        0.0=
9 =C2=B1 80%  perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.03 =C2=B1100%      +0.0        0.03 =C2=B1 88%      +0.0        0.0=
4 =C2=B1 93%  perf-profile.children.cycles-pp.xas_start
      0.12 =C2=B1 30%      +0.0        0.12 =C2=B1 19%      -0.0        0.1=
1 =C2=B1 38%  perf-profile.children.cycles-pp.down_write
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1244%      +0.0        0.0=
4 =C2=B1 65%  perf-profile.children.cycles-pp.__wake_up_common_lock
      0.08 =C2=B1 29%      +0.0        0.08 =C2=B1 31%      -0.0        0.0=
7 =C2=B1 26%  perf-profile.children.cycles-pp.set_page_dirty
      0.12 =C2=B1 34%      +0.0        0.12 =C2=B1 33%      +0.0        0.1=
3 =C2=B1 30%  perf-profile.children.cycles-pp.vsnprintf
      0.07 =C2=B1 10%      +0.0        0.07 =C2=B1 17%      +0.0        0.0=
7 =C2=B1 28%  perf-profile.children.cycles-pp.update_group_capacity
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1244%      +0.0        0.0=
2 =C2=B1118%  perf-profile.children.cycles-pp.autoremove_wake_function
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1244%      +0.0        0.0=
3 =C2=B1 89%  perf-profile.children.cycles-pp.__wake_up_common
      0.49 =C2=B1 19%      +0.0        0.49 =C2=B1 21%      -0.0        0.4=
5 =C2=B1 22%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.11 =C2=B1 36%      +0.0        0.11 =C2=B1 33%      +0.0        0.1=
2 =C2=B1 29%  perf-profile.children.cycles-pp.seq_vprintf
      0.04 =C2=B1 71%      +0.0        0.04 =C2=B1 91%      -0.0        0.0=
3 =C2=B1120%  perf-profile.children.cycles-pp.free_unref_page_list
      0.10 =C2=B1  8%      +0.0        0.10 =C2=B1 10%      +0.0        0.1=
0 =C2=B1 22%  perf-profile.children.cycles-pp.task_tick_idle
      0.06 =C2=B1 14%      +0.0        0.07 =C2=B1 11%      +0.0        0.0=
7 =C2=B1 21%  perf-profile.children.cycles-pp.ksys_mmap_pgoff
      0.45 =C2=B1 12%      +0.0        0.45 =C2=B1 10%      +0.0        0.4=
6 =C2=B1 21%  perf-profile.children.cycles-pp.__perf_event_overflow
      0.14 =C2=B1  9%      +0.0        0.14 =C2=B1  9%      -0.0        0.1=
3 =C2=B1 12%  perf-profile.children.cycles-pp.rcu_dynticks_eqs_enter
      0.20 =C2=B1 15%      +0.0        0.20 =C2=B1 14%      -0.0        0.1=
9 =C2=B1 17%  perf-profile.children.cycles-pp.unwind_next_frame
      0.06 =C2=B1 16%      +0.0        0.06 =C2=B1 20%      -0.0        0.0=
6 =C2=B1 41%  perf-profile.children.cycles-pp.mmap_region
      0.06 =C2=B1 19%      +0.0        0.06 =C2=B1 11%      +0.0        0.0=
7 =C2=B1 19%  perf-profile.children.cycles-pp.timer_clear_idle
      0.29 =C2=B1 10%      +0.0        0.29 =C2=B1 10%      -0.0        0.2=
9 =C2=B1  8%  perf-profile.children.cycles-pp.trigger_load_balance
      0.46 =C2=B1 11%      +0.0        0.46 =C2=B1  9%      +0.0        0.4=
7 =C2=B1 21%  perf-profile.children.cycles-pp.perf_swevent_overflow
      0.03 =C2=B1100%      +0.0        0.03 =C2=B1 87%      -0.0        0.0=
2 =C2=B1115%  perf-profile.children.cycles-pp.tick_nohz_idle_retain_tick
      0.45 =C2=B1 11%      +0.0        0.45 =C2=B1 10%      +0.0        0.4=
5 =C2=B1 21%  perf-profile.children.cycles-pp.perf_event_output_forward
      0.09 =C2=B1 11%      +0.0        0.10 =C2=B1 13%      +0.0        0.1=
1 =C2=B1  9%  perf-profile.children.cycles-pp.rcu_idle_enter
      0.33 =C2=B1  7%      +0.0        0.34 =C2=B1 10%      +0.0        0.3=
5 =C2=B1 23%  perf-profile.children.cycles-pp.run_posix_cpu_timers
      0.03 =C2=B1100%      +0.0        0.04 =C2=B1 89%      -0.0        0.0=
2 =C2=B1159%  perf-profile.children.cycles-pp.iov_iter_advance
      0.07 =C2=B1 14%      +0.0        0.08 =C2=B1 15%      -0.0        0.0=
6 =C2=B1 14%  perf-profile.children.cycles-pp.check_tsc_unstable
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1158%      +0.0        0.0=
1 =C2=B1244%  perf-profile.children.cycles-pp.__libc_write
      0.37 =C2=B1 16%      +0.0        0.37 =C2=B1 15%      -0.0        0.3=
6 =C2=B1 22%  perf-profile.children.cycles-pp.update_curr
      0.39 =C2=B1 14%      +0.0        0.39 =C2=B1 11%      -0.0        0.3=
9 =C2=B1 21%  perf-profile.children.cycles-pp.perf_prepare_sample
      0.03 =C2=B1100%      +0.0        0.03 =C2=B1 88%      +0.0        0.0=
5 =C2=B1 43%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.87            +0.0        0.87 =C2=B1  7%      +0.1        0.98 =C2=
=B1 18%  perf-profile.children.cycles-pp.update_irq_load_avg
      0.73 =C2=B1 25%      +0.0        0.73 =C2=B1 30%      +0.0        0.7=
6 =C2=B1 27%  perf-profile.children.cycles-pp.cmd_record
      0.11 =C2=B1 29%      +0.0        0.11 =C2=B1 26%      -0.0        0.1=
0 =C2=B1 18%  perf-profile.children.cycles-pp.__pagevec_release
      0.03 =C2=B1 99%      +0.0        0.03 =C2=B1 87%      +0.0        0.0=
4 =C2=B1 91%  perf-profile.children.cycles-pp.__bitmap_and
      0.10 =C2=B1 33%      +0.0        0.11 =C2=B1 29%      +0.0        0.1=
1 =C2=B1 39%  perf-profile.children.cycles-pp.delete_from_page_cache
      0.07 =C2=B1 11%      +0.0        0.07 =C2=B1 13%      +0.0        0.0=
7 =C2=B1 18%  perf-profile.children.cycles-pp.do_mmap
      0.58 =C2=B1 22%      +0.0        0.59 =C2=B1 21%      -0.0        0.5=
5 =C2=B1 20%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.07 =C2=B1 10%      +0.0        0.08 =C2=B1 12%      +0.0        0.0=
8 =C2=B1 21%  perf-profile.children.cycles-pp.vm_mmap_pgoff
      0.10 =C2=B1 13%      +0.0        0.11 =C2=B1 12%      +0.0        0.1=
4 =C2=B1 28%  perf-profile.children.cycles-pp.update_dl_rq_load_avg
      0.03 =C2=B1103%      +0.0        0.04 =C2=B1 93%      +0.0        0.0=
5 =C2=B1 65%  perf-profile.children.cycles-pp.free_unref_page
      0.06 =C2=B1  6%      +0.0        0.07 =C2=B1 17%      +0.0        0.0=
8 =C2=B1 16%  perf-profile.children.cycles-pp.affine_move_task
      0.08 =C2=B1  7%      +0.0        0.09 =C2=B1 10%      +0.0        0.0=
9 =C2=B1 29%  perf-profile.children.cycles-pp.intel_pmu_disable_all
      0.03 =C2=B1101%      +0.0        0.04 =C2=B1 88%      +0.0        0.0=
4 =C2=B1 67%  perf-profile.children.cycles-pp.do_open
      0.02 =C2=B1144%      +0.0        0.03 =C2=B1120%      +0.0        0.0=
4 =C2=B1 69%  perf-profile.children.cycles-pp.pipe_write
      0.01 =C2=B1223%      +0.0        0.02 =C2=B1159%      -0.0        0.0=
1 =C2=B1244%  perf-profile.children.cycles-pp.number
      0.10 =C2=B1 15%      +0.0        0.11 =C2=B1 21%      +0.0        0.1=
2 =C2=B1 21%  perf-profile.children.cycles-pp.try_to_wake_up
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1158%      -0.0        0.0=
1 =C2=B1244%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1158%      -0.0        0.0=
1 =C2=B1244%  perf-profile.children.cycles-pp.__do_munmap
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1158%      +0.0        0.0=
1 =C2=B1244%  perf-profile.children.cycles-pp.unwind_get_return_address
      0.14 =C2=B1 23%      +0.0        0.14 =C2=B1 24%      -0.0        0.1=
2 =C2=B1 27%  perf-profile.children.cycles-pp.get_page_from_freelist
      1.02 =C2=B1  4%      +0.0        1.02 =C2=B1  6%      -0.0        1.0=
1 =C2=B1  5%  perf-profile.children.cycles-pp.hrtimer_update_next_event
      0.12 =C2=B1 32%      +0.0        0.13 =C2=B1 30%      -0.0        0.1=
2 =C2=B1 36%  perf-profile.children.cycles-pp.truncate_inode_page
      0.07 =C2=B1 14%      +0.0        0.07 =C2=B1 13%      +0.0        0.0=
7 =C2=B1 43%  perf-profile.children.cycles-pp.tick_nohz_get_next_hrtimer
      0.11 =C2=B1 34%      +0.0        0.12 =C2=B1 20%      -0.0        0.1=
0 =C2=B1 28%  perf-profile.children.cycles-pp.write(a)plt
      0.14 =C2=B1  9%      +0.0        0.15 =C2=B1 12%      +0.0        0.1=
5 =C2=B1 23%  perf-profile.children.cycles-pp.asm_sysvec_irq_work
      0.14 =C2=B1  9%      +0.0        0.15 =C2=B1 12%      +0.0        0.1=
5 =C2=B1 23%  perf-profile.children.cycles-pp.sysvec_irq_work
      0.14 =C2=B1  9%      +0.0        0.15 =C2=B1 12%      +0.0        0.1=
5 =C2=B1 23%  perf-profile.children.cycles-pp.__sysvec_irq_work
      0.14 =C2=B1  9%      +0.0        0.15 =C2=B1 12%      +0.0        0.1=
5 =C2=B1 23%  perf-profile.children.cycles-pp.irq_work_run
      0.14 =C2=B1  9%      +0.0        0.15 =C2=B1 12%      +0.0        0.1=
5 =C2=B1 23%  perf-profile.children.cycles-pp.irq_work_single
      0.34 =C2=B1 14%      +0.0        0.35 =C2=B1 11%      -0.0        0.3=
4 =C2=B1 20%  perf-profile.children.cycles-pp.perf_callchain
      0.17 =C2=B1 19%      +0.0        0.18 =C2=B1 23%      +0.0        0.1=
8 =C2=B1 21%  perf-profile.children.cycles-pp.pm_qos_read_value
      0.00            +0.0        0.01 =C2=B1244%      +0.0        0.00    =
    perf-profile.children.cycles-pp.rcu_all_qs
      0.00            +0.0        0.01 =C2=B1244%      +0.0        0.00    =
    perf-profile.children.cycles-pp.sched_clock_idle_sleep_event
      0.00            +0.0        0.01 =C2=B1244%      +0.0        0.00    =
    perf-profile.children.cycles-pp.cpu_stop_queue_work
      0.00            +0.0        0.01 =C2=B1244%      +0.0        0.00    =
    perf-profile.children.cycles-pp.native_irq_return_ldt
      0.00            +0.0        0.01 =C2=B1244%      +0.0        0.00    =
    perf-profile.children.cycles-pp.wake_up_q
      0.00            +0.0        0.01 =C2=B1244%      +0.0        0.00    =
    perf-profile.children.cycles-pp.alloc_empty_file
      0.00            +0.0        0.01 =C2=B1244%      +0.0        0.01 =C2=
=B1244%  perf-profile.children.cycles-pp.rcu_irq_enter
      0.00            +0.0        0.01 =C2=B1244%      +0.0        0.01 =C2=
=B1244%  perf-profile.children.cycles-pp._free_event
      0.00            +0.0        0.01 =C2=B1244%      +0.0        0.01 =C2=
=B1244%  perf-profile.children.cycles-pp.lseek(a)plt
      0.00            +0.0        0.01 =C2=B1244%      +0.0        0.01 =C2=
=B1244%  perf-profile.children.cycles-pp.lf
      0.00            +0.0        0.01 =C2=B1244%      +0.0        0.01 =C2=
=B1244%  perf-profile.children.cycles-pp.con_scroll
      0.00            +0.0        0.01 =C2=B1244%      +0.0        0.01 =C2=
=B1244%  perf-profile.children.cycles-pp.fbcon_scroll
      0.00            +0.0        0.01 =C2=B1244%      +0.0        0.01 =C2=
=B1244%  perf-profile.children.cycles-pp.fbcon_redraw
      0.00            +0.0        0.01 =C2=B1244%      +0.0        0.01 =C2=
=B1158%  perf-profile.children.cycles-pp.do_dentry_open
      0.00            +0.0        0.01 =C2=B1244%      +0.0        0.02 =C2=
=B1161%  perf-profile.children.cycles-pp.migration_cpu_stop
      0.00            +0.0        0.01 =C2=B1244%      +0.0        0.02 =C2=
=B1161%  perf-profile.children.cycles-pp.sysfs_kf_seq_show
      0.00            +0.0        0.01 =C2=B1244%      +0.0        0.03 =C2=
=B1117%  perf-profile.children.cycles-pp.cpu_stopper_thread
      0.15 =C2=B1 13%      +0.0        0.16 =C2=B1 11%      +0.0        0.1=
5 =C2=B1 21%  perf-profile.children.cycles-pp.printk
      0.01 =C2=B1223%      +0.0        0.02 =C2=B1159%      -0.0        0.0=
1 =C2=B1244%  perf-profile.children.cycles-pp.shmem_file_llseek
      0.01 =C2=B1223%      +0.0        0.02 =C2=B1159%      +0.0        0.0=
1 =C2=B1244%  perf-profile.children.cycles-pp.workingset_activation
      0.06 =C2=B1 20%      +0.0        0.07 =C2=B1 13%      -0.0        0.0=
5 =C2=B1 44%  perf-profile.children.cycles-pp.free_pcppages_bulk
      0.72 =C2=B1 25%      +0.0        0.73 =C2=B1 30%      +0.0        0.7=
6 =C2=B1 27%  perf-profile.children.cycles-pp.cmd_sched
      0.20 =C2=B1  2%      +0.0        0.21 =C2=B1  7%      +0.0        0.2=
1 =C2=B1  8%  perf-profile.children.cycles-pp.cpuidle_not_available
      0.23 =C2=B1 13%      +0.0        0.24 =C2=B1 19%      +0.0        0.2=
5 =C2=B1 21%  perf-profile.children.cycles-pp.do_sys_open
      0.23 =C2=B1 14%      +0.0        0.24 =C2=B1 19%      +0.0        0.2=
5 =C2=B1 21%  perf-profile.children.cycles-pp.do_sys_openat2
      0.06 =C2=B1 17%      +0.0        0.07 =C2=B1 10%      +0.0        0.0=
7 =C2=B1 27%  perf-profile.children.cycles-pp.sched_clock_tick
      0.00            +0.0        0.01 =C2=B1244%      +0.0        0.03 =C2=
=B1169%  perf-profile.children.cycles-pp.security_vm_enough_memory_mm
      0.34 =C2=B1 14%      +0.0        0.35 =C2=B1 11%      -0.0        0.3=
3 =C2=B1 20%  perf-profile.children.cycles-pp.get_perf_callchain
      0.49 =C2=B1  5%      +0.0        0.50 =C2=B1  6%      +0.0        0.4=
9 =C2=B1  5%  perf-profile.children.cycles-pp.__hrtimer_get_next_event
      0.01 =C2=B1223%      +0.0        0.02 =C2=B1158%      +0.0        0.0=
3 =C2=B1 89%  perf-profile.children.cycles-pp.mutex_lock
      0.13 =C2=B1 19%      +0.0        0.14 =C2=B1 22%      -0.0        0.1=
2 =C2=B1 17%  perf-profile.children.cycles-pp.release_pages
      0.25 =C2=B1 22%      +0.0        0.26 =C2=B1 25%      +0.0        0.2=
9 =C2=B1 25%  perf-profile.children.cycles-pp.__libc_read
      0.08 =C2=B1 17%      +0.0        0.09 =C2=B1 12%      +0.0        0.0=
9 =C2=B1 24%  perf-profile.children.cycles-pp.dequeue_entity
      0.05 =C2=B1 47%      +0.0        0.06 =C2=B1  8%      +0.0        0.0=
5 =C2=B1 46%  perf-profile.children.cycles-pp.evsel__read_counter
      0.12 =C2=B1 30%      +0.0        0.13 =C2=B1  8%      -0.0        0.1=
2 =C2=B1 18%  perf-profile.children.cycles-pp.calc_global_load_tick
      0.10 =C2=B1 24%      +0.0        0.11 =C2=B1 27%      -0.0        0.1=
0 =C2=B1 22%  perf-profile.children.cycles-pp.ksys_lseek
      0.41 =C2=B1 15%      +0.0        0.42 =C2=B1 19%      +0.1        0.4=
8 =C2=B1 24%  perf-profile.children.cycles-pp.vfs_read
      0.20 =C2=B1 12%      +0.0        0.21 =C2=B1 17%      +0.0        0.2=
2 =C2=B1 21%  perf-profile.children.cycles-pp.path_openat
      0.15 =C2=B1 19%      +0.0        0.16 =C2=B1 11%      +0.0        0.1=
5 =C2=B1 19%  perf-profile.children.cycles-pp.tick_sched_do_timer
      0.20 =C2=B1 13%      +0.0        0.21 =C2=B1 18%      +0.0        0.2=
2 =C2=B1 22%  perf-profile.children.cycles-pp.do_filp_open
      1.30 =C2=B1  4%      +0.0        1.31 =C2=B1  6%      +0.1        1.4=
0 =C2=B1 18%  perf-profile.children.cycles-pp.__remove_hrtimer
      0.22 =C2=B1 11%      +0.0        0.23 =C2=B1  4%      +0.0        0.2=
2 =C2=B1 11%  perf-profile.children.cycles-pp.call_cpuidle
      0.08 =C2=B1 14%      +0.0        0.09 =C2=B1  6%      +0.0        0.1=
0 =C2=B1 25%  perf-profile.children.cycles-pp.dequeue_task_fair
      0.42 =C2=B1 15%      +0.0        0.43 =C2=B1 19%      +0.1        0.4=
9 =C2=B1 24%  perf-profile.children.cycles-pp.ksys_read
      0.07 =C2=B1 29%      +0.0        0.08 =C2=B1 29%      -0.0        0.0=
7 =C2=B1 23%  perf-profile.children.cycles-pp.force_qs_rnp
      0.02 =C2=B1142%      +0.0        0.03 =C2=B1115%      +0.0        0.0=
2 =C2=B1158%  perf-profile.children.cycles-pp.sysfs__read_str
      0.27 =C2=B1 16%      +0.0        0.28 =C2=B1 14%      -0.0        0.2=
6 =C2=B1 19%  perf-profile.children.cycles-pp.perf_callchain_kernel
      0.10 =C2=B1  6%      +0.0        0.11 =C2=B1 13%      +0.0        0.1=
1 =C2=B1 37%  perf-profile.children.cycles-pp.account_process_tick
      0.03 =C2=B1105%      +0.0        0.04 =C2=B1104%      -0.0        0.0=
2 =C2=B1158%  perf-profile.children.cycles-pp.__set_page_dirty_no_writeback
      0.07 =C2=B1 54%      +0.0        0.08 =C2=B1 25%      -0.0        0.0=
6 =C2=B1 58%  perf-profile.children.cycles-pp.__delete_from_page_cache
      0.22 =C2=B1 11%      +0.0        0.23 =C2=B1  7%      +0.0        0.2=
3 =C2=B1 20%  perf-profile.children.cycles-pp.irq_work_run_list
      0.02 =C2=B1141%      +0.0        0.03 =C2=B1 87%      -0.0        0.0=
0        perf-profile.children.cycles-pp.balance_dirty_pages_ratelimited
      0.14 =C2=B1 33%      +0.0        0.16 =C2=B1 35%      +0.0        0.1=
5 =C2=B1 34%  perf-profile.children.cycles-pp.perf_session__write_header
      0.16 =C2=B1  9%      +0.0        0.18 =C2=B1 10%      -0.0        0.1=
5 =C2=B1 10%  perf-profile.children.cycles-pp.rcu_dynticks_task_exit
      0.15 =C2=B1 12%      +0.0        0.16 =C2=B1  9%      +0.0        0.1=
6 =C2=B1 20%  perf-profile.children.cycles-pp.vprintk_emit
      0.15 =C2=B1 12%      +0.0        0.16 =C2=B1  9%      +0.0        0.1=
6 =C2=B1 20%  perf-profile.children.cycles-pp.console_unlock
      0.00            +0.0        0.01 =C2=B1158%      +0.0        0.02 =C2=
=B1116%  perf-profile.children.cycles-pp.update_iter
      0.00            +0.0        0.01 =C2=B1158%      +0.0        0.02 =C2=
=B1116%  perf-profile.children.cycles-pp.wait_for_completion
      0.00            +0.0        0.01 =C2=B1158%      +0.0        0.02 =C2=
=B1116%  perf-profile.children.cycles-pp.s_next
      0.07 =C2=B1 54%      +0.0        0.08 =C2=B1 35%      +0.0        0.0=
8 =C2=B1 32%  perf-profile.children.cycles-pp.sysfs__read_int
      0.01 =C2=B1223%      +0.0        0.02 =C2=B1116%      -0.0        0.0=
0        perf-profile.children.cycles-pp.try_charge
      0.01 =C2=B1223%      +0.0        0.02 =C2=B1116%      +0.0        0.0=
2 =C2=B1161%  perf-profile.children.cycles-pp.schedule_timeout
      0.01 =C2=B1223%      +0.0        0.02 =C2=B1116%      +0.0        0.0=
2 =C2=B1118%  perf-profile.children.cycles-pp.__intel_pmu_disable_all
      0.09 =C2=B1 28%      +0.0        0.10 =C2=B1 37%      -0.0        0.0=
8 =C2=B1 34%  perf-profile.children.cycles-pp.__fget_light
      0.12 =C2=B1 33%      +0.0        0.13 =C2=B1 35%      +0.0        0.1=
3 =C2=B1 31%  perf-profile.children.cycles-pp.write_cache
      0.04 =C2=B1100%      +0.0        0.05 =C2=B1 44%      -0.0        0.0=
2 =C2=B1161%  perf-profile.children.cycles-pp.aim_rand
      0.10 =C2=B1 32%      +0.0        0.12 =C2=B1 30%      +0.0        0.1=
1 =C2=B1 31%  perf-profile.children.cycles-pp.cpu_cache_level__read
      0.11 =C2=B1 27%      +0.0        0.13 =C2=B1 34%      +0.0        0.1=
1 =C2=B1 23%  perf-profile.children.cycles-pp.rcu_gp_kthread
      0.22 =C2=B1 10%      +0.0        0.24 =C2=B1 10%      +0.0        0.2=
7 =C2=B1 23%  perf-profile.children.cycles-pp.dispatch_events
      0.22 =C2=B1 10%      +0.0        0.24 =C2=B1 10%      +0.0        0.2=
7 =C2=B1 23%  perf-profile.children.cycles-pp.process_interval
      0.14 =C2=B1  9%      +0.0        0.16 =C2=B1 13%      +0.0        0.1=
7 =C2=B1 32%  perf-profile.children.cycles-pp.new_sync_read
      0.00            +0.0        0.02 =C2=B1159%      +0.0        0.02 =C2=
=B1159%  perf-profile.children.cycles-pp.__do_set_cpus_allowed
      0.11 =C2=B1 12%      +0.0        0.12 =C2=B1 14%      +0.0        0.1=
3 =C2=B1 31%  perf-profile.children.cycles-pp.update_rt_rq_load_avg
      1.94 =C2=B1  7%      +0.0        1.95 =C2=B1  3%      -0.1        1.8=
6 =C2=B1 12%  perf-profile.children.cycles-pp.get_next_timer_interrupt
      0.05 =C2=B1 77%      +0.0        0.06 =C2=B1 29%      +0.0        0.0=
6 =C2=B1 47%  perf-profile.children.cycles-pp.rb_free
      0.19 =C2=B1 23%      +0.0        0.21 =C2=B1 16%      -0.0        0.1=
9 =C2=B1 26%  perf-profile.children.cycles-pp.___might_sleep
      0.95 =C2=B1  4%      +0.0        0.97 =C2=B1  6%      +0.1        1.0=
4 =C2=B1 22%  perf-profile.children.cycles-pp.timerqueue_del
      0.10 =C2=B1  6%      +0.0        0.12 =C2=B1 13%      +0.0        0.1=
3 =C2=B1 18%  perf-profile.children.cycles-pp.__set_cpus_allowed_ptr
      0.22 =C2=B1 10%      +0.0        0.24 =C2=B1 10%      +0.0        0.2=
7 =C2=B1 23%  perf-profile.children.cycles-pp.cmd_stat
      0.15 =C2=B1 25%      +0.0        0.17 =C2=B1 13%      +0.0        0.1=
8 =C2=B1 27%  perf-profile.children.cycles-pp.io_serial_in
      0.22 =C2=B1 10%      +0.0        0.24 =C2=B1 10%      +0.0        0.2=
7 =C2=B1 22%  perf-profile.children.cycles-pp.read_counters
      0.38 =C2=B1 44%      +0.0        0.40 =C2=B1 21%      +0.0        0.4=
2 =C2=B1 29%  perf-profile.children.cycles-pp.timekeeping_max_deferment
      0.05 =C2=B1 51%      +0.0        0.07 =C2=B1 29%      -0.0        0.0=
4 =C2=B1 67%  perf-profile.children.cycles-pp.dyntick_save_progress_counter
      0.08 =C2=B1 29%      +0.0        0.10 =C2=B1 32%      +0.0        0.1=
0 =C2=B1 32%  perf-profile.children.cycles-pp.__open64
      0.00            +0.0        0.02 =C2=B1158%      +0.0        0.01 =C2=
=B1244%  perf-profile.children.cycles-pp.memcpy_erms
      0.11 =C2=B1 31%      +0.0        0.13 =C2=B1 37%      +0.0        0.1=
1 =C2=B1 25%  perf-profile.children.cycles-pp.__fdget_pos
      1.65 =C2=B1  3%      +0.0        1.67 =C2=B1  7%      -0.1        1.5=
7 =C2=B1 11%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.10 =C2=B1 17%      +0.0        0.12 =C2=B1 16%      +0.0        0.1=
1 =C2=B1 21%  perf-profile.children.cycles-pp.serial8250_console_putchar
      0.11 =C2=B1 12%      +0.0        0.13 =C2=B1 11%      +0.0        0.1=
2 =C2=B1 21%  perf-profile.children.cycles-pp.serial8250_console_write
      0.37 =C2=B1  2%      +0.0        0.39 =C2=B1  6%      +0.0        0.3=
7 =C2=B1 11%  perf-profile.children.cycles-pp.menu_reflect
      0.15 =C2=B1  7%      +0.0        0.17 =C2=B1  9%      +0.0        0.1=
8 =C2=B1 25%  perf-profile.children.cycles-pp.irq_work_tick
      0.10 =C2=B1 11%      +0.0        0.13 =C2=B1 16%      +0.0        0.1=
2 =C2=B1 20%  perf-profile.children.cycles-pp.uart_console_write
      0.22 =C2=B1 28%      +0.0        0.25 =C2=B1 34%      -0.0        0.2=
0 =C2=B1 30%  perf-profile.children.cycles-pp.raise_softirq
      0.31 =C2=B1 33%      +0.0        0.34 =C2=B1 23%      -0.0        0.2=
7 =C2=B1 22%  perf-profile.children.cycles-pp.shmem_write_end
      0.02 =C2=B1142%      +0.0        0.04 =C2=B1 64%      +0.0        0.0=
4 =C2=B1 89%  perf-profile.children.cycles-pp.lookup_fast
      0.12 =C2=B1 10%      +0.0        0.14 =C2=B1 12%      +0.0        0.1=
5 =C2=B1 19%  perf-profile.children.cycles-pp.__x64_sys_sched_setaffinity
      0.15 =C2=B1  4%      +0.0        0.17 =C2=B1  7%      +0.0        0.1=
6 =C2=B1 15%  perf-profile.children.cycles-pp.tick_nohz_idle_got_tick
      0.95 =C2=B1 17%      +0.0        0.97 =C2=B1 24%      +0.1        1.0=
4 =C2=B1 22%  perf-profile.children.cycles-pp.__libc_start_main
      0.95 =C2=B1 17%      +0.0        0.97 =C2=B1 24%      +0.1        1.0=
4 =C2=B1 22%  perf-profile.children.cycles-pp.main
      0.95 =C2=B1 17%      +0.0        0.97 =C2=B1 24%      +0.1        1.0=
4 =C2=B1 22%  perf-profile.children.cycles-pp.run_builtin
      0.04 =C2=B1101%      +0.0        0.06 =C2=B1 16%      +0.0        0.0=
4 =C2=B1 90%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.11 =C2=B1 18%      +0.0        0.13 =C2=B1 12%      +0.0        0.1=
2 =C2=B1 20%  perf-profile.children.cycles-pp.wait_for_xmitr
      0.05 =C2=B1 76%      +0.0        0.08 =C2=B1 23%      -0.0        0.0=
5 =C2=B1 67%  perf-profile.children.cycles-pp.generic_write_checks
      0.20 =C2=B1  5%      +0.0        0.23 =C2=B1  9%      +0.0        0.2=
5 =C2=B1 24%  perf-profile.children.cycles-pp.rb_erase
      0.13 =C2=B1 29%      +0.0        0.16 =C2=B1 17%      +0.1        0.1=
9 =C2=B1 17%  perf-profile.children.cycles-pp.process_one_work
      0.15 =C2=B1 24%      +0.0        0.18 =C2=B1 16%      +0.1        0.2=
2 =C2=B1 15%  perf-profile.children.cycles-pp.worker_thread
      0.43 =C2=B1  4%      +0.0        0.46 =C2=B1  4%      +0.0        0.4=
3 =C2=B1  2%  perf-profile.children.cycles-pp.tick_program_event
      0.09 =C2=B1 61%      +0.0        0.12 =C2=B1 24%      +0.0        0.1=
1 =C2=B1 27%  perf-profile.children.cycles-pp.memcpy_toio
      0.47 =C2=B1 10%      +0.0        0.50 =C2=B1 12%      -0.0        0.4=
6 =C2=B1  6%  perf-profile.children.cycles-pp.tick_check_oneshot_broadcast_=
this_cpu
      0.09 =C2=B1 61%      +0.0        0.12 =C2=B1 22%      +0.0        0.1=
1 =C2=B1 27%  perf-profile.children.cycles-pp.drm_fb_memcpy_dstclip
      0.60 =C2=B1 28%      +0.0        0.64 =C2=B1 25%      +0.0        0.6=
0 =C2=B1 29%  perf-profile.children.cycles-pp.llseek
      5.78 =C2=B1  4%      +0.0        5.82 =C2=B1  3%      -0.2        5.6=
0 =C2=B1  8%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.11 =C2=B1 54%      +0.0        0.14 =C2=B1 20%      +0.1        0.1=
7 =C2=B1 23%  perf-profile.children.cycles-pp.drm_fb_helper_damage_work
      0.09 =C2=B1 60%      +0.0        0.13 =C2=B1 22%      +0.0        0.1=
3 =C2=B1 19%  perf-profile.children.cycles-pp.mgag200_handle_damage
      0.09 =C2=B1 60%      +0.0        0.13 =C2=B1 22%      +0.0        0.1=
3 =C2=B1 21%  perf-profile.children.cycles-pp.mgag200_simple_display_pipe_u=
pdate
      0.09 =C2=B1 60%      +0.0        0.13 =C2=B1 22%      +0.0        0.1=
4 =C2=B1 20%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_plan=
es
      1.75 =C2=B1  6%      +0.0        1.79 =C2=B1  9%      +0.2        1.9=
0 =C2=B1 14%  perf-profile.children.cycles-pp.update_rq_clock
      0.09 =C2=B1 60%      +0.0        0.13 =C2=B1 20%      +0.0        0.1=
4 =C2=B1 20%  perf-profile.children.cycles-pp.drm_atomic_helper_commit
      0.09 =C2=B1 60%      +0.0        0.13 =C2=B1 20%      +0.0        0.1=
4 =C2=B1 20%  perf-profile.children.cycles-pp.commit_tail
      0.09 =C2=B1 60%      +0.0        0.13 =C2=B1 20%      +0.0        0.1=
4 =C2=B1 20%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_tail
      0.59 =C2=B1 11%      +0.0        0.63 =C2=B1 10%      +0.1        0.6=
9 =C2=B1  9%  perf-profile.children.cycles-pp.kthread
      0.60 =C2=B1 12%      +0.0        0.64 =C2=B1  9%      +0.1        0.7=
0 =C2=B1  9%  perf-profile.children.cycles-pp.ret_from_fork
      0.25 =C2=B1 12%      +0.0        0.29 =C2=B1 12%      +0.1        0.3=
1 =C2=B1 19%  perf-profile.children.cycles-pp.sched_setaffinity
      0.09 =C2=B1 60%      +0.0        0.13 =C2=B1 19%      +0.0        0.1=
4 =C2=B1 21%  perf-profile.children.cycles-pp.drm_atomic_helper_dirtyfb
      0.62 =C2=B1  4%      +0.0        0.66 =C2=B1 12%      +0.1        0.7=
2 =C2=B1 24%  perf-profile.children.cycles-pp.update_blocked_averages
      0.05 =C2=B1  9%      +0.0        0.10 =C2=B1 17%      +0.0        0.0=
6 =C2=B1  7%  perf-profile.children.cycles-pp.cpuidle_get_cpu_driver
      0.72 =C2=B1  4%      +0.0        0.76 =C2=B1 11%      +0.1        0.8=
3 =C2=B1 21%  perf-profile.children.cycles-pp.run_rebalance_domains
      0.05 =C2=B1  7%      +0.0        0.10 =C2=B1 14%      +0.0        0.0=
5 =C2=B1 42%  perf-profile.children.cycles-pp.rcu_irq_exit
      1.58 =C2=B1  9%      +0.1        1.63 =C2=B1 10%      +0.0        1.6=
0 =C2=B1  5%  perf-profile.children.cycles-pp._raw_spin_lock
      2.64 =C2=B1 10%      +0.1        2.70 =C2=B1  6%      -0.1        2.5=
8 =C2=B1 13%  perf-profile.children.cycles-pp.irqtime_account_irq
      1.14 =C2=B1  6%      +0.1        1.20 =C2=B1  9%      +0.1        1.2=
2 =C2=B1 19%  perf-profile.children.cycles-pp.find_busiest_group
      0.23 =C2=B1 11%      +0.1        0.30 =C2=B1  8%      +0.0        0.2=
5 =C2=B1 22%  perf-profile.children.cycles-pp.cpumask_next_and
      1.06 =C2=B1  7%      +0.1        1.13 =C2=B1  8%      +0.1        1.1=
5 =C2=B1 18%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.64 =C2=B1  7%      +0.1        0.71 =C2=B1  4%      +0.0        0.6=
5 =C2=B1  7%  perf-profile.children.cycles-pp.hrtimer_get_next_event
      0.34 =C2=B1  5%      +0.1        0.41 =C2=B1  7%      +0.1        0.4=
3 =C2=B1 31%  perf-profile.children.cycles-pp.rb_insert_color
      1.07 =C2=B1 11%      +0.1        1.15 =C2=B1  7%      -0.1        0.9=
9 =C2=B1 10%  perf-profile.children.cycles-pp.tick_nohz_irq_exit
      1.10 =C2=B1  6%      +0.1        1.18 =C2=B1  7%      +0.3        1.3=
8 =C2=B1 46%  perf-profile.children.cycles-pp.enqueue_hrtimer
      0.91 =C2=B1  7%      +0.1        1.00 =C2=B1  7%      +0.3        1.1=
8 =C2=B1 51%  perf-profile.children.cycles-pp.timerqueue_add
      0.64 =C2=B1 11%      +0.1        0.73 =C2=B1 25%      +0.0        0.6=
4 =C2=B1 13%  perf-profile.children.cycles-pp._raw_spin_lock_irq
     90.32 =C2=B1  2%      +0.1       90.41            +0.4       90.72    =
    perf-profile.children.cycles-pp.secondary_startup_64_no_verify
     90.32 =C2=B1  2%      +0.1       90.41            +0.4       90.72    =
    perf-profile.children.cycles-pp.cpu_startup_entry
     90.32 =C2=B1  2%      +0.1       90.41            +0.4       90.72    =
    perf-profile.children.cycles-pp.do_idle
      4.79 =C2=B1  7%      +0.1        4.88 =C2=B1  7%      +0.7        5.5=
3 =C2=B1 23%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      1.49 =C2=B1  6%      +0.1        1.58 =C2=B1  8%      +0.1        1.5=
8 =C2=B1 20%  perf-profile.children.cycles-pp.load_balance
     23.10 =C2=B1  2%      +0.1       23.20 =C2=B1  4%      +1.0       24.1=
1 =C2=B1 12%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.40 =C2=B1  7%      +0.1        0.49 =C2=B1 13%      +0.0        0.4=
5 =C2=B1 26%  perf-profile.children.cycles-pp.hrtimer_forward
      1.51 =C2=B1  6%      +0.1        1.61 =C2=B1  8%      +0.1        1.6=
3 =C2=B1 22%  perf-profile.children.cycles-pp.rebalance_domains
     90.07 =C2=B1  2%      +0.1       90.16            +0.3       90.41    =
    perf-profile.children.cycles-pp.start_secondary
      0.35 =C2=B1  8%      +0.1        0.45 =C2=B1  6%      +0.1        0.4=
0 =C2=B1  3%  perf-profile.children.cycles-pp.get_cpu_device
      0.54 =C2=B1  9%      +0.1        0.65 =C2=B1 11%      -0.0        0.5=
1 =C2=B1 13%  perf-profile.children.cycles-pp.rcu_core
      0.74 =C2=B1  7%      +0.1        0.85 =C2=B1  6%      +0.1        0.8=
0 =C2=B1  5%  perf-profile.children.cycles-pp.cpuidle_governor_latency_req
      0.47 =C2=B1  6%      +0.1        0.59 =C2=B1  4%      -0.0        0.4=
7 =C2=B1  7%  perf-profile.children.cycles-pp.tick_check_broadcast_expired
      3.62 =C2=B1  4%      +0.1        3.76 =C2=B1  2%      -0.1        3.5=
3 =C2=B1 10%  perf-profile.children.cycles-pp.tick_nohz_next_event
      0.86 =C2=B1 19%      +0.2        1.05 =C2=B1 42%      -0.1        0.7=
8 =C2=B1 29%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      3.48 =C2=B1  4%      +0.3        3.75 =C2=B1  8%      +0.2        3.7=
0 =C2=B1 17%  perf-profile.children.cycles-pp.__softirqentry_text_start
      3.68 =C2=B1 14%      +0.3        3.99 =C2=B1 15%      -0.0        3.6=
4 =C2=B1 16%  perf-profile.children.cycles-pp.native_sched_clock
      5.93 =C2=B1  5%      +0.3        6.25 =C2=B1  6%      +0.0        5.9=
5 =C2=B1  7%  perf-profile.children.cycles-pp.irq_exit_rcu
      3.79 =C2=B1 14%      +0.3        4.10 =C2=B1 15%      -0.0        3.7=
5 =C2=B1 16%  perf-profile.children.cycles-pp.sched_clock
      4.25 =C2=B1 13%      +0.3        4.58 =C2=B1 13%      -0.0        4.2=
2 =C2=B1 14%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.00            +0.6        0.56 =C2=B1244%      +0.0        0.00    =
    perf-profile.children.cycles-pp.poll_idle
     10.41 =C2=B1  6%      +1.3       11.68 =C2=B1  6%      +0.7       11.1=
1 =C2=B1 13%  perf-profile.children.cycles-pp.menu_select
      6.24 =C2=B1  7%      -0.8        5.47 =C2=B1 17%      -0.1        6.1=
6 =C2=B1 10%  perf-profile.self.cycles-pp.rcu_eqs_exit
     13.24 =C2=B1  2%      -0.5       12.76 =C2=B1  6%      -0.2       13.0=
1 =C2=B1  6%  perf-profile.self.cycles-pp.intel_idle
      3.23 =C2=B1  8%      -0.3        2.92 =C2=B1 19%      -0.1        3.1=
2 =C2=B1 14%  perf-profile.self.cycles-pp.rcu_nmi_enter
      0.95 =C2=B1 22%      -0.2        0.78 =C2=B1 15%      -0.2        0.7=
6 =C2=B1 24%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      2.41 =C2=B1  3%      -0.1        2.27 =C2=B1  7%      +0.0        2.4=
4 =C2=B1  7%  perf-profile.self.cycles-pp.cpuidle_enter_state
      2.49 =C2=B1  8%      -0.1        2.35 =C2=B1 10%      -0.0        2.4=
7 =C2=B1 23%  perf-profile.self.cycles-pp.__hrtimer_run_queues
      1.09 =C2=B1 50%      -0.1        0.95 =C2=B1 31%      +0.1        1.1=
6 =C2=B1 26%  perf-profile.self.cycles-pp.x86_pmu_disable
      1.57 =C2=B1 19%      -0.1        1.46 =C2=B1 13%      -0.1        1.4=
5 =C2=B1  8%  perf-profile.self.cycles-pp.scheduler_tick
      0.64 =C2=B1 21%      -0.1        0.54 =C2=B1 25%      -0.0        0.6=
3 =C2=B1 29%  perf-profile.self.cycles-pp.rcu_nmi_exit
      2.57 =C2=B1  8%      -0.1        2.47 =C2=B1 21%      -0.1        2.5=
0 =C2=B1 23%  perf-profile.self.cycles-pp.rcu_sched_clock_irq
      0.80 =C2=B1  6%      -0.1        0.73 =C2=B1  9%      -0.0        0.7=
7 =C2=B1 10%  perf-profile.self.cycles-pp.__sysvec_apic_timer_interrupt
      1.23 =C2=B1  5%      -0.1        1.18 =C2=B1  4%      -0.1        1.1=
7 =C2=B1  3%  perf-profile.self.cycles-pp.read_tsc
      1.06 =C2=B1  5%      -0.1        1.00 =C2=B1  5%      -0.0        1.0=
4 =C2=B1  5%  perf-profile.self.cycles-pp.do_idle
      1.35 =C2=B1  7%      -0.1        1.30            -0.0        1.31 =C2=
=B1  4%  perf-profile.self.cycles-pp.hrtimer_interrupt
      0.96 =C2=B1  7%      -0.1        0.91 =C2=B1 17%      +0.0        0.9=
9 =C2=B1 16%  perf-profile.self.cycles-pp.rcu_dynticks_eqs_exit
      0.65 =C2=B1  5%      -0.1        0.60 =C2=B1 11%      -0.0        0.6=
1 =C2=B1  7%  perf-profile.self.cycles-pp.tick_irq_enter
      0.60 =C2=B1  6%      -0.0        0.55 =C2=B1  7%      +0.0        0.6=
3 =C2=B1 15%  perf-profile.self.cycles-pp.perf_event_task_tick
      0.45 =C2=B1  5%      -0.0        0.41 =C2=B1  6%      -0.0        0.4=
2 =C2=B1 10%  perf-profile.self.cycles-pp.get_next_timer_interrupt
      0.55 =C2=B1  4%      -0.0        0.50 =C2=B1 10%      -0.0        0.5=
2 =C2=B1  8%  perf-profile.self.cycles-pp.nr_iowait_cpu
      0.34 =C2=B1 14%      -0.0        0.30 =C2=B1  6%      -0.0        0.3=
4 =C2=B1  9%  perf-profile.self.cycles-pp.rcu_eqs_enter
      0.38 =C2=B1  5%      -0.0        0.35 =C2=B1  9%      -0.0        0.3=
6 =C2=B1  8%  perf-profile.self.cycles-pp.tsc_verify_tsc_adjust
      0.73 =C2=B1  9%      -0.0        0.69 =C2=B1 10%      -0.1        0.6=
4 =C2=B1 15%  perf-profile.self.cycles-pp.rb_next
      0.27 =C2=B1 29%      -0.0        0.24 =C2=B1 29%      -0.1        0.2=
1 =C2=B1 27%  perf-profile.self.cycles-pp.write
      0.26 =C2=B1  8%      -0.0        0.22 =C2=B1  9%      -0.0        0.2=
2 =C2=B1 10%  perf-profile.self.cycles-pp.tick_nohz_irq_exit
      0.66 =C2=B1  5%      -0.0        0.62 =C2=B1  5%      -0.0        0.6=
2 =C2=B1  7%  perf-profile.self.cycles-pp.sysvec_apic_timer_interrupt
      1.05 =C2=B1  5%      -0.0        1.02 =C2=B1  6%      +0.0        1.0=
7 =C2=B1  8%  perf-profile.self.cycles-pp.irqtime_account_irq
      0.32 =C2=B1  9%      -0.0        0.29 =C2=B1 16%      -0.0        0.3=
0 =C2=B1 23%  perf-profile.self.cycles-pp.rcu_needs_cpu
      0.51 =C2=B1  8%      -0.0        0.48 =C2=B1  4%      -0.0        0.4=
7 =C2=B1  6%  perf-profile.self.cycles-pp.idle_cpu
      0.06 =C2=B1  9%      -0.0        0.03 =C2=B1 87%      -0.0        0.0=
5 =C2=B1 41%  perf-profile.self.cycles-pp.timerqueue_iterate_next
      0.67 =C2=B1  4%      -0.0        0.64 =C2=B1  3%      -0.0        0.6=
4 =C2=B1  4%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.82 =C2=B1  4%      -0.0        0.79 =C2=B1  6%      -0.0        0.8=
0 =C2=B1  7%  perf-profile.self.cycles-pp.lapic_next_deadline
      0.22 =C2=B1 31%      -0.0        0.19 =C2=B1 21%      -0.0        0.2=
1 =C2=B1 23%  perf-profile.self.cycles-pp.copy_user_enhanced_fast_string
      0.03 =C2=B1 99%      -0.0        0.00            -0.0        0.01 =C2=
=B1244%  perf-profile.self.cycles-pp.rw_verify_area
      0.35 =C2=B1 10%      -0.0        0.33 =C2=B1 10%      +0.1        0.4=
0 =C2=B1 26%  perf-profile.self.cycles-pp.__intel_pmu_enable_all
      0.12 =C2=B1 24%      -0.0        0.09 =C2=B1 27%      -0.0        0.1=
0 =C2=B1 34%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.19 =C2=B1 13%      -0.0        0.17 =C2=B1 14%      -0.0        0.1=
8 =C2=B1  5%  perf-profile.self.cycles-pp.sched_idle_set_state
      0.21 =C2=B1  4%      -0.0        0.19 =C2=B1  8%      +0.0        0.2=
1 =C2=B1 10%  perf-profile.self.cycles-pp.hrtimer_next_event_without
      0.40 =C2=B1 10%      -0.0        0.38 =C2=B1 14%      +0.0        0.4=
3 =C2=B1 29%  perf-profile.self.cycles-pp.timerqueue_del
      0.35 =C2=B1  3%      -0.0        0.33 =C2=B1  7%      -0.0        0.3=
0 =C2=B1  8%  perf-profile.self.cycles-pp.clockevents_program_event
      0.49 =C2=B1  5%      -0.0        0.47 =C2=B1  7%      +0.0        0.5=
0 =C2=B1 20%  perf-profile.self.cycles-pp.irqtime_account_process_tick
      0.07 =C2=B1 11%      -0.0        0.05 =C2=B1 40%      -0.0        0.0=
7 =C2=B1 42%  perf-profile.self.cycles-pp.__note_gp_changes
      0.02 =C2=B1142%      -0.0        0.00            -0.0        0.00    =
    perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.12 =C2=B1 15%      -0.0        0.10 =C2=B1  6%      -0.0        0.1=
1 =C2=B1  9%  perf-profile.self.cycles-pp.local_touch_nmi
      0.44 =C2=B1  5%      -0.0        0.42 =C2=B1  7%      -0.0        0.4=
0 =C2=B1 10%  perf-profile.self.cycles-pp.tick_nohz_get_sleep_length
      0.30 =C2=B1 30%      -0.0        0.29 =C2=B1 23%      -0.0        0.2=
8 =C2=B1 29%  perf-profile.self.cycles-pp.__entry_text_start
      0.23 =C2=B1  6%      -0.0        0.21 =C2=B1 12%      -0.0        0.2=
1 =C2=B1 10%  perf-profile.self.cycles-pp.irq_work_needs_cpu
      0.13 =C2=B1 26%      -0.0        0.11 =C2=B1 30%      -0.0        0.1=
2 =C2=B1 29%  perf-profile.self.cycles-pp.iov_iter_copy_from_user_atomic
      0.02 =C2=B1141%      -0.0        0.00            -0.0        0.00    =
    perf-profile.self.cycles-pp.unlock_page
      0.56 =C2=B1  5%      -0.0        0.55 =C2=B1 10%      -0.0        0.5=
6 =C2=B1  7%  perf-profile.self.cycles-pp.native_apic_msr_eoi_write
      0.06 =C2=B1 23%      -0.0        0.05 =C2=B1 66%      -0.0        0.0=
6 =C2=B1 47%  perf-profile.self.cycles-pp.new_sync_write
      0.44 =C2=B1  4%      -0.0        0.42 =C2=B1  3%      +0.0        0.4=
4 =C2=B1  5%  perf-profile.self.cycles-pp.__x86_retpoline_rax
      0.35 =C2=B1  5%      -0.0        0.34 =C2=B1  8%      -0.0        0.3=
4 =C2=B1  5%  perf-profile.self.cycles-pp.sched_clock
      0.28 =C2=B1  5%      -0.0        0.26 =C2=B1  6%      -0.0        0.2=
8 =C2=B1  3%  perf-profile.self.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.21 =C2=B1  2%      -0.0        0.19 =C2=B1  5%      +0.0        0.2=
1 =C2=B1  8%  perf-profile.self.cycles-pp.menu_reflect
      0.12 =C2=B1 27%      -0.0        0.10 =C2=B1 22%      -0.0        0.0=
8 =C2=B1 27%  perf-profile.self.cycles-pp.generic_perform_write
      0.09 =C2=B1 14%      -0.0        0.08 =C2=B1 12%      -0.0        0.0=
9 =C2=B1 22%  perf-profile.self.cycles-pp.hrtimer_run_queues
      0.17 =C2=B1 11%      -0.0        0.16 =C2=B1 19%      -0.0        0.1=
6 =C2=B1 23%  perf-profile.self.cycles-pp.rcu_is_cpu_rrupt_from_idle
      0.46 =C2=B1  3%      -0.0        0.45 =C2=B1  6%      -0.0        0.4=
5 =C2=B1  8%  perf-profile.self.cycles-pp.__x86_indirect_thunk_rax
      0.11 =C2=B1 29%      -0.0        0.10 =C2=B1 26%      -0.0        0.0=
8 =C2=B1 25%  perf-profile.self.cycles-pp.__generic_file_write_iter
      0.24 =C2=B1 34%      -0.0        0.23 =C2=B1 25%      -0.0        0.2=
2 =C2=B1 28%  perf-profile.self.cycles-pp.pagecache_get_page
      0.03 =C2=B1100%      -0.0        0.02 =C2=B1159%      -0.0        0.0=
1 =C2=B1244%  perf-profile.self.cycles-pp.xas_start
      0.07 =C2=B1 16%      -0.0        0.06 =C2=B1 44%      +0.0        0.0=
7 =C2=B1 25%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.02 =C2=B1142%      -0.0        0.01 =C2=B1244%      -0.0        0.0=
2 =C2=B1159%  perf-profile.self.cycles-pp.shmem_write_begin
      0.36 =C2=B1  5%      -0.0        0.35 =C2=B1  6%      +0.0        0.3=
6 =C2=B1  8%  perf-profile.self.cycles-pp.__remove_hrtimer
      0.13 =C2=B1  9%      -0.0        0.12 =C2=B1 11%      +0.0        0.1=
3 =C2=B1 10%  perf-profile.self.cycles-pp.restore_regs_and_return_to_kernel
      0.02 =C2=B1141%      -0.0        0.01 =C2=B1244%      -0.0        0.0=
0        perf-profile.self.cycles-pp.__alloc_pages_nodemask
      0.02 =C2=B1141%      -0.0        0.01 =C2=B1244%      -0.0        0.0=
0        perf-profile.self.cycles-pp.find_lock_entries
      0.27 =C2=B1  6%      -0.0        0.26 =C2=B1  6%      +0.0        0.2=
7 =C2=B1  3%  perf-profile.self.cycles-pp.rcu_idle_exit
      0.04 =C2=B1 71%      -0.0        0.03 =C2=B1115%      +0.0        0.0=
4 =C2=B1 66%  perf-profile.self.cycles-pp.perf_pmu_disable
      0.01 =C2=B1223%      -0.0        0.00            -0.0        0.00    =
    perf-profile.self.cycles-pp.file_update_time
      0.01 =C2=B1223%      -0.0        0.00            -0.0        0.00    =
    perf-profile.self.cycles-pp.xas_store
      0.01 =C2=B1223%      -0.0        0.00            -0.0        0.00    =
    perf-profile.self.cycles-pp.account_system_index_time
      0.01 =C2=B1223%      -0.0        0.00            -0.0        0.00    =
    perf-profile.self.cycles-pp.shmem_add_to_page_cache
      0.01 =C2=B1223%      -0.0        0.00            -0.0        0.00    =
    perf-profile.self.cycles-pp.mem_cgroup_charge
      0.01 =C2=B1223%      -0.0        0.00            -0.0        0.00    =
    perf-profile.self.cycles-pp.set_page_dirty
      0.01 =C2=B1223%      -0.0        0.00            -0.0        0.01 =C2=
=B1244%  perf-profile.self.cycles-pp.rcu_dynticks_task_enter
      0.07 =C2=B1 14%      -0.0        0.06 =C2=B1 12%      +0.0        0.0=
7 =C2=B1 35%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.19 =C2=B1 36%      -0.0        0.19 =C2=B1 19%      -0.0        0.1=
7 =C2=B1 30%  perf-profile.self.cycles-pp.vfs_write
      0.03 =C2=B1100%      -0.0        0.02 =C2=B1116%      -0.0        0.0=
2 =C2=B1116%  perf-profile.self.cycles-pp.cpu_latency_qos_limit
      0.02 =C2=B1142%      -0.0        0.01 =C2=B1158%      +0.0        0.0=
2 =C2=B1116%  perf-profile.self.cycles-pp.do_syscall_64
      0.04 =C2=B1 72%      -0.0        0.03 =C2=B1 89%      +0.0        0.0=
5 =C2=B1 56%  perf-profile.self.cycles-pp.__x86_retpoline_rbx
      0.15 =C2=B1 28%      -0.0        0.14 =C2=B1 21%      -0.0        0.1=
2 =C2=B1 29%  perf-profile.self.cycles-pp.sync_disk_rw
      0.18 =C2=B1 12%      -0.0        0.18 =C2=B1 10%      -0.0        0.1=
7 =C2=B1  9%  perf-profile.self.cycles-pp.hrtimer_update_next_event
      0.18 =C2=B1  8%      -0.0        0.17 =C2=B1 14%      +0.0        0.1=
8 =C2=B1 12%  perf-profile.self.cycles-pp.sched_clock_idle_wakeup_event
      0.19 =C2=B1  9%      -0.0        0.19 =C2=B1  9%      +0.0        0.2=
2 =C2=B1 14%  perf-profile.self.cycles-pp.rcu_segcblist_ready_cbs
      0.09 =C2=B1  5%      -0.0        0.08 =C2=B1 12%      -0.0        0.0=
8 =C2=B1 16%  perf-profile.self.cycles-pp.cpuidle_reflect
      0.04 =C2=B1 45%      -0.0        0.04 =C2=B1 64%      +0.0        0.0=
5 =C2=B1 49%  perf-profile.self.cycles-pp.run_rebalance_domains
      0.24 =C2=B1  9%      -0.0        0.24 =C2=B1  4%      +0.0        0.2=
5 =C2=B1 10%  perf-profile.self.cycles-pp.rcu_nocb_flush_deferred_wakeup
      0.23 =C2=B1 17%      -0.0        0.23 =C2=B1  8%      -0.0        0.2=
3 =C2=B1 10%  perf-profile.self.cycles-pp.trigger_load_balance
      0.21 =C2=B1 10%      -0.0        0.21 =C2=B1  8%      -0.0        0.2=
1 =C2=B1  7%  perf-profile.self.cycles-pp.can_stop_idle_tick
      0.04 =C2=B1100%      -0.0        0.04 =C2=B1 87%      -0.0        0.0=
2 =C2=B1116%  perf-profile.self.cycles-pp.mark_page_accessed
      0.13 =C2=B1 16%      -0.0        0.12 =C2=B1  8%      +0.0        0.1=
3 =C2=B1 23%  perf-profile.self.cycles-pp.profile_tick
      0.17 =C2=B1  8%      -0.0        0.16 =C2=B1 13%      +0.0        0.1=
8 =C2=B1 27%  perf-profile.self.cycles-pp._find_next_bit
      0.18 =C2=B1  6%      -0.0        0.18 =C2=B1 10%      +0.0        0.1=
9 =C2=B1 18%  perf-profile.self.cycles-pp.enqueue_hrtimer
      0.01 =C2=B1223%      -0.0        0.01 =C2=B1244%      -0.0        0.0=
1 =C2=B1244%  perf-profile.self.cycles-pp.__set_page_dirty_no_writeback
      0.10 =C2=B1 28%      -0.0        0.10 =C2=B1 27%      -0.0        0.0=
9 =C2=B1 28%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.10 =C2=B1 25%      -0.0        0.09 =C2=B1 33%      -0.0        0.0=
8 =C2=B1 38%  perf-profile.self.cycles-pp.common_file_perm
      0.02 =C2=B1141%      -0.0        0.01 =C2=B1158%      -0.0        0.0=
1 =C2=B1244%  perf-profile.self.cycles-pp.up_write
      0.11 =C2=B1 34%      -0.0        0.10 =C2=B1 25%      -0.0        0.1=
0 =C2=B1 21%  perf-profile.self.cycles-pp.shmem_getpage_gfp
      0.01 =C2=B1223%      -0.0        0.01 =C2=B1244%      -0.0        0.0=
0        perf-profile.self.cycles-pp.timestamp_truncate
      0.01 =C2=B1223%      -0.0        0.01 =C2=B1244%      -0.0        0.0=
0        perf-profile.self.cycles-pp.shmem_file_llseek
      0.01 =C2=B1223%      -0.0        0.01 =C2=B1244%      -0.0        0.0=
0        perf-profile.self.cycles-pp.kmem_cache_alloc
      0.01 =C2=B1223%      -0.0        0.01 =C2=B1244%      -0.0        0.0=
0        perf-profile.self.cycles-pp.balance_dirty_pages_ratelimited
      0.01 =C2=B1223%      -0.0        0.01 =C2=B1244%      -0.0        0.0=
1 =C2=B1244%  perf-profile.self.cycles-pp.generic_write_check_limits
      0.38 =C2=B1 11%      -0.0        0.38 =C2=B1  9%      -0.0        0.3=
7 =C2=B1  9%  perf-profile.self.cycles-pp.__softirqentry_text_start
      0.07 =C2=B1 23%      -0.0        0.07 =C2=B1 20%      -0.0        0.0=
6 =C2=B1 51%  perf-profile.self.cycles-pp.__list_del_entry_valid
      0.35 =C2=B1 25%      -0.0        0.35 =C2=B1 21%      -0.0        0.3=
3 =C2=B1 26%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.03 =C2=B1100%      -0.0        0.03 =C2=B1 89%      -0.0        0.0=
2 =C2=B1159%  perf-profile.self.cycles-pp.iov_iter_advance
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.self.cycles-pp.kmem_cache_free
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.self.cycles-pp.format_decode
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.self.cycles-pp.get_mem_cgroup_from_mm
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.self.cycles-pp.vsnprintf
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.self.cycles-pp.release_pages
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.self.cycles-pp.lseek(a)plt
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.self.cycles-pp.orc_find
      0.00            +0.0        0.00            +0.0        0.01 =C2=B124=
4%  perf-profile.self.cycles-pp.__x86_indirect_thunk_rbx
      0.00            +0.0        0.00            +0.0        0.01 =C2=B115=
8%  perf-profile.self.cycles-pp.__msecs_to_jiffies
      0.06 =C2=B1 13%      +0.0        0.06 =C2=B1 47%      -0.0        0.0=
5 =C2=B1 45%  perf-profile.self.cycles-pp.__orc_find
      0.19 =C2=B1  8%      +0.0        0.19 =C2=B1 10%      -0.0        0.1=
8 =C2=B1  7%  perf-profile.self.cycles-pp.cpuidle_governor_latency_req
      0.14 =C2=B1  9%      +0.0        0.14 =C2=B1 10%      -0.0        0.1=
3 =C2=B1 13%  perf-profile.self.cycles-pp.rcu_dynticks_eqs_enter
      0.32 =C2=B1  6%      +0.0        0.32 =C2=B1  8%      +0.0        0.3=
2 =C2=B1  7%  perf-profile.self.cycles-pp.__hrtimer_get_next_event
      0.11 =C2=B1 34%      +0.0        0.11 =C2=B1 27%      -0.0        0.0=
9 =C2=B1 28%  perf-profile.self.cycles-pp.llseek
      0.07 =C2=B1 16%      +0.0        0.07 =C2=B1 20%      -0.0        0.0=
5 =C2=B1 44%  perf-profile.self.cycles-pp.note_gp_changes
      0.07 =C2=B1 11%      +0.0        0.07 =C2=B1 15%      +0.0        0.0=
7 =C2=B1 33%  perf-profile.self.cycles-pp.find_busiest_group
      0.10 =C2=B1  7%      +0.0        0.10 =C2=B1 21%      +0.0        0.1=
1 =C2=B1 25%  perf-profile.self.cycles-pp.ksoftirqd_running
      0.10 =C2=B1 27%      +0.0        0.10 =C2=B1 33%      -0.0        0.0=
9 =C2=B1 29%  perf-profile.self.cycles-pp.xas_load
      0.06 =C2=B1 47%      +0.0        0.06 =C2=B1  8%      -0.0        0.0=
4 =C2=B1 66%  perf-profile.self.cycles-pp.arch_scale_freq_tick
      0.08 =C2=B1 22%      +0.0        0.08 =C2=B1 10%      -0.0        0.0=
8 =C2=B1 26%  perf-profile.self.cycles-pp.unwind_next_frame
      0.07 =C2=B1 24%      +0.0        0.07 =C2=B1 21%      -0.0        0.0=
6 =C2=B1 47%  perf-profile.self.cycles-pp.__might_sleep
      0.33 =C2=B1  7%      +0.0        0.33 =C2=B1 10%      +0.0        0.3=
4 =C2=B1 23%  perf-profile.self.cycles-pp.run_posix_cpu_timers
      0.18 =C2=B1 16%      +0.0        0.18 =C2=B1 12%      +0.0        0.2=
0 =C2=B1 22%  perf-profile.self.cycles-pp.cpuidle_enter
      0.31 =C2=B1  7%      +0.0        0.31 =C2=B1 12%      -0.0        0.3=
1 =C2=B1  7%  perf-profile.self.cycles-pp.update_ts_time_stats
      0.03 =C2=B1100%      +0.0        0.03 =C2=B1 87%      -0.0        0.0=
2 =C2=B1159%  perf-profile.self.cycles-pp.aim_rand
      0.08 =C2=B1 13%      +0.0        0.08 =C2=B1  9%      +0.0        0.0=
9 =C2=B1 17%  perf-profile.self.cycles-pp.irq_work_run_list
      0.09 =C2=B1 10%      +0.0        0.09 =C2=B1  9%      +0.0        0.0=
9 =C2=B1 20%  perf-profile.self.cycles-pp.task_tick_idle
      0.03 =C2=B1100%      +0.0        0.03 =C2=B1 86%      -0.0        0.0=
1 =C2=B1244%  perf-profile.self.cycles-pp.aa_file_perm
      0.12 =C2=B1 16%      +0.0        0.12 =C2=B1 15%      +0.0        0.1=
3 =C2=B1 28%  perf-profile.self.cycles-pp.io_serial_in
      0.06 =C2=B1 51%      +0.0        0.06 =C2=B1 53%      -0.0        0.0=
4 =C2=B1 65%  perf-profile.self.cycles-pp.page_mapping
      0.60 =C2=B1  8%      +0.0        0.60 =C2=B1  8%      +0.2        0.7=
7 =C2=B1 61%  perf-profile.self.cycles-pp.timerqueue_add
      0.02 =C2=B1141%      +0.0        0.02 =C2=B1116%      +0.0        0.0=
2 =C2=B1160%  perf-profile.self.cycles-pp.down_write
      0.12 =C2=B1  8%      +0.0        0.12 =C2=B1 13%      +0.0        0.1=
4 =C2=B1 14%  perf-profile.self.cycles-pp.arch_cpu_idle_enter
      0.15 =C2=B1 33%      +0.0        0.15 =C2=B1 22%      -0.0        0.1=
3 =C2=B1 20%  perf-profile.self.cycles-pp.shmem_write_end
      0.06 =C2=B1 13%      +0.0        0.06 =C2=B1  8%      -0.0        0.0=
5 =C2=B1 47%  perf-profile.self.cycles-pp.timer_clear_idle
      0.12 =C2=B1 29%      +0.0        0.12 =C2=B1 39%      +0.0        0.1=
2 =C2=B1 36%  perf-profile.self.cycles-pp.queue_event
      0.06 =C2=B1 74%      +0.0        0.06 =C2=B1 45%      -0.0        0.0=
5 =C2=B1 67%  perf-profile.self.cycles-pp.generic_file_write_iter
      0.25 =C2=B1  9%      +0.0        0.26 =C2=B1 10%      +0.0        0.2=
8 =C2=B1 20%  perf-profile.self.cycles-pp.rebalance_domains
      0.37 =C2=B1  5%      +0.0        0.38 =C2=B1  8%      -0.0        0.3=
4 =C2=B1  5%  perf-profile.self.cycles-pp.irq_enter_rcu
      0.85            +0.0        0.85 =C2=B1  6%      +0.1        0.96 =C2=
=B1 18%  perf-profile.self.cycles-pp.update_irq_load_avg
      0.06 =C2=B1 15%      +0.0        0.06 =C2=B1 14%      +0.0        0.0=
6 =C2=B1 51%  perf-profile.self.cycles-pp.update_group_capacity
      0.08 =C2=B1 12%      +0.0        0.08 =C2=B1 12%      +0.0        0.0=
9 =C2=B1  7%  perf-profile.self.cycles-pp.rcu_idle_enter
      0.47 =C2=B1  7%      +0.0        0.48 =C2=B1  4%      +0.0        0.5=
2 =C2=B1 21%  perf-profile.self.cycles-pp.update_rq_clock
      0.06 =C2=B1 11%      +0.0        0.07 =C2=B1 14%      -0.0        0.0=
6 =C2=B1 10%  perf-profile.self.cycles-pp.check_tsc_unstable
      0.05 =C2=B1 78%      +0.0        0.06 =C2=B1 42%      +0.0        0.0=
5 =C2=B1 51%  perf-profile.self.cycles-pp.ksys_write
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1158%      +0.0        0.0=
2 =C2=B1161%  perf-profile.self.cycles-pp.arch_cpu_idle_exit
      0.16 =C2=B1 20%      +0.0        0.16 =C2=B1 24%      +0.0        0.1=
7 =C2=B1 21%  perf-profile.self.cycles-pp.pm_qos_read_value
      0.02 =C2=B1141%      +0.0        0.02 =C2=B1116%      +0.0        0.0=
3 =C2=B1124%  perf-profile.self.cycles-pp.__bitmap_and
      0.06 =C2=B1 17%      +0.0        0.07 =C2=B1 15%      +0.0        0.0=
6 =C2=B1 45%  perf-profile.self.cycles-pp.tick_nohz_get_next_hrtimer
      0.10 =C2=B1 14%      +0.0        0.11 =C2=B1 12%      +0.0        0.1=
4 =C2=B1 28%  perf-profile.self.cycles-pp.update_dl_rq_load_avg
      0.12 =C2=B1 18%      +0.0        0.13 =C2=B1 12%      -0.0        0.1=
2 =C2=B1 19%  perf-profile.self.cycles-pp.irqentry_exit
      0.00            +0.0        0.01 =C2=B1244%      +0.0        0.00    =
    perf-profile.self.cycles-pp.sched_clock_idle_sleep_event
      0.00            +0.0        0.01 =C2=B1244%      +0.0        0.00    =
    perf-profile.self.cycles-pp.native_irq_return_ldt
      0.00            +0.0        0.01 =C2=B1244%      +0.0        0.01 =C2=
=B1244%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.00            +0.0        0.01 =C2=B1244%      +0.0        0.01 =C2=
=B1244%  perf-profile.self.cycles-pp.tick_nohz_idle_retain_tick
      0.00            +0.0        0.01 =C2=B1244%      +0.0        0.01 =C2=
=B1158%  perf-profile.self.cycles-pp.kallsyms__parse
      0.01 =C2=B1223%      +0.0        0.02 =C2=B1159%      -0.0        0.0=
1 =C2=B1244%  perf-profile.self.cycles-pp.number
      0.98 =C2=B1  4%      +0.0        0.98 =C2=B1  3%      +0.1        1.0=
4 =C2=B1 16%  perf-profile.self.cycles-pp.__hrtimer_next_event_base
      0.07 =C2=B1 52%      +0.0        0.07 =C2=B1 20%      +0.0        0.0=
7 =C2=B1 28%  perf-profile.self.cycles-pp.__get_user_nocheck_1
      0.06 =C2=B1 54%      +0.0        0.07 =C2=B1 22%      +0.0        0.0=
7 =C2=B1 36%  perf-profile.self.cycles-pp.__fsnotify_parent
      0.19 =C2=B1  2%      +0.0        0.20 =C2=B1  8%      +0.0        0.2=
0 =C2=B1  7%  perf-profile.self.cycles-pp.cpuidle_not_available
      0.69 =C2=B1 10%      +0.0        0.70 =C2=B1  8%      +0.1        0.7=
4 =C2=B1 19%  perf-profile.self.cycles-pp.update_sd_lb_stats
      0.10 =C2=B1 36%      +0.0        0.11 =C2=B1 18%      -0.0        0.0=
9 =C2=B1 29%  perf-profile.self.cycles-pp.write(a)plt
      0.50 =C2=B1  5%      +0.0        0.51 =C2=B1  6%      +0.0        0.5=
0 =C2=B1  4%  perf-profile.self.cycles-pp.sched_clock_cpu
      0.02 =C2=B1142%      +0.0        0.03 =C2=B1 86%      -0.0        0.0=
1 =C2=B1244%  perf-profile.self.cycles-pp.free_pcppages_bulk
      3.52 =C2=B1 17%      +0.0        3.53 =C2=B1 11%      -0.3        3.2=
3 =C2=B1  8%  perf-profile.self.cycles-pp.ktime_get
      0.18 =C2=B1 25%      +0.0        0.19 =C2=B1 15%      -0.0        0.1=
7 =C2=B1 25%  perf-profile.self.cycles-pp.___might_sleep
      0.05 =C2=B1 47%      +0.0        0.06 =C2=B1 12%      +0.0        0.0=
5 =C2=B1 70%  perf-profile.self.cycles-pp.sched_clock_tick
      0.15 =C2=B1 10%      +0.0        0.17 =C2=B1 24%      +0.0        0.1=
7 =C2=B1 31%  perf-profile.self.cycles-pp.tick_sched_handle
      0.21 =C2=B1 12%      +0.0        0.22 =C2=B1  3%      +0.0        0.2=
2 =C2=B1 10%  perf-profile.self.cycles-pp.call_cpuidle
      0.21 =C2=B1  8%      +0.0        0.22 =C2=B1  9%      +0.0        0.2=
2 =C2=B1 10%  perf-profile.self.cycles-pp.tick_nohz_tick_stopped
      0.04 =C2=B1 71%      +0.0        0.05 =C2=B1 41%      +0.0        0.0=
5        perf-profile.self.cycles-pp.cpuidle_select
      0.11 =C2=B1 33%      +0.0        0.13 =C2=B1  8%      -0.0        0.1=
1 =C2=B1 18%  perf-profile.self.cycles-pp.calc_global_load_tick
      0.03 =C2=B1 70%      +0.0        0.05 =C2=B1 41%      -0.0        0.0=
3 =C2=B1127%  perf-profile.self.cycles-pp.intel_pmu_disable_all
      0.10 =C2=B1 39%      +0.0        0.11 =C2=B1 24%      -0.0        0.1=
0 =C2=B1 25%  perf-profile.self.cycles-pp.security_file_permission
      0.15 =C2=B1  7%      +0.0        0.16 =C2=B1 10%      -0.0        0.1=
4 =C2=B1 10%  perf-profile.self.cycles-pp.rcu_dynticks_task_exit
      0.27 =C2=B1  7%      +0.0        0.29 =C2=B1  8%      +0.0        0.2=
9 =C2=B1 21%  perf-profile.self.cycles-pp.tick_sched_timer
      0.00            +0.0        0.01 =C2=B1158%      +0.0        0.00    =
    perf-profile.self.cycles-pp.generic_write_checks
      0.00            +0.0        0.01 =C2=B1158%      +0.0        0.01 =C2=
=B1244%  perf-profile.self.cycles-pp.__intel_pmu_disable_all
      0.00            +0.0        0.01 =C2=B1158%      +0.0        0.01 =C2=
=B1158%  perf-profile.self.cycles-pp.__pagevec_lru_add
      0.10 =C2=B1  3%      +0.0        0.11 =C2=B1 15%      +0.0        0.1=
1 =C2=B1 33%  perf-profile.self.cycles-pp.account_process_tick
      0.11 =C2=B1 11%      +0.0        0.12 =C2=B1 16%      +0.0        0.1=
3 =C2=B1 32%  perf-profile.self.cycles-pp.update_rt_rq_load_avg
      0.02 =C2=B1144%      +0.0        0.04 =C2=B1 88%      +0.0        0.0=
2 =C2=B1118%  perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.00            +0.0        0.02 =C2=B1159%      +0.0        0.01 =C2=
=B1244%  perf-profile.self.cycles-pp.memcpy_erms
      0.05 =C2=B1 51%      +0.0        0.07 =C2=B1 29%      -0.0        0.0=
4 =C2=B1 67%  perf-profile.self.cycles-pp.dyntick_save_progress_counter
      0.15 =C2=B1 10%      +0.0        0.17 =C2=B1 10%      +0.0        0.1=
7 =C2=B1 21%  perf-profile.self.cycles-pp.update_blocked_averages
      0.37 =C2=B1 45%      +0.0        0.39 =C2=B1 22%      +0.0        0.4=
1 =C2=B1 30%  perf-profile.self.cycles-pp.timekeeping_max_deferment
      1.61 =C2=B1  4%      +0.0        1.63 =C2=B1  7%      -0.1        1.5=
4 =C2=B1 11%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.22 =C2=B1 28%      +0.0        0.24 =C2=B1 35%      -0.0        0.2=
0 =C2=B1 31%  perf-profile.self.cycles-pp.raise_softirq
      0.14 =C2=B1  2%      +0.0        0.16 =C2=B1 12%      +0.0        0.1=
5 =C2=B1 14%  perf-profile.self.cycles-pp.tick_nohz_idle_got_tick
      0.07 =C2=B1 51%      +0.0        0.09 =C2=B1 40%      -0.0        0.0=
7 =C2=B1 51%  perf-profile.self.cycles-pp.__fget_light
      0.10 =C2=B1 17%      +0.0        0.13 =C2=B1 14%      +0.0        0.1=
1 =C2=B1 21%  perf-profile.self.cycles-pp.tick_sched_do_timer
      0.04 =C2=B1101%      +0.0        0.06 =C2=B1 47%      +0.0        0.0=
6 =C2=B1 25%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.21 =C2=B1  6%      +0.0        0.23 =C2=B1  7%      +0.0        0.2=
2 =C2=B1 25%  perf-profile.self.cycles-pp.load_balance
      0.19 =C2=B1  6%      +0.0        0.22 =C2=B1  9%      +0.0        0.2=
4 =C2=B1 24%  perf-profile.self.cycles-pp.rb_erase
      0.14 =C2=B1  8%      +0.0        0.16 =C2=B1 10%      +0.0        0.1=
7 =C2=B1 23%  perf-profile.self.cycles-pp.irq_work_tick
      0.44 =C2=B1 10%      +0.0        0.47 =C2=B1 11%      -0.0        0.4=
2 =C2=B1  5%  perf-profile.self.cycles-pp.tick_check_oneshot_broadcast_this=
_cpu
      1.14 =C2=B1 20%      +0.0        1.17 =C2=B1 17%      -0.1        1.0=
7 =C2=B1 14%  perf-profile.self.cycles-pp.update_process_times
      0.42 =C2=B1  3%      +0.0        0.46 =C2=B1  4%      -0.0        0.4=
2 =C2=B1  2%  perf-profile.self.cycles-pp.tick_program_event
      0.06 =C2=B1 54%      +0.0        0.10 =C2=B1 33%      +0.0        0.1=
0 =C2=B1 26%  perf-profile.self.cycles-pp.memcpy_toio
      0.19 =C2=B1 11%      +0.0        0.23 =C2=B1  9%      +0.0        0.2=
0 =C2=B1  9%  perf-profile.self.cycles-pp.hrtimer_get_next_event
      0.19 =C2=B1  3%      +0.0        0.23 =C2=B1  7%      +0.0        0.1=
9 =C2=B1 10%  perf-profile.self.cycles-pp.irqentry_enter
      1.55 =C2=B1 10%      +0.0        1.60 =C2=B1 10%      +0.0        1.5=
7 =C2=B1  5%  perf-profile.self.cycles-pp._raw_spin_lock
      0.03 =C2=B1 70%      +0.1        0.09 =C2=B1 16%      +0.0        0.0=
6 =C2=B1 10%  perf-profile.self.cycles-pp.cpuidle_get_cpu_driver
      0.69 =C2=B1 11%      +0.1        0.75 =C2=B1  4%      -0.1        0.6=
2 =C2=B1 11%  perf-profile.self.cycles-pp.irq_exit_rcu
      0.32 =C2=B1  5%      +0.1        0.39 =C2=B1  7%      +0.1        0.4=
1 =C2=B1 31%  perf-profile.self.cycles-pp.rb_insert_color
      0.06 =C2=B1 47%      +0.1        0.13 =C2=B1  9%      +0.0        0.0=
6 =C2=B1 42%  perf-profile.self.cycles-pp.cpumask_next_and
      0.00            +0.1        0.08 =C2=B1 18%      +0.0        0.00    =
    perf-profile.self.cycles-pp.rcu_irq_exit
      0.62 =C2=B1 11%      +0.1        0.71 =C2=B1 25%      +0.0        0.6=
2 =C2=B1 13%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.39 =C2=B1  9%      +0.1        0.48 =C2=B1 13%      +0.0        0.4=
4 =C2=B1 26%  perf-profile.self.cycles-pp.hrtimer_forward
      0.34 =C2=B1  8%      +0.1        0.44 =C2=B1  5%      +0.1        0.4=
0 =C2=B1  3%  perf-profile.self.cycles-pp.get_cpu_device
      0.47 =C2=B1  5%      +0.1        0.59 =C2=B1  5%      -0.0        0.4=
6 =C2=B1  7%  perf-profile.self.cycles-pp.tick_check_broadcast_expired
      0.14 =C2=B1  9%      +0.1        0.26 =C2=B1 10%      -0.0        0.1=
2 =C2=B1 10%  perf-profile.self.cycles-pp.rcu_core
      0.77 =C2=B1  5%      +0.1        0.92 =C2=B1  3%      -0.0        0.7=
6 =C2=B1  6%  perf-profile.self.cycles-pp.tick_nohz_next_event
      2.38 =C2=B1 13%      +0.2        2.56 =C2=B1 13%      +0.4        2.7=
6 =C2=B1 31%  perf-profile.self.cycles-pp.perf_mux_hrtimer_handler
      0.80 =C2=B1 21%      +0.2        0.99 =C2=B1 44%      -0.1        0.7=
2 =C2=B1 28%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      3.38 =C2=B1 15%      +0.3        3.71 =C2=B1 16%      -0.0        3.3=
6 =C2=B1 18%  perf-profile.self.cycles-pp.native_sched_clock
      0.00            +0.4        0.35 =C2=B1244%      +0.0        0.00    =
    perf-profile.self.cycles-pp.poll_idle
      3.46 =C2=B1 21%      +1.1        4.60 =C2=B1 16%      +0.8        4.2=
9 =C2=B1 26%  perf-profile.self.cycles-pp.menu_select
    434.50 =C2=B1  2%      +6.5%     462.71 =C2=B1 10%     +30.9%     568.7=
1 =C2=B1  5%  softirqs.BLOCK
      9.00 =C2=B1223%      +1.6%       9.14 =C2=B1120%    +314.3%      37.2=
9 =C2=B1 98%  softirqs.CPU0.BLOCK
      5.00            +0.0%       5.00            +0.0%       5.00        s=
oftirqs.CPU0.HI
      0.67 =C2=B1 70%     -35.7%       0.43 =C2=B1115%    -100.0%       0.0=
0        softirqs.CPU0.NET_TX
     35776 =C2=B1  9%      +0.4%      35902 =C2=B1  6%      +1.0%      3613=
0 =C2=B1 11%  softirqs.CPU0.RCU
     29141 =C2=B1  6%      -5.8%      27449 =C2=B1 14%      -9.0%      2653=
0 =C2=B1 18%  softirqs.CPU0.SCHED
    147.00 =C2=B1  6%      -2.8%     142.86            -2.6%     143.14    =
    softirqs.CPU0.TASKLET
      6844 =C2=B1 38%     -30.9%       4728 =C2=B1 75%     -60.7%       268=
8 =C2=B1 34%  softirqs.CPU0.TIMER
      3.00 =C2=B1152%     +57.1%       4.71 =C2=B1228%     -95.2%       0.1=
4 =C2=B1244%  softirqs.CPU1.BLOCK
      0.00          -100.0%       0.00       +4.3e+101%       0.43 =C2=B116=
9%  softirqs.CPU1.NET_TX
     35084 =C2=B1 11%      +4.0%      36503 =C2=B1  7%      +0.7%      3534=
5 =C2=B1 12%  softirqs.CPU1.RCU
     23986 =C2=B1 17%      -0.4%      23886 =C2=B1 21%     +10.1%      2640=
3 =C2=B1 11%  softirqs.CPU1.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU1.TASKLET
      1027 =C2=B1130%     -26.1%     759.14 =C2=B1131%    +144.1%       250=
8 =C2=B1120%  softirqs.CPU1.TIMER
      0.17 =C2=B1223%    +928.6%       1.71 =C2=B1244%   +5385.7%       9.1=
4 =C2=B1172%  softirqs.CPU10.BLOCK
     34948 =C2=B1  4%      -2.4%      34095 =C2=B1  3%     -10.3%      3135=
8 =C2=B1 13%  softirqs.CPU10.RCU
     25984 =C2=B1  3%      -7.4%      24063 =C2=B1 19%      -3.3%      2513=
3 =C2=B1  7%  softirqs.CPU10.SCHED
      2.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU10.TASKLET
     77.50 =C2=B1 11%      +7.8%      83.57 =C2=B1 41%     -17.6%      63.8=
6 =C2=B1 26%  softirqs.CPU10.TIMER
      3.67 =C2=B1223%    -100.0%       0.00           +24.7%       4.57 =C2=
=B1189%  softirqs.CPU100.BLOCK
     28392            -2.2%      27767 =C2=B1  6%      -6.7%      26502 =C2=
=B1 10%  softirqs.CPU100.RCU
     26738           -14.7%      22807 =C2=B1 26%      -0.8%      26527    =
    softirqs.CPU100.SCHED
    146.00 =C2=B1136%     -66.2%      49.29 =C2=B1103%     -76.3%      34.5=
7 =C2=B1 33%  softirqs.CPU100.TIMER
      0.00       +2.9e+101%       0.29 =C2=B1244%   +1e+102%       1.00 =C2=
=B1244%  softirqs.CPU101.BLOCK
     28160            -1.9%      27626 =C2=B1  6%      -7.2%      26125 =C2=
=B1  8%  softirqs.CPU101.RCU
     26689            -4.0%      25627 =C2=B1  7%      +0.3%      26764    =
    softirqs.CPU101.SCHED
      0.00          -100.0%       0.00       +2.3e+102%       2.29 =C2=B124=
4%  softirqs.CPU101.TASKLET
     43.33 =C2=B1 89%     -30.4%      30.14 =C2=B1 41%      +3.5%      44.8=
6 =C2=B1 75%  softirqs.CPU101.TIMER
      2.50 =C2=B1206%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU102.BLOCK
     28592 =C2=B1  3%      -2.8%      27800 =C2=B1  5%      -7.6%      2640=
7 =C2=B1  9%  softirqs.CPU102.RCU
     25946 =C2=B1  5%      +2.1%      26498            +1.6%      26365    =
    softirqs.CPU102.SCHED
      0.00          -100.0%       0.00       +2.9e+102%       2.86 =C2=B124=
4%  softirqs.CPU102.TASKLET
    150.83 =C2=B1165%     -77.1%      34.57 =C2=B1 42%     -52.4%      71.8=
6 =C2=B1128%  softirqs.CPU102.TIMER
      6.83 =C2=B1223%    -100.0%       0.00            -3.8%       6.57 =C2=
=B1244%  softirqs.CPU103.BLOCK
     29325 =C2=B1  8%      -4.3%      28052 =C2=B1  4%      -7.7%      2706=
9 =C2=B1 13%  softirqs.CPU103.RCU
     26751            -1.8%      26260 =C2=B1  3%      -6.7%      24949 =C2=
=B1 15%  softirqs.CPU103.SCHED
     83.17 =C2=B1129%     -65.5%      28.71 =C2=B1 25%    +191.7%     242.5=
7 =C2=B1213%  softirqs.CPU103.TIMER
      2.17 =C2=B1223%    -100.0%       0.00           -73.6%       0.57 =C2=
=B1158%  softirqs.CPU104.BLOCK
     29079            -7.0%      27051 =C2=B1  7%      -7.1%      27019 =C2=
=B1  8%  softirqs.CPU104.RCU
     23130 =C2=B1 25%      +4.9%      24260 =C2=B1 21%      +6.9%      2472=
0 =C2=B1 16%  softirqs.CPU104.SCHED
     27.83 =C2=B1 23%   +4604.5%       1309 =C2=B1219%      -0.9%      27.5=
7 =C2=B1  9%  softirqs.CPU104.TIMER
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU105.BLOCK
     28935 =C2=B1  2%      -6.9%      26931 =C2=B1  9%      -8.7%      2640=
3 =C2=B1  9%  softirqs.CPU105.RCU
     25044 =C2=B1 16%      +6.2%      26598            +4.7%      26224 =C2=
=B1  5%  softirqs.CPU105.SCHED
     25.00 =C2=B1 29%   +7097.1%       1799 =C2=B1159%      +0.0%      25.0=
0 =C2=B1 19%  softirqs.CPU105.TIMER
      0.00          -100.0%       0.00       +1.9e+102%       1.86 =C2=B124=
4%  softirqs.CPU106.BLOCK
     29505 =C2=B1  6%      -6.2%      27670 =C2=B1  6%     -12.1%      2594=
4 =C2=B1 10%  softirqs.CPU106.RCU
     23598 =C2=B1 18%     +11.3%      26257 =C2=B1  3%     +12.0%      2643=
4        softirqs.CPU106.SCHED
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU106.TASKLET
     36.00 =C2=B1 36%    +754.0%     307.43 =C2=B1200%   +2032.5%     767.7=
1 =C2=B1232%  softirqs.CPU106.TIMER
      0.00       +7.1e+101%       0.71 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU107.BLOCK
     28333            -1.9%      27783 =C2=B1  6%      -7.6%      26189 =C2=
=B1  9%  softirqs.CPU107.RCU
     26729            -8.2%      24540 =C2=B1 22%      -6.3%      25054 =C2=
=B1 16%  softirqs.CPU107.SCHED
     24.00 =C2=B1 15%    +757.7%     205.86 =C2=B1211%     +89.9%      45.5=
7 =C2=B1 78%  softirqs.CPU107.TIMER
     30095 =C2=B1  7%      -5.2%      28531 =C2=B1  6%      -5.5%      2843=
9 =C2=B1  4%  softirqs.CPU108.RCU
     24013 =C2=B1 23%      +9.1%      26194            +0.6%      24160 =C2=
=B1 21%  softirqs.CPU108.SCHED
     35.33 =C2=B1 30%      -3.0%      34.29 =C2=B1 49%      -5.0%      33.5=
7 =C2=B1 33%  softirqs.CPU108.TIMER
      0.00       +2.7e+102%       2.71 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU109.BLOCK
     28970            -1.7%      28479 =C2=B1  6%      -4.7%      27616 =C2=
=B1  9%  softirqs.CPU109.RCU
     24795 =C2=B1 15%      -2.3%      24216 =C2=B1 22%      -1.2%      2450=
2 =C2=B1 19%  softirqs.CPU109.SCHED
     22.83 =C2=B1 10%     +44.5%      33.00 =C2=B1 85%    +347.3%     102.1=
4 =C2=B1145%  softirqs.CPU109.TIMER
      4.67 =C2=B1223%     +43.9%       6.71 =C2=B1227%    -100.0%       0.0=
0        softirqs.CPU11.BLOCK
     36.33            -0.1%      36.29            +1.0%      36.71        s=
oftirqs.CPU11.NET_TX
     34319 =C2=B1  6%      +0.6%      34520 =C2=B1  3%      -7.1%      3187=
3 =C2=B1  9%  softirqs.CPU11.RCU
     24651 =C2=B1 18%      -0.7%      24471 =C2=B1 18%      -4.0%      2366=
8 =C2=B1 20%  softirqs.CPU11.SCHED
      1.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU11.TASKLET
    328.67 =C2=B1 65%     -38.8%     201.29 =C2=B1 17%     -45.5%     179.2=
9 =C2=B1  4%  softirqs.CPU11.TIMER
     28820 =C2=B1  2%      +0.5%      28969 =C2=B1  6%      -4.5%      2752=
5 =C2=B1 13%  softirqs.CPU110.RCU
     24364 =C2=B1 20%      +4.0%      25326 =C2=B1  8%      +9.9%      2677=
3        softirqs.CPU110.SCHED
     41.17 =C2=B1 55%     -16.0%      34.57 =C2=B1 52%   +1792.7%     779.1=
4 =C2=B1156%  softirqs.CPU110.TIMER
     29062 =C2=B1  3%      -2.5%      28335 =C2=B1  6%      -8.4%      2661=
5 =C2=B1  8%  softirqs.CPU111.RCU
     26453 =C2=B1  2%      -1.4%      26090 =C2=B1  4%      +1.0%      2672=
7        softirqs.CPU111.SCHED
      0.00       +1.4e+102%       1.43 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU111.TASKLET
     62.83 =C2=B1132%     -57.9%      26.43 =C2=B1 42%     +29.6%      81.4=
3 =C2=B1161%  softirqs.CPU111.TIMER
      0.00       +3.9e+102%       3.86 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU112.BLOCK
     29277 =C2=B1  3%      -4.6%      27932 =C2=B1  6%      -6.7%      2732=
7 =C2=B1  9%  softirqs.CPU112.RCU
     26153 =C2=B1  4%      -6.9%      24361 =C2=B1 21%      +1.8%      2661=
2        softirqs.CPU112.SCHED
      0.00       +2.9e+101%       0.29 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU112.TASKLET
     68.00 =C2=B1 84%     -46.2%      36.57 =C2=B1 51%     -52.1%      32.5=
7 =C2=B1 23%  softirqs.CPU112.TIMER
      0.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU113.BLOCK
     28773            -2.6%      28034 =C2=B1  6%      -6.9%      26793 =C2=
=B1  9%  softirqs.CPU113.RCU
     26580            -0.1%      26543            -0.1%      26548        s=
oftirqs.CPU113.SCHED
     33.17 =C2=B1 48%     -32.4%      22.43 =C2=B1 15%      +1.7%      33.7=
1 =C2=B1 33%  softirqs.CPU113.TIMER
      0.00       +1.9e+102%       1.86 =C2=B1244% +1.4e+102%       1.43 =C2=
=B1244%  softirqs.CPU114.BLOCK
     28732            -2.6%      27971 =C2=B1  6%      -7.2%      26657 =C2=
=B1  9%  softirqs.CPU114.RCU
     26709            -2.9%      25935 =C2=B1  4%      -0.6%      26552    =
    softirqs.CPU114.SCHED
    248.83 =C2=B1134%     -32.4%     168.29 =C2=B1124%     -88.7%      28.1=
4 =C2=B1 24%  softirqs.CPU114.TIMER
      0.00       +7.1e+101%       0.71 =C2=B1162%    -100.0%       0.00    =
    softirqs.CPU115.BLOCK
     28054 =C2=B1 11%      +0.2%      28102 =C2=B1  7%      -4.4%      2682=
8 =C2=B1  9%  softirqs.CPU115.RCU
     26096 =C2=B1  4%      +1.7%      26551           -10.0%      23476 =C2=
=B1 23%  softirqs.CPU115.SCHED
      2323 =C2=B1219%     -81.5%     430.43 =C2=B1223%     -98.7%      30.2=
9 =C2=B1 54%  softirqs.CPU115.TIMER
      0.00       +8.6e+101%       0.86 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU116.BLOCK
     28487            -2.1%      27879 =C2=B1  5%      -7.9%      26224 =C2=
=B1  9%  softirqs.CPU116.RCU
     23078 =C2=B1 23%      +6.2%      24514 =C2=B1 22%     +14.2%      2634=
6 =C2=B1  2%  softirqs.CPU116.SCHED
     25.33 =C2=B1 29%    +800.6%     228.14 =C2=B1216%   +2366.5%     624.8=
6 =C2=B1229%  softirqs.CPU116.TIMER
      0.00          -100.0%       0.00       +2.9e+101%       0.29 =C2=B124=
4%  softirqs.CPU117.BLOCK
     28733 =C2=B1  2%      +0.2%      28778 =C2=B1  8%      -8.0%      2642=
9 =C2=B1  9%  softirqs.CPU117.RCU
     26783 =C2=B1  2%      -5.5%      25322 =C2=B1 10%      -0.3%      2669=
7        softirqs.CPU117.SCHED
     25.33 =C2=B1 26%    +462.8%     142.57 =C2=B1145%    +313.3%     104.7=
1 =C2=B1176%  softirqs.CPU117.TIMER
     28515 =C2=B1  2%      -2.2%      27879 =C2=B1  5%      -8.2%      2618=
1 =C2=B1  9%  softirqs.CPU118.RCU
     26886            -1.7%      26438 =C2=B1  2%      -7.3%      24934 =C2=
=B1 17%  softirqs.CPU118.SCHED
     91.67 =C2=B1152%     -66.8%      30.43 =C2=B1 26%    +957.9%     969.7=
1 =C2=B1144%  softirqs.CPU118.TIMER
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU119.BLOCK
     28638            -1.7%      28150 =C2=B1  6%      -9.6%      25887 =C2=
=B1  9%  softirqs.CPU119.RCU
     24315 =C2=B1 24%      +8.7%      26432            +8.8%      26461 =C2=
=B1  2%  softirqs.CPU119.SCHED
     27.67 =C2=B1 51%      +4.3%      28.86 =C2=B1 44%   +5089.3%       143=
5 =C2=B1191%  softirqs.CPU119.TIMER
      0.83 =C2=B1223%     -48.6%       0.43 =C2=B1244%    -100.0%       0.0=
0        softirqs.CPU12.BLOCK
    870.50 =C2=B1 87%     -24.0%     661.57 =C2=B1 79%     +26.1%       109=
7 =C2=B1 54%  softirqs.CPU12.NET_RX
      1.83 =C2=B1 58%     +24.7%       2.29 =C2=B1 19%      +9.1%       2.0=
0 =C2=B1 37%  softirqs.CPU12.NET_TX
     30950 =C2=B1  3%      +0.2%      31023 =C2=B1  4%      -4.1%      2968=
6 =C2=B1  8%  softirqs.CPU12.RCU
     24174 =C2=B1 20%      +3.8%      25091 =C2=B1  7%      +7.6%      2601=
6 =C2=B1  4%  softirqs.CPU12.SCHED
    143.83 =C2=B1 95%     -43.7%      81.00 =C2=B1 19%     -33.1%      96.2=
9 =C2=B1 41%  softirqs.CPU12.TIMER
      0.33 =C2=B1223%    -100.0%       0.00          +114.3%       0.71 =C2=
=B1244%  softirqs.CPU120.BLOCK
     28462 =C2=B1  3%      -1.4%      28059 =C2=B1  5%      -6.7%      2654=
8 =C2=B1  8%  softirqs.CPU120.RCU
     23950 =C2=B1 24%      +8.7%      26026 =C2=B1  3%      +8.3%      2593=
7 =C2=B1  3%  softirqs.CPU120.SCHED
      1281 =C2=B1218%     -97.1%      37.14 =C2=B1 45%     -95.9%      53.0=
0 =C2=B1 90%  softirqs.CPU120.TIMER
      0.00       +2.9e+101%       0.29 =C2=B1244% +2.6e+102%       2.57 =C2=
=B1244%  softirqs.CPU121.BLOCK
     28771            -2.2%      28130 =C2=B1  6%      -7.7%      26566 =C2=
=B1  8%  softirqs.CPU121.RCU
     23976 =C2=B1 25%     +10.9%      26590           +11.2%      26663    =
    softirqs.CPU121.SCHED
    168.33 =C2=B1190%     -83.5%      27.86 =C2=B1 26%     -74.7%      42.5=
7 =C2=B1 74%  softirqs.CPU121.TIMER
     28825 =C2=B1  2%      -3.1%      27931 =C2=B1  6%      -7.1%      2677=
9 =C2=B1  9%  softirqs.CPU122.RCU
     26524            -9.5%      24008 =C2=B1 21%      +0.5%      26653    =
    softirqs.CPU122.SCHED
     39.67 =C2=B1 55%    +551.1%     258.29 =C2=B1187%     -33.4%      26.4=
3 =C2=B1 13%  softirqs.CPU122.TIMER
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU123.BLOCK
     28915 =C2=B1  2%      -3.2%      28000 =C2=B1  5%      -7.3%      2679=
3 =C2=B1  9%  softirqs.CPU123.RCU
     26752            -6.1%      25111 =C2=B1 13%      -7.4%      24768 =C2=
=B1 18%  softirqs.CPU123.SCHED
      0.00          -100.0%       0.00       +4.3e+101%       0.43 =C2=B124=
4%  softirqs.CPU123.TASKLET
    221.67 =C2=B1198%     -39.9%     133.29 =C2=B1112%     -84.7%      34.0=
0 =C2=B1 81%  softirqs.CPU123.TIMER
      1.17 =C2=B1223%    +438.8%       6.29 =C2=B1208%    -100.0%       0.0=
0        softirqs.CPU124.BLOCK
     28583 =C2=B1  2%      -2.8%      27779 =C2=B1  5%      -5.7%      2694=
2 =C2=B1 10%  softirqs.CPU124.RCU
     24184 =C2=B1 22%      +2.4%      24767 =C2=B1 18%      +2.4%      2476=
7 =C2=B1 20%  softirqs.CPU124.SCHED
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU124.TASKLET
     26.17 =C2=B1 11%     +21.2%      31.71 =C2=B1 12%   +2759.1%     748.1=
4 =C2=B1114%  softirqs.CPU124.TIMER
      4.17 =C2=B1142%    -100.0%       0.00          +102.3%       8.43 =C2=
=B1244%  softirqs.CPU125.BLOCK
     29849 =C2=B1  8%      -6.6%      27879 =C2=B1  5%     -11.6%      2638=
2 =C2=B1  9%  softirqs.CPU125.RCU
     24034 =C2=B1 25%     -11.0%      21378 =C2=B1 31%      +0.7%      2421=
4 =C2=B1 23%  softirqs.CPU125.SCHED
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU125.TASKLET
     40.83 =C2=B1 80%     -35.6%      26.29 =C2=B1 21%     +34.7%      55.0=
0 =C2=B1 99%  softirqs.CPU125.TIMER
     10.17 =C2=B1116%      -5.9%       9.57 =C2=B1170%     -67.7%       3.2=
9 =C2=B1244%  softirqs.CPU126.BLOCK
     28622 =C2=B1  3%      -2.4%      27922 =C2=B1  6%      -5.1%      2716=
7 =C2=B1 12%  softirqs.CPU126.RCU
     26568            -8.0%      24440 =C2=B1 20%      -0.2%      26506    =
    softirqs.CPU126.SCHED
      8.00 =C2=B1223%     -98.2%       0.14 =C2=B1244%    -100.0%       0.0=
0        softirqs.CPU126.TASKLET
     47.67 =C2=B1 60%   +1977.2%     990.14 =C2=B1184%     -22.1%      37.1=
4 =C2=B1 25%  softirqs.CPU126.TIMER
      0.00       +1.4e+102%       1.43 =C2=B1193% +1.3e+103%      12.71 =C2=
=B1244%  softirqs.CPU127.BLOCK
     28787            +1.0%      29061 =C2=B1  6%      -7.8%      26544 =C2=
=B1  9%  softirqs.CPU127.RCU
     13716 =C2=B1 17%      -3.0%      13300 =C2=B1 15%     -17.0%      1138=
5 =C2=B1  5%  softirqs.CPU127.SCHED
     23.67 =C2=B1  9%   +3916.5%     950.57 =C2=B1157%      +9.3%      25.8=
6 =C2=B1 14%  softirqs.CPU127.TIMER
      0.00          -100.0%       0.00       +6.3e+102%       6.29 =C2=B124=
4%  softirqs.CPU128.BLOCK
     27779            -1.1%      27478 =C2=B1  6%      -5.7%      26196 =C2=
=B1  8%  softirqs.CPU128.RCU
     24576 =C2=B1 20%     -12.3%      21547 =C2=B1 26%      -9.3%      2228=
6 =C2=B1 26%  softirqs.CPU128.SCHED
    257.00 =C2=B1206%     -79.8%      51.86 =C2=B1106%     -85.1%      38.2=
9 =C2=B1112%  softirqs.CPU128.TIMER
      4.50 =C2=B1223%     +46.0%       6.57 =C2=B1244%    -100.0%       0.0=
0        softirqs.CPU129.BLOCK
     27926 =C2=B1  2%      -1.6%      27486 =C2=B1  6%      -6.9%      2600=
2 =C2=B1  8%  softirqs.CPU129.RCU
     21859 =C2=B1 29%      +3.8%      22697 =C2=B1 26%      +1.5%      2218=
7 =C2=B1 32%  softirqs.CPU129.SCHED
      1.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU129.TASKLET
    204.00 =C2=B1162%     -81.4%      37.86 =C2=B1 76%     -90.4%      19.5=
7 =C2=B1 24%  softirqs.CPU129.TIMER
      0.33 =C2=B1223%   +1828.6%       6.43 =C2=B1244%   +5300.0%      18.0=
0 =C2=B1244%  softirqs.CPU13.BLOCK
    862.50 =C2=B1111%    +209.5%       2669 =C2=B1122%    +309.9%       353=
5 =C2=B1165%  softirqs.CPU13.NET_RX
      2.33 =C2=B1 47%     -26.5%       1.71 =C2=B1 51%     -32.7%       1.5=
7 =C2=B1 46%  softirqs.CPU13.NET_TX
     33493 =C2=B1  7%      -4.5%      31983 =C2=B1  4%      -9.8%      3020=
5 =C2=B1 10%  softirqs.CPU13.RCU
     25892 =C2=B1  3%      +0.9%      26130 =C2=B1  4%      -4.5%      2472=
7 =C2=B1 16%  softirqs.CPU13.SCHED
      0.00       +2.9e+101%       0.29 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU13.TASKLET
     62.83 =C2=B1 33%     -30.0%      44.00 =C2=B1 14%    +418.4%     325.7=
1 =C2=B1178%  softirqs.CPU13.TIMER
      3.00 =C2=B1195%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU130.BLOCK
     28378            -2.2%      27760 =C2=B1  7%      -3.1%      27507 =C2=
=B1  4%  softirqs.CPU130.RCU
     20311 =C2=B1 33%     +23.9%      25171 =C2=B1 15%     +28.6%      2612=
1 =C2=B1  4%  softirqs.CPU130.SCHED
      0.00       +5.7e+102%       5.71 =C2=B1179%    -100.0%       0.00    =
    softirqs.CPU130.TASKLET
     27.83 =C2=B1 43%     -10.7%      24.86 =C2=B1 39%    +141.7%      67.2=
9 =C2=B1 85%  softirqs.CPU130.TIMER
      0.67 =C2=B1165%    -100.0%       0.00           -57.1%       0.29 =C2=
=B1244%  softirqs.CPU131.BLOCK
     28315            -0.4%      28192 =C2=B1  7%      -5.9%      26656 =C2=
=B1  9%  softirqs.CPU131.RCU
     22518 =C2=B1 28%     +18.6%      26705           +18.0%      26574 =C2=
=B1  2%  softirqs.CPU131.SCHED
      0.00       +1.2e+103%      12.43 =C2=B1158%    -100.0%       0.00    =
    softirqs.CPU131.TASKLET
     20.67 =C2=B1 10%    +455.1%     114.71 =C2=B1197%    +104.6%      42.2=
9 =C2=B1102%  softirqs.CPU131.TIMER
      8.50 =C2=B1223%     -91.6%       0.71 =C2=B1162%    -100.0%       0.0=
0        softirqs.CPU132.BLOCK
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU132.NET_TX
     28669            -1.5%      28227 =C2=B1  6%      -7.5%      26528 =C2=
=B1  9%  softirqs.CPU132.RCU
     26526 =C2=B1  2%      -6.0%      24932 =C2=B1 21%      +0.6%      2667=
5        softirqs.CPU132.SCHED
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU132.TASKLET
     30.00 =C2=B1 54%   +3199.0%     989.71 =C2=B1167%     -15.7%      25.2=
9 =C2=B1 49%  softirqs.CPU132.TIMER
      5.17 =C2=B1223%     -22.6%       4.00 =C2=B1225%    -100.0%       0.0=
0        softirqs.CPU133.BLOCK
     28608 =C2=B1  2%      -2.0%      28032 =C2=B1  7%      -7.1%      2657=
7 =C2=B1  9%  softirqs.CPU133.RCU
     24843 =C2=B1 18%      +7.0%      26577            +7.3%      26654    =
    softirqs.CPU133.SCHED
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  softirqs.CPU133.TASKLET
     17.33 =C2=B1 19%    +119.2%      38.00 =C2=B1 39%     +90.4%      33.0=
0 =C2=B1 65%  softirqs.CPU133.TIMER
      7.00 =C2=B1182%    -100.0%       0.00           -63.3%       2.57 =C2=
=B1244%  softirqs.CPU134.BLOCK
     29319            -0.9%      29046 =C2=B1  9%      -6.3%      27482 =C2=
=B1 10%  softirqs.CPU134.RCU
     26695            -9.2%      24242 =C2=B1 23%     -10.0%      24029 =C2=
=B1 22%  softirqs.CPU134.SCHED
     23.33 =C2=B1 20%   +1548.8%     384.71 =C2=B1227%   +1125.1%     285.8=
6 =C2=B1212%  softirqs.CPU134.TIMER
      5.67 =C2=B1186%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU135.BLOCK
     29430            -2.1%      28806 =C2=B1  6%      -7.5%      27208 =C2=
=B1  9%  softirqs.CPU135.RCU
     24054 =C2=B1 23%      +9.7%      26385            +8.8%      26159 =C2=
=B1  3%  softirqs.CPU135.SCHED
     26.33 =C2=B1 35%      -3.4%      25.43 =C2=B1 38%     +48.1%      39.0=
0 =C2=B1 76%  softirqs.CPU135.TIMER
      0.00          -100.0%       0.00       +8.6e+101%       0.86 =C2=B124=
4%  softirqs.CPU136.BLOCK
     28614 =C2=B1  2%      -0.4%      28498 =C2=B1  7%      -1.1%      2829=
8 =C2=B1 16%  softirqs.CPU136.RCU
     26676            -0.6%      26520            -3.5%      25734 =C2=B1  =
5%  softirqs.CPU136.SCHED
      1.33 =C2=B1223%     +28.6%       1.71 =C2=B1244%    -100.0%       0.0=
0        softirqs.CPU136.TASKLET
    369.50 =C2=B1209%     -21.6%     289.71 =C2=B1220%     -88.0%      44.2=
9 =C2=B1 85%  softirqs.CPU136.TIMER
     28647 =C2=B1  2%      -2.1%      28036 =C2=B1  5%      -5.0%      2722=
2 =C2=B1 10%  softirqs.CPU137.RCU
     26581            -8.3%      24386 =C2=B1 22%      -9.0%      24198 =C2=
=B1 22%  softirqs.CPU137.SCHED
      2.00 =C2=B1223%     -92.9%       0.14 =C2=B1244%     -50.0%       1.0=
0 =C2=B1244%  softirqs.CPU137.TASKLET
    156.67 =C2=B1188%     -77.8%      34.71 =C2=B1 95%     -79.5%      32.1=
4 =C2=B1 51%  softirqs.CPU137.TIMER
      0.00          -100.0%       0.00       +4.3e+101%       0.43 =C2=B124=
4%  softirqs.CPU138.BLOCK
     28618            -2.2%      27984 =C2=B1  6%      -7.5%      26467 =C2=
=B1  9%  softirqs.CPU138.RCU
     26608            -0.6%      26456            -0.8%      26407        s=
oftirqs.CPU138.SCHED
      4.83 =C2=B1223%     -97.0%       0.14 =C2=B1244%    -100.0%       0.0=
0        softirqs.CPU138.TASKLET
     24.83 =C2=B1 40%     +48.4%      36.86 =C2=B1115%     +27.1%      31.5=
7 =C2=B1 86%  softirqs.CPU138.TIMER
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU139.BLOCK
     28519 =C2=B1  2%      -1.5%      28089 =C2=B1  5%      -5.2%      2704=
8 =C2=B1  8%  softirqs.CPU139.RCU
     23908 =C2=B1 24%      +5.2%      25158 =C2=B1 11%      +8.0%      2582=
7 =C2=B1  7%  softirqs.CPU139.SCHED
     34.00 =C2=B1 64%     -33.2%      22.71 =C2=B1 37%    +138.2%      81.0=
0 =C2=B1174%  softirqs.CPU139.TIMER
      0.00          -100.0%       0.00       +2.1e+102%       2.14 =C2=B124=
4%  softirqs.CPU14.BLOCK
    710.83 =C2=B1 32%    +695.1%       5651 =C2=B1115%    +672.8%       549=
3 =C2=B1168%  softirqs.CPU14.NET_RX
      2.17 =C2=B1 31%      -7.7%       2.00 =C2=B1 37%      -7.7%       2.0=
0 =C2=B1 37%  softirqs.CPU14.NET_TX
     31345 =C2=B1  4%      +0.3%      31434 =C2=B1  6%      -1.8%      3078=
2 =C2=B1 10%  softirqs.CPU14.RCU
     26087 =C2=B1  4%      -0.2%      26030 =C2=B1  5%      +4.8%      2734=
9 =C2=B1  6%  softirqs.CPU14.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU14.TASKLET
    123.00 =C2=B1 40%     -25.3%      91.86 =C2=B1 35%    +590.5%     849.2=
9 =C2=B1187%  softirqs.CPU14.TIMER
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU140.BLOCK
     28289            -0.5%      28158 =C2=B1 10%      -7.1%      26272 =C2=
=B1  8%  softirqs.CPU140.RCU
     22786 =C2=B1 24%     +11.9%      25496 =C2=B1 10%     +17.3%      2671=
7        softirqs.CPU140.SCHED
     27.83 =C2=B1 64%      +8.8%      30.29 =C2=B1 60%    +104.3%      56.8=
6 =C2=B1154%  softirqs.CPU140.TIMER
      0.00       +4.3e+101%       0.43 =C2=B1244% +2.9e+101%       0.29 =C2=
=B1244%  softirqs.CPU141.BLOCK
     28345 =C2=B1  2%      -3.8%      27271 =C2=B1  3%      -7.0%      2636=
9 =C2=B1  8%  softirqs.CPU141.RCU
     26712            -0.6%      26560            -0.4%      26596        s=
oftirqs.CPU141.SCHED
     31.50 =C2=B1 44%     -25.6%      23.43 =C2=B1 11%     +66.0%      52.2=
9 =C2=B1141%  softirqs.CPU141.TIMER
      0.00       +1.4e+101%       0.14 =C2=B1244% +8.7e+102%       8.71 =C2=
=B1244%  softirqs.CPU142.BLOCK
     28085 =C2=B1  2%      -2.5%      27376 =C2=B1  5%      -7.2%      2605=
0 =C2=B1  9%  softirqs.CPU142.RCU
     26623            +0.0%      26631            -0.2%      26573        s=
oftirqs.CPU142.SCHED
     42.67 =C2=B1129%     -59.5%      17.29 =C2=B1 17%     -34.7%      27.8=
6 =C2=B1 70%  softirqs.CPU142.TIMER
      0.00          -100.0%       0.00       +5.1e+102%       5.14 =C2=B124=
4%  softirqs.CPU143.BLOCK
     27934 =C2=B1  2%      +1.6%      28380 =C2=B1 14%      -6.6%      2609=
6 =C2=B1  9%  softirqs.CPU143.RCU
     24145 =C2=B1 24%      +1.2%      24442 =C2=B1 21%     +10.6%      2669=
7        softirqs.CPU143.SCHED
     32.33 =C2=B1 75%    +130.6%      74.57 =C2=B1159%      -5.9%      30.4=
3 =C2=B1 37%  softirqs.CPU143.TIMER
      0.00       +1.1e+102%       1.14 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU144.BLOCK
     27740            -1.3%      27381 =C2=B1  6%      -2.3%      27111 =C2=
=B1 13%  softirqs.CPU144.RCU
     26860            -8.7%      24513 =C2=B1 22%      -6.3%      25169 =C2=
=B1  9%  softirqs.CPU144.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU144.TASKLET
     42.67 =C2=B1 84%     -48.1%      22.14 =C2=B1 20%     -31.7%      29.1=
4 =C2=B1 53%  softirqs.CPU144.TIMER
      0.17 =C2=B1223%    -100.0%       0.00           +71.4%       0.29 =C2=
=B1244%  softirqs.CPU145.BLOCK
     27902            +1.4%      28283 =C2=B1  9%      -6.8%      25993 =C2=
=B1  9%  softirqs.CPU145.RCU
     24054 =C2=B1 24%      +9.8%      26417            +4.6%      25169 =C2=
=B1 14%  softirqs.CPU145.SCHED
     27.67 =C2=B1 14%     +10.5%      30.57 =C2=B1 32%     +37.3%      38.0=
0 =C2=B1 70%  softirqs.CPU145.TIMER
      0.67 =C2=B1223%    -100.0%       0.00          +500.0%       4.00 =C2=
=B1244%  softirqs.CPU146.BLOCK
     31208 =C2=B1  2%      -6.5%      29166 =C2=B1  6%      -9.4%      2828=
7 =C2=B1  9%  softirqs.CPU146.RCU
     23929 =C2=B1 24%      +9.9%      26291           +10.3%      26398    =
    softirqs.CPU146.SCHED
     19.00 =C2=B1  9%   +4523.3%     878.43 =C2=B1238%   +2151.9%     427.8=
6 =C2=B1232%  softirqs.CPU146.TIMER
     15.00 =C2=B1223%    -100.0%       0.00           -92.4%       1.14 =C2=
=B1244%  softirqs.CPU147.BLOCK
     30472            -3.9%      29298 =C2=B1  7%      -6.2%      28592 =C2=
=B1 11%  softirqs.CPU147.RCU
     24290 =C2=B1 21%      -7.9%      22372 =C2=B1 27%      -0.7%      2412=
5 =C2=B1 18%  softirqs.CPU147.SCHED
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU147.TASKLET
     24.00 =C2=B1 23%   +1897.6%     479.43 =C2=B1234%     +10.7%      26.5=
7 =C2=B1 36%  softirqs.CPU147.TIMER
     28235 =C2=B1  3%      -1.7%      27745 =C2=B1  6%      -5.5%      2668=
1 =C2=B1 10%  softirqs.CPU148.RCU
     26355 =C2=B1  3%      +0.9%      26591            -0.3%      26287 =C2=
=B1  2%  softirqs.CPU148.SCHED
     19.33 =C2=B1 21%    +144.6%      47.29 =C2=B1148%    +359.6%      88.8=
6 =C2=B1171%  softirqs.CPU148.TIMER
     28404 =C2=B1  2%      -1.7%      27920 =C2=B1  6%      -7.0%      2640=
9 =C2=B1  9%  softirqs.CPU149.RCU
     26577            -5.9%      24997 =C2=B1 16%      -6.4%      24872 =C2=
=B1 16%  softirqs.CPU149.SCHED
     20.33 =C2=B1 23%    +207.0%      62.43 =C2=B1156%    +660.2%     154.5=
7 =C2=B1210%  softirqs.CPU149.TIMER
      0.00       +3.7e+102%       3.71 =C2=B1244% +7.3e+102%       7.29 =C2=
=B1233%  softirqs.CPU15.BLOCK
      3247 =C2=B1 78%     +35.4%       4396 =C2=B1135%     -66.7%       108=
2 =C2=B1 33%  softirqs.CPU15.NET_RX
      2.17 =C2=B1 41%     -47.3%       1.14 =C2=B1 30%     -20.9%       1.7=
1 =C2=B1 26%  softirqs.CPU15.NET_TX
     34207 =C2=B1  5%      -6.9%      31854 =C2=B1  7%     -11.4%      3031=
9 =C2=B1 10%  softirqs.CPU15.RCU
     26524 =C2=B1  3%      -5.9%      24967 =C2=B1 18%      -9.3%      2405=
7 =C2=B1 19%  softirqs.CPU15.SCHED
    311.17 =C2=B1182%     -86.1%      43.29 =C2=B1 18%     -83.7%      50.8=
6 =C2=B1 29%  softirqs.CPU15.TIMER
      0.00       +1.7e+102%       1.71 =C2=B1201% +4.3e+101%       0.43 =C2=
=B1244%  softirqs.CPU150.BLOCK
     30570 =C2=B1  2%      -5.0%      29042 =C2=B1  4%      -8.5%      2798=
2 =C2=B1  9%  softirqs.CPU150.RCU
     25510 =C2=B1  6%      -7.5%      23607 =C2=B1 19%      +3.8%      2649=
2        softirqs.CPU150.SCHED
     26.67 =C2=B1 52%     -19.6%      21.43 =C2=B1 14%     +10.4%      29.4=
3 =C2=B1 66%  softirqs.CPU150.TIMER
      1.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU151.BLOCK
     29982            -3.5%      28918 =C2=B1  4%      -6.6%      28015 =C2=
=B1  9%  softirqs.CPU151.RCU
     26588           -25.1%      19905 =C2=B1 37%      -0.6%      26436    =
    softirqs.CPU151.SCHED
     28.17 =C2=B1 60%     -21.4%      22.14 =C2=B1 18%     +67.9%      47.2=
9 =C2=B1 93%  softirqs.CPU151.TIMER
      0.00       +2.9e+101%       0.29 =C2=B1244% +4.4e+102%       4.43 =C2=
=B1111%  softirqs.CPU152.BLOCK
     30636            -4.4%      29291 =C2=B1  4%      -7.6%      28295 =C2=
=B1  9%  softirqs.CPU152.RCU
     24088 =C2=B1 23%      +9.3%      26317            +9.7%      26419    =
    softirqs.CPU152.SCHED
     18.50 =C2=B1 12%     +22.0%      22.57 =C2=B1 21%      +2.7%      19.0=
0 =C2=B1 25%  softirqs.CPU152.TIMER
      0.00       +1.8e+103%      18.29 =C2=B1205%    -100.0%       0.00    =
    softirqs.CPU153.BLOCK
     30641            -3.7%      29494 =C2=B1  4%      -6.9%      28518 =C2=
=B1  9%  softirqs.CPU153.RCU
     26581            -1.0%      26311            -9.2%      24130 =C2=B1 2=
0%  softirqs.CPU153.SCHED
      0.00          -100.0%       0.00       +5.6e+102%       5.57 =C2=B124=
4%  softirqs.CPU153.TASKLET
     21.17 =C2=B1 24%     +10.0%      23.29 =C2=B1 39%     +78.2%      37.7=
1 =C2=B1 62%  softirqs.CPU153.TIMER
      0.00          -100.0%       0.00       +1.3e+102%       1.29 =C2=B121=
4%  softirqs.CPU154.BLOCK
     27441            +1.2%      27773 =C2=B1  7%      -6.6%      25641 =C2=
=B1  9%  softirqs.CPU154.RCU
     26804           -13.1%      23303 =C2=B1 24%      -8.7%      24459 =C2=
=B1 22%  softirqs.CPU154.SCHED
     17.83 =C2=B1 16%     +53.0%      27.29 =C2=B1 49%    +216.4%      56.4=
3 =C2=B1137%  softirqs.CPU154.TIMER
     27704            -1.5%      27276 =C2=B1  6%      -6.6%      25874 =C2=
=B1  9%  softirqs.CPU155.RCU
     26752            -0.9%      26501 =C2=B1  2%     -16.8%      22256 =C2=
=B1 32%  softirqs.CPU155.SCHED
     22.67 =C2=B1 12%     +14.1%      25.86 =C2=B1 23%    +238.4%      76.7=
1 =C2=B1118%  softirqs.CPU155.TIMER
      0.00          -100.0%       0.00       +4.6e+102%       4.57 =C2=B116=
8%  softirqs.CPU156.BLOCK
     28990 =C2=B1  2%      +0.4%      29104 =C2=B1  8%      -6.4%      2712=
3 =C2=B1 10%  softirqs.CPU156.RCU
     26751            -2.8%      26006 =C2=B1  5%      -1.2%      26437 =C2=
=B1  2%  softirqs.CPU156.SCHED
      1.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU156.TASKLET
     24.50 =C2=B1 51%    +104.7%      50.14 =C2=B1 97%      -2.6%      23.8=
6 =C2=B1 27%  softirqs.CPU156.TIMER
      0.00       +2.9e+101%       0.29 =C2=B1244% +9.4e+102%       9.43 =C2=
=B1164%  softirqs.CPU157.BLOCK
     29153 =C2=B1  2%      -0.8%      28913 =C2=B1  7%      -7.2%      2705=
4 =C2=B1  9%  softirqs.CPU157.RCU
     26527            -6.3%      24851 =C2=B1 16%      +0.5%      26658    =
    softirqs.CPU157.SCHED
      2.83 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU157.TASKLET
     27.00 =C2=B1 35%    +180.4%      75.71 =C2=B1 84%     +14.3%      30.8=
6 =C2=B1 50%  softirqs.CPU157.TIMER
      0.50 =C2=B1223%    +728.6%       4.14 =C2=B1244%     -71.4%       0.1=
4 =C2=B1244%  softirqs.CPU158.BLOCK
     28301 =C2=B1  2%      -1.6%      27839 =C2=B1  5%      -6.4%      2649=
2 =C2=B1 10%  softirqs.CPU158.RCU
     26721            -7.4%      24752 =C2=B1 16%      -4.4%      25534 =C2=
=B1  7%  softirqs.CPU158.SCHED
    115.50 =C2=B1180%     +83.8%     212.29 =C2=B1183%     -38.0%      71.5=
7 =C2=B1154%  softirqs.CPU158.TIMER
     27743 =C2=B1  6%      +0.2%      27785 =C2=B1  5%      -4.0%      2662=
6 =C2=B1 10%  softirqs.CPU159.RCU
     24149 =C2=B1 24%      -0.9%      23925 =C2=B1 21%      -0.1%      2413=
3 =C2=B1 21%  softirqs.CPU159.SCHED
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU159.TASKLET
      1352 =C2=B1219%     -66.4%     455.14 =C2=B1223%     -95.2%      64.5=
7 =C2=B1 93%  softirqs.CPU159.TIMER
      1.50 =C2=B1195%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU16.BLOCK
     35643 =C2=B1  4%      -5.3%      33739           -10.6%      31850 =C2=
=B1 13%  softirqs.CPU16.RCU
     23139 =C2=B1 22%      +4.9%      24267 =C2=B1 18%      +8.4%      2508=
3 =C2=B1  7%  softirqs.CPU16.SCHED
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  softirqs.CPU16.TASKLET
    162.67 =C2=B1 67%     -30.6%     112.86 =C2=B1 17%    +314.3%     673.8=
6 =C2=B1209%  softirqs.CPU16.TIMER
      2.50 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU160.BLOCK
     28608            -3.5%      27600 =C2=B1  4%      -7.3%      26526 =C2=
=B1  9%  softirqs.CPU160.RCU
     26660            -0.3%      26579            -8.1%      24506 =C2=B1 2=
2%  softirqs.CPU160.SCHED
     20.67 =C2=B1 11%      +0.2%      20.71 =C2=B1 19%    +824.2%     191.0=
0 =C2=B1155%  softirqs.CPU160.TIMER
      9.83 =C2=B1223%     -98.5%       0.14 =C2=B1244%     -33.2%       6.5=
7 =C2=B1244%  softirqs.CPU161.BLOCK
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU161.NET_TX
     28560 =C2=B1  2%      -1.5%      28125 =C2=B1  7%      -7.1%      2651=
9 =C2=B1  9%  softirqs.CPU161.RCU
     26822            -1.8%      26330 =C2=B1  5%     -13.3%      23252 =C2=
=B1 23%  softirqs.CPU161.SCHED
     29.33 =C2=B1 41%   +3344.2%       1010 =C2=B1237%    +743.5%     247.4=
3 =C2=B1147%  softirqs.CPU161.TIMER
      0.00       +6.3e+102%       6.29 =C2=B1168% +1.4e+102%       1.43 =C2=
=B1193%  softirqs.CPU162.BLOCK
     28832            -2.9%      27999 =C2=B1  6%      -7.4%      26692 =C2=
=B1  9%  softirqs.CPU162.RCU
     23758 =C2=B1 25%     +11.8%      26553           +10.6%      26277 =C2=
=B1  3%  softirqs.CPU162.SCHED
     41.83 =C2=B1117%     -38.9%      25.57 =C2=B1 18%     -46.0%      22.5=
7 =C2=B1 18%  softirqs.CPU162.TIMER
     28745 =C2=B1  2%      -3.0%      27894 =C2=B1  5%      -7.6%      2656=
0 =C2=B1  8%  softirqs.CPU163.RCU
     26466 =C2=B1  2%      +0.1%      26502            +0.4%      26565    =
    softirqs.CPU163.SCHED
     27.83 =C2=B1 28%      +0.1%      27.86 =C2=B1 28%     +22.2%      34.0=
0 =C2=B1 69%  softirqs.CPU163.TIMER
      5.83 =C2=B1223%     -80.4%       1.14 =C2=B1183%     -92.7%       0.4=
3 =C2=B1244%  softirqs.CPU164.BLOCK
     28429 =C2=B1  3%      -3.4%      27458 =C2=B1  6%      -8.5%      2602=
1 =C2=B1  9%  softirqs.CPU164.RCU
     26900 =C2=B1  2%     -23.7%      20528 =C2=B1 34%      -1.0%      2662=
3        softirqs.CPU164.SCHED
    404.00 =C2=B1199%     -95.2%      19.43 =C2=B1 11%     -94.4%      22.4=
3 =C2=B1 14%  softirqs.CPU164.TIMER
      0.00          -100.0%       0.00       +7.1e+102%       7.14 =C2=B121=
6%  softirqs.CPU165.BLOCK
     28226 =C2=B1  3%      -4.0%      27111 =C2=B1  4%      -8.4%      2586=
6 =C2=B1  9%  softirqs.CPU165.RCU
     27029            -2.2%      26426            -1.5%      26625        s=
oftirqs.CPU165.SCHED
    364.00 =C2=B1164%     -88.9%      40.43 =C2=B1109%     -89.8%      37.1=
4 =C2=B1 69%  softirqs.CPU165.TIMER
      0.33 =C2=B1223%    +971.4%       3.57 =C2=B1244%    -100.0%       0.0=
0        softirqs.CPU166.BLOCK
     28637 =C2=B1  4%      -3.9%      27525 =C2=B1  5%      -8.9%      2609=
7 =C2=B1  9%  softirqs.CPU166.RCU
     25817 =C2=B1  6%      -3.9%      24804 =C2=B1 16%      +2.7%      2651=
3        softirqs.CPU166.SCHED
      0.00       +1.4e+101%       0.14 =C2=B1244% +3.9e+102%       3.86 =C2=
=B1244%  softirqs.CPU166.TASKLET
     74.00 =C2=B1143%     -69.9%      22.29 =C2=B1 62%     -28.4%      53.0=
0 =C2=B1 89%  softirqs.CPU166.TIMER
      0.17 =C2=B1223%     -14.3%       0.14 =C2=B1244%   +6842.9%      11.5=
7 =C2=B1221%  softirqs.CPU167.BLOCK
     27467 =C2=B1  5%      +2.0%      28026 =C2=B1  4%      -5.7%      2591=
1 =C2=B1  9%  softirqs.CPU167.RCU
     23984 =C2=B1 25%      +2.7%      24633 =C2=B1 16%      +9.3%      2622=
0        softirqs.CPU167.SCHED
      1301 =C2=B1217%     -97.0%      38.86 =C2=B1 91%     -97.3%      35.7=
1 =C2=B1 92%  softirqs.CPU167.TIMER
      0.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU168.BLOCK
     30267 =C2=B1  3%      -3.6%      29172 =C2=B1  4%      -7.6%      2795=
7 =C2=B1 10%  softirqs.CPU168.RCU
     26161 =C2=B1  4%     -15.5%      22107 =C2=B1 31%      -5.6%      2469=
1 =C2=B1 16%  softirqs.CPU168.SCHED
     21.33 =C2=B1 32%   +4754.2%       1035 =C2=B1239%      -4.2%      20.4=
3 =C2=B1 15%  softirqs.CPU168.TIMER
      4.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU169.BLOCK
     29677            -2.5%      28946 =C2=B1  5%      -6.7%      27690 =C2=
=B1  9%  softirqs.CPU169.RCU
     26439            -0.3%      26362            -7.2%      24528 =C2=B1 1=
9%  softirqs.CPU169.SCHED
     19.33 =C2=B1 26%    +610.1%     137.29 =C2=B1194%     +17.5%      22.7=
1 =C2=B1 17%  softirqs.CPU169.TIMER
      4.83 =C2=B1137%     -17.2%       4.00 =C2=B1244%    +201.5%      14.5=
7 =C2=B1177%  softirqs.CPU17.BLOCK
      7.00 =C2=B1 14%      +2.0%       7.14 =C2=B1 18%     +12.2%       7.8=
6 =C2=B1 15%  softirqs.CPU17.NET_RX
      0.33 =C2=B1223%    -100.0%       0.00           -57.1%       0.14 =C2=
=B1244%  softirqs.CPU17.NET_TX
     35148 =C2=B1  3%      -5.0%      33374 =C2=B1  5%     -13.9%      3026=
9 =C2=B1 17%  softirqs.CPU17.RCU
     26015 =C2=B1  2%      -5.6%      24563 =C2=B1 13%      -6.7%      2426=
3 =C2=B1 17%  softirqs.CPU17.SCHED
     55.67 =C2=B1 22%      -5.0%      52.86 =C2=B1 14%   +5473.5%       310=
2 =C2=B1166%  softirqs.CPU17.TIMER
      0.00          -100.0%       0.00       +5.7e+101%       0.57 =C2=B124=
4%  softirqs.CPU170.BLOCK
     28608 =C2=B1  4%      -3.8%      27532 =C2=B1  6%      -9.6%      2584=
8 =C2=B1  9%  softirqs.CPU170.RCU
     22513 =C2=B1 21%     +21.5%      27344 =C2=B1  6%     +19.1%      2682=
4        softirqs.CPU170.SCHED
      0.00          -100.0%       0.00       +3.4e+102%       3.43 =C2=B124=
4%  softirqs.CPU170.TASKLET
     24.00 =C2=B1 30%     +20.8%      29.00 =C2=B1 90%     +85.7%      44.5=
7 =C2=B1 85%  softirqs.CPU170.TIMER
      0.00       +1.3e+103%      13.00 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU171.BLOCK
     27805            -1.6%      27354 =C2=B1  6%      -7.8%      25625 =C2=
=B1  9%  softirqs.CPU171.RCU
     25228 =C2=B1 16%      +5.6%      26631            -0.7%      25061 =C2=
=B1 16%  softirqs.CPU171.SCHED
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU171.TASKLET
     34.17 =C2=B1 56%    +129.1%      78.29 =C2=B1117%     -23.9%      26.0=
0 =C2=B1 22%  softirqs.CPU171.TIMER
      1.67 =C2=B1175%    -100.0%       0.00           -31.4%       1.14 =C2=
=B1244%  softirqs.CPU172.BLOCK
     29215            -3.3%      28243 =C2=B1  4%      -5.8%      27507 =C2=
=B1  9%  softirqs.CPU172.RCU
     26554            -0.7%      26366            -0.5%      26419        s=
oftirqs.CPU172.SCHED
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU172.TASKLET
     55.33 =C2=B1125%     -63.1%      20.43 =C2=B1 20%     -31.1%      38.1=
4 =C2=B1 61%  softirqs.CPU172.TIMER
     29038            -1.8%      28510 =C2=B1  5%      -6.4%      27167 =C2=
=B1  9%  softirqs.CPU173.RCU
     24825 =C2=B1 15%      +6.8%      26513            +6.3%      26385    =
    softirqs.CPU173.SCHED
     19.17 =C2=B1 10%    +857.8%     183.57 =C2=B1173%     +58.0%      30.2=
9 =C2=B1 34%  softirqs.CPU173.TIMER
      0.00       +3.6e+102%       3.57 =C2=B1244% +6.6e+102%       6.57 =C2=
=B1244%  softirqs.CPU174.BLOCK
     28268            -0.5%      28122 =C2=B1  5%      -5.7%      26659 =C2=
=B1 10%  softirqs.CPU174.RCU
     24159 =C2=B1 23%      -8.1%      22206 =C2=B1 26%      +1.0%      2440=
3 =C2=B1 22%  softirqs.CPU174.SCHED
      0.00       +5.7e+102%       5.71 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU174.TASKLET
     29.83 =C2=B1 44%     -16.7%      24.86 =C2=B1 72%   +1113.9%     362.1=
4 =C2=B1183%  softirqs.CPU174.TIMER
      0.00          -100.0%       0.00       +4.1e+102%       4.14 =C2=B124=
4%  softirqs.CPU175.BLOCK
     28615 =C2=B1  5%      -0.6%      28450 =C2=B1  9%     -10.4%      2563=
4 =C2=B1  9%  softirqs.CPU175.RCU
     26110 =C2=B1  5%      -2.1%      25559 =C2=B1  9%      +2.4%      2674=
9        softirqs.CPU175.SCHED
      0.00       +7.1e+101%       0.71 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU175.TASKLET
     26.17 =C2=B1 38%     +24.5%      32.57 =C2=B1 51%   +3786.1%       101=
6 =C2=B1232%  softirqs.CPU175.TIMER
      7.17 =C2=B1223%      +1.7%       7.29 =C2=B1175%     -14.3%       6.1=
4 =C2=B1244%  softirqs.CPU176.BLOCK
     28514 =C2=B1  3%      -3.0%      27667 =C2=B1  5%      -8.5%      2610=
2 =C2=B1  9%  softirqs.CPU176.RCU
     26142 =C2=B1  4%      -6.1%      24541 =C2=B1 21%      +2.6%      2682=
7        softirqs.CPU176.SCHED
      0.00       +4.3e+101%       0.43 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU176.TASKLET
     24.67 =C2=B1 28%     -17.8%      20.29 =C2=B1 34%     +63.3%      40.2=
9 =C2=B1 91%  softirqs.CPU176.TIMER
      0.17 =C2=B1223%    +928.6%       1.71 =C2=B1244%   +2985.7%       5.1=
4 =C2=B1115%  softirqs.CPU177.BLOCK
     28374            +0.2%      28434 =C2=B1  8%      -7.4%      26285 =C2=
=B1  9%  softirqs.CPU177.RCU
     26391            -5.4%      24960 =C2=B1 16%      +0.7%      26565    =
    softirqs.CPU177.SCHED
     20.83 =C2=B1 15%      +9.0%      22.71 =C2=B1 16%     +20.0%      25.0=
0 =C2=B1 36%  softirqs.CPU177.TIMER
      0.33 =C2=B1223%    +242.9%       1.14 =C2=B1244%    +200.0%       1.0=
0 =C2=B1244%  softirqs.CPU178.BLOCK
     28301 =C2=B1  2%      -3.0%      27447 =C2=B1  6%      -7.8%      2610=
5 =C2=B1  9%  softirqs.CPU178.RCU
     26570            -7.8%      24490 =C2=B1 21%      -0.0%      26567    =
    softirqs.CPU178.SCHED
      0.00          -100.0%       0.00       +2.9e+101%       0.29 =C2=B124=
4%  softirqs.CPU178.TASKLET
     39.83 =C2=B1 66%    +484.9%     233.00 =C2=B1216%    +611.5%     283.4=
3 =C2=B1227%  softirqs.CPU178.TIMER
      0.00       +5.7e+102%       5.71 =C2=B1244% +2.9e+101%       0.29 =C2=
=B1244%  softirqs.CPU179.BLOCK
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  softirqs.CPU179.NET_TX
     29396 =C2=B1  8%      -6.0%      27641 =C2=B1  5%     -11.4%      2603=
8 =C2=B1  9%  softirqs.CPU179.RCU
     25617 =C2=B1  9%      +3.9%      26613            +3.7%      26568    =
    softirqs.CPU179.SCHED
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  softirqs.CPU179.TASKLET
     29.00 =C2=B1 58%    +125.1%      65.29 =C2=B1157%    +840.9%     272.8=
6 =C2=B1227%  softirqs.CPU179.TIMER
      4.00 =C2=B1192%    -100.0%       0.00          +646.4%      29.86 =C2=
=B1148%  softirqs.CPU18.BLOCK
      7.00 =C2=B1 14%      +2.0%       7.14 =C2=B1 18%     +12.2%       7.8=
6 =C2=B1 15%  softirqs.CPU18.NET_RX
     33335 =C2=B1  6%      -7.1%      30958 =C2=B1  6%     -12.2%      2927=
0 =C2=B1 11%  softirqs.CPU18.RCU
     25579 =C2=B1  3%      -4.5%      24422 =C2=B1 15%      +4.1%      2662=
6 =C2=B1  2%  softirqs.CPU18.SCHED
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  softirqs.CPU18.TASKLET
    112.17 =C2=B1 51%    +133.5%     261.86 =C2=B1153%    +394.2%     554.2=
9 =C2=B1164%  softirqs.CPU18.TIMER
      0.00       +7.1e+101%       0.71 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU180.BLOCK
     28366 =C2=B1  2%      -3.0%      27522 =C2=B1  5%      -8.3%      2600=
9 =C2=B1  9%  softirqs.CPU180.RCU
     22329 =C2=B1 29%      +9.9%      24541 =C2=B1 19%      +9.9%      2455=
0 =C2=B1 23%  softirqs.CPU180.SCHED
     19.83 =C2=B1 10%      -0.6%      19.71 =C2=B1 22%   +2509.6%     517.5=
7 =C2=B1228%  softirqs.CPU180.TIMER
      0.00          -100.0%       0.00       +1.7e+102%       1.71 =C2=B124=
4%  softirqs.CPU181.BLOCK
     28416            -1.0%      28119 =C2=B1  5%      -8.0%      26147 =C2=
=B1 10%  softirqs.CPU181.RCU
     26555 =C2=B1  2%      -2.6%      25857 =C2=B1  4%      +0.5%      2669=
6        softirqs.CPU181.SCHED
     23.67 =C2=B1 13%      +3.8%      24.57 =C2=B1 29%   +1474.8%     372.7=
1 =C2=B1214%  softirqs.CPU181.TIMER
      0.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU182.BLOCK
     28200            -2.1%      27615 =C2=B1  6%      -8.5%      25808 =C2=
=B1  9%  softirqs.CPU182.RCU
     24373 =C2=B1 23%      +8.9%      26550 =C2=B1  2%      +9.3%      2663=
6        softirqs.CPU182.SCHED
     22.83 =C2=B1 16%      -2.4%      22.29 =C2=B1 29%   +1044.3%     261.2=
9 =C2=B1220%  softirqs.CPU182.TIMER
      0.00          -100.0%       0.00       +4.4e+102%       4.43 =C2=B116=
3%  softirqs.CPU183.BLOCK
     28278            -0.8%      28050 =C2=B1  7%      -5.2%      26800 =C2=
=B1 11%  softirqs.CPU183.RCU
     24345 =C2=B1 23%      +9.5%      26646            +9.9%      26760    =
    softirqs.CPU183.SCHED
     26.83 =C2=B1 58%     +11.3%      29.86 =C2=B1 19%      +5.9%      28.4=
3 =C2=B1 65%  softirqs.CPU183.TIMER
      0.00         +1e+102%       1.00 =C2=B1244% +4.3e+102%       4.29 =C2=
=B1244%  softirqs.CPU184.BLOCK
     28269 =C2=B1  2%      -2.2%      27636 =C2=B1  5%      -7.6%      2610=
8 =C2=B1  9%  softirqs.CPU184.RCU
     24038 =C2=B1 24%     +10.8%      26630            +3.1%      24785 =C2=
=B1 20%  softirqs.CPU184.SCHED
    225.83 =C2=B1187%     -91.6%      18.86 =C2=B1  7%     -90.4%      21.5=
7 =C2=B1 29%  softirqs.CPU184.TIMER
      0.33 =C2=B1223%   +1400.0%       5.00 =C2=B1200%    +371.4%       1.5=
7 =C2=B1244%  softirqs.CPU185.BLOCK
     27856 =C2=B1  3%      -0.5%      27727 =C2=B1  6%      -6.2%      2613=
3 =C2=B1  9%  softirqs.CPU185.RCU
     26577            +0.7%      26755            +0.5%      26718        s=
oftirqs.CPU185.SCHED
      0.00       +2.9e+101%       0.29 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU185.TASKLET
    923.67 =C2=B1218%     -43.7%     520.43 =C2=B1230%     -97.8%      20.5=
7 =C2=B1 18%  softirqs.CPU185.TIMER
      0.00       +1.6e+102%       1.57 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU186.BLOCK
     28420 =C2=B1  2%      -1.4%      28022 =C2=B1  6%      -7.6%      2624=
8 =C2=B1  9%  softirqs.CPU186.RCU
     24239 =C2=B1 24%     +10.5%      26794            +1.3%      24556 =C2=
=B1 21%  softirqs.CPU186.SCHED
      0.00          -100.0%       0.00       +8.3e+102%       8.29 =C2=B124=
4%  softirqs.CPU186.TASKLET
     53.17 =C2=B1133%    +391.2%     261.14 =C2=B1218%     -60.2%      21.1=
4 =C2=B1 17%  softirqs.CPU186.TIMER
     28336            -2.1%      27728 =C2=B1  5%      -7.3%      26262 =C2=
=B1  9%  softirqs.CPU187.RCU
     24833 =C2=B1 17%      +7.6%      26721            -0.7%      24663 =C2=
=B1 20%  softirqs.CPU187.SCHED
     37.83 =C2=B1 96%     +39.7%      52.86 =C2=B1 99%     -23.0%      29.1=
4 =C2=B1 41%  softirqs.CPU187.TIMER
      8.83 =C2=B1175%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU188.BLOCK
     28368 =C2=B1  2%      -2.7%      27598 =C2=B1  6%      -7.5%      2623=
8 =C2=B1  9%  softirqs.CPU188.RCU
     26817            -7.0%      24934 =C2=B1 18%      -0.5%      26684    =
    softirqs.CPU188.SCHED
     34.00 =C2=B1 92%     -26.9%      24.86 =C2=B1 24%    +641.6%     252.1=
4 =C2=B1184%  softirqs.CPU188.TIMER
      6.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU189.BLOCK
     28228 =C2=B1  2%      -2.0%      27656 =C2=B1  5%      -8.0%      2597=
7 =C2=B1  9%  softirqs.CPU189.RCU
     26724            -8.3%      24498 =C2=B1 21%      -0.1%      26703    =
    softirqs.CPU189.SCHED
     19.33 =C2=B1 33%    +140.9%      46.57 =C2=B1105%     +96.6%      38.0=
0 =C2=B1 89%  softirqs.CPU189.TIMER
      0.33 =C2=B1223%   +1142.9%       4.14 =C2=B1244%     +28.6%       0.4=
3 =C2=B1244%  softirqs.CPU19.BLOCK
      7.00 =C2=B1 14%      +2.0%       7.14 =C2=B1 18%     +12.2%       7.8=
6 =C2=B1 15%  softirqs.CPU19.NET_RX
     31168 =C2=B1  3%      -4.2%      29861 =C2=B1  7%      -4.0%      2991=
2 =C2=B1 16%  softirqs.CPU19.RCU
     26602           -20.4%      21183 =C2=B1 30%     -11.6%      23503 =C2=
=B1 16%  softirqs.CPU19.SCHED
     83.83 =C2=B1100%   +2018.0%       1775 =C2=B1156%   +1613.1%       143=
6 =C2=B1233%  softirqs.CPU19.TIMER
      5.83 =C2=B1145%     -82.9%       1.00 =C2=B1244%     -65.7%       2.0=
0 =C2=B1207%  softirqs.CPU190.BLOCK
     28077 =C2=B1  2%      -1.6%      27619 =C2=B1  5%      -5.5%      2652=
2 =C2=B1 11%  softirqs.CPU190.RCU
     21805 =C2=B1 32%     +22.0%      26598           +22.1%      26617    =
    softirqs.CPU190.SCHED
     21.00 =C2=B1 21%    +374.1%      99.57 =C2=B1161%     +15.6%      24.2=
9 =C2=B1 62%  softirqs.CPU190.TIMER
      0.00          -100.0%       0.00       +4.4e+102%       4.43 =C2=B124=
4%  softirqs.CPU191.BLOCK
     28414 =C2=B1  2%      -2.5%      27718 =C2=B1  6%      -7.3%      2634=
3 =C2=B1  9%  softirqs.CPU191.RCU
     12812 =C2=B1 17%      +0.9%      12922 =C2=B1 19%      -9.6%      1158=
0 =C2=B1 14%  softirqs.CPU191.SCHED
     21.50 =C2=B1 20%    +242.2%      73.57 =C2=B1111%     +30.9%      28.1=
4 =C2=B1 44%  softirqs.CPU191.TIMER
      7.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU192.BLOCK
     26774 =C2=B1  9%      +2.4%      27409 =C2=B1  5%      -2.8%      2603=
2 =C2=B1  9%  softirqs.CPU192.RCU
     24520 =C2=B1 19%      -2.9%      23813 =C2=B1 21%      -7.6%      2266=
3 =C2=B1 27%  softirqs.CPU192.SCHED
      2.67 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU192.TASKLET
      2331 =C2=B1220%     -99.1%      20.86 =C2=B1 64%     -99.3%      17.1=
4 =C2=B1 29%  softirqs.CPU192.TIMER
     27833 =C2=B1  2%      -2.1%      27261 =C2=B1  7%      -6.6%      2599=
2 =C2=B1  5%  softirqs.CPU193.RCU
     24306 =C2=B1 18%     -14.9%      20689 =C2=B1 35%      +1.2%      2460=
0 =C2=B1 23%  softirqs.CPU193.SCHED
      0.17 =C2=B1223%    -100.0%       0.00           -14.3%       0.14 =C2=
=B1244%  softirqs.CPU193.TASKLET
     41.33 =C2=B1 49%     +33.8%      55.29 =C2=B1 76%    +889.9%     409.1=
4 =C2=B1225%  softirqs.CPU193.TIMER
      2.83 =C2=B1223%     +76.5%       5.00 =C2=B1244%     -84.9%       0.4=
3 =C2=B1169%  softirqs.CPU194.BLOCK
     29178            -0.6%      28997 =C2=B1  5%      -7.7%      26933 =C2=
=B1 10%  softirqs.CPU194.RCU
     26513            -0.9%      26281 =C2=B1  2%      -1.1%      26223 =C2=
=B1  2%  softirqs.CPU194.SCHED
      0.00       +4.3e+101%       0.43 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU194.TASKLET
     51.33 =C2=B1105%     -25.4%      38.29 =C2=B1 82%     -40.4%      30.5=
7 =C2=B1 38%  softirqs.CPU194.TIMER
     11.83 =C2=B1223%     -52.9%       5.57 =C2=B1187%     -51.7%       5.7=
1 =C2=B1244%  softirqs.CPU195.BLOCK
     29756            -3.2%      28813 =C2=B1  5%      -6.6%      27789 =C2=
=B1 12%  softirqs.CPU195.RCU
     26491            -0.3%      26424            -2.9%      25728 =C2=B1  =
6%  softirqs.CPU195.SCHED
    109.83 =C2=B1 22%     -20.5%      87.29 =C2=B1 37%     -14.9%      93.4=
3 =C2=B1 28%  softirqs.CPU195.TIMER
      2.50 =C2=B1223%    -100.0%       0.00           -20.0%       2.00 =C2=
=B1244%  softirqs.CPU196.BLOCK
     28956 =C2=B1  3%      -3.2%      28018 =C2=B1  7%      -8.7%      2642=
4 =C2=B1  9%  softirqs.CPU196.RCU
     26758            -8.3%      24542 =C2=B1 21%      -0.4%      26640    =
    softirqs.CPU196.SCHED
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU196.TASKLET
     23.50 =C2=B1 45%    +233.1%      78.29 =C2=B1120%     +36.2%      32.0=
0 =C2=B1 84%  softirqs.CPU196.TIMER
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU197.BLOCK
     28516 =C2=B1  2%      -1.4%      28113 =C2=B1  7%      -6.8%      2656=
4 =C2=B1  8%  softirqs.CPU197.RCU
     26418            +1.5%      26823            +0.8%      26618        s=
oftirqs.CPU197.SCHED
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU197.TASKLET
     98.00 =C2=B1  6%     +38.5%     135.71 =C2=B1 58%      -6.7%      91.4=
3 =C2=B1  8%  softirqs.CPU197.TIMER
      1.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU198.BLOCK
     28824 =C2=B1  2%      -0.9%      28558 =C2=B1  8%      -6.1%      2705=
1 =C2=B1  6%  softirqs.CPU198.RCU
     26882            -0.8%      26666           -10.8%      23973 =C2=B1 2=
2%  softirqs.CPU198.SCHED
     41.67 =C2=B1 83%    +213.0%     130.43 =C2=B1131%    +194.5%     122.7=
1 =C2=B1139%  softirqs.CPU198.TIMER
      2.33 =C2=B1223%     -81.6%       0.43 =C2=B1244%    -100.0%       0.0=
0        softirqs.CPU199.BLOCK
     28826 =C2=B1  3%      +1.4%      29242 =C2=B1  8%      -5.8%      2716=
0 =C2=B1  9%  softirqs.CPU199.RCU
     26494            -4.5%      25303 =C2=B1 14%      +0.3%      26581 =C2=
=B1  2%  softirqs.CPU199.SCHED
     92.00 =C2=B1 27%     +77.0%     162.86 =C2=B1 85%     +21.0%     111.2=
9 =C2=B1 43%  softirqs.CPU199.TIMER
      2.83 =C2=B1193%    +842.9%      26.71 =C2=B1158%    +137.0%       6.7=
1 =C2=B1216%  softirqs.CPU2.BLOCK
     39675 =C2=B1  7%     -10.6%      35466 =C2=B1  8%     -11.9%      3493=
7 =C2=B1 12%  softirqs.CPU2.RCU
     21463 =C2=B1 29%     +20.9%      25939 =C2=B1  5%     +20.7%      2590=
3 =C2=B1  3%  softirqs.CPU2.SCHED
      0.00       +1.9e+102%       1.86 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU2.TASKLET
    502.17 =C2=B1177%     +90.6%     957.29 =C2=B1222%     -30.6%     348.5=
7 =C2=B1138%  softirqs.CPU2.TIMER
      4.33 =C2=B1223%     -90.1%       0.43 =C2=B1244%    -100.0%       0.0=
0        softirqs.CPU20.BLOCK
      7.00 =C2=B1 14%      +2.0%       7.14 =C2=B1 18%     +12.2%       7.8=
6 =C2=B1 15%  softirqs.CPU20.NET_RX
     34517 =C2=B1  4%      -4.3%      33031 =C2=B1  4%      -7.9%      3178=
9 =C2=B1 10%  softirqs.CPU20.RCU
     24308 =C2=B1 16%      +5.1%      25551 =C2=B1  2%      +4.5%      2540=
2 =C2=B1  3%  softirqs.CPU20.SCHED
     84.50 =C2=B1 16%     +27.6%     107.86 =C2=B1 52%    +427.8%     446.0=
0 =C2=B1154%  softirqs.CPU20.TIMER
     28777            -2.9%      27939 =C2=B1  6%      -4.8%      27391 =C2=
=B1 12%  softirqs.CPU200.RCU
     26783            -0.7%      26596            -2.9%      26013 =C2=B1  =
8%  softirqs.CPU200.SCHED
      5.50 =C2=B1223%     -97.4%       0.14 =C2=B1244%    -100.0%       0.0=
0        softirqs.CPU200.TASKLET
    231.33 =C2=B1205%     -50.1%     115.43 =C2=B1108%    +186.4%     662.5=
7 =C2=B1213%  softirqs.CPU200.TIMER
      0.00       +1.3e+103%      12.86 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU201.BLOCK
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  softirqs.CPU201.NET_TX
     29402 =C2=B1  6%      -3.0%      28507 =C2=B1  6%      -9.0%      2674=
2 =C2=B1  9%  softirqs.CPU201.RCU
     26507            +0.5%      26645            -0.8%      26291 =C2=B1  =
2%  softirqs.CPU201.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU201.TASKLET
    110.33 =C2=B1 43%    +254.1%     390.71 =C2=B1173%     -15.8%      92.8=
6 =C2=B1 29%  softirqs.CPU201.TIMER
      1.33 =C2=B1223%     -14.3%       1.14 =C2=B1211%     -89.3%       0.1=
4 =C2=B1244%  softirqs.CPU202.BLOCK
     28530 =C2=B1  2%      -1.5%      28091 =C2=B1  6%      -5.3%      2700=
8 =C2=B1  9%  softirqs.CPU202.RCU
     26691            -0.0%      26680            -9.9%      24045 =C2=B1 2=
2%  softirqs.CPU202.SCHED
      0.83 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU202.TASKLET
     25.50 =C2=B1 36%     +19.9%      30.57 =C2=B1 92%     +13.7%      29.0=
0 =C2=B1 53%  softirqs.CPU202.TIMER
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU203.BLOCK
     28761 =C2=B1  2%      -0.5%      28604 =C2=B1  7%      -6.6%      2687=
5 =C2=B1  9%  softirqs.CPU203.RCU
     23861 =C2=B1 24%      -9.5%      21604 =C2=B1 30%      +0.4%      2394=
5 =C2=B1 21%  softirqs.CPU203.SCHED
      0.83 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU203.TASKLET
    100.83 =C2=B1 12%     -12.0%      88.71 =C2=B1 10%      -4.5%      96.2=
9 =C2=B1 34%  softirqs.CPU203.TIMER
      0.00       +4.1e+102%       4.14 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU204.BLOCK
     28691            -3.3%      27743 =C2=B1  5%      -7.7%      26488 =C2=
=B1  9%  softirqs.CPU204.RCU
     22172 =C2=B1 29%      +7.1%      23746 =C2=B1 22%     +20.2%      2665=
4        softirqs.CPU204.SCHED
     46.50 =C2=B1128%     -52.4%      22.14 =C2=B1 35%     +41.9%      66.0=
0 =C2=B1127%  softirqs.CPU204.TIMER
      0.33 =C2=B1223%    -100.0%       0.00           -57.1%       0.14 =C2=
=B1244%  softirqs.CPU205.BLOCK
     28557            -0.1%      28533 =C2=B1  7%      -6.5%      26701 =C2=
=B1  9%  softirqs.CPU205.RCU
     26578            -8.1%      24420 =C2=B1 22%      -7.1%      24685 =C2=
=B1 17%  softirqs.CPU205.SCHED
    600.83 =C2=B1188%     -85.0%      90.00 =C2=B1 24%     -83.3%     100.1=
4 =C2=B1 17%  softirqs.CPU205.TIMER
      0.00       +1.9e+102%       1.86 =C2=B1244% +1.4e+102%       1.43 =C2=
=B1193%  softirqs.CPU206.BLOCK
     28913 =C2=B1  2%      -1.5%      28476 =C2=B1  8%      -7.7%      2669=
2 =C2=B1  9%  softirqs.CPU206.RCU
     24561 =C2=B1 24%      +8.2%      26583            +9.0%      26759    =
    softirqs.CPU206.SCHED
      0.67 =C2=B1223%    -100.0%       0.00          +242.9%       2.29 =C2=
=B1244%  softirqs.CPU206.TASKLET
    500.17 =C2=B1204%     -21.5%     392.86 =C2=B1211%     -15.4%     423.2=
9 =C2=B1121%  softirqs.CPU206.TIMER
     21.17 =C2=B1217%    -100.0%       0.00           -98.7%       0.29 =C2=
=B1244%  softirqs.CPU207.BLOCK
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  softirqs.CPU207.NET_TX
     28626 =C2=B1  2%      -2.0%      28041 =C2=B1  5%      -6.6%      2673=
4 =C2=B1  9%  softirqs.CPU207.RCU
     26408            -7.6%      24388 =C2=B1 21%     -15.4%      22341 =C2=
=B1 30%  softirqs.CPU207.SCHED
      1.33 =C2=B1223%    -100.0%       0.00          +200.0%       4.00 =C2=
=B1244%  softirqs.CPU207.TASKLET
    128.00 =C2=B1 64%     -24.2%      97.00 =C2=B1 18%     -20.2%     102.1=
4 =C2=B1 14%  softirqs.CPU207.TIMER
      1.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU208.BLOCK
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU208.NET_TX
     29941            -2.6%      29176 =C2=B1  7%      -3.2%      28981 =C2=
=B1 13%  softirqs.CPU208.RCU
     25194 =C2=B1 16%      +4.7%      26383            +1.7%      25626 =C2=
=B1  5%  softirqs.CPU208.SCHED
      1200 =C2=B1212%     -96.7%      39.86 =C2=B1 70%     -95.1%      58.8=
6 =C2=B1 82%  softirqs.CPU208.TIMER
      1.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU209.BLOCK
     29999            -2.6%      29216 =C2=B1  6%      -6.4%      28093 =C2=
=B1 10%  softirqs.CPU209.RCU
     22122 =C2=B1 27%     +19.0%      26319           +11.5%      24666 =C2=
=B1 16%  softirqs.CPU209.SCHED
     94.50 =C2=B1 14%      +1.6%      96.00 =C2=B1 12%     +31.4%     124.1=
4 =C2=B1115%  softirqs.CPU209.TIMER
      0.00          -100.0%       0.00       +2.9e+101%       0.29 =C2=B124=
4%  softirqs.CPU21.BLOCK
     36226 =C2=B1  5%      -4.3%      34669 =C2=B1  9%     -11.1%      3218=
8 =C2=B1  9%  softirqs.CPU21.RCU
     25280 =C2=B1 11%      -1.8%      24822 =C2=B1 17%      -4.3%      2420=
5 =C2=B1 22%  softirqs.CPU21.SCHED
     51.33 =C2=B1 26%    +525.9%     321.29 =C2=B1208%   +1061.0%     596.0=
0 =C2=B1202%  softirqs.CPU21.TIMER
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  softirqs.CPU210.BLOCK
     28551 =C2=B1  2%      -2.2%      27933 =C2=B1  8%      -7.3%      2645=
8 =C2=B1  9%  softirqs.CPU210.RCU
     26585            -0.5%      26444            -7.9%      24478 =C2=B1 2=
2%  softirqs.CPU210.SCHED
     43.67 =C2=B1 70%     -56.5%      19.00 =C2=B1 18%     -22.5%      33.8=
6 =C2=B1 76%  softirqs.CPU210.TIMER
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU211.NET_TX
     28613            -2.0%      28031 =C2=B1  6%      -6.2%      26839 =C2=
=B1 10%  softirqs.CPU211.RCU
     24135 =C2=B1 21%      -6.2%      22638 =C2=B1 27%      +9.3%      2638=
9 =C2=B1  2%  softirqs.CPU211.SCHED
    104.67 =C2=B1 21%     -19.5%      84.29 =C2=B1 35%      -3.9%     100.5=
7 =C2=B1 53%  softirqs.CPU211.TIMER
      0.00          -100.0%       0.00         +1e+102%       1.00 =C2=B124=
4%  softirqs.CPU212.BLOCK
     28275 =C2=B1  3%      -2.8%      27490 =C2=B1  6%      -7.8%      2605=
7 =C2=B1  9%  softirqs.CPU212.RCU
     24521 =C2=B1 20%      -0.5%      24404 =C2=B1 22%      +8.7%      2665=
4        softirqs.CPU212.SCHED
     31.17 =C2=B1 53%     -21.6%      24.43 =C2=B1 50%    +359.3%     143.1=
4 =C2=B1167%  softirqs.CPU212.TIMER
     29496 =C2=B1  2%      -4.6%      28139 =C2=B1  4%      -7.9%      2717=
7 =C2=B1  8%  softirqs.CPU213.RCU
     26357            -6.0%      24785 =C2=B1 16%      -6.3%      24685 =C2=
=B1 16%  softirqs.CPU213.SCHED
    113.33 =C2=B1 38%     -20.6%      90.00 =C2=B1  8%    +391.3%     556.8=
6 =C2=B1123%  softirqs.CPU213.TIMER
      0.00       +1.7e+102%       1.71 =C2=B1244% +3.9e+102%       3.86 =C2=
=B1116%  softirqs.CPU214.BLOCK
     29736 =C2=B1  7%      -6.2%      27885 =C2=B1  7%     -10.7%      2655=
6 =C2=B1  9%  softirqs.CPU214.RCU
     24976 =C2=B1 12%      +6.8%      26675            +6.8%      26685    =
    softirqs.CPU214.SCHED
     33.67 =C2=B1 66%    +164.8%      89.14 =C2=B1157%     +16.3%      39.1=
4 =C2=B1116%  softirqs.CPU214.TIMER
      0.00       +5.7e+101%       0.57 =C2=B1158%    -100.0%       0.00    =
    softirqs.CPU215.BLOCK
     28679 =C2=B1  2%      -1.8%      28167 =C2=B1  7%      -5.6%      2708=
5 =C2=B1 10%  softirqs.CPU215.RCU
     23916 =C2=B1 25%     +11.0%      26547           +11.4%      26634    =
    softirqs.CPU215.SCHED
    163.83 =C2=B1 81%     -38.4%     100.86 =C2=B1 18%     -14.2%     140.5=
7 =C2=B1 38%  softirqs.CPU215.TIMER
      1.17 =C2=B1223%    -100.0%       0.00           +34.7%       1.57 =C2=
=B1159%  softirqs.CPU216.BLOCK
     28337 =C2=B1  2%      -0.8%      28112 =C2=B1  8%      -7.3%      2627=
6 =C2=B1  9%  softirqs.CPU216.RCU
     26654            -0.5%      26515            +0.1%      26674        s=
oftirqs.CPU216.SCHED
      0.00          -100.0%       0.00       +1.7e+102%       1.71 =C2=B124=
4%  softirqs.CPU216.TASKLET
     33.67 =C2=B1 83%     -14.7%      28.71 =C2=B1 49%     -23.2%      25.8=
6 =C2=B1 31%  softirqs.CPU216.TIMER
      0.00       +1.4e+103%      14.14 =C2=B1222%    -100.0%       0.00    =
    softirqs.CPU217.BLOCK
     28821 =C2=B1  2%      -2.4%      28122 =C2=B1  7%      -7.8%      2657=
1 =C2=B1  9%  softirqs.CPU217.RCU
     23938 =C2=B1 23%     +11.5%      26693           +10.5%      26457    =
    softirqs.CPU217.SCHED
      0.00          -100.0%       0.00       +1.1e+102%       1.14 =C2=B124=
4%  softirqs.CPU217.TASKLET
    444.50 =C2=B1171%     -76.9%     102.57 =C2=B1 10%     -65.4%     153.7=
1 =C2=B1 43%  softirqs.CPU217.TIMER
      0.00       +8.6e+101%       0.86 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU218.BLOCK
     29874            -2.3%      29187 =C2=B1  5%      -7.8%      27555 =C2=
=B1 10%  softirqs.CPU218.RCU
     26587            -2.9%      25806 =C2=B1  5%      -0.3%      26500    =
    softirqs.CPU218.SCHED
      0.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU218.TASKLET
     20.17 =C2=B1 17%     +31.8%      26.57 =C2=B1 44%     +10.5%      22.2=
9 =C2=B1 19%  softirqs.CPU218.TIMER
      0.33 =C2=B1223%    -100.0%       0.00         +6928.6%      23.43 =C2=
=B1244%  softirqs.CPU219.BLOCK
     30282            -1.9%      29719 =C2=B1  6%      -8.3%      27769 =C2=
=B1 10%  softirqs.CPU219.RCU
     26455            -1.3%      26120 =C2=B1  2%      -9.1%      24051 =C2=
=B1 22%  softirqs.CPU219.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU219.TASKLET
     99.83 =C2=B1  3%      -9.1%      90.71 =C2=B1 28%     -10.9%      89.0=
0 =C2=B1 25%  softirqs.CPU219.TIMER
      2.00 =C2=B1223%    +128.6%       4.57 =C2=B1244%     -35.7%       1.2=
9 =C2=B1244%  softirqs.CPU22.BLOCK
     34636 =C2=B1  5%      -1.9%      33974 =C2=B1  4%      -9.2%      3146=
6 =C2=B1 10%  softirqs.CPU22.RCU
     24893 =C2=B1  7%      +2.1%      25407 =C2=B1  4%      +3.9%      2586=
3 =C2=B1  3%  softirqs.CPU22.SCHED
    111.17 =C2=B1 42%     -12.9%      96.86 =C2=B1 20%     -34.1%      73.2=
9 =C2=B1 20%  softirqs.CPU22.TIMER
      0.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU220.BLOCK
     28574 =C2=B1  2%      +2.2%      29188 =C2=B1 12%      -7.5%      2643=
5 =C2=B1  9%  softirqs.CPU220.RCU
     23967 =C2=B1 24%      -5.3%      22696 =C2=B1 26%      -4.7%      2284=
6 =C2=B1 26%  softirqs.CPU220.SCHED
      4.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU220.TASKLET
     68.67 =C2=B1150%    +104.9%     140.71 =C2=B1176%     -67.1%      22.5=
7 =C2=B1 27%  softirqs.CPU220.TIMER
      0.00       +2.9e+101%       0.29 =C2=B1244% +1.5e+103%      15.29 =C2=
=B1244%  softirqs.CPU221.BLOCK
     28661 =C2=B1  2%      -2.4%      27979 =C2=B1  6%      -6.7%      2674=
2 =C2=B1  8%  softirqs.CPU221.RCU
     26659            -4.9%      25339 =C2=B1 12%      -8.7%      24335 =C2=
=B1 22%  softirqs.CPU221.SCHED
      0.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU221.TASKLET
    130.00 =C2=B1 56%     -36.0%      83.14 =C2=B1 22%     -22.4%     100.8=
6 =C2=B1  7%  softirqs.CPU221.TIMER
      0.00       +4.3e+101%       0.43 =C2=B1169%    -100.0%       0.00    =
    softirqs.CPU222.BLOCK
     28689 =C2=B1  2%      -2.8%      27884 =C2=B1  6%      -7.0%      2668=
9 =C2=B1 11%  softirqs.CPU222.RCU
     26794            -7.0%      24926 =C2=B1 16%      -6.4%      25081 =C2=
=B1 15%  softirqs.CPU222.SCHED
     95.83 =C2=B1144%    +126.0%     216.57 =C2=B1223%     -53.8%      44.2=
9 =C2=B1117%  softirqs.CPU222.TIMER
      0.00       +8.6e+101%       0.86 =C2=B1244% +1.4e+101%       0.14 =C2=
=B1244%  softirqs.CPU223.BLOCK
     27287 =C2=B1  5%      -1.1%      26982 =C2=B1  6%      -3.8%      2625=
6 =C2=B1 10%  softirqs.CPU223.RCU
     23826 =C2=B1 24%      +9.1%      26000 =C2=B1  7%      -5.4%      2253=
1 =C2=B1 28%  softirqs.CPU223.SCHED
      0.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU223.TASKLET
      1282 =C2=B1201%     +24.9%       1601 =C2=B1231%     -78.5%     276.2=
9 =C2=B1162%  softirqs.CPU223.TIMER
     28542 =C2=B1  2%      -2.9%      27700 =C2=B1  5%      -6.8%      2661=
1 =C2=B1 10%  softirqs.CPU224.RCU
     26662            -0.6%      26489            -6.3%      24992 =C2=B1 1=
7%  softirqs.CPU224.SCHED
     19.67 =C2=B1 28%    +420.8%     102.43 =C2=B1165%   +1134.9%     242.8=
6 =C2=B1132%  softirqs.CPU224.TIMER
     17.67 =C2=B1179%     -76.5%       4.14 =C2=B1244%    -100.0%       0.0=
0        softirqs.CPU225.BLOCK
     29123            -2.5%      28385 =C2=B1  7%      -8.8%      26557 =C2=
=B1  8%  softirqs.CPU225.RCU
     26487            -1.8%      26019 =C2=B1  3%     -13.4%      22930 =C2=
=B1 24%  softirqs.CPU225.SCHED
    110.33 =C2=B1  3%      +2.8%     113.43 =C2=B1 27%    +114.2%     236.2=
9 =C2=B1117%  softirqs.CPU225.TIMER
     28496 =C2=B1  2%      -2.2%      27882 =C2=B1  6%      -7.7%      2631=
3 =C2=B1  9%  softirqs.CPU226.RCU
     26198 =C2=B1  6%      +1.1%      26497            +1.9%      26698    =
    softirqs.CPU226.SCHED
     24.33 =C2=B1 28%      -6.7%      22.71 =C2=B1 20%     -20.7%      19.2=
9 =C2=B1 21%  softirqs.CPU226.TIMER
      1.67 =C2=B1175%    -100.0%       0.00           -82.9%       0.29 =C2=
=B1244%  softirqs.CPU227.BLOCK
     28597            -0.9%      28342 =C2=B1  8%      -6.8%      26664 =C2=
=B1  9%  softirqs.CPU227.RCU
     26349 =C2=B1  2%      -4.4%      25198 =C2=B1 14%      -5.7%      2485=
1 =C2=B1 17%  softirqs.CPU227.SCHED
    102.67 =C2=B1 39%      +3.9%     106.71 =C2=B1 10%      +6.0%     108.8=
6 =C2=B1 36%  softirqs.CPU227.TIMER
      0.00       +5.7e+102%       5.71 =C2=B1244% +4.3e+102%       4.29 =C2=
=B1235%  softirqs.CPU228.BLOCK
     28848 =C2=B1  2%      -3.7%      27784 =C2=B1  6%      -8.3%      2645=
7 =C2=B1  9%  softirqs.CPU228.RCU
     24034 =C2=B1 24%     -14.5%      20542 =C2=B1 33%     +10.8%      2664=
0        softirqs.CPU228.SCHED
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  softirqs.CPU228.TASKLET
     62.50 =C2=B1 97%     -62.5%      23.43 =C2=B1 55%     -60.2%      24.8=
6 =C2=B1 61%  softirqs.CPU228.TIMER
      2.50 =C2=B1190%    +322.9%      10.57 =C2=B1163%     -94.3%       0.1=
4 =C2=B1244%  softirqs.CPU229.BLOCK
     29169            -3.2%      28245 =C2=B1  5%      -7.2%      27082 =C2=
=B1  9%  softirqs.CPU229.RCU
     26535            -8.2%      24356 =C2=B1 22%      -0.3%      26444    =
    softirqs.CPU229.SCHED
    147.67 =C2=B1 52%     -33.5%      98.14 =C2=B1 20%     -31.3%     101.4=
3 =C2=B1 14%  softirqs.CPU229.TIMER
      0.33 =C2=B1223%    -100.0%       0.00          +371.4%       1.57 =C2=
=B1166%  softirqs.CPU23.BLOCK
     34421 =C2=B1  7%      +0.3%      34507 =C2=B1  4%      -9.5%      3115=
6 =C2=B1 11%  softirqs.CPU23.RCU
     25965 =C2=B1  2%      -5.5%      24534 =C2=B1 16%      +1.5%      2634=
8 =C2=B1  2%  softirqs.CPU23.SCHED
    121.83 =C2=B1124%     -27.1%      88.86 =C2=B1 78%     -43.6%      68.7=
1 =C2=B1 71%  softirqs.CPU23.TIMER
      0.17 =C2=B1223%    +242.9%       0.57 =C2=B1244%    -100.0%       0.0=
0        softirqs.CPU230.BLOCK
     29954 =C2=B1 14%      -8.2%      27500 =C2=B1  5%      -9.7%      2705=
5 =C2=B1 13%  softirqs.CPU230.RCU
     24746 =C2=B1 19%      +0.8%      24955 =C2=B1 16%      +8.4%      2683=
3        softirqs.CPU230.SCHED
      1220 =C2=B1216%     -98.0%      24.86 =C2=B1 71%     -78.2%     266.1=
4 =C2=B1225%  softirqs.CPU230.TIMER
      4.33 =C2=B1223%     -76.9%       1.00 =C2=B1244%      -1.1%       4.2=
9 =C2=B1244%  softirqs.CPU231.BLOCK
     28823 =C2=B1  2%      +0.9%      29086 =C2=B1  9%      -5.5%      2723=
2 =C2=B1 10%  softirqs.CPU231.RCU
     26824            -6.0%      25212 =C2=B1 12%      -1.4%      26455    =
    softirqs.CPU231.SCHED
    769.67 =C2=B1195%     -87.2%      98.57 =C2=B1 13%     -43.6%     434.1=
4 =C2=B1175%  softirqs.CPU231.TIMER
      2.33 =C2=B1223%    -100.0%       0.00           +40.8%       3.29 =C2=
=B1181%  softirqs.CPU232.BLOCK
     30943            -2.9%      30046 =C2=B1  5%      -8.1%      28422 =C2=
=B1  9%  softirqs.CPU232.RCU
     23471 =C2=B1 24%      +3.9%      24376 =C2=B1 21%      +2.9%      2414=
2 =C2=B1 21%  softirqs.CPU232.SCHED
     70.83 =C2=B1149%    +157.5%     182.43 =C2=B1215%     -69.5%      21.5=
7 =C2=B1 43%  softirqs.CPU232.TIMER
      0.33 =C2=B1223%   +2385.7%       8.29 =C2=B1154%    -100.0%       0.0=
0        softirqs.CPU233.BLOCK
     31311 =C2=B1  3%      -4.4%      29937 =C2=B1  5%      -9.2%      2842=
9 =C2=B1 10%  softirqs.CPU233.RCU
     24714 =C2=B1 16%      +6.8%      26403            +6.7%      26363    =
    softirqs.CPU233.SCHED
     95.50 =C2=B1 42%      +2.5%      97.86 =C2=B1 52%      +2.6%      98.0=
0 =C2=B1  5%  softirqs.CPU233.TIMER
      0.00       +1.4e+101%       0.14 =C2=B1244% +1.1e+102%       1.14 =C2=
=B1244%  softirqs.CPU234.BLOCK
     32047            -3.6%      30888 =C2=B1  3%      -7.2%      29747 =C2=
=B1 10%  softirqs.CPU234.RCU
     24661 =C2=B1 16%      +6.6%      26288            +6.7%      26309    =
    softirqs.CPU234.SCHED
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU234.TASKLET
     26.67 =C2=B1 69%     +21.6%      32.43 =C2=B1 54%     -22.3%      20.7=
1 =C2=B1 19%  softirqs.CPU234.TIMER
      0.50 =C2=B1223%    +185.7%       1.43 =C2=B1217%    -100.0%       0.0=
0        softirqs.CPU235.BLOCK
     32133 =C2=B1  2%      -3.6%      30976 =C2=B1  2%      -7.4%      2976=
3 =C2=B1 10%  softirqs.CPU235.RCU
     24729 =C2=B1 16%      -2.5%      24103 =C2=B1 21%      +6.1%      2623=
5        softirqs.CPU235.SCHED
     89.17 =C2=B1 20%     +43.4%     127.86 =C2=B1 67%     +69.8%     151.4=
3 =C2=B1 72%  softirqs.CPU235.TIMER
      0.00          -100.0%       0.00       +4.3e+101%       0.43 =C2=B124=
4%  softirqs.CPU236.BLOCK
     31517 =C2=B1  3%      +2.1%      32180 =C2=B1  9%      -8.3%      2890=
7 =C2=B1 10%  softirqs.CPU236.RCU
     23909 =C2=B1 23%      +0.9%      24118 =C2=B1 22%     +10.5%      2642=
8        softirqs.CPU236.SCHED
     30.17 =C2=B1108%     +30.7%      39.43 =C2=B1 84%     +27.9%      38.5=
7 =C2=B1 66%  softirqs.CPU236.TIMER
     14.83 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU237.BLOCK
     31451 =C2=B1  4%      -0.3%      31357 =C2=B1  6%      -6.6%      2938=
4 =C2=B1 10%  softirqs.CPU237.RCU
     26202 =C2=B1  2%      +0.4%      26319            +0.7%      26385    =
    softirqs.CPU237.SCHED
    100.67 =C2=B1  3%    +201.6%     303.57 =C2=B1170%     +11.5%     112.2=
9 =C2=B1 61%  softirqs.CPU237.TIMER
     28738 =C2=B1  2%      +0.2%      28798 =C2=B1  8%      -7.8%      2650=
7 =C2=B1  9%  softirqs.CPU238.RCU
     26758            -8.4%      24517 =C2=B1 14%      -6.0%      25155 =C2=
=B1 14%  softirqs.CPU238.SCHED
     23.83 =C2=B1 39%    +112.2%      50.57 =C2=B1133%    +482.6%     138.8=
6 =C2=B1188%  softirqs.CPU238.TIMER
     16.33 =C2=B1205%     -93.0%       1.14 =C2=B1244%    -100.0%       0.0=
0        softirqs.CPU239.BLOCK
     32326 =C2=B1  7%      -7.0%      30066 =C2=B1  5%      -8.4%      2961=
9 =C2=B1 13%  softirqs.CPU239.RCU
     26062 =C2=B1  2%      -0.3%      25985 =C2=B1  3%      +0.8%      2627=
6        softirqs.CPU239.SCHED
    106.83 =C2=B1  8%     -17.2%      88.43 =C2=B1 34%     -19.4%      86.1=
4 =C2=B1 27%  softirqs.CPU239.TIMER
      0.33 =C2=B1223%   +1014.3%       3.71 =C2=B1244%   +1571.4%       5.5=
7 =C2=B1182%  softirqs.CPU24.BLOCK
     32334 =C2=B1  9%      -4.3%      30954 =C2=B1  5%      -8.4%      2962=
9 =C2=B1 10%  softirqs.CPU24.RCU
     26503 =C2=B1  2%      -0.3%      26415            -1.7%      26049 =C2=
=B1  2%  softirqs.CPU24.SCHED
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  softirqs.CPU24.TASKLET
      1021 =C2=B1203%     -91.8%      83.29 =C2=B1 13%     -91.6%      86.1=
4 =C2=B1  6%  softirqs.CPU24.TIMER
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  softirqs.CPU240.BLOCK
     32521 =C2=B1  5%      -0.2%      32457 =C2=B1  4%      -7.7%      3002=
4 =C2=B1 11%  softirqs.CPU240.RCU
     26533            -8.3%      24326 =C2=B1 21%      +0.3%      26609 =C2=
=B1  2%  softirqs.CPU240.SCHED
      0.00       +1.7e+102%       1.71 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU240.TASKLET
     19.50 =C2=B1 31%      +0.4%      19.57 =C2=B1 30%   +1417.2%     295.8=
6 =C2=B1223%  softirqs.CPU240.TIMER
      0.33 =C2=B1223%    -100.0%       0.00         +1442.9%       5.14 =C2=
=B1229%  softirqs.CPU241.BLOCK
     34134 =C2=B1  6%      -4.8%      32488 =C2=B1  3%     -13.1%      2964=
9 =C2=B1 11%  softirqs.CPU241.RCU
     23647 =C2=B1 25%      +3.9%      24567 =C2=B1 16%     +11.7%      2641=
7        softirqs.CPU241.SCHED
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU241.TASKLET
     84.00 =C2=B1 28%     +22.6%     103.00 =C2=B1 21%     +20.4%     101.1=
4 =C2=B1  8%  softirqs.CPU241.TIMER
      0.00          -100.0%       0.00       +1.9e+102%       1.86 =C2=B124=
4%  softirqs.CPU242.BLOCK
     32444 =C2=B1  7%      -0.3%      32345 =C2=B1  5%      -7.6%      2998=
1 =C2=B1 11%  softirqs.CPU242.RCU
     26579            -9.2%      24138 =C2=B1 22%      -0.6%      26412    =
    softirqs.CPU242.SCHED
    113.83 =C2=B1135%     -66.4%      38.29 =C2=B1101%     -68.5%      35.8=
6 =C2=B1 73%  softirqs.CPU242.TIMER
      0.00       +2.7e+102%       2.71 =C2=B1244% +2.1e+102%       2.14 =C2=
=B1244%  softirqs.CPU243.BLOCK
     34940 =C2=B1  8%      -7.4%      32344 =C2=B1  4%     -14.1%      3003=
0 =C2=B1 11%  softirqs.CPU243.RCU
     25821 =C2=B1  4%      +1.7%      26266            +2.2%      26385    =
    softirqs.CPU243.SCHED
     91.00 =C2=B1 47%     -14.1%      78.14 =C2=B1 20%     +56.4%     142.2=
9 =C2=B1 78%  softirqs.CPU243.TIMER
      2.83 =C2=B1223%    +202.5%       8.57 =C2=B1158%    -100.0%       0.0=
0        softirqs.CPU244.BLOCK
     32122 =C2=B1  5%      -6.6%      29994 =C2=B1  5%      -9.9%      2892=
8 =C2=B1 11%  softirqs.CPU244.RCU
     23796 =C2=B1 24%     +10.2%      26228           +10.9%      26395    =
    softirqs.CPU244.SCHED
     33.67 =C2=B1 54%     -29.6%      23.71 =C2=B1 31%      +6.9%      36.0=
0 =C2=B1102%  softirqs.CPU244.TIMER
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU245.BLOCK
     30878 =C2=B1  4%      -2.1%      30240 =C2=B1  6%      -7.6%      2853=
3 =C2=B1 11%  softirqs.CPU245.RCU
     26254            -2.7%      25537 =C2=B1  5%      +0.7%      26443    =
    softirqs.CPU245.SCHED
      0.17 =C2=B1223%    -100.0%       0.00           -14.3%       0.14 =C2=
=B1244%  softirqs.CPU245.TASKLET
    103.83 =C2=B1 11%      +0.0%     103.86 =C2=B1 45%    +225.5%     338.0=
0 =C2=B1172%  softirqs.CPU245.TIMER
      0.00          -100.0%       0.00       +4.1e+102%       4.14 =C2=B124=
4%  softirqs.CPU246.BLOCK
     32283 =C2=B1  6%      -6.1%      30329 =C2=B1  5%     -10.7%      2882=
3 =C2=B1 10%  softirqs.CPU246.RCU
     26633            -1.1%      26337            -0.3%      26560        s=
oftirqs.CPU246.SCHED
     31.33 =C2=B1 88%     -19.8%      25.14 =C2=B1 47%     -38.0%      19.4=
3 =C2=B1 35%  softirqs.CPU246.TIMER
      0.00       +2.9e+101%       0.29 =C2=B1244% +2.9e+101%       0.29 =C2=
=B1244%  softirqs.CPU247.BLOCK
     30689 =C2=B1  3%      -0.1%      30660 =C2=B1  7%      -4.8%      2922=
9 =C2=B1  6%  softirqs.CPU247.RCU
     23862 =C2=B1 24%     +10.4%      26338           +10.7%      26424    =
    softirqs.CPU247.SCHED
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU247.TASKLET
     94.17 =C2=B1 20%      +5.3%      99.14 =C2=B1 12%      +7.4%     101.1=
4 =C2=B1 47%  softirqs.CPU247.TIMER
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU248.NET_TX
     32421 =C2=B1  6%      +1.2%      32808 =C2=B1  4%      -9.0%      2949=
8 =C2=B1 11%  softirqs.CPU248.RCU
     23808 =C2=B1 24%      +1.7%      24213 =C2=B1 21%      +2.0%      2428=
5 =C2=B1 19%  softirqs.CPU248.SCHED
    660.67 =C2=B1212%     -96.9%      20.57 =C2=B1 16%     -96.8%      21.2=
9 =C2=B1 20%  softirqs.CPU248.TIMER
     14.67 =C2=B1223%     -65.9%       5.00 =C2=B1200%    -100.0%       0.0=
0        softirqs.CPU249.BLOCK
     34348 =C2=B1  8%      -4.0%      32973 =C2=B1  4%     -12.5%      3006=
2 =C2=B1 12%  softirqs.CPU249.RCU
     26489            -0.9%      26251            -0.3%      26408        s=
oftirqs.CPU249.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU249.TASKLET
    140.00 =C2=B1 49%     -28.1%     100.71 =C2=B1  8%     -30.7%      97.0=
0 =C2=B1 12%  softirqs.CPU249.TIMER
      3.33 =C2=B1223%    +182.9%       9.43 =C2=B1120%     +24.3%       4.1=
4 =C2=B1173%  softirqs.CPU25.BLOCK
     30898 =C2=B1  3%      +0.9%      31174 =C2=B1  6%      -2.0%      3026=
5 =C2=B1 12%  softirqs.CPU25.RCU
     27081 =C2=B1  2%      -9.1%      24621 =C2=B1 20%      -2.4%      2642=
1        softirqs.CPU25.SCHED
      0.00          -100.0%       0.00       +1.9e+102%       1.86 =C2=B124=
4%  softirqs.CPU25.TASKLET
      1339 =C2=B1215%     -96.4%      48.71 =C2=B1 27%     -70.4%     396.8=
6 =C2=B1209%  softirqs.CPU25.TIMER
     32936 =C2=B1  6%      -0.8%      32681 =C2=B1  4%      -8.4%      3016=
6 =C2=B1 11%  softirqs.CPU250.RCU
     24237 =C2=B1 22%      +8.4%      26276            +3.6%      25100 =C2=
=B1 12%  softirqs.CPU250.SCHED
     17.33 =C2=B1 27%     +96.2%      34.00 =C2=B1 50%     +43.4%      24.8=
6 =C2=B1 14%  softirqs.CPU250.TIMER
      0.33 =C2=B1223%    +800.0%       3.00 =C2=B1192%   +4014.3%      13.7=
1 =C2=B1239%  softirqs.CPU251.BLOCK
     33972 =C2=B1  5%      -2.8%      33019 =C2=B1  4%     -10.0%      3057=
2 =C2=B1 12%  softirqs.CPU251.RCU
     24453 =C2=B1 17%      +7.7%      26343           -14.4%      20935 =C2=
=B1 31%  softirqs.CPU251.SCHED
    140.33 =C2=B1 49%     -32.6%      94.57 =C2=B1 20%      -7.6%     129.7=
1 =C2=B1 32%  softirqs.CPU251.TIMER
      4.67 =C2=B1223%     -20.4%       3.71 =C2=B1166%    -100.0%       0.0=
0        softirqs.CPU252.BLOCK
     33360 =C2=B1  3%      -7.9%      30722 =C2=B1  5%     -12.8%      2910=
1 =C2=B1 11%  softirqs.CPU252.RCU
     19327 =C2=B1 38%     +20.5%      23286 =C2=B1 22%     +37.2%      2650=
9        softirqs.CPU252.SCHED
    422.33 =C2=B1210%     -85.2%      62.43 =C2=B1132%     -73.7%     111.1=
4 =C2=B1194%  softirqs.CPU252.TIMER
      2.50 =C2=B1223%    +882.9%      24.57 =C2=B1233%    -100.0%       0.0=
0        softirqs.CPU253.BLOCK
     31043 =C2=B1  4%      -2.3%      30334 =C2=B1  5%      -7.5%      2871=
8 =C2=B1  9%  softirqs.CPU253.RCU
     26599            -9.1%      24172 =C2=B1 21%      -0.7%      26403    =
    softirqs.CPU253.SCHED
    102.83 =C2=B1 10%      -9.6%      93.00 =C2=B1 11%     +14.5%     117.7=
1 =C2=B1 36%  softirqs.CPU253.TIMER
      1.67 =C2=B1197%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU254.BLOCK
     32196 =C2=B1  5%      -2.2%      31500 =C2=B1  7%      -9.9%      2902=
3 =C2=B1 11%  softirqs.CPU254.RCU
     24038 =C2=B1 23%      +0.8%      24227 =C2=B1 20%      +9.4%      2630=
7        softirqs.CPU254.SCHED
     19.50 =C2=B1  7%   +1955.7%     400.86 =C2=B1225%     +22.3%      23.8=
6 =C2=B1 15%  softirqs.CPU254.TIMER
      7.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU255.BLOCK
     31907 =C2=B1  4%      -0.7%      31676 =C2=B1  5%      -7.8%      2942=
4 =C2=B1  9%  softirqs.CPU255.RCU
     13225 =C2=B1 27%     +33.3%      17630 =C2=B1 44%     +14.3%      1511=
0 =C2=B1 33%  softirqs.CPU255.SCHED
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU255.TASKLET
     51.17 =C2=B1  9%    +752.7%     436.29 =C2=B1160%     +13.6%      58.1=
4 =C2=B1 13%  softirqs.CPU255.TIMER
      0.33 =C2=B1223%    +242.9%       1.14 =C2=B1164%    +114.3%       0.7=
1 =C2=B1244%  softirqs.CPU26.BLOCK
     33518 =C2=B1  6%      -6.4%      31376 =C2=B1  5%     -10.8%      2990=
7 =C2=B1 12%  softirqs.CPU26.RCU
     25700 =C2=B1  4%     -10.6%      22968 =C2=B1 20%      -3.1%      2491=
1 =C2=B1  7%  softirqs.CPU26.SCHED
     82.83 =C2=B1  5%      -7.0%      77.00 =C2=B1 14%     -16.4%      69.2=
9 =C2=B1 25%  softirqs.CPU26.TIMER
      0.00       +2.9e+101%       0.29 =C2=B1244% +1.1e+103%      10.57 =C2=
=B1244%  softirqs.CPU27.BLOCK
     32484 =C2=B1  9%      -6.2%      30479 =C2=B1  7%      -6.9%      3024=
4 =C2=B1 13%  softirqs.CPU27.RCU
     26478 =C2=B1  2%      -8.8%      24140 =C2=B1 19%      -2.9%      2569=
8 =C2=B1  2%  softirqs.CPU27.SCHED
     56.00 =C2=B1 27%     -16.6%      46.71 =C2=B1 39%     +23.0%      68.8=
6 =C2=B1 64%  softirqs.CPU27.TIMER
      0.00          -100.0%       0.00       +5.7e+102%       5.71 =C2=B121=
7%  softirqs.CPU28.BLOCK
     33734 =C2=B1  6%      -0.3%      33638 =C2=B1  5%      -4.2%      3231=
8 =C2=B1 13%  softirqs.CPU28.RCU
     23843 =C2=B1 20%      -0.1%      23814 =C2=B1 15%      +2.6%      2445=
3 =C2=B1 16%  softirqs.CPU28.SCHED
      0.67 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU28.TASKLET
     76.67 =C2=B1  8%     +30.2%      99.86 =C2=B1 74%     +25.0%      95.8=
6 =C2=B1 22%  softirqs.CPU28.TIMER
      0.00          -100.0%       0.00       +6.4e+102%       6.43 =C2=B124=
4%  softirqs.CPU29.BLOCK
     34727 =C2=B1  4%      -2.3%      33922 =C2=B1  7%     -11.2%      3085=
2 =C2=B1 11%  softirqs.CPU29.RCU
     25220 =C2=B1  9%      -8.0%      23207 =C2=B1 18%      +4.2%      2626=
8 =C2=B1  2%  softirqs.CPU29.SCHED
     45.00 =C2=B1 18%     +34.3%      60.43 =C2=B1 68%      +8.3%      48.7=
1 =C2=B1 22%  softirqs.CPU29.TIMER
      5.00 =C2=B1206%     -54.3%       2.29 =C2=B1211%     -91.4%       0.4=
3 =C2=B1169%  softirqs.CPU3.BLOCK
     38314 =C2=B1  4%      -9.2%      34802 =C2=B1 11%     -12.0%      3371=
4 =C2=B1 10%  softirqs.CPU3.RCU
     26179 =C2=B1  4%     -12.8%      22818 =C2=B1 25%      -7.6%      2418=
8 =C2=B1 12%  softirqs.CPU3.SCHED
      0.00       +1.3e+102%       1.29 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU3.TASKLET
     70.50 =C2=B1 45%   +2093.1%       1546 =C2=B1236%   +1389.4%       105=
0 =C2=B1235%  softirqs.CPU3.TIMER
      0.00       +8.6e+101%       0.86 =C2=B1244% +1.4e+101%       0.14 =C2=
=B1244%  softirqs.CPU30.BLOCK
     35115 =C2=B1  4%      -7.6%      32444 =C2=B1  8%      -9.7%      3170=
3 =C2=B1 13%  softirqs.CPU30.RCU
     23995 =C2=B1 23%      +7.0%      25682 =C2=B1  3%      -5.4%      2270=
4 =C2=B1 13%  softirqs.CPU30.SCHED
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU30.TASKLET
     65.17 =C2=B1 29%   +1055.9%     753.29 =C2=B1219%     +39.6%      91.0=
0 =C2=B1 36%  softirqs.CPU30.TIMER
     34540 =C2=B1  6%      -0.9%      34225 =C2=B1  7%     -10.6%      3086=
9 =C2=B1 12%  softirqs.CPU31.RCU
     26592           -11.6%      23511 =C2=B1 18%     -12.4%      23288 =C2=
=B1 15%  softirqs.CPU31.SCHED
    963.50 =C2=B1213%     -54.4%     439.43 =C2=B1218%     -83.7%     156.5=
7 =C2=B1175%  softirqs.CPU31.TIMER
      2.50 =C2=B1206%      +2.9%       2.57 =C2=B1169%     -71.4%       0.7=
1 =C2=B1162%  softirqs.CPU32.BLOCK
     32803 =C2=B1  3%      -0.8%      32554 =C2=B1  5%     -10.8%      2926=
9 =C2=B1 10%  softirqs.CPU32.RCU
     25875 =C2=B1  4%      -1.4%      25508 =C2=B1  3%      -0.5%      2575=
4 =C2=B1  5%  softirqs.CPU32.SCHED
      0.00       +2.9e+101%       0.29 =C2=B1244% +1.4e+101%       0.14 =C2=
=B1244%  softirqs.CPU32.TASKLET
    103.50 =C2=B1 37%     -25.5%      77.14 =C2=B1 17%    +270.2%     383.1=
4 =C2=B1174%  softirqs.CPU32.TIMER
      1.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU33.BLOCK
     32304 =C2=B1  4%      -1.4%      31860 =C2=B1  2%      -4.4%      3089=
6 =C2=B1 12%  softirqs.CPU33.RCU
     25868 =C2=B1  4%      -1.4%      25494 =C2=B1  4%     -10.5%      2315=
7 =C2=B1 20%  softirqs.CPU33.SCHED
     44.83 =C2=B1  4%     +24.3%      55.71 =C2=B1 57%   +1326.6%     639.5=
7 =C2=B1145%  softirqs.CPU33.TIMER
     33099 =C2=B1  3%      -3.8%      31844 =C2=B1  4%     -10.0%      2978=
7 =C2=B1 10%  softirqs.CPU34.RCU
     26097 =C2=B1  4%      -2.1%      25540 =C2=B1  3%      -1.2%      2577=
5 =C2=B1  4%  softirqs.CPU34.SCHED
    123.50 =C2=B1 91%     -35.2%      80.00 =C2=B1 14%     -29.9%      86.5=
7 =C2=B1 19%  softirqs.CPU34.TIMER
      0.00       +4.1e+102%       4.14 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU35.BLOCK
     32634 =C2=B1  4%      -2.3%      31899 =C2=B1  3%      -8.6%      2982=
9 =C2=B1  9%  softirqs.CPU35.RCU
     25549 =C2=B1  7%      +0.7%      25729 =C2=B1  3%      -6.3%      2393=
0 =C2=B1 18%  softirqs.CPU35.SCHED
     70.67 =C2=B1 59%      +2.3%      72.29 =C2=B1 89%     -34.7%      46.1=
4 =C2=B1 12%  softirqs.CPU35.TIMER
      1.00 =C2=B1223%     -71.4%       0.29 =C2=B1244%     +71.4%       1.7=
1 =C2=B1158%  softirqs.CPU36.BLOCK
     30939 =C2=B1  3%      -2.9%      30044 =C2=B1  6%      -7.1%      2874=
1 =C2=B1  9%  softirqs.CPU36.RCU
     26315 =C2=B1  5%     -12.8%      22954 =C2=B1 18%      -1.2%      2601=
0 =C2=B1  3%  softirqs.CPU36.SCHED
    399.00 =C2=B1133%     -80.6%      77.57 =C2=B1 14%     -79.2%      83.0=
0 =C2=B1  8%  softirqs.CPU36.TIMER
      0.00       +1.4e+101%       0.14 =C2=B1244% +2.7e+102%       2.71 =C2=
=B1148%  softirqs.CPU37.BLOCK
     31784 =C2=B1  4%      -4.7%      30275 =C2=B1  7%      -9.2%      2886=
1 =C2=B1 10%  softirqs.CPU37.RCU
     25656 =C2=B1  8%      -0.7%      25488 =C2=B1  4%      +0.0%      2565=
6 =C2=B1  5%  softirqs.CPU37.SCHED
    179.33 =C2=B1104%     -72.2%      49.86 =C2=B1 20%     -72.3%      49.7=
1 =C2=B1 22%  softirqs.CPU37.TIMER
      0.17 =C2=B1223%   +1271.4%       2.29 =C2=B1135%    -100.0%       0.0=
0        softirqs.CPU38.BLOCK
     31271 =C2=B1  5%      -3.8%      30068 =C2=B1  4%      -8.4%      2865=
4 =C2=B1  9%  softirqs.CPU38.RCU
     25301 =C2=B1  6%      -8.4%      23182 =C2=B1 25%      +2.9%      2603=
2 =C2=B1  2%  softirqs.CPU38.SCHED
      0.00          -100.0%       0.00       +1.4e+102%       1.43 =C2=B124=
4%  softirqs.CPU38.TASKLET
    105.50 =C2=B1 45%     -28.8%      75.14 =C2=B1 16%     +37.4%     145.0=
0 =C2=B1106%  softirqs.CPU38.TIMER
      4.67 =C2=B1223%     -78.6%       1.00 =C2=B1244%    -100.0%       0.0=
0        softirqs.CPU39.BLOCK
     30702 =C2=B1  8%      +1.8%      31256 =C2=B1  9%      -6.0%      2886=
3 =C2=B1 10%  softirqs.CPU39.RCU
     24667 =C2=B1 18%      +0.1%      24686 =C2=B1 10%      -2.1%      2414=
6 =C2=B1 16%  softirqs.CPU39.SCHED
      0.00          -100.0%       0.00       +5.7e+101%       0.57 =C2=B124=
4%  softirqs.CPU39.TASKLET
      1132 =C2=B1214%     -96.0%      45.71 =C2=B1 19%     -82.7%     195.5=
7 =C2=B1185%  softirqs.CPU39.TIMER
      8.83 =C2=B1141%     -77.4%       2.00 =C2=B1160%      -4.6%       8.4=
3 =C2=B1182%  softirqs.CPU4.BLOCK
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  softirqs.CPU4.NET_TX
     39017 =C2=B1  4%      -5.8%      36738 =C2=B1  4%      -9.6%      3528=
9 =C2=B1 11%  softirqs.CPU4.RCU
     22124 =C2=B1 25%      +5.1%      23251 =C2=B1 21%      +8.6%      2403=
0 =C2=B1 16%  softirqs.CPU4.SCHED
      0.00         +1e+102%       1.00 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU4.TASKLET
     82.67 =C2=B1  6%   +1243.8%       1110 =C2=B1153%     +10.8%      91.5=
7 =C2=B1 41%  softirqs.CPU4.TIMER
      4.83 =C2=B1223%     -76.4%       1.14 =C2=B1164%    -100.0%       0.0=
0        softirqs.CPU40.BLOCK
     29568 =C2=B1  6%      -7.6%      27333 =C2=B1  8%     -10.0%      2660=
5 =C2=B1 10%  softirqs.CPU40.RCU
     24690 =C2=B1 12%      +6.0%      26177            -4.3%      23627 =C2=
=B1 22%  softirqs.CPU40.SCHED
    115.50 =C2=B1 59%    +698.4%     922.14 =C2=B1143%     -27.6%      83.5=
7 =C2=B1  6%  softirqs.CPU40.TIMER
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU41.BLOCK
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU41.NET_TX
     29153            -2.7%      28354 =C2=B1  7%      -8.0%      26813 =C2=
=B1  9%  softirqs.CPU41.RCU
     24384 =C2=B1 16%      +8.4%      26423 =C2=B1  4%      +4.2%      2540=
1 =C2=B1 11%  softirqs.CPU41.SCHED
     50.33 =C2=B1  9%   +4092.3%       2110 =C2=B1187%      -7.5%      46.5=
7 =C2=B1 12%  softirqs.CPU41.TIMER
      0.00       +7.9e+102%       7.86 =C2=B1158%    -100.0%       0.00    =
    softirqs.CPU42.BLOCK
     30786            -3.6%      29680 =C2=B1  3%      -6.3%      28851 =C2=
=B1  8%  softirqs.CPU42.RCU
     21625 =C2=B1 24%     +15.9%      25058 =C2=B1 11%     +20.6%      2607=
4        softirqs.CPU42.SCHED
      0.00          -100.0%       0.00       +2.4e+102%       2.43 =C2=B124=
4%  softirqs.CPU42.TASKLET
     74.33 =C2=B1  7%     +81.2%     134.71 =C2=B1 77%    +237.5%     250.8=
6 =C2=B1111%  softirqs.CPU42.TIMER
      0.00         +2e+102%       2.00 =C2=B1244% +1.1e+103%      11.00 =C2=
=B1237%  softirqs.CPU43.BLOCK
     30661            -2.7%      29838 =C2=B1  5%      -7.5%      28376 =C2=
=B1 11%  softirqs.CPU43.RCU
     24432 =C2=B1 17%      -0.2%      24378 =C2=B1 16%      +1.8%      2486=
8 =C2=B1 17%  softirqs.CPU43.SCHED
      0.00          -100.0%       0.00       +2.7e+102%       2.71 =C2=B124=
4%  softirqs.CPU43.TASKLET
     61.17 =C2=B1 49%    +647.4%     457.14 =C2=B1142%    +653.9%     461.1=
4 =C2=B1210%  softirqs.CPU43.TIMER
      0.00       +1.4e+101%       0.14 =C2=B1244% +2.9e+101%       0.29 =C2=
=B1244%  softirqs.CPU44.BLOCK
     28548 =C2=B1  3%      -2.8%      27760 =C2=B1  8%      -6.4%      2671=
7 =C2=B1  9%  softirqs.CPU44.RCU
     25586 =C2=B1  6%      +0.3%      25671 =C2=B1  5%      -0.2%      2554=
0 =C2=B1  6%  softirqs.CPU44.SCHED
     85.83 =C2=B1  3%     +15.5%      99.14 =C2=B1 33%     -13.0%      74.7=
1 =C2=B1 28%  softirqs.CPU44.TIMER
      0.00       +1.6e+102%       1.57 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU45.BLOCK
     28837 =C2=B1  3%      -3.7%      27759 =C2=B1  7%      -8.0%      2654=
0 =C2=B1  8%  softirqs.CPU45.RCU
     25251 =C2=B1  8%      +5.8%      26716            +4.6%      26404    =
    softirqs.CPU45.SCHED
    203.67 =C2=B1161%     -77.1%      46.57 =C2=B1 20%     -61.0%      79.4=
3 =C2=B1119%  softirqs.CPU45.TIMER
      0.00       +5.7e+101%       0.57 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU46.BLOCK
     31807            -1.3%      31388 =C2=B1  5%      -6.6%      29718 =C2=
=B1  9%  softirqs.CPU46.RCU
     23587 =C2=B1 22%      +1.7%      23986 =C2=B1 16%     +10.1%      2597=
3 =C2=B1  3%  softirqs.CPU46.SCHED
    138.83 =C2=B1 97%     -43.4%      78.57 =C2=B1 17%     -48.1%      72.0=
0 =C2=B1 19%  softirqs.CPU46.TIMER
      0.33 =C2=B1223%     -14.3%       0.29 =C2=B1244%    -100.0%       0.0=
0        softirqs.CPU47.BLOCK
     31938            -2.8%      31031 =C2=B1  5%      -6.9%      29719 =C2=
=B1  9%  softirqs.CPU47.RCU
     26132 =C2=B1  3%      -8.2%      23978 =C2=B1 16%      +1.0%      2639=
9 =C2=B1  2%  softirqs.CPU47.SCHED
      0.00       +8.6e+101%       0.86 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU47.TASKLET
     51.00 =C2=B1 11%     -13.2%      44.29 =C2=B1 13%      -4.8%      48.5=
7 =C2=B1 47%  softirqs.CPU47.TIMER
      0.50 =C2=B1223%     -14.3%       0.43 =C2=B1244%     -71.4%       0.1=
4 =C2=B1244%  softirqs.CPU48.BLOCK
     29140            +0.7%      29339 =C2=B1 10%      -7.6%      26935 =C2=
=B1  9%  softirqs.CPU48.RCU
     26061 =C2=B1  4%      -6.3%      24420 =C2=B1 16%      -0.5%      2592=
1 =C2=B1  5%  softirqs.CPU48.SCHED
      0.00       +1.3e+102%       1.29 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU48.TASKLET
     74.17 =C2=B1 16%     +38.3%     102.57 =C2=B1 38%     +25.8%      93.2=
9 =C2=B1 24%  softirqs.CPU48.TIMER
      0.33 =C2=B1223%   +2557.1%       8.86 =C2=B1123%   +1185.7%       4.2=
9 =C2=B1235%  softirqs.CPU49.BLOCK
     28983 =C2=B1  2%      -2.1%      28369 =C2=B1  5%      -7.3%      2686=
7 =C2=B1  9%  softirqs.CPU49.RCU
     23876 =C2=B1 22%      +1.9%      24326 =C2=B1 16%     +11.0%      2649=
7 =C2=B1  2%  softirqs.CPU49.SCHED
      0.00       +6.9e+102%       6.86 =C2=B1239%    -100.0%       0.00    =
    softirqs.CPU49.TASKLET
     52.17 =C2=B1 52%      +8.7%      56.71 =C2=B1 22%      -0.0%      52.1=
4 =C2=B1 26%  softirqs.CPU49.TIMER
      4.67 =C2=B1223%     -11.2%       4.14 =C2=B1235%    -100.0%       0.0=
0        softirqs.CPU5.BLOCK
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  softirqs.CPU5.NET_TX
     37913 =C2=B1  4%      -5.2%      35929 =C2=B1  3%      -8.8%      3456=
8 =C2=B1 11%  softirqs.CPU5.RCU
     24940 =C2=B1 18%      +5.0%      26181 =C2=B1  2%      -1.8%      2448=
9 =C2=B1 11%  softirqs.CPU5.SCHED
      0.00       +7.6e+102%       7.57 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU5.TASKLET
     48.33 =C2=B1 11%      +4.0%      50.29 =C2=B1 34%   +2322.8%       117=
1 =C2=B1236%  softirqs.CPU5.TIMER
      1.83 =C2=B1223%      +1.3%       1.86 =C2=B1153%     +79.2%       3.2=
9 =C2=B1135%  softirqs.CPU50.BLOCK
     28665            +2.1%      29275 =C2=B1 11%      -6.2%      26883 =C2=
=B1  9%  softirqs.CPU50.RCU
     26580            -2.4%      25940 =C2=B1  4%      -0.4%      26467 =C2=
=B1  2%  softirqs.CPU50.SCHED
    105.33 =C2=B1111%     +62.9%     171.57 =C2=B1139%     -19.7%      84.5=
7 =C2=B1 12%  softirqs.CPU50.TIMER
      1.67 =C2=B1175%     +28.6%       2.14 =C2=B1226%    -100.0%       0.0=
0        softirqs.CPU51.BLOCK
     28837 =C2=B1  9%      -0.6%      28662 =C2=B1 11%      -6.8%      2688=
9 =C2=B1  9%  softirqs.CPU51.RCU
     25861 =C2=B1  5%      +1.4%      26223 =C2=B1  2%      -5.1%      2454=
4 =C2=B1 19%  softirqs.CPU51.SCHED
      0.00          -100.0%       0.00         +6e+102%       6.00 =C2=B124=
4%  softirqs.CPU51.TASKLET
      1266 =C2=B1208%     -63.3%     465.14 =C2=B1207%     -96.0%      50.4=
3 =C2=B1 17%  softirqs.CPU51.TIMER
      0.00       +5.7e+101%       0.57 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU52.BLOCK
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU52.NET_TX
     29028            -0.4%      28909 =C2=B1  7%      -3.7%      27956 =C2=
=B1 11%  softirqs.CPU52.RCU
     22246 =C2=B1 24%     +13.3%      25199 =C2=B1  7%     +19.1%      2650=
4 =C2=B1  3%  softirqs.CPU52.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU52.TASKLET
     83.67 =C2=B1 16%    +147.9%     207.43 =C2=B1146%    +748.6%     710.0=
0 =C2=B1214%  softirqs.CPU52.TIMER
     30570 =C2=B1  7%      -5.0%      29040 =C2=B1  7%     -12.1%      2688=
1 =C2=B1  9%  softirqs.CPU53.RCU
     25184 =C2=B1  6%      +1.3%      25514 =C2=B1  8%      +4.3%      2626=
5 =C2=B1  4%  softirqs.CPU53.SCHED
      0.17 =C2=B1223%     -14.3%       0.14 =C2=B1244%    -100.0%       0.0=
0        softirqs.CPU53.TASKLET
    439.67 =C2=B1205%     -88.3%      51.57 =C2=B1 17%     -83.0%      74.5=
7 =C2=B1 91%  softirqs.CPU53.TIMER
     12.00 =C2=B1223%    -100.0%       0.00           -52.4%       5.71 =C2=
=B1244%  softirqs.CPU54.BLOCK
     28893            -1.4%      28498 =C2=B1  5%      -7.6%      26707 =C2=
=B1  9%  softirqs.CPU54.RCU
     25488 =C2=B1  3%      +0.2%      25531 =C2=B1  4%      +3.5%      2637=
6 =C2=B1  2%  softirqs.CPU54.SCHED
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  softirqs.CPU54.TASKLET
     85.17 =C2=B1 24%    +144.1%     207.86 =C2=B1132%    +318.3%     356.2=
9 =C2=B1186%  softirqs.CPU54.TIMER
      0.00       +4.1e+102%       4.14 =C2=B1244% +3.1e+102%       3.14 =C2=
=B1244%  softirqs.CPU55.BLOCK
     28939            -2.6%      28195 =C2=B1  6%      -9.2%      26282 =C2=
=B1 10%  softirqs.CPU55.RCU
     26747            -6.3%      25050 =C2=B1  8%      -0.6%      26583 =C2=
=B1  2%  softirqs.CPU55.SCHED
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU55.TASKLET
     74.00 =C2=B1 71%     +40.0%     103.57 =C2=B1135%   +1928.0%       150=
0 =C2=B1225%  softirqs.CPU55.TIMER
      7.17 =C2=B1223%     -70.1%       2.14 =C2=B1244%     -10.3%       6.4=
3 =C2=B1167%  softirqs.CPU56.BLOCK
     29840 =C2=B1  6%      -4.9%      28380 =C2=B1  5%      -5.2%      2829=
2 =C2=B1 13%  softirqs.CPU56.RCU
     23436 =C2=B1 23%     +12.2%      26287 =C2=B1  2%      +2.9%      2412=
1 =C2=B1 16%  softirqs.CPU56.SCHED
    538.50 =C2=B1162%     -84.6%      82.71 =C2=B1  6%     -82.3%      95.2=
9 =C2=B1 28%  softirqs.CPU56.TIMER
      0.00       +2.3e+102%       2.29 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU57.BLOCK
     28677 =C2=B1  2%      -0.8%      28454 =C2=B1  6%      -6.9%      2668=
7 =C2=B1  9%  softirqs.CPU57.RCU
     25797 =C2=B1  4%      +1.4%      26153 =C2=B1  3%      +0.7%      2598=
8 =C2=B1  4%  softirqs.CPU57.SCHED
    726.17 =C2=B1200%     -90.6%      68.29 =C2=B1 51%     -81.9%     131.5=
7 =C2=B1170%  softirqs.CPU57.TIMER
      0.00          -100.0%       0.00       +8.6e+102%       8.57 =C2=B123=
5%  softirqs.CPU58.BLOCK
     29377 =C2=B1  3%      -2.9%      28532 =C2=B1  6%      -8.0%      2702=
9 =C2=B1  9%  softirqs.CPU58.RCU
     24827 =C2=B1 19%      +7.5%      26680            +5.0%      26061 =C2=
=B1  4%  softirqs.CPU58.SCHED
      0.00       +1.4e+101%       0.14 =C2=B1244% +1.4e+101%       0.14 =C2=
=B1244%  softirqs.CPU58.TASKLET
    425.50 =C2=B1181%     -24.3%     322.29 =C2=B1182%     -79.9%      85.4=
3 =C2=B1  5%  softirqs.CPU58.TIMER
      0.00       +1.7e+102%       1.71 =C2=B1244% +1.1e+102%       1.14 =C2=
=B1244%  softirqs.CPU59.BLOCK
     29145 =C2=B1  2%      -2.5%      28419 =C2=B1  5%      -7.4%      2699=
2 =C2=B1  9%  softirqs.CPU59.RCU
     24214 =C2=B1 20%      -0.1%      24197 =C2=B1 20%      +3.2%      2499=
0 =C2=B1 17%  softirqs.CPU59.SCHED
    138.67 =C2=B1112%     -51.6%      67.14 =C2=B1 65%     -64.1%      49.7=
1 =C2=B1 22%  softirqs.CPU59.TIMER
      0.00       +2.9e+101%       0.29 =C2=B1244%   +2e+102%       2.00 =C2=
=B1207%  softirqs.CPU6.BLOCK
     39432 =C2=B1  5%      -7.3%      36536 =C2=B1  3%     -11.5%      3490=
5 =C2=B1 13%  softirqs.CPU6.RCU
     23495 =C2=B1 23%     +11.5%      26199 =C2=B1  2%      +5.5%      2478=
2 =C2=B1 10%  softirqs.CPU6.SCHED
    150.50 =C2=B1 95%     -41.1%      88.57 =C2=B1 49%      -9.3%     136.5=
7 =C2=B1110%  softirqs.CPU6.TIMER
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU60.BLOCK
     28801            -1.0%      28500 =C2=B1  6%      -6.2%      27015 =C2=
=B1  9%  softirqs.CPU60.RCU
     23994 =C2=B1 18%      +2.6%      24617 =C2=B1 10%      +0.2%      2405=
2 =C2=B1 18%  softirqs.CPU60.SCHED
     88.00 =C2=B1 19%      -2.8%      85.57 =C2=B1 19%    +123.7%     196.8=
6 =C2=B1 93%  softirqs.CPU60.TIMER
      7.17 =C2=B1142%     -66.1%       2.43 =C2=B1244%     -92.0%       0.5=
7 =C2=B1244%  softirqs.CPU61.BLOCK
     28837            +1.9%      29385 =C2=B1 10%      -6.5%      26952 =C2=
=B1  9%  softirqs.CPU61.RCU
     23746 =C2=B1 22%     +11.1%      26388 =C2=B1  3%     +11.8%      2653=
8        softirqs.CPU61.SCHED
     47.83 =C2=B1 30%     +67.2%      80.00 =C2=B1 43%     +95.3%      93.4=
3 =C2=B1 58%  softirqs.CPU61.TIMER
      9.17 =C2=B1107%     -95.3%       0.43 =C2=B1244%      -3.4%       8.8=
6 =C2=B1214%  softirqs.CPU62.BLOCK
     29049            -0.1%      29017 =C2=B1  9%      -6.5%      27166 =C2=
=B1  9%  softirqs.CPU62.RCU
     20935 =C2=B1 20%      +2.4%      21433 =C2=B1 17%     +10.9%      2321=
9 =C2=B1  5%  softirqs.CPU62.SCHED
      0.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU62.TASKLET
    104.50 =C2=B1  8%    +238.6%     353.86 =C2=B1128%      -5.4%      98.8=
6 =C2=B1 31%  softirqs.CPU62.TIMER
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU63.BLOCK
     29210            -2.1%      28591 =C2=B1  6%      -6.1%      27434 =C2=
=B1 10%  softirqs.CPU63.RCU
     13323 =C2=B1 24%      -2.7%      12960 =C2=B1 20%      +4.4%      1391=
1 =C2=B1 18%  softirqs.CPU63.SCHED
      2.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU63.TASKLET
     66.33 =C2=B1 10%    +403.7%     334.14 =C2=B1163%     +10.3%      73.1=
4 =C2=B1 26%  softirqs.CPU63.TIMER
      1.00 =C2=B1223%     +14.3%       1.14 =C2=B1244%     -71.4%       0.2=
9 =C2=B1244%  softirqs.CPU64.BLOCK
     28533 =C2=B1  2%      -0.9%      28275 =C2=B1  7%      -6.7%      2661=
1 =C2=B1  9%  softirqs.CPU64.RCU
     22362 =C2=B1 20%     -22.4%      17358 =C2=B1 37%      +1.3%      2265=
3 =C2=B1 25%  softirqs.CPU64.SCHED
      2.17 =C2=B1203%    -100.0%       0.00           -93.4%       0.14 =C2=
=B1244%  softirqs.CPU64.TASKLET
     36.17 =C2=B1 41%     +66.7%      60.29 =C2=B1106%     +78.5%      64.5=
7 =C2=B1142%  softirqs.CPU64.TIMER
      0.00         +1e+103%      10.43 =C2=B1164% +1.1e+103%      10.71 =C2=
=B1244%  softirqs.CPU65.BLOCK
     30282 =C2=B1  5%      -4.6%      28880 =C2=B1  7%      -8.1%      2782=
3 =C2=B1 12%  softirqs.CPU65.RCU
     23375 =C2=B1 23%      +5.8%      24720 =C2=B1 21%      -3.8%      2249=
7 =C2=B1 32%  softirqs.CPU65.SCHED
      2072 =C2=B1 45%     -53.6%     962.43 =C2=B1113%     -48.4%       106=
8 =C2=B1100%  softirqs.CPU65.TIMER
      0.83 =C2=B1223%     -14.3%       0.71 =C2=B1244%   +1271.4%      11.4=
3 =C2=B1138%  softirqs.CPU66.BLOCK
     28611            -2.3%      27954 =C2=B1  6%      -4.7%      27263 =C2=
=B1  5%  softirqs.CPU66.RCU
     24092 =C2=B1 24%     +11.4%      26839            +0.4%      24191 =C2=
=B1 22%  softirqs.CPU66.SCHED
      0.00       +4.3e+101%       0.43 =C2=B1169%    -100.0%       0.00    =
    softirqs.CPU66.TASKLET
     35.50 =C2=B1 29%   +2650.9%     976.57 =C2=B1234%    +411.1%     181.4=
3 =C2=B1202%  softirqs.CPU66.TIMER
      4.33 =C2=B1134%     -86.8%       0.57 =C2=B1158%     -80.2%       0.8=
6 =C2=B1244%  softirqs.CPU67.BLOCK
     28820            -2.5%      28085 =C2=B1  7%      -4.0%      27671 =C2=
=B1 12%  softirqs.CPU67.RCU
     24346 =C2=B1 24%      +9.5%      26671            +5.3%      25642 =C2=
=B1  9%  softirqs.CPU67.SCHED
      0.00       +1.1e+102%       1.14 =C2=B1211%    -100.0%       0.00    =
    softirqs.CPU67.TASKLET
     34.17 =C2=B1 32%    +634.2%     250.86 =C2=B1214%     +32.1%      45.1=
4 =C2=B1 74%  softirqs.CPU67.TIMER
      1.33 =C2=B1223%     -14.3%       1.14 =C2=B1244%    -100.0%       0.0=
0        softirqs.CPU68.BLOCK
     29503            -1.3%      29132 =C2=B1  5%      -8.5%      26984 =C2=
=B1 10%  softirqs.CPU68.RCU
     26599            +0.0%      26603            -0.5%      26456        s=
oftirqs.CPU68.SCHED
     46.33 =C2=B1 90%    +952.9%     487.86 =C2=B1158%     -39.6%      28.0=
0 =C2=B1  7%  softirqs.CPU68.TIMER
      4.00 =C2=B1223%     +25.0%       5.00 =C2=B1200%    -100.0%       0.0=
0        softirqs.CPU69.BLOCK
     29950 =C2=B1  5%      -4.7%      28540 =C2=B1  3%      -9.6%      2706=
2 =C2=B1 10%  softirqs.CPU69.RCU
     24829 =C2=B1 18%      +6.4%      26425            +6.7%      26497    =
    softirqs.CPU69.SCHED
     42.67 =C2=B1 70%     -29.4%      30.14 =C2=B1 49%     -43.1%      24.2=
9 =C2=B1 10%  softirqs.CPU69.TIMER
      0.33 =C2=B1223%     -14.3%       0.29 =C2=B1244%    -100.0%       0.0=
0        softirqs.CPU7.BLOCK
     39128 =C2=B1  4%      -7.3%      36268 =C2=B1  4%     -12.0%      3444=
8 =C2=B1 15%  softirqs.CPU7.RCU
     26425 =C2=B1  3%      -1.9%      25923 =C2=B1  3%      -6.3%      2476=
1 =C2=B1  6%  softirqs.CPU7.SCHED
     69.83 =C2=B1 61%     -32.1%      47.43 =C2=B1 28%      +7.8%      75.2=
9 =C2=B1 70%  softirqs.CPU7.TIMER
      0.00       +6.4e+102%       6.43 =C2=B1244%   +1e+103%      10.00 =C2=
=B1244%  softirqs.CPU70.BLOCK
     28755            -2.0%      28188 =C2=B1  7%      -3.3%      27799 =C2=
=B1  8%  softirqs.CPU70.RCU
     26790            -0.5%      26644            -2.5%      26126 =C2=B1  =
5%  softirqs.CPU70.SCHED
     28.83 =C2=B1 12%      -2.9%      28.00 =C2=B1 27%    +169.0%      77.5=
7 =C2=B1130%  softirqs.CPU70.TIMER
      0.17 =C2=B1223%    +757.1%       1.43 =C2=B1193%    -100.0%       0.0=
0        softirqs.CPU71.BLOCK
     28704            +0.6%      28880 =C2=B1  6%      -6.6%      26806 =C2=
=B1  9%  softirqs.CPU71.RCU
     26715            -0.8%      26500            -9.5%      24176 =C2=B1 2=
2%  softirqs.CPU71.SCHED
     29.83 =C2=B1 24%     +96.8%      58.71 =C2=B1 83%     +33.1%      39.7=
1 =C2=B1 66%  softirqs.CPU71.TIMER
      0.00       +2.6e+102%       2.57 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU72.BLOCK
     29286 =C2=B1  3%      -4.1%      28088 =C2=B1  5%      -8.2%      2689=
2 =C2=B1 10%  softirqs.CPU72.RCU
     26844 =C2=B1  2%      -2.6%      26156 =C2=B1  4%     -10.7%      2396=
0 =C2=B1 22%  softirqs.CPU72.SCHED
      0.00       +4.4e+102%       4.43 =C2=B1244% +6.6e+102%       6.57 =C2=
=B1244%  softirqs.CPU72.TASKLET
    386.33 =C2=B1206%     -83.2%      64.86 =C2=B1 97%     -91.1%      34.5=
7 =C2=B1 45%  softirqs.CPU72.TIMER
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU73.BLOCK
     28790 =C2=B1  3%      -2.3%      28120 =C2=B1  5%      -6.9%      2681=
4 =C2=B1  9%  softirqs.CPU73.RCU
     24311 =C2=B1 25%      -9.0%      22129 =C2=B1 32%      -0.9%      2409=
6 =C2=B1 22%  softirqs.CPU73.SCHED
      0.33 =C2=B1223%    +457.1%       1.86 =C2=B1244%    -100.0%       0.0=
0        softirqs.CPU73.TASKLET
    307.50 =C2=B1201%     -73.8%      80.71 =C2=B1148%     -91.1%      27.4=
3 =C2=B1 14%  softirqs.CPU73.TIMER
      1.00 =C2=B1223%     -71.4%       0.29 =C2=B1244%    +414.3%       5.1=
4 =C2=B1244%  softirqs.CPU74.BLOCK
     28713            -2.9%      27891 =C2=B1  5%      -7.5%      26560 =C2=
=B1  9%  softirqs.CPU74.RCU
     26786            -0.2%      26732            -3.5%      25857 =C2=B1  =
7%  softirqs.CPU74.SCHED
     50.00 =C2=B1 31%     -20.3%      39.86 =C2=B1 27%     -19.4%      40.2=
9 =C2=B1 39%  softirqs.CPU74.TIMER
      0.00       +1.9e+102%       1.86 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU75.BLOCK
     28368 =C2=B1  2%      -1.6%      27914 =C2=B1  5%      -5.6%      2676=
8 =C2=B1  8%  softirqs.CPU75.RCU
     26769            -6.1%      25140 =C2=B1 12%     -10.3%      24013 =C2=
=B1 21%  softirqs.CPU75.SCHED
      0.17 =C2=B1223%    -100.0%       0.00           -14.3%       0.14 =C2=
=B1244%  softirqs.CPU75.TASKLET
     45.50 =C2=B1 47%      -1.7%      44.71 =C2=B1 63%     -30.0%      31.8=
6 =C2=B1 28%  softirqs.CPU75.TIMER
      0.00       +1.4e+102%       1.43 =C2=B1244% +2.9e+101%       0.29 =C2=
=B1244%  softirqs.CPU76.BLOCK
     28636            -3.6%      27594 =C2=B1  5%      -7.3%      26545 =C2=
=B1  9%  softirqs.CPU76.RCU
     24784 =C2=B1 18%      +4.3%      25839 =C2=B1  4%      +2.2%      2531=
9 =C2=B1 12%  softirqs.CPU76.SCHED
     52.67 =C2=B1 58%     -34.9%      34.29 =C2=B1 21%    +135.2%     123.8=
6 =C2=B1184%  softirqs.CPU76.TIMER
      0.00          -100.0%       0.00       +2.9e+101%       0.29 =C2=B124=
4%  softirqs.CPU77.BLOCK
     28126            -3.2%      27214 =C2=B1  3%      -6.8%      26200 =C2=
=B1  8%  softirqs.CPU77.RCU
     21735 =C2=B1 32%     +22.7%      26667           +16.7%      25369 =C2=
=B1 14%  softirqs.CPU77.SCHED
     52.33 =C2=B1 82%     -14.0%      45.00 =C2=B1 94%     -39.4%      31.7=
1 =C2=B1 52%  softirqs.CPU77.TIMER
      0.00       +2.9e+101%       0.29 =C2=B1244% +3.1e+102%       3.14 =C2=
=B1244%  softirqs.CPU78.BLOCK
     28363            -2.9%      27551 =C2=B1  5%      -7.1%      26340 =C2=
=B1  9%  softirqs.CPU78.RCU
     26746            -0.7%      26554 =C2=B1  2%      -0.5%      26619    =
    softirqs.CPU78.SCHED
      1.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU78.TASKLET
     59.83 =C2=B1 72%     -36.7%      37.86 =C2=B1 77%     -51.8%      28.8=
6 =C2=B1 37%  softirqs.CPU78.TIMER
      0.00          -100.0%       0.00       +1.4e+103%      13.57 =C2=B123=
3%  softirqs.CPU79.BLOCK
     27819            +2.0%      28379 =C2=B1 10%      -7.0%      25884 =C2=
=B1  8%  softirqs.CPU79.RCU
     26698           -12.0%      23495 =C2=B1 23%      -7.0%      24840 =C2=
=B1 19%  softirqs.CPU79.SCHED
     50.50 =C2=B1105%     -45.7%      27.43 =C2=B1 26%     -45.7%      27.4=
3 =C2=B1 39%  softirqs.CPU79.TIMER
      2.17 =C2=B1223%     +51.6%       3.29 =C2=B1158%    -100.0%       0.0=
0        softirqs.CPU8.BLOCK
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  softirqs.CPU8.NET_TX
     36617 =C2=B1  5%      -6.2%      34341 =C2=B1  4%     -14.6%      3125=
6 =C2=B1 12%  softirqs.CPU8.RCU
     24534 =C2=B1  4%      -1.3%      24215 =C2=B1 20%      +5.0%      2576=
8 =C2=B1  5%  softirqs.CPU8.SCHED
     46.67 =C2=B1  3%      -2.3%      45.57 =C2=B1  2%      -4.2%      44.7=
1 =C2=B1  5%  softirqs.CPU8.TASKLET
    139.17 =C2=B1 55%     +60.3%     223.14 =C2=B1163%    +462.5%     782.8=
6 =C2=B1219%  softirqs.CPU8.TIMER
      4.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU80.BLOCK
     28194 =C2=B1  2%      -0.3%      28097 =C2=B1  6%      -1.8%      2768=
3 =C2=B1 18%  softirqs.CPU80.RCU
     26767            -1.2%      26457            -9.0%      24346 =C2=B1 1=
7%  softirqs.CPU80.SCHED
     64.17 =C2=B1126%     -17.4%      53.00 =C2=B1 86%   +1177.9%     820.0=
0 =C2=B1229%  softirqs.CPU80.TIMER
      0.17 =C2=B1223%    +585.7%       1.14 =C2=B1244%     +71.4%       0.2=
9 =C2=B1244%  softirqs.CPU81.BLOCK
     28840 =C2=B1  2%      -3.9%      27720 =C2=B1  5%      -9.7%      2605=
5 =C2=B1 10%  softirqs.CPU81.RCU
     24017 =C2=B1 24%     +11.3%      26724            +1.5%      24367 =C2=
=B1 22%  softirqs.CPU81.SCHED
     29.17 =C2=B1 41%      -1.6%      28.71 =C2=B1 22%    +827.2%     270.4=
3 =C2=B1212%  softirqs.CPU81.TIMER
     29319            -5.3%      27768 =C2=B1  5%      -8.3%      26877 =C2=
=B1  9%  softirqs.CPU82.RCU
     26424            -9.2%      23994 =C2=B1 21%      -0.8%      26217 =C2=
=B1  2%  softirqs.CPU82.SCHED
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  softirqs.CPU82.TASKLET
     61.67 =C2=B1123%    +695.1%     490.29 =C2=B1221%      +1.0%      62.2=
9 =C2=B1115%  softirqs.CPU82.TIMER
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU83.BLOCK
     28437 =C2=B1  2%      -3.2%      27514 =C2=B1  9%      -6.6%      2654=
9 =C2=B1 12%  softirqs.CPU83.RCU
     24864 =C2=B1 17%      -1.0%      24618 =C2=B1 22%      +4.2%      2589=
9 =C2=B1  8%  softirqs.CPU83.SCHED
     34.00 =C2=B1 47%   +3393.3%       1187 =C2=B1197%   +2497.5%     883.1=
4 =C2=B1234%  softirqs.CPU83.TIMER
      0.00          -100.0%       0.00       +2.9e+101%       0.29 =C2=B124=
4%  softirqs.CPU84.BLOCK
     30751 =C2=B1 11%     -10.0%      27673 =C2=B1  7%     -15.1%      2610=
0 =C2=B1  9%  softirqs.CPU84.RCU
     26658            -0.7%      26466 =C2=B1  2%      +0.2%      26702    =
    softirqs.CPU84.SCHED
     30.83 =C2=B1 41%    +816.4%     282.57 =C2=B1203%   +1363.2%     451.1=
4 =C2=B1221%  softirqs.CPU84.TIMER
     28726            -3.2%      27814 =C2=B1  6%     -10.7%      25647 =C2=
=B1 11%  softirqs.CPU85.RCU
     26584            -8.6%      24285 =C2=B1 18%      -5.3%      25178 =C2=
=B1 16%  softirqs.CPU85.SCHED
     38.50 =C2=B1 71%    +487.4%     226.14 =C2=B1195%   +4588.7%       180=
5 =C2=B1241%  softirqs.CPU85.TIMER
     30567 =C2=B1  6%      -4.9%      29065 =C2=B1  5%      -9.2%      2774=
7 =C2=B1  9%  softirqs.CPU86.RCU
     25630 =C2=B1  7%      +1.1%      25900 =C2=B1  5%      +3.2%      2644=
2        softirqs.CPU86.SCHED
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  softirqs.CPU86.TASKLET
     33.83 =C2=B1 33%    +104.4%      69.14 =C2=B1119%      +3.0%      34.8=
6 =C2=B1 38%  softirqs.CPU86.TIMER
      0.33 =C2=B1223%    -100.0%       0.00         +1271.4%       4.57 =C2=
=B1244%  softirqs.CPU87.BLOCK
     29742            -2.7%      28950 =C2=B1  6%      -6.6%      27774 =C2=
=B1  9%  softirqs.CPU87.RCU
     26538            -6.7%      24757 =C2=B1 16%      -0.1%      26498    =
    softirqs.CPU87.SCHED
     54.67 =C2=B1136%      -3.3%      52.86 =C2=B1118%     -13.5%      47.2=
9 =C2=B1 57%  softirqs.CPU87.TIMER
      0.00       +8.6e+101%       0.86 =C2=B1244% +2.9e+101%       0.29 =C2=
=B1244%  softirqs.CPU88.BLOCK
     27728 =C2=B1  4%      -0.0%      27727 =C2=B1  6%      -6.4%      2596=
0 =C2=B1  9%  softirqs.CPU88.RCU
     24298 =C2=B1 24%     +10.5%      26846            +9.9%      26694    =
    softirqs.CPU88.SCHED
      0.00          -100.0%       0.00       +4.3e+101%       0.43 =C2=B124=
4%  softirqs.CPU88.TASKLET
    913.67 =C2=B1217%     -95.6%      39.86 =C2=B1 64%     -96.7%      30.0=
0 =C2=B1 23%  softirqs.CPU88.TIMER
      0.67 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU89.BLOCK
     28232 =C2=B1  2%      +0.2%      28281 =C2=B1  8%      -6.3%      2644=
0 =C2=B1  9%  softirqs.CPU89.RCU
     26759            -0.1%      26745           -25.0%      20074 =C2=B1 3=
8%  softirqs.CPU89.SCHED
    682.83 =C2=B1215%     -96.5%      23.71 =C2=B1 23%     -95.5%      30.5=
7 =C2=B1 49%  softirqs.CPU89.TIMER
      0.00       +2.9e+101%       0.29 =C2=B1244% +1.7e+102%       1.71 =C2=
=B1244%  softirqs.CPU9.BLOCK
     34251 =C2=B1  7%      +0.6%      34458 =C2=B1  3%      -7.6%      3165=
7 =C2=B1 12%  softirqs.CPU9.RCU
     26463 =C2=B1  2%      -1.6%      26052 =C2=B1  3%      -7.2%      2455=
3 =C2=B1 16%  softirqs.CPU9.SCHED
     39.50 =C2=B1  2%      -0.5%      39.29            +1.6%      40.14 =C2=
=B1  6%  softirqs.CPU9.TASKLET
     77.67 =C2=B1 76%     +22.1%      94.86 =C2=B1 83%    +436.4%     416.5=
7 =C2=B1196%  softirqs.CPU9.TIMER
      0.00       +7.4e+102%       7.43 =C2=B1244% +8.6e+101%       0.86 =C2=
=B1244%  softirqs.CPU90.BLOCK
     27923 =C2=B1  2%      +1.0%      28212 =C2=B1  8%      -7.0%      2596=
2 =C2=B1  9%  softirqs.CPU90.RCU
     26851           -14.8%      22876 =C2=B1 27%      -0.6%      26696    =
    softirqs.CPU90.SCHED
     32.00 =C2=B1 32%      +0.0%      32.00 =C2=B1 45%      +6.2%      34.0=
0 =C2=B1 27%  softirqs.CPU90.TIMER
      0.00       +2.9e+101%       0.29 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU91.BLOCK
     28519            -1.9%      27982 =C2=B1  6%      -7.8%      26290 =C2=
=B1  8%  softirqs.CPU91.RCU
     26824            -4.5%      25612 =C2=B1 12%      -8.7%      24479 =C2=
=B1 22%  softirqs.CPU91.SCHED
     36.50 =C2=B1 79%     -29.2%      25.86 =C2=B1 12%     +96.9%      71.8=
6 =C2=B1 93%  softirqs.CPU91.TIMER
      0.00          -100.0%       0.00       +6.3e+102%       6.29 =C2=B124=
4%  softirqs.CPU92.BLOCK
     29597            -1.8%      29053 =C2=B1  5%      -4.5%      28280 =C2=
=B1 11%  softirqs.CPU92.RCU
     26635            -3.1%      25805 =C2=B1  3%      -8.0%      24511 =C2=
=B1 16%  softirqs.CPU92.SCHED
      0.50 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU92.TASKLET
     32.00 =C2=B1 30%     +26.8%      40.57 =C2=B1 44%      +6.7%      34.1=
4 =C2=B1 28%  softirqs.CPU92.TIMER
      4.67 =C2=B1223%    +169.4%      12.57 =C2=B1244%     -44.9%       2.5=
7 =C2=B1244%  softirqs.CPU93.BLOCK
     29962 =C2=B1  2%      -2.9%      29087 =C2=B1  5%      -8.2%      2750=
2 =C2=B1  9%  softirqs.CPU93.RCU
     26661            -7.6%      24639 =C2=B1 17%      -0.6%      26491    =
    softirqs.CPU93.SCHED
     44.83 =C2=B1 82%     -29.3%      31.71 =C2=B1 38%     -42.3%      25.8=
6 =C2=B1 26%  softirqs.CPU93.TIMER
      0.00          -100.0%       0.00       +2.3e+102%       2.29 =C2=B124=
4%  softirqs.CPU94.BLOCK
     28276 =C2=B1  2%      -2.4%      27587 =C2=B1  6%      -5.0%      2685=
1 =C2=B1 10%  softirqs.CPU94.RCU
     26718            -8.7%      24387 =C2=B1 13%      -1.2%      26410 =C2=
=B1  5%  softirqs.CPU94.SCHED
     31.83 =C2=B1 42%   +1174.0%     405.57 =C2=B1189%    +930.8%     328.1=
4 =C2=B1220%  softirqs.CPU94.TIMER
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU95.NET_TX
     28449            -3.7%      27383 =C2=B1  3%      -8.0%      26174 =C2=
=B1 10%  softirqs.CPU95.RCU
     26716            -0.6%      26568 =C2=B1  2%     -20.7%      21199 =C2=
=B1 32%  softirqs.CPU95.SCHED
     34.33 =C2=B1 48%   +2344.9%     839.43 =C2=B1226%    +105.1%      70.4=
3 =C2=B1157%  softirqs.CPU95.TIMER
      0.67 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU96.BLOCK
     28571            -3.7%      27517 =C2=B1  4%      -7.4%      26449 =C2=
=B1  6%  softirqs.CPU96.RCU
     26659            +0.1%      26696            -7.7%      24615 =C2=B1 2=
1%  softirqs.CPU96.SCHED
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  softirqs.CPU96.TASKLET
     38.67 =C2=B1 61%     -26.8%      28.29 =C2=B1 35%   +2223.2%     898.2=
9 =C2=B1179%  softirqs.CPU96.TIMER
      5.33 =C2=B1207%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU97.BLOCK
     28413 =C2=B1  2%      -2.8%      27618 =C2=B1  5%      -9.5%      2572=
2 =C2=B1 11%  softirqs.CPU97.RCU
     26610            +0.1%      26638           -11.6%      23514 =C2=B1 2=
2%  softirqs.CPU97.SCHED
     24.00 =C2=B1 35%     +25.6%      30.14 =C2=B1 51%   +5680.4%       138=
7 =C2=B1228%  softirqs.CPU97.TIMER
      0.00         +4e+102%       4.00 =C2=B1244%    -100.0%       0.00    =
    softirqs.CPU98.BLOCK
     29489 =C2=B1  6%      -4.3%      28235 =C2=B1  7%      -9.7%      2663=
5 =C2=B1  7%  softirqs.CPU98.RCU
     22673 =C2=B1 24%     +16.7%      26470 =C2=B1  4%      +8.6%      2463=
1 =C2=B1 19%  softirqs.CPU98.SCHED
     30.67 =C2=B1 43%   +1042.2%     350.29 =C2=B1182%     +31.4%      40.2=
9 =C2=B1 72%  softirqs.CPU98.TIMER
     28764 =C2=B1  2%      -0.9%      28518 =C2=B1  6%      -7.3%      2665=
6 =C2=B1  9%  softirqs.CPU99.RCU
     26541 =C2=B1  3%      +0.6%      26707           -14.6%      22672 =C2=
=B1 27%  softirqs.CPU99.SCHED
      7.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU99.TASKLET
     51.50 =C2=B1109%     +17.6%      60.57 =C2=B1127%     -39.3%      31.2=
9 =C2=B1 27%  softirqs.CPU99.TIMER
      5.00            +0.0%       5.00            +0.0%       5.00        s=
oftirqs.HI
      5719 =C2=B1 31%    +134.4%      13408 =C2=B1 48%     +96.5%      1124=
1 =C2=B1 85%  softirqs.NET_RX
     47.50 =C2=B1  2%      -5.3%      45.00 =C2=B1  2%      -2.6%      46.2=
9 =C2=B1  2%  softirqs.NET_TX
   7687317 =C2=B1  2%      -2.5%    7491437 =C2=B1  5%      -7.6%    710551=
2 =C2=B1  9%  softirqs.RCU
   6434341            -0.4%    6410958            +0.5%    6463474        s=
oftirqs.SCHED
    291.67            -0.5%     290.29            -0.6%     289.86        s=
oftirqs.TASKLET
     53620 =C2=B1  2%      +0.2%      53743 =C2=B1  3%      +4.2%      5586=
0 =C2=B1  2%  softirqs.TIMER
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.0:IR-IO-APIC.2-edge.timer
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.18:IR-IO-APIC.18-fasteoi.ehci_hcd:usb1,ehci_hcd:usb2,i801_smbus
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.31:IR-PCI-MSI.2621440-edge.eth0
      1577 =C2=B1 96%     -39.2%     958.43 =C2=B1 69%     +11.4%       175=
6 =C2=B1 61%  interrupts.32:IR-PCI-MSI.2621441-edge.eth0-TxRx-0
      1397 =C2=B1130%    +247.5%       4856 =C2=B1131%    +394.9%       691=
6 =C2=B1168%  interrupts.33:IR-PCI-MSI.2621442-edge.eth0-TxRx-1
      1193 =C2=B1 41%    +610.9%       8486 =C2=B1153%    +268.6%       440=
0 =C2=B1106%  interrupts.34:IR-PCI-MSI.2621443-edge.eth0-TxRx-2
      2739 =C2=B1 77%    +175.6%       7550 =C2=B1161%     -40.1%       164=
2 =C2=B1 42%  interrupts.35:IR-PCI-MSI.2621444-edge.eth0-TxRx-3
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.37:IR-PCI-MSI.3145729-edge
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.38:IR-PCI-MSI.3145730-edge
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.39:IR-PCI-MSI.3145731-edge
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.3:IR-IO-APIC.3-edge
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.40:IR-PCI-MSI.3145732-edge
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.41:IR-PCI-MSI.327680-edge.xhci_hcd
      3.00            +0.0%       3.00            +0.0%       3.00        i=
nterrupts.42:IR-PCI-MSI.512000-edge.ahci[0000:00:1f.2]
     40.67 =C2=B1  4%      -0.9%      40.29 =C2=B1  4%      -0.9%      40.2=
9 =C2=B1  4%  interrupts.4:IR-IO-APIC.4-edge.ttyS0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.8:IR-IO-APIC.8-edge.rtc0
      0.00          -100.0%       0.00       +5.7e+104%     574.71 =C2=B1 4=
0%  interrupts.9:IR-IO-APIC.9-fasteoi.acpi
    353302            +0.1%     353702            -0.3%     352337        i=
nterrupts.CAL:Function_call_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU0.0:IR-IO-APIC.2-edge.timer
    938.00 =C2=B1 21%     -11.1%     833.86 =C2=B1 16%     -20.0%     750.2=
9 =C2=B1  4%  interrupts.CPU0.CAL:Function_call_interrupts
    602641            -0.1%     601787            -7.2%     559520 =C2=B1 1=
8%  interrupts.CPU0.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU0.MCP:Machine_check_polls
    210.00 =C2=B1 26%      -4.1%     201.29 =C2=B1 31%     +25.2%     262.8=
6 =C2=B1 38%  interrupts.CPU0.NMI:Non-maskable_interrupts
    210.00 =C2=B1 26%      -4.1%     201.29 =C2=B1 31%     +25.2%     262.8=
6 =C2=B1 38%  interrupts.CPU0.PMI:Performance_monitoring_interrupts
      8.83 =C2=B1 34%      +8.4%       9.57 =C2=B1 68%    +207.3%      27.1=
4 =C2=B1 32%  interrupts.CPU0.RES:Rescheduling_interrupts
     14.17 =C2=B1 17%     +18.0%      16.71 =C2=B1 12%     +16.0%      16.4=
3 =C2=B1 22%  interrupts.CPU0.TLB:TLB_shootdowns
      0.00          -100.0%       0.00       +5.7e+104%     574.71 =C2=B1 4=
0%  interrupts.CPU1.9:IR-IO-APIC.9-fasteoi.acpi
      1371 =C2=B1  5%     +18.9%       1630 =C2=B1 19%     +16.1%       159=
2 =C2=B1 18%  interrupts.CPU1.CAL:Function_call_interrupts
      0.50 =C2=B1223%    -100.0%       0.00           -71.4%       0.14 =C2=
=B1244%  interrupts.CPU1.IWI:IRQ_work_interrupts
    602267            -0.3%     600723            -7.1%     559218 =C2=B1 1=
8%  interrupts.CPU1.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU1.MCP:Machine_check_polls
    994.33 =C2=B1172%     -78.9%     210.29 =C2=B1 33%     -77.8%     220.8=
6 =C2=B1 40%  interrupts.CPU1.NMI:Non-maskable_interrupts
    994.33 =C2=B1172%     -78.9%     210.29 =C2=B1 33%     -77.8%     220.8=
6 =C2=B1 40%  interrupts.CPU1.PMI:Performance_monitoring_interrupts
     20.17 =C2=B1 36%     +42.4%      28.71 =C2=B1 31%     +16.2%      23.4=
3 =C2=B1 27%  interrupts.CPU1.RES:Rescheduling_interrupts
    103.00 =C2=B1160%     -69.5%      31.43 =C2=B1 34%     -79.3%      21.2=
9 =C2=B1 16%  interrupts.CPU1.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU10.8:IR-IO-APIC.8-edge.rtc0
      1651 =C2=B1  8%      -7.3%       1531 =C2=B1  9%      -3.7%       159=
1 =C2=B1 12%  interrupts.CPU10.CAL:Function_call_interrupts
    602439            -1.0%     596259 =C2=B1  2%      -7.2%     559157 =C2=
=B1 18%  interrupts.CPU10.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU10.MCP:Machine_check_polls
    264.83 =C2=B1 33%     -30.4%     184.29 =C2=B1  8%      +1.2%     268.0=
0 =C2=B1 33%  interrupts.CPU10.NMI:Non-maskable_interrupts
    264.83 =C2=B1 33%     -30.4%     184.29 =C2=B1  8%      +1.2%     268.0=
0 =C2=B1 33%  interrupts.CPU10.PMI:Performance_monitoring_interrupts
     58.33 =C2=B1 17%     -12.1%      51.29 =C2=B1 51%     -13.1%      50.7=
1 =C2=B1 30%  interrupts.CPU10.RES:Rescheduling_interrupts
     69.17 =C2=B1 10%      -9.9%      62.29 =C2=B1 17%     -20.5%      55.0=
0 =C2=B1 37%  interrupts.CPU10.TLB:TLB_shootdowns
      1286 =C2=B1  3%      -1.6%       1265 =C2=B1  3%      +1.0%       130=
0 =C2=B1  6%  interrupts.CPU100.CAL:Function_call_interrupts
    602219            -2.9%     584454 =C2=B1  7%      -7.1%     559229 =C2=
=B1 18%  interrupts.CPU100.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU100.MCP:Machine_check_polls
    276.17 =C2=B1 33%     -23.1%     212.43 =C2=B1  6%     +20.5%     332.8=
6 =C2=B1 29%  interrupts.CPU100.NMI:Non-maskable_interrupts
    276.17 =C2=B1 33%     -23.1%     212.43 =C2=B1  6%     +20.5%     332.8=
6 =C2=B1 29%  interrupts.CPU100.PMI:Performance_monitoring_interrupts
     17.83 =C2=B1 26%     -15.1%      15.14 =C2=B1 33%     +10.5%      19.7=
1 =C2=B1 93%  interrupts.CPU100.RES:Rescheduling_interrupts
     16.17 =C2=B1 22%     +27.2%      20.57 =C2=B1 44%      +3.4%      16.7=
1 =C2=B1 19%  interrupts.CPU100.TLB:TLB_shootdowns
      1225            +2.7%       1259 =C2=B1  4%      -5.2%       1161 =C2=
=B1 14%  interrupts.CPU101.CAL:Function_call_interrupts
    602064            -2.9%     584427 =C2=B1  7%      -7.1%     559262 =C2=
=B1 18%  interrupts.CPU101.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU101.MCP:Machine_check_polls
    323.67 =C2=B1 30%     +33.6%     432.43 =C2=B1 50%      +0.1%     324.1=
4 =C2=B1 38%  interrupts.CPU101.NMI:Non-maskable_interrupts
    323.67 =C2=B1 30%     +33.6%     432.43 =C2=B1 50%      +0.1%     324.1=
4 =C2=B1 38%  interrupts.CPU101.PMI:Performance_monitoring_interrupts
     10.83 =C2=B1 30%     +74.1%      18.86 =C2=B1 64%      +4.2%      11.2=
9 =C2=B1 42%  interrupts.CPU101.RES:Rescheduling_interrupts
     10.83 =C2=B1 11%     +13.4%      12.29 =C2=B1 38%      -5.1%      10.2=
9 =C2=B1 26%  interrupts.CPU101.TLB:TLB_shootdowns
      1249 =C2=B1  3%      +3.6%       1294 =C2=B1  2%      +4.5%       130=
6 =C2=B1  5%  interrupts.CPU102.CAL:Function_call_interrupts
    602248            -3.3%     582586 =C2=B1  8%      -7.1%     559238 =C2=
=B1 18%  interrupts.CPU102.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU102.MCP:Machine_check_polls
    281.50 =C2=B1 33%     +24.7%     351.00 =C2=B1 25%      +8.4%     305.2=
9 =C2=B1 34%  interrupts.CPU102.NMI:Non-maskable_interrupts
    281.50 =C2=B1 33%     +24.7%     351.00 =C2=B1 25%      +8.4%     305.2=
9 =C2=B1 34%  interrupts.CPU102.PMI:Performance_monitoring_interrupts
     13.83 =C2=B1 68%     +71.4%      23.71 =C2=B1 32%     +50.8%      20.8=
6 =C2=B1 68%  interrupts.CPU102.RES:Rescheduling_interrupts
     14.17 =C2=B1 47%      +5.9%      15.00 =C2=B1 22%     +32.1%      18.7=
1 =C2=B1 24%  interrupts.CPU102.TLB:TLB_shootdowns
      1235 =C2=B1  2%      +1.0%       1248 =C2=B1 15%      +0.1%       123=
7 =C2=B1  2%  interrupts.CPU103.CAL:Function_call_interrupts
      0.17 =C2=B1223%    +328.6%       0.71 =C2=B1244%    -100.0%       0.0=
0        interrupts.CPU103.IWI:IRQ_work_interrupts
    602220            -3.6%     580424 =C2=B1  9%      -7.2%     559091 =C2=
=B1 18%  interrupts.CPU103.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU103.MCP:Machine_check_polls
    580.33 =C2=B1126%     -50.4%     288.00 =C2=B1 43%     -35.6%     373.5=
7 =C2=B1 26%  interrupts.CPU103.NMI:Non-maskable_interrupts
    580.33 =C2=B1126%     -50.4%     288.00 =C2=B1 43%     -35.6%     373.5=
7 =C2=B1 26%  interrupts.CPU103.PMI:Performance_monitoring_interrupts
      8.17 =C2=B1 58%     +22.4%      10.00 =C2=B1 54%     +48.7%      12.1=
4 =C2=B1 46%  interrupts.CPU103.RES:Rescheduling_interrupts
     10.33 =C2=B1 22%      -0.5%      10.29 =C2=B1 17%      -4.6%       9.8=
6 =C2=B1 33%  interrupts.CPU103.TLB:TLB_shootdowns
      1292 =C2=B1  3%      -1.9%       1268 =C2=B1  4%      -2.7%       125=
7 =C2=B1  3%  interrupts.CPU104.CAL:Function_call_interrupts
    602286            -0.9%     597055 =C2=B1  2%      -7.2%     559089 =C2=
=B1 18%  interrupts.CPU104.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU104.MCP:Machine_check_polls
    279.17 =C2=B1 25%     -13.2%     242.43 =C2=B1 35%      -3.6%     269.0=
0 =C2=B1 37%  interrupts.CPU104.NMI:Non-maskable_interrupts
    279.17 =C2=B1 25%     -13.2%     242.43 =C2=B1 35%      -3.6%     269.0=
0 =C2=B1 37%  interrupts.CPU104.PMI:Performance_monitoring_interrupts
     17.67 =C2=B1 25%     -36.1%      11.29 =C2=B1 56%     -19.9%      14.1=
4 =C2=B1 32%  interrupts.CPU104.RES:Rescheduling_interrupts
     18.17 =C2=B1 16%     -27.7%      13.14 =C2=B1 32%      -4.1%      17.4=
3 =C2=B1 15%  interrupts.CPU104.TLB:TLB_shootdowns
      1285 =C2=B1  9%      +2.2%       1313 =C2=B1 10%      -3.2%       124=
4        interrupts.CPU105.CAL:Function_call_interrupts
    602223            -2.4%     587692 =C2=B1  6%      -7.2%     559089 =C2=
=B1 18%  interrupts.CPU105.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU105.MCP:Machine_check_polls
    275.83 =C2=B1 32%      -4.2%     264.29 =C2=B1 33%      -5.2%     261.4=
3 =C2=B1 38%  interrupts.CPU105.NMI:Non-maskable_interrupts
    275.83 =C2=B1 32%      -4.2%     264.29 =C2=B1 33%      -5.2%     261.4=
3 =C2=B1 38%  interrupts.CPU105.PMI:Performance_monitoring_interrupts
     10.00 =C2=B1 21%      +4.3%      10.43 =C2=B1 22%     +28.6%      12.8=
6 =C2=B1 36%  interrupts.CPU105.RES:Rescheduling_interrupts
      9.33 =C2=B1 24%     +11.7%      10.43 =C2=B1 28%     +14.8%      10.7=
1 =C2=B1 35%  interrupts.CPU105.TLB:TLB_shootdowns
      1200 =C2=B1 17%     +22.2%       1465 =C2=B1 27%      +9.7%       131=
5 =C2=B1  7%  interrupts.CPU106.CAL:Function_call_interrupts
    602107            -3.6%     580540 =C2=B1  9%      -7.1%     559257 =C2=
=B1 18%  interrupts.CPU106.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU106.MCP:Machine_check_polls
    275.17 =C2=B1 32%      -4.3%     263.43 =C2=B1 30%      -6.8%     256.4=
3 =C2=B1 42%  interrupts.CPU106.NMI:Non-maskable_interrupts
    275.17 =C2=B1 32%      -4.3%     263.43 =C2=B1 30%      -6.8%     256.4=
3 =C2=B1 42%  interrupts.CPU106.PMI:Performance_monitoring_interrupts
     16.17 =C2=B1 40%    +120.0%      35.57 =C2=B1113%     +16.6%      18.8=
6 =C2=B1125%  interrupts.CPU106.RES:Rescheduling_interrupts
     20.17 =C2=B1 45%      -5.1%      19.14 =C2=B1 23%     -25.6%      15.0=
0 =C2=B1 29%  interrupts.CPU106.TLB:TLB_shootdowns
      1238            +4.1%       1289 =C2=B1  9%      +1.0%       1250 =C2=
=B1  2%  interrupts.CPU107.CAL:Function_call_interrupts
    601964            -2.4%     587496 =C2=B1  6%      -7.1%     558956 =C2=
=B1 18%  interrupts.CPU107.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU107.MCP:Machine_check_polls
    243.83 =C2=B1 29%     +12.0%     273.14 =C2=B1 36%      -5.8%     229.5=
7 =C2=B1 36%  interrupts.CPU107.NMI:Non-maskable_interrupts
    243.83 =C2=B1 29%     +12.0%     273.14 =C2=B1 36%      -5.8%     229.5=
7 =C2=B1 36%  interrupts.CPU107.PMI:Performance_monitoring_interrupts
     11.67 =C2=B1 45%     +42.0%      16.57 =C2=B1 92%      +6.5%      12.4=
3 =C2=B1 43%  interrupts.CPU107.RES:Rescheduling_interrupts
     12.00 =C2=B1 35%     +17.9%      14.14 =C2=B1 35%     -15.5%      10.1=
4 =C2=B1 23%  interrupts.CPU107.TLB:TLB_shootdowns
      1254 =C2=B1  2%      +8.0%       1354 =C2=B1 11%      -0.2%       125=
1 =C2=B1  2%  interrupts.CPU108.CAL:Function_call_interrupts
    602052            -1.0%     596224 =C2=B1  2%      -7.1%     559206 =C2=
=B1 18%  interrupts.CPU108.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU108.MCP:Machine_check_polls
    200.83 =C2=B1 28%     +35.6%     272.29 =C2=B1 31%      -6.4%     188.0=
0 =C2=B1 36%  interrupts.CPU108.NMI:Non-maskable_interrupts
    200.83 =C2=B1 28%     +35.6%     272.29 =C2=B1 31%      -6.4%     188.0=
0 =C2=B1 36%  interrupts.CPU108.PMI:Performance_monitoring_interrupts
     11.33 =C2=B1 26%    +129.4%      26.00 =C2=B1 93%     +12.2%      12.7=
1 =C2=B1 64%  interrupts.CPU108.RES:Rescheduling_interrupts
     18.17 =C2=B1 11%     -12.7%      15.86 =C2=B1 27%     -17.4%      15.0=
0 =C2=B1 40%  interrupts.CPU108.TLB:TLB_shootdowns
      1244            +4.8%       1303 =C2=B1  8%      -0.9%       1233    =
    interrupts.CPU109.CAL:Function_call_interrupts
    602090            -1.2%     594801 =C2=B1  3%      -7.1%     559235 =C2=
=B1 18%  interrupts.CPU109.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU109.MCP:Machine_check_polls
    228.33 =C2=B1 33%      +7.4%     245.29 =C2=B1 34%      -6.0%     214.5=
7 =C2=B1 41%  interrupts.CPU109.NMI:Non-maskable_interrupts
    228.33 =C2=B1 33%      +7.4%     245.29 =C2=B1 34%      -6.0%     214.5=
7 =C2=B1 41%  interrupts.CPU109.PMI:Performance_monitoring_interrupts
      9.50 =C2=B1 52%     +82.0%      17.29 =C2=B1 98%     +11.3%      10.5=
7 =C2=B1 29%  interrupts.CPU109.RES:Rescheduling_interrupts
     10.33 =C2=B1 26%      +2.3%      10.57 =C2=B1 13%      -7.4%       9.5=
7 =C2=B1 14%  interrupts.CPU109.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU11.31:IR-PCI-MSI.2621440-edge.eth0
      1320 =C2=B1  3%     +16.7%       1541 =C2=B1 31%      -1.1%       130=
6 =C2=B1  5%  interrupts.CPU11.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +4.3e+101%       0.43 =C2=B124=
4%  interrupts.CPU11.IWI:IRQ_work_interrupts
    602345            -0.9%     597193 =C2=B1  2%      -7.2%     559105 =C2=
=B1 18%  interrupts.CPU11.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU11.MCP:Machine_check_polls
    180.33 =C2=B1  2%     +30.6%     235.57 =C2=B1 41%     +52.7%     275.4=
3 =C2=B1 28%  interrupts.CPU11.NMI:Non-maskable_interrupts
    180.33 =C2=B1  2%     +30.6%     235.57 =C2=B1 41%     +52.7%     275.4=
3 =C2=B1 28%  interrupts.CPU11.PMI:Performance_monitoring_interrupts
     21.67 =C2=B1 18%     +75.4%      38.00 =C2=B1 89%      +6.2%      23.0=
0 =C2=B1 61%  interrupts.CPU11.RES:Rescheduling_interrupts
     14.83 =C2=B1 15%     +10.8%      16.43 =C2=B1 15%     +11.7%      16.5=
7 =C2=B1 23%  interrupts.CPU11.TLB:TLB_shootdowns
      1281 =C2=B1  3%      -0.3%       1277 =C2=B1  5%      -1.7%       126=
0 =C2=B1  3%  interrupts.CPU110.CAL:Function_call_interrupts
      0.00       +4.3e+101%       0.43 =C2=B1169%    -100.0%       0.00    =
    interrupts.CPU110.IWI:IRQ_work_interrupts
    602273            -3.0%     583980 =C2=B1  7%      -7.2%     559155 =C2=
=B1 18%  interrupts.CPU110.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU110.MCP:Machine_check_polls
    294.83 =C2=B1 32%     +68.5%     496.86 =C2=B1123%      +4.6%     308.4=
3 =C2=B1 40%  interrupts.CPU110.NMI:Non-maskable_interrupts
    294.83 =C2=B1 32%     +68.5%     496.86 =C2=B1123%      +4.6%     308.4=
3 =C2=B1 40%  interrupts.CPU110.PMI:Performance_monitoring_interrupts
     18.83 =C2=B1 29%     -10.5%      16.86 =C2=B1 63%     -31.7%      12.8=
6 =C2=B1 60%  interrupts.CPU110.RES:Rescheduling_interrupts
     17.83 =C2=B1  7%      -9.5%      16.14 =C2=B1 34%     -25.5%      13.2=
9 =C2=B1 36%  interrupts.CPU110.TLB:TLB_shootdowns
      1283 =C2=B1  5%      -4.9%       1220            -3.3%       1241    =
    interrupts.CPU111.CAL:Function_call_interrupts
    602123            -3.2%     582844 =C2=B1  8%      -7.1%     559178 =C2=
=B1 18%  interrupts.CPU111.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU111.MCP:Machine_check_polls
    292.67 =C2=B1 30%     -18.4%     238.71 =C2=B1 40%     -17.8%     240.5=
7 =C2=B1 41%  interrupts.CPU111.NMI:Non-maskable_interrupts
    292.67 =C2=B1 30%     -18.4%     238.71 =C2=B1 40%     -17.8%     240.5=
7 =C2=B1 41%  interrupts.CPU111.PMI:Performance_monitoring_interrupts
     11.33 =C2=B1 25%     -18.1%       9.29 =C2=B1 44%     +13.4%      12.8=
6 =C2=B1 38%  interrupts.CPU111.RES:Rescheduling_interrupts
      9.17 =C2=B1 17%      +7.5%       9.86 =C2=B1 28%      -1.8%       9.0=
0 =C2=B1 11%  interrupts.CPU111.TLB:TLB_shootdowns
      1251 =C2=B1  4%      +2.7%       1285 =C2=B1  2%      +2.5%       128=
2 =C2=B1  3%  interrupts.CPU112.CAL:Function_call_interrupts
      0.50 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU112.IWI:IRQ_work_interrupts
    602238            -2.5%     587237 =C2=B1  6%      -7.1%     559321 =C2=
=B1 18%  interrupts.CPU112.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU112.MCP:Machine_check_polls
    286.17 =C2=B1 40%      +7.9%     308.86 =C2=B1 30%     -14.2%     245.5=
7 =C2=B1 42%  interrupts.CPU112.NMI:Non-maskable_interrupts
    286.17 =C2=B1 40%      +7.9%     308.86 =C2=B1 30%     -14.2%     245.5=
7 =C2=B1 42%  interrupts.CPU112.PMI:Performance_monitoring_interrupts
     16.00 =C2=B1 52%     +17.0%      18.71 =C2=B1 37%     +12.5%      18.0=
0 =C2=B1 25%  interrupts.CPU112.RES:Rescheduling_interrupts
     14.00 =C2=B1 36%     +26.5%      17.71 =C2=B1 34%     +26.5%      17.7=
1 =C2=B1 22%  interrupts.CPU112.TLB:TLB_shootdowns
      1304 =C2=B1  8%      -6.3%       1221            -5.1%       1238 =C2=
=B1  2%  interrupts.CPU113.CAL:Function_call_interrupts
    602251            -3.2%     582996 =C2=B1  7%      -7.1%     559199 =C2=
=B1 18%  interrupts.CPU113.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU113.MCP:Machine_check_polls
    260.50 =C2=B1 34%      +8.9%     283.57 =C2=B1 36%     -18.7%     211.8=
6 =C2=B1 36%  interrupts.CPU113.NMI:Non-maskable_interrupts
    260.50 =C2=B1 34%      +8.9%     283.57 =C2=B1 36%     -18.7%     211.8=
6 =C2=B1 36%  interrupts.CPU113.PMI:Performance_monitoring_interrupts
     20.83 =C2=B1 66%     -67.1%       6.86 =C2=B1 25%     -48.6%      10.7=
1 =C2=B1 18%  interrupts.CPU113.RES:Rescheduling_interrupts
     16.17 =C2=B1 56%     -18.7%      13.14 =C2=B1 36%     -17.8%      13.2=
9 =C2=B1 23%  interrupts.CPU113.TLB:TLB_shootdowns
      1312 =C2=B1 10%      +5.2%       1380 =C2=B1 15%      -1.3%       129=
5 =C2=B1  3%  interrupts.CPU114.CAL:Function_call_interrupts
    602415            -2.5%     587652 =C2=B1  6%      -7.2%     559231 =C2=
=B1 18%  interrupts.CPU114.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU114.MCP:Machine_check_polls
    308.33 =C2=B1 35%      -6.6%     288.00 =C2=B1 33%     -19.2%     249.0=
0 =C2=B1 40%  interrupts.CPU114.NMI:Non-maskable_interrupts
    308.33 =C2=B1 35%      -6.6%     288.00 =C2=B1 33%     -19.2%     249.0=
0 =C2=B1 40%  interrupts.CPU114.PMI:Performance_monitoring_interrupts
     19.17 =C2=B1 72%     +58.8%      30.43 =C2=B1 71%     -11.3%      17.0=
0 =C2=B1 42%  interrupts.CPU114.RES:Rescheduling_interrupts
     12.00 =C2=B1 45%    +589.3%      82.71 =C2=B1184%     +45.2%      17.4=
3 =C2=B1 24%  interrupts.CPU114.TLB:TLB_shootdowns
      1280 =C2=B1  6%      +6.6%       1365 =C2=B1 13%      -3.5%       123=
5 =C2=B1  2%  interrupts.CPU115.CAL:Function_call_interrupts
    602230            -3.4%     581740 =C2=B1  8%      -7.1%     559193 =C2=
=B1 18%  interrupts.CPU115.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU115.MCP:Machine_check_polls
    285.67 =C2=B1 35%     -19.1%     231.00 =C2=B1 29%      -5.1%     271.0=
0 =C2=B1 40%  interrupts.CPU115.NMI:Non-maskable_interrupts
    285.67 =C2=B1 35%     -19.1%     231.00 =C2=B1 29%      -5.1%     271.0=
0 =C2=B1 40%  interrupts.CPU115.PMI:Performance_monitoring_interrupts
     12.50 =C2=B1 25%     +87.4%      23.43 =C2=B1 85%     -21.1%       9.8=
6 =C2=B1 46%  interrupts.CPU115.RES:Rescheduling_interrupts
     12.50 =C2=B1 51%     +47.4%      18.43 =C2=B1104%     -21.1%       9.8=
6 =C2=B1 36%  interrupts.CPU115.TLB:TLB_shootdowns
      1411 =C2=B1 26%      -7.6%       1303 =C2=B1  5%      -7.9%       129=
9 =C2=B1  5%  interrupts.CPU116.CAL:Function_call_interrupts
    602260            -2.7%     585943 =C2=B1  6%      -7.1%     559278 =C2=
=B1 18%  interrupts.CPU116.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU116.MCP:Machine_check_polls
    246.67 =C2=B1 30%     +12.4%     277.29 =C2=B1 35%     +10.7%     273.1=
4 =C2=B1 36%  interrupts.CPU116.NMI:Non-maskable_interrupts
    246.67 =C2=B1 30%     +12.4%     277.29 =C2=B1 35%     +10.7%     273.1=
4 =C2=B1 36%  interrupts.CPU116.PMI:Performance_monitoring_interrupts
     12.50 =C2=B1 31%     +78.3%      22.29 =C2=B1 55%      +0.6%      12.5=
7 =C2=B1 28%  interrupts.CPU116.RES:Rescheduling_interrupts
     15.33 =C2=B1 55%      +0.6%      15.43 =C2=B1 23%     -21.7%      12.0=
0 =C2=B1 23%  interrupts.CPU116.TLB:TLB_shootdowns
      1230 =C2=B1  2%      -0.2%       1227            +0.2%       1232 =C2=
=B1  2%  interrupts.CPU117.CAL:Function_call_interrupts
      0.00       +2.9e+101%       0.29 =C2=B1244%    -100.0%       0.00    =
    interrupts.CPU117.IWI:IRQ_work_interrupts
    602274            -4.1%     577303 =C2=B1 10%      -7.1%     559289 =C2=
=B1 18%  interrupts.CPU117.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU117.MCP:Machine_check_polls
    284.00 =C2=B1 34%      +0.1%     284.29 =C2=B1 32%     -17.6%     234.0=
0 =C2=B1 36%  interrupts.CPU117.NMI:Non-maskable_interrupts
    284.00 =C2=B1 34%      +0.1%     284.29 =C2=B1 32%     -17.6%     234.0=
0 =C2=B1 36%  interrupts.CPU117.PMI:Performance_monitoring_interrupts
      8.67 =C2=B1 59%     +13.7%       9.86 =C2=B1 37%     +23.6%      10.7=
1 =C2=B1 44%  interrupts.CPU117.RES:Rescheduling_interrupts
     10.83 =C2=B1 30%      -6.4%      10.14 =C2=B1 17%     -10.3%       9.7=
1 =C2=B1 47%  interrupts.CPU117.TLB:TLB_shootdowns
      1289 =C2=B1  4%      -0.4%       1284 =C2=B1  4%      -0.3%       128=
5 =C2=B1  2%  interrupts.CPU118.CAL:Function_call_interrupts
    602267            -2.8%     585307 =C2=B1  6%      -7.2%     559157 =C2=
=B1 18%  interrupts.CPU118.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU118.MCP:Machine_check_polls
    324.17 =C2=B1 34%      -8.2%     297.71 =C2=B1 33%     -27.2%     235.8=
6 =C2=B1 37%  interrupts.CPU118.NMI:Non-maskable_interrupts
    324.17 =C2=B1 34%      -8.2%     297.71 =C2=B1 33%     -27.2%     235.8=
6 =C2=B1 37%  interrupts.CPU118.PMI:Performance_monitoring_interrupts
     13.00 =C2=B1 40%     +52.7%      19.86 =C2=B1 51%     +25.3%      16.2=
9 =C2=B1 41%  interrupts.CPU118.RES:Rescheduling_interrupts
     16.67 =C2=B1 29%      +7.1%      17.86 =C2=B1 24%      -8.3%      15.2=
9 =C2=B1 27%  interrupts.CPU118.TLB:TLB_shootdowns
      1272 =C2=B1  8%      -1.7%       1250 =C2=B1  2%      -0.2%       127=
0 =C2=B1  7%  interrupts.CPU119.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +2.9e+101%       0.29 =C2=B124=
4%  interrupts.CPU119.IWI:IRQ_work_interrupts
    602271            -3.9%     578591 =C2=B1  9%      -7.2%     559178 =C2=
=B1 18%  interrupts.CPU119.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU119.MCP:Machine_check_polls
    311.83 =C2=B1 33%     +12.9%     352.00 =C2=B1 26%     +78.9%     557.8=
6 =C2=B1142%  interrupts.CPU119.NMI:Non-maskable_interrupts
    311.83 =C2=B1 33%     +12.9%     352.00 =C2=B1 26%     +78.9%     557.8=
6 =C2=B1142%  interrupts.CPU119.PMI:Performance_monitoring_interrupts
     14.67 =C2=B1 71%     -10.4%      13.14 =C2=B1 39%     -46.4%       7.8=
6 =C2=B1 41%  interrupts.CPU119.RES:Rescheduling_interrupts
     16.17 =C2=B1 91%     -32.8%      10.86 =C2=B1 15%     -36.4%      10.2=
9 =C2=B1 21%  interrupts.CPU119.TLB:TLB_shootdowns
      1577 =C2=B1 96%     -39.2%     958.43 =C2=B1 69%     +11.4%       175=
6 =C2=B1 61%  interrupts.CPU12.32:IR-PCI-MSI.2621441-edge.eth0-TxRx-0
      1654 =C2=B1 10%      -2.5%       1613 =C2=B1 13%      -5.1%       156=
9 =C2=B1 10%  interrupts.CPU12.CAL:Function_call_interrupts
    602141            -3.4%     581940 =C2=B1  8%      -7.1%     559223 =C2=
=B1 18%  interrupts.CPU12.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU12.MCP:Machine_check_polls
    252.33 =C2=B1 34%      -5.5%     238.43 =C2=B1 35%      -8.2%     231.5=
7 =C2=B1 40%  interrupts.CPU12.NMI:Non-maskable_interrupts
    252.33 =C2=B1 34%      -5.5%     238.43 =C2=B1 35%      -8.2%     231.5=
7 =C2=B1 40%  interrupts.CPU12.PMI:Performance_monitoring_interrupts
     47.50 =C2=B1 45%     +17.6%      55.86 =C2=B1 34%     +26.3%      60.0=
0 =C2=B1 31%  interrupts.CPU12.RES:Rescheduling_interrupts
     59.67 =C2=B1 28%      +0.3%      59.86 =C2=B1 23%     +17.3%      70.0=
0 =C2=B1 27%  interrupts.CPU12.TLB:TLB_shootdowns
      1340 =C2=B1  3%      -3.3%       1296 =C2=B1  2%      +1.0%       135=
4 =C2=B1 11%  interrupts.CPU120.CAL:Function_call_interrupts
    602140            -2.5%     586956 =C2=B1  6%      -7.1%     559422 =C2=
=B1 18%  interrupts.CPU120.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU120.MCP:Machine_check_polls
    263.17 =C2=B1 32%      -4.2%     252.14 =C2=B1 31%      -7.1%     244.5=
7 =C2=B1 41%  interrupts.CPU120.NMI:Non-maskable_interrupts
    263.17 =C2=B1 32%      -4.2%     252.14 =C2=B1 31%      -7.1%     244.5=
7 =C2=B1 41%  interrupts.CPU120.PMI:Performance_monitoring_interrupts
     23.33 =C2=B1 31%     -27.8%      16.86 =C2=B1 48%     +40.8%      32.8=
6 =C2=B1122%  interrupts.CPU120.RES:Rescheduling_interrupts
     15.17 =C2=B1 29%     +13.0%      17.14 =C2=B1 21%      +5.5%      16.0=
0 =C2=B1 30%  interrupts.CPU120.TLB:TLB_shootdowns
      1224            +2.0%       1248 =C2=B1  3%      +7.4%       1314 =C2=
=B1  7%  interrupts.CPU121.CAL:Function_call_interrupts
    602087            -2.8%     585081 =C2=B1  7%      -7.1%     559254 =C2=
=B1 18%  interrupts.CPU121.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU121.MCP:Machine_check_polls
    231.00 =C2=B1 27%      +8.7%     251.00 =C2=B1 36%     +13.5%     262.2=
9 =C2=B1 37%  interrupts.CPU121.NMI:Non-maskable_interrupts
    231.00 =C2=B1 27%      +8.7%     251.00 =C2=B1 36%     +13.5%     262.2=
9 =C2=B1 37%  interrupts.CPU121.PMI:Performance_monitoring_interrupts
     10.50 =C2=B1 41%      -7.5%       9.71 =C2=B1 66%    +113.6%      22.4=
3 =C2=B1 66%  interrupts.CPU121.RES:Rescheduling_interrupts
      9.67 =C2=B1 28%     +37.4%      13.29 =C2=B1 34%     +65.5%      16.0=
0 =C2=B1 29%  interrupts.CPU121.TLB:TLB_shootdowns
      1311 =C2=B1  3%      +4.2%       1366 =C2=B1 12%     +15.4%       151=
3 =C2=B1 29%  interrupts.CPU122.CAL:Function_call_interrupts
    602143            -2.8%     585452 =C2=B1  7%      -7.1%     559151 =C2=
=B1 18%  interrupts.CPU122.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU122.MCP:Machine_check_polls
    266.00 =C2=B1 33%     +17.6%     312.71 =C2=B1 44%      -7.1%     247.1=
4 =C2=B1 42%  interrupts.CPU122.NMI:Non-maskable_interrupts
    266.00 =C2=B1 33%     +17.6%     312.71 =C2=B1 44%      -7.1%     247.1=
4 =C2=B1 42%  interrupts.CPU122.PMI:Performance_monitoring_interrupts
     18.67 =C2=B1 27%     +40.1%      26.14 =C2=B1 86%     +93.6%      36.1=
4 =C2=B1111%  interrupts.CPU122.RES:Rescheduling_interrupts
     19.33 =C2=B1 44%     -12.8%      16.86 =C2=B1 20%     -23.2%      14.8=
6 =C2=B1 32%  interrupts.CPU122.TLB:TLB_shootdowns
      1255 =C2=B1  3%      +1.8%       1278 =C2=B1  7%      +3.9%       130=
3 =C2=B1 12%  interrupts.CPU123.CAL:Function_call_interrupts
    602119            -3.5%     581166 =C2=B1  8%      -7.1%     559190 =C2=
=B1 18%  interrupts.CPU123.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU123.MCP:Machine_check_polls
    233.00 =C2=B1 33%     +45.2%     338.43 =C2=B1 26%      -8.3%     213.5=
7 =C2=B1 36%  interrupts.CPU123.NMI:Non-maskable_interrupts
    233.00 =C2=B1 33%     +45.2%     338.43 =C2=B1 26%      -8.3%     213.5=
7 =C2=B1 36%  interrupts.CPU123.PMI:Performance_monitoring_interrupts
     16.00 =C2=B1 39%     -32.1%      10.86 =C2=B1116%     +38.4%      22.1=
4 =C2=B1138%  interrupts.CPU123.RES:Rescheduling_interrupts
     11.83 =C2=B1 26%      -9.5%      10.71 =C2=B1 26%      -3.4%      11.4=
3 =C2=B1 18%  interrupts.CPU123.TLB:TLB_shootdowns
      1268 =C2=B1  2%      +2.0%       1293 =C2=B1  4%      +5.3%       133=
4 =C2=B1  9%  interrupts.CPU124.CAL:Function_call_interrupts
    602066            -2.8%     585157 =C2=B1  7%      -7.2%     559000 =C2=
=B1 18%  interrupts.CPU124.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU124.MCP:Machine_check_polls
    278.00 =C2=B1 33%     +27.7%     355.00 =C2=B1 25%     -16.6%     231.7=
1 =C2=B1 38%  interrupts.CPU124.NMI:Non-maskable_interrupts
    278.00 =C2=B1 33%     +27.7%     355.00 =C2=B1 25%     -16.6%     231.7=
1 =C2=B1 38%  interrupts.CPU124.PMI:Performance_monitoring_interrupts
     16.50 =C2=B1 30%     +33.3%      22.00 =C2=B1 42%     +36.8%      22.5=
7 =C2=B1 57%  interrupts.CPU124.RES:Rescheduling_interrupts
     16.00 =C2=B1 20%      +3.6%      16.57 =C2=B1 21%      +9.8%      17.5=
7 =C2=B1 20%  interrupts.CPU124.TLB:TLB_shootdowns
      1335 =C2=B1 19%      -7.3%       1238 =C2=B1  2%     -11.8%       117=
8 =C2=B1 15%  interrupts.CPU125.CAL:Function_call_interrupts
    602254            -4.1%     577856 =C2=B1 10%      -7.1%     559257 =C2=
=B1 18%  interrupts.CPU125.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU125.MCP:Machine_check_polls
    272.00 =C2=B1 35%      +6.8%     290.57 =C2=B1 32%     -12.4%     238.2=
9 =C2=B1 30%  interrupts.CPU125.NMI:Non-maskable_interrupts
    272.00 =C2=B1 35%      +6.8%     290.57 =C2=B1 32%     -12.4%     238.2=
9 =C2=B1 30%  interrupts.CPU125.PMI:Performance_monitoring_interrupts
      7.83 =C2=B1 46%     +89.7%      14.86 =C2=B1 44%     +78.7%      14.0=
0 =C2=B1 33%  interrupts.CPU125.RES:Rescheduling_interrupts
      9.50 =C2=B1 15%     +15.8%      11.00 =C2=B1 23%     +20.3%      11.4=
3 =C2=B1 18%  interrupts.CPU125.TLB:TLB_shootdowns
      1353 =C2=B1  3%      -2.2%       1324 =C2=B1  4%      +7.1%       145=
0 =C2=B1 19%  interrupts.CPU126.CAL:Function_call_interrupts
    602483            -2.7%     586200 =C2=B1  6%      -7.2%     558992 =C2=
=B1 18%  interrupts.CPU126.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU126.MCP:Machine_check_polls
    285.67 =C2=B1 35%     -17.1%     236.71 =C2=B1 23%      -7.5%     264.2=
9 =C2=B1 40%  interrupts.CPU126.NMI:Non-maskable_interrupts
    285.67 =C2=B1 35%     -17.1%     236.71 =C2=B1 23%      -7.5%     264.2=
9 =C2=B1 40%  interrupts.CPU126.PMI:Performance_monitoring_interrupts
     26.83 =C2=B1 34%      +2.2%      27.43 =C2=B1 35%     +39.5%      37.4=
3 =C2=B1 98%  interrupts.CPU126.RES:Rescheduling_interrupts
     24.00 =C2=B1 19%     -24.4%      18.14 =C2=B1 33%      +0.6%      24.1=
4 =C2=B1 28%  interrupts.CPU126.TLB:TLB_shootdowns
      1237            +5.2%       1301 =C2=B1  4%      +3.5%       1279 =C2=
=B1  4%  interrupts.CPU127.CAL:Function_call_interrupts
    602183            -4.4%     575869 =C2=B1 11%      -7.2%     559060 =C2=
=B1 18%  interrupts.CPU127.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU127.MCP:Machine_check_polls
    327.50 =C2=B1 34%      +0.4%     328.71 =C2=B1 45%     -27.8%     236.4=
3 =C2=B1 38%  interrupts.CPU127.NMI:Non-maskable_interrupts
    327.50 =C2=B1 34%      +0.4%     328.71 =C2=B1 45%     -27.8%     236.4=
3 =C2=B1 38%  interrupts.CPU127.PMI:Performance_monitoring_interrupts
     13.33 =C2=B1 31%     +70.4%      22.71 =C2=B1 45%     +14.6%      15.2=
9 =C2=B1 49%  interrupts.CPU127.RES:Rescheduling_interrupts
     10.50 =C2=B1 15%     +52.4%      16.00 =C2=B1 38%     +27.9%      13.4=
3 =C2=B1 17%  interrupts.CPU127.TLB:TLB_shootdowns
      1452 =C2=B1 36%     -14.7%       1238 =C2=B1  4%     -15.6%       122=
6        interrupts.CPU128.CAL:Function_call_interrupts
    602002            -2.9%     584363 =C2=B1  7%      -7.1%     559052 =C2=
=B1 18%  interrupts.CPU128.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU128.MCP:Machine_check_polls
    257.50 =C2=B1 30%     +21.1%     311.86 =C2=B1 29%     -14.1%     221.1=
4 =C2=B1 37%  interrupts.CPU128.NMI:Non-maskable_interrupts
    257.50 =C2=B1 30%     +21.1%     311.86 =C2=B1 29%     -14.1%     221.1=
4 =C2=B1 37%  interrupts.CPU128.PMI:Performance_monitoring_interrupts
      9.50 =C2=B1 24%      -2.3%       9.29 =C2=B1117%     -39.8%       5.7=
1 =C2=B1 67%  interrupts.CPU128.RES:Rescheduling_interrupts
      7.33 =C2=B1 17%     +24.7%       9.14 =C2=B1 48%      +9.1%       8.0=
0 =C2=B1 36%  interrupts.CPU128.TLB:TLB_shootdowns
      1219            +0.1%       1220           +14.2%       1392 =C2=B1 3=
1%  interrupts.CPU129.CAL:Function_call_interrupts
    601757            -2.1%     588982 =C2=B1  5%      -7.1%     558915 =C2=
=B1 18%  interrupts.CPU129.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU129.MCP:Machine_check_polls
    519.83 =C2=B1117%     -20.7%     412.14 =C2=B1  4%     -52.9%     244.8=
6 =C2=B1 31%  interrupts.CPU129.NMI:Non-maskable_interrupts
    519.83 =C2=B1117%     -20.7%     412.14 =C2=B1  4%     -52.9%     244.8=
6 =C2=B1 31%  interrupts.CPU129.PMI:Performance_monitoring_interrupts
      7.67 =C2=B1 25%      -8.7%       7.00 =C2=B1 31%     -25.5%       5.7=
1 =C2=B1 30%  interrupts.CPU129.RES:Rescheduling_interrupts
      9.83 =C2=B1 69%     -33.2%       6.57 =C2=B1 11%     -23.0%       7.5=
7 =C2=B1 41%  interrupts.CPU129.TLB:TLB_shootdowns
      1397 =C2=B1130%    +247.5%       4856 =C2=B1131%    +394.9%       691=
6 =C2=B1168%  interrupts.CPU13.33:IR-PCI-MSI.2621442-edge.eth0-TxRx-1
      1370 =C2=B1  6%      -0.4%       1365 =C2=B1  4%      -0.4%       136=
5 =C2=B1  3%  interrupts.CPU13.CAL:Function_call_interrupts
    602371            -2.8%     585259 =C2=B1  7%      -7.2%     559294 =C2=
=B1 18%  interrupts.CPU13.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU13.MCP:Machine_check_polls
    269.67 =C2=B1 35%      +2.2%     275.57 =C2=B1 28%      -8.5%     246.8=
6 =C2=B1 40%  interrupts.CPU13.NMI:Non-maskable_interrupts
    269.67 =C2=B1 35%      +2.2%     275.57 =C2=B1 28%      -8.5%     246.8=
6 =C2=B1 40%  interrupts.CPU13.PMI:Performance_monitoring_interrupts
     32.00 =C2=B1 51%     +27.2%      40.71 =C2=B1 46%      +1.3%      32.4=
3 =C2=B1 34%  interrupts.CPU13.RES:Rescheduling_interrupts
     22.50 =C2=B1 60%     -11.1%      20.00 =C2=B1 25%      -4.8%      21.4=
3 =C2=B1 26%  interrupts.CPU13.TLB:TLB_shootdowns
      1232            -0.6%       1224            +0.6%       1240 =C2=B1  =
2%  interrupts.CPU130.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  interrupts.CPU130.IWI:IRQ_work_interrupts
    602189            -1.3%     594108 =C2=B1  3%      -7.1%     559152 =C2=
=B1 18%  interrupts.CPU130.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU130.MCP:Machine_check_polls
    233.50 =C2=B1 35%     +81.9%     424.71 =C2=B1 54%     +10.4%     257.8=
6 =C2=B1 45%  interrupts.CPU130.NMI:Non-maskable_interrupts
    233.50 =C2=B1 35%     +81.9%     424.71 =C2=B1 54%     +10.4%     257.8=
6 =C2=B1 45%  interrupts.CPU130.PMI:Performance_monitoring_interrupts
      9.33 =C2=B1 34%     -28.1%       6.71 =C2=B1 72%     +25.5%      11.7=
1 =C2=B1 44%  interrupts.CPU130.RES:Rescheduling_interrupts
      9.67 =C2=B1 22%     +10.8%      10.71 =C2=B1 33%      +0.5%       9.7=
1 =C2=B1 35%  interrupts.CPU130.TLB:TLB_shootdowns
      1215            +0.5%       1221            +3.8%       1261 =C2=B1  =
5%  interrupts.CPU131.CAL:Function_call_interrupts
    602190            -1.9%     591005 =C2=B1  4%      -7.2%     558994 =C2=
=B1 18%  interrupts.CPU131.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU131.MCP:Machine_check_polls
    224.33 =C2=B1 29%     +12.1%     251.57 =C2=B1 37%     +16.0%     260.1=
4 =C2=B1 37%  interrupts.CPU131.NMI:Non-maskable_interrupts
    224.33 =C2=B1 29%     +12.1%     251.57 =C2=B1 37%     +16.0%     260.1=
4 =C2=B1 37%  interrupts.CPU131.PMI:Performance_monitoring_interrupts
     10.00 =C2=B1 51%     -45.7%       5.43 =C2=B1 66%     +47.1%      14.7=
1 =C2=B1 99%  interrupts.CPU131.RES:Rescheduling_interrupts
      8.67 =C2=B1 10%      -4.4%       8.29 =C2=B1 20%      +0.5%       8.7=
1 =C2=B1 24%  interrupts.CPU131.TLB:TLB_shootdowns
      1227            +0.3%       1230 =C2=B1  2%      -0.6%       1219    =
    interrupts.CPU132.CAL:Function_call_interrupts
    601945            -1.9%     590610 =C2=B1  4%      -7.1%     559213 =C2=
=B1 18%  interrupts.CPU132.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU132.MCP:Machine_check_polls
    290.50 =C2=B1 32%     -22.5%     225.14 =C2=B1 27%     -16.1%     243.8=
6 =C2=B1 42%  interrupts.CPU132.NMI:Non-maskable_interrupts
    290.50 =C2=B1 32%     -22.5%     225.14 =C2=B1 27%     -16.1%     243.8=
6 =C2=B1 42%  interrupts.CPU132.PMI:Performance_monitoring_interrupts
     10.83 =C2=B1 66%     -15.6%       9.14 =C2=B1 46%     -40.7%       6.4=
3 =C2=B1 54%  interrupts.CPU132.RES:Rescheduling_interrupts
      9.50 =C2=B1 20%     +26.3%      12.00 =C2=B1 55%      +6.8%      10.1=
4 =C2=B1 33%  interrupts.CPU132.TLB:TLB_shootdowns
      1230 =C2=B1  2%      +1.7%       1250 =C2=B1  5%      -1.2%       121=
5        interrupts.CPU133.CAL:Function_call_interrupts
    601988            -2.0%     590034 =C2=B1  4%      -7.1%     559114 =C2=
=B1 18%  interrupts.CPU133.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU133.MCP:Machine_check_polls
    259.50 =C2=B1 33%     +29.1%     335.00 =C2=B1 26%      -5.6%     245.0=
0 =C2=B1 42%  interrupts.CPU133.NMI:Non-maskable_interrupts
    259.50 =C2=B1 33%     +29.1%     335.00 =C2=B1 26%      -5.6%     245.0=
0 =C2=B1 42%  interrupts.CPU133.PMI:Performance_monitoring_interrupts
      7.17 =C2=B1 56%    +111.3%      15.14 =C2=B1 78%     +55.5%      11.1=
4 =C2=B1 53%  interrupts.CPU133.RES:Rescheduling_interrupts
      9.83 =C2=B1 19%     +23.5%      12.14 =C2=B1 61%      -7.0%       9.1=
4 =C2=B1 31%  interrupts.CPU133.TLB:TLB_shootdowns
      1223            +3.9%       1270 =C2=B1  6%      +0.8%       1233 =C2=
=B1  3%  interrupts.CPU134.CAL:Function_call_interrupts
    602217            -1.2%     595114 =C2=B1  2%      -7.2%     559048 =C2=
=B1 18%  interrupts.CPU134.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU134.MCP:Machine_check_polls
    228.83 =C2=B1 35%      +4.7%     239.57 =C2=B1 33%      +1.5%     232.2=
9 =C2=B1 30%  interrupts.CPU134.NMI:Non-maskable_interrupts
    228.83 =C2=B1 35%      +4.7%     239.57 =C2=B1 33%      +1.5%     232.2=
9 =C2=B1 30%  interrupts.CPU134.PMI:Performance_monitoring_interrupts
      8.00 =C2=B1 47%    +103.6%      16.29 =C2=B1 86%     +30.4%      10.4=
3 =C2=B1 48%  interrupts.CPU134.RES:Rescheduling_interrupts
      9.83 =C2=B1 30%     +81.6%      17.86 =C2=B1 80%      -7.0%       9.1=
4 =C2=B1 30%  interrupts.CPU134.TLB:TLB_shootdowns
      1237 =C2=B1  3%      -0.3%       1234 =C2=B1  2%      -2.1%       121=
1        interrupts.CPU135.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +2.9e+101%       0.29 =C2=B124=
4%  interrupts.CPU135.IWI:IRQ_work_interrupts
    602202            -1.1%     595668 =C2=B1  2%      -7.2%     559020 =C2=
=B1 18%  interrupts.CPU135.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU135.MCP:Machine_check_polls
    203.50 =C2=B1 33%     +20.7%     245.71 =C2=B1 33%      +4.3%     212.2=
9 =C2=B1 28%  interrupts.CPU135.NMI:Non-maskable_interrupts
    203.50 =C2=B1 33%     +20.7%     245.71 =C2=B1 33%      +4.3%     212.2=
9 =C2=B1 28%  interrupts.CPU135.PMI:Performance_monitoring_interrupts
     13.67 =C2=B1 37%     -25.8%      10.14 =C2=B1 64%     -68.6%       4.2=
9 =C2=B1 34%  interrupts.CPU135.RES:Rescheduling_interrupts
     11.17 =C2=B1 53%     -19.4%       9.00 =C2=B1 24%     -29.6%       7.8=
6 =C2=B1 22%  interrupts.CPU135.TLB:TLB_shootdowns
      1251 =C2=B1  4%      -2.4%       1220            -0.7%       1241 =C2=
=B1  3%  interrupts.CPU136.CAL:Function_call_interrupts
    602075            -3.6%     580691 =C2=B1  8%      -7.1%     559101 =C2=
=B1 18%  interrupts.CPU136.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU136.MCP:Machine_check_polls
    226.50 =C2=B1 29%     +34.1%     303.71 =C2=B1 31%     +18.1%     267.4=
3 =C2=B1 44%  interrupts.CPU136.NMI:Non-maskable_interrupts
    226.50 =C2=B1 29%     +34.1%     303.71 =C2=B1 31%     +18.1%     267.4=
3 =C2=B1 44%  interrupts.CPU136.PMI:Performance_monitoring_interrupts
     12.83 =C2=B1 47%     -22.1%      10.00 =C2=B1 43%     -28.8%       9.1=
4 =C2=B1 47%  interrupts.CPU136.RES:Rescheduling_interrupts
     11.00 =C2=B1 65%     -22.1%       8.57 =C2=B1 24%     -15.6%       9.2=
9 =C2=B1 34%  interrupts.CPU136.TLB:TLB_shootdowns
      1256 =C2=B1  4%      +4.7%       1315 =C2=B1 14%      -1.6%       123=
6 =C2=B1  2%  interrupts.CPU137.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +8.6e+101%       0.86 =C2=B124=
4%  interrupts.CPU137.IWI:IRQ_work_interrupts
    601958            -2.6%     586042 =C2=B1  6%      -7.1%     558990 =C2=
=B1 18%  interrupts.CPU137.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU137.MCP:Machine_check_polls
    324.67 =C2=B1 26%     -29.2%     229.71 =C2=B1 31%     -12.7%     283.5=
7 =C2=B1 47%  interrupts.CPU137.NMI:Non-maskable_interrupts
    324.67 =C2=B1 26%     -29.2%     229.71 =C2=B1 31%     -12.7%     283.5=
7 =C2=B1 47%  interrupts.CPU137.PMI:Performance_monitoring_interrupts
     12.50 =C2=B1 85%     -28.0%       9.00 =C2=B1 64%     -36.0%       8.0=
0 =C2=B1 59%  interrupts.CPU137.RES:Rescheduling_interrupts
     22.17 =C2=B1153%     -59.4%       9.00 =C2=B1 46%     -58.1%       9.2=
9 =C2=B1 53%  interrupts.CPU137.TLB:TLB_shootdowns
      1227            -0.3%       1222 =C2=B1  3%      +0.8%       1236 =C2=
=B1  2%  interrupts.CPU138.CAL:Function_call_interrupts
    602361            -3.6%     580679 =C2=B1  9%      -7.2%     558987 =C2=
=B1 18%  interrupts.CPU138.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU138.MCP:Machine_check_polls
    264.67 =C2=B1 35%      +4.6%     276.71 =C2=B1 30%      +2.7%     271.8=
6 =C2=B1 38%  interrupts.CPU138.NMI:Non-maskable_interrupts
    264.67 =C2=B1 35%      +4.6%     276.71 =C2=B1 30%      +2.7%     271.8=
6 =C2=B1 38%  interrupts.CPU138.PMI:Performance_monitoring_interrupts
      9.17 =C2=B1 22%     -19.0%       7.43 =C2=B1 40%      +2.9%       9.4=
3 =C2=B1 37%  interrupts.CPU138.RES:Rescheduling_interrupts
     11.33 =C2=B1 25%     +12.2%      12.71 =C2=B1 31%      +8.4%      12.2=
9 =C2=B1 38%  interrupts.CPU138.TLB:TLB_shootdowns
      1234            +0.6%       1241 =C2=B1  3%      -0.5%       1227    =
    interrupts.CPU139.CAL:Function_call_interrupts
    602047            -3.1%     583337 =C2=B1  7%      -7.2%     558876 =C2=
=B1 18%  interrupts.CPU139.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU139.MCP:Machine_check_polls
    237.83 =C2=B1 30%     +33.8%     318.14 =C2=B1 31%      +9.1%     259.4=
3 =C2=B1 36%  interrupts.CPU139.NMI:Non-maskable_interrupts
    237.83 =C2=B1 30%     +33.8%     318.14 =C2=B1 31%      +9.1%     259.4=
3 =C2=B1 36%  interrupts.CPU139.PMI:Performance_monitoring_interrupts
     12.83 =C2=B1 51%     -64.4%       4.57 =C2=B1 62%     -38.8%       7.8=
6 =C2=B1 46%  interrupts.CPU139.RES:Rescheduling_interrupts
      7.67 =C2=B1  6%     +19.3%       9.14 =C2=B1 22%      -1.2%       7.5=
7 =C2=B1 11%  interrupts.CPU139.TLB:TLB_shootdowns
      1193 =C2=B1 41%    +610.9%       8486 =C2=B1153%    +268.6%       440=
0 =C2=B1106%  interrupts.CPU14.34:IR-PCI-MSI.2621443-edge.eth0-TxRx-2
      2165 =C2=B1 70%     -12.8%       1887 =C2=B1 48%      +8.7%       235=
4 =C2=B1 72%  interrupts.CPU14.CAL:Function_call_interrupts
    602237            -0.4%     599851            -7.1%     559360 =C2=B1 1=
8%  interrupts.CPU14.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU14.MCP:Machine_check_polls
    261.67 =C2=B1 30%     -17.3%     216.29 =C2=B1 27%     +19.8%     313.4=
3 =C2=B1 32%  interrupts.CPU14.NMI:Non-maskable_interrupts
    261.67 =C2=B1 30%     -17.3%     216.29 =C2=B1 27%     +19.8%     313.4=
3 =C2=B1 32%  interrupts.CPU14.PMI:Performance_monitoring_interrupts
    115.33 =C2=B1125%      +8.8%     125.43 =C2=B1116%     +20.1%     138.5=
7 =C2=B1121%  interrupts.CPU14.RES:Rescheduling_interrupts
     62.00 =C2=B1 25%      +4.8%      65.00 =C2=B1 23%      +8.1%      67.0=
0 =C2=B1 19%  interrupts.CPU14.TLB:TLB_shootdowns
      1275 =C2=B1  9%      +0.2%       1278 =C2=B1  6%      -3.9%       122=
5        interrupts.CPU140.CAL:Function_call_interrupts
    602203            -5.7%     567897 =C2=B1 14%      -7.2%     558978 =C2=
=B1 18%  interrupts.CPU140.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU140.MCP:Machine_check_polls
    282.17 =C2=B1 36%     +17.2%     330.71 =C2=B1 32%     -12.3%     247.5=
7 =C2=B1 31%  interrupts.CPU140.NMI:Non-maskable_interrupts
    282.17 =C2=B1 36%     +17.2%     330.71 =C2=B1 32%     -12.3%     247.5=
7 =C2=B1 31%  interrupts.CPU140.PMI:Performance_monitoring_interrupts
     13.67 =C2=B1 67%     -16.4%      11.43 =C2=B1 34%     -73.9%       3.5=
7 =C2=B1 85%  interrupts.CPU140.RES:Rescheduling_interrupts
     15.33 =C2=B1 75%     -16.1%      12.86 =C2=B1 22%     -33.9%      10.1=
4 =C2=B1 28%  interrupts.CPU140.TLB:TLB_shootdowns
      1241 =C2=B1  3%      +2.0%       1265 =C2=B1  7%      -1.4%       122=
3        interrupts.CPU141.CAL:Function_call_interrupts
    601885            -4.8%     573171 =C2=B1 12%      -7.1%     558916 =C2=
=B1 18%  interrupts.CPU141.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU141.MCP:Machine_check_polls
    312.50 =C2=B1 31%     +14.0%     356.14 =C2=B1 25%     -11.8%     275.7=
1 =C2=B1 34%  interrupts.CPU141.NMI:Non-maskable_interrupts
    312.50 =C2=B1 31%     +14.0%     356.14 =C2=B1 25%     -11.8%     275.7=
1 =C2=B1 34%  interrupts.CPU141.PMI:Performance_monitoring_interrupts
     12.33 =C2=B1 43%     -23.6%       9.43 =C2=B1 52%     -40.9%       7.2=
9 =C2=B1 54%  interrupts.CPU141.RES:Rescheduling_interrupts
      8.67 =C2=B1 28%     +10.4%       9.57 =C2=B1 18%      +3.8%       9.0=
0 =C2=B1 27%  interrupts.CPU141.TLB:TLB_shootdowns
      1267 =C2=B1  7%      -3.6%       1221            -3.6%       1222    =
    interrupts.CPU142.CAL:Function_call_interrupts
    602153            -4.2%     576909 =C2=B1 10%      -7.1%     559163 =C2=
=B1 18%  interrupts.CPU142.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU142.MCP:Machine_check_polls
    245.50 =C2=B1 31%     +10.0%     270.00 =C2=B1 36%     +11.7%     274.1=
4 =C2=B1 34%  interrupts.CPU142.NMI:Non-maskable_interrupts
    245.50 =C2=B1 31%     +10.0%     270.00 =C2=B1 36%     +11.7%     274.1=
4 =C2=B1 34%  interrupts.CPU142.PMI:Performance_monitoring_interrupts
     14.00 =C2=B1 67%     -62.2%       5.29 =C2=B1 67%     -34.7%       9.1=
4 =C2=B1 46%  interrupts.CPU142.RES:Rescheduling_interrupts
      9.17 =C2=B1 23%      +4.4%       9.57 =C2=B1  9%     +24.7%      11.4=
3 =C2=B1 20%  interrupts.CPU142.TLB:TLB_shootdowns
      1251 =C2=B1  7%      +3.1%       1290 =C2=B1 13%      +6.7%       133=
5 =C2=B1 12%  interrupts.CPU143.CAL:Function_call_interrupts
    602168            -3.0%     584227 =C2=B1  7%      -7.2%     559032 =C2=
=B1 18%  interrupts.CPU143.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU143.MCP:Machine_check_polls
    328.83 =C2=B1 36%      -8.0%     302.43 =C2=B1 36%     -20.6%     261.0=
0 =C2=B1 42%  interrupts.CPU143.NMI:Non-maskable_interrupts
    328.83 =C2=B1 36%      -8.0%     302.43 =C2=B1 36%     -20.6%     261.0=
0 =C2=B1 42%  interrupts.CPU143.PMI:Performance_monitoring_interrupts
     10.67 =C2=B1123%     +43.3%      15.29 =C2=B1 75%     -19.6%       8.5=
7 =C2=B1 84%  interrupts.CPU143.RES:Rescheduling_interrupts
      8.00 =C2=B1 16%     +14.3%       9.14 =C2=B1 20%     +16.1%       9.2=
9 =C2=B1 18%  interrupts.CPU143.TLB:TLB_shootdowns
      1228            +0.5%       1234            +0.9%       1239        i=
nterrupts.CPU144.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  interrupts.CPU144.IWI:IRQ_work_interrupts
    602191            -2.6%     586660 =C2=B1  6%      -7.2%     559093 =C2=
=B1 18%  interrupts.CPU144.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU144.MCP:Machine_check_polls
    247.83 =C2=B1 33%     +20.6%     298.86 =C2=B1 36%    +176.4%     685.0=
0 =C2=B1142%  interrupts.CPU144.NMI:Non-maskable_interrupts
    247.83 =C2=B1 33%     +20.6%     298.86 =C2=B1 36%    +176.4%     685.0=
0 =C2=B1142%  interrupts.CPU144.PMI:Performance_monitoring_interrupts
      9.67 =C2=B1 33%     +25.6%      12.14 =C2=B1 75%     -24.6%       7.2=
9 =C2=B1 55%  interrupts.CPU144.RES:Rescheduling_interrupts
     11.17 =C2=B1 23%     -11.7%       9.86 =C2=B1 21%     -27.1%       8.1=
4 =C2=B1 17%  interrupts.CPU144.TLB:TLB_shootdowns
      1218            +2.2%       1246 =C2=B1  3%      +0.3%       1222    =
    interrupts.CPU145.CAL:Function_call_interrupts
    602106            -4.1%     577326 =C2=B1 10%      -7.2%     558784 =C2=
=B1 18%  interrupts.CPU145.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU145.MCP:Machine_check_polls
    253.67 =C2=B1 37%      +5.0%     266.29 =C2=B1 37%     +11.6%     283.0=
0 =C2=B1 35%  interrupts.CPU145.NMI:Non-maskable_interrupts
    253.67 =C2=B1 37%      +5.0%     266.29 =C2=B1 37%     +11.6%     283.0=
0 =C2=B1 35%  interrupts.CPU145.PMI:Performance_monitoring_interrupts
     11.50 =C2=B1 56%     +23.0%      14.14 =C2=B1 62%     -32.9%       7.7=
1 =C2=B1 78%  interrupts.CPU145.RES:Rescheduling_interrupts
      9.83 =C2=B1 19%      -8.5%       9.00 =C2=B1 20%     -17.2%       8.1=
4 =C2=B1 13%  interrupts.CPU145.TLB:TLB_shootdowns
      1344 =C2=B1 15%      -5.6%       1268 =C2=B1  3%      -7.6%       124=
1 =C2=B1  3%  interrupts.CPU146.CAL:Function_call_interrupts
    602131            -0.7%     598081            -7.1%     559095 =C2=B1 1=
8%  interrupts.CPU146.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU146.MCP:Machine_check_polls
    201.67 =C2=B1 30%     +16.8%     235.57 =C2=B1 31%      +3.4%     208.5=
7 =C2=B1 30%  interrupts.CPU146.NMI:Non-maskable_interrupts
    201.67 =C2=B1 30%     +16.8%     235.57 =C2=B1 31%      +3.4%     208.5=
7 =C2=B1 30%  interrupts.CPU146.PMI:Performance_monitoring_interrupts
      6.00 =C2=B1 38%     +64.3%       9.86 =C2=B1 72%     +57.1%       9.4=
3 =C2=B1 44%  interrupts.CPU146.RES:Rescheduling_interrupts
      9.67 =C2=B1 22%    +680.3%      75.43 =C2=B1202%     +15.3%      11.1=
4 =C2=B1 20%  interrupts.CPU146.TLB:TLB_shootdowns
      1228 =C2=B1  2%      +1.3%       1244 =C2=B1  2%      -0.6%       122=
0        interrupts.CPU147.CAL:Function_call_interrupts
    602053            -2.1%     589639 =C2=B1  5%      -7.1%     559112 =C2=
=B1 18%  interrupts.CPU147.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU147.MCP:Machine_check_polls
    199.33 =C2=B1 33%      +0.9%     201.14 =C2=B1 29%     +63.9%     326.7=
1 =C2=B1 84%  interrupts.CPU147.NMI:Non-maskable_interrupts
    199.33 =C2=B1 33%      +0.9%     201.14 =C2=B1 29%     +63.9%     326.7=
1 =C2=B1 84%  interrupts.CPU147.PMI:Performance_monitoring_interrupts
      8.50 =C2=B1 74%     +51.3%      12.86 =C2=B1 89%     -14.3%       7.2=
9 =C2=B1 44%  interrupts.CPU147.RES:Rescheduling_interrupts
      9.00 =C2=B1 19%      -6.3%       8.43 =C2=B1 13%     -17.5%       7.4=
3 =C2=B1 26%  interrupts.CPU147.TLB:TLB_shootdowns
      1226 =C2=B1  2%      +2.0%       1251 =C2=B1  2%      +1.8%       124=
8 =C2=B1  2%  interrupts.CPU148.CAL:Function_call_interrupts
    601616            -2.7%     585370 =C2=B1  6%      -7.1%     559111 =C2=
=B1 18%  interrupts.CPU148.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU148.MCP:Machine_check_polls
    297.67 =C2=B1 32%      -3.2%     288.14 =C2=B1 34%     -21.5%     233.5=
7 =C2=B1 31%  interrupts.CPU148.NMI:Non-maskable_interrupts
    297.67 =C2=B1 32%      -3.2%     288.14 =C2=B1 34%     -21.5%     233.5=
7 =C2=B1 31%  interrupts.CPU148.PMI:Performance_monitoring_interrupts
     12.50 =C2=B1 64%      +0.6%      12.57 =C2=B1 68%     -15.4%      10.5=
7 =C2=B1 59%  interrupts.CPU148.RES:Rescheduling_interrupts
     10.83 =C2=B1 24%      -2.4%      10.57 =C2=B1 29%      -3.7%      10.4=
3 =C2=B1 21%  interrupts.CPU148.TLB:TLB_shootdowns
      1230            -0.1%       1229 =C2=B1  2%      +0.5%       1236    =
    interrupts.CPU149.CAL:Function_call_interrupts
    602249            -3.1%     583504 =C2=B1  7%      -7.2%     559082 =C2=
=B1 18%  interrupts.CPU149.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU149.MCP:Machine_check_polls
    264.17 =C2=B1 36%      +9.3%     288.86 =C2=B1 37%      -6.8%     246.2=
9 =C2=B1 41%  interrupts.CPU149.NMI:Non-maskable_interrupts
    264.17 =C2=B1 36%      +9.3%     288.86 =C2=B1 37%      -6.8%     246.2=
9 =C2=B1 41%  interrupts.CPU149.PMI:Performance_monitoring_interrupts
      9.00 =C2=B1 41%      -4.8%       8.57 =C2=B1 69%     +23.8%      11.1=
4 =C2=B1 53%  interrupts.CPU149.RES:Rescheduling_interrupts
      9.17 =C2=B1 37%      +2.9%       9.43 =C2=B1 46%      -8.1%       8.4=
3 =C2=B1 26%  interrupts.CPU149.TLB:TLB_shootdowns
      2739 =C2=B1 77%    +175.6%       7550 =C2=B1161%     -40.1%       164=
2 =C2=B1 42%  interrupts.CPU15.35:IR-PCI-MSI.2621444-edge.eth0-TxRx-3
      1591 =C2=B1 33%      +2.6%       1632 =C2=B1 31%      -2.6%       154=
9 =C2=B1 21%  interrupts.CPU15.CAL:Function_call_interrupts
    602448            -0.5%     599434            -7.1%     559385 =C2=B1 1=
8%  interrupts.CPU15.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU15.MCP:Machine_check_polls
    299.67 =C2=B1 29%     -31.3%     206.00 =C2=B1 28%      -8.4%     274.4=
3 =C2=B1 37%  interrupts.CPU15.NMI:Non-maskable_interrupts
    299.67 =C2=B1 29%     -31.3%     206.00 =C2=B1 28%      -8.4%     274.4=
3 =C2=B1 37%  interrupts.CPU15.PMI:Performance_monitoring_interrupts
     46.67 =C2=B1118%     +18.8%      55.43 =C2=B1 91%     -19.8%      37.4=
3 =C2=B1 89%  interrupts.CPU15.RES:Rescheduling_interrupts
     23.17 =C2=B1 25%      +1.7%      23.57 =C2=B1 14%      +2.4%      23.7=
1 =C2=B1 23%  interrupts.CPU15.TLB:TLB_shootdowns
      1251 =C2=B1  4%      -2.0%       1226            +3.3%       1292 =C2=
=B1  6%  interrupts.CPU150.CAL:Function_call_interrupts
    601947            -1.3%     594119 =C2=B1  3%      -7.1%     559061 =C2=
=B1 18%  interrupts.CPU150.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU150.MCP:Machine_check_polls
    242.33 =C2=B1 31%      -4.8%     230.71 =C2=B1 36%      -6.3%     227.0=
0 =C2=B1 33%  interrupts.CPU150.NMI:Non-maskable_interrupts
    242.33 =C2=B1 31%      -4.8%     230.71 =C2=B1 36%      -6.3%     227.0=
0 =C2=B1 33%  interrupts.CPU150.PMI:Performance_monitoring_interrupts
     13.33 =C2=B1 87%     -38.9%       8.14 =C2=B1 48%     +35.0%      18.0=
0 =C2=B1 75%  interrupts.CPU150.RES:Rescheduling_interrupts
     12.33 =C2=B1 46%      -7.3%      11.43 =C2=B1 18%     +14.7%      14.1=
4 =C2=B1 53%  interrupts.CPU150.TLB:TLB_shootdowns
      1213           +10.5%       1340 =C2=B1 12%      +5.0%       1274 =C2=
=B1  9%  interrupts.CPU151.CAL:Function_call_interrupts
    602060            -0.8%     597067 =C2=B1  2%      -7.1%     559160 =C2=
=B1 18%  interrupts.CPU151.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU151.MCP:Machine_check_polls
    277.33 =C2=B1 28%      -7.8%     255.57 =C2=B1 36%     -25.7%     206.1=
4 =C2=B1 32%  interrupts.CPU151.NMI:Non-maskable_interrupts
    277.33 =C2=B1 28%      -7.8%     255.57 =C2=B1 36%     -25.7%     206.1=
4 =C2=B1 32%  interrupts.CPU151.PMI:Performance_monitoring_interrupts
      7.00 =C2=B1 26%    +130.6%      16.14 =C2=B1 78%    +112.2%      14.8=
6 =C2=B1 70%  interrupts.CPU151.RES:Rescheduling_interrupts
      8.17 =C2=B1 16%     +19.0%       9.71 =C2=B1 16%      +6.7%       8.7=
1 =C2=B1 20%  interrupts.CPU151.TLB:TLB_shootdowns
      1263 =C2=B1  7%      -3.0%       1226            -2.9%       1227    =
    interrupts.CPU152.CAL:Function_call_interrupts
    602267            -0.3%     600469            -7.2%     559109 =C2=B1 1=
8%  interrupts.CPU152.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU152.MCP:Machine_check_polls
    230.00 =C2=B1 36%      -2.4%     224.57 =C2=B1 35%      -1.2%     227.2=
9 =C2=B1 35%  interrupts.CPU152.NMI:Non-maskable_interrupts
    230.00 =C2=B1 36%      -2.4%     224.57 =C2=B1 35%      -1.2%     227.2=
9 =C2=B1 35%  interrupts.CPU152.PMI:Performance_monitoring_interrupts
     13.00 =C2=B1 70%      -8.8%      11.86 =C2=B1 42%     -16.5%      10.8=
6 =C2=B1 43%  interrupts.CPU152.RES:Rescheduling_interrupts
     10.00 =C2=B1 19%      +5.7%      10.57 =C2=B1 25%      +0.0%      10.0=
0 =C2=B1 28%  interrupts.CPU152.TLB:TLB_shootdowns
      1222            +1.1%       1235            -0.1%       1220        i=
nterrupts.CPU153.CAL:Function_call_interrupts
    602137            -0.3%     600200            -7.1%     559469 =C2=B1 1=
8%  interrupts.CPU153.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU153.MCP:Machine_check_polls
    257.83 =C2=B1 32%     -13.6%     222.86 =C2=B1 35%     -21.9%     201.4=
3 =C2=B1 30%  interrupts.CPU153.NMI:Non-maskable_interrupts
    257.83 =C2=B1 32%     -13.6%     222.86 =C2=B1 35%     -21.9%     201.4=
3 =C2=B1 30%  interrupts.CPU153.PMI:Performance_monitoring_interrupts
     10.33 =C2=B1 33%      -8.8%       9.43 =C2=B1 44%     -17.1%       8.5=
7 =C2=B1 53%  interrupts.CPU153.RES:Rescheduling_interrupts
      9.50 =C2=B1 25%      -8.3%       8.71 =C2=B1 14%      -0.8%       9.4=
3 =C2=B1 18%  interrupts.CPU153.TLB:TLB_shootdowns
      1223            +4.1%       1273 =C2=B1  8%      +4.6%       1280 =C2=
=B1  5%  interrupts.CPU154.CAL:Function_call_interrupts
    602185            -2.1%     589693 =C2=B1  5%      -7.2%     559125 =C2=
=B1 18%  interrupts.CPU154.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU154.MCP:Machine_check_polls
    248.50 =C2=B1 31%     +35.5%     336.71 =C2=B1 32%     +16.1%     288.4=
3 =C2=B1 42%  interrupts.CPU154.NMI:Non-maskable_interrupts
    248.50 =C2=B1 31%     +35.5%     336.71 =C2=B1 32%     +16.1%     288.4=
3 =C2=B1 42%  interrupts.CPU154.PMI:Performance_monitoring_interrupts
      7.00 =C2=B1 39%      +8.2%       7.57 =C2=B1 52%     +91.8%      13.4=
3 =C2=B1 66%  interrupts.CPU154.RES:Rescheduling_interrupts
      9.17 =C2=B1 31%     +29.4%      11.86 =C2=B1 36%     +52.7%      14.0=
0 =C2=B1 47%  interrupts.CPU154.TLB:TLB_shootdowns
      1210            +1.0%       1223            +4.9%       1270 =C2=B1  =
6%  interrupts.CPU155.CAL:Function_call_interrupts
    602074            -3.6%     580464 =C2=B1  9%      -7.1%     559184 =C2=
=B1 18%  interrupts.CPU155.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU155.MCP:Machine_check_polls
    276.17 =C2=B1 36%     -11.4%     244.71 =C2=B1 29%      -2.8%     268.5=
7 =C2=B1 34%  interrupts.CPU155.NMI:Non-maskable_interrupts
    276.17 =C2=B1 36%     -11.4%     244.71 =C2=B1 29%      -2.8%     268.5=
7 =C2=B1 34%  interrupts.CPU155.PMI:Performance_monitoring_interrupts
      7.50 =C2=B1 22%     +12.4%       8.43 =C2=B1 40%     +88.6%      14.1=
4 =C2=B1 74%  interrupts.CPU155.RES:Rescheduling_interrupts
      8.33 =C2=B1 17%      +6.3%       8.86 =C2=B1 22%     +98.9%      16.5=
7 =C2=B1 64%  interrupts.CPU155.TLB:TLB_shootdowns
      1237            +0.7%       1246 =C2=B1  2%      +1.4%       1255 =C2=
=B1  2%  interrupts.CPU156.CAL:Function_call_interrupts
    602205            -2.0%     590418 =C2=B1  4%      -7.2%     558992 =C2=
=B1 18%  interrupts.CPU156.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU156.MCP:Machine_check_polls
    252.50 =C2=B1 35%     +25.4%     316.57 =C2=B1 69%      -2.1%     247.2=
9 =C2=B1 34%  interrupts.CPU156.NMI:Non-maskable_interrupts
    252.50 =C2=B1 35%     +25.4%     316.57 =C2=B1 69%      -2.1%     247.2=
9 =C2=B1 34%  interrupts.CPU156.PMI:Performance_monitoring_interrupts
      9.83 =C2=B1 25%     -11.4%       8.71 =C2=B1 73%     +33.7%      13.1=
4 =C2=B1 56%  interrupts.CPU156.RES:Rescheduling_interrupts
     11.50 =C2=B1 16%      -9.3%      10.43 =C2=B1 25%      +0.6%      11.5=
7 =C2=B1 27%  interrupts.CPU156.TLB:TLB_shootdowns
      1218            +1.0%       1230            +3.3%       1258 =C2=B1  =
3%  interrupts.CPU157.CAL:Function_call_interrupts
    602232            -2.2%     588803 =C2=B1  5%      -7.2%     559061 =C2=
=B1 18%  interrupts.CPU157.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU157.MCP:Machine_check_polls
    246.50 =C2=B1 34%      +1.5%     250.14 =C2=B1 36%      +9.5%     269.8=
6 =C2=B1 33%  interrupts.CPU157.NMI:Non-maskable_interrupts
    246.50 =C2=B1 34%      +1.5%     250.14 =C2=B1 36%      +9.5%     269.8=
6 =C2=B1 33%  interrupts.CPU157.PMI:Performance_monitoring_interrupts
     11.83 =C2=B1 23%     +14.7%      13.57 =C2=B1 81%      -3.4%      11.4=
3 =C2=B1 51%  interrupts.CPU157.RES:Rescheduling_interrupts
      9.33 =C2=B1 19%      +7.1%      10.00 =C2=B1 35%      +8.7%      10.1=
4 =C2=B1 37%  interrupts.CPU157.TLB:TLB_shootdowns
      1301 =C2=B1  9%      -3.2%       1259 =C2=B1  6%      -5.8%       122=
5        interrupts.CPU158.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +2.9e+101%       0.29 =C2=B124=
4%  interrupts.CPU158.IWI:IRQ_work_interrupts
    602076            -2.4%     587834 =C2=B1  6%      -7.2%     558848 =C2=
=B1 18%  interrupts.CPU158.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU158.MCP:Machine_check_polls
    265.50 =C2=B1 33%    +110.5%     559.00 =C2=B1104%      +3.1%     273.7=
1 =C2=B1 34%  interrupts.CPU158.NMI:Non-maskable_interrupts
    265.50 =C2=B1 33%    +110.5%     559.00 =C2=B1104%      +3.1%     273.7=
1 =C2=B1 34%  interrupts.CPU158.PMI:Performance_monitoring_interrupts
     10.83 =C2=B1 52%     -24.8%       8.14 =C2=B1 47%     -22.2%       8.4=
3 =C2=B1 58%  interrupts.CPU158.RES:Rescheduling_interrupts
     11.33 =C2=B1 41%      +5.9%      12.00 =C2=B1 66%     -15.5%       9.5=
7 =C2=B1 27%  interrupts.CPU158.TLB:TLB_shootdowns
      1349 =C2=B1 13%      -8.2%       1238 =C2=B1  3%      -9.9%       121=
5        interrupts.CPU159.CAL:Function_call_interrupts
    602047            -2.6%     586265 =C2=B1  6%      -7.1%     559087 =C2=
=B1 18%  interrupts.CPU159.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU159.MCP:Machine_check_polls
    235.67 =C2=B1 31%     +34.1%     316.00 =C2=B1 42%      +4.2%     245.5=
7 =C2=B1 41%  interrupts.CPU159.NMI:Non-maskable_interrupts
    235.67 =C2=B1 31%     +34.1%     316.00 =C2=B1 42%      +4.2%     245.5=
7 =C2=B1 41%  interrupts.CPU159.PMI:Performance_monitoring_interrupts
     20.00 =C2=B1 99%     -53.6%       9.29 =C2=B1 61%     -61.4%       7.7=
1 =C2=B1 35%  interrupts.CPU159.RES:Rescheduling_interrupts
     10.00 =C2=B1 19%      +0.0%      10.00 =C2=B1 31%     -12.9%       8.7=
1 =C2=B1 27%  interrupts.CPU159.TLB:TLB_shootdowns
     40.67 =C2=B1  4%      -0.9%      40.29 =C2=B1  4%      -0.9%      40.2=
9 =C2=B1  4%  interrupts.CPU16.4:IR-IO-APIC.4-edge.ttyS0
      1732 =C2=B1 27%      -6.4%       1621 =C2=B1 15%     -11.7%       152=
9 =C2=B1 12%  interrupts.CPU16.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +5.7e+101%       0.57 =C2=B124=
4%  interrupts.CPU16.IWI:IRQ_work_interrupts
    602232            -0.3%     600527            -7.2%     558992 =C2=B1 1=
8%  interrupts.CPU16.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU16.MCP:Machine_check_polls
    198.50 =C2=B1 32%     +38.1%     274.14 =C2=B1 28%     +26.8%     251.7=
1 =C2=B1 29%  interrupts.CPU16.NMI:Non-maskable_interrupts
    198.50 =C2=B1 32%     +38.1%     274.14 =C2=B1 28%     +26.8%     251.7=
1 =C2=B1 29%  interrupts.CPU16.PMI:Performance_monitoring_interrupts
     61.50 =C2=B1 83%      +5.7%      65.00 =C2=B1 26%     -24.7%      46.2=
9 =C2=B1 59%  interrupts.CPU16.RES:Rescheduling_interrupts
     64.33 =C2=B1 18%      +3.0%      66.29 =C2=B1 11%      -3.0%      62.4=
3 =C2=B1 80%  interrupts.CPU16.TLB:TLB_shootdowns
      1340 =C2=B1 14%      -8.0%       1232 =C2=B1  2%      -7.4%       124=
1        interrupts.CPU160.CAL:Function_call_interrupts
    602075            -5.1%     571577 =C2=B1 13%      -7.1%     559034 =C2=
=B1 18%  interrupts.CPU160.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU160.MCP:Machine_check_polls
    295.00 =C2=B1 34%     -23.0%     227.29 =C2=B1 32%     -23.4%     225.8=
6 =C2=B1 29%  interrupts.CPU160.NMI:Non-maskable_interrupts
    295.00 =C2=B1 34%     -23.0%     227.29 =C2=B1 32%     -23.4%     225.8=
6 =C2=B1 29%  interrupts.CPU160.PMI:Performance_monitoring_interrupts
     21.33 =C2=B1 94%     -56.5%       9.29 =C2=B1 69%     -50.4%      10.5=
7 =C2=B1 30%  interrupts.CPU160.RES:Rescheduling_interrupts
     11.00 =C2=B1 22%     +29.9%      14.29 =C2=B1 58%      +6.5%      11.7=
1 =C2=B1 23%  interrupts.CPU160.TLB:TLB_shootdowns
      1227            +1.9%       1250 =C2=B1  2%      +4.7%       1284 =C2=
=B1 12%  interrupts.CPU161.CAL:Function_call_interrupts
    601995            -4.0%     577993 =C2=B1 10%      -7.1%     559107 =C2=
=B1 18%  interrupts.CPU161.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU161.MCP:Machine_check_polls
    266.00 =C2=B1 35%      -3.3%     257.29 =C2=B1 35%      +7.6%     286.1=
4 =C2=B1 32%  interrupts.CPU161.NMI:Non-maskable_interrupts
    266.00 =C2=B1 35%      -3.3%     257.29 =C2=B1 35%      +7.6%     286.1=
4 =C2=B1 32%  interrupts.CPU161.PMI:Performance_monitoring_interrupts
      9.83 =C2=B1 18%      +6.1%      10.43 =C2=B1 36%     -18.6%       8.0=
0 =C2=B1 38%  interrupts.CPU161.RES:Rescheduling_interrupts
      9.50 =C2=B1 19%     -11.3%       8.43 =C2=B1 15%      -6.8%       8.8=
6 =C2=B1 14%  interrupts.CPU161.TLB:TLB_shootdowns
      1229            +2.1%       1254 =C2=B1  3%      -3.7%       1183 =C2=
=B1 14%  interrupts.CPU162.CAL:Function_call_interrupts
    602010            -3.2%     583001 =C2=B1  8%      -7.1%     559142 =C2=
=B1 18%  interrupts.CPU162.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU162.MCP:Machine_check_polls
    285.33 =C2=B1 45%     -11.3%     253.00 =C2=B1 37%     -10.4%     255.7=
1 =C2=B1 34%  interrupts.CPU162.NMI:Non-maskable_interrupts
    285.33 =C2=B1 45%     -11.3%     253.00 =C2=B1 37%     -10.4%     255.7=
1 =C2=B1 34%  interrupts.CPU162.PMI:Performance_monitoring_interrupts
     13.83 =C2=B1 45%      -6.0%      13.00 =C2=B1 65%     -10.2%      12.4=
3 =C2=B1 43%  interrupts.CPU162.RES:Rescheduling_interrupts
     12.83 =C2=B1 34%      +3.5%      13.29 =C2=B1 37%      -2.0%      12.5=
7 =C2=B1 30%  interrupts.CPU162.TLB:TLB_shootdowns
      1221            +0.9%       1232            -0.2%       1219        i=
nterrupts.CPU163.CAL:Function_call_interrupts
    601889            -2.0%     589986 =C2=B1  5%      -7.2%     558534 =C2=
=B1 18%  interrupts.CPU163.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU163.MCP:Machine_check_polls
    272.50 =C2=B1 32%      -5.7%     256.86 =C2=B1 33%     +11.2%     303.1=
4 =C2=B1 40%  interrupts.CPU163.NMI:Non-maskable_interrupts
    272.50 =C2=B1 32%      -5.7%     256.86 =C2=B1 33%     +11.2%     303.1=
4 =C2=B1 40%  interrupts.CPU163.PMI:Performance_monitoring_interrupts
      7.67 =C2=B1 41%     +23.0%       9.43 =C2=B1 43%      -6.8%       7.1=
4 =C2=B1 37%  interrupts.CPU163.RES:Rescheduling_interrupts
     10.67 =C2=B1 56%      +1.8%      10.86 =C2=B1 15%      -3.6%      10.2=
9 =C2=B1 10%  interrupts.CPU163.TLB:TLB_shootdowns
      1221            +1.1%       1235            +5.2%       1284 =C2=B1  =
7%  interrupts.CPU164.CAL:Function_call_interrupts
    602205            -3.9%     578574 =C2=B1  9%      -7.1%     559262 =C2=
=B1 18%  interrupts.CPU164.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU164.MCP:Machine_check_polls
    243.00 =C2=B1 30%      -0.4%     242.14 =C2=B1 33%     +12.7%     273.8=
6 =C2=B1 34%  interrupts.CPU164.NMI:Non-maskable_interrupts
    243.00 =C2=B1 30%      -0.4%     242.14 =C2=B1 33%     +12.7%     273.8=
6 =C2=B1 34%  interrupts.CPU164.PMI:Performance_monitoring_interrupts
      9.00 =C2=B1 39%      +7.9%       9.71 =C2=B1 36%     +47.6%      13.2=
9 =C2=B1 68%  interrupts.CPU164.RES:Rescheduling_interrupts
     11.83 =C2=B1 26%      -2.2%      11.57 =C2=B1 23%     -15.5%      10.0=
0 =C2=B1 29%  interrupts.CPU164.TLB:TLB_shootdowns
      1231 =C2=B1  2%      +1.6%       1251 =C2=B1  5%      +6.7%       131=
3 =C2=B1 14%  interrupts.CPU165.CAL:Function_call_interrupts
    602126            -2.4%     587780 =C2=B1  5%      -7.1%     559236 =C2=
=B1 18%  interrupts.CPU165.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU165.MCP:Machine_check_polls
    288.17 =C2=B1 35%      -5.2%     273.29 =C2=B1 35%      +1.3%     292.0=
0 =C2=B1 40%  interrupts.CPU165.NMI:Non-maskable_interrupts
    288.17 =C2=B1 35%      -5.2%     273.29 =C2=B1 35%      +1.3%     292.0=
0 =C2=B1 40%  interrupts.CPU165.PMI:Performance_monitoring_interrupts
      9.83 =C2=B1 48%     -27.4%       7.14 =C2=B1 43%     +77.2%      17.4=
3 =C2=B1113%  interrupts.CPU165.RES:Rescheduling_interrupts
      9.33 =C2=B1 33%    +443.4%      50.71 =C2=B1205%      -8.2%       8.5=
7 =C2=B1 22%  interrupts.CPU165.TLB:TLB_shootdowns
      1223            +1.9%       1247 =C2=B1  2%      +0.1%       1225 =C2=
=B1  2%  interrupts.CPU166.CAL:Function_call_interrupts
    602272            -3.7%     579980 =C2=B1  9%      -7.2%     558811 =C2=
=B1 18%  interrupts.CPU166.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU166.MCP:Machine_check_polls
    285.33 =C2=B1 41%      +3.2%     294.57 =C2=B1 35%     -13.9%     245.7=
1 =C2=B1 31%  interrupts.CPU166.NMI:Non-maskable_interrupts
    285.33 =C2=B1 41%      +3.2%     294.57 =C2=B1 35%     -13.9%     245.7=
1 =C2=B1 31%  interrupts.CPU166.PMI:Performance_monitoring_interrupts
      7.50 =C2=B1 29%      -1.0%       7.43 =C2=B1 50%     +21.9%       9.1=
4 =C2=B1 52%  interrupts.CPU166.RES:Rescheduling_interrupts
     11.00 =C2=B1 46%      -9.1%      10.00 =C2=B1 32%      +3.9%      11.4=
3 =C2=B1 18%  interrupts.CPU166.TLB:TLB_shootdowns
      1245 =C2=B1  5%      -1.2%       1230            -2.0%       1220    =
    interrupts.CPU167.CAL:Function_call_interrupts
    602331            -2.4%     588151 =C2=B1  5%      -7.2%     558872 =C2=
=B1 18%  interrupts.CPU167.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU167.MCP:Machine_check_polls
    298.17 =C2=B1 42%      +1.1%     301.57 =C2=B1 34%      -7.0%     277.2=
9 =C2=B1 34%  interrupts.CPU167.NMI:Non-maskable_interrupts
    298.17 =C2=B1 42%      +1.1%     301.57 =C2=B1 34%      -7.0%     277.2=
9 =C2=B1 34%  interrupts.CPU167.PMI:Performance_monitoring_interrupts
      9.33 =C2=B1 41%     +11.7%      10.43 =C2=B1 52%      -3.6%       9.0=
0 =C2=B1 59%  interrupts.CPU167.RES:Rescheduling_interrupts
      7.83 =C2=B1 15%     +18.5%       9.29 =C2=B1 22%     +11.2%       8.7=
1 =C2=B1 19%  interrupts.CPU167.TLB:TLB_shootdowns
      1214            +2.3%       1242            +2.0%       1239 =C2=B1  =
2%  interrupts.CPU168.CAL:Function_call_interrupts
    602126            -0.8%     597580            -7.2%     558957 =C2=B1 1=
8%  interrupts.CPU168.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU168.MCP:Machine_check_polls
    256.17 =C2=B1 51%     -13.1%     222.57 =C2=B1 35%     -17.8%     210.5=
7 =C2=B1 37%  interrupts.CPU168.NMI:Non-maskable_interrupts
    256.17 =C2=B1 51%     -13.1%     222.57 =C2=B1 35%     -17.8%     210.5=
7 =C2=B1 37%  interrupts.CPU168.PMI:Performance_monitoring_interrupts
      7.67 =C2=B1 27%     +41.6%      10.86 =C2=B1 34%     +58.4%      12.1=
4 =C2=B1 58%  interrupts.CPU168.RES:Rescheduling_interrupts
     11.50 =C2=B1 53%      -6.8%      10.71 =C2=B1 40%      -0.6%      11.4=
3 =C2=B1 22%  interrupts.CPU168.TLB:TLB_shootdowns
      1231 =C2=B1  2%      +0.2%       1233 =C2=B1  3%      -0.8%       122=
0        interrupts.CPU169.CAL:Function_call_interrupts
      0.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU169.IWI:IRQ_work_interrupts
    601947            -0.9%     596432 =C2=B1  2%      -7.1%     558940 =C2=
=B1 18%  interrupts.CPU169.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU169.MCP:Machine_check_polls
    214.17 =C2=B1 43%      -6.3%     200.71 =C2=B1 29%      +1.3%     217.0=
0 =C2=B1 41%  interrupts.CPU169.NMI:Non-maskable_interrupts
    214.17 =C2=B1 43%      -6.3%     200.71 =C2=B1 29%      +1.3%     217.0=
0 =C2=B1 41%  interrupts.CPU169.PMI:Performance_monitoring_interrupts
     11.50 =C2=B1 57%      +1.9%      11.71 =C2=B1 49%      +0.6%      11.5=
7 =C2=B1 36%  interrupts.CPU169.RES:Rescheduling_interrupts
      8.17 =C2=B1 21%      +3.2%       8.43 =C2=B1 21%     +32.9%      10.8=
6 =C2=B1 49%  interrupts.CPU169.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU17.37:IR-PCI-MSI.3145729-edge
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU17.3:IR-IO-APIC.3-edge
      2.50 =C2=B1 44%      +2.9%       2.57 =C2=B1 40%     -31.4%       1.7=
1 =C2=B1 86%  interrupts.CPU17.42:IR-PCI-MSI.512000-edge.ahci[0000:00:1f.2]
      1679 =C2=B1 20%     -11.9%       1479 =C2=B1 23%     -22.6%       129=
9 =C2=B1  6%  interrupts.CPU17.CAL:Function_call_interrupts
    602147            -1.6%     592747 =C2=B1  3%      -7.2%     558939 =C2=
=B1 18%  interrupts.CPU17.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU17.MCP:Machine_check_polls
    254.67 =C2=B1 34%     +18.4%     301.57 =C2=B1 22%      -9.0%     231.7=
1 =C2=B1 44%  interrupts.CPU17.NMI:Non-maskable_interrupts
    254.67 =C2=B1 34%     +18.4%     301.57 =C2=B1 22%      -9.0%     231.7=
1 =C2=B1 44%  interrupts.CPU17.PMI:Performance_monitoring_interrupts
     54.67 =C2=B1 54%     -36.2%      34.86 =C2=B1 60%     -74.7%      13.8=
6 =C2=B1 77%  interrupts.CPU17.RES:Rescheduling_interrupts
     29.17 =C2=B1 47%     -21.1%      23.00 =C2=B1 14%     -17.7%      24.0=
0 =C2=B1105%  interrupts.CPU17.TLB:TLB_shootdowns
      1230          +119.7%       2704 =C2=B1129%      -0.0%       1230 =C2=
=B1  2%  interrupts.CPU170.CAL:Function_call_interrupts
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    interrupts.CPU170.IWI:IRQ_work_interrupts
    602073            -2.9%     584662 =C2=B1  7%      -7.1%     559321 =C2=
=B1 18%  interrupts.CPU170.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU170.MCP:Machine_check_polls
    350.17 =C2=B1 28%     -27.5%     253.71 =C2=B1 31%     -18.7%     284.7=
1 =C2=B1 39%  interrupts.CPU170.NMI:Non-maskable_interrupts
    350.17 =C2=B1 28%     -27.5%     253.71 =C2=B1 31%     -18.7%     284.7=
1 =C2=B1 39%  interrupts.CPU170.PMI:Performance_monitoring_interrupts
     13.67 =C2=B1 31%     +34.8%      18.43 =C2=B1115%     -32.1%       9.2=
9 =C2=B1 52%  interrupts.CPU170.RES:Rescheduling_interrupts
      9.50 =C2=B1 13%      +0.8%       9.57 =C2=B1 13%     +11.3%      10.5=
7 =C2=B1 21%  interrupts.CPU170.TLB:TLB_shootdowns
      1221            +0.3%       1224            -0.7%       1212        i=
nterrupts.CPU171.CAL:Function_call_interrupts
    601980            -3.0%     584105 =C2=B1  7%      -7.2%     558797 =C2=
=B1 18%  interrupts.CPU171.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU171.MCP:Machine_check_polls
    288.67 =C2=B1 34%      +7.5%     310.43 =C2=B1 33%      +1.6%     293.4=
3 =C2=B1 40%  interrupts.CPU171.NMI:Non-maskable_interrupts
    288.67 =C2=B1 34%      +7.5%     310.43 =C2=B1 33%      +1.6%     293.4=
3 =C2=B1 40%  interrupts.CPU171.PMI:Performance_monitoring_interrupts
      8.33 =C2=B1 52%     +54.3%      12.86 =C2=B1 55%     -10.9%       7.4=
3 =C2=B1 55%  interrupts.CPU171.RES:Rescheduling_interrupts
      9.50 =C2=B1 14%     -15.8%       8.00 =C2=B1 16%      -3.8%       9.1=
4 =C2=B1 22%  interrupts.CPU171.TLB:TLB_shootdowns
      1216            +0.5%       1222            +6.4%       1294 =C2=B1 1=
1%  interrupts.CPU172.CAL:Function_call_interrupts
    602073            -2.0%     590074 =C2=B1  4%      -7.1%     559101 =C2=
=B1 18%  interrupts.CPU172.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU172.MCP:Machine_check_polls
    263.00 =C2=B1 32%     +24.3%     327.00 =C2=B1 68%     -25.1%     197.0=
0 =C2=B1 38%  interrupts.CPU172.NMI:Non-maskable_interrupts
    263.00 =C2=B1 32%     +24.3%     327.00 =C2=B1 68%     -25.1%     197.0=
0 =C2=B1 38%  interrupts.CPU172.PMI:Performance_monitoring_interrupts
      7.83 =C2=B1 37%      -8.8%       7.14 =C2=B1 39%    +200.9%      23.5=
7 =C2=B1108%  interrupts.CPU172.RES:Rescheduling_interrupts
      9.17 =C2=B1 26%      +9.1%      10.00 =C2=B1 29%    +108.8%      19.1=
4 =C2=B1 93%  interrupts.CPU172.TLB:TLB_shootdowns
      1211            +8.2%       1310 =C2=B1 17%      +8.0%       1308 =C2=
=B1  8%  interrupts.CPU173.CAL:Function_call_interrupts
    602024            -1.1%     595423 =C2=B1  2%      -7.1%     559040 =C2=
=B1 18%  interrupts.CPU173.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU173.MCP:Machine_check_polls
    238.83 =C2=B1 34%      -1.0%     236.43 =C2=B1 34%     -16.7%     199.0=
0 =C2=B1 40%  interrupts.CPU173.NMI:Non-maskable_interrupts
    238.83 =C2=B1 34%      -1.0%     236.43 =C2=B1 34%     -16.7%     199.0=
0 =C2=B1 40%  interrupts.CPU173.PMI:Performance_monitoring_interrupts
      7.50 =C2=B1 39%     -23.8%       5.71 =C2=B1 76%    +221.9%      24.1=
4 =C2=B1 64%  interrupts.CPU173.RES:Rescheduling_interrupts
      7.50 =C2=B1 12%    +119.0%      16.43 =C2=B1133%    +111.4%      15.8=
6 =C2=B1 66%  interrupts.CPU173.TLB:TLB_shootdowns
      1227            -0.3%       1224            -0.3%       1223 =C2=B1  =
2%  interrupts.CPU174.CAL:Function_call_interrupts
      0.00       +4.3e+101%       0.43 =C2=B1244%    -100.0%       0.00    =
    interrupts.CPU174.IWI:IRQ_work_interrupts
    602074            -4.4%     575496 =C2=B1 11%      -7.1%     559202 =C2=
=B1 18%  interrupts.CPU174.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU174.MCP:Machine_check_polls
    312.67 =C2=B1 36%      -5.8%     294.43 =C2=B1 47%     -10.0%     281.2=
9 =C2=B1 40%  interrupts.CPU174.NMI:Non-maskable_interrupts
    312.67 =C2=B1 36%      -5.8%     294.43 =C2=B1 47%     -10.0%     281.2=
9 =C2=B1 40%  interrupts.CPU174.PMI:Performance_monitoring_interrupts
      9.33 =C2=B1 47%      -0.5%       9.29 =C2=B1 27%     -20.4%       7.4=
3 =C2=B1 60%  interrupts.CPU174.RES:Rescheduling_interrupts
     59.50 =C2=B1184%     -86.3%       8.14 =C2=B1 22%     -82.0%      10.7=
1 =C2=B1 17%  interrupts.CPU174.TLB:TLB_shootdowns
      1221            +0.2%       1223            +5.7%       1290 =C2=B1  =
8%  interrupts.CPU175.CAL:Function_call_interrupts
    602043            -3.3%     582196 =C2=B1  8%      -7.1%     559162 =C2=
=B1 18%  interrupts.CPU175.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU175.MCP:Machine_check_polls
    318.67 =C2=B1 35%      +6.7%     340.14 =C2=B1 49%      +8.8%     346.8=
6 =C2=B1 31%  interrupts.CPU175.NMI:Non-maskable_interrupts
    318.67 =C2=B1 35%      +6.7%     340.14 =C2=B1 49%      +8.8%     346.8=
6 =C2=B1 31%  interrupts.CPU175.PMI:Performance_monitoring_interrupts
     10.83 =C2=B1 44%      +9.5%      11.86 =C2=B1 41%     +30.5%      14.1=
4 =C2=B1 72%  interrupts.CPU175.RES:Rescheduling_interrupts
     10.33 =C2=B1 45%    +573.3%      69.57 =C2=B1222%     +61.8%      16.7=
1 =C2=B1103%  interrupts.CPU175.TLB:TLB_shootdowns
      1251 =C2=B1  4%      +1.5%       1270 =C2=B1  8%      -2.0%       122=
5        interrupts.CPU176.CAL:Function_call_interrupts
    602126            -4.0%     578282 =C2=B1 10%      -7.1%     559100 =C2=
=B1 18%  interrupts.CPU176.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU176.MCP:Machine_check_polls
    286.33 =C2=B1 31%      +5.0%     300.57 =C2=B1 36%      -9.0%     260.5=
7 =C2=B1 41%  interrupts.CPU176.NMI:Non-maskable_interrupts
    286.33 =C2=B1 31%      +5.0%     300.57 =C2=B1 36%      -9.0%     260.5=
7 =C2=B1 41%  interrupts.CPU176.PMI:Performance_monitoring_interrupts
     10.83 =C2=B1 46%      +4.2%      11.29 =C2=B1 62%      -9.0%       9.8=
6 =C2=B1 25%  interrupts.CPU176.RES:Rescheduling_interrupts
     12.67 =C2=B1 50%     -30.1%       8.86 =C2=B1 29%     -12.0%      11.1=
4 =C2=B1 13%  interrupts.CPU176.TLB:TLB_shootdowns
      1226            +1.0%       1238 =C2=B1  2%      -1.1%       1213    =
    interrupts.CPU177.CAL:Function_call_interrupts
    602013            -3.4%     581480 =C2=B1  8%      -7.1%     559051 =C2=
=B1 18%  interrupts.CPU177.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU177.MCP:Machine_check_polls
    272.17 =C2=B1 33%     +19.6%     325.57 =C2=B1 33%      -7.5%     251.7=
1 =C2=B1 41%  interrupts.CPU177.NMI:Non-maskable_interrupts
    272.17 =C2=B1 33%     +19.6%     325.57 =C2=B1 33%      -7.5%     251.7=
1 =C2=B1 41%  interrupts.CPU177.PMI:Performance_monitoring_interrupts
      9.83 =C2=B1 30%     -27.4%       7.14 =C2=B1 38%     -17.2%       8.1=
4 =C2=B1 21%  interrupts.CPU177.RES:Rescheduling_interrupts
      8.50 =C2=B1 11%      +7.6%       9.14 =C2=B1 20%      -0.8%       8.4=
3 =C2=B1 21%  interrupts.CPU177.TLB:TLB_shootdowns
      1225 =C2=B1  2%      +1.7%       1245 =C2=B1  2%      +2.5%       125=
5 =C2=B1  3%  interrupts.CPU178.CAL:Function_call_interrupts
    602102            -3.9%     578663 =C2=B1  9%      -7.1%     559110 =C2=
=B1 18%  interrupts.CPU178.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU178.MCP:Machine_check_polls
    285.50 =C2=B1 38%     -17.3%     236.14 =C2=B1 31%     -10.6%     255.1=
4 =C2=B1 42%  interrupts.CPU178.NMI:Non-maskable_interrupts
    285.50 =C2=B1 38%     -17.3%     236.14 =C2=B1 31%     -10.6%     255.1=
4 =C2=B1 42%  interrupts.CPU178.PMI:Performance_monitoring_interrupts
     10.67 =C2=B1 46%      -6.2%      10.00 =C2=B1 72%     -18.3%       8.7=
1 =C2=B1 46%  interrupts.CPU178.RES:Rescheduling_interrupts
     12.83 =C2=B1 49%      +5.8%      13.57 =C2=B1 47%     -19.9%      10.2=
9 =C2=B1 21%  interrupts.CPU178.TLB:TLB_shootdowns
      1235            +2.2%       1263 =C2=B1  7%      -0.3%       1231 =C2=
=B1  2%  interrupts.CPU179.CAL:Function_call_interrupts
    602028            -3.7%     579781 =C2=B1  9%      -7.1%     559026 =C2=
=B1 18%  interrupts.CPU179.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU179.MCP:Machine_check_polls
    282.67 =C2=B1 32%     -16.7%     235.43 =C2=B1 32%     -10.8%     252.1=
4 =C2=B1 41%  interrupts.CPU179.NMI:Non-maskable_interrupts
    282.67 =C2=B1 32%     -16.7%     235.43 =C2=B1 32%     -10.8%     252.1=
4 =C2=B1 41%  interrupts.CPU179.PMI:Performance_monitoring_interrupts
      7.17 =C2=B1104%    +121.3%      15.86 =C2=B1102%      -0.3%       7.1=
4 =C2=B1 55%  interrupts.CPU179.RES:Rescheduling_interrupts
      8.50 =C2=B1 21%     +16.0%       9.86 =C2=B1 34%      +0.8%       8.5=
7 =C2=B1 13%  interrupts.CPU179.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU18.38:IR-PCI-MSI.3145730-edge
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU18.3:IR-IO-APIC.3-edge
      0.50 =C2=B1223%     -14.3%       0.43 =C2=B1244%    +157.1%       1.2=
9 =C2=B1115%  interrupts.CPU18.42:IR-PCI-MSI.512000-edge.ahci[0000:00:1f.2]
      1741 =C2=B1 19%      -6.6%       1626 =C2=B1 26%      -8.8%       158=
8 =C2=B1 21%  interrupts.CPU18.CAL:Function_call_interrupts
    602321            -0.3%     600466            -7.2%     559096 =C2=B1 1=
8%  interrupts.CPU18.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU18.MCP:Machine_check_polls
    309.00 =C2=B1 31%     -24.5%     233.43 =C2=B1 30%     -16.6%     257.7=
1 =C2=B1 41%  interrupts.CPU18.NMI:Non-maskable_interrupts
    309.00 =C2=B1 31%     -24.5%     233.43 =C2=B1 30%     -16.6%     257.7=
1 =C2=B1 41%  interrupts.CPU18.PMI:Performance_monitoring_interrupts
     79.17 =C2=B1 55%     -15.7%      66.71 =C2=B1101%     -21.5%      62.1=
4 =C2=B1 67%  interrupts.CPU18.RES:Rescheduling_interrupts
     71.00 =C2=B1 27%     -24.5%      53.57 =C2=B1 46%     -29.8%      49.8=
6 =C2=B1 44%  interrupts.CPU18.TLB:TLB_shootdowns
      1246 =C2=B1  2%      -1.3%       1230 =C2=B1  3%      +1.9%       127=
0 =C2=B1  8%  interrupts.CPU180.CAL:Function_call_interrupts
    602092            -2.9%     584907 =C2=B1  7%      -7.1%     559072 =C2=
=B1 18%  interrupts.CPU180.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU180.MCP:Machine_check_polls
    284.50 =C2=B1 34%     -12.3%     249.57 =C2=B1 29%     +14.8%     326.5=
7 =C2=B1 37%  interrupts.CPU180.NMI:Non-maskable_interrupts
    284.50 =C2=B1 34%     -12.3%     249.57 =C2=B1 29%     +14.8%     326.5=
7 =C2=B1 37%  interrupts.CPU180.PMI:Performance_monitoring_interrupts
      9.00 =C2=B1 47%      +1.6%       9.14 =C2=B1 79%     +14.3%      10.2=
9 =C2=B1 90%  interrupts.CPU180.RES:Rescheduling_interrupts
     12.50 =C2=B1 31%     -20.0%      10.00 =C2=B1 25%      -5.1%      11.8=
6 =C2=B1 23%  interrupts.CPU180.TLB:TLB_shootdowns
      1219            +0.1%       1220            +0.2%       1221        i=
nterrupts.CPU181.CAL:Function_call_interrupts
      0.00       +2.9e+101%       0.29 =C2=B1244%    -100.0%       0.00    =
    interrupts.CPU181.IWI:IRQ_work_interrupts
    602091            -2.9%     584699 =C2=B1  7%      -7.2%     559015 =C2=
=B1 18%  interrupts.CPU181.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU181.MCP:Machine_check_polls
    494.00 =C2=B1 93%     +96.5%     970.71 =C2=B1165%     -34.5%     323.4=
3 =C2=B1 38%  interrupts.CPU181.NMI:Non-maskable_interrupts
    494.00 =C2=B1 93%     +96.5%     970.71 =C2=B1165%     -34.5%     323.4=
3 =C2=B1 38%  interrupts.CPU181.PMI:Performance_monitoring_interrupts
      7.50 =C2=B1 41%      -6.7%       7.00 =C2=B1 53%     -23.8%       5.7=
1 =C2=B1 45%  interrupts.CPU181.RES:Rescheduling_interrupts
      9.50 =C2=B1 36%     -15.8%       8.00 =C2=B1 11%      -6.8%       8.8=
6 =C2=B1 20%  interrupts.CPU181.TLB:TLB_shootdowns
      1243 =C2=B1  3%      -1.7%       1222            -2.0%       1218    =
    interrupts.CPU182.CAL:Function_call_interrupts
    602102            -2.9%     584748 =C2=B1  7%      -7.1%     559104 =C2=
=B1 18%  interrupts.CPU182.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU182.MCP:Machine_check_polls
    256.33 =C2=B1 35%     +32.0%     338.29 =C2=B1 30%     +21.3%     310.8=
6 =C2=B1 40%  interrupts.CPU182.NMI:Non-maskable_interrupts
    256.33 =C2=B1 35%     +32.0%     338.29 =C2=B1 30%     +21.3%     310.8=
6 =C2=B1 40%  interrupts.CPU182.PMI:Performance_monitoring_interrupts
     11.00 =C2=B1 54%     -36.4%       7.00 =C2=B1 27%     -36.4%       7.0=
0 =C2=B1 30%  interrupts.CPU182.RES:Rescheduling_interrupts
     12.00 =C2=B1 30%      +1.2%      12.14 =C2=B1 51%     -21.4%       9.4=
3 =C2=B1 27%  interrupts.CPU182.TLB:TLB_shootdowns
      1233            -1.5%       1215            +7.6%       1327 =C2=B1 2=
1%  interrupts.CPU183.CAL:Function_call_interrupts
    602080            -2.9%     584612 =C2=B1  7%      -7.1%     559189 =C2=
=B1 18%  interrupts.CPU183.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU183.MCP:Machine_check_polls
    246.50 =C2=B1 31%     +23.2%     303.71 =C2=B1 36%      +9.0%     268.7=
1 =C2=B1 38%  interrupts.CPU183.NMI:Non-maskable_interrupts
    246.50 =C2=B1 31%     +23.2%     303.71 =C2=B1 36%      +9.0%     268.7=
1 =C2=B1 38%  interrupts.CPU183.PMI:Performance_monitoring_interrupts
     11.50 =C2=B1 39%     -35.4%       7.43 =C2=B1 79%     -35.4%       7.4=
3 =C2=B1 15%  interrupts.CPU183.RES:Rescheduling_interrupts
      8.00 =C2=B1 22%      +7.1%       8.57 =C2=B1 27%      +7.1%       8.5=
7 =C2=B1 25%  interrupts.CPU183.TLB:TLB_shootdowns
      1231            +0.3%       1235           +25.0%       1539 =C2=B1 4=
1%  interrupts.CPU184.CAL:Function_call_interrupts
    601990            -3.7%     579975 =C2=B1  9%      -7.1%     559155 =C2=
=B1 18%  interrupts.CPU184.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU184.MCP:Machine_check_polls
    326.00 =C2=B1 31%     -18.8%     264.71 =C2=B1 34%     -40.2%     194.8=
6 =C2=B1 15%  interrupts.CPU184.NMI:Non-maskable_interrupts
    326.00 =C2=B1 31%     -18.8%     264.71 =C2=B1 34%     -40.2%     194.8=
6 =C2=B1 15%  interrupts.CPU184.PMI:Performance_monitoring_interrupts
      7.33 =C2=B1 44%     +32.5%       9.71 =C2=B1 50%     +83.1%      13.4=
3 =C2=B1 58%  interrupts.CPU184.RES:Rescheduling_interrupts
      9.17 =C2=B1 23%     +15.3%      10.57 =C2=B1 20%     +48.1%      13.5=
7 =C2=B1 46%  interrupts.CPU184.TLB:TLB_shootdowns
      1247 =C2=B1  5%      -1.4%       1230 =C2=B1  2%     +16.9%       145=
8 =C2=B1 27%  interrupts.CPU185.CAL:Function_call_interrupts
    602165            -3.7%     579615 =C2=B1  9%      -7.2%     559033 =C2=
=B1 18%  interrupts.CPU185.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU185.MCP:Machine_check_polls
    270.00 =C2=B1 35%      -2.8%     262.57 =C2=B1 34%      -5.7%     254.7=
1 =C2=B1 42%  interrupts.CPU185.NMI:Non-maskable_interrupts
    270.00 =C2=B1 35%      -2.8%     262.57 =C2=B1 34%      -5.7%     254.7=
1 =C2=B1 42%  interrupts.CPU185.PMI:Performance_monitoring_interrupts
      6.50 =C2=B1 42%     +38.5%       9.00 =C2=B1 40%     +71.4%      11.1=
4 =C2=B1111%  interrupts.CPU185.RES:Rescheduling_interrupts
      7.67 =C2=B1 12%     +21.1%       9.29 =C2=B1 19%     +36.0%      10.4=
3 =C2=B1 38%  interrupts.CPU185.TLB:TLB_shootdowns
      1237 =C2=B1  2%      +0.3%       1241            +1.9%       1260 =C2=
=B1  5%  interrupts.CPU186.CAL:Function_call_interrupts
    602047            -4.2%     576496 =C2=B1 10%      -7.1%     559373 =C2=
=B1 18%  interrupts.CPU186.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU186.MCP:Machine_check_polls
    279.50 =C2=B1 35%     +15.8%     323.57 =C2=B1 30%     -18.4%     228.1=
4 =C2=B1 37%  interrupts.CPU186.NMI:Non-maskable_interrupts
    279.50 =C2=B1 35%     +15.8%     323.57 =C2=B1 30%     -18.4%     228.1=
4 =C2=B1 37%  interrupts.CPU186.PMI:Performance_monitoring_interrupts
      9.67 =C2=B1 40%      -8.4%       8.86 =C2=B1 30%     +34.5%      13.0=
0 =C2=B1 94%  interrupts.CPU186.RES:Rescheduling_interrupts
     10.17 =C2=B1 20%     +16.6%      11.86 =C2=B1 17%     +12.4%      11.4=
3 =C2=B1 27%  interrupts.CPU186.TLB:TLB_shootdowns
      1225            -0.9%       1213            -0.2%       1223        i=
nterrupts.CPU187.CAL:Function_call_interrupts
    602052            -3.5%     580771 =C2=B1  9%      -7.1%     559072 =C2=
=B1 18%  interrupts.CPU187.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU187.MCP:Machine_check_polls
    273.00 =C2=B1 33%     +28.5%     350.86 =C2=B1 25%      +4.2%     284.5=
7 =C2=B1 41%  interrupts.CPU187.NMI:Non-maskable_interrupts
    273.00 =C2=B1 33%     +28.5%     350.86 =C2=B1 25%      +4.2%     284.5=
7 =C2=B1 41%  interrupts.CPU187.PMI:Performance_monitoring_interrupts
     11.83 =C2=B1 48%     -21.5%       9.29 =C2=B1 31%     -22.7%       9.1=
4 =C2=B1 68%  interrupts.CPU187.RES:Rescheduling_interrupts
      8.33 =C2=B1 11%     +14.9%       9.57 =C2=B1 18%     +11.4%       9.2=
9 =C2=B1 15%  interrupts.CPU187.TLB:TLB_shootdowns
      1232            +1.6%       1251 =C2=B1  2%      -1.8%       1209    =
    interrupts.CPU188.CAL:Function_call_interrupts
    602285            -2.5%     586935 =C2=B1  6%      -7.2%     558626 =C2=
=B1 18%  interrupts.CPU188.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU188.MCP:Machine_check_polls
    315.17 =C2=B1 35%      -3.7%     303.57 =C2=B1 35%      -7.4%     292.0=
0 =C2=B1 41%  interrupts.CPU188.NMI:Non-maskable_interrupts
    315.17 =C2=B1 35%      -3.7%     303.57 =C2=B1 35%      -7.4%     292.0=
0 =C2=B1 41%  interrupts.CPU188.PMI:Performance_monitoring_interrupts
      9.50 =C2=B1 58%     +14.3%      10.86 =C2=B1 44%      -2.3%       9.2=
9 =C2=B1 28%  interrupts.CPU188.RES:Rescheduling_interrupts
     11.00 =C2=B1 30%     +26.0%      13.86 =C2=B1 34%      -5.2%      10.4=
3 =C2=B1 33%  interrupts.CPU188.TLB:TLB_shootdowns
      1224            +3.4%       1266 =C2=B1  7%      -0.4%       1220    =
    interrupts.CPU189.CAL:Function_call_interrupts
    602219            -2.7%     586247 =C2=B1  6%      -7.2%     558972 =C2=
=B1 18%  interrupts.CPU189.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU189.MCP:Machine_check_polls
    306.83 =C2=B1 33%     -21.6%     240.43 =C2=B1 32%     -35.9%     196.5=
7 =C2=B1 17%  interrupts.CPU189.NMI:Non-maskable_interrupts
    306.83 =C2=B1 33%     -21.6%     240.43 =C2=B1 32%     -35.9%     196.5=
7 =C2=B1 17%  interrupts.CPU189.PMI:Performance_monitoring_interrupts
      7.00 =C2=B1 31%    +120.4%      15.43 =C2=B1 86%     -14.3%       6.0=
0 =C2=B1 50%  interrupts.CPU189.RES:Rescheduling_interrupts
      7.67 =C2=B1 20%     +32.3%      10.14 =C2=B1 24%     +15.5%       8.8=
6 =C2=B1 22%  interrupts.CPU189.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU19.39:IR-PCI-MSI.3145731-edge
      1380 =C2=B1  8%      +6.3%       1467 =C2=B1 10%      +0.9%       139=
3 =C2=B1  9%  interrupts.CPU19.CAL:Function_call_interrupts
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    interrupts.CPU19.IWI:IRQ_work_interrupts
    602197            -0.6%     598826            -7.1%     559255 =C2=B1 1=
8%  interrupts.CPU19.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU19.MCP:Machine_check_polls
    242.33 =C2=B1 32%     +28.4%     311.14 =C2=B1 63%     +47.0%     356.1=
4 =C2=B1 46%  interrupts.CPU19.NMI:Non-maskable_interrupts
    242.33 =C2=B1 32%     +28.4%     311.14 =C2=B1 63%     +47.0%     356.1=
4 =C2=B1 46%  interrupts.CPU19.PMI:Performance_monitoring_interrupts
     19.83 =C2=B1 43%     +96.6%      39.00 =C2=B1 52%     +19.6%      23.7=
1 =C2=B1 17%  interrupts.CPU19.RES:Rescheduling_interrupts
     21.17 =C2=B1 43%     -22.4%      16.43 =C2=B1 42%      +1.9%      21.5=
7 =C2=B1 30%  interrupts.CPU19.TLB:TLB_shootdowns
      1235            +4.7%       1292 =C2=B1  2%      +4.2%       1286 =C2=
=B1  8%  interrupts.CPU190.CAL:Function_call_interrupts
    602238            -3.1%     583752 =C2=B1  7%      -7.2%     558911 =C2=
=B1 18%  interrupts.CPU190.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU190.MCP:Machine_check_polls
    327.67 =C2=B1 33%      -7.6%     302.86 =C2=B1 33%     -18.1%     268.4=
3 =C2=B1 41%  interrupts.CPU190.NMI:Non-maskable_interrupts
    327.67 =C2=B1 33%      -7.6%     302.86 =C2=B1 33%     -18.1%     268.4=
3 =C2=B1 41%  interrupts.CPU190.PMI:Performance_monitoring_interrupts
      6.50 =C2=B1 49%    +113.2%      13.86 =C2=B1 30%    +126.4%      14.7=
1 =C2=B1 99%  interrupts.CPU190.RES:Rescheduling_interrupts
     11.67 =C2=B1 26%      +6.5%      12.43 =C2=B1 21%      -6.9%      10.8=
6 =C2=B1 35%  interrupts.CPU190.TLB:TLB_shootdowns
      1238 =C2=B1  3%      -0.2%       1235 =C2=B1  2%      +0.4%       124=
3 =C2=B1  2%  interrupts.CPU191.CAL:Function_call_interrupts
    602265            -3.2%     583183 =C2=B1  7%      -7.2%     558868 =C2=
=B1 18%  interrupts.CPU191.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU191.MCP:Machine_check_polls
    450.67 =C2=B1 95%     -33.4%     300.14 =C2=B1 29%     -17.6%     371.1=
4 =C2=B1 48%  interrupts.CPU191.NMI:Non-maskable_interrupts
    450.67 =C2=B1 95%     -33.4%     300.14 =C2=B1 29%     -17.6%     371.1=
4 =C2=B1 48%  interrupts.CPU191.PMI:Performance_monitoring_interrupts
     10.67 =C2=B1 52%      +0.4%      10.71 =C2=B1 43%     -30.4%       7.4=
3 =C2=B1 53%  interrupts.CPU191.RES:Rescheduling_interrupts
     20.67 =C2=B1122%     -55.8%       9.14 =C2=B1 10%      -3.9%      19.8=
6 =C2=B1121%  interrupts.CPU191.TLB:TLB_shootdowns
      1272 =C2=B1 10%      -4.4%       1217            -4.8%       1212    =
    interrupts.CPU192.CAL:Function_call_interrupts
    602071            -2.3%     588372 =C2=B1  5%      -7.2%     558844 =C2=
=B1 18%  interrupts.CPU192.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU192.MCP:Machine_check_polls
    244.33 =C2=B1 28%     +18.5%     289.43 =C2=B1 35%      -9.6%     220.8=
6 =C2=B1 36%  interrupts.CPU192.NMI:Non-maskable_interrupts
    244.33 =C2=B1 28%     +18.5%     289.43 =C2=B1 35%      -9.6%     220.8=
6 =C2=B1 36%  interrupts.CPU192.PMI:Performance_monitoring_interrupts
     14.17 =C2=B1 95%     -42.5%       8.14 =C2=B1 46%     -50.6%       7.0=
0 =C2=B1 27%  interrupts.CPU192.RES:Rescheduling_interrupts
      6.83 =C2=B1  5%      +2.4%       7.00            +6.6%       7.29 =C2=
=B1  9%  interrupts.CPU192.TLB:TLB_shootdowns
      1211            +0.4%       1216            +0.1%       1213        i=
nterrupts.CPU193.CAL:Function_call_interrupts
    601474            -2.6%     585628 =C2=B1  6%      -7.1%     558941 =C2=
=B1 18%  interrupts.CPU193.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU193.MCP:Machine_check_polls
    341.00 =C2=B1 40%     -13.2%     295.86 =C2=B1 32%     -40.7%     202.2=
9 =C2=B1 16%  interrupts.CPU193.NMI:Non-maskable_interrupts
    341.00 =C2=B1 40%     -13.2%     295.86 =C2=B1 32%     -40.7%     202.2=
9 =C2=B1 16%  interrupts.CPU193.PMI:Performance_monitoring_interrupts
      5.83 =C2=B1 26%     +95.9%      11.43 =C2=B1 31%     +39.6%       8.1=
4 =C2=B1 59%  interrupts.CPU193.RES:Rescheduling_interrupts
      7.33 =C2=B1 35%      +5.2%       7.71 =C2=B1 13%     +11.0%       8.1=
4 =C2=B1 21%  interrupts.CPU193.TLB:TLB_shootdowns
      1215            +1.6%       1235            +2.8%       1249 =C2=B1  =
6%  interrupts.CPU194.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +5.7e+101%       0.57 =C2=B124=
4%  interrupts.CPU194.IWI:IRQ_work_interrupts
    601981            -0.3%     600360            -7.1%     558992 =C2=B1 1=
8%  interrupts.CPU194.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU194.MCP:Machine_check_polls
    223.50 =C2=B1 37%     +19.8%     267.71 =C2=B1 31%    +119.4%     490.2=
9 =C2=B1152%  interrupts.CPU194.NMI:Non-maskable_interrupts
    223.50 =C2=B1 37%     +19.8%     267.71 =C2=B1 31%    +119.4%     490.2=
9 =C2=B1152%  interrupts.CPU194.PMI:Performance_monitoring_interrupts
      7.00 =C2=B1 56%     +14.3%       8.00 =C2=B1 54%     +46.9%      10.2=
9 =C2=B1117%  interrupts.CPU194.RES:Rescheduling_interrupts
     10.33 =C2=B1 33%      -1.8%      10.14 =C2=B1 32%     +23.0%      12.7=
1 =C2=B1 45%  interrupts.CPU194.TLB:TLB_shootdowns
      1238 =C2=B1  2%      -0.7%       1229            -0.8%       1228    =
    interrupts.CPU195.CAL:Function_call_interrupts
    602105            -0.3%     600431            -7.1%     559190 =C2=B1 1=
8%  interrupts.CPU195.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU195.MCP:Machine_check_polls
    267.67 =C2=B1 33%      -5.4%     253.29 =C2=B1 33%     -18.2%     219.0=
0 =C2=B1 39%  interrupts.CPU195.NMI:Non-maskable_interrupts
    267.67 =C2=B1 33%      -5.4%     253.29 =C2=B1 33%     -18.2%     219.0=
0 =C2=B1 39%  interrupts.CPU195.PMI:Performance_monitoring_interrupts
     20.83 =C2=B1 34%     -56.1%       9.14 =C2=B1 41%     -38.3%      12.8=
6 =C2=B1 26%  interrupts.CPU195.RES:Rescheduling_interrupts
      8.17 =C2=B1 16%      +8.5%       8.86 =C2=B1 23%      +8.5%       8.8=
6 =C2=B1 26%  interrupts.CPU195.TLB:TLB_shootdowns
      1221            +0.3%       1224            +1.3%       1236 =C2=B1  =
2%  interrupts.CPU196.CAL:Function_call_interrupts
    601792            -2.6%     586432 =C2=B1  6%      -7.1%     559009 =C2=
=B1 18%  interrupts.CPU196.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU196.MCP:Machine_check_polls
    303.00 =C2=B1 33%      -6.4%     283.71 =C2=B1 31%     -18.8%     246.1=
4 =C2=B1 42%  interrupts.CPU196.NMI:Non-maskable_interrupts
    303.00 =C2=B1 33%      -6.4%     283.71 =C2=B1 31%     -18.8%     246.1=
4 =C2=B1 42%  interrupts.CPU196.PMI:Performance_monitoring_interrupts
      9.83 =C2=B1 36%     +39.5%      13.71 =C2=B1 73%     +39.5%      13.7=
1 =C2=B1102%  interrupts.CPU196.RES:Rescheduling_interrupts
     16.33 =C2=B1114%     -28.3%      11.71 =C2=B1 27%     -24.8%      12.2=
9 =C2=B1 67%  interrupts.CPU196.TLB:TLB_shootdowns
      1268 =C2=B1  8%      -2.6%       1236            -2.1%       1241 =C2=
=B1  2%  interrupts.CPU197.CAL:Function_call_interrupts
    601986            -2.8%     585012 =C2=B1  7%      -7.1%     558976 =C2=
=B1 18%  interrupts.CPU197.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU197.MCP:Machine_check_polls
    250.50 =C2=B1 29%     +21.5%     304.29 =C2=B1 31%      -4.4%     239.5=
7 =C2=B1 37%  interrupts.CPU197.NMI:Non-maskable_interrupts
    250.50 =C2=B1 29%     +21.5%     304.29 =C2=B1 31%      -4.4%     239.5=
7 =C2=B1 37%  interrupts.CPU197.PMI:Performance_monitoring_interrupts
     21.00 =C2=B1 80%     -18.4%      17.14 =C2=B1 27%     -15.0%      17.8=
6 =C2=B1 36%  interrupts.CPU197.RES:Rescheduling_interrupts
      6.83 =C2=B1 15%     +61.0%      11.00 =C2=B1 60%     +84.0%      12.5=
7 =C2=B1 37%  interrupts.CPU197.TLB:TLB_shootdowns
      1240 =C2=B1  2%      -1.7%       1219            -1.3%       1224    =
    interrupts.CPU198.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +4.3e+101%       0.43 =C2=B124=
4%  interrupts.CPU198.IWI:IRQ_work_interrupts
    602072            -1.8%     591072 =C2=B1  4%      -7.2%     558912 =C2=
=B1 18%  interrupts.CPU198.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU198.MCP:Machine_check_polls
    292.33 =C2=B1 33%     +12.0%     327.29 =C2=B1 26%    +253.5%       103=
3 =C2=B1194%  interrupts.CPU198.NMI:Non-maskable_interrupts
    292.33 =C2=B1 33%     +12.0%     327.29 =C2=B1 26%    +253.5%       103=
3 =C2=B1194%  interrupts.CPU198.PMI:Performance_monitoring_interrupts
      9.00 =C2=B1 36%     -19.0%       7.29 =C2=B1 96%     -11.1%       8.0=
0 =C2=B1 34%  interrupts.CPU198.RES:Rescheduling_interrupts
     11.00 =C2=B1 21%     -13.0%       9.57 =C2=B1 15%     -19.5%       8.8=
6 =C2=B1 16%  interrupts.CPU198.TLB:TLB_shootdowns
      1226            +8.5%       1330 =C2=B1 11%      +4.1%       1275 =C2=
=B1  9%  interrupts.CPU199.CAL:Function_call_interrupts
    602135            -2.7%     585741 =C2=B1  6%      -7.1%     559176 =C2=
=B1 18%  interrupts.CPU199.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU199.MCP:Machine_check_polls
    316.67 =C2=B1 35%     -25.0%     237.43 =C2=B1 34%     -37.1%     199.1=
4 =C2=B1 15%  interrupts.CPU199.NMI:Non-maskable_interrupts
    316.67 =C2=B1 35%     -25.0%     237.43 =C2=B1 34%     -37.1%     199.1=
4 =C2=B1 15%  interrupts.CPU199.PMI:Performance_monitoring_interrupts
     14.00 =C2=B1 20%     +74.5%      24.43 =C2=B1 81%     +40.8%      19.7=
1 =C2=B1 60%  interrupts.CPU199.RES:Rescheduling_interrupts
      9.17 =C2=B1 31%    +250.6%      32.14 =C2=B1 95%     +94.8%      17.8=
6 =C2=B1147%  interrupts.CPU199.TLB:TLB_shootdowns
      1765 =C2=B1  6%      +6.7%       1884 =C2=B1 11%      +1.1%       178=
5 =C2=B1 21%  interrupts.CPU2.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +2.9e+101%       0.29 =C2=B124=
4%  interrupts.CPU2.IWI:IRQ_work_interrupts
    602297            -0.1%     601535            -7.1%     559336 =C2=B1 1=
8%  interrupts.CPU2.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU2.MCP:Machine_check_polls
    160.00 =C2=B1  4%     +45.2%     232.29 =C2=B1 33%     +69.4%     271.0=
0 =C2=B1 47%  interrupts.CPU2.NMI:Non-maskable_interrupts
    160.00 =C2=B1  4%     +45.2%     232.29 =C2=B1 33%     +69.4%     271.0=
0 =C2=B1 47%  interrupts.CPU2.PMI:Performance_monitoring_interrupts
     48.17 =C2=B1 19%     +38.2%      66.57 =C2=B1 51%     +49.5%      72.0=
0 =C2=B1 65%  interrupts.CPU2.RES:Rescheduling_interrupts
     72.83 =C2=B1 16%     -22.7%      56.29 =C2=B1 36%     -28.6%      52.0=
0 =C2=B1 40%  interrupts.CPU2.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU20.40:IR-PCI-MSI.3145732-edge
      1700 =C2=B1 13%      +6.4%       1809 =C2=B1 47%      -9.2%       154=
4 =C2=B1  9%  interrupts.CPU20.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +2.9e+101%       0.29 =C2=B124=
4%  interrupts.CPU20.IWI:IRQ_work_interrupts
    601458            -0.6%     597589            -7.1%     559037 =C2=B1 1=
8%  interrupts.CPU20.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU20.MCP:Machine_check_polls
    258.83 =C2=B1 34%     -13.8%     223.00 =C2=B1 34%     -18.5%     211.0=
0 =C2=B1 37%  interrupts.CPU20.NMI:Non-maskable_interrupts
    258.83 =C2=B1 34%     -13.8%     223.00 =C2=B1 34%     -18.5%     211.0=
0 =C2=B1 37%  interrupts.CPU20.PMI:Performance_monitoring_interrupts
     50.50 =C2=B1 23%     +84.2%      93.00 =C2=B1 97%      +1.8%      51.4=
3 =C2=B1 42%  interrupts.CPU20.RES:Rescheduling_interrupts
     67.50 =C2=B1 13%     -14.5%      57.71 =C2=B1 25%      -9.2%      61.2=
9 =C2=B1 42%  interrupts.CPU20.TLB:TLB_shootdowns
      1230 =C2=B1  2%      +2.1%       1256 =C2=B1  2%      -0.1%       122=
9        interrupts.CPU200.CAL:Function_call_interrupts
    602215            -2.7%     585910 =C2=B1  6%      -7.2%     558976 =C2=
=B1 18%  interrupts.CPU200.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU200.MCP:Machine_check_polls
    308.33 =C2=B1 34%     -22.9%     237.86 =C2=B1 32%     +43.8%     443.4=
3 =C2=B1102%  interrupts.CPU200.NMI:Non-maskable_interrupts
    308.33 =C2=B1 34%     -22.9%     237.86 =C2=B1 32%     +43.8%     443.4=
3 =C2=B1102%  interrupts.CPU200.PMI:Performance_monitoring_interrupts
      9.67 =C2=B1 70%     +27.1%      12.29 =C2=B1 36%     -12.8%       8.4=
3 =C2=B1 59%  interrupts.CPU200.RES:Rescheduling_interrupts
      8.67 =C2=B1 23%      +7.1%       9.29 =C2=B1 14%      +7.1%       9.2=
9 =C2=B1 17%  interrupts.CPU200.TLB:TLB_shootdowns
      1225           +10.5%       1353 =C2=B1 14%      +3.5%       1267 =C2=
=B1  8%  interrupts.CPU201.CAL:Function_call_interrupts
    601974            -3.1%     583370 =C2=B1  7%      -7.2%     558692 =C2=
=B1 18%  interrupts.CPU201.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU201.MCP:Machine_check_polls
    247.33 =C2=B1 32%     +32.5%     327.71 =C2=B1 29%      -5.0%     235.0=
0 =C2=B1 35%  interrupts.CPU201.NMI:Non-maskable_interrupts
    247.33 =C2=B1 32%     +32.5%     327.71 =C2=B1 29%      -5.0%     235.0=
0 =C2=B1 35%  interrupts.CPU201.PMI:Performance_monitoring_interrupts
     20.17 =C2=B1 27%     +57.3%      31.71 =C2=B1 60%      +1.3%      20.4=
3 =C2=B1 73%  interrupts.CPU201.RES:Rescheduling_interrupts
      7.33 =C2=B1 15%    +124.0%      16.43 =C2=B1 75%    +120.1%      16.1=
4 =C2=B1111%  interrupts.CPU201.TLB:TLB_shootdowns
      1229           +11.2%       1367 =C2=B1 16%      +1.6%       1248 =C2=
=B1  5%  interrupts.CPU202.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +4.3e+101%       0.43 =C2=B124=
4%  interrupts.CPU202.IWI:IRQ_work_interrupts
    602116            -2.3%     588136 =C2=B1  5%      -7.1%     559078 =C2=
=B1 18%  interrupts.CPU202.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU202.MCP:Machine_check_polls
    237.67 =C2=B1 32%     +17.8%     279.86 =C2=B1 32%     +17.5%     279.2=
9 =C2=B1 36%  interrupts.CPU202.NMI:Non-maskable_interrupts
    237.67 =C2=B1 32%     +17.8%     279.86 =C2=B1 32%     +17.5%     279.2=
9 =C2=B1 36%  interrupts.CPU202.PMI:Performance_monitoring_interrupts
      7.17 =C2=B1 28%     +97.3%      14.14 =C2=B1 75%     +41.5%      10.1=
4 =C2=B1124%  interrupts.CPU202.RES:Rescheduling_interrupts
      9.17 =C2=B1 31%      -8.1%       8.43 =C2=B1 12%     +83.9%      16.8=
6 =C2=B1131%  interrupts.CPU202.TLB:TLB_shootdowns
      1227            -0.3%       1224            +1.2%       1241 =C2=B1  =
2%  interrupts.CPU203.CAL:Function_call_interrupts
      0.00       +4.3e+101%       0.43 =C2=B1244% +1.4e+101%       0.14 =C2=
=B1244%  interrupts.CPU203.IWI:IRQ_work_interrupts
    602210            -2.7%     586215 =C2=B1  6%      -7.2%     559099 =C2=
=B1 18%  interrupts.CPU203.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU203.MCP:Machine_check_polls
    246.67 =C2=B1 30%     +34.8%     332.43 =C2=B1 28%     +22.4%     301.8=
6 =C2=B1 74%  interrupts.CPU203.NMI:Non-maskable_interrupts
    246.67 =C2=B1 30%     +34.8%     332.43 =C2=B1 28%     +22.4%     301.8=
6 =C2=B1 74%  interrupts.CPU203.PMI:Performance_monitoring_interrupts
     17.17 =C2=B1 24%     -38.4%      10.57 =C2=B1 23%      -2.6%      16.7=
1 =C2=B1 54%  interrupts.CPU203.RES:Rescheduling_interrupts
      7.00 =C2=B1  8%     +10.2%       7.71 =C2=B1 29%     +32.7%       9.2=
9 =C2=B1 43%  interrupts.CPU203.TLB:TLB_shootdowns
      1218            +1.0%       1230            +0.1%       1219        i=
nterrupts.CPU204.CAL:Function_call_interrupts
    602131            -5.2%     570579 =C2=B1 13%      -7.2%     559058 =C2=
=B1 18%  interrupts.CPU204.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU204.MCP:Machine_check_polls
    271.00 =C2=B1 36%      -4.6%     258.43 =C2=B1 35%     -28.9%     192.5=
7 =C2=B1 19%  interrupts.CPU204.NMI:Non-maskable_interrupts
    271.00 =C2=B1 36%      -4.6%     258.43 =C2=B1 35%     -28.9%     192.5=
7 =C2=B1 19%  interrupts.CPU204.PMI:Performance_monitoring_interrupts
      7.67 =C2=B1 28%     +15.5%       8.86 =C2=B1 58%     -16.1%       6.4=
3 =C2=B1 56%  interrupts.CPU204.RES:Rescheduling_interrupts
     28.00 =C2=B1152%     -63.8%      10.14 =C2=B1 14%     -61.7%      10.7=
1 =C2=B1 14%  interrupts.CPU204.TLB:TLB_shootdowns
      1213            +0.6%       1221            +3.1%       1250 =C2=B1  =
3%  interrupts.CPU205.CAL:Function_call_interrupts
    601996            -5.4%     569223 =C2=B1 14%      -7.1%     559136 =C2=
=B1 18%  interrupts.CPU205.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU205.MCP:Machine_check_polls
    279.83 =C2=B1 36%      -7.9%     257.71 =C2=B1 28%      +0.2%     280.4=
3 =C2=B1 40%  interrupts.CPU205.NMI:Non-maskable_interrupts
    279.83 =C2=B1 36%      -7.9%     257.71 =C2=B1 28%      +0.2%     280.4=
3 =C2=B1 40%  interrupts.CPU205.PMI:Performance_monitoring_interrupts
     17.00 =C2=B1 32%     -21.8%      13.29 =C2=B1 25%     +12.6%      19.1=
4 =C2=B1 47%  interrupts.CPU205.RES:Rescheduling_interrupts
      8.67 =C2=B1 30%      -2.7%       8.43 =C2=B1 39%     +76.4%      15.2=
9 =C2=B1 60%  interrupts.CPU205.TLB:TLB_shootdowns
      1216            +6.6%       1297 =C2=B1 11%      +0.5%       1222    =
    interrupts.CPU206.CAL:Function_call_interrupts
    602130            -3.1%     583599 =C2=B1  7%      -7.2%     559076 =C2=
=B1 18%  interrupts.CPU206.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU206.MCP:Machine_check_polls
    308.00 =C2=B1 33%      +3.1%     317.57 =C2=B1 29%     -27.7%     222.5=
7 =C2=B1 39%  interrupts.CPU206.NMI:Non-maskable_interrupts
    308.00 =C2=B1 33%      +3.1%     317.57 =C2=B1 29%     -27.7%     222.5=
7 =C2=B1 39%  interrupts.CPU206.PMI:Performance_monitoring_interrupts
      7.17 =C2=B1 45%    +155.1%      18.29 =C2=B1112%     +47.5%      10.5=
7 =C2=B1 67%  interrupts.CPU206.RES:Rescheduling_interrupts
      8.83 =C2=B1 17%    +118.3%      19.29 =C2=B1 85%     +22.9%      10.8=
6 =C2=B1 20%  interrupts.CPU206.TLB:TLB_shootdowns
      1222 =C2=B1  3%      +1.9%       1245 =C2=B1  2%      +6.0%       129=
5 =C2=B1 10%  interrupts.CPU207.CAL:Function_call_interrupts
    602160            -3.9%     578917 =C2=B1  9%      -7.1%     559174 =C2=
=B1 18%  interrupts.CPU207.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU207.MCP:Machine_check_polls
    285.17 =C2=B1 28%      +4.1%     296.86 =C2=B1 32%     -16.5%     238.1=
4 =C2=B1 35%  interrupts.CPU207.NMI:Non-maskable_interrupts
    285.17 =C2=B1 28%      +4.1%     296.86 =C2=B1 32%     -16.5%     238.1=
4 =C2=B1 35%  interrupts.CPU207.PMI:Performance_monitoring_interrupts
     17.00 =C2=B1 34%      -7.6%      15.71 =C2=B1 39%     +34.5%      22.8=
6 =C2=B1 75%  interrupts.CPU207.RES:Rescheduling_interrupts
     10.33 =C2=B1 36%     +12.0%      11.57 =C2=B1 43%     +57.6%      16.2=
9 =C2=B1107%  interrupts.CPU207.TLB:TLB_shootdowns
      1392 =C2=B1 27%     -10.2%       1250 =C2=B1  2%     -11.8%       122=
7        interrupts.CPU208.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +5.7e+101%       0.57 =C2=B124=
4%  interrupts.CPU208.IWI:IRQ_work_interrupts
    602015            -1.8%     591324 =C2=B1  4%      -7.1%     558973 =C2=
=B1 18%  interrupts.CPU208.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU208.MCP:Machine_check_polls
    352.33 =C2=B1 70%     -21.4%     277.00 =C2=B1 30%     -39.7%     212.2=
9 =C2=B1 36%  interrupts.CPU208.NMI:Non-maskable_interrupts
    352.33 =C2=B1 70%     -21.4%     277.00 =C2=B1 30%     -39.7%     212.2=
9 =C2=B1 36%  interrupts.CPU208.PMI:Performance_monitoring_interrupts
     23.67 =C2=B1151%     -67.4%       7.71 =C2=B1 35%     -66.2%       8.0=
0 =C2=B1 59%  interrupts.CPU208.RES:Rescheduling_interrupts
     11.00 =C2=B1 18%      +7.8%      11.86 =C2=B1 27%     +61.0%      17.7=
1 =C2=B1120%  interrupts.CPU208.TLB:TLB_shootdowns
      1431 =C2=B1 28%     -12.1%       1257 =C2=B1  3%     -13.4%       123=
9 =C2=B1  2%  interrupts.CPU209.CAL:Function_call_interrupts
    602024            -0.9%     596658 =C2=B1  2%      -7.2%     558874 =C2=
=B1 18%  interrupts.CPU209.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU209.MCP:Machine_check_polls
    218.83 =C2=B1 32%     +22.4%     267.86 =C2=B1 34%     -17.4%     180.7=
1 =C2=B1 14%  interrupts.CPU209.NMI:Non-maskable_interrupts
    218.83 =C2=B1 32%     +22.4%     267.86 =C2=B1 34%     -17.4%     180.7=
1 =C2=B1 14%  interrupts.CPU209.PMI:Performance_monitoring_interrupts
     36.17 =C2=B1125%     -49.8%      18.14 =C2=B1 39%     -62.9%      13.4=
3 =C2=B1 35%  interrupts.CPU209.RES:Rescheduling_interrupts
     11.83 =C2=B1 44%      -2.2%      11.57 =C2=B1 35%     -19.1%       9.5=
7 =C2=B1 35%  interrupts.CPU209.TLB:TLB_shootdowns
      1375 =C2=B1 10%      +4.1%       1431 =C2=B1 13%      -3.9%       132=
1 =C2=B1  4%  interrupts.CPU21.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  interrupts.CPU21.IWI:IRQ_work_interrupts
    602186            -0.6%     598485            -7.1%     559419 =C2=B1 1=
8%  interrupts.CPU21.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU21.MCP:Machine_check_polls
    197.33 =C2=B1 31%     +22.0%     240.71 =C2=B1 34%      +2.6%     202.4=
3 =C2=B1 56%  interrupts.CPU21.NMI:Non-maskable_interrupts
    197.33 =C2=B1 31%     +22.0%     240.71 =C2=B1 34%      +2.6%     202.4=
3 =C2=B1 56%  interrupts.CPU21.PMI:Performance_monitoring_interrupts
     31.33 =C2=B1 30%     +48.6%      46.57 =C2=B1 45%     -23.9%      23.8=
6 =C2=B1 25%  interrupts.CPU21.RES:Rescheduling_interrupts
     23.00 =C2=B1 25%      -3.1%      22.29 =C2=B1 34%      -8.7%      21.0=
0 =C2=B1 34%  interrupts.CPU21.TLB:TLB_shootdowns
      1299 =C2=B1 14%      -5.3%       1230            -6.3%       1217    =
    interrupts.CPU210.CAL:Function_call_interrupts
    601969            -3.0%     584143 =C2=B1  7%      -7.1%     559031 =C2=
=B1 18%  interrupts.CPU210.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU210.MCP:Machine_check_polls
    266.67 =C2=B1 33%      -5.9%     250.86 =C2=B1 31%      -6.1%     250.4=
3 =C2=B1 44%  interrupts.CPU210.NMI:Non-maskable_interrupts
    266.67 =C2=B1 33%      -5.9%     250.86 =C2=B1 31%      -6.1%     250.4=
3 =C2=B1 44%  interrupts.CPU210.PMI:Performance_monitoring_interrupts
     17.67 =C2=B1146%     -41.8%      10.29 =C2=B1 68%     -48.2%       9.1=
4 =C2=B1 34%  interrupts.CPU210.RES:Rescheduling_interrupts
     10.67 =C2=B1 17%     -14.3%       9.14 =C2=B1 30%      -0.9%      10.5=
7 =C2=B1 36%  interrupts.CPU210.TLB:TLB_shootdowns
      1227            +0.4%       1232            +0.5%       1233 =C2=B1  =
2%  interrupts.CPU211.CAL:Function_call_interrupts
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    interrupts.CPU211.IWI:IRQ_work_interrupts
    602088            -2.8%     585270 =C2=B1  6%      -7.1%     559108 =C2=
=B1 18%  interrupts.CPU211.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU211.MCP:Machine_check_polls
    287.00 =C2=B1 31%     +33.7%     383.71 =C2=B1 18%     +30.8%     375.2=
9 =C2=B1 92%  interrupts.CPU211.NMI:Non-maskable_interrupts
    287.00 =C2=B1 31%     +33.7%     383.71 =C2=B1 18%     +30.8%     375.2=
9 =C2=B1 92%  interrupts.CPU211.PMI:Performance_monitoring_interrupts
     17.17 =C2=B1 41%     -10.1%      15.43 =C2=B1 40%     -31.8%      11.7=
1 =C2=B1 23%  interrupts.CPU211.RES:Rescheduling_interrupts
     10.00 =C2=B1 36%     -17.1%       8.29 =C2=B1 29%      -1.4%       9.8=
6 =C2=B1 48%  interrupts.CPU211.TLB:TLB_shootdowns
      1213            +6.3%       1288 =C2=B1 10%      +0.6%       1220    =
    interrupts.CPU212.CAL:Function_call_interrupts
    601428            -2.6%     585952 =C2=B1  6%      -7.0%     559088 =C2=
=B1 18%  interrupts.CPU212.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU212.MCP:Machine_check_polls
    308.33 =C2=B1 35%      -6.1%     289.43 =C2=B1 31%     -17.5%     254.2=
9 =C2=B1 43%  interrupts.CPU212.NMI:Non-maskable_interrupts
    308.33 =C2=B1 35%      -6.1%     289.43 =C2=B1 31%     -17.5%     254.2=
9 =C2=B1 43%  interrupts.CPU212.PMI:Performance_monitoring_interrupts
     11.33 =C2=B1 45%     +32.4%      15.00 =C2=B1137%     -44.5%       6.2=
9 =C2=B1 34%  interrupts.CPU212.RES:Rescheduling_interrupts
      8.17 =C2=B1 42%     +97.7%      16.14 =C2=B1 93%      -2.0%       8.0=
0 =C2=B1 20%  interrupts.CPU212.TLB:TLB_shootdowns
      1285 =C2=B1  7%      -2.6%       1252 =C2=B1  2%      -3.9%       123=
5        interrupts.CPU213.CAL:Function_call_interrupts
    602136            -0.7%     598050            -7.1%     559141 =C2=B1 1=
8%  interrupts.CPU213.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU213.MCP:Machine_check_polls
    287.00 =C2=B1 31%      -5.2%     272.14 =C2=B1 34%     -30.1%     200.7=
1 =C2=B1 36%  interrupts.CPU213.NMI:Non-maskable_interrupts
    287.00 =C2=B1 31%      -5.2%     272.14 =C2=B1 34%     -30.1%     200.7=
1 =C2=B1 36%  interrupts.CPU213.PMI:Performance_monitoring_interrupts
     23.00 =C2=B1 33%     -29.2%      16.29 =C2=B1 25%     -49.1%      11.7=
1 =C2=B1 38%  interrupts.CPU213.RES:Rescheduling_interrupts
     13.00 =C2=B1 29%     -16.5%      10.86 =C2=B1 21%     -31.9%       8.8=
6 =C2=B1 16%  interrupts.CPU213.TLB:TLB_shootdowns
      1228            +0.9%       1238 =C2=B1  2%      +1.1%       1242 =C2=
=B1  2%  interrupts.CPU214.CAL:Function_call_interrupts
      0.67 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU214.IWI:IRQ_work_interrupts
    602089            -2.0%     589936 =C2=B1  5%      -7.2%     559006 =C2=
=B1 18%  interrupts.CPU214.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU214.MCP:Machine_check_polls
    246.67 =C2=B1 27%      -5.9%     232.00 =C2=B1 31%     -15.2%     209.2=
9 =C2=B1 37%  interrupts.CPU214.NMI:Non-maskable_interrupts
    246.67 =C2=B1 27%      -5.9%     232.00 =C2=B1 31%     -15.2%     209.2=
9 =C2=B1 37%  interrupts.CPU214.PMI:Performance_monitoring_interrupts
      7.17 =C2=B1 23%     +41.5%      10.14 =C2=B1 50%     +53.5%      11.0=
0 =C2=B1 59%  interrupts.CPU214.RES:Rescheduling_interrupts
     61.50 =C2=B1176%     -78.6%      13.14 =C2=B1 26%     -79.3%      12.7=
1 =C2=B1 63%  interrupts.CPU214.TLB:TLB_shootdowns
      1219            +9.7%       1336 =C2=B1 16%      +3.8%       1265 =C2=
=B1  4%  interrupts.CPU215.CAL:Function_call_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU215.IWI:IRQ_work_interrupts
    602064            -2.0%     590294 =C2=B1  4%      -7.2%     558958 =C2=
=B1 18%  interrupts.CPU215.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU215.MCP:Machine_check_polls
    295.17 =C2=B1 42%     -20.2%     235.43 =C2=B1 29%     -25.4%     220.2=
9 =C2=B1 37%  interrupts.CPU215.NMI:Non-maskable_interrupts
    295.17 =C2=B1 42%     -20.2%     235.43 =C2=B1 29%     -25.4%     220.2=
9 =C2=B1 37%  interrupts.CPU215.PMI:Performance_monitoring_interrupts
     10.83 =C2=B1 31%    +184.8%      30.86 =C2=B1104%     +79.3%      19.4=
3 =C2=B1 54%  interrupts.CPU215.RES:Rescheduling_interrupts
     11.17 =C2=B1 40%     +40.7%      15.71 =C2=B1 98%     -14.3%       9.5=
7 =C2=B1 31%  interrupts.CPU215.TLB:TLB_shootdowns
      1258 =C2=B1  7%      +0.3%       1261 =C2=B1  4%      -1.1%       124=
4 =C2=B1  2%  interrupts.CPU216.CAL:Function_call_interrupts
    602081            -2.7%     585759 =C2=B1  6%      -7.1%     559084 =C2=
=B1 18%  interrupts.CPU216.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU216.MCP:Machine_check_polls
    330.67 =C2=B1 26%     -23.0%     254.71 =C2=B1 38%     -26.5%     243.0=
0 =C2=B1 42%  interrupts.CPU216.NMI:Non-maskable_interrupts
    330.67 =C2=B1 26%     -23.0%     254.71 =C2=B1 38%     -26.5%     243.0=
0 =C2=B1 42%  interrupts.CPU216.PMI:Performance_monitoring_interrupts
     11.17 =C2=B1 87%      +3.6%      11.57 =C2=B1 42%      -1.5%      11.0=
0 =C2=B1 62%  interrupts.CPU216.RES:Rescheduling_interrupts
     10.00 =C2=B1 22%     +35.7%      13.57 =C2=B1 46%     +28.6%      12.8=
6 =C2=B1 18%  interrupts.CPU216.TLB:TLB_shootdowns
      1447 =C2=B1 34%     -13.6%       1250 =C2=B1  2%     -12.9%       126=
0 =C2=B1  2%  interrupts.CPU217.CAL:Function_call_interrupts
    602179            -2.0%     589935 =C2=B1  5%      -7.1%     559166 =C2=
=B1 18%  interrupts.CPU217.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU217.MCP:Machine_check_polls
    322.33 =C2=B1 30%      -6.6%     301.14 =C2=B1 33%     -22.3%     250.5=
7 =C2=B1 30%  interrupts.CPU217.NMI:Non-maskable_interrupts
    322.33 =C2=B1 30%      -6.6%     301.14 =C2=B1 33%     -22.3%     250.5=
7 =C2=B1 30%  interrupts.CPU217.PMI:Performance_monitoring_interrupts
     15.83 =C2=B1 33%     +14.6%      18.14 =C2=B1 36%     +34.4%      21.2=
9 =C2=B1 28%  interrupts.CPU217.RES:Rescheduling_interrupts
      9.33 =C2=B1 14%      +2.6%       9.57 =C2=B1 30%     +14.8%      10.7=
1 =C2=B1 39%  interrupts.CPU217.TLB:TLB_shootdowns
      1242 =C2=B1  2%      -0.2%       1240            +1.9%       1266 =C2=
=B1  7%  interrupts.CPU218.CAL:Function_call_interrupts
      0.00       +2.9e+101%       0.29 =C2=B1244%    -100.0%       0.00    =
    interrupts.CPU218.IWI:IRQ_work_interrupts
    602035            -0.5%     599228            -7.1%     559100 =C2=B1 1=
8%  interrupts.CPU218.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU218.MCP:Machine_check_polls
    264.33 =C2=B1 32%     -20.0%     211.43 =C2=B1 26%     -14.1%     227.0=
0 =C2=B1 33%  interrupts.CPU218.NMI:Non-maskable_interrupts
    264.33 =C2=B1 32%     -20.0%     211.43 =C2=B1 26%     -14.1%     227.0=
0 =C2=B1 33%  interrupts.CPU218.PMI:Performance_monitoring_interrupts
     11.00 =C2=B1 61%      -2.6%      10.71 =C2=B1 41%      -5.2%      10.4=
3 =C2=B1 80%  interrupts.CPU218.RES:Rescheduling_interrupts
     10.83 =C2=B1 26%      +6.8%      11.57 =C2=B1 30%      +9.5%      11.8=
6 =C2=B1  9%  interrupts.CPU218.TLB:TLB_shootdowns
      1217            +1.5%       1235            +1.8%       1239        i=
nterrupts.CPU219.CAL:Function_call_interrupts
    601775            -0.6%     598264            -7.1%     558996 =C2=B1 1=
8%  interrupts.CPU219.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU219.MCP:Machine_check_polls
    245.00 =C2=B1 32%      -9.7%     221.14 =C2=B1 26%     -21.2%     193.0=
0 =C2=B1 36%  interrupts.CPU219.NMI:Non-maskable_interrupts
    245.00 =C2=B1 32%      -9.7%     221.14 =C2=B1 26%     -21.2%     193.0=
0 =C2=B1 36%  interrupts.CPU219.PMI:Performance_monitoring_interrupts
     14.33 =C2=B1 26%      -7.3%      13.29 =C2=B1 16%      +3.7%      14.8=
6 =C2=B1 34%  interrupts.CPU219.RES:Rescheduling_interrupts
      9.67 =C2=B1 22%      -1.0%       9.57 =C2=B1 23%      +2.0%       9.8=
6 =C2=B1 31%  interrupts.CPU219.TLB:TLB_shootdowns
      1667 =C2=B1 12%      -9.3%       1512 =C2=B1  8%      +8.9%       181=
6 =C2=B1 35%  interrupts.CPU22.CAL:Function_call_interrupts
    602206            -0.8%     597141 =C2=B1  2%      -7.2%     559050 =C2=
=B1 18%  interrupts.CPU22.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU22.MCP:Machine_check_polls
    339.83 =C2=B1 44%     -20.8%     269.00 =C2=B1 31%     -41.6%     198.5=
7 =C2=B1 26%  interrupts.CPU22.NMI:Non-maskable_interrupts
    339.83 =C2=B1 44%     -20.8%     269.00 =C2=B1 31%     -41.6%     198.5=
7 =C2=B1 26%  interrupts.CPU22.PMI:Performance_monitoring_interrupts
     61.50 =C2=B1 47%      -6.6%      57.43 =C2=B1 33%     +43.1%      88.0=
0 =C2=B1 86%  interrupts.CPU22.RES:Rescheduling_interrupts
     54.17 =C2=B1 41%     +13.1%      61.29 =C2=B1 23%      +6.3%      57.5=
7 =C2=B1 24%  interrupts.CPU22.TLB:TLB_shootdowns
      1302 =C2=B1 11%      -1.7%       1280 =C2=B1  7%      -4.8%       124=
0 =C2=B1  2%  interrupts.CPU220.CAL:Function_call_interrupts
    602219            -2.0%     589908 =C2=B1  5%      -7.2%     559009 =C2=
=B1 18%  interrupts.CPU220.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU220.MCP:Machine_check_polls
    231.67 =C2=B1 29%      +5.8%     245.00 =C2=B1 29%      +5.0%     243.1=
4 =C2=B1 41%  interrupts.CPU220.NMI:Non-maskable_interrupts
    231.67 =C2=B1 29%      +5.8%     245.00 =C2=B1 29%      +5.0%     243.1=
4 =C2=B1 41%  interrupts.CPU220.PMI:Performance_monitoring_interrupts
      9.50 =C2=B1 17%     +62.4%      15.43 =C2=B1 69%      +9.8%      10.4=
3 =C2=B1 42%  interrupts.CPU220.RES:Rescheduling_interrupts
     12.17 =C2=B1 23%     +30.3%      15.86 =C2=B1 74%    +342.7%      53.8=
6 =C2=B1190%  interrupts.CPU220.TLB:TLB_shootdowns
      1283 =C2=B1  9%      -6.0%       1206 =C2=B1 14%      -3.4%       123=
9        interrupts.CPU221.CAL:Function_call_interrupts
    602169            -1.7%     592034 =C2=B1  4%      -7.1%     559142 =C2=
=B1 18%  interrupts.CPU221.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU221.MCP:Machine_check_polls
    350.00 =C2=B1 27%     -13.8%     301.71 =C2=B1 34%     -34.8%     228.1=
4 =C2=B1 37%  interrupts.CPU221.NMI:Non-maskable_interrupts
    350.00 =C2=B1 27%     -13.8%     301.71 =C2=B1 34%     -34.8%     228.1=
4 =C2=B1 37%  interrupts.CPU221.PMI:Performance_monitoring_interrupts
     25.00 =C2=B1 39%      -9.7%      22.57 =C2=B1 42%     -28.0%      18.0=
0 =C2=B1 38%  interrupts.CPU221.RES:Rescheduling_interrupts
     13.67 =C2=B1 69%     -11.1%      12.14 =C2=B1 32%     -16.4%      11.4=
3 =C2=B1 24%  interrupts.CPU221.TLB:TLB_shootdowns
      1313 =C2=B1 14%      -1.6%       1292 =C2=B1  6%      +3.1%       135=
4 =C2=B1 20%  interrupts.CPU222.CAL:Function_call_interrupts
    602010            -1.9%     590501 =C2=B1  4%      -7.2%     558901 =C2=
=B1 18%  interrupts.CPU222.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU222.MCP:Machine_check_polls
    291.50 =C2=B1 30%      +7.9%     314.43 =C2=B1 33%     -19.2%     235.5=
7 =C2=B1 35%  interrupts.CPU222.NMI:Non-maskable_interrupts
    291.50 =C2=B1 30%      +7.9%     314.43 =C2=B1 33%     -19.2%     235.5=
7 =C2=B1 35%  interrupts.CPU222.PMI:Performance_monitoring_interrupts
     22.67 =C2=B1105%     -30.0%      15.86 =C2=B1 62%     -32.6%      15.2=
9 =C2=B1116%  interrupts.CPU222.RES:Rescheduling_interrupts
     11.00 =C2=B1 31%      -2.6%      10.71 =C2=B1 40%     +11.7%      12.2=
9 =C2=B1 26%  interrupts.CPU222.TLB:TLB_shootdowns
      1316 =C2=B1 10%      -0.8%       1305 =C2=B1 14%      -5.2%       124=
7 =C2=B1  3%  interrupts.CPU223.CAL:Function_call_interrupts
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    interrupts.CPU223.IWI:IRQ_work_interrupts
    601882            -1.7%     591536 =C2=B1  4%      -7.1%     559098 =C2=
=B1 18%  interrupts.CPU223.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU223.MCP:Machine_check_polls
    289.50 =C2=B1 33%    +110.4%     609.14 =C2=B1133%     -10.6%     258.8=
6 =C2=B1 27%  interrupts.CPU223.NMI:Non-maskable_interrupts
    289.50 =C2=B1 33%    +110.4%     609.14 =C2=B1133%     -10.6%     258.8=
6 =C2=B1 27%  interrupts.CPU223.PMI:Performance_monitoring_interrupts
     21.50 =C2=B1 60%     -53.5%      10.00 =C2=B1 36%     -15.0%      18.2=
9 =C2=B1 39%  interrupts.CPU223.RES:Rescheduling_interrupts
     15.33 =C2=B1 99%     -49.7%       7.71 =C2=B1 29%     -23.6%      11.7=
1 =C2=B1 16%  interrupts.CPU223.TLB:TLB_shootdowns
      1255 =C2=B1  7%      +4.4%       1310 =C2=B1 15%      -0.1%       125=
3        interrupts.CPU224.CAL:Function_call_interrupts
      0.00       +2.9e+101%       0.29 =C2=B1244%    -100.0%       0.00    =
    interrupts.CPU224.IWI:IRQ_work_interrupts
    602080            -3.4%     581759 =C2=B1  8%      -7.1%     559068 =C2=
=B1 18%  interrupts.CPU224.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU224.MCP:Machine_check_polls
    267.50 =C2=B1 32%     +17.2%     313.43 =C2=B1 40%     -29.5%     188.7=
1 =C2=B1 16%  interrupts.CPU224.NMI:Non-maskable_interrupts
    267.50 =C2=B1 32%     +17.2%     313.43 =C2=B1 40%     -29.5%     188.7=
1 =C2=B1 16%  interrupts.CPU224.PMI:Performance_monitoring_interrupts
      9.83 =C2=B1110%     -28.8%       7.00 =C2=B1 79%      +3.1%      10.1=
4 =C2=B1 46%  interrupts.CPU224.RES:Rescheduling_interrupts
      9.83 =C2=B1 23%     +22.0%      12.00 =C2=B1 32%      +1.7%      10.0=
0 =C2=B1 15%  interrupts.CPU224.TLB:TLB_shootdowns
      1235 =C2=B1  2%      +7.1%       1323 =C2=B1 13%      +0.3%       123=
8        interrupts.CPU225.CAL:Function_call_interrupts
    602112            -3.9%     578917 =C2=B1  9%      -7.2%     559016 =C2=
=B1 18%  interrupts.CPU225.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU225.MCP:Machine_check_polls
    315.00 =C2=B1 31%     -22.4%     244.29 =C2=B1 29%     -27.3%     229.0=
0 =C2=B1 34%  interrupts.CPU225.NMI:Non-maskable_interrupts
    315.00 =C2=B1 31%     -22.4%     244.29 =C2=B1 29%     -27.3%     229.0=
0 =C2=B1 34%  interrupts.CPU225.PMI:Performance_monitoring_interrupts
     20.00 =C2=B1 37%     +32.9%      26.57 =C2=B1 99%     -26.4%      14.7=
1 =C2=B1 42%  interrupts.CPU225.RES:Rescheduling_interrupts
      9.67 =C2=B1 41%     +75.9%      17.00 =C2=B1113%     +38.9%      13.4=
3 =C2=B1 33%  interrupts.CPU225.TLB:TLB_shootdowns
      1240 =C2=B1  2%      -1.2%       1225            -1.9%       1217    =
    interrupts.CPU226.CAL:Function_call_interrupts
    602034            -2.8%     585387 =C2=B1  6%      -7.2%     558980 =C2=
=B1 18%  interrupts.CPU226.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU226.MCP:Machine_check_polls
    396.17 =C2=B1 23%     -49.2%     201.14 =C2=B1  4%     -37.6%     247.1=
4 =C2=B1 40%  interrupts.CPU226.NMI:Non-maskable_interrupts
    396.17 =C2=B1 23%     -49.2%     201.14 =C2=B1  4%     -37.6%     247.1=
4 =C2=B1 40%  interrupts.CPU226.PMI:Performance_monitoring_interrupts
     10.33 =C2=B1 36%     -15.7%       8.71 =C2=B1 47%     -39.2%       6.2=
9 =C2=B1 43%  interrupts.CPU226.RES:Rescheduling_interrupts
     11.83 =C2=B1 46%     -10.7%      10.57 =C2=B1 33%      -3.4%      11.4=
3 =C2=B1 30%  interrupts.CPU226.TLB:TLB_shootdowns
      1137 =C2=B1 17%      +9.4%       1243 =C2=B1  2%      +8.5%       123=
3        interrupts.CPU227.CAL:Function_call_interrupts
    602142            -2.4%     587961 =C2=B1  5%      -7.3%     558446 =C2=
=B1 18%  interrupts.CPU227.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU227.MCP:Machine_check_polls
    322.50 =C2=B1 31%     -15.2%     273.43 =C2=B1 34%     -34.3%     212.0=
0 =C2=B1  5%  interrupts.CPU227.NMI:Non-maskable_interrupts
    322.50 =C2=B1 31%     -15.2%     273.43 =C2=B1 34%     -34.3%     212.0=
0 =C2=B1  5%  interrupts.CPU227.PMI:Performance_monitoring_interrupts
     15.17 =C2=B1 38%      +3.6%      15.71 =C2=B1 18%     +11.1%      16.8=
6 =C2=B1 31%  interrupts.CPU227.RES:Rescheduling_interrupts
     12.33 =C2=B1 65%     -25.9%       9.14 =C2=B1 45%     -24.7%       9.2=
9 =C2=B1 22%  interrupts.CPU227.TLB:TLB_shootdowns
      1264 =C2=B1  2%      -2.1%       1238 =C2=B1  2%      +0.3%       126=
8 =C2=B1  5%  interrupts.CPU228.CAL:Function_call_interrupts
    602191            -2.6%     586259 =C2=B1  6%      -7.1%     559173 =C2=
=B1 18%  interrupts.CPU228.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU228.MCP:Machine_check_polls
    295.67 =C2=B1 30%     -21.8%     231.14 =C2=B1 29%     -21.6%     231.8=
6 =C2=B1 27%  interrupts.CPU228.NMI:Non-maskable_interrupts
    295.67 =C2=B1 30%     -21.8%     231.14 =C2=B1 29%     -21.6%     231.8=
6 =C2=B1 27%  interrupts.CPU228.PMI:Performance_monitoring_interrupts
     11.67 =C2=B1 54%      -2.0%      11.43 =C2=B1 54%     +23.7%      14.4=
3 =C2=B1 71%  interrupts.CPU228.RES:Rescheduling_interrupts
     10.83 =C2=B1 15%      +2.9%      11.14 =C2=B1 35%     +62.2%      17.5=
7 =C2=B1 82%  interrupts.CPU228.TLB:TLB_shootdowns
      1244 =C2=B1  2%      -1.0%       1231            +3.3%       1285 =C2=
=B1  6%  interrupts.CPU229.CAL:Function_call_interrupts
    602164            -3.5%     581256 =C2=B1  8%      -7.2%     559104 =C2=
=B1 18%  interrupts.CPU229.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU229.MCP:Machine_check_polls
    319.50 =C2=B1 33%     -15.6%     269.57 =C2=B1 35%     -29.5%     225.2=
9 =C2=B1 31%  interrupts.CPU229.NMI:Non-maskable_interrupts
    319.50 =C2=B1 33%     -15.6%     269.57 =C2=B1 35%     -29.5%     225.2=
9 =C2=B1 31%  interrupts.CPU229.PMI:Performance_monitoring_interrupts
     18.67 =C2=B1 11%     -34.2%      12.29 =C2=B1 47%     +17.9%      22.0=
0 =C2=B1 67%  interrupts.CPU229.RES:Rescheduling_interrupts
      8.67 =C2=B1 29%      +0.5%       8.71 =C2=B1 23%     +26.9%      11.0=
0 =C2=B1 38%  interrupts.CPU229.TLB:TLB_shootdowns
      1365 =C2=B1  7%      -1.0%       1351 =C2=B1  3%      +6.7%       145=
6 =C2=B1 21%  interrupts.CPU23.CAL:Function_call_interrupts
      0.67 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU23.IWI:IRQ_work_interrupts
    602187            -0.8%     597486 =C2=B1  2%      -7.1%     559354 =C2=
=B1 18%  interrupts.CPU23.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU23.MCP:Machine_check_polls
      1203 =C2=B1165%     -81.9%     218.29 =C2=B1 33%     -81.7%     220.0=
0 =C2=B1 46%  interrupts.CPU23.NMI:Non-maskable_interrupts
      1203 =C2=B1165%     -81.9%     218.29 =C2=B1 33%     -81.7%     220.0=
0 =C2=B1 46%  interrupts.CPU23.PMI:Performance_monitoring_interrupts
     25.67 =C2=B1 46%     +24.7%      32.00 =C2=B1 36%     +15.8%      29.7=
1 =C2=B1 99%  interrupts.CPU23.RES:Rescheduling_interrupts
     19.33 =C2=B1 48%     +21.2%      23.43 =C2=B1 29%      +3.4%      20.0=
0 =C2=B1 23%  interrupts.CPU23.TLB:TLB_shootdowns
      1461 =C2=B1 26%     -15.6%       1233           -15.2%       1239    =
    interrupts.CPU230.CAL:Function_call_interrupts
      1.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU230.IWI:IRQ_work_interrupts
    602175            -3.2%     582756 =C2=B1  7%      -7.2%     558995 =C2=
=B1 18%  interrupts.CPU230.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU230.MCP:Machine_check_polls
    342.17 =C2=B1 39%     -32.4%     231.43 =C2=B1 29%     -26.9%     250.0=
0 =C2=B1 42%  interrupts.CPU230.NMI:Non-maskable_interrupts
    342.17 =C2=B1 39%     -32.4%     231.43 =C2=B1 29%     -26.9%     250.0=
0 =C2=B1 42%  interrupts.CPU230.PMI:Performance_monitoring_interrupts
     13.50 =C2=B1 46%     -31.2%       9.29 =C2=B1 77%     -35.4%       8.7=
1 =C2=B1 37%  interrupts.CPU230.RES:Rescheduling_interrupts
     11.17 =C2=B1 40%      -2.8%      10.86 =C2=B1 33%      +4.9%      11.7=
1 =C2=B1 33%  interrupts.CPU230.TLB:TLB_shootdowns
      1245 =C2=B1  2%      -1.1%       1230            -1.0%       1232    =
    interrupts.CPU231.CAL:Function_call_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU231.IWI:IRQ_work_interrupts
    602177            -3.8%     579230 =C2=B1  9%      -7.2%     558819 =C2=
=B1 18%  interrupts.CPU231.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU231.MCP:Machine_check_polls
    368.17 =C2=B1 32%     -42.1%     213.14 =C2=B1  8%     -16.2%     308.4=
3 =C2=B1 35%  interrupts.CPU231.NMI:Non-maskable_interrupts
    368.17 =C2=B1 32%     -42.1%     213.14 =C2=B1  8%     -16.2%     308.4=
3 =C2=B1 35%  interrupts.CPU231.PMI:Performance_monitoring_interrupts
     15.00 =C2=B1 56%      -2.9%      14.57 =C2=B1 64%      +0.0%      15.0=
0 =C2=B1 20%  interrupts.CPU231.RES:Rescheduling_interrupts
     13.67 =C2=B1 61%     -28.9%       9.71 =C2=B1 37%     -24.7%      10.2=
9 =C2=B1 34%  interrupts.CPU231.TLB:TLB_shootdowns
      1242 =C2=B1  2%      -1.2%       1227            -0.9%       1231    =
    interrupts.CPU232.CAL:Function_call_interrupts
    602054            -0.4%     599685            -7.2%     558945 =C2=B1 1=
8%  interrupts.CPU232.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU232.MCP:Machine_check_polls
    278.00 =C2=B1 28%     -28.9%     197.71 =C2=B1 23%     -22.9%     214.2=
9 =C2=B1 43%  interrupts.CPU232.NMI:Non-maskable_interrupts
    278.00 =C2=B1 28%     -28.9%     197.71 =C2=B1 23%     -22.9%     214.2=
9 =C2=B1 43%  interrupts.CPU232.PMI:Performance_monitoring_interrupts
      9.33 =C2=B1 36%     -14.3%       8.00 =C2=B1 79%      -3.6%       9.0=
0 =C2=B1 50%  interrupts.CPU232.RES:Rescheduling_interrupts
      9.83 =C2=B1 34%      -5.6%       9.29 =C2=B1 32%      -4.1%       9.4=
3 =C2=B1 21%  interrupts.CPU232.TLB:TLB_shootdowns
      1277 =C2=B1  8%      -4.0%       1226            -3.1%       1237    =
    interrupts.CPU233.CAL:Function_call_interrupts
      0.50 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU233.IWI:IRQ_work_interrupts
    602031            -0.3%     600036            -7.1%     559053 =C2=B1 1=
8%  interrupts.CPU233.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU233.MCP:Machine_check_polls
    281.17 =C2=B1 28%     -15.8%     236.86 =C2=B1 30%     -26.7%     206.0=
0 =C2=B1 36%  interrupts.CPU233.NMI:Non-maskable_interrupts
    281.17 =C2=B1 28%     -15.8%     236.86 =C2=B1 30%     -26.7%     206.0=
0 =C2=B1 36%  interrupts.CPU233.PMI:Performance_monitoring_interrupts
     18.33 =C2=B1 67%     -36.9%      11.57 =C2=B1 47%     -24.4%      13.8=
6 =C2=B1 34%  interrupts.CPU233.RES:Rescheduling_interrupts
     13.17 =C2=B1101%     -33.8%       8.71 =C2=B1 20%     -31.6%       9.0=
0 =C2=B1 27%  interrupts.CPU233.TLB:TLB_shootdowns
      1226            +3.4%       1268 =C2=B1  4%      +0.9%       1237 =C2=
=B1  2%  interrupts.CPU234.CAL:Function_call_interrupts
    602000            -0.2%     600767            -7.1%     559073 =C2=B1 1=
8%  interrupts.CPU234.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU234.MCP:Machine_check_polls
    197.83 =C2=B1 33%      +8.9%     215.43 =C2=B1 33%      -0.8%     196.2=
9 =C2=B1 29%  interrupts.CPU234.NMI:Non-maskable_interrupts
    197.83 =C2=B1 33%      +8.9%     215.43 =C2=B1 33%      -0.8%     196.2=
9 =C2=B1 29%  interrupts.CPU234.PMI:Performance_monitoring_interrupts
     10.17 =C2=B1 30%     +18.0%      12.00 =C2=B1 42%     -22.7%       7.8=
6 =C2=B1 61%  interrupts.CPU234.RES:Rescheduling_interrupts
     10.83 =C2=B1 28%      +1.5%      11.00 =C2=B1 31%      +8.1%      11.7=
1 =C2=B1 35%  interrupts.CPU234.TLB:TLB_shootdowns
      1228            +3.0%       1265 =C2=B1  8%      +0.6%       1235    =
    interrupts.CPU235.CAL:Function_call_interrupts
    602209            -0.2%     600920            -7.2%     558903 =C2=B1 1=
8%  interrupts.CPU235.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU235.MCP:Machine_check_polls
    286.00 =C2=B1 27%     -12.3%     250.86 =C2=B1 34%     -16.6%     238.4=
3 =C2=B1 36%  interrupts.CPU235.NMI:Non-maskable_interrupts
    286.00 =C2=B1 27%     -12.3%     250.86 =C2=B1 34%     -16.6%     238.4=
3 =C2=B1 36%  interrupts.CPU235.PMI:Performance_monitoring_interrupts
     12.00 =C2=B1 19%     +79.8%      21.57 =C2=B1 65%     +28.6%      15.4=
3 =C2=B1 36%  interrupts.CPU235.RES:Rescheduling_interrupts
     11.17 =C2=B1 52%     -18.1%       9.14 =C2=B1 29%      -0.2%      11.1=
4 =C2=B1 19%  interrupts.CPU235.TLB:TLB_shootdowns
      1230            +6.7%       1312 =C2=B1 15%      +3.0%       1267 =C2=
=B1  2%  interrupts.CPU236.CAL:Function_call_interrupts
    601971            -1.2%     594835 =C2=B1  3%      -7.1%     559025 =C2=
=B1 18%  interrupts.CPU236.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU236.MCP:Machine_check_polls
    247.50 =C2=B1 31%     -21.7%     193.71 =C2=B1 27%     -16.4%     206.8=
6 =C2=B1 41%  interrupts.CPU236.NMI:Non-maskable_interrupts
    247.50 =C2=B1 31%     -21.7%     193.71 =C2=B1 27%     -16.4%     206.8=
6 =C2=B1 41%  interrupts.CPU236.PMI:Performance_monitoring_interrupts
      7.00 =C2=B1 45%    +146.9%      17.29 =C2=B1 82%    +116.3%      15.1=
4 =C2=B1 45%  interrupts.CPU236.RES:Rescheduling_interrupts
      8.83 =C2=B1 12%     +55.3%      13.71 =C2=B1 43%     +76.3%      15.5=
7 =C2=B1 32%  interrupts.CPU236.TLB:TLB_shootdowns
      1217            +4.0%       1266 =C2=B1  2%      +1.1%       1231    =
    interrupts.CPU237.CAL:Function_call_interrupts
    602160            -0.8%     597119 =C2=B1  2%      -7.2%     559020 =C2=
=B1 18%  interrupts.CPU237.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU237.MCP:Machine_check_polls
    235.33 =C2=B1 35%     -22.5%     182.43 =C2=B1 10%     -17.8%     193.4=
3 =C2=B1 40%  interrupts.CPU237.NMI:Non-maskable_interrupts
    235.33 =C2=B1 35%     -22.5%     182.43 =C2=B1 10%     -17.8%     193.4=
3 =C2=B1 40%  interrupts.CPU237.PMI:Performance_monitoring_interrupts
     14.67 =C2=B1 31%     +21.8%      17.86 =C2=B1 32%      +2.3%      15.0=
0 =C2=B1 22%  interrupts.CPU237.RES:Rescheduling_interrupts
      8.67 =C2=B1 22%     +51.6%      13.14 =C2=B1 64%     +35.2%      11.7=
1 =C2=B1 50%  interrupts.CPU237.TLB:TLB_shootdowns
      1237            +0.2%       1240 =C2=B1  2%      +3.9%       1286 =C2=
=B1  6%  interrupts.CPU238.CAL:Function_call_interrupts
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    interrupts.CPU238.IWI:IRQ_work_interrupts
    602017            -1.3%     594274 =C2=B1  3%      -7.1%     558983 =C2=
=B1 18%  interrupts.CPU238.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU238.MCP:Machine_check_polls
    327.83 =C2=B1 27%     +53.0%     501.57 =C2=B1115%     -20.7%     260.0=
0 =C2=B1 33%  interrupts.CPU238.NMI:Non-maskable_interrupts
    327.83 =C2=B1 27%     +53.0%     501.57 =C2=B1115%     -20.7%     260.0=
0 =C2=B1 33%  interrupts.CPU238.PMI:Performance_monitoring_interrupts
      9.67 =C2=B1 57%     -26.1%       7.14 =C2=B1 40%     +65.5%      16.0=
0 =C2=B1 98%  interrupts.CPU238.RES:Rescheduling_interrupts
      9.00 =C2=B1 11%     +15.9%      10.43 =C2=B1 35%    +103.2%      18.2=
9 =C2=B1 76%  interrupts.CPU238.TLB:TLB_shootdowns
      1220            +0.4%       1225            +2.9%       1255 =C2=B1  =
4%  interrupts.CPU239.CAL:Function_call_interrupts
      0.33 =C2=B1223%     -57.1%       0.14 =C2=B1244%    -100.0%       0.0=
0        interrupts.CPU239.IWI:IRQ_work_interrupts
    601910            -0.4%     599605            -7.1%     559147 =C2=B1 1=
8%  interrupts.CPU239.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU239.MCP:Machine_check_polls
    234.67 =C2=B1 37%     +35.8%     318.57 =C2=B1 52%      -1.4%     231.2=
9 =C2=B1 33%  interrupts.CPU239.NMI:Non-maskable_interrupts
    234.67 =C2=B1 37%     +35.8%     318.57 =C2=B1 52%      -1.4%     231.2=
9 =C2=B1 33%  interrupts.CPU239.PMI:Performance_monitoring_interrupts
     12.67 =C2=B1 32%      +0.4%      12.71 =C2=B1 36%      +1.5%      12.8=
6 =C2=B1 65%  interrupts.CPU239.RES:Rescheduling_interrupts
      7.17 =C2=B1 14%     +41.5%      10.14 =C2=B1 35%     +79.4%      12.8=
6 =C2=B1 43%  interrupts.CPU239.TLB:TLB_shootdowns
      2238 =C2=B1 63%     -26.9%       1636 =C2=B1  8%     -17.8%       183=
9 =C2=B1 23%  interrupts.CPU24.CAL:Function_call_interrupts
    602190            -0.3%     600638            -7.1%     559194 =C2=B1 1=
8%  interrupts.CPU24.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU24.MCP:Machine_check_polls
    248.83 =C2=B1 34%      -6.0%     234.00 =C2=B1 31%     -10.6%     222.5=
7 =C2=B1 38%  interrupts.CPU24.NMI:Non-maskable_interrupts
    248.83 =C2=B1 34%      -6.0%     234.00 =C2=B1 31%     -10.6%     222.5=
7 =C2=B1 38%  interrupts.CPU24.PMI:Performance_monitoring_interrupts
    115.00 =C2=B1119%     -42.5%      66.14 =C2=B1 34%     -22.0%      89.7=
1 =C2=B1 58%  interrupts.CPU24.RES:Rescheduling_interrupts
     59.17 =C2=B1 40%      +9.4%      64.71 =C2=B1 15%     +18.3%      70.0=
0 =C2=B1 16%  interrupts.CPU24.TLB:TLB_shootdowns
      1244 =C2=B1  2%      -0.3%       1240 =C2=B1  3%      -2.1%       121=
8        interrupts.CPU240.CAL:Function_call_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU240.IWI:IRQ_work_interrupts
    602047            -0.9%     596503 =C2=B1  2%      -7.1%     559017 =C2=
=B1 18%  interrupts.CPU240.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU240.MCP:Machine_check_polls
    261.67 =C2=B1 31%      -7.7%     241.43 =C2=B1 32%      -5.6%     247.1=
4 =C2=B1 31%  interrupts.CPU240.NMI:Non-maskable_interrupts
    261.67 =C2=B1 31%      -7.7%     241.43 =C2=B1 32%      -5.6%     247.1=
4 =C2=B1 31%  interrupts.CPU240.PMI:Performance_monitoring_interrupts
     10.67 =C2=B1 30%      +9.8%      11.71 =C2=B1 63%     -34.4%       7.0=
0 =C2=B1 15%  interrupts.CPU240.RES:Rescheduling_interrupts
      9.00 =C2=B1 20%     +25.4%      11.29 =C2=B1 43%    +476.2%      51.8=
6 =C2=B1197%  interrupts.CPU240.TLB:TLB_shootdowns
      1218            +0.4%       1223            +1.7%       1238        i=
nterrupts.CPU241.CAL:Function_call_interrupts
    602128            -0.9%     596612 =C2=B1  2%      -7.1%     559104 =C2=
=B1 18%  interrupts.CPU241.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU241.MCP:Machine_check_polls
    262.00 =C2=B1 31%     -20.2%     209.14 =C2=B1 29%      +3.5%     271.1=
4 =C2=B1 32%  interrupts.CPU241.NMI:Non-maskable_interrupts
    262.00 =C2=B1 31%     -20.2%     209.14 =C2=B1 29%      +3.5%     271.1=
4 =C2=B1 32%  interrupts.CPU241.PMI:Performance_monitoring_interrupts
     11.50 =C2=B1 25%     +23.0%      14.14 =C2=B1 44%     +52.8%      17.5=
7 =C2=B1 31%  interrupts.CPU241.RES:Rescheduling_interrupts
      8.33 =C2=B1 22%     +38.9%      11.57 =C2=B1 40%     +21.7%      10.1=
4 =C2=B1 29%  interrupts.CPU241.TLB:TLB_shootdowns
      1223            +0.3%       1227            +0.2%       1225        i=
nterrupts.CPU242.CAL:Function_call_interrupts
    602015            -1.0%     596254 =C2=B1  2%      -7.1%     558986 =C2=
=B1 18%  interrupts.CPU242.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU242.MCP:Machine_check_polls
    266.50 =C2=B1 27%     -36.4%     169.43 =C2=B1  2%     -16.1%     223.7=
1 =C2=B1 31%  interrupts.CPU242.NMI:Non-maskable_interrupts
    266.50 =C2=B1 27%     -36.4%     169.43 =C2=B1  2%     -16.1%     223.7=
1 =C2=B1 31%  interrupts.CPU242.PMI:Performance_monitoring_interrupts
      8.33 =C2=B1 34%     -14.3%       7.14 =C2=B1 42%     -21.1%       6.5=
7 =C2=B1 31%  interrupts.CPU242.RES:Rescheduling_interrupts
      8.33 =C2=B1 21%     +42.3%      11.86 =C2=B1 24%     +18.3%       9.8=
6 =C2=B1 17%  interrupts.CPU242.TLB:TLB_shootdowns
      1258 =C2=B1  7%      -2.3%       1229            -1.3%       1242 =C2=
=B1  2%  interrupts.CPU243.CAL:Function_call_interrupts
    602040            -1.1%     595536 =C2=B1  2%      -7.1%     559121 =C2=
=B1 18%  interrupts.CPU243.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU243.MCP:Machine_check_polls
    284.33 =C2=B1 29%     -27.8%     205.43 =C2=B1 29%     -11.5%     251.5=
7 =C2=B1 32%  interrupts.CPU243.NMI:Non-maskable_interrupts
    284.33 =C2=B1 29%     -27.8%     205.43 =C2=B1 29%     -11.5%     251.5=
7 =C2=B1 32%  interrupts.CPU243.PMI:Performance_monitoring_interrupts
     19.83 =C2=B1 84%     -45.3%      10.86 =C2=B1 40%     -23.6%      15.1=
4 =C2=B1 37%  interrupts.CPU243.RES:Rescheduling_interrupts
     16.00 =C2=B1106%     -32.1%      10.86 =C2=B1 56%     -26.8%      11.7=
1 =C2=B1 15%  interrupts.CPU243.TLB:TLB_shootdowns
      1258 =C2=B1  2%      -1.4%       1240 =C2=B1  2%      -0.8%       124=
8 =C2=B1  3%  interrupts.CPU244.CAL:Function_call_interrupts
      0.00       +5.7e+101%       0.57 =C2=B1244%    -100.0%       0.00    =
    interrupts.CPU244.IWI:IRQ_work_interrupts
    601973            -0.4%     599266            -7.1%     558966 =C2=B1 1=
8%  interrupts.CPU244.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU244.MCP:Machine_check_polls
    234.33 =C2=B1 34%     +14.5%     268.43 =C2=B1 29%     +11.4%     261.0=
0 =C2=B1 32%  interrupts.CPU244.NMI:Non-maskable_interrupts
    234.33 =C2=B1 34%     +14.5%     268.43 =C2=B1 29%     +11.4%     261.0=
0 =C2=B1 32%  interrupts.CPU244.PMI:Performance_monitoring_interrupts
     13.83 =C2=B1 88%     -27.7%      10.00 =C2=B1 52%     -31.8%       9.4=
3 =C2=B1 72%  interrupts.CPU244.RES:Rescheduling_interrupts
     13.17 =C2=B1 15%     -14.3%      11.29 =C2=B1 29%      -2.4%      12.8=
6 =C2=B1 35%  interrupts.CPU244.TLB:TLB_shootdowns
      1253 =C2=B1  4%      +1.3%       1269 =C2=B1  8%      -1.5%       123=
3        interrupts.CPU245.CAL:Function_call_interrupts
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    interrupts.CPU245.IWI:IRQ_work_interrupts
    601916            -0.7%     597826            -7.1%     558980 =C2=B1 1=
8%  interrupts.CPU245.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU245.MCP:Machine_check_polls
    262.33 =C2=B1 34%     +11.7%     293.00 =C2=B1 31%     +17.2%     307.4=
3 =C2=B1 33%  interrupts.CPU245.NMI:Non-maskable_interrupts
    262.33 =C2=B1 34%     +11.7%     293.00 =C2=B1 31%     +17.2%     307.4=
3 =C2=B1 33%  interrupts.CPU245.PMI:Performance_monitoring_interrupts
     17.67 =C2=B1 45%      -7.0%      16.43 =C2=B1 84%      -8.6%      16.1=
4 =C2=B1 41%  interrupts.CPU245.RES:Rescheduling_interrupts
     12.67 =C2=B1 52%     -16.5%      10.57 =C2=B1 48%     -21.1%      10.0=
0 =C2=B1 30%  interrupts.CPU245.TLB:TLB_shootdowns
      1262 =C2=B1  4%      +5.3%       1329 =C2=B1 16%      -2.7%       122=
7 =C2=B1  2%  interrupts.CPU246.CAL:Function_call_interrupts
    602062            -0.5%     599070            -7.1%     559217 =C2=B1 1=
8%  interrupts.CPU246.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU246.MCP:Machine_check_polls
    231.50 =C2=B1 37%      -0.9%     229.43 =C2=B1 36%      +8.6%     251.4=
3 =C2=B1 38%  interrupts.CPU246.NMI:Non-maskable_interrupts
    231.50 =C2=B1 37%      -0.9%     229.43 =C2=B1 36%      +8.6%     251.4=
3 =C2=B1 38%  interrupts.CPU246.PMI:Performance_monitoring_interrupts
     12.67 =C2=B1 58%      -6.4%      11.86 =C2=B1 60%     -49.2%       6.4=
3 =C2=B1 53%  interrupts.CPU246.RES:Rescheduling_interrupts
     11.67 =C2=B1 31%      +2.9%      12.00 =C2=B1 37%      -6.9%      10.8=
6 =C2=B1 15%  interrupts.CPU246.TLB:TLB_shootdowns
      1153 =C2=B1 17%      +9.2%       1259 =C2=B1  4%      +6.6%       122=
8        interrupts.CPU247.CAL:Function_call_interrupts
    602054            -0.4%     599874            -7.1%     559235 =C2=B1 1=
8%  interrupts.CPU247.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU247.MCP:Machine_check_polls
    322.50 =C2=B1 27%     -23.3%     247.43 =C2=B1 33%      -0.6%     320.4=
3 =C2=B1 27%  interrupts.CPU247.NMI:Non-maskable_interrupts
    322.50 =C2=B1 27%     -23.3%     247.43 =C2=B1 33%      -0.6%     320.4=
3 =C2=B1 27%  interrupts.CPU247.PMI:Performance_monitoring_interrupts
     19.50 =C2=B1 18%      -9.9%      17.57 =C2=B1 33%     -30.4%      13.5=
7 =C2=B1 31%  interrupts.CPU247.RES:Rescheduling_interrupts
      8.50 =C2=B1 20%     +61.3%      13.71 =C2=B1 57%     +14.3%       9.7=
1 =C2=B1 37%  interrupts.CPU247.TLB:TLB_shootdowns
      1237            +0.8%       1247 =C2=B1  2%      +0.1%       1238 =C2=
=B1  3%  interrupts.CPU248.CAL:Function_call_interrupts
    602017            -1.0%     596213 =C2=B1  2%      -7.1%     558996 =C2=
=B1 18%  interrupts.CPU248.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU248.MCP:Machine_check_polls
    229.33 =C2=B1 32%     -17.5%     189.14 =C2=B1 32%      +0.5%     230.5=
7 =C2=B1 40%  interrupts.CPU248.NMI:Non-maskable_interrupts
    229.33 =C2=B1 32%     -17.5%     189.14 =C2=B1 32%      +0.5%     230.5=
7 =C2=B1 40%  interrupts.CPU248.PMI:Performance_monitoring_interrupts
      7.33 =C2=B1 52%     +61.7%      11.86 =C2=B1 39%     +51.9%      11.1=
4 =C2=B1 54%  interrupts.CPU248.RES:Rescheduling_interrupts
      9.67 =C2=B1 25%     +33.0%      12.86 =C2=B1 27%    +105.4%      19.8=
6 =C2=B1105%  interrupts.CPU248.TLB:TLB_shootdowns
      1216            +1.3%       1232            -4.4%       1162 =C2=B1 1=
5%  interrupts.CPU249.CAL:Function_call_interrupts
    602092            -0.9%     596465 =C2=B1  2%      -7.2%     558827 =C2=
=B1 18%  interrupts.CPU249.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU249.MCP:Machine_check_polls
    232.67 =C2=B1 33%     +10.9%     258.00 =C2=B1 33%     +17.6%     273.7=
1 =C2=B1 36%  interrupts.CPU249.NMI:Non-maskable_interrupts
    232.67 =C2=B1 33%     +10.9%     258.00 =C2=B1 33%     +17.6%     273.7=
1 =C2=B1 36%  interrupts.CPU249.PMI:Performance_monitoring_interrupts
     14.33 =C2=B1 28%      -8.3%      13.14 =C2=B1 28%      +3.7%      14.8=
6 =C2=B1 23%  interrupts.CPU249.RES:Rescheduling_interrupts
      8.50 =C2=B1 20%     +36.1%      11.57 =C2=B1 32%     +10.9%       9.4=
3 =C2=B1 33%  interrupts.CPU249.TLB:TLB_shootdowns
      1527 =C2=B1 23%     -12.5%       1336 =C2=B1  4%     -10.3%       136=
9 =C2=B1  9%  interrupts.CPU25.CAL:Function_call_interrupts
    602317            -0.4%     599663            -7.1%     559256 =C2=B1 1=
8%  interrupts.CPU25.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU25.MCP:Machine_check_polls
    226.33 =C2=B1 39%     -12.0%     199.29 =C2=B1 26%      +3.9%     235.1=
4 =C2=B1 31%  interrupts.CPU25.NMI:Non-maskable_interrupts
    226.33 =C2=B1 39%     -12.0%     199.29 =C2=B1 26%      +3.9%     235.1=
4 =C2=B1 31%  interrupts.CPU25.PMI:Performance_monitoring_interrupts
     46.83 =C2=B1 81%     -50.0%      23.43 =C2=B1 37%     -42.7%      26.8=
6 =C2=B1 46%  interrupts.CPU25.RES:Rescheduling_interrupts
     20.67 =C2=B1 30%      +4.4%      21.57 =C2=B1 12%     +12.7%      23.2=
9 =C2=B1 15%  interrupts.CPU25.TLB:TLB_shootdowns
      1224            +3.1%       1261 =C2=B1  4%      +1.9%       1247 =C2=
=B1  2%  interrupts.CPU250.CAL:Function_call_interrupts
    601980            -0.9%     596475 =C2=B1  2%      -7.1%     558998 =C2=
=B1 18%  interrupts.CPU250.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU250.MCP:Machine_check_polls
    173.17 =C2=B1  2%     +39.0%     240.71 =C2=B1 34%     +33.1%     230.4=
3 =C2=B1 39%  interrupts.CPU250.NMI:Non-maskable_interrupts
    173.17 =C2=B1  2%     +39.0%     240.71 =C2=B1 34%     +33.1%     230.4=
3 =C2=B1 39%  interrupts.CPU250.PMI:Performance_monitoring_interrupts
      7.00 =C2=B1 11%     +57.1%      11.00 =C2=B1 85%     +34.7%       9.4=
3 =C2=B1 50%  interrupts.CPU250.RES:Rescheduling_interrupts
     10.50 =C2=B1 36%     +34.7%      14.14 =C2=B1 58%     +26.5%      13.2=
9 =C2=B1 30%  interrupts.CPU250.TLB:TLB_shootdowns
      1221            +3.7%       1267 =C2=B1  6%      +1.0%       1233    =
    interrupts.CPU251.CAL:Function_call_interrupts
    601952            -0.9%     596412 =C2=B1  2%      -7.1%     559115 =C2=
=B1 18%  interrupts.CPU251.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU251.MCP:Machine_check_polls
    272.50 =C2=B1 34%     -12.0%     239.71 =C2=B1 42%      -8.8%     248.5=
7 =C2=B1 39%  interrupts.CPU251.NMI:Non-maskable_interrupts
    272.50 =C2=B1 34%     -12.0%     239.71 =C2=B1 42%      -8.8%     248.5=
7 =C2=B1 39%  interrupts.CPU251.PMI:Performance_monitoring_interrupts
     14.83 =C2=B1 23%      -0.8%      14.71 =C2=B1 58%     -10.4%      13.2=
9 =C2=B1 25%  interrupts.CPU251.RES:Rescheduling_interrupts
     12.00 =C2=B1 65%    +348.8%      53.86 =C2=B1189%     +14.3%      13.7=
1 =C2=B1 40%  interrupts.CPU251.TLB:TLB_shootdowns
      1220            -0.1%       1218            +3.7%       1265 =C2=B1 1=
0%  interrupts.CPU252.CAL:Function_call_interrupts
    602062            -0.4%     599477            -7.2%     558818 =C2=B1 1=
8%  interrupts.CPU252.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU252.MCP:Machine_check_polls
    285.83 =C2=B1 30%     -29.5%     201.57 =C2=B1 31%     -23.8%     217.8=
6 =C2=B1 41%  interrupts.CPU252.NMI:Non-maskable_interrupts
    285.83 =C2=B1 30%     -29.5%     201.57 =C2=B1 31%     -23.8%     217.8=
6 =C2=B1 41%  interrupts.CPU252.PMI:Performance_monitoring_interrupts
     11.33 =C2=B1 63%     -28.2%       8.14 =C2=B1 41%      +0.8%      11.4=
3 =C2=B1134%  interrupts.CPU252.RES:Rescheduling_interrupts
      7.67 =C2=B1 16%     +47.2%      11.29 =C2=B1 13%     +32.3%      10.1=
4 =C2=B1 19%  interrupts.CPU252.TLB:TLB_shootdowns
      1252 =C2=B1  5%      -1.7%       1230            -1.1%       1237    =
    interrupts.CPU253.CAL:Function_call_interrupts
    602075            -0.6%     598412            -7.2%     558950 =C2=B1 1=
8%  interrupts.CPU253.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU253.MCP:Machine_check_polls
    262.00 =C2=B1 34%      +2.1%     267.57 =C2=B1 32%     +12.8%     295.5=
7 =C2=B1 35%  interrupts.CPU253.NMI:Non-maskable_interrupts
    262.00 =C2=B1 34%      +2.1%     267.57 =C2=B1 32%     +12.8%     295.5=
7 =C2=B1 35%  interrupts.CPU253.PMI:Performance_monitoring_interrupts
     15.83 =C2=B1 33%      +2.9%      16.29 =C2=B1 26%     +13.7%      18.0=
0 =C2=B1 19%  interrupts.CPU253.RES:Rescheduling_interrupts
     12.33 =C2=B1 50%     -21.2%       9.71 =C2=B1 42%     -13.1%      10.7=
1 =C2=B1 26%  interrupts.CPU253.TLB:TLB_shootdowns
      1221            +0.3%       1224            +4.3%       1273 =C2=B1  =
7%  interrupts.CPU254.CAL:Function_call_interrupts
    602098            -0.5%     599214            -7.2%     558962 =C2=B1 1=
8%  interrupts.CPU254.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU254.MCP:Machine_check_polls
    235.50 =C2=B1 35%      +7.4%     252.86 =C2=B1 35%     +27.8%     301.0=
0 =C2=B1 31%  interrupts.CPU254.NMI:Non-maskable_interrupts
    235.50 =C2=B1 35%      +7.4%     252.86 =C2=B1 35%     +27.8%     301.0=
0 =C2=B1 31%  interrupts.CPU254.PMI:Performance_monitoring_interrupts
     10.50 =C2=B1 45%     -36.1%       6.71 =C2=B1 52%     +38.8%      14.5=
7 =C2=B1 96%  interrupts.CPU254.RES:Rescheduling_interrupts
      9.67 =C2=B1 19%     +12.3%      10.86 =C2=B1 50%     +33.0%      12.8=
6 =C2=B1 44%  interrupts.CPU254.TLB:TLB_shootdowns
      1191            +1.9%       1214 =C2=B1  2%      +6.8%       1272 =C2=
=B1 15%  interrupts.CPU255.CAL:Function_call_interrupts
      0.00       +2.9e+101%       0.29 =C2=B1244%    -100.0%       0.00    =
    interrupts.CPU255.IWI:IRQ_work_interrupts
    602105            -0.4%     599460            -7.2%     559016 =C2=B1 1=
8%  interrupts.CPU255.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU255.MCP:Machine_check_polls
    619.33 =C2=B1 30%     +24.6%     771.57 =C2=B1 49%      -0.8%     614.4=
3 =C2=B1 71%  interrupts.CPU255.NMI:Non-maskable_interrupts
    619.33 =C2=B1 30%     +24.6%     771.57 =C2=B1 49%      -0.8%     614.4=
3 =C2=B1 71%  interrupts.CPU255.PMI:Performance_monitoring_interrupts
     11.50 =C2=B1 28%      +4.3%      12.00 =C2=B1 63%     +70.2%      19.5=
7 =C2=B1 96%  interrupts.CPU255.RES:Rescheduling_interrupts
    146.00 =C2=B1 84%     +45.0%     211.71 =C2=B1 68%     +11.4%     162.7=
1 =C2=B1 98%  interrupts.CPU255.TLB:TLB_shootdowns
      1794 =C2=B1 11%     -15.8%       1510 =C2=B1  8%      -8.4%       164=
4 =C2=B1 12%  interrupts.CPU26.CAL:Function_call_interrupts
    602211            -0.7%     597940            -7.2%     559079 =C2=B1 1=
8%  interrupts.CPU26.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU26.MCP:Machine_check_polls
    238.50 =C2=B1 36%     +11.6%     266.14 =C2=B1 28%     -11.2%     211.7=
1 =C2=B1 31%  interrupts.CPU26.NMI:Non-maskable_interrupts
    238.50 =C2=B1 36%     +11.6%     266.14 =C2=B1 28%     -11.2%     211.7=
1 =C2=B1 31%  interrupts.CPU26.PMI:Performance_monitoring_interrupts
     74.83 =C2=B1 42%     -28.0%      53.86 =C2=B1 43%     -12.4%      65.5=
7 =C2=B1 46%  interrupts.CPU26.RES:Rescheduling_interrupts
     69.67 =C2=B1  8%      -9.0%      63.43 =C2=B1 37%     -16.3%      58.2=
9 =C2=B1 29%  interrupts.CPU26.TLB:TLB_shootdowns
      1351 =C2=B1  4%      -0.4%       1346 =C2=B1  5%      +0.2%       135=
4 =C2=B1  9%  interrupts.CPU27.CAL:Function_call_interrupts
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    interrupts.CPU27.IWI:IRQ_work_interrupts
    602331            -0.3%     600816            -7.1%     559428 =C2=B1 1=
8%  interrupts.CPU27.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU27.MCP:Machine_check_polls
    285.67 =C2=B1 34%     +18.0%     337.14 =C2=B1 51%     -13.3%     247.7=
1 =C2=B1 40%  interrupts.CPU27.NMI:Non-maskable_interrupts
    285.67 =C2=B1 34%     +18.0%     337.14 =C2=B1 51%     -13.3%     247.7=
1 =C2=B1 40%  interrupts.CPU27.PMI:Performance_monitoring_interrupts
     24.33 =C2=B1 32%     +16.8%      28.43 =C2=B1 29%     +11.0%      27.0=
0 =C2=B1 68%  interrupts.CPU27.RES:Rescheduling_interrupts
     21.83 =C2=B1 26%      -9.7%      19.71 =C2=B1 34%    +298.5%      87.0=
0 =C2=B1185%  interrupts.CPU27.TLB:TLB_shootdowns
      1668 =C2=B1  7%      -5.4%       1579 =C2=B1 13%      -5.1%       158=
3 =C2=B1  9%  interrupts.CPU28.CAL:Function_call_interrupts
      0.00       +2.9e+101%       0.29 =C2=B1244%    -100.0%       0.00    =
    interrupts.CPU28.IWI:IRQ_work_interrupts
    602236            -0.8%     597167 =C2=B1  2%      -7.1%     559286 =C2=
=B1 18%  interrupts.CPU28.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU28.MCP:Machine_check_polls
    258.50 =C2=B1 32%     +99.5%     515.71 =C2=B1133%      -9.0%     235.2=
9 =C2=B1 40%  interrupts.CPU28.NMI:Non-maskable_interrupts
    258.50 =C2=B1 32%     +99.5%     515.71 =C2=B1133%      -9.0%     235.2=
9 =C2=B1 40%  interrupts.CPU28.PMI:Performance_monitoring_interrupts
     66.67 =C2=B1 24%      +3.5%      69.00 =C2=B1 47%      +4.6%      69.7=
1 =C2=B1 28%  interrupts.CPU28.RES:Rescheduling_interrupts
     67.00 =C2=B1  5%     -20.9%      53.00 =C2=B1 35%      +2.6%      68.7=
1 =C2=B1 11%  interrupts.CPU28.TLB:TLB_shootdowns
      1367 =C2=B1  8%      +3.6%       1417 =C2=B1 11%      -0.3%       136=
4 =C2=B1  6%  interrupts.CPU29.CAL:Function_call_interrupts
    602257            -0.9%     597101 =C2=B1  2%      -7.1%     559259 =C2=
=B1 18%  interrupts.CPU29.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU29.MCP:Machine_check_polls
    224.00 =C2=B1 35%     +20.5%     270.00 =C2=B1 29%     +13.7%     254.7=
1 =C2=B1 34%  interrupts.CPU29.NMI:Non-maskable_interrupts
    224.00 =C2=B1 35%     +20.5%     270.00 =C2=B1 29%     +13.7%     254.7=
1 =C2=B1 34%  interrupts.CPU29.PMI:Performance_monitoring_interrupts
     30.50 =C2=B1 38%     +21.3%      37.00 =C2=B1 20%     -11.0%      27.1=
4 =C2=B1 26%  interrupts.CPU29.RES:Rescheduling_interrupts
     23.50 =C2=B1 26%      -5.2%      22.29 =C2=B1 44%      +2.7%      24.1=
4 =C2=B1 16%  interrupts.CPU29.TLB:TLB_shootdowns
      1358 =C2=B1  3%      +4.8%       1424 =C2=B1 10%     +11.9%       152=
1 =C2=B1 16%  interrupts.CPU3.CAL:Function_call_interrupts
    602355            -0.1%     601478            -7.2%     559286 =C2=B1 1=
8%  interrupts.CPU3.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU3.MCP:Machine_check_polls
    185.17 =C2=B1 29%     +28.1%     237.14 =C2=B1 34%    +137.8%     440.2=
9 =C2=B1118%  interrupts.CPU3.NMI:Non-maskable_interrupts
    185.17 =C2=B1 29%     +28.1%     237.14 =C2=B1 34%    +137.8%     440.2=
9 =C2=B1118%  interrupts.CPU3.PMI:Performance_monitoring_interrupts
     35.17 =C2=B1 33%     -30.9%      24.29 =C2=B1 62%     -40.3%      21.0=
0 =C2=B1 40%  interrupts.CPU3.RES:Rescheduling_interrupts
     23.33 =C2=B1 11%      -4.5%      22.29 =C2=B1 32%     -18.0%      19.1=
4 =C2=B1 55%  interrupts.CPU3.TLB:TLB_shootdowns
      2017 =C2=B1 59%     -26.2%       1489 =C2=B1 10%      +5.6%       213=
1 =C2=B1 57%  interrupts.CPU30.CAL:Function_call_interrupts
    602283            -0.6%     598846            -7.2%     558831 =C2=B1 1=
8%  interrupts.CPU30.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU30.MCP:Machine_check_polls
    258.33 =C2=B1 27%     -14.7%     220.29 =C2=B1 33%      +1.6%     262.4=
3 =C2=B1 28%  interrupts.CPU30.NMI:Non-maskable_interrupts
    258.33 =C2=B1 27%     -14.7%     220.29 =C2=B1 33%      +1.6%     262.4=
3 =C2=B1 28%  interrupts.CPU30.PMI:Performance_monitoring_interrupts
     91.50 =C2=B1118%     -43.8%      51.43 =C2=B1 58%      +2.7%      94.0=
0 =C2=B1 78%  interrupts.CPU30.RES:Rescheduling_interrupts
     54.83 =C2=B1 45%      -9.6%      49.57 =C2=B1 54%     +21.1%      66.4=
3 =C2=B1 18%  interrupts.CPU30.TLB:TLB_shootdowns
      1560 =C2=B1 34%     -16.2%       1306 =C2=B1  5%      -3.5%       150=
5 =C2=B1 36%  interrupts.CPU31.CAL:Function_call_interrupts
    602439            -0.5%     599288            -7.2%     559074 =C2=B1 1=
8%  interrupts.CPU31.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU31.MCP:Machine_check_polls
    266.83 =C2=B1 30%     +37.0%     365.43 =C2=B1 93%     -17.8%     219.2=
9 =C2=B1 34%  interrupts.CPU31.NMI:Non-maskable_interrupts
    266.83 =C2=B1 30%     +37.0%     365.43 =C2=B1 93%     -17.8%     219.2=
9 =C2=B1 34%  interrupts.CPU31.PMI:Performance_monitoring_interrupts
     39.17 =C2=B1102%     -47.5%      20.57 =C2=B1 54%     -31.4%      26.8=
6 =C2=B1105%  interrupts.CPU31.RES:Rescheduling_interrupts
     18.50 =C2=B1 37%      -8.1%      17.00 =C2=B1 46%     +17.4%      21.7=
1 =C2=B1 14%  interrupts.CPU31.TLB:TLB_shootdowns
      2385 =C2=B1 41%     -27.5%       1730 =C2=B1 18%     -30.1%       166=
8 =C2=B1 15%  interrupts.CPU32.CAL:Function_call_interrupts
      0.00       +2.9e+101%       0.29 =C2=B1244%    -100.0%       0.00    =
    interrupts.CPU32.IWI:IRQ_work_interrupts
    602327            -2.4%     588086 =C2=B1  5%      -7.2%     558772 =C2=
=B1 18%  interrupts.CPU32.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU32.MCP:Machine_check_polls
    263.17 =C2=B1 30%    +100.3%     527.00 =C2=B1123%      +1.2%     266.2=
9 =C2=B1 48%  interrupts.CPU32.NMI:Non-maskable_interrupts
    263.17 =C2=B1 30%    +100.3%     527.00 =C2=B1123%      +1.2%     266.2=
9 =C2=B1 48%  interrupts.CPU32.PMI:Performance_monitoring_interrupts
    146.17 =C2=B1 73%     -60.0%      58.43 =C2=B1 28%     -60.7%      57.4=
3 =C2=B1 43%  interrupts.CPU32.RES:Rescheduling_interrupts
     73.17 =C2=B1  9%     -25.6%      54.43 =C2=B1 23%     -23.7%      55.8=
6 =C2=B1 39%  interrupts.CPU32.TLB:TLB_shootdowns
      2081 =C2=B1 49%     -35.1%       1351 =C2=B1  4%     -34.1%       137=
1 =C2=B1  7%  interrupts.CPU33.CAL:Function_call_interrupts
    602520            -2.7%     586156 =C2=B1  6%      -7.2%     558925 =C2=
=B1 18%  interrupts.CPU33.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU33.MCP:Machine_check_polls
    314.33 =C2=B1 27%     -14.0%     270.29 =C2=B1 31%     -38.2%     194.1=
4 =C2=B1 40%  interrupts.CPU33.NMI:Non-maskable_interrupts
    314.33 =C2=B1 27%     -14.0%     270.29 =C2=B1 31%     -38.2%     194.1=
4 =C2=B1 40%  interrupts.CPU33.PMI:Performance_monitoring_interrupts
     92.33 =C2=B1 85%     -75.2%      22.86 =C2=B1 34%     -68.9%      28.7=
1 =C2=B1 49%  interrupts.CPU33.RES:Rescheduling_interrupts
     21.33 =C2=B1 19%      +1.8%      21.71 =C2=B1 32%      +6.5%      22.7=
1 =C2=B1 31%  interrupts.CPU33.TLB:TLB_shootdowns
      2664 =C2=B1 73%     -42.5%       1532 =C2=B1  9%     -39.5%       161=
2 =C2=B1  8%  interrupts.CPU34.CAL:Function_call_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU34.IWI:IRQ_work_interrupts
    602049            -1.0%     596131 =C2=B1  2%      -7.1%     559029 =C2=
=B1 18%  interrupts.CPU34.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU34.MCP:Machine_check_polls
    405.50 =C2=B1 92%     -44.3%     226.00 =C2=B1 34%     -36.2%     258.5=
7 =C2=B1 29%  interrupts.CPU34.NMI:Non-maskable_interrupts
    405.50 =C2=B1 92%     -44.3%     226.00 =C2=B1 34%     -36.2%     258.5=
7 =C2=B1 29%  interrupts.CPU34.PMI:Performance_monitoring_interrupts
     73.17 =C2=B1 44%     -27.2%      53.29 =C2=B1 41%     -11.9%      64.4=
3 =C2=B1 37%  interrupts.CPU34.RES:Rescheduling_interrupts
     55.17 =C2=B1 47%     +17.6%      64.86 =C2=B1 16%     +12.4%      62.0=
0 =C2=B1 23%  interrupts.CPU34.TLB:TLB_shootdowns
      1464 =C2=B1 15%      -5.2%       1387 =C2=B1  6%      -5.2%       138=
7 =C2=B1 10%  interrupts.CPU35.CAL:Function_call_interrupts
    602331            -1.1%     595719 =C2=B1  2%      -7.2%     558752 =C2=
=B1 18%  interrupts.CPU35.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU35.MCP:Machine_check_polls
    271.17 =C2=B1 29%     -28.5%     193.86 =C2=B1 30%     -16.0%     227.8=
6 =C2=B1 32%  interrupts.CPU35.NMI:Non-maskable_interrupts
    271.17 =C2=B1 29%     -28.5%     193.86 =C2=B1 30%     -16.0%     227.8=
6 =C2=B1 32%  interrupts.CPU35.PMI:Performance_monitoring_interrupts
     32.33 =C2=B1 39%      +9.6%      35.43 =C2=B1 45%      +6.0%      34.2=
9 =C2=B1 23%  interrupts.CPU35.RES:Rescheduling_interrupts
     21.67 =C2=B1 27%      +0.9%      21.86 =C2=B1 32%      +4.8%      22.7=
1 =C2=B1 25%  interrupts.CPU35.TLB:TLB_shootdowns
      1686 =C2=B1  7%      -7.1%       1566 =C2=B1  9%     +11.4%       187=
9 =C2=B1 40%  interrupts.CPU36.CAL:Function_call_interrupts
    602170            -0.5%     599204            -7.1%     559354 =C2=B1 1=
8%  interrupts.CPU36.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU36.MCP:Machine_check_polls
    252.67 =C2=B1 36%     +25.7%     317.57 =C2=B1 57%     -12.5%     221.1=
4 =C2=B1 25%  interrupts.CPU36.NMI:Non-maskable_interrupts
    252.67 =C2=B1 36%     +25.7%     317.57 =C2=B1 57%     -12.5%     221.1=
4 =C2=B1 25%  interrupts.CPU36.PMI:Performance_monitoring_interrupts
     65.67 =C2=B1 21%      -1.2%      64.86 =C2=B1 36%     +48.4%      97.4=
3 =C2=B1 77%  interrupts.CPU36.RES:Rescheduling_interrupts
     69.17 =C2=B1  9%     -12.0%      60.86 =C2=B1 17%     +26.0%      87.1=
4 =C2=B1 41%  interrupts.CPU36.TLB:TLB_shootdowns
      1367 =C2=B1  5%      -0.5%       1359 =C2=B1  2%      -0.5%       136=
0 =C2=B1 14%  interrupts.CPU37.CAL:Function_call_interrupts
    602248            -1.0%     596229 =C2=B1  2%      -7.1%     559413 =C2=
=B1 18%  interrupts.CPU37.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU37.MCP:Machine_check_polls
    265.33 =C2=B1 35%      +2.8%     272.86 =C2=B1 30%     -15.6%     223.8=
6 =C2=B1 40%  interrupts.CPU37.NMI:Non-maskable_interrupts
    265.33 =C2=B1 35%      +2.8%     272.86 =C2=B1 30%     -15.6%     223.8=
6 =C2=B1 40%  interrupts.CPU37.PMI:Performance_monitoring_interrupts
     29.50 =C2=B1 35%      -3.1%      28.57 =C2=B1 12%     +20.6%      35.5=
7 =C2=B1 85%  interrupts.CPU37.RES:Rescheduling_interrupts
     20.17 =C2=B1 10%     +16.9%      23.57 =C2=B1 25%     +19.7%      24.1=
4 =C2=B1 30%  interrupts.CPU37.TLB:TLB_shootdowns
      1539 =C2=B1 16%      +0.1%       1540 =C2=B1  4%     +16.6%       179=
5 =C2=B1 19%  interrupts.CPU38.CAL:Function_call_interrupts
    602376            -0.5%     599186            -7.2%     558791 =C2=B1 1=
8%  interrupts.CPU38.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU38.MCP:Machine_check_polls
    364.67 =C2=B1 66%     -20.2%     290.86 =C2=B1 30%     -43.9%     204.4=
3 =C2=B1 36%  interrupts.CPU38.NMI:Non-maskable_interrupts
    364.67 =C2=B1 66%     -20.2%     290.86 =C2=B1 30%     -43.9%     204.4=
3 =C2=B1 36%  interrupts.CPU38.PMI:Performance_monitoring_interrupts
     49.17 =C2=B1 64%     +12.7%      55.43 =C2=B1 34%     +88.6%      92.7=
1 =C2=B1 49%  interrupts.CPU38.RES:Rescheduling_interrupts
     43.00 =C2=B1 64%     +40.2%      60.29 =C2=B1 23%     +69.1%      72.7=
1 =C2=B1 12%  interrupts.CPU38.TLB:TLB_shootdowns
      1286 =C2=B1  4%      +5.3%       1354 =C2=B1  3%     +10.9%       142=
6 =C2=B1 17%  interrupts.CPU39.CAL:Function_call_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU39.IWI:IRQ_work_interrupts
    602260            -0.5%     598995            -7.2%     559032 =C2=B1 1=
8%  interrupts.CPU39.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU39.MCP:Machine_check_polls
    242.33 =C2=B1 62%      +6.9%     259.00 =C2=B1 35%      -7.5%     224.1=
4 =C2=B1 39%  interrupts.CPU39.NMI:Non-maskable_interrupts
    242.33 =C2=B1 62%      +6.9%     259.00 =C2=B1 35%      -7.5%     224.1=
4 =C2=B1 39%  interrupts.CPU39.PMI:Performance_monitoring_interrupts
     14.33 =C2=B1 52%    +113.3%      30.57 =C2=B1 19%    +125.2%      32.2=
9 =C2=B1 72%  interrupts.CPU39.RES:Rescheduling_interrupts
     19.67 =C2=B1 52%     +14.8%      22.57 =C2=B1 22%     +36.6%      26.8=
6 =C2=B1 27%  interrupts.CPU39.TLB:TLB_shootdowns
      1616 =C2=B1  3%      -6.1%       1517 =C2=B1 19%     +14.7%       185=
4 =C2=B1 15%  interrupts.CPU4.CAL:Function_call_interrupts
    601721            +0.0%     601890            -7.1%     559277 =C2=B1 1=
8%  interrupts.CPU4.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU4.MCP:Machine_check_polls
    218.67 =C2=B1 36%      +5.8%     231.43 =C2=B1 33%     +12.3%     245.5=
7 =C2=B1 36%  interrupts.CPU4.NMI:Non-maskable_interrupts
    218.67 =C2=B1 36%      +5.8%     231.43 =C2=B1 33%     +12.3%     245.5=
7 =C2=B1 36%  interrupts.CPU4.PMI:Performance_monitoring_interrupts
     46.67 =C2=B1 10%     +21.5%      56.71 =C2=B1 30%     +44.8%      67.5=
7 =C2=B1 26%  interrupts.CPU4.RES:Rescheduling_interrupts
     70.83 =C2=B1  8%     -15.5%      59.86 =C2=B1 24%     -17.3%      58.5=
7 =C2=B1 22%  interrupts.CPU4.TLB:TLB_shootdowns
      1544 =C2=B1 12%      +1.7%       1571 =C2=B1 12%     +14.6%       177=
0 =C2=B1 10%  interrupts.CPU40.CAL:Function_call_interrupts
      0.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU40.IWI:IRQ_work_interrupts
    602231            -2.3%     588662 =C2=B1  5%      -7.2%     558663 =C2=
=B1 18%  interrupts.CPU40.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU40.MCP:Machine_check_polls
      1286 =C2=B1175%     -83.0%     218.14 =C2=B1 12%     -80.3%     253.1=
4 =C2=B1 41%  interrupts.CPU40.NMI:Non-maskable_interrupts
      1286 =C2=B1175%     -83.0%     218.14 =C2=B1 12%     -80.3%     253.1=
4 =C2=B1 41%  interrupts.CPU40.PMI:Performance_monitoring_interrupts
     54.17 =C2=B1 25%     +14.5%      62.00 =C2=B1 58%     +51.1%      81.8=
6 =C2=B1 31%  interrupts.CPU40.RES:Rescheduling_interrupts
     53.33 =C2=B1 51%      -3.3%      51.57 =C2=B1 53%     +31.2%      70.0=
0 =C2=B1  5%  interrupts.CPU40.TLB:TLB_shootdowns
      1342 =C2=B1  3%      +3.2%       1386 =C2=B1  8%      +3.2%       138=
5 =C2=B1  6%  interrupts.CPU41.CAL:Function_call_interrupts
    602454            -3.4%     581732 =C2=B1  8%      -7.2%     559152 =C2=
=B1 18%  interrupts.CPU41.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU41.MCP:Machine_check_polls
    309.83 =C2=B1 35%     -15.3%     262.57 =C2=B1 38%     -18.8%     251.5=
7 =C2=B1 31%  interrupts.CPU41.NMI:Non-maskable_interrupts
    309.83 =C2=B1 35%     -15.3%     262.57 =C2=B1 38%     -18.8%     251.5=
7 =C2=B1 31%  interrupts.CPU41.PMI:Performance_monitoring_interrupts
     27.17 =C2=B1 44%     -14.3%      23.29 =C2=B1 61%     +23.0%      33.4=
3 =C2=B1 40%  interrupts.CPU41.RES:Rescheduling_interrupts
     23.50 =C2=B1 41%     -18.5%      19.14 =C2=B1 43%      -1.5%      23.1=
4 =C2=B1 24%  interrupts.CPU41.TLB:TLB_shootdowns
      1689 =C2=B1 14%     +12.7%       1904 =C2=B1 34%      -3.9%       162=
4 =C2=B1  4%  interrupts.CPU42.CAL:Function_call_interrupts
    601775            -1.2%     594579 =C2=B1  3%      -7.1%     559129 =C2=
=B1 18%  interrupts.CPU42.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU42.MCP:Machine_check_polls
    312.33 =C2=B1 28%      +2.9%     321.43 =C2=B1 25%     -16.6%     260.5=
7 =C2=B1 39%  interrupts.CPU42.NMI:Non-maskable_interrupts
    312.33 =C2=B1 28%      +2.9%     321.43 =C2=B1 25%     -16.6%     260.5=
7 =C2=B1 39%  interrupts.CPU42.PMI:Performance_monitoring_interrupts
     50.00 =C2=B1 43%    +102.3%     101.14 =C2=B1 69%     +31.1%      65.5=
7 =C2=B1 15%  interrupts.CPU42.RES:Rescheduling_interrupts
     55.83 =C2=B1 24%     +14.6%      64.00 =C2=B1 22%     +35.6%      75.7=
1 =C2=B1 13%  interrupts.CPU42.TLB:TLB_shootdowns
      1399 =C2=B1 16%      +2.3%       1431 =C2=B1 18%      -9.5%       126=
6 =C2=B1 14%  interrupts.CPU43.CAL:Function_call_interrupts
    601999            -2.3%     588277 =C2=B1  5%      -7.1%     559125 =C2=
=B1 18%  interrupts.CPU43.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU43.MCP:Machine_check_polls
    244.17 =C2=B1 35%      +7.7%     262.86 =C2=B1 34%     -18.5%     199.0=
0 =C2=B1 34%  interrupts.CPU43.NMI:Non-maskable_interrupts
    244.17 =C2=B1 35%      +7.7%     262.86 =C2=B1 34%     -18.5%     199.0=
0 =C2=B1 34%  interrupts.CPU43.PMI:Performance_monitoring_interrupts
     23.50 =C2=B1 20%     +92.7%      45.29 =C2=B1 68%     +20.4%      28.2=
9 =C2=B1 29%  interrupts.CPU43.RES:Rescheduling_interrupts
     23.50 =C2=B1 21%     -14.9%      20.00 =C2=B1 12%      +5.8%      24.8=
6 =C2=B1 15%  interrupts.CPU43.TLB:TLB_shootdowns
      1621 =C2=B1  3%     +24.4%       2016 =C2=B1 45%      -4.7%       154=
4 =C2=B1  9%  interrupts.CPU44.CAL:Function_call_interrupts
    601444            -2.1%     588696 =C2=B1  5%      -7.0%     559156 =C2=
=B1 18%  interrupts.CPU44.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU44.MCP:Machine_check_polls
    241.67 =C2=B1 32%      -0.2%     241.29 =C2=B1 30%      -7.7%     223.0=
0 =C2=B1 35%  interrupts.CPU44.NMI:Non-maskable_interrupts
    241.67 =C2=B1 32%      -0.2%     241.29 =C2=B1 30%      -7.7%     223.0=
0 =C2=B1 35%  interrupts.CPU44.PMI:Performance_monitoring_interrupts
     59.50 =C2=B1 18%    +107.4%     123.43 =C2=B1 78%      -0.6%      59.1=
4 =C2=B1 33%  interrupts.CPU44.RES:Rescheduling_interrupts
     72.33 =C2=B1  6%     -12.5%      63.29 =C2=B1 27%     -17.1%      60.0=
0 =C2=B1 26%  interrupts.CPU44.TLB:TLB_shootdowns
      1453 =C2=B1 11%     +20.3%       1748 =C2=B1 30%      -9.3%       131=
9 =C2=B1  6%  interrupts.CPU45.CAL:Function_call_interrupts
    602015            -2.1%     589442 =C2=B1  5%      -7.1%     559221 =C2=
=B1 18%  interrupts.CPU45.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU45.MCP:Machine_check_polls
    230.17 =C2=B1 32%      +0.4%     231.14 =C2=B1 28%     +11.7%     257.1=
4 =C2=B1 36%  interrupts.CPU45.NMI:Non-maskable_interrupts
    230.17 =C2=B1 32%      +0.4%     231.14 =C2=B1 28%     +11.7%     257.1=
4 =C2=B1 36%  interrupts.CPU45.PMI:Performance_monitoring_interrupts
     26.83 =C2=B1 30%    +130.5%      61.86 =C2=B1 61%     -20.7%      21.2=
9 =C2=B1 43%  interrupts.CPU45.RES:Rescheduling_interrupts
     21.33 =C2=B1 20%      +7.1%      22.86 =C2=B1 24%     -10.3%      19.1=
4 =C2=B1 43%  interrupts.CPU45.TLB:TLB_shootdowns
      1631 =C2=B1  5%      +4.8%       1710 =C2=B1 32%      -5.9%       153=
4 =C2=B1  8%  interrupts.CPU46.CAL:Function_call_interrupts
      0.00       +2.9e+101%       0.29 =C2=B1158%    -100.0%       0.00    =
    interrupts.CPU46.IWI:IRQ_work_interrupts
    602383            -1.5%     593308 =C2=B1  3%      -7.2%     559190 =C2=
=B1 18%  interrupts.CPU46.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU46.MCP:Machine_check_polls
    238.00 =C2=B1 34%     +66.1%     395.29 =C2=B1 72%      -7.4%     220.4=
3 =C2=B1 40%  interrupts.CPU46.NMI:Non-maskable_interrupts
    238.00 =C2=B1 34%     +66.1%     395.29 =C2=B1 72%      -7.4%     220.4=
3 =C2=B1 40%  interrupts.CPU46.PMI:Performance_monitoring_interrupts
     62.17 =C2=B1 17%      +1.1%      62.86 =C2=B1 59%     -18.2%      50.8=
6 =C2=B1 35%  interrupts.CPU46.RES:Rescheduling_interrupts
     63.83 =C2=B1 19%     -14.3%      54.71 =C2=B1 47%     -15.0%      54.2=
9 =C2=B1 31%  interrupts.CPU46.TLB:TLB_shootdowns
      1353 =C2=B1  7%      -1.3%       1336 =C2=B1  6%      -2.0%       132=
6 =C2=B1  2%  interrupts.CPU47.CAL:Function_call_interrupts
      0.50 =C2=B1223%     -71.4%       0.14 =C2=B1244%    -100.0%       0.0=
0        interrupts.CPU47.IWI:IRQ_work_interrupts
    602381            -1.1%     595796 =C2=B1  2%      -7.2%     559155 =C2=
=B1 18%  interrupts.CPU47.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU47.MCP:Machine_check_polls
    236.00 =C2=B1 31%    +119.9%     518.86 =C2=B1101%     -10.2%     211.8=
6 =C2=B1 41%  interrupts.CPU47.NMI:Non-maskable_interrupts
    236.00 =C2=B1 31%    +119.9%     518.86 =C2=B1101%     -10.2%     211.8=
6 =C2=B1 41%  interrupts.CPU47.PMI:Performance_monitoring_interrupts
     28.50 =C2=B1 34%      +1.8%      29.00 =C2=B1 57%     -21.8%      22.2=
9 =C2=B1 46%  interrupts.CPU47.RES:Rescheduling_interrupts
     23.17 =C2=B1 36%      -2.6%      22.57 =C2=B1 42%     -11.8%      20.4=
3 =C2=B1 33%  interrupts.CPU47.TLB:TLB_shootdowns
      1689 =C2=B1 17%      -0.7%       1678 =C2=B1  9%      +2.3%       172=
9 =C2=B1  9%  interrupts.CPU48.CAL:Function_call_interrupts
    602354            -2.3%     588220 =C2=B1  5%      -7.2%     559186 =C2=
=B1 18%  interrupts.CPU48.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU48.MCP:Machine_check_polls
    211.83 =C2=B1  5%     +11.3%     235.71 =C2=B1 22%     +35.8%     287.5=
7 =C2=B1 41%  interrupts.CPU48.NMI:Non-maskable_interrupts
    211.83 =C2=B1  5%     +11.3%     235.71 =C2=B1 22%     +35.8%     287.5=
7 =C2=B1 41%  interrupts.CPU48.PMI:Performance_monitoring_interrupts
     55.83 =C2=B1 38%     +28.2%      71.57 =C2=B1 22%     +25.6%      70.1=
4 =C2=B1  6%  interrupts.CPU48.RES:Rescheduling_interrupts
     57.33 =C2=B1 27%     +23.1%      70.57 =C2=B1 14%     +21.3%      69.5=
7 =C2=B1 10%  interrupts.CPU48.TLB:TLB_shootdowns
      1365 =C2=B1  9%      +6.9%       1459 =C2=B1  8%      +2.7%       140=
2 =C2=B1  8%  interrupts.CPU49.CAL:Function_call_interrupts
    602392            -1.9%     591183 =C2=B1  4%      -7.1%     559381 =C2=
=B1 18%  interrupts.CPU49.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU49.MCP:Machine_check_polls
    236.67 =C2=B1 30%      +2.0%     241.29 =C2=B1 33%     -20.1%     189.0=
0 =C2=B1 17%  interrupts.CPU49.NMI:Non-maskable_interrupts
    236.67 =C2=B1 30%      +2.0%     241.29 =C2=B1 33%     -20.1%     189.0=
0 =C2=B1 17%  interrupts.CPU49.PMI:Performance_monitoring_interrupts
     27.33 =C2=B1 52%     +61.0%      44.00 =C2=B1 33%     +12.9%      30.8=
6 =C2=B1 51%  interrupts.CPU49.RES:Rescheduling_interrupts
     20.17 =C2=B1 23%    +235.1%      67.57 =C2=B1152%     +25.4%      25.2=
9 =C2=B1 15%  interrupts.CPU49.TLB:TLB_shootdowns
      1536 =C2=B1 16%     -11.2%       1364 =C2=B1  5%      -7.5%       142=
2 =C2=B1  7%  interrupts.CPU5.CAL:Function_call_interrupts
    602515            -0.1%     601884            -7.2%     559264 =C2=B1 1=
8%  interrupts.CPU5.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU5.MCP:Machine_check_polls
    217.33 =C2=B1 36%      -3.8%     209.14 =C2=B1 32%      +1.8%     221.1=
4 =C2=B1 39%  interrupts.CPU5.NMI:Non-maskable_interrupts
    217.33 =C2=B1 36%      -3.8%     209.14 =C2=B1 32%      +1.8%     221.1=
4 =C2=B1 39%  interrupts.CPU5.PMI:Performance_monitoring_interrupts
     19.17 =C2=B1 32%     +78.1%      34.14 =C2=B1 53%     +34.2%      25.7=
1 =C2=B1 41%  interrupts.CPU5.RES:Rescheduling_interrupts
     21.17 =C2=B1 26%      +3.3%      21.86 =C2=B1 20%      +1.2%      21.4=
3 =C2=B1 24%  interrupts.CPU5.TLB:TLB_shootdowns
      1482 =C2=B1 11%     +37.1%       2032 =C2=B1 35%     +12.9%       167=
4 =C2=B1  7%  interrupts.CPU50.CAL:Function_call_interrupts
    602308            -3.0%     584474 =C2=B1  7%      -7.2%     559199 =C2=
=B1 18%  interrupts.CPU50.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU50.MCP:Machine_check_polls
    246.00 =C2=B1 31%     -15.6%     207.71 =C2=B1  6%     -21.1%     194.0=
0 =C2=B1 19%  interrupts.CPU50.NMI:Non-maskable_interrupts
    246.00 =C2=B1 31%     -15.6%     207.71 =C2=B1  6%     -21.1%     194.0=
0 =C2=B1 19%  interrupts.CPU50.PMI:Performance_monitoring_interrupts
     40.33 =C2=B1 43%    +184.1%     114.57 =C2=B1 99%     +84.9%      74.5=
7 =C2=B1 17%  interrupts.CPU50.RES:Rescheduling_interrupts
     47.67 =C2=B1 50%     +20.8%      57.57 =C2=B1 32%     +47.8%      70.4=
3 =C2=B1 15%  interrupts.CPU50.TLB:TLB_shootdowns
      1343 =C2=B1  6%     +22.5%       1646 =C2=B1 39%      -0.6%       133=
5 =C2=B1  2%  interrupts.CPU51.CAL:Function_call_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU51.IWI:IRQ_work_interrupts
    602450            -2.5%     587206 =C2=B1  6%      -7.1%     559443 =C2=
=B1 18%  interrupts.CPU51.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU51.MCP:Machine_check_polls
    819.33 =C2=B1127%     -67.4%     267.00 =C2=B1 36%     -69.5%     250.0=
0 =C2=B1 41%  interrupts.CPU51.NMI:Non-maskable_interrupts
    819.33 =C2=B1127%     -67.4%     267.00 =C2=B1 36%     -69.5%     250.0=
0 =C2=B1 41%  interrupts.CPU51.PMI:Performance_monitoring_interrupts
     25.67 =C2=B1 69%    +133.8%      60.00 =C2=B1124%     +14.7%      29.4=
3 =C2=B1 28%  interrupts.CPU51.RES:Rescheduling_interrupts
     17.00 =C2=B1 27%     +10.9%      18.86 =C2=B1 35%    +271.4%      63.1=
4 =C2=B1160%  interrupts.CPU51.TLB:TLB_shootdowns
      1599 =C2=B1  7%     +11.9%       1790 =C2=B1 34%      +2.8%       164=
4 =C2=B1  9%  interrupts.CPU52.CAL:Function_call_interrupts
    602112            -3.7%     579783 =C2=B1  9%      -7.1%     559159 =C2=
=B1 18%  interrupts.CPU52.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU52.MCP:Machine_check_polls
    274.83 =C2=B1 36%     -22.8%     212.14 =C2=B1  9%      -8.4%     251.8=
6 =C2=B1 42%  interrupts.CPU52.NMI:Non-maskable_interrupts
    274.83 =C2=B1 36%     -22.8%     212.14 =C2=B1  9%      -8.4%     251.8=
6 =C2=B1 42%  interrupts.CPU52.PMI:Performance_monitoring_interrupts
     55.83 =C2=B1 24%     +38.9%      77.57 =C2=B1 88%     +20.5%      67.2=
9 =C2=B1 33%  interrupts.CPU52.RES:Rescheduling_interrupts
     66.83 =C2=B1 14%     -12.1%      58.71 =C2=B1 41%      +2.4%      68.4=
3 =C2=B1 25%  interrupts.CPU52.TLB:TLB_shootdowns
      1332 =C2=B1  3%     +10.1%       1467 =C2=B1 22%      -0.4%       132=
7 =C2=B1  5%  interrupts.CPU53.CAL:Function_call_interrupts
      0.00       +4.3e+101%       0.43 =C2=B1244%    -100.0%       0.00    =
    interrupts.CPU53.IWI:IRQ_work_interrupts
    602197            -3.0%     584372 =C2=B1  7%      -7.2%     559133 =C2=
=B1 18%  interrupts.CPU53.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU53.MCP:Machine_check_polls
    279.17 =C2=B1 40%     +62.3%     453.00 =C2=B1133%     -10.8%     249.1=
4 =C2=B1 42%  interrupts.CPU53.NMI:Non-maskable_interrupts
    279.17 =C2=B1 40%     +62.3%     453.00 =C2=B1133%     -10.8%     249.1=
4 =C2=B1 42%  interrupts.CPU53.PMI:Performance_monitoring_interrupts
     22.50 =C2=B1 16%     +35.2%      30.43 =C2=B1 41%      +6.0%      23.8=
6 =C2=B1 50%  interrupts.CPU53.RES:Rescheduling_interrupts
     22.33 =C2=B1 19%      -0.2%      22.29 =C2=B1 38%      +3.6%      23.1=
4 =C2=B1 38%  interrupts.CPU53.TLB:TLB_shootdowns
      1571 =C2=B1  7%      -1.0%       1555 =C2=B1  8%      -5.0%       149=
2 =C2=B1 15%  interrupts.CPU54.CAL:Function_call_interrupts
    602229            -3.7%     580122 =C2=B1  9%      -7.1%     559274 =C2=
=B1 18%  interrupts.CPU54.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU54.MCP:Machine_check_polls
    244.50 =C2=B1 30%     +23.0%     300.86 =C2=B1 36%     -18.5%     199.2=
9 =C2=B1 16%  interrupts.CPU54.NMI:Non-maskable_interrupts
    244.50 =C2=B1 30%     +23.0%     300.86 =C2=B1 36%     -18.5%     199.2=
9 =C2=B1 16%  interrupts.CPU54.PMI:Performance_monitoring_interrupts
     58.33 =C2=B1 40%      -0.1%      58.29 =C2=B1 35%      -0.1%      58.2=
9 =C2=B1 44%  interrupts.CPU54.RES:Rescheduling_interrupts
     67.00 =C2=B1 24%     +14.3%      76.57 =C2=B1 25%      -8.1%      61.5=
7 =C2=B1 41%  interrupts.CPU54.TLB:TLB_shootdowns
      1356 =C2=B1  3%      +7.4%       1457 =C2=B1 16%      +0.8%       136=
6 =C2=B1  9%  interrupts.CPU55.CAL:Function_call_interrupts
    602237            -3.7%     580216 =C2=B1  9%      -7.1%     559190 =C2=
=B1 18%  interrupts.CPU55.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU55.MCP:Machine_check_polls
    309.17 =C2=B1 32%     -22.8%     238.71 =C2=B1 33%      -6.0%     290.7=
1 =C2=B1 84%  interrupts.CPU55.NMI:Non-maskable_interrupts
    309.17 =C2=B1 32%     -22.8%     238.71 =C2=B1 33%      -6.0%     290.7=
1 =C2=B1 84%  interrupts.CPU55.PMI:Performance_monitoring_interrupts
     28.33 =C2=B1 29%     +21.5%      34.43 =C2=B1 36%     -25.4%      21.1=
4 =C2=B1 53%  interrupts.CPU55.RES:Rescheduling_interrupts
     20.50 =C2=B1 15%     +23.3%      25.29 =C2=B1 14%      -4.5%      19.5=
7 =C2=B1 38%  interrupts.CPU55.TLB:TLB_shootdowns
      1510 =C2=B1  8%      +4.9%       1584 =C2=B1  6%     +31.4%       198=
4 =C2=B1 51%  interrupts.CPU56.CAL:Function_call_interrupts
    602347            -4.2%     577341 =C2=B1 10%      -7.1%     559313 =C2=
=B1 18%  interrupts.CPU56.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU56.MCP:Machine_check_polls
    282.33 =C2=B1 38%     -28.1%     203.00 =C2=B1  8%      -6.2%     264.8=
6 =C2=B1 47%  interrupts.CPU56.NMI:Non-maskable_interrupts
    282.33 =C2=B1 38%     -28.1%     203.00 =C2=B1  8%      -6.2%     264.8=
6 =C2=B1 47%  interrupts.CPU56.PMI:Performance_monitoring_interrupts
     48.00 =C2=B1 34%     +16.7%      56.00 =C2=B1 26%    +128.6%     109.7=
1 =C2=B1118%  interrupts.CPU56.RES:Rescheduling_interrupts
    112.33 =C2=B1105%     -43.0%      64.00 =C2=B1 10%     -43.9%      63.0=
0 =C2=B1 12%  interrupts.CPU56.TLB:TLB_shootdowns
      1406 =C2=B1  2%      -4.6%       1342 =C2=B1  3%     +21.1%       170=
3 =C2=B1 45%  interrupts.CPU57.CAL:Function_call_interrupts
    602359            -2.4%     587601 =C2=B1  6%      -7.1%     559392 =C2=
=B1 18%  interrupts.CPU57.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU57.MCP:Machine_check_polls
    311.83 =C2=B1 34%     -26.3%     229.86 =C2=B1 30%      -5.2%     295.5=
7 =C2=B1 46%  interrupts.CPU57.NMI:Non-maskable_interrupts
    311.83 =C2=B1 34%     -26.3%     229.86 =C2=B1 30%      -5.2%     295.5=
7 =C2=B1 46%  interrupts.CPU57.PMI:Performance_monitoring_interrupts
     24.50 =C2=B1 39%     +34.1%      32.86 =C2=B1 23%    +154.8%      62.4=
3 =C2=B1124%  interrupts.CPU57.RES:Rescheduling_interrupts
     20.50 =C2=B1 30%      +8.0%      22.14 =C2=B1 22%     +22.0%      25.0=
0 =C2=B1 22%  interrupts.CPU57.TLB:TLB_shootdowns
      1587 =C2=B1  5%     +27.2%       2018 =C2=B1 65%     +31.0%       207=
8 =C2=B1 40%  interrupts.CPU58.CAL:Function_call_interrupts
    602046            -2.1%     589322 =C2=B1  5%      -7.1%     559189 =C2=
=B1 18%  interrupts.CPU58.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU58.MCP:Machine_check_polls
    244.00 =C2=B1 32%     +12.0%     273.29 =C2=B1 35%     +27.6%     311.2=
9 =C2=B1 37%  interrupts.CPU58.NMI:Non-maskable_interrupts
    244.00 =C2=B1 32%     +12.0%     273.29 =C2=B1 35%     +27.6%     311.2=
9 =C2=B1 37%  interrupts.CPU58.PMI:Performance_monitoring_interrupts
     54.33 =C2=B1 24%    +138.5%     129.57 =C2=B1138%    +126.9%     123.2=
9 =C2=B1101%  interrupts.CPU58.RES:Rescheduling_interrupts
     67.17 =C2=B1 17%      -3.9%      64.57 =C2=B1 26%      +1.5%      68.1=
4 =C2=B1 10%  interrupts.CPU58.TLB:TLB_shootdowns
      1357 =C2=B1  4%     +13.9%       1546 =C2=B1 33%      -1.2%       134=
2 =C2=B1  8%  interrupts.CPU59.CAL:Function_call_interrupts
    602317            -2.0%     590217 =C2=B1  4%      -7.2%     559085 =C2=
=B1 18%  interrupts.CPU59.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU59.MCP:Machine_check_polls
    207.83 =C2=B1  4%     +24.5%     258.71 =C2=B1 35%      +4.3%     216.7=
1 =C2=B1 33%  interrupts.CPU59.NMI:Non-maskable_interrupts
    207.83 =C2=B1  4%     +24.5%     258.71 =C2=B1 35%      +4.3%     216.7=
1 =C2=B1 33%  interrupts.CPU59.PMI:Performance_monitoring_interrupts
     33.33 =C2=B1 11%     +76.1%      58.71 =C2=B1 80%      -1.4%      32.8=
6 =C2=B1 51%  interrupts.CPU59.RES:Rescheduling_interrupts
     22.17 =C2=B1 36%      -5.3%      21.00 =C2=B1 20%     +14.1%      25.2=
9 =C2=B1 15%  interrupts.CPU59.TLB:TLB_shootdowns
      1733 =C2=B1 16%     -11.4%       1535 =C2=B1 13%      -8.4%       158=
7 =C2=B1 11%  interrupts.CPU6.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  interrupts.CPU6.IWI:IRQ_work_interrupts
    602206            -0.2%     600955            -7.1%     559156 =C2=B1 1=
8%  interrupts.CPU6.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU6.MCP:Machine_check_polls
    252.00 =C2=B1 33%     -27.6%     182.57 =C2=B1 26%      -0.3%     251.2=
9 =C2=B1 73%  interrupts.CPU6.NMI:Non-maskable_interrupts
    252.00 =C2=B1 33%     -27.6%     182.57 =C2=B1 26%      -0.3%     251.2=
9 =C2=B1 73%  interrupts.CPU6.PMI:Performance_monitoring_interrupts
     59.67 =C2=B1 37%     -18.1%      48.86 =C2=B1 50%      +1.3%      60.4=
3 =C2=B1 39%  interrupts.CPU6.RES:Rescheduling_interrupts
     62.17 =C2=B1 27%      -9.9%      56.00 =C2=B1 28%     -14.1%      53.4=
3 =C2=B1 46%  interrupts.CPU6.TLB:TLB_shootdowns
      1635 =C2=B1  7%      -3.6%       1577 =C2=B1  7%     +20.2%       196=
5 =C2=B1 27%  interrupts.CPU60.CAL:Function_call_interrupts
    602170            -3.4%     581549 =C2=B1  8%      -7.2%     559063 =C2=
=B1 18%  interrupts.CPU60.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU60.MCP:Machine_check_polls
    272.33 =C2=B1 34%     -14.4%     233.14 =C2=B1 33%     -26.0%     201.4=
3 =C2=B1 16%  interrupts.CPU60.NMI:Non-maskable_interrupts
    272.33 =C2=B1 34%     -14.4%     233.14 =C2=B1 33%     -26.0%     201.4=
3 =C2=B1 16%  interrupts.CPU60.PMI:Performance_monitoring_interrupts
     55.50 =C2=B1 16%     +16.1%      64.43 =C2=B1 34%     +90.2%     105.5=
7 =C2=B1 47%  interrupts.CPU60.RES:Rescheduling_interrupts
     69.00 =C2=B1  9%      -7.2%      64.00 =C2=B1  7%      +2.5%      70.7=
1 =C2=B1 10%  interrupts.CPU60.TLB:TLB_shootdowns
      1377 =C2=B1  7%      +2.7%       1413 =C2=B1  4%      +3.2%       142=
1 =C2=B1  8%  interrupts.CPU61.CAL:Function_call_interrupts
    602158            -3.3%     582400 =C2=B1  8%      -7.1%     559348 =C2=
=B1 18%  interrupts.CPU61.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU61.MCP:Machine_check_polls
    300.50 =C2=B1 33%     -22.4%     233.29 =C2=B1 31%     -11.2%     266.7=
1 =C2=B1 34%  interrupts.CPU61.NMI:Non-maskable_interrupts
    300.50 =C2=B1 33%     -22.4%     233.29 =C2=B1 31%     -11.2%     266.7=
1 =C2=B1 34%  interrupts.CPU61.PMI:Performance_monitoring_interrupts
     22.33 =C2=B1 20%     +60.6%      35.86 =C2=B1 23%     +72.1%      38.4=
3 =C2=B1 52%  interrupts.CPU61.RES:Rescheduling_interrupts
     20.67 =C2=B1 24%     +43.8%      29.71 =C2=B1 31%     +16.8%      24.1=
4 =C2=B1 11%  interrupts.CPU61.TLB:TLB_shootdowns
      1354 =C2=B1  2%      -0.7%       1344 =C2=B1  5%      +4.6%       141=
6 =C2=B1 13%  interrupts.CPU62.CAL:Function_call_interrupts
    602197            -3.1%     583293 =C2=B1  8%      -7.2%     559046 =C2=
=B1 18%  interrupts.CPU62.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU62.MCP:Machine_check_polls
    282.83 =C2=B1 35%      -8.5%     258.71 =C2=B1 30%     -15.1%     240.1=
4 =C2=B1 47%  interrupts.CPU62.NMI:Non-maskable_interrupts
    282.83 =C2=B1 35%      -8.5%     258.71 =C2=B1 30%     -15.1%     240.1=
4 =C2=B1 47%  interrupts.CPU62.PMI:Performance_monitoring_interrupts
     35.17 =C2=B1 26%      +1.6%      35.71 =C2=B1 49%     +47.1%      51.7=
1 =C2=B1 74%  interrupts.CPU62.RES:Rescheduling_interrupts
     27.83 =C2=B1 25%     -11.2%      24.71 =C2=B1 19%     +14.5%      31.8=
6 =C2=B1 12%  interrupts.CPU62.TLB:TLB_shootdowns
     11991            -1.3%      11832            +1.7%      12193 =C2=B1  =
7%  interrupts.CPU63.CAL:Function_call_interrupts
    602466            -3.0%     584676 =C2=B1  7%      -7.2%     559316 =C2=
=B1 18%  interrupts.CPU63.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU63.MCP:Machine_check_polls
    412.33 =C2=B1 41%      +5.6%     435.57 =C2=B1 92%     +38.1%     569.2=
9 =C2=B1 79%  interrupts.CPU63.NMI:Non-maskable_interrupts
    412.33 =C2=B1 41%      +5.6%     435.57 =C2=B1 92%     +38.1%     569.2=
9 =C2=B1 79%  interrupts.CPU63.PMI:Performance_monitoring_interrupts
     44.83 =C2=B1 32%     -24.5%      33.86 =C2=B1 30%     +97.6%      88.5=
7 =C2=B1114%  interrupts.CPU63.RES:Rescheduling_interrupts
     52.67 =C2=B1 44%     -28.4%      37.71 =C2=B1 20%      -8.0%      48.4=
3 =C2=B1 54%  interrupts.CPU63.TLB:TLB_shootdowns
      1222            +0.4%       1227           +11.6%       1364 =C2=B1 2=
6%  interrupts.CPU64.CAL:Function_call_interrupts
    602097            -2.0%     590154 =C2=B1  4%      -7.1%     559235 =C2=
=B1 18%  interrupts.CPU64.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU64.MCP:Machine_check_polls
    226.50 =C2=B1 28%      -4.8%     215.71 =C2=B1 32%     +16.2%     263.2=
9 =C2=B1 40%  interrupts.CPU64.NMI:Non-maskable_interrupts
    226.50 =C2=B1 28%      -4.8%     215.71 =C2=B1 32%     +16.2%     263.2=
9 =C2=B1 40%  interrupts.CPU64.PMI:Performance_monitoring_interrupts
     15.00 =C2=B1 45%     -56.2%       6.57 =C2=B1 38%     -39.0%       9.1=
4 =C2=B1 66%  interrupts.CPU64.RES:Rescheduling_interrupts
      7.33 =C2=B1 23%    +856.5%      70.14 =C2=B1219%     +26.6%       9.2=
9 =C2=B1 41%  interrupts.CPU64.TLB:TLB_shootdowns
      1274 =C2=B1  7%      +1.5%       1293 =C2=B1  9%      -3.9%       122=
5        interrupts.CPU65.CAL:Function_call_interrupts
    601382            -1.5%     592417 =C2=B1  3%      -7.0%     559081 =C2=
=B1 18%  interrupts.CPU65.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU65.MCP:Machine_check_polls
    220.33 =C2=B1 25%     +14.6%     252.43 =C2=B1 35%      -2.7%     214.4=
3 =C2=B1 39%  interrupts.CPU65.NMI:Non-maskable_interrupts
    220.33 =C2=B1 25%     +14.6%     252.43 =C2=B1 35%      -2.7%     214.4=
3 =C2=B1 39%  interrupts.CPU65.PMI:Performance_monitoring_interrupts
      7.83 =C2=B1 35%     +27.7%      10.00 =C2=B1 46%     -17.9%       6.4=
3 =C2=B1 71%  interrupts.CPU65.RES:Rescheduling_interrupts
      8.33 =C2=B1 36%      -7.4%       7.71 =C2=B1 39%     -12.6%       7.2=
9 =C2=B1 15%  interrupts.CPU65.TLB:TLB_shootdowns
      1266 =C2=B1  3%      +5.4%       1335 =C2=B1  6%      -1.6%       124=
6 =C2=B1  4%  interrupts.CPU66.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  interrupts.CPU66.IWI:IRQ_work_interrupts
    602349            -1.6%     592516 =C2=B1  4%      -7.2%     559183 =C2=
=B1 18%  interrupts.CPU66.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU66.MCP:Machine_check_polls
    262.50 =C2=B1 33%     +18.6%     311.29 =C2=B1 44%      +0.2%     263.0=
0 =C2=B1 33%  interrupts.CPU66.NMI:Non-maskable_interrupts
    262.50 =C2=B1 33%     +18.6%     311.29 =C2=B1 44%      +0.2%     263.0=
0 =C2=B1 33%  interrupts.CPU66.PMI:Performance_monitoring_interrupts
     15.83 =C2=B1 40%      +5.6%      16.71 =C2=B1 58%      +1.1%      16.0=
0 =C2=B1 35%  interrupts.CPU66.RES:Rescheduling_interrupts
     14.00 =C2=B1 20%      +5.1%      14.71 =C2=B1 26%     -20.4%      11.1=
4 =C2=B1 37%  interrupts.CPU66.TLB:TLB_shootdowns
      1402 =C2=B1 25%     -11.6%       1239 =C2=B1  2%     -12.8%       122=
3        interrupts.CPU67.CAL:Function_call_interrupts
    602218            -2.9%     584575 =C2=B1  7%      -7.1%     559234 =C2=
=B1 18%  interrupts.CPU67.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU67.MCP:Machine_check_polls
    260.83 =C2=B1 36%      -3.3%     252.14 =C2=B1 35%      +1.6%     265.0=
0 =C2=B1 41%  interrupts.CPU67.NMI:Non-maskable_interrupts
    260.83 =C2=B1 36%      -3.3%     252.14 =C2=B1 35%      +1.6%     265.0=
0 =C2=B1 41%  interrupts.CPU67.PMI:Performance_monitoring_interrupts
     13.83 =C2=B1 46%      +3.3%      14.29 =C2=B1 50%     +13.6%      15.7=
1 =C2=B1 70%  interrupts.CPU67.RES:Rescheduling_interrupts
     12.33 =C2=B1 26%      -7.3%      11.43 =C2=B1 44%     -22.4%       9.5=
7 =C2=B1 20%  interrupts.CPU67.TLB:TLB_shootdowns
      1294 =C2=B1  2%      +2.6%       1328 =C2=B1  8%      -1.3%       127=
8 =C2=B1  3%  interrupts.CPU68.CAL:Function_call_interrupts
    602213            -0.3%     600472            -7.1%     559262 =C2=B1 1=
8%  interrupts.CPU68.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU68.MCP:Machine_check_polls
    261.33 =C2=B1 35%     -23.7%     199.29 =C2=B1 29%     -19.9%     209.4=
3 =C2=B1 39%  interrupts.CPU68.NMI:Non-maskable_interrupts
    261.33 =C2=B1 35%     -23.7%     199.29 =C2=B1 29%     -19.9%     209.4=
3 =C2=B1 39%  interrupts.CPU68.PMI:Performance_monitoring_interrupts
     18.00 =C2=B1 28%      +8.7%      19.57 =C2=B1 59%     -24.6%      13.5=
7 =C2=B1 46%  interrupts.CPU68.RES:Rescheduling_interrupts
     27.33 =C2=B1 82%     -50.3%      13.57 =C2=B1 23%     -42.0%      15.8=
6 =C2=B1 16%  interrupts.CPU68.TLB:TLB_shootdowns
      1267 =C2=B1  4%      -3.0%       1228            -3.4%       1224    =
    interrupts.CPU69.CAL:Function_call_interrupts
    602232            -0.3%     600377            -7.2%     559162 =C2=B1 1=
8%  interrupts.CPU69.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU69.MCP:Machine_check_polls
    230.00 =C2=B1 36%      -4.2%     220.43 =C2=B1 34%      -8.1%     211.4=
3 =C2=B1 40%  interrupts.CPU69.NMI:Non-maskable_interrupts
    230.00 =C2=B1 36%      -4.2%     220.43 =C2=B1 34%      -8.1%     211.4=
3 =C2=B1 40%  interrupts.CPU69.PMI:Performance_monitoring_interrupts
     16.67 =C2=B1 44%     -46.9%       8.86 =C2=B1 72%     -52.9%       7.8=
6 =C2=B1 38%  interrupts.CPU69.RES:Rescheduling_interrupts
     11.33 =C2=B1 14%     -10.5%      10.14 =C2=B1 19%      -4.2%      10.8=
6 =C2=B1 15%  interrupts.CPU69.TLB:TLB_shootdowns
      1473 =C2=B1 15%      -5.8%       1388 =C2=B1  8%      -4.7%       140=
4 =C2=B1 11%  interrupts.CPU7.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  interrupts.CPU7.IWI:IRQ_work_interrupts
    602413            -0.1%     601638            -7.1%     559372 =C2=B1 1=
8%  interrupts.CPU7.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU7.MCP:Machine_check_polls
    185.67 =C2=B1 32%     +37.3%     255.00 =C2=B1 31%     +24.6%     231.2=
9 =C2=B1 47%  interrupts.CPU7.NMI:Non-maskable_interrupts
    185.67 =C2=B1 32%     +37.3%     255.00 =C2=B1 31%     +24.6%     231.2=
9 =C2=B1 47%  interrupts.CPU7.PMI:Performance_monitoring_interrupts
     40.83 =C2=B1 53%     -19.2%      33.00 =C2=B1 59%     -52.4%      19.4=
3 =C2=B1 22%  interrupts.CPU7.RES:Rescheduling_interrupts
     31.67 =C2=B1 57%     -17.9%      26.00 =C2=B1 68%     -43.2%      18.0=
0 =C2=B1 39%  interrupts.CPU7.TLB:TLB_shootdowns
      1256 =C2=B1  3%      +5.4%       1325 =C2=B1  6%      -0.3%       125=
2 =C2=B1  3%  interrupts.CPU70.CAL:Function_call_interrupts
    602307            -1.9%     590625 =C2=B1  4%      -7.2%     558704 =C2=
=B1 18%  interrupts.CPU70.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU70.MCP:Machine_check_polls
    234.33 =C2=B1 30%      -4.6%     223.57 =C2=B1 29%      +2.8%     241.0=
0 =C2=B1 60%  interrupts.CPU70.NMI:Non-maskable_interrupts
    234.33 =C2=B1 30%      -4.6%     223.57 =C2=B1 29%      +2.8%     241.0=
0 =C2=B1 60%  interrupts.CPU70.PMI:Performance_monitoring_interrupts
     14.17 =C2=B1 48%     +55.3%      22.00 =C2=B1 45%     +22.0%      17.2=
9 =C2=B1 53%  interrupts.CPU70.RES:Rescheduling_interrupts
     13.50 =C2=B1 34%      +3.7%      14.00 =C2=B1 27%      -4.8%      12.8=
6 =C2=B1 39%  interrupts.CPU70.TLB:TLB_shootdowns
      1242 =C2=B1  2%      +0.1%       1243            +0.1%       1244 =C2=
=B1  2%  interrupts.CPU71.CAL:Function_call_interrupts
    602322            -2.1%     589603 =C2=B1  5%      -7.2%     559174 =C2=
=B1 18%  interrupts.CPU71.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU71.MCP:Machine_check_polls
    301.00 =C2=B1 36%     -23.8%     229.29 =C2=B1 28%     -22.6%     232.8=
6 =C2=B1 35%  interrupts.CPU71.NMI:Non-maskable_interrupts
    301.00 =C2=B1 36%     -23.8%     229.29 =C2=B1 28%     -22.6%     232.8=
6 =C2=B1 35%  interrupts.CPU71.PMI:Performance_monitoring_interrupts
     15.00 =C2=B1 17%     -39.0%       9.14 =C2=B1 46%     -23.8%      11.4=
3 =C2=B1 45%  interrupts.CPU71.RES:Rescheduling_interrupts
     11.00 =C2=B1 27%      -7.8%      10.14 =C2=B1 22%     +11.7%      12.2=
9 =C2=B1 41%  interrupts.CPU71.TLB:TLB_shootdowns
      1247 =C2=B1  2%     +11.0%       1384 =C2=B1 14%      +0.6%       125=
4        interrupts.CPU72.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  interrupts.CPU72.IWI:IRQ_work_interrupts
    602179            -3.2%     583061 =C2=B1  8%      -7.1%     559389 =C2=
=B1 18%  interrupts.CPU72.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU72.MCP:Machine_check_polls
    310.00 =C2=B1 33%     -23.1%     238.29 =C2=B1 33%     +43.3%     444.2=
9 =C2=B1112%  interrupts.CPU72.NMI:Non-maskable_interrupts
    310.00 =C2=B1 33%     -23.1%     238.29 =C2=B1 33%     +43.3%     444.2=
9 =C2=B1112%  interrupts.CPU72.PMI:Performance_monitoring_interrupts
     13.50 =C2=B1 22%    +162.4%      35.43 =C2=B1104%     -11.1%      12.0=
0 =C2=B1 43%  interrupts.CPU72.RES:Rescheduling_interrupts
     13.00 =C2=B1 34%     +36.3%      17.71 =C2=B1 29%      +3.3%      13.4=
3 =C2=B1 43%  interrupts.CPU72.TLB:TLB_shootdowns
      1201 =C2=B1  2%      +6.6%       1280 =C2=B1  7%      +9.2%       131=
1 =C2=B1 13%  interrupts.CPU73.CAL:Function_call_interrupts
    602472            -4.0%     578296 =C2=B1 10%      -7.3%     558741 =C2=
=B1 18%  interrupts.CPU73.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU73.MCP:Machine_check_polls
    287.17 =C2=B1 36%      -4.3%     274.86 =C2=B1 39%     +11.8%     321.1=
4 =C2=B1 37%  interrupts.CPU73.NMI:Non-maskable_interrupts
    287.17 =C2=B1 36%      -4.3%     274.86 =C2=B1 39%     +11.8%     321.1=
4 =C2=B1 37%  interrupts.CPU73.PMI:Performance_monitoring_interrupts
      7.00 =C2=B1 40%    +185.7%      20.00 =C2=B1 57%     +95.9%      13.7=
1 =C2=B1 59%  interrupts.CPU73.RES:Rescheduling_interrupts
     11.83 =C2=B1 72%      -3.4%      11.43 =C2=B1 19%     -13.1%      10.2=
9 =C2=B1 37%  interrupts.CPU73.TLB:TLB_shootdowns
      1324 =C2=B1  5%      +9.7%       1453 =C2=B1 14%      +1.4%       134=
2 =C2=B1  6%  interrupts.CPU74.CAL:Function_call_interrupts
    602204            -3.6%     580299 =C2=B1  9%      -7.2%     559071 =C2=
=B1 18%  interrupts.CPU74.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU74.MCP:Machine_check_polls
    243.67 =C2=B1 31%      -4.2%     233.43 =C2=B1 31%     +27.8%     311.4=
3 =C2=B1 36%  interrupts.CPU74.NMI:Non-maskable_interrupts
    243.67 =C2=B1 31%      -4.2%     233.43 =C2=B1 31%     +27.8%     311.4=
3 =C2=B1 36%  interrupts.CPU74.PMI:Performance_monitoring_interrupts
     23.67 =C2=B1 55%     +17.7%      27.86 =C2=B1 39%     +20.1%      28.4=
3 =C2=B1 56%  interrupts.CPU74.RES:Rescheduling_interrupts
     25.83 =C2=B1 29%     -11.0%      23.00 =C2=B1 28%     -20.9%      20.4=
3 =C2=B1 34%  interrupts.CPU74.TLB:TLB_shootdowns
      1246            +1.8%       1268 =C2=B1  3%      +1.8%       1269 =C2=
=B1  2%  interrupts.CPU75.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  interrupts.CPU75.IWI:IRQ_work_interrupts
    602217            -4.3%     576263 =C2=B1 11%      -7.2%     558787 =C2=
=B1 18%  interrupts.CPU75.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU75.MCP:Machine_check_polls
    280.67 =C2=B1 33%      +4.4%     293.00 =C2=B1 31%    +120.6%     619.1=
4 =C2=B1120%  interrupts.CPU75.NMI:Non-maskable_interrupts
    280.67 =C2=B1 33%      +4.4%     293.00 =C2=B1 31%    +120.6%     619.1=
4 =C2=B1120%  interrupts.CPU75.PMI:Performance_monitoring_interrupts
     14.67 =C2=B1 49%     +45.1%      21.29 =C2=B1 36%     +15.9%      17.0=
0 =C2=B1 38%  interrupts.CPU75.RES:Rescheduling_interrupts
     13.33 =C2=B1 28%      +0.7%      13.43 =C2=B1 22%      +5.0%      14.0=
0 =C2=B1 45%  interrupts.CPU75.TLB:TLB_shootdowns
      1282 =C2=B1  3%      -0.4%       1277 =C2=B1  4%      +3.5%       132=
6 =C2=B1  9%  interrupts.CPU76.CAL:Function_call_interrupts
    602290            -5.2%     570942 =C2=B1 13%      -7.2%     559186 =C2=
=B1 18%  interrupts.CPU76.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU76.MCP:Machine_check_polls
    314.50 =C2=B1 34%     -34.1%     207.14 =C2=B1  7%     -22.1%     245.1=
4 =C2=B1 31%  interrupts.CPU76.NMI:Non-maskable_interrupts
    314.50 =C2=B1 34%     -34.1%     207.14 =C2=B1  7%     -22.1%     245.1=
4 =C2=B1 31%  interrupts.CPU76.PMI:Performance_monitoring_interrupts
     16.50 =C2=B1 51%      +1.3%      16.71 =C2=B1 43%     +35.9%      22.4=
3 =C2=B1 91%  interrupts.CPU76.RES:Rescheduling_interrupts
     13.33 =C2=B1 24%     +28.6%      17.14 =C2=B1 30%     +27.5%      17.0=
0 =C2=B1 62%  interrupts.CPU76.TLB:TLB_shootdowns
      1250 =C2=B1  3%      -1.3%       1234 =C2=B1  4%      +0.0%       125=
0 =C2=B1  3%  interrupts.CPU77.CAL:Function_call_interrupts
    602138            -5.2%     571128 =C2=B1 13%      -7.2%     559068 =C2=
=B1 18%  interrupts.CPU77.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU77.MCP:Machine_check_polls
    283.67 =C2=B1 37%     -15.4%     239.86 =C2=B1 30%      -4.3%     271.4=
3 =C2=B1 35%  interrupts.CPU77.NMI:Non-maskable_interrupts
    283.67 =C2=B1 37%     -15.4%     239.86 =C2=B1 30%      -4.3%     271.4=
3 =C2=B1 35%  interrupts.CPU77.PMI:Performance_monitoring_interrupts
     11.83 =C2=B1 46%     -30.0%       8.29 =C2=B1 55%      +9.9%      13.0=
0 =C2=B1 56%  interrupts.CPU77.RES:Rescheduling_interrupts
     13.00 =C2=B1 35%      -2.2%      12.71 =C2=B1 28%     -15.4%      11.0=
0 =C2=B1 35%  interrupts.CPU77.TLB:TLB_shootdowns
      1336 =C2=B1 14%      +1.1%       1351 =C2=B1 11%      -1.8%       131=
2 =C2=B1 13%  interrupts.CPU78.CAL:Function_call_interrupts
    602118            -3.1%     583719 =C2=B1  7%      -7.1%     559147 =C2=
=B1 18%  interrupts.CPU78.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU78.MCP:Machine_check_polls
    315.67 =C2=B1 32%     -13.3%     273.57 =C2=B1 38%      -8.9%     287.5=
7 =C2=B1 41%  interrupts.CPU78.NMI:Non-maskable_interrupts
    315.67 =C2=B1 32%     -13.3%     273.57 =C2=B1 38%      -8.9%     287.5=
7 =C2=B1 41%  interrupts.CPU78.PMI:Performance_monitoring_interrupts
     29.00 =C2=B1 87%     -23.2%      22.29 =C2=B1 99%     -19.7%      23.2=
9 =C2=B1140%  interrupts.CPU78.RES:Rescheduling_interrupts
     15.50 =C2=B1 17%      -6.9%      14.43 =C2=B1 25%     -17.1%      12.8=
6 =C2=B1 17%  interrupts.CPU78.TLB:TLB_shootdowns
      1289 =C2=B1  4%      -2.1%       1262 =C2=B1  7%     +10.2%       142=
1 =C2=B1 25%  interrupts.CPU79.CAL:Function_call_interrupts
    602079            -3.1%     583124 =C2=B1  8%      -7.1%     559223 =C2=
=B1 18%  interrupts.CPU79.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU79.MCP:Machine_check_polls
    327.33 =C2=B1 32%     -15.2%     277.43 =C2=B1 36%      -5.0%     311.0=
0 =C2=B1 34%  interrupts.CPU79.NMI:Non-maskable_interrupts
    327.33 =C2=B1 32%     -15.2%     277.43 =C2=B1 36%      -5.0%     311.0=
0 =C2=B1 34%  interrupts.CPU79.PMI:Performance_monitoring_interrupts
     18.50 =C2=B1 38%     -30.5%      12.86 =C2=B1123%     -22.0%      14.4=
3 =C2=B1 67%  interrupts.CPU79.RES:Rescheduling_interrupts
     13.33 =C2=B1 34%     -10.0%      12.00 =C2=B1 23%     -25.0%      10.0=
0 =C2=B1 23%  interrupts.CPU79.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU8.18:IR-IO-APIC.18-fasteoi.ehci_hcd:usb1,ehci_hcd:usb2,i801_sm=
bus
      1692 =C2=B1 17%     +21.5%       2055 =C2=B1 39%     +12.1%       189=
6 =C2=B1 28%  interrupts.CPU8.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B124=
4%  interrupts.CPU8.IWI:IRQ_work_interrupts
    602202            -1.0%     596078 =C2=B1  2%      -7.1%     559161 =C2=
=B1 18%  interrupts.CPU8.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU8.MCP:Machine_check_polls
    212.00 =C2=B1 34%     +29.2%     274.00 =C2=B1 31%     +60.6%     340.5=
7 =C2=B1 31%  interrupts.CPU8.NMI:Non-maskable_interrupts
    212.00 =C2=B1 34%     +29.2%     274.00 =C2=B1 31%     +60.6%     340.5=
7 =C2=B1 31%  interrupts.CPU8.PMI:Performance_monitoring_interrupts
     40.00 =C2=B1 32%    +123.2%      89.29 =C2=B1 84%     +49.6%      59.8=
6 =C2=B1 51%  interrupts.CPU8.RES:Rescheduling_interrupts
     67.83 =C2=B1 22%      -4.8%      64.57 =C2=B1 24%     -14.7%      57.8=
6 =C2=B1 43%  interrupts.CPU8.TLB:TLB_shootdowns
      1208 =C2=B1 14%      +5.6%       1276 =C2=B1  4%      +6.2%       128=
3 =C2=B1  5%  interrupts.CPU80.CAL:Function_call_interrupts
    602122            -3.0%     583931 =C2=B1  7%      -7.1%     559166 =C2=
=B1 18%  interrupts.CPU80.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU80.MCP:Machine_check_polls
    282.17 =C2=B1 34%     +15.3%     325.43 =C2=B1 29%     +35.9%     383.4=
3 =C2=B1 48%  interrupts.CPU80.NMI:Non-maskable_interrupts
    282.17 =C2=B1 34%     +15.3%     325.43 =C2=B1 29%     +35.9%     383.4=
3 =C2=B1 48%  interrupts.CPU80.PMI:Performance_monitoring_interrupts
     19.33 =C2=B1 38%     -20.9%      15.29 =C2=B1 58%     -32.0%      13.1=
4 =C2=B1 80%  interrupts.CPU80.RES:Rescheduling_interrupts
     12.17 =C2=B1 32%     +25.6%      15.29 =C2=B1 18%     +75.0%      21.2=
9 =C2=B1103%  interrupts.CPU80.TLB:TLB_shootdowns
      1278 =C2=B1  9%      +2.0%       1304 =C2=B1  8%      -3.5%       123=
3 =C2=B1  2%  interrupts.CPU81.CAL:Function_call_interrupts
    602228            -3.3%     582313 =C2=B1  8%      -7.2%     558962 =C2=
=B1 18%  interrupts.CPU81.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU81.MCP:Machine_check_polls
    310.50 =C2=B1 32%      -3.1%     301.00 =C2=B1 38%     -11.2%     275.5=
7 =C2=B1 36%  interrupts.CPU81.NMI:Non-maskable_interrupts
    310.50 =C2=B1 32%      -3.1%     301.00 =C2=B1 38%     -11.2%     275.5=
7 =C2=B1 36%  interrupts.CPU81.PMI:Performance_monitoring_interrupts
     11.83 =C2=B1 93%     -15.5%      10.00 =C2=B1 24%     -22.7%       9.1=
4 =C2=B1 46%  interrupts.CPU81.RES:Rescheduling_interrupts
      7.83 =C2=B1 20%     +55.0%      12.14 =C2=B1 22%     +29.5%      10.1=
4 =C2=B1 47%  interrupts.CPU81.TLB:TLB_shootdowns
      1380 =C2=B1  9%      -6.1%       1296 =C2=B1  5%      -8.2%       126=
6 =C2=B1  3%  interrupts.CPU82.CAL:Function_call_interrupts
    602316            -0.6%     598413            -7.2%     559019 =C2=B1 1=
8%  interrupts.CPU82.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU82.MCP:Machine_check_polls
    317.00 =C2=B1 33%     -23.3%     243.00 =C2=B1 35%     -22.4%     246.0=
0 =C2=B1 31%  interrupts.CPU82.NMI:Non-maskable_interrupts
    317.00 =C2=B1 33%     -23.3%     243.00 =C2=B1 35%     -22.4%     246.0=
0 =C2=B1 31%  interrupts.CPU82.PMI:Performance_monitoring_interrupts
     19.83 =C2=B1 50%     -12.1%      17.43 =C2=B1 55%     -16.4%      16.5=
7 =C2=B1 59%  interrupts.CPU82.RES:Rescheduling_interrupts
     17.83 =C2=B1 41%      -6.3%      16.71 =C2=B1 36%      -3.9%      17.1=
4 =C2=B1 32%  interrupts.CPU82.TLB:TLB_shootdowns
      1276 =C2=B1  8%     +11.1%       1417 =C2=B1 12%      +3.7%       132=
3 =C2=B1  8%  interrupts.CPU83.CAL:Function_call_interrupts
      0.00       +2.9e+101%       0.29 =C2=B1244% +1.4e+101%       0.14 =C2=
=B1244%  interrupts.CPU83.IWI:IRQ_work_interrupts
    602154            -2.9%     584916 =C2=B1  7%      -7.2%     558922 =C2=
=B1 18%  interrupts.CPU83.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU83.MCP:Machine_check_polls
    241.83 =C2=B1 30%     +13.6%     274.71 =C2=B1 39%     +97.6%     477.8=
6 =C2=B1 85%  interrupts.CPU83.NMI:Non-maskable_interrupts
    241.83 =C2=B1 30%     +13.6%     274.71 =C2=B1 39%     +97.6%     477.8=
6 =C2=B1 85%  interrupts.CPU83.PMI:Performance_monitoring_interrupts
     15.67 =C2=B1 71%     +83.3%      28.71 =C2=B1 89%     -23.4%      12.0=
0 =C2=B1 37%  interrupts.CPU83.RES:Rescheduling_interrupts
     13.33 =C2=B1 67%     -25.0%      10.00 =C2=B1 28%     -19.6%      10.7=
1 =C2=B1 25%  interrupts.CPU83.TLB:TLB_shootdowns
      1274 =C2=B1  2%      +5.1%       1339 =C2=B1  5%      -0.1%       127=
2 =C2=B1  4%  interrupts.CPU84.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +4.3e+101%       0.43 =C2=B124=
4%  interrupts.CPU84.IWI:IRQ_work_interrupts
    601433            -3.9%     578151 =C2=B1 10%      -7.0%     559153 =C2=
=B1 18%  interrupts.CPU84.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU84.MCP:Machine_check_polls
    280.67 =C2=B1 33%      -1.4%     276.71 =C2=B1 30%     +23.9%     347.8=
6 =C2=B1 27%  interrupts.CPU84.NMI:Non-maskable_interrupts
    280.67 =C2=B1 33%      -1.4%     276.71 =C2=B1 30%     +23.9%     347.8=
6 =C2=B1 27%  interrupts.CPU84.PMI:Performance_monitoring_interrupts
     15.67 =C2=B1 37%     +79.6%      28.14 =C2=B1 49%     -19.8%      12.5=
7 =C2=B1 41%  interrupts.CPU84.RES:Rescheduling_interrupts
     14.83 =C2=B1 31%      +4.0%      15.43 =C2=B1 36%      -2.7%      14.4=
3 =C2=B1 31%  interrupts.CPU84.TLB:TLB_shootdowns
      1288 =C2=B1  6%     +13.0%       1456 =C2=B1 34%      -0.1%       128=
7 =C2=B1 11%  interrupts.CPU85.CAL:Function_call_interrupts
    602121            -3.8%     579004 =C2=B1  9%      -7.1%     559283 =C2=
=B1 18%  interrupts.CPU85.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU85.MCP:Machine_check_polls
    270.83 =C2=B1 34%     +31.2%     355.29 =C2=B1 27%      +7.4%     291.0=
0 =C2=B1 37%  interrupts.CPU85.NMI:Non-maskable_interrupts
    270.83 =C2=B1 34%     +31.2%     355.29 =C2=B1 27%      +7.4%     291.0=
0 =C2=B1 37%  interrupts.CPU85.PMI:Performance_monitoring_interrupts
     18.00 =C2=B1 68%     +47.6%      26.57 =C2=B1147%     -46.0%       9.7=
1 =C2=B1 57%  interrupts.CPU85.RES:Rescheduling_interrupts
     16.50 =C2=B1105%     -33.3%      11.00 =C2=B1 20%     -38.5%      10.1=
4 =C2=B1 25%  interrupts.CPU85.TLB:TLB_shootdowns
      1212 =C2=B1 17%      +4.8%       1270 =C2=B1  3%     +14.1%       138=
3 =C2=B1 18%  interrupts.CPU86.CAL:Function_call_interrupts
      0.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU86.IWI:IRQ_work_interrupts
    602087            -0.9%     596837 =C2=B1  2%      -7.1%     559305 =C2=
=B1 18%  interrupts.CPU86.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU86.MCP:Machine_check_polls
    310.33 =C2=B1 30%      -9.5%     280.86 =C2=B1 30%     -14.6%     265.1=
4 =C2=B1 30%  interrupts.CPU86.NMI:Non-maskable_interrupts
    310.33 =C2=B1 30%      -9.5%     280.86 =C2=B1 30%     -14.6%     265.1=
4 =C2=B1 30%  interrupts.CPU86.PMI:Performance_monitoring_interrupts
     18.00 =C2=B1 64%     -15.9%      15.14 =C2=B1 49%     +92.1%      34.5=
7 =C2=B1120%  interrupts.CPU86.RES:Rescheduling_interrupts
     16.83 =C2=B1 34%     -12.6%      14.71 =C2=B1 26%      +1.0%      17.0=
0 =C2=B1 22%  interrupts.CPU86.TLB:TLB_shootdowns
      1242 =C2=B1  2%      +5.3%       1308 =C2=B1 14%      +5.8%       131=
4 =C2=B1 10%  interrupts.CPU87.CAL:Function_call_interrupts
    601988            -0.8%     597009 =C2=B1  2%      -7.1%     559032 =C2=
=B1 18%  interrupts.CPU87.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU87.MCP:Machine_check_polls
    273.83 =C2=B1 26%     -27.0%     199.86 =C2=B1 30%     -18.9%     222.0=
0 =C2=B1 33%  interrupts.CPU87.NMI:Non-maskable_interrupts
    273.83 =C2=B1 26%     -27.0%     199.86 =C2=B1 30%     -18.9%     222.0=
0 =C2=B1 33%  interrupts.CPU87.PMI:Performance_monitoring_interrupts
     10.17 =C2=B1 38%     +53.2%      15.57 =C2=B1149%     +95.3%      19.8=
6 =C2=B1 77%  interrupts.CPU87.RES:Rescheduling_interrupts
     10.67 =C2=B1 21%     +54.0%      16.43 =C2=B1 84%     +21.9%      13.0=
0 =C2=B1 41%  interrupts.CPU87.TLB:TLB_shootdowns
      1379 =C2=B1 11%      -3.6%       1329 =C2=B1  9%      -2.7%       134=
1 =C2=B1  9%  interrupts.CPU88.CAL:Function_call_interrupts
    602188            -1.1%     595263 =C2=B1  2%      -7.1%     559138 =C2=
=B1 18%  interrupts.CPU88.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU88.MCP:Machine_check_polls
    287.50 =C2=B1 31%     -16.4%     240.43 =C2=B1 30%      +5.2%     302.4=
3 =C2=B1 33%  interrupts.CPU88.NMI:Non-maskable_interrupts
    287.50 =C2=B1 31%     -16.4%     240.43 =C2=B1 30%      +5.2%     302.4=
3 =C2=B1 33%  interrupts.CPU88.PMI:Performance_monitoring_interrupts
     30.17 =C2=B1 99%     -41.3%      17.71 =C2=B1 38%     -34.2%      19.8=
6 =C2=B1 37%  interrupts.CPU88.RES:Rescheduling_interrupts
     12.50 =C2=B1 31%     +54.3%      19.29 =C2=B1 32%     +31.4%      16.4=
3 =C2=B1 19%  interrupts.CPU88.TLB:TLB_shootdowns
      1309 =C2=B1 10%      -7.1%       1217            -5.6%       1235 =C2=
=B1  3%  interrupts.CPU89.CAL:Function_call_interrupts
    602215            -2.3%     588477 =C2=B1  5%      -7.1%     559257 =C2=
=B1 18%  interrupts.CPU89.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU89.MCP:Machine_check_polls
    266.67 =C2=B1 35%      -5.9%     251.00 =C2=B1 31%      -2.7%     259.4=
3 =C2=B1 33%  interrupts.CPU89.NMI:Non-maskable_interrupts
    266.67 =C2=B1 35%      -5.9%     251.00 =C2=B1 31%      -2.7%     259.4=
3 =C2=B1 33%  interrupts.CPU89.PMI:Performance_monitoring_interrupts
     14.50 =C2=B1 27%     -22.2%      11.29 =C2=B1 47%     -36.9%       9.1=
4 =C2=B1 47%  interrupts.CPU89.RES:Rescheduling_interrupts
      9.00 =C2=B1 16%     +14.3%      10.29 =C2=B1 23%      +9.5%       9.8=
6 =C2=B1 27%  interrupts.CPU89.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU9.41:IR-PCI-MSI.327680-edge.xhci_hcd
      1389 =C2=B1  4%     +18.0%       1639 =C2=B1 33%      -4.5%       132=
6 =C2=B1  4%  interrupts.CPU9.CAL:Function_call_interrupts
    602250            -1.0%     596073 =C2=B1  2%      -7.1%     559252 =C2=
=B1 18%  interrupts.CPU9.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU9.MCP:Machine_check_polls
    235.67 =C2=B1 35%      -5.4%     223.00 =C2=B1 33%     +15.8%     272.8=
6 =C2=B1 36%  interrupts.CPU9.NMI:Non-maskable_interrupts
    235.67 =C2=B1 35%      -5.4%     223.00 =C2=B1 33%     +15.8%     272.8=
6 =C2=B1 36%  interrupts.CPU9.PMI:Performance_monitoring_interrupts
     27.67 =C2=B1 38%     +69.4%      46.86 =C2=B1137%     -27.2%      20.1=
4 =C2=B1 59%  interrupts.CPU9.RES:Rescheduling_interrupts
     23.67 =C2=B1 28%     -17.9%      19.43 =C2=B1 31%     -27.6%      17.1=
4 =C2=B1 44%  interrupts.CPU9.TLB:TLB_shootdowns
      1328 =C2=B1  7%      -5.2%       1260            -4.5%       1268 =C2=
=B1  3%  interrupts.CPU90.CAL:Function_call_interrupts
      0.00       +7.1e+101%       0.71 =C2=B1244%    -100.0%       0.00    =
    interrupts.CPU90.IWI:IRQ_work_interrupts
    602308            -3.1%     583689 =C2=B1  7%      -7.2%     559102 =C2=
=B1 18%  interrupts.CPU90.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU90.MCP:Machine_check_polls
    320.83 =C2=B1 32%     +19.0%     381.71 =C2=B1 29%      -6.8%     298.8=
6 =C2=B1 41%  interrupts.CPU90.NMI:Non-maskable_interrupts
    320.83 =C2=B1 32%     +19.0%     381.71 =C2=B1 29%      -6.8%     298.8=
6 =C2=B1 41%  interrupts.CPU90.PMI:Performance_monitoring_interrupts
     24.83 =C2=B1 54%     -35.0%      16.14 =C2=B1 38%     -30.4%      17.2=
9 =C2=B1 55%  interrupts.CPU90.RES:Rescheduling_interrupts
     17.33 =C2=B1 29%      -7.7%      16.00 =C2=B1 26%     +13.7%      19.7=
1 =C2=B1 41%  interrupts.CPU90.TLB:TLB_shootdowns
      1229            +2.7%       1262 =C2=B1  5%      +0.1%       1231    =
    interrupts.CPU91.CAL:Function_call_interrupts
      0.00       +1.4e+101%       0.14 =C2=B1244%    -100.0%       0.00    =
    interrupts.CPU91.IWI:IRQ_work_interrupts
    602232            -2.5%     587118 =C2=B1  6%      -7.2%     559058 =C2=
=B1 18%  interrupts.CPU91.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU91.MCP:Machine_check_polls
    285.67 =C2=B1 37%    +254.6%       1013 =C2=B1176%      +5.9%     302.5=
7 =C2=B1 33%  interrupts.CPU91.NMI:Non-maskable_interrupts
    285.67 =C2=B1 37%    +254.6%       1013 =C2=B1176%      +5.9%     302.5=
7 =C2=B1 33%  interrupts.CPU91.PMI:Performance_monitoring_interrupts
     11.67 =C2=B1 44%     -10.6%      10.43 =C2=B1 31%      +9.0%      12.7=
1 =C2=B1 61%  interrupts.CPU91.RES:Rescheduling_interrupts
     10.50 =C2=B1 18%     -10.2%       9.43 =C2=B1 19%     +10.2%      11.5=
7 =C2=B1 16%  interrupts.CPU91.TLB:TLB_shootdowns
      1291 =C2=B1  8%      +0.3%       1295 =C2=B1  6%      -1.9%       126=
7 =C2=B1  3%  interrupts.CPU92.CAL:Function_call_interrupts
    602168            -0.4%     599542            -7.1%     559288 =C2=B1 1=
8%  interrupts.CPU92.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU92.MCP:Machine_check_polls
    206.67 =C2=B1 29%     +31.2%     271.14 =C2=B1 37%     +12.9%     233.4=
3 =C2=B1 33%  interrupts.CPU92.NMI:Non-maskable_interrupts
    206.67 =C2=B1 29%     +31.2%     271.14 =C2=B1 37%     +12.9%     233.4=
3 =C2=B1 33%  interrupts.CPU92.PMI:Performance_monitoring_interrupts
     12.00 =C2=B1 41%     +46.4%      17.57 =C2=B1 62%     +23.8%      14.8=
6 =C2=B1 36%  interrupts.CPU92.RES:Rescheduling_interrupts
     14.67 =C2=B1 17%     +14.9%      16.86 =C2=B1 38%     +30.5%      19.1=
4 =C2=B1 46%  interrupts.CPU92.TLB:TLB_shootdowns
      1267 =C2=B1  7%      -2.9%       1230 =C2=B1  3%      -0.4%       126=
2 =C2=B1  4%  interrupts.CPU93.CAL:Function_call_interrupts
    602111            -0.5%     599385            -7.1%     559164 =C2=B1 1=
8%  interrupts.CPU93.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU93.MCP:Machine_check_polls
    227.00 =C2=B1 35%      -8.3%     208.14 =C2=B1 39%      -0.4%     226.1=
4 =C2=B1 32%  interrupts.CPU93.NMI:Non-maskable_interrupts
    227.00 =C2=B1 35%      -8.3%     208.14 =C2=B1 39%      -0.4%     226.1=
4 =C2=B1 32%  interrupts.CPU93.PMI:Performance_monitoring_interrupts
     19.00 =C2=B1 70%     -42.1%      11.00 =C2=B1 41%     -33.1%      12.7=
1 =C2=B1 41%  interrupts.CPU93.RES:Rescheduling_interrupts
     11.67 =C2=B1 17%     -19.2%       9.43 =C2=B1 27%      +0.4%      11.7=
1 =C2=B1 43%  interrupts.CPU93.TLB:TLB_shootdowns
      1281 =C2=B1  8%      -0.5%       1274 =C2=B1  2%      +2.1%       130=
7 =C2=B1  5%  interrupts.CPU94.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +7.1e+101%       0.71 =C2=B124=
4%  interrupts.CPU94.IWI:IRQ_work_interrupts
    602120            -3.1%     583511 =C2=B1  7%      -7.2%     558901 =C2=
=B1 18%  interrupts.CPU94.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU94.MCP:Machine_check_polls
    282.33 =C2=B1 32%      -4.1%     270.86 =C2=B1 28%     +14.8%     324.0=
0 =C2=B1 38%  interrupts.CPU94.NMI:Non-maskable_interrupts
    282.33 =C2=B1 32%      -4.1%     270.86 =C2=B1 28%     +14.8%     324.0=
0 =C2=B1 38%  interrupts.CPU94.PMI:Performance_monitoring_interrupts
     21.00 =C2=B1112%     -36.7%      13.29 =C2=B1 66%     -19.0%      17.0=
0 =C2=B1 49%  interrupts.CPU94.RES:Rescheduling_interrupts
     11.17 =C2=B1 37%     +35.6%      15.14 =C2=B1 30%     +49.7%      16.7=
1 =C2=B1 30%  interrupts.CPU94.TLB:TLB_shootdowns
      1335 =C2=B1 11%      -4.4%       1276 =C2=B1  5%     +10.2%       147=
2 =C2=B1 39%  interrupts.CPU95.CAL:Function_call_interrupts
      0.00       +2.9e+101%       0.29 =C2=B1244%    -100.0%       0.00    =
    interrupts.CPU95.IWI:IRQ_work_interrupts
    602146            -3.1%     583301 =C2=B1  7%      -7.2%     559061 =C2=
=B1 18%  interrupts.CPU95.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU95.MCP:Machine_check_polls
    305.67 =C2=B1 32%     +31.2%     401.00 =C2=B1101%      -2.1%     299.1=
4 =C2=B1 33%  interrupts.CPU95.NMI:Non-maskable_interrupts
    305.67 =C2=B1 32%     +31.2%     401.00 =C2=B1101%      -2.1%     299.1=
4 =C2=B1 33%  interrupts.CPU95.PMI:Performance_monitoring_interrupts
     27.17 =C2=B1 85%     -61.6%      10.43 =C2=B1 74%     -60.6%      10.7=
1 =C2=B1 45%  interrupts.CPU95.RES:Rescheduling_interrupts
     10.33 =C2=B1 44%     -11.5%       9.14 =C2=B1 26%     +18.9%      12.2=
9 =C2=B1 30%  interrupts.CPU95.TLB:TLB_shootdowns
      1615 =C2=B1 36%     -21.0%       1276 =C2=B1  8%     -17.2%       133=
7 =C2=B1  7%  interrupts.CPU96.CAL:Function_call_interrupts
    602309            -5.1%     571319 =C2=B1 13%      -7.2%     559101 =C2=
=B1 18%  interrupts.CPU96.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU96.MCP:Machine_check_polls
    315.67 =C2=B1 36%      +2.7%     324.29 =C2=B1 28%      -5.7%     297.5=
7 =C2=B1 32%  interrupts.CPU96.NMI:Non-maskable_interrupts
    315.67 =C2=B1 36%      +2.7%     324.29 =C2=B1 28%      -5.7%     297.5=
7 =C2=B1 32%  interrupts.CPU96.PMI:Performance_monitoring_interrupts
     60.17 =C2=B1102%     -86.0%       8.43 =C2=B1 33%     -69.4%      18.4=
3 =C2=B1 29%  interrupts.CPU96.RES:Rescheduling_interrupts
     15.67 =C2=B1 28%      -2.4%      15.29 =C2=B1 14%     +14.9%      18.0=
0 =C2=B1 30%  interrupts.CPU96.TLB:TLB_shootdowns
      1565 =C2=B1 31%     -19.6%       1258 =C2=B1  4%     -18.1%       128=
1 =C2=B1 10%  interrupts.CPU97.CAL:Function_call_interrupts
      0.00       +7.1e+101%       0.71 =C2=B1244%    -100.0%       0.00    =
    interrupts.CPU97.IWI:IRQ_work_interrupts
    602145            -5.3%     570278 =C2=B1 13%      -7.1%     559161 =C2=
=B1 18%  interrupts.CPU97.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU97.MCP:Machine_check_polls
    279.50 =C2=B1 31%     +11.2%     310.71 =C2=B1 33%      -0.9%     277.0=
0 =C2=B1 33%  interrupts.CPU97.NMI:Non-maskable_interrupts
    279.50 =C2=B1 31%     +11.2%     310.71 =C2=B1 33%      -0.9%     277.0=
0 =C2=B1 33%  interrupts.CPU97.PMI:Performance_monitoring_interrupts
     48.00 =C2=B1116%     -80.4%       9.43 =C2=B1 60%     -78.9%      10.1=
4 =C2=B1 45%  interrupts.CPU97.RES:Rescheduling_interrupts
     10.17 =C2=B1 23%      +2.6%      10.43 =C2=B1 27%      +9.6%      11.1=
4 =C2=B1 36%  interrupts.CPU97.TLB:TLB_shootdowns
      1283 =C2=B1  2%      -0.8%       1272 =C2=B1  3%      +2.7%       131=
8 =C2=B1  7%  interrupts.CPU98.CAL:Function_call_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU98.IWI:IRQ_work_interrupts
    602235            -3.3%     582199 =C2=B1  8%      -7.1%     559237 =C2=
=B1 18%  interrupts.CPU98.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU98.MCP:Machine_check_polls
    608.83 =C2=B1118%     -51.7%     294.29 =C2=B1 36%     -50.6%     301.0=
0 =C2=B1 35%  interrupts.CPU98.NMI:Non-maskable_interrupts
    608.83 =C2=B1118%     -51.7%     294.29 =C2=B1 36%     -50.6%     301.0=
0 =C2=B1 35%  interrupts.CPU98.PMI:Performance_monitoring_interrupts
     15.67 =C2=B1 28%      +7.6%      16.86 =C2=B1 38%      +7.6%      16.8=
6 =C2=B1 36%  interrupts.CPU98.RES:Rescheduling_interrupts
     12.17 =C2=B1 34%     +19.8%      14.57 =C2=B1 17%     +23.3%      15.0=
0 =C2=B1 11%  interrupts.CPU98.TLB:TLB_shootdowns
      1373 =C2=B1 23%      -3.9%       1319 =C2=B1 10%      -1.1%       135=
8 =C2=B1 16%  interrupts.CPU99.CAL:Function_call_interrupts
      1.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU99.IWI:IRQ_work_interrupts
    602442            -2.9%     584865 =C2=B1  7%      -7.3%     558540 =C2=
=B1 18%  interrupts.CPU99.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU99.MCP:Machine_check_polls
    297.67 =C2=B1 42%     -11.9%     262.14 =C2=B1 30%     +19.0%     354.1=
4 =C2=B1 59%  interrupts.CPU99.NMI:Non-maskable_interrupts
    297.67 =C2=B1 42%     -11.9%     262.14 =C2=B1 30%     +19.0%     354.1=
4 =C2=B1 59%  interrupts.CPU99.PMI:Performance_monitoring_interrupts
      8.67 =C2=B1 32%    +195.1%      25.57 =C2=B1121%     +92.9%      16.7=
1 =C2=B1 86%  interrupts.CPU99.RES:Rescheduling_interrupts
     11.33 =C2=B1 32%     +45.0%      16.43 =C2=B1 96%     +34.9%      15.2=
9 =C2=B1 77%  interrupts.CPU99.TLB:TLB_shootdowns
      8.00 =C2=B1 22%      +8.9%       8.71 =C2=B1 13%      +1.8%       8.1=
4 =C2=B1 12%  interrupts.IWI:IRQ_work_interrupts
 1.541e+08            -2.2%  1.508e+08 =C2=B1  5%      -7.1%  1.431e+08 =C2=
=B1 18%  interrupts.LOC:Local_timer_interrupts
    256.00            +0.0%     256.00            +0.0%     256.00        i=
nterrupts.MCP:Machine_check_polls
     74199 =C2=B1  3%      -2.4%      72441 =C2=B1  2%      -7.8%      6841=
4 =C2=B1 16%  interrupts.NMI:Non-maskable_interrupts
     74199 =C2=B1  3%      -2.4%      72441 =C2=B1  2%      -7.8%      6841=
4 =C2=B1 16%  interrupts.PMI:Performance_monitoring_interrupts
      5638 =C2=B1  2%      +6.6%       6011 =C2=B1  7%      +3.1%       581=
3 =C2=B1  9%  interrupts.RES:Rescheduling_interrupts
      5247 =C2=B1  4%      +4.1%       5461 =C2=B1  4%      +1.8%       534=
3 =C2=B1  5%  interrupts.TLB:TLB_shootdowns



> =

> > On Apr 29, 2021, at 18:25, Roman Gushchin <guro@fb.com> wrote:
> > =

> > =EF=BB=BFOn Tue, Apr 27, 2021 at 03:34:48PM +0800, kernel test robot wr=
ote:
> >> =

> >> =

> >> Greeting,
> >> =

> >> FYI, we noticed a -2.3% regression of aim9.sync_disk_rw.ops_per_sec du=
e to commit:
> > =

> > Wow, that's very surprising, given that there are no pcpu allocations o=
n any hot
> > paths there.
> > =

> > I tried hard to reproduce it, and I think I see something, however the =
data is
> > very noisy. I'm not sure I can confidently attribute the regression to
> > ace7e70901 ("percpu: use reclaim threshold instead of running for every=
 page")
> > rather than
> > f183324133 ("percpu: implement partial chunk depopulation").
> > =

> > Anyway, in my setup the following patch seems to fix the regression.
> > Is it possible to test it?
> > =

> > Thank you!
> > =

> > Roman
> > =

> > --
> > =

> > From 6ee182110126cf93cf43389923bcf49ba12cb9a0 Mon Sep 17 00:00:00 2001
> > From: Roman Gushchin <guro@fb.com>
> > Date: Thu, 29 Apr 2021 18:01:40 -0700
> > Subject: [PATCH] percpu: optimize locking in pcpu_balance_workfn()
> > =

> > pcpu_balance_workfn() unconditionally calls pcpu_balance_free(),
> > pcpu_reclaim_populated(), pcpu_balance_populated() and
> > pcpu_balance_free() again.
> > =

> > Each call to pcpu_balance_free() and pcpu_reclaim_populated() will
> > cause at least one acquisition of the pcpu_lock. So even if the
> > balancing was scheduled because of a failed atomic allocation,
> > pcpu_lock will be acquired at least 4 times. This obviously
> > increases the contention on the pcpu_lock.
> > =

> > To optimize the scheme let's grab the pcpu_lock on the upper level
> > (in pcpu_balance_workfn()) and keep it generally locked for the whole
> > duration of the scheduled work, but release conditionally to perform
> > any slow operations like chunk (de)population and creation of new chunk=
s.
> > =

> > Signed-off-by: Roman Gushchin <guro@fb.com>
> > ---
> > mm/percpu.c | 41 +++++++++++++++++++++++++++++------------
> > 1 file changed, 29 insertions(+), 12 deletions(-)
> > =

> > diff --git a/mm/percpu.c b/mm/percpu.c
> > index 245d89f6f0a9..f6bc8157cb3e 100644
> > --- a/mm/percpu.c
> > +++ b/mm/percpu.c
> > @@ -2005,6 +2005,9 @@ void __percpu *__alloc_reserved_percpu(size_t siz=
e, size_t align)
> >  * If empty_only is %false, reclaim all fully free chunks regardless of=
 the
> >  * number of populated pages.  Otherwise, only reclaim chunks that have=
 no
> >  * populated pages.
> > + *
> > + * CONTEXT:
> > + * pcpu_lock (can be dropped temporarily)
> >  */
> > static void pcpu_balance_free(enum pcpu_chunk_type type, bool empty_onl=
y)
> > {
> > @@ -2013,12 +2016,12 @@ static void pcpu_balance_free(enum pcpu_chunk_t=
ype type, bool empty_only)
> >    struct list_head *free_head =3D &pcpu_slot[pcpu_free_slot];
> >    struct pcpu_chunk *chunk, *next;
> > =

> > +    lockdep_assert_held(&pcpu_lock);
> > +
> >    /*
> >     * There's no reason to keep around multiple unused chunks and VM
> >     * areas can be scarce.  Destroy all free chunks except for one.
> >     */
> > -    spin_lock_irq(&pcpu_lock);
> > -
> >    list_for_each_entry_safe(chunk, next, free_head, list) {
> >        WARN_ON(chunk->immutable);
> > =

> > @@ -2030,8 +2033,10 @@ static void pcpu_balance_free(enum pcpu_chunk_ty=
pe type, bool empty_only)
> >            list_move(&chunk->list, &to_free);
> >    }
> > =

> > -    spin_unlock_irq(&pcpu_lock);
> > +    if (list_empty(&to_free))
> > +        return;
> > =

> > +    spin_unlock_irq(&pcpu_lock);
> >    list_for_each_entry_safe(chunk, next, &to_free, list) {
> >        unsigned int rs, re;
> > =

> > @@ -2045,6 +2050,7 @@ static void pcpu_balance_free(enum pcpu_chunk_typ=
e type, bool empty_only)
> >        pcpu_destroy_chunk(chunk);
> >        cond_resched();
> >    }
> > +    spin_lock_irq(&pcpu_lock);
> > }
> > =

> > /**
> > @@ -2056,6 +2062,9 @@ static void pcpu_balance_free(enum pcpu_chunk_typ=
e type, bool empty_only)
> >  * OOM killer to be triggered.  We should avoid doing so until an actual
> >  * allocation causes the failure as it is possible that requests can be
> >  * serviced from already backed regions.
> > + *
> > + * CONTEXT:
> > + * pcpu_lock (can be dropped temporarily)
> >  */
> > static void pcpu_balance_populated(enum pcpu_chunk_type type)
> > {
> > @@ -2065,6 +2074,8 @@ static void pcpu_balance_populated(enum pcpu_chun=
k_type type)
> >    struct pcpu_chunk *chunk;
> >    int slot, nr_to_pop, ret;
> > =

> > +    lockdep_assert_held(&pcpu_lock);
> > +
> >    /*
> >     * Ensure there are certain number of free populated pages for
> >     * atomic allocs.  Fill up from the most packed so that atomic
> > @@ -2092,13 +2103,11 @@ static void pcpu_balance_populated(enum pcpu_ch=
unk_type type)
> >        if (!nr_to_pop)
> >            break;
> > =

> > -        spin_lock_irq(&pcpu_lock);
> >        list_for_each_entry(chunk, &pcpu_slot[slot], list) {
> >            nr_unpop =3D chunk->nr_pages - chunk->nr_populated;
> >            if (nr_unpop)
> >                break;
> >        }
> > -        spin_unlock_irq(&pcpu_lock);
> > =

> >        if (!nr_unpop)
> >            continue;
> > @@ -2108,12 +2117,13 @@ static void pcpu_balance_populated(enum pcpu_ch=
unk_type type)
> >                         chunk->nr_pages) {
> >            int nr =3D min_t(int, re - rs, nr_to_pop);
> > =

> > +            spin_unlock_irq(&pcpu_lock);
> >            ret =3D pcpu_populate_chunk(chunk, rs, rs + nr, gfp);
> > +            cond_resched();
> > +            spin_lock_irq(&pcpu_lock);
> >            if (!ret) {
> >                nr_to_pop -=3D nr;
> > -                spin_lock_irq(&pcpu_lock);
> >                pcpu_chunk_populated(chunk, rs, rs + nr);
> > -                spin_unlock_irq(&pcpu_lock);
> >            } else {
> >                nr_to_pop =3D 0;
> >            }
> > @@ -2125,11 +2135,12 @@ static void pcpu_balance_populated(enum pcpu_ch=
unk_type type)
> > =

> >    if (nr_to_pop) {
> >        /* ran out of chunks to populate, create a new one and retry */
> > +        spin_unlock_irq(&pcpu_lock);
> >        chunk =3D pcpu_create_chunk(type, gfp);
> > +        cond_resched();
> > +        spin_lock_irq(&pcpu_lock);
> >        if (chunk) {
> > -            spin_lock_irq(&pcpu_lock);
> >            pcpu_chunk_relocate(chunk, -1);
> > -            spin_unlock_irq(&pcpu_lock);
> >            goto retry_pop;
> >        }
> >    }
> > @@ -2146,6 +2157,10 @@ static void pcpu_balance_populated(enum pcpu_chu=
nk_type type)
> >  * populated pages threshold, reintegrate the chunk if it has empty fre=
e pages.
> >  * Each chunk is scanned in the reverse order to keep populated pages c=
lose to
> >  * the beginning of the chunk.
> > + *
> > + * CONTEXT:
> > + * pcpu_lock (can be dropped temporarily)
> > + *
> >  */
> > static void pcpu_reclaim_populated(enum pcpu_chunk_type type)
> > {
> > @@ -2155,7 +2170,7 @@ static void pcpu_reclaim_populated(enum pcpu_chun=
k_type type)
> >    LIST_HEAD(to_depopulate);
> >    int i, end;
> > =

> > -    spin_lock_irq(&pcpu_lock);
> > +    lockdep_assert_held(&pcpu_lock);
> > =

> >    list_splice_init(&pcpu_slot[pcpu_to_depopulate_slot], &to_depopulate=
);
> > =

> > @@ -2231,8 +2246,6 @@ static void pcpu_reclaim_populated(enum pcpu_chun=
k_type type)
> >                      &pcpu_slot[pcpu_to_depopulate_slot]);
> >        pcpu_schedule_balance_work();
> >    }
> > -
> > -    spin_unlock_irq(&pcpu_lock);
> > }
> > =

> > /**
> > @@ -2256,10 +2269,14 @@ static void pcpu_balance_workfn(struct work_str=
uct *work)
> >     */
> >    for (type =3D 0; type < PCPU_NR_CHUNK_TYPES; type++) {
> >        mutex_lock(&pcpu_alloc_mutex);
> > +        spin_lock_irq(&pcpu_lock);
> > +
> >        pcpu_balance_free(type, false);
> >        pcpu_reclaim_populated(type);
> >        pcpu_balance_populated(type);
> >        pcpu_balance_free(type, true);
> > +
> > +        spin_unlock_irq(&pcpu_lock);
> >        mutex_unlock(&pcpu_alloc_mutex);
> >    }
> > }
> > -- =

> > 2.30.2
--===============9180785455377231633==--

