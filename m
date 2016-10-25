Content-Type: multipart/mixed; boundary="===============3666638358483039003=="
MIME-Version: 1.0
From: Paolo Valente <paolo.valente@linaro.org>
To: lkp@lists.01.org
Subject: [PATCH 11/14] block, bfq: reduce idling only in symmetric scenarios
Date: Tue, 25 Oct 2016 10:48:37 +0200
Message-ID: <20161025084840.30260-12-paolo.valente@linaro.org>
In-Reply-To: <20161025084840.30260-1-paolo.valente@linaro.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3666638358483039003==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Arianna Avanzini <avanzini.arianna@gmail.com>

A seeky queue (i..e, a queue containing random requests) is assigned a
very small device-idling slice, for throughput issues. Unfortunately,
given the process associated with a seeky queue, this behavior causes
the following problem: if the process, say P, performs sync I/O and
has a higher weight than some other processes doing I/O and associated
with non-seeky queues, then BFQ may fail to guarantee to P its
reserved share of the throughput. The reason is that idling is key
for providing service guarantees to processes doing sync I/O [1].

This commit addresses this issue by allowing the device-idling slice
to be reduced for a seeky queue only if the scenario happens to be
symmetric, i.e., if all the queues are to receive the same share of
the throughput.

[1] P. Valente, A. Avanzini, "Evolution of the BFQ Storage I/O
    Scheduler", Proceedings of the First Workshop on Mobile System
    Technologies (MST-2015), May 2015.
    http://algogroup.unimore.it/people/paolo/disk_sched/mst-2015.pdf

Signed-off-by: Arianna Avanzini <avanzini.arianna@gmail.com>
Signed-off-by: Riccardo Pizzetti <riccardo.pizzetti@gmail.com>
Signed-off-by: Samuele Zecchini <samuele.zecchini92@gmail.com>
Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
---
 block/bfq-iosched.c | 254 ++++++++++++++++++++++++++++++++++++++++++++++++=
++--
 1 file changed, 248 insertions(+), 6 deletions(-)

