Content-Type: multipart/mixed; boundary="===============9117811705520962048=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: [PATCH] blkcg: always create the blkcg_gq for the root blkcg
Date: Mon, 06 Apr 2015 15:27:29 -0400
Message-ID: <20150406192729.GH10582@htj.duckdns.org>
In-Reply-To: <20150402004836.GB12979@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9117811705520962048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Currently, blkcg does a minor optimization where the root blkcg is
created when the first blkcg policy is activated on a queue and
destroyed on the deactivation of the last.  On systems where blkcg is
configured but not used, this saves one blkcg_gq struct per queue.  On
systems where blkcg is actually used, there's no difference.  The only
case where this can lead to any meaninful, albeit still minute, save
in memory consumption is when all blkcg policies are deactivated after
being widely used in the system, which is a hihgly unlikely scenario.

The conditional existence of root blkcg_gq has already created several
bugs in blkcg and became an issue once again for the new per-cgroup
wb_congested mechanism for cgroup writeback support leading to a NULL
dereference when no blkcg policy is active.  This is really not worth
bothering with.  This patch makes blkcg always allocate and link the
root blkcg_gq and release it only on queue destruction.

Signed-off-by: Tejun Heo <tj@kernel.org>
Reported-by: Fengguang Wu <fengguang.wu@intel.com>
---
Hello,

Urgh... the missing blkcg_gq again.  I think it's about time to remove
that pointless optimization which doesn't really help anything.  This
patch should solve the issue.  I'll include it in the series.

Thanks.

 block/blk-cgroup.c |   96 ++++++++++++++++++++++--------------------------=
-----
 1 file changed, 41 insertions(+), 55 deletions(-)

--- a/block/blk-cgroup.c
+++ b/block/blk-cgroup.c
@@ -235,13 +235,8 @@ static struct blkcg_gq *blkg_create(stru
 	blkg->online =3D true;
 	spin_unlock(&blkcg->lock);
 =

-	if (!ret) {
-		if (blkcg =3D=3D &blkcg_root) {
-			q->root_blkg =3D blkg;
-			q->root_rl.blkg =3D blkg;
-		}
+	if (!ret)
 		return blkg;
-	}
 =

 	/* @blkg failed fully initialized, use the usual release path */
 	blkg_put(blkg);
@@ -340,15 +335,6 @@ static void blkg_destroy(struct blkcg_gq
 		rcu_assign_pointer(blkcg->blkg_hint, NULL);
 =

 	/*
-	 * If root blkg is destroyed.  Just clear the pointer since root_rl
-	 * does not take reference on root blkg.
-	 */
-	if (blkcg =3D=3D &blkcg_root) {
-		blkg->q->root_blkg =3D NULL;
-		blkg->q->root_rl.blkg =3D NULL;
-	}
-
-	/*
 	 * Put the reference taken at the time of creation so that when all
 	 * queues are gone, group can be destroyed.
 	 */
@@ -855,9 +841,45 @@ done:
  */
 int blkcg_init_queue(struct request_queue *q)
 {
-	might_sleep();
+	struct blkcg_gq *new_blkg, *blkg;
+	bool preloaded;
+	int ret;
+
+	new_blkg =3D blkg_alloc(&blkcg_root, q, GFP_KERNEL);
+	if (!new_blkg)
+		return -ENOMEM;
+
+	preloaded =3D !radix_tree_preload(GFP_KERNEL);
 =

-	return blk_throtl_init(q);
+	/*
+	 * Make sure the root blkg exists and count the existing blkgs.  As
+	 * @q is bypassing at this point, blkg_lookup_create() can't be
+	 * used.  Open code insertion.
+	 */
+	rcu_read_lock();
+	spin_lock_irq(q->queue_lock);
+	blkg =3D blkg_create(&blkcg_root, q, new_blkg);
+	spin_unlock_irq(q->queue_lock);
+	rcu_read_unlock();
+
+	if (preloaded)
+		radix_tree_preload_end();
+
+	if (IS_ERR(blkg)) {
+		kfree(new_blkg);
+		return PTR_ERR(blkg);
+	}
+
+	q->root_blkg =3D blkg;
+	q->root_rl.blkg =3D blkg;
+
+	ret =3D blk_throtl_init(q);
+	if (ret) {
+		spin_lock_irq(q->queue_lock);
+		blkg_destroy_all(q);
+		spin_unlock_irq(q->queue_lock);
+	}
+	return ret;
 }
 =

 /**
@@ -958,52 +980,20 @@ int blkcg_activate_policy(struct request
 			  const struct blkcg_policy *pol)
 {
 	LIST_HEAD(pds);
-	struct blkcg_gq *blkg, *new_blkg;
+	struct blkcg_gq *blkg;
 	struct blkg_policy_data *pd, *n;
 	int cnt =3D 0, ret;
-	bool preloaded;
 =

 	if (blkcg_policy_enabled(q, pol))
 		return 0;
 =

-	/* preallocations for root blkg */
-	new_blkg =3D blkg_alloc(&blkcg_root, q, GFP_KERNEL);
-	if (!new_blkg)
-		return -ENOMEM;
-
+	/* count and allocate policy_data for all existing blkgs */
 	blk_queue_bypass_start(q);
-
-	preloaded =3D !radix_tree_preload(GFP_KERNEL);
-
-	/*
-	 * Make sure the root blkg exists and count the existing blkgs.  As
-	 * @q is bypassing at this point, blkg_lookup_create() can't be
-	 * used.  Open code it.
-	 */
 	spin_lock_irq(q->queue_lock);
-
-	rcu_read_lock();
-	blkg =3D __blkg_lookup(&blkcg_root, q, false);
-	if (blkg)
-		blkg_free(new_blkg);
-	else
-		blkg =3D blkg_create(&blkcg_root, q, new_blkg);
-	rcu_read_unlock();
-
-	if (preloaded)
-		radix_tree_preload_end();
-
-	if (IS_ERR(blkg)) {
-		ret =3D PTR_ERR(blkg);
-		goto out_unlock;
-	}
-
 	list_for_each_entry(blkg, &q->blkg_list, q_node)
 		cnt++;
-
 	spin_unlock_irq(q->queue_lock);
 =

-	/* allocate policy_data for all existing blkgs */
 	while (cnt--) {
 		pd =3D kzalloc_node(pol->pd_size, GFP_KERNEL, q->node);
 		if (!pd) {
@@ -1072,10 +1062,6 @@ void blkcg_deactivate_policy(struct requ
 =

 	__clear_bit(pol->plid, q->blkcg_pols);
 =

-	/* if no policy is left, no need for blkgs - shoot them down */
-	if (bitmap_empty(q->blkcg_pols, BLKCG_MAX_POLS))
-		blkg_destroy_all(q);
-
 	list_for_each_entry(blkg, &q->blkg_list, q_node) {
 		/* grab blkcg lock too while removing @pd from @blkg */
 		spin_lock(&blkg->blkcg->lock);

--===============9117811705520962048==--

