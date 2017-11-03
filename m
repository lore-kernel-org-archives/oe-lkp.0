Content-Type: multipart/mixed; boundary="===============7847701770091193992=="
MIME-Version: 1.0
From: Alan Stern <stern@rowland.harvard.edu>
To: lkp@lists.01.org
Subject: Re: 7be10517c2 ("USB: dummy-hcd: Adapt dummy_udc_set_speed()"): BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Fri, 03 Nov 2017 13:42:18 -0400
Message-ID: <Pine.LNX.4.44L0.1711031335531.1743-100000@iolanthe.rowland.org>
In-Reply-To: <4238b0b8-0239-53ab-0632-47a0438d39ef@ti.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7847701770091193992==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 3 Nov 2017, Roger Quadros wrote:

> Hi,
> =

> On 03/11/17 00:01, kernel test robot wrote:
> > Greetings,
> > =

> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> > =

> > https://github.com/0day-ci/linux/commits/Roger-Quadros/USB-dummy-hcd-Ad=
apt-dummy_udc_set_speed/20171103-045118
> > =

> > commit 7be10517c266766e46572d60e7c4b3876d461c0c
> > Author:     Roger Quadros <rogerq@ti.com>
> > AuthorDate: Thu Nov 2 11:09:17 2017 +0200
> > Commit:     0day robot <fengguang.wu@intel.com>
> > CommitDate: Fri Nov 3 04:51:20 2017 +0800
> > =

> >     USB: dummy-hcd: Adapt dummy_udc_set_speed()
> >     =

> >     The UDC core ensures that .udc_set_speed() is called with
> >     a speed that is a minimum of the max speeds supported
> >     by the gadget function driver and the UDC driver.
> >     =

> >     We can now use the speed argument as is.
> >     =

> >     Get rid of the debug print as that condition will never happen.
> >     =

> >     Signed-off-by: Roger Quadros <rogerq@ti.com>
> > =

> > ce2b21a4e5  usb: dwc2: Fix UDC state tracking
> > 7be10517c2  USB: dummy-hcd: Adapt dummy_udc_set_speed()
> > +------------------------------------------+------------+------------+
> > |                                          | ce2b21a4e5 | 7be10517c2 |
> > +------------------------------------------+------------+------------+
> > | boot_successes                           | 33         | 0          |
> > | boot_failures                            | 0          | 13         |
> > | BUG:unable_to_handle_kernel              | 0          | 13         |
> > | Oops:#[##]                               | 0          | 13         |
> > | RIP:dummy_set_selfpowered                | 0          | 13         |
> > | Kernel_panic-not_syncing:Fatal_exception | 0          | 13         |
> > +------------------------------------------+------------+------------+
> > =

> > [    4.740314] usb usb1: Product: Dummy host controller
> > [    4.740866] usb usb1: Manufacturer: Linux 4.14.0-rc4-00052-g7be1051 =
dummy_hcd
> > [    4.741660] usb usb1: SerialNumber: dummy_hcd.0
> > [    4.742575] hub 1-0:1.0: USB hub found
> > [    4.743043] hub 1-0:1.0: 1 port detected
> > [    4.744153] BUG: unable to handle kernel NULL pointer dereference at=
           (null)
> > [    4.745027] IP: dummy_set_selfpowered+0x34/0x4f
> =

> Any idea why that might be happening?

It looks like the problem is in the gadget_to_dummy_hcd() inline
routine.  If gadget->speed is USB_SPEED_SUPER but the emulation is high
speed then the routine will try to dereference dum->ss_hcd, which isn't
set, instead of dum->hs_hcd, which is set.

Was this test made with the earlier change to the UDC core in place?  =

That could explain it.

Alan Stern


--===============7847701770091193992==--

