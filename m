Content-Type: multipart/mixed; boundary="===============4267002286817290039=="
MIME-Version: 1.0
From: Felipe Balbi <felipe.balbi@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [USB] f16443a034: EIP:arch_local_irq_restore
Date: Fri, 14 Jul 2017 10:00:07 +0300
Message-ID: <87a8475wqw.fsf@linux.intel.com>
In-Reply-To: <Pine.LNX.4.44L0.1707131028590.1571-100000@iolanthe.rowland.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4267002286817290039==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hi,

Alan Stern <stern@rowland.harvard.edu> writes:
>> > Felipe:
>> >
>> > On Thu, 29 Jun 2017, kernel test robot wrote:
>> >
>> >> FYI, we noticed the following commit:
>> >> =

>> >> commit: f16443a034c7aa359ddf6f0f9bc40d01ca31faea ("USB: gadgetfs, dum=
my-hcd, net2280: fix locking for callbacks")
>> >> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>> >> =

>> >> in testcase: trinity
>> >> with following parameters:
>> >> =

>> >> 	runtime: 300s
>> >> =

>> >> test-description: Trinity is a linux system call fuzz tester.
>> >> test-url: http://codemonkey.org.uk/projects/trinity/
>> >> =

>> >> =

>> >> on test machine: qemu-system-x86_64 -enable-kvm -m 420M
>> >> =

>> >> caused below changes (please refer to attached dmesg/kmsg for entire =
log/backtrace):
>> > ...
>> >
>> > I won't include the entire report.  The gist is that we have a problem =

>> > with lock ordering.  The report is about dummy-hcd, but this could =

>> > affect any UDC driver.
>> >
>> >      1. When a SETUP request arrives, composite_setup() acquires
>> > 	cdev->lock before calling the function driver's callback.
>> > 	When that callback submits a reply, it causes the UDC driver
>> > 	to acquire its private lock.
>> =

>> this only seems to happen before calling set_config():
>> =

>> 	case USB_REQ_SET_CONFIGURATION:
>> 		if (ctrl->bRequestType !=3D 0)
>> 			goto unknown;
>> 		if (gadget_is_otg(gadget)) {
>> 			if (gadget->a_hnp_support)
>> 				DBG(cdev, "HNP available\n");
>> 			else if (gadget->a_alt_hnp_support)
>> 				DBG(cdev, "HNP on another port\n");
>> 			else
>> 				VDBG(cdev, "HNP inactive\n");
>> 		}
>> 		spin_lock(&cdev->lock);
>> 		value =3D set_config(cdev, ctrl, w_value);
>> 		spin_unlock(&cdev->lock);
>> 		break;
>
> That's true.  Why is the lock held for set_config() but not for any of =

> the other callbacks?

this is really old code from Dave. Your guess is as good as mine :-(

> Doesn't that mean the other callbacks can race with function
> unregistration?

Probably not as UDCs are required to cancel transfers and kill all
endpoints before unregistering. We would probably just giveback a few
requests with -ESHUTDOWN and prevent new ones from being queued to HW,
no?

>> The "reply" here is a usb_ep_queue(gadget->ep0, req) call which should
>> hold UDC driver's private lock and disable interrupts for a short period
>> of time. Here's how it looks on dwc3:
>> =

>> int dwc3_gadget_ep0_queue(struct usb_ep *ep, struct usb_request *request,
>> 		gfp_t gfp_flags)
>> {
>> 	struct dwc3_request		*req =3D to_dwc3_request(request);
>> 	struct dwc3_ep			*dep =3D to_dwc3_ep(ep);
>> 	struct dwc3			*dwc =3D dep->dwc;
>> =

>> 	unsigned long			flags;
>> =

>> 	int				ret;
>> =

>> 	spin_lock_irqsave(&dwc->lock, flags);
>> 	if (!dep->endpoint.desc) {
>> 		dev_err(dwc->dev, "%s: can't queue to disabled endpoint\n",
>> 				dep->name);
>> 		ret =3D -ESHUTDOWN;
>> 		goto out;
>> 	}
>> =

>> 	/* we share one TRB for ep0/1 */
>> 	if (!list_empty(&dep->pending_list)) {
>> 		ret =3D -EBUSY;
>> 		goto out;
>> 	}
>> =

>> 	ret =3D __dwc3_gadget_ep0_queue(dep, req);
>> =

>> out:
>> 	spin_unlock_irqrestore(&dwc->lock, flags);
>> =

>> 	return ret;
>> }
>> =

>> >      2. When a bus reset occurs, the UDC's interrupt handler acquires
>> > 	its private lock before calling usb_gadget_udc_reset(), which
>> > 	calls composite_disconnect(), which acquires cdev->lock.
>> =

>> The reset handler will only run after B has been released though, no?
>
> B?  Do you mean the UDC's private lock?

yes :-)

>> Also, UDC should *release* its private lock before calling UDC reset:
>> =

>> static void dwc3_reset_gadget(struct dwc3 *dwc)
>> {
>> 	if (!dwc->gadget_driver)
>> 		return;
>> =

>> 	if (dwc->gadget.speed !=3D USB_SPEED_UNKNOWN) {
>> 		spin_unlock(&dwc->lock);
>> 		usb_gadget_udc_reset(&dwc->gadget, dwc->gadget_driver);
>> 		spin_lock(&dwc->lock);
>> 	}
>> }
>> =

>> Are you sure this isn't a bug in dummy only?
>
> That's the issue.  The commit in $SUBJECT changed dummy-hcd precisely
> to _avoid_ releasing the private lock before calling the reset routine.
>
> The reason is explained in the commit's changelog: If the lock isn't
> held then it is possible for the user to cause a use-after-free BUG by
> closing the gadgetfs control file when a reset is about to occur.  The =

> bug report showed this happening with dummy-hcd, but the same bug ought =

> to affect any UDC driver that isn't careful about races between =

> callbacks and unregistration.

understood. Then seems like this should be handled in a more generic way.

> Please read the follow-up email in this thread, the one sent on June 30.

Will do

-- =

balbi

--===============4267002286817290039==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUVCQ0FBZEZpRUVsTHpoN3duOTZD
WHdqaDJJekw2NG1lRWFtUVlGQWxsb2EvY0FDZ2tRekw2NG1lRWEKbVFhczRnLytQeGRKQ3hQNVFj
aGtsbWU4ektKdjBOSEhHcWlzOUsvL2VQVUw2L2dqcDF5Unh1Z2JxU1d2RFp6ZQo3dlQ2Ymo3akJH
WVpzSjRTUFJvMi9HZDJpL1BXcjBQQVpXUGxuSmdud0xUNmNCUnplbzdJWDVtcXpjQ2hqZXQyClJW
U2RiZVRYcUZKNGxZLzk4KzYxc0hiS0VlcExhQStWQ2l3VytpK0R1QnBqKzdwaGs4YnhKcXNuTnda
dTRTV3cKWEZpTkxzbkZ2YlB2clFwN1RCVnhjT2g3aVJiQm9KbUVpTFRLdzVKN1BMZjFzMG9jZTY5
MFM2SkEyZnRjYzFZRAo0VUdZcGtad3RCVjZadWJyMEg4VitjL0JFeVFieUJTYjlVcG9NdzFmb1Zs
MXJseGdIbnpSWC9uV0I2VVRTaDlICnd0USswZVB0MXdpellsdHMzYkRLN1plMmd3WFdyL3l2OTAw
TkkvVEdpbmxwanRDRmY0THZDWDk3R2RSd05BVmoKbjlWR2tZUGhvSEIrN0Y5dExuYmJNTjRUdVAw
UThhMTRSTEx4RG8rZGxLb0k0YTQ0Z0Q4Yk0xM09haURZRmczdApBWXczd28zZlZqYVMzaU1ZZnBP
ak9hYzR4ckFINVNSUkwxMTVGbWFhOHJQckUzbmF1QWVsUTVqL3QyKzROQXc2CkZCdjNEUk5IREk5
bVRMR1g5WXRVUGllVGtRT0dycVdLOW9SSk84U0FxU1d2d1IyU2oyYjdaYlJpRkMzSUEzTW0KcjZS
MTBlcmdENTJuSHNLcGZONzZjVWdLazU2VlovZFV5YlpYVFd0Y3A0dklZeVFEcXZjV2lTQWhKaTUz
RHBUOApoWjhOeXY5cnY3UjZmTmJNQ1hZT3p0czJvRXU0ZFRCMVhpQ3RUTXM4MXAvY3JHUVRHbFE9
Cj1GWE5SCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ==
--===============4267002286817290039==--

