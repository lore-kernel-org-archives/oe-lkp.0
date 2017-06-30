Content-Type: multipart/mixed; boundary="===============8327910754958110227=="
MIME-Version: 1.0
From: Alan Stern <stern@rowland.harvard.edu>
To: lkp@lists.01.org
Subject: Re: [USB] f16443a034: EIP:arch_local_irq_restore
Date: Fri, 30 Jun 2017 15:44:55 -0400
Message-ID: <Pine.LNX.4.44L0.1706301450070.2177-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1706291025260.1571-100000@iolanthe.rowland.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============8327910754958110227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Jun 2017, Alan Stern wrote:

> Felipe:
> =

> On Thu, 29 Jun 2017, kernel test robot wrote:
> =

> > FYI, we noticed the following commit:
> > =

> > commit: f16443a034c7aa359ddf6f0f9bc40d01ca31faea ("USB: gadgetfs, dummy=
-hcd, net2280: fix locking for callbacks")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > =

> > in testcase: trinity
> > with following parameters:
> > =

> > 	runtime: 300s
> > =

> > test-description: Trinity is a linux system call fuzz tester.
> > test-url: http://codemonkey.org.uk/projects/trinity/
> > =

> > =

> > on test machine: qemu-system-x86_64 -enable-kvm -m 420M
> > =

> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> ...
> =

> I won't include the entire report.  The gist is that we have a problem =

> with lock ordering.  The report is about dummy-hcd, but this could =

> affect any UDC driver.
> =

>      1. When a SETUP request arrives, composite_setup() acquires
> 	cdev->lock before calling the function driver's callback.
> 	When that callback submits a reply, it causes the UDC driver
> 	to acquire its private lock.
> =

>      2. When a bus reset occurs, the UDC's interrupt handler acquires
> 	its private lock before calling usb_gadget_udc_reset(), which
> 	calls composite_disconnect(), which acquires cdev->lock.
> =

> So there's an ABBA ordering problem between the UDC's private lock and =

> the composite core's cdev->lock.
> =

> Use of the UDC's private lock in 1 seems unavoidable.  Perhaps it can =

> be avoided in 2, but wouldn't that leave us open to a race between =

> reset handling and gadget driver unregistration?  In fact, that was the =

> very reason for creating the commit cited at the top of this bug =

> report.
> =

> I don't know enough of the details of the composite core to say whether =

> its lock usage can be reduced.
> =

> Do you have any suggestions?

Actually, I had an idea this morning.

The UDC driver certainly cannot retain its private lock across ->setup =

callbacks, because the handler will submit a response request which =

will cause the UDC driver to reacquire the lock.  Therefore the setup =

callback is already subject to a race with unregistration.

This strongly suggests that the UDC driver should not keep its private =

lock during the other callbacks either.  Which means we need some way =

to prevent the race from occurring.  To be more explicit, the UDC =

driver's udc_stop routine needs to wait until no callbacks are running.

Here's a sample patch for dummy-hcd to illustrate the idea:

--- usb-4.x.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ usb-4.x/drivers/usb/gadget/udc/dummy_hcd.c
@@ -253,6 +253,7 @@ struct dummy {
 	 */
 	struct dummy_ep			ep[DUMMY_ENDPOINTS];
 	int				address;
+	int				active_callbacks;
 	struct usb_gadget		gadget;
 	struct usb_gadget_driver	*driver;
 	struct dummy_request		fifo_req;
@@ -442,16 +443,24 @@ static void set_link_state(struct dummy_
 		/* Report reset and disconnect events to the driver */
 		if (dum->driver && (disconnect || reset)) {
 			stop_activity(dum);
+			++dum->active_callbacks;
+			spin_unlock(&dum->lock);
 			if (reset)
 				usb_gadget_udc_reset(&dum->gadget, dum->driver);
 			else
 				dum->driver->disconnect(&dum->gadget);
+			spin_lock(&dum->lock);
+			--dum->active_callbacks;
 		}
-	} else if (dum_hcd->active !=3D dum_hcd->old_active) {
+	} else if (dum->driver && dum_hcd->active !=3D dum_hcd->old_active) {
+		++dum->active_callbacks;
+		spin_unlock(&dum->lock);
 		if (dum_hcd->old_active && dum->driver->suspend)
 			dum->driver->suspend(&dum->gadget);
-		else if (!dum_hcd->old_active &&  dum->driver->resume)
+		else if (!dum_hcd->old_active && dum->driver->resume)
 			dum->driver->resume(&dum->gadget);
+		spin_lock(&dum->lock);
+		--dum->active_callbacks;
 	}
 =

 	dum_hcd->old_status =3D dum_hcd->port_status;
@@ -976,10 +985,22 @@ static int dummy_udc_stop(struct usb_gad
 	struct dummy_hcd	*dum_hcd =3D gadget_to_dummy_hcd(g);
 	struct dummy		*dum =3D dum_hcd->dum;
 =

-	spin_lock_irq(&dum->lock);
-	dum->driver =3D NULL;
-	spin_unlock_irq(&dum->lock);
+	/* Wait until no callbacks are running, then unbind the driver */
+	for (;;) {
+		int	c;
+
+		spin_lock_irq(&dum->lock);
+		c =3D dum->active_callbacks;
+		if (c =3D=3D 0) {
+			dum->driver =3D NULL;
+			stop_activity(dum);
+		}
+		spin_unlock_irq(&dum->lock);
 =

+		if (c =3D=3D 0)
+			break;
+		usleep_range(1000, 2000);
+	}
 	return 0;
 }
 =

@@ -1850,10 +1871,12 @@ restart:
 			 * until setup() returns; no reentrancy issues etc.
 			 */
 			if (value > 0) {
+				++dum->active_callbacks;
 				spin_unlock(&dum->lock);
 				value =3D dum->driver->setup(&dum->gadget,
 						&setup);
 				spin_lock(&dum->lock);
+				--dum->active_callbacks;
 =

 				if (value >=3D 0) {
 					/* no delays (max 64KB data stage) */
 =

It's a little clunky, especially that second-to-last hunk, but I don't
see any way around it.  What do you think of this approach?

Alan Stern


--===============8327910754958110227==--

