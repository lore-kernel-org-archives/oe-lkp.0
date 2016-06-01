Content-Type: multipart/mixed; boundary="===============7858834135974947972=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 53d3bc773e: hackbench.throughput -32.9% regression
Date: Wed, 01 Jun 2016 13:00:10 +0800
Message-ID: <87eg8h8pwl.fsf@yhuang-dev.intel.com>
In-Reply-To: <20160531124151.GK3190@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============7858834135974947972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Peter,

Peter Zijlstra <peterz@infradead.org> writes:

> On Tue, May 31, 2016 at 04:34:36PM +0800, Huang, Ying wrote:
>> Hi, Ingo,
>> =

>> Part of the regression has been recovered in v4.7-rc1 from -32.9% to
>> -9.8%.  But there is still some regression.  Is it possible for fully
>> restore it?
>
> after much searching on how you guys run hackbench... I figured
> something like:
>
>   perf bench sched messaging -g 20 --thread -l 60000

There is a reproduce file attached in the original report email, its
contents is something like below:

2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu0/cpufreq=
/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu1/cpufreq=
/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu10/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu11/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu12/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu13/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu14/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu15/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu16/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu17/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu18/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu19/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu2/cpufreq=
/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu20/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu21/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu22/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu23/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu24/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu25/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu26/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu27/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu28/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu29/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu3/cpufreq=
/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu30/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu31/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu32/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu33/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu34/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu35/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu36/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu37/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu38/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu39/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu4/cpufreq=
/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu40/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu41/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu42/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu43/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu44/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu45/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu46/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu47/cpufre=
q/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu5/cpufreq=
/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu6/cpufreq=
/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu7/cpufreq=
/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu8/cpufreq=
/scaling_governor
2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu9/cpufreq=
/scaling_governor
2016-05-15 08:57:03 /usr/bin/hackbench -g 24 --threads -l 60000
2016-05-15 08:57:50 /usr/bin/hackbench -g 24 --threads -l 60000
2016-05-15 08:58:33 /usr/bin/hackbench -g 24 --threads -l 60000
2016-05-15 08:59:15 /usr/bin/hackbench -g 24 --threads -l 60000
2016-05-15 08:59:58 /usr/bin/hackbench -g 24 --threads -l 60000
2016-05-15 09:00:43 /usr/bin/hackbench -g 24 --threads -l 60000
2016-05-15 09:01:22 /usr/bin/hackbench -g 24 --threads -l 60000
2016-05-15 09:01:57 /usr/bin/hackbench -g 24 --threads -l 60000
2016-05-15 09:02:39 /usr/bin/hackbench -g 24 --threads -l 60000
2016-05-15 09:03:22 /usr/bin/hackbench -g 24 --threads -l 60000
2016-05-15 09:04:10 /usr/bin/hackbench -g 24 --threads -l 60000
2016-05-15 09:04:53 /usr/bin/hackbench -g 24 --threads -l 60000
2016-05-15 09:05:39 /usr/bin/hackbench -g 24 --threads -l 60000
2016-05-15 09:06:24 /usr/bin/hackbench -g 24 --threads -l 60000

Hope that will help you for reproduce.

> on my IVB-EP (2*10*2) is similar to your IVT thing.
>
> And running something like:
>
>   for i in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor ; do ech=
o performance > $i ; done
>   perf stat --null --repeat 10 -- perf bench sched messaging -g 20 --thre=
ad -l 60000 | grep "seconds time elapsed"
>
> gets me:
>
> v4.6:
>
>       36.786914089 seconds time elapsed ( +-  0.49% )
>       37.054017355 seconds time elapsed ( +-  1.05% )
>
>
> origin/master (v4.7-rc1-ish):
>
>       34.757435264 seconds time elapsed ( +-  3.34% )
>       35.396252515 seconds time elapsed ( +-  3.38% )
>
>
> Which doesn't show a regression between v4.6 and HEAD; in fact it shows
> an improvement.

Yes.  For hackbench test, linus/master (v4.7-rc1+) is better than v4.6,
but it is worse than v4.6-rc7.  Details is as below.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/nr_threads/mod=
e/ipc:
  ivb42/hackbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performa=
nce/50%/threads/socket

commit: =

  v4.6-rc7
  v4.6
  367d3fd50566a313946fa9c5b2116a81bf3807e4

        v4.6-rc7                       v4.6 367d3fd50566a313946fa9c5b2 =

---------------- -------------------------- -------------------------- =

         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \  =

    198307 =C2=B1  0%     -33.4%     132165 =C2=B1  3%     -11.8%     17485=
7 =C2=B1  0%  hackbench.throughput
    625.91 =C2=B1  0%      -2.0%     613.12 =C2=B1  1%      -2.1%     612.8=
