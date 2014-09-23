Content-Type: multipart/mixed; boundary="===============9220854432046417219=="
MIME-Version: 1.0
From: Luca Olivetti <luca@ventoso.org>
To: lkp@lists.01.org
Subject: Re: [media/dvb_usb_af9005] BUG: unable to handle kernel paging request (WAS: [media/em28xx] BUG: unable to handle kernel)
Date: Tue, 23 Sep 2014 21:03:25 +0000
Message-ID: <5421E00B.2050404@ventoso.org>
In-Reply-To: <5421C187.2070407@googlemail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9220854432046417219==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

El 23/09/14 20:52, Frank Sch=C3=A4fer ha escrit:

>>> This seems to be an ancient bug, which is known at least since 5 1/2 ye=
ars:
>>> https://lkml.org/lkml/2009/2/4/350
[...]
>>
>> #if defined(CONFIG_MODULE) || defined(CONFIG_DVB_USB_AF9005_REMOTE)
> What happens, if CONFIG_MODULES is enabled, but neither module
> af9005-remote nor any other IR module is available ?
> Has this ever been tested ?

I think I tested at the time and symbol_request returned NULL in that
case, however I'm not sure and I cannot find any documentation on how
symbol_request is supposed to work in that case.

Bye
-- =

Luca


--===============9220854432046417219==--

