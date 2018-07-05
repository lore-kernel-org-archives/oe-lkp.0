Content-Type: multipart/mixed; boundary="===============2830731175282859041=="
MIME-Version: 1.0
From: Matt Fleming <matt@codeblueprint.co.uk>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/fair] fbd5188493: WARNING:inconsistent_lock_state
Date: Thu, 05 Jul 2018 14:24:58 +0100
Message-ID: <20180705132458.GA3864@codeblueprint.co.uk>
In-Reply-To: <7c3d20fa-4997-e6ed-3750-e054ce1bd610@arm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2830731175282859041==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 05 Jul, at 11:52:21AM, Dietmar Eggemann wrote:
> =

> Moving the code from _nohz_idle_balance to nohz_idle_balance let it disap=
pear:
> =

> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 02be51c9dcc1..070924f07c68 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -9596,16 +9596,6 @@ static bool _nohz_idle_balance(struct rq *this_rq,=
 unsigned int flags,
>          */
>         smp_mb();
>  =

> -       /*
> -        * Ensure this_rq's clock and load are up-to-date before we
> -        * rebalance since it's possible that they haven't been
> -        * updated for multiple schedule periods, i.e. many seconds.
> -        */
> -       raw_spin_lock_irq(&this_rq->lock);
> -       update_rq_clock(this_rq);
> -       cpu_load_update_idle(this_rq);
> -       raw_spin_unlock_irq(&this_rq->lock);
> -
>         for_each_cpu(balance_cpu, nohz.idle_cpus_mask) {
>                 if (balance_cpu =3D=3D this_cpu || !idle_cpu(balance_cpu))
>                         continue;
> @@ -9701,6 +9691,16 @@ static bool nohz_idle_balance(struct rq *this_rq, =
enum cpu_idle_type idle)
>         if (!(flags & NOHZ_KICK_MASK))
>                 return false;
>  =

> +       /*
> +        * Ensure this_rq's clock and load are up-to-date before we
> +        * rebalance since it's possible that they haven't been
> +        * updated for multiple schedule periods, i.e. many seconds.
> +        */
> +       raw_spin_lock_irq(&this_rq->lock);
> +       update_rq_clock(this_rq);
> +       cpu_load_update_idle(this_rq);
> +       raw_spin_unlock_irq(&this_rq->lock);
> +
>         _nohz_idle_balance(this_rq, flags, idle);
>  =

>         return true;
> =


Hmm.. it still looks to me like we should be saving and restoring IRQs
since this can be called from IRQ context, no?

The patch was a forward-port from one of our SLE kernels, and I messed
up the IRQ flag balancing for the v4.18-rc3 code :-(


--===============2830731175282859041==--

