Content-Type: multipart/mixed; boundary="===============0434850339719753685=="
MIME-Version: 1.0
From: H. Peter Anvin <hpa@zytor.com>
To: lkp@lists.01.org
Subject: Re: [x86/asm] 0507503671: will-it-scale.per_process_ops -4.9% regression
Date: Mon, 15 Nov 2021 11:20:07 -0800
Message-ID: <7ec02a06-fc3b-0858-cb13-04d25f325795@zytor.com>
In-Reply-To: <0cfae054-3150-35d4-f95f-68b5ec1897e7@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0434850339719753685==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[Cc: Peter Z.]

This seems totally bizarre... that is an *enormous* change, and if I'm =

reading it right it seems like this somehow related to the performance =

monitoring framework itself?

The lower-performance init code is all pushed into the pre-boot path, =

unless for some strange reason not all code gets patched e.g. at module =

loading time.

A quick peek around made me notice a few minor possibilities, but none =

of them look particularly sane:

1. We don't use "asm inline" in asm_volatile_goto, and we probably
    should; otherwise gcc might get the idea this is a more heavyweight
    operation than it actually is.
2. There is a workaround in asm_volatile_goto for a bug which apparently
    was fixed in gcc 4.8.x that might mislead gcc's code generator into
    generating worse code.

Did you see any functions for which the code got *bigger*?


Not directly related, but it would be really helpful to get an r-value =

with your statistics.  It would greatly help avoiding chasing ghosts.




On 11/15/21 01:53, Yin Fengwei wrote:
> Hi,
> =

