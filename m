Content-Type: multipart/mixed; boundary="===============4577331737050036251=="
MIME-Version: 1.0
From: Eric Dumazet <eric.dumazet@gmail.com>
To: lkp@lists.01.org
Subject: Re: rhashtable: ENOMEM errors when hit with a flood of insertions
Date: Thu, 03 Dec 2015 08:08:39 -0800
Message-ID: <1449158919.6379.27.camel@edumazet-glaptop2.roam.corp.google.com>
In-Reply-To: <20151203125117.GB5505@gondor.apana.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============4577331737050036251==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2015-12-03 at 20:51 +0800, Herbert Xu wrote:
> On Mon, Nov 30, 2015 at 06:18:59PM +0800, Herbert Xu wrote:
> > =

> > OK that's better.  I think I see the problem.  The test in
> > rhashtable_insert_rehash is racy and if two threads both try
> > to grow the table one of them may be tricked into doing a rehash
> > instead.
> > =

> > I'm working on a fix.
> =

> While the EBUSY errors are gone for me, I can still see plenty
> of ENOMEM errors.  In fact it turns out that the reason is quite
> understandable.  When you pound the rhashtable hard so that it
> doesn't actually get a chance to grow the table in process context,
> then the table will only grow with GFP_ATOMIC allocations.
> =

> For me this starts failing regularly at around 2^19 entries, which
> requires about 1024 contiguous pages if I'm not mistaken.

Well, it will fail before this point if memory is fragmented.

Anyway, __vmalloc() can be used with GFP_ATOMIC, have you tried this ?

diff --git a/lib/rhashtable.c b/lib/rhashtable.c
index a54ff8949f91..9ef5d74963b2 100644
--- a/lib/rhashtable.c
+++ b/lib/rhashtable.c
@@ -120,8 +120,9 @@ static struct bucket_table *bucket_table_alloc(struct r=
hashtable *ht,
 	if (size <=3D (PAGE_SIZE << PAGE_ALLOC_COSTLY_ORDER) ||
 	    gfp !=3D GFP_KERNEL)
 		tbl =3D kzalloc(size, gfp | __GFP_NOWARN | __GFP_NORETRY);
-	if (tbl =3D=3D NULL && gfp =3D=3D GFP_KERNEL)
-		tbl =3D vzalloc(size);
+	if (tbl =3D=3D NULL)
+		tbl =3D __vmalloc(size, gfp | __GFP_HIGHMEM | __GFP_ZERO,
+				PAGE_KERNEL);
 	if (tbl =3D=3D NULL)
 		return NULL;
 =




--===============4577331737050036251==--

