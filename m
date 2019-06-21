Content-Type: multipart/mixed; boundary="===============8663182991885879204=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/hpet] 286b15db78: BUG:KASAN:wild-memory-access_in_t
Date: Fri, 21 Jun 2019 19:04:24 +0200
Message-ID: <alpine.DEB.2.21.1906211902060.5503@nanos.tec.linutronix.de>
In-Reply-To: <20190620032009.716-1-hdanton@sina.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8663182991885879204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 20 Jun 2019, Hillf Danton wrote:
> > =

> > +------------------------------------------+------------+------------+
> > |                                          | dfd001e50c | 286b15db78 |
> > +------------------------------------------+------------+------------+
> > | boot_successes                           | 14         | 0          |
> > | boot_failures                            | 0          | 16         |
> > | BUG:KASAN:wild-memory-access_in_t        | 0          | 16         |
> > | general_protection_fault:#[##]           | 0          | 16         |
> > | RIP:try_module_get                       | 0          | 16         |
> > | Kernel_panic-not_syncing:Fatal_exception | 0          | 16         |
> > +------------------------------------------+------------+------------+
> > =

> > =

> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <rong.a.chen@intel.com>
> > =

> > =

> > [    2.801166] BUG: KASAN: wild-memory-access in try_module_get+0x78/0x=
1bf
> > [    2.803334] Read of size 4 at addr 6b6b6b6b6b6b6b6b by task swapper/0

Yuck.

> > =

> Try to pump up module after checking it is valid only if .owner =3D THIS_=
MODULE
> does not help in the case of hpet.

Errrm?

> Hillf
> ---
>  kernel/time/tick-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/kernel/time/tick-common.c b/kernel/time/tick-common.c
> index 529143b..1b33215 100644
> --- a/kernel/time/tick-common.c
> +++ b/kernel/time/tick-common.c
> @@ -311,7 +311,7 @@ void tick_check_new_device(struct clock_event_device =
*newdev)
>  	if (!tick_check_preferred(curdev, newdev))
>  		goto out_bc;
>  =

> -	if (!try_module_get(newdev->owner))
> +	if (newdev->owner && !try_module_get(newdev->owner))

How does that prevent the above? That's not about a NULL pointer. Its
simply uninitialized memory.

Aside that the check is pointless as try_module_get() has a NULL pointer
check inside already.

Thanks,

	tglx


--===============8663182991885879204==--

