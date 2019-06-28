Content-Type: multipart/mixed; boundary="===============1398583412297130221=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/hotplug] e1056a25da: WARNING:at_arch/x86/kernel/apic/apic.c:#setup_local_APIC
Date: Fri, 28 Jun 2019 11:19:08 +0200
Message-ID: <alpine.DEB.2.21.1906280929010.32342@nanos.tec.linutronix.de>
In-Reply-To: <20190628063231.GA7766@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1398583412297130221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Feng,

On Fri, 28 Jun 2019, Feng Tang wrote:
> On Tue, Jun 25, 2019 at 07:32:03PM +0800, Thomas Gleixner wrote:
> > the head of that branch is:
> > =

> >       4f3f6d6a7f8e ("x86/apic/x2apic: Add conditional IPI shorthands su=
pport")
> > =

> > This is WIP and force pushed. There are no incremental changes. Could y=
ou
> > please check again?
> =

> Since you can't reproduce it yet, we've added some debug hook to get more
> info, like dmesg below:
> =

> [  288.866069] IRR[7]: 0x1000
> [  289.890274] WARNING: CPU: 0 PID: 0 at arch/x86/kernel/apic/apic.c:1502=
 setup_local_APIC+0x2d1/0x4f0

> [  290.182418] queued =3D 0x1000 acked =3D 0
> [  290.189159] IRR[7]: 0x1000
> =

> Which shows the IRR[7] was set 0x1000, IIUC, it means vector
> 0xec, which is for LAPIC timer, and ISRs are all 0 before and
> after the loop.

Ahhhh. That makes a lot of sense now.

That interrupt is in the IRR, but not in the ISR. So the acknowledge
attempts are useless because the ack only clears an pending ISR and the IRR
is not propagated because in the state in which this happens the entry is
masked.

That function just 'works' by chance not by design. I'll stare into it and
fix it up for real.

Thank you very much for that information. Your debug was spot on!

      tglx

--===============1398583412297130221==--

