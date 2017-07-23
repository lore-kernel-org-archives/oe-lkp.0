Content-Type: multipart/mixed; boundary="===============5207857463888242601=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: [PATCH wq/for-4.13-fixes] workqueue: implicit ordered attribute should be overridable
Date: Sun, 23 Jul 2017 08:36:15 -0400
Message-ID: <20170723123615.GD1498614@devbig577.frc2.facebook.com>
In-Reply-To: <20170722203725.GA77833@inn.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5207857463888242601==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

5c0338c68706 ("workqueue: restore WQ_UNBOUND/max_active=3D=3D1 to be
ordered") automatically enabled ordered attribute for unbound
workqueues w/ max_active =3D=3D 1.  Because ordered workqueues reject
max_active and some attribute changes, this implicit ordered mode
broke cases where the user creates an unbound workqueue w/ max_active
=3D=3D 1 and later explicitly changes the related attributes.

This patch distinguishes explicit and implicit ordered setting and
overrides from attribute changes if implict.

Signed-off-by: Tejun Heo <tj@kernel.org>
Fixes: 5c0338c68706 ("workqueue: restore WQ_UNBOUND/max_active=3D=3D1 to be=
 ordered")
---
 include/linux/workqueue.h |    4 +++-
 kernel/workqueue.c        |   13 +++++++++----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index c102ef6..db6dc9d 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -323,6 +323,7 @@ enum {
 =

 	__WQ_DRAINING		=3D 1 << 16, /* internal: workqueue is draining */
 	__WQ_ORDERED		=3D 1 << 17, /* internal: workqueue is ordered */
+	__WQ_ORDERED_EXPLICIT	=3D 1 << 18, /* internal: alloc_ordered_workqueue()=
 */
 	__WQ_LEGACY		=3D 1 << 18, /* internal: create*_workqueue() */
 =

 	WQ_MAX_ACTIVE		=3D 512,	  /* I like 512, better ideas? */
@@ -422,7 +423,8 @@ __alloc_workqueue_key(const char *fmt, unsigned int fla=
gs, int max_active,
  * Pointer to the allocated workqueue on success, %NULL on failure.
  */
 #define alloc_ordered_workqueue(fmt, flags, args...)			\
-	alloc_workqueue(fmt, WQ_UNBOUND | __WQ_ORDERED | (flags), 1, ##args)
+	alloc_workqueue(fmt, WQ_UNBOUND | __WQ_ORDERED |		\
+			__WQ_ORDERED_EXPLICIT | (flags), 1, ##args)
 =

 #define create_workqueue(name)						\
 	alloc_workqueue("%s", __WQ_LEGACY | WQ_MEM_RECLAIM, 1, (name))
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index abe4a49..7146ea7 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -3744,8 +3744,12 @@ static int apply_workqueue_attrs_locked(struct workq=
ueue_struct *wq,
 		return -EINVAL;
 =

 	/* creating multiple pwqs breaks ordering guarantee */
-	if (WARN_ON((wq->flags & __WQ_ORDERED) && !list_empty(&wq->pwqs)))
-		return -EINVAL;
+	if (!list_empty(&wq->pwqs)) {
+		if (WARN_ON(wq->flags & __WQ_ORDERED_EXPLICIT))
+			return -EINVAL;
+
+		wq->flags &=3D ~__WQ_ORDERED;
+	}
 =

 	ctx =3D apply_wqattrs_prepare(wq, attrs);
 	if (!ctx)
@@ -4129,13 +4133,14 @@ void workqueue_set_max_active(struct workqueue_stru=
ct *wq, int max_active)
 	struct pool_workqueue *pwq;
 =

 	/* disallow meddling with max_active for ordered workqueues */
-	if (WARN_ON(wq->flags & __WQ_ORDERED))
+	if (WARN_ON(wq->flags & __WQ_ORDERED_EXPLICIT))
 		return;
 =

 	max_active =3D wq_clamp_max_active(max_active, wq->flags, wq->name);
 =

 	mutex_lock(&wq->mutex);
 =

+	wq->flags &=3D ~__WQ_ORDERED;
 	wq->saved_max_active =3D max_active;
 =

 	for_each_pwq(pwq, wq)
@@ -5263,7 +5268,7 @@ int workqueue_sysfs_register(struct workqueue_struct =
*wq)
 	 * attributes breaks ordering guarantee.  Disallow exposing ordered
 	 * workqueues.
 	 */
-	if (WARN_ON(wq->flags & __WQ_ORDERED))
+	if (WARN_ON(wq->flags & __WQ_ORDERED_EXPLICIT))
 		return -EINVAL;
 =

 	wq->wq_dev =3D wq_dev =3D kzalloc(sizeof(*wq_dev), GFP_KERNEL);

--===============5207857463888242601==--

