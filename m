Content-Type: multipart/mixed; boundary="===============4176104128751002665=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: 5b4ed50902 ("sched/fair: Fix wake_affine() for !NUMA_BALANCING"): BUG: unable to handle kernel paging request at ffffffffffffff80
Date: Thu, 10 Aug 2017 13:19:40 +0200
Message-ID: <20170810111940.j76zq5bagk22hv5i@hirez.programming.kicks-ass.net>
In-Reply-To: <20170810090250.gmdkvrdynhlnaiv5@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4176104128751002665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2017 at 11:02:50AM +0200, Peter Zijlstra wrote:
> On Thu, Aug 10, 2017 at 10:50:17AM +0200, Peter Zijlstra wrote:
> > > > +++-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > > > ii  gcc-4.8                          4.8.4-1               amd64   =
              GNU C compiler
> > > > ii  gcc-4.8-base:amd64               4.8.4-1               amd64   =
              GCC, the GNU Compiler Collection (base package)
> > > > ii  gcc-4.8-multilib                 4.8.4-1               amd64   =
              GNU C compiler (multilib files)
> > > > ii  gcc-4.8-plugin-dev               4.8.4-1               amd64   =
              Files for GNU GCC plugin development.
> =

> Got them from the jessie archives, seems to build now..

Hahah, I'm an idiot ;-)

I was overwriting the pointer, not the actual object with 0s.

--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5302,19 +5302,19 @@ struct llc_stats {
 	int has_capacity;
 };
 =

-static void get_llc_stats(struct llc_stats *stats, int cpu)
+static bool get_llc_stats(struct llc_stats *stats, int cpu)
 {
 	struct sched_domain_shared *sds =3D rcu_dereference(per_cpu(sd_llc_shared=
, cpu));
 =

-	if (!sds) {
-		memset(&stats, 0, sizeof(*stats));
-		return;
-	}
+	if (!sds)
+		return false;
 =

 	stats->nr_running =3D READ_ONCE(sds->nr_running);
 	stats->load       =3D READ_ONCE(sds->load);
 	stats->capacity   =3D READ_ONCE(sds->capacity);
 	stats->has_capacity =3D stats->nr_running < per_cpu(sd_llc_size, cpu);
+
+	return true;
 }
 =

 /*
@@ -5333,8 +5333,9 @@ wake_affine_llc(struct sched_domain *sd,
 	s64 this_eff_load, prev_eff_load;
 	unsigned long task_load;
 =

-	get_llc_stats(&prev_stats, prev_cpu);
-	get_llc_stats(&this_stats, this_cpu);
+	if (!get_llc_stats(&prev_stats, prev_cpu) ||
+	    !get_llc_stats(&this_stats, this_cpu))
+		return false;
 =

 	/*
 	 * If sync wakeup then subtract the (maximum possible)

--===============4176104128751002665==--

