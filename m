Content-Type: multipart/mixed; boundary="===============1476874312332415531=="
MIME-Version: 1.0
From: Andi Kleen <ak@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8c30ace35d: WARNING:at_kernel/time/clocksource.c:#clocksource_watchdog
Date: Thu, 29 Apr 2021 16:04:11 -0700
Message-ID: <20210429230411.GK4032392@tassilo.jf.intel.com>
In-Reply-To: <87lf91f177.ffs@nanos.tec.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============1476874312332415531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> > The idea is to leave the watchdog code in kernel/time/clocksource.c,
> > but to move the fault injection into kernel/time/clocksourcefault.c or
> > some such.  In this new file, new clocksource structures are created th=
at
> > use some existing timebase/clocksource under the covers.  These then
> > inject delays based on module parameters (one senstive to CPU number,
> > the other unconditional).  They register these clocksources using the
> > normal interfaces, and verify that they are eventually marked unstable
> > when the fault-injection parameters warrant it.  This is combined with
> > the usual checking of the console log.
> >
> > Or am I missing your point?
> =

> That's what I meant.

I still think all this stuff should be in the fault injection framework,
like other fault injections, to have a consistent discoverable interface. =


I actually checked now and the standard fault injection supports boot argum=
ents,
so needing it at boot time shouldn't be a barrier.

-Andi
--===============1476874312332415531==--

