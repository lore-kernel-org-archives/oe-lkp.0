Content-Type: multipart/mixed; boundary="===============6089467114391404269=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [ide] b7fb14d3ac: EIP:ioread32_rep
Date: Wed, 07 Jul 2021 10:35:28 +0200
Message-ID: <20210707083528.GA353@lst.de>
In-Reply-To: <20210707081220.GA31179@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============6089467114391404269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 07, 2021 at 10:12:20AM +0200, Christoph Hellwig wrote:
> On Tue, Jul 06, 2021 at 12:08:42PM -0700, Linus Torvalds wrote:
> > On Tue, Jul 6, 2021 at 7:36 AM Christoph Hellwig <hch@lst.de> wrote:
> > >
> > > Yeah, there's usually a huge offset into the page.  The otherwise
> > > similar ATAPI code actually has checks to chunk it up and not cross
> > > page boundaries, and copying that over fixes the problem.
> > =

> > Ok.
> > =

> > Your patch made me go "I think it should loop until it has transferred
> > the full 512 bytes", but maybe the caller loops properly?
> =

> Yes, the callers (ata_read_pio_sectors) does).

Actually, not it doesn't. Sorry.  So for a non-aligned large request
this won't work.  So we'll need to actually loop here.

This is probably better and fixes the issue as well (and ATAPI
probably needs the same treatment):


diff --git a/drivers/ata/libata-sff.c b/drivers/ata/libata-sff.c
index ae7189d1a568..40d2dc3b2989 100644
--- a/drivers/ata/libata-sff.c
+++ b/drivers/ata/libata-sff.c
@@ -637,6 +637,20 @@ unsigned int ata_sff_data_xfer32(struct ata_queued_cmd=
 *qc, unsigned char *buf,
 }
 EXPORT_SYMBOL_GPL(ata_sff_data_xfer32);
 =

+static void ata_pio_xfer(struct ata_queued_cmd *qc, struct page *page,
+		unsigned int offset, size_t xfer_size)
+{
+	bool do_write =3D (qc->tf.flags & ATA_TFLAG_WRITE);
+	unsigned char *buf;
+
+	buf =3D kmap_atomic(page);
+	qc->ap->ops->sff_data_xfer(qc, buf + offset, xfer_size, do_write);
+	kunmap_atomic(buf);
+
+	if (!do_write && !PageSlab(page))
+		flush_dcache_page(page);
+}
+
 /**
  *	ata_pio_sector - Transfer a sector of data.
  *	@qc: Command on going
@@ -648,11 +662,9 @@ EXPORT_SYMBOL_GPL(ata_sff_data_xfer32);
  */
 static void ata_pio_sector(struct ata_queued_cmd *qc)
 {
-	int do_write =3D (qc->tf.flags & ATA_TFLAG_WRITE);
 	struct ata_port *ap =3D qc->ap;
 	struct page *page;
 	unsigned int offset;
-	unsigned char *buf;
 =

 	if (!qc->cursg) {
 		qc->curbytes =3D qc->nbytes;
@@ -670,13 +682,15 @@ static void ata_pio_sector(struct ata_queued_cmd *qc)
 =

 	DPRINTK("data %s\n", qc->tf.flags & ATA_TFLAG_WRITE ? "write" : "read");
 =

-	/* do the actual data transfer */
-	buf =3D kmap_atomic(page);
-	ap->ops->sff_data_xfer(qc, buf + offset, qc->sect_size, do_write);
-	kunmap_atomic(buf);
+	if (offset + qc->sect_size > PAGE_SIZE) {
+		unsigned int split_len =3D PAGE_SIZE - offset;
 =

-	if (!do_write && !PageSlab(page))
-		flush_dcache_page(page);
+		ata_pio_xfer(qc, page, offset, split_len);
+		ata_pio_xfer(qc, nth_page(page, 1), 0,
+			     qc->sect_size - split_len);
+	} else {
+		ata_pio_xfer(qc, page, offset, qc->sect_size);
+	}
 =

 	qc->curbytes +=3D qc->sect_size;
 	qc->cursg_ofs +=3D qc->sect_size;
--===============6089467114391404269==--

