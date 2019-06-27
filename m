Content-Type: multipart/mixed; boundary="===============6166312815825610264=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/hotplug] e1056a25da: WARNING:at_arch/x86/kernel/apic/apic.c:#setup_local_APIC
Date: Thu, 27 Jun 2019 16:26:24 +0200
Message-ID: <alpine.DEB.2.21.1906271615310.32342@nanos.tec.linutronix.de>
In-Reply-To: <4b9cec2c-2bbe-1ea2-b4c9-35ce24ebd06f@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6166312815825610264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Rong, Fengguang,

On Wed, 26 Jun 2019, Rong Chen wrote:
> On 6/25/19 7:32 PM, Thomas Gleixner wrote:
> > > I have tested commit e0b179bc1a ("x86/apic/x2apic: Add conditional IPI
> > > shorthands support"), the problem is still exist.
> > the head of that branch is:
> > =

> >        4f3f6d6a7f8e ("x86/apic/x2apic: Add conditional IPI shorthands
> > support")
> > =

> > This is WIP and force pushed. There are no incremental changes. Could y=
ou
> > please check again?
> =

> The problem is still exist.

I went through hoops and loops to get that lkp muck running, but as many
different machines I tried on it never reproduced.

So I need a bit of help from you folks. Can you please provide me:

   1) The exact host kernel version
   2) The config file
   3) The exact kvm-qemu version

Also it would be interesting whether 4f3f6d6a7f8e from that WIP.x86/ipi
branch in tip has the same issue on other host machines.

Another data point would be whether it depends on a particular compiler
version.
      =

Thanks in advance,

	tglx

P.S: the instructions for reproducing the issue in that robot mail are
incomplete because there is no information how to bring the module into
that initrd... I somehow figured it out.

--===============6166312815825610264==--

