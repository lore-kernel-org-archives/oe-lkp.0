Content-Type: multipart/mixed; boundary="===============7961817408397758042=="
MIME-Version: 1.0
From: Aaron Tomlin <atomlin@redhat.com>
To: lkp@lists.01.org
Subject: [RFC PATCH v4 13/13] module: Move version support into a separate file
Date: Mon, 31 Jan 2022 12:45:42 +0000
Message-ID: <20220131124542.1389280-13-atomlin@redhat.com>
In-Reply-To: <20220131124542.1389280-1-atomlin@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7961817408397758042==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

No functional change.

This patch migrates module version support out of core code into
kernel/module/version.c. In addition simple code refactoring to
make this possible.

Signed-off-by: Aaron Tomlin <atomlin@redhat.com>
---
 kernel/module/Makefile   |   1 +
 kernel/module/internal.h |  51 +++++++++++++
 kernel/module/main.c     | 150 +--------------------------------------
 kernel/module/version.c  | 110 ++++++++++++++++++++++++++++
 4 files changed, 164 insertions(+), 148 deletions(-)
 create mode 100644 kernel/module/version.c

diff --git a/kernel/module/Makefile b/kernel/module/Makefile
index c8982b47b3a2..6269f4669e47 100644
--- a/kernel/module/Makefile
+++ b/kernel/module/Makefile
@@ -16,4 +16,5 @@ obj-$(CONFIG_DEBUG_KMEMLEAK) +=3D debug_kmemleak.o
 obj-$(CONFIG_KALLSYMS) +=3D kallsyms.o
 obj-$(CONFIG_PROC_FS) +=3D procfs.o
 obj-$(CONFIG_SYSFS) +=3D sysfs.o
+obj-$(CONFIG_MODVERSIONS) +=3D version.o
 endif
diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index cf3baca4ebea..405e18847730 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -59,7 +59,31 @@ struct load_info {
 	} index;
 };
 =

+struct symsearch {
+	const struct kernel_symbol *start, *stop;
+	const s32 *crcs;
+	enum mod_license {
+		NOT_GPL_ONLY,
+		GPL_ONLY,
+	} license;
+};
+
+struct find_symbol_arg {
+	/* Input */
+	const char *name;
+	bool gplok;
+	bool warn;
+
+	/* Output */
+	struct module *owner;
+	const s32 *crc;
+	const struct kernel_symbol *sym;
+	enum mod_license license;
+};
+
 extern int mod_verify_sig(const void *mod, struct load_info *info);
+extern int try_to_force_load(struct module *mod, const char *reason);
+extern bool find_symbol(struct find_symbol_arg *fsa);
 extern struct module *find_module_all(const char *name, size_t len, bool e=
ven_unformed);
 extern unsigned long kernel_symbol_value(const struct kernel_symbol *sym);
 extern int cmp_name(const void *name, const void *sym);
@@ -183,3 +207,30 @@ static inline void module_remove_modinfo_attrs(struct =
module *mod, int end) { }
 static inline void del_usage_links(struct module *mod) { }
 static inline void init_param_lock(struct module *mod) { }
 #endif /* CONFIG_SYSFS */
