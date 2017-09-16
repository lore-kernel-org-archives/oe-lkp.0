Content-Type: multipart/mixed; boundary="===============1356688489401700017=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: d57108d4f6 ("watchdog/core: Get rid of the thread .."): BUG: unable to handle kernel NULL pointer dereference at 0000000000000208
Date: Sat, 16 Sep 2017 11:23:50 -0700
Message-ID: <CA+55aFw+j+S4_QG-6ZR6iMc0_8AKRgceG-Sh93LNCMDkiMZFqA@mail.gmail.com>
In-Reply-To: <alpine.DEB.2.20.1709162005270.2105@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============1356688489401700017==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 16, 2017 at 11:12 AM, Thomas Gleixner <tglx@linutronix.de> wr=
ote:
>>
>> So I suspect your perf fix is the right one, and maybe we could/should
>> just make people more aware of the empty cpumask issue with UP.
>
> Right, I just got a bit frightened as I really was not aware about that
> 'opmtimization' which means that so far I just was lucky not to trip over
> it.

Yeah. I can't say that I was really aware of it either in a every-day
kind of way, it was only when I looked it up that I went "Oh, right,
that's what we did".

So it's subtle and unexpected, and the saving grace is basically that
empty cpumasks are really the exception to begin with. They basically
don't happen in normal situations.

               Linus

--===============1356688489401700017==--