> On 11/15/2021 3:37 PM, kernel test robot wrote:
>>
>>
>> Greeting,
>>
>> FYI, we noticed a -4.9% regression of will-it-scale.per_process_ops due =
to commit:
>>
>>
>> commit: 0507503671f9b1c867e889cbec0f43abf904f23c ("x86/asm: Avoid adding=
 register pressure for the init case in static_cpu_has()")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>> in testcase: will-it-scale
>> on test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ =
2.00GHz with 256G memory
>> with following parameters:
>>
>> 	nr_task: 50%
>> 	mode: process
>> 	test: mmap2
>> 	cpufreq_governor: performance
>> 	ucode: 0xd000280
>>
>> test-description: Will It Scale takes a testcase and runs it from 1 thro=
ugh to n parallel copies to see if the testcase will scale. It builds both =
a process and threads based test in order to see any differences between th=
e two.
>> test-url: https://github.com/antonblanchard/will-it-scale
>>
>>
>> please be noted, since we don't have clue why this commit could cause
>> performance drop, so we did further tests on other platforms or with
>> different parameters, and got below results.
> Add Kees in case he is interest to this behavior.
> =

> Observation on this regression:
>     After the patch, the better code is generated. De-assembled the funct=
ion intel_pmu_store_lbr with
>     vmlinux built from commit f87bc8dc7a7c and 0507503671f9 and got:
>    =

>     With commit f87bc8dc7a7c (parent commit):
>       https://zerobin.net/?22efb1114b097030#ryD/8LpasEIg8WrS6O/M+sHYJp7c/=
LoAXPfeB7BUqu4=3D
> =

>     With commit 0507503671f9:
>       https://zerobin.net/?e57652572b3ec83c#CvobUggve54SIHmlZ6jkzs3s4k8iQ=
N4ophFoOs7LHMI=3D
> =

>     The assembly code with commit 0507503671f9 is smaller than with paren=
t commit. The
>     register r12 in parent commit is strange IIUC.
> =

> =

>     BTW, the reason that we picked up function intel_pmu_store_lbr is:
>       It's the first function in System.map which has different size w/o =
the patch
> =

> =

> Suppose the performance data with commit 0507503671f9 should be better. B=
ut the
> test result showed it had improvement only on one test box. On other thre=
e test box,
> it introduced regressions. Looks like strange.
> =

> =

> Regards
> Yin, Fengwei
> =

>>
>> except the 1% improvement from the first test on a 4 sockets Haswell-EX,
>> others all show similar regression:
>>
>> +------------------+----------------------------------------------------=
------------------------------+
>> | testcase: change | will-it-scale: will-it-scale.per_process_ops +1.0% =
improvement                   |
>> | test machine     | 144 threads 4 sockets Intel(R) Xeon(R) CPU E7-8890 =
v3 @ 2.50GHz with 512G memory |
>> | test parameters  | cpufreq_governor=3Dperformance                     =
                                |
>> |                  | mode=3Dprocess                                     =
                                |
>> |                  | nr_task=3D50%                                      =
                                |
>> |                  | test=3Dmmap2                                       =
                                |
>> |                  | ucode=3D0x16                                       =
                                |
>> +------------------+----------------------------------------------------=
------------------------------+
>> | testcase: change | will-it-scale: will-it-scale.per_process_ops -3.7% =
regression                    |
>> | test machine     | 144 threads 4 sockets Intel(R) Xeon(R) Gold 5318H C=
PU @ 2.50GHz with 128G memory |
>> | test parameters  | cpufreq_governor=3Dperformance                     =
                                |
>> |                  | mode=3Dprocess                                     =
                                |
>> |                  | nr_task=3D50%                                      =
                                |
>> |                  | test=3Dmmap2                                       =
                                |
>> |                  | ucode=3D0x700001e                                  =
                                |
>> +------------------+----------------------------------------------------=
------------------------------+
>> | testcase: change | will-it-scale: will-it-scale.per_process_ops -5.1% =
regression                    |
>> | test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CP=
U @ 2.00GHz with 256G memory  |
>> | test parameters  | cpufreq_governor=3Dperformance                     =
                                |
>> |                  | mode=3Dprocess                                     =
                                |
>> |                  | nr_task=3D16                                       =
                                |
>> |                  | test=3Dmmap2                                       =
                                |
>> |                  | ucode=3D0xd000280                                  =
                                |
>> +------------------+----------------------------------------------------=
------------------------------+
>> | testcase: change | will-it-scale: will-it-scale.per_process_ops -5.9% =
regression                    |
>> | test machine     | 88 threads 2 sockets Intel(R) Xeon(R) Gold 6238M CP=
U @ 2.10GHz with 128G memory  |
>> | test parameters  | cpufreq_governor=3Dperformance                     =
                                |
>> |                  | mode=3Dprocess                                     =
                                |
>> |                  | nr_task=3D16                                       =
                                |
>> |                  | test=3Dmmap1                                       =
                                |
>> |                  | ucode=3D0x5003006                                  =
                                |
>> +------------------+----------------------------------------------------=
------------------------------+
>> | testcase: change | will-it-scale: will-it-scale.per_process_ops -3.5% =
regression                    |
>> | test machine     | 88 threads 2 sockets Intel(R) Xeon(R) Gold 6238M CP=
U @ 2.10GHz with 128G memory  |
>> | test parameters  | cpufreq_governor=3Dperformance                     =
                                |
>> |                  | mode=3Dprocess                                     =
                                |
>> |                  | nr_task=3D50%                                      =
                                |
>> |                  | test=3Dmmap2                                       =
                                |
>> |                  | ucode=3D0x5003006                                  =
                                |
>> +------------------+----------------------------------------------------=
------------------------------+
>>
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <oliver.sang@intel.com>
>>
>>
>> Details are as below:
>> ------------------------------------------------------------------------=
-------------------------->
>>
>>
>> To reproduce:
>>
>>          git clone https://github.com/intel/lkp-tests.git
>>          cd lkp-tests
>>          sudo bin/lkp install job.yaml           # job file is attached =
in this email
>>          bin/lkp split-job --compatible job.yaml # generate the yaml fil=
e for lkp run
>>          sudo bin/lkp run generated-yaml-file
>>
>>          # if come across any failure that blocks the test,
>>          # please remove ~/.lkp and /lkp dir to run from a clean state.
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/te=
stcase/ucode:
>>    gcc-9/performance/x86_64-rhel-8.3/process/50%/debian-10.4-x86_64-2020=
0603.cgz/lkp-icl-2sp2/mmap2/will-it-scale/0xd000280
>>
>> commit:
>>    f87bc8dc7a ("x86/asm: Add _ASM_RIP() macro for x86-64 (%rip) suffix")
>>    0507503671 ("x86/asm: Avoid adding register pressure for the init cas=
e in static_cpu_has()")
>>
>> f87bc8dc7a7c438c 0507503671f9b1c867e889cbec0
>> ---------------- ---------------------------
>>           %stddev     %change         %stddev
>>               \          |                \
>>    41898923            -4.9%   39829159        will-it-scale.64.processes
>>      654670            -4.9%     622330        will-it-scale.per_process=
_ops
>>    41898923            -4.9%   39829159        will-it-scale.workload
>>        6918 =C2=B1 54%    +116.5%      14975 =C2=B1 14%  softirqs.CPU20.=
SCHED
>>      240.00 =C2=B1 18%     +57.8%     378.67 =C2=B1 20%  slabinfo.biovec=
-64.active_objs
>>      240.00 =C2=B1 18%     +57.8%     378.67 =C2=B1 20%  slabinfo.biovec=
-64.num_objs
>>        0.01 =C2=B1 28%     -36.1%       0.01 =C2=B1 14%  perf-sched.sch_=
delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[=
unknown]
>>        6114 =C2=B1 24%     -46.1%       3296 =C2=B1 46%  perf-sched.wait=
_and_delay.max.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.cons=
tprop.0.do_sys_poll
>>        6114 =C2=B1 24%     -46.1%       3296 =C2=B1 46%  perf-sched.wait=
_time.max.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop=
.0.do_sys_poll
>>        1409 =C2=B1 30%     -30.7%     977.00 =C2=B1 23%  interrupts.CPU1=
.CAL:Function_call_interrupts
>>        3001 =C2=B1 58%     -70.3%     892.50 =C2=B1 69%  interrupts.CPU1=
.RES:Rescheduling_interrupts
>>      669.83 =C2=B1172%    +696.9%       5338 =C2=B1102%  interrupts.CPU1=
08.NMI:Non-maskable_interrupts
--===============0434850339719753685==--

