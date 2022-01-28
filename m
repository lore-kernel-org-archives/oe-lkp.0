Content-Type: multipart/mixed; boundary="===============8310620616983011247=="
MIME-Version: 1.0
From: Aaron Tomlin <atomlin@redhat.com>
To: lkp@lists.01.org
Subject: [RFC PATCH v3 08/13] module: Move kmemleak support to a separate file
Date: Fri, 28 Jan 2022 13:23:16 +0000
Message-ID: <20220128132321.529594-9-atomlin@redhat.com>
In-Reply-To: <20220128132321.529594-1-atomlin@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8310620616983011247==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

No functional change.

This patch migrates kmemleak code out of core module
code into kernel/module/debug_kmemleak.c

Signed-off-by: Aaron Tomlin <atomlin@redhat.com>
---
 kernel/module/Makefile         |  1 +
 kernel/module/debug_kmemleak.c | 30 ++++++++++++++++++++++++++++++
 kernel/module/internal.h       |  8 ++++++++
 kernel/module/main.c           | 27 ---------------------------
 4 files changed, 39 insertions(+), 27 deletions(-)
 create mode 100644 kernel/module/debug_kmemleak.c

diff --git a/kernel/module/Makefile b/kernel/module/Makefile
index c4198fcf4772..3901f0713f22 100644
--- a/kernel/module/Makefile
+++ b/kernel/module/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_LIVEPATCH) +=3D livepatch.o
 obj-$(CONFIG_MODULES_TREE_LOOKUP) +=3D tree_lookup.o
 obj-$(CONFIG_ARCH_HAS_STRICT_MODULE_RWX) +=3D arch_strict_rwx.o
 obj-$(CONFIG_STRICT_MODULE_RWX) +=3D strict_rwx.o
+obj-$(CONFIG_DEBUG_KMEMLEAK) +=3D debug_kmemleak.o
diff --git a/kernel/module/debug_kmemleak.c b/kernel/module/debug_kmemleak.c
new file mode 100644
index 000000000000..e896c2268011
--- /dev/null
+++ b/kernel/module/debug_kmemleak.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Module kmemleak support
+ *
+ * Copyright (C) 2009 Catalin Marinas
+ */
+
+#include <linux/module.h>
+#include <linux/kmemleak.h>
+#include "internal.h"
+
+void kmemleak_load_module(const struct module *mod,
+				 const struct load_info *info)
+{
+	unsigned int i;
+
+	/* only scan the sections containing data */
+	kmemleak_scan_area(mod, sizeof(struct module), GFP_KERNEL);
+
+	for (i =3D 1; i < info->hdr->e_shnum; i++) {
+		/* Scan all writable sections that's not executable */
+		if (!(info->sechdrs[i].sh_flags & SHF_ALLOC) ||
+		    !(info->sechdrs[i].sh_flags & SHF_WRITE) ||
+		    (info->sechdrs[i].sh_flags & SHF_EXECINSTR))
+			continue;
+
+		kmemleak_scan_area((void *)info->sechdrs[i].sh_addr,
+				   info->sechdrs[i].sh_size, GFP_KERNEL);
+	}
+}
diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index 5aab87716d9f..ef9513070b88 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -6,6 +6,7 @@
  */
 =

 #include <linux/elf.h>
+#include <linux/compiler.h>
 #include <asm/module.h>
 #include <linux/mutex.h>
 =

@@ -89,3 +90,10 @@ static int module_sig_check(struct load_info *info, int =
flags)
 	return 0;
 }
 #endif /* !CONFIG_MODULE_SIG */
+
+#ifdef CONFIG_DEBUG_KMEMLEAK
+extern void kmemleak_load_module(const struct module *mod, const struct lo=
ad_info *info);
+#else /* !CONFIG_DEBUG_KMEMLEAK */
+static inline void __maybe_unused kmemleak_load_module(const struct module=
 *mod,
+						       const struct load_info *info) { }
+#endif /* CONFIG_DEBUG_KMEMLEAK */
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 36ed4dd64cac..6fb1c885d9c2 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2466,33 +2466,6 @@ bool __weak module_exit_section(const char *name)
 	return strstarts(name, ".exit");
 }
 =

-#ifdef CONFIG_DEBUG_KMEMLEAK
-static void kmemleak_load_module(const struct module *mod,
-				 const struct load_info *info)
-{
-	unsigned int i;
-
-	/* only scan the sections containing data */
-	kmemleak_scan_area(mod, sizeof(struct module), GFP_KERNEL);
-
-	for (i =3D 1; i < info->hdr->e_shnum; i++) {
-		/* Scan all writable sections that's not executable */
-		if (!(info->sechdrs[i].sh_flags & SHF_ALLOC) ||
-		    !(info->sechdrs[i].sh_flags & SHF_WRITE) ||
-		    (info->sechdrs[i].sh_flags & SHF_EXECINSTR))
-			continue;
-
-		kmemleak_scan_area((void *)info->sechdrs[i].sh_addr,
-				   info->sechdrs[i].sh_size, GFP_KERNEL);
-	}
-}
-#else
-static inline void kmemleak_load_module(const struct module *mod,
-					const struct load_info *info)
-{
-}
-#endif
-
 static int validate_section_offset(struct load_info *info, Elf_Shdr *shdr)
 {
 #if defined(CONFIG_64BIT)
-- =

2.34.1

--===============8310620616983011247==--

