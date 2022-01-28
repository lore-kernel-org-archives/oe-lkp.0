Content-Type: multipart/mixed; boundary="===============0262226670383170115=="
MIME-Version: 1.0
From: Aaron Tomlin <atomlin@redhat.com>
To: lkp@lists.01.org
Subject: [RFC PATCH v3 05/13] module: Move arch strict rwx support to a separate file
Date: Fri, 28 Jan 2022 12:50:38 +0000
Message-ID: <20220128125046.497173-6-atomlin@redhat.com>
In-Reply-To: <20220128125046.497173-1-atomlin@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0262226670383170115==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

No functional change.

This patch migrates applicable architecture code
that support strict module rwx from core module code
into kernel/module/arch_strict_rwx.c

Signed-off-by: Aaron Tomlin <atomlin@redhat.com>
---
 include/linux/module.h          | 17 +++++++++++
 kernel/module/Makefile          |  1 +
 kernel/module/arch_strict_rwx.c | 44 ++++++++++++++++++++++++++++
 kernel/module/main.c            | 51 ---------------------------------
 4 files changed, 62 insertions(+), 51 deletions(-)
 create mode 100644 kernel/module/arch_strict_rwx.c

diff --git a/include/linux/module.h b/include/linux/module.h
index 377bdb9952cf..35552164830d 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -339,6 +339,23 @@ struct module_layout {
 #endif
 };
 =

+/*
+ * Modules' sections will be aligned on page boundaries
+ * to ensure complete separation of code and data, but
+ * only when CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
+ */
+#ifdef CONFIG_ARCH_HAS_STRICT_MODULE_RWX
+# define debug_align(X) ALIGN(X, PAGE_SIZE)
+
+extern void frob_text(const struct module_layout *layout,
+		      int (*set_memory)(unsigned long start, int num_pages));
+extern void module_enable_x(const struct module *mod);
+#else /* !CONFIG_ARCH_HAS_STRICT_MODULE_RWX */
+# define debug_align(X) (X)
+
+static void module_enable_x(const struct module *mod) { }
+#endif /* CONFIG_ARCH_HAS_STRICT_MODULE_RWX */
+
 #ifdef CONFIG_MODULES_TREE_LOOKUP
 struct mod_tree_root {
 	struct latch_tree_root root;
diff --git a/kernel/module/Makefile b/kernel/module/Makefile
index 5990d2e4566d..71341f30c3f2 100644
--- a/kernel/module/Makefile
+++ b/kernel/module/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_MODULE_SIG) +=3D signing.o
 obj-$(CONFIG_MODULE_SIG_FORMAT) +=3D signature.o
 obj-$(CONFIG_LIVEPATCH) +=3D livepatch.o
 obj-$(CONFIG_MODULES_TREE_LOOKUP) +=3D tree_lookup.o
+obj-$(CONFIG_ARCH_HAS_STRICT_MODULE_RWX) +=3D arch_strict_rwx.o
diff --git a/kernel/module/arch_strict_rwx.c b/kernel/module/arch_strict_rw=
x.c
new file mode 100644
index 000000000000..9801cb4fef36
--- /dev/null
+++ b/kernel/module/arch_strict_rwx.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Module arch strict rwx
+ *
+ * Copyright (C) 2015 Rusty Russell
+ */
+
+#include <linux/module.h>
+#include <linux/set_memory.h>
+
+/*
+ * LKM RO/NX protection: protect module's text/ro-data
+ * from modification and any data from execution.
+ *
+ * General layout of module is:
+ *          [text] [read-only-data] [ro-after-init] [writable data]
+ * text_size -----^                ^               ^               ^
+ * ro_size ------------------------|               |               |
+ * ro_after_init_size -----------------------------|               |
+ * size -----------------------------------------------------------|
+ *
+ * These values are always page-aligned (as is base)
+ */
+
+/*
+ * Since some arches are moving towards PAGE_KERNEL module allocations ins=
tead
+ * of PAGE_KERNEL_EXEC, keep frob_text() and module_enable_x() outside of =
the
+ * CONFIG_STRICT_MODULE_RWX block below because they are needed regardless=
 of
+ * whether we are strict.
+ */
+void frob_text(const struct module_layout *layout,
+		      int (*set_memory)(unsigned long start, int num_pages))
+{
+	BUG_ON((unsigned long)layout->base & (PAGE_SIZE-1));
+	BUG_ON((unsigned long)layout->text_size & (PAGE_SIZE-1));
+	set_memory((unsigned long)layout->base,
+		   layout->text_size >> PAGE_SHIFT);
+}
+
+void module_enable_x(const struct module *mod)
+{
+	frob_text(&mod->core_layout, set_memory_x);
+	frob_text(&mod->init_layout, set_memory_x);
+}
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 5c7c3201b5b4..fbac043b07d7 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -13,7 +13,6 @@
 #include <linux/trace_events.h>
 #include <linux/init.h>
 #include <linux/kallsyms.h>
-#include <linux/buildid.h>
 #include <linux/file.h>
 #include <linux/fs.h>
 #include <linux/sysfs.h>
@@ -63,17 +62,6 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/module.h>
 =

-/*
- * Modules' sections will be aligned on page boundaries
- * to ensure complete separation of code and data, but
- * only when CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
- */
-#ifdef CONFIG_ARCH_HAS_STRICT_MODULE_RWX
-# define debug_align(X) ALIGN(X, PAGE_SIZE)
-#else
-# define debug_align(X) (X)
-#endif
-
 /*
  * Mutex protects:
  * 1) List of modules (also safely readable with preempt_disable),
@@ -1785,45 +1773,6 @@ static void mod_sysfs_teardown(struct module *mod)
 	mod_sysfs_fini(mod);
 }
 =

-/*
- * LKM RO/NX protection: protect module's text/ro-data
- * from modification and any data from execution.
- *
- * General layout of module is:
- *          [text] [read-only-data] [ro-after-init] [writable data]
- * text_size -----^                ^               ^               ^
- * ro_size ------------------------|               |               |
- * ro_after_init_size -----------------------------|               |
- * size -----------------------------------------------------------|
- *
- * These values are always page-aligned (as is base)
- */
-
-/*
- * Since some arches are moving towards PAGE_KERNEL module allocations ins=
tead
- * of PAGE_KERNEL_EXEC, keep frob_text() and module_enable_x() outside of =
the
- * CONFIG_STRICT_MODULE_RWX block below because they are needed regardless=
 of
- * whether we are strict.
- */
-#ifdef CONFIG_ARCH_HAS_STRICT_MODULE_RWX
-static void frob_text(const struct module_layout *layout,
-		      int (*set_memory)(unsigned long start, int num_pages))
-{
-	BUG_ON((unsigned long)layout->base & (PAGE_SIZE-1));
-	BUG_ON((unsigned long)layout->text_size & (PAGE_SIZE-1));
-	set_memory((unsigned long)layout->base,
-		   layout->text_size >> PAGE_SHIFT);
-}
-
-static void module_enable_x(const struct module *mod)
-{
-	frob_text(&mod->core_layout, set_memory_x);
-	frob_text(&mod->init_layout, set_memory_x);
-}
-#else /* !CONFIG_ARCH_HAS_STRICT_MODULE_RWX */
-static void module_enable_x(const struct module *mod) { }
-#endif /* CONFIG_ARCH_HAS_STRICT_MODULE_RWX */
-
 #ifdef CONFIG_STRICT_MODULE_RWX
 static void frob_rodata(const struct module_layout *layout,
 			int (*set_memory)(unsigned long start, int num_pages))
-- =

2.34.1

--===============0262226670383170115==--

