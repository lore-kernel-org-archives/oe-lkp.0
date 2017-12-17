Content-Type: multipart/mixed; boundary="===============1042158078513626764=="
MIME-Version: 1.0
From: Alan Stern <stern@rowland.harvard.edu>
To: lkp@lists.01.org
Subject: Re: [usb_add_gadget_udc_release] BUG: KASAN: double-free or invalid-free in (null)
Date: Sun, 17 Dec 2017 11:37:15 -0500
Message-ID: <Pine.LNX.4.44L0.1712171135030.15295-100000@netrider.rowland.org>
In-Reply-To: <20171217124515.bjmbtwdr3rjz2kk4@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1042158078513626764==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 17 Dec 2017, Fengguang Wu wrote:

> Hello,
> =

> FYI this happens in mainline kernel 4.15.0-rc3.
> It looks like a new regression.
> =

> It occurs in 23 out of 36 boots.
> =

> [   38.592360] LUN: removable file: (no medium)
> [   38.593442] no file given for LUN0
> [   38.594589] g_mass_storage usbip-vudc.0: failed to start g_mass_storag=
e: -22
> [   38.600881] udc usbip-vudc.0: releasing 'usbip-vudc.0'
> [   38.604397] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   38.605034] BUG: KASAN: double-free or invalid-free in           (null)
> [   38.605034]
> [   38.605034] CPU: 0 PID: 1 Comm: swapper Not tainted 4.15.0-rc3 #468
> [   38.605034] Call Trace:
> [   38.605034]  dump_stack+0x2f/0x3e:
> 						__dump_stack at lib/dump_stack.c:17
> 						 (inlined by) dump_stack at lib/dump_stack.c:63
> [   38.605034]  print_address_description+0xc2/0x3b7:
> 						print_address_description at mm/kasan/report.c:253
> [   38.605034]  kasan_report_double_free+0x50/0x8c:
> 						kasan_report_double_free at mm/kasan/report.c:334
> [   38.605034]  kasan_slab_free+0x60/0x1ef:
> 						kasan_slab_free at mm/kasan/kasan.c:514
> [   38.605034]  ? ftrace_likely_update+0x5c/0xc4:
> 						ftrace_likely_update at kernel/trace/trace_branch.c:223
> [   38.605034]  ? kobj_kset_leave+0x193/0x1dc:
> 						kobj_kset_leave at lib/kobject.c:184
> [   38.605034]  ? lock_acquired+0x8d2/0x8d2:
> 						lock_release at kernel/locking/lockdep.c:4013
> [   38.605034]  ? ftrace_likely_update+0x5c/0xc4:
> 						ftrace_likely_update at kernel/trace/trace_branch.c:223
> [   38.605034]  ? trace_preempt_on+0x489/0x4d7:
> 						trace_preempt_enable_rcuidle at include/trace/events/preemptirq.h:50
> 						 (inlined by) trace_preempt_on at kernel/trace/trace_irqsoff.c:855
> [   38.605034]  ? static_obj+0x40/0x40:
> 						match_held_lock at kernel/locking/lockdep.c:3567
> [   38.605034]  ? kobject_put+0xf5/0x642:
> 						refcount_dec_and_test at arch/x86/include/asm/refcount.h:75
> 						 (inlined by) kref_put at include/linux/kref.h:69
> 						 (inlined by) kobject_put at lib/kobject.c:694
> [   38.605034]  ? trace_hardirqs_off+0x17/0x1f:
> 						trace_hardirqs_off at kernel/locking/lockdep.c:2984
> [   38.605034]  ? kfree+0x419/0x5e7:
> 						slab_free_hook at mm/slub.c:1380
> 						 (inlined by) slab_free_freelist_hook at mm/slub.c:1412
> 						 (inlined by) slab_free at mm/slub.c:2968
> 						 (inlined by) kfree at mm/slub.c:3899
> [   38.605034]  kfree+0x43c/0x5e7:
> 						slab_free at mm/slub.c:2973
> 						 (inlined by) kfree at mm/slub.c:3899
> [   38.605034]  usb_add_gadget_udc_release+0x693/0x6ca:
> 						usb_add_gadget_udc_release at drivers/usb/gadget/udc/core.c:1199

Boy, the error handling in that routine is a mess.  The patch below =

should straighten it out.

Alan Stern



Index: usb-4.x/drivers/usb/gadget/udc/core.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- usb-4.x.orig/drivers/usb/gadget/udc/core.c
+++ usb-4.x/drivers/usb/gadget/udc/core.c
@@ -1147,11 +1147,7 @@ int usb_add_gadget_udc_release(struct de
 =

 	udc =3D kzalloc(sizeof(*udc), GFP_KERNEL);
 	if (!udc)
-		goto err1;
-
-	ret =3D device_add(&gadget->dev);
-	if (ret)
-		goto err2;
+		goto err_put_gadget;
 =

 	device_initialize(&udc->dev);
 	udc->dev.release =3D usb_udc_release;
@@ -1160,7 +1156,11 @@ int usb_add_gadget_udc_release(struct de
 	udc->dev.parent =3D parent;
 	ret =3D dev_set_name(&udc->dev, "%s", kobject_name(&parent->kobj));
 	if (ret)
-		goto err3;
+		goto err_put_udc;
+
+	ret =3D device_add(&gadget->dev);
+	if (ret)
+		goto err_put_udc;
 =

 	udc->gadget =3D gadget;
 	gadget->udc =3D udc;
@@ -1170,7 +1170,7 @@ int usb_add_gadget_udc_release(struct de
 =

 	ret =3D device_add(&udc->dev);
 	if (ret)
-		goto err4;
+		goto err_unlist_udc;
 =

 	usb_gadget_set_state(gadget, USB_STATE_NOTATTACHED);
 	udc->vbus =3D true;
@@ -1178,27 +1178,25 @@ int usb_add_gadget_udc_release(struct de
 	/* pick up one of pending gadget drivers */
 	ret =3D check_pending_gadget_drivers(udc);
 	if (ret)
-		goto err5;
+		goto err_del_udc;
 =

 	mutex_unlock(&udc_lock);
 =

 	return 0;
 =

-err5:
+ err_del_udc:
 	device_del(&udc->dev);
 =

-err4:
+ err_unlist_udc:
 	list_del(&udc->list);
 	mutex_unlock(&udc_lock);
 =

-err3:
-	put_device(&udc->dev);
 	device_del(&gadget->dev);
 =

-err2:
-	kfree(udc);
+ err_put_udc:
+	put_device(&udc->dev);
 =

-err1:
+ err_put_gadget:
 	put_device(&gadget->dev);
 	return ret;
 }


--===============1042158078513626764==--

