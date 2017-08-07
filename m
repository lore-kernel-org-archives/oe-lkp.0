Content-Type: multipart/mixed; boundary="===============6197121059342471362=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: 5b4ed50902 ("sched/fair: Fix wake_affine() for !NUMA_BALANCING"): BUG: unable to handle kernel paging request at ffffffffffffff80
Date: Mon, 07 Aug 2017 12:12:44 +0200
Message-ID: <20170807101244.3vkdare2syknsovp@hirez.programming.kicks-ass.net>
In-Reply-To: <598472c2.b1Vq1sc43oPznoCv%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6197121059342471362==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 04, 2017 at 09:12:34PM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/wip
> =

> commit 5b4ed509027a5b6f495e6fe871cae850d5762bef
> Author:     Peter Zijlstra <peterz@infradead.org>
> AuthorDate: Mon Jul 31 17:50:05 2017 +0200
> Commit:     Peter Zijlstra <peterz@infradead.org>
> CommitDate: Wed Aug 2 16:38:30 2017 +0200
> =

>     sched/fair: Fix wake_affine() for !NUMA_BALANCING
>     =

>     In commit:
>     =

>       3fed382b46ba ("sched/numa: Implement NUMA node level wake_affine()")
>     =

>     Rik changed wake_affine to consider NUMA information when balancing
>     between LLC domains.
>     =

>     There are a number of problems here which this patch tries to address:
>     =

>      - LLC < NODE; in this case we'd use the wrong information to balance
>      - !NUMA_BALANCING: in this case, the new code doesn't do any
>        balancing at all
>      - re-computes the NUMA data for every wakeup, this can mean iterating
>        up to 64 CPUs for every wakeup.
>      - default affine wakeups inside a cache
>     =

>     We address these by saving the load/capacity values for each
>     sched_domain during regular load-balance and using these values in
>     wake_affine_llc(). The obvious down-side to using cached values is
>     that they can be too old and poorly reflect reality.
>     =

>     But this way we can use LLC wide information and thus not rely on
>     assuming LLC matches NODE. We also don't rely on NUMA_BALANCING nor do
>     we have to aggegate two nodes (or even cache domains) worth of CPUs
>     for each wakeup.
>     =

