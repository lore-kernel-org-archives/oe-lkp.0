Content-Type: multipart/mixed; boundary="===============6030806640302375051=="
MIME-Version: 1.0
From: Shakeel Butt <shakeelb@google.com>
To: lkp@lists.01.org
Subject: [PATCH v2 1/3] mm: page_counter: remove unneeded atomic ops for low/min
Date: Thu, 25 Aug 2022 00:05:04 +0000
Message-ID: <20220825000506.239406-2-shakeelb@google.com>
In-Reply-To: <20220825000506.239406-1-shakeelb@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6030806640302375051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

For cgroups using low or min protections, the function
propagate_protected_usage() was doing an atomic xchg() operation
irrespectively. We can optimize out this atomic operation for one
specific scenario where the workload is using the protection (i.e.
min > 0) and the usage is above the protection (i.e. usage > min).

This scenario is actually very common where the users want a part of
their workload to be protected against the external reclaim. Though this
optimization does introduce a race when the usage is around the
protection and concurrent charges and uncharged trip it over or under
the protection. In such cases, we might see lower effective protection
but the subsequent charge/uncharge will correct it.

To evaluate the impact of this optimization, on a 72 CPUs machine, we
ran the following workload in a three level of cgroup hierarchy with top
level having min and low setup appropriately to see if this optimization
is effective for the mentioned case.

 $ netserver -6
 # 36 instances of netperf with following params
 $ netperf -6 -H ::1 -l 60 -t TCP_SENDFILE -- -m 10K

Results (average throughput of netperf):
Without (6.0-rc1)	10482.7 Mbps
With patch		14542.5 Mbps (38.7% improvement)

With the patch, the throughput improved by 38.7%

Signed-off-by: Shakeel Butt <shakeelb@google.com>
Reported-by: kernel test robot <oliver.sang@intel.com>
Acked-by: Soheil Hassas Yeganeh <soheil@google.com>
Reviewed-by: Feng Tang <feng.tang@intel.com>
Acked-by: Roman Gushchin <roman.gushchin@linux.dev>
---
Changes since v1:
- Commit message update with more detail on which scenario is getting
  optimized and possible race condition.

 mm/page_counter.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/mm/page_counter.c b/mm/page_counter.c
index eb156ff5d603..47711aa28161 100644
--- a/mm/page_counter.c
+++ b/mm/page_counter.c
@@ -17,24 +17,23 @@ static void propagate_protected_usage(struct page_count=
er *c,
 				      unsigned long usage)
 {
 	unsigned long protected, old_protected;
-	unsigned long low, min;
 	long delta;
 =

 	if (!c->parent)
 		return;
 =

-	min =3D READ_ONCE(c->min);
-	if (min || atomic_long_read(&c->min_usage)) {
-		protected =3D min(usage, min);
+	protected =3D min(usage, READ_ONCE(c->min));
+	old_protected =3D atomic_long_read(&c->min_usage);
+	if (protected !=3D old_protected) {
 		old_protected =3D atomic_long_xchg(&c->min_usage, protected);
 		delta =3D protected - old_protected;
 		if (delta)
 			atomic_long_add(delta, &c->parent->children_min_usage);
 	}
 =

-	low =3D READ_ONCE(c->low);
-	if (low || atomic_long_read(&c->low_usage)) {
-		protected =3D min(usage, low);
+	protected =3D min(usage, READ_ONCE(c->low));
+	old_protected =3D atomic_long_read(&c->low_usage);
+	if (protected !=3D old_protected) {
 		old_protected =3D atomic_long_xchg(&c->low_usage, protected);
 		delta =3D protected - old_protected;
 		if (delta)
-- =

2.37.1.595.g718a3a8f04-goog

--===============6030806640302375051==--

