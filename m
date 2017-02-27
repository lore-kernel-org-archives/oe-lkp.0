Content-Type: multipart/mixed; boundary="===============1878828268566663932=="
MIME-Version: 1.0
From: Tony Lindgren <tony@atomide.com>
To: lkp@lists.01.org
Subject: Re: [WARNING: A/V UNSCANNABLE][Merge tag 'media/v4.11-1' of git] ff58d005cd: BUG: unable to handle kernel NULL pointer dereference at 0000039c
Date: Mon, 27 Feb 2017 08:26:39 -0800
Message-ID: <20170227162639.GN21809@atomide.com>
In-Reply-To: <alpine.DEB.2.20.1702271712470.4732@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============1878828268566663932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

* Thomas Gleixner <tglx@linutronix.de> [170227 08:20]:
> On Mon, 27 Feb 2017, Tony Lindgren wrote:
> > * Ingo Molnar <mingo@kernel.org> [170227 07:44]:
> > > Because it's not the requirement that hurts primarily, but the result=
ing =

> > > non-determinism and the sporadic crashes. Which can be solved by maki=
ng the race =

> > > deterministic via the debug facility.
> > > =

> > > If the IRQ handler crashed the moment it was first written by the dri=
ver author =

> > > we'd never see these problems.
> > =

> > Just in case this is PM related.. Maybe the spurious interrupt is pendi=
ng
> > from earlier? This could be caused by glitches on the lines with runtim=
e PM,
> > or a pending interrupt during suspend/resume. In that case IRQ_DISABLE_=
UNLAZY
> > might provide more clues if the problem goes away.
> =

> It's not PM related.  That's just silly hardware. At the moment when you
> enable some magic bit in the control register, which is required to probe
> the version, the fricking thing spits out a spurious interrupt despite the
> interrupt enable bit in the same control register being still disabled. Of
> course we cannot install an interrupt handler before having probed the
> version and setup other stuff, except we add magic 'if (!initialized)'
> crappola into the handler and lose the ability to install version depende=
nt
> handlers afterwards.

OK and presumably no -EPROBE_DEFER happening either.

> Wonderful crap that, isn't it?

Sounds broken..

Regards,

Tony

--===============1878828268566663932==--