diff --git a/block/bfq-iosched.c b/block/bfq-iosched.c
index 0af52a1..9011a84 100644
--- a/block/bfq-iosched.c
+++ b/block/bfq-iosched.c
@@ -151,6 +151,20 @@ struct bfq_sched_data {
 };
 =

 /**
+ * struct bfq_weight_counter - counter of the number of all active entities
+ *                             with a given weight.
+ */
+struct bfq_weight_counter {
+	unsigned int weight; /* weight of the entities this counter refers to */
+	unsigned int num_active; /* nr of active entities with this weight */
+	/*
+	 * Weights tree member (see bfq_data's @queue_weights_tree and
+	 * @group_weights_tree)
+	 */
+	struct rb_node weights_node;
+};
+
+/**
  * struct bfq_entity - schedulable entity.
  *
  * A bfq_entity is used to represent either a bfq_queue (leaf node in the
@@ -179,6 +193,8 @@ struct bfq_sched_data {
  */
 struct bfq_entity {
 	struct rb_node rb_node; /* service_tree member */
+	/* pointer to the weight counter associated with this entity */
+	struct bfq_weight_counter *weight_counter;
 =

 	/*
 	 * flag, true if the entity is on a tree (either the active or
@@ -413,6 +429,25 @@ struct bfq_data {
 	struct bfq_group *root_group;
 =

 	/*
+	 * rbtree of weight counters of @bfq_queues, sorted by
+	 * weight. Used to keep track of whether all @bfq_queues have
+	 * the same weight. The tree contains one counter for each
+	 * distinct weight associated to some active and not
+	 * weight-raised @bfq_queue (see the comments to the functions
+	 * bfq_weights_tree_[add|remove] for further details).
+	 */
+	struct rb_root queue_weights_tree;
+	/*
+	 * rbtree of non-queue @bfq_entity weight counters, sorted by
+	 * weight. Used to keep track of whether all @bfq_groups have
+	 * the same weight. The tree contains one counter for each
+	 * distinct weight associated to some active @bfq_group (see
+	 * the comments to the functions bfq_weights_tree_[add|remove]
+	 * for further details).
+	 */
+	struct rb_root group_weights_tree;
+
+	/*
 	 * Number of bfq_queues containing requests (including the
 	 * queue in service, even if it is idling).
 	 */
@@ -728,6 +763,11 @@ struct bfq_group_data {
  *             to avoid too many special cases during group creation/
  *             migration.
  * @stats: stats for this bfqg.
+ * @active_entities: number of active entities belonging to the group;
+ *                   unused for the root group. Used to know whether there
+ *                   are groups with more than one active @bfq_entity
+ *                   (see the comments to the function
+ *                   bfq_bfqq_may_idle()).
  * @rq_pos_tree: rbtree sorted by next_request position, used when
  *               determining if two or more queues have interleaving
  *               requests (see bfq_find_close_cooperator()).
@@ -755,6 +795,8 @@ struct bfq_group {
 =

 	struct bfq_entity *my_entity;
 =

+	int active_entities;
+
 	struct rb_root rq_pos_tree;
 =

 	struct bfqg_stats stats;
@@ -1264,6 +1306,15 @@ static void bfq_update_active_tree(struct rb_node *n=
ode)
 	goto up;
 }
 =

+static void bfq_weights_tree_add(struct bfq_data *bfqd,
+				 struct bfq_entity *entity,
+				 struct rb_root *root);
+
+static void bfq_weights_tree_remove(struct bfq_data *bfqd,
+				    struct bfq_entity *entity,
+				    struct rb_root *root);
+
+
 /**
  * bfq_active_insert - insert an entity in the active tree of its
  *                     group/device.
@@ -1302,6 +1353,13 @@ static void bfq_active_insert(struct bfq_service_tre=
e *st,
 #endif
 	if (bfqq)
 		list_add(&bfqq->bfqq_list, &bfqq->bfqd->active_list);
+#ifdef CONFIG_BFQ_GROUP_IOSCHED
+	else /* bfq_group */
+		bfq_weights_tree_add(bfqd, entity, &bfqd->group_weights_tree);
+
+	if (bfqg !=3D bfqd->root_group)
+		bfqg->active_entities++;
+#endif
 }
 =

 /**
@@ -1397,6 +1455,14 @@ static void bfq_active_extract(struct bfq_service_tr=
ee *st,
 #endif
 	if (bfqq)
 		list_del(&bfqq->bfqq_list);
+#ifdef CONFIG_BFQ_GROUP_IOSCHED
+	else /* bfq_group */
+		bfq_weights_tree_remove(bfqd, entity,
+					&bfqd->group_weights_tree);
+
+	if (bfqg !=3D bfqd->root_group)
+		bfqg->active_entities--;
+#endif
 }
 =

 /**
@@ -1494,6 +1560,7 @@ __bfq_entity_update_weight_prio(struct bfq_service_tr=
ee *old_st,
 		struct bfq_queue *bfqq =3D bfq_entity_to_bfqq(entity);
 		unsigned int prev_weight, new_weight;
 		struct bfq_data *bfqd =3D NULL;
+		struct rb_root *root;
 #ifdef CONFIG_BFQ_GROUP_IOSCHED
 		struct bfq_sched_data *sd;
 		struct bfq_group *bfqg;
@@ -1543,7 +1610,26 @@ __bfq_entity_update_weight_prio(struct bfq_service_t=
ree *old_st,
 		prev_weight =3D entity->weight;
 		new_weight =3D entity->orig_weight *
 			     (bfqq ? bfqq->wr_coeff : 1);
+		/*
+		 * If the weight of the entity changes, remove the entity
+		 * from its old weight counter (if there is a counter
+		 * associated with the entity), and add it to the counter
+		 * associated with its new weight.
+		 */
+		if (prev_weight !=3D new_weight) {
+			root =3D bfqq ? &bfqd->queue_weights_tree :
+				      &bfqd->group_weights_tree;
+			bfq_weights_tree_remove(bfqd, entity, root);
+		}
 		entity->weight =3D new_weight;
+		/*
+		 * Add the entity to its weights tree only if it is
+		 * not associated with a weight-raised queue.
+		 */
+		if (prev_weight !=3D new_weight &&
+		    (bfqq ? bfqq->wr_coeff =3D=3D 1 : 1))
+			/* If we get here, root has been initialized. */
+			bfq_weights_tree_add(bfqd, entity, root);
 =

 		new_st->wsum +=3D entity->weight;
 =

