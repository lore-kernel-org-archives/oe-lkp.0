Content-Type: multipart/mixed; boundary="===============7642377843742948851=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [torture] b151f93a71: INFO:rcu_preempt_detected_stalls_on_CPUs/tasks
Date: Tue, 28 Nov 2017 18:10:08 +0100
Message-ID: <alpine.DEB.2.20.1711281809200.2222@nanos>
In-Reply-To: <20171128170759.GU3624@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7642377843742948851==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 28 Nov 2017, Paul E. McKenney wrote:
> On Tue, Nov 28, 2017 at 05:47:35PM +0100, Thomas Gleixner wrote:
> diff --git a/kernel/time/timer.c b/kernel/time/timer.c
> index db774b0f217e..a3321bb565db 100644
> --- a/kernel/time/timer.c
> +++ b/kernel/time/timer.c
> @@ -1803,7 +1803,7 @@ signed long __sched schedule_timeout(signed long ti=
meout)
>  		idx =3D timer_get_idx(&timer.timer);
>  		idx_now =3D calc_wheel_index(j, base->clk);
>  		raw_spin_unlock_irqrestore(&base->lock, flags);
> -		pr_info("%s: Waylayed timer idx: %u idx_now: %u\n", __func__, idx, idx=
_now);
> +		pr_info("%s: Waylayed timer base->clk: %#lx jiffies: %#lx base->next_e=
xpiry: %#lx timer->flags: %#x timer->expires %#lx idx: %u idx_now: %u\n", _=
_func__, base->clk, j, base->next_expiry, timer.timer.flags, timer.timer.ex=
pires, idx, idx_now);

Please print idx and idx_now as hex values. It's simpler to decode that way.

Thanks,

	tglx

--===============7642377843742948851==--

