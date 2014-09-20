Content-Type: multipart/mixed; boundary="===============6923936954938299740=="
MIME-Version: 1.0
From: Antti Palosaari <crope@iki.fi>
To: lkp@lists.01.org
Subject: Re: [media/dvb_usb_af9005] BUG: unable to handle kernel paging request (WAS: [media/em28xx] BUG: unable to handle kernel)
Date: Sat, 20 Sep 2014 11:18:20 +0000
Message-ID: <541D626F.9090107@iki.fi>
In-Reply-To: <541C8A26.6050207@ventoso.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6923936954938299740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Moikka!

On 09/19/2014 10:55 PM, Luca Olivetti wrote:
> El 19/09/14 21:22, Frank Sch=C3=A4fer ha escrit:
>
>>>
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
>
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

Proper fix is to remove whole home made IR decider and use common IR =

decoders in kernel nowadays... And yes, that is very old driver and at =

the time Luca made it there was no IR decoders nor whole remote =

controller framework.

regards
Antti

-- =

http://palosaari.fi/

--===============6923936954938299740==--

