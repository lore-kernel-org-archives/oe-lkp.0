Content-Type: multipart/mixed; boundary="===============0405730380279088098=="
MIME-Version: 1.0
From: Aaron Tomlin <atomlin@redhat.com>
To: lkp@lists.01.org
Subject: [RFC PATCH v4 10/13] module: Move procfs support into a separate file
Date: Mon, 31 Jan 2022 12:45:39 +0000
Message-ID: <20220131124542.1389280-10-atomlin@redhat.com>
In-Reply-To: <20220131124542.1389280-1-atomlin@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0405730380279088098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

No functional change.

This patch migrates code that allows one to generate a
list of loaded/or linked modules via /proc when procfs
support is enabled into kernel/module/procfs.c.

Signed-off-by: Aaron Tomlin <atomlin@redhat.com>
---
 kernel/module/Makefile   |   1 +
 kernel/module/internal.h |   1 +
 kernel/module/main.c     | 131 +-----------------------------------
 kernel/module/procfs.c   | 142 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 145 insertions(+), 130 deletions(-)
 create mode 100644 kernel/module/procfs.c

diff --git a/kernel/module/Makefile b/kernel/module/Makefile
index 906f83e1931b..812f11ad090e 100644
--- a/kernel/module/Makefile
+++ b/kernel/module/Makefile
@@ -14,4 +14,5 @@ obj-$(CONFIG_ARCH_HAS_STRICT_MODULE_RWX) +=3D arch_strict=
_rwx.o
 obj-$(CONFIG_STRICT_MODULE_RWX) +=3D strict_rwx.o
 obj-$(CONFIG_DEBUG_KMEMLEAK) +=3D debug_kmemleak.o
 obj-$(CONFIG_KALLSYMS) +=3D kallsyms.o
+obj-$(CONFIG_PROC_FS) +=3D procfs.o
 endif
diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index 866fce7c1a33..09484a9382bc 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -62,6 +62,7 @@ extern unsigned long kernel_symbol_value(const struct ker=
nel_symbol *sym);
 extern int cmp_name(const void *name, const void *sym);
 extern long get_offset(struct module *mod, unsigned int *size, Elf_Shdr *s=
echdr,
 		       unsigned int section);
+extern char *module_flags(struct module *mod, char *buf);
 =

 #ifdef CONFIG_LIVEPATCH
 extern int copy_module_elf(struct module *mod, struct load_info *info);
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 363a54298f7e..1c20393ab76d 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -21,7 +21,6 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 #include <linux/elf.h>
-#include <linux/proc_fs.h>
 #include <linux/seq_file.h>
 #include <linux/syscalls.h>
 #include <linux/fcntl.h>
@@ -810,31 +809,6 @@ SYSCALL_DEFINE2(delete_module, const char __user *, na=
me_user,
 	return ret;
 }
 =

