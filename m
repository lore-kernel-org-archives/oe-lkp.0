Content-Type: multipart/mixed; boundary="===============1973731919421087779=="
MIME-Version: 1.0
From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
To: lkp@lists.01.org
Subject: [PATCH net-next] net: dsa: remove tree refcount
Date: Thu, 09 Nov 2017 12:36:52 -0500
Message-ID: <20171109173652.25258-1-vivien.didelot@savoirfairelinux.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1973731919421087779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Setting the refcount to 0 when allocating a tree to match the number of
switch devices it holds may cause an 'increment on 0; use-after-free'.

Tracking the number of devices in a tree with a kref is not really
appropriate anyway so removes it completely in favor of a basic counter.

Fixes: 8e5bf9759a06 ("net: dsa: simplify tree reference counting")
Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 include/net/dsa.h |  2 +-
 net/dsa/dsa2.c    | 29 ++++-------------------------
 2 files changed, 5 insertions(+), 26 deletions(-)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index 35b5dee7bb23..bbcdff43526f 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -119,7 +119,7 @@ struct dsa_switch_tree {
 	unsigned int index;
 =

 	/* Number of switches attached to this tree */
-	struct kref refcount;
+	unsigned int nr_devices;
 =

 	/* Has this tree been applied to the hardware? */
 	bool setup;
diff --git a/net/dsa/dsa2.c b/net/dsa/dsa2.c
index fd54a8e17986..fda3e5415eaf 100644
--- a/net/dsa/dsa2.c
+++ b/net/dsa/dsa2.c
@@ -51,10 +51,6 @@ static struct dsa_switch_tree *dsa_tree_alloc(int index)
 	INIT_LIST_HEAD(&dst->list);
 	list_add_tail(&dsa_tree_list, &dst->list);
 =

-	/* Initialize the reference counter to the number of switches, not 1 */
-	kref_init(&dst->refcount);
-	refcount_set(&dst->refcount.refcount, 0);
-
 	return dst;
 }
 =

@@ -75,25 +71,6 @@ static struct dsa_switch_tree *dsa_tree_touch(int index)
 	return dst;
 }
 =

-static void dsa_tree_get(struct dsa_switch_tree *dst)
-{
-	kref_get(&dst->refcount);
-}
-
-static void dsa_tree_release(struct kref *ref)
-{
-	struct dsa_switch_tree *dst;
-
-	dst =3D container_of(ref, struct dsa_switch_tree, refcount);
-
-	dsa_tree_free(dst);
-}
-
-static void dsa_tree_put(struct dsa_switch_tree *dst)
-{
-	kref_put(&dst->refcount, dsa_tree_release);
-}
-
 static bool dsa_port_is_dsa(struct dsa_port *port)
 {
 	return port->type =3D=3D DSA_PORT_TYPE_DSA;
@@ -492,7 +469,9 @@ static void dsa_tree_remove_switch(struct dsa_switch_tr=
ee *dst,
 	dsa_tree_teardown(dst);
 =

 	dst->ds[index] =3D NULL;
-	dsa_tree_put(dst);
+	dst->nr_devices--;
+	if (!dst->nr_devices)
+		dsa_tree_free(dst);
 }
 =

 static int dsa_tree_add_switch(struct dsa_switch_tree *dst,
@@ -504,7 +483,7 @@ static int dsa_tree_add_switch(struct dsa_switch_tree *=
dst,
 	if (dst->ds[index])
 		return -EBUSY;
 =

-	dsa_tree_get(dst);
+	dst->nr_devices++;
 	dst->ds[index] =3D ds;
 =

 	err =3D dsa_tree_setup(dst);
-- =

2.15.0


--===============1973731919421087779==--

