Content-Type: multipart/mixed; boundary="===============8966267154355110164=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8c30ace35d: WARNING:at_kernel/time/clocksource.c:#clocksource_watchdog
Date: Wed, 28 Apr 2021 19:00:15 +0200
Message-ID: <871raumjj4.ffs@nanos.tec.linutronix.de>
In-Reply-To: <YImBlV8l7bjZ7Q6G@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============8966267154355110164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28 2021 at 17:39, Peter Zijlstra wrote:
> On Wed, Apr 28, 2021 at 03:34:52PM +0200, Thomas Gleixner wrote:
>> #4 is the easy case because we can check MSR_TSC_ADJUST to figure out
>>    whether something has written to MSR_TSC or MSR_TSC_ADJUST and undo
>>    the damage in a sane way.
>
> This is after the fact though; userspace (and kernel space) will have
> observed non-linear time and things will be broken in various subtle and
> hard to tell ways.

What I observed in the recent past is that _IF_ that happens it's a
small amount of cycles so it's not a given that this can be observed
accross CPUs. But yes, it's daft.

>> I can live with that and maybe we should have done that 15 years ago
>> instead of trying to work around it at the symptom level.
>
> Anybody that still has runtime BIOS wreckage will then silently suffer
> nonlinear time, doubly so for anybody not having TSC_ADJUST. Are we sure
> we can tell them all to bugger off and buy new hardware?
>
> At the very least we need something like tsc=3Dbroken, to explicitly mark
> TSC bad on machines, so that people that see TSC fail on their current
> kernels can continue to use the new kernels. This requires a whole lot
> of care on the part of users though, and will raise a ruckus, because I
> bet a fair number of these people are not even currently aware we're
> disabling TSC for them :/

I'm still allowed to dream, right? :)

Thanks,

        tglx
--===============8966267154355110164==--

