Content-Type: multipart/mixed; boundary="===============1161635869031513970=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8c30ace35d: WARNING:at_kernel/time/clocksource.c:#clocksource_watchdog
Date: Wed, 28 Apr 2021 17:39:01 +0200
Message-ID: <YImBlV8l7bjZ7Q6G@hirez.programming.kicks-ass.net>
In-Reply-To: <87a6pimt1f.ffs@nanos.tec.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============1161635869031513970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 03:34:52PM +0200, Thomas Gleixner wrote:


>  3) CPU does advertise X86_FEATURE_CONSTANT_TSC and X86_FEATURE_NONSTOP_T=
SC
> =

>     That's the point where usable starts, which is around 2007/2008
> =

>  4) CPU has X86_FEATURE_CONSTANT_TSC, X86_FEATURE_NONSTOP_TSC and
>     TSC_ADJUST
> =

>     That's anything Intel starting from Haswell - not sure about the
>     ATOM parts though.
> =

>     Non-Intel CPUs lack this completely.
> =

>  5) CPU has X86_FEATURE_CONSTANT_TSC, X86_FEATURE_NONSTOP_TSC and
>     TSC_ADJUST and the not yet existing feature TSC_LOCKDOWN
> =

>     We're asking for this for at least 15 years now, but we also had to
>     wait 10+ years to get a halfways usable TSC, so why am I
>     complaining?
> =

> So we really care about #3 and #4.
> =

> #4 is the easy case because we can check MSR_TSC_ADJUST to figure out
>    whether something has written to MSR_TSC or MSR_TSC_ADJUST and undo
>    the damage in a sane way.

This is after the fact though; userspace (and kernel space) will have
observed non-linear time and things will be broken in various subtle and
hard to tell ways.

>    That's currently only done when a CPU goes idle, but there are
>    options to do that differently (timer, TIF flag ...)
> =

>    This allows to disable the clocksource watchdog completely and based
>    on Fengs work we are going to do so sooner than later.


> The problematic case is #3 because that affects any Non-Intel CPUs
> and the pre Haswell Intel ones.

Right, no clue what to do about all them AMD machines :/

> Unfortunately there is no other way than using the watchdog mechanism,
> simply because we need hardware assistance for detection and a reliable
> way to undo the damage, which is what we have with TSC_ADJUST. Of course
> the best case would be a mechanism to prevent writes to TSC/TSC_ADJUST
> completely after boot.

Yes, we needs us that TSC_LOCKDOWN thing, across all of x86.

> Now let's look at the cases which cause TSC problems in the real world:
> =

>     1) Boot time (or resume time) TSC inconsistency
> =

>        That's the major problem today, but that's not a watchdog issue.
> =

>        On TSC_ADJUST equipped machines we fix the wreckage up, on others
>        we give up. For the latter case we don't need a watchdog :)
> =

>     2) Runtime wreckage caused by BIOS/SMM
> =

>        That used to be a wide spread problem 10 years ago and today it's
>        only a sporadic issue, but it's not eliminated completely which
>        is why we have this discussion at all.
> =

> As we have no reliable indicator whether a BIOS can be trusted and
> history taught us that it can't be trusted, we need to have this
> trainwreck until hardware people actually come to senses and fix the
> root cause once and forever.

Also, realistically, people are actually still running modern kernels on
10 year old hardware :/

> The only other option to handle this mess is to declare the watchdog
> experiment as failed, rip it out completely and emit a fat warning on
> boot when a non-trustable TSC is detected:
> =

>      HARDWARE-BUG: Untrusted TSC detected. For further information see:
>      https://www.kernel.org/doc/html/latest/admin-guide/hw-trainwrecks/ts=
c.html
> =

> I can live with that and maybe we should have done that 15 years ago
> instead of trying to work around it at the symptom level.

Anybody that still has runtime BIOS wreckage will then silently suffer
nonlinear time, doubly so for anybody not having TSC_ADJUST. Are we sure
we can tell them all to bugger off and buy new hardware?

At the very least we need something like tsc=3Dbroken, to explicitly mark
TSC bad on machines, so that people that see TSC fail on their current
kernels can continue to use the new kernels. This requires a whole lot
of care on the part of users though, and will raise a ruckus, because I
bet a fair number of these people are not even currently aware we're
disabling TSC for them :/
--===============1161635869031513970==--

