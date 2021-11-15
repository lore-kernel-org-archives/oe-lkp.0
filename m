Content-Type: multipart/mixed; boundary="===============8662452794968638592=="
MIME-Version: 1.0
From: Yin Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/asm] 0507503671: will-it-scale.per_process_ops -4.9% regression
Date: Mon, 15 Nov 2021 17:53:32 +0800
Message-ID: <0cfae054-3150-35d4-f95f-68b5ec1897e7@intel.com>
In-Reply-To: <20211115073738.GA23967@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8662452794968638592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 11/15/2021 3:37 PM, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a -4.9% regression of will-it-scale.per_process_ops due t=
o commit:
> =

> =

> commit: 0507503671f9b1c867e889cbec0f43abf904f23c ("x86/asm: Avoid adding =
register pressure for the init case in static_cpu_has()")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: will-it-scale
> on test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2=
.00GHz with 256G memory
> with following parameters:
> =

> 	nr_task: 50%
> 	mode: process
> 	test: mmap2
> 	cpufreq_governor: performance
> 	ucode: 0xd000280
> =

> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale
> =

> =

> please be noted, since we don't have clue why this commit could cause
> performance drop, so we did further tests on other platforms or with
> different parameters, and got below results.
Add Kees in case he is interest to this behavior.

Observation on this regression:
   After the patch, the better code is generated. De-assembled the function=
 intel_pmu_store_lbr with
   vmlinux built from commit f87bc8dc7a7c and 0507503671f9 and got:
  =

   With commit f87bc8dc7a7c (parent commit):
     https://zerobin.net/?22efb1114b097030#ryD/8LpasEIg8WrS6O/M+sHYJp7c/LoA=
XPfeB7BUqu4=3D

   With commit 0507503671f9:
     https://zerobin.net/?e57652572b3ec83c#CvobUggve54SIHmlZ6jkzs3s4k8iQN4o=
phFoOs7LHMI=3D

   The assembly code with commit 0507503671f9 is smaller than with parent c=
ommit. The
   register r12 in parent commit is strange IIUC.


   BTW, the reason that we picked up function intel_pmu_store_lbr is:
     It's the first function in System.map which has different size w/o the=
 patch


Suppose the performance data with commit 0507503671f9 should be better. But=
 the
test result showed it had improvement only on one test box. On other three =
test box,
it introduced regressions. Looks like strange.


Regards
Yin, Fengwei

> =

> except the 1% improvement from the first test on a 4 sockets Haswell-EX,
> others all show similar regression:
> =

> +------------------+-----------------------------------------------------=
-----------------------------+
> | testcase: change | will-it-scale: will-it-scale.per_process_ops +1.0% i=
mprovement                   |
> | test machine     | 144 threads 4 sockets Intel(R) Xeon(R) CPU E7-8890 v=
3 @ 2.50GHz with 512G memory |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                               |
> |                  | mode=3Dprocess                                      =
                               |
> |                  | nr_task=3D50%                                       =
                               |
> |                  | test=3Dmmap2                                        =
                               |
> |                  | ucode=3D0x16                                        =
                               |
> +------------------+-----------------------------------------------------=
-----------------------------+
> | testcase: change | will-it-scale: will-it-scale.per_process_ops -3.7% r=
egression                    |
> | test machine     | 144 threads 4 sockets Intel(R) Xeon(R) Gold 5318H CP=
U @ 2.50GHz with 128G memory |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                               |
> |                  | mode=3Dprocess                                      =
                               |
> |                  | nr_task=3D50%                                       =
                               |
> |                  | test=3Dmmap2                                        =
                               |
> |                  | ucode=3D0x700001e                                   =
                               |
> +------------------+-----------------------------------------------------=
-----------------------------+
> | testcase: change | will-it-scale: will-it-scale.per_process_ops -5.1% r=
egression                    |
> | test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU=
 @ 2.00GHz with 256G memory  |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                               |
> |                  | mode=3Dprocess                                      =
                               |
> |                  | nr_task=3D16                                        =
                               |
> |                  | test=3Dmmap2                                        =
                               |
> |                  | ucode=3D0xd000280                                   =
                               |
> +------------------+-----------------------------------------------------=
-----------------------------+
> | testcase: change | will-it-scale: will-it-scale.per_process_ops -5.9% r=
egression                    |
> | test machine     | 88 threads 2 sockets Intel(R) Xeon(R) Gold 6238M CPU=
 @ 2.10GHz with 128G memory  |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                               |
> |                  | mode=3Dprocess                                      =
                               |
> |                  | nr_task=3D16                                        =
                               |
> |                  | test=3Dmmap1                                        =
                               |
> |                  | ucode=3D0x5003006                                   =
                               |
> +------------------+-----------------------------------------------------=
-----------------------------+
> | testcase: change | will-it-scale: will-it-scale.per_process_ops -3.5% r=
egression                    |
> | test machine     | 88 threads 2 sockets Intel(R) Xeon(R) Gold 6238M CPU=
 @ 2.10GHz with 128G memory  |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                               |
> |                  | mode=3Dprocess                                      =
                               |
> |                  | nr_task=3D50%                                       =
                               |
> |                  | test=3Dmmap2                                        =
                               |
> |                  | ucode=3D0x5003006                                   =
                               |
> +------------------+-----------------------------------------------------=
-----------------------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         sudo bin/lkp install job.yaml           # job file is attached in=
 this email
>         bin/lkp split-job --compatible job.yaml # generate the yaml file =
for lkp run
>         sudo bin/lkp run generated-yaml-file
> =

>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/tes=
tcase/ucode:
>   gcc-9/performance/x86_64-rhel-8.3/process/50%/debian-10.4-x86_64-202006=
03.cgz/lkp-icl-2sp2/mmap2/will-it-scale/0xd000280
> =

> commit: =

>   f87bc8dc7a ("x86/asm: Add _ASM_RIP() macro for x86-64 (%rip) suffix")
>   0507503671 ("x86/asm: Avoid adding register pressure for the init case =
in static_cpu_has()")
> =

> f87bc8dc7a7c438c 0507503671f9b1c867e889cbec0 =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>   41898923            -4.9%   39829159        will-it-scale.64.processes
>     654670            -4.9%     622330        will-it-scale.per_process_o=
ps
>   41898923            -4.9%   39829159        will-it-scale.workload
>       6918 =C2=B1 54%    +116.5%      14975 =C2=B1 14%  softirqs.CPU20.SC=
HED
>     240.00 =C2=B1 18%     +57.8%     378.67 =C2=B1 20%  slabinfo.biovec-6=
4.active_objs
>     240.00 =C2=B1 18%     +57.8%     378.67 =C2=B1 20%  slabinfo.biovec-6=
4.num_objs
>       0.01 =C2=B1 28%     -36.1%       0.01 =C2=B1 14%  perf-sched.sch_de=
lay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[un=
known]
>       6114 =C2=B1 24%     -46.1%       3296 =C2=B1 46%  perf-sched.wait_a=
nd_delay.max.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constp=
rop.0.do_sys_poll
>       6114 =C2=B1 24%     -46.1%       3296 =C2=B1 46%  perf-sched.wait_t=
ime.max.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0=
.do_sys_poll
>       1409 =C2=B1 30%     -30.7%     977.00 =C2=B1 23%  interrupts.CPU1.C=
AL:Function_call_interrupts
>       3001 =C2=B1 58%     -70.3%     892.50 =C2=B1 69%  interrupts.CPU1.R=
ES:Rescheduling_interrupts
>     669.83 =C2=B1172%    +696.9%       5338 =C2=B1102%  interrupts.CPU108=
.NMI:Non-maskable_interrupts
--===============8662452794968638592==--

