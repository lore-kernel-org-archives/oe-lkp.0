Content-Type: multipart/mixed; boundary="===============0533885444824336334=="
MIME-Version: 1.0
From: Mauro Carvalho Chehab <mchehab@infradead.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] [media] serial_ir: ensure we're ready to receive interrupts
Date: Sat, 25 Feb 2017 10:54:09 -0300
Message-ID: <20170225105409.6a059861@vento.lan>
In-Reply-To: <20170225103437.58c5a199@vento.lan>
List-Id: <oe-lkp.lists.linux.dev>

--===============0533885444824336334==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Em Sat, 25 Feb 2017 10:34:37 -0300
Mauro Carvalho Chehab <mchehab@infradead.org> escreveu:

> Em Sat, 25 Feb 2017 11:28:16 +0000
> Sean Young <sean@mess.org> escreveu:
> =

> > When the interrupt requested with devm_request_irq(), serial_ir.rcdev
> > is still null so will cause null deference if the irq handler is called
> > early on.
> > =

> > Also ensure that timeout_timer is setup.
> > =

> > Link: http://lkml.kernel.org/r/CA+55aFxsh2uF8gi5sN_guY3Z+tiLv7LpJYKBw+y=
8vqLzp+TsnQ(a)mail.gmail.com
> > =

> > Cc: <stable@vger.kernel.org> # 4.10
> > Signed-off-by: Sean Young <sean@mess.org>
> > ---
> >  drivers/media/rc/serial_ir.c | 243 +++++++++++++++++++++--------------=
--------
> >  1 file changed, 118 insertions(+), 125 deletions(-)
> > =

> > diff --git a/drivers/media/rc/serial_ir.c b/drivers/media/rc/serial_ir.c
> > index 923fb22..22144b4 100644
> > --- a/drivers/media/rc/serial_ir.c
> > +++ b/drivers/media/rc/serial_ir.c
> > @@ -487,74 +487,6 @@ static void serial_ir_timeout(unsigned long arg)
> >  	ir_raw_event_handle(serial_ir.rcdev);
> >  }
> >  =

> > -static int serial_ir_probe(struct platform_device *dev)
> > -{
> > -	int i, nlow, nhigh, result;
> =

> Hmm... why did you move this function to be after serial_ir_open()?
> =

> That messes with the diff without no good reason, making harder to
> identify what you changed here.

Ok, just reordered it. The diff now looks sane. Patch looks ok on
my eyes.

[PATCH v2] serial_ir: ensure we're ready to receive interrupts
From: Sean Young <sean@mess.org>

When the interrupt requested with devm_request_irq(), serial_ir.rcdev
is still null so will cause null deference if the irq handler is called
early on.

Also ensure that timeout_timer is setup.

Link: http://lkml.kernel.org/r/CA+55aFxsh2uF8gi5sN_guY3Z+tiLv7LpJYKBw+y8vqL=
zp+TsnQ(a)mail.gmail.com

[mchehab(a)s-opensource.com: moved serial_ir_probe() back to its original p=
lace]
Cc: <stable@vger.kernel.org> # 4.10
Signed-off-by: Sean Young <sean@mess.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>

diff --git a/drivers/media/rc/serial_ir.c b/drivers/media/rc/serial_ir.c
index 923fb2299553..4687c34c655a 100644
--- a/drivers/media/rc/serial_ir.c
+++ b/drivers/media/rc/serial_ir.c
@@ -489,8 +489,59 @@ static void serial_ir_timeout(unsigned long arg)
 =

 static int serial_ir_probe(struct platform_device *dev)
 {
+	struct rc_dev *rcdev;
 	int i, nlow, nhigh, result;
 =

+	rcdev =3D devm_rc_allocate_device(&dev->dev, RC_DRIVER_IR_RAW);
+	if (!rcdev)
+		return -ENOMEM;
+
+	if (hardware[type].send_pulse && hardware[type].send_space)
+		rcdev->tx_ir =3D serial_ir_tx;
+	if (hardware[type].set_send_carrier)
+		rcdev->s_tx_carrier =3D serial_ir_tx_carrier;
+	if (hardware[type].set_duty_cycle)
+		rcdev->s_tx_duty_cycle =3D serial_ir_tx_duty_cycle;
+
+	switch (type) {
+	case IR_HOMEBREW:
+		rcdev->input_name =3D "Serial IR type home-brew";
+		break;
+	case IR_IRDEO:
+		rcdev->input_name =3D "Serial IR type IRdeo";
+		break;
+	case IR_IRDEO_REMOTE:
+		rcdev->input_name =3D "Serial IR type IRdeo remote";
+		break;
+	case IR_ANIMAX:
+		rcdev->input_name =3D "Serial IR type AnimaX";
+		break;
+	case IR_IGOR:
+		rcdev->input_name =3D "Serial IR type IgorPlug";
+		break;
+	}
+
+	rcdev->input_phys =3D KBUILD_MODNAME "/input0";
+	rcdev->input_id.bustype =3D BUS_HOST;
+	rcdev->input_id.vendor =3D 0x0001;
+	rcdev->input_id.product =3D 0x0001;
+	rcdev->input_id.version =3D 0x0100;
+	rcdev->open =3D serial_ir_open;
+	rcdev->close =3D serial_ir_close;
+	rcdev->dev.parent =3D &serial_ir.pdev->dev;
+	rcdev->allowed_protocols =3D RC_BIT_ALL_IR_DECODER;
+	rcdev->driver_name =3D KBUILD_MODNAME;
+	rcdev->map_name =3D RC_MAP_RC6_MCE;
+	rcdev->min_timeout =3D 1;
+	rcdev->timeout =3D IR_DEFAULT_TIMEOUT;
+	rcdev->max_timeout =3D 10 * IR_DEFAULT_TIMEOUT;
+	rcdev->rx_resolution =3D 250000;
+
+	serial_ir.rcdev =3D rcdev;
+
+	setup_timer(&serial_ir.timeout_timer, serial_ir_timeout,
+		    (unsigned long)&serial_ir);
+
 	result =3D devm_request_irq(&dev->dev, irq, serial_ir_irq_handler,
 				  share_irq ? IRQF_SHARED : 0,
 				  KBUILD_MODNAME, &hardware);
@@ -516,9 +567,6 @@ static int serial_ir_probe(struct platform_device *dev)
 		return -EBUSY;
 	}
 =

-	setup_timer(&serial_ir.timeout_timer, serial_ir_timeout,
-		    (unsigned long)&serial_ir);
-
 	result =3D hardware_init_port();
 	if (result < 0)
 		return result;
@@ -552,7 +600,8 @@ static int serial_ir_probe(struct platform_device *dev)
 			 sense ? "low" : "high");
 =

 	dev_dbg(&dev->dev, "Interrupt %d, port %04x obtained\n", irq, io);
