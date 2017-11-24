Content-Type: multipart/mixed; boundary="===============8347532701238624249=="
MIME-Version: 1.0
From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
To: lkp@lists.01.org
Subject: [PATCH net] net: dsa: fix 'increment on 0' warning
Date: Fri, 24 Nov 2017 11:36:06 -0500
Message-ID: <20171124163606.11212-1-vivien.didelot@savoirfairelinux.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8347532701238624249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Setting the refcount to 0 when allocating a tree to match the number of
switch devices it holds may cause an 'increment on 0; use-after-free',
if CONFIG_REFCOUNT_FULL is enabled.

To fix this, do not decrement the refcount of a newly allocated tree,
increment it when an already allocated tree is found, and decrement it
after the probing of a switch, as done with the previous behavior.

At the same time, make dsa_tree_get and dsa_tree_put accept a NULL
argument to simplify callers, and return the tree after incrementation,
as most kref users like of_node_get and of_node_put do.

Fixes: 8e5bf9759a06 ("net: dsa: simplify tree reference counting")
Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 net/dsa/dsa2.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/net/dsa/dsa2.c b/net/dsa/dsa2.c
index 44e3fb7dec8c..1e287420ff49 100644
--- a/net/dsa/dsa2.c
+++ b/net/dsa/dsa2.c
@@ -51,9 +51,7 @@ static struct dsa_switch_tree *dsa_tree_alloc(int index)
 	INIT_LIST_HEAD(&dst->list);
 	list_add_tail(&dsa_tree_list, &dst->list);
 =

-	/* Initialize the reference counter to the number of switches, not 1 */
 	kref_init(&dst->refcount);
-	refcount_set(&dst->refcount.refcount, 0);
 =

 	return dst;
 }
@@ -64,20 +62,23 @@ static void dsa_tree_free(struct dsa_switch_tree *dst)
 	kfree(dst);
 }
 =

+static struct dsa_switch_tree *dsa_tree_get(struct dsa_switch_tree *dst)
+{
+	if (dst)
+		kref_get(&dst->refcount);
+
+	return dst;
+}
+
 static struct dsa_switch_tree *dsa_tree_touch(int index)
 {
 	struct dsa_switch_tree *dst;
 =

 	dst =3D dsa_tree_find(index);
-	if (!dst)
-		dst =3D dsa_tree_alloc(index);
-
-	return dst;
-}
-
-static void dsa_tree_get(struct dsa_switch_tree *dst)
-{
-	kref_get(&dst->refcount);
+	if (dst)
+		return dsa_tree_get(dst);
+	else
+		return dsa_tree_alloc(index);
 }
 =

 static void dsa_tree_release(struct kref *ref)
@@ -91,7 +92,8 @@ static void dsa_tree_release(struct kref *ref)
 =

 static void dsa_tree_put(struct dsa_switch_tree *dst)
 {
-	kref_put(&dst->refcount, dsa_tree_release);
+	if (dst)
+		kref_put(&dst->refcount, dsa_tree_release);
 }
 =

 static bool dsa_port_is_dsa(struct dsa_port *port)
@@ -765,6 +767,7 @@ int dsa_register_switch(struct dsa_switch *ds)
 =

 	mutex_lock(&dsa2_mutex);
 	err =3D dsa_switch_probe(ds);
+	dsa_tree_put(ds->dst);
 	mutex_unlock(&dsa2_mutex);
 =

 	return err;
-- =

2.15.0


--===============8347532701238624249==--

