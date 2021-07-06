Content-Type: multipart/mixed; boundary="===============0555518527582537318=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [ide] b7fb14d3ac: EIP:ioread32_rep
Date: Tue, 06 Jul 2021 16:36:47 +0200
Message-ID: <20210706143647.GA28289@lst.de>
In-Reply-To: <CAHk-=wj_Gfqkdp+K3iCiqMjAZQK_BrRWDs2eOS_BAw=bB=CdRw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0555518527582537318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 05, 2021 at 01:00:09PM -0700, Linus Torvalds wrote:
> It might perhaps be worth adding some kind of
> =

>      WARN_ON_ONCE(offset & 511);
> =

> in the callchain somewhere for that ata_queued_cmd(). But at that
> point I no longer know the code.

Yeah, there's usually a huge offset into the page.  The otherwise
similar ATAPI code actually has checks to chunk it up and not cross
page boundaries, and copying that over fixes the problem.  The testbot
config then crashes in an infiband driver, but disabling that driver
entirely makes it boot fine:

diff --git a/drivers/ata/libata-sff.c b/drivers/ata/libata-sff.c
index ae7189d1a568..018f021c45a3 100644
--- a/drivers/ata/libata-sff.c
+++ b/drivers/ata/libata-sff.c
@@ -651,7 +651,7 @@ static void ata_pio_sector(struct ata_queued_cmd *qc)
 	int do_write =3D (qc->tf.flags & ATA_TFLAG_WRITE);
 	struct ata_port *ap =3D qc->ap;
 	struct page *page;
-	unsigned int offset;
+	unsigned int offset, count;
 	unsigned char *buf;
 =

 	if (!qc->cursg) {
@@ -670,16 +670,22 @@ static void ata_pio_sector(struct ata_queued_cmd *qc)
 =

 	DPRINTK("data %s\n", qc->tf.flags & ATA_TFLAG_WRITE ? "write" : "read");
 =

+	/* don't overrun current sg */
+	count =3D min(qc->cursg->length - qc->cursg_ofs, qc->sect_size);
+
+	/* don't cross page boundaries */
+	count =3D min(count, (unsigned int)PAGE_SIZE - offset);
+
 	/* do the actual data transfer */
 	buf =3D kmap_atomic(page);
-	ap->ops->sff_data_xfer(qc, buf + offset, qc->sect_size, do_write);
+	ap->ops->sff_data_xfer(qc, buf + offset, count, do_write);
 	kunmap_atomic(buf);
 =

 	if (!do_write && !PageSlab(page))
 		flush_dcache_page(page);
 =

-	qc->curbytes +=3D qc->sect_size;
-	qc->cursg_ofs +=3D qc->sect_size;
+	qc->curbytes +=3D count;
+	qc->cursg_ofs +=3D count;
 =

 	if (qc->cursg_ofs =3D=3D qc->cursg->length) {
 		qc->cursg =3D sg_next(qc->cursg);
--===============0555518527582537318==--

