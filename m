Content-Type: multipart/mixed; boundary="===============4177731314887142095=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: [rhashtable] [ INFO: possible recursive locking detected ]
Date: Thu, 12 Mar 2015 14:47:13 +1100
Message-ID: <20150312034713.GA14026@gondor.apana.org.au>
In-Reply-To: <20150311.234156.247575265894541661.davem@davemloft.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4177731314887142095==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2015 at 11:41:56PM -0400, David Miller wrote:
> From: Herbert Xu <herbert@gondor.apana.org.au>
> Date: Thu, 12 Mar 2015 14:37:45 +1100
> =

> > rhashtable: Add annotation to nested lock
> >     =

> > Commit aa34a6cb0478842452bac58edb50d3ef9e178c92 ("rhashtable:
> > Add arbitrary rehash function") killed the annotation on the
> > nested lock which leads to bitching from lockdep.
> >     =

> > Reported-by: Fengguang Wu <fengguang.wu@intel.com>
> > Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
> =

> This doesn't apply to net-next, the second hunk gives a reject.

Sorry, I based on this on top of the cleanup patches sent earlier.
Here is a rebase on net-next.  I will resend the cleanups later.

--8<--
rhashtable: Add annotation to nested lock
    =

Commit aa34a6cb0478842452bac58edb50d3ef9e178c92 ("rhashtable:
Add arbitrary rehash function") killed the annotation on the
nested lock which leads to bitching from lockdep.
    =

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/lib/rhashtable.c b/lib/rhashtable.c
index b1c19c5..d7f3db5 100644
--- a/lib/rhashtable.c
+++ b/lib/rhashtable.c
@@ -234,7 +234,7 @@ static int rhashtable_rehash_one(struct rhashtable *ht,=
 unsigned old_hash)
 =

 	new_bucket_lock =3D bucket_lock(new_tbl, new_hash);
 =

-	spin_lock(new_bucket_lock);
+	spin_lock_nested(new_bucket_lock, RHT_LOCK_NESTED);
 	head =3D rht_dereference_bucket(new_tbl->buckets[new_hash],
 				      new_tbl, new_hash);
 =

@@ -415,7 +415,7 @@ static bool __rhashtable_insert(struct rhashtable *ht, =
struct rhash_head *obj,
 	tbl =3D rht_dereference_rcu(ht->future_tbl, ht);
 	if (tbl !=3D old_tbl) {
 		hash =3D obj_raw_hashfn(ht, tbl, rht_obj(ht, obj));
-		spin_lock(bucket_lock(tbl, hash));
+		spin_lock_nested(bucket_lock(tbl, hash), RHT_LOCK_NESTED);
 	}
 =

 	if (compare &&

-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============4177731314887142095==--

