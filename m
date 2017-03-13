Content-Type: multipart/mixed; boundary="===============0951484679991907068=="
MIME-Version: 1.0
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
To: lkp@lists.01.org
Subject: [PATCH] x86/kasan: Fix boot with KASAN=y and PROFILE_ANNOTATED_BRANCHES=y
Date: Mon, 13 Mar 2017 19:33:37 +0300
Message-ID: <20170313163337.1704-1-aryabinin@virtuozzo.com>
In-Reply-To: <20170228031227.tm7flsxl7t7klspf@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0951484679991907068==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The kernel doesn't boot with both PROFILE_ANNOTATED_BRANCHES=3Dy and KASAN=
=3Dy
options selected. With branch profiling enabled we end up calling
ftrace_likely_update() before kasan_early_init(). ftrace_likely_update()
built with KASAN instrumentation, so calling it before kasan has been
initialized leads to crash.

Use DISABLE_BRANCH_PROFILING define to make sure that we don't call
ftrace_likely_update() from early code before kasan_early_init().

Fixes: ef7f0d6a6ca8 ("x86_64: add KASan support")
Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: <stable@vger.kernel.org>
---
 arch/x86/kernel/head64.c    | 1 +
 arch/x86/mm/kasan_init_64.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index 54a2372..b5785c1 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -4,6 +4,7 @@
  *  Copyright (C) 2000 Andrea Arcangeli <andrea@suse.de> SuSE
  */
 =

+#define DISABLE_BRANCH_PROFILING
 #include <linux/init.h>
 #include <linux/linkage.h>
 #include <linux/types.h>
diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
index 8d63d7a..4c90cfd 100644
--- a/arch/x86/mm/kasan_init_64.c
+++ b/arch/x86/mm/kasan_init_64.c
@@ -1,3 +1,4 @@
+#define DISABLE_BRANCH_PROFILING
 #define pr_fmt(fmt) "kasan: " fmt
 #include <linux/bootmem.h>
 #include <linux/kasan.h>
-- =

2.10.2


--===============0951484679991907068==--

