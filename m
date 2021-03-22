Content-Type: multipart/mixed; boundary="===============9045435737038449841=="
MIME-Version: 1.0
From: Antoine Tenart <atenart@kernel.org>
To: lkp@lists.01.org
Subject: Re: [net] 5478fcd0f4: BUG:sleeping_function_called_from_invalid_context_at_include/linux/sched/mm.h
Date: Mon, 22 Mar 2021 10:26:11 +0100
Message-ID: <161640517096.3021.7957377947074787708@kwain.local>
In-Reply-To: <20210322090536.GK1719932@casper.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============9045435737038449841==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Quoting Matthew Wilcox (2021-03-22 10:05:36)
> On Mon, Mar 22, 2021 at 09:55:50AM +0100, Antoine Tenart wrote:
> > I only had a quick look at this, but I think the issue should be fixed
> > with:
> > =

> > diff --git a/net/core/net-sysfs.c b/net/core/net-sysfs.c
> > index e16d54aabd4c..3ae3c20eb64c 100644
> > --- a/net/core/net-sysfs.c
> > +++ b/net/core/net-sysfs.c
> > @@ -1378,7 +1378,7 @@ static ssize_t xps_queue_show(struct net_device *=
dev, unsigned int index,
> >         nr_ids =3D dev_maps ? dev_maps->nr_ids :
> >                  (type =3D=3D XPS_CPUS ? nr_cpu_ids : dev->num_rx_queue=
s);
> >  =

> > -       mask =3D bitmap_zalloc(nr_ids, GFP_KERNEL);
> > +       mask =3D bitmap_zalloc(nr_ids, GFP_ATOMIC);
> >         if (!mask) {
> >                 rcu_read_unlock();
> >                 return -ENOMEM;
> =

> sysfs isn't a good reason to use GFP_ATOMIC.
> =

> try something like this:
> =

> -       mask =3D bitmap_zalloc(nr_ids, GFP_KERNEL);
> +       mask =3D bitmap_zalloc(nr_ids, GFP_NOWAIT);
>         if (!mask) {
> +               int new_nr_ids;
> +
>                 rcu_read_unlock();
> -               return -ENOMEM;
> +               mask =3D bitmap_zalloc(nr_ids, GFP_KERNEL);
> +               if (!mask)
> +                       return -ENOMEM;
> +               rcu_read_lock();
> +               dev_maps =3D rcu_dereference(dev->xps_maps[type]);
> +               /* if nr_ids shrank while we slept, do not overrun array.
> +                * if it increased, we just won't show the new ones
> +                */
> +               new_nr_ids =3D dev_maps ? dev_maps->nr_ids :
> +                       (type =3D=3D XPS_CPUS ? nr_cpu_ids : dev->num_rx_=
queues);
> +               if (new_nr_ids < nr_ids)
> +                       nr_ids =3D new_nr_ids;

Thanks for the suggestion, I'll look into that. We could also just
return -ENOMEM if the first allocation fails, retrying adds a lot of
complexity.

Antoine
--===============9045435737038449841==--

