Content-Type: multipart/mixed; boundary="===============3388930708179523600=="
MIME-Version: 1.0
From: Wolfram Sang <wsa@the-dreams.de>
To: lkp@lists.01.org
Subject: Re: [PATCH v1] i2c: busses: convert to devm_platform_get_and_ioremap_resource
Date: Mon, 20 Apr 2020 11:57:15 +0200
Message-ID: <20200420095715.GB2094@ninjato>
In-Reply-To: <CAHp75VeGNV-Jsyu1ev843GzBuJqwojfDcbC5H9MJokurrQLjjg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3388930708179523600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> > > 6. Fix ioremap(..., 0) [size =3D 0] across architectures, now some re=
turn NULL,
> > >    some return address, some may even have leaks
> >
> > This sounds more useful to me. Would be great if you have interest.
> =

> But it much more advanced :-) Complete dive into the kernel guts.

Well, learning by doing :) Dejin seems interested...


--===============3388930708179523600==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUFCQ2dBZEZpRUVPWkd4NnJuaVox
R2s5MlJkRkEza3pCU2dLYllGQWw2ZGNmc0FDZ2tRRkEza3pCU2cKS2JZZmFnLy9kZFNTZlMvVEFp
TkwybkhuQWpvcXh3YzBxRTdKNmZZaWg5amEzOGltREk2YUh2SjdzMGpLcEhPVwpRNXR6V3BES012
dEVRTGhpSVZlM203c205M1VnRWNvNHc0STNaYm94VUdwUktNbkNBZmRPeVBoNU9UUHA0aExsClB2
YVBHZmxJMUxGdHdmcXpDdmZOKzloeWhtVFJiWGtidEdiZ3U1cUs3UDd6N0JqRFo1YnhGOGdUL04x
aHlIMzAKaWdXUzAvZkNLZmZJSmhQSDIrcnlad2IwZkp5L01sYkUrc1k0K2gxR0VPSXJkTFdsSWlR
ak05ZEg2VHU0WmFLaApmUnpMRnVvR2RzdVNOMWJaTkMvbnI1c0NyV09Yc0wrRnVIdVlEdnQvTVN5
ajJQWXM5OW9RMU5mRmc2bStYcVcrCjdzbU42c0k5RzRWUVlvckV4S0hzQnJuZjZxSUFhZVZWTi9H
RFZJWWZwWmhCNEdHa0d4dEZUbXJ3b0VZWWJXRmIKT1JMWEFKTHZhOEdOTHgybTRFUTU4YTJSWXdI
d3dQVTlQTnlPeHVPeWxGTmlDb2k3TmNYdS80NStVaHUySk1heApqNjJOdy9hN2JaalFoZlZQNjZE
ZDk5NVhzeXllQklkRUI5RUhsV1g2cy9OMGt4YUQ2aFlVeFQvTjFaT1JaTmRqCld5VDFic2R4TGFk
SXd4Sm82cFZGc3hPZzNVT2pDNDJYOHVRK3N2Q2h0L3dJeXhqTzZTdUZ5TEw4N2ZMUFZnMGwKSjRs
VS9qTm1TWmNWLzZSWitPZEVFYlY5RHJUd3dNUVNic1VUaEIxYXVlYmlxeUNtdVErcjUxdERhdTFj
STB0SQpTSmhEeTVMZ0VUKytlT3IwempsNDY2aDNOSUI5bTFPYklyMXp5UmZrRFQzVFdDWW5ZR1k9
Cj1mVE42Ci0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============3388930708179523600==--

