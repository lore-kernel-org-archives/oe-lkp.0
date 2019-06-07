Content-Type: multipart/mixed; boundary="===============7664726520268056103=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: inet: frags: Turn fqdir->dead into an int for old Alphas
Date: Fri, 07 Jun 2019 22:09:49 +0800
Message-ID: <20190607140949.tzwyprrhmqdx33iu@gondor.apana.org.au>
In-Reply-To: <CAHk-=wgGnCw==uY8radrB+Tg_CEmzOtwzyjfMkuh7JmqFh+jzQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7664726520268056103==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 09:04:55AM -0700, Linus Torvalds wrote:
>
> In fact, the alpha port was always subtly buggy exactly because of the
> "byte write turns into a read-and-masked-write", even if I don't think
> anybody ever noticed (we did fix cases where people _did_ notice,
> though, and we might still have some cases where we use 'int' for
> booleans because of alpha issues.).

This is in fact a real bug in the code in question that no amount
of READ_ONCE/WRITE_ONCE would have caught.  The field fqdir->dead is
declared as boolean so writing to it is not atomic (on old Alphas).

I don't think it currently matters because padding would ensure
that it is in fact 64 bits long.  However, should someone add another
char/bool/bitfield in this struct in future it could become an issue.

So let's fix it.

---8<--
The field fqdir->dead is meant to be written (and read) atomically.
As old Alpha CPUs can't write a single byte atomically, we need at
least an int for it to work.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/include/net/inet_frag.h b/include/net/inet_frag.h
index e91b79ad4e4a..8c458fba74ad 100644
--- a/include/net/inet_frag.h
+++ b/include/net/inet_frag.h
@@ -14,7 +14,9 @@ struct fqdir {
 	int			max_dist;
 	struct inet_frags	*f;
 	struct net		*net;
-	bool			dead;
+
+	/* We can't use boolean because this needs atomic writes. */
+	int			dead;
 =

 	struct rhashtable       rhashtable ____cacheline_aligned_in_smp;
 =

diff --git a/net/ipv4/inet_fragment.c b/net/ipv4/inet_fragment.c
index 35e9784fab4e..05aa7c145817 100644
--- a/net/ipv4/inet_fragment.c
+++ b/net/ipv4/inet_fragment.c
@@ -193,7 +193,7 @@ void fqdir_exit(struct fqdir *fqdir)
 {
 	fqdir->high_thresh =3D 0; /* prevent creation of new frags */
 =

-	fqdir->dead =3D true;
+	fqdir->dead =3D 1;
 =

 	/* call_rcu is supposed to provide memory barrier semantics,
 	 * separating the setting of fqdir->dead with the destruction
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============7664726520268056103==--

