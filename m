Content-Type: multipart/mixed; boundary="===============2570267048817116956=="
MIME-Version: 1.0
From: Alexander Duyck <alexander.duyck@gmail.com>
To: lkp@lists.01.org
Subject: Re: [net] 5478fcd0f4: BUG:sleeping_function_called_from_invalid_context_at_include/linux/sched/mm.h
Date: Mon, 22 Mar 2021 07:32:56 -0700
Message-ID: <CAKgT0UdKtBU22dwnZmkP8+kjDBRhOZHc9-V3PhfsR+4Tt-N3nA@mail.gmail.com>
In-Reply-To: <161640517096.3021.7957377947074787708@kwain.local>
List-Id: <oe-lkp.lists.linux.dev>

--===============2570267048817116956==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2021 at 2:26 AM Antoine Tenart <atenart@kernel.org> wrote:
>
> Quoting Matthew Wilcox (2021-03-22 10:05:36)
> > On Mon, Mar 22, 2021 at 09:55:50AM +0100, Antoine Tenart wrote:
> > > I only had a quick look at this, but I think the issue should be fixed
> > > with:
> > >
> > > diff --git a/net/core/net-sysfs.c b/net/core/net-sysfs.c
> > > index e16d54aabd4c..3ae3c20eb64c 100644
> > > --- a/net/core/net-sysfs.c
> > > +++ b/net/core/net-sysfs.c
> > > @@ -1378,7 +1378,7 @@ static ssize_t xps_queue_show(struct net_device=
 *dev, unsigned int index,
> > >         nr_ids =3D dev_maps ? dev_maps->nr_ids :
> > >                  (type =3D=3D XPS_CPUS ? nr_cpu_ids : dev->num_rx_que=
ues);
> > >
> > > -       mask =3D bitmap_zalloc(nr_ids, GFP_KERNEL);
> > > +       mask =3D bitmap_zalloc(nr_ids, GFP_ATOMIC);
> > >         if (!mask) {
> > >                 rcu_read_unlock();
> > >                 return -ENOMEM;
> >
> > sysfs isn't a good reason to use GFP_ATOMIC.
> >
> > try something like this:
> >
> > -       mask =3D bitmap_zalloc(nr_ids, GFP_KERNEL);
> > +       mask =3D bitmap_zalloc(nr_ids, GFP_NOWAIT);
> >         if (!mask) {
> > +               int new_nr_ids;
> > +
> >                 rcu_read_unlock();
> > -               return -ENOMEM;
> > +               mask =3D bitmap_zalloc(nr_ids, GFP_KERNEL);
> > +               if (!mask)
> > +                       return -ENOMEM;
> > +               rcu_read_lock();
> > +               dev_maps =3D rcu_dereference(dev->xps_maps[type]);
> > +               /* if nr_ids shrank while we slept, do not overrun arra=
y.
> > +                * if it increased, we just won't show the new ones
> > +                */
> > +               new_nr_ids =3D dev_maps ? dev_maps->nr_ids :
> > +                       (type =3D=3D XPS_CPUS ? nr_cpu_ids : dev->num_r=
x_queues);
> > +               if (new_nr_ids < nr_ids)
> > +                       nr_ids =3D new_nr_ids;
>
> Thanks for the suggestion, I'll look into that. We could also just
> return -ENOMEM if the first allocation fails, retrying adds a lot of
> complexity.
>
> Antoine

I agree that the retry logic is probably unneeded. In addition we
probably don't need GFP_ATOMIC as GFP_NOWAIT will probably be good
enough as the allocation can fail and just return an -ENOMEM in the
case of low memory.

Thanks.

- Alex
--===============2570267048817116956==--

