Content-Type: multipart/mixed; boundary="===============5717700552611106583=="
MIME-Version: 1.0
From: Luca Olivetti <luca@ventoso.org>
To: lkp@lists.01.org
Subject: Re: [media/dvb_usb_af9005] BUG: unable to handle kernel paging request (WAS: [media/em28xx] BUG: unable to handle kernel)
Date: Thu, 25 Sep 2014 15:57:48 +0000
Message-ID: <54243B6B.9000102@ventoso.org>
In-Reply-To: <54241E7D.3050201@googlemail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5717700552611106583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

El 25/09/14 15:54, Frank Sch=C3=A4fer ha escrit:
> =

> Am 23.09.2014 um 23:03 schrieb Luca Olivetti:
>> El 23/09/14 20:52, Frank Sch=C3=A4fer ha escrit:
>>
>>>>> This seems to be an ancient bug, which is known at least since 5 1/2 =
years:
>>>>> https://lkml.org/lkml/2009/2/4/350
>> [...]
>>>> #if defined(CONFIG_MODULE) || defined(CONFIG_DVB_USB_AF9005_REMOTE)
>>> What happens, if CONFIG_MODULES is enabled, but neither module
>>> af9005-remote nor any other IR module is available ?
>>> Has this ever been tested ?
>> I think I tested at the time and symbol_request returned NULL in that
>> case, however I'm not sure and I cannot find any documentation on how
>> symbol_request is supposed to work in that case.
> =

> Ok, thanks.
> I assume noone wants to invest some time into this old driver and covert
> it to todays kernel IR infrastructure as suggested by Antti ? :-)

Not me ;-)

> Then I'm going to send a patch with the =

> =

> #if defined(CONFIG_MODULE) || defined(CONFIG_DVB_USB_AF9005_REMOTE)
> =

> approach.
> That's at least better than leaving the bug unfixed.

Yes, it's an acceptable workaround until the bug in symbol_request is
fixed (because the bug actually is in symbol_request, isn't it?)

Bye
-- =

Luca

--===============5717700552611106583==--

