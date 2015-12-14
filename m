Content-Type: multipart/mixed; boundary="===============4895194052282409947=="
MIME-Version: 1.0
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: lkp@lists.01.org
Subject: Re: [nand] BUG: unable to handle kernel NULL pointer dereference at 000005f4
Date: Mon, 14 Dec 2015 14:04:33 +0100
Message-ID: <20151214140433.0508bb07@bbrezillon>
In-Reply-To: <20151214135809.11b92131@bbrezillon>
List-Id: <oe-lkp.lists.linux.dev>

--===============4895194052282409947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 14 Dec 2015 13:58:09 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Mon, 14 Dec 2015 20:47:19 +0800
> Fengguang Wu <fengguang.wu@intel.com> wrote:
> =

> > On Mon, Dec 14, 2015 at 11:42:44AM +0100, Boris Brezillon wrote:
> > > Hi Fengguang,
> > > =

> > > On Mon, 14 Dec 2015 14:45:37 +0800
> > > Fengguang Wu <fengguang.wu@intel.com> wrote:
> > > =

> > > > Hi Boris,
> > > > =

> > > > On Sun, Dec 13, 2015 at 09:50:43PM +0100, Boris Brezillon wrote:
> > > > > Hi Fengguang,
> > > > > =

> > > > > On Sun, 13 Dec 2015 09:49:17 +0800
> > > > > Fengguang Wu <fengguang.wu@intel.com> wrote:
> > > > > =

> > > > > > Hi Boris,
> > > > > > =

> > > > > > FYI, this happened when merging your branch, which indicates po=
ssible
> > > > > > conflicts with other developer's patches or the new RC release.
> > > > > =

> > > > > Is this boot test also run on my bbrezillon-0day/nand/layering-re=
work
> > > > > branch (before merging it into devel-spot), and if it is, do you =
see the
> > > > > same error?
> > > > =

> > > > The bisect tests bbrezillon-0day/nand/layering-rework, however it's
> > > > fine there.
> > > > =

> > > > > Is the devel-spot-201512102358 tag publicly accessible? If it's n=
ot,
> > > > =

> > > > Nope.
> > > > =

> > > > > could you push it somewhere (or give me a way to generate it by
> > > > > pulling the relevant branches), so that I can investigate on this=
 bug? =

> > > > =

> > > > Or it may be more convenient to check linux-next first?
> > > > =

> > > > FYI, the merged branches in devel-spot-201512102358 are:
> > > > =

> > > > af8fc33 Merge 'bbrezillon-0day/nand/layering-rework' into devel-spo=
t-201512102358
> > > > acfc1de Merge 'linux-review/Maury-Markowitz/renaming-NTSC-file-beca=
use-it-doesnt-actually-use-8VSV-updating-channel-listings-add-channel-numbe=
rs/20151210-210449' into devel-spot-201512102358
> > > > fb9daac Merge 'fdmanana/integration-4.4' into devel-spot-2015121023=
58
> > > > 1b30725 Merge 'fdmanana/for-chris-4.4' into devel-spot-201512102358
> > > > 83f2246 Merge 'arm-integrator/realview-defconfig' into devel-spot-2=
01512102358
> > > > 03df745 Merge 'arm-integrator/realview-multiplatform-base' into dev=
el-spot-201512102358
> > > > d2aea29 Merge 'linux-review/Arnd-Bergmann/i2c-allow-building-emev2-=
without-slave-mode-again/20151210-211642' into devel-spot-201512102358
> > > > e2f041d Merge 'arm-integrator/realview-base-armsoc' into devel-spot=
-201512102358
> > > > 5c46550 Merge 'linux-review/Bert-Kenward/sfc-only-use-RSS-filters-i=
f-we-re-using-RSS/20151210-213247' into devel-spot-201512102358
> > > > d07f80f Merge 'sound/test/hdmi-jack' into devel-spot-201512102358
> > > > 540f8b7 Merge 'sound/topic/hdmi-jack' into devel-spot-201512102358
> > > > 9111fa0 Merge 'linux-review/matrandg-cisco-com/tc358743-Use-local-a=
rray-with-fixed-size-in-i2c-write/20151210-214154' into devel-spot-20151210=
2358
> > > > 3d81ef9 Merge 'linux-review/matrandg-cisco-com/tc358743-Print-timin=
gs-only-when-debug-level-is-set/20151210-220321' into devel-spot-2015121023=
58
> > > > 122e43c Merge 'bbrezillon-0day/nand/ecclayout-squashed' into devel-=
spot-201512102358
> > > > e0572f8 Merge 'wireless-drivers-next/pending' into devel-spot-20151=
2102358
> > > > dc5d9c9 Merge 'linux-review/Geliang-Tang/list-introduce-list_is_fir=
st/20151210-222552' into devel-spot-201512102358
> > > > 289e2a8 Merge 'linux-review/Arnd-Bergmann/staging-davinci_vfpe-allo=
w-modular-build/20151210-223348' into devel-spot-201512102358
> > > > d74c50d Merge 'linux-review/Damien-Horsley/Add-driver-for-Pistachio=
-internal-DAC/20151210-224304' into devel-spot-201512102358
> > > > ee3c58b Merge 'cryptodev/master' into devel-spot-201512102358
> > > > d390f7d Merge 'linux-review/John-Garry/hisi_sas-use-platform_get_ir=
q/20151210-224851' into devel-spot-201512102358
> > > > de31f5d Merge 'linux-review/Mike-Marciniszyn/staging-rdma-hfi1-add-=
definitions-for-OPA-traps/20151210-230158' into devel-spot-201512102358
> > > > 5618568 Merge 'linux-review/Andrei-Emeltchenko/Bluetooth-h5-Do-not-=
initialize-Configuration-field/20151210-230440' into devel-spot-201512102358
> > > > 759aa32 Merge 'linux-review/Moritz-K-nig/staging-COMEDI-checkpatch-=
pl-cleanups-in-comedi-h/20151210-230707' into devel-spot-201512102358
> > > > 2edcbb4 Merge 'linux-review/Andy-Shevchenko/net-hns-annotate-IO-add=
ress-space-properly/20151210-232510' into devel-spot-201512102358
> > > > 0f51fdd Merge 'integrity/next-kexec' into devel-spot-201512102358
> > > > b32bcbc Merge 'dm/dm-4.5' into devel-spot-201512102358
> > > > ea297f5 Merge 'linux-review/Mathieu-Desnoyers/thread_local_abi-syst=
em-call-caching-current-CPU-number-x86/20151210-234242' into devel-spot-201=
512102358
> > > > 52bc163 Merge 'linux-review/yegorslists-googlemail-com/USB-serial-o=
ption-add-support-for-Quectel-UC20/20151210-234659' into devel-spot-2015121=
02358
> > > > 797cc7c Merge 'linux-review/Andy-Shevchenko/staging-rtl8188eu-provi=
de-an-absolute-path-to-include-folder/20151210-234752' into devel-spot-2015=
12102358
> > > > 23d8b49 Merge 'omap-dss2/for-next' into devel-spot-201512102358
> > > > 88a768f 0day base guard for 'devel-spot-201512102358'
> > > > 527e931 Linux 4.4-rc4
> > > > =

