Content-Type: multipart/mixed; boundary="===============1294049888935941732=="
MIME-Version: 1.0
From: Tony Lindgren <tony@atomide.com>
To: lkp@lists.01.org
Subject: Re: [WARNING: A/V UNSCANNABLE][Merge tag 'media/v4.11-1' of git] ff58d005cd: BUG: unable to handle kernel NULL pointer dereference at 0000039c
Date: Mon, 27 Feb 2017 08:07:51 -0800
Message-ID: <20170227160750.GM21809@atomide.com>
In-Reply-To: <20170227154124.GA20569@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1294049888935941732==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

* Ingo Molnar <mingo@kernel.org> [170227 07:44]:
> =

> * Thomas Gleixner <tglx@linutronix.de> wrote:
> =

> > The pending interrupt issue happens, at least on my test boxen, mostly =
on
> > the 'legacy' interrupts (0 - 15). But even the IOAPIC interrupts >=3D16
> > happen occasionally.
> >
> > =

> >  - Spurious interrupts on IRQ7, which are triggered by IRQ 0 (PIT/HPET)=
. On
> >    one of the affected machines this stops when the interrupt system is
> >    switched to interrupt remapping !?!?!?
> > =

> >  - Spurious interrupts on various interrupt lines, which are triggered =
by
> >    IOAPIC interrupts >=3D IRQ16. That's a known issue on quite some chi=
psets
> >    that the legacy PCI interrupt (which is used when IOAPIC is disabled=
) is
> >    triggered when the IOAPIC >=3D16 interrupt fires.
> > =

> >  - Spurious interrupt caused by driver probing itself. I.e. the driver
> >    probing code causes an interrupt issued from the device
> >    inadvertently. That happens even on IRQ >=3D 16.

This sounds a lot like what we saw few weeks ago with dwc3. See commit
12a7f17fac5b ("usb: dwc3: omap: fix race of pm runtime with irq handler in
probe"). It was caused by runtime PM and -EPROBE_DEFER, see the description
Grygorii wrote up in that commit.

> >    This problem might be handled by the device driver code itself, but
> >    that's going to be ugly. See below.
> =

> That's pretty colorful behavior...
> =

> > We can try to sample more data from the machines of affected users, but=
 I doubt =

> > that it will give us more information than confirming that we really ha=
ve to =

> > deal with all that hardware wreckage out there in some way or the other.
> =

> BTW., instead of trying to avoid the scenario, wow about moving in the ot=
her =

> direction: making CONFIG_DEBUG_SHIRQ=3Dy unconditional property in the IR=
Q core code =

> starting from v4.12 or so, i.e. requiring device driver IRQ handlers to h=
andle the =

> invocation of IRQ handlers at pretty much any moment. (We could also exte=
nd it a =

> bit, such as invoking IRQ handlers early after suspend/resume wakeup.)
> =

> Because it's not the requirement that hurts primarily, but the resulting =

> non-determinism and the sporadic crashes. Which can be solved by making t=
he race =

> deterministic via the debug facility.
> =

> If the IRQ handler crashed the moment it was first written by the driver =
author =

> we'd never see these problems.

Just in case this is PM related.. Maybe the spurious interrupt is pending
from earlier? This could be caused by glitches on the lines with runtime PM,
or a pending interrupt during suspend/resume. In that case IRQ_DISABLE_UNLA=
ZY
might provide more clues if the problem goes away.

Regards,

Tony

--===============1294049888935941732==--