5 =C2=B1  0%  hackbench.time.elapsed_time
    625.91 =C2=B1  0%      -2.0%     613.12 =C2=B1  1%      -2.1%     612.8=
5 =C2=B1  0%  hackbench.time.elapsed_time.max
 1.611e+08 =C2=B1  0%    +254.7%  5.712e+08 =C2=B1  4%     -25.3%  1.203e+0=
8 =C2=B1  5%  hackbench.time.involuntary_context_switches
    212287 =C2=B1  2%     +22.3%     259622 =C2=B1  4%     +33.0%     28226=
1 =C2=B1  1%  hackbench.time.minor_page_faults
      4391 =C2=B1  0%      +5.7%       4643 =C2=B1  0%      -6.9%       409=
0 =C2=B1  0%  hackbench.time.percent_of_cpu_this_job_got
     26154 =C2=B1  0%      +5.2%      27509 =C2=B1  1%      -8.5%      2393=
5 =C2=B1  0%  hackbench.time.system_time
      1336 =C2=B1  0%     -28.1%     961.07 =C2=B1  2%     -14.8%       113=
8 =C2=B1  0%  hackbench.time.user_time
 7.442e+08 =C2=B1  0%    +129.6%  1.709e+09 =C2=B1  4%     -17.5%  6.139e+0=
8 =C2=B1  2%  hackbench.time.voluntary_context_switches
      4157 =C2=B1  1%     -39.0%       2536 =C2=B1 15%     +44.6%       601=
1 =C2=B1  2%  uptime.idle
   1656569 =C2=B1  0%    +131.8%    3840033 =C2=B1  3%     -10.2%    148684=
0 =C2=B1  2%  vmstat.system.cs
    225682 =C2=B1  0%    +335.2%     982245 =C2=B1  5%      -4.2%     21630=
0 =C2=B1  7%  vmstat.system.in
   4416560 =C2=B1  3%      +7.3%    4737257 =C2=B1  2%     -18.1%    361783=
6 =C2=B1  1%  softirqs.RCU
   2591680 =C2=B1  0%     -37.9%    1608431 =C2=B1  7%     +47.9%    383367=
3 =C2=B1  0%  softirqs.SCHED
  13948275 =C2=B1  0%      +3.3%   14406201 =C2=B1  1%      -8.9%   1270388=
7 =C2=B1  0%  softirqs.TIMER
 1.611e+08 =C2=B1  0%    +254.7%  5.712e+08 =C2=B1  4%     -25.3%  1.203e+0=
8 =C2=B1  5%  time.involuntary_context_switches
    212287 =C2=B1  2%     +22.3%     259622 =C2=B1  4%     +33.0%     28226=
1 =C2=B1  1%  time.minor_page_faults
      1336 =C2=B1  0%     -28.1%     961.07 =C2=B1  2%     -14.8%       113=
8 =C2=B1  0%  time.user_time
 7.442e+08 =C2=B1  0%    +129.6%  1.709e+09 =C2=B1  4%     -17.5%  6.139e+0=
8 =C2=B1  2%  time.voluntary_context_switches
    176970 =C2=B1  1%      +2.4%     181276 =C2=B1  0%     -51.5%      8586=
5 =C2=B1  0%  meminfo.Active
    101149 =C2=B1  2%      +0.4%     101589 =C2=B1  1%     -85.4%      1480=
7 =C2=B1  0%  meminfo.Active(file)
    390916 =C2=B1  0%      +1.1%     395022 =C2=B1  0%     +23.2%     48166=
4 =C2=B1  0%  meminfo.Inactive
    381267 =C2=B1  0%      +1.1%     385296 =C2=B1  0%     +23.8%     47203=
5 =C2=B1  0%  meminfo.Inactive(file)
    143716 =C2=B1  0%     -12.4%     125923 =C2=B1  1%      -2.4%     14023=
0 =C2=B1  0%  meminfo.SUnreclaim
    194906 =C2=B1  0%      -8.9%     177650 =C2=B1  1%      -1.8%     19147=
8 =C2=B1  0%  meminfo.Slab
   1162151 =C2=B1  6%     +11.4%    1294775 =C2=B1  2%     +17.5%    136536=
0 =C2=B1  1%  numa-numastat.node0.local_node
   1163400 =C2=B1  6%     +11.5%    1297646 =C2=B1  2%     +17.4%    136536=
1 =C2=B1  1%  numa-numastat.node0.numa_hit
      1249 =C2=B1197%    +129.8%       2871 =C2=B1 95%     -99.9%       0.6=
7 =C2=B1 70%  numa-numastat.node0.other_node
   1084104 =C2=B1  6%     +15.1%    1247352 =C2=B1  4%     +22.0%    132314=
9 =C2=B1  1%  numa-numastat.node1.local_node
   1089973 =C2=B1  6%     +14.9%    1252683 =C2=B1  4%     +21.4%    132314=
