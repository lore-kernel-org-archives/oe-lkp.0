Content-Type: multipart/mixed; boundary="===============4476310022705559487=="
MIME-Version: 1.0
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] input: serio: drop warnings in case of EPROBE_DEFER from serio_find_driver()
Date: Sat, 16 Jan 2016 10:36:36 -0800
Message-ID: <20160116183636.GD9203@dtor-ws>
In-Reply-To: <9158432.BHbKetFqR6@vostro.rjw.lan>
List-Id: <oe-lkp.lists.linux.dev>

--===============4476310022705559487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 15, 2016 at 09:53:14PM +0100, Rafael J. Wysocki wrote:
> On Friday, January 15, 2016 08:01:15 PM Grygorii Strashko wrote:
> > Now serio_find_driver() will print warnings in case device_attach()
> > returns -EPROBE_DEFER. Those warnings are obsolete, in genral, because:
> > - DD core can report the same if required
> > - since commit 013c074f8642 ("PM / sleep: prohibit devices probing
> > during suspend/hibernation") the devices probing is prohibited during
> > System suspend and deferred device will be carefully reprobed once
> > Resume is finished.
> > =

> > Hence, drop warnings in case of EPROBE_DEFER from serio_find_driver().
> > =

> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Cc: Rafael J. Wysocki <rjw@rjwysocki.net>
> > Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> =

> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Applied, thank you.

> =

> > ---
> >  drivers/input/serio/serio.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/drivers/input/serio/serio.c b/drivers/input/serio/serio.c
> > index 8f82897..1ca7f55 100644
> > --- a/drivers/input/serio/serio.c
> > +++ b/drivers/input/serio/serio.c
> > @@ -134,7 +134,7 @@ static void serio_find_driver(struct serio *serio)
> >  	int error;
> >  =

> >  	error =3D device_attach(&serio->dev);
> > -	if (error < 0)
> > +	if (error < 0 && error !=3D -EPROBE_DEFER)
> >  		dev_warn(&serio->dev,
> >  			 "device_attach() failed for %s (%s), error: %d\n",
> >  			 serio->phys, serio->name, error);
> > =

> =

> -- =

> I speak only for myself.
> Rafael J. Wysocki, Intel Open Source Technology Center.

-- =

Dmitry

--===============4476310022705559487==--

