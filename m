Content-Type: multipart/mixed; boundary="===============8534940861509700511=="
MIME-Version: 1.0
From: Preeti U Murthy <preeti@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [nohz] 2a16fc93d2c: kernel lockup on idle injection
Date: Tue, 16 Dec 2014 15:06:32 +0530
Message-ID: <548FFD20.1040102@linux.vnet.ibm.com>
In-Reply-To: <CAKohpokOuOqvpNt4_y2tHPTM8nKLyEg=-gN4NDe1_mqpy=Vrow@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8534940861509700511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/16/2014 10:23 AM, Viresh Kumar wrote:
> + Peter from Jacob's mail ..
> =

> On 16 December 2014 at 05:14, Frederic Weisbecker <fweisbec@gmail.com> =
wrote:
>> So to summarize: I see it enqueues a timer then it loops on that timer e=
xpiration.
>> On that loop we stop the CPU and we expect the timer to fire and wake th=
e thread up.
>> But if the delayed tick fires too early, before the timer actually
>> expires, then we go to sleep again because we haven't yet reached the de=
lay,
>> but since tick_nohz_irq_exit() is only called on idle tasks and not for =
threads
>> like powerclamp, the tick isn't rescheduled to handle the remaining time=
r slice
>> so we sleep forever.
> =

> Perfect !!
> =

>> Hence if we really want to stop the tick when we mimic idle from powercl=
amp driver,
>> we must call tick_nohz_irq_exit() on irq exit to do it correctly.
>>
>> It happened to work by accident before the commit because we were resche=
duling the
>> tick from itself without tick_nohz_irq_exit() to cancel anything. And th=
at restored
>> the periodic behaviour necessary to complete the delay.
>>
>> So the above change is rather a hack than a solution.
>>
>> We have several choices:
>>
>> 1) Revert the commit. But this has to be a temporary solution really. Po=
werclamp has
>> to be fixed and handle tick_nohz_irq_exit().
>>
>> 2) Remove powerclamp tick stop until somebody fixes it to handle nohz pr=
operly.
>>
>> 2) Fix it directly. But I believe there is a release that is going to mi=
ss the fix
>> and suffer the regression. Does the regression matter for anybody? Is po=
werclamp
>> meant for anything else than testing (I have no idea what it's used for)?
>>
>> So to fix powerclamp to handle nohz correctly, tick_nohz_irq_exit() must=
 be called
>> for both idle tasks and powerclamp kthreads. Checking ts->inidle can be =
a good way to match

As far as I can see, the primary purpose of tick_nohz_irq_enter()/exit()
paths was to take care of *tick stopped* cases.

Before handling interrupts we would want jiffies to be updated, which is
done in tick_nohz_irq_enter(). And after handling interrupts we need to
verify if any timers/RCU callbacks were queued during an interrupt.
Both of these will not be handled properly
*only when the tick is stopped* right?

If so, the checks which permit entry into these functions should at a
minimum include a check on ts->tick_stopped(). The rest of the checks
around if the CPU is idle/need_resched() may be needed in conjunction,
but will not be complete without checking if ticks are stopped. I see
that tick_nohz_irq_enter() has a check on ts->tick_stopped, which is
correct, but tick_noz_irq_exit() does not.

Adding this check to tick_nohz_irq_exit() will not only solve this
regression but is probably a fix to a long standing bug in the
conditional check in tick_nohz_irq_exit().

>> both. That means we might need to use a reduced part of idle_cpu() to av=
oid redundant checks.
>> tick_irq_enter() must be called as well for powerclamp, in case it's the=
 only CPU running, it
>> has to fixup the timekeeping alone.
> =

> Yeah, you can call my fix a Hacky one. I agree..
> =

> But I don't know if calling tick_nohz_irq_exit() from these threads would=
n't
> be hacky as well. And ofcourse my knowledge wouldn't be adequate here to
> judge that :)
> =

> It looked a bit odd to me. Why should we call irq-exit from the threads w=
orking
> with idle? And that's not what we do even for the real-idle loop as well =
..
> =

> Also from Jacob's referenced patch, we would be moving to a consolidated
> idle-loop for both real idle and threads like powerclamp, and this part m=
ay be
> tricky then..
> =

> Untested, but what about something like this?
> =

> diff --git a/kernel/softirq.c b/kernel/softirq.c
> index 5918d227730f..5e4bfc367735 100644
> --- a/kernel/softirq.c
> +++ b/kernel/softirq.c
> @@ -321,7 +321,7 @@ asmlinkage __visible void do_softirq(void)
>  void irq_enter(void)
>  {
>         rcu_irq_enter();
> -       if (is_idle_task(current) && !in_interrupt()) {
> +       if (tick_idle_active() && !in_interrupt()) {
>                 /*
>                  * Prevent raise_softirq from needlessly waking up ksofti=
rqd
>                  * here, as softirq will be serviced on return from inter=
rupt.
> @@ -363,7 +363,7 @@ static inline void tick_irq_exit(void)
>         int cpu =3D smp_processor_id();
> =

>         /* Make sure that timer wheel updates are propagated */
> -       if ((idle_cpu(cpu) && !need_resched()) || tick_nohz_full_cpu(cpu)=
) {
> +       if ((tick_idle_active() && !need_resched()) ||

For reasons mentioned above, this check alone will not do. It may solve
this regression,but the check is incomplete.

IMO it should simply be :
if (tick_nohz_tick_stopped() || tick_nohz_full_cpu())

Regards
Preeti U Murthy



--===============8534940861509700511==--