9 =C2=B1  1%  numa-numastat.node1.numa_hit
      5868 =C2=B1 40%      -9.2%       5330 =C2=B1 70%    -100.0%       0.3=
3 =C2=B1141%  numa-numastat.node1.other_node
     92.11 =C2=B1  0%      +5.5%      97.16 =C2=B1  0%      -6.3%      86.3=
3 =C2=B1  0%  turbostat.%Busy
      2756 =C2=B1  0%      +5.5%       2907 =C2=B1  0%      -6.3%       258=
4 =C2=B1  0%  turbostat.Avg_MHz
      7.70 =C2=B1  0%     -65.6%       2.64 =C2=B1 12%     +74.9%      13.4=
6 =C2=B1  2%  turbostat.CPU%c1
    180.27 =C2=B1  0%      -1.6%     177.34 =C2=B1  0%      -2.5%     175.8=
0 =C2=B1  0%  turbostat.CorWatt
    210.07 =C2=B1  0%      -1.1%     207.71 =C2=B1  0%      -1.9%     206.0=
1 =C2=B1  0%  turbostat.PkgWatt
      5.81 =C2=B1  0%     +35.8%       7.88 =C2=B1  3%     +24.2%       7.2=
1 =C2=B1  2%  turbostat.RAMWatt
    102504 =C2=B1 20%      -5.6%      96726 =C2=B1 25%     -65.7%      3512=
9 =C2=B1 52%  numa-meminfo.node0.Active
     50026 =C2=B1  2%      +2.3%      51197 =C2=B1  4%     -85.2%       740=
8 =C2=B1  0%  numa-meminfo.node0.Active(file)
    198553 =C2=B1  2%      +0.4%     199265 =C2=B1  3%     +22.0%     24221=
1 =C2=B1  1%  numa-meminfo.node0.Inactive
    191148 =C2=B1  1%      +1.7%     194350 =C2=B1  3%     +23.5%     23597=
8 =C2=B1  0%  numa-meminfo.node0.Inactive(file)
     74572 =C2=B1  8%     -11.8%      65807 =C2=B1  5%      -4.4%      7125=
7 =C2=B1  3%  numa-meminfo.node0.SUnreclaim
     51121 =C2=B1  5%      -1.4%      50391 =C2=B1  4%     -85.5%       739=
8 =C2=B1  0%  numa-meminfo.node1.Active(file)
    192353 =C2=B1  1%      +1.8%     195730 =C2=B1  2%     +24.5%     23943=
0 =C2=B1  1%  numa-meminfo.node1.Inactive
    190119 =C2=B1  0%      +0.4%     190946 =C2=B1  1%     +24.2%     23605=
5 =C2=B1  0%  numa-meminfo.node1.Inactive(file)
    472112 =C2=B1  5%      +3.0%     486190 =C2=B1  5%      +8.2%     51090=
2 =C2=B1  4%  numa-meminfo.node1.MemUsed
     12506 =C2=B1  2%      +2.3%      12799 =C2=B1  4%     -85.2%       185=
2 =C2=B1  0%  numa-vmstat.node0.nr_active_file
     47786 =C2=B1  1%      +1.7%      48587 =C2=B1  3%     +23.5%      5899=
4 =C2=B1  0%  numa-vmstat.node0.nr_inactive_file
     18626 =C2=B1  8%     -11.7%      16446 =C2=B1  5%      -4.4%      1780=
1 =C2=B1  3%  numa-vmstat.node0.nr_slab_unreclaimable
     66037 =C2=B1  3%      +3.1%      68095 =C2=B1  4%    -100.0%       0.0=
0 =C2=B1  0%  numa-vmstat.node0.numa_other
     12780 =C2=B1  5%      -1.4%      12597 =C2=B1  4%     -85.5%       184=
9 =C2=B1  0%  numa-vmstat.node1.nr_active_file
     47529 =C2=B1  0%      +0.4%      47735 =C2=B1  1%     +24.2%      5901=
3 =C2=B1  0%  numa-vmstat.node1.nr_inactive_file
    698206 =C2=B1  5%     +11.3%     777438 =C2=B1  4%     +17.6%     82080=
5 =C2=B1  2%  numa-vmstat.node1.numa_hit
    674672 =C2=B1  6%     +12.0%     755944 =C2=B1  4%     +21.7%     82080=
5 =C2=B1  2%  numa-vmstat.node1.numa_local
     23532 =C2=B1 10%      -8.7%      21493 =C2=B1 15%    -100.0%       0.0=
0 =C2=B1  0%  numa-vmstat.node1.numa_other
 1.766e+09 =C2=B1  0%     -60.1%  7.057e+08 =C2=B1 11%     +70.1%  3.004e+0=
