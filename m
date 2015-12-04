Content-Type: multipart/mixed; boundary="===============4049587396951191562=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: rhashtable: Use __vmalloc with GFP_ATOMIC for table allocation
Date: Fri, 04 Dec 2015 22:39:56 +0800
Message-ID: <20151204143956.GA17471@gondor.apana.org.au>
In-Reply-To: <1449158919.6379.27.camel@edumazet-glaptop2.roam.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4049587396951191562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2015 at 08:08:39AM -0800, Eric Dumazet wrote:
>
> Anyway, __vmalloc() can be used with GFP_ATOMIC, have you tried this ?

OK I've tried it and I no longer get any ENOMEM errors!

---8<---
When an rhashtable user pounds rhashtable hard with back-to-back
insertions we may end up growing the table in GFP_ATOMIC context.
Unfortunately when the table reaches a certain size this often
fails because we don't have enough physically contiguous pages
to hold the new table.

Eric Dumazet suggested (and in fact wrote this patch) using
__vmalloc instead which can be used in GFP_ATOMIC context.

Reported-by: Phil Sutter <phil@nwl.cc>
Suggested-by: Eric Dumazet <eric.dumazet@gmail.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/lib/rhashtable.c b/lib/rhashtable.c
index a54ff89..1c624db 100644
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

-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============4049587396951191562==--

