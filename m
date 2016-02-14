Content-Type: multipart/mixed; boundary="===============2300253717784063057=="
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
To: lkp@lists.01.org
Subject: Re: [gpio] 3c702e9987: kmsg.user_verbs:couldn't_register_device_number
Date: Sun, 14 Feb 2016 18:48:37 +0100
Message-ID: <CACRpkdaNMAvFjbZd6MjS_NvTu5KjgKMRZ-Y9m+h2VfkRnJzUSQ@mail.gmail.com>
In-Reply-To: <20160214080643.GA31304@qwerty.qwertyembedded>
List-Id: <oe-lkp.lists.linux.dev>

--===============2300253717784063057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 14, 2016 at 9:06 AM, Michael Welling <mwelling@ieee.org> wrot=
e:

> enum {
>         IB_UVERBS_MAJOR       =3D 231,
>         IB_UVERBS_BASE_MINOR  =3D 192,
>         IB_UVERBS_MAX_DEVICES =3D 32
> };
>
> #define IB_UVERBS_BASE_DEV      MKDEV(IB_UVERBS_MAJOR, IB_UVERBS_BASE_MIN=
OR)
>
> Something tells me that a new GPIO chardev is taking this spot.

I don't think so, since gpio is reserving it as a core_initcall() it
gets a high chardev major. It's likely the device that used to
be device 232 stealing the fingerprint sensor slot that got
pushed down and is now stealing device 231 infiniband.

Maybe I should make a patch making fs/char_dev.c emit a warning
or fail when it goes below 234... it doesn't currently. It just steals
more numbers. It's a serious archtectural issue if it persists.

Yours,
Linus Walleij

--===============2300253717784063057==--