-static inline void print_unload_info(struct seq_file *m, struct module *mo=
d)
-{
-	struct module_use *use;
-	int printed_something =3D 0;
-
-	seq_printf(m, " %i ", module_refcount(mod));
-
-	/*
-	 * Always include a trailing , so userspace can differentiate
-	 * between this and the old multi-field proc format.
-	 */
-	list_for_each_entry(use, &mod->source_list, source_list) {
-		printed_something =3D 1;
-		seq_printf(m, "%s,", use->source->name);
-	}
-
-	if (mod->init !=3D NULL && mod->exit =3D=3D NULL) {
-		printed_something =3D 1;
-		seq_puts(m, "[permanent],");
-	}
-
-	if (!printed_something)
-		seq_puts(m, "-");
-}
-
 void __symbol_put(const char *symbol)
 {
 	struct find_symbol_arg fsa =3D {
@@ -924,12 +898,6 @@ void module_put(struct module *module)
 EXPORT_SYMBOL(module_put);
 =

 #else /* !CONFIG_MODULE_UNLOAD */
-static inline void print_unload_info(struct seq_file *m, struct module *mo=
d)
-{
-	/* We don't know the usage count, or what modules are using. */
-	seq_puts(m, " - -");
-}
-
 static inline void module_unload_free(struct module *mod)
 {
 }
@@ -3576,7 +3544,7 @@ static void cfi_cleanup(struct module *mod)
 }
 =

 /* Keep in sync with MODULE_FLAGS_BUF_SIZE !!! */
-static char *module_flags(struct module *mod, char *buf)
+char *module_flags(struct module *mod, char *buf)
 {
 	int bx =3D 0;
 =

@@ -3599,103 +3567,6 @@ static char *module_flags(struct module *mod, char =
*buf)
 	return buf;
 }
 =

-#ifdef CONFIG_PROC_FS
-/* Called by the /proc file system to return a list of modules. */
-static void *m_start(struct seq_file *m, loff_t *pos)
-{
-	mutex_lock(&module_mutex);
-	return seq_list_start(&modules, *pos);
-}
-
-static void *m_next(struct seq_file *m, void *p, loff_t *pos)
-{
-	return seq_list_next(p, &modules, pos);
-}
-
-static void m_stop(struct seq_file *m, void *p)
-{
-	mutex_unlock(&module_mutex);
-}
-
-static int m_show(struct seq_file *m, void *p)
-{
-	struct module *mod =3D list_entry(p, struct module, list);
-	char buf[MODULE_FLAGS_BUF_SIZE];
-	void *value;
-
-	/* We always ignore unformed modules. */
-	if (mod->state =3D=3D MODULE_STATE_UNFORMED)
-		return 0;
-
-	seq_printf(m, "%s %u",
-		   mod->name, mod->init_layout.size + mod->core_layout.size);
-	print_unload_info(m, mod);
-
-	/* Informative for users. */
-	seq_printf(m, " %s",
-		   mod->state =3D=3D MODULE_STATE_GOING ? "Unloading" :
-		   mod->state =3D=3D MODULE_STATE_COMING ? "Loading" :
-		   "Live");
-	/* Used by oprofile and other similar tools. */
-	value =3D m->private ? NULL : mod->core_layout.base;
-	seq_printf(m, " 0x%px", value);
-
-	/* Taints info */
-	if (mod->taints)
-		seq_printf(m, " %s", module_flags(mod, buf));
-
-	seq_puts(m, "\n");
-	return 0;
-}
-
-/*
- * Format: modulename size refcount deps address
- *
- * Where refcount is a number or -, and deps is a comma-separated list
- * of depends or -.
- */
-static const struct seq_operations modules_op =3D {
-	.start	=3D m_start,
-	.next	=3D m_next,
-	.stop	=3D m_stop,
-	.show	=3D m_show
-};
-
-/*
- * This also sets the "private" pointer to non-NULL if the
- * kernel pointers should be hidden (so you can just test
- * "m->private" to see if you should keep the values private).
- *
- * We use the same logic as for /proc/kallsyms.
- */
-static int modules_open(struct inode *inode, struct file *file)
-{
-	int err =3D seq_open(file, &modules_op);
-
-	if (!err) {
-		struct seq_file *m =3D file->private_data;
-		m->private =3D kallsyms_show_value(file->f_cred) ? NULL : (void *)8ul;
-	}
-
-	return err;
-}
-
-static const struct proc_ops modules_proc_ops =3D {
-	.proc_flags	=3D PROC_ENTRY_PERMANENT,
-	.proc_open	=3D modules_open,
-	.proc_read	=3D seq_read,
-	.proc_lseek	=3D seq_lseek,
-	.proc_release	=3D seq_release,
-};
-
-static int __init proc_modules_init(void)
-{
-	proc_create("modules", 0, NULL, &modules_proc_ops);
-	return 0;
-}
-module_init(proc_modules_init);
-#endif
-
 /* Given an address, look for it in the module exception tables. */
 const struct exception_table_entry *search_module_extables(unsigned long a=
ddr)
 {
diff --git a/kernel/module/procfs.c b/kernel/module/procfs.c
new file mode 100644
index 000000000000..d706a798b52e
--- /dev/null
+++ b/kernel/module/procfs.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Module proc support
+ *
+ * Copyright (C) 2008 Alexey Dobriyan
+ */
+
+#include <linux/module.h>
+#include <linux/kallsyms.h>
+#include <linux/mutex.h>
+#include <linux/seq_file.h>
+#include <linux/proc_fs.h>
+#include "internal.h"
+
+#ifdef CONFIG_MODULE_UNLOAD
+static inline void print_unload_info(struct seq_file *m, struct module *mo=
d)
+{
+	struct module_use *use;
+	int printed_something =3D 0;
+
+	seq_printf(m, " %i ", module_refcount(mod));
+
+	/*
+	 * Always include a trailing , so userspace can differentiate
+	 * between this and the old multi-field proc format.
+	 */
+	list_for_each_entry(use, &mod->source_list, source_list) {
+		printed_something =3D 1;
+		seq_printf(m, "%s,", use->source->name);
+	}
+
+	if (mod->init !=3D NULL && mod->exit =3D=3D NULL) {
+		printed_something =3D 1;
+		seq_puts(m, "[permanent],");
+	}
+
+	if (!printed_something)
+		seq_puts(m, "-");
+}
+#else /* !CONFIG_MODULE_UNLOAD */
+static inline void print_unload_info(struct seq_file *m, struct module *mo=
d)
+{
+	/* We don't know the usage count, or what modules are using. */
+	seq_puts(m, " - -");
+}
+#endif /* CONFIG_MODULE_UNLOAD */
+
+/* Called by the /proc file system to return a list of modules. */
+static void *m_start(struct seq_file *m, loff_t *pos)
+{
+	mutex_lock(&module_mutex);
+	return seq_list_start(&modules, *pos);
+}
+
+static void *m_next(struct seq_file *m, void *p, loff_t *pos)
+{
+	return seq_list_next(p, &modules, pos);
+}
+
+static void m_stop(struct seq_file *m, void *p)
+{
+	mutex_unlock(&module_mutex);
+}
+
+static int m_show(struct seq_file *m, void *p)
+{
+	struct module *mod =3D list_entry(p, struct module, list);
+	char buf[MODULE_FLAGS_BUF_SIZE];
+	void *value;
+
+	/* We always ignore unformed modules. */
+	if (mod->state =3D=3D MODULE_STATE_UNFORMED)
+		return 0;
+
+	seq_printf(m, "%s %u",
+		   mod->name, mod->init_layout.size + mod->core_layout.size);
+	print_unload_info(m, mod);
+
+	/* Informative for users. */
+	seq_printf(m, " %s",
+		   mod->state =3D=3D MODULE_STATE_GOING ? "Unloading" :
+		   mod->state =3D=3D MODULE_STATE_COMING ? "Loading" :
+		   "Live");
+	/* Used by oprofile and other similar tools. */
+	value =3D m->private ? NULL : mod->core_layout.base;
+	seq_printf(m, " 0x%px", value);
+
+	/* Taints info */
+	if (mod->taints)
+		seq_printf(m, " %s", module_flags(mod, buf));
+
+	seq_puts(m, "\n");
+	return 0;
+}
+
+/*
+ * Format: modulename size refcount deps address
+ *
+ * Where refcount is a number or -, and deps is a comma-separated list
+ * of depends or -.
+ */
+static const struct seq_operations modules_op =3D {
+	.start	=3D m_start,
+	.next	=3D m_next,
+	.stop	=3D m_stop,
+	.show	=3D m_show
+};
+
+/*
+ * This also sets the "private" pointer to non-NULL if the
+ * kernel pointers should be hidden (so you can just test
+ * "m->private" to see if you should keep the values private).
+ *
+ * We use the same logic as for /proc/kallsyms.
+ */
+static int modules_open(struct inode *inode, struct file *file)
+{
+	int err =3D seq_open(file, &modules_op);
+
+	if (!err) {
+		struct seq_file *m =3D file->private_data;
+
+		m->private =3D kallsyms_show_value(file->f_cred) ? NULL : (void *)8ul;
+	}
+
+	return err;
+}
+
+static const struct proc_ops modules_proc_ops =3D {
+	.proc_flags	=3D PROC_ENTRY_PERMANENT,
+	.proc_open	=3D modules_open,
+	.proc_read	=3D seq_read,
+	.proc_lseek	=3D seq_lseek,
+	.proc_release	=3D seq_release,
+};
+
+static int __init proc_modules_init(void)
+{
+	proc_create("modules", 0, NULL, &modules_proc_ops);
+	return 0;
+}
+module_init(proc_modules_init);
-- =

2.34.1

--===============0405730380279088098==--

