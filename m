Content-Type: multipart/mixed; boundary="===============3865838016454886866=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/hotplug] e1056a25da: WARNING:at_arch/x86/kernel/apic/apic.c:#setup_local_APIC
Date: Mon, 01 Jul 2019 11:26:10 +0200
Message-ID: <alpine.DEB.2.21.1907011123220.1802@nanos.tec.linutronix.de>
In-Reply-To: <20190701083654.GB12486@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3865838016454886866==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Feng,

On Mon, 1 Jul 2019, Feng Tang wrote:
> On Mon, Jul 01, 2019 at 09:13:54AM +0200, Thomas Gleixner wrote:
> > On Sun, 30 Jun 2019, Thomas Gleixner wrote:
> > In case you still have your debug version (that old tree which triggered
> > the warn) around, could you please run that again and add
> > =

> >     'lapic=3Dnotscdeadline'
> > =

> > to the kernel command line please?
> =

> After adding the boot paramter, the result is the same. The dmesg is atta=
ched.

thanks for running that. I'm still puzzled by this.

I've updated my machine to roughly match your setup but I'm still unable to
reproduce.

Is there anything special on the host kernel configuration? Can you provide
me that please?

Thanks,

	tglx



--===============3865838016454886866==--

