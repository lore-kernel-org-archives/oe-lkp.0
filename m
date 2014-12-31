Content-Type: multipart/mixed; boundary="===============7571859385668240438=="
MIME-Version: 1.0
From: Preeti U Murthy <preeti@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] tick/powerclamp: Remove tick_nohz_idle abuse
Date: Wed, 31 Dec 2014 10:34:37 +0530
Message-ID: <54A383E5.8020605@linux.vnet.ibm.com>
In-Reply-To: <20141222185708.15bbdd17@jacob-VirtualBox>
List-Id: <oe-lkp.lists.linux.dev>

--===============7571859385668240438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jacob,

On 12/23/2014 08:27 AM, Jacob Pan wrote:
> On Sat, 20 Dec 2014 07:01:12 +0530
> Preeti U Murthy <preeti@linux.vnet.ibm.com> wrote:
> =

>> On 12/20/2014 01:26 AM, Thomas Gleixner wrote:
>>> On Fri, 19 Dec 2014, Jacob Pan wrote:
>>>
>>>> On Thu, 18 Dec 2014 22:12:57 +0100 (CET)
>>>> Thomas Gleixner <tglx@linutronix.de> wrote:
>>>>
>>>>> On Thu, 18 Dec 2014, Jacob Pan wrote:
>>>>>> OK I agree, also as I mentioned earlier, Peter already has a
>>>>>> patch for consolidated idle loop and remove
>>>>>> tick_nohz_idle_enter/exit call from powerclamp driver. I have
>>>>>> been working on a few tweaks to maintain the functionality and
>>>>>> efficiency with the consolidated idle loop. We can apply the
>>>>>> patches on top of yours.
>>>>>
>>>>> No. This is equally wrong as I pointed out before. The 'unified'
>>>>> idle loop is still fake and just pretending to be idle.
>>>>>
>>>> In terms of efficiency, the consolidated idle loop will allow
>>>> turning off sched tick during idle injection period. If we just
>>>> take out the tick_nohz_idle_xxx call, the effectiveness of
>>>> powerclamp is going down significantly. I am not arguing the
>>>> design but from fixing regression perspective or short term
>>>> solution.
>>>
>>> There is no perspective. Period.
>>>
>>> Its violates every rightful assumption of the nohz_IDLE_* code and
>>> just ever worked by chance. There is so much subtle wreckage lurking
>>> there that the only sane solution is to forbid it. End of story.
>>>
>>> Thanks,
>>>
>>> 	tglx
>>>
>> Hi Jacob,
>>
>> Like Thomas pointed out, we can design a sane solution for powerclamp.
>> Idle injection is nothing but throttling of runqueue. If the runqueue
>> is throttled, no fair tasks will be selected and the natural choice
>> in the absence of tasks from any other sched class is the idle task.
>>
>> The idle loop will automatically be called and the nohz state will
>> also fall in place. The cpu is really idle now: the runqueue has no
>> tasks and the task running on the cpu is the idle thread. The
>> throttled tasks are on a separate list.
>>
>> When the period of idle injection is over, we unthrottle the runqueue.
>> All this being taken care of my a non-deferrable timer. This design
>> ensures that the intention of powerclamp is not hampered while at the
>> same time maintaining a sane state for nohz; you will get the
>> efficiency you want.
>>
>> Of course there may be corner cases and challenges around
>> synchronization of package idle, which I am sure we can work around
>> with a better design such as the above. I am working on that patchset
>> and will post out in a day. You can take a look and let us know the
>> pieces we are missing.
>>
>> I find that implementing the above design is not too hard.
>>
> Hi Preeti,
> Yeah, it seems to be a good approach. looking forward to work with you
> on this. Timer may scale better for larger systems. One question, will
> timer irq gets unpredictable delays if run by ksoftirqd?

I am sorry I could not respond earlier; I was on vacation as well. Yes,
we may have a problem here. Let alone synchronization between cpus in
performing clamping, there are two other functionality issues that I see.

1. Since periodic timers get executed in the softirq context,
scheduler_tick() would have passed by by then. i.e.
hrtimer_interrupt()
|__tick_sched_handle()
   |__scheduler_tick()
   |__raise_softirq(TIMER_SOFTIRQ)
ksoftirqd runs on local_bh_enable()-->powerclamp_timer handler runs

Although runqueues are throttled in the powerclamp timer handler, it has
to wait till the next scheduler tick to select an idle task to run.
A precious 4-10ms depending on the config would have passed by then.

2. For the same reason as 1, when the ksoftirqd has to run on the cpus
during the tick after the one in which throttling is enabled, cpus are
unavailable to run the daemon because they are throttled. However there
is no other way to unthrottle the runqueues now except by running the
ksoftirqd; a chicken and egg problem.

I think both the above problems could be solved by using hrtimers
instead of periodic timers to perform clamping/unclamping, since
hrtimers are serviced in the interrupt context. But we cannot
initialize/start/modify hrtimers on a remote cpu. We will end up using
IPIs for handling the hrtimers during start/end of powerclamp or
modification of the idle duration of clamping, which is not a tempting
option either.

So I am currently stuck at this point. I would be glad to have some
suggestions.

Thanks

Regards
Preeti U Murthy

> BTW, I may not be able to respond quickly during the holidays. If
> things workout, it may benefit ACPI PAD driver as well.
> =

> =

> Thanks,
> =

> Jacob
>> Regards
>> Preeti U Murthy
>>
> =

> [Jacob Pan]
> =



--===============7571859385668240438==--