9 =C2=B1  1%  cpuidle.C1-IVT.time
 1.125e+08 =C2=B1  0%     -41.9%   65415380 =C2=B1 10%     +38.6%  1.559e+0=
8 =C2=B1  0%  cpuidle.C1-IVT.usage
  28400387 =C2=B1  1%     -86.0%    3980259 =C2=B1 24%     +21.9%   3461188=
8 =C2=B1  3%  cpuidle.C1E-IVT.time
    308989 =C2=B1  0%     -84.5%      47825 =C2=B1 23%     +10.1%     34011=
5 =C2=B1  3%  cpuidle.C1E-IVT.usage
  58891432 =C2=B1  0%     -88.2%    6936400 =C2=B1 20%     +36.2%   8020970=
4 =C2=B1  4%  cpuidle.C3-IVT.time
    521047 =C2=B1  0%     -86.5%      70085 =C2=B1 22%     +16.6%     60762=
6 =C2=B1  3%  cpuidle.C3-IVT.usage
 5.375e+08 =C2=B1  0%     -75.8%  1.298e+08 =C2=B1 11%     +55.6%  8.366e+0=
8 =C2=B1  2%  cpuidle.C6-IVT.time
   4062211 =C2=B1  0%     -85.1%     603908 =C2=B1 22%     +28.0%    520012=
9 =C2=B1  2%  cpuidle.C6-IVT.usage
     15694 =C2=B1  6%    +386.2%      76300 =C2=B1145%    +774.3%     13721=
2 =C2=B1 62%  cpuidle.POLL.time
      2751 =C2=B1  3%     -52.5%       1308 =C2=B1 18%     +15.4%       317=
6 =C2=B1  2%  cpuidle.POLL.usage
     25287 =C2=B1  2%      +0.4%      25397 =C2=B1  1%     -85.4%       370=
1 =C2=B1  0%  proc-vmstat.nr_active_file
     95316 =C2=B1  0%      +1.1%      96323 =C2=B1  0%     +23.8%     11800=
8 =C2=B1  0%  proc-vmstat.nr_inactive_file
     35930 =C2=B1  0%     -12.3%      31511 =C2=B1  1%      -2.5%      3504=
8 =C2=B1  0%  proc-vmstat.nr_slab_unreclaimable
    154964 =C2=B1  3%     +40.6%     217915 =C2=B1  5%     +48.6%     23035=
4 =C2=B1  2%  proc-vmstat.numa_hint_faults
    128683 =C2=B1  4%     +46.4%     188443 =C2=B1  5%     +45.5%     18717=
9 =C2=B1  2%  proc-vmstat.numa_hint_faults_local
   2247802 =C2=B1  0%     +13.2%    2544572 =C2=B1  2%     +19.5%    268599=
0 =C2=B1  0%  proc-vmstat.numa_hit
   2241597 =C2=B1  0%     +13.2%    2537511 =C2=B1  2%     +19.8%    268598=
9 =C2=B1  0%  proc-vmstat.numa_local
      6205 =C2=B1  0%     +13.8%       7060 =C2=B1 18%    -100.0%       1.0=
0 =C2=B1  0%  proc-vmstat.numa_other
     23151 =C2=B1  1%     -25.8%      17189 =C2=B1  4%      -1.7%      2276=
2 =C2=B1  0%  proc-vmstat.numa_pages_migrated
    155763 =C2=B1  3%     +43.4%     223408 =C2=B1  5%     +49.7%     23324=
7 =C2=B1  2%  proc-vmstat.numa_pte_updates
     14010 =C2=B1  1%     +16.3%      16287 =C2=B1  7%     -17.1%      1161=
0 =C2=B1  0%  proc-vmstat.pgactivate
    373910 =C2=B1  2%     +28.4%     479928 =C2=B1  4%     +30.1%     48650=
6 =C2=B1  1%  proc-vmstat.pgalloc_dma32
   7157922 =C2=B1  1%     +30.9%    9370533 =C2=B1  2%     +38.0%    987809=
5 =C2=B1  0%  proc-vmstat.pgalloc_normal
   7509133 =C2=B1  1%     +30.9%    9827974 =C2=B1  2%     +37.8%   1034559=
8 =C2=B1  0%  proc-vmstat.pgfree
     23151 =C2=B1  1%     -25.8%      17189 =C2=B1  4%      -1.7%      2276=
2 =C2=B1  0%  proc-vmstat.pgmigrate_success
    737.40 =C2=B1  4%     -10.3%     661.25 =C2=B1  3%     -30.8%     510.0=
0 =C2=B1  0%  slabinfo.RAW.active_objs
    737.40 =C2=B1  4%     -10.3%     661.25 =C2=B1  3%     -30.8%     510.0=
0 =C2=B1  0%  slabinfo.RAW.num_objs
      5762 =C2=B1  6%     -19.2%       4653 =C2=B1  3%    -100.0%       0.0=
