Content-Type: multipart/mixed; boundary="===============2276818693245897557=="
MIME-Version: 1.0
From: Stephan Mueller <smueller@chronox.de>
To: lkp@lists.01.org
Subject: [PATCH 1/4] DRBG: Select correct DRBG core for stdrng
Date: Tue, 01 Jul 2014 15:13:42 +0000
Message-ID: <2048210.Q12HSlDxg7@myon.chronox.de>
In-Reply-To: <36957559.tbJt1gJF6I@myon.chronox.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============2276818693245897557==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When the DRBG is initialized, the core is looked up using the DRBG name.
The name that can be used for the lookup is registered in
cra_driver_name. The cra_name value contains stdrng.

Thus, the lookup code must use crypto_tfm_alg_driver_name to obtain the
precise DRBG name and select the correct DRBG.

Signed-off-by: Stephan Mueller <smueller@chronox.de>
---
 crypto/drbg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/drbg.c b/crypto/drbg.c
index 53ff20d..14495df 100644
--- a/crypto/drbg.c
+++ b/crypto/drbg.c
@@ -1764,7 +1764,7 @@ static int drbg_kcapi_init(struct crypto_tfm *tfm)
 	bool pr =3D false;
 	int coreref =3D 0;
 =

-	drbg_convert_tfm_core(crypto_tfm_alg_name(tfm), &coreref, &pr);
+	drbg_convert_tfm_core(crypto_tfm_alg_driver_name(tfm), &coreref, &pr);
 	/*
 	 * when personalization string is needed, the caller must call reset
 	 * and provide the personalization string as seed information
-- =

1.9.3



--===============2276818693245897557==--