-	return 0;
+
+	return devm_rc_register_device(&dev->dev, rcdev);
 }
 =

 static int serial_ir_open(struct rc_dev *rcdev)
@@ -723,7 +772,6 @@ static void serial_ir_exit(void)
 =

 static int __init serial_ir_init_module(void)
 {
-	struct rc_dev *rcdev;
 	int result;
 =

 	switch (type) {
@@ -754,63 +802,9 @@ static int __init serial_ir_init_module(void)
 		sense =3D !!sense;
 =

 	result =3D serial_ir_init();
-	if (result)
-		return result;
-
-	rcdev =3D devm_rc_allocate_device(&serial_ir.pdev->dev, RC_DRIVER_IR_RAW);
-	if (!rcdev) {
-		result =3D -ENOMEM;
-		goto serial_cleanup;
-	}
-
-	if (hardware[type].send_pulse && hardware[type].send_space)
-		rcdev->tx_ir =3D serial_ir_tx;
-	if (hardware[type].set_send_carrier)
-		rcdev->s_tx_carrier =3D serial_ir_tx_carrier;
-	if (hardware[type].set_duty_cycle)
-		rcdev->s_tx_duty_cycle =3D serial_ir_tx_duty_cycle;
-
-	switch (type) {
-	case IR_HOMEBREW:
-		rcdev->input_name =3D "Serial IR type home-brew";
-		break;
-	case IR_IRDEO:
-		rcdev->input_name =3D "Serial IR type IRdeo";
-		break;
-	case IR_IRDEO_REMOTE:
-		rcdev->input_name =3D "Serial IR type IRdeo remote";
-		break;
-	case IR_ANIMAX:
-		rcdev->input_name =3D "Serial IR type AnimaX";
-		break;
-	case IR_IGOR:
-		rcdev->input_name =3D "Serial IR type IgorPlug";
-		break;
-	}
-
-	rcdev->input_phys =3D KBUILD_MODNAME "/input0";
-	rcdev->input_id.bustype =3D BUS_HOST;
-	rcdev->input_id.vendor =3D 0x0001;
-	rcdev->input_id.product =3D 0x0001;
-	rcdev->input_id.version =3D 0x0100;
-	rcdev->open =3D serial_ir_open;
-	rcdev->close =3D serial_ir_close;
-	rcdev->dev.parent =3D &serial_ir.pdev->dev;
-	rcdev->allowed_protocols =3D RC_BIT_ALL_IR_DECODER;
-	rcdev->driver_name =3D KBUILD_MODNAME;
-	rcdev->map_name =3D RC_MAP_RC6_MCE;
-	rcdev->min_timeout =3D 1;
-	rcdev->timeout =3D IR_DEFAULT_TIMEOUT;
-	rcdev->max_timeout =3D 10 * IR_DEFAULT_TIMEOUT;
-	rcdev->rx_resolution =3D 250000;
-
-	serial_ir.rcdev =3D rcdev;
-
-	result =3D rc_register_device(rcdev);
-
 	if (!result)
 		return 0;
-serial_cleanup:
+
 	serial_ir_exit();
 	return result;
 }
@@ -818,7 +812,6 @@ static int __init serial_ir_init_module(void)
 static void __exit serial_ir_exit_module(void)
 {
 	del_timer_sync(&serial_ir.timeout_timer);
-	rc_unregister_device(serial_ir.rcdev);
 	serial_ir_exit();
 }
 =



--===============0533885444824336334==--

