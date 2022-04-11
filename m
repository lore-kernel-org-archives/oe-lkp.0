Content-Type: multipart/mixed; boundary="===============7821996591964681702=="
MIME-Version: 1.0
From: Johannes Berg <johannes@sipsolutions.net>
To: lkp@lists.01.org
Subject: Re: [nl80211] 584f2e43bb: hwsim.ap_country.fail
Date: Mon, 11 Apr 2022 11:27:20 +0200
Message-ID: <eb5873b4afeee8a7e183a9b1f2e6af461bf7f69f.camel@sipsolutions.net>
In-Reply-To: <YlP0A+PurZl39sUG@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7821996591964681702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2022-04-11 at 10:25 +0100, Lee Jones wrote:
> So what exactly happened here?=C2=A0 What does this failure tell us?

Probably nothing.

> Is the LKP test broken or did I overlook something in the kernel
> patch?

I think the test is just randomly fluking out.

> How does LKP make use of NL80211_ATTR_REG_ALPHA2?
> =

> I'm struggling to find any mention of 'hostapd.py' or 'ap_country' in
> LKP [0].=C2=A0 Are these benchmarks bespoke add-ons? =

> =


it's running the tests from hostap:
https://w1.fi/cgit/hostap/tree/tests/hwsim

Anyway, I think we'd better fix the issue like this:

-       [NL80211_ATTR_REG_ALPHA2] =3D { .type =3D NLA_STRING, .len =3D 2 },
+       /* allow 3 for NUL-termination, we used to declare this NLA_STRING =
*/
+       [NL80211_ATTR_REG_ALPHA2] =3D NLA_POLICY_RANGE(NLA_BINARY, 2, 3),


What do you think?

johannes
--===============7821996591964681702==--

