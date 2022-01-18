Content-Type: multipart/mixed; boundary="===============2626181249206249768=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: [PATCH] crypto: kdf - Select hmac in addition to sha256
Date: Tue, 18 Jan 2022 16:31:29 +1100
Message-ID: <YeZQsSkRsioTHE1z@gondor.apana.org.au>
In-Reply-To: <20220118015649.GA12486@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2626181249206249768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2022 at 09:56:49AM +0800, kernel test robot wrote:
> =

> [ 42.753085][ T1] WARNING: CPU: 1 PID: 1 at crypto/kdf_sp800108.c:138 cry=
pto_kdf108_init (crypto/kdf_sp800108.c:136) =

> [   42.754665][    T1] Modules linked in:
> [   42.755366][    T1] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.16.0-r=
c1-00049-gd3b04a4398fe #2
> [   42.756752][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.12.0-1 04/01/2014
> [ 42.758199][ T1] RIP: 0010:crypto_kdf108_init (crypto/kdf_sp800108.c:136=
) =

>
> CONFIG_CRYPTO_HMAC=3Dm
> CONFIG_CRYPTO_KDF800108_CTR=3Dy

---8<---
In addition to sha256 we must also enable hmac for the kdf self-test
to work.

Reported-by: kernel test robot <oliver.sang@intel.com>
Fixes: 304b4acee2f0 ("crypto: kdf - select SHA-256 required...")
Fixes: 026a733e6659 ("crypto: kdf - add SP800-108 counter key...")
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/crypto/Kconfig b/crypto/Kconfig
index 3ba2f532d79c..2b0456731603 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1850,6 +1850,7 @@ config CRYPTO_JITTERENTROPY
 =

 config CRYPTO_KDF800108_CTR
 	tristate
+	select CRYPTO_HMAC
 	select CRYPTO_SHA256
 =

 config CRYPTO_USER_API
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
--===============2626181249206249768==--

