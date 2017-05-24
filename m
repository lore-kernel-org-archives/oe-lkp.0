Content-Type: multipart/mixed; boundary="===============1302938057820285579=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/core] 1c3c5eab17: BUG:using_smp_processor_id()in_preemptible
Date: Wed, 24 May 2017 10:04:20 +0200
Message-ID: <alpine.DEB.2.20.1705241003590.2201@nanos>
In-Reply-To: <20170524065202.v25vyu7pvba5mhpd@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============1302938057820285579==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 24 May 2017, Peter Zijlstra wrote:
> Subject: sched/clock: Fix early boot preempt warning
> =

> The more strict early boot preemption warnings found that
> __set_sched_clock_stable() was incorrectly assuming we'd still be
> running on a single CPU.
> =

> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

> ---
>  kernel/sched/clock.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> =

> diff --git a/kernel/sched/clock.c b/kernel/sched/clock.c
> index 1a0d389d2f2b..ca0f8fc945c6 100644
> --- a/kernel/sched/clock.c
> +++ b/kernel/sched/clock.c
> @@ -133,12 +133,19 @@ static void __scd_stamp(struct sched_clock_data *sc=
d)
>  =

>  static void __set_sched_clock_stable(void)
>  {
> -	struct sched_clock_data *scd =3D this_scd();
> +	struct sched_clock_data *scd;
>  =

>  	/*
> +	 * Since we're still unstable and the tick is already running, we have
> +	 * to disable IRQs in order to get a consistent scd->tick* reading.
> +	 */
> +	local_irq_disable();
> +	scd =3D this_scd();
> +	/*
>  	 * Attempt to make the (initial) unstable->stable transition continuous.
>  	 */
>  	__sched_clock_offset =3D (scd->tick_gtod + __gtod_offset) - (scd->tick_=
raw);
> +	local_irq_enable();
>  =

>  	printk(KERN_INFO "sched_clock: Marking stable (%lld, %lld)->(%lld, %lld=
)\n",
>  			scd->tick_gtod, __gtod_offset,
>=20

--===============1302938057820285579==--

