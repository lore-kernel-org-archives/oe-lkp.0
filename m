Content-Type: multipart/mixed; boundary="===============8617070368023441388=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/fair] d519329f72: unixbench.score -9.9% regression
Date: Wed, 04 Apr 2018 14:14:06 +0800
Message-ID: <20180404061406.GI3845@yexl-desktop>
In-Reply-To: <20180403114322.GF13951@e110439-lin>
List-Id: <oe-lkp.lists.linux.dev>

--===============8617070368023441388==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 04/03, Patrick Bellasi wrote:
>Hi Xiaolong,
>
>On 02-Apr 11:20, kernel test robot wrote:
>> =

>> Greeting,
>> =

>> FYI, we noticed a -9.9% regression of unixbench.score due to commit:
>
>thanks for the report, I'll try to reproduce it locally to better
>understand what's going on.

Thanks for your attention and feedback.

>
>Meanwhile, I'm a little puzzled about some of the following
>numbers... likely looking at the code it should be more clear.
>But, maybe someone already knows the response.
>
>> commit: d519329f72a6f36bc4f2b85452640cfe583b4f81 ("sched/fair: Update ut=
il_est only on util_avg updates")
>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
>To give a bit of context, this patch is the last of a small series
>introducing util_est:
>   https://lkml.org/lkml/2018/3/9/245
>where we actually enable it by turning of by default the corresponding SCH=
ED_FEAT.
>Thus, all the effect of util_est are visible just after this very last pat=
ch.
>
>I'm not surprised that, if there are issues related to util_est, they
>manifest at this stage.
>
>> in testcase: unixbench
>> on test machine: 8 threads Intel(R) Core(TM) i7 CPU 870 @ 2.93GHz with 6=
G memory
>> with following parameters:
>> =

>> 	runtime: 300s
>> 	nr_task: 100%
>> 	test: execl
>> =

>> test-description: UnixBench is the original BYTE UNIX benchmark suite ai=
ms to test performance of Unix-like system.
>> test-url: https://github.com/kdlucas/byte-unixbench
>
>AFAIU, this benchmark is composed of 12 different test cases:
>   https://github.com/intel/lkp-tests/blob/master/jobs/unixbench.yaml
>and it's reporting a regression for "only" 1 of those tests (execl).
>
>Is that correct?

Yes, this regression is only regarding to the execl test in unixbench.

>
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
>
>Will try to give it a run in the next days.
>
>> =

>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> compiler/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
>>   gcc-7/x86_64-rhel-7.2/100%/debian-x86_64-2016-08-31.cgz/300s/nhm-white=
/execl/unixbench
>> =

>> commit: =

>>   a07630b8b2 ("sched/cpufreq/schedutil: Use util_est for OPP selection")
>>   d519329f72 ("sched/fair: Update util_est only on util_avg updates")
>> =

>> a07630b8b2c16f82 d519329f72a6f36bc4f2b85452 =

>> ---------------- -------------------------- =

>>          %stddev     %change         %stddev
>>              \          |                \  =

>>       4626            -9.9%       4167        unixbench.score
>
>Is this overall score a composition of the following scores?
>

Actually, the unixbench.score the main performance indicator of unixbench, =
it is
obtained directly from the raw output of unixbench as below:

------------------------------------------------------------------------
Benchmark Run: Sat Mar 31 2018 08:51:09 - 08:56:48
8 CPUs in system; running 8 parallel copies of tests

Execl Throughput                              17946.9 lps   (30.0 s, 7 samp=
les)

System Benchmarks Partial Index              BASELINE       RESULT    INDEX
Execl Throughput                                 43.0      17946.9   4173.7
                                                                   =3D=3D=
=3D=3D=3D=3D=3D=3D
System Benchmarks Index Score (Partial Only)                         4173.7


>In general, it would be nice to see in the following metrics which one
>is considered "the lower the better" or "the higher the better".

It's a good suggestion, we'll work to make this metrics change more readabl=
e.

>
>>    3495362 =C2=B1  4%     +70.4%    5957769 =C2=B1  2%  unixbench.time.i=
nvoluntary_context_switches
>
>The above seems to indicate an increase in contention which generated
>scheduler enforced context switches. But, AFAIU, the test under
>analysis generates just one single task which keep execl itself.
>I can't see how util_est can this generated an increase in context
>switches? Will investigate better.
>
>>  2.866e+08           -11.6%  2.534e+08        unixbench.time.minor_page_=
faults
>>     666.75            -9.7%     602.25        unixbench.time.percent_of_=
cpu_this_job_got
>>       1830            -9.7%       1653        unixbench.time.system_time
>>     395.13            -5.2%     374.58        unixbench.time.user_time
>
>When I read "system_time" and "user_time" I'm expecting it to be a
>"the lower the better" metric.
>Thus, if that's the case, by just looking at these last two metrics:
>doesn't that means that the test is actually completing faster with
>util_est enabled?

It seems so.

>
>>    8611715           -58.9%    3537314 =C2=B1  3%  unixbench.time.volunt=
ary_context_switches
>>    6639375            -9.1%    6033775        unixbench.workload
>
>What the above metric represents?

unixbench.time.voluntary_context_switches is obtained through time (GNU tim=
e 1.7), we use
it to record the time metrics while benchmark running, the whole output is =
like:

        Command being timed: "/lkp/lkp/src/tests/unixbench"
        User time (seconds): 377.38
        System time (seconds): 1664.25
        Percent of CPU this job got: 601%
        Elapsed (wall clock) time (h:mm:ss or m:ss): 5:39.39
        Average shared text size (kbytes): 0
        Average unshared data size (kbytes): 0
        Average stack size (kbytes): 0
        Average total size (kbytes): 0
        Maximum resident set size (kbytes): 8956
        Average resident set size (kbytes): 0
        Major (requiring I/O) page faults: 0
        Minor (reclaiming a frame) page faults: 255131129
        Voluntary context switches: 3520290
        Involuntary context switches: 6137488
        Swaps: 0
        File system inputs: 0
        File system outputs: 0
        Socket messages sent: 0
        Socket messages received: 0
        Signals delivered: 0
        Page size (bytes): 4096
        Exit status: 0

unixbench.workload is defined as the total operations in unixbench for
all processes/threads.

>
>>      26025         +3849.3%    1027825        interrupts.CAL:Function_ca=
ll_interrupts
>
>What this metric represents?

This metric is obtain through /proc/interrupts, we would take snapshot of t=
his
file before and after the test, then sum up the Function call interrupts for
all cpus during the test.

Thanks,
Xiaolong
>
>This is a big variation which I cannot easily see as related to
>util_est overheads... unless these are interrupts related to tasks
>migrations, which potentially can affect LB and WKP code paths.
>
>>       4856 =C2=B1 14%     -27.4%       3523 =C2=B1 11%  slabinfo.filp.ac=
tive_objs
>>    3534356            -8.8%    3223918        softirqs.RCU
>>      77929           -11.2%      69172        vmstat.system.cs
>>      19489 =C2=B1  2%      +7.5%      20956        vmstat.system.in
>>       9.05 =C2=B1  9%     +11.0%      10.05 =C2=B1  8%  boot-time.dhcp
>>     131.63 =C2=B1  4%      +8.6%     142.89 =C2=B1  7%  boot-time.idle
>>       9.07 =C2=B1  9%     +11.0%      10.07 =C2=B1  8%  boot-time.kernel=
_boot
>>      76288 =C2=B1  3%     -12.8%      66560 =C2=B1  3%  meminfo.DirectMa=
p4k
>>      16606           -13.1%      14433        meminfo.Inactive
>>      16515           -13.2%      14341        meminfo.Inactive(anon)
>>      11.87 =C2=B1  5%      +7.8       19.63 =C2=B1  4%  mpstat.cpu.idle%
>>       0.07 =C2=B1 35%      -0.0        0.04 =C2=B1 17%  mpstat.cpu.soft%
>>      68.91            -6.1       62.82        mpstat.cpu.sys%
>
>The following:
>
>>   29291570          +325.4%  1.246e+08        cpuidle.C1.time
>>    8629105           -36.1%    5513780        cpuidle.C1.usage
>>     668733 =C2=B1 12%  +11215.3%   75668902 =C2=B1  2%  cpuidle.C1E.time
>>       9763 =C2=B1 12%  +16572.7%    1627882 =C2=B1  2%  cpuidle.C1E.usage
>>  1.834e+08 =C2=B1  9%     +23.1%  2.258e+08 =C2=B1 11%  cpuidle.C3.time
>>     222674 =C2=B1  8%    +133.4%     519690 =C2=B1  6%  cpuidle.C3.usage
>
>are other really big variations which metrics represents, AFAIU, the
>following IDLE states:
>- C1  : Core doesn't work, clocks stopped
>- C1E : Core doesn't work, clocks stopped and voltage lowered
>- C3  : L1 and L2 copied to L3, all core clocks stopped
>
>Thus, it seems to me that, with the patches in, we are more likely to
>sleep longer. Which suggests a more aggressive race-to-idle policy:
>running at higher frequencies to complete faster and sleep
>longer and deeper.
>
>This would kind-of match with the idea of completing faster, but I'm
>not completely sure... however, if that should be the case, again I
>would say that's a benefit, not a regression.
>
>
>>       4129           -13.3%       3581        proc-vmstat.nr_inactive_an=
on
>>       4129           -13.3%       3581        proc-vmstat.nr_zone_inacti=
ve_anon
>>  2.333e+08           -12.2%  2.049e+08        proc-vmstat.numa_hit
>>  2.333e+08           -12.2%  2.049e+08        proc-vmstat.numa_local
>>       6625           -10.9%       5905        proc-vmstat.pgactivate
>>  2.392e+08           -12.1%  2.102e+08        proc-vmstat.pgalloc_normal
>>  2.936e+08           -12.6%  2.566e+08        proc-vmstat.pgfault
>>  2.392e+08           -12.1%  2.102e+08        proc-vmstat.pgfree
>
>All the following metrics:
>
>>       2850           -15.3%       2413        turbostat.Avg_MHz
>>    8629013           -36.1%    5513569        turbostat.C1
>>       1.09            +3.5        4.61        turbostat.C1%
>>       9751 =C2=B1 12%  +16593.0%    1627864 =C2=B1  2%  turbostat.C1E
>>       0.03 =C2=B1 19%      +2.8        2.80        turbostat.C1E%
>>     222574 =C2=B1  8%    +133.4%     519558 =C2=B1  6%  turbostat.C3
>>       6.84 =C2=B1  8%      +1.5        8.34 =C2=B1 10%  turbostat.C3%
>>       2.82 =C2=B1  7%    +250.3%       9.87 =C2=B1  2%  turbostat.CPU%c1
>>    6552773 =C2=B1  3%     +23.8%    8111699 =C2=B1  2%  turbostat.IRQ
>>       2.02 =C2=B1 11%     +28.3%       2.58 =C2=B1  9%  turbostat.Pkg%pc3
>
>maybe they can help to understand better what's going on with respect
>to the race-to-idle theory...
>
>
>>  7.635e+11           -12.5%  6.682e+11        perf-stat.branch-instructi=
ons
>>  3.881e+10           -12.9%  3.381e+10        perf-stat.branch-misses
>>       2.09            -0.3        1.77 =C2=B1  4%  perf-stat.cache-miss-=
rate%
>>  1.551e+09           -15.1%  1.316e+09 =C2=B1  4%  perf-stat.cache-misses
>>   26177920           -10.5%   23428188        perf-stat.context-switches
>>       1.99            -2.8%       1.93        perf-stat.cpi
>>  7.553e+12           -14.7%  6.446e+12        perf-stat.cpu-cycles
>
>This:
>
>>     522523 =C2=B1  2%    +628.3%    3805664        perf-stat.cpu-migrati=
ons
>
>is another good point. With util_est we are affecting LB and WKP
>paths... but, give the specific execl test, not entirely sure how we
>can affect migrations using util_est.
>
>Have to check better these two points:
>- do we reset PELT after an execl?
>- do we trigger a possible task migration after and execl
>
>
>>  2.425e+10 =C2=B1  4%     -14.3%  2.078e+10        perf-stat.dTLB-load-m=
isses
>>  1.487e+12           -11.3%  1.319e+12        perf-stat.dTLB-loads
>>  1.156e+10 =C2=B1  3%      -7.7%  1.066e+10        perf-stat.dTLB-store-=
misses
>>  6.657e+11           -11.1%  5.915e+11        perf-stat.dTLB-stores
>>       0.15            +0.0        0.15        perf-stat.iTLB-load-miss-r=
ate%
>>  5.807e+09           -11.0%  5.166e+09        perf-stat.iTLB-load-misses
>>  3.799e+12           -12.1%   3.34e+12        perf-stat.iTLB-loads
>>  3.803e+12           -12.2%  3.338e+12        perf-stat.instructions
>>     654.99            -1.4%     646.07        perf-stat.instructions-per=
-iTLB-miss
>>       0.50            +2.8%       0.52        perf-stat.ipc
>>  2.754e+08           -11.6%  2.435e+08        perf-stat.minor-faults
>>  1.198e+08 =C2=B1  7%     +73.1%  2.074e+08 =C2=B1  4%  perf-stat.node-s=
tores
>>  2.754e+08           -11.6%  2.435e+08        perf-stat.page-faults
>>     572928            -3.4%     553258        perf-stat.path-length
>> =

>> =

>>                                                                         =
        =

>>                                   unixbench.score                       =
        =

>>                                                                         =
        =

>>   4800 +-+--------------------------------------------------------------=
----+   =

>>        |+                                      +     +                  =
    |   =

>>   4700 +-+ +                +                  :+ +. :+ + +             =
    |   =

>>        |  + +   +    +.     :  +              +  +  +  + + + .+++++    .=
+  +|   =

>>   4600 +-+   +++ :+++  + ++: : :+  +++ ++.++++              +      ++++ =
 ++ |   =

>>        |         +      +  + ++  ++   +                                 =
    |   =

>>   4500 +-+                                                              =
    |   =

>>        |                                                                =
    |   =

>>   4400 +-+                                                              =
    |   =

>>        |                                                                =
    |   =

>>   4300 +-+                                                              =
    |   =

>>        O                                                                =
    |   =

>>   4200 +-O        O O    OOOO OO OOO OOOO  OOOO O O                     =
    |   =

>>        |O OO OOOOO O O OO    O      O     O    O O  OO                  =
    |   =

>>   4100 +-+--------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                                   unixbench.workload                    =
        =

>>                                                                         =
        =

>>     9e+06 +-+-----------------------------------------------------------=
----+   =

>>           |                   :                                         =
    |   =

>>   8.5e+06 +-+                 :                                         =
    |   =

>>           |                   :                                         =
    |   =

>>     8e+06 +-+                 :                                         =
    |   =

>>           |                   ::                                        =
    |   =

>>   7.5e+06 +-+                : : +                                      =
    |   =

>>           |                 +: : :       +                              =
    |   =

>>     7e+06 +-+      +    +   :: : ::  + + :  +   +     +    +            =
+   |   =

>>           |:+ +   + :   :: : : :: :  :+ : : ::+ :+ .+ :+ ++ ++ + ++     =
::++|   =

>>   6.5e+06 +-O+ +++  ++++ +++ + ++ +.+   + ++ + +  +  +  +     + +  +.+++=
 +  |   =

>>           O                O    O            O O O    O                 =
    |   =

>>     6e+06 +O+OOO O OOOOOOOO OOOO OO OOOOOOOOO O O O OO                  =
    |   =

>>           |     O                                                       =
    |   =

>>   5.5e+06 +-+-----------------------------------------------------------=
----+   =

>>                                                                         =
        =

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
>> for informational purposes only. Any difference in system hardware or so=
ftware
>> design or configuration may affect actual performance.
>> =

>> =

>> Thanks,
>> Xiaolong
>
>[...]
>
>> #
>> # CPU Frequency scaling
>> #
>> CONFIG_CPU_FREQ=3Dy
>> CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
>> CONFIG_CPU_FREQ_GOV_COMMON=3Dy
>> # CONFIG_CPU_FREQ_STAT is not set
>> # CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
>> # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
>> # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
>
>The governor in use is not schedutil... thus util_est could effect the
>test just because of signals tracking overheads, of because of the way
>we affect tasks placement in WK and LB paths... which can be
>correlated to the impact on task migrations and preemption...
>
>> CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=3Dy
>> # CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
>> # CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
>> CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
>> CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
>> CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
>> CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
>> CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
>> # CONFIG_CPU_FREQ_GOV_SCHEDUTIL is not set
>> =

>> #
>> # CPU frequency scaling drivers
>> #
>> CONFIG_X86_INTEL_PSTATE=3Dy
>> CONFIG_X86_PCC_CPUFREQ=3Dm
>> CONFIG_X86_ACPI_CPUFREQ=3Dm
>> CONFIG_X86_ACPI_CPUFREQ_CPB=3Dy
>> CONFIG_X86_POWERNOW_K8=3Dm
>> CONFIG_X86_AMD_FREQ_SENSITIVITY=3Dm
>> # CONFIG_X86_SPEEDSTEP_CENTRINO is not set
>> CONFIG_X86_P4_CLOCKMOD=3Dm
>> =

>
>-- =

>#include <best/regards.h>
>
>Patrick Bellasi

--===============8617070368023441388==--

