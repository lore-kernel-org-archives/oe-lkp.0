Content-Type: multipart/mixed; boundary="===============8757671584312572596=="
MIME-Version: 1.0
From: Frank Schäfer <fschaefer.oss@googlemail.com>
To: lkp@lists.01.org
Subject: Re: [media/dvb_usb_af9005] BUG: unable to handle kernel paging request (WAS: [media/em28xx] BUG: unable to handle kernel)
Date: Tue, 23 Sep 2014 18:52:12 +0000
Message-ID: <5421C187.2070407@googlemail.com>
In-Reply-To: <541C8A26.6050207@ventoso.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============8757671584312572596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Am 19.09.2014 um 21:55 schrieb Luca Olivetti:
> El 19/09/14 21:22, Frank Sch=C3=A4fer ha escrit:
>
>>> So symbol_request() returns pointers.!=3D NULL
>>>
>>> A closer look at the definition of symbol_request() shows, that it does
>>> nothing if CONFIG_MODULES is disabled (it just returns its argument).
>>>
>>>
>>> One possibility to fix this bug would be to embrace these three lines w=
ith
>>>
>>> #ifdef CONFIG_DVB_USB_AF9005_REMOTE
>>> ...
>>> #endif
>> Luca, what do you think ?
>>
>> This seems to be an ancient bug, which is known at least since 5 1/2 yea=
rs:
>> https://lkml.org/lkml/2009/2/4/350
> Well, it's been a while so I don't remember the details, but I think the
> same now as then ;-)
> The idea behind CONFIG_DVB_USB_AF9005_REMOTE was to provide an
> alternative implementation (based on lirc, at the time it wasn't in the
> kernel), since this adapter doesn't decode the IR pulses by itself.
> In theory you could leave it undefined but still provide an
> implementation in a different module. Just adding
>
> #ifdef CONFIG_DVB_USB_AF9005_REMOTE
>
> would nuke the (futile?) effort.
>
> Now, since the problem seems to be with CONFIG_MODULES disabled, maybe
> you could combine both conditions
>
> #if defined(CONFIG_MODULE) || defined(CONFIG_DVB_USB_AF9005_REMOTE)
What happens, if CONFIG_MODULES is enabled, but neither module
af9005-remote nor any other IR module is available ?
Has this ever been tested ?

Regards,
Frank


--===============8757671584312572596==--

