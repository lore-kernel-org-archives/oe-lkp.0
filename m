Content-Type: multipart/mixed; boundary="===============8928602396410102618=="
MIME-Version: 1.0
From: Aaron Tomlin <atomlin@redhat.com>
To: lkp@lists.01.org
Subject: [RFC PATCH v3 03/13] module: Move livepatch support to a separate file
Date: Fri, 28 Jan 2022 13:23:11 +0000
Message-ID: <20220128132321.529594-4-atomlin@redhat.com>
In-Reply-To: <20220128132321.529594-1-atomlin@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8928602396410102618==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

No functional change.

This patch migrates livepatch support (i.e. used during module
add/or load and remove/or deletion) from core module code into
kernel/module/livepatch.c. At the moment it contains code to
persist Elf information about a given livepatch module, only.

Signed-off-by: Aaron Tomlin <atomlin@redhat.com>
---
 include/linux/module.h    |  11 ++++
 kernel/module/Makefile    |   1 +
 kernel/module/internal.h  |  10 ++++
 kernel/module/livepatch.c |  74 +++++++++++++++++++++++++++
 kernel/module/main.c      | 102 ++++----------------------------------
 5 files changed, 106 insertions(+), 92 deletions(-)
 create mode 100644 kernel/module/livepatch.c

diff --git a/include/linux/module.h b/include/linux/module.h
index f4338235ed2c..8d49f12a7601 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -668,11 +668,22 @@ static inline bool is_livepatch_module(struct module =
*mod)
 {
 	return mod->klp;
 }
+
+static inline bool set_livepatch_module(struct module *mod)
+{
+	mod->klp =3D true;
+	return true;
+}
 #else /* !CONFIG_LIVEPATCH */
 static inline bool is_livepatch_module(struct module *mod)
 {
 	return false;
 }
+
+static inline bool set_livepatch_module(struct module *mod)
+{
+	return false;
+}
 #endif /* CONFIG_LIVEPATCH */
 =

 bool is_module_sig_enforced(void);
diff --git a/kernel/module/Makefile b/kernel/module/Makefile
index 2902fc7d0ef1..ba3ebdb7055b 100644
--- a/kernel/module/Makefile
+++ b/kernel/module/Makefile
@@ -7,3 +7,4 @@ obj-$(CONFIG_MODULES) +=3D main.o
 obj-$(CONFIG_MODULE_DECOMPRESS) +=3D decompress.o
 obj-$(CONFIG_MODULE_SIG) +=3D signing.o
 obj-$(CONFIG_MODULE_SIG_FORMAT) +=3D signature.o
