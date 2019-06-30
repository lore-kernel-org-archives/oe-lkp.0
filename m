Content-Type: multipart/mixed; boundary="===============7490973418475942435=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/hotplug] e1056a25da: WARNING:at_arch/x86/kernel/apic/apic.c:#setup_local_APIC
Date: Sun, 30 Jun 2019 13:35:39 +0200
Message-ID: <alpine.DEB.2.21.1906301334290.1802@nanos.tec.linutronix.de>
In-Reply-To: <alpine.DEB.2.21.1906290912390.1802@nanos.tec.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============7490973418475942435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 29 Jun 2019, Thomas Gleixner wrote:
> On Fri, 28 Jun 2019, Thomas Gleixner wrote:
> > On Fri, 28 Jun 2019, Feng Tang wrote:
> > That function just 'works' by chance not by design. I'll stare into it =
and
> > fix it up for real.
> > =

> > Thank you very much for that information. Your debug was spot on!
> =

> I rewrote that function so it actually handles that case correctly along
> with some other things which were broken and force pushed the WIP.x86/ipi
> branch.
> =

> Can you please run exactly that test again against that new version and
> verify that this is fixed now?

Just found another issue with that thing. Don't waste your time on it. I'll
come back to you when I'm done.

Thanks,

	tglx

--===============7490973418475942435==--

