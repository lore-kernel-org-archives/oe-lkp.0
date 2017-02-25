Content-Type: multipart/mixed; boundary="===============2687260145958497871=="
MIME-Version: 1.0
From: Mauro Carvalho Chehab <mchehab@infradead.org>
To: lkp@lists.01.org
Subject: [PATCH v3] [media] serial_ir: ensure we're ready to receive interrupts
Date: Sat, 25 Feb 2017 11:44:19 -0300
Message-ID: <20170225112213.6e890b38@vento.lan>
List-Id: <oe-lkp.lists.linux.dev>

--===============2687260145958497871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

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
- - ---
 drivers/media/rc/serial_ir.c | 123 ++++++++++++++++++++++-----------------=
----
 1 file changed, 62 insertions(+), 61 deletions(-)

diff --git a/drivers/media/rc/serial_ir.c b/drivers/media/rc/serial_ir.c
index 923fb2299553..41b54e40176c 100644
- - --- a/drivers/media/rc/serial_ir.c
+++ b/drivers/media/rc/serial_ir.c
@@ -487,10 +487,69 @@ static void serial_ir_timeout(unsigned long arg)
 	ir_raw_event_handle(serial_ir.rcdev);
 }
 =

+/* Needed by serial_ir_probe() */
+static int serial_ir_tx(struct rc_dev *dev, unsigned int *txbuf,
+			unsigned int count);
+static int serial_ir_tx_duty_cycle(struct rc_dev *dev, u32 cycle);
+static int serial_ir_tx_carrier(struct rc_dev *dev, u32 carrier);
+static int serial_ir_open(struct rc_dev *rcdev);
+static void serial_ir_close(struct rc_dev *rcdev);
+
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
@@ -516,9 +575,6 @@ static int serial_ir_probe(struct platform_device *dev)
 		return -EBUSY;
 	}
 =

- - -	setup_timer(&serial_ir.timeout_timer, serial_ir_timeout,
- - -		    (unsigned long)&serial_ir);
- - -
 	result =3D hardware_init_port();
 	if (result < 0)
 		return result;
@@ -552,7 +608,8 @@ static int serial_ir_probe(struct platform_device *dev)
 			 sense ? "low" : "high");
 =

 	dev_dbg(&dev->dev, "Interrupt %d, port %04x obtained\n", irq, io);
- - -	return 0;
+
+	return devm_rc_register_device(&dev->dev, rcdev);
 }
 =

 static int serial_ir_open(struct rc_dev *rcdev)