+
+#ifdef CONFIG_MODVERSIONS
+extern int check_version(const struct load_info *info,
+			 const char *symname, struct module *mod, const s32 *crc);
+extern int check_modstruct_version(const struct load_info *info, struct mo=
dule *mod);
+extern int same_magic(const char *amagic, const char *bmagic, bool has_crc=
s);
+#else /* !CONFIG_MODVERSIONS */
+static inline int check_version(const struct load_info *info,
+				const char *symname,
+				struct module *mod,
+				const s32 *crc)
+{
+	return 1;
+}
+
+static inline int check_modstruct_version(const struct load_info *info,
+					  struct module *mod)
+{
+	return 1;
+}
+
+static inline int same_magic(const char *amagic, const char *bmagic,
+			    bool has_crcs)
+{
+	return strcmp(amagic, bmagic) =3D=3D 0;
+}
+#endif /* CONFIG_MODVERSIONS */
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 59e1c271812c..6b13c17427d8 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -240,28 +240,6 @@ static __maybe_unused void *any_section_objs(const str=
uct load_info *info,
 #define symversion(base, idx) ((base !=3D NULL) ? ((base) + (idx)) : NULL)
 #endif
 =

-struct symsearch {
-	const struct kernel_symbol *start, *stop;
-	const s32 *crcs;
-	enum mod_license {
-		NOT_GPL_ONLY,
-		GPL_ONLY,
-	} license;
-};
-
-struct find_symbol_arg {
-	/* Input */
-	const char *name;
-	bool gplok;
-	bool warn;
-
-	/* Output */
-	struct module *owner;
-	const s32 *crc;
-	const struct kernel_symbol *sym;
-	enum mod_license license;
-};
-
 static bool check_exported_symbol(const struct symsearch *syms,
 				  struct module *owner,
 				  unsigned int symnum, void *data)
@@ -332,7 +310,7 @@ static bool find_exported_symbol_in_section(const struc=
t symsearch *syms,
  * Find an exported symbol and return it, along with, (optional) crc and
  * (optional) module which owns it.  Needs preempt disabled or module_mute=
x.
  */
-static bool find_symbol(struct find_symbol_arg *fsa)
+bool find_symbol(struct find_symbol_arg *fsa)
 {
 	static const struct symsearch arr[] =3D {
 		{ __start___ksymtab, __stop___ksymtab, __start___kcrctab,
@@ -1006,7 +984,7 @@ size_t modinfo_attrs_count =3D ARRAY_SIZE(modinfo_attr=
s);
 =

 static const char vermagic[] =3D VERMAGIC_STRING;
 =

-static int try_to_force_load(struct module *mod, const char *reason)
+int try_to_force_load(struct module *mod, const char *reason)
 {
 #ifdef CONFIG_MODULE_FORCE_LOAD
 	if (!test_taint(TAINT_FORCED_MODULE))
@@ -1018,115 +996,6 @@ static int try_to_force_load(struct module *mod, con=
st char *reason)
 #endif
 }
 =

-#ifdef CONFIG_MODVERSIONS
-
-static u32 resolve_rel_crc(const s32 *crc)
-{
-	return *(u32 *)((void *)crc + *crc);
-}
-
-static int check_version(const struct load_info *info,
-			 const char *symname,
-			 struct module *mod,
-			 const s32 *crc)
-{
-	Elf_Shdr *sechdrs =3D info->sechdrs;
-	unsigned int versindex =3D info->index.vers;
-	unsigned int i, num_versions;
-	struct modversion_info *versions;
-
-	/* Exporting module didn't supply crcs?  OK, we're already tainted. */
-	if (!crc)
-		return 1;
-
-	/* No versions at all?  modprobe --force does this. */
-	if (versindex =3D=3D 0)
-		return try_to_force_load(mod, symname) =3D=3D 0;
-
-	versions =3D (void *) sechdrs[versindex].sh_addr;
-	num_versions =3D sechdrs[versindex].sh_size
-		/ sizeof(struct modversion_info);
-
-	for (i =3D 0; i < num_versions; i++) {
-		u32 crcval;
-
-		if (strcmp(versions[i].name, symname) !=3D 0)
-			continue;
-
-		if (IS_ENABLED(CONFIG_MODULE_REL_CRCS))
-			crcval =3D resolve_rel_crc(crc);
-		else
-			crcval =3D *crc;
-		if (versions[i].crc =3D=3D crcval)
-			return 1;
-		pr_debug("Found checksum %X vs module %lX\n",
-			 crcval, versions[i].crc);
-		goto bad_version;
-	}
-
-	/* Broken toolchain. Warn once, then let it go.. */
-	pr_warn_once("%s: no symbol version for %s\n", info->name, symname);
-	return 1;
-
-bad_version:
-	pr_warn("%s: disagrees about version of symbol %s\n",
-	       info->name, symname);
-	return 0;
-}
-
-static inline int check_modstruct_version(const struct load_info *info,
-					  struct module *mod)
-{
-	struct find_symbol_arg fsa =3D {
-		.name	=3D "module_layout",
-		.gplok	=3D true,
-	};
-
-	/*
-	 * Since this should be found in kernel (which can't be removed), no
-	 * locking is necessary -- use preempt_disable() to placate lockdep.
-	 */
-	preempt_disable();
-	if (!find_symbol(&fsa)) {
-		preempt_enable();
-		BUG();
-	}
-	preempt_enable();
-	return check_version(info, "module_layout", mod, fsa.crc);
-}
-
-/* First part is kernel version, which we ignore if module has crcs. */
-static inline int same_magic(const char *amagic, const char *bmagic,
-			     bool has_crcs)
-{
-	if (has_crcs) {
-		amagic +=3D strcspn(amagic, " ");
-		bmagic +=3D strcspn(bmagic, " ");
-	}
-	return strcmp(amagic, bmagic) =3D=3D 0;
-}
-#else
-static inline int check_version(const struct load_info *info,
-				const char *symname,
-				struct module *mod,
-				const s32 *crc)
-{
-	return 1;
-}
-
-static inline int check_modstruct_version(const struct load_info *info,
-					  struct module *mod)
-{
-	return 1;
-}
-
-static inline int same_magic(const char *amagic, const char *bmagic,
-			     bool has_crcs)
-{
-	return strcmp(amagic, bmagic) =3D=3D 0;
-}
-#endif /* CONFIG_MODVERSIONS */
-
 static char *get_modinfo(const struct load_info *info, const char *tag);
 static char *get_next_modinfo(const struct load_info *info, const char *ta=
g,
 			      char *prev);
@@ -3238,18 +3107,3 @@ void print_modules(void)
 		pr_cont(" [last unloaded: %s]", last_unloaded_module);
 	pr_cont("\n");
 }
-
-#ifdef CONFIG_MODVERSIONS
-/*
- * Generate the signature for all relevant module structures here.
- * If these change, we don't want to try to parse the module.
- */
-void module_layout(struct module *mod,
-		   struct modversion_info *ver,
-		   struct kernel_param *kp,
-		   struct kernel_symbol *ks,
-		   struct tracepoint * const *tp)
-{
-}
-EXPORT_SYMBOL(module_layout);
-#endif
diff --git a/kernel/module/version.c b/kernel/module/version.c
new file mode 100644
index 000000000000..10a1490d1b9e
--- /dev/null
+++ b/kernel/module/version.c
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Module version support
+ *
+ * Copyright (C) 2008 Rusty Russell
+ */
+
+#include <linux/module.h>
+#include <linux/string.h>
+#include <linux/printk.h>
+#include "internal.h"
+
+static u32 resolve_rel_crc(const s32 *crc)
+{
+	return *(u32 *)((void *)crc + *crc);
+}
+
+int check_version(const struct load_info *info,
+			 const char *symname,
+			 struct module *mod,
+			 const s32 *crc)
+{
+	Elf_Shdr *sechdrs =3D info->sechdrs;
+	unsigned int versindex =3D info->index.vers;
+	unsigned int i, num_versions;
+	struct modversion_info *versions;
+
+	/* Exporting module didn't supply crcs?  OK, we're already tainted. */
+	if (!crc)
+		return 1;
+
+	/* No versions at all?  modprobe --force does this. */
+	if (versindex =3D=3D 0)
+		return try_to_force_load(mod, symname) =3D=3D 0;
+
+	versions =3D (void *) sechdrs[versindex].sh_addr;
+	num_versions =3D sechdrs[versindex].sh_size
+		/ sizeof(struct modversion_info);
+
+	for (i =3D 0; i < num_versions; i++) {
+		u32 crcval;
+
+		if (strcmp(versions[i].name, symname) !=3D 0)
+			continue;
+
+		if (IS_ENABLED(CONFIG_MODULE_REL_CRCS))
+			crcval =3D resolve_rel_crc(crc);
+		else
+			crcval =3D *crc;
+		if (versions[i].crc =3D=3D crcval)
+			return 1;
+		pr_debug("Found checksum %X vs module %lX\n",
+			 crcval, versions[i].crc);
+		goto bad_version;
+	}
+
+	/* Broken toolchain. Warn once, then let it go.. */
+	pr_warn_once("%s: no symbol version for %s\n", info->name, symname);
+	return 1;
+
+bad_version:
+	pr_warn("%s: disagrees about version of symbol %s\n",
+	       info->name, symname);
+	return 0;
+}
+
+inline int check_modstruct_version(const struct load_info *info,
+					  struct module *mod)
+{
+	struct find_symbol_arg fsa =3D {
+		.name	=3D "module_layout",
+		.gplok	=3D true,
+	};
+
+	/*
+	 * Since this should be found in kernel (which can't be removed), no
+	 * locking is necessary -- use preempt_disable() to placate lockdep.
+	 */
+	preempt_disable();
+	if (!find_symbol(&fsa)) {
+		preempt_enable();
+		BUG();
+	}
+	preempt_enable();
+	return check_version(info, "module_layout", mod, fsa.crc);
+}
+
+/* First part is kernel version, which we ignore if module has crcs. */
+inline int same_magic(const char *amagic, const char *bmagic,
+			     bool has_crcs)
+{
+	if (has_crcs) {
+		amagic +=3D strcspn(amagic, " ");
+		bmagic +=3D strcspn(bmagic, " ");
+	}
+	return strcmp(amagic, bmagic) =3D=3D 0;
+}
+
+/*
+ * Generate the signature for all relevant module structures here.
+ * If these change, we don't want to try to parse the module.
+ */
+void module_layout(struct module *mod,
+		   struct modversion_info *ver,
+		   struct kernel_param *kp,
+		   struct kernel_symbol *ks,
+		   struct tracepoint * const *tp)
+{
+}
+EXPORT_SYMBOL(module_layout);
-- =

2.34.1

--===============7961817408397758042==--

