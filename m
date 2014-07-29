Content-Type: multipart/mixed; boundary="===============3233959770843385563=="
MIME-Version: 1.0
From: Rik van Riel <riel@redhat.com>
To: lkp@lists.01.org
Subject: Re: [sched/numa] a43455a1d57: +94.1% proc-vmstat.numa_hint_faults_local
Date: Tue, 29 Jul 2014 16:04:37 -0400
Message-ID: <20140729160437.4561742f@annuminas.surriel.com>
In-Reply-To: <20140729081712.GS20603@laptop.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============3233959770843385563==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 29 Jul 2014 10:17:12 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> > +#define NUMA_SCALE 1000
> > +#define NUMA_MOVE_THRESH 50
> =

> Please make that 1024, there's no reason not to use power of two here.
> This base 10 factor thing annoyed me no end already, its time for it to
> die.

That's easy enough.  However, it would be good to know whether
this actually helps with the regression Aaron found :)

---8<---

Subject: sched,numa: prevent task moves with marginal benefit

Commit a43455a1d57 makes task_numa_migrate() always check the
preferred node for task placement. This is causing a performance
regression with hackbench, as well as SPECjbb2005.

Tracing task_numa_compare() with a single instance of SPECjbb2005
on a 4 node system, I have seen several thread swaps with tiny
improvements. =


It appears that the hysteresis code that was added to task_numa_compare
is not doing what we needed it to do, and a simple threshold could be
better.

Aaron, does this patch help, or am I barking up the wrong tree?

Reported-by: Aaron Lu <aaron.lu@intel.com>
Reported-by: Jirka Hladky <jhladky@redhat.com>
Signed-off-by: Rik van Riel <riel@redhat.com>
---
 kernel/sched/fair.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 4f5e3c2..9bd283b 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -924,10 +924,12 @@ static inline unsigned long group_faults_cpu(struct n=
uma_group *group, int nid)
 =

 /*
  * These return the fraction of accesses done by a particular task, or
- * task group, on a particular numa node.  The group weight is given a
- * larger multiplier, in order to group tasks together that are almost
- * evenly spread out between numa nodes.
+ * task group, on a particular numa node.  The NUMA move threshold
+ * prevents task moves with marginal improvement, and is set to 5%.
  */
+#define NUMA_SCALE 1024
+#define NUMA_MOVE_THRESH (5 * NUMA_SCALE / 100)
+
 static inline unsigned long task_weight(struct task_struct *p, int nid)
 {
 	unsigned long total_faults;
@@ -940,7 +942,7 @@ static inline unsigned long task_weight(struct task_str=
uct *p, int nid)
 	if (!total_faults)
 		return 0;
 =

-	return 1000 * task_faults(p, nid) / total_faults;
+	return NUMA_SCALE * task_faults(p, nid) / total_faults;
 }
 =

 static inline unsigned long group_weight(struct task_struct *p, int nid)
@@ -948,7 +950,7 @@ static inline unsigned long group_weight(struct task_st=
ruct *p, int nid)
 	if (!p->numa_group || !p->numa_group->total_faults)
 		return 0;
 =

-	return 1000 * group_faults(p, nid) / p->numa_group->total_faults;
+	return NUMA_SCALE * group_faults(p, nid) / p->numa_group->total_faults;
 }
 =

 bool should_numa_migrate_memory(struct task_struct *p, struct page * page,
@@ -1181,11 +1183,11 @@ static void task_numa_compare(struct task_numa_env =
*env,
 			imp =3D taskimp + task_weight(cur, env->src_nid) -
 			      task_weight(cur, env->dst_nid);
 			/*
-			 * Add some hysteresis to prevent swapping the
-			 * tasks within a group over tiny differences.
+			 * Do not swap tasks within a group around unless
+			 * there is a significant improvement.
 			 */
-			if (cur->numa_group)
-				imp -=3D imp/16;
+			if (cur->numa_group && imp < NUMA_MOVE_THRESH)
+				goto unlock;
 		} else {
 			/*
 			 * Compare the group weights. If a task is all by
@@ -1205,6 +1207,10 @@ static void task_numa_compare(struct task_numa_env *=
env,
 		goto unlock;
 =

 	if (!cur) {
+		/* Only move if there is a significant improvement. */
+		if (imp < NUMA_MOVE_THRESH)
+			goto unlock;
+
 		/* Is there capacity@our destination? */
 		if (env->src_stats.has_free_capacity &&
 		    !env->dst_stats.has_free_capacity)


--===============3233959770843385563==--

