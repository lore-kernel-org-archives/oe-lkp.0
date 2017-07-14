Content-Type: multipart/mixed; boundary="===============8764868538724193633=="
MIME-Version: 1.0
From: Alan Stern <stern@rowland.harvard.edu>
To: lkp@lists.01.org
Subject: Re: [USB] f16443a034: EIP:arch_local_irq_restore
Date: Fri, 14 Jul 2017 10:17:32 -0400
Message-ID: <Pine.LNX.4.44L0.1707141008100.2027-100000@iolanthe.rowland.org>
In-Reply-To: <87a8475wqw.fsf@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8764868538724193633==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 14 Jul 2017, Felipe Balbi wrote:

> Hi,
> =

> Alan Stern <stern@rowland.harvard.edu> writes:
> >> > Felipe:
> >> >
> >> > On Thu, 29 Jun 2017, kernel test robot wrote:
> >> >
> >> >> FYI, we noticed the following commit:
> >> >> =

> >> >> commit: f16443a034c7aa359ddf6f0f9bc40d01ca31faea ("USB: gadgetfs, d=
ummy-hcd, net2280: fix locking for callbacks")
> >> >> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git mas=
ter
> >> >> =

> >> >> in testcase: trinity
> >> >> with following parameters:
> >> >> =

> >> >> 	runtime: 300s
> >> >> =

> >> >> test-description: Trinity is a linux system call fuzz tester.
> >> >> test-url: http://codemonkey.org.uk/projects/trinity/
> >> >> =

> >> >> =

> >> >> on test machine: qemu-system-x86_64 -enable-kvm -m 420M
> >> >> =

> >> >> caused below changes (please refer to attached dmesg/kmsg for entir=
e log/backtrace):
> >> > ...
> >> >
> >> > I won't include the entire report.  The gist is that we have a probl=
em =

> >> > with lock ordering.  The report is about dummy-hcd, but this could =

> >> > affect any UDC driver.
> >> >
> >> >      1. When a SETUP request arrives, composite_setup() acquires
> >> > 	cdev->lock before calling the function driver's callback.
> >> > 	When that callback submits a reply, it causes the UDC driver
> >> > 	to acquire its private lock.
> >> =

> >> this only seems to happen before calling set_config():
> >> =

> >> 	case USB_REQ_SET_CONFIGURATION:
> >> 		if (ctrl->bRequestType !=3D 0)
> >> 			goto unknown;
> >> 		if (gadget_is_otg(gadget)) {
> >> 			if (gadget->a_hnp_support)
> >> 				DBG(cdev, "HNP available\n");
> >> 			else if (gadget->a_alt_hnp_support)
> >> 				DBG(cdev, "HNP on another port\n");
> >> 			else
> >> 				VDBG(cdev, "HNP inactive\n");
> >> 		}
> >> 		spin_lock(&cdev->lock);
> >> 		value =3D set_config(cdev, ctrl, w_value);
> >> 		spin_unlock(&cdev->lock);
> >> 		break;
> >
> > That's true.  Why is the lock held for set_config() but not for any of =

> > the other callbacks?
> =

> this is really old code from Dave. Your guess is as good as mine :-(
> =

> > Doesn't that mean the other callbacks can race with function
> > unregistration?
> =

> Probably not as UDCs are required to cancel transfers and kill all
> endpoints before unregistering. We would probably just giveback a few
> requests with -ESHUTDOWN and prevent new ones from being queued to HW,
> no?

But SETUP callbacks aren't associated with pending requests.  They get
generated whenever a SETUP packet is received, even if the gadget
driver has no requests queued.  Cancelling transfers won't prevent
them.

Killing all endpoints might or might not do the trick.  Does killing
ep0 prevent the UDC driver from receiving SETUP packets?  This may vary =

between UDC drivers.

There are also the other callbacks (reset, disconnect, bus suspend, and =

bus resume), which aren't associated with endpoints or requests at all.

Probably drivers really should have something like synchronize_irq() in
the udc_stop routine.  That would solve a lot of problems (although it =

wouldn't help dummy_hcd, which doesn't rely on interrupts).

Alan Stern


--===============8764868538724193633==--