0 =C2=B1 -1%  slabinfo.UNIX.active_objs
    172.60 =C2=B1  6%     -18.9%     140.00 =C2=B1  3%    -100.0%       0.0=
0 =C2=B1 -1%  slabinfo.UNIX.active_slabs
      5892 =C2=B1  6%     -19.0%       4775 =C2=B1  3%    -100.0%       0.0=
0 =C2=B1 -1%  slabinfo.UNIX.num_objs
    172.60 =C2=B1  6%     -18.9%     140.00 =C2=B1  3%    -100.0%       0.0=
0 =C2=B1 -1%  slabinfo.UNIX.num_slabs
     37256 =C2=B1  3%      -8.7%      34010 =C2=B1  3%      +1.6%      3786=
3 =C2=B1  0%  slabinfo.anon_vma_chain.active_objs
     37401 =C2=B1  3%      -8.8%      34094 =C2=B1  3%      +1.5%      3794=
8 =C2=B1  0%  slabinfo.anon_vma_chain.num_objs
      4509 =C2=B1  1%     +13.8%       5130 =C2=B1  9%      +8.3%       488=
5 =C2=B1 15%  slabinfo.cred_jar.active_objs
      4509 =C2=B1  1%     +13.8%       5130 =C2=B1  9%      +8.3%       488=
5 =C2=B1 15%  slabinfo.cred_jar.num_objs
      2783 =C2=B1  2%      +3.4%       2877 =C2=B1  4%     +54.3%       429=
5 =C2=B1  0%  slabinfo.kmalloc-1024.active_objs
      2858 =C2=B1  1%      +2.6%       2932 =C2=B1  3%     +53.4%       438=
5 =C2=B1  0%  slabinfo.kmalloc-1024.num_objs
     25441 =C2=B1  1%     -10.1%      22884 =C2=B1  1%      -3.8%      2447=
7 =C2=B1  2%  slabinfo.kmalloc-16.active_objs
     25441 =C2=B1  1%     -10.1%      22884 =C2=B1  1%      -3.8%      2447=
7 =C2=B1  2%  slabinfo.kmalloc-16.num_objs
     43013 =C2=B1  0%     -41.4%      25205 =C2=B1  5%      +3.1%      4436=
6 =C2=B1  1%  slabinfo.kmalloc-256.active_objs
    854.60 =C2=B1  0%     -42.0%     495.25 =C2=B1  5%      -1.0%     846.0=
0 =C2=B1  0%  slabinfo.kmalloc-256.active_slabs
     54719 =C2=B1  0%     -42.0%      31735 =C2=B1  5%      -1.0%      5418=
9 =C2=B1  0%  slabinfo.kmalloc-256.num_objs
    854.60 =C2=B1  0%     -42.0%     495.25 =C2=B1  5%      -1.0%     846.0=
0 =C2=B1  0%  slabinfo.kmalloc-256.num_slabs
     47683 =C2=B1  0%     -37.7%      29715 =C2=B1  4%      +2.9%      4906=
7 =C2=B1  0%  slabinfo.kmalloc-512.active_objs
    924.00 =C2=B1  0%     -39.0%     563.75 =C2=B1  4%      -0.9%     916.0=
0 =C2=B1  0%  slabinfo.kmalloc-512.active_slabs
     59169 =C2=B1  0%     -39.0%      36109 =C2=B1  4%      -0.8%      5866=
7 =C2=B1  0%  slabinfo.kmalloc-512.num_objs
    924.00 =C2=B1  0%     -39.0%     563.75 =C2=B1  4%      -0.9%     916.0=
0 =C2=B1  0%  slabinfo.kmalloc-512.num_slabs
      8287 =C2=B1  2%      +2.8%       8521 =C2=B1  4%     +12.6%       933=
5 =C2=B1  2%  slabinfo.kmalloc-96.active_objs
      8351 =C2=B1  3%      +2.6%       8570 =C2=B1  4%     +12.7%       940=
9 =C2=B1  2%  slabinfo.kmalloc-96.num_objs
     12776 =C2=B1  1%     -22.2%       9944 =C2=B1  2%      -6.8%      1190=
6 =C2=B1  1%  slabinfo.pid.active_objs
     12776 =C2=B1  1%     -22.2%       9944 =C2=B1  2%      -6.8%      1190=
6 =C2=B1  1%  slabinfo.pid.num_objs
      5708 =C2=B1  2%     -10.0%       5139 =C2=B1  3%      -6.2%       535=
5 =C2=B1  0%  slabinfo.sock_inode_cache.active_objs
      5902 =C2=B1  2%      -9.8%       5326 =C2=B1  3%      -5.9%       555=
2 =C2=B1  0%  slabinfo.sock_inode_cache.num_objs
    447.40 =C2=B1  6%     -35.7%     287.50 =C2=B1  6%      -7.7%     413.0=
