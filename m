Content-Type: multipart/mixed; boundary="===============0022790144472336661=="
MIME-Version: 1.0
From: Preeti Murthy <preeti.lkml@gmail.com>
To: lkp@lists.01.org
Subject: Re: [nohz] 2a16fc93d2c: kernel lockup on idle injection
Date: Wed, 17 Dec 2014 18:01:55 +0530
Message-ID: <CAM4v1pNGHOg5JCpAJqKDPa4NTWHGT_urs9HoamD2dwsrfB4xoQ@mail.gmail.com>
In-Reply-To: <alpine.DEB.2.11.1412161105470.17382@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============0022790144472336661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Tue, Dec 16, 2014 at 6:19 PM, Thomas Gleixner <tglx@linutronix.de> wro=
te:
> On Tue, 16 Dec 2014, Preeti U Murthy wrote:
>> As far as I can see, the primary purpose of tick_nohz_irq_enter()/exit()
>> paths was to take care of *tick stopped* cases.
>>
>> Before handling interrupts we would want jiffies to be updated, which is
>> done in tick_nohz_irq_enter(). And after handling interrupts we need to
>> verify if any timers/RCU callbacks were queued during an interrupt.
>> Both of these will not be handled properly
>> *only when the tick is stopped* right?
>>
>> If so, the checks which permit entry into these functions should at a
>> minimum include a check on ts->tick_stopped(). The rest of the checks
>> around if the CPU is idle/need_resched() may be needed in conjunction,
>> but will not be complete without checking if ticks are stopped. I see
>> that tick_nohz_irq_enter() has a check on ts->tick_stopped, which is
>> correct, but tick_noz_irq_exit() does not.
>>
>> Adding this check to tick_nohz_irq_exit() will not only solve this
>> regression but is probably a fix to a long standing bug in the
>> conditional check in tick_nohz_irq_exit().
>
> This is a complete mess caused by the full nohz hackery and you're
> just making it worse. Lets ignore the powerclamp crap for now.
>
> The initial nohz idle logic was simple:
>
> irq_enter
>         if (ts->tick_stopped)
>            update_timekeeping()
>
> irq_exit
>         if (ts->inidle)
>            tick_nohz_update_sched_tick();
>
> And that was completely correct. On irq_enter the only relevant
> information is whether the tick is stopped or not. On irq_exit the
> tick handling is only interesting if we are inidle.
>
> If we're not inidle then the tick is not stopped either. If we are
> inidle the tick might be stopped or not. So the interrupt can have
> added/removed/modified timers which have consequences on the
> tick_stopped state and possibly kick the machine out of idle
> completely.
>
> If the tick was not stopped, then the removal/modification of a timer
> in the interrupt can cause the tick to be stoppable at irq_exit.
>
> So making irq_exit:
>
>         if (!ts->tick_stopped)
>            return;
>
> is fundamentally wrong as you miss the oportunity to stop the tick
> after the changes done by the interrupt handler.

Ok I see now. Thanks a lot for clarifying this.

>
> So the possible states are:
>
>  ts->inidle     ts->tick_stopped
>  0              0               valid
>  0              1               BUG
>  1              0               valid
>  1              1               valid
>
> And we are transitioning in and out of that via:
>
>     tick_nohz_idle_enter()
>         ts->inidle =3D true;
>         if (stop_possible)
>           stop_tick(ts)
>
>     tick_nohz_idle_exit()
>         ts->inidle =3D false;
>         if (ts->tick_stopped)
>            start_tick(ts)
>
> irq_exit needs to take care of the following situations if we are
> inidle:
>
>     if (ts->tick_stopped) {
>          if (stop_possible) {
>             /* handle timer changes (earlier/later) */
>             update_tick(ts);
>          } else {
>             kick_out_of_idle();
>          }
>     } else {
>         if (stop_possible)
>           stop_tick(ts)
>     }

Just for my understanding, Isn't the entire above logic minus the
update_tick() contained in __tick_nohz_idle_enter() ? And why
do we need to update ticks during irq_exit path? We do it during
the irq_enter() path if ticks are stopped.

