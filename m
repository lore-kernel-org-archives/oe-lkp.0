Content-Type: multipart/mixed; boundary="===============8456710297125305419=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [fsnotify] 4c40d6efc8: unixbench.score -3.3% regression
Date: Tue, 03 Aug 2021 22:22:26 +0800
Message-ID: <20210803142225.GA28609@xsang-OptiPlex-9020>
In-Reply-To: <CAOQ4uxh+do6SVyYCcNSM+7dqzSRU_Y-AXYuMyti4ESkmLdm5zQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8456710297125305419==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Amir,

On Sat, Jul 31, 2021 at 07:27:19PM +0300, Amir Goldstein wrote:
> On Sat, Jul 31, 2021 at 12:27 PM Amir Goldstein <amir73il@gmail.com> wr=
ote:
> >
> > On Sat, Jul 31, 2021 at 9:20 AM kernel test robot <oliver.sang@intel.=
com> wrote:
> > >
> > >
> > >
> > > Greeting,
> > >
> > > FYI, we noticed a -3.3% regression of unixbench.score due to commit:
> > >
> > >
> > > commit: 4c40d6efc8b22b88a45c335ffd6d25b55d769f5b ("[PATCH v4 08/16] f=
snotify: pass arguments of fsnotify() in struct fsnotify_event_info")
> > > url: https://github.com/0day-ci/linux/commits/Gabriel-Krisman-Bertazi=
/File-system-wide-monitoring/20210721-001444
> > > base: https://git.kernel.org/cgit/linux/kernel/git/jack/linux-fs.git =
fsnotify
> > >
> > > in testcase: unixbench
> > > on test machine: 96 threads 2 sockets Intel(R) Xeon(R) CPU @ 2.30GHz =
with 128G memory
> > > with following parameters:
> > >
> > >         runtime: 300s
> > >         nr_task: 1
> > >         test: pipe
> > >         cpufreq_governor: performance
> > >         ucode: 0x4003006
> > >
> > > test-description: UnixBench is the original BYTE UNIX benchmark suite=
 aims to test performance of Unix-like system.
> > > test-url: https://github.com/kdlucas/byte-unixbench
> > >
> > > In addition to that, the commit also has significant impact on the fo=
llowing tests:
> > >
> > > +------------------+-------------------------------------------------=
------------------------------------+
> > > | testcase: change | will-it-scale: will-it-scale.per_thread_ops -1.3=
% regression                        |
> > > | test machine     | 192 threads 4 sockets Intel(R) Xeon(R) Platinum =
9242 CPU @ 2.30GHz with 192G memory |
> > > | test parameters  | cpufreq_governor=3Dperformance                  =
                                      |
> > > |                  | mode=3Dthread                                   =
                                      |
> > > |                  | nr_task=3D100%                                  =
                                      |
> > > |                  | test=3Deventfd1                                 =
                                      |
> > > |                  | ucode=3D0x5003006                               =
                                      |
> > > +------------------+-------------------------------------------------=
------------------------------------+
> > >
> > >
> > > If you fix the issue, kindly add following tag
> > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > >
> >
> > Gabriel,
> >
> > It looks like my change throws away much of the performance gain for
> > small IO on pipes without any watches that was achieved by commit
> > 71d734103edf ("fsnotify: Rearrange fast path to minimise overhead
> > when there is no watcher").
> >
> > I think the way to fix it is to lift the optimization in __fsnotify()
> > to the fsnotify_parent() inline wrapper as Mel considered doing
> > but was not sure it was worth the effort at the time.
> >
> > It's not completely trivial. I think it requires setting a flag
> > MNT_FSNOTIFY_WATCHED when there are watches on the
> > vfsmount. I will look into it.
> >
> =

> Oliver,
> =

> Would it be possible to request a re-test with the branch:
> https://github.com/amir73il/linux fsnotify-perf
> =

> The patch at the tip of that branch is the one this regression report
> has blamed.
> =

> My expectation is that the patch at fsnotify-perf^ ("fsnotify: optimize t=
he
> case of no marks of any type") will improve performance of the test case
> compared to baseline (v5.14-rc3) and that the patch at the tip of fsnotif=
y-perf
> would not regress performance.

we tested this branch and the results meet your expectation.

fsnotify-perf^ improves performance comparing to v5.14-rc3. tip is a little=
 worse
than its parent (-3.3%), but still better than v5.14-rc3.

below is detail data.


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/te=
stcase/ucode:
  gcc-9/performance/x86_64-rhel-8.3/1/debian-10.4-x86_64-20200603.cgz/300s/=
lkp-csl-2sp4/pipe/unixbench/0x4003006

commit: =

  v5.14-rc3
  23050d041 ("fsnotify: optimize the case of no marks of any type")
  7446ba772 ("fsnotify: pass arguments of fsnotify() in struct fsnotify_eve=
nt_info")

       v5.14-rc3 23050d0419441a02185e4ed5170 7446ba772ae107ab937cd04e880 =

---------------- --------------------------- --------------------------- =

         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \  =

      1562            +8.0%       1688            +4.5%       1633        u=
nixbench.score
    390.37            +0.0%     390.37            -0.0%     390.36        u=
nixbench.time.elapsed_time
    390.37            +0.0%     390.37            -0.0%     390.36        u=
nixbench.time.elapsed_time.max
    113.78 =C2=B1 91%    -100.0%       0.00           -84.4%      17.78 =C2=
=B1282%  unixbench.time.file_system_inputs
      3445 =C2=B1 89%    -100.0%       0.00           -82.6%     600.89 =C2=
=B1282%  unixbench.time.file_system_outputs
    560.89 =C2=B1 10%      -1.4%     553.00 =C2=B1  6%      -5.8%     528.2=
2 =C2=B1  3%  unixbench.time.involuntary_context_switches
     10032            -0.3%      10001            -0.2%      10008        u=
nixbench.time.maximum_resident_set_size
     50139            +0.1%      50173            -0.0%      50119        u=
nixbench.time.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096        u=
nixbench.time.page_size
     76.00            +0.0%      76.00            +0.0%      76.00        u=
nixbench.time.percent_of_cpu_this_job_got
    261.71            -0.9%     259.28            -0.8%     259.60        u=
nixbench.time.system_time
     36.96            +6.5%      39.38            +5.5%      39.01        u=
nixbench.time.user_time
    903.67 =C2=B1  5%      -6.7%     843.17            -5.1%     858.00 =C2=
=B1  4%  unixbench.time.voluntary_context_switches
 7.585e+08            +8.1%  8.198e+08            +4.5%  7.928e+08        u=
nixbench.workload
 3.646e+10            -0.2%   3.64e+10            +0.5%  3.665e+10        c=
puidle..time
  72938593 =C2=B1  9%      -2.4%   71214588 =C2=B1 11%      +2.7%   7487685=
4        cpuidle..usage
    427.95            -0.0%     427.80            +0.0%     428.09        u=
ptime.boot
     39776            -0.2%      39703            +0.4%      39920        u=
ptime.idle
     35.32            -0.1%      35.28            +0.1%      35.37        b=
oot-time.boot
     16.63            +0.1%      16.64            +0.3%      16.68        b=
oot-time.dhcp
      2897            -0.2%       2890            +1.0%       2926        b=
oot-time.idle
      0.97            +0.3%       0.98            +0.2%       0.98        b=
oot-time.smp_boot
     97.59            -0.2       97.44            +0.3       97.93        m=
pstat.cpu.all.idle%
      0.00 =C2=B1  5%      -0.0        0.00 =C2=B1  5%      +0.0        0.0=
0 =C2=B1  5%  mpstat.cpu.all.iowait%
      1.48 =C2=B1 25%      +0.1        1.62 =C2=B1 19%      -0.3        1.1=
6 =C2=B1  6%  mpstat.cpu.all.irq%
      0.08 =C2=B1 25%      +0.0        0.09 =C2=B1 23%      -0.0        0.0=
6 =C2=B1  6%  mpstat.cpu.all.soft%
      0.72            -0.0        0.72            -0.0        0.72        m=
pstat.cpu.all.sys%
      0.12            +0.0        0.13            +0.0        0.13        m=
pstat.cpu.all.usr%
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-numastat.node0.interleave_hit
    508271 =C2=B1 22%      -3.5%     490587 =C2=B1 15%      +2.8%     52230=
0 =C2=B1 14%  numa-numastat.node0.local_node
    568022 =C2=B1 18%      -3.8%     546713 =C2=B1 13%      +3.8%     58970=
4 =C2=B1 14%  numa-numastat.node0.numa_hit
     59789 =C2=B1 50%      -6.0%      56188 =C2=B1 47%     +12.7%      6739=
1 =C2=B1 34%  numa-numastat.node0.other_node
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-numastat.node1.interleave_hit
    433905 =C2=B1 25%      +4.2%     452129 =C2=B1 16%      -3.3%     41973=
0 =C2=B1 18%  numa-numastat.node1.local_node
    460898 =C2=B1 22%      +4.7%     482594 =C2=B1 15%      -4.7%     43902=
5 =C2=B1 19%  numa-numastat.node1.numa_hit
     26971 =C2=B1112%     +13.3%      30571 =C2=B1 86%     -28.1%      1940=
5 =C2=B1118%  numa-numastat.node1.other_node
    390.37            +0.0%     390.37            -0.0%     390.36        t=
ime.elapsed_time
    390.37            +0.0%     390.37            -0.0%     390.36        t=
ime.elapsed_time.max
    113.78 =C2=B1 91%    -100.0%       0.00           -84.4%      17.78 =C2=
=B1282%  time.file_system_inputs
      3445 =C2=B1 89%    -100.0%       0.00           -82.6%     600.89 =C2=
=B1282%  time.file_system_outputs
    560.89 =C2=B1 10%      -1.4%     553.00 =C2=B1  6%      -5.8%     528.2=
2 =C2=B1  3%  time.involuntary_context_switches
     10032            -0.3%      10001            -0.2%      10008        t=
ime.maximum_resident_set_size
     50139            +0.1%      50173            -0.0%      50119        t=
ime.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096        t=
ime.page_size
     76.00            +0.0%      76.00            +0.0%      76.00        t=
ime.percent_of_cpu_this_job_got
    261.71            -0.9%     259.28            -0.8%     259.60        t=
ime.system_time
     36.96            +6.5%      39.38            +5.5%      39.01        t=
ime.user_time
    903.67 =C2=B1  5%      -6.7%     843.17            -5.1%     858.00 =C2=
=B1  4%  time.voluntary_context_switches
     96.78            -0.5%      96.33            +0.3%      97.11        v=
mstat.cpu.id
      1.56 =C2=B1 31%      +7.1%       1.67 =C2=B1 28%     -35.7%       1.0=
0        vmstat.cpu.sy
      0.00          -100.0%       0.00          -100.0%       0.00        v=
mstat.cpu.us
      9.44 =C2=B1 89%    -100.0%       0.00           -80.0%       1.89 =C2=
=B1282%  vmstat.io.bi
      4.11 =C2=B1 89%    -100.0%       0.00           -81.1%       0.78 =C2=
=B1282%  vmstat.io.bo
      7.89 =C2=B1 44%     -49.3%       4.00           -39.4%       4.78 =C2=
=B1 46%  vmstat.memory.buff
   2508417            -0.1%    2504846            -0.1%    2505666        v=
mstat.memory.cache
 1.278e+08            +0.0%  1.278e+08            +0.0%  1.278e+08        v=
mstat.memory.free
      0.00          -100.0%       0.00          -100.0%       0.00        v=
mstat.procs.b
      0.00          -100.0%       0.00          -100.0%       0.00        v=
mstat.procs.r
      1488 =C2=B1  2%      +1.4%       1509 =C2=B1  9%      -0.7%       147=
8 =C2=B1  3%  vmstat.system.cs
    185829 =C2=B1  9%      -1.7%     182747 =C2=B1 11%      +3.3%     19202=
3        vmstat.system.in
     67.11 =C2=B1 13%      +2.2%      68.58 =C2=B1 12%     -14.9%      57.1=
1 =C2=B1  2%  turbostat.Avg_MHz
      3.87 =C2=B1 24%      +0.3        4.17 =C2=B1 20%      -0.9        2.9=
7 =C2=B1  4%  turbostat.Busy%
      1794 =C2=B1 13%      -6.4%       1679 =C2=B1  9%      +7.4%       192=
7 =C2=B1  5%  turbostat.Bzy_MHz
    774994 =C2=B1129%     +47.6%    1143588 =C2=B1194%     -11.3%     68747=
4 =C2=B1264%  turbostat.C1
      0.33 =C2=B1169%      +0.1        0.39 =C2=B1308%      -0.1        0.1=
9 =C2=B1271%  turbostat.C1%
  52685178 =C2=B1 37%     -10.0%   47392459 =C2=B1 44%     +40.0%   7374449=
8 =C2=B1  2%  turbostat.C1E
     53.64 =C2=B1 70%     -10.1       43.52 =C2=B1 87%     +42.8       96.4=
4        turbostat.C1E%
  19397931 =C2=B1 87%     +16.4%   22575610 =C2=B1 70%     -98.1%     37115=
2 =C2=B1 18%  turbostat.C6
     42.98 =C2=B1 88%      +9.9       52.84 =C2=B1 70%     -42.2        0.7=
7 =C2=B1 26%  turbostat.C6%
     86.37 =C2=B1 12%      -4.2%      82.74 =C2=B1 12%     +12.3%      97.0=
0        turbostat.CPU%c1
      9.76 =C2=B1100%     +34.1%      13.09 =C2=B1 74%     -99.7%       0.0=
3 =C2=B1 41%  turbostat.CPU%c6
     54.56 =C2=B1  2%      -3.0%      52.92 =C2=B1  3%      -1.2%      53.8=
9 =C2=B1  3%  turbostat.CoreTmp
  72993878 =C2=B1  9%      -1.7%   71782914 =C2=B1 11%      +3.4%   7545229=
4        turbostat.IRQ
      6.37 =C2=B1110%     +36.5%       8.69 =C2=B1 80%     -99.9%       0.0=
0 =C2=B1282%  turbostat.Pkg%pc2
      1.16 =C2=B1121%     +52.8%       1.78 =C2=B1 82%    -100.0%       0.0=
0        turbostat.Pkg%pc6
     54.89 =C2=B1  2%      -3.3%      53.08 =C2=B1  3%      -1.8%      53.8=
9 =C2=B1  3%  turbostat.PkgTmp
    107.25 =C2=B1  4%      -2.5%     104.52            +0.3%     107.56 =C2=
=B1  2%  turbostat.PkgWatt
     40.75            -0.6%      40.52            +0.1%      40.80        t=
urbostat.RAMWatt
      2295            -0.0%       2294            +0.0%       2295        t=
urbostat.TSC_MHz
     11595 =C2=B1  4%      -4.0%      11130 =C2=B1  3%      -4.1%      1112=
3 =C2=B1  3%  meminfo.Active
     10946 =C2=B1  2%      +0.1%      10953 =C2=B1  3%      -0.9%      1084=
6 =C2=B1  3%  meminfo.Active(anon)
    648.56 =C2=B1 63%     -72.8%     176.58 =C2=B1  2%     -57.2%     277.4=
4 =C2=B1 87%  meminfo.Active(file)
    184807            +0.1%     184995            +0.6%     185867        m=
eminfo.AnonHugePages
    260664            +0.4%     261637            +0.6%     262146        m=
eminfo.AnonPages
      7.89 =C2=B1 44%     -49.3%       4.00           -39.4%       4.78 =C2=
=B1 46%  meminfo.Buffers
   2404339            -0.1%    2400789            -0.1%    2401307        m=
eminfo.Cached
    201222            +0.1%     201365            +0.1%     201340        m=
eminfo.CmaFree
    204800            +0.0%     204800            +0.0%     204800        m=
eminfo.CmaTotal
  65839596            +0.0%   65839596            +0.0%   65839596        m=
eminfo.CommitLimit
    365007            +0.1%     365193            -0.0%     364843        m=
eminfo.Committed_AS
 1.221e+08            -0.1%   1.22e+08            -0.7%  1.213e+08        m=
eminfo.DirectMap1G
  13069880 =C2=B1 14%      +1.1%   13207381 =C2=B1 15%      +6.3%   1388839=
8 =C2=B1 17%  meminfo.DirectMap2M
    822421 =C2=B1  4%      -2.6%     801429 =C2=B1  3%      -0.4%     81946=
3 =C2=B1  5%  meminfo.DirectMap4k
      1.11 =C2=B1 89%    -100.0%       0.00           -80.0%       0.22 =C2=
=B1282%  meminfo.Dirty
      2048            +0.0%       2048            +0.0%       2048        m=
eminfo.Hugepagesize
    273336            -0.8%     271017            -0.6%     271801        m=
eminfo.Inactive
    270008            +0.3%     270869            +0.4%     271018        m=
eminfo.Inactive(anon)
      3327 =C2=B1 85%     -95.6%     147.25           -76.5%     782.89 =C2=
=B1229%  meminfo.Inactive(file)
    104056            -0.0%     104033            +0.3%     104340        m=
eminfo.KReclaimable
     16407            +0.6%      16499            +0.8%      16546        m=
eminfo.KernelStack
     35129            +0.3%      35223            +0.1%      35172        m=
eminfo.Mapped
 1.272e+08            +0.0%  1.272e+08            +0.0%  1.272e+08        m=
eminfo.MemAvailable
 1.278e+08            +0.0%  1.278e+08            +0.0%  1.278e+08        m=
eminfo.MemFree
 1.317e+08            +0.0%  1.317e+08            +0.0%  1.317e+08        m=
eminfo.MemTotal
   3891419            -0.1%    3887765            -0.1%    3888354        m=
eminfo.Memused
      1100 =C2=B1 65%     +18.3%       1301 =C2=B1 55%      +0.1%       110=
1 =C2=B1 65%  meminfo.Mlocked
      4027            +0.0%       4028            -0.3%       4014        m=
eminfo.PageTables
     47685            -0.0%      47665            -0.3%      47541        m=
eminfo.Percpu
    104056            -0.0%     104033            +0.3%     104340        m=
eminfo.SReclaimable
    195896            -0.2%     195533            +0.4%     196756        m=
eminfo.SUnreclaim
     20527            +0.0%      20537            -0.8%      20362        m=
eminfo.Shmem
    299953            -0.1%     299567            +0.4%     301097        m=
eminfo.Slab
   2380001            +0.0%    2380119            +0.0%    2380047        m=
eminfo.Unevictable
 3.436e+10            +0.0%  3.436e+10            +0.0%  3.436e+10        m=
eminfo.VmallocTotal
    170334            +0.1%     170435            +0.1%     170510        m=
eminfo.VmallocUsed
      0.11 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    meminfo.Writeback
   4253511            +0.0%    4253640            -0.1%    4248176        m=
eminfo.max_used_kB
      3331 =C2=B1 46%     +11.1%       3702 =C2=B1 41%     +12.9%       376=
1 =C2=B1 42%  numa-meminfo.node0.Active
      2685 =C2=B1 53%     +31.8%       3539 =C2=B1 42%     +31.3%       352=
6 =C2=B1 41%  numa-meminfo.node0.Active(anon)
    645.44 =C2=B1 63%     -74.9%     161.92 =C2=B1 30%     -63.6%     234.7=
8 =C2=B1115%  numa-meminfo.node0.Active(file)
    176640 =C2=B1  4%      -9.6%     159633 =C2=B1 30%     -14.9%     15024=
1 =C2=B1 38%  numa-meminfo.node0.AnonHugePages
    235558 =C2=B1  3%      -8.4%     215743 =C2=B1 27%     -13.9%     20273=
2 =C2=B1 35%  numa-meminfo.node0.AnonPages
    243183 =C2=B1  4%      -6.7%     226936 =C2=B1 26%     -13.7%     20984=
8 =C2=B1 32%  numa-meminfo.node0.AnonPages.max
      0.44 =C2=B1187%    -100.0%       0.00          -100.0%       0.00    =
    numa-meminfo.node0.Dirty
   1649175 =C2=B1 58%     +20.8%    1992434 =C2=B1 38%     +27.9%    210982=
8 =C2=B1 31%  numa-meminfo.node0.FilePages
    244464 =C2=B1  3%     -10.0%     220102 =C2=B1 28%     -14.8%     20818=
6 =C2=B1 33%  numa-meminfo.node0.Inactive
    242388 =C2=B1  3%      -9.3%     219966 =C2=B1 28%     -14.4%     20744=
5 =C2=B1 33%  numa-meminfo.node0.Inactive(anon)
      2075 =C2=B1128%     -93.5%     134.92 =C2=B1 30%     -64.3%     740.3=
3 =C2=B1240%  numa-meminfo.node0.Inactive(file)
     65344 =C2=B1 23%      +6.2%      69380 =C2=B1 24%      +7.1%      7000=
4 =C2=B1 18%  numa-meminfo.node0.KReclaimable
      9492 =C2=B1  4%      -1.6%       9338 =C2=B1  5%      -8.6%       867=
4 =C2=B1  7%  numa-meminfo.node0.KernelStack
     25629 =C2=B1 41%      +8.4%      27785 =C2=B1 34%     +12.1%      2873=
3 =C2=B1 29%  numa-meminfo.node0.Mapped
  63052050            -0.4%   62775986            -0.6%   62655763        n=
uma-meminfo.node0.MemFree
  65665512            +0.0%   65665512            +0.0%   65665512        n=
uma-meminfo.node0.MemTotal
   2613460 =C2=B1 38%     +10.6%    2889524 =C2=B1 28%     +15.2%    300974=
7 =C2=B1 23%  numa-meminfo.node0.MemUsed
    831.11 =C2=B1 92%     +45.9%       1212 =C2=B1 64%     +26.2%       104=
9 =C2=B1 73%  numa-meminfo.node0.Mlocked
      3019 =C2=B1  5%      -6.8%       2813 =C2=B1 21%     -13.4%       261=
5 =C2=B1 26%  numa-meminfo.node0.PageTables
     65344 =C2=B1 23%      +6.2%      69380 =C2=B1 24%      +7.1%      7000=
4 =C2=B1 18%  numa-meminfo.node0.SReclaimable
    114422 =C2=B1  7%      -5.1%     108617 =C2=B1 12%      -7.7%     10563=
7 =C2=B1  8%  numa-meminfo.node0.SUnreclaim
      9968 =C2=B1 44%     -17.9%       8180 =C2=B1 59%     -12.7%       870=
2 =C2=B1 57%  numa-meminfo.node0.Shmem
    179767 =C2=B1  8%      -1.0%     177998 =C2=B1 15%      -2.3%     17564=
1 =C2=B1 11%  numa-meminfo.node0.Slab
   1636644 =C2=B1 59%     +21.2%    1984121 =C2=B1 38%     +28.3%    210030=
0 =C2=B1 31%  numa-meminfo.node0.Unevictable
      0.11 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    numa-meminfo.node0.Writeback
      8243 =C2=B1 16%     -10.1%       7411 =C2=B1 21%     -10.9%       734=
7 =C2=B1 22%  numa-meminfo.node1.Active
      8240 =C2=B1 16%     -10.2%       7397 =C2=B1 21%     -11.4%       730=
4 =C2=B1 22%  numa-meminfo.node1.Active(anon)
      3.11 =C2=B1187%    +371.4%      14.67 =C2=B1331%   +1271.4%      42.6=
7 =C2=B1187%  numa-meminfo.node1.Active(file)
      8134 =C2=B1 95%    +211.4%      25330 =C2=B1193%    +337.7%      3560=
6 =C2=B1163%  numa-meminfo.node1.AnonHugePages
     25161 =C2=B1 30%     +82.6%      45942 =C2=B1131%    +136.3%      5945=
6 =C2=B1120%  numa-meminfo.node1.AnonPages
     51771 =C2=B1 22%     +39.7%      72336 =C2=B1 82%     +67.2%      8653=
7 =C2=B1 80%  numa-meminfo.node1.AnonPages.max
      0.67 =C2=B1141%    -100.0%       0.00           -66.7%       0.22 =C2=
=B1282%  numa-meminfo.node1.Dirty
    755159 =C2=B1128%     -45.9%     408353 =C2=B1189%     -61.4%     29147=
2 =C2=B1224%  numa-meminfo.node1.FilePages
     28934 =C2=B1 29%     +76.2%      50974 =C2=B1121%    +120.0%      6366=
1 =C2=B1109%  numa-meminfo.node1.Inactive
     27681 =C2=B1 30%     +84.1%      50962 =C2=B1121%    +129.8%      6361=
8 =C2=B1108%  numa-meminfo.node1.Inactive(anon)
      1252 =C2=B1185%     -99.0%      12.33 =C2=B1331%     -96.6%      42.4=
4 =C2=B1146%  numa-meminfo.node1.Inactive(file)
     38709 =C2=B1 37%     -10.5%      34650 =C2=B1 50%     -11.3%      3433=
3 =C2=B1 39%  numa-meminfo.node1.KReclaimable
      6917 =C2=B1  5%      +3.5%       7160 =C2=B1  8%     +13.8%       787=
2 =C2=B1  8%  numa-meminfo.node1.KernelStack
      9521 =C2=B1110%     -21.6%       7460 =C2=B1125%     -32.2%       645=
2 =C2=B1132%  numa-meminfo.node1.Mapped
  64734839            +0.4%   65014696            +0.6%   65134389        n=
uma-meminfo.node1.MemFree
  66013684            +0.0%   66013684            +0.0%   66013684        n=
uma-meminfo.node1.MemTotal
   1278843 =C2=B1 79%     -21.9%     998986 =C2=B1 83%     -31.2%     87929=
3 =C2=B1 79%  numa-meminfo.node1.MemUsed
    267.67 =C2=B1189%     -67.2%      87.67 =C2=B1175%     -81.2%      50.3=
3 =C2=B1240%  numa-meminfo.node1.Mlocked
      1007 =C2=B1 16%     +20.5%       1213 =C2=B1 50%     +38.9%       139=
9 =C2=B1 49%  numa-meminfo.node1.PageTables
     38709 =C2=B1 37%     -10.5%      34650 =C2=B1 50%     -11.3%      3433=
3 =C2=B1 39%  numa-meminfo.node1.SReclaimable
     81477 =C2=B1 12%      +6.7%      86919 =C2=B1 18%     +11.8%      9112=
0 =C2=B1 11%  numa-meminfo.node1.SUnreclaim
     10546 =C2=B1 40%     +17.1%      12352 =C2=B1 38%     +10.4%      1164=
7 =C2=B1 41%  numa-meminfo.node1.Shmem
    120186 =C2=B1 12%      +1.2%     121570 =C2=B1 24%      +4.4%     12545=
4 =C2=B1 18%  numa-meminfo.node1.Slab
    743356 =C2=B1130%     -46.7%     395996 =C2=B1195%     -62.4%     27974=
5 =C2=B1233%  numa-meminfo.node1.Unevictable
    392.00            +0.0%     392.00            +0.0%     392.00        p=
roc-vmstat.cma_alloc_success
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.compact_isolated
    385.67 =C2=B1  5%      -2.7%     375.42 =C2=B1  4%      -0.4%     384.2=
2 =C2=B1  5%  proc-vmstat.direct_map_level2_splits
      9.56 =C2=B1 18%      +0.3%       9.58 =C2=B1 22%      +7.0%      10.2=
2 =C2=B1 22%  proc-vmstat.direct_map_level3_splits
      2734 =C2=B1  2%      +0.1%       2737 =C2=B1  3%      -0.8%       271=
1 =C2=B1  3%  proc-vmstat.nr_active_anon
    161.78 =C2=B1 63%     -73.1%      43.58 =C2=B1  2%     -57.5%      68.7=
8 =C2=B1 88%  proc-vmstat.nr_active_file
     65169            +0.4%      65410            +0.6%      65536        p=
roc-vmstat.nr_anon_pages
     89.78            -0.0%      89.75            +0.7%      90.44        p=
roc-vmstat.nr_anon_transparent_hugepages
    444.00 =C2=B1 89%    -100.0%       0.00           -82.5%      77.78 =C2=
=B1282%  proc-vmstat.nr_dirtied
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.nr_dirty
   3174707            +0.0%    3174712            +0.0%    3174717        p=
roc-vmstat.nr_dirty_background_threshold
   6357177            +0.0%    6357187            +0.0%    6357197        p=
roc-vmstat.nr_dirty_threshold
    601084            -0.1%     600197            -0.1%     600327        p=
roc-vmstat.nr_file_pages
     50305            +0.1%      50341            +0.1%      50335        p=
roc-vmstat.nr_free_cma
  31946873            +0.0%   31947836            +0.0%   31947701        p=
roc-vmstat.nr_free_pages
     67505            +0.3%      67718            +0.4%      67754        p=
roc-vmstat.nr_inactive_anon
    831.33 =C2=B1 85%     -95.6%      36.25           -76.5%     195.33 =C2=
=B1229%  proc-vmstat.nr_inactive_file
     16409            +0.5%      16497            +0.8%      16547        p=
roc-vmstat.nr_kernel_stack
      8782            +0.3%       8805            +0.1%       8793        p=
roc-vmstat.nr_mapped
    274.44 =C2=B1 65%     +18.4%     324.83 =C2=B1 55%      +0.2%     274.8=
9 =C2=B1 65%  proc-vmstat.nr_mlock
      1006            -0.0%       1006            -0.3%       1003        p=
roc-vmstat.nr_page_table_pages
      5129            +0.1%       5133            -0.8%       5090        p=
roc-vmstat.nr_shmem
     26013            -0.0%      26007            +0.3%      26084        p=
roc-vmstat.nr_slab_reclaimable
     48974            -0.2%      48883            +0.4%      49188        p=
roc-vmstat.nr_slab_unreclaimable
    595000            +0.0%     595029            +0.0%     595011        p=
roc-vmstat.nr_unevictable
    444.00 =C2=B1 89%    -100.0%       0.00           -82.5%      77.78 =C2=
=B1282%  proc-vmstat.nr_written
      2734 =C2=B1  2%      +0.1%       2737 =C2=B1  3%      -0.8%       271=
1 =C2=B1  3%  proc-vmstat.nr_zone_active_anon
    161.78 =C2=B1 63%     -73.1%      43.58 =C2=B1  2%     -57.5%      68.7=
8 =C2=B1 88%  proc-vmstat.nr_zone_active_file
     67505            +0.3%      67718            +0.4%      67754        p=
roc-vmstat.nr_zone_inactive_anon
    831.33 =C2=B1 85%     -95.6%      36.25           -76.5%     195.33 =C2=
=B1229%  proc-vmstat.nr_zone_inactive_file
    595000            +0.0%     595029            +0.0%     595011        p=
roc-vmstat.nr_zone_unevictable
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.nr_zone_write_pending
    528.00 =C2=B1166%    +144.6%       1291 =C2=B1202%      +7.7%     568.5=
6 =C2=B1251%  proc-vmstat.numa_hint_faults
    297.78 =C2=B1238%    +117.2%     646.75 =C2=B1301%     -82.6%      51.7=
8 =C2=B1 33%  proc-vmstat.numa_hint_faults_local
   1033052            +0.1%    1034106            +0.5%    1037901        p=
roc-vmstat.numa_hit
     58.67 =C2=B1 35%      -1.8%      57.58 =C2=B1 37%      -5.3%      55.5=
6 =C2=B1 36%  proc-vmstat.numa_huge_pte_updates
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.numa_interleave
    946308            +0.2%     948540            +0.5%     951201        p=
roc-vmstat.numa_local
     86760            -0.0%      86760            +0.0%      86797        p=
roc-vmstat.numa_other
    684.11 =C2=B1252%    +224.6%       2220 =C2=B1241%    +257.7%       244=
7 =C2=B1280%  proc-vmstat.numa_pages_migrated
     32541 =C2=B1 38%      +6.3%      34605 =C2=B1 48%      -4.9%      3094=
0 =C2=B1 53%  proc-vmstat.numa_pte_updates
      3208 =C2=B1  8%      -6.3%       3005 =C2=B1  9%      -4.6%       306=
0 =C2=B1  8%  proc-vmstat.pgactivate
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.pgalloc_dma
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.pgalloc_dma32
   1035736            +0.0%    1035978            +0.0%    1035903        p=
roc-vmstat.pgalloc_normal
   1168271            +0.2%    1170241            +0.1%    1169796        p=
roc-vmstat.pgfault
   1070341            +0.1%    1071645            +0.1%    1071935        p=
roc-vmstat.pgfree
    684.11 =C2=B1252%    +224.6%       2220 =C2=B1241%    +257.7%       244=
7 =C2=B1280%  proc-vmstat.pgmigrate_success
      3763 =C2=B1 89%    -100.0%       0.00           -80.1%     750.22 =C2=
=B1282%  proc-vmstat.pgpgin
      1789 =C2=B1 89%    -100.0%       0.00           -82.5%     313.78 =C2=
=B1282%  proc-vmstat.pgpgout
     83209            +0.0%      83237            +0.7%      83775        p=
roc-vmstat.pgreuse
     97.22            -0.3%      96.92            -0.1%      97.11        p=
roc-vmstat.thp_collapse_alloc
      0.78 =C2=B1157%     -35.7%       0.50 =C2=B1223%     -85.7%       0.1=
1 =C2=B1282%  proc-vmstat.thp_deferred_split_page
     12.33 =C2=B1  5%      +0.7%      12.42 =C2=B1  5%      -2.7%      12.0=
0        proc-vmstat.thp_fault_alloc
      0.89 =C2=B1245%    +246.9%       3.08 =C2=B1322%    +325.0%       3.7=
8 =C2=B1282%  proc-vmstat.thp_migration_success
      0.78 =C2=B1157%     -35.7%       0.50 =C2=B1223%     -85.7%       0.1=
1 =C2=B1282%  proc-vmstat.thp_split_pmd
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.thp_zero_page_alloc
    113.11            +0.9%     114.17            +0.7%     113.89        p=
roc-vmstat.unevictable_pgs_culled
    586.00            +0.0%     586.00            +0.0%     586.00        p=
roc-vmstat.unevictable_pgs_mlocked
    671.00 =C2=B1 53%     +31.8%     884.58 =C2=B1 42%     +31.3%     881.1=
1 =C2=B1 41%  numa-vmstat.node0.nr_active_anon
    161.00 =C2=B1 63%     -75.2%      39.92 =C2=B1 30%     -63.8%      58.2=
2 =C2=B1116%  numa-vmstat.node0.nr_active_file
     58889 =C2=B1  3%      -8.4%      53935 =C2=B1 27%     -13.9%      5068=
3 =C2=B1 35%  numa-vmstat.node0.nr_anon_pages
     85.67 =C2=B1  4%      -9.6%      77.42 =C2=B1 30%     -14.9%      72.8=
9 =C2=B1 39%  numa-vmstat.node0.nr_anon_transparent_hugepages
    376.67 =C2=B1 89%    -100.0%       0.00           -82.7%      65.11 =C2=
=B1282%  numa-vmstat.node0.nr_dirtied
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-vmstat.node0.nr_dirty
    412293 =C2=B1 58%     +20.8%     498108 =C2=B1 38%     +27.9%     52745=
6 =C2=B1 31%  numa-vmstat.node0.nr_file_pages
     50305            +0.1%      50341            +0.1%      50335        n=
uma-vmstat.node0.nr_free_cma
  15763023            -0.4%   15693998            -0.6%   15663929        n=
uma-vmstat.node0.nr_free_pages
     60596 =C2=B1  3%      -9.2%      54991 =C2=B1 28%     -14.4%      5186=
1 =C2=B1 33%  numa-vmstat.node0.nr_inactive_anon
    518.78 =C2=B1128%     -93.6%      33.17 =C2=B1 30%     -64.4%     184.7=
8 =C2=B1241%  numa-vmstat.node0.nr_inactive_file
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-vmstat.node0.nr_isolated_anon
      9491 =C2=B1  4%      -1.6%       9341 =C2=B1  5%      -8.6%       867=
6 =C2=B1  7%  numa-vmstat.node0.nr_kernel_stack
      6408 =C2=B1 41%      +8.4%       6946 =C2=B1 34%     +12.1%       718=
4 =C2=B1 29%  numa-vmstat.node0.nr_mapped
    207.56 =C2=B1 93%     +45.9%     302.83 =C2=B1 64%     +26.2%     261.8=
9 =C2=B1 73%  numa-vmstat.node0.nr_mlock
    753.89 =C2=B1  5%      -6.7%     703.67 =C2=B1 21%     -13.3%     653.7=
8 =C2=B1 26%  numa-vmstat.node0.nr_page_table_pages
      2492 =C2=B1 44%     -17.9%       2044 =C2=B1 59%     -12.7%       217=
5 =C2=B1 57%  numa-vmstat.node0.nr_shmem
     16335 =C2=B1 23%      +6.2%      17344 =C2=B1 24%      +7.1%      1750=
0 =C2=B1 18%  numa-vmstat.node0.nr_slab_reclaimable
     28605 =C2=B1  7%      -5.1%      27153 =C2=B1 12%      -7.7%      2640=
8 =C2=B1  8%  numa-vmstat.node0.nr_slab_unreclaimable
    409160 =C2=B1 59%     +21.2%     496029 =C2=B1 38%     +28.3%     52507=
4 =C2=B1 31%  numa-vmstat.node0.nr_unevictable
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-vmstat.node0.nr_writeback
    376.44 =C2=B1 89%    -100.0%       0.00           -82.7%      65.11 =C2=
=B1282%  numa-vmstat.node0.nr_written
    671.00 =C2=B1 53%     +31.8%     884.58 =C2=B1 42%     +31.3%     881.1=
1 =C2=B1 41%  numa-vmstat.node0.nr_zone_active_anon
    161.00 =C2=B1 63%     -75.2%      39.92 =C2=B1 30%     -63.8%      58.2=
2 =C2=B1116%  numa-vmstat.node0.nr_zone_active_file
     60596 =C2=B1  3%      -9.2%      54991 =C2=B1 28%     -14.4%      5186=
1 =C2=B1 33%  numa-vmstat.node0.nr_zone_inactive_anon
    518.78 =C2=B1128%     -93.6%      33.17 =C2=B1 30%     -64.4%     184.7=
8 =C2=B1241%  numa-vmstat.node0.nr_zone_inactive_file
    409160 =C2=B1 59%     +21.2%     496029 =C2=B1 38%     +28.3%     52507=
4 =C2=B1 31%  numa-vmstat.node0.nr_zone_unevictable
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-vmstat.node0.nr_zone_write_pending
   1661451 =C2=B1 13%      +2.6%    1704304 =C2=B1 15%      +5.4%    175162=
3 =C2=B1 12%  numa-vmstat.node0.numa_hit
      3894 =C2=B1  8%      +0.3%       3905 =C2=B1  5%      -0.6%       387=
2 =C2=B1  6%  numa-vmstat.node0.numa_interleave
   1598537 =C2=B1 14%      +2.9%    1645037 =C2=B1 16%      +5.1%    168076=
8 =C2=B1 12%  numa-vmstat.node0.numa_local
     62954 =C2=B1 49%      -4.3%      60267 =C2=B1 44%     +12.6%      7085=
6 =C2=B1 30%  numa-vmstat.node0.numa_other
      2060 =C2=B1 16%     -10.2%       1849 =C2=B1 21%     -11.4%       182=
5 =C2=B1 22%  numa-vmstat.node1.nr_active_anon
      0.67 =C2=B1187%    +450.0%       3.67 =C2=B1331%   +1500.0%      10.6=
7 =C2=B1187%  numa-vmstat.node1.nr_active_file
      6291 =C2=B1 30%     +82.6%      11487 =C2=B1131%    +136.3%      1486=
6 =C2=B1120%  numa-vmstat.node1.nr_anon_pages
      3.44 =C2=B1105%    +243.5%      11.83 =C2=B1201%    +383.9%      16.6=
7 =C2=B1171%  numa-vmstat.node1.nr_anon_transparent_hugepages
      7.00 =C2=B1141%    -100.0%       0.00           -66.7%       2.33 =C2=
=B1282%  numa-vmstat.node1.nr_dirtied
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-vmstat.node1.nr_dirty
    188791 =C2=B1128%     -45.9%     102090 =C2=B1189%     -61.4%      7286=
8 =C2=B1224%  numa-vmstat.node1.nr_file_pages
  16183708            +0.4%   16253674            +0.6%   16283582        n=
uma-vmstat.node1.nr_free_pages
      6923 =C2=B1 30%     +84.1%      12744 =C2=B1121%    +129.8%      1590=
7 =C2=B1108%  numa-vmstat.node1.nr_inactive_anon
    313.11 =C2=B1185%     -99.0%       3.08 =C2=B1331%     -96.6%      10.5=
6 =C2=B1147%  numa-vmstat.node1.nr_inactive_file
      6916 =C2=B1  5%      +3.5%       7159 =C2=B1  8%     +13.8%       787=
4 =C2=B1  8%  numa-vmstat.node1.nr_kernel_stack
      2381 =C2=B1110%     -21.6%       1866 =C2=B1125%     -32.2%       161=
3 =C2=B1132%  numa-vmstat.node1.nr_mapped
     66.89 =C2=B1189%     -67.2%      21.92 =C2=B1175%     -81.2%      12.5=
6 =C2=B1241%  numa-vmstat.node1.nr_mlock
    251.33 =C2=B1 15%     +20.5%     302.75 =C2=B1 50%     +39.3%     350.1=
1 =C2=B1 49%  numa-vmstat.node1.nr_page_table_pages
      2638 =C2=B1 40%     +17.1%       3089 =C2=B1 38%     +10.4%       291=
2 =C2=B1 41%  numa-vmstat.node1.nr_shmem
      9677 =C2=B1 37%     -10.5%       8662 =C2=B1 50%     -11.3%       858=
2 =C2=B1 39%  numa-vmstat.node1.nr_slab_reclaimable
     20368 =C2=B1 12%      +6.7%      21729 =C2=B1 18%     +11.8%      2277=
9 =C2=B1 11%  numa-vmstat.node1.nr_slab_unreclaimable
    185838 =C2=B1130%     -46.7%      98998 =C2=B1195%     -62.4%      6993=
5 =C2=B1233%  numa-vmstat.node1.nr_unevictable
      7.00 =C2=B1141%    -100.0%       0.00           -66.7%       2.33 =C2=
=B1282%  numa-vmstat.node1.nr_written
      2060 =C2=B1 16%     -10.2%       1849 =C2=B1 21%     -11.4%       182=
5 =C2=B1 22%  numa-vmstat.node1.nr_zone_active_anon
      0.67 =C2=B1187%    +450.0%       3.67 =C2=B1331%   +1500.0%      10.6=
7 =C2=B1187%  numa-vmstat.node1.nr_zone_active_file
      6923 =C2=B1 30%     +84.1%      12743 =C2=B1121%    +129.8%      1590=
7 =C2=B1108%  numa-vmstat.node1.nr_zone_inactive_anon
    313.11 =C2=B1185%     -99.0%       3.08 =C2=B1331%     -96.6%      10.5=
6 =C2=B1147%  numa-vmstat.node1.nr_zone_inactive_file
    185838 =C2=B1130%     -46.7%      98998 =C2=B1195%     -62.4%      6993=
5 =C2=B1233%  numa-vmstat.node1.nr_zone_unevictable
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-vmstat.node1.nr_zone_write_pending
    923522 =C2=B1 24%      -4.1%     886107 =C2=B1 29%      -9.2%     83869=
5 =C2=B1 26%  numa-vmstat.node1.numa_hit
      3652 =C2=B1  8%      -0.1%       3650 =C2=B1  6%      +0.9%       368=
5 =C2=B1  6%  numa-vmstat.node1.numa_interleave
    886782 =C2=B1 26%      -4.5%     846839 =C2=B1 32%      -8.7%     81003=
0 =C2=B1 25%  numa-vmstat.node1.numa_local
     36727 =C2=B1 84%      +7.2%      39378 =C2=B1 68%     -21.7%      2874=
1 =C2=B1 76%  numa-vmstat.node1.numa_other
     13.36 =C2=B1 85%     +28.8%      17.20 =C2=B1 67%     -89.9%       1.3=
6 =C2=B1  3%  perf-stat.i.MPKI
 9.529e+08            -1.6%   9.38e+08            -2.1%  9.327e+08        p=
erf-stat.i.branch-instructions
      2.12 =C2=B1 53%      +0.3        2.37 =C2=B1 48%      -1.2        0.9=
2        perf-stat.i.branch-miss-rate%
  12593796 =C2=B1 34%      -0.6%   12517767 =C2=B1 34%     -37.8%    783653=
6        perf-stat.i.branch-misses
      5.54 =C2=B1 36%      -0.5        5.07 =C2=B1 41%      +2.6        8.1=
2 =C2=B1  5%  perf-stat.i.cache-miss-rate%
   1100829 =C2=B1 63%     +15.7%    1273764 =C2=B1 52%     -69.8%     33257=
3 =C2=B1  7%  perf-stat.i.cache-misses
  27486243 =C2=B1 77%     +23.0%   33803685 =C2=B1 62%     -85.7%    393355=
0 =C2=B1  3%  perf-stat.i.cache-references
      1422 =C2=B1  2%      +1.5%       1443 =C2=B1  9%      -0.6%       141=
4 =C2=B1  3%  perf-stat.i.context-switches
      1.94 =C2=B1 26%      +6.6%       2.07 =C2=B1 25%     -30.5%       1.3=
5 =C2=B1  3%  perf-stat.i.cpi
     96002            +0.0%      96003            +0.0%      96002        p=
erf-stat.i.cpu-clock
 5.879e+09 =C2=B1 14%      +1.5%  5.968e+09 =C2=B1 14%     -17.4%  4.854e+0=
9 =C2=B1  3%  perf-stat.i.cpu-cycles
     98.53            +0.0%      98.54            +0.1%      98.64        p=
erf-stat.i.cpu-migrations
     10513 =C2=B1 68%     -18.8%       8541 =C2=B1 74%     +61.8%      1701=
5 =C2=B1  8%  perf-stat.i.cycles-between-cache-misses
      0.15 =C2=B1 89%      +0.0        0.18 =C2=B1 71%      -0.1        0.0=
0 =C2=B1  9%  perf-stat.i.dTLB-load-miss-rate%
    882684 =C2=B1 88%     +16.5%    1027981 =C2=B1 71%     -98.4%      1425=
8 =C2=B1  8%  perf-stat.i.dTLB-load-misses
 1.433e+09            +0.0%  1.434e+09            -0.7%  1.423e+09        p=
erf-stat.i.dTLB-loads
      0.03 =C2=B1 86%      +0.0        0.04 =C2=B1 69%      -0.0        0.0=
0 =C2=B1  2%  perf-stat.i.dTLB-store-miss-rate%
    112250 =C2=B1 83%     +15.1%     129192 =C2=B1 67%     -93.3%       749=
9        perf-stat.i.dTLB-store-misses
  8.75e+08            -3.8%  8.418e+08            -5.3%  8.285e+08        p=
erf-stat.i.dTLB-stores
     76.52 =C2=B1  6%      -0.5       75.98 =C2=B1  6%      -3.5       73.0=
2        perf-stat.i.iTLB-load-miss-rate%
   5320929           -18.5%    4337810 =C2=B1  4%      +0.8%    5364196    =
    perf-stat.i.iTLB-load-misses
   1210384 =C2=B1 24%     -11.2%    1074564 =C2=B1 26%     +19.4%    144479=
9 =C2=B1  2%  perf-stat.i.iTLB-loads
  4.83e+09            -1.1%  4.775e+09            -1.7%  4.747e+09        p=
erf-stat.i.instructions
    980.79 =C2=B1  2%     +19.7%       1174 =C2=B1  6%      -2.7%     954.3=
6        perf-stat.i.instructions-per-iTLB-miss
      0.80 =C2=B1 12%      -1.9%       0.79 =C2=B1 13%     +13.9%       0.9=
2 =C2=B1  2%  perf-stat.i.ipc
      0.61 =C2=B1 22%      +5.4%       0.64 =C2=B1 17%      +5.0%       0.6=
4 =C2=B1 23%  perf-stat.i.major-faults
      0.06 =C2=B1 14%      +1.5%       0.06 =C2=B1 14%     -17.4%       0.0=
5 =C2=B1  3%  perf-stat.i.metric.GHz
    313.74 =C2=B1 75%     +23.1%     386.17 =C2=B1 61%     -82.1%      56.2=
6 =C2=B1  2%  perf-stat.i.metric.K/sec
     33.96            -1.5%      33.45            -2.3%      33.17        p=
erf-stat.i.metric.M/sec
      2694            -0.0%       2694            +0.1%       2696        p=
erf-stat.i.minor-faults
     86.80 =C2=B1  2%      +0.5       87.28 =C2=B1  2%      +3.7       90.5=
0        perf-stat.i.node-load-miss-rate%
     58546 =C2=B1 16%      +5.7%      61885 =C2=B1 17%     +24.1%      7265=
9 =C2=B1  8%  perf-stat.i.node-load-misses
     11768 =C2=B1  8%      -1.6%      11585 =C2=B1  8%     -15.6%       992=
8 =C2=B1 16%  perf-stat.i.node-loads
     73.58 =C2=B1 16%      -0.4       73.15 =C2=B1 25%     +13.8       87.4=
1 =C2=B1 17%  perf-stat.i.node-store-miss-rate%
     25184 =C2=B1 14%      +6.3%      26770 =C2=B1 28%     +20.4%      3031=
7 =C2=B1 19%  perf-stat.i.node-store-misses
     11083 =C2=B1 36%      +3.4%      11464 =C2=B1 50%     -44.3%       617=
5 =C2=B1 72%  perf-stat.i.node-stores
      2695            -0.0%       2694            +0.1%       2697        p=
erf-stat.i.page-faults
     96002            +0.0%      96003            +0.0%      96002        p=
erf-stat.i.task-clock
      5.71 =C2=B1 77%     +24.1%       7.09 =C2=B1 62%     -85.5%       0.8=
3 =C2=B1  3%  perf-stat.overall.MPKI
      1.32 =C2=B1 34%      +0.0        1.34 =C2=B1 34%      -0.5        0.8=
4        perf-stat.overall.branch-miss-rate%
      5.70 =C2=B1 38%      -0.5        5.18 =C2=B1 43%      +2.7        8.4=
5 =C2=B1  5%  perf-stat.overall.cache-miss-rate%
      1.22 =C2=B1 14%      +2.6%       1.25 =C2=B1 14%     -16.0%       1.0=
2 =C2=B1  2%  perf-stat.overall.cpi
      9179 =C2=B1 65%     -18.8%       7449 =C2=B1 70%     +59.8%      1466=
9 =C2=B1  7%  perf-stat.overall.cycles-between-cache-misses
      0.06 =C2=B1 88%      +0.0        0.07 =C2=B1 71%      -0.1        0.0=
0 =C2=B1  8%  perf-stat.overall.dTLB-load-miss-rate%
      0.01 =C2=B1 83%      +0.0        0.02 =C2=B1 67%      -0.0        0.0=
0        perf-stat.overall.dTLB-store-miss-rate%
     81.65 =C2=B1  4%      -1.2       80.41 =C2=B1  4%      -2.9       78.7=
8        perf-stat.overall.iTLB-load-miss-rate%
    907.89           +21.6%       1103 =C2=B1  5%      -2.5%     885.40 =C2=
=B1  2%  perf-stat.overall.instructions-per-iTLB-miss
      0.84 =C2=B1 14%      -2.5%       0.82 =C2=B1 15%     +16.7%       0.9=
8 =C2=B1  2%  perf-stat.overall.ipc
     82.90 =C2=B1  3%      +1.0       83.91 =C2=B1  3%      +5.0       87.9=
2 =C2=B1  2%  perf-stat.overall.node-load-miss-rate%
     69.61 =C2=B1 15%      -0.0       69.61 =C2=B1 23%     +13.0       82.5=
7 =C2=B1 17%  perf-stat.overall.node-store-miss-rate%
      2484            -8.6%       2271            -6.0%       2335        p=
erf-stat.overall.path-length
 9.504e+08            -1.6%  9.354e+08            -2.1%  9.303e+08        p=
erf-stat.ps.branch-instructions
  12563461 =C2=B1 34%      -0.6%   12486690 =C2=B1 34%     -37.8%    781796=
6        perf-stat.ps.branch-misses
   1098102 =C2=B1 63%     +15.7%    1270644 =C2=B1 52%     -69.8%     33169=
4 =C2=B1  7%  perf-stat.ps.cache-misses
  27418760 =C2=B1 77%     +23.0%   33722634 =C2=B1 62%     -85.7%    392360=
2 =C2=B1  3%  perf-stat.ps.cache-references
      1418 =C2=B1  2%      +1.5%       1439 =C2=B1  9%      -0.6%       141=
0 =C2=B1  3%  perf-stat.ps.context-switches
     95755            +0.0%      95755            +0.0%      95755        p=
erf-stat.ps.cpu-clock
 5.864e+09 =C2=B1 14%      +1.5%  5.952e+09 =C2=B1 14%     -17.4%  4.841e+0=
9 =C2=B1  3%  perf-stat.ps.cpu-cycles
     98.28            +0.0%      98.28            +0.1%      98.39        p=
erf-stat.ps.cpu-migrations
    880507 =C2=B1 88%     +16.5%    1025511 =C2=B1 71%     -98.4%      1422=
2 =C2=B1  8%  perf-stat.ps.dTLB-load-misses
 1.429e+09            +0.0%   1.43e+09            -0.7%   1.42e+09        p=
erf-stat.ps.dTLB-loads
    111971 =C2=B1 83%     +15.1%     128879 =C2=B1 67%     -93.3%       747=
8        perf-stat.ps.dTLB-store-misses
 8.727e+08            -3.8%  8.394e+08            -5.3%  8.264e+08        p=
erf-stat.ps.dTLB-stores
   5306748           -18.5%    4326031 =C2=B1  4%      +0.8%    5350615    =
    perf-stat.ps.iTLB-load-misses
   1207238 =C2=B1 24%     -11.2%    1071729 =C2=B1 26%     +19.4%    144108=
3 =C2=B1  2%  perf-stat.ps.iTLB-loads
 4.817e+09            -1.2%  4.762e+09            -1.7%  4.735e+09        p=
erf-stat.ps.instructions
      0.61 =C2=B1 22%      +5.4%       0.64 =C2=B1 17%      +5.1%       0.6=
4 =C2=B1 23%  perf-stat.ps.major-faults
      2687            -0.0%       2686            +0.1%       2689        p=
erf-stat.ps.minor-faults
     58400 =C2=B1 16%      +5.7%      61728 =C2=B1 17%     +24.1%      7247=
5 =C2=B1  8%  perf-stat.ps.node-load-misses
     11737 =C2=B1  8%      -1.6%      11551 =C2=B1  8%     -15.6%       990=
0 =C2=B1 16%  perf-stat.ps.node-loads
     25118 =C2=B1 14%      +6.3%      26701 =C2=B1 28%     +20.4%      3023=
7 =C2=B1 19%  perf-stat.ps.node-store-misses
     11051 =C2=B1 36%      +3.4%      11430 =C2=B1 50%     -44.3%       615=
5 =C2=B1 72%  perf-stat.ps.node-stores
      2687            -0.0%       2687            +0.1%       2689        p=
erf-stat.ps.page-faults
     95755            +0.0%      95755            +0.0%      95755        p=
erf-stat.ps.task-clock
 1.885e+12            -1.2%  1.862e+12            -1.8%  1.852e+12        p=
erf-stat.total.instructions
      0.01 =C2=B1 50%     +10.2%       0.01 =C2=B1 46%     -20.5%       0.0=
1 =C2=B1 31%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe.[unknown]
      0.00 =C2=B1161%    +221.9%       0.01 =C2=B1104%     -41.7%       0.0=
0 =C2=B1142%  perf-sched.sch_delay.avg.ms.cleaner_kthread.kthread.ret_from_=
fork
      0.00        +1.7e+98%       0.00 =C2=B1331%  +3.3e+98%       0.00 =C2=
=B1282%  perf-sched.sch_delay.avg.ms.d_alloc_parallel.__lookup_slow.walk_co=
mponent.link_path_walk.part
      0.02 =C2=B1129%     -45.2%       0.01 =C2=B1 19%     -50.4%       0.0=
1 =C2=B1 11%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.d=
o_syscall_64
      0.01 =C2=B1 49%      +6.5%       0.01 =C2=B1 52%     -36.4%       0.0=
1 =C2=B1 22%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.__=
x64_sys_nanosleep.do_syscall_64
      0.01 =C2=B1 14%     -12.3%       0.01 =C2=B1 32%      +7.5%       0.0=
1 =C2=B1 30%  perf-sched.sch_delay.avg.ms.do_syslog.part.0.kmsg_read.vfs_re=
ad
      0.01 =C2=B1 24%   +5694.8%       0.34 =C2=B1325%     -28.3%       0.0=
0 =C2=B1  9%  perf-sched.sch_delay.avg.ms.do_task_dead.do_exit.do_group_exi=
t.__x64_sys_exit_group.do_syscall_64
      0.01 =C2=B1 60%     +17.4%       0.01 =C2=B1 55%     -47.8%       0.0=
0        perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do=
_syscall_64
      0.00 =C2=B1282%    -100.0%       0.00          +250.0%       0.00 =C2=
=B1282%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_prepare.irqentry_exi=
t_to_user_mode.asm_exc_page_fault.[unknown]
      0.00          +1e+99%       0.00 =C2=B1212%  +5.6e+98%       0.00 =C2=
=B1191%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_prepare.irqentry_exi=
t_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.00 =C2=B1 35%      +3.1%       0.00 =C2=B1 91%     -25.0%       0.0=
0 =C2=B1 35%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_prepare.syscall=
_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00 =C2=B1282%    -100.0%       0.00           +75.0%       0.00 =C2=
=B1282%  perf-sched.sch_delay.avg.ms.futex_wait_queue_me.futex_wait.do_fute=
x.__x64_sys_futex
      0.00        +3.3e+98%       0.00 =C2=B1331%    -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.io_schedule.__lock_page.pagecache_get_page.=
shmem_getpage_gfp
      0.00 =C2=B1282%     +82.1%       0.00 =C2=B1169%    +200.0%       0.0=
0 =C2=B1170%  perf-sched.sch_delay.avg.ms.io_schedule.__lock_page_killable.=
filemap_fault.__do_fault
      0.00 =C2=B1 52%     +22.4%       0.00 =C2=B1 48%     -52.6%       0.0=
0        perf-sched.sch_delay.avg.ms.pipe_read.new_sync_read.vfs_read.ksys_=
read
      0.00 =C2=B1168%     -51.4%       0.00 =C2=B1224%     -73.0%       0.0=
0 =C2=B1282%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_re=
sched.__flush_work.lru_add_drain_all.khugepaged
      0.00 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.copy=
_page_to_iter.pipe_read.new_sync_read
      0.00        +2.5e+98%       0.00 =C2=B1331%  +3.3e+98%       0.00 =C2=
=B1282%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00 =C2=B1282%    +800.0%       0.00 =C2=B1316%      +0.0%       0.0=
0 =C2=B1282%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_re=
sched.mutex_lock.pipe_read.new_sync_read
      0.00 =C2=B1282%    +275.0%       0.00 =C2=B1234%    -100.0%       0.0=
0        perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.mutex_lock.pipe_write.new_sync_write
      0.00        +1.7e+98%       0.00 =C2=B1331%    -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.stop=
_one_cpu.sched_exec.bprm_execve
      0.01 =C2=B1111%     +51.3%       0.02 =C2=B1 90%     -49.6%       0.0=
1 =C2=B1 17%  perf-sched.sch_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_f=
ork
      0.00          -100.0%       0.00        +7.8e+98%       0.00 =C2=B128=
2%  perf-sched.sch_delay.avg.ms.rwsem_down_read_slowpath.down_read_killable=
.__access_remote_vm.proc_pid_cmdline_read
      0.00          -100.0%       0.00          +1e+99%       0.00 =C2=B128=
2%  perf-sched.sch_delay.avg.ms.rwsem_down_read_slowpath.down_read_killable=
.mm_access.proc_mem_open
      0.01 =C2=B1 34%     +19.6%       0.01 =C2=B1 36%     -15.1%       0.0=
1 =C2=B1 28%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep=
_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.01 =C2=B1101%    +137.9%       0.02 =C2=B1 94%     -33.3%       0.0=
1 =C2=B1 27%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.po=
ll_schedule_timeout.constprop.0.do_select
      0.01 =C2=B1 27%      +4.5%       0.01 =C2=B1 33%     -26.2%       0.0=
1 =C2=B1 16%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.po=
ll_schedule_timeout.constprop.0.do_sys_poll
      0.03 =C2=B1 62%     -20.1%       0.02 =C2=B1 32%     -46.2%       0.0=
2 =C2=B1 37%  perf-sched.sch_delay.avg.ms.schedule_timeout.__skb_wait_for_m=
ore_packets.unix_dgram_recvmsg.__sys_recvfrom
      0.01 =C2=B1 40%      -9.0%       0.01 =C2=B1 37%     -32.5%       0.0=
1 =C2=B1 21%  perf-sched.sch_delay.avg.ms.schedule_timeout.io_schedule_time=
out.wait_for_completion_io_timeout.blk_execute_rq
      0.01 =C2=B1 33%     +11.4%       0.01 =C2=B1 29%     -32.3%       0.0=
1 =C2=B1  6%  perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthrea=
d.ret_from_fork
      0.00        +7.2e+99%       0.01 =C2=B1 85%  +3.7e+99%       0.00 =C2=
=B1145%  perf-sched.sch_delay.avg.ms.schedule_timeout.khugepaged.kthread.re=
t_from_fork
      0.02 =C2=B1 81%      -0.2%       0.02 =C2=B1 79%     -50.0%       0.0=
1 =C2=B1 27%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_kthread.k=
thread.ret_from_fork
      0.00 =C2=B1208%    +228.1%       0.01 =C2=B1 86%     -37.5%       0.0=
0 =C2=B1144%  perf-sched.sch_delay.avg.ms.schedule_timeout.transaction_kthr=
ead.kthread.ret_from_fork
      0.01 =C2=B1 91%     +71.2%       0.02 =C2=B1 69%      +0.0%       0.0=
1 =C2=B1 37%  perf-sched.sch_delay.avg.ms.schedule_timeout.wait_for_complet=
ion.__flush_work.lru_add_drain_all
      0.00 =C2=B1 36%      -0.6%       0.00 =C2=B1 33%      -7.5%       0.0=
0 =C2=B1 35%  perf-sched.sch_delay.avg.ms.schedule_timeout.wait_for_complet=
ion_interruptible.usb_stor_control_thread.kthread
      0.01 =C2=B1 25%     +27.4%       0.01 =C2=B1 70%     -19.4%       0.0=
1 =C2=B1 18%  perf-sched.sch_delay.avg.ms.schedule_timeout.wait_for_complet=
ion_interruptible_timeout.usb_stor_msg_common.usb_stor_bulk_transfer_buf
      0.01 =C2=B1 35%     -10.9%       0.01 =C2=B1 13%     -26.6%       0.0=
1 =C2=B1  7%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_fro=
m_fork
      0.00 =C2=B1 19%      +1.1%       0.00 =C2=B1 19%     -17.4%       0.0=
0 =C2=B1 14%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_den=
try_open.do_open.isra
      0.01 =C2=B1 11%      +8.2%       0.01 =C2=B1 14%     -12.4%       0.0=
1 =C2=B1  4%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fo=
rk
      0.02 =C2=B1 32%      +4.7%       0.02 =C2=B1 40%     -38.5%       0.0=
1 =C2=B1 11%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe.[unknown]
      0.00 =C2=B1161%    +221.9%       0.01 =C2=B1104%     -41.7%       0.0=
0 =C2=B1142%  perf-sched.sch_delay.max.ms.cleaner_kthread.kthread.ret_from_=
fork
      0.00        +1.7e+98%       0.00 =C2=B1331%  +3.3e+98%       0.00 =C2=
=B1282%  perf-sched.sch_delay.max.ms.d_alloc_parallel.__lookup_slow.walk_co=
mponent.link_path_walk.part
      0.02 =C2=B1129%     -47.5%       0.01 =C2=B1 19%     -51.0%       0.0=
1 =C2=B1  8%  perf-sched.sch_delay.max.ms.devkmsg_read.vfs_read.ksys_read.d=
o_syscall_64
      0.02 =C2=B1 54%      +1.7%       0.02 =C2=B1 32%     -36.2%       0.0=
1 =C2=B1 28%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.__=
x64_sys_nanosleep.do_syscall_64
      0.01 =C2=B1 21%     -13.1%       0.01 =C2=B1 37%      +6.3%       0.0=
1 =C2=B1 41%  perf-sched.sch_delay.max.ms.do_syslog.part.0.kmsg_read.vfs_re=
ad
      0.04 =C2=B1 45%  +1.9e+05%      83.41 =C2=B1331%     -49.1%       0.0=
2 =C2=B1 26%  perf-sched.sch_delay.max.ms.do_task_dead.do_exit.do_group_exi=
t.__x64_sys_exit_group.do_syscall_64
      0.06 =C2=B1 91%     +50.4%       0.09 =C2=B1 65%     -82.7%       0.0=
1 =C2=B1 21%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.__do_sys_wai=
t4.do_syscall_64
      0.00 =C2=B1282%    -100.0%       0.00          +250.0%       0.00 =C2=
=B1282%  perf-sched.sch_delay.max.ms.exit_to_user_mode_prepare.irqentry_exi=
t_to_user_mode.asm_exc_page_fault.[unknown]
      0.00        +1.1e+99%       0.00 =C2=B1197%  +6.7e+98%       0.00 =C2=
=B1187%  perf-sched.sch_delay.max.ms.exit_to_user_mode_prepare.irqentry_exi=
t_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.01 =C2=B1 18%     +71.2%       0.01 =C2=B1129%      -5.7%       0.0=
1 =C2=B1 38%  perf-sched.sch_delay.max.ms.exit_to_user_mode_prepare.syscall=
_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00 =C2=B1282%    -100.0%       0.00           +83.3%       0.00 =C2=
=B1282%  perf-sched.sch_delay.max.ms.futex_wait_queue_me.futex_wait.do_fute=
x.__x64_sys_futex
      0.00        +3.3e+98%       0.00 =C2=B1331%    -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.io_schedule.__lock_page.pagecache_get_page.=
shmem_getpage_gfp
      0.00 =C2=B1282%     +82.1%       0.00 =C2=B1169%    +200.0%       0.0=
0 =C2=B1170%  perf-sched.sch_delay.max.ms.io_schedule.__lock_page_killable.=
filemap_fault.__do_fault
      0.09 =C2=B1 76%     +23.3%       0.11 =C2=B1 60%     -77.4%       0.0=
2 =C2=B1 31%  perf-sched.sch_delay.max.ms.pipe_read.new_sync_read.vfs_read.=
ksys_read
      0.00 =C2=B1168%     -51.4%       0.00 =C2=B1224%     -73.0%       0.0=
0 =C2=B1282%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_re=
sched.__flush_work.lru_add_drain_all.khugepaged
      0.00 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.copy=
_page_to_iter.pipe_read.new_sync_read
      0.00        +2.5e+98%       0.00 =C2=B1331%  +3.3e+98%       0.00 =C2=
=B1282%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00 =C2=B1282%    +512.5%       0.00 =C2=B1310%     -33.3%       0.0=
0 =C2=B1282%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_re=
sched.mutex_lock.pipe_read.new_sync_read
      0.00 =C2=B1282%     +50.0%       0.00 =C2=B1204%    -100.0%       0.0=
0        perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.mutex_lock.pipe_write.new_sync_write
      0.00        +1.7e+98%       0.00 =C2=B1331%    -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.stop=
_one_cpu.sched_exec.bprm_execve
      0.03 =C2=B1 66%      +5.3%       0.03 =C2=B1 72%     -53.1%       0.0=
1 =C2=B1  7%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_re=
sched.wait_for_completion.affine_move_task.__set_cpus_allowed_ptr
      0.04 =C2=B1106%   +1724.8%       0.71 =C2=B1308%     -64.7%       0.0=
1 =C2=B1 31%  perf-sched.sch_delay.max.ms.rcu_gp_kthread.kthread.ret_from_f=
ork
      0.00          -100.0%       0.00        +7.8e+98%       0.00 =C2=B128=
2%  perf-sched.sch_delay.max.ms.rwsem_down_read_slowpath.down_read_killable=
.__access_remote_vm.proc_pid_cmdline_read
      0.00          -100.0%       0.00          +1e+99%       0.00 =C2=B128=
2%  perf-sched.sch_delay.max.ms.rwsem_down_read_slowpath.down_read_killable=
.mm_access.proc_mem_open
      0.03 =C2=B1 64%     +52.1%       0.05 =C2=B1 73%     -39.5%       0.0=
2 =C2=B1 22%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.ep=
_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.02 =C2=B1122%    +164.8%       0.05 =C2=B1 95%     -25.6%       0.0=
1 =C2=B1 64%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.po=
ll_schedule_timeout.constprop.0.do_select
      0.02 =C2=B1 32%     +56.4%       0.04 =C2=B1 60%     -16.3%       0.0=
2 =C2=B1 29%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.po=
ll_schedule_timeout.constprop.0.do_sys_poll
      0.03 =C2=B1 62%     -20.1%       0.02 =C2=B1 32%     -46.2%       0.0=
2 =C2=B1 37%  perf-sched.sch_delay.max.ms.schedule_timeout.__skb_wait_for_m=
ore_packets.unix_dgram_recvmsg.__sys_recvfrom
      0.02 =C2=B1 23%     +25.0%       0.02 =C2=B1 32%     -12.7%       0.0=
2 =C2=B1 40%  perf-sched.sch_delay.max.ms.schedule_timeout.io_schedule_time=
out.wait_for_completion_io_timeout.blk_execute_rq
      0.02 =C2=B1 46%      +9.2%       0.02 =C2=B1 35%     -27.5%       0.0=
2 =C2=B1 23%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthrea=
d.ret_from_fork
      0.00        +7.2e+99%       0.01 =C2=B1 85%  +3.7e+99%       0.00 =C2=
=B1145%  perf-sched.sch_delay.max.ms.schedule_timeout.khugepaged.kthread.re=
t_from_fork
      1.37 =C2=B1190%     -93.8%       0.09 =C2=B1 62%     -58.2%       0.5=
7 =C2=B1273%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_kthread.k=
thread.ret_from_fork
      0.00 =C2=B1208%    +228.1%       0.01 =C2=B1 86%     -37.5%       0.0=
0 =C2=B1144%  perf-sched.sch_delay.max.ms.schedule_timeout.transaction_kthr=
ead.kthread.ret_from_fork
      0.01 =C2=B1 86%     +66.9%       0.02 =C2=B1 63%      -9.8%       0.0=
1 =C2=B1 37%  perf-sched.sch_delay.max.ms.schedule_timeout.wait_for_complet=
ion.__flush_work.lru_add_drain_all
      0.01 =C2=B1 28%     +11.9%       0.01 =C2=B1 18%     -13.4%       0.0=
1 =C2=B1 22%  perf-sched.sch_delay.max.ms.schedule_timeout.wait_for_complet=
ion_interruptible.usb_stor_control_thread.kthread
      0.02 =C2=B1 43%     +39.0%       0.03 =C2=B1 76%     -34.3%       0.0=
1 =C2=B1 14%  perf-sched.sch_delay.max.ms.schedule_timeout.wait_for_complet=
ion_interruptible_timeout.usb_stor_msg_common.usb_stor_bulk_transfer_buf
      1.26 =C2=B1274%     -97.3%       0.03 =C2=B1 21%     -97.6%       0.0=
3 =C2=B1 10%  perf-sched.sch_delay.max.ms.smpboot_thread_fn.kthread.ret_fro=
m_fork
      0.01 =C2=B1 46%     +54.7%       0.02 =C2=B1 88%     -51.0%       0.0=
1 =C2=B1 48%  perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_den=
try_open.do_open.isra
      3.19            +0.2%       3.19            +0.6%       3.21        p=
erf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork
      0.01 =C2=B1 44%    +226.9%       0.02 =C2=B1215%     -32.1%       0.0=
0 =C2=B1 11%  perf-sched.total_sch_delay.average.ms
      4.66 =C2=B1 57%   +1759.5%      86.69 =C2=B1317%     -27.0%       3.4=
0 =C2=B1 16%  perf-sched.total_sch_delay.max.ms
    204.07 =C2=B1  6%      +0.8%     205.63 =C2=B1  8%      -1.6%     200.8=
5 =C2=B1 10%  perf-sched.total_wait_and_delay.average.ms
      7199 =C2=B1  7%      -0.4%       7167 =C2=B1  9%      +2.2%       735=
5 =C2=B1 11%  perf-sched.total_wait_and_delay.count.ms
      9988            +0.0%       9992            -0.4%       9945        p=
erf-sched.total_wait_and_delay.max.ms
    204.07 =C2=B1  6%      +0.8%     205.61 =C2=B1  8%      -1.6%     200.8=
5 =C2=B1 10%  perf-sched.total_wait_time.average.ms
      9988            +0.0%       9992            -0.4%       9945        p=
erf-sched.total_wait_time.max.ms
    899.74            -0.0%     899.72            -0.0%     899.71        p=
erf-sched.wait_and_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL=
_64_after_hwframe.[unknown]
    682.12 =C2=B1  4%      -0.3%     680.00 =C2=B1  3%      -0.8%     676.6=
2 =C2=B1  4%  perf-sched.wait_and_delay.avg.ms.do_nanosleep.hrtimer_nanosle=
ep.__x64_sys_nanosleep.do_syscall_64
    272.57 =C2=B1  3%      +1.5%     276.71 =C2=B1  3%      +1.2%     275.9=
8 =C2=B1  3%  perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_grou=
p_exit.__x64_sys_exit_group.do_syscall_64
      4.63 =C2=B1  3%      +1.1%       4.68 =C2=B1  3%      -2.7%       4.5=
0        perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wai=
t4.do_syscall_64
     62.06            -0.3%      61.89            -1.2%      61.34        p=
erf-sched.wait_and_delay.avg.ms.pipe_read.new_sync_read.vfs_read.ksys_read
     17.16 =C2=B1 17%      +5.3%      18.07            -7.1%      15.94 =C2=
=B1 24%  perf-sched.wait_and_delay.avg.ms.preempt_schedule_common.__cond_re=
sched.wait_for_completion.affine_move_task.__set_cpus_allowed_ptr
      3.50 =C2=B1 36%      +6.8%       3.74 =C2=B1  8%      -0.4%       3.4=
9 =C2=B1 36%  perf-sched.wait_and_delay.avg.ms.rcu_gp_kthread.kthread.ret_f=
rom_fork
      0.00          -100.0%       0.00       +6.3e+104%     634.38 =C2=B128=
2%  perf-sched.wait_and_delay.avg.ms.rwsem_down_read_slowpath.down_read_kil=
lable.__access_remote_vm.proc_pid_cmdline_read
    307.19 =C2=B1 57%     -18.0%     251.87 =C2=B1 73%     -11.1%     272.9=
5 =C2=B1 54%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clo=
ck.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
    950.15            -0.2%     948.36            -0.3%     947.48        p=
erf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedul=
e_timeout.constprop.0.do_select
    431.49 =C2=B1 29%      -8.9%     393.21            +8.0%     466.20 =C2=
=B1 30%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.po=
ll_schedule_timeout.constprop.0.do_sys_poll
      1428 =C2=B1 20%     -14.7%       1218 =C2=B1 42%      -2.9%       138=
6 =C2=B1 21%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.io_schedule=
_timeout.wait_for_completion_io_timeout.blk_execute_rq
    478.66            -0.1%     478.15            +0.0%     478.80        p=
erf-sched.wait_and_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from=
_fork
     12.17 =C2=B1 43%     +10.5%      13.44 =C2=B1 38%      +6.9%      13.0=
1 =C2=B1 46%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_kthr=
ead.kthread.ret_from_fork
    829.27 =C2=B1  3%      -1.2%     819.18            -1.2%     819.16    =
    perf-sched.wait_and_delay.avg.ms.schedule_timeout.wait_for_completion_i=
nterruptible_timeout.usb_stor_msg_common.usb_stor_bulk_transfer_buf
    747.87            +0.4%     751.10            -1.3%     737.79        p=
erf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
      0.00 =C2=B1 19%      +1.1%       0.00 =C2=B1 19%     -17.4%       0.0=
0 =C2=B1 14%  perf-sched.wait_and_delay.avg.ms.wait_for_partner.fifo_open.d=
o_dentry_open.do_open.isra
    368.31 =C2=B1  4%      -1.0%     364.47 =C2=B1  4%      +1.6%     374.2=
5 =C2=B1  3%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_fr=
om_fork
     10.00            +0.0%      10.00            +0.0%      10.00        p=
erf-sched.wait_and_delay.count.__x64_sys_pause.do_syscall_64.entry_SYSCALL_=
64_after_hwframe.[unknown]
     13.22 =C2=B1  4%      +0.2%      13.25 =C2=B1  3%      +0.8%      13.3=
3 =C2=B1  5%  perf-sched.wait_and_delay.count.do_nanosleep.hrtimer_nanoslee=
p.__x64_sys_nanosleep.do_syscall_64
    254.56            -0.4%     253.42            +0.1%     254.89        p=
erf-sched.wait_and_delay.count.do_task_dead.do_exit.do_group_exit.__x64_sys=
_exit_group.do_syscall_64
    246.44 =C2=B1  3%      -0.8%     244.58 =C2=B1  2%      +2.6%     252.8=
9        perf-sched.wait_and_delay.count.do_wait.kernel_wait4.__do_sys_wait=
4.do_syscall_64
      2501            +0.2%       2507            +1.5%       2538        p=
erf-sched.wait_and_delay.count.pipe_read.new_sync_read.vfs_read.ksys_read
      1045 =C2=B1  2%      +0.2%       1048 =C2=B1  2%      +1.0%       105=
6        perf-sched.wait_and_delay.count.preempt_schedule_common.__cond_res=
ched.wait_for_completion.affine_move_task.__set_cpus_allowed_ptr
    156.89 =C2=B1 69%     +56.4%     245.33 =C2=B1 84%     +30.5%     204.7=
8 =C2=B1 88%  perf-sched.wait_and_delay.count.rcu_gp_kthread.kthread.ret_fr=
om_fork
      0.00          -100.0%       0.00       +1.1e+101%       0.11 =C2=B128=
2%  perf-sched.wait_and_delay.count.rwsem_down_read_slowpath.down_read_kill=
able.__access_remote_vm.proc_pid_cmdline_read
     20.00 =C2=B1 67%     -22.5%      15.50 =C2=B1 86%      -2.2%      19.5=
6 =C2=B1 64%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_cloc=
k.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      6.00            +0.0%       6.00            +0.0%       6.00        p=
erf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.poll_schedule=
_timeout.constprop.0.do_select
     23.44 =C2=B1  5%      -2.3%      22.92            +0.9%      23.67 =C2=
=B1  6%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.pol=
l_schedule_timeout.constprop.0.do_sys_poll
     10.00            +0.0%      10.00            +0.0%      10.00        p=
erf-sched.wait_and_delay.count.schedule_timeout.io_schedule_timeout.wait_fo=
r_completion_io_timeout.blk_execute_rq
     39.78            -2.0%      39.00 =C2=B1  2%      +0.6%      40.00    =
    perf-sched.wait_and_delay.count.schedule_timeout.kcompactd.kthread.ret_=
from_fork
    986.56 =C2=B1 57%     -12.7%     861.25 =C2=B1 59%      +4.4%       103=
0 =C2=B1 72%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_kthre=
ad.kthread.ret_from_fork
      9.89 =C2=B1  3%      +1.1%      10.00            +1.1%      10.00    =
    perf-sched.wait_and_delay.count.schedule_timeout.wait_for_completion_in=
terruptible_timeout.usb_stor_msg_common.usb_stor_bulk_transfer_buf
      1241 =C2=B1  2%      +0.2%       1244 =C2=B1  2%      +0.8%       125=
1        perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from=
_fork
     71.56            -0.2%      71.42            +0.2%      71.67        p=
erf-sched.wait_and_delay.count.wait_for_partner.fifo_open.do_dentry_open.do=
_open.isra
    533.44 =C2=B1  3%      +0.1%     534.17 =C2=B1  2%      -0.1%     532.7=
8 =C2=B1  2%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_fro=
m_fork
    999.83            +0.0%     999.84            -0.0%     999.81        p=
erf-sched.wait_and_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL=
_64_after_hwframe.[unknown]
      1000            +0.0%       1000            -0.0%       1000        p=
erf-sched.wait_and_delay.max.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_na=
nosleep.do_syscall_64
      2750 =C2=B1 55%      +7.2%       2948 =C2=B1 60%     +24.4%       342=
0 =C2=B1 51%  perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.do_grou=
p_exit.__x64_sys_exit_group.do_syscall_64
      1000            +0.0%       1000            -0.0%       1000        p=
erf-sched.wait_and_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_sysc=
all_64
      3004            +0.0%       3004            -0.0%       3003        p=
erf-sched.wait_and_delay.max.ms.pipe_read.new_sync_read.vfs_read.ksys_read
      8994 =C2=B1 31%     +11.1%       9992           -11.1%       7995 =C2=
=B1 46%  perf-sched.wait_and_delay.max.ms.preempt_schedule_common.__cond_re=
sched.wait_for_completion.affine_move_task.__set_cpus_allowed_ptr
      4.49 =C2=B1 35%     +18.2%       5.31 =C2=B1 15%      -0.9%       4.4=
5 =C2=B1 35%  perf-sched.wait_and_delay.max.ms.rcu_gp_kthread.kthread.ret_f=
rom_fork
      0.00          -100.0%       0.00       +6.3e+104%     634.38 =C2=B128=
2%  perf-sched.wait_and_delay.max.ms.rwsem_down_read_slowpath.down_read_kil=
lable.__access_remote_vm.proc_pid_cmdline_read
      2091 =C2=B1124%     -33.3%       1395 =C2=B1139%     -37.6%       130=
5 =C2=B1133%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clo=
ck.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      5700            -0.2%       5690            -0.3%       5684        p=
erf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.poll_schedul=
e_timeout.constprop.0.do_select
      1994 =C2=B1140%     -49.8%       1001           +47.9%       2950 =C2=
=B1123%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.po=
ll_schedule_timeout.constprop.0.do_sys_poll
      2047            -5.5%       1935 =C2=B1 14%      +0.0%       2047    =
    perf-sched.wait_and_delay.max.ms.schedule_timeout.io_schedule_timeout.w=
ait_for_completion_io_timeout.blk_execute_rq
    505.02            +0.0%     505.03            -0.0%     505.01        p=
erf-sched.wait_and_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from=
_fork
    304.90 =C2=B1 44%      -9.6%     275.59 =C2=B1 51%      +0.0%     305.0=
0 =C2=B1 52%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_kthr=
ead.kthread.ret_from_fork
      2048            +0.0%       2048            +0.0%       2048        p=
erf-sched.wait_and_delay.max.ms.schedule_timeout.wait_for_completion_interr=
uptible_timeout.usb_stor_msg_common.usb_stor_bulk_transfer_buf
      1585 =C2=B1 32%      +1.9%       1615 =C2=B1 31%      -7.3%       146=
9 =C2=B1 35%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.re=
t_from_fork
      0.01 =C2=B1 46%     +56.2%       0.02 =C2=B1 86%     -51.0%       0.0=
1 =C2=B1 48%  perf-sched.wait_and_delay.max.ms.wait_for_partner.fifo_open.d=
o_dentry_open.do_open.isra
      5388 =C2=B1 31%     -16.1%       4522 =C2=B1 36%     -11.8%       475=
1 =C2=B1 29%  perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_fr=
om_fork
    899.73            -0.0%     899.71            -0.0%     899.70        p=
erf-sched.wait_time.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe.[unknown]
      1.57 =C2=B1 10%      +6.1%       1.67 =C2=B1  8%      +1.6%       1.6=
0 =C2=B1 11%  perf-sched.wait_time.avg.ms.devkmsg_read.vfs_read.ksys_read.d=
o_syscall_64
    682.11 =C2=B1  4%      -0.3%     679.99 =C2=B1  3%      -0.8%     676.6=
2 =C2=B1  4%  perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.__=
x64_sys_nanosleep.do_syscall_64
      1.59 =C2=B1 10%      +5.7%       1.68 =C2=B1  8%      +1.0%       1.6=
0 =C2=B1 11%  perf-sched.wait_time.avg.ms.do_syslog.part.0.kmsg_read.vfs_re=
ad
    272.57 =C2=B1  3%      +1.4%     276.37 =C2=B1  3%      +1.2%     275.9=
7 =C2=B1  3%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exi=
t.__x64_sys_exit_group.do_syscall_64
      4.62 =C2=B1  3%      +1.1%       4.67 =C2=B1  3%      -2.6%       4.5=
0        perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do=
_syscall_64
      0.01 =C2=B1106%     -60.5%       0.00 =C2=B1223%     -21.1%       0.0=
1 =C2=B1113%  perf-sched.wait_time.avg.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.01 =C2=B1 21%     +11.4%       0.01 =C2=B1 28%     +12.9%       0.0=
1 =C2=B1 23%  perf-sched.wait_time.avg.ms.exit_to_user_mode_prepare.syscall=
_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.04 =C2=B1282%    -100.0%       0.00           -14.8%       0.03 =C2=
=B1282%  perf-sched.wait_time.avg.ms.futex_wait_queue_me.futex_wait.do_fute=
x.__x64_sys_futex
     62.06            -0.3%      61.88            -1.2%      61.33        p=
erf-sched.wait_time.avg.ms.pipe_read.new_sync_read.vfs_read.ksys_read
      0.01 =C2=B1149%      +5.9%       0.01 =C2=B1133%     -39.7%       0.0=
0 =C2=B1174%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.copy_page_from_iter.pipe_write.new_sync_write
      0.01 =C2=B1 87%     -56.4%       0.01 =C2=B1160%     -60.9%       0.0=
0 =C2=B1179%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.copy_page_to_iter.pipe_read.new_sync_read
      0.01 =C2=B1 70%     -27.3%       0.01 =C2=B1 73%     -60.8%       0.0=
1 =C2=B1141%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.mutex_lock.pipe_read.new_sync_read
      0.02 =C2=B1 61%     -16.4%       0.01 =C2=B1 88%     +21.6%       0.0=
2 =C2=B1 40%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.mutex_lock.pipe_write.new_sync_write
     17.15 =C2=B1 17%      +5.3%      18.07            -7.1%      15.94 =C2=
=B1 24%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched=
.wait_for_completion.affine_move_task.__set_cpus_allowed_ptr
      3.49 =C2=B1 36%      +6.7%       3.72 =C2=B1  8%     +10.8%       3.8=
6 =C2=B1  7%  perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_f=
ork
      0.00          -100.0%       0.00       +6.3e+104%     634.38 =C2=B128=
2%  perf-sched.wait_time.avg.ms.rwsem_down_read_slowpath.down_read_killable=
.__access_remote_vm.proc_pid_cmdline_read
      0.00          -100.0%       0.00       +1.2e+100%       0.01 =C2=B128=
2%  perf-sched.wait_time.avg.ms.rwsem_down_read_slowpath.down_read_killable=
.mm_access.proc_mem_open
    314.20 =C2=B1 52%     -15.5%     265.53 =C2=B1 63%      -9.8%     283.4=
8 =C2=B1 45%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.ep=
_poll.do_epoll_wait.__x64_sys_epoll_wait
    950.14            -0.2%     948.34            -0.3%     947.47        p=
erf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_tim=
eout.constprop.0.do_select
    431.49 =C2=B1 29%      -8.9%     393.20            +8.0%     466.20 =C2=
=B1 30%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.poll_sc=
hedule_timeout.constprop.0.do_sys_poll
      5.50 =C2=B1 61%     -23.1%       4.23 =C2=B1107%      +4.9%       5.7=
7 =C2=B1 96%  perf-sched.wait_time.avg.ms.schedule_timeout.__skb_wait_for_m=
ore_packets.unix_dgram_recvmsg.__sys_recvfrom
      1428 =C2=B1 20%     -14.7%       1218 =C2=B1 42%      -2.9%       138=
6 =C2=B1 21%  perf-sched.wait_time.avg.ms.schedule_timeout.io_schedule_time=
out.wait_for_completion_io_timeout.blk_execute_rq
    478.65            -0.1%     478.14            +0.0%     478.80        p=
erf-sched.wait_time.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.01 =C2=B1 33%     +20.3%       0.01 =C2=B1 63%      +6.3%       0.0=
1 =C2=B1 60%  perf-sched.wait_time.avg.ms.schedule_timeout.khugepaged.kthre=
ad.ret_from_fork
     12.15 =C2=B1 43%     +10.5%      13.43 =C2=B1 38%      +7.0%      13.0=
0 =C2=B1 46%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_kthread.k=
thread.ret_from_fork
      0.00 =C2=B1188%     +41.7%       0.00 =C2=B1192%    -100.0%       0.0=
0        perf-sched.wait_time.avg.ms.schedule_timeout.wait_for_completion._=
_flush_work.lru_add_drain_all
      0.00 =C2=B1191%     +88.6%       0.01 =C2=B1141%     -31.4%       0.0=
0 =C2=B1206%  perf-sched.wait_time.avg.ms.schedule_timeout.wait_for_complet=
ion.affine_move_task.__set_cpus_allowed_ptr
      0.08 =C2=B1 18%      +2.2%       0.09 =C2=B1  7%      +7.5%       0.0=
9 =C2=B1  2%  perf-sched.wait_time.avg.ms.schedule_timeout.wait_for_complet=
ion_interruptible.usb_stor_control_thread.kthread
    829.26 =C2=B1  3%      -1.2%     819.17            -1.2%     819.15    =
    perf-sched.wait_time.avg.ms.schedule_timeout.wait_for_completion_interr=
uptible_timeout.usb_stor_msg_common.usb_stor_bulk_transfer_buf
    747.87            +0.4%     751.09            -1.3%     737.78        p=
erf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
    368.29 =C2=B1  4%      -1.0%     364.46 =C2=B1  4%      +1.6%     374.2=
4 =C2=B1  3%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fo=
rk
    999.81            +0.0%     999.82            -0.0%     999.80        p=
erf-sched.wait_time.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe.[unknown]
      3.14 =C2=B1 10%      +6.1%       3.33 =C2=B1  8%      +1.6%       3.1=
9 =C2=B1 11%  perf-sched.wait_time.max.ms.devkmsg_read.vfs_read.ksys_read.d=
o_syscall_64
      1000            +0.0%       1000            -0.0%       1000        p=
erf-sched.wait_time.max.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosle=
ep.do_syscall_64
      3.17 =C2=B1 10%      +5.7%       3.35 =C2=B1  8%      +1.0%       3.2=
1 =C2=B1 11%  perf-sched.wait_time.max.ms.do_syslog.part.0.kmsg_read.vfs_re=
ad
      2750 =C2=B1 55%      +7.2%       2948 =C2=B1 60%     +24.4%       342=
0 =C2=B1 51%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exi=
t.__x64_sys_exit_group.do_syscall_64
      1000            +0.0%       1000            -0.0%       1000        p=
erf-sched.wait_time.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.01 =C2=B1 98%     -62.5%       0.00 =C2=B1201%     -25.0%       0.0=
1 =C2=B1112%  perf-sched.wait_time.max.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.03 =C2=B1 16%      -2.1%       0.03 =C2=B1 12%      -8.7%       0.0=
3 =C2=B1  3%  perf-sched.wait_time.max.ms.exit_to_user_mode_prepare.syscall=
_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.13 =C2=B1282%    -100.0%       0.00           -25.1%       0.10 =C2=
=B1282%  perf-sched.wait_time.max.ms.futex_wait_queue_me.futex_wait.do_fute=
x.__x64_sys_futex
      3004            +0.0%       3004            -0.0%       3003        p=
erf-sched.wait_time.max.ms.pipe_read.new_sync_read.vfs_read.ksys_read
      0.01 =C2=B1141%      -0.0%       0.01 =C2=B1129%     -49.4%       0.0=
0 =C2=B1174%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.copy_page_from_iter.pipe_write.new_sync_write
      0.01 =C2=B1 84%     -44.1%       0.01 =C2=B1160%     -57.4%       0.0=
1 =C2=B1178%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.copy_page_to_iter.pipe_read.new_sync_read
      0.02 =C2=B1 63%     -11.2%       0.02 =C2=B1 72%     -49.1%       0.0=
1 =C2=B1122%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.mutex_lock.pipe_read.new_sync_read
      0.02 =C2=B1 54%     -30.1%       0.01 =C2=B1 83%      +8.4%       0.0=
2 =C2=B1 37%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.mutex_lock.pipe_write.new_sync_write
      8994 =C2=B1 31%     +11.1%       9992           -11.1%       7995 =C2=
=B1 46%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched=
.wait_for_completion.affine_move_task.__set_cpus_allowed_ptr
      4.48 =C2=B1 35%     +12.6%       5.04            +9.2%       4.89 =C2=
=B1  6%  perf-sched.wait_time.max.ms.rcu_gp_kthread.kthread.ret_from_fork
      0.00          -100.0%       0.00       +6.3e+104%     634.38 =C2=B128=
2%  perf-sched.wait_time.max.ms.rwsem_down_read_slowpath.down_read_killable=
.__access_remote_vm.proc_pid_cmdline_read
      0.00          -100.0%       0.00       +1.2e+100%       0.01 =C2=B128=
2%  perf-sched.wait_time.max.ms.rwsem_down_read_slowpath.down_read_killable=
.mm_access.proc_mem_open
      2156 =C2=B1118%     -29.2%       1525 =C2=B1121%     -34.9%       140=
3 =C2=B1119%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.ep=
_poll.do_epoll_wait.__x64_sys_epoll_wait
      5700            -0.2%       5690            -0.3%       5684        p=
erf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.poll_schedule_tim=
eout.constprop.0.do_select
      1994 =C2=B1140%     -49.8%       1001           +47.9%       2950 =C2=
=B1123%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.poll_sc=
hedule_timeout.constprop.0.do_sys_poll
      5.50 =C2=B1 61%     -23.1%       4.23 =C2=B1107%      +4.9%       5.7=
7 =C2=B1 96%  perf-sched.wait_time.max.ms.schedule_timeout.__skb_wait_for_m=
ore_packets.unix_dgram_recvmsg.__sys_recvfrom
      2047            -5.5%       1935 =C2=B1 14%      +0.0%       2047    =
    perf-sched.wait_time.max.ms.schedule_timeout.io_schedule_timeout.wait_f=
or_completion_io_timeout.blk_execute_rq
    505.01            +0.0%     505.01            -0.0%     505.00        p=
erf-sched.wait_time.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.01 =C2=B1 33%     +20.3%       0.01 =C2=B1 63%      +6.3%       0.0=
1 =C2=B1 60%  perf-sched.wait_time.max.ms.schedule_timeout.khugepaged.kthre=
ad.ret_from_fork
    304.86 =C2=B1 44%      -9.6%     275.56 =C2=B1 51%      +0.0%     304.9=
9 =C2=B1 52%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_kthread.k=
thread.ret_from_fork
      0.00 =C2=B1204%     +32.7%       0.00 =C2=B1186%    -100.0%       0.0=
0        perf-sched.wait_time.max.ms.schedule_timeout.wait_for_completion._=
_flush_work.lru_add_drain_all
      0.00 =C2=B1191%     +88.6%       0.01 =C2=B1141%     -31.4%       0.0=
0 =C2=B1206%  perf-sched.wait_time.max.ms.schedule_timeout.wait_for_complet=
ion.affine_move_task.__set_cpus_allowed_ptr
      0.10 =C2=B1  6%      -3.1%       0.09 =C2=B1  5%      -1.4%       0.1=
0 =C2=B1  4%  perf-sched.wait_time.max.ms.schedule_timeout.wait_for_complet=
ion_interruptible.usb_stor_control_thread.kthread
      2048            +0.0%       2048            +0.0%       2048        p=
erf-sched.wait_time.max.ms.schedule_timeout.wait_for_completion_interruptib=
le_timeout.usb_stor_msg_common.usb_stor_bulk_transfer_buf
      1585 =C2=B1 32%      +1.9%       1615 =C2=B1 31%      -7.3%       146=
9 =C2=B1 35%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_fro=
m_fork
      0.00        +4.2e+98%       0.00 =C2=B1331%    -100.0%       0.00    =
    perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.d=
o_open.isra
      5388 =C2=B1 31%     -16.1%       4522 =C2=B1 36%     -11.8%       475=
1 =C2=B1 29%  perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fo=
rk
    190513            -0.0%     190442            -0.0%     190445        s=
labinfo.Acpi-Operand.active_objs
      3401            -0.0%       3400            -0.0%       3400        s=
labinfo.Acpi-Operand.active_slabs
    190523            -0.0%     190457            -0.0%     190457        s=
labinfo.Acpi-Operand.num_objs
      3401            -0.0%       3400            -0.0%       3400        s=
labinfo.Acpi-Operand.num_slabs
      1403 =C2=B1 11%      -0.3%       1399 =C2=B1  8%      -7.5%       129=
7 =C2=B1  8%  slabinfo.Acpi-Parse.active_objs
     19.22 =C2=B1 11%      -0.3%      19.17 =C2=B1  8%      -7.5%      17.7=
8 =C2=B1  8%  slabinfo.Acpi-Parse.active_slabs
      1403 =C2=B1 11%      -0.3%       1399 =C2=B1  8%      -7.5%       129=
7 =C2=B1  8%  slabinfo.Acpi-Parse.num_objs
     19.22 =C2=B1 11%      -0.3%      19.17 =C2=B1  8%      -7.5%      17.7=
8 =C2=B1  8%  slabinfo.Acpi-Parse.num_slabs
      4840 =C2=B1  4%      -3.2%       4686 =C2=B1  3%      +0.1%       484=
6 =C2=B1  3%  slabinfo.Acpi-State.active_objs
     94.56 =C2=B1  4%      -3.6%      91.17 =C2=B1  3%      -0.1%      94.4=
4 =C2=B1  2%  slabinfo.Acpi-State.active_slabs
      4840 =C2=B1  4%      -3.2%       4686 =C2=B1  3%      +0.1%       484=
6 =C2=B1  3%  slabinfo.Acpi-State.num_objs
     94.56 =C2=B1  4%      -3.6%      91.17 =C2=B1  3%      -0.1%      94.4=
4 =C2=B1  2%  slabinfo.Acpi-State.num_slabs
    202.67 =C2=B1  7%      -3.9%     194.67 =C2=B1  4%      -5.3%     192.0=
0        slabinfo.RAW.active_objs
      6.33 =C2=B1  7%      -3.9%       6.08 =C2=B1  4%      -5.3%       6.0=
0        slabinfo.RAW.active_slabs
    202.67 =C2=B1  7%      -3.9%     194.67 =C2=B1  4%      -5.3%     192.0=
0        slabinfo.RAW.num_objs
      6.33 =C2=B1  7%      -3.9%       6.08 =C2=B1  4%      -5.3%       6.0=
0        slabinfo.RAW.num_slabs
    104.00            +0.0%     104.00            +0.0%     104.00        s=
labinfo.RAWv6.active_objs
      4.00            +0.0%       4.00            +0.0%       4.00        s=
labinfo.RAWv6.active_slabs
    104.00            +0.0%     104.00            +0.0%     104.00        s=
labinfo.RAWv6.num_objs
      4.00            +0.0%       4.00            +0.0%       4.00        s=
labinfo.RAWv6.num_slabs
     56.00            -4.2%      53.67 =C2=B1  9%      +0.0%      56.00    =
    slabinfo.TCP.active_objs
      4.00            -4.2%       3.83 =C2=B1  9%      +0.0%       4.00    =
    slabinfo.TCP.active_slabs
     56.00            -4.2%      53.67 =C2=B1  9%      +0.0%      56.00    =
    slabinfo.TCP.num_objs
      4.00            -4.2%       3.83 =C2=B1  9%      +0.0%       4.00    =
    slabinfo.TCP.num_slabs
     39.00            -2.8%      37.92 =C2=B1  9%      +0.0%      39.00    =
    slabinfo.TCPv6.active_objs
      3.00            -2.8%       2.92 =C2=B1  9%      +0.0%       3.00    =
    slabinfo.TCPv6.active_slabs
     39.00            -2.8%      37.92 =C2=B1  9%      +0.0%      39.00    =
    slabinfo.TCPv6.num_objs
      3.00            -2.8%       2.92 =C2=B1  9%      +0.0%       3.00    =
    slabinfo.TCPv6.num_slabs
    162.11 =C2=B1  8%      +1.7%     164.83 =C2=B1  8%      -1.8%     159.2=
2 =C2=B1 10%  slabinfo.UDPv6.active_objs
      6.22 =C2=B1 10%      +1.8%       6.33 =C2=B1  9%      -1.8%       6.1=
1 =C2=B1 12%  slabinfo.UDPv6.active_slabs
    162.11 =C2=B1  8%      +1.7%     164.83 =C2=B1  8%      -1.8%     159.2=
2 =C2=B1 10%  slabinfo.UDPv6.num_objs
      6.22 =C2=B1 10%      +1.8%       6.33 =C2=B1  9%      -1.8%       6.1=
1 =C2=B1 12%  slabinfo.UDPv6.num_slabs
      1838 =C2=B1 15%      -1.3%       1815 =C2=B1 16%      +6.4%       195=
5 =C2=B1 12%  slabinfo.UNIX.active_objs
     60.89 =C2=B1 15%      -1.5%      60.00 =C2=B1 16%      +6.2%      64.6=
7 =C2=B1 12%  slabinfo.UNIX.active_slabs
      1838 =C2=B1 15%      -1.3%       1815 =C2=B1 16%      +6.4%       195=
5 =C2=B1 12%  slabinfo.UNIX.num_objs
     60.89 =C2=B1 15%      -1.5%      60.00 =C2=B1 16%      +6.2%      64.6=
7 =C2=B1 12%  slabinfo.UNIX.num_slabs
     25542 =C2=B1  4%      +2.5%      26173 =C2=B1  3%      +2.5%      2617=
3 =C2=B1  4%  slabinfo.anon_vma.active_objs
    554.67 =C2=B1  4%      +2.5%     568.58 =C2=B1  3%      +2.5%     568.4=
4 =C2=B1  4%  slabinfo.anon_vma.active_slabs
     25542 =C2=B1  4%      +2.5%      26190 =C2=B1  3%      +2.5%      2617=
3 =C2=B1  4%  slabinfo.anon_vma.num_objs
    554.67 =C2=B1  4%      +2.5%     568.58 =C2=B1  3%      +2.5%     568.4=
4 =C2=B1  4%  slabinfo.anon_vma.num_slabs
     60511 =C2=B1 10%      -1.1%      59846 =C2=B1  7%      +2.7%      6215=
0 =C2=B1  7%  slabinfo.anon_vma_chain.active_objs
    947.78 =C2=B1 10%      -1.0%     938.00 =C2=B1  7%      +2.7%     973.6=
7 =C2=B1  7%  slabinfo.anon_vma_chain.active_slabs
     60690 =C2=B1 10%      -1.0%      60066 =C2=B1  7%      +2.7%      6234=
4 =C2=B1  7%  slabinfo.anon_vma_chain.num_objs
    947.78 =C2=B1 10%      -1.0%     938.00 =C2=B1  7%      +2.7%     973.6=
7 =C2=B1  7%  slabinfo.anon_vma_chain.num_slabs
    231.00 =C2=B1 16%      -2.3%     225.75 =C2=B1 13%      -2.0%     226.3=
3 =C2=B1 16%  slabinfo.bdev_cache.active_objs
     11.00 =C2=B1 16%      -2.3%      10.75 =C2=B1 13%      -2.0%      10.7=
8 =C2=B1 16%  slabinfo.bdev_cache.active_slabs
    231.00 =C2=B1 16%      -2.3%     225.75 =C2=B1 13%      -2.0%     226.3=
3 =C2=B1 16%  slabinfo.bdev_cache.num_objs
     11.00 =C2=B1 16%      -2.3%      10.75 =C2=B1 13%      -2.0%      10.7=
8 =C2=B1 16%  slabinfo.bdev_cache.num_slabs
    105.33 =C2=B1 27%     -16.5%      88.00 =C2=B1 30%     -14.6%      90.0=
0 =C2=B1 28%  slabinfo.biovec-128.active_objs
      6.22 =C2=B1 24%     -11.6%       5.50 =C2=B1 30%     -10.7%       5.5=
6 =C2=B1 26%  slabinfo.biovec-128.active_slabs
    105.33 =C2=B1 27%     -16.5%      88.00 =C2=B1 30%     -14.6%      90.0=
0 =C2=B1 28%  slabinfo.biovec-128.num_objs
      6.22 =C2=B1 24%     -11.6%       5.50 =C2=B1 30%     -10.7%       5.5=
6 =C2=B1 26%  slabinfo.biovec-128.num_slabs
    304.89 =C2=B1 12%      +1.5%     309.33 =C2=B1 15%      +8.1%     329.6=
7 =C2=B1 10%  slabinfo.biovec-64.active_objs
      9.33 =C2=B1 11%      +3.6%       9.67 =C2=B1 15%      +9.5%      10.2=
2 =C2=B1 10%  slabinfo.biovec-64.active_slabs
    304.89 =C2=B1 12%      +1.5%     309.33 =C2=B1 15%      +8.1%     329.6=
7 =C2=B1 10%  slabinfo.biovec-64.num_objs
      9.33 =C2=B1 11%      +3.6%       9.67 =C2=B1 15%      +9.5%      10.2=
2 =C2=B1 10%  slabinfo.biovec-64.num_slabs
     97.78 =C2=B1 17%     -19.5%      78.67 =C2=B1  5%     -17.8%      80.3=
3 =C2=B1 15%  slabinfo.biovec-max.active_objs
     12.00 =C2=B1 16%     -18.1%       9.83 =C2=B1  5%     -16.7%      10.0=
0 =C2=B1 14%  slabinfo.biovec-max.active_slabs
     97.78 =C2=B1 17%     -19.5%      78.67 =C2=B1  5%     -17.8%      80.3=
3 =C2=B1 15%  slabinfo.biovec-max.num_objs
     12.00 =C2=B1 16%     -18.1%       9.83 =C2=B1  5%     -16.7%      10.0=
0 =C2=B1 14%  slabinfo.biovec-max.num_slabs
     49.89 =C2=B1 92%    -100.0%       0.00           -77.1%      11.44 =C2=
=B1282%  slabinfo.btrfs_delayed_tree_ref.active_objs
      0.89 =C2=B1 98%    -100.0%       0.00           -75.0%       0.22 =C2=
=B1282%  slabinfo.btrfs_delayed_tree_ref.active_slabs
     49.89 =C2=B1 92%    -100.0%       0.00           -77.1%      11.44 =C2=
=B1282%  slabinfo.btrfs_delayed_tree_ref.num_objs
      0.89 =C2=B1 98%    -100.0%       0.00           -75.0%       0.22 =C2=
=B1282%  slabinfo.btrfs_delayed_tree_ref.num_slabs
    167.44 =C2=B1 59%     -66.6%      56.00           -53.3%      78.22 =C2=
=B1 80%  slabinfo.btrfs_extent_map.active_objs
      2.67 =C2=B1 55%     -62.5%       1.00           -50.0%       1.33 =C2=
=B1 70%  slabinfo.btrfs_extent_map.active_slabs
    167.44 =C2=B1 59%     -66.6%      56.00           -53.3%      78.22 =C2=
=B1 80%  slabinfo.btrfs_extent_map.num_objs
      2.67 =C2=B1 55%     -62.5%       1.00           -50.0%       1.33 =C2=
=B1 70%  slabinfo.btrfs_extent_map.num_slabs
    145.89 =C2=B1 21%     -23.2%     112.00           -23.6%     111.44 =C2=
=B1 19%  slabinfo.btrfs_inode.active_objs
      4.78 =C2=B1 16%     -16.3%       4.00           -18.6%       3.89 =C2=
=B1 14%  slabinfo.btrfs_inode.active_slabs
    145.89 =C2=B1 21%     -23.2%     112.00           -23.6%     111.44 =C2=
=B1 19%  slabinfo.btrfs_inode.num_objs
      4.78 =C2=B1 16%     -16.3%       4.00           -18.6%       3.89 =C2=
=B1 14%  slabinfo.btrfs_inode.num_slabs
     29.22 =C2=B1 97%    -100.0%       0.00           -75.3%       7.22 =C2=
=B1282%  slabinfo.btrfs_ordered_extent.active_objs
      0.33 =C2=B1141%    -100.0%       0.00           -66.7%       0.11 =C2=
=B1282%  slabinfo.btrfs_ordered_extent.active_slabs
     29.22 =C2=B1 97%    -100.0%       0.00           -75.3%       7.22 =C2=
=B1282%  slabinfo.btrfs_ordered_extent.num_objs
      0.33 =C2=B1141%    -100.0%       0.00           -66.7%       0.11 =C2=
=B1282%  slabinfo.btrfs_ordered_extent.num_slabs
    517.22 =C2=B1 13%     -25.9%     383.33 =C2=B1 14%      -3.7%     498.2=
2 =C2=B1 13%  slabinfo.buffer_head.active_objs
     12.78 =C2=B1 14%     -26.3%       9.42 =C2=B1 15%      -4.3%      12.2=
2 =C2=B1 15%  slabinfo.buffer_head.active_slabs
    517.22 =C2=B1 13%     -25.9%     383.33 =C2=B1 14%      -3.7%     498.2=
2 =C2=B1 13%  slabinfo.buffer_head.num_objs
     12.78 =C2=B1 14%     -26.3%       9.42 =C2=B1 15%      -4.3%      12.2=
2 =C2=B1 15%  slabinfo.buffer_head.num_slabs
      6567 =C2=B1  3%      +2.9%       6761 =C2=B1  5%      -0.7%       651=
9 =C2=B1  3%  slabinfo.cred_jar.active_objs
    155.44 =C2=B1  3%      +3.0%     160.08 =C2=B1  5%      -0.6%     154.5=
6 =C2=B1  3%  slabinfo.cred_jar.active_slabs
      6567 =C2=B1  3%      +2.9%       6761 =C2=B1  5%      -0.7%       651=
9 =C2=B1  3%  slabinfo.cred_jar.num_objs
    155.44 =C2=B1  3%      +3.0%     160.08 =C2=B1  5%      -0.6%     154.5=
6 =C2=B1  3%  slabinfo.cred_jar.num_slabs
     42.00            +0.0%      42.00            +0.0%      42.00        s=
labinfo.dax_cache.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dax_cache.active_slabs
     42.00            +0.0%      42.00            +0.0%      42.00        s=
labinfo.dax_cache.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dax_cache.num_slabs
    129308 =C2=B1  2%      -0.5%     128608 =C2=B1  2%      +0.5%     12996=
7 =C2=B1  3%  slabinfo.dentry.active_objs
      3115 =C2=B1  2%      -0.5%       3098 =C2=B1  3%      +0.7%       313=
7 =C2=B1  2%  slabinfo.dentry.active_slabs
    130891 =C2=B1  2%      -0.5%     130174 =C2=B1  3%      +0.7%     13177=
6 =C2=B1  2%  slabinfo.dentry.num_objs
      3115 =C2=B1  2%      -0.5%       3098 =C2=B1  3%      +0.7%       313=
7 =C2=B1  2%  slabinfo.dentry.num_slabs
     32.00            +0.0%      32.00            +0.0%      32.00        s=
labinfo.dma-kmalloc-512.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dma-kmalloc-512.active_slabs
     32.00            +0.0%      32.00            +0.0%      32.00        s=
labinfo.dma-kmalloc-512.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dma-kmalloc-512.num_slabs
     30.00            +0.0%      30.00            +0.0%      30.00        s=
labinfo.dmaengine-unmap-128.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dmaengine-unmap-128.active_slabs
     30.00            +0.0%      30.00            +0.0%      30.00        s=
labinfo.dmaengine-unmap-128.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dmaengine-unmap-128.num_slabs
      1784 =C2=B1 11%     +12.8%       2012 =C2=B1 11%      -6.7%       166=
4 =C2=B1 14%  slabinfo.dmaengine-unmap-16.active_objs
     42.11 =C2=B1 11%     +12.6%      47.42 =C2=B1 12%      -6.9%      39.2=
2 =C2=B1 14%  slabinfo.dmaengine-unmap-16.active_slabs
      1784 =C2=B1 11%     +12.8%       2012 =C2=B1 11%      -6.7%       166=
4 =C2=B1 14%  slabinfo.dmaengine-unmap-16.num_objs
     42.11 =C2=B1 11%     +12.6%      47.42 =C2=B1 12%      -6.9%      39.2=
2 =C2=B1 14%  slabinfo.dmaengine-unmap-16.num_slabs
     15.00            +0.0%      15.00            +0.0%      15.00        s=
labinfo.dmaengine-unmap-256.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dmaengine-unmap-256.active_slabs
     15.00            +0.0%      15.00            +0.0%      15.00        s=
labinfo.dmaengine-unmap-256.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dmaengine-unmap-256.num_slabs
     20864 =C2=B1 11%      +1.5%      21184 =C2=B1  9%      -2.5%      2034=
3 =C2=B1 16%  slabinfo.ep_head.active_objs
     81.33 =C2=B1 11%      +1.6%      82.67 =C2=B1  9%      -2.3%      79.4=
4 =C2=B1 16%  slabinfo.ep_head.active_slabs
     20864 =C2=B1 11%      +1.5%      21184 =C2=B1  9%      -2.5%      2034=
3 =C2=B1 16%  slabinfo.ep_head.num_objs
     81.33 =C2=B1 11%      +1.6%      82.67 =C2=B1  9%      -2.3%      79.4=
4 =C2=B1 16%  slabinfo.ep_head.num_slabs
      1070 =C2=B1  8%      +6.5%       1141 =C2=B1  6%      +3.0%       110=
3 =C2=B1  8%  slabinfo.file_lock_cache.active_objs
     28.44 =C2=B1  8%      +6.6%      30.33 =C2=B1  6%      +3.1%      29.3=
3 =C2=B1  9%  slabinfo.file_lock_cache.active_slabs
      1070 =C2=B1  8%      +6.5%       1141 =C2=B1  6%      +3.0%       110=
3 =C2=B1  8%  slabinfo.file_lock_cache.num_objs
     28.44 =C2=B1  8%      +6.6%      30.33 =C2=B1  6%      +3.1%      29.3=
3 =C2=B1  9%  slabinfo.file_lock_cache.num_slabs
      4040 =C2=B1  5%      -1.8%       3965 =C2=B1  5%      -0.7%       401=
1 =C2=B1  4%  slabinfo.files_cache.active_objs
     87.11 =C2=B1  5%      -1.8%      85.50 =C2=B1  6%      -0.5%      86.6=
7 =C2=B1  4%  slabinfo.files_cache.active_slabs
      4040 =C2=B1  5%      -1.8%       3965 =C2=B1  5%      -0.7%       401=
1 =C2=B1  4%  slabinfo.files_cache.num_objs
     87.11 =C2=B1  5%      -1.8%      85.50 =C2=B1  6%      -0.5%      86.6=
7 =C2=B1  4%  slabinfo.files_cache.num_slabs
     27299 =C2=B1  3%      +0.8%      27509 =C2=B1  5%      +1.2%      2762=
8 =C2=B1  5%  slabinfo.filp.active_objs
    874.11 =C2=B1  3%      +1.6%     888.33 =C2=B1  6%      +1.4%     886.1=
1 =C2=B1  4%  slabinfo.filp.active_slabs
     27988 =C2=B1  3%      +1.6%      28442 =C2=B1  6%      +1.4%      2837=
2 =C2=B1  4%  slabinfo.filp.num_objs
    874.11 =C2=B1  3%      +1.6%     888.33 =C2=B1  6%      +1.4%     886.1=
1 =C2=B1  4%  slabinfo.filp.num_slabs
      3029 =C2=B1 14%      -1.3%       2990 =C2=B1 13%      -4.1%       290=
4 =C2=B1 14%  slabinfo.fsnotify_mark_connector.active_objs
     23.33 =C2=B1 15%      -2.1%      22.83 =C2=B1 12%      -3.8%      22.4=
4 =C2=B1 14%  slabinfo.fsnotify_mark_connector.active_slabs
      3029 =C2=B1 14%      -1.3%       2990 =C2=B1 13%      -4.1%       290=
4 =C2=B1 14%  slabinfo.fsnotify_mark_connector.num_objs
     23.33 =C2=B1 15%      -2.1%      22.83 =C2=B1 12%      -3.8%      22.4=
4 =C2=B1 14%  slabinfo.fsnotify_mark_connector.num_slabs
     30779            -0.1%      30762            -0.2%      30722        s=
labinfo.ftrace_event_field.active_objs
    362.11            -0.1%     361.92            -0.2%     361.44        s=
labinfo.ftrace_event_field.active_slabs
     30779            -0.1%      30762            -0.2%      30722        s=
labinfo.ftrace_event_field.num_objs
    362.11            -0.1%     361.92            -0.2%     361.44        s=
labinfo.ftrace_event_field.num_slabs
    106.00            +0.0%     106.00            +0.0%     106.00        s=
labinfo.hugetlbfs_inode_cache.active_objs
      2.00            +0.0%       2.00            +0.0%       2.00        s=
labinfo.hugetlbfs_inode_cache.active_slabs
    106.00            +0.0%     106.00            +0.0%     106.00        s=
labinfo.hugetlbfs_inode_cache.num_objs
      2.00            +0.0%       2.00            +0.0%       2.00        s=
labinfo.hugetlbfs_inode_cache.num_slabs
     85772            +0.1%      85889            +0.1%      85851        s=
labinfo.inode_cache.active_objs
      1562            +0.1%       1564            +0.1%       1563        s=
labinfo.inode_cache.active_slabs
     85947            +0.1%      86055            +0.1%      86029        s=
labinfo.inode_cache.num_objs
      1562            +0.1%       1564            +0.1%       1563        s=
labinfo.inode_cache.num_slabs
     85009            -0.1%      84887            -0.2%      84859        s=
labinfo.kernfs_node_cache.active_objs
      2656            -0.1%       2652            -0.2%       2651        s=
labinfo.kernfs_node_cache.active_slabs
     85009            -0.1%      84887            -0.2%      84859        s=
labinfo.kernfs_node_cache.num_objs
      2656            -0.1%       2652            -0.2%       2651        s=
labinfo.kernfs_node_cache.num_slabs
      1819 =C2=B1 14%      -2.2%       1780 =C2=B1  8%      -4.6%       173=
5 =C2=B1  9%  slabinfo.khugepaged_mm_slot.active_objs
     49.89 =C2=B1 14%      -2.3%      48.75 =C2=B1  8%      -5.1%      47.3=
3 =C2=B1  9%  slabinfo.khugepaged_mm_slot.active_slabs
      1819 =C2=B1 14%      -2.2%       1780 =C2=B1  8%      -4.6%       173=
5 =C2=B1  9%  slabinfo.khugepaged_mm_slot.num_objs
     49.89 =C2=B1 14%      -2.3%      48.75 =C2=B1  8%      -5.1%      47.3=
3 =C2=B1  9%  slabinfo.khugepaged_mm_slot.num_slabs
      5340            -1.0%       5289            -1.0%       5289        s=
labinfo.kmalloc-128.active_objs
    167.56            -0.9%     166.00            -0.9%     166.00        s=
labinfo.kmalloc-128.active_slabs
      5368            -1.0%       5315            -0.9%       5318        s=
labinfo.kmalloc-128.num_objs
    167.56            -0.9%     166.00            -0.9%     166.00        s=
labinfo.kmalloc-128.num_slabs
     35224            -0.0%      35211            -0.4%      35094        s=
labinfo.kmalloc-16.active_objs
    137.78            +0.0%     137.83            -0.2%     137.44        s=
labinfo.kmalloc-16.active_slabs
     35271            +0.0%      35285            -0.2%      35185        s=
labinfo.kmalloc-16.num_objs
    137.78            +0.0%     137.83            -0.2%     137.44        s=
labinfo.kmalloc-16.num_slabs
      5246            -0.0%       5245            +0.0%       5248        s=
labinfo.kmalloc-192.active_objs
    127.78            +0.6%     128.50            +0.7%     128.67        s=
labinfo.kmalloc-192.active_slabs
      5375            +0.4%       5397            +0.5%       5404        s=
labinfo.kmalloc-192.num_objs
    127.78            +0.6%     128.50            +0.7%     128.67        s=
labinfo.kmalloc-192.num_slabs
      5297 =C2=B1  3%      -1.4%       5220 =C2=B1  2%      -1.6%       521=
2        slabinfo.kmalloc-1k.active_objs
    166.11 =C2=B1  2%      -1.3%     163.92 =C2=B1  2%      -1.4%     163.7=
8        slabinfo.kmalloc-1k.active_slabs
      5334 =C2=B1  3%      -1.4%       5260 =C2=B1  2%      -1.6%       525=
0        slabinfo.kmalloc-1k.num_objs
    166.11 =C2=B1  2%      -1.3%     163.92 =C2=B1  2%      -1.4%     163.7=
8        slabinfo.kmalloc-1k.num_slabs
      9590 =C2=B1  4%      +1.4%       9720 =C2=B1  5%      +1.1%       969=
7 =C2=B1  4%  slabinfo.kmalloc-256.active_objs
    299.33 =C2=B1  4%      +1.3%     303.33 =C2=B1  5%      +1.2%     302.7=
8 =C2=B1  4%  slabinfo.kmalloc-256.active_slabs
      9590 =C2=B1  4%      +1.4%       9720 =C2=B1  5%      +1.1%       969=
8 =C2=B1  4%  slabinfo.kmalloc-256.num_objs
    299.33 =C2=B1  4%      +1.3%     303.33 =C2=B1  5%      +1.2%     302.7=
8 =C2=B1  4%  slabinfo.kmalloc-256.num_slabs
      5215 =C2=B1  3%      +2.1%       5325 =C2=B1  5%      +3.3%       538=
7 =C2=B1  3%  slabinfo.kmalloc-2k.active_objs
    329.89 =C2=B1  3%      +2.3%     337.42 =C2=B1  5%      +3.3%     340.7=
8 =C2=B1  3%  slabinfo.kmalloc-2k.active_slabs
      5285 =C2=B1  3%      +2.3%       5404 =C2=B1  5%      +3.3%       546=
1 =C2=B1  3%  slabinfo.kmalloc-2k.num_objs
    329.89 =C2=B1  3%      +2.3%     337.42 =C2=B1  5%      +3.3%     340.7=
8 =C2=B1  3%  slabinfo.kmalloc-2k.num_slabs
     67287            +0.9%      67884            +0.1%      67360        s=
labinfo.kmalloc-32.active_objs
    526.44            +0.9%     531.08            +0.0%     526.67        s=
labinfo.kmalloc-32.active_slabs
     67456            +0.9%      68072            +0.1%      67505        s=
labinfo.kmalloc-32.num_objs
    526.44            +0.9%     531.08            +0.0%     526.67        s=
labinfo.kmalloc-32.num_slabs
      1906            -0.7%       1893            -0.5%       1897        s=
labinfo.kmalloc-4k.active_objs
    242.89            -0.7%     241.25            -0.5%     241.67        s=
labinfo.kmalloc-4k.active_slabs
      1947            -0.6%       1935            -0.4%       1938        s=
labinfo.kmalloc-4k.num_objs
    242.89            -0.7%     241.25            -0.5%     241.67        s=
labinfo.kmalloc-4k.num_slabs
     15912 =C2=B1  4%      -0.5%      15837 =C2=B1  3%      -1.2%      1572=
1 =C2=B1  2%  slabinfo.kmalloc-512.active_objs
    499.22 =C2=B1  4%      -0.5%     496.92 =C2=B1  3%      -1.1%     493.6=
7 =C2=B1  2%  slabinfo.kmalloc-512.active_slabs
     15993 =C2=B1  4%      -0.5%      15914 =C2=B1  3%      -1.1%      1581=
3 =C2=B1  2%  slabinfo.kmalloc-512.num_objs
    499.22 =C2=B1  4%      -0.5%     496.92 =C2=B1  3%      -1.1%     493.6=
7 =C2=B1  2%  slabinfo.kmalloc-512.num_slabs
     50201            -0.5%      49952            -0.3%      50039        s=
labinfo.kmalloc-64.active_objs
    787.33            -0.5%     783.25            -0.4%     784.33        s=
labinfo.kmalloc-64.active_slabs
     50425            -0.5%      50169            -0.4%      50230        s=
labinfo.kmalloc-64.num_objs
    787.33            -0.5%     783.25            -0.4%     784.33        s=
labinfo.kmalloc-64.num_slabs
     53715            +0.2%      53832            -0.1%      53682        s=
labinfo.kmalloc-8.active_objs
    107.56            +0.6%     108.25 =C2=B1  2%      -0.1%     107.44 =C2=
=B1  2%  slabinfo.kmalloc-8.active_slabs
     55068            +0.7%      55466 =C2=B1  2%      +0.1%      55115    =
    slabinfo.kmalloc-8.num_objs
    107.56            +0.6%     108.25 =C2=B1  2%      -0.1%     107.44 =C2=
=B1  2%  slabinfo.kmalloc-8.num_slabs
    779.44            -0.1%     778.75            -0.1%     778.78        s=
labinfo.kmalloc-8k.active_objs
    200.56            -0.1%     200.42            -0.1%     200.44        s=
labinfo.kmalloc-8k.active_slabs
    804.11            -0.1%     803.67            -0.1%     803.22        s=
labinfo.kmalloc-8k.num_objs
    200.56            -0.1%     200.42            -0.1%     200.44        s=
labinfo.kmalloc-8k.num_slabs
      7532 =C2=B1  3%      +3.7%       7807 =C2=B1  3%      +5.7%       796=
1 =C2=B1  2%  slabinfo.kmalloc-96.active_objs
    180.78 =C2=B1  3%      +3.7%     187.50 =C2=B1  3%      +5.8%     191.2=
2 =C2=B1  3%  slabinfo.kmalloc-96.active_slabs
      7612 =C2=B1  3%      +3.7%       7896 =C2=B1  3%      +5.7%       804=
8 =C2=B1  2%  slabinfo.kmalloc-96.num_objs
    180.78 =C2=B1  3%      +3.7%     187.50 =C2=B1  3%      +5.8%     191.2=
2 =C2=B1  3%  slabinfo.kmalloc-96.num_slabs
    362.44 =C2=B1 30%      +6.8%     387.25 =C2=B1 33%      -2.2%     354.3=
3 =C2=B1 23%  slabinfo.kmalloc-cg-16.active_objs
      1.22 =C2=B1 34%     -11.4%       1.08 =C2=B1 25%     -18.2%       1.0=
0        slabinfo.kmalloc-cg-16.active_slabs
    362.44 =C2=B1 30%      +6.8%     387.25 =C2=B1 33%      -2.2%     354.3=
3 =C2=B1 23%  slabinfo.kmalloc-cg-16.num_objs
      1.22 =C2=B1 34%     -11.4%       1.08 =C2=B1 25%     -18.2%       1.0=
0        slabinfo.kmalloc-cg-16.num_slabs
      3251 =C2=B1  8%      -0.4%       3239 =C2=B1  7%      +0.2%       325=
6 =C2=B1  6%  slabinfo.kmalloc-cg-192.active_objs
     76.78 =C2=B1  8%      -0.3%      76.58 =C2=B1  7%      +0.3%      77.0=
0 =C2=B1  6%  slabinfo.kmalloc-cg-192.active_slabs
      3251 =C2=B1  8%      -0.4%       3239 =C2=B1  7%      +0.2%       325=
6 =C2=B1  6%  slabinfo.kmalloc-cg-192.num_objs
     76.78 =C2=B1  8%      -0.3%      76.58 =C2=B1  7%      +0.3%      77.0=
0 =C2=B1  6%  slabinfo.kmalloc-cg-192.num_slabs
      3356 =C2=B1  7%      -1.8%       3296 =C2=B1  6%      -1.5%       330=
6 =C2=B1  6%  slabinfo.kmalloc-cg-1k.active_objs
    104.22 =C2=B1  7%      -1.0%     103.17 =C2=B1  6%      -1.3%     102.8=
9 =C2=B1  6%  slabinfo.kmalloc-cg-1k.active_slabs
      3356 =C2=B1  7%      -1.1%       3320 =C2=B1  6%      -1.5%       330=
6 =C2=B1  6%  slabinfo.kmalloc-cg-1k.num_objs
    104.22 =C2=B1  7%      -1.0%     103.17 =C2=B1  6%      -1.3%     102.8=
9 =C2=B1  6%  slabinfo.kmalloc-cg-1k.num_slabs
    502.22 =C2=B1  6%      +4.8%     526.25 =C2=B1  7%      +7.1%     537.7=
8 =C2=B1 13%  slabinfo.kmalloc-cg-256.active_objs
     15.11 =C2=B1  7%      +4.2%      15.75 =C2=B1  8%      +7.4%      16.2=
2 =C2=B1 13%  slabinfo.kmalloc-cg-256.active_slabs
    502.22 =C2=B1  6%      +4.8%     526.25 =C2=B1  7%      +7.1%     537.7=
8 =C2=B1 13%  slabinfo.kmalloc-cg-256.num_objs
     15.11 =C2=B1  7%      +4.2%      15.75 =C2=B1  8%      +7.4%      16.2=
2 =C2=B1 13%  slabinfo.kmalloc-cg-256.num_slabs
    305.22 =C2=B1 11%      -8.6%     278.83 =C2=B1 15%      -9.9%     275.1=
1 =C2=B1  8%  slabinfo.kmalloc-cg-2k.active_objs
     18.56 =C2=B1 10%     -10.2%      16.67 =C2=B1 16%     -11.4%      16.4=
4 =C2=B1  9%  slabinfo.kmalloc-cg-2k.active_slabs
    305.22 =C2=B1 11%      -8.6%     278.83 =C2=B1 15%      -9.9%     275.1=
1 =C2=B1  8%  slabinfo.kmalloc-cg-2k.num_objs
     18.56 =C2=B1 10%     -10.2%      16.67 =C2=B1 16%     -11.4%      16.4=
4 =C2=B1  9%  slabinfo.kmalloc-cg-2k.num_slabs
     10395 =C2=B1 10%      -0.7%      10326 =C2=B1  9%      +4.5%      1086=
8 =C2=B1  6%  slabinfo.kmalloc-cg-32.active_objs
     80.67 =C2=B1 10%      -0.8%      80.00 =C2=B1  9%      +4.4%      84.2=
2 =C2=B1  5%  slabinfo.kmalloc-cg-32.active_slabs
     10395 =C2=B1 10%      -0.7%      10326 =C2=B1  9%      +4.5%      1086=
8 =C2=B1  6%  slabinfo.kmalloc-cg-32.num_objs
     80.67 =C2=B1 10%      -0.8%      80.00 =C2=B1  9%      +4.4%      84.2=
2 =C2=B1  5%  slabinfo.kmalloc-cg-32.num_slabs
    768.00            +0.0%     768.00            +0.0%     768.00        s=
labinfo.kmalloc-cg-4k.active_objs
     96.00            +0.0%      96.00            +0.0%      96.00        s=
labinfo.kmalloc-cg-4k.active_slabs
    768.00            +0.0%     768.00            +0.0%     768.00        s=
labinfo.kmalloc-cg-4k.num_objs
     96.00            +0.0%      96.00            +0.0%      96.00        s=
labinfo.kmalloc-cg-4k.num_slabs
      3068            -0.2%       3063            +0.0%       3068        s=
labinfo.kmalloc-cg-512.active_objs
     95.89            -0.2%      95.67            +0.0%      95.89        s=
labinfo.kmalloc-cg-512.active_slabs
      3068            -0.2%       3063            +0.0%       3068        s=
labinfo.kmalloc-cg-512.num_objs
     95.89            -0.2%      95.67            +0.0%      95.89        s=
labinfo.kmalloc-cg-512.num_slabs
      1855 =C2=B1  9%      +0.7%       1869 =C2=B1  6%      -1.3%       183=
0 =C2=B1  8%  slabinfo.kmalloc-cg-64.active_objs
     28.22 =C2=B1  9%      +0.7%      28.42 =C2=B1  7%      -0.8%      28.0=
0 =C2=B1  9%  slabinfo.kmalloc-cg-64.active_slabs
      1855 =C2=B1  9%      +0.7%       1869 =C2=B1  6%      -1.3%       183=
0 =C2=B1  8%  slabinfo.kmalloc-cg-64.num_objs
     28.22 =C2=B1  9%      +0.7%      28.42 =C2=B1  7%      -0.8%      28.0=
0 =C2=B1  9%  slabinfo.kmalloc-cg-64.num_slabs
     49606            -0.2%      49523            -0.2%      49511        s=
labinfo.kmalloc-cg-8.active_objs
     96.67            -0.3%      96.42            -0.1%      96.56        s=
labinfo.kmalloc-cg-8.active_slabs
     49606            -0.2%      49523            -0.2%      49511        s=
labinfo.kmalloc-cg-8.num_objs
     96.67            -0.3%      96.42            -0.1%      96.56        s=
labinfo.kmalloc-cg-8.num_slabs
     35.00            -2.9%      34.00 =C2=B1  5%      -1.3%      34.56 =C2=
=B1  3%  slabinfo.kmalloc-cg-8k.active_objs
      8.00            -3.1%       7.75 =C2=B1  5%      -1.4%       7.89 =C2=
=B1  3%  slabinfo.kmalloc-cg-8k.active_slabs
     35.00            -2.9%      34.00 =C2=B1  5%      -1.3%      34.56 =C2=
=B1  3%  slabinfo.kmalloc-cg-8k.num_objs
      8.00            -3.1%       7.75 =C2=B1  5%      -1.4%       7.89 =C2=
=B1  3%  slabinfo.kmalloc-cg-8k.num_slabs
    447.00 =C2=B1 10%      -5.5%     422.50 =C2=B1 11%      -2.1%     437.6=
7 =C2=B1  6%  slabinfo.kmalloc-cg-96.active_objs
      9.67 =C2=B1 11%      -6.0%       9.08 =C2=B1 12%      -2.3%       9.4=
4 =C2=B1  7%  slabinfo.kmalloc-cg-96.active_slabs
    447.00 =C2=B1 10%      -5.5%     422.50 =C2=B1 11%      -2.1%     437.6=
7 =C2=B1  6%  slabinfo.kmalloc-cg-96.num_objs
      9.67 =C2=B1 11%      -6.0%       9.08 =C2=B1 12%      -2.3%       9.4=
4 =C2=B1  7%  slabinfo.kmalloc-cg-96.num_slabs
      1144 =C2=B1 24%      +6.2%       1216 =C2=B1 10%      +1.9%       116=
6 =C2=B1 17%  slabinfo.kmalloc-rcl-128.active_objs
     36.00 =C2=B1 22%      +5.6%      38.00 =C2=B1 10%      +1.2%      36.4=
4 =C2=B1 17%  slabinfo.kmalloc-rcl-128.active_slabs
      1152 =C2=B1 22%      +5.6%       1216 =C2=B1 10%      +1.2%       116=
6 =C2=B1 17%  slabinfo.kmalloc-rcl-128.num_objs
     36.00 =C2=B1 22%      +5.6%      38.00 =C2=B1 10%      +1.2%      36.4=
4 =C2=B1 17%  slabinfo.kmalloc-rcl-128.num_slabs
     93.33 =C2=B1 18%     -13.8%      80.50 =C2=B1 14%      -5.0%      88.6=
7 =C2=B1 14%  slabinfo.kmalloc-rcl-192.active_objs
      2.22 =C2=B1 18%     -13.8%       1.92 =C2=B1 14%      -5.0%       2.1=
1 =C2=B1 14%  slabinfo.kmalloc-rcl-192.active_slabs
     93.33 =C2=B1 18%     -13.8%      80.50 =C2=B1 14%      -5.0%      88.6=
7 =C2=B1 14%  slabinfo.kmalloc-rcl-192.num_objs
      2.22 =C2=B1 18%     -13.8%       1.92 =C2=B1 14%      -5.0%       2.1=
1 =C2=B1 14%  slabinfo.kmalloc-rcl-192.num_slabs
      7850 =C2=B1  4%      +1.5%       7969 =C2=B1  3%      +1.3%       795=
4 =C2=B1  4%  slabinfo.kmalloc-rcl-64.active_objs
    123.33 =C2=B1  4%      +0.9%     124.50 =C2=B1  3%      +1.6%     125.3=
3 =C2=B1  3%  slabinfo.kmalloc-rcl-64.active_slabs
      7936 =C2=B1  4%      +1.1%       8021 =C2=B1  3%      +1.5%       805=
9 =C2=B1  3%  slabinfo.kmalloc-rcl-64.num_objs
    123.33 =C2=B1  4%      +0.9%     124.50 =C2=B1  3%      +1.6%     125.3=
3 =C2=B1  3%  slabinfo.kmalloc-rcl-64.num_slabs
      2616 =C2=B1 20%      +0.5%       2630 =C2=B1 18%      -2.9%       254=
0 =C2=B1 19%  slabinfo.kmalloc-rcl-96.active_objs
     62.11 =C2=B1 20%      +0.2%      62.25 =C2=B1 18%      -2.9%      60.3=
3 =C2=B1 19%  slabinfo.kmalloc-rcl-96.active_slabs
      2616 =C2=B1 20%      +0.5%       2630 =C2=B1 18%      -2.9%       254=
0 =C2=B1 19%  slabinfo.kmalloc-rcl-96.num_objs
     62.11 =C2=B1 20%      +0.2%      62.25 =C2=B1 18%      -2.9%      60.3=
3 =C2=B1 19%  slabinfo.kmalloc-rcl-96.num_slabs
    387.56 =C2=B1  8%      -0.2%     386.67 =C2=B1  9%      +0.0%     387.5=
6 =C2=B1  9%  slabinfo.kmem_cache.active_objs
     12.11 =C2=B1  8%      -0.2%      12.08 =C2=B1  9%      +0.0%      12.1=
1 =C2=B1  9%  slabinfo.kmem_cache.active_slabs
    387.56 =C2=B1  8%      -0.2%     386.67 =C2=B1  9%      +0.0%     387.5=
6 =C2=B1  9%  slabinfo.kmem_cache.num_objs
     12.11 =C2=B1  8%      -0.2%      12.08 =C2=B1  9%      +0.0%      12.1=
1 =C2=B1  9%  slabinfo.kmem_cache.num_slabs
    787.78 =C2=B1  7%      +0.5%     791.33 =C2=B1  7%      +0.0%     787.7=
8 =C2=B1  7%  slabinfo.kmem_cache_node.active_objs
     12.78 =C2=B1  7%      +0.4%      12.83 =C2=B1  7%      +0.0%      12.7=
8 =C2=B1  7%  slabinfo.kmem_cache_node.active_slabs
    817.78 =C2=B1  7%      +0.4%     821.33 =C2=B1  7%      +0.0%     817.7=
8 =C2=B1  7%  slabinfo.kmem_cache_node.num_objs
     12.78 =C2=B1  7%      +0.4%      12.83 =C2=B1  7%      +0.0%      12.7=
8 =C2=B1  7%  slabinfo.kmem_cache_node.num_slabs
     18770 =C2=B1  2%      +0.4%      18836            +1.2%      18997    =
    slabinfo.lsm_file_cache.active_objs
    109.44 =C2=B1  2%      +0.4%     109.83            +1.2%     110.78    =
    slabinfo.lsm_file_cache.active_slabs
     18770 =C2=B1  2%      +0.4%      18836            +1.2%      18997    =
    slabinfo.lsm_file_cache.num_objs
    109.44 =C2=B1  2%      +0.4%     109.83            +1.2%     110.78    =
    slabinfo.lsm_file_cache.num_slabs
      2960 =C2=B1  2%      -0.5%       2944 =C2=B1  3%      +0.3%       296=
9 =C2=B1  3%  slabinfo.mm_struct.active_objs
     98.00 =C2=B1  2%      -0.3%      97.67 =C2=B1  3%      +0.3%      98.3=
3 =C2=B1  2%  slabinfo.mm_struct.active_slabs
      2960 =C2=B1  2%      -0.5%       2944 =C2=B1  3%      +0.3%       296=
9 =C2=B1  3%  slabinfo.mm_struct.num_objs
     98.00 =C2=B1  2%      -0.3%      97.67 =C2=B1  3%      +0.3%      98.3=
3 =C2=B1  2%  slabinfo.mm_struct.num_slabs
      1112 =C2=B1  6%      -9.1%       1010 =C2=B1  8%      -8.5%       101=
7 =C2=B1  8%  slabinfo.mnt_cache.active_objs
     21.11 =C2=B1  6%      -9.6%      19.08 =C2=B1  8%     -10.0%      19.0=
0 =C2=B1  8%  slabinfo.mnt_cache.active_slabs
      1112 =C2=B1  6%      -9.1%       1010 =C2=B1  8%      -8.5%       101=
7 =C2=B1  8%  slabinfo.mnt_cache.num_objs
     21.11 =C2=B1  6%      -9.6%      19.08 =C2=B1  8%     -10.0%      19.0=
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
      8212 =C2=B1  9%      -0.8%       8145 =C2=B1  7%      +4.0%       853=
8 =C2=B1  5%  slabinfo.pde_opener.active_objs
     80.00 =C2=B1  9%      -1.0%      79.17 =C2=B1  7%      +3.9%      83.1=
1 =C2=B1  5%  slabinfo.pde_opener.active_slabs
      8212 =C2=B1  9%      -0.8%       8145 =C2=B1  7%      +4.0%       853=
8 =C2=B1  5%  slabinfo.pde_opener.num_objs
     80.00 =C2=B1  9%      -1.0%      79.17 =C2=B1  7%      +3.9%      83.1=
1 =C2=B1  5%  slabinfo.pde_opener.num_slabs
      4075            -0.9%       4037 =C2=B1  2%      +0.2%       4084    =
    slabinfo.perf_event.active_objs
    153.89            -0.8%     152.67            +0.2%     154.22        s=
labinfo.perf_event.active_slabs
      4166            -0.8%       4133            +0.1%       4172        s=
labinfo.perf_event.num_objs
    153.89            -0.8%     152.67            +0.2%     154.22        s=
labinfo.perf_event.num_slabs
      4703 =C2=B1  3%      +3.2%       4852 =C2=B1  3%      +1.1%       475=
7 =C2=B1  4%  slabinfo.pid.active_objs
    146.11 =C2=B1  3%      +3.2%     150.83 =C2=B1  3%      +1.1%     147.7=
8 =C2=B1  4%  slabinfo.pid.active_slabs
      4703 =C2=B1  3%      +3.2%       4852 =C2=B1  3%      +1.1%       475=
7 =C2=B1  4%  slabinfo.pid.num_objs
    146.11 =C2=B1  3%      +3.2%     150.83 =C2=B1  3%      +1.1%     147.7=
8 =C2=B1  4%  slabinfo.pid.num_slabs
      1509 =C2=B1  8%      -4.0%       1449 =C2=B1  8%      +4.9%       158=
4 =C2=B1  5%  slabinfo.pool_workqueue.active_objs
     46.56 =C2=B1  8%      -3.7%      44.83 =C2=B1  8%      +5.5%      49.1=
1 =C2=B1  6%  slabinfo.pool_workqueue.active_slabs
      1509 =C2=B1  8%      -3.8%       1451 =C2=B1  8%      +5.1%       158=
7 =C2=B1  5%  slabinfo.pool_workqueue.num_objs
     46.56 =C2=B1  8%      -3.7%      44.83 =C2=B1  8%      +5.5%      49.1=
1 =C2=B1  6%  slabinfo.pool_workqueue.num_slabs
      2930            -1.5%       2887            -1.1%       2898 =C2=B1  =
2%  slabinfo.proc_dir_entry.active_objs
     69.78            -1.5%      68.75            -1.1%      69.00 =C2=B1  =
2%  slabinfo.proc_dir_entry.active_slabs
      2930            -1.5%       2887            -1.1%       2898 =C2=B1  =
2%  slabinfo.proc_dir_entry.num_objs
     69.78            -1.5%      68.75            -1.1%      69.00 =C2=B1  =
2%  slabinfo.proc_dir_entry.num_slabs
     14278            +1.0%      14427            +0.3%      14325        s=
labinfo.proc_inode_cache.active_objs
    290.89            +1.1%     294.17            +0.4%     292.00        s=
labinfo.proc_inode_cache.active_slabs
     14282            +1.0%      14431            +0.4%      14339        s=
labinfo.proc_inode_cache.num_objs
    290.89            +1.1%     294.17            +0.4%     292.00        s=
labinfo.proc_inode_cache.num_slabs
     27516            +0.2%      27564            -0.2%      27449        s=
labinfo.radix_tree_node.active_objs
    491.56            +0.0%     491.67            -0.4%     489.67        s=
labinfo.radix_tree_node.active_slabs
     27553            +0.0%      27564            -0.4%      27452        s=
labinfo.radix_tree_node.num_objs
    491.56            +0.0%     491.67            -0.4%     489.67        s=
labinfo.radix_tree_node.num_slabs
     78.33 =C2=B1 12%      +0.5%      78.75 =C2=B1  8%      -4.3%      75.0=
0        slabinfo.request_queue.active_objs
      5.22 =C2=B1 12%      +0.5%       5.25 =C2=B1  8%      -4.3%       5.0=
0        slabinfo.request_queue.active_slabs
     78.33 =C2=B1 12%      +0.5%      78.75 =C2=B1  8%      -4.3%      75.0=
0        slabinfo.request_queue.num_objs
      5.22 =C2=B1 12%      +0.5%       5.25 =C2=B1  8%      -4.3%       5.0=
0        slabinfo.request_queue.num_slabs
     51.00            +0.0%      51.00            +0.0%      51.00        s=
labinfo.rpc_inode_cache.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.rpc_inode_cache.active_slabs
     51.00            +0.0%      51.00            +0.0%      51.00        s=
labinfo.rpc_inode_cache.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.rpc_inode_cache.num_slabs
    924.44 =C2=B1  2%      +0.1%     925.33 =C2=B1  2%      -1.2%     913.7=
8        slabinfo.scsi_sense_cache.active_objs
     28.89 =C2=B1  2%      +0.1%      28.92 =C2=B1  2%      -1.2%      28.5=
6        slabinfo.scsi_sense_cache.active_slabs
    924.44 =C2=B1  2%      +0.1%     925.33 =C2=B1  2%      -1.2%     913.7=
8        slabinfo.scsi_sense_cache.num_objs
     28.89 =C2=B1  2%      +0.1%      28.92 =C2=B1  2%      -1.2%      28.5=
6        slabinfo.scsi_sense_cache.num_slabs
      3264            +0.0%       3264            +0.0%       3264        s=
labinfo.seq_file.active_objs
     96.00            +0.0%      96.00            +0.0%      96.00        s=
labinfo.seq_file.active_slabs
      3264            +0.0%       3264            +0.0%       3264        s=
labinfo.seq_file.num_objs
     96.00            +0.0%      96.00            +0.0%      96.00        s=
labinfo.seq_file.num_slabs
      4731 =C2=B1  6%      +3.3%       4887 =C2=B1  6%      +6.9%       505=
6 =C2=B1  7%  slabinfo.shmem_inode_cache.active_objs
    102.56 =C2=B1  7%      +3.0%     105.67 =C2=B1  6%      +6.7%     109.4=
4 =C2=B1  7%  slabinfo.shmem_inode_cache.active_slabs
      4731 =C2=B1  6%      +3.3%       4887 =C2=B1  6%      +6.9%       505=
6 =C2=B1  7%  slabinfo.shmem_inode_cache.num_objs
    102.56 =C2=B1  7%      +3.0%     105.67 =C2=B1  6%      +6.7%     109.4=
4 =C2=B1  7%  slabinfo.shmem_inode_cache.num_slabs
      2217 =C2=B1  4%      -2.7%       2156 =C2=B1  4%      -0.9%       219=
8 =C2=B1  4%  slabinfo.sighand_cache.active_objs
    148.11 =C2=B1  3%      -2.6%     144.25 =C2=B1  4%      -1.1%     146.5=
6 =C2=B1  4%  slabinfo.sighand_cache.active_slabs
      2232 =C2=B1  3%      -2.6%       2173 =C2=B1  4%      -1.1%       220=
8 =C2=B1  4%  slabinfo.sighand_cache.num_objs
    148.11 =C2=B1  3%      -2.6%     144.25 =C2=B1  4%      -1.1%     146.5=
6 =C2=B1  4%  slabinfo.sighand_cache.num_slabs
      4292 =C2=B1  4%      +1.2%       4344 =C2=B1  5%      +0.3%       430=
4 =C2=B1  4%  slabinfo.signal_cache.active_objs
    152.67 =C2=B1  4%      +1.8%     155.42 =C2=B1  5%      +0.3%     153.1=
1 =C2=B1  4%  slabinfo.signal_cache.active_slabs
      4292 =C2=B1  4%      +1.9%       4372 =C2=B1  5%      +0.3%       430=
4 =C2=B1  4%  slabinfo.signal_cache.num_objs
    152.67 =C2=B1  4%      +1.8%     155.42 =C2=B1  5%      +0.3%     153.1=
1 =C2=B1  4%  slabinfo.signal_cache.num_slabs
    313.00 =C2=B1 25%      -3.7%     301.33 =C2=B1 14%      +6.6%     333.6=
7 =C2=B1 14%  slabinfo.skbuff_fclone_cache.active_objs
      9.33 =C2=B1 23%      +0.9%       9.42 =C2=B1 14%     +10.7%      10.3=
3 =C2=B1 14%  slabinfo.skbuff_fclone_cache.active_slabs
    313.00 =C2=B1 25%      -3.7%     301.33 =C2=B1 14%      +6.6%     333.6=
7 =C2=B1 14%  slabinfo.skbuff_fclone_cache.num_objs
      9.33 =C2=B1 23%      +0.9%       9.42 =C2=B1 14%     +10.7%      10.3=
3 =C2=B1 14%  slabinfo.skbuff_fclone_cache.num_slabs
      4730 =C2=B1  7%      -4.1%       4535 =C2=B1  6%      -5.8%       445=
6 =C2=B1  4%  slabinfo.skbuff_head_cache.active_objs
    147.56 =C2=B1  7%      -4.1%     141.50 =C2=B1  6%      -5.7%     139.1=
1 =C2=B1  4%  slabinfo.skbuff_head_cache.active_slabs
      4730 =C2=B1  7%      -4.1%       4535 =C2=B1  6%      -5.8%       445=
6 =C2=B1  4%  slabinfo.skbuff_head_cache.num_objs
    147.56 =C2=B1  7%      -4.1%     141.50 =C2=B1  6%      -5.7%     139.1=
1 =C2=B1  4%  slabinfo.skbuff_head_cache.num_slabs
      3053 =C2=B1 14%      -0.2%       3048 =C2=B1 13%      +5.4%       321=
8 =C2=B1  9%  slabinfo.sock_inode_cache.active_objs
     78.00 =C2=B1 14%      +0.0%      78.00 =C2=B1 13%      +5.4%      82.2=
2 =C2=B1 10%  slabinfo.sock_inode_cache.active_slabs
      3053 =C2=B1 14%      -0.2%       3048 =C2=B1 13%      +5.4%       321=
8 =C2=B1  9%  slabinfo.sock_inode_cache.num_objs
     78.00 =C2=B1 14%      +0.0%      78.00 =C2=B1 13%      +5.4%      82.2=
2 =C2=B1 10%  slabinfo.sock_inode_cache.num_slabs
      1432 =C2=B1 14%      +3.3%       1479 =C2=B1  8%      +1.0%       144=
5 =C2=B1 12%  slabinfo.task_delay_info.active_objs
     27.89 =C2=B1 14%      +2.2%      28.50 =C2=B1  8%      +0.8%      28.1=
1 =C2=B1 12%  slabinfo.task_delay_info.active_slabs
      1432 =C2=B1 14%      +3.3%       1479 =C2=B1  8%      +1.0%       144=
5 =C2=B1 12%  slabinfo.task_delay_info.num_objs
     27.89 =C2=B1 14%      +2.2%      28.50 =C2=B1  8%      +0.8%      28.1=
1 =C2=B1 12%  slabinfo.task_delay_info.num_slabs
      1328 =C2=B1  7%      +2.9%       1366 =C2=B1 10%      +7.9%       143=
3 =C2=B1  4%  slabinfo.task_group.active_objs
     28.33 =C2=B1  7%      +3.2%      29.25 =C2=B1 10%      +7.8%      30.5=
6 =C2=B1  5%  slabinfo.task_group.active_slabs
      1328 =C2=B1  7%      +2.9%       1366 =C2=B1 10%      +7.9%       143=
3 =C2=B1  4%  slabinfo.task_group.num_objs
     28.33 =C2=B1  7%      +3.2%      29.25 =C2=B1 10%      +7.8%      30.5=
6 =C2=B1  5%  slabinfo.task_group.num_slabs
      1260            +0.5%       1265            +0.9%       1271        s=
labinfo.task_struct.active_objs
      1266            +0.5%       1272            +0.9%       1277        s=
labinfo.task_struct.active_slabs
      1266            +0.5%       1272            +0.9%       1277        s=
labinfo.task_struct.num_objs
      1266            +0.5%       1272            +0.9%       1277        s=
labinfo.task_struct.num_slabs
    294.33 =C2=B1 10%      -7.2%     273.00 =C2=B1  8%      -1.7%     289.3=
3 =C2=B1 12%  slabinfo.taskstats.active_objs
      6.33 =C2=B1 10%      -7.9%       5.83 =C2=B1  9%      -1.8%       6.2=
2 =C2=B1 12%  slabinfo.taskstats.active_slabs
    294.33 =C2=B1 10%      -7.2%     273.00 =C2=B1  8%      -1.7%     289.3=
3 =C2=B1 12%  slabinfo.taskstats.num_objs
      6.33 =C2=B1 10%      -7.9%       5.83 =C2=B1  9%      -1.8%       6.2=
2 =C2=B1 12%  slabinfo.taskstats.num_slabs
      3069 =C2=B1  5%      -1.7%       3017 =C2=B1  3%      -1.5%       302=
2 =C2=B1  3%  slabinfo.trace_event_file.active_objs
     66.22 =C2=B1  5%      -1.5%      65.25 =C2=B1  2%      -1.2%      65.4=
4 =C2=B1  3%  slabinfo.trace_event_file.active_slabs
      3069 =C2=B1  5%      -1.7%       3017 =C2=B1  3%      -1.5%       302=
2 =C2=B1  3%  slabinfo.trace_event_file.num_objs
     66.22 =C2=B1  5%      -1.5%      65.25 =C2=B1  2%      -1.2%      65.4=
4 =C2=B1  3%  slabinfo.trace_event_file.num_slabs
     33.00            +0.0%      33.00            +0.0%      33.00        s=
labinfo.tw_sock_TCP.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.tw_sock_TCP.active_slabs
     33.00            +0.0%      33.00            +0.0%      33.00        s=
labinfo.tw_sock_TCP.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.tw_sock_TCP.num_slabs
     54128 =C2=B1  7%      -3.8%      52087 =C2=B1  6%      +1.9%      5514=
4 =C2=B1  5%  slabinfo.vm_area_struct.active_objs
      1355 =C2=B1  7%      -3.7%       1304 =C2=B1  6%      +2.0%       138=
2 =C2=B1  5%  slabinfo.vm_area_struct.active_slabs
     54236 =C2=B1  7%      -3.7%      52216 =C2=B1  6%      +2.0%      5530=
0 =C2=B1  5%  slabinfo.vm_area_struct.num_objs
      1355 =C2=B1  7%      -3.7%       1304 =C2=B1  6%      +2.0%       138=
2 =C2=B1  5%  slabinfo.vm_area_struct.num_slabs
     21955            +0.4%      22037            -0.1%      21932 =C2=B1  =
2%  slabinfo.vmap_area.active_objs
    343.00            +0.4%     344.50            -0.0%     342.89 =C2=B1  =
2%  slabinfo.vmap_area.active_slabs
     21992            +0.4%      22071            -0.1%      21972 =C2=B1  =
2%  slabinfo.vmap_area.num_objs
    343.00            +0.4%     344.50            -0.0%     342.89 =C2=B1  =
2%  slabinfo.vmap_area.num_slabs
     42.00            +0.0%      42.00            +0.0%      42.00        s=
labinfo.xfrm_state.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.xfrm_state.active_slabs
     42.00            +0.0%      42.00            +0.0%      42.00        s=
labinfo.xfrm_state.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.xfrm_state.num_slabs
     66.46 =C2=B1  8%      -1.7       64.80 =C2=B1  9%      -6.3       60.1=
2 =C2=B1  5%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.st=
art_secondary.secondary_startup_64_no_verify
     66.50 =C2=B1  8%      -1.6       64.85 =C2=B1  9%      -6.3       60.1=
5 =C2=B1  5%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_seco=
ndary.secondary_startup_64_no_verify
     66.50 =C2=B1  8%      -1.6       64.85 =C2=B1  9%      -6.3       60.1=
5 =C2=B1  5%  perf-profile.calltrace.cycles-pp.start_secondary.secondary_st=
artup_64_no_verify
     17.94 =C2=B1  8%      -1.0       16.93 =C2=B1  6%      -0.3       17.6=
4 =C2=B1  8%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interr=
upt.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry
     60.15 =C2=B1  9%      -1.0       59.19 =C2=B1 10%      -6.6       53.5=
9 =C2=B1  5%  perf-profile.calltrace.cycles-pp.cpuidle_enter.do_idle.cpu_st=
artup_entry.start_secondary.secondary_startup_64_no_verify
     59.34 =C2=B1  9%      -1.0       58.37 =C2=B1 10%      -6.5       52.8=
2 =C2=B1  6%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_=
enter.do_idle.cpu_startup_entry.start_secondary
     14.53 =C2=B1  9%      -0.8       13.73 =C2=B1  5%      -0.6       13.9=
7 =C2=B1 10%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.=
asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.do_idle
     67.00 =C2=B1  8%      -0.7       66.27 =C2=B1  6%      -6.3       60.6=
9 =C2=B1  5%  perf-profile.calltrace.cycles-pp.secondary_startup_64_no_veri=
fy
      4.98 =C2=B1 15%      -0.7        4.30 =C2=B1 14%      +0.4        5.3=
7 =C2=B1  7%  perf-profile.calltrace.cycles-pp.menu_select.do_idle.cpu_star=
tup_entry.start_secondary.secondary_startup_64_no_verify
      9.81 =C2=B1  8%      -0.5        9.31 =C2=B1  5%      -0.4        9.4=
1 =C2=B1 10%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrup=
t.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter=
_state.cpuidle_enter
      2.54 =C2=B1 27%      -0.5        2.05 =C2=B1 33%      +0.5        2.9=
9 =C2=B1 12%  perf-profile.calltrace.cycles-pp.tick_nohz_get_sleep_length.m=
enu_select.do_idle.cpu_startup_entry.start_secondary
      9.50 =C2=B1  8%      -0.5        9.02 =C2=B1  5%      -0.3        9.2=
4 =C2=B1 10%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_a=
pic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_inter=
rupt.cpuidle_enter_state
      1.98 =C2=B1 36%      -0.5        1.52 =C2=B1 44%      +0.5        2.5=
2 =C2=B1 13%  perf-profile.calltrace.cycles-pp.tick_nohz_next_event.tick_no=
hz_get_sleep_length.menu_select.do_idle.cpu_startup_entry
      0.90 =C2=B1 70%      -0.4        0.53 =C2=B1127%      +0.6        1.4=
6 =C2=B1 22%  perf-profile.calltrace.cycles-pp.timekeeping_max_deferment.ti=
ck_nohz_next_event.tick_nohz_get_sleep_length.menu_select.do_idle
      8.52 =C2=B1 23%      -0.3        8.18 =C2=B1 13%      +1.1        9.6=
6 =C2=B1 13%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscal=
l_64.entry_SYSCALL_64_after_hwframe
      0.86 =C2=B1 58%      -0.3        0.57 =C2=B1 98%      +0.4        1.2=
4 =C2=B1 23%  perf-profile.calltrace.cycles-pp.tick_nohz_irq_exit.sysvec_ap=
ic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpui=
dle_enter
      2.65 =C2=B1 14%      -0.3        2.36 =C2=B1 12%      +0.2        2.8=
0 =C2=B1 14%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscal=
l_64.entry_SYSCALL_64_after_hwframe.read
      3.25 =C2=B1 15%      -0.3        2.97 =C2=B1 13%      +0.3        3.5=
3 =C2=B1 15%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwfra=
me.read
      3.14 =C2=B1 15%      -0.3        2.86 =C2=B1 13%      +0.3        3.4=
2 =C2=B1 15%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_=
64_after_hwframe.read
      2.94 =C2=B1 15%      -0.3        2.66 =C2=B1 13%      +0.2        3.1=
7 =C2=B1 14%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe.read
      4.00 =C2=B1 15%      -0.3        3.74 =C2=B1 13%      +0.4        4.4=
3 =C2=B1 14%  perf-profile.calltrace.cycles-pp.read
      2.35 =C2=B1 34%      -0.3        2.10 =C2=B1 44%      +0.6        2.9=
8 =C2=B1 15%  perf-profile.calltrace.cycles-pp.clockevents_program_event.hr=
timer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.a=
sm_sysvec_apic_timer_interrupt
      0.24 =C2=B1112%      -0.2        0.00            +0.2        0.42 =C2=
=B1 72%  perf-profile.calltrace.cycles-pp.anon_pipe_buf_release.pipe_read.n=
ew_sync_read.vfs_read.ksys_read
      0.78 =C2=B1 71%      -0.2        0.55 =C2=B1101%      +0.4        1.2=
1 =C2=B1 24%  perf-profile.calltrace.cycles-pp.ktime_get.tick_nohz_irq_exit=
.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_=
state
      3.00 =C2=B1 12%      -0.2        2.78 =C2=B1  9%      -0.3        2.6=
7 =C2=B1  8%  perf-profile.calltrace.cycles-pp.update_process_times.tick_sc=
hed_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt
      9.50 =C2=B1 23%      -0.2        9.29 =C2=B1 13%      +1.4       10.9=
1 =C2=B1 12%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
      3.61 =C2=B1 12%      -0.2        3.41 =C2=B1  9%      -0.4        3.2=
1 =C2=B1  8%  perf-profile.calltrace.cycles-pp.tick_sched_timer.__hrtimer_r=
un_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer=
_interrupt
      0.19 =C2=B1141%      -0.2        0.00            -0.2        0.00    =
    perf-profile.calltrace.cycles-pp.fsnotify.vfs_read.ksys_read.do_syscall=
_64.entry_SYSCALL_64_after_hwframe
      1.26 =C2=B1 54%      -0.2        1.08 =C2=B1 83%      +0.5        1.7=
9 =C2=B1 26%  perf-profile.calltrace.cycles-pp.ktime_get.clockevents_progra=
m_event.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_i=
nterrupt
      5.66 =C2=B1 13%      -0.2        5.49 =C2=B1 12%      -0.9        4.7=
6 =C2=B1  7%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer=
_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sy=
svec_apic_timer_interrupt
      3.10 =C2=B1 12%      -0.2        2.94 =C2=B1 13%      +0.6        3.6=
5 =C2=B1 13%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_=
64_after_hwframe.write
      2.55 =C2=B1 13%      -0.2        2.39 =C2=B1 14%      +0.5        3.0=
3 =C2=B1 12%  perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_sysc=
all_64.entry_SYSCALL_64_after_hwframe.write
      0.82 =C2=B1 40%      -0.2        0.66 =C2=B1 14%      +0.1        0.9=
0 =C2=B1 15%  perf-profile.calltrace.cycles-pp.security_file_permission.vfs=
_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.19 =C2=B1 13%      -0.2        3.04 =C2=B1 13%      +0.6        3.7=
7 =C2=B1 13%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwfra=
me.write
      2.23 =C2=B1 12%      -0.2        2.08 =C2=B1  8%      -0.2        2.0=
8 =C2=B1  7%  perf-profile.calltrace.cycles-pp.irq_exit_rcu.sysvec_apic_tim=
er_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_en=
ter
      3.24 =C2=B1 13%      -0.1        3.09 =C2=B1 11%      -0.5        2.7=
7 =C2=B1  8%  perf-profile.calltrace.cycles-pp.tick_sched_handle.tick_sched=
_timer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      2.86 =C2=B1 13%      -0.1        2.72 =C2=B1 13%      +0.5        3.3=
7 =C2=B1 12%  perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe.write
      3.93 =C2=B1 14%      -0.1        3.80 =C2=B1 13%      +0.7        4.6=
7 =C2=B1 11%  perf-profile.calltrace.cycles-pp.write
      0.28 =C2=B1114%      -0.1        0.16 =C2=B1173%      +0.2        0.4=
5 =C2=B1 74%  perf-profile.calltrace.cycles-pp.calc_global_load_tick.schedu=
ler_tick.update_process_times.tick_sched_handle.tick_sched_timer
      1.78 =C2=B1 12%      -0.1        1.66 =C2=B1  7%      -0.1        1.6=
8 =C2=B1  8%  perf-profile.calltrace.cycles-pp.__softirqentry_text_start.ir=
q_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpui=
dle_enter_state
      0.62 =C2=B1  7%      -0.1        0.51 =C2=B1 46%      -0.1        0.5=
3 =C2=B1 36%  perf-profile.calltrace.cycles-pp.load_balance.rebalance_domai=
ns.__softirqentry_text_start.irq_exit_rcu.sysvec_apic_timer_interrupt
      0.94 =C2=B1 22%      -0.1        0.83 =C2=B1 19%      +0.1        1.0=
7 =C2=B1  7%  perf-profile.calltrace.cycles-pp.lapic_next_deadline.clockeve=
nts_program_event.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_ap=
ic_timer_interrupt
      1.59 =C2=B1 10%      -0.1        1.51 =C2=B1  9%      -0.1        1.5=
1 =C2=B1 10%  perf-profile.calltrace.cycles-pp.scheduler_tick.update_proces=
s_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues
      0.12 =C2=B1187%      -0.1        0.04 =C2=B1331%      -0.1        0.0=
0        perf-profile.calltrace.cycles-pp.rcu_idle_exit.cpuidle_enter_state=
.cpuidle_enter.do_idle.cpu_startup_entry
      1.01 =C2=B1 11%      -0.1        0.94 =C2=B1  9%      -0.0        0.9=
8 =C2=B1  8%  perf-profile.calltrace.cycles-pp.rebalance_domains.__softirqe=
ntry_text_start.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_ti=
mer_interrupt
      0.06 =C2=B1282%      -0.1        0.00            -0.1        0.00    =
    perf-profile.calltrace.cycles-pp.fsnotify.vfs_write.ksys_write.do_sysca=
ll_64.entry_SYSCALL_64_after_hwframe
      0.06 =C2=B1282%      -0.1        0.00            -0.1        0.00    =
    perf-profile.calltrace.cycles-pp._raw_spin_trylock.rebalance_domains.__=
softirqentry_text_start.irq_exit_rcu.sysvec_apic_timer_interrupt
      0.06 =C2=B1282%      -0.1        0.00            -0.1        0.00    =
    perf-profile.calltrace.cycles-pp.update_rq_clock.scheduler_tick.update_=
process_times.tick_sched_handle.tick_sched_timer
      0.18 =C2=B1142%      -0.0        0.14 =C2=B1173%      -0.2        0.0=
0        perf-profile.calltrace.cycles-pp.hrtimer_update_next_event.hrtimer=
_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sy=
svec_apic_timer_interrupt
      0.12 =C2=B1187%      -0.0        0.09 =C2=B1223%      -0.1        0.0=
6 =C2=B1282%  perf-profile.calltrace.cycles-pp.mutex_unlock.pipe_read.new_s=
ync_read.vfs_read.ksys_read
      0.41 =C2=B1 99%      -0.0        0.39 =C2=B1 92%      +0.2        0.5=
9 =C2=B1 62%  perf-profile.calltrace.cycles-pp.ktime_get_update_offsets_now=
.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrup=
t.asm_sysvec_apic_timer_interrupt
      0.92 =C2=B1 13%      -0.0        0.90 =C2=B1 17%      -0.1        0.8=
4 =C2=B1 13%  perf-profile.calltrace.cycles-pp.perf_mux_hrtimer_handler.__h=
rtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_ap=
ic_timer_interrupt
      0.26 =C2=B1112%      +0.0        0.26 =C2=B1120%      -0.3        0.0=
0        perf-profile.calltrace.cycles-pp.rcu_sched_clock_irq.update_proces=
s_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues
      0.18 =C2=B1142%      +0.0        0.19 =C2=B1142%      +0.1        0.3=
1 =C2=B1 90%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.pipe_read=
.new_sync_read.vfs_read.ksys_read
      0.00            +0.0        0.04 =C2=B1331%      +0.2        0.18 =C2=
=B1142%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack
      0.56 =C2=B1 38%      +0.0        0.60 =C2=B1 33%      +0.2        0.7=
7 =C2=B1 37%  perf-profile.calltrace.cycles-pp.security_file_permission.vfs=
_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.12 =C2=B1282%      +0.0        0.16 =C2=B1223%      +0.2        0.2=
8 =C2=B1144%  perf-profile.calltrace.cycles-pp.ktime_get.tick_irq_enter.irq=
_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.00            +0.0        0.04 =C2=B1331%      +0.0        0.00    =
    perf-profile.calltrace.cycles-pp.ktime_get.perf_mux_hrtimer_handler.__h=
rtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.00            +0.0        0.05 =C2=B1331%      +0.2        0.17 =C2=
=B1141%  perf-profile.calltrace.cycles-pp.mutex_unlock.pipe_write.new_sync_=
write.vfs_write.ksys_write
      0.00            +0.0        0.05 =C2=B1331%      +0.2        0.24 =C2=
=B1112%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.pipe_write.new=
_sync_write.vfs_write.ksys_write
      0.90 =C2=B1 26%      +0.1        0.95 =C2=B1 17%      -0.4        0.5=
2 =C2=B1 82%  perf-profile.calltrace.cycles-pp.tick_irq_enter.irq_enter_rcu=
.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_=
state
      0.96 =C2=B1 25%      +0.1        1.01 =C2=B1 15%      -0.2        0.7=
3 =C2=B1 36%  perf-profile.calltrace.cycles-pp.irq_enter_rcu.sysvec_apic_ti=
mer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_e=
nter
      0.40 =C2=B1 72%      +0.1        0.46 =C2=B1 61%      +0.2        0.6=
5 =C2=B1 38%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.sy=
scall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.12 =C2=B1187%      +0.1        0.18 =C2=B1141%      +0.4        0.5=
0 =C2=B1 55%  perf-profile.calltrace.cycles-pp.common_file_perm.security_fi=
le_permission.vfs_read.ksys_read.do_syscall_64
      0.78 =C2=B1 39%      +0.1        0.86 =C2=B1 17%      +0.2        0.9=
9 =C2=B1 15%  perf-profile.calltrace.cycles-pp.atime_needs_update.touch_ati=
me.pipe_read.new_sync_read.vfs_read
      0.00            +0.1        0.09 =C2=B1223%      +0.1        0.12 =C2=
=B1187%  perf-profile.calltrace.cycles-pp.find_busiest_group.load_balance.r=
ebalance_domains.__softirqentry_text_start.irq_exit_rcu
      0.19 =C2=B1142%      +0.1        0.28 =C2=B1100%      +0.3        0.5=
1 =C2=B1 55%  perf-profile.calltrace.cycles-pp.common_file_perm.security_fi=
le_permission.vfs_write.ksys_write.do_syscall_64
      0.76 =C2=B1 39%      +0.1        0.85 =C2=B1 18%      +0.2        0.9=
6 =C2=B1 14%  perf-profile.calltrace.cycles-pp.mutex_lock.pipe_read.new_syn=
c_read.vfs_read.ksys_read
      0.59 =C2=B1 36%      +0.1        0.69 =C2=B1 16%      +0.1        0.7=
1 =C2=B1 38%  perf-profile.calltrace.cycles-pp.__fget_light.__fdget_pos.ksy=
s_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.12 =C2=B1187%      +0.1        0.23 =C2=B1118%      -0.1        0.0=
0        perf-profile.calltrace.cycles-pp.__remove_hrtimer.__hrtimer_run_qu=
eues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_inte=
rrupt
      0.72 =C2=B1 40%      +0.1        0.83 =C2=B1 20%      +0.3        1.0=
3 =C2=B1 18%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do=
_syscall_64.entry_SYSCALL_64_after_hwframe
      0.33 =C2=B1 91%      +0.1        0.46 =C2=B1 59%      +0.4        0.6=
8 =C2=B1 10%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__wak=
e_up_common_lock.pipe_write.new_sync_write.vfs_write
      0.66 =C2=B1 37%      +0.1        0.79 =C2=B1 17%      +0.2        0.8=
4 =C2=B1 17%  perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_write.do_sy=
scall_64.entry_SYSCALL_64_after_hwframe
      1.43 =C2=B1 32%      +0.1        1.56 =C2=B1 24%      +0.4        1.8=
6 =C2=B1 21%  perf-profile.calltrace.cycles-pp.copy_user_enhanced_fast_stri=
ng.copyin.copy_page_from_iter.pipe_write.new_sync_write
      0.60 =C2=B1 39%      +0.1        0.74 =C2=B1 13%      +0.2        0.8=
3 =C2=B1 11%  perf-profile.calltrace.cycles-pp.__fget_light.__fdget_pos.ksy=
s_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.68 =C2=B1 31%      +0.1        1.82 =C2=B1 25%      +0.7        2.3=
8 =C2=B1 16%  perf-profile.calltrace.cycles-pp.copyin.copy_page_from_iter.p=
ipe_write.new_sync_write.vfs_write
      0.67 =C2=B1 39%      +0.1        0.82 =C2=B1 13%      +0.3        0.9=
3 =C2=B1 12%  perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_read.do_sys=
call_64.entry_SYSCALL_64_after_hwframe
      0.89 =C2=B1 39%      +0.1        1.04 =C2=B1 16%      +0.3        1.1=
8 =C2=B1 15%  perf-profile.calltrace.cycles-pp.touch_atime.pipe_read.new_sy=
nc_read.vfs_read.ksys_read
      0.67 =C2=B1 38%      +0.2        0.82 =C2=B1 16%      +0.3        0.9=
9 =C2=B1 16%  perf-profile.calltrace.cycles-pp.mutex_lock.pipe_write.new_sy=
nc_write.vfs_write.ksys_write
      1.06 =C2=B1 25%      +0.2        1.21 =C2=B1 15%      +0.3        1.3=
5 =C2=B1 15%  perf-profile.calltrace.cycles-pp.__entry_text_start
      0.21 =C2=B1143%      +0.2        0.37 =C2=B1 85%      -0.2        0.0=
0        perf-profile.calltrace.cycles-pp.io_serial_in.wait_for_xmitr.seria=
l8250_console_putchar.uart_console_write.serial8250_console_write
      0.92 =C2=B1 21%      +0.2        1.08 =C2=B1 14%      +0.3        1.2=
3 =C2=B1  7%  perf-profile.calltrace.cycles-pp.__wake_up_common_lock.pipe_w=
rite.new_sync_write.vfs_write.ksys_write
      0.35 =C2=B1114%      +0.2        0.52 =C2=B1 73%      -0.3        0.0=
0        perf-profile.calltrace.cycles-pp.wait_for_xmitr.serial8250_console=
_putchar.uart_console_write.serial8250_console_write.console_unlock
      0.35 =C2=B1114%      +0.2        0.52 =C2=B1 73%      -0.3        0.0=
0        perf-profile.calltrace.cycles-pp.serial8250_console_putchar.uart_c=
onsole_write.serial8250_console_write.console_unlock.vprintk_emit
      0.36 =C2=B1114%      +0.2        0.54 =C2=B1 73%      -0.4        0.0=
0        perf-profile.calltrace.cycles-pp.uart_console_write.serial8250_con=
sole_write.console_unlock.vprintk_emit.printk
      0.37 =C2=B1114%      +0.2        0.55 =C2=B1 73%      -0.4        0.0=
0        perf-profile.calltrace.cycles-pp.serial8250_console_write.console_=
unlock.vprintk_emit.printk.irq_work_single
      0.38 =C2=B1114%      +0.2        0.57 =C2=B1 73%      -0.4        0.0=
0        perf-profile.calltrace.cycles-pp.irq_work_run_list.irq_work_run.__=
sysvec_irq_work.sysvec_irq_work.asm_sysvec_irq_work
      0.38 =C2=B1114%      +0.2        0.57 =C2=B1 73%      -0.4        0.0=
0        perf-profile.calltrace.cycles-pp.irq_work_run.__sysvec_irq_work.sy=
svec_irq_work.asm_sysvec_irq_work.cpuidle_enter_state
      0.38 =C2=B1114%      +0.2        0.57 =C2=B1 73%      -0.4        0.0=
0        perf-profile.calltrace.cycles-pp.irq_work_single.irq_work_run_list=
.irq_work_run.__sysvec_irq_work.sysvec_irq_work
      0.38 =C2=B1114%      +0.2        0.57 =C2=B1 73%      -0.4        0.0=
0        perf-profile.calltrace.cycles-pp.printk.irq_work_single.irq_work_r=
un_list.irq_work_run.__sysvec_irq_work
      0.38 =C2=B1114%      +0.2        0.57 =C2=B1 73%      -0.4        0.0=
0        perf-profile.calltrace.cycles-pp.vprintk_emit.printk.irq_work_sing=
le.irq_work_run_list.irq_work_run
      0.38 =C2=B1114%      +0.2        0.57 =C2=B1 73%      -0.4        0.0=
0        perf-profile.calltrace.cycles-pp.console_unlock.vprintk_emit.print=
k.irq_work_single.irq_work_run_list
      1.82 =C2=B1 31%      +0.2        2.01 =C2=B1 24%      +0.5        2.2=
7 =C2=B1 13%  perf-profile.calltrace.cycles-pp.copyout.copy_page_to_iter.pi=
pe_read.new_sync_read.vfs_read
      0.38 =C2=B1114%      +0.2        0.57 =C2=B1 73%      -0.4        0.0=
0        perf-profile.calltrace.cycles-pp.asm_sysvec_irq_work.cpuidle_enter=
_state.cpuidle_enter.do_idle.cpu_startup_entry
      0.38 =C2=B1114%      +0.2        0.57 =C2=B1 73%      -0.4        0.0=
0        perf-profile.calltrace.cycles-pp.sysvec_irq_work.asm_sysvec_irq_wo=
rk.cpuidle_enter_state.cpuidle_enter.do_idle
      0.38 =C2=B1114%      +0.2        0.57 =C2=B1 73%      -0.4        0.0=
0        perf-profile.calltrace.cycles-pp.__sysvec_irq_work.sysvec_irq_work=
.asm_sysvec_irq_work.cpuidle_enter_state.cpuidle_enter
      0.20 =C2=B1141%      +0.2        0.41 =C2=B1 72%      +0.4        0.5=
8 =C2=B1 37%  perf-profile.calltrace.cycles-pp.file_update_time.pipe_write.=
new_sync_write.vfs_write.ksys_write
      0.29 =C2=B1113%      +0.2        0.53 =C2=B1 50%      +0.3        0.6=
1 =C2=B1 36%  perf-profile.calltrace.cycles-pp.syscall_return_via_sysret
      3.16 =C2=B1 20%      +0.3        3.41 =C2=B1 13%      +0.8        3.9=
4 =C2=B1 11%  perf-profile.calltrace.cycles-pp.copy_page_from_iter.pipe_wri=
te.new_sync_write.vfs_write.ksys_write
      8.16 =C2=B1 19%      +0.3        8.42 =C2=B1 14%      +1.6        9.8=
0 =C2=B1  8%  perf-profile.calltrace.cycles-pp.pipe_read.new_sync_read.vfs_=
read.ksys_read.do_syscall_64
      1.43 =C2=B1 27%      +0.3        1.70 =C2=B1 23%      +0.4        1.8=
3 =C2=B1 17%  perf-profile.calltrace.cycles-pp.copy_user_enhanced_fast_stri=
ng.copyout.copy_page_to_iter.pipe_read.new_sync_read
      3.19 =C2=B1 19%      +0.3        3.48 =C2=B1 12%      +0.5        3.7=
4 =C2=B1 10%  perf-profile.calltrace.cycles-pp.copy_page_to_iter.pipe_read.=
new_sync_read.vfs_read.ksys_read
      8.69 =C2=B1 19%      +0.4        9.06 =C2=B1 14%      +1.7       10.4=
4 =C2=B1  8%  perf-profile.calltrace.cycles-pp.new_sync_read.vfs_read.ksys_=
read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.23 =C2=B1 21%      +0.5        8.72 =C2=B1 12%      +2.0       10.2=
3 =C2=B1 13%  perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_sysc=
all_64.entry_SYSCALL_64_after_hwframe
     20.32 =C2=B1 22%      +0.5       20.83 =C2=B1 13%      +4.0       24.3=
2 =C2=B1 13%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_=
64_after_hwframe
      9.23 =C2=B1 21%      +0.6        9.85 =C2=B1 13%      +2.2       11.4=
3 =C2=B1 13%  perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe
     20.93 =C2=B1 22%      +0.7       21.59 =C2=B1 13%      +4.2       25.1=
4 =C2=B1 13%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwfra=
me
     40.56 =C2=B1 12%      +0.7       41.30 =C2=B1  9%      -5.7       34.8=
3 =C2=B1 10%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_sta=
te.cpuidle_enter.do_idle.cpu_startup_entry
      8.34 =C2=B1 19%      +0.8        9.10 =C2=B1 13%      +2.3       10.6=
7 =C2=B1  8%  perf-profile.calltrace.cycles-pp.pipe_write.new_sync_write.vf=
s_write.ksys_write.do_syscall_64
      8.94 =C2=B1 18%      +0.8        9.74 =C2=B1 13%      +2.5       11.4=
1 =C2=B1  8%  perf-profile.calltrace.cycles-pp.new_sync_write.vfs_write.ksy=
s_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.30 =C2=B1 90%      +0.8        1.15 =C2=B1260%      -0.2        0.0=
6 =C2=B1282%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_=
enter.do_idle.cpu_startup_entry.start_kernel
      0.31 =C2=B1 90%      +0.9        1.20 =C2=B1248%      -0.1        0.1=
7 =C2=B1141%  perf-profile.calltrace.cycles-pp.cpuidle_enter.do_idle.cpu_st=
artup_entry.start_kernel.secondary_startup_64_no_verify
      0.41 =C2=B1 71%      +0.9        1.32 =C2=B1222%      -0.0        0.3=
9 =C2=B1 71%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.st=
art_kernel.secondary_startup_64_no_verify
      0.41 =C2=B1 71%      +0.9        1.32 =C2=B1222%      -0.0        0.3=
9 =C2=B1 71%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_kern=
el.secondary_startup_64_no_verify
      0.41 =C2=B1 71%      +0.9        1.32 =C2=B1222%      -0.0        0.3=
9 =C2=B1 71%  perf-profile.calltrace.cycles-pp.start_kernel.secondary_start=
up_64_no_verify
     66.50 =C2=B1  8%      -1.6       64.85 =C2=B1  9%      -6.3       60.1=
5 =C2=B1  5%  perf-profile.children.cycles-pp.start_secondary
      1.46 =C2=B1 22%      -1.5        0.00            -1.5        0.00    =
    perf-profile.children.cycles-pp.fsnotify
     16.66 =C2=B1  8%      -0.9       15.76 =C2=B1  5%      -0.4       16.2=
9 =C2=B1  9%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interru=
pt
     14.78 =C2=B1  9%      -0.8       13.97 =C2=B1  5%      -0.5       14.2=
5 =C2=B1 10%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
     67.00 =C2=B1  8%      -0.7       66.27 =C2=B1  6%      -6.3       60.6=
9 =C2=B1  5%  perf-profile.children.cycles-pp.do_idle
     67.00 =C2=B1  8%      -0.7       66.27 =C2=B1  6%      -6.3       60.6=
9 =C2=B1  5%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
     67.00 =C2=B1  8%      -0.7       66.27 =C2=B1  6%      -6.3       60.6=
9 =C2=B1  5%  perf-profile.children.cycles-pp.cpu_startup_entry
      5.07 =C2=B1 15%      -0.7        4.38 =C2=B1 14%      +0.4        5.4=
5 =C2=B1  7%  perf-profile.children.cycles-pp.menu_select
     11.22 =C2=B1 19%      -0.6       10.58 =C2=B1 13%      +1.3       12.4=
9 =C2=B1  8%  perf-profile.children.cycles-pp.vfs_read
      9.98 =C2=B1  8%      -0.5        9.48 =C2=B1  5%      -0.4        9.6=
2 =C2=B1 10%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      2.58 =C2=B1 27%      -0.5        2.09 =C2=B1 33%      +0.5        3.0=
4 =C2=B1 12%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      9.68 =C2=B1  8%      -0.5        9.20 =C2=B1  5%      -0.2        9.4=
6 =C2=B1 10%  perf-profile.children.cycles-pp.hrtimer_interrupt
     12.49 =C2=B1 19%      -0.5       12.02 =C2=B1 13%      +1.6       14.1=
1 =C2=B1  8%  perf-profile.children.cycles-pp.ksys_read
      2.04 =C2=B1 35%      -0.5        1.57 =C2=B1 43%      +0.5        2.5=
6 =C2=B1 14%  perf-profile.children.cycles-pp.tick_nohz_next_event
      2.99 =C2=B1 42%      -0.4        2.59 =C2=B1 57%      +0.9        3.9=
1 =C2=B1 29%  perf-profile.children.cycles-pp.ktime_get
      0.97 =C2=B1 59%      -0.3        0.67 =C2=B1 86%      +0.5        1.4=
7 =C2=B1 22%  perf-profile.children.cycles-pp.timekeeping_max_deferment
      0.57 =C2=B1 23%      -0.3        0.30 =C2=B1 23%      +0.2        0.7=
4 =C2=B1 17%  perf-profile.children.cycles-pp.anon_pipe_buf_release
      4.20 =C2=B1 15%      -0.2        3.95 =C2=B1 13%      +0.5        4.6=
8 =C2=B1 13%  perf-profile.children.cycles-pp.read
      2.40 =C2=B1 33%      -0.2        2.16 =C2=B1 43%      +0.6        3.0=
4 =C2=B1 15%  perf-profile.children.cycles-pp.clockevents_program_event
      1.92 =C2=B1 21%      -0.2        1.69 =C2=B1 13%      +0.3        2.2=
3 =C2=B1 12%  perf-profile.children.cycles-pp.security_file_permission
      0.90 =C2=B1 52%      -0.2        0.67 =C2=B1 70%      +0.3        1.2=
5 =C2=B1 23%  perf-profile.children.cycles-pp.tick_nohz_irq_exit
      3.08 =C2=B1 12%      -0.2        2.86 =C2=B1  9%      -0.3        2.7=
6 =C2=B1  8%  perf-profile.children.cycles-pp.update_process_times
      3.69 =C2=B1 12%      -0.2        3.48 =C2=B1  9%      -0.4        3.3=
1 =C2=B1  7%  perf-profile.children.cycles-pp.tick_sched_timer
      5.80 =C2=B1 13%      -0.2        5.61 =C2=B1 12%      -0.9        4.9=
1 =C2=B1  7%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      2.29 =C2=B1 12%      -0.2        2.12 =C2=B1  8%      -0.2        2.1=
3 =C2=B1  7%  perf-profile.children.cycles-pp.irq_exit_rcu
      3.30 =C2=B1 14%      -0.1        3.15 =C2=B1 11%      -0.5        2.8=
5 =C2=B1  7%  perf-profile.children.cycles-pp.tick_sched_handle
      4.14 =C2=B1 15%      -0.1        3.99 =C2=B1 13%      +0.8        4.9=
2 =C2=B1 11%  perf-profile.children.cycles-pp.write
      0.49 =C2=B1 34%      -0.1        0.35 =C2=B1 55%      +0.1        0.6=
1 =C2=B1 23%  perf-profile.children.cycles-pp.calc_global_load_tick
      1.82 =C2=B1 12%      -0.1        1.69 =C2=B1  8%      -0.1        1.7=
2 =C2=B1  7%  perf-profile.children.cycles-pp.__softirqentry_text_start
      0.73 =C2=B1 13%      -0.1        0.62 =C2=B1 19%      +0.1        0.7=
9 =C2=B1 15%  perf-profile.children.cycles-pp.read_tsc
      0.98 =C2=B1 22%      -0.1        0.88 =C2=B1 20%      +0.2        1.1=
3 =C2=B1  6%  perf-profile.children.cycles-pp.lapic_next_deadline
      1.65 =C2=B1 10%      -0.1        1.56 =C2=B1  9%      -0.1        1.5=
6 =C2=B1 10%  perf-profile.children.cycles-pp.scheduler_tick
      0.90 =C2=B1 28%      -0.1        0.82 =C2=B1 30%      +0.2        1.0=
5 =C2=B1 11%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.62 =C2=B1 38%      -0.1        0.55 =C2=B1 41%      +0.1        0.7=
1 =C2=B1 32%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      1.02 =C2=B1 12%      -0.1        0.95 =C2=B1  9%      -0.0        1.0=
1 =C2=B1  8%  perf-profile.children.cycles-pp.rebalance_domains
     60.60 =C2=B1  9%      -0.0       60.55 =C2=B1  7%      -6.5       54.0=
6 =C2=B1  5%  perf-profile.children.cycles-pp.cpuidle_enter
      0.30 =C2=B1 29%      -0.0        0.25 =C2=B1 20%      +0.0        0.3=
1 =C2=B1 24%  perf-profile.children.cycles-pp.tsc_verify_tsc_adjust
     60.57 =C2=B1  9%      -0.0       60.53 =C2=B1  7%      -6.6       54.0=
2 =C2=B1  5%  perf-profile.children.cycles-pp.cpuidle_enter_state
      0.60 =C2=B1  8%      -0.0        0.56 =C2=B1 13%      -0.0        0.5=
7 =C2=B1  8%  perf-profile.children.cycles-pp.irqtime_account_irq
      0.30 =C2=B1 28%      -0.0        0.26 =C2=B1 19%      +0.0        0.3=
2 =C2=B1 23%  perf-profile.children.cycles-pp.arch_cpu_idle_enter
      0.29 =C2=B1 45%      -0.0        0.25 =C2=B1 18%      +0.0        0.3=
4 =C2=B1 19%  perf-profile.children.cycles-pp._raw_spin_trylock
      0.03 =C2=B1282%      -0.0        0.00            -0.0        0.00    =
    perf-profile.children.cycles-pp.__mod_lruvec_page_state
      0.66 =C2=B1  7%      -0.0        0.63 =C2=B1 11%      -0.0        0.6=
4 =C2=B1 10%  perf-profile.children.cycles-pp.load_balance
      0.03 =C2=B1282%      -0.0        0.00            -0.0        0.00    =
    perf-profile.children.cycles-pp.page_add_new_anon_rmap
      0.04 =C2=B1 75%      -0.0        0.02 =C2=B1173%      -0.0        0.0=
2 =C2=B1141%  perf-profile.children.cycles-pp.sched_setaffinity
      0.03 =C2=B1282%      -0.0        0.00            -0.0        0.00    =
    perf-profile.children.cycles-pp.__mod_lruvec_state
      0.03 =C2=B1282%      -0.0        0.00            -0.0        0.00    =
    perf-profile.children.cycles-pp.__mod_node_page_state
      0.43 =C2=B1 10%      -0.0        0.40 =C2=B1 13%      +0.0        0.4=
4 =C2=B1 12%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.17 =C2=B1 59%      -0.0        0.14 =C2=B1 41%      +0.0        0.1=
9 =C2=B1 61%  perf-profile.children.cycles-pp.asm_exc_page_fault
      0.03 =C2=B1282%      -0.0        0.01 =C2=B1223%      -0.0        0.0=
0        perf-profile.children.cycles-pp.wp_page_copy
      0.15 =C2=B1 64%      -0.0        0.13 =C2=B1 40%      +0.0        0.1=
7 =C2=B1 68%  perf-profile.children.cycles-pp.do_user_addr_fault
      0.05 =C2=B1 57%      -0.0        0.02 =C2=B1119%      -0.0        0.0=
3 =C2=B1117%  perf-profile.children.cycles-pp.schedule
      0.13 =C2=B1 75%      -0.0        0.11 =C2=B1 55%      +0.0        0.1=
5 =C2=B1 69%  perf-profile.children.cycles-pp.__handle_mm_fault
      0.10 =C2=B1 52%      -0.0        0.08 =C2=B1 20%      +0.0        0.1=
2 =C2=B1 71%  perf-profile.children.cycles-pp.mmput
      0.10 =C2=B1 52%      -0.0        0.08 =C2=B1 20%      +0.0        0.1=
2 =C2=B1 71%  perf-profile.children.cycles-pp.exit_mmap
      0.15 =C2=B1 64%      -0.0        0.13 =C2=B1 40%      +0.0        0.1=
7 =C2=B1 67%  perf-profile.children.cycles-pp.exc_page_fault
      0.03 =C2=B1 92%      -0.0        0.01 =C2=B1174%      -0.0        0.0=
3 =C2=B1113%  perf-profile.children.cycles-pp.smpboot_thread_fn
      0.24 =C2=B1 30%      -0.0        0.22 =C2=B1 34%      -0.1        0.1=
6 =C2=B1 10%  perf-profile.children.cycles-pp.cpuidle_governor_latency_req
      0.09 =C2=B1 24%      -0.0        0.07 =C2=B1 41%      -0.0        0.0=
8 =C2=B1 49%  perf-profile.children.cycles-pp.__schedule
      0.14 =C2=B1 22%      -0.0        0.12 =C2=B1 36%      +0.0        0.1=
4 =C2=B1 29%  perf-profile.children.cycles-pp.trigger_load_balance
      0.14 =C2=B1 69%      -0.0        0.12 =C2=B1 47%      +0.0        0.1=
6 =C2=B1 65%  perf-profile.children.cycles-pp.handle_mm_fault
      0.37 =C2=B1 12%      -0.0        0.35 =C2=B1 17%      +0.0        0.3=
8 =C2=B1 16%  perf-profile.children.cycles-pp._raw_spin_lock
      0.10 =C2=B1 21%      -0.0        0.08 =C2=B1 38%      -0.0        0.1=
0 =C2=B1 23%  perf-profile.children.cycles-pp.idle_cpu
      0.95 =C2=B1 13%      -0.0        0.93 =C2=B1 17%      -0.1        0.8=
7 =C2=B1 13%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      0.12 =C2=B1 49%      -0.0        0.10 =C2=B1 39%      -0.1        0.0=
5 =C2=B1 56%  perf-profile.children.cycles-pp.irq_work_needs_cpu
      0.11 =C2=B1 21%      -0.0        0.09 =C2=B1 29%      +0.0        0.1=
6 =C2=B1 64%  perf-profile.children.cycles-pp.bprm_execve
      0.37 =C2=B1 15%      -0.0        0.36 =C2=B1 18%      -0.0        0.3=
7 =C2=B1 12%  perf-profile.children.cycles-pp.get_next_timer_interrupt
      0.03 =C2=B1114%      -0.0        0.01 =C2=B1173%      -0.0        0.0=
0        perf-profile.children.cycles-pp.__intel_pmu_disable_all
      0.44 =C2=B1 10%      -0.0        0.42 =C2=B1 13%      -0.1        0.3=
7 =C2=B1 12%  perf-profile.children.cycles-pp.hrtimer_next_event_without
      0.08 =C2=B1 19%      -0.0        0.06 =C2=B1 37%      -0.0        0.0=
6 =C2=B1 80%  perf-profile.children.cycles-pp.process_interval
      0.03 =C2=B1184%      -0.0        0.02 =C2=B1142%      -0.0        0.0=
2 =C2=B1187%  perf-profile.children.cycles-pp.unmap_page_range
      0.17 =C2=B1 21%      -0.0        0.16 =C2=B1 22%      -0.0        0.1=
4 =C2=B1 16%  perf-profile.children.cycles-pp.error_entry
      0.04 =C2=B1 60%      -0.0        0.03 =C2=B1101%      +0.0        0.0=
5 =C2=B1 59%  perf-profile.children.cycles-pp.do_filp_open
      0.08 =C2=B1 20%      -0.0        0.06 =C2=B1 37%      -0.0        0.0=
6 =C2=B1 65%  perf-profile.children.cycles-pp.__libc_start_main
      0.08 =C2=B1 20%      -0.0        0.06 =C2=B1 37%      -0.0        0.0=
6 =C2=B1 65%  perf-profile.children.cycles-pp.run_builtin
      0.14 =C2=B1 22%      -0.0        0.13 =C2=B1 23%      +0.0        0.1=
8 =C2=B1 57%  perf-profile.children.cycles-pp.do_execveat_common
      0.08 =C2=B1 19%      -0.0        0.06 =C2=B1 37%      -0.0        0.0=
6 =C2=B1 80%  perf-profile.children.cycles-pp.cmd_stat
      0.08 =C2=B1 19%      -0.0        0.06 =C2=B1 37%      -0.0        0.0=
6 =C2=B1 80%  perf-profile.children.cycles-pp.dispatch_events
      0.04 =C2=B1 91%      -0.0        0.02 =C2=B1118%      +0.1        0.0=
9 =C2=B1 99%  perf-profile.children.cycles-pp.begin_new_exec
      0.09 =C2=B1 22%      -0.0        0.08 =C2=B1 30%      +0.0        0.1=
4 =C2=B1 71%  perf-profile.children.cycles-pp.load_elf_binary
      0.05 =C2=B1 58%      -0.0        0.03 =C2=B1108%      -0.0        0.0=
1 =C2=B1187%  perf-profile.children.cycles-pp.update_dl_rq_load_avg
      0.04 =C2=B1 57%      -0.0        0.03 =C2=B1101%      +0.0        0.0=
5 =C2=B1 59%  perf-profile.children.cycles-pp.path_openat
      0.14 =C2=B1 22%      -0.0        0.13 =C2=B1 23%      +0.0        0.1=
8 =C2=B1 56%  perf-profile.children.cycles-pp.__x64_sys_execve
      0.10 =C2=B1 22%      -0.0        0.08 =C2=B1 30%      +0.0        0.1=
4 =C2=B1 71%  perf-profile.children.cycles-pp.exec_binprm
      0.07 =C2=B1 95%      -0.0        0.05 =C2=B1 49%      -0.0        0.0=
5 =C2=B1 57%  perf-profile.children.cycles-pp.__x64_sys_exit_group
      0.07 =C2=B1 95%      -0.0        0.05 =C2=B1 49%      -0.0        0.0=
5 =C2=B1 57%  perf-profile.children.cycles-pp.do_group_exit
      0.07 =C2=B1 95%      -0.0        0.05 =C2=B1 49%      -0.0        0.0=
5 =C2=B1 57%  perf-profile.children.cycles-pp.do_exit
      0.46 =C2=B1  9%      -0.0        0.45 =C2=B1 14%      +0.0        0.4=
6 =C2=B1 13%  perf-profile.children.cycles-pp.find_busiest_group
      0.08 =C2=B1 65%      -0.0        0.06 =C2=B1 91%      +0.0        0.1=
0 =C2=B1 75%  perf-profile.children.cycles-pp.note_gp_changes
      0.07 =C2=B1 22%      -0.0        0.06 =C2=B1 37%      -0.0        0.0=
5 =C2=B1 79%  perf-profile.children.cycles-pp.read_counters
      0.02 =C2=B1141%      -0.0        0.00 =C2=B1331%      -0.0        0.0=
1 =C2=B1190%  perf-profile.children.cycles-pp.setlocale
      0.40 =C2=B1 23%      -0.0        0.39 =C2=B1 26%      -0.1        0.3=
0 =C2=B1 17%  perf-profile.children.cycles-pp.rcu_idle_exit
      0.03 =C2=B1184%      -0.0        0.02 =C2=B1142%      -0.0        0.0=
2 =C2=B1147%  perf-profile.children.cycles-pp.unmap_vmas
      0.09 =C2=B1 46%      -0.0        0.08 =C2=B1 40%      +0.0        0.0=
9 =C2=B1 47%  perf-profile.children.cycles-pp.rcu_dynticks_eqs_enter
      0.02 =C2=B1282%      -0.0        0.01 =C2=B1223%      -0.0        0.0=
2 =C2=B1187%  perf-profile.children.cycles-pp.zap_pte_range
      0.14 =C2=B1 21%      -0.0        0.13 =C2=B1 23%      +0.0        0.1=
8 =C2=B1 57%  perf-profile.children.cycles-pp.execve
      0.04 =C2=B1 75%      -0.0        0.03 =C2=B1101%      +0.0        0.0=
8 =C2=B1 22%  perf-profile.children.cycles-pp.rcu_read_unlock_strict
      0.01 =C2=B1282%      -0.0        0.00            -0.0        0.00    =
    perf-profile.children.cycles-pp.asm_common_interrupt
      0.01 =C2=B1282%      -0.0        0.00            -0.0        0.00    =
    perf-profile.children.cycles-pp.common_interrupt
      0.01 =C2=B1187%      -0.0        0.00            -0.0        0.00    =
    perf-profile.children.cycles-pp.hrtimer_run_queues
      0.01 =C2=B1187%      -0.0        0.00            +0.0        0.01 =C2=
=B1188%  perf-profile.children.cycles-pp.try_to_wake_up
      0.32 =C2=B1 18%      -0.0        0.31 =C2=B1 21%      +0.0        0.3=
6 =C2=B1  8%  perf-profile.children.cycles-pp.__intel_pmu_enable_all
      0.08 =C2=B1 62%      -0.0        0.07 =C2=B1 59%      -0.0        0.0=
4 =C2=B1 94%  perf-profile.children.cycles-pp.x86_pmu_disable
      0.44 =C2=B1 19%      -0.0        0.44 =C2=B1 18%      -0.1        0.3=
4 =C2=B1 13%  perf-profile.children.cycles-pp.__hrtimer_next_event_base
      0.01 =C2=B1190%      -0.0        0.01 =C2=B1331%      -0.0        0.0=
0        perf-profile.children.cycles-pp.rcu_gp_kthread
      0.01 =C2=B1188%      -0.0        0.00 =C2=B1331%      +0.0        0.0=
2 =C2=B1142%  perf-profile.children.cycles-pp.balance_fair
      0.01 =C2=B1188%      -0.0        0.00 =C2=B1331%      +0.0        0.0=
2 =C2=B1147%  perf-profile.children.cycles-pp.newidle_balance
      0.10 =C2=B1 87%      -0.0        0.09 =C2=B1 80%      -0.1        0.0=
3 =C2=B1113%  perf-profile.children.cycles-pp.irq_work_tick
      0.09 =C2=B1 29%      -0.0        0.09 =C2=B1 52%      -0.0        0.0=
5 =C2=B1 56%  perf-profile.children.cycles-pp.menu_reflect
      0.15 =C2=B1 14%      -0.0        0.15 =C2=B1 17%      +0.0        0.1=
6 =C2=B1 19%  perf-profile.children.cycles-pp.hrtimer_get_next_event
      0.01 =C2=B1187%      -0.0        0.00 =C2=B1331%      +0.0        0.0=
2 =C2=B1112%  perf-profile.children.cycles-pp.can_stop_idle_tick
      0.05 =C2=B1 97%      -0.0        0.05 =C2=B1 76%      -0.0        0.0=
2 =C2=B1142%  perf-profile.children.cycles-pp.do_nocb_deferred_wakeup
      0.65 =C2=B1 15%      -0.0        0.65 =C2=B1 17%      +0.1        0.7=
5 =C2=B1  8%  perf-profile.children.cycles-pp.native_sched_clock
      0.01 =C2=B1282%      -0.0        0.00            -0.0        0.00    =
    perf-profile.children.cycles-pp.net_rx_action
      0.01 =C2=B1282%      -0.0        0.00            -0.0        0.00    =
    perf-profile.children.cycles-pp.__napi_poll
      0.01 =C2=B1282%      -0.0        0.00            -0.0        0.00    =
    perf-profile.children.cycles-pp.i40e_napi_poll
      0.12 =C2=B1 19%      -0.0        0.12 =C2=B1 23%      +0.0        0.1=
2 =C2=B1 28%  perf-profile.children.cycles-pp.main
      0.13 =C2=B1 38%      -0.0        0.13 =C2=B1 59%      +0.0        0.1=
5 =C2=B1 54%  perf-profile.children.cycles-pp.rcu_core
      0.01 =C2=B1282%      -0.0        0.00            -0.0        0.00    =
    perf-profile.children.cycles-pp.force_qs_rnp
      0.01 =C2=B1282%      -0.0        0.00            -0.0        0.00    =
    perf-profile.children.cycles-pp.timerqueue_iterate_next
      0.01 =C2=B1282%      -0.0        0.00            -0.0        0.00    =
    perf-profile.children.cycles-pp._dl_addr
      0.01 =C2=B1282%      -0.0        0.00            -0.0        0.00    =
    perf-profile.children.cycles-pp.enqueue_task_fair
      0.01 =C2=B1282%      -0.0        0.00            -0.0        0.00    =
    perf-profile.children.cycles-pp.copy_strings
      0.01 =C2=B1282%      -0.0        0.00            -0.0        0.00    =
    perf-profile.children.cycles-pp.pick_next_task_fair
      0.01 =C2=B1282%      -0.0        0.00            +0.0        0.01 =C2=
=B1282%  perf-profile.children.cycles-pp.tlb_finish_mmu
      0.01 =C2=B1282%      -0.0        0.00            +0.0        0.01 =C2=
=B1282%  perf-profile.children.cycles-pp.tlb_flush_mmu
      0.09 =C2=B1 23%      -0.0        0.09 =C2=B1 28%      +0.0        0.1=
0 =C2=B1 22%  perf-profile.children.cycles-pp.apparmor_file_permission
      0.07 =C2=B1 86%      -0.0        0.06 =C2=B1 56%      +0.0        0.1=
1 =C2=B1 37%  perf-profile.children.cycles-pp.tick_sched_do_timer
      0.05 =C2=B1105%      -0.0        0.04 =C2=B1 96%      +0.0        0.0=
8 =C2=B1 66%  perf-profile.children.cycles-pp.timekeeping_advance
      0.07 =C2=B1 53%      -0.0        0.07 =C2=B1 65%      -0.0        0.0=
7 =C2=B1 44%  perf-profile.children.cycles-pp.get_cpu_device
      0.05 =C2=B1 72%      -0.0        0.05 =C2=B1108%      +0.0        0.0=
7 =C2=B1 41%  perf-profile.children.cycles-pp.do_fault
      0.04 =C2=B1 78%      -0.0        0.04 =C2=B1 89%      +0.0        0.0=
6 =C2=B1 66%  perf-profile.children.cycles-pp.do_sys_open
      0.01 =C2=B1282%      -0.0        0.00 =C2=B1331%      -0.0        0.0=
0        perf-profile.children.cycles-pp.ksoftirqd_running
      0.11 =C2=B1 21%      -0.0        0.10 =C2=B1 23%      -0.0        0.1=
1 =C2=B1 14%  perf-profile.children.cycles-pp._find_next_bit
      0.20 =C2=B1 22%      -0.0        0.20 =C2=B1 18%      +0.0        0.2=
2 =C2=B1 13%  perf-profile.children.cycles-pp.rw_verify_area
      0.04 =C2=B1 79%      -0.0        0.04 =C2=B1 89%      +0.0        0.0=
6 =C2=B1 66%  perf-profile.children.cycles-pp.do_sys_openat2
      0.24 =C2=B1 33%      -0.0        0.23 =C2=B1 39%      -0.1        0.1=
4 =C2=B1 32%  perf-profile.children.cycles-pp.ret_from_fork
      0.01 =C2=B1188%      -0.0        0.01 =C2=B1223%      +0.0        0.0=
3 =C2=B1 93%  perf-profile.children.cycles-pp.link_path_walk
      0.07 =C2=B1 68%      -0.0        0.06 =C2=B1 51%      -0.0        0.0=
2 =C2=B1192%  perf-profile.children.cycles-pp.rcu_eqs_enter
      0.03 =C2=B1112%      -0.0        0.03 =C2=B1123%      +0.0        0.0=
3 =C2=B1 90%  perf-profile.children.cycles-pp.vm_mmap_pgoff
      0.05 =C2=B1 94%      -0.0        0.05 =C2=B1 74%      -0.1        0.0=
0        perf-profile.children.cycles-pp.intel_pmu_disable_all
      0.01 =C2=B1282%      -0.0        0.00 =C2=B1331%      -0.0        0.0=
0        perf-profile.children.cycles-pp.timer_clear_idle
      0.01 =C2=B1282%      -0.0        0.00 =C2=B1331%      +0.0        0.0=
1 =C2=B1282%  perf-profile.children.cycles-pp.tick_nohz_idle_retain_tick
      0.01 =C2=B1282%      -0.0        0.00 =C2=B1331%      +0.0        0.0=
1 =C2=B1282%  perf-profile.children.cycles-pp.schedule_idle
      0.23 =C2=B1 35%      -0.0        0.23 =C2=B1 40%      -0.1        0.1=
3 =C2=B1 33%  perf-profile.children.cycles-pp.kthread
      0.01 =C2=B1187%      -0.0        0.01 =C2=B1227%      +0.0        0.0=
2 =C2=B1142%  perf-profile.children.cycles-pp.ksys_mmap_pgoff
      0.01 =C2=B1187%      -0.0        0.01 =C2=B1227%      +0.0        0.0=
2 =C2=B1144%  perf-profile.children.cycles-pp.update_group_capacity
      0.01 =C2=B1282%      -0.0        0.01 =C2=B1331%      +0.0        0.0=
1 =C2=B1187%  perf-profile.children.cycles-pp.next_uptodate_page
      0.01 =C2=B1282%      -0.0        0.01 =C2=B1331%      -0.0        0.0=
0        perf-profile.children.cycles-pp.__note_gp_changes
      0.01 =C2=B1282%      -0.0        0.01 =C2=B1331%      -0.0        0.0=
0        perf-profile.children.cycles-pp.tick_nohz_idle_got_tick
      0.03 =C2=B1113%      -0.0        0.02 =C2=B1122%      +0.0        0.0=
3 =C2=B1 91%  perf-profile.children.cycles-pp.do_mmap
      0.01 =C2=B1187%      -0.0        0.01 =C2=B1230%      -0.0        0.0=
0        perf-profile.children.cycles-pp.perf_ctx_unlock
      0.25 =C2=B1 24%      -0.0        0.25 =C2=B1 26%      -0.0        0.2=
0 =C2=B1 23%  perf-profile.children.cycles-pp.rcu_eqs_exit
      0.00            +0.0        0.00            +0.0        0.01 =C2=B128=
2%  perf-profile.children.cycles-pp.read(a)plt
      0.00            +0.0        0.00            +0.0        0.01 =C2=B128=
2%  perf-profile.children.cycles-pp.page_remove_rmap
      0.00            +0.0        0.00            +0.0        0.01 =C2=B128=
2%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      0.00            +0.0        0.00            +0.0        0.01 =C2=B128=
2%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.00            +0.0        0.00            +0.0        0.01 =C2=B128=
2%  perf-profile.children.cycles-pp.__lookup_slow
      0.00            +0.0        0.00            +0.0        0.01 =C2=B128=
2%  perf-profile.children.cycles-pp.rcu_do_batch
      0.00            +0.0        0.00            +0.0        0.01 =C2=B128=
2%  perf-profile.children.cycles-pp.timekeeping_update
      0.00            +0.0        0.00            +0.0        0.01 =C2=B128=
2%  perf-profile.children.cycles-pp.cpuidle_select
      0.00            +0.0        0.00            +0.0        0.01 =C2=B128=
2%  perf-profile.children.cycles-pp.path_lookupat
      0.00            +0.0        0.00            +0.0        0.01 =C2=B128=
2%  perf-profile.children.cycles-pp.release_pages
      0.00            +0.0        0.00            +0.0        0.01 =C2=B128=
2%  perf-profile.children.cycles-pp.filename_lookup
      0.00            +0.0        0.00            +0.0        0.03 =C2=B128=
2%  perf-profile.children.cycles-pp.unlink_anon_vmas
      0.00            +0.0        0.00            +0.0        0.03 =C2=B128=
2%  perf-profile.children.cycles-pp.free_pgtables
      0.01 =C2=B1282%      +0.0        0.01 =C2=B1224%      -0.0        0.0=
0        perf-profile.children.cycles-pp.arch_cpu_idle_exit
      0.12 =C2=B1 15%      +0.0        0.12 =C2=B1 20%      +0.0        0.1=
2 =C2=B1 15%  perf-profile.children.cycles-pp.cpumask_next_and
      0.02 =C2=B1197%      +0.0        0.02 =C2=B1146%      +0.0        0.0=
4 =C2=B1 74%  perf-profile.children.cycles-pp.profile_tick
      0.02 =C2=B1142%      +0.0        0.02 =C2=B1145%      +0.0        0.0=
2 =C2=B1143%  perf-profile.children.cycles-pp.mmap_region
      0.06 =C2=B1 95%      +0.0        0.06 =C2=B1 75%      -0.0        0.0=
2 =C2=B1142%  perf-profile.children.cycles-pp.tick_check_broadcast_expired
      0.12 =C2=B1 24%      +0.0        0.12 =C2=B1 24%      -0.0        0.0=
9 =C2=B1 36%  perf-profile.children.cycles-pp.tick_nohz_tick_stopped
      0.06 =C2=B1 45%      +0.0        0.06 =C2=B1 65%      +0.0        0.0=
7 =C2=B1 42%  perf-profile.children.cycles-pp.irqentry_exit
      0.04 =C2=B1 91%      +0.0        0.04 =C2=B1106%      +0.0        0.0=
6 =C2=B1 42%  perf-profile.children.cycles-pp.filemap_map_pages
      0.77 =C2=B1 13%      +0.0        0.77 =C2=B1 15%      +0.1        0.8=
8 =C2=B1  7%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.32 =C2=B1 12%      +0.0        0.32 =C2=B1 16%      +0.0        0.3=
6 =C2=B1 16%  perf-profile.children.cycles-pp.arch_scale_freq_tick
      0.09 =C2=B1 63%      +0.0        0.10 =C2=B1 44%      -0.1        0.0=
3 =C2=B1114%  perf-profile.children.cycles-pp.irqtime_account_process_tick
      0.14 =C2=B1 66%      +0.0        0.14 =C2=B1 49%      -0.1        0.0=
3 =C2=B1112%  perf-profile.children.cycles-pp.native_apic_mem_write
      0.01 =C2=B1187%      +0.0        0.02 =C2=B1177%      -0.0        0.0=
1 =C2=B1282%  perf-profile.children.cycles-pp.account_process_tick
      0.02 =C2=B1114%      +0.0        0.03 =C2=B1122%      -0.0        0.0=
0        perf-profile.children.cycles-pp.rcu_needs_cpu
      0.01 =C2=B1282%      +0.0        0.01 =C2=B1224%      +0.0        0.0=
1 =C2=B1282%  perf-profile.children.cycles-pp.sched_clock_idle_wakeup_event
      0.01 =C2=B1282%      +0.0        0.01 =C2=B1224%      +0.0        0.0=
2 =C2=B1145%  perf-profile.children.cycles-pp.walk_component
      0.05 =C2=B1 92%      +0.0        0.05 =C2=B1 73%      -0.0        0.0=
1 =C2=B1282%  perf-profile.children.cycles-pp.restore_regs_and_return_to_ke=
rnel
      0.00            +0.0        0.00 =C2=B1331%      +0.0        0.00    =
    perf-profile.children.cycles-pp.cpu_latency_qos_limit
      0.00            +0.0        0.00 =C2=B1331%      +0.0        0.00    =
    perf-profile.children.cycles-pp.rcu_segcblist_ready_cbs
      0.00            +0.0        0.00 =C2=B1331%      +0.0        0.00    =
    perf-profile.children.cycles-pp.__libc_read
      0.00            +0.0        0.00 =C2=B1331%      +0.0        0.03 =C2=
=B1282%  perf-profile.children.cycles-pp.do_anonymous_page
      0.02 =C2=B1143%      +0.0        0.02 =C2=B1145%      -0.0        0.0=
1 =C2=B1187%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.01 =C2=B1282%      +0.0        0.01 =C2=B1223%      +0.0        0.0=
2 =C2=B1111%  perf-profile.children.cycles-pp.dup_mm
      0.17 =C2=B1 40%      +0.0        0.18 =C2=B1 18%      -0.1        0.1=
0 =C2=B1 17%  perf-profile.children.cycles-pp.rb_next
      0.00            +0.0        0.01 =C2=B1331%      +0.0        0.00    =
    perf-profile.children.cycles-pp.__alloc_pages
      0.28 =C2=B1 27%      +0.0        0.29 =C2=B1 18%      -0.0        0.2=
4 =C2=B1 13%  perf-profile.children.cycles-pp.update_irq_load_avg
      0.00            +0.0        0.01 =C2=B1331%      +0.0        0.00    =
    perf-profile.children.cycles-pp.cpuidle_get_cpu_driver
      0.03 =C2=B1 90%      +0.0        0.04 =C2=B1 74%      -0.0        0.0=
1 =C2=B1282%  perf-profile.children.cycles-pp.hrtimer_forward
      0.45 =C2=B1 29%      +0.0        0.46 =C2=B1 39%      -0.1        0.3=
4 =C2=B1 19%  perf-profile.children.cycles-pp.rcu_sched_clock_irq
      0.05 =C2=B1 77%      +0.0        0.06 =C2=B1 49%      +0.0        0.0=
7 =C2=B1 63%  perf-profile.children.cycles-pp.__x64_sys_write
      0.04 =C2=B1 92%      +0.0        0.05 =C2=B1 95%      -0.0        0.0=
1 =C2=B1282%  perf-profile.children.cycles-pp.pm_qos_read_value
      0.03 =C2=B1114%      +0.0        0.04 =C2=B1 86%      +0.0        0.0=
4 =C2=B1 72%  perf-profile.children.cycles-pp.kill_fasync
      0.01 =C2=B1187%      +0.0        0.02 =C2=B1142%      -0.0        0.0=
0        perf-profile.children.cycles-pp.rcu_nocb_flush_deferred_wakeup
      0.00            +0.0        0.01 =C2=B1223%      +0.0        0.00    =
    perf-profile.children.cycles-pp.io_serial_out
      0.00            +0.0        0.01 =C2=B1223%      +0.0        0.00    =
    perf-profile.children.cycles-pp.error_return
      0.02 =C2=B1143%      +0.0        0.03 =C2=B1121%      -0.0        0.0=
0        perf-profile.children.cycles-pp.leave_mm
      0.01 =C2=B1187%      +0.0        0.02 =C2=B1142%      +0.0        0.0=
2 =C2=B1143%  perf-profile.children.cycles-pp.sched_clock
      0.00            +0.0        0.01 =C2=B1223%      +0.0        0.02 =C2=
=B1141%  perf-profile.children.cycles-pp.dup_mmap
      0.11 =C2=B1 56%      +0.0        0.12 =C2=B1 47%      -0.1        0.0=
4 =C2=B1 72%  perf-profile.children.cycles-pp.rb_insert_color
      0.26 =C2=B1 17%      +0.0        0.27 =C2=B1 12%      +0.0        0.2=
9 =C2=B1 12%  perf-profile.children.cycles-pp.rcu_all_qs
      0.01 =C2=B1188%      +0.0        0.02 =C2=B1119%      -0.0        0.0=
0        perf-profile.children.cycles-pp.rcu_is_cpu_rrupt_from_idle
      0.06 =C2=B1 41%      +0.0        0.07 =C2=B1 41%      +0.0        0.0=
8 =C2=B1 25%  perf-profile.children.cycles-pp.__libc_fork
      0.11 =C2=B1 26%      +0.0        0.13 =C2=B1 28%      -0.0        0.0=
9 =C2=B1 45%  perf-profile.children.cycles-pp.rcu_dynticks_eqs_exit
      0.27 =C2=B1 26%      +0.0        0.28 =C2=B1 23%      +0.1        0.3=
4 =C2=B1 18%  perf-profile.children.cycles-pp.make_kuid
      0.35 =C2=B1 22%      +0.0        0.37 =C2=B1 19%      -0.1        0.2=
9 =C2=B1  8%  perf-profile.children.cycles-pp.run_rebalance_domains
      0.58 =C2=B1 21%      +0.0        0.60 =C2=B1 14%      +0.0        0.6=
0 =C2=B1 13%  perf-profile.children.cycles-pp.__might_fault
      0.30 =C2=B1 32%      +0.0        0.32 =C2=B1 35%      -0.1        0.1=
6 =C2=B1 15%  perf-profile.children.cycles-pp.enqueue_hrtimer
      0.26 =C2=B1 16%      +0.0        0.27 =C2=B1 15%      +0.0        0.2=
6 =C2=B1 18%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.27 =C2=B1 34%      +0.0        0.29 =C2=B1 36%      -0.1        0.1=
4 =C2=B1 18%  perf-profile.children.cycles-pp.timerqueue_add
      0.16 =C2=B1 27%      +0.0        0.18 =C2=B1 23%      +0.1        0.2=
1 =C2=B1 18%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_pre=
pare
      0.43 =C2=B1 17%      +0.0        0.45 =C2=B1 14%      -0.0        0.3=
9 =C2=B1 13%  perf-profile.children.cycles-pp.update_rq_clock
      0.03 =C2=B1113%      +0.0        0.04 =C2=B1 74%      +0.0        0.0=
4 =C2=B1 92%  perf-profile.children.cycles-pp.rcu_nmi_exit
      0.33 =C2=B1 23%      +0.0        0.35 =C2=B1 19%      -0.0        0.2=
8 =C2=B1 10%  perf-profile.children.cycles-pp.update_blocked_averages
      0.03 =C2=B1120%      +0.0        0.05 =C2=B1 87%      -0.0        0.0=
0        perf-profile.children.cycles-pp.check_tsc_unstable
      0.03 =C2=B1114%      +0.0        0.05 =C2=B1 72%      -0.0        0.0=
0        perf-profile.children.cycles-pp.rcu_irq_enter
      0.13 =C2=B1 19%      +0.0        0.15 =C2=B1 18%      +0.0        0.1=
6 =C2=B1 19%  perf-profile.children.cycles-pp.call_cpuidle
      0.42 =C2=B1 29%      +0.0        0.44 =C2=B1 23%      -0.1        0.3=
1 =C2=B1 16%  perf-profile.children.cycles-pp.hrtimer_update_next_event
      0.05 =C2=B1 89%      +0.0        0.07 =C2=B1 80%      -0.0        0.0=
1 =C2=B1187%  perf-profile.children.cycles-pp.cpuidle_not_available
      0.02 =C2=B1145%      +0.0        0.04 =C2=B1 88%      -0.0        0.0=
0        perf-profile.children.cycles-pp.cpuidle_reflect
      0.02 =C2=B1114%      +0.0        0.04 =C2=B1 73%      -0.0        0.0=
0        perf-profile.children.cycles-pp.task_tick_idle
      0.13 =C2=B1 70%      +0.0        0.15 =C2=B1 66%      -0.1        0.0=
3 =C2=B1 90%  perf-profile.children.cycles-pp.drm_fb_helper_damage_work
      0.05 =C2=B1 76%      +0.0        0.07 =C2=B1 39%      +0.0        0.0=
5 =C2=B1 57%  perf-profile.children.cycles-pp.update_rt_rq_load_avg
      0.03 =C2=B1118%      +0.0        0.05 =C2=B1 47%      +0.0        0.0=
4 =C2=B1 92%  perf-profile.children.cycles-pp.__wake_up_sync_key
      0.00            +0.0        0.02 =C2=B1206%      +0.0        0.02 =C2=
=B1141%  perf-profile.children.cycles-pp.poll_idle
      0.13 =C2=B1 70%      +0.0        0.15 =C2=B1 66%      -0.1        0.0=
3 =C2=B1 90%  perf-profile.children.cycles-pp.memcpy_toio
      0.13 =C2=B1 71%      +0.0        0.15 =C2=B1 65%      -0.1        0.0=
3 =C2=B1 91%  perf-profile.children.cycles-pp.irqentry_enter
      0.13 =C2=B1 55%      +0.0        0.15 =C2=B1 46%      -0.1        0.0=
2 =C2=B1197%  perf-profile.children.cycles-pp.perf_event_task_tick
      0.20 =C2=B1 35%      +0.0        0.23 =C2=B1 27%      -0.1        0.1=
5 =C2=B1 20%  perf-profile.children.cycles-pp.__hrtimer_get_next_event
      0.84 =C2=B1 23%      +0.0        0.86 =C2=B1 17%      +0.2        1.0=
4 =C2=B1 11%  perf-profile.children.cycles-pp.__might_sleep
      0.74 =C2=B1 21%      +0.0        0.76 =C2=B1 21%      +0.2        0.9=
3 =C2=B1 13%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.23 =C2=B1 31%      +0.0        0.26 =C2=B1 24%      +0.1        0.3=
2 =C2=B1 24%  perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
      0.09 =C2=B1 23%      +0.0        0.12 =C2=B1 37%      -0.0        0.0=
8 =C2=B1 35%  perf-profile.children.cycles-pp.rb_erase
      0.16 =C2=B1 73%      +0.0        0.18 =C2=B1 48%      -0.1        0.0=
5 =C2=B1 55%  perf-profile.children.cycles-pp.tick_check_oneshot_broadcast_=
this_cpu
      0.06 =C2=B1102%      +0.0        0.09 =C2=B1 66%      -0.0        0.0=
1 =C2=B1187%  perf-profile.children.cycles-pp.rcu_nmi_enter
      0.01 =C2=B1188%      +0.0        0.04 =C2=B1 91%      +0.0        0.0=
5 =C2=B1 56%  perf-profile.children.cycles-pp.copy_process
      0.41 =C2=B1 23%      +0.0        0.44 =C2=B1 18%      +0.1        0.5=
3 =C2=B1 13%  perf-profile.children.cycles-pp.map_id_range_down
      0.11 =C2=B1 79%      +0.0        0.14 =C2=B1 52%      -0.1        0.0=
3 =C2=B1 91%  perf-profile.children.cycles-pp.delay_tsc
      0.46 =C2=B1 26%      +0.0        0.49 =C2=B1 17%      +0.2        0.6=
5 =C2=B1 12%  perf-profile.children.cycles-pp.aa_file_perm
      0.13 =C2=B1 29%      +0.0        0.16 =C2=B1 44%      +0.0        0.1=
6 =C2=B1 22%  perf-profile.children.cycles-pp.iov_iter_init
      0.03 =C2=B1113%      +0.0        0.06 =C2=B1 51%      +0.0        0.0=
6 =C2=B1 43%  perf-profile.children.cycles-pp.__do_sys_clone
      0.03 =C2=B1113%      +0.0        0.06 =C2=B1 51%      +0.0        0.0=
6 =C2=B1 43%  perf-profile.children.cycles-pp.kernel_clone
      0.15 =C2=B1 61%      +0.0        0.18 =C2=B1 46%      -0.1        0.0=
6 =C2=B1 46%  perf-profile.children.cycles-pp.worker_thread
      0.01 =C2=B1282%      +0.0        0.04 =C2=B1 88%      -0.0        0.0=
1 =C2=B1282%  perf-profile.children.cycles-pp.sched_idle_set_state
      0.02 =C2=B1114%      +0.0        0.06 =C2=B1206%      +0.0        0.0=
3 =C2=B1 93%  perf-profile.children.cycles-pp.seq_read_iter
      0.00            +0.0        0.03 =C2=B1331%      +0.0        0.00    =
    perf-profile.children.cycles-pp.node_read_vmstat
      0.28 =C2=B1 25%      +0.0        0.31 =C2=B1 19%      +0.1        0.3=
5 =C2=B1 11%  perf-profile.children.cycles-pp.timestamp_truncate
      0.00            +0.0        0.03 =C2=B1331%      +0.0        0.00    =
    perf-profile.children.cycles-pp.sysfs_kf_seq_show
      0.00            +0.0        0.03 =C2=B1331%      +0.0        0.00    =
    perf-profile.children.cycles-pp.dev_attr_show
      0.14 =C2=B1 68%      +0.0        0.17 =C2=B1 46%      -0.1        0.0=
6 =C2=B1 42%  perf-profile.children.cycles-pp.process_one_work
      0.00            +0.0        0.03 =C2=B1331%      +0.0        0.01 =C2=
=B1282%  perf-profile.children.cycles-pp.fold_vm_numa_events
      0.05 =C2=B1 76%      +0.0        0.08 =C2=B1 26%      +0.0        0.0=
6 =C2=B1 58%  perf-profile.children.cycles-pp.tick_program_event
      0.30 =C2=B1 30%      +0.0        0.34 =C2=B1 33%      -0.1        0.1=
9 =C2=B1 21%  perf-profile.children.cycles-pp.timerqueue_del
      0.17 =C2=B1 55%      +0.0        0.20 =C2=B1 40%      -0.1        0.1=
0 =C2=B1 29%  perf-profile.children.cycles-pp.nr_iowait_cpu
      0.18 =C2=B1 76%      +0.0        0.22 =C2=B1 48%      -0.1        0.0=
6 =C2=B1 40%  perf-profile.children.cycles-pp.update_ts_time_stats
      1.06 =C2=B1 13%      +0.0        1.10 =C2=B1 13%      +0.2        1.3=
0 =C2=B1  6%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.02 =C2=B1112%      +0.0        0.06 =C2=B1 18%      +0.0        0.0=
6 =C2=B1 45%  perf-profile.children.cycles-pp.__x64_sys_read
      0.38 =C2=B1 34%      +0.0        0.42 =C2=B1 35%      -0.2        0.2=
3 =C2=B1 19%  perf-profile.children.cycles-pp.__remove_hrtimer
      0.52 =C2=B1 14%      +0.0        0.56 =C2=B1 14%      +0.1        0.6=
2 =C2=B1 11%  perf-profile.children.cycles-pp.__cond_resched
      0.98 =C2=B1 25%      +0.0        1.02 =C2=B1 15%      -0.2        0.7=
6 =C2=B1 34%  perf-profile.children.cycles-pp.irq_enter_rcu
      0.21 =C2=B1 27%      +0.0        0.25 =C2=B1 19%      +0.1        0.2=
8 =C2=B1 13%  perf-profile.children.cycles-pp.__wake_up_common
      0.30 =C2=B1 18%      +0.0        0.35 =C2=B1 18%      +0.1        0.3=
6 =C2=B1 10%  perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.23 =C2=B1 24%      +0.0        0.28 =C2=B1 19%      +0.1        0.3=
4 =C2=B1 15%  perf-profile.children.cycles-pp.make_kgid
      0.93 =C2=B1 26%      +0.0        0.98 =C2=B1 17%      -0.2        0.7=
0 =C2=B1 38%  perf-profile.children.cycles-pp.tick_irq_enter
      0.83 =C2=B1 22%      +0.1        0.88 =C2=B1 15%      +0.2        1.0=
1 =C2=B1 11%  perf-profile.children.cycles-pp.___might_sleep
      0.46 =C2=B1 65%      +0.1        0.52 =C2=B1 48%      -0.3        0.1=
6 =C2=B1 23%  perf-profile.children.cycles-pp.io_serial_in
      1.12 =C2=B1 19%      +0.1        1.18 =C2=B1 17%      +0.3        1.4=
3 =C2=B1 13%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.17 =C2=B1 69%      +0.1        0.24 =C2=B1 52%      -0.1        0.0=
5 =C2=B1 73%  perf-profile.children.cycles-pp.run_posix_cpu_timers
      0.80 =C2=B1 22%      +0.1        0.87 =C2=B1 16%      +0.2        1.0=
2 =C2=B1 12%  perf-profile.children.cycles-pp.current_time
      1.01 =C2=B1 19%      +0.1        1.08 =C2=B1 15%      +0.2        1.1=
8 =C2=B1  8%  perf-profile.children.cycles-pp.mutex_unlock
      0.44 =C2=B1 21%      +0.1        0.51 =C2=B1 18%      +0.2        0.6=
2 =C2=B1 20%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
     26.91 =C2=B1 18%      +0.1       26.99 =C2=B1 13%      +4.9       31.8=
2 =C2=B1  8%  perf-profile.children.cycles-pp.do_syscall_64
      0.56 =C2=B1 66%      +0.1        0.65 =C2=B1 48%      -0.4        0.2=
1 =C2=B1 14%  perf-profile.children.cycles-pp.serial8250_console_putchar
      0.58 =C2=B1 66%      +0.1        0.66 =C2=B1 47%      -0.4        0.2=
1 =C2=B1 14%  perf-profile.children.cycles-pp.wait_for_xmitr
      0.62 =C2=B1 22%      +0.1        0.72 =C2=B1 19%      +0.2        0.8=
3 =C2=B1 11%  perf-profile.children.cycles-pp.file_update_time
      0.58 =C2=B1 66%      +0.1        0.67 =C2=B1 47%      -0.4        0.2=
1 =C2=B1 13%  perf-profile.children.cycles-pp.uart_console_write
      0.60 =C2=B1 65%      +0.1        0.69 =C2=B1 47%      -0.4        0.2=
2 =C2=B1 13%  perf-profile.children.cycles-pp.serial8250_console_write
      0.62 =C2=B1 65%      +0.1        0.72 =C2=B1 46%      -0.4        0.2=
3 =C2=B1 12%  perf-profile.children.cycles-pp.irq_work_run
      0.62 =C2=B1 65%      +0.1        0.72 =C2=B1 46%      -0.4        0.2=
3 =C2=B1 12%  perf-profile.children.cycles-pp.printk
      0.62 =C2=B1 65%      +0.1        0.72 =C2=B1 46%      -0.4        0.2=
3 =C2=B1 12%  perf-profile.children.cycles-pp.vprintk_emit
      0.62 =C2=B1 65%      +0.1        0.72 =C2=B1 46%      -0.4        0.2=
3 =C2=B1 12%  perf-profile.children.cycles-pp.console_unlock
      0.62 =C2=B1 65%      +0.1        0.72 =C2=B1 46%      -0.4        0.2=
3 =C2=B1 12%  perf-profile.children.cycles-pp.asm_sysvec_irq_work
      0.62 =C2=B1 65%      +0.1        0.72 =C2=B1 46%      -0.4        0.2=
3 =C2=B1 12%  perf-profile.children.cycles-pp.sysvec_irq_work
      0.62 =C2=B1 65%      +0.1        0.72 =C2=B1 46%      -0.4        0.2=
3 =C2=B1 12%  perf-profile.children.cycles-pp.__sysvec_irq_work
      0.62 =C2=B1 65%      +0.1        0.72 =C2=B1 46%      -0.4        0.2=
3 =C2=B1 12%  perf-profile.children.cycles-pp.irq_work_single
      1.10 =C2=B1 19%      +0.1        1.20 =C2=B1 15%      +0.3        1.4=
1 =C2=B1 12%  perf-profile.children.cycles-pp.atime_needs_update
      0.64 =C2=B1 65%      +0.1        0.74 =C2=B1 45%      -0.4        0.2=
5 =C2=B1 12%  perf-profile.children.cycles-pp.irq_work_run_list
      1.19 =C2=B1 17%      +0.1        1.30 =C2=B1 14%      +0.3        1.4=
5 =C2=B1  7%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      1.25 =C2=B1 19%      +0.1        1.39 =C2=B1 14%      +0.3        1.5=
9 =C2=B1 11%  perf-profile.children.cycles-pp.touch_atime
      1.12 =C2=B1 21%      +0.1        1.26 =C2=B1 13%      +0.4        1.5=
7 =C2=B1 14%  perf-profile.children.cycles-pp.common_file_perm
      2.06 =C2=B1 18%      +0.1        2.21 =C2=B1 15%      +0.5        2.6=
0 =C2=B1 11%  perf-profile.children.cycles-pp.mutex_lock
      1.23 =C2=B1 16%      +0.2        1.39 =C2=B1 13%      +0.4        1.6=
0 =C2=B1  6%  perf-profile.children.cycles-pp.__wake_up_common_lock
      1.67 =C2=B1 17%      +0.2        1.84 =C2=B1 13%      +0.4        2.0=
4 =C2=B1  9%  perf-profile.children.cycles-pp.__fget_light
      1.76 =C2=B1 17%      +0.2        1.94 =C2=B1 16%      +0.5        2.2=
1 =C2=B1  8%  perf-profile.children.cycles-pp.__entry_text_start
      1.94 =C2=B1 20%      +0.2        2.13 =C2=B1 14%      +0.5        2.4=
3 =C2=B1 12%  perf-profile.children.cycles-pp.copyin
      1.95 =C2=B1 17%      +0.2        2.17 =C2=B1 14%      +0.5        2.4=
1 =C2=B1  7%  perf-profile.children.cycles-pp.__fdget_pos
     27.76 =C2=B1 18%      +0.2       27.97 =C2=B1 13%      +5.1       32.9=
1 =C2=B1  8%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      2.05 =C2=B1 20%      +0.2        2.29 =C2=B1 14%      +0.4        2.4=
3 =C2=B1  9%  perf-profile.children.cycles-pp.copyout
      3.22 =C2=B1 20%      +0.2        3.47 =C2=B1 12%      +0.8        4.0=
2 =C2=B1 11%  perf-profile.children.cycles-pp.copy_page_from_iter
      8.26 =C2=B1 19%      +0.3        8.52 =C2=B1 14%      +1.7        9.9=
2 =C2=B1  8%  perf-profile.children.cycles-pp.pipe_read
      3.27 =C2=B1 19%      +0.3        3.58 =C2=B1 12%      +0.6        3.8=
4 =C2=B1 10%  perf-profile.children.cycles-pp.copy_page_to_iter
     10.87 =C2=B1 18%      +0.3       11.19 =C2=B1 13%      +2.4       13.3=
1 =C2=B1  8%  perf-profile.children.cycles-pp.vfs_write
      2.39 =C2=B1 18%      +0.3        2.71 =C2=B1 15%      +0.6        3.0=
1 =C2=B1  8%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      8.75 =C2=B1 19%      +0.4        9.11 =C2=B1 13%      +1.8       10.5=
1 =C2=B1  8%  perf-profile.children.cycles-pp.new_sync_read
      3.80 =C2=B1 19%      +0.4        4.22 =C2=B1 14%      +0.8        4.6=
1 =C2=B1 10%  perf-profile.children.cycles-pp.copy_user_enhanced_fast_string
     12.12 =C2=B1 18%      +0.5       12.61 =C2=B1 13%      +2.7       14.8=
4 =C2=B1  8%  perf-profile.children.cycles-pp.ksys_write
     40.83 =C2=B1 12%      +0.7       41.57 =C2=B1  9%      -5.8       35.0=
7 =C2=B1 10%  perf-profile.children.cycles-pp.intel_idle
      8.46 =C2=B1 18%      +0.8        9.22 =C2=B1 13%      +2.4       10.8=
2 =C2=B1  8%  perf-profile.children.cycles-pp.pipe_write
      8.99 =C2=B1 18%      +0.8        9.78 =C2=B1 13%      +2.5       11.4=
6 =C2=B1  8%  perf-profile.children.cycles-pp.new_sync_write
      0.51 =C2=B1 32%      +0.9        1.42 =C2=B1205%      +0.0        0.5=
4 =C2=B1 13%  perf-profile.children.cycles-pp.start_kernel
      1.41 =C2=B1 22%      -1.4        0.00            -1.4        0.00    =
    perf-profile.self.cycles-pp.fsnotify
      2.41 =C2=B1 52%      -0.3        2.07 =C2=B1 70%      +0.8        3.2=
6 =C2=B1 34%  perf-profile.self.cycles-pp.ktime_get
      0.95 =C2=B1 60%      -0.3        0.66 =C2=B1 90%      +0.5        1.4=
7 =C2=B1 22%  perf-profile.self.cycles-pp.timekeeping_max_deferment
      0.57 =C2=B1 23%      -0.3        0.30 =C2=B1 22%      +0.2        0.7=
3 =C2=B1 17%  perf-profile.self.cycles-pp.anon_pipe_buf_release
      2.15 =C2=B1 11%      -0.2        1.96 =C2=B1 22%      +0.0        2.1=
5 =C2=B1  6%  perf-profile.self.cycles-pp.menu_select
      0.49 =C2=B1 35%      -0.1        0.34 =C2=B1 57%      +0.1        0.6=
1 =C2=B1 23%  perf-profile.self.cycles-pp.calc_global_load_tick
      0.56 =C2=B1 40%      -0.1        0.42 =C2=B1 40%      +0.1        0.6=
4 =C2=B1 19%  perf-profile.self.cycles-pp.tick_nohz_next_event
      0.98 =C2=B1 22%      -0.1        0.88 =C2=B1 20%      +0.1        1.1=
3 =C2=B1  6%  perf-profile.self.cycles-pp.lapic_next_deadline
      0.71 =C2=B1 12%      -0.1        0.61 =C2=B1 18%      +0.1        0.7=
6 =C2=B1 14%  perf-profile.self.cycles-pp.read_tsc
      0.60 =C2=B1 22%      -0.1        0.51 =C2=B1 11%      +0.1        0.7=
0 =C2=B1  7%  perf-profile.self.cycles-pp.vfs_read
      0.55 =C2=B1 33%      -0.1        0.46 =C2=B1 33%      +0.0        0.5=
7 =C2=B1 32%  perf-profile.self.cycles-pp.update_process_times
      2.44 =C2=B1  8%      -0.1        2.37 =C2=B1 11%      +0.0        2.4=
8 =C2=B1  9%  perf-profile.self.cycles-pp.cpuidle_enter_state
      0.89 =C2=B1 28%      -0.1        0.82 =C2=B1 30%      +0.2        1.0=
5 =C2=B1 11%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.25 =C2=B1 39%      -0.1        0.20 =C2=B1 31%      +0.1        0.3=
1 =C2=B1 25%  perf-profile.self.cycles-pp.tsc_verify_tsc_adjust
      0.40 =C2=B1 22%      -0.1        0.35 =C2=B1 20%      +0.2        0.5=
9 =C2=B1 11%  perf-profile.self.cycles-pp.security_file_permission
      1.08 =C2=B1 17%      -0.0        1.04 =C2=B1 22%      +0.2        1.2=
5 =C2=B1  6%  perf-profile.self.cycles-pp.pipe_read
      0.57 =C2=B1 18%      -0.0        0.54 =C2=B1 21%      +0.1        0.6=
9 =C2=B1 14%  perf-profile.self.cycles-pp.vfs_write
      0.31 =C2=B1 12%      -0.0        0.28 =C2=B1 13%      -0.0        0.3=
1 =C2=B1 14%  perf-profile.self.cycles-pp.update_sd_lb_stats
      0.46 =C2=B1 45%      -0.0        0.43 =C2=B1 49%      +0.1        0.5=
9 =C2=B1 41%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.09 =C2=B1 27%      -0.0        0.06 =C2=B1 41%      -0.0        0.0=
4 =C2=B1 74%  perf-profile.self.cycles-pp.cpuidle_governor_latency_req
      0.36 =C2=B1 29%      -0.0        0.34 =C2=B1 21%      +0.1        0.4=
7 =C2=B1 16%  perf-profile.self.cycles-pp.do_syscall_64
      0.26 =C2=B1 19%      -0.0        0.24 =C2=B1 29%      -0.1        0.2=
1 =C2=B1  9%  perf-profile.self.cycles-pp.irqtime_account_irq
      0.10 =C2=B1 54%      -0.0        0.08 =C2=B1 54%      -0.1        0.0=
4 =C2=B1 74%  perf-profile.self.cycles-pp.irq_work_needs_cpu
      0.09 =C2=B1 25%      -0.0        0.06 =C2=B1 52%      -0.0        0.0=
7 =C2=B1 42%  perf-profile.self.cycles-pp.tick_nohz_get_sleep_length
      0.36 =C2=B1 13%      -0.0        0.34 =C2=B1 17%      +0.0        0.3=
7 =C2=B1 15%  perf-profile.self.cycles-pp._raw_spin_lock
      0.41 =C2=B1 28%      -0.0        0.38 =C2=B1 41%      -0.1        0.3=
1 =C2=B1 16%  perf-profile.self.cycles-pp.rcu_sched_clock_irq
      0.27 =C2=B1 27%      -0.0        0.24 =C2=B1 18%      +0.0        0.3=
1 =C2=B1 17%  perf-profile.self.cycles-pp.write
      0.13 =C2=B1 32%      -0.0        0.11 =C2=B1 49%      +0.0        0.1=
4 =C2=B1 36%  perf-profile.self.cycles-pp.__softirqentry_text_start
      0.08 =C2=B1 25%      -0.0        0.06 =C2=B1 48%      -0.0        0.0=
7 =C2=B1 44%  perf-profile.self.cycles-pp.tick_sched_timer
      0.27 =C2=B1 48%      -0.0        0.25 =C2=B1 18%      +0.1        0.3=
4 =C2=B1 19%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.12 =C2=B1 24%      -0.0        0.11 =C2=B1 37%      +0.0        0.1=
3 =C2=B1 25%  perf-profile.self.cycles-pp.trigger_load_balance
      0.11 =C2=B1 22%      -0.0        0.10 =C2=B1 37%      -0.0        0.1=
0 =C2=B1 31%  perf-profile.self.cycles-pp.rcu_idle_exit
      0.15 =C2=B1 31%      -0.0        0.13 =C2=B1 44%      -0.0        0.1=
1 =C2=B1 23%  perf-profile.self.cycles-pp.rcu_eqs_exit
      0.10 =C2=B1 21%      -0.0        0.08 =C2=B1 38%      +0.0        0.1=
0 =C2=B1 23%  perf-profile.self.cycles-pp.idle_cpu
      0.03 =C2=B1 96%      -0.0        0.02 =C2=B1142%      +0.0        0.0=
6 =C2=B1 58%  perf-profile.self.cycles-pp.rcu_read_unlock_strict
      0.01 =C2=B1187%      -0.0        0.00            -0.0        0.00    =
    perf-profile.self.cycles-pp.__intel_pmu_disable_all
      0.05 =C2=B1 58%      -0.0        0.03 =C2=B1108%      -0.0        0.0=
1 =C2=B1187%  perf-profile.self.cycles-pp.update_dl_rq_load_avg
      0.15 =C2=B1 20%      -0.0        0.14 =C2=B1 21%      -0.0        0.1=
2 =C2=B1 17%  perf-profile.self.cycles-pp.error_entry
      0.15 =C2=B1 21%      -0.0        0.14 =C2=B1 29%      -0.0        0.1=
2 =C2=B1 28%  perf-profile.self.cycles-pp.__sysvec_apic_timer_interrupt
      0.09 =C2=B1 46%      -0.0        0.08 =C2=B1 40%      +0.0        0.0=
9 =C2=B1 47%  perf-profile.self.cycles-pp.rcu_dynticks_eqs_enter
      0.13 =C2=B1 24%      -0.0        0.12 =C2=B1 22%      -0.0        0.1=
1 =C2=B1 20%  perf-profile.self.cycles-pp.rebalance_domains
      0.01 =C2=B1187%      -0.0        0.00            -0.0        0.00    =
    perf-profile.self.cycles-pp.hrtimer_run_queues
      0.05 =C2=B1 96%      -0.0        0.04 =C2=B1 90%      -0.0        0.0=
1 =C2=B1187%  perf-profile.self.cycles-pp.do_nocb_deferred_wakeup
      0.14 =C2=B1 28%      -0.0        0.13 =C2=B1 28%      +0.0        0.1=
4 =C2=B1 19%  perf-profile.self.cycles-pp.__might_fault
      0.08 =C2=B1 21%      -0.0        0.07 =C2=B1 18%      -0.0        0.0=
6 =C2=B1 45%  perf-profile.self.cycles-pp.hrtimer_next_event_without
      0.32 =C2=B1 18%      -0.0        0.31 =C2=B1 21%      +0.0        0.3=
6 =C2=B1  8%  perf-profile.self.cycles-pp.__intel_pmu_enable_all
      0.13 =C2=B1 21%      -0.0        0.12 =C2=B1 26%      -0.0        0.1=
1 =C2=B1 20%  perf-profile.self.cycles-pp.load_balance
      0.20 =C2=B1 30%      -0.0        0.19 =C2=B1 35%      -0.0        0.1=
5 =C2=B1 28%  perf-profile.self.cycles-pp.perf_mux_hrtimer_handler
      0.08 =C2=B1 62%      -0.0        0.07 =C2=B1 59%      -0.0        0.0=
4 =C2=B1 94%  perf-profile.self.cycles-pp.x86_pmu_disable
      0.11 =C2=B1 29%      -0.0        0.10 =C2=B1 55%      -0.1        0.0=
4 =C2=B1 72%  perf-profile.self.cycles-pp.timerqueue_del
      0.63 =C2=B1 16%      -0.0        0.62 =C2=B1 19%      +0.1        0.7=
3 =C2=B1  8%  perf-profile.self.cycles-pp.native_sched_clock
      0.01 =C2=B1187%      -0.0        0.00 =C2=B1331%      +0.0        0.0=
2 =C2=B1112%  perf-profile.self.cycles-pp.can_stop_idle_tick
      0.27 =C2=B1 11%      -0.0        0.27 =C2=B1 28%      -0.1        0.2=
0 =C2=B1 14%  perf-profile.self.cycles-pp.__hrtimer_run_queues
      0.09 =C2=B1 50%      -0.0        0.09 =C2=B1 20%      +0.0        0.1=
1 =C2=B1 25%  perf-profile.self.cycles-pp.copyout
      0.09 =C2=B1 88%      -0.0        0.08 =C2=B1 78%      -0.1        0.0=
2 =C2=B1112%  perf-profile.self.cycles-pp.irq_work_tick
      0.11 =C2=B1 21%      -0.0        0.10 =C2=B1 23%      -0.0        0.1=
0 =C2=B1 12%  perf-profile.self.cycles-pp._find_next_bit
      0.02 =C2=B1112%      -0.0        0.02 =C2=B1144%      -0.0        0.0=
2 =C2=B1187%  perf-profile.self.cycles-pp.note_gp_changes
      0.01 =C2=B1282%      -0.0        0.00            -0.0        0.00    =
    perf-profile.self.cycles-pp._dl_addr
      0.01 =C2=B1282%      -0.0        0.00            +0.0        0.01 =C2=
=B1282%  perf-profile.self.cycles-pp.tick_nohz_idle_retain_tick
      0.01 =C2=B1282%      -0.0        0.00            +0.0        0.03 =C2=
=B1119%  perf-profile.self.cycles-pp.cpuidle_enter
      0.06 =C2=B1 67%      -0.0        0.06 =C2=B1 63%      -0.0        0.0=
2 =C2=B1190%  perf-profile.self.cycles-pp.rcu_eqs_enter
      0.24 =C2=B1 16%      -0.0        0.23 =C2=B1 18%      +0.1        0.2=
9 =C2=B1 16%  perf-profile.self.cycles-pp.hrtimer_interrupt
      0.10 =C2=B1 22%      -0.0        0.09 =C2=B1 49%      -0.0        0.0=
8 =C2=B1 24%  perf-profile.self.cycles-pp.update_blocked_averages
      0.01 =C2=B1188%      -0.0        0.01 =C2=B1223%      +0.0        0.0=
1 =C2=B1188%  perf-profile.self.cycles-pp.find_busiest_group
      0.01 =C2=B1282%      -0.0        0.00 =C2=B1331%      -0.0        0.0=
0        perf-profile.self.cycles-pp.ksoftirqd_running
      0.07 =C2=B1 53%      -0.0        0.07 =C2=B1 65%      -0.0        0.0=
6 =C2=B1 42%  perf-profile.self.cycles-pp.get_cpu_device
      0.15 =C2=B1 31%      -0.0        0.15 =C2=B1 37%      -0.1        0.0=
8 =C2=B1 18%  perf-profile.self.cycles-pp.sysvec_apic_timer_interrupt
      0.15 =C2=B1 30%      -0.0        0.15 =C2=B1 24%      +0.0        0.2=
0 =C2=B1 18%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.01 =C2=B1282%      -0.0        0.00 =C2=B1331%      -0.0        0.0=
0        perf-profile.self.cycles-pp.timer_clear_idle
      0.01 =C2=B1187%      -0.0        0.01 =C2=B1227%      +0.0        0.0=
2 =C2=B1144%  perf-profile.self.cycles-pp.update_group_capacity
      0.01 =C2=B1282%      -0.0        0.01 =C2=B1331%      +0.0        0.0=
1 =C2=B1187%  perf-profile.self.cycles-pp.next_uptodate_page
      0.01 =C2=B1190%      -0.0        0.01 =C2=B1173%      -0.0        0.0=
0        perf-profile.self.cycles-pp.intel_pmu_disable_all
      0.12 =C2=B1 45%      -0.0        0.12 =C2=B1 39%      -0.0        0.0=
9 =C2=B1 21%  perf-profile.self.cycles-pp.get_next_timer_interrupt
      0.01 =C2=B1282%      -0.0        0.01 =C2=B1331%      -0.0        0.0=
0        perf-profile.self.cycles-pp.tick_nohz_idle_got_tick
      0.00            +0.0        0.00            +0.0        0.01 =C2=B118=
7%  perf-profile.self.cycles-pp.__wake_up_sync_key
      0.02 =C2=B1145%      +0.0        0.02 =C2=B1119%      +0.0        0.0=
4 =C2=B1 72%  perf-profile.self.cycles-pp.make_kuid
      0.02 =C2=B1197%      +0.0        0.02 =C2=B1146%      +0.0        0.0=
4 =C2=B1 74%  perf-profile.self.cycles-pp.profile_tick
      0.07 =C2=B1 69%      +0.0        0.08 =C2=B1 26%      -0.1        0.0=
2 =C2=B1150%  perf-profile.self.cycles-pp.hrtimer_update_next_event
      0.04 =C2=B1 92%      +0.0        0.04 =C2=B1 85%      -0.0        0.0=
0        perf-profile.self.cycles-pp.restore_regs_and_return_to_kernel
      0.06 =C2=B1 96%      +0.0        0.06 =C2=B1 76%      -0.0        0.0=
1 =C2=B1188%  perf-profile.self.cycles-pp.tick_check_broadcast_expired
      0.18 =C2=B1 22%      +0.0        0.18 =C2=B1 20%      +0.0        0.2=
1 =C2=B1 15%  perf-profile.self.cycles-pp.rw_verify_area
      0.01 =C2=B1190%      +0.0        0.02 =C2=B1179%      +0.0        0.0=
3 =C2=B1 91%  perf-profile.self.cycles-pp.__x64_sys_write
      0.09 =C2=B1 62%      +0.0        0.10 =C2=B1 46%      -0.1        0.0=
3 =C2=B1114%  perf-profile.self.cycles-pp.irqtime_account_process_tick
      0.10 =C2=B1 29%      +0.0        0.10 =C2=B1 23%      -0.0        0.0=
8 =C2=B1 22%  perf-profile.self.cycles-pp.irq_exit_rcu
      0.32 =C2=B1 12%      +0.0        0.32 =C2=B1 16%      +0.0        0.3=
6 =C2=B1 16%  perf-profile.self.cycles-pp.arch_scale_freq_tick
      0.17 =C2=B1 30%      +0.0        0.17 =C2=B1 41%      -0.1        0.0=
9 =C2=B1 23%  perf-profile.self.cycles-pp.timerqueue_add
      0.31 =C2=B1 25%      +0.0        0.32 =C2=B1 17%      +0.1        0.3=
7 =C2=B1 16%  perf-profile.self.cycles-pp.current_time
      0.01 =C2=B1188%      +0.0        0.02 =C2=B1175%      -0.0        0.0=
1 =C2=B1282%  perf-profile.self.cycles-pp.account_process_tick
      0.10 =C2=B1 19%      +0.0        0.11 =C2=B1 36%      -0.0        0.1=
0 =C2=B1 32%  perf-profile.self.cycles-pp.sched_clock_cpu
      0.00            +0.0        0.00 =C2=B1331%      +0.0        0.00    =
    perf-profile.self.cycles-pp.hrtimer_get_next_event
      0.00            +0.0        0.00 =C2=B1331%      +0.0        0.00    =
    perf-profile.self.cycles-pp.__note_gp_changes
      0.00            +0.0        0.00 =C2=B1331%      +0.0        0.00    =
    perf-profile.self.cycles-pp.run_rebalance_domains
      0.00            +0.0        0.00 =C2=B1331%      +0.0        0.00    =
    perf-profile.self.cycles-pp.enqueue_hrtimer
      0.00            +0.0        0.00 =C2=B1331%      +0.0        0.00    =
    perf-profile.self.cycles-pp.rcu_segcblist_ready_cbs
      0.00            +0.0        0.00 =C2=B1331%      +0.0        0.01 =C2=
=B1282%  perf-profile.self.cycles-pp.fold_vm_numa_events
      0.00            +0.0        0.00 =C2=B1331%      +0.0        0.03 =C2=
=B1114%  perf-profile.self.cycles-pp.timekeeping_advance
      0.16 =C2=B1 31%      +0.0        0.16 =C2=B1 33%      -0.1        0.0=
8 =C2=B1 41%  perf-profile.self.cycles-pp.scheduler_tick
      0.02 =C2=B1144%      +0.0        0.02 =C2=B1144%      -0.0        0.0=
0        perf-profile.self.cycles-pp.rcu_needs_cpu
      0.02 =C2=B1142%      +0.0        0.02 =C2=B1145%      -0.0        0.0=
1 =C2=B1187%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.18 =C2=B1 12%      +0.0        0.18 =C2=B1 22%      +0.0        0.2=
1 =C2=B1 11%  perf-profile.self.cycles-pp.rcu_all_qs
      0.01 =C2=B1282%      +0.0        0.01 =C2=B1230%      -0.0        0.0=
0        perf-profile.self.cycles-pp.perf_ctx_unlock
      0.02 =C2=B1112%      +0.0        0.03 =C2=B1103%      -0.0        0.0=
1 =C2=B1282%  perf-profile.self.cycles-pp.hrtimer_forward
      0.00            +0.0        0.01 =C2=B1331%      +0.0        0.00    =
    perf-profile.self.cycles-pp.cpuidle_get_cpu_driver
      0.28 =C2=B1 27%      +0.0        0.28 =C2=B1 18%      -0.0        0.2=
4 =C2=B1 13%  perf-profile.self.cycles-pp.update_irq_load_avg
      0.01 =C2=B1187%      +0.0        0.02 =C2=B1223%      -0.0        0.0=
0        perf-profile.self.cycles-pp.rcu_core
      0.08 =C2=B1 24%      +0.0        0.08 =C2=B1 27%      -0.0        0.0=
6 =C2=B1 58%  perf-profile.self.cycles-pp.apparmor_file_permission
      0.08 =C2=B1 41%      +0.0        0.09 =C2=B1 23%      -0.0        0.0=
7 =C2=B1 54%  perf-profile.self.cycles-pp.tick_nohz_tick_stopped
      0.04 =C2=B1 92%      +0.0        0.05 =C2=B1 95%      -0.0        0.0=
1 =C2=B1282%  perf-profile.self.cycles-pp.pm_qos_read_value
      0.43 =C2=B1 22%      +0.0        0.43 =C2=B1 14%      +0.1        0.5=
2 =C2=B1 13%  perf-profile.self.cycles-pp.new_sync_read
      0.03 =C2=B1114%      +0.0        0.04 =C2=B1 86%      +0.0        0.0=
4 =C2=B1 72%  perf-profile.self.cycles-pp.kill_fasync
      0.13 =C2=B1 76%      +0.0        0.14 =C2=B1 50%      -0.1        0.0=
3 =C2=B1113%  perf-profile.self.cycles-pp.native_apic_mem_write
      0.08 =C2=B1 41%      +0.0        0.09 =C2=B1 36%      +0.0        0.1=
2 =C2=B1 20%  perf-profile.self.cycles-pp.copyin
      0.03 =C2=B1115%      +0.0        0.04 =C2=B1 73%      -0.0        0.0=
1 =C2=B1187%  perf-profile.self.cycles-pp.tick_sched_handle
      0.00            +0.0        0.01 =C2=B1223%      +0.0        0.00    =
    perf-profile.self.cycles-pp.io_serial_out
      0.00            +0.0        0.01 =C2=B1223%      +0.0        0.00    =
    perf-profile.self.cycles-pp.error_return
      0.18 =C2=B1 30%      +0.0        0.18 =C2=B1 34%      +0.0        0.1=
9 =C2=B1 25%  perf-profile.self.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.01 =C2=B1282%      +0.0        0.01 =C2=B1174%      -0.0        0.0=
0        perf-profile.self.cycles-pp.rcu_nocb_flush_deferred_wakeup
      0.02 =C2=B1143%      +0.0        0.03 =C2=B1101%      +0.0        0.0=
6 =C2=B1 56%  perf-profile.self.cycles-pp.irq_enter_rcu
      0.02 =C2=B1142%      +0.0        0.03 =C2=B1122%      -0.0        0.0=
0        perf-profile.self.cycles-pp.leave_mm
      0.05 =C2=B1 95%      +0.0        0.06 =C2=B1 80%      -0.1        0.0=
0        perf-profile.self.cycles-pp.irqentry_enter
      0.02 =C2=B1143%      +0.0        0.03 =C2=B1101%      -0.0        0.0=
0        perf-profile.self.cycles-pp.tick_nohz_irq_exit
      0.10 =C2=B1 56%      +0.0        0.11 =C2=B1 47%      -0.1        0.0=
3 =C2=B1 91%  perf-profile.self.cycles-pp.rb_insert_color
      0.01 =C2=B1188%      +0.0        0.02 =C2=B1119%      -0.0        0.0=
0        perf-profile.self.cycles-pp.rcu_irq_enter
      0.24 =C2=B1 18%      +0.0        0.25 =C2=B1 16%      -0.0        0.2=
4 =C2=B1 17%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.07 =C2=B1 87%      +0.0        0.08 =C2=B1 72%      -0.0        0.0=
3 =C2=B1118%  perf-profile.self.cycles-pp.__remove_hrtimer
      0.13 =C2=B1 31%      +0.0        0.15 =C2=B1 31%      -0.0        0.0=
9 =C2=B1 20%  perf-profile.self.cycles-pp.__hrtimer_get_next_event
      0.12 =C2=B1 18%      +0.0        0.14 =C2=B1 20%      +0.0        0.1=
5 =C2=B1 20%  perf-profile.self.cycles-pp.call_cpuidle
      0.45 =C2=B1 21%      +0.0        0.46 =C2=B1 18%      +0.1        0.5=
3 =C2=B1 12%  perf-profile.self.cycles-pp.new_sync_write
      0.09 =C2=B1 25%      +0.0        0.10 =C2=B1 24%      -0.0        0.0=
9 =C2=B1 47%  perf-profile.self.cycles-pp.clockevents_program_event
      0.02 =C2=B1142%      +0.0        0.03 =C2=B1105%      +0.0        0.0=
5 =C2=B1 56%  perf-profile.self.cycles-pp.make_kgid
      0.05 =C2=B1 96%      +0.0        0.06 =C2=B1 57%      -0.0        0.0=
1 =C2=B1187%  perf-profile.self.cycles-pp.menu_reflect
      0.26 =C2=B1 18%      +0.0        0.27 =C2=B1 17%      +0.1        0.3=
2 =C2=B1 17%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.35 =C2=B1 23%      +0.0        0.36 =C2=B1 20%      -0.1        0.2=
7 =C2=B1 14%  perf-profile.self.cycles-pp.__hrtimer_next_event_base
      0.05 =C2=B1 89%      +0.0        0.06 =C2=B1 83%      -0.0        0.0=
1 =C2=B1190%  perf-profile.self.cycles-pp.cpuidle_not_available
      0.00            +0.0        0.01 =C2=B1174%      +0.0        0.00    =
    perf-profile.self.cycles-pp.rcu_is_cpu_rrupt_from_idle
      0.03 =C2=B1124%      +0.0        0.05 =C2=B1 77%      -0.0        0.0=
0        perf-profile.self.cycles-pp.rcu_nmi_enter
      0.16 =C2=B1 38%      +0.0        0.17 =C2=B1 20%      -0.1        0.1=
0 =C2=B1 21%  perf-profile.self.cycles-pp.rb_next
      0.03 =C2=B1117%      +0.0        0.05 =C2=B1 87%      -0.0        0.0=
0        perf-profile.self.cycles-pp.check_tsc_unstable
      0.10 =C2=B1 24%      +0.0        0.12 =C2=B1 25%      -0.0        0.0=
8 =C2=B1 45%  perf-profile.self.cycles-pp.rcu_dynticks_eqs_exit
      0.02 =C2=B1114%      +0.0        0.04 =C2=B1 73%      -0.0        0.0=
0        perf-profile.self.cycles-pp.task_tick_idle
      0.07 =C2=B1 85%      +0.0        0.09 =C2=B1 46%      -0.1        0.0=
2 =C2=B1142%  perf-profile.self.cycles-pp.update_ts_time_stats
      0.00            +0.0        0.02 =C2=B1195%      +0.0        0.02 =C2=
=B1141%  perf-profile.self.cycles-pp.poll_idle
      0.02 =C2=B1148%      +0.0        0.04 =C2=B1 89%      -0.0        0.0=
0        perf-profile.self.cycles-pp.cpuidle_reflect
      0.12 =C2=B1 32%      +0.0        0.14 =C2=B1 21%      +0.0        0.1=
4 =C2=B1 25%  perf-profile.self.cycles-pp.iov_iter_init
      0.00            +0.0        0.02 =C2=B1143%      +0.0        0.03 =C2=
=B1156%  perf-profile.self.cycles-pp.main
      0.42 =C2=B1 16%      +0.0        0.44 =C2=B1 16%      -0.0        0.3=
9 =C2=B1  9%  perf-profile.self.cycles-pp.do_idle
      0.05 =C2=B1 76%      +0.0        0.07 =C2=B1 39%      +0.0        0.0=
5 =C2=B1 57%  perf-profile.self.cycles-pp.update_rt_rq_load_avg
      0.00            +0.0        0.02 =C2=B1145%      +0.0        0.01 =C2=
=B1282%  perf-profile.self.cycles-pp.__x64_sys_read
      0.08 =C2=B1 33%      +0.0        0.10 =C2=B1 24%      -0.0        0.0=
6 =C2=B1 56%  perf-profile.self.cycles-pp.update_rq_clock
      0.01 =C2=B1282%      +0.0        0.03 =C2=B1103%      -0.0        0.0=
1 =C2=B1282%  perf-profile.self.cycles-pp.sched_idle_set_state
      0.13 =C2=B1 70%      +0.0        0.15 =C2=B1 66%      -0.1        0.0=
3 =C2=B1 90%  perf-profile.self.cycles-pp.memcpy_toio
      0.21 =C2=B1 29%      +0.0        0.23 =C2=B1 24%      +0.1        0.3=
0 =C2=B1 24%  perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
      0.69 =C2=B1 22%      +0.0        0.71 =C2=B1 21%      +0.2        0.8=
8 =C2=B1 14%  perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.09 =C2=B1 28%      +0.0        0.11 =C2=B1 47%      -0.0        0.0=
7 =C2=B1 47%  perf-profile.self.cycles-pp.rb_erase
      0.01 =C2=B1188%      +0.0        0.04 =C2=B1 86%      +0.0        0.0=
4 =C2=B1 91%  perf-profile.self.cycles-pp.rcu_nmi_exit
      0.13 =C2=B1 57%      +0.0        0.15 =C2=B1 46%      -0.1        0.0=
2 =C2=B1197%  perf-profile.self.cycles-pp.perf_event_task_tick
      0.15 =C2=B1 74%      +0.0        0.18 =C2=B1 48%      -0.1        0.0=
4 =C2=B1 72%  perf-profile.self.cycles-pp.tick_check_oneshot_broadcast_this=
_cpu
      0.71 =C2=B1 25%      +0.0        0.74 =C2=B1 16%      +0.2        0.8=
7 =C2=B1 13%  perf-profile.self.cycles-pp.__might_sleep
      0.11 =C2=B1 79%      +0.0        0.14 =C2=B1 52%      -0.1        0.0=
3 =C2=B1 91%  perf-profile.self.cycles-pp.delay_tsc
      0.07 =C2=B1 62%      +0.0        0.10 =C2=B1 19%      -0.0        0.0=
6 =C2=B1 39%  perf-profile.self.cycles-pp.tick_irq_enter
      0.16 =C2=B1 56%      +0.0        0.19 =C2=B1 41%      -0.1        0.0=
9 =C2=B1 30%  perf-profile.self.cycles-pp.nr_iowait_cpu
      0.62 =C2=B1 22%      +0.0        0.65 =C2=B1 14%      +0.1        0.7=
6 =C2=B1 12%  perf-profile.self.cycles-pp.copy_page_from_iter
      0.24 =C2=B1 20%      +0.0        0.27 =C2=B1 24%      +0.1        0.3=
2 =C2=B1 12%  perf-profile.self.cycles-pp.read
      0.22 =C2=B1 20%      +0.0        0.26 =C2=B1 14%      +0.0        0.2=
7 =C2=B1 21%  perf-profile.self.cycles-pp.atime_needs_update
      0.67 =C2=B1 17%      +0.0        0.70 =C2=B1 13%      +0.2        0.8=
2 =C2=B1 14%  perf-profile.self.cycles-pp.copy_page_to_iter
      0.05 =C2=B1 75%      +0.0        0.08 =C2=B1 24%      +0.0        0.0=
6 =C2=B1 56%  perf-profile.self.cycles-pp.tick_program_event
      0.38 =C2=B1 23%      +0.0        0.42 =C2=B1 18%      +0.1        0.4=
9 =C2=B1 13%  perf-profile.self.cycles-pp.map_id_range_down
      0.38 =C2=B1 27%      +0.0        0.42 =C2=B1 20%      +0.1        0.5=
2 =C2=B1 12%  perf-profile.self.cycles-pp.aa_file_perm
      0.32 =C2=B1 25%      +0.0        0.36 =C2=B1 21%      +0.1        0.4=
0 =C2=B1 12%  perf-profile.self.cycles-pp.__fdget_pos
      0.25 =C2=B1 26%      +0.0        0.29 =C2=B1 18%      +0.1        0.3=
2 =C2=B1 12%  perf-profile.self.cycles-pp.timestamp_truncate
      0.24 =C2=B1 18%      +0.0        0.28 =C2=B1 21%      +0.1        0.3=
4 =C2=B1 16%  perf-profile.self.cycles-pp.file_update_time
      0.82 =C2=B1 21%      +0.0        0.86 =C2=B1 15%      +0.2        0.9=
9 =C2=B1 12%  perf-profile.self.cycles-pp.___might_sleep
      0.24 =C2=B1 25%      +0.0        0.28 =C2=B1 24%      +0.1        0.3=
1 =C2=B1 16%  perf-profile.self.cycles-pp.__wake_up_common_lock
      1.03 =C2=B1 13%      +0.0        1.07 =C2=B1 13%      +0.2        1.2=
7 =C2=B1  5%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.25 =C2=B1 23%      +0.0        0.29 =C2=B1 17%      +0.1        0.3=
0 =C2=B1 21%  perf-profile.self.cycles-pp.__cond_resched
      0.19 =C2=B1 30%      +0.0        0.24 =C2=B1 18%      +0.1        0.2=
6 =C2=B1 15%  perf-profile.self.cycles-pp.__wake_up_common
      0.30 =C2=B1 25%      +0.0        0.34 =C2=B1 16%      +0.1        0.3=
9 =C2=B1 21%  perf-profile.self.cycles-pp.ksys_read
      1.43 =C2=B1 21%      +0.0        1.48 =C2=B1 15%      +0.4        1.8=
4 =C2=B1  9%  perf-profile.self.cycles-pp.pipe_write
      0.29 =C2=B1 19%      +0.0        0.34 =C2=B1 17%      +0.1        0.3=
5 =C2=B1 11%  perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.14 =C2=B1 21%      +0.1        0.19 =C2=B1 18%      +0.0        0.1=
8 =C2=B1 20%  perf-profile.self.cycles-pp.touch_atime
      0.46 =C2=B1 65%      +0.1        0.52 =C2=B1 48%      -0.3        0.1=
6 =C2=B1 23%  perf-profile.self.cycles-pp.io_serial_in
      0.17 =C2=B1 69%      +0.1        0.24 =C2=B1 52%      -0.1        0.0=
5 =C2=B1 73%  perf-profile.self.cycles-pp.run_posix_cpu_timers
      0.44 =C2=B1 21%      +0.1        0.51 =C2=B1 18%      +0.2        0.6=
2 =C2=B1 20%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.95 =C2=B1 19%      +0.1        1.03 =C2=B1 16%      +0.2        1.1=
4 =C2=B1  8%  perf-profile.self.cycles-pp.mutex_unlock
      0.29 =C2=B1 17%      +0.1        0.37 =C2=B1 18%      +0.1        0.3=
8 =C2=B1 17%  perf-profile.self.cycles-pp.ksys_write
      0.67 =C2=B1 21%      +0.1        0.77 =C2=B1 14%      +0.3        0.9=
7 =C2=B1 16%  perf-profile.self.cycles-pp.common_file_perm
      0.86 =C2=B1 19%      +0.1        0.98 =C2=B1 14%      +0.2        1.0=
8 =C2=B1 12%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.14 =C2=B1 18%      +0.1        1.26 =C2=B1 13%      +0.3        1.4=
1 =C2=B1  6%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      1.13 =C2=B1 20%      +0.1        1.26 =C2=B1 14%      +0.3        1.4=
4 =C2=B1 15%  perf-profile.self.cycles-pp.mutex_lock
      1.61 =C2=B1 17%      +0.2        1.77 =C2=B1 13%      +0.4        1.9=
7 =C2=B1  8%  perf-profile.self.cycles-pp.__fget_light
      1.37 =C2=B1 19%      +0.2        1.54 =C2=B1 15%      +0.3        1.7=
2 =C2=B1 11%  perf-profile.self.cycles-pp.__entry_text_start
      2.35 =C2=B1 17%      +0.3        2.67 =C2=B1 15%      +0.6        2.9=
6 =C2=B1  9%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      3.79 =C2=B1 20%      +0.4        4.21 =C2=B1 14%      +0.8        4.6=
0 =C2=B1 10%  perf-profile.self.cycles-pp.copy_user_enhanced_fast_string
     40.82 =C2=B1 12%      +0.7       41.56 =C2=B1  9%      -5.8       35.0=
7 =C2=B1 10%  perf-profile.self.cycles-pp.intel_idle
    872.33 =C2=B1  2%      -2.7%     848.42            -2.6%     849.22 =C2=
=B1  2%  softirqs.BLOCK
      5.22 =C2=B1170%    +251.1%      18.33 =C2=B1 93%    +114.9%      11.2=
2 =C2=B1116%  softirqs.CPU0.BLOCK
      1.00            +0.0%       1.00            +0.0%       1.00        s=
oftirqs.CPU0.HI
    497.67 =C2=B1256%     -89.2%      53.92 =C2=B1302%     -99.1%       4.4=
4 =C2=B1 98%  softirqs.CPU0.NET_RX
      9.33 =C2=B1170%     -26.8%       6.83 =C2=B1213%     +41.7%      13.2=
2 =C2=B1137%  softirqs.CPU0.NET_TX
     21651 =C2=B1 19%     +13.7%      24626 =C2=B1 46%      +7.3%      2322=
7 =C2=B1 20%  softirqs.CPU0.RCU
     54004 =C2=B1  5%      +2.1%      55129 =C2=B1  2%      +2.9%      5558=
6 =C2=B1  3%  softirqs.CPU0.SCHED
    113.33            +0.7%     114.17 =C2=B1  3%      -0.3%     113.00    =
    softirqs.CPU0.TASKLET
      1472 =C2=B1  3%     +10.2%       1623 =C2=B1 14%      +0.8%       148=
4 =C2=B1  3%  softirqs.CPU0.TIMER
      4.33 =C2=B1200%    +413.5%      22.25 =C2=B1125%    +338.5%      19.0=
0 =C2=B1106%  softirqs.CPU1.BLOCK
      1538 =C2=B1274%     -99.9%       1.83 =C2=B1283%     -99.6%       5.5=
6 =C2=B1150%  softirqs.CPU1.NET_RX
      4.33 =C2=B1274%     -94.2%       0.25 =C2=B1238%     -92.3%       0.3=
3 =C2=B1282%  softirqs.CPU1.NET_TX
     21072 =C2=B1 21%     +10.8%      23348 =C2=B1 52%      +4.3%      2197=
6 =C2=B1 19%  softirqs.CPU1.RCU
     51548 =C2=B1  4%      -5.5%      48735 =C2=B1 21%      +2.0%      5259=
8 =C2=B1 13%  softirqs.CPU1.SCHED
      0.00       +1.7e+101%       0.17 =C2=B1223% +1.1e+101%       0.11 =C2=
=B1282%  softirqs.CPU1.TASKLET
    538.44 =C2=B1119%     -71.1%     155.83 =C2=B1162%     -35.4%     347.7=
8 =C2=B1165%  softirqs.CPU1.TIMER
     26.89 =C2=B1131%     +17.1%      31.50 =C2=B1240%     -27.7%      19.4=
4 =C2=B1123%  softirqs.CPU10.BLOCK
      1.00            +0.0%       1.00            +0.0%       1.00        s=
oftirqs.CPU10.HI
    108.33 =C2=B1157%     -90.5%      10.33 =C2=B1213%     -29.2%      76.6=
7 =C2=B1276%  softirqs.CPU10.NET_RX
      0.11 =C2=B1282%     -25.0%       0.08 =C2=B1331%    +100.0%       0.2=
2 =C2=B1187%  softirqs.CPU10.NET_TX
     20571 =C2=B1 23%      +6.2%      21838 =C2=B1 41%      -6.1%      1931=
3 =C2=B1 23%  softirqs.CPU10.RCU
     50168 =C2=B1  2%      -4.6%      47875 =C2=B1 17%      -2.1%      4911=
5 =C2=B1 11%  softirqs.CPU10.SCHED
    646.78            +0.1%     647.50            +0.1%     647.11        s=
oftirqs.CPU10.TASKLET
    266.67 =C2=B1159%    +758.7%       2289 =C2=B1318%    +715.0%       217=
3 =C2=B1269%  softirqs.CPU10.TIMER
      1.00 =C2=B1221%   +1383.3%      14.83 =C2=B1217%   +1777.8%      18.7=
8 =C2=B1172%  softirqs.CPU11.BLOCK
     33.11 =C2=B1203%      -9.1%      30.08 =C2=B1318%     -77.2%       7.5=
6 =C2=B1207%  softirqs.CPU11.NET_RX
      0.00       +1.7e+101%       0.17 =C2=B1331% +1.1e+101%       0.11 =C2=
=B1282%  softirqs.CPU11.NET_TX
     20971 =C2=B1 23%     +12.6%      23603 =C2=B1 47%      +4.7%      2196=
4 =C2=B1 19%  softirqs.CPU11.RCU
     50429            +2.4%      51637 =C2=B1  3%      -0.0%      50420 =C2=
=B1  3%  softirqs.CPU11.SCHED
      2.33 =C2=B1 28%     -17.9%       1.92 =C2=B1 14%     +85.7%       4.3=
3 =C2=B1152%  softirqs.CPU11.TASKLET
    178.44 =C2=B1137%      -5.6%     168.50 =C2=B1177%     -39.4%     108.2=
2 =C2=B1 75%  softirqs.CPU11.TIMER
      3.89 =C2=B1141%      +7.1%       4.17 =C2=B1276%     -91.4%       0.3=
3 =C2=B1282%  softirqs.CPU12.BLOCK
      4.00 =C2=B1189%   +6756.2%     274.25 =C2=B1330%  +1.8e+05%       706=
0 =C2=B1270%  softirqs.CPU12.NET_RX
      0.44 =C2=B1111%     -43.8%       0.25 =C2=B1173%     -25.0%       0.3=
3 =C2=B1199%  softirqs.CPU12.NET_TX
     19443 =C2=B1 28%     +15.3%      22422 =C2=B1 53%      +6.5%      2070=
1 =C2=B1 23%  softirqs.CPU12.RCU
     49929 =C2=B1  3%      +0.5%      50185 =C2=B1 12%      +1.8%      5083=
8 =C2=B1  3%  softirqs.CPU12.SCHED
      3.78 =C2=B1118%     -40.4%       2.25 =C2=B1 26%      +5.9%       4.0=
0 =C2=B1141%  softirqs.CPU12.TASKLET
    889.89 =C2=B1262%     -83.3%     148.17 =C2=B1125%     -89.6%      92.8=
9 =C2=B1108%  softirqs.CPU12.TIMER
     17.44 =C2=B1241%      -4.0%      16.75 =C2=B1225%     -93.0%       1.2=
2 =C2=B1255%  softirqs.CPU13.BLOCK
      3504 =C2=B1277%     -99.3%      24.42 =C2=B1296%     -99.1%      32.0=
0 =C2=B1243%  softirqs.CPU13.NET_RX
      0.56 =C2=B1123%     -10.0%       0.50 =C2=B1129%    +100.0%       1.1=
1 =C2=B1 66%  softirqs.CPU13.NET_TX
     20901 =C2=B1 22%     +10.4%      23076 =C2=B1 50%      -1.5%      2058=
2 =C2=B1 20%  softirqs.CPU13.RCU
     45582 =C2=B1 16%     +12.5%      51261 =C2=B1  4%     +12.1%      5109=
9        softirqs.CPU13.SCHED
      3.78 =C2=B1144%     -36.0%       2.42 =C2=B1 61%     -38.2%       2.3=
3 =C2=B1 63%  softirqs.CPU13.TASKLET
     79.33 =C2=B1 56%    +471.4%     453.33 =C2=B1137%    +185.9%     226.7=
8 =C2=B1151%  softirqs.CPU13.TIMER
     14.67 =C2=B1275%     -14.8%      12.50 =C2=B1166%     -93.9%       0.8=
9 =C2=B1282%  softirqs.CPU14.BLOCK
     81.33 =C2=B1193%   +2217.8%       1885 =C2=B1329%     -78.1%      17.7=
8 =C2=B1266%  softirqs.CPU14.NET_RX
      0.56 =C2=B1 89%     -10.0%       0.50 =C2=B1129%     +40.0%       0.7=
8 =C2=B1 80%  softirqs.CPU14.NET_TX
     20560 =C2=B1 23%     +16.1%      23879 =C2=B1 52%      +8.7%      2234=
3 =C2=B1 18%  softirqs.CPU14.RCU
     50616            -5.1%      48032 =C2=B1 17%      +1.1%      51162    =
    softirqs.CPU14.SCHED
      3.89 =C2=B1156%     +26.4%       4.92 =C2=B1133%     -42.9%       2.2=
2 =C2=B1 28%  softirqs.CPU14.TASKLET
    647.44 =C2=B1185%     -72.8%     176.08 =C2=B1146%     -62.6%     241.8=
9 =C2=B1166%  softirqs.CPU14.TIMER
     16.67 =C2=B1222%     -21.5%      13.08 =C2=B1266%     -17.3%      13.7=
8 =C2=B1277%  softirqs.CPU15.BLOCK
     17.56 =C2=B1272%     +62.3%      28.50 =C2=B1216%    +340.5%      77.3=
3 =C2=B1212%  softirqs.CPU15.NET_RX
      0.33 =C2=B1141%      +0.0%       0.33 =C2=B1141%     +66.7%       0.5=
6 =C2=B1172%  softirqs.CPU15.NET_TX
     19950 =C2=B1 27%     +15.0%      22933 =C2=B1 50%      +8.3%      2160=
0 =C2=B1 23%  softirqs.CPU15.RCU
     50579 =C2=B1  2%      -0.1%      50535 =C2=B1  7%      +1.0%      5110=
3        softirqs.CPU15.SCHED
      1.56 =C2=B1 53%     +55.4%       2.42 =C2=B1 85%      +0.0%       1.5=
6 =C2=B1 53%  softirqs.CPU15.TASKLET
      1753 =C2=B1267%     -92.0%     140.42 =C2=B1164%     -92.1%     139.2=
2 =C2=B1192%  softirqs.CPU15.TIMER
     60.11 =C2=B1175%      +8.8%      65.42 =C2=B1168%     -66.9%      19.8=
9 =C2=B1180%  softirqs.CPU16.BLOCK
      2.89 =C2=B1258%     +18.3%       3.42 =C2=B1140%   +3023.1%      90.2=
2 =C2=B1243%  softirqs.CPU16.NET_RX
      0.44 =C2=B1215%      -6.2%       0.42 =C2=B1118%      +0.0%       0.4=
4 =C2=B1154%  softirqs.CPU16.NET_TX
     18033 =C2=B1 23%     +11.8%      20167 =C2=B1 50%      +3.4%      1864=
2 =C2=B1 19%  softirqs.CPU16.RCU
     48483 =C2=B1 15%      +4.0%      50422 =C2=B1 10%      -4.3%      4639=
5 =C2=B1 20%  softirqs.CPU16.SCHED
      1.22 =C2=B1 92%     +63.6%       2.00 =C2=B1 73%      +9.1%       1.3=
3 =C2=B1 93%  softirqs.CPU16.TASKLET
    587.89 =C2=B1228%     +78.7%       1050 =C2=B1245%     -85.1%      87.6=
7 =C2=B1119%  softirqs.CPU16.TIMER
     46.89 =C2=B1184%     +65.8%      77.75 =C2=B1 94%     +16.4%      54.5=
6 =C2=B1150%  softirqs.CPU17.BLOCK
     10.89 =C2=B1162%    +641.6%      80.75 =C2=B1325%     +54.1%      16.7=
8 =C2=B1158%  softirqs.CPU17.NET_RX
      0.89 =C2=B1134%     -71.9%       0.25 =C2=B1173%     +25.0%       1.1=
1 =C2=B1107%  softirqs.CPU17.NET_TX
     17551 =C2=B1 22%     +17.2%      20564 =C2=B1 53%      +3.3%      1813=
0 =C2=B1 23%  softirqs.CPU17.RCU
     47778 =C2=B1 14%      +4.4%      49870 =C2=B1 15%      +7.5%      5136=
9 =C2=B1 21%  softirqs.CPU17.SCHED
      0.56 =C2=B1149%    +125.0%       1.25 =C2=B1198%     +80.0%       1.0=
0 =C2=B1188%  softirqs.CPU17.TASKLET
    373.33 =C2=B1213%     -66.0%     126.75 =C2=B1194%     -87.9%      45.3=
3 =C2=B1 58%  softirqs.CPU17.TIMER
     71.56 =C2=B1112%      +9.0%      78.00 =C2=B1113%     -49.1%      36.4=
4 =C2=B1164%  softirqs.CPU18.BLOCK
     12.22 =C2=B1262%     +51.4%      18.50 =C2=B1293%    +220.0%      39.1=
1 =C2=B1270%  softirqs.CPU18.NET_RX
      0.78 =C2=B1169%    +339.3%       3.42 =C2=B1314%     -42.9%       0.4=
4 =C2=B1154%  softirqs.CPU18.NET_TX
     17352 =C2=B1 20%     +10.6%      19187 =C2=B1 51%      +0.8%      1748=
8 =C2=B1 22%  softirqs.CPU18.RCU
     47274 =C2=B1 19%      +6.9%      50542 =C2=B1  6%     +15.1%      5443=
1 =C2=B1 28%  softirqs.CPU18.SCHED
      0.89 =C2=B1171%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU18.TASKLET
    301.00 =C2=B1198%     -25.9%     223.08 =C2=B1194%     +77.5%     534.3=
3 =C2=B1230%  softirqs.CPU18.TIMER
     29.22 =C2=B1224%     +30.9%      38.25 =C2=B1220%     +27.8%      37.3=
3 =C2=B1178%  softirqs.CPU19.BLOCK
     38.22 =C2=B1272%   +9118.2%       3523 =C2=B1331%     -87.5%       4.7=
8 =C2=B1166%  softirqs.CPU19.NET_RX
      0.56 =C2=B1191%     +50.0%       0.83 =C2=B1128%     -60.0%       0.2=
2 =C2=B1187%  softirqs.CPU19.NET_TX
     17525 =C2=B1 23%     +12.2%      19668 =C2=B1 51%      +1.3%      1774=
8 =C2=B1 24%  softirqs.CPU19.RCU
     49855 =C2=B1  3%      -0.3%      49684 =C2=B1 28%      +2.7%      5119=
7 =C2=B1  2%  softirqs.CPU19.SCHED
      4.89 =C2=B1261%     -96.6%       0.17 =C2=B1331%     -90.9%       0.4=
4 =C2=B1187%  softirqs.CPU19.TASKLET
      1106 =C2=B1259%     -84.7%     168.75 =C2=B1228%     -89.0%     121.8=
9 =C2=B1102%  softirqs.CPU19.TIMER
      1.56 =C2=B1260%     +28.6%       2.00 =C2=B1206%    +535.7%       9.8=
9 =C2=B1140%  softirqs.CPU2.BLOCK
      3.56 =C2=B1145%   +1243.0%      47.75 =C2=B1307%   +2353.1%      87.2=
2 =C2=B1259%  softirqs.CPU2.NET_RX
      0.22 =C2=B1282%     -62.5%       0.08 =C2=B1331%    +200.0%       0.6=
7 =C2=B1122%  softirqs.CPU2.NET_TX
     21418 =C2=B1 19%      +8.5%      23245 =C2=B1 54%      +0.3%      2148=
3 =C2=B1 19%  softirqs.CPU2.RCU
     48241 =C2=B1 10%      +4.4%      50354 =C2=B1 12%      +7.0%      5162=
0        softirqs.CPU2.SCHED
      0.33 =C2=B1200%   +1325.0%       4.75 =C2=B1225%    +600.0%       2.3=
3 =C2=B1240%  softirqs.CPU2.TASKLET
    411.11 =C2=B1104%     +14.9%     472.33 =C2=B1265%     -71.9%     115.3=
3 =C2=B1 54%  softirqs.CPU2.TIMER
      5.33 =C2=B1158%     +20.3%       6.42 =C2=B1176%     -68.8%       1.6=
7 =C2=B1174%  softirqs.CPU20.BLOCK
      1.78 =C2=B1173%   +6068.8%     109.67 =C2=B1234%   +1018.8%      19.8=
9 =C2=B1277%  softirqs.CPU20.NET_RX
      0.11 =C2=B1282%    +125.0%       0.25 =C2=B1173%    -100.0%       0.0=
0        softirqs.CPU20.NET_TX
     18789 =C2=B1 23%     +11.4%      20928 =C2=B1 55%      -1.4%      1851=
8 =C2=B1 21%  softirqs.CPU20.RCU
     51234 =C2=B1 18%      +0.2%      51352 =C2=B1  3%      -7.0%      4766=
1 =C2=B1 15%  softirqs.CPU20.SCHED
      0.00       +1.7e+101%       0.17 =C2=B1331%   +1e+102%       1.00 =C2=
=B1221%  softirqs.CPU20.TASKLET
    105.67 =C2=B1110%     +79.0%     189.17 =C2=B1228%     +99.2%     210.4=
4 =C2=B1152%  softirqs.CPU20.TIMER
      4.56 =C2=B1227%     +59.1%       7.25 =C2=B1208%     -97.6%       0.1=
1 =C2=B1282%  softirqs.CPU21.BLOCK
      1.44 =C2=B1 92%    +176.9%       4.00 =C2=B1257%     +53.8%       2.2=
2 =C2=B1251%  softirqs.CPU21.NET_RX
      0.44 =C2=B1154%     -43.8%       0.25 =C2=B1173%     -75.0%       0.1=
1 =C2=B1282%  softirqs.CPU21.NET_TX
     18074 =C2=B1 23%     +15.6%      20893 =C2=B1 54%      +5.8%      1913=
0 =C2=B1 21%  softirqs.CPU21.RCU
     49770 =C2=B1  6%      +3.6%      51564 =C2=B1  3%      +0.7%      5013=
2 =C2=B1  5%  softirqs.CPU21.SCHED
      2.22 =C2=B1282%     -88.8%       0.25 =C2=B1238%    -100.0%       0.0=
0        softirqs.CPU21.TASKLET
    504.89 =C2=B1235%     -52.3%     241.00 =C2=B1178%     -72.5%     138.6=
7 =C2=B1195%  softirqs.CPU21.TIMER
      2.22 =C2=B1267%      +5.0%       2.33 =C2=B1254%    +120.0%       4.8=
9 =C2=B1 98%  softirqs.CPU22.BLOCK
      0.67 =C2=B1122%   +8087.5%      54.58 =C2=B1297%    +166.7%       1.7=
8 =C2=B1190%  softirqs.CPU22.NET_RX
      0.33 =C2=B1200%     +50.0%       0.50 =C2=B1129%     -66.7%       0.1=
1 =C2=B1282%  softirqs.CPU22.NET_TX
     18024 =C2=B1 21%     +14.1%      20557 =C2=B1 54%      +3.0%      1856=
9 =C2=B1 18%  softirqs.CPU22.RCU
     50204 =C2=B1  3%      -1.1%      49631 =C2=B1 13%      +1.9%      5117=
2        softirqs.CPU22.SCHED
      2.11 =C2=B1219%     -88.2%       0.25 =C2=B1238%     -84.2%       0.3=
3 =C2=B1200%  softirqs.CPU22.TASKLET
     65.33 =C2=B1 82%    +606.8%     461.75 =C2=B1180%    +338.3%     286.3=
3 =C2=B1192%  softirqs.CPU22.TIMER
      5.33 =C2=B1172%     -43.8%       3.00 =C2=B1203%     -22.9%       4.1=
1 =C2=B1147%  softirqs.CPU23.BLOCK
     34.33 =C2=B1223%      -5.6%      32.42 =C2=B1272%    +802.3%     309.7=
8 =C2=B1222%  softirqs.CPU23.NET_RX
      0.44 =C2=B1154%     -25.0%       0.33 =C2=B1254%     -50.0%       0.2=
2 =C2=B1187%  softirqs.CPU23.NET_TX
     18366 =C2=B1 23%     +10.5%      20296 =C2=B1 48%      +1.2%      1857=
8 =C2=B1 21%  softirqs.CPU23.RCU
     48464 =C2=B1 10%      +7.6%      52163 =C2=B1 14%      +6.4%      5157=
6 =C2=B1  2%  softirqs.CPU23.SCHED
      0.22 =C2=B1282%    +912.5%       2.25 =C2=B1331%     -50.0%       0.1=
1 =C2=B1282%  softirqs.CPU23.TASKLET
    111.11 =C2=B1 65%     +61.0%     178.92 =C2=B1173%      +7.4%     119.3=
3 =C2=B1114%  softirqs.CPU23.TIMER
      0.56 =C2=B1282%     +65.0%       0.92 =C2=B1300%   +1500.0%       8.8=
9 =C2=B1278%  softirqs.CPU24.BLOCK
     28.44 =C2=B1205%    +365.5%     132.42 =C2=B1223%    +383.2%     137.4=
4 =C2=B1220%  softirqs.CPU24.NET_RX
      4.44 =C2=B1282%    +192.5%      13.00 =C2=B1140%    +195.0%      13.1=
1 =C2=B1141%  softirqs.CPU24.NET_TX
     18437 =C2=B1 21%     +18.9%      21923 =C2=B1 56%      -7.2%      1710=
9 =C2=B1 22%  softirqs.CPU24.RCU
     51590            -0.7%      51247 =C2=B1  4%      -1.6%      50774 =C2=
=B1  2%  softirqs.CPU24.SCHED
      2.00 =C2=B1265%    -100.0%       0.00           -16.7%       1.67 =C2=
=B1262%  softirqs.CPU24.TASKLET
    797.56 =C2=B1168%     -39.9%     479.08 =C2=B1122%     -35.0%     518.6=
7 =C2=B1142%  softirqs.CPU24.TIMER
      0.22 =C2=B1282%   +5787.5%      13.08 =C2=B1219%   +5450.0%      12.3=
3 =C2=B1277%  softirqs.CPU25.BLOCK
    807.56 =C2=B1282%     -99.1%       7.17 =C2=B1327%     -98.6%      11.5=
6 =C2=B1168%  softirqs.CPU25.NET_RX
      0.00          -100.0%       0.00       +3.3e+101%       0.33 =C2=B120=
0%  softirqs.CPU25.NET_TX
     17665 =C2=B1 16%     +17.4%      20734 =C2=B1 58%      -6.3%      1654=
5 =C2=B1 21%  softirqs.CPU25.RCU
     51798 =C2=B1  3%      +0.4%      51981 =C2=B1  2%      +3.4%      5354=
2 =C2=B1 15%  softirqs.CPU25.SCHED
      3.11 =C2=B1187%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU25.TASKLET
    387.78 =C2=B1129%     +79.4%     695.83 =C2=B1123%     +73.5%     672.7=
8 =C2=B1118%  softirqs.CPU25.TIMER
     17.44 =C2=B1251%     -78.5%       3.75 =C2=B1307%     -72.6%       4.7=
8 =C2=B1240%  softirqs.CPU26.BLOCK
      0.00       +1.4e+102%       1.42 =C2=B1234%    -100.0%       0.00    =
    softirqs.CPU26.NET_RX
      0.00       +8.3e+100%       0.08 =C2=B1331%    -100.0%       0.00    =
    softirqs.CPU26.NET_TX
     18487 =C2=B1 17%     +21.5%      22467 =C2=B1 55%     -14.5%      1580=
0 =C2=B1 26%  softirqs.CPU26.RCU
     50992 =C2=B1  2%      +0.3%      51166 =C2=B1  6%      -7.0%      4740=
9 =C2=B1 14%  softirqs.CPU26.SCHED
      2.00            +4.2%       2.08 =C2=B1 13%      +5.6%       2.11 =C2=
=B1 14%  softirqs.CPU26.TASKLET
     72.00 =C2=B1 91%    +792.9%     642.92 =C2=B1105%   +2374.5%       178=
1 =C2=B1272%  softirqs.CPU26.TIMER
      3.78 =C2=B1282%     -16.2%       3.17 =C2=B1322%     -82.4%       0.6=
7 =C2=B1234%  softirqs.CPU27.BLOCK
     31.56 =C2=B1281%     -81.5%       5.83 =C2=B1326%     -88.0%       3.7=
8 =C2=B1264%  softirqs.CPU27.NET_RX
      0.00          -100.0%       0.00       +2.2e+101%       0.22 =C2=B128=
2%  softirqs.CPU27.NET_TX
     17296 =C2=B1 17%     +16.1%      20084 =C2=B1 61%      -6.3%      1620=
5 =C2=B1 32%  softirqs.CPU27.RCU
     51298 =C2=B1  2%      -6.6%      47917 =C2=B1 15%     -12.2%      4503=
5 =C2=B1 20%  softirqs.CPU27.SCHED
      1.67 =C2=B1 39%     +10.0%       1.83 =C2=B1 30%     +93.3%       3.2=
2 =C2=B1108%  softirqs.CPU27.TASKLET
    442.78 =C2=B1239%     +36.3%     603.58 =C2=B1164%    +141.7%       107=
0 =C2=B1257%  softirqs.CPU27.TIMER
      7.56 =C2=B1282%     -96.7%       0.25 =C2=B1173%     -86.8%       1.0=
0 =C2=B1282%  softirqs.CPU28.BLOCK
    120.22 =C2=B1258%     -82.2%      21.42 =C2=B1233%     -31.2%      82.6=
7 =C2=B1282%  softirqs.CPU28.NET_RX
     18663 =C2=B1 17%     +17.7%      21964 =C2=B1 58%     -10.3%      1674=
1 =C2=B1 22%  softirqs.CPU28.RCU
     51875 =C2=B1 11%      -0.0%      51867 =C2=B1  6%      -2.5%      5057=
2 =C2=B1  3%  softirqs.CPU28.SCHED
      2.11 =C2=B1 78%     -17.1%       1.75 =C2=B1 34%     -15.8%       1.7=
8 =C2=B1 23%  softirqs.CPU28.TASKLET
    228.11 =C2=B1227%     +61.8%     369.17 =C2=B1162%     -37.7%     142.2=
2 =C2=B1227%  softirqs.CPU28.TIMER
      0.89 =C2=B1208%   +3106.2%      28.50 =C2=B1229%     -25.0%       0.6=
7 =C2=B1234%  softirqs.CPU29.BLOCK
      5.00 =C2=B1282%     -53.3%       2.33 =C2=B1247%    +722.2%      41.1=
1 =C2=B1258%  softirqs.CPU29.NET_RX
      0.11 =C2=B1282%     -25.0%       0.08 =C2=B1331%    +100.0%       0.2=
2 =C2=B1282%  softirqs.CPU29.NET_TX
     18572 =C2=B1 16%     +19.9%      22267 =C2=B1 59%      -9.4%      1681=
9 =C2=B1 23%  softirqs.CPU29.RCU
     51629 =C2=B1  2%      -0.1%      51595 =C2=B1  2%      -0.0%      5160=
5 =C2=B1  6%  softirqs.CPU29.SCHED
      2.11 =C2=B1 14%      -5.3%       2.00            +5.3%       2.22 =C2=
=B1 28%  softirqs.CPU29.TASKLET
    244.56 =C2=B1213%     -53.0%     114.92 =C2=B1109%     -74.9%      61.3=
3 =C2=B1113%  softirqs.CPU29.TIMER
      0.33 =C2=B1200%   +2650.0%       9.17 =C2=B1131%   +1833.3%       6.4=
4 =C2=B1206%  softirqs.CPU3.BLOCK
     19.44 =C2=B1228%     -78.1%       4.25 =C2=B1210%    +761.1%     167.4=
4 =C2=B1276%  softirqs.CPU3.NET_RX
      0.11 =C2=B1282%   +3050.0%       3.50 =C2=B1314%    +100.0%       0.2=
2 =C2=B1187%  softirqs.CPU3.NET_TX
     21276 =C2=B1 24%      +9.8%      23363 =C2=B1 44%      +3.4%      2199=
6 =C2=B1 21%  softirqs.CPU3.RCU
     49871 =C2=B1 18%      +4.9%      52335 =C2=B1  2%     +10.2%      5496=
0 =C2=B1 16%  softirqs.CPU3.SCHED
      0.33 =C2=B1199%     +50.0%       0.50 =C2=B1129%    -100.0%       0.0=
0        softirqs.CPU3.TASKLET
    600.00 =C2=B1199%     -30.9%     414.50 =C2=B1141%     -27.4%     435.6=
7 =C2=B1126%  softirqs.CPU3.TIMER
     12.33 =C2=B1274%     -68.2%       3.92 =C2=B1286%    +172.1%      33.5=
6 =C2=B1158%  softirqs.CPU30.BLOCK
      0.11 =C2=B1282%   +8675.0%       9.75 =C2=B1182%   +8400.0%       9.4=
4 =C2=B1282%  softirqs.CPU30.NET_RX
      0.00       +2.5e+101%       0.25 =C2=B1238%    -100.0%       0.00    =
    softirqs.CPU30.NET_TX
     17107 =C2=B1 17%     +17.4%      20084 =C2=B1 55%      -4.5%      1633=
6 =C2=B1 25%  softirqs.CPU30.RCU
     51445 =C2=B1  2%      +2.7%      52822 =C2=B1  9%      -3.8%      4947=
5 =C2=B1  2%  softirqs.CPU30.SCHED
      1.78 =C2=B1 35%      -6.2%       1.67 =C2=B1 44%      +6.2%       1.8=
9 =C2=B1 16%  softirqs.CPU30.TASKLET
    228.67 =C2=B1223%     -13.1%     198.75 =C2=B1277%     -63.0%      84.5=
6 =C2=B1 88%  softirqs.CPU30.TIMER
      7.78 =C2=B1185%     -28.2%       5.58 =C2=B1218%     -91.4%       0.6=
7 =C2=B1158%  softirqs.CPU31.BLOCK
      7008 =C2=B1282%     -97.4%     185.58 =C2=B1200%     -99.9%       6.3=
3 =C2=B1271%  softirqs.CPU31.NET_RX
      0.00          -100.0%       0.00       +1.1e+101%       0.11 =C2=B128=
2%  softirqs.CPU31.NET_TX
     18292 =C2=B1 18%     +18.8%      21733 =C2=B1 59%      -7.6%      1690=
5 =C2=B1 24%  softirqs.CPU31.RCU
     51179 =C2=B1  2%      -6.3%      47945 =C2=B1 25%      -1.2%      5057=
9 =C2=B1  5%  softirqs.CPU31.SCHED
      3.67 =C2=B1128%     -47.7%       1.92 =C2=B1 14%     -48.5%       1.8=
9 =C2=B1 16%  softirqs.CPU31.TASKLET
    885.33 =C2=B1253%     -78.6%     189.58 =C2=B1235%     -95.8%      37.3=
3 =C2=B1 84%  softirqs.CPU31.TIMER
     12.33 =C2=B1277%     -96.6%       0.42 =C2=B1267%     -23.4%       9.4=
4 =C2=B1188%  softirqs.CPU32.BLOCK
     66.44 =C2=B1240%    +118.4%     145.08 =C2=B1127%     -99.8%       0.1=
1 =C2=B1282%  softirqs.CPU32.NET_RX
     23106 =C2=B1 22%     +19.7%      27663 =C2=B1 61%     -19.2%      1867=
9 =C2=B1 23%  softirqs.CPU32.RCU
     52990 =C2=B1 11%      -3.9%      50906 =C2=B1  6%      -1.3%      5228=
4 =C2=B1 10%  softirqs.CPU32.SCHED
      2.67 =C2=B1 70%     -25.0%       2.00           -25.0%       2.00    =
    softirqs.CPU32.TASKLET
    688.44 =C2=B1244%     -95.8%      28.83 =C2=B1 98%     -89.8%      70.3=
3 =C2=B1105%  softirqs.CPU32.TIMER
      0.44 =C2=B1187%     +50.0%       0.67 =C2=B1215%    +875.0%       4.3=
3 =C2=B1259%  softirqs.CPU33.BLOCK
    112.11 =C2=B1191%     -95.8%       4.75 =C2=B1273%    -100.0%       0.0=
0        softirqs.CPU33.NET_RX
     22133 =C2=B1 19%     +19.2%      26379 =C2=B1 58%     -16.0%      1859=
4 =C2=B1 22%  softirqs.CPU33.RCU
     50935 =C2=B1  2%      -0.2%      50829 =C2=B1  4%      -2.7%      4954=
7 =C2=B1  2%  softirqs.CPU33.SCHED
      1.56 =C2=B1 53%     +28.6%       2.00           +28.6%       2.00    =
    softirqs.CPU33.TASKLET
     44.11 =C2=B1151%     -46.7%      23.50 =C2=B1 47%     +21.7%      53.6=
7 =C2=B1109%  softirqs.CPU33.TIMER
      0.67 =C2=B1282%    +487.5%       3.92 =C2=B1223%     +50.0%       1.0=
0 =C2=B1200%  softirqs.CPU34.BLOCK
      7.33 =C2=B1250%    +633.0%      53.75 =C2=B1331%     -93.9%       0.4=
4 =C2=B1187%  softirqs.CPU34.NET_RX
      0.11 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU34.NET_TX
     21628 =C2=B1 16%     +26.4%      27330 =C2=B1 57%      -9.2%      1964=
1 =C2=B1 21%  softirqs.CPU34.RCU
     51610 =C2=B1  2%      -0.1%      51580 =C2=B1  2%      -9.0%      4695=
5 =C2=B1 13%  softirqs.CPU34.SCHED
      6.44 =C2=B1239%     -92.2%       0.50 =C2=B1173%     -25.9%       4.7=
8 =C2=B1268%  softirqs.CPU34.TASKLET
      2043 =C2=B1146%     -91.9%     166.25 =C2=B1242%     -94.6%     109.8=
9 =C2=B1151%  softirqs.CPU34.TIMER
     10.56 =C2=B1184%     +57.9%      16.67 =C2=B1250%      -3.2%      10.2=
2 =C2=B1187%  softirqs.CPU35.BLOCK
      1.00 =C2=B1249%    +191.7%       2.92 =C2=B1226%  +19222.2%     193.2=
2 =C2=B1282%  softirqs.CPU35.NET_RX
      0.11 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU35.NET_TX
     22703 =C2=B1 20%     +20.3%      27309 =C2=B1 58%     -13.7%      1960=
3 =C2=B1 23%  softirqs.CPU35.RCU
     51171 =C2=B1  2%      -3.7%      49279 =C2=B1  9%      -2.7%      4978=
0        softirqs.CPU35.SCHED
      0.22 =C2=B1282%     -25.0%       0.17 =C2=B1331%    -100.0%       0.0=
0        softirqs.CPU35.TASKLET
     41.33 =C2=B1156%     +78.0%      73.58 =C2=B1188%     +58.6%      65.5=
6 =C2=B1142%  softirqs.CPU35.TIMER
      7.56 =C2=B1282%     +82.0%      13.75 =C2=B1236%     -54.4%       3.4=
4 =C2=B1244%  softirqs.CPU36.BLOCK
    103.67 =C2=B1195%     -54.7%      47.00 =C2=B1331%    +797.0%     929.8=
9 =C2=B1272%  softirqs.CPU36.NET_RX
      0.00          -100.0%       0.00       +2.2e+101%       0.22 =C2=B128=
2%  softirqs.CPU36.NET_TX
     20295 =C2=B1 19%     +14.5%      23244 =C2=B1 57%     -10.5%      1817=
4 =C2=B1 24%  softirqs.CPU36.RCU
     51071 =C2=B1  3%      +0.8%      51499 =C2=B1  2%      -4.5%      4875=
7 =C2=B1  3%  softirqs.CPU36.SCHED
      0.00          -100.0%       0.00       +5.6e+101%       0.56 =C2=B128=
2%  softirqs.CPU36.TASKLET
    642.78 =C2=B1112%     -25.3%     480.42 =C2=B1159%      -1.6%     632.4=
4 =C2=B1228%  softirqs.CPU36.TIMER
     12.22 =C2=B1277%     -64.5%       4.33 =C2=B1190%     +58.2%      19.3=
3 =C2=B1281%  softirqs.CPU37.BLOCK
      0.22 =C2=B1187%  +86375.0%     192.17 =C2=B1314%   +6550.0%      14.7=
8 =C2=B1196%  softirqs.CPU37.NET_RX
      0.00       +8.3e+100%       0.08 =C2=B1331% +1.1e+101%       0.11 =C2=
=B1282%  softirqs.CPU37.NET_TX
     22730 =C2=B1 19%      +9.7%      24937 =C2=B1 61%     -17.9%      1865=
3 =C2=B1 26%  softirqs.CPU37.RCU
     50830 =C2=B1  2%      -4.9%      48343 =C2=B1 23%      -9.4%      4604=
5 =C2=B1 16%  softirqs.CPU37.SCHED
      0.00       +5.8e+101%       0.58 =C2=B1331%    -100.0%       0.00    =
    softirqs.CPU37.TASKLET
    202.33 =C2=B1201%    +468.5%       1150 =C2=B1317%     -13.6%     174.7=
8 =C2=B1188%  softirqs.CPU37.TIMER
      0.67 =C2=B1282%   +1350.0%       9.67 =C2=B1196%   +4083.3%      27.8=
9 =C2=B1132%  softirqs.CPU38.BLOCK
    151.33 =C2=B1271%    +127.3%     344.00 =C2=B1327%     -68.9%      47.1=
1 =C2=B1282%  softirqs.CPU38.NET_RX
      0.11 =C2=B1282%     -25.0%       0.08 =C2=B1331%    -100.0%       0.0=
0        softirqs.CPU38.NET_TX
     23513 =C2=B1 22%     +19.8%      28159 =C2=B1 60%     -18.0%      1927=
8 =C2=B1 23%  softirqs.CPU38.RCU
     49645 =C2=B1  8%      +4.1%      51680 =C2=B1  2%      +0.5%      4989=
1        softirqs.CPU38.SCHED
      0.44 =C2=B1282%     -81.2%       0.08 =C2=B1331%     -25.0%       0.3=
3 =C2=B1282%  softirqs.CPU38.TASKLET
     46.78 =C2=B1130%     +21.7%      56.92 =C2=B1138%     +63.7%      76.5=
6 =C2=B1122%  softirqs.CPU38.TIMER
      0.00         +1e+102%       1.00 =C2=B1187% +3.3e+101%       0.33 =C2=
=B1200%  softirqs.CPU39.BLOCK
    172.56 =C2=B1272%     -87.3%      21.92 =C2=B1322%     -36.4%     109.7=
8 =C2=B1282%  softirqs.CPU39.NET_RX
      0.00       +1.7e+101%       0.17 =C2=B1331% +1.1e+101%       0.11 =C2=
=B1282%  softirqs.CPU39.NET_TX
     21125 =C2=B1 18%     +19.1%      25169 =C2=B1 58%      -7.9%      1944=
7 =C2=B1 22%  softirqs.CPU39.RCU
     48596 =C2=B1 15%      +6.0%      51506 =C2=B1  2%      +1.3%      4921=
6 =C2=B1  3%  softirqs.CPU39.SCHED
     22.78 =C2=B1 53%    +140.4%      54.75 =C2=B1109%    +182.0%      64.2=
2 =C2=B1187%  softirqs.CPU39.TIMER
      0.11 =C2=B1282%   +5525.0%       6.25 =C2=B1204%   +2200.0%       2.5=
6 =C2=B1212%  softirqs.CPU4.BLOCK
     19.56 =C2=B1181%    +423.7%     102.42 =C2=B1301%     -98.3%       0.3=
3 =C2=B1141%  softirqs.CPU4.NET_RX
      0.22 =C2=B1187%     +12.5%       0.25 =C2=B1238%      +0.0%       0.2=
2 =C2=B1187%  softirqs.CPU4.NET_TX
     20875 =C2=B1 23%     +11.6%      23302 =C2=B1 43%      +7.0%      2233=
7 =C2=B1 18%  softirqs.CPU4.RCU
     45490 =C2=B1 23%     +10.7%      50378 =C2=B1 13%      +3.9%      4726=
0 =C2=B1 26%  softirqs.CPU4.SCHED
      4.56 =C2=B1237%     -81.7%       0.83 =C2=B1206%     -92.7%       0.3=
3 =C2=B1200%  softirqs.CPU4.TASKLET
    116.00 =C2=B1170%   +1145.8%       1445 =C2=B1301%      +1.8%     118.1=
1 =C2=B1 82%  softirqs.CPU4.TIMER
      0.44 =C2=B1282%   +1906.2%       8.92 =C2=B1331%   +1425.0%       6.7=
8 =C2=B1233%  softirqs.CPU40.BLOCK
     60.78 =C2=B1281%     +40.7%      85.50 =C2=B1331%     +14.6%      69.6=
7 =C2=B1282%  softirqs.CPU40.NET_RX
     23462 =C2=B1 22%     +17.0%      27444 =C2=B1 56%     -18.7%      1907=
2 =C2=B1 26%  softirqs.CPU40.RCU
     48447 =C2=B1 15%      +6.3%      51489 =C2=B1  2%      +2.8%      4980=
6        softirqs.CPU40.SCHED
      0.89 =C2=B1245%    -100.0%       0.00           +75.0%       1.56 =C2=
=B1282%  softirqs.CPU40.TASKLET
     52.89 =C2=B1187%    +156.2%     135.50 =C2=B1138%    +309.7%     216.6=
7 =C2=B1130%  softirqs.CPU40.TIMER
      5.78 =C2=B1282%     -94.2%       0.33 =C2=B1187%     -78.8%       1.2=
2 =C2=B1230%  softirqs.CPU41.BLOCK
     28.78 =C2=B1245%     -97.1%       0.83 =C2=B1331%    +149.8%      71.8=
9 =C2=B1261%  softirqs.CPU41.NET_RX
      0.00          -100.0%       0.00       +1.1e+101%       0.11 =C2=B128=
2%  softirqs.CPU41.NET_TX
     23735 =C2=B1 22%     +15.0%      27296 =C2=B1 64%     -17.5%      1957=
1 =C2=B1 22%  softirqs.CPU41.RCU
     51396            -3.2%      49734 =C2=B1 13%      -2.7%      50020    =
    softirqs.CPU41.SCHED
      0.11 =C2=B1282%    +200.0%       0.33 =C2=B1331%    -100.0%       0.0=
0        softirqs.CPU41.TASKLET
    206.11 =C2=B1213%    +383.0%     995.50 =C2=B1295%     +48.8%     306.6=
7 =C2=B1217%  softirqs.CPU41.TIMER
      0.44 =C2=B1215%   +2018.8%       9.42 =C2=B1231%   +2175.0%      10.1=
1 =C2=B1268%  softirqs.CPU42.BLOCK
      8.11 =C2=B1282%    +379.8%      38.92 =C2=B1317%     -78.1%       1.7=
8 =C2=B1282%  softirqs.CPU42.NET_RX
     18961 =C2=B1 21%      +6.5%      20187 =C2=B1 50%      -2.2%      1854=
7 =C2=B1 24%  softirqs.CPU42.RCU
     48638 =C2=B1 15%      +5.5%      51325 =C2=B1  2%      +1.4%      4933=
4 =C2=B1  2%  softirqs.CPU42.SCHED
      0.11 =C2=B1282%    -100.0%       0.00         +4500.0%       5.11 =C2=
=B1282%  softirqs.CPU42.TASKLET
    215.44 =C2=B1223%     -40.5%     128.17 =C2=B1148%    +125.9%     486.6=
7 =C2=B1260%  softirqs.CPU42.TIMER
      0.11 =C2=B1282%    -100.0%       0.00        +16300.0%      18.22 =C2=
=B1198%  softirqs.CPU43.BLOCK
      0.00       +4.9e+102%       4.92 =C2=B1331% +7.3e+102%       7.33 =C2=
=B1207%  softirqs.CPU43.NET_RX
      0.00       +1.7e+101%       0.17 =C2=B1331% +3.3e+101%       0.33 =C2=
=B1199%  softirqs.CPU43.NET_TX
     19958 =C2=B1 18%     +16.6%      23280 =C2=B1 55%      -3.5%      1926=
4 =C2=B1 20%  softirqs.CPU43.RCU
     51940 =C2=B1  5%      -1.1%      51365 =C2=B1  2%      -9.4%      4704=
2 =C2=B1 16%  softirqs.CPU43.SCHED
     75.11 =C2=B1205%     -55.2%      33.67 =C2=B1 72%    +117.9%     163.6=
7 =C2=B1150%  softirqs.CPU43.TIMER
      9.89 =C2=B1196%     -11.5%       8.75 =C2=B1307%     -41.6%       5.7=
8 =C2=B1258%  softirqs.CPU44.BLOCK
     16.67 =C2=B1282%    +113.5%      35.58 =C2=B1324%    +200.7%      50.1=
1 =C2=B1280%  softirqs.CPU44.NET_RX
      0.00       +8.3e+100%       0.08 =C2=B1331%    -100.0%       0.00    =
    softirqs.CPU44.NET_TX
     23808 =C2=B1 22%     +17.9%      28063 =C2=B1 59%     -23.1%      1830=
6 =C2=B1 21%  softirqs.CPU44.RCU
     51398 =C2=B1  2%      +2.1%      52483 =C2=B1  3%      -5.5%      4855=
6 =C2=B1  9%  softirqs.CPU44.SCHED
      0.22 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU44.TASKLET
    103.67 =C2=B1130%     +63.6%     169.58 =C2=B1233%   +1330.4%       148=
2 =C2=B1268%  softirqs.CPU44.TIMER
     23.89 =C2=B1119%     -94.8%       1.25 =C2=B1251%     -50.2%      11.8=
9 =C2=B1259%  softirqs.CPU45.BLOCK
      0.00         +1e+104%     104.17 =C2=B1256% +9.6e+102%       9.56 =C2=
=B1279%  softirqs.CPU45.NET_RX
     23605 =C2=B1 20%     +16.3%      27443 =C2=B1 56%     -18.7%      1920=
1 =C2=B1 24%  softirqs.CPU45.RCU
     51184 =C2=B1  2%      -2.7%      49820 =C2=B1 13%      -4.5%      4887=
3 =C2=B1  4%  softirqs.CPU45.SCHED
      0.00       +2.2e+102%       2.25 =C2=B1232%    -100.0%       0.00    =
    softirqs.CPU45.TASKLET
    205.11 =C2=B1242%     -55.5%      91.33 =C2=B1159%     +52.9%     313.5=
6 =C2=B1264%  softirqs.CPU45.TIMER
     27.67 =C2=B1180%     -90.7%       2.58 =C2=B1309%     -99.6%       0.1=
1 =C2=B1282%  softirqs.CPU46.BLOCK
     54.11 =C2=B1253%     +26.0%      68.17 =C2=B1243%     -98.4%       0.8=
9 =C2=B1282%  softirqs.CPU46.NET_RX
      0.00       +8.3e+100%       0.08 =C2=B1331%    -100.0%       0.00    =
    softirqs.CPU46.NET_TX
     23097 =C2=B1 24%     +20.3%      27785 =C2=B1 59%     -15.3%      1956=
9 =C2=B1 23%  softirqs.CPU46.RCU
     51665            -0.1%      51620 =C2=B1  2%      -6.6%      48260 =C2=
=B1 11%  softirqs.CPU46.SCHED
      0.00          -100.0%       0.00       +1.3e+102%       1.33 =C2=B123=
4%  softirqs.CPU46.TASKLET
    392.11 =C2=B1177%     -38.8%     239.83 =C2=B1229%      -4.1%     375.8=
9 =C2=B1165%  softirqs.CPU46.TIMER
      0.44 =C2=B1187%   +2412.5%      11.17 =C2=B1250%   +1800.0%       8.4=
4 =C2=B1254%  softirqs.CPU47.BLOCK
      9.22 =C2=B1184%     +32.8%      12.25 =C2=B1199%     -88.0%       1.1=
1 =C2=B1252%  softirqs.CPU47.NET_RX
     13.00 =C2=B1141%     -50.6%       6.42 =C2=B1223%     -66.7%       4.3=
3 =C2=B1274%  softirqs.CPU47.NET_TX
     21654 =C2=B1 23%     +19.9%      25967 =C2=B1 54%     -10.9%      1928=
6 =C2=B1 25%  softirqs.CPU47.RCU
     46124 =C2=B1 15%      -8.0%      42423 =C2=B1 17%      -8.1%      4237=
8 =C2=B1 24%  softirqs.CPU47.SCHED
      1.44 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU47.TASKLET
    366.22 =C2=B1254%     -79.0%      77.08 =C2=B1 94%     -88.3%      42.7=
8 =C2=B1 59%  softirqs.CPU47.TIMER
      2.67 =C2=B1282%     -65.6%       0.92 =C2=B1331%    +287.5%      10.3=
3 =C2=B1144%  softirqs.CPU48.BLOCK
     71.33 =C2=B1271%     -99.2%       0.58 =C2=B1130%     -97.0%       2.1=
1 =C2=B1157%  softirqs.CPU48.NET_RX
      0.22 =C2=B1187%    +125.0%       0.50 =C2=B1129%   +2050.0%       4.7=
8 =C2=B1253%  softirqs.CPU48.NET_TX
     19990 =C2=B1 19%     +13.3%      22642 =C2=B1 50%      +1.5%      2028=
3 =C2=B1 24%  softirqs.CPU48.RCU
     42280 =C2=B1 17%      -7.1%      39299 =C2=B1 31%      +2.2%      4323=
1 =C2=B1 26%  softirqs.CPU48.SCHED
      0.22 =C2=B1282%    -100.0%       0.00         +2150.0%       5.00 =C2=
=B1275%  softirqs.CPU48.TASKLET
    331.44 =C2=B1156%    +139.1%     792.58 =C2=B1198%     -51.0%     162.4=
4 =C2=B1128%  softirqs.CPU48.TIMER
      3.00 =C2=B1282%     +36.1%       4.08 =C2=B1192%     +11.1%       3.3=
3 =C2=B1187%  softirqs.CPU49.BLOCK
     54.67 =C2=B1273%  +15359.6%       8451 =C2=B1256%     -95.5%       2.4=
4 =C2=B1114%  softirqs.CPU49.NET_RX
      0.67 =C2=B1100%     -87.5%       0.08 =C2=B1331%     -66.7%       0.2=
2 =C2=B1187%  softirqs.CPU49.NET_TX
     19479 =C2=B1 21%     +15.4%      22474 =C2=B1 54%      +5.4%      2053=
4 =C2=B1 25%  softirqs.CPU49.RCU
     42715 =C2=B1 19%     +17.0%      49974 =C2=B1  9%     +16.5%      4977=
5 =C2=B1  6%  softirqs.CPU49.SCHED
      0.44 =C2=B1154%     -81.2%       0.08 =C2=B1331%     -75.0%       0.1=
1 =C2=B1282%  softirqs.CPU49.TASKLET
    143.78 =C2=B1 57%     +63.2%     234.58 =C2=B1105%    +661.7%       109=
5 =C2=B1107%  softirqs.CPU49.TIMER
      7.33 =C2=B1119%    -100.0%       0.00           -87.9%       0.89 =C2=
=B1282%  softirqs.CPU5.BLOCK
      1343 =C2=B1282%     -97.6%      32.25 =C2=B1318%     -99.8%       3.3=
3 =C2=B1272%  softirqs.CPU5.NET_RX
      0.22 =C2=B1282%    -100.0%       0.00           -50.0%       0.11 =C2=
=B1282%  softirqs.CPU5.NET_TX
     21258 =C2=B1 23%     +14.4%      24314 =C2=B1 54%      +3.4%      2197=
9 =C2=B1 21%  softirqs.CPU5.RCU
     51415 =C2=B1  5%      +1.0%      51909            -1.5%      50665 =C2=
=B1  6%  softirqs.CPU5.SCHED
      0.11 =C2=B1282%   +3725.0%       4.25 =C2=B1303%    +400.0%       0.5=
6 =C2=B1149%  softirqs.CPU5.TASKLET
    109.44 =C2=B1 89%    +203.3%     331.92 =C2=B1167%    +139.1%     261.6=
7 =C2=B1201%  softirqs.CPU5.TIMER
      0.11 =C2=B1282%  +16550.0%      18.50 =C2=B1188%      +0.0%       0.1=
1 =C2=B1282%  softirqs.CPU50.BLOCK
     10.44 =C2=B1256%   +1192.6%     135.00 =C2=B1323%     +47.9%      15.4=
4 =C2=B1273%  softirqs.CPU50.NET_RX
      0.22 =C2=B1187%     +50.0%       0.33 =C2=B1141%     +50.0%       0.3=
3 =C2=B1141%  softirqs.CPU50.NET_TX
     20329 =C2=B1 20%     +13.3%      23040 =C2=B1 54%      +1.2%      2057=
1 =C2=B1 23%  softirqs.CPU50.RCU
     46651 =C2=B1 10%      +7.2%      50007 =C2=B1  7%      +7.3%      5004=
6 =C2=B1  2%  softirqs.CPU50.SCHED
      0.22 =C2=B1187%    +125.0%       0.50 =C2=B1152%    +100.0%       0.4=
4 =C2=B1154%  softirqs.CPU50.TASKLET
    132.78 =C2=B1 71%    +253.1%     468.83 =C2=B1135%    +131.5%     307.4=
4 =C2=B1192%  softirqs.CPU50.TIMER
     38.11 =C2=B1178%     -87.5%       4.75 =C2=B1209%     -97.7%       0.8=
9 =C2=B1282%  softirqs.CPU51.BLOCK
     58.11 =C2=B1273%    +154.4%     147.83 =C2=B1241%     +39.2%      80.8=
9 =C2=B1229%  softirqs.CPU51.NET_RX
      0.22 =C2=B1187%     +50.0%       0.33 =C2=B1141%    +150.0%       0.5=
6 =C2=B1123%  softirqs.CPU51.NET_TX
     20816 =C2=B1 22%     +10.3%      22963 =C2=B1 46%      +0.3%      2087=
2 =C2=B1 26%  softirqs.CPU51.RCU
     49448 =C2=B1  2%      +3.9%      51390 =C2=B1  3%      -8.4%      4529=
6 =C2=B1 20%  softirqs.CPU51.SCHED
      1.44 =C2=B1237%    +107.7%       3.00 =C2=B1209%     -53.8%       0.6=
7 =C2=B1158%  softirqs.CPU51.TASKLET
    105.56 =C2=B1 68%    +183.5%     299.25 =C2=B1154%    +676.8%     820.0=
0 =C2=B1255%  softirqs.CPU51.TIMER
      1.22 =C2=B1203%    +350.0%       5.50 =C2=B1215%    +218.2%       3.8=
9 =C2=B1219%  softirqs.CPU52.BLOCK
      1.56 =C2=B1125%   +4367.9%      69.50 =C2=B1260%    +114.3%       3.3=
3 =C2=B1 94%  softirqs.CPU52.NET_RX
      0.44 =C2=B1154%     -43.8%       0.25 =C2=B1238%     -25.0%       0.3=
3 =C2=B1141%  softirqs.CPU52.NET_TX
     21237 =C2=B1 21%     +12.0%      23783 =C2=B1 50%      +3.4%      2195=
1 =C2=B1 23%  softirqs.CPU52.RCU
     47366 =C2=B1 14%      +9.0%      51649 =C2=B1  2%      +2.5%      4855=
2 =C2=B1 14%  softirqs.CPU52.SCHED
      0.00          -100.0%       0.00       +2.1e+102%       2.11 =C2=B123=
4%  softirqs.CPU52.TASKLET
     81.44 =C2=B1106%     +45.8%     118.75 =C2=B1 59%    +133.3%     190.0=
0 =C2=B1120%  softirqs.CPU52.TIMER
      9.33 =C2=B1187%     -84.8%       1.42 =C2=B1310%     -84.5%       1.4=
4 =C2=B1282%  softirqs.CPU53.BLOCK
      5.00 =C2=B1163%     -41.7%       2.92 =C2=B1175%     -51.1%       2.4=
4 =C2=B1169%  softirqs.CPU53.NET_RX
      0.44 =C2=B1111%      -6.2%       0.42 =C2=B1118%     +50.0%       0.6=
7 =C2=B1100%  softirqs.CPU53.NET_TX
     20792 =C2=B1 22%     +14.4%      23780 =C2=B1 51%      +3.3%      2147=
1 =C2=B1 23%  softirqs.CPU53.RCU
     46769 =C2=B1 13%      +6.2%      49665 =C2=B1 13%      +6.9%      5001=
7 =C2=B1  5%  softirqs.CPU53.SCHED
      0.22 =C2=B1187%    +987.5%       2.42 =C2=B1331%     -50.0%       0.1=
1 =C2=B1282%  softirqs.CPU53.TASKLET
    117.11 =C2=B1 85%    +247.6%     407.08 =C2=B1146%     +21.0%     141.6=
7 =C2=B1122%  softirqs.CPU53.TIMER
      0.00         +8e+102%       8.00 =C2=B1197% +1.3e+103%      12.78 =C2=
=B1174%  softirqs.CPU54.BLOCK
      6.56 =C2=B1209%    +632.2%      48.00 =C2=B1322%     -54.2%       3.0=
0 =C2=B1167%  softirqs.CPU54.NET_RX
      4.89 =C2=B1268%     -94.9%       0.25 =C2=B1173%     -93.2%       0.3=
3 =C2=B1141%  softirqs.CPU54.NET_TX
     20183 =C2=B1 21%     +13.5%      22898 =C2=B1 50%      +9.4%      2208=
0 =C2=B1 20%  softirqs.CPU54.RCU
     46601 =C2=B1 15%      +2.4%      47742 =C2=B1 19%      +8.4%      5050=
2 =C2=B1  4%  softirqs.CPU54.SCHED
      0.44 =C2=B1187%     -62.5%       0.17 =C2=B1223%     -50.0%       0.2=
2 =C2=B1282%  softirqs.CPU54.TASKLET
    146.44 =C2=B1101%    +138.3%     349.00 =C2=B1155%      -1.4%     144.4=
4 =C2=B1 89%  softirqs.CPU54.TIMER
      1.11 =C2=B1226%    +342.5%       4.92 =C2=B1235%    +900.0%      11.1=
1 =C2=B1279%  softirqs.CPU55.BLOCK
      0.33 =C2=B1141%   +2150.0%       7.50 =C2=B1168%  +20033.3%      67.1=
1 =C2=B1280%  softirqs.CPU55.NET_RX
      0.11 =C2=B1282%    +425.0%       0.58 =C2=B1163%      +0.0%       0.1=
1 =C2=B1282%  softirqs.CPU55.NET_TX
     20608 =C2=B1 20%     +15.0%      23702 =C2=B1 50%      +4.7%      2158=
5 =C2=B1 22%  softirqs.CPU55.RCU
     48731 =C2=B1  3%      +3.3%      50331 =C2=B1  5%     -11.3%      4322=
7 =C2=B1 28%  softirqs.CPU55.SCHED
      0.00       +2.2e+102%       2.25 =C2=B1228% +2.2e+101%       0.22 =C2=
=B1282%  softirqs.CPU55.TASKLET
    320.67 =C2=B1183%     -70.1%      95.83 =C2=B1100%     -16.6%     267.5=
6 =C2=B1137%  softirqs.CPU55.TIMER
      2.89 =C2=B1172%     -13.5%       2.50 =C2=B1182%    +150.0%       7.2=
2 =C2=B1277%  softirqs.CPU56.BLOCK
     21.56 =C2=B1266%     -88.0%       2.58 =C2=B1176%  +33677.3%       728=
0 =C2=B1282%  softirqs.CPU56.NET_RX
      0.33 =C2=B1200%     -50.0%       0.17 =C2=B1223%     +33.3%       0.4=
4 =C2=B1111%  softirqs.CPU56.NET_TX
     21164 =C2=B1 22%     +10.4%      23370 =C2=B1 48%      +0.8%      2133=
9 =C2=B1 20%  softirqs.CPU56.RCU
     48675 =C2=B1  5%      +0.2%      48780 =C2=B1 20%      +4.2%      5071=
1 =C2=B1  3%  softirqs.CPU56.SCHED
      0.22 =C2=B1282%     -25.0%       0.17 =C2=B1331%     -50.0%       0.1=
1 =C2=B1282%  softirqs.CPU56.TASKLET
    214.33 =C2=B1105%     +33.4%     285.83 =C2=B1174%     -61.7%      82.0=
0 =C2=B1 64%  softirqs.CPU56.TIMER
      1.11 =C2=B1172%     +35.0%       1.50 =C2=B1195%      +0.0%       1.1=
1 =C2=B1177%  softirqs.CPU57.BLOCK
    149.56 =C2=B1217%     -99.1%       1.33 =C2=B1184%     -95.8%       6.2=
2 =C2=B1260%  softirqs.CPU57.NET_RX
      0.56 =C2=B1123%     -25.0%       0.42 =C2=B1153%     -20.0%       0.4=
4 =C2=B1111%  softirqs.CPU57.NET_TX
     20817 =C2=B1 22%     +14.3%      23799 =C2=B1 46%      +4.7%      2180=
4 =C2=B1 21%  softirqs.CPU57.RCU
     49647 =C2=B1  3%      -2.1%      48601 =C2=B1 19%      -0.4%      4944=
2 =C2=B1  6%  softirqs.CPU57.SCHED
      0.44 =C2=B1187%    +143.8%       1.08 =C2=B1233%    -100.0%       0.0=
0        softirqs.CPU57.TASKLET
    190.44 =C2=B1212%     +82.6%     347.75 =C2=B1 93%     -42.3%     109.8=
9 =C2=B1 76%  softirqs.CPU57.TIMER
      6.00 =C2=B1150%    +312.5%      24.75 =C2=B1212%    +177.8%      16.6=
7 =C2=B1136%  softirqs.CPU58.BLOCK
      1.33 =C2=B1180%  +13093.8%     175.92 =C2=B1312%   +4366.7%      59.5=
6 =C2=B1233%  softirqs.CPU58.NET_RX
      0.33 =C2=B1141%      +0.0%       0.33 =C2=B1141%     -66.7%       0.1=
1 =C2=B1282%  softirqs.CPU58.NET_TX
     20906 =C2=B1 20%     +11.7%      23343 =C2=B1 48%      -5.2%      1981=
5 =C2=B1 24%  softirqs.CPU58.RCU
     46451 =C2=B1 12%      +6.2%      49321 =C2=B1 12%      +8.9%      5059=
5 =C2=B1  2%  softirqs.CPU58.SCHED
      0.00       +2.9e+102%       2.92 =C2=B1331% +5.6e+101%       0.56 =C2=
=B1191%  softirqs.CPU58.TASKLET
     66.11 =C2=B1 48%    +123.1%     147.50 =C2=B1122%   +1255.0%     895.7=
8 =C2=B1249%  softirqs.CPU58.TIMER
      0.33 =C2=B1141%   +4175.0%      14.25 =C2=B1284%   +1000.0%       3.6=
7 =C2=B1273%  softirqs.CPU59.BLOCK
      0.67 =C2=B1187%   +3250.0%      22.33 =C2=B1262%   +2116.7%      14.7=
8 =C2=B1178%  softirqs.CPU59.NET_RX
      0.22 =C2=B1187%    +237.5%       0.75 =C2=B1155%      +0.0%       0.2=
2 =C2=B1187%  softirqs.CPU59.NET_TX
     20703 =C2=B1 21%     +14.0%      23604 =C2=B1 46%      +7.1%      2218=
0 =C2=B1 22%  softirqs.CPU59.RCU
     46586 =C2=B1 13%      +9.1%      50845 =C2=B1 10%      +8.0%      5029=
4 =C2=B1  4%  softirqs.CPU59.SCHED
      0.22 =C2=B1282%     +12.5%       0.25 =C2=B1331%    +300.0%       0.8=
9 =C2=B1282%  softirqs.CPU59.TASKLET
    224.89 =C2=B1172%     -27.4%     163.17 =C2=B1107%     -35.2%     145.6=
7 =C2=B1 49%  softirqs.CPU59.TIMER
      7.44 =C2=B1214%     -89.9%       0.75 =C2=B1293%     -83.6%       1.2=
2 =C2=B1210%  softirqs.CPU6.BLOCK
      5556 =C2=B1282%     -99.2%      42.50 =C2=B1316%     -98.4%      91.0=
0 =C2=B1165%  softirqs.CPU6.NET_RX
      0.11 =C2=B1282%     +50.0%       0.17 =C2=B1223%    +400.0%       0.5=
6 =C2=B1191%  softirqs.CPU6.NET_TX
     20684 =C2=B1 24%     +15.8%      23947 =C2=B1 53%      +4.1%      2153=
9 =C2=B1 19%  softirqs.CPU6.RCU
     50588 =C2=B1  2%      -1.9%      49627 =C2=B1 12%      -4.2%      4846=
6 =C2=B1 13%  softirqs.CPU6.SCHED
      2.11 =C2=B1282%     +18.4%       2.50 =C2=B1223%     -84.2%       0.3=
3 =C2=B1199%  softirqs.CPU6.TASKLET
    226.22 =C2=B1169%     +72.6%     390.50 =C2=B1199%     -77.9%      49.8=
9 =C2=B1 49%  softirqs.CPU6.TIMER
      3.44 =C2=B1252%     -32.3%       2.33 =C2=B1143%      +3.2%       3.5=
6 =C2=B1221%  softirqs.CPU60.BLOCK
    141.11 =C2=B1280%     -63.4%      51.58 =C2=B1288%     +13.5%     160.2=
2 =C2=B1142%  softirqs.CPU60.NET_RX
      0.67 =C2=B1 70%     -50.0%       0.33 =C2=B1141%     -66.7%       0.2=
2 =C2=B1187%  softirqs.CPU60.NET_TX
     21003 =C2=B1 23%      +5.1%      22068 =C2=B1 51%      +1.3%      2127=
6 =C2=B1 24%  softirqs.CPU60.RCU
     48251 =C2=B1  4%      +4.1%      50244 =C2=B1  5%      +5.1%      5070=
2 =C2=B1  3%  softirqs.CPU60.SCHED
      0.22 =C2=B1282%     +87.5%       0.42 =C2=B1182%    -100.0%       0.0=
0        softirqs.CPU60.TASKLET
    201.44 =C2=B1 95%    +121.0%     445.25 =C2=B1226%      -6.7%     188.0=
0 =C2=B1 59%  softirqs.CPU60.TIMER
      3.33 =C2=B1140%     +37.5%       4.58 =C2=B1215%    +153.3%       8.4=
4 =C2=B1160%  softirqs.CPU61.BLOCK
    101.78 =C2=B1277%     -26.5%      74.83 =C2=B1319%     -96.2%       3.8=
9 =C2=B1135%  softirqs.CPU61.NET_RX
      0.56 =C2=B1149%     -10.0%       0.50 =C2=B1129%      +0.0%       0.5=
6 =C2=B1 89%  softirqs.CPU61.NET_TX
     21236 =C2=B1 21%     +10.2%      23410 =C2=B1 49%      +0.8%      2141=
5 =C2=B1 23%  softirqs.CPU61.RCU
     47194 =C2=B1 11%      +8.3%      51129 =C2=B1  3%      +7.4%      5068=
5 =C2=B1  2%  softirqs.CPU61.SCHED
      3.00 =C2=B1248%     -16.7%       2.50 =C2=B1214%     -59.3%       1.2=
2 =C2=B1 92%  softirqs.CPU61.TASKLET
    115.22 =C2=B1117%    +167.9%     308.67 =C2=B1182%     +81.3%     208.8=
9 =C2=B1 67%  softirqs.CPU61.TIMER
     31.00 =C2=B1153%     -83.6%       5.08 =C2=B1235%     -59.1%      12.6=
7 =C2=B1282%  softirqs.CPU62.BLOCK
    179.00 =C2=B1213%    +155.4%     457.08 =C2=B1195%     -96.1%       7.0=
0 =C2=B1228%  softirqs.CPU62.NET_RX
      0.00       +5.8e+101%       0.58 =C2=B1147% +4.4e+101%       0.44 =C2=
=B1154%  softirqs.CPU62.NET_TX
     20841 =C2=B1 19%     +12.4%      23426 =C2=B1 49%      +5.7%      2202=
7 =C2=B1 20%  softirqs.CPU62.RCU
     49538 =C2=B1  3%      -0.1%      49489 =C2=B1 13%      +3.8%      5144=
1 =C2=B1  2%  softirqs.CPU62.SCHED
      1.89 =C2=B1247%     -69.1%       0.58 =C2=B1130%      +0.0%       1.8=
9 =C2=B1212%  softirqs.CPU62.TASKLET
    103.78 =C2=B1 56%    +345.6%     462.42 =C2=B1194%      +3.7%     107.6=
7 =C2=B1 70%  softirqs.CPU62.TIMER
      4.78 =C2=B1138%     -73.8%       1.25 =C2=B1308%     -97.7%       0.1=
1 =C2=B1282%  softirqs.CPU63.BLOCK
     90.11 =C2=B1264%     +54.0%     138.75 =C2=B1239%   +1030.1%       101=
8 =C2=B1282%  softirqs.CPU63.NET_RX
      0.33 =C2=B1200%     -25.0%       0.25 =C2=B1173%     -66.7%       0.1=
1 =C2=B1282%  softirqs.CPU63.NET_TX
     20934 =C2=B1 21%     +11.4%      23326 =C2=B1 47%      +3.2%      2160=
2 =C2=B1 23%  softirqs.CPU63.RCU
     49439 =C2=B1  4%      +2.5%      50673 =C2=B1  4%      +4.0%      5139=
8 =C2=B1  2%  softirqs.CPU63.SCHED
      1.78 =C2=B1229%    +125.0%       4.00 =C2=B1265%    -100.0%       0.0=
0        softirqs.CPU63.TASKLET
    109.22 =C2=B1 58%    +158.6%     282.50 =C2=B1171%    +269.9%     404.0=
0 =C2=B1146%  softirqs.CPU63.TIMER
      2.22 =C2=B1183%    +380.0%      10.67 =C2=B1309%    -100.0%       0.0=
0        softirqs.CPU64.BLOCK
     27.11 =C2=B1275%    +183.4%      76.83 =C2=B1313%     -87.3%       3.4=
4 =C2=B1161%  softirqs.CPU64.NET_RX
      0.22 =C2=B1187%     +50.0%       0.33 =C2=B1331%     -50.0%       0.1=
1 =C2=B1282%  softirqs.CPU64.NET_TX
     18361 =C2=B1 21%     +13.9%      20906 =C2=B1 54%      +0.8%      1851=
3 =C2=B1 21%  softirqs.CPU64.RCU
     50247 =C2=B1  2%      +2.7%      51620 =C2=B1  2%      +1.7%      5107=
9 =C2=B1  2%  softirqs.CPU64.SCHED
      0.22 =C2=B1282%    +612.5%       1.58 =C2=B1242%      +0.0%       0.2=
2 =C2=B1282%  softirqs.CPU64.TASKLET
    386.89 =C2=B1141%     -67.9%     124.00 =C2=B1127%     -65.9%     131.8=
9 =C2=B1105%  softirqs.CPU64.TIMER
      0.22 =C2=B1187%   +2225.0%       5.17 =C2=B1256%    -100.0%       0.0=
0        softirqs.CPU65.BLOCK
     10.11 =C2=B1198%    +339.3%      44.42 =C2=B1284%     -25.3%       7.5=
6 =C2=B1204%  softirqs.CPU65.NET_RX
      0.11 =C2=B1282%     +50.0%       0.17 =C2=B1223%    +100.0%       0.2=
2 =C2=B1187%  softirqs.CPU65.NET_TX
     17654 =C2=B1 18%     +16.4%      20540 =C2=B1 55%      +2.5%      1810=
2 =C2=B1 24%  softirqs.CPU65.RCU
     49228 =C2=B1  3%      +3.7%      51069 =C2=B1  4%      -0.8%      4884=
8 =C2=B1 16%  softirqs.CPU65.SCHED
      0.22 =C2=B1282%    +387.5%       1.08 =C2=B1278%    +750.0%       1.8=
9 =C2=B1282%  softirqs.CPU65.TASKLET
    200.00 =C2=B1 83%     -25.3%     149.33 =C2=B1 87%     +18.8%     237.5=
6 =C2=B1151%  softirqs.CPU65.TIMER
      5.11 =C2=B1269%     +53.3%       7.83 =C2=B1157%    +402.2%      25.6=
7 =C2=B1180%  softirqs.CPU66.BLOCK
     14.78 =C2=B1266%    +171.2%      40.08 =C2=B1327%     -12.0%      13.0=
0 =C2=B1264%  softirqs.CPU66.NET_RX
      0.22 =C2=B1282%     +50.0%       0.33 =C2=B1187%      +0.0%       0.2=
2 =C2=B1187%  softirqs.CPU66.NET_TX
     16719 =C2=B1 22%     +12.2%      18755 =C2=B1 53%      +6.7%      1783=
2 =C2=B1 24%  softirqs.CPU66.RCU
     46999 =C2=B1 14%      +5.3%      49508 =C2=B1  8%      +4.7%      4919=
9 =C2=B1  9%  softirqs.CPU66.SCHED
      0.00          -100.0%       0.00       +3.3e+101%       0.33 =C2=B128=
2%  softirqs.CPU66.TASKLET
      1302 =C2=B1180%     -50.6%     643.58 =C2=B1241%     -85.8%     185.1=
1 =C2=B1 89%  softirqs.CPU66.TIMER
      6.11 =C2=B1217%     +28.2%       7.83 =C2=B1170%     +20.0%       7.3=
3 =C2=B1216%  softirqs.CPU67.BLOCK
      9.44 =C2=B1143%   +1015.3%     105.33 =C2=B1306%     -97.6%       0.2=
2 =C2=B1282%  softirqs.CPU67.NET_RX
      0.89 =C2=B1134%     -71.9%       0.25 =C2=B1173%    -100.0%       0.0=
0        softirqs.CPU67.NET_TX
     17631 =C2=B1 20%     +11.2%      19609 =C2=B1 52%      -0.3%      1757=
6 =C2=B1 25%  softirqs.CPU67.RCU
     45003 =C2=B1 20%     +14.4%      51465 =C2=B1  4%      +7.9%      4853=
7 =C2=B1 15%  softirqs.CPU67.SCHED
      2.22 =C2=B1162%     -43.8%       1.25 =C2=B1331%     -35.0%       1.4=
4 =C2=B1282%  softirqs.CPU67.TASKLET
    705.78 =C2=B1132%     -79.2%     146.67 =C2=B1 89%     -52.8%     333.2=
2 =C2=B1149%  softirqs.CPU67.TIMER
      4.78 =C2=B1275%     +20.3%       5.75 =C2=B1261%    -100.0%       0.0=
0        softirqs.CPU68.BLOCK
     66.56 =C2=B1257%     -92.7%       4.83 =C2=B1258%     +19.5%      79.5=
6 =C2=B1275%  softirqs.CPU68.NET_RX
      4.44 =C2=B1274%     -94.4%       0.25 =C2=B1238%     -90.0%       0.4=
4 =C2=B1154%  softirqs.CPU68.NET_TX
     18043 =C2=B1 22%     +15.3%      20800 =C2=B1 56%      +2.7%      1853=
0 =C2=B1 21%  softirqs.CPU68.RCU
     47181 =C2=B1 13%     +10.4%      52110 =C2=B1  2%      +7.7%      5082=
1 =C2=B1  4%  softirqs.CPU68.SCHED
      2.33 =C2=B1282%     -78.6%       0.50 =C2=B1173%    -100.0%       0.0=
0        softirqs.CPU68.TASKLET
     88.56 =C2=B1 56%    +768.4%     769.00 =C2=B1177%    +227.9%     290.3=
3 =C2=B1170%  softirqs.CPU68.TIMER
      0.00       +6.7e+101%       0.67 =C2=B1331%   +1e+102%       1.00 =C2=
=B1249%  softirqs.CPU69.BLOCK
      1.11 =C2=B1166%    +380.0%       5.33 =C2=B1177%   +6210.0%      70.1=
1 =C2=B1275%  softirqs.CPU69.NET_RX
      0.22 =C2=B1282%     +87.5%       0.42 =C2=B1182%     +50.0%       0.3=
3 =C2=B1199%  softirqs.CPU69.NET_TX
     18237 =C2=B1 20%     +12.2%      20456 =C2=B1 58%      +1.0%      1842=
5 =C2=B1 21%  softirqs.CPU69.RCU
     48624 =C2=B1  6%      +3.3%      50227 =C2=B1  6%      -1.4%      4792=
4 =C2=B1 11%  softirqs.CPU69.SCHED
      0.00       +2.5e+101%       0.25 =C2=B1238%    -100.0%       0.00    =
    softirqs.CPU69.TASKLET
    334.78 =C2=B1137%     -60.8%     131.33 =C2=B1 46%     -72.4%      92.5=
6 =C2=B1 70%  softirqs.CPU69.TIMER
      7.56 =C2=B1157%     -92.3%       0.58 =C2=B1283%     -29.4%       5.3=
3 =C2=B1244%  softirqs.CPU7.BLOCK
      0.89 =C2=B1245%    +659.4%       6.75 =C2=B1280%    +437.5%       4.7=
8 =C2=B1151%  softirqs.CPU7.NET_RX
      0.00       +8.3e+100%       0.08 =C2=B1331% +3.3e+101%       0.33 =C2=
=B1282%  softirqs.CPU7.NET_TX
     20425 =C2=B1 20%     +14.5%      23387 =C2=B1 52%      +1.3%      2069=
6 =C2=B1 22%  softirqs.CPU7.RCU
     49348 =C2=B1  4%      -0.1%      49313 =C2=B1 13%      +0.5%      4957=
8 =C2=B1  9%  softirqs.CPU7.SCHED
      0.56 =C2=B1172%     -40.0%       0.33 =C2=B1223%     -80.0%       0.1=
1 =C2=B1282%  softirqs.CPU7.TASKLET
    172.56 =C2=B1124%    +111.2%     364.42 =C2=B1183%     +86.9%     322.4=
4 =C2=B1218%  softirqs.CPU7.TIMER
      1.78 =C2=B1263%     -20.3%       1.42 =C2=B1224%      +0.0%       1.7=
8 =C2=B1245%  softirqs.CPU70.BLOCK
      3.00 =C2=B1191%  +23094.4%     695.83 =C2=B1330%   +3229.6%      99.8=
9 =C2=B1177%  softirqs.CPU70.NET_RX
      0.22 =C2=B1282%     +12.5%       0.25 =C2=B1173%      +0.0%       0.2=
2 =C2=B1282%  softirqs.CPU70.NET_TX
     17653 =C2=B1 20%     +15.5%      20391 =C2=B1 56%      -3.3%      1707=
1 =C2=B1 30%  softirqs.CPU70.RCU
     49553 =C2=B1  3%      -8.3%      45424 =C2=B1 21%      +3.0%      5103=
4        softirqs.CPU70.SCHED
      2.33 =C2=B1239%     -85.7%       0.33 =C2=B1187%     -76.2%       0.5=
6 =C2=B1191%  softirqs.CPU70.TASKLET
    421.78 =C2=B1245%    +164.7%       1116 =C2=B1206%    +430.9%       223=
9 =C2=B1185%  softirqs.CPU70.TIMER
      7.78 =C2=B1191%     -81.8%       1.42 =C2=B1271%     -78.6%       1.6=
7 =C2=B1241%  softirqs.CPU71.BLOCK
      2.67 =C2=B1231%  +71793.8%       1917 =C2=B1320%   +3870.8%     105.8=
9 =C2=B1281%  softirqs.CPU71.NET_RX
      0.22 =C2=B1187%     -62.5%       0.08 =C2=B1331%     -50.0%       0.1=
1 =C2=B1282%  softirqs.CPU71.NET_TX
     18238 =C2=B1 19%     +12.2%      20454 =C2=B1 55%      +1.7%      1854=
8 =C2=B1 20%  softirqs.CPU71.RCU
     48137 =C2=B1  7%      +2.1%      49163 =C2=B1 12%      +6.4%      5123=
6 =C2=B1  2%  softirqs.CPU71.SCHED
      0.00       +5.7e+102%       5.67 =C2=B1248% +1.1e+101%       0.11 =C2=
=B1282%  softirqs.CPU71.TASKLET
    501.22 =C2=B1163%     -20.6%     398.00 =C2=B1171%     -62.0%     190.4=
4 =C2=B1125%  softirqs.CPU71.TIMER
      6.00 =C2=B1156%    +158.3%      15.50 =C2=B1225%     -40.7%       3.5=
6 =C2=B1245%  softirqs.CPU72.BLOCK
      6.78 =C2=B1198%     -47.1%       3.58 =C2=B1265%  +53473.8%       363=
1 =C2=B1281%  softirqs.CPU72.NET_RX
      0.00       +3.6e+102%       3.58 =C2=B1298% +4.4e+102%       4.44 =C2=
=B1282%  softirqs.CPU72.NET_TX
     18811 =C2=B1 19%     +13.1%      21281 =C2=B1 56%      -9.5%      1701=
8 =C2=B1 24%  softirqs.CPU72.RCU
     51911 =C2=B1  2%      +0.2%      51997            -4.3%      49701 =C2=
=B1  3%  softirqs.CPU72.SCHED
      0.11 =C2=B1282%    +575.0%       0.75 =C2=B1238%    -100.0%       0.0=
0        softirqs.CPU72.TASKLET
    163.22 =C2=B1205%      +8.4%     177.00 =C2=B1 81%     -42.9%      93.2=
2 =C2=B1 93%  softirqs.CPU72.TIMER
     15.56 =C2=B1278%     -97.3%       0.42 =C2=B1228%     +22.1%      19.0=
0 =C2=B1176%  softirqs.CPU73.BLOCK
     94.22 =C2=B1282%     -61.0%      36.75 =C2=B1329%     -70.2%      28.1=
1 =C2=B1252%  softirqs.CPU73.NET_RX
      0.00          -100.0%       0.00       +1.1e+101%       0.11 =C2=B128=
2%  softirqs.CPU73.NET_TX
     17225 =C2=B1 17%     +18.7%      20450 =C2=B1 56%      -4.8%      1640=
1 =C2=B1 24%  softirqs.CPU73.RCU
     50971 =C2=B1  4%      +1.3%      51651 =C2=B1  3%      -5.5%      4815=
8 =C2=B1  5%  softirqs.CPU73.SCHED
      1.44 =C2=B1282%    -100.0%       0.00            +0.0%       1.44 =C2=
=B1219%  softirqs.CPU73.TASKLET
    284.67 =C2=B1180%     -32.5%     192.08 =C2=B1154%     -55.0%     128.1=
1 =C2=B1 84%  softirqs.CPU73.TIMER
     24.00 =C2=B1282%     -98.3%       0.42 =C2=B1153%     -96.8%       0.7=
8 =C2=B1240%  softirqs.CPU74.BLOCK
     60.89 =C2=B1282%     -88.9%       6.75 =C2=B1242%     -27.0%      44.4=
4 =C2=B1279%  softirqs.CPU74.NET_RX
      0.00          -100.0%       0.00       +1.1e+101%       0.11 =C2=B128=
2%  softirqs.CPU74.NET_TX
     17655 =C2=B1 14%     +18.6%      20931 =C2=B1 60%      -6.8%      1646=
1 =C2=B1 23%  softirqs.CPU74.RCU
     51131 =C2=B1  3%      +1.6%      51924 =C2=B1  3%      -2.6%      4978=
5 =C2=B1  6%  softirqs.CPU74.SCHED
      0.67 =C2=B1282%     -87.5%       0.08 =C2=B1331%     -83.3%       0.1=
1 =C2=B1282%  softirqs.CPU74.TASKLET
    989.67 =C2=B1256%     +14.5%       1133 =C2=B1244%     -73.7%     259.8=
9 =C2=B1144%  softirqs.CPU74.TIMER
      2.89 =C2=B1187%      -4.8%       2.75 =C2=B1290%    +819.2%      26.5=
6 =C2=B1148%  softirqs.CPU75.BLOCK
      0.00       +3.3e+101%       0.33 =C2=B1331% +7.1e+103%      71.33 =C2=
=B1243%  softirqs.CPU75.NET_RX
     17115 =C2=B1 16%     +18.2%      20225 =C2=B1 57%      -3.4%      1653=
2 =C2=B1 22%  softirqs.CPU75.RCU
     51071 =C2=B1  3%      -1.3%      50404 =C2=B1  6%      -3.6%      4921=
7 =C2=B1  2%  softirqs.CPU75.SCHED
      0.00       +8.3e+100%       0.08 =C2=B1331%   +5e+102%       5.00 =C2=
=B1184%  softirqs.CPU75.TASKLET
    248.56 =C2=B1234%     -73.6%      65.58 =C2=B1 85%     -30.4%     172.8=
9 =C2=B1208%  softirqs.CPU75.TIMER
      5.56 =C2=B1270%     +42.5%       7.92 =C2=B1252%     -64.0%       2.0=
0 =C2=B1141%  softirqs.CPU76.BLOCK
      5.44 =C2=B1282%    +686.7%      42.83 =C2=B1330%    +740.8%      45.7=
8 =C2=B1282%  softirqs.CPU76.NET_RX
      0.22 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU76.NET_TX
     18363 =C2=B1 19%     +16.4%      21372 =C2=B1 58%      -8.1%      1688=
0 =C2=B1 23%  softirqs.CPU76.RCU
     51183 =C2=B1  3%      +0.6%      51507 =C2=B1  4%      -3.7%      4931=
3 =C2=B1  2%  softirqs.CPU76.SCHED
      0.11 =C2=B1282%   +4775.0%       5.42 =C2=B1331%    -100.0%       0.0=
0        softirqs.CPU76.TASKLET
     84.33 =C2=B1141%    +383.6%     407.83 =C2=B1277%     -54.2%      38.6=
7 =C2=B1 81%  softirqs.CPU76.TIMER
     16.00 =C2=B1212%     -90.6%       1.50 =C2=B1331%     -73.6%       4.2=
2 =C2=B1274%  softirqs.CPU77.BLOCK
      1.89 =C2=B1282%    +822.1%      17.42 =C2=B1308%  +4.2e+05%       794=
1 =C2=B1250%  softirqs.CPU77.NET_RX
      0.00       +8.3e+100%       0.08 =C2=B1331%    -100.0%       0.00    =
    softirqs.CPU77.NET_TX
     18240 =C2=B1 19%     +20.5%      21987 =C2=B1 57%     -10.3%      1636=
2 =C2=B1 27%  softirqs.CPU77.RCU
     49828 =C2=B1  9%      +0.6%      50104 =C2=B1 11%      -0.1%      4975=
6 =C2=B1  3%  softirqs.CPU77.SCHED
      0.00       +8.3e+100%       0.08 =C2=B1331%    -100.0%       0.00    =
    softirqs.CPU77.TASKLET
    843.33 =C2=B1245%     -84.6%     130.00 =C2=B1183%     +51.1%       127=
4 =C2=B1191%  softirqs.CPU77.TIMER
      8.56 =C2=B1258%     -24.0%       6.50 =C2=B1327%    +258.4%      30.6=
7 =C2=B1160%  softirqs.CPU78.BLOCK
      0.11 =C2=B1282%   +1550.0%       1.83 =C2=B1331%    +500.0%       0.6=
7 =C2=B1282%  softirqs.CPU78.NET_RX
      0.00       +1.7e+101%       0.17 =C2=B1331%    -100.0%       0.00    =
    softirqs.CPU78.NET_TX
     17327 =C2=B1 18%     +15.8%      20059 =C2=B1 55%      -5.2%      1643=
3 =C2=B1 24%  softirqs.CPU78.RCU
     50752 =C2=B1  4%      +1.6%      51546 =C2=B1  3%      -5.1%      4816=
0 =C2=B1  3%  softirqs.CPU78.SCHED
      0.11 =C2=B1282%     -25.0%       0.08 =C2=B1331%    -100.0%       0.0=
0        softirqs.CPU78.TASKLET
     80.00 =C2=B1130%     -41.5%      46.83 =C2=B1 95%      +3.3%      82.6=
7 =C2=B1 90%  softirqs.CPU78.TIMER
      0.78 =C2=B1240%     -46.4%       0.42 =C2=B1331%    -100.0%       0.0=
0        softirqs.CPU79.BLOCK
    321.33 =C2=B1149%     -63.1%     118.50 =C2=B1310%    -100.0%       0.0=
0        softirqs.CPU79.NET_RX
     18585 =C2=B1 18%     +15.3%      21429 =C2=B1 57%      -9.5%      1682=
4 =C2=B1 23%  softirqs.CPU79.RCU
     50722 =C2=B1  3%      +2.0%      51726 =C2=B1  2%      -3.7%      4884=
8 =C2=B1  2%  softirqs.CPU79.SCHED
      1.56 =C2=B1196%     -89.3%       0.17 =C2=B1331%    -100.0%       0.0=
0        softirqs.CPU79.TASKLET
     66.22 =C2=B1122%     -45.3%      36.25 =C2=B1 92%     -32.7%      44.5=
6 =C2=B1106%  softirqs.CPU79.TIMER
      5.78 =C2=B1195%     -36.5%       3.67 =C2=B1229%    +407.7%      29.3=
3 =C2=B1214%  softirqs.CPU8.BLOCK
      1.44 =C2=B1166%     -82.7%       0.25 =C2=B1173%   +3592.3%      53.3=
3 =C2=B1253%  softirqs.CPU8.NET_RX
      0.33 =C2=B1199%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU8.NET_TX
     21261 =C2=B1 19%      +9.2%      23211 =C2=B1 48%      +2.2%      2173=
4 =C2=B1 22%  softirqs.CPU8.RCU
     43950 =C2=B1 20%     +16.7%      51281 =C2=B1 15%     +14.8%      5046=
9 =C2=B1 22%  softirqs.CPU8.SCHED
      0.11 =C2=B1282%     -25.0%       0.08 =C2=B1331%    -100.0%       0.0=
0        softirqs.CPU8.TASKLET
    199.33 =C2=B1180%     -72.3%      55.25 =C2=B1 78%    +173.0%     544.2=
2 =C2=B1174%  softirqs.CPU8.TIMER
      0.78 =C2=B1282%    +103.6%       1.58 =C2=B1295%   +1685.7%      13.8=
9 =C2=B1241%  softirqs.CPU80.BLOCK
     17.33 =C2=B1282%      -1.4%      17.08 =C2=B1329%    +301.9%      69.6=
7 =C2=B1270%  softirqs.CPU80.NET_RX
     23593 =C2=B1 22%     +15.0%      27127 =C2=B1 58%     -20.4%      1879=
1 =C2=B1 22%  softirqs.CPU80.RCU
     51390 =C2=B1  2%      -5.5%      48538 =C2=B1 15%      -2.7%      4999=
5        softirqs.CPU80.SCHED
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU80.TASKLET
    107.00 =C2=B1132%     -52.8%      50.50 =C2=B1116%     -38.6%      65.6=
7 =C2=B1113%  softirqs.CPU80.TIMER
     18.33 =C2=B1183%     -96.8%       0.58 =C2=B1247%     -70.9%       5.3=
3 =C2=B1282%  softirqs.CPU81.BLOCK
      0.11 =C2=B1282%   +1175.0%       1.42 =C2=B1245%  +54100.0%      60.2=
2 =C2=B1261%  softirqs.CPU81.NET_RX
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU81.NET_TX
     21889 =C2=B1 20%     +17.1%      25637 =C2=B1 56%     -14.9%      1861=
9 =C2=B1 21%  softirqs.CPU81.RCU
     50839 =C2=B1  4%      +0.2%      50926 =C2=B1  5%      -6.1%      4771=
7 =C2=B1  4%  softirqs.CPU81.SCHED
      0.11 =C2=B1282%     -25.0%       0.08 =C2=B1331%    -100.0%       0.0=
0        softirqs.CPU81.TASKLET
     99.00 =C2=B1 87%     -49.6%      49.92 =C2=B1114%     -39.2%      60.2=
2 =C2=B1 75%  softirqs.CPU81.TIMER
      9.89 =C2=B1193%     -99.2%       0.08 =C2=B1331%     -77.5%       2.2=
2 =C2=B1223%  softirqs.CPU82.BLOCK
      0.11 =C2=B1282%   +1250.0%       1.50 =C2=B1312%  +51200.0%      57.0=
0 =C2=B1282%  softirqs.CPU82.NET_RX
     22805 =C2=B1 20%     +16.6%      26581 =C2=B1 55%     -16.3%      1907=
6 =C2=B1 22%  softirqs.CPU82.RCU
     51203 =C2=B1  3%      +1.5%      51948 =C2=B1  3%      -4.2%      4903=
6 =C2=B1  3%  softirqs.CPU82.SCHED
      0.11 =C2=B1282%   +2750.0%       3.17 =C2=B1331%    -100.0%       0.0=
0        softirqs.CPU82.TASKLET
     79.67 =C2=B1 94%     -53.0%      37.42 =C2=B1142%     -23.7%      60.7=
8 =C2=B1 97%  softirqs.CPU82.TIMER
     22.56 =C2=B1195%     -61.9%       8.58 =C2=B1182%     -87.7%       2.7=
8 =C2=B1282%  softirqs.CPU83.BLOCK
     73.44 =C2=B1200%     -83.3%      12.25 =C2=B1321%     -39.2%      44.6=
7 =C2=B1203%  softirqs.CPU83.NET_RX
     22459 =C2=B1 20%     +17.4%      26362 =C2=B1 57%     -13.4%      1945=
9 =C2=B1 22%  softirqs.CPU83.RCU
     49530 =C2=B1  8%      +4.6%      51808 =C2=B1  2%      -1.6%      4873=
2 =C2=B1  5%  softirqs.CPU83.SCHED
     28.44 =C2=B1 35%     +87.2%      53.25 =C2=B1135%    +105.5%      58.4=
4 =C2=B1109%  softirqs.CPU83.TIMER
      1.89 =C2=B1166%    +147.1%       4.67 =C2=B1300%    -100.0%       0.0=
0        softirqs.CPU84.BLOCK
      0.00          -100.0%       0.00       +1.9e+103%      18.67 =C2=B118=
7%  softirqs.CPU84.NET_RX
     20524 =C2=B1 20%     +12.4%      23060 =C2=B1 53%      -5.6%      1938=
0 =C2=B1 24%  softirqs.CPU84.RCU
     50684 =C2=B1  4%      -4.9%      48189 =C2=B1 14%      -9.4%      4589=
6 =C2=B1 14%  softirqs.CPU84.SCHED
    210.56 =C2=B1225%     -78.3%      45.75 =C2=B1123%     -62.1%      79.7=
8 =C2=B1 92%  softirqs.CPU84.TIMER
      4.00 =C2=B1227%     +20.8%       4.83 =C2=B1257%    +180.6%      11.2=
2 =C2=B1173%  softirqs.CPU85.BLOCK
     18.89 =C2=B1187%    +449.7%     103.83 =C2=B1222%     -95.3%       0.8=
9 =C2=B1282%  softirqs.CPU85.NET_RX
      0.00          -100.0%       0.00       +1.1e+101%       0.11 =C2=B128=
2%  softirqs.CPU85.NET_TX
     22675 =C2=B1 22%     +12.8%      25586 =C2=B1 56%     -17.4%      1872=
2 =C2=B1 24%  softirqs.CPU85.RCU
     50500 =C2=B1  4%      +2.5%      51753 =C2=B1  3%      -4.6%      4815=
9 =C2=B1  3%  softirqs.CPU85.SCHED
      0.00          -100.0%       0.00       +5.2e+102%       5.22 =C2=B127=
6%  softirqs.CPU85.TASKLET
    192.44 =C2=B1212%     -55.7%      85.33 =C2=B1162%     -56.6%      83.4=
4 =C2=B1130%  softirqs.CPU85.TIMER
     28.78 =C2=B1205%     -95.1%       1.42 =C2=B1183%     -20.5%      22.8=
9 =C2=B1154%  softirqs.CPU86.BLOCK
      0.00       +9.4e+103%      93.58 =C2=B1239%    -100.0%       0.00    =
    softirqs.CPU86.NET_RX
     23468 =C2=B1 23%     +17.7%      27632 =C2=B1 59%     -18.7%      1907=
9 =C2=B1 22%  softirqs.CPU86.RCU
     51158 =C2=B1  3%      +1.5%      51945 =C2=B1  2%      -3.2%      4952=
5 =C2=B1  2%  softirqs.CPU86.SCHED
      1.67 =C2=B1282%     -95.0%       0.08 =C2=B1331%     -93.3%       0.1=
1 =C2=B1282%  softirqs.CPU86.TASKLET
    112.44 =C2=B1145%     -48.3%      58.17 =C2=B1122%     -30.9%      77.6=
7 =C2=B1 81%  softirqs.CPU86.TIMER
      5.11 =C2=B1179%     +67.9%       8.58 =C2=B1293%    +154.3%      13.0=
0 =C2=B1259%  softirqs.CPU87.BLOCK
     19.22 =C2=B1282%     -92.2%       1.50 =C2=B1312%     -80.9%       3.6=
7 =C2=B1282%  softirqs.CPU87.NET_RX
      0.00          -100.0%       0.00       +3.3e+101%       0.33 =C2=B128=
2%  softirqs.CPU87.NET_TX
     20720 =C2=B1 19%     +17.6%      24371 =C2=B1 55%      -8.6%      1893=
5 =C2=B1 20%  softirqs.CPU87.RCU
     50865 =C2=B1  3%      +1.5%      51645 =C2=B1  3%      -3.1%      4927=
2 =C2=B1  2%  softirqs.CPU87.SCHED
      0.00          -100.0%       0.00       +3.3e+102%       3.33 =C2=B125=
2%  softirqs.CPU87.TASKLET
    181.33 =C2=B1161%     -49.3%      92.00 =C2=B1 79%     +25.9%     228.2=
2 =C2=B1216%  softirqs.CPU87.TIMER
      7.78 =C2=B1225%      -6.8%       7.25 =C2=B1278%     -67.1%       2.5=
6 =C2=B1282%  softirqs.CPU88.BLOCK
    287.44 =C2=B1282%     -81.0%      54.58 =C2=B1297%     -90.9%      26.2=
2 =C2=B1282%  softirqs.CPU88.NET_RX
      0.22 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU88.NET_TX
     23299 =C2=B1 20%     +14.6%      26695 =C2=B1 54%     -18.0%      1910=
6 =C2=B1 24%  softirqs.CPU88.RCU
     51078 =C2=B1  4%      +1.6%      51904 =C2=B1  2%      -4.8%      4862=
2 =C2=B1  9%  softirqs.CPU88.SCHED
      0.00          -100.0%       0.00       +2.1e+102%       2.11 =C2=B128=
2%  softirqs.CPU88.TASKLET
     60.56 =C2=B1120%    +252.2%     213.25 =C2=B1226%    +292.1%     237.4=
4 =C2=B1220%  softirqs.CPU88.TIMER
      5.33 =C2=B1243%     -25.0%       4.00 =C2=B1288%     -85.4%       0.7=
8 =C2=B1240%  softirqs.CPU89.BLOCK
      6.67 =C2=B1247%    +271.2%      24.75 =C2=B1331%     -96.7%       0.2=
2 =C2=B1187%  softirqs.CPU89.NET_RX
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU89.NET_TX
     23476 =C2=B1 24%     +17.6%      27608 =C2=B1 57%     -16.3%      1963=
9 =C2=B1 24%  softirqs.CPU89.RCU
     49036 =C2=B1 14%      +5.6%      51782 =C2=B1  3%      +0.5%      4928=
0 =C2=B1  2%  softirqs.CPU89.SCHED
      0.00          -100.0%       0.00       +4.4e+101%       0.44 =C2=B128=
2%  softirqs.CPU89.TASKLET
    128.11 =C2=B1109%     -45.8%      69.42 =C2=B1 93%     -41.8%      74.5=
6 =C2=B1 93%  softirqs.CPU89.TIMER
      8.44 =C2=B1188%    -100.0%       0.00           -68.4%       2.67 =C2=
=B1200%  softirqs.CPU9.BLOCK
     72.44 =C2=B1230%    +685.1%     568.75 =C2=B1226%     -99.4%       0.4=
4 =C2=B1111%  softirqs.CPU9.NET_RX
      0.33 =C2=B1200%     -50.0%       0.17 =C2=B1223%     -66.7%       0.1=
1 =C2=B1282%  softirqs.CPU9.NET_TX
     20699 =C2=B1 24%     +15.2%      23836 =C2=B1 41%      +2.1%      2114=
0 =C2=B1 21%  softirqs.CPU9.RCU
     50649 =C2=B1  2%      +3.6%      52473            -2.9%      49177 =C2=
=B1  8%  softirqs.CPU9.SCHED
      2.89 =C2=B1216%     -39.4%       1.75 =C2=B1298%    -100.0%       0.0=
0        softirqs.CPU9.TASKLET
     92.22 =C2=B1 78%   +1024.8%       1037 =C2=B1242%     -23.3%      70.7=
8 =C2=B1 75%  softirqs.CPU9.TIMER
      8.11 =C2=B1261%     +54.1%      12.50 =C2=B1319%     -95.9%       0.3=
3 =C2=B1200%  softirqs.CPU90.BLOCK
    359.11 =C2=B1282%   +1414.5%       5438 =C2=B1331%    -100.0%       0.0=
0        softirqs.CPU90.NET_RX
     19034 =C2=B1 22%      +6.5%      20270 =C2=B1 49%      -1.0%      1884=
3 =C2=B1 22%  softirqs.CPU90.RCU
     50884 =C2=B1  4%      +0.9%      51339 =C2=B1  2%      -5.3%      4819=
9 =C2=B1  3%  softirqs.CPU90.SCHED
      0.00       +8.3e+100%       0.08 =C2=B1331% +1.1e+101%       0.11 =C2=
=B1282%  softirqs.CPU90.TASKLET
     95.67 =C2=B1125%     -13.3%      82.92 =C2=B1 80%     -44.4%      53.2=
2 =C2=B1117%  softirqs.CPU90.TIMER
      0.56 =C2=B1282%   +1640.0%       9.67 =C2=B1214%   +5420.0%      30.6=
7 =C2=B1226%  softirqs.CPU91.BLOCK
      6891 =C2=B1282%    -100.0%       0.08 =C2=B1331%    -100.0%       0.0=
0        softirqs.CPU91.NET_RX
      0.33 =C2=B1199%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU91.NET_TX
     19717 =C2=B1 20%     +15.3%      22737 =C2=B1 52%      -5.3%      1866=
3 =C2=B1 21%  softirqs.CPU91.RCU
     51094 =C2=B1  3%      +1.3%      51781 =C2=B1  2%      -2.9%      4963=
4 =C2=B1  4%  softirqs.CPU91.SCHED
      0.00       +8.3e+100%       0.08 =C2=B1331% +1.1e+101%       0.11 =C2=
=B1282%  softirqs.CPU91.TASKLET
    131.78 =C2=B1134%     +45.1%     191.25 =C2=B1222%     +60.6%     211.6=
7 =C2=B1217%  softirqs.CPU91.TIMER
      0.22 =C2=B1282%   +2712.5%       6.25 =C2=B1229%   +3600.0%       8.2=
2 =C2=B1261%  softirqs.CPU92.BLOCK
      0.33 =C2=B1282%     -25.0%       0.25 =C2=B1331%   +6000.0%      20.3=
3 =C2=B1272%  softirqs.CPU92.NET_RX
     23495 =C2=B1 23%     +16.3%      27316 =C2=B1 57%     -16.7%      1958=
1 =C2=B1 25%  softirqs.CPU92.RCU
     51247 =C2=B1  2%      -2.5%      49961 =C2=B1 12%      -5.7%      4832=
3 =C2=B1  8%  softirqs.CPU92.SCHED
     74.78 =C2=B1122%     -41.9%      43.42 =C2=B1 75%     -38.2%      46.2=
2 =C2=B1134%  softirqs.CPU92.TIMER
     16.89 =C2=B1280%     -97.5%       0.42 =C2=B1331%     -80.3%       3.3=
3 =C2=B1251%  softirqs.CPU93.BLOCK
      1368 =C2=B1206%     -83.4%     227.08 =C2=B1327%    -100.0%       0.0=
0        softirqs.CPU93.NET_RX
     22947 =C2=B1 24%     +16.2%      26665 =C2=B1 57%     -17.3%      1897=
3 =C2=B1 23%  softirqs.CPU93.RCU
     50793 =C2=B1  3%      +1.9%      51751 =C2=B1  2%      -4.0%      4876=
6 =C2=B1  3%  softirqs.CPU93.SCHED
      0.00       +1.3e+102%       1.33 =C2=B1331% +1.6e+102%       1.56 =C2=
=B1260%  softirqs.CPU93.TASKLET
    360.44 =C2=B1227%     -77.2%      82.08 =C2=B1193%     -90.4%      34.6=
7 =C2=B1 83%  softirqs.CPU93.TIMER
      0.78 =C2=B1169%     -25.0%       0.58 =C2=B1203%    +200.0%       2.3=
3 =C2=B1198%  softirqs.CPU94.BLOCK
     23193 =C2=B1 23%     +16.4%      26990 =C2=B1 57%     -16.6%      1933=
5 =C2=B1 23%  softirqs.CPU94.RCU
     51088 =C2=B1  3%      +1.8%      52010 =C2=B1  2%      -4.0%      4906=
7 =C2=B1  2%  softirqs.CPU94.SCHED
      0.00       +1.7e+101%       0.17 =C2=B1223% +4.8e+102%       4.78 =C2=
=B1254%  softirqs.CPU94.TASKLET
     76.78 =C2=B1122%    +233.1%     255.75 =C2=B1202%     +20.3%      92.3=
3 =C2=B1145%  softirqs.CPU94.TIMER
      6.89 =C2=B1244%     +40.3%       9.67 =C2=B1192%     -35.5%       4.4=
4 =C2=B1195%  softirqs.CPU95.BLOCK
      0.22 =C2=B1187%   +1437.5%       3.42 =C2=B1305%      +0.0%       0.2=
2 =C2=B1187%  softirqs.CPU95.NET_TX
     22570 =C2=B1 19%     +16.1%      26201 =C2=B1 52%     -13.0%      1964=
2 =C2=B1 24%  softirqs.CPU95.RCU
     41358 =C2=B1 28%     -15.6%      34889 =C2=B1 27%      -2.6%      4027=
6 =C2=B1 25%  softirqs.CPU95.SCHED
      3.11 =C2=B1196%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU95.TASKLET
     71.89 =C2=B1 61%    +450.6%     395.83 =C2=B1142%    +120.7%     158.6=
7 =C2=B1 86%  softirqs.CPU95.TIMER
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.HI
     32269 =C2=B1 81%     -15.2%      27360 =C2=B1102%      -3.4%      3115=
6 =C2=B1 92%  softirqs.NET_RX
     59.44 =C2=B1  2%      -2.6%      57.92 =C2=B1  2%      +3.6%      61.5=
6 =C2=B1  8%  softirqs.NET_TX
   1949585 =C2=B1 18%     +14.8%    2237679 =C2=B1 53%      -5.0%    185298=
2 =C2=B1 21%  softirqs.RCU
   4756610            +1.6%    4831530 =C2=B1  2%      -0.3%    4741884    =
    softirqs.SCHED
    860.44            -0.0%     860.42            -0.2%     858.44        s=
oftirqs.TASKLET
     30885 =C2=B1  9%      +4.3%      32212 =C2=B1 27%      -2.9%      2999=
5 =C2=B1 13%  softirqs.TIMER
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.0:IO-APIC.2-edge.timer
     48.11 =C2=B1282%     -32.4%      32.50 =C2=B1264%     -92.4%       3.6=
7 =C2=B1254%  interrupts.100:PCI-MSI.31981633-edge.i40e-eth0-TxRx-64
     16.33 =C2=B1192%    +428.1%      86.25 =C2=B1293%     -12.2%      14.3=
3 =C2=B1208%  interrupts.101:PCI-MSI.31981634-edge.i40e-eth0-TxRx-65
     28.11 =C2=B1282%    +161.2%      73.42 =C2=B1330%     -32.4%      19.0=
0 =C2=B1262%  interrupts.102:PCI-MSI.31981635-edge.i40e-eth0-TxRx-66
     18.67 =C2=B1152%    +954.9%     196.92 =C2=B1307%     -97.6%       0.4=
4 =C2=B1187%  interrupts.103:PCI-MSI.31981636-edge.i40e-eth0-TxRx-67
     74.67 =C2=B1251%     -90.4%       7.17 =C2=B1331%    +108.2%     155.4=
4 =C2=B1282%  interrupts.104:PCI-MSI.31981637-edge.i40e-eth0-TxRx-68
      0.00       +8.6e+102%       8.58 =C2=B1229%   +1e+104%     100.11 =C2=
=B1282%  interrupts.105:PCI-MSI.31981638-edge.i40e-eth0-TxRx-69
      4.33 =C2=B1282%  +32007.7%       1391 =C2=B1330%   +2859.0%     128.2=
2 =C2=B1198%  interrupts.106:PCI-MSI.31981639-edge.i40e-eth0-TxRx-70
      3.78 =C2=B1264%  +92041.9%       3480 =C2=B1319%   +5494.1%     211.3=
3 =C2=B1282%  interrupts.107:PCI-MSI.31981640-edge.i40e-eth0-TxRx-71
     13.44 =C2=B1200%     -54.1%       6.17 =C2=B1307%  +53891.7%       725=
8 =C2=B1282%  interrupts.108:PCI-MSI.31981641-edge.i40e-eth0-TxRx-72
    189.00 =C2=B1282%     -61.3%      73.08 =C2=B1331%     -70.5%      55.6=
7 =C2=B1250%  interrupts.109:PCI-MSI.31981642-edge.i40e-eth0-TxRx-73
    103.56 =C2=B1282%     -87.7%      12.75 =C2=B1243%     -14.3%      88.7=
8 =C2=B1279%  interrupts.110:PCI-MSI.31981643-edge.i40e-eth0-TxRx-74
      0.44 =C2=B1187%     -25.0%       0.33 =C2=B1223%  +29050.0%     129.5=
6 =C2=B1242%  interrupts.111:PCI-MSI.31981644-edge.i40e-eth0-TxRx-75
      8.78 =C2=B1274%    +861.7%      84.42 =C2=B1331%    +946.8%      91.8=
9 =C2=B1282%  interrupts.112:PCI-MSI.31981645-edge.i40e-eth0-TxRx-76
      3.33 =C2=B1282%    +955.0%      35.17 =C2=B1306%  +4.7e+05%      1583=
3 =C2=B1251%  interrupts.113:PCI-MSI.31981646-edge.i40e-eth0-TxRx-77
      0.00       +3.8e+102%       3.83 =C2=B1331% +1.7e+102%       1.67 =C2=
=B1262%  interrupts.114:PCI-MSI.31981647-edge.i40e-eth0-TxRx-78
    573.11 =C2=B1161%     -71.8%     161.67 =C2=B1302%    -100.0%       0.0=
0        interrupts.115:PCI-MSI.31981648-edge.i40e-eth0-TxRx-79
     35.11 =C2=B1280%      -1.3%      34.67 =C2=B1325%    +295.9%     139.0=
0 =C2=B1271%  interrupts.116:PCI-MSI.31981649-edge.i40e-eth0-TxRx-80
      0.44 =C2=B1187%    +593.8%       3.08 =C2=B1238%  +26925.0%     120.1=
1 =C2=B1262%  interrupts.117:PCI-MSI.31981650-edge.i40e-eth0-TxRx-81
      0.22 =C2=B1282%   +1100.0%       2.67 =C2=B1309%  +50000.0%     111.3=
3 =C2=B1281%  interrupts.118:PCI-MSI.31981651-edge.i40e-eth0-TxRx-82
    144.56 =C2=B1200%     -83.0%      24.58 =C2=B1321%     -37.8%      89.8=
9 =C2=B1202%  interrupts.119:PCI-MSI.31981652-edge.i40e-eth0-TxRx-83
      0.22 =C2=B1282%    +200.0%       0.67 =C2=B1141%  +15750.0%      35.2=
2 =C2=B1184%  interrupts.120:PCI-MSI.31981653-edge.i40e-eth0-TxRx-84
     34.78 =C2=B1187%    +455.4%     193.17 =C2=B1218%     -99.4%       0.2=
2 =C2=B1282%  interrupts.121:PCI-MSI.31981654-edge.i40e-eth0-TxRx-85
      0.00       +1.8e+104%     176.08 =C2=B1243% +1.1e+101%       0.11 =C2=
=B1282%  interrupts.122:PCI-MSI.31981655-edge.i40e-eth0-TxRx-86
     38.56 =C2=B1282%     -93.5%       2.50 =C2=B1331%     -79.8%       7.7=
8 =C2=B1269%  interrupts.123:PCI-MSI.31981656-edge.i40e-eth0-TxRx-87
    564.11 =C2=B1282%     -80.6%     109.17 =C2=B1298%     -90.7%      52.5=
6 =C2=B1282%  interrupts.124:PCI-MSI.31981657-edge.i40e-eth0-TxRx-88
     11.44 =C2=B1240%    +334.7%      49.75 =C2=B1330%     -95.1%       0.5=
6 =C2=B1191%  interrupts.125:PCI-MSI.31981658-edge.i40e-eth0-TxRx-89
    538.78 =C2=B1282%   +1919.0%      10877 =C2=B1331%    -100.0%       0.2=
2 =C2=B1187%  interrupts.126:PCI-MSI.31981659-edge.i40e-eth0-TxRx-90
     13770 =C2=B1282%    -100.0%       0.08 =C2=B1331%    -100.0%       0.0=
0        interrupts.127:PCI-MSI.31981660-edge.i40e-eth0-TxRx-91
      0.89 =C2=B1215%     -62.5%       0.33 =C2=B1223%   +4400.0%      40.0=
0 =C2=B1279%  interrupts.128:PCI-MSI.31981661-edge.i40e-eth0-TxRx-92
      2715 =C2=B1206%     -83.3%     454.17 =C2=B1327%    -100.0%       0.0=
0        interrupts.129:PCI-MSI.31981662-edge.i40e-eth0-TxRx-93
    382.00            +0.1%     382.33            +0.2%     382.89        i=
nterrupts.293:PCI-MSI.327680-edge.xhci_hcd
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.295:PCI-MSI.65536-edge.ioat-msix
      0.00       +3.2e+103%      31.83 =C2=B1223%    -100.0%       0.00    =
    interrupts.296:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.297:PCI-MSI.67584-edge.ioat-msix
     21.22 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.298:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.298:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.298:PCI-MSI.69632-edge.ioat-msix
      0.00       +1.6e+103%      15.92 =C2=B1331%    -100.0%       0.00    =
    interrupts.299:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.299:PCI-MSI.69632-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.299:PCI-MSI.71680-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.29:PCI-MSI.48791552-edge.PCIe.PME,pciehp
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.300:PCI-MSI.71680-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.300:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00       +2.1e+103%      21.22 =C2=B128=
2%  interrupts.301:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.301:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.301:PCI-MSI.75776-edge.ioat-msix
      0.00       +1.6e+103%      15.92 =C2=B1331%    -100.0%       0.00    =
    interrupts.302:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.302:PCI-MSI.75776-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.302:PCI-MSI.77824-edge.ioat-msix
     21.33 =C2=B1282%    -100.0%       0.00            -0.5%      21.22 =C2=
=B1282%  interrupts.303:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.303:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.303:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.304:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.305:PCI-MSI.67174400-edge.ioat-msix
     63.67 =C2=B1141%     -25.0%      47.75 =C2=B1173%     +33.3%      84.8=
9 =C2=B1111%  interrupts.306:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.306:PCI-MSI.67174400-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.307:PCI-MSI.376832-edge.ahci[0000:00:17.0]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.307:PCI-MSI.67176448-edge.ioat-msix
     21.22 =C2=B1282%     +50.0%      31.83 =C2=B1223%    -100.0%       0.0=
0        interrupts.308:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.308:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.308:PCI-MSI.67178496-edge.ioat-msix
     21.22 =C2=B1282%     -25.0%      15.92 =C2=B1331%    -100.0%       0.0=
0        interrupts.309:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.309:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.309:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.309:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.30:PCI-MSI.48807936-edge.PCIe.PME,pciehp
      0.00       +1.6e+103%      15.92 =C2=B1331% +2.1e+103%      21.22 =C2=
=B1282%  interrupts.310:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.310:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.310:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.310:PCI-MSI.67182592-edge.ioat-msix
      0.00          -100.0%       0.00       +2.1e+103%      21.22 =C2=B128=
2%  interrupts.311:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.311:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.311:PCI-MSI.67182592-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.311:PCI-MSI.67184640-edge.ioat-msix
     21.22 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.312:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.312:PCI-MSI.67182592-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.312:PCI-MSI.67184640-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.312:PCI-MSI.67186688-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.313:PCI-MSI.67184640-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.313:PCI-MSI.67186688-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.313:PCI-MSI.67188736-edge.ioat-msix
     21.22 =C2=B1282%     -25.0%      15.92 =C2=B1331%      +0.5%      21.3=
3 =C2=B1282%  interrupts.314:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.314:PCI-MSI.67186688-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.314:PCI-MSI.67188736-edge.ioat-msix
     43.89 =C2=B1 89%    -100.0%       0.00           -81.5%       8.11 =C2=
=B1282%  interrupts.315:PCI-MSI.376832-edge.ahci[0000:00:17.0]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.315:PCI-MSI.67188736-edge.ioat-msix
    969.11 =C2=B1263%     -89.3%     103.42 =C2=B1316%     -99.8%       2.2=
2 =C2=B1 89%  interrupts.36:PCI-MSI.31981569-edge.i40e-eth0-TxRx-0
      3070 =C2=B1274%     -99.9%       3.33 =C2=B1314%     -99.7%       9.8=
9 =C2=B1162%  interrupts.37:PCI-MSI.31981570-edge.i40e-eth0-TxRx-1
      3.89 =C2=B1240%   +2315.0%      93.92 =C2=B1311%   +4357.1%     173.3=
3 =C2=B1261%  interrupts.38:PCI-MSI.31981571-edge.i40e-eth0-TxRx-2
     38.44 =C2=B1231%     -90.9%       3.50 =C2=B1331%    +181.8%     108.3=
3 =C2=B1270%  interrupts.39:PCI-MSI.31981572-edge.i40e-eth0-TxRx-3
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.3:IO-APIC.3-edge
     34.78 =C2=B1189%    +482.5%     202.58 =C2=B1304%     -99.4%       0.2=
2 =C2=B1282%  interrupts.40:PCI-MSI.31981573-edge.i40e-eth0-TxRx-4
      2667 =C2=B1282%     -97.6%      63.42 =C2=B1325%     -99.8%       5.7=
8 =C2=B1282%  interrupts.41:PCI-MSI.31981574-edge.i40e-eth0-TxRx-5
     11109 =C2=B1282%     -99.2%      84.50 =C2=B1317%     -98.4%     176.5=
6 =C2=B1165%  interrupts.42:PCI-MSI.31981575-edge.i40e-eth0-TxRx-6
      1.44 =C2=B1282%    +690.4%      11.42 =C2=B1331%    +507.7%       8.7=
8 =C2=B1150%  interrupts.43:PCI-MSI.31981576-edge.i40e-eth0-TxRx-7
      2.00 =C2=B1265%     -83.3%       0.33 =C2=B1223%   +5216.7%     106.3=
3 =C2=B1255%  interrupts.44:PCI-MSI.31981577-edge.i40e-eth0-TxRx-8
    143.78 =C2=B1232%    +416.9%     743.25 =C2=B1221%     -99.9%       0.1=
1 =C2=B1282%  interrupts.45:PCI-MSI.31981578-edge.i40e-eth0-TxRx-9
    206.67 =C2=B1157%     -91.1%      18.33 =C2=B1224%     -28.0%     148.8=
9 =C2=B1280%  interrupts.46:PCI-MSI.31981579-edge.i40e-eth0-TxRx-10
     64.78 =C2=B1206%     -10.2%      58.17 =C2=B1330%     -76.5%      15.2=
2 =C2=B1201%  interrupts.47:PCI-MSI.31981580-edge.i40e-eth0-TxRx-11
      6.78 =C2=B1205%   +7985.2%     548.00 =C2=B1331%  +2.1e+05%      1411=
6 =C2=B1271%  interrupts.48:PCI-MSI.31981581-edge.i40e-eth0-TxRx-12
      6939 =C2=B1277%     -99.5%      31.25 =C2=B1286%     -99.4%      42.6=
7 =C2=B1239%  interrupts.49:PCI-MSI.31981582-edge.i40e-eth0-TxRx-13
     49.33 =C2=B1  6%      -0.3%      49.17 =C2=B1  6%      -1.1%      48.7=
8 =C2=B1  5%  interrupts.4:IO-APIC.4-edge.ttyS0
    158.44 =C2=B1195%   +2058.4%       3419 =C2=B1329%     -84.0%      25.3=
3 =C2=B1278%  interrupts.50:PCI-MSI.31981583-edge.i40e-eth0-TxRx-14
     34.11 =C2=B1282%     +60.5%      54.75 =C2=B1221%    +225.7%     111.1=
1 =C2=B1212%  interrupts.51:PCI-MSI.31981584-edge.i40e-eth0-TxRx-15
      5.00 =C2=B1282%      -1.7%       4.92 =C2=B1224%   +3397.8%     174.8=
9 =C2=B1250%  interrupts.52:PCI-MSI.31981585-edge.i40e-eth0-TxRx-16
     17.33 =C2=B1187%    +499.0%     103.83 =C2=B1326%     +41.0%      24.4=
4 =C2=B1200%  interrupts.53:PCI-MSI.31981586-edge.i40e-eth0-TxRx-17
     21.11 =C2=B1282%     +64.6%      34.75 =C2=B1314%    +266.8%      77.4=
4 =C2=B1274%  interrupts.54:PCI-MSI.31981587-edge.i40e-eth0-TxRx-18
     69.67 =C2=B1280%  +10011.4%       7044 =C2=B1331%     -88.7%       7.8=
9 =C2=B1187%  interrupts.55:PCI-MSI.31981588-edge.i40e-eth0-TxRx-19
      1.56 =C2=B1282%  +11032.1%     173.17 =C2=B1226%   +2428.6%      39.3=
3 =C2=B1281%  interrupts.56:PCI-MSI.31981589-edge.i40e-eth0-TxRx-20
      2.00 =C2=B1174%    +216.7%       6.33 =C2=B1286%     +83.3%       3.6=
7 =C2=B1282%  interrupts.57:PCI-MSI.31981590-edge.i40e-eth0-TxRx-21
      0.00       +8.4e+103%      83.67 =C2=B1296% +2.8e+102%       2.78 =C2=
=B1258%  interrupts.58:PCI-MSI.31981591-edge.i40e-eth0-TxRx-22
     66.67 =C2=B1231%      -6.6%      62.25 =C2=B1285%    +767.5%     578.3=
3 =C2=B1239%  interrupts.59:PCI-MSI.31981592-edge.i40e-eth0-TxRx-23
     54.78 =C2=B1213%    +314.1%     226.83 =C2=B1238%    +235.9%     184.0=
0 =C2=B1242%  interrupts.60:PCI-MSI.31981593-edge.i40e-eth0-TxRx-24
      1582 =C2=B1282%     -99.2%      13.25 =C2=B1327%     -98.8%      19.6=
7 =C2=B1186%  interrupts.61:PCI-MSI.31981594-edge.i40e-eth0-TxRx-25
      0.00       +2.8e+102%       2.83 =C2=B1245% +2.2e+101%       0.22 =C2=
=B1282%  interrupts.62:PCI-MSI.31981595-edge.i40e-eth0-TxRx-26
     63.22 =C2=B1281%     -83.5%      10.42 =C2=B1331%     -87.9%       7.6=
7 =C2=B1264%  interrupts.63:PCI-MSI.31981596-edge.i40e-eth0-TxRx-27
    210.89 =C2=B1257%     -93.3%      14.17 =C2=B1304%     -21.5%     165.5=
6 =C2=B1281%  interrupts.64:PCI-MSI.31981597-edge.i40e-eth0-TxRx-28
      9.00 =C2=B1267%     -63.9%       3.25 =C2=B1313%    +807.4%      81.6=
7 =C2=B1261%  interrupts.65:PCI-MSI.31981598-edge.i40e-eth0-TxRx-29
      0.00       +1.8e+103%      18.33 =C2=B1174% +1.8e+103%      17.67 =C2=
=B1278%  interrupts.66:PCI-MSI.31981599-edge.i40e-eth0-TxRx-30
     14016 =C2=B1282%     -97.8%     306.33 =C2=B1202%     -99.9%      11.4=
4 =C2=B1270%  interrupts.67:PCI-MSI.31981600-edge.i40e-eth0-TxRx-31
    102.11 =C2=B1233%    +177.2%     283.08 =C2=B1127%     -99.8%       0.2=
2 =C2=B1282%  interrupts.68:PCI-MSI.31981601-edge.i40e-eth0-TxRx-32
    219.67 =C2=B1193%     -95.8%       9.17 =C2=B1262%    -100.0%       0.0=
0        interrupts.69:PCI-MSI.31981602-edge.i40e-eth0-TxRx-33
     11.78 =C2=B1242%    +698.8%      94.08 =C2=B1331%     -92.5%       0.8=
9 =C2=B1215%  interrupts.70:PCI-MSI.31981603-edge.i40e-eth0-TxRx-34
      2.11 =C2=B1251%    +136.8%       5.00 =C2=B1228%  +18221.1%     386.7=
8 =C2=B1282%  interrupts.71:PCI-MSI.31981604-edge.i40e-eth0-TxRx-35
    207.78 =C2=B1195%     -61.7%      79.58 =C2=B1331%    +793.1%       185=
5 =C2=B1272%  interrupts.72:PCI-MSI.31981605-edge.i40e-eth0-TxRx-36
      0.22 =C2=B1282%  +1.7e+05%     378.75 =C2=B1315%  +12000.0%      26.8=
9 =C2=B1194%  interrupts.73:PCI-MSI.31981606-edge.i40e-eth0-TxRx-37
    182.33 =C2=B1265%    +276.7%     686.92 =C2=B1327%     -48.2%      94.4=
4 =C2=B1282%  interrupts.74:PCI-MSI.31981607-edge.i40e-eth0-TxRx-38
    344.67 =C2=B1273%     -89.5%      36.25 =C2=B1319%     -51.7%     166.5=
6 =C2=B1282%  interrupts.75:PCI-MSI.31981608-edge.i40e-eth0-TxRx-39
    101.89 =C2=B1282%     +15.3%     117.50 =C2=B1331%     +27.0%     129.4=
4 =C2=B1282%  interrupts.76:PCI-MSI.31981609-edge.i40e-eth0-TxRx-40
     37.89 =C2=B1223%     -94.3%       2.17 =C2=B1278%     +91.2%      72.4=
4 =C2=B1244%  interrupts.77:PCI-MSI.31981610-edge.i40e-eth0-TxRx-41
     16.67 =C2=B1278%    +357.0%      76.17 =C2=B1319%     -77.3%       3.7=
8 =C2=B1273%  interrupts.78:PCI-MSI.31981611-edge.i40e-eth0-TxRx-42
      0.00       +8.5e+102%       8.50 =C2=B1324% +1.2e+103%      12.22 =C2=
=B1210%  interrupts.79:PCI-MSI.31981612-edge.i40e-eth0-TxRx-43
     33.78 =C2=B1280%    +112.2%      71.67 =C2=B1323%    +195.4%      99.7=
8 =C2=B1282%  interrupts.80:PCI-MSI.31981613-edge.i40e-eth0-TxRx-44
      0.00       +1.7e+104%     165.42 =C2=B1254% +1.7e+103%      17.44 =C2=
=B1282%  interrupts.81:PCI-MSI.31981614-edge.i40e-eth0-TxRx-45
    108.67 =C2=B1252%      +9.2%     118.67 =C2=B1234%     -98.2%       2.0=
0 =C2=B1282%  interrupts.82:PCI-MSI.31981615-edge.i40e-eth0-TxRx-46
     11.33 =C2=B1245%     +80.1%      20.42 =C2=B1223%     -95.1%       0.5=
6 =C2=B1226%  interrupts.83:PCI-MSI.31981616-edge.i40e-eth0-TxRx-47
    134.22 =C2=B1273%     -99.8%       0.33 =C2=B1223%     -99.5%       0.6=
7 =C2=B1200%  interrupts.84:PCI-MSI.31981617-edge.i40e-eth0-TxRx-48
     56.56 =C2=B1277%  +20032.9%      11386 =C2=B1233%     -94.5%       3.1=
1 =C2=B1162%  interrupts.85:PCI-MSI.31981618-edge.i40e-eth0-TxRx-49
     18.67 =C2=B1262%   +1340.2%     268.83 =C2=B1324%     +60.7%      30.0=
0 =C2=B1282%  interrupts.86:PCI-MSI.31981619-edge.i40e-eth0-TxRx-50
    114.33 =C2=B1278%     +23.7%     141.42 =C2=B1195%     +37.4%     157.1=
1 =C2=B1236%  interrupts.87:PCI-MSI.31981620-edge.i40e-eth0-TxRx-51
      1.44 =C2=B1193%   +8196.2%     119.83 =C2=B1295%    +284.6%       5.5=
6 =C2=B1119%  interrupts.88:PCI-MSI.31981621-edge.i40e-eth0-TxRx-52
      5.22 =C2=B1282%     -18.6%       4.25 =C2=B1227%     -42.6%       3.0=
0 =C2=B1282%  interrupts.89:PCI-MSI.31981622-edge.i40e-eth0-TxRx-53
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.8:IO-APIC.8-edge.rtc0
      9.89 =C2=B1234%    +852.2%      94.17 =C2=B1329%     -66.3%       3.3=
3 =C2=B1282%  interrupts.90:PCI-MSI.31981623-edge.i40e-eth0-TxRx-54
      0.56 =C2=B1149%   +2450.0%      14.17 =C2=B1179%  +23960.0%     133.6=
7 =C2=B1282%  interrupts.91:PCI-MSI.31981624-edge.i40e-eth0-TxRx-55
     33.78 =C2=B1282%     -92.6%       2.50 =C2=B1308%  +43009.5%      1456=
1 =C2=B1282%  interrupts.92:PCI-MSI.31981625-edge.i40e-eth0-TxRx-56
    289.89 =C2=B1219%     -99.4%       1.67 =C2=B1297%     -96.7%       9.6=
7 =C2=B1275%  interrupts.93:PCI-MSI.31981626-edge.i40e-eth0-TxRx-57
      0.00       +3.5e+104%     349.58 =C2=B1315% +1.2e+104%     115.44 =C2=
=B1238%  interrupts.94:PCI-MSI.31981627-edge.i40e-eth0-TxRx-58
      0.00       +4.1e+103%      40.75 =C2=B1288% +2.6e+103%      26.11 =C2=
=B1187%  interrupts.95:PCI-MSI.31981628-edge.i40e-eth0-TxRx-59
    281.22 =C2=B1281%     -64.3%     100.42 =C2=B1296%      +7.5%     302.2=
2 =C2=B1141%  interrupts.96:PCI-MSI.31981629-edge.i40e-eth0-TxRx-60
    201.89 =C2=B1279%     -26.8%     147.75 =C2=B1323%     -97.2%       5.6=
7 =C2=B1162%  interrupts.97:PCI-MSI.31981630-edge.i40e-eth0-TxRx-61
    349.11 =C2=B1217%    +161.4%     912.42 =C2=B1195%     -96.9%      10.8=
9 =C2=B1276%  interrupts.98:PCI-MSI.31981631-edge.i40e-eth0-TxRx-62
    178.22 =C2=B1268%     +48.2%     264.17 =C2=B1242%   +1035.8%       202=
4 =C2=B1282%  interrupts.99:PCI-MSI.31981632-edge.i40e-eth0-TxRx-63
     95682 =C2=B1 20%      -2.6%      93152 =C2=B1 26%     +35.9%     13006=
3 =C2=B1 14%  interrupts.CAL:Function_call_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU0.0:IO-APIC.2-edge.timer
      0.22 =C2=B1187%     +12.5%       0.25 =C2=B1173%     +50.0%       0.3=
3 =C2=B1141%  interrupts.CPU0.119:PCI-MSI.31981652-edge.i40e-eth0-TxRx-83
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU0.301:PCI-MSI.75776-edge.ioat-msix
    969.00 =C2=B1263%     -89.3%     103.25 =C2=B1316%     -99.8%       2.1=
1 =C2=B1 95%  interrupts.CPU0.36:PCI-MSI.31981569-edge.i40e-eth0-TxRx-0
      0.11 =C2=B1282%    -100.0%       0.00          +100.0%       0.22 =C2=
=B1187%  interrupts.CPU0.71:PCI-MSI.31981604-edge.i40e-eth0-TxRx-35
      1946 =C2=B1166%     -55.4%     867.75 =C2=B1116%     +47.5%       287=
2 =C2=B1190%  interrupts.CPU0.CAL:Function_call_interrupts
    774652 =C2=B1  3%      -6.7%     722676 =C2=B1 18%      +1.2%     78371=
3        interrupts.CPU0.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU0.MCP:Machine_check_polls
     90.56 =C2=B1 37%    +144.6%     221.50 =C2=B1189%     -14.0%      77.8=
9 =C2=B1 12%  interrupts.CPU0.NMI:Non-maskable_interrupts
     90.56 =C2=B1 37%    +144.6%     221.50 =C2=B1189%     -14.0%      77.8=
9 =C2=B1 12%  interrupts.CPU0.PMI:Performance_monitoring_interrupts
     13.00 =C2=B1 51%    +241.0%      44.33 =C2=B1172%      +5.1%      13.6=
7 =C2=B1 73%  interrupts.CPU0.RES:Rescheduling_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU0.RTR:APIC_ICR_read_retries
      1.89 =C2=B1 76%     +54.4%       2.92 =C2=B1116%     +88.2%       3.5=
6 =C2=B1 44%  interrupts.CPU0.TLB:TLB_shootdowns
      0.11 =C2=B1282%    +200.0%       0.33 =C2=B1141%    +200.0%       0.3=
3 =C2=B1141%  interrupts.CPU1.120:PCI-MSI.31981653-edge.i40e-eth0-TxRx-84
      3070 =C2=B1274%     -99.9%       3.25 =C2=B1322%     -99.7%       9.5=
6 =C2=B1166%  interrupts.CPU1.37:PCI-MSI.31981570-edge.i40e-eth0-TxRx-1
      0.33 =C2=B1141%    -100.0%       0.00           -33.3%       0.22 =C2=
=B1187%  interrupts.CPU1.72:PCI-MSI.31981605-edge.i40e-eth0-TxRx-36
    547.78 =C2=B1 20%     +72.0%     942.33 =C2=B1 69%    +840.1%       514=
9 =C2=B1248%  interrupts.CPU1.CAL:Function_call_interrupts
      0.00       +8.3e+100%       0.08 =C2=B1331%    -100.0%       0.00    =
    interrupts.CPU1.IWI:IRQ_work_interrupts
    774552 =C2=B1  3%      -6.7%     722476 =C2=B1 18%      +1.2%     78380=
3        interrupts.CPU1.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU1.MCP:Machine_check_polls
     84.33 =C2=B1 26%    +611.5%     600.00 =C2=B1238%    +157.2%     216.8=
9 =C2=B1188%  interrupts.CPU1.NMI:Non-maskable_interrupts
     84.33 =C2=B1 26%    +611.5%     600.00 =C2=B1238%    +157.2%     216.8=
9 =C2=B1188%  interrupts.CPU1.PMI:Performance_monitoring_interrupts
     22.22 =C2=B1 49%      +1.3%      22.50 =C2=B1 62%     -39.0%      13.5=
6 =C2=B1 72%  interrupts.CPU1.RES:Rescheduling_interrupts
      1.67 =C2=B1 74%      +0.0%       1.67 =C2=B1143%    +120.0%       3.6=
7 =C2=B1 38%  interrupts.CPU1.TLB:TLB_shootdowns
      0.11 =C2=B1282%     +50.0%       0.17 =C2=B1223%    -100.0%       0.0=
0        interrupts.CPU10.129:PCI-MSI.31981662-edge.i40e-eth0-TxRx-93
    382.00            +0.1%     382.33            +0.2%     382.89        i=
nterrupts.CPU10.293:PCI-MSI.327680-edge.xhci_hcd
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU10.298:PCI-MSI.69632-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU10.315:PCI-MSI.376832-edge.ahci[0000:00:17.0]
    206.44 =C2=B1157%     -91.1%      18.33 =C2=B1224%     -28.0%     148.6=
7 =C2=B1280%  interrupts.CPU10.46:PCI-MSI.31981579-edge.i40e-eth0-TxRx-10
      0.00       +8.3e+100%       0.08 =C2=B1331%    -100.0%       0.00    =
    interrupts.CPU10.81:PCI-MSI.31981614-edge.i40e-eth0-TxRx-45
    564.33 =C2=B1  9%      +0.3%     565.92 =C2=B1  8%    +190.5%       163=
9 =C2=B1162%  interrupts.CPU10.CAL:Function_call_interrupts
    774527 =C2=B1  3%      -6.7%     722599 =C2=B1 18%      +1.2%     78366=
1        interrupts.CPU10.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU10.MCP:Machine_check_polls
     94.44 =C2=B1 30%      -1.2%      93.33 =C2=B1 36%     -17.9%      77.5=
6 =C2=B1 10%  interrupts.CPU10.NMI:Non-maskable_interrupts
     94.44 =C2=B1 30%      -1.2%      93.33 =C2=B1 36%     -17.9%      77.5=
6 =C2=B1 10%  interrupts.CPU10.PMI:Performance_monitoring_interrupts
     30.67 =C2=B1 80%   +2062.2%     663.08 =C2=B1318%    +147.1%      75.7=
8 =C2=B1214%  interrupts.CPU10.RES:Rescheduling_interrupts
      1.44 =C2=B1118%     +38.5%       2.00 =C2=B1145%    +169.2%       3.8=
9 =C2=B1 47%  interrupts.CPU10.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU11.298:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU11.298:PCI-MSI.69632-edge.ioat-msix
      0.00       +1.6e+103%      15.92 =C2=B1331%    -100.0%       0.00    =
    interrupts.CPU11.299:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU11.299:PCI-MSI.69632-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU11.299:PCI-MSI.71680-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU11.300:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU11.303:PCI-MSI.79872-edge.ioat-msix
     64.56 =C2=B1207%     -10.2%      58.00 =C2=B1331%     -76.8%      15.0=
0 =C2=B1205%  interrupts.CPU11.47:PCI-MSI.31981580-edge.i40e-eth0-TxRx-11
      0.33 =C2=B1141%     -50.0%       0.17 =C2=B1223%     -66.7%       0.1=
1 =C2=B1282%  interrupts.CPU11.82:PCI-MSI.31981615-edge.i40e-eth0-TxRx-46
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU11.8:IO-APIC.8-edge.rtc0
    825.44 =C2=B1 88%     +45.0%       1196 =C2=B1109%     -33.7%     547.0=
0 =C2=B1  2%  interrupts.CPU11.CAL:Function_call_interrupts
      0.00       +8.3e+100%       0.08 =C2=B1331% +1.1e+101%       0.11 =C2=
=B1282%  interrupts.CPU11.IWI:IRQ_work_interrupts
    774519 =C2=B1  3%      -6.7%     722533 =C2=B1 18%      +1.2%     78377=
5        interrupts.CPU11.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU11.MCP:Machine_check_polls
    108.89 =C2=B1 14%    +354.2%     494.58 =C2=B1267%    +547.0%     704.5=
6 =C2=B1249%  interrupts.CPU11.NMI:Non-maskable_interrupts
    108.89 =C2=B1 14%    +354.2%     494.58 =C2=B1267%    +547.0%     704.5=
6 =C2=B1249%  interrupts.CPU11.PMI:Performance_monitoring_interrupts
     27.89 =C2=B1104%     -14.5%      23.83 =C2=B1 91%     -34.7%      18.2=
2 =C2=B1 39%  interrupts.CPU11.RES:Rescheduling_interrupts
      2.00 =C2=B1 97%     +12.5%       2.25 =C2=B1134%    +111.1%       4.2=
2 =C2=B1 39%  interrupts.CPU11.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU12.295:PCI-MSI.65536-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU12.299:PCI-MSI.69632-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU12.299:PCI-MSI.71680-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU12.300:PCI-MSI.71680-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU12.300:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU12.301:PCI-MSI.75776-edge.ioat-msix
     21.22 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU12.306:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      6.67 =C2=B1208%   +8116.2%     547.75 =C2=B1331%  +2.1e+05%      1411=
6 =C2=B1271%  interrupts.CPU12.48:PCI-MSI.31981581-edge.i40e-eth0-TxRx-12
      5.67 =C2=B1282%     +50.0%       8.50 =C2=B1223%     +90.2%      10.7=
8 =C2=B1187%  interrupts.CPU12.4:IO-APIC.4-edge.ttyS0
      0.00       +8.3e+100%       0.08 =C2=B1331% +1.1e+101%       0.11 =C2=
=B1282%  interrupts.CPU12.83:PCI-MSI.31981616-edge.i40e-eth0-TxRx-47
    557.44 =C2=B1  5%      -3.0%     540.67 =C2=B1  5%    +238.2%       188=
5 =C2=B1177%  interrupts.CPU12.CAL:Function_call_interrupts
    774602 =C2=B1  3%      -6.7%     722477 =C2=B1 18%      +1.2%     78372=
2        interrupts.CPU12.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU12.MCP:Machine_check_polls
     92.67 =C2=B1 28%    +115.1%     199.33 =C2=B1180%     -19.5%      74.5=
6 =C2=B1 18%  interrupts.CPU12.NMI:Non-maskable_interrupts
     92.67 =C2=B1 28%    +115.1%     199.33 =C2=B1180%     -19.5%      74.5=
6 =C2=B1 18%  interrupts.CPU12.PMI:Performance_monitoring_interrupts
    200.56 =C2=B1256%     -84.9%      30.33 =C2=B1 88%     -89.8%      20.4=
4 =C2=B1 52%  interrupts.CPU12.RES:Rescheduling_interrupts
      2.44 =C2=B1109%      -8.0%       2.25 =C2=B1117%     +77.3%       4.3=
3 =C2=B1 42%  interrupts.CPU12.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU13.295:PCI-MSI.65536-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU13.298:PCI-MSI.69632-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU13.300:PCI-MSI.71680-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU13.300:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00       +2.1e+103%      21.22 =C2=B128=
2%  interrupts.CPU13.301:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU13.301:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU13.301:PCI-MSI.75776-edge.ioat-msix
      0.00       +1.6e+103%      15.92 =C2=B1331%    -100.0%       0.00    =
    interrupts.CPU13.302:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU13.302:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU13.315:PCI-MSI.376832-edge.ahci[0000:00:17.0]
      0.11 =C2=B1282%     +50.0%       0.17 =C2=B1223%      +0.0%       0.1=
1 =C2=B1282%  interrupts.CPU13.36:PCI-MSI.31981569-edge.i40e-eth0-TxRx-0
      6939 =C2=B1277%     -99.6%      31.08 =C2=B1288%     -99.4%      42.5=
6 =C2=B1240%  interrupts.CPU13.49:PCI-MSI.31981582-edge.i40e-eth0-TxRx-13
     11.67 =C2=B1187%     -27.9%       8.42 =C2=B1224%      -7.6%      10.7=
8 =C2=B1187%  interrupts.CPU13.4:IO-APIC.4-edge.ttyS0
      0.00       +1.7e+101%       0.17 =C2=B1223% +1.1e+101%       0.11 =C2=
=B1282%  interrupts.CPU13.84:PCI-MSI.31981617-edge.i40e-eth0-TxRx-48
    878.00 =C2=B1 57%     -37.8%     546.50 =C2=B1  2%     -15.8%     739.1=
1 =C2=B1 74%  interrupts.CPU13.CAL:Function_call_interrupts
      0.11 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU13.IWI:IRQ_work_interrupts
    774539 =C2=B1  3%      -6.7%     722427 =C2=B1 18%      +1.2%     78367=
1        interrupts.CPU13.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU13.MCP:Machine_check_polls
    980.44 =C2=B1172%     -70.1%     293.25 =C2=B1217%     -92.5%      73.4=
4 =C2=B1 18%  interrupts.CPU13.NMI:Non-maskable_interrupts
    980.44 =C2=B1172%     -70.1%     293.25 =C2=B1217%     -92.5%      73.4=
4 =C2=B1 18%  interrupts.CPU13.PMI:Performance_monitoring_interrupts
     19.67 =C2=B1 68%    +147.0%      48.58 =C2=B1135%    +132.2%      45.6=
7 =C2=B1125%  interrupts.CPU13.RES:Rescheduling_interrupts
      1.67 =C2=B1109%     +35.0%       2.25 =C2=B1140%    +166.7%       4.4=
4 =C2=B1 30%  interrupts.CPU13.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU14.295:PCI-MSI.65536-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU14.300:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU14.301:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU14.301:PCI-MSI.75776-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU14.302:PCI-MSI.75776-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU14.302:PCI-MSI.77824-edge.ioat-msix
     21.33 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU14.303:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU14.303:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU14.303:PCI-MSI.79872-edge.ioat-msix
      0.00       +8.3e+100%       0.08 =C2=B1331% +3.3e+101%       0.33 =C2=
=B1141%  interrupts.CPU14.37:PCI-MSI.31981570-edge.i40e-eth0-TxRx-1
     10.78 =C2=B1187%     -21.9%       8.42 =C2=B1224%    -100.0%       0.0=
0        interrupts.CPU14.4:IO-APIC.4-edge.ttyS0
    158.22 =C2=B1195%   +2061.5%       3419 =C2=B1329%     -84.1%      25.1=
1 =C2=B1281%  interrupts.CPU14.50:PCI-MSI.31981583-edge.i40e-eth0-TxRx-14
      0.00       +1.7e+101%       0.17 =C2=B1223% +2.2e+101%       0.22 =C2=
=B1187%  interrupts.CPU14.85:PCI-MSI.31981618-edge.i40e-eth0-TxRx-49
    709.22 =C2=B1 61%     -25.7%     526.67 =C2=B1 10%     -21.3%     558.4=
4 =C2=B1  6%  interrupts.CPU14.CAL:Function_call_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU14.IWI:IRQ_work_interrupts
    774500 =C2=B1  3%      -6.7%     722695 =C2=B1 18%      +1.2%     78369=
4        interrupts.CPU14.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU14.MCP:Machine_check_polls
    145.67 =C2=B1 94%      -0.5%     144.92 =C2=B1102%     -55.5%      64.7=
8 =C2=B1 40%  interrupts.CPU14.NMI:Non-maskable_interrupts
    145.67 =C2=B1 94%      -0.5%     144.92 =C2=B1102%     -55.5%      64.7=
8 =C2=B1 40%  interrupts.CPU14.PMI:Performance_monitoring_interrupts
     76.78 =C2=B1147%     -47.3%      40.50 =C2=B1 74%     -74.7%      19.4=
4 =C2=B1 49%  interrupts.CPU14.RES:Rescheduling_interrupts
      1.44 =C2=B1113%     +32.7%       1.92 =C2=B1146%    +176.9%       4.0=
0 =C2=B1 35%  interrupts.CPU14.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU15.301:PCI-MSI.75776-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU15.302:PCI-MSI.75776-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU15.302:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00       +2.1e+103%      21.22 =C2=B128=
2%  interrupts.CPU15.303:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU15.303:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU15.303:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU15.304:PCI-MSI.79872-edge.ioat-msix
     21.22 =C2=B1282%     -25.0%      15.92 =C2=B1331%    -100.0%       0.0=
0        interrupts.CPU15.309:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      0.00          -100.0%       0.00       +4.4e+101%       0.44 =C2=B111=
1%  interrupts.CPU15.38:PCI-MSI.31981571-edge.i40e-eth0-TxRx-2
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU15.3:IO-APIC.3-edge
      0.00       +7.7e+102%       7.67 =C2=B1223%    -100.0%       0.00    =
    interrupts.CPU15.4:IO-APIC.4-edge.ttyS0
     34.00 =C2=B1282%     +60.0%      54.42 =C2=B1223%    +226.5%     111.0=
0 =C2=B1213%  interrupts.CPU15.51:PCI-MSI.31981584-edge.i40e-eth0-TxRx-15
      0.22 =C2=B1187%     -25.0%       0.17 =C2=B1223%     -50.0%       0.1=
1 =C2=B1282%  interrupts.CPU15.86:PCI-MSI.31981619-edge.i40e-eth0-TxRx-50
      1272 =C2=B1158%     -19.3%       1026 =C2=B1 73%     -52.8%     600.5=
6 =C2=B1 25%  interrupts.CPU15.CAL:Function_call_interrupts
      0.00       +8.3e+100%       0.08 =C2=B1331%    -100.0%       0.00    =
    interrupts.CPU15.IWI:IRQ_work_interrupts
    774611 =C2=B1  3%      -6.7%     722447 =C2=B1 18%      +1.2%     78369=
8        interrupts.CPU15.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU15.MCP:Machine_check_polls
     93.89 =C2=B1 29%    +499.7%     563.08 =C2=B1271%     -35.5%      60.5=
6 =C2=B1 36%  interrupts.CPU15.NMI:Non-maskable_interrupts
     93.89 =C2=B1 29%    +499.7%     563.08 =C2=B1271%     -35.5%      60.5=
6 =C2=B1 36%  interrupts.CPU15.PMI:Performance_monitoring_interrupts
    366.78 =C2=B1273%     -93.9%      22.25 =C2=B1 66%     -94.9%      18.7=
8 =C2=B1 69%  interrupts.CPU15.RES:Rescheduling_interrupts
      2.00 =C2=B1 97%      +0.0%       2.00 =C2=B1148%    +116.7%       4.3=
3 =C2=B1 40%  interrupts.CPU15.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU16.295:PCI-MSI.65536-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU16.297:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU16.302:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU16.303:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU16.303:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU16.304:PCI-MSI.79872-edge.ioat-msix
      0.00       +1.6e+103%      15.92 =C2=B1331% +4.2e+103%      42.44 =C2=
=B1187%  interrupts.CPU16.306:PCI-MSI.288768-edge.ahci[0000:00:11.5]
     21.22 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU16.308:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      0.00          -100.0%       0.00       +2.1e+103%      21.22 =C2=B128=
2%  interrupts.CPU16.310:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      0.00       +1.6e+103%      15.92 =C2=B1331% +2.1e+103%      21.33 =C2=
=B1282%  interrupts.CPU16.314:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      9.33 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU16.315:PCI-MSI.376832-edge.ahci[0000:00:17.0]
      0.33 =C2=B1141%    -100.0%       0.00           -66.7%       0.11 =C2=
=B1282%  interrupts.CPU16.39:PCI-MSI.31981572-edge.i40e-eth0-TxRx-3
      0.00          -100.0%       0.00       +5.7e+102%       5.67 =C2=B128=
2%  interrupts.CPU16.4:IO-APIC.4-edge.ttyS0
      5.00 =C2=B1282%      -5.0%       4.75 =C2=B1224%   +3395.6%     174.7=
8 =C2=B1251%  interrupts.CPU16.52:PCI-MSI.31981585-edge.i40e-eth0-TxRx-16
      0.22 =C2=B1187%     -62.5%       0.08 =C2=B1331%     -50.0%       0.1=
1 =C2=B1282%  interrupts.CPU16.87:PCI-MSI.31981620-edge.i40e-eth0-TxRx-51
      1913 =C2=B1199%     -50.2%     952.92 =C2=B1117%     -43.9%       107=
2 =C2=B1 64%  interrupts.CPU16.CAL:Function_call_interrupts
    774609 =C2=B1  3%      -6.7%     722394 =C2=B1 18%      +1.2%     78358=
8        interrupts.CPU16.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU16.MCP:Machine_check_polls
    104.00 =C2=B1 26%      -1.8%     102.08 =C2=B1 26%     -36.5%      66.0=
0 =C2=B1 30%  interrupts.CPU16.NMI:Non-maskable_interrupts
    104.00 =C2=B1 26%      -1.8%     102.08 =C2=B1 26%     -36.5%      66.0=
0 =C2=B1 30%  interrupts.CPU16.PMI:Performance_monitoring_interrupts
    111.00 =C2=B1239%     -47.2%      58.58 =C2=B1123%     -88.8%      12.4=
4 =C2=B1 76%  interrupts.CPU16.RES:Rescheduling_interrupts
      1.67 =C2=B1109%     +45.0%       2.42 =C2=B1124%    +153.3%       4.2=
2 =C2=B1 24%  interrupts.CPU16.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU17.295:PCI-MSI.65536-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU17.303:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU17.304:PCI-MSI.79872-edge.ioat-msix
     21.22 =C2=B1282%     -25.0%      15.92 =C2=B1331%      +0.0%      21.2=
2 =C2=B1282%  interrupts.CPU17.306:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU17.307:PCI-MSI.376832-edge.ahci[0000:00:17.0]
      0.00       +3.2e+103%      31.83 =C2=B1223%    -100.0%       0.00    =
    interrupts.CPU17.308:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      0.00       +1.6e+103%      15.92 =C2=B1331%    -100.0%       0.00    =
    interrupts.CPU17.310:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      0.00          -100.0%       0.00       +2.1e+103%      21.22 =C2=B128=
2%  interrupts.CPU17.311:PCI-MSI.288768-edge.ahci[0000:00:11.5]
     21.22 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU17.312:PCI-MSI.288768-edge.ahci[0000:00:11.5]
     21.22 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU17.314:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      9.00 =C2=B1282%    -100.0%       0.00            -9.9%       8.11 =C2=
=B1282%  interrupts.CPU17.315:PCI-MSI.376832-edge.ahci[0000:00:17.0]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU17.3:IO-APIC.3-edge
      0.33 =C2=B1141%     -50.0%       0.17 =C2=B1223%     -66.7%       0.1=
1 =C2=B1282%  interrupts.CPU17.40:PCI-MSI.31981573-edge.i40e-eth0-TxRx-4
     17.33 =C2=B1187%    +499.0%     103.83 =C2=B1326%     +40.4%      24.3=
3 =C2=B1200%  interrupts.CPU17.53:PCI-MSI.31981586-edge.i40e-eth0-TxRx-17
      0.22 =C2=B1187%    -100.0%       0.00           -50.0%       0.11 =C2=
=B1282%  interrupts.CPU17.88:PCI-MSI.31981621-edge.i40e-eth0-TxRx-52
    644.00 =C2=B1 47%    +314.1%       2666 =C2=B1263%   +1194.3%       833=
5 =C2=B1235%  interrupts.CPU17.CAL:Function_call_interrupts
      0.00       +2.5e+101%       0.25 =C2=B1238%    -100.0%       0.00    =
    interrupts.CPU17.IWI:IRQ_work_interrupts
    774589 =C2=B1  3%      -6.7%     722419 =C2=B1 18%      +1.2%     78364=
8        interrupts.CPU17.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU17.MCP:Machine_check_polls
    105.89 =C2=B1 19%    +377.7%     505.83 =C2=B1261%     -34.0%      69.8=
9 =C2=B1 28%  interrupts.CPU17.NMI:Non-maskable_interrupts
    105.89 =C2=B1 19%    +377.7%     505.83 =C2=B1261%     -34.0%      69.8=
9 =C2=B1 28%  interrupts.CPU17.PMI:Performance_monitoring_interrupts
     58.33 =C2=B1204%     -65.3%      20.25 =C2=B1 70%     -81.1%      11.0=
0 =C2=B1 30%  interrupts.CPU17.RES:Rescheduling_interrupts
      1.56 =C2=B1113%     +50.0%       2.33 =C2=B1132%    +228.6%       5.1=
1 =C2=B1 17%  interrupts.CPU17.TLB:TLB_shootdowns
     21.22 =C2=B1282%     -25.0%      15.92 =C2=B1331%      +0.0%      21.2=
2 =C2=B1282%  interrupts.CPU18.306:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      8.56 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU18.315:PCI-MSI.376832-edge.ahci[0000:00:17.0]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU18.3:IO-APIC.3-edge
      0.11 =C2=B1282%     +50.0%       0.17 =C2=B1223%    -100.0%       0.0=
0        interrupts.CPU18.41:PCI-MSI.31981574-edge.i40e-eth0-TxRx-5
     21.11 =C2=B1282%     +64.2%      34.67 =C2=B1314%    +265.8%      77.2=
2 =C2=B1274%  interrupts.CPU18.54:PCI-MSI.31981587-edge.i40e-eth0-TxRx-18
      0.00          -100.0%       0.00       +1.1e+101%       0.11 =C2=B128=
2%  interrupts.CPU18.89:PCI-MSI.31981622-edge.i40e-eth0-TxRx-53
      3956 =C2=B1154%     -33.9%       2613 =C2=B1224%    +171.8%      1075=
4 =C2=B1259%  interrupts.CPU18.CAL:Function_call_interrupts
      0.00       +8.3e+100%       0.08 =C2=B1331%    -100.0%       0.00    =
    interrupts.CPU18.IWI:IRQ_work_interrupts
    774468 =C2=B1  3%      -6.7%     722385 =C2=B1 18%      +1.2%     78356=
7        interrupts.CPU18.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU18.MCP:Machine_check_polls
    102.78 =C2=B1 16%    +511.8%     628.75 =C2=B1265%    +245.8%     355.4=
4 =C2=B1224%  interrupts.CPU18.NMI:Non-maskable_interrupts
    102.78 =C2=B1 16%    +511.8%     628.75 =C2=B1265%    +245.8%     355.4=
4 =C2=B1224%  interrupts.CPU18.PMI:Performance_monitoring_interrupts
     20.22 =C2=B1 47%    +137.0%      47.92 =C2=B1121%    +161.0%      52.7=
8 =C2=B1180%  interrupts.CPU18.RES:Rescheduling_interrupts
      2.00 =C2=B1 94%     +33.3%       2.67 =C2=B1122%    +133.3%       4.6=
7 =C2=B1 17%  interrupts.CPU18.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU19.297:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU19.302:PCI-MSI.77824-edge.ioat-msix
      8.67 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU19.315:PCI-MSI.376832-edge.ahci[0000:00:17.0]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU19.3:IO-APIC.3-edge
      0.00       +8.3e+100%       0.08 =C2=B1331% +5.6e+101%       0.56 =C2=
=B1 89%  interrupts.CPU19.42:PCI-MSI.31981575-edge.i40e-eth0-TxRx-6
      5.11 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU19.4:IO-APIC.4-edge.ttyS0
     69.44 =C2=B1281%  +10043.2%       7043 =C2=B1331%     -88.8%       7.7=
8 =C2=B1187%  interrupts.CPU19.55:PCI-MSI.31981588-edge.i40e-eth0-TxRx-19
      0.00       +1.7e+101%       0.17 =C2=B1223%    -100.0%       0.00    =
    interrupts.CPU19.90:PCI-MSI.31981623-edge.i40e-eth0-TxRx-54
    556.56 =C2=B1  6%   +1092.4%       6636 =C2=B1224%    +200.0%       166=
9 =C2=B1127%  interrupts.CPU19.CAL:Function_call_interrupts
    774599 =C2=B1  3%      -6.7%     722577 =C2=B1 18%      +1.2%     78363=
6        interrupts.CPU19.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU19.MCP:Machine_check_polls
    108.22 =C2=B1 19%      -8.3%      99.25 =C2=B1 26%     -33.6%      71.8=
9 =C2=B1 26%  interrupts.CPU19.NMI:Non-maskable_interrupts
    108.22 =C2=B1 19%      -8.3%      99.25 =C2=B1 26%     -33.6%      71.8=
9 =C2=B1 26%  interrupts.CPU19.PMI:Performance_monitoring_interrupts
    240.00 =C2=B1262%     -93.6%      15.33 =C2=B1 68%     -92.4%      18.3=
3 =C2=B1108%  interrupts.CPU19.RES:Rescheduling_interrupts
      1.78 =C2=B1101%     +59.4%       2.83 =C2=B1147%    +162.5%       4.6=
7 =C2=B1 34%  interrupts.CPU19.TLB:TLB_shootdowns
      0.00       +1.7e+101%       0.17 =C2=B1223% +1.1e+101%       0.11 =C2=
=B1282%  interrupts.CPU2.121:PCI-MSI.31981654-edge.i40e-eth0-TxRx-85
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU2.297:PCI-MSI.67584-edge.ioat-msix
      3.89 =C2=B1240%   +2315.0%      93.92 =C2=B1311%   +4345.7%     172.8=
9 =C2=B1261%  interrupts.CPU2.38:PCI-MSI.31981571-edge.i40e-eth0-TxRx-2
      0.11 =C2=B1282%    +200.0%       0.33 =C2=B1141%    +100.0%       0.2=
2 =C2=B1187%  interrupts.CPU2.73:PCI-MSI.31981606-edge.i40e-eth0-TxRx-37
    649.33 =C2=B1 25%     +31.8%     855.58 =C2=B1 66%     -13.0%     565.0=
0 =C2=B1  5%  interrupts.CPU2.CAL:Function_call_interrupts
    774442 =C2=B1  3%      -6.7%     722580 =C2=B1 18%      +1.2%     78380=
3        interrupts.CPU2.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU2.MCP:Machine_check_polls
    654.78 =C2=B1159%     -85.1%      97.75 =C2=B1 24%     -50.4%     325.0=
0 =C2=B1218%  interrupts.CPU2.NMI:Non-maskable_interrupts
    654.78 =C2=B1159%     -85.1%      97.75 =C2=B1 24%     -50.4%     325.0=
0 =C2=B1218%  interrupts.CPU2.PMI:Performance_monitoring_interrupts
     15.67 =C2=B1 64%    +233.5%      52.25 =C2=B1229%     -26.2%      11.5=
6 =C2=B1 83%  interrupts.CPU2.RES:Rescheduling_interrupts
      3.00 =C2=B1115%     -33.3%       2.00 =C2=B1132%     +55.6%       4.6=
7 =C2=B1 48%  interrupts.CPU2.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU20.295:PCI-MSI.65536-edge.ioat-msix
      0.11 =C2=B1282%    -100.0%       0.00          +200.0%       0.33 =C2=
=B1141%  interrupts.CPU20.43:PCI-MSI.31981576-edge.i40e-eth0-TxRx-7
      5.11 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU20.4:IO-APIC.4-edge.ttyS0
      1.44 =C2=B1282%  +11876.9%     173.00 =C2=B1226%   +2607.7%      39.1=
1 =C2=B1281%  interrupts.CPU20.56:PCI-MSI.31981589-edge.i40e-eth0-TxRx-20
      0.33 =C2=B1141%     -25.0%       0.25 =C2=B1173%     -33.3%       0.2=
2 =C2=B1187%  interrupts.CPU20.91:PCI-MSI.31981624-edge.i40e-eth0-TxRx-55
      6289 =C2=B1233%     -89.3%     670.08 =C2=B1 38%     -90.4%     605.2=
2 =C2=B1 28%  interrupts.CPU20.CAL:Function_call_interrupts
      0.11 =C2=B1282%    -100.0%       0.00          +100.0%       0.22 =C2=
=B1187%  interrupts.CPU20.IWI:IRQ_work_interrupts
    774446 =C2=B1  3%      -6.7%     722456 =C2=B1 18%      +1.2%     78370=
9        interrupts.CPU20.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU20.MCP:Machine_check_polls
    841.89 =C2=B1182%     -88.3%      98.17 =C2=B1 30%     -18.4%     687.1=
1 =C2=B1249%  interrupts.CPU20.NMI:Non-maskable_interrupts
    841.89 =C2=B1182%     -88.3%      98.17 =C2=B1 30%     -18.4%     687.1=
1 =C2=B1249%  interrupts.CPU20.PMI:Performance_monitoring_interrupts
     19.11 =C2=B1 80%    +142.0%      46.25 =C2=B1196%     +66.3%      31.7=
8 =C2=B1 96%  interrupts.CPU20.RES:Rescheduling_interrupts
      1.67 =C2=B1116%     +35.0%       2.25 =C2=B1145%    +180.0%       4.6=
7 =C2=B1 36%  interrupts.CPU20.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU21.295:PCI-MSI.65536-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU21.298:PCI-MSI.69632-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU21.3:IO-APIC.3-edge
      0.11 =C2=B1282%     +50.0%       0.17 =C2=B1223%    +100.0%       0.2=
2 =C2=B1187%  interrupts.CPU21.44:PCI-MSI.31981577-edge.i40e-eth0-TxRx-8
      1.67 =C2=B1187%    +270.0%       6.17 =C2=B1294%    +120.0%       3.6=
7 =C2=B1282%  interrupts.CPU21.57:PCI-MSI.31981590-edge.i40e-eth0-TxRx-21
      0.00       +8.3e+100%       0.08 =C2=B1331% +2.2e+101%       0.22 =C2=
=B1187%  interrupts.CPU21.92:PCI-MSI.31981625-edge.i40e-eth0-TxRx-56
    931.00 =C2=B1115%     -38.1%     576.58 =C2=B1 18%     -34.5%     609.7=
8 =C2=B1 29%  interrupts.CPU21.CAL:Function_call_interrupts
      0.00       +8.3e+100%       0.08 =C2=B1331%    -100.0%       0.00    =
    interrupts.CPU21.IWI:IRQ_work_interrupts
    774438 =C2=B1  3%      -6.7%     722473 =C2=B1 18%      +1.2%     78366=
0        interrupts.CPU21.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU21.MCP:Machine_check_polls
    148.44 =C2=B1 84%     -30.2%     103.67 =C2=B1 30%     -54.8%      67.1=
1 =C2=B1 33%  interrupts.CPU21.NMI:Non-maskable_interrupts
    148.44 =C2=B1 84%     -30.2%     103.67 =C2=B1 30%     -54.8%      67.1=
1 =C2=B1 33%  interrupts.CPU21.PMI:Performance_monitoring_interrupts
     50.67 =C2=B1211%     -43.3%      28.75 =C2=B1 72%     -38.2%      31.3=
3 =C2=B1 65%  interrupts.CPU21.RES:Rescheduling_interrupts
      1.56 =C2=B1101%     +39.3%       2.17 =C2=B1151%    +221.4%       5.0=
0 =C2=B1 18%  interrupts.CPU21.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU22.295:PCI-MSI.65536-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU22.297:PCI-MSI.67584-edge.ioat-msix
      0.44 =C2=B1111%     -62.5%       0.17 =C2=B1223%     -75.0%       0.1=
1 =C2=B1282%  interrupts.CPU22.45:PCI-MSI.31981578-edge.i40e-eth0-TxRx-9
      0.00       +8.4e+103%      83.50 =C2=B1297% +2.7e+102%       2.67 =C2=
=B1269%  interrupts.CPU22.58:PCI-MSI.31981591-edge.i40e-eth0-TxRx-22
      0.11 =C2=B1282%     -25.0%       0.08 =C2=B1331%    -100.0%       0.0=
0        interrupts.CPU22.93:PCI-MSI.31981626-edge.i40e-eth0-TxRx-57
    515.56 =C2=B1 11%     +15.9%     597.42 =C2=B1 31%     +36.1%     701.7=
8 =C2=B1 42%  interrupts.CPU22.CAL:Function_call_interrupts
    774528 =C2=B1  3%      -6.7%     722580 =C2=B1 18%      +1.2%     78363=
9        interrupts.CPU22.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU22.MCP:Machine_check_polls
    104.00 =C2=B1 16%      -6.4%      97.33 =C2=B1 25%     -35.7%      66.8=
9 =C2=B1 33%  interrupts.CPU22.NMI:Non-maskable_interrupts
    104.00 =C2=B1 16%      -6.4%      97.33 =C2=B1 25%     -35.7%      66.8=
9 =C2=B1 33%  interrupts.CPU22.PMI:Performance_monitoring_interrupts
      9.67 =C2=B1 35%    +461.2%      54.25 =C2=B1220%    +129.9%      22.2=
2 =C2=B1115%  interrupts.CPU22.RES:Rescheduling_interrupts
      1.44 =C2=B1103%     +90.4%       2.75 =C2=B1123%    +238.5%       4.8=
9 =C2=B1 15%  interrupts.CPU22.TLB:TLB_shootdowns
      0.00       +1.6e+103%      15.92 =C2=B1331%    -100.0%       0.00    =
    interrupts.CPU23.296:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU23.297:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU23.3:IO-APIC.3-edge
      0.22 =C2=B1187%    -100.0%       0.00            +0.0%       0.22 =C2=
=B1187%  interrupts.CPU23.46:PCI-MSI.31981579-edge.i40e-eth0-TxRx-10
      0.00          -100.0%       0.00       +5.7e+102%       5.67 =C2=B128=
2%  interrupts.CPU23.4:IO-APIC.4-edge.ttyS0
     66.22 =C2=B1232%      -6.3%      62.08 =C2=B1285%    +773.0%     578.1=
1 =C2=B1239%  interrupts.CPU23.59:PCI-MSI.31981592-edge.i40e-eth0-TxRx-23
      0.00       +1.7e+101%       0.17 =C2=B1223%    -100.0%       0.00    =
    interrupts.CPU23.94:PCI-MSI.31981627-edge.i40e-eth0-TxRx-58
      1293 =C2=B1164%    +267.3%       4749 =C2=B1290%     -58.1%     542.1=
1 =C2=B1  5%  interrupts.CPU23.CAL:Function_call_interrupts
      0.22 =C2=B1187%     -25.0%       0.17 =C2=B1223%    -100.0%       0.0=
0        interrupts.CPU23.IWI:IRQ_work_interrupts
    774462 =C2=B1  3%      -6.4%     725129 =C2=B1 18%      +1.2%     78362=
8        interrupts.CPU23.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU23.MCP:Machine_check_polls
      1249 =C2=B1171%     -44.3%     696.25 =C2=B1213%     -94.2%      72.2=
2 =C2=B1 29%  interrupts.CPU23.NMI:Non-maskable_interrupts
      1249 =C2=B1171%     -44.3%     696.25 =C2=B1213%     -94.2%      72.2=
2 =C2=B1 29%  interrupts.CPU23.PMI:Performance_monitoring_interrupts
     16.78 =C2=B1 90%     +54.0%      25.83 =C2=B1 56%     -26.5%      12.3=
3 =C2=B1 64%  interrupts.CPU23.RES:Rescheduling_interrupts
      2.56 =C2=B1 94%     +14.1%       2.92 =C2=B1118%     +78.3%       4.5=
6 =C2=B1 25%  interrupts.CPU23.TLB:TLB_shootdowns
     54.44 =C2=B1214%    +316.3%     226.67 =C2=B1238%    +238.0%     184.0=
0 =C2=B1242%  interrupts.CPU24.60:PCI-MSI.31981593-edge.i40e-eth0-TxRx-24
    783.67 =C2=B1 88%      -0.6%     778.75 =C2=B1 95%     -17.1%     649.4=
4 =C2=B1 43%  interrupts.CPU24.CAL:Function_call_interrupts
      0.44 =C2=B1154%     -25.0%       0.33 =C2=B1141%    -100.0%       0.0=
0        interrupts.CPU24.IWI:IRQ_work_interrupts
    742136 =C2=B1 15%      +3.6%     769181 =C2=B1  3%      +5.6%     78360=
8        interrupts.CPU24.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU24.MCP:Machine_check_polls
    142.44 =C2=B1 42%      -7.9%     131.25 =C2=B1 50%     -58.1%      59.6=
7 =C2=B1 36%  interrupts.CPU24.NMI:Non-maskable_interrupts
    142.44 =C2=B1 42%      -7.9%     131.25 =C2=B1 50%     -58.1%      59.6=
7 =C2=B1 36%  interrupts.CPU24.PMI:Performance_monitoring_interrupts
     32.00 =C2=B1140%     -66.7%      10.67 =C2=B1 76%     -61.5%      12.3=
3 =C2=B1131%  interrupts.CPU24.RES:Rescheduling_interrupts
      1.44 =C2=B1108%     +44.2%       2.08 =C2=B1149%    +261.5%       5.2=
2 =C2=B1 19%  interrupts.CPU24.TLB:TLB_shootdowns
      1582 =C2=B1282%     -99.2%      13.17 =C2=B1329%     -98.8%      19.5=
6 =C2=B1187%  interrupts.CPU25.61:PCI-MSI.31981594-edge.i40e-eth0-TxRx-25
      1717 =C2=B1194%     -35.5%       1107 =C2=B1 96%    +324.6%       729=
1 =C2=B1205%  interrupts.CPU25.CAL:Function_call_interrupts
      0.00       +1.7e+101%       0.17 =C2=B1223% +1.1e+101%       0.11 =C2=
=B1282%  interrupts.CPU25.IWI:IRQ_work_interrupts
    743048 =C2=B1 15%      +3.5%     769173 =C2=B1  4%      +5.5%     78364=
5        interrupts.CPU25.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU25.MCP:Machine_check_polls
    121.67 =C2=B1 35%      -3.2%     117.83 =C2=B1 51%     -46.6%      65.0=
0 =C2=B1 34%  interrupts.CPU25.NMI:Non-maskable_interrupts
    121.67 =C2=B1 35%      -3.2%     117.83 =C2=B1 51%     -46.6%      65.0=
0 =C2=B1 34%  interrupts.CPU25.PMI:Performance_monitoring_interrupts
     14.78 =C2=B1124%     +31.4%      19.42 =C2=B1 80%     -21.8%      11.5=
6 =C2=B1 66%  interrupts.CPU25.RES:Rescheduling_interrupts
      1.89 =C2=B1101%     +14.7%       2.17 =C2=B1138%    +170.6%       5.1=
1 =C2=B1 25%  interrupts.CPU25.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU26.305:PCI-MSI.67174400-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU26.306:PCI-MSI.67174400-edge.ioat-msix
      0.00       +2.8e+102%       2.75 =C2=B1243% +1.1e+101%       0.11 =C2=
=B1282%  interrupts.CPU26.62:PCI-MSI.31981595-edge.i40e-eth0-TxRx-26
    535.89          +169.4%       1443 =C2=B1119%    +186.5%       1535 =C2=
=B1179%  interrupts.CPU26.CAL:Function_call_interrupts
    742092 =C2=B1 15%      +3.6%     769143 =C2=B1  3%      +5.6%     78361=
0        interrupts.CPU26.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU26.MCP:Machine_check_polls
    121.00 =C2=B1 33%      +1.8%     123.17 =C2=B1 40%     -47.9%      63.0=
0 =C2=B1 28%  interrupts.CPU26.NMI:Non-maskable_interrupts
    121.00 =C2=B1 33%      +1.8%     123.17 =C2=B1 40%     -47.9%      63.0=
0 =C2=B1 28%  interrupts.CPU26.PMI:Performance_monitoring_interrupts
      7.56 =C2=B1 44%    +161.4%      19.75 =C2=B1 74%    +480.9%      43.8=
9 =C2=B1237%  interrupts.CPU26.RES:Rescheduling_interrupts
      2.00 =C2=B1102%      -8.3%       1.83 =C2=B1163%    +150.0%       5.0=
0 =C2=B1 29%  interrupts.CPU26.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU27.307:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU27.308:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU27.309:PCI-MSI.67176448-edge.ioat-msix
     63.00 =C2=B1282%     -83.5%      10.42 =C2=B1331%     -88.4%       7.3=
3 =C2=B1273%  interrupts.CPU27.63:PCI-MSI.31981596-edge.i40e-eth0-TxRx-27
    966.00 =C2=B1126%     -15.3%     818.17 =C2=B1 66%     +24.5%       120=
2 =C2=B1161%  interrupts.CPU27.CAL:Function_call_interrupts
      0.11 =C2=B1282%     -25.0%       0.08 =C2=B1331%    -100.0%       0.0=
0        interrupts.CPU27.IWI:IRQ_work_interrupts
    742143 =C2=B1 15%      +3.6%     769182 =C2=B1  4%      +5.6%     78362=
3        interrupts.CPU27.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU27.MCP:Machine_check_polls
    125.33 =C2=B1 37%    +397.7%     623.75 =C2=B1267%     -47.5%      65.7=
8 =C2=B1 24%  interrupts.CPU27.NMI:Non-maskable_interrupts
    125.33 =C2=B1 37%    +397.7%     623.75 =C2=B1267%     -47.5%      65.7=
8 =C2=B1 24%  interrupts.CPU27.PMI:Performance_monitoring_interrupts
     14.78 =C2=B1 90%    +131.8%      34.25 =C2=B1 66%    +179.7%      41.3=
3 =C2=B1196%  interrupts.CPU27.RES:Rescheduling_interrupts
      2.22 =C2=B1 98%      -2.5%       2.17 =C2=B1146%    +115.0%       4.7=
8 =C2=B1 32%  interrupts.CPU27.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU28.307:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU28.308:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU28.308:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU28.309:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU28.310:PCI-MSI.67178496-edge.ioat-msix
    210.89 =C2=B1257%     -93.3%      14.17 =C2=B1304%     -21.6%     165.3=
3 =C2=B1282%  interrupts.CPU28.64:PCI-MSI.31981597-edge.i40e-eth0-TxRx-28
      4658 =C2=B1167%     -60.0%       1862 =C2=B1233%     -59.7%       187=
7 =C2=B1185%  interrupts.CPU28.CAL:Function_call_interrupts
    742109 =C2=B1 15%      +3.6%     769079 =C2=B1  4%      +5.6%     78358=
4        interrupts.CPU28.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU28.MCP:Machine_check_polls
    122.00 =C2=B1 34%      +1.6%     123.92 =C2=B1 36%     -45.7%      66.2=
2 =C2=B1 24%  interrupts.CPU28.NMI:Non-maskable_interrupts
    122.00 =C2=B1 34%      +1.6%     123.92 =C2=B1 36%     -45.7%      66.2=
2 =C2=B1 24%  interrupts.CPU28.PMI:Performance_monitoring_interrupts
     16.00 =C2=B1 80%     +25.5%      20.08 =C2=B1 64%     -25.7%      11.8=
9 =C2=B1144%  interrupts.CPU28.RES:Rescheduling_interrupts
      2.56 =C2=B1 86%      -5.4%       2.42 =C2=B1139%    +100.0%       5.1=
1 =C2=B1 29%  interrupts.CPU28.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU29.309:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU29.309:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU29.310:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU29.311:PCI-MSI.67180544-edge.ioat-msix
      8.78 =C2=B1274%     -63.9%       3.17 =C2=B1322%    +829.1%      81.5=
6 =C2=B1261%  interrupts.CPU29.65:PCI-MSI.31981598-edge.i40e-eth0-TxRx-29
      1037 =C2=B1136%     -47.9%     540.42 =C2=B1  5%    +272.5%       386=
4 =C2=B1165%  interrupts.CPU29.CAL:Function_call_interrupts
      0.11 =C2=B1282%    +275.0%       0.42 =C2=B1206%    -100.0%       0.0=
0        interrupts.CPU29.IWI:IRQ_work_interrupts
    742047 =C2=B1 15%      +3.6%     769129 =C2=B1  3%      +5.6%     78357=
8        interrupts.CPU29.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU29.MCP:Machine_check_polls
    125.89 =C2=B1 35%     +13.1%     142.33 =C2=B1 47%     -50.1%      62.7=
8 =C2=B1 24%  interrupts.CPU29.NMI:Non-maskable_interrupts
    125.89 =C2=B1 35%     +13.1%     142.33 =C2=B1 47%     -50.1%      62.7=
8 =C2=B1 24%  interrupts.CPU29.PMI:Performance_monitoring_interrupts
      6.11 =C2=B1 71%    +100.5%      12.25 =C2=B1 86%     -25.5%       4.5=
6 =C2=B1 52%  interrupts.CPU29.RES:Rescheduling_interrupts
      2.22 =C2=B1105%      +8.7%       2.42 =C2=B1139%    +140.0%       5.3=
3 =C2=B1 21%  interrupts.CPU29.TLB:TLB_shootdowns
      0.00       +8.3e+100%       0.08 =C2=B1331% +1.1e+101%       0.11 =C2=
=B1282%  interrupts.CPU3.122:PCI-MSI.31981655-edge.i40e-eth0-TxRx-86
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU3.297:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU3.298:PCI-MSI.69632-edge.ioat-msix
     38.11 =C2=B1232%     -90.8%       3.50 =C2=B1331%    +184.0%     108.2=
2 =C2=B1270%  interrupts.CPU3.39:PCI-MSI.31981572-edge.i40e-eth0-TxRx-3
      0.22 =C2=B1187%     -25.0%       0.17 =C2=B1223%     -50.0%       0.1=
1 =C2=B1282%  interrupts.CPU3.74:PCI-MSI.31981607-edge.i40e-eth0-TxRx-38
      4407 =C2=B1225%     -81.7%     806.25 =C2=B1 74%     +66.4%       733=
1 =C2=B1246%  interrupts.CPU3.CAL:Function_call_interrupts
    774494 =C2=B1  3%      -6.7%     722513 =C2=B1 18%      +1.2%     78351=
0        interrupts.CPU3.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU3.MCP:Machine_check_polls
    103.56 =C2=B1 17%      -8.4%      94.83 =C2=B1 27%     -27.7%      74.8=
9 =C2=B1 17%  interrupts.CPU3.NMI:Non-maskable_interrupts
    103.56 =C2=B1 17%      -8.4%      94.83 =C2=B1 27%     -27.7%      74.8=
9 =C2=B1 17%  interrupts.CPU3.PMI:Performance_monitoring_interrupts
     71.89 =C2=B1245%     -75.7%      17.50 =C2=B1 98%     -75.1%      17.8=
9 =C2=B1118%  interrupts.CPU3.RES:Rescheduling_interrupts
      1.44 =C2=B1 92%     +84.6%       2.67 =C2=B1150%    +153.8%       3.6=
7 =C2=B1 34%  interrupts.CPU3.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU30.310:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU30.310:PCI-MSI.67182592-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU30.311:PCI-MSI.67182592-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU30.312:PCI-MSI.67182592-edge.ioat-msix
      0.00       +1.8e+103%      18.17 =C2=B1176% +1.8e+103%      17.56 =C2=
=B1280%  interrupts.CPU30.66:PCI-MSI.31981599-edge.i40e-eth0-TxRx-30
    637.44 =C2=B1 45%    +453.4%       3527 =C2=B1273%     -16.0%     535.2=
2 =C2=B1  4%  interrupts.CPU30.CAL:Function_call_interrupts
      0.22 =C2=B1187%     -25.0%       0.17 =C2=B1223%    -100.0%       0.0=
0        interrupts.CPU30.IWI:IRQ_work_interrupts
    742040 =C2=B1 15%      +3.7%     769199 =C2=B1  3%      +5.6%     78363=
7        interrupts.CPU30.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU30.MCP:Machine_check_polls
    129.89 =C2=B1 36%      +1.5%     131.83 =C2=B1 41%     -45.6%      70.6=
7 =C2=B1 17%  interrupts.CPU30.NMI:Non-maskable_interrupts
    129.89 =C2=B1 36%      +1.5%     131.83 =C2=B1 41%     -45.6%      70.6=
7 =C2=B1 17%  interrupts.CPU30.PMI:Performance_monitoring_interrupts
     11.00 =C2=B1 83%     +50.0%      16.50 =C2=B1144%     -34.3%       7.2=
2 =C2=B1 91%  interrupts.CPU30.RES:Rescheduling_interrupts
      2.22 =C2=B1105%      +8.7%       2.42 =C2=B1134%    +110.0%       4.6=
7 =C2=B1 31%  interrupts.CPU30.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU31.310:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU31.311:PCI-MSI.67182592-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU31.311:PCI-MSI.67184640-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU31.312:PCI-MSI.67184640-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU31.313:PCI-MSI.67184640-edge.ioat-msix
     14016 =C2=B1282%     -97.8%     306.08 =C2=B1202%     -99.9%      11.3=
3 =C2=B1273%  interrupts.CPU31.67:PCI-MSI.31981600-edge.i40e-eth0-TxRx-31
    852.56 =C2=B1103%    +250.6%       2989 =C2=B1236%    +192.3%       249=
1 =C2=B1221%  interrupts.CPU31.CAL:Function_call_interrupts
      0.11 =C2=B1282%     +50.0%       0.17 =C2=B1223%    -100.0%       0.0=
0        interrupts.CPU31.IWI:IRQ_work_interrupts
    742048 =C2=B1 15%      +3.7%     769150 =C2=B1  3%      +5.6%     78361=
5        interrupts.CPU31.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU31.MCP:Machine_check_polls
    126.11 =C2=B1 32%      -2.5%     122.92 =C2=B1 42%     -39.6%      76.1=
1 =C2=B1 16%  interrupts.CPU31.NMI:Non-maskable_interrupts
    126.11 =C2=B1 32%      -2.5%     122.92 =C2=B1 42%     -39.6%      76.1=
1 =C2=B1 16%  interrupts.CPU31.PMI:Performance_monitoring_interrupts
     21.22 =C2=B1201%     -44.2%      11.83 =C2=B1128%     -55.0%       9.5=
6 =C2=B1110%  interrupts.CPU31.RES:Rescheduling_interrupts
      2.00 =C2=B1120%     +20.8%       2.42 =C2=B1139%    +172.2%       5.4=
4 =C2=B1 23%  interrupts.CPU31.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU32.311:PCI-MSI.67182592-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU32.312:PCI-MSI.67184640-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU32.312:PCI-MSI.67186688-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU32.313:PCI-MSI.67186688-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU32.314:PCI-MSI.67186688-edge.ioat-msix
    102.00 =C2=B1233%    +177.3%     282.83 =C2=B1127%     -99.9%       0.1=
1 =C2=B1282%  interrupts.CPU32.68:PCI-MSI.31981601-edge.i40e-eth0-TxRx-32
      4767 =C2=B1236%     -88.7%     540.17            -4.7%       4541 =C2=
=B1251%  interrupts.CPU32.CAL:Function_call_interrupts
    742042 =C2=B1 15%      +3.6%     769101 =C2=B1  3%      +5.6%     78364=
7        interrupts.CPU32.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU32.MCP:Machine_check_polls
    122.11 =C2=B1 31%      +1.8%     124.25 =C2=B1 35%     -35.8%      78.4=
4 =C2=B1 13%  interrupts.CPU32.NMI:Non-maskable_interrupts
    122.11 =C2=B1 31%      +1.8%     124.25 =C2=B1 35%     -35.8%      78.4=
4 =C2=B1 13%  interrupts.CPU32.PMI:Performance_monitoring_interrupts
     38.33 =C2=B1210%     -60.7%      15.08 =C2=B1152%     -75.7%       9.3=
3 =C2=B1 84%  interrupts.CPU32.RES:Rescheduling_interrupts
      1.78 =C2=B1114%     +31.2%       2.33 =C2=B1150%    +181.2%       5.0=
0 =C2=B1 31%  interrupts.CPU32.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU33.312:PCI-MSI.67184640-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU33.313:PCI-MSI.67186688-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU33.313:PCI-MSI.67188736-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU33.314:PCI-MSI.67188736-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU33.315:PCI-MSI.67188736-edge.ioat-msix
    219.56 =C2=B1193%     -95.9%       8.92 =C2=B1270%    -100.0%       0.0=
0        interrupts.CPU33.69:PCI-MSI.31981602-edge.i40e-eth0-TxRx-33
    531.78 =C2=B1 15%    +106.9%       1100 =C2=B1169%      +2.1%     543.1=
1        interrupts.CPU33.CAL:Function_call_interrupts
      0.00       +1.7e+101%       0.17 =C2=B1223% +1.1e+101%       0.11 =C2=
=B1282%  interrupts.CPU33.IWI:IRQ_work_interrupts
    742063 =C2=B1 15%      +3.6%     769096 =C2=B1  3%      +5.6%     78363=
2        interrupts.CPU33.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU33.MCP:Machine_check_polls
    120.00 =C2=B1 33%    +359.0%     550.83 =C2=B1259%     -30.4%      83.5=
6 =C2=B1 20%  interrupts.CPU33.NMI:Non-maskable_interrupts
    120.00 =C2=B1 33%    +359.0%     550.83 =C2=B1259%     -30.4%      83.5=
6 =C2=B1 20%  interrupts.CPU33.PMI:Performance_monitoring_interrupts
     12.00 =C2=B1 86%     +16.7%      14.00 =C2=B1111%     +27.8%      15.3=
3 =C2=B1 82%  interrupts.CPU33.RES:Rescheduling_interrupts
      1.89 =C2=B1104%     +23.5%       2.33 =C2=B1138%    +176.5%       5.2=
2 =C2=B1 28%  interrupts.CPU33.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU34.313:PCI-MSI.67186688-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU34.314:PCI-MSI.67188736-edge.ioat-msix
     11.67 =C2=B1245%    +706.4%      94.08 =C2=B1331%     -94.3%       0.6=
7 =C2=B1234%  interrupts.CPU34.70:PCI-MSI.31981603-edge.i40e-eth0-TxRx-34
    997.67 =C2=B1127%     -44.4%     555.17 =C2=B1 17%     -32.2%     676.1=
1 =C2=B1 51%  interrupts.CPU34.CAL:Function_call_interrupts
    742089 =C2=B1 15%      +3.6%     769096 =C2=B1  4%      +5.6%     78369=
5        interrupts.CPU34.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU34.MCP:Machine_check_polls
    123.89 =C2=B1 31%      -8.9%     112.92 =C2=B1 40%     -39.0%      75.5=
6 =C2=B1 12%  interrupts.CPU34.NMI:Non-maskable_interrupts
    123.89 =C2=B1 31%      -8.9%     112.92 =C2=B1 40%     -39.0%      75.5=
6 =C2=B1 12%  interrupts.CPU34.PMI:Performance_monitoring_interrupts
     24.67 =C2=B1127%     -56.1%      10.83 =C2=B1131%     -61.7%       9.4=
4 =C2=B1 56%  interrupts.CPU34.RES:Rescheduling_interrupts
      2.22 =C2=B1 94%      +1.2%       2.25 =C2=B1145%    +140.0%       5.3=
3 =C2=B1 26%  interrupts.CPU34.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU35.314:PCI-MSI.67188736-edge.ioat-msix
      2.00 =C2=B1265%    +150.0%       5.00 =C2=B1228%  +19227.8%     386.5=
6 =C2=B1282%  interrupts.CPU35.71:PCI-MSI.31981604-edge.i40e-eth0-TxRx-35
    543.44 =C2=B1  5%     +96.5%       1067 =C2=B1159%      +1.0%     549.1=
1 =C2=B1  8%  interrupts.CPU35.CAL:Function_call_interrupts
      0.22 =C2=B1187%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU35.IWI:IRQ_work_interrupts
    742075 =C2=B1 15%      +3.6%     769098 =C2=B1  4%      +5.6%     78360=
8        interrupts.CPU35.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU35.MCP:Machine_check_polls
    131.33 =C2=B1 38%     -11.5%     116.17 =C2=B1 41%     -41.3%      77.1=
1 =C2=B1 12%  interrupts.CPU35.NMI:Non-maskable_interrupts
    131.33 =C2=B1 38%     -11.5%     116.17 =C2=B1 41%     -41.3%      77.1=
1 =C2=B1 12%  interrupts.CPU35.PMI:Performance_monitoring_interrupts
     13.67 =C2=B1 85%     -22.0%      10.67 =C2=B1113%     -24.4%      10.3=
3 =C2=B1 74%  interrupts.CPU35.RES:Rescheduling_interrupts
      2.00 =C2=B1113%     +25.0%       2.50 =C2=B1146%    +205.6%       6.1=
1 =C2=B1 43%  interrupts.CPU35.TLB:TLB_shootdowns
    207.44 =C2=B1195%     -61.6%      79.58 =C2=B1331%    +794.4%       185=
5 =C2=B1272%  interrupts.CPU36.72:PCI-MSI.31981605-edge.i40e-eth0-TxRx-36
    542.33 =C2=B1  2%     +40.8%     763.42 =C2=B1 97%     +60.5%     870.3=
3 =C2=B1109%  interrupts.CPU36.CAL:Function_call_interrupts
      0.00       +1.7e+101%       0.17 =C2=B1223%    -100.0%       0.00    =
    interrupts.CPU36.IWI:IRQ_work_interrupts
    742038 =C2=B1 15%      +3.7%     769131 =C2=B1  4%      +5.6%     78360=
6        interrupts.CPU36.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU36.MCP:Machine_check_polls
    120.67 =C2=B1 34%      +0.1%     120.83 =C2=B1 46%    +139.8%     289.3=
3 =C2=B1211%  interrupts.CPU36.NMI:Non-maskable_interrupts
    120.67 =C2=B1 34%      +0.1%     120.83 =C2=B1 46%    +139.8%     289.3=
3 =C2=B1211%  interrupts.CPU36.PMI:Performance_monitoring_interrupts
      8.78 =C2=B1 72%     +88.0%      16.50 =C2=B1144%    +246.8%      30.4=
4 =C2=B1173%  interrupts.CPU36.RES:Rescheduling_interrupts
      1.78 =C2=B1 94%     +35.9%       2.42 =C2=B1137%    +187.5%       5.1=
1 =C2=B1 26%  interrupts.CPU36.TLB:TLB_shootdowns
      0.11 =C2=B1282%  +3.4e+05%     378.42 =C2=B1315%  +23900.0%      26.6=
7 =C2=B1196%  interrupts.CPU37.73:PCI-MSI.31981606-edge.i40e-eth0-TxRx-37
    542.22 =C2=B1  2%     +12.5%     609.75 =C2=B1 34%      +3.1%     559.1=
1 =C2=B1  7%  interrupts.CPU37.CAL:Function_call_interrupts
      0.11 =C2=B1282%     -25.0%       0.08 =C2=B1331%      +0.0%       0.1=
1 =C2=B1282%  interrupts.CPU37.IWI:IRQ_work_interrupts
    742093 =C2=B1 15%      +3.6%     769102 =C2=B1  4%      +5.6%     78349=
6        interrupts.CPU37.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU37.MCP:Machine_check_polls
    127.00 =C2=B1 38%      -9.1%     115.50 =C2=B1 52%     -34.1%      83.6=
7 =C2=B1 29%  interrupts.CPU37.NMI:Non-maskable_interrupts
    127.00 =C2=B1 38%      -9.1%     115.50 =C2=B1 52%     -34.1%      83.6=
7 =C2=B1 29%  interrupts.CPU37.PMI:Performance_monitoring_interrupts
      8.00 =C2=B1 33%    +141.7%      19.33 =C2=B1112%     +77.8%      14.2=
2 =C2=B1 81%  interrupts.CPU37.RES:Rescheduling_interrupts
      1.78 =C2=B1101%     +50.0%       2.67 =C2=B1138%    +212.5%       5.5=
6 =C2=B1 22%  interrupts.CPU37.TLB:TLB_shootdowns
    182.11 =C2=B1265%    +277.1%     686.75 =C2=B1327%     -48.2%      94.3=
3 =C2=B1282%  interrupts.CPU38.74:PCI-MSI.31981607-edge.i40e-eth0-TxRx-38
    535.78            +0.4%     537.75            +1.7%     545.11        i=
nterrupts.CPU38.CAL:Function_call_interrupts
      0.11 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU38.IWI:IRQ_work_interrupts
    742247 =C2=B1 15%      +3.6%     769074 =C2=B1  3%      +5.6%     78374=
1        interrupts.CPU38.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU38.MCP:Machine_check_polls
    125.89 =C2=B1 34%     -11.4%     111.58 =C2=B1 46%     -39.4%      76.3=
3 =C2=B1 13%  interrupts.CPU38.NMI:Non-maskable_interrupts
    125.89 =C2=B1 34%     -11.4%     111.58 =C2=B1 46%     -39.4%      76.3=
3 =C2=B1 13%  interrupts.CPU38.PMI:Performance_monitoring_interrupts
     19.44 =C2=B1142%     -45.6%      10.58 =C2=B1100%      -1.7%      19.1=
1 =C2=B1103%  interrupts.CPU38.RES:Rescheduling_interrupts
      2.11 =C2=B1 95%     +22.4%       2.58 =C2=B1130%    +168.4%       5.6=
7 =C2=B1 22%  interrupts.CPU38.TLB:TLB_shootdowns
    344.44 =C2=B1273%     -89.5%      36.25 =C2=B1319%     -51.6%     166.5=
6 =C2=B1282%  interrupts.CPU39.75:PCI-MSI.31981608-edge.i40e-eth0-TxRx-39
    536.67            +0.6%     539.83            +1.4%     544.00        i=
nterrupts.CPU39.CAL:Function_call_interrupts
    742253 =C2=B1 15%      +3.6%     769164 =C2=B1  3%      +5.6%     78361=
4        interrupts.CPU39.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU39.MCP:Machine_check_polls
    116.78 =C2=B1 40%      -5.7%     110.17 =C2=B1 46%     -33.5%      77.6=
7 =C2=B1 14%  interrupts.CPU39.NMI:Non-maskable_interrupts
    116.78 =C2=B1 40%      -5.7%     110.17 =C2=B1 46%     -33.5%      77.6=
7 =C2=B1 14%  interrupts.CPU39.PMI:Performance_monitoring_interrupts
      9.44 =C2=B1 76%     +87.1%      17.67 =C2=B1152%     +61.2%      15.2=
2 =C2=B1 49%  interrupts.CPU39.RES:Rescheduling_interrupts
      2.22 =C2=B1 94%     +20.0%       2.67 =C2=B1127%    +160.0%       5.7=
8 =C2=B1 32%  interrupts.CPU39.TLB:TLB_shootdowns
      0.11 =C2=B1282%    -100.0%       0.00          +200.0%       0.33 =C2=
=B1141%  interrupts.CPU4.123:PCI-MSI.31981656-edge.i40e-eth0-TxRx-87
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU4.298:PCI-MSI.69632-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU4.29:PCI-MSI.48791552-edge.PCIe.PME,pciehp
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU4.302:PCI-MSI.77824-edge.ioat-msix
     34.44 =C2=B1191%    +487.7%     202.42 =C2=B1304%     -99.7%       0.1=
1 =C2=B1282%  interrupts.CPU4.40:PCI-MSI.31981573-edge.i40e-eth0-TxRx-4
      0.22 =C2=B1187%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU4.75:PCI-MSI.31981608-edge.i40e-eth0-TxRx-39
    621.33 =C2=B1 23%     +40.4%     872.50 =C2=B1 53%     +73.5%       107=
7 =C2=B1103%  interrupts.CPU4.CAL:Function_call_interrupts
    774520 =C2=B1  3%      -6.7%     722765 =C2=B1 18%      +1.2%     78374=
2        interrupts.CPU4.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU4.MCP:Machine_check_polls
     94.89 =C2=B1 21%      +5.6%     100.25 =C2=B1 25%     -14.8%      80.8=
9 =C2=B1 15%  interrupts.CPU4.NMI:Non-maskable_interrupts
     94.89 =C2=B1 21%      +5.6%     100.25 =C2=B1 25%     -14.8%      80.8=
9 =C2=B1 15%  interrupts.CPU4.PMI:Performance_monitoring_interrupts
     27.00 =C2=B1183%    +156.2%      69.17 =C2=B1188%     -37.9%      16.7=
8 =C2=B1 97%  interrupts.CPU4.RES:Rescheduling_interrupts
      1.33 =C2=B1106%     +37.5%       1.83 =C2=B1150%    +158.3%       3.4=
4 =C2=B1 30%  interrupts.CPU4.TLB:TLB_shootdowns
    101.78 =C2=B1282%     +15.4%     117.50 =C2=B1331%     +27.2%     129.4=
4 =C2=B1282%  interrupts.CPU40.76:PCI-MSI.31981609-edge.i40e-eth0-TxRx-40
    543.89 =C2=B1  4%      +5.8%     575.17 =C2=B1 15%     +12.4%     611.5=
6 =C2=B1 31%  interrupts.CPU40.CAL:Function_call_interrupts
    742032 =C2=B1 15%      +3.7%     769181 =C2=B1  3%      +5.6%     78363=
3        interrupts.CPU40.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU40.MCP:Machine_check_polls
    117.89 =C2=B1 40%      -1.9%     115.67 =C2=B1 44%     -35.6%      75.8=
9 =C2=B1 14%  interrupts.CPU40.NMI:Non-maskable_interrupts
    117.89 =C2=B1 40%      -1.9%     115.67 =C2=B1 44%     -35.6%      75.8=
9 =C2=B1 14%  interrupts.CPU40.PMI:Performance_monitoring_interrupts
      7.11 =C2=B1 79%     +69.9%      12.08 =C2=B1 50%    +120.3%      15.6=
7 =C2=B1 96%  interrupts.CPU40.RES:Rescheduling_interrupts
      2.33 =C2=B1 85%      +7.1%       2.50 =C2=B1125%    +147.6%       5.7=
8 =C2=B1 29%  interrupts.CPU40.TLB:TLB_shootdowns
     37.56 =C2=B1225%     -94.9%       1.92 =C2=B1300%     +92.3%      72.2=
2 =C2=B1245%  interrupts.CPU41.77:PCI-MSI.31981610-edge.i40e-eth0-TxRx-41
    571.11 =C2=B1 18%     +38.9%     793.00 =C2=B1 95%      -4.8%     543.4=
4        interrupts.CPU41.CAL:Function_call_interrupts
      0.11 =C2=B1282%     -25.0%       0.08 =C2=B1331%    -100.0%       0.0=
0        interrupts.CPU41.IWI:IRQ_work_interrupts
    742021 =C2=B1 15%      +3.6%     769093 =C2=B1  3%      +5.6%     78362=
8        interrupts.CPU41.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU41.MCP:Machine_check_polls
    127.11 =C2=B1 37%      -5.5%     120.08 =C2=B1 44%     -38.3%      78.4=
4 =C2=B1 16%  interrupts.CPU41.NMI:Non-maskable_interrupts
    127.11 =C2=B1 37%      -5.5%     120.08 =C2=B1 44%     -38.3%      78.4=
4 =C2=B1 16%  interrupts.CPU41.PMI:Performance_monitoring_interrupts
      9.89 =C2=B1 71%    +465.4%      55.92 =C2=B1186%     +22.5%      12.1=
1 =C2=B1 59%  interrupts.CPU41.RES:Rescheduling_interrupts
      2.33 =C2=B1104%      +7.1%       2.50 =C2=B1113%    +138.1%       5.5=
6 =C2=B1 28%  interrupts.CPU41.TLB:TLB_shootdowns
     16.44 =C2=B1280%    +363.2%      76.17 =C2=B1319%     -78.4%       3.5=
6 =C2=B1282%  interrupts.CPU42.78:PCI-MSI.31981611-edge.i40e-eth0-TxRx-42
    587.78 =C2=B1 29%      -1.7%     577.75 =C2=B1 22%     +31.4%     772.2=
2 =C2=B1 83%  interrupts.CPU42.CAL:Function_call_interrupts
      0.00       +8.3e+100%       0.08 =C2=B1331%    -100.0%       0.00    =
    interrupts.CPU42.IWI:IRQ_work_interrupts
    742138 =C2=B1 15%      +3.6%     769180 =C2=B1  4%      +5.6%     78366=
9        interrupts.CPU42.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU42.MCP:Machine_check_polls
    114.22 =C2=B1 31%      +4.8%     119.67 =C2=B1 47%     -37.7%      71.1=
1 =C2=B1 22%  interrupts.CPU42.NMI:Non-maskable_interrupts
    114.22 =C2=B1 31%      +4.8%     119.67 =C2=B1 47%     -37.7%      71.1=
1 =C2=B1 22%  interrupts.CPU42.PMI:Performance_monitoring_interrupts
     15.00 =C2=B1115%     +12.8%      16.92 =C2=B1 90%    +152.6%      37.8=
9 =C2=B1202%  interrupts.CPU42.RES:Rescheduling_interrupts
      2.11 =C2=B1 95%     +18.4%       2.50 =C2=B1127%    +157.9%       5.4=
4 =C2=B1 27%  interrupts.CPU42.TLB:TLB_shootdowns
      0.00       +8.4e+102%       8.42 =C2=B1328% +1.2e+103%      12.22 =C2=
=B1210%  interrupts.CPU43.79:PCI-MSI.31981612-edge.i40e-eth0-TxRx-43
      2710 =C2=B1226%     -77.4%     613.17 =C2=B1 21%     -79.9%     543.4=
4        interrupts.CPU43.CAL:Function_call_interrupts
    742228 =C2=B1 15%      +3.6%     769138 =C2=B1  4%      +5.6%     78360=
3        interrupts.CPU43.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU43.MCP:Machine_check_polls
    107.89 =C2=B1 33%      +4.7%     113.00 =C2=B1 42%     -31.2%      74.2=
2 =C2=B1 23%  interrupts.CPU43.NMI:Non-maskable_interrupts
    107.89 =C2=B1 33%      +4.7%     113.00 =C2=B1 42%     -31.2%      74.2=
2 =C2=B1 23%  interrupts.CPU43.PMI:Performance_monitoring_interrupts
     26.33 =C2=B1136%     -65.8%       9.00 =C2=B1106%     -48.5%      13.5=
6 =C2=B1 78%  interrupts.CPU43.RES:Rescheduling_interrupts
      2.11 =C2=B1 93%     +22.4%       2.58 =C2=B1127%    +168.4%       5.6=
7 =C2=B1 23%  interrupts.CPU43.TLB:TLB_shootdowns
     33.56 =C2=B1281%    +112.6%      71.33 =C2=B1324%    +196.7%      99.5=
6 =C2=B1282%  interrupts.CPU44.80:PCI-MSI.31981613-edge.i40e-eth0-TxRx-44
    543.44 =C2=B1  2%    +271.5%       2018 =C2=B1231%    +133.0%       126=
6 =C2=B1161%  interrupts.CPU44.CAL:Function_call_interrupts
    742102 =C2=B1 15%      +3.6%     769068 =C2=B1  4%      +5.6%     78368=
6        interrupts.CPU44.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU44.MCP:Machine_check_polls
    123.44 =C2=B1 32%      -5.0%     117.33 =C2=B1 45%    +133.9%     288.7=
8 =C2=B1212%  interrupts.CPU44.NMI:Non-maskable_interrupts
    123.44 =C2=B1 32%      -5.0%     117.33 =C2=B1 45%    +133.9%     288.7=
8 =C2=B1212%  interrupts.CPU44.PMI:Performance_monitoring_interrupts
      9.67 =C2=B1 95%     -27.6%       7.00 =C2=B1 57%    +274.7%      36.2=
2 =C2=B1116%  interrupts.CPU44.RES:Rescheduling_interrupts
      2.11 =C2=B1 93%     +50.0%       3.17 =C2=B1 99%    +168.4%       5.6=
7 =C2=B1 23%  interrupts.CPU44.TLB:TLB_shootdowns
      0.00       +1.7e+104%     165.33 =C2=B1254% +1.7e+103%      17.44 =C2=
=B1282%  interrupts.CPU45.81:PCI-MSI.31981614-edge.i40e-eth0-TxRx-45
    537.78            +0.5%     540.33           +14.0%     613.11 =C2=B1 3=
2%  interrupts.CPU45.CAL:Function_call_interrupts
      0.00       +8.3e+100%       0.08 =C2=B1331%    -100.0%       0.00    =
    interrupts.CPU45.IWI:IRQ_work_interrupts
    742106 =C2=B1 15%      +3.6%     769107 =C2=B1  3%      +5.6%     78359=
3        interrupts.CPU45.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU45.MCP:Machine_check_polls
    121.00 =C2=B1 34%      -1.3%     119.42 =C2=B1 47%     -41.5%      70.7=
8 =C2=B1 24%  interrupts.CPU45.NMI:Non-maskable_interrupts
    121.00 =C2=B1 34%      -1.3%     119.42 =C2=B1 47%     -41.5%      70.7=
8 =C2=B1 24%  interrupts.CPU45.PMI:Performance_monitoring_interrupts
     10.00 =C2=B1 64%     -41.7%       5.83 =C2=B1 88%     +65.6%      16.5=
6 =C2=B1 72%  interrupts.CPU45.RES:Rescheduling_interrupts
      2.44 =C2=B1 79%     +26.1%       3.08 =C2=B1104%    +150.0%       6.1=
1 =C2=B1 21%  interrupts.CPU45.TLB:TLB_shootdowns
    108.33 =C2=B1253%      +9.4%     118.50 =C2=B1235%     -98.3%       1.8=
9 =C2=B1282%  interrupts.CPU46.82:PCI-MSI.31981615-edge.i40e-eth0-TxRx-46
    537.89 =C2=B1  7%      +0.5%     540.75            +1.0%     543.44    =
    interrupts.CPU46.CAL:Function_call_interrupts
      0.11 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU46.IWI:IRQ_work_interrupts
    742087 =C2=B1 15%      +3.6%     769137 =C2=B1  3%      +5.6%     78359=
6        interrupts.CPU46.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU46.MCP:Machine_check_polls
    113.33 =C2=B1 44%      +4.4%     118.33 =C2=B1 45%     -37.2%      71.2=
2 =C2=B1 23%  interrupts.CPU46.NMI:Non-maskable_interrupts
    113.33 =C2=B1 44%      +4.4%     118.33 =C2=B1 45%     -37.2%      71.2=
2 =C2=B1 23%  interrupts.CPU46.PMI:Performance_monitoring_interrupts
      9.44 =C2=B1 85%     +20.0%      11.33 =C2=B1122%     -55.3%       4.2=
2 =C2=B1 62%  interrupts.CPU46.RES:Rescheduling_interrupts
      2.56 =C2=B1 78%     +30.4%       3.33 =C2=B1101%    +139.1%       6.1=
1 =C2=B1 14%  interrupts.CPU46.TLB:TLB_shootdowns
     11.33 =C2=B1245%     +79.4%      20.33 =C2=B1224%     -96.1%       0.4=
4 =C2=B1282%  interrupts.CPU47.83:PCI-MSI.31981616-edge.i40e-eth0-TxRx-47
    906.78 =C2=B1 52%     -19.9%     726.75 =C2=B1 14%     -20.6%     719.7=
8 =C2=B1 11%  interrupts.CPU47.CAL:Function_call_interrupts
      0.33 =C2=B1141%     -50.0%       0.17 =C2=B1223%    -100.0%       0.0=
0        interrupts.CPU47.IWI:IRQ_work_interrupts
    742100 =C2=B1 15%      +3.6%     769147 =C2=B1  3%      +5.6%     78365=
9        interrupts.CPU47.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU47.MCP:Machine_check_polls
    124.33 =C2=B1 47%      +3.5%     128.67 =C2=B1 49%     -43.8%      69.8=
9 =C2=B1 30%  interrupts.CPU47.NMI:Non-maskable_interrupts
    124.33 =C2=B1 47%      +3.5%     128.67 =C2=B1 49%     -43.8%      69.8=
9 =C2=B1 30%  interrupts.CPU47.PMI:Performance_monitoring_interrupts
     19.67 =C2=B1126%     -17.8%      16.17 =C2=B1 86%     +61.0%      31.6=
7 =C2=B1149%  interrupts.CPU47.RES:Rescheduling_interrupts
      2.89 =C2=B1 73%     +26.9%       3.67 =C2=B1 91%    +115.4%       6.2=
2 =C2=B1 18%  interrupts.CPU47.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU48.295:PCI-MSI.65536-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU48.3:IO-APIC.3-edge
      0.22 =C2=B1187%     -25.0%       0.17 =C2=B1223%      +0.0%       0.2=
2 =C2=B1187%  interrupts.CPU48.47:PCI-MSI.31981580-edge.i40e-eth0-TxRx-11
      0.00          -100.0%       0.00       +5.1e+102%       5.11 =C2=B128=
2%  interrupts.CPU48.4:IO-APIC.4-edge.ttyS0
    134.22 =C2=B1273%     -99.9%       0.17 =C2=B1223%     -99.6%       0.5=
6 =C2=B1226%  interrupts.CPU48.84:PCI-MSI.31981617-edge.i40e-eth0-TxRx-48
      0.00       +1.7e+101%       0.17 =C2=B1223%    -100.0%       0.00    =
    interrupts.CPU48.95:PCI-MSI.31981628-edge.i40e-eth0-TxRx-59
    589.89 =C2=B1 21%     +46.8%     865.75 =C2=B1120%      -3.7%     568.0=
0 =C2=B1 11%  interrupts.CPU48.CAL:Function_call_interrupts
      0.00       +8.3e+100%       0.08 =C2=B1331%    -100.0%       0.00    =
    interrupts.CPU48.IWI:IRQ_work_interrupts
    774480 =C2=B1  3%      -6.7%     722507 =C2=B1 18%      +1.2%     78370=
8        interrupts.CPU48.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU48.MCP:Machine_check_polls
     93.78 =C2=B1 31%    +434.7%     501.42 =C2=B1261%     -27.4%      68.1=
1 =C2=B1 27%  interrupts.CPU48.NMI:Non-maskable_interrupts
     93.78 =C2=B1 31%    +434.7%     501.42 =C2=B1261%     -27.4%      68.1=
1 =C2=B1 27%  interrupts.CPU48.PMI:Performance_monitoring_interrupts
     19.89 =C2=B1 72%     +37.8%      27.42 =C2=B1143%     -64.8%       7.0=
0 =C2=B1104%  interrupts.CPU48.RES:Rescheduling_interrupts
      3.67 =C2=B1126%     -31.8%       2.50 =C2=B1124%     +51.5%       5.5=
6 =C2=B1 22%  interrupts.CPU48.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU49.295:PCI-MSI.65536-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU49.3:IO-APIC.3-edge
      0.11 =C2=B1282%    +125.0%       0.25 =C2=B1173%    +100.0%       0.2=
2 =C2=B1187%  interrupts.CPU49.48:PCI-MSI.31981581-edge.i40e-eth0-TxRx-12
     56.56 =C2=B1277%  +20032.6%      11386 =C2=B1233%     -94.9%       2.8=
9 =C2=B1178%  interrupts.CPU49.85:PCI-MSI.31981618-edge.i40e-eth0-TxRx-49
      0.22 =C2=B1187%     -25.0%       0.17 =C2=B1223%     +50.0%       0.3=
3 =C2=B1141%  interrupts.CPU49.96:PCI-MSI.31981629-edge.i40e-eth0-TxRx-60
    852.33 =C2=B1 69%      -8.7%     777.83 =C2=B1 91%     -35.6%     548.6=
7 =C2=B1  2%  interrupts.CPU49.CAL:Function_call_interrupts
    774464 =C2=B1  3%      -6.7%     722496 =C2=B1 18%      +1.2%     78358=
7        interrupts.CPU49.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU49.MCP:Machine_check_polls
    100.44 =C2=B1 22%    +311.8%     413.58 =C2=B1194%     -13.2%      87.2=
2 =C2=B1 67%  interrupts.CPU49.NMI:Non-maskable_interrupts
    100.44 =C2=B1 22%    +311.8%     413.58 =C2=B1194%     -13.2%      87.2=
2 =C2=B1 67%  interrupts.CPU49.PMI:Performance_monitoring_interrupts
     12.67 =C2=B1 50%     +40.1%      17.75 =C2=B1 95%    +171.9%      34.4=
4 =C2=B1162%  interrupts.CPU49.RES:Rescheduling_interrupts
      2.22 =C2=B1 98%      -2.5%       2.17 =C2=B1144%    +175.0%       6.1=
1 =C2=B1 36%  interrupts.CPU49.TLB:TLB_shootdowns
      0.00       +3.3e+101%       0.33 =C2=B1141% +1.1e+101%       0.11 =C2=
=B1282%  interrupts.CPU5.124:PCI-MSI.31981657-edge.i40e-eth0-TxRx-88
     21.22 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU5.298:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU5.298:PCI-MSI.69632-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU5.299:PCI-MSI.71680-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU5.30:PCI-MSI.48807936-edge.PCIe.PME,pciehp
      2667 =C2=B1282%     -97.6%      63.25 =C2=B1325%     -99.8%       5.7=
8 =C2=B1282%  interrupts.CPU5.41:PCI-MSI.31981574-edge.i40e-eth0-TxRx-5
      0.11 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU5.76:PCI-MSI.31981609-edge.i40e-eth0-TxRx-40
      3265 =C2=B1232%     -80.0%     653.50 =C2=B1 39%     -75.1%     811.5=
6 =C2=B1 79%  interrupts.CPU5.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.1e+101%       0.11 =C2=B128=
2%  interrupts.CPU5.IWI:IRQ_work_interrupts
    774423 =C2=B1  3%      -6.7%     722634 =C2=B1 18%      +1.2%     78369=
0        interrupts.CPU5.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU5.MCP:Machine_check_polls
     85.56 =C2=B1 32%     +14.3%      97.75 =C2=B1 26%    +650.8%     642.3=
3 =C2=B1253%  interrupts.CPU5.NMI:Non-maskable_interrupts
     85.56 =C2=B1 32%     +14.3%      97.75 =C2=B1 26%    +650.8%     642.3=
3 =C2=B1253%  interrupts.CPU5.PMI:Performance_monitoring_interrupts
      5.56 =C2=B1 68%    +611.0%      39.50 =C2=B1194%     +52.0%       8.4=
4 =C2=B1 84%  interrupts.CPU5.RES:Rescheduling_interrupts
      1.56 =C2=B1 80%     +28.6%       2.00 =C2=B1139%    +214.3%       4.8=
9 =C2=B1 61%  interrupts.CPU5.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU50.297:PCI-MSI.67584-edge.ioat-msix
      0.33 =C2=B1141%     -50.0%       0.17 =C2=B1223%     -66.7%       0.1=
1 =C2=B1282%  interrupts.CPU50.49:PCI-MSI.31981582-edge.i40e-eth0-TxRx-13
      0.00          -100.0%       0.00       +5.7e+102%       5.67 =C2=B128=
2%  interrupts.CPU50.4:IO-APIC.4-edge.ttyS0
     18.44 =C2=B1265%   +1356.6%     268.67 =C2=B1325%     +62.0%      29.8=
9 =C2=B1282%  interrupts.CPU50.86:PCI-MSI.31981619-edge.i40e-eth0-TxRx-50
      0.11 =C2=B1282%    +125.0%       0.25 =C2=B1173%    +200.0%       0.3=
3 =C2=B1141%  interrupts.CPU50.97:PCI-MSI.31981630-edge.i40e-eth0-TxRx-61
    542.78 =C2=B1  2%      -0.4%     540.58            +2.4%     555.78 =C2=
=B1  4%  interrupts.CPU50.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.1e+101%       0.11 =C2=B128=
2%  interrupts.CPU50.IWI:IRQ_work_interrupts
    774379 =C2=B1  3%      -6.7%     722434 =C2=B1 18%      +1.2%     78372=
7        interrupts.CPU50.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU50.MCP:Machine_check_polls
    763.78 =C2=B1168%     -87.4%      96.17 =C2=B1 35%     -31.5%     523.2=
2 =C2=B1241%  interrupts.CPU50.NMI:Non-maskable_interrupts
    763.78 =C2=B1168%     -87.4%      96.17 =C2=B1 35%     -31.5%     523.2=
2 =C2=B1241%  interrupts.CPU50.PMI:Performance_monitoring_interrupts
     21.78 =C2=B1101%     -41.8%      12.67 =C2=B1128%     -26.0%      16.1=
1 =C2=B1140%  interrupts.CPU50.RES:Rescheduling_interrupts
      2.89 =C2=B1134%     -22.1%       2.25 =C2=B1139%    +100.0%       5.7=
8 =C2=B1 19%  interrupts.CPU50.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU51.295:PCI-MSI.65536-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU51.297:PCI-MSI.67584-edge.ioat-msix
      8.33 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU51.315:PCI-MSI.376832-edge.ahci[0000:00:17.0]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU51.3:IO-APIC.3-edge
      0.22 =C2=B1187%    -100.0%       0.00            +0.0%       0.22 =C2=
=B1187%  interrupts.CPU51.50:PCI-MSI.31981583-edge.i40e-eth0-TxRx-14
    114.11 =C2=B1278%     +23.9%     141.33 =C2=B1195%     +37.6%     157.0=
0 =C2=B1236%  interrupts.CPU51.87:PCI-MSI.31981620-edge.i40e-eth0-TxRx-51
      0.11 =C2=B1282%    +350.0%       0.50 =C2=B1100%      +0.0%       0.1=
1 =C2=B1282%  interrupts.CPU51.98:PCI-MSI.31981631-edge.i40e-eth0-TxRx-62
    913.11 =C2=B1 79%     -41.0%     539.08            -0.4%     909.78 =C2=
=B1109%  interrupts.CPU51.CAL:Function_call_interrupts
    774452 =C2=B1  3%      -6.7%     722596 =C2=B1 18%      +1.2%     78358=
9        interrupts.CPU51.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU51.MCP:Machine_check_polls
    101.67 =C2=B1 15%      +0.2%     101.83 =C2=B1 29%     -25.0%      76.2=
2 =C2=B1 22%  interrupts.CPU51.NMI:Non-maskable_interrupts
    101.67 =C2=B1 15%      +0.2%     101.83 =C2=B1 29%     -25.0%      76.2=
2 =C2=B1 22%  interrupts.CPU51.PMI:Performance_monitoring_interrupts
      9.11 =C2=B1 54%    +122.3%      20.25 =C2=B1166%    +529.3%      57.3=
3 =C2=B1213%  interrupts.CPU51.RES:Rescheduling_interrupts
      2.33 =C2=B1 92%     +10.7%       2.58 =C2=B1128%    +104.8%       4.7=
8 =C2=B1 23%  interrupts.CPU51.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU52.295:PCI-MSI.65536-edge.ioat-msix
      0.00          -100.0%       0.00       +5.1e+102%       5.11 =C2=B128=
2%  interrupts.CPU52.4:IO-APIC.4-edge.ttyS0
      0.11 =C2=B1282%    +200.0%       0.33 =C2=B1141%      +0.0%       0.1=
1 =C2=B1282%  interrupts.CPU52.51:PCI-MSI.31981584-edge.i40e-eth0-TxRx-15
      1.22 =C2=B1203%   +9704.5%     119.83 =C2=B1295%    +345.5%       5.4=
4 =C2=B1121%  interrupts.CPU52.88:PCI-MSI.31981621-edge.i40e-eth0-TxRx-52
      0.22 =C2=B1187%     -62.5%       0.08 =C2=B1331%     -50.0%       0.1=
1 =C2=B1282%  interrupts.CPU52.99:PCI-MSI.31981632-edge.i40e-eth0-TxRx-63
    811.11 =C2=B1 71%     -33.3%     541.33           -28.4%     580.56 =C2=
=B1 17%  interrupts.CPU52.CAL:Function_call_interrupts
      0.00       +8.3e+100%       0.08 =C2=B1331%    -100.0%       0.00    =
    interrupts.CPU52.IWI:IRQ_work_interrupts
    774498 =C2=B1  3%      -6.7%     722808 =C2=B1 18%      +1.2%     78364=
0        interrupts.CPU52.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU52.MCP:Machine_check_polls
    102.67 =C2=B1 18%      +0.0%     102.67 =C2=B1 31%     -27.2%      74.7=
8 =C2=B1 22%  interrupts.CPU52.NMI:Non-maskable_interrupts
    102.67 =C2=B1 18%      +0.0%     102.67 =C2=B1 31%     -27.2%      74.7=
8 =C2=B1 22%  interrupts.CPU52.PMI:Performance_monitoring_interrupts
      8.33 =C2=B1 47%    +119.0%      18.25 =C2=B1137%    +120.0%      18.3=
3 =C2=B1162%  interrupts.CPU52.RES:Rescheduling_interrupts
      2.33 =C2=B1 78%     +21.4%       2.83 =C2=B1122%    +133.3%       5.4=
4 =C2=B1 21%  interrupts.CPU52.TLB:TLB_shootdowns
      0.00       +1.7e+101%       0.17 =C2=B1223% +2.2e+101%       0.22 =C2=
=B1187%  interrupts.CPU53.100:PCI-MSI.31981633-edge.i40e-eth0-TxRx-64
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU53.3:IO-APIC.3-edge
      0.00       +4.3e+102%       4.33 =C2=B1331%    -100.0%       0.00    =
    interrupts.CPU53.4:IO-APIC.4-edge.ttyS0
      0.00       +1.7e+101%       0.17 =C2=B1223% +1.1e+101%       0.11 =C2=
=B1282%  interrupts.CPU53.52:PCI-MSI.31981585-edge.i40e-eth0-TxRx-16
      5.22 =C2=B1282%     -18.6%       4.25 =C2=B1227%     -44.7%       2.8=
9 =C2=B1282%  interrupts.CPU53.89:PCI-MSI.31981622-edge.i40e-eth0-TxRx-53
    540.00 =C2=B1  2%     +12.4%     607.17 =C2=B1 34%      +1.5%     547.8=
9 =C2=B1  2%  interrupts.CPU53.CAL:Function_call_interrupts
      0.00       +8.3e+100%       0.08 =C2=B1331% +2.2e+101%       0.22 =C2=
=B1282%  interrupts.CPU53.IWI:IRQ_work_interrupts
    774539 =C2=B1  3%      -6.7%     722657 =C2=B1 18%      +1.2%     78362=
0        interrupts.CPU53.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU53.MCP:Machine_check_polls
     99.22 =C2=B1 26%     +12.1%     111.25 =C2=B1 33%    +295.9%     392.7=
8 =C2=B1231%  interrupts.CPU53.NMI:Non-maskable_interrupts
     99.22 =C2=B1 26%     +12.1%     111.25 =C2=B1 33%    +295.9%     392.7=
8 =C2=B1231%  interrupts.CPU53.PMI:Performance_monitoring_interrupts
      9.89 =C2=B1 63%    +219.4%      31.58 =C2=B1142%     +31.5%      13.0=
0 =C2=B1127%  interrupts.CPU53.RES:Rescheduling_interrupts
      2.22 =C2=B1 89%     +16.2%       2.58 =C2=B1135%    +140.0%       5.3=
3 =C2=B1 27%  interrupts.CPU53.TLB:TLB_shootdowns
      0.22 =C2=B1187%     -62.5%       0.08 =C2=B1331%     -50.0%       0.1=
1 =C2=B1282%  interrupts.CPU54.101:PCI-MSI.31981634-edge.i40e-eth0-TxRx-65
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU54.297:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU54.298:PCI-MSI.69632-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU54.3:IO-APIC.3-edge
      5.89 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU54.4:IO-APIC.4-edge.ttyS0
      0.00          -100.0%       0.00       +1.1e+101%       0.11 =C2=B128=
2%  interrupts.CPU54.53:PCI-MSI.31981586-edge.i40e-eth0-TxRx-17
      9.89 =C2=B1234%    +850.6%      94.00 =C2=B1329%     -66.3%       3.3=
3 =C2=B1282%  interrupts.CPU54.90:PCI-MSI.31981623-edge.i40e-eth0-TxRx-54
    535.67          +104.0%       1093 =C2=B1112%      -0.0%     535.56 =C2=
=B1  5%  interrupts.CPU54.CAL:Function_call_interrupts
      0.00       +8.3e+100%       0.08 =C2=B1331%    -100.0%       0.00    =
    interrupts.CPU54.IWI:IRQ_work_interrupts
    774484 =C2=B1  3%      -6.7%     722929 =C2=B1 18%      +1.2%     78362=
1        interrupts.CPU54.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU54.MCP:Machine_check_polls
     95.56 =C2=B1 26%    +163.6%     251.92 =C2=B1218%    +134.0%     223.5=
6 =C2=B1186%  interrupts.CPU54.NMI:Non-maskable_interrupts
     95.56 =C2=B1 26%    +163.6%     251.92 =C2=B1218%    +134.0%     223.5=
6 =C2=B1186%  interrupts.CPU54.PMI:Performance_monitoring_interrupts
      7.44 =C2=B1 63%    +376.9%      35.50 =C2=B1128%     +62.7%      12.1=
1 =C2=B1 75%  interrupts.CPU54.RES:Rescheduling_interrupts
      2.78 =C2=B1 84%      +5.0%       2.92 =C2=B1120%    +116.0%       6.0=
0 =C2=B1 56%  interrupts.CPU54.TLB:TLB_shootdowns
      0.11 =C2=B1282%     -25.0%       0.08 =C2=B1331%      +0.0%       0.1=
1 =C2=B1282%  interrupts.CPU55.102:PCI-MSI.31981635-edge.i40e-eth0-TxRx-66
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU55.295:PCI-MSI.65536-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU55.298:PCI-MSI.69632-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU55.3:IO-APIC.3-edge
      0.00       +8.3e+100%       0.08 =C2=B1331% +2.2e+101%       0.22 =C2=
=B1187%  interrupts.CPU55.54:PCI-MSI.31981587-edge.i40e-eth0-TxRx-18
      0.22 =C2=B1187%   +6162.5%      13.92 =C2=B1180%  +59950.0%     133.4=
4 =C2=B1282%  interrupts.CPU55.91:PCI-MSI.31981624-edge.i40e-eth0-TxRx-55
    547.56 =C2=B1  3%      +1.0%     553.00 =C2=B1  5%     +18.6%     649.4=
4 =C2=B1 40%  interrupts.CPU55.CAL:Function_call_interrupts
      0.00       +8.3e+100%       0.08 =C2=B1331% +1.1e+101%       0.11 =C2=
=B1282%  interrupts.CPU55.IWI:IRQ_work_interrupts
    774560 =C2=B1  3%      -6.7%     722465 =C2=B1 18%      +1.2%     78371=
5        interrupts.CPU55.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU55.MCP:Machine_check_polls
    314.33 =C2=B1196%     -68.8%      98.00 =C2=B1 37%     +86.2%     585.3=
3 =C2=B1246%  interrupts.CPU55.NMI:Non-maskable_interrupts
    314.33 =C2=B1196%     -68.8%      98.00 =C2=B1 37%     +86.2%     585.3=
3 =C2=B1246%  interrupts.CPU55.PMI:Performance_monitoring_interrupts
     26.00 =C2=B1135%     -50.3%      12.92 =C2=B1128%     -49.1%      13.2=
2 =C2=B1131%  interrupts.CPU55.RES:Rescheduling_interrupts
      2.44 =C2=B1 88%      -4.5%       2.33 =C2=B1130%    +136.4%       5.7=
8 =C2=B1 15%  interrupts.CPU55.TLB:TLB_shootdowns
      0.44 =C2=B1111%     -81.2%       0.08 =C2=B1331%     -50.0%       0.2=
2 =C2=B1187%  interrupts.CPU56.103:PCI-MSI.31981636-edge.i40e-eth0-TxRx-67
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU56.298:PCI-MSI.69632-edge.ioat-msix
      0.00       +4.2e+102%       4.17 =C2=B1331%    -100.0%       0.00    =
    interrupts.CPU56.4:IO-APIC.4-edge.ttyS0
      0.22 =C2=B1187%     +50.0%       0.33 =C2=B1141%     -50.0%       0.1=
1 =C2=B1282%  interrupts.CPU56.55:PCI-MSI.31981588-edge.i40e-eth0-TxRx-19
     33.78 =C2=B1282%     -92.8%       2.42 =C2=B1319%  +43008.9%      1456=
1 =C2=B1282%  interrupts.CPU56.92:PCI-MSI.31981625-edge.i40e-eth0-TxRx-56
    834.00 =C2=B1 99%      +3.6%     864.25 =C2=B1103%     -34.5%     545.8=
9        interrupts.CPU56.CAL:Function_call_interrupts
    774616 =C2=B1  3%      -6.7%     722502 =C2=B1 18%      +1.2%     78364=
5        interrupts.CPU56.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU56.MCP:Machine_check_polls
    100.56 =C2=B1 19%      -1.8%      98.75 =C2=B1 28%     -25.9%      74.5=
6 =C2=B1 20%  interrupts.CPU56.NMI:Non-maskable_interrupts
    100.56 =C2=B1 19%      -1.8%      98.75 =C2=B1 28%     -25.9%      74.5=
6 =C2=B1 20%  interrupts.CPU56.PMI:Performance_monitoring_interrupts
     18.89 =C2=B1 91%     +28.8%      24.33 =C2=B1131%     -47.6%       9.8=
9 =C2=B1 74%  interrupts.CPU56.RES:Rescheduling_interrupts
      2.89 =C2=B1 91%     -16.3%       2.42 =C2=B1145%    +103.8%       5.8=
9 =C2=B1 12%  interrupts.CPU56.TLB:TLB_shootdowns
      0.11 =C2=B1282%    -100.0%       0.00            +0.0%       0.11 =C2=
=B1282%  interrupts.CPU57.104:PCI-MSI.31981637-edge.i40e-eth0-TxRx-68
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU57.295:PCI-MSI.65536-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU57.299:PCI-MSI.71680-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU57.3:IO-APIC.3-edge
      0.00       +3.8e+102%       3.83 =C2=B1331%    -100.0%       0.00    =
    interrupts.CPU57.4:IO-APIC.4-edge.ttyS0
      0.11 =C2=B1282%     +50.0%       0.17 =C2=B1223%    +100.0%       0.2=
2 =C2=B1187%  interrupts.CPU57.56:PCI-MSI.31981589-edge.i40e-eth0-TxRx-20
    289.78 =C2=B1219%     -99.5%       1.58 =C2=B1313%     -96.7%       9.6=
7 =C2=B1275%  interrupts.CPU57.93:PCI-MSI.31981626-edge.i40e-eth0-TxRx-57
      1141 =C2=B1100%     -52.5%     541.83           -45.2%     625.78 =C2=
=B1 36%  interrupts.CPU57.CAL:Function_call_interrupts
      0.00       +8.3e+100%       0.08 =C2=B1331% +1.1e+101%       0.11 =C2=
=B1282%  interrupts.CPU57.IWI:IRQ_work_interrupts
    774466 =C2=B1  3%      -6.7%     722530 =C2=B1 18%      +1.2%     78369=
3        interrupts.CPU57.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU57.MCP:Machine_check_polls
     96.00 =C2=B1 25%      +0.3%      96.25 =C2=B1 33%    +534.5%     609.1=
1 =C2=B1245%  interrupts.CPU57.NMI:Non-maskable_interrupts
     96.00 =C2=B1 25%      +0.3%      96.25 =C2=B1 33%    +534.5%     609.1=
1 =C2=B1245%  interrupts.CPU57.PMI:Performance_monitoring_interrupts
      8.78 =C2=B1 71%      +6.3%       9.33 =C2=B1125%    +103.8%      17.8=
9 =C2=B1125%  interrupts.CPU57.RES:Rescheduling_interrupts
      2.33 =C2=B1 90%      -3.6%       2.25 =C2=B1143%    +128.6%       5.3=
3 =C2=B1 12%  interrupts.CPU57.TLB:TLB_shootdowns
      0.00       +2.5e+101%       0.25 =C2=B1173% +1.1e+101%       0.11 =C2=
=B1282%  interrupts.CPU58.105:PCI-MSI.31981638-edge.i40e-eth0-TxRx-69
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU58.297:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU58.3:IO-APIC.3-edge
      0.33 =C2=B1141%     -50.0%       0.17 =C2=B1223%    -100.0%       0.0=
0        interrupts.CPU58.57:PCI-MSI.31981590-edge.i40e-eth0-TxRx-21
      0.00       +3.5e+104%     349.42 =C2=B1315% +1.2e+104%     115.44 =C2=
=B1238%  interrupts.CPU58.94:PCI-MSI.31981627-edge.i40e-eth0-TxRx-58
    894.44 =C2=B1113%     -38.6%     549.17 =C2=B1  3%     +19.8%       107=
1 =C2=B1142%  interrupts.CPU58.CAL:Function_call_interrupts
      0.00       +8.3e+100%       0.08 =C2=B1331%    -100.0%       0.00    =
    interrupts.CPU58.IWI:IRQ_work_interrupts
    774497 =C2=B1  3%      -6.7%     722640 =C2=B1 18%      +1.2%     78376=
0        interrupts.CPU58.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU58.MCP:Machine_check_polls
    101.44 =C2=B1 15%      -5.0%      96.33 =C2=B1 40%     -22.1%      79.0=
0 =C2=B1 10%  interrupts.CPU58.NMI:Non-maskable_interrupts
    101.44 =C2=B1 15%      -5.0%      96.33 =C2=B1 40%     -22.1%      79.0=
0 =C2=B1 10%  interrupts.CPU58.PMI:Performance_monitoring_interrupts
      5.00 =C2=B1 43%     +78.3%       8.92 =C2=B1 74%    +268.9%      18.4=
4 =C2=B1116%  interrupts.CPU58.RES:Rescheduling_interrupts
      2.11 =C2=B1105%     +42.1%       3.00 =C2=B1120%    +163.2%       5.5=
6 =C2=B1 14%  interrupts.CPU58.TLB:TLB_shootdowns
      0.11 =C2=B1282%    +350.0%       0.50 =C2=B1100%      +0.0%       0.1=
1 =C2=B1282%  interrupts.CPU59.106:PCI-MSI.31981639-edge.i40e-eth0-TxRx-70
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU59.297:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU59.3:IO-APIC.3-edge
      0.00       +1.7e+101%       0.17 =C2=B1223% +1.1e+101%       0.11 =C2=
=B1282%  interrupts.CPU59.58:PCI-MSI.31981591-edge.i40e-eth0-TxRx-22
      0.00       +4.1e+103%      40.58 =C2=B1289% +2.6e+103%      26.11 =C2=
=B1187%  interrupts.CPU59.95:PCI-MSI.31981628-edge.i40e-eth0-TxRx-59
    543.22 =C2=B1  2%    +311.4%       2234 =C2=B1248%      +0.6%     546.3=
3        interrupts.CPU59.CAL:Function_call_interrupts
      0.00       +1.7e+101%       0.17 =C2=B1223% +1.1e+101%       0.11 =C2=
=B1282%  interrupts.CPU59.IWI:IRQ_work_interrupts
    774502 =C2=B1  3%      -6.7%     722579 =C2=B1 18%      +1.2%     78377=
3        interrupts.CPU59.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU59.MCP:Machine_check_polls
     95.00 =C2=B1 30%    +144.9%     232.67 =C2=B1183%    +496.7%     566.8=
9 =C2=B1244%  interrupts.CPU59.NMI:Non-maskable_interrupts
     95.00 =C2=B1 30%    +144.9%     232.67 =C2=B1183%    +496.7%     566.8=
9 =C2=B1244%  interrupts.CPU59.PMI:Performance_monitoring_interrupts
     16.00 =C2=B1135%     -28.6%      11.42 =C2=B1 82%     -32.6%      10.7=
8 =C2=B1 86%  interrupts.CPU59.RES:Rescheduling_interrupts
      2.33 =C2=B1 96%     +42.9%       3.33 =C2=B1109%    +133.3%       5.4=
4 =C2=B1 23%  interrupts.CPU59.TLB:TLB_shootdowns
      0.00       +1.7e+101%       0.17 =C2=B1223% +2.2e+101%       0.22 =C2=
=B1187%  interrupts.CPU6.125:PCI-MSI.31981658-edge.i40e-eth0-TxRx-89
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU6.297:PCI-MSI.67584-edge.ioat-msix
     11109 =C2=B1282%     -99.2%      84.42 =C2=B1317%     -98.4%     176.0=
0 =C2=B1166%  interrupts.CPU6.42:PCI-MSI.31981575-edge.i40e-eth0-TxRx-6
      0.33 =C2=B1141%     -25.0%       0.25 =C2=B1173%     -33.3%       0.2=
2 =C2=B1187%  interrupts.CPU6.77:PCI-MSI.31981610-edge.i40e-eth0-TxRx-41
    795.44 =C2=B1 80%     +44.0%       1145 =C2=B1110%     -24.6%     599.6=
7 =C2=B1 13%  interrupts.CPU6.CAL:Function_call_interrupts
      0.00       +8.3e+100%       0.08 =C2=B1331%    -100.0%       0.00    =
    interrupts.CPU6.IWI:IRQ_work_interrupts
    774651 =C2=B1  3%      -6.7%     722932 =C2=B1 18%      +1.2%     78358=
4        interrupts.CPU6.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU6.MCP:Machine_check_polls
    104.67 =C2=B1 20%    +468.5%     595.00 =C2=B1282%     +14.3%     119.6=
7 =C2=B1113%  interrupts.CPU6.NMI:Non-maskable_interrupts
    104.67 =C2=B1 20%    +468.5%     595.00 =C2=B1282%     +14.3%     119.6=
7 =C2=B1113%  interrupts.CPU6.PMI:Performance_monitoring_interrupts
     17.00 =C2=B1 80%    +271.6%      63.17 =C2=B1208%      +8.5%      18.4=
4 =C2=B1 84%  interrupts.CPU6.RES:Rescheduling_interrupts
      1.56 =C2=B1105%     +23.2%       1.92 =C2=B1142%    +150.0%       3.8=
9 =C2=B1 35%  interrupts.CPU6.TLB:TLB_shootdowns
      0.11 =C2=B1282%     +50.0%       0.17 =C2=B1223%    +100.0%       0.2=
2 =C2=B1187%  interrupts.CPU60.107:PCI-MSI.31981640-edge.i40e-eth0-TxRx-71
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU60.295:PCI-MSI.65536-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU60.3:IO-APIC.3-edge
      0.44 =C2=B1111%     -62.5%       0.17 =C2=B1223%     -50.0%       0.2=
2 =C2=B1187%  interrupts.CPU60.59:PCI-MSI.31981592-edge.i40e-eth0-TxRx-23
    281.00 =C2=B1281%     -64.3%     100.25 =C2=B1296%      +7.4%     301.8=
9 =C2=B1142%  interrupts.CPU60.96:PCI-MSI.31981629-edge.i40e-eth0-TxRx-60
    864.11 =C2=B1107%     -36.6%     548.25 =C2=B1  3%      -3.3%     835.8=
9 =C2=B1 87%  interrupts.CPU60.CAL:Function_call_interrupts
    774542 =C2=B1  3%      -6.7%     722360 =C2=B1 18%      +1.2%     78378=
1        interrupts.CPU60.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU60.MCP:Machine_check_polls
     88.56 =C2=B1 36%     +15.7%     102.42 =C2=B1 58%     -11.4%      78.4=
4 =C2=B1 18%  interrupts.CPU60.NMI:Non-maskable_interrupts
     88.56 =C2=B1 36%     +15.7%     102.42 =C2=B1 58%     -11.4%      78.4=
4 =C2=B1 18%  interrupts.CPU60.PMI:Performance_monitoring_interrupts
     15.89 =C2=B1132%    +134.4%      37.25 =C2=B1205%     -21.7%      12.4=
4 =C2=B1 49%  interrupts.CPU60.RES:Rescheduling_interrupts
      1.89 =C2=B1112%     +19.1%       2.25 =C2=B1135%    +182.4%       5.3=
3 =C2=B1 19%  interrupts.CPU60.TLB:TLB_shootdowns
      0.22 =C2=B1187%     -25.0%       0.17 =C2=B1223%     -50.0%       0.1=
1 =C2=B1282%  interrupts.CPU61.108:PCI-MSI.31981641-edge.i40e-eth0-TxRx-72
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU61.295:PCI-MSI.65536-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU61.297:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU61.298:PCI-MSI.69632-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU61.3:IO-APIC.3-edge
      0.00       +3.8e+102%       3.83 =C2=B1331%    -100.0%       0.00    =
    interrupts.CPU61.4:IO-APIC.4-edge.ttyS0
      0.33 =C2=B1141%     -50.0%       0.17 =C2=B1223%    -100.0%       0.0=
0        interrupts.CPU61.60:PCI-MSI.31981593-edge.i40e-eth0-TxRx-24
    201.78 =C2=B1279%     -26.9%     147.50 =C2=B1324%     -97.4%       5.3=
3 =C2=B1172%  interrupts.CPU61.97:PCI-MSI.31981630-edge.i40e-eth0-TxRx-61
      1844 =C2=B1146%     -71.3%     528.92 =C2=B1 10%     -67.1%     607.0=
0 =C2=B1 28%  interrupts.CPU61.CAL:Function_call_interrupts
      0.11 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU61.IWI:IRQ_work_interrupts
    774551 =C2=B1  3%      -6.7%     722486 =C2=B1 18%      +1.2%     78380=
6        interrupts.CPU61.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU61.MCP:Machine_check_polls
    799.33 =C2=B1191%     -73.6%     211.33 =C2=B1196%     -91.2%      70.6=
7 =C2=B1 25%  interrupts.CPU61.NMI:Non-maskable_interrupts
    799.33 =C2=B1191%     -73.6%     211.33 =C2=B1196%     -91.2%      70.6=
7 =C2=B1 25%  interrupts.CPU61.PMI:Performance_monitoring_interrupts
     19.44 =C2=B1125%      +5.9%      20.58 =C2=B1133%     -38.3%      12.0=
0 =C2=B1 79%  interrupts.CPU61.RES:Rescheduling_interrupts
      2.67 =C2=B1 75%     -12.5%       2.33 =C2=B1137%    +112.5%       5.6=
7 =C2=B1 22%  interrupts.CPU61.TLB:TLB_shootdowns
      0.33 =C2=B1141%     -75.0%       0.08 =C2=B1331%     -33.3%       0.2=
2 =C2=B1187%  interrupts.CPU62.109:PCI-MSI.31981642-edge.i40e-eth0-TxRx-73
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU62.297:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU62.299:PCI-MSI.71680-edge.ioat-msix
      0.11 =C2=B1282%     -25.0%       0.08 =C2=B1331%      +0.0%       0.1=
1 =C2=B1282%  interrupts.CPU62.61:PCI-MSI.31981594-edge.i40e-eth0-TxRx-25
    349.00 =C2=B1217%    +161.3%     911.92 =C2=B1195%     -96.9%      10.7=
8 =C2=B1279%  interrupts.CPU62.98:PCI-MSI.31981631-edge.i40e-eth0-TxRx-62
    545.33 =C2=B1  3%      +0.2%     546.67 =C2=B1  4%     +19.1%     649.2=
2 =C2=B1 40%  interrupts.CPU62.CAL:Function_call_interrupts
    774524 =C2=B1  3%      -6.7%     722603 =C2=B1 18%      +1.2%     78376=
9        interrupts.CPU62.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU62.MCP:Machine_check_polls
    235.67 =C2=B1177%     -42.2%     136.17 =C2=B1 88%     -71.1%      68.2=
2 =C2=B1 29%  interrupts.CPU62.NMI:Non-maskable_interrupts
    235.67 =C2=B1177%     -42.2%     136.17 =C2=B1 88%     -71.1%      68.2=
2 =C2=B1 29%  interrupts.CPU62.PMI:Performance_monitoring_interrupts
     10.00 =C2=B1 55%     +85.0%      18.50 =C2=B1184%      -1.1%       9.8=
9 =C2=B1 83%  interrupts.CPU62.RES:Rescheduling_interrupts
      2.33 =C2=B1 85%      +3.6%       2.42 =C2=B1126%    +133.3%       5.4=
4 =C2=B1 23%  interrupts.CPU62.TLB:TLB_shootdowns
      0.00       +2.5e+101%       0.25 =C2=B1173% +1.1e+101%       0.11 =C2=
=B1282%  interrupts.CPU63.110:PCI-MSI.31981643-edge.i40e-eth0-TxRx-74
      0.00       +8.3e+100%       0.08 =C2=B1331% +1.1e+101%       0.11 =C2=
=B1282%  interrupts.CPU63.62:PCI-MSI.31981595-edge.i40e-eth0-TxRx-26
    178.00 =C2=B1268%     +48.4%     264.08 =C2=B1242%   +1037.1%       202=
4 =C2=B1282%  interrupts.CPU63.99:PCI-MSI.31981632-edge.i40e-eth0-TxRx-63
    536.56           +67.8%     900.58 =C2=B1 97%      +3.6%     556.11 =C2=
=B1  6%  interrupts.CPU63.CAL:Function_call_interrupts
    774640 =C2=B1  3%      -6.7%     722593 =C2=B1 18%      +1.2%     78374=
9        interrupts.CPU63.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU63.MCP:Machine_check_polls
     98.89 =C2=B1 27%    +199.3%     296.00 =C2=B1229%     -36.6%      62.6=
7 =C2=B1 35%  interrupts.CPU63.NMI:Non-maskable_interrupts
     98.89 =C2=B1 27%    +199.3%     296.00 =C2=B1229%     -36.6%      62.6=
7 =C2=B1 35%  interrupts.CPU63.PMI:Performance_monitoring_interrupts
     12.00 =C2=B1 60%     +26.4%      15.17 =C2=B1 81%     -26.9%       8.7=
8 =C2=B1 61%  interrupts.CPU63.RES:Rescheduling_interrupts
      2.89 =C2=B1 68%     -13.5%       2.50 =C2=B1119%     +92.3%       5.5=
6 =C2=B1 26%  interrupts.CPU63.TLB:TLB_shootdowns
     48.11 =C2=B1282%     -32.8%      32.33 =C2=B1265%     -92.8%       3.4=
4 =C2=B1272%  interrupts.CPU64.100:PCI-MSI.31981633-edge.i40e-eth0-TxRx-64
      0.22 =C2=B1187%     -62.5%       0.08 =C2=B1331%    -100.0%       0.0=
0        interrupts.CPU64.111:PCI-MSI.31981644-edge.i40e-eth0-TxRx-75
      0.00       +1.6e+103%      15.92 =C2=B1331%    -100.0%       0.00    =
    interrupts.CPU64.296:PCI-MSI.288768-edge.ahci[0000:00:11.5]
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU64.297:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU64.298:PCI-MSI.69632-edge.ioat-msix
      0.22 =C2=B1187%    -100.0%       0.00           +50.0%       0.33 =C2=
=B1141%  interrupts.CPU64.63:PCI-MSI.31981596-edge.i40e-eth0-TxRx-27
    624.67 =C2=B1 26%     +50.5%     940.42 =C2=B1 96%     +24.4%     777.0=
0 =C2=B1 53%  interrupts.CPU64.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.1e+101%       0.11 =C2=B128=
2%  interrupts.CPU64.IWI:IRQ_work_interrupts
    774613 =C2=B1  3%      -6.7%     722509 =C2=B1 18%      +1.2%     78384=
0        interrupts.CPU64.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU64.MCP:Machine_check_polls
    100.22 =C2=B1 26%     -13.4%      86.83 =C2=B1 34%     -33.5%      66.6=
7 =C2=B1 43%  interrupts.CPU64.NMI:Non-maskable_interrupts
    100.22 =C2=B1 26%     -13.4%      86.83 =C2=B1 34%     -33.5%      66.6=
7 =C2=B1 43%  interrupts.CPU64.PMI:Performance_monitoring_interrupts
     12.44 =C2=B1 89%      -0.9%      12.33 =C2=B1 54%     -29.5%       8.7=
8 =C2=B1 55%  interrupts.CPU64.RES:Rescheduling_interrupts
      3.00 =C2=B1 98%     -11.1%       2.67 =C2=B1108%     +81.5%       5.4=
4 =C2=B1 19%  interrupts.CPU64.TLB:TLB_shootdowns
     16.11 =C2=B1196%    +434.8%      86.17 =C2=B1293%     -11.7%      14.2=
2 =C2=B1210%  interrupts.CPU65.101:PCI-MSI.31981634-edge.i40e-eth0-TxRx-65
      0.11 =C2=B1282%     -25.0%       0.08 =C2=B1331%    +100.0%       0.2=
2 =C2=B1187%  interrupts.CPU65.112:PCI-MSI.31981645-edge.i40e-eth0-TxRx-76
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU65.298:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU65.300:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00       +2.2e+101%       0.22 =C2=B118=
7%  interrupts.CPU65.64:PCI-MSI.31981597-edge.i40e-eth0-TxRx-28
    563.00 =C2=B1  3%      -5.1%     534.08 =C2=B1 11%     +29.6%     729.4=
4 =C2=B1 49%  interrupts.CPU65.CAL:Function_call_interrupts
    774537 =C2=B1  3%      -6.7%     722512 =C2=B1 18%      +1.2%     78385=
6        interrupts.CPU65.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU65.MCP:Machine_check_polls
    102.44 =C2=B1 18%    +119.5%     224.92 =C2=B1190%     -35.9%      65.6=
7 =C2=B1 33%  interrupts.CPU65.NMI:Non-maskable_interrupts
    102.44 =C2=B1 18%    +119.5%     224.92 =C2=B1190%     -35.9%      65.6=
7 =C2=B1 33%  interrupts.CPU65.PMI:Performance_monitoring_interrupts
     12.22 =C2=B1 77%     -16.8%      10.17 =C2=B1 82%     -36.4%       7.7=
8 =C2=B1 80%  interrupts.CPU65.RES:Rescheduling_interrupts
      2.56 =C2=B1 78%      +7.6%       2.75 =C2=B1109%    +156.5%       6.5=
6 =C2=B1 38%  interrupts.CPU65.TLB:TLB_shootdowns
     28.00 =C2=B1282%    +161.9%      73.33 =C2=B1331%     -32.5%      18.8=
9 =C2=B1264%  interrupts.CPU66.102:PCI-MSI.31981635-edge.i40e-eth0-TxRx-66
      0.00       +1.7e+101%       0.17 =C2=B1223% +3.3e+101%       0.33 =C2=
=B1141%  interrupts.CPU66.113:PCI-MSI.31981646-edge.i40e-eth0-TxRx-77
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU66.298:PCI-MSI.69632-edge.ioat-msix
      0.22 =C2=B1187%     -62.5%       0.08 =C2=B1331%     -50.0%       0.1=
1 =C2=B1282%  interrupts.CPU66.65:PCI-MSI.31981598-edge.i40e-eth0-TxRx-29
    716.44 =C2=B1 63%      +6.5%     762.75 =C2=B1 87%     -18.2%     586.1=
1 =C2=B1 15%  interrupts.CPU66.CAL:Function_call_interrupts
    774568 =C2=B1  3%      -6.7%     722454 =C2=B1 18%      +1.2%     78363=
5        interrupts.CPU66.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU66.MCP:Machine_check_polls
     98.56 =C2=B1 26%    +437.9%     530.08 =C2=B1210%    +286.4%     380.7=
8 =C2=B1236%  interrupts.CPU66.NMI:Non-maskable_interrupts
     98.56 =C2=B1 26%    +437.9%     530.08 =C2=B1210%    +286.4%     380.7=
8 =C2=B1236%  interrupts.CPU66.PMI:Performance_monitoring_interrupts
     58.22 =C2=B1185%      -8.3%      53.42 =C2=B1269%     -77.3%      13.2=
2 =C2=B1135%  interrupts.CPU66.RES:Rescheduling_interrupts
      2.44 =C2=B1 92%      +5.7%       2.58 =C2=B1118%    +113.6%       5.2=
2 =C2=B1 29%  interrupts.CPU66.TLB:TLB_shootdowns
     18.22 =C2=B1154%    +980.2%     196.83 =C2=B1307%     -98.8%       0.2=
2 =C2=B1187%  interrupts.CPU67.103:PCI-MSI.31981636-edge.i40e-eth0-TxRx-67
      0.00       +8.3e+100%       0.08 =C2=B1331% +2.2e+101%       0.22 =C2=
=B1187%  interrupts.CPU67.114:PCI-MSI.31981647-edge.i40e-eth0-TxRx-78
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU67.297:PCI-MSI.67584-edge.ioat-msix
      5.11 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU67.4:IO-APIC.4-edge.ttyS0
      0.00       +1.7e+101%       0.17 =C2=B1223% +1.1e+101%       0.11 =C2=
=B1282%  interrupts.CPU67.66:PCI-MSI.31981599-edge.i40e-eth0-TxRx-30
    827.56 =C2=B1 95%     +63.1%       1349 =C2=B1195%     +19.8%     991.6=
7 =C2=B1125%  interrupts.CPU67.CAL:Function_call_interrupts
    774578 =C2=B1  3%      -6.7%     722688 =C2=B1 18%      +1.2%     78376=
2        interrupts.CPU67.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU67.MCP:Machine_check_polls
    107.89 =C2=B1 18%      -7.5%      99.75 =C2=B1 27%     -35.2%      69.8=
9 =C2=B1 32%  interrupts.CPU67.NMI:Non-maskable_interrupts
    107.89 =C2=B1 18%      -7.5%      99.75 =C2=B1 27%     -35.2%      69.8=
9 =C2=B1 32%  interrupts.CPU67.PMI:Performance_monitoring_interrupts
     26.89 =C2=B1173%     -58.8%      11.08 =C2=B1113%     -65.7%       9.2=
2 =C2=B1 68%  interrupts.CPU67.RES:Rescheduling_interrupts
      2.89 =C2=B1 82%     -22.1%       2.25 =C2=B1123%    +107.7%       6.0=
0 =C2=B1 17%  interrupts.CPU67.TLB:TLB_shootdowns
     74.56 =C2=B1252%     -90.4%       7.17 =C2=B1331%    +108.3%     155.3=
3 =C2=B1282%  interrupts.CPU68.104:PCI-MSI.31981637-edge.i40e-eth0-TxRx-68
      0.11 =C2=B1282%     +50.0%       0.17 =C2=B1223%    -100.0%       0.0=
0        interrupts.CPU68.115:PCI-MSI.31981648-edge.i40e-eth0-TxRx-79
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU68.297:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU68.299:PCI-MSI.71680-edge.ioat-msix
      0.11 =C2=B1282%    +125.0%       0.25 =C2=B1173%      +0.0%       0.1=
1 =C2=B1282%  interrupts.CPU68.67:PCI-MSI.31981600-edge.i40e-eth0-TxRx-31
    645.89 =C2=B1 24%      -6.9%     601.58 =C2=B1 31%     +81.4%       117=
1 =C2=B1 98%  interrupts.CPU68.CAL:Function_call_interrupts
      0.11 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU68.IWI:IRQ_work_interrupts
    774540 =C2=B1  3%      -6.7%     722502 =C2=B1 18%      +1.2%     78367=
8        interrupts.CPU68.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU68.MCP:Machine_check_polls
    945.78 =C2=B1200%     -89.6%      98.50 =C2=B1 27%     -77.3%     214.6=
7 =C2=B1181%  interrupts.CPU68.NMI:Non-maskable_interrupts
    945.78 =C2=B1200%     -89.6%      98.50 =C2=B1 27%     -77.3%     214.6=
7 =C2=B1181%  interrupts.CPU68.PMI:Performance_monitoring_interrupts
     30.00 =C2=B1141%    +159.7%      77.92 =C2=B1233%     -34.4%      19.6=
7 =C2=B1 60%  interrupts.CPU68.RES:Rescheduling_interrupts
      2.00 =C2=B1 74%     +41.7%       2.83 =C2=B1122%    +183.3%       5.6=
7 =C2=B1 18%  interrupts.CPU68.TLB:TLB_shootdowns
      0.00       +8.3e+102%       8.33 =C2=B1232%   +1e+104%     100.00 =C2=
=B1282%  interrupts.CPU69.105:PCI-MSI.31981638-edge.i40e-eth0-TxRx-69
      0.22 =C2=B1187%     +50.0%       0.33 =C2=B1141%    +100.0%       0.4=
4 =C2=B1111%  interrupts.CPU69.116:PCI-MSI.31981649-edge.i40e-eth0-TxRx-80
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU69.3:IO-APIC.3-edge
      0.11 =C2=B1282%    +125.0%       0.25 =C2=B1173%      +0.0%       0.1=
1 =C2=B1282%  interrupts.CPU69.68:PCI-MSI.31981601-edge.i40e-eth0-TxRx-32
    563.00 =C2=B1  8%     +47.6%     831.08 =C2=B1111%     +19.1%     670.4=
4 =C2=B1 47%  interrupts.CPU69.CAL:Function_call_interrupts
    774477 =C2=B1  3%      -6.7%     722587 =C2=B1 18%      +1.2%     78383=
1        interrupts.CPU69.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU69.MCP:Machine_check_polls
    245.67 =C2=B1164%     -59.5%      99.58 =C2=B1 22%     -71.4%      70.2=
2 =C2=B1 36%  interrupts.CPU69.NMI:Non-maskable_interrupts
    245.67 =C2=B1164%     -59.5%      99.58 =C2=B1 22%     -71.4%      70.2=
2 =C2=B1 36%  interrupts.CPU69.PMI:Performance_monitoring_interrupts
     12.67 =C2=B1 89%     +14.5%      14.50 =C2=B1104%     +94.7%      24.6=
7 =C2=B1 66%  interrupts.CPU69.RES:Rescheduling_interrupts
      2.78 =C2=B1 75%      +5.0%       2.92 =C2=B1107%     +88.0%       5.2=
2 =C2=B1 21%  interrupts.CPU69.TLB:TLB_shootdowns
      0.11 =C2=B1282%     -25.0%       0.08 =C2=B1331%    +100.0%       0.2=
2 =C2=B1187%  interrupts.CPU7.126:PCI-MSI.31981659-edge.i40e-eth0-TxRx-90
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU7.297:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU7.299:PCI-MSI.71680-edge.ioat-msix
      1.33 =C2=B1282%    +756.2%      11.42 =C2=B1331%    +533.3%       8.4=
4 =C2=B1154%  interrupts.CPU7.43:PCI-MSI.31981576-edge.i40e-eth0-TxRx-7
      0.22 =C2=B1187%    -100.0%       0.00            +0.0%       0.22 =C2=
=B1187%  interrupts.CPU7.78:PCI-MSI.31981611-edge.i40e-eth0-TxRx-42
    961.67 =C2=B1 80%     -36.6%     609.58 =C2=B1 34%     -25.0%     720.7=
8 =C2=B1 44%  interrupts.CPU7.CAL:Function_call_interrupts
      0.22 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU7.IWI:IRQ_work_interrupts
    774552 =C2=B1  3%      -6.7%     722407 =C2=B1 18%      +1.2%     78370=
8        interrupts.CPU7.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU7.MCP:Machine_check_polls
    764.22 =C2=B1250%     -87.6%      94.50 =C2=B1 32%     -65.4%     264.2=
2 =C2=B1199%  interrupts.CPU7.NMI:Non-maskable_interrupts
    764.22 =C2=B1250%     -87.6%      94.50 =C2=B1 32%     -65.4%     264.2=
2 =C2=B1199%  interrupts.CPU7.PMI:Performance_monitoring_interrupts
     26.56 =C2=B1107%     +18.6%      31.50 =C2=B1161%     -38.1%      16.4=
4 =C2=B1 75%  interrupts.CPU7.RES:Rescheduling_interrupts
      2.00 =C2=B1 88%      +4.2%       2.08 =C2=B1149%    +100.0%       4.0=
0 =C2=B1 33%  interrupts.CPU7.TLB:TLB_shootdowns
      4.22 =C2=B1282%  +32840.8%       1390 =C2=B1330%   +2934.2%     128.1=
1 =C2=B1198%  interrupts.CPU70.106:PCI-MSI.31981639-edge.i40e-eth0-TxRx-70
      0.22 =C2=B1187%     -25.0%       0.17 =C2=B1223%     -50.0%       0.1=
1 =C2=B1282%  interrupts.CPU70.117:PCI-MSI.31981650-edge.i40e-eth0-TxRx-81
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU70.297:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU70.298:PCI-MSI.69632-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU70.3:IO-APIC.3-edge
      0.11 =C2=B1282%    +125.0%       0.25 =C2=B1173%    -100.0%       0.0=
0        interrupts.CPU70.69:PCI-MSI.31981602-edge.i40e-eth0-TxRx-33
    549.22 =C2=B1  3%      +7.8%     591.92 =C2=B1 22%    +125.8%       124=
0 =C2=B1133%  interrupts.CPU70.CAL:Function_call_interrupts
    774504 =C2=B1  3%      -6.7%     722659 =C2=B1 18%      +1.2%     78367=
3        interrupts.CPU70.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU70.MCP:Machine_check_polls
    101.89 =C2=B1 15%      +2.2%     104.08 =C2=B1 23%     -34.5%      66.7=
8 =C2=B1 29%  interrupts.CPU70.NMI:Non-maskable_interrupts
    101.89 =C2=B1 15%      +2.2%     104.08 =C2=B1 23%     -34.5%      66.7=
8 =C2=B1 29%  interrupts.CPU70.PMI:Performance_monitoring_interrupts
     69.56 =C2=B1257%    +111.2%     146.92 =C2=B1190%     +46.2%     101.6=
7 =C2=B1236%  interrupts.CPU70.RES:Rescheduling_interrupts
      2.67 =C2=B1 86%      +3.1%       2.75 =C2=B1111%    +108.3%       5.5=
6 =C2=B1 12%  interrupts.CPU70.TLB:TLB_shootdowns
      3.67 =C2=B1273%  +94829.5%       3480 =C2=B1319%   +5657.6%     211.1=
1 =C2=B1282%  interrupts.CPU71.107:PCI-MSI.31981640-edge.i40e-eth0-TxRx-71
      0.11 =C2=B1282%     -25.0%       0.08 =C2=B1331%      +0.0%       0.1=
1 =C2=B1282%  interrupts.CPU71.118:PCI-MSI.31981651-edge.i40e-eth0-TxRx-82
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU71.297:PCI-MSI.67584-edge.ioat-msix
      0.11 =C2=B1282%    -100.0%       0.00          +100.0%       0.22 =C2=
=B1187%  interrupts.CPU71.70:PCI-MSI.31981603-edge.i40e-eth0-TxRx-34
    545.67 =C2=B1  3%      +0.7%     549.50 =C2=B1  5%    +306.3%       221=
6 =C2=B1213%  interrupts.CPU71.CAL:Function_call_interrupts
      0.00       +8.3e+100%       0.08 =C2=B1331%    -100.0%       0.00    =
    interrupts.CPU71.IWI:IRQ_work_interrupts
    774504 =C2=B1  3%      -6.4%     725220 =C2=B1 17%      +1.2%     78366=
8        interrupts.CPU71.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU71.MCP:Machine_check_polls
    739.56 =C2=B1160%     +13.7%     840.58 =C2=B1213%     -90.2%      72.2=
2 =C2=B1 27%  interrupts.CPU71.NMI:Non-maskable_interrupts
    739.56 =C2=B1160%     +13.7%     840.58 =C2=B1213%     -90.2%      72.2=
2 =C2=B1 27%  interrupts.CPU71.PMI:Performance_monitoring_interrupts
     17.56 =C2=B1139%    +191.0%      51.08 =C2=B1144%     -50.6%       8.6=
7 =C2=B1 83%  interrupts.CPU71.RES:Rescheduling_interrupts
      2.33 =C2=B1 96%      +7.1%       2.50 =C2=B1117%    +147.6%       5.7=
8 =C2=B1 19%  interrupts.CPU71.TLB:TLB_shootdowns
     13.22 =C2=B1202%     -54.6%       6.00 =C2=B1312%  +54798.3%       725=
8 =C2=B1282%  interrupts.CPU72.108:PCI-MSI.31981641-edge.i40e-eth0-TxRx-72
      1332 =C2=B1169%     -51.3%     648.83 =C2=B1 49%     -56.0%     586.0=
0 =C2=B1 10%  interrupts.CPU72.CAL:Function_call_interrupts
      0.11 =C2=B1282%    +200.0%       0.33 =C2=B1141%    -100.0%       0.0=
0        interrupts.CPU72.IWI:IRQ_work_interrupts
    742073 =C2=B1 15%      +3.7%     769160 =C2=B1  3%      +5.6%     78367=
5        interrupts.CPU72.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU72.MCP:Machine_check_polls
    129.67 =C2=B1 38%      +5.8%     137.25 =C2=B1 50%     -49.7%      65.2=
2 =C2=B1 33%  interrupts.CPU72.NMI:Non-maskable_interrupts
    129.67 =C2=B1 38%      +5.8%     137.25 =C2=B1 50%     -49.7%      65.2=
2 =C2=B1 33%  interrupts.CPU72.PMI:Performance_monitoring_interrupts
     12.00 =C2=B1 88%     +63.9%      19.67 =C2=B1101%     -30.6%       8.3=
3 =C2=B1 80%  interrupts.CPU72.RES:Rescheduling_interrupts
      3.11 =C2=B1 80%     -11.6%       2.75 =C2=B1111%     +89.3%       5.8=
9 =C2=B1 14%  interrupts.CPU72.TLB:TLB_shootdowns
    188.67 =C2=B1282%     -61.3%      73.00 =C2=B1331%     -70.6%      55.4=
4 =C2=B1251%  interrupts.CPU73.109:PCI-MSI.31981642-edge.i40e-eth0-TxRx-73
    582.22 =C2=B1 21%      -4.9%     553.67 =C2=B1  4%      -6.7%     543.3=
3 =C2=B1  6%  interrupts.CPU73.CAL:Function_call_interrupts
      0.11 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU73.IWI:IRQ_work_interrupts
    742997 =C2=B1 15%      +3.5%     769176 =C2=B1  4%      +5.5%     78366=
1        interrupts.CPU73.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU73.MCP:Machine_check_polls
    119.89 =C2=B1 45%      -2.5%     116.92 =C2=B1 45%     -47.3%      63.2=
2 =C2=B1 34%  interrupts.CPU73.NMI:Non-maskable_interrupts
    119.89 =C2=B1 45%      -2.5%     116.92 =C2=B1 45%     -47.3%      63.2=
2 =C2=B1 34%  interrupts.CPU73.PMI:Performance_monitoring_interrupts
     11.33 =C2=B1 85%     +27.9%      14.50 =C2=B1 68%     -42.2%       6.5=
6 =C2=B1 44%  interrupts.CPU73.RES:Rescheduling_interrupts
      3.11 =C2=B1 73%      +7.1%       3.33 =C2=B1 92%     +85.7%       5.7=
8 =C2=B1 21%  interrupts.CPU73.TLB:TLB_shootdowns
    103.56 =C2=B1282%     -87.9%      12.50 =C2=B1248%     -14.4%      88.6=
7 =C2=B1279%  interrupts.CPU74.110:PCI-MSI.31981643-edge.i40e-eth0-TxRx-74
    596.89 =C2=B1 25%      +4.2%     621.83 =C2=B1 29%    +362.2%       275=
8 =C2=B1217%  interrupts.CPU74.CAL:Function_call_interrupts
    742194 =C2=B1 15%      +3.6%     769228 =C2=B1  4%      +5.6%     78370=
4        interrupts.CPU74.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU74.MCP:Machine_check_polls
    113.11 =C2=B1 39%      +6.1%     120.00 =C2=B1 44%     -42.4%      65.1=
1 =C2=B1 33%  interrupts.CPU74.NMI:Non-maskable_interrupts
    113.11 =C2=B1 39%      +6.1%     120.00 =C2=B1 44%     -42.4%      65.1=
1 =C2=B1 33%  interrupts.CPU74.PMI:Performance_monitoring_interrupts
     33.22 =C2=B1128%    +214.0%     104.33 =C2=B1280%     -58.2%      13.8=
9 =C2=B1127%  interrupts.CPU74.RES:Rescheduling_interrupts
      3.11 =C2=B1 63%      -3.6%       3.00 =C2=B1104%    +107.1%       6.4=
4 =C2=B1 24%  interrupts.CPU74.TLB:TLB_shootdowns
      0.22 =C2=B1187%     +12.5%       0.25 =C2=B1238%  +58200.0%     129.5=
6 =C2=B1242%  interrupts.CPU75.111:PCI-MSI.31981644-edge.i40e-eth0-TxRx-75
    548.67 =C2=B1  5%      -0.2%     547.50 =C2=B1  2%    +108.5%       114=
3 =C2=B1133%  interrupts.CPU75.CAL:Function_call_interrupts
      0.11 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU75.IWI:IRQ_work_interrupts
    742124 =C2=B1 15%      +3.6%     769144 =C2=B1  4%      +5.6%     78365=
1        interrupts.CPU75.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU75.MCP:Machine_check_polls
    119.00 =C2=B1 43%     +62.3%     193.08 =C2=B1131%     -44.7%      65.7=
8 =C2=B1 26%  interrupts.CPU75.NMI:Non-maskable_interrupts
    119.00 =C2=B1 43%     +62.3%     193.08 =C2=B1131%     -44.7%      65.7=
8 =C2=B1 26%  interrupts.CPU75.PMI:Performance_monitoring_interrupts
      8.78 =C2=B1 64%     +49.1%      13.08 =C2=B1 70%     +26.6%      11.1=
1 =C2=B1153%  interrupts.CPU75.RES:Rescheduling_interrupts
      3.78 =C2=B1 51%     -20.6%       3.00 =C2=B1 95%     +55.9%       5.8=
9 =C2=B1 14%  interrupts.CPU75.TLB:TLB_shootdowns
      8.67 =C2=B1278%    +873.1%      84.33 =C2=B1331%    +957.7%      91.6=
7 =C2=B1282%  interrupts.CPU76.112:PCI-MSI.31981645-edge.i40e-eth0-TxRx-76
    519.78 =C2=B1 11%     +48.9%     773.92 =C2=B1 98%      +5.3%     547.2=
2        interrupts.CPU76.CAL:Function_call_interrupts
      0.11 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU76.IWI:IRQ_work_interrupts
    742164 =C2=B1 15%      +3.6%     769187 =C2=B1  4%      +5.6%     78363=
8        interrupts.CPU76.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU76.MCP:Machine_check_polls
    118.56 =C2=B1 42%      -3.8%     114.00 =C2=B1 42%     -43.8%      66.6=
7 =C2=B1 26%  interrupts.CPU76.NMI:Non-maskable_interrupts
    118.56 =C2=B1 42%      -3.8%     114.00 =C2=B1 42%     -43.8%      66.6=
7 =C2=B1 26%  interrupts.CPU76.PMI:Performance_monitoring_interrupts
      6.22 =C2=B1 67%    +304.5%      25.17 =C2=B1172%     +46.4%       9.1=
1 =C2=B1 69%  interrupts.CPU76.RES:Rescheduling_interrupts
      3.22 =C2=B1 65%      -1.7%       3.17 =C2=B1 91%     +75.9%       5.6=
7 =C2=B1 22%  interrupts.CPU76.TLB:TLB_shootdowns
      3.33 =C2=B1282%    +950.0%      35.00 =C2=B1307%  +4.7e+05%      1583=
3 =C2=B1251%  interrupts.CPU77.113:PCI-MSI.31981646-edge.i40e-eth0-TxRx-77
    815.22 =C2=B1 50%      +1.8%     829.83 =C2=B1115%     +44.3%       117=
6 =C2=B1121%  interrupts.CPU77.CAL:Function_call_interrupts
    742115 =C2=B1 15%      +3.6%     769173 =C2=B1  4%      +5.6%     78364=
4        interrupts.CPU77.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU77.MCP:Machine_check_polls
    108.67 =C2=B1 40%     +11.2%     120.83 =C2=B1 45%     -29.9%      76.2=
2 =C2=B1 13%  interrupts.CPU77.NMI:Non-maskable_interrupts
    108.67 =C2=B1 40%     +11.2%     120.83 =C2=B1 45%     -29.9%      76.2=
2 =C2=B1 13%  interrupts.CPU77.PMI:Performance_monitoring_interrupts
     31.22 =C2=B1138%     -75.7%       7.58 =C2=B1 89%     -19.9%      25.0=
0 =C2=B1160%  interrupts.CPU77.RES:Rescheduling_interrupts
      3.89 =C2=B1 73%      -7.9%       3.58 =C2=B1106%     +60.0%       6.2=
2 =C2=B1 18%  interrupts.CPU77.TLB:TLB_shootdowns
      0.00       +3.8e+102%       3.75 =C2=B1331% +1.4e+102%       1.44 =C2=
=B1282%  interrupts.CPU78.114:PCI-MSI.31981647-edge.i40e-eth0-TxRx-78
    523.00 =C2=B1 12%      +3.3%     540.42            +9.4%     572.33 =C2=
=B1 14%  interrupts.CPU78.CAL:Function_call_interrupts
      0.22 =C2=B1187%     -62.5%       0.08 =C2=B1331%    -100.0%       0.0=
0        interrupts.CPU78.IWI:IRQ_work_interrupts
    742116 =C2=B1 15%      +3.7%     769233 =C2=B1  3%      +5.6%     78367=
2        interrupts.CPU78.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU78.MCP:Machine_check_polls
    112.89 =C2=B1 54%      +7.6%     121.42 =C2=B1 43%     -36.5%      71.6=
7 =C2=B1 19%  interrupts.CPU78.NMI:Non-maskable_interrupts
    112.89 =C2=B1 54%      +7.6%     121.42 =C2=B1 43%     -36.5%      71.6=
7 =C2=B1 19%  interrupts.CPU78.PMI:Performance_monitoring_interrupts
      7.56 =C2=B1 73%      +3.7%       7.83 =C2=B1 92%     -16.2%       6.3=
3 =C2=B1 55%  interrupts.CPU78.RES:Rescheduling_interrupts
      3.89 =C2=B1 72%     -16.4%       3.25 =C2=B1 98%     +57.1%       6.1=
1 =C2=B1 17%  interrupts.CPU78.TLB:TLB_shootdowns
    573.00 =C2=B1161%     -71.8%     161.50 =C2=B1303%    -100.0%       0.0=
0        interrupts.CPU79.115:PCI-MSI.31981648-edge.i40e-eth0-TxRx-79
    541.67 =C2=B1  2%      -0.2%     540.42           +72.3%     933.44 =C2=
=B1108%  interrupts.CPU79.CAL:Function_call_interrupts
      0.11 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU79.IWI:IRQ_work_interrupts
    742169 =C2=B1 15%      +3.6%     769208 =C2=B1  3%      +5.6%     78374=
6        interrupts.CPU79.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU79.MCP:Machine_check_polls
    116.56 =C2=B1 41%      +6.2%     123.75 =C2=B1 35%     -46.2%      62.6=
7 =C2=B1 29%  interrupts.CPU79.NMI:Non-maskable_interrupts
    116.56 =C2=B1 41%      +6.2%     123.75 =C2=B1 35%     -46.2%      62.6=
7 =C2=B1 29%  interrupts.CPU79.PMI:Performance_monitoring_interrupts
      6.78 =C2=B1 74%     +15.6%       7.83 =C2=B1 41%     +42.6%       9.6=
7 =C2=B1106%  interrupts.CPU79.RES:Rescheduling_interrupts
      3.89 =C2=B1 47%      -7.9%       3.58 =C2=B1 99%     +57.1%       6.1=
1 =C2=B1 24%  interrupts.CPU79.TLB:TLB_shootdowns
      0.00       +8.3e+100%       0.08 =C2=B1331%    -100.0%       0.00    =
    interrupts.CPU8.127:PCI-MSI.31981660-edge.i40e-eth0-TxRx-91
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU8.315:PCI-MSI.376832-edge.ahci[0000:00:17.0]
      1.89 =C2=B1282%     -91.2%       0.17 =C2=B1223%   +5517.6%     106.1=
1 =C2=B1255%  interrupts.CPU8.44:PCI-MSI.31981577-edge.i40e-eth0-TxRx-8
      0.00       +8.3e+100%       0.08 =C2=B1331%    -100.0%       0.00    =
    interrupts.CPU8.79:PCI-MSI.31981612-edge.i40e-eth0-TxRx-43
    624.56 =C2=B1 23%    +413.6%       3207 =C2=B1238%   +1183.2%       801=
4 =C2=B1254%  interrupts.CPU8.CAL:Function_call_interrupts
    774520 =C2=B1  3%      -6.7%     722476 =C2=B1 18%      +1.2%     78372=
4        interrupts.CPU8.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU8.MCP:Machine_check_polls
     85.22 =C2=B1 22%     +16.0%      98.83 =C2=B1 24%      -8.3%      78.1=
1 =C2=B1  9%  interrupts.CPU8.NMI:Non-maskable_interrupts
     85.22 =C2=B1 22%     +16.0%      98.83 =C2=B1 24%      -8.3%      78.1=
1 =C2=B1  9%  interrupts.CPU8.PMI:Performance_monitoring_interrupts
     15.89 =C2=B1 39%     -39.7%       9.58 =C2=B1 90%    +269.9%      58.7=
8 =C2=B1209%  interrupts.CPU8.RES:Rescheduling_interrupts
      1.33 =C2=B1106%     +50.0%       2.00 =C2=B1139%    +225.0%       4.3=
3 =C2=B1 21%  interrupts.CPU8.TLB:TLB_shootdowns
     34.89 =C2=B1281%      -1.6%      34.33 =C2=B1328%    +297.1%     138.5=
6 =C2=B1272%  interrupts.CPU80.116:PCI-MSI.31981649-edge.i40e-eth0-TxRx-80
    655.22 =C2=B1 51%     -15.2%     555.50 =C2=B1  7%     -13.5%     566.8=
9 =C2=B1 10%  interrupts.CPU80.CAL:Function_call_interrupts
    742107 =C2=B1 15%      +3.6%     769179 =C2=B1  3%      +5.6%     78364=
3        interrupts.CPU80.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU80.MCP:Machine_check_polls
    115.44 =C2=B1 37%      +2.7%     118.58 =C2=B1 38%     -36.0%      73.8=
9 =C2=B1 14%  interrupts.CPU80.NMI:Non-maskable_interrupts
    115.44 =C2=B1 37%      +2.7%     118.58 =C2=B1 38%     -36.0%      73.8=
9 =C2=B1 14%  interrupts.CPU80.PMI:Performance_monitoring_interrupts
     12.11 =C2=B1115%      +9.4%      13.25 =C2=B1140%     -20.2%       9.6=
7 =C2=B1 57%  interrupts.CPU80.RES:Rescheduling_interrupts
      4.11 =C2=B1 50%     -14.9%       3.50 =C2=B1 81%     +43.2%       5.8=
9 =C2=B1 29%  interrupts.CPU80.TLB:TLB_shootdowns
      0.22 =C2=B1187%   +1212.5%       2.92 =C2=B1243%  +53900.0%     120.0=
0 =C2=B1262%  interrupts.CPU81.117:PCI-MSI.31981650-edge.i40e-eth0-TxRx-81
    537.22            +1.5%     545.33 =C2=B1  3%     +56.3%     839.44 =C2=
=B1 88%  interrupts.CPU81.CAL:Function_call_interrupts
    742230 =C2=B1 15%      +3.6%     769205 =C2=B1  3%      +5.6%     78363=
4        interrupts.CPU81.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU81.MCP:Machine_check_polls
    114.44 =C2=B1 39%    +205.0%     349.00 =C2=B1223%     -30.0%      80.1=
1 =C2=B1 13%  interrupts.CPU81.NMI:Non-maskable_interrupts
    114.44 =C2=B1 39%    +205.0%     349.00 =C2=B1223%     -30.0%      80.1=
1 =C2=B1 13%  interrupts.CPU81.PMI:Performance_monitoring_interrupts
      8.78 =C2=B1 65%     +52.8%      13.42 =C2=B1121%     +54.4%      13.5=
6 =C2=B1 90%  interrupts.CPU81.RES:Rescheduling_interrupts
      3.67 =C2=B1 51%     -13.6%       3.17 =C2=B1 99%     +48.5%       5.4=
4 =C2=B1 17%  interrupts.CPU81.TLB:TLB_shootdowns
      0.11 =C2=B1282%   +2225.0%       2.58 =C2=B1320%    +1e+05%     111.2=
2 =C2=B1282%  interrupts.CPU82.118:PCI-MSI.31981651-edge.i40e-eth0-TxRx-82
    539.00 =C2=B1  2%      -1.4%     531.58 =C2=B1  6%    +125.6%       121=
5 =C2=B1154%  interrupts.CPU82.CAL:Function_call_interrupts
      0.00       +8.3e+100%       0.08 =C2=B1331%    -100.0%       0.00    =
    interrupts.CPU82.IWI:IRQ_work_interrupts
    742047 =C2=B1 15%      +3.7%     769234 =C2=B1  3%      +5.6%     78364=
2        interrupts.CPU82.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU82.MCP:Machine_check_polls
    118.78 =C2=B1 36%      -5.5%     112.25 =C2=B1 47%     -36.2%      75.7=
8 =C2=B1 12%  interrupts.CPU82.NMI:Non-maskable_interrupts
    118.78 =C2=B1 36%      -5.5%     112.25 =C2=B1 47%     -36.2%      75.7=
8 =C2=B1 12%  interrupts.CPU82.PMI:Performance_monitoring_interrupts
      8.56 =C2=B1 50%     -22.1%       6.67 =C2=B1 52%      +0.0%       8.5=
6 =C2=B1 78%  interrupts.CPU82.RES:Rescheduling_interrupts
      3.56 =C2=B1 59%     -10.9%       3.17 =C2=B1 91%     +71.9%       6.1=
1 =C2=B1 14%  interrupts.CPU82.TLB:TLB_shootdowns
    144.33 =C2=B1201%     -83.1%      24.33 =C2=B1324%     -38.0%      89.5=
6 =C2=B1202%  interrupts.CPU83.119:PCI-MSI.31981652-edge.i40e-eth0-TxRx-83
    563.44 =C2=B1 19%      -4.0%     540.92           +18.6%     668.44 =C2=
=B1 48%  interrupts.CPU83.CAL:Function_call_interrupts
      0.11 =C2=B1282%    +275.0%       0.42 =C2=B1153%    -100.0%       0.0=
0        interrupts.CPU83.IWI:IRQ_work_interrupts
    742088 =C2=B1 15%      +3.7%     769199 =C2=B1  4%      +5.6%     78367=
1        interrupts.CPU83.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU83.MCP:Machine_check_polls
    122.67 =C2=B1 43%     +13.0%     138.58 =C2=B1 48%     -45.0%      67.4=
4 =C2=B1 25%  interrupts.CPU83.NMI:Non-maskable_interrupts
    122.67 =C2=B1 43%     +13.0%     138.58 =C2=B1 48%     -45.0%      67.4=
4 =C2=B1 25%  interrupts.CPU83.PMI:Performance_monitoring_interrupts
     10.00 =C2=B1 73%     -29.2%       7.08 =C2=B1 96%     +36.7%      13.6=
7 =C2=B1106%  interrupts.CPU83.RES:Rescheduling_interrupts
      4.11 =C2=B1 63%     -18.9%       3.33 =C2=B1 97%     +54.1%       6.3=
3 =C2=B1 14%  interrupts.CPU83.TLB:TLB_shootdowns
      0.11 =C2=B1282%    +200.0%       0.33 =C2=B1141%  +31300.0%      34.8=
9 =C2=B1186%  interrupts.CPU84.120:PCI-MSI.31981653-edge.i40e-eth0-TxRx-84
    683.22 =C2=B1 40%     -20.7%     542.08           -15.0%     580.89 =C2=
=B1  8%  interrupts.CPU84.CAL:Function_call_interrupts
      0.22 =C2=B1187%    -100.0%       0.00            +0.0%       0.22 =C2=
=B1282%  interrupts.CPU84.IWI:IRQ_work_interrupts
    742084 =C2=B1 15%      +3.7%     769249 =C2=B1  4%      +5.6%     78366=
4        interrupts.CPU84.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU84.MCP:Machine_check_polls
    129.67 =C2=B1 40%      -3.1%     125.67 =C2=B1 35%    +474.2%     744.5=
6 =C2=B1256%  interrupts.CPU84.NMI:Non-maskable_interrupts
    129.67 =C2=B1 40%      -3.1%     125.67 =C2=B1 35%    +474.2%     744.5=
6 =C2=B1256%  interrupts.CPU84.PMI:Performance_monitoring_interrupts
     15.00 =C2=B1145%     -30.6%      10.42 =C2=B1 99%     +88.1%      28.2=
2 =C2=B1191%  interrupts.CPU84.RES:Rescheduling_interrupts
      3.89 =C2=B1 57%      -5.7%       3.67 =C2=B1 77%     +40.0%       5.4=
4 =C2=B1 34%  interrupts.CPU84.TLB:TLB_shootdowns
     34.78 =C2=B1187%    +455.0%     193.00 =C2=B1218%     -99.7%       0.1=
1 =C2=B1282%  interrupts.CPU85.121:PCI-MSI.31981654-edge.i40e-eth0-TxRx-85
    534.67 =C2=B1 15%     +12.7%     602.33 =C2=B1 26%     +26.7%     677.3=
3 =C2=B1 45%  interrupts.CPU85.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.1e+101%       0.11 =C2=B128=
2%  interrupts.CPU85.IWI:IRQ_work_interrupts
    742148 =C2=B1 15%      +3.6%     769165 =C2=B1  4%      +5.6%     78377=
1        interrupts.CPU85.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU85.MCP:Machine_check_polls
    119.00 =C2=B1 40%      +0.3%     119.33 =C2=B1 42%     -35.9%      76.2=
2 =C2=B1 37%  interrupts.CPU85.NMI:Non-maskable_interrupts
    119.00 =C2=B1 40%      +0.3%     119.33 =C2=B1 42%     -35.9%      76.2=
2 =C2=B1 37%  interrupts.CPU85.PMI:Performance_monitoring_interrupts
      6.44 =C2=B1 67%    +105.6%      13.25 =C2=B1161%     +37.9%       8.8=
9 =C2=B1 78%  interrupts.CPU85.RES:Rescheduling_interrupts
      3.78 =C2=B1 49%      -0.7%       3.75 =C2=B1 77%     +85.3%       7.0=
0 =C2=B1 19%  interrupts.CPU85.TLB:TLB_shootdowns
      0.00       +1.8e+104%     176.00 =C2=B1244%    -100.0%       0.00    =
    interrupts.CPU86.122:PCI-MSI.31981655-edge.i40e-eth0-TxRx-86
    702.67 =C2=B1 48%     +20.9%     849.50 =C2=B1119%     +29.4%     909.0=
0 =C2=B1 81%  interrupts.CPU86.CAL:Function_call_interrupts
      0.11 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU86.IWI:IRQ_work_interrupts
    742225 =C2=B1 15%      +3.6%     769189 =C2=B1  4%      +5.6%     78359=
1        interrupts.CPU86.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU86.MCP:Machine_check_polls
    121.33 =C2=B1 41%      -2.7%     118.00 =C2=B1 44%     -42.9%      69.2=
2 =C2=B1 29%  interrupts.CPU86.NMI:Non-maskable_interrupts
    121.33 =C2=B1 41%      -2.7%     118.00 =C2=B1 44%     -42.9%      69.2=
2 =C2=B1 29%  interrupts.CPU86.PMI:Performance_monitoring_interrupts
     16.56 =C2=B1125%     -47.1%       8.75 =C2=B1 73%     -46.3%       8.8=
9 =C2=B1 62%  interrupts.CPU86.RES:Rescheduling_interrupts
      3.78 =C2=B1 49%      -0.7%       3.75 =C2=B1 78%     +70.6%       6.4=
4 =C2=B1 19%  interrupts.CPU86.TLB:TLB_shootdowns
     38.44 =C2=B1282%     -93.5%       2.50 =C2=B1331%     -80.6%       7.4=
4 =C2=B1278%  interrupts.CPU87.123:PCI-MSI.31981656-edge.i40e-eth0-TxRx-87
    554.44 =C2=B1  3%      +0.0%     554.58 =C2=B1  3%      -4.2%     530.8=
9 =C2=B1 11%  interrupts.CPU87.CAL:Function_call_interrupts
    742363 =C2=B1 15%      +3.6%     769240 =C2=B1  3%      +5.6%     78373=
5        interrupts.CPU87.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU87.MCP:Machine_check_polls
    119.22 =C2=B1 41%      -1.6%     117.33 =C2=B1 44%     -39.1%      72.5=
6 =C2=B1 21%  interrupts.CPU87.NMI:Non-maskable_interrupts
    119.22 =C2=B1 41%      -1.6%     117.33 =C2=B1 44%     -39.1%      72.5=
6 =C2=B1 21%  interrupts.CPU87.PMI:Performance_monitoring_interrupts
     13.33 =C2=B1 68%      -4.4%      12.75 =C2=B1105%     -45.0%       7.3=
3 =C2=B1 51%  interrupts.CPU87.RES:Rescheduling_interrupts
      3.78 =C2=B1 44%      +5.9%       4.00 =C2=B1 70%     +79.4%       6.7=
8 =C2=B1 25%  interrupts.CPU87.TLB:TLB_shootdowns
    564.11 =C2=B1282%     -80.7%     108.83 =C2=B1299%     -90.7%      52.4=
4 =C2=B1282%  interrupts.CPU88.124:PCI-MSI.31981657-edge.i40e-eth0-TxRx-88
    911.56 =C2=B1114%      +0.0%     912.00 =C2=B1102%     -23.9%     693.6=
7 =C2=B1 51%  interrupts.CPU88.CAL:Function_call_interrupts
      0.00       +8.3e+100%       0.08 =C2=B1331%    -100.0%       0.00    =
    interrupts.CPU88.IWI:IRQ_work_interrupts
    742075 =C2=B1 15%      +3.7%     769202 =C2=B1  3%      +5.6%     78372=
0        interrupts.CPU88.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU88.MCP:Machine_check_polls
    117.11 =C2=B1 39%      +4.7%     122.58 =C2=B1 40%     -42.2%      67.6=
7 =C2=B1 30%  interrupts.CPU88.NMI:Non-maskable_interrupts
    117.11 =C2=B1 39%      +4.7%     122.58 =C2=B1 40%     -42.2%      67.6=
7 =C2=B1 30%  interrupts.CPU88.PMI:Performance_monitoring_interrupts
      7.89 =C2=B1 71%     +82.7%      14.42 =C2=B1 76%     -16.9%       6.5=
6 =C2=B1 62%  interrupts.CPU88.RES:Rescheduling_interrupts
      4.00 =C2=B1 47%      -8.3%       3.67 =C2=B1 72%     +58.3%       6.3=
3 =C2=B1 27%  interrupts.CPU88.TLB:TLB_shootdowns
     11.44 =C2=B1240%    +333.3%      49.58 =C2=B1331%     -97.1%       0.3=
3 =C2=B1200%  interrupts.CPU89.125:PCI-MSI.31981658-edge.i40e-eth0-TxRx-89
    541.78 =C2=B1  2%      +2.0%     552.75 =C2=B1  3%      +1.0%     547.0=
0        interrupts.CPU89.CAL:Function_call_interrupts
      0.11 =C2=B1282%     -25.0%       0.08 =C2=B1331%      +0.0%       0.1=
1 =C2=B1282%  interrupts.CPU89.IWI:IRQ_work_interrupts
    742048 =C2=B1 15%      +3.7%     769141 =C2=B1  3%      +5.6%     78364=
3        interrupts.CPU89.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU89.MCP:Machine_check_polls
    125.11 =C2=B1 42%      -2.0%     122.67 =C2=B1 47%     -40.3%      74.6=
7 =C2=B1 38%  interrupts.CPU89.NMI:Non-maskable_interrupts
    125.11 =C2=B1 42%      -2.0%     122.67 =C2=B1 47%     -40.3%      74.6=
7 =C2=B1 38%  interrupts.CPU89.PMI:Performance_monitoring_interrupts
     18.67 =C2=B1159%     -42.4%      10.75 =C2=B1 84%     -73.2%       5.0=
0 =C2=B1 73%  interrupts.CPU89.RES:Rescheduling_interrupts
      3.56 =C2=B1 40%     +19.5%       4.25 =C2=B1 63%    +100.0%       7.1=
1 =C2=B1 12%  interrupts.CPU89.TLB:TLB_shootdowns
      0.11 =C2=B1282%     +50.0%       0.17 =C2=B1223%    +100.0%       0.2=
2 =C2=B1187%  interrupts.CPU9.128:PCI-MSI.31981661-edge.i40e-eth0-TxRx-92
    143.33 =C2=B1233%    +418.4%     743.08 =C2=B1221%    -100.0%       0.0=
0        interrupts.CPU9.45:PCI-MSI.31981578-edge.i40e-eth0-TxRx-9
      0.22 =C2=B1187%     +50.0%       0.33 =C2=B1141%      +0.0%       0.2=
2 =C2=B1187%  interrupts.CPU9.80:PCI-MSI.31981613-edge.i40e-eth0-TxRx-44
    729.78 =C2=B1 67%     +43.1%       1044 =C2=B1113%     +42.2%       103=
7 =C2=B1131%  interrupts.CPU9.CAL:Function_call_interrupts
    774586 =C2=B1  3%      -6.7%     722508 =C2=B1 18%      +1.2%     78368=
1        interrupts.CPU9.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU9.MCP:Machine_check_polls
    104.00 =C2=B1 18%     -13.0%      90.50 =C2=B1 30%    +323.3%     440.2=
2 =C2=B1231%  interrupts.CPU9.NMI:Non-maskable_interrupts
    104.00 =C2=B1 18%     -13.0%      90.50 =C2=B1 30%    +323.3%     440.2=
2 =C2=B1231%  interrupts.CPU9.PMI:Performance_monitoring_interrupts
     12.44 =C2=B1 64%   +1876.8%     246.00 =C2=B1306%     +27.7%      15.8=
9 =C2=B1 75%  interrupts.CPU9.RES:Rescheduling_interrupts
      1.56 =C2=B1109%     +23.2%       1.92 =C2=B1138%    +185.7%       4.4=
4 =C2=B1 28%  interrupts.CPU9.TLB:TLB_shootdowns
    538.67 =C2=B1282%   +1919.4%      10877 =C2=B1331%    -100.0%       0.0=
0        interrupts.CPU90.126:PCI-MSI.31981659-edge.i40e-eth0-TxRx-90
    542.56            +1.3%     549.50 =C2=B1  3%      +8.0%     585.89 =C2=
=B1 18%  interrupts.CPU90.CAL:Function_call_interrupts
      0.11 =C2=B1282%     -25.0%       0.08 =C2=B1331%    -100.0%       0.0=
0        interrupts.CPU90.IWI:IRQ_work_interrupts
    742180 =C2=B1 15%      +3.6%     769219 =C2=B1  4%      +5.6%     78363=
8        interrupts.CPU90.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU90.MCP:Machine_check_polls
    126.44 =C2=B1 39%      +0.2%     126.67 =C2=B1 39%     -47.6%      66.2=
2 =C2=B1 27%  interrupts.CPU90.NMI:Non-maskable_interrupts
    126.44 =C2=B1 39%      +0.2%     126.67 =C2=B1 39%     -47.6%      66.2=
2 =C2=B1 27%  interrupts.CPU90.PMI:Performance_monitoring_interrupts
     10.89 =C2=B1 93%     +24.7%      13.58 =C2=B1119%      -2.0%      10.6=
7 =C2=B1 78%  interrupts.CPU90.RES:Rescheduling_interrupts
      4.22 =C2=B1 33%      -3.3%       4.08 =C2=B1 66%     +50.0%       6.3=
3 =C2=B1 28%  interrupts.CPU90.TLB:TLB_shootdowns
     13770 =C2=B1282%    -100.0%       0.00          -100.0%       0.00    =
    interrupts.CPU91.127:PCI-MSI.31981660-edge.i40e-eth0-TxRx-91
    907.89 =C2=B1114%     -36.3%     578.58 =C2=B1 14%     -32.9%     609.3=
3 =C2=B1 25%  interrupts.CPU91.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +1.1e+101%       0.11 =C2=B128=
2%  interrupts.CPU91.IWI:IRQ_work_interrupts
    742276 =C2=B1 15%      +3.6%     769195 =C2=B1  4%      +5.6%     78367=
3        interrupts.CPU91.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU91.MCP:Machine_check_polls
    113.56 =C2=B1 40%      +5.2%     119.42 =C2=B1 41%     -31.3%      78.0=
0 =C2=B1 29%  interrupts.CPU91.NMI:Non-maskable_interrupts
    113.56 =C2=B1 40%      +5.2%     119.42 =C2=B1 41%     -31.3%      78.0=
0 =C2=B1 29%  interrupts.CPU91.PMI:Performance_monitoring_interrupts
     17.11 =C2=B1108%     -56.7%       7.42 =C2=B1 62%     -50.6%       8.4=
4 =C2=B1 75%  interrupts.CPU91.RES:Rescheduling_interrupts
      4.11 =C2=B1 31%      +9.5%       4.50 =C2=B1 65%     +64.9%       6.7=
8 =C2=B1 11%  interrupts.CPU91.TLB:TLB_shootdowns
      0.78 =C2=B1240%     -78.6%       0.17 =C2=B1223%   +5014.3%      39.7=
8 =C2=B1280%  interrupts.CPU92.128:PCI-MSI.31981661-edge.i40e-eth0-TxRx-92
    558.33 =C2=B1  6%     +11.8%     624.33 =C2=B1 42%     +26.0%     703.2=
2 =C2=B1 60%  interrupts.CPU92.CAL:Function_call_interrupts
      0.00          -100.0%       0.00       +2.2e+101%       0.22 =C2=B128=
2%  interrupts.CPU92.IWI:IRQ_work_interrupts
    742166 =C2=B1 15%      +3.6%     769146 =C2=B1  4%      +5.6%     78362=
5        interrupts.CPU92.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU92.MCP:Machine_check_polls
    117.78 =C2=B1 38%      -1.2%     116.33 =C2=B1 45%    +534.5%     747.3=
3 =C2=B1255%  interrupts.CPU92.NMI:Non-maskable_interrupts
    117.78 =C2=B1 38%      -1.2%     116.33 =C2=B1 45%    +534.5%     747.3=
3 =C2=B1255%  interrupts.CPU92.PMI:Performance_monitoring_interrupts
      8.44 =C2=B1 83%     -23.0%       6.50 =C2=B1 61%     +39.5%      11.7=
8 =C2=B1 98%  interrupts.CPU92.RES:Rescheduling_interrupts
      4.89 =C2=B1 28%      -8.0%       4.50 =C2=B1 51%     +29.5%       6.3=
3 =C2=B1 36%  interrupts.CPU92.TLB:TLB_shootdowns
      2715 =C2=B1206%     -83.3%     454.00 =C2=B1327%    -100.0%       0.0=
0        interrupts.CPU93.129:PCI-MSI.31981662-edge.i40e-eth0-TxRx-93
    725.00 =C2=B1 64%     -25.5%     540.00 =C2=B1 13%     -24.3%     549.1=
1        interrupts.CPU93.CAL:Function_call_interrupts
    742161 =C2=B1 15%      +3.6%     769136 =C2=B1  4%      +5.6%     78365=
8        interrupts.CPU93.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU93.MCP:Machine_check_polls
    117.44 =C2=B1 40%      -2.9%     114.00 =C2=B1 44%     -39.5%      71.1=
1 =C2=B1 22%  interrupts.CPU93.NMI:Non-maskable_interrupts
    117.44 =C2=B1 40%      -2.9%     114.00 =C2=B1 44%     -39.5%      71.1=
1 =C2=B1 22%  interrupts.CPU93.PMI:Performance_monitoring_interrupts
     15.56 =C2=B1112%     -45.9%       8.42 =C2=B1 69%     -62.1%       5.8=
9 =C2=B1 85%  interrupts.CPU93.RES:Rescheduling_interrupts
      4.67 =C2=B1 24%     +10.7%       5.17 =C2=B1 45%     +69.0%       7.8=
9 =C2=B1 17%  interrupts.CPU93.TLB:TLB_shootdowns
    595.11 =C2=B1 12%      +3.5%     616.17 =C2=B1 39%      -7.0%     553.3=
3        interrupts.CPU94.CAL:Function_call_interrupts
    742121 =C2=B1 15%      +3.6%     769155 =C2=B1  3%      +5.6%     78372=
9        interrupts.CPU94.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU94.MCP:Machine_check_polls
    117.00 =C2=B1 39%      -0.2%     116.75 =C2=B1 44%     -39.0%      71.3=
3 =C2=B1 23%  interrupts.CPU94.NMI:Non-maskable_interrupts
    117.00 =C2=B1 39%      -0.2%     116.75 =C2=B1 44%     -39.0%      71.3=
3 =C2=B1 23%  interrupts.CPU94.PMI:Performance_monitoring_interrupts
      8.78 =C2=B1 35%     +26.3%      11.08 =C2=B1101%     -68.4%       2.7=
8 =C2=B1 62%  interrupts.CPU94.RES:Rescheduling_interrupts
      4.78 =C2=B1 19%      +9.9%       5.25 =C2=B1 40%     +58.1%       7.5=
6 =C2=B1 11%  interrupts.CPU94.TLB:TLB_shootdowns
    519.33 =C2=B1  5%      +9.3%     567.42 =C2=B1 16%      +1.0%     524.5=
6 =C2=B1 13%  interrupts.CPU95.CAL:Function_call_interrupts
      0.22 =C2=B1187%     -25.0%       0.17 =C2=B1223%    -100.0%       0.0=
0        interrupts.CPU95.IWI:IRQ_work_interrupts
    742181 =C2=B1 15%      +3.6%     769213 =C2=B1  3%      +5.6%     78367=
1        interrupts.CPU95.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU95.MCP:Machine_check_polls
    133.33 =C2=B1 43%      -6.1%     125.25 =C2=B1 52%     -45.4%      72.7=
8 =C2=B1 31%  interrupts.CPU95.NMI:Non-maskable_interrupts
    133.33 =C2=B1 43%      -6.1%     125.25 =C2=B1 52%     -45.4%      72.7=
8 =C2=B1 31%  interrupts.CPU95.PMI:Performance_monitoring_interrupts
     12.33 =C2=B1 80%     -16.9%      10.25 =C2=B1 64%     -20.7%       9.7=
8 =C2=B1106%  interrupts.CPU95.RES:Rescheduling_interrupts
      0.11 =C2=B1282%    +275.0%       0.42 =C2=B1153%    +200.0%       0.3=
3 =C2=B1200%  interrupts.CPU95.TLB:TLB_shootdowns
      4.56 =C2=B1 61%     +15.2%       5.25 =C2=B1 47%     -48.8%       2.3=
3 =C2=B1 28%  interrupts.IWI:IRQ_work_interrupts
  72801215 =C2=B1  9%      -1.6%   71607644 =C2=B1 11%      +3.3%   7523252=
5        interrupts.LOC:Local_timer_interrupts
     96.00            +0.0%      96.00            +0.0%      96.00        i=
nterrupts.MCP:Machine_check_polls
     17999 =C2=B1 16%      +1.6%      18282 =C2=B1 19%     -18.4%      1469=
6 =C2=B1 10%  interrupts.NMI:Non-maskable_interrupts
     17999 =C2=B1 16%      +1.6%      18282 =C2=B1 19%     -18.4%      1469=
6 =C2=B1 10%  interrupts.PMI:Performance_monitoring_interrupts
      2608 =C2=B1 45%     +22.0%       3182 =C2=B1 82%     -33.7%       173=
0 =C2=B1 13%  interrupts.RES:Rescheduling_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.RTR:APIC_ICR_read_retries
    243.78 =C2=B1 68%      +7.8%     262.75 =C2=B1106%    +111.3%     515.2=
2 =C2=B1 14%  interrupts.TLB:TLB_shootdowns

> =

> Thanks,
> Amir.
--===============8456710297125305419==--

