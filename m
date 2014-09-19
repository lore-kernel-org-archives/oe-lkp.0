Content-Type: multipart/mixed; boundary="===============6118722284618909279=="
MIME-Version: 1.0
From: Luca Olivetti <luca@ventoso.org>
To: lkp@lists.01.org
Subject: Re: [media/dvb_usb_af9005] BUG: unable to handle kernel paging request (WAS: [media/em28xx] BUG: unable to handle kernel)
Date: Fri, 19 Sep 2014 19:55:33 +0000
Message-ID: <541C8A26.6050207@ventoso.org>
In-Reply-To: <541C826D.7060702@googlemail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6118722284618909279==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

El 19/09/14 21:22, Frank Sch=C3=A4fer ha escrit:

>>
>> So symbol_request() returns pointers.!=3D NULL
>>
>> A closer look at the definition of symbol_request() shows, that it does
>> nothing if CONFIG_MODULES is disabled (it just returns its argument).
>>
>>
>> One possibility to fix this bug would be to embrace these three lines wi=
th
>>
>> #ifdef CONFIG_DVB_USB_AF9005_REMOTE
>> ...
>> #endif
> Luca, what do you think ?
> =

> This seems to be an ancient bug, which is known at least since 5 1/2 year=
s:
> https://lkml.org/lkml/2009/2/4/350

Well, it's been a while so I don't remember the details, but I think the
same now as then ;-)
The idea behind CONFIG_DVB_USB_AF9005_REMOTE was to provide an
alternative implementation (based on lirc, at the time it wasn't in the
kernel), since this adapter doesn't decode the IR pulses by itself.
In theory you could leave it undefined but still provide an
implementation in a different module. Just adding

#ifdef CONFIG_DVB_USB_AF9005_REMOTE

would nuke the (futile?) effort.

Now, since the problem seems to be with CONFIG_MODULES disabled, maybe
you could combine both conditions

#if defined(CONFIG_MODULE) || defined(CONFIG_DVB_USB_AF9005_REMOTE)

Bye
-- =

Luca


--===============6118722284618909279==--