0 =C2=B1  4%  slabinfo.taskstats.active_objs
    447.40 =C2=B1  6%     -35.7%     287.50 =C2=B1  6%      -7.7%     413.0=
0 =C2=B1  4%  slabinfo.taskstats.num_objs
    304731 =C2=B1 27%     -45.5%     166107 =C2=B1 76%     -98.3%       503=
1 =C2=B1 23%  sched_debug.cfs_rq:/.MIN_vruntime.avg
  12211047 =C2=B1 35%     -38.5%    7509311 =C2=B1 78%     -99.0%     11885=
6 =C2=B1 40%  sched_debug.cfs_rq:/.MIN_vruntime.max
   1877477 =C2=B1 30%     -41.5%    1098508 =C2=B1 77%     -98.8%      2197=
6 =C2=B1 14%  sched_debug.cfs_rq:/.MIN_vruntime.stddev
     18.91 =C2=B1  7%      -3.9%      18.16 =C2=B1  8%  +3.8e+06%     71550=
2 =C2=B1  2%  sched_debug.cfs_rq:/.load.avg
     95.71 =C2=B1 45%      -7.8%      88.20 =C2=B1 74%  +1.1e+06%    106737=
3 =C2=B1  4%  sched_debug.cfs_rq:/.load.max
     19.94 =C2=B1 31%      -9.6%      18.02 =C2=B1 52%  +1.7e+06%     33560=
7 =C2=B1  2%  sched_debug.cfs_rq:/.load.stddev
     21.16 =C2=B1  9%     +12.3%      23.76 =C2=B1  9%   +2890.4%     632.6=
5 =C2=B1  3%  sched_debug.cfs_rq:/.load_avg.avg
    125.40 =C2=B1 49%      +4.4%     130.90 =C2=B1 13%    +643.9%     932.8=
8 =C2=B1  5%  sched_debug.cfs_rq:/.load_avg.max
      8.29 =C2=B1  2%      -3.5%       8.00 =C2=B1  6%   +2852.1%     244.7=
6 =C2=B1  6%  sched_debug.cfs_rq:/.load_avg.min
     20.18 =C2=B1 45%     +13.1%      22.83 =C2=B1 18%    +720.8%     165.6=
5 =C2=B1  3%  sched_debug.cfs_rq:/.load_avg.stddev
    304731 =C2=B1 27%     -45.5%     166107 =C2=B1 76%     -98.3%       503=
1 =C2=B1 23%  sched_debug.cfs_rq:/.max_vruntime.avg
  12211047 =C2=B1 35%     -38.5%    7509311 =C2=B1 78%     -99.0%     11885=
6 =C2=B1 40%  sched_debug.cfs_rq:/.max_vruntime.max
   1877477 =C2=B1 30%     -41.5%    1098508 =C2=B1 77%     -98.8%      2197=
6 =C2=B1 14%  sched_debug.cfs_rq:/.max_vruntime.stddev
  29445770 =C2=B1  0%      -4.3%   28190370 =C2=B1  2%     -99.0%     29950=
2 =C2=B1  0%  sched_debug.cfs_rq:/.min_vruntime.avg
  31331918 =C2=B1  0%      -6.2%   29380072 =C2=B1  2%     -99.0%     32208=
2 =C2=B1  0%  sched_debug.cfs_rq:/.min_vruntime.max
  27785446 =C2=B1  0%      -2.5%   27098935 =C2=B1  2%     -99.0%     28226=
7 =C2=B1  0%  sched_debug.cfs_rq:/.min_vruntime.min
    916182 =C2=B1 13%     -35.6%     590123 =C2=B1 13%     -98.6%      1242=
1 =C2=B1  4%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.26 =C2=B1  6%     -34.5%       0.17 =C2=B1 14%     +34.0%       0.3=
4 =C2=B1  3%  sched_debug.cfs_rq:/.nr_running.stddev
     16.42 =C2=B1  3%      +6.9%      17.56 =C2=B1  3%   +3319.3%     561.5=
7 =C2=B1  4%  sched_debug.cfs_rq:/.runnable_load_avg.avg
     38.22 =C2=B1 28%     +10.9%      42.38 =C2=B1 49%   +2280.8%     909.9=
1 =C2=B1  1%  sched_debug.cfs_rq:/.runnable_load_avg.max
      0.05 =C2=B1133%   +4879.2%       2.72 =C2=B1 46%   +4177.8%       2.3=
3 =C2=B1 32%  sched_debug.cfs_rq:/.runnable_load_avg.min
      7.59 =C2=B1 17%      +4.0%       7.90 =C2=B1 36%   +3375.3%     263.9=
5 =C2=B1  1%  sched_debug.cfs_rq:/.runnable_load_avg.stddev
   -897515 =C2=B1-52%    -132.1%     288533 =C2=B1159%     -97.6%     -2183=
