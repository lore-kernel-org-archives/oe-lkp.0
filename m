Content-Type: multipart/mixed; boundary="===============6326477147183819110=="
MIME-Version: 1.0
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v1] i2c: busses: convert to devm_platform_get_and_ioremap_resource
Date: Mon, 20 Apr 2020 12:47:12 +0300
Message-ID: <CAHp75VeGNV-Jsyu1ev843GzBuJqwojfDcbC5H9MJokurrQLjjg@mail.gmail.com>
In-Reply-To: <20200420094319.GA2094@ninjato>
List-Id: <oe-lkp.lists.linux.dev>

--===============6326477147183819110==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2020 at 12:43 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
>
> > 5. Run `codespell` across drivers and subsystems
>
> I think Colin King is already working on that. I regularly get patches
> from him doing that.
>

I think CI should integrate it in their workflow,

LKP guys, what do you think?

> > 6. Fix ioremap(..., 0) [size =3D 0] across architectures, now some retu=
rn NULL,
> >    some return address, some may even have leaks
>
> This sounds more useful to me. Would be great if you have interest.

But it much more advanced :-) Complete dive into the kernel guts.


-- =

With Best Regards,
Andy Shevchenko
--===============6326477147183819110==--