>     Fixes: 3fed382b46ba ("sched/numa: Implement NUMA node level wake_affi=
ne()")
>     Cc: Josef Bacik <josef@toxicpanda.com>
>     Cc: Rik van Riel <riel@redhat.com>
>     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>


> [    0.075078] KVM setup async PF for cpu 1
> [    0.075078] kvm-stealtime: cpu 1, msr 19016640
> [    0.077256] smp: Brought up 1 node, 2 CPUs
> [    0.078038] smpboot: Total of 2 processors activated (10774.03 BogoMIP=
S)
> [    0.081353] devtmpfs: initialized
> [    0.081011] BUG: unable to handle kernel paging request at fffffffffff=
fff80
> [    0.081021] IP: select_task_rq_fair+0x2c3/0xc30


So I'm not in fact able to reproduce.. there used to be an earlier
version of this patch that would fail to boot, but I'm thinking git-sha1
would not be the same.

In any case, my version of the above commit sha1 below. Note how
get_llc_stats() deals with !sds.


---
commit 5b4ed509027a5b6f495e6fe871cae850d5762bef
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Mon Jul 31 17:50:05 2017 +0200

    sched/fair: Fix wake_affine() for !NUMA_BALANCING
    =

    In commit:
    =

      3fed382b46ba ("sched/numa: Implement NUMA node level wake_affine()")
    =

    Rik changed wake_affine to consider NUMA information when balancing
    between LLC domains.
    =

    There are a number of problems here which this patch tries to address:
    =

     - LLC < NODE; in this case we'd use the wrong information to balance
     - !NUMA_BALANCING: in this case, the new code doesn't do any
       balancing@all
     - re-computes the NUMA data for every wakeup, this can mean iterating
       up to 64 CPUs for every wakeup.
     - default affine wakeups inside a cache
    =

    We address these by saving the load/capacity values for each
    sched_domain during regular load-balance and using these values in
    wake_affine_llc(). The obvious down-side to using cached values is
    that they can be too old and poorly reflect reality.
    =

    But this way we can use LLC wide information and thus not rely on
    assuming LLC matches NODE. We also don't rely on NUMA_BALANCING nor do
    we have to aggegate two nodes (or even cache domains) worth of CPUs
    for each wakeup.
    =

    Fixes: 3fed382b46ba ("sched/numa: Implement NUMA node level wake_affine=
()")
    Cc: Josef Bacik <josef@toxicpanda.com>
    Cc: Rik van Riel <riel@redhat.com>
    Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index 7d065abc7a47..dc078e8780a7 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -71,6 +71,15 @@ struct sched_domain_shared {
 	atomic_t	ref;
 	atomic_t	nr_busy_cpus;
 	int		has_idle_cores;
+
+	/*
+	 * Some variables from the most recent sd_lb_stats for this domain.
+	 *
+	 * used by wake_affine().
+	 */
+	unsigned long	nr_running;
+	unsigned long	load;
+	unsigned long	capacity;
 };
 =

 struct sched_domain {
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index ef5b66b110f8..b83f85d7e144 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -2586,59 +2586,6 @@ void task_tick_numa(struct rq *rq, struct task_struc=
t *curr)
 	}
 }
 =

-/*
- * Can a task be moved from prev_cpu to this_cpu without causing a load
- * imbalance that would trigger the load balancer?
- */
-static inline bool numa_wake_affine(struct sched_domain *sd,
-				    struct task_struct *p, int this_cpu,
-				    int prev_cpu, int sync)
-{
-	struct numa_stats prev_load, this_load;
-	s64 this_eff_load, prev_eff_load;
-
-	update_numa_stats(&prev_load, cpu_to_node(prev_cpu));
-	update_numa_stats(&this_load, cpu_to_node(this_cpu));
-
-	/*
-	 * If sync wakeup then subtract the (maximum possible)
-	 * effect of the currently running task from the load
-	 * of the current CPU:
-	 */
-	if (sync) {
-		unsigned long current_load =3D task_h_load(current);
-
-		if (this_load.load > current_load)
-			this_load.load -=3D current_load;
-		else
-			this_load.load =3D 0;
-	}
-
-	/*
-	 * In low-load situations, where this_cpu's node is idle due to the
-	 * sync cause above having dropped this_load.load to 0, move the task.
-	 * Moving to an idle socket will not create a bad imbalance.
-	 *
-	 * Otherwise check if the nodes are near enough in load to allow this
-	 * task to be woken on this_cpu's node.
-	 */
-	if (this_load.load > 0) {
-		unsigned long task_load =3D task_h_load(p);
-
-		this_eff_load =3D 100;
-		this_eff_load *=3D prev_load.compute_capacity;
-
-		prev_eff_load =3D 100 + (sd->imbalance_pct - 100) / 2;
-		prev_eff_load *=3D this_load.compute_capacity;
-
-		this_eff_load *=3D this_load.load + task_load;
-		prev_eff_load *=3D prev_load.load - task_load;
-
-		return this_eff_load <=3D prev_eff_load;
-	}
-
-	return true;
-}
 #else
 static void task_tick_numa(struct rq *rq, struct task_struct *curr)
 {
@@ -2652,14 +2599,6 @@ static inline void account_numa_dequeue(struct rq *r=
q, struct task_struct *p)
 {
 }
 =

-#ifdef CONFIG_SMP
-static inline bool numa_wake_affine(struct sched_domain *sd,
-				    struct task_struct *p, int this_cpu,
-				    int prev_cpu, int sync)
-{
-	return true;
-}
-#endif /* !SMP */
 #endif /* CONFIG_NUMA_BALANCING */
 =

 static void
@@ -5356,20 +5295,115 @@ static int wake_wide(struct task_struct *p)
 	return 1;
 }
 =

+struct llc_stats {
+	unsigned long nr_running;
+	unsigned long load;
+	unsigned long capacity;
+	int has_capacity;
+};
+
+static void get_llc_stats(struct llc_stats *stats, int cpu)
+{
+	struct sched_domain_shared *sds =3D rcu_dereference(per_cpu(sd_llc_shared=
, cpu));
+
+	if (!sds) {
+		memset(&stats, 0, sizeof(*stats));
+		return;
+	}
+
+	stats->nr_running =3D READ_ONCE(sds->nr_running);
+	stats->load       =3D READ_ONCE(sds->load);
+	stats->capacity   =3D READ_ONCE(sds->capacity);
+	stats->has_capacity =3D stats->nr_running < per_cpu(sd_llc_size, cpu);
+}
+
+/*
+ * Can a task be moved from prev_cpu to this_cpu without causing a load
+ * imbalance that would trigger the load balancer?
+ *
+ * Since we're running on 'stale' values, we might in fact create an imbal=
ance
+ * but recomputing these values is expensive, as that'd mean iteration 2 c=
ache
+ * domains worth of CPUs.
+ */
+static bool
+wake_affine_llc(struct sched_domain *sd, struct task_struct *p,
+		int this_cpu, int prev_cpu, int sync)
+{
+	struct llc_stats prev_stats, this_stats;
+	s64 this_eff_load, prev_eff_load;
+	unsigned long task_load;
+
+	get_llc_stats(&prev_stats, prev_cpu);
+	get_llc_stats(&this_stats, this_cpu);
+
+	/*
+	 * If sync wakeup then subtract the (maximum possible)
+	 * effect of the currently running task from the load
+	 * of the current LLC.
+	 */
+	if (sync) {
+		unsigned long current_load =3D task_h_load(current);
+
+		/* in this case load hits 0 and this LLC is considered 'idle' */
+		if (current_load > this_stats.load)
+			return true;
+
+		this_stats.load -=3D current_load;
+	}
+
+	/*
+	 * The has_capacity stuff is not SMT aware, but by trying to balance
+	 * the nr_running on both ends we try and fill the domain at equal
+	 * rates, thereby first consuming cores before siblings.
+	 */
+
+	/* if the old cache has capacity, stay there */
+	if (prev_stats.has_capacity && prev_stats.nr_running < this_stats.nr_runn=
ing+1)
+		return false;
+
+	/* if this cache has capacity, come here */
+	if (this_stats.has_capacity && this_stats.nr_running < prev_stats.nr_runn=
ing+1)
+		return true;
+
+
+	/*
+	 * Check to see if we can move the load without causing too much
+	 * imbalance.
+	 */
+	task_load =3D task_h_load(p);
+
+	this_eff_load =3D 100;
+	this_eff_load *=3D prev_stats.capacity;
+
+	prev_eff_load =3D 100 + (sd->imbalance_pct - 100) / 2;
+	prev_eff_load *=3D this_stats.capacity;
+
+	this_eff_load *=3D this_stats.load + task_load;
+	prev_eff_load *=3D prev_stats.load - task_load;
+
+	return this_eff_load <=3D prev_eff_load;
+}
+
 static int wake_affine(struct sched_domain *sd, struct task_struct *p,
 		       int prev_cpu, int sync)
 {
 	int this_cpu =3D smp_processor_id();
-	bool affine =3D false;
+	bool affine;
 =

 	/*
-	 * Common case: CPUs are in the same socket, and select_idle_sibling()
-	 * will do its thing regardless of what we return:
+	 * Default to no affine wakeups; wake_affine() should not effect a task
+	 * placement the load-balancer feels inclined to undo. The conservative
+	 * option is therefore to not move tasks when they wake up.
 	 */
-	if (cpus_share_cache(prev_cpu, this_cpu))
-		affine =3D true;
-	else
-		affine =3D numa_wake_affine(sd, p, this_cpu, prev_cpu, sync);
+	affine =3D false;
+
+	/*
+	 * If the wakeup is across cache domains, try to evaluate if movement
+	 * makes sense, otherwise rely on select_idle_siblings() to do
+	 * placement inside the cache domain.
+	 */
+	if (!cpus_share_cache(prev_cpu, this_cpu))
+		affine =3D wake_affine_llc(sd, p, this_cpu, prev_cpu, sync);
 =

 	schedstat_inc(p->se.statistics.nr_wakeups_affine_attempts);
 	if (affine) {
@@ -7049,6 +7083,7 @@ struct sg_lb_stats {
 struct sd_lb_stats {
 	struct sched_group *busiest;	/* Busiest group in this sd */
 	struct sched_group *local;	/* Local group in this sd */
+	unsigned long total_running;
 	unsigned long total_load;	/* Total load of all groups in sd */
 	unsigned long total_capacity;	/* Total capacity of all groups in sd */
 	unsigned long avg_load;	/* Average load across all groups in sd */
@@ -7068,6 +7103,7 @@ static inline void init_sd_lb_stats(struct sd_lb_stat=
s *sds)
 	*sds =3D (struct sd_lb_stats){
 		.busiest =3D NULL,
 		.local =3D NULL,
+		.total_running =3D 0UL,
 		.total_load =3D 0UL,
 		.total_capacity =3D 0UL,
 		.busiest_stat =3D {
@@ -7503,6 +7539,7 @@ static inline enum fbq_type fbq_classify_rq(struct rq=
 *rq)
  */
 static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_sta=
ts *sds)
 {
+	struct sched_domain_shared *shared =3D env->sd->shared;
 	struct sched_domain *child =3D env->sd->child;
 	struct sched_group *sg =3D env->sd->groups;
 	struct sg_lb_stats *local =3D &sds->local_stat;
@@ -7559,6 +7596,7 @@ static inline void update_sd_lb_stats(struct lb_env *=
env, struct sd_lb_stats *sd
 =

 next_group:
 		/* Now, start updating sd_lb_stats */
+		sds->total_running +=3D sgs->sum_nr_running;
 		sds->total_load +=3D sgs->group_load;
 		sds->total_capacity +=3D sgs->group_capacity;
 =

@@ -7574,6 +7612,21 @@ static inline void update_sd_lb_stats(struct lb_env =
*env, struct sd_lb_stats *sd
 			env->dst_rq->rd->overload =3D overload;
 	}
 =

+	if (!shared)
+		return;
+
+	/*
+	 * Since these are sums over groups they can contain some CPUs
+	 * multiple times for the NUMA domains.
+	 *
+	 * Currently only wake_affine_llc() and find_busiest_group()
+	 * uses these numbers, only the last is affected by this problem.
+	 *
+	 * XXX fix that.
+	 */
+	WRITE_ONCE(shared->nr_running,	sds->total_running);
+	WRITE_ONCE(shared->load,	sds->total_load);
+	WRITE_ONCE(shared->capacity,	sds->total_capacity);
 }
 =

 /**
@@ -7803,6 +7856,7 @@ static struct sched_group *find_busiest_group(struct =
lb_env *env)
 	if (!sds.busiest || busiest->sum_nr_running =3D=3D 0)
 		goto out_balanced;
 =

+	/* XXX broken for overlapping NUMA groups */
 	sds.avg_load =3D (SCHED_CAPACITY_SCALE * sds.total_load)
 						/ sds.total_capacity;
=20

--===============6197121059342471362==--

