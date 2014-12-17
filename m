Content-Type: multipart/mixed; boundary="===============7634116656609858524=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [nohz] 2a16fc93d2c: kernel lockup on idle injection
Date: Wed, 17 Dec 2014 16:42:45 +0100
Message-ID: <alpine.DEB.2.11.1412171632470.17382@nanos>
In-Reply-To: <CAM4v1pNGHOg5JCpAJqKDPa4NTWHGT_urs9HoamD2dwsrfB4xoQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7634116656609858524==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 17 Dec 2014, Preeti Murthy wrote:
> On Tue, Dec 16, 2014 at 6:19 PM, Thomas Gleixner <tglx@linutronix.de> w=
rote:
> > So the possible states are:
> >
> >  ts->inidle     ts->tick_stopped
> >  0              0               valid
> >  0              1               BUG
> >  1              0               valid
> >  1              1               valid
> >
> > And we are transitioning in and out of that via:
> >
> >     tick_nohz_idle_enter()
> >         ts->inidle =3D true;
> >         if (stop_possible)
> >           stop_tick(ts)
> >
> >     tick_nohz_idle_exit()
> >         ts->inidle =3D false;
> >         if (ts->tick_stopped)
> >            start_tick(ts)
> >
> > irq_exit needs to take care of the following situations if we are
> > inidle:
> >
> >     if (ts->tick_stopped) {
> >          if (stop_possible) {
> >             /* handle timer changes (earlier/later) */
> >             update_tick(ts);
> >          } else {
> >             kick_out_of_idle();
> >          }
> >     } else {
> >         if (stop_possible)
> >           stop_tick(ts)
> >     }
> =

> Just for my understanding, Isn't the entire above logic minus the
> update_tick() contained in __tick_nohz_idle_enter() ? And why

Yes, I just explained it formally.

> do we need to update ticks during irq_exit path? We do it during
> the irq_enter() path if ticks are stopped.

update_tick() has nothing to do with jiffies/timekeeping. Again:

tick_nohz_idle_enter()
  stop_tick()
idle()
  interrupt()
    irq_enter()
      update_timekeeping_and_jiffies()
    handler()
      modify_timer()
    irq_exit()
      /* handle timer changes (earlier/later) */
      update_tick(()
        check_whether_interrupt_has_modified_next_expiry_time()

> I do agree that the powerclamp driver has brought in a new scenario.
> But I do not find it to be a messy implementation of mimicking idle.
> Here is why:
> =

> Powerclamp driver injects idle duration when there is a need to
> stay within the power budget. This is a fair enough problem.
> Now for the implementation of the idle injection. Currently
> powerclamp schedules in an idle thread, when there is work in the rq.
> This means although the thread is idle, the CPU is not. It also requires
> the tick to be stopped, so that the idle period is not interrupted.
> =

> I looked at your patch for scheduling in an idle thread to solve this iss=
ue,
> but I think it will break things further. Because although it is an idle =
thread,
> it cannot belong to the idle sched class because the function of an idle =
task
> is to loop in cpu_idle(), calling into the idle governors and more extra =
frills,
> none of which are relevant to the powerclamp driver.

MY patch does nothing of that. It throttles sched_fair, which brings
the cpu to idle.

>    Don't you think that the one function that a thread should call into i=
n the
> above situation is tick_nohz_idle_enter() ?

No thread except idle is ever supposed to call any of the
tick_nohz_idle functions. Period.
 =

> Looking at the implementation of tick_nohz_idle_enter/exit() I see that
> fundamentally they declare the tick on that cpu to be idle and verify
> if they have to be stopped/restarted; exactly what powerclamp is asking f=
or.

Just get it: powerclamp is abusing everything from RT scheduling to
the idle infrastructure with some homebrewn construct. It's wrong.

> Nothing here that critically mandates that the cpu calling it has to have=
 no
> work on it.
> =

> I agree that tick_nohz_idle_enter()/exit() were meant to be used by the
> idle task alone when they were written. But I do not see why they
> cannot be used for the usecase that powerclamp brings to the table.
> They have the potential, which is why we are able to use
> the functions that they call into,  for nohz_full scenarios as well.
> tick_nohz_stop_sched_tick() for instance. This shows that they need
> not merely be used just before cpus go idle.

No. You are just fostering mindless crap instead of fixing it proper.
 =

> For this reason, I suggest the below patch to fix this issue for the time
> being. Like you and Frederic pointed we need to depend on ts->inidle now.
> Basing the decision on the idleness of the cpu will no longer work.
> =

> diff --git a/kernel/softirq.c b/kernel/softirq.c
> index 0699add..a31864d 100644
> --- a/kernel/softirq.c
> +++ b/kernel/softirq.c
> @@ -361,9 +361,10 @@ static inline void tick_irq_exit(void)
>  {
>  #ifdef CONFIG_NO_HZ_COMMON
>         int cpu =3D smp_processor_id();
> +       struct tick_sched *ts =3D this_cpu_ptr(&tick_cpu_sched);
> =

>         /* Make sure that timer wheel updates are propagated */
> -       if ((idle_cpu(cpu) && !need_resched()) || tick_nohz_full_cpu(cpu)=
) {
> +       if (ts->inidle || tick_nohz_full_cpu(cpu)) {

So you pointlessly force that in tick_nohz_irq_exit() even if
need_resched() is set.

Stop this tinkering finally. I'm not going to apply anything of that
which just burdens crap on sane code to support powerclamp insanity.

You can hack what you want here, it's never going to be a sane
solution. Period.

Thanks,

	tglx

--===============7634116656609858524==--

