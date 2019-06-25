Content-Type: multipart/mixed; boundary="===============0220738874302017727=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/hotplug] e1056a25da: WARNING:at_arch/x86/kernel/apic/apic.c:#setup_local_APIC
Date: Tue, 25 Jun 2019 13:32:03 +0200
Message-ID: <alpine.DEB.2.21.1906251330330.32342@nanos.tec.linutronix.de>
In-Reply-To: <f5c36f89-61bf-a82e-3d3b-79720b2da2ef@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0220738874302017727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Rong,

On Tue, 25 Jun 2019, Rong Chen wrote:
> On 6/25/19 2:24 PM, Thomas Gleixner wrote:
> > > On 6/22/19 3:08 AM, Thomas Gleixner wrote:
> > > > > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge =
-smp
> > > > > 2 -m
> > > > > 2G
> > > > I cannot reproduce that issue. What's the underlying hardware machi=
ne?
> > > brand: Genuine Intel(R) CPU 000 @ 2.27GHz
> > > model: Westmere-EX
> > > memory: 256G
> > > nr_node: 4
> > > nr_cpu: 80
> > Ok. I'll try to find something similar. Can please you rerun that test =
on
> > that particular configuration with the updated branch?
> > =

> >     git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git WIP.x86/i=
pi
> > =

> I have tested commit e0b179bc1a ("x86/apic/x2apic: Add conditional IPI
> shorthands support"), the problem is still exist.

the head of that branch is:

      4f3f6d6a7f8e ("x86/apic/x2apic: Add conditional IPI shorthands suppor=
t")

This is WIP and force pushed. There are no incremental changes. Could you
please check again?

Thanks,

	tglx

--===============0220738874302017727==--

