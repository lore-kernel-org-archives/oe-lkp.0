Content-Type: multipart/mixed; boundary="===============0006663567454442241=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: [rhashtable] f9f51b8070: INFO: suspicious RCU usage. ]
Date: Fri, 18 Dec 2015 13:34:16 +0800
Message-ID: <20151218053416.GA19479@gondor.apana.org.au>
In-Reply-To: <874mfgedrp.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0006663567454442241==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 18, 2015 at 09:39:22AM +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://github.com/0day-ci/linux Herbert-Xu/rhashtable-Fix-walker-list-co=
rruption/20151216-164833
> commit f9f51b8070be3e829100614a7372b219723b864f ("rhashtable: Fix walker =
list corruption")
> =

> =

> [    8.933376] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    8.933376] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    8.934629] [ INFO: suspicious RCU usage. ]
> [    8.934629] [ INFO: suspicious RCU usage. ]
> [    8.935941] 4.4.0-rc3-00995-gf9f51b8 #2 Not tainted
> [    8.935941] 4.4.0-rc3-00995-gf9f51b8 #2 Not tainted
> [    8.937494] -------------------------------
> [    8.937494] -------------------------------
> [    8.938818] lib/rhashtable.c:504 suspicious rcu_dereference_protected(=
) usage!
> [    8.938818] lib/rhashtable.c:504 suspicious rcu_dereference_protected(=
) usage!

This is actually a false positive because the new spin lock that
we hold prevents ht->tbl from disappearing under us.  So here is
a patch to kill the warning with a comment.

---8<---
The commit f9f51b8070be3e829100614a7372b219723b864f ("rhashtable:
Fix walker list corruption") causes a suspicious RCU usage warning
because we no longer hold ht->mutex when we dereference ht->tbl.

However, this is a false positive because we now hold ht->lock
which also guarantees that ht->tbl won't disppear from under us.

This patch kills the warning by using rcu_dereference_raw and
adding a comment.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/lib/rhashtable.c b/lib/rhashtable.c
index eb9240c..3404b06 100644
--- a/lib/rhashtable.c
+++ b/lib/rhashtable.c
@@ -519,7 +519,11 @@ int rhashtable_walk_init(struct rhashtable *ht, struct=
 rhashtable_iter *iter)
 		return -ENOMEM;
 =

 	spin_lock(&ht->lock);
-	iter->walker->tbl =3D rht_dereference(ht->tbl, ht);
+	/* We do not need RCU protection because we hold ht->lock
+	 * which guarantees that if we see ht->tbl then it won't
+	 * die on us.
+	 */
+	iter->walker->tbl =3D rcu_dereference_raw(ht->tbl);
 	list_add(&iter->walker->list, &iter->walker->tbl->walkers);
 	spin_unlock(&ht->lock);
 =

-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============0006663567454442241==--

