Content-Type: multipart/mixed; boundary="===============8395856698696518605=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86, irq, ACPI] 5fcb864ef90: -3.3%(vm-scalability.throughput) +12.9%(turbostat.%c0)
Date: Mon, 24 Nov 2014 09:41:55 +0100
Message-ID: <alpine.DEB.2.11.1411240939340.6439@nanos>
In-Reply-To: <20141124025141.GA7310@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8395856698696518605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 24 Nov 2014, Yuanhan Liu wrote:
> =

> We noticed the below changes on(NOTE: I'm not sure the bisect is correct
> or not, here I report it out JFYI).
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 5fcb864ef90df093d964171539c87ffa0ab49f0f ("x86, irq, ACPI: Impleme=
nt interfaces to support ACPI based IOAPIC hot-removal")
> =


I really doubt that this commit has anything to do with the observed
behaviour change.

The code in question is only executed at boot time or when a IOAPIC is
physically hotplugged.

Thanks,

	tglx

--===============8395856698696518605==--

