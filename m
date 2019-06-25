Content-Type: multipart/mixed; boundary="===============4271573527960895287=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/hotplug] e1056a25da: WARNING:at_arch/x86/kernel/apic/apic.c:#setup_local_APIC
Date: Tue, 25 Jun 2019 08:24:01 +0200
Message-ID: <alpine.DEB.2.21.1906250821220.32342@nanos.tec.linutronix.de>
In-Reply-To: <58ea508f-dc2e-8537-fe96-49cca0a7c799@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4271573527960895287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Rong,

On Tue, 25 Jun 2019, Rong Chen wrote:
> On 6/22/19 3:08 AM, Thomas Gleixner wrote:
> > > =

> > > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp=
 2 -m
> > > 2G
> > I cannot reproduce that issue. What's the underlying hardware machine?
> =

> brand: Genuine Intel(R) CPU 000 @ 2.27GHz
> model: Westmere-EX
> memory: 256G
> nr_node: 4
> nr_cpu: 80

Ok. I'll try to find something similar. Can please you rerun that test on
that particular configuration with the updated branch?

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git WIP.x86/ipi

please?

Thanks,

	tglx


--===============4271573527960895287==--

