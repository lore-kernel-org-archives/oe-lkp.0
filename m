Content-Type: multipart/mixed; boundary="===============1114070352348797210=="
MIME-Version: 1.0
From: Stephan Mueller <smueller@chronox.de>
To: lkp@lists.01.org
Subject: [PATCH 2/4] DRBG: Mix a time stamp into DRBG state
Date: Tue, 01 Jul 2014 15:11:25 +0000
Message-ID: <54012953.aoTx2qNanx@myon.chronox.de>
In-Reply-To: <36957559.tbJt1gJF6I@myon.chronox.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============1114070352348797210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The current locking approach of the DRBG tries to keep the protected
code paths very minimal. It is therefore possible that two threads query
one DRBG instance at the same time. When thread A requests random
numbers, a shadow copy of the DRBG state is created upon which the
request for A is processed. After finishing the state for A's request is
merged back into the DRBG state. If now thread B requests random numbers
from the same DRBG after the request for thread A is received, but
before A's shadow state is merged back, the random numbers for B will be
identical to the ones for A. Please note that the time window is very
small for this scenario.

To prevent that there is even a theoretical chance for thread A and B
having the same DRBG state, the current time stamp is provided as
additional information string for each new request.

The addition of the time stamp as additional information string implies
that now all generate functions must be capable to process a linked
list with additional information strings instead of a scalar.

CC: Rafael Aquini <aquini@redhat.com>
Signed-off-by: Stephan Mueller <smueller@chronox.de>
---
 crypto/drbg.c         | 59 =

++++++++++++++++++++++++++++++---------------------
 include/crypto/drbg.h |  2 +-
 2 files changed, 36 insertions(+), 25 deletions(-)

