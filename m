Content-Type: multipart/mixed; boundary="===============2614746854352807356=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: [PATCH 2/5] hwrng: core - Fix current_rng init/cleanup race yet again
Date: Tue, 23 Dec 2014 16:40:18 +1100
Message-ID: <E1Y3ICg-0007cq-Kj@gondolin.me.apana.org.au>
In-Reply-To: <20141223053909.GA28001@gondor.apana.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============2614746854352807356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The kref solution is still buggy because we were only focusing
on the register/unregister race.  The same race affects the
setting of current_rng through sysfs.

This patch fixes it by using kref_get_unless_zero.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---

 drivers/char/hw_random/core.c |   14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/char/hw_random/core.c b/drivers/char/hw_random/core.c
index 3dba2cf..42827fd 100644
--- a/drivers/char/hw_random/core.c
+++ b/drivers/char/hw_random/core.c
@@ -105,7 +105,6 @@ static inline void cleanup_rng(struct kref *kref)
 static void set_current_rng(struct hwrng *rng)
 {
 	BUG_ON(!mutex_is_locked(&rng_mutex));
-	kref_get(&rng->ref);
 	current_rng =3D rng;
 }
 =

@@ -150,6 +149,9 @@ static void put_rng(struct hwrng *rng)
 =

 static inline int hwrng_init(struct hwrng *rng)
 {
+	if (kref_get_unless_zero(&rng->ref))
+		goto skip_init;
+
 	if (rng->init) {
 		int ret;
 =

@@ -157,6 +159,11 @@ static inline int hwrng_init(struct hwrng *rng)
 		if (ret)
 			return ret;
 	}
+
+	kref_init(&rng->ref);
+	reinit_completion(&rng->cleanup_done);
+
+skip_init:
 	add_early_randomness(rng);
 =

 	current_quality =3D rng->quality ? : default_quality;
@@ -467,6 +474,9 @@ int hwrng_register(struct hwrng *rng)
 			goto out_unlock;
 	}
 =

+	init_completion(&rng->cleanup_done);
+	complete(&rng->cleanup_done);
+
 	old_rng =3D current_rng;
 	err =3D 0;
 	if (!old_rng) {
@@ -494,8 +504,6 @@ int hwrng_register(struct hwrng *rng)
 		add_early_randomness(rng);
 	}
 =

-	init_completion(&rng->cleanup_done);
-
 out_unlock:
 	mutex_unlock(&rng_mutex);
 out:

--===============2614746854352807356==--

