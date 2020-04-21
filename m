Content-Type: multipart/mixed; boundary="===============3679026958707139028=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v1] i2c: busses: convert to devm_platform_get_and_ioremap_resource
Date: Tue, 21 Apr 2020 09:24:03 +0800
Message-ID: <20200421012403.GB32555@intel.com>
In-Reply-To: <CAHp75VeGNV-Jsyu1ev843GzBuJqwojfDcbC5H9MJokurrQLjjg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3679026958707139028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2020 at 12:47:12PM +0300, Andy Shevchenko wrote:
> On Mon, Apr 20, 2020 at 12:43 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> >
> >
> > > 5. Run `codespell` across drivers and subsystems
> >
> > I think Colin King is already working on that. I regularly get patches
> > from him doing that.
> >
> =

> I think CI should integrate it in their workflow,
> =

> LKP guys, what do you think?
thanks, this looks valuable, we will investigate the tool
to see how we can integrate it to our testing flow.

> =

> > > 6. Fix ioremap(..., 0) [size =3D 0] across architectures, now some re=
turn NULL,
> > >    some return address, some may even have leaks
> >
> > This sounds more useful to me. Would be great if you have interest.
> =

> But it much more advanced :-) Complete dive into the kernel guts.
> =

> =

> -- =

> With Best Regards,
> Andy Shevchenko
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============3679026958707139028==--

