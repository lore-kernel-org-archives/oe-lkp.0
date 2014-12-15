Content-Type: multipart/mixed; boundary="===============0213622715552606084=="
MIME-Version: 1.0
From: Viresh Kumar <viresh.kumar@linaro.org>
To: lkp@lists.01.org
Subject: Re: [nohz] 2a16fc93d2c: kernel lockup on idle injection
Date: Mon, 15 Dec 2014 15:02:17 +0530
Message-ID: <CAKohpo=C8Jv-+CtmDO+QJ-_=3dNwsk6_W0gtRRHmtSQ8_LgObQ@mail.gmail.com>
In-Reply-To: <548E8D01.9050707@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0213622715552606084==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 15 December 2014 at 12:55, Preeti U Murthy <preeti@linux.vnet.ibm.com>=
 wrote:
> Hi Viresh,
>
> Let me explain why I think this is happening.
>
> 1. tick_nohz_irq_enter/exit() both get called *only if the cpu is idle*
> and receives an interrupt.

Bang on target. Yeah that's the part we missed while writing this patch :)

> 2. Commit 2a16fc93d2c9568e1, cancels programming of tick_sched timer
> in its handler, assuming that tick_nohz_irq_exit() will take care of
> programming the clock event device appropriately, and hence it would
> requeue or cancel the tick_sched timer.

Correct.

> 3. But the intel_powerclamp driver injects an idle period only.
> *The CPU however is not idle*. It has work on its runqueue and the
> rq->curr !=3D idle. This means that *tick_nohz_irq_enter()/exit() will not
> get called on any interrupt*.

Still good..

> 4. As a consequence, when we get a hrtimer interrupt during the period
> that the powerclamp driver is mimicking idle, the exit path of the
> interrupt never calls tick_nohz_irq_exit(). Hence the tick_sched timer
> that would have got removed due to the above commit will not get
> enqueued back on for any pending timers that there might be. Besides
> this, *jiffies never gets updated*.

Jiffies can be updated by any CPU and there is something called a control
cpu with powerclamp driver. BUT we may have got interrupted before the
powerclamp timer expired and so we are stuck in the

while (time_before(jiffies, target_jiffies))

loop for ever.

> Hope the above explanation makes sense.

Mostly good. Thanks for helping out.

Now, what's the right solution going forward ?

- Revert the offending commit ..
- Or still try to avoid reprogramming if we can ..

This is what I could come up with to still avoid reprogramming of tick:

diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index cc0a5b6f741b..49f4278f69e2 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -1100,7 +1100,7 @@ static enum hrtimer_restart
tick_sched_timer(struct hrtimer *timer)
                tick_sched_handle(ts, regs);

        /* No need to reprogram if we are in idle or full dynticks mode */
-       if (unlikely(ts->tick_stopped))
+       if (unlikely(ts->tick_stopped && (is_idle_task(current) ||
!ts->inidle)))
                return HRTIMER_NORESTART;

        hrtimer_forward(timer, now, tick_period);



Above change checks why we have stopped tick..
- The cpu has gone idle (really): is_idle_task(current)
- The cpu isn't in idle mode, i.e. its in nohz-full mode: !ts->inidle

This fixed the issues with powerclamp in my case.

@Fengguang: Can you please check if this fixes it for you as well?

@Thomas: Please let me know if you want me to send this fix
or you want to revert the original commit itself.

Thanks.

--
Viresh

--===============0213622715552606084==--