@@ -2091,6 +2177,10 @@ static void bfq_del_bfqq_busy(struct bfq_data *bfqd,=
 struct bfq_queue *bfqq,
 =

 	bfqd->busy_queues--;
 =

+	if (!bfqq->dispatched)
+		bfq_weights_tree_remove(bfqd, &bfqq->entity,
+					&bfqd->queue_weights_tree);
+
 	if (bfqq->wr_coeff > 1)
 		bfqd->wr_busy_queues--;
 =

@@ -2111,6 +2201,11 @@ static void bfq_add_bfqq_busy(struct bfq_data *bfqd,=
 struct bfq_queue *bfqq)
 	bfq_mark_bfqq_busy(bfqq);
 	bfqd->busy_queues++;
 =

+	if (!bfqq->dispatched)
+		if (bfqq->wr_coeff =3D=3D 1)
+			bfq_weights_tree_add(bfqd, &bfqq->entity,
+					     &bfqd->queue_weights_tree);
+
 	if (bfqq->wr_coeff > 1)
 		bfqd->wr_busy_queues++;
 }
@@ -2541,6 +2636,7 @@ static void bfq_pd_init(struct blkg_policy_data *pd)
 				   * in bfq_init_queue()
 				   */
 	bfqg->bfqd =3D bfqd;
+	bfqg->active_entities =3D 0;
 	bfqg->rq_pos_tree =3D RB_ROOT;
 }
 =

@@ -3453,6 +3549,142 @@ static void bfq_pos_tree_add_move(struct bfq_data *=
bfqd, struct bfq_queue *bfqq)
 		bfqq->pos_root =3D NULL;
 }
 =

+/*
+ * Tell whether there are active queues or groups with differentiated weig=
hts.
+ */
+static bool bfq_differentiated_weights(struct bfq_data *bfqd)
+{
+	/*
+	 * For weights to differ, at least one of the trees must contain
+	 * at least two nodes.
+	 */
+	return (!RB_EMPTY_ROOT(&bfqd->queue_weights_tree) &&
+		(bfqd->queue_weights_tree.rb_node->rb_left ||
+		 bfqd->queue_weights_tree.rb_node->rb_right)
+#ifdef CONFIG_BFQ_GROUP_IOSCHED
+	       ) ||
+	       (!RB_EMPTY_ROOT(&bfqd->group_weights_tree) &&
+		(bfqd->group_weights_tree.rb_node->rb_left ||
+		 bfqd->group_weights_tree.rb_node->rb_right)
+#endif
+	       );
+}
+
+/*
+ * The following function returns true if every queue must receive the
+ * same share of the throughput (this condition is used when deciding
+ * whether idling may be disabled, see the comments in the function
+ * bfq_bfqq_may_idle()).
+ *
+ * Such a scenario occurs when:
+ * 1) all active queues have the same weight,
+ * 2) all active groups at the same level in the groups tree have the same
+ *    weight,
+ * 3) all active groups at the same level in the groups tree have the same
+ *    number of children.
+ *
+ * Unfortunately, keeping the necessary state for evaluating exactly the
+ * above symmetry conditions would be quite complex and time-consuming.
+ * Therefore this function evaluates, instead, the following stronger
+ * sub-conditions, for which it is much easier to maintain the needed
+ * state:
+ * 1) all active queues have the same weight,
+ * 2) all active groups have the same weight,
+ * 3) all active groups have at most one active child each.
+ * In particular, the last two conditions are always true if hierarchical
+ * support and the cgroups interface are not enabled, thus no state needs
+ * to be maintained in this case.
+ */
+static bool bfq_symmetric_scenario(struct bfq_data *bfqd)
+{
+	return !bfq_differentiated_weights(bfqd);
+}
+
+/*
+ * If the weight-counter tree passed as input contains no counter for
+ * the weight of the input entity, then add that counter; otherwise just
+ * increment the existing counter.
+ *
+ * Note that weight-counter trees contain few nodes in mostly symmetric
+ * scenarios. For example, if all queues have the same weight, then the
+ * weight-counter tree for the queues may contain at most one node.
+ * This holds even if low_latency is on, because weight-raised queues
+ * are not inserted in the tree.
+ * In most scenarios, the rate at which nodes are created/destroyed
+ * should be low too.
+ */
+static void bfq_weights_tree_add(struct bfq_data *bfqd,
+				 struct bfq_entity *entity,
+				 struct rb_root *root)
+{
+	struct rb_node **new =3D &(root->rb_node), *parent =3D NULL;
+
+	/*
+	 * Do not insert if the entity is already associated with a
+	 * counter, which happens if:
+	 *   1) the entity is associated with a queue,
+	 *   2) a request arrival has caused the queue to become both
+	 *      non-weight-raised, and hence change its weight, and
+	 *      backlogged; in this respect, each of the two events
+	 *      causes an invocation of this function,
+	 *   3) this is the invocation of this function caused by the
+	 *      second event. This second invocation is actually useless,
+	 *      and we handle this fact by exiting immediately. More
+	 *      efficient or clearer solutions might possibly be adopted.
+	 */
+	if (entity->weight_counter)
+		return;
+
+	while (*new) {
+		struct bfq_weight_counter *__counter =3D container_of(*new,
+						struct bfq_weight_counter,
+						weights_node);
+		parent =3D *new;
+
+		if (entity->weight =3D=3D __counter->weight) {
+			entity->weight_counter =3D __counter;
+			goto inc_counter;
+		}
+		if (entity->weight < __counter->weight)
+			new =3D &((*new)->rb_left);
+		else
+			new =3D &((*new)->rb_right);
+	}
+
+	entity->weight_counter =3D kzalloc(sizeof(struct bfq_weight_counter),
+					 GFP_ATOMIC);
+	entity->weight_counter->weight =3D entity->weight;
+	rb_link_node(&entity->weight_counter->weights_node, parent, new);
+	rb_insert_color(&entity->weight_counter->weights_node, root);
+
+inc_counter:
+	entity->weight_counter->num_active++;
+}
+
+/*
+ * Decrement the weight counter associated with the entity, and, if the
+ * counter reaches 0, remove the counter from the tree.
+ * See the comments to the function bfq_weights_tree_add() for considerati=
ons
+ * about overhead.
+ */
+static void bfq_weights_tree_remove(struct bfq_data *bfqd,
+				    struct bfq_entity *entity,
+				    struct rb_root *root)
+{
+	if (!entity->weight_counter)
+		return;
+
+	entity->weight_counter->num_active--;
+	if (entity->weight_counter->num_active > 0)
+		goto reset_entity_pointer;
+
+	rb_erase(&entity->weight_counter->weights_node, root);
+	kfree(entity->weight_counter);
+
+reset_entity_pointer:
+	entity->weight_counter =3D NULL;
+}
+
 static struct request *bfq_find_next_rq(struct bfq_data *bfqd,
 					struct bfq_queue *bfqq,
 					struct request *last)
