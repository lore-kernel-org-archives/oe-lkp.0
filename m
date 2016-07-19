Content-Type: multipart/mixed; boundary="===============7108522912897598773=="
MIME-Version: 1.0
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: lkp@lists.01.org
Subject: Re: [x86] eb008eb6f8: kmsg.glue_helper:Unknown_symbol_blkcipher_walk_done(err#)
Date: Tue, 19 Jul 2016 10:42:43 -0400
Message-ID: <20160719144243.GK21225@windriver.com>
In-Reply-To: <20160719022349.GA28601@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7108522912897598773==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[[lkp] [x86]  eb008eb6f8: kmsg.glue_helper:Unknown_symbol_blkcipher_walk_do=
ne(err#)] On 19/07/2016 (Tue 10:23) kernel test robot wrote:

> =

> FYI, we noticed the following commit:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit eb008eb6f8b689853d6e9f4ae3ff56ea734e4319 ("x86: Audit and remove a=
ny remaining unnecessary uses of module.h")
> =

> in testcase: rcutorture
> with following parameters: runtime=3D300s
> =

> on test machine: 4 threads Ivy Bridge with 4G memory
> =

> caused below changes:
> =

> =

> [   12.682466] glue_helper: Unknown symbol blkcipher_walk_done (err 0)
> [   12.682907] glue_helper: Unknown symbol blkcipher_walk_virt (err 0)
> [   12.683364] glue_helper: Unknown symbol kernel_fpu_end (err 0)
> [   12.683773] glue_helper: Unknown symbol kernel_fpu_begin (err 0)
> [   12.684195] glue_helper: Unknown symbol blkcipher_walk_virt_block (err=
 0)
> [   12.701397] glue_helper: Unknown symbol blkcipher_walk_done (err 0)

Thanks for the report -- with it the fix is obvious so I've build tested
it but not gone through replicating and setting up all of lkp.

I inadvertently removed a MODULE_LICENSE tag that was active, hence the
module would fail to load, causing the above.  Further details are in
the commit log of the proposed fix for tip/x86/headers below.

Paul.

------------------------8<-----------------------------

 From 7c8033f0c34c55d6fbb9b8628d4e9da3ad2e3c76 Mon Sep 17 00:00:00 2001
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Date: Tue, 19 Jul 2016 10:06:30 -0400
Subject: [PATCH] x86: crypto: restore MODULE_LICENSE to glue_helper so it
 loads

In commit eb008eb6f8b6 ("x86: Audit and remove any remaining
unnecessary uses of module.h") we looked for instances of module.h
that were not supporting anything more than exported symbols.

To facilitate the exchange of module.h to the much smaller export.h
we occasionally remove tags like MODULE_AUTHOR etc. which in the case
of built in files, are no-ops and hence that is fine, assuming the
info is already in the comments at the top of the file..

However the error here is that I overlooked that this file was used
not as a driver, but as a library of functions, and hence has no
explicit modular linkage functions or similar, making it _appear_
non-modular.  We can see that in retrospect with:

  arch/x86/crypto/Makefile:obj-$(CONFIG_CRYPTO_GLUE_HELPER_X86) +=3D glue_h=
elper.o

  crypto/Kconfig:config CRYPTO_GLUE_HELPER_X86
  crypto/Kconfig: tristate

Since we removed what was an active MODULE_LICENSE, the module failed
to load and then automated testing showed the missing glue helpers as:

  glue_helper: Unknown symbol blkcipher_walk_done (err 0)
  glue_helper: Unknown symbol blkcipher_walk_virt (err 0)
  glue_helper: Unknown symbol kernel_fpu_end (err 0)
  glue_helper: Unknown symbol kernel_fpu_begin (err 0)
  glue_helper: Unknown symbol blkcipher_walk_virt_block (err 0)

So we do a partial revert of that change to just this one file, and
watch for similar MODULE_LICENSE only cases in future audits.

Fixes: eb008eb6f8b6 ("x86: Audit and remove any remaining unnecessary uses =
of module.h")
Reported-by: kernel test robot <xiaolong.ye@intel.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 arch/x86/crypto/glue_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/crypto/glue_helper.c b/arch/x86/crypto/glue_helper.c
index 3cc4cad4c363..6a85598931b5 100644
--- a/arch/x86/crypto/glue_helper.c
+++ b/arch/x86/crypto/glue_helper.c
@@ -25,7 +25,7 @@
  *
  */
 =

-#include <linux/export.h>
+#include <linux/module.h>
 #include <crypto/b128ops.h>
 #include <crypto/lrw.h>
 #include <crypto/xts.h>
@@ -397,3 +397,5 @@ void glue_xts_crypt_128bit_one(void *ctx, u128 *dst, co=
nst u128 *src, le128 *iv,
 	u128_xor(dst, dst, (u128 *)&ivblk);
 }
 EXPORT_SYMBOL_GPL(glue_xts_crypt_128bit_one);
+
+MODULE_LICENSE("GPL");
-- =

2.8.4


--===============7108522912897598773==--

