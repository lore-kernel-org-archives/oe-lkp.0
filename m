Content-Type: multipart/mixed; boundary="===============8036367076181004717=="
MIME-Version: 1.0
From: Paolo Valente <paolo.valente@linaro.org>
To: lkp@lists.01.org
Subject: [PATCH 08/22] block, cfq: get rid of latency tunables
Date: Sun, 07 Aug 2016 20:12:08 +0200
Message-ID: <1470593542-11109-8-git-send-email-paolo.valente@linaro.org>
In-Reply-To: <1470593542-11109-1-git-send-email-paolo.valente@linaro.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============8036367076181004717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BFQ guarantees a low latency for interactive applications in a
completely different way with respect to CFQ. On the other hand, in
terms of interface and exactly as CFQ does, BFQ exports a boolean
low_latency tunable to switch low-latency heuristics on (in BFQ, these
heuristics lowers latency for interactive and soft real-time
applications). Finally, differently from CFQ, BFQ has not other
latency tunable.

Accordingly, this commit temporarily turns all latency tunables into
fake tunables, by turning the functions for reading and writing these
tunables into functions that just generate warnings. The commit
introducing low-latency heuristics in BFQ then restores only the
boolean low_latency tunable.

Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
---
 block/cfq-iosched.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/block/cfq-iosched.c b/block/cfq-iosched.c
index 2df1def..a0aafcf 100644
--- a/block/cfq-iosched.c
+++ b/block/cfq-iosched.c
@@ -30,7 +30,6 @@ static const u64 cfq_slice_sync =3D NSEC_PER_SEC / 10;
 static u64 cfq_slice_async =3D NSEC_PER_SEC / 25;
 static const int cfq_slice_async_rq =3D 2;
 static u64 cfq_slice_idle =3D NSEC_PER_SEC / 125;
-static const u64 cfq_target_latency =3D (u64)NSEC_PER_SEC * 3/10; /* 300 m=
s */
 static const int cfq_hist_divisor =3D 4;
 =

 /*
@@ -224,12 +223,9 @@ struct cfq_data {
 	unsigned int cfq_back_penalty;
 	unsigned int cfq_back_max;
 	unsigned int cfq_slice_async_rq;
-	unsigned int cfq_latency;
 	u64 cfq_fifo_expire[2];
 	u64 cfq_slice[2];
 	u64 cfq_slice_idle;
-	u64 cfq_group_idle;
-	u64 cfq_target_latency;
 =

 	/*
 	 * Fallback dummy cfqq for extreme OOM conditions
@@ -1485,7 +1481,7 @@ static bool cfq_may_dispatch(struct cfq_data *cfqd, s=
truct cfq_queue *cfqq)
 	 * We also ramp up the dispatch depth gradually for async IO,
 	 * based on the last sync IO we serviced
 	 */
