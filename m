Content-Type: multipart/mixed; boundary="===============3204990728567196809=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/hotplug] e1056a25da: WARNING:at_arch/x86/kernel/apic/apic.c:#setup_local_APIC
Date: Sun, 30 Jun 2019 20:21:57 +0200
Message-ID: <alpine.DEB.2.21.1906302021320.1802@nanos.tec.linutronix.de>
In-Reply-To: <20190630130347.GB93752@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3204990728567196809==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 30 Jun 2019, Feng Tang wrote:
> On Sun, Jun 30, 2019 at 01:35:39PM +0200, Thomas Gleixner wrote:
> > On Sat, 29 Jun 2019, Thomas Gleixner wrote:
> > > On Fri, 28 Jun 2019, Thomas Gleixner wrote:
> > > > On Fri, 28 Jun 2019, Feng Tang wrote:
> > > > That function just 'works' by chance not by design. I'll stare into=
 it and
> > > > fix it up for real.
> > > > =

> > > > Thank you very much for that information. Your debug was spot on!
> > > =

> > > I rewrote that function so it actually handles that case correctly al=
ong
> > > with some other things which were broken and force pushed the WIP.x86=
/ipi
> > > branch.
> > > =

> > > Can you please run exactly that test again against that new version a=
nd
> > > verify that this is fixed now?
> > =

> > Just found another issue with that thing. Don't waste your time on it. =
I'll
> > come back to you when I'm done.
> =

> Ok. I noticed that the ipi branch has been merged to tip/master.

Yes, but it will be zapped there as well.

Thanks,

	tglx

--===============3204990728567196809==--

