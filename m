Content-Type: multipart/mixed; boundary="===============3796573780811201716=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: [rhashtable] [ INFO: suspicious RCU usage. ]
Date: Thu, 02 Apr 2015 12:29:50 +0800
Message-ID: <20150402042950.GA5643@gondor.apana.org.au>
In-Reply-To: <20150402041135.GA22514@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3796573780811201716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 02, 2015 at 12:11:35PM +0800, Fengguang Wu wrote:
> =

> Yes it is contained in next-20150401 which is bad:
> =

> # extra tests on tree/branch next/master
> git bisect  bad e954104e2b634b42811dad8d502cbf240f206df2  # 21:22      0-=
     60  Add linux-next specific files for 20150401
> =

> The dmesg there is
> =

> [    1.149409] test_firmware: interface ready
> [    1.150293] Running resizable hashtable tests...
> [    1.151209]   Adding 2048 keys
> [    1.152069] ------------[ cut here ]------------
> [    1.152978] WARNING: CPU: 0 PID: 1 at lib/rhashtable.c:409 rhashtable_=
insert_rehash+0x9d/0x1d0()

I see.  This is actually a completely different problem.

---8<---
test_rhashtable: Remove bogus max_size setting

Now that resizing is completely automatic, we need to remove
the max_size setting or the test will fail.

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/lib/test_rhashtable.c b/lib/test_rhashtable.c
index a42a0d4..b295754 100644
--- a/lib/test_rhashtable.c
+++ b/lib/test_rhashtable.c
@@ -44,7 +44,6 @@ static const struct rhashtable_params test_rht_params =3D=
 {
 	.key_offset =3D offsetof(struct test_obj, value),
 	.key_len =3D sizeof(int),
 	.hashfn =3D jhash,
-	.max_size =3D 2, /* we expand/shrink manually here */
 	.nulls_base =3D (3U << RHT_BASE_SHIFT),
 };
 =

-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============3796573780811201716==--

