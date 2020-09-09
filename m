Content-Type: multipart/mixed; boundary="===============6022722409594783991=="
MIME-Version: 1.0
From: Bjorn Helgaas <helgaas@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PCI] 3233e41d3e: WARNING:at_drivers/pci/pci.c:#pci_reset_hotplug_slot
Date: Wed, 09 Sep 2020 15:40:57 -0500
Message-ID: <20200909204057.GA724236@bjorn-Precision-5520>
In-Reply-To: <20200723095152.nf3fmfzrjlpoi35h@wunner.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============6022722409594783991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2020 at 11:51:52AM +0200, Lukas Wunner wrote:
> On Thu, Jul 23, 2020 at 05:13:06PM +0800, kernel test robot wrote:
> > FYI, we noticed the following commit (built with gcc-9):
> [...]
> > commit: 3233e41d3e8ebcd44e92da47ffed97fd49b84278 ("[PATCH] PCI: pciehp:=
 Fix AB-BA deadlock between reset_lock and device_lock")
> [...]
> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> > [    0.971752] WARNING: CPU: 0 PID: 1 at drivers/pci/pci.c:4905 pci_res=
et_hotplug_slot+0x70/0x80
> =

> Thank you, trusty robot.
> =

> I botched the call to lockdep_assert_held_write(), it should have been
> conditional on "if (probe)".
> =

> Happy to respin the patch, but I'd like to hear opinions on the locking
> issues surrounding xen and octeon (and the patch in general).

I wish liquidio/octeon weren't a special case.  Why should that driver
reset the device when unbinding when no other drivers do?

Looks like this was added by 70535350e26f ("liquidio: with embedded
f/w, don't reload f/w, issue pf flr at exit").  Maybe Rick will chime
in.

> In particular, would a solution be entertained wherein the pci_dev is
> reset by the PCI core after driver unbinding, contingent on a flag which
> is set by a PCI driver to indicate that the pci_dev is returned to the
> core in an unclean state?

How would we do this?  The PCI core isn't called after unbinding, is
it?  So I guess we'd have to have a queue and a worker thread to
process it?

Device removal also has nasty locking issues, and a queue might help
solve those, too.  Might also help in the problematic case of
40f11adc7cd9 ("PCI: Avoid race while enabling upstream bridges"),
which we had to revert.

> Also, why does xen require a device reset on bind?
> =

> Thanks!
> =

> Lukas
--===============6022722409594783991==--

