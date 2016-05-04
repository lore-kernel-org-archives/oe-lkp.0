Content-Type: multipart/mixed; boundary="===============6723666385170059917=="
MIME-Version: 1.0
From: Rafael J. Wysocki <rafael@kernel.org>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 41e0d37f7a: divide error: 0000 [#1] SMP
Date: Wed, 04 May 2016 13:41:25 +0200
Message-ID: <CAJZ5v0jX9L=xSJoTyMD3FVMKrigKFzL8L=BzaYgALiSOjxVLmQ@mail.gmail.com>
In-Reply-To: <CANRm+CxWSLEuNakrmVogfDtx08H8w9OKd70z5n1MkuRto7jHuw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6723666385170059917==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 4, 2016 at 2:53 AM, Wanpeng Li <kernellwp@gmail.com> wrote:
> 2016-05-03 21:33 GMT+08:00 Rafael J. Wysocki <rafael@kernel.org>:
>> On Tue, May 3, 2016 at 11:25 AM, Wanpeng Li <kernellwp@gmail.com> wrot=
e:
>>> 2016-05-03 17:19 GMT+08:00 Wanpeng Li <kernellwp@gmail.com>:
>>>> 2016-05-03 16:32 GMT+08:00 Peter Zijlstra <peterz@infradead.org>:
>>>>> On Tue, May 03, 2016 at 09:10:51AM +0800, kernel test robot wrote:

[cut]

>>>> ----snip----
>>>>
>>>> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_ps=
tate.c
>>>> index 8b5a415..57b3843 100644
>>>> --- a/drivers/cpufreq/intel_pstate.c
>>>> +++ b/drivers/cpufreq/intel_pstate.c
>>>> @@ -1241,6 +1241,7 @@ static int intel_pstate_init_cpu(unsigned int cp=
unum)
>>>>         intel_pstate_get_cpu_pstates(cpu);
>>>>
>>>>         intel_pstate_busy_pid_reset(cpu);
>>>> +       intel_pstate_sample(cpu);
>>>
>>> intel_pstate_sample(cpu, 0);
>>>
>>>>
>>>>         cpu->update_util.func =3D intel_pstate_update_util;
>>
>> That would avoid the divide by 0, but the value returned by
>> intel_pstate_get() would still be bogus.
>
> If your bogus means that some data is stale and could you explain more?

get_avg_frequency() expects sample.aperf to be a delta between two
different values of the APERF register obtained at two different
instants of time, and analogously for sample.mperf, because that's
when the formula used by it is guaranteed to be valid.  This means
that it generally is not sufficient to read those registers just once
to get a meaningful result, they need to be read at least twice for
that (with some time between the reads to let the counters grow
sufficiently).

With your modification sample.aperf and sample.mperf would simply
contain the values of APERF and MPERF, respectively, at the the
intel_pstate_sample(cpu, 0) invocation time, so using them in the
computation would not be guaranteed to lead to a meaningful result.

--===============6723666385170059917==--