6 =C2=B1 -6%  sched_debug.cfs_rq:/.spread0.avg
    989517 =C2=B1 31%     +49.2%    1476487 =C2=B1 23%     -99.9%     748.1=
2 =C2=B1129%  sched_debug.cfs_rq:/.spread0.max
  -2558887 =C2=B1-23%     -68.7%    -801084 =C2=B1-66%     -98.5%     -3907=
2 =C2=B1 -7%  sched_debug.cfs_rq:/.spread0.min
    916967 =C2=B1 13%     -35.7%     589208 =C2=B1 13%     -98.6%      1242=
4 =C2=B1  4%  sched_debug.cfs_rq:/.spread0.stddev
    744.20 =C2=B1  0%     +10.9%     825.23 =C2=B1  3%     -38.6%     457.2=
7 =C2=B1  3%  sched_debug.cfs_rq:/.util_avg.min
     58.07 =C2=B1  9%     -28.4%      41.55 =C2=B1 19%    +119.1%     127.1=
9 =C2=B1  2%  sched_debug.cfs_rq:/.util_avg.stddev
    157158 =C2=B1  3%     -35.8%     100942 =C2=B1  9%    +135.5%     37011=
7 =C2=B1  7%  sched_debug.cpu.avg_idle.avg
    600573 =C2=B1  2%     -42.9%     342823 =C2=B1 21%     +29.4%     77739=
7 =C2=B1  2%  sched_debug.cpu.avg_idle.max
    133080 =C2=B1  6%     -48.5%      68563 =C2=B1 21%     +87.9%     25005=
8 =C2=B1  0%  sched_debug.cpu.avg_idle.stddev
     11.80 =C2=B1 22%     +96.1%      23.13 =C2=B1 24%     -60.4%       4.6=
7 =C2=B1  2%  sched_debug.cpu.clock.stddev
     11.80 =C2=B1 22%     +96.1%      23.13 =C2=B1 24%     -60.4%       4.6=
7 =C2=B1  2%  sched_debug.cpu.clock_task.stddev
     16.49 =C2=B1  3%     +10.3%      18.19 =C2=B1  7%   +2983.8%     508.4=
1 =C2=B1  6%  sched_debug.cpu.cpu_load[0].avg
     38.35 =C2=B1 28%     +69.4%      64.95 =C2=B1 61%   +2275.1%     910.7=
6 =C2=B1  1%  sched_debug.cpu.cpu_load[0].max
      7.67 =C2=B1 18%     +53.8%      11.79 =C2=B1 53%   +3832.5%     301.4=
3 =C2=B1  5%  sched_debug.cpu.cpu_load[0].stddev
     16.39 =C2=B1  2%      +9.9%      18.01 =C2=B1  5%   +3723.3%     626.6=
4 =C2=B1  3%  sched_debug.cpu.cpu_load[1].avg
     37.87 =C2=B1 27%     +51.3%      57.30 =C2=B1 47%   +2294.6%     906.9=
1 =C2=B1  1%  sched_debug.cpu.cpu_load[1].max
      3.91 =C2=B1 17%     +48.0%       5.78 =C2=B1 15%   +4683.7%     187.0=
0 =C2=B1  5%  sched_debug.cpu.cpu_load[1].min
      6.84 =C2=B1 20%     +45.5%       9.95 =C2=B1 41%   +2455.5%     174.7=
5 =C2=B1  2%  sched_debug.cpu.cpu_load[1].stddev
     16.57 =C2=B1  2%      +8.4%      17.96 =C2=B1  4%   +3666.4%     624.2=
0 =C2=B1  3%  sched_debug.cpu.cpu_load[2].avg
     37.71 =C2=B1 24%     +38.8%      52.35 =C2=B1 36%   +2301.1%     905.4=
2 =C2=B1  1%  sched_debug.cpu.cpu_load[2].max
      6.02 =C2=B1  6%     +18.8%       7.15 =C2=B1  8%   +3322.5%     205.9=
7 =C2=B1  2%  sched_debug.cpu.cpu_load[2].min
      6.50 =C2=B1 19%     +36.7%       8.89 =C2=B1 31%   +2513.9%     169.8=
5 =C2=B1  1%  sched_debug.cpu.cpu_load[2].stddev
     16.99 =C2=B1  1%      +6.4%      18.07 =C2=B1  3%   +3565.7%     622.7=
7 =C2=B1  3%  sched_debug.cpu.cpu_load[3].avg
     36.87 =C2=B1 19%     +33.9%      49.39 =C2=B1 28%   +2345.3%     901.6=
4 =C2=B1  1%  sched_debug.cpu.cpu_load[3].max
      7.33 =C2=B1  3%      +5.3%       7.72 =C2=B1  8%   +2833.8%     214.9=
