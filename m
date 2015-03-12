Content-Type: multipart/mixed; boundary="===============3518777391640884507=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: [rhashtable] [ INFO: possible recursive locking detected ]
Date: Thu, 12 Mar 2015 14:37:45 +1100
Message-ID: <20150312033744.GA13869@gondor.apana.org.au>
In-Reply-To: <20150312032924.GA12390@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3518777391640884507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2015 at 11:29:24AM +0800, Fengguang Wu wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/net-next.git master
> =

> commit aa34a6cb0478842452bac58edb50d3ef9e178c92
> Author:     Herbert Xu <herbert@gondor.apana.org.au>
> AuthorDate: Wed Mar 11 09:43:48 2015 +1100
> Commit:     David S. Miller <davem@davemloft.net>
> CommitDate: Wed Mar 11 16:36:21 2015 -0400

Thanks for the report.  This patch should fix it.

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
index 5f9af45..6ffc793 100644
--- a/lib/rhashtable.c
+++ b/lib/rhashtable.c
@@ -225,7 +225,7 @@ static int rhashtable_rehash_one(struct rhashtable *ht,=
 unsigned old_hash)
 =

 	new_bucket_lock =3D bucket_lock(new_tbl, new_hash);
 =

-	spin_lock(new_bucket_lock);
+	spin_lock_nested(new_bucket_lock, RHT_LOCK_NESTED);
 	head =3D rht_dereference_bucket(new_tbl->buckets[new_hash],
 				      new_tbl, new_hash);
 =

@@ -406,7 +406,7 @@ static bool __rhashtable_insert(struct rhashtable *ht, =
struct rhash_head *obj,
 	tbl =3D rht_dereference_rcu(ht->future_tbl, ht);
 	if (tbl !=3D old_tbl) {
 		hash =3D head_hashfn(ht, tbl, obj);
-		spin_lock(bucket_lock(tbl, hash));
+		spin_lock_nested(bucket_lock(tbl, hash), RHT_LOCK_NESTED);
 	}
 =

 	if (compare &&
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============3518777391640884507==--

