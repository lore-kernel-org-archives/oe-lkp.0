Content-Type: multipart/mixed; boundary="===============5303919952419650222=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: d57108d4f6 ("watchdog/core: Get rid of the thread .."): BUG: unable to handle kernel NULL pointer dereference at 0000000000000208
Date: Sat, 16 Sep 2017 23:47:10 +0200
Message-ID: <alpine.DEB.2.20.1709162342560.2105@nanos>
In-Reply-To: <CA+55aFw+j+S4_QG-6ZR6iMc0_8AKRgceG-Sh93LNCMDkiMZFqA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5303919952419650222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 16 Sep 2017, Linus Torvalds wrote:
> On Sat, Sep 16, 2017 at 11:12 AM, Thomas Gleixner <tglx@linutronix.de> =
wrote:
> >>
> >> So I suspect your perf fix is the right one, and maybe we could/should
> >> just make people more aware of the empty cpumask issue with UP.
> >
> > Right, I just got a bit frightened as I really was not aware about that
> > 'opmtimization' which means that so far I just was lucky not to trip ov=
er
> > it.
> =

> Yeah. I can't say that I was really aware of it either in a every-day
> kind of way, it was only when I looked it up that I went "Oh, right,
> that's what we did".
> =

> So it's subtle and unexpected, and the saving grace is basically that
> empty cpumasks are really the exception to begin with. They basically
> don't happen in normal situations.

Yes and no. We get more code which uses cpumasks to store state, just like
I did, and while a lot of the cpumask functions just work as expected a
subset including for_each_cpu does not. That's confusing at best and I
rather avoid the hard to debug issues on UP, which probably gets less
testing anyway.

Thanks,

	tglx


--===============5303919952419650222==--

