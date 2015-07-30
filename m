Content-Type: multipart/mixed; boundary="===============2208639255619406752=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [block] bcf2843b3f8: BUG: KASan: use after free in dio_bio_complete+0x15a/0x190 at addr ffff88001114e6f8
Date: Thu, 30 Jul 2015 08:22:05 +0200
Message-ID: <20150730062205.GB29312@lst.de>
In-Reply-To: <1438224799.6405.12.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2208639255619406752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2015 at 10:53:19AM +0800, Huang Ying wrote:
> FYI, we noticed the below changes on

This should fix it:


diff --git a/fs/direct-io.c b/fs/direct-io.c
index e1639c8..31b2d35 100644
--- a/fs/direct-io.c
+++ b/fs/direct-io.c
@@ -458,9 +458,10 @@ static struct bio *dio_await_one(struct dio *dio)
 static int dio_bio_complete(struct dio *dio, struct bio *bio)
 {
 	struct bio_vec *bvec;
+	int error =3D bio->bi_error;
 	unsigned i;
 =

-	if (bio->bi_error)
+	if (error)
 		dio->io_error =3D -EIO;
 =

 	if (dio->is_async && dio->rw =3D=3D READ) {
@@ -475,7 +476,7 @@ static int dio_bio_complete(struct dio *dio, struct bio=
 *bio)
 		}
 		bio_put(bio);
 	}
-	return bio->bi_error;
+	return error;
 }
 =

 /*

--===============2208639255619406752==--

