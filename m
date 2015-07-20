Content-Type: multipart/mixed; boundary="===============4660218738171697435=="
MIME-Version: 1.0
From: Joe Perches <joe@perches.com>
To: lkp@lists.01.org
Subject: Re: [platform/chrome] ec2f33ab582:
Date: Mon, 20 Jul 2015 00:36:14 -0700
Message-ID: <1437377774.24289.33.camel@perches.com>
In-Reply-To: <87380jb919.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4660218738171697435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2015-07-20 at 15:08 +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit ec2f33ab582bf6bb14ef3e1ce4ed5f1973edd9f6 ("platform/chrome: Add cr=
os_ec_lpc driver for x86 devices")
> =

> The following new stuff in kernel log may make end user confusing.
> =

> [   17.712730] cros_ec_lpc: unsupported system.

Likely this should just be removed or maybe emitted at KERN_DEBUG

Maybe fix the other logging defects at the same.

o remove unnecessary logging of unsupported system
o use pr_fmt
o add missing format newline termination
o fix responsed/response grammar
o neaten logging message alignment

---
 drivers/platform/chrome/cros_ec_lpc.c | 29
++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrom=
e/cros_ec_lpc.c
index bdd77ce..20c2189 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -21,6 +21,8 @@
  * expensive.
  */
 =

+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/dmi.h>
 #include <linux/delay.h>
 #include <linux/io.h>
@@ -68,7 +70,7 @@ static int cros_ec_pkt_xfer_lpc(struct cros_ec_device *ec,
 	outb(EC_COMMAND_PROTOCOL_3, EC_LPC_ADDR_HOST_CMD);
 =

 	if (ec_response_timed_out()) {
-		dev_warn(ec->dev, "EC responsed timed out\n");
+		dev_warn(ec->dev, "EC response timed out\n");
 		ret =3D -EIO;
 		goto done;
 	}
@@ -89,8 +91,7 @@ static int cros_ec_pkt_xfer_lpc(struct cros_ec_device *ec,
 	msg->result =3D response.result;
 =

 	if (response.data_len > msg->insize) {
-		dev_err(ec->dev,
-			"packet too long (%d bytes, expected %d)",
+		dev_err(ec->dev, "packet too long (%d bytes, expected %d)\n",
 			response.data_len, msg->insize);
 		ret =3D -EMSGSIZE;
 		goto done;
@@ -104,8 +105,7 @@ static int cros_ec_pkt_xfer_lpc(struct cros_ec_device *=
ec,
 	}
 =

 	if (sum) {
-		dev_err(ec->dev,
-			"bad packet checksum %02x\n",
+		dev_err(ec->dev, "bad packet checksum %02x\n",
 			response.checksum);
 		ret =3D -EBADMSG;
 		goto done;
@@ -127,8 +127,7 @@ static int cros_ec_cmd_xfer_lpc(struct cros_ec_device *=
ec,
 =

 	if (msg->outsize > EC_PROTO2_MAX_PARAM_SIZE ||
 	    msg->insize > EC_PROTO2_MAX_PARAM_SIZE) {
-		dev_err(ec->dev,
-			"invalid buffer sizes (out %d, in %d)\n",
+		dev_err(ec->dev, "invalid buffer sizes (out %d, in %d)\n",
 			msg->outsize, msg->insize);
 		return -EINVAL;
 	}
@@ -159,7 +158,7 @@ static int cros_ec_cmd_xfer_lpc(struct cros_ec_device *=
ec,
 	outb(msg->command, EC_LPC_ADDR_HOST_CMD);
 =

 	if (ec_response_timed_out()) {
-		dev_warn(ec->dev, "EC responsed timed out\n");
+		dev_warn(ec->dev, "EC response timed out\n");
 		ret =3D -EIO;
 		goto done;
 	}
@@ -172,8 +171,7 @@ static int cros_ec_cmd_xfer_lpc(struct cros_ec_device *=
ec,
 		break;
 	case EC_RES_IN_PROGRESS:
 		ret =3D -EAGAIN;
-		dev_dbg(ec->dev, "command 0x%02x in progress\n",
-			msg->command);
+		dev_dbg(ec->dev, "command 0x%02x in progress\n", msg->command);
 		goto done;
 	default:
 		dev_dbg(ec->dev, "command 0x%02x returned %d\n",
@@ -187,8 +185,7 @@ static int cros_ec_cmd_xfer_lpc(struct cros_ec_device *=
ec,
 	args.checksum =3D inb(EC_LPC_ADDR_HOST_ARGS + 3);
 =

 	if (args.data_size > msg->insize) {
-		dev_err(ec->dev,
-			"packet too long (%d bytes, expected %d)",
+		dev_err(ec->dev, "packet too long (%d bytes, expected %d)\n",
 			args.data_size, msg->insize);
 		ret =3D -ENOSPC;
 		goto done;
@@ -356,22 +353,20 @@ static int __init cros_ec_lpc_init(void)
 {
 	int ret;
 =

-	if (!dmi_check_system(cros_ec_lpc_dmi_table)) {
-		pr_err(DRV_NAME ": unsupported system.\n");
+	if (!dmi_check_system(cros_ec_lpc_dmi_table))
 		return -ENODEV;
-	}
 =

 	/* Register the driver */
 	ret =3D platform_driver_register(&cros_ec_lpc_driver);
 	if (ret) {
-		pr_err(DRV_NAME ": can't register driver: %d\n", ret);
+		pr_err("can't register driver: %d\n", ret);
 		return ret;
 	}
 =

 	/* Register the device, and it'll get hooked up automatically */
 	ret =3D platform_device_register(&cros_ec_lpc_device);
 	if (ret) {
-		pr_err(DRV_NAME ": can't register device: %d\n", ret);
+		pr_err("can't register device: %d\n", ret);
 		platform_driver_unregister(&cros_ec_lpc_driver);
 		return ret;
 	}



--===============4660218738171697435==--

