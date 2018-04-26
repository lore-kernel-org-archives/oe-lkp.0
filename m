Content-Type: multipart/mixed; boundary="===============0971947641197483898=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [MD] 0ffbb1adf8: aim7.jobs-per-min -10.6% regression
Date: Thu, 26 Apr 2018 08:45:40 +0800
Message-ID: <20180426004540.GA5563@yexl-desktop>
In-Reply-To: <643034975.22334927.1524624377311.JavaMail.zimbra@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0971947641197483898==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Xiao Ni

Sorry for the late response.

On 04/24, Xiao Ni wrote:
>Hi all
>
>It's the first time I received such report. So I took some time reading
>the manual of lkp and aim7. And I reserved one server with fedora and
>did a test with the steps in this email. It failed like this:
>
>2018-04-25 02:43:19 echo "/fs/md0" > config
>2018-04-25 02:43:19 =

>	(
>		echo storageqe-07.lab.bos.redhat.com
>		echo sync_disk_rw
>
>		echo 1
>		echo 600
>		echo 2
>		echo 600
>		echo 1
>	) | ./multitask -t
>
>AIM Multiuser Benchmark - Suite VII v1.1, January 22, 1996
>Copyright (c) 1996 - 2001 Caldera International, Inc.
>All Rights Reserved.
>
>Machine's name                                              : Machine's co=
nfiguration                                     : Number of iterations to r=
un [1 to 10]                       : =

>Information for iteration #1
>Starting number of operation loads [1 to 10000]             : 1) Run to cr=
ossover
>2) Run to specific operation load           Enter [1 or 2]: Maximum number=
 of operation loads to simulate [600 to 10000]: Operation load increment [1=
 to 100]                         : =

>Using disk directory </fs/md0>
>HZ is <100>
>AIM Multiuser Benchmark - Suite VII Run Beginning
>
>Tasks    jobs/min  jti  jobs/min/task      real       cpu
>  600/root/lkp-tests/bin/run-local:142:in `system': Interrupt
>	from /root/lkp-tests/bin/run-local:142:in `<main>'
>

Seems there are flaws in our reproduce script, we'll look into it.

>So now I can't understand these information from this report. =

>What does "-10.6% regression of aim7.jobs-per-min" mean? And
>what's the usage of aim7.jobs-per-min? Could anyone help to
>give some suggestions? What should I do to resolve such problem?
>

Here "-10.6% regression of aim7.jobs-per-min" means the value of aim7.jobs-=
per-min
in test for commit 0ffbb1adf8 is 10.6% less compared to its parent commit v=
4.16
(0day bot captured your email patch and applied it on top of v4.16).

aim7.jobs-per-min was obtained through the raw output of aim7 test, such as=
 below:

AIM Multiuser Benchmark - Suite VII v1.1, January 22, 1996
Copyright (c) 1996 - 2001 Caldera International, Inc.
All Rights Reserved.

Machine's name                                              : Machine's con=
figuration                                     : Number of iterations to ru=
n [1 to 10]                       : =

Information for iteration #1
Starting number of operation loads [1 to 10000]             : 1) Run to cro=
ssover
2) Run to specific operation load           Enter [1 or 2]: Maximum number =
of operation loads to simulate [600 to 10000]: Operation load increment [1 =
to 100]                         : =

Using disk directory </fs/md0>
HZ is <100>
AIM Multiuser Benchmark - Suite VII Run Beginning

Tasks    jobs/min  jti  jobs/min/task      real       cpu
  600     1466.27   99         2.4438   2455.21  92829.76   Fri Apr 20 10:2=
8:19 2018

AIM Multiuser Benchmark - Suite VII
   Testing over


aim7.jobs-per-min is the main kpi for aim7 tests, other numbers listed in c=
omparison
are less important, they are collected through multiple monitors (vmstat, m=
pstat) running in the background.
We hope they can help you evaluate your patch in a complete way.

Thanks,
Xiaolong


