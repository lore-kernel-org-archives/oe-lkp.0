Content-Type: multipart/mixed; boundary="===============8478268515824912496=="
MIME-Version: 1.0
From: Stephan Mueller <smueller@chronox.de>
To: lkp@lists.01.org
Subject: [PATCH 3/4] DRBG: fix memory corruption for AES192
Date: Tue, 01 Jul 2014 15:09:51 +0000
Message-ID: <3083657.SRQmeelhqi@myon.chronox.de>
In-Reply-To: <36957559.tbJt1gJF6I@myon.chronox.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============8478268515824912496==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

For the CTR DRBG, the drbg_state->scratchpad temp buffer (i.e. the
memory location immediately before the drbg_state->tfm variable
is the buffer that the BCC function operates on. BCC operates
blockwise. Making the temp buffer drbg_statelen(drbg) in size is
sufficient when the DRBG state length is a multiple of the block
size. For AES192 this is not the case and the length for temp is
insufficient (yes, that also means for such ciphers, the final
output of all BCC rounds are truncated before used to update the
state of the DRBG!!).

The patch enlarges the temp buffer from drbg_statelen to
drbg_statelen + drbg_blocklen to have sufficient space.

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Stephan Mueller <smueller@chronox.de>
---
 crypto/drbg.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/crypto/drbg.c b/crypto/drbg.c
index 86d483f..c2f02b7 100644
--- a/crypto/drbg.c
+++ b/crypto/drbg.c
@@ -441,8 +441,16 @@ static int drbg_ctr_bcc(struct drbg_state *drbg,
  *		length: drbg_blocklen(drbg)
  *	temp
  *		start: iv + drbg_blocklen(drbg)
- *		length: (drbg_keylen(drbg) + drbg_blocklen(drbg) =3D=3D
- *				drbg_statelen(drbg))
+ *		length: drbg_satelen(drbg) + drbg_blocklen(drbg)
+ *			note: temp is the buffer that the BCC function =

operates
+ *			on. BCC operates blockwise. drbg_statelen(drbg)
+ *			is sufficient when the DRBG state length is a multiple
+ *			of the block size. For AES192 (and maybe other =

ciphers)
+ *			this is not correct and the length for temp is
+ *			insufficient (yes, that also means for such ciphers,
+ *			the final output of all BCC rounds are truncated).
+ *			Therefore, add drbg_blocklen(drbg) to cover all
+ *			possibilities.
  */
 =

 /* Derivation Function for CTR DRBG as defined in 10.4.2 */
@@ -1214,7 +1222,7 @@ static inline int drbg_alloc_state(struct drbg_state =

*drbg)
 			  drbg_statelen(drbg) +	/* df_data */
 			  drbg_blocklen(drbg) +	/* pad */
 			  drbg_blocklen(drbg) +	/* iv */
-			  drbg_statelen(drbg);	/* temp */
+			  drbg_statelen(drbg) + drbg_blocklen(drbg); /* temp =

*/
 	else
 		sb_size =3D drbg_statelen(drbg) + drbg_blocklen(drbg);
 =

-- =

1.9.3



--===============8478268515824912496==--

