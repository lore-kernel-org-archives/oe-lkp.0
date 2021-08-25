Content-Type: multipart/mixed; boundary="===============3791732215362397619=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [pipe] 3b844826b6: stress-ng.sigio.ops_per_sec -99.3% regression
Date: Wed, 25 Aug 2021 16:50:59 +0800
Message-ID: <20210825085059.GC5358@xsang-OptiPlex-9020>
In-Reply-To: <CAHk-=wgrSmiwUfSGt1RPy5KJ_TLBTP5DB0-vT=PCxQY4C7uANA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3791732215362397619==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Tue, Aug 24, 2021 at 10:39:25AM -0700, Linus Torvalds wrote:
> On Tue, Aug 24, 2021 at 10:32 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > We could do the same ugly thing for FASYNC that we do for EPOLLET -
> > make it always fasync on new data, exactly because the previous SIGIO
> > might not have emptied the buffer completely.
> =

> The patch would be something like the attached (UNTESTED!)
> =

>                   Linus

we made a quick test upon this patch, and confirmed it could recover
stress-ng.sigio performance.
BTW, we didn't use the latest stress-ng where Colin King pushed his
fix.


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
class/compiler/cpufreq_governor/disk/kconfig/nr_threads/rootfs/tbox_group/t=
est/testcase/testtime/ucode:
  interrupt/gcc-9/performance/1HDD/x86_64-rhel-8.3/100%/debian-10.4-x86_64-=
20200603.cgz/lkp-csl-2sp7/sigio/stress-ng/60s/0x5003006

commit: =

  614cb2751d ("Merge tag 'trace-v5.14-rc6' of git://git.kernel.org/pub/scm/=
linux/kernel/git/rostedt/linux-trace")
  3b844826b6 ("pipe: avoid unnecessary EPOLLET wakeups under normal loads")
  2f048251de ("fix for 3b844826b6 from Linus")

614cb2751d315085 3b844826b6c6affa80755254da3 2f048251de14f6225773b3ede04 =

---------------- --------------------------- --------------------------- =

         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \  =

 5.253e+08           -99.3%    3459947 =C2=B1 14%      -0.6%   5.22e+08    =
    stress-ng.sigio.ops
   8754883           -99.3%      57665 =C2=B1 14%      -0.6%    8700647    =
    stress-ng.sigio.ops_per_sec
     62.22            +0.2%      62.35            -0.0%      62.21        s=
tress-ng.time.elapsed_time
     62.22            +0.2%      62.35            -0.0%      62.21        s=
tress-ng.time.elapsed_time.max
      3500 =C2=B1 22%   +1377.4%      51720            -7.9%       3225 =C2=
=B1  3%  stress-ng.time.file_system_inputs
     85.33 =C2=B1169%    -100.0%       0.00           -74.7%      21.60 =C2=
=B1 16%  stress-ng.time.file_system_outputs
 1.035e+09          -100.0%      35652 =C2=B1 80%      -1.0%  1.025e+09    =
    stress-ng.time.involuntary_context_switches
    654.00            -0.1%     653.67            -0.2%     652.60        s=
tress-ng.time.major_page_faults
      6755            +0.0%       6756            -0.6%       6713        s=
tress-ng.time.maximum_resident_set_size
     21237            -3.6%      20482            +0.4%      21327        s=
tress-ng.time.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096        s=
tress-ng.time.page_size
      9210           -99.4%      51.17 =C2=B1 16%      -0.5%       9160    =
    stress-ng.time.percent_of_cpu_this_job_got
      5222           -99.4%      29.88 =C2=B1 16%      -0.6%       5189    =
    stress-ng.time.system_time
    508.33           -99.5%       2.36 =C2=B1 14%      +0.3%     509.89    =
    stress-ng.time.user_time
   4493592 =C2=B1 18%     -86.5%     608367 =C2=B1 19%      +6.9%    480391=
2 =C2=B1 23%  stress-ng.time.voluntary_context_switches
    460.83           -68.6%     144.72 =C2=B1  8%      -0.1%     460.54    =
    pmeter.Average_Active_Power
 3.504e+08         +1637.4%  6.088e+09            +6.3%  3.724e+08 =C2=B1 2=
4%  cpuidle..time
    471193 =C2=B1 15%     -14.3%     403852 =C2=B1 11%    +173.1%    128663=
6 =C2=B1 19%  cpuidle..usage
    102.18            +0.1%     102.33            +0.5%     102.73        u=
ptime.boot
      3491          +164.3%       9227            +2.0%       3559 =C2=B1  =
3%  uptime.idle
     37.82            -0.1%      37.78            -0.5%      37.64        b=
oot-time.boot
     18.35            -0.2%      18.32            +0.4%      18.42        b=
oot-time.dhcp
      3001            -0.1%       2999            -0.1%       2999        b=
oot-time.idle
      1.00            +0.0%       1.00            +0.0%       1.00        b=
oot-time.smp_boot
      7.57         +1211.5%      99.27            +5.6%       7.99 =C2=B1 1=
9%  iostat.cpu.idle
      0.00 =C2=B1129%     -67.9%       0.00 =C2=B1 56%     +21.8%       0.0=
0 =C2=B1109%  iostat.cpu.iowait
     84.16           -99.3%       0.59 =C2=B1 12%      -0.5%      83.70    =
    iostat.cpu.system
      8.26           -98.3%       0.14 =C2=B1  5%      +0.4%       8.30    =
    iostat.cpu.user
      5.03           +94.3       99.32            +0.4        5.47 =C2=B1 2=
8%  mpstat.cpu.all.idle%
      0.00 =C2=B1140%      -0.0        0.00 =C2=B1 72%      +0.0        0.0=
0 =C2=B1123%  mpstat.cpu.all.iowait%
      0.34 =C2=B1  6%      -0.3        0.01 =C2=B1 14%      +0.5        0.8=
7 =C2=B1  2%  mpstat.cpu.all.irq%
      0.01 =C2=B1 16%      -0.0        0.01 =C2=B1 47%      +0.0        0.0=
2 =C2=B1  4%  mpstat.cpu.all.soft%
     86.12           -85.6        0.53 =C2=B1 14%      -1.0       85.13    =
    mpstat.cpu.all.sys%
      8.48            -8.4        0.13 =C2=B1  5%      +0.0        8.51    =
    mpstat.cpu.all.usr%
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-numastat.node0.interleave_hit
    376983 =C2=B1 27%     -69.4%     115385 =C2=B1 11%     +50.1%     56582=
0 =C2=B1 17%  numa-numastat.node0.local_node
    377025 =C2=B1 27%     -69.4%     115420 =C2=B1 11%     +64.6%     62074=
7 =C2=B1 16%  numa-numastat.node0.numa_hit
     42.83 =C2=B1 45%      -6.6%      40.00 =C2=B1 66%  +1.3e+05%      5501=
5 =C2=B1 53%  numa-numastat.node0.other_node
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-numastat.node1.interleave_hit
    476092 =C2=B1 42%     -68.4%     150588 =C2=B1 10%      +6.9%     50898=
3 =C2=B1 18%  numa-numastat.node1.local_node
    476118 =C2=B1 42%     -68.4%     150603 =C2=B1 10%     +13.6%     54063=
6 =C2=B1 15%  numa-numastat.node1.numa_hit
      7.83 =C2=B1 13%    +127.7%      17.83 =C2=B1111%    +4e+05%      3165=
0 =C2=B1 93%  numa-numastat.node1.other_node
     62.22            +0.2%      62.35            -0.0%      62.21        t=
ime.elapsed_time
     62.22            +0.2%      62.35            -0.0%      62.21        t=
ime.elapsed_time.max
      3500 =C2=B1 22%   +1377.4%      51720            -7.9%       3225 =C2=
=B1  3%  time.file_system_inputs
     85.33 =C2=B1169%    -100.0%       0.00           -74.7%      21.60 =C2=
=B1 16%  time.file_system_outputs
 1.035e+09          -100.0%      35652 =C2=B1 80%      -1.0%  1.025e+09    =
    time.involuntary_context_switches
    654.00            -0.1%     653.67            -0.2%     652.60        t=
ime.major_page_faults
      6755            +0.0%       6756            -0.6%       6713        t=
ime.maximum_resident_set_size
     21237            -3.6%      20482            +0.4%      21327        t=
ime.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096        t=
ime.page_size
      9210           -99.4%      51.17 =C2=B1 16%      -0.5%       9160    =
    time.percent_of_cpu_this_job_got
      5222           -99.4%      29.88 =C2=B1 16%      -0.6%       5189    =
    time.system_time
    508.33           -99.5%       2.36 =C2=B1 14%      +0.3%     509.89    =
    time.user_time
   4493592 =C2=B1 18%     -86.5%     608367 =C2=B1 19%      +6.9%    480391=
2 =C2=B1 23%  time.voluntary_context_switches
      7.00         +1314.3%      99.00            +7.1%       7.50 =C2=B1 2=
0%  vmstat.cpu.id
     83.83          -100.0%       0.00            -0.4%      83.50        v=
mstat.cpu.sy
      8.00          -100.0%       0.00            -1.2%       7.90 =C2=B1  =
3%  vmstat.cpu.us
      0.00          -100.0%       0.00          -100.0%       0.00        v=
mstat.cpu.wa
     42.00 =C2=B1 13%    +842.9%     396.00            -6.2%      39.40 =C2=
=B1  2%  vmstat.io.bi
    668.83 =C2=B1  4%    -100.0%       0.00            -4.8%     636.90 =C2=
=B1  6%  vmstat.io.bo
      1785 =C2=B1 22%     -99.2%      15.00           -10.4%       1599 =C2=
=B1  4%  vmstat.memory.buff
   2495353            +0.7%    2512055            +2.2%    2551078        v=
mstat.memory.cache
 5.238e+08            -0.0%  5.236e+08            -0.1%  5.232e+08        v=
mstat.memory.free
      0.00          -100.0%       0.00          -100.0%       0.00        v=
mstat.procs.b
    176.50          -100.0%       0.00            -0.5%     175.70        v=
mstat.procs.r
  16009506           -99.9%      20670 =C2=B1 16%      -1.6%   15757388    =
    vmstat.system.cs
    736835 =C2=B1 17%     -96.2%      27683 =C2=B1 11%     +17.0%     86213=
1 =C2=B1 17%  vmstat.system.in
      2589           -99.2%      21.00 =C2=B1 11%      -0.9%       2565    =
    turbostat.Avg_MHz
     94.24           -93.5        0.72 =C2=B1 11%      -0.5       93.73    =
    turbostat.Busy%
      2753            +5.9%       2916            -0.4%       2742        t=
urbostat.Bzy_MHz
    273602 =C2=B1 17%     -95.1%      13315 =C2=B1 54%      +1.0%     27635=
3 =C2=B1 29%  turbostat.C1
      0.03 =C2=B1 11%      -0.0        0.01            +0.0        0.05 =C2=
=B1 16%  turbostat.C1%
      5730 =C2=B1 21%    +507.5%      34814 =C2=B1114%  +11133.4%     64373=
2 =C2=B1 36%  turbostat.C1E
      0.03 =C2=B1 27%      +0.1        0.18 =C2=B1128%      +4.7        4.7=
0 =C2=B1 43%  turbostat.C1E%
     17066 =C2=B1  6%    +567.6%     113932 =C2=B1 12%    +622.6%     12331=
6 =C2=B1111%  turbostat.C6
      5.56           +93.6       99.12            -4.3        1.29 =C2=B110=
0%  turbostat.C6%
      0.62 =C2=B1  8%    +284.8%       2.40 =C2=B1 23%    +876.0%       6.0=
8 =C2=B1 22%  turbostat.CPU%c1
      5.14         +1785.4%      96.88           -96.5%       0.18 =C2=B1 4=
4%  turbostat.CPU%c6
     67.17           -37.0%      42.33 =C2=B1  2%      -0.5%      66.80 =C2=
=B1  2%  turbostat.CoreTmp
  47874023 =C2=B1 17%     -96.3%    1782191 =C2=B1 11%     +17.6%   5632204=
0 =C2=B1 17%  turbostat.IRQ
      2.19 =C2=B1  6%    +886.7%      21.59 =C2=B1 30%     -99.7%       0.0=
1 =C2=B1300%  turbostat.Pkg%pc2
      0.34 =C2=B1 21%  +15100.5%      52.19 =C2=B1 32%    -100.0%       0.0=
0        turbostat.Pkg%pc6
     66.83           -36.9%      42.17            -0.0%      66.80 =C2=B1  =
2%  turbostat.PkgTmp
    286.61           -83.7%      46.85 =C2=B1 12%      +1.0%     289.45    =
    turbostat.PkgWatt
    145.97           -39.9%      87.72 =C2=B1 22%      +0.3%     146.39    =
    turbostat.RAMWatt
      2095            -0.0%       2095            -0.0%       2095        t=
urbostat.TSC_MHz
      4372 =C2=B1  9%    +369.6%      20531          +673.3%      33810 =C2=
=B1  7%  meminfo.Active
      2345            -4.8%       2232         +1263.6%      31975 =C2=B1  =
7%  meminfo.Active(anon)
      2026 =C2=B1 20%    +802.9%      18298            -9.5%       1834 =C2=
=B1  4%  meminfo.Active(file)
     68420            +0.4%      68711           +21.3%      82989 =C2=B1  =
3%  meminfo.AnonHugePages
    418729            +0.1%     419055            +9.0%     456394        m=
eminfo.AnonPages
      1782 =C2=B1 22%     -99.2%      15.00           -10.5%       1596 =C2=
=B1  4%  meminfo.Buffers
   2396061            +0.7%    2413436            +2.0%    2445168        m=
eminfo.Cached
  2.64e+08            +0.0%   2.64e+08            +0.0%   2.64e+08        m=
eminfo.CommitLimit
   2275514            +0.1%    2277751            +4.1%    2368478        m=
eminfo.Committed_AS
 5.145e+08            +0.3%  5.162e+08            -0.5%  5.121e+08        m=
eminfo.DirectMap1G
  23388501 =C2=B1 31%      -7.5%   21636788 =C2=B1 32%     +10.2%   2578534=
4 =C2=B1 28%  meminfo.DirectMap2M
    754116 =C2=B1  9%      +0.5%     758202 =C2=B1  4%      -2.7%     73404=
5 =C2=B1  4%  meminfo.DirectMap4k
      2.17 =C2=B1 17%    -100.0%       0.00           +10.8%       2.40 =C2=
=B1 20%  meminfo.Dirty
      2048            +0.0%       2048            +0.0%       2048        m=
eminfo.Hugepagesize
    430285            +0.2%     431111           +10.5%     475278        m=
eminfo.Inactive
    429894            +0.2%     430913           +10.5%     474892        m=
eminfo.Inactive(anon)
    390.50           -49.4%     197.67            -1.2%     385.80 =C2=B1  =
2%  meminfo.Inactive(file)
     99274            -0.7%      98618            +5.8%     105037        m=
eminfo.KReclaimable
     19761            -0.1%      19735            +0.3%      19827        m=
eminfo.KernelStack
     29110            -0.8%      28863           +65.1%      48068        m=
eminfo.Mapped
 5.217e+08            -0.0%  5.215e+08            -0.1%   5.21e+08        m=
eminfo.MemAvailable
 5.238e+08            -0.0%  5.236e+08            -0.1%  5.232e+08        m=
eminfo.MemFree
  5.28e+08            +0.0%   5.28e+08            +0.0%   5.28e+08        m=
eminfo.MemTotal
   4232011            +5.2%    4451421           +14.9%    4860968        m=
eminfo.Memused
     11.00            -1.5%      10.83 =C2=B1  3%      -0.9%      10.90 =C2=
=B1  2%  meminfo.Mlocked
     15817 =C2=B1  2%      -0.9%      15670 =C2=B1  5%      +2.9%      1627=
3 =C2=B1  2%  meminfo.PageTables
     46144            -0.7%      45824            +1.1%      46661        m=
eminfo.Percpu
     99274            -0.7%      98618            +5.8%     105037        m=
eminfo.SReclaimable
    198986            +0.8%     200618            +3.0%     204991        m=
eminfo.SUnreclaim
     13679            +0.2%      13705          +267.7%      50297 =C2=B1  =
5%  meminfo.Shmem
    298261            +0.3%     299236            +3.9%     310029        m=
eminfo.Slab
   2381742            -0.0%    2381249            +0.5%    2394243        m=
eminfo.Unevictable
 3.436e+10            +0.0%  3.436e+10            +0.0%  3.436e+10        m=
eminfo.VmallocTotal
    275141           +20.7%     331981            +0.0%     275217        m=
eminfo.VmallocUsed
      0.00          -100.0%       0.00          -100.0%       0.00        m=
eminfo.Writeback
   4339025            +3.8%    4502372           +14.8%    4980620        m=
eminfo.max_used_kB
      3446 =C2=B1 11%    +467.8%      19571           -25.3%       2574 =C2=
=B1 17%  numa-meminfo.node0.Active
      1772 =C2=B1 11%     -28.2%       1272 =C2=B1 19%     -10.1%       159=
2 =C2=B1 26%  numa-meminfo.node0.Active(anon)
      1673 =C2=B1 24%    +993.3%      18298           -41.4%     981.50 =C2=
=B1 28%  numa-meminfo.node0.Active(file)
     68835           -22.4%      53388 =C2=B1 47%     -21.6%      53989 =C2=
=B1 53%  numa-meminfo.node0.AnonHugePages
    338248 =C2=B1  4%     -12.6%     295578 =C2=B1 17%     -18.5%     27571=
1 =C2=B1 44%  numa-meminfo.node0.AnonPages
    350493 =C2=B1  4%     -11.8%     309008 =C2=B1 17%     -17.5%     28900=
1 =C2=B1 42%  numa-meminfo.node0.AnonPages.max
      2.17 =C2=B1 17%    -100.0%       0.00           -21.5%       1.70 =C2=
=B1 69%  numa-meminfo.node0.Dirty
   1333118 =C2=B1 79%     -27.4%     968496 =C2=B1 98%      +9.0%    145252=
0 =C2=B1 74%  numa-meminfo.node0.FilePages
    340684 =C2=B1  4%     -12.2%     299212 =C2=B1 17%     -17.8%     27997=
4 =C2=B1 44%  numa-meminfo.node0.Inactive
    340374 =C2=B1  4%     -12.2%     299014 =C2=B1 17%     -17.8%     27977=
6 =C2=B1 44%  numa-meminfo.node0.Inactive(anon)
    310.00 =C2=B1 36%     -36.2%     197.67           -36.3%     197.40 =C2=
=B1 35%  numa-meminfo.node0.Inactive(file)
     54606 =C2=B1 34%     -16.2%      45749 =C2=B1 41%      +3.0%      5622=
0 =C2=B1 43%  numa-meminfo.node0.KReclaimable
     11881 =C2=B1  2%      -5.7%      11202 =C2=B1  2%     -11.8%      1048=
1 =C2=B1 15%  numa-meminfo.node0.KernelStack
     14229 =C2=B1 66%     -21.5%      11165 =C2=B1 89%     +77.8%      2530=
0 =C2=B1 61%  numa-meminfo.node0.Mapped
 2.614e+08            +0.1%  2.617e+08            -0.1%  2.611e+08        n=
uma-meminfo.node0.MemFree
 2.638e+08            +0.0%  2.638e+08            +0.0%  2.638e+08        n=
uma-meminfo.node0.MemTotal
   2411458 =C2=B1 44%     -12.0%    2123217 =C2=B1 50%     +15.8%    279360=
0 =C2=B1 45%  numa-meminfo.node0.MemUsed
      5.50 =C2=B1100%     -36.4%       3.50 =C2=B1141%     +18.2%       6.5=
0 =C2=B1 81%  numa-meminfo.node0.Mlocked
     12294 =C2=B1  2%      -6.1%      11545 =C2=B1  8%     -20.8%       974=
1 =C2=B1 42%  numa-meminfo.node0.PageTables
     54606 =C2=B1 34%     -16.2%      45749 =C2=B1 41%      +3.0%      5622=
0 =C2=B1 43%  numa-meminfo.node0.SReclaimable
    101947 =C2=B1  2%      +0.4%     102336 =C2=B1  7%      +2.6%     10455=
5 =C2=B1 15%  numa-meminfo.node0.SUnreclaim
      3902 =C2=B1  5%     +24.6%       4863 =C2=B1 74%     +47.0%       573=
7 =C2=B1 85%  numa-meminfo.node0.Shmem
    156553 =C2=B1 12%      -5.4%     148086 =C2=B1 17%      +2.7%     16077=
5 =C2=B1 24%  numa-meminfo.node0.Slab
   1327230 =C2=B1 79%     -28.8%     945135 =C2=B1100%      +8.9%    144560=
0 =C2=B1 74%  numa-meminfo.node0.Unevictable
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-meminfo.node0.Writeback
    927.50 =C2=B1 48%      +3.8%     962.83 =C2=B1 25%   +3305.1%      3158=
2 =C2=B1  8%  numa-meminfo.node1.Active
    573.33 =C2=B1 31%     +67.9%     962.83 =C2=B1 25%   +5259.7%      3072=
9 =C2=B1  8%  numa-meminfo.node1.Active(anon)
    354.00 =C2=B1141%    -100.0%       0.00          +141.0%     853.10 =C2=
=B1 36%  numa-meminfo.node1.Active(file)
      0.00       +1.5e+106%      15322 =C2=B1163% +2.9e+106%      29081 =C2=
=B1100%  numa-meminfo.node1.AnonHugePages
     81000 =C2=B1 18%     +52.5%     123499 =C2=B1 41%    +122.8%     18044=
3 =C2=B1 67%  numa-meminfo.node1.AnonPages
     86089 =C2=B1 17%     +52.7%     131489 =C2=B1 40%    +148.1%     21355=
6 =C2=B1 57%  numa-meminfo.node1.AnonPages.max
      0.00          -100.0%       0.00         +7e+101%       0.70 =C2=B115=
7%  numa-meminfo.node1.Dirty
   1064732 =C2=B1 98%     +35.7%    1444969 =C2=B1 66%      -6.6%     99419=
9 =C2=B1108%  numa-meminfo.node1.FilePages
     90153 =C2=B1 16%     +46.4%     131939 =C2=B1 39%    +116.0%     19468=
6 =C2=B1 64%  numa-meminfo.node1.Inactive
     90072 =C2=B1 16%     +46.5%     131939 =C2=B1 39%    +115.9%     19449=
9 =C2=B1 64%  numa-meminfo.node1.Inactive(anon)
     80.17 =C2=B1141%    -100.0%       0.00          +133.4%     187.10 =C2=
=B1 39%  numa-meminfo.node1.Inactive(file)
     44666 =C2=B1 44%     +18.4%      52867 =C2=B1 34%      +9.3%      4881=
6 =C2=B1 49%  numa-meminfo.node1.KReclaimable
      7878 =C2=B1  4%      +8.4%       8538 =C2=B1  4%     +18.6%       934=
1 =C2=B1 16%  numa-meminfo.node1.KernelStack
     14938 =C2=B1 62%     +18.8%      17747 =C2=B1 55%     +47.2%      2199=
5 =C2=B1 70%  numa-meminfo.node1.Mapped
 2.624e+08            -0.2%  2.619e+08            -0.1%  2.621e+08        n=
uma-meminfo.node1.MemFree
 2.642e+08            +0.0%  2.642e+08            +0.0%  2.642e+08        n=
uma-meminfo.node1.MemTotal
   1821060 =C2=B1 59%     +27.8%    2327936 =C2=B1 45%     +13.5%    206669=
5 =C2=B1 60%  numa-meminfo.node1.MemUsed
      5.50 =C2=B1100%     +33.3%       7.33 =C2=B1 70%     -20.0%       4.4=
0 =C2=B1122%  numa-meminfo.node1.Mlocked
      3525 =C2=B1  8%     +17.4%       4138 =C2=B1 11%     +84.7%       651=
0 =C2=B1 62%  numa-meminfo.node1.PageTables
     44666 =C2=B1 44%     +18.4%      52867 =C2=B1 34%      +9.3%      4881=
6 =C2=B1 49%  numa-meminfo.node1.SReclaimable
     97041 =C2=B1  2%      +1.3%      98279 =C2=B1  7%      +3.5%     10043=
2 =C2=B1 17%  numa-meminfo.node1.SUnreclaim
      9784 =C2=B1  2%      -9.5%       8856 =C2=B1 40%    +354.9%      4451=
4 =C2=B1 10%  numa-meminfo.node1.Shmem
    141708 =C2=B1 14%      +6.7%     151146 =C2=B1 15%      +5.3%     14924=
9 =C2=B1 26%  numa-meminfo.node1.Slab
   1054512 =C2=B1 99%     +36.2%    1436113 =C2=B1 66%     -10.0%     94864=
2 =C2=B1113%  numa-meminfo.node1.Unevictable
    350.50 =C2=B1  9%      +0.3%     351.67 =C2=B1  4%      -2.8%     340.7=
0 =C2=B1  4%  proc-vmstat.direct_map_level2_splits
     19.33 =C2=B1 36%      -8.6%      17.67 =C2=B1 38%     +11.7%      21.6=
0 =C2=B1 31%  proc-vmstat.direct_map_level3_splits
    586.00            -4.7%     558.67         +1255.9%       7945 =C2=B1  =
7%  proc-vmstat.nr_active_anon
    506.50 =C2=B1 20%    +803.1%       4574            -9.6%     458.10 =C2=
=B1  4%  proc-vmstat.nr_active_file
    104766            -0.0%     104765            +9.1%     114248        p=
roc-vmstat.nr_anon_pages
     33.17            +0.0%      33.17           +20.3%      39.90 =C2=B1  =
3%  proc-vmstat.nr_anon_transparent_hugepages
     18.00 =C2=B1101%    -100.0%       0.00           -41.7%      10.50 =C2=
=B1 10%  proc-vmstat.nr_dirtied
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.nr_dirty
  13021455            -0.0%   13016400            -0.1%   13005744        p=
roc-vmstat.nr_dirty_background_threshold
  26074750            -0.0%   26064626            -0.1%   26043289        p=
roc-vmstat.nr_dirty_threshold
    599462            +0.7%     603366            +2.0%     611651        p=
roc-vmstat.nr_file_pages
  1.31e+08            -0.0%  1.309e+08            -0.1%  1.308e+08        p=
roc-vmstat.nr_free_pages
    107561            +0.2%     107735           +10.5%     118887        p=
roc-vmstat.nr_inactive_anon
     97.33           -49.7%      49.00            -1.3%      96.10 =C2=B1  =
2%  proc-vmstat.nr_inactive_file
      0.67 =C2=B1223%     +25.0%       0.83 =C2=B1223%    -100.0%       0.0=
0        proc-vmstat.nr_isolated_anon
     19763            -0.1%      19737            +0.3%      19829        p=
roc-vmstat.nr_kernel_stack
      7526            -1.0%       7448           +60.2%      12054        p=
roc-vmstat.nr_mapped
      2.00            +0.0%       2.00            +0.0%       2.00        p=
roc-vmstat.nr_mlock
      3955 =C2=B1  2%      -0.9%       3919 =C2=B1  5%      +2.9%       406=
9 =C2=B1  2%  proc-vmstat.nr_page_table_pages
      3421            +0.2%       3429          +266.4%      12534 =C2=B1  =
5%  proc-vmstat.nr_shmem
     24817            -0.7%      24654            +5.8%      26256        p=
roc-vmstat.nr_slab_reclaimable
     49746            +0.8%      50153            +3.0%      51247        p=
roc-vmstat.nr_slab_unreclaimable
    595435            -0.0%     595311            +0.5%     598560        p=
roc-vmstat.nr_unevictable
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.nr_writeback
     17.33 =C2=B1104%    -100.0%       0.00           -43.5%       9.80 =C2=
=B1 11%  proc-vmstat.nr_written
    586.00            -4.7%     558.67         +1255.9%       7945 =C2=B1  =
7%  proc-vmstat.nr_zone_active_anon
    506.50 =C2=B1 20%    +803.1%       4574            -9.6%     458.10 =C2=
=B1  4%  proc-vmstat.nr_zone_active_file
    107561            +0.2%     107735           +10.5%     118886        p=
roc-vmstat.nr_zone_inactive_anon
     97.33           -49.7%      49.00            -1.3%      96.10 =C2=B1  =
2%  proc-vmstat.nr_zone_inactive_file
    595435            -0.0%     595311            +0.5%     598560        p=
roc-vmstat.nr_zone_unevictable
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.nr_zone_write_pending
      1827 =C2=B1139%     +75.1%       3198 =C2=B1144%      +0.6%       183=
8 =C2=B1115%  proc-vmstat.numa_hint_faults
    281.50 =C2=B1 43%    +261.3%       1017 =C2=B1191%    +287.4%       109=
0 =C2=B1188%  proc-vmstat.numa_hint_faults_local
    854050 =C2=B1 15%     -68.7%     267735           +36.1%    1162734 =C2=
=B1  7%  proc-vmstat.numa_hit
      8.17 =C2=B1 90%     +46.9%      12.00 =C2=B1 80%    +104.5%      16.7=
0 =C2=B1 61%  proc-vmstat.numa_huge_pte_updates
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.numa_interleave
    853991 =C2=B1 15%     -68.7%     267685           +26.0%    1076154 =C2=
=B1  8%  proc-vmstat.numa_local
     50.67 =C2=B1 37%     +14.1%      57.83 =C2=B1 26%  +1.7e+05%      8666=
5        proc-vmstat.numa_other
      1441 =C2=B1174%     +83.0%       2638 =C2=B1147%     -45.3%     788.5=
0 =C2=B1112%  proc-vmstat.numa_pages_migrated
      8806 =C2=B1128%     +81.3%      15965 =C2=B1 85%     +79.4%      1579=
9 =C2=B1 70%  proc-vmstat.numa_pte_updates
    683.00 =C2=B1 12%    +885.7%       6732         +2989.4%      21100 =C2=
=B1  6%  proc-vmstat.pgactivate
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.pgalloc_dma32
    854034 =C2=B1 15%     -68.6%     267802           +36.5%    1165653 =C2=
=B1  7%  proc-vmstat.pgalloc_normal
    327631            +1.9%     333769            +9.3%     358214        p=
roc-vmstat.pgfault
    871818 =C2=B1 15%     -69.4%     266460           +19.4%    1041041 =C2=
=B1  8%  proc-vmstat.pgfree
      1441 =C2=B1174%     +83.0%       2638 =C2=B1147%     -45.3%     788.5=
0 =C2=B1112%  proc-vmstat.pgmigrate_success
      2760 =C2=B1 13%    +836.8%      25860            -5.2%       2616 =C2=
=B1  2%  proc-vmstat.pgpgin
     42476 =C2=B1  4%    -100.0%       0.00            -3.3%      41082 =C2=
=B1  6%  proc-vmstat.pgpgout
     18879            -3.7%      18176 =C2=B1  2%      +4.2%      19668 =C2=
=B1  2%  proc-vmstat.pgreuse
     56.00            +0.0%      56.00            -1.4%      55.20 =C2=B1  =
4%  proc-vmstat.thp_collapse_alloc
     96.00            +0.3%      96.33            +0.2%      96.20        p=
roc-vmstat.thp_deferred_split_page
     96.00            +0.3%      96.33           +12.7%     108.20        p=
roc-vmstat.thp_fault_alloc
      0.00       +1.5e+102%       1.50 =C2=B1223%   +4e+101%       0.40 =C2=
=B1300%  proc-vmstat.thp_migration_success
    192.33            +0.2%     192.67            +0.0%     192.40        p=
roc-vmstat.thp_split_pmd
      0.33 =C2=B1141%      +0.0%       0.33 =C2=B1141%    -100.0%       0.0=
0        proc-vmstat.thp_zero_page_alloc
      1.17 =C2=B1 31%     -14.3%       1.00         +1288.6%      16.20 =C2=
=B1  2%  proc-vmstat.unevictable_pgs_culled
      3.00            +0.0%       3.00            +0.0%       3.00        p=
roc-vmstat.unevictable_pgs_mlocked
      0.00         +5e+101%       0.50 =C2=B1223%   +3e+101%       0.30 =C2=
=B1300%  proc-vmstat.unevictable_pgs_munlocked
    443.00 =C2=B1 11%     -28.1%     318.33 =C2=B1 20%     -10.2%     398.0=
0 =C2=B1 26%  numa-vmstat.node0.nr_active_anon
    418.00 =C2=B1 24%    +994.2%       4573           -41.4%     244.80 =C2=
=B1 28%  numa-vmstat.node0.nr_active_file
     84388 =C2=B1  4%     -12.3%      73975 =C2=B1 17%     -18.4%      6882=
7 =C2=B1 44%  numa-vmstat.node0.nr_anon_pages
     33.17           -22.6%      25.67 =C2=B1 48%     -22.2%      25.80 =C2=
=B1 54%  numa-vmstat.node0.nr_anon_transparent_hugepages
     13.33 =C2=B1133%    -100.0%       0.00           -70.8%       3.90 =C2=
=B1 68%  numa-vmstat.node0.nr_dirtied
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-vmstat.node0.nr_dirty
    333276 =C2=B1 79%     -27.4%     242124 =C2=B1 98%      +9.0%     36312=
9 =C2=B1 74%  numa-vmstat.node0.nr_file_pages
  65358187            +0.1%   65430065            -0.1%   65262691        n=
uma-vmstat.node0.nr_free_pages
     84912 =C2=B1  4%     -11.9%      74831 =C2=B1 17%     -17.7%      6984=
1 =C2=B1 44%  numa-vmstat.node0.nr_inactive_anon
     77.00 =C2=B1 36%     -36.4%      49.00           -36.5%      48.90 =C2=
=B1 36%  numa-vmstat.node0.nr_inactive_file
      0.00       +1.7e+101%       0.17 =C2=B1223%   +2e+101%       0.20 =C2=
=B1300%  numa-vmstat.node0.nr_isolated_anon
     11879 =C2=B1  2%      -5.7%      11206 =C2=B1  2%     -11.8%      1048=
3 =C2=B1 15%  numa-vmstat.node0.nr_kernel_stack
      3736 =C2=B1 64%     -21.4%       2938 =C2=B1 85%     +68.1%       628=
0 =C2=B1 61%  numa-vmstat.node0.nr_mapped
      1.00 =C2=B1100%     -33.3%       0.67 =C2=B1141%     +20.0%       1.2=
0 =C2=B1 81%  numa-vmstat.node0.nr_mlock
      3070            -5.9%       2890 =C2=B1  8%     -20.6%       2437 =C2=
=B1 42%  numa-vmstat.node0.nr_page_table_pages
    972.00 =C2=B1  6%     +25.2%       1216 =C2=B1 74%     +47.5%       143=
4 =C2=B1 85%  numa-vmstat.node0.nr_shmem
     13651 =C2=B1 34%     -16.2%      11436 =C2=B1 41%      +3.0%      1405=
4 =C2=B1 43%  numa-vmstat.node0.nr_slab_reclaimable
     25485 =C2=B1  2%      +0.4%      25585 =C2=B1  7%      +2.6%      2613=
8 =C2=B1 15%  numa-vmstat.node0.nr_slab_unreclaimable
    331807 =C2=B1 79%     -28.8%     236283 =C2=B1100%      +8.9%     36139=
9 =C2=B1 74%  numa-vmstat.node0.nr_unevictable
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-vmstat.node0.nr_writeback
     12.50 =C2=B1141%    -100.0%       0.00           -72.0%       3.50 =C2=
=B1 66%  numa-vmstat.node0.nr_written
    443.00 =C2=B1 11%     -28.1%     318.33 =C2=B1 20%     -10.2%     398.0=
0 =C2=B1 26%  numa-vmstat.node0.nr_zone_active_anon
    418.00 =C2=B1 24%    +994.2%       4573           -41.4%     244.80 =C2=
=B1 28%  numa-vmstat.node0.nr_zone_active_file
     84912 =C2=B1  4%     -11.9%      74831 =C2=B1 17%     -17.7%      6984=
1 =C2=B1 44%  numa-vmstat.node0.nr_zone_inactive_anon
     77.00 =C2=B1 36%     -36.4%      49.00           -36.5%      48.90 =C2=
=B1 36%  numa-vmstat.node0.nr_zone_inactive_file
    331807 =C2=B1 79%     -28.8%     236283 =C2=B1100%      +8.9%     36139=
9 =C2=B1 74%  numa-vmstat.node0.nr_zone_unevictable
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-vmstat.node0.nr_zone_write_pending
   1420363 =C2=B1 20%     -18.1%    1163862 =C2=B1 20%      +3.7%    147289=
8 =C2=B1 28%  numa-vmstat.node0.numa_hit
      4098 =C2=B1  6%      -4.4%       3915 =C2=B1  6%      -4.0%       393=
4 =C2=B1  6%  numa-vmstat.node0.numa_interleave
   1413276 =C2=B1 20%     -18.1%    1156993 =C2=B1 20%      +0.0%    141329=
0 =C2=B1 28%  numa-vmstat.node0.numa_local
      7087 =C2=B1 23%      -3.1%       6871 =C2=B1 44%    +742.0%      5967=
6 =C2=B1 48%  numa-vmstat.node0.numa_other
    143.00 =C2=B1 31%     +68.8%     241.33 =C2=B1 25%   +5337.6%       777=
5 =C2=B1  7%  numa-vmstat.node1.nr_active_anon
     88.33 =C2=B1141%    -100.0%       0.00          +141.0%     212.90 =C2=
=B1 36%  numa-vmstat.node1.nr_active_file
     20168 =C2=B1 18%     +53.3%      30921 =C2=B1 41%    +123.1%      4498=
7 =C2=B1 67%  numa-vmstat.node1.nr_anon_pages
      0.00       +7.3e+102%       7.33 =C2=B1165% +1.4e+103%      13.60 =C2=
=B1105%  numa-vmstat.node1.nr_anon_transparent_hugepages
      0.00          -100.0%       0.00       +1.7e+102%       1.70 =C2=B115=
3%  numa-vmstat.node1.nr_dirtied
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-vmstat.node1.nr_dirty
    266182 =C2=B1 98%     +35.7%     361242 =C2=B1 66%      -6.6%     24856=
9 =C2=B1108%  numa-vmstat.node1.nr_file_pages
  65593348            -0.2%   65466566            -0.1%   65532062        n=
uma-vmstat.node1.nr_free_pages
     22434 =C2=B1 16%     +47.2%      33025 =C2=B1 39%    +115.8%      4842=
3 =C2=B1 64%  numa-vmstat.node1.nr_inactive_anon
     20.00 =C2=B1141%    -100.0%       0.00          +132.5%      46.50 =C2=
=B1 39%  numa-vmstat.node1.nr_inactive_file
      7880 =C2=B1  4%      +8.4%       8542 =C2=B1  4%     +18.6%       934=
2 =C2=B1 16%  numa-vmstat.node1.nr_kernel_stack
      3791 =C2=B1 63%     +19.5%       4532 =C2=B1 54%     +41.8%       537=
6 =C2=B1 72%  numa-vmstat.node1.nr_mapped
      1.00 =C2=B1100%     +33.3%       1.33 =C2=B1 70%     -20.0%       0.8=
0 =C2=B1122%  numa-vmstat.node1.nr_mlock
    881.83 =C2=B1  8%     +17.2%       1033 =C2=B1 11%     +84.6%       162=
8 =C2=B1 62%  numa-vmstat.node1.nr_page_table_pages
      2445 =C2=B1  2%      -9.5%       2214 =C2=B1 40%    +355.8%      1114=
7 =C2=B1 10%  numa-vmstat.node1.nr_shmem
     11166 =C2=B1 44%     +18.4%      13216 =C2=B1 34%      +9.3%      1220=
5 =C2=B1 49%  numa-vmstat.node1.nr_slab_reclaimable
     24260 =C2=B1  2%      +1.3%      24569 =C2=B1  7%      +3.5%      2510=
7 =C2=B1 17%  numa-vmstat.node1.nr_slab_unreclaimable
    263628 =C2=B1 99%     +36.2%     359028 =C2=B1 66%     -10.0%     23715=
9 =C2=B1113%  numa-vmstat.node1.nr_unevictable
      0.00          -100.0%       0.00       +1.4e+102%       1.40 =C2=B115=
3%  numa-vmstat.node1.nr_written
    143.00 =C2=B1 31%     +68.8%     241.33 =C2=B1 25%   +5337.6%       777=
5 =C2=B1  7%  numa-vmstat.node1.nr_zone_active_anon
     88.33 =C2=B1141%    -100.0%       0.00          +141.0%     212.90 =C2=
=B1 36%  numa-vmstat.node1.nr_zone_active_file
     22434 =C2=B1 16%     +47.2%      33025 =C2=B1 39%    +115.8%      4842=
2 =C2=B1 64%  numa-vmstat.node1.nr_zone_inactive_anon
     20.00 =C2=B1141%    -100.0%       0.00          +132.5%      46.50 =C2=
=B1 39%  numa-vmstat.node1.nr_zone_inactive_file
    263628 =C2=B1 99%     +36.2%     359028 =C2=B1 66%     -10.0%     23715=
9 =C2=B1113%  numa-vmstat.node1.nr_zone_unevictable
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-vmstat.node1.nr_zone_write_pending
   1033498 =C2=B1 26%      -3.8%     994168 =C2=B1 23%     +15.1%    118922=
3 =C2=B1 34%  numa-vmstat.node1.numa_hit
      3956 =C2=B1  6%      +3.9%       4112 =C2=B1  5%      +3.6%       409=
9 =C2=B1  6%  numa-vmstat.node1.numa_interleave
   1026957 =C2=B1 26%      -3.9%     987362 =C2=B1 23%     +12.0%    115032=
5 =C2=B1 34%  numa-vmstat.node1.numa_local
      6538 =C2=B1 25%      +4.1%       6806 =C2=B1 44%    +494.8%      3889=
4 =C2=B1 73%  numa-vmstat.node1.numa_other
      0.00          -100.0%       0.00       +1.4e+102%       1.44 =C2=B1 2=
0%  perf-stat.i.MPKI
      0.00          -100.0%       0.00       +2.3e+112%  2.297e+10        p=
erf-stat.i.branch-instructions
      0.00            +0.0        0.00            +1.0        1.03 =C2=B1  =
2%  perf-stat.i.branch-miss-rate%
      0.00          -100.0%       0.00       +2.1e+110%  2.138e+08        p=
erf-stat.i.branch-misses
      0.00            +0.0        0.00           +14.3       14.28 =C2=B1 2=
5%  perf-stat.i.cache-miss-rate%
      0.00          -100.0%       0.00       +1.9e+109%   18662679 =C2=B1 1=
9%  perf-stat.i.cache-misses
      0.00          -100.0%       0.00       +1.5e+110%  1.465e+08 =C2=B1 2=
4%  perf-stat.i.cache-references
      0.00          -100.0%       0.00       +1.6e+109%   16294613        p=
erf-stat.i.context-switches
      0.00          -100.0%       0.00       +2.2e+102%       2.19        p=
erf-stat.i.cpi
      0.00          -100.0%       0.00       +9.6e+106%      96016        p=
erf-stat.i.cpu-clock
      0.00          -100.0%       0.00       +2.5e+113%  2.482e+11        p=
erf-stat.i.cpu-cycles
      0.00          -100.0%       0.00       +3.2e+104%     319.45 =C2=B1 1=
2%  perf-stat.i.cpu-migrations
      0.00          -100.0%       0.00       +1.5e+106%      14859 =C2=B1 1=
9%  perf-stat.i.cycles-between-cache-misses
      0.00            +0.0        0.00            +0.0        0.00 =C2=B1 3=
4%  perf-stat.i.dTLB-load-miss-rate%
      0.00          -100.0%       0.00       +6.6e+107%     662655 =C2=B1 3=
2%  perf-stat.i.dTLB-load-misses
      0.00          -100.0%       0.00       +3.3e+112%  3.348e+10        p=
erf-stat.i.dTLB-loads
      0.00            +0.0        0.00            +0.0        0.01 =C2=B1 1=
4%  perf-stat.i.dTLB-store-miss-rate%
      0.00          -100.0%       0.00         +1e+108%    1015581 =C2=B1 1=
7%  perf-stat.i.dTLB-store-misses
      0.00          -100.0%       0.00       +2.1e+112%  2.133e+10        p=
erf-stat.i.dTLB-stores
      0.00            +0.0        0.00           +59.6       59.56        p=
erf-stat.i.iTLB-load-miss-rate%
      0.00          -100.0%       0.00       +1.2e+110%  1.162e+08 =C2=B1  =
2%  perf-stat.i.iTLB-load-misses
      0.00          -100.0%       0.00       +7.7e+109%   77223996        p=
erf-stat.i.iTLB-loads
      0.00          -100.0%       0.00       +1.1e+113%  1.116e+11        p=
erf-stat.i.instructions
      0.00          -100.0%       0.00       +1.1e+105%       1145 =C2=B1  =
2%  perf-stat.i.instructions-per-iTLB-miss
      0.00          -100.0%       0.00       +4.7e+101%       0.47        p=
erf-stat.i.ipc
      0.00          -100.0%       0.00       +1.2e+103%      12.18        p=
erf-stat.i.major-faults
      0.00          -100.0%       0.00       +2.6e+102%       2.59        p=
erf-stat.i.metric.GHz
      0.00          -100.0%       0.00       +1.2e+105%       1195 =C2=B1 1=
3%  perf-stat.i.metric.K/sec
      0.00          -100.0%       0.00       +8.1e+104%     811.58        p=
erf-stat.i.metric.M/sec
      0.00          -100.0%       0.00       +4.1e+105%       4145        p=
erf-stat.i.minor-faults
      0.00            +0.0        0.00           +91.8       91.80        p=
erf-stat.i.node-load-miss-rate%
      0.00          -100.0%       0.00       +2.6e+108%    2564340 =C2=B1 3=
9%  perf-stat.i.node-load-misses
      0.00          -100.0%       0.00         +2e+107%     199295 =C2=B1 3=
3%  perf-stat.i.node-loads
      0.00            +0.0        0.00           +96.8       96.78        p=
erf-stat.i.node-store-miss-rate%
      0.00          -100.0%       0.00         +4e+108%    4044206 =C2=B1 1=
0%  perf-stat.i.node-store-misses
      0.00          -100.0%       0.00       +6.8e+106%      67946 =C2=B1 1=
3%  perf-stat.i.node-stores
      0.00          -100.0%       0.00       +4.2e+105%       4157        p=
erf-stat.i.page-faults
      0.00          -100.0%       0.00       +9.6e+106%      96016        p=
erf-stat.i.task-clock
      0.00          -100.0%       0.00       +1.3e+102%       1.31 =C2=B1 2=
4%  perf-stat.overall.MPKI
      0.00            +0.0        0.00            +0.9        0.93        p=
erf-stat.overall.branch-miss-rate%
      0.00            +0.0        0.00           +13.4       13.35 =C2=B1 2=
7%  perf-stat.overall.cache-miss-rate%
      0.00          -100.0%       0.00       +2.2e+102%       2.22        p=
erf-stat.overall.cpi
      0.00          -100.0%       0.00       +1.4e+106%      13860 =C2=B1 2=
2%  perf-stat.overall.cycles-between-cache-misses
      0.00            +0.0        0.00            +0.0        0.00 =C2=B1 3=
1%  perf-stat.overall.dTLB-load-miss-rate%
      0.00            +0.0        0.00            +0.0        0.00 =C2=B1 1=
7%  perf-stat.overall.dTLB-store-miss-rate%
      0.00            +0.0        0.00           +60.1       60.06        p=
erf-stat.overall.iTLB-load-miss-rate%
      0.00          -100.0%       0.00       +9.6e+104%     961.32 =C2=B1  =
2%  perf-stat.overall.instructions-per-iTLB-miss
      0.00          -100.0%       0.00       +4.5e+101%       0.45        p=
erf-stat.overall.ipc
      0.00            +0.0        0.00           +92.3       92.31        p=
erf-stat.overall.node-load-miss-rate%
      0.00            +0.0        0.00           +98.3       98.33        p=
erf-stat.overall.node-store-miss-rate%
      0.00          -100.0%       0.00       +2.3e+112%  2.261e+10        p=
erf-stat.ps.branch-instructions
      0.00          -100.0%       0.00       +2.1e+110%  2.104e+08        p=
erf-stat.ps.branch-misses
      0.00          -100.0%       0.00       +1.8e+109%   18404867 =C2=B1 1=
9%  perf-stat.ps.cache-misses
      0.00          -100.0%       0.00       +1.4e+110%  1.441e+08 =C2=B1 2=
4%  perf-stat.ps.cache-references
      0.00          -100.0%       0.00       +1.6e+109%   16039489        p=
erf-stat.ps.context-switches
      0.00          -100.0%       0.00       +9.4e+106%      94483        p=
erf-stat.ps.cpu-clock
      0.00          -100.0%       0.00       +2.4e+113%  2.443e+11        p=
erf-stat.ps.cpu-cycles
      0.00          -100.0%       0.00       +3.2e+104%     316.14 =C2=B1 1=
3%  perf-stat.ps.cpu-migrations
      0.00          -100.0%       0.00       +6.7e+107%     666546 =C2=B1 3=
1%  perf-stat.ps.dTLB-load-misses
      0.00          -100.0%       0.00       +3.3e+112%  3.295e+10        p=
erf-stat.ps.dTLB-loads
      0.00          -100.0%       0.00         +1e+108%     998219 =C2=B1 1=
7%  perf-stat.ps.dTLB-store-misses
      0.00          -100.0%       0.00       +2.1e+112%  2.099e+10        p=
erf-stat.ps.dTLB-stores
      0.00          -100.0%       0.00       +1.1e+110%  1.144e+08 =C2=B1  =
2%  perf-stat.ps.iTLB-load-misses
      0.00          -100.0%       0.00       +7.6e+109%   76012244        p=
erf-stat.ps.iTLB-loads
      0.00          -100.0%       0.00       +1.1e+113%  1.099e+11        p=
erf-stat.ps.instructions
      0.00          -100.0%       0.00       +1.2e+103%      12.02        p=
erf-stat.ps.major-faults
      0.00          -100.0%       0.00       +4.1e+105%       4077        p=
erf-stat.ps.minor-faults
      0.00          -100.0%       0.00       +2.5e+108%    2531563 =C2=B1 3=
9%  perf-stat.ps.node-load-misses
      0.00          -100.0%       0.00         +2e+107%     198756 =C2=B1 3=
3%  perf-stat.ps.node-loads
      0.00          -100.0%       0.00         +4e+108%    3983809 =C2=B1 1=
0%  perf-stat.ps.node-store-misses
      0.00          -100.0%       0.00       +6.7e+106%      66879 =C2=B1 1=
3%  perf-stat.ps.node-stores
      0.00          -100.0%       0.00       +4.1e+105%       4089        p=
erf-stat.ps.page-faults
      0.00          -100.0%       0.00       +9.4e+106%      94483        p=
erf-stat.ps.task-clock
      0.00          -100.0%       0.00       +6.9e+114%  6.919e+12        p=
erf-stat.total.instructions
      0.00          -100.0%       0.00        +6.4e+99%       0.01 =C2=B1 6=
8%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_=
64
      0.00          -100.0%       0.00        +5.2e+99%       0.01 =C2=B110=
5%  perf-sched.sch_delay.avg.ms.do_syslog.part.0.kmsg_read.vfs_read
      0.00          -100.0%       0.00        +4.7e+99%       0.00 =C2=B115=
9%  perf-sched.sch_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sy=
s_exit_group.do_syscall_64
      0.00          -100.0%       0.00       +5.6e+100%       0.06 =C2=B115=
4%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_sysc=
all_64
      0.00          -100.0%       0.00          +1e+99%       0.00 =C2=B115=
4%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_prepare.irqentry_exit_to_=
user_mode.asm_exc_page_fault.[unknown]
      0.00          -100.0%       0.00          +3e+98%       0.00 =C2=B130=
0%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_prepare.irqentry_exit_to_=
user_mode.asm_sysvec_reschedule_ipi.[unknown]
      0.00          -100.0%       0.00        +5.2e+99%       0.01 =C2=B1 3=
7%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_prepare.syscall_exit_to_u=
ser_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00          -100.0%       0.00       +3.5e+100%       0.04 =C2=B117=
4%  perf-sched.sch_delay.avg.ms.pipe_read.new_sync_read.vfs_read.ksys_read
      0.00          -100.0%       0.00          +5e+98%       0.00 =C2=B130=
0%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.copy=
_pte_range.copy_page_range.dup_mmap
      0.00          -100.0%       0.00          +4e+98%       0.00 =C2=B130=
0%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.do_u=
ser_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00          -100.0%       0.00       +1.3e+100%       0.01 =C2=B130=
0%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.down=
_write_killable.setup_arg_pages.load_elf_binary
      0.00          -100.0%       0.00          +6e+98%       0.00 =C2=B130=
0%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.down=
_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff
      0.00          -100.0%       0.00          +3e+98%       0.00 =C2=B130=
0%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.exit=
_mmap.mmput.begin_new_exec
      0.00          -100.0%       0.00        +1.9e+99%       0.00 =C2=B110=
1%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.stop=
_one_cpu.sched_exec.bprm_execve
      0.00          -100.0%       0.00       +3.1e+101%       0.31 =C2=B129=
6%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_e=
poll_wait.__x64_sys_epoll_wait
      0.00          -100.0%       0.00         +1e+100%       0.01 =C2=B1 1=
4%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedul=
e_timeout.constprop.0.do_select
      0.00          -100.0%       0.00       +5.2e+101%       0.52 =C2=B123=
1%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_kthread.kthread.ret=
_from_fork
      0.00          -100.0%       0.00       +2.2e+100%       0.02 =C2=B111=
2%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
      0.00          -100.0%       0.00       +1.5e+101%       0.15 =C2=B1 6=
1%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork
      0.00          -100.0%       0.00        +7.5e+99%       0.01 =C2=B1 6=
9%  perf-sched.sch_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_=
64
      0.00          -100.0%       0.00        +6.5e+99%       0.01 =C2=B110=
4%  perf-sched.sch_delay.max.ms.do_syslog.part.0.kmsg_read.vfs_read
      0.00          -100.0%       0.00       +5.2e+100%       0.05 =C2=B123=
6%  perf-sched.sch_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sy=
s_exit_group.do_syscall_64
      0.00          -100.0%       0.00       +1.8e+102%       1.83 =C2=B115=
8%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_sysc=
all_64
      0.00          -100.0%       0.00          +1e+99%       0.00 =C2=B115=
4%  perf-sched.sch_delay.max.ms.exit_to_user_mode_prepare.irqentry_exit_to_=
user_mode.asm_exc_page_fault.[unknown]
      0.00          -100.0%       0.00          +3e+98%       0.00 =C2=B130=
0%  perf-sched.sch_delay.max.ms.exit_to_user_mode_prepare.irqentry_exit_to_=
user_mode.asm_sysvec_reschedule_ipi.[unknown]
      0.00          -100.0%       0.00        +7.6e+99%       0.01 =C2=B1 1=
3%  perf-sched.sch_delay.max.ms.exit_to_user_mode_prepare.syscall_exit_to_u=
ser_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00          -100.0%       0.00         +7e+101%       0.70 =C2=B119=
5%  perf-sched.sch_delay.max.ms.pipe_read.new_sync_read.vfs_read.ksys_read
      0.00          -100.0%       0.00          +5e+98%       0.00 =C2=B130=
0%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.copy=
_pte_range.copy_page_range.dup_mmap
      0.00          -100.0%       0.00          +4e+98%       0.00 =C2=B130=
0%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.do_u=
ser_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00          -100.0%       0.00       +1.3e+100%       0.01 =C2=B130=
0%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.down=
_write_killable.setup_arg_pages.load_elf_binary
      0.00          -100.0%       0.00          +6e+98%       0.00 =C2=B130=
0%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.down=
_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff
      0.00          -100.0%       0.00          +3e+98%       0.00 =C2=B130=
0%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.exit=
_mmap.mmput.begin_new_exec
      0.00          -100.0%       0.00          +2e+99%       0.00 =C2=B110=
2%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.stop=
_one_cpu.sched_exec.bprm_execve
      0.00          -100.0%       0.00       +1.9e+102%       1.87 =C2=B129=
8%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_e=
poll_wait.__x64_sys_epoll_wait
      0.00          -100.0%       0.00         +1e+100%       0.01 =C2=B1 1=
4%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.poll_schedul=
e_timeout.constprop.0.do_select
      0.00          -100.0%       0.00         +1e+102%       1.01 =C2=B120=
3%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_kthread.kthread.ret=
_from_fork
      0.00          -100.0%       0.00       +2.9e+102%       2.89 =C2=B114=
9%  perf-sched.sch_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork
      0.00          -100.0%       0.00       +3.9e+102%       3.92 =C2=B1  =
5%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork
      0.00          -100.0%       0.00       +2.7e+100%       0.03 =C2=B1 4=
6%  perf-sched.total_sch_delay.average.ms
      0.00          -100.0%       0.00       +7.5e+102%       7.46 =C2=B1 6=
4%  perf-sched.total_sch_delay.max.ms
      0.00          -100.0%       0.00       +1.1e+102%       1.10 =C2=B1 3=
9%  perf-sched.total_wait_and_delay.average.ms
      0.00          -100.0%       0.00       +4.9e+104%     487.20 =C2=B1 1=
8%  perf-sched.total_wait_and_delay.count.ms
      0.00          -100.0%       0.00       +1.6e+103%      15.87 =C2=B1 3=
1%  perf-sched.total_wait_and_delay.max.ms
      0.00          -100.0%       0.00       +1.1e+102%       1.07 =C2=B1 3=
9%  perf-sched.total_wait_time.average.ms
      0.00          -100.0%       0.00       +1.6e+103%      15.58 =C2=B1 3=
0%  perf-sched.total_wait_time.max.ms
      0.00          -100.0%       0.00         +9e+101%       0.90 =C2=B110=
0%  perf-sched.wait_and_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_sys=
call_64
      0.00          -100.0%       0.00       +7.5e+101%       0.75 =C2=B112=
2%  perf-sched.wait_and_delay.avg.ms.do_syslog.part.0.kmsg_read.vfs_read
      0.00          -100.0%       0.00       +4.3e+101%       0.43 =C2=B1 5=
3%  perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x=
64_sys_exit_group.do_syscall_64
      0.00          -100.0%       0.00       +9.8e+101%       0.98 =C2=B112=
9%  perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.get=
_signal.arch_do_signal_or_restart
      0.00          -100.0%       0.00       +4.4e+101%       0.44 =C2=B1 2=
2%  perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do=
_syscall_64
      0.00          -100.0%       0.00          +3e+98%       0.00 =C2=B130=
0%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_prepare.irqentry_exi=
t_to_user_mode.asm_exc_page_fault.[unknown]
      0.00          -100.0%       0.00       +1.1e+100%       0.01 =C2=B129=
9%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_prepare.irqentry_exi=
t_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      0.00          -100.0%       0.00        +3.3e+99%       0.00 =C2=B1 9=
2%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_prepare.syscall_exit=
_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00          -100.0%       0.00       +6.6e+101%       0.66 =C2=B1 2=
7%  perf-sched.wait_and_delay.avg.ms.pipe_read.new_sync_read.vfs_read.ksys_=
read
      0.00          -100.0%       0.00        +3.5e+99%       0.00 =C2=B130=
0%  perf-sched.wait_and_delay.avg.ms.preempt_schedule_common.__cond_resched=
.mutex_lock.perf_event_release_kernel.perf_release
      0.00          -100.0%       0.00        +1.2e+99%       0.00 =C2=B115=
2%  perf-sched.wait_and_delay.avg.ms.preempt_schedule_common.__cond_resched=
.stop_one_cpu.sched_exec.bprm_execve
      0.00          -100.0%       0.00       +7.1e+100%       0.07 =C2=B1 4=
8%  perf-sched.wait_and_delay.avg.ms.preempt_schedule_common.__cond_resched=
.wait_for_completion.affine_move_task.__set_cpus_allowed_ptr
      0.00          -100.0%       0.00       +1.7e+102%       1.69 =C2=B1 6=
8%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll=
.do_epoll_wait.__x64_sys_epoll_wait
      0.00          -100.0%       0.00          +2e+99%       0.00 =C2=B120=
4%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.poll_sc=
hedule_timeout.constprop.0.do_select
      0.00          -100.0%       0.00       +2.9e+102%       2.86 =C2=B1 4=
1%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_kthread.kthrea=
d.ret_from_fork
      0.00          -100.0%       0.00       +2.4e+102%       2.41 =C2=B1 5=
2%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
      0.00          -100.0%       0.00       +1.4e+102%       1.37 =C2=B1 3=
6%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork
      0.00          -100.0%       0.00         +1e+102%       1.00 =C2=B110=
0%  perf-sched.wait_and_delay.count.devkmsg_read.vfs_read.ksys_read.do_sysc=
all_64
      0.00          -100.0%       0.00         +8e+101%       0.80 =C2=B112=
2%  perf-sched.wait_and_delay.count.do_syslog.part.0.kmsg_read.vfs_read
      0.00          -100.0%       0.00       +3.5e+103%      35.00 =C2=B1 4=
0%  perf-sched.wait_and_delay.count.do_task_dead.do_exit.do_group_exit.__x6=
4_sys_exit_group.do_syscall_64
      0.00          -100.0%       0.00         +7e+101%       0.70 =C2=B111=
1%  perf-sched.wait_and_delay.count.do_task_dead.do_exit.do_group_exit.get_=
signal.arch_do_signal_or_restart
      0.00          -100.0%       0.00       +2.8e+103%      28.40 =C2=B1 4=
3%  perf-sched.wait_and_delay.count.do_wait.kernel_wait4.__do_sys_wait4.do_=
syscall_64
      0.00          -100.0%       0.00         +3e+101%       0.30 =C2=B121=
3%  perf-sched.wait_and_delay.count.exit_to_user_mode_prepare.irqentry_exit=
_to_user_mode.asm_exc_page_fault.[unknown]
      0.00          -100.0%       0.00         +2e+101%       0.20 =C2=B120=
0%  perf-sched.wait_and_delay.count.exit_to_user_mode_prepare.irqentry_exit=
_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      0.00          -100.0%       0.00       +1.2e+102%       1.20 =C2=B1 8=
9%  perf-sched.wait_and_delay.count.exit_to_user_mode_prepare.syscall_exit_=
to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00          -100.0%       0.00       +2.7e+103%      27.00 =C2=B1 5=
9%  perf-sched.wait_and_delay.count.pipe_read.new_sync_read.vfs_read.ksys_r=
ead
      0.00          -100.0%       0.00         +1e+101%       0.10 =C2=B130=
0%  perf-sched.wait_and_delay.count.preempt_schedule_common.__cond_resched.=
__fput.task_work_run.do_exit
      0.00          -100.0%       0.00         +1e+101%       0.10 =C2=B130=
0%  perf-sched.wait_and_delay.count.preempt_schedule_common.__cond_resched.=
do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00          -100.0%       0.00         +3e+101%       0.30 =C2=B121=
3%  perf-sched.wait_and_delay.count.preempt_schedule_common.__cond_resched.=
mutex_lock.perf_event_release_kernel.perf_release
      0.00          -100.0%       0.00         +6e+101%       0.60 =C2=B116=
9%  perf-sched.wait_and_delay.count.preempt_schedule_common.__cond_resched.=
stop_one_cpu.sched_exec.bprm_execve
      0.00          -100.0%       0.00       +1.7e+104%     169.10 =C2=B1  =
9%  perf-sched.wait_and_delay.count.preempt_schedule_common.__cond_resched.=
wait_for_completion.affine_move_task.__set_cpus_allowed_ptr
      0.00          -100.0%       0.00       +7.3e+102%       7.30 =C2=B1 4=
0%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.ep_poll.=
do_epoll_wait.__x64_sys_epoll_wait
      0.00          -100.0%       0.00         +2e+101%       0.20 =C2=B120=
0%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.poll_sch=
edule_timeout.constprop.0.do_select
      0.00          -100.0%       0.00       +3.8e+102%       3.80 =C2=B1 4=
9%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_kthread.kthread=
.ret_from_fork
      0.00          -100.0%       0.00       +1.7e+104%     170.70 =C2=B1  =
9%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork
      0.00          -100.0%       0.00       +3.5e+103%      35.30 =C2=B1 4=
4%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork
      0.00          -100.0%       0.00       +1.8e+102%       1.80 =C2=B110=
0%  perf-sched.wait_and_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_sys=
call_64
      0.00          -100.0%       0.00       +1.5e+102%       1.49 =C2=B112=
2%  perf-sched.wait_and_delay.max.ms.do_syslog.part.0.kmsg_read.vfs_read
      0.00          -100.0%       0.00       +3.5e+102%       3.53 =C2=B1 6=
2%  perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x=
64_sys_exit_group.do_syscall_64
      0.00          -100.0%       0.00       +1.1e+102%       1.13 =C2=B111=
4%  perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.do_group_exit.get=
_signal.arch_do_signal_or_restart
      0.00          -100.0%       0.00       +2.3e+102%       2.32 =C2=B111=
3%  perf-sched.wait_and_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do=
_syscall_64
      0.00          -100.0%       0.00          +3e+98%       0.00 =C2=B130=
0%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_prepare.irqentry_exi=
t_to_user_mode.asm_exc_page_fault.[unknown]
      0.00          -100.0%       0.00       +1.1e+100%       0.01 =C2=B129=
9%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_prepare.irqentry_exi=
t_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      0.00          -100.0%       0.00        +4.7e+99%       0.00 =C2=B1 8=
3%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_prepare.syscall_exit=
_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00          -100.0%       0.00       +2.3e+102%       2.33 =C2=B1 3=
3%  perf-sched.wait_and_delay.max.ms.pipe_read.new_sync_read.vfs_read.ksys_=
read
      0.00          -100.0%       0.00        +6.9e+99%       0.01 =C2=B130=
0%  perf-sched.wait_and_delay.max.ms.preempt_schedule_common.__cond_resched=
.mutex_lock.perf_event_release_kernel.perf_release
      0.00          -100.0%       0.00        +1.3e+99%       0.00 =C2=B115=
4%  perf-sched.wait_and_delay.max.ms.preempt_schedule_common.__cond_resched=
.stop_one_cpu.sched_exec.bprm_execve
      0.00          -100.0%       0.00       +6.7e+102%       6.65 =C2=B1 6=
8%  perf-sched.wait_and_delay.max.ms.preempt_schedule_common.__cond_resched=
.wait_for_completion.affine_move_task.__set_cpus_allowed_ptr
      0.00          -100.0%       0.00       +7.7e+102%       7.69 =C2=B1 7=
6%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll=
.do_epoll_wait.__x64_sys_epoll_wait
      0.00          -100.0%       0.00          +2e+99%       0.00 =C2=B120=
4%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.poll_sc=
hedule_timeout.constprop.0.do_select
      0.00          -100.0%       0.00       +4.3e+102%       4.27 =C2=B1 3=
6%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_kthread.kthrea=
d.ret_from_fork
      0.00          -100.0%       0.00       +1.4e+103%      14.21 =C2=B1 3=
0%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork
      0.00          -100.0%       0.00       +1.1e+103%      11.39 =C2=B1 5=
2%  perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_from_fork
      0.00          -100.0%       0.00       +1.2e+102%       1.22 =C2=B1 6=
6%  perf-sched.wait_time.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_=
64
      0.00          -100.0%       0.00       +9.1e+101%       0.91 =C2=B110=
0%  perf-sched.wait_time.avg.ms.do_syslog.part.0.kmsg_read.vfs_read
      0.00          -100.0%       0.00       +4.3e+101%       0.43 =C2=B1 5=
2%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sy=
s_exit_group.do_syscall_64
      0.00          -100.0%       0.00         +1e+102%       1.03 =C2=B112=
0%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.get_sign=
al.arch_do_signal_or_restart
      0.00          -100.0%       0.00       +3.8e+101%       0.38 =C2=B1  =
8%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_sysc=
all_64
      0.00          -100.0%       0.00       +1.1e+100%       0.01 =C2=B129=
9%  perf-sched.wait_time.avg.ms.exit_to_user_mode_prepare.irqentry_exit_to_=
user_mode.asm_sysvec_reschedule_ipi.[unknown]
      0.00          -100.0%       0.00          +4e+98%       0.00 =C2=B130=
0%  perf-sched.wait_time.avg.ms.exit_to_user_mode_prepare.syscall_exit_to_u=
ser_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00          -100.0%       0.00       +6.3e+101%       0.63 =C2=B1 2=
3%  perf-sched.wait_time.avg.ms.pipe_read.new_sync_read.vfs_read.ksys_read
      0.00          -100.0%       0.00        +3.6e+99%       0.00 =C2=B130=
0%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.copy=
_pte_range.copy_page_range.dup_mmap
      0.00          -100.0%       0.00          +9e+99%       0.01 =C2=B130=
0%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.mmpu=
t.do_exit.do_group_exit
      0.00          -100.0%       0.00        +3.5e+99%       0.00 =C2=B130=
0%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.mute=
x_lock.perf_event_release_kernel.perf_release
      0.00          -100.0%       0.00       +1.6e+100%       0.02 =C2=B130=
0%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.mute=
x_lock.swevent_hlist_put_cpu.sw_perf_event_destroy
      0.00          -100.0%       0.00       +7.1e+100%       0.07 =C2=B1 4=
8%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.wait=
_for_completion.affine_move_task.__set_cpus_allowed_ptr
      0.00          -100.0%       0.00       +1.4e+102%       1.37 =C2=B1 4=
9%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_e=
poll_wait.__x64_sys_epoll_wait
      0.00          -100.0%       0.00       +2.3e+102%       2.34 =C2=B1 5=
3%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_kthread.kthread.ret=
_from_fork
      0.00          -100.0%       0.00          +7e+98%       0.00 =C2=B130=
0%  perf-sched.wait_time.avg.ms.schedule_timeout.wait_for_completion.affine=
_move_task.__set_cpus_allowed_ptr
      0.00          -100.0%       0.00       +2.4e+102%       2.39 =C2=B1 5=
2%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
      0.00          -100.0%       0.00       +1.2e+102%       1.21 =C2=B1 4=
7%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork
      0.00          -100.0%       0.00       +2.4e+102%       2.44 =C2=B1 6=
6%  perf-sched.wait_time.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_=
64
      0.00          -100.0%       0.00       +1.8e+102%       1.81 =C2=B110=
0%  perf-sched.wait_time.max.ms.do_syslog.part.0.kmsg_read.vfs_read
      0.00          -100.0%       0.00       +3.5e+102%       3.53 =C2=B1 6=
2%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sy=
s_exit_group.do_syscall_64
      0.00          -100.0%       0.00       +1.2e+102%       1.21 =C2=B110=
2%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.get_sign=
al.arch_do_signal_or_restart
      0.00          -100.0%       0.00       +8.8e+101%       0.88 =C2=B1 2=
3%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_sysc=
all_64
      0.00          -100.0%       0.00       +1.1e+100%       0.01 =C2=B129=
9%  perf-sched.wait_time.max.ms.exit_to_user_mode_prepare.irqentry_exit_to_=
user_mode.asm_sysvec_reschedule_ipi.[unknown]
      0.00          -100.0%       0.00          +7e+98%       0.00 =C2=B129=
9%  perf-sched.wait_time.max.ms.exit_to_user_mode_prepare.syscall_exit_to_u=
ser_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00          -100.0%       0.00         +2e+102%       2.05 =C2=B1 2=
7%  perf-sched.wait_time.max.ms.pipe_read.new_sync_read.vfs_read.ksys_read
      0.00          -100.0%       0.00        +3.6e+99%       0.00 =C2=B130=
0%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.copy=
_pte_range.copy_page_range.dup_mmap
      0.00          -100.0%       0.00          +9e+99%       0.01 =C2=B130=
0%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.mmpu=
t.do_exit.do_group_exit
      0.00          -100.0%       0.00        +6.9e+99%       0.01 =C2=B130=
0%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.mute=
x_lock.perf_event_release_kernel.perf_release
      0.00          -100.0%       0.00       +1.6e+100%       0.02 =C2=B130=
0%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.mute=
x_lock.swevent_hlist_put_cpu.sw_perf_event_destroy
      0.00          -100.0%       0.00       +6.7e+102%       6.65 =C2=B1 6=
8%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.wait=
_for_completion.affine_move_task.__set_cpus_allowed_ptr
      0.00          -100.0%       0.00       +6.3e+102%       6.31 =C2=B1 7=
3%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_e=
poll_wait.__x64_sys_epoll_wait
      0.00          -100.0%       0.00       +3.8e+102%       3.77 =C2=B1 5=
1%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_kthread.kthread.ret=
_from_fork
      0.00          -100.0%       0.00          +7e+98%       0.00 =C2=B130=
0%  perf-sched.wait_time.max.ms.schedule_timeout.wait_for_completion.affine=
_move_task.__set_cpus_allowed_ptr
      0.00          -100.0%       0.00       +1.4e+103%      13.85 =C2=B1 2=
9%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork
      0.00          -100.0%       0.00       +1.1e+103%      10.89 =C2=B1 6=
1%  perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fork
    194162            -0.0%     194101            -0.0%     194097        s=
labinfo.Acpi-Operand.active_objs
      3467            -0.0%       3466            -0.0%       3466        s=
labinfo.Acpi-Operand.active_slabs
    194180            -0.0%     194105            -0.0%     194103        s=
labinfo.Acpi-Operand.num_objs
      3467            -0.0%       3466            -0.0%       3466        s=
labinfo.Acpi-Operand.num_slabs
      1345 =C2=B1  5%      +8.0%       1452 =C2=B1  4%      -5.4%       127=
3 =C2=B1  7%  slabinfo.Acpi-Parse.active_objs
     17.50 =C2=B1  5%      +8.6%      19.00 =C2=B1  5%      -4.6%      16.7=
0 =C2=B1  6%  slabinfo.Acpi-Parse.active_slabs
      1345 =C2=B1  5%      +8.0%       1452 =C2=B1  4%      -5.4%       127=
3 =C2=B1  7%  slabinfo.Acpi-Parse.num_objs
     17.50 =C2=B1  5%      +8.6%      19.00 =C2=B1  5%      -4.6%      16.7=
0 =C2=B1  6%  slabinfo.Acpi-Parse.num_slabs
      4941            -0.4%       4919            +0.1%       4946        s=
labinfo.Acpi-State.active_objs
     96.33            -0.3%      96.00            +0.2%      96.50        s=
labinfo.Acpi-State.active_slabs
      4941            -0.4%       4919            +0.1%       4946        s=
labinfo.Acpi-State.num_objs
     96.33            -0.3%      96.00            +0.2%      96.50        s=
labinfo.Acpi-State.num_slabs
    192.00            +0.0%     192.00            +0.0%     192.00        s=
labinfo.RAW.active_objs
      6.00            +0.0%       6.00            +0.0%       6.00        s=
labinfo.RAW.active_slabs
    192.00            +0.0%     192.00            +0.0%     192.00        s=
labinfo.RAW.num_objs
      6.00            +0.0%       6.00            +0.0%       6.00        s=
labinfo.RAW.num_slabs
    104.00            +0.0%     104.00            +0.0%     104.00        s=
labinfo.RAWv6.active_objs
      4.00            +0.0%       4.00            +0.0%       4.00        s=
labinfo.RAWv6.active_slabs
    104.00            +0.0%     104.00            +0.0%     104.00        s=
labinfo.RAWv6.num_objs
      4.00            +0.0%       4.00            +0.0%       4.00        s=
labinfo.RAWv6.num_slabs
     63.67 =C2=B1  8%      +3.7%      66.00            +2.3%      65.10 =C2=
=B1  4%  slabinfo.TCP.active_objs
      3.83 =C2=B1  9%      +4.3%       4.00            +4.3%       4.00    =
    slabinfo.TCP.active_slabs
     63.67 =C2=B1  8%      +3.7%      66.00            +2.3%      65.10 =C2=
=B1  4%  slabinfo.TCP.num_objs
      3.83 =C2=B1  9%      +4.3%       4.00            +4.3%       4.00    =
    slabinfo.TCP.num_slabs
     39.00            -5.6%      36.83 =C2=B1 13%      +0.0%      39.00    =
    slabinfo.TCPv6.active_objs
      3.00            -5.6%       2.83 =C2=B1 13%      +0.0%       3.00    =
    slabinfo.TCPv6.active_slabs
     39.00            -5.6%      36.83 =C2=B1 13%      +0.0%      39.00    =
    slabinfo.TCPv6.num_objs
      3.00            -5.6%       2.83 =C2=B1 13%      +0.0%       3.00    =
    slabinfo.TCPv6.num_slabs
    120.00 =C2=B1 11%     +20.0%     144.00            +4.0%     124.80 =C2=
=B1 11%  slabinfo.UDPv6.active_objs
      5.00 =C2=B1 11%     +20.0%       6.00            +4.0%       5.20 =C2=
=B1 11%  slabinfo.UDPv6.active_slabs
    120.00 =C2=B1 11%     +20.0%     144.00            +4.0%     124.80 =C2=
=B1 11%  slabinfo.UDPv6.num_objs
      5.00 =C2=B1 11%     +20.0%       6.00            +4.0%       5.20 =C2=
=B1 11%  slabinfo.UDPv6.num_slabs
      2057 =C2=B1  7%      +2.3%       2104 =C2=B1  7%      -4.8%       195=
8 =C2=B1 16%  slabinfo.UNIX.active_objs
     68.00 =C2=B1  7%      +2.2%      69.50 =C2=B1  7%      -4.3%      65.1=
0 =C2=B1 16%  slabinfo.UNIX.active_slabs
      2057 =C2=B1  7%      +2.3%       2104 =C2=B1  7%      -4.8%       195=
8 =C2=B1 16%  slabinfo.UNIX.num_objs
     68.00 =C2=B1  7%      +2.2%      69.50 =C2=B1  7%      -4.3%      65.1=
0 =C2=B1 16%  slabinfo.UNIX.num_slabs
     29264 =C2=B1  2%      +2.7%      30040 =C2=B1  2%      +1.6%      2972=
7 =C2=B1  4%  slabinfo.anon_vma.active_objs
    635.50 =C2=B1  2%      +2.7%     652.50 =C2=B1  2%      +1.6%     645.8=
0 =C2=B1  4%  slabinfo.anon_vma.active_slabs
     29264 =C2=B1  2%      +2.7%      30043 =C2=B1  2%      +1.6%      2972=
9 =C2=B1  4%  slabinfo.anon_vma.num_objs
    635.50 =C2=B1  2%      +2.7%     652.50 =C2=B1  2%      +1.6%     645.8=
0 =C2=B1  4%  slabinfo.anon_vma.num_slabs
     67046 =C2=B1  4%      -0.6%      66630 =C2=B1  3%      +3.7%      6953=
4 =C2=B1  9%  slabinfo.anon_vma_chain.active_objs
      1047 =C2=B1  4%      -0.7%       1040 =C2=B1  3%      +3.7%       108=
7 =C2=B1  9%  slabinfo.anon_vma_chain.active_slabs
     67081 =C2=B1  4%      -0.7%      66645 =C2=B1  3%      +3.8%      6959=
8 =C2=B1  9%  slabinfo.anon_vma_chain.num_objs
      1047 =C2=B1  4%      -0.7%       1040 =C2=B1  3%      +3.7%       108=
7 =C2=B1  9%  slabinfo.anon_vma_chain.num_slabs
    119.00 =C2=B1 13%     +11.8%     133.00 =C2=B1 11%      +2.4%     121.8=
0 =C2=B1 10%  slabinfo.bdev_cache.active_objs
      5.67 =C2=B1 13%     +11.8%       6.33 =C2=B1 11%      +2.4%       5.8=
0 =C2=B1 10%  slabinfo.bdev_cache.active_slabs
    119.00 =C2=B1 13%     +11.8%     133.00 =C2=B1 11%      +2.4%     121.8=
0 =C2=B1 10%  slabinfo.bdev_cache.num_objs
      5.67 =C2=B1 13%     +11.8%       6.33 =C2=B1 11%      +2.4%       5.8=
0 =C2=B1 10%  slabinfo.bdev_cache.num_slabs
    114.33 =C2=B1 19%     -19.2%      92.33 =C2=B1 18%     -15.8%      96.3=
0 =C2=B1 20%  slabinfo.biovec-128.active_objs
      6.33 =C2=B1 23%     -23.7%       4.83 =C2=B1 22%     -17.9%       5.2=
0 =C2=B1 24%  slabinfo.biovec-128.active_slabs
    114.33 =C2=B1 19%     -19.2%      92.33 =C2=B1 18%     -15.8%      96.3=
0 =C2=B1 20%  slabinfo.biovec-128.num_objs
      6.33 =C2=B1 23%     -23.7%       4.83 =C2=B1 22%     -17.9%       5.2=
0 =C2=B1 24%  slabinfo.biovec-128.num_slabs
    258.67 =C2=B1  8%      +0.6%     260.33 =C2=B1 11%      +9.2%     282.4=
0 =C2=B1 12%  slabinfo.biovec-64.active_objs
      7.17 =C2=B1  9%      +0.0%       7.17 =C2=B1 12%     +10.2%       7.9=
0 =C2=B1 14%  slabinfo.biovec-64.active_slabs
    258.67 =C2=B1  8%      +0.6%     260.33 =C2=B1 11%      +9.2%     282.4=
0 =C2=B1 12%  slabinfo.biovec-64.num_objs
      7.17 =C2=B1  9%      +0.0%       7.17 =C2=B1 12%     +10.2%       7.9=
0 =C2=B1 14%  slabinfo.biovec-64.num_slabs
     85.00 =C2=B1  5%      -0.8%      84.33 =C2=B1  4%      -6.7%      79.3=
0 =C2=B1  8%  slabinfo.biovec-max.active_objs
      9.83 =C2=B1  6%      -1.7%       9.67 =C2=B1  4%      -7.5%       9.1=
0 =C2=B1 10%  slabinfo.biovec-max.active_slabs
     85.00 =C2=B1  5%      -0.8%      84.33 =C2=B1  4%      -6.7%      79.3=
0 =C2=B1  8%  slabinfo.biovec-max.num_objs
      9.83 =C2=B1  6%      -1.7%       9.67 =C2=B1  4%      -7.5%       9.1=
0 =C2=B1 10%  slabinfo.biovec-max.num_slabs
     56.00            +0.0%      56.00            +0.0%      56.00        s=
labinfo.btrfs_extent_map.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.btrfs_extent_map.active_slabs
     56.00            +0.0%      56.00            +0.0%      56.00        s=
labinfo.btrfs_extent_map.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.btrfs_extent_map.num_slabs
    107.33 =C2=B1  9%     -13.0%      93.33 =C2=B1 22%      -3.5%     103.6=
0 =C2=B1 12%  slabinfo.btrfs_inode.active_objs
      3.83 =C2=B1  9%     -13.0%       3.33 =C2=B1 22%      -3.5%       3.7=
0 =C2=B1 12%  slabinfo.btrfs_inode.active_slabs
    107.33 =C2=B1  9%     -13.0%      93.33 =C2=B1 22%      -3.5%     103.6=
0 =C2=B1 12%  slabinfo.btrfs_inode.num_objs
      3.83 =C2=B1  9%     -13.0%       3.33 =C2=B1 22%      -3.5%       3.7=
0 =C2=B1 12%  slabinfo.btrfs_inode.num_slabs
    720.33 =C2=B1 13%     -74.1%     186.50 =C2=B1  7%      -6.2%     675.8=
0 =C2=B1  3%  slabinfo.buffer_head.active_objs
     18.00 =C2=B1 12%     -78.7%       3.83 =C2=B1  9%      -6.7%      16.8=
0 =C2=B1  4%  slabinfo.buffer_head.active_slabs
    720.33 =C2=B1 13%     -74.1%     186.50 =C2=B1  7%      -6.2%     675.8=
0 =C2=B1  3%  slabinfo.buffer_head.num_objs
     18.00 =C2=B1 12%     -78.7%       3.83 =C2=B1  9%      -6.7%      16.8=
0 =C2=B1  4%  slabinfo.buffer_head.num_slabs
      6613 =C2=B1  4%      +4.0%       6877 =C2=B1  3%      +4.9%       693=
5 =C2=B1  4%  slabinfo.cred_jar.active_objs
    156.83 =C2=B1  4%      +4.0%     163.17 =C2=B1  3%      +5.0%     164.7=
0 =C2=B1  4%  slabinfo.cred_jar.active_slabs
      6613 =C2=B1  4%      +4.0%       6877 =C2=B1  3%      +4.9%       693=
5 =C2=B1  4%  slabinfo.cred_jar.num_objs
    156.83 =C2=B1  4%      +4.0%     163.17 =C2=B1  3%      +5.0%     164.7=
0 =C2=B1  4%  slabinfo.cred_jar.num_slabs
     42.00            +0.0%      42.00            +0.0%      42.00        s=
labinfo.dax_cache.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dax_cache.active_slabs
     42.00            +0.0%      42.00            +0.0%      42.00        s=
labinfo.dax_cache.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dax_cache.num_slabs
    123596 =C2=B1  2%      +0.3%     123967            +8.4%     133929 =C2=
=B1  4%  slabinfo.dentry.active_objs
      2944 =C2=B1  2%      +0.7%       2964            +8.8%       3204 =C2=
=B1  4%  slabinfo.dentry.active_slabs
    123706 =C2=B1  2%      +0.7%     124539            +8.8%     134618 =C2=
=B1  4%  slabinfo.dentry.num_objs
      2944 =C2=B1  2%      +0.7%       2964            +8.8%       3204 =C2=
=B1  4%  slabinfo.dentry.num_slabs
     30.00            +0.0%      30.00            +0.0%      30.00        s=
labinfo.dmaengine-unmap-128.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dmaengine-unmap-128.active_slabs
     30.00            +0.0%      30.00            +0.0%      30.00        s=
labinfo.dmaengine-unmap-128.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dmaengine-unmap-128.num_slabs
     15.00            +0.0%      15.00            +0.0%      15.00        s=
labinfo.dmaengine-unmap-256.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dmaengine-unmap-256.active_slabs
     15.00            +0.0%      15.00            +0.0%      15.00        s=
labinfo.dmaengine-unmap-256.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dmaengine-unmap-256.num_slabs
     50.50 =C2=B1 32%    -100.0%       0.00           -28.3%      36.20 =C2=
=B1 30%  slabinfo.dquot.active_objs
      0.83 =C2=B1 82%    -100.0%       0.00           -64.0%       0.30 =C2=
=B1152%  slabinfo.dquot.active_slabs
     50.50 =C2=B1 32%    -100.0%       0.00           -28.3%      36.20 =C2=
=B1 30%  slabinfo.dquot.num_objs
      0.83 =C2=B1 82%    -100.0%       0.00           -64.0%       0.30 =C2=
=B1152%  slabinfo.dquot.num_slabs
     21888 =C2=B1  5%      +0.2%      21930 =C2=B1 10%      -1.1%      2165=
7 =C2=B1 10%  slabinfo.ep_head.active_objs
     85.50 =C2=B1  5%      +0.2%      85.67 =C2=B1 10%      -1.1%      84.6=
0 =C2=B1 10%  slabinfo.ep_head.active_slabs
     21888 =C2=B1  5%      +0.2%      21930 =C2=B1 10%      -1.1%      2165=
7 =C2=B1 10%  slabinfo.ep_head.num_objs
     85.50 =C2=B1  5%      +0.2%      85.67 =C2=B1 10%      -1.1%      84.6=
0 =C2=B1 10%  slabinfo.ep_head.num_slabs
    197.00          -100.0%       0.00            +0.0%     197.00        s=
labinfo.ext4_extent_status.active_objs
      1.00          -100.0%       0.00            +0.0%       1.00        s=
labinfo.ext4_extent_status.active_slabs
    197.00          -100.0%       0.00            +0.0%     197.00        s=
labinfo.ext4_extent_status.num_objs
      1.00          -100.0%       0.00            +0.0%       1.00        s=
labinfo.ext4_extent_status.num_slabs
      3904          -100.0%       0.00            +0.0%       3904        s=
labinfo.ext4_groupinfo_4k.active_objs
     92.17          -100.0%       0.00            -0.1%      92.10        s=
labinfo.ext4_groupinfo_4k.active_slabs
      3904          -100.0%       0.00            +0.0%       3904        s=
labinfo.ext4_groupinfo_4k.num_objs
     92.17          -100.0%       0.00            -0.1%      92.10        s=
labinfo.ext4_groupinfo_4k.num_slabs
     27.00          -100.0%       0.00            +0.0%      27.00        s=
labinfo.ext4_inode_cache.active_objs
      0.00          -100.0%       0.00          -100.0%       0.00        s=
labinfo.ext4_inode_cache.active_slabs
     27.00          -100.0%       0.00            +0.0%      27.00        s=
labinfo.ext4_inode_cache.num_objs
      0.00          -100.0%       0.00          -100.0%       0.00        s=
labinfo.ext4_inode_cache.num_slabs
     20.50 =C2=B1223%    +504.9%     124.00          -100.0%       0.00    =
    slabinfo.ext4_pending_reservation.active_objs
      0.00          -100.0%       0.00          -100.0%       0.00        s=
labinfo.ext4_pending_reservation.active_slabs
     20.50 =C2=B1223%    +504.9%     124.00          -100.0%       0.00    =
    slabinfo.ext4_pending_reservation.num_objs
      0.00          -100.0%       0.00          -100.0%       0.00        s=
labinfo.ext4_pending_reservation.num_slabs
    296.00          -100.0%       0.00            +0.0%     296.00        s=
labinfo.ext4_system_zone.active_objs
      2.00          -100.0%       0.00            +0.0%       2.00        s=
labinfo.ext4_system_zone.active_slabs
    296.00          -100.0%       0.00            +0.0%     296.00        s=
labinfo.ext4_system_zone.num_objs
      2.00          -100.0%       0.00            +0.0%       2.00        s=
labinfo.ext4_system_zone.num_slabs
      0.00       +3.6e+105%       3623          -100.0%       0.00        s=
labinfo.f2fs_free_nid.active_objs
      0.00       +2.1e+103%      21.00          -100.0%       0.00        s=
labinfo.f2fs_free_nid.active_slabs
      0.00       +3.6e+105%       3623          -100.0%       0.00        s=
labinfo.f2fs_free_nid.num_objs
      0.00       +2.1e+103%      21.00          -100.0%       0.00        s=
labinfo.f2fs_free_nid.num_slabs
      0.00       +2.7e+103%      27.00          -100.0%       0.00        s=
labinfo.f2fs_inode_cache.active_objs
      0.00          -100.0%       0.00          -100.0%       0.00        s=
labinfo.f2fs_inode_cache.active_slabs
      0.00       +2.7e+103%      27.00          -100.0%       0.00        s=
labinfo.f2fs_inode_cache.num_objs
      0.00          -100.0%       0.00          -100.0%       0.00        s=
labinfo.f2fs_inode_cache.num_slabs
    936.33 =C2=B1  7%      -5.9%     881.50 =C2=B1  6%      +5.3%     985.5=
0 =C2=B1 11%  slabinfo.file_lock_cache.active_objs
     25.00 =C2=B1  9%      -6.7%      23.33 =C2=B1  7%      +3.6%      25.9=
0 =C2=B1 12%  slabinfo.file_lock_cache.active_slabs
    936.33 =C2=B1  7%      -5.9%     881.50 =C2=B1  6%      +5.3%     985.5=
0 =C2=B1 11%  slabinfo.file_lock_cache.num_objs
     25.00 =C2=B1  9%      -6.7%      23.33 =C2=B1  7%      +3.6%      25.9=
0 =C2=B1 12%  slabinfo.file_lock_cache.num_slabs
      4524            -3.1%       4385 =C2=B1  3%      +1.2%       4579 =C2=
=B1  2%  slabinfo.files_cache.active_objs
     97.67            -2.7%      95.00 =C2=B1  3%      +1.4%      99.00 =C2=
=B1  2%  slabinfo.files_cache.active_slabs
      4524            -3.1%       4385 =C2=B1  3%      +1.2%       4579 =C2=
=B1  2%  slabinfo.files_cache.num_objs
     97.67            -2.7%      95.00 =C2=B1  3%      +1.4%      99.00 =C2=
=B1  2%  slabinfo.files_cache.num_slabs
     28568 =C2=B1  2%      +0.7%      28772 =C2=B1  5%      +0.4%      2867=
4 =C2=B1  4%  slabinfo.filp.active_objs
    896.33 =C2=B1  2%      +1.4%     908.50 =C2=B1  5%      +1.2%     907.2=
0 =C2=B1  4%  slabinfo.filp.active_slabs
     28694 =C2=B1  2%      +1.4%      29082 =C2=B1  5%      +1.2%      2904=
2 =C2=B1  4%  slabinfo.filp.num_objs
    896.33 =C2=B1  2%      +1.4%     908.50 =C2=B1  5%      +1.2%     907.2=
0 =C2=B1  4%  slabinfo.filp.num_slabs
      2709 =C2=B1  6%      +0.8%       2730 =C2=B1  9%     -12.1%       238=
0 =C2=B1 13%  slabinfo.fsnotify_mark_connector.active_objs
     21.17 =C2=B1  6%      +0.8%      21.33 =C2=B1  9%     -12.1%      18.6=
0 =C2=B1 13%  slabinfo.fsnotify_mark_connector.active_slabs
      2709 =C2=B1  6%      +0.8%       2730 =C2=B1  9%     -12.1%       238=
0 =C2=B1 13%  slabinfo.fsnotify_mark_connector.num_objs
     21.17 =C2=B1  6%      +0.8%      21.33 =C2=B1  9%     -12.1%      18.6=
0 =C2=B1 13%  slabinfo.fsnotify_mark_connector.num_slabs
     35895            +0.4%      36028            +0.3%      36005        s=
labinfo.ftrace_event_field.active_objs
    421.83            +0.4%     423.50            +0.3%     423.20        s=
labinfo.ftrace_event_field.active_slabs
     35895            +0.4%      36028            +0.3%      36005        s=
labinfo.ftrace_event_field.num_objs
    421.83            +0.4%     423.50            +0.3%     423.20        s=
labinfo.ftrace_event_field.num_slabs
    106.00            -8.3%      97.17 =C2=B1 20%      -5.0%     100.70 =C2=
=B1 15%  slabinfo.hugetlbfs_inode_cache.active_objs
      2.00            -8.3%       1.83 =C2=B1 20%      -5.0%       1.90 =C2=
=B1 15%  slabinfo.hugetlbfs_inode_cache.active_slabs
    106.00            -8.3%      97.17 =C2=B1 20%      -5.0%     100.70 =C2=
=B1 15%  slabinfo.hugetlbfs_inode_cache.num_objs
      2.00            -8.3%       1.83 =C2=B1 20%      -5.0%       1.90 =C2=
=B1 15%  slabinfo.hugetlbfs_inode_cache.num_slabs
     82984            +0.2%      83190            +2.0%      84625        s=
labinfo.inode_cache.active_objs
      1508            +0.3%       1512            +2.1%       1540        s=
labinfo.inode_cache.active_slabs
     82985            +0.2%      83191            +2.1%      84739        s=
labinfo.inode_cache.num_objs
      1508            +0.3%       1512            +2.1%       1540        s=
labinfo.inode_cache.num_slabs
     33.00 =C2=B1 10%    -100.0%       0.00            -1.2%      32.60 =C2=
=B1 18%  slabinfo.jbd2_journal_head.active_objs
      0.17 =C2=B1223%    -100.0%       0.00           -40.0%       0.10 =C2=
=B1300%  slabinfo.jbd2_journal_head.active_slabs
     33.00 =C2=B1 10%    -100.0%       0.00            -1.2%      32.60 =C2=
=B1 18%  slabinfo.jbd2_journal_head.num_objs
      0.17 =C2=B1223%    -100.0%       0.00           -40.0%       0.10 =C2=
=B1300%  slabinfo.jbd2_journal_head.num_slabs
    247.17          -100.0%       0.00            -0.0%     247.10        s=
labinfo.jbd2_revoke_table_s.active_objs
      0.00          -100.0%       0.00          -100.0%       0.00        s=
labinfo.jbd2_revoke_table_s.active_slabs
    247.17          -100.0%       0.00            -0.0%     247.10        s=
labinfo.jbd2_revoke_table_s.num_objs
      0.00          -100.0%       0.00          -100.0%       0.00        s=
labinfo.jbd2_revoke_table_s.num_slabs
     87955            +0.4%      88296            +0.0%      87975        s=
labinfo.kernfs_node_cache.active_objs
      2747            +0.4%       2758            +0.0%       2748        s=
labinfo.kernfs_node_cache.active_slabs
     87955            +0.4%      88296            +0.0%      87975        s=
labinfo.kernfs_node_cache.num_objs
      2747            +0.4%       2758            +0.0%       2748        s=
labinfo.kernfs_node_cache.num_slabs
      2585 =C2=B1  2%      +5.3%       2721 =C2=B1  4%      +6.2%       274=
6 =C2=B1  4%  slabinfo.khugepaged_mm_slot.active_objs
     71.33 =C2=B1  2%      +5.4%      75.17 =C2=B1  4%      +6.4%      75.9=
0 =C2=B1  4%  slabinfo.khugepaged_mm_slot.active_slabs
      2585 =C2=B1  2%      +5.3%       2721 =C2=B1  4%      +6.2%       274=
6 =C2=B1  4%  slabinfo.khugepaged_mm_slot.num_objs
     71.33 =C2=B1  2%      +5.4%      75.17 =C2=B1  4%      +6.4%      75.9=
0 =C2=B1  4%  slabinfo.khugepaged_mm_slot.num_slabs
      5302            -0.0%       5302            +0.5%       5331        s=
labinfo.kmalloc-128.active_objs
    165.83            +0.6%     166.83            +0.7%     167.00        s=
labinfo.kmalloc-128.active_slabs
      5320            +0.4%       5338            +0.7%       5355        s=
labinfo.kmalloc-128.num_objs
    165.83            +0.6%     166.83            +0.7%     167.00        s=
labinfo.kmalloc-128.num_slabs
     36541            -0.7%      36296            -0.1%      36514        s=
labinfo.kmalloc-16.active_objs
    141.83            +0.0%     141.83            -0.1%     141.70        s=
labinfo.kmalloc-16.active_slabs
     36556            -0.7%      36309            -0.1%      36521        s=
labinfo.kmalloc-16.num_objs
    141.83            +0.0%     141.83            -0.1%     141.70        s=
labinfo.kmalloc-16.num_slabs
      5458            +0.0%       5460            +0.5%       5488        s=
labinfo.kmalloc-192.active_objs
    133.17            -0.3%     132.83            +0.0%     133.20        s=
labinfo.kmalloc-192.active_slabs
      5593            -0.3%       5579            +0.0%       5594        s=
labinfo.kmalloc-192.num_objs
    133.17            -0.3%     132.83            +0.0%     133.20        s=
labinfo.kmalloc-192.num_slabs
      5422 =C2=B1  2%      -0.9%       5371 =C2=B1  2%      -0.6%       539=
2        slabinfo.kmalloc-1k.active_objs
    169.83 =C2=B1  2%      -1.2%     167.83 =C2=B1  2%      -0.6%     168.8=
0        slabinfo.kmalloc-1k.active_slabs
      5441 =C2=B1  3%      -1.1%       5381            -0.6%       5410    =
    slabinfo.kmalloc-1k.num_objs
    169.83 =C2=B1  2%      -1.2%     167.83 =C2=B1  2%      -0.6%     168.8=
0        slabinfo.kmalloc-1k.num_slabs
      9422 =C2=B1  4%      +4.9%       9886 =C2=B1  4%      +5.1%       990=
4 =C2=B1  6%  slabinfo.kmalloc-256.active_objs
    294.33 =C2=B1  4%      +4.8%     308.33 =C2=B1  4%      +5.1%     309.4=
0 =C2=B1  6%  slabinfo.kmalloc-256.active_slabs
      9429 =C2=B1  4%      +4.9%       9887 =C2=B1  4%      +5.1%       991=
2 =C2=B1  6%  slabinfo.kmalloc-256.num_objs
    294.33 =C2=B1  4%      +4.8%     308.33 =C2=B1  4%      +5.1%     309.4=
0 =C2=B1  6%  slabinfo.kmalloc-256.num_slabs
      5257 =C2=B1  2%      -1.9%       5158 =C2=B1  3%      +0.2%       526=
8 =C2=B1  4%  slabinfo.kmalloc-2k.active_objs
    329.00 =C2=B1  2%      -1.9%     322.67 =C2=B1  3%      +0.7%     331.2=
0 =C2=B1  4%  slabinfo.kmalloc-2k.active_slabs
      5275 =C2=B1  2%      -2.0%       5171 =C2=B1  3%      +0.5%       530=
4 =C2=B1  4%  slabinfo.kmalloc-2k.num_objs
    329.00 =C2=B1  2%      -1.9%     322.67 =C2=B1  3%      +0.7%     331.2=
0 =C2=B1  4%  slabinfo.kmalloc-2k.num_slabs
     70964            +1.3%      71893            +1.2%      71847        s=
labinfo.kmalloc-32.active_objs
    555.00            +1.2%     561.83            +1.2%     561.40        s=
labinfo.kmalloc-32.active_slabs
     71138            +1.2%      72017            +1.1%      71948        s=
labinfo.kmalloc-32.num_objs
    555.00            +1.2%     561.83            +1.2%     561.40        s=
labinfo.kmalloc-32.num_slabs
      1753            +0.8%       1767            +9.0%       1911        s=
labinfo.kmalloc-4k.active_objs
    220.33            +0.3%     221.00            +9.6%     241.50        s=
labinfo.kmalloc-4k.active_slabs
      1762            +0.7%       1775            +9.8%       1935        s=
labinfo.kmalloc-4k.num_objs
    220.33            +0.3%     221.00            +9.6%     241.50        s=
labinfo.kmalloc-4k.num_slabs
     15439 =C2=B1  2%      +1.9%      15733 =C2=B1  4%      +5.2%      1624=
7 =C2=B1  3%  slabinfo.kmalloc-512.active_objs
    482.67 =C2=B1  2%      +2.0%     492.50 =C2=B1  4%      +5.2%     507.8=
0 =C2=B1  3%  slabinfo.kmalloc-512.active_slabs
     15459 =C2=B1  2%      +2.1%      15783 =C2=B1  4%      +5.2%      1626=
3 =C2=B1  3%  slabinfo.kmalloc-512.num_objs
    482.67 =C2=B1  2%      +2.0%     492.50 =C2=B1  4%      +5.2%     507.8=
0 =C2=B1  3%  slabinfo.kmalloc-512.num_slabs
     49505           +50.6%      74578            +0.6%      49811        s=
labinfo.kmalloc-64.active_objs
    777.17           +50.4%       1169            +0.5%     780.70        s=
labinfo.kmalloc-64.active_slabs
     49774           +50.4%      74856            +0.5%      50006        s=
labinfo.kmalloc-64.num_objs
    777.17           +50.4%       1169            +0.5%     780.70        s=
labinfo.kmalloc-64.num_slabs
     53803            -0.3%      53661            -0.5%      53516        s=
labinfo.kmalloc-8.active_objs
    108.00            -0.2%     107.83            -0.3%     107.70        s=
labinfo.kmalloc-8.active_slabs
     55517            -0.6%      55210            -0.6%      55201        s=
labinfo.kmalloc-8.num_objs
    108.00            -0.2%     107.83            -0.3%     107.70        s=
labinfo.kmalloc-8.num_slabs
    718.00            +0.5%     721.33           +13.9%     817.50        s=
labinfo.kmalloc-8k.active_objs
    179.50            +0.5%     180.33           +13.7%     204.10        s=
labinfo.kmalloc-8k.active_slabs
    718.00            +0.5%     721.33           +14.0%     818.40        s=
labinfo.kmalloc-8k.num_objs
    179.50            +0.5%     180.33           +13.7%     204.10        s=
labinfo.kmalloc-8k.num_slabs
      7834            -0.3%       7809 =C2=B1  4%      -0.6%       7785 =C2=
=B1  3%  slabinfo.kmalloc-96.active_objs
    188.17 =C2=B1  2%      -0.5%     187.17 =C2=B1  4%      -0.7%     186.9=
0 =C2=B1  3%  slabinfo.kmalloc-96.active_slabs
      7936 =C2=B1  2%      -0.7%       7883 =C2=B1  4%      -0.8%       787=
3 =C2=B1  3%  slabinfo.kmalloc-96.num_objs
    188.17 =C2=B1  2%      -0.5%     187.17 =C2=B1  4%      -0.7%     186.9=
0 =C2=B1  3%  slabinfo.kmalloc-96.num_slabs
    292.50 =C2=B1 27%      +4.6%     306.00 =C2=B1 36%      -4.2%     280.3=
0 =C2=B1 21%  slabinfo.kmalloc-cg-16.active_objs
      1.00           +16.7%       1.17 =C2=B1 31%      +0.0%       1.00    =
    slabinfo.kmalloc-cg-16.active_slabs
    292.50 =C2=B1 27%      +4.6%     306.00 =C2=B1 36%      -4.2%     280.3=
0 =C2=B1 21%  slabinfo.kmalloc-cg-16.num_objs
      1.00           +16.7%       1.17 =C2=B1 31%      +0.0%       1.00    =
    slabinfo.kmalloc-cg-16.num_slabs
      3734            -4.0%       3585 =C2=B1  3%      +1.4%       3787 =C2=
=B1  4%  slabinfo.kmalloc-cg-192.active_objs
     88.33            -3.8%      85.00 =C2=B1  3%      +1.5%      89.70 =C2=
=B1  4%  slabinfo.kmalloc-cg-192.active_slabs
      3734            -4.0%       3585 =C2=B1  3%      +1.4%       3787 =C2=
=B1  4%  slabinfo.kmalloc-cg-192.num_objs
     88.33            -3.8%      85.00 =C2=B1  3%      +1.5%      89.70 =C2=
=B1  4%  slabinfo.kmalloc-cg-192.num_slabs
      3654 =C2=B1  6%      -5.8%       3442 =C2=B1  3%      -4.1%       350=
4 =C2=B1  3%  slabinfo.kmalloc-cg-1k.active_objs
    113.67 =C2=B1  6%      -5.6%     107.33 =C2=B1  3%      -4.0%     109.1=
0 =C2=B1  3%  slabinfo.kmalloc-cg-1k.active_slabs
      3654 =C2=B1  6%      -5.8%       3442 =C2=B1  3%      -4.1%       350=
4 =C2=B1  3%  slabinfo.kmalloc-cg-1k.num_objs
    113.67 =C2=B1  6%      -5.6%     107.33 =C2=B1  3%      -4.0%     109.1=
0 =C2=B1  3%  slabinfo.kmalloc-cg-1k.num_slabs
    432.00 =C2=B1  3%      +3.7%     448.00 =C2=B1  4%     +20.8%     521.8=
0 =C2=B1 11%  slabinfo.kmalloc-cg-256.active_objs
     13.50 =C2=B1  3%      +3.7%      14.00 =C2=B1  4%     +15.6%      15.6=
0 =C2=B1 12%  slabinfo.kmalloc-cg-256.active_slabs
    432.00 =C2=B1  3%      +3.7%     448.00 =C2=B1  4%     +20.8%     521.8=
0 =C2=B1 11%  slabinfo.kmalloc-cg-256.num_objs
     13.50 =C2=B1  3%      +3.7%      14.00 =C2=B1  4%     +15.6%      15.6=
0 =C2=B1 12%  slabinfo.kmalloc-cg-256.num_slabs
    314.83 =C2=B1 12%      -3.8%     303.00 =C2=B1 11%      -3.6%     303.6=
0 =C2=B1  6%  slabinfo.kmalloc-cg-2k.active_objs
     19.00 =C2=B1 13%      -4.4%      18.17 =C2=B1 12%      -2.6%      18.5=
0 =C2=B1  6%  slabinfo.kmalloc-cg-2k.active_slabs
    314.83 =C2=B1 12%      -3.8%     303.00 =C2=B1 11%      -3.6%     303.6=
0 =C2=B1  6%  slabinfo.kmalloc-cg-2k.num_objs
     19.00 =C2=B1 13%      -4.4%      18.17 =C2=B1 12%      -2.6%      18.5=
0 =C2=B1  6%  slabinfo.kmalloc-cg-2k.num_slabs
     11104 =C2=B1  2%      +4.3%      11578 =C2=B1  2%      +3.2%      1146=
0 =C2=B1  5%  slabinfo.kmalloc-cg-32.active_objs
     86.33 =C2=B1  2%      +4.2%      90.00 =C2=B1  2%      +3.2%      89.1=
0 =C2=B1  5%  slabinfo.kmalloc-cg-32.active_slabs
     11104 =C2=B1  2%      +4.3%      11578 =C2=B1  2%      +3.2%      1146=
0 =C2=B1  5%  slabinfo.kmalloc-cg-32.num_objs
     86.33 =C2=B1  2%      +4.2%      90.00 =C2=B1  2%      +3.2%      89.1=
0 =C2=B1  5%  slabinfo.kmalloc-cg-32.num_slabs
    768.00            +0.0%     768.00            +0.0%     768.00        s=
labinfo.kmalloc-cg-4k.active_objs
     96.00            +0.0%      96.00            +0.0%      96.00        s=
labinfo.kmalloc-cg-4k.active_slabs
    768.00            +0.0%     768.00            +0.0%     768.00        s=
labinfo.kmalloc-cg-4k.num_objs
     96.00            +0.0%      96.00            +0.0%      96.00        s=
labinfo.kmalloc-cg-4k.num_slabs
      3061            +0.2%       3066            +0.1%       3065        s=
labinfo.kmalloc-cg-512.active_objs
     95.67            +0.2%      95.83            +0.0%      95.70        s=
labinfo.kmalloc-cg-512.active_slabs
      3061            +0.2%       3066            +0.1%       3065        s=
labinfo.kmalloc-cg-512.num_objs
     95.67            +0.2%      95.83            +0.0%      95.70        s=
labinfo.kmalloc-cg-512.num_slabs
      3248 =C2=B1 13%     -19.4%       2618 =C2=B1  5%     -40.4%       193=
6 =C2=B1 10%  slabinfo.kmalloc-cg-64.active_objs
     50.33 =C2=B1 13%     -19.5%      40.50 =C2=B1  4%     -41.2%      29.6=
0 =C2=B1 10%  slabinfo.kmalloc-cg-64.active_slabs
      3248 =C2=B1 13%     -19.4%       2618 =C2=B1  5%     -40.4%       193=
6 =C2=B1 10%  slabinfo.kmalloc-cg-64.num_objs
     50.33 =C2=B1 13%     -19.5%      40.50 =C2=B1  4%     -41.2%      29.6=
0 =C2=B1 10%  slabinfo.kmalloc-cg-64.num_slabs
     49658            +0.0%      49664            +0.0%      49659        s=
labinfo.kmalloc-cg-8.active_objs
     96.83            +0.2%      97.00            +0.1%      96.90        s=
labinfo.kmalloc-cg-8.active_slabs
     49658            +0.0%      49664            +0.0%      49659        s=
labinfo.kmalloc-cg-8.num_objs
     96.83            +0.2%      97.00            +0.1%      96.90        s=
labinfo.kmalloc-cg-8.num_slabs
     27.00            +0.0%      27.00           +28.1%      34.60 =C2=B1  =
3%  slabinfo.kmalloc-cg-8k.active_objs
      6.00            +0.0%       6.00           +31.7%       7.90 =C2=B1  =
3%  slabinfo.kmalloc-cg-8k.active_slabs
     27.00            +0.0%      27.00           +28.1%      34.60 =C2=B1  =
3%  slabinfo.kmalloc-cg-8k.num_objs
      6.00            +0.0%       6.00           +31.7%       7.90 =C2=B1  =
3%  slabinfo.kmalloc-cg-8k.num_slabs
    555.17 =C2=B1  6%      -1.7%     545.50 =C2=B1 11%      -8.8%     506.1=
0 =C2=B1  9%  slabinfo.kmalloc-cg-96.active_objs
     12.50 =C2=B1  6%      -2.7%      12.17 =C2=B1 12%      -8.8%      11.4=
0 =C2=B1  9%  slabinfo.kmalloc-cg-96.active_slabs
    555.17 =C2=B1  6%      -1.7%     545.50 =C2=B1 11%      -8.8%     506.1=
0 =C2=B1  9%  slabinfo.kmalloc-cg-96.num_objs
     12.50 =C2=B1  6%      -2.7%      12.17 =C2=B1 12%      -8.8%      11.4=
0 =C2=B1  9%  slabinfo.kmalloc-cg-96.num_slabs
    496.00 =C2=B1 15%     +22.6%     608.00 =C2=B1  5%     +10.3%     547.2=
0 =C2=B1 11%  slabinfo.kmalloc-rcl-128.active_objs
     15.50 =C2=B1 15%     +22.6%      19.00 =C2=B1  5%     +10.3%      17.1=
0 =C2=B1 11%  slabinfo.kmalloc-rcl-128.active_slabs
    496.00 =C2=B1 15%     +22.6%     608.00 =C2=B1  5%     +10.3%     547.2=
0 =C2=B1 11%  slabinfo.kmalloc-rcl-128.num_objs
     15.50 =C2=B1 15%     +22.6%      19.00 =C2=B1  5%     +10.3%      17.1=
0 =C2=B1 11%  slabinfo.kmalloc-rcl-128.num_slabs
     42.00            +0.0%      42.00            +0.0%      42.00        s=
labinfo.kmalloc-rcl-192.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.kmalloc-rcl-192.active_slabs
     42.00            +0.0%      42.00            +0.0%      42.00        s=
labinfo.kmalloc-rcl-192.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.kmalloc-rcl-192.num_slabs
      7210 =C2=B1  5%      +3.9%       7494 =C2=B1  2%      +2.6%       739=
7 =C2=B1  4%  slabinfo.kmalloc-rcl-64.active_objs
    113.33 =C2=B1  5%      +3.4%     117.17 =C2=B1  3%      +2.1%     115.7=
0 =C2=B1  4%  slabinfo.kmalloc-rcl-64.active_slabs
      7253 =C2=B1  5%      +3.7%       7519 =C2=B1  2%      +2.6%       744=
1 =C2=B1  4%  slabinfo.kmalloc-rcl-64.num_objs
    113.33 =C2=B1  5%      +3.4%     117.17 =C2=B1  3%      +2.1%     115.7=
0 =C2=B1  4%  slabinfo.kmalloc-rcl-64.num_slabs
      2296 =C2=B1  6%      +3.4%       2373 =C2=B1  5%      +7.0%       245=
7 =C2=B1  5%  slabinfo.kmalloc-rcl-96.active_objs
     54.67 =C2=B1  6%      +3.4%      56.50 =C2=B1  5%      +7.0%      58.5=
0 =C2=B1  5%  slabinfo.kmalloc-rcl-96.active_slabs
      2296 =C2=B1  6%      +3.4%       2373 =C2=B1  5%      +7.0%       245=
7 =C2=B1  5%  slabinfo.kmalloc-rcl-96.num_objs
     54.67 =C2=B1  6%      +3.4%      56.50 =C2=B1  5%      +7.0%      58.5=
0 =C2=B1  5%  slabinfo.kmalloc-rcl-96.num_slabs
    446.17 =C2=B1  4%      -1.2%     440.83 =C2=B1  2%      -9.3%     404.8=
0 =C2=B1  7%  slabinfo.kmem_cache.active_objs
     13.00 =C2=B1  4%      -1.3%      12.83 =C2=B1  2%      -8.5%      11.9=
0 =C2=B1  7%  slabinfo.kmem_cache.active_slabs
    446.17 =C2=B1  4%      -1.2%     440.83 =C2=B1  2%      -9.3%     404.8=
0 =C2=B1  7%  slabinfo.kmem_cache.num_objs
     13.00 =C2=B1  4%      -1.3%      12.83 =C2=B1  2%      -8.5%      11.9=
0 =C2=B1  7%  slabinfo.kmem_cache.num_slabs
    884.00 =C2=B1  6%      -0.3%     881.00 =C2=B1  2%      -6.8%     823.6=
0 =C2=B1  8%  slabinfo.kmem_cache_node.active_objs
     13.33 =C2=B1  7%      -1.3%      13.17 =C2=B1  2%      -6.3%      12.5=
0 =C2=B1  8%  slabinfo.kmem_cache_node.active_slabs
    914.50 =C2=B1  6%      -1.3%     903.00 =C2=B1  2%      -7.2%     848.8=
0 =C2=B1  8%  slabinfo.kmem_cache_node.num_objs
     13.33 =C2=B1  7%      -1.3%      13.17 =C2=B1  2%      -6.3%      12.5=
0 =C2=B1  8%  slabinfo.kmem_cache_node.num_slabs
     17198            -0.2%      17170 =C2=B1  2%      +8.5%      18661    =
    slabinfo.lsm_file_cache.active_objs
    101.17            -0.2%     101.00 =C2=B1  2%      +7.7%     109.00    =
    slabinfo.lsm_file_cache.active_slabs
     17198            -0.2%      17170 =C2=B1  2%      +8.5%      18661    =
    slabinfo.lsm_file_cache.num_objs
    101.17            -0.2%     101.00 =C2=B1  2%      +7.7%     109.00    =
    slabinfo.lsm_file_cache.num_slabs
    120.50 =C2=B1 35%    -100.0%       0.00           -24.9%      90.50 =C2=
=B1 42%  slabinfo.mbcache.active_objs
      0.83 =C2=B1 82%    -100.0%       0.00           -52.0%       0.40 =C2=
=B1165%  slabinfo.mbcache.active_slabs
    120.50 =C2=B1 35%    -100.0%       0.00           -24.9%      90.50 =C2=
=B1 42%  slabinfo.mbcache.num_objs
      0.83 =C2=B1 82%    -100.0%       0.00           -52.0%       0.40 =C2=
=B1165%  slabinfo.mbcache.num_slabs
      3103            +0.0%       3103            -0.1%       3100 =C2=B1  =
2%  slabinfo.mm_struct.active_objs
    103.17            -0.3%     102.83            -0.4%     102.80 =C2=B1  =
2%  slabinfo.mm_struct.active_slabs
      3103            +0.0%       3103            -0.1%       3100 =C2=B1  =
2%  slabinfo.mm_struct.num_objs
    103.17            -0.3%     102.83            -0.4%     102.80 =C2=B1  =
2%  slabinfo.mm_struct.num_slabs
      1002 =C2=B1  5%      +1.7%       1019 =C2=B1  5%      +3.6%       103=
7 =C2=B1  8%  slabinfo.mnt_cache.active_objs
     19.17 =C2=B1  4%      +2.6%      19.67 =C2=B1  6%      +1.2%      19.4=
0 =C2=B1  8%  slabinfo.mnt_cache.active_slabs
      1002 =C2=B1  5%      +1.7%       1019 =C2=B1  5%      +3.6%       103=
7 =C2=B1  8%  slabinfo.mnt_cache.num_objs
     19.17 =C2=B1  4%      +2.6%      19.67 =C2=B1  6%      +1.2%      19.4=
0 =C2=B1  8%  slabinfo.mnt_cache.num_slabs
     34.00            +0.0%      34.00            +0.0%      34.00        s=
labinfo.mqueue_inode_cache.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.mqueue_inode_cache.active_slabs
     34.00            +0.0%      34.00            +0.0%      34.00        s=
labinfo.mqueue_inode_cache.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.mqueue_inode_cache.num_slabs
    768.00            +0.0%     768.00            +0.0%     768.00        s=
labinfo.names_cache.active_objs
     96.00            +0.0%      96.00            +0.0%      96.00        s=
labinfo.names_cache.active_slabs
    768.00            +0.0%     768.00            +0.0%     768.00        s=
labinfo.names_cache.num_objs
     96.00            +0.0%      96.00            +0.0%      96.00        s=
labinfo.names_cache.num_slabs
     34.00            +0.0%      34.00            +0.0%      34.00        s=
labinfo.nfs_read_data.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.nfs_read_data.active_slabs
     34.00            +0.0%      34.00            +0.0%      34.00        s=
labinfo.nfs_read_data.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.nfs_read_data.num_slabs
    124.00            +0.0%     124.00            +0.0%     124.00        s=
labinfo.numa_policy.active_objs
      2.00            +0.0%       2.00            +0.0%       2.00        s=
labinfo.numa_policy.active_slabs
    124.00            +0.0%     124.00            +0.0%     124.00        s=
labinfo.numa_policy.num_objs
      2.00            +0.0%       2.00            +0.0%       2.00        s=
labinfo.numa_policy.num_slabs
      9019            +2.0%       9197 =C2=B1  2%      +1.2%       9124 =C2=
=B1  4%  slabinfo.pde_opener.active_objs
     88.00            +2.1%      89.83 =C2=B1  2%      +1.2%      89.10 =C2=
=B1  4%  slabinfo.pde_opener.active_slabs
      9019            +2.0%       9197 =C2=B1  2%      +1.2%       9124 =C2=
=B1  4%  slabinfo.pde_opener.num_objs
     88.00            +2.1%      89.83 =C2=B1  2%      +1.2%      89.10 =C2=
=B1  4%  slabinfo.pde_opener.num_slabs
      2592            +0.0%       2592           +61.5%       4186        s=
labinfo.perf_event.active_objs
     96.00            +0.0%      96.00           +61.2%     154.80        s=
labinfo.perf_event.active_slabs
      2592            +0.0%       2592           +62.1%       4202        s=
labinfo.perf_event.num_objs
     96.00            +0.0%      96.00           +61.2%     154.80        s=
labinfo.perf_event.num_slabs
      4701 =C2=B1  4%      +2.4%       4816 =C2=B1  3%      +5.8%       497=
6 =C2=B1  3%  slabinfo.pid.active_objs
    146.33 =C2=B1  4%      +2.4%     149.83 =C2=B1  3%      +6.0%     155.1=
0 =C2=B1  3%  slabinfo.pid.active_slabs
      4701 =C2=B1  4%      +2.4%       4816 =C2=B1  3%      +5.8%       497=
6 =C2=B1  3%  slabinfo.pid.num_objs
    146.33 =C2=B1  4%      +2.4%     149.83 =C2=B1  3%      +6.0%     155.1=
0 =C2=B1  3%  slabinfo.pid.num_slabs
      1540 =C2=B1  4%      -1.7%       1514 =C2=B1  3%      -8.5%       140=
9 =C2=B1  8%  slabinfo.pool_workqueue.active_objs
     47.67 =C2=B1  3%      -1.7%      46.83 =C2=B1  4%      -9.0%      43.4=
0 =C2=B1  8%  slabinfo.pool_workqueue.active_slabs
      1540 =C2=B1  4%      -1.7%       1514 =C2=B1  3%      -8.1%       141=
6 =C2=B1  8%  slabinfo.pool_workqueue.num_objs
     47.67 =C2=B1  3%      -1.7%      46.83 =C2=B1  4%      -9.0%      43.4=
0 =C2=B1  8%  slabinfo.pool_workqueue.num_slabs
      2875 =C2=B1  2%      +2.2%       2937            +0.6%       2892 =C2=
=B1  2%  slabinfo.proc_dir_entry.active_objs
     67.50 =C2=B1  2%      +2.2%      69.00            +0.7%      68.00 =C2=
=B1  2%  slabinfo.proc_dir_entry.active_slabs
      2875 =C2=B1  2%      +2.2%       2937            +0.6%       2892 =C2=
=B1  2%  slabinfo.proc_dir_entry.num_objs
     67.50 =C2=B1  2%      +2.2%      69.00            +0.7%      68.00 =C2=
=B1  2%  slabinfo.proc_dir_entry.num_slabs
      9828            +1.0%       9930           +42.4%      13994        s=
labinfo.proc_inode_cache.active_objs
    200.17            +1.1%     202.33           +42.5%     285.20        s=
labinfo.proc_inode_cache.active_slabs
      9828            +1.0%       9930           +42.4%      13994        s=
labinfo.proc_inode_cache.num_objs
    200.17            +1.1%     202.33           +42.5%     285.20        s=
labinfo.proc_inode_cache.num_slabs
     28410            -2.3%      27757            +0.5%      28552        s=
labinfo.radix_tree_node.active_objs
    507.33            -2.4%     495.00            +0.4%     509.60        s=
labinfo.radix_tree_node.active_slabs
     28433            -2.4%      27762            +0.4%      28553        s=
labinfo.radix_tree_node.num_objs
    507.33            -2.4%     495.00            +0.4%     509.60        s=
labinfo.radix_tree_node.num_slabs
     30.00            +0.0%      30.00            +0.0%      30.00        s=
labinfo.request_queue.active_objs
      2.00            +0.0%       2.00            +0.0%       2.00        s=
labinfo.request_queue.active_slabs
     30.00            +0.0%      30.00            +0.0%      30.00        s=
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
    640.00            +0.0%     640.00            +0.0%     640.00        s=
labinfo.scsi_sense_cache.active_objs
     20.00            +0.0%      20.00            +0.0%      20.00        s=
labinfo.scsi_sense_cache.active_slabs
    640.00            +0.0%     640.00            +0.0%     640.00        s=
labinfo.scsi_sense_cache.num_objs
     20.00            +0.0%      20.00            +0.0%      20.00        s=
labinfo.scsi_sense_cache.num_slabs
      3264            +0.0%       3264            +0.0%       3264        s=
labinfo.seq_file.active_objs
     96.00            +0.0%      96.00            +0.0%      96.00        s=
labinfo.seq_file.active_slabs
      3264            +0.0%       3264            +0.0%       3264        s=
labinfo.seq_file.num_objs
     96.00            +0.0%      96.00            +0.0%      96.00        s=
labinfo.seq_file.num_slabs
      5075 =C2=B1  3%      +1.2%       5136 =C2=B1  2%      -4.2%       486=
1 =C2=B1  7%  slabinfo.shmem_inode_cache.active_objs
    110.17 =C2=B1  3%      +1.2%     111.50 =C2=B1  2%      -4.7%     105.0=
0 =C2=B1  7%  slabinfo.shmem_inode_cache.active_slabs
      5075 =C2=B1  3%      +1.2%       5136 =C2=B1  2%      -4.2%       486=
1 =C2=B1  7%  slabinfo.shmem_inode_cache.num_objs
    110.17 =C2=B1  3%      +1.2%     111.50 =C2=B1  2%      -4.7%     105.0=
0 =C2=B1  7%  slabinfo.shmem_inode_cache.num_slabs
      2419 =C2=B1  2%      -3.2%       2342 =C2=B1  2%      -1.0%       239=
4        slabinfo.sighand_cache.active_objs
    161.00 =C2=B1  2%      -3.2%     155.83 =C2=B1  2%      -1.0%     159.4=
0        slabinfo.sighand_cache.active_slabs
      2419 =C2=B1  2%      -3.2%       2342 =C2=B1  2%      -1.0%       239=
5        slabinfo.sighand_cache.num_objs
    161.00 =C2=B1  2%      -3.2%     155.83 =C2=B1  2%      -1.0%     159.4=
0        slabinfo.sighand_cache.num_slabs
      4430 =C2=B1  2%      +2.3%       4532 =C2=B1  3%      +5.5%       467=
4 =C2=B1  5%  slabinfo.signal_cache.active_objs
    157.83 =C2=B1  2%      +2.3%     161.50 =C2=B1  3%      +5.5%     166.5=
0 =C2=B1  5%  slabinfo.signal_cache.active_slabs
      4431 =C2=B1  2%      +2.3%       4532 =C2=B1  3%      +5.5%       467=
5 =C2=B1  5%  slabinfo.signal_cache.num_objs
    157.83 =C2=B1  2%      +2.3%     161.50 =C2=B1  3%      +5.5%     166.5=
0 =C2=B1  5%  slabinfo.signal_cache.num_slabs
      1868 =C2=B1 18%     +19.7%       2236 =C2=B1  4%      -5.1%       177=
2 =C2=B1 15%  slabinfo.skbuff_ext_cache.active_objs
     44.00 =C2=B1 18%     +19.7%      52.67 =C2=B1  4%      -5.2%      41.7=
0 =C2=B1 15%  slabinfo.skbuff_ext_cache.active_slabs
      1868 =C2=B1 18%     +19.7%       2236 =C2=B1  4%      -5.1%       177=
2 =C2=B1 15%  slabinfo.skbuff_ext_cache.num_objs
     44.00 =C2=B1 18%     +19.7%      52.67 =C2=B1  4%      -5.2%      41.7=
0 =C2=B1 15%  slabinfo.skbuff_ext_cache.num_slabs
    309.83 =C2=B1 10%      -6.0%     291.17 =C2=B1  8%      -5.2%     293.8=
0 =C2=B1 12%  slabinfo.skbuff_fclone_cache.active_objs
      9.17 =C2=B1 11%      -9.1%       8.33 =C2=B1  8%      -6.2%       8.6=
0 =C2=B1 13%  slabinfo.skbuff_fclone_cache.active_slabs
    309.83 =C2=B1 10%      -6.0%     291.17 =C2=B1  8%      -5.2%     293.8=
0 =C2=B1 12%  slabinfo.skbuff_fclone_cache.num_objs
      9.17 =C2=B1 11%      -9.1%       8.33 =C2=B1  8%      -6.2%       8.6=
0 =C2=B1 13%  slabinfo.skbuff_fclone_cache.num_slabs
      4469 =C2=B1  3%      -1.4%       4405 =C2=B1  5%      -6.6%       417=
2 =C2=B1  5%  slabinfo.skbuff_head_cache.active_objs
    139.67 =C2=B1  3%      -1.3%     137.83 =C2=B1  4%      -6.6%     130.4=
0 =C2=B1  5%  slabinfo.skbuff_head_cache.active_slabs
      4469 =C2=B1  3%      -1.3%       4410 =C2=B1  4%      -6.6%       417=
2 =C2=B1  5%  slabinfo.skbuff_head_cache.num_objs
    139.67 =C2=B1  3%      -1.3%     137.83 =C2=B1  4%      -6.6%     130.4=
0 =C2=B1  5%  slabinfo.skbuff_head_cache.num_slabs
      3397 =C2=B1  8%      +2.7%       3489 =C2=B1  4%      -5.3%       321=
7 =C2=B1 12%  slabinfo.sock_inode_cache.active_objs
     86.33 =C2=B1  8%      +3.1%      89.00 =C2=B1  4%      -5.0%      82.0=
0 =C2=B1 12%  slabinfo.sock_inode_cache.active_slabs
      3397 =C2=B1  8%      +2.7%       3489 =C2=B1  4%      -5.3%       321=
7 =C2=B1 12%  slabinfo.sock_inode_cache.num_objs
     86.33 =C2=B1  8%      +3.1%      89.00 =C2=B1  4%      -5.0%      82.0=
0 =C2=B1 12%  slabinfo.sock_inode_cache.num_slabs
      1394 =C2=B1  2%      +1.2%       1411 =C2=B1  6%      -8.5%       127=
5 =C2=B1  8%  slabinfo.task_delay_info.active_objs
     27.33 =C2=B1  2%      +1.2%      27.67 =C2=B1  6%      -8.5%      25.0=
0 =C2=B1  8%  slabinfo.task_delay_info.active_slabs
      1394 =C2=B1  2%      +1.2%       1411 =C2=B1  6%      -8.5%       127=
5 =C2=B1  8%  slabinfo.task_delay_info.num_objs
     27.33 =C2=B1  2%      +1.2%      27.67 =C2=B1  6%      -8.5%      25.0=
0 =C2=B1  8%  slabinfo.task_delay_info.num_slabs
      1386 =C2=B1  4%      -2.7%       1350 =C2=B1  6%      -7.5%       128=
2 =C2=B1 10%  slabinfo.task_group.active_objs
     29.33 =C2=B1  5%      -1.7%      28.83 =C2=B1  6%      -6.9%      27.3=
0 =C2=B1 10%  slabinfo.task_group.active_slabs
      1386 =C2=B1  4%      -2.7%       1350 =C2=B1  6%      -7.5%       128=
2 =C2=B1 10%  slabinfo.task_group.num_objs
     29.33 =C2=B1  5%      -1.7%      28.83 =C2=B1  6%      -6.9%      27.3=
0 =C2=B1 10%  slabinfo.task_group.num_slabs
      1459            -3.5%       1408            +0.1%       1461        s=
labinfo.task_struct.active_objs
      1464            -3.4%       1414            +0.1%       1465        s=
labinfo.task_struct.active_slabs
      1464            -3.4%       1414            +0.1%       1465        s=
labinfo.task_struct.num_objs
      1464            -3.4%       1414            +0.1%       1465        s=
labinfo.task_struct.num_slabs
    198.33 =C2=B1 17%      -3.9%     190.67 =C2=B1  8%     +27.9%     253.6=
0 =C2=B1  8%  slabinfo.taskstats.active_objs
      3.33 =C2=B1 22%      -5.0%       3.17 =C2=B1 11%     +56.0%       5.2=
0 =C2=B1 11%  slabinfo.taskstats.active_slabs
    198.33 =C2=B1 17%      -3.9%     190.67 =C2=B1  8%     +27.9%     253.6=
0 =C2=B1  8%  slabinfo.taskstats.num_objs
      3.33 =C2=B1 22%      -5.0%       3.17 =C2=B1 11%     +56.0%       5.2=
0 =C2=B1 11%  slabinfo.taskstats.num_slabs
      3074            -0.2%       3069 =C2=B1  4%      -1.6%       3025 =C2=
=B1  2%  slabinfo.trace_event_file.active_objs
     66.00            -0.3%      65.83 =C2=B1  4%      -1.7%      64.90 =C2=
=B1  2%  slabinfo.trace_event_file.active_slabs
      3074            -0.2%       3069 =C2=B1  4%      -1.6%       3025 =C2=
=B1  2%  slabinfo.trace_event_file.num_objs
     66.00            -0.3%      65.83 =C2=B1  4%      -1.7%      64.90 =C2=
=B1  2%  slabinfo.trace_event_file.num_slabs
     33.00            +0.0%      33.00            +0.0%      33.00        s=
labinfo.tw_sock_TCP.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.tw_sock_TCP.active_slabs
     33.00            +0.0%      33.00            +0.0%      33.00        s=
labinfo.tw_sock_TCP.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.tw_sock_TCP.num_slabs
     60720 =C2=B1  2%      +1.0%      61311 =C2=B1  6%      +2.8%      6243=
9 =C2=B1  5%  slabinfo.vm_area_struct.active_objs
      1518 =C2=B1  2%      +1.0%       1532 =C2=B1  6%      +2.9%       156=
2 =C2=B1  5%  slabinfo.vm_area_struct.active_slabs
     60750 =C2=B1  2%      +0.9%      61322 =C2=B1  6%      +2.9%      6250=
1 =C2=B1  5%  slabinfo.vm_area_struct.num_objs
      1518 =C2=B1  2%      +1.0%       1532 =C2=B1  6%      +2.9%       156=
2 =C2=B1  5%  slabinfo.vm_area_struct.num_slabs
     13265            -4.4%      12686            +0.6%      13348        s=
labinfo.vmap_area.active_objs
    207.67            -1.6%     204.33            +0.4%     208.50        s=
labinfo.vmap_area.active_slabs
     13323            -1.7%      13101            +0.3%      13365        s=
labinfo.vmap_area.num_objs
    207.67            -1.6%     204.33            +0.4%     208.50        s=
labinfo.vmap_area.num_slabs
     42.00            +0.0%      42.00            +0.0%      42.00        s=
labinfo.xfrm_state.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.xfrm_state.active_slabs
     42.00            +0.0%      42.00            +0.0%      42.00        s=
labinfo.xfrm_state.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.xfrm_state.num_slabs
      0.00            +0.0        0.00            +0.1        0.05 =C2=B129=
9%  perf-profile.calltrace.cycles-pp.copyout.copy_page_to_iter.pipe_read.ne=
w_sync_read.vfs_read
      0.00            +0.0        0.00            +0.1        0.10 =C2=B120=
0%  perf-profile.calltrace.cycles-pp.cpuacct_charge.update_curr.yield_task_=
fair.do_sched_yield.__x64_sys_sched_yield
      0.00            +0.0        0.00            +0.1        0.10 =C2=B120=
0%  perf-profile.calltrace.cycles-pp.__switch_to.__schedule.schedule.__x64_=
sys_sched_yield.do_syscall_64
      0.00            +0.0        0.00            +0.1        0.12 =C2=B120=
1%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_=
spin_lock_irq.__set_current_blocked.signal_setup_done.arch_do_signal_or_res=
tart
      0.00            +0.0        0.00            +0.3        0.26 =C2=B110=
0%  perf-profile.calltrace.cycles-pp.atime_needs_update.touch_atime.pipe_re=
ad.new_sync_read.vfs_read
      0.00            +0.0        0.00            +0.3        0.26 =C2=B110=
0%  perf-profile.calltrace.cycles-pp.file_update_time.pipe_write.new_sync_w=
rite.vfs_write.ksys_write
      0.00            +0.0        0.00            +0.4        0.37 =C2=B1 6=
5%  perf-profile.calltrace.cycles-pp.sched_clock_cpu.update_rq_clock.yield_=
task_fair.do_sched_yield.__x64_sys_sched_yield
      0.00            +0.0        0.00            +0.4        0.42 =C2=B1 5=
0%  perf-profile.calltrace.cycles-pp.___perf_sw_event.__schedule.schedule._=
_x64_sys_sched_yield.do_syscall_64
      0.00            +0.0        0.00            +0.5        0.48 =C2=B1 3=
3%  perf-profile.calltrace.cycles-pp.mutex_lock.pipe_read.new_sync_read.vfs=
_read.ksys_read
      0.00            +0.0        0.00            +0.5        0.49 =C2=B1 3=
3%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__wake_up_commo=
n_lock.pipe_write.new_sync_write.vfs_write
      0.00            +0.0        0.00            +0.5        0.54        p=
erf-profile.calltrace.cycles-pp.syscall_enter_from_user_mode.do_syscall_64.=
entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +0.5        0.55 =C2=B1  =
2%  perf-profile.calltrace.cycles-pp.fpregs_mark_activate.fpu__clear_user_s=
tates.arch_do_signal_or_restart.exit_to_user_mode_prepare.syscall_exit_to_u=
ser_mode
      0.00            +0.0        0.00            +0.6        0.55 =C2=B1  =
4%  perf-profile.calltrace.cycles-pp.common_file_perm.security_file_permiss=
ion.vfs_write.ksys_write.do_syscall_64
      0.00            +0.0        0.00            +0.6        0.57 =C2=B1  =
2%  perf-profile.calltrace.cycles-pp.__switch_to
      0.00            +0.0        0.00            +0.6        0.58 =C2=B1  =
2%  perf-profile.calltrace.cycles-pp.touch_atime.pipe_read.new_sync_read.vf=
s_read.ksys_read
      0.00            +0.0        0.00            +0.6        0.61 =C2=B1  =
5%  perf-profile.calltrace.cycles-pp._raw_read_lock_irqsave.send_sigio.kill=
_fasync.pipe_write.new_sync_write
      0.00            +0.0        0.00            +0.7        0.65 =C2=B1  =
3%  perf-profile.calltrace.cycles-pp.update_load_avg.set_next_entity.pick_n=
ext_task_fair.__schedule.schedule
      0.00            +0.0        0.00            +0.7        0.66 =C2=B1  =
4%  perf-profile.calltrace.cycles-pp.recalc_sigpending_tsk.recalc_sigpendin=
g.__set_task_blocked.__set_current_blocked.__x64_sys_rt_sigreturn
      0.00            +0.0        0.00            +0.7        0.66 =C2=B1  =
5%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.__set_current_block=
ed.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +0.7        0.67 =C2=B1  =
4%  perf-profile.calltrace.cycles-pp.recalc_sigpending.__set_task_blocked._=
_set_current_blocked.__x64_sys_rt_sigreturn.do_syscall_64
      0.00            +0.0        0.00            +0.7        0.68 =C2=B1  =
2%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.pipe_read.new_sync_=
read.vfs_read.ksys_read
      0.00            +0.0        0.00            +0.7        0.69 =C2=B1  =
3%  perf-profile.calltrace.cycles-pp.__wake_up_common_lock.pipe_write.new_s=
ync_write.vfs_write.ksys_write
      0.00            +0.0        0.00            +0.7        0.70 =C2=B1  =
4%  perf-profile.calltrace.cycles-pp.__set_task_blocked.__set_current_block=
ed.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +0.7        0.74 =C2=B1  =
6%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.get_signal.arch_do_=
signal_or_restart.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.00            +0.0        0.00            +0.8        0.76        p=
erf-profile.calltrace.cycles-pp.security_file_permission.vfs_read.ksys_read=
.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +0.8        0.76 =C2=B1  =
2%  perf-profile.calltrace.cycles-pp.syscall_return_via_sysret
      0.00            +0.0        0.00            +0.8        0.77 =C2=B1  =
5%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.pipe_write.new_sync=
_write.vfs_write.ksys_write
      0.00            +0.0        0.00            +0.8        0.77 =C2=B1  =
8%  perf-profile.calltrace.cycles-pp.recalc_sigpending.dequeue_signal.get_s=
ignal.arch_do_signal_or_restart.exit_to_user_mode_prepare
      0.00            +0.0        0.00            +0.8        0.77 =C2=B1  =
3%  perf-profile.calltrace.cycles-pp.copy_user_enhanced_fast_string.copyin.=
copy_page_from_iter.pipe_write.new_sync_write
      0.00            +0.0        0.00            +0.8        0.80 =C2=B1 1=
9%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__lock_task_sig=
hand.do_send_sig_info.send_sigio_to_task.send_sigio
      0.00            +0.0        0.00            +0.8        0.81 =C2=B1  =
3%  perf-profile.calltrace.cycles-pp.security_file_permission.vfs_write.ksy=
s_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +0.8        0.81 =C2=B1  =
2%  perf-profile.calltrace.cycles-pp.copy_page_to_iter.pipe_read.new_sync_r=
ead.vfs_read.ksys_read
      0.00            +0.0        0.00            +0.8        0.82 =C2=B1  =
3%  perf-profile.calltrace.cycles-pp.__entry_text_start
      0.00            +0.0        0.00            +0.8        0.83        p=
erf-profile.calltrace.cycles-pp.pick_next_entity.pick_next_task_fair.__sche=
dule.schedule.__x64_sys_sched_yield
      0.00            +0.0        0.00            +0.8        0.84 =C2=B1  =
6%  perf-profile.calltrace.cycles-pp._raw_read_lock.kill_fasync.pipe_write.=
new_sync_write.vfs_write
      0.00            +0.0        0.00            +0.9        0.85 =C2=B1  =
3%  perf-profile.calltrace.cycles-pp._raw_spin_lock.do_sched_yield.__x64_sy=
s_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +0.9        0.90 =C2=B1  =
4%  perf-profile.calltrace.cycles-pp.update_load_avg.put_prev_entity.pick_n=
ext_task_fair.__schedule.schedule
      0.00            +0.0        0.00            +0.9        0.91 =C2=B1  =
3%  perf-profile.calltrace.cycles-pp.copyin.copy_page_from_iter.pipe_write.=
new_sync_write.vfs_write
      0.00            +0.0        0.00            +0.9        0.92 =C2=B1  =
2%  perf-profile.calltrace.cycles-pp.save_fpregs_to_fpstate
      0.00            +0.0        0.00            +0.9        0.92 =C2=B1  =
4%  perf-profile.calltrace.cycles-pp.update_rq_clock.yield_task_fair.do_sch=
ed_yield.__x64_sys_sched_yield.do_syscall_64
      0.00            +0.0        0.00            +0.9        0.94 =C2=B1 1=
8%  perf-profile.calltrace.cycles-pp.__lock_task_sighand.do_send_sig_info.s=
end_sigio_to_task.send_sigio.kill_fasync
      0.00            +0.0        0.00            +1.0        1.03 =C2=B1 1=
2%  perf-profile.calltrace.cycles-pp._raw_read_unlock_irqrestore.kill_fasyn=
c.pipe_write.new_sync_write.vfs_write
      0.00            +0.0        0.00            +1.0        1.04 =C2=B1  =
6%  perf-profile.calltrace.cycles-pp.update_curr.pick_next_task_fair.__sche=
dule.schedule.__x64_sys_sched_yield
      0.00            +0.0        0.00            +1.1        1.08 =C2=B1  =
3%  perf-profile.calltrace.cycles-pp.set_next_entity.pick_next_task_fair.__=
schedule.schedule.__x64_sys_sched_yield
      0.00            +0.0        0.00            +1.1        1.08 =C2=B1  =
2%  perf-profile.calltrace.cycles-pp.__restore_fpregs_from_fpstate.switch_f=
pu_return.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.00            +0.0        0.00            +1.2        1.21        p=
erf-profile.calltrace.cycles-pp.fpu__clear_user_states.arch_do_signal_or_re=
start.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.00            +0.0        0.00            +1.2        1.22 =C2=B1  =
2%  perf-profile.calltrace.cycles-pp.__switch_to_asm
      0.00            +0.0        0.00            +1.2        1.23 =C2=B1  =
6%  perf-profile.calltrace.cycles-pp.mutex_unlock.pipe_write.new_sync_write=
.vfs_write.ksys_write
      0.00            +0.0        0.00            +1.4        1.42 =C2=B1  =
3%  perf-profile.calltrace.cycles-pp.__set_current_blocked.__x64_sys_rt_sig=
return.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +1.5        1.45 =C2=B1  =
3%  perf-profile.calltrace.cycles-pp.put_prev_entity.pick_next_task_fair.__=
schedule.schedule.__x64_sys_sched_yield
      0.00            +0.0        0.00            +1.5        1.53 =C2=B1  =
3%  perf-profile.calltrace.cycles-pp.mutex_lock.pipe_write.new_sync_write.v=
fs_write.ksys_write
      0.00            +0.0        0.00            +1.6        1.59 =C2=B1  =
2%  perf-profile.calltrace.cycles-pp.load_new_mm_cr3.switch_mm_irqs_off.__s=
chedule.schedule.__x64_sys_sched_yield
      0.00            +0.0        0.00            +1.7        1.70 =C2=B1  =
3%  perf-profile.calltrace.cycles-pp.copy_page_from_iter.pipe_write.new_syn=
c_write.vfs_write.ksys_write
      0.00            +0.0        0.00            +1.8        1.82 =C2=B1  =
8%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.__set_current_block=
ed.signal_setup_done.arch_do_signal_or_restart.exit_to_user_mode_prepare
      0.00            +0.0        0.00            +1.9        1.90 =C2=B1  =
4%  perf-profile.calltrace.cycles-pp.update_curr.yield_task_fair.do_sched_y=
ield.__x64_sys_sched_yield.do_syscall_64
      0.00            +0.0        0.00            +2.2        2.19 =C2=B1  =
7%  perf-profile.calltrace.cycles-pp.__set_current_blocked.signal_setup_don=
e.arch_do_signal_or_restart.exit_to_user_mode_prepare.syscall_exit_to_user_=
mode
      0.00            +0.0        0.00            +2.2        2.24 =C2=B1  =
2%  perf-profile.calltrace.cycles-pp.switch_fpu_return.exit_to_user_mode_pr=
epare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +2.3        2.26 =C2=B1  =
8%  perf-profile.calltrace.cycles-pp.signal_setup_done.arch_do_signal_or_re=
start.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.00            +0.0        0.00            +2.3        2.27        p=
erf-profile.calltrace.cycles-pp.__fpu_restore_sig.fpu__restore_sig.restore_=
sigcontext.__x64_sys_rt_sigreturn.do_syscall_64
      0.00            +0.0        0.00            +2.3        2.31        p=
erf-profile.calltrace.cycles-pp.fpu__restore_sig.restore_sigcontext.__x64_s=
ys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +2.3        2.34 =C2=B1  =
3%  perf-profile.calltrace.cycles-pp._raw_spin_lock.__schedule.schedule.__x=
64_sys_sched_yield.do_syscall_64
      0.00            +0.0        0.00            +2.5        2.48        p=
erf-profile.calltrace.cycles-pp.copy_fpstate_to_sigframe.__setup_rt_frame.a=
rch_do_signal_or_restart.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.00            +0.0        0.00            +2.9        2.94        p=
erf-profile.calltrace.cycles-pp.restore_sigcontext.__x64_sys_rt_sigreturn.d=
o_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +3.1        3.12        p=
erf-profile.calltrace.cycles-pp.__setup_rt_frame.arch_do_signal_or_restart.=
exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.00            +0.0        0.00            +3.3        3.29        p=
erf-profile.calltrace.cycles-pp.pipe_read.new_sync_read.vfs_read.ksys_read.=
do_syscall_64
      0.00            +0.0        0.00            +3.5        3.48 =C2=B1  =
4%  perf-profile.calltrace.cycles-pp.yield_task_fair.do_sched_yield.__x64_s=
ys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +3.5        3.53        p=
erf-profile.calltrace.cycles-pp.new_sync_read.vfs_read.ksys_read.do_syscall=
_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +4.3        4.31 =C2=B1  =
2%  perf-profile.calltrace.cycles-pp.switch_mm_irqs_off.__schedule.schedule=
.__x64_sys_sched_yield.do_syscall_64
      0.00            +0.0        0.00            +4.7        4.72        p=
erf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe
      0.00            +0.0        0.00            +4.7        4.72 =C2=B1  =
2%  perf-profile.calltrace.cycles-pp.do_sched_yield.__x64_sys_sched_yield.d=
o_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +5.0        5.05        p=
erf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe
      0.00            +0.0        0.00            +5.5        5.45        p=
erf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule.__x=
64_sys_sched_yield.do_syscall_64
      0.00            +0.0        0.00            +5.5        5.47        p=
erf-profile.calltrace.cycles-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_=
SYSCALL_64_after_hwframe
      0.00            +0.0        0.00           +13.8       13.78 =C2=B1  =
2%  perf-profile.calltrace.cycles-pp.inc_rlimit_ucounts.__sigqueue_alloc.__=
send_signal.do_send_sig_info.send_sigio_to_task
      0.00            +0.0        0.00           +13.9       13.89 =C2=B1  =
2%  perf-profile.calltrace.cycles-pp.dec_rlimit_ucounts.__sigqueue_free.__d=
equeue_signal.dequeue_signal.get_signal
      0.00            +0.0        0.00           +13.9       13.92 =C2=B1  =
2%  perf-profile.calltrace.cycles-pp.__sigqueue_free.__dequeue_signal.deque=
ue_signal.get_signal.arch_do_signal_or_restart
      0.00            +0.0        0.00           +14.1       14.09 =C2=B1  =
2%  perf-profile.calltrace.cycles-pp.__sigqueue_alloc.__send_signal.do_send=
_sig_info.send_sigio_to_task.send_sigio
      0.00            +0.0        0.00           +14.4       14.38 =C2=B1  =
2%  perf-profile.calltrace.cycles-pp.__dequeue_signal.dequeue_signal.get_si=
gnal.arch_do_signal_or_restart.exit_to_user_mode_prepare
      0.00            +0.0        0.00           +14.9       14.94        p=
erf-profile.calltrace.cycles-pp.__send_signal.do_send_sig_info.send_sigio_t=
o_task.send_sigio.kill_fasync
      0.00            +0.0        0.00           +15.2       15.25 =C2=B1  =
2%  perf-profile.calltrace.cycles-pp.dequeue_signal.get_signal.arch_do_sign=
al_or_restart.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.00            +0.0        0.00           +16.3       16.26        p=
erf-profile.calltrace.cycles-pp.do_send_sig_info.send_sigio_to_task.send_si=
gio.kill_fasync.pipe_write
      0.00            +0.0        0.00           +16.5       16.51 =C2=B1  =
2%  perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.e=
xit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.00            +0.0        0.00           +16.5       16.53        p=
erf-profile.calltrace.cycles-pp.send_sigio_to_task.send_sigio.kill_fasync.p=
ipe_write.new_sync_write
      0.00            +0.0        0.00           +16.6       16.59        p=
erf-profile.calltrace.cycles-pp.__schedule.schedule.__x64_sys_sched_yield.d=
o_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00           +17.0       16.98        p=
erf-profile.calltrace.cycles-pp.schedule.__x64_sys_sched_yield.do_syscall_6=
4.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00           +17.4       17.41        p=
erf-profile.calltrace.cycles-pp.send_sigio.kill_fasync.pipe_write.new_sync_=
write.vfs_write
      0.00            +0.0        0.00           +20.0       20.02        p=
erf-profile.calltrace.cycles-pp.kill_fasync.pipe_write.new_sync_write.vfs_w=
rite.ksys_write
      0.00            +0.0        0.00           +22.0       22.03        p=
erf-profile.calltrace.cycles-pp.__x64_sys_sched_yield.do_syscall_64.entry_S=
YSCALL_64_after_hwframe
      0.00            +0.0        0.00           +23.3       23.34        p=
erf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode=
_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame
      0.00            +0.0        0.00           +26.0       26.04        p=
erf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_u=
ser_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00           +26.5       26.49        p=
erf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00           +27.4       27.42        p=
erf-profile.calltrace.cycles-pp.pipe_write.new_sync_write.vfs_write.ksys_wr=
ite.do_syscall_64
      0.00            +0.0        0.00           +27.9       27.86        p=
erf-profile.calltrace.cycles-pp.new_sync_write.vfs_write.ksys_write.do_sysc=
all_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00           +29.7       29.70        p=
erf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SY=
SCALL_64_after_hwframe
      0.00            +0.0        0.00           +30.3       30.34        p=
erf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe
      0.00            +0.0        0.00           +90.8       90.83        p=
erf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00           +91.9       91.88        p=
erf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +0.0        0.01 =C2=B129=
9%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
      0.00            +0.0        0.00            +0.0        0.01 =C2=B130=
0%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.00            +0.0        0.00            +0.0        0.01 =C2=B130=
0%  perf-profile.children.cycles-pp.kick_process
      0.00            +0.0        0.00            +0.0        0.01 =C2=B130=
0%  perf-profile.children.cycles-pp.intel_idle
      0.00            +0.0        0.00            +0.0        0.01 =C2=B120=
0%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.00            +0.0        0.00            +0.0        0.01 =C2=B120=
0%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.00            +0.0        0.00            +0.0        0.02 =C2=B115=
2%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.00            +0.0        0.00            +0.0        0.02 =C2=B115=
3%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.00            +0.0        0.00            +0.0        0.02 =C2=B115=
4%  perf-profile.children.cycles-pp.mutex_spin_on_owner
      0.00            +0.0        0.00            +0.0        0.02 =C2=B115=
6%  perf-profile.children.cycles-pp.sync_regs
      0.00            +0.0        0.00            +0.0        0.02 =C2=B112=
2%  perf-profile.children.cycles-pp.__wake_up_common
      0.00            +0.0        0.00            +0.0        0.02 =C2=B110=
0%  perf-profile.children.cycles-pp.perf_exclude_event
      0.00            +0.0        0.00            +0.0        0.02 =C2=B110=
0%  perf-profile.children.cycles-pp.rcu_qs
      0.00            +0.0        0.00            +0.0        0.03 =C2=B112=
7%  perf-profile.children.cycles-pp.cpuidle_enter
      0.00            +0.0        0.00            +0.0        0.03 =C2=B112=
7%  perf-profile.children.cycles-pp.cpuidle_enter_state
      0.00            +0.0        0.00            +0.0        0.03 =C2=B1 8=
2%  perf-profile.children.cycles-pp.security_file_send_sigiotask
      0.00            +0.0        0.00            +0.0        0.04 =C2=B112=
6%  perf-profile.children.cycles-pp.start_secondary
      0.00            +0.0        0.00            +0.0        0.04 =C2=B110=
6%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
      0.00            +0.0        0.00            +0.0        0.04 =C2=B110=
6%  perf-profile.children.cycles-pp.cpu_startup_entry
      0.00            +0.0        0.00            +0.0        0.04 =C2=B110=
6%  perf-profile.children.cycles-pp.do_idle
      0.00            +0.0        0.00            +0.0        0.04 =C2=B1 6=
9%  perf-profile.children.cycles-pp.__slab_free
      0.00            +0.0        0.00            +0.0        0.05 =C2=B1 3=
3%  perf-profile.children.cycles-pp.__x64_sys_read
      0.00            +0.0        0.00            +0.0        0.05 =C2=B1 7=
0%  perf-profile.children.cycles-pp.error_entry
      0.00            +0.0        0.00            +0.0        0.05 =C2=B1 9=
2%  perf-profile.children.cycles-pp.__mutex_lock
      0.00            +0.0        0.00            +0.1        0.05 =C2=B1 9=
3%  perf-profile.children.cycles-pp.asm_sysvec_reschedule_ipi
      0.00            +0.0        0.00            +0.1        0.06 =C2=B1  =
7%  perf-profile.children.cycles-pp.rw_verify_area
      0.00            +0.0        0.00            +0.1        0.06 =C2=B1  =
7%  perf-profile.children.cycles-pp.rb_next
      0.00            +0.0        0.00            +0.1        0.06 =C2=B1 1=
1%  perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.00            +0.0        0.00            +0.1        0.06 =C2=B1  =
8%  perf-profile.children.cycles-pp.uprobe_deny_signal
      0.00            +0.0        0.00            +0.1        0.07 =C2=B1 1=
2%  perf-profile.children.cycles-pp.apparmor_file_permission
      0.00            +0.0        0.00            +0.1        0.07 =C2=B1 1=
4%  perf-profile.children.cycles-pp.complete_signal
      0.00            +0.0        0.00            +0.1        0.08 =C2=B1  =
7%  perf-profile.children.cycles-pp.send_signal
      0.00            +0.0        0.00            +0.1        0.08 =C2=B1  =
6%  perf-profile.children.cycles-pp.iov_iter_init
      0.00            +0.0        0.00            +0.1        0.08 =C2=B1  =
7%  perf-profile.children.cycles-pp.make_kuid
      0.00            +0.0        0.00            +0.1        0.09 =C2=B1  =
7%  perf-profile.children.cycles-pp.task_tick_fair
      0.00            +0.0        0.00            +0.1        0.09 =C2=B1  =
6%  perf-profile.children.cycles-pp.rb_insert_color
      0.00            +0.0        0.00            +0.1        0.09 =C2=B1  =
7%  perf-profile.children.cycles-pp.switch_ldt
      0.00            +0.0        0.00            +0.1        0.10 =C2=B1  =
8%  perf-profile.children.cycles-pp.make_kgid
      0.00            +0.0        0.00            +0.1        0.10 =C2=B1  =
4%  perf-profile.children.cycles-pp.wakeup_preempt_entity
      0.00            +0.0        0.00            +0.1        0.11 =C2=B1  =
6%  perf-profile.children.cycles-pp.rcu_note_context_switch
      0.00            +0.0        0.00            +0.1        0.12 =C2=B1  =
4%  perf-profile.children.cycles-pp.__local_bh_enable_ip
      0.00            +0.0        0.00            +0.1        0.12 =C2=B1 4=
9%  perf-profile.children.cycles-pp.try_to_wake_up
      0.00            +0.0        0.00            +0.1        0.12 =C2=B1 5=
1%  perf-profile.children.cycles-pp.schedule_hrtimeout_range_clock
      0.00            +0.0        0.00            +0.1        0.12 =C2=B1  =
8%  perf-profile.children.cycles-pp.scheduler_tick
      0.00            +0.0        0.00            +0.1        0.12 =C2=B1  =
3%  perf-profile.children.cycles-pp.rb_erase
      0.00            +0.0        0.00            +0.1        0.13 =C2=B1 5=
1%  perf-profile.children.cycles-pp.poll_schedule_timeout
      0.00            +0.0        0.00            +0.1        0.13 =C2=B1 4=
9%  perf-profile.children.cycles-pp.signal_wake_up_state
      0.00            +0.0        0.00            +0.1        0.13 =C2=B1  =
3%  perf-profile.children.cycles-pp.__list_add_valid
      0.00            +0.0        0.00            +0.1        0.13 =C2=B1  =
3%  perf-profile.children.cycles-pp.__irqentry_text_end
      0.00            +0.0        0.00            +0.1        0.13 =C2=B1  =
4%  perf-profile.children.cycles-pp.rcu_read_unlock_strict
      0.00            +0.0        0.00            +0.1        0.14 =C2=B1  =
3%  perf-profile.children.cycles-pp.kmem_cache_alloc
      0.00            +0.0        0.00            +0.1        0.14 =C2=B1  =
7%  perf-profile.children.cycles-pp.__x64_sys_write
      0.00            +0.0        0.00            +0.1        0.14 =C2=B1  =
6%  perf-profile.children.cycles-pp.anon_pipe_buf_release
      0.00            +0.0        0.00            +0.1        0.14 =C2=B1 4=
4%  perf-profile.children.cycles-pp.do_select
      0.00            +0.0        0.00            +0.1        0.15 =C2=B1  =
4%  perf-profile.children.cycles-pp.aa_file_perm
      0.00            +0.0        0.00            +0.2        0.15 =C2=B1  =
4%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.00            +0.0        0.00            +0.2        0.16 =C2=B1  =
4%  perf-profile.children.cycles-pp.map_id_range_down
      0.00            +0.0        0.00            +0.2        0.16 =C2=B1 1=
2%  perf-profile.children.cycles-pp.ktime_get
      0.00            +0.0        0.00            +0.2        0.16 =C2=B1 4=
4%  perf-profile.children.cycles-pp.core_sys_select
      0.00            +0.0        0.00            +0.2        0.16 =C2=B1  =
3%  perf-profile.children.cycles-pp.check_cfs_rq_runtime
      0.00            +0.0        0.00            +0.2        0.16 =C2=B1  =
7%  perf-profile.children.cycles-pp.timestamp_truncate
      0.00            +0.0        0.00            +0.2        0.17 =C2=B1  =
4%  perf-profile.children.cycles-pp.rcu_all_qs
      0.00            +0.0        0.00            +0.2        0.17 =C2=B1 1=
1%  perf-profile.children.cycles-pp.clockevents_program_event
      0.00            +0.0        0.00            +0.2        0.17 =C2=B1 1=
0%  perf-profile.children.cycles-pp.kmem_cache_free
      0.00            +0.0        0.00            +0.2        0.17 =C2=B1  =
7%  perf-profile.children.cycles-pp.update_process_times
      0.00            +0.0        0.00            +0.2        0.17 =C2=B1  =
7%  perf-profile.children.cycles-pp.tick_sched_handle
      0.00            +0.0        0.00            +0.2        0.18 =C2=B1  =
4%  perf-profile.children.cycles-pp.__list_del_entry_valid
      0.00            +0.0        0.00            +0.2        0.18 =C2=B1 4=
3%  perf-profile.children.cycles-pp.kern_select
      0.00            +0.0        0.00            +0.2        0.18 =C2=B1 4=
2%  perf-profile.children.cycles-pp.__x64_sys_select
      0.00            +0.0        0.00            +0.2        0.18 =C2=B1  =
4%  perf-profile.children.cycles-pp.__enqueue_entity
      0.00            +0.0        0.00            +0.2        0.19 =C2=B1  =
4%  perf-profile.children.cycles-pp.__rdgsbase_inactive
      0.00            +0.0        0.00            +0.2        0.19 =C2=B1  =
8%  perf-profile.children.cycles-pp.tick_sched_timer
      0.00            +0.0        0.00            +0.2        0.21 =C2=B1  =
5%  perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
      0.00            +0.0        0.00            +0.2        0.24 =C2=B1  =
8%  perf-profile.children.cycles-pp.prepare_signal
      0.00            +0.0        0.00            +0.2        0.24 =C2=B1  =
7%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.00            +0.0        0.00            +0.2        0.24 =C2=B1  =
9%  perf-profile.children.cycles-pp.perf_trace_sched_switch
      0.00            +0.0        0.00            +0.3        0.26 =C2=B1 1=
4%  perf-profile.children.cycles-pp.__cgroup_account_cputime
      0.00            +0.0        0.00            +0.3        0.26 =C2=B1  =
4%  perf-profile.children.cycles-pp.__clear_user
      0.00            +0.0        0.00            +0.3        0.27 =C2=B1  =
4%  perf-profile.children.cycles-pp.finish_task_switch
      0.00            +0.0        0.00            +0.3        0.28 =C2=B1  =
3%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.00            +0.0        0.00            +0.3        0.28 =C2=B1  =
2%  perf-profile.children.cycles-pp.__put_user_nocheck_4
      0.00            +0.0        0.00            +0.3        0.29 =C2=B1  =
3%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.00            +0.0        0.00            +0.3        0.29 =C2=B1  =
3%  perf-profile.children.cycles-pp.__cond_resched
      0.00            +0.0        0.00            +0.3        0.30 =C2=B1 1=
1%  perf-profile.children.cycles-pp.clear_buddies
      0.00            +0.0        0.00            +0.3        0.31 =C2=B1  =
2%  perf-profile.children.cycles-pp.__wrgsbase_inactive
      0.00            +0.0        0.00            +0.3        0.35 =C2=B1  =
6%  perf-profile.children.cycles-pp.perf_trace_sched_stat_runtime
      0.00            +0.0        0.00            +0.4        0.37 =C2=B1  =
3%  perf-profile.children.cycles-pp.__calc_delta
      0.00            +0.0        0.00            +0.4        0.38 =C2=B1  =
3%  perf-profile.children.cycles-pp.__get_user_nocheck_4
      0.00            +0.0        0.00            +0.4        0.43 =C2=B1  =
2%  perf-profile.children.cycles-pp.restore_altstack
      0.00            +0.0        0.00            +0.5        0.46 =C2=B1  =
2%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.00            +0.0        0.00            +0.5        0.46 =C2=B1  =
3%  perf-profile.children.cycles-pp.update_min_vruntime
      0.00            +0.0        0.00            +0.5        0.46 =C2=B1  =
7%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.00            +0.0        0.00            +0.5        0.46 =C2=B1  =
2%  perf-profile.children.cycles-pp.copy_user_generic_unrolled
      0.00            +0.0        0.00            +0.5        0.47 =C2=B1  =
7%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +0.5        0.48 =C2=B1  =
3%  perf-profile.children.cycles-pp.copyout
      0.00            +0.0        0.00            +0.5        0.49 =C2=B1  =
7%  perf-profile.children.cycles-pp.cpuacct_charge
      0.00            +0.0        0.00            +0.5        0.50 =C2=B1  =
2%  perf-profile.children.cycles-pp.__get_user_nocheck_8
      0.00            +0.0        0.00            +0.5        0.51 =C2=B1  =
8%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +0.5        0.52 =C2=B1  =
5%  perf-profile.children.cycles-pp.file_update_time
      0.00            +0.0        0.00            +0.5        0.52 =C2=B1  =
3%  perf-profile.children.cycles-pp.native_sched_clock
      0.00            +0.0        0.00            +0.5        0.53 =C2=B1  =
3%  perf-profile.children.cycles-pp.atime_needs_update
      0.00            +0.0        0.00            +0.5        0.53 =C2=B1  =
3%  perf-profile.children.cycles-pp.___perf_sw_event
      0.00            +0.0        0.00            +0.6        0.56 =C2=B1  =
7%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +0.6        0.56 =C2=B1  =
3%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.00            +0.0        0.00            +0.6        0.56 =C2=B1  =
2%  perf-profile.children.cycles-pp.current_time
      0.00            +0.0        0.00            +0.6        0.56        p=
erf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.00            +0.0        0.00            +0.6        0.57 =C2=B1  =
2%  perf-profile.children.cycles-pp.__might_sleep
      0.00            +0.0        0.00            +0.6        0.58 =C2=B1  =
3%  perf-profile.children.cycles-pp.touch_atime
      0.00            +0.0        0.00            +0.6        0.59 =C2=B1  =
3%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.00            +0.0        0.00            +0.6        0.61 =C2=B1 4=
7%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.00            +0.0        0.00            +0.6        0.61 =C2=B1  =
5%  perf-profile.children.cycles-pp._raw_read_lock_irqsave
      0.00            +0.0        0.00            +0.6        0.62 =C2=B1  =
3%  perf-profile.children.cycles-pp.__fget_light
      0.00            +0.0        0.00            +0.7        0.70 =C2=B1  =
2%  perf-profile.children.cycles-pp.__fdget_pos
      0.00            +0.0        0.00            +0.7        0.70 =C2=B1  =
3%  perf-profile.children.cycles-pp.__wake_up_common_lock
      0.00            +0.0        0.00            +0.7        0.73 =C2=B1  =
3%  perf-profile.children.cycles-pp.recalc_sigpending_tsk
      0.00            +0.0        0.00            +0.8        0.80        p=
erf-profile.children.cycles-pp.fsnotify
      0.00            +0.0        0.00            +0.8        0.81        p=
erf-profile.children.cycles-pp.__might_fault
      0.00            +0.0        0.00            +0.8        0.83        p=
erf-profile.children.cycles-pp._copy_from_user
      0.00            +0.0        0.00            +0.8        0.83 =C2=B1  =
3%  perf-profile.children.cycles-pp.__entry_text_start
      0.00            +0.0        0.00            +0.8        0.83 =C2=B1  =
2%  perf-profile.children.cycles-pp.copy_page_to_iter
      0.00            +0.0        0.00            +0.8        0.85 =C2=B1  =
6%  perf-profile.children.cycles-pp._raw_read_lock
      0.00            +0.0        0.00            +0.9        0.86 =C2=B1  =
3%  perf-profile.children.cycles-pp.common_file_perm
      0.00            +0.0        0.00            +0.9        0.86        p=
erf-profile.children.cycles-pp.___might_sleep
      0.00            +0.0        0.00            +0.9        0.88        p=
erf-profile.children.cycles-pp.pick_next_entity
      0.00            +0.0        0.00            +0.9        0.92 =C2=B1  =
2%  perf-profile.children.cycles-pp.save_fpregs_to_fpstate
      0.00            +0.0        0.00            +0.9        0.93 =C2=B1  =
3%  perf-profile.children.cycles-pp.copyin
      0.00            +0.0        0.00            +0.9        0.95 =C2=B1 1=
8%  perf-profile.children.cycles-pp.__lock_task_sighand
      0.00            +0.0        0.00            +1.0        0.98        p=
erf-profile.children.cycles-pp.fpregs_mark_activate
      0.00            +0.0        0.00            +1.0        1.01 =C2=B1  =
3%  perf-profile.children.cycles-pp.__set_task_blocked
      0.00            +0.0        0.00            +1.0        1.04 =C2=B1  =
3%  perf-profile.children.cycles-pp.update_rq_clock
      0.00            +0.0        0.00            +1.0        1.05 =C2=B1 1=
2%  perf-profile.children.cycles-pp._raw_read_unlock_irqrestore
      0.00            +0.0        0.00            +1.1        1.08 =C2=B1  =
2%  perf-profile.children.cycles-pp.__switch_to
      0.00            +0.0        0.00            +1.1        1.10 =C2=B1  =
2%  perf-profile.children.cycles-pp.__restore_fpregs_from_fpstate
      0.00            +0.0        0.00            +1.1        1.15 =C2=B1  =
3%  perf-profile.children.cycles-pp.set_next_entity
      0.00            +0.0        0.00            +1.2        1.25        p=
erf-profile.children.cycles-pp.fpu__clear_user_states
      0.00            +0.0        0.00            +1.3        1.33 =C2=B1  =
2%  perf-profile.children.cycles-pp.__switch_to_asm
      0.00            +0.0        0.00            +1.4        1.39 =C2=B1 1=
2%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.00            +0.0        0.00            +1.5        1.47 =C2=B1  =
6%  perf-profile.children.cycles-pp.mutex_unlock
      0.00            +0.0        0.00            +1.5        1.53 =C2=B1  =
3%  perf-profile.children.cycles-pp.put_prev_entity
      0.00            +0.0        0.00            +1.6        1.58        p=
erf-profile.children.cycles-pp.security_file_permission
      0.00            +0.0        0.00            +1.6        1.62 =C2=B1  =
2%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.00            +0.0        0.00            +1.6        1.65 =C2=B1  =
3%  perf-profile.children.cycles-pp.update_load_avg
      0.00            +0.0        0.00            +1.7        1.72 =C2=B1  =
4%  perf-profile.children.cycles-pp.recalc_sigpending
      0.00            +0.0        0.00            +1.8        1.75 =C2=B1  =
3%  perf-profile.children.cycles-pp.copy_page_from_iter
      0.00            +0.0        0.00            +1.9        1.86 =C2=B1  =
2%  perf-profile.children.cycles-pp.copy_user_enhanced_fast_string
      0.00            +0.0        0.00            +1.9        1.89        p=
erf-profile.children.cycles-pp.syscall_return_via_sysret
      0.00            +0.0        0.00            +2.0        2.04 =C2=B1  =
2%  perf-profile.children.cycles-pp.load_new_mm_cr3
      0.00            +0.0        0.00            +2.1        2.10 =C2=B1  =
2%  perf-profile.children.cycles-pp.mutex_lock
      0.00            +0.0        0.00            +2.3        2.25 =C2=B1  =
2%  perf-profile.children.cycles-pp.switch_fpu_return
      0.00            +0.0        0.00            +2.3        2.26 =C2=B1  =
8%  perf-profile.children.cycles-pp.signal_setup_done
      0.00            +0.0        0.00            +2.3        2.28        p=
erf-profile.children.cycles-pp.__fpu_restore_sig
      0.00            +0.0        0.00            +2.3        2.31        p=
erf-profile.children.cycles-pp.fpu__restore_sig
      0.00            +0.0        0.00            +2.5        2.51        p=
erf-profile.children.cycles-pp.copy_fpstate_to_sigframe
      0.00            +0.0        0.00            +2.9        2.94        p=
erf-profile.children.cycles-pp.restore_sigcontext
      0.00            +0.0        0.00            +3.1        3.13        p=
erf-profile.children.cycles-pp.__setup_rt_frame
      0.00            +0.0        0.00            +3.2        3.17 =C2=B1  =
2%  perf-profile.children.cycles-pp.update_curr
      0.00            +0.0        0.00            +3.2        3.24 =C2=B1  =
2%  perf-profile.children.cycles-pp._raw_spin_lock
      0.00            +0.0        0.00            +3.3        3.32        p=
erf-profile.children.cycles-pp.pipe_read
      0.00            +0.0        0.00            +3.5        3.50 =C2=B1  =
4%  perf-profile.children.cycles-pp.yield_task_fair
      0.00            +0.0        0.00            +3.5        3.54        p=
erf-profile.children.cycles-pp.new_sync_read
      0.00            +0.0        0.00            +3.7        3.66 =C2=B1  =
4%  perf-profile.children.cycles-pp.__set_current_blocked
      0.00            +0.0        0.00            +4.3        4.35 =C2=B1  =
2%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.00            +0.0        0.00            +4.7        4.69        p=
erf-profile.children.cycles-pp._raw_spin_lock_irq
      0.00            +0.0        0.00            +4.7        4.73 =C2=B1  =
2%  perf-profile.children.cycles-pp.do_sched_yield
      0.00            +0.0        0.00            +4.7        4.73        p=
erf-profile.children.cycles-pp.vfs_read
      0.00            +0.0        0.00            +5.1        5.06        p=
erf-profile.children.cycles-pp.ksys_read
      0.00            +0.0        0.00            +5.5        5.48        p=
erf-profile.children.cycles-pp.__x64_sys_rt_sigreturn
      0.00            +0.0        0.00            +5.7        5.70        p=
erf-profile.children.cycles-pp.pick_next_task_fair
      0.00            +0.0        0.00           +13.8       13.78 =C2=B1  =
2%  perf-profile.children.cycles-pp.inc_rlimit_ucounts
      0.00            +0.0        0.00           +13.9       13.89 =C2=B1  =
2%  perf-profile.children.cycles-pp.dec_rlimit_ucounts
      0.00            +0.0        0.00           +13.9       13.93 =C2=B1  =
2%  perf-profile.children.cycles-pp.__sigqueue_free
      0.00            +0.0        0.00           +14.1       14.10 =C2=B1  =
2%  perf-profile.children.cycles-pp.__sigqueue_alloc
      0.00            +0.0        0.00           +14.4       14.39 =C2=B1  =
2%  perf-profile.children.cycles-pp.__dequeue_signal
      0.00            +0.0        0.00           +15.0       15.00        p=
erf-profile.children.cycles-pp.__send_signal
      0.00            +0.0        0.00           +15.3       15.26 =C2=B1  =
2%  perf-profile.children.cycles-pp.dequeue_signal
      0.00            +0.0        0.00           +16.3       16.29        p=
erf-profile.children.cycles-pp.do_send_sig_info
      0.00            +0.0        0.00           +16.5       16.54 =C2=B1  =
2%  perf-profile.children.cycles-pp.get_signal
      0.00            +0.0        0.00           +16.6       16.55        p=
erf-profile.children.cycles-pp.send_sigio_to_task
      0.00            +0.0        0.00           +16.8       16.79        p=
erf-profile.children.cycles-pp.__schedule
      0.00            +0.0        0.00           +17.1       17.10        p=
erf-profile.children.cycles-pp.schedule
      0.00            +0.0        0.00           +17.4       17.42        p=
erf-profile.children.cycles-pp.send_sigio
      0.00            +0.0        0.00           +20.0       20.04        p=
erf-profile.children.cycles-pp.kill_fasync
      0.00            +0.0        0.00           +22.1       22.06        p=
erf-profile.children.cycles-pp.__x64_sys_sched_yield
      0.00            +0.0        0.00           +23.4       23.35        p=
erf-profile.children.cycles-pp.arch_do_signal_or_restart
      0.00            +0.0        0.00           +26.1       26.10        p=
erf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.00            +0.0        0.00           +26.6       26.58        p=
erf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.00            +0.0        0.00           +27.5       27.46        p=
erf-profile.children.cycles-pp.pipe_write
      0.00            +0.0        0.00           +27.9       27.90        p=
erf-profile.children.cycles-pp.new_sync_write
      0.00            +0.0        0.00           +29.8       29.75        p=
erf-profile.children.cycles-pp.vfs_write
      0.00            +0.0        0.00           +30.4       30.36        p=
erf-profile.children.cycles-pp.ksys_write
      0.00            +0.0        0.00           +91.0       90.97        p=
erf-profile.children.cycles-pp.do_syscall_64
      0.00            +0.0        0.00           +92.0       91.96        p=
erf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +0.0        0.01 =C2=B129=
9%  perf-profile.self.cycles-pp.__sigqueue_free
      0.00            +0.0        0.00            +0.0        0.01 =C2=B130=
0%  perf-profile.self.cycles-pp.intel_idle
      0.00            +0.0        0.00            +0.0        0.01 =C2=B120=
0%  perf-profile.self.cycles-pp.security_file_send_sigiotask
      0.00            +0.0        0.00            +0.0        0.01 =C2=B120=
0%  perf-profile.self.cycles-pp.touch_atime
      0.00            +0.0        0.00            +0.0        0.01 =C2=B120=
0%  perf-profile.self.cycles-pp.__wake_up_common
      0.00            +0.0        0.00            +0.0        0.01 =C2=B120=
2%  perf-profile.self.cycles-pp.sync_regs
      0.00            +0.0        0.00            +0.0        0.02 =C2=B115=
4%  perf-profile.self.cycles-pp.mutex_spin_on_owner
      0.00            +0.0        0.00            +0.0        0.03 =C2=B110=
0%  perf-profile.self.cycles-pp.__x64_sys_read
      0.00            +0.0        0.00            +0.0        0.04 =C2=B1 6=
7%  perf-profile.self.cycles-pp.__set_task_blocked
      0.00            +0.0        0.00            +0.0        0.04 =C2=B1 6=
9%  perf-profile.self.cycles-pp.__slab_free
      0.00            +0.0        0.00            +0.1        0.05 =C2=B1 3=
4%  perf-profile.self.cycles-pp.apparmor_file_permission
      0.00            +0.0        0.00            +0.1        0.05 =C2=B1  =
5%  perf-profile.self.cycles-pp.rw_verify_area
      0.00            +0.0        0.00            +0.1        0.05 =C2=B1 1=
2%  perf-profile.self.cycles-pp.complete_signal
      0.00            +0.0        0.00            +0.1        0.05 =C2=B1  =
9%  perf-profile.self.cycles-pp.rb_next
      0.00            +0.0        0.00            +0.1        0.06 =C2=B1 1=
0%  perf-profile.self.cycles-pp.sched_clock_cpu
      0.00            +0.0        0.00            +0.1        0.06 =C2=B1  =
5%  perf-profile.self.cycles-pp.restore_altstack
      0.00            +0.0        0.00            +0.1        0.06 =C2=B1  =
7%  perf-profile.self.cycles-pp.uprobe_deny_signal
      0.00            +0.0        0.00            +0.1        0.06 =C2=B1 1=
4%  perf-profile.self.cycles-pp.rcu_note_context_switch
      0.00            +0.0        0.00            +0.1        0.06 =C2=B1 1=
1%  perf-profile.self.cycles-pp.cgroup_rstat_updated
      0.00            +0.0        0.00            +0.1        0.07 =C2=B1 1=
0%  perf-profile.self.cycles-pp.send_signal
      0.00            +0.0        0.00            +0.1        0.07        p=
erf-profile.self.cycles-pp.ksys_read
      0.00            +0.0        0.00            +0.1        0.07 =C2=B1  =
7%  perf-profile.self.cycles-pp.iov_iter_init
      0.00            +0.0        0.00            +0.1        0.08 =C2=B1  =
6%  perf-profile.self.cycles-pp._copy_from_user
      0.00            +0.0        0.00            +0.1        0.08 =C2=B1  =
5%  perf-profile.self.cycles-pp.wakeup_preempt_entity
      0.00            +0.0        0.00            +0.1        0.08 =C2=B1 1=
0%  perf-profile.self.cycles-pp.copyin
      0.00            +0.0        0.00            +0.1        0.08 =C2=B1  =
5%  perf-profile.self.cycles-pp.check_cfs_rq_runtime
      0.00            +0.0        0.00            +0.1        0.08 =C2=B1  =
7%  perf-profile.self.cycles-pp.rb_insert_color
      0.00            +0.0        0.00            +0.1        0.09 =C2=B1  =
6%  perf-profile.self.cycles-pp.__fdget_pos
      0.00            +0.0        0.00            +0.1        0.09 =C2=B1  =
9%  perf-profile.self.cycles-pp.__wake_up_common_lock
      0.00            +0.0        0.00            +0.1        0.09 =C2=B1  =
6%  perf-profile.self.cycles-pp.switch_ldt
      0.00            +0.0        0.00            +0.1        0.10        p=
erf-profile.self.cycles-pp.rb_erase
      0.00            +0.0        0.00            +0.1        0.10 =C2=B1  =
6%  perf-profile.self.cycles-pp.dequeue_signal
      0.00            +0.0        0.00            +0.1        0.10 =C2=B1  =
4%  perf-profile.self.cycles-pp.__local_bh_enable_ip
      0.00            +0.0        0.00            +0.1        0.11 =C2=B1  =
4%  perf-profile.self.cycles-pp.rcu_read_unlock_strict
      0.00            +0.0        0.00            +0.1        0.11 =C2=B1  =
4%  perf-profile.self.cycles-pp.__cond_resched
      0.00            +0.0        0.00            +0.1        0.12 =C2=B1  =
7%  perf-profile.self.cycles-pp.kmem_cache_free
      0.00            +0.0        0.00            +0.1        0.12 =C2=B1  =
4%  perf-profile.self.cycles-pp.kmem_cache_alloc
      0.00            +0.0        0.00            +0.1        0.12 =C2=B1  =
3%  perf-profile.self.cycles-pp.aa_file_perm
      0.00            +0.0        0.00            +0.1        0.12 =C2=B1  =
3%  perf-profile.self.cycles-pp.__list_add_valid
      0.00            +0.0        0.00            +0.1        0.13 =C2=B1  =
9%  perf-profile.self.cycles-pp.__x64_sys_write
      0.00            +0.0        0.00            +0.1        0.13        p=
erf-profile.self.cycles-pp.__irqentry_text_end
      0.00            +0.0        0.00            +0.1        0.13 =C2=B1  =
4%  perf-profile.self.cycles-pp.restore_sigcontext
      0.00            +0.0        0.00            +0.1        0.13 =C2=B1 1=
8%  perf-profile.self.cycles-pp.__set_current_blocked
      0.00            +0.0        0.00            +0.1        0.13 =C2=B1  =
3%  perf-profile.self.cycles-pp.atime_needs_update
      0.00            +0.0        0.00            +0.1        0.14 =C2=B1  =
4%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.00            +0.0        0.00            +0.1        0.14 =C2=B1  =
6%  perf-profile.self.cycles-pp.anon_pipe_buf_release
      0.00            +0.0        0.00            +0.1        0.14 =C2=B1 1=
2%  perf-profile.self.cycles-pp.__lock_task_sighand
      0.00            +0.0        0.00            +0.1        0.14 =C2=B1  =
4%  perf-profile.self.cycles-pp.__list_del_entry_valid
      0.00            +0.0        0.00            +0.1        0.14 =C2=B1  =
4%  perf-profile.self.cycles-pp.rcu_all_qs
      0.00            +0.0        0.00            +0.1        0.15 =C2=B1 1=
3%  perf-profile.self.cycles-pp.ktime_get
      0.00            +0.0        0.00            +0.1        0.15 =C2=B1  =
4%  perf-profile.self.cycles-pp.map_id_range_down
      0.00            +0.0        0.00            +0.1        0.15 =C2=B1  =
8%  perf-profile.self.cycles-pp.timestamp_truncate
      0.00            +0.0        0.00            +0.2        0.16 =C2=B1  =
5%  perf-profile.self.cycles-pp.copy_page_to_iter
      0.00            +0.0        0.00            +0.2        0.16 =C2=B1  =
4%  perf-profile.self.cycles-pp.__enqueue_entity
      0.00            +0.0        0.00            +0.2        0.16 =C2=B1  =
4%  perf-profile.self.cycles-pp.arch_do_signal_or_restart
      0.00            +0.0        0.00            +0.2        0.17 =C2=B1  =
3%  perf-profile.self.cycles-pp.ksys_write
      0.00            +0.0        0.00            +0.2        0.17 =C2=B1  =
2%  perf-profile.self.cycles-pp.__sigqueue_alloc
      0.00            +0.0        0.00            +0.2        0.17 =C2=B1  =
5%  perf-profile.self.cycles-pp.finish_task_switch
      0.00            +0.0        0.00            +0.2        0.18 =C2=B1  =
4%  perf-profile.self.cycles-pp.do_send_sig_info
      0.00            +0.0        0.00            +0.2        0.18 =C2=B1  =
3%  perf-profile.self.cycles-pp.__x64_sys_rt_sigreturn
      0.00            +0.0        0.00            +0.2        0.18 =C2=B1  =
6%  perf-profile.self.cycles-pp.__might_fault
      0.00            +0.0        0.00            +0.2        0.18 =C2=B1  =
3%  perf-profile.self.cycles-pp.__rdgsbase_inactive
      0.00            +0.0        0.00            +0.2        0.19 =C2=B1  =
6%  perf-profile.self.cycles-pp.file_update_time
      0.00            +0.0        0.00            +0.2        0.20 =C2=B1  =
4%  perf-profile.self.cycles-pp.current_time
      0.00            +0.0        0.00            +0.2        0.20 =C2=B1  =
6%  perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
      0.00            +0.0        0.00            +0.2        0.20 =C2=B1  =
3%  perf-profile.self.cycles-pp.new_sync_read
      0.00            +0.0        0.00            +0.2        0.20 =C2=B1  =
3%  perf-profile.self.cycles-pp.send_sigio
      0.00            +0.0        0.00            +0.2        0.20 =C2=B1 2=
0%  perf-profile.self.cycles-pp.__cgroup_account_cputime
      0.00            +0.0        0.00            +0.2        0.21 =C2=B1  =
2%  perf-profile.self.cycles-pp.get_signal
      0.00            +0.0        0.00            +0.2        0.21 =C2=B1  =
5%  perf-profile.self.cycles-pp.put_prev_entity
      0.00            +0.0        0.00            +0.2        0.21 =C2=B1  =
5%  perf-profile.self.cycles-pp.send_sigio_to_task
      0.00            +0.0        0.00            +0.2        0.22 =C2=B1  =
9%  perf-profile.self.cycles-pp.prepare_signal
      0.00            +0.0        0.00            +0.2        0.22 =C2=B1  =
2%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.00            +0.0        0.00            +0.2        0.23 =C2=B1  =
3%  perf-profile.self.cycles-pp.__clear_user
      0.00            +0.0        0.00            +0.2        0.24 =C2=B1  =
8%  perf-profile.self.cycles-pp.perf_trace_sched_switch
      0.00            +0.0        0.00            +0.3        0.25 =C2=B1  =
3%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.00            +0.0        0.00            +0.3        0.25 =C2=B1  =
2%  perf-profile.self.cycles-pp.vfs_read
      0.00            +0.0        0.00            +0.3        0.26 =C2=B1  =
5%  perf-profile.self.cycles-pp.__dequeue_signal
      0.00            +0.0        0.00            +0.3        0.26 =C2=B1  =
7%  perf-profile.self.cycles-pp.set_next_entity
      0.00            +0.0        0.00            +0.3        0.28 =C2=B1  =
2%  perf-profile.self.cycles-pp.__put_user_nocheck_4
      0.00            +0.0        0.00            +0.3        0.28 =C2=B1  =
2%  perf-profile.self.cycles-pp.pipe_read
      0.00            +0.0        0.00            +0.3        0.28 =C2=B1  =
2%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.00            +0.0        0.00            +0.3        0.28 =C2=B1 1=
3%  perf-profile.self.cycles-pp.clear_buddies
      0.00            +0.0        0.00            +0.3        0.31 =C2=B1  =
2%  perf-profile.self.cycles-pp.__wrgsbase_inactive
      0.00            +0.0        0.00            +0.3        0.32 =C2=B1  =
5%  perf-profile.self.cycles-pp.copy_page_from_iter
      0.00            +0.0        0.00            +0.3        0.32 =C2=B1  =
2%  perf-profile.self.cycles-pp.schedule
      0.00            +0.0        0.00            +0.3        0.33 =C2=B1  =
3%  perf-profile.self.cycles-pp.__x64_sys_sched_yield
      0.00            +0.0        0.00            +0.3        0.33 =C2=B1  =
5%  perf-profile.self.cycles-pp.do_sched_yield
      0.00            +0.0        0.00            +0.3        0.34 =C2=B1  =
7%  perf-profile.self.cycles-pp.perf_trace_sched_stat_runtime
      0.00            +0.0        0.00            +0.4        0.36 =C2=B1  =
3%  perf-profile.self.cycles-pp.__calc_delta
      0.00            +0.0        0.00            +0.4        0.37 =C2=B1  =
3%  perf-profile.self.cycles-pp.__get_user_nocheck_4
      0.00            +0.0        0.00            +0.4        0.37 =C2=B1  =
4%  perf-profile.self.cycles-pp.new_sync_write
      0.00            +0.0        0.00            +0.4        0.42 =C2=B1  =
2%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.00            +0.0        0.00            +0.4        0.42 =C2=B1 1=
0%  perf-profile.self.cycles-pp.yield_task_fair
      0.00            +0.0        0.00            +0.4        0.44 =C2=B1  =
2%  perf-profile.self.cycles-pp.copy_user_generic_unrolled
      0.00            +0.0        0.00            +0.4        0.44 =C2=B1  =
3%  perf-profile.self.cycles-pp.update_min_vruntime
      0.00            +0.0        0.00            +0.4        0.45 =C2=B1  =
4%  perf-profile.self.cycles-pp.__send_signal
      0.00            +0.0        0.00            +0.4        0.45 =C2=B1  =
5%  perf-profile.self.cycles-pp.update_rq_clock
      0.00            +0.0        0.00            +0.5        0.46 =C2=B1  =
4%  perf-profile.self.cycles-pp.___perf_sw_event
      0.00            +0.0        0.00            +0.5        0.48 =C2=B1  =
3%  perf-profile.self.cycles-pp.security_file_permission
      0.00            +0.0        0.00            +0.5        0.48 =C2=B1  =
2%  perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.00            +0.0        0.00            +0.5        0.48 =C2=B1  =
7%  perf-profile.self.cycles-pp.cpuacct_charge
      0.00            +0.0        0.00            +0.5        0.49 =C2=B1  =
2%  perf-profile.self.cycles-pp.__get_user_nocheck_8
      0.00            +0.0        0.00            +0.5        0.50 =C2=B1  =
2%  perf-profile.self.cycles-pp.__might_sleep
      0.00            +0.0        0.00            +0.5        0.51 =C2=B1  =
3%  perf-profile.self.cycles-pp.native_sched_clock
      0.00            +0.0        0.00            +0.5        0.52        p=
erf-profile.self.cycles-pp.do_syscall_64
      0.00            +0.0        0.00            +0.5        0.54        p=
erf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.00            +0.0        0.00            +0.5        0.55 =C2=B1  =
3%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.00            +0.0        0.00            +0.6        0.60 =C2=B1  =
2%  perf-profile.self.cycles-pp.__setup_rt_frame
      0.00            +0.0        0.00            +0.6        0.60 =C2=B1  =
3%  perf-profile.self.cycles-pp.__fget_light
      0.00            +0.0        0.00            +0.6        0.60 =C2=B1  =
2%  perf-profile.self.cycles-pp.vfs_write
      0.00            +0.0        0.00            +0.6        0.61 =C2=B1 4=
7%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.00            +0.0        0.00            +0.6        0.61 =C2=B1  =
5%  perf-profile.self.cycles-pp._raw_read_lock_irqsave
      0.00            +0.0        0.00            +0.7        0.65 =C2=B1  =
6%  perf-profile.self.cycles-pp.update_load_avg
      0.00            +0.0        0.00            +0.7        0.71 =C2=B1  =
3%  perf-profile.self.cycles-pp.common_file_perm
      0.00            +0.0        0.00            +0.7        0.72 =C2=B1  =
3%  perf-profile.self.cycles-pp.recalc_sigpending_tsk
      0.00            +0.0        0.00            +0.7        0.73 =C2=B1  =
2%  perf-profile.self.cycles-pp.pick_next_entity
      0.00            +0.0        0.00            +0.7        0.73 =C2=B1  =
2%  perf-profile.self.cycles-pp.fpu__clear_user_states
      0.00            +0.0        0.00            +0.7        0.73 =C2=B1  =
6%  perf-profile.self.cycles-pp.kill_fasync
      0.00            +0.0        0.00            +0.8        0.76        p=
erf-profile.self.cycles-pp.fsnotify
      0.00            +0.0        0.00            +0.8        0.83 =C2=B1  =
3%  perf-profile.self.cycles-pp.__entry_text_start
      0.00            +0.0        0.00            +0.8        0.84 =C2=B1  =
2%  perf-profile.self.cycles-pp.pipe_write
      0.00            +0.0        0.00            +0.8        0.84 =C2=B1  =
6%  perf-profile.self.cycles-pp._raw_read_lock
      0.00            +0.0        0.00            +0.8        0.85        p=
erf-profile.self.cycles-pp.___might_sleep
      0.00            +0.0        0.00            +0.9        0.92 =C2=B1  =
2%  perf-profile.self.cycles-pp.save_fpregs_to_fpstate
      0.00            +0.0        0.00            +0.9        0.92 =C2=B1  =
3%  perf-profile.self.cycles-pp.pick_next_task_fair
      0.00            +0.0        0.00            +0.9        0.93        p=
erf-profile.self.cycles-pp.fpregs_mark_activate
      0.00            +0.0        0.00            +0.9        0.94 =C2=B1 1=
3%  perf-profile.self.cycles-pp._raw_read_unlock_irqrestore
      0.00            +0.0        0.00            +1.0        1.00        p=
erf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +1.0        1.00 =C2=B1  =
6%  perf-profile.self.cycles-pp.recalc_sigpending
      0.00            +0.0        0.00            +1.0        1.04 =C2=B1  =
2%  perf-profile.self.cycles-pp.__switch_to
      0.00            +0.0        0.00            +1.1        1.09 =C2=B1  =
2%  perf-profile.self.cycles-pp.__restore_fpregs_from_fpstate
      0.00            +0.0        0.00            +1.1        1.14 =C2=B1  =
2%  perf-profile.self.cycles-pp.switch_fpu_return
      0.00            +0.0        0.00            +1.2        1.17 =C2=B1  =
6%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.00            +0.0        0.00            +1.2        1.23 =C2=B1  =
4%  perf-profile.self.cycles-pp.update_curr
      0.00            +0.0        0.00            +1.3        1.27        p=
erf-profile.self.cycles-pp.__fpu_restore_sig
      0.00            +0.0        0.00            +1.3        1.29 =C2=B1  =
2%  perf-profile.self.cycles-pp.__switch_to_asm
      0.00            +0.0        0.00            +1.4        1.43        p=
erf-profile.self.cycles-pp.copy_fpstate_to_sigframe
      0.00            +0.0        0.00            +1.4        1.45 =C2=B1  =
6%  perf-profile.self.cycles-pp.mutex_unlock
      0.00            +0.0        0.00            +1.6        1.59 =C2=B1  =
3%  perf-profile.self.cycles-pp.mutex_lock
      0.00            +0.0        0.00            +1.6        1.62 =C2=B1  =
2%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.00            +0.0        0.00            +1.8        1.82 =C2=B1  =
2%  perf-profile.self.cycles-pp.copy_user_enhanced_fast_string
      0.00            +0.0        0.00            +1.9        1.88        p=
erf-profile.self.cycles-pp.syscall_return_via_sysret
      0.00            +0.0        0.00            +2.0        2.03 =C2=B1  =
2%  perf-profile.self.cycles-pp.load_new_mm_cr3
      0.00            +0.0        0.00            +2.3        2.29 =C2=B1  =
2%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.00            +0.0        0.00            +2.5        2.46 =C2=B1  =
2%  perf-profile.self.cycles-pp.__schedule
      0.00            +0.0        0.00            +3.2        3.23 =C2=B1  =
2%  perf-profile.self.cycles-pp._raw_spin_lock
      0.00            +0.0        0.00            +4.3        4.28 =C2=B1  =
3%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.00            +0.0        0.00           +13.8       13.78 =C2=B1  =
2%  perf-profile.self.cycles-pp.inc_rlimit_ucounts
      0.00            +0.0        0.00           +13.9       13.88 =C2=B1  =
2%  perf-profile.self.cycles-pp.dec_rlimit_ucounts
    629.83 =C2=B1  7%     -37.1%     396.33            -3.6%     607.40 =C2=
=B1  2%  softirqs.BLOCK
     13.33 =C2=B1 68%     -48.8%       6.83 =C2=B1 87%     -65.5%       4.6=
0 =C2=B1142%  softirqs.CPU0.BLOCK
      1.00            +0.0%       1.00            +0.0%       1.00        s=
oftirqs.CPU0.HI
      0.33 =C2=B1141%      +0.0%       0.33 =C2=B1141%    +980.0%       3.6=
0 =C2=B1162%  softirqs.CPU0.NET_RX
      0.17 =C2=B1223%    -100.0%       0.00          +500.0%       1.00 =C2=
=B1268%  softirqs.CPU0.NET_TX
      8456 =C2=B1 12%     -53.8%       3910 =C2=B1 23%      -5.5%       799=
1 =C2=B1  9%  softirqs.CPU0.RCU
      7124 =C2=B1 11%     -13.0%       6197 =C2=B1 12%      +9.8%       782=
0 =C2=B1 12%  softirqs.CPU0.SCHED
    105.00            +5.4%     110.67 =C2=B1 11%      +0.8%     105.80    =
    softirqs.CPU0.TASKLET
    551.67 =C2=B1  9%     -10.6%     493.00 =C2=B1 10%     +31.6%     726.0=
0 =C2=B1 48%  softirqs.CPU0.TIMER
      8.67 =C2=B1143%     +73.1%      15.00 =C2=B1128%      -0.8%       8.6=
0 =C2=B1153%  softirqs.CPU1.BLOCK
      2.50 =C2=B1172%     +60.0%       4.00 =C2=B1201%     -56.0%       1.1=
0 =C2=B1131%  softirqs.CPU1.NET_RX
      0.50 =C2=B1152%    -100.0%       0.00           -60.0%       0.20 =C2=
=B1200%  softirqs.CPU1.NET_TX
      7835 =C2=B1 17%     -63.2%       2883 =C2=B1 22%     -15.3%       663=
7 =C2=B1 11%  softirqs.CPU1.RCU
      5643 =C2=B1 10%     -29.9%       3957 =C2=B1 27%     -11.2%       501=
0 =C2=B1 21%  softirqs.CPU1.SCHED
      0.00       +1.7e+101%       0.17 =C2=B1223%   +8e+101%       0.80 =C2=
=B1229%  softirqs.CPU1.TASKLET
    166.50 =C2=B1 85%     -77.3%      37.83 =C2=B1 43%     +58.0%     263.0=
0 =C2=B1190%  softirqs.CPU1.TIMER
      2.50 =C2=B1130%     -20.0%       2.00 =C2=B1223%     -68.0%       0.8=
0 =C2=B1300%  softirqs.CPU10.BLOCK
      1.17 =C2=B1 31%      +0.0%       1.17 =C2=B1 31%     +11.4%       1.3=
0 =C2=B1 35%  softirqs.CPU10.HI
      1.00 =C2=B1223%    +100.0%       2.00 =C2=B1160%     -10.0%       0.9=
0 =C2=B1182%  softirqs.CPU10.NET_RX
      0.00       +1.7e+101%       0.17 =C2=B1223%   +1e+101%       0.10 =C2=
=B1300%  softirqs.CPU10.NET_TX
      6951 =C2=B1 17%     -78.7%       1479 =C2=B1 41%     -12.3%       609=
6 =C2=B1 12%  softirqs.CPU10.RCU
      2989 =C2=B1 22%     -31.3%       2053 =C2=B1  7%      -3.3%       289=
2 =C2=B1  8%  softirqs.CPU10.SCHED
     36.50 =C2=B1  2%      -0.9%      36.17            +5.2%      38.40 =C2=
=B1 16%  softirqs.CPU10.TASKLET
    453.83 =C2=B1157%     -70.6%     133.50 =C2=B1159%     -79.1%      95.0=
0 =C2=B1 87%  softirqs.CPU10.TIMER
      0.17 =C2=B1223%    -100.0%       0.00           -40.0%       0.10 =C2=
=B1300%  softirqs.CPU11.BLOCK
      4.33 =C2=B1194%     -76.9%       1.00 =C2=B1182%    +352.3%      19.6=
0 =C2=B1291%  softirqs.CPU11.NET_RX
      0.00       +1.7e+101%       0.17 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU11.NET_TX
      6593 =C2=B1 20%     -87.4%     828.17 =C2=B1 26%      -8.9%       600=
7 =C2=B1 10%  softirqs.CPU11.RCU
      2745 =C2=B1 20%     -33.6%       1823 =C2=B1  4%      -0.7%       272=
5 =C2=B1  9%  softirqs.CPU11.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU11.TASKLET
     77.50 =C2=B1 64%     -69.0%      24.00 =C2=B1 59%     -32.4%      52.4=
0 =C2=B1 63%  softirqs.CPU11.TIMER
      1.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU12.BLOCK
      0.50 =C2=B1100%   +2133.3%      11.17 =C2=B1223%   +4540.0%      23.2=
0 =C2=B1287%  softirqs.CPU12.NET_RX
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU12.NET_TX
      6240 =C2=B1 27%     -85.8%     885.00 =C2=B1 19%      -2.4%       609=
1 =C2=B1 10%  softirqs.CPU12.RCU
      2455 =C2=B1 14%     -21.2%       1935 =C2=B1 11%     +28.6%       315=
6 =C2=B1 17%  softirqs.CPU12.SCHED
      3.67 =C2=B1101%     -54.5%       1.67 =C2=B1 44%     +25.5%       4.6=
0 =C2=B1169%  softirqs.CPU12.TASKLET
     68.50 =C2=B1 53%     -38.0%      42.50 =C2=B1109%     +42.8%      97.8=
0 =C2=B1 42%  softirqs.CPU12.TIMER
     59.00 =C2=B1223%     -96.6%       2.00 =C2=B1202%     -99.0%       0.6=
0 =C2=B1300%  softirqs.CPU13.BLOCK
      2.50 =C2=B1152%     -66.7%       0.83 =C2=B1128%    +592.0%      17.3=
0 =C2=B1290%  softirqs.CPU13.NET_RX
      0.00       +1.7e+101%       0.17 =C2=B1223%   +3e+101%       0.30 =C2=
=B1152%  softirqs.CPU13.NET_TX
      6500 =C2=B1 15%     -82.5%       1139 =C2=B1 62%      -7.2%       603=
2 =C2=B1 12%  softirqs.CPU13.RCU
      3092 =C2=B1 15%     -38.3%       1907 =C2=B1 14%      +8.1%       334=
2 =C2=B1 28%  softirqs.CPU13.SCHED
      1.33 =C2=B1 70%     +25.0%       1.67 =C2=B1 44%     +50.0%       2.0=
0        softirqs.CPU13.TASKLET
    411.33 =C2=B1159%     -94.5%      22.67 =C2=B1 20%     -16.5%     343.3=
0 =C2=B1181%  softirqs.CPU13.TIMER
      0.00       +3.1e+103%      31.17 =C2=B1223%   +3e+101%       0.30 =C2=
=B1213%  softirqs.CPU14.BLOCK
    869.67 =C2=B1144%     -98.5%      12.67 =C2=B1195%     -99.7%       2.8=
0 =C2=B1209%  softirqs.CPU14.NET_RX
      0.00          -100.0%       0.00         +4e+101%       0.40 =C2=B116=
5%  softirqs.CPU14.NET_TX
      6317 =C2=B1 16%     -72.2%       1757 =C2=B1 67%      -6.4%       591=
4 =C2=B1  8%  softirqs.CPU14.RCU
      2717 =C2=B1 11%     -30.4%       1890 =C2=B1 10%      +5.6%       287=
0 =C2=B1 13%  softirqs.CPU14.SCHED
      1.33 =C2=B1 70%     +25.0%       1.67 =C2=B1 44%     +65.0%       2.2=
0 =C2=B1 53%  softirqs.CPU14.TASKLET
    194.67 =C2=B1100%      -9.8%     175.50 =C2=B1188%     -73.6%      51.4=
0 =C2=B1 43%  softirqs.CPU14.TIMER
      0.17 =C2=B1223%  +24200.0%      40.50 =C2=B1223%    +560.0%       1.1=
0 =C2=B1216%  softirqs.CPU15.BLOCK
     12.83 =C2=B1206%     -79.2%       2.67 =C2=B1107%     -93.0%       0.9=
0 =C2=B1135%  softirqs.CPU15.NET_RX
      0.00       +3.3e+101%       0.33 =C2=B1141%   +1e+101%       0.10 =C2=
=B1300%  softirqs.CPU15.NET_TX
      6167 =C2=B1 18%     -78.1%       1352 =C2=B1 45%      -3.2%       597=
0 =C2=B1  9%  softirqs.CPU15.RCU
      2865 =C2=B1 17%     -17.6%       2361 =C2=B1 25%      -4.1%       274=
6 =C2=B1 13%  softirqs.CPU15.SCHED
      1.33 =C2=B1 70%      +0.0%       1.33 =C2=B1 70%     +35.0%       1.8=
0 =C2=B1 33%  softirqs.CPU15.TASKLET
    558.83 =C2=B1124%     -34.4%     366.33 =C2=B1200%     -85.1%      83.4=
0 =C2=B1147%  softirqs.CPU15.TIMER
     36.17 =C2=B1223%     -99.1%       0.33 =C2=B1223%     +29.4%      46.8=
0 =C2=B1285%  softirqs.CPU16.BLOCK
      1.50 =C2=B1113%     -55.6%       0.67 =C2=B1141%     +66.7%       2.5=
0 =C2=B1180%  softirqs.CPU16.NET_RX
      1.00 =C2=B1 81%     -83.3%       0.17 =C2=B1223%     -70.0%       0.3=
0 =C2=B1152%  softirqs.CPU16.NET_TX
      6968 =C2=B1 14%     -79.4%       1432 =C2=B1 24%      -5.5%       658=
6 =C2=B1 11%  softirqs.CPU16.RCU
      2401 =C2=B1  7%     -14.4%       2056 =C2=B1 27%     +22.6%       294=
3 =C2=B1 17%  softirqs.CPU16.SCHED
      1.33 =C2=B1 70%     -50.0%       0.67 =C2=B1141%     -25.0%       1.0=
0 =C2=B1100%  softirqs.CPU16.TASKLET
     75.00 =C2=B1 15%    +283.1%     287.33 =C2=B1203%     +15.9%      86.9=
0 =C2=B1 41%  softirqs.CPU16.TIMER
      0.00         +6e+103%      60.33 =C2=B1151% +7.2e+103%      71.80 =C2=
=B1158%  softirqs.CPU17.BLOCK
    620.17 =C2=B1223%     -99.0%       6.00 =C2=B1208%     -99.7%       1.6=
0 =C2=B1134%  softirqs.CPU17.NET_RX
      0.33 =C2=B1141%    -100.0%       0.00           -10.0%       0.30 =C2=
=B1213%  softirqs.CPU17.NET_TX
      7048 =C2=B1 22%     -81.4%       1310 =C2=B1 40%      -7.5%       651=
8 =C2=B1 10%  softirqs.CPU17.RCU
      2285 =C2=B1 15%     -15.4%       1932 =C2=B1 10%     +27.9%       292=
1 =C2=B1 13%  softirqs.CPU17.SCHED
      0.67 =C2=B1141%    -100.0%       0.00          +110.0%       1.40 =C2=
=B1277%  softirqs.CPU17.TASKLET
     77.83 =C2=B1 27%     -63.0%      28.83 =C2=B1 56%     +21.7%      94.7=
0 =C2=B1 51%  softirqs.CPU17.TIMER
    125.00 =C2=B1137%     -47.5%      65.67 =C2=B1136%     +39.2%     174.0=
0 =C2=B1 87%  softirqs.CPU18.BLOCK
      5.33 =C2=B1139%     -71.9%       1.50 =C2=B1142%     -88.8%       0.6=
0 =C2=B1133%  softirqs.CPU18.NET_RX
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU18.NET_TX
      6767 =C2=B1 19%     -82.5%       1182 =C2=B1 46%      -4.5%       646=
4 =C2=B1 10%  softirqs.CPU18.RCU
      2352 =C2=B1  8%      -7.7%       2170 =C2=B1 26%     +32.2%       311=
0 =C2=B1 15%  softirqs.CPU18.SCHED
      0.00       +3.3e+101%       0.33 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU18.TASKLET
    100.17 =C2=B1 73%    +218.6%     319.17 =C2=B1205%     +48.3%     148.5=
0 =C2=B1 92%  softirqs.CPU18.TIMER
    120.33 =C2=B1141%    -100.0%       0.00           -99.1%       1.10 =C2=
=B1224%  softirqs.CPU19.BLOCK
      0.33 =C2=B1141%    +450.0%       1.83 =C2=B1155%  +3.7e+05%       124=
5 =C2=B1218%  softirqs.CPU19.NET_RX
      0.17 =C2=B1223%    +200.0%       0.50 =C2=B1100%     +20.0%       0.2=
0 =C2=B1200%  softirqs.CPU19.NET_TX
      6639 =C2=B1 18%     -78.2%       1445 =C2=B1 58%      +2.6%       680=
8 =C2=B1 14%  softirqs.CPU19.RCU
      2519 =C2=B1 11%     -29.7%       1771 =C2=B1  9%     +45.0%       365=
4 =C2=B1 28%  softirqs.CPU19.SCHED
      3.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU19.TASKLET
    154.83 =C2=B1 65%     -81.8%      28.17 =C2=B1 54%    +187.1%     444.5=
0 =C2=B1174%  softirqs.CPU19.TIMER
      3.33 =C2=B1145%     +35.0%       4.50 =C2=B1223%     +50.0%       5.0=
0 =C2=B1163%  softirqs.CPU2.BLOCK
     20.33 =C2=B1221%     -22.1%      15.83 =C2=B1217%     -96.6%       0.7=
0 =C2=B1111%  softirqs.CPU2.NET_RX
      0.00       +1.7e+101%       0.17 =C2=B1223% +1.2e+102%       1.20 =C2=
=B1273%  softirqs.CPU2.NET_TX
      6941 =C2=B1 20%     -73.6%       1831 =C2=B1 20%      +4.6%       725=
8 =C2=B1 27%  softirqs.CPU2.RCU
      3238 =C2=B1  5%     -10.6%       2894 =C2=B1  9%     +20.2%       389=
3 =C2=B1 21%  softirqs.CPU2.SCHED
      0.00          -100.0%       0.00         +1e+101%       0.10 =C2=B130=
0%  softirqs.CPU2.TASKLET
     71.00 =C2=B1 43%    +286.9%     274.67 =C2=B1120%    +569.2%     475.1=
0 =C2=B1131%  softirqs.CPU2.TIMER
      0.00       +1.3e+102%       1.33 =C2=B1223%   +6e+101%       0.60 =C2=
=B1300%  softirqs.CPU20.BLOCK
     15.00 =C2=B1138%     -80.0%       3.00 =C2=B1180%     -54.0%       6.9=
0 =C2=B1170%  softirqs.CPU20.NET_RX
      0.83 =C2=B1 82%     -80.0%       0.17 =C2=B1223%     +44.0%       1.2=
0 =C2=B1229%  softirqs.CPU20.NET_TX
      6882 =C2=B1 18%     -84.0%       1098 =C2=B1 26%      +3.3%       710=
9 =C2=B1 15%  softirqs.CPU20.RCU
      2466 =C2=B1  5%     -23.8%       1879 =C2=B1 12%     +25.6%       309=
7 =C2=B1 16%  softirqs.CPU20.SCHED
      5.17 =C2=B1223%    -100.0%       0.00           -92.3%       0.40 =C2=
=B1300%  softirqs.CPU20.TASKLET
     87.33 =C2=B1 51%     -38.2%      54.00 =C2=B1 59%     +58.2%     138.2=
0 =C2=B1102%  softirqs.CPU20.TIMER
      0.00         +3e+102%       3.00 =C2=B1152%    -100.0%       0.00    =
    softirqs.CPU21.BLOCK
      0.50 =C2=B1100%   +1466.7%       7.83 =C2=B1212%   +4040.0%      20.7=
0 =C2=B1269%  softirqs.CPU21.NET_RX
      0.17 =C2=B1223%    +100.0%       0.33 =C2=B1223%    +140.0%       0.4=
0 =C2=B1165%  softirqs.CPU21.NET_TX
      6947 =C2=B1 16%     -85.1%       1036 =C2=B1 20%      -8.3%       637=
1 =C2=B1 10%  softirqs.CPU21.RCU
      2526 =C2=B1  7%     -27.4%       1834 =C2=B1  8%     +10.6%       279=
4 =C2=B1 10%  softirqs.CPU21.SCHED
      0.00          -100.0%       0.00         +1e+101%       0.10 =C2=B130=
0%  softirqs.CPU21.TASKLET
     60.17 =C2=B1 34%     -59.8%      24.17 =C2=B1 33%     +25.3%      75.4=
0 =C2=B1 53%  softirqs.CPU21.TIMER
      0.00       +1.3e+102%       1.33 =C2=B1223%   +9e+101%       0.90 =C2=
=B1265%  softirqs.CPU22.BLOCK
      1.33 =C2=B1223%  +10775.0%     145.00 =C2=B1222%    +755.0%      11.4=
0 =C2=B1196%  softirqs.CPU22.NET_RX
      0.17 =C2=B1223%    +100.0%       0.33 =C2=B1223%     +20.0%       0.2=
0 =C2=B1200%  softirqs.CPU22.NET_TX
      6841 =C2=B1 17%     -81.2%       1285 =C2=B1 67%      +3.3%       706=
5 =C2=B1 19%  softirqs.CPU22.RCU
      2390 =C2=B1  8%     -10.2%       2147 =C2=B1 27%     +22.6%       293=
0 =C2=B1 14%  softirqs.CPU22.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU22.TASKLET
     57.83 =C2=B1 31%     -64.8%      20.33 =C2=B1 58%    +238.0%     195.5=
0 =C2=B1177%  softirqs.CPU22.TIMER
      0.00       +1.3e+102%       1.33 =C2=B1223% +1.6e+102%       1.60 =C2=
=B1200%  softirqs.CPU23.BLOCK
      0.50 =C2=B1100%    +166.7%       1.33 =C2=B1192%    +300.0%       2.0=
0 =C2=B1139%  softirqs.CPU23.NET_RX
      0.17 =C2=B1223%    -100.0%       0.00           -40.0%       0.10 =C2=
=B1300%  softirqs.CPU23.NET_TX
      6960 =C2=B1 21%     -78.9%       1467 =C2=B1 43%      -6.0%       654=
0 =C2=B1  8%  softirqs.CPU23.RCU
      2670 =C2=B1 17%      -5.8%       2515 =C2=B1 32%     +10.2%       294=
1 =C2=B1  9%  softirqs.CPU23.SCHED
      0.00          -100.0%       0.00         +1e+101%       0.10 =C2=B130=
0%  softirqs.CPU23.TASKLET
    116.33 =C2=B1 55%    +332.1%     502.67 =C2=B1209%     -38.6%      71.4=
0 =C2=B1 37%  softirqs.CPU23.TIMER
      7.17 =C2=B1223%     -93.0%       0.50 =C2=B1152%    -100.0%       0.0=
0        softirqs.CPU24.BLOCK
     45.17 =C2=B1162%     -75.6%      11.00 =C2=B1 13%     -72.3%      12.5=
0 =C2=B1 60%  softirqs.CPU24.NET_RX
      9.33 =C2=B1 31%     -57.1%       4.00 =C2=B1106%     -38.9%       5.7=
0 =C2=B1 83%  softirqs.CPU24.NET_TX
      5969 =C2=B1 16%     -82.0%       1073 =C2=B1 55%      -2.5%       582=
1 =C2=B1 15%  softirqs.CPU24.RCU
      2548 =C2=B1 12%     -26.5%       1874 =C2=B1 28%     +16.7%       297=
4 =C2=B1 15%  softirqs.CPU24.SCHED
      0.00          -100.0%       0.00         +3e+101%       0.30 =C2=B121=
3%  softirqs.CPU24.TASKLET
    100.83 =C2=B1 41%    +191.7%     294.17 =C2=B1197%     -10.8%      89.9=
0 =C2=B1 59%  softirqs.CPU24.TIMER
      4.67 =C2=B1223%    -100.0%       0.00            +0.7%       4.70 =C2=
=B1299%  softirqs.CPU25.BLOCK
      0.50 =C2=B1152%    +533.3%       3.17 =C2=B1223%   +8600.0%      43.5=
0 =C2=B1281%  softirqs.CPU25.NET_RX
      1.50 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU25.NET_TX
      5815 =C2=B1 18%     -88.4%     677.50 =C2=B1 21%      +2.6%       596=
5 =C2=B1 13%  softirqs.CPU25.RCU
      2230 =C2=B1 16%     -26.3%       1644 =C2=B1  7%     +30.4%       290=
8 =C2=B1  9%  softirqs.CPU25.SCHED
      0.00       +1.7e+101%       0.17 =C2=B1223%   +6e+101%       0.60 =C2=
=B1249%  softirqs.CPU25.TASKLET
     64.33 =C2=B1 67%     -63.5%      23.50 =C2=B1 41%     +53.3%      98.6=
0 =C2=B1 93%  softirqs.CPU25.TIMER
      0.00          -100.0%       0.00       +1.8e+103%      18.20 =C2=B130=
0%  softirqs.CPU26.BLOCK
     27.17 =C2=B1223%     -94.5%       1.50 =C2=B1223%     -64.7%       9.6=
0 =C2=B1286%  softirqs.CPU26.NET_RX
      0.00          -100.0%       0.00         +1e+101%       0.10 =C2=B130=
0%  softirqs.CPU26.NET_TX
      6318 =C2=B1 21%     -89.7%     648.00 =C2=B1 13%      -8.5%       577=
8 =C2=B1 16%  softirqs.CPU26.RCU
      2369 =C2=B1 17%     -31.4%       1624 =C2=B1  6%     +24.9%       296=
0 =C2=B1 22%  softirqs.CPU26.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU26.TASKLET
    222.17 =C2=B1143%     -90.9%      20.17 =C2=B1 68%      +3.5%     229.9=
0 =C2=B1214%  softirqs.CPU26.TIMER
      0.33 =C2=B1223%   +2000.0%       7.00 =C2=B1156%    -100.0%       0.0=
0        softirqs.CPU27.BLOCK
      1.83 =C2=B1223%      +0.0%       1.83 =C2=B1149%    +210.9%       5.7=
0 =C2=B1222%  softirqs.CPU27.NET_RX
      0.00          -100.0%       0.00         +1e+101%       0.10 =C2=B130=
0%  softirqs.CPU27.NET_TX
      5825 =C2=B1 17%     -86.6%     781.17 =C2=B1 24%      +0.1%       583=
1 =C2=B1 17%  softirqs.CPU27.RCU
      2642 =C2=B1 36%     -29.3%       1868 =C2=B1 36%     +11.3%       294=
0 =C2=B1 18%  softirqs.CPU27.SCHED
      2.00           -16.7%       1.67 =C2=B1 28%     -10.0%       1.80 =C2=
=B1 33%  softirqs.CPU27.TASKLET
     50.33 =C2=B1 29%    +616.6%     360.67 =C2=B1212%     +61.3%      81.2=
0 =C2=B1116%  softirqs.CPU27.TIMER
      6.00 =C2=B1209%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU28.BLOCK
      0.50 =C2=B1223%    -100.0%       0.00           -80.0%       0.10 =C2=
=B1300%  softirqs.CPU28.NET_RX
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU28.NET_TX
      5784 =C2=B1 18%     -84.4%     902.00 =C2=B1 46%      -2.9%       561=
8 =C2=B1 11%  softirqs.CPU28.RCU
      2510 =C2=B1 38%     -27.1%       1829 =C2=B1 28%      +9.7%       275=
4 =C2=B1  5%  softirqs.CPU28.SCHED
      2.00          +275.0%       7.50 =C2=B1104%      +0.0%       2.00 =C2=
=B1 22%  softirqs.CPU28.TASKLET
    186.50 =C2=B1170%     +86.2%     347.33 =C2=B1166%     -72.3%      51.6=
0 =C2=B1 64%  softirqs.CPU28.TIMER
     14.00 =C2=B1152%     -73.8%       3.67 =C2=B1223%    -100.0%       0.0=
0        softirqs.CPU29.BLOCK
      0.00         +1e+102%       1.00 =C2=B1182% +1.1e+103%      10.90 =C2=
=B1275%  softirqs.CPU29.NET_RX
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU29.NET_TX
      5784 =C2=B1 17%     -65.3%       2006 =C2=B1 99%      +2.9%       595=
2 =C2=B1 20%  softirqs.CPU29.RCU
      2134 =C2=B1  5%     -24.2%       1618 =C2=B1  5%     +22.6%       261=
7 =C2=B1 14%  softirqs.CPU29.SCHED
      2.83 =C2=B1 65%     -29.4%       2.00           -29.4%       2.00    =
    softirqs.CPU29.TASKLET
     49.50 =C2=B1 25%    +522.9%     308.33 =C2=B1163%     +67.7%      83.0=
0 =C2=B1163%  softirqs.CPU29.TIMER
      6.17 =C2=B1 80%     -54.1%       2.83 =C2=B1180%     -82.2%       1.1=
0 =C2=B1245%  softirqs.CPU3.BLOCK
      0.33 =C2=B1141%    +850.0%       3.17 =C2=B1131%   +9620.0%      32.4=
0 =C2=B1263%  softirqs.CPU3.NET_RX
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%     +20.0%       0.2=
0 =C2=B1200%  softirqs.CPU3.NET_TX
      6718 =C2=B1 22%     -77.2%       1534 =C2=B1 31%      -5.7%       633=
8 =C2=B1 12%  softirqs.CPU3.RCU
      2899 =C2=B1 12%     -14.0%       2494 =C2=B1 31%     +15.7%       335=
4 =C2=B1 20%  softirqs.CPU3.SCHED
      0.00       +1.3e+102%       1.33 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU3.TASKLET
    167.00 =C2=B1137%    +116.6%     361.67 =C2=B1198%     +30.4%     217.7=
0 =C2=B1198%  softirqs.CPU3.TIMER
     21.33 =C2=B1223%    -100.0%       0.00           -99.5%       0.10 =C2=
=B1300%  softirqs.CPU30.BLOCK
      0.17 =C2=B1223%    +400.0%       0.83 =C2=B1128%    +620.0%       1.2=
0 =C2=B1157%  softirqs.CPU30.NET_RX
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU30.NET_TX
      5648 =C2=B1 22%     -88.5%     649.33 =C2=B1  9%      +2.1%       576=
9 =C2=B1 14%  softirqs.CPU30.RCU
      2359 =C2=B1 12%     -29.9%       1654 =C2=B1 12%     +17.5%       277=
2 =C2=B1 11%  softirqs.CPU30.SCHED
      7.00 =C2=B1166%     -57.1%       3.00 =C2=B1 94%     -72.9%       1.9=
0 =C2=B1 15%  softirqs.CPU30.TASKLET
     42.00 =C2=B1 21%     -12.7%      36.67 =C2=B1103%    +237.6%     141.8=
0 =C2=B1218%  softirqs.CPU30.TIMER
      0.50 =C2=B1223%  +21800.0%     109.50 =C2=B1223%   +2940.0%      15.2=
0 =C2=B1282%  softirqs.CPU31.NET_RX
      0.00          -100.0%       0.00         +1e+101%       0.10 =C2=B130=
0%  softirqs.CPU31.NET_TX
      5756 =C2=B1 18%     -72.5%       1581 =C2=B1132%      +1.0%       581=
6 =C2=B1 18%  softirqs.CPU31.RCU
      2394 =C2=B1 10%      +8.4%       2594 =C2=B1 83%     +14.1%       273=
2 =C2=B1 10%  softirqs.CPU31.SCHED
      2.00          +141.7%       4.83 =C2=B1 92%    +160.0%       5.20 =C2=
=B1184%  softirqs.CPU31.TASKLET
     49.83 =C2=B1 22%   +1915.7%       1004 =C2=B1219%    +300.5%     199.6=
0 =C2=B1162%  softirqs.CPU31.TIMER
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU32.BLOCK
      1.00 =C2=B1223%    -100.0%       0.00           -40.0%       0.60 =C2=
=B1200%  softirqs.CPU32.NET_RX
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU32.NET_TX
      5655 =C2=B1 20%     -87.3%     716.67 =C2=B1 13%      -1.4%       557=
7 =C2=B1 10%  softirqs.CPU32.RCU
      1928 =C2=B1 13%      -8.4%       1766 =C2=B1  9%     +37.2%       264=
5 =C2=B1 14%  softirqs.CPU32.SCHED
      2.00            +8.3%       2.17 =C2=B1 41%      -5.0%       1.90 =C2=
=B1 15%  softirqs.CPU32.TASKLET
     33.00 =C2=B1 21%     +39.9%      46.17 =C2=B1103%    +464.8%     186.4=
0 =C2=B1249%  softirqs.CPU32.TIMER
      0.00       +4.3e+102%       4.33 =C2=B1223%   +2e+101%       0.20 =C2=
=B1300%  softirqs.CPU33.BLOCK
      6.17 =C2=B1209%     -91.9%       0.50 =C2=B1223%     -69.2%       1.9=
0 =C2=B1216%  softirqs.CPU33.NET_RX
      5582 =C2=B1 19%     -87.3%     708.83 =C2=B1 42%      -0.9%       553=
0 =C2=B1 12%  softirqs.CPU33.RCU
      1998 =C2=B1  2%     -15.2%       1695 =C2=B1 13%     +34.9%       269=
5 =C2=B1  9%  softirqs.CPU33.SCHED
      5.17 =C2=B1137%     -61.3%       2.00           -18.7%       4.20 =C2=
=B1149%  softirqs.CPU33.TASKLET
     35.17 =C2=B1 47%     -53.1%      16.50 =C2=B1 64%     +43.3%      50.4=
0 =C2=B1120%  softirqs.CPU33.TIMER
     11.83 =C2=B1146%    -100.0%       0.00           -98.3%       0.20 =C2=
=B1300%  softirqs.CPU34.BLOCK
      2.17 =C2=B1223%    -100.0%       0.00           +47.7%       3.20 =C2=
=B1182%  softirqs.CPU34.NET_RX
      0.00          -100.0%       0.00         +2e+101%       0.20 =C2=B130=
0%  softirqs.CPU34.NET_TX
      5600 =C2=B1 20%     -84.6%     863.50 =C2=B1 65%      -2.2%       547=
4 =C2=B1 10%  softirqs.CPU34.RCU
      2210 =C2=B1 15%     -23.2%       1697 =C2=B1 32%     +15.5%       255=
3 =C2=B1 13%  softirqs.CPU34.SCHED
      0.17 =C2=B1223%    +800.0%       1.50 =C2=B1120%     +20.0%       0.2=
0 =C2=B1300%  softirqs.CPU34.TASKLET
     43.50 =C2=B1 54%     -66.7%      14.50 =C2=B1 37%     -25.7%      32.3=
0 =C2=B1 36%  softirqs.CPU34.TIMER
      0.00       +3.3e+101%       0.33 =C2=B1223% +9.8e+102%       9.80 =C2=
=B1300%  softirqs.CPU35.BLOCK
      1879 =C2=B1223%    -100.0%       0.00           -99.6%       7.30 =C2=
=B1221%  softirqs.CPU35.NET_RX
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU35.NET_TX
      5938 =C2=B1 21%     -87.9%     721.50 =C2=B1 22%      -6.0%       558=
0 =C2=B1 14%  softirqs.CPU35.RCU
      2538 =C2=B1 38%     -34.5%       1662 =C2=B1 12%      +3.2%       261=
9 =C2=B1  6%  softirqs.CPU35.SCHED
    175.33 =C2=B1167%     -93.4%      11.50 =C2=B1 19%     -71.0%      50.8=
0 =C2=B1 76%  softirqs.CPU35.TIMER
      1.50 =C2=B1195%    +411.1%       7.67 =C2=B1161%    +900.0%      15.0=
0 =C2=B1238%  softirqs.CPU36.NET_RX
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU36.NET_TX
      5940 =C2=B1 21%     -87.6%     737.83 =C2=B1 30%      -6.4%       555=
9 =C2=B1 13%  softirqs.CPU36.RCU
      2511 =C2=B1 34%     -33.4%       1672 =C2=B1  8%      -0.4%       250=
1 =C2=B1 13%  softirqs.CPU36.SCHED
      0.00          -100.0%       0.00         +9e+101%       0.90 =C2=B121=
3%  softirqs.CPU36.TASKLET
    614.83 =C2=B1188%     -97.7%      14.17 =C2=B1 27%     -93.7%      38.7=
0 =C2=B1 46%  softirqs.CPU36.TIMER
      1.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU37.BLOCK
      5.83 =C2=B1142%    -100.0%       0.00           -17.7%       4.80 =C2=
=B1176%  softirqs.CPU37.NET_RX
      0.00          -100.0%       0.00         +1e+101%       0.10 =C2=B130=
0%  softirqs.CPU37.NET_TX
      5684 =C2=B1 20%     -85.8%     805.67 =C2=B1 36%      -3.0%       551=
4 =C2=B1 11%  softirqs.CPU37.RCU
      1981 =C2=B1 14%      -8.9%       1805 =C2=B1 17%     +30.5%       258=
6 =C2=B1  6%  softirqs.CPU37.SCHED
      0.00          -100.0%       0.00       +1.6e+102%       1.60 =C2=B127=
9%  softirqs.CPU37.TASKLET
     61.17 =C2=B1 98%     -61.6%      23.50 =C2=B1 72%     -38.0%      37.9=
0 =C2=B1 44%  softirqs.CPU37.TIMER
      0.00       +1.5e+103%      14.83 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU38.BLOCK
      1.33 =C2=B1192%     -87.5%       0.17 =C2=B1223%   +3485.0%      47.8=
0 =C2=B1275%  softirqs.CPU38.NET_RX
      0.00       +1.7e+101%       0.17 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU38.NET_TX
      5600 =C2=B1 20%     -86.6%     751.67 =C2=B1 23%      -2.0%       549=
0 =C2=B1 10%  softirqs.CPU38.RCU
      2198 =C2=B1 17%     -25.3%       1643 =C2=B1 10%     +23.0%       270=
3 =C2=B1 14%  softirqs.CPU38.SCHED
      0.00          -100.0%       0.00         +1e+101%       0.10 =C2=B130=
0%  softirqs.CPU38.TASKLET
     70.50 =C2=B1 77%     -61.5%      27.17 =C2=B1 47%    +128.8%     161.3=
0 =C2=B1248%  softirqs.CPU38.TIMER
      0.00       +9.3e+102%       9.33 =C2=B1223% +9.5e+102%       9.50 =C2=
=B1220%  softirqs.CPU39.BLOCK
     31.00 =C2=B1202%    -100.0%       0.00           -91.6%       2.60 =C2=
=B1150%  softirqs.CPU39.NET_RX
      0.00       +1.5e+102%       1.50 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU39.NET_TX
      5594 =C2=B1 19%     -78.4%       1210 =C2=B1 54%      -0.6%       555=
8 =C2=B1 14%  softirqs.CPU39.RCU
      2251 =C2=B1 12%     -13.2%       1953 =C2=B1 19%     +14.1%       256=
8 =C2=B1  5%  softirqs.CPU39.SCHED
      0.00          -100.0%       0.00         +1e+101%       0.10 =C2=B130=
0%  softirqs.CPU39.TASKLET
    106.33 =C2=B1139%    +239.0%     360.50 =C2=B1196%     -72.0%      29.8=
0 =C2=B1 25%  softirqs.CPU39.TIMER
      1.50 =C2=B1195%     -77.8%       0.33 =C2=B1223%     -13.3%       1.3=
0 =C2=B1300%  softirqs.CPU4.BLOCK
     32.33 =C2=B1210%     -99.0%       0.33 =C2=B1141%    +486.4%     189.6=
0 =C2=B1253%  softirqs.CPU4.NET_RX
      0.50 =C2=B1152%    -100.0%       0.00           +20.0%       0.60 =C2=
=B1133%  softirqs.CPU4.NET_TX
      6945 =C2=B1 16%     -79.2%       1443 =C2=B1 21%      -9.6%       627=
9 =C2=B1  9%  softirqs.CPU4.RCU
      3296 =C2=B1 12%     -30.7%       2283 =C2=B1  9%      +6.2%       350=
1 =C2=B1 24%  softirqs.CPU4.SCHED
      0.33 =C2=B1223%    +200.0%       1.00 =C2=B1223%    -100.0%       0.0=
0        softirqs.CPU4.TASKLET
    135.50 =C2=B1 42%     -34.4%      88.83 =C2=B1131%      -3.6%     130.6=
0 =C2=B1 64%  softirqs.CPU4.TIMER
      0.00       +9.5e+102%       9.50 =C2=B1223% +6.9e+102%       6.90 =C2=
=B1300%  softirqs.CPU40.BLOCK
      3.33 =C2=B1223%     -95.0%       0.17 =C2=B1223%    +503.0%      20.1=
0 =C2=B1261%  softirqs.CPU40.NET_RX
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU40.NET_TX
      5707 =C2=B1 19%     -88.6%     650.83 =C2=B1  7%      -3.7%       549=
6 =C2=B1 11%  softirqs.CPU40.RCU
      2582 =C2=B1 29%     -33.9%       1706 =C2=B1 10%      +3.9%       268=
4 =C2=B1 11%  softirqs.CPU40.SCHED
      0.00          -100.0%       0.00         +6e+101%       0.60 =C2=B130=
0%  softirqs.CPU40.TASKLET
    360.83 =C2=B1200%     -96.0%      14.33 =C2=B1 22%     -88.6%      41.0=
0 =C2=B1 79%  softirqs.CPU40.TIMER
      0.00       +1.7e+101%       0.17 =C2=B1223% +6.2e+102%       6.20 =C2=
=B1208%  softirqs.CPU41.BLOCK
      1.00 =C2=B1141%     -50.0%       0.50 =C2=B1223%     +50.0%       1.5=
0 =C2=B1300%  softirqs.CPU41.NET_RX
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU41.NET_TX
      5594 =C2=B1 20%     -87.4%     706.17 =C2=B1 26%      -0.5%       556=
5 =C2=B1 10%  softirqs.CPU41.RCU
      2167 =C2=B1  6%     -24.8%       1630 =C2=B1  9%     +20.4%       260=
9 =C2=B1  7%  softirqs.CPU41.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU41.TASKLET
     40.83 =C2=B1 64%     -53.1%      19.17 =C2=B1 79%      -8.2%      37.5=
0 =C2=B1 83%  softirqs.CPU41.TIMER
      9.83 =C2=B1214%    -100.0%       0.00           -65.4%       3.40 =C2=
=B1299%  softirqs.CPU42.BLOCK
      0.00       +1.7e+102%       1.67 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU42.NET_RX
      5337 =C2=B1 23%     -78.6%       1140 =C2=B1 95%      +1.7%       542=
9 =C2=B1 11%  softirqs.CPU42.RCU
      2106 =C2=B1  8%     -20.4%       1676 =C2=B1 10%     +20.7%       254=
2 =C2=B1 10%  softirqs.CPU42.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU42.TASKLET
     36.00 =C2=B1 50%    +388.0%     175.67 =C2=B1207%     +45.3%      52.3=
0 =C2=B1135%  softirqs.CPU42.TIMER
      0.00          -100.0%       0.00         +2e+101%       0.20 =C2=B130=
0%  softirqs.CPU43.BLOCK
      1.67 =C2=B1 28%   +6260.0%     106.00 =C2=B1219%     +68.0%       2.8=
0 =C2=B1146%  softirqs.CPU43.NET_RX
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU43.NET_TX
      5642 =C2=B1 20%     -87.6%     700.50 =C2=B1 23%      +5.1%       592=
9 =C2=B1 21%  softirqs.CPU43.RCU
      2188 =C2=B1  8%     -23.6%       1671 =C2=B1  8%     +19.0%       260=
4 =C2=B1  8%  softirqs.CPU43.SCHED
      0.00          -100.0%       0.00       +3.5e+102%       3.50 =C2=B129=
0%  softirqs.CPU43.TASKLET
     30.00 =C2=B1 22%     -50.0%      15.00 =C2=B1 46%     +19.3%      35.8=
0 =C2=B1 60%  softirqs.CPU43.TIMER
      0.17 =C2=B1223%   +4500.0%       7.67 =C2=B1223%  +11240.0%      18.9=
0 =C2=B1291%  softirqs.CPU44.BLOCK
      0.17 =C2=B1223%  +1.9e+05%     312.00 =C2=B1223%   +2600.0%       4.5=
0 =C2=B1223%  softirqs.CPU44.NET_RX
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU44.NET_TX
      5847 =C2=B1 19%     -83.2%     982.50 =C2=B1 30%      -3.2%       565=
8 =C2=B1 22%  softirqs.CPU44.RCU
      2206 =C2=B1  9%     -20.2%       1760 =C2=B1  9%     +26.2%       278=
4 =C2=B1 22%  softirqs.CPU44.SCHED
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU44.TASKLET
     34.83 =C2=B1 35%     -52.2%      16.67 =C2=B1 27%    +476.5%     200.8=
0 =C2=B1254%  softirqs.CPU44.TIMER
      8.50 =C2=B1223%     -74.5%       2.17 =C2=B1223%     -20.0%       6.8=
0 =C2=B1299%  softirqs.CPU45.BLOCK
      0.00       +1.7e+101%       0.17 =C2=B1223%   +3e+101%       0.30 =C2=
=B1152%  softirqs.CPU45.NET_RX
      0.00       +1.7e+101%       0.17 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU45.NET_TX
      6510 =C2=B1 35%     -89.7%     672.17 =C2=B1 18%     -14.9%       554=
2 =C2=B1 13%  softirqs.CPU45.RCU
      2163 =C2=B1  9%     -21.9%       1690 =C2=B1 11%     +24.8%       270=
0 =C2=B1  9%  softirqs.CPU45.SCHED
      0.67 =C2=B1141%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU45.TASKLET
    265.00 =C2=B1196%     -78.2%      57.83 =C2=B1165%     -80.5%      51.8=
0 =C2=B1 84%  softirqs.CPU45.TIMER
     10.67 =C2=B1223%    -100.0%       0.00           -60.6%       4.20 =C2=
=B1216%  softirqs.CPU46.BLOCK
      0.00       +2.2e+102%       2.17 =C2=B1146%   +1e+101%       0.10 =C2=
=B1300%  softirqs.CPU46.NET_RX
      0.00       +1.7e+101%       0.17 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU46.NET_TX
      5589 =C2=B1 19%     -88.0%     669.67 =C2=B1 23%      +3.8%       580=
2 =C2=B1 17%  softirqs.CPU46.RCU
      2039 =C2=B1  4%     -15.7%       1719 =C2=B1 10%     +39.6%       284=
6 =C2=B1 11%  softirqs.CPU46.SCHED
      0.00       +1.7e+101%       0.17 =C2=B1223% +1.2e+102%       1.20 =C2=
=B1273%  softirqs.CPU46.TASKLET
     26.50 =C2=B1 27%    +264.8%      96.67 =C2=B1167%     +49.8%      39.7=
0 =C2=B1 31%  softirqs.CPU46.TIMER
      0.00       +3.3e+101%       0.33 =C2=B1223%   +3e+102%       3.00 =C2=
=B1278%  softirqs.CPU47.BLOCK
      0.33 =C2=B1141%    -100.0%       0.00         +2720.0%       9.40 =C2=
=B1299%  softirqs.CPU47.NET_RX
      0.00       +2.2e+102%       2.17 =C2=B1183%   +2e+101%       0.20 =C2=
=B1300%  softirqs.CPU47.NET_TX
      5577 =C2=B1 19%     -80.4%       1094 =C2=B1 83%      +1.7%       567=
0 =C2=B1 14%  softirqs.CPU47.RCU
      2197 =C2=B1  9%     -14.0%       1888 =C2=B1 21%     +25.6%       276=
0 =C2=B1 12%  softirqs.CPU47.SCHED
     36.00 =C2=B1 42%    +206.9%     110.50 =C2=B1137%    +188.3%     103.8=
0 =C2=B1 47%  softirqs.CPU47.TIMER
      0.00          -100.0%       0.00         +2e+102%       2.00 =C2=B121=
9%  softirqs.CPU48.BLOCK
     69.50 =C2=B1222%     -97.8%       1.50 =C2=B1166%     -98.1%       1.3=
0 =C2=B1150%  softirqs.CPU48.NET_RX
      0.17 =C2=B1223%    +800.0%       1.50 =C2=B1223%     -40.0%       0.1=
0 =C2=B1300%  softirqs.CPU48.NET_TX
      6409 =C2=B1 17%     -78.6%       1369 =C2=B1 53%      -0.4%       638=
3 =C2=B1  9%  softirqs.CPU48.RCU
      3309 =C2=B1 18%     -47.5%       1737 =C2=B1  7%      +6.9%       353=
7 =C2=B1 16%  softirqs.CPU48.SCHED
      0.00       +3.3e+101%       0.33 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU48.TASKLET
    137.83 =C2=B1 22%     -65.9%      47.00 =C2=B1 57%    +103.6%     280.6=
0 =C2=B1126%  softirqs.CPU48.TIMER
      1.00 =C2=B1223%    -100.0%       0.00          +200.0%       3.00 =C2=
=B1300%  softirqs.CPU49.BLOCK
      0.33 =C2=B1141%      +0.0%       0.33 =C2=B1141%   +2810.0%       9.7=
0 =C2=B1171%  softirqs.CPU49.NET_RX
      0.00       +1.7e+101%       0.17 =C2=B1223%   +4e+101%       0.40 =C2=
=B1122%  softirqs.CPU49.NET_TX
      6879 =C2=B1 16%     -88.4%     797.67 =C2=B1 28%      -9.2%       624=
8 =C2=B1 10%  softirqs.CPU49.RCU
      2709 =C2=B1 17%     -34.4%       1776 =C2=B1  3%     +25.6%       340=
1 =C2=B1 25%  softirqs.CPU49.SCHED
      0.00          -100.0%       0.00         +3e+101%       0.30 =C2=B130=
0%  softirqs.CPU49.TASKLET
    324.67 =C2=B1159%     -85.8%      46.17 =C2=B1 83%     +26.4%     410.3=
0 =C2=B1162%  softirqs.CPU49.TIMER
      1.00 =C2=B1223%     -83.3%       0.17 =C2=B1223%    +200.0%       3.0=
0 =C2=B1240%  softirqs.CPU5.BLOCK
     12.67 =C2=B1161%   +4436.8%     574.67 =C2=B1223%    +368.2%      59.3=
0 =C2=B1296%  softirqs.CPU5.NET_RX
      0.33 =C2=B1141%     -50.0%       0.17 =C2=B1223%     -40.0%       0.2=
0 =C2=B1200%  softirqs.CPU5.NET_TX
      6083 =C2=B1 10%     -57.6%       2576 =C2=B1127%      -0.6%       604=
8 =C2=B1  8%  softirqs.CPU5.RCU
      2897 =C2=B1  9%     +22.8%       3557 =C2=B1 88%     +32.5%       383=
9 =C2=B1 17%  softirqs.CPU5.SCHED
      0.00          -100.0%       0.00         +5e+101%       0.50 =C2=B116=
1%  softirqs.CPU5.TASKLET
     63.33 =C2=B1 42%    +669.5%     487.33 =C2=B1205%    +626.6%     460.2=
0 =C2=B1168%  softirqs.CPU5.TIMER
      4.00 =C2=B1152%     -66.7%       1.33 =C2=B1223%     -35.0%       2.6=
0 =C2=B1299%  softirqs.CPU50.BLOCK
      1.50 =C2=B1142%     -11.1%       1.33 =C2=B1134%     -60.0%       0.6=
0 =C2=B1169%  softirqs.CPU50.NET_RX
      0.67 =C2=B1165%     -50.0%       0.33 =C2=B1141%     -85.0%       0.1=
0 =C2=B1300%  softirqs.CPU50.NET_TX
      6666 =C2=B1 18%     -83.8%       1078 =C2=B1 46%      -8.9%       607=
4 =C2=B1 11%  softirqs.CPU50.RCU
      2344 =C2=B1 40%     -12.7%       2045 =C2=B1 40%     +37.2%       321=
6 =C2=B1 29%  softirqs.CPU50.SCHED
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%    +440.0%       0.9=
0 =C2=B1213%  softirqs.CPU50.TASKLET
    381.67 =C2=B1177%     +27.7%     487.50 =C2=B1156%     -12.1%     335.5=
0 =C2=B1174%  softirqs.CPU50.TIMER
      7.33 =C2=B1177%     -72.7%       2.00 =C2=B1141%     -72.7%       2.0=
0 =C2=B1204%  softirqs.CPU51.BLOCK
      4.17 =C2=B1 88%    +196.0%      12.33 =C2=B1212%    +108.8%       8.7=
0 =C2=B1251%  softirqs.CPU51.NET_RX
      0.33 =C2=B1223%      +0.0%       0.33 =C2=B1141%     -10.0%       0.3=
0 =C2=B1152%  softirqs.CPU51.NET_TX
      6581 =C2=B1 18%     -84.0%       1051 =C2=B1 39%     -10.3%       590=
1 =C2=B1 13%  softirqs.CPU51.RCU
      2500 =C2=B1  9%     -28.9%       1776 =C2=B1 26%      +4.9%       262=
2 =C2=B1 22%  softirqs.CPU51.SCHED
      0.00         +1e+102%       1.00 =C2=B1182% +3.8e+102%       3.80 =C2=
=B1200%  softirqs.CPU51.TASKLET
     99.67 =C2=B1 59%      +8.9%     108.50 =C2=B1138%     +25.2%     124.8=
0 =C2=B1101%  softirqs.CPU51.TIMER
      2.00 =C2=B1182%     +33.3%       2.67 =C2=B1223%     -45.0%       1.1=
0 =C2=B1300%  softirqs.CPU52.BLOCK
      0.33 =C2=B1223%  +40300.0%     134.67 =C2=B1219%   +2810.0%       9.7=
0 =C2=B1269%  softirqs.CPU52.NET_RX
      0.00         +5e+101%       0.50 =C2=B1152%   +2e+101%       0.20 =C2=
=B1200%  softirqs.CPU52.NET_TX
      6859 =C2=B1 13%     -73.6%       1808 =C2=B1 38%     -12.8%       597=
9 =C2=B1 13%  softirqs.CPU52.RCU
      2864 =C2=B1 12%     -10.9%       2551 =C2=B1 31%      +7.3%       307=
4 =C2=B1 22%  softirqs.CPU52.SCHED
      0.00       +3.3e+101%       0.33 =C2=B1223%   +2e+101%       0.20 =C2=
=B1300%  softirqs.CPU52.TASKLET
    113.67 =C2=B1 44%    +110.0%     238.67 =C2=B1190%     +53.3%     174.3=
0 =C2=B1157%  softirqs.CPU52.TIMER
      1.50 =C2=B1223%     +55.6%       2.33 =C2=B1223%     -46.7%       0.8=
0 =C2=B1229%  softirqs.CPU53.BLOCK
      1.17 =C2=B1115%     +28.6%       1.50 =C2=B1223%     -74.3%       0.3=
0 =C2=B1152%  softirqs.CPU53.NET_RX
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%     -40.0%       0.1=
0 =C2=B1300%  softirqs.CPU53.NET_TX
      6390 =C2=B1 13%     -85.1%     950.17 =C2=B1 34%      -6.7%       595=
9 =C2=B1  9%  softirqs.CPU53.RCU
      2708 =C2=B1 19%     -32.2%       1836 =C2=B1 10%     +18.5%       320=
8 =C2=B1 20%  softirqs.CPU53.SCHED
      0.67 =C2=B1111%    +100.0%       1.33 =C2=B1223%    -100.0%       0.0=
0        softirqs.CPU53.TASKLET
     67.50 =C2=B1 63%     -43.2%      38.33 =C2=B1116%      +6.2%      71.7=
0 =C2=B1 77%  softirqs.CPU53.TIMER
      6.00 =C2=B1223%     +11.1%       6.67 =C2=B1197%     -66.7%       2.0=
0 =C2=B1204%  softirqs.CPU54.BLOCK
      1.00 =C2=B1100%    +216.7%       3.17 =C2=B1196%     -10.0%       0.9=
0 =C2=B1135%  softirqs.CPU54.NET_RX
      0.33 =C2=B1141%      +0.0%       0.33 =C2=B1141%     +50.0%       0.5=
0 =C2=B1134%  softirqs.CPU54.NET_TX
      6828 =C2=B1 15%     -86.4%     927.17 =C2=B1 33%     -10.6%       610=
3 =C2=B1  9%  softirqs.CPU54.RCU
      2590 =C2=B1 10%     -25.4%       1933 =C2=B1  7%     +16.7%       302=
2 =C2=B1 13%  softirqs.CPU54.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU54.TASKLET
     79.33 =C2=B1 38%     -57.8%      33.50 =C2=B1 39%    +265.8%     290.2=
0 =C2=B1129%  softirqs.CPU54.TIMER
      0.00          -100.0%       0.00         +6e+101%       0.60 =C2=B130=
0%  softirqs.CPU55.BLOCK
      1.50 =C2=B1137%    +155.6%       3.83 =C2=B1188%     -13.3%       1.3=
0 =C2=B1133%  softirqs.CPU55.NET_RX
      0.17 =C2=B1223%    -100.0%       0.00           +80.0%       0.30 =C2=
=B1152%  softirqs.CPU55.NET_TX
      6384 =C2=B1 19%     -83.5%       1055 =C2=B1 43%      +1.0%       644=
8 =C2=B1 16%  softirqs.CPU55.RCU
      2617 =C2=B1 17%     -25.1%       1960 =C2=B1 12%     +18.1%       309=
0 =C2=B1 16%  softirqs.CPU55.SCHED
      0.00          -100.0%       0.00       +2.3e+102%       2.30 =C2=B128=
5%  softirqs.CPU55.TASKLET
     77.17 =C2=B1 56%     -69.1%      23.83 =C2=B1 11%    +187.7%     222.0=
0 =C2=B1144%  softirqs.CPU55.TIMER
      3.33 =C2=B1157%     -95.0%       0.17 =C2=B1223%    -100.0%       0.0=
0        softirqs.CPU56.BLOCK
      1.83 =C2=B1138%     -81.8%       0.33 =C2=B1141%    +996.4%      20.1=
0 =C2=B1230%  softirqs.CPU56.NET_RX
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%     +20.0%       0.2=
0 =C2=B1200%  softirqs.CPU56.NET_TX
      6950 =C2=B1 25%     -82.5%       1218 =C2=B1 34%     -14.2%       596=
0 =C2=B1  9%  softirqs.CPU56.RCU
      2478 =C2=B1 10%     -20.5%       1970 =C2=B1 10%     +23.1%       305=
1 =C2=B1  9%  softirqs.CPU56.SCHED
      1.00 =C2=B1223%    +333.3%       4.33 =C2=B1223%     -20.0%       0.8=
0 =C2=B1229%  softirqs.CPU56.TASKLET
    250.50 =C2=B1179%     -85.9%      35.33 =C2=B1 65%     -54.2%     114.8=
0 =C2=B1 73%  softirqs.CPU56.TIMER
      2.67 =C2=B1141%     -43.8%       1.50 =C2=B1195%      +5.0%       2.8=
0 =C2=B1147%  softirqs.CPU57.BLOCK
      0.67 =C2=B1 70%     -50.0%       0.33 =C2=B1141%     -55.0%       0.3=
0 =C2=B1152%  softirqs.CPU57.NET_RX
      0.17 =C2=B1223%    -100.0%       0.00           +20.0%       0.20 =C2=
=B1200%  softirqs.CPU57.NET_TX
      6786 =C2=B1 23%     -80.4%       1331 =C2=B1 35%     -10.6%       606=
6 =C2=B1 11%  softirqs.CPU57.RCU
      2655 =C2=B1 27%     -19.5%       2137 =C2=B1 16%     +17.2%       311=
1 =C2=B1 11%  softirqs.CPU57.SCHED
      0.00       +3.3e+101%       0.33 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU57.TASKLET
    419.17 =C2=B1189%     -66.9%     138.83 =C2=B1182%     -40.6%     249.1=
0 =C2=B1151%  softirqs.CPU57.TIMER
      2.00 =C2=B1141%     -33.3%       1.33 =C2=B1223%     -55.0%       0.9=
0 =C2=B1265%  softirqs.CPU58.BLOCK
      0.50 =C2=B1100%     +33.3%       0.67 =C2=B1111%   +5400.0%      27.5=
0 =C2=B1292%  softirqs.CPU58.NET_RX
      0.33 =C2=B1141%     -50.0%       0.17 =C2=B1223%     -40.0%       0.2=
0 =C2=B1200%  softirqs.CPU58.NET_TX
      7103 =C2=B1 35%     -84.6%       1095 =C2=B1 41%     -11.7%       627=
5 =C2=B1  9%  softirqs.CPU58.RCU
      2593 =C2=B1 12%     -29.2%       1835 =C2=B1 14%     +22.4%       317=
5 =C2=B1 18%  softirqs.CPU58.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU58.TASKLET
    342.67 =C2=B1131%     -87.4%      43.33 =C2=B1102%     -27.2%     249.5=
0 =C2=B1142%  softirqs.CPU58.TIMER
      1.33 =C2=B1223%    +100.0%       2.67 =C2=B1223%     -47.5%       0.7=
0 =C2=B1255%  softirqs.CPU59.BLOCK
      0.33 =C2=B1141%    +4e+06%      13240 =C2=B1223%   +1520.0%       5.4=
0 =C2=B1269%  softirqs.CPU59.NET_RX
      0.33 =C2=B1223%    -100.0%       0.00           -70.0%       0.10 =C2=
=B1300%  softirqs.CPU59.NET_TX
      6691 =C2=B1 15%     -57.4%       2850 =C2=B1114%      -6.8%       623=
4 =C2=B1 10%  softirqs.CPU59.RCU
      2591 =C2=B1  7%     +52.5%       3950 =C2=B1103%     +14.3%       296=
1 =C2=B1  7%  softirqs.CPU59.SCHED
      0.00          -100.0%       0.00         +1e+101%       0.10 =C2=B130=
0%  softirqs.CPU59.TASKLET
    122.17 =C2=B1 95%     -52.5%      58.00 =C2=B1 88%     -48.4%      63.0=
0 =C2=B1 27%  softirqs.CPU59.TIMER
      1.50 =C2=B1223%    +588.9%      10.33 =C2=B1145%     +13.3%       1.7=
0 =C2=B1280%  softirqs.CPU6.BLOCK
     25.50 =C2=B1220%     -91.5%       2.17 =C2=B1144%     -92.2%       2.0=
0 =C2=B1139%  softirqs.CPU6.NET_RX
      0.17 =C2=B1223%    +100.0%       0.33 =C2=B1141%     +80.0%       0.3=
0 =C2=B1152%  softirqs.CPU6.NET_TX
      6368 =C2=B1 22%     -74.6%       1614 =C2=B1 40%      -3.3%       616=
0 =C2=B1  7%  softirqs.CPU6.RCU
      2735 =C2=B1 13%     -25.3%       2042 =C2=B1 14%     +12.0%       306=
3 =C2=B1 11%  softirqs.CPU6.SCHED
      0.17 =C2=B1223%    -100.0%       0.00           +20.0%       0.20 =C2=
=B1300%  softirqs.CPU6.TASKLET
     78.00 =C2=B1 22%     -60.3%      31.00 =C2=B1 30%      -2.2%      76.3=
0 =C2=B1 97%  softirqs.CPU6.TIMER
      0.00       +1.8e+102%       1.83 =C2=B1223% +4.6e+102%       4.60 =C2=
=B1226%  softirqs.CPU60.BLOCK
     11.33 =C2=B1188%   +2685.3%     315.67 =C2=B1222%     -87.6%       1.4=
0 =C2=B1 34%  softirqs.CPU60.NET_RX
      1.17 =C2=B1 31%      +0.0%       1.17 =C2=B1 31%     +11.4%       1.3=
0 =C2=B1 35%  softirqs.CPU60.NET_TX
      7069 =C2=B1 12%     -79.8%       1426 =C2=B1 36%      -8.1%       649=
8 =C2=B1 13%  softirqs.CPU60.RCU
      2538 =C2=B1 11%     -15.4%       2148 =C2=B1 16%     +29.5%       328=
6 =C2=B1 26%  softirqs.CPU60.SCHED
      2.00           -66.7%       0.67 =C2=B1141%     +15.0%       2.30 =C2=
=B1188%  softirqs.CPU60.TASKLET
    279.17 =C2=B1149%     -71.3%      80.17 =C2=B1 87%     +23.3%     344.2=
0 =C2=B1175%  softirqs.CPU60.TIMER
      0.00       +1.5e+102%       1.50 =C2=B1152% +2.9e+102%       2.90 =C2=
=B1244%  softirqs.CPU61.BLOCK
      1.50 =C2=B1 33%     -33.3%       1.00        +25640.0%     386.10 =C2=
=B1298%  softirqs.CPU61.NET_RX
      1.00            +0.0%       1.00           +10.0%       1.10 =C2=B1 2=
7%  softirqs.CPU61.NET_TX
      6763 =C2=B1 12%     -76.6%       1580 =C2=B1 56%      -9.6%       611=
2 =C2=B1 13%  softirqs.CPU61.RCU
      2890 =C2=B1 11%     -31.7%       1975 =C2=B1 22%      +4.4%       301=
8 =C2=B1  7%  softirqs.CPU61.SCHED
      2.17 =C2=B1 17%      -7.7%       2.00           -16.9%       1.80 =C2=
=B1 33%  softirqs.CPU61.TASKLET
    124.33 =C2=B1108%     -59.1%      50.83 =C2=B1 82%     -36.5%      78.9=
0 =C2=B1 53%  softirqs.CPU61.TIMER
      2.67 =C2=B1141%    -100.0%       0.00           -28.8%       1.90 =C2=
=B1200%  softirqs.CPU62.BLOCK
     19.00 =C2=B1158%     -93.0%       1.33 =C2=B1160%     -95.8%       0.8=
0 =C2=B1 50%  softirqs.CPU62.NET_RX
      0.33 =C2=B1141%     -50.0%       0.17 =C2=B1223%     -40.0%       0.2=
0 =C2=B1200%  softirqs.CPU62.NET_TX
      6555 =C2=B1 14%     -81.7%       1199 =C2=B1 46%      -7.1%       608=
9 =C2=B1 10%  softirqs.CPU62.RCU
      2434 =C2=B1 12%     -18.3%       1988 =C2=B1 19%     +17.6%       286=
2 =C2=B1 13%  softirqs.CPU62.SCHED
      0.17 =C2=B1223%    +100.0%       0.33 =C2=B1223%   +1700.0%       3.0=
0 =C2=B1278%  softirqs.CPU62.TASKLET
     53.83 =C2=B1 30%     -44.6%      29.83 =C2=B1 47%     +10.2%      59.3=
0 =C2=B1 45%  softirqs.CPU62.TIMER
     98.17 =C2=B1144%     -45.2%      53.83 =C2=B1212%     -99.6%       0.4=
0 =C2=B1165%  softirqs.CPU63.NET_RX
      0.00       +1.7e+101%       0.17 =C2=B1223%   +2e+101%       0.20 =C2=
=B1200%  softirqs.CPU63.NET_TX
      7036 =C2=B1 16%     -69.8%       2127 =C2=B1 70%     -12.4%       616=
3 =C2=B1 12%  softirqs.CPU63.RCU
      2819 =C2=B1 15%     -21.5%       2212 =C2=B1  8%      -2.4%       275=
2 =C2=B1  8%  softirqs.CPU63.SCHED
      0.00          -100.0%       0.00         +2e+101%       0.20 =C2=B130=
0%  softirqs.CPU63.TASKLET
     86.00 =C2=B1 65%    +174.4%     236.00 =C2=B1178%     -20.0%      68.8=
0 =C2=B1 72%  softirqs.CPU63.TIMER
      0.00          -100.0%       0.00       +5.5e+102%       5.50 =C2=B111=
9%  softirqs.CPU64.BLOCK
      4.83 =C2=B1196%     -89.7%       0.50 =C2=B1152%     -69.0%       1.5=
0 =C2=B1171%  softirqs.CPU64.NET_RX
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%     +80.0%       0.3=
0 =C2=B1213%  softirqs.CPU64.NET_TX
      7132 =C2=B1 17%     -82.3%       1259 =C2=B1 54%      -9.3%       646=
6 =C2=B1  8%  softirqs.CPU64.RCU
      2493 =C2=B1 12%     -16.0%       2094 =C2=B1 16%     +18.3%       294=
9 =C2=B1  8%  softirqs.CPU64.SCHED
      5.50 =C2=B1223%     -93.9%       0.33 =C2=B1223%     -94.5%       0.3=
0 =C2=B1213%  softirqs.CPU64.TASKLET
     82.83 =C2=B1 42%     -75.7%      20.17 =C2=B1 42%     +27.4%     105.5=
0 =C2=B1111%  softirqs.CPU64.TIMER
      0.00         +5e+102%       5.00 =C2=B1223% +5.1e+102%       5.10 =C2=
=B1217%  softirqs.CPU65.BLOCK
      1.83 =C2=B1200%     -54.5%       0.83 =C2=B1128%     -72.7%       0.5=
0 =C2=B1134%  softirqs.CPU65.NET_RX
      0.33 =C2=B1141%     -50.0%       0.17 =C2=B1223%     -70.0%       0.1=
0 =C2=B1300%  softirqs.CPU65.NET_TX
      7052 =C2=B1 16%     -75.9%       1697 =C2=B1 21%      -7.8%       650=
0 =C2=B1  9%  softirqs.CPU65.RCU
      2516 =C2=B1 16%      -4.1%       2413 =C2=B1 11%     +17.8%       296=
3 =C2=B1 10%  softirqs.CPU65.SCHED
      0.00          -100.0%       0.00       +1.3e+102%       1.30 =C2=B122=
8%  softirqs.CPU65.TASKLET
    195.67 =C2=B1154%      +6.0%     207.33 =C2=B1155%     -63.0%      72.3=
0 =C2=B1 47%  softirqs.CPU65.TIMER
      2.67 =C2=B1223%     -50.0%       1.33 =C2=B1223%    -100.0%       0.0=
0        softirqs.CPU66.BLOCK
      4.83 =C2=B1145%    +775.9%      42.33 =C2=B1219%    +404.8%      24.4=
0 =C2=B1224%  softirqs.CPU66.NET_RX
      0.00       +3.3e+101%       0.33 =C2=B1141%   +3e+101%       0.30 =C2=
=B1213%  softirqs.CPU66.NET_TX
      7034 =C2=B1 16%     -81.8%       1282 =C2=B1 19%      -1.8%       690=
6 =C2=B1 28%  softirqs.CPU66.RCU
      2777 =C2=B1  3%     -28.4%       1989 =C2=B1 11%      +8.9%       302=
4 =C2=B1 14%  softirqs.CPU66.SCHED
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU66.TASKLET
    423.67 =C2=B1 95%     -94.3%      24.00 =C2=B1 35%     -49.3%     214.9=
0 =C2=B1159%  softirqs.CPU66.TIMER
      0.00          -100.0%       0.00       +4.7e+102%       4.70 =C2=B119=
9%  softirqs.CPU67.BLOCK
     16.50 =C2=B1215%     -91.9%       1.33 =C2=B1103%     -85.5%       2.4=
0 =C2=B1245%  softirqs.CPU67.NET_RX
      0.00         +5e+101%       0.50 =C2=B1100%    -100.0%       0.00    =
    softirqs.CPU67.NET_TX
      6798 =C2=B1 16%     -75.8%       1646 =C2=B1 55%      -1.5%       669=
4 =C2=B1  5%  softirqs.CPU67.RCU
      2490 =C2=B1  9%      -4.2%       2386 =C2=B1 34%     +14.5%       285=
0 =C2=B1 13%  softirqs.CPU67.SCHED
      0.00         +5e+101%       0.50 =C2=B1152%    -100.0%       0.00    =
    softirqs.CPU67.TASKLET
    257.33 =C2=B1133%     +46.0%     375.83 =C2=B1199%     -65.6%      88.6=
0 =C2=B1 45%  softirqs.CPU67.TIMER
      0.33 =C2=B1223%      +0.0%       0.33 =C2=B1141%     +80.0%       0.6=
0 =C2=B1300%  softirqs.CPU68.BLOCK
      1.00 =C2=B1 57%     -16.7%       0.83 =C2=B1107%    +490.0%       5.9=
0 =C2=B1244%  softirqs.CPU68.NET_RX
      0.17 =C2=B1223%    -100.0%       0.00           +20.0%       0.20 =C2=
=B1200%  softirqs.CPU68.NET_TX
      6768 =C2=B1 20%     -83.2%       1138 =C2=B1 31%      +2.4%       693=
0 =C2=B1 17%  softirqs.CPU68.RCU
      2411 =C2=B1  7%     -11.3%       2139 =C2=B1 15%     +22.6%       295=
7 =C2=B1 15%  softirqs.CPU68.SCHED
      1.00 =C2=B1100%     -50.0%       0.50 =C2=B1152%    -100.0%       0.0=
0        softirqs.CPU68.TASKLET
     95.50 =C2=B1 48%     -13.4%      82.67 =C2=B1125%     +82.3%     174.1=
0 =C2=B1170%  softirqs.CPU68.TIMER
      0.00          -100.0%       0.00       +1.2e+102%       1.20 =C2=B130=
0%  softirqs.CPU69.BLOCK
      0.67 =C2=B1165%   +3575.0%      24.50 =C2=B1219%     -55.0%       0.3=
0 =C2=B1152%  softirqs.CPU69.NET_RX
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU69.NET_TX
      6789 =C2=B1 17%     -80.2%       1345 =C2=B1 37%      -6.6%       633=
9 =C2=B1  9%  softirqs.CPU69.RCU
      2466 =C2=B1 13%     -14.2%       2115 =C2=B1 12%     +14.7%       283=
0 =C2=B1 12%  softirqs.CPU69.SCHED
      0.17 =C2=B1223%    +100.0%       0.33 =C2=B1223%    -100.0%       0.0=
0        softirqs.CPU69.TASKLET
     90.17 =C2=B1 40%     -68.8%      28.17 =C2=B1 31%     +70.1%     153.4=
0 =C2=B1120%  softirqs.CPU69.TIMER
      0.00       +2.3e+102%       2.33 =C2=B1187% +3.2e+102%       3.20 =C2=
=B1177%  softirqs.CPU7.BLOCK
      0.67 =C2=B1111%    +125.0%       1.50 =C2=B1 83%     -85.0%       0.1=
0 =C2=B1300%  softirqs.CPU7.NET_RX
      0.00       +3.3e+101%       0.33 =C2=B1141%    -100.0%       0.00    =
    softirqs.CPU7.NET_TX
      6756 =C2=B1 17%     -81.7%       1236 =C2=B1 16%      -8.0%       621=
6 =C2=B1  9%  softirqs.CPU7.RCU
      3105 =C2=B1 25%     -27.2%       2259 =C2=B1 11%      +4.6%       324=
6 =C2=B1 17%  softirqs.CPU7.SCHED
      0.00       +3.3e+101%       0.33 =C2=B1223%   +9e+101%       0.90 =C2=
=B1300%  softirqs.CPU7.TASKLET
    329.17 =C2=B1121%     -77.1%      75.50 =C2=B1127%      -3.1%     318.9=
0 =C2=B1183%  softirqs.CPU7.TIMER
      4.33 =C2=B1223%    -100.0%       0.00           -67.7%       1.40 =C2=
=B1300%  softirqs.CPU70.BLOCK
      6.83 =C2=B1204%     -92.7%       0.50 =C2=B1100%     -86.8%       0.9=
0 =C2=B1168%  softirqs.CPU70.NET_RX
      0.17 =C2=B1223%    +100.0%       0.33 =C2=B1141%     +80.0%       0.3=
0 =C2=B1213%  softirqs.CPU70.NET_TX
      6868 =C2=B1 17%     -80.5%       1338 =C2=B1 29%      -5.2%       651=
1 =C2=B1 10%  softirqs.CPU70.RCU
      2544 =C2=B1 11%     -12.9%       2215 =C2=B1 10%     +17.2%       298=
2 =C2=B1  9%  softirqs.CPU70.SCHED
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU70.TASKLET
    236.17 =C2=B1166%     -86.1%      32.83 =C2=B1 36%     -64.9%      83.0=
0 =C2=B1 67%  softirqs.CPU70.TIMER
      2.67 =C2=B1223%      +6.3%       2.83 =C2=B1141%     -96.2%       0.1=
0 =C2=B1300%  softirqs.CPU71.BLOCK
     10.50 =C2=B1185%     -85.7%       1.50 =C2=B1 33%    +243.8%      36.1=
0 =C2=B1258%  softirqs.CPU71.NET_RX
      0.50 =C2=B1100%     -66.7%       0.17 =C2=B1223%     -20.0%       0.4=
0 =C2=B1122%  softirqs.CPU71.NET_TX
      6862 =C2=B1 18%     -79.0%       1440 =C2=B1 28%      -5.1%       651=
1 =C2=B1  7%  softirqs.CPU71.RCU
      2777 =C2=B1 11%     -28.8%       1978 =C2=B1  9%      +3.6%       287=
6 =C2=B1  8%  softirqs.CPU71.SCHED
      2.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU71.TASKLET
    197.67 =C2=B1140%     -86.4%      26.83 =C2=B1 19%     -68.0%      63.2=
0 =C2=B1 33%  softirqs.CPU71.TIMER
      0.00         +5e+101%       0.50 =C2=B1223% +2.0e+103%      20.50 =C2=
=B1242%  softirqs.CPU72.BLOCK
      3.83 =C2=B1190%    -100.0%       0.00          +233.9%      12.80 =C2=
=B1300%  softirqs.CPU72.NET_RX
      0.17 =C2=B1223%    +900.0%       1.67 =C2=B1223%    -100.0%       0.0=
0        softirqs.CPU72.NET_TX
      5754 =C2=B1 18%     -87.3%     730.67 =C2=B1 24%      -1.4%       567=
3 =C2=B1 13%  softirqs.CPU72.RCU
      2272 =C2=B1 11%     -26.7%       1664 =C2=B1  6%     +34.6%       305=
8 =C2=B1 13%  softirqs.CPU72.SCHED
      0.00       +1.7e+101%       0.17 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU72.TASKLET
     83.83 =C2=B1 67%     -40.0%      50.33 =C2=B1111%      +0.9%      84.6=
0 =C2=B1 60%  softirqs.CPU72.TIMER
      0.33 =C2=B1223%   +1250.0%       4.50 =C2=B1223%   +6110.0%      20.7=
0 =C2=B1253%  softirqs.CPU73.BLOCK
      0.00       +1.2e+102%       1.17 =C2=B1143% +9.1e+102%       9.10 =C2=
=B1180%  softirqs.CPU73.NET_RX
      0.00       +3.3e+101%       0.33 =C2=B1141%   +1e+101%       0.10 =C2=
=B1300%  softirqs.CPU73.NET_TX
      5655 =C2=B1 19%     -81.0%       1075 =C2=B1 66%      +0.0%       565=
5 =C2=B1 15%  softirqs.CPU73.RCU
      2333 =C2=B1 13%     +14.8%       2679 =C2=B1 55%     +30.8%       305=
2 =C2=B1 15%  softirqs.CPU73.SCHED
      2.00 =C2=B1223%    -100.0%       0.00           +15.0%       2.30 =C2=
=B1300%  softirqs.CPU73.TASKLET
     57.83 =C2=B1 43%   +1895.7%       1154 =C2=B1160%     +82.9%     105.8=
0 =C2=B1115%  softirqs.CPU73.TIMER
      0.00          -100.0%       0.00         +4e+101%       0.40 =C2=B130=
0%  softirqs.CPU74.BLOCK
      3.33 =C2=B1223%    +395.0%      16.50 =C2=B1223%    -100.0%       0.0=
0        softirqs.CPU74.NET_RX
      5732 =C2=B1 18%     -84.5%     888.50 =C2=B1 17%      +1.6%       582=
2 =C2=B1 14%  softirqs.CPU74.RCU
      2131 =C2=B1  5%     -16.2%       1786 =C2=B1  9%     +43.6%       306=
0 =C2=B1 11%  softirqs.CPU74.SCHED
      2.50 =C2=B1190%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU74.TASKLET
     72.83 =C2=B1 96%     -12.1%      64.00 =C2=B1 72%     +42.5%     103.8=
0 =C2=B1120%  softirqs.CPU74.TIMER
      0.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU75.BLOCK
      3.33 =C2=B1165%    -100.0%       0.00           -97.0%       0.10 =C2=
=B1300%  softirqs.CPU75.NET_RX
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU75.NET_TX
      5793 =C2=B1 18%     -86.7%     773.33 =C2=B1 21%      -3.5%       558=
9 =C2=B1 12%  softirqs.CPU75.RCU
      2177 =C2=B1  9%      +0.2%       2182 =C2=B1 31%     +38.7%       302=
0 =C2=B1 20%  softirqs.CPU75.SCHED
      1.00 =C2=B1223%     -33.3%       0.67 =C2=B1141%     -90.0%       0.1=
0 =C2=B1300%  softirqs.CPU75.TASKLET
     44.33 =C2=B1 20%    +234.6%     148.33 =C2=B1157%     +12.8%      50.0=
0 =C2=B1 71%  softirqs.CPU75.TIMER
     29.17 =C2=B1223%     -78.3%       6.33 =C2=B1223%     -99.3%       0.2=
0 =C2=B1300%  softirqs.CPU76.BLOCK
      0.00         +5e+101%       0.50 =C2=B1223% +8.2e+103%      81.60 =C2=
=B1170%  softirqs.CPU76.NET_RX
      0.00          -100.0%       0.00         +1e+101%       0.10 =C2=B130=
0%  softirqs.CPU76.NET_TX
      5788 =C2=B1 18%     -87.1%     749.17 =C2=B1 33%      +7.0%       619=
4 =C2=B1 33%  softirqs.CPU76.RCU
      2458 =C2=B1 19%     -37.2%       1543 =C2=B1 21%     +18.1%       290=
3 =C2=B1  7%  softirqs.CPU76.SCHED
      0.17 =C2=B1223%    +100.0%       0.33 =C2=B1141%    -100.0%       0.0=
0        softirqs.CPU76.TASKLET
     89.00 =C2=B1 57%     -58.4%      37.00 =C2=B1135%    +114.0%     190.5=
0 =C2=B1216%  softirqs.CPU76.TIMER
      8.67 =C2=B1223%     -13.5%       7.50 =C2=B1211%     -97.7%       0.2=
0 =C2=B1300%  softirqs.CPU77.BLOCK
      0.33 =C2=B1223%   +1900.0%       6.67 =C2=B1216%    -100.0%       0.0=
0        softirqs.CPU77.NET_RX
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU77.NET_TX
      5751 =C2=B1 19%     -74.8%       1448 =C2=B1 71%      +7.4%       617=
7 =C2=B1 25%  softirqs.CPU77.RCU
      2166 =C2=B1  6%     -12.6%       1893 =C2=B1 34%     +29.7%       280=
8 =C2=B1 12%  softirqs.CPU77.SCHED
      0.00       +3.3e+101%       0.33 =C2=B1141%   +7e+101%       0.70 =C2=
=B1255%  softirqs.CPU77.TASKLET
     66.00 =C2=B1 55%    +557.3%     433.83 =C2=B1138%    +107.7%     137.1=
0 =C2=B1200%  softirqs.CPU77.TIMER
      0.67 =C2=B1165%    +175.0%       1.83 =C2=B1161%    +890.0%       6.6=
0 =C2=B1191%  softirqs.CPU78.NET_RX
      0.00       +1.7e+101%       0.17 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU78.NET_TX
      5707 =C2=B1 21%     -69.0%       1770 =C2=B1113%      +3.2%       589=
2 =C2=B1 18%  softirqs.CPU78.RCU
      2308 =C2=B1 10%     -29.2%       1633 =C2=B1 23%     +21.2%       279=
7 =C2=B1 16%  softirqs.CPU78.SCHED
      1.00 =C2=B1141%    +450.0%       5.50 =C2=B1215%     +30.0%       1.3=
0 =C2=B1300%  softirqs.CPU78.TASKLET
     50.17 =C2=B1 38%    +417.6%     259.67 =C2=B1196%     +12.4%      56.4=
0 =C2=B1 68%  softirqs.CPU78.TIMER
      5.17 =C2=B1206%     -93.5%       0.33 =C2=B1223%    -100.0%       0.0=
0        softirqs.CPU79.BLOCK
     77.33 =C2=B1112%    +766.6%     670.17 =C2=B1190%     -89.4%       8.2=
0 =C2=B1300%  softirqs.CPU79.NET_RX
      0.50 =C2=B1152%    -100.0%       0.00           -80.0%       0.10 =C2=
=B1300%  softirqs.CPU79.NET_TX
      5797 =C2=B1 18%     -62.3%       2185 =C2=B1138%      +1.7%       589=
6 =C2=B1 16%  softirqs.CPU79.RCU
      2456 =C2=B1  8%     +37.0%       3364 =C2=B1 82%      +8.6%       266=
8 =C2=B1 13%  softirqs.CPU79.SCHED
      3.17 =C2=B1223%      +0.0%       3.17 =C2=B1223%     +42.1%       4.5=
0 =C2=B1223%  softirqs.CPU79.TASKLET
     64.33 =C2=B1 58%     +19.2%      76.67 =C2=B1162%     +27.0%      81.7=
0 =C2=B1120%  softirqs.CPU79.TIMER
      3.00 =C2=B1223%     -66.7%       1.00 =C2=B1223%     -86.7%       0.4=
0 =C2=B1200%  softirqs.CPU8.BLOCK
      1.83 =C2=B1101%    +372.7%       8.67 =C2=B1192%     -18.2%       1.5=
0 =C2=B1 44%  softirqs.CPU8.NET_RX
      1.17 =C2=B1 31%      +0.0%       1.17 =C2=B1 31%      -5.7%       1.1=
0 =C2=B1 27%  softirqs.CPU8.NET_TX
      6612 =C2=B1 16%     -81.2%       1241 =C2=B1 28%      -9.9%       595=
7 =C2=B1 10%  softirqs.CPU8.RCU
      2701 =C2=B1 10%     -18.6%       2199 =C2=B1 12%     +11.3%       300=
8 =C2=B1  7%  softirqs.CPU8.SCHED
      1.50 =C2=B1195%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU8.TASKLET
     70.83 =C2=B1 59%    +132.7%     164.83 =C2=B1147%     +62.8%     115.3=
0 =C2=B1112%  softirqs.CPU8.TIMER
      0.00          -100.0%       0.00       +7.4e+102%       7.40 =C2=B119=
6%  softirqs.CPU80.BLOCK
      0.00       +3.1e+103%      31.17 =C2=B1216%    -100.0%       0.00    =
    softirqs.CPU80.NET_RX
      0.00          -100.0%       0.00         +1e+101%       0.10 =C2=B130=
0%  softirqs.CPU80.NET_TX
      5602 =C2=B1 20%     -79.8%       1129 =C2=B1 72%      +6.0%       593=
7 =C2=B1 17%  softirqs.CPU80.RCU
      2001 =C2=B1 16%     +15.6%       2313 =C2=B1 43%     +40.1%       280=
3 =C2=B1 10%  softirqs.CPU80.SCHED
      1.00 =C2=B1182%    +483.3%       5.83 =C2=B1223%     -90.0%       0.1=
0 =C2=B1300%  softirqs.CPU80.TASKLET
     45.83 =C2=B1 28%     -40.0%      27.50 =C2=B1 98%     +38.1%      63.3=
0 =C2=B1 68%  softirqs.CPU80.TIMER
     14.17 =C2=B1147%     -92.9%       1.00 =C2=B1152%    -100.0%       0.0=
0        softirqs.CPU81.BLOCK
      0.17 =C2=B1223%  +1.4e+06%       2378 =C2=B1223%   +2720.0%       4.7=
0 =C2=B1220%  softirqs.CPU81.NET_RX
      0.00          -100.0%       0.00         +1e+101%       0.10 =C2=B130=
0%  softirqs.CPU81.NET_TX
      5621 =C2=B1 19%     -85.8%     799.67 =C2=B1 39%      +1.7%       571=
9 =C2=B1 13%  softirqs.CPU81.RCU
      2086 =C2=B1  3%     -12.8%       1820 =C2=B1 16%     +28.3%       267=
8 =C2=B1 13%  softirqs.CPU81.SCHED
      0.17 =C2=B1223%    -100.0%       0.00           -40.0%       0.10 =C2=
=B1300%  softirqs.CPU81.TASKLET
     48.50 =C2=B1 70%     -70.1%      14.50 =C2=B1 19%      -0.6%      48.2=
0 =C2=B1 61%  softirqs.CPU81.TIMER
     29.00 =C2=B1144%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU82.BLOCK
      1.83 =C2=B1138%    -100.0%       0.00          +194.5%       5.40 =C2=
=B1299%  softirqs.CPU82.NET_RX
      5930 =C2=B1 24%     -84.0%     946.67 =C2=B1 46%      +0.5%       596=
1 =C2=B1 19%  softirqs.CPU82.RCU
      2242 =C2=B1  5%     -20.2%       1789 =C2=B1  5%     +23.9%       277=
8 =C2=B1  9%  softirqs.CPU82.SCHED
      0.00       +1.7e+101%       0.17 =C2=B1223% +2.9e+102%       2.90 =C2=
=B1206%  softirqs.CPU82.TASKLET
     37.17 =C2=B1 14%    +124.7%      83.50 =C2=B1 99%     +32.4%      49.2=
0 =C2=B1 58%  softirqs.CPU82.TIMER
      0.00         +5e+101%       0.50 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU83.BLOCK
      0.00       +1.7e+101%       0.17 =C2=B1223% +7.6e+104%     757.50 =C2=
=B1299%  softirqs.CPU83.NET_RX
      0.00          -100.0%       0.00         +1e+101%       0.10 =C2=B130=
0%  softirqs.CPU83.NET_TX
      5781 =C2=B1 22%     -85.6%     834.50 =C2=B1 27%      +9.7%       633=
9 =C2=B1 27%  softirqs.CPU83.RCU
      2323 =C2=B1 19%     -20.3%       1853 =C2=B1 10%     +29.8%       301=
5 =C2=B1 27%  softirqs.CPU83.SCHED
      0.00       +8.8e+102%       8.83 =C2=B1218%    -100.0%       0.00    =
    softirqs.CPU83.TASKLET
     56.00 =C2=B1 73%     -45.5%      30.50 =C2=B1 67%    +303.9%     226.2=
0 =C2=B1181%  softirqs.CPU83.TIMER
      0.00          -100.0%       0.00       +2.4e+103%      24.20 =C2=B122=
7%  softirqs.CPU84.BLOCK
      0.83 =C2=B1175%    +220.0%       2.67 =C2=B1155%     -76.0%       0.2=
0 =C2=B1200%  softirqs.CPU84.NET_RX
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU84.NET_TX
      5728 =C2=B1 18%     -80.2%       1133 =C2=B1 41%      +2.1%       584=
6 =C2=B1 19%  softirqs.CPU84.RCU
      2201 =C2=B1  7%      -8.5%       2014 =C2=B1 19%     +22.9%       270=
5 =C2=B1 12%  softirqs.CPU84.SCHED
      0.00          -100.0%       0.00         +1e+101%       0.10 =C2=B130=
0%  softirqs.CPU84.TASKLET
     55.50 =C2=B1 78%    +256.5%     197.83 =C2=B1196%    +215.9%     175.3=
0 =C2=B1188%  softirqs.CPU84.TIMER
      0.67 =C2=B1223%     +25.0%       0.83 =C2=B1223%     +35.0%       0.9=
0 =C2=B1300%  softirqs.CPU85.NET_RX
      0.00          -100.0%       0.00         +2e+101%       0.20 =C2=B120=
0%  softirqs.CPU85.NET_TX
      5894 =C2=B1 20%     -84.2%     930.00 =C2=B1 67%      -0.0%       589=
4 =C2=B1 14%  softirqs.CPU85.RCU
      2221 =C2=B1  9%      -9.5%       2010 =C2=B1 30%     +37.5%       305=
5 =C2=B1 20%  softirqs.CPU85.SCHED
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%    -100.0%       0.0=
0        softirqs.CPU85.TASKLET
     91.17 =C2=B1129%    +234.4%     304.83 =C2=B1203%    +133.0%     212.4=
0 =C2=B1233%  softirqs.CPU85.TIMER
      0.00          -100.0%       0.00       +3.2e+102%       3.20 =C2=B130=
0%  softirqs.CPU86.BLOCK
      0.00       +3.3e+102%       3.33 =C2=B1223% +3.2e+103%      32.40 =C2=
=B1300%  softirqs.CPU86.NET_RX
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU86.NET_TX
      5585 =C2=B1 19%     -85.3%     818.50 =C2=B1 58%      +1.3%       565=
7 =C2=B1 15%  softirqs.CPU86.RCU
      2234 =C2=B1 16%     -17.5%       1843 =C2=B1  9%     +25.2%       279=
8 =C2=B1  8%  softirqs.CPU86.SCHED
     63.17 =C2=B1 79%     -45.1%      34.67 =C2=B1117%     -19.6%      50.8=
0 =C2=B1 78%  softirqs.CPU86.TIMER
      0.00       +6.3e+102%       6.33 =C2=B1223%   +1e+101%       0.10 =C2=
=B1300%  softirqs.CPU87.BLOCK
      1.17 =C2=B1223%    +471.4%       6.67 =C2=B1161%     -31.4%       0.8=
0 =C2=B1300%  softirqs.CPU87.NET_RX
      0.00          -100.0%       0.00         +1e+101%       0.10 =C2=B130=
0%  softirqs.CPU87.NET_TX
      6646 =C2=B1 31%     -90.7%     620.83 =C2=B1 30%     -13.7%       573=
3 =C2=B1 18%  softirqs.CPU87.RCU
      2303 =C2=B1 10%     -23.9%       1752 =C2=B1  7%     +24.2%       286=
1 =C2=B1 13%  softirqs.CPU87.SCHED
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU87.TASKLET
    272.17 =C2=B1188%     -92.1%      21.50 =C2=B1 55%     -78.1%      59.5=
0 =C2=B1 67%  softirqs.CPU87.TIMER
      0.00       +4.5e+102%       4.50 =C2=B1223% +2.8e+102%       2.80 =C2=
=B1300%  softirqs.CPU88.BLOCK
      4.83 =C2=B1161%    -100.0%       0.00          +206.2%      14.80 =C2=
=B1300%  softirqs.CPU88.NET_RX
      0.17 =C2=B1223%    -100.0%       0.00           -40.0%       0.10 =C2=
=B1300%  softirqs.CPU88.NET_TX
      5822 =C2=B1 17%     -84.3%     916.50 =C2=B1 53%      +2.9%       598=
9 =C2=B1 19%  softirqs.CPU88.RCU
      2169 =C2=B1  9%     -16.5%       1811 =C2=B1 12%     +34.2%       291=
1 =C2=B1 13%  softirqs.CPU88.SCHED
      5.50 =C2=B1223%    -100.0%       0.00           -98.2%       0.10 =C2=
=B1300%  softirqs.CPU88.TASKLET
     61.50 =C2=B1 79%     -58.3%      25.67 =C2=B1 94%     +31.2%      80.7=
0 =C2=B1129%  softirqs.CPU88.TIMER
      4.17 =C2=B1223%     -80.0%       0.83 =C2=B1223%     -30.4%       2.9=
0 =C2=B1299%  softirqs.CPU89.BLOCK
     27.17 =C2=B1223%     -65.0%       9.50 =C2=B1223%     -94.1%       1.6=
0 =C2=B1168%  softirqs.CPU89.NET_RX
      0.00          -100.0%       0.00         +2e+101%       0.20 =C2=B120=
0%  softirqs.CPU89.NET_TX
      5763 =C2=B1 18%     -90.3%     556.83 =C2=B1 16%      -1.1%       569=
9 =C2=B1 21%  softirqs.CPU89.RCU
      2510 =C2=B1 20%     -32.6%       1692 =C2=B1 10%      +8.4%       272=
2 =C2=B1 11%  softirqs.CPU89.SCHED
      0.00          -100.0%       0.00         +1e+101%       0.10 =C2=B130=
0%  softirqs.CPU89.TASKLET
    344.33 =C2=B1197%     -96.5%      12.17 =C2=B1 19%     -87.1%      44.3=
0 =C2=B1 79%  softirqs.CPU89.TIMER
      0.00         +2e+102%       2.00 =C2=B1223% +6.8e+102%       6.80 =C2=
=B1193%  softirqs.CPU9.BLOCK
     16.00 =C2=B1218%     -95.8%       0.67 =C2=B1111%     +29.4%      20.7=
0 =C2=B1280%  softirqs.CPU9.NET_RX
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU9.NET_TX
      6500 =C2=B1 14%     -84.1%       1035 =C2=B1 32%      -8.5%       594=
8 =C2=B1 10%  softirqs.CPU9.RCU
      2549 =C2=B1  9%     -19.3%       2056 =C2=B1 15%     +21.7%       310=
2 =C2=B1  9%  softirqs.CPU9.SCHED
      5.83 =C2=B1208%     -88.6%       0.67 =C2=B1141%    -100.0%       0.0=
0        softirqs.CPU9.TASKLET
     99.50 =C2=B1 38%     -74.9%      25.00 =C2=B1 28%     +66.9%     166.1=
0 =C2=B1165%  softirqs.CPU9.TIMER
      0.00          -100.0%       0.00       +1.1e+103%      10.60 =C2=B117=
9%  softirqs.CPU90.BLOCK
      1.67 =C2=B1197%    +110.0%       3.50 =C2=B1211%     -52.0%       0.8=
0 =C2=B1175%  softirqs.CPU90.NET_RX
      0.00          -100.0%       0.00         +1e+101%       0.10 =C2=B130=
0%  softirqs.CPU90.NET_TX
      5533 =C2=B1 21%     -88.5%     636.83 =C2=B1 33%      +7.1%       592=
7 =C2=B1 15%  softirqs.CPU90.RCU
      2202 =C2=B1  8%     -24.7%       1658 =C2=B1  9%     +35.4%       298=
2 =C2=B1 22%  softirqs.CPU90.SCHED
     79.83 =C2=B1122%     -73.1%      21.50 =C2=B1 85%     -56.3%      34.9=
0 =C2=B1 40%  softirqs.CPU90.TIMER
      7.50 =C2=B1223%    +111.1%      15.83 =C2=B1142%    -100.0%       0.0=
0        softirqs.CPU91.BLOCK
      0.00       +1.3e+102%       1.33 =C2=B1223% +2.3e+102%       2.30 =C2=
=B1193%  softirqs.CPU91.NET_RX
      0.00       +1.7e+101%       0.17 =C2=B1223%   +2e+101%       0.20 =C2=
=B1200%  softirqs.CPU91.NET_TX
      5892 =C2=B1 16%     -90.8%     543.83 =C2=B1 13%      -5.8%       555=
2 =C2=B1 12%  softirqs.CPU91.RCU
      2438 =C2=B1 15%     -31.8%       1662 =C2=B1  6%      +7.3%       261=
5 =C2=B1  8%  softirqs.CPU91.SCHED
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU91.TASKLET
     45.33 =C2=B1 41%     -71.3%      13.00 =C2=B1 21%     +76.2%      79.9=
0 =C2=B1105%  softirqs.CPU91.TIMER
      3.00 =C2=B1223%     -94.4%       0.17 =C2=B1223%      +6.7%       3.2=
0 =C2=B1289%  softirqs.CPU92.BLOCK
     49.50 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU92.NET_RX
      5572 =C2=B1 18%     -84.6%     860.83 =C2=B1 39%      +1.3%       564=
6 =C2=B1 19%  softirqs.CPU92.RCU
      2158 =C2=B1 12%     -20.8%       1708 =C2=B1 11%     +29.4%       279=
3 =C2=B1 10%  softirqs.CPU92.SCHED
      0.00       +3.2e+102%       3.17 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU92.TASKLET
     72.00 =C2=B1123%     -75.7%      17.50 =C2=B1 36%     -54.2%      33.0=
0 =C2=B1 37%  softirqs.CPU92.TIMER
      5.67 =C2=B1208%     -94.1%       0.33 =C2=B1223%    +438.2%      30.5=
0 =C2=B1269%  softirqs.CPU93.BLOCK
      0.33 =C2=B1223%   +1050.0%       3.83 =C2=B1190%     -70.0%       0.1=
0 =C2=B1300%  softirqs.CPU93.NET_RX
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU93.NET_TX
      5551 =C2=B1 20%     -86.3%     759.83 =C2=B1 42%      +6.7%       592=
3 =C2=B1 19%  softirqs.CPU93.RCU
      2322 =C2=B1 21%     -25.1%       1739 =C2=B1  6%     +15.9%       269=
1 =C2=B1  8%  softirqs.CPU93.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU93.TASKLET
    264.33 =C2=B1191%     -92.9%      18.83 =C2=B1 54%     -80.1%      52.5=
0 =C2=B1 78%  softirqs.CPU93.TIMER
      0.00          -100.0%       0.00         +2e+101%       0.20 =C2=B120=
0%  softirqs.CPU94.NET_TX
      5531 =C2=B1 21%     -88.7%     624.83 =C2=B1 18%      +0.4%       555=
5 =C2=B1 14%  softirqs.CPU94.RCU
      2027 =C2=B1  2%     -14.7%       1729 =C2=B1  8%     +38.1%       280=
0 =C2=B1  7%  softirqs.CPU94.SCHED
      0.00          -100.0%       0.00       +3.1e+102%       3.10 =C2=B130=
0%  softirqs.CPU94.TASKLET
     31.67 =C2=B1 24%     -41.1%      18.67 =C2=B1 61%     +36.1%      43.1=
0 =C2=B1 41%  softirqs.CPU94.TIMER
      0.00          -100.0%       0.00       +5.5e+102%       5.50 =C2=B128=
8%  softirqs.CPU95.BLOCK
      0.67 =C2=B1 70%     -75.0%       0.17 =C2=B1223%    +200.0%       2.0=
0 =C2=B1176%  softirqs.CPU95.NET_TX
      6013 =C2=B1 22%     -89.1%     655.83 =C2=B1 33%      +3.4%       622=
0 =C2=B1 15%  softirqs.CPU95.RCU
      2366 =C2=B1  6%     -28.9%       1681 =C2=B1  4%     +25.6%       297=
2 =C2=B1 21%  softirqs.CPU95.SCHED
      0.00       +3.3e+101%       0.33 =C2=B1141% +1.9e+102%       1.90 =C2=
=B1300%  softirqs.CPU95.TASKLET
     53.83 =C2=B1 34%     -67.8%      17.33 =C2=B1 22%    +341.4%     237.6=
0 =C2=B1198%  softirqs.CPU95.TIMER
      2.17 =C2=B1 17%      +0.0%       2.17 =C2=B1 17%      +6.2%       2.3=
0 =C2=B1 19%  softirqs.HI
      4103 =C2=B1120%    +347.4%      18361 =C2=B1155%     -17.5%       338=
3 =C2=B1116%  softirqs.NET_RX
     31.83 =C2=B1  7%      -8.4%      29.17 =C2=B1  2%      +0.8%      32.1=
0 =C2=B1  8%  softirqs.NET_TX
    603089 =C2=B1 17%     -81.1%     113890 =C2=B1  9%      -3.5%     58223=
7 =C2=B1 10%  softirqs.RCU
    244389           -19.2%     197587 =C2=B1  4%     +18.0%     288443 =C2=
=B1  3%  softirqs.SCHED
    229.33            -0.3%     228.67            -0.0%     229.30        s=
oftirqs.TASKLET
     13676 =C2=B1  5%      -4.3%      13086 =C2=B1 16%      -1.5%      1347=
1 =C2=B1  3%  softirqs.TIMER
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.0:IO-APIC.2-edge.timer
      6.00 =C2=B1194%     -83.3%       1.00 =C2=B1182%     -76.7%       1.4=
0 =C2=B1253%  interrupts.100:PCI-MSI.31981633-edge.i40e-eth0-TxRx-64
      1.17 =C2=B1115%     -71.4%       0.33 =C2=B1223%     -74.3%       0.3=
0 =C2=B1213%  interrupts.101:PCI-MSI.31981634-edge.i40e-eth0-TxRx-65
      6.17 =C2=B1157%    +775.7%      54.00 =C2=B1223%    +459.5%      34.5=
0 =C2=B1217%  interrupts.102:PCI-MSI.31981635-edge.i40e-eth0-TxRx-66
     25.50 =C2=B1221%     -93.5%       1.67 =C2=B1145%     -89.0%       2.8=
0 =C2=B1276%  interrupts.103:PCI-MSI.31981636-edge.i40e-eth0-TxRx-67
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%   +4760.0%       8.1=
0 =C2=B1265%  interrupts.104:PCI-MSI.31981637-edge.i40e-eth0-TxRx-68
      0.50 =C2=B1152%   +6366.7%      32.33 =C2=B1220%    -100.0%       0.0=
0        interrupts.105:PCI-MSI.31981638-edge.i40e-eth0-TxRx-69
     13.00 =C2=B1220%    -100.0%       0.00           -98.5%       0.20 =C2=
=B1200%  interrupts.106:PCI-MSI.31981639-edge.i40e-eth0-TxRx-70
      2.50 =C2=B1223%     -86.7%       0.33 =C2=B1141%    +212.0%       7.8=
0 =C2=B1177%  interrupts.107:PCI-MSI.31981640-edge.i40e-eth0-TxRx-71
      4.50 =C2=B1213%     -96.3%       0.17 =C2=B1223%    +242.2%      15.4=
0 =C2=B1300%  interrupts.108:PCI-MSI.31981641-edge.i40e-eth0-TxRx-72
      0.17 =C2=B1223%   +1000.0%       1.83 =C2=B1200%   +9080.0%      15.3=
0 =C2=B1200%  interrupts.109:PCI-MSI.31981642-edge.i40e-eth0-TxRx-73
      4.33 =C2=B1223%    -100.0%       0.00           -88.5%       0.50 =C2=
=B1100%  interrupts.110:PCI-MSI.31981643-edge.i40e-eth0-TxRx-74
      4.33 =C2=B1134%    -100.0%       0.00           -93.1%       0.30 =C2=
=B1213%  interrupts.111:PCI-MSI.31981644-edge.i40e-eth0-TxRx-75
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%  +67940.0%     113.4=
0 =C2=B1195%  interrupts.112:PCI-MSI.31981645-edge.i40e-eth0-TxRx-76
      0.50 =C2=B1223%   +1800.0%       9.50 =C2=B1209%     -20.0%       0.4=
0 =C2=B1200%  interrupts.113:PCI-MSI.31981646-edge.i40e-eth0-TxRx-77
      0.00       +1.7e+101%       0.17 =C2=B1223%   +8e+102%       8.00 =C2=
=B1169%  interrupts.114:PCI-MSI.31981647-edge.i40e-eth0-TxRx-78
     38.17 =C2=B1121%   +2192.1%     874.83 =C2=B1174%     -67.0%      12.6=
0 =C2=B1300%  interrupts.115:PCI-MSI.31981648-edge.i40e-eth0-TxRx-79
      0.83 =C2=B1107%   +4920.0%      41.83 =C2=B1212%     -64.0%       0.3=
0 =C2=B1152%  interrupts.116:PCI-MSI.31981649-edge.i40e-eth0-TxRx-80
      0.50 =C2=B1223%  +9.4e+05%       4722 =C2=B1223%    +620.0%       3.6=
0 =C2=B1290%  interrupts.117:PCI-MSI.31981650-edge.i40e-eth0-TxRx-81
      1.00 =C2=B1223%     -33.3%       0.67 =C2=B1111%    +970.0%      10.7=
0 =C2=B1296%  interrupts.118:PCI-MSI.31981651-edge.i40e-eth0-TxRx-82
      0.33 =C2=B1223%    -100.0%       0.00        +1.3e+05%     430.30 =C2=
=B1298%  interrupts.119:PCI-MSI.31981652-edge.i40e-eth0-TxRx-83
      1.50 =C2=B1223%    +211.1%       4.67 =C2=B1129%     -86.7%       0.2=
0 =C2=B1200%  interrupts.120:PCI-MSI.31981653-edge.i40e-eth0-TxRx-84
      1.50 =C2=B1223%     -33.3%       1.00 =C2=B1223%     -86.7%       0.2=
0 =C2=B1300%  interrupts.121:PCI-MSI.31981654-edge.i40e-eth0-TxRx-85
      0.17 =C2=B1223%   +2600.0%       4.50 =C2=B1213%  +24260.0%      40.6=
0 =C2=B1297%  interrupts.122:PCI-MSI.31981655-edge.i40e-eth0-TxRx-86
      1.00 =C2=B1223%    +600.0%       7.00 =C2=B1159%     -70.0%       0.3=
0 =C2=B1152%  interrupts.123:PCI-MSI.31981656-edge.i40e-eth0-TxRx-87
      4.67 =C2=B1214%    -100.0%       0.00          +515.0%      28.70 =C2=
=B1298%  interrupts.124:PCI-MSI.31981657-edge.i40e-eth0-TxRx-88
      9.17 =C2=B1223%     +69.1%      15.50 =C2=B1223%     -85.8%       1.3=
0 =C2=B1250%  interrupts.125:PCI-MSI.31981658-edge.i40e-eth0-TxRx-89
      2.83 =C2=B1223%     +64.7%       4.67 =C2=B1205%     -43.5%       1.6=
0 =C2=B1181%  interrupts.126:PCI-MSI.31981659-edge.i40e-eth0-TxRx-90
      0.00          -100.0%       0.00       +3.7e+102%       3.70 =C2=B117=
6%  interrupts.127:PCI-MSI.31981660-edge.i40e-eth0-TxRx-91
     97.00 =C2=B1223%    -100.0%       0.00           -99.7%       0.30 =C2=
=B1213%  interrupts.128:PCI-MSI.31981661-edge.i40e-eth0-TxRx-92
      0.33 =C2=B1223%   +1200.0%       4.33 =C2=B1223%    -100.0%       0.0=
0        interrupts.129:PCI-MSI.31981662-edge.i40e-eth0-TxRx-93
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.293:PCI-MSI.327680-edge.xhci_hcd
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.295:PCI-MSI.65536-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.297:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.298:PCI-MSI.69632-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.299:PCI-MSI.71680-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.300:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.301:PCI-MSI.75776-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.302:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.303:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.303:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.304:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.305:PCI-MSI.67174400-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.306:PCI-MSI.67174400-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.307:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.308:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.308:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.309:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.309:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.310:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.310:PCI-MSI.67182592-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.311:PCI-MSI.67182592-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.311:PCI-MSI.67184640-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.312:PCI-MSI.67184640-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.312:PCI-MSI.67186688-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.313:PCI-MSI.67186688-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.313:PCI-MSI.67188736-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.314:PCI-MSI.67188736-edge.ioat-msix
    552.33 =C2=B1 16%     -82.6%      96.00            -6.5%     516.40 =C2=
=B1  3%  interrupts.315:PCI-MSI.376832-edge.ahci[0000:00:17.0]
      0.50 =C2=B1152%    -100.0%       0.00          +560.0%       3.30 =C2=
=B1235%  interrupts.36:PCI-MSI.31981569-edge.i40e-eth0-TxRx-0
      0.17 =C2=B1223%   +2800.0%       4.83 =C2=B1196%    +620.0%       1.2=
0 =C2=B1152%  interrupts.37:PCI-MSI.31981570-edge.i40e-eth0-TxRx-1
     40.00 =C2=B1223%     -37.5%      25.00 =C2=B1223%    -100.0%       0.0=
0        interrupts.38:PCI-MSI.31981571-edge.i40e-eth0-TxRx-2
      0.00       +3.5e+102%       3.50 =C2=B1223% +6.1e+103%      60.90 =C2=
=B1282%  interrupts.39:PCI-MSI.31981572-edge.i40e-eth0-TxRx-3
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.3:IO-APIC.3-edge
     58.33 =C2=B1221%     -99.7%       0.17 =C2=B1223%     +43.1%      83.5=
0 =C2=B1163%  interrupts.40:PCI-MSI.31981573-edge.i40e-eth0-TxRx-4
     20.83 =C2=B1160%   +3176.0%     682.50 =C2=B1223%    +465.4%     117.8=
0 =C2=B1298%  interrupts.41:PCI-MSI.31981574-edge.i40e-eth0-TxRx-5
     50.33 =C2=B1223%     -93.4%       3.33 =C2=B1175%     -95.6%       2.2=
0 =C2=B1182%  interrupts.42:PCI-MSI.31981575-edge.i40e-eth0-TxRx-6
      0.33 =C2=B1223%    +300.0%       1.33 =C2=B1165%     -10.0%       0.3=
0 =C2=B1300%  interrupts.43:PCI-MSI.31981576-edge.i40e-eth0-TxRx-7
      1.67 =C2=B1223%    +530.0%      10.50 =C2=B1215%     -94.0%       0.1=
0 =C2=B1300%  interrupts.44:PCI-MSI.31981577-edge.i40e-eth0-TxRx-8
     31.17 =C2=B1223%     -97.3%       0.83 =C2=B1128%     +30.3%      40.6=
0 =C2=B1287%  interrupts.45:PCI-MSI.31981578-edge.i40e-eth0-TxRx-9
      1.17 =C2=B1187%    +142.9%       2.83 =C2=B1193%     -14.3%       1.0=
0 =C2=B1204%  interrupts.46:PCI-MSI.31981579-edge.i40e-eth0-TxRx-10
      7.83 =C2=B1223%     -83.0%       1.33 =C2=B1165%    +171.9%      21.3=
0 =C2=B1289%  interrupts.47:PCI-MSI.31981580-edge.i40e-eth0-TxRx-11
      0.33 =C2=B1223%   +5100.0%      17.33 =C2=B1223%   +3020.0%      10.4=
0 =C2=B1231%  interrupts.48:PCI-MSI.31981581-edge.i40e-eth0-TxRx-12
      2.00 =C2=B1223%     -91.7%       0.17 =C2=B1223%   +1585.0%      33.7=
0 =C2=B1299%  interrupts.49:PCI-MSI.31981582-edge.i40e-eth0-TxRx-13
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.4:IO-APIC.4-edge.ttyS0
    699.83 =C2=B1197%     -99.7%       1.83 =C2=B1223%     -99.6%       2.8=
0 =C2=B1276%  interrupts.50:PCI-MSI.31981583-edge.i40e-eth0-TxRx-14
     25.33 =C2=B1209%     -89.5%       2.67 =C2=B1147%     -96.8%       0.8=
0 =C2=B1134%  interrupts.51:PCI-MSI.31981584-edge.i40e-eth0-TxRx-15
      1.83 =C2=B1200%     -36.4%       1.17 =C2=B1125%     +69.1%       3.1=
0 =C2=B1191%  interrupts.52:PCI-MSI.31981585-edge.i40e-eth0-TxRx-16
     18.50 =C2=B1211%     -37.8%      11.50 =C2=B1223%     -96.2%       0.7=
0 =C2=B1255%  interrupts.53:PCI-MSI.31981586-edge.i40e-eth0-TxRx-17
      7.00 =C2=B1141%     -69.0%       2.17 =C2=B1185%     -95.7%       0.3=
0 =C2=B1213%  interrupts.54:PCI-MSI.31981587-edge.i40e-eth0-TxRx-18
      0.17 =C2=B1223%    +100.0%       0.33 =C2=B1223%    +3e+05%     495.7=
0 =C2=B1292%  interrupts.55:PCI-MSI.31981588-edge.i40e-eth0-TxRx-19
     20.83 =C2=B1139%     -80.8%       4.00 =C2=B1223%     -42.4%      12.0=
0 =C2=B1184%  interrupts.56:PCI-MSI.31981589-edge.i40e-eth0-TxRx-20
      0.17 =C2=B1223%   +5300.0%       9.00 =C2=B1223%  +23420.0%      39.2=
0 =C2=B1288%  interrupts.57:PCI-MSI.31981590-edge.i40e-eth0-TxRx-21
      1.00 =C2=B1223%  +28833.3%     289.33 =C2=B1223%   +2080.0%      21.8=
0 =C2=B1209%  interrupts.58:PCI-MSI.31981591-edge.i40e-eth0-TxRx-22
      0.50 =C2=B1152%    +300.0%       2.00 =C2=B1182%     +80.0%       0.9=
0 =C2=B1201%  interrupts.59:PCI-MSI.31981592-edge.i40e-eth0-TxRx-23
     69.50 =C2=B1213%     -96.9%       2.17 =C2=B1 17%     -95.4%       3.2=
0 =C2=B1 92%  interrupts.60:PCI-MSI.31981593-edge.i40e-eth0-TxRx-24
      0.67 =C2=B1111%    +525.0%       4.17 =C2=B1223%   +1760.0%      12.4=
0 =C2=B1206%  interrupts.61:PCI-MSI.31981594-edge.i40e-eth0-TxRx-25
     54.83 =C2=B1222%     -97.0%       1.67 =C2=B1197%     -96.5%       1.9=
0 =C2=B1300%  interrupts.62:PCI-MSI.31981595-edge.i40e-eth0-TxRx-26
      0.83 =C2=B1175%    +200.0%       2.50 =C2=B1130%   +1124.0%      10.2=
0 =C2=B1256%  interrupts.63:PCI-MSI.31981596-edge.i40e-eth0-TxRx-27
      0.00       +3.3e+101%       0.33 =C2=B1223%   +3e+101%       0.30 =C2=
=B1300%  interrupts.64:PCI-MSI.31981597-edge.i40e-eth0-TxRx-28
      0.33 =C2=B1223%    +350.0%       1.50 =C2=B1152%   +6440.0%      21.8=
0 =C2=B1277%  interrupts.65:PCI-MSI.31981598-edge.i40e-eth0-TxRx-29
      0.50 =C2=B1223%    -100.0%       0.00          +380.0%       2.40 =C2=
=B1161%  interrupts.66:PCI-MSI.31981599-edge.i40e-eth0-TxRx-30
      0.50 =C2=B1100%  +41833.3%     209.67 =C2=B1222%   +3760.0%      19.3=
0 =C2=B1294%  interrupts.67:PCI-MSI.31981600-edge.i40e-eth0-TxRx-31
      1.83 =C2=B1223%     -90.9%       0.17 =C2=B1223%     -23.6%       1.4=
0 =C2=B1189%  interrupts.68:PCI-MSI.31981601-edge.i40e-eth0-TxRx-32
     12.50 =C2=B1212%     -98.7%       0.17 =C2=B1223%     -74.4%       3.2=
0 =C2=B1219%  interrupts.69:PCI-MSI.31981602-edge.i40e-eth0-TxRx-33
      1.67 =C2=B1223%     -60.0%       0.67 =C2=B1141%     +86.0%       3.1=
0 =C2=B1205%  interrupts.70:PCI-MSI.31981603-edge.i40e-eth0-TxRx-34
      3530 =C2=B1223%    -100.0%       0.33 =C2=B1223%     -99.9%       3.3=
0 =C2=B1253%  interrupts.71:PCI-MSI.31981604-edge.i40e-eth0-TxRx-35
      0.33 =C2=B1223%   +4000.0%      13.67 =C2=B1160%   +8270.0%      27.9=
0 =C2=B1259%  interrupts.72:PCI-MSI.31981605-edge.i40e-eth0-TxRx-36
      7.83 =C2=B1135%     -97.9%       0.17 =C2=B1223%     -19.6%       6.3=
0 =C2=B1164%  interrupts.73:PCI-MSI.31981606-edge.i40e-eth0-TxRx-37
      1.67 =C2=B1223%     -40.0%       1.00 =C2=B1152%   +2528.0%      43.8=
0 =C2=B1287%  interrupts.74:PCI-MSI.31981607-edge.i40e-eth0-TxRx-38
     61.67 =C2=B1205%     -99.7%       0.17 =C2=B1223%     -95.8%       2.6=
0 =C2=B1205%  interrupts.75:PCI-MSI.31981608-edge.i40e-eth0-TxRx-39
      4.50 =C2=B1213%     -96.3%       0.17 =C2=B1223%    +751.1%      38.3=
0 =C2=B1275%  interrupts.76:PCI-MSI.31981609-edge.i40e-eth0-TxRx-40
      1.67 =C2=B1223%     -60.0%       0.67 =C2=B1141%     -88.0%       0.2=
0 =C2=B1200%  interrupts.77:PCI-MSI.31981610-edge.i40e-eth0-TxRx-41
      0.33 =C2=B1141%    +700.0%       2.67 =C2=B1190%    -100.0%       0.0=
0        interrupts.78:PCI-MSI.31981611-edge.i40e-eth0-TxRx-42
      2.17 =C2=B1 41%   +9607.7%     210.33 =C2=B1221%     +15.4%       2.5=
0 =C2=B1128%  interrupts.79:PCI-MSI.31981612-edge.i40e-eth0-TxRx-43
      0.17 =C2=B1223%  +3.7e+05%     623.67 =C2=B1223%   +5360.0%       9.1=
0 =C2=B1227%  interrupts.80:PCI-MSI.31981613-edge.i40e-eth0-TxRx-44
      0.00          -100.0%       0.00         +6e+101%       0.60 =C2=B116=
9%  interrupts.81:PCI-MSI.31981614-edge.i40e-eth0-TxRx-45
      0.00         +2e+102%       2.00 =C2=B1202%   +4e+101%       0.40 =C2=
=B1300%  interrupts.82:PCI-MSI.31981615-edge.i40e-eth0-TxRx-46
      0.33 =C2=B1223%     -50.0%       0.17 =C2=B1223%     -70.0%       0.1=
0 =C2=B1300%  interrupts.83:PCI-MSI.31981616-edge.i40e-eth0-TxRx-47
    107.50 =C2=B1222%     -98.9%       1.17 =C2=B1187%     -99.3%       0.8=
0 =C2=B1222%  interrupts.84:PCI-MSI.31981617-edge.i40e-eth0-TxRx-48
      0.00       +1.7e+101%       0.17 =C2=B1223% +1.7e+103%      16.80 =C2=
=B1201%  interrupts.85:PCI-MSI.31981618-edge.i40e-eth0-TxRx-49
      2.17 =C2=B1203%     -23.1%       1.67 =C2=B1223%     -76.9%       0.5=
0 =C2=B1300%  interrupts.86:PCI-MSI.31981619-edge.i40e-eth0-TxRx-50
      2.00 =C2=B1202%    +566.7%      13.33 =C2=B1223%    +615.0%      14.3=
0 =C2=B1286%  interrupts.87:PCI-MSI.31981620-edge.i40e-eth0-TxRx-51
      0.00       +4.8e+103%      48.17 =C2=B1210% +2.1e+102%       2.10 =C2=
=B1188%  interrupts.88:PCI-MSI.31981621-edge.i40e-eth0-TxRx-52
      0.50 =C2=B1223%    +500.0%       3.00 =C2=B1209%     -80.0%       0.1=
0 =C2=B1300%  interrupts.89:PCI-MSI.31981622-edge.i40e-eth0-TxRx-53
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.8:IO-APIC.8-edge.rtc0
      0.83 =C2=B1175%    +400.0%       4.17 =C2=B1184%     -52.0%       0.4=
0 =C2=B1165%  interrupts.90:PCI-MSI.31981623-edge.i40e-eth0-TxRx-54
      1.33 =C2=B1160%    +212.5%       4.17 =C2=B1223%      +5.0%       1.4=
0 =C2=B1232%  interrupts.91:PCI-MSI.31981624-edge.i40e-eth0-TxRx-55
      2.67 =C2=B1155%     -93.8%       0.17 =C2=B1223%    +556.2%      17.5=
0 =C2=B1198%  interrupts.92:PCI-MSI.31981625-edge.i40e-eth0-TxRx-56
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.93:PCI-MSI.31981626-edge.i40e-eth0-TxRx-57
      0.33 =C2=B1223%     -50.0%       0.17 =C2=B1223%  +16250.0%      54.5=
0 =C2=B1296%  interrupts.94:PCI-MSI.31981627-edge.i40e-eth0-TxRx-58
      0.00       +1.4e+106%      14483 =C2=B1223%   +3e+102%       3.00 =C2=
=B1267%  interrupts.95:PCI-MSI.31981628-edge.i40e-eth0-TxRx-59
     19.33 =C2=B1223%   +3151.7%     628.67 =C2=B1223%     -99.0%       0.2=
0 =C2=B1300%  interrupts.96:PCI-MSI.31981629-edge.i40e-eth0-TxRx-60
      0.17 =C2=B1223%    -100.0%       0.00        +33800.0%      56.50 =C2=
=B1298%  interrupts.97:PCI-MSI.31981630-edge.i40e-eth0-TxRx-61
     37.33 =C2=B1161%     -94.2%       2.17 =C2=B1183%    -100.0%       0.0=
0        interrupts.98:PCI-MSI.31981631-edge.i40e-eth0-TxRx-62
     82.33 =C2=B1215%     -80.0%      16.50 =C2=B1176%     -99.9%       0.1=
0 =C2=B1300%  interrupts.99:PCI-MSI.31981632-edge.i40e-eth0-TxRx-63
      0.00          -100.0%       0.00       +1.3e+104%     128.20        i=
nterrupts.9:IO-APIC.9-fasteoi.acpi
    816631 =C2=B1 31%     -49.8%     410137 =C2=B1 14%      +7.9%     88115=
7 =C2=B1 31%  interrupts.CAL:Function_call_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU0.0:IO-APIC.2-edge.timer
      0.17 =C2=B1223%    -100.0%       0.00           +20.0%       0.20 =C2=
=B1200%  interrupts.CPU0.119:PCI-MSI.31981652-edge.i40e-eth0-TxRx-83
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU0.297:PCI-MSI.67584-edge.ioat-msix
      0.17 =C2=B1223%    -100.0%       0.00         +1760.0%       3.10 =C2=
=B1250%  interrupts.CPU0.36:PCI-MSI.31981569-edge.i40e-eth0-TxRx-0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU0.3:IO-APIC.3-edge
      0.00       +1.7e+101%       0.17 =C2=B1223%    -100.0%       0.00    =
    interrupts.CPU0.71:PCI-MSI.31981604-edge.i40e-eth0-TxRx-35
     81896 =C2=B1 52%     -94.6%       4446 =C2=B1 59%     -13.4%      7091=
2 =C2=B1 66%  interrupts.CPU0.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.6e+102%       1.60 =C2=B1 3=
0%  interrupts.CPU0.IWI:IRQ_work_interrupts
     60654           -95.4%       2775 =C2=B1 19%    +110.6%     127744    =
    interrupts.CPU0.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU0.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7126 =C2=B1 1=
5%  interrupts.CPU0.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7126 =C2=B1 1=
5%  interrupts.CPU0.PMI:Performance_monitoring_interrupts
   1679755 =C2=B1 39%     -99.1%      14302 =C2=B1174%     -38.2%    103770=
5 =C2=B1 43%  interrupts.CPU0.RES:Rescheduling_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU0.RTR:APIC_ICR_read_retries
      0.67 =C2=B1 70%    +125.0%       1.50 =C2=B1195%    +185.0%       1.9=
0 =C2=B1113%  interrupts.CPU0.TLB:TLB_shootdowns
      0.17 =C2=B1223%    +100.0%       0.33 =C2=B1141%    -100.0%       0.0=
0        interrupts.CPU1.120:PCI-MSI.31981653-edge.i40e-eth0-TxRx-84
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU1.298:PCI-MSI.69632-edge.ioat-msix
      0.00       +4.5e+102%       4.50 =C2=B1213%   +9e+101%       0.90 =C2=
=B1195%  interrupts.CPU1.37:PCI-MSI.31981570-edge.i40e-eth0-TxRx-1
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU1.3:IO-APIC.3-edge
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%     +80.0%       0.3=
0 =C2=B1152%  interrupts.CPU1.72:PCI-MSI.31981605-edge.i40e-eth0-TxRx-36
      0.00          -100.0%       0.00       +1.3e+104%     128.20        i=
nterrupts.CPU1.9:IO-APIC.9-fasteoi.acpi
     40195 =C2=B1 60%     -98.3%     679.00 =C2=B1 26%      -6.7%      3748=
8 =C2=B1 82%  interrupts.CPU1.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.4e+102%       1.40 =C2=B1 4=
7%  interrupts.CPU1.IWI:IRQ_work_interrupts
     61525           -94.5%       3389 =C2=B1 36%    +107.8%     127825    =
    interrupts.CPU1.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU1.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7126 =C2=B1 1=
5%  interrupts.CPU1.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7126 =C2=B1 1=
5%  interrupts.CPU1.PMI:Performance_monitoring_interrupts
    692538 =C2=B1 48%     -99.9%       1023 =C2=B1223%     +42.1%     98407=
5 =C2=B1 54%  interrupts.CPU1.RES:Rescheduling_interrupts
      0.33 =C2=B1141%    -100.0%       0.00          +110.0%       0.70 =C2=
=B1111%  interrupts.CPU1.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU10.129:PCI-MSI.31981662-edge.i40e-eth0-TxRx-93
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU10.293:PCI-MSI.327680-edge.xhci_hcd
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU10.299:PCI-MSI.71680-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU10.3:IO-APIC.3-edge
      1.00 =C2=B1223%    +166.7%       2.67 =C2=B1207%      +0.0%       1.0=
0 =C2=B1204%  interrupts.CPU10.46:PCI-MSI.31981579-edge.i40e-eth0-TxRx-10
      0.00          -100.0%       0.00         +2e+101%       0.20 =C2=B120=
0%  interrupts.CPU10.81:PCI-MSI.31981614-edge.i40e-eth0-TxRx-45
      3726 =C2=B1 83%     -11.9%       3281 =C2=B1 90%    +153.2%       943=
5 =C2=B1 90%  interrupts.CPU10.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.3e+102%       1.30 =C2=B1 4=
9%  interrupts.CPU10.IWI:IRQ_work_interrupts
     60388           -97.7%       1391 =C2=B1 51%    +111.5%     127750    =
    interrupts.CPU10.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU10.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7129 =C2=B1 1=
5%  interrupts.CPU10.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7129 =C2=B1 1=
5%  interrupts.CPU10.PMI:Performance_monitoring_interrupts
    470192 =C2=B1 77%     -96.8%      15256 =C2=B1133%     +42.3%     66885=
4 =C2=B1 85%  interrupts.CPU10.RES:Rescheduling_interrupts
      1.33 =C2=B1223%    -100.0%       0.00           -32.5%       0.90 =C2=
=B1 77%  interrupts.CPU10.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU11.298:PCI-MSI.69632-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU11.299:PCI-MSI.71680-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU11.300:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU11.301:PCI-MSI.75776-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU11.302:PCI-MSI.77824-edge.ioat-msix
      7.67 =C2=B1223%     -84.8%       1.17 =C2=B1187%    +176.5%      21.2=
0 =C2=B1290%  interrupts.CPU11.47:PCI-MSI.31981580-edge.i40e-eth0-TxRx-11
      0.00       +3.3e+101%       0.33 =C2=B1141%   +1e+101%       0.10 =C2=
=B1300%  interrupts.CPU11.82:PCI-MSI.31981615-edge.i40e-eth0-TxRx-46
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU11.8:IO-APIC.8-edge.rtc0
      9134 =C2=B1 55%     -45.6%       4965 =C2=B1 86%     -38.9%       558=
1 =C2=B1104%  interrupts.CPU11.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.2e+102%       1.20 =C2=B1 5=
0%  interrupts.CPU11.IWI:IRQ_work_interrupts
     60412           -98.5%     898.17 =C2=B1 35%    +111.4%     127713    =
    interrupts.CPU11.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU11.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.8e+105%       6753 =C2=B1 2=
2%  interrupts.CPU11.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.8e+105%       6753 =C2=B1 2=
2%  interrupts.CPU11.PMI:Performance_monitoring_interrupts
   1035474 =C2=B1108%     -97.0%      31216 =C2=B1167%     -51.2%     50505=
5 =C2=B1102%  interrupts.CPU11.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          +500.0%       1.00 =C2=
=B1 63%  interrupts.CPU11.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU12.299:PCI-MSI.71680-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU12.300:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU12.301:PCI-MSI.75776-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU12.302:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU12.303:PCI-MSI.79872-edge.ioat-msix
      0.17 =C2=B1223%  +10300.0%      17.33 =C2=B1223%   +5900.0%      10.0=
0 =C2=B1241%  interrupts.CPU12.48:PCI-MSI.31981581-edge.i40e-eth0-TxRx-12
      0.00       +1.7e+101%       0.17 =C2=B1223%   +1e+101%       0.10 =C2=
=B1300%  interrupts.CPU12.83:PCI-MSI.31981616-edge.i40e-eth0-TxRx-47
     12601 =C2=B1198%     -39.9%       7573 =C2=B1 53%     -22.7%       974=
6 =C2=B1162%  interrupts.CPU12.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.4e+102%       1.40 =C2=B1 4=
7%  interrupts.CPU12.IWI:IRQ_work_interrupts
     60272           -98.4%     954.17 =C2=B1 30%    +112.0%     127792    =
    interrupts.CPU12.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU12.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7129 =C2=B1 1=
5%  interrupts.CPU12.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7129 =C2=B1 1=
5%  interrupts.CPU12.PMI:Performance_monitoring_interrupts
    455627 =C2=B1107%     -95.5%      20374 =C2=B1 84%     +38.7%     63190=
8 =C2=B1 99%  interrupts.CPU12.RES:Rescheduling_interrupts
      0.00       +1.7e+101%       0.17 =C2=B1223% +1.3e+102%       1.30 =C2=
=B1 69%  interrupts.CPU12.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU13.300:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU13.301:PCI-MSI.75776-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU13.302:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU13.303:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU13.303:PCI-MSI.79872-edge.ioat-msix
     84.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU13.315:PCI-MSI.376832-edge.ahci[0000:00:17.0]
      0.33 =C2=B1141%    -100.0%       0.00           -40.0%       0.20 =C2=
=B1200%  interrupts.CPU13.36:PCI-MSI.31981569-edge.i40e-eth0-TxRx-0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU13.3:IO-APIC.3-edge
      2.00 =C2=B1223%    -100.0%       0.00         +1580.0%      33.60 =C2=
=B1300%  interrupts.CPU13.49:PCI-MSI.31981582-edge.i40e-eth0-TxRx-13
      0.17 =C2=B1223%    -100.0%       0.00           +20.0%       0.20 =C2=
=B1200%  interrupts.CPU13.84:PCI-MSI.31981617-edge.i40e-eth0-TxRx-48
     12768 =C2=B1 72%     -44.4%       7099 =C2=B1134%     -60.0%       510=
2 =C2=B1110%  interrupts.CPU13.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.3e+102%       1.30 =C2=B1 4=
9%  interrupts.CPU13.IWI:IRQ_work_interrupts
     60286           -98.9%     667.33 =C2=B1 45%    +111.8%     127686    =
    interrupts.CPU13.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU13.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7127 =C2=B1 1=
5%  interrupts.CPU13.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7127 =C2=B1 1=
5%  interrupts.CPU13.PMI:Performance_monitoring_interrupts
    638087 =C2=B1103%     -97.3%      16919 =C2=B1147%     -43.9%     35797=
0 =C2=B1121%  interrupts.CPU13.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          +440.0%       0.90 =C2=
=B1 92%  interrupts.CPU13.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU14.301:PCI-MSI.75776-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU14.302:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU14.303:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU14.304:PCI-MSI.79872-edge.ioat-msix
      0.00       +1.6e+103%      16.00 =C2=B1223%    -100.0%       0.00    =
    interrupts.CPU14.315:PCI-MSI.376832-edge.ahci[0000:00:17.0]
      0.17 =C2=B1223%    +100.0%       0.33 =C2=B1141%     +80.0%       0.3=
0 =C2=B1152%  interrupts.CPU14.37:PCI-MSI.31981570-edge.i40e-eth0-TxRx-1
    699.83 =C2=B1197%     -99.8%       1.67 =C2=B1223%     -99.6%       2.6=
0 =C2=B1300%  interrupts.CPU14.50:PCI-MSI.31981583-edge.i40e-eth0-TxRx-14
      0.00       +1.7e+101%       0.17 =C2=B1223%   +1e+101%       0.10 =C2=
=B1300%  interrupts.CPU14.85:PCI-MSI.31981618-edge.i40e-eth0-TxRx-49
      5627 =C2=B1153%     -71.0%       1633 =C2=B1101%     -35.1%       364=
9 =C2=B1122%  interrupts.CPU14.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.1e+102%       1.10 =C2=B1 4=
8%  interrupts.CPU14.IWI:IRQ_work_interrupts
     60263           -98.0%       1185 =C2=B1 55%    +112.0%     127735    =
    interrupts.CPU14.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU14.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7128 =C2=B1 1=
5%  interrupts.CPU14.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7128 =C2=B1 1=
5%  interrupts.CPU14.PMI:Performance_monitoring_interrupts
    238973 =C2=B1 84%     -93.2%      16299 =C2=B1117%    +163.3%     62919=
2 =C2=B1123%  interrupts.CPU14.RES:Rescheduling_interrupts
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%    +560.0%       1.1=
0 =C2=B1 75%  interrupts.CPU14.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU15.301:PCI-MSI.75776-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU15.302:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU15.303:PCI-MSI.79872-edge.ioat-msix
      0.00       +1.6e+103%      16.00 =C2=B1223%    -100.0%       0.00    =
    interrupts.CPU15.315:PCI-MSI.376832-edge.ahci[0000:00:17.0]
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU15.38:PCI-MSI.31981571-edge.i40e-eth0-TxRx-2
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU15.3:IO-APIC.3-edge
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU15.4:IO-APIC.4-edge.ttyS0
     25.00 =C2=B1211%     -89.3%       2.67 =C2=B1147%     -98.4%       0.4=
0 =C2=B1165%  interrupts.CPU15.51:PCI-MSI.31981584-edge.i40e-eth0-TxRx-15
      0.33 =C2=B1141%     -50.0%       0.17 =C2=B1223%    -100.0%       0.0=
0        interrupts.CPU15.86:PCI-MSI.31981619-edge.i40e-eth0-TxRx-50
      6750 =C2=B1142%     -57.4%       2876 =C2=B1112%     -63.5%       246=
1 =C2=B1 94%  interrupts.CPU15.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.2e+102%       1.20 =C2=B1 6=
2%  interrupts.CPU15.IWI:IRQ_work_interrupts
     60287           -98.3%       1040 =C2=B1 40%    +111.8%     127706    =
    interrupts.CPU15.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU15.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.8e+105%       6751 =C2=B1 2=
2%  interrupts.CPU15.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.8e+105%       6751 =C2=B1 2=
2%  interrupts.CPU15.PMI:Performance_monitoring_interrupts
    456818 =C2=B1 98%     -94.0%      27605 =C2=B1168%     -29.5%     32205=
9 =C2=B1118%  interrupts.CPU15.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          +560.0%       1.10 =C2=
=B1 63%  interrupts.CPU15.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU16.302:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU16.303:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU16.303:PCI-MSI.79872-edge.ioat-msix
     85.67 =C2=B1223%    -100.0%       0.00           -41.5%      50.10 =C2=
=B1299%  interrupts.CPU16.315:PCI-MSI.376832-edge.ahci[0000:00:17.0]
      0.00       +1.7e+101%       0.17 =C2=B1223%   +2e+101%       0.20 =C2=
=B1200%  interrupts.CPU16.39:PCI-MSI.31981572-edge.i40e-eth0-TxRx-3
      1.50 =C2=B1223%     -44.4%       0.83 =C2=B1128%     +93.3%       2.9=
0 =C2=B1201%  interrupts.CPU16.52:PCI-MSI.31981585-edge.i40e-eth0-TxRx-16
      0.00          -100.0%       0.00         +2e+101%       0.20 =C2=B120=
0%  interrupts.CPU16.87:PCI-MSI.31981620-edge.i40e-eth0-TxRx-51
      1750 =C2=B1101%    +153.6%       4438 =C2=B1 76%    +342.1%       773=
6 =C2=B1166%  interrupts.CPU16.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.1e+102%       1.10 =C2=B1 6=
3%  interrupts.CPU16.IWI:IRQ_work_interrupts
     60339           -98.7%     796.50 =C2=B1 39%    +111.6%     127695    =
    interrupts.CPU16.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU16.MCP:Machine_check_polls
      0.00          -100.0%       0.00         +6e+105%       6001 =C2=B1 3=
0%  interrupts.CPU16.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00         +6e+105%       6001 =C2=B1 3=
0%  interrupts.CPU16.PMI:Performance_monitoring_interrupts
    151816 =C2=B1151%     -95.6%       6694 =C2=B1 94%    +320.4%     63829=
0 =C2=B1120%  interrupts.CPU16.RES:Rescheduling_interrupts
      0.33 =C2=B1141%     -50.0%       0.17 =C2=B1223%    +290.0%       1.3=
0 =C2=B1 60%  interrupts.CPU16.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU17.303:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU17.304:PCI-MSI.79872-edge.ioat-msix
      0.00       +3.2e+103%      32.00 =C2=B1141% +1.5e+104%     151.70 =C2=
=B1152%  interrupts.CPU17.315:PCI-MSI.376832-edge.ahci[0000:00:17.0]
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%     +20.0%       0.2=
0 =C2=B1200%  interrupts.CPU17.40:PCI-MSI.31981573-edge.i40e-eth0-TxRx-4
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU17.4:IO-APIC.4-edge.ttyS0
     18.17 =C2=B1216%     -37.6%      11.33 =C2=B1223%     -96.7%       0.6=
0 =C2=B1300%  interrupts.CPU17.53:PCI-MSI.31981586-edge.i40e-eth0-TxRx-17
      0.00       +3.3e+101%       0.33 =C2=B1141%   +2e+101%       0.20 =C2=
=B1200%  interrupts.CPU17.88:PCI-MSI.31981621-edge.i40e-eth0-TxRx-52
      2649 =C2=B1105%    +177.1%       7342 =C2=B1146%      -6.6%       247=
4 =C2=B1 60%  interrupts.CPU17.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.1e+102%       1.10 =C2=B1 4=
8%  interrupts.CPU17.IWI:IRQ_work_interrupts
     60240           -98.6%     817.00 =C2=B1 44%    +111.9%     127677    =
    interrupts.CPU17.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU17.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.8e+105%       6750 =C2=B1 2=
2%  interrupts.CPU17.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.8e+105%       6750 =C2=B1 2=
2%  interrupts.CPU17.PMI:Performance_monitoring_interrupts
    201857 =C2=B1149%     -92.9%      14342 =C2=B1165%     +76.0%     35530=
9 =C2=B1 92%  interrupts.CPU17.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          +620.0%       1.20 =C2=
=B1 62%  interrupts.CPU17.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU18.295:PCI-MSI.65536-edge.ioat-msix
    212.83 =C2=B1145%     -85.0%      32.00 =C2=B1141%     +47.8%     314.6=
0 =C2=B1 81%  interrupts.CPU18.315:PCI-MSI.376832-edge.ahci[0000:00:17.0]
      0.17 =C2=B1223%    -100.0%       0.00           +20.0%       0.20 =C2=
=B1200%  interrupts.CPU18.41:PCI-MSI.31981574-edge.i40e-eth0-TxRx-5
      6.83 =C2=B1146%     -73.2%       1.83 =C2=B1200%     -97.1%       0.2=
0 =C2=B1200%  interrupts.CPU18.54:PCI-MSI.31981587-edge.i40e-eth0-TxRx-18
      0.17 =C2=B1223%    +100.0%       0.33 =C2=B1141%     -40.0%       0.1=
0 =C2=B1300%  interrupts.CPU18.89:PCI-MSI.31981622-edge.i40e-eth0-TxRx-53
     18249 =C2=B1174%     -78.7%       3895 =C2=B1 92%     -68.6%       572=
5 =C2=B1123%  interrupts.CPU18.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.1e+102%       1.10 =C2=B1 4=
8%  interrupts.CPU18.IWI:IRQ_work_interrupts
     60211           -98.7%     801.00 =C2=B1 29%    +112.1%     127707    =
    interrupts.CPU18.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU18.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.4e+105%       6374 =C2=B1 2=
6%  interrupts.CPU18.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.4e+105%       6374 =C2=B1 2=
6%  interrupts.CPU18.PMI:Performance_monitoring_interrupts
    389931 =C2=B1 90%     -97.7%       8846 =C2=B1133%     +47.1%     57375=
2 =C2=B1 92%  interrupts.CPU18.RES:Rescheduling_interrupts
      0.33 =C2=B1141%    -100.0%       0.00          +290.0%       1.30 =C2=
=B1 60%  interrupts.CPU18.TLB:TLB_shootdowns
    169.83 =C2=B1141%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU19.315:PCI-MSI.376832-edge.ahci[0000:00:17.0]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU19.3:IO-APIC.3-edge
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%     +20.0%       0.2=
0 =C2=B1200%  interrupts.CPU19.42:PCI-MSI.31981575-edge.i40e-eth0-TxRx-6
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU19.4:IO-APIC.4-edge.ttyS0
      0.00       +1.7e+101%       0.17 =C2=B1223%   +5e+104%     495.60 =C2=
=B1292%  interrupts.CPU19.55:PCI-MSI.31981588-edge.i40e-eth0-TxRx-19
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%     -40.0%       0.1=
0 =C2=B1300%  interrupts.CPU19.90:PCI-MSI.31981623-edge.i40e-eth0-TxRx-54
      3214 =C2=B1 66%      +3.4%       3324 =C2=B1 89%    +104.1%       656=
1 =C2=B1118%  interrupts.CPU19.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.1e+102%       1.10 =C2=B1 4=
8%  interrupts.CPU19.IWI:IRQ_work_interrupts
     60283           -98.1%       1164 =C2=B1 75%    +111.9%     127715    =
    interrupts.CPU19.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU19.MCP:Machine_check_polls
      0.00       +1.7e+101%       0.17 =C2=B1223% +7.1e+105%       7127 =C2=
=B1 15%  interrupts.CPU19.NMI:Non-maskable_interrupts
      0.00       +1.7e+101%       0.17 =C2=B1223% +7.1e+105%       7127 =C2=
=B1 15%  interrupts.CPU19.PMI:Performance_monitoring_interrupts
    315114 =C2=B1 71%     -86.2%      43617 =C2=B1192%     +72.1%     54235=
8 =C2=B1104%  interrupts.CPU19.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          +560.0%       1.10 =C2=
=B1 63%  interrupts.CPU19.TLB:TLB_shootdowns
      0.17 =C2=B1223%    -100.0%       0.00           -40.0%       0.10 =C2=
=B1300%  interrupts.CPU2.121:PCI-MSI.31981654-edge.i40e-eth0-TxRx-85
     39.83 =C2=B1223%     -37.2%      25.00 =C2=B1223%    -100.0%       0.0=
0        interrupts.CPU2.38:PCI-MSI.31981571-edge.i40e-eth0-TxRx-2
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%     -40.0%       0.1=
0 =C2=B1300%  interrupts.CPU2.73:PCI-MSI.31981606-edge.i40e-eth0-TxRx-37
     10401 =C2=B1 88%     -58.7%       4300 =C2=B1121%    +125.1%      2341=
1 =C2=B1 74%  interrupts.CPU2.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.2e+102%       1.20 =C2=B1 5=
0%  interrupts.CPU2.IWI:IRQ_work_interrupts
     60512           -97.1%       1745 =C2=B1 66%    +111.1%     127761    =
    interrupts.CPU2.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU2.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7127 =C2=B1 1=
5%  interrupts.CPU2.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7127 =C2=B1 1=
5%  interrupts.CPU2.PMI:Performance_monitoring_interrupts
    473515 =C2=B1 61%     -99.3%       3508 =C2=B1142%    +120.1%    104221=
2 =C2=B1 49%  interrupts.CPU2.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          +560.0%       1.10 =C2=
=B1 94%  interrupts.CPU2.TLB:TLB_shootdowns
      0.00       +1.7e+101%       0.17 =C2=B1223%   +1e+101%       0.10 =C2=
=B1300%  interrupts.CPU20.43:PCI-MSI.31981576-edge.i40e-eth0-TxRx-7
     20.67 =C2=B1141%     -80.6%       4.00 =C2=B1223%     -43.4%      11.7=
0 =C2=B1187%  interrupts.CPU20.56:PCI-MSI.31981589-edge.i40e-eth0-TxRx-20
      0.33 =C2=B1141%    -100.0%       0.00           -40.0%       0.20 =C2=
=B1200%  interrupts.CPU20.91:PCI-MSI.31981624-edge.i40e-eth0-TxRx-55
      3460 =C2=B1 79%     -62.1%       1312 =C2=B1135%    +133.3%       807=
2 =C2=B1110%  interrupts.CPU20.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.1e+102%       1.10 =C2=B1 6=
3%  interrupts.CPU20.IWI:IRQ_work_interrupts
     60323           -97.7%       1397 =C2=B1 59%    +111.7%     127683    =
    interrupts.CPU20.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU20.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.8e+105%       6750 =C2=B1 2=
2%  interrupts.CPU20.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.8e+105%       6750 =C2=B1 2=
2%  interrupts.CPU20.PMI:Performance_monitoring_interrupts
    291369 =C2=B1117%     -98.8%       3589 =C2=B1221%     +71.4%     49954=
0 =C2=B1 86%  interrupts.CPU20.RES:Rescheduling_interrupts
      0.33 =C2=B1223%     -50.0%       0.17 =C2=B1223%    +170.0%       0.9=
0 =C2=B1 92%  interrupts.CPU20.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU21.3:IO-APIC.3-edge
      0.00       +3.3e+101%       0.33 =C2=B1141%   +1e+101%       0.10 =C2=
=B1300%  interrupts.CPU21.44:PCI-MSI.31981577-edge.i40e-eth0-TxRx-8
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU21.4:IO-APIC.4-edge.ttyS0
      0.00         +9e+102%       9.00 =C2=B1223% +3.9e+103%      39.00 =C2=
=B1289%  interrupts.CPU21.57:PCI-MSI.31981590-edge.i40e-eth0-TxRx-21
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%    -100.0%       0.0=
0        interrupts.CPU21.92:PCI-MSI.31981625-edge.i40e-eth0-TxRx-56
      1620 =C2=B1138%     +44.5%       2341 =C2=B1101%    +188.2%       467=
0 =C2=B1113%  interrupts.CPU21.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.1e+102%       1.10 =C2=B1 6=
3%  interrupts.CPU21.IWI:IRQ_work_interrupts
     60239           -97.6%       1461 =C2=B1 51%    +112.0%     127729    =
    interrupts.CPU21.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU21.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.8e+105%       6751 =C2=B1 2=
2%  interrupts.CPU21.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.8e+105%       6751 =C2=B1 2=
2%  interrupts.CPU21.PMI:Performance_monitoring_interrupts
    172556 =C2=B1 87%     -96.5%       6014 =C2=B1120%     +32.1%     22790=
2 =C2=B1 87%  interrupts.CPU21.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          +500.0%       1.00 =C2=
=B1 63%  interrupts.CPU21.TLB:TLB_shootdowns
      0.17 =C2=B1223%    +200.0%       0.50 =C2=B1100%     +80.0%       0.3=
0 =C2=B1152%  interrupts.CPU22.45:PCI-MSI.31981578-edge.i40e-eth0-TxRx-9
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU22.4:IO-APIC.4-edge.ttyS0
      1.00 =C2=B1223%  +28816.7%     289.17 =C2=B1223%   +2060.0%      21.6=
0 =C2=B1209%  interrupts.CPU22.58:PCI-MSI.31981591-edge.i40e-eth0-TxRx-22
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU22.93:PCI-MSI.31981626-edge.i40e-eth0-TxRx-57
      2371 =C2=B1 88%     +74.0%       4125 =C2=B1126%    +282.8%       907=
5 =C2=B1125%  interrupts.CPU22.CAL:Function_call_interrupts
      0.00          -100.0%       0.00         +1e+102%       1.00 =C2=B1 4=
4%  interrupts.CPU22.IWI:IRQ_work_interrupts
     60199           -95.4%       2756 =C2=B1151%    +112.2%     127733    =
    interrupts.CPU22.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU22.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.4e+105%       6375 =C2=B1 2=
7%  interrupts.CPU22.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.4e+105%       6375 =C2=B1 2=
7%  interrupts.CPU22.PMI:Performance_monitoring_interrupts
    188482 =C2=B1116%     -95.5%       8570 =C2=B1141%     +82.3%     34358=
9 =C2=B1117%  interrupts.CPU22.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          +500.0%       1.00 =C2=
=B1 77%  interrupts.CPU22.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU23.3:IO-APIC.3-edge
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%    -100.0%       0.0=
0        interrupts.CPU23.46:PCI-MSI.31981579-edge.i40e-eth0-TxRx-10
      0.17 =C2=B1223%   +1000.0%       1.83 =C2=B1200%    +320.0%       0.7=
0 =C2=B1255%  interrupts.CPU23.59:PCI-MSI.31981592-edge.i40e-eth0-TxRx-23
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%     +80.0%       0.3=
0 =C2=B1152%  interrupts.CPU23.94:PCI-MSI.31981627-edge.i40e-eth0-TxRx-58
      7996 =C2=B1178%     -30.9%       5525 =C2=B1 90%     -23.9%       608=
4 =C2=B1109%  interrupts.CPU23.CAL:Function_call_interrupts
      0.00          -100.0%       0.00         +1e+102%       1.00 =C2=B1 4=
4%  interrupts.CPU23.IWI:IRQ_work_interrupts
     60308           -97.6%       1464 =C2=B1 64%    +111.7%     127673    =
    interrupts.CPU23.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU23.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.7e+105%       6748 =C2=B1 2=
2%  interrupts.CPU23.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.7e+105%       6748 =C2=B1 2=
2%  interrupts.CPU23.PMI:Performance_monitoring_interrupts
    395904 =C2=B1192%     -92.2%      30749 =C2=B1136%      +4.5%     41378=
7 =C2=B1 96%  interrupts.CPU23.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    +700.0%       1.33 =C2=B1223%    +500.0%       1.0=
0 =C2=B1 77%  interrupts.CPU23.TLB:TLB_shootdowns
     69.50 =C2=B1213%     -96.9%       2.17 =C2=B1 17%     -95.4%       3.2=
0 =C2=B1 92%  interrupts.CPU24.60:PCI-MSI.31981593-edge.i40e-eth0-TxRx-24
     12156 =C2=B1 62%     -79.9%       2445 =C2=B1151%     +36.1%      1654=
6 =C2=B1 67%  interrupts.CPU24.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.8e+102%       1.80 =C2=B1 3=
3%  interrupts.CPU24.IWI:IRQ_work_interrupts
     60178           -98.5%     897.00 =C2=B1 49%    +112.2%     127699    =
    interrupts.CPU24.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU24.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.7e+105%       6672 =C2=B1 2=
6%  interrupts.CPU24.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.7e+105%       6672 =C2=B1 2=
6%  interrupts.CPU24.PMI:Performance_monitoring_interrupts
    482812 =C2=B1 45%     -99.7%       1387 =C2=B1150%     -13.6%     41696=
0 =C2=B1 73%  interrupts.CPU24.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          +560.0%       1.10 =C2=
=B1 63%  interrupts.CPU24.TLB:TLB_shootdowns
      0.50 =C2=B1152%    +733.3%       4.17 =C2=B1223%   +2360.0%      12.3=
0 =C2=B1208%  interrupts.CPU25.61:PCI-MSI.31981594-edge.i40e-eth0-TxRx-25
     10461 =C2=B1109%     -74.3%       2691 =C2=B1139%     +13.5%      1187=
3 =C2=B1 69%  interrupts.CPU25.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +2.1e+102%       2.10 =C2=B1 4=
9%  interrupts.CPU25.IWI:IRQ_work_interrupts
     60179           -98.3%       1011 =C2=B1 76%    +112.3%     127736    =
    interrupts.CPU25.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU25.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.7e+105%       6679 =C2=B1 2=
6%  interrupts.CPU25.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.7e+105%       6679 =C2=B1 2=
6%  interrupts.CPU25.PMI:Performance_monitoring_interrupts
    292815 =C2=B1 81%     -98.3%       5028 =C2=B1159%    +100.2%     58628=
9 =C2=B1 64%  interrupts.CPU25.RES:Rescheduling_interrupts
      0.33 =C2=B1141%    -100.0%       0.00          +290.0%       1.30 =C2=
=B1 60%  interrupts.CPU25.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU26.305:PCI-MSI.67174400-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU26.306:PCI-MSI.67174400-edge.ioat-msix
     54.50 =C2=B1223%     -97.2%       1.50 =C2=B1223%     -96.5%       1.9=
0 =C2=B1300%  interrupts.CPU26.62:PCI-MSI.31981595-edge.i40e-eth0-TxRx-26
      8098 =C2=B1 85%     -60.9%       3163 =C2=B1 79%     +27.4%      1031=
4 =C2=B1108%  interrupts.CPU26.CAL:Function_call_interrupts
      0.00          -100.0%       0.00         +2e+102%       2.00 =C2=B1 3=
1%  interrupts.CPU26.IWI:IRQ_work_interrupts
     60335           -98.9%     648.50 =C2=B1 25%    +111.7%     127718    =
    interrupts.CPU26.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU26.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7067 =C2=B1 2=
2%  interrupts.CPU26.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7067 =C2=B1 2=
2%  interrupts.CPU26.PMI:Performance_monitoring_interrupts
    199173 =C2=B1 64%     -96.2%       7584 =C2=B1124%     +72.2%     34291=
3 =C2=B1 57%  interrupts.CPU26.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          +500.0%       1.00 =C2=
=B1 77%  interrupts.CPU26.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU27.307:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU27.308:PCI-MSI.67176448-edge.ioat-msix
      0.67 =C2=B1223%    +225.0%       2.17 =C2=B1136%   +1415.0%      10.1=
0 =C2=B1256%  interrupts.CPU27.63:PCI-MSI.31981596-edge.i40e-eth0-TxRx-27
      9303 =C2=B1102%     -85.4%       1354 =C2=B1 77%     +14.1%      1061=
1 =C2=B1 78%  interrupts.CPU27.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.7e+102%       1.70 =C2=B1 2=
6%  interrupts.CPU27.IWI:IRQ_work_interrupts
     60219           -98.1%       1140 =C2=B1139%    +112.0%     127682    =
    interrupts.CPU27.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU27.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.7e+105%       6669 =C2=B1 2=
6%  interrupts.CPU27.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.7e+105%       6669 =C2=B1 2=
6%  interrupts.CPU27.PMI:Performance_monitoring_interrupts
    493009 =C2=B1 92%     -99.7%       1286 =C2=B1134%     -10.8%     44000=
0 =C2=B1127%  interrupts.CPU27.RES:Rescheduling_interrupts
      0.33 =C2=B1141%    +300.0%       1.33 =C2=B1223%    +200.0%       1.0=
0 =C2=B1 63%  interrupts.CPU27.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU28.307:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU28.308:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU28.308:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU28.309:PCI-MSI.67178496-edge.ioat-msix
      0.00       +1.7e+101%       0.17 =C2=B1223%   +2e+101%       0.20 =C2=
=B1300%  interrupts.CPU28.64:PCI-MSI.31981597-edge.i40e-eth0-TxRx-28
      3543 =C2=B1 78%     +86.5%       6609 =C2=B1130%    +152.9%       896=
3 =C2=B1137%  interrupts.CPU28.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.8e+102%       1.80 =C2=B1 2=
2%  interrupts.CPU28.IWI:IRQ_work_interrupts
     60184           -98.5%     892.83 =C2=B1 84%    +112.2%     127681    =
    interrupts.CPU28.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU28.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.7e+105%       6672 =C2=B1 2=
6%  interrupts.CPU28.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.7e+105%       6672 =C2=B1 2=
6%  interrupts.CPU28.PMI:Performance_monitoring_interrupts
    469018 =C2=B1105%     -97.5%      11551 =C2=B1139%     -28.1%     33734=
9 =C2=B1 82%  interrupts.CPU28.RES:Rescheduling_interrupts
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%    +500.0%       1.0=
0 =C2=B1 77%  interrupts.CPU28.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU29.308:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU29.309:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU29.309:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU29.310:PCI-MSI.67180544-edge.ioat-msix
      0.17 =C2=B1223%    +700.0%       1.33 =C2=B1165%  +12740.0%      21.4=
0 =C2=B1281%  interrupts.CPU29.65:PCI-MSI.31981598-edge.i40e-eth0-TxRx-29
      3686 =C2=B1 65%     -29.9%       2582 =C2=B1 92%    +189.7%      1068=
0 =C2=B1124%  interrupts.CPU29.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.8e+102%       1.80 =C2=B1 3=
3%  interrupts.CPU29.IWI:IRQ_work_interrupts
     60142           -98.9%     668.83 =C2=B1 36%    +112.3%     127705    =
    interrupts.CPU29.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU29.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.7e+105%       6672 =C2=B1 2=
6%  interrupts.CPU29.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.7e+105%       6672 =C2=B1 2=
6%  interrupts.CPU29.PMI:Performance_monitoring_interrupts
    281133 =C2=B1 62%     -97.4%       7412 =C2=B1138%     -29.8%     19745=
4 =C2=B1 93%  interrupts.CPU29.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          +440.0%       0.90 =C2=
=B1 77%  interrupts.CPU29.TLB:TLB_shootdowns
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%     +20.0%       0.2=
0 =C2=B1200%  interrupts.CPU3.122:PCI-MSI.31981655-edge.i40e-eth0-TxRx-86
      0.00       +3.3e+102%       3.33 =C2=B1223% +6.1e+103%      60.70 =C2=
=B1282%  interrupts.CPU3.39:PCI-MSI.31981572-edge.i40e-eth0-TxRx-3
      0.00       +3.3e+101%       0.33 =C2=B1141%   +2e+101%       0.20 =C2=
=B1200%  interrupts.CPU3.74:PCI-MSI.31981607-edge.i40e-eth0-TxRx-38
      6606 =C2=B1 75%     -48.7%       3389 =C2=B1 84%    +261.9%      2390=
8 =C2=B1 87%  interrupts.CPU3.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.4e+102%       1.40 =C2=B1 3=
4%  interrupts.CPU3.IWI:IRQ_work_interrupts
     60410           -98.0%       1205 =C2=B1 61%    +111.4%     127734    =
    interrupts.CPU3.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU3.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.5e+105%       7503        i=
nterrupts.CPU3.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.5e+105%       7503        i=
nterrupts.CPU3.PMI:Performance_monitoring_interrupts
    285041 =C2=B1 86%     -91.4%      24381 =C2=B1136%     +99.3%     56809=
1 =C2=B1 77%  interrupts.CPU3.RES:Rescheduling_interrupts
      1.33 =C2=B1223%     -87.5%       0.17 =C2=B1223%     +42.5%       1.9=
0 =C2=B1131%  interrupts.CPU3.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU30.309:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU30.310:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU30.310:PCI-MSI.67182592-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU30.311:PCI-MSI.67182592-edge.ioat-msix
      0.33 =C2=B1223%    -100.0%       0.00          +470.0%       1.90 =C2=
=B1188%  interrupts.CPU30.66:PCI-MSI.31981599-edge.i40e-eth0-TxRx-30
      7356 =C2=B1 76%     -52.1%       3520 =C2=B1121%     -31.9%       500=
7 =C2=B1108%  interrupts.CPU30.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.7e+102%       1.70 =C2=B1 2=
6%  interrupts.CPU30.IWI:IRQ_work_interrupts
     60180           -98.8%     716.00 =C2=B1 41%    +112.2%     127681    =
    interrupts.CPU30.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU30.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.7e+105%       6669 =C2=B1 2=
6%  interrupts.CPU30.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.7e+105%       6669 =C2=B1 2=
6%  interrupts.CPU30.PMI:Performance_monitoring_interrupts
    537090 =C2=B1 70%     -99.4%       3478 =C2=B1162%     -52.9%     25292=
1 =C2=B1120%  interrupts.CPU30.RES:Rescheduling_interrupts
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%    +440.0%       0.9=
0 =C2=B1 77%  interrupts.CPU30.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU31.310:PCI-MSI.67182592-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU31.311:PCI-MSI.67182592-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU31.311:PCI-MSI.67184640-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU31.312:PCI-MSI.67184640-edge.ioat-msix
      0.00       +2.1e+104%     209.33 =C2=B1223% +1.9e+103%      19.10 =C2=
=B1298%  interrupts.CPU31.67:PCI-MSI.31981600-edge.i40e-eth0-TxRx-31
      8608 =C2=B1 75%     -37.2%       5407 =C2=B1159%     -45.2%       472=
0 =C2=B1107%  interrupts.CPU31.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.9e+102%       1.90 =C2=B1 1=
5%  interrupts.CPU31.IWI:IRQ_work_interrupts
     60152           -95.5%       2725 =C2=B1154%    +112.4%     127758    =
    interrupts.CPU31.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU31.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7063 =C2=B1 2=
2%  interrupts.CPU31.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7063 =C2=B1 2=
2%  interrupts.CPU31.PMI:Performance_monitoring_interrupts
    513819 =C2=B1 70%     -98.8%       6234 =C2=B1156%     -59.6%     20749=
7 =C2=B1139%  interrupts.CPU31.RES:Rescheduling_interrupts
      0.00       +1.7e+101%       0.17 =C2=B1223% +1.2e+102%       1.20 =C2=
=B1 50%  interrupts.CPU31.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU32.311:PCI-MSI.67184640-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU32.312:PCI-MSI.67184640-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU32.312:PCI-MSI.67186688-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU32.313:PCI-MSI.67186688-edge.ioat-msix
      1.83 =C2=B1223%    -100.0%       0.00           -45.5%       1.00 =C2=
=B1236%  interrupts.CPU32.68:PCI-MSI.31981601-edge.i40e-eth0-TxRx-32
      6924 =C2=B1 87%     -39.1%       4215 =C2=B1103%     -52.8%       327=
0 =C2=B1106%  interrupts.CPU32.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.7e+102%       1.70 =C2=B1 2=
6%  interrupts.CPU32.IWI:IRQ_work_interrupts
     60133           -98.3%       1016 =C2=B1 58%    +112.3%     127666    =
    interrupts.CPU32.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU32.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.7e+105%       6669 =C2=B1 2=
6%  interrupts.CPU32.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.7e+105%       6669 =C2=B1 2=
6%  interrupts.CPU32.PMI:Performance_monitoring_interrupts
    385091 =C2=B1 91%     -97.6%       9348 =C2=B1134%     -32.8%     25896=
0 =C2=B1 87%  interrupts.CPU32.RES:Rescheduling_interrupts
      0.00          -100.0%       0.00         +9e+101%       0.90 =C2=B1 7=
7%  interrupts.CPU32.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU33.312:PCI-MSI.67186688-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU33.313:PCI-MSI.67186688-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU33.313:PCI-MSI.67188736-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU33.314:PCI-MSI.67188736-edge.ioat-msix
     12.17 =C2=B1216%     -98.6%       0.17 =C2=B1223%     -74.5%       3.1=
0 =C2=B1227%  interrupts.CPU33.69:PCI-MSI.31981602-edge.i40e-eth0-TxRx-33
    998.83 =C2=B1 54%    +752.7%       8516 =C2=B1126%    +208.1%       307=
7 =C2=B1 81%  interrupts.CPU33.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.8e+102%       1.80 =C2=B1 2=
2%  interrupts.CPU33.IWI:IRQ_work_interrupts
     60238           -98.4%     967.33 =C2=B1 98%    +112.1%     127739    =
    interrupts.CPU33.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU33.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7062 =C2=B1 2=
2%  interrupts.CPU33.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7062 =C2=B1 2=
2%  interrupts.CPU33.PMI:Performance_monitoring_interrupts
    131516 =C2=B1 89%     -93.4%       8686 =C2=B1139%     +12.5%     14792=
5 =C2=B1 86%  interrupts.CPU33.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          +500.0%       1.00 =C2=
=B1 89%  interrupts.CPU33.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU34.313:PCI-MSI.67188736-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU34.314:PCI-MSI.67188736-edge.ioat-msix
      1.67 =C2=B1223%     -80.0%       0.33 =C2=B1141%     +86.0%       3.1=
0 =C2=B1205%  interrupts.CPU34.70:PCI-MSI.31981603-edge.i40e-eth0-TxRx-34
      4822 =C2=B1109%     +64.4%       7926 =C2=B1 96%      +0.3%       483=
5 =C2=B1115%  interrupts.CPU34.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.9e+102%       1.90 =C2=B1 4=
3%  interrupts.CPU34.IWI:IRQ_work_interrupts
     60126           -98.6%     830.50 =C2=B1 29%    +112.4%     127708    =
    interrupts.CPU34.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU34.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.7e+105%       6674 =C2=B1 2=
6%  interrupts.CPU34.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.7e+105%       6674 =C2=B1 2=
6%  interrupts.CPU34.PMI:Performance_monitoring_interrupts
    429677 =C2=B1154%     -98.4%       6925 =C2=B1141%     -16.5%     35893=
9 =C2=B1 81%  interrupts.CPU34.RES:Rescheduling_interrupts
      0.00          -100.0%       0.00       +1.1e+102%       1.10 =C2=B1 4=
8%  interrupts.CPU34.TLB:TLB_shootdowns
      3530 =C2=B1223%    -100.0%       0.17 =C2=B1223%     -99.9%       3.3=
0 =C2=B1253%  interrupts.CPU35.71:PCI-MSI.31981604-edge.i40e-eth0-TxRx-35
      1690 =C2=B1 73%    +147.5%       4184 =C2=B1125%    +128.8%       386=
7 =C2=B1140%  interrupts.CPU35.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.6e+102%       1.60 =C2=B1 3=
0%  interrupts.CPU35.IWI:IRQ_work_interrupts
     60234           -99.1%     518.17 =C2=B1 42%    +112.0%     127688    =
    interrupts.CPU35.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU35.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.3e+105%       6277 =C2=B1 3=
0%  interrupts.CPU35.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.3e+105%       6277 =C2=B1 3=
0%  interrupts.CPU35.PMI:Performance_monitoring_interrupts
    371287 =C2=B1 96%     -98.5%       5682 =C2=B1149%     -51.3%     18099=
0 =C2=B1 88%  interrupts.CPU35.RES:Rescheduling_interrupts
      0.00       +1.7e+101%       0.17 =C2=B1223% +1.2e+102%       1.20 =C2=
=B1 62%  interrupts.CPU35.TLB:TLB_shootdowns
      0.17 =C2=B1223%   +8000.0%      13.50 =C2=B1162%  +16460.0%      27.6=
0 =C2=B1261%  interrupts.CPU36.72:PCI-MSI.31981605-edge.i40e-eth0-TxRx-36
      2224 =C2=B1 90%    +148.0%       5517 =C2=B1125%     +39.8%       311=
0 =C2=B1109%  interrupts.CPU36.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.7e+102%       1.70 =C2=B1 3=
7%  interrupts.CPU36.IWI:IRQ_work_interrupts
     60188           -99.0%     602.17 =C2=B1 60%    +112.1%     127670    =
    interrupts.CPU36.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU36.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.3e+105%       6279 =C2=B1 3=
0%  interrupts.CPU36.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.3e+105%       6279 =C2=B1 3=
0%  interrupts.CPU36.PMI:Performance_monitoring_interrupts
    388845 =C2=B1119%     -97.9%       8081 =C2=B1165%     -65.2%     13519=
3 =C2=B1 86%  interrupts.CPU36.RES:Rescheduling_interrupts
      0.00          -100.0%       0.00       +1.1e+102%       1.10 =C2=B1 4=
8%  interrupts.CPU36.TLB:TLB_shootdowns
      7.67 =C2=B1139%    -100.0%       0.00           -19.1%       6.20 =C2=
=B1166%  interrupts.CPU37.73:PCI-MSI.31981606-edge.i40e-eth0-TxRx-37
      5491 =C2=B1 67%     -42.9%       3135 =C2=B1118%     -10.0%       494=
3 =C2=B1159%  interrupts.CPU37.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.7e+102%       1.70 =C2=B1 2=
6%  interrupts.CPU37.IWI:IRQ_work_interrupts
     60201           -98.2%       1077 =C2=B1 62%    +112.1%     127696    =
    interrupts.CPU37.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU37.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.7e+105%       6670 =C2=B1 2=
6%  interrupts.CPU37.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.7e+105%       6670 =C2=B1 2=
6%  interrupts.CPU37.PMI:Performance_monitoring_interrupts
    307663 =C2=B1124%     -98.8%       3727 =C2=B1155%     -62.7%     11471=
7 =C2=B1137%  interrupts.CPU37.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          +620.0%       1.20 =C2=
=B1 50%  interrupts.CPU37.TLB:TLB_shootdowns
      1.67 =C2=B1223%     -60.0%       0.67 =C2=B1165%   +2516.0%      43.6=
0 =C2=B1288%  interrupts.CPU38.74:PCI-MSI.31981607-edge.i40e-eth0-TxRx-38
      3704 =C2=B1124%     -74.6%     939.33 =C2=B1 92%     +36.0%       503=
7 =C2=B1151%  interrupts.CPU38.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.8e+102%       1.80 =C2=B1 2=
2%  interrupts.CPU38.IWI:IRQ_work_interrupts
     60182           -98.6%     851.17 =C2=B1 83%    +112.2%     127720    =
    interrupts.CPU38.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU38.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7063 =C2=B1 2=
2%  interrupts.CPU38.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7063 =C2=B1 2=
2%  interrupts.CPU38.PMI:Performance_monitoring_interrupts
    451487 =C2=B1108%     -99.9%     399.17 =C2=B1177%     -58.0%     18965=
6 =C2=B1 83%  interrupts.CPU38.RES:Rescheduling_interrupts
      0.33 =C2=B1141%    -100.0%       0.00          +230.0%       1.10 =C2=
=B1 48%  interrupts.CPU38.TLB:TLB_shootdowns
     61.33 =C2=B1205%    -100.0%       0.00           -95.9%       2.50 =C2=
=B1215%  interrupts.CPU39.75:PCI-MSI.31981608-edge.i40e-eth0-TxRx-39
      5826 =C2=B1157%     -86.0%     816.00 =C2=B1 79%     -45.2%       319=
4 =C2=B1115%  interrupts.CPU39.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.8e+102%       1.80 =C2=B1 2=
2%  interrupts.CPU39.IWI:IRQ_work_interrupts
     60283           -98.5%     930.50 =C2=B1 59%    +111.8%     127686    =
    interrupts.CPU39.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU39.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7062 =C2=B1 2=
2%  interrupts.CPU39.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7062 =C2=B1 2=
2%  interrupts.CPU39.PMI:Performance_monitoring_interrupts
    617036 =C2=B1139%     -99.7%       1594 =C2=B1216%     -72.9%     16725=
5 =C2=B1 98%  interrupts.CPU39.RES:Rescheduling_interrupts
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%    +620.0%       1.2=
0 =C2=B1 50%  interrupts.CPU39.TLB:TLB_shootdowns
      0.00          -100.0%       0.00         +3e+101%       0.30 =C2=B115=
2%  interrupts.CPU4.123:PCI-MSI.31981656-edge.i40e-eth0-TxRx-87
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU4.298:PCI-MSI.69632-edge.ioat-msix
     58.17 =C2=B1222%    -100.0%       0.00           +43.2%      83.30 =C2=
=B1163%  interrupts.CPU4.40:PCI-MSI.31981573-edge.i40e-eth0-TxRx-4
      0.33 =C2=B1141%     -50.0%       0.17 =C2=B1223%     -70.0%       0.1=
0 =C2=B1300%  interrupts.CPU4.75:PCI-MSI.31981608-edge.i40e-eth0-TxRx-39
     21333 =C2=B1 92%     -65.6%       7339 =C2=B1 49%     -24.5%      1610=
3 =C2=B1122%  interrupts.CPU4.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.2e+102%       1.20 =C2=B1 3=
3%  interrupts.CPU4.IWI:IRQ_work_interrupts
     60682           -97.4%       1562 =C2=B1 62%    +110.5%     127741    =
    interrupts.CPU4.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU4.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7127 =C2=B1 1=
5%  interrupts.CPU4.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7127 =C2=B1 1=
5%  interrupts.CPU4.PMI:Performance_monitoring_interrupts
   1208419 =C2=B1 78%     -98.0%      23662 =C2=B1 79%     -40.9%     71473=
3 =C2=B1105%  interrupts.CPU4.RES:Rescheduling_interrupts
      0.00          -100.0%       0.00       +1.9e+102%       1.90 =C2=B111=
6%  interrupts.CPU4.TLB:TLB_shootdowns
      4.33 =C2=B1223%    -100.0%       0.00          +779.2%      38.10 =C2=
=B1276%  interrupts.CPU40.76:PCI-MSI.31981609-edge.i40e-eth0-TxRx-40
      3750 =C2=B1102%    +131.1%       8667 =C2=B1 78%     -39.7%       226=
1 =C2=B1 65%  interrupts.CPU40.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.8e+102%       1.80 =C2=B1 2=
2%  interrupts.CPU40.IWI:IRQ_work_interrupts
     60247           -98.6%     873.00 =C2=B1 38%    +111.9%     127670    =
    interrupts.CPU40.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU40.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7061 =C2=B1 2=
2%  interrupts.CPU40.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7061 =C2=B1 2=
2%  interrupts.CPU40.PMI:Performance_monitoring_interrupts
    504612 =C2=B1 87%     -97.1%      14691 =C2=B1148%     -34.8%     32881=
4 =C2=B1110%  interrupts.CPU40.RES:Rescheduling_interrupts
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%    +620.0%       1.2=
0 =C2=B1 50%  interrupts.CPU40.TLB:TLB_shootdowns
      1.50 =C2=B1223%     -77.8%       0.33 =C2=B1141%    -100.0%       0.0=
0        interrupts.CPU41.77:PCI-MSI.31981610-edge.i40e-eth0-TxRx-41
      3767 =C2=B1 90%     -16.0%       3166 =C2=B1182%     -15.4%       318=
8 =C2=B1 89%  interrupts.CPU41.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.9e+102%       1.90 =C2=B1 2=
8%  interrupts.CPU41.IWI:IRQ_work_interrupts
     60189           -98.9%     679.83 =C2=B1 77%    +112.2%     127720    =
    interrupts.CPU41.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU41.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7063 =C2=B1 2=
2%  interrupts.CPU41.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7063 =C2=B1 2=
2%  interrupts.CPU41.PMI:Performance_monitoring_interrupts
    221441 =C2=B1118%     -96.2%       8401 =C2=B1220%      -0.6%     22011=
9 =C2=B1154%  interrupts.CPU41.RES:Rescheduling_interrupts
      0.33 =C2=B1141%    -100.0%       0.00          +320.0%       1.40 =C2=
=B1 57%  interrupts.CPU41.TLB:TLB_shootdowns
      0.00       +2.3e+102%       2.33 =C2=B1223%    -100.0%       0.00    =
    interrupts.CPU42.78:PCI-MSI.31981611-edge.i40e-eth0-TxRx-42
      1585 =C2=B1 57%    +381.9%       7638 =C2=B1 99%    +103.3%       322=
2 =C2=B1 95%  interrupts.CPU42.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.8e+102%       1.80 =C2=B1 2=
2%  interrupts.CPU42.IWI:IRQ_work_interrupts
     60120           -98.9%     689.83 =C2=B1 32%    +112.3%     127652    =
    interrupts.CPU42.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU42.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7061 =C2=B1 2=
2%  interrupts.CPU42.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7061 =C2=B1 2=
2%  interrupts.CPU42.PMI:Performance_monitoring_interrupts
    453029 =C2=B1115%     -95.6%      20117 =C2=B1162%     -43.4%     25656=
7 =C2=B1 84%  interrupts.CPU42.RES:Rescheduling_interrupts
      0.33 =C2=B1141%    -100.0%       0.00          +230.0%       1.10 =C2=
=B1 48%  interrupts.CPU42.TLB:TLB_shootdowns
      2.17 =C2=B1 41%   +9607.7%     210.33 =C2=B1221%     +15.4%       2.5=
0 =C2=B1128%  interrupts.CPU43.79:PCI-MSI.31981612-edge.i40e-eth0-TxRx-43
      6036 =C2=B1121%     -39.2%       3669 =C2=B1103%     -75.8%       146=
3 =C2=B1 76%  interrupts.CPU43.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.9e+102%       1.90 =C2=B1 1=
5%  interrupts.CPU43.IWI:IRQ_work_interrupts
     60176           -98.7%     777.83 =C2=B1 78%    +112.2%     127707    =
    interrupts.CPU43.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU43.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7064 =C2=B1 2=
2%  interrupts.CPU43.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7064 =C2=B1 2=
2%  interrupts.CPU43.PMI:Performance_monitoring_interrupts
    384869 =C2=B1102%     -99.1%       3568 =C2=B1116%     -64.2%     13773=
3 =C2=B1200%  interrupts.CPU43.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    +100.0%       0.33 =C2=B1141%    +680.0%       1.3=
0 =C2=B1 49%  interrupts.CPU43.TLB:TLB_shootdowns
      0.17 =C2=B1223%  +3.7e+05%     623.50 =C2=B1223%   +5180.0%       8.8=
0 =C2=B1231%  interrupts.CPU44.80:PCI-MSI.31981613-edge.i40e-eth0-TxRx-44
      3373 =C2=B1 78%     +81.8%       6133 =C2=B1141%     -38.4%       207=
8 =C2=B1 82%  interrupts.CPU44.CAL:Function_call_interrupts
      0.00          -100.0%       0.00         +2e+102%       2.00        i=
nterrupts.CPU44.IWI:IRQ_work_interrupts
     60121           -97.7%       1371 =C2=B1103%    +112.4%     127720    =
    interrupts.CPU44.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU44.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.8e+105%       7848        i=
nterrupts.CPU44.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.8e+105%       7848        i=
nterrupts.CPU44.PMI:Performance_monitoring_interrupts
    348448 =C2=B1 69%     -96.4%      12641 =C2=B1145%     -45.9%     18858=
9 =C2=B1128%  interrupts.CPU44.RES:Rescheduling_interrupts
      0.33 =C2=B1141%     +50.0%       0.50 =C2=B1100%    +290.0%       1.3=
0 =C2=B1 60%  interrupts.CPU44.TLB:TLB_shootdowns
      0.00          -100.0%       0.00         +4e+101%       0.40 =C2=B120=
0%  interrupts.CPU45.81:PCI-MSI.31981614-edge.i40e-eth0-TxRx-45
      2046 =C2=B1166%     -13.5%       1770 =C2=B1124%     +29.5%       264=
9 =C2=B1 75%  interrupts.CPU45.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +2.1e+102%       2.10 =C2=B1 1=
4%  interrupts.CPU45.IWI:IRQ_work_interrupts
     60203           -98.5%     905.17 =C2=B1 76%    +112.2%     127729    =
    interrupts.CPU45.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU45.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.5e+105%       7459 =C2=B1 1=
5%  interrupts.CPU45.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.5e+105%       7459 =C2=B1 1=
5%  interrupts.CPU45.PMI:Performance_monitoring_interrupts
    241934 =C2=B1112%     -99.3%       1802 =C2=B1139%     +34.7%     32596=
1 =C2=B1 77%  interrupts.CPU45.RES:Rescheduling_interrupts
      0.67 =C2=B1 70%     -50.0%       0.33 =C2=B1141%    +155.0%       1.7=
0 =C2=B1 45%  interrupts.CPU45.TLB:TLB_shootdowns
      0.00       +1.7e+102%       1.67 =C2=B1223%   +3e+101%       0.30 =C2=
=B1300%  interrupts.CPU46.82:PCI-MSI.31981615-edge.i40e-eth0-TxRx-46
      1101 =C2=B1 83%    +455.1%       6115 =C2=B1101%    +431.0%       584=
9 =C2=B1 79%  interrupts.CPU46.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +2.1e+102%       2.10 =C2=B1 1=
4%  interrupts.CPU46.IWI:IRQ_work_interrupts
     60150           -98.6%     819.17 =C2=B1103%    +112.3%     127715    =
    interrupts.CPU46.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU46.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.8e+105%       7850        i=
nterrupts.CPU46.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.8e+105%       7850        i=
nterrupts.CPU46.PMI:Performance_monitoring_interrupts
    186289 =C2=B1140%     -97.1%       5492 =C2=B1109%    +104.1%     38022=
0 =C2=B1 71%  interrupts.CPU46.RES:Rescheduling_interrupts
      0.67 =C2=B1 70%     -25.0%       0.50 =C2=B1100%    +275.0%       2.5=
0 =C2=B1 91%  interrupts.CPU46.TLB:TLB_shootdowns
      0.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU47.83:PCI-MSI.31981616-edge.i40e-eth0-TxRx-47
      5280 =C2=B1 84%      +0.4%       5300 =C2=B1101%     -32.5%       356=
1 =C2=B1 71%  interrupts.CPU47.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.9e+102%       1.90 =C2=B1 2=
8%  interrupts.CPU47.IWI:IRQ_work_interrupts
     60201           -98.9%     671.00 =C2=B1 16%    +112.1%     127692    =
    interrupts.CPU47.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU47.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7063 =C2=B1 2=
2%  interrupts.CPU47.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7063 =C2=B1 2=
2%  interrupts.CPU47.PMI:Performance_monitoring_interrupts
    362342 =C2=B1 70%     -97.8%       8136 =C2=B1 91%     +18.4%     42886=
8 =C2=B1 67%  interrupts.CPU47.RES:Rescheduling_interrupts
      0.67 =C2=B1 70%     -50.0%       0.33 =C2=B1141%    +170.0%       1.8=
0 =C2=B1 33%  interrupts.CPU47.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU48.295:PCI-MSI.65536-edge.ioat-msix
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%     -40.0%       0.1=
0 =C2=B1300%  interrupts.CPU48.47:PCI-MSI.31981580-edge.i40e-eth0-TxRx-11
    107.33 =C2=B1223%     -98.9%       1.17 =C2=B1187%     -99.4%       0.6=
0 =C2=B1300%  interrupts.CPU48.84:PCI-MSI.31981617-edge.i40e-eth0-TxRx-48
      0.00       +1.7e+101%       0.17 =C2=B1223%   +2e+101%       0.20 =C2=
=B1200%  interrupts.CPU48.95:PCI-MSI.31981628-edge.i40e-eth0-TxRx-59
     72094 =C2=B1 72%     -91.9%       5820 =C2=B1 96%     -24.9%      5416=
5 =C2=B1 75%  interrupts.CPU48.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.4e+102%       1.40 =C2=B1 3=
4%  interrupts.CPU48.IWI:IRQ_work_interrupts
     60657           -98.1%       1172 =C2=B1 22%    +110.5%     127709    =
    interrupts.CPU48.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU48.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7113 =C2=B1 1=
5%  interrupts.CPU48.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7113 =C2=B1 1=
5%  interrupts.CPU48.PMI:Performance_monitoring_interrupts
   1480231 =C2=B1 26%     -99.2%      11850 =C2=B1 99%     -32.3%    100139=
7 =C2=B1 50%  interrupts.CPU48.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    -100.0%       0.00         +1220.0%       2.20 =C2=
=B1109%  interrupts.CPU48.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU49.3:IO-APIC.3-edge
      0.17 =C2=B1223%    -100.0%       0.00          +140.0%       0.40 =C2=
=B1122%  interrupts.CPU49.48:PCI-MSI.31981581-edge.i40e-eth0-TxRx-12
      0.00          -100.0%       0.00       +1.7e+103%      16.70 =C2=B120=
1%  interrupts.CPU49.85:PCI-MSI.31981618-edge.i40e-eth0-TxRx-49
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%     -40.0%       0.1=
0 =C2=B1300%  interrupts.CPU49.96:PCI-MSI.31981629-edge.i40e-eth0-TxRx-60
     22343 =C2=B1 64%     -81.3%       4181 =C2=B1113%     +44.7%      3234=
0 =C2=B1 97%  interrupts.CPU49.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.3e+102%       1.30 =C2=B1 6=
0%  interrupts.CPU49.IWI:IRQ_work_interrupts
     60283           -98.1%       1139 =C2=B1 48%    +112.0%     127776    =
    interrupts.CPU49.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU49.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.7e+105%       6740 =C2=B1 2=
2%  interrupts.CPU49.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.7e+105%       6740 =C2=B1 2=
2%  interrupts.CPU49.PMI:Performance_monitoring_interrupts
    972258 =C2=B1 71%     -96.7%      32533 =C2=B1136%      -4.8%     92539=
3 =C2=B1 30%  interrupts.CPU49.RES:Rescheduling_interrupts
      0.00          -100.0%       0.00       +1.5e+102%       1.50 =C2=B1 4=
4%  interrupts.CPU49.TLB:TLB_shootdowns
      0.17 =C2=B1223%    -100.0%       0.00           -40.0%       0.10 =C2=
=B1300%  interrupts.CPU5.124:PCI-MSI.31981657-edge.i40e-eth0-TxRx-88
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU5.297:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU5.298:PCI-MSI.69632-edge.ioat-msix
     20.67 =C2=B1161%   +3202.4%     682.50 =C2=B1223%    +469.0%     117.6=
0 =C2=B1298%  interrupts.CPU5.41:PCI-MSI.31981574-edge.i40e-eth0-TxRx-5
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%     +20.0%       0.2=
0 =C2=B1200%  interrupts.CPU5.76:PCI-MSI.31981609-edge.i40e-eth0-TxRx-40
     11749 =C2=B1108%     -55.4%       5240 =C2=B1110%     +57.7%      1852=
7 =C2=B1108%  interrupts.CPU5.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.2e+102%       1.20 =C2=B1 6=
2%  interrupts.CPU5.IWI:IRQ_work_interrupts
     60301           -89.0%       6626 =C2=B1173%    +111.9%     127755    =
    interrupts.CPU5.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU5.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.4e+105%       6380 =C2=B1 2=
7%  interrupts.CPU5.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.4e+105%       6380 =C2=B1 2=
7%  interrupts.CPU5.PMI:Performance_monitoring_interrupts
    499333 =C2=B1105%     -95.9%      20683 =C2=B1132%     +27.2%     63506=
6 =C2=B1 95%  interrupts.CPU5.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          +620.0%       1.20 =C2=
=B1 50%  interrupts.CPU5.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU50.295:PCI-MSI.65536-edge.ioat-msix
      0.00       +1.7e+101%       0.17 =C2=B1223%   +1e+101%       0.10 =C2=
=B1300%  interrupts.CPU50.49:PCI-MSI.31981582-edge.i40e-eth0-TxRx-13
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU50.4:IO-APIC.4-edge.ttyS0
      1.83 =C2=B1223%     -18.2%       1.50 =C2=B1223%     -72.7%       0.5=
0 =C2=B1300%  interrupts.CPU50.86:PCI-MSI.31981619-edge.i40e-eth0-TxRx-50
      0.17 =C2=B1223%    -100.0%       0.00           +20.0%       0.20 =C2=
=B1200%  interrupts.CPU50.97:PCI-MSI.31981630-edge.i40e-eth0-TxRx-61
     12828 =C2=B1129%     -44.7%       7094 =C2=B1128%     +97.4%      2532=
2 =C2=B1 86%  interrupts.CPU50.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.5e+102%       1.50 =C2=B1 3=
3%  interrupts.CPU50.IWI:IRQ_work_interrupts
     60301           -97.9%       1247 =C2=B1 42%    +111.8%     127725    =
    interrupts.CPU50.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU50.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7115 =C2=B1 1=
5%  interrupts.CPU50.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7115 =C2=B1 1=
5%  interrupts.CPU50.PMI:Performance_monitoring_interrupts
    594153 =C2=B1 76%     -95.2%      28647 =C2=B1110%     +13.7%     67577=
3 =C2=B1 52%  interrupts.CPU50.RES:Rescheduling_interrupts
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%    +800.0%       1.5=
0 =C2=B1 53%  interrupts.CPU50.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU51.295:PCI-MSI.65536-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU51.4:IO-APIC.4-edge.ttyS0
      0.00       +1.7e+101%       0.17 =C2=B1223%   +2e+101%       0.20 =C2=
=B1200%  interrupts.CPU51.50:PCI-MSI.31981583-edge.i40e-eth0-TxRx-14
      2.00 =C2=B1202%    +566.7%      13.33 =C2=B1223%    +605.0%      14.1=
0 =C2=B1290%  interrupts.CPU51.87:PCI-MSI.31981620-edge.i40e-eth0-TxRx-51
      0.33 =C2=B1141%     +50.0%       0.50 =C2=B1100%    -100.0%       0.0=
0        interrupts.CPU51.98:PCI-MSI.31981631-edge.i40e-eth0-TxRx-62
      6959 =C2=B1 82%      -0.4%       6930 =C2=B1 87%     +90.3%      1324=
3 =C2=B1108%  interrupts.CPU51.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.1e+102%       1.10 =C2=B1 2=
7%  interrupts.CPU51.IWI:IRQ_work_interrupts
     60363           -98.2%       1103 =C2=B1 49%    +111.6%     127752    =
    interrupts.CPU51.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU51.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7116 =C2=B1 1=
5%  interrupts.CPU51.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7116 =C2=B1 1=
5%  interrupts.CPU51.PMI:Performance_monitoring_interrupts
    565296 =C2=B1120%     -94.9%      28596 =C2=B1110%      +8.0%     61031=
2 =C2=B1 90%  interrupts.CPU51.RES:Rescheduling_interrupts
      1.33 =C2=B1223%     -87.5%       0.17 =C2=B1223%     +35.0%       1.8=
0 =C2=B1 48%  interrupts.CPU51.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU52.295:PCI-MSI.65536-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU52.3:IO-APIC.3-edge
      0.33 =C2=B1141%    -100.0%       0.00           +20.0%       0.40 =C2=
=B1122%  interrupts.CPU52.51:PCI-MSI.31981584-edge.i40e-eth0-TxRx-15
      0.00       +4.8e+103%      47.83 =C2=B1212% +1.9e+102%       1.90 =C2=
=B1200%  interrupts.CPU52.88:PCI-MSI.31981621-edge.i40e-eth0-TxRx-52
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%     -40.0%       0.1=
0 =C2=B1300%  interrupts.CPU52.99:PCI-MSI.31981632-edge.i40e-eth0-TxRx-63
     20767 =C2=B1 97%     -73.0%       5603 =C2=B1 74%     -16.7%      1730=
0 =C2=B1130%  interrupts.CPU52.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.3e+102%       1.30 =C2=B1 4=
9%  interrupts.CPU52.IWI:IRQ_work_interrupts
     60334           -97.4%       1567 =C2=B1 66%    +111.8%     127761    =
    interrupts.CPU52.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU52.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.7e+105%       6741 =C2=B1 2=
2%  interrupts.CPU52.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.7e+105%       6741 =C2=B1 2=
2%  interrupts.CPU52.PMI:Performance_monitoring_interrupts
    907891 =C2=B1 77%     -98.4%      14749 =C2=B1109%      -8.4%     83131=
2 =C2=B1 87%  interrupts.CPU52.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          +740.0%       1.40 =C2=
=B1 34%  interrupts.CPU52.TLB:TLB_shootdowns
      0.50 =C2=B1100%     -33.3%       0.33 =C2=B1141%     -80.0%       0.1=
0 =C2=B1300%  interrupts.CPU53.100:PCI-MSI.31981633-edge.i40e-eth0-TxRx-64
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU53.3:IO-APIC.3-edge
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU53.4:IO-APIC.4-edge.ttyS0
      0.33 =C2=B1141%      +0.0%       0.33 =C2=B1141%     -40.0%       0.2=
0 =C2=B1200%  interrupts.CPU53.52:PCI-MSI.31981585-edge.i40e-eth0-TxRx-16
      0.33 =C2=B1223%    +700.0%       2.67 =C2=B1223%    -100.0%       0.0=
0        interrupts.CPU53.89:PCI-MSI.31981622-edge.i40e-eth0-TxRx-53
      7554 =C2=B1135%     -64.0%       2716 =C2=B1108%    +160.3%      1966=
0 =C2=B1116%  interrupts.CPU53.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.2e+102%       1.20 =C2=B1 6=
2%  interrupts.CPU53.IWI:IRQ_work_interrupts
     60300           -98.5%     881.83 =C2=B1 54%    +111.8%     127697    =
    interrupts.CPU53.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU53.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.4e+105%       6366 =C2=B1 2=
6%  interrupts.CPU53.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.4e+105%       6366 =C2=B1 2=
6%  interrupts.CPU53.PMI:Performance_monitoring_interrupts
    358259 =C2=B1153%     -80.8%      68715 =C2=B1184%    +134.5%     83999=
8 =C2=B1 87%  interrupts.CPU53.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          +860.0%       1.60 =C2=
=B1 41%  interrupts.CPU53.TLB:TLB_shootdowns
      0.50 =C2=B1100%    -100.0%       0.00           -60.0%       0.20 =C2=
=B1200%  interrupts.CPU54.101:PCI-MSI.31981634-edge.i40e-eth0-TxRx-65
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU54.3:IO-APIC.3-edge
      0.33 =C2=B1141%     -50.0%       0.17 =C2=B1223%     -70.0%       0.1=
0 =C2=B1300%  interrupts.CPU54.53:PCI-MSI.31981586-edge.i40e-eth0-TxRx-17
      0.67 =C2=B1165%    +500.0%       4.00 =C2=B1192%     -55.0%       0.3=
0 =C2=B1213%  interrupts.CPU54.90:PCI-MSI.31981623-edge.i40e-eth0-TxRx-54
      6216 =C2=B1 92%     -35.8%       3989 =C2=B1146%     -35.7%       399=
4 =C2=B1114%  interrupts.CPU54.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.1e+102%       1.10 =C2=B1 4=
8%  interrupts.CPU54.IWI:IRQ_work_interrupts
     60308           -97.9%       1262 =C2=B1 46%    +111.8%     127755    =
    interrupts.CPU54.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU54.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.4e+105%       6366 =C2=B1 2=
6%  interrupts.CPU54.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.4e+105%       6366 =C2=B1 2=
6%  interrupts.CPU54.PMI:Performance_monitoring_interrupts
    711419 =C2=B1 66%     -94.0%      42360 =C2=B1203%      -9.7%     64222=
2 =C2=B1 81%  interrupts.CPU54.RES:Rescheduling_interrupts
      0.00          -100.0%       0.00       +1.5e+102%       1.50 =C2=B1 3=
3%  interrupts.CPU54.TLB:TLB_shootdowns
      0.17 =C2=B1223%    -100.0%       0.00           -40.0%       0.10 =C2=
=B1300%  interrupts.CPU55.102:PCI-MSI.31981635-edge.i40e-eth0-TxRx-66
      0.17 =C2=B1223%    +100.0%       0.33 =C2=B1141%     -40.0%       0.1=
0 =C2=B1300%  interrupts.CPU55.54:PCI-MSI.31981587-edge.i40e-eth0-TxRx-18
      1.00 =C2=B1223%    +316.7%       4.17 =C2=B1223%     +20.0%       1.2=
0 =C2=B1249%  interrupts.CPU55.91:PCI-MSI.31981624-edge.i40e-eth0-TxRx-55
     10162 =C2=B1 95%     -52.8%       4798 =C2=B1126%     -21.8%       794=
9 =C2=B1112%  interrupts.CPU55.CAL:Function_call_interrupts
      0.00          -100.0%       0.00         +9e+101%       0.90 =C2=B1 3=
3%  interrupts.CPU55.IWI:IRQ_work_interrupts
     60320           -97.8%       1312 =C2=B1 37%    +111.8%     127764    =
    interrupts.CPU55.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU55.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.4e+105%       6367 =C2=B1 2=
6%  interrupts.CPU55.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.4e+105%       6367 =C2=B1 2=
6%  interrupts.CPU55.PMI:Performance_monitoring_interrupts
    417556 =C2=B1 89%     -94.1%      24502 =C2=B1172%     +39.1%     58083=
5 =C2=B1 93%  interrupts.CPU55.RES:Rescheduling_interrupts
      0.00       +3.3e+101%       0.33 =C2=B1141% +1.3e+102%       1.30 =C2=
=B1 35%  interrupts.CPU55.TLB:TLB_shootdowns
      0.17 =C2=B1223%    +100.0%       0.33 =C2=B1141%     -40.0%       0.1=
0 =C2=B1300%  interrupts.CPU56.103:PCI-MSI.31981636-edge.i40e-eth0-TxRx-67
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU56.299:PCI-MSI.71680-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU56.3:IO-APIC.3-edge
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%     -40.0%       0.1=
0 =C2=B1300%  interrupts.CPU56.55:PCI-MSI.31981588-edge.i40e-eth0-TxRx-19
      2.50 =C2=B1162%    -100.0%       0.00          +600.0%      17.50 =C2=
=B1198%  interrupts.CPU56.92:PCI-MSI.31981625-edge.i40e-eth0-TxRx-56
     12238 =C2=B1100%     -38.7%       7502 =C2=B1 79%      +8.5%      1328=
2 =C2=B1 86%  interrupts.CPU56.CAL:Function_call_interrupts
      0.00          -100.0%       0.00         +9e+101%       0.90 =C2=B1 5=
9%  interrupts.CPU56.IWI:IRQ_work_interrupts
     60296           -98.1%       1166 =C2=B1 55%    +111.8%     127717    =
    interrupts.CPU56.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU56.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.4e+105%       6367 =C2=B1 2=
6%  interrupts.CPU56.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.4e+105%       6367 =C2=B1 2=
6%  interrupts.CPU56.PMI:Performance_monitoring_interrupts
    304719 =C2=B1 92%     -94.7%      16036 =C2=B1 73%    +165.2%     80823=
5 =C2=B1 64%  interrupts.CPU56.RES:Rescheduling_interrupts
      0.00       +1.7e+101%       0.17 =C2=B1223% +1.4e+102%       1.40 =C2=
=B1 34%  interrupts.CPU56.TLB:TLB_shootdowns
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%     -40.0%       0.1=
0 =C2=B1300%  interrupts.CPU57.104:PCI-MSI.31981637-edge.i40e-eth0-TxRx-68
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU57.297:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU57.4:IO-APIC.4-edge.ttyS0
      0.17 =C2=B1223%    -100.0%       0.00           +80.0%       0.30 =C2=
=B1152%  interrupts.CPU57.56:PCI-MSI.31981589-edge.i40e-eth0-TxRx-20
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU57.93:PCI-MSI.31981626-edge.i40e-eth0-TxRx-57
      3434 =C2=B1114%     +21.6%       4177 =C2=B1 95%    +135.6%       809=
0 =C2=B1 66%  interrupts.CPU57.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.2e+102%       1.20 =C2=B1 6=
2%  interrupts.CPU57.IWI:IRQ_work_interrupts
     60249           -96.1%       2322 =C2=B1 65%    +112.0%     127757    =
    interrupts.CPU57.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU57.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.7e+105%       6744 =C2=B1 2=
2%  interrupts.CPU57.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.7e+105%       6744 =C2=B1 2=
2%  interrupts.CPU57.PMI:Performance_monitoring_interrupts
    412362 =C2=B1 70%     -96.4%      14970 =C2=B1125%     +81.7%     74920=
7 =C2=B1 84%  interrupts.CPU57.RES:Rescheduling_interrupts
      0.00       +1.7e+101%       0.17 =C2=B1223% +1.5e+102%       1.50 =C2=
=B1 44%  interrupts.CPU57.TLB:TLB_shootdowns
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%    -100.0%       0.0=
0        interrupts.CPU58.105:PCI-MSI.31981638-edge.i40e-eth0-TxRx-69
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU58.3:IO-APIC.3-edge
      0.17 =C2=B1223%    -100.0%       0.00           +20.0%       0.20 =C2=
=B1200%  interrupts.CPU58.57:PCI-MSI.31981590-edge.i40e-eth0-TxRx-21
      0.17 =C2=B1223%    -100.0%       0.00        +32420.0%      54.20 =C2=
=B1297%  interrupts.CPU58.94:PCI-MSI.31981627-edge.i40e-eth0-TxRx-58
      3941 =C2=B1126%     -33.0%       2641 =C2=B1124%    +240.8%      1343=
2 =C2=B1130%  interrupts.CPU58.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.2e+102%       1.20 =C2=B1 6=
2%  interrupts.CPU58.IWI:IRQ_work_interrupts
     60303           -97.5%       1494 =C2=B1 48%    +111.8%     127741    =
    interrupts.CPU58.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU58.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.7e+105%       6745 =C2=B1 2=
2%  interrupts.CPU58.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.7e+105%       6745 =C2=B1 2=
2%  interrupts.CPU58.PMI:Performance_monitoring_interrupts
    409161 =C2=B1106%     -99.1%       3873 =C2=B1138%     +53.2%     62689=
7 =C2=B1 84%  interrupts.CPU58.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          +860.0%       1.60 =C2=
=B1 41%  interrupts.CPU58.TLB:TLB_shootdowns
      0.33 =C2=B1141%    -100.0%       0.00           -40.0%       0.20 =C2=
=B1200%  interrupts.CPU59.106:PCI-MSI.31981639-edge.i40e-eth0-TxRx-70
      0.00       +1.7e+101%       0.17 =C2=B1223%   +2e+101%       0.20 =C2=
=B1200%  interrupts.CPU59.58:PCI-MSI.31981591-edge.i40e-eth0-TxRx-22
      0.00       +1.4e+106%      14483 =C2=B1223% +2.8e+102%       2.80 =C2=
=B1288%  interrupts.CPU59.95:PCI-MSI.31981628-edge.i40e-eth0-TxRx-59
      9523 =C2=B1 46%     -13.7%       8218 =C2=B1 75%      -9.4%       862=
8 =C2=B1 92%  interrupts.CPU59.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.2e+102%       1.20 =C2=B1 5=
0%  interrupts.CPU59.IWI:IRQ_work_interrupts
     60351           -83.9%       9746 =C2=B1180%    +111.7%     127764    =
    interrupts.CPU59.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU59.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7119 =C2=B1 1=
5%  interrupts.CPU59.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7119 =C2=B1 1=
5%  interrupts.CPU59.PMI:Performance_monitoring_interrupts
    553347 =C2=B1 86%     -97.4%      14470 =C2=B1 74%     +17.2%     64830=
2 =C2=B1 77%  interrupts.CPU59.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    +900.0%       1.67 =C2=B1175%    +620.0%       1.2=
0 =C2=B1 33%  interrupts.CPU59.TLB:TLB_shootdowns
      0.00          -100.0%       0.00         +2e+101%       0.20 =C2=B120=
0%  interrupts.CPU6.125:PCI-MSI.31981658-edge.i40e-eth0-TxRx-89
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU6.300:PCI-MSI.73728-edge.ioat-msix
     50.17 =C2=B1223%     -93.7%       3.17 =C2=B1184%     -96.0%       2.0=
0 =C2=B1203%  interrupts.CPU6.42:PCI-MSI.31981575-edge.i40e-eth0-TxRx-6
      0.17 =C2=B1223%    +100.0%       0.33 =C2=B1141%     +20.0%       0.2=
0 =C2=B1200%  interrupts.CPU6.77:PCI-MSI.31981610-edge.i40e-eth0-TxRx-41
      8584 =C2=B1 63%     -59.2%       3503 =C2=B1180%     -43.3%       486=
4 =C2=B1 70%  interrupts.CPU6.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.2e+102%       1.20 =C2=B1 5=
0%  interrupts.CPU6.IWI:IRQ_work_interrupts
     60471           -97.7%       1402 =C2=B1 61%    +111.2%     127741    =
    interrupts.CPU6.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU6.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.8e+105%       6753 =C2=B1 2=
2%  interrupts.CPU6.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.8e+105%       6753 =C2=B1 2=
2%  interrupts.CPU6.PMI:Performance_monitoring_interrupts
    728478 =C2=B1 39%     -99.3%       4794 =C2=B1188%      -4.9%     69301=
5 =C2=B1 64%  interrupts.CPU6.RES:Rescheduling_interrupts
      1.33 =C2=B1223%    -100.0%       0.00           -32.5%       0.90 =C2=
=B1 77%  interrupts.CPU6.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU60.107:PCI-MSI.31981640-edge.i40e-eth0-TxRx-71
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU60.295:PCI-MSI.65536-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU60.297:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU60.298:PCI-MSI.69632-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU60.3:IO-APIC.3-edge
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU60.4:IO-APIC.4-edge.ttyS0
      0.33 =C2=B1141%     -50.0%       0.17 =C2=B1223%     -40.0%       0.2=
0 =C2=B1200%  interrupts.CPU60.59:PCI-MSI.31981592-edge.i40e-eth0-TxRx-23
     19.17 =C2=B1223%   +3179.1%     628.50 =C2=B1223%     -99.5%       0.1=
0 =C2=B1300%  interrupts.CPU60.96:PCI-MSI.31981629-edge.i40e-eth0-TxRx-60
     18937 =C2=B1208%     -80.2%       3747 =C2=B1 90%     -62.1%       717=
8 =C2=B1108%  interrupts.CPU60.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.2e+102%       1.20 =C2=B1 5=
0%  interrupts.CPU60.IWI:IRQ_work_interrupts
     60352           -96.7%       1988 =C2=B1 84%    +111.7%     127790    =
    interrupts.CPU60.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU60.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.7e+105%       6744 =C2=B1 2=
2%  interrupts.CPU60.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.7e+105%       6744 =C2=B1 2=
2%  interrupts.CPU60.PMI:Performance_monitoring_interrupts
    472502 =C2=B1 89%     -97.9%       9851 =C2=B1112%     +18.6%     56045=
0 =C2=B1 91%  interrupts.CPU60.RES:Rescheduling_interrupts
      0.00          -100.0%       0.00       +2.2e+102%       2.20 =C2=B110=
7%  interrupts.CPU60.TLB:TLB_shootdowns
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%    -100.0%       0.0=
0        interrupts.CPU61.108:PCI-MSI.31981641-edge.i40e-eth0-TxRx-72
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU61.295:PCI-MSI.65536-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU61.297:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU61.298:PCI-MSI.69632-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU61.299:PCI-MSI.71680-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU61.3:IO-APIC.3-edge
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU61.60:PCI-MSI.31981593-edge.i40e-eth0-TxRx-24
      0.00          -100.0%       0.00       +5.6e+103%      56.30 =C2=B129=
9%  interrupts.CPU61.97:PCI-MSI.31981630-edge.i40e-eth0-TxRx-61
     11394 =C2=B1 94%     -86.6%       1522 =C2=B1 87%     -34.5%       745=
8 =C2=B1108%  interrupts.CPU61.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.2e+102%       1.20 =C2=B1 5=
0%  interrupts.CPU61.IWI:IRQ_work_interrupts
     60386           -98.2%       1089 =C2=B1 27%    +111.6%     127779    =
    interrupts.CPU61.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU61.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7118 =C2=B1 1=
5%  interrupts.CPU61.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7118 =C2=B1 1=
5%  interrupts.CPU61.PMI:Performance_monitoring_interrupts
    589897 =C2=B1 85%     -94.3%      33616 =C2=B1201%     -18.3%     48212=
4 =C2=B1112%  interrupts.CPU61.RES:Rescheduling_interrupts
      0.33 =C2=B1141%    -100.0%       0.00          +530.0%       2.10 =C2=
=B1126%  interrupts.CPU61.TLB:TLB_shootdowns
      0.00       +3.3e+101%       0.33 =C2=B1141%    -100.0%       0.00    =
    interrupts.CPU62.109:PCI-MSI.31981642-edge.i40e-eth0-TxRx-73
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU62.298:PCI-MSI.69632-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU62.299:PCI-MSI.71680-edge.ioat-msix
      0.17 =C2=B1223%    -100.0%       0.00           -40.0%       0.10 =C2=
=B1300%  interrupts.CPU62.61:PCI-MSI.31981594-edge.i40e-eth0-TxRx-25
     37.00 =C2=B1162%     -95.5%       1.67 =C2=B1223%    -100.0%       0.0=
0        interrupts.CPU62.98:PCI-MSI.31981631-edge.i40e-eth0-TxRx-62
     11003 =C2=B1150%     -94.1%     647.33 =C2=B1 30%     -54.8%       497=
5 =C2=B1160%  interrupts.CPU62.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.4e+102%       1.40 =C2=B1 3=
4%  interrupts.CPU62.IWI:IRQ_work_interrupts
     60323           -98.6%     817.67 =C2=B1 45%    +112.0%     127859    =
    interrupts.CPU62.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU62.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.5e+105%       7493        i=
nterrupts.CPU62.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.5e+105%       7493        i=
nterrupts.CPU62.PMI:Performance_monitoring_interrupts
    174644 =C2=B1177%     -99.8%     365.33 =C2=B1188%    +108.3%     36377=
3 =C2=B1122%  interrupts.CPU62.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          +800.0%       1.50 =C2=
=B1 44%  interrupts.CPU62.TLB:TLB_shootdowns
      0.00          -100.0%       0.00         +5e+101%       0.50 =C2=B110=
0%  interrupts.CPU63.110:PCI-MSI.31981643-edge.i40e-eth0-TxRx-74
      0.33 =C2=B1141%     -50.0%       0.17 =C2=B1223%    -100.0%       0.0=
0        interrupts.CPU63.62:PCI-MSI.31981595-edge.i40e-eth0-TxRx-26
     82.17 =C2=B1215%     -80.1%      16.33 =C2=B1178%    -100.0%       0.0=
0        interrupts.CPU63.99:PCI-MSI.31981632-edge.i40e-eth0-TxRx-63
     17034 =C2=B1167%     -66.9%       5639 =C2=B1 69%     -76.6%       399=
0 =C2=B1133%  interrupts.CPU63.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.3e+102%       1.30 =C2=B1 3=
5%  interrupts.CPU63.IWI:IRQ_work_interrupts
     60348           -97.9%       1240 =C2=B1 42%    +111.7%     127757    =
    interrupts.CPU63.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU63.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.5e+105%       7492        i=
nterrupts.CPU63.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.5e+105%       7492        i=
nterrupts.CPU63.PMI:Performance_monitoring_interrupts
    555092 =C2=B1 91%     -96.4%      20004 =C2=B1 70%     -21.1%     43806=
8 =C2=B1140%  interrupts.CPU63.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          +620.0%       1.20 =C2=
=B1 50%  interrupts.CPU63.TLB:TLB_shootdowns
      5.50 =C2=B1215%     -87.9%       0.67 =C2=B1223%     -76.4%       1.3=
0 =C2=B1275%  interrupts.CPU64.100:PCI-MSI.31981633-edge.i40e-eth0-TxRx-64
      0.33 =C2=B1141%    -100.0%       0.00           -40.0%       0.20 =C2=
=B1200%  interrupts.CPU64.111:PCI-MSI.31981644-edge.i40e-eth0-TxRx-75
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU64.297:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU64.300:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU64.3:IO-APIC.3-edge
      0.17 =C2=B1223%    +100.0%       0.33 =C2=B1141%     -40.0%       0.1=
0 =C2=B1300%  interrupts.CPU64.63:PCI-MSI.31981596-edge.i40e-eth0-TxRx-27
      2901 =C2=B1173%    +171.7%       7881 =C2=B1 44%     +41.7%       411=
2 =C2=B1 89%  interrupts.CPU64.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.3e+102%       1.30 =C2=B1 3=
5%  interrupts.CPU64.IWI:IRQ_work_interrupts
     60447           -98.2%       1069 =C2=B1 32%    +111.4%     127789    =
    interrupts.CPU64.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU64.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7117 =C2=B1 1=
5%  interrupts.CPU64.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7117 =C2=B1 1=
5%  interrupts.CPU64.PMI:Performance_monitoring_interrupts
    128532 =C2=B1107%     -74.9%      32309 =C2=B1 77%    +258.1%     46022=
4 =C2=B1119%  interrupts.CPU64.RES:Rescheduling_interrupts
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%    +740.0%       1.4=
0 =C2=B1 34%  interrupts.CPU64.TLB:TLB_shootdowns
      0.67 =C2=B1223%     -50.0%       0.33 =C2=B1223%     -85.0%       0.1=
0 =C2=B1300%  interrupts.CPU65.101:PCI-MSI.31981634-edge.i40e-eth0-TxRx-65
      0.17 =C2=B1223%    -100.0%       0.00           -40.0%       0.10 =C2=
=B1300%  interrupts.CPU65.112:PCI-MSI.31981645-edge.i40e-eth0-TxRx-76
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU65.298:PCI-MSI.69632-edge.ioat-msix
      0.00       +1.7e+101%       0.17 =C2=B1223%   +1e+101%       0.10 =C2=
=B1300%  interrupts.CPU65.64:PCI-MSI.31981597-edge.i40e-eth0-TxRx-28
      2696 =C2=B1 57%     +37.1%       3695 =C2=B1145%     +49.9%       404=
0 =C2=B1145%  interrupts.CPU65.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.1e+102%       1.10 =C2=B1 2=
7%  interrupts.CPU65.IWI:IRQ_work_interrupts
     60375           -97.3%       1611 =C2=B1 50%    +111.6%     127742    =
    interrupts.CPU65.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU65.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.5e+105%       7491        i=
nterrupts.CPU65.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.5e+105%       7491        i=
nterrupts.CPU65.PMI:Performance_monitoring_interrupts
    269531 =C2=B1116%     -95.1%      13162 =C2=B1207%     +56.3%     42127=
2 =C2=B1101%  interrupts.CPU65.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          +680.0%       1.30 =C2=
=B1 35%  interrupts.CPU65.TLB:TLB_shootdowns
      6.00 =C2=B1161%    +800.0%      54.00 =C2=B1223%    +473.3%      34.4=
0 =C2=B1218%  interrupts.CPU66.102:PCI-MSI.31981635-edge.i40e-eth0-TxRx-66
      0.00          -100.0%       0.00         +2e+101%       0.20 =C2=B120=
0%  interrupts.CPU66.113:PCI-MSI.31981646-edge.i40e-eth0-TxRx-77
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%    +140.0%       0.4=
0 =C2=B1122%  interrupts.CPU66.65:PCI-MSI.31981598-edge.i40e-eth0-TxRx-29
     18067 =C2=B1181%     -85.1%       2697 =C2=B1175%     -35.0%      1174=
1 =C2=B1188%  interrupts.CPU66.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.1e+102%       1.10 =C2=B1 4=
8%  interrupts.CPU66.IWI:IRQ_work_interrupts
     60396           -98.1%       1141 =C2=B1 47%    +111.5%     127760    =
    interrupts.CPU66.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU66.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.7e+105%       6741 =C2=B1 2=
2%  interrupts.CPU66.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.7e+105%       6741 =C2=B1 2=
2%  interrupts.CPU66.PMI:Performance_monitoring_interrupts
    372632 =C2=B1111%     -97.4%       9601 =C2=B1214%     +26.8%     47256=
8 =C2=B1122%  interrupts.CPU66.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          +860.0%       1.60 =C2=
=B1 41%  interrupts.CPU66.TLB:TLB_shootdowns
     25.33 =C2=B1223%     -94.7%       1.33 =C2=B1147%     -89.3%       2.7=
0 =C2=B1287%  interrupts.CPU67.103:PCI-MSI.31981636-edge.i40e-eth0-TxRx-67
      0.00       +1.7e+101%       0.17 =C2=B1223%   +2e+101%       0.20 =C2=
=B1200%  interrupts.CPU67.114:PCI-MSI.31981647-edge.i40e-eth0-TxRx-78
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU67.299:PCI-MSI.71680-edge.ioat-msix
      0.17 =C2=B1223%    -100.0%       0.00          +200.0%       0.50 =C2=
=B1100%  interrupts.CPU67.66:PCI-MSI.31981599-edge.i40e-eth0-TxRx-30
      1879 =C2=B1 73%    +194.3%       5532 =C2=B1180%    +338.4%       824=
1 =C2=B1145%  interrupts.CPU67.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.2e+102%       1.20 =C2=B1 3=
3%  interrupts.CPU67.IWI:IRQ_work_interrupts
     60729           -98.3%       1019 =C2=B1 42%    +110.4%     127798    =
    interrupts.CPU67.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU67.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7113 =C2=B1 1=
5%  interrupts.CPU67.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7113 =C2=B1 1=
5%  interrupts.CPU67.PMI:Performance_monitoring_interrupts
    588614 =C2=B1128%     -93.1%      40600 =C2=B1184%     -44.0%     32956=
2 =C2=B1112%  interrupts.CPU67.RES:Rescheduling_interrupts
      0.33 =C2=B1141%    +350.0%       1.50 =C2=B1195%    +380.0%       1.6=
0 =C2=B1 57%  interrupts.CPU67.TLB:TLB_shootdowns
      0.00          -100.0%       0.00         +8e+102%       8.00 =C2=B126=
8%  interrupts.CPU68.104:PCI-MSI.31981637-edge.i40e-eth0-TxRx-68
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%    -100.0%       0.0=
0        interrupts.CPU68.115:PCI-MSI.31981648-edge.i40e-eth0-TxRx-79
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU68.297:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU68.298:PCI-MSI.69632-edge.ioat-msix
      0.50 =C2=B1100%     -33.3%       0.33 =C2=B1141%     -60.0%       0.2=
0 =C2=B1200%  interrupts.CPU68.67:PCI-MSI.31981600-edge.i40e-eth0-TxRx-31
      3018 =C2=B1 60%     +97.4%       5958 =C2=B1 70%    +183.5%       855=
7 =C2=B1153%  interrupts.CPU68.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.2e+102%       1.20 =C2=B1 5=
0%  interrupts.CPU68.IWI:IRQ_work_interrupts
     60344           -98.7%     807.00 =C2=B1 31%    +111.7%     127753    =
    interrupts.CPU68.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU68.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.7e+105%       6739 =C2=B1 2=
2%  interrupts.CPU68.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.7e+105%       6739 =C2=B1 2=
2%  interrupts.CPU68.PMI:Performance_monitoring_interrupts
    155749 =C2=B1 95%     -83.3%      25947 =C2=B1145%    +402.3%     78227=
0 =C2=B1125%  interrupts.CPU68.RES:Rescheduling_interrupts
      0.33 =C2=B1223%     -50.0%       0.17 =C2=B1223%    +320.0%       1.4=
0 =C2=B1 34%  interrupts.CPU68.TLB:TLB_shootdowns
      0.33 =C2=B1223%   +9550.0%      32.17 =C2=B1222%    -100.0%       0.0=
0        interrupts.CPU69.105:PCI-MSI.31981638-edge.i40e-eth0-TxRx-69
      0.50 =C2=B1100%     -66.7%       0.17 =C2=B1223%     -40.0%       0.3=
0 =C2=B1152%  interrupts.CPU69.116:PCI-MSI.31981649-edge.i40e-eth0-TxRx-80
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU69.300:PCI-MSI.73728-edge.ioat-msix
      0.00       +1.7e+101%       0.17 =C2=B1223%   +4e+101%       0.40 =C2=
=B1122%  interrupts.CPU69.68:PCI-MSI.31981601-edge.i40e-eth0-TxRx-32
      4982 =C2=B1137%     -81.9%     900.67 =C2=B1 72%    +149.5%      1242=
9 =C2=B1157%  interrupts.CPU69.CAL:Function_call_interrupts
      0.00          -100.0%       0.00         +1e+102%       1.00        i=
nterrupts.CPU69.IWI:IRQ_work_interrupts
     60373           -98.4%     980.33 =C2=B1 34%    +111.7%     127801    =
    interrupts.CPU69.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU69.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7113 =C2=B1 1=
5%  interrupts.CPU69.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7113 =C2=B1 1=
5%  interrupts.CPU69.PMI:Performance_monitoring_interrupts
    335179 =C2=B1146%     -99.9%     386.17 =C2=B1156%     +13.9%     38169=
1 =C2=B1104%  interrupts.CPU69.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          +740.0%       1.40 =C2=
=B1 34%  interrupts.CPU69.TLB:TLB_shootdowns
      0.00       +1.7e+101%       0.17 =C2=B1223%   +1e+101%       0.10 =C2=
=B1300%  interrupts.CPU7.126:PCI-MSI.31981659-edge.i40e-eth0-TxRx-90
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU7.297:PCI-MSI.67584-edge.ioat-msix
      0.33 =C2=B1223%    +250.0%       1.17 =C2=B1159%     -40.0%       0.2=
0 =C2=B1300%  interrupts.CPU7.43:PCI-MSI.31981576-edge.i40e-eth0-TxRx-7
      0.33 =C2=B1141%      +0.0%       0.33 =C2=B1141%    -100.0%       0.0=
0        interrupts.CPU7.78:PCI-MSI.31981611-edge.i40e-eth0-TxRx-42
     10913 =C2=B1 94%     -49.8%       5483 =C2=B1 90%     +30.0%      1418=
7 =C2=B1158%  interrupts.CPU7.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.4e+102%       1.40 =C2=B1 4=
7%  interrupts.CPU7.IWI:IRQ_work_interrupts
     60329           -97.8%       1354 =C2=B1 54%    +111.7%     127746    =
    interrupts.CPU7.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU7.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7128 =C2=B1 1=
5%  interrupts.CPU7.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7128 =C2=B1 1=
5%  interrupts.CPU7.PMI:Performance_monitoring_interrupts
    318802 =C2=B1 99%     -92.6%      23440 =C2=B1119%    +110.9%     67228=
8 =C2=B1113%  interrupts.CPU7.RES:Rescheduling_interrupts
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%    +440.0%       0.9=
0 =C2=B1 77%  interrupts.CPU7.TLB:TLB_shootdowns
     12.67 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU70.106:PCI-MSI.31981639-edge.i40e-eth0-TxRx-70
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%     -40.0%       0.1=
0 =C2=B1300%  interrupts.CPU70.117:PCI-MSI.31981650-edge.i40e-eth0-TxRx-81
      0.33 =C2=B1141%    -100.0%       0.00           -70.0%       0.10 =C2=
=B1300%  interrupts.CPU70.69:PCI-MSI.31981602-edge.i40e-eth0-TxRx-33
      1785 =C2=B1 93%     +88.6%       3366 =C2=B1 79%    +406.7%       904=
4 =C2=B1137%  interrupts.CPU70.CAL:Function_call_interrupts
      0.00          -100.0%       0.00         +9e+101%       0.90 =C2=B1 3=
3%  interrupts.CPU70.IWI:IRQ_work_interrupts
     60385           -97.0%       1821 =C2=B1 52%    +111.6%     127752    =
    interrupts.CPU70.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU70.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7114 =C2=B1 1=
5%  interrupts.CPU70.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7114 =C2=B1 1=
5%  interrupts.CPU70.PMI:Performance_monitoring_interrupts
     54658 =C2=B1105%     -79.9%      10961 =C2=B1 87%    +651.0%     41045=
9 =C2=B1124%  interrupts.CPU70.RES:Rescheduling_interrupts
      0.00          -100.0%       0.00       +1.5e+102%       1.50 =C2=B1 4=
4%  interrupts.CPU70.TLB:TLB_shootdowns
      2.50 =C2=B1223%     -86.7%       0.33 =C2=B1141%    +212.0%       7.8=
0 =C2=B1177%  interrupts.CPU71.107:PCI-MSI.31981640-edge.i40e-eth0-TxRx-71
      0.00         +5e+101%       0.50 =C2=B1100%   +1e+101%       0.10 =C2=
=B1300%  interrupts.CPU71.118:PCI-MSI.31981651-edge.i40e-eth0-TxRx-82
      0.00       +3.3e+101%       0.33 =C2=B1141%    -100.0%       0.00    =
    interrupts.CPU71.70:PCI-MSI.31981603-edge.i40e-eth0-TxRx-34
      5926 =C2=B1118%     -29.6%       4174 =C2=B1150%      -8.3%       543=
6 =C2=B1103%  interrupts.CPU71.CAL:Function_call_interrupts
      0.00          -100.0%       0.00         +1e+102%       1.00        i=
nterrupts.CPU71.IWI:IRQ_work_interrupts
     60434           -98.1%       1123 =C2=B1 33%    +111.4%     127750    =
    interrupts.CPU71.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU71.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7114 =C2=B1 1=
5%  interrupts.CPU71.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7114 =C2=B1 1=
5%  interrupts.CPU71.PMI:Performance_monitoring_interrupts
    507707 =C2=B1109%     -98.4%       7873 =C2=B1135%     -53.0%     23860=
8 =C2=B1102%  interrupts.CPU71.RES:Rescheduling_interrupts
      0.00       +1.7e+101%       0.17 =C2=B1223% +1.6e+102%       1.60 =C2=
=B1 57%  interrupts.CPU71.TLB:TLB_shootdowns
      4.33 =C2=B1223%    -100.0%       0.00          +255.4%      15.40 =C2=
=B1300%  interrupts.CPU72.108:PCI-MSI.31981641-edge.i40e-eth0-TxRx-72
     11035 =C2=B1 60%     -83.6%       1806 =C2=B1135%     -13.4%       956=
0 =C2=B1 61%  interrupts.CPU72.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.9e+102%       1.90 =C2=B1 2=
8%  interrupts.CPU72.IWI:IRQ_work_interrupts
     60333           -98.9%     660.50 =C2=B1 37%    +111.7%     127735    =
    interrupts.CPU72.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU72.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7062 =C2=B1 2=
2%  interrupts.CPU72.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7062 =C2=B1 2=
2%  interrupts.CPU72.PMI:Performance_monitoring_interrupts
    258639 =C2=B1 88%     -98.7%       3233 =C2=B1210%     +55.5%     40213=
7 =C2=B1 56%  interrupts.CPU72.RES:Rescheduling_interrupts
      0.50 =C2=B1100%    -100.0%       0.00          +160.0%       1.30 =C2=
=B1 35%  interrupts.CPU72.TLB:TLB_shootdowns
      0.17 =C2=B1223%    +800.0%       1.50 =C2=B1223%   +9080.0%      15.3=
0 =C2=B1200%  interrupts.CPU73.109:PCI-MSI.31981642-edge.i40e-eth0-TxRx-73
      9560 =C2=B1104%     -53.4%       4453 =C2=B1111%      +7.6%      1028=
5 =C2=B1 82%  interrupts.CPU73.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +2.2e+102%       2.20 =C2=B1 2=
7%  interrupts.CPU73.IWI:IRQ_work_interrupts
     60284           -98.4%     991.67 =C2=B1 32%    +112.0%     127804    =
    interrupts.CPU73.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU73.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.5e+105%       7459 =C2=B1 1=
5%  interrupts.CPU73.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.5e+105%       7459 =C2=B1 1=
5%  interrupts.CPU73.PMI:Performance_monitoring_interrupts
    288831 =C2=B1 76%     -95.7%      12327 =C2=B1162%     +70.1%     49121=
9 =C2=B1 60%  interrupts.CPU73.RES:Rescheduling_interrupts
      0.33 =C2=B1223%    -100.0%       0.00          +380.0%       1.60 =C2=
=B1 41%  interrupts.CPU73.TLB:TLB_shootdowns
      4.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU74.110:PCI-MSI.31981643-edge.i40e-eth0-TxRx-74
      6498 =C2=B1111%     -63.7%       2356 =C2=B1173%     +26.2%       819=
8 =C2=B1 92%  interrupts.CPU74.CAL:Function_call_interrupts
      0.00          -100.0%       0.00         +2e+102%       2.00 =C2=B1 2=
2%  interrupts.CPU74.IWI:IRQ_work_interrupts
     60239           -98.1%       1148 =C2=B1 68%    +112.0%     127715    =
    interrupts.CPU74.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU74.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.5e+105%       7457 =C2=B1 1=
5%  interrupts.CPU74.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.5e+105%       7457 =C2=B1 1=
5%  interrupts.CPU74.PMI:Performance_monitoring_interrupts
    433997 =C2=B1103%     -99.5%       2368 =C2=B1216%      +5.8%     45898=
4 =C2=B1 45%  interrupts.CPU74.RES:Rescheduling_interrupts
      0.50 =C2=B1100%     -33.3%       0.33 =C2=B1223%    +200.0%       1.5=
0 =C2=B1 33%  interrupts.CPU74.TLB:TLB_shootdowns
      4.00 =C2=B1144%    -100.0%       0.00           -97.5%       0.10 =C2=
=B1300%  interrupts.CPU75.111:PCI-MSI.31981644-edge.i40e-eth0-TxRx-75
      8525 =C2=B1125%      -8.7%       7781 =C2=B1 82%     +43.1%      1220=
0 =C2=B1 77%  interrupts.CPU75.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.6e+102%       1.60 =C2=B1 3=
0%  interrupts.CPU75.IWI:IRQ_work_interrupts
     60310           -98.1%       1164 =C2=B1 44%    +111.7%     127705    =
    interrupts.CPU75.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU75.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.3e+105%       6276 =C2=B1 3=
0%  interrupts.CPU75.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.3e+105%       6276 =C2=B1 3=
0%  interrupts.CPU75.PMI:Performance_monitoring_interrupts
    482166 =C2=B1 65%     -98.5%       7259 =C2=B1 97%     -12.4%     42243=
6 =C2=B1121%  interrupts.CPU75.RES:Rescheduling_interrupts
      0.83 =C2=B1 44%     -40.0%       0.50 =C2=B1100%     +92.0%       1.6=
0 =C2=B1 30%  interrupts.CPU75.TLB:TLB_shootdowns
      0.00       +1.7e+101%       0.17 =C2=B1223% +1.1e+104%     113.30 =C2=
=B1196%  interrupts.CPU76.112:PCI-MSI.31981645-edge.i40e-eth0-TxRx-76
      5111 =C2=B1 72%     -10.9%       4555 =C2=B1142%     +71.6%       876=
9 =C2=B1181%  interrupts.CPU76.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.8e+102%       1.80 =C2=B1 3=
3%  interrupts.CPU76.IWI:IRQ_work_interrupts
     60295           -98.5%     884.83 =C2=B1 33%    +111.8%     127705    =
    interrupts.CPU76.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU76.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.7e+105%       6670 =C2=B1 2=
6%  interrupts.CPU76.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.7e+105%       6670 =C2=B1 2=
6%  interrupts.CPU76.PMI:Performance_monitoring_interrupts
    600012 =C2=B1 99%     -99.5%       3234 =C2=B1147%     -67.1%     19715=
4 =C2=B1 90%  interrupts.CPU76.RES:Rescheduling_interrupts
      0.50 =C2=B1152%     -66.7%       0.17 =C2=B1223%    +220.0%       1.6=
0 =C2=B1 41%  interrupts.CPU76.TLB:TLB_shootdowns
      0.50 =C2=B1223%   +1800.0%       9.50 =C2=B1209%     -60.0%       0.2=
0 =C2=B1200%  interrupts.CPU77.113:PCI-MSI.31981646-edge.i40e-eth0-TxRx-77
      3897 =C2=B1 94%     -84.5%     605.17 =C2=B1 22%    +199.7%      1167=
9 =C2=B1164%  interrupts.CPU77.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.6e+102%       1.60 =C2=B1 3=
0%  interrupts.CPU77.IWI:IRQ_work_interrupts
     60324           -96.9%       1892 =C2=B1 86%    +111.8%     127769    =
    interrupts.CPU77.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU77.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.3e+105%       6275 =C2=B1 3=
0%  interrupts.CPU77.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.3e+105%       6275 =C2=B1 3=
0%  interrupts.CPU77.PMI:Performance_monitoring_interrupts
    241911 =C2=B1 80%     -99.9%     189.83 =C2=B1132%     +19.8%     28971=
3 =C2=B1 71%  interrupts.CPU77.RES:Rescheduling_interrupts
      0.33 =C2=B1141%     +50.0%       0.50 =C2=B1100%    +320.0%       1.4=
0 =C2=B1 34%  interrupts.CPU77.TLB:TLB_shootdowns
      0.00          -100.0%       0.00       +7.8e+102%       7.80 =C2=B117=
3%  interrupts.CPU78.114:PCI-MSI.31981647-edge.i40e-eth0-TxRx-78
      9485 =C2=B1 99%     -59.8%       3814 =C2=B1133%     -46.0%       512=
2 =C2=B1161%  interrupts.CPU78.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.7e+102%       1.70 =C2=B1 3=
7%  interrupts.CPU78.IWI:IRQ_work_interrupts
     60343           -97.5%       1503 =C2=B1 47%    +111.7%     127736    =
    interrupts.CPU78.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU78.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.3e+105%       6278 =C2=B1 3=
0%  interrupts.CPU78.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.3e+105%       6278 =C2=B1 3=
0%  interrupts.CPU78.PMI:Performance_monitoring_interrupts
    406309 =C2=B1 49%     -98.7%       5159 =C2=B1147%     -25.7%     30197=
8 =C2=B1131%  interrupts.CPU78.RES:Rescheduling_interrupts
      0.33 =C2=B1141%    -100.0%       0.00          +440.0%       1.80 =C2=
=B1 64%  interrupts.CPU78.TLB:TLB_shootdowns
     38.00 =C2=B1122%   +2201.8%     874.67 =C2=B1174%     -66.8%      12.6=
0 =C2=B1300%  interrupts.CPU79.115:PCI-MSI.31981648-edge.i40e-eth0-TxRx-79
      3494 =C2=B1 61%     +49.9%       5237 =C2=B1144%     +28.6%       449=
2 =C2=B1185%  interrupts.CPU79.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.7e+102%       1.70 =C2=B1 2=
6%  interrupts.CPU79.IWI:IRQ_work_interrupts
     60312           -89.3%       6482 =C2=B1154%    +111.9%     127782    =
    interrupts.CPU79.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU79.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.7e+105%       6666 =C2=B1 2=
6%  interrupts.CPU79.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.7e+105%       6666 =C2=B1 2=
6%  interrupts.CPU79.PMI:Performance_monitoring_interrupts
    411599 =C2=B1 52%     -97.7%       9532 =C2=B1188%     -41.5%     24097=
2 =C2=B1147%  interrupts.CPU79.RES:Rescheduling_interrupts
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%    +980.0%       1.8=
0 =C2=B1 41%  interrupts.CPU79.TLB:TLB_shootdowns
      0.00          -100.0%       0.00         +1e+101%       0.10 =C2=B130=
0%  interrupts.CPU8.127:PCI-MSI.31981660-edge.i40e-eth0-TxRx-91
      1.67 =C2=B1223%    +510.0%      10.17 =C2=B1223%    -100.0%       0.0=
0        interrupts.CPU8.44:PCI-MSI.31981577-edge.i40e-eth0-TxRx-8
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU8.79:PCI-MSI.31981612-edge.i40e-eth0-TxRx-43
      6358 =C2=B1101%      +0.7%       6400 =C2=B1 71%     +69.7%      1079=
2 =C2=B1125%  interrupts.CPU8.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.5e+102%       1.50 =C2=B1 3=
3%  interrupts.CPU8.IWI:IRQ_work_interrupts
     60343           -97.6%       1428 =C2=B1 69%    +111.8%     127779    =
    interrupts.CPU8.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU8.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.8e+105%       6754 =C2=B1 2=
2%  interrupts.CPU8.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.8e+105%       6754 =C2=B1 2=
2%  interrupts.CPU8.PMI:Performance_monitoring_interrupts
    330226 =C2=B1 71%     -93.6%      21080 =C2=B1105%     +25.1%     41325=
5 =C2=B1 58%  interrupts.CPU8.RES:Rescheduling_interrupts
      0.00       +1.7e+101%       0.17 =C2=B1223% +1.1e+102%       1.10 =C2=
=B1 85%  interrupts.CPU8.TLB:TLB_shootdowns
      0.33 =C2=B1141%  +12400.0%      41.67 =C2=B1213%    -100.0%       0.0=
0        interrupts.CPU80.116:PCI-MSI.31981649-edge.i40e-eth0-TxRx-80
      3613 =C2=B1 77%     -83.3%     602.33 =C2=B1 27%     +32.0%       476=
8 =C2=B1 93%  interrupts.CPU80.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.7e+102%       1.70 =C2=B1 2=
6%  interrupts.CPU80.IWI:IRQ_work_interrupts
     60257           -98.1%       1125 =C2=B1 49%    +111.9%     127680    =
    interrupts.CPU80.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU80.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.7e+105%       6669 =C2=B1 2=
6%  interrupts.CPU80.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.7e+105%       6669 =C2=B1 2=
6%  interrupts.CPU80.PMI:Performance_monitoring_interrupts
    416160 =C2=B1101%     -99.9%     216.50 =C2=B1140%      +7.0%     44521=
1 =C2=B1 89%  interrupts.CPU80.RES:Rescheduling_interrupts
      0.00       +1.7e+101%       0.17 =C2=B1223% +1.6e+102%       1.60 =C2=
=B1 41%  interrupts.CPU80.TLB:TLB_shootdowns
      0.33 =C2=B1223%  +1.4e+06%       4722 =C2=B1223%    +950.0%       3.5=
0 =C2=B1300%  interrupts.CPU81.117:PCI-MSI.31981650-edge.i40e-eth0-TxRx-81
    510.83 =C2=B1 65%    +191.1%       1487 =C2=B1114%    +759.1%       438=
8 =C2=B1167%  interrupts.CPU81.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.6e+102%       1.60 =C2=B1 3=
0%  interrupts.CPU81.IWI:IRQ_work_interrupts
     60298           -97.2%       1702 =C2=B1115%    +111.8%     127711    =
    interrupts.CPU81.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU81.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.3e+105%       6277 =C2=B1 3=
0%  interrupts.CPU81.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.3e+105%       6277 =C2=B1 3=
0%  interrupts.CPU81.PMI:Performance_monitoring_interrupts
     59743 =C2=B1115%     -98.4%     946.83 =C2=B1159%    +218.1%     19004=
3 =C2=B1 92%  interrupts.CPU81.RES:Rescheduling_interrupts
      0.00       +1.7e+101%       0.17 =C2=B1223% +1.6e+102%       1.60 =C2=
=B1 30%  interrupts.CPU81.TLB:TLB_shootdowns
      1.00 =C2=B1223%     -83.3%       0.17 =C2=B1223%    +960.0%      10.6=
0 =C2=B1300%  interrupts.CPU82.118:PCI-MSI.31981651-edge.i40e-eth0-TxRx-82
      5267 =C2=B1 82%     -52.3%       2514 =C2=B1112%     -26.2%       388=
6 =C2=B1 85%  interrupts.CPU82.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.6e+102%       1.60 =C2=B1 3=
0%  interrupts.CPU82.IWI:IRQ_work_interrupts
     60273           -97.4%       1576 =C2=B1 62%    +112.0%     127753    =
    interrupts.CPU82.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU82.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.3e+105%       6277 =C2=B1 3=
0%  interrupts.CPU82.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.3e+105%       6277 =C2=B1 3=
0%  interrupts.CPU82.PMI:Performance_monitoring_interrupts
    379387 =C2=B1 97%     -99.4%       2458 =C2=B1142%     -55.0%     17058=
3 =C2=B1 63%  interrupts.CPU82.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          +860.0%       1.60 =C2=
=B1 30%  interrupts.CPU82.TLB:TLB_shootdowns
      0.17 =C2=B1223%    -100.0%       0.00        +2.6e+05%     430.10 =C2=
=B1298%  interrupts.CPU83.119:PCI-MSI.31981652-edge.i40e-eth0-TxRx-83
      2431 =C2=B1118%    +178.4%       6768 =C2=B1130%     +79.2%       435=
6 =C2=B1115%  interrupts.CPU83.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.7e+102%       1.70 =C2=B1 3=
7%  interrupts.CPU83.IWI:IRQ_work_interrupts
     60251           -97.2%       1660 =C2=B1 67%    +112.0%     127722    =
    interrupts.CPU83.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU83.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.3e+105%       6278 =C2=B1 3=
0%  interrupts.CPU83.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.3e+105%       6278 =C2=B1 3=
0%  interrupts.CPU83.PMI:Performance_monitoring_interrupts
    196406 =C2=B1 92%     -92.4%      14917 =C2=B1166%      +5.5%     20728=
7 =C2=B1102%  interrupts.CPU83.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          +920.0%       1.70 =C2=
=B1 26%  interrupts.CPU83.TLB:TLB_shootdowns
      1.33 =C2=B1223%    +225.0%       4.33 =C2=B1137%     -85.0%       0.2=
0 =C2=B1200%  interrupts.CPU84.120:PCI-MSI.31981653-edge.i40e-eth0-TxRx-84
      7245 =C2=B1148%     -33.7%       4805 =C2=B1194%     -72.3%       200=
8 =C2=B1 68%  interrupts.CPU84.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.7e+102%       1.70 =C2=B1 2=
6%  interrupts.CPU84.IWI:IRQ_work_interrupts
     60295           -96.8%       1915 =C2=B1 84%    +111.8%     127721    =
    interrupts.CPU84.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU84.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.7e+105%       6669 =C2=B1 2=
6%  interrupts.CPU84.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.7e+105%       6669 =C2=B1 2=
6%  interrupts.CPU84.PMI:Performance_monitoring_interrupts
    298141 =C2=B1127%     -96.9%       9333 =C2=B1218%     -71.1%      8608=
8 =C2=B1 86%  interrupts.CPU84.RES:Rescheduling_interrupts
      0.67 =C2=B1111%     -75.0%       0.17 =C2=B1223%    +155.0%       1.7=
0 =C2=B1 26%  interrupts.CPU84.TLB:TLB_shootdowns
      1.33 =C2=B1223%     -25.0%       1.00 =C2=B1223%     -92.5%       0.1=
0 =C2=B1300%  interrupts.CPU85.121:PCI-MSI.31981654-edge.i40e-eth0-TxRx-85
      2953 =C2=B1 65%     +52.7%       4510 =C2=B1141%     +91.0%       563=
9 =C2=B1200%  interrupts.CPU85.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.7e+102%       1.70 =C2=B1 2=
6%  interrupts.CPU85.IWI:IRQ_work_interrupts
     60282           -96.8%       1953 =C2=B1 79%    +111.9%     127753    =
    interrupts.CPU85.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU85.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.7e+105%       6669 =C2=B1 2=
6%  interrupts.CPU85.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.7e+105%       6669 =C2=B1 2=
6%  interrupts.CPU85.PMI:Performance_monitoring_interrupts
    427549 =C2=B1104%     -97.6%      10055 =C2=B1182%     -68.1%     13623=
1 =C2=B1109%  interrupts.CPU85.RES:Rescheduling_interrupts
      0.33 =C2=B1141%      +0.0%       0.33 =C2=B1141%    +410.0%       1.7=
0 =C2=B1 37%  interrupts.CPU85.TLB:TLB_shootdowns
      0.00       +4.3e+102%       4.33 =C2=B1223%   +4e+103%      40.40 =C2=
=B1299%  interrupts.CPU86.122:PCI-MSI.31981655-edge.i40e-eth0-TxRx-86
      2952 =C2=B1144%     +40.6%       4151 =C2=B1 69%     +59.3%       470=
3 =C2=B1119%  interrupts.CPU86.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.7e+102%       1.70 =C2=B1 2=
6%  interrupts.CPU86.IWI:IRQ_work_interrupts
     60269           -98.3%       1034 =C2=B1 46%    +111.9%     127718    =
    interrupts.CPU86.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU86.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.7e+105%       6670 =C2=B1 2=
6%  interrupts.CPU86.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.7e+105%       6670 =C2=B1 2=
6%  interrupts.CPU86.PMI:Performance_monitoring_interrupts
    466540 =C2=B1109%     -97.8%      10446 =C2=B1108%     -42.1%     27022=
9 =C2=B1 81%  interrupts.CPU86.RES:Rescheduling_interrupts
      0.17 =C2=B1223%    -100.0%       0.00          +980.0%       1.80 =C2=
=B1 22%  interrupts.CPU86.TLB:TLB_shootdowns
      1.00 =C2=B1223%    +600.0%       7.00 =C2=B1159%    -100.0%       0.0=
0        interrupts.CPU87.123:PCI-MSI.31981656-edge.i40e-eth0-TxRx-87
      3901 =C2=B1117%      -5.2%       3699 =C2=B1 97%     +43.2%       558=
6 =C2=B1158%  interrupts.CPU87.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.7e+102%       1.70 =C2=B1 2=
6%  interrupts.CPU87.IWI:IRQ_work_interrupts
     60290           -98.1%       1171 =C2=B1 52%    +111.8%     127707    =
    interrupts.CPU87.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU87.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.7e+105%       6669 =C2=B1 2=
6%  interrupts.CPU87.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.7e+105%       6669 =C2=B1 2=
6%  interrupts.CPU87.PMI:Performance_monitoring_interrupts
    517377 =C2=B1 97%     -97.8%      11400 =C2=B1185%     -51.5%     25075=
7 =C2=B1103%  interrupts.CPU87.RES:Rescheduling_interrupts
      0.50 =C2=B1100%     -66.7%       0.17 =C2=B1223%    +240.0%       1.7=
0 =C2=B1 26%  interrupts.CPU87.TLB:TLB_shootdowns
      4.50 =C2=B1223%    -100.0%       0.00          +535.6%      28.60 =C2=
=B1300%  interrupts.CPU88.124:PCI-MSI.31981657-edge.i40e-eth0-TxRx-88
      2592 =C2=B1117%     +16.0%       3007 =C2=B1120%     -32.4%       175=
1 =C2=B1 65%  interrupts.CPU88.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.8e+102%       1.80 =C2=B1 2=
2%  interrupts.CPU88.IWI:IRQ_work_interrupts
     60317           -97.6%       1451 =C2=B1 67%    +111.8%     127745    =
    interrupts.CPU88.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU88.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7061 =C2=B1 2=
2%  interrupts.CPU88.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7061 =C2=B1 2=
2%  interrupts.CPU88.PMI:Performance_monitoring_interrupts
    201008 =C2=B1134%     -97.5%       5037 =C2=B1165%     -23.1%     15452=
3 =C2=B1119%  interrupts.CPU88.RES:Rescheduling_interrupts
      0.33 =C2=B1141%     -50.0%       0.17 =C2=B1223%    +500.0%       2.0=
0 =C2=B1 44%  interrupts.CPU88.TLB:TLB_shootdowns
      9.17 =C2=B1223%     +69.1%      15.50 =C2=B1223%     -88.0%       1.1=
0 =C2=B1271%  interrupts.CPU89.125:PCI-MSI.31981658-edge.i40e-eth0-TxRx-89
      4358 =C2=B1169%     +32.1%       5755 =C2=B1137%     -59.8%       175=
1 =C2=B1 56%  interrupts.CPU89.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.7e+102%       1.70 =C2=B1 2=
6%  interrupts.CPU89.IWI:IRQ_work_interrupts
     60246           -98.6%     828.83 =C2=B1 50%    +112.0%     127737    =
    interrupts.CPU89.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU89.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.7e+105%       6668 =C2=B1 2=
6%  interrupts.CPU89.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.7e+105%       6668 =C2=B1 2=
6%  interrupts.CPU89.PMI:Performance_monitoring_interrupts
    410372 =C2=B1126%     -98.0%       8249 =C2=B1142%     -51.8%     19798=
2 =C2=B1 91%  interrupts.CPU89.RES:Rescheduling_interrupts
      0.67 =C2=B1 70%     +25.0%       0.83 =C2=B1 82%    +245.0%       2.3=
0 =C2=B1 39%  interrupts.CPU89.TLB:TLB_shootdowns
      0.00          -100.0%       0.00         +2e+101%       0.20 =C2=B120=
0%  interrupts.CPU9.128:PCI-MSI.31981661-edge.i40e-eth0-TxRx-92
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU9.298:PCI-MSI.69632-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU9.301:PCI-MSI.75776-edge.ioat-msix
     31.00 =C2=B1223%     -98.9%       0.33 =C2=B1223%     +30.0%      40.3=
0 =C2=B1289%  interrupts.CPU9.45:PCI-MSI.31981578-edge.i40e-eth0-TxRx-9
      0.00       +1.7e+101%       0.17 =C2=B1223%   +3e+101%       0.30 =C2=
=B1152%  interrupts.CPU9.80:PCI-MSI.31981613-edge.i40e-eth0-TxRx-44
      4604 =C2=B1 92%     +36.7%       6292 =C2=B1 59%     +38.8%       639=
1 =C2=B1127%  interrupts.CPU9.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.2e+102%       1.20 =C2=B1 5=
0%  interrupts.CPU9.IWI:IRQ_work_interrupts
     60641           -97.8%       1319 =C2=B1 62%    +110.6%     127725    =
    interrupts.CPU9.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU9.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.8e+105%       6754 =C2=B1 2=
2%  interrupts.CPU9.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.8e+105%       6754 =C2=B1 2=
2%  interrupts.CPU9.PMI:Performance_monitoring_interrupts
    317983 =C2=B1 65%     -94.2%      18512 =C2=B1 58%    +194.1%     93533=
5 =C2=B1 80%  interrupts.CPU9.RES:Rescheduling_interrupts
      0.33 =C2=B1141%    -100.0%       0.00          +140.0%       0.80 =C2=
=B1 93%  interrupts.CPU9.TLB:TLB_shootdowns
      2.83 =C2=B1223%     +58.8%       4.50 =C2=B1213%     -47.1%       1.5=
0 =C2=B1177%  interrupts.CPU90.126:PCI-MSI.31981659-edge.i40e-eth0-TxRx-90
      1568 =C2=B1117%     +67.9%       2634 =C2=B1180%     +39.6%       218=
9 =C2=B1 84%  interrupts.CPU90.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.7e+102%       1.70 =C2=B1 2=
6%  interrupts.CPU90.IWI:IRQ_work_interrupts
     60292           -98.4%     973.83 =C2=B1 44%    +111.9%     127745    =
    interrupts.CPU90.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU90.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.7e+105%       6669 =C2=B1 2=
6%  interrupts.CPU90.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.7e+105%       6669 =C2=B1 2=
6%  interrupts.CPU90.PMI:Performance_monitoring_interrupts
    245411 =C2=B1125%     -99.3%       1657 =C2=B1223%     +10.8%     27196=
5 =C2=B1180%  interrupts.CPU90.RES:Rescheduling_interrupts
      0.67 =C2=B1111%     -25.0%       0.50 =C2=B1152%    +185.0%       1.9=
0 =C2=B1 28%  interrupts.CPU90.TLB:TLB_shootdowns
      0.00          -100.0%       0.00       +3.6e+102%       3.60 =C2=B118=
0%  interrupts.CPU91.127:PCI-MSI.31981660-edge.i40e-eth0-TxRx-91
      5225 =C2=B1 69%     -23.7%       3987 =C2=B1191%     -66.1%       177=
0 =C2=B1154%  interrupts.CPU91.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.8e+102%       1.80 =C2=B1 2=
2%  interrupts.CPU91.IWI:IRQ_work_interrupts
     60290           -98.9%     656.83 =C2=B1 47%    +111.8%     127698    =
    interrupts.CPU91.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU91.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7060 =C2=B1 2=
2%  interrupts.CPU91.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7060 =C2=B1 2=
2%  interrupts.CPU91.PMI:Performance_monitoring_interrupts
    436645 =C2=B1 95%     -99.3%       3273 =C2=B1218%     -77.1%     10013=
0 =C2=B1117%  interrupts.CPU91.RES:Rescheduling_interrupts
      0.33 =C2=B1141%      +0.0%       0.33 =C2=B1141%    +530.0%       2.1=
0 =C2=B1 25%  interrupts.CPU91.TLB:TLB_shootdowns
     97.00 =C2=B1223%    -100.0%       0.00           -99.9%       0.10 =C2=
=B1300%  interrupts.CPU92.128:PCI-MSI.31981661-edge.i40e-eth0-TxRx-92
      1058 =C2=B1 60%    +244.5%       3644 =C2=B1177%    +225.0%       343=
8 =C2=B1176%  interrupts.CPU92.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.8e+102%       1.80 =C2=B1 2=
2%  interrupts.CPU92.IWI:IRQ_work_interrupts
     60267           -98.1%       1156 =C2=B1 76%    +111.9%     127734    =
    interrupts.CPU92.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU92.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7062 =C2=B1 2=
2%  interrupts.CPU92.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7062 =C2=B1 2=
2%  interrupts.CPU92.PMI:Performance_monitoring_interrupts
    185271 =C2=B1124%     -97.9%       3825 =C2=B1207%     -26.0%     13714=
4 =C2=B1104%  interrupts.CPU92.RES:Rescheduling_interrupts
      0.67 =C2=B1111%     -50.0%       0.33 =C2=B1141%    +200.0%       2.0=
0 =C2=B1 22%  interrupts.CPU92.TLB:TLB_shootdowns
      0.33 =C2=B1223%   +1200.0%       4.33 =C2=B1223%    -100.0%       0.0=
0        interrupts.CPU93.129:PCI-MSI.31981662-edge.i40e-eth0-TxRx-93
      1669 =C2=B1117%     +14.1%       1904 =C2=B1 89%     +81.7%       303=
2 =C2=B1 60%  interrupts.CPU93.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.8e+102%       1.80 =C2=B1 2=
2%  interrupts.CPU93.IWI:IRQ_work_interrupts
     60276           -97.7%       1386 =C2=B1 58%    +112.0%     127774    =
    interrupts.CPU93.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU93.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7061 =C2=B1 2=
2%  interrupts.CPU93.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7061 =C2=B1 2=
2%  interrupts.CPU93.PMI:Performance_monitoring_interrupts
    273505 =C2=B1107%     -99.3%       1934 =C2=B1136%     +74.1%     47615=
4 =C2=B1 81%  interrupts.CPU93.RES:Rescheduling_interrupts
      0.67 =C2=B1 70%     -25.0%       0.50 =C2=B1100%    +335.0%       2.9=
0 =C2=B1 24%  interrupts.CPU93.TLB:TLB_shootdowns
      1330 =C2=B1 86%    +284.0%       5109 =C2=B1133%    +345.0%       592=
0 =C2=B1 67%  interrupts.CPU94.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.7e+102%       1.70 =C2=B1 2=
6%  interrupts.CPU94.IWI:IRQ_work_interrupts
     60226           -98.3%       1046 =C2=B1 40%    +112.2%     127787    =
    interrupts.CPU94.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU94.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +6.7e+105%       6668 =C2=B1 2=
6%  interrupts.CPU94.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +6.7e+105%       6668 =C2=B1 2=
6%  interrupts.CPU94.PMI:Performance_monitoring_interrupts
     97035 =C2=B1107%     -89.1%      10581 =C2=B1154%    +258.1%     34748=
4 =C2=B1 69%  interrupts.CPU94.RES:Rescheduling_interrupts
      0.67 =C2=B1 70%      +0.0%       0.67 =C2=B1 70%    +350.0%       3.0=
0 =C2=B1 47%  interrupts.CPU94.TLB:TLB_shootdowns
      8250 =C2=B1105%     -61.0%       3214 =C2=B1186%     -54.6%       374=
7 =C2=B1104%  interrupts.CPU95.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.8e+102%       1.80 =C2=B1 2=
2%  interrupts.CPU95.IWI:IRQ_work_interrupts
     60273           -98.9%     663.67 =C2=B1 56%    +111.8%     127629    =
    interrupts.CPU95.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU95.MCP:Machine_check_polls
      0.00          -100.0%       0.00       +7.1e+105%       7061 =C2=B1 2=
2%  interrupts.CPU95.NMI:Non-maskable_interrupts
      0.00          -100.0%       0.00       +7.1e+105%       7061 =C2=B1 2=
2%  interrupts.CPU95.PMI:Performance_monitoring_interrupts
    659427 =C2=B1 51%     -97.4%      17060 =C2=B1223%     -49.9%     33006=
8 =C2=B1 71%  interrupts.CPU95.RES:Rescheduling_interrupts
      0.00          -100.0%       0.00         +3e+101%       0.30 =C2=B115=
2%  interrupts.CPU95.TLB:TLB_shootdowns
      0.00          -100.0%       0.00       +1.4e+104%     143.90 =C2=B1  =
9%  interrupts.IWI:IRQ_work_interrupts
   5790318           -97.7%     136046 =C2=B1 14%    +111.8%   12262240    =
    interrupts.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.MCP:Machine_check_polls
      0.00       +1.7e+101%       0.17 =C2=B1223% +6.6e+107%     659020 =C2=
=B1  6%  interrupts.NMI:Non-maskable_interrupts
      0.00       +1.7e+101%       0.17 =C2=B1223% +6.6e+107%     659020 =C2=
=B1  6%  interrupts.PMI:Performance_monitoring_interrupts
  41275590 =C2=B1 20%     -97.0%    1229430 =C2=B1 15%      +1.4%   4186469=
4 =C2=B1 22%  interrupts.RES:Rescheduling_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.RTR:APIC_ICR_read_retries
     27.83 =C2=B1 59%     -31.7%      19.00 =C2=B1 22%    +391.5%     136.8=
0 =C2=B1 32%  interrupts.TLB:TLB_shootdowns


>  fs/pipe.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> =

> diff --git a/fs/pipe.c b/fs/pipe.c
> index 678dee2a8228..6d4342bad9f1 100644
> --- a/fs/pipe.c
> +++ b/fs/pipe.c
> @@ -363,10 +363,9 @@ pipe_read(struct kiocb *iocb, struct iov_iter *to)
>  		 * _very_ unlikely case that the pipe was full, but we got
>  		 * no data.
>  		 */
> -		if (unlikely(was_full)) {
> +		if (unlikely(was_full))
>  			wake_up_interruptible_sync_poll(&pipe->wr_wait, EPOLLOUT | EPOLLWRNOR=
M);
> -			kill_fasync(&pipe->fasync_writers, SIGIO, POLL_OUT);
> -		}
> +		kill_fasync(&pipe->fasync_writers, SIGIO, POLL_OUT);
>  =

>  		/*
>  		 * But because we didn't read anything, at this point we can
> @@ -385,12 +384,11 @@ pipe_read(struct kiocb *iocb, struct iov_iter *to)
>  		wake_next_reader =3D false;
>  	__pipe_unlock(pipe);
>  =

> -	if (was_full) {
> +	if (was_full)
>  		wake_up_interruptible_sync_poll(&pipe->wr_wait, EPOLLOUT | EPOLLWRNORM=
);
> -		kill_fasync(&pipe->fasync_writers, SIGIO, POLL_OUT);
> -	}
>  	if (wake_next_reader)
>  		wake_up_interruptible_sync_poll(&pipe->rd_wait, EPOLLIN | EPOLLRDNORM);
> +	kill_fasync(&pipe->fasync_writers, SIGIO, POLL_OUT);
>  	if (ret > 0)
>  		file_accessed(filp);
>  	return ret;
> @@ -565,10 +563,9 @@ pipe_write(struct kiocb *iocb, struct iov_iter *from)
>  		 * become empty while we dropped the lock.
>  		 */
>  		__pipe_unlock(pipe);
> -		if (was_empty) {
> +		if (was_empty)
>  			wake_up_interruptible_sync_poll(&pipe->rd_wait, EPOLLIN | EPOLLRDNORM=
);
> -			kill_fasync(&pipe->fasync_readers, SIGIO, POLL_IN);
> -		}
> +		kill_fasync(&pipe->fasync_readers, SIGIO, POLL_IN);
>  		wait_event_interruptible_exclusive(pipe->wr_wait, pipe_writable(pipe));
>  		__pipe_lock(pipe);
>  		was_empty =3D pipe_empty(pipe->head, pipe->tail);
> @@ -591,10 +588,9 @@ pipe_write(struct kiocb *iocb, struct iov_iter *from)
>  	 * Epoll nonsensically wants a wakeup whether the pipe
>  	 * was already empty or not.
>  	 */
> -	if (was_empty || pipe->poll_usage) {
> +	if (was_empty || pipe->poll_usage)
>  		wake_up_interruptible_sync_poll(&pipe->rd_wait, EPOLLIN | EPOLLRDNORM);
> -		kill_fasync(&pipe->fasync_readers, SIGIO, POLL_IN);
> -	}
> +	kill_fasync(&pipe->fasync_readers, SIGIO, POLL_IN);
>  	if (wake_next_writer)
>  		wake_up_interruptible_sync_poll(&pipe->wr_wait, EPOLLOUT | EPOLLWRNORM=
);
>  	if (ret > 0 && sb_start_write_trylock(file_inode(filp)->i_sb)) {

--===============3791732215362397619==--

