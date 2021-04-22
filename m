Content-Type: multipart/mixed; boundary="===============7369619924709513335=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 38ac256d1c: stress-ng.vm-segv.ops_per_sec -13.8% regression
Date: Thu, 22 Apr 2021 15:47:42 +0800
Message-ID: <20210422074742.GE31382@xsang-OptiPlex-9020>
In-Reply-To: <87bla8ue3e.mognet@arm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7369619924709513335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi, Valentin Schneider,

On Wed, Apr 21, 2021 at 11:27:49AM +0100, Valentin Schneider wrote:
> =

> Hi,
> =

> On 21/04/21 11:20, Oliver Sang wrote:
> > hi, Valentin Schneider,
> >
> > On Wed, Apr 14, 2021 at 06:17:38PM +0100, Valentin Schneider wrote:
> >> On 14/04/21 13:21, kernel test robot wrote:
> >> > Greeting,
> >> >
> >> > FYI, we noticed a -13.8% regression of stress-ng.vm-segv.ops_per_sec=
 due to commit:
> >> >
> >> >
> >> > commit: 38ac256d1c3e6b5155071ed7ba87db50a40a4b58 ("[PATCH v5 1/3] sc=
hed/fair: Ignore percpu threads for imbalance pulls")
> >> > url: https://github.com/0day-ci/linux/commits/Valentin-Schneider/sch=
ed-fair-load-balance-vs-capacity-margins/20210408-060830
> >> > base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git 0a2b6=
5c03e9b47493e1442bf9c84badc60d9bffb
> >> >
> >> > in testcase: stress-ng
> >> > on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz=
 with 192G memory
> >> > with following parameters:
> >> >
> >> >       nr_threads: 10%
> >> >       disk: 1HDD
> >> >       testtime: 60s
> >> >       fs: ext4
> >> >       class: os
> >> >       test: vm-segv
> >> >       cpufreq_governor: performance
> >> >       ucode: 0x5003006
> >> >
> >> >
> >>
> >> That's almost exactly the same result as [1], which is somewhat annoyi=
ng
> >> for me because I wasn't able to reproduce those results back then. Save
> >> from scrounging the exact same machine to try this out, I'm not sure w=
hat's
> >> the best way forward. I guess I can re-run the workload on whatever
> >> machines I have and try to spot any potentially problematic pattern in=
 the
> >> trace...
> >
> > what's the machine model you used upon which the regression cannot be r=
eproduced?
> > we could check if we have similar model then re-check on the our machin=
e.
> >
> =

> I tested this on:
> o Ampere eMAG (arm64, 32 cores)
> o 2-socket Xeon E5-2690 (x86, 40 cores)
> =

> and found at worse a -0.3% regression and at best a 2% improvement. I know
> that x86 box is somewhat ancient, but it's been my go-to "have I broken
> x86?" test victim for a while :-)

we don't have exactly 2-socket Xeon E5-2690 model, but we have one:
Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz (2-socket, 48 cores with 112G mem=
ory)
the test on it shows the regression is existing, too. but smaller (-5.3%)
hope it's helpful

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_grou=
p/test/testcase/testtime/ucode:
  os/gcc-9/performance/1HDD/ext4/x86_64-rhel-8.3/10%/debian-10.4-x86_64-202=
00603.cgz/lkp-ivb-2ep1/vm-segv/stress-ng/60s/0x42e

commit: =

  0a2b65c03e9b47493e1442bf9c84badc60d9bffb
  38ac256d1c3e6b5155071ed7ba87db50a40a4b58

0a2b65c03e9b4749 38ac256d1c3e6b5155071ed7ba8 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     62.05            +0.0%      62.05        stress-ng.time.elapsed_time
     62.05            +0.0%      62.05        stress-ng.time.elapsed_time.m=
ax
      8.00            +0.0%       8.00        stress-ng.time.file_system_in=
puts
      5283 =C2=B1 21%     -25.8%       3919 =C2=B1 33%  stress-ng.time.invo=
luntary_context_switches
    629.67           +18.1%     743.83 =C2=B1  2%  stress-ng.time.major_pag=
e_faults
      6278            +0.5%       6310        stress-ng.time.maximum_reside=
nt_set_size
  14171384 =C2=B1  4%      -3.2%   13713215        stress-ng.time.minor_pag=
e_faults
      4096            +0.0%       4096        stress-ng.time.page_size
    432.67            -0.5%     430.67        stress-ng.time.percent_of_cpu=
_this_job_got
    151.97            +3.0%     156.56        stress-ng.time.system_time
    116.88            -5.0%     111.02        stress-ng.time.user_time
  29097192            -5.5%   27510022 =C2=B1  2%  stress-ng.time.voluntary=
_context_switches
    374268            -5.3%     354278 =C2=B1  2%  stress-ng.vm-segv.ops
      6237            -5.3%       5904 =C2=B1  2%  stress-ng.vm-segv.ops_pe=
r_sec
    101.76            +0.2%     101.94        uptime.boot
      4340            +0.3%       4353        uptime.idle
     26.87            +1.1%      27.17        boot-time.boot
     13.21            -0.3%      13.17        boot-time.dhcp
      1058            -0.2%       1056        boot-time.idle
      0.46            +0.1%       0.46        boot-time.smp_boot
     89.72            +0.4%      90.07        iostat.cpu.idle
      0.06 =C2=B1  9%      -7.6%       0.06 =C2=B1 11%  iostat.cpu.iowait
      9.27            -3.2%       8.97        iostat.cpu.system
      0.95            -5.1%       0.90 =C2=B1  2%  iostat.cpu.user
     90.47            +0.3       90.80        mpstat.cpu.all.idle%
      0.06 =C2=B1  8%      -0.0        0.05 =C2=B1 16%  mpstat.cpu.all.iowa=
it%
      1.88 =C2=B1  9%      -0.3        1.56 =C2=B1  5%  mpstat.cpu.all.irq%
      0.16 =C2=B1  9%      -0.0        0.15 =C2=B1  9%  mpstat.cpu.all.soft%
      6.52            +0.1        6.58        mpstat.cpu.all.sys%
      0.91            -0.0        0.86 =C2=B1  2%  mpstat.cpu.all.usr%
 1.882e+08 =C2=B1 12%      +8.7%  2.046e+08 =C2=B1 21%  cpuidle.C1.time
  18478182            -3.6%   17814141 =C2=B1  4%  cpuidle.C1.usage
 3.344e+08 =C2=B1 33%     +35.3%  4.524e+08 =C2=B1 59%  cpuidle.C1E.time
   1964577 =C2=B1 44%      +5.6%    2073723 =C2=B1 49%  cpuidle.C1E.usage
 2.112e+09 =C2=B1  4%      -5.5%  1.995e+09 =C2=B1 12%  cpuidle.C6.time
   3189061 =C2=B1 28%     -12.6%    2787854 =C2=B1 21%  cpuidle.C6.usage
  49416190            +1.6%   50186795 =C2=B1  2%  cpuidle.POLL.time
  11106396 =C2=B1  2%      -5.6%   10488472 =C2=B1  2%  cpuidle.POLL.usage
      0.00          -100.0%       0.00        numa-numastat.node0.interleav=
e_hit
   6628786 =C2=B1  8%      +6.3%    7044731 =C2=B1 11%  numa-numastat.node0=
.local_node
   6660150 =C2=B1  8%      +6.1%    7066342 =C2=B1 11%  numa-numastat.node0=
.numa_hit
     31365 =C2=B1 28%     -31.1%      21611 =C2=B1 72%  numa-numastat.node0=
.other_node
      0.00          -100.0%       0.00        numa-numastat.node1.interleav=
e_hit
   6970839 =C2=B1  5%     -15.0%    5922294 =C2=B1 12%  numa-numastat.node1=
.local_node
   6982872 =C2=B1  5%     -14.9%    5944073 =C2=B1 12%  numa-numastat.node1=
.numa_hit
     12035 =C2=B1 74%     +81.0%      21782 =C2=B1 72%  numa-numastat.node1=
.other_node
     62.05            +0.0%      62.05        time.elapsed_time
     62.05            +0.0%      62.05        time.elapsed_time.max
      8.00            +0.0%       8.00        time.file_system_inputs
      5283 =C2=B1 21%     -25.8%       3919 =C2=B1 33%  time.involuntary_co=
ntext_switches
    629.67           +18.1%     743.83 =C2=B1  2%  time.major_page_faults
      6278            +0.5%       6310        time.maximum_resident_set_size
  14171384 =C2=B1  4%      -3.2%   13713215        time.minor_page_faults
      4096            +0.0%       4096        time.page_size
    432.67            -0.5%     430.67        time.percent_of_cpu_this_job_=
got
    151.97            +3.0%     156.56        time.system_time
    116.88            -5.0%     111.02        time.user_time
  29097192            -5.5%   27510022 =C2=B1  2%  time.voluntary_context_s=
witches
     89.17            +0.6%      89.67        vmstat.cpu.id
      8.83 =C2=B1  4%      -7.5%       8.17 =C2=B1  4%  vmstat.cpu.sy
      0.83 =C2=B1 44%     -40.0%       0.50 =C2=B1100%  vmstat.cpu.us
      0.00          -100.0%       0.00        vmstat.cpu.wa
      0.00          -100.0%       0.00        vmstat.io.bi
      4563 =C2=B1  5%     -11.2%       4052 =C2=B1 17%  vmstat.io.bo
      1101            -0.4%       1096        vmstat.memory.buff
   1143009            -0.2%    1141026        vmstat.memory.cache
 1.132e+08            +0.0%  1.133e+08        vmstat.memory.free
      0.00          -100.0%       0.00        vmstat.procs.b
      4.00            +0.0%       4.00        vmstat.procs.r
    906400            -5.4%     857143 =C2=B1  2%  vmstat.system.cs
    100868            -2.5%      98329 =C2=B1  3%  vmstat.system.in
    410.17            -0.7%     407.17        turbostat.Avg_MHz
     14.74            -0.8       13.92        turbostat.Busy%
      2790 =C2=B1  2%      +5.1%       2931        turbostat.Bzy_MHz
  18481081            -3.6%   17810424 =C2=B1  4%  turbostat.C1
      6.16 =C2=B1 13%      +0.5        6.69 =C2=B1 21%  turbostat.C1%
   1964406 =C2=B1 44%      +5.6%    2073470 =C2=B1 49%  turbostat.C1E
     10.92 =C2=B1 33%      +3.9       14.82 =C2=B1 59%  turbostat.C1E%
   3186765 =C2=B1 28%     -12.7%    2782513 =C2=B1 21%  turbostat.C6
     68.91 =C2=B1  4%      -3.8       65.13 =C2=B1 11%  turbostat.C6%
     55.35 =C2=B1 11%      +1.6%      56.25 =C2=B1 11%  turbostat.CPU%c1
     29.91 =C2=B1 21%      -0.3%      29.83 =C2=B1 22%  turbostat.CPU%c6
     93.17 =C2=B1  4%      +3.5%      96.44 =C2=B1  2%  turbostat.CorWatt
     69.83 =C2=B1  3%      -0.2%      69.67 =C2=B1  3%  turbostat.CoreTmp
   6549472            -2.6%    6381758 =C2=B1  3%  turbostat.IRQ
     12.12 =C2=B1 49%     -55.0%       5.45 =C2=B1 49%  turbostat.Pkg%pc2
      0.10 =C2=B1 68%     +17.5%       0.12 =C2=B1 66%  turbostat.Pkg%pc6
     69.83 =C2=B1  3%      -0.2%      69.67 =C2=B1  3%  turbostat.PkgTmp
    121.81 =C2=B1  3%      +2.8%     125.20        turbostat.PkgWatt
     20.10            +6.6%      21.42        turbostat.RAMWatt
      2693            -0.0%       2693        turbostat.TSC_MHz
      8390            -3.7%       8082        meminfo.Active
      7414            -4.1%       7110        meminfo.Active(anon)
    975.50            -0.4%     971.17        meminfo.Active(file)
     78147 =C2=B1  4%      -0.7%      77601 =C2=B1  7%  meminfo.AnonHugePag=
es
    234699            -0.3%     233894        meminfo.AnonPages
      1100            -0.4%       1096        meminfo.Buffers
   1068202            +0.0%    1068277        meminfo.Cached
    199940            +0.0%     199940        meminfo.CmaFree
    204800            +0.0%     204800        meminfo.CmaTotal
  57688376            +0.0%   57688376        meminfo.CommitLimit
    667822            +0.1%     668198        meminfo.Committed_AS
 1.029e+08            +2.4%  1.054e+08        meminfo.DirectMap1G
  16092501 =C2=B1 10%     -15.0%   13679274 =C2=B1  3%  meminfo.DirectMap2M
    429876 =C2=B1  7%      -7.8%     396425 =C2=B1  4%  meminfo.DirectMap4k
      5.67 =C2=B1 16%      +8.8%       6.17 =C2=B1 11%  meminfo.Dirty
      2048            +0.0%       2048        meminfo.Hugepagesize
    248091            -0.0%     248010        meminfo.Inactive
    247968            -0.0%     247886        meminfo.Inactive(anon)
    122.33 =C2=B1  3%      +0.5%     123.00 =C2=B1  2%  meminfo.Inactive(fi=
le)
     74840            -2.8%      72725        meminfo.KReclaimable
     12721            -1.8%      12494        meminfo.KernelStack
     35493            +1.0%      35836        meminfo.Mapped
 1.127e+08            +0.0%  1.127e+08        meminfo.MemAvailable
 1.132e+08            +0.0%  1.133e+08        meminfo.MemFree
 1.154e+08            +0.0%  1.154e+08        meminfo.MemTotal
   2147410            -1.5%    2115780        meminfo.Memused
      7.00            +0.0%       7.00        meminfo.Mlocked
      7631 =C2=B1  7%      -5.0%       7249 =C2=B1  8%  meminfo.PageTables
     80842            -0.3%      80608        meminfo.Percpu
     74840            -2.8%      72725        meminfo.SReclaimable
    121123            -0.7%     120241        meminfo.SUnreclaim
     21831            +0.3%      21907        meminfo.Shmem
    195964            -1.5%     192968        meminfo.Slab
   1046372            -0.0%    1046371        meminfo.Unevictable
 3.436e+10            +0.0%  3.436e+10        meminfo.VmallocTotal
    184780            -0.0%     184761        meminfo.VmallocUsed
   2207891            -1.2%    2181160        meminfo.max_used_kB
      1122 =C2=B1 34%     +37.6%       1544 =C2=B1 24%  numa-meminfo.node0.=
Active
    906.50 =C2=B1 31%     +27.5%       1155 =C2=B1 15%  numa-meminfo.node0.=
Active(anon)
    215.33 =C2=B1129%     +80.2%     388.00 =C2=B1103%  numa-meminfo.node0.=
Active(file)
     31989 =C2=B1108%     +97.2%      63079 =C2=B1 40%  numa-meminfo.node0.=
AnonHugePages
    102899 =C2=B1 75%     +81.3%     186556 =C2=B1 36%  numa-meminfo.node0.=
AnonPages
    111493 =C2=B1 68%     +72.8%     192682 =C2=B1 35%  numa-meminfo.node0.=
AnonPages.max
      3.17 =C2=B1102%     +36.8%       4.33 =C2=B1 60%  numa-meminfo.node0.=
Dirty
    534079 =C2=B1  3%      +3.4%     552351 =C2=B1  2%  numa-meminfo.node0.=
FilePages
    108791 =C2=B1 71%     +83.8%     199931 =C2=B1 34%  numa-meminfo.node0.=
Inactive
    108771 =C2=B1 71%     +83.8%     199891 =C2=B1 34%  numa-meminfo.node0.=
Inactive(anon)
     19.83 =C2=B1221%    +102.5%      40.17 =C2=B1140%  numa-meminfo.node0.=
Inactive(file)
     38561 =C2=B1 17%     +14.3%      44083 =C2=B1  9%  numa-meminfo.node0.=
KReclaimable
      6616 =C2=B1  5%      +5.4%       6975 =C2=B1  5%  numa-meminfo.node0.=
KernelStack
     16116 =C2=B1 12%     +34.1%      21615        numa-meminfo.node0.Mapped
  60691696            -0.2%   60584020        numa-meminfo.node0.MemFree
  61766680            +0.0%   61766680        numa-meminfo.node0.MemTotal
   1074982 =C2=B1  8%     +10.0%    1182658 =C2=B1  7%  numa-meminfo.node0.=
MemUsed
      3.00            +0.0%       3.00        numa-meminfo.node0.Mlocked
      3385 =C2=B1 14%     +35.1%       4574 =C2=B1 11%  numa-meminfo.node0.=
PageTables
     38561 =C2=B1 17%     +14.3%      44083 =C2=B1  9%  numa-meminfo.node0.=
SReclaimable
     63531 =C2=B1  7%      +6.8%      67866 =C2=B1  5%  numa-meminfo.node0.=
SUnreclaim
      7325 =C2=B1 49%    +104.8%      15005        numa-meminfo.node0.Shmem
    102092 =C2=B1 10%      +9.7%     111951 =C2=B1  4%  numa-meminfo.node0.=
Slab
    526518 =C2=B1  3%      +2.0%     536917 =C2=B1  2%  numa-meminfo.node0.=
Unevictable
      7269 =C2=B1  4%     -10.1%       6538 =C2=B1  6%  numa-meminfo.node1.=
Active
      6509 =C2=B1  4%      -8.5%       5955 =C2=B1  3%  numa-meminfo.node1.=
Active(anon)
    759.67 =C2=B1 36%     -23.3%     582.67 =C2=B1 69%  numa-meminfo.node1.=
Active(file)
     46285 =C2=B1 70%     -68.4%      14606 =C2=B1189%  numa-meminfo.node1.=
AnonHugePages
    132013 =C2=B1 59%     -64.0%      47557 =C2=B1146%  numa-meminfo.node1.=
AnonPages
    181517 =C2=B1 44%     -49.3%      92036 =C2=B1 75%  numa-meminfo.node1.=
AnonPages.max
      2.50 =C2=B1100%     -33.3%       1.67 =C2=B1132%  numa-meminfo.node1.=
Dirty
    535266 =C2=B1  3%      -3.4%     517026 =C2=B1  2%  numa-meminfo.node1.=
FilePages
    139541 =C2=B1 56%     -65.4%      48338 =C2=B1146%  numa-meminfo.node1.=
Inactive
    139437 =C2=B1 56%     -65.4%      48255 =C2=B1146%  numa-meminfo.node1.=
Inactive(anon)
    103.67 =C2=B1 44%     -20.1%      82.83 =C2=B1 70%  numa-meminfo.node1.=
Inactive(file)
     36314 =C2=B1 19%     -21.1%      28647 =C2=B1 14%  numa-meminfo.node1.=
KReclaimable
      6095 =C2=B1  8%      -9.3%       5526 =C2=B1  9%  numa-meminfo.node1.=
KernelStack
     19513 =C2=B1 10%     -26.5%      14339        numa-meminfo.node1.Mapped
  52537439            +0.3%   52676940        numa-meminfo.node1.MemFree
  53610072            +0.0%   53610072        numa-meminfo.node1.MemTotal
   1072631 =C2=B1  8%     -13.0%     933130 =C2=B1  9%  numa-meminfo.node1.=
MemUsed
      3.00            +0.0%       3.00        numa-meminfo.node1.Mlocked
      4192 =C2=B1 12%     -32.5%       2828 =C2=B1 17%  numa-meminfo.node1.=
PageTables
     36314 =C2=B1 19%     -21.1%      28647 =C2=B1 14%  numa-meminfo.node1.=
SReclaimable
     57691 =C2=B1  8%      -8.9%      52551 =C2=B1  6%  numa-meminfo.node1.=
SUnreclaim
     14548 =C2=B1 25%     -52.5%       6905 =C2=B1  2%  numa-meminfo.node1.=
Shmem
     94005 =C2=B1 11%     -13.6%      81199 =C2=B1  8%  numa-meminfo.node1.=
Slab
    519853 =C2=B1  3%      -2.0%     509452 =C2=B1  2%  numa-meminfo.node1.=
Unevictable
      0.00          -100.0%       0.00        proc-vmstat.compact_isolated
      1853            -4.1%       1777        proc-vmstat.nr_active_anon
    243.50            -0.5%     242.33        proc-vmstat.nr_active_file
     58735            -0.4%      58523        proc-vmstat.nr_anon_pages
     37.67 =C2=B1  5%      -0.9%      37.33 =C2=B1  7%  proc-vmstat.nr_anon=
_transparent_hugepages
      4.83 =C2=B1 14%     -13.8%       4.17 =C2=B1 25%  proc-vmstat.nr_dirt=
ied
      1.00            +0.0%       1.00        proc-vmstat.nr_dirty
   2812488            +0.0%    2813282        proc-vmstat.nr_dirty_backgrou=
nd_threshold
   5631854            +0.0%    5633445        proc-vmstat.nr_dirty_threshold
    267336            +0.0%     267344        proc-vmstat.nr_file_pages
     49985            +0.0%      49985        proc-vmstat.nr_free_cma
  28307285            +0.0%   28315239        proc-vmstat.nr_free_pages
     62042            -0.0%      62021        proc-vmstat.nr_inactive_anon
     30.50 =C2=B1  3%      -0.5%      30.33 =C2=B1  3%  proc-vmstat.nr_inac=
tive_file
     12717            -1.7%      12504        proc-vmstat.nr_kernel_stack
      9010            +0.9%       9090        proc-vmstat.nr_mapped
      1.00            +0.0%       1.00        proc-vmstat.nr_mlock
      1907 =C2=B1  7%      -2.9%       1851 =C2=B1  7%  proc-vmstat.nr_page=
_table_pages
      5468            +0.2%       5477        proc-vmstat.nr_shmem
     18721            -2.8%      18190        proc-vmstat.nr_slab_reclaimab=
le
     30318            -0.6%      30123        proc-vmstat.nr_slab_unreclaim=
able
    261592            -0.0%     261592        proc-vmstat.nr_unevictable
      2.83 =C2=B1 24%      +0.0%       2.83 =C2=B1 31%  proc-vmstat.nr_writ=
ten
      1853            -4.1%       1777        proc-vmstat.nr_zone_active_an=
on
    243.50            -0.5%     242.33        proc-vmstat.nr_zone_active_fi=
le
     62042            -0.0%      62021        proc-vmstat.nr_zone_inactive_=
anon
     30.50 =C2=B1  3%      -0.5%      30.33 =C2=B1  3%  proc-vmstat.nr_zone=
_inactive_file
    261592            -0.0%     261592        proc-vmstat.nr_zone_unevictab=
le
      1.00            +0.0%       1.00        proc-vmstat.nr_zone_write_pen=
ding
    822.67 =C2=B1140%     -99.6%       3.67 =C2=B1100%  proc-vmstat.numa_hi=
nt_faults
    805.67 =C2=B1143%     -99.5%       3.67 =C2=B1100%  proc-vmstat.numa_hi=
nt_faults_local
  13602406 =C2=B1  3%      -4.6%   12971942        proc-vmstat.numa_hit
      3.50 =C2=B1147%     +85.7%       6.50 =C2=B1100%  proc-vmstat.numa_hu=
ge_pte_updates
      0.00          -100.0%       0.00        proc-vmstat.numa_interleave
  13558992 =C2=B1  3%      -4.6%   12928533        proc-vmstat.numa_local
     43413            -0.0%      43409        proc-vmstat.numa_other
     95.17 =C2=B1222%    -100.0%       0.00        proc-vmstat.numa_pages_m=
igrated
      1792 =C2=B1147%     +85.7%       3328 =C2=B1100%  proc-vmstat.numa_pt=
e_updates
      4158            -8.1%       3821 =C2=B1  3%  proc-vmstat.pgactivate
      0.00          -100.0%       0.00        proc-vmstat.pgalloc_dma
      0.00          -100.0%       0.00        proc-vmstat.pgalloc_dma32
  14832387 =C2=B1  3%      -4.9%   14101230        proc-vmstat.pgalloc_norm=
al
  14393998 =C2=B1  4%      -3.2%   13933130        proc-vmstat.pgfault
  14762236 =C2=B1  3%      -5.0%   14031110        proc-vmstat.pgfree
     95.17 =C2=B1222%    -100.0%       0.00        proc-vmstat.pgmigrate_su=
ccess
      4.00            +0.0%       4.00        proc-vmstat.pgpgin
    293004 =C2=B1  5%     -11.2%     260224 =C2=B1 18%  proc-vmstat.pgpgout
    199070 =C2=B1  8%     -12.1%     175015 =C2=B1  4%  proc-vmstat.pgreuse
     48.00            +0.0%      48.00        proc-vmstat.thp_collapse_alloc
      0.00       +1.7e+101%       0.17 =C2=B1223%  proc-vmstat.thp_deferred=
_split_page
      3.50 =C2=B1 27%     +14.3%       4.00 =C2=B1 25%  proc-vmstat.thp_fau=
lt_alloc
      0.67 =C2=B1 70%      +0.0%       0.67 =C2=B1 70%  proc-vmstat.thp_spl=
it_pmd
      0.33 =C2=B1141%     +50.0%       0.50 =C2=B1100%  proc-vmstat.thp_zer=
o_page_alloc
     12.67 =C2=B1  3%      -1.3%      12.50 =C2=B1  4%  proc-vmstat.unevict=
able_pgs_culled
      2.00            +0.0%       2.00        proc-vmstat.unevictable_pgs_m=
locked
      2.00            +0.0%       2.00        proc-vmstat.unevictable_pgs_m=
unlocked
      0.00          -100.0%       0.00        proc-vmstat.unevictable_pgs_r=
escued
    534400            -0.2%     533376        proc-vmstat.unevictable_pgs_s=
canned
    226.17 =C2=B1 31%     +27.6%     288.50 =C2=B1 14%  numa-vmstat.node0.n=
r_active_anon
     53.33 =C2=B1130%     +80.9%      96.50 =C2=B1104%  numa-vmstat.node0.n=
r_active_file
     25776 =C2=B1 74%     +81.1%      46673 =C2=B1 36%  numa-vmstat.node0.n=
r_anon_pages
     15.17 =C2=B1110%    +100.0%      30.33 =C2=B1 41%  numa-vmstat.node0.n=
r_anon_transparent_hugepages
    131870 =C2=B1 99%     +66.6%     219679 =C2=B1 44%  numa-vmstat.node0.n=
r_dirtied
      0.50 =C2=B1100%     +33.3%       0.67 =C2=B1 70%  numa-vmstat.node0.n=
r_dirty
    133520 =C2=B1  3%      +3.4%     138088 =C2=B1  2%  numa-vmstat.node0.n=
r_file_pages
     49985            +0.0%      49985        numa-vmstat.node0.nr_free_cma
  15172823            -0.2%   15145886        numa-vmstat.node0.nr_free_pag=
es
     27219 =C2=B1 71%     +83.7%      50002 =C2=B1 34%  numa-vmstat.node0.n=
r_inactive_anon
      4.83 =C2=B1223%    +103.4%       9.83 =C2=B1141%  numa-vmstat.node0.n=
r_inactive_file
      6650 =C2=B1  5%      +5.6%       7022 =C2=B1  5%  numa-vmstat.node0.n=
r_kernel_stack
      4105 =C2=B1 11%     +34.2%       5510        numa-vmstat.node0.nr_map=
ped
      0.00          -100.0%       0.00        numa-vmstat.node0.nr_mlock
    883.17 =C2=B1 15%     +33.6%       1179 =C2=B1 11%  numa-vmstat.node0.n=
r_page_table_pages
      1832 =C2=B1 49%    +104.8%       3751        numa-vmstat.node0.nr_shm=
em
      9634 =C2=B1 17%     +14.3%      11011 =C2=B1  9%  numa-vmstat.node0.n=
r_slab_reclaimable
     15917 =C2=B1  7%      +7.0%      17025 =C2=B1  5%  numa-vmstat.node0.n=
r_slab_unreclaimable
    131629 =C2=B1  3%      +2.0%     134229 =C2=B1  2%  numa-vmstat.node0.n=
r_unevictable
    131869 =C2=B1 99%     +66.6%     219678 =C2=B1 44%  numa-vmstat.node0.n=
r_written
    226.17 =C2=B1 31%     +27.6%     288.50 =C2=B1 14%  numa-vmstat.node0.n=
r_zone_active_anon
     53.33 =C2=B1130%     +80.9%      96.50 =C2=B1104%  numa-vmstat.node0.n=
r_zone_active_file
     27219 =C2=B1 71%     +83.7%      50002 =C2=B1 34%  numa-vmstat.node0.n=
r_zone_inactive_anon
      4.83 =C2=B1223%    +103.4%       9.83 =C2=B1141%  numa-vmstat.node0.n=
r_zone_inactive_file
    131629 =C2=B1  3%      +2.0%     134229 =C2=B1  2%  numa-vmstat.node0.n=
r_zone_unevictable
      0.50 =C2=B1100%     +33.3%       0.67 =C2=B1 70%  numa-vmstat.node0.n=
r_zone_write_pending
   3743203 =C2=B1 14%     +13.6%    4252893 =C2=B1 13%  numa-vmstat.node0.n=
uma_hit
    144537            +0.0%     144560        numa-vmstat.node0.numa_interl=
eave
   3708684 =C2=B1 14%     +14.1%    4230751 =C2=B1 13%  numa-vmstat.node0.n=
uma_local
     34520 =C2=B1 26%     -35.9%      22141 =C2=B1 67%  numa-vmstat.node0.n=
uma_other
      1620 =C2=B1  4%      -8.5%       1482 =C2=B1  3%  numa-vmstat.node1.n=
r_active_anon
    189.67 =C2=B1 36%     -23.4%     145.33 =C2=B1 69%  numa-vmstat.node1.n=
r_active_file
     33030 =C2=B1 58%     -63.8%      11953 =C2=B1146%  numa-vmstat.node1.n=
r_anon_pages
     22.00 =C2=B1 72%     -69.7%       6.67 =C2=B1203%  numa-vmstat.node1.n=
r_anon_transparent_hugepages
    131825 =C2=B1 99%     -66.6%      44016 =C2=B1223%  numa-vmstat.node1.n=
r_dirtied
      0.50 =C2=B1100%     -66.7%       0.17 =C2=B1223%  numa-vmstat.node1.n=
r_dirty
    133826 =C2=B1  3%      -3.4%     129252 =C2=B1  2%  numa-vmstat.node1.n=
r_file_pages
  13134316            +0.3%   13169106        numa-vmstat.node1.nr_free_pag=
es
     34913 =C2=B1 56%     -65.3%      12124 =C2=B1145%  numa-vmstat.node1.n=
r_inactive_anon
     25.67 =C2=B1 44%     -20.1%      20.50 =C2=B1 70%  numa-vmstat.node1.n=
r_inactive_file
      0.83 =C2=B1223%    -100.0%       0.00        numa-vmstat.node1.nr_iso=
lated_anon
      6107 =C2=B1  8%      -9.0%       5555 =C2=B1  9%  numa-vmstat.node1.n=
r_kernel_stack
      4959 =C2=B1 10%     -27.1%       3614 =C2=B1  2%  numa-vmstat.node1.n=
r_mapped
      0.00          -100.0%       0.00        numa-vmstat.node1.nr_mlock
      1060 =C2=B1  9%     -28.9%     754.17 =C2=B1 17%  numa-vmstat.node1.n=
r_page_table_pages
      3646 =C2=B1 25%     -52.8%       1722 =C2=B1  2%  numa-vmstat.node1.n=
r_shmem
      9065 =C2=B1 18%     -20.9%       7172 =C2=B1 14%  numa-vmstat.node1.n=
r_slab_reclaimable
     14433 =C2=B1  8%      -8.7%      13183 =C2=B1  6%  numa-vmstat.node1.n=
r_slab_unreclaimable
    129963 =C2=B1  3%      -2.0%     127362 =C2=B1  2%  numa-vmstat.node1.n=
r_unevictable
    131825 =C2=B1 99%     -66.6%      44016 =C2=B1223%  numa-vmstat.node1.n=
r_written
      1620 =C2=B1  4%      -8.5%       1482 =C2=B1  3%  numa-vmstat.node1.n=
r_zone_active_anon
    189.67 =C2=B1 36%     -23.4%     145.33 =C2=B1 69%  numa-vmstat.node1.n=
r_zone_active_file
     34913 =C2=B1 56%     -65.3%      12124 =C2=B1145%  numa-vmstat.node1.n=
r_zone_inactive_anon
     25.67 =C2=B1 44%     -20.1%      20.50 =C2=B1 70%  numa-vmstat.node1.n=
r_zone_inactive_file
    129963 =C2=B1  3%      -2.0%     127362 =C2=B1  2%  numa-vmstat.node1.n=
r_zone_unevictable
      0.50 =C2=B1100%     -66.7%       0.17 =C2=B1223%  numa-vmstat.node1.n=
r_zone_write_pending
   4054243 =C2=B1  9%     -20.4%    3226026 =C2=B1 17%  numa-vmstat.node1.n=
uma_hit
    144622            -0.0%     144594        numa-vmstat.node1.numa_interl=
eave
   3888883 =C2=B1  9%     -21.6%    3048417 =C2=B1 18%  numa-vmstat.node1.n=
uma_local
    165360 =C2=B1  5%      +7.4%     177609 =C2=B1  8%  numa-vmstat.node1.n=
uma_other
     18.58 =C2=B1  3%      -0.8%      18.42 =C2=B1  2%  perf-stat.i.MPKI
  2.32e+09            -4.3%  2.221e+09        perf-stat.i.branch-instructio=
ns
      1.63 =C2=B1  4%      +0.0        1.63 =C2=B1  3%  perf-stat.i.branch-=
miss-rate%
  35511033 =C2=B1  3%      -4.7%   33858722 =C2=B1  2%  perf-stat.i.branch-=
misses
      5.24 =C2=B1 10%      +2.6        7.88 =C2=B1  5%  perf-stat.i.cache-m=
iss-rate%
   8904631 =C2=B1 14%     +50.5%   13400160 =C2=B1  5%  perf-stat.i.cache-m=
isses
 1.991e+08            -5.5%  1.881e+08        perf-stat.i.cache-references
    939422            -5.5%     887849 =C2=B1  2%  perf-stat.i.context-swit=
ches
      1.90 =C2=B1  2%      +3.1%       1.96 =C2=B1  2%  perf-stat.i.cpi
     47995            -0.0%      47992        perf-stat.i.cpu-clock
 2.003e+10            -1.9%  1.964e+10        perf-stat.i.cpu-cycles
    145.29 =C2=B1  9%     -15.4%     122.92 =C2=B1 10%  perf-stat.i.cpu-mig=
rations
      2385 =C2=B1 12%     -27.4%       1732 =C2=B1  7%  perf-stat.i.cycles-=
between-cache-misses
      0.63 =C2=B1  5%      -0.0        0.58 =C2=B1 10%  perf-stat.i.dTLB-lo=
ad-miss-rate%
  18831979 =C2=B1  5%     -11.6%   16655916 =C2=B1  9%  perf-stat.i.dTLB-lo=
ad-misses
 2.987e+09            -4.8%  2.845e+09        perf-stat.i.dTLB-loads
      0.18 =C2=B1  3%      -0.0        0.17 =C2=B1  5%  perf-stat.i.dTLB-st=
ore-miss-rate%
   3200322 =C2=B1  3%      -8.0%    2945416 =C2=B1  5%  perf-stat.i.dTLB-st=
ore-misses
 1.815e+09            -5.6%  1.714e+09        perf-stat.i.dTLB-stores
     81.46            +1.0       82.45        perf-stat.i.iTLB-load-miss-ra=
te%
   8356116            +0.3%    8381820        perf-stat.i.iTLB-load-misses
   1933319 =C2=B1  2%      -6.3%    1810679 =C2=B1  3%  perf-stat.i.iTLB-lo=
ads
 1.072e+10            -4.6%  1.022e+10        perf-stat.i.instructions
      1316 =C2=B1  2%      -4.9%       1251 =C2=B1  2%  perf-stat.i.instruc=
tions-per-iTLB-miss
      0.53 =C2=B1  2%      -2.8%       0.52 =C2=B1  2%  perf-stat.i.ipc
     11.77 =C2=B1  4%     +10.8%      13.04 =C2=B1  3%  perf-stat.i.major-f=
aults
      0.42            -2.0%       0.41        perf-stat.i.metric.GHz
      0.03 =C2=B1 43%     +51.1%       0.04 =C2=B1 32%  perf-stat.i.metric.=
K/sec
    152.77            -4.7%     145.62        perf-stat.i.metric.M/sec
    228577 =C2=B1  4%      -3.3%     221131        perf-stat.i.minor-faults
     42.81            +3.3       46.07        perf-stat.i.node-load-miss-ra=
te%
   1275857 =C2=B1 16%    +325.6%    5429434 =C2=B1  9%  perf-stat.i.node-lo=
ad-misses
   1545753 =C2=B1 14%    +270.0%    5718567 =C2=B1  9%  perf-stat.i.node-lo=
ads
     20.66 =C2=B1  4%      +9.8       30.50 =C2=B1  5%  perf-stat.i.node-st=
ore-miss-rate%
    533525 =C2=B1 12%    +188.3%    1537966 =C2=B1  9%  perf-stat.i.node-st=
ore-misses
   1838868 =C2=B1  7%     +53.5%    2823121 =C2=B1  7%  perf-stat.i.node-st=
ores
    240497 =C2=B1  4%      -3.4%     232410        perf-stat.i.page-faults
     47995            -0.0%      47992        perf-stat.i.task-clock
     18.58 =C2=B1  3%      -0.9%      18.41 =C2=B1  2%  perf-stat.overall.M=
PKI
      1.53 =C2=B1  4%      -0.0        1.53 =C2=B1  3%  perf-stat.overall.b=
ranch-miss-rate%
      4.47 =C2=B1 12%      +2.7        7.12 =C2=B1  5%  perf-stat.overall.c=
ache-miss-rate%
      1.87 =C2=B1  2%      +2.8%       1.92 =C2=B1  2%  perf-stat.overall.c=
pi
      2288 =C2=B1 12%     -35.8%       1469 =C2=B1  5%  perf-stat.overall.c=
ycles-between-cache-misses
      0.63 =C2=B1  5%      -0.0        0.58 =C2=B1 10%  perf-stat.overall.d=
TLB-load-miss-rate%
      0.18 =C2=B1  3%      -0.0        0.17 =C2=B1  5%  perf-stat.overall.d=
TLB-store-miss-rate%
     81.21            +1.0       82.24        perf-stat.overall.iTLB-load-m=
iss-rate%
      1283 =C2=B1  2%      -4.9%       1220 =C2=B1  2%  perf-stat.overall.i=
nstructions-per-iTLB-miss
      0.54 =C2=B1  2%      -2.8%       0.52 =C2=B1  2%  perf-stat.overall.i=
pc
     45.11            +3.6       48.69        perf-stat.overall.node-load-m=
iss-rate%
     22.44 =C2=B1  6%     +12.8       35.22        perf-stat.overall.node-s=
tore-miss-rate%
 2.282e+09            -4.3%  2.185e+09        perf-stat.ps.branch-instructi=
ons
  34944122 =C2=B1  3%      -4.7%   33317639 =C2=B1  2%  perf-stat.ps.branch=
-misses
   8764430 =C2=B1 14%     +50.4%   13182428 =C2=B1  5%  perf-stat.ps.cache-=
misses
 1.959e+08            -5.5%  1.851e+08        perf-stat.ps.cache-references
    924170            -5.5%     873484 =C2=B1  2%  perf-stat.ps.context-swi=
tches
     47234            -0.0%      47231        perf-stat.ps.cpu-clock
  1.97e+10            -1.9%  1.932e+10        perf-stat.ps.cpu-cycles
    142.98 =C2=B1  9%     -15.4%     121.00 =C2=B1 10%  perf-stat.ps.cpu-mi=
grations
  18527288 =C2=B1  5%     -11.6%   16386779 =C2=B1  9%  perf-stat.ps.dTLB-l=
oad-misses
 2.939e+09            -4.8%  2.799e+09        perf-stat.ps.dTLB-loads
   3148614 =C2=B1  3%      -8.0%    2897904 =C2=B1  5%  perf-stat.ps.dTLB-s=
tore-misses
 1.785e+09            -5.6%  1.686e+09        perf-stat.ps.dTLB-stores
   8220925            +0.3%    8246585        perf-stat.ps.iTLB-load-misses
   1901979 =C2=B1  2%      -6.3%    1781451 =C2=B1  3%  perf-stat.ps.iTLB-l=
oads
 1.055e+10            -4.6%  1.006e+10        perf-stat.ps.instructions
     11.63 =C2=B1  4%     +10.7%      12.87 =C2=B1  3%  perf-stat.ps.major-=
faults
    224870 =C2=B1  4%      -3.3%     217555        perf-stat.ps.minor-faults
   1255071 =C2=B1 16%    +325.3%    5337676 =C2=B1  9%  perf-stat.ps.node-l=
oad-misses
   1520686 =C2=B1 14%    +269.7%    5622239 =C2=B1  9%  perf-stat.ps.node-l=
oads
    525246 =C2=B1 12%    +188.0%    1512617 =C2=B1  9%  perf-stat.ps.node-s=
tore-misses
   1809915 =C2=B1  7%     +53.4%    2777253 =C2=B1  7%  perf-stat.ps.node-s=
tores
    236596 =C2=B1  4%      -3.4%     228651        perf-stat.ps.page-faults
     47234            -0.0%      47231        perf-stat.ps.task-clock
 6.672e+11            -4.6%  6.364e+11        perf-stat.total.instructions
    282.71 =C2=B1172%     -58.6%     117.09 =C2=B1118%  sched_debug.cfs_rq:=
/.MIN_vruntime.avg
     10305 =C2=B1159%     -60.0%       4125 =C2=B1102%  sched_debug.cfs_rq:=
/.MIN_vruntime.max
      0.00            +0.0%       0.00        sched_debug.cfs_rq:/.MIN_vrun=
time.min
      1586 =C2=B1163%     -57.5%     673.64 =C2=B1107%  sched_debug.cfs_rq:=
/.MIN_vruntime.stddev
     32714 =C2=B1 26%      +2.4%      33502 =C2=B1 25%  sched_debug.cfs_rq:=
/.load.avg
    911174 =C2=B1 21%     +15.1%    1048576        sched_debug.cfs_rq:/.loa=
d.max
    143709 =C2=B1 24%     +10.7%     159042 =C2=B1 13%  sched_debug.cfs_rq:=
/.load.stddev
    333.97 =C2=B1 31%      +3.7%     346.18 =C2=B1  6%  sched_debug.cfs_rq:=
/.load_avg.avg
      8728 =C2=B1 28%     +24.5%      10866 =C2=B1  3%  sched_debug.cfs_rq:=
/.load_avg.max
      0.25 =C2=B1223%    -100.0%       0.00        sched_debug.cfs_rq:/.loa=
d_avg.min
      1298 =C2=B1 28%     +20.3%       1563 =C2=B1  3%  sched_debug.cfs_rq:=
/.load_avg.stddev
    282.71 =C2=B1172%     -58.6%     117.09 =C2=B1118%  sched_debug.cfs_rq:=
/.max_vruntime.avg
     10305 =C2=B1159%     -60.0%       4125 =C2=B1102%  sched_debug.cfs_rq:=
/.max_vruntime.max
      0.00            +0.0%       0.00        sched_debug.cfs_rq:/.max_vrun=
time.min
      1586 =C2=B1163%     -57.5%     673.64 =C2=B1107%  sched_debug.cfs_rq:=
/.max_vruntime.stddev
     17251 =C2=B1 42%     -27.3%      12548 =C2=B1 10%  sched_debug.cfs_rq:=
/.min_vruntime.avg
     37874 =C2=B1 19%     -13.1%      32923 =C2=B1  7%  sched_debug.cfs_rq:=
/.min_vruntime.max
     10742 =C2=B1 49%     -26.0%       7950 =C2=B1 19%  sched_debug.cfs_rq:=
/.min_vruntime.min
      5153 =C2=B1 16%     -12.8%       4493 =C2=B1 10%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      0.31 =C2=B1 16%     +15.3%       0.35 =C2=B1  8%  sched_debug.cfs_rq:=
/.nr_running.avg
      1.00            +0.0%       1.00        sched_debug.cfs_rq:/.nr_runni=
ng.max
      0.45 =C2=B1  6%      +5.7%       0.48        sched_debug.cfs_rq:/.nr_=
running.stddev
     52.06 =C2=B1 55%     -19.8%      41.77 =C2=B1 50%  sched_debug.cfs_rq:=
/.removed.load_avg.avg
    849.33 =C2=B1 28%     +18.7%       1008 =C2=B1  2%  sched_debug.cfs_rq:=
/.removed.load_avg.max
    192.60 =C2=B1 34%      +0.6%     193.73 =C2=B1 24%  sched_debug.cfs_rq:=
/.removed.load_avg.stddev
     16.20 =C2=B1 72%     -41.6%       9.45 =C2=B1 53%  sched_debug.cfs_rq:=
/.removed.runnable_avg.avg
    322.50 =C2=B1 50%      -3.8%     310.17 =C2=B1 39%  sched_debug.cfs_rq:=
/.removed.runnable_avg.max
     61.50 =C2=B1 57%     -19.1%      49.74 =C2=B1 39%  sched_debug.cfs_rq:=
/.removed.runnable_avg.stddev
     16.20 =C2=B1 72%     -41.6%       9.45 =C2=B1 53%  sched_debug.cfs_rq:=
/.removed.util_avg.avg
    322.50 =C2=B1 50%      -3.8%     310.17 =C2=B1 39%  sched_debug.cfs_rq:=
/.removed.util_avg.max
     61.50 =C2=B1 57%     -19.1%      49.74 =C2=B1 39%  sched_debug.cfs_rq:=
/.removed.util_avg.stddev
    487.44 =C2=B1 19%     +18.0%     575.06 =C2=B1  7%  sched_debug.cfs_rq:=
/.runnable_avg.avg
      1454 =C2=B1 22%      +8.4%       1577 =C2=B1 18%  sched_debug.cfs_rq:=
/.runnable_avg.max
      1.25 =C2=B1162%     -73.3%       0.33 =C2=B1223%  sched_debug.cfs_rq:=
/.runnable_avg.min
    346.33 =C2=B1 16%      -1.7%     340.34 =C2=B1  8%  sched_debug.cfs_rq:=
/.runnable_avg.stddev
     -3594            +9.1%      -3921        sched_debug.cfs_rq:/.spread0.=
avg
     17025 =C2=B1 56%      -3.2%      16476 =C2=B1 49%  sched_debug.cfs_rq:=
/.spread0.max
    -10071           -15.9%      -8470        sched_debug.cfs_rq:/.spread0.=
min
      5155 =C2=B1 16%     -12.9%       4489 =C2=B1 10%  sched_debug.cfs_rq:=
/.spread0.stddev
    486.60 =C2=B1 19%     +18.0%     574.35 =C2=B1  7%  sched_debug.cfs_rq:=
/.util_avg.avg
      1452 =C2=B1 22%      +8.5%       1576 =C2=B1 18%  sched_debug.cfs_rq:=
/.util_avg.max
      1.25 =C2=B1162%     -73.3%       0.33 =C2=B1223%  sched_debug.cfs_rq:=
/.util_avg.min
    345.79 =C2=B1 16%      -1.7%     340.06 =C2=B1  8%  sched_debug.cfs_rq:=
/.util_avg.stddev
     61.58 =C2=B1 12%     +30.0%      80.07 =C2=B1 13%  sched_debug.cfs_rq:=
/.util_est_enqueued.avg
    815.50 =C2=B1 11%      +6.8%     871.33        sched_debug.cfs_rq:/.uti=
l_est_enqueued.max
    169.68 =C2=B1  5%     +10.0%     186.72 =C2=B1  2%  sched_debug.cfs_rq:=
/.util_est_enqueued.stddev
    545271 =C2=B1  6%      -5.5%     515364 =C2=B1  5%  sched_debug.cpu.avg=
_idle.avg
   1037512 =C2=B1  5%      +1.8%    1055721 =C2=B1 16%  sched_debug.cpu.avg=
_idle.max
     10181 =C2=B1130%    +155.1%      25967 =C2=B1195%  sched_debug.cpu.avg=
_idle.min
    290615 =C2=B1 19%     -10.2%     260841 =C2=B1 12%  sched_debug.cpu.avg=
_idle.stddev
     48422 =C2=B1 28%     -20.2%      38663        sched_debug.cpu.clock.avg
     48424 =C2=B1 28%     -20.2%      38666        sched_debug.cpu.clock.max
     48419 =C2=B1 28%     -20.2%      38658        sched_debug.cpu.clock.min
      1.24 =C2=B1 10%     +41.4%       1.75 =C2=B1 54%  sched_debug.cpu.clo=
ck.stddev
     48007 =C2=B1 28%     -19.9%      38466        sched_debug.cpu.clock_ta=
sk.avg
     48195 =C2=B1 28%     -19.8%      38646        sched_debug.cpu.clock_ta=
sk.max
     44613 =C2=B1 30%     -21.3%      35116        sched_debug.cpu.clock_ta=
sk.min
    585.12 =C2=B1  2%      +1.3%     592.74 =C2=B1  3%  sched_debug.cpu.clo=
ck_task.stddev
    645.68 =C2=B1 20%     -20.5%     513.57 =C2=B1 16%  sched_debug.cpu.cur=
r->pid.avg
      3999 =C2=B1 75%     -52.8%       1888        sched_debug.cpu.curr->pi=
d.max
      1262 =C2=B1 51%     -38.2%     780.58 =C2=B1  4%  sched_debug.cpu.cur=
r->pid.stddev
    507674            +0.1%     507952 =C2=B1  2%  sched_debug.cpu.max_idle=
_balance_cost.avg
    715017 =C2=B1  9%      +5.1%     751380 =C2=B1 33%  sched_debug.cpu.max=
_idle_balance_cost.max
    500000            +0.0%     500000        sched_debug.cpu.max_idle_bala=
nce_cost.min
     37669 =C2=B1 38%      -0.1%      37644 =C2=B1106%  sched_debug.cpu.max=
_idle_balance_cost.stddev
      4294            -0.0%       4294        sched_debug.cpu.next_balance.=
avg
      4294            -0.0%       4294        sched_debug.cpu.next_balance.=
max
      4294            -0.0%       4294        sched_debug.cpu.next_balance.=
min
      0.00 =C2=B1 19%      -4.5%       0.00 =C2=B1  9%  sched_debug.cpu.nex=
t_balance.stddev
      0.31 =C2=B1 15%      +5.1%       0.32 =C2=B1 14%  sched_debug.cpu.nr_=
running.avg
      1.00            +0.0%       1.00        sched_debug.cpu.nr_running.max
      0.45 =C2=B1  6%      +2.6%       0.46 =C2=B1  3%  sched_debug.cpu.nr_=
running.stddev
    196001 =C2=B1139%     -98.9%       2100        sched_debug.cpu.nr_switc=
hes.avg
    295068 =C2=B1136%     -96.8%       9369 =C2=B1 16%  sched_debug.cpu.nr_=
switches.max
    103705 =C2=B1144%     -99.6%     465.33 =C2=B1 10%  sched_debug.cpu.nr_=
switches.min
     43939 =C2=B1137%     -95.4%       2016 =C2=B1  8%  sched_debug.cpu.nr_=
switches.stddev
      0.02 =C2=B1 41%      +7.7%       0.02 =C2=B1 31%  sched_debug.cpu.nr_=
uninterruptible.avg
     21.33 =C2=B1 19%      -5.5%      20.17 =C2=B1 21%  sched_debug.cpu.nr_=
uninterruptible.max
    -12.50           -10.7%     -11.17        sched_debug.cpu.nr_uninterrup=
tible.min
      6.50 =C2=B1 13%      -9.5%       5.89 =C2=B1 11%  sched_debug.cpu.nr_=
uninterruptible.stddev
     48420 =C2=B1 28%     -20.2%      38661        sched_debug.cpu_clk
    996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.=
avg
    996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.=
max
    996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.=
min
 4.295e+09            -0.0%  4.295e+09        sched_debug.jiffies
     47940 =C2=B1 29%     -20.4%      38180        sched_debug.ktime
    950.00            +0.0%     950.00        sched_debug.rt_rq:/.rt_runtim=
e.avg
    950.00            +0.0%     950.00        sched_debug.rt_rq:/.rt_runtim=
e.max
    950.00            +0.0%     950.00        sched_debug.rt_rq:/.rt_runtim=
e.min
     48889 =C2=B1 28%     -20.0%      39135        sched_debug.sched_clk
      1.00            +0.0%       1.00        sched_debug.sched_clock_stabl=
e()
   4140603            +0.0%    4140603        sched_debug.sysctl_sched.sysc=
tl_sched_features
     24.00            +0.0%      24.00        sched_debug.sysctl_sched.sysc=
tl_sched_latency
      3.00            +0.0%       3.00        sched_debug.sysctl_sched.sysc=
tl_sched_min_granularity
      1.00            +0.0%       1.00        sched_debug.sysctl_sched.sysc=
tl_sched_tunable_scaling
      4.00            +0.0%       4.00        sched_debug.sysctl_sched.sysc=
tl_sched_wakeup_granularity
      0.01 =C2=B1112%     +13.6%       0.02 =C2=B1 76%  perf-sched.sch_dela=
y.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.00        +6.7e+98%       0.00 =C2=B1223%  perf-sched.sch_delay.avg=
.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall_64
      0.02 =C2=B1 88%     +78.0%       0.03 =C2=B1 61%  perf-sched.sch_dela=
y.avg.ms.do_syslog.part.0.kmsg_read.vfs_read
      0.00 =C2=B1 57%     +52.0%       0.01 =C2=B1 37%  perf-sched.sch_dela=
y.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall=
_64
      0.01 =C2=B1 20%     -10.6%       0.01 =C2=B1 37%  perf-sched.sch_dela=
y.avg.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_=
64_after_hwframe.[unknown]
      0.01 =C2=B1 62%     -18.4%       0.01 =C2=B1 13%  perf-sched.sch_dela=
y.avg.ms.pipe_read.new_sync_read.vfs_read.ksys_read
      2.22 =C2=B1 72%     -77.1%       0.51 =C2=B1223%  perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common.__cond_resched.mutex_lock.drm_gem_shmem_vu=
nmap.mgag200_handle_damage
      0.01 =C2=B1 41%   +2422.6%       0.22 =C2=B1210%  perf-sched.sch_dela=
y.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epo=
ll_wait
      0.01 =C2=B1 18%      -5.8%       0.01 =C2=B1 18%  perf-sched.sch_dela=
y.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.d=
o_select
      0.24 =C2=B1209%     -95.9%       0.01 =C2=B1 22%  perf-sched.sch_dela=
y.avg.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
      0.18 =C2=B1 85%     -61.6%       0.07 =C2=B1200%  perf-sched.sch_dela=
y.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
      0.20 =C2=B1138%    +124.9%       0.45 =C2=B1 65%  perf-sched.sch_dela=
y.avg.ms.worker_thread.kthread.ret_from_fork
      0.02 =C2=B1115%     +13.0%       0.02 =C2=B1 87%  perf-sched.sch_dela=
y.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.00        +6.7e+98%       0.00 =C2=B1223%  perf-sched.sch_delay.max=
.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall_64
      0.03 =C2=B1 96%     +93.0%       0.05 =C2=B1 69%  perf-sched.sch_dela=
y.max.ms.do_syslog.part.0.kmsg_read.vfs_read
      0.02 =C2=B1 72%     +85.6%       0.03 =C2=B1 35%  perf-sched.sch_dela=
y.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall=
_64
      0.01 =C2=B1 11%      -9.8%       0.01 =C2=B1 29%  perf-sched.sch_dela=
y.max.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_=
64_after_hwframe.[unknown]
      0.30 =C2=B1140%     -68.3%       0.10 =C2=B1 60%  perf-sched.sch_dela=
y.max.ms.pipe_read.new_sync_read.vfs_read.ksys_read
      2.22 =C2=B1 72%     -77.1%       0.51 =C2=B1223%  perf-sched.sch_dela=
y.max.ms.preempt_schedule_common.__cond_resched.mutex_lock.drm_gem_shmem_vu=
nmap.mgag200_handle_damage
      0.03 =C2=B1 47%   +5187.6%       1.50 =C2=B1217%  perf-sched.sch_dela=
y.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epo=
ll_wait
      0.01 =C2=B1 18%      -5.8%       0.01 =C2=B1 18%  perf-sched.sch_dela=
y.max.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.d=
o_select
      0.69 =C2=B1214%     -97.7%       0.02 =C2=B1 44%  perf-sched.sch_dela=
y.max.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
     12.69 =C2=B1 87%     -67.0%       4.19 =C2=B1221%  perf-sched.sch_dela=
y.max.ms.smpboot_thread_fn.kthread.ret_from_fork
      1.26 =C2=B1143%     +99.5%       2.52 =C2=B1 44%  perf-sched.sch_dela=
y.max.ms.worker_thread.kthread.ret_from_fork
      0.08 =C2=B1 75%     -56.4%       0.03 =C2=B1104%  perf-sched.total_sc=
h_delay.average.ms
     13.70 =C2=B1 73%     -44.2%       7.64 =C2=B1105%  perf-sched.total_sc=
h_delay.max.ms
      0.93 =C2=B1 45%     -20.0%       0.75 =C2=B1 57%  perf-sched.total_wa=
it_and_delay.average.ms
    296.50 =C2=B1 23%     +14.2%     338.67 =C2=B1 14%  perf-sched.total_wa=
it_and_delay.count.ms
     25.18 =C2=B1 35%     -15.9%      21.19 =C2=B1 55%  perf-sched.total_wa=
it_and_delay.max.ms
      0.86 =C2=B1 46%     -16.7%       0.71 =C2=B1 61%  perf-sched.total_wa=
it_time.average.ms
     21.56 =C2=B1 51%     -14.9%      18.35 =C2=B1 67%  perf-sched.total_wa=
it_time.max.ms
      0.77 =C2=B1100%     +42.2%       1.09 =C2=B1 45%  perf-sched.wait_and=
_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.05 =C2=B1223%     -98.6%       0.00 =C2=B1223%  perf-sched.wait_and=
_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall=
_64
      1.00 =C2=B1 71%     +37.1%       1.37 =C2=B1  8%  perf-sched.wait_and=
_delay.avg.ms.do_syslog.part.0.kmsg_read.vfs_read
      1.30 =C2=B1166%     -80.0%       0.26 =C2=B1172%  perf-sched.wait_and=
_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_sy=
scall_64
      0.06 =C2=B1136%   +2050.5%       1.38 =C2=B1223%  perf-sched.wait_and=
_delay.avg.ms.do_task_dead.do_exit.do_group_exit.get_signal.arch_do_signal_=
or_restart
      0.06 =C2=B1191%     -90.9%       0.01 =C2=B1 61%  perf-sched.wait_and=
_delay.avg.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYS=
CALL_64_after_hwframe.[unknown]
      0.06 =C2=B1 17%      +0.8%       0.06 =C2=B1 12%  perf-sched.wait_and=
_delay.avg.ms.pipe_read.new_sync_read.vfs_read.ksys_read
      0.03 =C2=B1223%    -100.0%       0.00        perf-sched.wait_and_dela=
y.avg.ms.preempt_schedule_common.__cond_resched.dput.__fput.task_work_run
      2.22 =C2=B1 72%     -77.1%       0.51 =C2=B1223%  perf-sched.wait_and=
_delay.avg.ms.preempt_schedule_common.__cond_resched.mutex_lock.drm_gem_shm=
em_vunmap.mgag200_handle_damage
      0.00        +1.7e+99%       0.00 =C2=B1223%  perf-sched.wait_and_dela=
y.avg.ms.preempt_schedule_common.__cond_resched.task_work_run.exit_to_user_=
mode_prepare.syscall_exit_to_user_mode
      0.22 =C2=B1 93%     +26.1%       0.28 =C2=B1 96%  perf-sched.wait_and=
_delay.avg.ms.preempt_schedule_common.__cond_resched.wait_for_completion.af=
fine_move_task.__set_cpus_allowed_ptr
      1.70 =C2=B1 46%      -9.7%       1.54 =C2=B1 46%  perf-sched.wait_and=
_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sy=
s_epoll_wait
      0.01 =C2=B1 18%     -24.6%       0.01 =C2=B1 49%  perf-sched.wait_and=
_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constpro=
p.0.do_select
      3.53 =C2=B1 11%      -1.7%       3.47 =C2=B1 11%  perf-sched.wait_and=
_delay.avg.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
      2.65 =C2=B1 52%     -13.9%       2.29 =C2=B1 69%  perf-sched.wait_and=
_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
      0.28 =C2=B1143%     +70.0%       0.47 =C2=B1 62%  perf-sched.wait_and=
_delay.avg.ms.worker_thread.kthread.ret_from_fork
      1.00 =C2=B1100%     +66.7%       1.67 =C2=B1 44%  perf-sched.wait_and=
_delay.count.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.33 =C2=B1141%      +0.0%       0.33 =C2=B1141%  perf-sched.wait_and=
_delay.count.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall_=
64
      1.33 =C2=B1 70%     +50.0%       2.00        perf-sched.wait_and_dela=
y.count.do_syslog.part.0.kmsg_read.vfs_read
      5.67 =C2=B1 26%     +23.5%       7.00 =C2=B1 27%  perf-sched.wait_and=
_delay.count.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_sys=
call_64
      0.83 =C2=B1 44%     -60.0%       0.33 =C2=B1141%  perf-sched.wait_and=
_delay.count.do_task_dead.do_exit.do_group_exit.get_signal.arch_do_signal_o=
r_restart
      0.00       +1.7e+101%       0.17 =C2=B1223%  perf-sched.wait_and_dela=
y.count.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.17 =C2=B1223%    +200.0%       0.50 =C2=B1152%  perf-sched.wait_and=
_delay.count.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysve=
c_reschedule_ipi.[unknown]
      1.17 =C2=B1 31%     -14.3%       1.00 =C2=B1 57%  perf-sched.wait_and=
_delay.count.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSC=
ALL_64_after_hwframe.[unknown]
    117.33 =C2=B1 59%     +26.1%     148.00 =C2=B1 14%  perf-sched.wait_and=
_delay.count.pipe_read.new_sync_read.vfs_read.ksys_read
      0.00       +1.7e+101%       0.17 =C2=B1223%  perf-sched.wait_and_dela=
y.count.preempt_schedule_common.__cond_resched.__fput.task_work_run.exit_to=
_user_mode_prepare
      1.00            +0.0%       1.00 =C2=B1 57%  perf-sched.wait_and_dela=
y.count.preempt_schedule_common.__cond_resched.dput.__fput.task_work_run
      0.17 =C2=B1223%    -100.0%       0.00        perf-sched.wait_and_dela=
y.count.preempt_schedule_common.__cond_resched.dput.path_put.vfs_statx
      0.00       +1.7e+101%       0.17 =C2=B1223%  perf-sched.wait_and_dela=
y.count.preempt_schedule_common.__cond_resched.dput.step_into.walk_component
      0.17 =C2=B1223%    -100.0%       0.00        perf-sched.wait_and_dela=
y.count.preempt_schedule_common.__cond_resched.dput.terminate_walk.path_loo=
kupat
      0.17 =C2=B1223%    -100.0%       0.00        perf-sched.wait_and_dela=
y.count.preempt_schedule_common.__cond_resched.kmem_cache_alloc.__alloc_fil=
e.alloc_empty_file
      0.17 =C2=B1223%    -100.0%       0.00        perf-sched.wait_and_dela=
y.count.preempt_schedule_common.__cond_resched.kmem_cache_alloc.getname_fla=
gs.do_sys_openat2
      0.67 =C2=B1 70%     -75.0%       0.17 =C2=B1223%  perf-sched.wait_and=
_delay.count.preempt_schedule_common.__cond_resched.mutex_lock.drm_gem_shme=
m_vunmap.mgag200_handle_damage
      0.17 =C2=B1223%    -100.0%       0.00        perf-sched.wait_and_dela=
y.count.preempt_schedule_common.__cond_resched.mutex_lock.perf_event_releas=
e_kernel.perf_release
      0.17 =C2=B1223%    +100.0%       0.33 =C2=B1141%  perf-sched.wait_and=
_delay.count.preempt_schedule_common.__cond_resched.stop_one_cpu.sched_exec=
.bprm_execve
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%  perf-sched.wait_and=
_delay.count.preempt_schedule_common.__cond_resched.task_work_run.exit_to_u=
ser_mode_prepare.syscall_exit_to_user_mode
     73.17 =C2=B1 12%      +5.7%      77.33 =C2=B1 16%  perf-sched.wait_and=
_delay.count.preempt_schedule_common.__cond_resched.wait_for_completion.aff=
ine_move_task.__set_cpus_allowed_ptr
      5.33 =C2=B1 25%     +21.9%       6.50 =C2=B1 14%  perf-sched.wait_and=
_delay.count.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys=
_epoll_wait
      1.00           -16.7%       0.83 =C2=B1 44%  perf-sched.wait_and_dela=
y.count.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do=
_select
      7.17 =C2=B1 38%     -16.3%       6.00 =C2=B1 49%  perf-sched.wait_and=
_delay.count.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
     74.33 =C2=B1 11%      +4.9%      78.00 =C2=B1 17%  perf-sched.wait_and=
_delay.count.smpboot_thread_fn.kthread.ret_from_fork
      4.83 =C2=B1 36%     +27.6%       6.17 =C2=B1 27%  perf-sched.wait_and=
_delay.count.worker_thread.kthread.ret_from_fork
      1.53 =C2=B1100%     +42.0%       2.17 =C2=B1 45%  perf-sched.wait_and=
_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.05 =C2=B1223%     -98.6%       0.00 =C2=B1223%  perf-sched.wait_and=
_delay.max.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall=
_64
      1.98 =C2=B1 71%     +36.2%       2.70 =C2=B1  8%  perf-sched.wait_and=
_delay.max.ms.do_syslog.part.0.kmsg_read.vfs_read
      5.88 =C2=B1144%     -72.3%       1.63 =C2=B1191%  perf-sched.wait_and=
_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_sy=
scall_64
      0.06 =C2=B1136%   +2050.5%       1.38 =C2=B1223%  perf-sched.wait_and=
_delay.max.ms.do_task_dead.do_exit.do_group_exit.get_signal.arch_do_signal_=
or_restart
      0.11 =C2=B1206%     -94.5%       0.01 =C2=B1 56%  perf-sched.wait_and=
_delay.max.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYS=
CALL_64_after_hwframe.[unknown]
      0.58 =C2=B1 85%    +101.6%       1.17 =C2=B1149%  perf-sched.wait_and=
_delay.max.ms.pipe_read.new_sync_read.vfs_read.ksys_read
      0.03 =C2=B1223%    -100.0%       0.00        perf-sched.wait_and_dela=
y.max.ms.preempt_schedule_common.__cond_resched.dput.__fput.task_work_run
      2.22 =C2=B1 72%     -77.1%       0.51 =C2=B1223%  perf-sched.wait_and=
_delay.max.ms.preempt_schedule_common.__cond_resched.mutex_lock.drm_gem_shm=
em_vunmap.mgag200_handle_damage
      0.00        +1.7e+99%       0.00 =C2=B1223%  perf-sched.wait_and_dela=
y.max.ms.preempt_schedule_common.__cond_resched.task_work_run.exit_to_user_=
mode_prepare.syscall_exit_to_user_mode
     10.58 =C2=B1103%      -3.7%      10.19 =C2=B1 71%  perf-sched.wait_and=
_delay.max.ms.preempt_schedule_common.__cond_resched.wait_for_completion.af=
fine_move_task.__set_cpus_allowed_ptr
      5.73 =C2=B1 64%      -4.7%       5.47 =C2=B1 71%  perf-sched.wait_and=
_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sy=
s_epoll_wait
      0.01 =C2=B1 18%     -24.6%       0.01 =C2=B1 49%  perf-sched.wait_and=
_delay.max.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constpro=
p.0.do_select
      4.82 =C2=B1  7%      +3.9%       5.01        perf-sched.wait_and_dela=
y.max.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
     25.18 =C2=B1 35%     -16.2%      21.12 =C2=B1 55%  perf-sched.wait_and=
_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork
      1.27 =C2=B1142%     +98.7%       2.52 =C2=B1 44%  perf-sched.wait_and=
_delay.max.ms.worker_thread.kthread.ret_from_fork
      0.76 =C2=B1100%     +42.7%       1.08 =C2=B1 45%  perf-sched.wait_tim=
e.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.05 =C2=B1223%    -100.0%       0.00        perf-sched.wait_time.avg=
.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall_64
      0.99 =C2=B1 71%     +36.4%       1.34 =C2=B1  8%  perf-sched.wait_tim=
e.avg.ms.do_syslog.part.0.kmsg_read.vfs_read
      1.29 =C2=B1166%     -80.4%       0.25 =C2=B1176%  perf-sched.wait_tim=
e.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall=
_64
      0.06 =C2=B1136%   +2050.5%       1.38 =C2=B1223%  perf-sched.wait_tim=
e.avg.ms.do_task_dead.do_exit.do_group_exit.get_signal.arch_do_signal_or_re=
start
      0.05 =C2=B1223%    -100.0%       0.00        perf-sched.wait_time.avg=
.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_af=
ter_hwframe.[unknown]
      0.06 =C2=B1 15%      +2.9%       0.06 =C2=B1 14%  perf-sched.wait_tim=
e.avg.ms.pipe_read.new_sync_read.vfs_read.ksys_read
      0.03 =C2=B1223%     +32.9%       0.04 =C2=B1223%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.dput.__fput.task_work_run
      0.00        +1.7e+99%       0.00 =C2=B1223%  perf-sched.wait_time.avg=
.ms.preempt_schedule_common.__cond_resched.task_work_run.exit_to_user_mode_=
prepare.syscall_exit_to_user_mode
      0.22 =C2=B1 93%     +26.1%       0.28 =C2=B1 96%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.wait_for_completion.affine_=
move_task.__set_cpus_allowed_ptr
      1.70 =C2=B1 46%     -22.4%       1.32 =C2=B1 38%  perf-sched.wait_tim=
e.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epo=
ll_wait
      3.30 =C2=B1  7%      +5.0%       3.46 =C2=B1 11%  perf-sched.wait_tim=
e.avg.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
      2.47 =C2=B1 55%     -10.4%       2.22 =C2=B1 73%  perf-sched.wait_tim=
e.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
      0.08 =C2=B1219%     -72.3%       0.02 =C2=B1223%  perf-sched.wait_tim=
e.avg.ms.worker_thread.kthread.ret_from_fork
      1.51 =C2=B1100%     +42.7%       2.16 =C2=B1 45%  perf-sched.wait_tim=
e.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.05 =C2=B1223%    -100.0%       0.00        perf-sched.wait_time.max=
.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall_64
      1.97 =C2=B1 71%     +36.4%       2.69 =C2=B1  8%  perf-sched.wait_tim=
e.max.ms.do_syslog.part.0.kmsg_read.vfs_read
      5.88 =C2=B1144%     -72.3%       1.63 =C2=B1191%  perf-sched.wait_tim=
e.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall=
_64
      0.06 =C2=B1136%   +2050.5%       1.38 =C2=B1223%  perf-sched.wait_tim=
e.max.ms.do_task_dead.do_exit.do_group_exit.get_signal.arch_do_signal_or_re=
start
      0.10 =C2=B1223%    -100.0%       0.00        perf-sched.wait_time.max=
.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_af=
ter_hwframe.[unknown]
      0.44 =C2=B1 92%    +156.8%       1.14 =C2=B1148%  perf-sched.wait_tim=
e.max.ms.pipe_read.new_sync_read.vfs_read.ksys_read
      0.03 =C2=B1223%     +32.9%       0.04 =C2=B1223%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.dput.__fput.task_work_run
      0.00        +1.7e+99%       0.00 =C2=B1223%  perf-sched.wait_time.max=
.ms.preempt_schedule_common.__cond_resched.task_work_run.exit_to_user_mode_=
prepare.syscall_exit_to_user_mode
     10.58 =C2=B1103%      -3.7%      10.19 =C2=B1 71%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.wait_for_completion.affine_=
move_task.__set_cpus_allowed_ptr
      5.73 =C2=B1 64%     -18.5%       4.67 =C2=B1 77%  perf-sched.wait_tim=
e.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epo=
ll_wait
      4.81 =C2=B1  7%      +3.9%       5.00        perf-sched.wait_time.max=
.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
     19.66 =C2=B1 58%      -9.4%      17.82 =C2=B1 72%  perf-sched.wait_tim=
e.max.ms.smpboot_thread_fn.kthread.ret_from_fork
      0.62 =C2=B1220%     -75.5%       0.15 =C2=B1223%  perf-sched.wait_tim=
e.max.ms.worker_thread.kthread.ret_from_fork
      3228            -0.8%       3202        softirqs.BLOCK
      4.83 =C2=B1134%     -20.7%       3.83 =C2=B1223%  softirqs.CPU0.BLOCK
      2.00            +0.0%       2.00        softirqs.CPU0.HI
      1.00            +0.0%       1.00        softirqs.CPU0.NET_RX
      0.00       +3.3e+101%       0.33 =C2=B1141%  softirqs.CPU0.NET_TX
     16126 =C2=B1 15%      +1.2%      16317 =C2=B1 18%  softirqs.CPU0.RCU
     13026 =C2=B1  4%      -4.8%      12404 =C2=B1 13%  softirqs.CPU0.SCHED
     48.33            +1.4%      49.00        softirqs.CPU0.TASKLET
      1371 =C2=B1 32%     -17.8%       1127 =C2=B1 38%  softirqs.CPU0.TIMER
      4.00 =C2=B1223%      +0.0%       4.00 =C2=B1223%  softirqs.CPU1.BLOCK
      1.00            +0.0%       1.00        softirqs.CPU1.NET_RX
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%  softirqs.CPU1.NET_TX
     13978 =C2=B1 14%      +0.5%      14052 =C2=B1 16%  softirqs.CPU1.RCU
     10998 =C2=B1  6%      +7.3%      11805 =C2=B1  8%  softirqs.CPU1.SCHED
      8.33 =C2=B1124%     -50.0%       4.17 =C2=B1 73%  softirqs.CPU1.TASKL=
ET
    149.50 =C2=B1 76%     +77.1%     264.83 =C2=B1 54%  softirqs.CPU1.TIMER
      0.00       +1.7e+101%       0.17 =C2=B1223%  softirqs.CPU10.BLOCK
     11811 =C2=B1 12%     +19.8%      14156 =C2=B1 12%  softirqs.CPU10.RCU
      7972 =C2=B1 35%     +11.7%       8904 =C2=B1 29%  softirqs.CPU10.SCHED
      0.67 =C2=B1111%    +650.0%       5.00 =C2=B1162%  softirqs.CPU10.TASK=
LET
    344.50 =C2=B1 61%     +17.9%     406.00 =C2=B1125%  softirqs.CPU10.TIMER
      8.00 =C2=B1141%     -25.0%       6.00 =C2=B1171%  softirqs.CPU11.BLOCK
      0.00       +1.8e+102%       1.83 =C2=B1223%  softirqs.CPU11.NET_TX
     11717 =C2=B1 13%     +14.0%      13358 =C2=B1 13%  softirqs.CPU11.RCU
      9856 =C2=B1 14%      -0.0%       9853 =C2=B1 23%  softirqs.CPU11.SCHED
      0.00       +1.2e+102%       1.17 =C2=B1187%  softirqs.CPU11.TASKLET
    389.00 =C2=B1116%     -44.0%     217.67 =C2=B1 50%  softirqs.CPU11.TIMER
     28.83 =C2=B1149%     -44.5%      16.00 =C2=B1141%  softirqs.CPU12.BLOCK
      1.83 =C2=B1223%    -100.0%       0.00        softirqs.CPU12.NET_TX
     11058 =C2=B1 10%     +16.0%      12832 =C2=B1  9%  softirqs.CPU12.RCU
     10225 =C2=B1 11%      +6.4%      10883 =C2=B1  3%  softirqs.CPU12.SCHED
      1.17 =C2=B1125%    -100.0%       0.00        softirqs.CPU12.TASKLET
    235.67 =C2=B1 33%     +72.6%     406.67 =C2=B1130%  softirqs.CPU12.TIMER
     22.83 =C2=B1118%     -35.0%      14.83 =C2=B1175%  softirqs.CPU13.BLOCK
     11592 =C2=B1 11%      +2.2%      11843 =C2=B1 22%  softirqs.CPU13.RCU
     11043 =C2=B1  2%      -3.1%      10704 =C2=B1  3%  softirqs.CPU13.SCHED
      0.50 =C2=B1223%    -100.0%       0.00        softirqs.CPU13.TASKLET
    437.17 =C2=B1 95%     -50.3%     217.33 =C2=B1 32%  softirqs.CPU13.TIMER
      0.33 =C2=B1223%   +6550.0%      22.17 =C2=B1106%  softirqs.CPU14.BLOCK
     12398 =C2=B1 11%      +7.1%      13275 =C2=B1 15%  softirqs.CPU14.RCU
     11042 =C2=B1  6%      +0.1%      11055 =C2=B1  4%  softirqs.CPU14.SCHED
      3.17 =C2=B1 69%     -36.8%       2.00        softirqs.CPU14.TASKLET
    426.83 =C2=B1105%     -61.4%     164.83 =C2=B1 86%  softirqs.CPU14.TIMER
     31.33 =C2=B1 99%     -55.9%      13.83 =C2=B1217%  softirqs.CPU15.BLOCK
      1.67 =C2=B1223%    -100.0%       0.00        softirqs.CPU15.NET_TX
     12171 =C2=B1 14%      +1.3%      12332 =C2=B1 10%  softirqs.CPU15.RCU
     11135 =C2=B1  4%      -2.4%      10873 =C2=B1  3%  softirqs.CPU15.SCHED
      2.00            +0.0%       2.00        softirqs.CPU15.TASKLET
    421.33 =C2=B1 53%     -54.9%     190.17 =C2=B1 41%  softirqs.CPU15.TIMER
      5.17 =C2=B1223%     -41.9%       3.00 =C2=B1223%  softirqs.CPU16.BLOCK
      1.67 =C2=B1197%    -100.0%       0.00        softirqs.CPU16.NET_TX
     13161 =C2=B1 17%      -6.0%      12376 =C2=B1 17%  softirqs.CPU16.RCU
     11077 =C2=B1  3%      -4.1%      10626 =C2=B1  2%  softirqs.CPU16.SCHED
      1.83 =C2=B1 20%     +18.2%       2.17 =C2=B1 17%  softirqs.CPU16.TASK=
LET
    410.50 =C2=B1 88%      -2.6%     400.00 =C2=B1 58%  softirqs.CPU16.TIMER
     13.00 =C2=B1144%      +9.0%      14.17 =C2=B1208%  softirqs.CPU17.BLOCK
      0.17 =C2=B1223%    -100.0%       0.00        softirqs.CPU17.NET_TX
     12908 =C2=B1 12%      +3.0%      13299 =C2=B1 18%  softirqs.CPU17.RCU
     10400 =C2=B1 11%      +4.2%      10840 =C2=B1  4%  softirqs.CPU17.SCHED
      2.00            +0.0%       2.00        softirqs.CPU17.TASKLET
    227.33 =C2=B1 60%    +113.0%     484.17 =C2=B1 96%  softirqs.CPU17.TIMER
     33.67 =C2=B1 44%     -50.5%      16.67 =C2=B1118%  softirqs.CPU18.BLOCK
     12945 =C2=B1 15%      +2.8%      13305 =C2=B1 13%  softirqs.CPU18.RCU
      9082 =C2=B1 25%     +16.8%      10607        softirqs.CPU18.SCHED
      2.17 =C2=B1 17%      -7.7%       2.00        softirqs.CPU18.TASKLET
    357.83 =C2=B1 75%     -67.8%     115.33 =C2=B1 47%  softirqs.CPU18.TIMER
     34.00 =C2=B1 92%     -77.5%       7.67 =C2=B1223%  softirqs.CPU19.BLOCK
     12801 =C2=B1 17%      +3.1%      13192 =C2=B1 17%  softirqs.CPU19.RCU
     10374 =C2=B1 17%      +3.8%      10764 =C2=B1  4%  softirqs.CPU19.SCHED
      2.17 =C2=B1 17%     +23.1%       2.67 =C2=B1 55%  softirqs.CPU19.TASK=
LET
    514.17 =C2=B1112%     -21.7%     402.67 =C2=B1153%  softirqs.CPU19.TIMER
     14.00 =C2=B1 78%     -35.7%       9.00 =C2=B1142%  softirqs.CPU2.BLOCK
      1.00            +0.0%       1.00        softirqs.CPU2.NET_RX
      0.00       +1.7e+101%       0.17 =C2=B1223%  softirqs.CPU2.NET_TX
     13439 =C2=B1 14%     +10.9%      14900 =C2=B1 13%  softirqs.CPU2.RCU
     10472 =C2=B1 12%     +10.2%      11541 =C2=B1  6%  softirqs.CPU2.SCHED
      1.67 =C2=B1 44%    +190.0%       4.83 =C2=B1103%  softirqs.CPU2.TASKL=
ET
    359.83 =C2=B1 40%     +28.1%     460.83 =C2=B1 76%  softirqs.CPU2.TIMER
     10.17 =C2=B1158%   +3593.4%     375.50 =C2=B1209%  softirqs.CPU20.BLOCK
     12471 =C2=B1 15%      +2.5%      12779 =C2=B1 10%  softirqs.CPU20.RCU
     10736            -1.9%      10527        softirqs.CPU20.SCHED
      2.00            +0.0%       2.00        softirqs.CPU20.TASKLET
    139.00 =C2=B1 49%      +4.1%     144.67 =C2=B1 48%  softirqs.CPU20.TIMER
      1.50 =C2=B1195%   +1488.9%      23.83 =C2=B1143%  softirqs.CPU21.BLOCK
     12549 =C2=B1 15%      +0.5%      12616 =C2=B1 14%  softirqs.CPU21.RCU
     11017 =C2=B1  4%      -4.7%      10503 =C2=B1  2%  softirqs.CPU21.SCHED
      2.00           +41.7%       2.83 =C2=B1 51%  softirqs.CPU21.TASKLET
    423.17 =C2=B1110%     -54.0%     194.50 =C2=B1 68%  softirqs.CPU21.TIMER
     17.50 =C2=B1134%     -75.2%       4.33 =C2=B1203%  softirqs.CPU22.BLOCK
     12495 =C2=B1 10%      -3.2%      12097 =C2=B1 13%  softirqs.CPU22.RCU
      9892 =C2=B1 23%      +7.3%      10612 =C2=B1  2%  softirqs.CPU22.SCHED
    260.33 =C2=B1 88%     +37.3%     357.33 =C2=B1126%  softirqs.CPU22.TIMER
     11.67 =C2=B1152%    +102.9%      23.67 =C2=B1 91%  softirqs.CPU23.BLOCK
     11744 =C2=B1 15%      +7.6%      12640 =C2=B1 22%  softirqs.CPU23.RCU
      8209 =C2=B1  5%      -4.7%       7819 =C2=B1 25%  softirqs.CPU23.SCHED
      4.33 =C2=B1177%    -100.0%       0.00        softirqs.CPU23.TASKLET
    204.17 =C2=B1 77%     -13.1%     177.50 =C2=B1 70%  softirqs.CPU23.TIMER
      0.00         +4e+102%       4.00 =C2=B1223%  softirqs.CPU24.BLOCK
     11513 =C2=B1 15%     +21.7%      14013 =C2=B1 18%  softirqs.CPU24.RCU
      7963 =C2=B1 32%     +26.2%      10052 =C2=B1 19%  softirqs.CPU24.SCHED
      4.50 =C2=B1223%     -66.7%       1.50 =C2=B1195%  softirqs.CPU24.TASK=
LET
    341.50 =C2=B1 64%     +38.3%     472.33 =C2=B1 62%  softirqs.CPU24.TIMER
      8.67 =C2=B1142%    -100.0%       0.00        softirqs.CPU25.BLOCK
     12053 =C2=B1 15%     +22.0%      14703 =C2=B1 21%  softirqs.CPU25.RCU
     10613 =C2=B1  2%     -16.4%       8871 =C2=B1 29%  softirqs.CPU25.SCHED
      1.00 =C2=B1223%    +316.7%       4.17 =C2=B1223%  softirqs.CPU25.TASK=
LET
    313.67 =C2=B1 52%      -8.8%     286.17 =C2=B1 97%  softirqs.CPU25.TIMER
      6.50 =C2=B1149%    -100.0%       0.00        softirqs.CPU26.BLOCK
    165.17 =C2=B1 41%     +84.5%     304.67 =C2=B1162%  softirqs.CPU26.NET_=
RX
      1.67 =C2=B1 28%    +220.0%       5.33 =C2=B1 95%  softirqs.CPU26.NET_=
TX
     12118 =C2=B1 17%     +20.7%      14623 =C2=B1 19%  softirqs.CPU26.RCU
      9437 =C2=B1 24%     +20.8%      11405 =C2=B1 10%  softirqs.CPU26.SCHED
      1.00 =C2=B1100%     -16.7%       0.83 =C2=B1 82%  softirqs.CPU26.TASK=
LET
    431.83 =C2=B1 34%     -48.4%     222.67 =C2=B1 76%  softirqs.CPU26.TIMER
      5.33 =C2=B1115%     -90.6%       0.50 =C2=B1223%  softirqs.CPU27.BLOCK
    528.33 =C2=B1 85%     +14.2%     603.33 =C2=B1183%  softirqs.CPU27.NET_=
RX
      2.83 =C2=B1146%      +0.0%       2.83 =C2=B1131%  softirqs.CPU27.NET_=
TX
     12574 =C2=B1 14%     +31.1%      16486 =C2=B1 19%  softirqs.CPU27.RCU
     10430 =C2=B1  9%      +9.9%      11465 =C2=B1  6%  softirqs.CPU27.SCHED
      0.00       +8.3e+101%       0.83 =C2=B1175%  softirqs.CPU27.TASKLET
    261.00 =C2=B1 75%     +12.9%     294.67 =C2=B1116%  softirqs.CPU27.TIMER
      2.67 =C2=B1223%    +168.8%       7.17 =C2=B1 95%  softirqs.CPU28.BLOCK
    171.67 =C2=B1 89%   +1305.2%       2412 =C2=B1147%  softirqs.CPU28.NET_=
RX
      2.17 =C2=B1 41%     -23.1%       1.67 =C2=B1 56%  softirqs.CPU28.NET_=
TX
     12389 =C2=B1 14%     +12.5%      13937 =C2=B1 18%  softirqs.CPU28.RCU
     10206 =C2=B1 13%      +6.5%      10867 =C2=B1 13%  softirqs.CPU28.SCHED
      7.33 =C2=B1168%     -79.5%       1.50 =C2=B1195%  softirqs.CPU28.TASK=
LET
    294.83 =C2=B1 59%     -13.3%     255.50 =C2=B1128%  softirqs.CPU28.TIMER
      1.50 =C2=B1195%    +488.9%       8.83 =C2=B1136%  softirqs.CPU29.BLOCK
    474.50 =C2=B1142%     +45.7%     691.50 =C2=B1193%  softirqs.CPU29.NET_=
RX
      0.50 =C2=B1100%    +100.0%       1.00 =C2=B1100%  softirqs.CPU29.NET_=
TX
     13356 =C2=B1  8%     +10.3%      14726 =C2=B1 19%  softirqs.CPU29.RCU
     10338 =C2=B1 16%      +7.0%      11062 =C2=B1 10%  softirqs.CPU29.SCHED
      0.17 =C2=B1223%    +700.0%       1.33 =C2=B1223%  softirqs.CPU29.TASK=
LET
    213.50 =C2=B1 83%     +17.1%     250.00 =C2=B1 97%  softirqs.CPU29.TIMER
      6.00 =C2=B1146%     +13.9%       6.83 =C2=B1139%  softirqs.CPU3.BLOCK
      1.00            +0.0%       1.00        softirqs.CPU3.NET_RX
      0.00       +1.5e+102%       1.50 =C2=B1223%  softirqs.CPU3.NET_TX
     13380 =C2=B1 11%      +5.6%      14135 =C2=B1 20%  softirqs.CPU3.RCU
     10839 =C2=B1  4%      -4.2%      10381 =C2=B1 19%  softirqs.CPU3.SCHED
      3.67 =C2=B1101%      +0.0%       3.67 =C2=B1114%  softirqs.CPU3.TASKL=
ET
    230.67 =C2=B1 42%     +48.0%     341.33 =C2=B1 61%  softirqs.CPU3.TIMER
      0.17 =C2=B1223%   +1900.0%       3.33 =C2=B1145%  softirqs.CPU30.BLOCK
      1489 =C2=B1135%     -86.5%     201.00 =C2=B1107%  softirqs.CPU30.NET_=
RX
      1.67 =C2=B1 44%     +10.0%       1.83 =C2=B1 48%  softirqs.CPU30.NET_=
TX
     13069 =C2=B1 19%      +6.8%      13961 =C2=B1 20%  softirqs.CPU30.RCU
     11098 =C2=B1  3%      +4.7%      11617 =C2=B1  4%  softirqs.CPU30.SCHED
    390.33 =C2=B1102%      -2.4%     381.00 =C2=B1106%  softirqs.CPU30.TIMER
      7.00 =C2=B1152%     +57.1%      11.00 =C2=B1106%  softirqs.CPU31.BLOCK
      2616 =C2=B1163%     -93.1%     181.67 =C2=B1 86%  softirqs.CPU31.NET_=
RX
      0.83 =C2=B1107%     +20.0%       1.00 =C2=B1 57%  softirqs.CPU31.NET_=
TX
     12326 =C2=B1  8%     +15.4%      14224 =C2=B1 19%  softirqs.CPU31.RCU
      9520 =C2=B1 29%     +17.5%      11190 =C2=B1 12%  softirqs.CPU31.SCHED
      0.00       +3.5e+102%       3.50 =C2=B1211%  softirqs.CPU31.TASKLET
    161.83 =C2=B1 54%    +260.1%     582.83 =C2=B1 68%  softirqs.CPU31.TIMER
      4.67 =C2=B1141%     -57.1%       2.00 =C2=B1223%  softirqs.CPU32.BLOCK
    199.00 =C2=B1109%      -2.3%     194.33 =C2=B1 53%  softirqs.CPU32.NET_=
RX
      1.67 =C2=B1 28%     -20.0%       1.33 =C2=B1 35%  softirqs.CPU32.NET_=
TX
     10997 =C2=B1  8%     +24.3%      13672 =C2=B1 18%  softirqs.CPU32.RCU
     11101 =C2=B1  4%      -4.2%      10631 =C2=B1 17%  softirqs.CPU32.SCHED
      1.67 =C2=B1223%    -100.0%       0.00        softirqs.CPU32.TASKLET
    362.17 =C2=B1 67%     -30.6%     251.50 =C2=B1100%  softirqs.CPU32.TIMER
      3.83 =C2=B1223%     -26.1%       2.83 =C2=B1223%  softirqs.CPU33.BLOCK
    180.00 =C2=B1116%    +234.0%     601.17 =C2=B1139%  softirqs.CPU33.NET_=
RX
      1.17 =C2=B1 31%     +14.3%       1.33 =C2=B1 70%  softirqs.CPU33.NET_=
TX
     11241 =C2=B1  9%     +15.3%      12963 =C2=B1 18%  softirqs.CPU33.RCU
     10370 =C2=B1 13%     +11.2%      11530 =C2=B1  3%  softirqs.CPU33.SCHED
      2.33 =C2=B1223%     -85.7%       0.33 =C2=B1223%  softirqs.CPU33.TASK=
LET
    271.83 =C2=B1 55%     -31.0%     187.67 =C2=B1 82%  softirqs.CPU33.TIMER
      0.17 =C2=B1223%   +2100.0%       3.67 =C2=B1211%  softirqs.CPU34.BLOCK
      1.67 =C2=B1223%    -100.0%       0.00        softirqs.CPU34.NET_TX
     11565 =C2=B1 11%     +21.8%      14091 =C2=B1 20%  softirqs.CPU34.RCU
     11008            +6.2%      11686 =C2=B1  4%  softirqs.CPU34.SCHED
      2.17 =C2=B1136%    -100.0%       0.00        softirqs.CPU34.TASKLET
    363.33 =C2=B1 49%     -22.5%     281.67 =C2=B1 53%  softirqs.CPU34.TIMER
      2.50 =C2=B1206%    -100.0%       0.00        softirqs.CPU35.BLOCK
      1.00            +0.0%       1.00        softirqs.CPU35.NET_RX
      1.83 =C2=B1223%      +0.0%       1.83 =C2=B1223%  softirqs.CPU35.NET_=
TX
     10541 =C2=B1 14%     +30.3%      13733 =C2=B1 13%  softirqs.CPU35.RCU
     10778 =C2=B1  3%      -1.3%      10636 =C2=B1 15%  softirqs.CPU35.SCHED
      2.00           +83.3%       3.67 =C2=B1101%  softirqs.CPU35.TASKLET
    330.17 =C2=B1 72%     +77.7%     586.67 =C2=B1 91%  softirqs.CPU35.TIMER
     24.83 =C2=B1 99%     +10.1%      27.33 =C2=B1 84%  softirqs.CPU36.BLOCK
     13910 =C2=B1 17%      +3.1%      14344 =C2=B1 17%  softirqs.CPU36.RCU
     10932 =C2=B1  3%      +3.7%      11339 =C2=B1  7%  softirqs.CPU36.SCHED
      5.00 =C2=B1190%     -20.0%       4.00 =C2=B1212%  softirqs.CPU36.TASK=
LET
    264.50 =C2=B1 44%    +238.2%     894.67 =C2=B1 75%  softirqs.CPU36.TIMER
    374.33 =C2=B1215%     -87.9%      45.33 =C2=B1136%  softirqs.CPU37.BLOCK
      0.17 =C2=B1223%    -100.0%       0.00        softirqs.CPU37.NET_TX
     13768 =C2=B1 15%      -0.6%      13688 =C2=B1 18%  softirqs.CPU37.RCU
      9835 =C2=B1 24%     +13.3%      11143 =C2=B1  3%  softirqs.CPU37.SCHED
      0.17 =C2=B1223%    -100.0%       0.00        softirqs.CPU37.TASKLET
    191.83 =C2=B1 95%     +15.3%     221.17 =C2=B1 67%  softirqs.CPU37.TIMER
     61.33 =C2=B1169%     -60.3%      24.33 =C2=B1105%  softirqs.CPU38.BLOCK
     13829 =C2=B1 18%      -1.3%      13648 =C2=B1 19%  softirqs.CPU38.RCU
     10956 =C2=B1  5%      +2.2%      11198 =C2=B1  5%  softirqs.CPU38.SCHED
      0.50 =C2=B1223%    -100.0%       0.00        softirqs.CPU38.TASKLET
    216.00 =C2=B1 51%     +31.2%     283.33 =C2=B1 57%  softirqs.CPU38.TIMER
      7.00 =C2=B1135%     +33.3%       9.33 =C2=B1196%  softirqs.CPU39.BLOCK
     14537 =C2=B1 17%      -4.2%      13932 =C2=B1 19%  softirqs.CPU39.RCU
     10366 =C2=B1 11%      +6.0%      10985 =C2=B1  2%  softirqs.CPU39.SCHED
      2.00 =C2=B1152%    -100.0%       0.00        softirqs.CPU39.TASKLET
    127.67 =C2=B1 45%     +81.5%     231.67 =C2=B1 62%  softirqs.CPU39.TIMER
      1.00            +0.0%       1.00        softirqs.CPU4.NET_RX
     12843 =C2=B1 11%     +17.4%      15083 =C2=B1 26%  softirqs.CPU4.RCU
     10146 =C2=B1  9%      +9.4%      11104 =C2=B1  6%  softirqs.CPU4.SCHED
      3.33 =C2=B1 95%    +105.0%       6.83 =C2=B1133%  softirqs.CPU4.TASKL=
ET
    526.33 =C2=B1 78%      +0.5%     528.83 =C2=B1 72%  softirqs.CPU4.TIMER
    378.33 =C2=B1213%     -84.5%      58.67 =C2=B1102%  softirqs.CPU40.BLOCK
     14784 =C2=B1 22%      +0.7%      14891 =C2=B1 18%  softirqs.CPU40.RCU
     11063 =C2=B1  4%      -3.5%      10674 =C2=B1 12%  softirqs.CPU40.SCHED
      0.83 =C2=B1223%    -100.0%       0.00        softirqs.CPU40.TASKLET
    120.17 =C2=B1 44%    +175.3%     330.83 =C2=B1144%  softirqs.CPU40.TIMER
    382.67 =C2=B1213%     -93.2%      26.00 =C2=B1100%  softirqs.CPU41.BLOCK
     13960 =C2=B1 19%      +4.2%      14542 =C2=B1 18%  softirqs.CPU41.RCU
     10367 =C2=B1 16%      -4.2%       9933 =C2=B1 29%  softirqs.CPU41.SCHED
      0.00       +1.7e+101%       0.17 =C2=B1223%  softirqs.CPU41.TASKLET
    223.33 =C2=B1 73%     -45.4%     122.00 =C2=B1 65%  softirqs.CPU41.TIMER
      3.33 =C2=B1197%    +455.0%      18.50 =C2=B1155%  softirqs.CPU42.BLOCK
      0.17 =C2=B1223%    -100.0%       0.00        softirqs.CPU42.NET_TX
     14572 =C2=B1 15%      -0.3%      14526 =C2=B1 20%  softirqs.CPU42.RCU
     10616 =C2=B1  5%      -9.8%       9578 =C2=B1 28%  softirqs.CPU42.SCHED
      3.00 =C2=B1223%     +55.6%       4.67 =C2=B1141%  softirqs.CPU42.TASK=
LET
    249.17 =C2=B1 61%     -19.4%     200.83 =C2=B1 67%  softirqs.CPU42.TIMER
      9.00 =C2=B1109%     +96.3%      17.67 =C2=B1116%  softirqs.CPU43.BLOCK
     14197 =C2=B1 18%      +4.3%      14801 =C2=B1 16%  softirqs.CPU43.RCU
     10735 =C2=B1 13%      +1.6%      10911        softirqs.CPU43.SCHED
      1.67 =C2=B1157%    -100.0%       0.00        softirqs.CPU43.TASKLET
    422.67 =C2=B1112%     -54.5%     192.33 =C2=B1 75%  softirqs.CPU43.TIMER
     48.67 =C2=B1185%     -80.8%       9.33 =C2=B1141%  softirqs.CPU44.BLOCK
     13418 =C2=B1 15%      +3.0%      13815 =C2=B1 13%  softirqs.CPU44.RCU
     10443 =C2=B1 16%      +4.0%      10857        softirqs.CPU44.SCHED
      0.50 =C2=B1223%    -100.0%       0.00        softirqs.CPU44.TASKLET
    221.00 =C2=B1 34%     -23.7%     168.67 =C2=B1 52%  softirqs.CPU44.TIMER
     14.17 =C2=B1151%     +48.2%      21.00 =C2=B1219%  softirqs.CPU45.BLOCK
     13633 =C2=B1 18%      +4.7%      14273 =C2=B1 20%  softirqs.CPU45.RCU
      9909 =C2=B1 24%     +10.1%      10905        softirqs.CPU45.SCHED
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%  softirqs.CPU45.TASK=
LET
    159.33 =C2=B1 52%     +18.5%     188.83 =C2=B1 86%  softirqs.CPU45.TIMER
     17.50 =C2=B1141%     -72.4%       4.83 =C2=B1223%  softirqs.CPU46.BLOCK
     13005 =C2=B1 15%      +0.5%      13074 =C2=B1 18%  softirqs.CPU46.RCU
     10887 =C2=B1  3%      -0.2%      10864        softirqs.CPU46.SCHED
      0.33 =C2=B1223%    -100.0%       0.00        softirqs.CPU46.TASKLET
    345.00 =C2=B1 64%     -45.6%     187.67 =C2=B1 77%  softirqs.CPU46.TIMER
     19.00 =C2=B1122%    -100.0%       0.00        softirqs.CPU47.BLOCK
     13356 =C2=B1 18%      -5.5%      12627 =C2=B1 21%  softirqs.CPU47.RCU
     10376 =C2=B1  4%      -6.4%       9715 =C2=B1 15%  softirqs.CPU47.SCHED
      0.50 =C2=B1152%    -100.0%       0.00        softirqs.CPU47.TASKLET
    206.67 =C2=B1 70%     +16.2%     240.17 =C2=B1 86%  softirqs.CPU47.TIMER
      8.00 =C2=B1141%     -64.6%       2.83 =C2=B1223%  softirqs.CPU5.BLOCK
      1.00            +0.0%       1.00        softirqs.CPU5.NET_RX
      0.00          -100.0%       0.00        softirqs.CPU5.NET_TX
     12761 =C2=B1 14%      +3.7%      13236 =C2=B1 22%  softirqs.CPU5.RCU
     10620 =C2=B1  2%      +1.4%      10764 =C2=B1  8%  softirqs.CPU5.SCHED
      2.00          +325.0%       8.50 =C2=B1110%  softirqs.CPU5.TASKLET
    214.50 =C2=B1 49%    +177.5%     595.33 =C2=B1 60%  softirqs.CPU5.TIMER
      0.17 =C2=B1223%   +1100.0%       2.00 =C2=B1223%  softirqs.CPU6.BLOCK
      1.00            +0.0%       1.00        softirqs.CPU6.NET_RX
      0.00          -100.0%       0.00        softirqs.CPU6.NET_TX
     12007 =C2=B1 12%      +7.9%      12957 =C2=B1 18%  softirqs.CPU6.RCU
     10068 =C2=B1  9%      +7.8%      10850        softirqs.CPU6.SCHED
      2.33 =C2=B1 31%     +64.3%       3.83 =C2=B1106%  softirqs.CPU6.TASKL=
ET
    299.33 =C2=B1 43%     -52.1%     143.33 =C2=B1 35%  softirqs.CPU6.TIMER
    884.83 =C2=B1142%     -95.2%      42.67 =C2=B1205%  softirqs.CPU7.BLOCK
      0.17 =C2=B1223%    -100.0%       0.00        softirqs.CPU7.NET_TX
     12243 =C2=B1 15%      +8.2%      13245 =C2=B1 18%  softirqs.CPU7.RCU
     10621 =C2=B1  2%      +6.1%      11267 =C2=B1  5%  softirqs.CPU7.SCHED
      1122 =C2=B1141%     -50.7%     553.50 =C2=B1223%  softirqs.CPU7.TASKL=
ET
    462.83 =C2=B1 68%      +2.6%     474.83 =C2=B1 51%  softirqs.CPU7.TIMER
    703.67 =C2=B1150%    +224.4%       2282 =C2=B1 45%  softirqs.CPU8.BLOCK
     12176 =C2=B1 14%      +8.3%      13192 =C2=B1 13%  softirqs.CPU8.RCU
     10114 =C2=B1  9%      +8.7%      10996 =C2=B1  2%  softirqs.CPU8.SCHED
      2282 =C2=B1 70%     +23.9%       2826 =C2=B1 44%  softirqs.CPU8.TASKL=
ET
    373.83 =C2=B1 85%     -14.7%     319.00 =C2=B1 67%  softirqs.CPU8.TIMER
      0.50 =C2=B1100%    -100.0%       0.00        softirqs.CPU9.BLOCK
      0.00       +1.7e+101%       0.17 =C2=B1223%  softirqs.CPU9.HI
     13374 =C2=B1 20%      +8.7%      14541 =C2=B1 19%  softirqs.CPU9.RCU
     10508 =C2=B1  2%      +6.2%      11157        softirqs.CPU9.SCHED
     83.83 =C2=B1  2%      -1.0%      83.00        softirqs.CPU9.TASKLET
    607.50 =C2=B1 68%     -20.4%     483.50 =C2=B1 57%  softirqs.CPU9.TIMER
      2.00            +8.3%       2.17 =C2=B1 17%  softirqs.HI
      5834 =C2=B1 57%     -10.9%       5200 =C2=B1 79%  softirqs.NET_RX
     23.00 =C2=B1  8%      +2.2%      23.50 =C2=B1  5%  softirqs.NET_TX
    614891 =C2=B1 13%      +7.5%     661084 =C2=B1 15%  softirqs.RCU
    498848 =C2=B1  2%      +3.4%     515988        softirqs.SCHED
      3619            -0.6%       3596        softirqs.TASKLET
     15881            +0.4%      15943 =C2=B1  2%  softirqs.TIMER
    133494            -0.0%     133479        slabinfo.Acpi-Operand.active_=
objs
      2385            -0.0%       2385        slabinfo.Acpi-Operand.active_=
slabs
    133606            -0.0%     133560        slabinfo.Acpi-Operand.num_objs
      2385            -0.0%       2385        slabinfo.Acpi-Operand.num_sla=
bs
      1152 =C2=B1  9%      -4.3%       1103 =C2=B1  7%  slabinfo.Acpi-Parse=
.active_objs
     15.17 =C2=B1 11%      -5.5%      14.33 =C2=B1  7%  slabinfo.Acpi-Parse=
.active_slabs
      1152 =C2=B1  9%      -4.3%       1103 =C2=B1  7%  slabinfo.Acpi-Parse=
.num_objs
     15.17 =C2=B1 11%      -5.5%      14.33 =C2=B1  7%  slabinfo.Acpi-Parse=
.num_slabs
      2515            +0.3%       2523        slabinfo.Acpi-State.active_ob=
js
     49.17            -0.3%      49.00        slabinfo.Acpi-State.active_sl=
abs
      2515            +0.3%       2523        slabinfo.Acpi-State.num_objs
     49.17            -0.3%      49.00        slabinfo.Acpi-State.num_slabs
      1310 =C2=B1  5%     -25.1%     980.83 =C2=B1 18%  slabinfo.PING.activ=
e_objs
     40.50 =C2=B1  5%     -25.1%      30.33 =C2=B1 17%  slabinfo.PING.activ=
e_slabs
      1310 =C2=B1  5%     -25.1%     980.83 =C2=B1 18%  slabinfo.PING.num_o=
bjs
     40.50 =C2=B1  5%     -25.1%      30.33 =C2=B1 17%  slabinfo.PING.num_s=
labs
    352.00            +0.0%     352.00        slabinfo.RAW.active_objs
     11.00            +0.0%      11.00        slabinfo.RAW.active_slabs
    352.00            +0.0%     352.00        slabinfo.RAW.num_objs
     11.00            +0.0%      11.00        slabinfo.RAW.num_slabs
    182.00            +0.0%     182.00        slabinfo.RAWv6.active_objs
      7.00            +0.0%       7.00        slabinfo.RAWv6.active_slabs
    182.00            +0.0%     182.00        slabinfo.RAWv6.num_objs
      7.00            +0.0%       7.00        slabinfo.RAWv6.num_slabs
     56.00            -8.3%      51.33 =C2=B1 12%  slabinfo.TCP.active_objs
      4.00            -8.3%       3.67 =C2=B1 12%  slabinfo.TCP.active_slabs
     56.00            -8.3%      51.33 =C2=B1 12%  slabinfo.TCP.num_objs
      4.00            -8.3%       3.67 =C2=B1 12%  slabinfo.TCP.num_slabs
     39.00            -5.6%      36.83 =C2=B1 13%  slabinfo.TCPv6.active_ob=
js
      3.00            -5.6%       2.83 =C2=B1 13%  slabinfo.TCPv6.active_sl=
abs
     39.00            -5.6%      36.83 =C2=B1 13%  slabinfo.TCPv6.num_objs
      3.00            -5.6%       2.83 =C2=B1 13%  slabinfo.TCPv6.num_slabs
    124.67 =C2=B1 12%      +6.6%     132.83 =C2=B1 13%  slabinfo.UDPv6.acti=
ve_objs
      5.17 =C2=B1 13%      +6.5%       5.50 =C2=B1 13%  slabinfo.UDPv6.acti=
ve_slabs
    124.67 =C2=B1 12%      +6.6%     132.83 =C2=B1 13%  slabinfo.UDPv6.num_=
objs
      5.17 =C2=B1 13%      +6.5%       5.50 =C2=B1 13%  slabinfo.UDPv6.num_=
slabs
     14646 =C2=B1  2%      -3.5%      14136 =C2=B1  3%  slabinfo.anon_vma.a=
ctive_objs
    318.00 =C2=B1  2%      -3.5%     306.83 =C2=B1  3%  slabinfo.anon_vma.a=
ctive_slabs
     14646 =C2=B1  2%      -3.5%      14136 =C2=B1  3%  slabinfo.anon_vma.n=
um_objs
    318.00 =C2=B1  2%      -3.5%     306.83 =C2=B1  3%  slabinfo.anon_vma.n=
um_slabs
     38145           +16.5%      44457        slabinfo.anon_vma_chain.activ=
e_objs
    600.50           +16.0%     696.50        slabinfo.anon_vma_chain.activ=
e_slabs
     38466           +16.0%      44610        slabinfo.anon_vma_chain.num_o=
bjs
    600.50           +16.0%     696.50        slabinfo.anon_vma_chain.num_s=
labs
    116.67 =C2=B1 11%     +17.1%     136.67 =C2=B1 13%  slabinfo.bdev_cache=
.active_objs
      5.83 =C2=B1 11%     +17.1%       6.83 =C2=B1 13%  slabinfo.bdev_cache=
.active_slabs
    116.67 =C2=B1 11%     +17.1%     136.67 =C2=B1 13%  slabinfo.bdev_cache=
.num_objs
      5.83 =C2=B1 11%     +17.1%       6.83 =C2=B1 13%  slabinfo.bdev_cache=
.num_slabs
    162.67 =C2=B1 19%      +4.9%     170.67 =C2=B1 11%  slabinfo.biovec-128=
.active_objs
     10.17 =C2=B1 19%      +4.9%      10.67 =C2=B1 11%  slabinfo.biovec-128=
.active_slabs
    162.67 =C2=B1 19%      +4.9%     170.67 =C2=B1 11%  slabinfo.biovec-128=
.num_objs
     10.17 =C2=B1 19%      +4.9%      10.67 =C2=B1 11%  slabinfo.biovec-128=
.num_slabs
    426.67 =C2=B1  8%     -11.2%     378.67 =C2=B1 11%  slabinfo.biovec-64.=
active_objs
     13.33 =C2=B1  8%     -11.2%      11.83 =C2=B1 11%  slabinfo.biovec-64.=
active_slabs
    426.67 =C2=B1  8%     -11.2%     378.67 =C2=B1 11%  slabinfo.biovec-64.=
num_objs
     13.33 =C2=B1  8%     -11.2%      11.83 =C2=B1 11%  slabinfo.biovec-64.=
num_slabs
    122.83 =C2=B1 11%      +3.1%     126.67 =C2=B1  8%  slabinfo.biovec-max=
.active_objs
     15.83 =C2=B1 11%      +3.2%      16.33 =C2=B1 10%  slabinfo.biovec-max=
.active_slabs
    130.50 =C2=B1 12%      +3.1%     134.50 =C2=B1 10%  slabinfo.biovec-max=
.num_objs
     15.83 =C2=B1 11%      +3.2%      16.33 =C2=B1 10%  slabinfo.biovec-max=
.num_slabs
    438.50 =C2=B1  7%      -5.8%     413.17 =C2=B1  9%  slabinfo.buffer_hea=
d.active_objs
     13.17 =C2=B1  2%      -6.3%      12.33 =C2=B1  6%  slabinfo.buffer_hea=
d.active_slabs
    530.17 =C2=B1  4%      -6.5%     495.67 =C2=B1  7%  slabinfo.buffer_hea=
d.num_objs
     13.17 =C2=B1  2%      -6.3%      12.33 =C2=B1  6%  slabinfo.buffer_hea=
d.num_slabs
     18369 =C2=B1  2%      +0.1%      18382 =C2=B1  9%  slabinfo.cred_jar.a=
ctive_objs
    437.50 =C2=B1  2%      +0.1%     438.00 =C2=B1  9%  slabinfo.cred_jar.a=
ctive_slabs
     18407 =C2=B1  2%      +0.1%      18417 =C2=B1  9%  slabinfo.cred_jar.n=
um_objs
    437.50 =C2=B1  2%      +0.1%     438.00 =C2=B1  9%  slabinfo.cred_jar.n=
um_slabs
     42.00            +0.0%      42.00        slabinfo.dax_cache.active_objs
      1.00            +0.0%       1.00        slabinfo.dax_cache.active_sla=
bs
     42.00            +0.0%      42.00        slabinfo.dax_cache.num_objs
      1.00            +0.0%       1.00        slabinfo.dax_cache.num_slabs
     79834            -2.9%      77489        slabinfo.dentry.active_objs
      1936            -1.4%       1910        slabinfo.dentry.active_slabs
     81364            -1.4%      80255        slabinfo.dentry.num_objs
      1936            -1.4%       1910        slabinfo.dentry.num_slabs
     30.00            +0.0%      30.00        slabinfo.dmaengine-unmap-128.=
active_objs
      1.00            +0.0%       1.00        slabinfo.dmaengine-unmap-128.=
active_slabs
     30.00            +0.0%      30.00        slabinfo.dmaengine-unmap-128.=
num_objs
      1.00            +0.0%       1.00        slabinfo.dmaengine-unmap-128.=
num_slabs
      2554 =C2=B1  7%      -7.2%       2369 =C2=B1 15%  slabinfo.dmaengine-=
unmap-16.active_objs
     60.50 =C2=B1  7%      -2.2%      59.17 =C2=B1 15%  slabinfo.dmaengine-=
unmap-16.active_slabs
      2560 =C2=B1  7%      -2.7%       2492 =C2=B1 15%  slabinfo.dmaengine-=
unmap-16.num_objs
     60.50 =C2=B1  7%      -2.2%      59.17 =C2=B1 15%  slabinfo.dmaengine-=
unmap-16.num_slabs
     15.00            +0.0%      15.00        slabinfo.dmaengine-unmap-256.=
active_objs
      1.00            +0.0%       1.00        slabinfo.dmaengine-unmap-256.=
active_slabs
     15.00            +0.0%      15.00        slabinfo.dmaengine-unmap-256.=
num_objs
      1.00            +0.0%       1.00        slabinfo.dmaengine-unmap-256.=
num_slabs
    110.83 =C2=B1 26%      -7.4%     102.67 =C2=B1 28%  slabinfo.dquot.acti=
ve_objs
      2.83 =C2=B1 37%      +0.0%       2.83 =C2=B1 31%  slabinfo.dquot.acti=
ve_slabs
    110.83 =C2=B1 26%      -7.4%     102.67 =C2=B1 28%  slabinfo.dquot.num_=
objs
      2.83 =C2=B1 37%      +0.0%       2.83 =C2=B1 31%  slabinfo.dquot.num_=
slabs
     11477 =C2=B1  2%      -1.5%      11306 =C2=B1  5%  slabinfo.ep_head.ac=
tive_objs
     44.83 =C2=B1  2%      -1.5%      44.17 =C2=B1  5%  slabinfo.ep_head.ac=
tive_slabs
     11477 =C2=B1  2%      -1.5%      11306 =C2=B1  5%  slabinfo.ep_head.nu=
m_objs
     44.83 =C2=B1  2%      -1.5%      44.17 =C2=B1  5%  slabinfo.ep_head.nu=
m_slabs
    200.00            +0.0%     200.00        slabinfo.ext4_extent_status.a=
ctive_objs
      1.00            +0.0%       1.00        slabinfo.ext4_extent_status.a=
ctive_slabs
    200.00            +0.0%     200.00        slabinfo.ext4_extent_status.n=
um_objs
      1.00            +0.0%       1.00        slabinfo.ext4_extent_status.n=
um_slabs
      1624            +0.0%       1624        slabinfo.ext4_groupinfo_4k.ac=
tive_objs
     58.00            +0.0%      58.00        slabinfo.ext4_groupinfo_4k.ac=
tive_slabs
      1624            +0.0%       1624        slabinfo.ext4_groupinfo_4k.nu=
m_objs
     58.00            +0.0%      58.00        slabinfo.ext4_groupinfo_4k.nu=
m_slabs
     27.00            +0.0%      27.00        slabinfo.ext4_inode_cache.act=
ive_objs
      1.00            +0.0%       1.00        slabinfo.ext4_inode_cache.act=
ive_slabs
     27.00            +0.0%      27.00        slabinfo.ext4_inode_cache.num=
_objs
      1.00            +0.0%       1.00        slabinfo.ext4_inode_cache.num=
_slabs
    204.00            +0.0%     204.00        slabinfo.ext4_system_zone.act=
ive_objs
      2.00            +0.0%       2.00        slabinfo.ext4_system_zone.act=
ive_slabs
    204.00            +0.0%     204.00        slabinfo.ext4_system_zone.num=
_objs
      2.00            +0.0%       2.00        slabinfo.ext4_system_zone.num=
_slabs
    861.67 =C2=B1  8%     -15.0%     732.33 =C2=B1 12%  slabinfo.file_lock_=
cache.active_objs
     22.83 =C2=B1  7%     -15.3%      19.33 =C2=B1 11%  slabinfo.file_lock_=
cache.active_slabs
    861.67 =C2=B1  8%     -15.0%     732.33 =C2=B1 12%  slabinfo.file_lock_=
cache.num_objs
     22.83 =C2=B1  7%     -15.3%      19.33 =C2=B1 11%  slabinfo.file_lock_=
cache.num_slabs
      2443            -1.8%       2398        slabinfo.files_cache.active_o=
bjs
     52.50            -1.3%      51.83        slabinfo.files_cache.active_s=
labs
      2443            -1.8%       2398        slabinfo.files_cache.num_objs
     52.50            -1.3%      51.83        slabinfo.files_cache.num_slabs
     16240 =C2=B1  2%      -1.3%      16032        slabinfo.filp.active_objs
    531.00 =C2=B1  2%      -3.2%     513.83        slabinfo.filp.active_sla=
bs
     17011 =C2=B1  2%      -3.2%      16459        slabinfo.filp.num_objs
    531.00 =C2=B1  2%      -3.2%     513.83        slabinfo.filp.num_slabs
      2560 =C2=B1  7%      -5.8%       2410 =C2=B1  8%  slabinfo.fsnotify_m=
ark_connector.active_objs
     20.00 =C2=B1  7%      -5.8%      18.83 =C2=B1  8%  slabinfo.fsnotify_m=
ark_connector.active_slabs
      2560 =C2=B1  7%      -5.8%       2410 =C2=B1  8%  slabinfo.fsnotify_m=
ark_connector.num_objs
     20.00 =C2=B1  7%      -5.8%      18.83 =C2=B1  8%  slabinfo.fsnotify_m=
ark_connector.num_slabs
     19394            -0.2%      19351        slabinfo.ftrace_event_field.a=
ctive_objs
    228.17            -0.2%     227.67        slabinfo.ftrace_event_field.a=
ctive_slabs
     19394            -0.2%      19351        slabinfo.ftrace_event_field.n=
um_objs
    228.17            -0.2%     227.67        slabinfo.ftrace_event_field.n=
um_slabs
    104.00            +0.0%     104.00        slabinfo.hugetlbfs_inode_cach=
e.active_objs
      2.00            +0.0%       2.00        slabinfo.hugetlbfs_inode_cach=
e.active_slabs
    104.00            +0.0%     104.00        slabinfo.hugetlbfs_inode_cach=
e.num_objs
      2.00            +0.0%       2.00        slabinfo.hugetlbfs_inode_cach=
e.num_slabs
     63254            +0.1%      63305        slabinfo.inode_cache.active_o=
bjs
      1172            +0.1%       1173        slabinfo.inode_cache.active_s=
labs
     63348            +0.1%      63407        slabinfo.inode_cache.num_objs
      1172            +0.1%       1173        slabinfo.inode_cache.num_slabs
     44.00            +0.0%      44.00        slabinfo.ip6-frags.active_objs
      1.00            +0.0%       1.00        slabinfo.ip6-frags.active_sla=
bs
     44.00            +0.0%      44.00        slabinfo.ip6-frags.num_objs
      1.00            +0.0%       1.00        slabinfo.ip6-frags.num_slabs
     55.17 =C2=B1  4%     -11.5%      48.83 =C2=B1 11%  slabinfo.jbd2_journ=
al_head.active_objs
      1.00            +0.0%       1.00        slabinfo.jbd2_journal_head.ac=
tive_slabs
     55.17 =C2=B1  4%     -11.5%      48.83 =C2=B1 11%  slabinfo.jbd2_journ=
al_head.num_objs
      1.00            +0.0%       1.00        slabinfo.jbd2_journal_head.nu=
m_slabs
    256.00            +0.0%     256.00        slabinfo.jbd2_revoke_table_s.=
active_objs
      1.00            +0.0%       1.00        slabinfo.jbd2_revoke_table_s.=
active_slabs
    256.00            +0.0%     256.00        slabinfo.jbd2_revoke_table_s.=
num_objs
      1.00            +0.0%       1.00        slabinfo.jbd2_revoke_table_s.=
num_slabs
     55718            +0.1%      55776        slabinfo.kernfs_node_cache.ac=
tive_objs
      1741            +0.1%       1743        slabinfo.kernfs_node_cache.ac=
tive_slabs
     55718            +0.1%      55776        slabinfo.kernfs_node_cache.nu=
m_objs
      1741            +0.1%       1743        slabinfo.kernfs_node_cache.nu=
m_slabs
      1455 =C2=B1 19%     -19.1%       1177 =C2=B1 33%  slabinfo.khugepaged=
_mm_slot.active_objs
     39.67 =C2=B1 20%     -18.9%      32.17 =C2=B1 33%  slabinfo.khugepaged=
_mm_slot.active_slabs
      1455 =C2=B1 19%     -19.1%       1177 =C2=B1 33%  slabinfo.khugepaged=
_mm_slot.num_objs
     39.67 =C2=B1 20%     -18.9%      32.17 =C2=B1 33%  slabinfo.khugepaged=
_mm_slot.num_slabs
      2821            +0.9%       2847        slabinfo.kmalloc-128.active_o=
bjs
     88.67            +0.8%      89.33        slabinfo.kmalloc-128.active_s=
labs
      2841            +1.4%       2882        slabinfo.kmalloc-128.num_objs
     88.67            +0.8%      89.33        slabinfo.kmalloc-128.num_slabs
     18439            +0.4%      18504        slabinfo.kmalloc-16.active_ob=
js
     72.17            +0.2%      72.33        slabinfo.kmalloc-16.active_sl=
abs
     18474            +0.2%      18517        slabinfo.kmalloc-16.num_objs
     72.17            +0.2%      72.33        slabinfo.kmalloc-16.num_slabs
      2820            +0.5%       2833        slabinfo.kmalloc-192.active_o=
bjs
     70.33            +0.5%      70.67        slabinfo.kmalloc-192.active_s=
labs
      2960            +0.2%       2968        slabinfo.kmalloc-192.num_objs
     70.33            +0.5%      70.67        slabinfo.kmalloc-192.num_slabs
      3506 =C2=B1  2%      +0.0%       3507        slabinfo.kmalloc-1k.acti=
ve_objs
    113.67 =C2=B1  2%      -1.9%     111.50        slabinfo.kmalloc-1k.acti=
ve_slabs
      3658 =C2=B1  2%      -1.9%       3588        slabinfo.kmalloc-1k.num_=
objs
    113.67 =C2=B1  2%      -1.9%     111.50        slabinfo.kmalloc-1k.num_=
slabs
      5843 =C2=B1  4%      -5.5%       5522 =C2=B1  3%  slabinfo.kmalloc-25=
6.active_objs
    183.17 =C2=B1  4%      -5.7%     172.67 =C2=B1  3%  slabinfo.kmalloc-25=
6.active_slabs
      5883 =C2=B1  4%      -5.8%       5539 =C2=B1  3%  slabinfo.kmalloc-25=
6.num_objs
    183.17 =C2=B1  4%      -5.7%     172.67 =C2=B1  3%  slabinfo.kmalloc-25=
6.num_slabs
      4033 =C2=B1  2%      -2.7%       3926 =C2=B1  3%  slabinfo.kmalloc-2k=
.active_objs
    257.17 =C2=B1  2%      -3.3%     248.67 =C2=B1  3%  slabinfo.kmalloc-2k=
.active_slabs
      4117 =C2=B1  2%      -3.1%       3988 =C2=B1  3%  slabinfo.kmalloc-2k=
.num_objs
    257.17 =C2=B1  2%      -3.3%     248.67 =C2=B1  3%  slabinfo.kmalloc-2k=
.num_slabs
     56582            +0.2%      56687        slabinfo.kmalloc-32.active_ob=
js
    442.33            +0.3%     443.50        slabinfo.kmalloc-32.active_sl=
abs
     56688            +0.3%      56834        slabinfo.kmalloc-32.num_objs
    442.33            +0.3%     443.50        slabinfo.kmalloc-32.num_slabs
      1313            -0.3%       1309        slabinfo.kmalloc-4k.active_ob=
js
    165.00            -0.4%     164.33        slabinfo.kmalloc-4k.active_sl=
abs
      1325            -0.4%       1319        slabinfo.kmalloc-4k.num_objs
    165.00            -0.4%     164.33        slabinfo.kmalloc-4k.num_slabs
     14854            +9.0%      16186        slabinfo.kmalloc-512.active_o=
bjs
    494.00            +7.4%     530.67        slabinfo.kmalloc-512.active_s=
labs
     15826            +7.4%      16996        slabinfo.kmalloc-512.num_objs
    494.00            +7.4%     530.67        slabinfo.kmalloc-512.num_slabs
     35363            +0.2%      35424        slabinfo.kmalloc-64.active_ob=
js
    554.83            +0.2%     555.67        slabinfo.kmalloc-64.active_sl=
abs
     35518            +0.2%      35596        slabinfo.kmalloc-64.num_objs
    554.83            +0.2%     555.67        slabinfo.kmalloc-64.num_slabs
     29180            -0.1%      29159        slabinfo.kmalloc-8.active_objs
     56.50            +0.0%      56.50        slabinfo.kmalloc-8.active_sla=
bs
     29180            -0.1%      29159        slabinfo.kmalloc-8.num_objs
     56.50            +0.0%      56.50        slabinfo.kmalloc-8.num_slabs
    441.67            +0.5%     443.67        slabinfo.kmalloc-8k.active_ob=
js
    110.17            +0.5%     110.67        slabinfo.kmalloc-8k.active_sl=
abs
    441.67            +0.5%     443.67        slabinfo.kmalloc-8k.num_objs
    110.17            +0.5%     110.67        slabinfo.kmalloc-8k.num_slabs
      7213 =C2=B1  4%     -12.2%       6335 =C2=B1  9%  slabinfo.kmalloc-96=
.active_objs
    171.50 =C2=B1  4%     -12.0%     151.00 =C2=B1  9%  slabinfo.kmalloc-96=
.active_slabs
      7233 =C2=B1  4%     -12.0%       6366 =C2=B1  9%  slabinfo.kmalloc-96=
.num_objs
    171.50 =C2=B1  4%     -12.0%     151.00 =C2=B1  9%  slabinfo.kmalloc-96=
.num_slabs
    501.33 =C2=B1 10%     -10.6%     448.00 =C2=B1  9%  slabinfo.kmalloc-rc=
l-128.active_objs
     15.67 =C2=B1 10%     -10.6%      14.00 =C2=B1  9%  slabinfo.kmalloc-rc=
l-128.active_slabs
    501.33 =C2=B1 10%     -10.6%     448.00 =C2=B1  9%  slabinfo.kmalloc-rc=
l-128.num_objs
     15.67 =C2=B1 10%     -10.6%      14.00 =C2=B1  9%  slabinfo.kmalloc-rc=
l-128.num_slabs
    623.00 =C2=B1  7%      +1.1%     630.00 =C2=B1  8%  slabinfo.kmalloc-rc=
l-192.active_objs
     14.83 =C2=B1  7%      +1.1%      15.00 =C2=B1  8%  slabinfo.kmalloc-rc=
l-192.active_slabs
    623.00 =C2=B1  7%      +1.1%     630.00 =C2=B1  8%  slabinfo.kmalloc-rc=
l-192.num_objs
     14.83 =C2=B1  7%      +1.1%      15.00 =C2=B1  8%  slabinfo.kmalloc-rc=
l-192.num_slabs
    256.00 =C2=B1 12%      -4.2%     245.33 =C2=B1  6%  slabinfo.kmalloc-rc=
l-256.active_objs
      8.00 =C2=B1 12%      -4.2%       7.67 =C2=B1  6%  slabinfo.kmalloc-rc=
l-256.active_slabs
    256.00 =C2=B1 12%      -4.2%     245.33 =C2=B1  6%  slabinfo.kmalloc-rc=
l-256.num_objs
      8.00 =C2=B1 12%      -4.2%       7.67 =C2=B1  6%  slabinfo.kmalloc-rc=
l-256.num_slabs
      3380 =C2=B1  2%      -6.7%       3154        slabinfo.kmalloc-rcl-512=
.active_objs
    107.17 =C2=B1  3%      -6.8%      99.83        slabinfo.kmalloc-rcl-512=
.active_slabs
      3442 =C2=B1  3%      -6.7%       3211        slabinfo.kmalloc-rcl-512=
.num_objs
    107.17 =C2=B1  3%      -6.8%      99.83        slabinfo.kmalloc-rcl-512=
.num_slabs
      3504 =C2=B1  5%     -11.4%       3106 =C2=B1  5%  slabinfo.kmalloc-rc=
l-64.active_objs
     53.83 =C2=B1  6%     -10.8%      48.00 =C2=B1  5%  slabinfo.kmalloc-rc=
l-64.active_slabs
      3504 =C2=B1  5%     -11.4%       3106 =C2=B1  5%  slabinfo.kmalloc-rc=
l-64.num_objs
     53.83 =C2=B1  6%     -10.8%      48.00 =C2=B1  5%  slabinfo.kmalloc-rc=
l-64.num_slabs
      2037 =C2=B1  8%      -9.3%       1848 =C2=B1  6%  slabinfo.kmalloc-rc=
l-96.active_objs
     48.50 =C2=B1  8%      -9.3%      44.00 =C2=B1  6%  slabinfo.kmalloc-rc=
l-96.active_slabs
      2037 =C2=B1  8%      -9.3%       1848 =C2=B1  6%  slabinfo.kmalloc-rc=
l-96.num_objs
     48.50 =C2=B1  8%      -9.3%      44.00 =C2=B1  6%  slabinfo.kmalloc-rc=
l-96.num_slabs
    442.67 =C2=B1 14%      -1.2%     437.33 =C2=B1 10%  slabinfo.kmem_cache=
.active_objs
     13.83 =C2=B1 14%      -1.2%      13.67 =C2=B1 10%  slabinfo.kmem_cache=
.active_slabs
    442.67 =C2=B1 14%      -1.2%     437.33 =C2=B1 10%  slabinfo.kmem_cache=
.num_objs
     13.83 =C2=B1 14%      -1.2%      13.67 =C2=B1 10%  slabinfo.kmem_cache=
.num_slabs
    937.67 =C2=B1 12%      +1.1%     948.33 =C2=B1  8%  slabinfo.kmem_cache=
_node.active_objs
     15.17 =C2=B1 12%      +1.1%      15.33 =C2=B1  8%  slabinfo.kmem_cache=
_node.active_slabs
    970.67 =C2=B1 12%      +1.1%     981.33 =C2=B1  8%  slabinfo.kmem_cache=
_node.num_objs
     15.17 =C2=B1 12%      +1.1%      15.33 =C2=B1  8%  slabinfo.kmem_cache=
_node.num_slabs
      9159            +0.7%       9221        slabinfo.lsm_file_cache.activ=
e_objs
     53.00            +0.6%      53.33        slabinfo.lsm_file_cache.activ=
e_slabs
      9159            +0.7%       9221        slabinfo.lsm_file_cache.num_o=
bjs
     53.00            +0.6%      53.33        slabinfo.lsm_file_cache.num_s=
labs
    351.00 =C2=B1 30%     -20.0%     280.83 =C2=B1 23%  slabinfo.mbcache.ac=
tive_objs
      4.33 =C2=B1 31%     -19.2%       3.50 =C2=B1 31%  slabinfo.mbcache.ac=
tive_slabs
    351.00 =C2=B1 30%     -20.0%     280.83 =C2=B1 23%  slabinfo.mbcache.nu=
m_objs
      4.33 =C2=B1 31%     -19.2%       3.50 =C2=B1 31%  slabinfo.mbcache.nu=
m_slabs
      1560            -1.3%       1540        slabinfo.mm_struct.active_objs
     52.00            -1.3%      51.33        slabinfo.mm_struct.active_sla=
bs
      1560            -1.3%       1540        slabinfo.mm_struct.num_objs
     52.00            -1.3%      51.33        slabinfo.mm_struct.num_slabs
    830.83 =C2=B1  5%      -9.1%     755.33 =C2=B1 15%  slabinfo.mnt_cache.=
active_objs
     15.50 =C2=B1  6%      -9.7%      14.00 =C2=B1 15%  slabinfo.mnt_cache.=
active_slabs
    830.83 =C2=B1  5%      -9.1%     755.33 =C2=B1 15%  slabinfo.mnt_cache.=
num_objs
     15.50 =C2=B1  6%      -9.7%      14.00 =C2=B1 15%  slabinfo.mnt_cache.=
num_slabs
     34.00            +0.0%      34.00        slabinfo.mqueue_inode_cache.a=
ctive_objs
      1.00            +0.0%       1.00        slabinfo.mqueue_inode_cache.a=
ctive_slabs
     34.00            +0.0%      34.00        slabinfo.mqueue_inode_cache.n=
um_objs
      1.00            +0.0%       1.00        slabinfo.mqueue_inode_cache.n=
um_slabs
    386.67            -0.3%     385.33        slabinfo.names_cache.active_o=
bjs
     48.33            -0.3%      48.17        slabinfo.names_cache.active_s=
labs
    386.67            -0.3%     385.33        slabinfo.names_cache.num_objs
     48.33            -0.3%      48.17        slabinfo.names_cache.num_slabs
     36.00            +0.0%      36.00        slabinfo.nfs_read_data.active=
_objs
      1.00            +0.0%       1.00        slabinfo.nfs_read_data.active=
_slabs
     36.00            +0.0%      36.00        slabinfo.nfs_read_data.num_ob=
js
      1.00            +0.0%       1.00        slabinfo.nfs_read_data.num_sl=
abs
    211.83 =C2=B1  5%      +2.4%     217.00        slabinfo.numa_policy.act=
ive_objs
      6.83 =C2=B1  5%      +2.4%       7.00        slabinfo.numa_policy.act=
ive_slabs
    211.83 =C2=B1  5%      +2.4%     217.00        slabinfo.numa_policy.num=
_objs
      6.83 =C2=B1  5%      +2.4%       7.00        slabinfo.numa_policy.num=
_slabs
      4847            -1.4%       4777        slabinfo.pde_opener.active_ob=
js
     46.83            -1.1%      46.33        slabinfo.pde_opener.active_sl=
abs
      4847            -1.4%       4777        slabinfo.pde_opener.num_objs
     46.83            -1.1%      46.33        slabinfo.pde_opener.num_slabs
      4501 =C2=B1  2%      -6.3%       4216 =C2=B1  3%  slabinfo.pid.active=
_objs
    140.00 =C2=B1  2%      -6.2%     131.33 =C2=B1  3%  slabinfo.pid.active=
_slabs
      4501 =C2=B1  2%      -6.3%       4216 =C2=B1  3%  slabinfo.pid.num_ob=
js
    140.00 =C2=B1  2%      -6.2%     131.33 =C2=B1  3%  slabinfo.pid.num_sl=
abs
      1309 =C2=B1  5%     -11.9%       1154 =C2=B1 13%  slabinfo.pool_workq=
ueue.active_objs
     40.67 =C2=B1  5%     -11.1%      36.17 =C2=B1 12%  slabinfo.pool_workq=
ueue.active_slabs
      1320 =C2=B1  5%     -11.3%       1171 =C2=B1 11%  slabinfo.pool_workq=
ueue.num_objs
     40.67 =C2=B1  5%     -11.1%      36.17 =C2=B1 12%  slabinfo.pool_workq=
ueue.num_slabs
      1239 =C2=B1  2%      +0.0%       1239 =C2=B1  3%  slabinfo.proc_dir_e=
ntry.active_objs
     29.50 =C2=B1  2%      +0.0%      29.50 =C2=B1  3%  slabinfo.proc_dir_e=
ntry.active_slabs
      1239 =C2=B1  2%      +0.0%       1239 =C2=B1  3%  slabinfo.proc_dir_e=
ntry.num_objs
     29.50 =C2=B1  2%      +0.0%      29.50 =C2=B1  3%  slabinfo.proc_dir_e=
ntry.num_slabs
     13851           -18.1%      11349        slabinfo.proc_inode_cache.act=
ive_objs
    291.83           -17.8%     239.83        slabinfo.proc_inode_cache.act=
ive_slabs
     14016           -17.7%      11537        slabinfo.proc_inode_cache.num=
_objs
    291.83           -17.8%     239.83        slabinfo.proc_inode_cache.num=
_slabs
     13542            +1.4%      13732        slabinfo.radix_tree_node.acti=
ve_objs
    483.67            +1.5%     490.83        slabinfo.radix_tree_node.acti=
ve_slabs
     13558            +1.5%      13756        slabinfo.radix_tree_node.num_=
objs
    483.67            +1.5%     490.83        slabinfo.radix_tree_node.num_=
slabs
     37.33 =C2=B1 20%      +7.1%      40.00 =C2=B1 20%  slabinfo.request_qu=
eue.active_objs
      2.33 =C2=B1 20%      +7.1%       2.50 =C2=B1 20%  slabinfo.request_qu=
eue.active_slabs
     37.33 =C2=B1 20%      +7.1%      40.00 =C2=B1 20%  slabinfo.request_qu=
eue.num_objs
      2.33 =C2=B1 20%      +7.1%       2.50 =C2=B1 20%  slabinfo.request_qu=
eue.num_slabs
     51.00            +0.0%      51.00        slabinfo.rpc_inode_cache.acti=
ve_objs
      1.00            +0.0%       1.00        slabinfo.rpc_inode_cache.acti=
ve_slabs
     51.00            +0.0%      51.00        slabinfo.rpc_inode_cache.num_=
objs
      1.00            +0.0%       1.00        slabinfo.rpc_inode_cache.num_=
slabs
      1258            +0.4%       1264        slabinfo.scsi_sense_cache.act=
ive_objs
     39.33            +0.4%      39.50        slabinfo.scsi_sense_cache.act=
ive_slabs
      1258            +0.4%       1264        slabinfo.scsi_sense_cache.num=
_objs
     39.33            +0.4%      39.50        slabinfo.scsi_sense_cache.num=
_slabs
      1632            +0.0%       1632        slabinfo.seq_file.active_objs
     48.00            +0.0%      48.00        slabinfo.seq_file.active_slabs
      1632            +0.0%       1632        slabinfo.seq_file.num_objs
     48.00            +0.0%      48.00        slabinfo.seq_file.num_slabs
      3028 =C2=B1  3%      -0.3%       3018 =C2=B1  3%  slabinfo.shmem_inod=
e_cache.active_objs
     65.67 =C2=B1  3%      -0.3%      65.50 =C2=B1  3%  slabinfo.shmem_inod=
e_cache.active_slabs
      3028 =C2=B1  3%      -0.3%       3018 =C2=B1  3%  slabinfo.shmem_inod=
e_cache.num_objs
     65.67 =C2=B1  3%      -0.3%      65.50 =C2=B1  3%  slabinfo.shmem_inod=
e_cache.num_slabs
      1364            +0.4%       1370        slabinfo.sighand_cache.active=
_objs
     93.33            -1.2%      92.17        slabinfo.sighand_cache.active=
_slabs
      1407            -1.2%       1390        slabinfo.sighand_cache.num_ob=
js
     93.33            -1.2%      92.17        slabinfo.sighand_cache.num_sl=
abs
      4360 =C2=B1  3%      -9.1%       3961 =C2=B1  4%  slabinfo.signal_cac=
he.active_objs
    155.67 =C2=B1  3%      -8.5%     142.50 =C2=B1  4%  slabinfo.signal_cac=
he.active_slabs
      4373 =C2=B1  3%      -8.6%       3997 =C2=B1  4%  slabinfo.signal_cac=
he.num_objs
    155.67 =C2=B1  3%      -8.5%     142.50 =C2=B1  4%  slabinfo.signal_cac=
he.num_slabs
    373.33 =C2=B1 13%      +0.0%     373.33 =C2=B1 15%  slabinfo.skbuff_fcl=
one_cache.active_objs
     11.67 =C2=B1 13%      +0.0%      11.67 =C2=B1 15%  slabinfo.skbuff_fcl=
one_cache.active_slabs
    373.33 =C2=B1 13%      +0.0%     373.33 =C2=B1 15%  slabinfo.skbuff_fcl=
one_cache.num_objs
     11.67 =C2=B1 13%      +0.0%      11.67 =C2=B1 15%  slabinfo.skbuff_fcl=
one_cache.num_slabs
      2048 =C2=B1 13%      +0.8%       2064 =C2=B1 10%  slabinfo.skbuff_hea=
d_cache.active_objs
     65.50 =C2=B1 11%      -0.8%      65.00 =C2=B1  9%  slabinfo.skbuff_hea=
d_cache.active_slabs
      2096 =C2=B1 11%      -0.8%       2080 =C2=B1  9%  slabinfo.skbuff_hea=
d_cache.num_objs
     65.50 =C2=B1 11%      -0.8%      65.00 =C2=B1  9%  slabinfo.skbuff_hea=
d_cache.num_slabs
      2241 =C2=B1  3%     -13.9%       1930 =C2=B1 10%  slabinfo.sock_inode=
_cache.active_objs
     57.00 =C2=B1  3%     -13.5%      49.33 =C2=B1 10%  slabinfo.sock_inode=
_cache.active_slabs
      2241 =C2=B1  3%     -13.9%       1930 =C2=B1 10%  slabinfo.sock_inode=
_cache.num_objs
     57.00 =C2=B1  3%     -13.5%      49.33 =C2=B1 10%  slabinfo.sock_inode=
_cache.num_slabs
      5416 =C2=B1  4%     -11.4%       4796 =C2=B1  4%  slabinfo.task_delay=
_info.active_objs
    105.83 =C2=B1  4%     -11.3%      93.83 =C2=B1  4%  slabinfo.task_delay=
_info.active_slabs
      5416 =C2=B1  4%     -11.4%       4796 =C2=B1  4%  slabinfo.task_delay=
_info.num_objs
    105.83 =C2=B1  4%     -11.3%      93.83 =C2=B1  4%  slabinfo.task_delay=
_info.num_slabs
      1106 =C2=B1 12%     -17.6%     911.83 =C2=B1 20%  slabinfo.task_group=
.active_objs
     23.33 =C2=B1 12%     -17.1%      19.33 =C2=B1 20%  slabinfo.task_group=
.active_slabs
      1106 =C2=B1 12%     -17.6%     911.83 =C2=B1 20%  slabinfo.task_group=
.num_objs
     23.33 =C2=B1 12%     -17.1%      19.33 =C2=B1 20%  slabinfo.task_group=
.num_slabs
      1176            -2.0%       1152 =C2=B1  2%  slabinfo.task_struct.act=
ive_objs
    400.17            -2.4%     390.50 =C2=B1  2%  slabinfo.task_struct.act=
ive_slabs
      1202            -2.5%       1172 =C2=B1  2%  slabinfo.task_struct.num=
_objs
    400.17            -2.4%     390.50 =C2=B1  2%  slabinfo.task_struct.num=
_slabs
    104.17            -2.4%     101.67 =C2=B1  5%  slabinfo.taskstats.activ=
e_objs
      2.00            -8.3%       1.83 =C2=B1 20%  slabinfo.taskstats.activ=
e_slabs
    104.17            -2.4%     101.67 =C2=B1  5%  slabinfo.taskstats.num_o=
bjs
      2.00            -8.3%       1.83 =C2=B1 20%  slabinfo.taskstats.num_s=
labs
      3605 =C2=B1  3%      -1.2%       3562 =C2=B1  2%  slabinfo.trace_even=
t_file.active_objs
     77.83 =C2=B1  3%      -1.3%      76.83 =C2=B1  2%  slabinfo.trace_even=
t_file.active_slabs
      3605 =C2=B1  3%      -1.2%       3562 =C2=B1  2%  slabinfo.trace_even=
t_file.num_objs
     77.83 =C2=B1  3%      -1.3%      76.83 =C2=B1  2%  slabinfo.trace_even=
t_file.num_slabs
     33.00            +0.0%      33.00        slabinfo.tw_sock_TCP.active_o=
bjs
      1.00            +0.0%       1.00        slabinfo.tw_sock_TCP.active_s=
labs
     33.00            +0.0%      33.00        slabinfo.tw_sock_TCP.num_objs
      1.00            +0.0%       1.00        slabinfo.tw_sock_TCP.num_slabs
     26729           +13.7%      30380        slabinfo.vm_area_struct.activ=
e_objs
    671.50           +13.3%     760.83        slabinfo.vm_area_struct.activ=
e_slabs
     26880           +13.3%      30456        slabinfo.vm_area_struct.num_o=
bjs
    671.50           +13.3%     760.83        slabinfo.vm_area_struct.num_s=
labs
     14140 =C2=B1  2%     +17.5%      16609 =C2=B1  5%  slabinfo.vmap_area.=
active_objs
    248.83           +16.1%     288.83 =C2=B1  4%  slabinfo.vmap_area.activ=
e_slabs
     15956           +16.1%      18526 =C2=B1  4%  slabinfo.vmap_area.num_o=
bjs
    248.83           +16.1%     288.83 =C2=B1  4%  slabinfo.vmap_area.num_s=
labs
     42.00            +0.0%      42.00        slabinfo.xfrm_state.active_ob=
js
      1.00            +0.0%       1.00        slabinfo.xfrm_state.active_sl=
abs
     42.00            +0.0%      42.00        slabinfo.xfrm_state.num_objs
      1.00            +0.0%       1.00        slabinfo.xfrm_state.num_slabs
     36.00            +0.0%      36.00        slabinfo.xfs_btree_cur.active=
_objs
      1.00            +0.0%       1.00        slabinfo.xfs_btree_cur.active=
_slabs
     36.00            +0.0%      36.00        slabinfo.xfs_btree_cur.num_ob=
js
      1.00            +0.0%       1.00        slabinfo.xfs_btree_cur.num_sl=
abs
    161.00 =C2=B1  9%     -26.1%     119.00 =C2=B1 13%  slabinfo.xfs_buf.ac=
tive_objs
      3.83 =C2=B1  9%     -26.1%       2.83 =C2=B1 13%  slabinfo.xfs_buf.ac=
tive_slabs
    161.00 =C2=B1  9%     -26.1%     119.00 =C2=B1 13%  slabinfo.xfs_buf.nu=
m_objs
      3.83 =C2=B1  9%     -26.1%       2.83 =C2=B1 13%  slabinfo.xfs_buf.nu=
m_slabs
     38.00            +0.0%      38.00        slabinfo.xfs_efi_item.active_=
objs
      1.00            +0.0%       1.00        slabinfo.xfs_efi_item.active_=
slabs
     38.00            +0.0%      38.00        slabinfo.xfs_efi_item.num_objs
      1.00            +0.0%       1.00        slabinfo.xfs_efi_item.num_sla=
bs
     96.00           -11.1%      85.33 =C2=B1 17%  slabinfo.xfs_inode.activ=
e_objs
      3.00           -11.1%       2.67 =C2=B1 17%  slabinfo.xfs_inode.activ=
e_slabs
     96.00           -11.1%      85.33 =C2=B1 17%  slabinfo.xfs_inode.num_o=
bjs
      3.00           -11.1%       2.67 =C2=B1 17%  slabinfo.xfs_inode.num_s=
labs
      0.00          -100.0%       0.00        interrupts.0:IO-APIC.2-edge.t=
imer
      0.00          -100.0%       0.00        interrupts.20:IO-APIC.20-fast=
eoi.ehci_hcd:usb2
      0.00          -100.0%       0.00        interrupts.22:IO-APIC.22-fast=
eoi.ehci_hcd:usb1
    205.33 =C2=B1 55%     -50.7%     101.17 =C2=B1 41%  interrupts.35:PCI-M=
SI.2621441-edge.eth0-TxRx-0
    534.00 =C2=B1 89%      +3.9%     554.67 =C2=B1157%  interrupts.36:PCI-M=
SI.2621442-edge.eth0-TxRx-1
    238.50 =C2=B1 95%    +752.9%       2034 =C2=B1138%  interrupts.37:PCI-M=
SI.2621443-edge.eth0-TxRx-2
    628.33 =C2=B1126%    +110.7%       1324 =C2=B1199%  interrupts.38:PCI-M=
SI.2621444-edge.eth0-TxRx-3
      2011 =C2=B1161%     -82.8%     346.83 =C2=B1127%  interrupts.39:PCI-M=
SI.2621445-edge.eth0-TxRx-4
      5111 =C2=B1167%     -97.9%     109.00 =C2=B1 82%  interrupts.40:PCI-M=
SI.2621446-edge.eth0-TxRx-5
    224.83 =C2=B1132%     -18.8%     182.67 =C2=B1 54%  interrupts.41:PCI-M=
SI.2621447-edge.eth0-TxRx-6
    209.83 =C2=B1155%     +29.6%     272.00 =C2=B1120%  interrupts.42:PCI-M=
SI.2621448-edge.eth0-TxRx-7
      0.00          -100.0%       0.00        interrupts.44:PCI-MSI.2623489=
-edge
      0.00          -100.0%       0.00        interrupts.45:PCI-MSI.2623490=
-edge
      0.00          -100.0%       0.00        interrupts.46:PCI-MSI.2623491=
-edge
      0.00          -100.0%       0.00        interrupts.47:PCI-MSI.2623492=
-edge
      0.00          -100.0%       0.00        interrupts.48:PCI-MSI.2623493=
-edge
      0.00          -100.0%       0.00        interrupts.49:PCI-MSI.2623494=
-edge
      0.00          -100.0%       0.00        interrupts.4:IO-APIC.4-edge.t=
tyS0
      0.00          -100.0%       0.00        interrupts.50:PCI-MSI.2623495=
-edge
      0.00          -100.0%       0.00        interrupts.51:PCI-MSI.2623496=
-edge
      0.00          -100.0%       0.00        interrupts.53:PCI-MSI.65536-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.55:PCI-MSI.67584-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.56:PCI-MSI.67584-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.56:PCI-MSI.69632-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.57:PCI-MSI.69632-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.57:PCI-MSI.71680-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.58:PCI-MSI.71680-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.58:PCI-MSI.73728-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.59:PCI-MSI.73728-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.59:PCI-MSI.75776-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.60:PCI-MSI.75776-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.60:PCI-MSI.77824-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.61:PCI-MSI.77824-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.61:PCI-MSI.79872-e=
dge.ioat-msix
    207.50 =C2=B1141%     -56.9%      89.50 =C2=B1223%  interrupts.62:PCI-M=
SI.2097152-edge.isci-msix
      0.00          -100.0%       0.00        interrupts.62:PCI-MSI.79872-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.63:PCI-MSI.6717440=
0-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.64:PCI-MSI.6717440=
0-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.64:PCI-MSI.79872-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.65:PCI-MSI.6717644=
8-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.66:PCI-MSI.6717440=
0-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.66:PCI-MSI.6717644=
8-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.66:PCI-MSI.6717849=
6-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.67:PCI-MSI.6717849=
6-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.67:PCI-MSI.6718054=
4-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.68:PCI-MSI.6717644=
8-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.68:PCI-MSI.6718054=
4-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.68:PCI-MSI.6718259=
2-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.69:PCI-MSI.6717849=
6-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.69:PCI-MSI.6718259=
2-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.69:PCI-MSI.6718464=
0-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.70:PCI-MSI.6718054=
4-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.70:PCI-MSI.6718464=
0-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.70:PCI-MSI.6718668=
8-edge.ioat-msix
    117.83 =C2=B1223%    -100.0%       0.00        interrupts.71:PCI-MSI.20=
97152-edge.isci-msix
      0.00          -100.0%       0.00        interrupts.71:PCI-MSI.6718259=
2-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.71:PCI-MSI.6718668=
8-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.71:PCI-MSI.6718873=
6-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.72:PCI-MSI.6718464=
0-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.72:PCI-MSI.6718873=
6-edge.ioat-msix
    322.17 =C2=B1100%     +50.8%     485.83 =C2=B1 48%  interrupts.73:PCI-M=
SI.2097152-edge.isci-msix
      0.00          -100.0%       0.00        interrupts.73:PCI-MSI.6718668=
8-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.74:PCI-MSI.6718873=
6-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.8:IO-APIC.8-edge.r=
tc0
    217666 =C2=B1 14%     -22.9%     167723 =C2=B1  9%  interrupts.CAL:Func=
tion_call_interrupts
      0.00          -100.0%       0.00        interrupts.CPU0.0:IO-APIC.2-e=
dge.timer
      0.00          -100.0%       0.00        interrupts.CPU0.45:PCI-MSI.26=
23490-edge
      0.00          -100.0%       0.00        interrupts.CPU0.55:PCI-MSI.67=
584-edge.ioat-msix
      2859 =C2=B1 30%     -37.1%       1799 =C2=B1 32%  interrupts.CPU0.CAL=
:Function_call_interrupts
      0.17 =C2=B1223%    +400.0%       0.83 =C2=B1223%  interrupts.CPU0.IWI=
:IRQ_work_interrupts
    127374            -1.1%     125939 =C2=B1  2%  interrupts.CPU0.LOC:Loca=
l_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU0.MCP:Machine_c=
heck_polls
    998.67 =C2=B1 36%      -2.5%     974.00 =C2=B1 40%  interrupts.CPU0.NMI=
:Non-maskable_interrupts
    998.67 =C2=B1 36%      -2.5%     974.00 =C2=B1 40%  interrupts.CPU0.PMI=
:Performance_monitoring_interrupts
      1368 =C2=B1 13%      +0.5%       1375 =C2=B1 22%  interrupts.CPU0.RES=
:Rescheduling_interrupts
      0.00          -100.0%       0.00        interrupts.CPU0.RTR:APIC_ICR_=
read_retries
     42.50 =C2=B1 20%     -57.3%      18.17 =C2=B1 22%  interrupts.CPU0.TLB=
:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU1.46:PCI-MSI.26=
23491-edge
      0.00          -100.0%       0.00        interrupts.CPU1.56:PCI-MSI.67=
584-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU1.56:PCI-MSI.69=
632-edge.ioat-msix
      5430 =C2=B1 30%     -48.1%       2817 =C2=B1 33%  interrupts.CPU1.CAL=
:Function_call_interrupts
      0.00       +6.7e+101%       0.67 =C2=B1165%  interrupts.CPU1.IWI:IRQ_=
work_interrupts
    127650            -1.3%     126000 =C2=B1  2%  interrupts.CPU1.LOC:Loca=
l_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU1.MCP:Machine_c=
heck_polls
    984.50 =C2=B1 41%     +40.2%       1380 =C2=B1 43%  interrupts.CPU1.NMI=
:Non-maskable_interrupts
    984.50 =C2=B1 41%     +40.2%       1380 =C2=B1 43%  interrupts.CPU1.PMI=
:Performance_monitoring_interrupts
      1591 =C2=B1 18%      -8.8%       1450 =C2=B1 20%  interrupts.CPU1.RES=
:Rescheduling_interrupts
     38.67 =C2=B1 23%     -84.1%       6.17 =C2=B1 30%  interrupts.CPU1.TLB=
:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU10.8:IO-APIC.8-=
edge.rtc0
      3601 =C2=B1 52%      +3.2%       3715 =C2=B1 37%  interrupts.CPU10.CA=
L:Function_call_interrupts
      0.00       +6.7e+101%       0.67 =C2=B1165%  interrupts.CPU10.IWI:IRQ=
_work_interrupts
    127444            -1.1%     126037 =C2=B1  2%  interrupts.CPU10.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU10.MCP:Machine_=
check_polls
      1027 =C2=B1 41%     +32.0%       1355 =C2=B1 45%  interrupts.CPU10.NM=
I:Non-maskable_interrupts
      1027 =C2=B1 41%     +32.0%       1355 =C2=B1 45%  interrupts.CPU10.PM=
I:Performance_monitoring_interrupts
      1155 =C2=B1 40%     +34.9%       1558 =C2=B1 31%  interrupts.CPU10.RE=
S:Rescheduling_interrupts
     20.17 =C2=B1 36%     -77.7%       4.50 =C2=B1 52%  interrupts.CPU10.TL=
B:TLB_shootdowns
      2810 =C2=B1 36%      -1.3%       2774 =C2=B1 38%  interrupts.CPU11.CA=
L:Function_call_interrupts
      0.00       +1.7e+101%       0.17 =C2=B1223%  interrupts.CPU11.IWI:IRQ=
_work_interrupts
    127455            -1.2%     125924 =C2=B1  2%  interrupts.CPU11.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU11.MCP:Machine_=
check_polls
      1034 =C2=B1 30%     +27.7%       1320 =C2=B1 52%  interrupts.CPU11.NM=
I:Non-maskable_interrupts
      1034 =C2=B1 30%     +27.7%       1320 =C2=B1 52%  interrupts.CPU11.PM=
I:Performance_monitoring_interrupts
      1079 =C2=B1 15%     +15.2%       1243 =C2=B1 19%  interrupts.CPU11.RE=
S:Rescheduling_interrupts
     22.50 =C2=B1 23%     -80.7%       4.33 =C2=B1 66%  interrupts.CPU11.TL=
B:TLB_shootdowns
      4368 =C2=B1 45%      -2.9%       4239 =C2=B1 47%  interrupts.CPU12.CA=
L:Function_call_interrupts
    127446            -1.9%     124996 =C2=B1  4%  interrupts.CPU12.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU12.MCP:Machine_=
check_polls
      1170 =C2=B1 26%      -4.4%       1118 =C2=B1 39%  interrupts.CPU12.NM=
I:Non-maskable_interrupts
      1170 =C2=B1 26%      -4.4%       1118 =C2=B1 39%  interrupts.CPU12.PM=
I:Performance_monitoring_interrupts
      1796 =C2=B1 30%     -15.4%       1520 =C2=B1 25%  interrupts.CPU12.RE=
S:Rescheduling_interrupts
     24.33 =C2=B1 38%     -79.5%       5.00 =C2=B1 62%  interrupts.CPU12.TL=
B:TLB_shootdowns
      5232 =C2=B1 40%     -35.0%       3399 =C2=B1 32%  interrupts.CPU13.CA=
L:Function_call_interrupts
    127442            -2.0%     124868 =C2=B1  4%  interrupts.CPU13.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU13.MCP:Machine_=
check_polls
      1263 =C2=B1 29%     -21.0%     999.00 =C2=B1 43%  interrupts.CPU13.NM=
I:Non-maskable_interrupts
      1263 =C2=B1 29%     -21.0%     999.00 =C2=B1 43%  interrupts.CPU13.PM=
I:Performance_monitoring_interrupts
      1676 =C2=B1 29%     -12.3%       1471 =C2=B1 17%  interrupts.CPU13.RE=
S:Rescheduling_interrupts
     27.33 =C2=B1 33%     -82.3%       4.83 =C2=B1 52%  interrupts.CPU13.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU14.63:PCI-MSI.6=
7174400-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU14.64:PCI-MSI.6=
7174400-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU14.66:PCI-MSI.6=
7174400-edge.ioat-msix
      5207 =C2=B1 37%     -16.9%       4326 =C2=B1 42%  interrupts.CPU14.CA=
L:Function_call_interrupts
      0.17 =C2=B1223%    -100.0%       0.00        interrupts.CPU14.IWI:IRQ=
_work_interrupts
    127351            -2.1%     124706 =C2=B1  4%  interrupts.CPU14.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU14.MCP:Machine_=
check_polls
      1376 =C2=B1 29%     -50.7%     679.33 =C2=B1 47%  interrupts.CPU14.NM=
I:Non-maskable_interrupts
      1376 =C2=B1 29%     -50.7%     679.33 =C2=B1 47%  interrupts.CPU14.PM=
I:Performance_monitoring_interrupts
      1802 =C2=B1 23%     -11.2%       1599 =C2=B1 22%  interrupts.CPU14.RE=
S:Rescheduling_interrupts
     27.00 =C2=B1 32%     -79.6%       5.50 =C2=B1 60%  interrupts.CPU14.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU15.65:PCI-MSI.6=
7176448-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU15.66:PCI-MSI.6=
7176448-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU15.68:PCI-MSI.6=
7176448-edge.ioat-msix
      5504 =C2=B1 34%     -44.6%       3050 =C2=B1 34%  interrupts.CPU15.CA=
L:Function_call_interrupts
      1.00 =C2=B1223%     -66.7%       0.33 =C2=B1223%  interrupts.CPU15.IW=
I:IRQ_work_interrupts
    127413            -2.2%     124585 =C2=B1  5%  interrupts.CPU15.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU15.MCP:Machine_=
check_polls
      1417 =C2=B1 32%     -43.8%     797.00 =C2=B1 65%  interrupts.CPU15.NM=
I:Non-maskable_interrupts
      1417 =C2=B1 32%     -43.8%     797.00 =C2=B1 65%  interrupts.CPU15.PM=
I:Performance_monitoring_interrupts
      1662 =C2=B1 19%     -13.7%       1433 =C2=B1 31%  interrupts.CPU15.RE=
S:Rescheduling_interrupts
     30.50 =C2=B1 18%     -78.7%       6.50 =C2=B1 66%  interrupts.CPU15.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU16.66:PCI-MSI.6=
7178496-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU16.67:PCI-MSI.6=
7178496-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU16.69:PCI-MSI.6=
7178496-edge.ioat-msix
      5154 =C2=B1 50%     -21.6%       4042 =C2=B1 74%  interrupts.CPU16.CA=
L:Function_call_interrupts
      0.33 =C2=B1141%    -100.0%       0.00        interrupts.CPU16.IWI:IRQ=
_work_interrupts
    127429            -2.2%     124564 =C2=B1  5%  interrupts.CPU16.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU16.MCP:Machine_=
check_polls
      1594 =C2=B1 25%     -30.3%       1110 =C2=B1 48%  interrupts.CPU16.NM=
I:Non-maskable_interrupts
      1594 =C2=B1 25%     -30.3%       1110 =C2=B1 48%  interrupts.CPU16.PM=
I:Performance_monitoring_interrupts
      2027 =C2=B1 24%     -23.3%       1554 =C2=B1 44%  interrupts.CPU16.RE=
S:Rescheduling_interrupts
     23.50 =C2=B1 17%     -79.4%       4.83 =C2=B1 60%  interrupts.CPU16.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU17.67:PCI-MSI.6=
7180544-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU17.68:PCI-MSI.6=
7180544-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU17.70:PCI-MSI.6=
7180544-edge.ioat-msix
      5501 =C2=B1 41%     -39.0%       3355 =C2=B1 55%  interrupts.CPU17.CA=
L:Function_call_interrupts
      0.83 =C2=B1223%    -100.0%       0.00        interrupts.CPU17.IWI:IRQ=
_work_interrupts
    127424            -2.2%     124569 =C2=B1  5%  interrupts.CPU17.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU17.MCP:Machine_=
check_polls
      1299 =C2=B1 43%     -10.9%       1157 =C2=B1 44%  interrupts.CPU17.NM=
I:Non-maskable_interrupts
      1299 =C2=B1 43%     -10.9%       1157 =C2=B1 44%  interrupts.CPU17.PM=
I:Performance_monitoring_interrupts
      1975 =C2=B1 21%     -29.2%       1398 =C2=B1 30%  interrupts.CPU17.RE=
S:Rescheduling_interrupts
     24.50 =C2=B1 43%     -84.4%       3.83 =C2=B1 43%  interrupts.CPU17.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU18.68:PCI-MSI.6=
7182592-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU18.69:PCI-MSI.6=
7182592-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU18.71:PCI-MSI.6=
7182592-edge.ioat-msix
      4975 =C2=B1 35%     -32.6%       3351 =C2=B1 52%  interrupts.CPU18.CA=
L:Function_call_interrupts
    127424            -2.2%     124561 =C2=B1  5%  interrupts.CPU18.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU18.MCP:Machine_=
check_polls
      1376 =C2=B1 23%     -32.9%     924.50 =C2=B1 38%  interrupts.CPU18.NM=
I:Non-maskable_interrupts
      1376 =C2=B1 23%     -32.9%     924.50 =C2=B1 38%  interrupts.CPU18.PM=
I:Performance_monitoring_interrupts
      1870 =C2=B1 15%     -23.3%       1435 =C2=B1 33%  interrupts.CPU18.RE=
S:Rescheduling_interrupts
     25.33 =C2=B1 16%     -84.9%       3.83 =C2=B1 59%  interrupts.CPU18.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU19.69:PCI-MSI.6=
7184640-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU19.70:PCI-MSI.6=
7184640-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU19.72:PCI-MSI.6=
7184640-edge.ioat-msix
      4145 =C2=B1 41%     -39.2%       2521 =C2=B1 18%  interrupts.CPU19.CA=
L:Function_call_interrupts
      0.50 =C2=B1152%    -100.0%       0.00        interrupts.CPU19.IWI:IRQ=
_work_interrupts
    127426            -2.3%     124549 =C2=B1  5%  interrupts.CPU19.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU19.MCP:Machine_=
check_polls
      1652 =C2=B1 35%     -44.7%     913.00 =C2=B1 33%  interrupts.CPU19.NM=
I:Non-maskable_interrupts
      1652 =C2=B1 35%     -44.7%     913.00 =C2=B1 33%  interrupts.CPU19.PM=
I:Performance_monitoring_interrupts
      1455 =C2=B1 27%     -28.7%       1037 =C2=B1 27%  interrupts.CPU19.RE=
S:Rescheduling_interrupts
     25.83 =C2=B1 29%     -80.6%       5.00 =C2=B1 40%  interrupts.CPU19.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU2.47:PCI-MSI.26=
23492-edge
      0.00          -100.0%       0.00        interrupts.CPU2.57:PCI-MSI.69=
632-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU2.57:PCI-MSI.71=
680-edge.ioat-msix
      4950 =C2=B1 34%     -35.4%       3198 =C2=B1 27%  interrupts.CPU2.CAL=
:Function_call_interrupts
      0.00       +1.7e+101%       0.17 =C2=B1223%  interrupts.CPU2.IWI:IRQ_=
work_interrupts
    127409            -1.2%     125910 =C2=B1  2%  interrupts.CPU2.LOC:Loca=
l_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU2.MCP:Machine_c=
heck_polls
    930.00 =C2=B1 20%     +57.5%       1465 =C2=B1 60%  interrupts.CPU2.NMI=
:Non-maskable_interrupts
    930.00 =C2=B1 20%     +57.5%       1465 =C2=B1 60%  interrupts.CPU2.PMI=
:Performance_monitoring_interrupts
      1704 =C2=B1 16%      -6.7%       1589 =C2=B1 25%  interrupts.CPU2.RES=
:Rescheduling_interrupts
     31.33 =C2=B1 25%     -80.9%       6.00 =C2=B1 49%  interrupts.CPU2.TLB=
:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU20.70:PCI-MSI.6=
7186688-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU20.71:PCI-MSI.6=
7186688-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU20.73:PCI-MSI.6=
7186688-edge.ioat-msix
      5351 =C2=B1 40%     -13.3%       4639 =C2=B1 57%  interrupts.CPU20.CA=
L:Function_call_interrupts
      0.00         +5e+101%       0.50 =C2=B1223%  interrupts.CPU20.IWI:IRQ=
_work_interrupts
    127413            -2.3%     124527 =C2=B1  5%  interrupts.CPU20.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU20.MCP:Machine_=
check_polls
      1564 =C2=B1 19%     -12.3%       1372 =C2=B1 93%  interrupts.CPU20.NM=
I:Non-maskable_interrupts
      1564 =C2=B1 19%     -12.3%       1372 =C2=B1 93%  interrupts.CPU20.PM=
I:Performance_monitoring_interrupts
      1786 =C2=B1 25%      +2.8%       1836 =C2=B1 38%  interrupts.CPU20.RE=
S:Rescheduling_interrupts
     26.00 =C2=B1 30%     -83.3%       4.33 =C2=B1 51%  interrupts.CPU20.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU21.71:PCI-MSI.6=
7188736-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU21.72:PCI-MSI.6=
7188736-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU21.74:PCI-MSI.6=
7188736-edge.ioat-msix
      4081 =C2=B1 19%     -25.5%       3039 =C2=B1 49%  interrupts.CPU21.CA=
L:Function_call_interrupts
    127311            -2.2%     124517 =C2=B1  5%  interrupts.CPU21.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU21.MCP:Machine_=
check_polls
      1207 =C2=B1 29%      -8.2%       1108 =C2=B1 53%  interrupts.CPU21.NM=
I:Non-maskable_interrupts
      1207 =C2=B1 29%      -8.2%       1108 =C2=B1 53%  interrupts.CPU21.PM=
I:Performance_monitoring_interrupts
      1452 =C2=B1 14%     -17.1%       1203 =C2=B1 37%  interrupts.CPU21.RE=
S:Rescheduling_interrupts
     24.33 =C2=B1 38%     -80.8%       4.67 =C2=B1 57%  interrupts.CPU21.TL=
B:TLB_shootdowns
      4039 =C2=B1 40%     -31.8%       2756 =C2=B1 23%  interrupts.CPU22.CA=
L:Function_call_interrupts
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%  interrupts.CPU22.IW=
I:IRQ_work_interrupts
    127438            -2.2%     124571 =C2=B1  5%  interrupts.CPU22.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU22.MCP:Machine_=
check_polls
      1410 =C2=B1 22%     -22.5%       1093 =C2=B1 49%  interrupts.CPU22.NM=
I:Non-maskable_interrupts
      1410 =C2=B1 22%     -22.5%       1093 =C2=B1 49%  interrupts.CPU22.PM=
I:Performance_monitoring_interrupts
      1278 =C2=B1 12%      -7.4%       1183 =C2=B1 21%  interrupts.CPU22.RE=
S:Rescheduling_interrupts
     21.83 =C2=B1 54%     -70.2%       6.50 =C2=B1 23%  interrupts.CPU22.TL=
B:TLB_shootdowns
      2687 =C2=B1 15%     -16.2%       2252 =C2=B1 29%  interrupts.CPU23.CA=
L:Function_call_interrupts
    127416            -2.3%     124541 =C2=B1  5%  interrupts.CPU23.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU23.MCP:Machine_=
check_polls
      1201 =C2=B1 26%     -27.6%     870.00 =C2=B1 48%  interrupts.CPU23.NM=
I:Non-maskable_interrupts
      1201 =C2=B1 26%     -27.6%     870.00 =C2=B1 48%  interrupts.CPU23.PM=
I:Performance_monitoring_interrupts
    984.50 =C2=B1 13%      -5.4%     931.33 =C2=B1 32%  interrupts.CPU23.RE=
S:Rescheduling_interrupts
     20.00 =C2=B1 15%     -68.3%       6.33 =C2=B1 66%  interrupts.CPU23.TL=
B:TLB_shootdowns
      3659 =C2=B1 28%      +0.9%       3693 =C2=B1 35%  interrupts.CPU24.CA=
L:Function_call_interrupts
      0.00         +5e+101%       0.50 =C2=B1152%  interrupts.CPU24.IWI:IRQ=
_work_interrupts
    127536            -1.3%     125901 =C2=B1  2%  interrupts.CPU24.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU24.MCP:Machine_=
check_polls
      1082 =C2=B1 37%     +30.3%       1411 =C2=B1 29%  interrupts.CPU24.NM=
I:Non-maskable_interrupts
      1082 =C2=B1 37%     +30.3%       1411 =C2=B1 29%  interrupts.CPU24.PM=
I:Performance_monitoring_interrupts
      1042 =C2=B1 19%     +41.6%       1476 =C2=B1 26%  interrupts.CPU24.RE=
S:Rescheduling_interrupts
     24.00 =C2=B1 15%     -75.7%       5.83 =C2=B1 47%  interrupts.CPU24.TL=
B:TLB_shootdowns
      4805 =C2=B1 28%     -33.8%       3179 =C2=B1 43%  interrupts.CPU25.CA=
L:Function_call_interrupts
      0.17 =C2=B1223%    +100.0%       0.33 =C2=B1141%  interrupts.CPU25.IW=
I:IRQ_work_interrupts
    127443            -1.1%     126055 =C2=B1  2%  interrupts.CPU25.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU25.MCP:Machine_=
check_polls
      1458 =C2=B1 38%      +0.5%       1466 =C2=B1 30%  interrupts.CPU25.NM=
I:Non-maskable_interrupts
      1458 =C2=B1 38%      +0.5%       1466 =C2=B1 30%  interrupts.CPU25.PM=
I:Performance_monitoring_interrupts
      1871 =C2=B1 19%     +17.8%       2204 =C2=B1 20%  interrupts.CPU25.RE=
S:Rescheduling_interrupts
     26.83 =C2=B1 27%     -78.3%       5.83 =C2=B1 20%  interrupts.CPU25.TL=
B:TLB_shootdowns
    205.33 =C2=B1 55%     -50.7%     101.17 =C2=B1 41%  interrupts.CPU26.35=
:PCI-MSI.2621441-edge.eth0-TxRx-0
      4931 =C2=B1 34%     -37.5%       3080 =C2=B1 24%  interrupts.CPU26.CA=
L:Function_call_interrupts
      0.50 =C2=B1223%     -33.3%       0.33 =C2=B1141%  interrupts.CPU26.IW=
I:IRQ_work_interrupts
    127308            -1.1%     125955 =C2=B1  2%  interrupts.CPU26.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU26.MCP:Machine_=
check_polls
      1481 =C2=B1 29%     +17.0%       1733 =C2=B1 57%  interrupts.CPU26.NM=
I:Non-maskable_interrupts
      1481 =C2=B1 29%     +17.0%       1733 =C2=B1 57%  interrupts.CPU26.PM=
I:Performance_monitoring_interrupts
      1926 =C2=B1 15%     +11.5%       2148 =C2=B1 23%  interrupts.CPU26.RE=
S:Rescheduling_interrupts
     26.83 =C2=B1 19%     -73.3%       7.17 =C2=B1 37%  interrupts.CPU26.TL=
B:TLB_shootdowns
    534.00 =C2=B1 89%      +3.9%     554.67 =C2=B1157%  interrupts.CPU27.36=
:PCI-MSI.2621442-edge.eth0-TxRx-1
      4598 =C2=B1 24%     -12.7%       4014 =C2=B1 43%  interrupts.CPU27.CA=
L:Function_call_interrupts
      0.00         +5e+101%       0.50 =C2=B1100%  interrupts.CPU27.IWI:IRQ=
_work_interrupts
    127428            -1.2%     125950 =C2=B1  2%  interrupts.CPU27.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU27.MCP:Machine_=
check_polls
      1129 =C2=B1 16%     +56.1%       1763 =C2=B1 30%  interrupts.CPU27.NM=
I:Non-maskable_interrupts
      1129 =C2=B1 16%     +56.1%       1763 =C2=B1 30%  interrupts.CPU27.PM=
I:Performance_monitoring_interrupts
      1969 =C2=B1 20%     +31.8%       2595 =C2=B1 19%  interrupts.CPU27.RE=
S:Rescheduling_interrupts
     25.50 =C2=B1 13%     -71.2%       7.33 =C2=B1 31%  interrupts.CPU27.TL=
B:TLB_shootdowns
    238.50 =C2=B1 95%    +752.9%       2034 =C2=B1138%  interrupts.CPU28.37=
:PCI-MSI.2621443-edge.eth0-TxRx-2
      6256 =C2=B1 35%     -43.2%       3551 =C2=B1 44%  interrupts.CPU28.CA=
L:Function_call_interrupts
      1.33 =C2=B1111%     -37.5%       0.83 =C2=B1128%  interrupts.CPU28.IW=
I:IRQ_work_interrupts
    127617            -1.3%     125938 =C2=B1  2%  interrupts.CPU28.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU28.MCP:Machine_=
check_polls
      1275 =C2=B1 47%     +34.3%       1713 =C2=B1 59%  interrupts.CPU28.NM=
I:Non-maskable_interrupts
      1275 =C2=B1 47%     +34.3%       1713 =C2=B1 59%  interrupts.CPU28.PM=
I:Performance_monitoring_interrupts
      2561 =C2=B1 15%      +4.2%       2669 =C2=B1 22%  interrupts.CPU28.RE=
S:Rescheduling_interrupts
     28.83 =C2=B1 15%     -80.9%       5.50 =C2=B1 22%  interrupts.CPU28.TL=
B:TLB_shootdowns
    628.33 =C2=B1126%    +110.7%       1324 =C2=B1199%  interrupts.CPU29.38=
:PCI-MSI.2621444-edge.eth0-TxRx-3
      6917 =C2=B1 19%     -36.3%       4407 =C2=B1 52%  interrupts.CPU29.CA=
L:Function_call_interrupts
      0.33 =C2=B1141%    +250.0%       1.17 =C2=B1151%  interrupts.CPU29.IW=
I:IRQ_work_interrupts
    127446            -1.2%     125937 =C2=B1  2%  interrupts.CPU29.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU29.MCP:Machine_=
check_polls
      1458 =C2=B1 28%      +7.0%       1560 =C2=B1 38%  interrupts.CPU29.NM=
I:Non-maskable_interrupts
      1458 =C2=B1 28%      +7.0%       1560 =C2=B1 38%  interrupts.CPU29.PM=
I:Performance_monitoring_interrupts
      2246 =C2=B1 15%     +11.1%       2496 =C2=B1 25%  interrupts.CPU29.RE=
S:Rescheduling_interrupts
     28.33 =C2=B1 22%     -74.7%       7.17 =C2=B1 38%  interrupts.CPU29.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU3.48:PCI-MSI.26=
23493-edge
      0.00          -100.0%       0.00        interrupts.CPU3.58:PCI-MSI.71=
680-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU3.58:PCI-MSI.73=
728-edge.ioat-msix
      4885 =C2=B1 19%     -42.0%       2832 =C2=B1 41%  interrupts.CPU3.CAL=
:Function_call_interrupts
      0.00       +8.3e+101%       0.83 =C2=B1223%  interrupts.CPU3.IWI:IRQ_=
work_interrupts
    127351            -1.1%     125904 =C2=B1  2%  interrupts.CPU3.LOC:Loca=
l_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU3.MCP:Machine_c=
heck_polls
      1053 =C2=B1 12%     +22.4%       1289 =C2=B1 32%  interrupts.CPU3.NMI=
:Non-maskable_interrupts
      1053 =C2=B1 12%     +22.4%       1289 =C2=B1 32%  interrupts.CPU3.PMI=
:Performance_monitoring_interrupts
      1461 =C2=B1 11%      -2.5%       1424 =C2=B1 28%  interrupts.CPU3.RES=
:Rescheduling_interrupts
     28.17 =C2=B1 20%     -80.5%       5.50 =C2=B1 50%  interrupts.CPU3.TLB=
:TLB_shootdowns
      2011 =C2=B1161%     -82.8%     346.83 =C2=B1127%  interrupts.CPU30.39=
:PCI-MSI.2621445-edge.eth0-TxRx-4
      4256 =C2=B1 50%     -24.7%       3206 =C2=B1 54%  interrupts.CPU30.CA=
L:Function_call_interrupts
      0.17 =C2=B1223%    +100.0%       0.33 =C2=B1141%  interrupts.CPU30.IW=
I:IRQ_work_interrupts
    127430            -1.3%     125805 =C2=B1  2%  interrupts.CPU30.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU30.MCP:Machine_=
check_polls
      1374 =C2=B1 32%      +5.9%       1455 =C2=B1 59%  interrupts.CPU30.NM=
I:Non-maskable_interrupts
      1374 =C2=B1 32%      +5.9%       1455 =C2=B1 59%  interrupts.CPU30.PM=
I:Performance_monitoring_interrupts
      2286 =C2=B1 15%      -0.9%       2266 =C2=B1 39%  interrupts.CPU30.RE=
S:Rescheduling_interrupts
     24.67 =C2=B1 32%     -80.4%       4.83 =C2=B1 30%  interrupts.CPU30.TL=
B:TLB_shootdowns
      5111 =C2=B1167%     -97.9%     109.00 =C2=B1 82%  interrupts.CPU31.40=
:PCI-MSI.2621446-edge.eth0-TxRx-5
      2656 =C2=B1 42%     +65.8%       4405 =C2=B1 32%  interrupts.CPU31.CA=
L:Function_call_interrupts
    127454            -1.2%     125956 =C2=B1  2%  interrupts.CPU31.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU31.MCP:Machine_=
check_polls
      1294 =C2=B1 22%     -22.2%       1007 =C2=B1 39%  interrupts.CPU31.NM=
I:Non-maskable_interrupts
      1294 =C2=B1 22%     -22.2%       1007 =C2=B1 39%  interrupts.CPU31.PM=
I:Performance_monitoring_interrupts
      1577 =C2=B1 26%     +17.3%       1850 =C2=B1 27%  interrupts.CPU31.RE=
S:Rescheduling_interrupts
     25.17 =C2=B1 40%     -74.2%       6.50 =C2=B1 19%  interrupts.CPU31.TL=
B:TLB_shootdowns
    224.83 =C2=B1132%     -18.8%     182.67 =C2=B1 54%  interrupts.CPU32.41=
:PCI-MSI.2621447-edge.eth0-TxRx-6
      5295 =C2=B1 32%     -15.9%       4452 =C2=B1 45%  interrupts.CPU32.CA=
L:Function_call_interrupts
      0.17 =C2=B1223%    +200.0%       0.50 =C2=B1100%  interrupts.CPU32.IW=
I:IRQ_work_interrupts
    127497            -1.3%     125866 =C2=B1  2%  interrupts.CPU32.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU32.MCP:Machine_=
check_polls
      1187 =C2=B1 30%     +18.8%       1410 =C2=B1 46%  interrupts.CPU32.NM=
I:Non-maskable_interrupts
      1187 =C2=B1 30%     +18.8%       1410 =C2=B1 46%  interrupts.CPU32.PM=
I:Performance_monitoring_interrupts
      2167 =C2=B1 20%     +21.1%       2625 =C2=B1  5%  interrupts.CPU32.RE=
S:Rescheduling_interrupts
     26.67 =C2=B1 47%     -76.9%       6.17 =C2=B1 25%  interrupts.CPU32.TL=
B:TLB_shootdowns
    209.83 =C2=B1155%     +29.6%     272.00 =C2=B1120%  interrupts.CPU33.42=
:PCI-MSI.2621448-edge.eth0-TxRx-7
      4981 =C2=B1 48%     -17.8%       4092 =C2=B1 64%  interrupts.CPU33.CA=
L:Function_call_interrupts
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%  interrupts.CPU33.IW=
I:IRQ_work_interrupts
    127480            -1.2%     125917 =C2=B1  2%  interrupts.CPU33.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU33.MCP:Machine_=
check_polls
      1493 =C2=B1 20%     -11.6%       1319 =C2=B1 46%  interrupts.CPU33.NM=
I:Non-maskable_interrupts
      1493 =C2=B1 20%     -11.6%       1319 =C2=B1 46%  interrupts.CPU33.PM=
I:Performance_monitoring_interrupts
      2084 =C2=B1 23%     +16.8%       2435 =C2=B1 33%  interrupts.CPU33.RE=
S:Rescheduling_interrupts
     29.00 =C2=B1 45%     -74.7%       7.33 =C2=B1 56%  interrupts.CPU33.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU34.4:IO-APIC.4-=
edge.ttyS0
      4062 =C2=B1 52%     +11.5%       4528 =C2=B1 47%  interrupts.CPU34.CA=
L:Function_call_interrupts
      0.50 =C2=B1152%     -66.7%       0.17 =C2=B1223%  interrupts.CPU34.IW=
I:IRQ_work_interrupts
    127471            -1.3%     125808 =C2=B1  2%  interrupts.CPU34.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU34.MCP:Machine_=
check_polls
      1416 =C2=B1 30%     -17.5%       1168 =C2=B1 29%  interrupts.CPU34.NM=
I:Non-maskable_interrupts
      1416 =C2=B1 30%     -17.5%       1168 =C2=B1 29%  interrupts.CPU34.PM=
I:Performance_monitoring_interrupts
      1698 =C2=B1 21%     +39.2%       2364 =C2=B1 43%  interrupts.CPU34.RE=
S:Rescheduling_interrupts
     31.00 =C2=B1 35%     -82.8%       5.33 =C2=B1 40%  interrupts.CPU34.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU35.44:PCI-MSI.2=
623489-edge
      0.00          -100.0%       0.00        interrupts.CPU35.53:PCI-MSI.6=
5536-edge.ioat-msix
      3013 =C2=B1 39%      -2.8%       2929 =C2=B1 35%  interrupts.CPU35.CA=
L:Function_call_interrupts
      0.00       +3.3e+101%       0.33 =C2=B1141%  interrupts.CPU35.IWI:IRQ=
_work_interrupts
    127456            -1.2%     125902 =C2=B1  2%  interrupts.CPU35.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU35.MCP:Machine_=
check_polls
      1107 =C2=B1 40%     +35.3%       1498 =C2=B1 52%  interrupts.CPU35.NM=
I:Non-maskable_interrupts
      1107 =C2=B1 40%     +35.3%       1498 =C2=B1 52%  interrupts.CPU35.PM=
I:Performance_monitoring_interrupts
      1402 =C2=B1 22%     +36.4%       1913 =C2=B1 14%  interrupts.CPU35.RE=
S:Rescheduling_interrupts
     26.67 =C2=B1 23%     -74.4%       6.83 =C2=B1 37%  interrupts.CPU35.TL=
B:TLB_shootdowns
      4242 =C2=B1 34%      +0.4%       4260 =C2=B1 60%  interrupts.CPU36.CA=
L:Function_call_interrupts
      0.83 =C2=B1175%    -100.0%       0.00        interrupts.CPU36.IWI:IRQ=
_work_interrupts
    127548            -1.9%     125158 =C2=B1  4%  interrupts.CPU36.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU36.MCP:Machine_=
check_polls
      1367 =C2=B1 43%     -17.8%       1123 =C2=B1 46%  interrupts.CPU36.NM=
I:Non-maskable_interrupts
      1367 =C2=B1 43%     -17.8%       1123 =C2=B1 46%  interrupts.CPU36.PM=
I:Performance_monitoring_interrupts
      2047 =C2=B1 22%      -2.6%       1993 =C2=B1 27%  interrupts.CPU36.RE=
S:Rescheduling_interrupts
     19.67 =C2=B1 26%     -73.7%       5.17 =C2=B1 39%  interrupts.CPU36.TL=
B:TLB_shootdowns
      4808 =C2=B1 34%     -40.9%       2843 =C2=B1 27%  interrupts.CPU37.CA=
L:Function_call_interrupts
      0.33 =C2=B1223%    -100.0%       0.00        interrupts.CPU37.IWI:IRQ=
_work_interrupts
    127457            -2.0%     124883 =C2=B1  4%  interrupts.CPU37.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU37.MCP:Machine_=
check_polls
      1570 =C2=B1 33%     -40.3%     937.17 =C2=B1 33%  interrupts.CPU37.NM=
I:Non-maskable_interrupts
      1570 =C2=B1 33%     -40.3%     937.17 =C2=B1 33%  interrupts.CPU37.PM=
I:Performance_monitoring_interrupts
      1784 =C2=B1 21%      +6.9%       1907 =C2=B1 26%  interrupts.CPU37.RE=
S:Rescheduling_interrupts
     23.00 =C2=B1 24%     -79.7%       4.67 =C2=B1 72%  interrupts.CPU37.TL=
B:TLB_shootdowns
      5213 =C2=B1 43%     -32.7%       3506 =C2=B1 39%  interrupts.CPU38.CA=
L:Function_call_interrupts
      0.17 =C2=B1223%    +100.0%       0.33 =C2=B1223%  interrupts.CPU38.IW=
I:IRQ_work_interrupts
    127435            -2.1%     124711 =C2=B1  4%  interrupts.CPU38.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU38.MCP:Machine_=
check_polls
      1488 =C2=B1 41%     -28.1%       1069 =C2=B1 58%  interrupts.CPU38.NM=
I:Non-maskable_interrupts
      1488 =C2=B1 41%     -28.1%       1069 =C2=B1 58%  interrupts.CPU38.PM=
I:Performance_monitoring_interrupts
      2142 =C2=B1 16%      -5.3%       2029 =C2=B1 17%  interrupts.CPU38.RE=
S:Rescheduling_interrupts
     20.67 =C2=B1 15%     -73.4%       5.50 =C2=B1 52%  interrupts.CPU38.TL=
B:TLB_shootdowns
      4545 =C2=B1 34%     -32.0%       3090 =C2=B1 39%  interrupts.CPU39.CA=
L:Function_call_interrupts
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%  interrupts.CPU39.IW=
I:IRQ_work_interrupts
    127458            -2.2%     124596 =C2=B1  4%  interrupts.CPU39.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU39.MCP:Machine_=
check_polls
      1473 =C2=B1 31%     -24.7%       1108 =C2=B1 65%  interrupts.CPU39.NM=
I:Non-maskable_interrupts
      1473 =C2=B1 31%     -24.7%       1108 =C2=B1 65%  interrupts.CPU39.PM=
I:Performance_monitoring_interrupts
      1949 =C2=B1 29%      -3.1%       1889 =C2=B1 21%  interrupts.CPU39.RE=
S:Rescheduling_interrupts
     30.33 =C2=B1 20%     -81.3%       5.67 =C2=B1 28%  interrupts.CPU39.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU4.49:PCI-MSI.26=
23494-edge
      0.00          -100.0%       0.00        interrupts.CPU4.59:PCI-MSI.73=
728-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU4.59:PCI-MSI.75=
776-edge.ioat-msix
      6142 =C2=B1 33%     -34.3%       4036 =C2=B1 46%  interrupts.CPU4.CAL=
:Function_call_interrupts
      0.00       +3.3e+101%       0.33 =C2=B1141%  interrupts.CPU4.IWI:IRQ_=
work_interrupts
    127425            -1.1%     126057 =C2=B1  2%  interrupts.CPU4.LOC:Loca=
l_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU4.MCP:Machine_c=
heck_polls
      1186 =C2=B1 37%      +7.5%       1275 =C2=B1 50%  interrupts.CPU4.NMI=
:Non-maskable_interrupts
      1186 =C2=B1 37%      +7.5%       1275 =C2=B1 50%  interrupts.CPU4.PMI=
:Performance_monitoring_interrupts
      2157 =C2=B1 17%     -15.0%       1832 =C2=B1 30%  interrupts.CPU4.RES=
:Rescheduling_interrupts
     24.33 =C2=B1 24%     -84.9%       3.67 =C2=B1 46%  interrupts.CPU4.TLB=
:TLB_shootdowns
      5004 =C2=B1 59%      +1.2%       5066 =C2=B1 69%  interrupts.CPU40.CA=
L:Function_call_interrupts
      0.17 =C2=B1223%    +100.0%       0.33 =C2=B1141%  interrupts.CPU40.IW=
I:IRQ_work_interrupts
    127356            -2.2%     124530 =C2=B1  5%  interrupts.CPU40.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU40.MCP:Machine_=
check_polls
      1529 =C2=B1 38%     -18.8%       1242 =C2=B1 55%  interrupts.CPU40.NM=
I:Non-maskable_interrupts
      1529 =C2=B1 38%     -18.8%       1242 =C2=B1 55%  interrupts.CPU40.PM=
I:Performance_monitoring_interrupts
      2330 =C2=B1 21%      -0.4%       2321 =C2=B1 27%  interrupts.CPU40.RE=
S:Rescheduling_interrupts
     24.50 =C2=B1 11%     -77.6%       5.50 =C2=B1 44%  interrupts.CPU40.TL=
B:TLB_shootdowns
      4611 =C2=B1 35%     -23.5%       3526 =C2=B1 40%  interrupts.CPU41.CA=
L:Function_call_interrupts
      0.50 =C2=B1152%     -66.7%       0.17 =C2=B1223%  interrupts.CPU41.IW=
I:IRQ_work_interrupts
    127428            -2.3%     124554 =C2=B1  5%  interrupts.CPU41.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU41.MCP:Machine_=
check_polls
      1620 =C2=B1 33%     -33.9%       1071 =C2=B1 64%  interrupts.CPU41.NM=
I:Non-maskable_interrupts
      1620 =C2=B1 33%     -33.9%       1071 =C2=B1 64%  interrupts.CPU41.PM=
I:Performance_monitoring_interrupts
      2145 =C2=B1 18%      +4.1%       2233 =C2=B1 45%  interrupts.CPU41.RE=
S:Rescheduling_interrupts
     26.83 =C2=B1  8%     -80.1%       5.33 =C2=B1 46%  interrupts.CPU41.TL=
B:TLB_shootdowns
      5388 =C2=B1 37%     -31.5%       3692 =C2=B1 48%  interrupts.CPU42.CA=
L:Function_call_interrupts
      0.50 =C2=B1152%     -66.7%       0.17 =C2=B1223%  interrupts.CPU42.IW=
I:IRQ_work_interrupts
    127435            -2.2%     124605 =C2=B1  5%  interrupts.CPU42.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU42.MCP:Machine_=
check_polls
      1445 =C2=B1 42%     -39.0%     881.33 =C2=B1 69%  interrupts.CPU42.NM=
I:Non-maskable_interrupts
      1445 =C2=B1 42%     -39.0%     881.33 =C2=B1 69%  interrupts.CPU42.PM=
I:Performance_monitoring_interrupts
      2060 =C2=B1 23%      -6.3%       1930 =C2=B1 10%  interrupts.CPU42.RE=
S:Rescheduling_interrupts
     29.33 =C2=B1 15%     -82.4%       5.17 =C2=B1 45%  interrupts.CPU42.TL=
B:TLB_shootdowns
      3946 =C2=B1 44%     -24.3%       2986 =C2=B1 32%  interrupts.CPU43.CA=
L:Function_call_interrupts
      0.00       +1.7e+101%       0.17 =C2=B1223%  interrupts.CPU43.IWI:IRQ=
_work_interrupts
    127527            -2.3%     124540 =C2=B1  5%  interrupts.CPU43.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU43.MCP:Machine_=
check_polls
      1226 =C2=B1 36%      +6.8%       1310 =C2=B1 62%  interrupts.CPU43.NM=
I:Non-maskable_interrupts
      1226 =C2=B1 36%      +6.8%       1310 =C2=B1 62%  interrupts.CPU43.PM=
I:Performance_monitoring_interrupts
      1741 =C2=B1 16%     -10.5%       1558 =C2=B1 12%  interrupts.CPU43.RE=
S:Rescheduling_interrupts
     25.83 =C2=B1 20%     -76.8%       6.00 =C2=B1 27%  interrupts.CPU43.TL=
B:TLB_shootdowns
      4955 =C2=B1 41%     -10.3%       4443 =C2=B1 59%  interrupts.CPU44.CA=
L:Function_call_interrupts
      0.00       +6.7e+101%       0.67 =C2=B1165%  interrupts.CPU44.IWI:IRQ=
_work_interrupts
    127480            -2.3%     124532 =C2=B1  5%  interrupts.CPU44.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU44.MCP:Machine_=
check_polls
      1032 =C2=B1 49%     +37.8%       1421 =C2=B1 40%  interrupts.CPU44.NM=
I:Non-maskable_interrupts
      1032 =C2=B1 49%     +37.8%       1421 =C2=B1 40%  interrupts.CPU44.PM=
I:Performance_monitoring_interrupts
      2091 =C2=B1 20%     +14.5%       2395 =C2=B1 28%  interrupts.CPU44.RE=
S:Rescheduling_interrupts
     21.33 =C2=B1 20%     -67.2%       7.00 =C2=B1 27%  interrupts.CPU44.TL=
B:TLB_shootdowns
      3885 =C2=B1 19%     -15.2%       3294 =C2=B1 29%  interrupts.CPU45.CA=
L:Function_call_interrupts
      0.00       +1.7e+101%       0.17 =C2=B1223%  interrupts.CPU45.IWI:IRQ=
_work_interrupts
    127427            -2.3%     124464 =C2=B1  5%  interrupts.CPU45.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU45.MCP:Machine_=
check_polls
      1774 =C2=B1  6%     -37.2%       1114 =C2=B1 47%  interrupts.CPU45.NM=
I:Non-maskable_interrupts
      1774 =C2=B1  6%     -37.2%       1114 =C2=B1 47%  interrupts.CPU45.PM=
I:Performance_monitoring_interrupts
      1748 =C2=B1 18%      -1.7%       1717 =C2=B1 22%  interrupts.CPU45.RE=
S:Rescheduling_interrupts
     24.50 =C2=B1  5%     -67.3%       8.00 =C2=B1 46%  interrupts.CPU45.TL=
B:TLB_shootdowns
      4259 =C2=B1 41%     -40.8%       2522 =C2=B1 29%  interrupts.CPU46.CA=
L:Function_call_interrupts
      0.00       +1.7e+101%       0.17 =C2=B1223%  interrupts.CPU46.IWI:IRQ=
_work_interrupts
    127459            -2.3%     124542 =C2=B1  5%  interrupts.CPU46.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU46.MCP:Machine_=
check_polls
      1055 =C2=B1 36%      +2.9%       1086 =C2=B1 59%  interrupts.CPU46.NM=
I:Non-maskable_interrupts
      1055 =C2=B1 36%      +2.9%       1086 =C2=B1 59%  interrupts.CPU46.PM=
I:Performance_monitoring_interrupts
      1527 =C2=B1 20%      -2.5%       1489 =C2=B1 15%  interrupts.CPU46.RE=
S:Rescheduling_interrupts
     25.83 =C2=B1 23%     -68.4%       8.17 =C2=B1 22%  interrupts.CPU46.TL=
B:TLB_shootdowns
      2788 =C2=B1 15%     -36.8%       1761 =C2=B1 56%  interrupts.CPU47.CA=
L:Function_call_interrupts
      0.17 =C2=B1223%    -100.0%       0.00        interrupts.CPU47.IWI:IRQ=
_work_interrupts
    127426            -2.3%     124538 =C2=B1  5%  interrupts.CPU47.LOC:Loc=
al_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU47.MCP:Machine_=
check_polls
      1418 =C2=B1 38%     -56.1%     623.33 =C2=B1 28%  interrupts.CPU47.NM=
I:Non-maskable_interrupts
      1418 =C2=B1 38%     -56.1%     623.33 =C2=B1 28%  interrupts.CPU47.PM=
I:Performance_monitoring_interrupts
      1241 =C2=B1 13%      -9.6%       1122 =C2=B1 23%  interrupts.CPU47.RE=
S:Rescheduling_interrupts
     38.17 =C2=B1  9%     -49.8%      19.17 =C2=B1 20%  interrupts.CPU47.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU5.50:PCI-MSI.26=
23495-edge
      0.00          -100.0%       0.00        interrupts.CPU5.60:PCI-MSI.75=
776-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU5.60:PCI-MSI.77=
824-edge.ioat-msix
      6219 =C2=B1 26%     -39.3%       3775 =C2=B1 53%  interrupts.CPU5.CAL=
:Function_call_interrupts
      0.00       +1.7e+101%       0.17 =C2=B1223%  interrupts.CPU5.IWI:IRQ_=
work_interrupts
    127475            -1.1%     126121 =C2=B1  2%  interrupts.CPU5.LOC:Loca=
l_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU5.MCP:Machine_c=
heck_polls
      1160 =C2=B1 37%     +17.7%       1365 =C2=B1 45%  interrupts.CPU5.NMI=
:Non-maskable_interrupts
      1160 =C2=B1 37%     +17.7%       1365 =C2=B1 45%  interrupts.CPU5.PMI=
:Performance_monitoring_interrupts
      1814 =C2=B1 23%     -12.2%       1593 =C2=B1 36%  interrupts.CPU5.RES=
:Rescheduling_interrupts
     25.17 =C2=B1 12%     -77.5%       5.67 =C2=B1 47%  interrupts.CPU5.TLB=
:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU6.51:PCI-MSI.26=
23496-edge
      0.00          -100.0%       0.00        interrupts.CPU6.61:PCI-MSI.77=
824-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU6.61:PCI-MSI.79=
872-edge.ioat-msix
      4120 =C2=B1 54%     -21.1%       3251 =C2=B1 54%  interrupts.CPU6.CAL=
:Function_call_interrupts
    127445            -1.3%     125789 =C2=B1  2%  interrupts.CPU6.LOC:Loca=
l_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU6.MCP:Machine_c=
heck_polls
    939.17 =C2=B1 34%     +25.1%       1175 =C2=B1 36%  interrupts.CPU6.NMI=
:Non-maskable_interrupts
    939.17 =C2=B1 34%     +25.1%       1175 =C2=B1 36%  interrupts.CPU6.PMI=
:Performance_monitoring_interrupts
      1357 =C2=B1 34%      -3.8%       1305 =C2=B1 32%  interrupts.CPU6.RES=
:Rescheduling_interrupts
     23.33 =C2=B1 32%     -80.0%       4.67 =C2=B1 36%  interrupts.CPU6.TLB=
:TLB_shootdowns
    207.50 =C2=B1141%     -56.9%      89.50 =C2=B1223%  interrupts.CPU7.62:=
PCI-MSI.2097152-edge.isci-msix
      0.00          -100.0%       0.00        interrupts.CPU7.62:PCI-MSI.79=
872-edge.ioat-msix
      2453 =C2=B1 32%     +51.3%       3712 =C2=B1 30%  interrupts.CPU7.CAL=
:Function_call_interrupts
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%  interrupts.CPU7.IWI=
:IRQ_work_interrupts
    127440            -1.2%     125920 =C2=B1  2%  interrupts.CPU7.LOC:Loca=
l_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU7.MCP:Machine_c=
heck_polls
      1123 =C2=B1 30%      -2.3%       1098 =C2=B1 15%  interrupts.CPU7.NMI=
:Non-maskable_interrupts
      1123 =C2=B1 30%      -2.3%       1098 =C2=B1 15%  interrupts.CPU7.PMI=
:Performance_monitoring_interrupts
      1100 =C2=B1 15%     +45.3%       1598 =C2=B1 19%  interrupts.CPU7.RES=
:Rescheduling_interrupts
     24.67 =C2=B1 33%     -71.6%       7.00 =C2=B1 21%  interrupts.CPU7.TLB=
:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU8.22:IO-APIC.22=
-fasteoi.ehci_hcd:usb1
    117.83 =C2=B1223%    -100.0%       0.00        interrupts.CPU8.71:PCI-M=
SI.2097152-edge.isci-msix
    322.17 =C2=B1100%     +50.8%     485.83 =C2=B1 48%  interrupts.CPU8.73:=
PCI-MSI.2097152-edge.isci-msix
      4741 =C2=B1 20%     -12.3%       4156 =C2=B1 58%  interrupts.CPU8.CAL=
:Function_call_interrupts
      0.50 =C2=B1223%    -100.0%       0.00        interrupts.CPU8.IWI:IRQ_=
work_interrupts
    127379            -1.2%     125905 =C2=B1  2%  interrupts.CPU8.LOC:Loca=
l_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU8.MCP:Machine_c=
heck_polls
      1261 =C2=B1 29%     -17.6%       1038 =C2=B1 29%  interrupts.CPU8.NMI=
:Non-maskable_interrupts
      1261 =C2=B1 29%     -17.6%       1038 =C2=B1 29%  interrupts.CPU8.PMI=
:Performance_monitoring_interrupts
      1488 =C2=B1 13%     +21.2%       1803 =C2=B1 26%  interrupts.CPU8.RES=
:Rescheduling_interrupts
     21.83 =C2=B1 34%     -71.8%       6.17 =C2=B1 63%  interrupts.CPU8.TLB=
:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU9.20:IO-APIC.20=
-fasteoi.ehci_hcd:usb2
      0.00          -100.0%       0.00        interrupts.CPU9.64:PCI-MSI.79=
872-edge.ioat-msix
      4119 =C2=B1 41%      +0.6%       4143 =C2=B1 50%  interrupts.CPU9.CAL=
:Function_call_interrupts
      0.33 =C2=B1223%    -100.0%       0.00        interrupts.CPU9.IWI:IRQ_=
work_interrupts
    127484            -1.2%     125907 =C2=B1  2%  interrupts.CPU9.LOC:Loca=
l_timer_interrupts
      0.00          -100.0%       0.00        interrupts.CPU9.MCP:Machine_c=
heck_polls
      1159 =C2=B1 27%      -7.0%       1077 =C2=B1 26%  interrupts.CPU9.NMI=
:Non-maskable_interrupts
      1159 =C2=B1 27%      -7.0%       1077 =C2=B1 26%  interrupts.CPU9.PMI=
:Performance_monitoring_interrupts
      1336 =C2=B1 27%     +46.4%       1956 =C2=B1 18%  interrupts.CPU9.RES=
:Rescheduling_interrupts
     21.00 =C2=B1 36%     -77.8%       4.67 =C2=B1 54%  interrupts.CPU9.TLB=
:TLB_shootdowns
     10.33 =C2=B1 22%     +21.0%      12.50 =C2=B1 19%  interrupts.IWI:IRQ_=
work_interrupts
   6117286            -1.7%    6013629 =C2=B1  3%  interrupts.LOC:Local_tim=
er_interrupts
      0.00          -100.0%       0.00        interrupts.MCP:Machine_check_=
polls
     62152 =C2=B1  3%      -7.6%      57456 =C2=B1  3%  interrupts.NMI:Non-=
maskable_interrupts
     62152 =C2=B1  3%      -7.6%      57456 =C2=B1  3%  interrupts.PMI:Perf=
ormance_monitoring_interrupts
     83027 =C2=B1  7%      +2.3%      84967 =C2=B1  5%  interrupts.RES:Resc=
heduling_interrupts
      0.00          -100.0%       0.00        interrupts.RTR:APIC_ICR_read_=
retries
      1257 =C2=B1 17%     -76.2%     298.83 =C2=B1 11%  interrupts.TLB:TLB_=
shootdowns
     57.56            -1.1       56.50 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_=
verify
     57.63            -1.1       56.57 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.start_secondary.secondary_startup_64_no_verify
     57.62            -1.1       56.56 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     58.57            -0.9       57.62        perf-profile.calltrace.cycles=
-pp.secondary_startup_64_no_verify
     39.13 =C2=B1  2%      -0.7       38.39 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_star=
tup_entry
     50.68            -0.6       50.03 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.secondary_=
startup_64_no_verify
     50.50            -0.6       49.87 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.start_=
secondary
      3.19 =C2=B1  2%      -0.2        2.97 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_seco=
ndary
      3.27 =C2=B1  2%      -0.2        3.05 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.secon=
dary_startup_64_no_verify
      4.65 =C2=B1  2%      -0.2        4.44 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe
      0.83 =C2=B1  6%      -0.2        0.63 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.__entry_text_start
      0.55 =C2=B1  5%      -0.2        0.36 =C2=B1 70%  perf-profile.calltr=
ace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYS=
CALL_64_after_hwframe
      0.45 =C2=B1 45%      -0.2        0.28 =C2=B1100%  perf-profile.calltr=
ace.cycles-pp.__pte_alloc.copy_pte_range.copy_page_range.dup_mmap.dup_mm
      2.89 =C2=B1  9%      -0.2        2.71 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_e=
nter.do_idle.cpu_startup_entry
      0.36 =C2=B1 70%      -0.2        0.18 =C2=B1141%  perf-profile.calltr=
ace.cycles-pp.do_set_pte.filemap_map_pages.do_fault.__handle_mm_fault.handl=
e_mm_fault
      0.26 =C2=B1100%      -0.2        0.09 =C2=B1223%  perf-profile.calltr=
ace.cycles-pp.ttwu_do_activate.try_to_wake_up.__wake_up_common.__wake_up_co=
mmon_lock.do_notify_parent_cldstop
      2.72 =C2=B1  9%      -0.2        2.55 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.c=
puidle_enter_state.cpuidle_enter.do_idle
      2.41 =C2=B1  3%      -0.2        2.24 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.__wake_up_common.__wake_up_common_lock.do_notify_parent_cldst=
op.ptrace_stop.ptrace_do_notify
      2.51 =C2=B1  4%      -0.2        2.34 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.__wake_up_common_lock.do_notify_parent_cldstop.ptrace_stop.pt=
race_do_notify.ptrace_notify
      0.25 =C2=B1100%      -0.2        0.09 =C2=B1223%  perf-profile.calltr=
ace.cycles-pp.enqueue_task_fair.ttwu_do_activate.try_to_wake_up.__wake_up_c=
ommon.__wake_up_common_lock
      2.15 =C2=B1  4%      -0.1        2.00 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.try_to_wake_up.__wake_up_common.__wake_up_common_lock.do_noti=
fy_parent_cldstop.ptrace_stop
      1.86 =C2=B1  4%      -0.1        1.73 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.menu_select.do_idle.cpu_startup_entry.start_secondary.seconda=
ry_startup_64_no_verify
      2.83 =C2=B1  4%      -0.1        2.71 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.syscall_exit_to_user_mode_prepare.syscall_exit_to_user_mode.e=
ntry_SYSCALL_64_after_hwframe
      1.43 =C2=B1  3%      -0.1        1.31 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.do_notify_parent_cldstop.ptrace_stop.ptrace_do_notify.ptrace_=
notify.syscall_exit_to_user_mode_prepare
      1.06 =C2=B1  5%      -0.1        0.95 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.do_sys_open.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.06 =C2=B1  5%      -0.1        0.94 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.do_sys_openat2.do_sys_open.do_syscall_64.entry_SYSCALL_64_aft=
er_hwframe
      2.80 =C2=B1  4%      -0.1        2.69 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.ptrace_notify.syscall_exit_to_user_mode_prepare.syscall_exit_=
to_user_mode.entry_SYSCALL_64_after_hwframe
      2.68 =C2=B1  4%      -0.1        2.57 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.ptrace_stop.ptrace_do_notify.ptrace_notify.syscall_exit_to_us=
er_mode_prepare.syscall_exit_to_user_mode
      2.78 =C2=B1  4%      -0.1        2.67 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.ptrace_do_notify.ptrace_notify.syscall_exit_to_user_mode_prep=
are.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe
      1.78 =C2=B1  9%      -0.1        1.67 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm=
_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.73 =C2=B1 12%      -0.1        0.63 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.page_remove_rmap.zap_pte_range.unmap_page_range.unmap_vmas.un=
map_region
      0.95 =C2=B1  5%      -0.1        0.85 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.do_filp_open.do_sys_openat2.do_sys_open.do_syscall_64.entry_S=
YSCALL_64_after_hwframe
      0.94 =C2=B1  5%      -0.1        0.84 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.do_sys_open.do_syscal=
l_64
      0.09 =C2=B1223%      -0.1        0.00        perf-profile.calltrace.c=
ycles-pp.tick_nohz_get_sleep_length.menu_select.do_idle.cpu_startup_entry.s=
tart_secondary
      1.41 =C2=B1  5%      -0.1        1.32 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.do_notify_parent_cldstop.ptrace_stop.ptrace_do_notify.ptrace_=
notify.syscall_trace_enter
      0.09 =C2=B1223%      -0.1        0.00        perf-profile.calltrace.c=
ycles-pp.scheduler_tick.update_process_times.tick_sched_handle.tick_sched_t=
imer.__hrtimer_run_queues
      0.17 =C2=B1141%      -0.1        0.08 =C2=B1223%  perf-profile.calltr=
ace.cycles-pp.__alloc_pages_nodemask.pte_alloc_one.__pte_alloc.copy_pte_ran=
ge.copy_page_range
      0.17 =C2=B1141%      -0.1        0.08 =C2=B1223%  perf-profile.calltr=
ace.cycles-pp.kmem_cache_free.remove_vma.__do_munmap.__vm_munmap.__x64_sys_=
munmap
      2.76 =C2=B1  3%      -0.1        2.68 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.syscall_trace_enter.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame
      2.74 =C2=B1  3%      -0.1        2.66 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.ptrace_notify.syscall_trace_enter.do_syscall_64.entry_SYSCALL=
_64_after_hwframe
      2.72 =C2=B1  3%      -0.1        2.63 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.ptrace_do_notify.ptrace_notify.syscall_trace_enter.do_syscall=
_64.entry_SYSCALL_64_after_hwframe
      1.69 =C2=B1 10%      -0.1        1.61 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_t=
imer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      1.33 =C2=B1  4%      -0.1        1.24 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.pick_next_task_fair.__schedule.schedule_idle.do_idle.cpu_star=
tup_entry
      2.62 =C2=B1  3%      -0.1        2.54 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.ptrace_stop.ptrace_do_notify.ptrace_notify.syscall_trace_ente=
r.do_syscall_64
      1.57 =C2=B1  3%      -0.1        1.49 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.__schedule.schedule.ptrace_stop.ptrace_do_notify.ptrace_notify
      1.37 =C2=B1  3%      -0.1        1.30 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.irqentry_exit_to_user_mode.asm_exc_page_fault
      0.79 =C2=B1  4%      -0.1        0.74 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.schedule.ptrace_stop.ptrace_do_notify.ptrace_notify.syscall_t=
race_enter
      0.74 =C2=B1  5%      -0.1        0.69 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.syscall_return_via_sysret
      0.99 =C2=B1  5%      -0.1        0.94 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.set_next_entity.pick_next_task_fair.__schedule.schedule_idle.=
do_idle
      1.24 =C2=B1 11%      -0.0        1.20 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_in=
terrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      1.70 =C2=B1  2%      -0.0        1.66 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.schedule.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.98 =C2=B1  3%      -0.0        0.94 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_=
page_fault
      0.96 =C2=B1  4%      -0.0        0.92 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_prepare.irqentry_=
exit_to_user_mode.asm_exc_page_fault
      0.96 =C2=B1  4%      -0.0        0.92 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_prepar=
e.irqentry_exit_to_user_mode.asm_exc_page_fault
      1.03 =C2=B1  4%      -0.0        0.99 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.ttwu_do_activate.try_to_wake_up.ptrace_resume.ptrace_request.=
arch_ptrace
      0.99 =C2=B1  5%      -0.0        0.95 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.enqueue_task_fair.ttwu_do_activate.try_to_wake_up.ptrace_resu=
me.ptrace_request
      0.82 =C2=B1  5%      -0.0        0.78 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.schedule.ptrace_stop.ptrace_do_notify.ptrace_notify.syscall_e=
xit_to_user_mode_prepare
      1.59 =C2=B1  2%      -0.0        1.56 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.__schedule.schedule.do_wait.kernel_wait4.__do_sys_wait4
      0.39 =C2=B1 71%      -0.0        0.36 =C2=B1 71%  perf-profile.calltr=
ace.cycles-pp.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_time=
r_interrupt.cpuidle_enter_state.cpuidle_enter
      0.66 =C2=B1  3%      -0.0        0.64 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.kmem_cache_alloc.vm_area_dup.dup_mmap.dup_mm.copy_process
      1.05 =C2=B1  4%      -0.0        1.03 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.vm_area_dup.dup_mmap.dup_mm.copy_process.kernel_clone
      0.59 =C2=B1  3%      -0.0        0.57 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_f=
ault.exc_page_fault
      0.85 =C2=B1  3%      -0.0        0.84 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.dequeue_task_fair.__schedule.schedule.do_wait.kernel_wait4
      0.76 =C2=B1  6%      -0.0        0.74 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_us=
er_mode_prepare.irqentry_exit_to_user_mode
      0.78 =C2=B1 13%      -0.0        0.76 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sys=
vec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.75 =C2=B1  6%      -0.0        0.74 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart.ex=
it_to_user_mode_prepare
      0.70 =C2=B1 13%      -0.0        0.69 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtim=
er_interrupt.__sysvec_apic_timer_interrupt
      0.67 =C2=B1 14%      -0.0        0.66 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrt=
imer_run_queues.hrtimer_interrupt
      0.76 =C2=B1  4%      -0.0        0.75 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.do_wait
      0.76 =C2=B1  6%      -0.0        0.75 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.enqueue_entity.enqueue_task_fair.ttwu_do_activate.try_to_wake=
_up.ptrace_resume
      0.09 =C2=B1223%      -0.0        0.09 =C2=B1223%  perf-profile.calltr=
ace.cycles-pp.__softirqentry_text_start.irq_exit_rcu.sysvec_apic_timer_inte=
rrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.62 =C2=B1  9%      -0.0        0.62 =C2=B1 11%  perf-profile.calltr=
ace.cycles-pp.dup_task_struct.copy_process.kernel_clone.__do_sys_clone.do_s=
yscall_64
      0.27 =C2=B1100%      -0.0        0.27 =C2=B1100%  perf-profile.calltr=
ace.cycles-pp.pte_alloc_one.__pte_alloc.copy_pte_range.copy_page_range.dup_=
mmap
      2.20 =C2=B1  4%      +0.0        2.21 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.ptrace_request.arch_ptrace.__x64_sys_ptrace.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe
      2.20 =C2=B1  4%      +0.0        2.21 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.arch_ptrace.__x64_sys_ptrace.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe
      2.01 =C2=B1  4%      +0.0        2.02 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.try_to_wake_up.ptrace_resume.ptrace_request.arch_ptrace.__x64=
_sys_ptrace
      2.18 =C2=B1  4%      +0.0        2.20 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.ptrace_resume.ptrace_request.arch_ptrace.__x64_sys_ptrace.do_=
syscall_64
      1.93 =C2=B1  8%      +0.0        1.95 =C2=B1 11%  perf-profile.calltr=
ace.cycles-pp.copy_page_range.dup_mmap.dup_mm.copy_process.kernel_clone
      1.51 =C2=B1  9%      +0.0        1.53 =C2=B1 12%  perf-profile.calltr=
ace.cycles-pp.copy_pte_range.copy_page_range.dup_mmap.dup_mm.copy_process
      0.59 =C2=B1  5%      +0.0        0.64 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.kthread.ret_from_fork
      0.61 =C2=B1  9%      +0.0        0.66 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.remove_vma.__do_munmap.__vm_munmap.__x64_sys_munmap.do_syscal=
l_64
      0.96 =C2=B1  2%      +0.1        1.02 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.ret_from_fork
      2.98 =C2=B1  6%      +0.1        3.04 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.unmap_page_range.unmap_vmas.unmap_region.__do_munmap.__vm_mun=
map
      2.72 =C2=B1  7%      +0.1        2.78 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.zap_pte_range.unmap_page_range.unmap_vmas.unmap_region.__do_m=
unmap
      3.57 =C2=B1  2%      +0.1        3.64 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.kernel_wait4.__do_sys_wait4.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe
      3.29            +0.1        3.36 =C2=B1  7%  perf-profile.calltrace.c=
ycles-pp.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64.entry_SYSCALL_64=
_after_hwframe
      3.07 =C2=B1  6%      +0.1        3.15 =C2=B1  8%  perf-profile.calltr=
ace.cycles-pp.unmap_vmas.unmap_region.__do_munmap.__vm_munmap.__x64_sys_mun=
map
      3.61 =C2=B1  2%      +0.1        3.69 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.__do_sys_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.96 =C2=B1  4%      +0.1        3.04 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.__x64_sys_ptrace.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.1        0.08 =C2=B1223%  perf-profile.calltrace.c=
ycles-pp.__vmalloc_node_range.dup_task_struct.copy_process.kernel_clone.__d=
o_sys_clone
      0.81 =C2=B1  4%      +0.1        0.89 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.release_pages.tlb_flush_mmu.tlb_finish_mmu.unmap_region.__do_=
munmap
      0.00            +0.1        0.09 =C2=B1223%  perf-profile.calltrace.c=
ycles-pp.link_path_walk.path_openat.do_filp_open.do_sys_openat2.do_sys_open
      0.00            +0.1        0.09 =C2=B1223%  perf-profile.calltrace.c=
ycles-pp.anon_vma_interval_tree_remove.unlink_anon_vmas.free_pgtables.unmap=
_region.__do_munmap
      5.38 =C2=B1  4%      +0.1        5.49 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.asm_exc_page_fault
      0.94 =C2=B1 40%      +0.1        1.05 =C2=B1 37%  perf-profile.calltr=
ace.cycles-pp.do_idle.cpu_startup_entry.start_kernel.secondary_startup_64_n=
o_verify
      0.94 =C2=B1 40%      +0.1        1.05 =C2=B1 37%  perf-profile.calltr=
ace.cycles-pp.cpu_startup_entry.start_kernel.secondary_startup_64_no_verify
      0.94 =C2=B1 40%      +0.1        1.05 =C2=B1 37%  perf-profile.calltr=
ace.cycles-pp.start_kernel.secondary_startup_64_no_verify
      0.63 =C2=B1  4%      +0.1        0.76 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.kmem_cache_free.unlink_anon_vmas.free_pgtables.unmap_region._=
_do_munmap
      1.15 =C2=B1  3%      +0.1        1.30 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.tlb_finish_mmu.unmap_region.__do_munmap.__vm_munmap.__x64_sys=
_munmap
      1.13 =C2=B1  3%      +0.2        1.28 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.tlb_flush_mmu.tlb_finish_mmu.unmap_region.__do_munmap.__vm_mu=
nmap
      3.44 =C2=B1  4%      +0.2        3.60 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_pag=
e_fault
      3.30 =C2=B1  4%      +0.2        3.46 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page=
_fault.asm_exc_page_fault
      2.48 =C2=B1  5%      +0.2        2.65 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault=
.exc_page_fault
      4.03 =C2=B1  4%      +0.2        4.20 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.exc_page_fault.asm_exc_page_fault
      0.00            +0.2        0.17 =C2=B1141%  perf-profile.calltrace.c=
ycles-pp.ptrace_check_attach.__x64_sys_ptrace.do_syscall_64.entry_SYSCALL_6=
4_after_hwframe
      2.36 =C2=B1  5%      +0.2        2.53 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.filemap_map_pages.do_fault.__handle_mm_fault.handle_mm_fault.=
do_user_addr_fault
      3.96 =C2=B1  4%      +0.2        4.14 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00            +0.2        0.19 =C2=B1141%  perf-profile.calltrace.c=
ycles-pp.kmem_cache_alloc.anon_vma_clone.anon_vma_fork.dup_mmap.dup_mm
      0.26 =C2=B1100%      +0.2        0.46 =C2=B1 45%  perf-profile.calltr=
ace.cycles-pp.worker_thread.kthread.ret_from_fork
      1.09 =C2=B1  4%      +0.2        1.31 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.next_uptodate_page.filemap_map_pages.do_fault.__handle_mm_fau=
lt.handle_mm_fault
      0.00            +0.3        0.26 =C2=B1100%  perf-profile.calltrace.c=
ycles-pp.process_one_work.worker_thread.kthread.ret_from_fork
      0.00            +0.3        0.28 =C2=B1100%  perf-profile.calltrace.c=
ycles-pp.anon_vma_interval_tree_insert.anon_vma_clone.anon_vma_fork.dup_mma=
p.dup_mm
      0.67 =C2=B1 78%      +0.3        0.96 =C2=B1 39%  perf-profile.calltr=
ace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_kernel.secondar=
y_startup_64_no_verify
      0.67 =C2=B1 79%      +0.3        0.96 =C2=B1 39%  perf-profile.calltr=
ace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.s=
tart_kernel
      1.20 =C2=B1  3%      +0.4        1.55 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.anon_vma_clone.anon_vma_fork.dup_mmap.dup_mm.copy_process
      1.83 =C2=B1  3%      +0.4        2.21 =C2=B1  7%  perf-profile.calltr=
ace.cycles-pp.anon_vma_fork.dup_mmap.dup_mm.copy_process.kernel_clone
      1.52 =C2=B1  3%      +0.4        1.91 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.unlink_anon_vmas.free_pgtables.unmap_region.__do_munmap.__vm_=
munmap
      7.61 =C2=B1  4%      +0.4        8.01 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe
      7.60 =C2=B1  4%      +0.4        8.01 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe
      7.23 =C2=B1  4%      +0.4        7.67 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.copy_process.kernel_clone.__do_sys_clone.do_syscall_64.entry_=
SYSCALL_64_after_hwframe
      5.97 =C2=B1  4%      +0.5        6.42 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.dup_mm.copy_process.kernel_clone.__do_sys_clone.do_syscall_64
      5.80 =C2=B1  4%      +0.5        6.27 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.dup_mmap.dup_mm.copy_process.kernel_clone.__do_sys_clone
      0.09 =C2=B1223%      +0.6        0.67 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.unlink_file_vma.free_pgtables.unmap_region.__do_munmap.__vm_m=
unmap
      2.25 =C2=B1  4%      +0.6        2.85 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.free_pgtables.unmap_region.__do_munmap.__vm_munmap.__x64_sys_=
munmap
      7.91            +0.7        8.64 =C2=B1  7%  perf-profile.calltrace.c=
ycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_en=
try
      6.58 =C2=B1  4%      +0.8        7.39 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.unmap_region.__do_munmap.__vm_munmap.__x64_sys_munmap.do_sysc=
all_64
      7.57 =C2=B1  4%      +1.0        8.55 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.__do_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_=
SYSCALL_64_after_hwframe
      7.64 =C2=B1  4%      +1.0        8.63 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe
      7.63 =C2=B1  4%      +1.0        8.62 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe
     31.20 =C2=B1  2%      +1.1       32.34 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.entry_SYSCALL_64_after_hwframe
     26.38 =C2=B1  2%      +1.4       27.73 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
     57.63            -1.1       56.57 =C2=B1  2%  perf-profile.children.cy=
cles-pp.start_secondary
     58.53            -1.0       57.58        perf-profile.children.cycles-=
pp.do_idle
     58.57            -0.9       57.62        perf-profile.children.cycles-=
pp.secondary_startup_64_no_verify
     58.57            -0.9       57.62        perf-profile.children.cycles-=
pp.cpu_startup_entry
     39.33 =C2=B1  2%      -0.9       38.39 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.intel_idle
     51.50            -0.5       51.00        perf-profile.children.cycles-=
pp.cpuidle_enter
     51.47            -0.5       50.97        perf-profile.children.cycles-=
pp.cpuidle_enter_state
      6.69            -0.4        6.33 =C2=B1  2%  perf-profile.children.cy=
cles-pp.__schedule
      3.33 =C2=B1  2%      -0.2        3.10 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.schedule_idle
      3.09 =C2=B1  3%      -0.2        2.86 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.do_notify_parent_cldstop
      5.76 =C2=B1  3%      -0.2        5.54 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.ptrace_stop
      4.69 =C2=B1  2%      -0.2        4.48 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.syscall_exit_to_user_mode
      5.55 =C2=B1  3%      -0.2        5.35 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.ptrace_notify
      5.50 =C2=B1  3%      -0.2        5.30 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.ptrace_do_notify
      0.90 =C2=B1  6%      -0.2        0.71 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.__entry_text_start
      2.83 =C2=B1  4%      -0.2        2.65 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.__wake_up_common_lock
      2.71 =C2=B1  3%      -0.2        2.54 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.__wake_up_common
      1.91 =C2=B1  4%      -0.1        1.77 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.menu_select
      3.53 =C2=B1  2%      -0.1        3.39 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.schedule
      4.54 =C2=B1  2%      -0.1        4.41 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.try_to_wake_up
      2.83 =C2=B1  4%      -0.1        2.71 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.syscall_exit_to_user_mode_prepare
      1.65 =C2=B1  2%      -0.1        1.53 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.update_load_avg
      1.06 =C2=B1  5%      -0.1        0.95 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.do_sys_openat2
      3.25 =C2=B1  9%      -0.1        3.13 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.sysvec_apic_timer_interrupt
      1.07 =C2=B1  5%      -0.1        0.95 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.do_sys_open
      3.46 =C2=B1  9%      -0.1        3.35 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.77 =C2=B1 13%      -0.1        0.66 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.page_remove_rmap
      2.18 =C2=B1  3%      -0.1        2.08 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.ttwu_do_activate
      0.96 =C2=B1  5%      -0.1        0.86 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.do_filp_open
      0.95 =C2=B1  5%      -0.1        0.85 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.path_openat
      2.15 =C2=B1  3%      -0.1        2.06 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.enqueue_task_fair
      2.09 =C2=B1  9%      -0.1        2.00 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.__sysvec_apic_timer_interrupt
      2.76 =C2=B1  3%      -0.1        2.68 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.syscall_trace_enter
      2.00 =C2=B1  9%      -0.1        1.92 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.hrtimer_interrupt
      1.62 =C2=B1  3%      -0.1        1.55 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.pick_next_task_fair
      1.15 =C2=B1  5%      -0.1        1.08 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.__alloc_pages_nodemask
      1.55            -0.1        1.48 =C2=B1  4%  perf-profile.children.cy=
cles-pp.exit_to_user_mode_prepare
      1.38 =C2=B1  3%      -0.1        1.31 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.irqentry_exit_to_user_mode
      0.80 =C2=B1  6%      -0.1        0.73 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.get_page_from_freelist
      1.29 =C2=B1  2%      -0.1        1.22 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.arch_do_signal_or_restart
      1.76 =C2=B1  2%      -0.1        1.71 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.dequeue_task_fair
      1.28 =C2=B1  2%      -0.1        1.22 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.get_signal
      0.82 =C2=B1  5%      -0.1        0.77 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.syscall_return_via_sysret
      1.02 =C2=B1  5%      -0.1        0.97 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.set_next_entity
      1.72 =C2=B1  4%      -0.0        1.67 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.enqueue_entity
      0.47 =C2=B1 11%      -0.0        0.42 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.tick_nohz_get_sleep_length
      1.57 =C2=B1  3%      -0.0        1.53 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.dequeue_entity
      0.37 =C2=B1  8%      -0.0        0.33 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.page_add_file_rmap
      0.18 =C2=B1  6%      -0.0        0.13 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.proc_pid_make_inode
      0.53 =C2=B1  8%      -0.0        0.48 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.do_set_pte
      0.30 =C2=B1 14%      -0.0        0.26 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.tick_nohz_next_event
      1.46 =C2=B1 11%      -0.0        1.42 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.__hrtimer_run_queues
      0.15 =C2=B1  6%      -0.0        0.11 =C2=B1 19%  perf-profile.childr=
en.cycles-pp.new_inode
      0.15 =C2=B1  4%      -0.0        0.11 =C2=B1 18%  perf-profile.childr=
en.cycles-pp.new_inode_pseudo
      0.16 =C2=B1 18%      -0.0        0.12 =C2=B1 17%  perf-profile.childr=
en.cycles-pp.try_charge
      0.17 =C2=B1 18%      -0.0        0.13 =C2=B1  9%  perf-profile.childr=
en.cycles-pp._raw_spin_unlock_irqrestore
      0.52 =C2=B1 10%      -0.0        0.48 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.prep_new_page
      0.57 =C2=B1  7%      -0.0        0.53 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.ktime_get
      0.47 =C2=B1  7%      -0.0        0.43 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.__update_load_avg_se
      0.45 =C2=B1  8%      -0.0        0.41 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.finish_task_switch
      0.36 =C2=B1  7%      -0.0        0.32 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.___perf_sw_event
      0.06 =C2=B1 15%      -0.0        0.02 =C2=B1144%  perf-profile.childr=
en.cycles-pp.__update_idle_core
      0.19 =C2=B1 38%      -0.0        0.16 =C2=B1 50%  perf-profile.childr=
en.cycles-pp.vm_normal_page
      0.04 =C2=B1 45%      -0.0        0.01 =C2=B1223%  perf-profile.childr=
en.cycles-pp.unfreeze_partials
      1.83 =C2=B1  3%      -0.0        1.79 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.kmem_cache_alloc
      0.74 =C2=B1  2%      -0.0        0.71 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.select_task_rq_fair
      0.15 =C2=B1  8%      -0.0        0.12 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.proc_pident_lookup
      0.49 =C2=B1  3%      -0.0        0.45 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.__update_load_avg_cfs_rq
      0.50 =C2=B1 10%      -0.0        0.46 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.clear_page_erms
      0.11 =C2=B1  9%      -0.0        0.08 =C2=B1 20%  perf-profile.childr=
en.cycles-pp.alloc_inode
      0.03 =C2=B1101%      -0.0        0.00        perf-profile.children.cy=
cles-pp.tracing_gen_ctx_irq_test
      0.53 =C2=B1  3%      -0.0        0.50 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.__switch_to
      0.05 =C2=B1 45%      -0.0        0.02 =C2=B1141%  perf-profile.childr=
en.cycles-pp.native_flush_tlb_one_user
      0.04 =C2=B1 45%      -0.0        0.02 =C2=B1141%  perf-profile.childr=
en.cycles-pp.put_cpu_partial
      0.22 =C2=B1 12%      -0.0        0.19 =C2=B1 22%  perf-profile.childr=
en.cycles-pp.tick_irq_enter
      0.11 =C2=B1  8%      -0.0        0.08 =C2=B1 20%  perf-profile.childr=
en.cycles-pp.proc_pident_instantiate
      0.05 =C2=B1 45%      -0.0        0.02 =C2=B1142%  perf-profile.childr=
en.cycles-pp.tick_nohz_irq_exit
      0.04 =C2=B1 71%      -0.0        0.01 =C2=B1223%  perf-profile.childr=
en.cycles-pp.sprintf
      0.07 =C2=B1 16%      -0.0        0.04 =C2=B1 76%  perf-profile.childr=
en.cycles-pp.set_next_task_idle
      0.23 =C2=B1 10%      -0.0        0.21 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.clockevents_program_event
      0.22 =C2=B1 11%      -0.0        0.20 =C2=B1 21%  perf-profile.childr=
en.cycles-pp.irq_enter_rcu
      0.13 =C2=B1 20%      -0.0        0.11 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.__remove_hrtimer
      0.32 =C2=B1  9%      -0.0        0.29 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.__memcg_kmem_charge
      0.23 =C2=B1 18%      -0.0        0.20 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.__get_free_pages
      0.13 =C2=B1 14%      -0.0        0.10 =C2=B1 18%  perf-profile.childr=
en.cycles-pp.proc_pid_lookup
      0.05 =C2=B1 45%      -0.0        0.03 =C2=B1102%  perf-profile.childr=
en.cycles-pp.tick_check_broadcast_expired
      0.07 =C2=B1 26%      -0.0        0.04 =C2=B1 72%  perf-profile.childr=
en.cycles-pp.sched_fork
      0.06 =C2=B1  6%      -0.0        0.03 =C2=B1 70%  perf-profile.childr=
en.cycles-pp.proc_alloc_inode
      0.45 =C2=B1  8%      -0.0        0.43 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.link_path_walk
      0.33 =C2=B1  8%      -0.0        0.31 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.switch_mm_irqs_off
      0.23 =C2=B1 11%      -0.0        0.21 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.pick_next_entity
      0.18 =C2=B1 10%      -0.0        0.15 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.remove_wait_queue
      0.06 =C2=B1  6%      -0.0        0.04 =C2=B1 71%  perf-profile.childr=
en.cycles-pp.send_signal
      0.10 =C2=B1  7%      -0.0        0.07 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.copy_fpregs_to_fpstate
      0.17 =C2=B1  7%      -0.0        0.15 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.__mod_memcg_state
      0.37 =C2=B1  7%      -0.0        0.35 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.___slab_alloc
      0.40 =C2=B1  5%      -0.0        0.37 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.__switch_to_asm
      0.13 =C2=B1 14%      -0.0        0.11 =C2=B1 18%  perf-profile.childr=
en.cycles-pp.proc_root_lookup
      0.10 =C2=B1  9%      -0.0        0.08 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.rb_erase
      0.10 =C2=B1 13%      -0.0        0.08 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.alloc_empty_file
      0.09 =C2=B1 11%      -0.0        0.07 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.__alloc_file
      0.03 =C2=B1100%      -0.0        0.01 =C2=B1223%  perf-profile.childr=
en.cycles-pp.inode_init_always
      0.05 =C2=B1 47%      -0.0        0.03 =C2=B1 99%  perf-profile.childr=
en.cycles-pp.__d_alloc
      0.07 =C2=B1 11%      -0.0        0.05 =C2=B1 45%  perf-profile.childr=
en.cycles-pp.proc_self_get_link
      0.10 =C2=B1 12%      -0.0        0.08 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.__dentry_kill
      1.05 =C2=B1  4%      -0.0        1.03 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.vm_area_dup
      0.38 =C2=B1  7%      -0.0        0.35 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.__slab_alloc
      0.33 =C2=B1  8%      -0.0        0.31 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.unlock_page
      0.15 =C2=B1 11%      -0.0        0.13 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.d_invalidate
      0.14 =C2=B1 10%      -0.0        0.12 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.shrink_dcache_parent
      0.07 =C2=B1  8%      -0.0        0.05 =C2=B1 46%  perf-profile.childr=
en.cycles-pp.group_send_sig_info
      0.04 =C2=B1 72%      -0.0        0.02 =C2=B1142%  perf-profile.childr=
en.cycles-pp.cgroup_post_fork
      0.02 =C2=B1144%      -0.0        0.00        perf-profile.children.cy=
cles-pp.__unlock_page_memcg
      0.04 =C2=B1 45%      -0.0        0.03 =C2=B1 99%  perf-profile.childr=
en.cycles-pp.sync_mm_rss
      0.23 =C2=B1  4%      -0.0        0.21 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.rmqueue
      0.42 =C2=B1  8%      -0.0        0.40 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.resched_curr
      0.31 =C2=B1  7%      -0.0        0.29 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.allocate_slab
      0.15 =C2=B1  8%      -0.0        0.13 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.perf_iterate_sb
      0.16 =C2=B1  9%      -0.0        0.14 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.menu_reflect
      0.10 =C2=B1 23%      -0.0        0.08 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.timerqueue_del
      0.16 =C2=B1  8%      -0.0        0.14 =C2=B1 17%  perf-profile.childr=
en.cycles-pp.perf_event_task
      0.12 =C2=B1 11%      -0.0        0.10 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.step_into
      0.04 =C2=B1 71%      -0.0        0.02 =C2=B1141%  perf-profile.childr=
en.cycles-pp.d_splice_alias
      0.06 =C2=B1 46%      -0.0        0.05 =C2=B1 45%  perf-profile.childr=
en.cycles-pp.rcu_needs_cpu
      0.07 =C2=B1 11%      -0.0        0.05 =C2=B1 72%  perf-profile.childr=
en.cycles-pp.timerqueue_add
      0.03 =C2=B1100%      -0.0        0.01 =C2=B1223%  perf-profile.childr=
en.cycles-pp.vsnprintf
      0.04 =C2=B1 71%      -0.0        0.02 =C2=B1141%  perf-profile.childr=
en.cycles-pp.__get_user_8
      0.11 =C2=B1  6%      -0.0        0.09 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.perf_event_task_output
      0.04 =C2=B1 71%      -0.0        0.02 =C2=B1142%  perf-profile.childr=
en.cycles-pp.evict
      0.59 =C2=B1  8%      -0.0        0.57 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.pte_alloc_one
      0.40 =C2=B1  8%      -0.0        0.38 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.walk_component
      0.35 =C2=B1  4%      -0.0        0.33 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.wake_up_new_task
      0.09 =C2=B1 14%      -0.0        0.08 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.pick_link
      0.73 =C2=B1  3%      -0.0        0.71 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.wp_page_copy
      0.54 =C2=B1  5%      -0.0        0.52 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.__pte_alloc
      0.13 =C2=B1 22%      -0.0        0.11 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.mm_init
      0.12 =C2=B1 24%      -0.0        0.10 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.pgd_alloc
      0.08 =C2=B1 15%      -0.0        0.06 =C2=B1 17%  perf-profile.childr=
en.cycles-pp.proc_pid_instantiate
      0.03 =C2=B1 99%      -0.0        0.01 =C2=B1223%  perf-profile.childr=
en.cycles-pp.security_task_kill
      0.04 =C2=B1 45%      -0.0        0.03 =C2=B1100%  perf-profile.childr=
en.cycles-pp.__mod_lruvec_page_state
      0.02 =C2=B1141%      -0.0        0.00        perf-profile.children.cy=
cles-pp.__d_lookup_rcu
      0.34 =C2=B1  6%      -0.0        0.32 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.__mod_memcg_lruvec_state
      0.24 =C2=B1  7%      -0.0        0.23 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.perf_tp_event
      0.05 =C2=B1 99%      -0.0        0.04 =C2=B1 71%  perf-profile.childr=
en.cycles-pp.PageHuge
      0.04 =C2=B1 45%      -0.0        0.03 =C2=B1100%  perf-profile.childr=
en.cycles-pp.put_files_struct
      0.11 =C2=B1 16%      -0.0        0.10 =C2=B1 18%  perf-profile.childr=
en.cycles-pp.__pagevec_lru_add
      0.09 =C2=B1 14%      -0.0        0.07 =C2=B1 18%  perf-profile.childr=
en.cycles-pp.exit_mm_release
      0.05 =C2=B1 91%      -0.0        0.04 =C2=B1 73%  perf-profile.childr=
en.cycles-pp.getname_flags
      0.10 =C2=B1 14%      -0.0        0.09 =C2=B1 15%  perf-profile.childr=
en.cycles-pp.shrink_dentry_list
      0.19 =C2=B1 20%      -0.0        0.18 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.rebalance_domains
      0.31 =C2=B1 11%      -0.0        0.30 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.wait_for_xmitr
      0.28 =C2=B1 10%      -0.0        0.27 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.__memcg_kmem_charge_page
      0.14 =C2=B1 22%      -0.0        0.13 =C2=B1 18%  perf-profile.childr=
en.cycles-pp.rcu_sched_clock_irq
      0.10 =C2=B1 15%      -0.0        0.08 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.lru_add_drain
      0.21 =C2=B1 11%      -0.0        0.19 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.proc_invalidate_siblings_dcache
      0.15 =C2=B1 12%      -0.0        0.13 =C2=B1 19%  perf-profile.childr=
en.cycles-pp.free_unref_page_list
      0.08 =C2=B1 10%      -0.0        0.07 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.tick_nohz_tick_stopped
      0.09 =C2=B1 15%      -0.0        0.08 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.lru_add_drain_cpu
      0.03 =C2=B1102%      -0.0        0.02 =C2=B1142%  perf-profile.childr=
en.cycles-pp._raw_spin_trylock
      0.03 =C2=B1101%      -0.0        0.02 =C2=B1141%  perf-profile.childr=
en.cycles-pp.native_apic_mem_write
      0.08 =C2=B1 13%      -0.0        0.07 =C2=B1 15%  perf-profile.childr=
en.cycles-pp.futex_exit_release
      0.09 =C2=B1 18%      -0.0        0.08 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.call_cpuidle
      0.92 =C2=B1 12%      -0.0        0.90 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.tick_sched_timer
      0.18 =C2=B1 14%      -0.0        0.17 =C2=B1 25%  perf-profile.childr=
en.cycles-pp.__lookup_slow
      0.07 =C2=B1 19%      -0.0        0.06 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.perf_trace_buf_update
      0.11 =C2=B1 19%      -0.0        0.10 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.free_pcppages_bulk
      0.09 =C2=B1 14%      -0.0        0.08 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.__hrtimer_next_event_base
      0.08 =C2=B1 16%      -0.0        0.07 =C2=B1 52%  perf-profile.childr=
en.cycles-pp.enqueue_hrtimer
      0.02 =C2=B1223%      -0.0        0.01 =C2=B1223%  perf-profile.childr=
en.cycles-pp.strncpy_from_user
      0.06 =C2=B1 45%      -0.0        0.04 =C2=B1 45%  perf-profile.childr=
en.cycles-pp.filp_close
      0.23 =C2=B1  4%      -0.0        0.22 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.find_idlest_group
      0.10 =C2=B1  7%      -0.0        0.09 =C2=B1 29%  perf-profile.childr=
en.cycles-pp.memcpy_erms
      0.07 =C2=B1 12%      -0.0        0.06 =C2=B1 19%  perf-profile.childr=
en.cycles-pp.perf_event_fork
      0.09 =C2=B1  9%      -0.0        0.08 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.__rdgsbase_inactive
      0.09 =C2=B1 11%      -0.0        0.08 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.__tlb_remove_page_size
      0.78 =C2=B1  5%      -0.0        0.77 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.do_exit
      0.23 =C2=B1  6%      -0.0        0.22 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.kill_pid_info
      0.13 =C2=B1  9%      -0.0        0.12 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.__pmd_alloc
      0.47 =C2=B1  4%      -0.0        0.46 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.ttwu_do_wakeup
      0.32 =C2=B1 11%      -0.0        0.30 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.serial8250_console_write
      0.31 =C2=B1 11%      -0.0        0.30 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.uart_console_write
      0.31 =C2=B1 11%      -0.0        0.30 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.serial8250_console_putchar
      0.21 =C2=B1 12%      -0.0        0.20 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.rcu_read_unlock_strict
      0.14 =C2=B1  9%      -0.0        0.13 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.lock_page_memcg
      0.03 =C2=B1100%      -0.0        0.02 =C2=B1141%  perf-profile.childr=
en.cycles-pp.page_add_new_anon_rmap
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cy=
cles-pp.vma_dup_policy
      0.02 =C2=B1142%      -0.0        0.01 =C2=B1223%  perf-profile.childr=
en.cycles-pp.mem_cgroup_from_task
      0.02 =C2=B1142%      -0.0        0.01 =C2=B1223%  perf-profile.childr=
en.cycles-pp.alloc_pages_current
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cy=
cles-pp.asm_sysvec_call_function_single
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cy=
cles-pp.sysvec_call_function_single
      0.05 =C2=B1 45%      -0.0        0.04 =C2=B1 71%  perf-profile.childr=
en.cycles-pp.__free_pages_ok
      0.26 =C2=B1  6%      -0.0        0.25 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.__x64_sys_kill
      0.16 =C2=B1  4%      -0.0        0.15 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.child_wait_callback
      0.94 =C2=B1  6%      -0.0        0.94 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.update_rq_clock
      0.78 =C2=B1  5%      -0.0        0.77 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.do_group_exit
      0.46 =C2=B1  5%      -0.0        0.46 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.check_preempt_curr
      0.36 =C2=B1  6%      -0.0        0.35 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.native_irq_return_iret
      0.24 =C2=B1  6%      -0.0        0.23 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.__task_pid_nr_ns
      0.07 =C2=B1 18%      -0.0        0.06 =C2=B1 17%  perf-profile.childr=
en.cycles-pp.get_next_timer_interrupt
      0.07 =C2=B1 11%      -0.0        0.06 =C2=B1 17%  perf-profile.childr=
en.cycles-pp.futex_cleanup
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cy=
cles-pp.idle_cpu
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cy=
cles-pp.apparmor_task_kill
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cy=
cles-pp.d_walk
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cy=
cles-pp.asm_common_interrupt
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cy=
cles-pp.common_interrupt
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cy=
cles-pp.setup_object_debug
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cy=
cles-pp.get_random_u32
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cy=
cles-pp.__napi_poll
      0.02 =C2=B1141%      -0.0        0.01 =C2=B1223%  perf-profile.childr=
en.cycles-pp.do_task_dead
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cy=
cles-pp.net_rx_action
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cy=
cles-pp.igb_poll
      0.02 =C2=B1141%      -0.0        0.01 =C2=B1223%  perf-profile.childr=
en.cycles-pp.cpumask_any_but
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cy=
cles-pp.execve
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cy=
cles-pp.__x64_sys_execve
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cy=
cles-pp.do_execveat_common
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cy=
cles-pp.__sysvec_call_function_single
      0.02 =C2=B1141%      -0.0        0.01 =C2=B1223%  perf-profile.childr=
en.cycles-pp.do_wp_page
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cy=
cles-pp.inode_permission
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cy=
cles-pp.from_kuid_munged
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cy=
cles-pp.free_unref_page
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cy=
cles-pp.force_sig_fault
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cy=
cles-pp.force_sig_info_to_task
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.cy=
cles-pp.cpuidle_get_cpu_driver
      0.24 =C2=B1  7%      -0.0        0.24 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.kill_something_info
      0.24 =C2=B1  8%      -0.0        0.23 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.__x86_retpoline_rax
      0.15 =C2=B1 11%      -0.0        0.14 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.rcu_eqs_exit
      0.13 =C2=B1  9%      -0.0        0.12 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.available_idle_cpu
      0.08 =C2=B1 13%      -0.0        0.07 =C2=B1 18%  perf-profile.childr=
en.cycles-pp.pick_next_task_idle
      0.06 =C2=B1 11%      -0.0        0.05 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.hrtimer_next_event_without
      0.05 =C2=B1 45%      -0.0        0.04 =C2=B1 72%  perf-profile.childr=
en.cycles-pp.__hrtimer_get_next_event
      0.11 =C2=B1 13%      -0.0        0.11 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.lapic_next_deadline
      0.19 =C2=B1  7%      -0.0        0.19 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.copy_page
      0.63 =C2=B1  9%      -0.0        0.62 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.dup_task_struct
      0.27 =C2=B1  6%      -0.0        0.27 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.obj_cgroup_charge
      0.25 =C2=B1  5%      -0.0        0.25 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.__put_user_nocheck_4
      0.24 =C2=B1 10%      -0.0        0.23 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.__irqentry_text_end
      0.07 =C2=B1 12%      -0.0        0.07 =C2=B1 18%  perf-profile.childr=
en.cycles-pp.__bad_area_nosemaphore
      0.12 =C2=B1 10%      -0.0        0.11 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.cpus_share_cache
      0.08 =C2=B1 11%      -0.0        0.07 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.kmem_cache_alloc_node
      0.07 =C2=B1 11%      -0.0        0.06 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.arch_dup_task_struct
      0.06 =C2=B1 11%      -0.0        0.06 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.perf_trace_sched_switch
      0.07 =C2=B1 20%      -0.0        0.07 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.rmqueue_bulk
      0.04 =C2=B1 71%      -0.0        0.04 =C2=B1 71%  perf-profile.childr=
en.cycles-pp.rcu_dynticks_eqs_exit
      0.04 =C2=B1 45%      -0.0        0.04 =C2=B1 72%  perf-profile.childr=
en.cycles-pp.can_stop_idle_tick
      0.14 =C2=B1 14%      -0.0        0.14 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.load_balance
      0.17 =C2=B1 10%      -0.0        0.16 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.__cond_resched
      0.25 =C2=B1  8%      -0.0        0.24 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.rcu_idle_exit
      0.16 =C2=B1  8%      -0.0        0.15 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.alloc_pages_vma
      0.08 =C2=B1  8%      -0.0        0.07 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.cpuidle_not_available
      0.05 =C2=B1 46%      -0.0        0.04 =C2=B1 45%  perf-profile.childr=
en.cycles-pp.__queue_work
      0.06 =C2=B1  8%      -0.0        0.05 =C2=B1 52%  perf-profile.childr=
en.cycles-pp.mem_cgroup_uncharge_list
      0.11 =C2=B1  7%      -0.0        0.10 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.put_task_stack
      0.09 =C2=B1 21%      -0.0        0.08 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.flush_tlb_func_common
      0.12 =C2=B1 10%      -0.0        0.11 =C2=B1 18%  perf-profile.childr=
en.cycles-pp.update_irq_load_avg
      0.18 =C2=B1 17%      -0.0        0.18 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.flush_tlb_mm_range
      0.72 =C2=B1  3%      -0.0        0.72 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.update_curr
      0.32 =C2=B1 11%      -0.0        0.32 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.asm_sysvec_irq_work
      0.32 =C2=B1 11%      -0.0        0.32 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.sysvec_irq_work
      0.32 =C2=B1 11%      -0.0        0.32 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.__sysvec_irq_work
      0.32 =C2=B1 11%      -0.0        0.32 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.irq_work_run
      0.32 =C2=B1 11%      -0.0        0.32 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.irq_work_single
      0.32 =C2=B1 11%      -0.0        0.32 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.printk
      0.32 =C2=B1 11%      -0.0        0.32 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.vprintk_emit
      0.32 =C2=B1 11%      -0.0        0.32 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.console_unlock
      0.33 =C2=B1 11%      -0.0        0.33 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.irq_work_run_list
      0.06 =C2=B1 19%      -0.0        0.06 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.ptrace_traceme
      0.06 =C2=B1 11%      -0.0        0.06 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.dup_fd
      0.23 =C2=B1  8%      -0.0        0.23 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.reweight_entity
      0.16 =C2=B1  6%      -0.0        0.16 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.__perf_sw_event
      0.14 =C2=B1  8%      -0.0        0.14 =C2=B1 15%  perf-profile.childr=
en.cycles-pp.__wrgsbase_inactive
      0.14 =C2=B1  7%      -0.0        0.14 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.ttwu_queue_wakelist
      0.07 =C2=B1 18%      -0.0        0.07 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.vmacache_find
      0.06 =C2=B1 11%      -0.0        0.06 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.__might_fault
      0.82 =C2=B1 12%      -0.0        0.82 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.tick_sched_handle
      0.28 =C2=B1  6%      -0.0        0.28 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.get_obj_cgroup_from_current
      0.47 =C2=B1 18%      -0.0        0.47 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.scheduler_tick
      0.35 =C2=B1  5%      -0.0        0.35 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.schedule_tail
      0.24 =C2=B1  6%      -0.0        0.24 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.__put_anon_vma
      0.21 =C2=B1  8%      -0.0        0.21 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.find_get_task_by_vpid
      0.10 =C2=B1 18%      -0.0        0.10 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.find_busiest_group
      0.09 =C2=B1 11%      -0.0        0.08 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.task_work_run
      0.05 =C2=B1 46%      -0.0        0.05 =C2=B1 48%  perf-profile.childr=
en.cycles-pp.irqentry_enter
      0.02 =C2=B1142%      -0.0        0.02 =C2=B1141%  perf-profile.childr=
en.cycles-pp.unlock_page_memcg
      0.02 =C2=B1144%      -0.0        0.02 =C2=B1142%  perf-profile.childr=
en.cycles-pp.__memcg_kmem_uncharge_page
      0.01 =C2=B1223%      -0.0        0.01 =C2=B1223%  perf-profile.childr=
en.cycles-pp.lru_cache_add
      0.08 =C2=B1 23%      -0.0        0.08 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.arch_scale_freq_tick
      0.10 =C2=B1 22%      -0.0        0.10 =C2=B1 22%  perf-profile.childr=
en.cycles-pp.xas_find
      0.09 =C2=B1 11%      -0.0        0.09 =C2=B1 47%  perf-profile.childr=
en.cycles-pp.d_alloc
      0.79 =C2=B1 13%      -0.0        0.79 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.update_process_times
      0.35 =C2=B1  5%      -0.0        0.35 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.read_tsc
      0.16 =C2=B1  8%      -0.0        0.15 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.do_send_sig_info
      0.09 =C2=B1 21%      -0.0        0.09 =C2=B1 24%  perf-profile.childr=
en.cycles-pp.ktime_get_update_offsets_now
      0.12 =C2=B1 12%      -0.0        0.12 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.__calc_delta
      0.11 =C2=B1 10%      +0.0        0.11 =C2=B1 36%  perf-profile.childr=
en.cycles-pp.d_alloc_parallel
      0.07 =C2=B1 27%      +0.0        0.07 =C2=B1 18%  perf-profile.childr=
en.cycles-pp.xas_load
      0.05 =C2=B1 46%      +0.0        0.05 =C2=B1 46%  perf-profile.childr=
en.cycles-pp.sync_regs
      0.02 =C2=B1141%      +0.0        0.02 =C2=B1141%  perf-profile.childr=
en.cycles-pp.__mod_node_page_state
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%  perf-profile.childr=
en.cycles-pp.rcu_nocb_flush_deferred_wakeup
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%  perf-profile.childr=
en.cycles-pp.security_vm_enough_memory_mm
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%  perf-profile.childr=
en.cycles-pp.irqentry_exit
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%  perf-profile.childr=
en.cycles-pp.kfree
      0.10 =C2=B1 14%      +0.0        0.10 =C2=B1 19%  perf-profile.childr=
en.cycles-pp.irqtime_account_irq
      0.09 =C2=B1 15%      +0.0        0.09 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.__x86_indirect_thunk_rax
      0.29 =C2=B1 10%      +0.0        0.29 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.wait_task_inactive
      0.11 =C2=B1 21%      +0.0        0.11 =C2=B1 18%  perf-profile.childr=
en.cycles-pp.lookup_fast
      0.10 =C2=B1  9%      +0.0        0.10 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.sched_move_task
      0.07 =C2=B1 10%      +0.0        0.08 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.exit_mmap
      0.07 =C2=B1 15%      +0.0        0.08 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.put_pid
      0.06 =C2=B1  9%      +0.0        0.06 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.oom_score_adj_write
      0.03 =C2=B1 99%      +0.0        0.03 =C2=B1100%  perf-profile.childr=
en.cycles-pp.__vma_link_rb
      0.03 =C2=B1100%      +0.0        0.03 =C2=B1101%  perf-profile.childr=
en.cycles-pp.run_ksoftirqd
      0.05 =C2=B1 46%      +0.0        0.05 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.queue_work_on
      0.14 =C2=B1  4%      +0.0        0.14 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.ksys_write
      0.13 =C2=B1  7%      +0.0        0.13 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.vfs_write
      0.09 =C2=B1 13%      +0.0        0.10 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.rb_next
      0.07 =C2=B1 12%      +0.0        0.08 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.mem_cgroup_charge
      0.36 =C2=B1  3%      +0.0        0.36 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.___might_sleep
      0.30 =C2=B1  5%      +0.0        0.30 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.__send_signal
      0.21 =C2=B1 11%      +0.0        0.22 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.place_entity
      0.09 =C2=B1 23%      +0.0        0.09 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.update_sd_lb_stats
      0.05 =C2=B1 47%      +0.0        0.06 =C2=B1 48%  perf-profile.childr=
en.cycles-pp.__x64_sys_prlimit64
      0.07 =C2=B1 19%      +0.0        0.07 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.__fput
      0.07 =C2=B1 12%      +0.0        0.08 =C2=B1 17%  perf-profile.childr=
en.cycles-pp.mark_page_accessed
      0.06 =C2=B1  8%      +0.0        0.06 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.unmap_single_vma
      0.13 =C2=B1 16%      +0.0        0.14 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.__rb_insert_augmented
      0.15 =C2=B1  9%      +0.0        0.15 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.prepare_signal
      0.58 =C2=B1  3%      +0.0        0.58 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.sched_clock_cpu
      0.10 =C2=B1 12%      +0.0        0.10 =C2=B1 20%  perf-profile.childr=
en.cycles-pp.delay_tsc
      0.10 =C2=B1 10%      +0.0        0.10 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.__cgroup_account_cputime
      0.11 =C2=B1 11%      +0.0        0.12 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.vma_gap_callbacks_rotate
      0.08 =C2=B1 13%      +0.0        0.09 =C2=B1 17%  perf-profile.childr=
en.cycles-pp.rcu_all_qs
      0.03 =C2=B1 70%      +0.0        0.04 =C2=B1 71%  perf-profile.childr=
en.cycles-pp.do_dentry_open
      0.05 =C2=B1 47%      +0.0        0.06 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.copy_creds
      0.04 =C2=B1 73%      +0.0        0.05 =C2=B1 47%  perf-profile.childr=
en.cycles-pp.prepare_creds
      0.02 =C2=B1141%      +0.0        0.02 =C2=B1146%  perf-profile.childr=
en.cycles-pp.__x64_sys_setpgid
      0.48 =C2=B1  5%      +0.0        0.49 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.native_sched_clock
      0.27 =C2=B1  4%      +0.0        0.28 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.__list_del_entry_valid
      0.14 =C2=B1  5%      +0.0        0.14 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.put_prev_task_fair
      0.07 =C2=B1 14%      +0.0        0.08 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.update_min_vruntime
      0.07 =C2=B1 16%      +0.0        0.07 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.__mmdrop
      0.04 =C2=B1 73%      +0.0        0.05 =C2=B1 73%  perf-profile.childr=
en.cycles-pp.smpboot_thread_fn
      0.18 =C2=B1 13%      +0.0        0.18 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.newidle_balance
      0.10 =C2=B1 14%      +0.0        0.10 =C2=B1 15%  perf-profile.childr=
en.cycles-pp.switch_fpu_return
      0.09 =C2=B1 11%      +0.0        0.10 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.free_vmap_area_noflush
      0.08 =C2=B1 12%      +0.0        0.08 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.__list_add_valid
      0.11 =C2=B1 20%      +0.0        0.12 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.ptep_clear_flush
      0.04 =C2=B1 73%      +0.0        0.04 =C2=B1 45%  perf-profile.childr=
en.cycles-pp.nohz_run_idle_balance
      0.11 =C2=B1 10%      +0.0        0.12 =C2=B1 15%  perf-profile.childr=
en.cycles-pp.free_pgd_range
      0.02 =C2=B1142%      +0.0        0.03 =C2=B1 99%  perf-profile.childr=
en.cycles-pp.rb_insert_color
      0.23 =C2=B1  6%      +0.0        0.24 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.tick_nohz_idle_enter
      0.11 =C2=B1 11%      +0.0        0.11 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.mmput
      0.10 =C2=B1  9%      +0.0        0.11 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.entry_SYSCALL_64_safe_stack
      0.08 =C2=B1  8%      +0.0        0.09 =C2=B1 18%  perf-profile.childr=
en.cycles-pp.perf_trace_sched_stat_runtime
      0.08 =C2=B1  8%      +0.0        0.09 =C2=B1 15%  perf-profile.childr=
en.cycles-pp.complete_signal
      0.11 =C2=B1 20%      +0.0        0.12 =C2=B1 17%  perf-profile.childr=
en.cycles-pp.__pud_alloc
      0.08 =C2=B1 34%      +0.0        0.09 =C2=B1 20%  perf-profile.childr=
en.cycles-pp.queued_write_lock_slowpath
      0.38 =C2=B1  7%      +0.0        0.39 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.perf_trace_sched_wakeup_template
      0.41 =C2=B1  5%      +0.0        0.41 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.tick_nohz_idle_exit
      0.26 =C2=B1  6%      +0.0        0.27 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.update_cfs_group
      0.21 =C2=B1 13%      +0.0        0.22 =C2=B1 24%  perf-profile.childr=
en.cycles-pp.io_serial_in
      0.21 =C2=B1  7%      +0.0        0.22 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.perf_mux_hrtimer_handler
      0.22 =C2=B1  7%      +0.0        0.23 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.task_rq_lock
      0.21 =C2=B1 10%      +0.0        0.22 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.free_work
      0.15 =C2=B1  9%      +0.0        0.16 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.get_cpu_device
      0.13 =C2=B1 10%      +0.0        0.14 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.rcu_eqs_enter
      0.13 =C2=B1 17%      +0.0        0.14 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.find_get_pid
      0.01 =C2=B1223%      +0.0        0.02 =C2=B1141%  perf-profile.childr=
en.cycles-pp.up_read
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.children.cy=
cles-pp.task_tick_fair
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.children.cy=
cles-pp.add_device_randomness
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.children.cy=
cles-pp.__sigqueue_alloc
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.children.cy=
cles-pp.free_unref_page_commit
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.children.cy=
cles-pp.rcu_note_context_switch
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.children.cy=
cles-pp.rcu_nmi_enter
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.children.cy=
cles-pp.propagate_protected_usage
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.children.cy=
cles-pp.__count_memcg_events
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.children.cy=
cles-pp.call_rcu
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.children.cy=
cles-pp.drm_fb_helper_sys_imageblit
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.children.cy=
cles-pp.sys_imageblit
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.children.cy=
cles-pp._raw_write_lock_irq
      0.30 =C2=B1  6%      +0.0        0.31 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.update_ts_time_stats
      0.27 =C2=B1  8%      +0.0        0.28 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.cpuidle_governor_latency_req
      0.14 =C2=B1  4%      +0.0        0.15 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.__might_sleep
      0.09 =C2=B1 10%      +0.0        0.10 =C2=B1 21%  perf-profile.childr=
en.cycles-pp.dput
      0.07 =C2=B1 11%      +0.0        0.08 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.signal_wake_up_state
      0.05 =C2=B1 45%      +0.0        0.06 =C2=B1 50%  perf-profile.childr=
en.cycles-pp.rcu_dynticks_eqs_enter
      0.02 =C2=B1142%      +0.0        0.03 =C2=B1100%  perf-profile.childr=
en.cycles-pp.free_ldt_pgtables
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.children.cy=
cles-pp.lockref_get_not_dead
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.children.cy=
cles-pp.task_change_group_fair
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.children.cy=
cles-pp.vt_console_print
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.children.cy=
cles-pp.lf
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.children.cy=
cles-pp.con_scroll
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.children.cy=
cles-pp.fbcon_scroll
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.children.cy=
cles-pp.fbcon_redraw
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.children.cy=
cles-pp.fbcon_putcs
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.children.cy=
cles-pp.bit_putcs
      0.05 =C2=B1 47%      +0.0        0.06 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.idr_find
      0.17 =C2=B1 16%      +0.0        0.18 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.__radix_tree_lookup
      0.12 =C2=B1 10%      +0.0        0.14 =C2=B1 17%  perf-profile.childr=
en.cycles-pp.update_blocked_averages
      0.09 =C2=B1  8%      +0.0        0.10 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.do_open
      0.06 =C2=B1  7%      +0.0        0.07 =C2=B1 18%  perf-profile.childr=
en.cycles-pp.cgroup_enter_frozen
      2.20 =C2=B1  4%      +0.0        2.21 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.arch_ptrace
      0.37 =C2=B1  4%      +0.0        0.38 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.wait_consider_task
      0.21 =C2=B1  8%      +0.0        0.22 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.__vunmap
      0.05 =C2=B1 45%      +0.0        0.06 =C2=B1 19%  perf-profile.childr=
en.cycles-pp.get_mem_cgroup_from_mm
      0.01 =C2=B1223%      +0.0        0.02 =C2=B1141%  perf-profile.childr=
en.cycles-pp.tick_nohz_idle_got_tick
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.children.cy=
cles-pp.__legitimize_path
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.children.cy=
cles-pp.try_to_unlazy
      0.10 =C2=B1 10%      +0.0        0.11 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.do_notify_parent
      0.12 =C2=B1 10%      +0.0        0.13 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.remove_vm_area
      2.20 =C2=B1  4%      +0.0        2.21 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.ptrace_request
      2.18 =C2=B1  4%      +0.0        2.20 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.ptrace_resume
      0.30 =C2=B1  5%      +0.0        0.32 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.nr_iowait_cpu
      0.05 =C2=B1 48%      +0.0        0.07 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.user_disable_single_step
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.children.cy=
cles-pp.osq_lock
      0.12 =C2=B1 10%      +0.0        0.14 =C2=B1 19%  perf-profile.childr=
en.cycles-pp.run_rebalance_domains
      0.06 =C2=B1  9%      +0.0        0.07 =C2=B1 24%  perf-profile.childr=
en.cycles-pp.cpuacct_charge
      0.10 =C2=B1 15%      +0.0        0.12 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.__memcg_kmem_uncharge
      0.01 =C2=B1223%      +0.0        0.03 =C2=B1 99%  perf-profile.childr=
en.cycles-pp.do_prlimit
      0.50 =C2=B1  4%      +0.0        0.51 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.sched_clock
      1.94 =C2=B1  8%      +0.0        1.95 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.copy_page_range
      1.14 =C2=B1  5%      +0.0        1.16 =C2=B1  6%  perf-profile.childr=
en.cycles-pp._raw_spin_lock
      0.54 =C2=B1  2%      +0.0        0.55 =C2=B1  4%  perf-profile.childr=
en.cycles-pp._raw_spin_lock_irq
      0.19 =C2=B1 11%      +0.0        0.21 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.page_counter_try_charge
      0.00            +0.0        0.02 =C2=B1141%  perf-profile.children.cy=
cles-pp.__put_task_struct
      0.01 =C2=B1223%      +0.0        0.03 =C2=B1 99%  perf-profile.childr=
en.cycles-pp.intel_pmu_disable_all
      0.74 =C2=B1  9%      +0.0        0.76 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.irq_exit_rcu
      1.52 =C2=B1  9%      +0.0        1.54 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.copy_pte_range
      0.06 =C2=B1 11%      +0.0        0.08 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.put_prev_entity
      0.06 =C2=B1 13%      +0.0        0.07 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.alloc_pid
      0.04 =C2=B1 71%      +0.0        0.06 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.pm_qos_read_value
      0.02 =C2=B1141%      +0.0        0.04 =C2=B1 71%  perf-profile.childr=
en.cycles-pp.trigger_load_balance
      0.02 =C2=B1141%      +0.0        0.04 =C2=B1 71%  perf-profile.childr=
en.cycles-pp.___pte_free_tlb
      0.13 =C2=B1 10%      +0.0        0.15 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.find_task_by_vpid
      0.01 =C2=B1223%      +0.0        0.03 =C2=B1100%  perf-profile.childr=
en.cycles-pp.note_gp_changes
      0.00            +0.0        0.02 =C2=B1144%  perf-profile.children.cy=
cles-pp.uncharge_batch
      0.04 =C2=B1 71%      +0.0        0.06 =C2=B1 13%  perf-profile.childr=
en.cycles-pp._find_next_bit
      0.38 =C2=B1  6%      +0.0        0.40 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.wait_task_zombie
      0.05 =C2=B1 45%      +0.0        0.07 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.perf_swevent_get_recursion_context
      0.03 =C2=B1100%      +0.0        0.05 =C2=B1 46%  perf-profile.childr=
en.cycles-pp.__mod_lruvec_state
      0.09 =C2=B1 14%      +0.0        0.11 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.fput_many
      0.05 =C2=B1 47%      +0.0        0.07 =C2=B1 24%  perf-profile.childr=
en.cycles-pp.add_wait_queue
      0.08 =C2=B1 14%      +0.0        0.10 =C2=B1 25%  perf-profile.childr=
en.cycles-pp.userfaultfd_unmap_prep
      0.27 =C2=B1  7%      +0.0        0.29 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.find_vma
      0.18 =C2=B1 18%      +0.0        0.21 =C2=B1 23%  perf-profile.childr=
en.cycles-pp.memcpy_toio
      0.13 =C2=B1 12%      +0.0        0.15 =C2=B1 15%  perf-profile.childr=
en.cycles-pp.page_counter_uncharge
      0.05 =C2=B1 48%      +0.0        0.07 =C2=B1 21%  perf-profile.childr=
en.cycles-pp.perf_trace_buf_alloc
      0.00            +0.0        0.03 =C2=B1 99%  perf-profile.children.cy=
cles-pp.cpuidle_reflect
      0.00            +0.0        0.03 =C2=B1 99%  perf-profile.children.cy=
cles-pp.irqtime_account_process_tick
      0.12 =C2=B1 11%      +0.0        0.15 =C2=B1 17%  perf-profile.childr=
en.cycles-pp.page_counter_cancel
      0.40 =C2=B1 12%      +0.0        0.43 =C2=B1 14%  perf-profile.childr=
en.cycles-pp.__vmalloc_node_range
      0.00            +0.0        0.03 =C2=B1223%  perf-profile.children.cy=
cles-pp.percpu_counter_add_batch
      0.22 =C2=B1  5%      +0.0        0.25 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.rcu_do_batch
      0.00            +0.0        0.03 =C2=B1223%  perf-profile.children.cy=
cles-pp.__vm_enough_memory
      0.35 =C2=B1  6%      +0.0        0.38 =C2=B1 13%  perf-profile.childr=
en.cycles-pp.release_task
      0.21 =C2=B1 18%      +0.0        0.24 =C2=B1 21%  perf-profile.childr=
en.cycles-pp.alloc_vmap_area
      0.25 =C2=B1 12%      +0.0        0.28 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.queued_read_lock_slowpath
      0.23 =C2=B1 16%      +0.0        0.26 =C2=B1 21%  perf-profile.childr=
en.cycles-pp.__get_vm_area_node
      0.19 =C2=B1 18%      +0.0        0.22 =C2=B1 17%  perf-profile.childr=
en.cycles-pp.drm_atomic_helper_commit
      0.19 =C2=B1 18%      +0.0        0.22 =C2=B1 17%  perf-profile.childr=
en.cycles-pp.commit_tail
      0.19 =C2=B1 18%      +0.0        0.22 =C2=B1 17%  perf-profile.childr=
en.cycles-pp.drm_atomic_helper_commit_tail
      0.18 =C2=B1 18%      +0.0        0.21 =C2=B1 18%  perf-profile.childr=
en.cycles-pp.drm_fb_memcpy_dstclip
      0.09 =C2=B1 18%      +0.0        0.12 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.__vma_rb_erase
      0.04 =C2=B1 75%      +0.0        0.07 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.vma_interval_tree_insert_after
      0.19 =C2=B1 18%      +0.0        0.22 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.drm_atomic_helper_dirtyfb
      0.19 =C2=B1 18%      +0.0        0.22 =C2=B1 17%  perf-profile.childr=
en.cycles-pp.drm_atomic_helper_commit_planes
      0.19 =C2=B1 18%      +0.0        0.22 =C2=B1 17%  perf-profile.childr=
en.cycles-pp.mgag200_simple_display_pipe_update
      0.19 =C2=B1 18%      +0.0        0.22 =C2=B1 17%  perf-profile.childr=
en.cycles-pp.mgag200_handle_damage
      0.28 =C2=B1  3%      +0.0        0.31 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.rcu_core
      0.68 =C2=B1  7%      +0.0        0.71 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.__softirqentry_text_start
      0.20 =C2=B1 16%      +0.0        0.24 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.drm_fb_helper_damage_work
      0.01 =C2=B1223%      +0.0        0.05        perf-profile.children.cy=
cles-pp.find_vmap_area
      0.14 =C2=B1  4%      +0.0        0.18 =C2=B1 15%  perf-profile.childr=
en.cycles-pp.drain_obj_stock
      0.59 =C2=B1  5%      +0.0        0.64 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.kthread
      0.62 =C2=B1  9%      +0.0        0.66 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.remove_vma
      0.50 =C2=B1  5%      +0.0        0.54 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.worker_thread
      0.17 =C2=B1  4%      +0.0        0.22 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.cgroup_leave_frozen
      0.44 =C2=B1  7%      +0.0        0.49 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.process_one_work
      0.50 =C2=B1  3%      +0.0        0.55 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.up_write
      0.84 =C2=B1  4%      +0.1        0.89 =C2=B1  3%  perf-profile.childr=
en.cycles-pp._raw_spin_lock_irqsave
      0.19 =C2=B1 12%      +0.1        0.24 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.__rb_erase_color
      0.96 =C2=B1  2%      +0.1        1.02 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.ret_from_fork
      0.00            +0.1        0.06 =C2=B1 55%  perf-profile.children.cy=
cles-pp.rwsem_spin_on_owner
      3.00 =C2=B1  6%      +0.1        3.06 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.unmap_page_range
      3.58 =C2=B1  2%      +0.1        3.65 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.kernel_wait4
      0.29 =C2=B1  5%      +0.1        0.35 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.free_pages_and_swap_cache
      0.24 =C2=B1 24%      +0.1        0.30 =C2=B1 20%  perf-profile.childr=
en.cycles-pp.native_queued_spin_lock_slowpath
      2.77 =C2=B1  7%      +0.1        2.84 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.zap_pte_range
      3.08 =C2=B1  6%      +0.1        3.15 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.unmap_vmas
      3.29            +0.1        3.37 =C2=B1  7%  perf-profile.children.cy=
cles-pp.do_wait
      0.27 =C2=B1  6%      +0.1        0.34 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.refill_obj_stock
      0.47 =C2=B1  7%      +0.1        0.55 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.__slab_free
      0.16 =C2=B1  6%      +0.1        0.24 =C2=B1 15%  perf-profile.childr=
en.cycles-pp._raw_read_lock
      0.85 =C2=B1  5%      +0.1        0.93 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.release_pages
      0.42 =C2=B1  8%      +0.1        0.49 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.ptrace_check_attach
      3.62 =C2=B1  2%      +0.1        3.70 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.__do_sys_wait4
      5.71 =C2=B1  3%      +0.1        5.80 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.asm_exc_page_fault
      2.97 =C2=B1  4%      +0.1        3.05 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.__x64_sys_ptrace
      0.94 =C2=B1 40%      +0.1        1.05 =C2=B1 37%  perf-profile.childr=
en.cycles-pp.start_kernel
      0.01 =C2=B1223%      +0.1        0.13 =C2=B1 43%  perf-profile.childr=
en.cycles-pp.rwsem_down_write_slowpath
      0.45 =C2=B1  4%      +0.1        0.58 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.down_write
      0.24 =C2=B1 12%      +0.1        0.38 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.vma_interval_tree_remove
      1.19 =C2=B1  3%      +0.1        1.34 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.tlb_finish_mmu
      0.31 =C2=B1  4%      +0.2        0.46 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.anon_vma_interval_tree_remove
      4.32 =C2=B1  4%      +0.2        4.47 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.exc_page_fault
      3.65 =C2=B1  4%      +0.2        3.80 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.handle_mm_fault
      1.17 =C2=B1  3%      +0.2        1.32 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.tlb_flush_mmu
      3.49 =C2=B1  4%      +0.2        3.65 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.__handle_mm_fault
      2.51 =C2=B1  5%      +0.2        2.66 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.do_fault
      4.25 =C2=B1  4%      +0.2        4.41 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.do_user_addr_fault
      2.40 =C2=B1  5%      +0.2        2.56 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.filemap_map_pages
      1.53 =C2=B1  4%      +0.2        1.71 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.kmem_cache_free
      0.32 =C2=B1  5%      +0.2        0.51 =C2=B1 12%  perf-profile.childr=
en.cycles-pp.anon_vma_interval_tree_insert
      0.46 =C2=B1  9%      +0.2        0.67 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.unlink_file_vma
      1.10 =C2=B1  4%      +0.2        1.32 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.next_uptodate_page
      1.21 =C2=B1  3%      +0.4        1.57 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.anon_vma_clone
      1.84 =C2=B1  3%      +0.4        2.22 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.anon_vma_fork
      1.53 =C2=B1  3%      +0.4        1.92 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.unlink_anon_vmas
      7.62 =C2=B1  4%      +0.4        8.03 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.__do_sys_clone
      7.62 =C2=B1  4%      +0.4        8.03 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.kernel_clone
      7.25 =C2=B1  4%      +0.4        7.68 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.copy_process
      5.98 =C2=B1  4%      +0.5        6.43 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.dup_mm
      5.83 =C2=B1  4%      +0.5        6.30 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.dup_mmap
      2.26 =C2=B1  4%      +0.6        2.86 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.free_pgtables
      8.06            +0.7        8.74 =C2=B1  7%  perf-profile.children.cy=
cles-pp.poll_idle
      6.58 =C2=B1  4%      +0.8        7.39 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.unmap_region
      7.65 =C2=B1  4%      +1.0        8.63 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.__x64_sys_munmap
      7.63 =C2=B1  4%      +1.0        8.62 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.__vm_munmap
      7.57 =C2=B1  4%      +1.0        8.56 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.__do_munmap
     31.35 =C2=B1  2%      +1.1       32.48 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.entry_SYSCALL_64_after_hwframe
     26.52 =C2=B1  2%      +1.3       27.86 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.do_syscall_64
     39.32 =C2=B1  2%      -0.9       38.38 =C2=B1  3%  perf-profile.self.c=
ycles-pp.intel_idle
      0.90 =C2=B1  6%      -0.2        0.71 =C2=B1  5%  perf-profile.self.c=
ycles-pp.__entry_text_start
      0.63 =C2=B1 13%      -0.1        0.54 =C2=B1  9%  perf-profile.self.c=
ycles-pp.page_remove_rmap
      1.07 =C2=B1  5%      -0.1        0.99 =C2=B1  4%  perf-profile.self.c=
ycles-pp.menu_select
      1.20 =C2=B1  4%      -0.1        1.12 =C2=B1  5%  perf-profile.self.c=
ycles-pp.__schedule
      1.29 =C2=B1  4%      -0.1        1.23 =C2=B1  4%  perf-profile.self.c=
ycles-pp.syscall_exit_to_user_mode
      0.82 =C2=B1  5%      -0.1        0.77 =C2=B1  5%  perf-profile.self.c=
ycles-pp.syscall_return_via_sysret
      1.03 =C2=B1  4%      -0.1        0.97 =C2=B1  4%  perf-profile.self.c=
ycles-pp._raw_spin_lock
      0.44 =C2=B1  3%      -0.0        0.39 =C2=B1 10%  perf-profile.self.c=
ycles-pp.enqueue_task_fair
      0.31 =C2=B1  9%      -0.0        0.26 =C2=B1 18%  perf-profile.self.c=
ycles-pp.page_add_file_rmap
      0.06 =C2=B1 13%      -0.0        0.01 =C2=B1223%  perf-profile.self.c=
ycles-pp.__update_idle_core
      0.29 =C2=B1  9%      -0.0        0.24 =C2=B1  6%  perf-profile.self.c=
ycles-pp.try_to_wake_up
      0.73 =C2=B1  2%      -0.0        0.69 =C2=B1  8%  perf-profile.self.c=
ycles-pp.update_load_avg
      0.43 =C2=B1  6%      -0.0        0.39 =C2=B1  4%  perf-profile.self.c=
ycles-pp.__update_load_avg_se
      0.18 =C2=B1 41%      -0.0        0.14 =C2=B1 52%  perf-profile.self.c=
ycles-pp.vm_normal_page
      0.05 =C2=B1  9%      -0.0        0.02 =C2=B1144%  perf-profile.self.c=
ycles-pp.copy_process
      0.49 =C2=B1 10%      -0.0        0.46 =C2=B1  9%  perf-profile.self.c=
ycles-pp.clear_page_erms
      0.47 =C2=B1  3%      -0.0        0.44 =C2=B1  7%  perf-profile.self.c=
ycles-pp.__update_load_avg_cfs_rq
      0.29 =C2=B1 10%      -0.0        0.26 =C2=B1  8%  perf-profile.self.c=
ycles-pp.___perf_sw_event
      0.32 =C2=B1  8%      -0.0        0.28 =C2=B1 10%  perf-profile.self.c=
ycles-pp.switch_mm_irqs_off
      0.03 =C2=B1101%      -0.0        0.00        perf-profile.self.cycles=
-pp.tracing_gen_ctx_irq_test
      0.16 =C2=B1  8%      -0.0        0.13 =C2=B1  9%  perf-profile.self.c=
ycles-pp.finish_task_switch
      0.46 =C2=B1 10%      -0.0        0.43 =C2=B1  5%  perf-profile.self.c=
ycles-pp.do_idle
      0.21 =C2=B1 15%      -0.0        0.18 =C2=B1 15%  perf-profile.self.c=
ycles-pp.ktime_get
      0.05 =C2=B1 45%      -0.0        0.02 =C2=B1141%  perf-profile.self.c=
ycles-pp.native_flush_tlb_one_user
      0.04 =C2=B1 71%      -0.0        0.01 =C2=B1223%  perf-profile.self.c=
ycles-pp.sync_mm_rss
      0.12 =C2=B1 12%      -0.0        0.10 =C2=B1 19%  perf-profile.self.c=
ycles-pp.try_charge
      0.07 =C2=B1  6%      -0.0        0.05 =C2=B1 46%  perf-profile.self.c=
ycles-pp.tick_nohz_tick_stopped
      0.03 =C2=B1 99%      -0.0        0.00        perf-profile.self.cycles=
-pp.__pagevec_lru_add
      0.05 =C2=B1 46%      -0.0        0.03 =C2=B1 99%  perf-profile.self.c=
ycles-pp.sysvec_apic_timer_interrupt
      0.40 =C2=B1  9%      -0.0        0.38 =C2=B1  7%  perf-profile.self.c=
ycles-pp.irqentry_exit_to_user_mode
      0.22 =C2=B1 11%      -0.0        0.20 =C2=B1 10%  perf-profile.self.c=
ycles-pp.pick_next_entity
      0.09 =C2=B1  5%      -0.0        0.07 =C2=B1  9%  perf-profile.self.c=
ycles-pp.copy_fpregs_to_fpstate
      0.38 =C2=B1  7%      -0.0        0.36 =C2=B1 10%  perf-profile.self.c=
ycles-pp.cpuidle_enter_state
      0.39 =C2=B1  5%      -0.0        0.37 =C2=B1  9%  perf-profile.self.c=
ycles-pp.__switch_to_asm
      0.05 =C2=B1 46%      -0.0        0.03 =C2=B1100%  perf-profile.self.c=
ycles-pp.tick_check_broadcast_expired
      0.17 =C2=B1  6%      -0.0        0.15 =C2=B1 12%  perf-profile.self.c=
ycles-pp.__mod_memcg_state
      0.50 =C2=B1  3%      -0.0        0.48 =C2=B1  5%  perf-profile.self.c=
ycles-pp.__switch_to
      0.32 =C2=B1  7%      -0.0        0.30 =C2=B1  7%  perf-profile.self.c=
ycles-pp.unlock_page
      0.21 =C2=B1  9%      -0.0        0.19 =C2=B1 10%  perf-profile.self.c=
ycles-pp.dequeue_entity
      0.10 =C2=B1 14%      -0.0        0.08 =C2=B1 18%  perf-profile.self.c=
ycles-pp.menu_reflect
      0.02 =C2=B1144%      -0.0        0.00        perf-profile.self.cycles=
-pp.__unlock_page_memcg
      0.10 =C2=B1  8%      -0.0        0.08 =C2=B1 13%  perf-profile.self.c=
ycles-pp.memcpy_erms
      0.20 =C2=B1  6%      -0.0        0.19 =C2=B1 11%  perf-profile.self.c=
ycles-pp.find_idlest_group
      0.50 =C2=B1  6%      -0.0        0.48 =C2=B1  8%  perf-profile.self.c=
ycles-pp.enqueue_entity
      0.41 =C2=B1  8%      -0.0        0.40 =C2=B1  9%  perf-profile.self.c=
ycles-pp.resched_curr
      0.14 =C2=B1 12%      -0.0        0.12 =C2=B1 11%  perf-profile.self.c=
ycles-pp.schedule
      0.08 =C2=B1 20%      -0.0        0.07 =C2=B1 52%  perf-profile.self.c=
ycles-pp.__hrtimer_run_queues
      0.09 =C2=B1 13%      -0.0        0.07 =C2=B1 16%  perf-profile.self.c=
ycles-pp.find_get_task_by_vpid
      0.10 =C2=B1 11%      -0.0        0.08 =C2=B1 19%  perf-profile.self.c=
ycles-pp.rb_erase
      0.12 =C2=B1 15%      -0.0        0.11 =C2=B1 12%  perf-profile.self.c=
ycles-pp.tick_nohz_next_event
      0.02 =C2=B1141%      -0.0        0.00        perf-profile.self.cycles=
-pp.__d_lookup_rcu
      0.17 =C2=B1 16%      -0.0        0.15 =C2=B1 10%  perf-profile.self.c=
ycles-pp.memcpy_toio
      0.34 =C2=B1  3%      -0.0        0.33 =C2=B1  9%  perf-profile.self.c=
ycles-pp.update_curr
      0.15 =C2=B1  8%      -0.0        0.13 =C2=B1 10%  perf-profile.self.c=
ycles-pp.obj_cgroup_charge
      0.05 =C2=B1 46%      -0.0        0.04 =C2=B1 71%  perf-profile.self.c=
ycles-pp.ttwu_do_activate
      0.24 =C2=B1  7%      -0.0        0.23 =C2=B1 11%  perf-profile.self.c=
ycles-pp.get_obj_cgroup_from_current
      0.14 =C2=B1  6%      -0.0        0.12 =C2=B1 11%  perf-profile.self.c=
ycles-pp.__wake_up_common
      0.11 =C2=B1 21%      -0.0        0.10 =C2=B1 15%  perf-profile.self.c=
ycles-pp.rcu_read_unlock_strict
      0.06 =C2=B1 14%      -0.0        0.05 =C2=B1 47%  perf-profile.self.c=
ycles-pp.irqtime_account_irq
      0.11 =C2=B1 21%      -0.0        0.10 =C2=B1 16%  perf-profile.self.c=
ycles-pp.rcu_sched_clock_irq
      0.09 =C2=B1  9%      -0.0        0.08 =C2=B1 11%  perf-profile.self.c=
ycles-pp.__rdgsbase_inactive
      0.47 =C2=B1  7%      -0.0        0.46 =C2=B1  8%  perf-profile.self.c=
ycles-pp.set_next_entity
      0.13 =C2=B1  9%      -0.0        0.12 =C2=B1  4%  perf-profile.self.c=
ycles-pp.available_idle_cpu
      0.08 =C2=B1  8%      -0.0        0.07 =C2=B1 14%  perf-profile.self.c=
ycles-pp._raw_spin_unlock_irqrestore
      0.06 =C2=B1 46%      -0.0        0.05 =C2=B1 45%  perf-profile.self.c=
ycles-pp.rcu_needs_cpu
      0.17 =C2=B1  9%      -0.0        0.16 =C2=B1  9%  perf-profile.self.c=
ycles-pp.dequeue_task_fair
      0.14 =C2=B1 10%      -0.0        0.13 =C2=B1 16%  perf-profile.self.c=
ycles-pp.__wrgsbase_inactive
      0.08 =C2=B1 14%      -0.0        0.07 =C2=B1 11%  perf-profile.self.c=
ycles-pp.sched_clock_cpu
      0.09 =C2=B1 14%      -0.0        0.07 =C2=B1 16%  perf-profile.self.c=
ycles-pp.__hrtimer_next_event_base
      0.06 =C2=B1  6%      -0.0        0.05 =C2=B1 49%  perf-profile.self.c=
ycles-pp.free_pgd_range
      0.05 =C2=B1 51%      -0.0        0.04 =C2=B1 71%  perf-profile.self.c=
ycles-pp.free_pcppages_bulk
      0.02 =C2=B1142%      -0.0        0.01 =C2=B1223%  perf-profile.self.c=
ycles-pp.rb_insert_color
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.self.cycles=
-pp.mem_cgroup_from_task
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.self.cycles=
-pp.rebalance_domains
      0.07 =C2=B1 16%      -0.0        0.06 =C2=B1 48%  perf-profile.self.c=
ycles-pp.perf_trace_sched_wakeup_template
      0.09 =C2=B1 14%      -0.0        0.08 =C2=B1  6%  perf-profile.self.c=
ycles-pp.call_cpuidle
      0.06 =C2=B1 11%      -0.0        0.05 =C2=B1 46%  perf-profile.self.c=
ycles-pp.perf_trace_sched_stat_runtime
      0.19 =C2=B1  7%      -0.0        0.19 =C2=B1  8%  perf-profile.self.c=
ycles-pp.copy_page
      0.36 =C2=B1  6%      -0.0        0.35 =C2=B1  7%  perf-profile.self.c=
ycles-pp.native_irq_return_iret
      0.21 =C2=B1 13%      -0.0        0.20 =C2=B1 13%  perf-profile.self.c=
ycles-pp.io_serial_in
      0.13 =C2=B1  8%      -0.0        0.12 =C2=B1 10%  perf-profile.self.c=
ycles-pp.lock_page_memcg
      0.10 =C2=B1 11%      -0.0        0.09 =C2=B1 17%  perf-profile.self.c=
ycles-pp.do_user_addr_fault
      0.04 =C2=B1 71%      -0.0        0.03 =C2=B1100%  perf-profile.self.c=
ycles-pp.rcu_dynticks_eqs_exit
      0.04 =C2=B1 71%      -0.0        0.03 =C2=B1100%  perf-profile.self.c=
ycles-pp.__mod_lruvec_page_state
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.self.cycles=
-pp.idle_cpu
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.self.cycles=
-pp.sched_clock
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.self.cycles=
-pp.__remove_hrtimer
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.self.cycles=
-pp.dup_fd
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.self.cycles=
-pp.cpuidle_get_cpu_driver
      0.01 =C2=B1223%      -0.0        0.00        perf-profile.self.cycles=
-pp.do_wp_page
      0.24 =C2=B1 10%      -0.0        0.23 =C2=B1  7%  perf-profile.self.c=
ycles-pp.__irqentry_text_end
      0.15 =C2=B1  6%      -0.0        0.15 =C2=B1  6%  perf-profile.self.c=
ycles-pp.child_wait_callback
      0.16 =C2=B1  8%      -0.0        0.15 =C2=B1  4%  perf-profile.self.c=
ycles-pp.__x86_retpoline_rax
      0.09 =C2=B1 11%      -0.0        0.08 =C2=B1 13%  perf-profile.self.c=
ycles-pp.rcu_eqs_exit
      0.07 =C2=B1 18%      -0.0        0.07 =C2=B1 11%  perf-profile.self.c=
ycles-pp.vmacache_find
      0.07 =C2=B1 14%      -0.0        0.06 =C2=B1 46%  perf-profile.self.c=
ycles-pp.schedule_idle
      0.68 =C2=B1  8%      -0.0        0.67 =C2=B1  8%  perf-profile.self.c=
ycles-pp.update_rq_clock
      0.23 =C2=B1  6%      -0.0        0.23 =C2=B1 12%  perf-profile.self.c=
ycles-pp.__task_pid_nr_ns
      0.09 =C2=B1 11%      -0.0        0.08 =C2=B1 14%  perf-profile.self.c=
ycles-pp.__cond_resched
      0.12 =C2=B1 10%      -0.0        0.11 =C2=B1 12%  perf-profile.self.c=
ycles-pp.cpus_share_cache
      0.06 =C2=B1 11%      -0.0        0.06 =C2=B1 54%  perf-profile.self.c=
ycles-pp.hrtimer_interrupt
      0.17 =C2=B1  8%      -0.0        0.16 =C2=B1 12%  perf-profile.self.c=
ycles-pp.copy_page_range
      0.12 =C2=B1 10%      -0.0        0.11 =C2=B1 16%  perf-profile.self.c=
ycles-pp.update_irq_load_avg
      0.06 =C2=B1 21%      -0.0        0.06 =C2=B1  6%  perf-profile.self.c=
ycles-pp.cpuidle_governor_latency_req
      0.06 =C2=B1 19%      -0.0        0.06 =C2=B1 11%  perf-profile.self.c=
ycles-pp.rmqueue
      0.26 =C2=B1  2%      -0.0        0.25 =C2=B1  7%  perf-profile.self.c=
ycles-pp.select_task_rq_fair
      0.16 =C2=B1  5%      -0.0        0.16 =C2=B1  8%  perf-profile.self.c=
ycles-pp.entry_SYSCALL_64_after_hwframe
      0.11 =C2=B1 13%      -0.0        0.10 =C2=B1 13%  perf-profile.self.c=
ycles-pp.lapic_next_deadline
      0.05 =C2=B1 45%      -0.0        0.04 =C2=B1 73%  perf-profile.self.c=
ycles-pp.check_preempt_curr
      0.07 =C2=B1 21%      -0.0        0.06 =C2=B1 13%  perf-profile.self.c=
ycles-pp.put_pid
      0.01 =C2=B1223%      -0.0        0.01 =C2=B1223%  perf-profile.self.c=
ycles-pp.xas_load
      0.13 =C2=B1  8%      -0.0        0.12 =C2=B1  6%  perf-profile.self.c=
ycles-pp.ttwu_queue_wakelist
      0.08 =C2=B1 14%      -0.0        0.08 =C2=B1  6%  perf-profile.self.c=
ycles-pp.__alloc_pages_nodemask
      0.33 =C2=B1  6%      -0.0        0.33 =C2=B1  6%  perf-profile.self.c=
ycles-pp.read_tsc
      0.05 =C2=B1 48%      -0.0        0.05 =C2=B1 45%  perf-profile.self.c=
ycles-pp.exit_to_user_mode_prepare
      0.02 =C2=B1144%      -0.0        0.02 =C2=B1141%  perf-profile.self.c=
ycles-pp.__sysvec_apic_timer_interrupt
      0.04 =C2=B1 71%      -0.0        0.03 =C2=B1 70%  perf-profile.self.c=
ycles-pp.__tlb_remove_page_size
      0.02 =C2=B1141%      -0.0        0.02 =C2=B1141%  perf-profile.self.c=
ycles-pp.native_apic_mem_write
      0.23 =C2=B1  8%      -0.0        0.23 =C2=B1  6%  perf-profile.self.c=
ycles-pp.reweight_entity
      0.19 =C2=B1  7%      -0.0        0.19 =C2=B1 10%  perf-profile.self.c=
ycles-pp.allocate_slab
      0.08 =C2=B1  9%      -0.0        0.07 =C2=B1 10%  perf-profile.self.c=
ycles-pp.cpuidle_not_available
      0.08 =C2=B1 16%      -0.0        0.08 =C2=B1  7%  perf-profile.self.c=
ycles-pp.do_syscall_64
      0.07 =C2=B1  7%      -0.0        0.06 =C2=B1 19%  perf-profile.self.c=
ycles-pp.put_prev_task_fair
      0.12 =C2=B1 13%      -0.0        0.11 =C2=B1 12%  perf-profile.self.c=
ycles-pp.anon_vma_fork
      0.35 =C2=B1  3%      -0.0        0.35 =C2=B1  6%  perf-profile.self.c=
ycles-pp.___might_sleep
      0.15 =C2=B1 14%      -0.0        0.14 =C2=B1 11%  perf-profile.self.c=
ycles-pp.newidle_balance
      0.02 =C2=B1142%      -0.0        0.02 =C2=B1141%  perf-profile.self.c=
ycles-pp.unlock_page_memcg
      0.02 =C2=B1144%      -0.0        0.02 =C2=B1142%  perf-profile.self.c=
ycles-pp._raw_spin_trylock
      0.08 =C2=B1 23%      -0.0        0.08 =C2=B1 11%  perf-profile.self.c=
ycles-pp.arch_scale_freq_tick
      0.07 =C2=B1 14%      -0.0        0.07 =C2=B1 16%  perf-profile.self.c=
ycles-pp.alloc_vmap_area
      0.08 =C2=B1 15%      -0.0        0.08 =C2=B1  9%  perf-profile.self.c=
ycles-pp.__x86_indirect_thunk_rax
      0.11 =C2=B1 10%      -0.0        0.11 =C2=B1 12%  perf-profile.self.c=
ycles-pp.ptrace_resume
      0.74 =C2=B1  4%      +0.0        0.74 =C2=B1  5%  perf-profile.self.c=
ycles-pp.kmem_cache_alloc
      0.15 =C2=B1 14%      +0.0        0.15 =C2=B1 15%  perf-profile.self.c=
ycles-pp.unlink_anon_vmas
      0.05 =C2=B1 45%      +0.0        0.05 =C2=B1  8%  perf-profile.self.c=
ycles-pp.perf_trace_sched_switch
      0.07 =C2=B1 15%      +0.0        0.07 =C2=B1 21%  perf-profile.self.c=
ycles-pp.mark_page_accessed
      0.02 =C2=B1141%      +0.0        0.02 =C2=B1141%  perf-profile.self.c=
ycles-pp.__mod_node_page_state
      0.02 =C2=B1141%      +0.0        0.02 =C2=B1141%  perf-profile.self.c=
ycles-pp.get_page_from_freelist
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%  perf-profile.self.c=
ycles-pp.scheduler_tick
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%  perf-profile.self.c=
ycles-pp.exc_page_fault
      0.52 =C2=B1  3%      +0.0        0.52 =C2=B1  4%  perf-profile.self.c=
ycles-pp._raw_spin_lock_irq
      0.37 =C2=B1  7%      +0.0        0.37 =C2=B1 10%  perf-profile.self.c=
ycles-pp.vm_area_dup
      0.20 =C2=B1 11%      +0.0        0.20 =C2=B1  3%  perf-profile.self.c=
ycles-pp.place_entity
      0.07 =C2=B1 10%      +0.0        0.07 =C2=B1 20%  perf-profile.self.c=
ycles-pp.update_min_vruntime
      0.11 =C2=B1 14%      +0.0        0.11 =C2=B1 10%  perf-profile.self.c=
ycles-pp.__calc_delta
      0.07 =C2=B1 14%      +0.0        0.07 =C2=B1  9%  perf-profile.self.c=
ycles-pp.rcu_eqs_enter
      0.05 =C2=B1 45%      +0.0        0.05 =C2=B1 47%  perf-profile.self.c=
ycles-pp.sync_regs
      0.03 =C2=B1 99%      +0.0        0.03 =C2=B1100%  perf-profile.self.c=
ycles-pp.__vma_link_rb
      0.04 =C2=B1 71%      +0.0        0.04 =C2=B1 73%  perf-profile.self.c=
ycles-pp.___slab_alloc
      0.04 =C2=B1 71%      +0.0        0.04 =C2=B1 72%  perf-profile.self.c=
ycles-pp.can_stop_idle_tick
      0.17 =C2=B1  7%      +0.0        0.17 =C2=B1  6%  perf-profile.self.c=
ycles-pp.perf_tp_event
      0.06 =C2=B1 47%      +0.0        0.07 =C2=B1 52%  perf-profile.self.c=
ycles-pp.ktime_get_update_offsets_now
      0.07 =C2=B1 12%      +0.0        0.07 =C2=B1 14%  perf-profile.self.c=
ycles-pp.__list_add_valid
      0.04 =C2=B1 45%      +0.0        0.05 =C2=B1 50%  perf-profile.self.c=
ycles-pp.get_mem_cgroup_from_mm
      0.05 =C2=B1 45%      +0.0        0.06 =C2=B1 46%  perf-profile.self.c=
ycles-pp.handle_mm_fault
      0.05 =C2=B1 45%      +0.0        0.05 =C2=B1 46%  perf-profile.self.c=
ycles-pp.idr_find
      0.06 =C2=B1 47%      +0.0        0.07 =C2=B1 14%  perf-profile.self.c=
ycles-pp.wait_task_inactive
      0.08 =C2=B1 13%      +0.0        0.09 =C2=B1 14%  perf-profile.self.c=
ycles-pp.__cgroup_account_cputime
      0.09 =C2=B1 10%      +0.0        0.10 =C2=B1  7%  perf-profile.self.c=
ycles-pp.rb_next
      0.16 =C2=B1 10%      +0.0        0.16 =C2=B1 12%  perf-profile.self.c=
ycles-pp.__mod_memcg_lruvec_state
      0.10 =C2=B1 12%      +0.0        0.10 =C2=B1 20%  perf-profile.self.c=
ycles-pp.delay_tsc
      0.09 =C2=B1 14%      +0.0        0.10 =C2=B1 12%  perf-profile.self.c=
ycles-pp.switch_fpu_return
      0.11 =C2=B1 14%      +0.0        0.12 =C2=B1  9%  perf-profile.self.c=
ycles-pp.do_set_pte
      0.06 =C2=B1  8%      +0.0        0.06 =C2=B1 11%  perf-profile.self.c=
ycles-pp.perf_mux_hrtimer_handler
      0.02 =C2=B1144%      +0.0        0.03 =C2=B1 99%  perf-profile.self.c=
ycles-pp.nohz_run_idle_balance
      0.13 =C2=B1  5%      +0.0        0.13 =C2=B1  8%  perf-profile.self.c=
ycles-pp.pick_next_task_fair
      0.10 =C2=B1 10%      +0.0        0.11 =C2=B1 13%  perf-profile.self.c=
ycles-pp.vma_gap_callbacks_rotate
      0.05 =C2=B1 47%      +0.0        0.05 =C2=B1 13%  perf-profile.self.c=
ycles-pp.cpu_startup_entry
      0.14 =C2=B1 10%      +0.0        0.15 =C2=B1 14%  perf-profile.self.c=
ycles-pp.prepare_signal
      0.26 =C2=B1  4%      +0.0        0.27 =C2=B1  4%  perf-profile.self.c=
ycles-pp.__list_del_entry_valid
      0.03 =C2=B1 99%      +0.0        0.03 =C2=B1 70%  perf-profile.self.c=
ycles-pp.entry_SYSCALL_64_safe_stack
      0.15 =C2=B1  8%      +0.0        0.15 =C2=B1  8%  perf-profile.self.c=
ycles-pp.get_cpu_device
      0.04 =C2=B1 45%      +0.0        0.05 =C2=B1 46%  perf-profile.self.c=
ycles-pp.put_prev_entity
      0.01 =C2=B1223%      +0.0        0.02 =C2=B1142%  perf-profile.self.c=
ycles-pp.perf_iterate_sb
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.self.cycles=
-pp.__send_signal
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.self.cycles=
-pp.do_notify_parent_cldstop
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.self.cycles=
-pp.xas_find
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.self.cycles=
-pp.wp_page_copy
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.self.cycles=
-pp.unmap_vmas
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.self.cycles=
-pp.clockevents_program_event
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.self.cycles=
-pp.find_vmap_area
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.self.cycles=
-pp.__count_memcg_events
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.self.cycles=
-pp.rcu_nocb_flush_deferred_wakeup
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.self.cycles=
-pp._raw_write_lock_irq
      0.03 =C2=B1100%      +0.0        0.04 =C2=B1 71%  perf-profile.self.c=
ycles-pp.update_process_times
      0.10 =C2=B1 15%      +0.0        0.11 =C2=B1 11%  perf-profile.self.c=
ycles-pp.rcu_idle_exit
      0.05 =C2=B1 45%      +0.0        0.06 =C2=B1 50%  perf-profile.self.c=
ycles-pp.rcu_dynticks_eqs_enter
      0.06 =C2=B1 50%      +0.0        0.07 =C2=B1 14%  perf-profile.self.c=
ycles-pp.update_sd_lb_stats
      0.02 =C2=B1141%      +0.0        0.03 =C2=B1100%  perf-profile.self.c=
ycles-pp.__perf_sw_event
      0.02 =C2=B1141%      +0.0        0.03 =C2=B1100%  perf-profile.self.c=
ycles-pp.perf_trace_buf_alloc
      0.06 =C2=B1 49%      +0.0        0.07 =C2=B1  9%  perf-profile.self.c=
ycles-pp.__x64_sys_ptrace
      0.46 =C2=B1  6%      +0.0        0.47 =C2=B1  6%  perf-profile.self.c=
ycles-pp.native_sched_clock
      0.07 =C2=B1 16%      +0.0        0.08 =C2=B1 20%  perf-profile.self.c=
ycles-pp.queued_write_lock_slowpath
      0.30 =C2=B1  5%      +0.0        0.31 =C2=B1  9%  perf-profile.self.c=
ycles-pp.nr_iowait_cpu
      0.15 =C2=B1 14%      +0.0        0.16 =C2=B1  8%  perf-profile.self.c=
ycles-pp.unmap_page_range
      0.06 =C2=B1  9%      +0.0        0.07 =C2=B1 22%  perf-profile.self.c=
ycles-pp.cpuacct_charge
      0.02 =C2=B1141%      +0.0        0.03 =C2=B1100%  perf-profile.self.c=
ycles-pp.timerqueue_add
      0.01 =C2=B1223%      +0.0        0.02 =C2=B1141%  perf-profile.self.c=
ycles-pp.ptrace_check_attach
      0.01 =C2=B1223%      +0.0        0.02 =C2=B1141%  perf-profile.self.c=
ycles-pp.tick_nohz_idle_got_tick
      0.05 =C2=B1 47%      +0.0        0.06 =C2=B1 11%  perf-profile.self.c=
ycles-pp.tick_nohz_get_sleep_length
      0.17 =C2=B1 15%      +0.0        0.18 =C2=B1  9%  perf-profile.self.c=
ycles-pp.__radix_tree_lookup
      0.18 =C2=B1 11%      +0.0        0.19 =C2=B1 11%  perf-profile.self.c=
ycles-pp.page_counter_try_charge
      0.05 =C2=B1 48%      +0.0        0.07 =C2=B1 11%  perf-profile.self.c=
ycles-pp.user_disable_single_step
      0.00            +0.0        0.01 =C2=B1223%  perf-profile.self.cycles=
-pp.osq_lock
      0.11 =C2=B1  6%      +0.0        0.13 =C2=B1 10%  perf-profile.self.c=
ycles-pp.__might_sleep
      0.12 =C2=B1  7%      +0.0        0.13 =C2=B1 13%  perf-profile.self.c=
ycles-pp.__rb_insert_augmented
      0.28 =C2=B1  6%      +0.0        0.29 =C2=B1  3%  perf-profile.self.c=
ycles-pp.filemap_map_pages
      0.25 =C2=B1  6%      +0.0        0.27 =C2=B1 14%  perf-profile.self.c=
ycles-pp.update_cfs_group
      0.05 =C2=B1 47%      +0.0        0.06 =C2=B1 13%  perf-profile.self.c=
ycles-pp.rcu_all_qs
      0.03 =C2=B1100%      +0.0        0.04 =C2=B1 45%  perf-profile.self.c=
ycles-pp.pm_qos_read_value
      0.23 =C2=B1  4%      +0.0        0.24 =C2=B1 10%  perf-profile.self.c=
ycles-pp.wait_consider_task
      0.00            +0.0        0.02 =C2=B1141%  perf-profile.self.cycles=
-pp.cpuidle_reflect
      0.00            +0.0        0.02 =C2=B1141%  perf-profile.self.cycles=
-pp.up_read
      0.00            +0.0        0.02 =C2=B1141%  perf-profile.self.cycles=
-pp.PageHuge
      0.00            +0.0        0.02 =C2=B1141%  perf-profile.self.cycles=
-pp.__softirqentry_text_start
      0.01 =C2=B1223%      +0.0        0.03 =C2=B1 99%  perf-profile.self.c=
ycles-pp.trigger_load_balance
      0.05 =C2=B1 45%      +0.0        0.07 =C2=B1 16%  perf-profile.self.c=
ycles-pp.__do_munmap
      0.02 =C2=B1142%      +0.0        0.04 =C2=B1 71%  perf-profile.self.c=
ycles-pp.remove_vma
      0.18 =C2=B1  8%      +0.0        0.20 =C2=B1  5%  perf-profile.self.c=
ycles-pp.find_vma
      0.03 =C2=B1 99%      +0.0        0.04 =C2=B1 45%  perf-profile.self.c=
ycles-pp.__do_sys_wait4
      0.02 =C2=B1141%      +0.0        0.04 =C2=B1 71%  perf-profile.self.c=
ycles-pp.update_blocked_averages
      0.04 =C2=B1 45%      +0.0        0.06 =C2=B1 17%  perf-profile.self.c=
ycles-pp.perf_swevent_get_recursion_context
      0.18 =C2=B1  8%      +0.0        0.20 =C2=B1 13%  perf-profile.self.c=
ycles-pp.__handle_mm_fault
      0.08 =C2=B1 13%      +0.0        0.10 =C2=B1 14%  perf-profile.self.c=
ycles-pp.fput_many
      0.03 =C2=B1 99%      +0.0        0.05 =C2=B1 45%  perf-profile.self.c=
ycles-pp.unmap_single_vma
      0.03 =C2=B1 99%      +0.0        0.05 =C2=B1 45%  perf-profile.self.c=
ycles-pp.free_vmap_area_noflush
      0.15 =C2=B1  6%      +0.0        0.17 =C2=B1  3%  perf-profile.self.c=
ycles-pp.queued_read_lock_slowpath
      0.11 =C2=B1 12%      +0.0        0.13 =C2=B1 14%  perf-profile.self.c=
ycles-pp.page_counter_cancel
      0.34 =C2=B1  5%      +0.0        0.36 =C2=B1 14%  perf-profile.self.c=
ycles-pp.dup_mmap
      0.00            +0.0        0.03 =C2=B1 99%  perf-profile.self.cycles=
-pp.irqtime_account_process_tick
      0.03 =C2=B1100%      +0.0        0.06 =C2=B1 51%  perf-profile.self.c=
ycles-pp.find_get_pid
      0.04 =C2=B1 45%      +0.0        0.07 =C2=B1 16%  perf-profile.self.c=
ycles-pp.drain_obj_stock
      0.03 =C2=B1100%      +0.0        0.06 =C2=B1 13%  perf-profile.self.c=
ycles-pp._find_next_bit
      0.09 =C2=B1 18%      +0.0        0.11 =C2=B1 10%  perf-profile.self.c=
ycles-pp.__vma_rb_erase
      0.07 =C2=B1 18%      +0.0        0.10 =C2=B1 25%  perf-profile.self.c=
ycles-pp.userfaultfd_unmap_prep
      0.13 =C2=B1  9%      +0.0        0.16 =C2=B1  9%  perf-profile.self.c=
ycles-pp.refill_obj_stock
      0.04 =C2=B1 75%      +0.0        0.07 =C2=B1  6%  perf-profile.self.c=
ycles-pp.vma_interval_tree_insert_after
      0.12 =C2=B1 12%      +0.0        0.16 =C2=B1  8%  perf-profile.self.c=
ycles-pp.__rb_erase_color
      0.82 =C2=B1  5%      +0.0        0.86 =C2=B1  3%  perf-profile.self.c=
ycles-pp._raw_spin_lock_irqsave
      0.18 =C2=B1  7%      +0.0        0.23 =C2=B1 12%  perf-profile.self.c=
ycles-pp.ptrace_stop
      0.83 =C2=B1 10%      +0.1        0.88 =C2=B1 13%  perf-profile.self.c=
ycles-pp.copy_pte_range
      0.49 =C2=B1  3%      +0.1        0.54 =C2=B1  8%  perf-profile.self.c=
ycles-pp.up_write
      0.39 =C2=B1  4%      +0.1        0.45 =C2=B1 14%  perf-profile.self.c=
ycles-pp.do_wait
      0.00            +0.1        0.06 =C2=B1 56%  perf-profile.self.cycles=
-pp.rwsem_spin_on_owner
      0.24 =C2=B1 24%      +0.1        0.30 =C2=B1 20%  perf-profile.self.c=
ycles-pp.native_queued_spin_lock_slowpath
      0.61 =C2=B1  4%      +0.1        0.68 =C2=B1  4%  perf-profile.self.c=
ycles-pp.kmem_cache_free
      0.28 =C2=B1  5%      +0.1        0.35 =C2=B1  9%  perf-profile.self.c=
ycles-pp.free_pages_and_swap_cache
      0.45 =C2=B1  7%      +0.1        0.52 =C2=B1  7%  perf-profile.self.c=
ycles-pp.__slab_free
      0.16 =C2=B1  7%      +0.1        0.23 =C2=B1 14%  perf-profile.self.c=
ycles-pp._raw_read_lock
      0.21 =C2=B1  3%      +0.1        0.29 =C2=B1  8%  perf-profile.self.c=
ycles-pp.anon_vma_clone
      0.61 =C2=B1  7%      +0.1        0.70 =C2=B1  7%  perf-profile.self.c=
ycles-pp.release_pages
      0.34 =C2=B1  9%      +0.1        0.45 =C2=B1  9%  perf-profile.self.c=
ycles-pp.down_write
      0.31 =C2=B1  4%      +0.1        0.45 =C2=B1 12%  perf-profile.self.c=
ycles-pp.anon_vma_interval_tree_remove
      0.24 =C2=B1 11%      +0.1        0.38 =C2=B1  7%  perf-profile.self.c=
ycles-pp.vma_interval_tree_remove
      0.32 =C2=B1  4%      +0.2        0.49 =C2=B1 12%  perf-profile.self.c=
ycles-pp.anon_vma_interval_tree_insert
      1.57 =C2=B1 12%      +0.2        1.78 =C2=B1 12%  perf-profile.self.c=
ycles-pp.zap_pte_range
      1.08 =C2=B1  4%      +0.2        1.31 =C2=B1  7%  perf-profile.self.c=
ycles-pp.next_uptodate_page
      7.81            +0.7        8.46 =C2=B1  7%  perf-profile.self.cycles=
-pp.poll_idle



> =

> > BTW, we supplied perf data in original report, not sure if they are hel=
pful?
> > or do you have suggestion which kind of data will be more helpful to yo=
u?
> > we will continuously improve our report based on suggestions from commu=
nity.
> > Thanks a lot!
> >
> =

> Staring at it some more, I notice a huge uptick in:
> =

> - major page faults (+315.2% and +270%)
> - cache misses (+125.2% and +131.0%)
> =

> I don't really get the page faults; the cache misses I could somewhat
> understand: this is adding p->flags and (p->set_child_tid)->flags accesse=
s,
> which are in different cachelines than p->se and p->cpus_mask used in
> can_migrate_task().
> =

> I think I could dig some more into this with perf, but I'd need to be able
> to reproduce this locally first...
> =

> >>
> >> [1]: http://lore.kernel.org/r/20210223023004.GB25487(a)xsang-OptiPlex-=
9020
--===============7369619924709513335==--

