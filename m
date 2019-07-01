Content-Type: multipart/mixed; boundary="===============9096033146610589154=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/hotplug] e1056a25da: WARNING:at_arch/x86/kernel/apic/apic.c:#setup_local_APIC
Date: Mon, 01 Jul 2019 09:13:54 +0200
Message-ID: <alpine.DEB.2.21.1907010829590.1802@nanos.tec.linutronix.de>
In-Reply-To: <alpine.DEB.2.21.1906302021320.1802@nanos.tec.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============9096033146610589154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Feng,

On Sun, 30 Jun 2019, Thomas Gleixner wrote:
> On Sun, 30 Jun 2019, Feng Tang wrote:
> > On Sun, Jun 30, 2019 at 01:35:39PM +0200, Thomas Gleixner wrote:
> > > On Sat, 29 Jun 2019, Thomas Gleixner wrote:
> > > > On Fri, 28 Jun 2019, Thomas Gleixner wrote:
> > > > > On Fri, 28 Jun 2019, Feng Tang wrote:
> > > > > That function just 'works' by chance not by design. I'll stare in=
to it and
> > > > > fix it up for real.
> > > > > =

> > > > > Thank you very much for that information. Your debug was spot on!
> > > > =

> > > > I rewrote that function so it actually handles that case correctly =
along
> > > > with some other things which were broken and force pushed the WIP.x=
86/ipi
> > > > branch.
> > > > =

> > > > Can you please run exactly that test again against that new version=
 and
> > > > verify that this is fixed now?
> > > =

> > > Just found another issue with that thing. Don't waste your time on it=
. I'll
> > > come back to you when I'm done.
> > =

> > Ok. I noticed that the ipi branch has been merged to tip/master.
> =

> Yes, but it will be zapped there as well.

In case you still have your debug version (that old tree which triggered
the warn) around, could you please run that again and add

    'lapic=3Dnotscdeadline'

to the kernel command line please?

Thanks,

	tglx

--===============9096033146610589154==--

