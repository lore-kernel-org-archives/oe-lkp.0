Content-Type: multipart/mixed; boundary="===============8964145316942791513=="
MIME-Version: 1.0
From: Alan Stern <stern@rowland.harvard.edu>
To: lkp@lists.01.org
Subject: Re: [USB] f16443a034: EIP:arch_local_irq_restore
Date: Thu, 13 Jul 2017 10:40:26 -0400
Message-ID: <Pine.LNX.4.44L0.1707131028590.1571-100000@iolanthe.rowland.org>
In-Reply-To: <87pod46dep.fsf@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8964145316942791513==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Jul 2017, Felipe Balbi wrote:

> Hi,
> =

> Alan Stern <stern@rowland.harvard.edu> writes:
> =

> > Felipe:
> >
> > On Thu, 29 Jun 2017, kernel test robot wrote:
> >
> >> FYI, we noticed the following commit:
> >> =

> >> commit: f16443a034c7aa359ddf6f0f9bc40d01ca31faea ("USB: gadgetfs, dumm=
y-hcd, net2280: fix locking for callbacks")
> >> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> >> =

> >> in testcase: trinity
> >> with following parameters:
> >> =

> >> 	runtime: 300s
> >> =

> >> test-description: Trinity is a linux system call fuzz tester.
> >> test-url: http://codemonkey.org.uk/projects/trinity/
> >> =

> >> =

> >> on test machine: qemu-system-x86_64 -enable-kvm -m 420M
> >> =

> >> caused below changes (please refer to attached dmesg/kmsg for entire l=
og/backtrace):
> > ...
> >
> > I won't include the entire report.  The gist is that we have a problem =

> > with lock ordering.  The report is about dummy-hcd, but this could =

> > affect any UDC driver.
> >
> >      1. When a SETUP request arrives, composite_setup() acquires
> > 	cdev->lock before calling the function driver's callback.
> > 	When that callback submits a reply, it causes the UDC driver
> > 	to acquire its private lock.
> =

> this only seems to happen before calling set_config():
> =

> 	case USB_REQ_SET_CONFIGURATION:
> 		if (ctrl->bRequestType !=3D 0)
> 			goto unknown;
> 		if (gadget_is_otg(gadget)) {
> 			if (gadget->a_hnp_support)
> 				DBG(cdev, "HNP available\n");
> 			else if (gadget->a_alt_hnp_support)
> 				DBG(cdev, "HNP on another port\n");
> 			else
> 				VDBG(cdev, "HNP inactive\n");
> 		}
> 		spin_lock(&cdev->lock);
> 		value =3D set_config(cdev, ctrl, w_value);
> 		spin_unlock(&cdev->lock);
> 		break;

That's true.  Why is the lock held for set_config() but not for any of =

the other callbacks?

Doesn't that mean the other callbacks can race with function
unregistration?

> The "reply" here is a usb_ep_queue(gadget->ep0, req) call which should
> hold UDC driver's private lock and disable interrupts for a short period
> of time. Here's how it looks on dwc3:
> =

> int dwc3_gadget_ep0_queue(struct usb_ep *ep, struct usb_request *request,
> 		gfp_t gfp_flags)
> {
> 	struct dwc3_request		*req =3D to_dwc3_request(request);
> 	struct dwc3_ep			*dep =3D to_dwc3_ep(ep);
> 	struct dwc3			*dwc =3D dep->dwc;
> =

> 	unsigned long			flags;
> =

> 	int				ret;
> =

> 	spin_lock_irqsave(&dwc->lock, flags);
> 	if (!dep->endpoint.desc) {
> 		dev_err(dwc->dev, "%s: can't queue to disabled endpoint\n",
> 				dep->name);
> 		ret =3D -ESHUTDOWN;
> 		goto out;
> 	}
> =

> 	/* we share one TRB for ep0/1 */
> 	if (!list_empty(&dep->pending_list)) {
> 		ret =3D -EBUSY;
> 		goto out;
> 	}
> =

> 	ret =3D __dwc3_gadget_ep0_queue(dep, req);
> =

> out:
> 	spin_unlock_irqrestore(&dwc->lock, flags);
> =

> 	return ret;
> }
> =

> >      2. When a bus reset occurs, the UDC's interrupt handler acquires
> > 	its private lock before calling usb_gadget_udc_reset(), which
> > 	calls composite_disconnect(), which acquires cdev->lock.
> =

> The reset handler will only run after B has been released though, no?

B?  Do you mean the UDC's private lock?

> Also, UDC should *release* its private lock before calling UDC reset:
> =

> static void dwc3_reset_gadget(struct dwc3 *dwc)
> {
> 	if (!dwc->gadget_driver)
> 		return;
> =

> 	if (dwc->gadget.speed !=3D USB_SPEED_UNKNOWN) {
> 		spin_unlock(&dwc->lock);
> 		usb_gadget_udc_reset(&dwc->gadget, dwc->gadget_driver);
> 		spin_lock(&dwc->lock);
> 	}
> }
> =

> Are you sure this isn't a bug in dummy only?

That's the issue.  The commit in $SUBJECT changed dummy-hcd precisely
to _avoid_ releasing the private lock before calling the reset routine.

The reason is explained in the commit's changelog: If the lock isn't
held then it is possible for the user to cause a use-after-free BUG by
closing the gadgetfs control file when a reset is about to occur.  The =

bug report showed this happening with dummy-hcd, but the same bug ought =

to affect any UDC driver that isn't careful about races between =

callbacks and unregistration.

Please read the follow-up email in this thread, the one sent on June 30.

Alan Stern


--===============8964145316942791513==--

