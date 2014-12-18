Content-Type: multipart/mixed; boundary="===============3572278533276785680=="
MIME-Version: 1.0
From: Eduardo Valentin <edubezval@gmail.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] tick/powerclamp: Remove tick_nohz_idle abuse
Date: Thu, 18 Dec 2014 10:01:12 -0400
Message-ID: <20141218140106.GA6323@developer>
In-Reply-To: <alpine.DEB.2.11.1412181110110.17382@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============3572278533276785680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

On Thu, Dec 18, 2014 at 11:51:01AM +0100, Thomas Gleixner wrote:
> commit 4dbd27711cd9 "tick: export nohz tick idle symbols for module
> use" was merged via the thermal tree without an explicit ack from the
> relevant maintainers.
> =


This is a shame. Rui, do you have any comments on this?

> The exports are abused by the intel powerclamp driver which implements
> a fake idle state from a sched FIFO task. This causes all kinds of
> wreckage in the NOHZ core code which rightfully assumes that
> tick_nohz_idle_enter/exit() are only called from the idle task itself.
> =


OK.

> Recent changes in the NOHZ core lead to a failure of the powerclamp
> driver and now people try to hack completely broken and backwards
> workarounds into the NOHZ core code. This is completely unacceptable.
> =


I see.

> The real solution is to fix the powerclamp driver by rewriting it with
> a sane concept, but that's beyond the scope of this.
> =


Do you have suggestions on what exactly is the expected rewriting or the
correct sane concepts?

> So the only solution for now is to remove the calls into the core NOHZ
> code from the powerclamp trainwreck along with the exports.
> =

> Fixes: d6d71ee4a14a "PM: Introduce Intel PowerClamp Driver"

If I got it right, the driver is currently broken due to changes in NOHZ
core. So, does this patch fix power clamp behavior ?

If I got your proposal right, in the end power clamp will be still
broken, but at least won't be abusing NOHZ. Is that what you are
proposing?

> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
> diff --git a/drivers/thermal/intel_powerclamp.c b/drivers/thermal/intel_p=
owerclamp.c
> index b46c706e1cac..e98b4249187c 100644
> --- a/drivers/thermal/intel_powerclamp.c
> +++ b/drivers/thermal/intel_powerclamp.c
> @@ -435,7 +435,6 @@ static int clamp_thread(void *arg)
>  		 * allowed. thus jiffies are updated properly.
>  		 */
>  		preempt_disable();
> -		tick_nohz_idle_enter();
>  		/* mwait until target jiffies is reached */
>  		while (time_before(jiffies, target_jiffies)) {
>  			unsigned long ecx =3D 1;
> @@ -451,7 +450,6 @@ static int clamp_thread(void *arg)
>  			start_critical_timings();
>  			atomic_inc(&idle_wakeup_counter);
>  		}
> -		tick_nohz_idle_exit();
>  		preempt_enable();
>  	}
>  	del_timer_sync(&wakeup_timer);
> diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
> index 4d54b7540585..1363d58f07e9 100644
> --- a/kernel/time/tick-sched.c
> +++ b/kernel/time/tick-sched.c
> @@ -847,7 +847,6 @@ void tick_nohz_idle_enter(void)
>  =

>  	local_irq_enable();
>  }
> -EXPORT_SYMBOL_GPL(tick_nohz_idle_enter);
>  =

>  /**
>   * tick_nohz_irq_exit - update next tick event from interrupt exit
> @@ -974,7 +973,6 @@ void tick_nohz_idle_exit(void)
>  =

>  	local_irq_enable();
>  }
> -EXPORT_SYMBOL_GPL(tick_nohz_idle_exit);
>  =

>  static int tick_nohz_reprogram(struct tick_sched *ts, ktime_t now)
>  {
> =

> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo(a)vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

--===============3572278533276785680==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIKCmlRRWNCQUVC
QWdBR0JRSlVrdDM4QUFvSkVNTFVPNGQ5cE9KVzVIY0gvajVBcFg1ZHljTG1uNXYzbFc2SEZPa0EK
TU9WOWtTdExuYUp0czBpWjA1WG1BL08raDRGajA0RTQ1TXF4akx0ZnJaaEZhK082U0hUZ3drTVg5
MWwzZXZBTApLN1dhWXZJaUNURGJPUHZCa1FvOEZCNStKb2t1WTRVMmZyM1FBNUc3elVWdVBjYWpO
ZlkvdUJhaVRDb0sxNjduCkp3K3gyZ3g4bURpTDdncUZoQy9BWXgxRXUzdkFpWEp2dUcvdkd4R1pp
SWd2UTM4L1haVndETmszQjRsbmM0dHkKaTI0SjZxWmpoT1RQZDljb3hMQThIME5lUGNpMUxXNG5a
ZjllYTVONlEyb1NxTkQ3TTRiR1dLZXFJQ1g1dFMweAp5Z2l0emtSTXJOM21PMEl6aFdMSks3VnF2
Q2lzL0hnMFRLbU1CTnBxclR4T1JrQkZnUHRTRWY4SVc3TU9nTjA9Cj1abXFUCi0tLS0tRU5EIFBH
UCBTSUdOQVRVUkUtLS0tLQo=

--===============3572278533276785680==--