7 =C2=B1  4%  sched_debug.cpu.cpu_load[3].min
      6.11 =C2=B1 15%     +34.9%       8.24 =C2=B1 23%   +2636.3%     167.1=
3 =C2=B1  1%  sched_debug.cpu.cpu_load[3].stddev
     17.32 =C2=B1  1%      +4.8%      18.15 =C2=B1  2%   +3491.8%     622.2=
6 =C2=B1  3%  sched_debug.cpu.cpu_load[4].avg
     35.56 =C2=B1 12%     +32.8%      47.23 =C2=B1 22%   +2414.9%     894.3=
9 =C2=B1  1%  sched_debug.cpu.cpu_load[4].max
      8.00 =C2=B1  5%      -2.0%       7.84 =C2=B1  8%   +2683.7%     222.7=
0 =C2=B1  6%  sched_debug.cpu.cpu_load[4].min
      5.80 =C2=B1  9%     +35.4%       7.85 =C2=B1 18%   +2705.5%     162.7=
7 =C2=B1  0%  sched_debug.cpu.cpu_load[4].stddev
     16851 =C2=B1  1%     -16.8%      14014 =C2=B1  3%     -15.6%      1421=
8 =C2=B1  3%  sched_debug.cpu.curr->pid.avg
     19325 =C2=B1  0%     -19.1%      15644 =C2=B1  2%      -6.4%      1808=
3 =C2=B1  0%  sched_debug.cpu.curr->pid.max
      5114 =C2=B1  8%     -48.9%       2611 =C2=B1 16%     +20.8%       617=
9 =C2=B1  4%  sched_debug.cpu.curr->pid.stddev
     18.95 =C2=B1  7%      -2.9%      18.40 =C2=B1 11%  +3.7e+06%     70860=
9 =C2=B1  3%  sched_debug.cpu.load.avg
     95.67 =C2=B1 46%      -7.6%      88.42 =C2=B1 74%  +1.1e+06%    106705=
3 =C2=B1  4%  sched_debug.cpu.load.max
     19.89 =C2=B1 31%      -5.7%      18.76 =C2=B1 54%  +1.7e+06%     33842=
3 =C2=B1  3%  sched_debug.cpu.load.stddev
    500000 =C2=B1  0%      +0.0%     500000 =C2=B1  0%     +14.4%     57214=
7 =C2=B1  4%  sched_debug.cpu.max_idle_balance_cost.max
      0.00 =C2=B1  4%     +10.8%       0.00 =C2=B1  9%     +35.0%       0.0=
0 =C2=B1 12%  sched_debug.cpu.next_balance.stddev
      1417 =C2=B1  3%      -6.8%       1322 =C2=B1 11%     +31.2%       186=
0 =C2=B1  8%  sched_debug.cpu.nr_load_updates.stddev
      9.75 =C2=B1  5%     -13.6%       8.43 =C2=B1  4%      -7.0%       9.0=
7 =C2=B1 11%  sched_debug.cpu.nr_running.avg
     29.22 =C2=B1  2%     -16.8%      24.30 =C2=B1  7%     +25.6%      36.7=
0 =C2=B1  5%  sched_debug.cpu.nr_running.max
      7.47 =C2=B1  4%     -20.3%       5.95 =C2=B1  5%     +39.8%      10.4=
4 =C2=B1  7%  sched_debug.cpu.nr_running.stddev
  10261512 =C2=B1  0%    +132.6%   23873264 =C2=B1  3%     -10.3%    920000=
3 =C2=B1  2%  sched_debug.cpu.nr_switches.avg
  11634045 =C2=B1  1%    +126.0%   26295756 =C2=B1  2%      -3.0%   1128131=
7 =C2=B1  1%  sched_debug.cpu.nr_switches.max
   8958320 =C2=B1  1%    +141.1%   21601624 =C2=B1  4%     -15.9%    753837=
2 =C2=B1  3%  sched_debug.cpu.nr_switches.min
    780364 =C2=B1  7%     +61.6%    1261065 =C2=B1  4%     +65.0%    128739=
8 =C2=B1  2%  sched_debug.cpu.nr_switches.stddev
      8.65 =C2=B1 13%     +23.4%      10.68 =C2=B1 13%    +170.0%      23.3=
6 =C2=B1 13%  sched_debug.cpu.nr_uninterruptible.max
    -13.62 =C2=B1-17%     +45.2%     -19.77 =C2=B1-23%    +112.3%     -28.9=
1 =C2=B1-27%  sched_debug.cpu.nr_uninterruptible.min
      4.45 =C2=B1  8%     +29.8%       5.78 =C2=B1 10%    +106.3%       9.1=
8 =C2=B1 24%  sched_debug.cpu.nr_uninterruptible.stddev

Best Regards,
Huang, Ying

--===============7858834135974947972==--

