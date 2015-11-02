Content-Type: multipart/mixed; boundary="===============4605083478625598061=="
MIME-Version: 1.0
From: Joerg Roedel <jroedel@suse.de>
To: lkp@lists.01.org
Subject: [PATCH] iommu/vt-d: Fix return value check of parse_ioapics_under_ir()
Date: Mon, 02 Nov 2015 20:00:14 +0900
Message-ID: <20151102110014.GC2704@suse.de>
In-Reply-To: <87h9l494nd.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4605083478625598061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2015 at 04:39:18PM +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git x86/vt-d
> commit a13c8f27e4d79420ae7bcb48123fa13851026428 ("iommu/vt-d: Adjust the =
return value of the parse_ioapics_under_ir")
> =

> We found the following new message in kernel log.
> =

> [    0.126325] DMAR-IR: Failed to enable irq remapping. You are vulnerabl=
e to irq-injection attacks.

Thanks for the report, I just queued the fix below.

>From b61e5e80e3cd37f0183cdc04b03861a0467d9f52 Mon Sep 17 00:00:00 2001
From: Joerg Roedel <jroedel@suse.de>
Date: Mon, 2 Nov 2015 19:57:31 +0900
Subject: [PATCH] iommu/vt-d: Fix return value check of parse_ioapics_under_=
ir()

The function returns 0 on success, so check for the right
value.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/intel_irq_remapping.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/intel_irq_remapping.c b/drivers/iommu/intel_irq_=
remapping.c
index f3a9bd1..1fae188 100644
--- a/drivers/iommu/intel_irq_remapping.c
+++ b/drivers/iommu/intel_irq_remapping.c
@@ -690,7 +690,7 @@ static int __init intel_prepare_irq_remapping(void)
 	if (!dmar_ir_support())
 		return -ENODEV;
 =

-	if (!parse_ioapics_under_ir()) {
+	if (parse_ioapics_under_ir()) {
 		pr_info("Not enabling interrupt remapping\n");
 		goto error;
 	}
-- =

1.8.4.5


--===============4605083478625598061==--

