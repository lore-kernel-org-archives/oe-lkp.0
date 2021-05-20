Content-Type: multipart/mixed; boundary="===============7904738820361933585=="
MIME-Version: 1.0
From: Yu Zhao <yuzhao@google.com>
To: lkp@lists.01.org
Subject: [PATCH v3 06/14] mm/workingset.c: refactor pack_shadow() and unpack_shadow()
Date: Thu, 20 May 2021 00:53:47 -0600
Message-ID: <20210520065355.2736558-7-yuzhao@google.com>
In-Reply-To: <20210520065355.2736558-1-yuzhao@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7904738820361933585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patches moves the bucket order and PageWorkingset() out of
pack_shadow() and unpack_shadow(). It has no merits on its own but
makes the upcoming changes to mm/workingset.c less diffy.

Signed-off-by: Yu Zhao <yuzhao@google.com>
Tested-by: Konstantin Kharlamov <Hi-Angel@yandex.ru>
---
 mm/workingset.c | 53 ++++++++++++++++++++-----------------------------
 1 file changed, 22 insertions(+), 31 deletions(-)

diff --git a/mm/workingset.c b/mm/workingset.c
index b7cdeca5a76d..edb8aed2587e 100644
--- a/mm/workingset.c
+++ b/mm/workingset.c
@@ -168,9 +168,9 @@
  * refault distance will immediately activate the refaulting page.
  */
 =

-#define EVICTION_SHIFT	((BITS_PER_LONG - BITS_PER_XA_VALUE) +	\
-			 1 + NODES_SHIFT + MEM_CGROUP_ID_SHIFT)
-#define EVICTION_MASK	(~0UL >> EVICTION_SHIFT)
+#define EVICTION_SHIFT		(BITS_PER_XA_VALUE - MEM_CGROUP_ID_SHIFT - NODES_S=
HIFT)
+#define EVICTION_MASK		(BIT(EVICTION_SHIFT) - 1)
+#define WORKINGSET_WIDTH	1
 =

 /*
  * Eviction timestamps need to be able to cover the full range of
@@ -182,36 +182,23 @@
  */
 static unsigned int bucket_order __read_mostly;
 =

-static void *pack_shadow(int memcgid, pg_data_t *pgdat, unsigned long evic=
tion,
-			 bool workingset)
+static void *pack_shadow(int memcg_id, struct pglist_data *pgdat, unsigned=
 long val)
 {
-	eviction >>=3D bucket_order;
-	eviction &=3D EVICTION_MASK;
-	eviction =3D (eviction << MEM_CGROUP_ID_SHIFT) | memcgid;
-	eviction =3D (eviction << NODES_SHIFT) | pgdat->node_id;
-	eviction =3D (eviction << 1) | workingset;
+	val =3D (val << MEM_CGROUP_ID_SHIFT) | memcg_id;
+	val =3D (val << NODES_SHIFT) | pgdat->node_id;
 =

-	return xa_mk_value(eviction);
+	return xa_mk_value(val);
 }
 =

-static void unpack_shadow(void *shadow, int *memcgidp, pg_data_t **pgdat,
-			  unsigned long *evictionp, bool *workingsetp)
+static unsigned long unpack_shadow(void *shadow, int *memcg_id, struct pgl=
ist_data **pgdat)
 {
-	unsigned long entry =3D xa_to_value(shadow);
-	int memcgid, nid;
-	bool workingset;
+	unsigned long val =3D xa_to_value(shadow);
 =

-	workingset =3D entry & 1;
-	entry >>=3D 1;
-	nid =3D entry & ((1UL << NODES_SHIFT) - 1);
-	entry >>=3D NODES_SHIFT;
-	memcgid =3D entry & ((1UL << MEM_CGROUP_ID_SHIFT) - 1);
-	entry >>=3D MEM_CGROUP_ID_SHIFT;
+	*pgdat =3D NODE_DATA(val & (BIT(NODES_SHIFT) - 1));
+	val >>=3D NODES_SHIFT;
+	*memcg_id =3D val & (BIT(MEM_CGROUP_ID_SHIFT) - 1);
 =

-	*memcgidp =3D memcgid;
-	*pgdat =3D NODE_DATA(nid);
-	*evictionp =3D entry << bucket_order;
-	*workingsetp =3D workingset;
+	return val >> MEM_CGROUP_ID_SHIFT;
 }
 =

 /**
@@ -266,8 +253,10 @@ void *workingset_eviction(struct page *page, struct me=
m_cgroup *target_memcg)
 	/* XXX: target_memcg can be NULL, go through lruvec */
 	memcgid =3D mem_cgroup_id(lruvec_memcg(lruvec));
 	eviction =3D atomic_long_read(&lruvec->nonresident_age);
+	eviction >>=3D bucket_order;
+	eviction =3D (eviction << WORKINGSET_WIDTH) | PageWorkingset(page);
 	workingset_age_nonresident(lruvec, thp_nr_pages(page));
-	return pack_shadow(memcgid, pgdat, eviction, PageWorkingset(page));
+	return pack_shadow(memcgid, pgdat, eviction);
 }
 =

 /**
@@ -294,7 +283,7 @@ void workingset_refault(struct page *page, void *shadow)
 	bool workingset;
 	int memcgid;
 =

-	unpack_shadow(shadow, &memcgid, &pgdat, &eviction, &workingset);
+	eviction =3D unpack_shadow(shadow, &memcgid, &pgdat);
 =

 	rcu_read_lock();
 	/*
@@ -318,6 +307,8 @@ void workingset_refault(struct page *page, void *shadow)
 		goto out;
 	eviction_lruvec =3D mem_cgroup_lruvec(eviction_memcg, pgdat);
 	refault =3D atomic_long_read(&eviction_lruvec->nonresident_age);
+	workingset =3D eviction & (BIT(WORKINGSET_WIDTH) - 1);
+	eviction =3D (eviction >> WORKINGSET_WIDTH) << bucket_order;
 =

 	/*
 	 * Calculate the refault distance
@@ -335,7 +326,7 @@ void workingset_refault(struct page *page, void *shadow)
 	 * longest time, so the occasional inappropriate activation
 	 * leading to pressure on the active list is not a problem.
 	 */
-	refault_distance =3D (refault - eviction) & EVICTION_MASK;
+	refault_distance =3D (refault - eviction) & (EVICTION_MASK >> WORKINGSET_=
WIDTH);
 =

 	/*
 	 * The activation decision for this page is made at the level
@@ -593,7 +584,7 @@ static int __init workingset_init(void)
 	unsigned int max_order;
 	int ret;
 =

-	BUILD_BUG_ON(BITS_PER_LONG < EVICTION_SHIFT);
+	BUILD_BUG_ON(EVICTION_SHIFT < WORKINGSET_WIDTH);
 	/*
 	 * Calculate the eviction bucket size to cover the longest
 	 * actionable refault distance, which is currently half of
@@ -601,7 +592,7 @@ static int __init workingset_init(void)
 	 * some more pages@runtime, so keep working with up to
 	 * double the initial memory by using totalram_pages as-is.
 	 */
-	timestamp_bits =3D BITS_PER_LONG - EVICTION_SHIFT;
+	timestamp_bits =3D EVICTION_SHIFT - WORKINGSET_WIDTH;
 	max_order =3D fls_long(totalram_pages() - 1);
 	if (max_order > timestamp_bits)
 		bucket_order =3D max_order - timestamp_bits;
-- =

2.31.1.751.gd2f1c929bd-goog

--===============7904738820361933585==--