diff --git a/crypto/drbg.c b/crypto/drbg.c
index 14495df..86d483f 100644
--- a/crypto/drbg.c
+++ b/crypto/drbg.c
@@ -649,7 +649,7 @@ out:
 /* Generate function of CTR DRBG as defined in 10.2.1.5.2 */
 static int drbg_ctr_generate(struct drbg_state *drbg,
 			     unsigned char *buf, unsigned int buflen,
-			     struct drbg_string *addtl)
+			     struct list_head *addtl)
 {
 	int len =3D 0;
 	int ret =3D 0;
@@ -659,11 +659,8 @@ static int drbg_ctr_generate(struct drbg_state *drbg,
 	memset(drbg->scratchpad, 0, drbg_blocklen(drbg));
 =

 	/* 10.2.1.5.2 step 2 */
-	if (addtl && 0 < addtl->len) {
-		LIST_HEAD(addtllist);
-
-		list_add_tail(&addtl->list, &addtllist);
-		ret =3D drbg_ctr_update(drbg, &addtllist, 2);
+	if (addtl && !list_empty(addtl)) {
+		ret =3D drbg_ctr_update(drbg, addtl, 2);
 		if (ret)
 			return 0;
 	}
@@ -780,7 +777,7 @@ static int drbg_hmac_update(struct drbg_state *drbg, =

struct list_head *seed,
 static int drbg_hmac_generate(struct drbg_state *drbg,
 			      unsigned char *buf,
 			      unsigned int buflen,
-			      struct drbg_string *addtl)
+			      struct list_head *addtl)
 {
 	int len =3D 0;
 	int ret =3D 0;
@@ -788,11 +785,8 @@ static int drbg_hmac_generate(struct drbg_state *drbg,
 	LIST_HEAD(datalist);
 =

 	/* 10.1.2.5 step 2 */
-	if (addtl && 0 < addtl->len) {
-		LIST_HEAD(addtllist);
-
-		list_add_tail(&addtl->list, &addtllist);
-		ret =3D drbg_hmac_update(drbg, &addtllist, 1);
+	if (addtl && !list_empty(addtl)) {
+		ret =3D drbg_hmac_update(drbg, addtl, 1);
 		if (ret)
 			return ret;
 	}
@@ -816,14 +810,10 @@ static int drbg_hmac_generate(struct drbg_state *drbg,
 	}
 =

 	/* 10.1.2.5 step 6 */
-	if (addtl && 0 < addtl->len) {
-		LIST_HEAD(addtllist);
-
-		list_add_tail(&addtl->list, &addtllist);
-		ret =3D drbg_hmac_update(drbg, &addtllist, 1);
-	} else {
+	if (addtl && !list_empty(addtl))
+		ret =3D drbg_hmac_update(drbg, addtl, 1);
+	else
 		ret =3D drbg_hmac_update(drbg, NULL, 1);
-	}
 	if (ret)
 		return ret;
 =

@@ -947,7 +937,7 @@ out:
 =

 /* processing of additional information string for Hash DRBG */
 static int drbg_hash_process_addtl(struct drbg_state *drbg,
-				   struct drbg_string *addtl)
+				   struct list_head *addtl)
 {
 	int ret =3D 0;
 	struct drbg_string data1, data2;
@@ -958,7 +948,7 @@ static int drbg_hash_process_addtl(struct drbg_state =

*drbg,
 	memset(drbg->scratchpad, 0, drbg_blocklen(drbg));
 =

 	/* 10.1.1.4 step 2 */
-	if (!addtl || 0 =3D=3D addtl->len)
+	if (!addtl || list_empty(addtl))
 		return 0;
 =

 	/* 10.1.1.4 step 2a */
@@ -966,7 +956,7 @@ static int drbg_hash_process_addtl(struct drbg_state =

*drbg,
 	drbg_string_fill(&data2, drbg->V, drbg_statelen(drbg));
 	list_add_tail(&data1.list, &datalist);
 	list_add_tail(&data2.list, &datalist);
-	list_add_tail(&addtl->list, &datalist);
+	list_splice_tail(addtl, &datalist);
 	ret =3D drbg_kcapi_hash(drbg, NULL, drbg->scratchpad, &datalist);
 	if (ret)
 		goto out;
@@ -1032,7 +1022,7 @@ out:
 /* generate function for Hash DRBG as defined in  10.1.1.4 */
 static int drbg_hash_generate(struct drbg_state *drbg,
 			      unsigned char *buf, unsigned int buflen,
-			      struct drbg_string *addtl)
+			      struct list_head *addtl)
 {
 	int len =3D 0;
 	int ret =3D 0;
@@ -1350,6 +1340,12 @@ static int drbg_generate(struct drbg_state *drbg,
 {
 	int len =3D 0;
 	struct drbg_state *shadow =3D NULL;
+	LIST_HEAD(addtllist);
+	struct drbg_string timestamp;
+	union {
+		cycles_t cycles;
+		unsigned char char_cycles[sizeof(cycles_t)];
+	} now;
 =

 	if (0 =3D=3D buflen || !buf) {
 		pr_devel("DRBG: no output buffer provided\n");
@@ -1410,8 +1406,23 @@ static int drbg_generate(struct drbg_state *drbg,
 		/* 9.3.1 step 7.4 */
 		addtl =3D NULL;
 	}
+
+	/*
+	 * Mix the time stamp into the DRBG state if the DRBG is not in
+	 * test mode. If there are two callers invoking the DRBG at the same
+	 * time, i.e. before the first caller merges its shadow state back,
+	 * both callers would obtain the same random number stream without
+	 * changing the state here.
+	 */
+	if (!drbg->test_data) {
+		now.cycles =3D random_get_entropy();
+		drbg_string_fill(&timestamp, now.char_cycles, =

sizeof(cycles_t));
+		list_add_tail(&timestamp.list, &addtllist);
+	}
+	if (addtl && 0 < addtl->len)
+		list_add_tail(&addtl->list, &addtllist);
 	/* 9.3.1 step 8 and 10 */
-	len =3D shadow->d_ops->generate(shadow, buf, buflen, addtl);
+	len =3D shadow->d_ops->generate(shadow, buf, buflen, &addtllist);
 =

 	/* 10.1.1.4 step 6, 10.1.2.5 step 7, 10.2.1.5.2 step 7 */
 	shadow->reseed_ctr++;
diff --git a/include/crypto/drbg.h b/include/crypto/drbg.h
index 4065dfc..831d786 100644
--- a/include/crypto/drbg.h
+++ b/include/crypto/drbg.h
@@ -102,7 +102,7 @@ struct drbg_state_ops {
 		      int reseed);
 	int (*generate)(struct drbg_state *drbg,
 			unsigned char *buf, unsigned int buflen,
-			struct drbg_string *addtl);
+			struct list_head *addtl);
 	int (*crypto_init)(struct drbg_state *drbg);
 	int (*crypto_fini)(struct drbg_state *drbg);
 =

-- =

1.9.3



--===============1114070352348797210==--