@@ -4775,13 +5007,17 @@ static void bfq_arm_slice_timer(struct bfq_data *bf=
qd)
 	 */
 	sl =3D bfqd->bfq_slice_idle;
 	/*
-	 * Unless the queue is being weight-raised, grant only minimum
-	 * idle time if the queue is seeky. A long idling is preserved
-	 * for a weight-raised queue, because it is needed for
-	 * guaranteeing to the queue its reserved share of the
-	 * throughput.
+	 * Unless the queue is being weight-raised or the scenario is
+	 * asymmetric, grant only minimum idle time if the queue
+	 * is seeky. A long idling is preserved for a weight-raised
+	 * queue, or, more in general, in an asymmetric scenario,
+	 * because a long idling is needed for guaranteeing to a queue
+	 * its reserved share of the throughput (in particular, it is
+	 * needed if the queue has a higher weight than some other
+	 * queue).
 	 */
-	if (BFQQ_SEEKY(bfqq) && bfqq->wr_coeff =3D=3D 1)
+	if (BFQQ_SEEKY(bfqq) && bfqq->wr_coeff =3D=3D 1 &&
+	    bfq_symmetric_scenario(bfqd))
 		sl =3D min_t(u64, sl, BFQ_MIN_TT);
 =

 	bfqd->last_idling_start =3D ktime_get();
@@ -6612,6 +6848,9 @@ static void bfq_completed_request(struct request_queu=
e *q, struct request *rq)
 		 * mechanism).
 		 */
 		bfqq->budget_timeout =3D jiffies;
+
+		bfq_weights_tree_remove(bfqd, &bfqq->entity,
+					&bfqd->queue_weights_tree);
 	}
 =

 	now_ns =3D ktime_get_ns();
@@ -7046,6 +7285,9 @@ static int bfq_init_queue(struct request_queue *q, st=
ruct elevator_type *e)
 		     HRTIMER_MODE_REL);
 	bfqd->idle_slice_timer.function =3D bfq_idle_slice_timer;
 =

+	bfqd->queue_weights_tree =3D RB_ROOT;
+	bfqd->group_weights_tree =3D RB_ROOT;
+
 	INIT_WORK(&bfqd->unplug_work, bfq_kick_queue);
 =

 	INIT_LIST_HEAD(&bfqd->active_list);
-- =

2.10.0


--===============3666638358483039003==--