>
> Now with nohzfull the state space looks like this:
>
>  ts->inidle     ts->infullnohz  ts->tick_stopped
>  0              0               0               valid
>  0              0               1               BUG
>  1              0               0               valid
>  1              0               1               valid
>
>  0              1               0               valid
>  0              1               1               valid
>  1              1               0               BUG
>  1              1               1               BUG
>
> You might have noticed that we have neither ts->infullnohz nor
> functions which transitions in and out of that state.
>
> And that's where the whole problem starts. The nohz full stuff is
> trying to evaluate everything dynamically which is just insane.
>
> So we want to have functions which do:
>
>    tick_nohz_full_enter()
>      ts->infullnohz =3D true;
>      if (stop_possible)
>         stop_tick(ts);
>
>    tick_nohz_full_exit()
>      ts->infullnohz =3D false;
>      if (ts->tick_stopped)
>         start_tick(ts);
>
> Plus irq_exit would become:
>
> irq_exit
>         if (ts->inidle)
>            tick_nohz_update_sched_tick();
>
>         else if (ts->infullnohz)
>            tick_nohz_full_update_sched_tick();

I agree, this would be very helpful.

>
> You need to keep track of the fact that the cpu entered fullnohz and
> work from there. Whether the tick is stopped or not does not matter at
> all because that is a seperate decision like in the nohz idle case.
>
> Everything else is voodoo programming.
>
> Now the powerclamp mess is a different story.
>
> Calling tick_nohz_idle_enter()/exit() from outside the idle task is
> just broken. Period.

I do agree that the powerclamp driver has brought in a new scenario.
But I do not find it to be a messy implementation of mimicking idle.
Here is why:

Powerclamp driver injects idle duration when there is a need to
stay within the power budget. This is a fair enough problem.
Now for the implementation of the idle injection. Currently
powerclamp schedules in an idle thread, when there is work in the rq.
This means although the thread is idle, the CPU is not. It also requires
the tick to be stopped, so that the idle period is not interrupted.

I looked at your patch for scheduling in an idle thread to solve this issue,
but I think it will break things further. Because although it is an idle th=
read,
it cannot belong to the idle sched class because the function of an idle ta=
sk
is to loop in cpu_idle(), calling into the idle governors and more extra fr=
ills,
none of which are relevant to the powerclamp driver.
   Don't you think that the one function that a thread should call into in =
the
above situation is tick_nohz_idle_enter() ?

Looking at the implementation of tick_nohz_idle_enter/exit() I see that
fundamentally they declare the tick on that cpu to be idle and verify
if they have to be stopped/restarted; exactly what powerclamp is asking for.
Nothing here that critically mandates that the cpu calling it has to have no
work on it.

I agree that tick_nohz_idle_enter()/exit() were meant to be used by the
idle task alone when they were written. But I do not see why they
cannot be used for the usecase that powerclamp brings to the table.
They have the potential, which is why we are able to use
the functions that they call into,  for nohz_full scenarios as well.
tick_nohz_stop_sched_tick() for instance. This shows that they need
not merely be used just before cpus go idle.

For this reason, I suggest the below patch to fix this issue for the time
being. Like you and Frederic pointed we need to depend on ts->inidle now.
Basing the decision on the idleness of the cpu will no longer work.

diff --git a/kernel/softirq.c b/kernel/softirq.c
index 0699add..a31864d 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -361,9 +361,10 @@ static inline void tick_irq_exit(void)
 {
 #ifdef CONFIG_NO_HZ_COMMON
        int cpu =3D smp_processor_id();
+       struct tick_sched *ts =3D this_cpu_ptr(&tick_cpu_sched);

        /* Make sure that timer wheel updates are propagated */
-       if ((idle_cpu(cpu) && !need_resched()) || tick_nohz_full_cpu(cpu)) {
+       if (ts->inidle || tick_nohz_full_cpu(cpu)) {
                if (!in_interrupt())
                        tick_nohz_irq_exit();
        }

Regards
Preeti U Murthy

--===============0022790144472336661==--