> > > > > > =

> > > > > > linux-next/master also has the problem.
> > > > > =

> > > > > Okay. You mean linux-next/master alone, or after merging my branc=
h into
> > > > > linux-next/master?
> > > > =

> > > > It's stand alone linux-next/master as indicated by the bisect log.
> > > > Does it include any of your patches?
> > > =

> > > I tried to boot the next-20151214 build, before [1] and after [2]
> > > merging my nand/layering-rework branch merged into it, and both are
> > > booting fine.
> > =

> > Are you using the emailed kconfig? I'd not recommend try the below
> > step if cannot even reproduce the issue in linux-next.
> =

> Yes, I did use the config you attached in your email + the script your
> pasted to boot the kernel with qemu, and linux-next/master boots
> correctly.
> As answered in the other email I just sent, I managed to reproduce the
> bug you're pointing after merging both
> bbrezillon-0day/nand/ecclayout-squashed and
> bbrezillon-0day/nand/layering-rework into linus' 4.4-rc4.
> =

> =


FYI, below is the patch I used to fix the bug, but I'd be interested in
reproducing the problem you've seen on linux-next/master. Did you, by
any chance, keep the branch/tag you used to trigger this bug on
linux-next?

--->8---
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -62,7 +62,7 @@ DEFINE_LED_TRIGGER(nand_led_trigger);
 /* Define default oob placement schemes for large and small page
devices */ static int nand_ooblayout_eccpos_sp(struct mtd_info *mtd,
int eccbyte) {
-	struct nand_chip *chip =3D mtd->priv;
+	struct nand_chip *chip =3D mtd_to_nand(mtd);
 	struct nand_ecc_ctrl *ecc =3D &chip->ecc;
 =

 	if (eccbyte >=3D ecc->bytes * ecc->steps)
@@ -105,7 +105,7 @@ EXPORT_SYMBOL_GPL(nand_ooblayout_sp_ops);
 =

 static int nand_ooblayout_eccpos_lp(struct mtd_info *mtd, int eccbyte)
 {
-	struct nand_chip *chip =3D mtd->priv;
+	struct nand_chip *chip =3D mtd_to_nand(mtd);
 	struct nand_ecc_ctrl *ecc =3D &chip->ecc;
 	int eccbytes =3D ecc->bytes * ecc->steps;
 =

@@ -118,7 +118,7 @@ static int nand_ooblayout_eccpos_lp(struct mtd_info
*mtd, int eccbyte) static int nand_ooblayout_oobfree_lp(struct mtd_info
*mtd, int section, struct nand_oobfree *oobfree)
 {
-	struct nand_chip *chip =3D mtd->priv;
+	struct nand_chip *chip =3D mtd_to_nand(mtd);
 	struct nand_ecc_ctrl *ecc =3D &chip->ecc;
 =

 	if (section)
@@ -1638,7 +1638,7 @@ static int nand_read_page_syndrome(struct
mtd_info *mtd, struct nand_chip *chip, static uint8_t
*nand_transfer_oob(struct mtd_info *mtd, uint8_t *oob, struct
mtd_oob_ops *ops, size_t len) {
-	struct nand_chip *chip =3D mtd->priv;
+	struct nand_chip *chip =3D mtd_to_nand(mtd);
 =

 	switch (ops->mode) {
=20

--===============4895194052282409947==--

