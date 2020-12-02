Content-Type: multipart/mixed; boundary="===============3269125203283372722=="
MIME-Version: 1.0
From: Li, Aubrey <aubrey.li@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 8d86968ac3: netperf.Throughput_tps -29.5% regression
Date: Wed, 02 Dec 2020 22:29:59 +0800
Message-ID: <b45171de-cb74-bf35-91bf-967dbd5567d1@linux.intel.com>
In-Reply-To: <20201126121351.GJ3371@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============3269125203283372722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Mel,

On 2020/11/26 20:13, Mel Gorman wrote:
> On Thu, Nov 26, 2020 at 02:57:07PM +0800, Li, Aubrey wrote:
>> Hi Robot,
>>
>> On 2020/11/25 17:09, kernel test robot wrote:
>>> Greeting,
>>>
>>> FYI, we noticed a -29.5% regression of netperf.Throughput_tps due to co=
mmit:
>>>
>>>
>>> commit: 8d86968ac36ea5bff487f70b5ffc252a87d44c51 ("[RFC PATCH v4] sched=
/fair: select idle cpu from idle cpumask for task wakeup")
>>> url: https://github.com/0day-ci/linux/commits/Aubrey-Li/sched-fair-sele=
ct-idle-cpu-from-idle-cpumask-for-task-wakeup/20201118-115145
>>> base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git 0=
9162bc32c880a791c6c0668ce0745cf7958f576
>>
>> I tried to replicate this on my side on a 192 threads(with SMT) machine =
as well and didn't see the regression.
>>
>> nr_threads		v5.9.8		+patch
>> 96(50%)			1 (+/- 2.499%)	1.007672(+/- 3.0872%)
>>
>> I also tested another 100% case and see similar improvement as what I sa=
w on uperf benchmark
>>
>> nr_threads		v5.9.8		+patch
>> 192(100%)		1 (+/- 45.32%)	1.864917(+/- 23.29%)
>>
>> My base is v5.9.8 BTW.
>>
>>> 	ip: ipv4
>>> 	runtime: 300s
>>> 	nr_threads: 50%
>>> 	cluster: cs-localhost
>>> 	test: UDP_RR
>>> 	cpufreq_governor: performance
>>> 	ucode: 0x5003003
>>>
> =

> Note that I suspect that regressions with this will be tricky to reproduce
> because it'll depend on the timing of when the idle mask gets updated. Wi=
th
> this configuration there are 50% "threads" which likely gets translates
> into 1 client/server per thread or 100% of CPUs active but as it's a
> ping-pong workload, the pairs are rapidly idling for very short periods.

I tried to replicate this regression but no solid fruit found. I tried 30 t=
imes
300s 50%.netperf running, all the data are better than the default data. Th=
e only
interesting thing I found is an option CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_32=
B=3Dy,
but it performs different on different machines. In case anything I missed,
do you have any suggestions to replicate this regression?

> =

> If the idle mask is not getting cleared then select_idle_cpu() is
> probably returning immediately. select_idle_core() is almost certainly
> failing so that just leaves select_idle_smt() to find a potentially idle
> CPU. That's a limited search space so tasks may be getting stacked and
> missing CPUs that are idling for short periods.

Vincent suggested we decouple idle cpumask from short idle(stop tick) and
set it every time the CPU enters idle, I'll make this change in V6.

> =

> On the flip side, I expect cases like hackbench to benefit because it
> can saturate a machine to such a degree that select_idle_cpu() is a waste
> of time.

Yes, I believe that's also why I saw uperf/netperf improvement at high
load levels.

> =

> That said, I haven't followed the different versions closely. I know v5
> got a lot of feedback so will take a closer look at v6. Fundamentally
> though I expect that using the idle mask will be a mixed bag. At low
> utilisation or over-saturation, it'll be a benefit. At the point where
> the machine is almost fully busy, some workloads will benefit (lightly
> communicating workloads that occasionally migrate) and others will not
> (ping-pong workloads looking for CPUs that are idle for very brief
> periods).

Do you have any interested workload [matrix] I can do the measurement?

> =

> It's tricky enough that it might benefit from a sched_feat() check that
> is default true so it gets tested. For regressions that show up, it'll
> be easy enough to ask for the feature to be disabled to see if it fixes
> it. Over time, that might give an idea of exactly what sort of workloads
> benefit and what suffers.

Okay, I'll add a sched_feat() for this feature.

> =

> Note that the cost of select_idle_cpu() can also be reduced by enabling
> SIS_AVG_CPU so it would be interesting to know if the idle mask is superi=
or
> or inferior to SIS_AVG_CPU for workloads that show regressions.
> =


Thanks,
-Aubrey
--===============3269125203283372722==--

