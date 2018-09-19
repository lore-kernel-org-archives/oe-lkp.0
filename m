Content-Type: multipart/mixed; boundary="===============0011847936843778318=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] 048a5ca579 [ 57.925504] BUG: unable to handle kernel paging request at ffffa22f56e1f000
Date: Wed, 19 Sep 2018 16:51:40 +0800
Message-ID: <20180919085140.7own3tb7us7fcdpd@shbuild888>
In-Reply-To: <20180918054955.GM7632@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0011847936843778318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi lkp team,

please help to verify this fix patch, I locally can not reproduce
the problem with your test script. thanks,

- Feng
---
>From f5a4f8b2fb647f33624c50302399e8942e2dd068 Mon Sep 17 00:00:00 2001
From: Feng Tang <feng.tang@intel.com>
Date: Wed, 19 Sep 2018 16:49:07 +0800
Subject: [PATCH] x86/mm: handle fixmap

Signed-off-by: Feng Tang <feng.tang@intel.com>
---
 arch/x86/kernel/head64.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index 8047379e575a..94b9d3b705ba 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -35,6 +35,7 @@
 #include <asm/bootparam_utils.h>
 #include <asm/microcode.h>
 #include <asm/kasan.h>
+#include <asm/fixmap.h>
 =

 /*
  * Manage page tables very early on.
@@ -165,7 +166,12 @@ unsigned long __head __startup_64(unsigned long physad=
dr,
 	pud[511] +=3D load_delta;
 =

 	pmd =3D fixup_pointer(level2_fixmap_pgt, physaddr);
-	pmd[506] +=3D load_delta;
+	/*
+	 * Static fixmap table has FIXMAP_PMD_NUM entries,
+	 * starting downwards from 507
+	 */
+	for (i =3D 507; i > 507 - FIXMAP_PMD_NUM; i--)
+		pmd[i] +=3D load_delta;
 =

 	/*
 	 * Set up the identity mapping for the switchover.  These
-- =

2.14.1

On Tue, Sep 18, 2018 at 01:49:55PM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://github.com/0day-ci/linux/commits/Feng-Tang/x86-mm-Expand-static-p=
age-table-for-fixmap-space/20180917-174030

--===============0011847936843778318==--