>Best Regards
>Xiao
>
>----- Original Message -----
>> From: "kernel test robot" <xiaolong.ye@intel.com>
>> To: "Xiao Ni" <xni@redhat.com>
>> Cc: linux-raid(a)vger.kernel.org, shli(a)kernel.org, "ming lei" <ming.le=
i@redhat.com>, ncroxon(a)redhat.com,
>> neilb(a)suse.com, lkp(a)01.org
>> Sent: Monday, April 23, 2018 8:41:43 AM
>> Subject: [lkp-robot] [MD]  0ffbb1adf8:  aim7.jobs-per-min -10.6% regress=
ion
>> =

>> =

>> Greeting,
>> =

>> FYI, we noticed a -10.6% regression of aim7.jobs-per-min due to commit:
>> =

>> =

>> commit: 0ffbb1adf8b448568b44fe44c5fcdcf485040365 ("MD: fix lock contenti=
on
>> for flush bios")
>> url:
>> https://github.com/0day-ci/linux/commits/Xiao-Ni/MD-fix-lock-contention-=
for-flush-bios/20180411-040300
>> =

>> =

>> in testcase: aim7
>> on test machine: 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00GHz wi=
th
>> 384G memory
>> with following parameters:
>> =

>> 	disk: 4BRD_12G
>> 	md: RAID1
>> 	fs: xfs
>> 	test: sync_disk_rw
>> 	load: 600
>> 	cpufreq_governor: performance
>> =

>> test-description: AIM7 is a traditional UNIX system level benchmark suite
>> which is used to test and measure the performance of multiuser system.
>> test-url: https://sourceforge.net/projects/aimbench/files/aim-suite7/
>> =

>> =

>> =

>> Details are as below:
>> ------------------------------------------------------------------------=
-------------------------->
>> =

>> =

>> To reproduce:
>> =

>>         git clone https://github.com/intel/lkp-tests.git
>>         cd lkp-tests
>>         bin/lkp install job.yaml  # job file is attached in this email
>>         bin/lkp run     job.yaml
>> =

>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> compiler/cpufreq_governor/disk/fs/kconfig/load/md/rootfs/tbox_group/test=
/testcase:
>>   gcc-7/performance/4BRD_12G/xfs/x86_64-rhel-7.2/600/RAID1/debian-x86_64=
-2016-08-31.cgz/lkp-ivb-ep01/sync_disk_rw/aim7
>> =

>> commit:
>>   v4.16
>>   0ffbb1adf8 ("MD: fix lock contention for flush bios")
>> =

>>            v4.16 0ffbb1adf8b448568b44fe44c5
>> ---------------- --------------------------
>>          %stddev     %change         %stddev
>>              \          |                \
>>       1632 =C2=B1  2%     -10.6%       1458        aim7.jobs-per-min
>>       2207 =C2=B1  2%     +11.8%       2468        aim7.time.elapsed_time
>>       2207 =C2=B1  2%     +11.8%       2468        aim7.time.elapsed_tim=
e.max
>>   51186515           -51.5%   24800655
>>   aim7.time.involuntary_context_switches
>>     146259 =C2=B1  8%     +31.7%     192669 =C2=B1  2%  aim7.time.minor_=
page_faults
>>      80457 =C2=B1  2%     +15.9%      93267        aim7.time.system_time
>>      50.25 =C2=B1  2%     +11.8%      56.17        aim7.time.user_time
>>  7.257e+08 =C2=B1  2%      +7.3%  7.787e+08
>>  aim7.time.voluntary_context_switches
>>     520491 =C2=B1 61%     +53.8%     800775
>>     interrupts.CAL:Function_call_interrupts
>>       2463 =C2=B1 18%     +31.7%       3246 =C2=B1 15%  numa-vmstat.node=
0.nr_mapped
>>       4.06 =C2=B1  2%      -0.5        3.51        mpstat.cpu.idle%
>>       0.24 =C2=B1  6%      -0.1        0.15        mpstat.cpu.iowait%
>>    8829533           +16.2%   10256984        softirqs.SCHED
>>   33149109 =C2=B1  2%     +12.3%   37229216        softirqs.TIMER
>>    4724795 =C2=B1 33%     +38.5%    6544104        cpuidle.C1E.usage
>>  7.151e+08 =C2=B1 40%     -37.8%  4.449e+08        cpuidle.C6.time
>>    3881055 =C2=B1122%     -85.7%     553608 =C2=B1  2%  cpuidle.C6.usage
>>      61107 =C2=B1  2%     -10.7%      54566        vmstat.io.bo
>>       2.60 =C2=B1 18%     -51.9%       1.25 =C2=B1 34%  vmstat.procs.b
>>     305.10           -16.1%     256.00        vmstat.procs.r
>>     404271           -11.3%     358644        vmstat.system.cs
>>     167773           -16.5%     140121        vmstat.system.in
>>     115358 =C2=B1  9%     +39.9%     161430 =C2=B1  3%  proc-vmstat.numa=
_hint_faults
>>      62520 =C2=B1 10%     +47.6%      92267 =C2=B1  4%
>>      proc-vmstat.numa_hint_faults_local
>>      20893 =C2=B1 10%     +29.0%      26948 =C2=B1  2%  proc-vmstat.numa=
_pages_migrated
>>     116983 =C2=B1  9%     +39.5%     163161 =C2=B1  3%  proc-vmstat.numa=
_pte_updates
>>    5504935 =C2=B1  3%     +12.3%    6179561        proc-vmstat.pgfault
>>      20893 =C2=B1 10%     +29.0%      26948 =C2=B1  2%  proc-vmstat.pgmi=
grate_success
>>       2.68 =C2=B1  3%      -0.2        2.44        turbostat.C1%
>>    4724733 =C2=B1 33%     +38.5%    6544028        turbostat.C1E
>>    3879529 =C2=B1122%     -85.8%     552056 =C2=B1  2%  turbostat.C6
>>       0.82 =C2=B1 43%      -0.4        0.45        turbostat.C6%
>>       3.62 =C2=B1  2%     -15.1%       3.08        turbostat.CPU%c1
>>     176728 =C2=B1  2%     +13.3%     200310        turbostat.SMI
>>  9.893e+12 =C2=B1 65%     +57.6%  1.559e+13        perf-stat.branch-inst=
ructions
>>  3.022e+10 =C2=B1 65%     +46.6%   4.43e+10        perf-stat.branch-miss=
es
>>      11.31 =C2=B1 65%      +5.5       16.78        perf-stat.cache-miss-=
rate%
>>  2.821e+10 =C2=B1 65%     +50.4%  4.243e+10        perf-stat.cache-misses
>>  1.796e+14 =C2=B1 65%     +58.4%  2.845e+14        perf-stat.cpu-cycles
>>   26084177 =C2=B1 65%    +176.3%   72073346        perf-stat.cpu-migrati=
ons
>>  1.015e+13 =C2=B1 65%     +57.3%  1.597e+13        perf-stat.dTLB-loads
>>  1.125e+12 =C2=B1 65%     +45.6%  1.638e+12        perf-stat.dTLB-stores
>>  4.048e+13 =C2=B1 65%     +57.3%  6.367e+13        perf-stat.instructions
>>       4910 =C2=B1 65%     +57.5%       7734
>>       perf-stat.instructions-per-iTLB-miss
>>    3847673 =C2=B1 65%     +57.4%    6057388        perf-stat.minor-faults
>>  1.403e+10 =C2=B1 65%     +51.8%   2.13e+10        perf-stat.node-load-m=
isses
>>  1.557e+10 =C2=B1 65%     +51.0%  2.351e+10        perf-stat.node-loads
>>      27.41 =C2=B1 65%     +12.1       39.52        perf-stat.node-store-=
miss-rate%
>>  7.828e+09 =C2=B1 65%     +53.2%  1.199e+10        perf-stat.node-store-=
misses
>>  1.216e+10 =C2=B1 65%     +50.9%  1.835e+10        perf-stat.node-stores
>>    3847675 =C2=B1 65%     +57.4%    6057392        perf-stat.page-faults
>>    1041337 =C2=B1  2%     +12.0%    1166774
>>    sched_debug.cfs_rq:/.exec_clock.avg
>>    1045329 =C2=B1  2%     +11.8%    1168250
>>    sched_debug.cfs_rq:/.exec_clock.max
>>    1037380 =C2=B1  2%     +12.3%    1165349
>>    sched_debug.cfs_rq:/.exec_clock.min
>>       3670 =C2=B1 16%     -70.1%       1098 =C2=B1 50%
>>       sched_debug.cfs_rq:/.exec_clock.stddev
>>     234.08 =C2=B1  3%     -22.4%     181.73
>>     sched_debug.cfs_rq:/.load_avg.avg
>>      33.65 =C2=B1  2%     -59.3%      13.70 =C2=B1  3%
>>      sched_debug.cfs_rq:/.load_avg.min
>>   36305683 =C2=B1  2%     +12.4%   40814603
>>   sched_debug.cfs_rq:/.min_vruntime.avg
>>   37771587 =C2=B1  2%     +11.1%   41960294
>>   sched_debug.cfs_rq:/.min_vruntime.max
>>   34884765 =C2=B1  2%     +13.6%   39635549
>>   sched_debug.cfs_rq:/.min_vruntime.min
>>    1277146 =C2=B1  9%     -21.8%     998594 =C2=B1  4%
>>    sched_debug.cfs_rq:/.min_vruntime.stddev
>>       1.99 =C2=B1  5%     -16.8%       1.65 =C2=B1  3%
>>       sched_debug.cfs_rq:/.nr_running.max
>>      19.18 =C2=B1  5%     +20.3%      23.08
>>      sched_debug.cfs_rq:/.nr_spread_over.avg
>>       8.47 =C2=B1 18%     +23.8%      10.49 =C2=B1 12%
>>       sched_debug.cfs_rq:/.nr_spread_over.min
>>      22.06 =C2=B1  7%     -18.2%      18.05 =C2=B1  6%
>>      sched_debug.cfs_rq:/.runnable_load_avg.avg
>>       0.08 =C2=B1 38%     -50.5%       0.04 =C2=B1 20%  sched_debug.cfs_=
rq:/.spread.avg
>>    1277131 =C2=B1  9%     -21.8%     998584 =C2=B1  4%
>>    sched_debug.cfs_rq:/.spread0.stddev
>>     177058 =C2=B1  7%     -23.5%     135429        sched_debug.cpu.avg_i=
dle.max
>>      33859 =C2=B1  6%     -24.6%      25519        sched_debug.cpu.avg_i=
dle.stddev
>>    1119705 =C2=B1  2%     +11.0%    1242378        sched_debug.cpu.clock=
.avg
>>    1119726 =C2=B1  2%     +11.0%    1242399        sched_debug.cpu.clock=
.max
>>    1119680 =C2=B1  2%     +11.0%    1242353        sched_debug.cpu.clock=
.min
>>    1119705 =C2=B1  2%     +11.0%    1242378        sched_debug.cpu.clock=
_task.avg
>>    1119726 =C2=B1  2%     +11.0%    1242399        sched_debug.cpu.clock=
_task.max
>>    1119680 =C2=B1  2%     +11.0%    1242353        sched_debug.cpu.clock=
_task.min
>>       3.47 =C2=B1 11%     +28.4%       4.45 =C2=B1  2%  sched_debug.cpu.=
cpu_load[1].min
>>      28.92 =C2=B1  4%      -7.8%      26.66 =C2=B1  3%  sched_debug.cpu.=
cpu_load[2].avg
>>       5.65 =C2=B1  7%     +37.9%       7.80 =C2=B1  8%  sched_debug.cpu.=
cpu_load[2].min
>>      29.97 =C2=B1  3%      -7.9%      27.60 =C2=B1  3%  sched_debug.cpu.=
cpu_load[3].avg
>>       8.22 =C2=B1  4%     +31.9%      10.83 =C2=B1  7%  sched_debug.cpu.=
cpu_load[3].min
>>      10.50 =C2=B1  5%     +24.0%      13.02 =C2=B1  6%  sched_debug.cpu.=
cpu_load[4].min
>>       2596 =C2=B1  4%      -9.2%       2358 =C2=B1  2%  sched_debug.cpu.=
curr->pid.avg
>>       4463 =C2=B1  4%     -13.5%       3862 =C2=B1  3%
>>       sched_debug.cpu.curr->pid.stddev
>>    1139237 =C2=B1  2%     +11.5%    1269690
>>    sched_debug.cpu.nr_load_updates.avg
>>    1146166 =C2=B1  2%     +11.2%    1274264
>>    sched_debug.cpu.nr_load_updates.max
>>    1133061 =C2=B1  2%     +11.4%    1262298
>>    sched_debug.cpu.nr_load_updates.min
>>       3943 =C2=B1  9%     -32.4%       2666 =C2=B1 23%
>>       sched_debug.cpu.nr_load_updates.stddev
>>       8814 =C2=B1  7%     +17.8%      10386 =C2=B1  2%
>>       sched_debug.cpu.nr_uninterruptible.max
>>      -3613           +32.3%      -4782
>>      sched_debug.cpu.nr_uninterruptible.min
>>       2999 =C2=B1  4%     +13.1%       3391
>>       sched_debug.cpu.nr_uninterruptible.stddev
>>      42794 =C2=B1 15%     -76.8%       9921 =C2=B1 90%
>>      sched_debug.cpu.sched_goidle.stddev
>>     652177           +14.4%     745857        sched_debug.cpu.ttwu_local=
.avg
>>     684397           +17.7%     805440 =C2=B1  2%  sched_debug.cpu.ttwu_=
local.max
>>     622628           +12.0%     697353 =C2=B1  2%  sched_debug.cpu.ttwu_=
local.min
>>      16189 =C2=B1 33%    +128.0%      36916 =C2=B1 47%
>>      sched_debug.cpu.ttwu_local.stddev
>>    1119677 =C2=B1  2%     +11.0%    1242351        sched_debug.cpu_clk
>>    1119677 =C2=B1  2%     +11.0%    1242351        sched_debug.ktime
>>    1120113 =C2=B1  2%     +11.0%    1242771        sched_debug.sched_clk
>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                                  aim7.jobs-per-min
>>                                                                         =
        =

>>   1750 +-+--------------------------------------------------------------=
----+
>>        |                                                                =
    |   =

>>   1700 +-+                         +             .+.+                .+.=
+   |
>>   1650 +-+                        + +          .+    :             .+   =
 :  |
>>        |  .+.+.+.    +      .+.+.+   +.       +      :    +.      +     =
 :  |
>>   1600 +-+       +  : + .+.+           +..+. +        +. +  +.+. +      =
  +.|
>>        |          + :  +                    +           +       +       =
    |
>>   1550 +-+         +                                                    =
    |
>>        |                                                                =
    |   =

>>   1500 +-+                                                              =
    |
>>   1450 +-O     O     O               O O      O O                       =
    |
>>        O   O O     O   O     O O O O      O O     O O                   =
    |
>>   1400 +-+       O       O O                                            =
    |
>>        |                                                                =
    |   =

>>   1350 +-+--------------------------------------------------------------=
----+
>>                                                                         =
        =

>>                                                                         =
        =

>> [*] bisect-good sample
>> [O] bisect-bad  sample
>> =

>> =

>> =

>> Disclaimer:
>> Results have been estimated based on internal Intel analysis and are pro=
vided
>> for informational purposes only. Any difference in system hardware or
>> software
>> design or configuration may affect actual performance.
>> =

>> =

>> Thanks,
>> Xiaolong
>>=20

--===============0971947641197483898==--

