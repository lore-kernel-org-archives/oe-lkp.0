Content-Type: multipart/mixed; boundary="===============2659849233622970547=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: lkp@lists.01.org
Subject: Re: [console_unlock] BUG: KASAN: use-after-scope in console_unlock+0x9cd/0xd10
Date: Thu, 19 Apr 2018 15:20:50 +0900
Message-ID: <20180419062050.GA8683@jagdpanzerIV>
In-Reply-To: <CACT4Y+bmYk_A4NcOhCeHcG4t5_c=Q1fmQOPxHLtC8G0hLrxSLA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2659849233622970547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (04/19/18 08:04), Dmitry Vyukov wrote:
[..]
> We could also make them mutually exclusive in config to prevent people
> from hitting these false positives again and again.

Let's do it. Ard and Kees agreed on making them mutually exclusive [1][2].
Dmitry, could send out a patch?

[1] lkml.kernel.org/r/CAKv+Gu8HN-t2om8sCfjxCWbsgSir54fZw222dsed0Xwqph2aNg(a=
)mail.gmail.com
[2] lkml.kernel.org/r/CAGXu5j+mcfo4aB3PM1We6O62bFBJcMFX-9obJE4jFU1Dp=3DgNwg=
(a)mail.gmail.com

	-ss

--===============2659849233622970547==--

