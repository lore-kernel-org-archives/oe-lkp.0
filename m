Content-Type: multipart/mixed; boundary="===============7108861175804221085=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [cpufreq] kernel BUG at kernel/irq_work.c:175!
Date: Wed, 25 Jun 2014 09:51:47 +0000
Message-ID: <20140625095444.GA1635@localhost>
In-Reply-To: <CAKohpo=qmJktRviycErY205xo=-MJ1NZG-uGidRXjO+aAEczEg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7108861175804221085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Nothing specific to my tree, its there in linux-next and PeterZ is
> already working on it:
> =

> https://lkml.org/lkml/2014/6/25/25

That's great! Sorry I should have googled LKML before reporting this error.

Fengguang

> Last diff from him:
> =

> ---
>  kernel/irq_work.c |   12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
> =

> Index: linux-2.6/kernel/irq_work.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.orig/kernel/irq_work.c
> +++ linux-2.6/kernel/irq_work.c
> @@ -160,21 +160,11 @@ static void irq_work_run_list(struct lli
>         }
>  }
> =

> -static void __irq_work_run(void)
> +static void irq_work_run(void)
>  {
>         irq_work_run_list(&__get_cpu_var(raised_list));
>         irq_work_run_list(&__get_cpu_var(lazy_list));
>  }
> -
> -/*
> - * Run the irq_work entries on this cpu. Requires to be ran from hardirq
> - * context with local IRQs disabled.
> - */
> -void irq_work_run(void)
> -{
> -       BUG_ON(!in_irq());
> -       __irq_work_run();
> -}
>  EXPORT_SYMBOL_GPL(irq_work_run);

--===============7108861175804221085==--