-	if (!cfq_cfqq_sync(cfqq) && cfqd->cfq_latency) {
+	if (!cfq_cfqq_sync(cfqq)) {
 		u64 last_sync =3D ktime_get_ns() - cfqd->last_delayed_sync;
 		unsigned int depth;
 =

@@ -2323,10 +2319,8 @@ static int cfq_init_queue(struct request_queue *q, s=
truct elevator_type *e)
 	cfqd->cfq_back_penalty =3D cfq_back_penalty;
 	cfqd->cfq_slice[0] =3D cfq_slice_async;
 	cfqd->cfq_slice[1] =3D cfq_slice_sync;
-	cfqd->cfq_target_latency =3D cfq_target_latency;
 	cfqd->cfq_slice_async_rq =3D cfq_slice_async_rq;
 	cfqd->cfq_slice_idle =3D cfq_slice_idle;
-	cfqd->cfq_latency =3D 1;
 	cfqd->hw_tag =3D -1;
 	/*
 	 * we optimistically start assuming sync ops weren't delayed in last
@@ -2384,8 +2378,6 @@ SHOW_FUNCTION(cfq_slice_idle_show, cfqd->cfq_slice_id=
le, 1);
 SHOW_FUNCTION(cfq_slice_sync_show, cfqd->cfq_slice[1], 1);
 SHOW_FUNCTION(cfq_slice_async_show, cfqd->cfq_slice[0], 1);
 SHOW_FUNCTION(cfq_slice_async_rq_show, cfqd->cfq_slice_async_rq, 0);
-SHOW_FUNCTION(cfq_low_latency_show, cfqd->cfq_latency, 0);
-SHOW_FUNCTION(cfq_target_latency_show, cfqd->cfq_target_latency, 1);
 #undef SHOW_FUNCTION
 =

 #define USEC_SHOW_FUNCTION(__FUNC, __VAR)				\
@@ -2399,7 +2391,6 @@ static ssize_t __FUNC(struct elevator_queue *e, char =
*page)		\
 USEC_SHOW_FUNCTION(cfq_slice_idle_us_show, cfqd->cfq_slice_idle);
 USEC_SHOW_FUNCTION(cfq_slice_sync_us_show, cfqd->cfq_slice[1]);
 USEC_SHOW_FUNCTION(cfq_slice_async_us_show, cfqd->cfq_slice[0]);
-USEC_SHOW_FUNCTION(cfq_target_latency_us_show, cfqd->cfq_target_latency);
 #undef USEC_SHOW_FUNCTION
 =

 #define STORE_FUNCTION(__FUNC, __PTR, MIN, MAX, __CONV)			\
@@ -2431,8 +2422,6 @@ STORE_FUNCTION(cfq_slice_sync_store, &cfqd->cfq_slice=
[1], 1, UINT_MAX, 1);
 STORE_FUNCTION(cfq_slice_async_store, &cfqd->cfq_slice[0], 1, UINT_MAX, 1);
 STORE_FUNCTION(cfq_slice_async_rq_store, &cfqd->cfq_slice_async_rq, 1,
 		UINT_MAX, 0);
-STORE_FUNCTION(cfq_low_latency_store, &cfqd->cfq_latency, 0, 1, 0);
-STORE_FUNCTION(cfq_target_latency_store, &cfqd->cfq_target_latency, 1, UIN=
T_MAX, 1);
 #undef STORE_FUNCTION
 =

 #define USEC_STORE_FUNCTION(__FUNC, __PTR, MIN, MAX)			\
@@ -2451,12 +2440,27 @@ static ssize_t __FUNC(struct elevator_queue *e, con=
st char *page, size_t count)
 USEC_STORE_FUNCTION(cfq_slice_idle_us_store, &cfqd->cfq_slice_idle, 0, UIN=
T_MAX);
 USEC_STORE_FUNCTION(cfq_slice_sync_us_store, &cfqd->cfq_slice[1], 1, UINT_=
MAX);
 USEC_STORE_FUNCTION(cfq_slice_async_us_store, &cfqd->cfq_slice[0], 1, UINT=
_MAX);
-USEC_STORE_FUNCTION(cfq_target_latency_us_store, &cfqd->cfq_target_latency=
, 1, UINT_MAX);
 #undef USEC_STORE_FUNCTION
 =

+static ssize_t cfq_fake_lat_show(struct elevator_queue *e, char *page)
+{
+	pr_warn_once("CFQ I/O SCHED: tried to read removed latency tunable");
+	return sprintf(page, "0\n");
+}
+
+static ssize_t
+cfq_fake_lat_store(struct elevator_queue *e, const char *page, size_t coun=
t)
+{
+	pr_warn_once("CFQ I/O SCHED: tried to write removed latency tunable");
+	return count;
+}
+
 #define CFQ_ATTR(name) \
 	__ATTR(name, S_IRUGO|S_IWUSR, cfq_##name##_show, cfq_##name##_store)
 =

+#define CFQ_FAKE_LAT_ATTR(name) \
+	__ATTR(name, S_IRUGO|S_IWUSR, cfq_fake_lat_show, cfq_fake_lat_store)
+
 static struct elv_fs_entry cfq_attrs[] =3D {
 	CFQ_ATTR(quantum),
 	CFQ_ATTR(fifo_expire_sync),
@@ -2470,9 +2474,9 @@ static struct elv_fs_entry cfq_attrs[] =3D {
 	CFQ_ATTR(slice_async_rq),
 	CFQ_ATTR(slice_idle),
 	CFQ_ATTR(slice_idle_us),
-	CFQ_ATTR(low_latency),
-	CFQ_ATTR(target_latency),
-	CFQ_ATTR(target_latency_us),
+	CFQ_FAKE_LAT_ATTR(low_latency),
+	CFQ_FAKE_LAT_ATTR(target_latency),
+	CFQ_FAKE_LAT_ATTR(target_latency_us),
 	__ATTR_NULL
 };
 =

-- =

1.9.1


--===============8036367076181004717==--