+obj-$(CONFIG_LIVEPATCH) +=3D livepatch.o
diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index e3c593f8767f..0cd624179545 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -57,6 +57,16 @@ struct load_info {
 =

 extern int mod_verify_sig(const void *mod, struct load_info *info);
 =

+#ifdef CONFIG_LIVEPATCH
+extern int copy_module_elf(struct module *mod, struct load_info *info);
+extern void free_module_elf(struct module *mod);
+#else /* !CONFIG_LIVEPATCH */
+static inline int copy_module_elf(struct module *mod, struct load_info *in=
fo)
+{
+	return 0;
+}
+static inline void free_module_elf(struct module *mod) { }
+#endif /* CONFIG_LIVEPATCH */
 #ifdef CONFIG_MODULE_DECOMPRESS
 int module_decompress(struct load_info *info, const void *buf, size_t size=
);
 void module_decompress_cleanup(struct load_info *info);
diff --git a/kernel/module/livepatch.c b/kernel/module/livepatch.c
new file mode 100644
index 000000000000..961045d32332
--- /dev/null
+++ b/kernel/module/livepatch.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Module livepatch support
+ *
+ * Copyright (C) 2016 Jessica Yu <jeyu@redhat.com>
+ */
+
+#include <linux/module.h>
+#include <linux/string.h>
+#include <linux/slab.h>
+#include "internal.h"
+
+/*
+ * Persist Elf information about a module. Copy the Elf header,
+ * section header table, section string table, and symtab section
+ * index from info to mod->klp_info.
+ */
+int copy_module_elf(struct module *mod, struct load_info *info)
+{
+	unsigned int size, symndx;
+	int ret;
+
+	size =3D sizeof(*mod->klp_info);
+	mod->klp_info =3D kmalloc(size, GFP_KERNEL);
+	if (mod->klp_info =3D=3D NULL)
+		return -ENOMEM;
+
+	/* Elf header */
+	size =3D sizeof(mod->klp_info->hdr);
+	memcpy(&mod->klp_info->hdr, info->hdr, size);
+
+	/* Elf section header table */
+	size =3D sizeof(*info->sechdrs) * info->hdr->e_shnum;
+	mod->klp_info->sechdrs =3D kmemdup(info->sechdrs, size, GFP_KERNEL);
+	if (mod->klp_info->sechdrs =3D=3D NULL) {
+		ret =3D -ENOMEM;
+		goto free_info;
+	}
+
+	/* Elf section name string table */
+	size =3D info->sechdrs[info->hdr->e_shstrndx].sh_size;
+	mod->klp_info->secstrings =3D kmemdup(info->secstrings, size, GFP_KERNEL);
+	if (mod->klp_info->secstrings =3D=3D NULL) {
+		ret =3D -ENOMEM;
+		goto free_sechdrs;
+	}
+
+	/* Elf symbol section index */
+	symndx =3D info->index.sym;
+	mod->klp_info->symndx =3D symndx;
+
+	/*
+	 * For livepatch modules, core_kallsyms.symtab is a complete
+	 * copy of the original symbol table. Adjust sh_addr to point
+	 * to core_kallsyms.symtab since the copy of the symtab in module
+	 * init memory is freed at the end of do_init_module().
+	 */
+	mod->klp_info->sechdrs[symndx].sh_addr =3D (unsigned long) mod->core_kall=
syms.symtab;
+
+	return 0;
+
+free_sechdrs:
+	kfree(mod->klp_info->sechdrs);
+free_info:
+	kfree(mod->klp_info);
+	return ret;
+}
+
+void free_module_elf(struct module *mod)
+{
+	kfree(mod->klp_info->sechdrs);
+	kfree(mod->klp_info->secstrings);
+	kfree(mod->klp_info);
+}
diff --git a/kernel/module/main.c b/kernel/module/main.c
index fee64c4957f3..c91c7e57bca7 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2042,81 +2042,6 @@ static int module_enforce_rwx_sections(Elf_Ehdr *hdr=
, Elf_Shdr *sechdrs,
 }
 #endif /*  CONFIG_STRICT_MODULE_RWX */
 =

-#ifdef CONFIG_LIVEPATCH
-/*
- * Persist Elf information about a module. Copy the Elf header,
- * section header table, section string table, and symtab section
- * index from info to mod->klp_info.
- */
-static int copy_module_elf(struct module *mod, struct load_info *info)
-{
-	unsigned int size, symndx;
-	int ret;
-
-	size =3D sizeof(*mod->klp_info);
-	mod->klp_info =3D kmalloc(size, GFP_KERNEL);
-	if (mod->klp_info =3D=3D NULL)
-		return -ENOMEM;
-
-	/* Elf header */
-	size =3D sizeof(mod->klp_info->hdr);
-	memcpy(&mod->klp_info->hdr, info->hdr, size);
-
-	/* Elf section header table */
-	size =3D sizeof(*info->sechdrs) * info->hdr->e_shnum;
-	mod->klp_info->sechdrs =3D kmemdup(info->sechdrs, size, GFP_KERNEL);
-	if (mod->klp_info->sechdrs =3D=3D NULL) {
-		ret =3D -ENOMEM;
-		goto free_info;
-	}
-
-	/* Elf section name string table */
-	size =3D info->sechdrs[info->hdr->e_shstrndx].sh_size;
-	mod->klp_info->secstrings =3D kmemdup(info->secstrings, size, GFP_KERNEL);
-	if (mod->klp_info->secstrings =3D=3D NULL) {
-		ret =3D -ENOMEM;
-		goto free_sechdrs;
-	}
-
-	/* Elf symbol section index */
-	symndx =3D info->index.sym;
-	mod->klp_info->symndx =3D symndx;
-
-	/*
-	 * For livepatch modules, core_kallsyms.symtab is a complete
-	 * copy of the original symbol table. Adjust sh_addr to point
-	 * to core_kallsyms.symtab since the copy of the symtab in module
-	 * init memory is freed at the end of do_init_module().
-	 */
-	mod->klp_info->sechdrs[symndx].sh_addr =3D \
-		(unsigned long) mod->core_kallsyms.symtab;
-
-	return 0;
-
-free_sechdrs:
-	kfree(mod->klp_info->sechdrs);
-free_info:
-	kfree(mod->klp_info);
-	return ret;
-}
-
-static void free_module_elf(struct module *mod)
-{
-	kfree(mod->klp_info->sechdrs);
-	kfree(mod->klp_info->secstrings);
-	kfree(mod->klp_info);
-}
-#else /* !CONFIG_LIVEPATCH */
-static int copy_module_elf(struct module *mod, struct load_info *info)
-{
-	return 0;
-}
-
-static void free_module_elf(struct module *mod)
-{
-}
-#endif /* CONFIG_LIVEPATCH */
-
 void __weak module_memfree(void *module_region)
 {
 	/*
@@ -3091,30 +3016,23 @@ static int copy_chunked_from_user(void *dst, const =
void __user *usrc, unsigned l
 	return 0;
 }
 =

-#ifdef CONFIG_LIVEPATCH
 static int check_modinfo_livepatch(struct module *mod, struct load_info *i=
nfo)
 {
-	if (get_modinfo(info, "livepatch")) {
-		mod->klp =3D true;
+	if (!get_modinfo(info, "livepatch"))
+		/* Nothing more to do */
+		return 0;
+
+	if (set_livepatch_module(mod)) {
 		add_taint_module(mod, TAINT_LIVEPATCH, LOCKDEP_STILL_OK);
 		pr_notice_once("%s: tainting kernel with TAINT_LIVEPATCH\n",
-			       mod->name);
-	}
-
-	return 0;
-}
-#else /* !CONFIG_LIVEPATCH */
-static int check_modinfo_livepatch(struct module *mod, struct load_info *i=
nfo)
-{
-	if (get_modinfo(info, "livepatch")) {
-		pr_err("%s: module is marked as livepatch module, but livepatch support =
is disabled",
-		       mod->name);
-		return -ENOEXEC;
+				mod->name);
+		return 0;
 	}
 =

-	return 0;
+	pr_err("%s: module is marked as livepatch module, but livepatch support i=
s disabled",
+		mod->name);
+	return -ENOEXEC;
 }
-#endif /* CONFIG_LIVEPATCH */
 =

 static void check_modinfo_retpoline(struct module *mod, struct load_info *=
info)
 {
-- =

2.34.1

--===============8928602396410102618==--

