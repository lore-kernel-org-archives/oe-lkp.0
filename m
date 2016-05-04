Content-Type: multipart/mixed; boundary="===============6933989541880876927=="
MIME-Version: 1.0
From: Rafael J. Wysocki <rafael@kernel.org>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 41e0d37f7a: divide error: 0000 [#1] SMP
Date: Wed, 04 May 2016 13:56:35 +0200
Message-ID: <CAJZ5v0hR-N+kUtv5nqWJ7oTE3dtnw5kQux9Y2tgXRk11fZg4ZQ@mail.gmail.com>
In-Reply-To: <CANRm+CyYLDuWpK_jcvUsJoRM_NJ_MR495a2ELvdaz8LqXbq+sA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6933989541880876927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 4, 2016 at 1:51 PM, Wanpeng Li <kernellwp@gmail.com> wrote:
> 2016-05-04 19:44 GMT+08:00 Rafael J. Wysocki <rafael@kernel.org>:
>> On Wed, May 4, 2016 at 2:58 AM, Wanpeng Li <kernellwp@gmail.com> wrote:
>>> 2016-05-03 20:15 GMT+08:00 Rafael J. Wysocki <rafael@kernel.org>:
>>>> On Tue, May 3, 2016 at 10:32 AM, Peter Zijlstra <peterz@infradead.or=
g> wrote:
>>>>> On Tue, May 03, 2016 at 09:10:51AM +0800, kernel test robot wrote:
>>>>>> FYI, we noticed the following commit:
>>>>>>
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/co=
re
>>>>>> commit 41e0d37f7ac81297c07ba311e4ad39465b8c8295 ("sched/fair: Do not=
 call cpufreq hook unless util changed")
>>>>>
>>
>> [cut]
>>
>>>>>
>>>>> That's intel_pstate.c:get_avg_frequency(), which assumes mperf !=3D 0=
. It
>>>>> being 0 seems to suggest intel_pstate_sample() hasn't been called yet=
 or
>>>>> so.
>>>>
>>>> Well, what's the tree based on?
>>>>
>>>> The mainline does this:
>>>>
>>>> bool sample_taken =3D intel_pstate_sample(cpu, time);
>>>>
>>>> if (sample_taken && !hwp_active)
>>>>         intel_pstate_adjust_busy_pstate(cpu);
>>>>
>>>> and (the mainline version of) intel_pstate_sample() returns false when
>>>> it is called for the first time after setting the update_util hook.
>>>
>>> The callsites in scheduler will set time to rq_clock(rq) when trigger
>>> sample, so when time 0 will be used even if it is set just before
>>> setting the update_util hook?
>>
>> I'm not sure what you mean.
>>
>> time=3D0 is special as it will cause intel_pstate_sample() to return
>> false on the next invocation.
>
> Sample is driven by cpufreq_update_util() which uses rq_clock(rq) as
> time parameter, so there is no opportunity to pass time 0 to
> intel_pstate_sample().

Right.

So I should have said that had time=3D0 been passed to
intel_pstate_sample(), it would have caused it to return false on the
next invocation. :-)

The way it works is that sample.time is 0 initially, so
intel_pstate_sample() returns false first time it is called and the
second invocation gets all of the deltas as needed.

--===============6933989541880876927==--

