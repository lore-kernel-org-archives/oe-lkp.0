Content-Type: multipart/mixed; boundary="===============8383345738295136570=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [WARNING: A/V UNSCANNABLE][Merge tag 'media/v4.11-1' of git] ff58d005cd: BUG: unable to handle kernel NULL pointer dereference at 0000039c
Date: Mon, 27 Feb 2017 16:41:24 +0100
Message-ID: <20170227154124.GA20569@gmail.com>
In-Reply-To: <alpine.DEB.2.20.1702271231410.4732@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============8383345738295136570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Thomas Gleixner <tglx@linutronix.de> wrote:

> The pending interrupt issue happens, at least on my test boxen, mostly on
> the 'legacy' interrupts (0 - 15). But even the IOAPIC interrupts >=3D16
> happen occasionally.
>
> =

>  - Spurious interrupts on IRQ7, which are triggered by IRQ 0 (PIT/HPET). =
On
>    one of the affected machines this stops when the interrupt system is
>    switched to interrupt remapping !?!?!?
> =

>  - Spurious interrupts on various interrupt lines, which are triggered by
>    IOAPIC interrupts >=3D IRQ16. That's a known issue on quite some chips=
ets
>    that the legacy PCI interrupt (which is used when IOAPIC is disabled) =
is
>    triggered when the IOAPIC >=3D16 interrupt fires.
> =

>  - Spurious interrupt caused by driver probing itself. I.e. the driver
>    probing code causes an interrupt issued from the device
>    inadvertently. That happens even on IRQ >=3D 16.
> =

>    This problem might be handled by the device driver code itself, but
>    that's going to be ugly. See below.

That's pretty colorful behavior...

> We can try to sample more data from the machines of affected users, but I=
 doubt =

> that it will give us more information than confirming that we really have=
 to =

> deal with all that hardware wreckage out there in some way or the other.

BTW., instead of trying to avoid the scenario, wow about moving in the othe=
r =

direction: making CONFIG_DEBUG_SHIRQ=3Dy unconditional property in the IRQ =
core code =

starting from v4.12 or so, i.e. requiring device driver IRQ handlers to han=
dle the =

invocation of IRQ handlers at pretty much any moment. (We could also extend=
 it a =

bit, such as invoking IRQ handlers early after suspend/resume wakeup.)

Because it's not the requirement that hurts primarily, but the resulting =

non-determinism and the sporadic crashes. Which can be solved by making the=
 race =

deterministic via the debug facility.

If the IRQ handler crashed the moment it was first written by the driver au=
thor =

we'd never see these problems.

Thanks,

	Ingo

--===============8383345738295136570==--

