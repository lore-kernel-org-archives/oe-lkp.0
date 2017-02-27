Content-Type: multipart/mixed; boundary="===============1531830823802657647=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [WARNING: A/V UNSCANNABLE][Merge tag 'media/v4.11-1' of git] ff58d005cd: BUG: unable to handle kernel NULL pointer dereference at 0000039c
Date: Mon, 27 Feb 2017 17:18:28 +0100
Message-ID: <alpine.DEB.2.20.1702271712470.4732@nanos>
In-Reply-To: <20170227160750.GM21809@atomide.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1531830823802657647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 27 Feb 2017, Tony Lindgren wrote:
> * Ingo Molnar <mingo@kernel.org> [170227 07:44]:
> > Because it's not the requirement that hurts primarily, but the resultin=
g =

> > non-determinism and the sporadic crashes. Which can be solved by making=
 the race =

> > deterministic via the debug facility.
> > =

> > If the IRQ handler crashed the moment it was first written by the drive=
r author =

> > we'd never see these problems.
> =

> Just in case this is PM related.. Maybe the spurious interrupt is pending
> from earlier? This could be caused by glitches on the lines with runtime =
PM,
> or a pending interrupt during suspend/resume. In that case IRQ_DISABLE_UN=
LAZY
> might provide more clues if the problem goes away.

It's not PM related.  That's just silly hardware. At the moment when you
enable some magic bit in the control register, which is required to probe
the version, the fricking thing spits out a spurious interrupt despite the
interrupt enable bit in the same control register being still disabled. Of
course we cannot install an interrupt handler before having probed the
version and setup other stuff, except we add magic 'if (!initialized)'
crappola into the handler and lose the ability to install version dependent
handlers afterwards.

Wonderful crap that, isn't it?

Thanks,

	tglx

--===============1531830823802657647==--

