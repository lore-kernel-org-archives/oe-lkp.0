Content-Type: multipart/mixed; boundary="===============0259280273200505073=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/numa] f6183ef98b: phoronix-test-suite.aom-av1.0.frames_per_second -25.0% regression
Date: Thu, 05 Mar 2020 19:15:40 +0800
Message-ID: <02df5188-72c6-df47-3b17-8a438143bc8d@intel.com>
In-Reply-To: <20200305101257.GQ3818@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============0259280273200505073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 3/5/2020 6:12 PM, Mel Gorman wrote:
> On Thu, Mar 05, 2020 at 10:58:22AM +0800, Rong Chen wrote:
>> Hi,
>>
>> I tested on branch tip/sched/core, the regression is still there.
>>
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/ucode:
>>    gcc-7/performance/x86_64-rhel-7.6/debian-x86_64-phoronix/lkp-nhm-2ep1=
/aom-av1-1.2.0/phoronix-test-suite/0x1d
>>
>> commit:
>>    6d4d22468dae3d8757af9f8b81b848a76ef4409d ("sched/fair: Reorder enqueu=
e/dequeue_task_fair path")
>>    6499b1b2dd1b8d404a16b9fbbf1af6b9b3c1d83d ("sched/numa: Replace runnab=
le_load_avg by load_avg")
>>    253e2b69ef8fda4d9345ff496b12058faaeeff6b ("sched/fair: fix statistics=
 for find_idlest_group()")
>>
> Are you sure? I ask because tip/sched/core does not have the
> patch "sched/fair: fix statistics for find_idlest_group" in it
> nor is commit 253e2b69ef8fda4d9345ff496b12058faaeeff6b part of the
> tip/sched/core history. You'd need to test the full series in the current
> tip/sched/core with minimally 289de3598481 ("sched/fair: Fix statistics
> for find_idlest_group()") from tip/sched/urgent on top. That's still
> missing two fixes but one is a build issue and the other is a missing
> rcu_read_lock that is unlikely to cause corruption unless there is a
> hotplug event during the test.

Yes, commit 6d4d22468dae3=C2=A0 is not from tip/sched/core, I created it =

based on tip/sched/core.

$ git log --oneline =

6d4d22468dae3d8757af9f8b81b848a76ef4409d~..253e2b69ef8fda4d9345ff496b12058f=
aaeeff6b
253e2b69ef8fd sched/fair: fix statistics for find_idlest_group()
a0f03b617c3b2 sched/numa: Stop an exhastive search if a reasonable swap =

candidate or idle CPU is found
88cca72c9673e sched/numa: Bias swapping tasks based on their preferred node
5fb52dd93a2fe sched/numa: Find an alternative idle CPU if the CPU is =

part of an active NUMA balance
ff7db0bf24db9 sched/numa: Prefer using an idle CPU as a migration target =

instead of comparing tasks
070f5e860ee2b sched/fair: Take into account runnable_avg to classify group
9f68395333ad7 sched/pelt: Add a new runnable average signal
0dacee1bfa70e sched/pelt: Remove unused runnable load average
fb86f5b211924 sched/numa: Use similar logic to the load balancer for =

moving between domains with spare capacity
6499b1b2dd1b8 sched/numa: Replace runnable_load_avg by load_avg
6d4d22468dae3 sched/fair: Reorder enqueue/dequeue_task_fair path

>
> Also, can you tell me more about the hardware? The stats indicate it's NU=
MA
> but it only has 16 threads which seems very low for a modern NUMA machine.
>

root(a)lkp-nhm-2ep1:~# lscpu
Architecture:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_64
CPU op-mode(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32-bit, 64-bit
Byte Order:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Little Endian
CPU(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 16
On-line CPU(s) list:=C2=A0=C2=A0 0-15
Thread(s) per core:=C2=A0=C2=A0=C2=A0 2
Core(s) per socket:=C2=A0=C2=A0=C2=A0 4
Socket(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 2
NUMA node(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2
Vendor ID:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 GenuineIntel
CPU family:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 6
Model:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 26
Model name:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Intel(R) Xeon(R) CPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 X5570=C2=A0 @ 2.93GHz
Stepping:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 5
CPU MHz:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 1655.106
CPU max MHz:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 29=
27.0000
CPU min MHz:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 15=
96.0000
BogoMIPS:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 5852.83
Virtualization:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VT-x
L1d cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 32K
L1i cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 32K
L2 cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 256K
L3 cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 8192K
NUMA node0 CPU(s):=C2=A0=C2=A0=C2=A0=C2=A0 0,2,4,6,8,10,12,14
NUMA node1 CPU(s):=C2=A0=C2=A0=C2=A0=C2=A0 1,3,5,7,9,11,13,15
Flags:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 fpu vme de pse tsc msr pae mce cx8 apic sep mtr=
r =

pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ht tm pbe =

syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl =

xtopology nonstop_tsc cpuid aperfmperf pni dtes64 monitor ds_cpl vmx est =

tm2 ssse3 cx16 xtpr pdcm dca sse4_1 sse4_2 popcnt lahf_lm pti ssbd ibrs =

ibpb stibp tpr_shadow vnmi flexpriority ept vpid dtherm ida flush_l1d

Best Regards,
Rong Chen
--===============0259280273200505073==--

