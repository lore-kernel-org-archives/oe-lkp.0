Content-Type: multipart/mixed; boundary="===============9023181250460741516=="
MIME-Version: 1.0
From: Rafael J. Wysocki <rafael@kernel.org>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 41e0d37f7a: divide error: 0000 [#1] SMP
Date: Wed, 04 May 2016 13:44:18 +0200
Message-ID: <CAJZ5v0ickLcEZwWwjb89+97a_P+QWbM_+q5CUehRTbsMJbaGzw@mail.gmail.com>
In-Reply-To: <CANRm+Czc1mYz8BZGgZs4geSvY6=TqxH537mqZNeonutcmBnZvw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9023181250460741516==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 4, 2016 at 2:58 AM, Wanpeng Li <kernellwp@gmail.com> wrote:
> 2016-05-03 20:15 GMT+08:00 Rafael J. Wysocki <rafael@kernel.org>:
>> On Tue, May 3, 2016 at 10:32 AM, Peter Zijlstra <peterz@infradead.org>=
 wrote:
>>> On Tue, May 03, 2016 at 09:10:51AM +0800, kernel test robot wrote:
>>>> FYI, we noticed the following commit:
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
>>>> commit 41e0d37f7ac81297c07ba311e4ad39465b8c8295 ("sched/fair: Do not c=
all cpufreq hook unless util changed")
>>>

[cut]

>>>
>>> That's intel_pstate.c:get_avg_frequency(), which assumes mperf !=3D 0. =
It
>>> being 0 seems to suggest intel_pstate_sample() hasn't been called yet or
>>> so.
>>
>> Well, what's the tree based on?
>>
>> The mainline does this:
>>
>> bool sample_taken =3D intel_pstate_sample(cpu, time);
>>
>> if (sample_taken && !hwp_active)
>>         intel_pstate_adjust_busy_pstate(cpu);
>>
>> and (the mainline version of) intel_pstate_sample() returns false when
>> it is called for the first time after setting the update_util hook.
>
> The callsites in scheduler will set time to rq_clock(rq) when trigger
> sample, so when time 0 will be used even if it is set just before
> setting the update_util hook?

I'm not sure what you mean.

time=3D0 is special as it will cause intel_pstate_sample() to return
false on the next invocation.

--===============9023181250460741516==--

