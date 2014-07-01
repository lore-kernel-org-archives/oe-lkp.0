Content-Type: multipart/mixed; boundary="===============0081610638581153907=="
MIME-Version: 1.0
From: Stephan Mueller <smueller@chronox.de>
To: lkp@lists.01.org
Subject: [PATCH 4/4] DRBG: HMAC-SHA1 DRBG has crypto strength of 128 bits
Date: Tue, 01 Jul 2014 15:07:49 +0000
Message-ID: <3541308.zCk9jgdY1p@myon.chronox.de>
In-Reply-To: <36957559.tbJt1gJF6I@myon.chronox.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============0081610638581153907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The patch corrects the security strength of the HMAC-SHA1 DRBG to 128
bits. This strength defines the size of the seed required for the DRBG.
Thus, the patch lowers the seeding requirement from 256 bits to 128 bits
for HMAC-SHA1.

Signed-off-by: Stephan Mueller <smueller@chronox.de>
---
 crypto/drbg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/drbg.c b/crypto/drbg.c
index c2f02b7..e6c52e0 100644
--- a/crypto/drbg.c
+++ b/crypto/drbg.c
@@ -195,7 +195,7 @@ static const struct drbg_core drbg_cores[] =3D {
 #endif /* CONFIG_CRYPTO_DRBG_HASH */
 #ifdef CONFIG_CRYPTO_DRBG_HMAC
 	{
-		.flags =3D DRBG_HMAC | DRBG_STRENGTH256,
+		.flags =3D DRBG_HMAC | DRBG_STRENGTH128,
 		.statelen =3D 20, /* block length of cipher */
 		.max_addtllen =3D 35,
 		.max_bits =3D 19,
-- =

1.9.3



--===============0081610638581153907==--