@@ -723,7 +780,6 @@ static void serial_ir_exit(void)
 =

 static int __init serial_ir_init_module(void)
 {
- - -	struct rc_dev *rcdev;
 	int result;
 =

 	switch (type) {
@@ -754,63 +810,9 @@ static int __init serial_ir_init_module(void)
 		sense =3D !!sense;
 =

 	result =3D serial_ir_init();
- - -	if (result)
- - -		return result;
- - -
- - -	rcdev =3D devm_rc_allocate_device(&serial_ir.pdev->dev, RC_DRIVER_IR_=
RAW);
- - -	if (!rcdev) {
- - -		result =3D -ENOMEM;
- - -		goto serial_cleanup;
- - -	}
- - -
- - -	if (hardware[type].send_pulse && hardware[type].send_space)
- - -		rcdev->tx_ir =3D serial_ir_tx;
- - -	if (hardware[type].set_send_carrier)
- - -		rcdev->s_tx_carrier =3D serial_ir_tx_carrier;
- - -	if (hardware[type].set_duty_cycle)
- - -		rcdev->s_tx_duty_cycle =3D serial_ir_tx_duty_cycle;
- - -
- - -	switch (type) {
- - -	case IR_HOMEBREW:
- - -		rcdev->input_name =3D "Serial IR type home-brew";
- - -		break;
- - -	case IR_IRDEO:
- - -		rcdev->input_name =3D "Serial IR type IRdeo";
- - -		break;
- - -	case IR_IRDEO_REMOTE:
- - -		rcdev->input_name =3D "Serial IR type IRdeo remote";
- - -		break;
- - -	case IR_ANIMAX:
- - -		rcdev->input_name =3D "Serial IR type AnimaX";
- - -		break;
- - -	case IR_IGOR:
- - -		rcdev->input_name =3D "Serial IR type IgorPlug";
- - -		break;
- - -	}
- - -
- - -	rcdev->input_phys =3D KBUILD_MODNAME "/input0";
- - -	rcdev->input_id.bustype =3D BUS_HOST;
- - -	rcdev->input_id.vendor =3D 0x0001;
- - -	rcdev->input_id.product =3D 0x0001;
- - -	rcdev->input_id.version =3D 0x0100;
- - -	rcdev->open =3D serial_ir_open;
- - -	rcdev->close =3D serial_ir_close;
- - -	rcdev->dev.parent =3D &serial_ir.pdev->dev;
- - -	rcdev->allowed_protocols =3D RC_BIT_ALL_IR_DECODER;
- - -	rcdev->driver_name =3D KBUILD_MODNAME;
- - -	rcdev->map_name =3D RC_MAP_RC6_MCE;
- - -	rcdev->min_timeout =3D 1;
- - -	rcdev->timeout =3D IR_DEFAULT_TIMEOUT;
- - -	rcdev->max_timeout =3D 10 * IR_DEFAULT_TIMEOUT;
- - -	rcdev->rx_resolution =3D 250000;
- - -
- - -	serial_ir.rcdev =3D rcdev;
- - -
- - -	result =3D rc_register_device(rcdev);
- - -
 	if (!result)
 		return 0;
- - -serial_cleanup:
+
 	serial_ir_exit();
 	return result;
 }
@@ -818,7 +820,6 @@ static int __init serial_ir_init_module(void)
 static void __exit serial_ir_exit_module(void)
 {
 	del_timer_sync(&serial_ir.timeout_timer);
- - -	rc_unregister_device(serial_ir.rcdev);
 	serial_ir_exit();
 }
 =

- - -- =

2.9.3
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYsZhEAAoJEAhfPr2O5OEV2l8P/i0jyikTsOC4NaCsImBhVsM5
sdgjy+wib+hCwdn9HDORxFq7P0ZyKSErkRnHIZSiqu1q4S9Q+Xa5h93taEdZi38H
2Ain5rB40y7eXgsssU9APHin89HmdT9XWKS7pAEE16mKhiiuu0cgFd+LngDypjNQ
s5YlzfWFsN6ubjS/t2wJpxxyepsKoCtv8smTOfyQZIhwKUcWWC9kJTA77ubO9egr
ZBFzsvw0XbEjW8cui4EEuduozD9K1OrSsCib+NK2NMU0luYy9YtsUtjN5Ozu1e6t
J5QOdsJl0aqLPfEk8TW3++55MaK9LUgE6aaCdntbek5cZmgsk3ad79kDP8gSdxAV
VUXDEPZQpJXedA6S/bAmXUbEW7mVHH9ALYSa8AGXCArKKtz+5iXNP0+83JoFGEHb
tTCGInNfsBHd8/NqdW/u/ugGVj4xt0Kc+4oOPYecjO2tiCS+lpKWIDw9bOcaR4/0
w+zbCmIEmBZ74lM0ys+TmCmDGwXC2QYEqY0U+9ZZcsy+7bMcxJH6slrjfaa6fJa0
j2OU2qB0VnUTJq0a0O8IL7s5jQn1lKNpmG9TKYNntCzBuHbasL2rsr+Jrr6vpMKU
vYbpRapoAnIXaUW708bdtA2x7/JfiLj9M7KvYJfeFAt9HGHeXq1HJsaGjix1mZh3
nL/68Fqc2Scurbzq/C7Z
=3DApye
-----END PGP SIGNATURE-----

--===============2687260145958497871==--

