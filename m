Content-Type: multipart/mixed; boundary="===============5026108706701372917=="
MIME-Version: 1.0
From: Lee Jones <lee.jones@linaro.org>
To: lkp@lists.01.org
Subject: Re: [nl80211] 584f2e43bb: hwsim.ap_country.fail
Date: Tue, 12 Apr 2022 11:23:20 +0100
Message-ID: <YlVTGIhTvzCsZhmO@google.com>
In-Reply-To: <eb5873b4afeee8a7e183a9b1f2e6af461bf7f69f.camel@sipsolutions.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============5026108706701372917==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Apr 2022, Johannes Berg wrote:

> On Mon, 2022-04-11 at 10:25 +0100, Lee Jones wrote:
> > So what exactly happened here?=C2=A0 What does this failure tell us?
> =

> Probably nothing.
> =

> > Is the LKP test broken or did I overlook something in the kernel
> > patch?
> =

> I think the test is just randomly fluking out.
> =

> > How does LKP make use of NL80211_ATTR_REG_ALPHA2?
> > =

> > I'm struggling to find any mention of 'hostapd.py' or 'ap_country' in
> > LKP [0].=C2=A0 Are these benchmarks bespoke add-ons? =

> > =

> =

> it's running the tests from hostap:
> https://w1.fi/cgit/hostap/tree/tests/hwsim
> =

> Anyway, I think we'd better fix the issue like this:
> =

> -       [NL80211_ATTR_REG_ALPHA2] =3D { .type =3D NLA_STRING, .len =3D 2 =
},
> +       /* allow 3 for NUL-termination, we used to declare this NLA_STRIN=
G */
> +       [NL80211_ATTR_REG_ALPHA2] =3D NLA_POLICY_RANGE(NLA_BINARY, 2, 3),
> =

> =

> What do you think?

I'm not entirely sure of the semantics, but so long as it ensures the
user declares enough space to hold both Bytes of data, I'd be happy.

-- =

Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
Principal Technical Lead - Developer Services
Linaro.org =E2=94=82 Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
--===============5026108706701372917==--

