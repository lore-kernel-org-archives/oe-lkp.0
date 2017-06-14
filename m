Content-Type: multipart/mixed; boundary="===============0095528578509271874=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [EDAC, sb_edac] e2f747b1f4: kmsg.EDAC_sbridge:Failed_to_register_device_with_error
Date: Wed, 14 Jun 2017 11:55:07 +0200
Message-ID: <20170614095507.i2w6k5dqo5gxbwk6@pd.tnic>
In-Reply-To: <20170612051113.GD22185@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0095528578509271874==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2017 at 01:11:13PM +0800, Ye Xiaolong wrote:
> Confirmed the error is gone with qiuxu's fix patch.
> =

> Tested-by: From: Ye Xiaolong <xiaolong.ye@intel.com>

Thanks guys, I massaged it a bit and ended up applying this:

---
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Date: Thu, 8 Jun 2017 19:33:51 +0800
Subject: [PATCH] EDAC, sb_edac: Avoid creating SOCK memory controller

Xiaolong Ye reported the following failure on Broadwell D server:

  EDAC sbridge: Some needed devices are missing
  EDAC MC: Removed device 0 for sbridge_edac.c Broadwell SrcID#0_Ha#0: DEV =
0000:ff:12.0
  EDAC sbridge: Couldn't find mci handler
  EDAC sbridge: Failed to register device with error -19.

Broadwell D (only IMC0 per socket) and Broadwell X (IMC0 and IMC1 per
socket) use the same PCI device IDs for IMC0 per socket, then they
share pci_dev_descr_broadwell_table (n_imcs_per_sock=3D2). In this case,
Broadwell D wrongly creates the nonexistent SOCK EDAC memory controller
and reports above error messages, since it has no IMC1 per socket.

Avoid creating the nonexistent SOCK memory controller.

Reported-and-tested-by: Xiaolong Ye <xiaolong.ye@intel.com>
Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Cc: Tony Luck <tony.luck@intel.com>
Cc: linux-edac <linux-edac@vger.kernel.org>
Link: http://lkml.kernel.org/r/20170608113351.25323-1-qiuxu.zhuo(a)intel.com
[ Massage. ]
Signed-off-by: Borislav Petkov <bp@suse.de>
---
 drivers/edac/sb_edac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/edac/sb_edac.c b/drivers/edac/sb_edac.c
index 89fd6bd64df6..80d860cb0746 100644
--- a/drivers/edac/sb_edac.c
+++ b/drivers/edac/sb_edac.c
@@ -2260,6 +2260,10 @@ static int sbridge_get_onedevice(struct pci_dev **pr=
ev,
 next_imc:
 	sbridge_dev =3D get_sbridge_dev(bus, dev_descr->dom, multi_bus, sbridge_d=
ev);
 	if (!sbridge_dev) {
+
+		if (dev_descr->dom =3D=3D SOCK)
+			goto out_imc;
+
 		sbridge_dev =3D alloc_sbridge_dev(bus, dev_descr->dom, table);
 		if (!sbridge_dev) {
 			pci_dev_put(pdev);
@@ -2285,6 +2289,7 @@ static int sbridge_get_onedevice(struct pci_dev **pre=
v,
 	if (dev_descr->dom =3D=3D SOCK && i < table->n_imcs_per_sock)
 		goto next_imc;
 =

+out_imc:
 	/* Be sure that the device is enabled */
 	if (unlikely(pci_enable_device(pdev) < 0)) {
 		sbridge_printk(KERN_ERR,
-- =

2.13.0

-- =

Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

--===============0095528578509271874==--

