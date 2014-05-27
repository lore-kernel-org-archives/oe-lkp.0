Content-Type: multipart/mixed; boundary="===============7038232355856690226=="
MIME-Version: 1.0
From: Maurizio Lombardi <mlombard@redhat.com>
To: lkp@lists.01.org
Subject: Re: [jet.chen@intel.com: [bio] kernel BUG at drivers/block/virtio_blk.c:166!]
Date: Tue, 27 May 2014 13:24:59 +0200
Message-ID: <20140527112459.GF2205@dhcp-27-189.brq.redhat.com>
In-Reply-To: <20140527084359.GD2205@dhcp-27-189.brq.redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7038232355856690226==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2014 at 10:43:59AM +0200, Maurizio Lombardi wrote:
> =

> But now I'm suspicious of this part of commit 3979ef4dcf:
> =

>  failed:
>         bvec->bv_page =3D NULL;
>         bvec->bv_len =3D 0;
>         bvec->bv_offset =3D 0;
>         bio->bi_vcnt--;  <----------------
>         blk_recount_segments(q, bio);
>         return 0;
> =

> Is decreasing bi_vcnt sufficient to guarantee that blk_recount_segments()
> recalculates the correct number of physical segments?
> Looking at the __blk_recalc_rq_segments() it appears it may not be the ca=
se.
> =

> The question is how can we restore the correct number of physical segment=
s in case
> of failure without breaking anything...
>

If my hypothesis is correct, the following patch should trigger a kernel pa=
nic,
Jet Chen, can you try it and let me know whether the BUG_ON is hit or not?

diff --git a/block/bio.c b/block/bio.c
index 0443694..763868f 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -701,6 +701,7 @@ static int __bio_add_page(struct request_queue *q, stru=
ct bio *bio, struct page
 			  unsigned int max_sectors)
 {
 	int retried_segments =3D 0;
+	unsigned int phys_segments_orig;
 	struct bio_vec *bvec;
 =

 	/*
@@ -751,6 +752,9 @@ static int __bio_add_page(struct request_queue *q, stru=
ct bio *bio, struct page
 	if (bio->bi_vcnt >=3D bio->bi_max_vecs)
 		return 0;
 =

+	blk_recount_segments(q, bio);
+	phys_segments_orig =3D bio->bi_phys_segments;
+
 	/*
 	 * setup the new entry, we might clear it again later if we
 	 * cannot add the page
@@ -811,6 +815,7 @@ static int __bio_add_page(struct request_queue *q, stru=
ct bio *bio, struct page
 	bvec->bv_offset =3D 0;
 	bio->bi_vcnt--;
 	blk_recount_segments(q, bio);
+	BUG_ON(phys_segments_orig !=3D bio->bi_phys_segments);
 	return 0;
 }


Regards,
Maurizio Lombardi=20

--===============7038232355856690226==--

