Content-Type: multipart/mixed; boundary="===============6189855238951245862=="
MIME-Version: 1.0
From: Felipe Balbi <felipe.balbi@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [USB] f16443a034: EIP:arch_local_irq_restore
Date: Tue, 18 Jul 2017 09:02:20 +0300
Message-ID: <87fuduxoyb.fsf@linux.intel.com>
In-Reply-To: <Pine.LNX.4.44L0.1707171022040.1737-100000@iolanthe.rowland.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6189855238951245862==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hi,

Alan Stern <stern@rowland.harvard.edu> writes:
>> Alan Stern <stern@rowland.harvard.edu> writes:
>> >> >> > On Thu, 29 Jun 2017, kernel test robot wrote:
>> >> >> >
>> >> >> >> FYI, we noticed the following commit:
>> >> >> >> =

>> >> >> >> commit: f16443a034c7aa359ddf6f0f9bc40d01ca31faea ("USB: gadgetf=
s, dummy-hcd, net2280: fix locking for callbacks")
>> >> >> >> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git=
 master
>> >> >> >> =

>> >> >> >> in testcase: trinity
>> >> >> >> with following parameters:
>> >> >> >> =

>> >> >> >> 	runtime: 300s
>> >> >> >> =

>> >> >> >> test-description: Trinity is a linux system call fuzz tester.
>> >> >> >> test-url: http://codemonkey.org.uk/projects/trinity/
>> >> >> >> =

>> >> >> >> =

>> >> >> >> on test machine: qemu-system-x86_64 -enable-kvm -m 420M
>> >> >> >> =

>> >> >> >> caused below changes (please refer to attached dmesg/kmsg for e=
ntire log/backtrace):
>> >> >> > ...
>> >> >> >
>> >> >> > I won't include the entire report.  The gist is that we have a p=
roblem =

>> >> >> > with lock ordering.  The report is about dummy-hcd, but this cou=
ld =

>> >> >> > affect any UDC driver.
>> >> >> >
>> >> >> >      1. When a SETUP request arrives, composite_setup() acquires
>> >> >> > 	cdev->lock before calling the function driver's callback.
>> >> >> > 	When that callback submits a reply, it causes the UDC driver
>> >> >> > 	to acquire its private lock.
>> >> >> =

>> >> >> this only seems to happen before calling set_config():
>> >> >> =

>> >> >> 	case USB_REQ_SET_CONFIGURATION:
>> >> >> 		if (ctrl->bRequestType !=3D 0)
>> >> >> 			goto unknown;
>> >> >> 		if (gadget_is_otg(gadget)) {
>> >> >> 			if (gadget->a_hnp_support)
>> >> >> 				DBG(cdev, "HNP available\n");
>> >> >> 			else if (gadget->a_alt_hnp_support)
>> >> >> 				DBG(cdev, "HNP on another port\n");
>> >> >> 			else
>> >> >> 				VDBG(cdev, "HNP inactive\n");
>> >> >> 		}
>> >> >> 		spin_lock(&cdev->lock);
>> >> >> 		value =3D set_config(cdev, ctrl, w_value);
>> >> >> 		spin_unlock(&cdev->lock);
>> >> >> 		break;
>> >> >
>> >> > That's true.  Why is the lock held for set_config() but not for any=
 of =

>> >> > the other callbacks?
>> >> =

>> >> this is really old code from Dave. Your guess is as good as mine :-(
>> >> =

>> >> > Doesn't that mean the other callbacks can race with function
>> >> > unregistration?
>> >> =

>> >> Probably not as UDCs are required to cancel transfers and kill all
>> >> endpoints before unregistering. We would probably just giveback a few
>> >> requests with -ESHUTDOWN and prevent new ones from being queued to HW,
>> >> no?
>> >
>> > But SETUP callbacks aren't associated with pending requests.  They get
>> =

>> they are if ->setup() returns DELAYED_STATUS.
>
> No.  In the DELAYED_STATUS case, the gadget driver submits a request =

> _after_ the SETUP packet is received.
>
> In no case is there a pending request that an incoming SETUP packet is
> associated with.

Oh, I see now what you mean. You're talking *specifically* the SETUP
stage :-) Yeah, I agree. Currently, we don't have a request associated
with it.

>> > generated whenever a SETUP packet is received, even if the gadget
>> > driver has no requests queued.  Cancelling transfers won't prevent
>> > them.
>> >
>> > Killing all endpoints might or might not do the trick.  Does killing
>> > ep0 prevent the UDC driver from receiving SETUP packets?  This may var=
y =

>> > between UDC drivers.
>> =

>> no, it does not. If ->setup() fails, we are required to Stall and
>> restart ep0. Restarting ep0 involves preparing it to receive a new
>> SETUP request.
>
> I wasn't talking about stalling or restarting ep0; I was talking about
> killing it.

Right, there's no killing of ep0 unless we're talking about module
removal. In case of ->setup() returning an error, we *must* stall and
restart ep0 (reprogram DMA, prepare 8-byte buffer, etc).

If we don't receive SETUP packet, then we don't even get a completion
interrupt on ep0.

>> > There are also the other callbacks (reset, disconnect, bus suspend, an=
d =

>> > bus resume), which aren't associated with endpoints or requests at all.
>> >
>> > Probably drivers really should have something like synchronize_irq() in
>> > the udc_stop routine.  That would solve a lot of problems (although it =

>> > wouldn't help dummy_hcd, which doesn't rely on interrupts).
>> =

>> Hmm, free_irq() calls synchronize_irq(). UDCs should just request_irq()
>> on udc_start() and free_irq() on udc_stop(). That's what dwc3 is doing.
>
> In general, I agree.  But free_irq() isn't enough; you also have to =

> tell the UDC hardware to stop generating interrupt requests.  Otherwise =

> you'll end up with a "nobody cared!" error.

Yeah, but that's also up to the UDC driver. It must guarantee that
interrupts are masked before freeing the handler. This is not
USB-specific in any way, right?: -)

-- =

balbi

--===============6189855238951245862==--

